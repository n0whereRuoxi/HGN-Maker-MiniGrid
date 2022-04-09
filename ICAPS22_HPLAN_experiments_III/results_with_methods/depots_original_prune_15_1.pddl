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
      ?auto_1702120 - SURFACE
      ?auto_1702121 - SURFACE
    )
    :vars
    (
      ?auto_1702122 - HOIST
      ?auto_1702123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702122 ?auto_1702123 ) ( SURFACE-AT ?auto_1702120 ?auto_1702123 ) ( CLEAR ?auto_1702120 ) ( LIFTING ?auto_1702122 ?auto_1702121 ) ( IS-CRATE ?auto_1702121 ) ( not ( = ?auto_1702120 ?auto_1702121 ) ) )
    :subtasks
    ( ( !DROP ?auto_1702122 ?auto_1702121 ?auto_1702120 ?auto_1702123 )
      ( MAKE-1CRATE-VERIFY ?auto_1702120 ?auto_1702121 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702124 - SURFACE
      ?auto_1702125 - SURFACE
    )
    :vars
    (
      ?auto_1702127 - HOIST
      ?auto_1702126 - PLACE
      ?auto_1702128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702127 ?auto_1702126 ) ( SURFACE-AT ?auto_1702124 ?auto_1702126 ) ( CLEAR ?auto_1702124 ) ( IS-CRATE ?auto_1702125 ) ( not ( = ?auto_1702124 ?auto_1702125 ) ) ( TRUCK-AT ?auto_1702128 ?auto_1702126 ) ( AVAILABLE ?auto_1702127 ) ( IN ?auto_1702125 ?auto_1702128 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1702127 ?auto_1702125 ?auto_1702128 ?auto_1702126 )
      ( MAKE-1CRATE ?auto_1702124 ?auto_1702125 )
      ( MAKE-1CRATE-VERIFY ?auto_1702124 ?auto_1702125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702129 - SURFACE
      ?auto_1702130 - SURFACE
    )
    :vars
    (
      ?auto_1702132 - HOIST
      ?auto_1702133 - PLACE
      ?auto_1702131 - TRUCK
      ?auto_1702134 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702132 ?auto_1702133 ) ( SURFACE-AT ?auto_1702129 ?auto_1702133 ) ( CLEAR ?auto_1702129 ) ( IS-CRATE ?auto_1702130 ) ( not ( = ?auto_1702129 ?auto_1702130 ) ) ( AVAILABLE ?auto_1702132 ) ( IN ?auto_1702130 ?auto_1702131 ) ( TRUCK-AT ?auto_1702131 ?auto_1702134 ) ( not ( = ?auto_1702134 ?auto_1702133 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1702131 ?auto_1702134 ?auto_1702133 )
      ( MAKE-1CRATE ?auto_1702129 ?auto_1702130 )
      ( MAKE-1CRATE-VERIFY ?auto_1702129 ?auto_1702130 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702135 - SURFACE
      ?auto_1702136 - SURFACE
    )
    :vars
    (
      ?auto_1702138 - HOIST
      ?auto_1702140 - PLACE
      ?auto_1702139 - TRUCK
      ?auto_1702137 - PLACE
      ?auto_1702141 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702138 ?auto_1702140 ) ( SURFACE-AT ?auto_1702135 ?auto_1702140 ) ( CLEAR ?auto_1702135 ) ( IS-CRATE ?auto_1702136 ) ( not ( = ?auto_1702135 ?auto_1702136 ) ) ( AVAILABLE ?auto_1702138 ) ( TRUCK-AT ?auto_1702139 ?auto_1702137 ) ( not ( = ?auto_1702137 ?auto_1702140 ) ) ( HOIST-AT ?auto_1702141 ?auto_1702137 ) ( LIFTING ?auto_1702141 ?auto_1702136 ) ( not ( = ?auto_1702138 ?auto_1702141 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1702141 ?auto_1702136 ?auto_1702139 ?auto_1702137 )
      ( MAKE-1CRATE ?auto_1702135 ?auto_1702136 )
      ( MAKE-1CRATE-VERIFY ?auto_1702135 ?auto_1702136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702142 - SURFACE
      ?auto_1702143 - SURFACE
    )
    :vars
    (
      ?auto_1702147 - HOIST
      ?auto_1702146 - PLACE
      ?auto_1702144 - TRUCK
      ?auto_1702145 - PLACE
      ?auto_1702148 - HOIST
      ?auto_1702149 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702147 ?auto_1702146 ) ( SURFACE-AT ?auto_1702142 ?auto_1702146 ) ( CLEAR ?auto_1702142 ) ( IS-CRATE ?auto_1702143 ) ( not ( = ?auto_1702142 ?auto_1702143 ) ) ( AVAILABLE ?auto_1702147 ) ( TRUCK-AT ?auto_1702144 ?auto_1702145 ) ( not ( = ?auto_1702145 ?auto_1702146 ) ) ( HOIST-AT ?auto_1702148 ?auto_1702145 ) ( not ( = ?auto_1702147 ?auto_1702148 ) ) ( AVAILABLE ?auto_1702148 ) ( SURFACE-AT ?auto_1702143 ?auto_1702145 ) ( ON ?auto_1702143 ?auto_1702149 ) ( CLEAR ?auto_1702143 ) ( not ( = ?auto_1702142 ?auto_1702149 ) ) ( not ( = ?auto_1702143 ?auto_1702149 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1702148 ?auto_1702143 ?auto_1702149 ?auto_1702145 )
      ( MAKE-1CRATE ?auto_1702142 ?auto_1702143 )
      ( MAKE-1CRATE-VERIFY ?auto_1702142 ?auto_1702143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702150 - SURFACE
      ?auto_1702151 - SURFACE
    )
    :vars
    (
      ?auto_1702153 - HOIST
      ?auto_1702155 - PLACE
      ?auto_1702152 - PLACE
      ?auto_1702157 - HOIST
      ?auto_1702154 - SURFACE
      ?auto_1702156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702153 ?auto_1702155 ) ( SURFACE-AT ?auto_1702150 ?auto_1702155 ) ( CLEAR ?auto_1702150 ) ( IS-CRATE ?auto_1702151 ) ( not ( = ?auto_1702150 ?auto_1702151 ) ) ( AVAILABLE ?auto_1702153 ) ( not ( = ?auto_1702152 ?auto_1702155 ) ) ( HOIST-AT ?auto_1702157 ?auto_1702152 ) ( not ( = ?auto_1702153 ?auto_1702157 ) ) ( AVAILABLE ?auto_1702157 ) ( SURFACE-AT ?auto_1702151 ?auto_1702152 ) ( ON ?auto_1702151 ?auto_1702154 ) ( CLEAR ?auto_1702151 ) ( not ( = ?auto_1702150 ?auto_1702154 ) ) ( not ( = ?auto_1702151 ?auto_1702154 ) ) ( TRUCK-AT ?auto_1702156 ?auto_1702155 ) )
    :subtasks
    ( ( !DRIVE ?auto_1702156 ?auto_1702155 ?auto_1702152 )
      ( MAKE-1CRATE ?auto_1702150 ?auto_1702151 )
      ( MAKE-1CRATE-VERIFY ?auto_1702150 ?auto_1702151 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702167 - SURFACE
      ?auto_1702168 - SURFACE
      ?auto_1702169 - SURFACE
    )
    :vars
    (
      ?auto_1702170 - HOIST
      ?auto_1702171 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702170 ?auto_1702171 ) ( SURFACE-AT ?auto_1702168 ?auto_1702171 ) ( CLEAR ?auto_1702168 ) ( LIFTING ?auto_1702170 ?auto_1702169 ) ( IS-CRATE ?auto_1702169 ) ( not ( = ?auto_1702168 ?auto_1702169 ) ) ( ON ?auto_1702168 ?auto_1702167 ) ( not ( = ?auto_1702167 ?auto_1702168 ) ) ( not ( = ?auto_1702167 ?auto_1702169 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702168 ?auto_1702169 )
      ( MAKE-2CRATE-VERIFY ?auto_1702167 ?auto_1702168 ?auto_1702169 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702177 - SURFACE
      ?auto_1702178 - SURFACE
      ?auto_1702179 - SURFACE
    )
    :vars
    (
      ?auto_1702180 - HOIST
      ?auto_1702181 - PLACE
      ?auto_1702182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702180 ?auto_1702181 ) ( SURFACE-AT ?auto_1702178 ?auto_1702181 ) ( CLEAR ?auto_1702178 ) ( IS-CRATE ?auto_1702179 ) ( not ( = ?auto_1702178 ?auto_1702179 ) ) ( TRUCK-AT ?auto_1702182 ?auto_1702181 ) ( AVAILABLE ?auto_1702180 ) ( IN ?auto_1702179 ?auto_1702182 ) ( ON ?auto_1702178 ?auto_1702177 ) ( not ( = ?auto_1702177 ?auto_1702178 ) ) ( not ( = ?auto_1702177 ?auto_1702179 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702178 ?auto_1702179 )
      ( MAKE-2CRATE-VERIFY ?auto_1702177 ?auto_1702178 ?auto_1702179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702183 - SURFACE
      ?auto_1702184 - SURFACE
    )
    :vars
    (
      ?auto_1702186 - HOIST
      ?auto_1702188 - PLACE
      ?auto_1702185 - TRUCK
      ?auto_1702187 - SURFACE
      ?auto_1702189 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702186 ?auto_1702188 ) ( SURFACE-AT ?auto_1702183 ?auto_1702188 ) ( CLEAR ?auto_1702183 ) ( IS-CRATE ?auto_1702184 ) ( not ( = ?auto_1702183 ?auto_1702184 ) ) ( AVAILABLE ?auto_1702186 ) ( IN ?auto_1702184 ?auto_1702185 ) ( ON ?auto_1702183 ?auto_1702187 ) ( not ( = ?auto_1702187 ?auto_1702183 ) ) ( not ( = ?auto_1702187 ?auto_1702184 ) ) ( TRUCK-AT ?auto_1702185 ?auto_1702189 ) ( not ( = ?auto_1702189 ?auto_1702188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1702185 ?auto_1702189 ?auto_1702188 )
      ( MAKE-2CRATE ?auto_1702187 ?auto_1702183 ?auto_1702184 )
      ( MAKE-1CRATE-VERIFY ?auto_1702183 ?auto_1702184 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702190 - SURFACE
      ?auto_1702191 - SURFACE
      ?auto_1702192 - SURFACE
    )
    :vars
    (
      ?auto_1702194 - HOIST
      ?auto_1702193 - PLACE
      ?auto_1702195 - TRUCK
      ?auto_1702196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702194 ?auto_1702193 ) ( SURFACE-AT ?auto_1702191 ?auto_1702193 ) ( CLEAR ?auto_1702191 ) ( IS-CRATE ?auto_1702192 ) ( not ( = ?auto_1702191 ?auto_1702192 ) ) ( AVAILABLE ?auto_1702194 ) ( IN ?auto_1702192 ?auto_1702195 ) ( ON ?auto_1702191 ?auto_1702190 ) ( not ( = ?auto_1702190 ?auto_1702191 ) ) ( not ( = ?auto_1702190 ?auto_1702192 ) ) ( TRUCK-AT ?auto_1702195 ?auto_1702196 ) ( not ( = ?auto_1702196 ?auto_1702193 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702191 ?auto_1702192 )
      ( MAKE-2CRATE-VERIFY ?auto_1702190 ?auto_1702191 ?auto_1702192 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702197 - SURFACE
      ?auto_1702198 - SURFACE
    )
    :vars
    (
      ?auto_1702203 - HOIST
      ?auto_1702200 - PLACE
      ?auto_1702199 - SURFACE
      ?auto_1702201 - TRUCK
      ?auto_1702202 - PLACE
      ?auto_1702204 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702203 ?auto_1702200 ) ( SURFACE-AT ?auto_1702197 ?auto_1702200 ) ( CLEAR ?auto_1702197 ) ( IS-CRATE ?auto_1702198 ) ( not ( = ?auto_1702197 ?auto_1702198 ) ) ( AVAILABLE ?auto_1702203 ) ( ON ?auto_1702197 ?auto_1702199 ) ( not ( = ?auto_1702199 ?auto_1702197 ) ) ( not ( = ?auto_1702199 ?auto_1702198 ) ) ( TRUCK-AT ?auto_1702201 ?auto_1702202 ) ( not ( = ?auto_1702202 ?auto_1702200 ) ) ( HOIST-AT ?auto_1702204 ?auto_1702202 ) ( LIFTING ?auto_1702204 ?auto_1702198 ) ( not ( = ?auto_1702203 ?auto_1702204 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1702204 ?auto_1702198 ?auto_1702201 ?auto_1702202 )
      ( MAKE-2CRATE ?auto_1702199 ?auto_1702197 ?auto_1702198 )
      ( MAKE-1CRATE-VERIFY ?auto_1702197 ?auto_1702198 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702205 - SURFACE
      ?auto_1702206 - SURFACE
      ?auto_1702207 - SURFACE
    )
    :vars
    (
      ?auto_1702208 - HOIST
      ?auto_1702211 - PLACE
      ?auto_1702212 - TRUCK
      ?auto_1702210 - PLACE
      ?auto_1702209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702208 ?auto_1702211 ) ( SURFACE-AT ?auto_1702206 ?auto_1702211 ) ( CLEAR ?auto_1702206 ) ( IS-CRATE ?auto_1702207 ) ( not ( = ?auto_1702206 ?auto_1702207 ) ) ( AVAILABLE ?auto_1702208 ) ( ON ?auto_1702206 ?auto_1702205 ) ( not ( = ?auto_1702205 ?auto_1702206 ) ) ( not ( = ?auto_1702205 ?auto_1702207 ) ) ( TRUCK-AT ?auto_1702212 ?auto_1702210 ) ( not ( = ?auto_1702210 ?auto_1702211 ) ) ( HOIST-AT ?auto_1702209 ?auto_1702210 ) ( LIFTING ?auto_1702209 ?auto_1702207 ) ( not ( = ?auto_1702208 ?auto_1702209 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702206 ?auto_1702207 )
      ( MAKE-2CRATE-VERIFY ?auto_1702205 ?auto_1702206 ?auto_1702207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702213 - SURFACE
      ?auto_1702214 - SURFACE
    )
    :vars
    (
      ?auto_1702220 - HOIST
      ?auto_1702215 - PLACE
      ?auto_1702219 - SURFACE
      ?auto_1702217 - TRUCK
      ?auto_1702218 - PLACE
      ?auto_1702216 - HOIST
      ?auto_1702221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702220 ?auto_1702215 ) ( SURFACE-AT ?auto_1702213 ?auto_1702215 ) ( CLEAR ?auto_1702213 ) ( IS-CRATE ?auto_1702214 ) ( not ( = ?auto_1702213 ?auto_1702214 ) ) ( AVAILABLE ?auto_1702220 ) ( ON ?auto_1702213 ?auto_1702219 ) ( not ( = ?auto_1702219 ?auto_1702213 ) ) ( not ( = ?auto_1702219 ?auto_1702214 ) ) ( TRUCK-AT ?auto_1702217 ?auto_1702218 ) ( not ( = ?auto_1702218 ?auto_1702215 ) ) ( HOIST-AT ?auto_1702216 ?auto_1702218 ) ( not ( = ?auto_1702220 ?auto_1702216 ) ) ( AVAILABLE ?auto_1702216 ) ( SURFACE-AT ?auto_1702214 ?auto_1702218 ) ( ON ?auto_1702214 ?auto_1702221 ) ( CLEAR ?auto_1702214 ) ( not ( = ?auto_1702213 ?auto_1702221 ) ) ( not ( = ?auto_1702214 ?auto_1702221 ) ) ( not ( = ?auto_1702219 ?auto_1702221 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1702216 ?auto_1702214 ?auto_1702221 ?auto_1702218 )
      ( MAKE-2CRATE ?auto_1702219 ?auto_1702213 ?auto_1702214 )
      ( MAKE-1CRATE-VERIFY ?auto_1702213 ?auto_1702214 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702222 - SURFACE
      ?auto_1702223 - SURFACE
      ?auto_1702224 - SURFACE
    )
    :vars
    (
      ?auto_1702229 - HOIST
      ?auto_1702226 - PLACE
      ?auto_1702228 - TRUCK
      ?auto_1702227 - PLACE
      ?auto_1702225 - HOIST
      ?auto_1702230 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702229 ?auto_1702226 ) ( SURFACE-AT ?auto_1702223 ?auto_1702226 ) ( CLEAR ?auto_1702223 ) ( IS-CRATE ?auto_1702224 ) ( not ( = ?auto_1702223 ?auto_1702224 ) ) ( AVAILABLE ?auto_1702229 ) ( ON ?auto_1702223 ?auto_1702222 ) ( not ( = ?auto_1702222 ?auto_1702223 ) ) ( not ( = ?auto_1702222 ?auto_1702224 ) ) ( TRUCK-AT ?auto_1702228 ?auto_1702227 ) ( not ( = ?auto_1702227 ?auto_1702226 ) ) ( HOIST-AT ?auto_1702225 ?auto_1702227 ) ( not ( = ?auto_1702229 ?auto_1702225 ) ) ( AVAILABLE ?auto_1702225 ) ( SURFACE-AT ?auto_1702224 ?auto_1702227 ) ( ON ?auto_1702224 ?auto_1702230 ) ( CLEAR ?auto_1702224 ) ( not ( = ?auto_1702223 ?auto_1702230 ) ) ( not ( = ?auto_1702224 ?auto_1702230 ) ) ( not ( = ?auto_1702222 ?auto_1702230 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702223 ?auto_1702224 )
      ( MAKE-2CRATE-VERIFY ?auto_1702222 ?auto_1702223 ?auto_1702224 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702231 - SURFACE
      ?auto_1702232 - SURFACE
    )
    :vars
    (
      ?auto_1702237 - HOIST
      ?auto_1702236 - PLACE
      ?auto_1702239 - SURFACE
      ?auto_1702234 - PLACE
      ?auto_1702233 - HOIST
      ?auto_1702235 - SURFACE
      ?auto_1702238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702237 ?auto_1702236 ) ( SURFACE-AT ?auto_1702231 ?auto_1702236 ) ( CLEAR ?auto_1702231 ) ( IS-CRATE ?auto_1702232 ) ( not ( = ?auto_1702231 ?auto_1702232 ) ) ( AVAILABLE ?auto_1702237 ) ( ON ?auto_1702231 ?auto_1702239 ) ( not ( = ?auto_1702239 ?auto_1702231 ) ) ( not ( = ?auto_1702239 ?auto_1702232 ) ) ( not ( = ?auto_1702234 ?auto_1702236 ) ) ( HOIST-AT ?auto_1702233 ?auto_1702234 ) ( not ( = ?auto_1702237 ?auto_1702233 ) ) ( AVAILABLE ?auto_1702233 ) ( SURFACE-AT ?auto_1702232 ?auto_1702234 ) ( ON ?auto_1702232 ?auto_1702235 ) ( CLEAR ?auto_1702232 ) ( not ( = ?auto_1702231 ?auto_1702235 ) ) ( not ( = ?auto_1702232 ?auto_1702235 ) ) ( not ( = ?auto_1702239 ?auto_1702235 ) ) ( TRUCK-AT ?auto_1702238 ?auto_1702236 ) )
    :subtasks
    ( ( !DRIVE ?auto_1702238 ?auto_1702236 ?auto_1702234 )
      ( MAKE-2CRATE ?auto_1702239 ?auto_1702231 ?auto_1702232 )
      ( MAKE-1CRATE-VERIFY ?auto_1702231 ?auto_1702232 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702240 - SURFACE
      ?auto_1702241 - SURFACE
      ?auto_1702242 - SURFACE
    )
    :vars
    (
      ?auto_1702248 - HOIST
      ?auto_1702244 - PLACE
      ?auto_1702247 - PLACE
      ?auto_1702246 - HOIST
      ?auto_1702243 - SURFACE
      ?auto_1702245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702248 ?auto_1702244 ) ( SURFACE-AT ?auto_1702241 ?auto_1702244 ) ( CLEAR ?auto_1702241 ) ( IS-CRATE ?auto_1702242 ) ( not ( = ?auto_1702241 ?auto_1702242 ) ) ( AVAILABLE ?auto_1702248 ) ( ON ?auto_1702241 ?auto_1702240 ) ( not ( = ?auto_1702240 ?auto_1702241 ) ) ( not ( = ?auto_1702240 ?auto_1702242 ) ) ( not ( = ?auto_1702247 ?auto_1702244 ) ) ( HOIST-AT ?auto_1702246 ?auto_1702247 ) ( not ( = ?auto_1702248 ?auto_1702246 ) ) ( AVAILABLE ?auto_1702246 ) ( SURFACE-AT ?auto_1702242 ?auto_1702247 ) ( ON ?auto_1702242 ?auto_1702243 ) ( CLEAR ?auto_1702242 ) ( not ( = ?auto_1702241 ?auto_1702243 ) ) ( not ( = ?auto_1702242 ?auto_1702243 ) ) ( not ( = ?auto_1702240 ?auto_1702243 ) ) ( TRUCK-AT ?auto_1702245 ?auto_1702244 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702241 ?auto_1702242 )
      ( MAKE-2CRATE-VERIFY ?auto_1702240 ?auto_1702241 ?auto_1702242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702249 - SURFACE
      ?auto_1702250 - SURFACE
    )
    :vars
    (
      ?auto_1702256 - HOIST
      ?auto_1702253 - PLACE
      ?auto_1702257 - SURFACE
      ?auto_1702252 - PLACE
      ?auto_1702255 - HOIST
      ?auto_1702251 - SURFACE
      ?auto_1702254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702256 ?auto_1702253 ) ( IS-CRATE ?auto_1702250 ) ( not ( = ?auto_1702249 ?auto_1702250 ) ) ( not ( = ?auto_1702257 ?auto_1702249 ) ) ( not ( = ?auto_1702257 ?auto_1702250 ) ) ( not ( = ?auto_1702252 ?auto_1702253 ) ) ( HOIST-AT ?auto_1702255 ?auto_1702252 ) ( not ( = ?auto_1702256 ?auto_1702255 ) ) ( AVAILABLE ?auto_1702255 ) ( SURFACE-AT ?auto_1702250 ?auto_1702252 ) ( ON ?auto_1702250 ?auto_1702251 ) ( CLEAR ?auto_1702250 ) ( not ( = ?auto_1702249 ?auto_1702251 ) ) ( not ( = ?auto_1702250 ?auto_1702251 ) ) ( not ( = ?auto_1702257 ?auto_1702251 ) ) ( TRUCK-AT ?auto_1702254 ?auto_1702253 ) ( SURFACE-AT ?auto_1702257 ?auto_1702253 ) ( CLEAR ?auto_1702257 ) ( LIFTING ?auto_1702256 ?auto_1702249 ) ( IS-CRATE ?auto_1702249 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702257 ?auto_1702249 )
      ( MAKE-2CRATE ?auto_1702257 ?auto_1702249 ?auto_1702250 )
      ( MAKE-1CRATE-VERIFY ?auto_1702249 ?auto_1702250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702258 - SURFACE
      ?auto_1702259 - SURFACE
      ?auto_1702260 - SURFACE
    )
    :vars
    (
      ?auto_1702262 - HOIST
      ?auto_1702263 - PLACE
      ?auto_1702261 - PLACE
      ?auto_1702264 - HOIST
      ?auto_1702266 - SURFACE
      ?auto_1702265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702262 ?auto_1702263 ) ( IS-CRATE ?auto_1702260 ) ( not ( = ?auto_1702259 ?auto_1702260 ) ) ( not ( = ?auto_1702258 ?auto_1702259 ) ) ( not ( = ?auto_1702258 ?auto_1702260 ) ) ( not ( = ?auto_1702261 ?auto_1702263 ) ) ( HOIST-AT ?auto_1702264 ?auto_1702261 ) ( not ( = ?auto_1702262 ?auto_1702264 ) ) ( AVAILABLE ?auto_1702264 ) ( SURFACE-AT ?auto_1702260 ?auto_1702261 ) ( ON ?auto_1702260 ?auto_1702266 ) ( CLEAR ?auto_1702260 ) ( not ( = ?auto_1702259 ?auto_1702266 ) ) ( not ( = ?auto_1702260 ?auto_1702266 ) ) ( not ( = ?auto_1702258 ?auto_1702266 ) ) ( TRUCK-AT ?auto_1702265 ?auto_1702263 ) ( SURFACE-AT ?auto_1702258 ?auto_1702263 ) ( CLEAR ?auto_1702258 ) ( LIFTING ?auto_1702262 ?auto_1702259 ) ( IS-CRATE ?auto_1702259 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702259 ?auto_1702260 )
      ( MAKE-2CRATE-VERIFY ?auto_1702258 ?auto_1702259 ?auto_1702260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702267 - SURFACE
      ?auto_1702268 - SURFACE
    )
    :vars
    (
      ?auto_1702270 - HOIST
      ?auto_1702275 - PLACE
      ?auto_1702272 - SURFACE
      ?auto_1702271 - PLACE
      ?auto_1702274 - HOIST
      ?auto_1702273 - SURFACE
      ?auto_1702269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702270 ?auto_1702275 ) ( IS-CRATE ?auto_1702268 ) ( not ( = ?auto_1702267 ?auto_1702268 ) ) ( not ( = ?auto_1702272 ?auto_1702267 ) ) ( not ( = ?auto_1702272 ?auto_1702268 ) ) ( not ( = ?auto_1702271 ?auto_1702275 ) ) ( HOIST-AT ?auto_1702274 ?auto_1702271 ) ( not ( = ?auto_1702270 ?auto_1702274 ) ) ( AVAILABLE ?auto_1702274 ) ( SURFACE-AT ?auto_1702268 ?auto_1702271 ) ( ON ?auto_1702268 ?auto_1702273 ) ( CLEAR ?auto_1702268 ) ( not ( = ?auto_1702267 ?auto_1702273 ) ) ( not ( = ?auto_1702268 ?auto_1702273 ) ) ( not ( = ?auto_1702272 ?auto_1702273 ) ) ( TRUCK-AT ?auto_1702269 ?auto_1702275 ) ( SURFACE-AT ?auto_1702272 ?auto_1702275 ) ( CLEAR ?auto_1702272 ) ( IS-CRATE ?auto_1702267 ) ( AVAILABLE ?auto_1702270 ) ( IN ?auto_1702267 ?auto_1702269 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1702270 ?auto_1702267 ?auto_1702269 ?auto_1702275 )
      ( MAKE-2CRATE ?auto_1702272 ?auto_1702267 ?auto_1702268 )
      ( MAKE-1CRATE-VERIFY ?auto_1702267 ?auto_1702268 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702276 - SURFACE
      ?auto_1702277 - SURFACE
      ?auto_1702278 - SURFACE
    )
    :vars
    (
      ?auto_1702280 - HOIST
      ?auto_1702282 - PLACE
      ?auto_1702281 - PLACE
      ?auto_1702284 - HOIST
      ?auto_1702279 - SURFACE
      ?auto_1702283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702280 ?auto_1702282 ) ( IS-CRATE ?auto_1702278 ) ( not ( = ?auto_1702277 ?auto_1702278 ) ) ( not ( = ?auto_1702276 ?auto_1702277 ) ) ( not ( = ?auto_1702276 ?auto_1702278 ) ) ( not ( = ?auto_1702281 ?auto_1702282 ) ) ( HOIST-AT ?auto_1702284 ?auto_1702281 ) ( not ( = ?auto_1702280 ?auto_1702284 ) ) ( AVAILABLE ?auto_1702284 ) ( SURFACE-AT ?auto_1702278 ?auto_1702281 ) ( ON ?auto_1702278 ?auto_1702279 ) ( CLEAR ?auto_1702278 ) ( not ( = ?auto_1702277 ?auto_1702279 ) ) ( not ( = ?auto_1702278 ?auto_1702279 ) ) ( not ( = ?auto_1702276 ?auto_1702279 ) ) ( TRUCK-AT ?auto_1702283 ?auto_1702282 ) ( SURFACE-AT ?auto_1702276 ?auto_1702282 ) ( CLEAR ?auto_1702276 ) ( IS-CRATE ?auto_1702277 ) ( AVAILABLE ?auto_1702280 ) ( IN ?auto_1702277 ?auto_1702283 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702277 ?auto_1702278 )
      ( MAKE-2CRATE-VERIFY ?auto_1702276 ?auto_1702277 ?auto_1702278 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702321 - SURFACE
      ?auto_1702322 - SURFACE
    )
    :vars
    (
      ?auto_1702329 - HOIST
      ?auto_1702323 - PLACE
      ?auto_1702326 - SURFACE
      ?auto_1702328 - PLACE
      ?auto_1702325 - HOIST
      ?auto_1702324 - SURFACE
      ?auto_1702327 - TRUCK
      ?auto_1702330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702329 ?auto_1702323 ) ( SURFACE-AT ?auto_1702321 ?auto_1702323 ) ( CLEAR ?auto_1702321 ) ( IS-CRATE ?auto_1702322 ) ( not ( = ?auto_1702321 ?auto_1702322 ) ) ( AVAILABLE ?auto_1702329 ) ( ON ?auto_1702321 ?auto_1702326 ) ( not ( = ?auto_1702326 ?auto_1702321 ) ) ( not ( = ?auto_1702326 ?auto_1702322 ) ) ( not ( = ?auto_1702328 ?auto_1702323 ) ) ( HOIST-AT ?auto_1702325 ?auto_1702328 ) ( not ( = ?auto_1702329 ?auto_1702325 ) ) ( AVAILABLE ?auto_1702325 ) ( SURFACE-AT ?auto_1702322 ?auto_1702328 ) ( ON ?auto_1702322 ?auto_1702324 ) ( CLEAR ?auto_1702322 ) ( not ( = ?auto_1702321 ?auto_1702324 ) ) ( not ( = ?auto_1702322 ?auto_1702324 ) ) ( not ( = ?auto_1702326 ?auto_1702324 ) ) ( TRUCK-AT ?auto_1702327 ?auto_1702330 ) ( not ( = ?auto_1702330 ?auto_1702323 ) ) ( not ( = ?auto_1702328 ?auto_1702330 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1702327 ?auto_1702330 ?auto_1702323 )
      ( MAKE-1CRATE ?auto_1702321 ?auto_1702322 )
      ( MAKE-1CRATE-VERIFY ?auto_1702321 ?auto_1702322 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702360 - SURFACE
      ?auto_1702361 - SURFACE
      ?auto_1702362 - SURFACE
      ?auto_1702363 - SURFACE
    )
    :vars
    (
      ?auto_1702364 - HOIST
      ?auto_1702365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702364 ?auto_1702365 ) ( SURFACE-AT ?auto_1702362 ?auto_1702365 ) ( CLEAR ?auto_1702362 ) ( LIFTING ?auto_1702364 ?auto_1702363 ) ( IS-CRATE ?auto_1702363 ) ( not ( = ?auto_1702362 ?auto_1702363 ) ) ( ON ?auto_1702361 ?auto_1702360 ) ( ON ?auto_1702362 ?auto_1702361 ) ( not ( = ?auto_1702360 ?auto_1702361 ) ) ( not ( = ?auto_1702360 ?auto_1702362 ) ) ( not ( = ?auto_1702360 ?auto_1702363 ) ) ( not ( = ?auto_1702361 ?auto_1702362 ) ) ( not ( = ?auto_1702361 ?auto_1702363 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702362 ?auto_1702363 )
      ( MAKE-3CRATE-VERIFY ?auto_1702360 ?auto_1702361 ?auto_1702362 ?auto_1702363 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702377 - SURFACE
      ?auto_1702378 - SURFACE
      ?auto_1702379 - SURFACE
      ?auto_1702380 - SURFACE
    )
    :vars
    (
      ?auto_1702383 - HOIST
      ?auto_1702382 - PLACE
      ?auto_1702381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702383 ?auto_1702382 ) ( SURFACE-AT ?auto_1702379 ?auto_1702382 ) ( CLEAR ?auto_1702379 ) ( IS-CRATE ?auto_1702380 ) ( not ( = ?auto_1702379 ?auto_1702380 ) ) ( TRUCK-AT ?auto_1702381 ?auto_1702382 ) ( AVAILABLE ?auto_1702383 ) ( IN ?auto_1702380 ?auto_1702381 ) ( ON ?auto_1702379 ?auto_1702378 ) ( not ( = ?auto_1702378 ?auto_1702379 ) ) ( not ( = ?auto_1702378 ?auto_1702380 ) ) ( ON ?auto_1702378 ?auto_1702377 ) ( not ( = ?auto_1702377 ?auto_1702378 ) ) ( not ( = ?auto_1702377 ?auto_1702379 ) ) ( not ( = ?auto_1702377 ?auto_1702380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702378 ?auto_1702379 ?auto_1702380 )
      ( MAKE-3CRATE-VERIFY ?auto_1702377 ?auto_1702378 ?auto_1702379 ?auto_1702380 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702398 - SURFACE
      ?auto_1702399 - SURFACE
      ?auto_1702400 - SURFACE
      ?auto_1702401 - SURFACE
    )
    :vars
    (
      ?auto_1702403 - HOIST
      ?auto_1702405 - PLACE
      ?auto_1702402 - TRUCK
      ?auto_1702404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702403 ?auto_1702405 ) ( SURFACE-AT ?auto_1702400 ?auto_1702405 ) ( CLEAR ?auto_1702400 ) ( IS-CRATE ?auto_1702401 ) ( not ( = ?auto_1702400 ?auto_1702401 ) ) ( AVAILABLE ?auto_1702403 ) ( IN ?auto_1702401 ?auto_1702402 ) ( ON ?auto_1702400 ?auto_1702399 ) ( not ( = ?auto_1702399 ?auto_1702400 ) ) ( not ( = ?auto_1702399 ?auto_1702401 ) ) ( TRUCK-AT ?auto_1702402 ?auto_1702404 ) ( not ( = ?auto_1702404 ?auto_1702405 ) ) ( ON ?auto_1702399 ?auto_1702398 ) ( not ( = ?auto_1702398 ?auto_1702399 ) ) ( not ( = ?auto_1702398 ?auto_1702400 ) ) ( not ( = ?auto_1702398 ?auto_1702401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702399 ?auto_1702400 ?auto_1702401 )
      ( MAKE-3CRATE-VERIFY ?auto_1702398 ?auto_1702399 ?auto_1702400 ?auto_1702401 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702422 - SURFACE
      ?auto_1702423 - SURFACE
      ?auto_1702424 - SURFACE
      ?auto_1702425 - SURFACE
    )
    :vars
    (
      ?auto_1702427 - HOIST
      ?auto_1702429 - PLACE
      ?auto_1702430 - TRUCK
      ?auto_1702428 - PLACE
      ?auto_1702426 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702427 ?auto_1702429 ) ( SURFACE-AT ?auto_1702424 ?auto_1702429 ) ( CLEAR ?auto_1702424 ) ( IS-CRATE ?auto_1702425 ) ( not ( = ?auto_1702424 ?auto_1702425 ) ) ( AVAILABLE ?auto_1702427 ) ( ON ?auto_1702424 ?auto_1702423 ) ( not ( = ?auto_1702423 ?auto_1702424 ) ) ( not ( = ?auto_1702423 ?auto_1702425 ) ) ( TRUCK-AT ?auto_1702430 ?auto_1702428 ) ( not ( = ?auto_1702428 ?auto_1702429 ) ) ( HOIST-AT ?auto_1702426 ?auto_1702428 ) ( LIFTING ?auto_1702426 ?auto_1702425 ) ( not ( = ?auto_1702427 ?auto_1702426 ) ) ( ON ?auto_1702423 ?auto_1702422 ) ( not ( = ?auto_1702422 ?auto_1702423 ) ) ( not ( = ?auto_1702422 ?auto_1702424 ) ) ( not ( = ?auto_1702422 ?auto_1702425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702423 ?auto_1702424 ?auto_1702425 )
      ( MAKE-3CRATE-VERIFY ?auto_1702422 ?auto_1702423 ?auto_1702424 ?auto_1702425 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702449 - SURFACE
      ?auto_1702450 - SURFACE
      ?auto_1702451 - SURFACE
      ?auto_1702452 - SURFACE
    )
    :vars
    (
      ?auto_1702458 - HOIST
      ?auto_1702455 - PLACE
      ?auto_1702457 - TRUCK
      ?auto_1702456 - PLACE
      ?auto_1702453 - HOIST
      ?auto_1702454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702458 ?auto_1702455 ) ( SURFACE-AT ?auto_1702451 ?auto_1702455 ) ( CLEAR ?auto_1702451 ) ( IS-CRATE ?auto_1702452 ) ( not ( = ?auto_1702451 ?auto_1702452 ) ) ( AVAILABLE ?auto_1702458 ) ( ON ?auto_1702451 ?auto_1702450 ) ( not ( = ?auto_1702450 ?auto_1702451 ) ) ( not ( = ?auto_1702450 ?auto_1702452 ) ) ( TRUCK-AT ?auto_1702457 ?auto_1702456 ) ( not ( = ?auto_1702456 ?auto_1702455 ) ) ( HOIST-AT ?auto_1702453 ?auto_1702456 ) ( not ( = ?auto_1702458 ?auto_1702453 ) ) ( AVAILABLE ?auto_1702453 ) ( SURFACE-AT ?auto_1702452 ?auto_1702456 ) ( ON ?auto_1702452 ?auto_1702454 ) ( CLEAR ?auto_1702452 ) ( not ( = ?auto_1702451 ?auto_1702454 ) ) ( not ( = ?auto_1702452 ?auto_1702454 ) ) ( not ( = ?auto_1702450 ?auto_1702454 ) ) ( ON ?auto_1702450 ?auto_1702449 ) ( not ( = ?auto_1702449 ?auto_1702450 ) ) ( not ( = ?auto_1702449 ?auto_1702451 ) ) ( not ( = ?auto_1702449 ?auto_1702452 ) ) ( not ( = ?auto_1702449 ?auto_1702454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702450 ?auto_1702451 ?auto_1702452 )
      ( MAKE-3CRATE-VERIFY ?auto_1702449 ?auto_1702450 ?auto_1702451 ?auto_1702452 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702477 - SURFACE
      ?auto_1702478 - SURFACE
      ?auto_1702479 - SURFACE
      ?auto_1702480 - SURFACE
    )
    :vars
    (
      ?auto_1702484 - HOIST
      ?auto_1702486 - PLACE
      ?auto_1702483 - PLACE
      ?auto_1702485 - HOIST
      ?auto_1702482 - SURFACE
      ?auto_1702481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702484 ?auto_1702486 ) ( SURFACE-AT ?auto_1702479 ?auto_1702486 ) ( CLEAR ?auto_1702479 ) ( IS-CRATE ?auto_1702480 ) ( not ( = ?auto_1702479 ?auto_1702480 ) ) ( AVAILABLE ?auto_1702484 ) ( ON ?auto_1702479 ?auto_1702478 ) ( not ( = ?auto_1702478 ?auto_1702479 ) ) ( not ( = ?auto_1702478 ?auto_1702480 ) ) ( not ( = ?auto_1702483 ?auto_1702486 ) ) ( HOIST-AT ?auto_1702485 ?auto_1702483 ) ( not ( = ?auto_1702484 ?auto_1702485 ) ) ( AVAILABLE ?auto_1702485 ) ( SURFACE-AT ?auto_1702480 ?auto_1702483 ) ( ON ?auto_1702480 ?auto_1702482 ) ( CLEAR ?auto_1702480 ) ( not ( = ?auto_1702479 ?auto_1702482 ) ) ( not ( = ?auto_1702480 ?auto_1702482 ) ) ( not ( = ?auto_1702478 ?auto_1702482 ) ) ( TRUCK-AT ?auto_1702481 ?auto_1702486 ) ( ON ?auto_1702478 ?auto_1702477 ) ( not ( = ?auto_1702477 ?auto_1702478 ) ) ( not ( = ?auto_1702477 ?auto_1702479 ) ) ( not ( = ?auto_1702477 ?auto_1702480 ) ) ( not ( = ?auto_1702477 ?auto_1702482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702478 ?auto_1702479 ?auto_1702480 )
      ( MAKE-3CRATE-VERIFY ?auto_1702477 ?auto_1702478 ?auto_1702479 ?auto_1702480 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702505 - SURFACE
      ?auto_1702506 - SURFACE
      ?auto_1702507 - SURFACE
      ?auto_1702508 - SURFACE
    )
    :vars
    (
      ?auto_1702510 - HOIST
      ?auto_1702513 - PLACE
      ?auto_1702509 - PLACE
      ?auto_1702512 - HOIST
      ?auto_1702511 - SURFACE
      ?auto_1702514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702510 ?auto_1702513 ) ( IS-CRATE ?auto_1702508 ) ( not ( = ?auto_1702507 ?auto_1702508 ) ) ( not ( = ?auto_1702506 ?auto_1702507 ) ) ( not ( = ?auto_1702506 ?auto_1702508 ) ) ( not ( = ?auto_1702509 ?auto_1702513 ) ) ( HOIST-AT ?auto_1702512 ?auto_1702509 ) ( not ( = ?auto_1702510 ?auto_1702512 ) ) ( AVAILABLE ?auto_1702512 ) ( SURFACE-AT ?auto_1702508 ?auto_1702509 ) ( ON ?auto_1702508 ?auto_1702511 ) ( CLEAR ?auto_1702508 ) ( not ( = ?auto_1702507 ?auto_1702511 ) ) ( not ( = ?auto_1702508 ?auto_1702511 ) ) ( not ( = ?auto_1702506 ?auto_1702511 ) ) ( TRUCK-AT ?auto_1702514 ?auto_1702513 ) ( SURFACE-AT ?auto_1702506 ?auto_1702513 ) ( CLEAR ?auto_1702506 ) ( LIFTING ?auto_1702510 ?auto_1702507 ) ( IS-CRATE ?auto_1702507 ) ( ON ?auto_1702506 ?auto_1702505 ) ( not ( = ?auto_1702505 ?auto_1702506 ) ) ( not ( = ?auto_1702505 ?auto_1702507 ) ) ( not ( = ?auto_1702505 ?auto_1702508 ) ) ( not ( = ?auto_1702505 ?auto_1702511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702506 ?auto_1702507 ?auto_1702508 )
      ( MAKE-3CRATE-VERIFY ?auto_1702505 ?auto_1702506 ?auto_1702507 ?auto_1702508 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1702533 - SURFACE
      ?auto_1702534 - SURFACE
      ?auto_1702535 - SURFACE
      ?auto_1702536 - SURFACE
    )
    :vars
    (
      ?auto_1702538 - HOIST
      ?auto_1702540 - PLACE
      ?auto_1702539 - PLACE
      ?auto_1702541 - HOIST
      ?auto_1702537 - SURFACE
      ?auto_1702542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702538 ?auto_1702540 ) ( IS-CRATE ?auto_1702536 ) ( not ( = ?auto_1702535 ?auto_1702536 ) ) ( not ( = ?auto_1702534 ?auto_1702535 ) ) ( not ( = ?auto_1702534 ?auto_1702536 ) ) ( not ( = ?auto_1702539 ?auto_1702540 ) ) ( HOIST-AT ?auto_1702541 ?auto_1702539 ) ( not ( = ?auto_1702538 ?auto_1702541 ) ) ( AVAILABLE ?auto_1702541 ) ( SURFACE-AT ?auto_1702536 ?auto_1702539 ) ( ON ?auto_1702536 ?auto_1702537 ) ( CLEAR ?auto_1702536 ) ( not ( = ?auto_1702535 ?auto_1702537 ) ) ( not ( = ?auto_1702536 ?auto_1702537 ) ) ( not ( = ?auto_1702534 ?auto_1702537 ) ) ( TRUCK-AT ?auto_1702542 ?auto_1702540 ) ( SURFACE-AT ?auto_1702534 ?auto_1702540 ) ( CLEAR ?auto_1702534 ) ( IS-CRATE ?auto_1702535 ) ( AVAILABLE ?auto_1702538 ) ( IN ?auto_1702535 ?auto_1702542 ) ( ON ?auto_1702534 ?auto_1702533 ) ( not ( = ?auto_1702533 ?auto_1702534 ) ) ( not ( = ?auto_1702533 ?auto_1702535 ) ) ( not ( = ?auto_1702533 ?auto_1702536 ) ) ( not ( = ?auto_1702533 ?auto_1702537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702534 ?auto_1702535 ?auto_1702536 )
      ( MAKE-3CRATE-VERIFY ?auto_1702533 ?auto_1702534 ?auto_1702535 ?auto_1702536 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1702824 - SURFACE
      ?auto_1702825 - SURFACE
      ?auto_1702826 - SURFACE
      ?auto_1702828 - SURFACE
      ?auto_1702827 - SURFACE
    )
    :vars
    (
      ?auto_1702829 - HOIST
      ?auto_1702830 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702829 ?auto_1702830 ) ( SURFACE-AT ?auto_1702828 ?auto_1702830 ) ( CLEAR ?auto_1702828 ) ( LIFTING ?auto_1702829 ?auto_1702827 ) ( IS-CRATE ?auto_1702827 ) ( not ( = ?auto_1702828 ?auto_1702827 ) ) ( ON ?auto_1702825 ?auto_1702824 ) ( ON ?auto_1702826 ?auto_1702825 ) ( ON ?auto_1702828 ?auto_1702826 ) ( not ( = ?auto_1702824 ?auto_1702825 ) ) ( not ( = ?auto_1702824 ?auto_1702826 ) ) ( not ( = ?auto_1702824 ?auto_1702828 ) ) ( not ( = ?auto_1702824 ?auto_1702827 ) ) ( not ( = ?auto_1702825 ?auto_1702826 ) ) ( not ( = ?auto_1702825 ?auto_1702828 ) ) ( not ( = ?auto_1702825 ?auto_1702827 ) ) ( not ( = ?auto_1702826 ?auto_1702828 ) ) ( not ( = ?auto_1702826 ?auto_1702827 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702828 ?auto_1702827 )
      ( MAKE-4CRATE-VERIFY ?auto_1702824 ?auto_1702825 ?auto_1702826 ?auto_1702828 ?auto_1702827 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1702849 - SURFACE
      ?auto_1702850 - SURFACE
      ?auto_1702851 - SURFACE
      ?auto_1702853 - SURFACE
      ?auto_1702852 - SURFACE
    )
    :vars
    (
      ?auto_1702854 - HOIST
      ?auto_1702856 - PLACE
      ?auto_1702855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702854 ?auto_1702856 ) ( SURFACE-AT ?auto_1702853 ?auto_1702856 ) ( CLEAR ?auto_1702853 ) ( IS-CRATE ?auto_1702852 ) ( not ( = ?auto_1702853 ?auto_1702852 ) ) ( TRUCK-AT ?auto_1702855 ?auto_1702856 ) ( AVAILABLE ?auto_1702854 ) ( IN ?auto_1702852 ?auto_1702855 ) ( ON ?auto_1702853 ?auto_1702851 ) ( not ( = ?auto_1702851 ?auto_1702853 ) ) ( not ( = ?auto_1702851 ?auto_1702852 ) ) ( ON ?auto_1702850 ?auto_1702849 ) ( ON ?auto_1702851 ?auto_1702850 ) ( not ( = ?auto_1702849 ?auto_1702850 ) ) ( not ( = ?auto_1702849 ?auto_1702851 ) ) ( not ( = ?auto_1702849 ?auto_1702853 ) ) ( not ( = ?auto_1702849 ?auto_1702852 ) ) ( not ( = ?auto_1702850 ?auto_1702851 ) ) ( not ( = ?auto_1702850 ?auto_1702853 ) ) ( not ( = ?auto_1702850 ?auto_1702852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702851 ?auto_1702853 ?auto_1702852 )
      ( MAKE-4CRATE-VERIFY ?auto_1702849 ?auto_1702850 ?auto_1702851 ?auto_1702853 ?auto_1702852 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1702879 - SURFACE
      ?auto_1702880 - SURFACE
      ?auto_1702881 - SURFACE
      ?auto_1702883 - SURFACE
      ?auto_1702882 - SURFACE
    )
    :vars
    (
      ?auto_1702886 - HOIST
      ?auto_1702887 - PLACE
      ?auto_1702885 - TRUCK
      ?auto_1702884 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702886 ?auto_1702887 ) ( SURFACE-AT ?auto_1702883 ?auto_1702887 ) ( CLEAR ?auto_1702883 ) ( IS-CRATE ?auto_1702882 ) ( not ( = ?auto_1702883 ?auto_1702882 ) ) ( AVAILABLE ?auto_1702886 ) ( IN ?auto_1702882 ?auto_1702885 ) ( ON ?auto_1702883 ?auto_1702881 ) ( not ( = ?auto_1702881 ?auto_1702883 ) ) ( not ( = ?auto_1702881 ?auto_1702882 ) ) ( TRUCK-AT ?auto_1702885 ?auto_1702884 ) ( not ( = ?auto_1702884 ?auto_1702887 ) ) ( ON ?auto_1702880 ?auto_1702879 ) ( ON ?auto_1702881 ?auto_1702880 ) ( not ( = ?auto_1702879 ?auto_1702880 ) ) ( not ( = ?auto_1702879 ?auto_1702881 ) ) ( not ( = ?auto_1702879 ?auto_1702883 ) ) ( not ( = ?auto_1702879 ?auto_1702882 ) ) ( not ( = ?auto_1702880 ?auto_1702881 ) ) ( not ( = ?auto_1702880 ?auto_1702883 ) ) ( not ( = ?auto_1702880 ?auto_1702882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702881 ?auto_1702883 ?auto_1702882 )
      ( MAKE-4CRATE-VERIFY ?auto_1702879 ?auto_1702880 ?auto_1702881 ?auto_1702883 ?auto_1702882 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1702913 - SURFACE
      ?auto_1702914 - SURFACE
      ?auto_1702915 - SURFACE
      ?auto_1702917 - SURFACE
      ?auto_1702916 - SURFACE
    )
    :vars
    (
      ?auto_1702921 - HOIST
      ?auto_1702919 - PLACE
      ?auto_1702920 - TRUCK
      ?auto_1702922 - PLACE
      ?auto_1702918 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702921 ?auto_1702919 ) ( SURFACE-AT ?auto_1702917 ?auto_1702919 ) ( CLEAR ?auto_1702917 ) ( IS-CRATE ?auto_1702916 ) ( not ( = ?auto_1702917 ?auto_1702916 ) ) ( AVAILABLE ?auto_1702921 ) ( ON ?auto_1702917 ?auto_1702915 ) ( not ( = ?auto_1702915 ?auto_1702917 ) ) ( not ( = ?auto_1702915 ?auto_1702916 ) ) ( TRUCK-AT ?auto_1702920 ?auto_1702922 ) ( not ( = ?auto_1702922 ?auto_1702919 ) ) ( HOIST-AT ?auto_1702918 ?auto_1702922 ) ( LIFTING ?auto_1702918 ?auto_1702916 ) ( not ( = ?auto_1702921 ?auto_1702918 ) ) ( ON ?auto_1702914 ?auto_1702913 ) ( ON ?auto_1702915 ?auto_1702914 ) ( not ( = ?auto_1702913 ?auto_1702914 ) ) ( not ( = ?auto_1702913 ?auto_1702915 ) ) ( not ( = ?auto_1702913 ?auto_1702917 ) ) ( not ( = ?auto_1702913 ?auto_1702916 ) ) ( not ( = ?auto_1702914 ?auto_1702915 ) ) ( not ( = ?auto_1702914 ?auto_1702917 ) ) ( not ( = ?auto_1702914 ?auto_1702916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702915 ?auto_1702917 ?auto_1702916 )
      ( MAKE-4CRATE-VERIFY ?auto_1702913 ?auto_1702914 ?auto_1702915 ?auto_1702917 ?auto_1702916 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1702951 - SURFACE
      ?auto_1702952 - SURFACE
      ?auto_1702953 - SURFACE
      ?auto_1702955 - SURFACE
      ?auto_1702954 - SURFACE
    )
    :vars
    (
      ?auto_1702957 - HOIST
      ?auto_1702961 - PLACE
      ?auto_1702958 - TRUCK
      ?auto_1702959 - PLACE
      ?auto_1702960 - HOIST
      ?auto_1702956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702957 ?auto_1702961 ) ( SURFACE-AT ?auto_1702955 ?auto_1702961 ) ( CLEAR ?auto_1702955 ) ( IS-CRATE ?auto_1702954 ) ( not ( = ?auto_1702955 ?auto_1702954 ) ) ( AVAILABLE ?auto_1702957 ) ( ON ?auto_1702955 ?auto_1702953 ) ( not ( = ?auto_1702953 ?auto_1702955 ) ) ( not ( = ?auto_1702953 ?auto_1702954 ) ) ( TRUCK-AT ?auto_1702958 ?auto_1702959 ) ( not ( = ?auto_1702959 ?auto_1702961 ) ) ( HOIST-AT ?auto_1702960 ?auto_1702959 ) ( not ( = ?auto_1702957 ?auto_1702960 ) ) ( AVAILABLE ?auto_1702960 ) ( SURFACE-AT ?auto_1702954 ?auto_1702959 ) ( ON ?auto_1702954 ?auto_1702956 ) ( CLEAR ?auto_1702954 ) ( not ( = ?auto_1702955 ?auto_1702956 ) ) ( not ( = ?auto_1702954 ?auto_1702956 ) ) ( not ( = ?auto_1702953 ?auto_1702956 ) ) ( ON ?auto_1702952 ?auto_1702951 ) ( ON ?auto_1702953 ?auto_1702952 ) ( not ( = ?auto_1702951 ?auto_1702952 ) ) ( not ( = ?auto_1702951 ?auto_1702953 ) ) ( not ( = ?auto_1702951 ?auto_1702955 ) ) ( not ( = ?auto_1702951 ?auto_1702954 ) ) ( not ( = ?auto_1702951 ?auto_1702956 ) ) ( not ( = ?auto_1702952 ?auto_1702953 ) ) ( not ( = ?auto_1702952 ?auto_1702955 ) ) ( not ( = ?auto_1702952 ?auto_1702954 ) ) ( not ( = ?auto_1702952 ?auto_1702956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702953 ?auto_1702955 ?auto_1702954 )
      ( MAKE-4CRATE-VERIFY ?auto_1702951 ?auto_1702952 ?auto_1702953 ?auto_1702955 ?auto_1702954 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1702990 - SURFACE
      ?auto_1702991 - SURFACE
      ?auto_1702992 - SURFACE
      ?auto_1702994 - SURFACE
      ?auto_1702993 - SURFACE
    )
    :vars
    (
      ?auto_1702998 - HOIST
      ?auto_1703000 - PLACE
      ?auto_1702996 - PLACE
      ?auto_1702999 - HOIST
      ?auto_1702995 - SURFACE
      ?auto_1702997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702998 ?auto_1703000 ) ( SURFACE-AT ?auto_1702994 ?auto_1703000 ) ( CLEAR ?auto_1702994 ) ( IS-CRATE ?auto_1702993 ) ( not ( = ?auto_1702994 ?auto_1702993 ) ) ( AVAILABLE ?auto_1702998 ) ( ON ?auto_1702994 ?auto_1702992 ) ( not ( = ?auto_1702992 ?auto_1702994 ) ) ( not ( = ?auto_1702992 ?auto_1702993 ) ) ( not ( = ?auto_1702996 ?auto_1703000 ) ) ( HOIST-AT ?auto_1702999 ?auto_1702996 ) ( not ( = ?auto_1702998 ?auto_1702999 ) ) ( AVAILABLE ?auto_1702999 ) ( SURFACE-AT ?auto_1702993 ?auto_1702996 ) ( ON ?auto_1702993 ?auto_1702995 ) ( CLEAR ?auto_1702993 ) ( not ( = ?auto_1702994 ?auto_1702995 ) ) ( not ( = ?auto_1702993 ?auto_1702995 ) ) ( not ( = ?auto_1702992 ?auto_1702995 ) ) ( TRUCK-AT ?auto_1702997 ?auto_1703000 ) ( ON ?auto_1702991 ?auto_1702990 ) ( ON ?auto_1702992 ?auto_1702991 ) ( not ( = ?auto_1702990 ?auto_1702991 ) ) ( not ( = ?auto_1702990 ?auto_1702992 ) ) ( not ( = ?auto_1702990 ?auto_1702994 ) ) ( not ( = ?auto_1702990 ?auto_1702993 ) ) ( not ( = ?auto_1702990 ?auto_1702995 ) ) ( not ( = ?auto_1702991 ?auto_1702992 ) ) ( not ( = ?auto_1702991 ?auto_1702994 ) ) ( not ( = ?auto_1702991 ?auto_1702993 ) ) ( not ( = ?auto_1702991 ?auto_1702995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1702992 ?auto_1702994 ?auto_1702993 )
      ( MAKE-4CRATE-VERIFY ?auto_1702990 ?auto_1702991 ?auto_1702992 ?auto_1702994 ?auto_1702993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703029 - SURFACE
      ?auto_1703030 - SURFACE
      ?auto_1703031 - SURFACE
      ?auto_1703033 - SURFACE
      ?auto_1703032 - SURFACE
    )
    :vars
    (
      ?auto_1703038 - HOIST
      ?auto_1703035 - PLACE
      ?auto_1703034 - PLACE
      ?auto_1703036 - HOIST
      ?auto_1703039 - SURFACE
      ?auto_1703037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703038 ?auto_1703035 ) ( IS-CRATE ?auto_1703032 ) ( not ( = ?auto_1703033 ?auto_1703032 ) ) ( not ( = ?auto_1703031 ?auto_1703033 ) ) ( not ( = ?auto_1703031 ?auto_1703032 ) ) ( not ( = ?auto_1703034 ?auto_1703035 ) ) ( HOIST-AT ?auto_1703036 ?auto_1703034 ) ( not ( = ?auto_1703038 ?auto_1703036 ) ) ( AVAILABLE ?auto_1703036 ) ( SURFACE-AT ?auto_1703032 ?auto_1703034 ) ( ON ?auto_1703032 ?auto_1703039 ) ( CLEAR ?auto_1703032 ) ( not ( = ?auto_1703033 ?auto_1703039 ) ) ( not ( = ?auto_1703032 ?auto_1703039 ) ) ( not ( = ?auto_1703031 ?auto_1703039 ) ) ( TRUCK-AT ?auto_1703037 ?auto_1703035 ) ( SURFACE-AT ?auto_1703031 ?auto_1703035 ) ( CLEAR ?auto_1703031 ) ( LIFTING ?auto_1703038 ?auto_1703033 ) ( IS-CRATE ?auto_1703033 ) ( ON ?auto_1703030 ?auto_1703029 ) ( ON ?auto_1703031 ?auto_1703030 ) ( not ( = ?auto_1703029 ?auto_1703030 ) ) ( not ( = ?auto_1703029 ?auto_1703031 ) ) ( not ( = ?auto_1703029 ?auto_1703033 ) ) ( not ( = ?auto_1703029 ?auto_1703032 ) ) ( not ( = ?auto_1703029 ?auto_1703039 ) ) ( not ( = ?auto_1703030 ?auto_1703031 ) ) ( not ( = ?auto_1703030 ?auto_1703033 ) ) ( not ( = ?auto_1703030 ?auto_1703032 ) ) ( not ( = ?auto_1703030 ?auto_1703039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703031 ?auto_1703033 ?auto_1703032 )
      ( MAKE-4CRATE-VERIFY ?auto_1703029 ?auto_1703030 ?auto_1703031 ?auto_1703033 ?auto_1703032 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703068 - SURFACE
      ?auto_1703069 - SURFACE
      ?auto_1703070 - SURFACE
      ?auto_1703072 - SURFACE
      ?auto_1703071 - SURFACE
    )
    :vars
    (
      ?auto_1703075 - HOIST
      ?auto_1703073 - PLACE
      ?auto_1703078 - PLACE
      ?auto_1703077 - HOIST
      ?auto_1703074 - SURFACE
      ?auto_1703076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703075 ?auto_1703073 ) ( IS-CRATE ?auto_1703071 ) ( not ( = ?auto_1703072 ?auto_1703071 ) ) ( not ( = ?auto_1703070 ?auto_1703072 ) ) ( not ( = ?auto_1703070 ?auto_1703071 ) ) ( not ( = ?auto_1703078 ?auto_1703073 ) ) ( HOIST-AT ?auto_1703077 ?auto_1703078 ) ( not ( = ?auto_1703075 ?auto_1703077 ) ) ( AVAILABLE ?auto_1703077 ) ( SURFACE-AT ?auto_1703071 ?auto_1703078 ) ( ON ?auto_1703071 ?auto_1703074 ) ( CLEAR ?auto_1703071 ) ( not ( = ?auto_1703072 ?auto_1703074 ) ) ( not ( = ?auto_1703071 ?auto_1703074 ) ) ( not ( = ?auto_1703070 ?auto_1703074 ) ) ( TRUCK-AT ?auto_1703076 ?auto_1703073 ) ( SURFACE-AT ?auto_1703070 ?auto_1703073 ) ( CLEAR ?auto_1703070 ) ( IS-CRATE ?auto_1703072 ) ( AVAILABLE ?auto_1703075 ) ( IN ?auto_1703072 ?auto_1703076 ) ( ON ?auto_1703069 ?auto_1703068 ) ( ON ?auto_1703070 ?auto_1703069 ) ( not ( = ?auto_1703068 ?auto_1703069 ) ) ( not ( = ?auto_1703068 ?auto_1703070 ) ) ( not ( = ?auto_1703068 ?auto_1703072 ) ) ( not ( = ?auto_1703068 ?auto_1703071 ) ) ( not ( = ?auto_1703068 ?auto_1703074 ) ) ( not ( = ?auto_1703069 ?auto_1703070 ) ) ( not ( = ?auto_1703069 ?auto_1703072 ) ) ( not ( = ?auto_1703069 ?auto_1703071 ) ) ( not ( = ?auto_1703069 ?auto_1703074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703070 ?auto_1703072 ?auto_1703071 )
      ( MAKE-4CRATE-VERIFY ?auto_1703068 ?auto_1703069 ?auto_1703070 ?auto_1703072 ?auto_1703071 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1703728 - SURFACE
      ?auto_1703729 - SURFACE
      ?auto_1703730 - SURFACE
      ?auto_1703732 - SURFACE
      ?auto_1703731 - SURFACE
      ?auto_1703733 - SURFACE
    )
    :vars
    (
      ?auto_1703734 - HOIST
      ?auto_1703735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703734 ?auto_1703735 ) ( SURFACE-AT ?auto_1703731 ?auto_1703735 ) ( CLEAR ?auto_1703731 ) ( LIFTING ?auto_1703734 ?auto_1703733 ) ( IS-CRATE ?auto_1703733 ) ( not ( = ?auto_1703731 ?auto_1703733 ) ) ( ON ?auto_1703729 ?auto_1703728 ) ( ON ?auto_1703730 ?auto_1703729 ) ( ON ?auto_1703732 ?auto_1703730 ) ( ON ?auto_1703731 ?auto_1703732 ) ( not ( = ?auto_1703728 ?auto_1703729 ) ) ( not ( = ?auto_1703728 ?auto_1703730 ) ) ( not ( = ?auto_1703728 ?auto_1703732 ) ) ( not ( = ?auto_1703728 ?auto_1703731 ) ) ( not ( = ?auto_1703728 ?auto_1703733 ) ) ( not ( = ?auto_1703729 ?auto_1703730 ) ) ( not ( = ?auto_1703729 ?auto_1703732 ) ) ( not ( = ?auto_1703729 ?auto_1703731 ) ) ( not ( = ?auto_1703729 ?auto_1703733 ) ) ( not ( = ?auto_1703730 ?auto_1703732 ) ) ( not ( = ?auto_1703730 ?auto_1703731 ) ) ( not ( = ?auto_1703730 ?auto_1703733 ) ) ( not ( = ?auto_1703732 ?auto_1703731 ) ) ( not ( = ?auto_1703732 ?auto_1703733 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703731 ?auto_1703733 )
      ( MAKE-5CRATE-VERIFY ?auto_1703728 ?auto_1703729 ?auto_1703730 ?auto_1703732 ?auto_1703731 ?auto_1703733 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1703762 - SURFACE
      ?auto_1703763 - SURFACE
      ?auto_1703764 - SURFACE
      ?auto_1703766 - SURFACE
      ?auto_1703765 - SURFACE
      ?auto_1703767 - SURFACE
    )
    :vars
    (
      ?auto_1703769 - HOIST
      ?auto_1703770 - PLACE
      ?auto_1703768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703769 ?auto_1703770 ) ( SURFACE-AT ?auto_1703765 ?auto_1703770 ) ( CLEAR ?auto_1703765 ) ( IS-CRATE ?auto_1703767 ) ( not ( = ?auto_1703765 ?auto_1703767 ) ) ( TRUCK-AT ?auto_1703768 ?auto_1703770 ) ( AVAILABLE ?auto_1703769 ) ( IN ?auto_1703767 ?auto_1703768 ) ( ON ?auto_1703765 ?auto_1703766 ) ( not ( = ?auto_1703766 ?auto_1703765 ) ) ( not ( = ?auto_1703766 ?auto_1703767 ) ) ( ON ?auto_1703763 ?auto_1703762 ) ( ON ?auto_1703764 ?auto_1703763 ) ( ON ?auto_1703766 ?auto_1703764 ) ( not ( = ?auto_1703762 ?auto_1703763 ) ) ( not ( = ?auto_1703762 ?auto_1703764 ) ) ( not ( = ?auto_1703762 ?auto_1703766 ) ) ( not ( = ?auto_1703762 ?auto_1703765 ) ) ( not ( = ?auto_1703762 ?auto_1703767 ) ) ( not ( = ?auto_1703763 ?auto_1703764 ) ) ( not ( = ?auto_1703763 ?auto_1703766 ) ) ( not ( = ?auto_1703763 ?auto_1703765 ) ) ( not ( = ?auto_1703763 ?auto_1703767 ) ) ( not ( = ?auto_1703764 ?auto_1703766 ) ) ( not ( = ?auto_1703764 ?auto_1703765 ) ) ( not ( = ?auto_1703764 ?auto_1703767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703766 ?auto_1703765 ?auto_1703767 )
      ( MAKE-5CRATE-VERIFY ?auto_1703762 ?auto_1703763 ?auto_1703764 ?auto_1703766 ?auto_1703765 ?auto_1703767 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1703802 - SURFACE
      ?auto_1703803 - SURFACE
      ?auto_1703804 - SURFACE
      ?auto_1703806 - SURFACE
      ?auto_1703805 - SURFACE
      ?auto_1703807 - SURFACE
    )
    :vars
    (
      ?auto_1703811 - HOIST
      ?auto_1703810 - PLACE
      ?auto_1703808 - TRUCK
      ?auto_1703809 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703811 ?auto_1703810 ) ( SURFACE-AT ?auto_1703805 ?auto_1703810 ) ( CLEAR ?auto_1703805 ) ( IS-CRATE ?auto_1703807 ) ( not ( = ?auto_1703805 ?auto_1703807 ) ) ( AVAILABLE ?auto_1703811 ) ( IN ?auto_1703807 ?auto_1703808 ) ( ON ?auto_1703805 ?auto_1703806 ) ( not ( = ?auto_1703806 ?auto_1703805 ) ) ( not ( = ?auto_1703806 ?auto_1703807 ) ) ( TRUCK-AT ?auto_1703808 ?auto_1703809 ) ( not ( = ?auto_1703809 ?auto_1703810 ) ) ( ON ?auto_1703803 ?auto_1703802 ) ( ON ?auto_1703804 ?auto_1703803 ) ( ON ?auto_1703806 ?auto_1703804 ) ( not ( = ?auto_1703802 ?auto_1703803 ) ) ( not ( = ?auto_1703802 ?auto_1703804 ) ) ( not ( = ?auto_1703802 ?auto_1703806 ) ) ( not ( = ?auto_1703802 ?auto_1703805 ) ) ( not ( = ?auto_1703802 ?auto_1703807 ) ) ( not ( = ?auto_1703803 ?auto_1703804 ) ) ( not ( = ?auto_1703803 ?auto_1703806 ) ) ( not ( = ?auto_1703803 ?auto_1703805 ) ) ( not ( = ?auto_1703803 ?auto_1703807 ) ) ( not ( = ?auto_1703804 ?auto_1703806 ) ) ( not ( = ?auto_1703804 ?auto_1703805 ) ) ( not ( = ?auto_1703804 ?auto_1703807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703806 ?auto_1703805 ?auto_1703807 )
      ( MAKE-5CRATE-VERIFY ?auto_1703802 ?auto_1703803 ?auto_1703804 ?auto_1703806 ?auto_1703805 ?auto_1703807 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1703847 - SURFACE
      ?auto_1703848 - SURFACE
      ?auto_1703849 - SURFACE
      ?auto_1703851 - SURFACE
      ?auto_1703850 - SURFACE
      ?auto_1703852 - SURFACE
    )
    :vars
    (
      ?auto_1703855 - HOIST
      ?auto_1703856 - PLACE
      ?auto_1703853 - TRUCK
      ?auto_1703854 - PLACE
      ?auto_1703857 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703855 ?auto_1703856 ) ( SURFACE-AT ?auto_1703850 ?auto_1703856 ) ( CLEAR ?auto_1703850 ) ( IS-CRATE ?auto_1703852 ) ( not ( = ?auto_1703850 ?auto_1703852 ) ) ( AVAILABLE ?auto_1703855 ) ( ON ?auto_1703850 ?auto_1703851 ) ( not ( = ?auto_1703851 ?auto_1703850 ) ) ( not ( = ?auto_1703851 ?auto_1703852 ) ) ( TRUCK-AT ?auto_1703853 ?auto_1703854 ) ( not ( = ?auto_1703854 ?auto_1703856 ) ) ( HOIST-AT ?auto_1703857 ?auto_1703854 ) ( LIFTING ?auto_1703857 ?auto_1703852 ) ( not ( = ?auto_1703855 ?auto_1703857 ) ) ( ON ?auto_1703848 ?auto_1703847 ) ( ON ?auto_1703849 ?auto_1703848 ) ( ON ?auto_1703851 ?auto_1703849 ) ( not ( = ?auto_1703847 ?auto_1703848 ) ) ( not ( = ?auto_1703847 ?auto_1703849 ) ) ( not ( = ?auto_1703847 ?auto_1703851 ) ) ( not ( = ?auto_1703847 ?auto_1703850 ) ) ( not ( = ?auto_1703847 ?auto_1703852 ) ) ( not ( = ?auto_1703848 ?auto_1703849 ) ) ( not ( = ?auto_1703848 ?auto_1703851 ) ) ( not ( = ?auto_1703848 ?auto_1703850 ) ) ( not ( = ?auto_1703848 ?auto_1703852 ) ) ( not ( = ?auto_1703849 ?auto_1703851 ) ) ( not ( = ?auto_1703849 ?auto_1703850 ) ) ( not ( = ?auto_1703849 ?auto_1703852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703851 ?auto_1703850 ?auto_1703852 )
      ( MAKE-5CRATE-VERIFY ?auto_1703847 ?auto_1703848 ?auto_1703849 ?auto_1703851 ?auto_1703850 ?auto_1703852 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1703897 - SURFACE
      ?auto_1703898 - SURFACE
      ?auto_1703899 - SURFACE
      ?auto_1703901 - SURFACE
      ?auto_1703900 - SURFACE
      ?auto_1703902 - SURFACE
    )
    :vars
    (
      ?auto_1703906 - HOIST
      ?auto_1703905 - PLACE
      ?auto_1703904 - TRUCK
      ?auto_1703907 - PLACE
      ?auto_1703903 - HOIST
      ?auto_1703908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703906 ?auto_1703905 ) ( SURFACE-AT ?auto_1703900 ?auto_1703905 ) ( CLEAR ?auto_1703900 ) ( IS-CRATE ?auto_1703902 ) ( not ( = ?auto_1703900 ?auto_1703902 ) ) ( AVAILABLE ?auto_1703906 ) ( ON ?auto_1703900 ?auto_1703901 ) ( not ( = ?auto_1703901 ?auto_1703900 ) ) ( not ( = ?auto_1703901 ?auto_1703902 ) ) ( TRUCK-AT ?auto_1703904 ?auto_1703907 ) ( not ( = ?auto_1703907 ?auto_1703905 ) ) ( HOIST-AT ?auto_1703903 ?auto_1703907 ) ( not ( = ?auto_1703906 ?auto_1703903 ) ) ( AVAILABLE ?auto_1703903 ) ( SURFACE-AT ?auto_1703902 ?auto_1703907 ) ( ON ?auto_1703902 ?auto_1703908 ) ( CLEAR ?auto_1703902 ) ( not ( = ?auto_1703900 ?auto_1703908 ) ) ( not ( = ?auto_1703902 ?auto_1703908 ) ) ( not ( = ?auto_1703901 ?auto_1703908 ) ) ( ON ?auto_1703898 ?auto_1703897 ) ( ON ?auto_1703899 ?auto_1703898 ) ( ON ?auto_1703901 ?auto_1703899 ) ( not ( = ?auto_1703897 ?auto_1703898 ) ) ( not ( = ?auto_1703897 ?auto_1703899 ) ) ( not ( = ?auto_1703897 ?auto_1703901 ) ) ( not ( = ?auto_1703897 ?auto_1703900 ) ) ( not ( = ?auto_1703897 ?auto_1703902 ) ) ( not ( = ?auto_1703897 ?auto_1703908 ) ) ( not ( = ?auto_1703898 ?auto_1703899 ) ) ( not ( = ?auto_1703898 ?auto_1703901 ) ) ( not ( = ?auto_1703898 ?auto_1703900 ) ) ( not ( = ?auto_1703898 ?auto_1703902 ) ) ( not ( = ?auto_1703898 ?auto_1703908 ) ) ( not ( = ?auto_1703899 ?auto_1703901 ) ) ( not ( = ?auto_1703899 ?auto_1703900 ) ) ( not ( = ?auto_1703899 ?auto_1703902 ) ) ( not ( = ?auto_1703899 ?auto_1703908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703901 ?auto_1703900 ?auto_1703902 )
      ( MAKE-5CRATE-VERIFY ?auto_1703897 ?auto_1703898 ?auto_1703899 ?auto_1703901 ?auto_1703900 ?auto_1703902 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1703948 - SURFACE
      ?auto_1703949 - SURFACE
      ?auto_1703950 - SURFACE
      ?auto_1703952 - SURFACE
      ?auto_1703951 - SURFACE
      ?auto_1703953 - SURFACE
    )
    :vars
    (
      ?auto_1703958 - HOIST
      ?auto_1703957 - PLACE
      ?auto_1703954 - PLACE
      ?auto_1703956 - HOIST
      ?auto_1703959 - SURFACE
      ?auto_1703955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703958 ?auto_1703957 ) ( SURFACE-AT ?auto_1703951 ?auto_1703957 ) ( CLEAR ?auto_1703951 ) ( IS-CRATE ?auto_1703953 ) ( not ( = ?auto_1703951 ?auto_1703953 ) ) ( AVAILABLE ?auto_1703958 ) ( ON ?auto_1703951 ?auto_1703952 ) ( not ( = ?auto_1703952 ?auto_1703951 ) ) ( not ( = ?auto_1703952 ?auto_1703953 ) ) ( not ( = ?auto_1703954 ?auto_1703957 ) ) ( HOIST-AT ?auto_1703956 ?auto_1703954 ) ( not ( = ?auto_1703958 ?auto_1703956 ) ) ( AVAILABLE ?auto_1703956 ) ( SURFACE-AT ?auto_1703953 ?auto_1703954 ) ( ON ?auto_1703953 ?auto_1703959 ) ( CLEAR ?auto_1703953 ) ( not ( = ?auto_1703951 ?auto_1703959 ) ) ( not ( = ?auto_1703953 ?auto_1703959 ) ) ( not ( = ?auto_1703952 ?auto_1703959 ) ) ( TRUCK-AT ?auto_1703955 ?auto_1703957 ) ( ON ?auto_1703949 ?auto_1703948 ) ( ON ?auto_1703950 ?auto_1703949 ) ( ON ?auto_1703952 ?auto_1703950 ) ( not ( = ?auto_1703948 ?auto_1703949 ) ) ( not ( = ?auto_1703948 ?auto_1703950 ) ) ( not ( = ?auto_1703948 ?auto_1703952 ) ) ( not ( = ?auto_1703948 ?auto_1703951 ) ) ( not ( = ?auto_1703948 ?auto_1703953 ) ) ( not ( = ?auto_1703948 ?auto_1703959 ) ) ( not ( = ?auto_1703949 ?auto_1703950 ) ) ( not ( = ?auto_1703949 ?auto_1703952 ) ) ( not ( = ?auto_1703949 ?auto_1703951 ) ) ( not ( = ?auto_1703949 ?auto_1703953 ) ) ( not ( = ?auto_1703949 ?auto_1703959 ) ) ( not ( = ?auto_1703950 ?auto_1703952 ) ) ( not ( = ?auto_1703950 ?auto_1703951 ) ) ( not ( = ?auto_1703950 ?auto_1703953 ) ) ( not ( = ?auto_1703950 ?auto_1703959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703952 ?auto_1703951 ?auto_1703953 )
      ( MAKE-5CRATE-VERIFY ?auto_1703948 ?auto_1703949 ?auto_1703950 ?auto_1703952 ?auto_1703951 ?auto_1703953 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1703999 - SURFACE
      ?auto_1704000 - SURFACE
      ?auto_1704001 - SURFACE
      ?auto_1704003 - SURFACE
      ?auto_1704002 - SURFACE
      ?auto_1704004 - SURFACE
    )
    :vars
    (
      ?auto_1704010 - HOIST
      ?auto_1704005 - PLACE
      ?auto_1704007 - PLACE
      ?auto_1704006 - HOIST
      ?auto_1704008 - SURFACE
      ?auto_1704009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704010 ?auto_1704005 ) ( IS-CRATE ?auto_1704004 ) ( not ( = ?auto_1704002 ?auto_1704004 ) ) ( not ( = ?auto_1704003 ?auto_1704002 ) ) ( not ( = ?auto_1704003 ?auto_1704004 ) ) ( not ( = ?auto_1704007 ?auto_1704005 ) ) ( HOIST-AT ?auto_1704006 ?auto_1704007 ) ( not ( = ?auto_1704010 ?auto_1704006 ) ) ( AVAILABLE ?auto_1704006 ) ( SURFACE-AT ?auto_1704004 ?auto_1704007 ) ( ON ?auto_1704004 ?auto_1704008 ) ( CLEAR ?auto_1704004 ) ( not ( = ?auto_1704002 ?auto_1704008 ) ) ( not ( = ?auto_1704004 ?auto_1704008 ) ) ( not ( = ?auto_1704003 ?auto_1704008 ) ) ( TRUCK-AT ?auto_1704009 ?auto_1704005 ) ( SURFACE-AT ?auto_1704003 ?auto_1704005 ) ( CLEAR ?auto_1704003 ) ( LIFTING ?auto_1704010 ?auto_1704002 ) ( IS-CRATE ?auto_1704002 ) ( ON ?auto_1704000 ?auto_1703999 ) ( ON ?auto_1704001 ?auto_1704000 ) ( ON ?auto_1704003 ?auto_1704001 ) ( not ( = ?auto_1703999 ?auto_1704000 ) ) ( not ( = ?auto_1703999 ?auto_1704001 ) ) ( not ( = ?auto_1703999 ?auto_1704003 ) ) ( not ( = ?auto_1703999 ?auto_1704002 ) ) ( not ( = ?auto_1703999 ?auto_1704004 ) ) ( not ( = ?auto_1703999 ?auto_1704008 ) ) ( not ( = ?auto_1704000 ?auto_1704001 ) ) ( not ( = ?auto_1704000 ?auto_1704003 ) ) ( not ( = ?auto_1704000 ?auto_1704002 ) ) ( not ( = ?auto_1704000 ?auto_1704004 ) ) ( not ( = ?auto_1704000 ?auto_1704008 ) ) ( not ( = ?auto_1704001 ?auto_1704003 ) ) ( not ( = ?auto_1704001 ?auto_1704002 ) ) ( not ( = ?auto_1704001 ?auto_1704004 ) ) ( not ( = ?auto_1704001 ?auto_1704008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704003 ?auto_1704002 ?auto_1704004 )
      ( MAKE-5CRATE-VERIFY ?auto_1703999 ?auto_1704000 ?auto_1704001 ?auto_1704003 ?auto_1704002 ?auto_1704004 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704050 - SURFACE
      ?auto_1704051 - SURFACE
      ?auto_1704052 - SURFACE
      ?auto_1704054 - SURFACE
      ?auto_1704053 - SURFACE
      ?auto_1704055 - SURFACE
    )
    :vars
    (
      ?auto_1704056 - HOIST
      ?auto_1704061 - PLACE
      ?auto_1704057 - PLACE
      ?auto_1704059 - HOIST
      ?auto_1704058 - SURFACE
      ?auto_1704060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704056 ?auto_1704061 ) ( IS-CRATE ?auto_1704055 ) ( not ( = ?auto_1704053 ?auto_1704055 ) ) ( not ( = ?auto_1704054 ?auto_1704053 ) ) ( not ( = ?auto_1704054 ?auto_1704055 ) ) ( not ( = ?auto_1704057 ?auto_1704061 ) ) ( HOIST-AT ?auto_1704059 ?auto_1704057 ) ( not ( = ?auto_1704056 ?auto_1704059 ) ) ( AVAILABLE ?auto_1704059 ) ( SURFACE-AT ?auto_1704055 ?auto_1704057 ) ( ON ?auto_1704055 ?auto_1704058 ) ( CLEAR ?auto_1704055 ) ( not ( = ?auto_1704053 ?auto_1704058 ) ) ( not ( = ?auto_1704055 ?auto_1704058 ) ) ( not ( = ?auto_1704054 ?auto_1704058 ) ) ( TRUCK-AT ?auto_1704060 ?auto_1704061 ) ( SURFACE-AT ?auto_1704054 ?auto_1704061 ) ( CLEAR ?auto_1704054 ) ( IS-CRATE ?auto_1704053 ) ( AVAILABLE ?auto_1704056 ) ( IN ?auto_1704053 ?auto_1704060 ) ( ON ?auto_1704051 ?auto_1704050 ) ( ON ?auto_1704052 ?auto_1704051 ) ( ON ?auto_1704054 ?auto_1704052 ) ( not ( = ?auto_1704050 ?auto_1704051 ) ) ( not ( = ?auto_1704050 ?auto_1704052 ) ) ( not ( = ?auto_1704050 ?auto_1704054 ) ) ( not ( = ?auto_1704050 ?auto_1704053 ) ) ( not ( = ?auto_1704050 ?auto_1704055 ) ) ( not ( = ?auto_1704050 ?auto_1704058 ) ) ( not ( = ?auto_1704051 ?auto_1704052 ) ) ( not ( = ?auto_1704051 ?auto_1704054 ) ) ( not ( = ?auto_1704051 ?auto_1704053 ) ) ( not ( = ?auto_1704051 ?auto_1704055 ) ) ( not ( = ?auto_1704051 ?auto_1704058 ) ) ( not ( = ?auto_1704052 ?auto_1704054 ) ) ( not ( = ?auto_1704052 ?auto_1704053 ) ) ( not ( = ?auto_1704052 ?auto_1704055 ) ) ( not ( = ?auto_1704052 ?auto_1704058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704054 ?auto_1704053 ?auto_1704055 )
      ( MAKE-5CRATE-VERIFY ?auto_1704050 ?auto_1704051 ?auto_1704052 ?auto_1704054 ?auto_1704053 ?auto_1704055 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705259 - SURFACE
      ?auto_1705260 - SURFACE
      ?auto_1705261 - SURFACE
      ?auto_1705263 - SURFACE
      ?auto_1705262 - SURFACE
      ?auto_1705264 - SURFACE
      ?auto_1705265 - SURFACE
    )
    :vars
    (
      ?auto_1705266 - HOIST
      ?auto_1705267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705266 ?auto_1705267 ) ( SURFACE-AT ?auto_1705264 ?auto_1705267 ) ( CLEAR ?auto_1705264 ) ( LIFTING ?auto_1705266 ?auto_1705265 ) ( IS-CRATE ?auto_1705265 ) ( not ( = ?auto_1705264 ?auto_1705265 ) ) ( ON ?auto_1705260 ?auto_1705259 ) ( ON ?auto_1705261 ?auto_1705260 ) ( ON ?auto_1705263 ?auto_1705261 ) ( ON ?auto_1705262 ?auto_1705263 ) ( ON ?auto_1705264 ?auto_1705262 ) ( not ( = ?auto_1705259 ?auto_1705260 ) ) ( not ( = ?auto_1705259 ?auto_1705261 ) ) ( not ( = ?auto_1705259 ?auto_1705263 ) ) ( not ( = ?auto_1705259 ?auto_1705262 ) ) ( not ( = ?auto_1705259 ?auto_1705264 ) ) ( not ( = ?auto_1705259 ?auto_1705265 ) ) ( not ( = ?auto_1705260 ?auto_1705261 ) ) ( not ( = ?auto_1705260 ?auto_1705263 ) ) ( not ( = ?auto_1705260 ?auto_1705262 ) ) ( not ( = ?auto_1705260 ?auto_1705264 ) ) ( not ( = ?auto_1705260 ?auto_1705265 ) ) ( not ( = ?auto_1705261 ?auto_1705263 ) ) ( not ( = ?auto_1705261 ?auto_1705262 ) ) ( not ( = ?auto_1705261 ?auto_1705264 ) ) ( not ( = ?auto_1705261 ?auto_1705265 ) ) ( not ( = ?auto_1705263 ?auto_1705262 ) ) ( not ( = ?auto_1705263 ?auto_1705264 ) ) ( not ( = ?auto_1705263 ?auto_1705265 ) ) ( not ( = ?auto_1705262 ?auto_1705264 ) ) ( not ( = ?auto_1705262 ?auto_1705265 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1705264 ?auto_1705265 )
      ( MAKE-6CRATE-VERIFY ?auto_1705259 ?auto_1705260 ?auto_1705261 ?auto_1705263 ?auto_1705262 ?auto_1705264 ?auto_1705265 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705303 - SURFACE
      ?auto_1705304 - SURFACE
      ?auto_1705305 - SURFACE
      ?auto_1705307 - SURFACE
      ?auto_1705306 - SURFACE
      ?auto_1705308 - SURFACE
      ?auto_1705309 - SURFACE
    )
    :vars
    (
      ?auto_1705312 - HOIST
      ?auto_1705311 - PLACE
      ?auto_1705310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705312 ?auto_1705311 ) ( SURFACE-AT ?auto_1705308 ?auto_1705311 ) ( CLEAR ?auto_1705308 ) ( IS-CRATE ?auto_1705309 ) ( not ( = ?auto_1705308 ?auto_1705309 ) ) ( TRUCK-AT ?auto_1705310 ?auto_1705311 ) ( AVAILABLE ?auto_1705312 ) ( IN ?auto_1705309 ?auto_1705310 ) ( ON ?auto_1705308 ?auto_1705306 ) ( not ( = ?auto_1705306 ?auto_1705308 ) ) ( not ( = ?auto_1705306 ?auto_1705309 ) ) ( ON ?auto_1705304 ?auto_1705303 ) ( ON ?auto_1705305 ?auto_1705304 ) ( ON ?auto_1705307 ?auto_1705305 ) ( ON ?auto_1705306 ?auto_1705307 ) ( not ( = ?auto_1705303 ?auto_1705304 ) ) ( not ( = ?auto_1705303 ?auto_1705305 ) ) ( not ( = ?auto_1705303 ?auto_1705307 ) ) ( not ( = ?auto_1705303 ?auto_1705306 ) ) ( not ( = ?auto_1705303 ?auto_1705308 ) ) ( not ( = ?auto_1705303 ?auto_1705309 ) ) ( not ( = ?auto_1705304 ?auto_1705305 ) ) ( not ( = ?auto_1705304 ?auto_1705307 ) ) ( not ( = ?auto_1705304 ?auto_1705306 ) ) ( not ( = ?auto_1705304 ?auto_1705308 ) ) ( not ( = ?auto_1705304 ?auto_1705309 ) ) ( not ( = ?auto_1705305 ?auto_1705307 ) ) ( not ( = ?auto_1705305 ?auto_1705306 ) ) ( not ( = ?auto_1705305 ?auto_1705308 ) ) ( not ( = ?auto_1705305 ?auto_1705309 ) ) ( not ( = ?auto_1705307 ?auto_1705306 ) ) ( not ( = ?auto_1705307 ?auto_1705308 ) ) ( not ( = ?auto_1705307 ?auto_1705309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1705306 ?auto_1705308 ?auto_1705309 )
      ( MAKE-6CRATE-VERIFY ?auto_1705303 ?auto_1705304 ?auto_1705305 ?auto_1705307 ?auto_1705306 ?auto_1705308 ?auto_1705309 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705354 - SURFACE
      ?auto_1705355 - SURFACE
      ?auto_1705356 - SURFACE
      ?auto_1705358 - SURFACE
      ?auto_1705357 - SURFACE
      ?auto_1705359 - SURFACE
      ?auto_1705360 - SURFACE
    )
    :vars
    (
      ?auto_1705363 - HOIST
      ?auto_1705362 - PLACE
      ?auto_1705361 - TRUCK
      ?auto_1705364 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705363 ?auto_1705362 ) ( SURFACE-AT ?auto_1705359 ?auto_1705362 ) ( CLEAR ?auto_1705359 ) ( IS-CRATE ?auto_1705360 ) ( not ( = ?auto_1705359 ?auto_1705360 ) ) ( AVAILABLE ?auto_1705363 ) ( IN ?auto_1705360 ?auto_1705361 ) ( ON ?auto_1705359 ?auto_1705357 ) ( not ( = ?auto_1705357 ?auto_1705359 ) ) ( not ( = ?auto_1705357 ?auto_1705360 ) ) ( TRUCK-AT ?auto_1705361 ?auto_1705364 ) ( not ( = ?auto_1705364 ?auto_1705362 ) ) ( ON ?auto_1705355 ?auto_1705354 ) ( ON ?auto_1705356 ?auto_1705355 ) ( ON ?auto_1705358 ?auto_1705356 ) ( ON ?auto_1705357 ?auto_1705358 ) ( not ( = ?auto_1705354 ?auto_1705355 ) ) ( not ( = ?auto_1705354 ?auto_1705356 ) ) ( not ( = ?auto_1705354 ?auto_1705358 ) ) ( not ( = ?auto_1705354 ?auto_1705357 ) ) ( not ( = ?auto_1705354 ?auto_1705359 ) ) ( not ( = ?auto_1705354 ?auto_1705360 ) ) ( not ( = ?auto_1705355 ?auto_1705356 ) ) ( not ( = ?auto_1705355 ?auto_1705358 ) ) ( not ( = ?auto_1705355 ?auto_1705357 ) ) ( not ( = ?auto_1705355 ?auto_1705359 ) ) ( not ( = ?auto_1705355 ?auto_1705360 ) ) ( not ( = ?auto_1705356 ?auto_1705358 ) ) ( not ( = ?auto_1705356 ?auto_1705357 ) ) ( not ( = ?auto_1705356 ?auto_1705359 ) ) ( not ( = ?auto_1705356 ?auto_1705360 ) ) ( not ( = ?auto_1705358 ?auto_1705357 ) ) ( not ( = ?auto_1705358 ?auto_1705359 ) ) ( not ( = ?auto_1705358 ?auto_1705360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1705357 ?auto_1705359 ?auto_1705360 )
      ( MAKE-6CRATE-VERIFY ?auto_1705354 ?auto_1705355 ?auto_1705356 ?auto_1705358 ?auto_1705357 ?auto_1705359 ?auto_1705360 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705411 - SURFACE
      ?auto_1705412 - SURFACE
      ?auto_1705413 - SURFACE
      ?auto_1705415 - SURFACE
      ?auto_1705414 - SURFACE
      ?auto_1705416 - SURFACE
      ?auto_1705417 - SURFACE
    )
    :vars
    (
      ?auto_1705421 - HOIST
      ?auto_1705419 - PLACE
      ?auto_1705422 - TRUCK
      ?auto_1705420 - PLACE
      ?auto_1705418 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705421 ?auto_1705419 ) ( SURFACE-AT ?auto_1705416 ?auto_1705419 ) ( CLEAR ?auto_1705416 ) ( IS-CRATE ?auto_1705417 ) ( not ( = ?auto_1705416 ?auto_1705417 ) ) ( AVAILABLE ?auto_1705421 ) ( ON ?auto_1705416 ?auto_1705414 ) ( not ( = ?auto_1705414 ?auto_1705416 ) ) ( not ( = ?auto_1705414 ?auto_1705417 ) ) ( TRUCK-AT ?auto_1705422 ?auto_1705420 ) ( not ( = ?auto_1705420 ?auto_1705419 ) ) ( HOIST-AT ?auto_1705418 ?auto_1705420 ) ( LIFTING ?auto_1705418 ?auto_1705417 ) ( not ( = ?auto_1705421 ?auto_1705418 ) ) ( ON ?auto_1705412 ?auto_1705411 ) ( ON ?auto_1705413 ?auto_1705412 ) ( ON ?auto_1705415 ?auto_1705413 ) ( ON ?auto_1705414 ?auto_1705415 ) ( not ( = ?auto_1705411 ?auto_1705412 ) ) ( not ( = ?auto_1705411 ?auto_1705413 ) ) ( not ( = ?auto_1705411 ?auto_1705415 ) ) ( not ( = ?auto_1705411 ?auto_1705414 ) ) ( not ( = ?auto_1705411 ?auto_1705416 ) ) ( not ( = ?auto_1705411 ?auto_1705417 ) ) ( not ( = ?auto_1705412 ?auto_1705413 ) ) ( not ( = ?auto_1705412 ?auto_1705415 ) ) ( not ( = ?auto_1705412 ?auto_1705414 ) ) ( not ( = ?auto_1705412 ?auto_1705416 ) ) ( not ( = ?auto_1705412 ?auto_1705417 ) ) ( not ( = ?auto_1705413 ?auto_1705415 ) ) ( not ( = ?auto_1705413 ?auto_1705414 ) ) ( not ( = ?auto_1705413 ?auto_1705416 ) ) ( not ( = ?auto_1705413 ?auto_1705417 ) ) ( not ( = ?auto_1705415 ?auto_1705414 ) ) ( not ( = ?auto_1705415 ?auto_1705416 ) ) ( not ( = ?auto_1705415 ?auto_1705417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1705414 ?auto_1705416 ?auto_1705417 )
      ( MAKE-6CRATE-VERIFY ?auto_1705411 ?auto_1705412 ?auto_1705413 ?auto_1705415 ?auto_1705414 ?auto_1705416 ?auto_1705417 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705474 - SURFACE
      ?auto_1705475 - SURFACE
      ?auto_1705476 - SURFACE
      ?auto_1705478 - SURFACE
      ?auto_1705477 - SURFACE
      ?auto_1705479 - SURFACE
      ?auto_1705480 - SURFACE
    )
    :vars
    (
      ?auto_1705482 - HOIST
      ?auto_1705485 - PLACE
      ?auto_1705486 - TRUCK
      ?auto_1705483 - PLACE
      ?auto_1705481 - HOIST
      ?auto_1705484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705482 ?auto_1705485 ) ( SURFACE-AT ?auto_1705479 ?auto_1705485 ) ( CLEAR ?auto_1705479 ) ( IS-CRATE ?auto_1705480 ) ( not ( = ?auto_1705479 ?auto_1705480 ) ) ( AVAILABLE ?auto_1705482 ) ( ON ?auto_1705479 ?auto_1705477 ) ( not ( = ?auto_1705477 ?auto_1705479 ) ) ( not ( = ?auto_1705477 ?auto_1705480 ) ) ( TRUCK-AT ?auto_1705486 ?auto_1705483 ) ( not ( = ?auto_1705483 ?auto_1705485 ) ) ( HOIST-AT ?auto_1705481 ?auto_1705483 ) ( not ( = ?auto_1705482 ?auto_1705481 ) ) ( AVAILABLE ?auto_1705481 ) ( SURFACE-AT ?auto_1705480 ?auto_1705483 ) ( ON ?auto_1705480 ?auto_1705484 ) ( CLEAR ?auto_1705480 ) ( not ( = ?auto_1705479 ?auto_1705484 ) ) ( not ( = ?auto_1705480 ?auto_1705484 ) ) ( not ( = ?auto_1705477 ?auto_1705484 ) ) ( ON ?auto_1705475 ?auto_1705474 ) ( ON ?auto_1705476 ?auto_1705475 ) ( ON ?auto_1705478 ?auto_1705476 ) ( ON ?auto_1705477 ?auto_1705478 ) ( not ( = ?auto_1705474 ?auto_1705475 ) ) ( not ( = ?auto_1705474 ?auto_1705476 ) ) ( not ( = ?auto_1705474 ?auto_1705478 ) ) ( not ( = ?auto_1705474 ?auto_1705477 ) ) ( not ( = ?auto_1705474 ?auto_1705479 ) ) ( not ( = ?auto_1705474 ?auto_1705480 ) ) ( not ( = ?auto_1705474 ?auto_1705484 ) ) ( not ( = ?auto_1705475 ?auto_1705476 ) ) ( not ( = ?auto_1705475 ?auto_1705478 ) ) ( not ( = ?auto_1705475 ?auto_1705477 ) ) ( not ( = ?auto_1705475 ?auto_1705479 ) ) ( not ( = ?auto_1705475 ?auto_1705480 ) ) ( not ( = ?auto_1705475 ?auto_1705484 ) ) ( not ( = ?auto_1705476 ?auto_1705478 ) ) ( not ( = ?auto_1705476 ?auto_1705477 ) ) ( not ( = ?auto_1705476 ?auto_1705479 ) ) ( not ( = ?auto_1705476 ?auto_1705480 ) ) ( not ( = ?auto_1705476 ?auto_1705484 ) ) ( not ( = ?auto_1705478 ?auto_1705477 ) ) ( not ( = ?auto_1705478 ?auto_1705479 ) ) ( not ( = ?auto_1705478 ?auto_1705480 ) ) ( not ( = ?auto_1705478 ?auto_1705484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1705477 ?auto_1705479 ?auto_1705480 )
      ( MAKE-6CRATE-VERIFY ?auto_1705474 ?auto_1705475 ?auto_1705476 ?auto_1705478 ?auto_1705477 ?auto_1705479 ?auto_1705480 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705538 - SURFACE
      ?auto_1705539 - SURFACE
      ?auto_1705540 - SURFACE
      ?auto_1705542 - SURFACE
      ?auto_1705541 - SURFACE
      ?auto_1705543 - SURFACE
      ?auto_1705544 - SURFACE
    )
    :vars
    (
      ?auto_1705550 - HOIST
      ?auto_1705549 - PLACE
      ?auto_1705547 - PLACE
      ?auto_1705545 - HOIST
      ?auto_1705548 - SURFACE
      ?auto_1705546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705550 ?auto_1705549 ) ( SURFACE-AT ?auto_1705543 ?auto_1705549 ) ( CLEAR ?auto_1705543 ) ( IS-CRATE ?auto_1705544 ) ( not ( = ?auto_1705543 ?auto_1705544 ) ) ( AVAILABLE ?auto_1705550 ) ( ON ?auto_1705543 ?auto_1705541 ) ( not ( = ?auto_1705541 ?auto_1705543 ) ) ( not ( = ?auto_1705541 ?auto_1705544 ) ) ( not ( = ?auto_1705547 ?auto_1705549 ) ) ( HOIST-AT ?auto_1705545 ?auto_1705547 ) ( not ( = ?auto_1705550 ?auto_1705545 ) ) ( AVAILABLE ?auto_1705545 ) ( SURFACE-AT ?auto_1705544 ?auto_1705547 ) ( ON ?auto_1705544 ?auto_1705548 ) ( CLEAR ?auto_1705544 ) ( not ( = ?auto_1705543 ?auto_1705548 ) ) ( not ( = ?auto_1705544 ?auto_1705548 ) ) ( not ( = ?auto_1705541 ?auto_1705548 ) ) ( TRUCK-AT ?auto_1705546 ?auto_1705549 ) ( ON ?auto_1705539 ?auto_1705538 ) ( ON ?auto_1705540 ?auto_1705539 ) ( ON ?auto_1705542 ?auto_1705540 ) ( ON ?auto_1705541 ?auto_1705542 ) ( not ( = ?auto_1705538 ?auto_1705539 ) ) ( not ( = ?auto_1705538 ?auto_1705540 ) ) ( not ( = ?auto_1705538 ?auto_1705542 ) ) ( not ( = ?auto_1705538 ?auto_1705541 ) ) ( not ( = ?auto_1705538 ?auto_1705543 ) ) ( not ( = ?auto_1705538 ?auto_1705544 ) ) ( not ( = ?auto_1705538 ?auto_1705548 ) ) ( not ( = ?auto_1705539 ?auto_1705540 ) ) ( not ( = ?auto_1705539 ?auto_1705542 ) ) ( not ( = ?auto_1705539 ?auto_1705541 ) ) ( not ( = ?auto_1705539 ?auto_1705543 ) ) ( not ( = ?auto_1705539 ?auto_1705544 ) ) ( not ( = ?auto_1705539 ?auto_1705548 ) ) ( not ( = ?auto_1705540 ?auto_1705542 ) ) ( not ( = ?auto_1705540 ?auto_1705541 ) ) ( not ( = ?auto_1705540 ?auto_1705543 ) ) ( not ( = ?auto_1705540 ?auto_1705544 ) ) ( not ( = ?auto_1705540 ?auto_1705548 ) ) ( not ( = ?auto_1705542 ?auto_1705541 ) ) ( not ( = ?auto_1705542 ?auto_1705543 ) ) ( not ( = ?auto_1705542 ?auto_1705544 ) ) ( not ( = ?auto_1705542 ?auto_1705548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1705541 ?auto_1705543 ?auto_1705544 )
      ( MAKE-6CRATE-VERIFY ?auto_1705538 ?auto_1705539 ?auto_1705540 ?auto_1705542 ?auto_1705541 ?auto_1705543 ?auto_1705544 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705602 - SURFACE
      ?auto_1705603 - SURFACE
      ?auto_1705604 - SURFACE
      ?auto_1705606 - SURFACE
      ?auto_1705605 - SURFACE
      ?auto_1705607 - SURFACE
      ?auto_1705608 - SURFACE
    )
    :vars
    (
      ?auto_1705609 - HOIST
      ?auto_1705614 - PLACE
      ?auto_1705610 - PLACE
      ?auto_1705612 - HOIST
      ?auto_1705611 - SURFACE
      ?auto_1705613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705609 ?auto_1705614 ) ( IS-CRATE ?auto_1705608 ) ( not ( = ?auto_1705607 ?auto_1705608 ) ) ( not ( = ?auto_1705605 ?auto_1705607 ) ) ( not ( = ?auto_1705605 ?auto_1705608 ) ) ( not ( = ?auto_1705610 ?auto_1705614 ) ) ( HOIST-AT ?auto_1705612 ?auto_1705610 ) ( not ( = ?auto_1705609 ?auto_1705612 ) ) ( AVAILABLE ?auto_1705612 ) ( SURFACE-AT ?auto_1705608 ?auto_1705610 ) ( ON ?auto_1705608 ?auto_1705611 ) ( CLEAR ?auto_1705608 ) ( not ( = ?auto_1705607 ?auto_1705611 ) ) ( not ( = ?auto_1705608 ?auto_1705611 ) ) ( not ( = ?auto_1705605 ?auto_1705611 ) ) ( TRUCK-AT ?auto_1705613 ?auto_1705614 ) ( SURFACE-AT ?auto_1705605 ?auto_1705614 ) ( CLEAR ?auto_1705605 ) ( LIFTING ?auto_1705609 ?auto_1705607 ) ( IS-CRATE ?auto_1705607 ) ( ON ?auto_1705603 ?auto_1705602 ) ( ON ?auto_1705604 ?auto_1705603 ) ( ON ?auto_1705606 ?auto_1705604 ) ( ON ?auto_1705605 ?auto_1705606 ) ( not ( = ?auto_1705602 ?auto_1705603 ) ) ( not ( = ?auto_1705602 ?auto_1705604 ) ) ( not ( = ?auto_1705602 ?auto_1705606 ) ) ( not ( = ?auto_1705602 ?auto_1705605 ) ) ( not ( = ?auto_1705602 ?auto_1705607 ) ) ( not ( = ?auto_1705602 ?auto_1705608 ) ) ( not ( = ?auto_1705602 ?auto_1705611 ) ) ( not ( = ?auto_1705603 ?auto_1705604 ) ) ( not ( = ?auto_1705603 ?auto_1705606 ) ) ( not ( = ?auto_1705603 ?auto_1705605 ) ) ( not ( = ?auto_1705603 ?auto_1705607 ) ) ( not ( = ?auto_1705603 ?auto_1705608 ) ) ( not ( = ?auto_1705603 ?auto_1705611 ) ) ( not ( = ?auto_1705604 ?auto_1705606 ) ) ( not ( = ?auto_1705604 ?auto_1705605 ) ) ( not ( = ?auto_1705604 ?auto_1705607 ) ) ( not ( = ?auto_1705604 ?auto_1705608 ) ) ( not ( = ?auto_1705604 ?auto_1705611 ) ) ( not ( = ?auto_1705606 ?auto_1705605 ) ) ( not ( = ?auto_1705606 ?auto_1705607 ) ) ( not ( = ?auto_1705606 ?auto_1705608 ) ) ( not ( = ?auto_1705606 ?auto_1705611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1705605 ?auto_1705607 ?auto_1705608 )
      ( MAKE-6CRATE-VERIFY ?auto_1705602 ?auto_1705603 ?auto_1705604 ?auto_1705606 ?auto_1705605 ?auto_1705607 ?auto_1705608 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1705666 - SURFACE
      ?auto_1705667 - SURFACE
      ?auto_1705668 - SURFACE
      ?auto_1705670 - SURFACE
      ?auto_1705669 - SURFACE
      ?auto_1705671 - SURFACE
      ?auto_1705672 - SURFACE
    )
    :vars
    (
      ?auto_1705676 - HOIST
      ?auto_1705673 - PLACE
      ?auto_1705678 - PLACE
      ?auto_1705674 - HOIST
      ?auto_1705677 - SURFACE
      ?auto_1705675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705676 ?auto_1705673 ) ( IS-CRATE ?auto_1705672 ) ( not ( = ?auto_1705671 ?auto_1705672 ) ) ( not ( = ?auto_1705669 ?auto_1705671 ) ) ( not ( = ?auto_1705669 ?auto_1705672 ) ) ( not ( = ?auto_1705678 ?auto_1705673 ) ) ( HOIST-AT ?auto_1705674 ?auto_1705678 ) ( not ( = ?auto_1705676 ?auto_1705674 ) ) ( AVAILABLE ?auto_1705674 ) ( SURFACE-AT ?auto_1705672 ?auto_1705678 ) ( ON ?auto_1705672 ?auto_1705677 ) ( CLEAR ?auto_1705672 ) ( not ( = ?auto_1705671 ?auto_1705677 ) ) ( not ( = ?auto_1705672 ?auto_1705677 ) ) ( not ( = ?auto_1705669 ?auto_1705677 ) ) ( TRUCK-AT ?auto_1705675 ?auto_1705673 ) ( SURFACE-AT ?auto_1705669 ?auto_1705673 ) ( CLEAR ?auto_1705669 ) ( IS-CRATE ?auto_1705671 ) ( AVAILABLE ?auto_1705676 ) ( IN ?auto_1705671 ?auto_1705675 ) ( ON ?auto_1705667 ?auto_1705666 ) ( ON ?auto_1705668 ?auto_1705667 ) ( ON ?auto_1705670 ?auto_1705668 ) ( ON ?auto_1705669 ?auto_1705670 ) ( not ( = ?auto_1705666 ?auto_1705667 ) ) ( not ( = ?auto_1705666 ?auto_1705668 ) ) ( not ( = ?auto_1705666 ?auto_1705670 ) ) ( not ( = ?auto_1705666 ?auto_1705669 ) ) ( not ( = ?auto_1705666 ?auto_1705671 ) ) ( not ( = ?auto_1705666 ?auto_1705672 ) ) ( not ( = ?auto_1705666 ?auto_1705677 ) ) ( not ( = ?auto_1705667 ?auto_1705668 ) ) ( not ( = ?auto_1705667 ?auto_1705670 ) ) ( not ( = ?auto_1705667 ?auto_1705669 ) ) ( not ( = ?auto_1705667 ?auto_1705671 ) ) ( not ( = ?auto_1705667 ?auto_1705672 ) ) ( not ( = ?auto_1705667 ?auto_1705677 ) ) ( not ( = ?auto_1705668 ?auto_1705670 ) ) ( not ( = ?auto_1705668 ?auto_1705669 ) ) ( not ( = ?auto_1705668 ?auto_1705671 ) ) ( not ( = ?auto_1705668 ?auto_1705672 ) ) ( not ( = ?auto_1705668 ?auto_1705677 ) ) ( not ( = ?auto_1705670 ?auto_1705669 ) ) ( not ( = ?auto_1705670 ?auto_1705671 ) ) ( not ( = ?auto_1705670 ?auto_1705672 ) ) ( not ( = ?auto_1705670 ?auto_1705677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1705669 ?auto_1705671 ?auto_1705672 )
      ( MAKE-6CRATE-VERIFY ?auto_1705666 ?auto_1705667 ?auto_1705668 ?auto_1705670 ?auto_1705669 ?auto_1705671 ?auto_1705672 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1707622 - SURFACE
      ?auto_1707623 - SURFACE
      ?auto_1707624 - SURFACE
      ?auto_1707626 - SURFACE
      ?auto_1707625 - SURFACE
      ?auto_1707627 - SURFACE
      ?auto_1707628 - SURFACE
      ?auto_1707629 - SURFACE
    )
    :vars
    (
      ?auto_1707630 - HOIST
      ?auto_1707631 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1707630 ?auto_1707631 ) ( SURFACE-AT ?auto_1707628 ?auto_1707631 ) ( CLEAR ?auto_1707628 ) ( LIFTING ?auto_1707630 ?auto_1707629 ) ( IS-CRATE ?auto_1707629 ) ( not ( = ?auto_1707628 ?auto_1707629 ) ) ( ON ?auto_1707623 ?auto_1707622 ) ( ON ?auto_1707624 ?auto_1707623 ) ( ON ?auto_1707626 ?auto_1707624 ) ( ON ?auto_1707625 ?auto_1707626 ) ( ON ?auto_1707627 ?auto_1707625 ) ( ON ?auto_1707628 ?auto_1707627 ) ( not ( = ?auto_1707622 ?auto_1707623 ) ) ( not ( = ?auto_1707622 ?auto_1707624 ) ) ( not ( = ?auto_1707622 ?auto_1707626 ) ) ( not ( = ?auto_1707622 ?auto_1707625 ) ) ( not ( = ?auto_1707622 ?auto_1707627 ) ) ( not ( = ?auto_1707622 ?auto_1707628 ) ) ( not ( = ?auto_1707622 ?auto_1707629 ) ) ( not ( = ?auto_1707623 ?auto_1707624 ) ) ( not ( = ?auto_1707623 ?auto_1707626 ) ) ( not ( = ?auto_1707623 ?auto_1707625 ) ) ( not ( = ?auto_1707623 ?auto_1707627 ) ) ( not ( = ?auto_1707623 ?auto_1707628 ) ) ( not ( = ?auto_1707623 ?auto_1707629 ) ) ( not ( = ?auto_1707624 ?auto_1707626 ) ) ( not ( = ?auto_1707624 ?auto_1707625 ) ) ( not ( = ?auto_1707624 ?auto_1707627 ) ) ( not ( = ?auto_1707624 ?auto_1707628 ) ) ( not ( = ?auto_1707624 ?auto_1707629 ) ) ( not ( = ?auto_1707626 ?auto_1707625 ) ) ( not ( = ?auto_1707626 ?auto_1707627 ) ) ( not ( = ?auto_1707626 ?auto_1707628 ) ) ( not ( = ?auto_1707626 ?auto_1707629 ) ) ( not ( = ?auto_1707625 ?auto_1707627 ) ) ( not ( = ?auto_1707625 ?auto_1707628 ) ) ( not ( = ?auto_1707625 ?auto_1707629 ) ) ( not ( = ?auto_1707627 ?auto_1707628 ) ) ( not ( = ?auto_1707627 ?auto_1707629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1707628 ?auto_1707629 )
      ( MAKE-7CRATE-VERIFY ?auto_1707622 ?auto_1707623 ?auto_1707624 ?auto_1707626 ?auto_1707625 ?auto_1707627 ?auto_1707628 ?auto_1707629 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1707677 - SURFACE
      ?auto_1707678 - SURFACE
      ?auto_1707679 - SURFACE
      ?auto_1707681 - SURFACE
      ?auto_1707680 - SURFACE
      ?auto_1707682 - SURFACE
      ?auto_1707683 - SURFACE
      ?auto_1707684 - SURFACE
    )
    :vars
    (
      ?auto_1707686 - HOIST
      ?auto_1707687 - PLACE
      ?auto_1707685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1707686 ?auto_1707687 ) ( SURFACE-AT ?auto_1707683 ?auto_1707687 ) ( CLEAR ?auto_1707683 ) ( IS-CRATE ?auto_1707684 ) ( not ( = ?auto_1707683 ?auto_1707684 ) ) ( TRUCK-AT ?auto_1707685 ?auto_1707687 ) ( AVAILABLE ?auto_1707686 ) ( IN ?auto_1707684 ?auto_1707685 ) ( ON ?auto_1707683 ?auto_1707682 ) ( not ( = ?auto_1707682 ?auto_1707683 ) ) ( not ( = ?auto_1707682 ?auto_1707684 ) ) ( ON ?auto_1707678 ?auto_1707677 ) ( ON ?auto_1707679 ?auto_1707678 ) ( ON ?auto_1707681 ?auto_1707679 ) ( ON ?auto_1707680 ?auto_1707681 ) ( ON ?auto_1707682 ?auto_1707680 ) ( not ( = ?auto_1707677 ?auto_1707678 ) ) ( not ( = ?auto_1707677 ?auto_1707679 ) ) ( not ( = ?auto_1707677 ?auto_1707681 ) ) ( not ( = ?auto_1707677 ?auto_1707680 ) ) ( not ( = ?auto_1707677 ?auto_1707682 ) ) ( not ( = ?auto_1707677 ?auto_1707683 ) ) ( not ( = ?auto_1707677 ?auto_1707684 ) ) ( not ( = ?auto_1707678 ?auto_1707679 ) ) ( not ( = ?auto_1707678 ?auto_1707681 ) ) ( not ( = ?auto_1707678 ?auto_1707680 ) ) ( not ( = ?auto_1707678 ?auto_1707682 ) ) ( not ( = ?auto_1707678 ?auto_1707683 ) ) ( not ( = ?auto_1707678 ?auto_1707684 ) ) ( not ( = ?auto_1707679 ?auto_1707681 ) ) ( not ( = ?auto_1707679 ?auto_1707680 ) ) ( not ( = ?auto_1707679 ?auto_1707682 ) ) ( not ( = ?auto_1707679 ?auto_1707683 ) ) ( not ( = ?auto_1707679 ?auto_1707684 ) ) ( not ( = ?auto_1707681 ?auto_1707680 ) ) ( not ( = ?auto_1707681 ?auto_1707682 ) ) ( not ( = ?auto_1707681 ?auto_1707683 ) ) ( not ( = ?auto_1707681 ?auto_1707684 ) ) ( not ( = ?auto_1707680 ?auto_1707682 ) ) ( not ( = ?auto_1707680 ?auto_1707683 ) ) ( not ( = ?auto_1707680 ?auto_1707684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1707682 ?auto_1707683 ?auto_1707684 )
      ( MAKE-7CRATE-VERIFY ?auto_1707677 ?auto_1707678 ?auto_1707679 ?auto_1707681 ?auto_1707680 ?auto_1707682 ?auto_1707683 ?auto_1707684 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1707740 - SURFACE
      ?auto_1707741 - SURFACE
      ?auto_1707742 - SURFACE
      ?auto_1707744 - SURFACE
      ?auto_1707743 - SURFACE
      ?auto_1707745 - SURFACE
      ?auto_1707746 - SURFACE
      ?auto_1707747 - SURFACE
    )
    :vars
    (
      ?auto_1707748 - HOIST
      ?auto_1707749 - PLACE
      ?auto_1707751 - TRUCK
      ?auto_1707750 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1707748 ?auto_1707749 ) ( SURFACE-AT ?auto_1707746 ?auto_1707749 ) ( CLEAR ?auto_1707746 ) ( IS-CRATE ?auto_1707747 ) ( not ( = ?auto_1707746 ?auto_1707747 ) ) ( AVAILABLE ?auto_1707748 ) ( IN ?auto_1707747 ?auto_1707751 ) ( ON ?auto_1707746 ?auto_1707745 ) ( not ( = ?auto_1707745 ?auto_1707746 ) ) ( not ( = ?auto_1707745 ?auto_1707747 ) ) ( TRUCK-AT ?auto_1707751 ?auto_1707750 ) ( not ( = ?auto_1707750 ?auto_1707749 ) ) ( ON ?auto_1707741 ?auto_1707740 ) ( ON ?auto_1707742 ?auto_1707741 ) ( ON ?auto_1707744 ?auto_1707742 ) ( ON ?auto_1707743 ?auto_1707744 ) ( ON ?auto_1707745 ?auto_1707743 ) ( not ( = ?auto_1707740 ?auto_1707741 ) ) ( not ( = ?auto_1707740 ?auto_1707742 ) ) ( not ( = ?auto_1707740 ?auto_1707744 ) ) ( not ( = ?auto_1707740 ?auto_1707743 ) ) ( not ( = ?auto_1707740 ?auto_1707745 ) ) ( not ( = ?auto_1707740 ?auto_1707746 ) ) ( not ( = ?auto_1707740 ?auto_1707747 ) ) ( not ( = ?auto_1707741 ?auto_1707742 ) ) ( not ( = ?auto_1707741 ?auto_1707744 ) ) ( not ( = ?auto_1707741 ?auto_1707743 ) ) ( not ( = ?auto_1707741 ?auto_1707745 ) ) ( not ( = ?auto_1707741 ?auto_1707746 ) ) ( not ( = ?auto_1707741 ?auto_1707747 ) ) ( not ( = ?auto_1707742 ?auto_1707744 ) ) ( not ( = ?auto_1707742 ?auto_1707743 ) ) ( not ( = ?auto_1707742 ?auto_1707745 ) ) ( not ( = ?auto_1707742 ?auto_1707746 ) ) ( not ( = ?auto_1707742 ?auto_1707747 ) ) ( not ( = ?auto_1707744 ?auto_1707743 ) ) ( not ( = ?auto_1707744 ?auto_1707745 ) ) ( not ( = ?auto_1707744 ?auto_1707746 ) ) ( not ( = ?auto_1707744 ?auto_1707747 ) ) ( not ( = ?auto_1707743 ?auto_1707745 ) ) ( not ( = ?auto_1707743 ?auto_1707746 ) ) ( not ( = ?auto_1707743 ?auto_1707747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1707745 ?auto_1707746 ?auto_1707747 )
      ( MAKE-7CRATE-VERIFY ?auto_1707740 ?auto_1707741 ?auto_1707742 ?auto_1707744 ?auto_1707743 ?auto_1707745 ?auto_1707746 ?auto_1707747 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1707810 - SURFACE
      ?auto_1707811 - SURFACE
      ?auto_1707812 - SURFACE
      ?auto_1707814 - SURFACE
      ?auto_1707813 - SURFACE
      ?auto_1707815 - SURFACE
      ?auto_1707816 - SURFACE
      ?auto_1707817 - SURFACE
    )
    :vars
    (
      ?auto_1707820 - HOIST
      ?auto_1707818 - PLACE
      ?auto_1707821 - TRUCK
      ?auto_1707822 - PLACE
      ?auto_1707819 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1707820 ?auto_1707818 ) ( SURFACE-AT ?auto_1707816 ?auto_1707818 ) ( CLEAR ?auto_1707816 ) ( IS-CRATE ?auto_1707817 ) ( not ( = ?auto_1707816 ?auto_1707817 ) ) ( AVAILABLE ?auto_1707820 ) ( ON ?auto_1707816 ?auto_1707815 ) ( not ( = ?auto_1707815 ?auto_1707816 ) ) ( not ( = ?auto_1707815 ?auto_1707817 ) ) ( TRUCK-AT ?auto_1707821 ?auto_1707822 ) ( not ( = ?auto_1707822 ?auto_1707818 ) ) ( HOIST-AT ?auto_1707819 ?auto_1707822 ) ( LIFTING ?auto_1707819 ?auto_1707817 ) ( not ( = ?auto_1707820 ?auto_1707819 ) ) ( ON ?auto_1707811 ?auto_1707810 ) ( ON ?auto_1707812 ?auto_1707811 ) ( ON ?auto_1707814 ?auto_1707812 ) ( ON ?auto_1707813 ?auto_1707814 ) ( ON ?auto_1707815 ?auto_1707813 ) ( not ( = ?auto_1707810 ?auto_1707811 ) ) ( not ( = ?auto_1707810 ?auto_1707812 ) ) ( not ( = ?auto_1707810 ?auto_1707814 ) ) ( not ( = ?auto_1707810 ?auto_1707813 ) ) ( not ( = ?auto_1707810 ?auto_1707815 ) ) ( not ( = ?auto_1707810 ?auto_1707816 ) ) ( not ( = ?auto_1707810 ?auto_1707817 ) ) ( not ( = ?auto_1707811 ?auto_1707812 ) ) ( not ( = ?auto_1707811 ?auto_1707814 ) ) ( not ( = ?auto_1707811 ?auto_1707813 ) ) ( not ( = ?auto_1707811 ?auto_1707815 ) ) ( not ( = ?auto_1707811 ?auto_1707816 ) ) ( not ( = ?auto_1707811 ?auto_1707817 ) ) ( not ( = ?auto_1707812 ?auto_1707814 ) ) ( not ( = ?auto_1707812 ?auto_1707813 ) ) ( not ( = ?auto_1707812 ?auto_1707815 ) ) ( not ( = ?auto_1707812 ?auto_1707816 ) ) ( not ( = ?auto_1707812 ?auto_1707817 ) ) ( not ( = ?auto_1707814 ?auto_1707813 ) ) ( not ( = ?auto_1707814 ?auto_1707815 ) ) ( not ( = ?auto_1707814 ?auto_1707816 ) ) ( not ( = ?auto_1707814 ?auto_1707817 ) ) ( not ( = ?auto_1707813 ?auto_1707815 ) ) ( not ( = ?auto_1707813 ?auto_1707816 ) ) ( not ( = ?auto_1707813 ?auto_1707817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1707815 ?auto_1707816 ?auto_1707817 )
      ( MAKE-7CRATE-VERIFY ?auto_1707810 ?auto_1707811 ?auto_1707812 ?auto_1707814 ?auto_1707813 ?auto_1707815 ?auto_1707816 ?auto_1707817 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1707887 - SURFACE
      ?auto_1707888 - SURFACE
      ?auto_1707889 - SURFACE
      ?auto_1707891 - SURFACE
      ?auto_1707890 - SURFACE
      ?auto_1707892 - SURFACE
      ?auto_1707893 - SURFACE
      ?auto_1707894 - SURFACE
    )
    :vars
    (
      ?auto_1707895 - HOIST
      ?auto_1707898 - PLACE
      ?auto_1707896 - TRUCK
      ?auto_1707900 - PLACE
      ?auto_1707899 - HOIST
      ?auto_1707897 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1707895 ?auto_1707898 ) ( SURFACE-AT ?auto_1707893 ?auto_1707898 ) ( CLEAR ?auto_1707893 ) ( IS-CRATE ?auto_1707894 ) ( not ( = ?auto_1707893 ?auto_1707894 ) ) ( AVAILABLE ?auto_1707895 ) ( ON ?auto_1707893 ?auto_1707892 ) ( not ( = ?auto_1707892 ?auto_1707893 ) ) ( not ( = ?auto_1707892 ?auto_1707894 ) ) ( TRUCK-AT ?auto_1707896 ?auto_1707900 ) ( not ( = ?auto_1707900 ?auto_1707898 ) ) ( HOIST-AT ?auto_1707899 ?auto_1707900 ) ( not ( = ?auto_1707895 ?auto_1707899 ) ) ( AVAILABLE ?auto_1707899 ) ( SURFACE-AT ?auto_1707894 ?auto_1707900 ) ( ON ?auto_1707894 ?auto_1707897 ) ( CLEAR ?auto_1707894 ) ( not ( = ?auto_1707893 ?auto_1707897 ) ) ( not ( = ?auto_1707894 ?auto_1707897 ) ) ( not ( = ?auto_1707892 ?auto_1707897 ) ) ( ON ?auto_1707888 ?auto_1707887 ) ( ON ?auto_1707889 ?auto_1707888 ) ( ON ?auto_1707891 ?auto_1707889 ) ( ON ?auto_1707890 ?auto_1707891 ) ( ON ?auto_1707892 ?auto_1707890 ) ( not ( = ?auto_1707887 ?auto_1707888 ) ) ( not ( = ?auto_1707887 ?auto_1707889 ) ) ( not ( = ?auto_1707887 ?auto_1707891 ) ) ( not ( = ?auto_1707887 ?auto_1707890 ) ) ( not ( = ?auto_1707887 ?auto_1707892 ) ) ( not ( = ?auto_1707887 ?auto_1707893 ) ) ( not ( = ?auto_1707887 ?auto_1707894 ) ) ( not ( = ?auto_1707887 ?auto_1707897 ) ) ( not ( = ?auto_1707888 ?auto_1707889 ) ) ( not ( = ?auto_1707888 ?auto_1707891 ) ) ( not ( = ?auto_1707888 ?auto_1707890 ) ) ( not ( = ?auto_1707888 ?auto_1707892 ) ) ( not ( = ?auto_1707888 ?auto_1707893 ) ) ( not ( = ?auto_1707888 ?auto_1707894 ) ) ( not ( = ?auto_1707888 ?auto_1707897 ) ) ( not ( = ?auto_1707889 ?auto_1707891 ) ) ( not ( = ?auto_1707889 ?auto_1707890 ) ) ( not ( = ?auto_1707889 ?auto_1707892 ) ) ( not ( = ?auto_1707889 ?auto_1707893 ) ) ( not ( = ?auto_1707889 ?auto_1707894 ) ) ( not ( = ?auto_1707889 ?auto_1707897 ) ) ( not ( = ?auto_1707891 ?auto_1707890 ) ) ( not ( = ?auto_1707891 ?auto_1707892 ) ) ( not ( = ?auto_1707891 ?auto_1707893 ) ) ( not ( = ?auto_1707891 ?auto_1707894 ) ) ( not ( = ?auto_1707891 ?auto_1707897 ) ) ( not ( = ?auto_1707890 ?auto_1707892 ) ) ( not ( = ?auto_1707890 ?auto_1707893 ) ) ( not ( = ?auto_1707890 ?auto_1707894 ) ) ( not ( = ?auto_1707890 ?auto_1707897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1707892 ?auto_1707893 ?auto_1707894 )
      ( MAKE-7CRATE-VERIFY ?auto_1707887 ?auto_1707888 ?auto_1707889 ?auto_1707891 ?auto_1707890 ?auto_1707892 ?auto_1707893 ?auto_1707894 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1707965 - SURFACE
      ?auto_1707966 - SURFACE
      ?auto_1707967 - SURFACE
      ?auto_1707969 - SURFACE
      ?auto_1707968 - SURFACE
      ?auto_1707970 - SURFACE
      ?auto_1707971 - SURFACE
      ?auto_1707972 - SURFACE
    )
    :vars
    (
      ?auto_1707975 - HOIST
      ?auto_1707976 - PLACE
      ?auto_1707977 - PLACE
      ?auto_1707973 - HOIST
      ?auto_1707978 - SURFACE
      ?auto_1707974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1707975 ?auto_1707976 ) ( SURFACE-AT ?auto_1707971 ?auto_1707976 ) ( CLEAR ?auto_1707971 ) ( IS-CRATE ?auto_1707972 ) ( not ( = ?auto_1707971 ?auto_1707972 ) ) ( AVAILABLE ?auto_1707975 ) ( ON ?auto_1707971 ?auto_1707970 ) ( not ( = ?auto_1707970 ?auto_1707971 ) ) ( not ( = ?auto_1707970 ?auto_1707972 ) ) ( not ( = ?auto_1707977 ?auto_1707976 ) ) ( HOIST-AT ?auto_1707973 ?auto_1707977 ) ( not ( = ?auto_1707975 ?auto_1707973 ) ) ( AVAILABLE ?auto_1707973 ) ( SURFACE-AT ?auto_1707972 ?auto_1707977 ) ( ON ?auto_1707972 ?auto_1707978 ) ( CLEAR ?auto_1707972 ) ( not ( = ?auto_1707971 ?auto_1707978 ) ) ( not ( = ?auto_1707972 ?auto_1707978 ) ) ( not ( = ?auto_1707970 ?auto_1707978 ) ) ( TRUCK-AT ?auto_1707974 ?auto_1707976 ) ( ON ?auto_1707966 ?auto_1707965 ) ( ON ?auto_1707967 ?auto_1707966 ) ( ON ?auto_1707969 ?auto_1707967 ) ( ON ?auto_1707968 ?auto_1707969 ) ( ON ?auto_1707970 ?auto_1707968 ) ( not ( = ?auto_1707965 ?auto_1707966 ) ) ( not ( = ?auto_1707965 ?auto_1707967 ) ) ( not ( = ?auto_1707965 ?auto_1707969 ) ) ( not ( = ?auto_1707965 ?auto_1707968 ) ) ( not ( = ?auto_1707965 ?auto_1707970 ) ) ( not ( = ?auto_1707965 ?auto_1707971 ) ) ( not ( = ?auto_1707965 ?auto_1707972 ) ) ( not ( = ?auto_1707965 ?auto_1707978 ) ) ( not ( = ?auto_1707966 ?auto_1707967 ) ) ( not ( = ?auto_1707966 ?auto_1707969 ) ) ( not ( = ?auto_1707966 ?auto_1707968 ) ) ( not ( = ?auto_1707966 ?auto_1707970 ) ) ( not ( = ?auto_1707966 ?auto_1707971 ) ) ( not ( = ?auto_1707966 ?auto_1707972 ) ) ( not ( = ?auto_1707966 ?auto_1707978 ) ) ( not ( = ?auto_1707967 ?auto_1707969 ) ) ( not ( = ?auto_1707967 ?auto_1707968 ) ) ( not ( = ?auto_1707967 ?auto_1707970 ) ) ( not ( = ?auto_1707967 ?auto_1707971 ) ) ( not ( = ?auto_1707967 ?auto_1707972 ) ) ( not ( = ?auto_1707967 ?auto_1707978 ) ) ( not ( = ?auto_1707969 ?auto_1707968 ) ) ( not ( = ?auto_1707969 ?auto_1707970 ) ) ( not ( = ?auto_1707969 ?auto_1707971 ) ) ( not ( = ?auto_1707969 ?auto_1707972 ) ) ( not ( = ?auto_1707969 ?auto_1707978 ) ) ( not ( = ?auto_1707968 ?auto_1707970 ) ) ( not ( = ?auto_1707968 ?auto_1707971 ) ) ( not ( = ?auto_1707968 ?auto_1707972 ) ) ( not ( = ?auto_1707968 ?auto_1707978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1707970 ?auto_1707971 ?auto_1707972 )
      ( MAKE-7CRATE-VERIFY ?auto_1707965 ?auto_1707966 ?auto_1707967 ?auto_1707969 ?auto_1707968 ?auto_1707970 ?auto_1707971 ?auto_1707972 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708043 - SURFACE
      ?auto_1708044 - SURFACE
      ?auto_1708045 - SURFACE
      ?auto_1708047 - SURFACE
      ?auto_1708046 - SURFACE
      ?auto_1708048 - SURFACE
      ?auto_1708049 - SURFACE
      ?auto_1708050 - SURFACE
    )
    :vars
    (
      ?auto_1708051 - HOIST
      ?auto_1708055 - PLACE
      ?auto_1708053 - PLACE
      ?auto_1708052 - HOIST
      ?auto_1708054 - SURFACE
      ?auto_1708056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708051 ?auto_1708055 ) ( IS-CRATE ?auto_1708050 ) ( not ( = ?auto_1708049 ?auto_1708050 ) ) ( not ( = ?auto_1708048 ?auto_1708049 ) ) ( not ( = ?auto_1708048 ?auto_1708050 ) ) ( not ( = ?auto_1708053 ?auto_1708055 ) ) ( HOIST-AT ?auto_1708052 ?auto_1708053 ) ( not ( = ?auto_1708051 ?auto_1708052 ) ) ( AVAILABLE ?auto_1708052 ) ( SURFACE-AT ?auto_1708050 ?auto_1708053 ) ( ON ?auto_1708050 ?auto_1708054 ) ( CLEAR ?auto_1708050 ) ( not ( = ?auto_1708049 ?auto_1708054 ) ) ( not ( = ?auto_1708050 ?auto_1708054 ) ) ( not ( = ?auto_1708048 ?auto_1708054 ) ) ( TRUCK-AT ?auto_1708056 ?auto_1708055 ) ( SURFACE-AT ?auto_1708048 ?auto_1708055 ) ( CLEAR ?auto_1708048 ) ( LIFTING ?auto_1708051 ?auto_1708049 ) ( IS-CRATE ?auto_1708049 ) ( ON ?auto_1708044 ?auto_1708043 ) ( ON ?auto_1708045 ?auto_1708044 ) ( ON ?auto_1708047 ?auto_1708045 ) ( ON ?auto_1708046 ?auto_1708047 ) ( ON ?auto_1708048 ?auto_1708046 ) ( not ( = ?auto_1708043 ?auto_1708044 ) ) ( not ( = ?auto_1708043 ?auto_1708045 ) ) ( not ( = ?auto_1708043 ?auto_1708047 ) ) ( not ( = ?auto_1708043 ?auto_1708046 ) ) ( not ( = ?auto_1708043 ?auto_1708048 ) ) ( not ( = ?auto_1708043 ?auto_1708049 ) ) ( not ( = ?auto_1708043 ?auto_1708050 ) ) ( not ( = ?auto_1708043 ?auto_1708054 ) ) ( not ( = ?auto_1708044 ?auto_1708045 ) ) ( not ( = ?auto_1708044 ?auto_1708047 ) ) ( not ( = ?auto_1708044 ?auto_1708046 ) ) ( not ( = ?auto_1708044 ?auto_1708048 ) ) ( not ( = ?auto_1708044 ?auto_1708049 ) ) ( not ( = ?auto_1708044 ?auto_1708050 ) ) ( not ( = ?auto_1708044 ?auto_1708054 ) ) ( not ( = ?auto_1708045 ?auto_1708047 ) ) ( not ( = ?auto_1708045 ?auto_1708046 ) ) ( not ( = ?auto_1708045 ?auto_1708048 ) ) ( not ( = ?auto_1708045 ?auto_1708049 ) ) ( not ( = ?auto_1708045 ?auto_1708050 ) ) ( not ( = ?auto_1708045 ?auto_1708054 ) ) ( not ( = ?auto_1708047 ?auto_1708046 ) ) ( not ( = ?auto_1708047 ?auto_1708048 ) ) ( not ( = ?auto_1708047 ?auto_1708049 ) ) ( not ( = ?auto_1708047 ?auto_1708050 ) ) ( not ( = ?auto_1708047 ?auto_1708054 ) ) ( not ( = ?auto_1708046 ?auto_1708048 ) ) ( not ( = ?auto_1708046 ?auto_1708049 ) ) ( not ( = ?auto_1708046 ?auto_1708050 ) ) ( not ( = ?auto_1708046 ?auto_1708054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708048 ?auto_1708049 ?auto_1708050 )
      ( MAKE-7CRATE-VERIFY ?auto_1708043 ?auto_1708044 ?auto_1708045 ?auto_1708047 ?auto_1708046 ?auto_1708048 ?auto_1708049 ?auto_1708050 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708121 - SURFACE
      ?auto_1708122 - SURFACE
      ?auto_1708123 - SURFACE
      ?auto_1708125 - SURFACE
      ?auto_1708124 - SURFACE
      ?auto_1708126 - SURFACE
      ?auto_1708127 - SURFACE
      ?auto_1708128 - SURFACE
    )
    :vars
    (
      ?auto_1708134 - HOIST
      ?auto_1708130 - PLACE
      ?auto_1708133 - PLACE
      ?auto_1708132 - HOIST
      ?auto_1708131 - SURFACE
      ?auto_1708129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708134 ?auto_1708130 ) ( IS-CRATE ?auto_1708128 ) ( not ( = ?auto_1708127 ?auto_1708128 ) ) ( not ( = ?auto_1708126 ?auto_1708127 ) ) ( not ( = ?auto_1708126 ?auto_1708128 ) ) ( not ( = ?auto_1708133 ?auto_1708130 ) ) ( HOIST-AT ?auto_1708132 ?auto_1708133 ) ( not ( = ?auto_1708134 ?auto_1708132 ) ) ( AVAILABLE ?auto_1708132 ) ( SURFACE-AT ?auto_1708128 ?auto_1708133 ) ( ON ?auto_1708128 ?auto_1708131 ) ( CLEAR ?auto_1708128 ) ( not ( = ?auto_1708127 ?auto_1708131 ) ) ( not ( = ?auto_1708128 ?auto_1708131 ) ) ( not ( = ?auto_1708126 ?auto_1708131 ) ) ( TRUCK-AT ?auto_1708129 ?auto_1708130 ) ( SURFACE-AT ?auto_1708126 ?auto_1708130 ) ( CLEAR ?auto_1708126 ) ( IS-CRATE ?auto_1708127 ) ( AVAILABLE ?auto_1708134 ) ( IN ?auto_1708127 ?auto_1708129 ) ( ON ?auto_1708122 ?auto_1708121 ) ( ON ?auto_1708123 ?auto_1708122 ) ( ON ?auto_1708125 ?auto_1708123 ) ( ON ?auto_1708124 ?auto_1708125 ) ( ON ?auto_1708126 ?auto_1708124 ) ( not ( = ?auto_1708121 ?auto_1708122 ) ) ( not ( = ?auto_1708121 ?auto_1708123 ) ) ( not ( = ?auto_1708121 ?auto_1708125 ) ) ( not ( = ?auto_1708121 ?auto_1708124 ) ) ( not ( = ?auto_1708121 ?auto_1708126 ) ) ( not ( = ?auto_1708121 ?auto_1708127 ) ) ( not ( = ?auto_1708121 ?auto_1708128 ) ) ( not ( = ?auto_1708121 ?auto_1708131 ) ) ( not ( = ?auto_1708122 ?auto_1708123 ) ) ( not ( = ?auto_1708122 ?auto_1708125 ) ) ( not ( = ?auto_1708122 ?auto_1708124 ) ) ( not ( = ?auto_1708122 ?auto_1708126 ) ) ( not ( = ?auto_1708122 ?auto_1708127 ) ) ( not ( = ?auto_1708122 ?auto_1708128 ) ) ( not ( = ?auto_1708122 ?auto_1708131 ) ) ( not ( = ?auto_1708123 ?auto_1708125 ) ) ( not ( = ?auto_1708123 ?auto_1708124 ) ) ( not ( = ?auto_1708123 ?auto_1708126 ) ) ( not ( = ?auto_1708123 ?auto_1708127 ) ) ( not ( = ?auto_1708123 ?auto_1708128 ) ) ( not ( = ?auto_1708123 ?auto_1708131 ) ) ( not ( = ?auto_1708125 ?auto_1708124 ) ) ( not ( = ?auto_1708125 ?auto_1708126 ) ) ( not ( = ?auto_1708125 ?auto_1708127 ) ) ( not ( = ?auto_1708125 ?auto_1708128 ) ) ( not ( = ?auto_1708125 ?auto_1708131 ) ) ( not ( = ?auto_1708124 ?auto_1708126 ) ) ( not ( = ?auto_1708124 ?auto_1708127 ) ) ( not ( = ?auto_1708124 ?auto_1708128 ) ) ( not ( = ?auto_1708124 ?auto_1708131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708126 ?auto_1708127 ?auto_1708128 )
      ( MAKE-7CRATE-VERIFY ?auto_1708121 ?auto_1708122 ?auto_1708123 ?auto_1708125 ?auto_1708124 ?auto_1708126 ?auto_1708127 ?auto_1708128 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711040 - SURFACE
      ?auto_1711041 - SURFACE
      ?auto_1711042 - SURFACE
      ?auto_1711044 - SURFACE
      ?auto_1711043 - SURFACE
      ?auto_1711045 - SURFACE
      ?auto_1711046 - SURFACE
      ?auto_1711047 - SURFACE
      ?auto_1711048 - SURFACE
    )
    :vars
    (
      ?auto_1711050 - HOIST
      ?auto_1711049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711050 ?auto_1711049 ) ( SURFACE-AT ?auto_1711047 ?auto_1711049 ) ( CLEAR ?auto_1711047 ) ( LIFTING ?auto_1711050 ?auto_1711048 ) ( IS-CRATE ?auto_1711048 ) ( not ( = ?auto_1711047 ?auto_1711048 ) ) ( ON ?auto_1711041 ?auto_1711040 ) ( ON ?auto_1711042 ?auto_1711041 ) ( ON ?auto_1711044 ?auto_1711042 ) ( ON ?auto_1711043 ?auto_1711044 ) ( ON ?auto_1711045 ?auto_1711043 ) ( ON ?auto_1711046 ?auto_1711045 ) ( ON ?auto_1711047 ?auto_1711046 ) ( not ( = ?auto_1711040 ?auto_1711041 ) ) ( not ( = ?auto_1711040 ?auto_1711042 ) ) ( not ( = ?auto_1711040 ?auto_1711044 ) ) ( not ( = ?auto_1711040 ?auto_1711043 ) ) ( not ( = ?auto_1711040 ?auto_1711045 ) ) ( not ( = ?auto_1711040 ?auto_1711046 ) ) ( not ( = ?auto_1711040 ?auto_1711047 ) ) ( not ( = ?auto_1711040 ?auto_1711048 ) ) ( not ( = ?auto_1711041 ?auto_1711042 ) ) ( not ( = ?auto_1711041 ?auto_1711044 ) ) ( not ( = ?auto_1711041 ?auto_1711043 ) ) ( not ( = ?auto_1711041 ?auto_1711045 ) ) ( not ( = ?auto_1711041 ?auto_1711046 ) ) ( not ( = ?auto_1711041 ?auto_1711047 ) ) ( not ( = ?auto_1711041 ?auto_1711048 ) ) ( not ( = ?auto_1711042 ?auto_1711044 ) ) ( not ( = ?auto_1711042 ?auto_1711043 ) ) ( not ( = ?auto_1711042 ?auto_1711045 ) ) ( not ( = ?auto_1711042 ?auto_1711046 ) ) ( not ( = ?auto_1711042 ?auto_1711047 ) ) ( not ( = ?auto_1711042 ?auto_1711048 ) ) ( not ( = ?auto_1711044 ?auto_1711043 ) ) ( not ( = ?auto_1711044 ?auto_1711045 ) ) ( not ( = ?auto_1711044 ?auto_1711046 ) ) ( not ( = ?auto_1711044 ?auto_1711047 ) ) ( not ( = ?auto_1711044 ?auto_1711048 ) ) ( not ( = ?auto_1711043 ?auto_1711045 ) ) ( not ( = ?auto_1711043 ?auto_1711046 ) ) ( not ( = ?auto_1711043 ?auto_1711047 ) ) ( not ( = ?auto_1711043 ?auto_1711048 ) ) ( not ( = ?auto_1711045 ?auto_1711046 ) ) ( not ( = ?auto_1711045 ?auto_1711047 ) ) ( not ( = ?auto_1711045 ?auto_1711048 ) ) ( not ( = ?auto_1711046 ?auto_1711047 ) ) ( not ( = ?auto_1711046 ?auto_1711048 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1711047 ?auto_1711048 )
      ( MAKE-8CRATE-VERIFY ?auto_1711040 ?auto_1711041 ?auto_1711042 ?auto_1711044 ?auto_1711043 ?auto_1711045 ?auto_1711046 ?auto_1711047 ?auto_1711048 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711107 - SURFACE
      ?auto_1711108 - SURFACE
      ?auto_1711109 - SURFACE
      ?auto_1711111 - SURFACE
      ?auto_1711110 - SURFACE
      ?auto_1711112 - SURFACE
      ?auto_1711113 - SURFACE
      ?auto_1711114 - SURFACE
      ?auto_1711115 - SURFACE
    )
    :vars
    (
      ?auto_1711117 - HOIST
      ?auto_1711118 - PLACE
      ?auto_1711116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711117 ?auto_1711118 ) ( SURFACE-AT ?auto_1711114 ?auto_1711118 ) ( CLEAR ?auto_1711114 ) ( IS-CRATE ?auto_1711115 ) ( not ( = ?auto_1711114 ?auto_1711115 ) ) ( TRUCK-AT ?auto_1711116 ?auto_1711118 ) ( AVAILABLE ?auto_1711117 ) ( IN ?auto_1711115 ?auto_1711116 ) ( ON ?auto_1711114 ?auto_1711113 ) ( not ( = ?auto_1711113 ?auto_1711114 ) ) ( not ( = ?auto_1711113 ?auto_1711115 ) ) ( ON ?auto_1711108 ?auto_1711107 ) ( ON ?auto_1711109 ?auto_1711108 ) ( ON ?auto_1711111 ?auto_1711109 ) ( ON ?auto_1711110 ?auto_1711111 ) ( ON ?auto_1711112 ?auto_1711110 ) ( ON ?auto_1711113 ?auto_1711112 ) ( not ( = ?auto_1711107 ?auto_1711108 ) ) ( not ( = ?auto_1711107 ?auto_1711109 ) ) ( not ( = ?auto_1711107 ?auto_1711111 ) ) ( not ( = ?auto_1711107 ?auto_1711110 ) ) ( not ( = ?auto_1711107 ?auto_1711112 ) ) ( not ( = ?auto_1711107 ?auto_1711113 ) ) ( not ( = ?auto_1711107 ?auto_1711114 ) ) ( not ( = ?auto_1711107 ?auto_1711115 ) ) ( not ( = ?auto_1711108 ?auto_1711109 ) ) ( not ( = ?auto_1711108 ?auto_1711111 ) ) ( not ( = ?auto_1711108 ?auto_1711110 ) ) ( not ( = ?auto_1711108 ?auto_1711112 ) ) ( not ( = ?auto_1711108 ?auto_1711113 ) ) ( not ( = ?auto_1711108 ?auto_1711114 ) ) ( not ( = ?auto_1711108 ?auto_1711115 ) ) ( not ( = ?auto_1711109 ?auto_1711111 ) ) ( not ( = ?auto_1711109 ?auto_1711110 ) ) ( not ( = ?auto_1711109 ?auto_1711112 ) ) ( not ( = ?auto_1711109 ?auto_1711113 ) ) ( not ( = ?auto_1711109 ?auto_1711114 ) ) ( not ( = ?auto_1711109 ?auto_1711115 ) ) ( not ( = ?auto_1711111 ?auto_1711110 ) ) ( not ( = ?auto_1711111 ?auto_1711112 ) ) ( not ( = ?auto_1711111 ?auto_1711113 ) ) ( not ( = ?auto_1711111 ?auto_1711114 ) ) ( not ( = ?auto_1711111 ?auto_1711115 ) ) ( not ( = ?auto_1711110 ?auto_1711112 ) ) ( not ( = ?auto_1711110 ?auto_1711113 ) ) ( not ( = ?auto_1711110 ?auto_1711114 ) ) ( not ( = ?auto_1711110 ?auto_1711115 ) ) ( not ( = ?auto_1711112 ?auto_1711113 ) ) ( not ( = ?auto_1711112 ?auto_1711114 ) ) ( not ( = ?auto_1711112 ?auto_1711115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711113 ?auto_1711114 ?auto_1711115 )
      ( MAKE-8CRATE-VERIFY ?auto_1711107 ?auto_1711108 ?auto_1711109 ?auto_1711111 ?auto_1711110 ?auto_1711112 ?auto_1711113 ?auto_1711114 ?auto_1711115 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711183 - SURFACE
      ?auto_1711184 - SURFACE
      ?auto_1711185 - SURFACE
      ?auto_1711187 - SURFACE
      ?auto_1711186 - SURFACE
      ?auto_1711188 - SURFACE
      ?auto_1711189 - SURFACE
      ?auto_1711190 - SURFACE
      ?auto_1711191 - SURFACE
    )
    :vars
    (
      ?auto_1711195 - HOIST
      ?auto_1711192 - PLACE
      ?auto_1711194 - TRUCK
      ?auto_1711193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711195 ?auto_1711192 ) ( SURFACE-AT ?auto_1711190 ?auto_1711192 ) ( CLEAR ?auto_1711190 ) ( IS-CRATE ?auto_1711191 ) ( not ( = ?auto_1711190 ?auto_1711191 ) ) ( AVAILABLE ?auto_1711195 ) ( IN ?auto_1711191 ?auto_1711194 ) ( ON ?auto_1711190 ?auto_1711189 ) ( not ( = ?auto_1711189 ?auto_1711190 ) ) ( not ( = ?auto_1711189 ?auto_1711191 ) ) ( TRUCK-AT ?auto_1711194 ?auto_1711193 ) ( not ( = ?auto_1711193 ?auto_1711192 ) ) ( ON ?auto_1711184 ?auto_1711183 ) ( ON ?auto_1711185 ?auto_1711184 ) ( ON ?auto_1711187 ?auto_1711185 ) ( ON ?auto_1711186 ?auto_1711187 ) ( ON ?auto_1711188 ?auto_1711186 ) ( ON ?auto_1711189 ?auto_1711188 ) ( not ( = ?auto_1711183 ?auto_1711184 ) ) ( not ( = ?auto_1711183 ?auto_1711185 ) ) ( not ( = ?auto_1711183 ?auto_1711187 ) ) ( not ( = ?auto_1711183 ?auto_1711186 ) ) ( not ( = ?auto_1711183 ?auto_1711188 ) ) ( not ( = ?auto_1711183 ?auto_1711189 ) ) ( not ( = ?auto_1711183 ?auto_1711190 ) ) ( not ( = ?auto_1711183 ?auto_1711191 ) ) ( not ( = ?auto_1711184 ?auto_1711185 ) ) ( not ( = ?auto_1711184 ?auto_1711187 ) ) ( not ( = ?auto_1711184 ?auto_1711186 ) ) ( not ( = ?auto_1711184 ?auto_1711188 ) ) ( not ( = ?auto_1711184 ?auto_1711189 ) ) ( not ( = ?auto_1711184 ?auto_1711190 ) ) ( not ( = ?auto_1711184 ?auto_1711191 ) ) ( not ( = ?auto_1711185 ?auto_1711187 ) ) ( not ( = ?auto_1711185 ?auto_1711186 ) ) ( not ( = ?auto_1711185 ?auto_1711188 ) ) ( not ( = ?auto_1711185 ?auto_1711189 ) ) ( not ( = ?auto_1711185 ?auto_1711190 ) ) ( not ( = ?auto_1711185 ?auto_1711191 ) ) ( not ( = ?auto_1711187 ?auto_1711186 ) ) ( not ( = ?auto_1711187 ?auto_1711188 ) ) ( not ( = ?auto_1711187 ?auto_1711189 ) ) ( not ( = ?auto_1711187 ?auto_1711190 ) ) ( not ( = ?auto_1711187 ?auto_1711191 ) ) ( not ( = ?auto_1711186 ?auto_1711188 ) ) ( not ( = ?auto_1711186 ?auto_1711189 ) ) ( not ( = ?auto_1711186 ?auto_1711190 ) ) ( not ( = ?auto_1711186 ?auto_1711191 ) ) ( not ( = ?auto_1711188 ?auto_1711189 ) ) ( not ( = ?auto_1711188 ?auto_1711190 ) ) ( not ( = ?auto_1711188 ?auto_1711191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711189 ?auto_1711190 ?auto_1711191 )
      ( MAKE-8CRATE-VERIFY ?auto_1711183 ?auto_1711184 ?auto_1711185 ?auto_1711187 ?auto_1711186 ?auto_1711188 ?auto_1711189 ?auto_1711190 ?auto_1711191 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711267 - SURFACE
      ?auto_1711268 - SURFACE
      ?auto_1711269 - SURFACE
      ?auto_1711271 - SURFACE
      ?auto_1711270 - SURFACE
      ?auto_1711272 - SURFACE
      ?auto_1711273 - SURFACE
      ?auto_1711274 - SURFACE
      ?auto_1711275 - SURFACE
    )
    :vars
    (
      ?auto_1711276 - HOIST
      ?auto_1711278 - PLACE
      ?auto_1711280 - TRUCK
      ?auto_1711277 - PLACE
      ?auto_1711279 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711276 ?auto_1711278 ) ( SURFACE-AT ?auto_1711274 ?auto_1711278 ) ( CLEAR ?auto_1711274 ) ( IS-CRATE ?auto_1711275 ) ( not ( = ?auto_1711274 ?auto_1711275 ) ) ( AVAILABLE ?auto_1711276 ) ( ON ?auto_1711274 ?auto_1711273 ) ( not ( = ?auto_1711273 ?auto_1711274 ) ) ( not ( = ?auto_1711273 ?auto_1711275 ) ) ( TRUCK-AT ?auto_1711280 ?auto_1711277 ) ( not ( = ?auto_1711277 ?auto_1711278 ) ) ( HOIST-AT ?auto_1711279 ?auto_1711277 ) ( LIFTING ?auto_1711279 ?auto_1711275 ) ( not ( = ?auto_1711276 ?auto_1711279 ) ) ( ON ?auto_1711268 ?auto_1711267 ) ( ON ?auto_1711269 ?auto_1711268 ) ( ON ?auto_1711271 ?auto_1711269 ) ( ON ?auto_1711270 ?auto_1711271 ) ( ON ?auto_1711272 ?auto_1711270 ) ( ON ?auto_1711273 ?auto_1711272 ) ( not ( = ?auto_1711267 ?auto_1711268 ) ) ( not ( = ?auto_1711267 ?auto_1711269 ) ) ( not ( = ?auto_1711267 ?auto_1711271 ) ) ( not ( = ?auto_1711267 ?auto_1711270 ) ) ( not ( = ?auto_1711267 ?auto_1711272 ) ) ( not ( = ?auto_1711267 ?auto_1711273 ) ) ( not ( = ?auto_1711267 ?auto_1711274 ) ) ( not ( = ?auto_1711267 ?auto_1711275 ) ) ( not ( = ?auto_1711268 ?auto_1711269 ) ) ( not ( = ?auto_1711268 ?auto_1711271 ) ) ( not ( = ?auto_1711268 ?auto_1711270 ) ) ( not ( = ?auto_1711268 ?auto_1711272 ) ) ( not ( = ?auto_1711268 ?auto_1711273 ) ) ( not ( = ?auto_1711268 ?auto_1711274 ) ) ( not ( = ?auto_1711268 ?auto_1711275 ) ) ( not ( = ?auto_1711269 ?auto_1711271 ) ) ( not ( = ?auto_1711269 ?auto_1711270 ) ) ( not ( = ?auto_1711269 ?auto_1711272 ) ) ( not ( = ?auto_1711269 ?auto_1711273 ) ) ( not ( = ?auto_1711269 ?auto_1711274 ) ) ( not ( = ?auto_1711269 ?auto_1711275 ) ) ( not ( = ?auto_1711271 ?auto_1711270 ) ) ( not ( = ?auto_1711271 ?auto_1711272 ) ) ( not ( = ?auto_1711271 ?auto_1711273 ) ) ( not ( = ?auto_1711271 ?auto_1711274 ) ) ( not ( = ?auto_1711271 ?auto_1711275 ) ) ( not ( = ?auto_1711270 ?auto_1711272 ) ) ( not ( = ?auto_1711270 ?auto_1711273 ) ) ( not ( = ?auto_1711270 ?auto_1711274 ) ) ( not ( = ?auto_1711270 ?auto_1711275 ) ) ( not ( = ?auto_1711272 ?auto_1711273 ) ) ( not ( = ?auto_1711272 ?auto_1711274 ) ) ( not ( = ?auto_1711272 ?auto_1711275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711273 ?auto_1711274 ?auto_1711275 )
      ( MAKE-8CRATE-VERIFY ?auto_1711267 ?auto_1711268 ?auto_1711269 ?auto_1711271 ?auto_1711270 ?auto_1711272 ?auto_1711273 ?auto_1711274 ?auto_1711275 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711359 - SURFACE
      ?auto_1711360 - SURFACE
      ?auto_1711361 - SURFACE
      ?auto_1711363 - SURFACE
      ?auto_1711362 - SURFACE
      ?auto_1711364 - SURFACE
      ?auto_1711365 - SURFACE
      ?auto_1711366 - SURFACE
      ?auto_1711367 - SURFACE
    )
    :vars
    (
      ?auto_1711373 - HOIST
      ?auto_1711372 - PLACE
      ?auto_1711369 - TRUCK
      ?auto_1711370 - PLACE
      ?auto_1711371 - HOIST
      ?auto_1711368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711373 ?auto_1711372 ) ( SURFACE-AT ?auto_1711366 ?auto_1711372 ) ( CLEAR ?auto_1711366 ) ( IS-CRATE ?auto_1711367 ) ( not ( = ?auto_1711366 ?auto_1711367 ) ) ( AVAILABLE ?auto_1711373 ) ( ON ?auto_1711366 ?auto_1711365 ) ( not ( = ?auto_1711365 ?auto_1711366 ) ) ( not ( = ?auto_1711365 ?auto_1711367 ) ) ( TRUCK-AT ?auto_1711369 ?auto_1711370 ) ( not ( = ?auto_1711370 ?auto_1711372 ) ) ( HOIST-AT ?auto_1711371 ?auto_1711370 ) ( not ( = ?auto_1711373 ?auto_1711371 ) ) ( AVAILABLE ?auto_1711371 ) ( SURFACE-AT ?auto_1711367 ?auto_1711370 ) ( ON ?auto_1711367 ?auto_1711368 ) ( CLEAR ?auto_1711367 ) ( not ( = ?auto_1711366 ?auto_1711368 ) ) ( not ( = ?auto_1711367 ?auto_1711368 ) ) ( not ( = ?auto_1711365 ?auto_1711368 ) ) ( ON ?auto_1711360 ?auto_1711359 ) ( ON ?auto_1711361 ?auto_1711360 ) ( ON ?auto_1711363 ?auto_1711361 ) ( ON ?auto_1711362 ?auto_1711363 ) ( ON ?auto_1711364 ?auto_1711362 ) ( ON ?auto_1711365 ?auto_1711364 ) ( not ( = ?auto_1711359 ?auto_1711360 ) ) ( not ( = ?auto_1711359 ?auto_1711361 ) ) ( not ( = ?auto_1711359 ?auto_1711363 ) ) ( not ( = ?auto_1711359 ?auto_1711362 ) ) ( not ( = ?auto_1711359 ?auto_1711364 ) ) ( not ( = ?auto_1711359 ?auto_1711365 ) ) ( not ( = ?auto_1711359 ?auto_1711366 ) ) ( not ( = ?auto_1711359 ?auto_1711367 ) ) ( not ( = ?auto_1711359 ?auto_1711368 ) ) ( not ( = ?auto_1711360 ?auto_1711361 ) ) ( not ( = ?auto_1711360 ?auto_1711363 ) ) ( not ( = ?auto_1711360 ?auto_1711362 ) ) ( not ( = ?auto_1711360 ?auto_1711364 ) ) ( not ( = ?auto_1711360 ?auto_1711365 ) ) ( not ( = ?auto_1711360 ?auto_1711366 ) ) ( not ( = ?auto_1711360 ?auto_1711367 ) ) ( not ( = ?auto_1711360 ?auto_1711368 ) ) ( not ( = ?auto_1711361 ?auto_1711363 ) ) ( not ( = ?auto_1711361 ?auto_1711362 ) ) ( not ( = ?auto_1711361 ?auto_1711364 ) ) ( not ( = ?auto_1711361 ?auto_1711365 ) ) ( not ( = ?auto_1711361 ?auto_1711366 ) ) ( not ( = ?auto_1711361 ?auto_1711367 ) ) ( not ( = ?auto_1711361 ?auto_1711368 ) ) ( not ( = ?auto_1711363 ?auto_1711362 ) ) ( not ( = ?auto_1711363 ?auto_1711364 ) ) ( not ( = ?auto_1711363 ?auto_1711365 ) ) ( not ( = ?auto_1711363 ?auto_1711366 ) ) ( not ( = ?auto_1711363 ?auto_1711367 ) ) ( not ( = ?auto_1711363 ?auto_1711368 ) ) ( not ( = ?auto_1711362 ?auto_1711364 ) ) ( not ( = ?auto_1711362 ?auto_1711365 ) ) ( not ( = ?auto_1711362 ?auto_1711366 ) ) ( not ( = ?auto_1711362 ?auto_1711367 ) ) ( not ( = ?auto_1711362 ?auto_1711368 ) ) ( not ( = ?auto_1711364 ?auto_1711365 ) ) ( not ( = ?auto_1711364 ?auto_1711366 ) ) ( not ( = ?auto_1711364 ?auto_1711367 ) ) ( not ( = ?auto_1711364 ?auto_1711368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711365 ?auto_1711366 ?auto_1711367 )
      ( MAKE-8CRATE-VERIFY ?auto_1711359 ?auto_1711360 ?auto_1711361 ?auto_1711363 ?auto_1711362 ?auto_1711364 ?auto_1711365 ?auto_1711366 ?auto_1711367 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711452 - SURFACE
      ?auto_1711453 - SURFACE
      ?auto_1711454 - SURFACE
      ?auto_1711456 - SURFACE
      ?auto_1711455 - SURFACE
      ?auto_1711457 - SURFACE
      ?auto_1711458 - SURFACE
      ?auto_1711459 - SURFACE
      ?auto_1711460 - SURFACE
    )
    :vars
    (
      ?auto_1711462 - HOIST
      ?auto_1711465 - PLACE
      ?auto_1711463 - PLACE
      ?auto_1711464 - HOIST
      ?auto_1711461 - SURFACE
      ?auto_1711466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711462 ?auto_1711465 ) ( SURFACE-AT ?auto_1711459 ?auto_1711465 ) ( CLEAR ?auto_1711459 ) ( IS-CRATE ?auto_1711460 ) ( not ( = ?auto_1711459 ?auto_1711460 ) ) ( AVAILABLE ?auto_1711462 ) ( ON ?auto_1711459 ?auto_1711458 ) ( not ( = ?auto_1711458 ?auto_1711459 ) ) ( not ( = ?auto_1711458 ?auto_1711460 ) ) ( not ( = ?auto_1711463 ?auto_1711465 ) ) ( HOIST-AT ?auto_1711464 ?auto_1711463 ) ( not ( = ?auto_1711462 ?auto_1711464 ) ) ( AVAILABLE ?auto_1711464 ) ( SURFACE-AT ?auto_1711460 ?auto_1711463 ) ( ON ?auto_1711460 ?auto_1711461 ) ( CLEAR ?auto_1711460 ) ( not ( = ?auto_1711459 ?auto_1711461 ) ) ( not ( = ?auto_1711460 ?auto_1711461 ) ) ( not ( = ?auto_1711458 ?auto_1711461 ) ) ( TRUCK-AT ?auto_1711466 ?auto_1711465 ) ( ON ?auto_1711453 ?auto_1711452 ) ( ON ?auto_1711454 ?auto_1711453 ) ( ON ?auto_1711456 ?auto_1711454 ) ( ON ?auto_1711455 ?auto_1711456 ) ( ON ?auto_1711457 ?auto_1711455 ) ( ON ?auto_1711458 ?auto_1711457 ) ( not ( = ?auto_1711452 ?auto_1711453 ) ) ( not ( = ?auto_1711452 ?auto_1711454 ) ) ( not ( = ?auto_1711452 ?auto_1711456 ) ) ( not ( = ?auto_1711452 ?auto_1711455 ) ) ( not ( = ?auto_1711452 ?auto_1711457 ) ) ( not ( = ?auto_1711452 ?auto_1711458 ) ) ( not ( = ?auto_1711452 ?auto_1711459 ) ) ( not ( = ?auto_1711452 ?auto_1711460 ) ) ( not ( = ?auto_1711452 ?auto_1711461 ) ) ( not ( = ?auto_1711453 ?auto_1711454 ) ) ( not ( = ?auto_1711453 ?auto_1711456 ) ) ( not ( = ?auto_1711453 ?auto_1711455 ) ) ( not ( = ?auto_1711453 ?auto_1711457 ) ) ( not ( = ?auto_1711453 ?auto_1711458 ) ) ( not ( = ?auto_1711453 ?auto_1711459 ) ) ( not ( = ?auto_1711453 ?auto_1711460 ) ) ( not ( = ?auto_1711453 ?auto_1711461 ) ) ( not ( = ?auto_1711454 ?auto_1711456 ) ) ( not ( = ?auto_1711454 ?auto_1711455 ) ) ( not ( = ?auto_1711454 ?auto_1711457 ) ) ( not ( = ?auto_1711454 ?auto_1711458 ) ) ( not ( = ?auto_1711454 ?auto_1711459 ) ) ( not ( = ?auto_1711454 ?auto_1711460 ) ) ( not ( = ?auto_1711454 ?auto_1711461 ) ) ( not ( = ?auto_1711456 ?auto_1711455 ) ) ( not ( = ?auto_1711456 ?auto_1711457 ) ) ( not ( = ?auto_1711456 ?auto_1711458 ) ) ( not ( = ?auto_1711456 ?auto_1711459 ) ) ( not ( = ?auto_1711456 ?auto_1711460 ) ) ( not ( = ?auto_1711456 ?auto_1711461 ) ) ( not ( = ?auto_1711455 ?auto_1711457 ) ) ( not ( = ?auto_1711455 ?auto_1711458 ) ) ( not ( = ?auto_1711455 ?auto_1711459 ) ) ( not ( = ?auto_1711455 ?auto_1711460 ) ) ( not ( = ?auto_1711455 ?auto_1711461 ) ) ( not ( = ?auto_1711457 ?auto_1711458 ) ) ( not ( = ?auto_1711457 ?auto_1711459 ) ) ( not ( = ?auto_1711457 ?auto_1711460 ) ) ( not ( = ?auto_1711457 ?auto_1711461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711458 ?auto_1711459 ?auto_1711460 )
      ( MAKE-8CRATE-VERIFY ?auto_1711452 ?auto_1711453 ?auto_1711454 ?auto_1711456 ?auto_1711455 ?auto_1711457 ?auto_1711458 ?auto_1711459 ?auto_1711460 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711545 - SURFACE
      ?auto_1711546 - SURFACE
      ?auto_1711547 - SURFACE
      ?auto_1711549 - SURFACE
      ?auto_1711548 - SURFACE
      ?auto_1711550 - SURFACE
      ?auto_1711551 - SURFACE
      ?auto_1711552 - SURFACE
      ?auto_1711553 - SURFACE
    )
    :vars
    (
      ?auto_1711559 - HOIST
      ?auto_1711555 - PLACE
      ?auto_1711554 - PLACE
      ?auto_1711556 - HOIST
      ?auto_1711558 - SURFACE
      ?auto_1711557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711559 ?auto_1711555 ) ( IS-CRATE ?auto_1711553 ) ( not ( = ?auto_1711552 ?auto_1711553 ) ) ( not ( = ?auto_1711551 ?auto_1711552 ) ) ( not ( = ?auto_1711551 ?auto_1711553 ) ) ( not ( = ?auto_1711554 ?auto_1711555 ) ) ( HOIST-AT ?auto_1711556 ?auto_1711554 ) ( not ( = ?auto_1711559 ?auto_1711556 ) ) ( AVAILABLE ?auto_1711556 ) ( SURFACE-AT ?auto_1711553 ?auto_1711554 ) ( ON ?auto_1711553 ?auto_1711558 ) ( CLEAR ?auto_1711553 ) ( not ( = ?auto_1711552 ?auto_1711558 ) ) ( not ( = ?auto_1711553 ?auto_1711558 ) ) ( not ( = ?auto_1711551 ?auto_1711558 ) ) ( TRUCK-AT ?auto_1711557 ?auto_1711555 ) ( SURFACE-AT ?auto_1711551 ?auto_1711555 ) ( CLEAR ?auto_1711551 ) ( LIFTING ?auto_1711559 ?auto_1711552 ) ( IS-CRATE ?auto_1711552 ) ( ON ?auto_1711546 ?auto_1711545 ) ( ON ?auto_1711547 ?auto_1711546 ) ( ON ?auto_1711549 ?auto_1711547 ) ( ON ?auto_1711548 ?auto_1711549 ) ( ON ?auto_1711550 ?auto_1711548 ) ( ON ?auto_1711551 ?auto_1711550 ) ( not ( = ?auto_1711545 ?auto_1711546 ) ) ( not ( = ?auto_1711545 ?auto_1711547 ) ) ( not ( = ?auto_1711545 ?auto_1711549 ) ) ( not ( = ?auto_1711545 ?auto_1711548 ) ) ( not ( = ?auto_1711545 ?auto_1711550 ) ) ( not ( = ?auto_1711545 ?auto_1711551 ) ) ( not ( = ?auto_1711545 ?auto_1711552 ) ) ( not ( = ?auto_1711545 ?auto_1711553 ) ) ( not ( = ?auto_1711545 ?auto_1711558 ) ) ( not ( = ?auto_1711546 ?auto_1711547 ) ) ( not ( = ?auto_1711546 ?auto_1711549 ) ) ( not ( = ?auto_1711546 ?auto_1711548 ) ) ( not ( = ?auto_1711546 ?auto_1711550 ) ) ( not ( = ?auto_1711546 ?auto_1711551 ) ) ( not ( = ?auto_1711546 ?auto_1711552 ) ) ( not ( = ?auto_1711546 ?auto_1711553 ) ) ( not ( = ?auto_1711546 ?auto_1711558 ) ) ( not ( = ?auto_1711547 ?auto_1711549 ) ) ( not ( = ?auto_1711547 ?auto_1711548 ) ) ( not ( = ?auto_1711547 ?auto_1711550 ) ) ( not ( = ?auto_1711547 ?auto_1711551 ) ) ( not ( = ?auto_1711547 ?auto_1711552 ) ) ( not ( = ?auto_1711547 ?auto_1711553 ) ) ( not ( = ?auto_1711547 ?auto_1711558 ) ) ( not ( = ?auto_1711549 ?auto_1711548 ) ) ( not ( = ?auto_1711549 ?auto_1711550 ) ) ( not ( = ?auto_1711549 ?auto_1711551 ) ) ( not ( = ?auto_1711549 ?auto_1711552 ) ) ( not ( = ?auto_1711549 ?auto_1711553 ) ) ( not ( = ?auto_1711549 ?auto_1711558 ) ) ( not ( = ?auto_1711548 ?auto_1711550 ) ) ( not ( = ?auto_1711548 ?auto_1711551 ) ) ( not ( = ?auto_1711548 ?auto_1711552 ) ) ( not ( = ?auto_1711548 ?auto_1711553 ) ) ( not ( = ?auto_1711548 ?auto_1711558 ) ) ( not ( = ?auto_1711550 ?auto_1711551 ) ) ( not ( = ?auto_1711550 ?auto_1711552 ) ) ( not ( = ?auto_1711550 ?auto_1711553 ) ) ( not ( = ?auto_1711550 ?auto_1711558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711551 ?auto_1711552 ?auto_1711553 )
      ( MAKE-8CRATE-VERIFY ?auto_1711545 ?auto_1711546 ?auto_1711547 ?auto_1711549 ?auto_1711548 ?auto_1711550 ?auto_1711551 ?auto_1711552 ?auto_1711553 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711638 - SURFACE
      ?auto_1711639 - SURFACE
      ?auto_1711640 - SURFACE
      ?auto_1711642 - SURFACE
      ?auto_1711641 - SURFACE
      ?auto_1711643 - SURFACE
      ?auto_1711644 - SURFACE
      ?auto_1711645 - SURFACE
      ?auto_1711646 - SURFACE
    )
    :vars
    (
      ?auto_1711652 - HOIST
      ?auto_1711647 - PLACE
      ?auto_1711648 - PLACE
      ?auto_1711651 - HOIST
      ?auto_1711650 - SURFACE
      ?auto_1711649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711652 ?auto_1711647 ) ( IS-CRATE ?auto_1711646 ) ( not ( = ?auto_1711645 ?auto_1711646 ) ) ( not ( = ?auto_1711644 ?auto_1711645 ) ) ( not ( = ?auto_1711644 ?auto_1711646 ) ) ( not ( = ?auto_1711648 ?auto_1711647 ) ) ( HOIST-AT ?auto_1711651 ?auto_1711648 ) ( not ( = ?auto_1711652 ?auto_1711651 ) ) ( AVAILABLE ?auto_1711651 ) ( SURFACE-AT ?auto_1711646 ?auto_1711648 ) ( ON ?auto_1711646 ?auto_1711650 ) ( CLEAR ?auto_1711646 ) ( not ( = ?auto_1711645 ?auto_1711650 ) ) ( not ( = ?auto_1711646 ?auto_1711650 ) ) ( not ( = ?auto_1711644 ?auto_1711650 ) ) ( TRUCK-AT ?auto_1711649 ?auto_1711647 ) ( SURFACE-AT ?auto_1711644 ?auto_1711647 ) ( CLEAR ?auto_1711644 ) ( IS-CRATE ?auto_1711645 ) ( AVAILABLE ?auto_1711652 ) ( IN ?auto_1711645 ?auto_1711649 ) ( ON ?auto_1711639 ?auto_1711638 ) ( ON ?auto_1711640 ?auto_1711639 ) ( ON ?auto_1711642 ?auto_1711640 ) ( ON ?auto_1711641 ?auto_1711642 ) ( ON ?auto_1711643 ?auto_1711641 ) ( ON ?auto_1711644 ?auto_1711643 ) ( not ( = ?auto_1711638 ?auto_1711639 ) ) ( not ( = ?auto_1711638 ?auto_1711640 ) ) ( not ( = ?auto_1711638 ?auto_1711642 ) ) ( not ( = ?auto_1711638 ?auto_1711641 ) ) ( not ( = ?auto_1711638 ?auto_1711643 ) ) ( not ( = ?auto_1711638 ?auto_1711644 ) ) ( not ( = ?auto_1711638 ?auto_1711645 ) ) ( not ( = ?auto_1711638 ?auto_1711646 ) ) ( not ( = ?auto_1711638 ?auto_1711650 ) ) ( not ( = ?auto_1711639 ?auto_1711640 ) ) ( not ( = ?auto_1711639 ?auto_1711642 ) ) ( not ( = ?auto_1711639 ?auto_1711641 ) ) ( not ( = ?auto_1711639 ?auto_1711643 ) ) ( not ( = ?auto_1711639 ?auto_1711644 ) ) ( not ( = ?auto_1711639 ?auto_1711645 ) ) ( not ( = ?auto_1711639 ?auto_1711646 ) ) ( not ( = ?auto_1711639 ?auto_1711650 ) ) ( not ( = ?auto_1711640 ?auto_1711642 ) ) ( not ( = ?auto_1711640 ?auto_1711641 ) ) ( not ( = ?auto_1711640 ?auto_1711643 ) ) ( not ( = ?auto_1711640 ?auto_1711644 ) ) ( not ( = ?auto_1711640 ?auto_1711645 ) ) ( not ( = ?auto_1711640 ?auto_1711646 ) ) ( not ( = ?auto_1711640 ?auto_1711650 ) ) ( not ( = ?auto_1711642 ?auto_1711641 ) ) ( not ( = ?auto_1711642 ?auto_1711643 ) ) ( not ( = ?auto_1711642 ?auto_1711644 ) ) ( not ( = ?auto_1711642 ?auto_1711645 ) ) ( not ( = ?auto_1711642 ?auto_1711646 ) ) ( not ( = ?auto_1711642 ?auto_1711650 ) ) ( not ( = ?auto_1711641 ?auto_1711643 ) ) ( not ( = ?auto_1711641 ?auto_1711644 ) ) ( not ( = ?auto_1711641 ?auto_1711645 ) ) ( not ( = ?auto_1711641 ?auto_1711646 ) ) ( not ( = ?auto_1711641 ?auto_1711650 ) ) ( not ( = ?auto_1711643 ?auto_1711644 ) ) ( not ( = ?auto_1711643 ?auto_1711645 ) ) ( not ( = ?auto_1711643 ?auto_1711646 ) ) ( not ( = ?auto_1711643 ?auto_1711650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711644 ?auto_1711645 ?auto_1711646 )
      ( MAKE-8CRATE-VERIFY ?auto_1711638 ?auto_1711639 ?auto_1711640 ?auto_1711642 ?auto_1711641 ?auto_1711643 ?auto_1711644 ?auto_1711645 ?auto_1711646 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1715754 - SURFACE
      ?auto_1715755 - SURFACE
      ?auto_1715756 - SURFACE
      ?auto_1715758 - SURFACE
      ?auto_1715757 - SURFACE
      ?auto_1715759 - SURFACE
      ?auto_1715760 - SURFACE
      ?auto_1715761 - SURFACE
      ?auto_1715762 - SURFACE
      ?auto_1715763 - SURFACE
    )
    :vars
    (
      ?auto_1715764 - HOIST
      ?auto_1715765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1715764 ?auto_1715765 ) ( SURFACE-AT ?auto_1715762 ?auto_1715765 ) ( CLEAR ?auto_1715762 ) ( LIFTING ?auto_1715764 ?auto_1715763 ) ( IS-CRATE ?auto_1715763 ) ( not ( = ?auto_1715762 ?auto_1715763 ) ) ( ON ?auto_1715755 ?auto_1715754 ) ( ON ?auto_1715756 ?auto_1715755 ) ( ON ?auto_1715758 ?auto_1715756 ) ( ON ?auto_1715757 ?auto_1715758 ) ( ON ?auto_1715759 ?auto_1715757 ) ( ON ?auto_1715760 ?auto_1715759 ) ( ON ?auto_1715761 ?auto_1715760 ) ( ON ?auto_1715762 ?auto_1715761 ) ( not ( = ?auto_1715754 ?auto_1715755 ) ) ( not ( = ?auto_1715754 ?auto_1715756 ) ) ( not ( = ?auto_1715754 ?auto_1715758 ) ) ( not ( = ?auto_1715754 ?auto_1715757 ) ) ( not ( = ?auto_1715754 ?auto_1715759 ) ) ( not ( = ?auto_1715754 ?auto_1715760 ) ) ( not ( = ?auto_1715754 ?auto_1715761 ) ) ( not ( = ?auto_1715754 ?auto_1715762 ) ) ( not ( = ?auto_1715754 ?auto_1715763 ) ) ( not ( = ?auto_1715755 ?auto_1715756 ) ) ( not ( = ?auto_1715755 ?auto_1715758 ) ) ( not ( = ?auto_1715755 ?auto_1715757 ) ) ( not ( = ?auto_1715755 ?auto_1715759 ) ) ( not ( = ?auto_1715755 ?auto_1715760 ) ) ( not ( = ?auto_1715755 ?auto_1715761 ) ) ( not ( = ?auto_1715755 ?auto_1715762 ) ) ( not ( = ?auto_1715755 ?auto_1715763 ) ) ( not ( = ?auto_1715756 ?auto_1715758 ) ) ( not ( = ?auto_1715756 ?auto_1715757 ) ) ( not ( = ?auto_1715756 ?auto_1715759 ) ) ( not ( = ?auto_1715756 ?auto_1715760 ) ) ( not ( = ?auto_1715756 ?auto_1715761 ) ) ( not ( = ?auto_1715756 ?auto_1715762 ) ) ( not ( = ?auto_1715756 ?auto_1715763 ) ) ( not ( = ?auto_1715758 ?auto_1715757 ) ) ( not ( = ?auto_1715758 ?auto_1715759 ) ) ( not ( = ?auto_1715758 ?auto_1715760 ) ) ( not ( = ?auto_1715758 ?auto_1715761 ) ) ( not ( = ?auto_1715758 ?auto_1715762 ) ) ( not ( = ?auto_1715758 ?auto_1715763 ) ) ( not ( = ?auto_1715757 ?auto_1715759 ) ) ( not ( = ?auto_1715757 ?auto_1715760 ) ) ( not ( = ?auto_1715757 ?auto_1715761 ) ) ( not ( = ?auto_1715757 ?auto_1715762 ) ) ( not ( = ?auto_1715757 ?auto_1715763 ) ) ( not ( = ?auto_1715759 ?auto_1715760 ) ) ( not ( = ?auto_1715759 ?auto_1715761 ) ) ( not ( = ?auto_1715759 ?auto_1715762 ) ) ( not ( = ?auto_1715759 ?auto_1715763 ) ) ( not ( = ?auto_1715760 ?auto_1715761 ) ) ( not ( = ?auto_1715760 ?auto_1715762 ) ) ( not ( = ?auto_1715760 ?auto_1715763 ) ) ( not ( = ?auto_1715761 ?auto_1715762 ) ) ( not ( = ?auto_1715761 ?auto_1715763 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1715762 ?auto_1715763 )
      ( MAKE-9CRATE-VERIFY ?auto_1715754 ?auto_1715755 ?auto_1715756 ?auto_1715758 ?auto_1715757 ?auto_1715759 ?auto_1715760 ?auto_1715761 ?auto_1715762 ?auto_1715763 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1715834 - SURFACE
      ?auto_1715835 - SURFACE
      ?auto_1715836 - SURFACE
      ?auto_1715838 - SURFACE
      ?auto_1715837 - SURFACE
      ?auto_1715839 - SURFACE
      ?auto_1715840 - SURFACE
      ?auto_1715841 - SURFACE
      ?auto_1715842 - SURFACE
      ?auto_1715843 - SURFACE
    )
    :vars
    (
      ?auto_1715845 - HOIST
      ?auto_1715844 - PLACE
      ?auto_1715846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1715845 ?auto_1715844 ) ( SURFACE-AT ?auto_1715842 ?auto_1715844 ) ( CLEAR ?auto_1715842 ) ( IS-CRATE ?auto_1715843 ) ( not ( = ?auto_1715842 ?auto_1715843 ) ) ( TRUCK-AT ?auto_1715846 ?auto_1715844 ) ( AVAILABLE ?auto_1715845 ) ( IN ?auto_1715843 ?auto_1715846 ) ( ON ?auto_1715842 ?auto_1715841 ) ( not ( = ?auto_1715841 ?auto_1715842 ) ) ( not ( = ?auto_1715841 ?auto_1715843 ) ) ( ON ?auto_1715835 ?auto_1715834 ) ( ON ?auto_1715836 ?auto_1715835 ) ( ON ?auto_1715838 ?auto_1715836 ) ( ON ?auto_1715837 ?auto_1715838 ) ( ON ?auto_1715839 ?auto_1715837 ) ( ON ?auto_1715840 ?auto_1715839 ) ( ON ?auto_1715841 ?auto_1715840 ) ( not ( = ?auto_1715834 ?auto_1715835 ) ) ( not ( = ?auto_1715834 ?auto_1715836 ) ) ( not ( = ?auto_1715834 ?auto_1715838 ) ) ( not ( = ?auto_1715834 ?auto_1715837 ) ) ( not ( = ?auto_1715834 ?auto_1715839 ) ) ( not ( = ?auto_1715834 ?auto_1715840 ) ) ( not ( = ?auto_1715834 ?auto_1715841 ) ) ( not ( = ?auto_1715834 ?auto_1715842 ) ) ( not ( = ?auto_1715834 ?auto_1715843 ) ) ( not ( = ?auto_1715835 ?auto_1715836 ) ) ( not ( = ?auto_1715835 ?auto_1715838 ) ) ( not ( = ?auto_1715835 ?auto_1715837 ) ) ( not ( = ?auto_1715835 ?auto_1715839 ) ) ( not ( = ?auto_1715835 ?auto_1715840 ) ) ( not ( = ?auto_1715835 ?auto_1715841 ) ) ( not ( = ?auto_1715835 ?auto_1715842 ) ) ( not ( = ?auto_1715835 ?auto_1715843 ) ) ( not ( = ?auto_1715836 ?auto_1715838 ) ) ( not ( = ?auto_1715836 ?auto_1715837 ) ) ( not ( = ?auto_1715836 ?auto_1715839 ) ) ( not ( = ?auto_1715836 ?auto_1715840 ) ) ( not ( = ?auto_1715836 ?auto_1715841 ) ) ( not ( = ?auto_1715836 ?auto_1715842 ) ) ( not ( = ?auto_1715836 ?auto_1715843 ) ) ( not ( = ?auto_1715838 ?auto_1715837 ) ) ( not ( = ?auto_1715838 ?auto_1715839 ) ) ( not ( = ?auto_1715838 ?auto_1715840 ) ) ( not ( = ?auto_1715838 ?auto_1715841 ) ) ( not ( = ?auto_1715838 ?auto_1715842 ) ) ( not ( = ?auto_1715838 ?auto_1715843 ) ) ( not ( = ?auto_1715837 ?auto_1715839 ) ) ( not ( = ?auto_1715837 ?auto_1715840 ) ) ( not ( = ?auto_1715837 ?auto_1715841 ) ) ( not ( = ?auto_1715837 ?auto_1715842 ) ) ( not ( = ?auto_1715837 ?auto_1715843 ) ) ( not ( = ?auto_1715839 ?auto_1715840 ) ) ( not ( = ?auto_1715839 ?auto_1715841 ) ) ( not ( = ?auto_1715839 ?auto_1715842 ) ) ( not ( = ?auto_1715839 ?auto_1715843 ) ) ( not ( = ?auto_1715840 ?auto_1715841 ) ) ( not ( = ?auto_1715840 ?auto_1715842 ) ) ( not ( = ?auto_1715840 ?auto_1715843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1715841 ?auto_1715842 ?auto_1715843 )
      ( MAKE-9CRATE-VERIFY ?auto_1715834 ?auto_1715835 ?auto_1715836 ?auto_1715838 ?auto_1715837 ?auto_1715839 ?auto_1715840 ?auto_1715841 ?auto_1715842 ?auto_1715843 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1715924 - SURFACE
      ?auto_1715925 - SURFACE
      ?auto_1715926 - SURFACE
      ?auto_1715928 - SURFACE
      ?auto_1715927 - SURFACE
      ?auto_1715929 - SURFACE
      ?auto_1715930 - SURFACE
      ?auto_1715931 - SURFACE
      ?auto_1715932 - SURFACE
      ?auto_1715933 - SURFACE
    )
    :vars
    (
      ?auto_1715934 - HOIST
      ?auto_1715935 - PLACE
      ?auto_1715936 - TRUCK
      ?auto_1715937 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1715934 ?auto_1715935 ) ( SURFACE-AT ?auto_1715932 ?auto_1715935 ) ( CLEAR ?auto_1715932 ) ( IS-CRATE ?auto_1715933 ) ( not ( = ?auto_1715932 ?auto_1715933 ) ) ( AVAILABLE ?auto_1715934 ) ( IN ?auto_1715933 ?auto_1715936 ) ( ON ?auto_1715932 ?auto_1715931 ) ( not ( = ?auto_1715931 ?auto_1715932 ) ) ( not ( = ?auto_1715931 ?auto_1715933 ) ) ( TRUCK-AT ?auto_1715936 ?auto_1715937 ) ( not ( = ?auto_1715937 ?auto_1715935 ) ) ( ON ?auto_1715925 ?auto_1715924 ) ( ON ?auto_1715926 ?auto_1715925 ) ( ON ?auto_1715928 ?auto_1715926 ) ( ON ?auto_1715927 ?auto_1715928 ) ( ON ?auto_1715929 ?auto_1715927 ) ( ON ?auto_1715930 ?auto_1715929 ) ( ON ?auto_1715931 ?auto_1715930 ) ( not ( = ?auto_1715924 ?auto_1715925 ) ) ( not ( = ?auto_1715924 ?auto_1715926 ) ) ( not ( = ?auto_1715924 ?auto_1715928 ) ) ( not ( = ?auto_1715924 ?auto_1715927 ) ) ( not ( = ?auto_1715924 ?auto_1715929 ) ) ( not ( = ?auto_1715924 ?auto_1715930 ) ) ( not ( = ?auto_1715924 ?auto_1715931 ) ) ( not ( = ?auto_1715924 ?auto_1715932 ) ) ( not ( = ?auto_1715924 ?auto_1715933 ) ) ( not ( = ?auto_1715925 ?auto_1715926 ) ) ( not ( = ?auto_1715925 ?auto_1715928 ) ) ( not ( = ?auto_1715925 ?auto_1715927 ) ) ( not ( = ?auto_1715925 ?auto_1715929 ) ) ( not ( = ?auto_1715925 ?auto_1715930 ) ) ( not ( = ?auto_1715925 ?auto_1715931 ) ) ( not ( = ?auto_1715925 ?auto_1715932 ) ) ( not ( = ?auto_1715925 ?auto_1715933 ) ) ( not ( = ?auto_1715926 ?auto_1715928 ) ) ( not ( = ?auto_1715926 ?auto_1715927 ) ) ( not ( = ?auto_1715926 ?auto_1715929 ) ) ( not ( = ?auto_1715926 ?auto_1715930 ) ) ( not ( = ?auto_1715926 ?auto_1715931 ) ) ( not ( = ?auto_1715926 ?auto_1715932 ) ) ( not ( = ?auto_1715926 ?auto_1715933 ) ) ( not ( = ?auto_1715928 ?auto_1715927 ) ) ( not ( = ?auto_1715928 ?auto_1715929 ) ) ( not ( = ?auto_1715928 ?auto_1715930 ) ) ( not ( = ?auto_1715928 ?auto_1715931 ) ) ( not ( = ?auto_1715928 ?auto_1715932 ) ) ( not ( = ?auto_1715928 ?auto_1715933 ) ) ( not ( = ?auto_1715927 ?auto_1715929 ) ) ( not ( = ?auto_1715927 ?auto_1715930 ) ) ( not ( = ?auto_1715927 ?auto_1715931 ) ) ( not ( = ?auto_1715927 ?auto_1715932 ) ) ( not ( = ?auto_1715927 ?auto_1715933 ) ) ( not ( = ?auto_1715929 ?auto_1715930 ) ) ( not ( = ?auto_1715929 ?auto_1715931 ) ) ( not ( = ?auto_1715929 ?auto_1715932 ) ) ( not ( = ?auto_1715929 ?auto_1715933 ) ) ( not ( = ?auto_1715930 ?auto_1715931 ) ) ( not ( = ?auto_1715930 ?auto_1715932 ) ) ( not ( = ?auto_1715930 ?auto_1715933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1715931 ?auto_1715932 ?auto_1715933 )
      ( MAKE-9CRATE-VERIFY ?auto_1715924 ?auto_1715925 ?auto_1715926 ?auto_1715928 ?auto_1715927 ?auto_1715929 ?auto_1715930 ?auto_1715931 ?auto_1715932 ?auto_1715933 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716023 - SURFACE
      ?auto_1716024 - SURFACE
      ?auto_1716025 - SURFACE
      ?auto_1716027 - SURFACE
      ?auto_1716026 - SURFACE
      ?auto_1716028 - SURFACE
      ?auto_1716029 - SURFACE
      ?auto_1716030 - SURFACE
      ?auto_1716031 - SURFACE
      ?auto_1716032 - SURFACE
    )
    :vars
    (
      ?auto_1716033 - HOIST
      ?auto_1716034 - PLACE
      ?auto_1716036 - TRUCK
      ?auto_1716037 - PLACE
      ?auto_1716035 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716033 ?auto_1716034 ) ( SURFACE-AT ?auto_1716031 ?auto_1716034 ) ( CLEAR ?auto_1716031 ) ( IS-CRATE ?auto_1716032 ) ( not ( = ?auto_1716031 ?auto_1716032 ) ) ( AVAILABLE ?auto_1716033 ) ( ON ?auto_1716031 ?auto_1716030 ) ( not ( = ?auto_1716030 ?auto_1716031 ) ) ( not ( = ?auto_1716030 ?auto_1716032 ) ) ( TRUCK-AT ?auto_1716036 ?auto_1716037 ) ( not ( = ?auto_1716037 ?auto_1716034 ) ) ( HOIST-AT ?auto_1716035 ?auto_1716037 ) ( LIFTING ?auto_1716035 ?auto_1716032 ) ( not ( = ?auto_1716033 ?auto_1716035 ) ) ( ON ?auto_1716024 ?auto_1716023 ) ( ON ?auto_1716025 ?auto_1716024 ) ( ON ?auto_1716027 ?auto_1716025 ) ( ON ?auto_1716026 ?auto_1716027 ) ( ON ?auto_1716028 ?auto_1716026 ) ( ON ?auto_1716029 ?auto_1716028 ) ( ON ?auto_1716030 ?auto_1716029 ) ( not ( = ?auto_1716023 ?auto_1716024 ) ) ( not ( = ?auto_1716023 ?auto_1716025 ) ) ( not ( = ?auto_1716023 ?auto_1716027 ) ) ( not ( = ?auto_1716023 ?auto_1716026 ) ) ( not ( = ?auto_1716023 ?auto_1716028 ) ) ( not ( = ?auto_1716023 ?auto_1716029 ) ) ( not ( = ?auto_1716023 ?auto_1716030 ) ) ( not ( = ?auto_1716023 ?auto_1716031 ) ) ( not ( = ?auto_1716023 ?auto_1716032 ) ) ( not ( = ?auto_1716024 ?auto_1716025 ) ) ( not ( = ?auto_1716024 ?auto_1716027 ) ) ( not ( = ?auto_1716024 ?auto_1716026 ) ) ( not ( = ?auto_1716024 ?auto_1716028 ) ) ( not ( = ?auto_1716024 ?auto_1716029 ) ) ( not ( = ?auto_1716024 ?auto_1716030 ) ) ( not ( = ?auto_1716024 ?auto_1716031 ) ) ( not ( = ?auto_1716024 ?auto_1716032 ) ) ( not ( = ?auto_1716025 ?auto_1716027 ) ) ( not ( = ?auto_1716025 ?auto_1716026 ) ) ( not ( = ?auto_1716025 ?auto_1716028 ) ) ( not ( = ?auto_1716025 ?auto_1716029 ) ) ( not ( = ?auto_1716025 ?auto_1716030 ) ) ( not ( = ?auto_1716025 ?auto_1716031 ) ) ( not ( = ?auto_1716025 ?auto_1716032 ) ) ( not ( = ?auto_1716027 ?auto_1716026 ) ) ( not ( = ?auto_1716027 ?auto_1716028 ) ) ( not ( = ?auto_1716027 ?auto_1716029 ) ) ( not ( = ?auto_1716027 ?auto_1716030 ) ) ( not ( = ?auto_1716027 ?auto_1716031 ) ) ( not ( = ?auto_1716027 ?auto_1716032 ) ) ( not ( = ?auto_1716026 ?auto_1716028 ) ) ( not ( = ?auto_1716026 ?auto_1716029 ) ) ( not ( = ?auto_1716026 ?auto_1716030 ) ) ( not ( = ?auto_1716026 ?auto_1716031 ) ) ( not ( = ?auto_1716026 ?auto_1716032 ) ) ( not ( = ?auto_1716028 ?auto_1716029 ) ) ( not ( = ?auto_1716028 ?auto_1716030 ) ) ( not ( = ?auto_1716028 ?auto_1716031 ) ) ( not ( = ?auto_1716028 ?auto_1716032 ) ) ( not ( = ?auto_1716029 ?auto_1716030 ) ) ( not ( = ?auto_1716029 ?auto_1716031 ) ) ( not ( = ?auto_1716029 ?auto_1716032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716030 ?auto_1716031 ?auto_1716032 )
      ( MAKE-9CRATE-VERIFY ?auto_1716023 ?auto_1716024 ?auto_1716025 ?auto_1716027 ?auto_1716026 ?auto_1716028 ?auto_1716029 ?auto_1716030 ?auto_1716031 ?auto_1716032 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716131 - SURFACE
      ?auto_1716132 - SURFACE
      ?auto_1716133 - SURFACE
      ?auto_1716135 - SURFACE
      ?auto_1716134 - SURFACE
      ?auto_1716136 - SURFACE
      ?auto_1716137 - SURFACE
      ?auto_1716138 - SURFACE
      ?auto_1716139 - SURFACE
      ?auto_1716140 - SURFACE
    )
    :vars
    (
      ?auto_1716142 - HOIST
      ?auto_1716145 - PLACE
      ?auto_1716144 - TRUCK
      ?auto_1716141 - PLACE
      ?auto_1716146 - HOIST
      ?auto_1716143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716142 ?auto_1716145 ) ( SURFACE-AT ?auto_1716139 ?auto_1716145 ) ( CLEAR ?auto_1716139 ) ( IS-CRATE ?auto_1716140 ) ( not ( = ?auto_1716139 ?auto_1716140 ) ) ( AVAILABLE ?auto_1716142 ) ( ON ?auto_1716139 ?auto_1716138 ) ( not ( = ?auto_1716138 ?auto_1716139 ) ) ( not ( = ?auto_1716138 ?auto_1716140 ) ) ( TRUCK-AT ?auto_1716144 ?auto_1716141 ) ( not ( = ?auto_1716141 ?auto_1716145 ) ) ( HOIST-AT ?auto_1716146 ?auto_1716141 ) ( not ( = ?auto_1716142 ?auto_1716146 ) ) ( AVAILABLE ?auto_1716146 ) ( SURFACE-AT ?auto_1716140 ?auto_1716141 ) ( ON ?auto_1716140 ?auto_1716143 ) ( CLEAR ?auto_1716140 ) ( not ( = ?auto_1716139 ?auto_1716143 ) ) ( not ( = ?auto_1716140 ?auto_1716143 ) ) ( not ( = ?auto_1716138 ?auto_1716143 ) ) ( ON ?auto_1716132 ?auto_1716131 ) ( ON ?auto_1716133 ?auto_1716132 ) ( ON ?auto_1716135 ?auto_1716133 ) ( ON ?auto_1716134 ?auto_1716135 ) ( ON ?auto_1716136 ?auto_1716134 ) ( ON ?auto_1716137 ?auto_1716136 ) ( ON ?auto_1716138 ?auto_1716137 ) ( not ( = ?auto_1716131 ?auto_1716132 ) ) ( not ( = ?auto_1716131 ?auto_1716133 ) ) ( not ( = ?auto_1716131 ?auto_1716135 ) ) ( not ( = ?auto_1716131 ?auto_1716134 ) ) ( not ( = ?auto_1716131 ?auto_1716136 ) ) ( not ( = ?auto_1716131 ?auto_1716137 ) ) ( not ( = ?auto_1716131 ?auto_1716138 ) ) ( not ( = ?auto_1716131 ?auto_1716139 ) ) ( not ( = ?auto_1716131 ?auto_1716140 ) ) ( not ( = ?auto_1716131 ?auto_1716143 ) ) ( not ( = ?auto_1716132 ?auto_1716133 ) ) ( not ( = ?auto_1716132 ?auto_1716135 ) ) ( not ( = ?auto_1716132 ?auto_1716134 ) ) ( not ( = ?auto_1716132 ?auto_1716136 ) ) ( not ( = ?auto_1716132 ?auto_1716137 ) ) ( not ( = ?auto_1716132 ?auto_1716138 ) ) ( not ( = ?auto_1716132 ?auto_1716139 ) ) ( not ( = ?auto_1716132 ?auto_1716140 ) ) ( not ( = ?auto_1716132 ?auto_1716143 ) ) ( not ( = ?auto_1716133 ?auto_1716135 ) ) ( not ( = ?auto_1716133 ?auto_1716134 ) ) ( not ( = ?auto_1716133 ?auto_1716136 ) ) ( not ( = ?auto_1716133 ?auto_1716137 ) ) ( not ( = ?auto_1716133 ?auto_1716138 ) ) ( not ( = ?auto_1716133 ?auto_1716139 ) ) ( not ( = ?auto_1716133 ?auto_1716140 ) ) ( not ( = ?auto_1716133 ?auto_1716143 ) ) ( not ( = ?auto_1716135 ?auto_1716134 ) ) ( not ( = ?auto_1716135 ?auto_1716136 ) ) ( not ( = ?auto_1716135 ?auto_1716137 ) ) ( not ( = ?auto_1716135 ?auto_1716138 ) ) ( not ( = ?auto_1716135 ?auto_1716139 ) ) ( not ( = ?auto_1716135 ?auto_1716140 ) ) ( not ( = ?auto_1716135 ?auto_1716143 ) ) ( not ( = ?auto_1716134 ?auto_1716136 ) ) ( not ( = ?auto_1716134 ?auto_1716137 ) ) ( not ( = ?auto_1716134 ?auto_1716138 ) ) ( not ( = ?auto_1716134 ?auto_1716139 ) ) ( not ( = ?auto_1716134 ?auto_1716140 ) ) ( not ( = ?auto_1716134 ?auto_1716143 ) ) ( not ( = ?auto_1716136 ?auto_1716137 ) ) ( not ( = ?auto_1716136 ?auto_1716138 ) ) ( not ( = ?auto_1716136 ?auto_1716139 ) ) ( not ( = ?auto_1716136 ?auto_1716140 ) ) ( not ( = ?auto_1716136 ?auto_1716143 ) ) ( not ( = ?auto_1716137 ?auto_1716138 ) ) ( not ( = ?auto_1716137 ?auto_1716139 ) ) ( not ( = ?auto_1716137 ?auto_1716140 ) ) ( not ( = ?auto_1716137 ?auto_1716143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716138 ?auto_1716139 ?auto_1716140 )
      ( MAKE-9CRATE-VERIFY ?auto_1716131 ?auto_1716132 ?auto_1716133 ?auto_1716135 ?auto_1716134 ?auto_1716136 ?auto_1716137 ?auto_1716138 ?auto_1716139 ?auto_1716140 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716240 - SURFACE
      ?auto_1716241 - SURFACE
      ?auto_1716242 - SURFACE
      ?auto_1716244 - SURFACE
      ?auto_1716243 - SURFACE
      ?auto_1716245 - SURFACE
      ?auto_1716246 - SURFACE
      ?auto_1716247 - SURFACE
      ?auto_1716248 - SURFACE
      ?auto_1716249 - SURFACE
    )
    :vars
    (
      ?auto_1716251 - HOIST
      ?auto_1716255 - PLACE
      ?auto_1716253 - PLACE
      ?auto_1716250 - HOIST
      ?auto_1716254 - SURFACE
      ?auto_1716252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716251 ?auto_1716255 ) ( SURFACE-AT ?auto_1716248 ?auto_1716255 ) ( CLEAR ?auto_1716248 ) ( IS-CRATE ?auto_1716249 ) ( not ( = ?auto_1716248 ?auto_1716249 ) ) ( AVAILABLE ?auto_1716251 ) ( ON ?auto_1716248 ?auto_1716247 ) ( not ( = ?auto_1716247 ?auto_1716248 ) ) ( not ( = ?auto_1716247 ?auto_1716249 ) ) ( not ( = ?auto_1716253 ?auto_1716255 ) ) ( HOIST-AT ?auto_1716250 ?auto_1716253 ) ( not ( = ?auto_1716251 ?auto_1716250 ) ) ( AVAILABLE ?auto_1716250 ) ( SURFACE-AT ?auto_1716249 ?auto_1716253 ) ( ON ?auto_1716249 ?auto_1716254 ) ( CLEAR ?auto_1716249 ) ( not ( = ?auto_1716248 ?auto_1716254 ) ) ( not ( = ?auto_1716249 ?auto_1716254 ) ) ( not ( = ?auto_1716247 ?auto_1716254 ) ) ( TRUCK-AT ?auto_1716252 ?auto_1716255 ) ( ON ?auto_1716241 ?auto_1716240 ) ( ON ?auto_1716242 ?auto_1716241 ) ( ON ?auto_1716244 ?auto_1716242 ) ( ON ?auto_1716243 ?auto_1716244 ) ( ON ?auto_1716245 ?auto_1716243 ) ( ON ?auto_1716246 ?auto_1716245 ) ( ON ?auto_1716247 ?auto_1716246 ) ( not ( = ?auto_1716240 ?auto_1716241 ) ) ( not ( = ?auto_1716240 ?auto_1716242 ) ) ( not ( = ?auto_1716240 ?auto_1716244 ) ) ( not ( = ?auto_1716240 ?auto_1716243 ) ) ( not ( = ?auto_1716240 ?auto_1716245 ) ) ( not ( = ?auto_1716240 ?auto_1716246 ) ) ( not ( = ?auto_1716240 ?auto_1716247 ) ) ( not ( = ?auto_1716240 ?auto_1716248 ) ) ( not ( = ?auto_1716240 ?auto_1716249 ) ) ( not ( = ?auto_1716240 ?auto_1716254 ) ) ( not ( = ?auto_1716241 ?auto_1716242 ) ) ( not ( = ?auto_1716241 ?auto_1716244 ) ) ( not ( = ?auto_1716241 ?auto_1716243 ) ) ( not ( = ?auto_1716241 ?auto_1716245 ) ) ( not ( = ?auto_1716241 ?auto_1716246 ) ) ( not ( = ?auto_1716241 ?auto_1716247 ) ) ( not ( = ?auto_1716241 ?auto_1716248 ) ) ( not ( = ?auto_1716241 ?auto_1716249 ) ) ( not ( = ?auto_1716241 ?auto_1716254 ) ) ( not ( = ?auto_1716242 ?auto_1716244 ) ) ( not ( = ?auto_1716242 ?auto_1716243 ) ) ( not ( = ?auto_1716242 ?auto_1716245 ) ) ( not ( = ?auto_1716242 ?auto_1716246 ) ) ( not ( = ?auto_1716242 ?auto_1716247 ) ) ( not ( = ?auto_1716242 ?auto_1716248 ) ) ( not ( = ?auto_1716242 ?auto_1716249 ) ) ( not ( = ?auto_1716242 ?auto_1716254 ) ) ( not ( = ?auto_1716244 ?auto_1716243 ) ) ( not ( = ?auto_1716244 ?auto_1716245 ) ) ( not ( = ?auto_1716244 ?auto_1716246 ) ) ( not ( = ?auto_1716244 ?auto_1716247 ) ) ( not ( = ?auto_1716244 ?auto_1716248 ) ) ( not ( = ?auto_1716244 ?auto_1716249 ) ) ( not ( = ?auto_1716244 ?auto_1716254 ) ) ( not ( = ?auto_1716243 ?auto_1716245 ) ) ( not ( = ?auto_1716243 ?auto_1716246 ) ) ( not ( = ?auto_1716243 ?auto_1716247 ) ) ( not ( = ?auto_1716243 ?auto_1716248 ) ) ( not ( = ?auto_1716243 ?auto_1716249 ) ) ( not ( = ?auto_1716243 ?auto_1716254 ) ) ( not ( = ?auto_1716245 ?auto_1716246 ) ) ( not ( = ?auto_1716245 ?auto_1716247 ) ) ( not ( = ?auto_1716245 ?auto_1716248 ) ) ( not ( = ?auto_1716245 ?auto_1716249 ) ) ( not ( = ?auto_1716245 ?auto_1716254 ) ) ( not ( = ?auto_1716246 ?auto_1716247 ) ) ( not ( = ?auto_1716246 ?auto_1716248 ) ) ( not ( = ?auto_1716246 ?auto_1716249 ) ) ( not ( = ?auto_1716246 ?auto_1716254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716247 ?auto_1716248 ?auto_1716249 )
      ( MAKE-9CRATE-VERIFY ?auto_1716240 ?auto_1716241 ?auto_1716242 ?auto_1716244 ?auto_1716243 ?auto_1716245 ?auto_1716246 ?auto_1716247 ?auto_1716248 ?auto_1716249 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716349 - SURFACE
      ?auto_1716350 - SURFACE
      ?auto_1716351 - SURFACE
      ?auto_1716353 - SURFACE
      ?auto_1716352 - SURFACE
      ?auto_1716354 - SURFACE
      ?auto_1716355 - SURFACE
      ?auto_1716356 - SURFACE
      ?auto_1716357 - SURFACE
      ?auto_1716358 - SURFACE
    )
    :vars
    (
      ?auto_1716360 - HOIST
      ?auto_1716362 - PLACE
      ?auto_1716363 - PLACE
      ?auto_1716361 - HOIST
      ?auto_1716359 - SURFACE
      ?auto_1716364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716360 ?auto_1716362 ) ( IS-CRATE ?auto_1716358 ) ( not ( = ?auto_1716357 ?auto_1716358 ) ) ( not ( = ?auto_1716356 ?auto_1716357 ) ) ( not ( = ?auto_1716356 ?auto_1716358 ) ) ( not ( = ?auto_1716363 ?auto_1716362 ) ) ( HOIST-AT ?auto_1716361 ?auto_1716363 ) ( not ( = ?auto_1716360 ?auto_1716361 ) ) ( AVAILABLE ?auto_1716361 ) ( SURFACE-AT ?auto_1716358 ?auto_1716363 ) ( ON ?auto_1716358 ?auto_1716359 ) ( CLEAR ?auto_1716358 ) ( not ( = ?auto_1716357 ?auto_1716359 ) ) ( not ( = ?auto_1716358 ?auto_1716359 ) ) ( not ( = ?auto_1716356 ?auto_1716359 ) ) ( TRUCK-AT ?auto_1716364 ?auto_1716362 ) ( SURFACE-AT ?auto_1716356 ?auto_1716362 ) ( CLEAR ?auto_1716356 ) ( LIFTING ?auto_1716360 ?auto_1716357 ) ( IS-CRATE ?auto_1716357 ) ( ON ?auto_1716350 ?auto_1716349 ) ( ON ?auto_1716351 ?auto_1716350 ) ( ON ?auto_1716353 ?auto_1716351 ) ( ON ?auto_1716352 ?auto_1716353 ) ( ON ?auto_1716354 ?auto_1716352 ) ( ON ?auto_1716355 ?auto_1716354 ) ( ON ?auto_1716356 ?auto_1716355 ) ( not ( = ?auto_1716349 ?auto_1716350 ) ) ( not ( = ?auto_1716349 ?auto_1716351 ) ) ( not ( = ?auto_1716349 ?auto_1716353 ) ) ( not ( = ?auto_1716349 ?auto_1716352 ) ) ( not ( = ?auto_1716349 ?auto_1716354 ) ) ( not ( = ?auto_1716349 ?auto_1716355 ) ) ( not ( = ?auto_1716349 ?auto_1716356 ) ) ( not ( = ?auto_1716349 ?auto_1716357 ) ) ( not ( = ?auto_1716349 ?auto_1716358 ) ) ( not ( = ?auto_1716349 ?auto_1716359 ) ) ( not ( = ?auto_1716350 ?auto_1716351 ) ) ( not ( = ?auto_1716350 ?auto_1716353 ) ) ( not ( = ?auto_1716350 ?auto_1716352 ) ) ( not ( = ?auto_1716350 ?auto_1716354 ) ) ( not ( = ?auto_1716350 ?auto_1716355 ) ) ( not ( = ?auto_1716350 ?auto_1716356 ) ) ( not ( = ?auto_1716350 ?auto_1716357 ) ) ( not ( = ?auto_1716350 ?auto_1716358 ) ) ( not ( = ?auto_1716350 ?auto_1716359 ) ) ( not ( = ?auto_1716351 ?auto_1716353 ) ) ( not ( = ?auto_1716351 ?auto_1716352 ) ) ( not ( = ?auto_1716351 ?auto_1716354 ) ) ( not ( = ?auto_1716351 ?auto_1716355 ) ) ( not ( = ?auto_1716351 ?auto_1716356 ) ) ( not ( = ?auto_1716351 ?auto_1716357 ) ) ( not ( = ?auto_1716351 ?auto_1716358 ) ) ( not ( = ?auto_1716351 ?auto_1716359 ) ) ( not ( = ?auto_1716353 ?auto_1716352 ) ) ( not ( = ?auto_1716353 ?auto_1716354 ) ) ( not ( = ?auto_1716353 ?auto_1716355 ) ) ( not ( = ?auto_1716353 ?auto_1716356 ) ) ( not ( = ?auto_1716353 ?auto_1716357 ) ) ( not ( = ?auto_1716353 ?auto_1716358 ) ) ( not ( = ?auto_1716353 ?auto_1716359 ) ) ( not ( = ?auto_1716352 ?auto_1716354 ) ) ( not ( = ?auto_1716352 ?auto_1716355 ) ) ( not ( = ?auto_1716352 ?auto_1716356 ) ) ( not ( = ?auto_1716352 ?auto_1716357 ) ) ( not ( = ?auto_1716352 ?auto_1716358 ) ) ( not ( = ?auto_1716352 ?auto_1716359 ) ) ( not ( = ?auto_1716354 ?auto_1716355 ) ) ( not ( = ?auto_1716354 ?auto_1716356 ) ) ( not ( = ?auto_1716354 ?auto_1716357 ) ) ( not ( = ?auto_1716354 ?auto_1716358 ) ) ( not ( = ?auto_1716354 ?auto_1716359 ) ) ( not ( = ?auto_1716355 ?auto_1716356 ) ) ( not ( = ?auto_1716355 ?auto_1716357 ) ) ( not ( = ?auto_1716355 ?auto_1716358 ) ) ( not ( = ?auto_1716355 ?auto_1716359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716356 ?auto_1716357 ?auto_1716358 )
      ( MAKE-9CRATE-VERIFY ?auto_1716349 ?auto_1716350 ?auto_1716351 ?auto_1716353 ?auto_1716352 ?auto_1716354 ?auto_1716355 ?auto_1716356 ?auto_1716357 ?auto_1716358 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716458 - SURFACE
      ?auto_1716459 - SURFACE
      ?auto_1716460 - SURFACE
      ?auto_1716462 - SURFACE
      ?auto_1716461 - SURFACE
      ?auto_1716463 - SURFACE
      ?auto_1716464 - SURFACE
      ?auto_1716465 - SURFACE
      ?auto_1716466 - SURFACE
      ?auto_1716467 - SURFACE
    )
    :vars
    (
      ?auto_1716470 - HOIST
      ?auto_1716473 - PLACE
      ?auto_1716471 - PLACE
      ?auto_1716469 - HOIST
      ?auto_1716472 - SURFACE
      ?auto_1716468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716470 ?auto_1716473 ) ( IS-CRATE ?auto_1716467 ) ( not ( = ?auto_1716466 ?auto_1716467 ) ) ( not ( = ?auto_1716465 ?auto_1716466 ) ) ( not ( = ?auto_1716465 ?auto_1716467 ) ) ( not ( = ?auto_1716471 ?auto_1716473 ) ) ( HOIST-AT ?auto_1716469 ?auto_1716471 ) ( not ( = ?auto_1716470 ?auto_1716469 ) ) ( AVAILABLE ?auto_1716469 ) ( SURFACE-AT ?auto_1716467 ?auto_1716471 ) ( ON ?auto_1716467 ?auto_1716472 ) ( CLEAR ?auto_1716467 ) ( not ( = ?auto_1716466 ?auto_1716472 ) ) ( not ( = ?auto_1716467 ?auto_1716472 ) ) ( not ( = ?auto_1716465 ?auto_1716472 ) ) ( TRUCK-AT ?auto_1716468 ?auto_1716473 ) ( SURFACE-AT ?auto_1716465 ?auto_1716473 ) ( CLEAR ?auto_1716465 ) ( IS-CRATE ?auto_1716466 ) ( AVAILABLE ?auto_1716470 ) ( IN ?auto_1716466 ?auto_1716468 ) ( ON ?auto_1716459 ?auto_1716458 ) ( ON ?auto_1716460 ?auto_1716459 ) ( ON ?auto_1716462 ?auto_1716460 ) ( ON ?auto_1716461 ?auto_1716462 ) ( ON ?auto_1716463 ?auto_1716461 ) ( ON ?auto_1716464 ?auto_1716463 ) ( ON ?auto_1716465 ?auto_1716464 ) ( not ( = ?auto_1716458 ?auto_1716459 ) ) ( not ( = ?auto_1716458 ?auto_1716460 ) ) ( not ( = ?auto_1716458 ?auto_1716462 ) ) ( not ( = ?auto_1716458 ?auto_1716461 ) ) ( not ( = ?auto_1716458 ?auto_1716463 ) ) ( not ( = ?auto_1716458 ?auto_1716464 ) ) ( not ( = ?auto_1716458 ?auto_1716465 ) ) ( not ( = ?auto_1716458 ?auto_1716466 ) ) ( not ( = ?auto_1716458 ?auto_1716467 ) ) ( not ( = ?auto_1716458 ?auto_1716472 ) ) ( not ( = ?auto_1716459 ?auto_1716460 ) ) ( not ( = ?auto_1716459 ?auto_1716462 ) ) ( not ( = ?auto_1716459 ?auto_1716461 ) ) ( not ( = ?auto_1716459 ?auto_1716463 ) ) ( not ( = ?auto_1716459 ?auto_1716464 ) ) ( not ( = ?auto_1716459 ?auto_1716465 ) ) ( not ( = ?auto_1716459 ?auto_1716466 ) ) ( not ( = ?auto_1716459 ?auto_1716467 ) ) ( not ( = ?auto_1716459 ?auto_1716472 ) ) ( not ( = ?auto_1716460 ?auto_1716462 ) ) ( not ( = ?auto_1716460 ?auto_1716461 ) ) ( not ( = ?auto_1716460 ?auto_1716463 ) ) ( not ( = ?auto_1716460 ?auto_1716464 ) ) ( not ( = ?auto_1716460 ?auto_1716465 ) ) ( not ( = ?auto_1716460 ?auto_1716466 ) ) ( not ( = ?auto_1716460 ?auto_1716467 ) ) ( not ( = ?auto_1716460 ?auto_1716472 ) ) ( not ( = ?auto_1716462 ?auto_1716461 ) ) ( not ( = ?auto_1716462 ?auto_1716463 ) ) ( not ( = ?auto_1716462 ?auto_1716464 ) ) ( not ( = ?auto_1716462 ?auto_1716465 ) ) ( not ( = ?auto_1716462 ?auto_1716466 ) ) ( not ( = ?auto_1716462 ?auto_1716467 ) ) ( not ( = ?auto_1716462 ?auto_1716472 ) ) ( not ( = ?auto_1716461 ?auto_1716463 ) ) ( not ( = ?auto_1716461 ?auto_1716464 ) ) ( not ( = ?auto_1716461 ?auto_1716465 ) ) ( not ( = ?auto_1716461 ?auto_1716466 ) ) ( not ( = ?auto_1716461 ?auto_1716467 ) ) ( not ( = ?auto_1716461 ?auto_1716472 ) ) ( not ( = ?auto_1716463 ?auto_1716464 ) ) ( not ( = ?auto_1716463 ?auto_1716465 ) ) ( not ( = ?auto_1716463 ?auto_1716466 ) ) ( not ( = ?auto_1716463 ?auto_1716467 ) ) ( not ( = ?auto_1716463 ?auto_1716472 ) ) ( not ( = ?auto_1716464 ?auto_1716465 ) ) ( not ( = ?auto_1716464 ?auto_1716466 ) ) ( not ( = ?auto_1716464 ?auto_1716467 ) ) ( not ( = ?auto_1716464 ?auto_1716472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716465 ?auto_1716466 ?auto_1716467 )
      ( MAKE-9CRATE-VERIFY ?auto_1716458 ?auto_1716459 ?auto_1716460 ?auto_1716462 ?auto_1716461 ?auto_1716463 ?auto_1716464 ?auto_1716465 ?auto_1716466 ?auto_1716467 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722023 - SURFACE
      ?auto_1722024 - SURFACE
      ?auto_1722025 - SURFACE
      ?auto_1722027 - SURFACE
      ?auto_1722026 - SURFACE
      ?auto_1722028 - SURFACE
      ?auto_1722029 - SURFACE
      ?auto_1722030 - SURFACE
      ?auto_1722031 - SURFACE
      ?auto_1722032 - SURFACE
      ?auto_1722033 - SURFACE
    )
    :vars
    (
      ?auto_1722034 - HOIST
      ?auto_1722035 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722034 ?auto_1722035 ) ( SURFACE-AT ?auto_1722032 ?auto_1722035 ) ( CLEAR ?auto_1722032 ) ( LIFTING ?auto_1722034 ?auto_1722033 ) ( IS-CRATE ?auto_1722033 ) ( not ( = ?auto_1722032 ?auto_1722033 ) ) ( ON ?auto_1722024 ?auto_1722023 ) ( ON ?auto_1722025 ?auto_1722024 ) ( ON ?auto_1722027 ?auto_1722025 ) ( ON ?auto_1722026 ?auto_1722027 ) ( ON ?auto_1722028 ?auto_1722026 ) ( ON ?auto_1722029 ?auto_1722028 ) ( ON ?auto_1722030 ?auto_1722029 ) ( ON ?auto_1722031 ?auto_1722030 ) ( ON ?auto_1722032 ?auto_1722031 ) ( not ( = ?auto_1722023 ?auto_1722024 ) ) ( not ( = ?auto_1722023 ?auto_1722025 ) ) ( not ( = ?auto_1722023 ?auto_1722027 ) ) ( not ( = ?auto_1722023 ?auto_1722026 ) ) ( not ( = ?auto_1722023 ?auto_1722028 ) ) ( not ( = ?auto_1722023 ?auto_1722029 ) ) ( not ( = ?auto_1722023 ?auto_1722030 ) ) ( not ( = ?auto_1722023 ?auto_1722031 ) ) ( not ( = ?auto_1722023 ?auto_1722032 ) ) ( not ( = ?auto_1722023 ?auto_1722033 ) ) ( not ( = ?auto_1722024 ?auto_1722025 ) ) ( not ( = ?auto_1722024 ?auto_1722027 ) ) ( not ( = ?auto_1722024 ?auto_1722026 ) ) ( not ( = ?auto_1722024 ?auto_1722028 ) ) ( not ( = ?auto_1722024 ?auto_1722029 ) ) ( not ( = ?auto_1722024 ?auto_1722030 ) ) ( not ( = ?auto_1722024 ?auto_1722031 ) ) ( not ( = ?auto_1722024 ?auto_1722032 ) ) ( not ( = ?auto_1722024 ?auto_1722033 ) ) ( not ( = ?auto_1722025 ?auto_1722027 ) ) ( not ( = ?auto_1722025 ?auto_1722026 ) ) ( not ( = ?auto_1722025 ?auto_1722028 ) ) ( not ( = ?auto_1722025 ?auto_1722029 ) ) ( not ( = ?auto_1722025 ?auto_1722030 ) ) ( not ( = ?auto_1722025 ?auto_1722031 ) ) ( not ( = ?auto_1722025 ?auto_1722032 ) ) ( not ( = ?auto_1722025 ?auto_1722033 ) ) ( not ( = ?auto_1722027 ?auto_1722026 ) ) ( not ( = ?auto_1722027 ?auto_1722028 ) ) ( not ( = ?auto_1722027 ?auto_1722029 ) ) ( not ( = ?auto_1722027 ?auto_1722030 ) ) ( not ( = ?auto_1722027 ?auto_1722031 ) ) ( not ( = ?auto_1722027 ?auto_1722032 ) ) ( not ( = ?auto_1722027 ?auto_1722033 ) ) ( not ( = ?auto_1722026 ?auto_1722028 ) ) ( not ( = ?auto_1722026 ?auto_1722029 ) ) ( not ( = ?auto_1722026 ?auto_1722030 ) ) ( not ( = ?auto_1722026 ?auto_1722031 ) ) ( not ( = ?auto_1722026 ?auto_1722032 ) ) ( not ( = ?auto_1722026 ?auto_1722033 ) ) ( not ( = ?auto_1722028 ?auto_1722029 ) ) ( not ( = ?auto_1722028 ?auto_1722030 ) ) ( not ( = ?auto_1722028 ?auto_1722031 ) ) ( not ( = ?auto_1722028 ?auto_1722032 ) ) ( not ( = ?auto_1722028 ?auto_1722033 ) ) ( not ( = ?auto_1722029 ?auto_1722030 ) ) ( not ( = ?auto_1722029 ?auto_1722031 ) ) ( not ( = ?auto_1722029 ?auto_1722032 ) ) ( not ( = ?auto_1722029 ?auto_1722033 ) ) ( not ( = ?auto_1722030 ?auto_1722031 ) ) ( not ( = ?auto_1722030 ?auto_1722032 ) ) ( not ( = ?auto_1722030 ?auto_1722033 ) ) ( not ( = ?auto_1722031 ?auto_1722032 ) ) ( not ( = ?auto_1722031 ?auto_1722033 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1722032 ?auto_1722033 )
      ( MAKE-10CRATE-VERIFY ?auto_1722023 ?auto_1722024 ?auto_1722025 ?auto_1722027 ?auto_1722026 ?auto_1722028 ?auto_1722029 ?auto_1722030 ?auto_1722031 ?auto_1722032 ?auto_1722033 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722117 - SURFACE
      ?auto_1722118 - SURFACE
      ?auto_1722119 - SURFACE
      ?auto_1722121 - SURFACE
      ?auto_1722120 - SURFACE
      ?auto_1722122 - SURFACE
      ?auto_1722123 - SURFACE
      ?auto_1722124 - SURFACE
      ?auto_1722125 - SURFACE
      ?auto_1722126 - SURFACE
      ?auto_1722127 - SURFACE
    )
    :vars
    (
      ?auto_1722128 - HOIST
      ?auto_1722130 - PLACE
      ?auto_1722129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722128 ?auto_1722130 ) ( SURFACE-AT ?auto_1722126 ?auto_1722130 ) ( CLEAR ?auto_1722126 ) ( IS-CRATE ?auto_1722127 ) ( not ( = ?auto_1722126 ?auto_1722127 ) ) ( TRUCK-AT ?auto_1722129 ?auto_1722130 ) ( AVAILABLE ?auto_1722128 ) ( IN ?auto_1722127 ?auto_1722129 ) ( ON ?auto_1722126 ?auto_1722125 ) ( not ( = ?auto_1722125 ?auto_1722126 ) ) ( not ( = ?auto_1722125 ?auto_1722127 ) ) ( ON ?auto_1722118 ?auto_1722117 ) ( ON ?auto_1722119 ?auto_1722118 ) ( ON ?auto_1722121 ?auto_1722119 ) ( ON ?auto_1722120 ?auto_1722121 ) ( ON ?auto_1722122 ?auto_1722120 ) ( ON ?auto_1722123 ?auto_1722122 ) ( ON ?auto_1722124 ?auto_1722123 ) ( ON ?auto_1722125 ?auto_1722124 ) ( not ( = ?auto_1722117 ?auto_1722118 ) ) ( not ( = ?auto_1722117 ?auto_1722119 ) ) ( not ( = ?auto_1722117 ?auto_1722121 ) ) ( not ( = ?auto_1722117 ?auto_1722120 ) ) ( not ( = ?auto_1722117 ?auto_1722122 ) ) ( not ( = ?auto_1722117 ?auto_1722123 ) ) ( not ( = ?auto_1722117 ?auto_1722124 ) ) ( not ( = ?auto_1722117 ?auto_1722125 ) ) ( not ( = ?auto_1722117 ?auto_1722126 ) ) ( not ( = ?auto_1722117 ?auto_1722127 ) ) ( not ( = ?auto_1722118 ?auto_1722119 ) ) ( not ( = ?auto_1722118 ?auto_1722121 ) ) ( not ( = ?auto_1722118 ?auto_1722120 ) ) ( not ( = ?auto_1722118 ?auto_1722122 ) ) ( not ( = ?auto_1722118 ?auto_1722123 ) ) ( not ( = ?auto_1722118 ?auto_1722124 ) ) ( not ( = ?auto_1722118 ?auto_1722125 ) ) ( not ( = ?auto_1722118 ?auto_1722126 ) ) ( not ( = ?auto_1722118 ?auto_1722127 ) ) ( not ( = ?auto_1722119 ?auto_1722121 ) ) ( not ( = ?auto_1722119 ?auto_1722120 ) ) ( not ( = ?auto_1722119 ?auto_1722122 ) ) ( not ( = ?auto_1722119 ?auto_1722123 ) ) ( not ( = ?auto_1722119 ?auto_1722124 ) ) ( not ( = ?auto_1722119 ?auto_1722125 ) ) ( not ( = ?auto_1722119 ?auto_1722126 ) ) ( not ( = ?auto_1722119 ?auto_1722127 ) ) ( not ( = ?auto_1722121 ?auto_1722120 ) ) ( not ( = ?auto_1722121 ?auto_1722122 ) ) ( not ( = ?auto_1722121 ?auto_1722123 ) ) ( not ( = ?auto_1722121 ?auto_1722124 ) ) ( not ( = ?auto_1722121 ?auto_1722125 ) ) ( not ( = ?auto_1722121 ?auto_1722126 ) ) ( not ( = ?auto_1722121 ?auto_1722127 ) ) ( not ( = ?auto_1722120 ?auto_1722122 ) ) ( not ( = ?auto_1722120 ?auto_1722123 ) ) ( not ( = ?auto_1722120 ?auto_1722124 ) ) ( not ( = ?auto_1722120 ?auto_1722125 ) ) ( not ( = ?auto_1722120 ?auto_1722126 ) ) ( not ( = ?auto_1722120 ?auto_1722127 ) ) ( not ( = ?auto_1722122 ?auto_1722123 ) ) ( not ( = ?auto_1722122 ?auto_1722124 ) ) ( not ( = ?auto_1722122 ?auto_1722125 ) ) ( not ( = ?auto_1722122 ?auto_1722126 ) ) ( not ( = ?auto_1722122 ?auto_1722127 ) ) ( not ( = ?auto_1722123 ?auto_1722124 ) ) ( not ( = ?auto_1722123 ?auto_1722125 ) ) ( not ( = ?auto_1722123 ?auto_1722126 ) ) ( not ( = ?auto_1722123 ?auto_1722127 ) ) ( not ( = ?auto_1722124 ?auto_1722125 ) ) ( not ( = ?auto_1722124 ?auto_1722126 ) ) ( not ( = ?auto_1722124 ?auto_1722127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722125 ?auto_1722126 ?auto_1722127 )
      ( MAKE-10CRATE-VERIFY ?auto_1722117 ?auto_1722118 ?auto_1722119 ?auto_1722121 ?auto_1722120 ?auto_1722122 ?auto_1722123 ?auto_1722124 ?auto_1722125 ?auto_1722126 ?auto_1722127 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722222 - SURFACE
      ?auto_1722223 - SURFACE
      ?auto_1722224 - SURFACE
      ?auto_1722226 - SURFACE
      ?auto_1722225 - SURFACE
      ?auto_1722227 - SURFACE
      ?auto_1722228 - SURFACE
      ?auto_1722229 - SURFACE
      ?auto_1722230 - SURFACE
      ?auto_1722231 - SURFACE
      ?auto_1722232 - SURFACE
    )
    :vars
    (
      ?auto_1722235 - HOIST
      ?auto_1722236 - PLACE
      ?auto_1722233 - TRUCK
      ?auto_1722234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722235 ?auto_1722236 ) ( SURFACE-AT ?auto_1722231 ?auto_1722236 ) ( CLEAR ?auto_1722231 ) ( IS-CRATE ?auto_1722232 ) ( not ( = ?auto_1722231 ?auto_1722232 ) ) ( AVAILABLE ?auto_1722235 ) ( IN ?auto_1722232 ?auto_1722233 ) ( ON ?auto_1722231 ?auto_1722230 ) ( not ( = ?auto_1722230 ?auto_1722231 ) ) ( not ( = ?auto_1722230 ?auto_1722232 ) ) ( TRUCK-AT ?auto_1722233 ?auto_1722234 ) ( not ( = ?auto_1722234 ?auto_1722236 ) ) ( ON ?auto_1722223 ?auto_1722222 ) ( ON ?auto_1722224 ?auto_1722223 ) ( ON ?auto_1722226 ?auto_1722224 ) ( ON ?auto_1722225 ?auto_1722226 ) ( ON ?auto_1722227 ?auto_1722225 ) ( ON ?auto_1722228 ?auto_1722227 ) ( ON ?auto_1722229 ?auto_1722228 ) ( ON ?auto_1722230 ?auto_1722229 ) ( not ( = ?auto_1722222 ?auto_1722223 ) ) ( not ( = ?auto_1722222 ?auto_1722224 ) ) ( not ( = ?auto_1722222 ?auto_1722226 ) ) ( not ( = ?auto_1722222 ?auto_1722225 ) ) ( not ( = ?auto_1722222 ?auto_1722227 ) ) ( not ( = ?auto_1722222 ?auto_1722228 ) ) ( not ( = ?auto_1722222 ?auto_1722229 ) ) ( not ( = ?auto_1722222 ?auto_1722230 ) ) ( not ( = ?auto_1722222 ?auto_1722231 ) ) ( not ( = ?auto_1722222 ?auto_1722232 ) ) ( not ( = ?auto_1722223 ?auto_1722224 ) ) ( not ( = ?auto_1722223 ?auto_1722226 ) ) ( not ( = ?auto_1722223 ?auto_1722225 ) ) ( not ( = ?auto_1722223 ?auto_1722227 ) ) ( not ( = ?auto_1722223 ?auto_1722228 ) ) ( not ( = ?auto_1722223 ?auto_1722229 ) ) ( not ( = ?auto_1722223 ?auto_1722230 ) ) ( not ( = ?auto_1722223 ?auto_1722231 ) ) ( not ( = ?auto_1722223 ?auto_1722232 ) ) ( not ( = ?auto_1722224 ?auto_1722226 ) ) ( not ( = ?auto_1722224 ?auto_1722225 ) ) ( not ( = ?auto_1722224 ?auto_1722227 ) ) ( not ( = ?auto_1722224 ?auto_1722228 ) ) ( not ( = ?auto_1722224 ?auto_1722229 ) ) ( not ( = ?auto_1722224 ?auto_1722230 ) ) ( not ( = ?auto_1722224 ?auto_1722231 ) ) ( not ( = ?auto_1722224 ?auto_1722232 ) ) ( not ( = ?auto_1722226 ?auto_1722225 ) ) ( not ( = ?auto_1722226 ?auto_1722227 ) ) ( not ( = ?auto_1722226 ?auto_1722228 ) ) ( not ( = ?auto_1722226 ?auto_1722229 ) ) ( not ( = ?auto_1722226 ?auto_1722230 ) ) ( not ( = ?auto_1722226 ?auto_1722231 ) ) ( not ( = ?auto_1722226 ?auto_1722232 ) ) ( not ( = ?auto_1722225 ?auto_1722227 ) ) ( not ( = ?auto_1722225 ?auto_1722228 ) ) ( not ( = ?auto_1722225 ?auto_1722229 ) ) ( not ( = ?auto_1722225 ?auto_1722230 ) ) ( not ( = ?auto_1722225 ?auto_1722231 ) ) ( not ( = ?auto_1722225 ?auto_1722232 ) ) ( not ( = ?auto_1722227 ?auto_1722228 ) ) ( not ( = ?auto_1722227 ?auto_1722229 ) ) ( not ( = ?auto_1722227 ?auto_1722230 ) ) ( not ( = ?auto_1722227 ?auto_1722231 ) ) ( not ( = ?auto_1722227 ?auto_1722232 ) ) ( not ( = ?auto_1722228 ?auto_1722229 ) ) ( not ( = ?auto_1722228 ?auto_1722230 ) ) ( not ( = ?auto_1722228 ?auto_1722231 ) ) ( not ( = ?auto_1722228 ?auto_1722232 ) ) ( not ( = ?auto_1722229 ?auto_1722230 ) ) ( not ( = ?auto_1722229 ?auto_1722231 ) ) ( not ( = ?auto_1722229 ?auto_1722232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722230 ?auto_1722231 ?auto_1722232 )
      ( MAKE-10CRATE-VERIFY ?auto_1722222 ?auto_1722223 ?auto_1722224 ?auto_1722226 ?auto_1722225 ?auto_1722227 ?auto_1722228 ?auto_1722229 ?auto_1722230 ?auto_1722231 ?auto_1722232 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722337 - SURFACE
      ?auto_1722338 - SURFACE
      ?auto_1722339 - SURFACE
      ?auto_1722341 - SURFACE
      ?auto_1722340 - SURFACE
      ?auto_1722342 - SURFACE
      ?auto_1722343 - SURFACE
      ?auto_1722344 - SURFACE
      ?auto_1722345 - SURFACE
      ?auto_1722346 - SURFACE
      ?auto_1722347 - SURFACE
    )
    :vars
    (
      ?auto_1722350 - HOIST
      ?auto_1722352 - PLACE
      ?auto_1722351 - TRUCK
      ?auto_1722349 - PLACE
      ?auto_1722348 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722350 ?auto_1722352 ) ( SURFACE-AT ?auto_1722346 ?auto_1722352 ) ( CLEAR ?auto_1722346 ) ( IS-CRATE ?auto_1722347 ) ( not ( = ?auto_1722346 ?auto_1722347 ) ) ( AVAILABLE ?auto_1722350 ) ( ON ?auto_1722346 ?auto_1722345 ) ( not ( = ?auto_1722345 ?auto_1722346 ) ) ( not ( = ?auto_1722345 ?auto_1722347 ) ) ( TRUCK-AT ?auto_1722351 ?auto_1722349 ) ( not ( = ?auto_1722349 ?auto_1722352 ) ) ( HOIST-AT ?auto_1722348 ?auto_1722349 ) ( LIFTING ?auto_1722348 ?auto_1722347 ) ( not ( = ?auto_1722350 ?auto_1722348 ) ) ( ON ?auto_1722338 ?auto_1722337 ) ( ON ?auto_1722339 ?auto_1722338 ) ( ON ?auto_1722341 ?auto_1722339 ) ( ON ?auto_1722340 ?auto_1722341 ) ( ON ?auto_1722342 ?auto_1722340 ) ( ON ?auto_1722343 ?auto_1722342 ) ( ON ?auto_1722344 ?auto_1722343 ) ( ON ?auto_1722345 ?auto_1722344 ) ( not ( = ?auto_1722337 ?auto_1722338 ) ) ( not ( = ?auto_1722337 ?auto_1722339 ) ) ( not ( = ?auto_1722337 ?auto_1722341 ) ) ( not ( = ?auto_1722337 ?auto_1722340 ) ) ( not ( = ?auto_1722337 ?auto_1722342 ) ) ( not ( = ?auto_1722337 ?auto_1722343 ) ) ( not ( = ?auto_1722337 ?auto_1722344 ) ) ( not ( = ?auto_1722337 ?auto_1722345 ) ) ( not ( = ?auto_1722337 ?auto_1722346 ) ) ( not ( = ?auto_1722337 ?auto_1722347 ) ) ( not ( = ?auto_1722338 ?auto_1722339 ) ) ( not ( = ?auto_1722338 ?auto_1722341 ) ) ( not ( = ?auto_1722338 ?auto_1722340 ) ) ( not ( = ?auto_1722338 ?auto_1722342 ) ) ( not ( = ?auto_1722338 ?auto_1722343 ) ) ( not ( = ?auto_1722338 ?auto_1722344 ) ) ( not ( = ?auto_1722338 ?auto_1722345 ) ) ( not ( = ?auto_1722338 ?auto_1722346 ) ) ( not ( = ?auto_1722338 ?auto_1722347 ) ) ( not ( = ?auto_1722339 ?auto_1722341 ) ) ( not ( = ?auto_1722339 ?auto_1722340 ) ) ( not ( = ?auto_1722339 ?auto_1722342 ) ) ( not ( = ?auto_1722339 ?auto_1722343 ) ) ( not ( = ?auto_1722339 ?auto_1722344 ) ) ( not ( = ?auto_1722339 ?auto_1722345 ) ) ( not ( = ?auto_1722339 ?auto_1722346 ) ) ( not ( = ?auto_1722339 ?auto_1722347 ) ) ( not ( = ?auto_1722341 ?auto_1722340 ) ) ( not ( = ?auto_1722341 ?auto_1722342 ) ) ( not ( = ?auto_1722341 ?auto_1722343 ) ) ( not ( = ?auto_1722341 ?auto_1722344 ) ) ( not ( = ?auto_1722341 ?auto_1722345 ) ) ( not ( = ?auto_1722341 ?auto_1722346 ) ) ( not ( = ?auto_1722341 ?auto_1722347 ) ) ( not ( = ?auto_1722340 ?auto_1722342 ) ) ( not ( = ?auto_1722340 ?auto_1722343 ) ) ( not ( = ?auto_1722340 ?auto_1722344 ) ) ( not ( = ?auto_1722340 ?auto_1722345 ) ) ( not ( = ?auto_1722340 ?auto_1722346 ) ) ( not ( = ?auto_1722340 ?auto_1722347 ) ) ( not ( = ?auto_1722342 ?auto_1722343 ) ) ( not ( = ?auto_1722342 ?auto_1722344 ) ) ( not ( = ?auto_1722342 ?auto_1722345 ) ) ( not ( = ?auto_1722342 ?auto_1722346 ) ) ( not ( = ?auto_1722342 ?auto_1722347 ) ) ( not ( = ?auto_1722343 ?auto_1722344 ) ) ( not ( = ?auto_1722343 ?auto_1722345 ) ) ( not ( = ?auto_1722343 ?auto_1722346 ) ) ( not ( = ?auto_1722343 ?auto_1722347 ) ) ( not ( = ?auto_1722344 ?auto_1722345 ) ) ( not ( = ?auto_1722344 ?auto_1722346 ) ) ( not ( = ?auto_1722344 ?auto_1722347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722345 ?auto_1722346 ?auto_1722347 )
      ( MAKE-10CRATE-VERIFY ?auto_1722337 ?auto_1722338 ?auto_1722339 ?auto_1722341 ?auto_1722340 ?auto_1722342 ?auto_1722343 ?auto_1722344 ?auto_1722345 ?auto_1722346 ?auto_1722347 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722462 - SURFACE
      ?auto_1722463 - SURFACE
      ?auto_1722464 - SURFACE
      ?auto_1722466 - SURFACE
      ?auto_1722465 - SURFACE
      ?auto_1722467 - SURFACE
      ?auto_1722468 - SURFACE
      ?auto_1722469 - SURFACE
      ?auto_1722470 - SURFACE
      ?auto_1722471 - SURFACE
      ?auto_1722472 - SURFACE
    )
    :vars
    (
      ?auto_1722475 - HOIST
      ?auto_1722474 - PLACE
      ?auto_1722477 - TRUCK
      ?auto_1722478 - PLACE
      ?auto_1722476 - HOIST
      ?auto_1722473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722475 ?auto_1722474 ) ( SURFACE-AT ?auto_1722471 ?auto_1722474 ) ( CLEAR ?auto_1722471 ) ( IS-CRATE ?auto_1722472 ) ( not ( = ?auto_1722471 ?auto_1722472 ) ) ( AVAILABLE ?auto_1722475 ) ( ON ?auto_1722471 ?auto_1722470 ) ( not ( = ?auto_1722470 ?auto_1722471 ) ) ( not ( = ?auto_1722470 ?auto_1722472 ) ) ( TRUCK-AT ?auto_1722477 ?auto_1722478 ) ( not ( = ?auto_1722478 ?auto_1722474 ) ) ( HOIST-AT ?auto_1722476 ?auto_1722478 ) ( not ( = ?auto_1722475 ?auto_1722476 ) ) ( AVAILABLE ?auto_1722476 ) ( SURFACE-AT ?auto_1722472 ?auto_1722478 ) ( ON ?auto_1722472 ?auto_1722473 ) ( CLEAR ?auto_1722472 ) ( not ( = ?auto_1722471 ?auto_1722473 ) ) ( not ( = ?auto_1722472 ?auto_1722473 ) ) ( not ( = ?auto_1722470 ?auto_1722473 ) ) ( ON ?auto_1722463 ?auto_1722462 ) ( ON ?auto_1722464 ?auto_1722463 ) ( ON ?auto_1722466 ?auto_1722464 ) ( ON ?auto_1722465 ?auto_1722466 ) ( ON ?auto_1722467 ?auto_1722465 ) ( ON ?auto_1722468 ?auto_1722467 ) ( ON ?auto_1722469 ?auto_1722468 ) ( ON ?auto_1722470 ?auto_1722469 ) ( not ( = ?auto_1722462 ?auto_1722463 ) ) ( not ( = ?auto_1722462 ?auto_1722464 ) ) ( not ( = ?auto_1722462 ?auto_1722466 ) ) ( not ( = ?auto_1722462 ?auto_1722465 ) ) ( not ( = ?auto_1722462 ?auto_1722467 ) ) ( not ( = ?auto_1722462 ?auto_1722468 ) ) ( not ( = ?auto_1722462 ?auto_1722469 ) ) ( not ( = ?auto_1722462 ?auto_1722470 ) ) ( not ( = ?auto_1722462 ?auto_1722471 ) ) ( not ( = ?auto_1722462 ?auto_1722472 ) ) ( not ( = ?auto_1722462 ?auto_1722473 ) ) ( not ( = ?auto_1722463 ?auto_1722464 ) ) ( not ( = ?auto_1722463 ?auto_1722466 ) ) ( not ( = ?auto_1722463 ?auto_1722465 ) ) ( not ( = ?auto_1722463 ?auto_1722467 ) ) ( not ( = ?auto_1722463 ?auto_1722468 ) ) ( not ( = ?auto_1722463 ?auto_1722469 ) ) ( not ( = ?auto_1722463 ?auto_1722470 ) ) ( not ( = ?auto_1722463 ?auto_1722471 ) ) ( not ( = ?auto_1722463 ?auto_1722472 ) ) ( not ( = ?auto_1722463 ?auto_1722473 ) ) ( not ( = ?auto_1722464 ?auto_1722466 ) ) ( not ( = ?auto_1722464 ?auto_1722465 ) ) ( not ( = ?auto_1722464 ?auto_1722467 ) ) ( not ( = ?auto_1722464 ?auto_1722468 ) ) ( not ( = ?auto_1722464 ?auto_1722469 ) ) ( not ( = ?auto_1722464 ?auto_1722470 ) ) ( not ( = ?auto_1722464 ?auto_1722471 ) ) ( not ( = ?auto_1722464 ?auto_1722472 ) ) ( not ( = ?auto_1722464 ?auto_1722473 ) ) ( not ( = ?auto_1722466 ?auto_1722465 ) ) ( not ( = ?auto_1722466 ?auto_1722467 ) ) ( not ( = ?auto_1722466 ?auto_1722468 ) ) ( not ( = ?auto_1722466 ?auto_1722469 ) ) ( not ( = ?auto_1722466 ?auto_1722470 ) ) ( not ( = ?auto_1722466 ?auto_1722471 ) ) ( not ( = ?auto_1722466 ?auto_1722472 ) ) ( not ( = ?auto_1722466 ?auto_1722473 ) ) ( not ( = ?auto_1722465 ?auto_1722467 ) ) ( not ( = ?auto_1722465 ?auto_1722468 ) ) ( not ( = ?auto_1722465 ?auto_1722469 ) ) ( not ( = ?auto_1722465 ?auto_1722470 ) ) ( not ( = ?auto_1722465 ?auto_1722471 ) ) ( not ( = ?auto_1722465 ?auto_1722472 ) ) ( not ( = ?auto_1722465 ?auto_1722473 ) ) ( not ( = ?auto_1722467 ?auto_1722468 ) ) ( not ( = ?auto_1722467 ?auto_1722469 ) ) ( not ( = ?auto_1722467 ?auto_1722470 ) ) ( not ( = ?auto_1722467 ?auto_1722471 ) ) ( not ( = ?auto_1722467 ?auto_1722472 ) ) ( not ( = ?auto_1722467 ?auto_1722473 ) ) ( not ( = ?auto_1722468 ?auto_1722469 ) ) ( not ( = ?auto_1722468 ?auto_1722470 ) ) ( not ( = ?auto_1722468 ?auto_1722471 ) ) ( not ( = ?auto_1722468 ?auto_1722472 ) ) ( not ( = ?auto_1722468 ?auto_1722473 ) ) ( not ( = ?auto_1722469 ?auto_1722470 ) ) ( not ( = ?auto_1722469 ?auto_1722471 ) ) ( not ( = ?auto_1722469 ?auto_1722472 ) ) ( not ( = ?auto_1722469 ?auto_1722473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722470 ?auto_1722471 ?auto_1722472 )
      ( MAKE-10CRATE-VERIFY ?auto_1722462 ?auto_1722463 ?auto_1722464 ?auto_1722466 ?auto_1722465 ?auto_1722467 ?auto_1722468 ?auto_1722469 ?auto_1722470 ?auto_1722471 ?auto_1722472 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722588 - SURFACE
      ?auto_1722589 - SURFACE
      ?auto_1722590 - SURFACE
      ?auto_1722592 - SURFACE
      ?auto_1722591 - SURFACE
      ?auto_1722593 - SURFACE
      ?auto_1722594 - SURFACE
      ?auto_1722595 - SURFACE
      ?auto_1722596 - SURFACE
      ?auto_1722597 - SURFACE
      ?auto_1722598 - SURFACE
    )
    :vars
    (
      ?auto_1722601 - HOIST
      ?auto_1722599 - PLACE
      ?auto_1722604 - PLACE
      ?auto_1722603 - HOIST
      ?auto_1722602 - SURFACE
      ?auto_1722600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722601 ?auto_1722599 ) ( SURFACE-AT ?auto_1722597 ?auto_1722599 ) ( CLEAR ?auto_1722597 ) ( IS-CRATE ?auto_1722598 ) ( not ( = ?auto_1722597 ?auto_1722598 ) ) ( AVAILABLE ?auto_1722601 ) ( ON ?auto_1722597 ?auto_1722596 ) ( not ( = ?auto_1722596 ?auto_1722597 ) ) ( not ( = ?auto_1722596 ?auto_1722598 ) ) ( not ( = ?auto_1722604 ?auto_1722599 ) ) ( HOIST-AT ?auto_1722603 ?auto_1722604 ) ( not ( = ?auto_1722601 ?auto_1722603 ) ) ( AVAILABLE ?auto_1722603 ) ( SURFACE-AT ?auto_1722598 ?auto_1722604 ) ( ON ?auto_1722598 ?auto_1722602 ) ( CLEAR ?auto_1722598 ) ( not ( = ?auto_1722597 ?auto_1722602 ) ) ( not ( = ?auto_1722598 ?auto_1722602 ) ) ( not ( = ?auto_1722596 ?auto_1722602 ) ) ( TRUCK-AT ?auto_1722600 ?auto_1722599 ) ( ON ?auto_1722589 ?auto_1722588 ) ( ON ?auto_1722590 ?auto_1722589 ) ( ON ?auto_1722592 ?auto_1722590 ) ( ON ?auto_1722591 ?auto_1722592 ) ( ON ?auto_1722593 ?auto_1722591 ) ( ON ?auto_1722594 ?auto_1722593 ) ( ON ?auto_1722595 ?auto_1722594 ) ( ON ?auto_1722596 ?auto_1722595 ) ( not ( = ?auto_1722588 ?auto_1722589 ) ) ( not ( = ?auto_1722588 ?auto_1722590 ) ) ( not ( = ?auto_1722588 ?auto_1722592 ) ) ( not ( = ?auto_1722588 ?auto_1722591 ) ) ( not ( = ?auto_1722588 ?auto_1722593 ) ) ( not ( = ?auto_1722588 ?auto_1722594 ) ) ( not ( = ?auto_1722588 ?auto_1722595 ) ) ( not ( = ?auto_1722588 ?auto_1722596 ) ) ( not ( = ?auto_1722588 ?auto_1722597 ) ) ( not ( = ?auto_1722588 ?auto_1722598 ) ) ( not ( = ?auto_1722588 ?auto_1722602 ) ) ( not ( = ?auto_1722589 ?auto_1722590 ) ) ( not ( = ?auto_1722589 ?auto_1722592 ) ) ( not ( = ?auto_1722589 ?auto_1722591 ) ) ( not ( = ?auto_1722589 ?auto_1722593 ) ) ( not ( = ?auto_1722589 ?auto_1722594 ) ) ( not ( = ?auto_1722589 ?auto_1722595 ) ) ( not ( = ?auto_1722589 ?auto_1722596 ) ) ( not ( = ?auto_1722589 ?auto_1722597 ) ) ( not ( = ?auto_1722589 ?auto_1722598 ) ) ( not ( = ?auto_1722589 ?auto_1722602 ) ) ( not ( = ?auto_1722590 ?auto_1722592 ) ) ( not ( = ?auto_1722590 ?auto_1722591 ) ) ( not ( = ?auto_1722590 ?auto_1722593 ) ) ( not ( = ?auto_1722590 ?auto_1722594 ) ) ( not ( = ?auto_1722590 ?auto_1722595 ) ) ( not ( = ?auto_1722590 ?auto_1722596 ) ) ( not ( = ?auto_1722590 ?auto_1722597 ) ) ( not ( = ?auto_1722590 ?auto_1722598 ) ) ( not ( = ?auto_1722590 ?auto_1722602 ) ) ( not ( = ?auto_1722592 ?auto_1722591 ) ) ( not ( = ?auto_1722592 ?auto_1722593 ) ) ( not ( = ?auto_1722592 ?auto_1722594 ) ) ( not ( = ?auto_1722592 ?auto_1722595 ) ) ( not ( = ?auto_1722592 ?auto_1722596 ) ) ( not ( = ?auto_1722592 ?auto_1722597 ) ) ( not ( = ?auto_1722592 ?auto_1722598 ) ) ( not ( = ?auto_1722592 ?auto_1722602 ) ) ( not ( = ?auto_1722591 ?auto_1722593 ) ) ( not ( = ?auto_1722591 ?auto_1722594 ) ) ( not ( = ?auto_1722591 ?auto_1722595 ) ) ( not ( = ?auto_1722591 ?auto_1722596 ) ) ( not ( = ?auto_1722591 ?auto_1722597 ) ) ( not ( = ?auto_1722591 ?auto_1722598 ) ) ( not ( = ?auto_1722591 ?auto_1722602 ) ) ( not ( = ?auto_1722593 ?auto_1722594 ) ) ( not ( = ?auto_1722593 ?auto_1722595 ) ) ( not ( = ?auto_1722593 ?auto_1722596 ) ) ( not ( = ?auto_1722593 ?auto_1722597 ) ) ( not ( = ?auto_1722593 ?auto_1722598 ) ) ( not ( = ?auto_1722593 ?auto_1722602 ) ) ( not ( = ?auto_1722594 ?auto_1722595 ) ) ( not ( = ?auto_1722594 ?auto_1722596 ) ) ( not ( = ?auto_1722594 ?auto_1722597 ) ) ( not ( = ?auto_1722594 ?auto_1722598 ) ) ( not ( = ?auto_1722594 ?auto_1722602 ) ) ( not ( = ?auto_1722595 ?auto_1722596 ) ) ( not ( = ?auto_1722595 ?auto_1722597 ) ) ( not ( = ?auto_1722595 ?auto_1722598 ) ) ( not ( = ?auto_1722595 ?auto_1722602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722596 ?auto_1722597 ?auto_1722598 )
      ( MAKE-10CRATE-VERIFY ?auto_1722588 ?auto_1722589 ?auto_1722590 ?auto_1722592 ?auto_1722591 ?auto_1722593 ?auto_1722594 ?auto_1722595 ?auto_1722596 ?auto_1722597 ?auto_1722598 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722714 - SURFACE
      ?auto_1722715 - SURFACE
      ?auto_1722716 - SURFACE
      ?auto_1722718 - SURFACE
      ?auto_1722717 - SURFACE
      ?auto_1722719 - SURFACE
      ?auto_1722720 - SURFACE
      ?auto_1722721 - SURFACE
      ?auto_1722722 - SURFACE
      ?auto_1722723 - SURFACE
      ?auto_1722724 - SURFACE
    )
    :vars
    (
      ?auto_1722725 - HOIST
      ?auto_1722729 - PLACE
      ?auto_1722728 - PLACE
      ?auto_1722727 - HOIST
      ?auto_1722730 - SURFACE
      ?auto_1722726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722725 ?auto_1722729 ) ( IS-CRATE ?auto_1722724 ) ( not ( = ?auto_1722723 ?auto_1722724 ) ) ( not ( = ?auto_1722722 ?auto_1722723 ) ) ( not ( = ?auto_1722722 ?auto_1722724 ) ) ( not ( = ?auto_1722728 ?auto_1722729 ) ) ( HOIST-AT ?auto_1722727 ?auto_1722728 ) ( not ( = ?auto_1722725 ?auto_1722727 ) ) ( AVAILABLE ?auto_1722727 ) ( SURFACE-AT ?auto_1722724 ?auto_1722728 ) ( ON ?auto_1722724 ?auto_1722730 ) ( CLEAR ?auto_1722724 ) ( not ( = ?auto_1722723 ?auto_1722730 ) ) ( not ( = ?auto_1722724 ?auto_1722730 ) ) ( not ( = ?auto_1722722 ?auto_1722730 ) ) ( TRUCK-AT ?auto_1722726 ?auto_1722729 ) ( SURFACE-AT ?auto_1722722 ?auto_1722729 ) ( CLEAR ?auto_1722722 ) ( LIFTING ?auto_1722725 ?auto_1722723 ) ( IS-CRATE ?auto_1722723 ) ( ON ?auto_1722715 ?auto_1722714 ) ( ON ?auto_1722716 ?auto_1722715 ) ( ON ?auto_1722718 ?auto_1722716 ) ( ON ?auto_1722717 ?auto_1722718 ) ( ON ?auto_1722719 ?auto_1722717 ) ( ON ?auto_1722720 ?auto_1722719 ) ( ON ?auto_1722721 ?auto_1722720 ) ( ON ?auto_1722722 ?auto_1722721 ) ( not ( = ?auto_1722714 ?auto_1722715 ) ) ( not ( = ?auto_1722714 ?auto_1722716 ) ) ( not ( = ?auto_1722714 ?auto_1722718 ) ) ( not ( = ?auto_1722714 ?auto_1722717 ) ) ( not ( = ?auto_1722714 ?auto_1722719 ) ) ( not ( = ?auto_1722714 ?auto_1722720 ) ) ( not ( = ?auto_1722714 ?auto_1722721 ) ) ( not ( = ?auto_1722714 ?auto_1722722 ) ) ( not ( = ?auto_1722714 ?auto_1722723 ) ) ( not ( = ?auto_1722714 ?auto_1722724 ) ) ( not ( = ?auto_1722714 ?auto_1722730 ) ) ( not ( = ?auto_1722715 ?auto_1722716 ) ) ( not ( = ?auto_1722715 ?auto_1722718 ) ) ( not ( = ?auto_1722715 ?auto_1722717 ) ) ( not ( = ?auto_1722715 ?auto_1722719 ) ) ( not ( = ?auto_1722715 ?auto_1722720 ) ) ( not ( = ?auto_1722715 ?auto_1722721 ) ) ( not ( = ?auto_1722715 ?auto_1722722 ) ) ( not ( = ?auto_1722715 ?auto_1722723 ) ) ( not ( = ?auto_1722715 ?auto_1722724 ) ) ( not ( = ?auto_1722715 ?auto_1722730 ) ) ( not ( = ?auto_1722716 ?auto_1722718 ) ) ( not ( = ?auto_1722716 ?auto_1722717 ) ) ( not ( = ?auto_1722716 ?auto_1722719 ) ) ( not ( = ?auto_1722716 ?auto_1722720 ) ) ( not ( = ?auto_1722716 ?auto_1722721 ) ) ( not ( = ?auto_1722716 ?auto_1722722 ) ) ( not ( = ?auto_1722716 ?auto_1722723 ) ) ( not ( = ?auto_1722716 ?auto_1722724 ) ) ( not ( = ?auto_1722716 ?auto_1722730 ) ) ( not ( = ?auto_1722718 ?auto_1722717 ) ) ( not ( = ?auto_1722718 ?auto_1722719 ) ) ( not ( = ?auto_1722718 ?auto_1722720 ) ) ( not ( = ?auto_1722718 ?auto_1722721 ) ) ( not ( = ?auto_1722718 ?auto_1722722 ) ) ( not ( = ?auto_1722718 ?auto_1722723 ) ) ( not ( = ?auto_1722718 ?auto_1722724 ) ) ( not ( = ?auto_1722718 ?auto_1722730 ) ) ( not ( = ?auto_1722717 ?auto_1722719 ) ) ( not ( = ?auto_1722717 ?auto_1722720 ) ) ( not ( = ?auto_1722717 ?auto_1722721 ) ) ( not ( = ?auto_1722717 ?auto_1722722 ) ) ( not ( = ?auto_1722717 ?auto_1722723 ) ) ( not ( = ?auto_1722717 ?auto_1722724 ) ) ( not ( = ?auto_1722717 ?auto_1722730 ) ) ( not ( = ?auto_1722719 ?auto_1722720 ) ) ( not ( = ?auto_1722719 ?auto_1722721 ) ) ( not ( = ?auto_1722719 ?auto_1722722 ) ) ( not ( = ?auto_1722719 ?auto_1722723 ) ) ( not ( = ?auto_1722719 ?auto_1722724 ) ) ( not ( = ?auto_1722719 ?auto_1722730 ) ) ( not ( = ?auto_1722720 ?auto_1722721 ) ) ( not ( = ?auto_1722720 ?auto_1722722 ) ) ( not ( = ?auto_1722720 ?auto_1722723 ) ) ( not ( = ?auto_1722720 ?auto_1722724 ) ) ( not ( = ?auto_1722720 ?auto_1722730 ) ) ( not ( = ?auto_1722721 ?auto_1722722 ) ) ( not ( = ?auto_1722721 ?auto_1722723 ) ) ( not ( = ?auto_1722721 ?auto_1722724 ) ) ( not ( = ?auto_1722721 ?auto_1722730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722722 ?auto_1722723 ?auto_1722724 )
      ( MAKE-10CRATE-VERIFY ?auto_1722714 ?auto_1722715 ?auto_1722716 ?auto_1722718 ?auto_1722717 ?auto_1722719 ?auto_1722720 ?auto_1722721 ?auto_1722722 ?auto_1722723 ?auto_1722724 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722840 - SURFACE
      ?auto_1722841 - SURFACE
      ?auto_1722842 - SURFACE
      ?auto_1722844 - SURFACE
      ?auto_1722843 - SURFACE
      ?auto_1722845 - SURFACE
      ?auto_1722846 - SURFACE
      ?auto_1722847 - SURFACE
      ?auto_1722848 - SURFACE
      ?auto_1722849 - SURFACE
      ?auto_1722850 - SURFACE
    )
    :vars
    (
      ?auto_1722854 - HOIST
      ?auto_1722856 - PLACE
      ?auto_1722855 - PLACE
      ?auto_1722853 - HOIST
      ?auto_1722851 - SURFACE
      ?auto_1722852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722854 ?auto_1722856 ) ( IS-CRATE ?auto_1722850 ) ( not ( = ?auto_1722849 ?auto_1722850 ) ) ( not ( = ?auto_1722848 ?auto_1722849 ) ) ( not ( = ?auto_1722848 ?auto_1722850 ) ) ( not ( = ?auto_1722855 ?auto_1722856 ) ) ( HOIST-AT ?auto_1722853 ?auto_1722855 ) ( not ( = ?auto_1722854 ?auto_1722853 ) ) ( AVAILABLE ?auto_1722853 ) ( SURFACE-AT ?auto_1722850 ?auto_1722855 ) ( ON ?auto_1722850 ?auto_1722851 ) ( CLEAR ?auto_1722850 ) ( not ( = ?auto_1722849 ?auto_1722851 ) ) ( not ( = ?auto_1722850 ?auto_1722851 ) ) ( not ( = ?auto_1722848 ?auto_1722851 ) ) ( TRUCK-AT ?auto_1722852 ?auto_1722856 ) ( SURFACE-AT ?auto_1722848 ?auto_1722856 ) ( CLEAR ?auto_1722848 ) ( IS-CRATE ?auto_1722849 ) ( AVAILABLE ?auto_1722854 ) ( IN ?auto_1722849 ?auto_1722852 ) ( ON ?auto_1722841 ?auto_1722840 ) ( ON ?auto_1722842 ?auto_1722841 ) ( ON ?auto_1722844 ?auto_1722842 ) ( ON ?auto_1722843 ?auto_1722844 ) ( ON ?auto_1722845 ?auto_1722843 ) ( ON ?auto_1722846 ?auto_1722845 ) ( ON ?auto_1722847 ?auto_1722846 ) ( ON ?auto_1722848 ?auto_1722847 ) ( not ( = ?auto_1722840 ?auto_1722841 ) ) ( not ( = ?auto_1722840 ?auto_1722842 ) ) ( not ( = ?auto_1722840 ?auto_1722844 ) ) ( not ( = ?auto_1722840 ?auto_1722843 ) ) ( not ( = ?auto_1722840 ?auto_1722845 ) ) ( not ( = ?auto_1722840 ?auto_1722846 ) ) ( not ( = ?auto_1722840 ?auto_1722847 ) ) ( not ( = ?auto_1722840 ?auto_1722848 ) ) ( not ( = ?auto_1722840 ?auto_1722849 ) ) ( not ( = ?auto_1722840 ?auto_1722850 ) ) ( not ( = ?auto_1722840 ?auto_1722851 ) ) ( not ( = ?auto_1722841 ?auto_1722842 ) ) ( not ( = ?auto_1722841 ?auto_1722844 ) ) ( not ( = ?auto_1722841 ?auto_1722843 ) ) ( not ( = ?auto_1722841 ?auto_1722845 ) ) ( not ( = ?auto_1722841 ?auto_1722846 ) ) ( not ( = ?auto_1722841 ?auto_1722847 ) ) ( not ( = ?auto_1722841 ?auto_1722848 ) ) ( not ( = ?auto_1722841 ?auto_1722849 ) ) ( not ( = ?auto_1722841 ?auto_1722850 ) ) ( not ( = ?auto_1722841 ?auto_1722851 ) ) ( not ( = ?auto_1722842 ?auto_1722844 ) ) ( not ( = ?auto_1722842 ?auto_1722843 ) ) ( not ( = ?auto_1722842 ?auto_1722845 ) ) ( not ( = ?auto_1722842 ?auto_1722846 ) ) ( not ( = ?auto_1722842 ?auto_1722847 ) ) ( not ( = ?auto_1722842 ?auto_1722848 ) ) ( not ( = ?auto_1722842 ?auto_1722849 ) ) ( not ( = ?auto_1722842 ?auto_1722850 ) ) ( not ( = ?auto_1722842 ?auto_1722851 ) ) ( not ( = ?auto_1722844 ?auto_1722843 ) ) ( not ( = ?auto_1722844 ?auto_1722845 ) ) ( not ( = ?auto_1722844 ?auto_1722846 ) ) ( not ( = ?auto_1722844 ?auto_1722847 ) ) ( not ( = ?auto_1722844 ?auto_1722848 ) ) ( not ( = ?auto_1722844 ?auto_1722849 ) ) ( not ( = ?auto_1722844 ?auto_1722850 ) ) ( not ( = ?auto_1722844 ?auto_1722851 ) ) ( not ( = ?auto_1722843 ?auto_1722845 ) ) ( not ( = ?auto_1722843 ?auto_1722846 ) ) ( not ( = ?auto_1722843 ?auto_1722847 ) ) ( not ( = ?auto_1722843 ?auto_1722848 ) ) ( not ( = ?auto_1722843 ?auto_1722849 ) ) ( not ( = ?auto_1722843 ?auto_1722850 ) ) ( not ( = ?auto_1722843 ?auto_1722851 ) ) ( not ( = ?auto_1722845 ?auto_1722846 ) ) ( not ( = ?auto_1722845 ?auto_1722847 ) ) ( not ( = ?auto_1722845 ?auto_1722848 ) ) ( not ( = ?auto_1722845 ?auto_1722849 ) ) ( not ( = ?auto_1722845 ?auto_1722850 ) ) ( not ( = ?auto_1722845 ?auto_1722851 ) ) ( not ( = ?auto_1722846 ?auto_1722847 ) ) ( not ( = ?auto_1722846 ?auto_1722848 ) ) ( not ( = ?auto_1722846 ?auto_1722849 ) ) ( not ( = ?auto_1722846 ?auto_1722850 ) ) ( not ( = ?auto_1722846 ?auto_1722851 ) ) ( not ( = ?auto_1722847 ?auto_1722848 ) ) ( not ( = ?auto_1722847 ?auto_1722849 ) ) ( not ( = ?auto_1722847 ?auto_1722850 ) ) ( not ( = ?auto_1722847 ?auto_1722851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722848 ?auto_1722849 ?auto_1722850 )
      ( MAKE-10CRATE-VERIFY ?auto_1722840 ?auto_1722841 ?auto_1722842 ?auto_1722844 ?auto_1722843 ?auto_1722845 ?auto_1722846 ?auto_1722847 ?auto_1722848 ?auto_1722849 ?auto_1722850 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730124 - SURFACE
      ?auto_1730125 - SURFACE
      ?auto_1730126 - SURFACE
      ?auto_1730128 - SURFACE
      ?auto_1730127 - SURFACE
      ?auto_1730129 - SURFACE
      ?auto_1730130 - SURFACE
      ?auto_1730131 - SURFACE
      ?auto_1730132 - SURFACE
      ?auto_1730133 - SURFACE
      ?auto_1730134 - SURFACE
      ?auto_1730135 - SURFACE
    )
    :vars
    (
      ?auto_1730137 - HOIST
      ?auto_1730136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730137 ?auto_1730136 ) ( SURFACE-AT ?auto_1730134 ?auto_1730136 ) ( CLEAR ?auto_1730134 ) ( LIFTING ?auto_1730137 ?auto_1730135 ) ( IS-CRATE ?auto_1730135 ) ( not ( = ?auto_1730134 ?auto_1730135 ) ) ( ON ?auto_1730125 ?auto_1730124 ) ( ON ?auto_1730126 ?auto_1730125 ) ( ON ?auto_1730128 ?auto_1730126 ) ( ON ?auto_1730127 ?auto_1730128 ) ( ON ?auto_1730129 ?auto_1730127 ) ( ON ?auto_1730130 ?auto_1730129 ) ( ON ?auto_1730131 ?auto_1730130 ) ( ON ?auto_1730132 ?auto_1730131 ) ( ON ?auto_1730133 ?auto_1730132 ) ( ON ?auto_1730134 ?auto_1730133 ) ( not ( = ?auto_1730124 ?auto_1730125 ) ) ( not ( = ?auto_1730124 ?auto_1730126 ) ) ( not ( = ?auto_1730124 ?auto_1730128 ) ) ( not ( = ?auto_1730124 ?auto_1730127 ) ) ( not ( = ?auto_1730124 ?auto_1730129 ) ) ( not ( = ?auto_1730124 ?auto_1730130 ) ) ( not ( = ?auto_1730124 ?auto_1730131 ) ) ( not ( = ?auto_1730124 ?auto_1730132 ) ) ( not ( = ?auto_1730124 ?auto_1730133 ) ) ( not ( = ?auto_1730124 ?auto_1730134 ) ) ( not ( = ?auto_1730124 ?auto_1730135 ) ) ( not ( = ?auto_1730125 ?auto_1730126 ) ) ( not ( = ?auto_1730125 ?auto_1730128 ) ) ( not ( = ?auto_1730125 ?auto_1730127 ) ) ( not ( = ?auto_1730125 ?auto_1730129 ) ) ( not ( = ?auto_1730125 ?auto_1730130 ) ) ( not ( = ?auto_1730125 ?auto_1730131 ) ) ( not ( = ?auto_1730125 ?auto_1730132 ) ) ( not ( = ?auto_1730125 ?auto_1730133 ) ) ( not ( = ?auto_1730125 ?auto_1730134 ) ) ( not ( = ?auto_1730125 ?auto_1730135 ) ) ( not ( = ?auto_1730126 ?auto_1730128 ) ) ( not ( = ?auto_1730126 ?auto_1730127 ) ) ( not ( = ?auto_1730126 ?auto_1730129 ) ) ( not ( = ?auto_1730126 ?auto_1730130 ) ) ( not ( = ?auto_1730126 ?auto_1730131 ) ) ( not ( = ?auto_1730126 ?auto_1730132 ) ) ( not ( = ?auto_1730126 ?auto_1730133 ) ) ( not ( = ?auto_1730126 ?auto_1730134 ) ) ( not ( = ?auto_1730126 ?auto_1730135 ) ) ( not ( = ?auto_1730128 ?auto_1730127 ) ) ( not ( = ?auto_1730128 ?auto_1730129 ) ) ( not ( = ?auto_1730128 ?auto_1730130 ) ) ( not ( = ?auto_1730128 ?auto_1730131 ) ) ( not ( = ?auto_1730128 ?auto_1730132 ) ) ( not ( = ?auto_1730128 ?auto_1730133 ) ) ( not ( = ?auto_1730128 ?auto_1730134 ) ) ( not ( = ?auto_1730128 ?auto_1730135 ) ) ( not ( = ?auto_1730127 ?auto_1730129 ) ) ( not ( = ?auto_1730127 ?auto_1730130 ) ) ( not ( = ?auto_1730127 ?auto_1730131 ) ) ( not ( = ?auto_1730127 ?auto_1730132 ) ) ( not ( = ?auto_1730127 ?auto_1730133 ) ) ( not ( = ?auto_1730127 ?auto_1730134 ) ) ( not ( = ?auto_1730127 ?auto_1730135 ) ) ( not ( = ?auto_1730129 ?auto_1730130 ) ) ( not ( = ?auto_1730129 ?auto_1730131 ) ) ( not ( = ?auto_1730129 ?auto_1730132 ) ) ( not ( = ?auto_1730129 ?auto_1730133 ) ) ( not ( = ?auto_1730129 ?auto_1730134 ) ) ( not ( = ?auto_1730129 ?auto_1730135 ) ) ( not ( = ?auto_1730130 ?auto_1730131 ) ) ( not ( = ?auto_1730130 ?auto_1730132 ) ) ( not ( = ?auto_1730130 ?auto_1730133 ) ) ( not ( = ?auto_1730130 ?auto_1730134 ) ) ( not ( = ?auto_1730130 ?auto_1730135 ) ) ( not ( = ?auto_1730131 ?auto_1730132 ) ) ( not ( = ?auto_1730131 ?auto_1730133 ) ) ( not ( = ?auto_1730131 ?auto_1730134 ) ) ( not ( = ?auto_1730131 ?auto_1730135 ) ) ( not ( = ?auto_1730132 ?auto_1730133 ) ) ( not ( = ?auto_1730132 ?auto_1730134 ) ) ( not ( = ?auto_1730132 ?auto_1730135 ) ) ( not ( = ?auto_1730133 ?auto_1730134 ) ) ( not ( = ?auto_1730133 ?auto_1730135 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1730134 ?auto_1730135 )
      ( MAKE-11CRATE-VERIFY ?auto_1730124 ?auto_1730125 ?auto_1730126 ?auto_1730128 ?auto_1730127 ?auto_1730129 ?auto_1730130 ?auto_1730131 ?auto_1730132 ?auto_1730133 ?auto_1730134 ?auto_1730135 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730233 - SURFACE
      ?auto_1730234 - SURFACE
      ?auto_1730235 - SURFACE
      ?auto_1730237 - SURFACE
      ?auto_1730236 - SURFACE
      ?auto_1730238 - SURFACE
      ?auto_1730239 - SURFACE
      ?auto_1730240 - SURFACE
      ?auto_1730241 - SURFACE
      ?auto_1730242 - SURFACE
      ?auto_1730243 - SURFACE
      ?auto_1730244 - SURFACE
    )
    :vars
    (
      ?auto_1730245 - HOIST
      ?auto_1730246 - PLACE
      ?auto_1730247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730245 ?auto_1730246 ) ( SURFACE-AT ?auto_1730243 ?auto_1730246 ) ( CLEAR ?auto_1730243 ) ( IS-CRATE ?auto_1730244 ) ( not ( = ?auto_1730243 ?auto_1730244 ) ) ( TRUCK-AT ?auto_1730247 ?auto_1730246 ) ( AVAILABLE ?auto_1730245 ) ( IN ?auto_1730244 ?auto_1730247 ) ( ON ?auto_1730243 ?auto_1730242 ) ( not ( = ?auto_1730242 ?auto_1730243 ) ) ( not ( = ?auto_1730242 ?auto_1730244 ) ) ( ON ?auto_1730234 ?auto_1730233 ) ( ON ?auto_1730235 ?auto_1730234 ) ( ON ?auto_1730237 ?auto_1730235 ) ( ON ?auto_1730236 ?auto_1730237 ) ( ON ?auto_1730238 ?auto_1730236 ) ( ON ?auto_1730239 ?auto_1730238 ) ( ON ?auto_1730240 ?auto_1730239 ) ( ON ?auto_1730241 ?auto_1730240 ) ( ON ?auto_1730242 ?auto_1730241 ) ( not ( = ?auto_1730233 ?auto_1730234 ) ) ( not ( = ?auto_1730233 ?auto_1730235 ) ) ( not ( = ?auto_1730233 ?auto_1730237 ) ) ( not ( = ?auto_1730233 ?auto_1730236 ) ) ( not ( = ?auto_1730233 ?auto_1730238 ) ) ( not ( = ?auto_1730233 ?auto_1730239 ) ) ( not ( = ?auto_1730233 ?auto_1730240 ) ) ( not ( = ?auto_1730233 ?auto_1730241 ) ) ( not ( = ?auto_1730233 ?auto_1730242 ) ) ( not ( = ?auto_1730233 ?auto_1730243 ) ) ( not ( = ?auto_1730233 ?auto_1730244 ) ) ( not ( = ?auto_1730234 ?auto_1730235 ) ) ( not ( = ?auto_1730234 ?auto_1730237 ) ) ( not ( = ?auto_1730234 ?auto_1730236 ) ) ( not ( = ?auto_1730234 ?auto_1730238 ) ) ( not ( = ?auto_1730234 ?auto_1730239 ) ) ( not ( = ?auto_1730234 ?auto_1730240 ) ) ( not ( = ?auto_1730234 ?auto_1730241 ) ) ( not ( = ?auto_1730234 ?auto_1730242 ) ) ( not ( = ?auto_1730234 ?auto_1730243 ) ) ( not ( = ?auto_1730234 ?auto_1730244 ) ) ( not ( = ?auto_1730235 ?auto_1730237 ) ) ( not ( = ?auto_1730235 ?auto_1730236 ) ) ( not ( = ?auto_1730235 ?auto_1730238 ) ) ( not ( = ?auto_1730235 ?auto_1730239 ) ) ( not ( = ?auto_1730235 ?auto_1730240 ) ) ( not ( = ?auto_1730235 ?auto_1730241 ) ) ( not ( = ?auto_1730235 ?auto_1730242 ) ) ( not ( = ?auto_1730235 ?auto_1730243 ) ) ( not ( = ?auto_1730235 ?auto_1730244 ) ) ( not ( = ?auto_1730237 ?auto_1730236 ) ) ( not ( = ?auto_1730237 ?auto_1730238 ) ) ( not ( = ?auto_1730237 ?auto_1730239 ) ) ( not ( = ?auto_1730237 ?auto_1730240 ) ) ( not ( = ?auto_1730237 ?auto_1730241 ) ) ( not ( = ?auto_1730237 ?auto_1730242 ) ) ( not ( = ?auto_1730237 ?auto_1730243 ) ) ( not ( = ?auto_1730237 ?auto_1730244 ) ) ( not ( = ?auto_1730236 ?auto_1730238 ) ) ( not ( = ?auto_1730236 ?auto_1730239 ) ) ( not ( = ?auto_1730236 ?auto_1730240 ) ) ( not ( = ?auto_1730236 ?auto_1730241 ) ) ( not ( = ?auto_1730236 ?auto_1730242 ) ) ( not ( = ?auto_1730236 ?auto_1730243 ) ) ( not ( = ?auto_1730236 ?auto_1730244 ) ) ( not ( = ?auto_1730238 ?auto_1730239 ) ) ( not ( = ?auto_1730238 ?auto_1730240 ) ) ( not ( = ?auto_1730238 ?auto_1730241 ) ) ( not ( = ?auto_1730238 ?auto_1730242 ) ) ( not ( = ?auto_1730238 ?auto_1730243 ) ) ( not ( = ?auto_1730238 ?auto_1730244 ) ) ( not ( = ?auto_1730239 ?auto_1730240 ) ) ( not ( = ?auto_1730239 ?auto_1730241 ) ) ( not ( = ?auto_1730239 ?auto_1730242 ) ) ( not ( = ?auto_1730239 ?auto_1730243 ) ) ( not ( = ?auto_1730239 ?auto_1730244 ) ) ( not ( = ?auto_1730240 ?auto_1730241 ) ) ( not ( = ?auto_1730240 ?auto_1730242 ) ) ( not ( = ?auto_1730240 ?auto_1730243 ) ) ( not ( = ?auto_1730240 ?auto_1730244 ) ) ( not ( = ?auto_1730241 ?auto_1730242 ) ) ( not ( = ?auto_1730241 ?auto_1730243 ) ) ( not ( = ?auto_1730241 ?auto_1730244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730242 ?auto_1730243 ?auto_1730244 )
      ( MAKE-11CRATE-VERIFY ?auto_1730233 ?auto_1730234 ?auto_1730235 ?auto_1730237 ?auto_1730236 ?auto_1730238 ?auto_1730239 ?auto_1730240 ?auto_1730241 ?auto_1730242 ?auto_1730243 ?auto_1730244 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730354 - SURFACE
      ?auto_1730355 - SURFACE
      ?auto_1730356 - SURFACE
      ?auto_1730358 - SURFACE
      ?auto_1730357 - SURFACE
      ?auto_1730359 - SURFACE
      ?auto_1730360 - SURFACE
      ?auto_1730361 - SURFACE
      ?auto_1730362 - SURFACE
      ?auto_1730363 - SURFACE
      ?auto_1730364 - SURFACE
      ?auto_1730365 - SURFACE
    )
    :vars
    (
      ?auto_1730368 - HOIST
      ?auto_1730366 - PLACE
      ?auto_1730367 - TRUCK
      ?auto_1730369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730368 ?auto_1730366 ) ( SURFACE-AT ?auto_1730364 ?auto_1730366 ) ( CLEAR ?auto_1730364 ) ( IS-CRATE ?auto_1730365 ) ( not ( = ?auto_1730364 ?auto_1730365 ) ) ( AVAILABLE ?auto_1730368 ) ( IN ?auto_1730365 ?auto_1730367 ) ( ON ?auto_1730364 ?auto_1730363 ) ( not ( = ?auto_1730363 ?auto_1730364 ) ) ( not ( = ?auto_1730363 ?auto_1730365 ) ) ( TRUCK-AT ?auto_1730367 ?auto_1730369 ) ( not ( = ?auto_1730369 ?auto_1730366 ) ) ( ON ?auto_1730355 ?auto_1730354 ) ( ON ?auto_1730356 ?auto_1730355 ) ( ON ?auto_1730358 ?auto_1730356 ) ( ON ?auto_1730357 ?auto_1730358 ) ( ON ?auto_1730359 ?auto_1730357 ) ( ON ?auto_1730360 ?auto_1730359 ) ( ON ?auto_1730361 ?auto_1730360 ) ( ON ?auto_1730362 ?auto_1730361 ) ( ON ?auto_1730363 ?auto_1730362 ) ( not ( = ?auto_1730354 ?auto_1730355 ) ) ( not ( = ?auto_1730354 ?auto_1730356 ) ) ( not ( = ?auto_1730354 ?auto_1730358 ) ) ( not ( = ?auto_1730354 ?auto_1730357 ) ) ( not ( = ?auto_1730354 ?auto_1730359 ) ) ( not ( = ?auto_1730354 ?auto_1730360 ) ) ( not ( = ?auto_1730354 ?auto_1730361 ) ) ( not ( = ?auto_1730354 ?auto_1730362 ) ) ( not ( = ?auto_1730354 ?auto_1730363 ) ) ( not ( = ?auto_1730354 ?auto_1730364 ) ) ( not ( = ?auto_1730354 ?auto_1730365 ) ) ( not ( = ?auto_1730355 ?auto_1730356 ) ) ( not ( = ?auto_1730355 ?auto_1730358 ) ) ( not ( = ?auto_1730355 ?auto_1730357 ) ) ( not ( = ?auto_1730355 ?auto_1730359 ) ) ( not ( = ?auto_1730355 ?auto_1730360 ) ) ( not ( = ?auto_1730355 ?auto_1730361 ) ) ( not ( = ?auto_1730355 ?auto_1730362 ) ) ( not ( = ?auto_1730355 ?auto_1730363 ) ) ( not ( = ?auto_1730355 ?auto_1730364 ) ) ( not ( = ?auto_1730355 ?auto_1730365 ) ) ( not ( = ?auto_1730356 ?auto_1730358 ) ) ( not ( = ?auto_1730356 ?auto_1730357 ) ) ( not ( = ?auto_1730356 ?auto_1730359 ) ) ( not ( = ?auto_1730356 ?auto_1730360 ) ) ( not ( = ?auto_1730356 ?auto_1730361 ) ) ( not ( = ?auto_1730356 ?auto_1730362 ) ) ( not ( = ?auto_1730356 ?auto_1730363 ) ) ( not ( = ?auto_1730356 ?auto_1730364 ) ) ( not ( = ?auto_1730356 ?auto_1730365 ) ) ( not ( = ?auto_1730358 ?auto_1730357 ) ) ( not ( = ?auto_1730358 ?auto_1730359 ) ) ( not ( = ?auto_1730358 ?auto_1730360 ) ) ( not ( = ?auto_1730358 ?auto_1730361 ) ) ( not ( = ?auto_1730358 ?auto_1730362 ) ) ( not ( = ?auto_1730358 ?auto_1730363 ) ) ( not ( = ?auto_1730358 ?auto_1730364 ) ) ( not ( = ?auto_1730358 ?auto_1730365 ) ) ( not ( = ?auto_1730357 ?auto_1730359 ) ) ( not ( = ?auto_1730357 ?auto_1730360 ) ) ( not ( = ?auto_1730357 ?auto_1730361 ) ) ( not ( = ?auto_1730357 ?auto_1730362 ) ) ( not ( = ?auto_1730357 ?auto_1730363 ) ) ( not ( = ?auto_1730357 ?auto_1730364 ) ) ( not ( = ?auto_1730357 ?auto_1730365 ) ) ( not ( = ?auto_1730359 ?auto_1730360 ) ) ( not ( = ?auto_1730359 ?auto_1730361 ) ) ( not ( = ?auto_1730359 ?auto_1730362 ) ) ( not ( = ?auto_1730359 ?auto_1730363 ) ) ( not ( = ?auto_1730359 ?auto_1730364 ) ) ( not ( = ?auto_1730359 ?auto_1730365 ) ) ( not ( = ?auto_1730360 ?auto_1730361 ) ) ( not ( = ?auto_1730360 ?auto_1730362 ) ) ( not ( = ?auto_1730360 ?auto_1730363 ) ) ( not ( = ?auto_1730360 ?auto_1730364 ) ) ( not ( = ?auto_1730360 ?auto_1730365 ) ) ( not ( = ?auto_1730361 ?auto_1730362 ) ) ( not ( = ?auto_1730361 ?auto_1730363 ) ) ( not ( = ?auto_1730361 ?auto_1730364 ) ) ( not ( = ?auto_1730361 ?auto_1730365 ) ) ( not ( = ?auto_1730362 ?auto_1730363 ) ) ( not ( = ?auto_1730362 ?auto_1730364 ) ) ( not ( = ?auto_1730362 ?auto_1730365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730363 ?auto_1730364 ?auto_1730365 )
      ( MAKE-11CRATE-VERIFY ?auto_1730354 ?auto_1730355 ?auto_1730356 ?auto_1730358 ?auto_1730357 ?auto_1730359 ?auto_1730360 ?auto_1730361 ?auto_1730362 ?auto_1730363 ?auto_1730364 ?auto_1730365 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730486 - SURFACE
      ?auto_1730487 - SURFACE
      ?auto_1730488 - SURFACE
      ?auto_1730490 - SURFACE
      ?auto_1730489 - SURFACE
      ?auto_1730491 - SURFACE
      ?auto_1730492 - SURFACE
      ?auto_1730493 - SURFACE
      ?auto_1730494 - SURFACE
      ?auto_1730495 - SURFACE
      ?auto_1730496 - SURFACE
      ?auto_1730497 - SURFACE
    )
    :vars
    (
      ?auto_1730501 - HOIST
      ?auto_1730500 - PLACE
      ?auto_1730502 - TRUCK
      ?auto_1730499 - PLACE
      ?auto_1730498 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730501 ?auto_1730500 ) ( SURFACE-AT ?auto_1730496 ?auto_1730500 ) ( CLEAR ?auto_1730496 ) ( IS-CRATE ?auto_1730497 ) ( not ( = ?auto_1730496 ?auto_1730497 ) ) ( AVAILABLE ?auto_1730501 ) ( ON ?auto_1730496 ?auto_1730495 ) ( not ( = ?auto_1730495 ?auto_1730496 ) ) ( not ( = ?auto_1730495 ?auto_1730497 ) ) ( TRUCK-AT ?auto_1730502 ?auto_1730499 ) ( not ( = ?auto_1730499 ?auto_1730500 ) ) ( HOIST-AT ?auto_1730498 ?auto_1730499 ) ( LIFTING ?auto_1730498 ?auto_1730497 ) ( not ( = ?auto_1730501 ?auto_1730498 ) ) ( ON ?auto_1730487 ?auto_1730486 ) ( ON ?auto_1730488 ?auto_1730487 ) ( ON ?auto_1730490 ?auto_1730488 ) ( ON ?auto_1730489 ?auto_1730490 ) ( ON ?auto_1730491 ?auto_1730489 ) ( ON ?auto_1730492 ?auto_1730491 ) ( ON ?auto_1730493 ?auto_1730492 ) ( ON ?auto_1730494 ?auto_1730493 ) ( ON ?auto_1730495 ?auto_1730494 ) ( not ( = ?auto_1730486 ?auto_1730487 ) ) ( not ( = ?auto_1730486 ?auto_1730488 ) ) ( not ( = ?auto_1730486 ?auto_1730490 ) ) ( not ( = ?auto_1730486 ?auto_1730489 ) ) ( not ( = ?auto_1730486 ?auto_1730491 ) ) ( not ( = ?auto_1730486 ?auto_1730492 ) ) ( not ( = ?auto_1730486 ?auto_1730493 ) ) ( not ( = ?auto_1730486 ?auto_1730494 ) ) ( not ( = ?auto_1730486 ?auto_1730495 ) ) ( not ( = ?auto_1730486 ?auto_1730496 ) ) ( not ( = ?auto_1730486 ?auto_1730497 ) ) ( not ( = ?auto_1730487 ?auto_1730488 ) ) ( not ( = ?auto_1730487 ?auto_1730490 ) ) ( not ( = ?auto_1730487 ?auto_1730489 ) ) ( not ( = ?auto_1730487 ?auto_1730491 ) ) ( not ( = ?auto_1730487 ?auto_1730492 ) ) ( not ( = ?auto_1730487 ?auto_1730493 ) ) ( not ( = ?auto_1730487 ?auto_1730494 ) ) ( not ( = ?auto_1730487 ?auto_1730495 ) ) ( not ( = ?auto_1730487 ?auto_1730496 ) ) ( not ( = ?auto_1730487 ?auto_1730497 ) ) ( not ( = ?auto_1730488 ?auto_1730490 ) ) ( not ( = ?auto_1730488 ?auto_1730489 ) ) ( not ( = ?auto_1730488 ?auto_1730491 ) ) ( not ( = ?auto_1730488 ?auto_1730492 ) ) ( not ( = ?auto_1730488 ?auto_1730493 ) ) ( not ( = ?auto_1730488 ?auto_1730494 ) ) ( not ( = ?auto_1730488 ?auto_1730495 ) ) ( not ( = ?auto_1730488 ?auto_1730496 ) ) ( not ( = ?auto_1730488 ?auto_1730497 ) ) ( not ( = ?auto_1730490 ?auto_1730489 ) ) ( not ( = ?auto_1730490 ?auto_1730491 ) ) ( not ( = ?auto_1730490 ?auto_1730492 ) ) ( not ( = ?auto_1730490 ?auto_1730493 ) ) ( not ( = ?auto_1730490 ?auto_1730494 ) ) ( not ( = ?auto_1730490 ?auto_1730495 ) ) ( not ( = ?auto_1730490 ?auto_1730496 ) ) ( not ( = ?auto_1730490 ?auto_1730497 ) ) ( not ( = ?auto_1730489 ?auto_1730491 ) ) ( not ( = ?auto_1730489 ?auto_1730492 ) ) ( not ( = ?auto_1730489 ?auto_1730493 ) ) ( not ( = ?auto_1730489 ?auto_1730494 ) ) ( not ( = ?auto_1730489 ?auto_1730495 ) ) ( not ( = ?auto_1730489 ?auto_1730496 ) ) ( not ( = ?auto_1730489 ?auto_1730497 ) ) ( not ( = ?auto_1730491 ?auto_1730492 ) ) ( not ( = ?auto_1730491 ?auto_1730493 ) ) ( not ( = ?auto_1730491 ?auto_1730494 ) ) ( not ( = ?auto_1730491 ?auto_1730495 ) ) ( not ( = ?auto_1730491 ?auto_1730496 ) ) ( not ( = ?auto_1730491 ?auto_1730497 ) ) ( not ( = ?auto_1730492 ?auto_1730493 ) ) ( not ( = ?auto_1730492 ?auto_1730494 ) ) ( not ( = ?auto_1730492 ?auto_1730495 ) ) ( not ( = ?auto_1730492 ?auto_1730496 ) ) ( not ( = ?auto_1730492 ?auto_1730497 ) ) ( not ( = ?auto_1730493 ?auto_1730494 ) ) ( not ( = ?auto_1730493 ?auto_1730495 ) ) ( not ( = ?auto_1730493 ?auto_1730496 ) ) ( not ( = ?auto_1730493 ?auto_1730497 ) ) ( not ( = ?auto_1730494 ?auto_1730495 ) ) ( not ( = ?auto_1730494 ?auto_1730496 ) ) ( not ( = ?auto_1730494 ?auto_1730497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730495 ?auto_1730496 ?auto_1730497 )
      ( MAKE-11CRATE-VERIFY ?auto_1730486 ?auto_1730487 ?auto_1730488 ?auto_1730490 ?auto_1730489 ?auto_1730491 ?auto_1730492 ?auto_1730493 ?auto_1730494 ?auto_1730495 ?auto_1730496 ?auto_1730497 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730629 - SURFACE
      ?auto_1730630 - SURFACE
      ?auto_1730631 - SURFACE
      ?auto_1730633 - SURFACE
      ?auto_1730632 - SURFACE
      ?auto_1730634 - SURFACE
      ?auto_1730635 - SURFACE
      ?auto_1730636 - SURFACE
      ?auto_1730637 - SURFACE
      ?auto_1730638 - SURFACE
      ?auto_1730639 - SURFACE
      ?auto_1730640 - SURFACE
    )
    :vars
    (
      ?auto_1730641 - HOIST
      ?auto_1730644 - PLACE
      ?auto_1730645 - TRUCK
      ?auto_1730642 - PLACE
      ?auto_1730643 - HOIST
      ?auto_1730646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730641 ?auto_1730644 ) ( SURFACE-AT ?auto_1730639 ?auto_1730644 ) ( CLEAR ?auto_1730639 ) ( IS-CRATE ?auto_1730640 ) ( not ( = ?auto_1730639 ?auto_1730640 ) ) ( AVAILABLE ?auto_1730641 ) ( ON ?auto_1730639 ?auto_1730638 ) ( not ( = ?auto_1730638 ?auto_1730639 ) ) ( not ( = ?auto_1730638 ?auto_1730640 ) ) ( TRUCK-AT ?auto_1730645 ?auto_1730642 ) ( not ( = ?auto_1730642 ?auto_1730644 ) ) ( HOIST-AT ?auto_1730643 ?auto_1730642 ) ( not ( = ?auto_1730641 ?auto_1730643 ) ) ( AVAILABLE ?auto_1730643 ) ( SURFACE-AT ?auto_1730640 ?auto_1730642 ) ( ON ?auto_1730640 ?auto_1730646 ) ( CLEAR ?auto_1730640 ) ( not ( = ?auto_1730639 ?auto_1730646 ) ) ( not ( = ?auto_1730640 ?auto_1730646 ) ) ( not ( = ?auto_1730638 ?auto_1730646 ) ) ( ON ?auto_1730630 ?auto_1730629 ) ( ON ?auto_1730631 ?auto_1730630 ) ( ON ?auto_1730633 ?auto_1730631 ) ( ON ?auto_1730632 ?auto_1730633 ) ( ON ?auto_1730634 ?auto_1730632 ) ( ON ?auto_1730635 ?auto_1730634 ) ( ON ?auto_1730636 ?auto_1730635 ) ( ON ?auto_1730637 ?auto_1730636 ) ( ON ?auto_1730638 ?auto_1730637 ) ( not ( = ?auto_1730629 ?auto_1730630 ) ) ( not ( = ?auto_1730629 ?auto_1730631 ) ) ( not ( = ?auto_1730629 ?auto_1730633 ) ) ( not ( = ?auto_1730629 ?auto_1730632 ) ) ( not ( = ?auto_1730629 ?auto_1730634 ) ) ( not ( = ?auto_1730629 ?auto_1730635 ) ) ( not ( = ?auto_1730629 ?auto_1730636 ) ) ( not ( = ?auto_1730629 ?auto_1730637 ) ) ( not ( = ?auto_1730629 ?auto_1730638 ) ) ( not ( = ?auto_1730629 ?auto_1730639 ) ) ( not ( = ?auto_1730629 ?auto_1730640 ) ) ( not ( = ?auto_1730629 ?auto_1730646 ) ) ( not ( = ?auto_1730630 ?auto_1730631 ) ) ( not ( = ?auto_1730630 ?auto_1730633 ) ) ( not ( = ?auto_1730630 ?auto_1730632 ) ) ( not ( = ?auto_1730630 ?auto_1730634 ) ) ( not ( = ?auto_1730630 ?auto_1730635 ) ) ( not ( = ?auto_1730630 ?auto_1730636 ) ) ( not ( = ?auto_1730630 ?auto_1730637 ) ) ( not ( = ?auto_1730630 ?auto_1730638 ) ) ( not ( = ?auto_1730630 ?auto_1730639 ) ) ( not ( = ?auto_1730630 ?auto_1730640 ) ) ( not ( = ?auto_1730630 ?auto_1730646 ) ) ( not ( = ?auto_1730631 ?auto_1730633 ) ) ( not ( = ?auto_1730631 ?auto_1730632 ) ) ( not ( = ?auto_1730631 ?auto_1730634 ) ) ( not ( = ?auto_1730631 ?auto_1730635 ) ) ( not ( = ?auto_1730631 ?auto_1730636 ) ) ( not ( = ?auto_1730631 ?auto_1730637 ) ) ( not ( = ?auto_1730631 ?auto_1730638 ) ) ( not ( = ?auto_1730631 ?auto_1730639 ) ) ( not ( = ?auto_1730631 ?auto_1730640 ) ) ( not ( = ?auto_1730631 ?auto_1730646 ) ) ( not ( = ?auto_1730633 ?auto_1730632 ) ) ( not ( = ?auto_1730633 ?auto_1730634 ) ) ( not ( = ?auto_1730633 ?auto_1730635 ) ) ( not ( = ?auto_1730633 ?auto_1730636 ) ) ( not ( = ?auto_1730633 ?auto_1730637 ) ) ( not ( = ?auto_1730633 ?auto_1730638 ) ) ( not ( = ?auto_1730633 ?auto_1730639 ) ) ( not ( = ?auto_1730633 ?auto_1730640 ) ) ( not ( = ?auto_1730633 ?auto_1730646 ) ) ( not ( = ?auto_1730632 ?auto_1730634 ) ) ( not ( = ?auto_1730632 ?auto_1730635 ) ) ( not ( = ?auto_1730632 ?auto_1730636 ) ) ( not ( = ?auto_1730632 ?auto_1730637 ) ) ( not ( = ?auto_1730632 ?auto_1730638 ) ) ( not ( = ?auto_1730632 ?auto_1730639 ) ) ( not ( = ?auto_1730632 ?auto_1730640 ) ) ( not ( = ?auto_1730632 ?auto_1730646 ) ) ( not ( = ?auto_1730634 ?auto_1730635 ) ) ( not ( = ?auto_1730634 ?auto_1730636 ) ) ( not ( = ?auto_1730634 ?auto_1730637 ) ) ( not ( = ?auto_1730634 ?auto_1730638 ) ) ( not ( = ?auto_1730634 ?auto_1730639 ) ) ( not ( = ?auto_1730634 ?auto_1730640 ) ) ( not ( = ?auto_1730634 ?auto_1730646 ) ) ( not ( = ?auto_1730635 ?auto_1730636 ) ) ( not ( = ?auto_1730635 ?auto_1730637 ) ) ( not ( = ?auto_1730635 ?auto_1730638 ) ) ( not ( = ?auto_1730635 ?auto_1730639 ) ) ( not ( = ?auto_1730635 ?auto_1730640 ) ) ( not ( = ?auto_1730635 ?auto_1730646 ) ) ( not ( = ?auto_1730636 ?auto_1730637 ) ) ( not ( = ?auto_1730636 ?auto_1730638 ) ) ( not ( = ?auto_1730636 ?auto_1730639 ) ) ( not ( = ?auto_1730636 ?auto_1730640 ) ) ( not ( = ?auto_1730636 ?auto_1730646 ) ) ( not ( = ?auto_1730637 ?auto_1730638 ) ) ( not ( = ?auto_1730637 ?auto_1730639 ) ) ( not ( = ?auto_1730637 ?auto_1730640 ) ) ( not ( = ?auto_1730637 ?auto_1730646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730638 ?auto_1730639 ?auto_1730640 )
      ( MAKE-11CRATE-VERIFY ?auto_1730629 ?auto_1730630 ?auto_1730631 ?auto_1730633 ?auto_1730632 ?auto_1730634 ?auto_1730635 ?auto_1730636 ?auto_1730637 ?auto_1730638 ?auto_1730639 ?auto_1730640 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730773 - SURFACE
      ?auto_1730774 - SURFACE
      ?auto_1730775 - SURFACE
      ?auto_1730777 - SURFACE
      ?auto_1730776 - SURFACE
      ?auto_1730778 - SURFACE
      ?auto_1730779 - SURFACE
      ?auto_1730780 - SURFACE
      ?auto_1730781 - SURFACE
      ?auto_1730782 - SURFACE
      ?auto_1730783 - SURFACE
      ?auto_1730784 - SURFACE
    )
    :vars
    (
      ?auto_1730787 - HOIST
      ?auto_1730790 - PLACE
      ?auto_1730789 - PLACE
      ?auto_1730785 - HOIST
      ?auto_1730788 - SURFACE
      ?auto_1730786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730787 ?auto_1730790 ) ( SURFACE-AT ?auto_1730783 ?auto_1730790 ) ( CLEAR ?auto_1730783 ) ( IS-CRATE ?auto_1730784 ) ( not ( = ?auto_1730783 ?auto_1730784 ) ) ( AVAILABLE ?auto_1730787 ) ( ON ?auto_1730783 ?auto_1730782 ) ( not ( = ?auto_1730782 ?auto_1730783 ) ) ( not ( = ?auto_1730782 ?auto_1730784 ) ) ( not ( = ?auto_1730789 ?auto_1730790 ) ) ( HOIST-AT ?auto_1730785 ?auto_1730789 ) ( not ( = ?auto_1730787 ?auto_1730785 ) ) ( AVAILABLE ?auto_1730785 ) ( SURFACE-AT ?auto_1730784 ?auto_1730789 ) ( ON ?auto_1730784 ?auto_1730788 ) ( CLEAR ?auto_1730784 ) ( not ( = ?auto_1730783 ?auto_1730788 ) ) ( not ( = ?auto_1730784 ?auto_1730788 ) ) ( not ( = ?auto_1730782 ?auto_1730788 ) ) ( TRUCK-AT ?auto_1730786 ?auto_1730790 ) ( ON ?auto_1730774 ?auto_1730773 ) ( ON ?auto_1730775 ?auto_1730774 ) ( ON ?auto_1730777 ?auto_1730775 ) ( ON ?auto_1730776 ?auto_1730777 ) ( ON ?auto_1730778 ?auto_1730776 ) ( ON ?auto_1730779 ?auto_1730778 ) ( ON ?auto_1730780 ?auto_1730779 ) ( ON ?auto_1730781 ?auto_1730780 ) ( ON ?auto_1730782 ?auto_1730781 ) ( not ( = ?auto_1730773 ?auto_1730774 ) ) ( not ( = ?auto_1730773 ?auto_1730775 ) ) ( not ( = ?auto_1730773 ?auto_1730777 ) ) ( not ( = ?auto_1730773 ?auto_1730776 ) ) ( not ( = ?auto_1730773 ?auto_1730778 ) ) ( not ( = ?auto_1730773 ?auto_1730779 ) ) ( not ( = ?auto_1730773 ?auto_1730780 ) ) ( not ( = ?auto_1730773 ?auto_1730781 ) ) ( not ( = ?auto_1730773 ?auto_1730782 ) ) ( not ( = ?auto_1730773 ?auto_1730783 ) ) ( not ( = ?auto_1730773 ?auto_1730784 ) ) ( not ( = ?auto_1730773 ?auto_1730788 ) ) ( not ( = ?auto_1730774 ?auto_1730775 ) ) ( not ( = ?auto_1730774 ?auto_1730777 ) ) ( not ( = ?auto_1730774 ?auto_1730776 ) ) ( not ( = ?auto_1730774 ?auto_1730778 ) ) ( not ( = ?auto_1730774 ?auto_1730779 ) ) ( not ( = ?auto_1730774 ?auto_1730780 ) ) ( not ( = ?auto_1730774 ?auto_1730781 ) ) ( not ( = ?auto_1730774 ?auto_1730782 ) ) ( not ( = ?auto_1730774 ?auto_1730783 ) ) ( not ( = ?auto_1730774 ?auto_1730784 ) ) ( not ( = ?auto_1730774 ?auto_1730788 ) ) ( not ( = ?auto_1730775 ?auto_1730777 ) ) ( not ( = ?auto_1730775 ?auto_1730776 ) ) ( not ( = ?auto_1730775 ?auto_1730778 ) ) ( not ( = ?auto_1730775 ?auto_1730779 ) ) ( not ( = ?auto_1730775 ?auto_1730780 ) ) ( not ( = ?auto_1730775 ?auto_1730781 ) ) ( not ( = ?auto_1730775 ?auto_1730782 ) ) ( not ( = ?auto_1730775 ?auto_1730783 ) ) ( not ( = ?auto_1730775 ?auto_1730784 ) ) ( not ( = ?auto_1730775 ?auto_1730788 ) ) ( not ( = ?auto_1730777 ?auto_1730776 ) ) ( not ( = ?auto_1730777 ?auto_1730778 ) ) ( not ( = ?auto_1730777 ?auto_1730779 ) ) ( not ( = ?auto_1730777 ?auto_1730780 ) ) ( not ( = ?auto_1730777 ?auto_1730781 ) ) ( not ( = ?auto_1730777 ?auto_1730782 ) ) ( not ( = ?auto_1730777 ?auto_1730783 ) ) ( not ( = ?auto_1730777 ?auto_1730784 ) ) ( not ( = ?auto_1730777 ?auto_1730788 ) ) ( not ( = ?auto_1730776 ?auto_1730778 ) ) ( not ( = ?auto_1730776 ?auto_1730779 ) ) ( not ( = ?auto_1730776 ?auto_1730780 ) ) ( not ( = ?auto_1730776 ?auto_1730781 ) ) ( not ( = ?auto_1730776 ?auto_1730782 ) ) ( not ( = ?auto_1730776 ?auto_1730783 ) ) ( not ( = ?auto_1730776 ?auto_1730784 ) ) ( not ( = ?auto_1730776 ?auto_1730788 ) ) ( not ( = ?auto_1730778 ?auto_1730779 ) ) ( not ( = ?auto_1730778 ?auto_1730780 ) ) ( not ( = ?auto_1730778 ?auto_1730781 ) ) ( not ( = ?auto_1730778 ?auto_1730782 ) ) ( not ( = ?auto_1730778 ?auto_1730783 ) ) ( not ( = ?auto_1730778 ?auto_1730784 ) ) ( not ( = ?auto_1730778 ?auto_1730788 ) ) ( not ( = ?auto_1730779 ?auto_1730780 ) ) ( not ( = ?auto_1730779 ?auto_1730781 ) ) ( not ( = ?auto_1730779 ?auto_1730782 ) ) ( not ( = ?auto_1730779 ?auto_1730783 ) ) ( not ( = ?auto_1730779 ?auto_1730784 ) ) ( not ( = ?auto_1730779 ?auto_1730788 ) ) ( not ( = ?auto_1730780 ?auto_1730781 ) ) ( not ( = ?auto_1730780 ?auto_1730782 ) ) ( not ( = ?auto_1730780 ?auto_1730783 ) ) ( not ( = ?auto_1730780 ?auto_1730784 ) ) ( not ( = ?auto_1730780 ?auto_1730788 ) ) ( not ( = ?auto_1730781 ?auto_1730782 ) ) ( not ( = ?auto_1730781 ?auto_1730783 ) ) ( not ( = ?auto_1730781 ?auto_1730784 ) ) ( not ( = ?auto_1730781 ?auto_1730788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730782 ?auto_1730783 ?auto_1730784 )
      ( MAKE-11CRATE-VERIFY ?auto_1730773 ?auto_1730774 ?auto_1730775 ?auto_1730777 ?auto_1730776 ?auto_1730778 ?auto_1730779 ?auto_1730780 ?auto_1730781 ?auto_1730782 ?auto_1730783 ?auto_1730784 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730917 - SURFACE
      ?auto_1730918 - SURFACE
      ?auto_1730919 - SURFACE
      ?auto_1730921 - SURFACE
      ?auto_1730920 - SURFACE
      ?auto_1730922 - SURFACE
      ?auto_1730923 - SURFACE
      ?auto_1730924 - SURFACE
      ?auto_1730925 - SURFACE
      ?auto_1730926 - SURFACE
      ?auto_1730927 - SURFACE
      ?auto_1730928 - SURFACE
    )
    :vars
    (
      ?auto_1730930 - HOIST
      ?auto_1730931 - PLACE
      ?auto_1730932 - PLACE
      ?auto_1730929 - HOIST
      ?auto_1730933 - SURFACE
      ?auto_1730934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730930 ?auto_1730931 ) ( IS-CRATE ?auto_1730928 ) ( not ( = ?auto_1730927 ?auto_1730928 ) ) ( not ( = ?auto_1730926 ?auto_1730927 ) ) ( not ( = ?auto_1730926 ?auto_1730928 ) ) ( not ( = ?auto_1730932 ?auto_1730931 ) ) ( HOIST-AT ?auto_1730929 ?auto_1730932 ) ( not ( = ?auto_1730930 ?auto_1730929 ) ) ( AVAILABLE ?auto_1730929 ) ( SURFACE-AT ?auto_1730928 ?auto_1730932 ) ( ON ?auto_1730928 ?auto_1730933 ) ( CLEAR ?auto_1730928 ) ( not ( = ?auto_1730927 ?auto_1730933 ) ) ( not ( = ?auto_1730928 ?auto_1730933 ) ) ( not ( = ?auto_1730926 ?auto_1730933 ) ) ( TRUCK-AT ?auto_1730934 ?auto_1730931 ) ( SURFACE-AT ?auto_1730926 ?auto_1730931 ) ( CLEAR ?auto_1730926 ) ( LIFTING ?auto_1730930 ?auto_1730927 ) ( IS-CRATE ?auto_1730927 ) ( ON ?auto_1730918 ?auto_1730917 ) ( ON ?auto_1730919 ?auto_1730918 ) ( ON ?auto_1730921 ?auto_1730919 ) ( ON ?auto_1730920 ?auto_1730921 ) ( ON ?auto_1730922 ?auto_1730920 ) ( ON ?auto_1730923 ?auto_1730922 ) ( ON ?auto_1730924 ?auto_1730923 ) ( ON ?auto_1730925 ?auto_1730924 ) ( ON ?auto_1730926 ?auto_1730925 ) ( not ( = ?auto_1730917 ?auto_1730918 ) ) ( not ( = ?auto_1730917 ?auto_1730919 ) ) ( not ( = ?auto_1730917 ?auto_1730921 ) ) ( not ( = ?auto_1730917 ?auto_1730920 ) ) ( not ( = ?auto_1730917 ?auto_1730922 ) ) ( not ( = ?auto_1730917 ?auto_1730923 ) ) ( not ( = ?auto_1730917 ?auto_1730924 ) ) ( not ( = ?auto_1730917 ?auto_1730925 ) ) ( not ( = ?auto_1730917 ?auto_1730926 ) ) ( not ( = ?auto_1730917 ?auto_1730927 ) ) ( not ( = ?auto_1730917 ?auto_1730928 ) ) ( not ( = ?auto_1730917 ?auto_1730933 ) ) ( not ( = ?auto_1730918 ?auto_1730919 ) ) ( not ( = ?auto_1730918 ?auto_1730921 ) ) ( not ( = ?auto_1730918 ?auto_1730920 ) ) ( not ( = ?auto_1730918 ?auto_1730922 ) ) ( not ( = ?auto_1730918 ?auto_1730923 ) ) ( not ( = ?auto_1730918 ?auto_1730924 ) ) ( not ( = ?auto_1730918 ?auto_1730925 ) ) ( not ( = ?auto_1730918 ?auto_1730926 ) ) ( not ( = ?auto_1730918 ?auto_1730927 ) ) ( not ( = ?auto_1730918 ?auto_1730928 ) ) ( not ( = ?auto_1730918 ?auto_1730933 ) ) ( not ( = ?auto_1730919 ?auto_1730921 ) ) ( not ( = ?auto_1730919 ?auto_1730920 ) ) ( not ( = ?auto_1730919 ?auto_1730922 ) ) ( not ( = ?auto_1730919 ?auto_1730923 ) ) ( not ( = ?auto_1730919 ?auto_1730924 ) ) ( not ( = ?auto_1730919 ?auto_1730925 ) ) ( not ( = ?auto_1730919 ?auto_1730926 ) ) ( not ( = ?auto_1730919 ?auto_1730927 ) ) ( not ( = ?auto_1730919 ?auto_1730928 ) ) ( not ( = ?auto_1730919 ?auto_1730933 ) ) ( not ( = ?auto_1730921 ?auto_1730920 ) ) ( not ( = ?auto_1730921 ?auto_1730922 ) ) ( not ( = ?auto_1730921 ?auto_1730923 ) ) ( not ( = ?auto_1730921 ?auto_1730924 ) ) ( not ( = ?auto_1730921 ?auto_1730925 ) ) ( not ( = ?auto_1730921 ?auto_1730926 ) ) ( not ( = ?auto_1730921 ?auto_1730927 ) ) ( not ( = ?auto_1730921 ?auto_1730928 ) ) ( not ( = ?auto_1730921 ?auto_1730933 ) ) ( not ( = ?auto_1730920 ?auto_1730922 ) ) ( not ( = ?auto_1730920 ?auto_1730923 ) ) ( not ( = ?auto_1730920 ?auto_1730924 ) ) ( not ( = ?auto_1730920 ?auto_1730925 ) ) ( not ( = ?auto_1730920 ?auto_1730926 ) ) ( not ( = ?auto_1730920 ?auto_1730927 ) ) ( not ( = ?auto_1730920 ?auto_1730928 ) ) ( not ( = ?auto_1730920 ?auto_1730933 ) ) ( not ( = ?auto_1730922 ?auto_1730923 ) ) ( not ( = ?auto_1730922 ?auto_1730924 ) ) ( not ( = ?auto_1730922 ?auto_1730925 ) ) ( not ( = ?auto_1730922 ?auto_1730926 ) ) ( not ( = ?auto_1730922 ?auto_1730927 ) ) ( not ( = ?auto_1730922 ?auto_1730928 ) ) ( not ( = ?auto_1730922 ?auto_1730933 ) ) ( not ( = ?auto_1730923 ?auto_1730924 ) ) ( not ( = ?auto_1730923 ?auto_1730925 ) ) ( not ( = ?auto_1730923 ?auto_1730926 ) ) ( not ( = ?auto_1730923 ?auto_1730927 ) ) ( not ( = ?auto_1730923 ?auto_1730928 ) ) ( not ( = ?auto_1730923 ?auto_1730933 ) ) ( not ( = ?auto_1730924 ?auto_1730925 ) ) ( not ( = ?auto_1730924 ?auto_1730926 ) ) ( not ( = ?auto_1730924 ?auto_1730927 ) ) ( not ( = ?auto_1730924 ?auto_1730928 ) ) ( not ( = ?auto_1730924 ?auto_1730933 ) ) ( not ( = ?auto_1730925 ?auto_1730926 ) ) ( not ( = ?auto_1730925 ?auto_1730927 ) ) ( not ( = ?auto_1730925 ?auto_1730928 ) ) ( not ( = ?auto_1730925 ?auto_1730933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730926 ?auto_1730927 ?auto_1730928 )
      ( MAKE-11CRATE-VERIFY ?auto_1730917 ?auto_1730918 ?auto_1730919 ?auto_1730921 ?auto_1730920 ?auto_1730922 ?auto_1730923 ?auto_1730924 ?auto_1730925 ?auto_1730926 ?auto_1730927 ?auto_1730928 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731061 - SURFACE
      ?auto_1731062 - SURFACE
      ?auto_1731063 - SURFACE
      ?auto_1731065 - SURFACE
      ?auto_1731064 - SURFACE
      ?auto_1731066 - SURFACE
      ?auto_1731067 - SURFACE
      ?auto_1731068 - SURFACE
      ?auto_1731069 - SURFACE
      ?auto_1731070 - SURFACE
      ?auto_1731071 - SURFACE
      ?auto_1731072 - SURFACE
    )
    :vars
    (
      ?auto_1731073 - HOIST
      ?auto_1731076 - PLACE
      ?auto_1731074 - PLACE
      ?auto_1731078 - HOIST
      ?auto_1731077 - SURFACE
      ?auto_1731075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731073 ?auto_1731076 ) ( IS-CRATE ?auto_1731072 ) ( not ( = ?auto_1731071 ?auto_1731072 ) ) ( not ( = ?auto_1731070 ?auto_1731071 ) ) ( not ( = ?auto_1731070 ?auto_1731072 ) ) ( not ( = ?auto_1731074 ?auto_1731076 ) ) ( HOIST-AT ?auto_1731078 ?auto_1731074 ) ( not ( = ?auto_1731073 ?auto_1731078 ) ) ( AVAILABLE ?auto_1731078 ) ( SURFACE-AT ?auto_1731072 ?auto_1731074 ) ( ON ?auto_1731072 ?auto_1731077 ) ( CLEAR ?auto_1731072 ) ( not ( = ?auto_1731071 ?auto_1731077 ) ) ( not ( = ?auto_1731072 ?auto_1731077 ) ) ( not ( = ?auto_1731070 ?auto_1731077 ) ) ( TRUCK-AT ?auto_1731075 ?auto_1731076 ) ( SURFACE-AT ?auto_1731070 ?auto_1731076 ) ( CLEAR ?auto_1731070 ) ( IS-CRATE ?auto_1731071 ) ( AVAILABLE ?auto_1731073 ) ( IN ?auto_1731071 ?auto_1731075 ) ( ON ?auto_1731062 ?auto_1731061 ) ( ON ?auto_1731063 ?auto_1731062 ) ( ON ?auto_1731065 ?auto_1731063 ) ( ON ?auto_1731064 ?auto_1731065 ) ( ON ?auto_1731066 ?auto_1731064 ) ( ON ?auto_1731067 ?auto_1731066 ) ( ON ?auto_1731068 ?auto_1731067 ) ( ON ?auto_1731069 ?auto_1731068 ) ( ON ?auto_1731070 ?auto_1731069 ) ( not ( = ?auto_1731061 ?auto_1731062 ) ) ( not ( = ?auto_1731061 ?auto_1731063 ) ) ( not ( = ?auto_1731061 ?auto_1731065 ) ) ( not ( = ?auto_1731061 ?auto_1731064 ) ) ( not ( = ?auto_1731061 ?auto_1731066 ) ) ( not ( = ?auto_1731061 ?auto_1731067 ) ) ( not ( = ?auto_1731061 ?auto_1731068 ) ) ( not ( = ?auto_1731061 ?auto_1731069 ) ) ( not ( = ?auto_1731061 ?auto_1731070 ) ) ( not ( = ?auto_1731061 ?auto_1731071 ) ) ( not ( = ?auto_1731061 ?auto_1731072 ) ) ( not ( = ?auto_1731061 ?auto_1731077 ) ) ( not ( = ?auto_1731062 ?auto_1731063 ) ) ( not ( = ?auto_1731062 ?auto_1731065 ) ) ( not ( = ?auto_1731062 ?auto_1731064 ) ) ( not ( = ?auto_1731062 ?auto_1731066 ) ) ( not ( = ?auto_1731062 ?auto_1731067 ) ) ( not ( = ?auto_1731062 ?auto_1731068 ) ) ( not ( = ?auto_1731062 ?auto_1731069 ) ) ( not ( = ?auto_1731062 ?auto_1731070 ) ) ( not ( = ?auto_1731062 ?auto_1731071 ) ) ( not ( = ?auto_1731062 ?auto_1731072 ) ) ( not ( = ?auto_1731062 ?auto_1731077 ) ) ( not ( = ?auto_1731063 ?auto_1731065 ) ) ( not ( = ?auto_1731063 ?auto_1731064 ) ) ( not ( = ?auto_1731063 ?auto_1731066 ) ) ( not ( = ?auto_1731063 ?auto_1731067 ) ) ( not ( = ?auto_1731063 ?auto_1731068 ) ) ( not ( = ?auto_1731063 ?auto_1731069 ) ) ( not ( = ?auto_1731063 ?auto_1731070 ) ) ( not ( = ?auto_1731063 ?auto_1731071 ) ) ( not ( = ?auto_1731063 ?auto_1731072 ) ) ( not ( = ?auto_1731063 ?auto_1731077 ) ) ( not ( = ?auto_1731065 ?auto_1731064 ) ) ( not ( = ?auto_1731065 ?auto_1731066 ) ) ( not ( = ?auto_1731065 ?auto_1731067 ) ) ( not ( = ?auto_1731065 ?auto_1731068 ) ) ( not ( = ?auto_1731065 ?auto_1731069 ) ) ( not ( = ?auto_1731065 ?auto_1731070 ) ) ( not ( = ?auto_1731065 ?auto_1731071 ) ) ( not ( = ?auto_1731065 ?auto_1731072 ) ) ( not ( = ?auto_1731065 ?auto_1731077 ) ) ( not ( = ?auto_1731064 ?auto_1731066 ) ) ( not ( = ?auto_1731064 ?auto_1731067 ) ) ( not ( = ?auto_1731064 ?auto_1731068 ) ) ( not ( = ?auto_1731064 ?auto_1731069 ) ) ( not ( = ?auto_1731064 ?auto_1731070 ) ) ( not ( = ?auto_1731064 ?auto_1731071 ) ) ( not ( = ?auto_1731064 ?auto_1731072 ) ) ( not ( = ?auto_1731064 ?auto_1731077 ) ) ( not ( = ?auto_1731066 ?auto_1731067 ) ) ( not ( = ?auto_1731066 ?auto_1731068 ) ) ( not ( = ?auto_1731066 ?auto_1731069 ) ) ( not ( = ?auto_1731066 ?auto_1731070 ) ) ( not ( = ?auto_1731066 ?auto_1731071 ) ) ( not ( = ?auto_1731066 ?auto_1731072 ) ) ( not ( = ?auto_1731066 ?auto_1731077 ) ) ( not ( = ?auto_1731067 ?auto_1731068 ) ) ( not ( = ?auto_1731067 ?auto_1731069 ) ) ( not ( = ?auto_1731067 ?auto_1731070 ) ) ( not ( = ?auto_1731067 ?auto_1731071 ) ) ( not ( = ?auto_1731067 ?auto_1731072 ) ) ( not ( = ?auto_1731067 ?auto_1731077 ) ) ( not ( = ?auto_1731068 ?auto_1731069 ) ) ( not ( = ?auto_1731068 ?auto_1731070 ) ) ( not ( = ?auto_1731068 ?auto_1731071 ) ) ( not ( = ?auto_1731068 ?auto_1731072 ) ) ( not ( = ?auto_1731068 ?auto_1731077 ) ) ( not ( = ?auto_1731069 ?auto_1731070 ) ) ( not ( = ?auto_1731069 ?auto_1731071 ) ) ( not ( = ?auto_1731069 ?auto_1731072 ) ) ( not ( = ?auto_1731069 ?auto_1731077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731070 ?auto_1731071 ?auto_1731072 )
      ( MAKE-11CRATE-VERIFY ?auto_1731061 ?auto_1731062 ?auto_1731063 ?auto_1731065 ?auto_1731064 ?auto_1731066 ?auto_1731067 ?auto_1731068 ?auto_1731069 ?auto_1731070 ?auto_1731071 ?auto_1731072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1737798 - SURFACE
      ?auto_1737799 - SURFACE
    )
    :vars
    (
      ?auto_1737802 - HOIST
      ?auto_1737803 - PLACE
      ?auto_1737805 - SURFACE
      ?auto_1737801 - TRUCK
      ?auto_1737806 - PLACE
      ?auto_1737804 - HOIST
      ?auto_1737800 - SURFACE
      ?auto_1737807 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1737802 ?auto_1737803 ) ( SURFACE-AT ?auto_1737798 ?auto_1737803 ) ( CLEAR ?auto_1737798 ) ( IS-CRATE ?auto_1737799 ) ( not ( = ?auto_1737798 ?auto_1737799 ) ) ( AVAILABLE ?auto_1737802 ) ( ON ?auto_1737798 ?auto_1737805 ) ( not ( = ?auto_1737805 ?auto_1737798 ) ) ( not ( = ?auto_1737805 ?auto_1737799 ) ) ( TRUCK-AT ?auto_1737801 ?auto_1737806 ) ( not ( = ?auto_1737806 ?auto_1737803 ) ) ( HOIST-AT ?auto_1737804 ?auto_1737806 ) ( not ( = ?auto_1737802 ?auto_1737804 ) ) ( SURFACE-AT ?auto_1737799 ?auto_1737806 ) ( ON ?auto_1737799 ?auto_1737800 ) ( CLEAR ?auto_1737799 ) ( not ( = ?auto_1737798 ?auto_1737800 ) ) ( not ( = ?auto_1737799 ?auto_1737800 ) ) ( not ( = ?auto_1737805 ?auto_1737800 ) ) ( LIFTING ?auto_1737804 ?auto_1737807 ) ( IS-CRATE ?auto_1737807 ) ( not ( = ?auto_1737798 ?auto_1737807 ) ) ( not ( = ?auto_1737799 ?auto_1737807 ) ) ( not ( = ?auto_1737805 ?auto_1737807 ) ) ( not ( = ?auto_1737800 ?auto_1737807 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1737804 ?auto_1737807 ?auto_1737801 ?auto_1737806 )
      ( MAKE-1CRATE ?auto_1737798 ?auto_1737799 )
      ( MAKE-1CRATE-VERIFY ?auto_1737798 ?auto_1737799 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1740336 - SURFACE
      ?auto_1740337 - SURFACE
      ?auto_1740338 - SURFACE
      ?auto_1740340 - SURFACE
      ?auto_1740339 - SURFACE
      ?auto_1740341 - SURFACE
      ?auto_1740342 - SURFACE
      ?auto_1740343 - SURFACE
      ?auto_1740344 - SURFACE
      ?auto_1740345 - SURFACE
      ?auto_1740346 - SURFACE
      ?auto_1740347 - SURFACE
      ?auto_1740348 - SURFACE
    )
    :vars
    (
      ?auto_1740349 - HOIST
      ?auto_1740350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1740349 ?auto_1740350 ) ( SURFACE-AT ?auto_1740347 ?auto_1740350 ) ( CLEAR ?auto_1740347 ) ( LIFTING ?auto_1740349 ?auto_1740348 ) ( IS-CRATE ?auto_1740348 ) ( not ( = ?auto_1740347 ?auto_1740348 ) ) ( ON ?auto_1740337 ?auto_1740336 ) ( ON ?auto_1740338 ?auto_1740337 ) ( ON ?auto_1740340 ?auto_1740338 ) ( ON ?auto_1740339 ?auto_1740340 ) ( ON ?auto_1740341 ?auto_1740339 ) ( ON ?auto_1740342 ?auto_1740341 ) ( ON ?auto_1740343 ?auto_1740342 ) ( ON ?auto_1740344 ?auto_1740343 ) ( ON ?auto_1740345 ?auto_1740344 ) ( ON ?auto_1740346 ?auto_1740345 ) ( ON ?auto_1740347 ?auto_1740346 ) ( not ( = ?auto_1740336 ?auto_1740337 ) ) ( not ( = ?auto_1740336 ?auto_1740338 ) ) ( not ( = ?auto_1740336 ?auto_1740340 ) ) ( not ( = ?auto_1740336 ?auto_1740339 ) ) ( not ( = ?auto_1740336 ?auto_1740341 ) ) ( not ( = ?auto_1740336 ?auto_1740342 ) ) ( not ( = ?auto_1740336 ?auto_1740343 ) ) ( not ( = ?auto_1740336 ?auto_1740344 ) ) ( not ( = ?auto_1740336 ?auto_1740345 ) ) ( not ( = ?auto_1740336 ?auto_1740346 ) ) ( not ( = ?auto_1740336 ?auto_1740347 ) ) ( not ( = ?auto_1740336 ?auto_1740348 ) ) ( not ( = ?auto_1740337 ?auto_1740338 ) ) ( not ( = ?auto_1740337 ?auto_1740340 ) ) ( not ( = ?auto_1740337 ?auto_1740339 ) ) ( not ( = ?auto_1740337 ?auto_1740341 ) ) ( not ( = ?auto_1740337 ?auto_1740342 ) ) ( not ( = ?auto_1740337 ?auto_1740343 ) ) ( not ( = ?auto_1740337 ?auto_1740344 ) ) ( not ( = ?auto_1740337 ?auto_1740345 ) ) ( not ( = ?auto_1740337 ?auto_1740346 ) ) ( not ( = ?auto_1740337 ?auto_1740347 ) ) ( not ( = ?auto_1740337 ?auto_1740348 ) ) ( not ( = ?auto_1740338 ?auto_1740340 ) ) ( not ( = ?auto_1740338 ?auto_1740339 ) ) ( not ( = ?auto_1740338 ?auto_1740341 ) ) ( not ( = ?auto_1740338 ?auto_1740342 ) ) ( not ( = ?auto_1740338 ?auto_1740343 ) ) ( not ( = ?auto_1740338 ?auto_1740344 ) ) ( not ( = ?auto_1740338 ?auto_1740345 ) ) ( not ( = ?auto_1740338 ?auto_1740346 ) ) ( not ( = ?auto_1740338 ?auto_1740347 ) ) ( not ( = ?auto_1740338 ?auto_1740348 ) ) ( not ( = ?auto_1740340 ?auto_1740339 ) ) ( not ( = ?auto_1740340 ?auto_1740341 ) ) ( not ( = ?auto_1740340 ?auto_1740342 ) ) ( not ( = ?auto_1740340 ?auto_1740343 ) ) ( not ( = ?auto_1740340 ?auto_1740344 ) ) ( not ( = ?auto_1740340 ?auto_1740345 ) ) ( not ( = ?auto_1740340 ?auto_1740346 ) ) ( not ( = ?auto_1740340 ?auto_1740347 ) ) ( not ( = ?auto_1740340 ?auto_1740348 ) ) ( not ( = ?auto_1740339 ?auto_1740341 ) ) ( not ( = ?auto_1740339 ?auto_1740342 ) ) ( not ( = ?auto_1740339 ?auto_1740343 ) ) ( not ( = ?auto_1740339 ?auto_1740344 ) ) ( not ( = ?auto_1740339 ?auto_1740345 ) ) ( not ( = ?auto_1740339 ?auto_1740346 ) ) ( not ( = ?auto_1740339 ?auto_1740347 ) ) ( not ( = ?auto_1740339 ?auto_1740348 ) ) ( not ( = ?auto_1740341 ?auto_1740342 ) ) ( not ( = ?auto_1740341 ?auto_1740343 ) ) ( not ( = ?auto_1740341 ?auto_1740344 ) ) ( not ( = ?auto_1740341 ?auto_1740345 ) ) ( not ( = ?auto_1740341 ?auto_1740346 ) ) ( not ( = ?auto_1740341 ?auto_1740347 ) ) ( not ( = ?auto_1740341 ?auto_1740348 ) ) ( not ( = ?auto_1740342 ?auto_1740343 ) ) ( not ( = ?auto_1740342 ?auto_1740344 ) ) ( not ( = ?auto_1740342 ?auto_1740345 ) ) ( not ( = ?auto_1740342 ?auto_1740346 ) ) ( not ( = ?auto_1740342 ?auto_1740347 ) ) ( not ( = ?auto_1740342 ?auto_1740348 ) ) ( not ( = ?auto_1740343 ?auto_1740344 ) ) ( not ( = ?auto_1740343 ?auto_1740345 ) ) ( not ( = ?auto_1740343 ?auto_1740346 ) ) ( not ( = ?auto_1740343 ?auto_1740347 ) ) ( not ( = ?auto_1740343 ?auto_1740348 ) ) ( not ( = ?auto_1740344 ?auto_1740345 ) ) ( not ( = ?auto_1740344 ?auto_1740346 ) ) ( not ( = ?auto_1740344 ?auto_1740347 ) ) ( not ( = ?auto_1740344 ?auto_1740348 ) ) ( not ( = ?auto_1740345 ?auto_1740346 ) ) ( not ( = ?auto_1740345 ?auto_1740347 ) ) ( not ( = ?auto_1740345 ?auto_1740348 ) ) ( not ( = ?auto_1740346 ?auto_1740347 ) ) ( not ( = ?auto_1740346 ?auto_1740348 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1740347 ?auto_1740348 )
      ( MAKE-12CRATE-VERIFY ?auto_1740336 ?auto_1740337 ?auto_1740338 ?auto_1740340 ?auto_1740339 ?auto_1740341 ?auto_1740342 ?auto_1740343 ?auto_1740344 ?auto_1740345 ?auto_1740346 ?auto_1740347 ?auto_1740348 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1740461 - SURFACE
      ?auto_1740462 - SURFACE
      ?auto_1740463 - SURFACE
      ?auto_1740465 - SURFACE
      ?auto_1740464 - SURFACE
      ?auto_1740466 - SURFACE
      ?auto_1740467 - SURFACE
      ?auto_1740468 - SURFACE
      ?auto_1740469 - SURFACE
      ?auto_1740470 - SURFACE
      ?auto_1740471 - SURFACE
      ?auto_1740472 - SURFACE
      ?auto_1740473 - SURFACE
    )
    :vars
    (
      ?auto_1740475 - HOIST
      ?auto_1740476 - PLACE
      ?auto_1740474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1740475 ?auto_1740476 ) ( SURFACE-AT ?auto_1740472 ?auto_1740476 ) ( CLEAR ?auto_1740472 ) ( IS-CRATE ?auto_1740473 ) ( not ( = ?auto_1740472 ?auto_1740473 ) ) ( TRUCK-AT ?auto_1740474 ?auto_1740476 ) ( AVAILABLE ?auto_1740475 ) ( IN ?auto_1740473 ?auto_1740474 ) ( ON ?auto_1740472 ?auto_1740471 ) ( not ( = ?auto_1740471 ?auto_1740472 ) ) ( not ( = ?auto_1740471 ?auto_1740473 ) ) ( ON ?auto_1740462 ?auto_1740461 ) ( ON ?auto_1740463 ?auto_1740462 ) ( ON ?auto_1740465 ?auto_1740463 ) ( ON ?auto_1740464 ?auto_1740465 ) ( ON ?auto_1740466 ?auto_1740464 ) ( ON ?auto_1740467 ?auto_1740466 ) ( ON ?auto_1740468 ?auto_1740467 ) ( ON ?auto_1740469 ?auto_1740468 ) ( ON ?auto_1740470 ?auto_1740469 ) ( ON ?auto_1740471 ?auto_1740470 ) ( not ( = ?auto_1740461 ?auto_1740462 ) ) ( not ( = ?auto_1740461 ?auto_1740463 ) ) ( not ( = ?auto_1740461 ?auto_1740465 ) ) ( not ( = ?auto_1740461 ?auto_1740464 ) ) ( not ( = ?auto_1740461 ?auto_1740466 ) ) ( not ( = ?auto_1740461 ?auto_1740467 ) ) ( not ( = ?auto_1740461 ?auto_1740468 ) ) ( not ( = ?auto_1740461 ?auto_1740469 ) ) ( not ( = ?auto_1740461 ?auto_1740470 ) ) ( not ( = ?auto_1740461 ?auto_1740471 ) ) ( not ( = ?auto_1740461 ?auto_1740472 ) ) ( not ( = ?auto_1740461 ?auto_1740473 ) ) ( not ( = ?auto_1740462 ?auto_1740463 ) ) ( not ( = ?auto_1740462 ?auto_1740465 ) ) ( not ( = ?auto_1740462 ?auto_1740464 ) ) ( not ( = ?auto_1740462 ?auto_1740466 ) ) ( not ( = ?auto_1740462 ?auto_1740467 ) ) ( not ( = ?auto_1740462 ?auto_1740468 ) ) ( not ( = ?auto_1740462 ?auto_1740469 ) ) ( not ( = ?auto_1740462 ?auto_1740470 ) ) ( not ( = ?auto_1740462 ?auto_1740471 ) ) ( not ( = ?auto_1740462 ?auto_1740472 ) ) ( not ( = ?auto_1740462 ?auto_1740473 ) ) ( not ( = ?auto_1740463 ?auto_1740465 ) ) ( not ( = ?auto_1740463 ?auto_1740464 ) ) ( not ( = ?auto_1740463 ?auto_1740466 ) ) ( not ( = ?auto_1740463 ?auto_1740467 ) ) ( not ( = ?auto_1740463 ?auto_1740468 ) ) ( not ( = ?auto_1740463 ?auto_1740469 ) ) ( not ( = ?auto_1740463 ?auto_1740470 ) ) ( not ( = ?auto_1740463 ?auto_1740471 ) ) ( not ( = ?auto_1740463 ?auto_1740472 ) ) ( not ( = ?auto_1740463 ?auto_1740473 ) ) ( not ( = ?auto_1740465 ?auto_1740464 ) ) ( not ( = ?auto_1740465 ?auto_1740466 ) ) ( not ( = ?auto_1740465 ?auto_1740467 ) ) ( not ( = ?auto_1740465 ?auto_1740468 ) ) ( not ( = ?auto_1740465 ?auto_1740469 ) ) ( not ( = ?auto_1740465 ?auto_1740470 ) ) ( not ( = ?auto_1740465 ?auto_1740471 ) ) ( not ( = ?auto_1740465 ?auto_1740472 ) ) ( not ( = ?auto_1740465 ?auto_1740473 ) ) ( not ( = ?auto_1740464 ?auto_1740466 ) ) ( not ( = ?auto_1740464 ?auto_1740467 ) ) ( not ( = ?auto_1740464 ?auto_1740468 ) ) ( not ( = ?auto_1740464 ?auto_1740469 ) ) ( not ( = ?auto_1740464 ?auto_1740470 ) ) ( not ( = ?auto_1740464 ?auto_1740471 ) ) ( not ( = ?auto_1740464 ?auto_1740472 ) ) ( not ( = ?auto_1740464 ?auto_1740473 ) ) ( not ( = ?auto_1740466 ?auto_1740467 ) ) ( not ( = ?auto_1740466 ?auto_1740468 ) ) ( not ( = ?auto_1740466 ?auto_1740469 ) ) ( not ( = ?auto_1740466 ?auto_1740470 ) ) ( not ( = ?auto_1740466 ?auto_1740471 ) ) ( not ( = ?auto_1740466 ?auto_1740472 ) ) ( not ( = ?auto_1740466 ?auto_1740473 ) ) ( not ( = ?auto_1740467 ?auto_1740468 ) ) ( not ( = ?auto_1740467 ?auto_1740469 ) ) ( not ( = ?auto_1740467 ?auto_1740470 ) ) ( not ( = ?auto_1740467 ?auto_1740471 ) ) ( not ( = ?auto_1740467 ?auto_1740472 ) ) ( not ( = ?auto_1740467 ?auto_1740473 ) ) ( not ( = ?auto_1740468 ?auto_1740469 ) ) ( not ( = ?auto_1740468 ?auto_1740470 ) ) ( not ( = ?auto_1740468 ?auto_1740471 ) ) ( not ( = ?auto_1740468 ?auto_1740472 ) ) ( not ( = ?auto_1740468 ?auto_1740473 ) ) ( not ( = ?auto_1740469 ?auto_1740470 ) ) ( not ( = ?auto_1740469 ?auto_1740471 ) ) ( not ( = ?auto_1740469 ?auto_1740472 ) ) ( not ( = ?auto_1740469 ?auto_1740473 ) ) ( not ( = ?auto_1740470 ?auto_1740471 ) ) ( not ( = ?auto_1740470 ?auto_1740472 ) ) ( not ( = ?auto_1740470 ?auto_1740473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1740471 ?auto_1740472 ?auto_1740473 )
      ( MAKE-12CRATE-VERIFY ?auto_1740461 ?auto_1740462 ?auto_1740463 ?auto_1740465 ?auto_1740464 ?auto_1740466 ?auto_1740467 ?auto_1740468 ?auto_1740469 ?auto_1740470 ?auto_1740471 ?auto_1740472 ?auto_1740473 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1740599 - SURFACE
      ?auto_1740600 - SURFACE
      ?auto_1740601 - SURFACE
      ?auto_1740603 - SURFACE
      ?auto_1740602 - SURFACE
      ?auto_1740604 - SURFACE
      ?auto_1740605 - SURFACE
      ?auto_1740606 - SURFACE
      ?auto_1740607 - SURFACE
      ?auto_1740608 - SURFACE
      ?auto_1740609 - SURFACE
      ?auto_1740610 - SURFACE
      ?auto_1740611 - SURFACE
    )
    :vars
    (
      ?auto_1740613 - HOIST
      ?auto_1740614 - PLACE
      ?auto_1740615 - TRUCK
      ?auto_1740612 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1740613 ?auto_1740614 ) ( SURFACE-AT ?auto_1740610 ?auto_1740614 ) ( CLEAR ?auto_1740610 ) ( IS-CRATE ?auto_1740611 ) ( not ( = ?auto_1740610 ?auto_1740611 ) ) ( AVAILABLE ?auto_1740613 ) ( IN ?auto_1740611 ?auto_1740615 ) ( ON ?auto_1740610 ?auto_1740609 ) ( not ( = ?auto_1740609 ?auto_1740610 ) ) ( not ( = ?auto_1740609 ?auto_1740611 ) ) ( TRUCK-AT ?auto_1740615 ?auto_1740612 ) ( not ( = ?auto_1740612 ?auto_1740614 ) ) ( ON ?auto_1740600 ?auto_1740599 ) ( ON ?auto_1740601 ?auto_1740600 ) ( ON ?auto_1740603 ?auto_1740601 ) ( ON ?auto_1740602 ?auto_1740603 ) ( ON ?auto_1740604 ?auto_1740602 ) ( ON ?auto_1740605 ?auto_1740604 ) ( ON ?auto_1740606 ?auto_1740605 ) ( ON ?auto_1740607 ?auto_1740606 ) ( ON ?auto_1740608 ?auto_1740607 ) ( ON ?auto_1740609 ?auto_1740608 ) ( not ( = ?auto_1740599 ?auto_1740600 ) ) ( not ( = ?auto_1740599 ?auto_1740601 ) ) ( not ( = ?auto_1740599 ?auto_1740603 ) ) ( not ( = ?auto_1740599 ?auto_1740602 ) ) ( not ( = ?auto_1740599 ?auto_1740604 ) ) ( not ( = ?auto_1740599 ?auto_1740605 ) ) ( not ( = ?auto_1740599 ?auto_1740606 ) ) ( not ( = ?auto_1740599 ?auto_1740607 ) ) ( not ( = ?auto_1740599 ?auto_1740608 ) ) ( not ( = ?auto_1740599 ?auto_1740609 ) ) ( not ( = ?auto_1740599 ?auto_1740610 ) ) ( not ( = ?auto_1740599 ?auto_1740611 ) ) ( not ( = ?auto_1740600 ?auto_1740601 ) ) ( not ( = ?auto_1740600 ?auto_1740603 ) ) ( not ( = ?auto_1740600 ?auto_1740602 ) ) ( not ( = ?auto_1740600 ?auto_1740604 ) ) ( not ( = ?auto_1740600 ?auto_1740605 ) ) ( not ( = ?auto_1740600 ?auto_1740606 ) ) ( not ( = ?auto_1740600 ?auto_1740607 ) ) ( not ( = ?auto_1740600 ?auto_1740608 ) ) ( not ( = ?auto_1740600 ?auto_1740609 ) ) ( not ( = ?auto_1740600 ?auto_1740610 ) ) ( not ( = ?auto_1740600 ?auto_1740611 ) ) ( not ( = ?auto_1740601 ?auto_1740603 ) ) ( not ( = ?auto_1740601 ?auto_1740602 ) ) ( not ( = ?auto_1740601 ?auto_1740604 ) ) ( not ( = ?auto_1740601 ?auto_1740605 ) ) ( not ( = ?auto_1740601 ?auto_1740606 ) ) ( not ( = ?auto_1740601 ?auto_1740607 ) ) ( not ( = ?auto_1740601 ?auto_1740608 ) ) ( not ( = ?auto_1740601 ?auto_1740609 ) ) ( not ( = ?auto_1740601 ?auto_1740610 ) ) ( not ( = ?auto_1740601 ?auto_1740611 ) ) ( not ( = ?auto_1740603 ?auto_1740602 ) ) ( not ( = ?auto_1740603 ?auto_1740604 ) ) ( not ( = ?auto_1740603 ?auto_1740605 ) ) ( not ( = ?auto_1740603 ?auto_1740606 ) ) ( not ( = ?auto_1740603 ?auto_1740607 ) ) ( not ( = ?auto_1740603 ?auto_1740608 ) ) ( not ( = ?auto_1740603 ?auto_1740609 ) ) ( not ( = ?auto_1740603 ?auto_1740610 ) ) ( not ( = ?auto_1740603 ?auto_1740611 ) ) ( not ( = ?auto_1740602 ?auto_1740604 ) ) ( not ( = ?auto_1740602 ?auto_1740605 ) ) ( not ( = ?auto_1740602 ?auto_1740606 ) ) ( not ( = ?auto_1740602 ?auto_1740607 ) ) ( not ( = ?auto_1740602 ?auto_1740608 ) ) ( not ( = ?auto_1740602 ?auto_1740609 ) ) ( not ( = ?auto_1740602 ?auto_1740610 ) ) ( not ( = ?auto_1740602 ?auto_1740611 ) ) ( not ( = ?auto_1740604 ?auto_1740605 ) ) ( not ( = ?auto_1740604 ?auto_1740606 ) ) ( not ( = ?auto_1740604 ?auto_1740607 ) ) ( not ( = ?auto_1740604 ?auto_1740608 ) ) ( not ( = ?auto_1740604 ?auto_1740609 ) ) ( not ( = ?auto_1740604 ?auto_1740610 ) ) ( not ( = ?auto_1740604 ?auto_1740611 ) ) ( not ( = ?auto_1740605 ?auto_1740606 ) ) ( not ( = ?auto_1740605 ?auto_1740607 ) ) ( not ( = ?auto_1740605 ?auto_1740608 ) ) ( not ( = ?auto_1740605 ?auto_1740609 ) ) ( not ( = ?auto_1740605 ?auto_1740610 ) ) ( not ( = ?auto_1740605 ?auto_1740611 ) ) ( not ( = ?auto_1740606 ?auto_1740607 ) ) ( not ( = ?auto_1740606 ?auto_1740608 ) ) ( not ( = ?auto_1740606 ?auto_1740609 ) ) ( not ( = ?auto_1740606 ?auto_1740610 ) ) ( not ( = ?auto_1740606 ?auto_1740611 ) ) ( not ( = ?auto_1740607 ?auto_1740608 ) ) ( not ( = ?auto_1740607 ?auto_1740609 ) ) ( not ( = ?auto_1740607 ?auto_1740610 ) ) ( not ( = ?auto_1740607 ?auto_1740611 ) ) ( not ( = ?auto_1740608 ?auto_1740609 ) ) ( not ( = ?auto_1740608 ?auto_1740610 ) ) ( not ( = ?auto_1740608 ?auto_1740611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1740609 ?auto_1740610 ?auto_1740611 )
      ( MAKE-12CRATE-VERIFY ?auto_1740599 ?auto_1740600 ?auto_1740601 ?auto_1740603 ?auto_1740602 ?auto_1740604 ?auto_1740605 ?auto_1740606 ?auto_1740607 ?auto_1740608 ?auto_1740609 ?auto_1740610 ?auto_1740611 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1740749 - SURFACE
      ?auto_1740750 - SURFACE
      ?auto_1740751 - SURFACE
      ?auto_1740753 - SURFACE
      ?auto_1740752 - SURFACE
      ?auto_1740754 - SURFACE
      ?auto_1740755 - SURFACE
      ?auto_1740756 - SURFACE
      ?auto_1740757 - SURFACE
      ?auto_1740758 - SURFACE
      ?auto_1740759 - SURFACE
      ?auto_1740760 - SURFACE
      ?auto_1740761 - SURFACE
    )
    :vars
    (
      ?auto_1740764 - HOIST
      ?auto_1740765 - PLACE
      ?auto_1740762 - TRUCK
      ?auto_1740763 - PLACE
      ?auto_1740766 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1740764 ?auto_1740765 ) ( SURFACE-AT ?auto_1740760 ?auto_1740765 ) ( CLEAR ?auto_1740760 ) ( IS-CRATE ?auto_1740761 ) ( not ( = ?auto_1740760 ?auto_1740761 ) ) ( AVAILABLE ?auto_1740764 ) ( ON ?auto_1740760 ?auto_1740759 ) ( not ( = ?auto_1740759 ?auto_1740760 ) ) ( not ( = ?auto_1740759 ?auto_1740761 ) ) ( TRUCK-AT ?auto_1740762 ?auto_1740763 ) ( not ( = ?auto_1740763 ?auto_1740765 ) ) ( HOIST-AT ?auto_1740766 ?auto_1740763 ) ( LIFTING ?auto_1740766 ?auto_1740761 ) ( not ( = ?auto_1740764 ?auto_1740766 ) ) ( ON ?auto_1740750 ?auto_1740749 ) ( ON ?auto_1740751 ?auto_1740750 ) ( ON ?auto_1740753 ?auto_1740751 ) ( ON ?auto_1740752 ?auto_1740753 ) ( ON ?auto_1740754 ?auto_1740752 ) ( ON ?auto_1740755 ?auto_1740754 ) ( ON ?auto_1740756 ?auto_1740755 ) ( ON ?auto_1740757 ?auto_1740756 ) ( ON ?auto_1740758 ?auto_1740757 ) ( ON ?auto_1740759 ?auto_1740758 ) ( not ( = ?auto_1740749 ?auto_1740750 ) ) ( not ( = ?auto_1740749 ?auto_1740751 ) ) ( not ( = ?auto_1740749 ?auto_1740753 ) ) ( not ( = ?auto_1740749 ?auto_1740752 ) ) ( not ( = ?auto_1740749 ?auto_1740754 ) ) ( not ( = ?auto_1740749 ?auto_1740755 ) ) ( not ( = ?auto_1740749 ?auto_1740756 ) ) ( not ( = ?auto_1740749 ?auto_1740757 ) ) ( not ( = ?auto_1740749 ?auto_1740758 ) ) ( not ( = ?auto_1740749 ?auto_1740759 ) ) ( not ( = ?auto_1740749 ?auto_1740760 ) ) ( not ( = ?auto_1740749 ?auto_1740761 ) ) ( not ( = ?auto_1740750 ?auto_1740751 ) ) ( not ( = ?auto_1740750 ?auto_1740753 ) ) ( not ( = ?auto_1740750 ?auto_1740752 ) ) ( not ( = ?auto_1740750 ?auto_1740754 ) ) ( not ( = ?auto_1740750 ?auto_1740755 ) ) ( not ( = ?auto_1740750 ?auto_1740756 ) ) ( not ( = ?auto_1740750 ?auto_1740757 ) ) ( not ( = ?auto_1740750 ?auto_1740758 ) ) ( not ( = ?auto_1740750 ?auto_1740759 ) ) ( not ( = ?auto_1740750 ?auto_1740760 ) ) ( not ( = ?auto_1740750 ?auto_1740761 ) ) ( not ( = ?auto_1740751 ?auto_1740753 ) ) ( not ( = ?auto_1740751 ?auto_1740752 ) ) ( not ( = ?auto_1740751 ?auto_1740754 ) ) ( not ( = ?auto_1740751 ?auto_1740755 ) ) ( not ( = ?auto_1740751 ?auto_1740756 ) ) ( not ( = ?auto_1740751 ?auto_1740757 ) ) ( not ( = ?auto_1740751 ?auto_1740758 ) ) ( not ( = ?auto_1740751 ?auto_1740759 ) ) ( not ( = ?auto_1740751 ?auto_1740760 ) ) ( not ( = ?auto_1740751 ?auto_1740761 ) ) ( not ( = ?auto_1740753 ?auto_1740752 ) ) ( not ( = ?auto_1740753 ?auto_1740754 ) ) ( not ( = ?auto_1740753 ?auto_1740755 ) ) ( not ( = ?auto_1740753 ?auto_1740756 ) ) ( not ( = ?auto_1740753 ?auto_1740757 ) ) ( not ( = ?auto_1740753 ?auto_1740758 ) ) ( not ( = ?auto_1740753 ?auto_1740759 ) ) ( not ( = ?auto_1740753 ?auto_1740760 ) ) ( not ( = ?auto_1740753 ?auto_1740761 ) ) ( not ( = ?auto_1740752 ?auto_1740754 ) ) ( not ( = ?auto_1740752 ?auto_1740755 ) ) ( not ( = ?auto_1740752 ?auto_1740756 ) ) ( not ( = ?auto_1740752 ?auto_1740757 ) ) ( not ( = ?auto_1740752 ?auto_1740758 ) ) ( not ( = ?auto_1740752 ?auto_1740759 ) ) ( not ( = ?auto_1740752 ?auto_1740760 ) ) ( not ( = ?auto_1740752 ?auto_1740761 ) ) ( not ( = ?auto_1740754 ?auto_1740755 ) ) ( not ( = ?auto_1740754 ?auto_1740756 ) ) ( not ( = ?auto_1740754 ?auto_1740757 ) ) ( not ( = ?auto_1740754 ?auto_1740758 ) ) ( not ( = ?auto_1740754 ?auto_1740759 ) ) ( not ( = ?auto_1740754 ?auto_1740760 ) ) ( not ( = ?auto_1740754 ?auto_1740761 ) ) ( not ( = ?auto_1740755 ?auto_1740756 ) ) ( not ( = ?auto_1740755 ?auto_1740757 ) ) ( not ( = ?auto_1740755 ?auto_1740758 ) ) ( not ( = ?auto_1740755 ?auto_1740759 ) ) ( not ( = ?auto_1740755 ?auto_1740760 ) ) ( not ( = ?auto_1740755 ?auto_1740761 ) ) ( not ( = ?auto_1740756 ?auto_1740757 ) ) ( not ( = ?auto_1740756 ?auto_1740758 ) ) ( not ( = ?auto_1740756 ?auto_1740759 ) ) ( not ( = ?auto_1740756 ?auto_1740760 ) ) ( not ( = ?auto_1740756 ?auto_1740761 ) ) ( not ( = ?auto_1740757 ?auto_1740758 ) ) ( not ( = ?auto_1740757 ?auto_1740759 ) ) ( not ( = ?auto_1740757 ?auto_1740760 ) ) ( not ( = ?auto_1740757 ?auto_1740761 ) ) ( not ( = ?auto_1740758 ?auto_1740759 ) ) ( not ( = ?auto_1740758 ?auto_1740760 ) ) ( not ( = ?auto_1740758 ?auto_1740761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1740759 ?auto_1740760 ?auto_1740761 )
      ( MAKE-12CRATE-VERIFY ?auto_1740749 ?auto_1740750 ?auto_1740751 ?auto_1740753 ?auto_1740752 ?auto_1740754 ?auto_1740755 ?auto_1740756 ?auto_1740757 ?auto_1740758 ?auto_1740759 ?auto_1740760 ?auto_1740761 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1740911 - SURFACE
      ?auto_1740912 - SURFACE
      ?auto_1740913 - SURFACE
      ?auto_1740915 - SURFACE
      ?auto_1740914 - SURFACE
      ?auto_1740916 - SURFACE
      ?auto_1740917 - SURFACE
      ?auto_1740918 - SURFACE
      ?auto_1740919 - SURFACE
      ?auto_1740920 - SURFACE
      ?auto_1740921 - SURFACE
      ?auto_1740922 - SURFACE
      ?auto_1740923 - SURFACE
    )
    :vars
    (
      ?auto_1740924 - HOIST
      ?auto_1740926 - PLACE
      ?auto_1740929 - TRUCK
      ?auto_1740927 - PLACE
      ?auto_1740925 - HOIST
      ?auto_1740928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1740924 ?auto_1740926 ) ( SURFACE-AT ?auto_1740922 ?auto_1740926 ) ( CLEAR ?auto_1740922 ) ( IS-CRATE ?auto_1740923 ) ( not ( = ?auto_1740922 ?auto_1740923 ) ) ( AVAILABLE ?auto_1740924 ) ( ON ?auto_1740922 ?auto_1740921 ) ( not ( = ?auto_1740921 ?auto_1740922 ) ) ( not ( = ?auto_1740921 ?auto_1740923 ) ) ( TRUCK-AT ?auto_1740929 ?auto_1740927 ) ( not ( = ?auto_1740927 ?auto_1740926 ) ) ( HOIST-AT ?auto_1740925 ?auto_1740927 ) ( not ( = ?auto_1740924 ?auto_1740925 ) ) ( AVAILABLE ?auto_1740925 ) ( SURFACE-AT ?auto_1740923 ?auto_1740927 ) ( ON ?auto_1740923 ?auto_1740928 ) ( CLEAR ?auto_1740923 ) ( not ( = ?auto_1740922 ?auto_1740928 ) ) ( not ( = ?auto_1740923 ?auto_1740928 ) ) ( not ( = ?auto_1740921 ?auto_1740928 ) ) ( ON ?auto_1740912 ?auto_1740911 ) ( ON ?auto_1740913 ?auto_1740912 ) ( ON ?auto_1740915 ?auto_1740913 ) ( ON ?auto_1740914 ?auto_1740915 ) ( ON ?auto_1740916 ?auto_1740914 ) ( ON ?auto_1740917 ?auto_1740916 ) ( ON ?auto_1740918 ?auto_1740917 ) ( ON ?auto_1740919 ?auto_1740918 ) ( ON ?auto_1740920 ?auto_1740919 ) ( ON ?auto_1740921 ?auto_1740920 ) ( not ( = ?auto_1740911 ?auto_1740912 ) ) ( not ( = ?auto_1740911 ?auto_1740913 ) ) ( not ( = ?auto_1740911 ?auto_1740915 ) ) ( not ( = ?auto_1740911 ?auto_1740914 ) ) ( not ( = ?auto_1740911 ?auto_1740916 ) ) ( not ( = ?auto_1740911 ?auto_1740917 ) ) ( not ( = ?auto_1740911 ?auto_1740918 ) ) ( not ( = ?auto_1740911 ?auto_1740919 ) ) ( not ( = ?auto_1740911 ?auto_1740920 ) ) ( not ( = ?auto_1740911 ?auto_1740921 ) ) ( not ( = ?auto_1740911 ?auto_1740922 ) ) ( not ( = ?auto_1740911 ?auto_1740923 ) ) ( not ( = ?auto_1740911 ?auto_1740928 ) ) ( not ( = ?auto_1740912 ?auto_1740913 ) ) ( not ( = ?auto_1740912 ?auto_1740915 ) ) ( not ( = ?auto_1740912 ?auto_1740914 ) ) ( not ( = ?auto_1740912 ?auto_1740916 ) ) ( not ( = ?auto_1740912 ?auto_1740917 ) ) ( not ( = ?auto_1740912 ?auto_1740918 ) ) ( not ( = ?auto_1740912 ?auto_1740919 ) ) ( not ( = ?auto_1740912 ?auto_1740920 ) ) ( not ( = ?auto_1740912 ?auto_1740921 ) ) ( not ( = ?auto_1740912 ?auto_1740922 ) ) ( not ( = ?auto_1740912 ?auto_1740923 ) ) ( not ( = ?auto_1740912 ?auto_1740928 ) ) ( not ( = ?auto_1740913 ?auto_1740915 ) ) ( not ( = ?auto_1740913 ?auto_1740914 ) ) ( not ( = ?auto_1740913 ?auto_1740916 ) ) ( not ( = ?auto_1740913 ?auto_1740917 ) ) ( not ( = ?auto_1740913 ?auto_1740918 ) ) ( not ( = ?auto_1740913 ?auto_1740919 ) ) ( not ( = ?auto_1740913 ?auto_1740920 ) ) ( not ( = ?auto_1740913 ?auto_1740921 ) ) ( not ( = ?auto_1740913 ?auto_1740922 ) ) ( not ( = ?auto_1740913 ?auto_1740923 ) ) ( not ( = ?auto_1740913 ?auto_1740928 ) ) ( not ( = ?auto_1740915 ?auto_1740914 ) ) ( not ( = ?auto_1740915 ?auto_1740916 ) ) ( not ( = ?auto_1740915 ?auto_1740917 ) ) ( not ( = ?auto_1740915 ?auto_1740918 ) ) ( not ( = ?auto_1740915 ?auto_1740919 ) ) ( not ( = ?auto_1740915 ?auto_1740920 ) ) ( not ( = ?auto_1740915 ?auto_1740921 ) ) ( not ( = ?auto_1740915 ?auto_1740922 ) ) ( not ( = ?auto_1740915 ?auto_1740923 ) ) ( not ( = ?auto_1740915 ?auto_1740928 ) ) ( not ( = ?auto_1740914 ?auto_1740916 ) ) ( not ( = ?auto_1740914 ?auto_1740917 ) ) ( not ( = ?auto_1740914 ?auto_1740918 ) ) ( not ( = ?auto_1740914 ?auto_1740919 ) ) ( not ( = ?auto_1740914 ?auto_1740920 ) ) ( not ( = ?auto_1740914 ?auto_1740921 ) ) ( not ( = ?auto_1740914 ?auto_1740922 ) ) ( not ( = ?auto_1740914 ?auto_1740923 ) ) ( not ( = ?auto_1740914 ?auto_1740928 ) ) ( not ( = ?auto_1740916 ?auto_1740917 ) ) ( not ( = ?auto_1740916 ?auto_1740918 ) ) ( not ( = ?auto_1740916 ?auto_1740919 ) ) ( not ( = ?auto_1740916 ?auto_1740920 ) ) ( not ( = ?auto_1740916 ?auto_1740921 ) ) ( not ( = ?auto_1740916 ?auto_1740922 ) ) ( not ( = ?auto_1740916 ?auto_1740923 ) ) ( not ( = ?auto_1740916 ?auto_1740928 ) ) ( not ( = ?auto_1740917 ?auto_1740918 ) ) ( not ( = ?auto_1740917 ?auto_1740919 ) ) ( not ( = ?auto_1740917 ?auto_1740920 ) ) ( not ( = ?auto_1740917 ?auto_1740921 ) ) ( not ( = ?auto_1740917 ?auto_1740922 ) ) ( not ( = ?auto_1740917 ?auto_1740923 ) ) ( not ( = ?auto_1740917 ?auto_1740928 ) ) ( not ( = ?auto_1740918 ?auto_1740919 ) ) ( not ( = ?auto_1740918 ?auto_1740920 ) ) ( not ( = ?auto_1740918 ?auto_1740921 ) ) ( not ( = ?auto_1740918 ?auto_1740922 ) ) ( not ( = ?auto_1740918 ?auto_1740923 ) ) ( not ( = ?auto_1740918 ?auto_1740928 ) ) ( not ( = ?auto_1740919 ?auto_1740920 ) ) ( not ( = ?auto_1740919 ?auto_1740921 ) ) ( not ( = ?auto_1740919 ?auto_1740922 ) ) ( not ( = ?auto_1740919 ?auto_1740923 ) ) ( not ( = ?auto_1740919 ?auto_1740928 ) ) ( not ( = ?auto_1740920 ?auto_1740921 ) ) ( not ( = ?auto_1740920 ?auto_1740922 ) ) ( not ( = ?auto_1740920 ?auto_1740923 ) ) ( not ( = ?auto_1740920 ?auto_1740928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1740921 ?auto_1740922 ?auto_1740923 )
      ( MAKE-12CRATE-VERIFY ?auto_1740911 ?auto_1740912 ?auto_1740913 ?auto_1740915 ?auto_1740914 ?auto_1740916 ?auto_1740917 ?auto_1740918 ?auto_1740919 ?auto_1740920 ?auto_1740921 ?auto_1740922 ?auto_1740923 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741074 - SURFACE
      ?auto_1741075 - SURFACE
      ?auto_1741076 - SURFACE
      ?auto_1741078 - SURFACE
      ?auto_1741077 - SURFACE
      ?auto_1741079 - SURFACE
      ?auto_1741080 - SURFACE
      ?auto_1741081 - SURFACE
      ?auto_1741082 - SURFACE
      ?auto_1741083 - SURFACE
      ?auto_1741084 - SURFACE
      ?auto_1741085 - SURFACE
      ?auto_1741086 - SURFACE
    )
    :vars
    (
      ?auto_1741087 - HOIST
      ?auto_1741091 - PLACE
      ?auto_1741088 - PLACE
      ?auto_1741090 - HOIST
      ?auto_1741089 - SURFACE
      ?auto_1741092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741087 ?auto_1741091 ) ( SURFACE-AT ?auto_1741085 ?auto_1741091 ) ( CLEAR ?auto_1741085 ) ( IS-CRATE ?auto_1741086 ) ( not ( = ?auto_1741085 ?auto_1741086 ) ) ( AVAILABLE ?auto_1741087 ) ( ON ?auto_1741085 ?auto_1741084 ) ( not ( = ?auto_1741084 ?auto_1741085 ) ) ( not ( = ?auto_1741084 ?auto_1741086 ) ) ( not ( = ?auto_1741088 ?auto_1741091 ) ) ( HOIST-AT ?auto_1741090 ?auto_1741088 ) ( not ( = ?auto_1741087 ?auto_1741090 ) ) ( AVAILABLE ?auto_1741090 ) ( SURFACE-AT ?auto_1741086 ?auto_1741088 ) ( ON ?auto_1741086 ?auto_1741089 ) ( CLEAR ?auto_1741086 ) ( not ( = ?auto_1741085 ?auto_1741089 ) ) ( not ( = ?auto_1741086 ?auto_1741089 ) ) ( not ( = ?auto_1741084 ?auto_1741089 ) ) ( TRUCK-AT ?auto_1741092 ?auto_1741091 ) ( ON ?auto_1741075 ?auto_1741074 ) ( ON ?auto_1741076 ?auto_1741075 ) ( ON ?auto_1741078 ?auto_1741076 ) ( ON ?auto_1741077 ?auto_1741078 ) ( ON ?auto_1741079 ?auto_1741077 ) ( ON ?auto_1741080 ?auto_1741079 ) ( ON ?auto_1741081 ?auto_1741080 ) ( ON ?auto_1741082 ?auto_1741081 ) ( ON ?auto_1741083 ?auto_1741082 ) ( ON ?auto_1741084 ?auto_1741083 ) ( not ( = ?auto_1741074 ?auto_1741075 ) ) ( not ( = ?auto_1741074 ?auto_1741076 ) ) ( not ( = ?auto_1741074 ?auto_1741078 ) ) ( not ( = ?auto_1741074 ?auto_1741077 ) ) ( not ( = ?auto_1741074 ?auto_1741079 ) ) ( not ( = ?auto_1741074 ?auto_1741080 ) ) ( not ( = ?auto_1741074 ?auto_1741081 ) ) ( not ( = ?auto_1741074 ?auto_1741082 ) ) ( not ( = ?auto_1741074 ?auto_1741083 ) ) ( not ( = ?auto_1741074 ?auto_1741084 ) ) ( not ( = ?auto_1741074 ?auto_1741085 ) ) ( not ( = ?auto_1741074 ?auto_1741086 ) ) ( not ( = ?auto_1741074 ?auto_1741089 ) ) ( not ( = ?auto_1741075 ?auto_1741076 ) ) ( not ( = ?auto_1741075 ?auto_1741078 ) ) ( not ( = ?auto_1741075 ?auto_1741077 ) ) ( not ( = ?auto_1741075 ?auto_1741079 ) ) ( not ( = ?auto_1741075 ?auto_1741080 ) ) ( not ( = ?auto_1741075 ?auto_1741081 ) ) ( not ( = ?auto_1741075 ?auto_1741082 ) ) ( not ( = ?auto_1741075 ?auto_1741083 ) ) ( not ( = ?auto_1741075 ?auto_1741084 ) ) ( not ( = ?auto_1741075 ?auto_1741085 ) ) ( not ( = ?auto_1741075 ?auto_1741086 ) ) ( not ( = ?auto_1741075 ?auto_1741089 ) ) ( not ( = ?auto_1741076 ?auto_1741078 ) ) ( not ( = ?auto_1741076 ?auto_1741077 ) ) ( not ( = ?auto_1741076 ?auto_1741079 ) ) ( not ( = ?auto_1741076 ?auto_1741080 ) ) ( not ( = ?auto_1741076 ?auto_1741081 ) ) ( not ( = ?auto_1741076 ?auto_1741082 ) ) ( not ( = ?auto_1741076 ?auto_1741083 ) ) ( not ( = ?auto_1741076 ?auto_1741084 ) ) ( not ( = ?auto_1741076 ?auto_1741085 ) ) ( not ( = ?auto_1741076 ?auto_1741086 ) ) ( not ( = ?auto_1741076 ?auto_1741089 ) ) ( not ( = ?auto_1741078 ?auto_1741077 ) ) ( not ( = ?auto_1741078 ?auto_1741079 ) ) ( not ( = ?auto_1741078 ?auto_1741080 ) ) ( not ( = ?auto_1741078 ?auto_1741081 ) ) ( not ( = ?auto_1741078 ?auto_1741082 ) ) ( not ( = ?auto_1741078 ?auto_1741083 ) ) ( not ( = ?auto_1741078 ?auto_1741084 ) ) ( not ( = ?auto_1741078 ?auto_1741085 ) ) ( not ( = ?auto_1741078 ?auto_1741086 ) ) ( not ( = ?auto_1741078 ?auto_1741089 ) ) ( not ( = ?auto_1741077 ?auto_1741079 ) ) ( not ( = ?auto_1741077 ?auto_1741080 ) ) ( not ( = ?auto_1741077 ?auto_1741081 ) ) ( not ( = ?auto_1741077 ?auto_1741082 ) ) ( not ( = ?auto_1741077 ?auto_1741083 ) ) ( not ( = ?auto_1741077 ?auto_1741084 ) ) ( not ( = ?auto_1741077 ?auto_1741085 ) ) ( not ( = ?auto_1741077 ?auto_1741086 ) ) ( not ( = ?auto_1741077 ?auto_1741089 ) ) ( not ( = ?auto_1741079 ?auto_1741080 ) ) ( not ( = ?auto_1741079 ?auto_1741081 ) ) ( not ( = ?auto_1741079 ?auto_1741082 ) ) ( not ( = ?auto_1741079 ?auto_1741083 ) ) ( not ( = ?auto_1741079 ?auto_1741084 ) ) ( not ( = ?auto_1741079 ?auto_1741085 ) ) ( not ( = ?auto_1741079 ?auto_1741086 ) ) ( not ( = ?auto_1741079 ?auto_1741089 ) ) ( not ( = ?auto_1741080 ?auto_1741081 ) ) ( not ( = ?auto_1741080 ?auto_1741082 ) ) ( not ( = ?auto_1741080 ?auto_1741083 ) ) ( not ( = ?auto_1741080 ?auto_1741084 ) ) ( not ( = ?auto_1741080 ?auto_1741085 ) ) ( not ( = ?auto_1741080 ?auto_1741086 ) ) ( not ( = ?auto_1741080 ?auto_1741089 ) ) ( not ( = ?auto_1741081 ?auto_1741082 ) ) ( not ( = ?auto_1741081 ?auto_1741083 ) ) ( not ( = ?auto_1741081 ?auto_1741084 ) ) ( not ( = ?auto_1741081 ?auto_1741085 ) ) ( not ( = ?auto_1741081 ?auto_1741086 ) ) ( not ( = ?auto_1741081 ?auto_1741089 ) ) ( not ( = ?auto_1741082 ?auto_1741083 ) ) ( not ( = ?auto_1741082 ?auto_1741084 ) ) ( not ( = ?auto_1741082 ?auto_1741085 ) ) ( not ( = ?auto_1741082 ?auto_1741086 ) ) ( not ( = ?auto_1741082 ?auto_1741089 ) ) ( not ( = ?auto_1741083 ?auto_1741084 ) ) ( not ( = ?auto_1741083 ?auto_1741085 ) ) ( not ( = ?auto_1741083 ?auto_1741086 ) ) ( not ( = ?auto_1741083 ?auto_1741089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741084 ?auto_1741085 ?auto_1741086 )
      ( MAKE-12CRATE-VERIFY ?auto_1741074 ?auto_1741075 ?auto_1741076 ?auto_1741078 ?auto_1741077 ?auto_1741079 ?auto_1741080 ?auto_1741081 ?auto_1741082 ?auto_1741083 ?auto_1741084 ?auto_1741085 ?auto_1741086 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741237 - SURFACE
      ?auto_1741238 - SURFACE
      ?auto_1741239 - SURFACE
      ?auto_1741241 - SURFACE
      ?auto_1741240 - SURFACE
      ?auto_1741242 - SURFACE
      ?auto_1741243 - SURFACE
      ?auto_1741244 - SURFACE
      ?auto_1741245 - SURFACE
      ?auto_1741246 - SURFACE
      ?auto_1741247 - SURFACE
      ?auto_1741248 - SURFACE
      ?auto_1741249 - SURFACE
    )
    :vars
    (
      ?auto_1741250 - HOIST
      ?auto_1741251 - PLACE
      ?auto_1741253 - PLACE
      ?auto_1741252 - HOIST
      ?auto_1741254 - SURFACE
      ?auto_1741255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741250 ?auto_1741251 ) ( IS-CRATE ?auto_1741249 ) ( not ( = ?auto_1741248 ?auto_1741249 ) ) ( not ( = ?auto_1741247 ?auto_1741248 ) ) ( not ( = ?auto_1741247 ?auto_1741249 ) ) ( not ( = ?auto_1741253 ?auto_1741251 ) ) ( HOIST-AT ?auto_1741252 ?auto_1741253 ) ( not ( = ?auto_1741250 ?auto_1741252 ) ) ( AVAILABLE ?auto_1741252 ) ( SURFACE-AT ?auto_1741249 ?auto_1741253 ) ( ON ?auto_1741249 ?auto_1741254 ) ( CLEAR ?auto_1741249 ) ( not ( = ?auto_1741248 ?auto_1741254 ) ) ( not ( = ?auto_1741249 ?auto_1741254 ) ) ( not ( = ?auto_1741247 ?auto_1741254 ) ) ( TRUCK-AT ?auto_1741255 ?auto_1741251 ) ( SURFACE-AT ?auto_1741247 ?auto_1741251 ) ( CLEAR ?auto_1741247 ) ( LIFTING ?auto_1741250 ?auto_1741248 ) ( IS-CRATE ?auto_1741248 ) ( ON ?auto_1741238 ?auto_1741237 ) ( ON ?auto_1741239 ?auto_1741238 ) ( ON ?auto_1741241 ?auto_1741239 ) ( ON ?auto_1741240 ?auto_1741241 ) ( ON ?auto_1741242 ?auto_1741240 ) ( ON ?auto_1741243 ?auto_1741242 ) ( ON ?auto_1741244 ?auto_1741243 ) ( ON ?auto_1741245 ?auto_1741244 ) ( ON ?auto_1741246 ?auto_1741245 ) ( ON ?auto_1741247 ?auto_1741246 ) ( not ( = ?auto_1741237 ?auto_1741238 ) ) ( not ( = ?auto_1741237 ?auto_1741239 ) ) ( not ( = ?auto_1741237 ?auto_1741241 ) ) ( not ( = ?auto_1741237 ?auto_1741240 ) ) ( not ( = ?auto_1741237 ?auto_1741242 ) ) ( not ( = ?auto_1741237 ?auto_1741243 ) ) ( not ( = ?auto_1741237 ?auto_1741244 ) ) ( not ( = ?auto_1741237 ?auto_1741245 ) ) ( not ( = ?auto_1741237 ?auto_1741246 ) ) ( not ( = ?auto_1741237 ?auto_1741247 ) ) ( not ( = ?auto_1741237 ?auto_1741248 ) ) ( not ( = ?auto_1741237 ?auto_1741249 ) ) ( not ( = ?auto_1741237 ?auto_1741254 ) ) ( not ( = ?auto_1741238 ?auto_1741239 ) ) ( not ( = ?auto_1741238 ?auto_1741241 ) ) ( not ( = ?auto_1741238 ?auto_1741240 ) ) ( not ( = ?auto_1741238 ?auto_1741242 ) ) ( not ( = ?auto_1741238 ?auto_1741243 ) ) ( not ( = ?auto_1741238 ?auto_1741244 ) ) ( not ( = ?auto_1741238 ?auto_1741245 ) ) ( not ( = ?auto_1741238 ?auto_1741246 ) ) ( not ( = ?auto_1741238 ?auto_1741247 ) ) ( not ( = ?auto_1741238 ?auto_1741248 ) ) ( not ( = ?auto_1741238 ?auto_1741249 ) ) ( not ( = ?auto_1741238 ?auto_1741254 ) ) ( not ( = ?auto_1741239 ?auto_1741241 ) ) ( not ( = ?auto_1741239 ?auto_1741240 ) ) ( not ( = ?auto_1741239 ?auto_1741242 ) ) ( not ( = ?auto_1741239 ?auto_1741243 ) ) ( not ( = ?auto_1741239 ?auto_1741244 ) ) ( not ( = ?auto_1741239 ?auto_1741245 ) ) ( not ( = ?auto_1741239 ?auto_1741246 ) ) ( not ( = ?auto_1741239 ?auto_1741247 ) ) ( not ( = ?auto_1741239 ?auto_1741248 ) ) ( not ( = ?auto_1741239 ?auto_1741249 ) ) ( not ( = ?auto_1741239 ?auto_1741254 ) ) ( not ( = ?auto_1741241 ?auto_1741240 ) ) ( not ( = ?auto_1741241 ?auto_1741242 ) ) ( not ( = ?auto_1741241 ?auto_1741243 ) ) ( not ( = ?auto_1741241 ?auto_1741244 ) ) ( not ( = ?auto_1741241 ?auto_1741245 ) ) ( not ( = ?auto_1741241 ?auto_1741246 ) ) ( not ( = ?auto_1741241 ?auto_1741247 ) ) ( not ( = ?auto_1741241 ?auto_1741248 ) ) ( not ( = ?auto_1741241 ?auto_1741249 ) ) ( not ( = ?auto_1741241 ?auto_1741254 ) ) ( not ( = ?auto_1741240 ?auto_1741242 ) ) ( not ( = ?auto_1741240 ?auto_1741243 ) ) ( not ( = ?auto_1741240 ?auto_1741244 ) ) ( not ( = ?auto_1741240 ?auto_1741245 ) ) ( not ( = ?auto_1741240 ?auto_1741246 ) ) ( not ( = ?auto_1741240 ?auto_1741247 ) ) ( not ( = ?auto_1741240 ?auto_1741248 ) ) ( not ( = ?auto_1741240 ?auto_1741249 ) ) ( not ( = ?auto_1741240 ?auto_1741254 ) ) ( not ( = ?auto_1741242 ?auto_1741243 ) ) ( not ( = ?auto_1741242 ?auto_1741244 ) ) ( not ( = ?auto_1741242 ?auto_1741245 ) ) ( not ( = ?auto_1741242 ?auto_1741246 ) ) ( not ( = ?auto_1741242 ?auto_1741247 ) ) ( not ( = ?auto_1741242 ?auto_1741248 ) ) ( not ( = ?auto_1741242 ?auto_1741249 ) ) ( not ( = ?auto_1741242 ?auto_1741254 ) ) ( not ( = ?auto_1741243 ?auto_1741244 ) ) ( not ( = ?auto_1741243 ?auto_1741245 ) ) ( not ( = ?auto_1741243 ?auto_1741246 ) ) ( not ( = ?auto_1741243 ?auto_1741247 ) ) ( not ( = ?auto_1741243 ?auto_1741248 ) ) ( not ( = ?auto_1741243 ?auto_1741249 ) ) ( not ( = ?auto_1741243 ?auto_1741254 ) ) ( not ( = ?auto_1741244 ?auto_1741245 ) ) ( not ( = ?auto_1741244 ?auto_1741246 ) ) ( not ( = ?auto_1741244 ?auto_1741247 ) ) ( not ( = ?auto_1741244 ?auto_1741248 ) ) ( not ( = ?auto_1741244 ?auto_1741249 ) ) ( not ( = ?auto_1741244 ?auto_1741254 ) ) ( not ( = ?auto_1741245 ?auto_1741246 ) ) ( not ( = ?auto_1741245 ?auto_1741247 ) ) ( not ( = ?auto_1741245 ?auto_1741248 ) ) ( not ( = ?auto_1741245 ?auto_1741249 ) ) ( not ( = ?auto_1741245 ?auto_1741254 ) ) ( not ( = ?auto_1741246 ?auto_1741247 ) ) ( not ( = ?auto_1741246 ?auto_1741248 ) ) ( not ( = ?auto_1741246 ?auto_1741249 ) ) ( not ( = ?auto_1741246 ?auto_1741254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741247 ?auto_1741248 ?auto_1741249 )
      ( MAKE-12CRATE-VERIFY ?auto_1741237 ?auto_1741238 ?auto_1741239 ?auto_1741241 ?auto_1741240 ?auto_1741242 ?auto_1741243 ?auto_1741244 ?auto_1741245 ?auto_1741246 ?auto_1741247 ?auto_1741248 ?auto_1741249 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741400 - SURFACE
      ?auto_1741401 - SURFACE
      ?auto_1741402 - SURFACE
      ?auto_1741404 - SURFACE
      ?auto_1741403 - SURFACE
      ?auto_1741405 - SURFACE
      ?auto_1741406 - SURFACE
      ?auto_1741407 - SURFACE
      ?auto_1741408 - SURFACE
      ?auto_1741409 - SURFACE
      ?auto_1741410 - SURFACE
      ?auto_1741411 - SURFACE
      ?auto_1741412 - SURFACE
    )
    :vars
    (
      ?auto_1741415 - HOIST
      ?auto_1741414 - PLACE
      ?auto_1741416 - PLACE
      ?auto_1741418 - HOIST
      ?auto_1741417 - SURFACE
      ?auto_1741413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741415 ?auto_1741414 ) ( IS-CRATE ?auto_1741412 ) ( not ( = ?auto_1741411 ?auto_1741412 ) ) ( not ( = ?auto_1741410 ?auto_1741411 ) ) ( not ( = ?auto_1741410 ?auto_1741412 ) ) ( not ( = ?auto_1741416 ?auto_1741414 ) ) ( HOIST-AT ?auto_1741418 ?auto_1741416 ) ( not ( = ?auto_1741415 ?auto_1741418 ) ) ( AVAILABLE ?auto_1741418 ) ( SURFACE-AT ?auto_1741412 ?auto_1741416 ) ( ON ?auto_1741412 ?auto_1741417 ) ( CLEAR ?auto_1741412 ) ( not ( = ?auto_1741411 ?auto_1741417 ) ) ( not ( = ?auto_1741412 ?auto_1741417 ) ) ( not ( = ?auto_1741410 ?auto_1741417 ) ) ( TRUCK-AT ?auto_1741413 ?auto_1741414 ) ( SURFACE-AT ?auto_1741410 ?auto_1741414 ) ( CLEAR ?auto_1741410 ) ( IS-CRATE ?auto_1741411 ) ( AVAILABLE ?auto_1741415 ) ( IN ?auto_1741411 ?auto_1741413 ) ( ON ?auto_1741401 ?auto_1741400 ) ( ON ?auto_1741402 ?auto_1741401 ) ( ON ?auto_1741404 ?auto_1741402 ) ( ON ?auto_1741403 ?auto_1741404 ) ( ON ?auto_1741405 ?auto_1741403 ) ( ON ?auto_1741406 ?auto_1741405 ) ( ON ?auto_1741407 ?auto_1741406 ) ( ON ?auto_1741408 ?auto_1741407 ) ( ON ?auto_1741409 ?auto_1741408 ) ( ON ?auto_1741410 ?auto_1741409 ) ( not ( = ?auto_1741400 ?auto_1741401 ) ) ( not ( = ?auto_1741400 ?auto_1741402 ) ) ( not ( = ?auto_1741400 ?auto_1741404 ) ) ( not ( = ?auto_1741400 ?auto_1741403 ) ) ( not ( = ?auto_1741400 ?auto_1741405 ) ) ( not ( = ?auto_1741400 ?auto_1741406 ) ) ( not ( = ?auto_1741400 ?auto_1741407 ) ) ( not ( = ?auto_1741400 ?auto_1741408 ) ) ( not ( = ?auto_1741400 ?auto_1741409 ) ) ( not ( = ?auto_1741400 ?auto_1741410 ) ) ( not ( = ?auto_1741400 ?auto_1741411 ) ) ( not ( = ?auto_1741400 ?auto_1741412 ) ) ( not ( = ?auto_1741400 ?auto_1741417 ) ) ( not ( = ?auto_1741401 ?auto_1741402 ) ) ( not ( = ?auto_1741401 ?auto_1741404 ) ) ( not ( = ?auto_1741401 ?auto_1741403 ) ) ( not ( = ?auto_1741401 ?auto_1741405 ) ) ( not ( = ?auto_1741401 ?auto_1741406 ) ) ( not ( = ?auto_1741401 ?auto_1741407 ) ) ( not ( = ?auto_1741401 ?auto_1741408 ) ) ( not ( = ?auto_1741401 ?auto_1741409 ) ) ( not ( = ?auto_1741401 ?auto_1741410 ) ) ( not ( = ?auto_1741401 ?auto_1741411 ) ) ( not ( = ?auto_1741401 ?auto_1741412 ) ) ( not ( = ?auto_1741401 ?auto_1741417 ) ) ( not ( = ?auto_1741402 ?auto_1741404 ) ) ( not ( = ?auto_1741402 ?auto_1741403 ) ) ( not ( = ?auto_1741402 ?auto_1741405 ) ) ( not ( = ?auto_1741402 ?auto_1741406 ) ) ( not ( = ?auto_1741402 ?auto_1741407 ) ) ( not ( = ?auto_1741402 ?auto_1741408 ) ) ( not ( = ?auto_1741402 ?auto_1741409 ) ) ( not ( = ?auto_1741402 ?auto_1741410 ) ) ( not ( = ?auto_1741402 ?auto_1741411 ) ) ( not ( = ?auto_1741402 ?auto_1741412 ) ) ( not ( = ?auto_1741402 ?auto_1741417 ) ) ( not ( = ?auto_1741404 ?auto_1741403 ) ) ( not ( = ?auto_1741404 ?auto_1741405 ) ) ( not ( = ?auto_1741404 ?auto_1741406 ) ) ( not ( = ?auto_1741404 ?auto_1741407 ) ) ( not ( = ?auto_1741404 ?auto_1741408 ) ) ( not ( = ?auto_1741404 ?auto_1741409 ) ) ( not ( = ?auto_1741404 ?auto_1741410 ) ) ( not ( = ?auto_1741404 ?auto_1741411 ) ) ( not ( = ?auto_1741404 ?auto_1741412 ) ) ( not ( = ?auto_1741404 ?auto_1741417 ) ) ( not ( = ?auto_1741403 ?auto_1741405 ) ) ( not ( = ?auto_1741403 ?auto_1741406 ) ) ( not ( = ?auto_1741403 ?auto_1741407 ) ) ( not ( = ?auto_1741403 ?auto_1741408 ) ) ( not ( = ?auto_1741403 ?auto_1741409 ) ) ( not ( = ?auto_1741403 ?auto_1741410 ) ) ( not ( = ?auto_1741403 ?auto_1741411 ) ) ( not ( = ?auto_1741403 ?auto_1741412 ) ) ( not ( = ?auto_1741403 ?auto_1741417 ) ) ( not ( = ?auto_1741405 ?auto_1741406 ) ) ( not ( = ?auto_1741405 ?auto_1741407 ) ) ( not ( = ?auto_1741405 ?auto_1741408 ) ) ( not ( = ?auto_1741405 ?auto_1741409 ) ) ( not ( = ?auto_1741405 ?auto_1741410 ) ) ( not ( = ?auto_1741405 ?auto_1741411 ) ) ( not ( = ?auto_1741405 ?auto_1741412 ) ) ( not ( = ?auto_1741405 ?auto_1741417 ) ) ( not ( = ?auto_1741406 ?auto_1741407 ) ) ( not ( = ?auto_1741406 ?auto_1741408 ) ) ( not ( = ?auto_1741406 ?auto_1741409 ) ) ( not ( = ?auto_1741406 ?auto_1741410 ) ) ( not ( = ?auto_1741406 ?auto_1741411 ) ) ( not ( = ?auto_1741406 ?auto_1741412 ) ) ( not ( = ?auto_1741406 ?auto_1741417 ) ) ( not ( = ?auto_1741407 ?auto_1741408 ) ) ( not ( = ?auto_1741407 ?auto_1741409 ) ) ( not ( = ?auto_1741407 ?auto_1741410 ) ) ( not ( = ?auto_1741407 ?auto_1741411 ) ) ( not ( = ?auto_1741407 ?auto_1741412 ) ) ( not ( = ?auto_1741407 ?auto_1741417 ) ) ( not ( = ?auto_1741408 ?auto_1741409 ) ) ( not ( = ?auto_1741408 ?auto_1741410 ) ) ( not ( = ?auto_1741408 ?auto_1741411 ) ) ( not ( = ?auto_1741408 ?auto_1741412 ) ) ( not ( = ?auto_1741408 ?auto_1741417 ) ) ( not ( = ?auto_1741409 ?auto_1741410 ) ) ( not ( = ?auto_1741409 ?auto_1741411 ) ) ( not ( = ?auto_1741409 ?auto_1741412 ) ) ( not ( = ?auto_1741409 ?auto_1741417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741410 ?auto_1741411 ?auto_1741412 )
      ( MAKE-12CRATE-VERIFY ?auto_1741400 ?auto_1741401 ?auto_1741402 ?auto_1741404 ?auto_1741403 ?auto_1741405 ?auto_1741406 ?auto_1741407 ?auto_1741408 ?auto_1741409 ?auto_1741410 ?auto_1741411 ?auto_1741412 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1750086 - SURFACE
      ?auto_1750087 - SURFACE
    )
    :vars
    (
      ?auto_1750093 - HOIST
      ?auto_1750090 - PLACE
      ?auto_1750092 - SURFACE
      ?auto_1750089 - PLACE
      ?auto_1750094 - HOIST
      ?auto_1750088 - SURFACE
      ?auto_1750091 - TRUCK
      ?auto_1750095 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1750093 ?auto_1750090 ) ( SURFACE-AT ?auto_1750086 ?auto_1750090 ) ( CLEAR ?auto_1750086 ) ( IS-CRATE ?auto_1750087 ) ( not ( = ?auto_1750086 ?auto_1750087 ) ) ( ON ?auto_1750086 ?auto_1750092 ) ( not ( = ?auto_1750092 ?auto_1750086 ) ) ( not ( = ?auto_1750092 ?auto_1750087 ) ) ( not ( = ?auto_1750089 ?auto_1750090 ) ) ( HOIST-AT ?auto_1750094 ?auto_1750089 ) ( not ( = ?auto_1750093 ?auto_1750094 ) ) ( AVAILABLE ?auto_1750094 ) ( SURFACE-AT ?auto_1750087 ?auto_1750089 ) ( ON ?auto_1750087 ?auto_1750088 ) ( CLEAR ?auto_1750087 ) ( not ( = ?auto_1750086 ?auto_1750088 ) ) ( not ( = ?auto_1750087 ?auto_1750088 ) ) ( not ( = ?auto_1750092 ?auto_1750088 ) ) ( TRUCK-AT ?auto_1750091 ?auto_1750090 ) ( LIFTING ?auto_1750093 ?auto_1750095 ) ( IS-CRATE ?auto_1750095 ) ( not ( = ?auto_1750086 ?auto_1750095 ) ) ( not ( = ?auto_1750087 ?auto_1750095 ) ) ( not ( = ?auto_1750092 ?auto_1750095 ) ) ( not ( = ?auto_1750088 ?auto_1750095 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1750093 ?auto_1750095 ?auto_1750091 ?auto_1750090 )
      ( MAKE-1CRATE ?auto_1750086 ?auto_1750087 )
      ( MAKE-1CRATE-VERIFY ?auto_1750086 ?auto_1750087 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1752967 - SURFACE
      ?auto_1752968 - SURFACE
      ?auto_1752969 - SURFACE
      ?auto_1752971 - SURFACE
      ?auto_1752970 - SURFACE
      ?auto_1752972 - SURFACE
      ?auto_1752973 - SURFACE
      ?auto_1752974 - SURFACE
      ?auto_1752975 - SURFACE
      ?auto_1752976 - SURFACE
      ?auto_1752977 - SURFACE
      ?auto_1752978 - SURFACE
      ?auto_1752979 - SURFACE
      ?auto_1752980 - SURFACE
    )
    :vars
    (
      ?auto_1752982 - HOIST
      ?auto_1752981 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1752982 ?auto_1752981 ) ( SURFACE-AT ?auto_1752979 ?auto_1752981 ) ( CLEAR ?auto_1752979 ) ( LIFTING ?auto_1752982 ?auto_1752980 ) ( IS-CRATE ?auto_1752980 ) ( not ( = ?auto_1752979 ?auto_1752980 ) ) ( ON ?auto_1752968 ?auto_1752967 ) ( ON ?auto_1752969 ?auto_1752968 ) ( ON ?auto_1752971 ?auto_1752969 ) ( ON ?auto_1752970 ?auto_1752971 ) ( ON ?auto_1752972 ?auto_1752970 ) ( ON ?auto_1752973 ?auto_1752972 ) ( ON ?auto_1752974 ?auto_1752973 ) ( ON ?auto_1752975 ?auto_1752974 ) ( ON ?auto_1752976 ?auto_1752975 ) ( ON ?auto_1752977 ?auto_1752976 ) ( ON ?auto_1752978 ?auto_1752977 ) ( ON ?auto_1752979 ?auto_1752978 ) ( not ( = ?auto_1752967 ?auto_1752968 ) ) ( not ( = ?auto_1752967 ?auto_1752969 ) ) ( not ( = ?auto_1752967 ?auto_1752971 ) ) ( not ( = ?auto_1752967 ?auto_1752970 ) ) ( not ( = ?auto_1752967 ?auto_1752972 ) ) ( not ( = ?auto_1752967 ?auto_1752973 ) ) ( not ( = ?auto_1752967 ?auto_1752974 ) ) ( not ( = ?auto_1752967 ?auto_1752975 ) ) ( not ( = ?auto_1752967 ?auto_1752976 ) ) ( not ( = ?auto_1752967 ?auto_1752977 ) ) ( not ( = ?auto_1752967 ?auto_1752978 ) ) ( not ( = ?auto_1752967 ?auto_1752979 ) ) ( not ( = ?auto_1752967 ?auto_1752980 ) ) ( not ( = ?auto_1752968 ?auto_1752969 ) ) ( not ( = ?auto_1752968 ?auto_1752971 ) ) ( not ( = ?auto_1752968 ?auto_1752970 ) ) ( not ( = ?auto_1752968 ?auto_1752972 ) ) ( not ( = ?auto_1752968 ?auto_1752973 ) ) ( not ( = ?auto_1752968 ?auto_1752974 ) ) ( not ( = ?auto_1752968 ?auto_1752975 ) ) ( not ( = ?auto_1752968 ?auto_1752976 ) ) ( not ( = ?auto_1752968 ?auto_1752977 ) ) ( not ( = ?auto_1752968 ?auto_1752978 ) ) ( not ( = ?auto_1752968 ?auto_1752979 ) ) ( not ( = ?auto_1752968 ?auto_1752980 ) ) ( not ( = ?auto_1752969 ?auto_1752971 ) ) ( not ( = ?auto_1752969 ?auto_1752970 ) ) ( not ( = ?auto_1752969 ?auto_1752972 ) ) ( not ( = ?auto_1752969 ?auto_1752973 ) ) ( not ( = ?auto_1752969 ?auto_1752974 ) ) ( not ( = ?auto_1752969 ?auto_1752975 ) ) ( not ( = ?auto_1752969 ?auto_1752976 ) ) ( not ( = ?auto_1752969 ?auto_1752977 ) ) ( not ( = ?auto_1752969 ?auto_1752978 ) ) ( not ( = ?auto_1752969 ?auto_1752979 ) ) ( not ( = ?auto_1752969 ?auto_1752980 ) ) ( not ( = ?auto_1752971 ?auto_1752970 ) ) ( not ( = ?auto_1752971 ?auto_1752972 ) ) ( not ( = ?auto_1752971 ?auto_1752973 ) ) ( not ( = ?auto_1752971 ?auto_1752974 ) ) ( not ( = ?auto_1752971 ?auto_1752975 ) ) ( not ( = ?auto_1752971 ?auto_1752976 ) ) ( not ( = ?auto_1752971 ?auto_1752977 ) ) ( not ( = ?auto_1752971 ?auto_1752978 ) ) ( not ( = ?auto_1752971 ?auto_1752979 ) ) ( not ( = ?auto_1752971 ?auto_1752980 ) ) ( not ( = ?auto_1752970 ?auto_1752972 ) ) ( not ( = ?auto_1752970 ?auto_1752973 ) ) ( not ( = ?auto_1752970 ?auto_1752974 ) ) ( not ( = ?auto_1752970 ?auto_1752975 ) ) ( not ( = ?auto_1752970 ?auto_1752976 ) ) ( not ( = ?auto_1752970 ?auto_1752977 ) ) ( not ( = ?auto_1752970 ?auto_1752978 ) ) ( not ( = ?auto_1752970 ?auto_1752979 ) ) ( not ( = ?auto_1752970 ?auto_1752980 ) ) ( not ( = ?auto_1752972 ?auto_1752973 ) ) ( not ( = ?auto_1752972 ?auto_1752974 ) ) ( not ( = ?auto_1752972 ?auto_1752975 ) ) ( not ( = ?auto_1752972 ?auto_1752976 ) ) ( not ( = ?auto_1752972 ?auto_1752977 ) ) ( not ( = ?auto_1752972 ?auto_1752978 ) ) ( not ( = ?auto_1752972 ?auto_1752979 ) ) ( not ( = ?auto_1752972 ?auto_1752980 ) ) ( not ( = ?auto_1752973 ?auto_1752974 ) ) ( not ( = ?auto_1752973 ?auto_1752975 ) ) ( not ( = ?auto_1752973 ?auto_1752976 ) ) ( not ( = ?auto_1752973 ?auto_1752977 ) ) ( not ( = ?auto_1752973 ?auto_1752978 ) ) ( not ( = ?auto_1752973 ?auto_1752979 ) ) ( not ( = ?auto_1752973 ?auto_1752980 ) ) ( not ( = ?auto_1752974 ?auto_1752975 ) ) ( not ( = ?auto_1752974 ?auto_1752976 ) ) ( not ( = ?auto_1752974 ?auto_1752977 ) ) ( not ( = ?auto_1752974 ?auto_1752978 ) ) ( not ( = ?auto_1752974 ?auto_1752979 ) ) ( not ( = ?auto_1752974 ?auto_1752980 ) ) ( not ( = ?auto_1752975 ?auto_1752976 ) ) ( not ( = ?auto_1752975 ?auto_1752977 ) ) ( not ( = ?auto_1752975 ?auto_1752978 ) ) ( not ( = ?auto_1752975 ?auto_1752979 ) ) ( not ( = ?auto_1752975 ?auto_1752980 ) ) ( not ( = ?auto_1752976 ?auto_1752977 ) ) ( not ( = ?auto_1752976 ?auto_1752978 ) ) ( not ( = ?auto_1752976 ?auto_1752979 ) ) ( not ( = ?auto_1752976 ?auto_1752980 ) ) ( not ( = ?auto_1752977 ?auto_1752978 ) ) ( not ( = ?auto_1752977 ?auto_1752979 ) ) ( not ( = ?auto_1752977 ?auto_1752980 ) ) ( not ( = ?auto_1752978 ?auto_1752979 ) ) ( not ( = ?auto_1752978 ?auto_1752980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1752979 ?auto_1752980 )
      ( MAKE-13CRATE-VERIFY ?auto_1752967 ?auto_1752968 ?auto_1752969 ?auto_1752971 ?auto_1752970 ?auto_1752972 ?auto_1752973 ?auto_1752974 ?auto_1752975 ?auto_1752976 ?auto_1752977 ?auto_1752978 ?auto_1752979 ?auto_1752980 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753109 - SURFACE
      ?auto_1753110 - SURFACE
      ?auto_1753111 - SURFACE
      ?auto_1753113 - SURFACE
      ?auto_1753112 - SURFACE
      ?auto_1753114 - SURFACE
      ?auto_1753115 - SURFACE
      ?auto_1753116 - SURFACE
      ?auto_1753117 - SURFACE
      ?auto_1753118 - SURFACE
      ?auto_1753119 - SURFACE
      ?auto_1753120 - SURFACE
      ?auto_1753121 - SURFACE
      ?auto_1753122 - SURFACE
    )
    :vars
    (
      ?auto_1753124 - HOIST
      ?auto_1753123 - PLACE
      ?auto_1753125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753124 ?auto_1753123 ) ( SURFACE-AT ?auto_1753121 ?auto_1753123 ) ( CLEAR ?auto_1753121 ) ( IS-CRATE ?auto_1753122 ) ( not ( = ?auto_1753121 ?auto_1753122 ) ) ( TRUCK-AT ?auto_1753125 ?auto_1753123 ) ( AVAILABLE ?auto_1753124 ) ( IN ?auto_1753122 ?auto_1753125 ) ( ON ?auto_1753121 ?auto_1753120 ) ( not ( = ?auto_1753120 ?auto_1753121 ) ) ( not ( = ?auto_1753120 ?auto_1753122 ) ) ( ON ?auto_1753110 ?auto_1753109 ) ( ON ?auto_1753111 ?auto_1753110 ) ( ON ?auto_1753113 ?auto_1753111 ) ( ON ?auto_1753112 ?auto_1753113 ) ( ON ?auto_1753114 ?auto_1753112 ) ( ON ?auto_1753115 ?auto_1753114 ) ( ON ?auto_1753116 ?auto_1753115 ) ( ON ?auto_1753117 ?auto_1753116 ) ( ON ?auto_1753118 ?auto_1753117 ) ( ON ?auto_1753119 ?auto_1753118 ) ( ON ?auto_1753120 ?auto_1753119 ) ( not ( = ?auto_1753109 ?auto_1753110 ) ) ( not ( = ?auto_1753109 ?auto_1753111 ) ) ( not ( = ?auto_1753109 ?auto_1753113 ) ) ( not ( = ?auto_1753109 ?auto_1753112 ) ) ( not ( = ?auto_1753109 ?auto_1753114 ) ) ( not ( = ?auto_1753109 ?auto_1753115 ) ) ( not ( = ?auto_1753109 ?auto_1753116 ) ) ( not ( = ?auto_1753109 ?auto_1753117 ) ) ( not ( = ?auto_1753109 ?auto_1753118 ) ) ( not ( = ?auto_1753109 ?auto_1753119 ) ) ( not ( = ?auto_1753109 ?auto_1753120 ) ) ( not ( = ?auto_1753109 ?auto_1753121 ) ) ( not ( = ?auto_1753109 ?auto_1753122 ) ) ( not ( = ?auto_1753110 ?auto_1753111 ) ) ( not ( = ?auto_1753110 ?auto_1753113 ) ) ( not ( = ?auto_1753110 ?auto_1753112 ) ) ( not ( = ?auto_1753110 ?auto_1753114 ) ) ( not ( = ?auto_1753110 ?auto_1753115 ) ) ( not ( = ?auto_1753110 ?auto_1753116 ) ) ( not ( = ?auto_1753110 ?auto_1753117 ) ) ( not ( = ?auto_1753110 ?auto_1753118 ) ) ( not ( = ?auto_1753110 ?auto_1753119 ) ) ( not ( = ?auto_1753110 ?auto_1753120 ) ) ( not ( = ?auto_1753110 ?auto_1753121 ) ) ( not ( = ?auto_1753110 ?auto_1753122 ) ) ( not ( = ?auto_1753111 ?auto_1753113 ) ) ( not ( = ?auto_1753111 ?auto_1753112 ) ) ( not ( = ?auto_1753111 ?auto_1753114 ) ) ( not ( = ?auto_1753111 ?auto_1753115 ) ) ( not ( = ?auto_1753111 ?auto_1753116 ) ) ( not ( = ?auto_1753111 ?auto_1753117 ) ) ( not ( = ?auto_1753111 ?auto_1753118 ) ) ( not ( = ?auto_1753111 ?auto_1753119 ) ) ( not ( = ?auto_1753111 ?auto_1753120 ) ) ( not ( = ?auto_1753111 ?auto_1753121 ) ) ( not ( = ?auto_1753111 ?auto_1753122 ) ) ( not ( = ?auto_1753113 ?auto_1753112 ) ) ( not ( = ?auto_1753113 ?auto_1753114 ) ) ( not ( = ?auto_1753113 ?auto_1753115 ) ) ( not ( = ?auto_1753113 ?auto_1753116 ) ) ( not ( = ?auto_1753113 ?auto_1753117 ) ) ( not ( = ?auto_1753113 ?auto_1753118 ) ) ( not ( = ?auto_1753113 ?auto_1753119 ) ) ( not ( = ?auto_1753113 ?auto_1753120 ) ) ( not ( = ?auto_1753113 ?auto_1753121 ) ) ( not ( = ?auto_1753113 ?auto_1753122 ) ) ( not ( = ?auto_1753112 ?auto_1753114 ) ) ( not ( = ?auto_1753112 ?auto_1753115 ) ) ( not ( = ?auto_1753112 ?auto_1753116 ) ) ( not ( = ?auto_1753112 ?auto_1753117 ) ) ( not ( = ?auto_1753112 ?auto_1753118 ) ) ( not ( = ?auto_1753112 ?auto_1753119 ) ) ( not ( = ?auto_1753112 ?auto_1753120 ) ) ( not ( = ?auto_1753112 ?auto_1753121 ) ) ( not ( = ?auto_1753112 ?auto_1753122 ) ) ( not ( = ?auto_1753114 ?auto_1753115 ) ) ( not ( = ?auto_1753114 ?auto_1753116 ) ) ( not ( = ?auto_1753114 ?auto_1753117 ) ) ( not ( = ?auto_1753114 ?auto_1753118 ) ) ( not ( = ?auto_1753114 ?auto_1753119 ) ) ( not ( = ?auto_1753114 ?auto_1753120 ) ) ( not ( = ?auto_1753114 ?auto_1753121 ) ) ( not ( = ?auto_1753114 ?auto_1753122 ) ) ( not ( = ?auto_1753115 ?auto_1753116 ) ) ( not ( = ?auto_1753115 ?auto_1753117 ) ) ( not ( = ?auto_1753115 ?auto_1753118 ) ) ( not ( = ?auto_1753115 ?auto_1753119 ) ) ( not ( = ?auto_1753115 ?auto_1753120 ) ) ( not ( = ?auto_1753115 ?auto_1753121 ) ) ( not ( = ?auto_1753115 ?auto_1753122 ) ) ( not ( = ?auto_1753116 ?auto_1753117 ) ) ( not ( = ?auto_1753116 ?auto_1753118 ) ) ( not ( = ?auto_1753116 ?auto_1753119 ) ) ( not ( = ?auto_1753116 ?auto_1753120 ) ) ( not ( = ?auto_1753116 ?auto_1753121 ) ) ( not ( = ?auto_1753116 ?auto_1753122 ) ) ( not ( = ?auto_1753117 ?auto_1753118 ) ) ( not ( = ?auto_1753117 ?auto_1753119 ) ) ( not ( = ?auto_1753117 ?auto_1753120 ) ) ( not ( = ?auto_1753117 ?auto_1753121 ) ) ( not ( = ?auto_1753117 ?auto_1753122 ) ) ( not ( = ?auto_1753118 ?auto_1753119 ) ) ( not ( = ?auto_1753118 ?auto_1753120 ) ) ( not ( = ?auto_1753118 ?auto_1753121 ) ) ( not ( = ?auto_1753118 ?auto_1753122 ) ) ( not ( = ?auto_1753119 ?auto_1753120 ) ) ( not ( = ?auto_1753119 ?auto_1753121 ) ) ( not ( = ?auto_1753119 ?auto_1753122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753120 ?auto_1753121 ?auto_1753122 )
      ( MAKE-13CRATE-VERIFY ?auto_1753109 ?auto_1753110 ?auto_1753111 ?auto_1753113 ?auto_1753112 ?auto_1753114 ?auto_1753115 ?auto_1753116 ?auto_1753117 ?auto_1753118 ?auto_1753119 ?auto_1753120 ?auto_1753121 ?auto_1753122 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753265 - SURFACE
      ?auto_1753266 - SURFACE
      ?auto_1753267 - SURFACE
      ?auto_1753269 - SURFACE
      ?auto_1753268 - SURFACE
      ?auto_1753270 - SURFACE
      ?auto_1753271 - SURFACE
      ?auto_1753272 - SURFACE
      ?auto_1753273 - SURFACE
      ?auto_1753274 - SURFACE
      ?auto_1753275 - SURFACE
      ?auto_1753276 - SURFACE
      ?auto_1753277 - SURFACE
      ?auto_1753278 - SURFACE
    )
    :vars
    (
      ?auto_1753281 - HOIST
      ?auto_1753282 - PLACE
      ?auto_1753279 - TRUCK
      ?auto_1753280 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753281 ?auto_1753282 ) ( SURFACE-AT ?auto_1753277 ?auto_1753282 ) ( CLEAR ?auto_1753277 ) ( IS-CRATE ?auto_1753278 ) ( not ( = ?auto_1753277 ?auto_1753278 ) ) ( AVAILABLE ?auto_1753281 ) ( IN ?auto_1753278 ?auto_1753279 ) ( ON ?auto_1753277 ?auto_1753276 ) ( not ( = ?auto_1753276 ?auto_1753277 ) ) ( not ( = ?auto_1753276 ?auto_1753278 ) ) ( TRUCK-AT ?auto_1753279 ?auto_1753280 ) ( not ( = ?auto_1753280 ?auto_1753282 ) ) ( ON ?auto_1753266 ?auto_1753265 ) ( ON ?auto_1753267 ?auto_1753266 ) ( ON ?auto_1753269 ?auto_1753267 ) ( ON ?auto_1753268 ?auto_1753269 ) ( ON ?auto_1753270 ?auto_1753268 ) ( ON ?auto_1753271 ?auto_1753270 ) ( ON ?auto_1753272 ?auto_1753271 ) ( ON ?auto_1753273 ?auto_1753272 ) ( ON ?auto_1753274 ?auto_1753273 ) ( ON ?auto_1753275 ?auto_1753274 ) ( ON ?auto_1753276 ?auto_1753275 ) ( not ( = ?auto_1753265 ?auto_1753266 ) ) ( not ( = ?auto_1753265 ?auto_1753267 ) ) ( not ( = ?auto_1753265 ?auto_1753269 ) ) ( not ( = ?auto_1753265 ?auto_1753268 ) ) ( not ( = ?auto_1753265 ?auto_1753270 ) ) ( not ( = ?auto_1753265 ?auto_1753271 ) ) ( not ( = ?auto_1753265 ?auto_1753272 ) ) ( not ( = ?auto_1753265 ?auto_1753273 ) ) ( not ( = ?auto_1753265 ?auto_1753274 ) ) ( not ( = ?auto_1753265 ?auto_1753275 ) ) ( not ( = ?auto_1753265 ?auto_1753276 ) ) ( not ( = ?auto_1753265 ?auto_1753277 ) ) ( not ( = ?auto_1753265 ?auto_1753278 ) ) ( not ( = ?auto_1753266 ?auto_1753267 ) ) ( not ( = ?auto_1753266 ?auto_1753269 ) ) ( not ( = ?auto_1753266 ?auto_1753268 ) ) ( not ( = ?auto_1753266 ?auto_1753270 ) ) ( not ( = ?auto_1753266 ?auto_1753271 ) ) ( not ( = ?auto_1753266 ?auto_1753272 ) ) ( not ( = ?auto_1753266 ?auto_1753273 ) ) ( not ( = ?auto_1753266 ?auto_1753274 ) ) ( not ( = ?auto_1753266 ?auto_1753275 ) ) ( not ( = ?auto_1753266 ?auto_1753276 ) ) ( not ( = ?auto_1753266 ?auto_1753277 ) ) ( not ( = ?auto_1753266 ?auto_1753278 ) ) ( not ( = ?auto_1753267 ?auto_1753269 ) ) ( not ( = ?auto_1753267 ?auto_1753268 ) ) ( not ( = ?auto_1753267 ?auto_1753270 ) ) ( not ( = ?auto_1753267 ?auto_1753271 ) ) ( not ( = ?auto_1753267 ?auto_1753272 ) ) ( not ( = ?auto_1753267 ?auto_1753273 ) ) ( not ( = ?auto_1753267 ?auto_1753274 ) ) ( not ( = ?auto_1753267 ?auto_1753275 ) ) ( not ( = ?auto_1753267 ?auto_1753276 ) ) ( not ( = ?auto_1753267 ?auto_1753277 ) ) ( not ( = ?auto_1753267 ?auto_1753278 ) ) ( not ( = ?auto_1753269 ?auto_1753268 ) ) ( not ( = ?auto_1753269 ?auto_1753270 ) ) ( not ( = ?auto_1753269 ?auto_1753271 ) ) ( not ( = ?auto_1753269 ?auto_1753272 ) ) ( not ( = ?auto_1753269 ?auto_1753273 ) ) ( not ( = ?auto_1753269 ?auto_1753274 ) ) ( not ( = ?auto_1753269 ?auto_1753275 ) ) ( not ( = ?auto_1753269 ?auto_1753276 ) ) ( not ( = ?auto_1753269 ?auto_1753277 ) ) ( not ( = ?auto_1753269 ?auto_1753278 ) ) ( not ( = ?auto_1753268 ?auto_1753270 ) ) ( not ( = ?auto_1753268 ?auto_1753271 ) ) ( not ( = ?auto_1753268 ?auto_1753272 ) ) ( not ( = ?auto_1753268 ?auto_1753273 ) ) ( not ( = ?auto_1753268 ?auto_1753274 ) ) ( not ( = ?auto_1753268 ?auto_1753275 ) ) ( not ( = ?auto_1753268 ?auto_1753276 ) ) ( not ( = ?auto_1753268 ?auto_1753277 ) ) ( not ( = ?auto_1753268 ?auto_1753278 ) ) ( not ( = ?auto_1753270 ?auto_1753271 ) ) ( not ( = ?auto_1753270 ?auto_1753272 ) ) ( not ( = ?auto_1753270 ?auto_1753273 ) ) ( not ( = ?auto_1753270 ?auto_1753274 ) ) ( not ( = ?auto_1753270 ?auto_1753275 ) ) ( not ( = ?auto_1753270 ?auto_1753276 ) ) ( not ( = ?auto_1753270 ?auto_1753277 ) ) ( not ( = ?auto_1753270 ?auto_1753278 ) ) ( not ( = ?auto_1753271 ?auto_1753272 ) ) ( not ( = ?auto_1753271 ?auto_1753273 ) ) ( not ( = ?auto_1753271 ?auto_1753274 ) ) ( not ( = ?auto_1753271 ?auto_1753275 ) ) ( not ( = ?auto_1753271 ?auto_1753276 ) ) ( not ( = ?auto_1753271 ?auto_1753277 ) ) ( not ( = ?auto_1753271 ?auto_1753278 ) ) ( not ( = ?auto_1753272 ?auto_1753273 ) ) ( not ( = ?auto_1753272 ?auto_1753274 ) ) ( not ( = ?auto_1753272 ?auto_1753275 ) ) ( not ( = ?auto_1753272 ?auto_1753276 ) ) ( not ( = ?auto_1753272 ?auto_1753277 ) ) ( not ( = ?auto_1753272 ?auto_1753278 ) ) ( not ( = ?auto_1753273 ?auto_1753274 ) ) ( not ( = ?auto_1753273 ?auto_1753275 ) ) ( not ( = ?auto_1753273 ?auto_1753276 ) ) ( not ( = ?auto_1753273 ?auto_1753277 ) ) ( not ( = ?auto_1753273 ?auto_1753278 ) ) ( not ( = ?auto_1753274 ?auto_1753275 ) ) ( not ( = ?auto_1753274 ?auto_1753276 ) ) ( not ( = ?auto_1753274 ?auto_1753277 ) ) ( not ( = ?auto_1753274 ?auto_1753278 ) ) ( not ( = ?auto_1753275 ?auto_1753276 ) ) ( not ( = ?auto_1753275 ?auto_1753277 ) ) ( not ( = ?auto_1753275 ?auto_1753278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753276 ?auto_1753277 ?auto_1753278 )
      ( MAKE-13CRATE-VERIFY ?auto_1753265 ?auto_1753266 ?auto_1753267 ?auto_1753269 ?auto_1753268 ?auto_1753270 ?auto_1753271 ?auto_1753272 ?auto_1753273 ?auto_1753274 ?auto_1753275 ?auto_1753276 ?auto_1753277 ?auto_1753278 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753434 - SURFACE
      ?auto_1753435 - SURFACE
      ?auto_1753436 - SURFACE
      ?auto_1753438 - SURFACE
      ?auto_1753437 - SURFACE
      ?auto_1753439 - SURFACE
      ?auto_1753440 - SURFACE
      ?auto_1753441 - SURFACE
      ?auto_1753442 - SURFACE
      ?auto_1753443 - SURFACE
      ?auto_1753444 - SURFACE
      ?auto_1753445 - SURFACE
      ?auto_1753446 - SURFACE
      ?auto_1753447 - SURFACE
    )
    :vars
    (
      ?auto_1753452 - HOIST
      ?auto_1753451 - PLACE
      ?auto_1753449 - TRUCK
      ?auto_1753448 - PLACE
      ?auto_1753450 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753452 ?auto_1753451 ) ( SURFACE-AT ?auto_1753446 ?auto_1753451 ) ( CLEAR ?auto_1753446 ) ( IS-CRATE ?auto_1753447 ) ( not ( = ?auto_1753446 ?auto_1753447 ) ) ( AVAILABLE ?auto_1753452 ) ( ON ?auto_1753446 ?auto_1753445 ) ( not ( = ?auto_1753445 ?auto_1753446 ) ) ( not ( = ?auto_1753445 ?auto_1753447 ) ) ( TRUCK-AT ?auto_1753449 ?auto_1753448 ) ( not ( = ?auto_1753448 ?auto_1753451 ) ) ( HOIST-AT ?auto_1753450 ?auto_1753448 ) ( LIFTING ?auto_1753450 ?auto_1753447 ) ( not ( = ?auto_1753452 ?auto_1753450 ) ) ( ON ?auto_1753435 ?auto_1753434 ) ( ON ?auto_1753436 ?auto_1753435 ) ( ON ?auto_1753438 ?auto_1753436 ) ( ON ?auto_1753437 ?auto_1753438 ) ( ON ?auto_1753439 ?auto_1753437 ) ( ON ?auto_1753440 ?auto_1753439 ) ( ON ?auto_1753441 ?auto_1753440 ) ( ON ?auto_1753442 ?auto_1753441 ) ( ON ?auto_1753443 ?auto_1753442 ) ( ON ?auto_1753444 ?auto_1753443 ) ( ON ?auto_1753445 ?auto_1753444 ) ( not ( = ?auto_1753434 ?auto_1753435 ) ) ( not ( = ?auto_1753434 ?auto_1753436 ) ) ( not ( = ?auto_1753434 ?auto_1753438 ) ) ( not ( = ?auto_1753434 ?auto_1753437 ) ) ( not ( = ?auto_1753434 ?auto_1753439 ) ) ( not ( = ?auto_1753434 ?auto_1753440 ) ) ( not ( = ?auto_1753434 ?auto_1753441 ) ) ( not ( = ?auto_1753434 ?auto_1753442 ) ) ( not ( = ?auto_1753434 ?auto_1753443 ) ) ( not ( = ?auto_1753434 ?auto_1753444 ) ) ( not ( = ?auto_1753434 ?auto_1753445 ) ) ( not ( = ?auto_1753434 ?auto_1753446 ) ) ( not ( = ?auto_1753434 ?auto_1753447 ) ) ( not ( = ?auto_1753435 ?auto_1753436 ) ) ( not ( = ?auto_1753435 ?auto_1753438 ) ) ( not ( = ?auto_1753435 ?auto_1753437 ) ) ( not ( = ?auto_1753435 ?auto_1753439 ) ) ( not ( = ?auto_1753435 ?auto_1753440 ) ) ( not ( = ?auto_1753435 ?auto_1753441 ) ) ( not ( = ?auto_1753435 ?auto_1753442 ) ) ( not ( = ?auto_1753435 ?auto_1753443 ) ) ( not ( = ?auto_1753435 ?auto_1753444 ) ) ( not ( = ?auto_1753435 ?auto_1753445 ) ) ( not ( = ?auto_1753435 ?auto_1753446 ) ) ( not ( = ?auto_1753435 ?auto_1753447 ) ) ( not ( = ?auto_1753436 ?auto_1753438 ) ) ( not ( = ?auto_1753436 ?auto_1753437 ) ) ( not ( = ?auto_1753436 ?auto_1753439 ) ) ( not ( = ?auto_1753436 ?auto_1753440 ) ) ( not ( = ?auto_1753436 ?auto_1753441 ) ) ( not ( = ?auto_1753436 ?auto_1753442 ) ) ( not ( = ?auto_1753436 ?auto_1753443 ) ) ( not ( = ?auto_1753436 ?auto_1753444 ) ) ( not ( = ?auto_1753436 ?auto_1753445 ) ) ( not ( = ?auto_1753436 ?auto_1753446 ) ) ( not ( = ?auto_1753436 ?auto_1753447 ) ) ( not ( = ?auto_1753438 ?auto_1753437 ) ) ( not ( = ?auto_1753438 ?auto_1753439 ) ) ( not ( = ?auto_1753438 ?auto_1753440 ) ) ( not ( = ?auto_1753438 ?auto_1753441 ) ) ( not ( = ?auto_1753438 ?auto_1753442 ) ) ( not ( = ?auto_1753438 ?auto_1753443 ) ) ( not ( = ?auto_1753438 ?auto_1753444 ) ) ( not ( = ?auto_1753438 ?auto_1753445 ) ) ( not ( = ?auto_1753438 ?auto_1753446 ) ) ( not ( = ?auto_1753438 ?auto_1753447 ) ) ( not ( = ?auto_1753437 ?auto_1753439 ) ) ( not ( = ?auto_1753437 ?auto_1753440 ) ) ( not ( = ?auto_1753437 ?auto_1753441 ) ) ( not ( = ?auto_1753437 ?auto_1753442 ) ) ( not ( = ?auto_1753437 ?auto_1753443 ) ) ( not ( = ?auto_1753437 ?auto_1753444 ) ) ( not ( = ?auto_1753437 ?auto_1753445 ) ) ( not ( = ?auto_1753437 ?auto_1753446 ) ) ( not ( = ?auto_1753437 ?auto_1753447 ) ) ( not ( = ?auto_1753439 ?auto_1753440 ) ) ( not ( = ?auto_1753439 ?auto_1753441 ) ) ( not ( = ?auto_1753439 ?auto_1753442 ) ) ( not ( = ?auto_1753439 ?auto_1753443 ) ) ( not ( = ?auto_1753439 ?auto_1753444 ) ) ( not ( = ?auto_1753439 ?auto_1753445 ) ) ( not ( = ?auto_1753439 ?auto_1753446 ) ) ( not ( = ?auto_1753439 ?auto_1753447 ) ) ( not ( = ?auto_1753440 ?auto_1753441 ) ) ( not ( = ?auto_1753440 ?auto_1753442 ) ) ( not ( = ?auto_1753440 ?auto_1753443 ) ) ( not ( = ?auto_1753440 ?auto_1753444 ) ) ( not ( = ?auto_1753440 ?auto_1753445 ) ) ( not ( = ?auto_1753440 ?auto_1753446 ) ) ( not ( = ?auto_1753440 ?auto_1753447 ) ) ( not ( = ?auto_1753441 ?auto_1753442 ) ) ( not ( = ?auto_1753441 ?auto_1753443 ) ) ( not ( = ?auto_1753441 ?auto_1753444 ) ) ( not ( = ?auto_1753441 ?auto_1753445 ) ) ( not ( = ?auto_1753441 ?auto_1753446 ) ) ( not ( = ?auto_1753441 ?auto_1753447 ) ) ( not ( = ?auto_1753442 ?auto_1753443 ) ) ( not ( = ?auto_1753442 ?auto_1753444 ) ) ( not ( = ?auto_1753442 ?auto_1753445 ) ) ( not ( = ?auto_1753442 ?auto_1753446 ) ) ( not ( = ?auto_1753442 ?auto_1753447 ) ) ( not ( = ?auto_1753443 ?auto_1753444 ) ) ( not ( = ?auto_1753443 ?auto_1753445 ) ) ( not ( = ?auto_1753443 ?auto_1753446 ) ) ( not ( = ?auto_1753443 ?auto_1753447 ) ) ( not ( = ?auto_1753444 ?auto_1753445 ) ) ( not ( = ?auto_1753444 ?auto_1753446 ) ) ( not ( = ?auto_1753444 ?auto_1753447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753445 ?auto_1753446 ?auto_1753447 )
      ( MAKE-13CRATE-VERIFY ?auto_1753434 ?auto_1753435 ?auto_1753436 ?auto_1753438 ?auto_1753437 ?auto_1753439 ?auto_1753440 ?auto_1753441 ?auto_1753442 ?auto_1753443 ?auto_1753444 ?auto_1753445 ?auto_1753446 ?auto_1753447 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753616 - SURFACE
      ?auto_1753617 - SURFACE
      ?auto_1753618 - SURFACE
      ?auto_1753620 - SURFACE
      ?auto_1753619 - SURFACE
      ?auto_1753621 - SURFACE
      ?auto_1753622 - SURFACE
      ?auto_1753623 - SURFACE
      ?auto_1753624 - SURFACE
      ?auto_1753625 - SURFACE
      ?auto_1753626 - SURFACE
      ?auto_1753627 - SURFACE
      ?auto_1753628 - SURFACE
      ?auto_1753629 - SURFACE
    )
    :vars
    (
      ?auto_1753634 - HOIST
      ?auto_1753631 - PLACE
      ?auto_1753635 - TRUCK
      ?auto_1753633 - PLACE
      ?auto_1753632 - HOIST
      ?auto_1753630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753634 ?auto_1753631 ) ( SURFACE-AT ?auto_1753628 ?auto_1753631 ) ( CLEAR ?auto_1753628 ) ( IS-CRATE ?auto_1753629 ) ( not ( = ?auto_1753628 ?auto_1753629 ) ) ( AVAILABLE ?auto_1753634 ) ( ON ?auto_1753628 ?auto_1753627 ) ( not ( = ?auto_1753627 ?auto_1753628 ) ) ( not ( = ?auto_1753627 ?auto_1753629 ) ) ( TRUCK-AT ?auto_1753635 ?auto_1753633 ) ( not ( = ?auto_1753633 ?auto_1753631 ) ) ( HOIST-AT ?auto_1753632 ?auto_1753633 ) ( not ( = ?auto_1753634 ?auto_1753632 ) ) ( AVAILABLE ?auto_1753632 ) ( SURFACE-AT ?auto_1753629 ?auto_1753633 ) ( ON ?auto_1753629 ?auto_1753630 ) ( CLEAR ?auto_1753629 ) ( not ( = ?auto_1753628 ?auto_1753630 ) ) ( not ( = ?auto_1753629 ?auto_1753630 ) ) ( not ( = ?auto_1753627 ?auto_1753630 ) ) ( ON ?auto_1753617 ?auto_1753616 ) ( ON ?auto_1753618 ?auto_1753617 ) ( ON ?auto_1753620 ?auto_1753618 ) ( ON ?auto_1753619 ?auto_1753620 ) ( ON ?auto_1753621 ?auto_1753619 ) ( ON ?auto_1753622 ?auto_1753621 ) ( ON ?auto_1753623 ?auto_1753622 ) ( ON ?auto_1753624 ?auto_1753623 ) ( ON ?auto_1753625 ?auto_1753624 ) ( ON ?auto_1753626 ?auto_1753625 ) ( ON ?auto_1753627 ?auto_1753626 ) ( not ( = ?auto_1753616 ?auto_1753617 ) ) ( not ( = ?auto_1753616 ?auto_1753618 ) ) ( not ( = ?auto_1753616 ?auto_1753620 ) ) ( not ( = ?auto_1753616 ?auto_1753619 ) ) ( not ( = ?auto_1753616 ?auto_1753621 ) ) ( not ( = ?auto_1753616 ?auto_1753622 ) ) ( not ( = ?auto_1753616 ?auto_1753623 ) ) ( not ( = ?auto_1753616 ?auto_1753624 ) ) ( not ( = ?auto_1753616 ?auto_1753625 ) ) ( not ( = ?auto_1753616 ?auto_1753626 ) ) ( not ( = ?auto_1753616 ?auto_1753627 ) ) ( not ( = ?auto_1753616 ?auto_1753628 ) ) ( not ( = ?auto_1753616 ?auto_1753629 ) ) ( not ( = ?auto_1753616 ?auto_1753630 ) ) ( not ( = ?auto_1753617 ?auto_1753618 ) ) ( not ( = ?auto_1753617 ?auto_1753620 ) ) ( not ( = ?auto_1753617 ?auto_1753619 ) ) ( not ( = ?auto_1753617 ?auto_1753621 ) ) ( not ( = ?auto_1753617 ?auto_1753622 ) ) ( not ( = ?auto_1753617 ?auto_1753623 ) ) ( not ( = ?auto_1753617 ?auto_1753624 ) ) ( not ( = ?auto_1753617 ?auto_1753625 ) ) ( not ( = ?auto_1753617 ?auto_1753626 ) ) ( not ( = ?auto_1753617 ?auto_1753627 ) ) ( not ( = ?auto_1753617 ?auto_1753628 ) ) ( not ( = ?auto_1753617 ?auto_1753629 ) ) ( not ( = ?auto_1753617 ?auto_1753630 ) ) ( not ( = ?auto_1753618 ?auto_1753620 ) ) ( not ( = ?auto_1753618 ?auto_1753619 ) ) ( not ( = ?auto_1753618 ?auto_1753621 ) ) ( not ( = ?auto_1753618 ?auto_1753622 ) ) ( not ( = ?auto_1753618 ?auto_1753623 ) ) ( not ( = ?auto_1753618 ?auto_1753624 ) ) ( not ( = ?auto_1753618 ?auto_1753625 ) ) ( not ( = ?auto_1753618 ?auto_1753626 ) ) ( not ( = ?auto_1753618 ?auto_1753627 ) ) ( not ( = ?auto_1753618 ?auto_1753628 ) ) ( not ( = ?auto_1753618 ?auto_1753629 ) ) ( not ( = ?auto_1753618 ?auto_1753630 ) ) ( not ( = ?auto_1753620 ?auto_1753619 ) ) ( not ( = ?auto_1753620 ?auto_1753621 ) ) ( not ( = ?auto_1753620 ?auto_1753622 ) ) ( not ( = ?auto_1753620 ?auto_1753623 ) ) ( not ( = ?auto_1753620 ?auto_1753624 ) ) ( not ( = ?auto_1753620 ?auto_1753625 ) ) ( not ( = ?auto_1753620 ?auto_1753626 ) ) ( not ( = ?auto_1753620 ?auto_1753627 ) ) ( not ( = ?auto_1753620 ?auto_1753628 ) ) ( not ( = ?auto_1753620 ?auto_1753629 ) ) ( not ( = ?auto_1753620 ?auto_1753630 ) ) ( not ( = ?auto_1753619 ?auto_1753621 ) ) ( not ( = ?auto_1753619 ?auto_1753622 ) ) ( not ( = ?auto_1753619 ?auto_1753623 ) ) ( not ( = ?auto_1753619 ?auto_1753624 ) ) ( not ( = ?auto_1753619 ?auto_1753625 ) ) ( not ( = ?auto_1753619 ?auto_1753626 ) ) ( not ( = ?auto_1753619 ?auto_1753627 ) ) ( not ( = ?auto_1753619 ?auto_1753628 ) ) ( not ( = ?auto_1753619 ?auto_1753629 ) ) ( not ( = ?auto_1753619 ?auto_1753630 ) ) ( not ( = ?auto_1753621 ?auto_1753622 ) ) ( not ( = ?auto_1753621 ?auto_1753623 ) ) ( not ( = ?auto_1753621 ?auto_1753624 ) ) ( not ( = ?auto_1753621 ?auto_1753625 ) ) ( not ( = ?auto_1753621 ?auto_1753626 ) ) ( not ( = ?auto_1753621 ?auto_1753627 ) ) ( not ( = ?auto_1753621 ?auto_1753628 ) ) ( not ( = ?auto_1753621 ?auto_1753629 ) ) ( not ( = ?auto_1753621 ?auto_1753630 ) ) ( not ( = ?auto_1753622 ?auto_1753623 ) ) ( not ( = ?auto_1753622 ?auto_1753624 ) ) ( not ( = ?auto_1753622 ?auto_1753625 ) ) ( not ( = ?auto_1753622 ?auto_1753626 ) ) ( not ( = ?auto_1753622 ?auto_1753627 ) ) ( not ( = ?auto_1753622 ?auto_1753628 ) ) ( not ( = ?auto_1753622 ?auto_1753629 ) ) ( not ( = ?auto_1753622 ?auto_1753630 ) ) ( not ( = ?auto_1753623 ?auto_1753624 ) ) ( not ( = ?auto_1753623 ?auto_1753625 ) ) ( not ( = ?auto_1753623 ?auto_1753626 ) ) ( not ( = ?auto_1753623 ?auto_1753627 ) ) ( not ( = ?auto_1753623 ?auto_1753628 ) ) ( not ( = ?auto_1753623 ?auto_1753629 ) ) ( not ( = ?auto_1753623 ?auto_1753630 ) ) ( not ( = ?auto_1753624 ?auto_1753625 ) ) ( not ( = ?auto_1753624 ?auto_1753626 ) ) ( not ( = ?auto_1753624 ?auto_1753627 ) ) ( not ( = ?auto_1753624 ?auto_1753628 ) ) ( not ( = ?auto_1753624 ?auto_1753629 ) ) ( not ( = ?auto_1753624 ?auto_1753630 ) ) ( not ( = ?auto_1753625 ?auto_1753626 ) ) ( not ( = ?auto_1753625 ?auto_1753627 ) ) ( not ( = ?auto_1753625 ?auto_1753628 ) ) ( not ( = ?auto_1753625 ?auto_1753629 ) ) ( not ( = ?auto_1753625 ?auto_1753630 ) ) ( not ( = ?auto_1753626 ?auto_1753627 ) ) ( not ( = ?auto_1753626 ?auto_1753628 ) ) ( not ( = ?auto_1753626 ?auto_1753629 ) ) ( not ( = ?auto_1753626 ?auto_1753630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753627 ?auto_1753628 ?auto_1753629 )
      ( MAKE-13CRATE-VERIFY ?auto_1753616 ?auto_1753617 ?auto_1753618 ?auto_1753620 ?auto_1753619 ?auto_1753621 ?auto_1753622 ?auto_1753623 ?auto_1753624 ?auto_1753625 ?auto_1753626 ?auto_1753627 ?auto_1753628 ?auto_1753629 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753799 - SURFACE
      ?auto_1753800 - SURFACE
      ?auto_1753801 - SURFACE
      ?auto_1753803 - SURFACE
      ?auto_1753802 - SURFACE
      ?auto_1753804 - SURFACE
      ?auto_1753805 - SURFACE
      ?auto_1753806 - SURFACE
      ?auto_1753807 - SURFACE
      ?auto_1753808 - SURFACE
      ?auto_1753809 - SURFACE
      ?auto_1753810 - SURFACE
      ?auto_1753811 - SURFACE
      ?auto_1753812 - SURFACE
    )
    :vars
    (
      ?auto_1753816 - HOIST
      ?auto_1753814 - PLACE
      ?auto_1753817 - PLACE
      ?auto_1753815 - HOIST
      ?auto_1753813 - SURFACE
      ?auto_1753818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753816 ?auto_1753814 ) ( SURFACE-AT ?auto_1753811 ?auto_1753814 ) ( CLEAR ?auto_1753811 ) ( IS-CRATE ?auto_1753812 ) ( not ( = ?auto_1753811 ?auto_1753812 ) ) ( AVAILABLE ?auto_1753816 ) ( ON ?auto_1753811 ?auto_1753810 ) ( not ( = ?auto_1753810 ?auto_1753811 ) ) ( not ( = ?auto_1753810 ?auto_1753812 ) ) ( not ( = ?auto_1753817 ?auto_1753814 ) ) ( HOIST-AT ?auto_1753815 ?auto_1753817 ) ( not ( = ?auto_1753816 ?auto_1753815 ) ) ( AVAILABLE ?auto_1753815 ) ( SURFACE-AT ?auto_1753812 ?auto_1753817 ) ( ON ?auto_1753812 ?auto_1753813 ) ( CLEAR ?auto_1753812 ) ( not ( = ?auto_1753811 ?auto_1753813 ) ) ( not ( = ?auto_1753812 ?auto_1753813 ) ) ( not ( = ?auto_1753810 ?auto_1753813 ) ) ( TRUCK-AT ?auto_1753818 ?auto_1753814 ) ( ON ?auto_1753800 ?auto_1753799 ) ( ON ?auto_1753801 ?auto_1753800 ) ( ON ?auto_1753803 ?auto_1753801 ) ( ON ?auto_1753802 ?auto_1753803 ) ( ON ?auto_1753804 ?auto_1753802 ) ( ON ?auto_1753805 ?auto_1753804 ) ( ON ?auto_1753806 ?auto_1753805 ) ( ON ?auto_1753807 ?auto_1753806 ) ( ON ?auto_1753808 ?auto_1753807 ) ( ON ?auto_1753809 ?auto_1753808 ) ( ON ?auto_1753810 ?auto_1753809 ) ( not ( = ?auto_1753799 ?auto_1753800 ) ) ( not ( = ?auto_1753799 ?auto_1753801 ) ) ( not ( = ?auto_1753799 ?auto_1753803 ) ) ( not ( = ?auto_1753799 ?auto_1753802 ) ) ( not ( = ?auto_1753799 ?auto_1753804 ) ) ( not ( = ?auto_1753799 ?auto_1753805 ) ) ( not ( = ?auto_1753799 ?auto_1753806 ) ) ( not ( = ?auto_1753799 ?auto_1753807 ) ) ( not ( = ?auto_1753799 ?auto_1753808 ) ) ( not ( = ?auto_1753799 ?auto_1753809 ) ) ( not ( = ?auto_1753799 ?auto_1753810 ) ) ( not ( = ?auto_1753799 ?auto_1753811 ) ) ( not ( = ?auto_1753799 ?auto_1753812 ) ) ( not ( = ?auto_1753799 ?auto_1753813 ) ) ( not ( = ?auto_1753800 ?auto_1753801 ) ) ( not ( = ?auto_1753800 ?auto_1753803 ) ) ( not ( = ?auto_1753800 ?auto_1753802 ) ) ( not ( = ?auto_1753800 ?auto_1753804 ) ) ( not ( = ?auto_1753800 ?auto_1753805 ) ) ( not ( = ?auto_1753800 ?auto_1753806 ) ) ( not ( = ?auto_1753800 ?auto_1753807 ) ) ( not ( = ?auto_1753800 ?auto_1753808 ) ) ( not ( = ?auto_1753800 ?auto_1753809 ) ) ( not ( = ?auto_1753800 ?auto_1753810 ) ) ( not ( = ?auto_1753800 ?auto_1753811 ) ) ( not ( = ?auto_1753800 ?auto_1753812 ) ) ( not ( = ?auto_1753800 ?auto_1753813 ) ) ( not ( = ?auto_1753801 ?auto_1753803 ) ) ( not ( = ?auto_1753801 ?auto_1753802 ) ) ( not ( = ?auto_1753801 ?auto_1753804 ) ) ( not ( = ?auto_1753801 ?auto_1753805 ) ) ( not ( = ?auto_1753801 ?auto_1753806 ) ) ( not ( = ?auto_1753801 ?auto_1753807 ) ) ( not ( = ?auto_1753801 ?auto_1753808 ) ) ( not ( = ?auto_1753801 ?auto_1753809 ) ) ( not ( = ?auto_1753801 ?auto_1753810 ) ) ( not ( = ?auto_1753801 ?auto_1753811 ) ) ( not ( = ?auto_1753801 ?auto_1753812 ) ) ( not ( = ?auto_1753801 ?auto_1753813 ) ) ( not ( = ?auto_1753803 ?auto_1753802 ) ) ( not ( = ?auto_1753803 ?auto_1753804 ) ) ( not ( = ?auto_1753803 ?auto_1753805 ) ) ( not ( = ?auto_1753803 ?auto_1753806 ) ) ( not ( = ?auto_1753803 ?auto_1753807 ) ) ( not ( = ?auto_1753803 ?auto_1753808 ) ) ( not ( = ?auto_1753803 ?auto_1753809 ) ) ( not ( = ?auto_1753803 ?auto_1753810 ) ) ( not ( = ?auto_1753803 ?auto_1753811 ) ) ( not ( = ?auto_1753803 ?auto_1753812 ) ) ( not ( = ?auto_1753803 ?auto_1753813 ) ) ( not ( = ?auto_1753802 ?auto_1753804 ) ) ( not ( = ?auto_1753802 ?auto_1753805 ) ) ( not ( = ?auto_1753802 ?auto_1753806 ) ) ( not ( = ?auto_1753802 ?auto_1753807 ) ) ( not ( = ?auto_1753802 ?auto_1753808 ) ) ( not ( = ?auto_1753802 ?auto_1753809 ) ) ( not ( = ?auto_1753802 ?auto_1753810 ) ) ( not ( = ?auto_1753802 ?auto_1753811 ) ) ( not ( = ?auto_1753802 ?auto_1753812 ) ) ( not ( = ?auto_1753802 ?auto_1753813 ) ) ( not ( = ?auto_1753804 ?auto_1753805 ) ) ( not ( = ?auto_1753804 ?auto_1753806 ) ) ( not ( = ?auto_1753804 ?auto_1753807 ) ) ( not ( = ?auto_1753804 ?auto_1753808 ) ) ( not ( = ?auto_1753804 ?auto_1753809 ) ) ( not ( = ?auto_1753804 ?auto_1753810 ) ) ( not ( = ?auto_1753804 ?auto_1753811 ) ) ( not ( = ?auto_1753804 ?auto_1753812 ) ) ( not ( = ?auto_1753804 ?auto_1753813 ) ) ( not ( = ?auto_1753805 ?auto_1753806 ) ) ( not ( = ?auto_1753805 ?auto_1753807 ) ) ( not ( = ?auto_1753805 ?auto_1753808 ) ) ( not ( = ?auto_1753805 ?auto_1753809 ) ) ( not ( = ?auto_1753805 ?auto_1753810 ) ) ( not ( = ?auto_1753805 ?auto_1753811 ) ) ( not ( = ?auto_1753805 ?auto_1753812 ) ) ( not ( = ?auto_1753805 ?auto_1753813 ) ) ( not ( = ?auto_1753806 ?auto_1753807 ) ) ( not ( = ?auto_1753806 ?auto_1753808 ) ) ( not ( = ?auto_1753806 ?auto_1753809 ) ) ( not ( = ?auto_1753806 ?auto_1753810 ) ) ( not ( = ?auto_1753806 ?auto_1753811 ) ) ( not ( = ?auto_1753806 ?auto_1753812 ) ) ( not ( = ?auto_1753806 ?auto_1753813 ) ) ( not ( = ?auto_1753807 ?auto_1753808 ) ) ( not ( = ?auto_1753807 ?auto_1753809 ) ) ( not ( = ?auto_1753807 ?auto_1753810 ) ) ( not ( = ?auto_1753807 ?auto_1753811 ) ) ( not ( = ?auto_1753807 ?auto_1753812 ) ) ( not ( = ?auto_1753807 ?auto_1753813 ) ) ( not ( = ?auto_1753808 ?auto_1753809 ) ) ( not ( = ?auto_1753808 ?auto_1753810 ) ) ( not ( = ?auto_1753808 ?auto_1753811 ) ) ( not ( = ?auto_1753808 ?auto_1753812 ) ) ( not ( = ?auto_1753808 ?auto_1753813 ) ) ( not ( = ?auto_1753809 ?auto_1753810 ) ) ( not ( = ?auto_1753809 ?auto_1753811 ) ) ( not ( = ?auto_1753809 ?auto_1753812 ) ) ( not ( = ?auto_1753809 ?auto_1753813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753810 ?auto_1753811 ?auto_1753812 )
      ( MAKE-13CRATE-VERIFY ?auto_1753799 ?auto_1753800 ?auto_1753801 ?auto_1753803 ?auto_1753802 ?auto_1753804 ?auto_1753805 ?auto_1753806 ?auto_1753807 ?auto_1753808 ?auto_1753809 ?auto_1753810 ?auto_1753811 ?auto_1753812 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753982 - SURFACE
      ?auto_1753983 - SURFACE
      ?auto_1753984 - SURFACE
      ?auto_1753986 - SURFACE
      ?auto_1753985 - SURFACE
      ?auto_1753987 - SURFACE
      ?auto_1753988 - SURFACE
      ?auto_1753989 - SURFACE
      ?auto_1753990 - SURFACE
      ?auto_1753991 - SURFACE
      ?auto_1753992 - SURFACE
      ?auto_1753993 - SURFACE
      ?auto_1753994 - SURFACE
      ?auto_1753995 - SURFACE
    )
    :vars
    (
      ?auto_1753998 - HOIST
      ?auto_1753996 - PLACE
      ?auto_1753997 - PLACE
      ?auto_1754000 - HOIST
      ?auto_1754001 - SURFACE
      ?auto_1753999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753998 ?auto_1753996 ) ( IS-CRATE ?auto_1753995 ) ( not ( = ?auto_1753994 ?auto_1753995 ) ) ( not ( = ?auto_1753993 ?auto_1753994 ) ) ( not ( = ?auto_1753993 ?auto_1753995 ) ) ( not ( = ?auto_1753997 ?auto_1753996 ) ) ( HOIST-AT ?auto_1754000 ?auto_1753997 ) ( not ( = ?auto_1753998 ?auto_1754000 ) ) ( AVAILABLE ?auto_1754000 ) ( SURFACE-AT ?auto_1753995 ?auto_1753997 ) ( ON ?auto_1753995 ?auto_1754001 ) ( CLEAR ?auto_1753995 ) ( not ( = ?auto_1753994 ?auto_1754001 ) ) ( not ( = ?auto_1753995 ?auto_1754001 ) ) ( not ( = ?auto_1753993 ?auto_1754001 ) ) ( TRUCK-AT ?auto_1753999 ?auto_1753996 ) ( SURFACE-AT ?auto_1753993 ?auto_1753996 ) ( CLEAR ?auto_1753993 ) ( LIFTING ?auto_1753998 ?auto_1753994 ) ( IS-CRATE ?auto_1753994 ) ( ON ?auto_1753983 ?auto_1753982 ) ( ON ?auto_1753984 ?auto_1753983 ) ( ON ?auto_1753986 ?auto_1753984 ) ( ON ?auto_1753985 ?auto_1753986 ) ( ON ?auto_1753987 ?auto_1753985 ) ( ON ?auto_1753988 ?auto_1753987 ) ( ON ?auto_1753989 ?auto_1753988 ) ( ON ?auto_1753990 ?auto_1753989 ) ( ON ?auto_1753991 ?auto_1753990 ) ( ON ?auto_1753992 ?auto_1753991 ) ( ON ?auto_1753993 ?auto_1753992 ) ( not ( = ?auto_1753982 ?auto_1753983 ) ) ( not ( = ?auto_1753982 ?auto_1753984 ) ) ( not ( = ?auto_1753982 ?auto_1753986 ) ) ( not ( = ?auto_1753982 ?auto_1753985 ) ) ( not ( = ?auto_1753982 ?auto_1753987 ) ) ( not ( = ?auto_1753982 ?auto_1753988 ) ) ( not ( = ?auto_1753982 ?auto_1753989 ) ) ( not ( = ?auto_1753982 ?auto_1753990 ) ) ( not ( = ?auto_1753982 ?auto_1753991 ) ) ( not ( = ?auto_1753982 ?auto_1753992 ) ) ( not ( = ?auto_1753982 ?auto_1753993 ) ) ( not ( = ?auto_1753982 ?auto_1753994 ) ) ( not ( = ?auto_1753982 ?auto_1753995 ) ) ( not ( = ?auto_1753982 ?auto_1754001 ) ) ( not ( = ?auto_1753983 ?auto_1753984 ) ) ( not ( = ?auto_1753983 ?auto_1753986 ) ) ( not ( = ?auto_1753983 ?auto_1753985 ) ) ( not ( = ?auto_1753983 ?auto_1753987 ) ) ( not ( = ?auto_1753983 ?auto_1753988 ) ) ( not ( = ?auto_1753983 ?auto_1753989 ) ) ( not ( = ?auto_1753983 ?auto_1753990 ) ) ( not ( = ?auto_1753983 ?auto_1753991 ) ) ( not ( = ?auto_1753983 ?auto_1753992 ) ) ( not ( = ?auto_1753983 ?auto_1753993 ) ) ( not ( = ?auto_1753983 ?auto_1753994 ) ) ( not ( = ?auto_1753983 ?auto_1753995 ) ) ( not ( = ?auto_1753983 ?auto_1754001 ) ) ( not ( = ?auto_1753984 ?auto_1753986 ) ) ( not ( = ?auto_1753984 ?auto_1753985 ) ) ( not ( = ?auto_1753984 ?auto_1753987 ) ) ( not ( = ?auto_1753984 ?auto_1753988 ) ) ( not ( = ?auto_1753984 ?auto_1753989 ) ) ( not ( = ?auto_1753984 ?auto_1753990 ) ) ( not ( = ?auto_1753984 ?auto_1753991 ) ) ( not ( = ?auto_1753984 ?auto_1753992 ) ) ( not ( = ?auto_1753984 ?auto_1753993 ) ) ( not ( = ?auto_1753984 ?auto_1753994 ) ) ( not ( = ?auto_1753984 ?auto_1753995 ) ) ( not ( = ?auto_1753984 ?auto_1754001 ) ) ( not ( = ?auto_1753986 ?auto_1753985 ) ) ( not ( = ?auto_1753986 ?auto_1753987 ) ) ( not ( = ?auto_1753986 ?auto_1753988 ) ) ( not ( = ?auto_1753986 ?auto_1753989 ) ) ( not ( = ?auto_1753986 ?auto_1753990 ) ) ( not ( = ?auto_1753986 ?auto_1753991 ) ) ( not ( = ?auto_1753986 ?auto_1753992 ) ) ( not ( = ?auto_1753986 ?auto_1753993 ) ) ( not ( = ?auto_1753986 ?auto_1753994 ) ) ( not ( = ?auto_1753986 ?auto_1753995 ) ) ( not ( = ?auto_1753986 ?auto_1754001 ) ) ( not ( = ?auto_1753985 ?auto_1753987 ) ) ( not ( = ?auto_1753985 ?auto_1753988 ) ) ( not ( = ?auto_1753985 ?auto_1753989 ) ) ( not ( = ?auto_1753985 ?auto_1753990 ) ) ( not ( = ?auto_1753985 ?auto_1753991 ) ) ( not ( = ?auto_1753985 ?auto_1753992 ) ) ( not ( = ?auto_1753985 ?auto_1753993 ) ) ( not ( = ?auto_1753985 ?auto_1753994 ) ) ( not ( = ?auto_1753985 ?auto_1753995 ) ) ( not ( = ?auto_1753985 ?auto_1754001 ) ) ( not ( = ?auto_1753987 ?auto_1753988 ) ) ( not ( = ?auto_1753987 ?auto_1753989 ) ) ( not ( = ?auto_1753987 ?auto_1753990 ) ) ( not ( = ?auto_1753987 ?auto_1753991 ) ) ( not ( = ?auto_1753987 ?auto_1753992 ) ) ( not ( = ?auto_1753987 ?auto_1753993 ) ) ( not ( = ?auto_1753987 ?auto_1753994 ) ) ( not ( = ?auto_1753987 ?auto_1753995 ) ) ( not ( = ?auto_1753987 ?auto_1754001 ) ) ( not ( = ?auto_1753988 ?auto_1753989 ) ) ( not ( = ?auto_1753988 ?auto_1753990 ) ) ( not ( = ?auto_1753988 ?auto_1753991 ) ) ( not ( = ?auto_1753988 ?auto_1753992 ) ) ( not ( = ?auto_1753988 ?auto_1753993 ) ) ( not ( = ?auto_1753988 ?auto_1753994 ) ) ( not ( = ?auto_1753988 ?auto_1753995 ) ) ( not ( = ?auto_1753988 ?auto_1754001 ) ) ( not ( = ?auto_1753989 ?auto_1753990 ) ) ( not ( = ?auto_1753989 ?auto_1753991 ) ) ( not ( = ?auto_1753989 ?auto_1753992 ) ) ( not ( = ?auto_1753989 ?auto_1753993 ) ) ( not ( = ?auto_1753989 ?auto_1753994 ) ) ( not ( = ?auto_1753989 ?auto_1753995 ) ) ( not ( = ?auto_1753989 ?auto_1754001 ) ) ( not ( = ?auto_1753990 ?auto_1753991 ) ) ( not ( = ?auto_1753990 ?auto_1753992 ) ) ( not ( = ?auto_1753990 ?auto_1753993 ) ) ( not ( = ?auto_1753990 ?auto_1753994 ) ) ( not ( = ?auto_1753990 ?auto_1753995 ) ) ( not ( = ?auto_1753990 ?auto_1754001 ) ) ( not ( = ?auto_1753991 ?auto_1753992 ) ) ( not ( = ?auto_1753991 ?auto_1753993 ) ) ( not ( = ?auto_1753991 ?auto_1753994 ) ) ( not ( = ?auto_1753991 ?auto_1753995 ) ) ( not ( = ?auto_1753991 ?auto_1754001 ) ) ( not ( = ?auto_1753992 ?auto_1753993 ) ) ( not ( = ?auto_1753992 ?auto_1753994 ) ) ( not ( = ?auto_1753992 ?auto_1753995 ) ) ( not ( = ?auto_1753992 ?auto_1754001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753993 ?auto_1753994 ?auto_1753995 )
      ( MAKE-13CRATE-VERIFY ?auto_1753982 ?auto_1753983 ?auto_1753984 ?auto_1753986 ?auto_1753985 ?auto_1753987 ?auto_1753988 ?auto_1753989 ?auto_1753990 ?auto_1753991 ?auto_1753992 ?auto_1753993 ?auto_1753994 ?auto_1753995 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754165 - SURFACE
      ?auto_1754166 - SURFACE
      ?auto_1754167 - SURFACE
      ?auto_1754169 - SURFACE
      ?auto_1754168 - SURFACE
      ?auto_1754170 - SURFACE
      ?auto_1754171 - SURFACE
      ?auto_1754172 - SURFACE
      ?auto_1754173 - SURFACE
      ?auto_1754174 - SURFACE
      ?auto_1754175 - SURFACE
      ?auto_1754176 - SURFACE
      ?auto_1754177 - SURFACE
      ?auto_1754178 - SURFACE
    )
    :vars
    (
      ?auto_1754182 - HOIST
      ?auto_1754181 - PLACE
      ?auto_1754179 - PLACE
      ?auto_1754184 - HOIST
      ?auto_1754180 - SURFACE
      ?auto_1754183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754182 ?auto_1754181 ) ( IS-CRATE ?auto_1754178 ) ( not ( = ?auto_1754177 ?auto_1754178 ) ) ( not ( = ?auto_1754176 ?auto_1754177 ) ) ( not ( = ?auto_1754176 ?auto_1754178 ) ) ( not ( = ?auto_1754179 ?auto_1754181 ) ) ( HOIST-AT ?auto_1754184 ?auto_1754179 ) ( not ( = ?auto_1754182 ?auto_1754184 ) ) ( AVAILABLE ?auto_1754184 ) ( SURFACE-AT ?auto_1754178 ?auto_1754179 ) ( ON ?auto_1754178 ?auto_1754180 ) ( CLEAR ?auto_1754178 ) ( not ( = ?auto_1754177 ?auto_1754180 ) ) ( not ( = ?auto_1754178 ?auto_1754180 ) ) ( not ( = ?auto_1754176 ?auto_1754180 ) ) ( TRUCK-AT ?auto_1754183 ?auto_1754181 ) ( SURFACE-AT ?auto_1754176 ?auto_1754181 ) ( CLEAR ?auto_1754176 ) ( IS-CRATE ?auto_1754177 ) ( AVAILABLE ?auto_1754182 ) ( IN ?auto_1754177 ?auto_1754183 ) ( ON ?auto_1754166 ?auto_1754165 ) ( ON ?auto_1754167 ?auto_1754166 ) ( ON ?auto_1754169 ?auto_1754167 ) ( ON ?auto_1754168 ?auto_1754169 ) ( ON ?auto_1754170 ?auto_1754168 ) ( ON ?auto_1754171 ?auto_1754170 ) ( ON ?auto_1754172 ?auto_1754171 ) ( ON ?auto_1754173 ?auto_1754172 ) ( ON ?auto_1754174 ?auto_1754173 ) ( ON ?auto_1754175 ?auto_1754174 ) ( ON ?auto_1754176 ?auto_1754175 ) ( not ( = ?auto_1754165 ?auto_1754166 ) ) ( not ( = ?auto_1754165 ?auto_1754167 ) ) ( not ( = ?auto_1754165 ?auto_1754169 ) ) ( not ( = ?auto_1754165 ?auto_1754168 ) ) ( not ( = ?auto_1754165 ?auto_1754170 ) ) ( not ( = ?auto_1754165 ?auto_1754171 ) ) ( not ( = ?auto_1754165 ?auto_1754172 ) ) ( not ( = ?auto_1754165 ?auto_1754173 ) ) ( not ( = ?auto_1754165 ?auto_1754174 ) ) ( not ( = ?auto_1754165 ?auto_1754175 ) ) ( not ( = ?auto_1754165 ?auto_1754176 ) ) ( not ( = ?auto_1754165 ?auto_1754177 ) ) ( not ( = ?auto_1754165 ?auto_1754178 ) ) ( not ( = ?auto_1754165 ?auto_1754180 ) ) ( not ( = ?auto_1754166 ?auto_1754167 ) ) ( not ( = ?auto_1754166 ?auto_1754169 ) ) ( not ( = ?auto_1754166 ?auto_1754168 ) ) ( not ( = ?auto_1754166 ?auto_1754170 ) ) ( not ( = ?auto_1754166 ?auto_1754171 ) ) ( not ( = ?auto_1754166 ?auto_1754172 ) ) ( not ( = ?auto_1754166 ?auto_1754173 ) ) ( not ( = ?auto_1754166 ?auto_1754174 ) ) ( not ( = ?auto_1754166 ?auto_1754175 ) ) ( not ( = ?auto_1754166 ?auto_1754176 ) ) ( not ( = ?auto_1754166 ?auto_1754177 ) ) ( not ( = ?auto_1754166 ?auto_1754178 ) ) ( not ( = ?auto_1754166 ?auto_1754180 ) ) ( not ( = ?auto_1754167 ?auto_1754169 ) ) ( not ( = ?auto_1754167 ?auto_1754168 ) ) ( not ( = ?auto_1754167 ?auto_1754170 ) ) ( not ( = ?auto_1754167 ?auto_1754171 ) ) ( not ( = ?auto_1754167 ?auto_1754172 ) ) ( not ( = ?auto_1754167 ?auto_1754173 ) ) ( not ( = ?auto_1754167 ?auto_1754174 ) ) ( not ( = ?auto_1754167 ?auto_1754175 ) ) ( not ( = ?auto_1754167 ?auto_1754176 ) ) ( not ( = ?auto_1754167 ?auto_1754177 ) ) ( not ( = ?auto_1754167 ?auto_1754178 ) ) ( not ( = ?auto_1754167 ?auto_1754180 ) ) ( not ( = ?auto_1754169 ?auto_1754168 ) ) ( not ( = ?auto_1754169 ?auto_1754170 ) ) ( not ( = ?auto_1754169 ?auto_1754171 ) ) ( not ( = ?auto_1754169 ?auto_1754172 ) ) ( not ( = ?auto_1754169 ?auto_1754173 ) ) ( not ( = ?auto_1754169 ?auto_1754174 ) ) ( not ( = ?auto_1754169 ?auto_1754175 ) ) ( not ( = ?auto_1754169 ?auto_1754176 ) ) ( not ( = ?auto_1754169 ?auto_1754177 ) ) ( not ( = ?auto_1754169 ?auto_1754178 ) ) ( not ( = ?auto_1754169 ?auto_1754180 ) ) ( not ( = ?auto_1754168 ?auto_1754170 ) ) ( not ( = ?auto_1754168 ?auto_1754171 ) ) ( not ( = ?auto_1754168 ?auto_1754172 ) ) ( not ( = ?auto_1754168 ?auto_1754173 ) ) ( not ( = ?auto_1754168 ?auto_1754174 ) ) ( not ( = ?auto_1754168 ?auto_1754175 ) ) ( not ( = ?auto_1754168 ?auto_1754176 ) ) ( not ( = ?auto_1754168 ?auto_1754177 ) ) ( not ( = ?auto_1754168 ?auto_1754178 ) ) ( not ( = ?auto_1754168 ?auto_1754180 ) ) ( not ( = ?auto_1754170 ?auto_1754171 ) ) ( not ( = ?auto_1754170 ?auto_1754172 ) ) ( not ( = ?auto_1754170 ?auto_1754173 ) ) ( not ( = ?auto_1754170 ?auto_1754174 ) ) ( not ( = ?auto_1754170 ?auto_1754175 ) ) ( not ( = ?auto_1754170 ?auto_1754176 ) ) ( not ( = ?auto_1754170 ?auto_1754177 ) ) ( not ( = ?auto_1754170 ?auto_1754178 ) ) ( not ( = ?auto_1754170 ?auto_1754180 ) ) ( not ( = ?auto_1754171 ?auto_1754172 ) ) ( not ( = ?auto_1754171 ?auto_1754173 ) ) ( not ( = ?auto_1754171 ?auto_1754174 ) ) ( not ( = ?auto_1754171 ?auto_1754175 ) ) ( not ( = ?auto_1754171 ?auto_1754176 ) ) ( not ( = ?auto_1754171 ?auto_1754177 ) ) ( not ( = ?auto_1754171 ?auto_1754178 ) ) ( not ( = ?auto_1754171 ?auto_1754180 ) ) ( not ( = ?auto_1754172 ?auto_1754173 ) ) ( not ( = ?auto_1754172 ?auto_1754174 ) ) ( not ( = ?auto_1754172 ?auto_1754175 ) ) ( not ( = ?auto_1754172 ?auto_1754176 ) ) ( not ( = ?auto_1754172 ?auto_1754177 ) ) ( not ( = ?auto_1754172 ?auto_1754178 ) ) ( not ( = ?auto_1754172 ?auto_1754180 ) ) ( not ( = ?auto_1754173 ?auto_1754174 ) ) ( not ( = ?auto_1754173 ?auto_1754175 ) ) ( not ( = ?auto_1754173 ?auto_1754176 ) ) ( not ( = ?auto_1754173 ?auto_1754177 ) ) ( not ( = ?auto_1754173 ?auto_1754178 ) ) ( not ( = ?auto_1754173 ?auto_1754180 ) ) ( not ( = ?auto_1754174 ?auto_1754175 ) ) ( not ( = ?auto_1754174 ?auto_1754176 ) ) ( not ( = ?auto_1754174 ?auto_1754177 ) ) ( not ( = ?auto_1754174 ?auto_1754178 ) ) ( not ( = ?auto_1754174 ?auto_1754180 ) ) ( not ( = ?auto_1754175 ?auto_1754176 ) ) ( not ( = ?auto_1754175 ?auto_1754177 ) ) ( not ( = ?auto_1754175 ?auto_1754178 ) ) ( not ( = ?auto_1754175 ?auto_1754180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754176 ?auto_1754177 ?auto_1754178 )
      ( MAKE-13CRATE-VERIFY ?auto_1754165 ?auto_1754166 ?auto_1754167 ?auto_1754169 ?auto_1754168 ?auto_1754170 ?auto_1754171 ?auto_1754172 ?auto_1754173 ?auto_1754174 ?auto_1754175 ?auto_1754176 ?auto_1754177 ?auto_1754178 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1768385 - SURFACE
      ?auto_1768386 - SURFACE
      ?auto_1768387 - SURFACE
      ?auto_1768389 - SURFACE
      ?auto_1768388 - SURFACE
      ?auto_1768390 - SURFACE
      ?auto_1768391 - SURFACE
      ?auto_1768392 - SURFACE
      ?auto_1768393 - SURFACE
      ?auto_1768394 - SURFACE
      ?auto_1768395 - SURFACE
      ?auto_1768396 - SURFACE
      ?auto_1768397 - SURFACE
      ?auto_1768398 - SURFACE
      ?auto_1768399 - SURFACE
    )
    :vars
    (
      ?auto_1768400 - HOIST
      ?auto_1768401 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1768400 ?auto_1768401 ) ( SURFACE-AT ?auto_1768398 ?auto_1768401 ) ( CLEAR ?auto_1768398 ) ( LIFTING ?auto_1768400 ?auto_1768399 ) ( IS-CRATE ?auto_1768399 ) ( not ( = ?auto_1768398 ?auto_1768399 ) ) ( ON ?auto_1768386 ?auto_1768385 ) ( ON ?auto_1768387 ?auto_1768386 ) ( ON ?auto_1768389 ?auto_1768387 ) ( ON ?auto_1768388 ?auto_1768389 ) ( ON ?auto_1768390 ?auto_1768388 ) ( ON ?auto_1768391 ?auto_1768390 ) ( ON ?auto_1768392 ?auto_1768391 ) ( ON ?auto_1768393 ?auto_1768392 ) ( ON ?auto_1768394 ?auto_1768393 ) ( ON ?auto_1768395 ?auto_1768394 ) ( ON ?auto_1768396 ?auto_1768395 ) ( ON ?auto_1768397 ?auto_1768396 ) ( ON ?auto_1768398 ?auto_1768397 ) ( not ( = ?auto_1768385 ?auto_1768386 ) ) ( not ( = ?auto_1768385 ?auto_1768387 ) ) ( not ( = ?auto_1768385 ?auto_1768389 ) ) ( not ( = ?auto_1768385 ?auto_1768388 ) ) ( not ( = ?auto_1768385 ?auto_1768390 ) ) ( not ( = ?auto_1768385 ?auto_1768391 ) ) ( not ( = ?auto_1768385 ?auto_1768392 ) ) ( not ( = ?auto_1768385 ?auto_1768393 ) ) ( not ( = ?auto_1768385 ?auto_1768394 ) ) ( not ( = ?auto_1768385 ?auto_1768395 ) ) ( not ( = ?auto_1768385 ?auto_1768396 ) ) ( not ( = ?auto_1768385 ?auto_1768397 ) ) ( not ( = ?auto_1768385 ?auto_1768398 ) ) ( not ( = ?auto_1768385 ?auto_1768399 ) ) ( not ( = ?auto_1768386 ?auto_1768387 ) ) ( not ( = ?auto_1768386 ?auto_1768389 ) ) ( not ( = ?auto_1768386 ?auto_1768388 ) ) ( not ( = ?auto_1768386 ?auto_1768390 ) ) ( not ( = ?auto_1768386 ?auto_1768391 ) ) ( not ( = ?auto_1768386 ?auto_1768392 ) ) ( not ( = ?auto_1768386 ?auto_1768393 ) ) ( not ( = ?auto_1768386 ?auto_1768394 ) ) ( not ( = ?auto_1768386 ?auto_1768395 ) ) ( not ( = ?auto_1768386 ?auto_1768396 ) ) ( not ( = ?auto_1768386 ?auto_1768397 ) ) ( not ( = ?auto_1768386 ?auto_1768398 ) ) ( not ( = ?auto_1768386 ?auto_1768399 ) ) ( not ( = ?auto_1768387 ?auto_1768389 ) ) ( not ( = ?auto_1768387 ?auto_1768388 ) ) ( not ( = ?auto_1768387 ?auto_1768390 ) ) ( not ( = ?auto_1768387 ?auto_1768391 ) ) ( not ( = ?auto_1768387 ?auto_1768392 ) ) ( not ( = ?auto_1768387 ?auto_1768393 ) ) ( not ( = ?auto_1768387 ?auto_1768394 ) ) ( not ( = ?auto_1768387 ?auto_1768395 ) ) ( not ( = ?auto_1768387 ?auto_1768396 ) ) ( not ( = ?auto_1768387 ?auto_1768397 ) ) ( not ( = ?auto_1768387 ?auto_1768398 ) ) ( not ( = ?auto_1768387 ?auto_1768399 ) ) ( not ( = ?auto_1768389 ?auto_1768388 ) ) ( not ( = ?auto_1768389 ?auto_1768390 ) ) ( not ( = ?auto_1768389 ?auto_1768391 ) ) ( not ( = ?auto_1768389 ?auto_1768392 ) ) ( not ( = ?auto_1768389 ?auto_1768393 ) ) ( not ( = ?auto_1768389 ?auto_1768394 ) ) ( not ( = ?auto_1768389 ?auto_1768395 ) ) ( not ( = ?auto_1768389 ?auto_1768396 ) ) ( not ( = ?auto_1768389 ?auto_1768397 ) ) ( not ( = ?auto_1768389 ?auto_1768398 ) ) ( not ( = ?auto_1768389 ?auto_1768399 ) ) ( not ( = ?auto_1768388 ?auto_1768390 ) ) ( not ( = ?auto_1768388 ?auto_1768391 ) ) ( not ( = ?auto_1768388 ?auto_1768392 ) ) ( not ( = ?auto_1768388 ?auto_1768393 ) ) ( not ( = ?auto_1768388 ?auto_1768394 ) ) ( not ( = ?auto_1768388 ?auto_1768395 ) ) ( not ( = ?auto_1768388 ?auto_1768396 ) ) ( not ( = ?auto_1768388 ?auto_1768397 ) ) ( not ( = ?auto_1768388 ?auto_1768398 ) ) ( not ( = ?auto_1768388 ?auto_1768399 ) ) ( not ( = ?auto_1768390 ?auto_1768391 ) ) ( not ( = ?auto_1768390 ?auto_1768392 ) ) ( not ( = ?auto_1768390 ?auto_1768393 ) ) ( not ( = ?auto_1768390 ?auto_1768394 ) ) ( not ( = ?auto_1768390 ?auto_1768395 ) ) ( not ( = ?auto_1768390 ?auto_1768396 ) ) ( not ( = ?auto_1768390 ?auto_1768397 ) ) ( not ( = ?auto_1768390 ?auto_1768398 ) ) ( not ( = ?auto_1768390 ?auto_1768399 ) ) ( not ( = ?auto_1768391 ?auto_1768392 ) ) ( not ( = ?auto_1768391 ?auto_1768393 ) ) ( not ( = ?auto_1768391 ?auto_1768394 ) ) ( not ( = ?auto_1768391 ?auto_1768395 ) ) ( not ( = ?auto_1768391 ?auto_1768396 ) ) ( not ( = ?auto_1768391 ?auto_1768397 ) ) ( not ( = ?auto_1768391 ?auto_1768398 ) ) ( not ( = ?auto_1768391 ?auto_1768399 ) ) ( not ( = ?auto_1768392 ?auto_1768393 ) ) ( not ( = ?auto_1768392 ?auto_1768394 ) ) ( not ( = ?auto_1768392 ?auto_1768395 ) ) ( not ( = ?auto_1768392 ?auto_1768396 ) ) ( not ( = ?auto_1768392 ?auto_1768397 ) ) ( not ( = ?auto_1768392 ?auto_1768398 ) ) ( not ( = ?auto_1768392 ?auto_1768399 ) ) ( not ( = ?auto_1768393 ?auto_1768394 ) ) ( not ( = ?auto_1768393 ?auto_1768395 ) ) ( not ( = ?auto_1768393 ?auto_1768396 ) ) ( not ( = ?auto_1768393 ?auto_1768397 ) ) ( not ( = ?auto_1768393 ?auto_1768398 ) ) ( not ( = ?auto_1768393 ?auto_1768399 ) ) ( not ( = ?auto_1768394 ?auto_1768395 ) ) ( not ( = ?auto_1768394 ?auto_1768396 ) ) ( not ( = ?auto_1768394 ?auto_1768397 ) ) ( not ( = ?auto_1768394 ?auto_1768398 ) ) ( not ( = ?auto_1768394 ?auto_1768399 ) ) ( not ( = ?auto_1768395 ?auto_1768396 ) ) ( not ( = ?auto_1768395 ?auto_1768397 ) ) ( not ( = ?auto_1768395 ?auto_1768398 ) ) ( not ( = ?auto_1768395 ?auto_1768399 ) ) ( not ( = ?auto_1768396 ?auto_1768397 ) ) ( not ( = ?auto_1768396 ?auto_1768398 ) ) ( not ( = ?auto_1768396 ?auto_1768399 ) ) ( not ( = ?auto_1768397 ?auto_1768398 ) ) ( not ( = ?auto_1768397 ?auto_1768399 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1768398 ?auto_1768399 )
      ( MAKE-14CRATE-VERIFY ?auto_1768385 ?auto_1768386 ?auto_1768387 ?auto_1768389 ?auto_1768388 ?auto_1768390 ?auto_1768391 ?auto_1768392 ?auto_1768393 ?auto_1768394 ?auto_1768395 ?auto_1768396 ?auto_1768397 ?auto_1768398 ?auto_1768399 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1768545 - SURFACE
      ?auto_1768546 - SURFACE
      ?auto_1768547 - SURFACE
      ?auto_1768549 - SURFACE
      ?auto_1768548 - SURFACE
      ?auto_1768550 - SURFACE
      ?auto_1768551 - SURFACE
      ?auto_1768552 - SURFACE
      ?auto_1768553 - SURFACE
      ?auto_1768554 - SURFACE
      ?auto_1768555 - SURFACE
      ?auto_1768556 - SURFACE
      ?auto_1768557 - SURFACE
      ?auto_1768558 - SURFACE
      ?auto_1768559 - SURFACE
    )
    :vars
    (
      ?auto_1768562 - HOIST
      ?auto_1768561 - PLACE
      ?auto_1768560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1768562 ?auto_1768561 ) ( SURFACE-AT ?auto_1768558 ?auto_1768561 ) ( CLEAR ?auto_1768558 ) ( IS-CRATE ?auto_1768559 ) ( not ( = ?auto_1768558 ?auto_1768559 ) ) ( TRUCK-AT ?auto_1768560 ?auto_1768561 ) ( AVAILABLE ?auto_1768562 ) ( IN ?auto_1768559 ?auto_1768560 ) ( ON ?auto_1768558 ?auto_1768557 ) ( not ( = ?auto_1768557 ?auto_1768558 ) ) ( not ( = ?auto_1768557 ?auto_1768559 ) ) ( ON ?auto_1768546 ?auto_1768545 ) ( ON ?auto_1768547 ?auto_1768546 ) ( ON ?auto_1768549 ?auto_1768547 ) ( ON ?auto_1768548 ?auto_1768549 ) ( ON ?auto_1768550 ?auto_1768548 ) ( ON ?auto_1768551 ?auto_1768550 ) ( ON ?auto_1768552 ?auto_1768551 ) ( ON ?auto_1768553 ?auto_1768552 ) ( ON ?auto_1768554 ?auto_1768553 ) ( ON ?auto_1768555 ?auto_1768554 ) ( ON ?auto_1768556 ?auto_1768555 ) ( ON ?auto_1768557 ?auto_1768556 ) ( not ( = ?auto_1768545 ?auto_1768546 ) ) ( not ( = ?auto_1768545 ?auto_1768547 ) ) ( not ( = ?auto_1768545 ?auto_1768549 ) ) ( not ( = ?auto_1768545 ?auto_1768548 ) ) ( not ( = ?auto_1768545 ?auto_1768550 ) ) ( not ( = ?auto_1768545 ?auto_1768551 ) ) ( not ( = ?auto_1768545 ?auto_1768552 ) ) ( not ( = ?auto_1768545 ?auto_1768553 ) ) ( not ( = ?auto_1768545 ?auto_1768554 ) ) ( not ( = ?auto_1768545 ?auto_1768555 ) ) ( not ( = ?auto_1768545 ?auto_1768556 ) ) ( not ( = ?auto_1768545 ?auto_1768557 ) ) ( not ( = ?auto_1768545 ?auto_1768558 ) ) ( not ( = ?auto_1768545 ?auto_1768559 ) ) ( not ( = ?auto_1768546 ?auto_1768547 ) ) ( not ( = ?auto_1768546 ?auto_1768549 ) ) ( not ( = ?auto_1768546 ?auto_1768548 ) ) ( not ( = ?auto_1768546 ?auto_1768550 ) ) ( not ( = ?auto_1768546 ?auto_1768551 ) ) ( not ( = ?auto_1768546 ?auto_1768552 ) ) ( not ( = ?auto_1768546 ?auto_1768553 ) ) ( not ( = ?auto_1768546 ?auto_1768554 ) ) ( not ( = ?auto_1768546 ?auto_1768555 ) ) ( not ( = ?auto_1768546 ?auto_1768556 ) ) ( not ( = ?auto_1768546 ?auto_1768557 ) ) ( not ( = ?auto_1768546 ?auto_1768558 ) ) ( not ( = ?auto_1768546 ?auto_1768559 ) ) ( not ( = ?auto_1768547 ?auto_1768549 ) ) ( not ( = ?auto_1768547 ?auto_1768548 ) ) ( not ( = ?auto_1768547 ?auto_1768550 ) ) ( not ( = ?auto_1768547 ?auto_1768551 ) ) ( not ( = ?auto_1768547 ?auto_1768552 ) ) ( not ( = ?auto_1768547 ?auto_1768553 ) ) ( not ( = ?auto_1768547 ?auto_1768554 ) ) ( not ( = ?auto_1768547 ?auto_1768555 ) ) ( not ( = ?auto_1768547 ?auto_1768556 ) ) ( not ( = ?auto_1768547 ?auto_1768557 ) ) ( not ( = ?auto_1768547 ?auto_1768558 ) ) ( not ( = ?auto_1768547 ?auto_1768559 ) ) ( not ( = ?auto_1768549 ?auto_1768548 ) ) ( not ( = ?auto_1768549 ?auto_1768550 ) ) ( not ( = ?auto_1768549 ?auto_1768551 ) ) ( not ( = ?auto_1768549 ?auto_1768552 ) ) ( not ( = ?auto_1768549 ?auto_1768553 ) ) ( not ( = ?auto_1768549 ?auto_1768554 ) ) ( not ( = ?auto_1768549 ?auto_1768555 ) ) ( not ( = ?auto_1768549 ?auto_1768556 ) ) ( not ( = ?auto_1768549 ?auto_1768557 ) ) ( not ( = ?auto_1768549 ?auto_1768558 ) ) ( not ( = ?auto_1768549 ?auto_1768559 ) ) ( not ( = ?auto_1768548 ?auto_1768550 ) ) ( not ( = ?auto_1768548 ?auto_1768551 ) ) ( not ( = ?auto_1768548 ?auto_1768552 ) ) ( not ( = ?auto_1768548 ?auto_1768553 ) ) ( not ( = ?auto_1768548 ?auto_1768554 ) ) ( not ( = ?auto_1768548 ?auto_1768555 ) ) ( not ( = ?auto_1768548 ?auto_1768556 ) ) ( not ( = ?auto_1768548 ?auto_1768557 ) ) ( not ( = ?auto_1768548 ?auto_1768558 ) ) ( not ( = ?auto_1768548 ?auto_1768559 ) ) ( not ( = ?auto_1768550 ?auto_1768551 ) ) ( not ( = ?auto_1768550 ?auto_1768552 ) ) ( not ( = ?auto_1768550 ?auto_1768553 ) ) ( not ( = ?auto_1768550 ?auto_1768554 ) ) ( not ( = ?auto_1768550 ?auto_1768555 ) ) ( not ( = ?auto_1768550 ?auto_1768556 ) ) ( not ( = ?auto_1768550 ?auto_1768557 ) ) ( not ( = ?auto_1768550 ?auto_1768558 ) ) ( not ( = ?auto_1768550 ?auto_1768559 ) ) ( not ( = ?auto_1768551 ?auto_1768552 ) ) ( not ( = ?auto_1768551 ?auto_1768553 ) ) ( not ( = ?auto_1768551 ?auto_1768554 ) ) ( not ( = ?auto_1768551 ?auto_1768555 ) ) ( not ( = ?auto_1768551 ?auto_1768556 ) ) ( not ( = ?auto_1768551 ?auto_1768557 ) ) ( not ( = ?auto_1768551 ?auto_1768558 ) ) ( not ( = ?auto_1768551 ?auto_1768559 ) ) ( not ( = ?auto_1768552 ?auto_1768553 ) ) ( not ( = ?auto_1768552 ?auto_1768554 ) ) ( not ( = ?auto_1768552 ?auto_1768555 ) ) ( not ( = ?auto_1768552 ?auto_1768556 ) ) ( not ( = ?auto_1768552 ?auto_1768557 ) ) ( not ( = ?auto_1768552 ?auto_1768558 ) ) ( not ( = ?auto_1768552 ?auto_1768559 ) ) ( not ( = ?auto_1768553 ?auto_1768554 ) ) ( not ( = ?auto_1768553 ?auto_1768555 ) ) ( not ( = ?auto_1768553 ?auto_1768556 ) ) ( not ( = ?auto_1768553 ?auto_1768557 ) ) ( not ( = ?auto_1768553 ?auto_1768558 ) ) ( not ( = ?auto_1768553 ?auto_1768559 ) ) ( not ( = ?auto_1768554 ?auto_1768555 ) ) ( not ( = ?auto_1768554 ?auto_1768556 ) ) ( not ( = ?auto_1768554 ?auto_1768557 ) ) ( not ( = ?auto_1768554 ?auto_1768558 ) ) ( not ( = ?auto_1768554 ?auto_1768559 ) ) ( not ( = ?auto_1768555 ?auto_1768556 ) ) ( not ( = ?auto_1768555 ?auto_1768557 ) ) ( not ( = ?auto_1768555 ?auto_1768558 ) ) ( not ( = ?auto_1768555 ?auto_1768559 ) ) ( not ( = ?auto_1768556 ?auto_1768557 ) ) ( not ( = ?auto_1768556 ?auto_1768558 ) ) ( not ( = ?auto_1768556 ?auto_1768559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1768557 ?auto_1768558 ?auto_1768559 )
      ( MAKE-14CRATE-VERIFY ?auto_1768545 ?auto_1768546 ?auto_1768547 ?auto_1768549 ?auto_1768548 ?auto_1768550 ?auto_1768551 ?auto_1768552 ?auto_1768553 ?auto_1768554 ?auto_1768555 ?auto_1768556 ?auto_1768557 ?auto_1768558 ?auto_1768559 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1768720 - SURFACE
      ?auto_1768721 - SURFACE
      ?auto_1768722 - SURFACE
      ?auto_1768724 - SURFACE
      ?auto_1768723 - SURFACE
      ?auto_1768725 - SURFACE
      ?auto_1768726 - SURFACE
      ?auto_1768727 - SURFACE
      ?auto_1768728 - SURFACE
      ?auto_1768729 - SURFACE
      ?auto_1768730 - SURFACE
      ?auto_1768731 - SURFACE
      ?auto_1768732 - SURFACE
      ?auto_1768733 - SURFACE
      ?auto_1768734 - SURFACE
    )
    :vars
    (
      ?auto_1768737 - HOIST
      ?auto_1768735 - PLACE
      ?auto_1768738 - TRUCK
      ?auto_1768736 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1768737 ?auto_1768735 ) ( SURFACE-AT ?auto_1768733 ?auto_1768735 ) ( CLEAR ?auto_1768733 ) ( IS-CRATE ?auto_1768734 ) ( not ( = ?auto_1768733 ?auto_1768734 ) ) ( AVAILABLE ?auto_1768737 ) ( IN ?auto_1768734 ?auto_1768738 ) ( ON ?auto_1768733 ?auto_1768732 ) ( not ( = ?auto_1768732 ?auto_1768733 ) ) ( not ( = ?auto_1768732 ?auto_1768734 ) ) ( TRUCK-AT ?auto_1768738 ?auto_1768736 ) ( not ( = ?auto_1768736 ?auto_1768735 ) ) ( ON ?auto_1768721 ?auto_1768720 ) ( ON ?auto_1768722 ?auto_1768721 ) ( ON ?auto_1768724 ?auto_1768722 ) ( ON ?auto_1768723 ?auto_1768724 ) ( ON ?auto_1768725 ?auto_1768723 ) ( ON ?auto_1768726 ?auto_1768725 ) ( ON ?auto_1768727 ?auto_1768726 ) ( ON ?auto_1768728 ?auto_1768727 ) ( ON ?auto_1768729 ?auto_1768728 ) ( ON ?auto_1768730 ?auto_1768729 ) ( ON ?auto_1768731 ?auto_1768730 ) ( ON ?auto_1768732 ?auto_1768731 ) ( not ( = ?auto_1768720 ?auto_1768721 ) ) ( not ( = ?auto_1768720 ?auto_1768722 ) ) ( not ( = ?auto_1768720 ?auto_1768724 ) ) ( not ( = ?auto_1768720 ?auto_1768723 ) ) ( not ( = ?auto_1768720 ?auto_1768725 ) ) ( not ( = ?auto_1768720 ?auto_1768726 ) ) ( not ( = ?auto_1768720 ?auto_1768727 ) ) ( not ( = ?auto_1768720 ?auto_1768728 ) ) ( not ( = ?auto_1768720 ?auto_1768729 ) ) ( not ( = ?auto_1768720 ?auto_1768730 ) ) ( not ( = ?auto_1768720 ?auto_1768731 ) ) ( not ( = ?auto_1768720 ?auto_1768732 ) ) ( not ( = ?auto_1768720 ?auto_1768733 ) ) ( not ( = ?auto_1768720 ?auto_1768734 ) ) ( not ( = ?auto_1768721 ?auto_1768722 ) ) ( not ( = ?auto_1768721 ?auto_1768724 ) ) ( not ( = ?auto_1768721 ?auto_1768723 ) ) ( not ( = ?auto_1768721 ?auto_1768725 ) ) ( not ( = ?auto_1768721 ?auto_1768726 ) ) ( not ( = ?auto_1768721 ?auto_1768727 ) ) ( not ( = ?auto_1768721 ?auto_1768728 ) ) ( not ( = ?auto_1768721 ?auto_1768729 ) ) ( not ( = ?auto_1768721 ?auto_1768730 ) ) ( not ( = ?auto_1768721 ?auto_1768731 ) ) ( not ( = ?auto_1768721 ?auto_1768732 ) ) ( not ( = ?auto_1768721 ?auto_1768733 ) ) ( not ( = ?auto_1768721 ?auto_1768734 ) ) ( not ( = ?auto_1768722 ?auto_1768724 ) ) ( not ( = ?auto_1768722 ?auto_1768723 ) ) ( not ( = ?auto_1768722 ?auto_1768725 ) ) ( not ( = ?auto_1768722 ?auto_1768726 ) ) ( not ( = ?auto_1768722 ?auto_1768727 ) ) ( not ( = ?auto_1768722 ?auto_1768728 ) ) ( not ( = ?auto_1768722 ?auto_1768729 ) ) ( not ( = ?auto_1768722 ?auto_1768730 ) ) ( not ( = ?auto_1768722 ?auto_1768731 ) ) ( not ( = ?auto_1768722 ?auto_1768732 ) ) ( not ( = ?auto_1768722 ?auto_1768733 ) ) ( not ( = ?auto_1768722 ?auto_1768734 ) ) ( not ( = ?auto_1768724 ?auto_1768723 ) ) ( not ( = ?auto_1768724 ?auto_1768725 ) ) ( not ( = ?auto_1768724 ?auto_1768726 ) ) ( not ( = ?auto_1768724 ?auto_1768727 ) ) ( not ( = ?auto_1768724 ?auto_1768728 ) ) ( not ( = ?auto_1768724 ?auto_1768729 ) ) ( not ( = ?auto_1768724 ?auto_1768730 ) ) ( not ( = ?auto_1768724 ?auto_1768731 ) ) ( not ( = ?auto_1768724 ?auto_1768732 ) ) ( not ( = ?auto_1768724 ?auto_1768733 ) ) ( not ( = ?auto_1768724 ?auto_1768734 ) ) ( not ( = ?auto_1768723 ?auto_1768725 ) ) ( not ( = ?auto_1768723 ?auto_1768726 ) ) ( not ( = ?auto_1768723 ?auto_1768727 ) ) ( not ( = ?auto_1768723 ?auto_1768728 ) ) ( not ( = ?auto_1768723 ?auto_1768729 ) ) ( not ( = ?auto_1768723 ?auto_1768730 ) ) ( not ( = ?auto_1768723 ?auto_1768731 ) ) ( not ( = ?auto_1768723 ?auto_1768732 ) ) ( not ( = ?auto_1768723 ?auto_1768733 ) ) ( not ( = ?auto_1768723 ?auto_1768734 ) ) ( not ( = ?auto_1768725 ?auto_1768726 ) ) ( not ( = ?auto_1768725 ?auto_1768727 ) ) ( not ( = ?auto_1768725 ?auto_1768728 ) ) ( not ( = ?auto_1768725 ?auto_1768729 ) ) ( not ( = ?auto_1768725 ?auto_1768730 ) ) ( not ( = ?auto_1768725 ?auto_1768731 ) ) ( not ( = ?auto_1768725 ?auto_1768732 ) ) ( not ( = ?auto_1768725 ?auto_1768733 ) ) ( not ( = ?auto_1768725 ?auto_1768734 ) ) ( not ( = ?auto_1768726 ?auto_1768727 ) ) ( not ( = ?auto_1768726 ?auto_1768728 ) ) ( not ( = ?auto_1768726 ?auto_1768729 ) ) ( not ( = ?auto_1768726 ?auto_1768730 ) ) ( not ( = ?auto_1768726 ?auto_1768731 ) ) ( not ( = ?auto_1768726 ?auto_1768732 ) ) ( not ( = ?auto_1768726 ?auto_1768733 ) ) ( not ( = ?auto_1768726 ?auto_1768734 ) ) ( not ( = ?auto_1768727 ?auto_1768728 ) ) ( not ( = ?auto_1768727 ?auto_1768729 ) ) ( not ( = ?auto_1768727 ?auto_1768730 ) ) ( not ( = ?auto_1768727 ?auto_1768731 ) ) ( not ( = ?auto_1768727 ?auto_1768732 ) ) ( not ( = ?auto_1768727 ?auto_1768733 ) ) ( not ( = ?auto_1768727 ?auto_1768734 ) ) ( not ( = ?auto_1768728 ?auto_1768729 ) ) ( not ( = ?auto_1768728 ?auto_1768730 ) ) ( not ( = ?auto_1768728 ?auto_1768731 ) ) ( not ( = ?auto_1768728 ?auto_1768732 ) ) ( not ( = ?auto_1768728 ?auto_1768733 ) ) ( not ( = ?auto_1768728 ?auto_1768734 ) ) ( not ( = ?auto_1768729 ?auto_1768730 ) ) ( not ( = ?auto_1768729 ?auto_1768731 ) ) ( not ( = ?auto_1768729 ?auto_1768732 ) ) ( not ( = ?auto_1768729 ?auto_1768733 ) ) ( not ( = ?auto_1768729 ?auto_1768734 ) ) ( not ( = ?auto_1768730 ?auto_1768731 ) ) ( not ( = ?auto_1768730 ?auto_1768732 ) ) ( not ( = ?auto_1768730 ?auto_1768733 ) ) ( not ( = ?auto_1768730 ?auto_1768734 ) ) ( not ( = ?auto_1768731 ?auto_1768732 ) ) ( not ( = ?auto_1768731 ?auto_1768733 ) ) ( not ( = ?auto_1768731 ?auto_1768734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1768732 ?auto_1768733 ?auto_1768734 )
      ( MAKE-14CRATE-VERIFY ?auto_1768720 ?auto_1768721 ?auto_1768722 ?auto_1768724 ?auto_1768723 ?auto_1768725 ?auto_1768726 ?auto_1768727 ?auto_1768728 ?auto_1768729 ?auto_1768730 ?auto_1768731 ?auto_1768732 ?auto_1768733 ?auto_1768734 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1768909 - SURFACE
      ?auto_1768910 - SURFACE
      ?auto_1768911 - SURFACE
      ?auto_1768913 - SURFACE
      ?auto_1768912 - SURFACE
      ?auto_1768914 - SURFACE
      ?auto_1768915 - SURFACE
      ?auto_1768916 - SURFACE
      ?auto_1768917 - SURFACE
      ?auto_1768918 - SURFACE
      ?auto_1768919 - SURFACE
      ?auto_1768920 - SURFACE
      ?auto_1768921 - SURFACE
      ?auto_1768922 - SURFACE
      ?auto_1768923 - SURFACE
    )
    :vars
    (
      ?auto_1768927 - HOIST
      ?auto_1768924 - PLACE
      ?auto_1768925 - TRUCK
      ?auto_1768928 - PLACE
      ?auto_1768926 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1768927 ?auto_1768924 ) ( SURFACE-AT ?auto_1768922 ?auto_1768924 ) ( CLEAR ?auto_1768922 ) ( IS-CRATE ?auto_1768923 ) ( not ( = ?auto_1768922 ?auto_1768923 ) ) ( AVAILABLE ?auto_1768927 ) ( ON ?auto_1768922 ?auto_1768921 ) ( not ( = ?auto_1768921 ?auto_1768922 ) ) ( not ( = ?auto_1768921 ?auto_1768923 ) ) ( TRUCK-AT ?auto_1768925 ?auto_1768928 ) ( not ( = ?auto_1768928 ?auto_1768924 ) ) ( HOIST-AT ?auto_1768926 ?auto_1768928 ) ( LIFTING ?auto_1768926 ?auto_1768923 ) ( not ( = ?auto_1768927 ?auto_1768926 ) ) ( ON ?auto_1768910 ?auto_1768909 ) ( ON ?auto_1768911 ?auto_1768910 ) ( ON ?auto_1768913 ?auto_1768911 ) ( ON ?auto_1768912 ?auto_1768913 ) ( ON ?auto_1768914 ?auto_1768912 ) ( ON ?auto_1768915 ?auto_1768914 ) ( ON ?auto_1768916 ?auto_1768915 ) ( ON ?auto_1768917 ?auto_1768916 ) ( ON ?auto_1768918 ?auto_1768917 ) ( ON ?auto_1768919 ?auto_1768918 ) ( ON ?auto_1768920 ?auto_1768919 ) ( ON ?auto_1768921 ?auto_1768920 ) ( not ( = ?auto_1768909 ?auto_1768910 ) ) ( not ( = ?auto_1768909 ?auto_1768911 ) ) ( not ( = ?auto_1768909 ?auto_1768913 ) ) ( not ( = ?auto_1768909 ?auto_1768912 ) ) ( not ( = ?auto_1768909 ?auto_1768914 ) ) ( not ( = ?auto_1768909 ?auto_1768915 ) ) ( not ( = ?auto_1768909 ?auto_1768916 ) ) ( not ( = ?auto_1768909 ?auto_1768917 ) ) ( not ( = ?auto_1768909 ?auto_1768918 ) ) ( not ( = ?auto_1768909 ?auto_1768919 ) ) ( not ( = ?auto_1768909 ?auto_1768920 ) ) ( not ( = ?auto_1768909 ?auto_1768921 ) ) ( not ( = ?auto_1768909 ?auto_1768922 ) ) ( not ( = ?auto_1768909 ?auto_1768923 ) ) ( not ( = ?auto_1768910 ?auto_1768911 ) ) ( not ( = ?auto_1768910 ?auto_1768913 ) ) ( not ( = ?auto_1768910 ?auto_1768912 ) ) ( not ( = ?auto_1768910 ?auto_1768914 ) ) ( not ( = ?auto_1768910 ?auto_1768915 ) ) ( not ( = ?auto_1768910 ?auto_1768916 ) ) ( not ( = ?auto_1768910 ?auto_1768917 ) ) ( not ( = ?auto_1768910 ?auto_1768918 ) ) ( not ( = ?auto_1768910 ?auto_1768919 ) ) ( not ( = ?auto_1768910 ?auto_1768920 ) ) ( not ( = ?auto_1768910 ?auto_1768921 ) ) ( not ( = ?auto_1768910 ?auto_1768922 ) ) ( not ( = ?auto_1768910 ?auto_1768923 ) ) ( not ( = ?auto_1768911 ?auto_1768913 ) ) ( not ( = ?auto_1768911 ?auto_1768912 ) ) ( not ( = ?auto_1768911 ?auto_1768914 ) ) ( not ( = ?auto_1768911 ?auto_1768915 ) ) ( not ( = ?auto_1768911 ?auto_1768916 ) ) ( not ( = ?auto_1768911 ?auto_1768917 ) ) ( not ( = ?auto_1768911 ?auto_1768918 ) ) ( not ( = ?auto_1768911 ?auto_1768919 ) ) ( not ( = ?auto_1768911 ?auto_1768920 ) ) ( not ( = ?auto_1768911 ?auto_1768921 ) ) ( not ( = ?auto_1768911 ?auto_1768922 ) ) ( not ( = ?auto_1768911 ?auto_1768923 ) ) ( not ( = ?auto_1768913 ?auto_1768912 ) ) ( not ( = ?auto_1768913 ?auto_1768914 ) ) ( not ( = ?auto_1768913 ?auto_1768915 ) ) ( not ( = ?auto_1768913 ?auto_1768916 ) ) ( not ( = ?auto_1768913 ?auto_1768917 ) ) ( not ( = ?auto_1768913 ?auto_1768918 ) ) ( not ( = ?auto_1768913 ?auto_1768919 ) ) ( not ( = ?auto_1768913 ?auto_1768920 ) ) ( not ( = ?auto_1768913 ?auto_1768921 ) ) ( not ( = ?auto_1768913 ?auto_1768922 ) ) ( not ( = ?auto_1768913 ?auto_1768923 ) ) ( not ( = ?auto_1768912 ?auto_1768914 ) ) ( not ( = ?auto_1768912 ?auto_1768915 ) ) ( not ( = ?auto_1768912 ?auto_1768916 ) ) ( not ( = ?auto_1768912 ?auto_1768917 ) ) ( not ( = ?auto_1768912 ?auto_1768918 ) ) ( not ( = ?auto_1768912 ?auto_1768919 ) ) ( not ( = ?auto_1768912 ?auto_1768920 ) ) ( not ( = ?auto_1768912 ?auto_1768921 ) ) ( not ( = ?auto_1768912 ?auto_1768922 ) ) ( not ( = ?auto_1768912 ?auto_1768923 ) ) ( not ( = ?auto_1768914 ?auto_1768915 ) ) ( not ( = ?auto_1768914 ?auto_1768916 ) ) ( not ( = ?auto_1768914 ?auto_1768917 ) ) ( not ( = ?auto_1768914 ?auto_1768918 ) ) ( not ( = ?auto_1768914 ?auto_1768919 ) ) ( not ( = ?auto_1768914 ?auto_1768920 ) ) ( not ( = ?auto_1768914 ?auto_1768921 ) ) ( not ( = ?auto_1768914 ?auto_1768922 ) ) ( not ( = ?auto_1768914 ?auto_1768923 ) ) ( not ( = ?auto_1768915 ?auto_1768916 ) ) ( not ( = ?auto_1768915 ?auto_1768917 ) ) ( not ( = ?auto_1768915 ?auto_1768918 ) ) ( not ( = ?auto_1768915 ?auto_1768919 ) ) ( not ( = ?auto_1768915 ?auto_1768920 ) ) ( not ( = ?auto_1768915 ?auto_1768921 ) ) ( not ( = ?auto_1768915 ?auto_1768922 ) ) ( not ( = ?auto_1768915 ?auto_1768923 ) ) ( not ( = ?auto_1768916 ?auto_1768917 ) ) ( not ( = ?auto_1768916 ?auto_1768918 ) ) ( not ( = ?auto_1768916 ?auto_1768919 ) ) ( not ( = ?auto_1768916 ?auto_1768920 ) ) ( not ( = ?auto_1768916 ?auto_1768921 ) ) ( not ( = ?auto_1768916 ?auto_1768922 ) ) ( not ( = ?auto_1768916 ?auto_1768923 ) ) ( not ( = ?auto_1768917 ?auto_1768918 ) ) ( not ( = ?auto_1768917 ?auto_1768919 ) ) ( not ( = ?auto_1768917 ?auto_1768920 ) ) ( not ( = ?auto_1768917 ?auto_1768921 ) ) ( not ( = ?auto_1768917 ?auto_1768922 ) ) ( not ( = ?auto_1768917 ?auto_1768923 ) ) ( not ( = ?auto_1768918 ?auto_1768919 ) ) ( not ( = ?auto_1768918 ?auto_1768920 ) ) ( not ( = ?auto_1768918 ?auto_1768921 ) ) ( not ( = ?auto_1768918 ?auto_1768922 ) ) ( not ( = ?auto_1768918 ?auto_1768923 ) ) ( not ( = ?auto_1768919 ?auto_1768920 ) ) ( not ( = ?auto_1768919 ?auto_1768921 ) ) ( not ( = ?auto_1768919 ?auto_1768922 ) ) ( not ( = ?auto_1768919 ?auto_1768923 ) ) ( not ( = ?auto_1768920 ?auto_1768921 ) ) ( not ( = ?auto_1768920 ?auto_1768922 ) ) ( not ( = ?auto_1768920 ?auto_1768923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1768921 ?auto_1768922 ?auto_1768923 )
      ( MAKE-14CRATE-VERIFY ?auto_1768909 ?auto_1768910 ?auto_1768911 ?auto_1768913 ?auto_1768912 ?auto_1768914 ?auto_1768915 ?auto_1768916 ?auto_1768917 ?auto_1768918 ?auto_1768919 ?auto_1768920 ?auto_1768921 ?auto_1768922 ?auto_1768923 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769112 - SURFACE
      ?auto_1769113 - SURFACE
      ?auto_1769114 - SURFACE
      ?auto_1769116 - SURFACE
      ?auto_1769115 - SURFACE
      ?auto_1769117 - SURFACE
      ?auto_1769118 - SURFACE
      ?auto_1769119 - SURFACE
      ?auto_1769120 - SURFACE
      ?auto_1769121 - SURFACE
      ?auto_1769122 - SURFACE
      ?auto_1769123 - SURFACE
      ?auto_1769124 - SURFACE
      ?auto_1769125 - SURFACE
      ?auto_1769126 - SURFACE
    )
    :vars
    (
      ?auto_1769130 - HOIST
      ?auto_1769129 - PLACE
      ?auto_1769132 - TRUCK
      ?auto_1769127 - PLACE
      ?auto_1769131 - HOIST
      ?auto_1769128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769130 ?auto_1769129 ) ( SURFACE-AT ?auto_1769125 ?auto_1769129 ) ( CLEAR ?auto_1769125 ) ( IS-CRATE ?auto_1769126 ) ( not ( = ?auto_1769125 ?auto_1769126 ) ) ( AVAILABLE ?auto_1769130 ) ( ON ?auto_1769125 ?auto_1769124 ) ( not ( = ?auto_1769124 ?auto_1769125 ) ) ( not ( = ?auto_1769124 ?auto_1769126 ) ) ( TRUCK-AT ?auto_1769132 ?auto_1769127 ) ( not ( = ?auto_1769127 ?auto_1769129 ) ) ( HOIST-AT ?auto_1769131 ?auto_1769127 ) ( not ( = ?auto_1769130 ?auto_1769131 ) ) ( AVAILABLE ?auto_1769131 ) ( SURFACE-AT ?auto_1769126 ?auto_1769127 ) ( ON ?auto_1769126 ?auto_1769128 ) ( CLEAR ?auto_1769126 ) ( not ( = ?auto_1769125 ?auto_1769128 ) ) ( not ( = ?auto_1769126 ?auto_1769128 ) ) ( not ( = ?auto_1769124 ?auto_1769128 ) ) ( ON ?auto_1769113 ?auto_1769112 ) ( ON ?auto_1769114 ?auto_1769113 ) ( ON ?auto_1769116 ?auto_1769114 ) ( ON ?auto_1769115 ?auto_1769116 ) ( ON ?auto_1769117 ?auto_1769115 ) ( ON ?auto_1769118 ?auto_1769117 ) ( ON ?auto_1769119 ?auto_1769118 ) ( ON ?auto_1769120 ?auto_1769119 ) ( ON ?auto_1769121 ?auto_1769120 ) ( ON ?auto_1769122 ?auto_1769121 ) ( ON ?auto_1769123 ?auto_1769122 ) ( ON ?auto_1769124 ?auto_1769123 ) ( not ( = ?auto_1769112 ?auto_1769113 ) ) ( not ( = ?auto_1769112 ?auto_1769114 ) ) ( not ( = ?auto_1769112 ?auto_1769116 ) ) ( not ( = ?auto_1769112 ?auto_1769115 ) ) ( not ( = ?auto_1769112 ?auto_1769117 ) ) ( not ( = ?auto_1769112 ?auto_1769118 ) ) ( not ( = ?auto_1769112 ?auto_1769119 ) ) ( not ( = ?auto_1769112 ?auto_1769120 ) ) ( not ( = ?auto_1769112 ?auto_1769121 ) ) ( not ( = ?auto_1769112 ?auto_1769122 ) ) ( not ( = ?auto_1769112 ?auto_1769123 ) ) ( not ( = ?auto_1769112 ?auto_1769124 ) ) ( not ( = ?auto_1769112 ?auto_1769125 ) ) ( not ( = ?auto_1769112 ?auto_1769126 ) ) ( not ( = ?auto_1769112 ?auto_1769128 ) ) ( not ( = ?auto_1769113 ?auto_1769114 ) ) ( not ( = ?auto_1769113 ?auto_1769116 ) ) ( not ( = ?auto_1769113 ?auto_1769115 ) ) ( not ( = ?auto_1769113 ?auto_1769117 ) ) ( not ( = ?auto_1769113 ?auto_1769118 ) ) ( not ( = ?auto_1769113 ?auto_1769119 ) ) ( not ( = ?auto_1769113 ?auto_1769120 ) ) ( not ( = ?auto_1769113 ?auto_1769121 ) ) ( not ( = ?auto_1769113 ?auto_1769122 ) ) ( not ( = ?auto_1769113 ?auto_1769123 ) ) ( not ( = ?auto_1769113 ?auto_1769124 ) ) ( not ( = ?auto_1769113 ?auto_1769125 ) ) ( not ( = ?auto_1769113 ?auto_1769126 ) ) ( not ( = ?auto_1769113 ?auto_1769128 ) ) ( not ( = ?auto_1769114 ?auto_1769116 ) ) ( not ( = ?auto_1769114 ?auto_1769115 ) ) ( not ( = ?auto_1769114 ?auto_1769117 ) ) ( not ( = ?auto_1769114 ?auto_1769118 ) ) ( not ( = ?auto_1769114 ?auto_1769119 ) ) ( not ( = ?auto_1769114 ?auto_1769120 ) ) ( not ( = ?auto_1769114 ?auto_1769121 ) ) ( not ( = ?auto_1769114 ?auto_1769122 ) ) ( not ( = ?auto_1769114 ?auto_1769123 ) ) ( not ( = ?auto_1769114 ?auto_1769124 ) ) ( not ( = ?auto_1769114 ?auto_1769125 ) ) ( not ( = ?auto_1769114 ?auto_1769126 ) ) ( not ( = ?auto_1769114 ?auto_1769128 ) ) ( not ( = ?auto_1769116 ?auto_1769115 ) ) ( not ( = ?auto_1769116 ?auto_1769117 ) ) ( not ( = ?auto_1769116 ?auto_1769118 ) ) ( not ( = ?auto_1769116 ?auto_1769119 ) ) ( not ( = ?auto_1769116 ?auto_1769120 ) ) ( not ( = ?auto_1769116 ?auto_1769121 ) ) ( not ( = ?auto_1769116 ?auto_1769122 ) ) ( not ( = ?auto_1769116 ?auto_1769123 ) ) ( not ( = ?auto_1769116 ?auto_1769124 ) ) ( not ( = ?auto_1769116 ?auto_1769125 ) ) ( not ( = ?auto_1769116 ?auto_1769126 ) ) ( not ( = ?auto_1769116 ?auto_1769128 ) ) ( not ( = ?auto_1769115 ?auto_1769117 ) ) ( not ( = ?auto_1769115 ?auto_1769118 ) ) ( not ( = ?auto_1769115 ?auto_1769119 ) ) ( not ( = ?auto_1769115 ?auto_1769120 ) ) ( not ( = ?auto_1769115 ?auto_1769121 ) ) ( not ( = ?auto_1769115 ?auto_1769122 ) ) ( not ( = ?auto_1769115 ?auto_1769123 ) ) ( not ( = ?auto_1769115 ?auto_1769124 ) ) ( not ( = ?auto_1769115 ?auto_1769125 ) ) ( not ( = ?auto_1769115 ?auto_1769126 ) ) ( not ( = ?auto_1769115 ?auto_1769128 ) ) ( not ( = ?auto_1769117 ?auto_1769118 ) ) ( not ( = ?auto_1769117 ?auto_1769119 ) ) ( not ( = ?auto_1769117 ?auto_1769120 ) ) ( not ( = ?auto_1769117 ?auto_1769121 ) ) ( not ( = ?auto_1769117 ?auto_1769122 ) ) ( not ( = ?auto_1769117 ?auto_1769123 ) ) ( not ( = ?auto_1769117 ?auto_1769124 ) ) ( not ( = ?auto_1769117 ?auto_1769125 ) ) ( not ( = ?auto_1769117 ?auto_1769126 ) ) ( not ( = ?auto_1769117 ?auto_1769128 ) ) ( not ( = ?auto_1769118 ?auto_1769119 ) ) ( not ( = ?auto_1769118 ?auto_1769120 ) ) ( not ( = ?auto_1769118 ?auto_1769121 ) ) ( not ( = ?auto_1769118 ?auto_1769122 ) ) ( not ( = ?auto_1769118 ?auto_1769123 ) ) ( not ( = ?auto_1769118 ?auto_1769124 ) ) ( not ( = ?auto_1769118 ?auto_1769125 ) ) ( not ( = ?auto_1769118 ?auto_1769126 ) ) ( not ( = ?auto_1769118 ?auto_1769128 ) ) ( not ( = ?auto_1769119 ?auto_1769120 ) ) ( not ( = ?auto_1769119 ?auto_1769121 ) ) ( not ( = ?auto_1769119 ?auto_1769122 ) ) ( not ( = ?auto_1769119 ?auto_1769123 ) ) ( not ( = ?auto_1769119 ?auto_1769124 ) ) ( not ( = ?auto_1769119 ?auto_1769125 ) ) ( not ( = ?auto_1769119 ?auto_1769126 ) ) ( not ( = ?auto_1769119 ?auto_1769128 ) ) ( not ( = ?auto_1769120 ?auto_1769121 ) ) ( not ( = ?auto_1769120 ?auto_1769122 ) ) ( not ( = ?auto_1769120 ?auto_1769123 ) ) ( not ( = ?auto_1769120 ?auto_1769124 ) ) ( not ( = ?auto_1769120 ?auto_1769125 ) ) ( not ( = ?auto_1769120 ?auto_1769126 ) ) ( not ( = ?auto_1769120 ?auto_1769128 ) ) ( not ( = ?auto_1769121 ?auto_1769122 ) ) ( not ( = ?auto_1769121 ?auto_1769123 ) ) ( not ( = ?auto_1769121 ?auto_1769124 ) ) ( not ( = ?auto_1769121 ?auto_1769125 ) ) ( not ( = ?auto_1769121 ?auto_1769126 ) ) ( not ( = ?auto_1769121 ?auto_1769128 ) ) ( not ( = ?auto_1769122 ?auto_1769123 ) ) ( not ( = ?auto_1769122 ?auto_1769124 ) ) ( not ( = ?auto_1769122 ?auto_1769125 ) ) ( not ( = ?auto_1769122 ?auto_1769126 ) ) ( not ( = ?auto_1769122 ?auto_1769128 ) ) ( not ( = ?auto_1769123 ?auto_1769124 ) ) ( not ( = ?auto_1769123 ?auto_1769125 ) ) ( not ( = ?auto_1769123 ?auto_1769126 ) ) ( not ( = ?auto_1769123 ?auto_1769128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769124 ?auto_1769125 ?auto_1769126 )
      ( MAKE-14CRATE-VERIFY ?auto_1769112 ?auto_1769113 ?auto_1769114 ?auto_1769116 ?auto_1769115 ?auto_1769117 ?auto_1769118 ?auto_1769119 ?auto_1769120 ?auto_1769121 ?auto_1769122 ?auto_1769123 ?auto_1769124 ?auto_1769125 ?auto_1769126 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769316 - SURFACE
      ?auto_1769317 - SURFACE
      ?auto_1769318 - SURFACE
      ?auto_1769320 - SURFACE
      ?auto_1769319 - SURFACE
      ?auto_1769321 - SURFACE
      ?auto_1769322 - SURFACE
      ?auto_1769323 - SURFACE
      ?auto_1769324 - SURFACE
      ?auto_1769325 - SURFACE
      ?auto_1769326 - SURFACE
      ?auto_1769327 - SURFACE
      ?auto_1769328 - SURFACE
      ?auto_1769329 - SURFACE
      ?auto_1769330 - SURFACE
    )
    :vars
    (
      ?auto_1769331 - HOIST
      ?auto_1769336 - PLACE
      ?auto_1769333 - PLACE
      ?auto_1769335 - HOIST
      ?auto_1769334 - SURFACE
      ?auto_1769332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769331 ?auto_1769336 ) ( SURFACE-AT ?auto_1769329 ?auto_1769336 ) ( CLEAR ?auto_1769329 ) ( IS-CRATE ?auto_1769330 ) ( not ( = ?auto_1769329 ?auto_1769330 ) ) ( AVAILABLE ?auto_1769331 ) ( ON ?auto_1769329 ?auto_1769328 ) ( not ( = ?auto_1769328 ?auto_1769329 ) ) ( not ( = ?auto_1769328 ?auto_1769330 ) ) ( not ( = ?auto_1769333 ?auto_1769336 ) ) ( HOIST-AT ?auto_1769335 ?auto_1769333 ) ( not ( = ?auto_1769331 ?auto_1769335 ) ) ( AVAILABLE ?auto_1769335 ) ( SURFACE-AT ?auto_1769330 ?auto_1769333 ) ( ON ?auto_1769330 ?auto_1769334 ) ( CLEAR ?auto_1769330 ) ( not ( = ?auto_1769329 ?auto_1769334 ) ) ( not ( = ?auto_1769330 ?auto_1769334 ) ) ( not ( = ?auto_1769328 ?auto_1769334 ) ) ( TRUCK-AT ?auto_1769332 ?auto_1769336 ) ( ON ?auto_1769317 ?auto_1769316 ) ( ON ?auto_1769318 ?auto_1769317 ) ( ON ?auto_1769320 ?auto_1769318 ) ( ON ?auto_1769319 ?auto_1769320 ) ( ON ?auto_1769321 ?auto_1769319 ) ( ON ?auto_1769322 ?auto_1769321 ) ( ON ?auto_1769323 ?auto_1769322 ) ( ON ?auto_1769324 ?auto_1769323 ) ( ON ?auto_1769325 ?auto_1769324 ) ( ON ?auto_1769326 ?auto_1769325 ) ( ON ?auto_1769327 ?auto_1769326 ) ( ON ?auto_1769328 ?auto_1769327 ) ( not ( = ?auto_1769316 ?auto_1769317 ) ) ( not ( = ?auto_1769316 ?auto_1769318 ) ) ( not ( = ?auto_1769316 ?auto_1769320 ) ) ( not ( = ?auto_1769316 ?auto_1769319 ) ) ( not ( = ?auto_1769316 ?auto_1769321 ) ) ( not ( = ?auto_1769316 ?auto_1769322 ) ) ( not ( = ?auto_1769316 ?auto_1769323 ) ) ( not ( = ?auto_1769316 ?auto_1769324 ) ) ( not ( = ?auto_1769316 ?auto_1769325 ) ) ( not ( = ?auto_1769316 ?auto_1769326 ) ) ( not ( = ?auto_1769316 ?auto_1769327 ) ) ( not ( = ?auto_1769316 ?auto_1769328 ) ) ( not ( = ?auto_1769316 ?auto_1769329 ) ) ( not ( = ?auto_1769316 ?auto_1769330 ) ) ( not ( = ?auto_1769316 ?auto_1769334 ) ) ( not ( = ?auto_1769317 ?auto_1769318 ) ) ( not ( = ?auto_1769317 ?auto_1769320 ) ) ( not ( = ?auto_1769317 ?auto_1769319 ) ) ( not ( = ?auto_1769317 ?auto_1769321 ) ) ( not ( = ?auto_1769317 ?auto_1769322 ) ) ( not ( = ?auto_1769317 ?auto_1769323 ) ) ( not ( = ?auto_1769317 ?auto_1769324 ) ) ( not ( = ?auto_1769317 ?auto_1769325 ) ) ( not ( = ?auto_1769317 ?auto_1769326 ) ) ( not ( = ?auto_1769317 ?auto_1769327 ) ) ( not ( = ?auto_1769317 ?auto_1769328 ) ) ( not ( = ?auto_1769317 ?auto_1769329 ) ) ( not ( = ?auto_1769317 ?auto_1769330 ) ) ( not ( = ?auto_1769317 ?auto_1769334 ) ) ( not ( = ?auto_1769318 ?auto_1769320 ) ) ( not ( = ?auto_1769318 ?auto_1769319 ) ) ( not ( = ?auto_1769318 ?auto_1769321 ) ) ( not ( = ?auto_1769318 ?auto_1769322 ) ) ( not ( = ?auto_1769318 ?auto_1769323 ) ) ( not ( = ?auto_1769318 ?auto_1769324 ) ) ( not ( = ?auto_1769318 ?auto_1769325 ) ) ( not ( = ?auto_1769318 ?auto_1769326 ) ) ( not ( = ?auto_1769318 ?auto_1769327 ) ) ( not ( = ?auto_1769318 ?auto_1769328 ) ) ( not ( = ?auto_1769318 ?auto_1769329 ) ) ( not ( = ?auto_1769318 ?auto_1769330 ) ) ( not ( = ?auto_1769318 ?auto_1769334 ) ) ( not ( = ?auto_1769320 ?auto_1769319 ) ) ( not ( = ?auto_1769320 ?auto_1769321 ) ) ( not ( = ?auto_1769320 ?auto_1769322 ) ) ( not ( = ?auto_1769320 ?auto_1769323 ) ) ( not ( = ?auto_1769320 ?auto_1769324 ) ) ( not ( = ?auto_1769320 ?auto_1769325 ) ) ( not ( = ?auto_1769320 ?auto_1769326 ) ) ( not ( = ?auto_1769320 ?auto_1769327 ) ) ( not ( = ?auto_1769320 ?auto_1769328 ) ) ( not ( = ?auto_1769320 ?auto_1769329 ) ) ( not ( = ?auto_1769320 ?auto_1769330 ) ) ( not ( = ?auto_1769320 ?auto_1769334 ) ) ( not ( = ?auto_1769319 ?auto_1769321 ) ) ( not ( = ?auto_1769319 ?auto_1769322 ) ) ( not ( = ?auto_1769319 ?auto_1769323 ) ) ( not ( = ?auto_1769319 ?auto_1769324 ) ) ( not ( = ?auto_1769319 ?auto_1769325 ) ) ( not ( = ?auto_1769319 ?auto_1769326 ) ) ( not ( = ?auto_1769319 ?auto_1769327 ) ) ( not ( = ?auto_1769319 ?auto_1769328 ) ) ( not ( = ?auto_1769319 ?auto_1769329 ) ) ( not ( = ?auto_1769319 ?auto_1769330 ) ) ( not ( = ?auto_1769319 ?auto_1769334 ) ) ( not ( = ?auto_1769321 ?auto_1769322 ) ) ( not ( = ?auto_1769321 ?auto_1769323 ) ) ( not ( = ?auto_1769321 ?auto_1769324 ) ) ( not ( = ?auto_1769321 ?auto_1769325 ) ) ( not ( = ?auto_1769321 ?auto_1769326 ) ) ( not ( = ?auto_1769321 ?auto_1769327 ) ) ( not ( = ?auto_1769321 ?auto_1769328 ) ) ( not ( = ?auto_1769321 ?auto_1769329 ) ) ( not ( = ?auto_1769321 ?auto_1769330 ) ) ( not ( = ?auto_1769321 ?auto_1769334 ) ) ( not ( = ?auto_1769322 ?auto_1769323 ) ) ( not ( = ?auto_1769322 ?auto_1769324 ) ) ( not ( = ?auto_1769322 ?auto_1769325 ) ) ( not ( = ?auto_1769322 ?auto_1769326 ) ) ( not ( = ?auto_1769322 ?auto_1769327 ) ) ( not ( = ?auto_1769322 ?auto_1769328 ) ) ( not ( = ?auto_1769322 ?auto_1769329 ) ) ( not ( = ?auto_1769322 ?auto_1769330 ) ) ( not ( = ?auto_1769322 ?auto_1769334 ) ) ( not ( = ?auto_1769323 ?auto_1769324 ) ) ( not ( = ?auto_1769323 ?auto_1769325 ) ) ( not ( = ?auto_1769323 ?auto_1769326 ) ) ( not ( = ?auto_1769323 ?auto_1769327 ) ) ( not ( = ?auto_1769323 ?auto_1769328 ) ) ( not ( = ?auto_1769323 ?auto_1769329 ) ) ( not ( = ?auto_1769323 ?auto_1769330 ) ) ( not ( = ?auto_1769323 ?auto_1769334 ) ) ( not ( = ?auto_1769324 ?auto_1769325 ) ) ( not ( = ?auto_1769324 ?auto_1769326 ) ) ( not ( = ?auto_1769324 ?auto_1769327 ) ) ( not ( = ?auto_1769324 ?auto_1769328 ) ) ( not ( = ?auto_1769324 ?auto_1769329 ) ) ( not ( = ?auto_1769324 ?auto_1769330 ) ) ( not ( = ?auto_1769324 ?auto_1769334 ) ) ( not ( = ?auto_1769325 ?auto_1769326 ) ) ( not ( = ?auto_1769325 ?auto_1769327 ) ) ( not ( = ?auto_1769325 ?auto_1769328 ) ) ( not ( = ?auto_1769325 ?auto_1769329 ) ) ( not ( = ?auto_1769325 ?auto_1769330 ) ) ( not ( = ?auto_1769325 ?auto_1769334 ) ) ( not ( = ?auto_1769326 ?auto_1769327 ) ) ( not ( = ?auto_1769326 ?auto_1769328 ) ) ( not ( = ?auto_1769326 ?auto_1769329 ) ) ( not ( = ?auto_1769326 ?auto_1769330 ) ) ( not ( = ?auto_1769326 ?auto_1769334 ) ) ( not ( = ?auto_1769327 ?auto_1769328 ) ) ( not ( = ?auto_1769327 ?auto_1769329 ) ) ( not ( = ?auto_1769327 ?auto_1769330 ) ) ( not ( = ?auto_1769327 ?auto_1769334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769328 ?auto_1769329 ?auto_1769330 )
      ( MAKE-14CRATE-VERIFY ?auto_1769316 ?auto_1769317 ?auto_1769318 ?auto_1769320 ?auto_1769319 ?auto_1769321 ?auto_1769322 ?auto_1769323 ?auto_1769324 ?auto_1769325 ?auto_1769326 ?auto_1769327 ?auto_1769328 ?auto_1769329 ?auto_1769330 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769520 - SURFACE
      ?auto_1769521 - SURFACE
      ?auto_1769522 - SURFACE
      ?auto_1769524 - SURFACE
      ?auto_1769523 - SURFACE
      ?auto_1769525 - SURFACE
      ?auto_1769526 - SURFACE
      ?auto_1769527 - SURFACE
      ?auto_1769528 - SURFACE
      ?auto_1769529 - SURFACE
      ?auto_1769530 - SURFACE
      ?auto_1769531 - SURFACE
      ?auto_1769532 - SURFACE
      ?auto_1769533 - SURFACE
      ?auto_1769534 - SURFACE
    )
    :vars
    (
      ?auto_1769535 - HOIST
      ?auto_1769536 - PLACE
      ?auto_1769537 - PLACE
      ?auto_1769540 - HOIST
      ?auto_1769539 - SURFACE
      ?auto_1769538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769535 ?auto_1769536 ) ( IS-CRATE ?auto_1769534 ) ( not ( = ?auto_1769533 ?auto_1769534 ) ) ( not ( = ?auto_1769532 ?auto_1769533 ) ) ( not ( = ?auto_1769532 ?auto_1769534 ) ) ( not ( = ?auto_1769537 ?auto_1769536 ) ) ( HOIST-AT ?auto_1769540 ?auto_1769537 ) ( not ( = ?auto_1769535 ?auto_1769540 ) ) ( AVAILABLE ?auto_1769540 ) ( SURFACE-AT ?auto_1769534 ?auto_1769537 ) ( ON ?auto_1769534 ?auto_1769539 ) ( CLEAR ?auto_1769534 ) ( not ( = ?auto_1769533 ?auto_1769539 ) ) ( not ( = ?auto_1769534 ?auto_1769539 ) ) ( not ( = ?auto_1769532 ?auto_1769539 ) ) ( TRUCK-AT ?auto_1769538 ?auto_1769536 ) ( SURFACE-AT ?auto_1769532 ?auto_1769536 ) ( CLEAR ?auto_1769532 ) ( LIFTING ?auto_1769535 ?auto_1769533 ) ( IS-CRATE ?auto_1769533 ) ( ON ?auto_1769521 ?auto_1769520 ) ( ON ?auto_1769522 ?auto_1769521 ) ( ON ?auto_1769524 ?auto_1769522 ) ( ON ?auto_1769523 ?auto_1769524 ) ( ON ?auto_1769525 ?auto_1769523 ) ( ON ?auto_1769526 ?auto_1769525 ) ( ON ?auto_1769527 ?auto_1769526 ) ( ON ?auto_1769528 ?auto_1769527 ) ( ON ?auto_1769529 ?auto_1769528 ) ( ON ?auto_1769530 ?auto_1769529 ) ( ON ?auto_1769531 ?auto_1769530 ) ( ON ?auto_1769532 ?auto_1769531 ) ( not ( = ?auto_1769520 ?auto_1769521 ) ) ( not ( = ?auto_1769520 ?auto_1769522 ) ) ( not ( = ?auto_1769520 ?auto_1769524 ) ) ( not ( = ?auto_1769520 ?auto_1769523 ) ) ( not ( = ?auto_1769520 ?auto_1769525 ) ) ( not ( = ?auto_1769520 ?auto_1769526 ) ) ( not ( = ?auto_1769520 ?auto_1769527 ) ) ( not ( = ?auto_1769520 ?auto_1769528 ) ) ( not ( = ?auto_1769520 ?auto_1769529 ) ) ( not ( = ?auto_1769520 ?auto_1769530 ) ) ( not ( = ?auto_1769520 ?auto_1769531 ) ) ( not ( = ?auto_1769520 ?auto_1769532 ) ) ( not ( = ?auto_1769520 ?auto_1769533 ) ) ( not ( = ?auto_1769520 ?auto_1769534 ) ) ( not ( = ?auto_1769520 ?auto_1769539 ) ) ( not ( = ?auto_1769521 ?auto_1769522 ) ) ( not ( = ?auto_1769521 ?auto_1769524 ) ) ( not ( = ?auto_1769521 ?auto_1769523 ) ) ( not ( = ?auto_1769521 ?auto_1769525 ) ) ( not ( = ?auto_1769521 ?auto_1769526 ) ) ( not ( = ?auto_1769521 ?auto_1769527 ) ) ( not ( = ?auto_1769521 ?auto_1769528 ) ) ( not ( = ?auto_1769521 ?auto_1769529 ) ) ( not ( = ?auto_1769521 ?auto_1769530 ) ) ( not ( = ?auto_1769521 ?auto_1769531 ) ) ( not ( = ?auto_1769521 ?auto_1769532 ) ) ( not ( = ?auto_1769521 ?auto_1769533 ) ) ( not ( = ?auto_1769521 ?auto_1769534 ) ) ( not ( = ?auto_1769521 ?auto_1769539 ) ) ( not ( = ?auto_1769522 ?auto_1769524 ) ) ( not ( = ?auto_1769522 ?auto_1769523 ) ) ( not ( = ?auto_1769522 ?auto_1769525 ) ) ( not ( = ?auto_1769522 ?auto_1769526 ) ) ( not ( = ?auto_1769522 ?auto_1769527 ) ) ( not ( = ?auto_1769522 ?auto_1769528 ) ) ( not ( = ?auto_1769522 ?auto_1769529 ) ) ( not ( = ?auto_1769522 ?auto_1769530 ) ) ( not ( = ?auto_1769522 ?auto_1769531 ) ) ( not ( = ?auto_1769522 ?auto_1769532 ) ) ( not ( = ?auto_1769522 ?auto_1769533 ) ) ( not ( = ?auto_1769522 ?auto_1769534 ) ) ( not ( = ?auto_1769522 ?auto_1769539 ) ) ( not ( = ?auto_1769524 ?auto_1769523 ) ) ( not ( = ?auto_1769524 ?auto_1769525 ) ) ( not ( = ?auto_1769524 ?auto_1769526 ) ) ( not ( = ?auto_1769524 ?auto_1769527 ) ) ( not ( = ?auto_1769524 ?auto_1769528 ) ) ( not ( = ?auto_1769524 ?auto_1769529 ) ) ( not ( = ?auto_1769524 ?auto_1769530 ) ) ( not ( = ?auto_1769524 ?auto_1769531 ) ) ( not ( = ?auto_1769524 ?auto_1769532 ) ) ( not ( = ?auto_1769524 ?auto_1769533 ) ) ( not ( = ?auto_1769524 ?auto_1769534 ) ) ( not ( = ?auto_1769524 ?auto_1769539 ) ) ( not ( = ?auto_1769523 ?auto_1769525 ) ) ( not ( = ?auto_1769523 ?auto_1769526 ) ) ( not ( = ?auto_1769523 ?auto_1769527 ) ) ( not ( = ?auto_1769523 ?auto_1769528 ) ) ( not ( = ?auto_1769523 ?auto_1769529 ) ) ( not ( = ?auto_1769523 ?auto_1769530 ) ) ( not ( = ?auto_1769523 ?auto_1769531 ) ) ( not ( = ?auto_1769523 ?auto_1769532 ) ) ( not ( = ?auto_1769523 ?auto_1769533 ) ) ( not ( = ?auto_1769523 ?auto_1769534 ) ) ( not ( = ?auto_1769523 ?auto_1769539 ) ) ( not ( = ?auto_1769525 ?auto_1769526 ) ) ( not ( = ?auto_1769525 ?auto_1769527 ) ) ( not ( = ?auto_1769525 ?auto_1769528 ) ) ( not ( = ?auto_1769525 ?auto_1769529 ) ) ( not ( = ?auto_1769525 ?auto_1769530 ) ) ( not ( = ?auto_1769525 ?auto_1769531 ) ) ( not ( = ?auto_1769525 ?auto_1769532 ) ) ( not ( = ?auto_1769525 ?auto_1769533 ) ) ( not ( = ?auto_1769525 ?auto_1769534 ) ) ( not ( = ?auto_1769525 ?auto_1769539 ) ) ( not ( = ?auto_1769526 ?auto_1769527 ) ) ( not ( = ?auto_1769526 ?auto_1769528 ) ) ( not ( = ?auto_1769526 ?auto_1769529 ) ) ( not ( = ?auto_1769526 ?auto_1769530 ) ) ( not ( = ?auto_1769526 ?auto_1769531 ) ) ( not ( = ?auto_1769526 ?auto_1769532 ) ) ( not ( = ?auto_1769526 ?auto_1769533 ) ) ( not ( = ?auto_1769526 ?auto_1769534 ) ) ( not ( = ?auto_1769526 ?auto_1769539 ) ) ( not ( = ?auto_1769527 ?auto_1769528 ) ) ( not ( = ?auto_1769527 ?auto_1769529 ) ) ( not ( = ?auto_1769527 ?auto_1769530 ) ) ( not ( = ?auto_1769527 ?auto_1769531 ) ) ( not ( = ?auto_1769527 ?auto_1769532 ) ) ( not ( = ?auto_1769527 ?auto_1769533 ) ) ( not ( = ?auto_1769527 ?auto_1769534 ) ) ( not ( = ?auto_1769527 ?auto_1769539 ) ) ( not ( = ?auto_1769528 ?auto_1769529 ) ) ( not ( = ?auto_1769528 ?auto_1769530 ) ) ( not ( = ?auto_1769528 ?auto_1769531 ) ) ( not ( = ?auto_1769528 ?auto_1769532 ) ) ( not ( = ?auto_1769528 ?auto_1769533 ) ) ( not ( = ?auto_1769528 ?auto_1769534 ) ) ( not ( = ?auto_1769528 ?auto_1769539 ) ) ( not ( = ?auto_1769529 ?auto_1769530 ) ) ( not ( = ?auto_1769529 ?auto_1769531 ) ) ( not ( = ?auto_1769529 ?auto_1769532 ) ) ( not ( = ?auto_1769529 ?auto_1769533 ) ) ( not ( = ?auto_1769529 ?auto_1769534 ) ) ( not ( = ?auto_1769529 ?auto_1769539 ) ) ( not ( = ?auto_1769530 ?auto_1769531 ) ) ( not ( = ?auto_1769530 ?auto_1769532 ) ) ( not ( = ?auto_1769530 ?auto_1769533 ) ) ( not ( = ?auto_1769530 ?auto_1769534 ) ) ( not ( = ?auto_1769530 ?auto_1769539 ) ) ( not ( = ?auto_1769531 ?auto_1769532 ) ) ( not ( = ?auto_1769531 ?auto_1769533 ) ) ( not ( = ?auto_1769531 ?auto_1769534 ) ) ( not ( = ?auto_1769531 ?auto_1769539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769532 ?auto_1769533 ?auto_1769534 )
      ( MAKE-14CRATE-VERIFY ?auto_1769520 ?auto_1769521 ?auto_1769522 ?auto_1769524 ?auto_1769523 ?auto_1769525 ?auto_1769526 ?auto_1769527 ?auto_1769528 ?auto_1769529 ?auto_1769530 ?auto_1769531 ?auto_1769532 ?auto_1769533 ?auto_1769534 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769724 - SURFACE
      ?auto_1769725 - SURFACE
      ?auto_1769726 - SURFACE
      ?auto_1769728 - SURFACE
      ?auto_1769727 - SURFACE
      ?auto_1769729 - SURFACE
      ?auto_1769730 - SURFACE
      ?auto_1769731 - SURFACE
      ?auto_1769732 - SURFACE
      ?auto_1769733 - SURFACE
      ?auto_1769734 - SURFACE
      ?auto_1769735 - SURFACE
      ?auto_1769736 - SURFACE
      ?auto_1769737 - SURFACE
      ?auto_1769738 - SURFACE
    )
    :vars
    (
      ?auto_1769744 - HOIST
      ?auto_1769741 - PLACE
      ?auto_1769742 - PLACE
      ?auto_1769739 - HOIST
      ?auto_1769740 - SURFACE
      ?auto_1769743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769744 ?auto_1769741 ) ( IS-CRATE ?auto_1769738 ) ( not ( = ?auto_1769737 ?auto_1769738 ) ) ( not ( = ?auto_1769736 ?auto_1769737 ) ) ( not ( = ?auto_1769736 ?auto_1769738 ) ) ( not ( = ?auto_1769742 ?auto_1769741 ) ) ( HOIST-AT ?auto_1769739 ?auto_1769742 ) ( not ( = ?auto_1769744 ?auto_1769739 ) ) ( AVAILABLE ?auto_1769739 ) ( SURFACE-AT ?auto_1769738 ?auto_1769742 ) ( ON ?auto_1769738 ?auto_1769740 ) ( CLEAR ?auto_1769738 ) ( not ( = ?auto_1769737 ?auto_1769740 ) ) ( not ( = ?auto_1769738 ?auto_1769740 ) ) ( not ( = ?auto_1769736 ?auto_1769740 ) ) ( TRUCK-AT ?auto_1769743 ?auto_1769741 ) ( SURFACE-AT ?auto_1769736 ?auto_1769741 ) ( CLEAR ?auto_1769736 ) ( IS-CRATE ?auto_1769737 ) ( AVAILABLE ?auto_1769744 ) ( IN ?auto_1769737 ?auto_1769743 ) ( ON ?auto_1769725 ?auto_1769724 ) ( ON ?auto_1769726 ?auto_1769725 ) ( ON ?auto_1769728 ?auto_1769726 ) ( ON ?auto_1769727 ?auto_1769728 ) ( ON ?auto_1769729 ?auto_1769727 ) ( ON ?auto_1769730 ?auto_1769729 ) ( ON ?auto_1769731 ?auto_1769730 ) ( ON ?auto_1769732 ?auto_1769731 ) ( ON ?auto_1769733 ?auto_1769732 ) ( ON ?auto_1769734 ?auto_1769733 ) ( ON ?auto_1769735 ?auto_1769734 ) ( ON ?auto_1769736 ?auto_1769735 ) ( not ( = ?auto_1769724 ?auto_1769725 ) ) ( not ( = ?auto_1769724 ?auto_1769726 ) ) ( not ( = ?auto_1769724 ?auto_1769728 ) ) ( not ( = ?auto_1769724 ?auto_1769727 ) ) ( not ( = ?auto_1769724 ?auto_1769729 ) ) ( not ( = ?auto_1769724 ?auto_1769730 ) ) ( not ( = ?auto_1769724 ?auto_1769731 ) ) ( not ( = ?auto_1769724 ?auto_1769732 ) ) ( not ( = ?auto_1769724 ?auto_1769733 ) ) ( not ( = ?auto_1769724 ?auto_1769734 ) ) ( not ( = ?auto_1769724 ?auto_1769735 ) ) ( not ( = ?auto_1769724 ?auto_1769736 ) ) ( not ( = ?auto_1769724 ?auto_1769737 ) ) ( not ( = ?auto_1769724 ?auto_1769738 ) ) ( not ( = ?auto_1769724 ?auto_1769740 ) ) ( not ( = ?auto_1769725 ?auto_1769726 ) ) ( not ( = ?auto_1769725 ?auto_1769728 ) ) ( not ( = ?auto_1769725 ?auto_1769727 ) ) ( not ( = ?auto_1769725 ?auto_1769729 ) ) ( not ( = ?auto_1769725 ?auto_1769730 ) ) ( not ( = ?auto_1769725 ?auto_1769731 ) ) ( not ( = ?auto_1769725 ?auto_1769732 ) ) ( not ( = ?auto_1769725 ?auto_1769733 ) ) ( not ( = ?auto_1769725 ?auto_1769734 ) ) ( not ( = ?auto_1769725 ?auto_1769735 ) ) ( not ( = ?auto_1769725 ?auto_1769736 ) ) ( not ( = ?auto_1769725 ?auto_1769737 ) ) ( not ( = ?auto_1769725 ?auto_1769738 ) ) ( not ( = ?auto_1769725 ?auto_1769740 ) ) ( not ( = ?auto_1769726 ?auto_1769728 ) ) ( not ( = ?auto_1769726 ?auto_1769727 ) ) ( not ( = ?auto_1769726 ?auto_1769729 ) ) ( not ( = ?auto_1769726 ?auto_1769730 ) ) ( not ( = ?auto_1769726 ?auto_1769731 ) ) ( not ( = ?auto_1769726 ?auto_1769732 ) ) ( not ( = ?auto_1769726 ?auto_1769733 ) ) ( not ( = ?auto_1769726 ?auto_1769734 ) ) ( not ( = ?auto_1769726 ?auto_1769735 ) ) ( not ( = ?auto_1769726 ?auto_1769736 ) ) ( not ( = ?auto_1769726 ?auto_1769737 ) ) ( not ( = ?auto_1769726 ?auto_1769738 ) ) ( not ( = ?auto_1769726 ?auto_1769740 ) ) ( not ( = ?auto_1769728 ?auto_1769727 ) ) ( not ( = ?auto_1769728 ?auto_1769729 ) ) ( not ( = ?auto_1769728 ?auto_1769730 ) ) ( not ( = ?auto_1769728 ?auto_1769731 ) ) ( not ( = ?auto_1769728 ?auto_1769732 ) ) ( not ( = ?auto_1769728 ?auto_1769733 ) ) ( not ( = ?auto_1769728 ?auto_1769734 ) ) ( not ( = ?auto_1769728 ?auto_1769735 ) ) ( not ( = ?auto_1769728 ?auto_1769736 ) ) ( not ( = ?auto_1769728 ?auto_1769737 ) ) ( not ( = ?auto_1769728 ?auto_1769738 ) ) ( not ( = ?auto_1769728 ?auto_1769740 ) ) ( not ( = ?auto_1769727 ?auto_1769729 ) ) ( not ( = ?auto_1769727 ?auto_1769730 ) ) ( not ( = ?auto_1769727 ?auto_1769731 ) ) ( not ( = ?auto_1769727 ?auto_1769732 ) ) ( not ( = ?auto_1769727 ?auto_1769733 ) ) ( not ( = ?auto_1769727 ?auto_1769734 ) ) ( not ( = ?auto_1769727 ?auto_1769735 ) ) ( not ( = ?auto_1769727 ?auto_1769736 ) ) ( not ( = ?auto_1769727 ?auto_1769737 ) ) ( not ( = ?auto_1769727 ?auto_1769738 ) ) ( not ( = ?auto_1769727 ?auto_1769740 ) ) ( not ( = ?auto_1769729 ?auto_1769730 ) ) ( not ( = ?auto_1769729 ?auto_1769731 ) ) ( not ( = ?auto_1769729 ?auto_1769732 ) ) ( not ( = ?auto_1769729 ?auto_1769733 ) ) ( not ( = ?auto_1769729 ?auto_1769734 ) ) ( not ( = ?auto_1769729 ?auto_1769735 ) ) ( not ( = ?auto_1769729 ?auto_1769736 ) ) ( not ( = ?auto_1769729 ?auto_1769737 ) ) ( not ( = ?auto_1769729 ?auto_1769738 ) ) ( not ( = ?auto_1769729 ?auto_1769740 ) ) ( not ( = ?auto_1769730 ?auto_1769731 ) ) ( not ( = ?auto_1769730 ?auto_1769732 ) ) ( not ( = ?auto_1769730 ?auto_1769733 ) ) ( not ( = ?auto_1769730 ?auto_1769734 ) ) ( not ( = ?auto_1769730 ?auto_1769735 ) ) ( not ( = ?auto_1769730 ?auto_1769736 ) ) ( not ( = ?auto_1769730 ?auto_1769737 ) ) ( not ( = ?auto_1769730 ?auto_1769738 ) ) ( not ( = ?auto_1769730 ?auto_1769740 ) ) ( not ( = ?auto_1769731 ?auto_1769732 ) ) ( not ( = ?auto_1769731 ?auto_1769733 ) ) ( not ( = ?auto_1769731 ?auto_1769734 ) ) ( not ( = ?auto_1769731 ?auto_1769735 ) ) ( not ( = ?auto_1769731 ?auto_1769736 ) ) ( not ( = ?auto_1769731 ?auto_1769737 ) ) ( not ( = ?auto_1769731 ?auto_1769738 ) ) ( not ( = ?auto_1769731 ?auto_1769740 ) ) ( not ( = ?auto_1769732 ?auto_1769733 ) ) ( not ( = ?auto_1769732 ?auto_1769734 ) ) ( not ( = ?auto_1769732 ?auto_1769735 ) ) ( not ( = ?auto_1769732 ?auto_1769736 ) ) ( not ( = ?auto_1769732 ?auto_1769737 ) ) ( not ( = ?auto_1769732 ?auto_1769738 ) ) ( not ( = ?auto_1769732 ?auto_1769740 ) ) ( not ( = ?auto_1769733 ?auto_1769734 ) ) ( not ( = ?auto_1769733 ?auto_1769735 ) ) ( not ( = ?auto_1769733 ?auto_1769736 ) ) ( not ( = ?auto_1769733 ?auto_1769737 ) ) ( not ( = ?auto_1769733 ?auto_1769738 ) ) ( not ( = ?auto_1769733 ?auto_1769740 ) ) ( not ( = ?auto_1769734 ?auto_1769735 ) ) ( not ( = ?auto_1769734 ?auto_1769736 ) ) ( not ( = ?auto_1769734 ?auto_1769737 ) ) ( not ( = ?auto_1769734 ?auto_1769738 ) ) ( not ( = ?auto_1769734 ?auto_1769740 ) ) ( not ( = ?auto_1769735 ?auto_1769736 ) ) ( not ( = ?auto_1769735 ?auto_1769737 ) ) ( not ( = ?auto_1769735 ?auto_1769738 ) ) ( not ( = ?auto_1769735 ?auto_1769740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769736 ?auto_1769737 ?auto_1769738 )
      ( MAKE-14CRATE-VERIFY ?auto_1769724 ?auto_1769725 ?auto_1769726 ?auto_1769728 ?auto_1769727 ?auto_1769729 ?auto_1769730 ?auto_1769731 ?auto_1769732 ?auto_1769733 ?auto_1769734 ?auto_1769735 ?auto_1769736 ?auto_1769737 ?auto_1769738 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1786917 - SURFACE
      ?auto_1786918 - SURFACE
      ?auto_1786919 - SURFACE
      ?auto_1786921 - SURFACE
      ?auto_1786920 - SURFACE
      ?auto_1786922 - SURFACE
      ?auto_1786923 - SURFACE
      ?auto_1786924 - SURFACE
      ?auto_1786925 - SURFACE
      ?auto_1786926 - SURFACE
      ?auto_1786927 - SURFACE
      ?auto_1786928 - SURFACE
      ?auto_1786929 - SURFACE
      ?auto_1786930 - SURFACE
      ?auto_1786931 - SURFACE
      ?auto_1786932 - SURFACE
    )
    :vars
    (
      ?auto_1786933 - HOIST
      ?auto_1786934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1786933 ?auto_1786934 ) ( SURFACE-AT ?auto_1786931 ?auto_1786934 ) ( CLEAR ?auto_1786931 ) ( LIFTING ?auto_1786933 ?auto_1786932 ) ( IS-CRATE ?auto_1786932 ) ( not ( = ?auto_1786931 ?auto_1786932 ) ) ( ON ?auto_1786918 ?auto_1786917 ) ( ON ?auto_1786919 ?auto_1786918 ) ( ON ?auto_1786921 ?auto_1786919 ) ( ON ?auto_1786920 ?auto_1786921 ) ( ON ?auto_1786922 ?auto_1786920 ) ( ON ?auto_1786923 ?auto_1786922 ) ( ON ?auto_1786924 ?auto_1786923 ) ( ON ?auto_1786925 ?auto_1786924 ) ( ON ?auto_1786926 ?auto_1786925 ) ( ON ?auto_1786927 ?auto_1786926 ) ( ON ?auto_1786928 ?auto_1786927 ) ( ON ?auto_1786929 ?auto_1786928 ) ( ON ?auto_1786930 ?auto_1786929 ) ( ON ?auto_1786931 ?auto_1786930 ) ( not ( = ?auto_1786917 ?auto_1786918 ) ) ( not ( = ?auto_1786917 ?auto_1786919 ) ) ( not ( = ?auto_1786917 ?auto_1786921 ) ) ( not ( = ?auto_1786917 ?auto_1786920 ) ) ( not ( = ?auto_1786917 ?auto_1786922 ) ) ( not ( = ?auto_1786917 ?auto_1786923 ) ) ( not ( = ?auto_1786917 ?auto_1786924 ) ) ( not ( = ?auto_1786917 ?auto_1786925 ) ) ( not ( = ?auto_1786917 ?auto_1786926 ) ) ( not ( = ?auto_1786917 ?auto_1786927 ) ) ( not ( = ?auto_1786917 ?auto_1786928 ) ) ( not ( = ?auto_1786917 ?auto_1786929 ) ) ( not ( = ?auto_1786917 ?auto_1786930 ) ) ( not ( = ?auto_1786917 ?auto_1786931 ) ) ( not ( = ?auto_1786917 ?auto_1786932 ) ) ( not ( = ?auto_1786918 ?auto_1786919 ) ) ( not ( = ?auto_1786918 ?auto_1786921 ) ) ( not ( = ?auto_1786918 ?auto_1786920 ) ) ( not ( = ?auto_1786918 ?auto_1786922 ) ) ( not ( = ?auto_1786918 ?auto_1786923 ) ) ( not ( = ?auto_1786918 ?auto_1786924 ) ) ( not ( = ?auto_1786918 ?auto_1786925 ) ) ( not ( = ?auto_1786918 ?auto_1786926 ) ) ( not ( = ?auto_1786918 ?auto_1786927 ) ) ( not ( = ?auto_1786918 ?auto_1786928 ) ) ( not ( = ?auto_1786918 ?auto_1786929 ) ) ( not ( = ?auto_1786918 ?auto_1786930 ) ) ( not ( = ?auto_1786918 ?auto_1786931 ) ) ( not ( = ?auto_1786918 ?auto_1786932 ) ) ( not ( = ?auto_1786919 ?auto_1786921 ) ) ( not ( = ?auto_1786919 ?auto_1786920 ) ) ( not ( = ?auto_1786919 ?auto_1786922 ) ) ( not ( = ?auto_1786919 ?auto_1786923 ) ) ( not ( = ?auto_1786919 ?auto_1786924 ) ) ( not ( = ?auto_1786919 ?auto_1786925 ) ) ( not ( = ?auto_1786919 ?auto_1786926 ) ) ( not ( = ?auto_1786919 ?auto_1786927 ) ) ( not ( = ?auto_1786919 ?auto_1786928 ) ) ( not ( = ?auto_1786919 ?auto_1786929 ) ) ( not ( = ?auto_1786919 ?auto_1786930 ) ) ( not ( = ?auto_1786919 ?auto_1786931 ) ) ( not ( = ?auto_1786919 ?auto_1786932 ) ) ( not ( = ?auto_1786921 ?auto_1786920 ) ) ( not ( = ?auto_1786921 ?auto_1786922 ) ) ( not ( = ?auto_1786921 ?auto_1786923 ) ) ( not ( = ?auto_1786921 ?auto_1786924 ) ) ( not ( = ?auto_1786921 ?auto_1786925 ) ) ( not ( = ?auto_1786921 ?auto_1786926 ) ) ( not ( = ?auto_1786921 ?auto_1786927 ) ) ( not ( = ?auto_1786921 ?auto_1786928 ) ) ( not ( = ?auto_1786921 ?auto_1786929 ) ) ( not ( = ?auto_1786921 ?auto_1786930 ) ) ( not ( = ?auto_1786921 ?auto_1786931 ) ) ( not ( = ?auto_1786921 ?auto_1786932 ) ) ( not ( = ?auto_1786920 ?auto_1786922 ) ) ( not ( = ?auto_1786920 ?auto_1786923 ) ) ( not ( = ?auto_1786920 ?auto_1786924 ) ) ( not ( = ?auto_1786920 ?auto_1786925 ) ) ( not ( = ?auto_1786920 ?auto_1786926 ) ) ( not ( = ?auto_1786920 ?auto_1786927 ) ) ( not ( = ?auto_1786920 ?auto_1786928 ) ) ( not ( = ?auto_1786920 ?auto_1786929 ) ) ( not ( = ?auto_1786920 ?auto_1786930 ) ) ( not ( = ?auto_1786920 ?auto_1786931 ) ) ( not ( = ?auto_1786920 ?auto_1786932 ) ) ( not ( = ?auto_1786922 ?auto_1786923 ) ) ( not ( = ?auto_1786922 ?auto_1786924 ) ) ( not ( = ?auto_1786922 ?auto_1786925 ) ) ( not ( = ?auto_1786922 ?auto_1786926 ) ) ( not ( = ?auto_1786922 ?auto_1786927 ) ) ( not ( = ?auto_1786922 ?auto_1786928 ) ) ( not ( = ?auto_1786922 ?auto_1786929 ) ) ( not ( = ?auto_1786922 ?auto_1786930 ) ) ( not ( = ?auto_1786922 ?auto_1786931 ) ) ( not ( = ?auto_1786922 ?auto_1786932 ) ) ( not ( = ?auto_1786923 ?auto_1786924 ) ) ( not ( = ?auto_1786923 ?auto_1786925 ) ) ( not ( = ?auto_1786923 ?auto_1786926 ) ) ( not ( = ?auto_1786923 ?auto_1786927 ) ) ( not ( = ?auto_1786923 ?auto_1786928 ) ) ( not ( = ?auto_1786923 ?auto_1786929 ) ) ( not ( = ?auto_1786923 ?auto_1786930 ) ) ( not ( = ?auto_1786923 ?auto_1786931 ) ) ( not ( = ?auto_1786923 ?auto_1786932 ) ) ( not ( = ?auto_1786924 ?auto_1786925 ) ) ( not ( = ?auto_1786924 ?auto_1786926 ) ) ( not ( = ?auto_1786924 ?auto_1786927 ) ) ( not ( = ?auto_1786924 ?auto_1786928 ) ) ( not ( = ?auto_1786924 ?auto_1786929 ) ) ( not ( = ?auto_1786924 ?auto_1786930 ) ) ( not ( = ?auto_1786924 ?auto_1786931 ) ) ( not ( = ?auto_1786924 ?auto_1786932 ) ) ( not ( = ?auto_1786925 ?auto_1786926 ) ) ( not ( = ?auto_1786925 ?auto_1786927 ) ) ( not ( = ?auto_1786925 ?auto_1786928 ) ) ( not ( = ?auto_1786925 ?auto_1786929 ) ) ( not ( = ?auto_1786925 ?auto_1786930 ) ) ( not ( = ?auto_1786925 ?auto_1786931 ) ) ( not ( = ?auto_1786925 ?auto_1786932 ) ) ( not ( = ?auto_1786926 ?auto_1786927 ) ) ( not ( = ?auto_1786926 ?auto_1786928 ) ) ( not ( = ?auto_1786926 ?auto_1786929 ) ) ( not ( = ?auto_1786926 ?auto_1786930 ) ) ( not ( = ?auto_1786926 ?auto_1786931 ) ) ( not ( = ?auto_1786926 ?auto_1786932 ) ) ( not ( = ?auto_1786927 ?auto_1786928 ) ) ( not ( = ?auto_1786927 ?auto_1786929 ) ) ( not ( = ?auto_1786927 ?auto_1786930 ) ) ( not ( = ?auto_1786927 ?auto_1786931 ) ) ( not ( = ?auto_1786927 ?auto_1786932 ) ) ( not ( = ?auto_1786928 ?auto_1786929 ) ) ( not ( = ?auto_1786928 ?auto_1786930 ) ) ( not ( = ?auto_1786928 ?auto_1786931 ) ) ( not ( = ?auto_1786928 ?auto_1786932 ) ) ( not ( = ?auto_1786929 ?auto_1786930 ) ) ( not ( = ?auto_1786929 ?auto_1786931 ) ) ( not ( = ?auto_1786929 ?auto_1786932 ) ) ( not ( = ?auto_1786930 ?auto_1786931 ) ) ( not ( = ?auto_1786930 ?auto_1786932 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1786931 ?auto_1786932 )
      ( MAKE-15CRATE-VERIFY ?auto_1786917 ?auto_1786918 ?auto_1786919 ?auto_1786921 ?auto_1786920 ?auto_1786922 ?auto_1786923 ?auto_1786924 ?auto_1786925 ?auto_1786926 ?auto_1786927 ?auto_1786928 ?auto_1786929 ?auto_1786930 ?auto_1786931 ?auto_1786932 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787096 - SURFACE
      ?auto_1787097 - SURFACE
      ?auto_1787098 - SURFACE
      ?auto_1787100 - SURFACE
      ?auto_1787099 - SURFACE
      ?auto_1787101 - SURFACE
      ?auto_1787102 - SURFACE
      ?auto_1787103 - SURFACE
      ?auto_1787104 - SURFACE
      ?auto_1787105 - SURFACE
      ?auto_1787106 - SURFACE
      ?auto_1787107 - SURFACE
      ?auto_1787108 - SURFACE
      ?auto_1787109 - SURFACE
      ?auto_1787110 - SURFACE
      ?auto_1787111 - SURFACE
    )
    :vars
    (
      ?auto_1787112 - HOIST
      ?auto_1787113 - PLACE
      ?auto_1787114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787112 ?auto_1787113 ) ( SURFACE-AT ?auto_1787110 ?auto_1787113 ) ( CLEAR ?auto_1787110 ) ( IS-CRATE ?auto_1787111 ) ( not ( = ?auto_1787110 ?auto_1787111 ) ) ( TRUCK-AT ?auto_1787114 ?auto_1787113 ) ( AVAILABLE ?auto_1787112 ) ( IN ?auto_1787111 ?auto_1787114 ) ( ON ?auto_1787110 ?auto_1787109 ) ( not ( = ?auto_1787109 ?auto_1787110 ) ) ( not ( = ?auto_1787109 ?auto_1787111 ) ) ( ON ?auto_1787097 ?auto_1787096 ) ( ON ?auto_1787098 ?auto_1787097 ) ( ON ?auto_1787100 ?auto_1787098 ) ( ON ?auto_1787099 ?auto_1787100 ) ( ON ?auto_1787101 ?auto_1787099 ) ( ON ?auto_1787102 ?auto_1787101 ) ( ON ?auto_1787103 ?auto_1787102 ) ( ON ?auto_1787104 ?auto_1787103 ) ( ON ?auto_1787105 ?auto_1787104 ) ( ON ?auto_1787106 ?auto_1787105 ) ( ON ?auto_1787107 ?auto_1787106 ) ( ON ?auto_1787108 ?auto_1787107 ) ( ON ?auto_1787109 ?auto_1787108 ) ( not ( = ?auto_1787096 ?auto_1787097 ) ) ( not ( = ?auto_1787096 ?auto_1787098 ) ) ( not ( = ?auto_1787096 ?auto_1787100 ) ) ( not ( = ?auto_1787096 ?auto_1787099 ) ) ( not ( = ?auto_1787096 ?auto_1787101 ) ) ( not ( = ?auto_1787096 ?auto_1787102 ) ) ( not ( = ?auto_1787096 ?auto_1787103 ) ) ( not ( = ?auto_1787096 ?auto_1787104 ) ) ( not ( = ?auto_1787096 ?auto_1787105 ) ) ( not ( = ?auto_1787096 ?auto_1787106 ) ) ( not ( = ?auto_1787096 ?auto_1787107 ) ) ( not ( = ?auto_1787096 ?auto_1787108 ) ) ( not ( = ?auto_1787096 ?auto_1787109 ) ) ( not ( = ?auto_1787096 ?auto_1787110 ) ) ( not ( = ?auto_1787096 ?auto_1787111 ) ) ( not ( = ?auto_1787097 ?auto_1787098 ) ) ( not ( = ?auto_1787097 ?auto_1787100 ) ) ( not ( = ?auto_1787097 ?auto_1787099 ) ) ( not ( = ?auto_1787097 ?auto_1787101 ) ) ( not ( = ?auto_1787097 ?auto_1787102 ) ) ( not ( = ?auto_1787097 ?auto_1787103 ) ) ( not ( = ?auto_1787097 ?auto_1787104 ) ) ( not ( = ?auto_1787097 ?auto_1787105 ) ) ( not ( = ?auto_1787097 ?auto_1787106 ) ) ( not ( = ?auto_1787097 ?auto_1787107 ) ) ( not ( = ?auto_1787097 ?auto_1787108 ) ) ( not ( = ?auto_1787097 ?auto_1787109 ) ) ( not ( = ?auto_1787097 ?auto_1787110 ) ) ( not ( = ?auto_1787097 ?auto_1787111 ) ) ( not ( = ?auto_1787098 ?auto_1787100 ) ) ( not ( = ?auto_1787098 ?auto_1787099 ) ) ( not ( = ?auto_1787098 ?auto_1787101 ) ) ( not ( = ?auto_1787098 ?auto_1787102 ) ) ( not ( = ?auto_1787098 ?auto_1787103 ) ) ( not ( = ?auto_1787098 ?auto_1787104 ) ) ( not ( = ?auto_1787098 ?auto_1787105 ) ) ( not ( = ?auto_1787098 ?auto_1787106 ) ) ( not ( = ?auto_1787098 ?auto_1787107 ) ) ( not ( = ?auto_1787098 ?auto_1787108 ) ) ( not ( = ?auto_1787098 ?auto_1787109 ) ) ( not ( = ?auto_1787098 ?auto_1787110 ) ) ( not ( = ?auto_1787098 ?auto_1787111 ) ) ( not ( = ?auto_1787100 ?auto_1787099 ) ) ( not ( = ?auto_1787100 ?auto_1787101 ) ) ( not ( = ?auto_1787100 ?auto_1787102 ) ) ( not ( = ?auto_1787100 ?auto_1787103 ) ) ( not ( = ?auto_1787100 ?auto_1787104 ) ) ( not ( = ?auto_1787100 ?auto_1787105 ) ) ( not ( = ?auto_1787100 ?auto_1787106 ) ) ( not ( = ?auto_1787100 ?auto_1787107 ) ) ( not ( = ?auto_1787100 ?auto_1787108 ) ) ( not ( = ?auto_1787100 ?auto_1787109 ) ) ( not ( = ?auto_1787100 ?auto_1787110 ) ) ( not ( = ?auto_1787100 ?auto_1787111 ) ) ( not ( = ?auto_1787099 ?auto_1787101 ) ) ( not ( = ?auto_1787099 ?auto_1787102 ) ) ( not ( = ?auto_1787099 ?auto_1787103 ) ) ( not ( = ?auto_1787099 ?auto_1787104 ) ) ( not ( = ?auto_1787099 ?auto_1787105 ) ) ( not ( = ?auto_1787099 ?auto_1787106 ) ) ( not ( = ?auto_1787099 ?auto_1787107 ) ) ( not ( = ?auto_1787099 ?auto_1787108 ) ) ( not ( = ?auto_1787099 ?auto_1787109 ) ) ( not ( = ?auto_1787099 ?auto_1787110 ) ) ( not ( = ?auto_1787099 ?auto_1787111 ) ) ( not ( = ?auto_1787101 ?auto_1787102 ) ) ( not ( = ?auto_1787101 ?auto_1787103 ) ) ( not ( = ?auto_1787101 ?auto_1787104 ) ) ( not ( = ?auto_1787101 ?auto_1787105 ) ) ( not ( = ?auto_1787101 ?auto_1787106 ) ) ( not ( = ?auto_1787101 ?auto_1787107 ) ) ( not ( = ?auto_1787101 ?auto_1787108 ) ) ( not ( = ?auto_1787101 ?auto_1787109 ) ) ( not ( = ?auto_1787101 ?auto_1787110 ) ) ( not ( = ?auto_1787101 ?auto_1787111 ) ) ( not ( = ?auto_1787102 ?auto_1787103 ) ) ( not ( = ?auto_1787102 ?auto_1787104 ) ) ( not ( = ?auto_1787102 ?auto_1787105 ) ) ( not ( = ?auto_1787102 ?auto_1787106 ) ) ( not ( = ?auto_1787102 ?auto_1787107 ) ) ( not ( = ?auto_1787102 ?auto_1787108 ) ) ( not ( = ?auto_1787102 ?auto_1787109 ) ) ( not ( = ?auto_1787102 ?auto_1787110 ) ) ( not ( = ?auto_1787102 ?auto_1787111 ) ) ( not ( = ?auto_1787103 ?auto_1787104 ) ) ( not ( = ?auto_1787103 ?auto_1787105 ) ) ( not ( = ?auto_1787103 ?auto_1787106 ) ) ( not ( = ?auto_1787103 ?auto_1787107 ) ) ( not ( = ?auto_1787103 ?auto_1787108 ) ) ( not ( = ?auto_1787103 ?auto_1787109 ) ) ( not ( = ?auto_1787103 ?auto_1787110 ) ) ( not ( = ?auto_1787103 ?auto_1787111 ) ) ( not ( = ?auto_1787104 ?auto_1787105 ) ) ( not ( = ?auto_1787104 ?auto_1787106 ) ) ( not ( = ?auto_1787104 ?auto_1787107 ) ) ( not ( = ?auto_1787104 ?auto_1787108 ) ) ( not ( = ?auto_1787104 ?auto_1787109 ) ) ( not ( = ?auto_1787104 ?auto_1787110 ) ) ( not ( = ?auto_1787104 ?auto_1787111 ) ) ( not ( = ?auto_1787105 ?auto_1787106 ) ) ( not ( = ?auto_1787105 ?auto_1787107 ) ) ( not ( = ?auto_1787105 ?auto_1787108 ) ) ( not ( = ?auto_1787105 ?auto_1787109 ) ) ( not ( = ?auto_1787105 ?auto_1787110 ) ) ( not ( = ?auto_1787105 ?auto_1787111 ) ) ( not ( = ?auto_1787106 ?auto_1787107 ) ) ( not ( = ?auto_1787106 ?auto_1787108 ) ) ( not ( = ?auto_1787106 ?auto_1787109 ) ) ( not ( = ?auto_1787106 ?auto_1787110 ) ) ( not ( = ?auto_1787106 ?auto_1787111 ) ) ( not ( = ?auto_1787107 ?auto_1787108 ) ) ( not ( = ?auto_1787107 ?auto_1787109 ) ) ( not ( = ?auto_1787107 ?auto_1787110 ) ) ( not ( = ?auto_1787107 ?auto_1787111 ) ) ( not ( = ?auto_1787108 ?auto_1787109 ) ) ( not ( = ?auto_1787108 ?auto_1787110 ) ) ( not ( = ?auto_1787108 ?auto_1787111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787109 ?auto_1787110 ?auto_1787111 )
      ( MAKE-15CRATE-VERIFY ?auto_1787096 ?auto_1787097 ?auto_1787098 ?auto_1787100 ?auto_1787099 ?auto_1787101 ?auto_1787102 ?auto_1787103 ?auto_1787104 ?auto_1787105 ?auto_1787106 ?auto_1787107 ?auto_1787108 ?auto_1787109 ?auto_1787110 ?auto_1787111 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787291 - SURFACE
      ?auto_1787292 - SURFACE
      ?auto_1787293 - SURFACE
      ?auto_1787295 - SURFACE
      ?auto_1787294 - SURFACE
      ?auto_1787296 - SURFACE
      ?auto_1787297 - SURFACE
      ?auto_1787298 - SURFACE
      ?auto_1787299 - SURFACE
      ?auto_1787300 - SURFACE
      ?auto_1787301 - SURFACE
      ?auto_1787302 - SURFACE
      ?auto_1787303 - SURFACE
      ?auto_1787304 - SURFACE
      ?auto_1787305 - SURFACE
      ?auto_1787306 - SURFACE
    )
    :vars
    (
      ?auto_1787310 - HOIST
      ?auto_1787308 - PLACE
      ?auto_1787309 - TRUCK
      ?auto_1787307 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787310 ?auto_1787308 ) ( SURFACE-AT ?auto_1787305 ?auto_1787308 ) ( CLEAR ?auto_1787305 ) ( IS-CRATE ?auto_1787306 ) ( not ( = ?auto_1787305 ?auto_1787306 ) ) ( AVAILABLE ?auto_1787310 ) ( IN ?auto_1787306 ?auto_1787309 ) ( ON ?auto_1787305 ?auto_1787304 ) ( not ( = ?auto_1787304 ?auto_1787305 ) ) ( not ( = ?auto_1787304 ?auto_1787306 ) ) ( TRUCK-AT ?auto_1787309 ?auto_1787307 ) ( not ( = ?auto_1787307 ?auto_1787308 ) ) ( ON ?auto_1787292 ?auto_1787291 ) ( ON ?auto_1787293 ?auto_1787292 ) ( ON ?auto_1787295 ?auto_1787293 ) ( ON ?auto_1787294 ?auto_1787295 ) ( ON ?auto_1787296 ?auto_1787294 ) ( ON ?auto_1787297 ?auto_1787296 ) ( ON ?auto_1787298 ?auto_1787297 ) ( ON ?auto_1787299 ?auto_1787298 ) ( ON ?auto_1787300 ?auto_1787299 ) ( ON ?auto_1787301 ?auto_1787300 ) ( ON ?auto_1787302 ?auto_1787301 ) ( ON ?auto_1787303 ?auto_1787302 ) ( ON ?auto_1787304 ?auto_1787303 ) ( not ( = ?auto_1787291 ?auto_1787292 ) ) ( not ( = ?auto_1787291 ?auto_1787293 ) ) ( not ( = ?auto_1787291 ?auto_1787295 ) ) ( not ( = ?auto_1787291 ?auto_1787294 ) ) ( not ( = ?auto_1787291 ?auto_1787296 ) ) ( not ( = ?auto_1787291 ?auto_1787297 ) ) ( not ( = ?auto_1787291 ?auto_1787298 ) ) ( not ( = ?auto_1787291 ?auto_1787299 ) ) ( not ( = ?auto_1787291 ?auto_1787300 ) ) ( not ( = ?auto_1787291 ?auto_1787301 ) ) ( not ( = ?auto_1787291 ?auto_1787302 ) ) ( not ( = ?auto_1787291 ?auto_1787303 ) ) ( not ( = ?auto_1787291 ?auto_1787304 ) ) ( not ( = ?auto_1787291 ?auto_1787305 ) ) ( not ( = ?auto_1787291 ?auto_1787306 ) ) ( not ( = ?auto_1787292 ?auto_1787293 ) ) ( not ( = ?auto_1787292 ?auto_1787295 ) ) ( not ( = ?auto_1787292 ?auto_1787294 ) ) ( not ( = ?auto_1787292 ?auto_1787296 ) ) ( not ( = ?auto_1787292 ?auto_1787297 ) ) ( not ( = ?auto_1787292 ?auto_1787298 ) ) ( not ( = ?auto_1787292 ?auto_1787299 ) ) ( not ( = ?auto_1787292 ?auto_1787300 ) ) ( not ( = ?auto_1787292 ?auto_1787301 ) ) ( not ( = ?auto_1787292 ?auto_1787302 ) ) ( not ( = ?auto_1787292 ?auto_1787303 ) ) ( not ( = ?auto_1787292 ?auto_1787304 ) ) ( not ( = ?auto_1787292 ?auto_1787305 ) ) ( not ( = ?auto_1787292 ?auto_1787306 ) ) ( not ( = ?auto_1787293 ?auto_1787295 ) ) ( not ( = ?auto_1787293 ?auto_1787294 ) ) ( not ( = ?auto_1787293 ?auto_1787296 ) ) ( not ( = ?auto_1787293 ?auto_1787297 ) ) ( not ( = ?auto_1787293 ?auto_1787298 ) ) ( not ( = ?auto_1787293 ?auto_1787299 ) ) ( not ( = ?auto_1787293 ?auto_1787300 ) ) ( not ( = ?auto_1787293 ?auto_1787301 ) ) ( not ( = ?auto_1787293 ?auto_1787302 ) ) ( not ( = ?auto_1787293 ?auto_1787303 ) ) ( not ( = ?auto_1787293 ?auto_1787304 ) ) ( not ( = ?auto_1787293 ?auto_1787305 ) ) ( not ( = ?auto_1787293 ?auto_1787306 ) ) ( not ( = ?auto_1787295 ?auto_1787294 ) ) ( not ( = ?auto_1787295 ?auto_1787296 ) ) ( not ( = ?auto_1787295 ?auto_1787297 ) ) ( not ( = ?auto_1787295 ?auto_1787298 ) ) ( not ( = ?auto_1787295 ?auto_1787299 ) ) ( not ( = ?auto_1787295 ?auto_1787300 ) ) ( not ( = ?auto_1787295 ?auto_1787301 ) ) ( not ( = ?auto_1787295 ?auto_1787302 ) ) ( not ( = ?auto_1787295 ?auto_1787303 ) ) ( not ( = ?auto_1787295 ?auto_1787304 ) ) ( not ( = ?auto_1787295 ?auto_1787305 ) ) ( not ( = ?auto_1787295 ?auto_1787306 ) ) ( not ( = ?auto_1787294 ?auto_1787296 ) ) ( not ( = ?auto_1787294 ?auto_1787297 ) ) ( not ( = ?auto_1787294 ?auto_1787298 ) ) ( not ( = ?auto_1787294 ?auto_1787299 ) ) ( not ( = ?auto_1787294 ?auto_1787300 ) ) ( not ( = ?auto_1787294 ?auto_1787301 ) ) ( not ( = ?auto_1787294 ?auto_1787302 ) ) ( not ( = ?auto_1787294 ?auto_1787303 ) ) ( not ( = ?auto_1787294 ?auto_1787304 ) ) ( not ( = ?auto_1787294 ?auto_1787305 ) ) ( not ( = ?auto_1787294 ?auto_1787306 ) ) ( not ( = ?auto_1787296 ?auto_1787297 ) ) ( not ( = ?auto_1787296 ?auto_1787298 ) ) ( not ( = ?auto_1787296 ?auto_1787299 ) ) ( not ( = ?auto_1787296 ?auto_1787300 ) ) ( not ( = ?auto_1787296 ?auto_1787301 ) ) ( not ( = ?auto_1787296 ?auto_1787302 ) ) ( not ( = ?auto_1787296 ?auto_1787303 ) ) ( not ( = ?auto_1787296 ?auto_1787304 ) ) ( not ( = ?auto_1787296 ?auto_1787305 ) ) ( not ( = ?auto_1787296 ?auto_1787306 ) ) ( not ( = ?auto_1787297 ?auto_1787298 ) ) ( not ( = ?auto_1787297 ?auto_1787299 ) ) ( not ( = ?auto_1787297 ?auto_1787300 ) ) ( not ( = ?auto_1787297 ?auto_1787301 ) ) ( not ( = ?auto_1787297 ?auto_1787302 ) ) ( not ( = ?auto_1787297 ?auto_1787303 ) ) ( not ( = ?auto_1787297 ?auto_1787304 ) ) ( not ( = ?auto_1787297 ?auto_1787305 ) ) ( not ( = ?auto_1787297 ?auto_1787306 ) ) ( not ( = ?auto_1787298 ?auto_1787299 ) ) ( not ( = ?auto_1787298 ?auto_1787300 ) ) ( not ( = ?auto_1787298 ?auto_1787301 ) ) ( not ( = ?auto_1787298 ?auto_1787302 ) ) ( not ( = ?auto_1787298 ?auto_1787303 ) ) ( not ( = ?auto_1787298 ?auto_1787304 ) ) ( not ( = ?auto_1787298 ?auto_1787305 ) ) ( not ( = ?auto_1787298 ?auto_1787306 ) ) ( not ( = ?auto_1787299 ?auto_1787300 ) ) ( not ( = ?auto_1787299 ?auto_1787301 ) ) ( not ( = ?auto_1787299 ?auto_1787302 ) ) ( not ( = ?auto_1787299 ?auto_1787303 ) ) ( not ( = ?auto_1787299 ?auto_1787304 ) ) ( not ( = ?auto_1787299 ?auto_1787305 ) ) ( not ( = ?auto_1787299 ?auto_1787306 ) ) ( not ( = ?auto_1787300 ?auto_1787301 ) ) ( not ( = ?auto_1787300 ?auto_1787302 ) ) ( not ( = ?auto_1787300 ?auto_1787303 ) ) ( not ( = ?auto_1787300 ?auto_1787304 ) ) ( not ( = ?auto_1787300 ?auto_1787305 ) ) ( not ( = ?auto_1787300 ?auto_1787306 ) ) ( not ( = ?auto_1787301 ?auto_1787302 ) ) ( not ( = ?auto_1787301 ?auto_1787303 ) ) ( not ( = ?auto_1787301 ?auto_1787304 ) ) ( not ( = ?auto_1787301 ?auto_1787305 ) ) ( not ( = ?auto_1787301 ?auto_1787306 ) ) ( not ( = ?auto_1787302 ?auto_1787303 ) ) ( not ( = ?auto_1787302 ?auto_1787304 ) ) ( not ( = ?auto_1787302 ?auto_1787305 ) ) ( not ( = ?auto_1787302 ?auto_1787306 ) ) ( not ( = ?auto_1787303 ?auto_1787304 ) ) ( not ( = ?auto_1787303 ?auto_1787305 ) ) ( not ( = ?auto_1787303 ?auto_1787306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787304 ?auto_1787305 ?auto_1787306 )
      ( MAKE-15CRATE-VERIFY ?auto_1787291 ?auto_1787292 ?auto_1787293 ?auto_1787295 ?auto_1787294 ?auto_1787296 ?auto_1787297 ?auto_1787298 ?auto_1787299 ?auto_1787300 ?auto_1787301 ?auto_1787302 ?auto_1787303 ?auto_1787304 ?auto_1787305 ?auto_1787306 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787501 - SURFACE
      ?auto_1787502 - SURFACE
      ?auto_1787503 - SURFACE
      ?auto_1787505 - SURFACE
      ?auto_1787504 - SURFACE
      ?auto_1787506 - SURFACE
      ?auto_1787507 - SURFACE
      ?auto_1787508 - SURFACE
      ?auto_1787509 - SURFACE
      ?auto_1787510 - SURFACE
      ?auto_1787511 - SURFACE
      ?auto_1787512 - SURFACE
      ?auto_1787513 - SURFACE
      ?auto_1787514 - SURFACE
      ?auto_1787515 - SURFACE
      ?auto_1787516 - SURFACE
    )
    :vars
    (
      ?auto_1787518 - HOIST
      ?auto_1787519 - PLACE
      ?auto_1787521 - TRUCK
      ?auto_1787520 - PLACE
      ?auto_1787517 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787518 ?auto_1787519 ) ( SURFACE-AT ?auto_1787515 ?auto_1787519 ) ( CLEAR ?auto_1787515 ) ( IS-CRATE ?auto_1787516 ) ( not ( = ?auto_1787515 ?auto_1787516 ) ) ( AVAILABLE ?auto_1787518 ) ( ON ?auto_1787515 ?auto_1787514 ) ( not ( = ?auto_1787514 ?auto_1787515 ) ) ( not ( = ?auto_1787514 ?auto_1787516 ) ) ( TRUCK-AT ?auto_1787521 ?auto_1787520 ) ( not ( = ?auto_1787520 ?auto_1787519 ) ) ( HOIST-AT ?auto_1787517 ?auto_1787520 ) ( LIFTING ?auto_1787517 ?auto_1787516 ) ( not ( = ?auto_1787518 ?auto_1787517 ) ) ( ON ?auto_1787502 ?auto_1787501 ) ( ON ?auto_1787503 ?auto_1787502 ) ( ON ?auto_1787505 ?auto_1787503 ) ( ON ?auto_1787504 ?auto_1787505 ) ( ON ?auto_1787506 ?auto_1787504 ) ( ON ?auto_1787507 ?auto_1787506 ) ( ON ?auto_1787508 ?auto_1787507 ) ( ON ?auto_1787509 ?auto_1787508 ) ( ON ?auto_1787510 ?auto_1787509 ) ( ON ?auto_1787511 ?auto_1787510 ) ( ON ?auto_1787512 ?auto_1787511 ) ( ON ?auto_1787513 ?auto_1787512 ) ( ON ?auto_1787514 ?auto_1787513 ) ( not ( = ?auto_1787501 ?auto_1787502 ) ) ( not ( = ?auto_1787501 ?auto_1787503 ) ) ( not ( = ?auto_1787501 ?auto_1787505 ) ) ( not ( = ?auto_1787501 ?auto_1787504 ) ) ( not ( = ?auto_1787501 ?auto_1787506 ) ) ( not ( = ?auto_1787501 ?auto_1787507 ) ) ( not ( = ?auto_1787501 ?auto_1787508 ) ) ( not ( = ?auto_1787501 ?auto_1787509 ) ) ( not ( = ?auto_1787501 ?auto_1787510 ) ) ( not ( = ?auto_1787501 ?auto_1787511 ) ) ( not ( = ?auto_1787501 ?auto_1787512 ) ) ( not ( = ?auto_1787501 ?auto_1787513 ) ) ( not ( = ?auto_1787501 ?auto_1787514 ) ) ( not ( = ?auto_1787501 ?auto_1787515 ) ) ( not ( = ?auto_1787501 ?auto_1787516 ) ) ( not ( = ?auto_1787502 ?auto_1787503 ) ) ( not ( = ?auto_1787502 ?auto_1787505 ) ) ( not ( = ?auto_1787502 ?auto_1787504 ) ) ( not ( = ?auto_1787502 ?auto_1787506 ) ) ( not ( = ?auto_1787502 ?auto_1787507 ) ) ( not ( = ?auto_1787502 ?auto_1787508 ) ) ( not ( = ?auto_1787502 ?auto_1787509 ) ) ( not ( = ?auto_1787502 ?auto_1787510 ) ) ( not ( = ?auto_1787502 ?auto_1787511 ) ) ( not ( = ?auto_1787502 ?auto_1787512 ) ) ( not ( = ?auto_1787502 ?auto_1787513 ) ) ( not ( = ?auto_1787502 ?auto_1787514 ) ) ( not ( = ?auto_1787502 ?auto_1787515 ) ) ( not ( = ?auto_1787502 ?auto_1787516 ) ) ( not ( = ?auto_1787503 ?auto_1787505 ) ) ( not ( = ?auto_1787503 ?auto_1787504 ) ) ( not ( = ?auto_1787503 ?auto_1787506 ) ) ( not ( = ?auto_1787503 ?auto_1787507 ) ) ( not ( = ?auto_1787503 ?auto_1787508 ) ) ( not ( = ?auto_1787503 ?auto_1787509 ) ) ( not ( = ?auto_1787503 ?auto_1787510 ) ) ( not ( = ?auto_1787503 ?auto_1787511 ) ) ( not ( = ?auto_1787503 ?auto_1787512 ) ) ( not ( = ?auto_1787503 ?auto_1787513 ) ) ( not ( = ?auto_1787503 ?auto_1787514 ) ) ( not ( = ?auto_1787503 ?auto_1787515 ) ) ( not ( = ?auto_1787503 ?auto_1787516 ) ) ( not ( = ?auto_1787505 ?auto_1787504 ) ) ( not ( = ?auto_1787505 ?auto_1787506 ) ) ( not ( = ?auto_1787505 ?auto_1787507 ) ) ( not ( = ?auto_1787505 ?auto_1787508 ) ) ( not ( = ?auto_1787505 ?auto_1787509 ) ) ( not ( = ?auto_1787505 ?auto_1787510 ) ) ( not ( = ?auto_1787505 ?auto_1787511 ) ) ( not ( = ?auto_1787505 ?auto_1787512 ) ) ( not ( = ?auto_1787505 ?auto_1787513 ) ) ( not ( = ?auto_1787505 ?auto_1787514 ) ) ( not ( = ?auto_1787505 ?auto_1787515 ) ) ( not ( = ?auto_1787505 ?auto_1787516 ) ) ( not ( = ?auto_1787504 ?auto_1787506 ) ) ( not ( = ?auto_1787504 ?auto_1787507 ) ) ( not ( = ?auto_1787504 ?auto_1787508 ) ) ( not ( = ?auto_1787504 ?auto_1787509 ) ) ( not ( = ?auto_1787504 ?auto_1787510 ) ) ( not ( = ?auto_1787504 ?auto_1787511 ) ) ( not ( = ?auto_1787504 ?auto_1787512 ) ) ( not ( = ?auto_1787504 ?auto_1787513 ) ) ( not ( = ?auto_1787504 ?auto_1787514 ) ) ( not ( = ?auto_1787504 ?auto_1787515 ) ) ( not ( = ?auto_1787504 ?auto_1787516 ) ) ( not ( = ?auto_1787506 ?auto_1787507 ) ) ( not ( = ?auto_1787506 ?auto_1787508 ) ) ( not ( = ?auto_1787506 ?auto_1787509 ) ) ( not ( = ?auto_1787506 ?auto_1787510 ) ) ( not ( = ?auto_1787506 ?auto_1787511 ) ) ( not ( = ?auto_1787506 ?auto_1787512 ) ) ( not ( = ?auto_1787506 ?auto_1787513 ) ) ( not ( = ?auto_1787506 ?auto_1787514 ) ) ( not ( = ?auto_1787506 ?auto_1787515 ) ) ( not ( = ?auto_1787506 ?auto_1787516 ) ) ( not ( = ?auto_1787507 ?auto_1787508 ) ) ( not ( = ?auto_1787507 ?auto_1787509 ) ) ( not ( = ?auto_1787507 ?auto_1787510 ) ) ( not ( = ?auto_1787507 ?auto_1787511 ) ) ( not ( = ?auto_1787507 ?auto_1787512 ) ) ( not ( = ?auto_1787507 ?auto_1787513 ) ) ( not ( = ?auto_1787507 ?auto_1787514 ) ) ( not ( = ?auto_1787507 ?auto_1787515 ) ) ( not ( = ?auto_1787507 ?auto_1787516 ) ) ( not ( = ?auto_1787508 ?auto_1787509 ) ) ( not ( = ?auto_1787508 ?auto_1787510 ) ) ( not ( = ?auto_1787508 ?auto_1787511 ) ) ( not ( = ?auto_1787508 ?auto_1787512 ) ) ( not ( = ?auto_1787508 ?auto_1787513 ) ) ( not ( = ?auto_1787508 ?auto_1787514 ) ) ( not ( = ?auto_1787508 ?auto_1787515 ) ) ( not ( = ?auto_1787508 ?auto_1787516 ) ) ( not ( = ?auto_1787509 ?auto_1787510 ) ) ( not ( = ?auto_1787509 ?auto_1787511 ) ) ( not ( = ?auto_1787509 ?auto_1787512 ) ) ( not ( = ?auto_1787509 ?auto_1787513 ) ) ( not ( = ?auto_1787509 ?auto_1787514 ) ) ( not ( = ?auto_1787509 ?auto_1787515 ) ) ( not ( = ?auto_1787509 ?auto_1787516 ) ) ( not ( = ?auto_1787510 ?auto_1787511 ) ) ( not ( = ?auto_1787510 ?auto_1787512 ) ) ( not ( = ?auto_1787510 ?auto_1787513 ) ) ( not ( = ?auto_1787510 ?auto_1787514 ) ) ( not ( = ?auto_1787510 ?auto_1787515 ) ) ( not ( = ?auto_1787510 ?auto_1787516 ) ) ( not ( = ?auto_1787511 ?auto_1787512 ) ) ( not ( = ?auto_1787511 ?auto_1787513 ) ) ( not ( = ?auto_1787511 ?auto_1787514 ) ) ( not ( = ?auto_1787511 ?auto_1787515 ) ) ( not ( = ?auto_1787511 ?auto_1787516 ) ) ( not ( = ?auto_1787512 ?auto_1787513 ) ) ( not ( = ?auto_1787512 ?auto_1787514 ) ) ( not ( = ?auto_1787512 ?auto_1787515 ) ) ( not ( = ?auto_1787512 ?auto_1787516 ) ) ( not ( = ?auto_1787513 ?auto_1787514 ) ) ( not ( = ?auto_1787513 ?auto_1787515 ) ) ( not ( = ?auto_1787513 ?auto_1787516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787514 ?auto_1787515 ?auto_1787516 )
      ( MAKE-15CRATE-VERIFY ?auto_1787501 ?auto_1787502 ?auto_1787503 ?auto_1787505 ?auto_1787504 ?auto_1787506 ?auto_1787507 ?auto_1787508 ?auto_1787509 ?auto_1787510 ?auto_1787511 ?auto_1787512 ?auto_1787513 ?auto_1787514 ?auto_1787515 ?auto_1787516 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787726 - SURFACE
      ?auto_1787727 - SURFACE
      ?auto_1787728 - SURFACE
      ?auto_1787730 - SURFACE
      ?auto_1787729 - SURFACE
      ?auto_1787731 - SURFACE
      ?auto_1787732 - SURFACE
      ?auto_1787733 - SURFACE
      ?auto_1787734 - SURFACE
      ?auto_1787735 - SURFACE
      ?auto_1787736 - SURFACE
      ?auto_1787737 - SURFACE
      ?auto_1787738 - SURFACE
      ?auto_1787739 - SURFACE
      ?auto_1787740 - SURFACE
      ?auto_1787741 - SURFACE
    )
    :vars
    (
      ?auto_1787746 - HOIST
      ?auto_1787743 - PLACE
      ?auto_1787742 - TRUCK
      ?auto_1787747 - PLACE
      ?auto_1787745 - HOIST
      ?auto_1787744 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787746 ?auto_1787743 ) ( SURFACE-AT ?auto_1787740 ?auto_1787743 ) ( CLEAR ?auto_1787740 ) ( IS-CRATE ?auto_1787741 ) ( not ( = ?auto_1787740 ?auto_1787741 ) ) ( AVAILABLE ?auto_1787746 ) ( ON ?auto_1787740 ?auto_1787739 ) ( not ( = ?auto_1787739 ?auto_1787740 ) ) ( not ( = ?auto_1787739 ?auto_1787741 ) ) ( TRUCK-AT ?auto_1787742 ?auto_1787747 ) ( not ( = ?auto_1787747 ?auto_1787743 ) ) ( HOIST-AT ?auto_1787745 ?auto_1787747 ) ( not ( = ?auto_1787746 ?auto_1787745 ) ) ( AVAILABLE ?auto_1787745 ) ( SURFACE-AT ?auto_1787741 ?auto_1787747 ) ( ON ?auto_1787741 ?auto_1787744 ) ( CLEAR ?auto_1787741 ) ( not ( = ?auto_1787740 ?auto_1787744 ) ) ( not ( = ?auto_1787741 ?auto_1787744 ) ) ( not ( = ?auto_1787739 ?auto_1787744 ) ) ( ON ?auto_1787727 ?auto_1787726 ) ( ON ?auto_1787728 ?auto_1787727 ) ( ON ?auto_1787730 ?auto_1787728 ) ( ON ?auto_1787729 ?auto_1787730 ) ( ON ?auto_1787731 ?auto_1787729 ) ( ON ?auto_1787732 ?auto_1787731 ) ( ON ?auto_1787733 ?auto_1787732 ) ( ON ?auto_1787734 ?auto_1787733 ) ( ON ?auto_1787735 ?auto_1787734 ) ( ON ?auto_1787736 ?auto_1787735 ) ( ON ?auto_1787737 ?auto_1787736 ) ( ON ?auto_1787738 ?auto_1787737 ) ( ON ?auto_1787739 ?auto_1787738 ) ( not ( = ?auto_1787726 ?auto_1787727 ) ) ( not ( = ?auto_1787726 ?auto_1787728 ) ) ( not ( = ?auto_1787726 ?auto_1787730 ) ) ( not ( = ?auto_1787726 ?auto_1787729 ) ) ( not ( = ?auto_1787726 ?auto_1787731 ) ) ( not ( = ?auto_1787726 ?auto_1787732 ) ) ( not ( = ?auto_1787726 ?auto_1787733 ) ) ( not ( = ?auto_1787726 ?auto_1787734 ) ) ( not ( = ?auto_1787726 ?auto_1787735 ) ) ( not ( = ?auto_1787726 ?auto_1787736 ) ) ( not ( = ?auto_1787726 ?auto_1787737 ) ) ( not ( = ?auto_1787726 ?auto_1787738 ) ) ( not ( = ?auto_1787726 ?auto_1787739 ) ) ( not ( = ?auto_1787726 ?auto_1787740 ) ) ( not ( = ?auto_1787726 ?auto_1787741 ) ) ( not ( = ?auto_1787726 ?auto_1787744 ) ) ( not ( = ?auto_1787727 ?auto_1787728 ) ) ( not ( = ?auto_1787727 ?auto_1787730 ) ) ( not ( = ?auto_1787727 ?auto_1787729 ) ) ( not ( = ?auto_1787727 ?auto_1787731 ) ) ( not ( = ?auto_1787727 ?auto_1787732 ) ) ( not ( = ?auto_1787727 ?auto_1787733 ) ) ( not ( = ?auto_1787727 ?auto_1787734 ) ) ( not ( = ?auto_1787727 ?auto_1787735 ) ) ( not ( = ?auto_1787727 ?auto_1787736 ) ) ( not ( = ?auto_1787727 ?auto_1787737 ) ) ( not ( = ?auto_1787727 ?auto_1787738 ) ) ( not ( = ?auto_1787727 ?auto_1787739 ) ) ( not ( = ?auto_1787727 ?auto_1787740 ) ) ( not ( = ?auto_1787727 ?auto_1787741 ) ) ( not ( = ?auto_1787727 ?auto_1787744 ) ) ( not ( = ?auto_1787728 ?auto_1787730 ) ) ( not ( = ?auto_1787728 ?auto_1787729 ) ) ( not ( = ?auto_1787728 ?auto_1787731 ) ) ( not ( = ?auto_1787728 ?auto_1787732 ) ) ( not ( = ?auto_1787728 ?auto_1787733 ) ) ( not ( = ?auto_1787728 ?auto_1787734 ) ) ( not ( = ?auto_1787728 ?auto_1787735 ) ) ( not ( = ?auto_1787728 ?auto_1787736 ) ) ( not ( = ?auto_1787728 ?auto_1787737 ) ) ( not ( = ?auto_1787728 ?auto_1787738 ) ) ( not ( = ?auto_1787728 ?auto_1787739 ) ) ( not ( = ?auto_1787728 ?auto_1787740 ) ) ( not ( = ?auto_1787728 ?auto_1787741 ) ) ( not ( = ?auto_1787728 ?auto_1787744 ) ) ( not ( = ?auto_1787730 ?auto_1787729 ) ) ( not ( = ?auto_1787730 ?auto_1787731 ) ) ( not ( = ?auto_1787730 ?auto_1787732 ) ) ( not ( = ?auto_1787730 ?auto_1787733 ) ) ( not ( = ?auto_1787730 ?auto_1787734 ) ) ( not ( = ?auto_1787730 ?auto_1787735 ) ) ( not ( = ?auto_1787730 ?auto_1787736 ) ) ( not ( = ?auto_1787730 ?auto_1787737 ) ) ( not ( = ?auto_1787730 ?auto_1787738 ) ) ( not ( = ?auto_1787730 ?auto_1787739 ) ) ( not ( = ?auto_1787730 ?auto_1787740 ) ) ( not ( = ?auto_1787730 ?auto_1787741 ) ) ( not ( = ?auto_1787730 ?auto_1787744 ) ) ( not ( = ?auto_1787729 ?auto_1787731 ) ) ( not ( = ?auto_1787729 ?auto_1787732 ) ) ( not ( = ?auto_1787729 ?auto_1787733 ) ) ( not ( = ?auto_1787729 ?auto_1787734 ) ) ( not ( = ?auto_1787729 ?auto_1787735 ) ) ( not ( = ?auto_1787729 ?auto_1787736 ) ) ( not ( = ?auto_1787729 ?auto_1787737 ) ) ( not ( = ?auto_1787729 ?auto_1787738 ) ) ( not ( = ?auto_1787729 ?auto_1787739 ) ) ( not ( = ?auto_1787729 ?auto_1787740 ) ) ( not ( = ?auto_1787729 ?auto_1787741 ) ) ( not ( = ?auto_1787729 ?auto_1787744 ) ) ( not ( = ?auto_1787731 ?auto_1787732 ) ) ( not ( = ?auto_1787731 ?auto_1787733 ) ) ( not ( = ?auto_1787731 ?auto_1787734 ) ) ( not ( = ?auto_1787731 ?auto_1787735 ) ) ( not ( = ?auto_1787731 ?auto_1787736 ) ) ( not ( = ?auto_1787731 ?auto_1787737 ) ) ( not ( = ?auto_1787731 ?auto_1787738 ) ) ( not ( = ?auto_1787731 ?auto_1787739 ) ) ( not ( = ?auto_1787731 ?auto_1787740 ) ) ( not ( = ?auto_1787731 ?auto_1787741 ) ) ( not ( = ?auto_1787731 ?auto_1787744 ) ) ( not ( = ?auto_1787732 ?auto_1787733 ) ) ( not ( = ?auto_1787732 ?auto_1787734 ) ) ( not ( = ?auto_1787732 ?auto_1787735 ) ) ( not ( = ?auto_1787732 ?auto_1787736 ) ) ( not ( = ?auto_1787732 ?auto_1787737 ) ) ( not ( = ?auto_1787732 ?auto_1787738 ) ) ( not ( = ?auto_1787732 ?auto_1787739 ) ) ( not ( = ?auto_1787732 ?auto_1787740 ) ) ( not ( = ?auto_1787732 ?auto_1787741 ) ) ( not ( = ?auto_1787732 ?auto_1787744 ) ) ( not ( = ?auto_1787733 ?auto_1787734 ) ) ( not ( = ?auto_1787733 ?auto_1787735 ) ) ( not ( = ?auto_1787733 ?auto_1787736 ) ) ( not ( = ?auto_1787733 ?auto_1787737 ) ) ( not ( = ?auto_1787733 ?auto_1787738 ) ) ( not ( = ?auto_1787733 ?auto_1787739 ) ) ( not ( = ?auto_1787733 ?auto_1787740 ) ) ( not ( = ?auto_1787733 ?auto_1787741 ) ) ( not ( = ?auto_1787733 ?auto_1787744 ) ) ( not ( = ?auto_1787734 ?auto_1787735 ) ) ( not ( = ?auto_1787734 ?auto_1787736 ) ) ( not ( = ?auto_1787734 ?auto_1787737 ) ) ( not ( = ?auto_1787734 ?auto_1787738 ) ) ( not ( = ?auto_1787734 ?auto_1787739 ) ) ( not ( = ?auto_1787734 ?auto_1787740 ) ) ( not ( = ?auto_1787734 ?auto_1787741 ) ) ( not ( = ?auto_1787734 ?auto_1787744 ) ) ( not ( = ?auto_1787735 ?auto_1787736 ) ) ( not ( = ?auto_1787735 ?auto_1787737 ) ) ( not ( = ?auto_1787735 ?auto_1787738 ) ) ( not ( = ?auto_1787735 ?auto_1787739 ) ) ( not ( = ?auto_1787735 ?auto_1787740 ) ) ( not ( = ?auto_1787735 ?auto_1787741 ) ) ( not ( = ?auto_1787735 ?auto_1787744 ) ) ( not ( = ?auto_1787736 ?auto_1787737 ) ) ( not ( = ?auto_1787736 ?auto_1787738 ) ) ( not ( = ?auto_1787736 ?auto_1787739 ) ) ( not ( = ?auto_1787736 ?auto_1787740 ) ) ( not ( = ?auto_1787736 ?auto_1787741 ) ) ( not ( = ?auto_1787736 ?auto_1787744 ) ) ( not ( = ?auto_1787737 ?auto_1787738 ) ) ( not ( = ?auto_1787737 ?auto_1787739 ) ) ( not ( = ?auto_1787737 ?auto_1787740 ) ) ( not ( = ?auto_1787737 ?auto_1787741 ) ) ( not ( = ?auto_1787737 ?auto_1787744 ) ) ( not ( = ?auto_1787738 ?auto_1787739 ) ) ( not ( = ?auto_1787738 ?auto_1787740 ) ) ( not ( = ?auto_1787738 ?auto_1787741 ) ) ( not ( = ?auto_1787738 ?auto_1787744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787739 ?auto_1787740 ?auto_1787741 )
      ( MAKE-15CRATE-VERIFY ?auto_1787726 ?auto_1787727 ?auto_1787728 ?auto_1787730 ?auto_1787729 ?auto_1787731 ?auto_1787732 ?auto_1787733 ?auto_1787734 ?auto_1787735 ?auto_1787736 ?auto_1787737 ?auto_1787738 ?auto_1787739 ?auto_1787740 ?auto_1787741 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787952 - SURFACE
      ?auto_1787953 - SURFACE
      ?auto_1787954 - SURFACE
      ?auto_1787956 - SURFACE
      ?auto_1787955 - SURFACE
      ?auto_1787957 - SURFACE
      ?auto_1787958 - SURFACE
      ?auto_1787959 - SURFACE
      ?auto_1787960 - SURFACE
      ?auto_1787961 - SURFACE
      ?auto_1787962 - SURFACE
      ?auto_1787963 - SURFACE
      ?auto_1787964 - SURFACE
      ?auto_1787965 - SURFACE
      ?auto_1787966 - SURFACE
      ?auto_1787967 - SURFACE
    )
    :vars
    (
      ?auto_1787970 - HOIST
      ?auto_1787971 - PLACE
      ?auto_1787968 - PLACE
      ?auto_1787973 - HOIST
      ?auto_1787969 - SURFACE
      ?auto_1787972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787970 ?auto_1787971 ) ( SURFACE-AT ?auto_1787966 ?auto_1787971 ) ( CLEAR ?auto_1787966 ) ( IS-CRATE ?auto_1787967 ) ( not ( = ?auto_1787966 ?auto_1787967 ) ) ( AVAILABLE ?auto_1787970 ) ( ON ?auto_1787966 ?auto_1787965 ) ( not ( = ?auto_1787965 ?auto_1787966 ) ) ( not ( = ?auto_1787965 ?auto_1787967 ) ) ( not ( = ?auto_1787968 ?auto_1787971 ) ) ( HOIST-AT ?auto_1787973 ?auto_1787968 ) ( not ( = ?auto_1787970 ?auto_1787973 ) ) ( AVAILABLE ?auto_1787973 ) ( SURFACE-AT ?auto_1787967 ?auto_1787968 ) ( ON ?auto_1787967 ?auto_1787969 ) ( CLEAR ?auto_1787967 ) ( not ( = ?auto_1787966 ?auto_1787969 ) ) ( not ( = ?auto_1787967 ?auto_1787969 ) ) ( not ( = ?auto_1787965 ?auto_1787969 ) ) ( TRUCK-AT ?auto_1787972 ?auto_1787971 ) ( ON ?auto_1787953 ?auto_1787952 ) ( ON ?auto_1787954 ?auto_1787953 ) ( ON ?auto_1787956 ?auto_1787954 ) ( ON ?auto_1787955 ?auto_1787956 ) ( ON ?auto_1787957 ?auto_1787955 ) ( ON ?auto_1787958 ?auto_1787957 ) ( ON ?auto_1787959 ?auto_1787958 ) ( ON ?auto_1787960 ?auto_1787959 ) ( ON ?auto_1787961 ?auto_1787960 ) ( ON ?auto_1787962 ?auto_1787961 ) ( ON ?auto_1787963 ?auto_1787962 ) ( ON ?auto_1787964 ?auto_1787963 ) ( ON ?auto_1787965 ?auto_1787964 ) ( not ( = ?auto_1787952 ?auto_1787953 ) ) ( not ( = ?auto_1787952 ?auto_1787954 ) ) ( not ( = ?auto_1787952 ?auto_1787956 ) ) ( not ( = ?auto_1787952 ?auto_1787955 ) ) ( not ( = ?auto_1787952 ?auto_1787957 ) ) ( not ( = ?auto_1787952 ?auto_1787958 ) ) ( not ( = ?auto_1787952 ?auto_1787959 ) ) ( not ( = ?auto_1787952 ?auto_1787960 ) ) ( not ( = ?auto_1787952 ?auto_1787961 ) ) ( not ( = ?auto_1787952 ?auto_1787962 ) ) ( not ( = ?auto_1787952 ?auto_1787963 ) ) ( not ( = ?auto_1787952 ?auto_1787964 ) ) ( not ( = ?auto_1787952 ?auto_1787965 ) ) ( not ( = ?auto_1787952 ?auto_1787966 ) ) ( not ( = ?auto_1787952 ?auto_1787967 ) ) ( not ( = ?auto_1787952 ?auto_1787969 ) ) ( not ( = ?auto_1787953 ?auto_1787954 ) ) ( not ( = ?auto_1787953 ?auto_1787956 ) ) ( not ( = ?auto_1787953 ?auto_1787955 ) ) ( not ( = ?auto_1787953 ?auto_1787957 ) ) ( not ( = ?auto_1787953 ?auto_1787958 ) ) ( not ( = ?auto_1787953 ?auto_1787959 ) ) ( not ( = ?auto_1787953 ?auto_1787960 ) ) ( not ( = ?auto_1787953 ?auto_1787961 ) ) ( not ( = ?auto_1787953 ?auto_1787962 ) ) ( not ( = ?auto_1787953 ?auto_1787963 ) ) ( not ( = ?auto_1787953 ?auto_1787964 ) ) ( not ( = ?auto_1787953 ?auto_1787965 ) ) ( not ( = ?auto_1787953 ?auto_1787966 ) ) ( not ( = ?auto_1787953 ?auto_1787967 ) ) ( not ( = ?auto_1787953 ?auto_1787969 ) ) ( not ( = ?auto_1787954 ?auto_1787956 ) ) ( not ( = ?auto_1787954 ?auto_1787955 ) ) ( not ( = ?auto_1787954 ?auto_1787957 ) ) ( not ( = ?auto_1787954 ?auto_1787958 ) ) ( not ( = ?auto_1787954 ?auto_1787959 ) ) ( not ( = ?auto_1787954 ?auto_1787960 ) ) ( not ( = ?auto_1787954 ?auto_1787961 ) ) ( not ( = ?auto_1787954 ?auto_1787962 ) ) ( not ( = ?auto_1787954 ?auto_1787963 ) ) ( not ( = ?auto_1787954 ?auto_1787964 ) ) ( not ( = ?auto_1787954 ?auto_1787965 ) ) ( not ( = ?auto_1787954 ?auto_1787966 ) ) ( not ( = ?auto_1787954 ?auto_1787967 ) ) ( not ( = ?auto_1787954 ?auto_1787969 ) ) ( not ( = ?auto_1787956 ?auto_1787955 ) ) ( not ( = ?auto_1787956 ?auto_1787957 ) ) ( not ( = ?auto_1787956 ?auto_1787958 ) ) ( not ( = ?auto_1787956 ?auto_1787959 ) ) ( not ( = ?auto_1787956 ?auto_1787960 ) ) ( not ( = ?auto_1787956 ?auto_1787961 ) ) ( not ( = ?auto_1787956 ?auto_1787962 ) ) ( not ( = ?auto_1787956 ?auto_1787963 ) ) ( not ( = ?auto_1787956 ?auto_1787964 ) ) ( not ( = ?auto_1787956 ?auto_1787965 ) ) ( not ( = ?auto_1787956 ?auto_1787966 ) ) ( not ( = ?auto_1787956 ?auto_1787967 ) ) ( not ( = ?auto_1787956 ?auto_1787969 ) ) ( not ( = ?auto_1787955 ?auto_1787957 ) ) ( not ( = ?auto_1787955 ?auto_1787958 ) ) ( not ( = ?auto_1787955 ?auto_1787959 ) ) ( not ( = ?auto_1787955 ?auto_1787960 ) ) ( not ( = ?auto_1787955 ?auto_1787961 ) ) ( not ( = ?auto_1787955 ?auto_1787962 ) ) ( not ( = ?auto_1787955 ?auto_1787963 ) ) ( not ( = ?auto_1787955 ?auto_1787964 ) ) ( not ( = ?auto_1787955 ?auto_1787965 ) ) ( not ( = ?auto_1787955 ?auto_1787966 ) ) ( not ( = ?auto_1787955 ?auto_1787967 ) ) ( not ( = ?auto_1787955 ?auto_1787969 ) ) ( not ( = ?auto_1787957 ?auto_1787958 ) ) ( not ( = ?auto_1787957 ?auto_1787959 ) ) ( not ( = ?auto_1787957 ?auto_1787960 ) ) ( not ( = ?auto_1787957 ?auto_1787961 ) ) ( not ( = ?auto_1787957 ?auto_1787962 ) ) ( not ( = ?auto_1787957 ?auto_1787963 ) ) ( not ( = ?auto_1787957 ?auto_1787964 ) ) ( not ( = ?auto_1787957 ?auto_1787965 ) ) ( not ( = ?auto_1787957 ?auto_1787966 ) ) ( not ( = ?auto_1787957 ?auto_1787967 ) ) ( not ( = ?auto_1787957 ?auto_1787969 ) ) ( not ( = ?auto_1787958 ?auto_1787959 ) ) ( not ( = ?auto_1787958 ?auto_1787960 ) ) ( not ( = ?auto_1787958 ?auto_1787961 ) ) ( not ( = ?auto_1787958 ?auto_1787962 ) ) ( not ( = ?auto_1787958 ?auto_1787963 ) ) ( not ( = ?auto_1787958 ?auto_1787964 ) ) ( not ( = ?auto_1787958 ?auto_1787965 ) ) ( not ( = ?auto_1787958 ?auto_1787966 ) ) ( not ( = ?auto_1787958 ?auto_1787967 ) ) ( not ( = ?auto_1787958 ?auto_1787969 ) ) ( not ( = ?auto_1787959 ?auto_1787960 ) ) ( not ( = ?auto_1787959 ?auto_1787961 ) ) ( not ( = ?auto_1787959 ?auto_1787962 ) ) ( not ( = ?auto_1787959 ?auto_1787963 ) ) ( not ( = ?auto_1787959 ?auto_1787964 ) ) ( not ( = ?auto_1787959 ?auto_1787965 ) ) ( not ( = ?auto_1787959 ?auto_1787966 ) ) ( not ( = ?auto_1787959 ?auto_1787967 ) ) ( not ( = ?auto_1787959 ?auto_1787969 ) ) ( not ( = ?auto_1787960 ?auto_1787961 ) ) ( not ( = ?auto_1787960 ?auto_1787962 ) ) ( not ( = ?auto_1787960 ?auto_1787963 ) ) ( not ( = ?auto_1787960 ?auto_1787964 ) ) ( not ( = ?auto_1787960 ?auto_1787965 ) ) ( not ( = ?auto_1787960 ?auto_1787966 ) ) ( not ( = ?auto_1787960 ?auto_1787967 ) ) ( not ( = ?auto_1787960 ?auto_1787969 ) ) ( not ( = ?auto_1787961 ?auto_1787962 ) ) ( not ( = ?auto_1787961 ?auto_1787963 ) ) ( not ( = ?auto_1787961 ?auto_1787964 ) ) ( not ( = ?auto_1787961 ?auto_1787965 ) ) ( not ( = ?auto_1787961 ?auto_1787966 ) ) ( not ( = ?auto_1787961 ?auto_1787967 ) ) ( not ( = ?auto_1787961 ?auto_1787969 ) ) ( not ( = ?auto_1787962 ?auto_1787963 ) ) ( not ( = ?auto_1787962 ?auto_1787964 ) ) ( not ( = ?auto_1787962 ?auto_1787965 ) ) ( not ( = ?auto_1787962 ?auto_1787966 ) ) ( not ( = ?auto_1787962 ?auto_1787967 ) ) ( not ( = ?auto_1787962 ?auto_1787969 ) ) ( not ( = ?auto_1787963 ?auto_1787964 ) ) ( not ( = ?auto_1787963 ?auto_1787965 ) ) ( not ( = ?auto_1787963 ?auto_1787966 ) ) ( not ( = ?auto_1787963 ?auto_1787967 ) ) ( not ( = ?auto_1787963 ?auto_1787969 ) ) ( not ( = ?auto_1787964 ?auto_1787965 ) ) ( not ( = ?auto_1787964 ?auto_1787966 ) ) ( not ( = ?auto_1787964 ?auto_1787967 ) ) ( not ( = ?auto_1787964 ?auto_1787969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787965 ?auto_1787966 ?auto_1787967 )
      ( MAKE-15CRATE-VERIFY ?auto_1787952 ?auto_1787953 ?auto_1787954 ?auto_1787956 ?auto_1787955 ?auto_1787957 ?auto_1787958 ?auto_1787959 ?auto_1787960 ?auto_1787961 ?auto_1787962 ?auto_1787963 ?auto_1787964 ?auto_1787965 ?auto_1787966 ?auto_1787967 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788178 - SURFACE
      ?auto_1788179 - SURFACE
      ?auto_1788180 - SURFACE
      ?auto_1788182 - SURFACE
      ?auto_1788181 - SURFACE
      ?auto_1788183 - SURFACE
      ?auto_1788184 - SURFACE
      ?auto_1788185 - SURFACE
      ?auto_1788186 - SURFACE
      ?auto_1788187 - SURFACE
      ?auto_1788188 - SURFACE
      ?auto_1788189 - SURFACE
      ?auto_1788190 - SURFACE
      ?auto_1788191 - SURFACE
      ?auto_1788192 - SURFACE
      ?auto_1788193 - SURFACE
    )
    :vars
    (
      ?auto_1788196 - HOIST
      ?auto_1788194 - PLACE
      ?auto_1788197 - PLACE
      ?auto_1788195 - HOIST
      ?auto_1788198 - SURFACE
      ?auto_1788199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788196 ?auto_1788194 ) ( IS-CRATE ?auto_1788193 ) ( not ( = ?auto_1788192 ?auto_1788193 ) ) ( not ( = ?auto_1788191 ?auto_1788192 ) ) ( not ( = ?auto_1788191 ?auto_1788193 ) ) ( not ( = ?auto_1788197 ?auto_1788194 ) ) ( HOIST-AT ?auto_1788195 ?auto_1788197 ) ( not ( = ?auto_1788196 ?auto_1788195 ) ) ( AVAILABLE ?auto_1788195 ) ( SURFACE-AT ?auto_1788193 ?auto_1788197 ) ( ON ?auto_1788193 ?auto_1788198 ) ( CLEAR ?auto_1788193 ) ( not ( = ?auto_1788192 ?auto_1788198 ) ) ( not ( = ?auto_1788193 ?auto_1788198 ) ) ( not ( = ?auto_1788191 ?auto_1788198 ) ) ( TRUCK-AT ?auto_1788199 ?auto_1788194 ) ( SURFACE-AT ?auto_1788191 ?auto_1788194 ) ( CLEAR ?auto_1788191 ) ( LIFTING ?auto_1788196 ?auto_1788192 ) ( IS-CRATE ?auto_1788192 ) ( ON ?auto_1788179 ?auto_1788178 ) ( ON ?auto_1788180 ?auto_1788179 ) ( ON ?auto_1788182 ?auto_1788180 ) ( ON ?auto_1788181 ?auto_1788182 ) ( ON ?auto_1788183 ?auto_1788181 ) ( ON ?auto_1788184 ?auto_1788183 ) ( ON ?auto_1788185 ?auto_1788184 ) ( ON ?auto_1788186 ?auto_1788185 ) ( ON ?auto_1788187 ?auto_1788186 ) ( ON ?auto_1788188 ?auto_1788187 ) ( ON ?auto_1788189 ?auto_1788188 ) ( ON ?auto_1788190 ?auto_1788189 ) ( ON ?auto_1788191 ?auto_1788190 ) ( not ( = ?auto_1788178 ?auto_1788179 ) ) ( not ( = ?auto_1788178 ?auto_1788180 ) ) ( not ( = ?auto_1788178 ?auto_1788182 ) ) ( not ( = ?auto_1788178 ?auto_1788181 ) ) ( not ( = ?auto_1788178 ?auto_1788183 ) ) ( not ( = ?auto_1788178 ?auto_1788184 ) ) ( not ( = ?auto_1788178 ?auto_1788185 ) ) ( not ( = ?auto_1788178 ?auto_1788186 ) ) ( not ( = ?auto_1788178 ?auto_1788187 ) ) ( not ( = ?auto_1788178 ?auto_1788188 ) ) ( not ( = ?auto_1788178 ?auto_1788189 ) ) ( not ( = ?auto_1788178 ?auto_1788190 ) ) ( not ( = ?auto_1788178 ?auto_1788191 ) ) ( not ( = ?auto_1788178 ?auto_1788192 ) ) ( not ( = ?auto_1788178 ?auto_1788193 ) ) ( not ( = ?auto_1788178 ?auto_1788198 ) ) ( not ( = ?auto_1788179 ?auto_1788180 ) ) ( not ( = ?auto_1788179 ?auto_1788182 ) ) ( not ( = ?auto_1788179 ?auto_1788181 ) ) ( not ( = ?auto_1788179 ?auto_1788183 ) ) ( not ( = ?auto_1788179 ?auto_1788184 ) ) ( not ( = ?auto_1788179 ?auto_1788185 ) ) ( not ( = ?auto_1788179 ?auto_1788186 ) ) ( not ( = ?auto_1788179 ?auto_1788187 ) ) ( not ( = ?auto_1788179 ?auto_1788188 ) ) ( not ( = ?auto_1788179 ?auto_1788189 ) ) ( not ( = ?auto_1788179 ?auto_1788190 ) ) ( not ( = ?auto_1788179 ?auto_1788191 ) ) ( not ( = ?auto_1788179 ?auto_1788192 ) ) ( not ( = ?auto_1788179 ?auto_1788193 ) ) ( not ( = ?auto_1788179 ?auto_1788198 ) ) ( not ( = ?auto_1788180 ?auto_1788182 ) ) ( not ( = ?auto_1788180 ?auto_1788181 ) ) ( not ( = ?auto_1788180 ?auto_1788183 ) ) ( not ( = ?auto_1788180 ?auto_1788184 ) ) ( not ( = ?auto_1788180 ?auto_1788185 ) ) ( not ( = ?auto_1788180 ?auto_1788186 ) ) ( not ( = ?auto_1788180 ?auto_1788187 ) ) ( not ( = ?auto_1788180 ?auto_1788188 ) ) ( not ( = ?auto_1788180 ?auto_1788189 ) ) ( not ( = ?auto_1788180 ?auto_1788190 ) ) ( not ( = ?auto_1788180 ?auto_1788191 ) ) ( not ( = ?auto_1788180 ?auto_1788192 ) ) ( not ( = ?auto_1788180 ?auto_1788193 ) ) ( not ( = ?auto_1788180 ?auto_1788198 ) ) ( not ( = ?auto_1788182 ?auto_1788181 ) ) ( not ( = ?auto_1788182 ?auto_1788183 ) ) ( not ( = ?auto_1788182 ?auto_1788184 ) ) ( not ( = ?auto_1788182 ?auto_1788185 ) ) ( not ( = ?auto_1788182 ?auto_1788186 ) ) ( not ( = ?auto_1788182 ?auto_1788187 ) ) ( not ( = ?auto_1788182 ?auto_1788188 ) ) ( not ( = ?auto_1788182 ?auto_1788189 ) ) ( not ( = ?auto_1788182 ?auto_1788190 ) ) ( not ( = ?auto_1788182 ?auto_1788191 ) ) ( not ( = ?auto_1788182 ?auto_1788192 ) ) ( not ( = ?auto_1788182 ?auto_1788193 ) ) ( not ( = ?auto_1788182 ?auto_1788198 ) ) ( not ( = ?auto_1788181 ?auto_1788183 ) ) ( not ( = ?auto_1788181 ?auto_1788184 ) ) ( not ( = ?auto_1788181 ?auto_1788185 ) ) ( not ( = ?auto_1788181 ?auto_1788186 ) ) ( not ( = ?auto_1788181 ?auto_1788187 ) ) ( not ( = ?auto_1788181 ?auto_1788188 ) ) ( not ( = ?auto_1788181 ?auto_1788189 ) ) ( not ( = ?auto_1788181 ?auto_1788190 ) ) ( not ( = ?auto_1788181 ?auto_1788191 ) ) ( not ( = ?auto_1788181 ?auto_1788192 ) ) ( not ( = ?auto_1788181 ?auto_1788193 ) ) ( not ( = ?auto_1788181 ?auto_1788198 ) ) ( not ( = ?auto_1788183 ?auto_1788184 ) ) ( not ( = ?auto_1788183 ?auto_1788185 ) ) ( not ( = ?auto_1788183 ?auto_1788186 ) ) ( not ( = ?auto_1788183 ?auto_1788187 ) ) ( not ( = ?auto_1788183 ?auto_1788188 ) ) ( not ( = ?auto_1788183 ?auto_1788189 ) ) ( not ( = ?auto_1788183 ?auto_1788190 ) ) ( not ( = ?auto_1788183 ?auto_1788191 ) ) ( not ( = ?auto_1788183 ?auto_1788192 ) ) ( not ( = ?auto_1788183 ?auto_1788193 ) ) ( not ( = ?auto_1788183 ?auto_1788198 ) ) ( not ( = ?auto_1788184 ?auto_1788185 ) ) ( not ( = ?auto_1788184 ?auto_1788186 ) ) ( not ( = ?auto_1788184 ?auto_1788187 ) ) ( not ( = ?auto_1788184 ?auto_1788188 ) ) ( not ( = ?auto_1788184 ?auto_1788189 ) ) ( not ( = ?auto_1788184 ?auto_1788190 ) ) ( not ( = ?auto_1788184 ?auto_1788191 ) ) ( not ( = ?auto_1788184 ?auto_1788192 ) ) ( not ( = ?auto_1788184 ?auto_1788193 ) ) ( not ( = ?auto_1788184 ?auto_1788198 ) ) ( not ( = ?auto_1788185 ?auto_1788186 ) ) ( not ( = ?auto_1788185 ?auto_1788187 ) ) ( not ( = ?auto_1788185 ?auto_1788188 ) ) ( not ( = ?auto_1788185 ?auto_1788189 ) ) ( not ( = ?auto_1788185 ?auto_1788190 ) ) ( not ( = ?auto_1788185 ?auto_1788191 ) ) ( not ( = ?auto_1788185 ?auto_1788192 ) ) ( not ( = ?auto_1788185 ?auto_1788193 ) ) ( not ( = ?auto_1788185 ?auto_1788198 ) ) ( not ( = ?auto_1788186 ?auto_1788187 ) ) ( not ( = ?auto_1788186 ?auto_1788188 ) ) ( not ( = ?auto_1788186 ?auto_1788189 ) ) ( not ( = ?auto_1788186 ?auto_1788190 ) ) ( not ( = ?auto_1788186 ?auto_1788191 ) ) ( not ( = ?auto_1788186 ?auto_1788192 ) ) ( not ( = ?auto_1788186 ?auto_1788193 ) ) ( not ( = ?auto_1788186 ?auto_1788198 ) ) ( not ( = ?auto_1788187 ?auto_1788188 ) ) ( not ( = ?auto_1788187 ?auto_1788189 ) ) ( not ( = ?auto_1788187 ?auto_1788190 ) ) ( not ( = ?auto_1788187 ?auto_1788191 ) ) ( not ( = ?auto_1788187 ?auto_1788192 ) ) ( not ( = ?auto_1788187 ?auto_1788193 ) ) ( not ( = ?auto_1788187 ?auto_1788198 ) ) ( not ( = ?auto_1788188 ?auto_1788189 ) ) ( not ( = ?auto_1788188 ?auto_1788190 ) ) ( not ( = ?auto_1788188 ?auto_1788191 ) ) ( not ( = ?auto_1788188 ?auto_1788192 ) ) ( not ( = ?auto_1788188 ?auto_1788193 ) ) ( not ( = ?auto_1788188 ?auto_1788198 ) ) ( not ( = ?auto_1788189 ?auto_1788190 ) ) ( not ( = ?auto_1788189 ?auto_1788191 ) ) ( not ( = ?auto_1788189 ?auto_1788192 ) ) ( not ( = ?auto_1788189 ?auto_1788193 ) ) ( not ( = ?auto_1788189 ?auto_1788198 ) ) ( not ( = ?auto_1788190 ?auto_1788191 ) ) ( not ( = ?auto_1788190 ?auto_1788192 ) ) ( not ( = ?auto_1788190 ?auto_1788193 ) ) ( not ( = ?auto_1788190 ?auto_1788198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788191 ?auto_1788192 ?auto_1788193 )
      ( MAKE-15CRATE-VERIFY ?auto_1788178 ?auto_1788179 ?auto_1788180 ?auto_1788182 ?auto_1788181 ?auto_1788183 ?auto_1788184 ?auto_1788185 ?auto_1788186 ?auto_1788187 ?auto_1788188 ?auto_1788189 ?auto_1788190 ?auto_1788191 ?auto_1788192 ?auto_1788193 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788404 - SURFACE
      ?auto_1788405 - SURFACE
      ?auto_1788406 - SURFACE
      ?auto_1788408 - SURFACE
      ?auto_1788407 - SURFACE
      ?auto_1788409 - SURFACE
      ?auto_1788410 - SURFACE
      ?auto_1788411 - SURFACE
      ?auto_1788412 - SURFACE
      ?auto_1788413 - SURFACE
      ?auto_1788414 - SURFACE
      ?auto_1788415 - SURFACE
      ?auto_1788416 - SURFACE
      ?auto_1788417 - SURFACE
      ?auto_1788418 - SURFACE
      ?auto_1788419 - SURFACE
    )
    :vars
    (
      ?auto_1788425 - HOIST
      ?auto_1788424 - PLACE
      ?auto_1788421 - PLACE
      ?auto_1788422 - HOIST
      ?auto_1788423 - SURFACE
      ?auto_1788420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788425 ?auto_1788424 ) ( IS-CRATE ?auto_1788419 ) ( not ( = ?auto_1788418 ?auto_1788419 ) ) ( not ( = ?auto_1788417 ?auto_1788418 ) ) ( not ( = ?auto_1788417 ?auto_1788419 ) ) ( not ( = ?auto_1788421 ?auto_1788424 ) ) ( HOIST-AT ?auto_1788422 ?auto_1788421 ) ( not ( = ?auto_1788425 ?auto_1788422 ) ) ( AVAILABLE ?auto_1788422 ) ( SURFACE-AT ?auto_1788419 ?auto_1788421 ) ( ON ?auto_1788419 ?auto_1788423 ) ( CLEAR ?auto_1788419 ) ( not ( = ?auto_1788418 ?auto_1788423 ) ) ( not ( = ?auto_1788419 ?auto_1788423 ) ) ( not ( = ?auto_1788417 ?auto_1788423 ) ) ( TRUCK-AT ?auto_1788420 ?auto_1788424 ) ( SURFACE-AT ?auto_1788417 ?auto_1788424 ) ( CLEAR ?auto_1788417 ) ( IS-CRATE ?auto_1788418 ) ( AVAILABLE ?auto_1788425 ) ( IN ?auto_1788418 ?auto_1788420 ) ( ON ?auto_1788405 ?auto_1788404 ) ( ON ?auto_1788406 ?auto_1788405 ) ( ON ?auto_1788408 ?auto_1788406 ) ( ON ?auto_1788407 ?auto_1788408 ) ( ON ?auto_1788409 ?auto_1788407 ) ( ON ?auto_1788410 ?auto_1788409 ) ( ON ?auto_1788411 ?auto_1788410 ) ( ON ?auto_1788412 ?auto_1788411 ) ( ON ?auto_1788413 ?auto_1788412 ) ( ON ?auto_1788414 ?auto_1788413 ) ( ON ?auto_1788415 ?auto_1788414 ) ( ON ?auto_1788416 ?auto_1788415 ) ( ON ?auto_1788417 ?auto_1788416 ) ( not ( = ?auto_1788404 ?auto_1788405 ) ) ( not ( = ?auto_1788404 ?auto_1788406 ) ) ( not ( = ?auto_1788404 ?auto_1788408 ) ) ( not ( = ?auto_1788404 ?auto_1788407 ) ) ( not ( = ?auto_1788404 ?auto_1788409 ) ) ( not ( = ?auto_1788404 ?auto_1788410 ) ) ( not ( = ?auto_1788404 ?auto_1788411 ) ) ( not ( = ?auto_1788404 ?auto_1788412 ) ) ( not ( = ?auto_1788404 ?auto_1788413 ) ) ( not ( = ?auto_1788404 ?auto_1788414 ) ) ( not ( = ?auto_1788404 ?auto_1788415 ) ) ( not ( = ?auto_1788404 ?auto_1788416 ) ) ( not ( = ?auto_1788404 ?auto_1788417 ) ) ( not ( = ?auto_1788404 ?auto_1788418 ) ) ( not ( = ?auto_1788404 ?auto_1788419 ) ) ( not ( = ?auto_1788404 ?auto_1788423 ) ) ( not ( = ?auto_1788405 ?auto_1788406 ) ) ( not ( = ?auto_1788405 ?auto_1788408 ) ) ( not ( = ?auto_1788405 ?auto_1788407 ) ) ( not ( = ?auto_1788405 ?auto_1788409 ) ) ( not ( = ?auto_1788405 ?auto_1788410 ) ) ( not ( = ?auto_1788405 ?auto_1788411 ) ) ( not ( = ?auto_1788405 ?auto_1788412 ) ) ( not ( = ?auto_1788405 ?auto_1788413 ) ) ( not ( = ?auto_1788405 ?auto_1788414 ) ) ( not ( = ?auto_1788405 ?auto_1788415 ) ) ( not ( = ?auto_1788405 ?auto_1788416 ) ) ( not ( = ?auto_1788405 ?auto_1788417 ) ) ( not ( = ?auto_1788405 ?auto_1788418 ) ) ( not ( = ?auto_1788405 ?auto_1788419 ) ) ( not ( = ?auto_1788405 ?auto_1788423 ) ) ( not ( = ?auto_1788406 ?auto_1788408 ) ) ( not ( = ?auto_1788406 ?auto_1788407 ) ) ( not ( = ?auto_1788406 ?auto_1788409 ) ) ( not ( = ?auto_1788406 ?auto_1788410 ) ) ( not ( = ?auto_1788406 ?auto_1788411 ) ) ( not ( = ?auto_1788406 ?auto_1788412 ) ) ( not ( = ?auto_1788406 ?auto_1788413 ) ) ( not ( = ?auto_1788406 ?auto_1788414 ) ) ( not ( = ?auto_1788406 ?auto_1788415 ) ) ( not ( = ?auto_1788406 ?auto_1788416 ) ) ( not ( = ?auto_1788406 ?auto_1788417 ) ) ( not ( = ?auto_1788406 ?auto_1788418 ) ) ( not ( = ?auto_1788406 ?auto_1788419 ) ) ( not ( = ?auto_1788406 ?auto_1788423 ) ) ( not ( = ?auto_1788408 ?auto_1788407 ) ) ( not ( = ?auto_1788408 ?auto_1788409 ) ) ( not ( = ?auto_1788408 ?auto_1788410 ) ) ( not ( = ?auto_1788408 ?auto_1788411 ) ) ( not ( = ?auto_1788408 ?auto_1788412 ) ) ( not ( = ?auto_1788408 ?auto_1788413 ) ) ( not ( = ?auto_1788408 ?auto_1788414 ) ) ( not ( = ?auto_1788408 ?auto_1788415 ) ) ( not ( = ?auto_1788408 ?auto_1788416 ) ) ( not ( = ?auto_1788408 ?auto_1788417 ) ) ( not ( = ?auto_1788408 ?auto_1788418 ) ) ( not ( = ?auto_1788408 ?auto_1788419 ) ) ( not ( = ?auto_1788408 ?auto_1788423 ) ) ( not ( = ?auto_1788407 ?auto_1788409 ) ) ( not ( = ?auto_1788407 ?auto_1788410 ) ) ( not ( = ?auto_1788407 ?auto_1788411 ) ) ( not ( = ?auto_1788407 ?auto_1788412 ) ) ( not ( = ?auto_1788407 ?auto_1788413 ) ) ( not ( = ?auto_1788407 ?auto_1788414 ) ) ( not ( = ?auto_1788407 ?auto_1788415 ) ) ( not ( = ?auto_1788407 ?auto_1788416 ) ) ( not ( = ?auto_1788407 ?auto_1788417 ) ) ( not ( = ?auto_1788407 ?auto_1788418 ) ) ( not ( = ?auto_1788407 ?auto_1788419 ) ) ( not ( = ?auto_1788407 ?auto_1788423 ) ) ( not ( = ?auto_1788409 ?auto_1788410 ) ) ( not ( = ?auto_1788409 ?auto_1788411 ) ) ( not ( = ?auto_1788409 ?auto_1788412 ) ) ( not ( = ?auto_1788409 ?auto_1788413 ) ) ( not ( = ?auto_1788409 ?auto_1788414 ) ) ( not ( = ?auto_1788409 ?auto_1788415 ) ) ( not ( = ?auto_1788409 ?auto_1788416 ) ) ( not ( = ?auto_1788409 ?auto_1788417 ) ) ( not ( = ?auto_1788409 ?auto_1788418 ) ) ( not ( = ?auto_1788409 ?auto_1788419 ) ) ( not ( = ?auto_1788409 ?auto_1788423 ) ) ( not ( = ?auto_1788410 ?auto_1788411 ) ) ( not ( = ?auto_1788410 ?auto_1788412 ) ) ( not ( = ?auto_1788410 ?auto_1788413 ) ) ( not ( = ?auto_1788410 ?auto_1788414 ) ) ( not ( = ?auto_1788410 ?auto_1788415 ) ) ( not ( = ?auto_1788410 ?auto_1788416 ) ) ( not ( = ?auto_1788410 ?auto_1788417 ) ) ( not ( = ?auto_1788410 ?auto_1788418 ) ) ( not ( = ?auto_1788410 ?auto_1788419 ) ) ( not ( = ?auto_1788410 ?auto_1788423 ) ) ( not ( = ?auto_1788411 ?auto_1788412 ) ) ( not ( = ?auto_1788411 ?auto_1788413 ) ) ( not ( = ?auto_1788411 ?auto_1788414 ) ) ( not ( = ?auto_1788411 ?auto_1788415 ) ) ( not ( = ?auto_1788411 ?auto_1788416 ) ) ( not ( = ?auto_1788411 ?auto_1788417 ) ) ( not ( = ?auto_1788411 ?auto_1788418 ) ) ( not ( = ?auto_1788411 ?auto_1788419 ) ) ( not ( = ?auto_1788411 ?auto_1788423 ) ) ( not ( = ?auto_1788412 ?auto_1788413 ) ) ( not ( = ?auto_1788412 ?auto_1788414 ) ) ( not ( = ?auto_1788412 ?auto_1788415 ) ) ( not ( = ?auto_1788412 ?auto_1788416 ) ) ( not ( = ?auto_1788412 ?auto_1788417 ) ) ( not ( = ?auto_1788412 ?auto_1788418 ) ) ( not ( = ?auto_1788412 ?auto_1788419 ) ) ( not ( = ?auto_1788412 ?auto_1788423 ) ) ( not ( = ?auto_1788413 ?auto_1788414 ) ) ( not ( = ?auto_1788413 ?auto_1788415 ) ) ( not ( = ?auto_1788413 ?auto_1788416 ) ) ( not ( = ?auto_1788413 ?auto_1788417 ) ) ( not ( = ?auto_1788413 ?auto_1788418 ) ) ( not ( = ?auto_1788413 ?auto_1788419 ) ) ( not ( = ?auto_1788413 ?auto_1788423 ) ) ( not ( = ?auto_1788414 ?auto_1788415 ) ) ( not ( = ?auto_1788414 ?auto_1788416 ) ) ( not ( = ?auto_1788414 ?auto_1788417 ) ) ( not ( = ?auto_1788414 ?auto_1788418 ) ) ( not ( = ?auto_1788414 ?auto_1788419 ) ) ( not ( = ?auto_1788414 ?auto_1788423 ) ) ( not ( = ?auto_1788415 ?auto_1788416 ) ) ( not ( = ?auto_1788415 ?auto_1788417 ) ) ( not ( = ?auto_1788415 ?auto_1788418 ) ) ( not ( = ?auto_1788415 ?auto_1788419 ) ) ( not ( = ?auto_1788415 ?auto_1788423 ) ) ( not ( = ?auto_1788416 ?auto_1788417 ) ) ( not ( = ?auto_1788416 ?auto_1788418 ) ) ( not ( = ?auto_1788416 ?auto_1788419 ) ) ( not ( = ?auto_1788416 ?auto_1788423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788417 ?auto_1788418 ?auto_1788419 )
      ( MAKE-15CRATE-VERIFY ?auto_1788404 ?auto_1788405 ?auto_1788406 ?auto_1788408 ?auto_1788407 ?auto_1788409 ?auto_1788410 ?auto_1788411 ?auto_1788412 ?auto_1788413 ?auto_1788414 ?auto_1788415 ?auto_1788416 ?auto_1788417 ?auto_1788418 ?auto_1788419 ) )
  )

)

