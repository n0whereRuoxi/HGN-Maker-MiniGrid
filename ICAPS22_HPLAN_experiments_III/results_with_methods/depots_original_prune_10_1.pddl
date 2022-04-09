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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292123 - SURFACE
      ?auto_292124 - SURFACE
    )
    :vars
    (
      ?auto_292125 - HOIST
      ?auto_292126 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292125 ?auto_292126 ) ( SURFACE-AT ?auto_292123 ?auto_292126 ) ( CLEAR ?auto_292123 ) ( LIFTING ?auto_292125 ?auto_292124 ) ( IS-CRATE ?auto_292124 ) ( not ( = ?auto_292123 ?auto_292124 ) ) )
    :subtasks
    ( ( !DROP ?auto_292125 ?auto_292124 ?auto_292123 ?auto_292126 )
      ( MAKE-1CRATE-VERIFY ?auto_292123 ?auto_292124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292127 - SURFACE
      ?auto_292128 - SURFACE
    )
    :vars
    (
      ?auto_292129 - HOIST
      ?auto_292130 - PLACE
      ?auto_292131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292129 ?auto_292130 ) ( SURFACE-AT ?auto_292127 ?auto_292130 ) ( CLEAR ?auto_292127 ) ( IS-CRATE ?auto_292128 ) ( not ( = ?auto_292127 ?auto_292128 ) ) ( TRUCK-AT ?auto_292131 ?auto_292130 ) ( AVAILABLE ?auto_292129 ) ( IN ?auto_292128 ?auto_292131 ) )
    :subtasks
    ( ( !UNLOAD ?auto_292129 ?auto_292128 ?auto_292131 ?auto_292130 )
      ( MAKE-1CRATE ?auto_292127 ?auto_292128 )
      ( MAKE-1CRATE-VERIFY ?auto_292127 ?auto_292128 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292132 - SURFACE
      ?auto_292133 - SURFACE
    )
    :vars
    (
      ?auto_292134 - HOIST
      ?auto_292136 - PLACE
      ?auto_292135 - TRUCK
      ?auto_292137 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292134 ?auto_292136 ) ( SURFACE-AT ?auto_292132 ?auto_292136 ) ( CLEAR ?auto_292132 ) ( IS-CRATE ?auto_292133 ) ( not ( = ?auto_292132 ?auto_292133 ) ) ( AVAILABLE ?auto_292134 ) ( IN ?auto_292133 ?auto_292135 ) ( TRUCK-AT ?auto_292135 ?auto_292137 ) ( not ( = ?auto_292137 ?auto_292136 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292135 ?auto_292137 ?auto_292136 )
      ( MAKE-1CRATE ?auto_292132 ?auto_292133 )
      ( MAKE-1CRATE-VERIFY ?auto_292132 ?auto_292133 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292138 - SURFACE
      ?auto_292139 - SURFACE
    )
    :vars
    (
      ?auto_292140 - HOIST
      ?auto_292141 - PLACE
      ?auto_292143 - TRUCK
      ?auto_292142 - PLACE
      ?auto_292144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292140 ?auto_292141 ) ( SURFACE-AT ?auto_292138 ?auto_292141 ) ( CLEAR ?auto_292138 ) ( IS-CRATE ?auto_292139 ) ( not ( = ?auto_292138 ?auto_292139 ) ) ( AVAILABLE ?auto_292140 ) ( TRUCK-AT ?auto_292143 ?auto_292142 ) ( not ( = ?auto_292142 ?auto_292141 ) ) ( HOIST-AT ?auto_292144 ?auto_292142 ) ( LIFTING ?auto_292144 ?auto_292139 ) ( not ( = ?auto_292140 ?auto_292144 ) ) )
    :subtasks
    ( ( !LOAD ?auto_292144 ?auto_292139 ?auto_292143 ?auto_292142 )
      ( MAKE-1CRATE ?auto_292138 ?auto_292139 )
      ( MAKE-1CRATE-VERIFY ?auto_292138 ?auto_292139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292145 - SURFACE
      ?auto_292146 - SURFACE
    )
    :vars
    (
      ?auto_292148 - HOIST
      ?auto_292150 - PLACE
      ?auto_292151 - TRUCK
      ?auto_292147 - PLACE
      ?auto_292149 - HOIST
      ?auto_292152 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292148 ?auto_292150 ) ( SURFACE-AT ?auto_292145 ?auto_292150 ) ( CLEAR ?auto_292145 ) ( IS-CRATE ?auto_292146 ) ( not ( = ?auto_292145 ?auto_292146 ) ) ( AVAILABLE ?auto_292148 ) ( TRUCK-AT ?auto_292151 ?auto_292147 ) ( not ( = ?auto_292147 ?auto_292150 ) ) ( HOIST-AT ?auto_292149 ?auto_292147 ) ( not ( = ?auto_292148 ?auto_292149 ) ) ( AVAILABLE ?auto_292149 ) ( SURFACE-AT ?auto_292146 ?auto_292147 ) ( ON ?auto_292146 ?auto_292152 ) ( CLEAR ?auto_292146 ) ( not ( = ?auto_292145 ?auto_292152 ) ) ( not ( = ?auto_292146 ?auto_292152 ) ) )
    :subtasks
    ( ( !LIFT ?auto_292149 ?auto_292146 ?auto_292152 ?auto_292147 )
      ( MAKE-1CRATE ?auto_292145 ?auto_292146 )
      ( MAKE-1CRATE-VERIFY ?auto_292145 ?auto_292146 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292153 - SURFACE
      ?auto_292154 - SURFACE
    )
    :vars
    (
      ?auto_292158 - HOIST
      ?auto_292157 - PLACE
      ?auto_292159 - PLACE
      ?auto_292156 - HOIST
      ?auto_292155 - SURFACE
      ?auto_292160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292158 ?auto_292157 ) ( SURFACE-AT ?auto_292153 ?auto_292157 ) ( CLEAR ?auto_292153 ) ( IS-CRATE ?auto_292154 ) ( not ( = ?auto_292153 ?auto_292154 ) ) ( AVAILABLE ?auto_292158 ) ( not ( = ?auto_292159 ?auto_292157 ) ) ( HOIST-AT ?auto_292156 ?auto_292159 ) ( not ( = ?auto_292158 ?auto_292156 ) ) ( AVAILABLE ?auto_292156 ) ( SURFACE-AT ?auto_292154 ?auto_292159 ) ( ON ?auto_292154 ?auto_292155 ) ( CLEAR ?auto_292154 ) ( not ( = ?auto_292153 ?auto_292155 ) ) ( not ( = ?auto_292154 ?auto_292155 ) ) ( TRUCK-AT ?auto_292160 ?auto_292157 ) )
    :subtasks
    ( ( !DRIVE ?auto_292160 ?auto_292157 ?auto_292159 )
      ( MAKE-1CRATE ?auto_292153 ?auto_292154 )
      ( MAKE-1CRATE-VERIFY ?auto_292153 ?auto_292154 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292170 - SURFACE
      ?auto_292171 - SURFACE
      ?auto_292172 - SURFACE
    )
    :vars
    (
      ?auto_292174 - HOIST
      ?auto_292173 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292174 ?auto_292173 ) ( SURFACE-AT ?auto_292171 ?auto_292173 ) ( CLEAR ?auto_292171 ) ( LIFTING ?auto_292174 ?auto_292172 ) ( IS-CRATE ?auto_292172 ) ( not ( = ?auto_292171 ?auto_292172 ) ) ( ON ?auto_292171 ?auto_292170 ) ( not ( = ?auto_292170 ?auto_292171 ) ) ( not ( = ?auto_292170 ?auto_292172 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292171 ?auto_292172 )
      ( MAKE-2CRATE-VERIFY ?auto_292170 ?auto_292171 ?auto_292172 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292180 - SURFACE
      ?auto_292181 - SURFACE
      ?auto_292182 - SURFACE
    )
    :vars
    (
      ?auto_292185 - HOIST
      ?auto_292184 - PLACE
      ?auto_292183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292185 ?auto_292184 ) ( SURFACE-AT ?auto_292181 ?auto_292184 ) ( CLEAR ?auto_292181 ) ( IS-CRATE ?auto_292182 ) ( not ( = ?auto_292181 ?auto_292182 ) ) ( TRUCK-AT ?auto_292183 ?auto_292184 ) ( AVAILABLE ?auto_292185 ) ( IN ?auto_292182 ?auto_292183 ) ( ON ?auto_292181 ?auto_292180 ) ( not ( = ?auto_292180 ?auto_292181 ) ) ( not ( = ?auto_292180 ?auto_292182 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292181 ?auto_292182 )
      ( MAKE-2CRATE-VERIFY ?auto_292180 ?auto_292181 ?auto_292182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292186 - SURFACE
      ?auto_292187 - SURFACE
    )
    :vars
    (
      ?auto_292190 - HOIST
      ?auto_292191 - PLACE
      ?auto_292188 - TRUCK
      ?auto_292189 - SURFACE
      ?auto_292192 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292190 ?auto_292191 ) ( SURFACE-AT ?auto_292186 ?auto_292191 ) ( CLEAR ?auto_292186 ) ( IS-CRATE ?auto_292187 ) ( not ( = ?auto_292186 ?auto_292187 ) ) ( AVAILABLE ?auto_292190 ) ( IN ?auto_292187 ?auto_292188 ) ( ON ?auto_292186 ?auto_292189 ) ( not ( = ?auto_292189 ?auto_292186 ) ) ( not ( = ?auto_292189 ?auto_292187 ) ) ( TRUCK-AT ?auto_292188 ?auto_292192 ) ( not ( = ?auto_292192 ?auto_292191 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292188 ?auto_292192 ?auto_292191 )
      ( MAKE-2CRATE ?auto_292189 ?auto_292186 ?auto_292187 )
      ( MAKE-1CRATE-VERIFY ?auto_292186 ?auto_292187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292193 - SURFACE
      ?auto_292194 - SURFACE
      ?auto_292195 - SURFACE
    )
    :vars
    (
      ?auto_292199 - HOIST
      ?auto_292196 - PLACE
      ?auto_292197 - TRUCK
      ?auto_292198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292199 ?auto_292196 ) ( SURFACE-AT ?auto_292194 ?auto_292196 ) ( CLEAR ?auto_292194 ) ( IS-CRATE ?auto_292195 ) ( not ( = ?auto_292194 ?auto_292195 ) ) ( AVAILABLE ?auto_292199 ) ( IN ?auto_292195 ?auto_292197 ) ( ON ?auto_292194 ?auto_292193 ) ( not ( = ?auto_292193 ?auto_292194 ) ) ( not ( = ?auto_292193 ?auto_292195 ) ) ( TRUCK-AT ?auto_292197 ?auto_292198 ) ( not ( = ?auto_292198 ?auto_292196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292194 ?auto_292195 )
      ( MAKE-2CRATE-VERIFY ?auto_292193 ?auto_292194 ?auto_292195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292200 - SURFACE
      ?auto_292201 - SURFACE
    )
    :vars
    (
      ?auto_292203 - HOIST
      ?auto_292204 - PLACE
      ?auto_292206 - SURFACE
      ?auto_292202 - TRUCK
      ?auto_292205 - PLACE
      ?auto_292207 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292203 ?auto_292204 ) ( SURFACE-AT ?auto_292200 ?auto_292204 ) ( CLEAR ?auto_292200 ) ( IS-CRATE ?auto_292201 ) ( not ( = ?auto_292200 ?auto_292201 ) ) ( AVAILABLE ?auto_292203 ) ( ON ?auto_292200 ?auto_292206 ) ( not ( = ?auto_292206 ?auto_292200 ) ) ( not ( = ?auto_292206 ?auto_292201 ) ) ( TRUCK-AT ?auto_292202 ?auto_292205 ) ( not ( = ?auto_292205 ?auto_292204 ) ) ( HOIST-AT ?auto_292207 ?auto_292205 ) ( LIFTING ?auto_292207 ?auto_292201 ) ( not ( = ?auto_292203 ?auto_292207 ) ) )
    :subtasks
    ( ( !LOAD ?auto_292207 ?auto_292201 ?auto_292202 ?auto_292205 )
      ( MAKE-2CRATE ?auto_292206 ?auto_292200 ?auto_292201 )
      ( MAKE-1CRATE-VERIFY ?auto_292200 ?auto_292201 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292208 - SURFACE
      ?auto_292209 - SURFACE
      ?auto_292210 - SURFACE
    )
    :vars
    (
      ?auto_292212 - HOIST
      ?auto_292214 - PLACE
      ?auto_292215 - TRUCK
      ?auto_292213 - PLACE
      ?auto_292211 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292212 ?auto_292214 ) ( SURFACE-AT ?auto_292209 ?auto_292214 ) ( CLEAR ?auto_292209 ) ( IS-CRATE ?auto_292210 ) ( not ( = ?auto_292209 ?auto_292210 ) ) ( AVAILABLE ?auto_292212 ) ( ON ?auto_292209 ?auto_292208 ) ( not ( = ?auto_292208 ?auto_292209 ) ) ( not ( = ?auto_292208 ?auto_292210 ) ) ( TRUCK-AT ?auto_292215 ?auto_292213 ) ( not ( = ?auto_292213 ?auto_292214 ) ) ( HOIST-AT ?auto_292211 ?auto_292213 ) ( LIFTING ?auto_292211 ?auto_292210 ) ( not ( = ?auto_292212 ?auto_292211 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292209 ?auto_292210 )
      ( MAKE-2CRATE-VERIFY ?auto_292208 ?auto_292209 ?auto_292210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292216 - SURFACE
      ?auto_292217 - SURFACE
    )
    :vars
    (
      ?auto_292219 - HOIST
      ?auto_292223 - PLACE
      ?auto_292222 - SURFACE
      ?auto_292218 - TRUCK
      ?auto_292221 - PLACE
      ?auto_292220 - HOIST
      ?auto_292224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292219 ?auto_292223 ) ( SURFACE-AT ?auto_292216 ?auto_292223 ) ( CLEAR ?auto_292216 ) ( IS-CRATE ?auto_292217 ) ( not ( = ?auto_292216 ?auto_292217 ) ) ( AVAILABLE ?auto_292219 ) ( ON ?auto_292216 ?auto_292222 ) ( not ( = ?auto_292222 ?auto_292216 ) ) ( not ( = ?auto_292222 ?auto_292217 ) ) ( TRUCK-AT ?auto_292218 ?auto_292221 ) ( not ( = ?auto_292221 ?auto_292223 ) ) ( HOIST-AT ?auto_292220 ?auto_292221 ) ( not ( = ?auto_292219 ?auto_292220 ) ) ( AVAILABLE ?auto_292220 ) ( SURFACE-AT ?auto_292217 ?auto_292221 ) ( ON ?auto_292217 ?auto_292224 ) ( CLEAR ?auto_292217 ) ( not ( = ?auto_292216 ?auto_292224 ) ) ( not ( = ?auto_292217 ?auto_292224 ) ) ( not ( = ?auto_292222 ?auto_292224 ) ) )
    :subtasks
    ( ( !LIFT ?auto_292220 ?auto_292217 ?auto_292224 ?auto_292221 )
      ( MAKE-2CRATE ?auto_292222 ?auto_292216 ?auto_292217 )
      ( MAKE-1CRATE-VERIFY ?auto_292216 ?auto_292217 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292225 - SURFACE
      ?auto_292226 - SURFACE
      ?auto_292227 - SURFACE
    )
    :vars
    (
      ?auto_292228 - HOIST
      ?auto_292229 - PLACE
      ?auto_292231 - TRUCK
      ?auto_292233 - PLACE
      ?auto_292230 - HOIST
      ?auto_292232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292228 ?auto_292229 ) ( SURFACE-AT ?auto_292226 ?auto_292229 ) ( CLEAR ?auto_292226 ) ( IS-CRATE ?auto_292227 ) ( not ( = ?auto_292226 ?auto_292227 ) ) ( AVAILABLE ?auto_292228 ) ( ON ?auto_292226 ?auto_292225 ) ( not ( = ?auto_292225 ?auto_292226 ) ) ( not ( = ?auto_292225 ?auto_292227 ) ) ( TRUCK-AT ?auto_292231 ?auto_292233 ) ( not ( = ?auto_292233 ?auto_292229 ) ) ( HOIST-AT ?auto_292230 ?auto_292233 ) ( not ( = ?auto_292228 ?auto_292230 ) ) ( AVAILABLE ?auto_292230 ) ( SURFACE-AT ?auto_292227 ?auto_292233 ) ( ON ?auto_292227 ?auto_292232 ) ( CLEAR ?auto_292227 ) ( not ( = ?auto_292226 ?auto_292232 ) ) ( not ( = ?auto_292227 ?auto_292232 ) ) ( not ( = ?auto_292225 ?auto_292232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292226 ?auto_292227 )
      ( MAKE-2CRATE-VERIFY ?auto_292225 ?auto_292226 ?auto_292227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292234 - SURFACE
      ?auto_292235 - SURFACE
    )
    :vars
    (
      ?auto_292241 - HOIST
      ?auto_292236 - PLACE
      ?auto_292237 - SURFACE
      ?auto_292242 - PLACE
      ?auto_292240 - HOIST
      ?auto_292238 - SURFACE
      ?auto_292239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292241 ?auto_292236 ) ( SURFACE-AT ?auto_292234 ?auto_292236 ) ( CLEAR ?auto_292234 ) ( IS-CRATE ?auto_292235 ) ( not ( = ?auto_292234 ?auto_292235 ) ) ( AVAILABLE ?auto_292241 ) ( ON ?auto_292234 ?auto_292237 ) ( not ( = ?auto_292237 ?auto_292234 ) ) ( not ( = ?auto_292237 ?auto_292235 ) ) ( not ( = ?auto_292242 ?auto_292236 ) ) ( HOIST-AT ?auto_292240 ?auto_292242 ) ( not ( = ?auto_292241 ?auto_292240 ) ) ( AVAILABLE ?auto_292240 ) ( SURFACE-AT ?auto_292235 ?auto_292242 ) ( ON ?auto_292235 ?auto_292238 ) ( CLEAR ?auto_292235 ) ( not ( = ?auto_292234 ?auto_292238 ) ) ( not ( = ?auto_292235 ?auto_292238 ) ) ( not ( = ?auto_292237 ?auto_292238 ) ) ( TRUCK-AT ?auto_292239 ?auto_292236 ) )
    :subtasks
    ( ( !DRIVE ?auto_292239 ?auto_292236 ?auto_292242 )
      ( MAKE-2CRATE ?auto_292237 ?auto_292234 ?auto_292235 )
      ( MAKE-1CRATE-VERIFY ?auto_292234 ?auto_292235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292243 - SURFACE
      ?auto_292244 - SURFACE
      ?auto_292245 - SURFACE
    )
    :vars
    (
      ?auto_292250 - HOIST
      ?auto_292247 - PLACE
      ?auto_292251 - PLACE
      ?auto_292246 - HOIST
      ?auto_292249 - SURFACE
      ?auto_292248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292250 ?auto_292247 ) ( SURFACE-AT ?auto_292244 ?auto_292247 ) ( CLEAR ?auto_292244 ) ( IS-CRATE ?auto_292245 ) ( not ( = ?auto_292244 ?auto_292245 ) ) ( AVAILABLE ?auto_292250 ) ( ON ?auto_292244 ?auto_292243 ) ( not ( = ?auto_292243 ?auto_292244 ) ) ( not ( = ?auto_292243 ?auto_292245 ) ) ( not ( = ?auto_292251 ?auto_292247 ) ) ( HOIST-AT ?auto_292246 ?auto_292251 ) ( not ( = ?auto_292250 ?auto_292246 ) ) ( AVAILABLE ?auto_292246 ) ( SURFACE-AT ?auto_292245 ?auto_292251 ) ( ON ?auto_292245 ?auto_292249 ) ( CLEAR ?auto_292245 ) ( not ( = ?auto_292244 ?auto_292249 ) ) ( not ( = ?auto_292245 ?auto_292249 ) ) ( not ( = ?auto_292243 ?auto_292249 ) ) ( TRUCK-AT ?auto_292248 ?auto_292247 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292244 ?auto_292245 )
      ( MAKE-2CRATE-VERIFY ?auto_292243 ?auto_292244 ?auto_292245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292252 - SURFACE
      ?auto_292253 - SURFACE
    )
    :vars
    (
      ?auto_292257 - HOIST
      ?auto_292256 - PLACE
      ?auto_292258 - SURFACE
      ?auto_292255 - PLACE
      ?auto_292254 - HOIST
      ?auto_292259 - SURFACE
      ?auto_292260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292257 ?auto_292256 ) ( IS-CRATE ?auto_292253 ) ( not ( = ?auto_292252 ?auto_292253 ) ) ( not ( = ?auto_292258 ?auto_292252 ) ) ( not ( = ?auto_292258 ?auto_292253 ) ) ( not ( = ?auto_292255 ?auto_292256 ) ) ( HOIST-AT ?auto_292254 ?auto_292255 ) ( not ( = ?auto_292257 ?auto_292254 ) ) ( AVAILABLE ?auto_292254 ) ( SURFACE-AT ?auto_292253 ?auto_292255 ) ( ON ?auto_292253 ?auto_292259 ) ( CLEAR ?auto_292253 ) ( not ( = ?auto_292252 ?auto_292259 ) ) ( not ( = ?auto_292253 ?auto_292259 ) ) ( not ( = ?auto_292258 ?auto_292259 ) ) ( TRUCK-AT ?auto_292260 ?auto_292256 ) ( SURFACE-AT ?auto_292258 ?auto_292256 ) ( CLEAR ?auto_292258 ) ( LIFTING ?auto_292257 ?auto_292252 ) ( IS-CRATE ?auto_292252 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292258 ?auto_292252 )
      ( MAKE-2CRATE ?auto_292258 ?auto_292252 ?auto_292253 )
      ( MAKE-1CRATE-VERIFY ?auto_292252 ?auto_292253 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292261 - SURFACE
      ?auto_292262 - SURFACE
      ?auto_292263 - SURFACE
    )
    :vars
    (
      ?auto_292269 - HOIST
      ?auto_292265 - PLACE
      ?auto_292266 - PLACE
      ?auto_292267 - HOIST
      ?auto_292264 - SURFACE
      ?auto_292268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292269 ?auto_292265 ) ( IS-CRATE ?auto_292263 ) ( not ( = ?auto_292262 ?auto_292263 ) ) ( not ( = ?auto_292261 ?auto_292262 ) ) ( not ( = ?auto_292261 ?auto_292263 ) ) ( not ( = ?auto_292266 ?auto_292265 ) ) ( HOIST-AT ?auto_292267 ?auto_292266 ) ( not ( = ?auto_292269 ?auto_292267 ) ) ( AVAILABLE ?auto_292267 ) ( SURFACE-AT ?auto_292263 ?auto_292266 ) ( ON ?auto_292263 ?auto_292264 ) ( CLEAR ?auto_292263 ) ( not ( = ?auto_292262 ?auto_292264 ) ) ( not ( = ?auto_292263 ?auto_292264 ) ) ( not ( = ?auto_292261 ?auto_292264 ) ) ( TRUCK-AT ?auto_292268 ?auto_292265 ) ( SURFACE-AT ?auto_292261 ?auto_292265 ) ( CLEAR ?auto_292261 ) ( LIFTING ?auto_292269 ?auto_292262 ) ( IS-CRATE ?auto_292262 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292262 ?auto_292263 )
      ( MAKE-2CRATE-VERIFY ?auto_292261 ?auto_292262 ?auto_292263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292270 - SURFACE
      ?auto_292271 - SURFACE
    )
    :vars
    (
      ?auto_292273 - HOIST
      ?auto_292272 - PLACE
      ?auto_292274 - SURFACE
      ?auto_292275 - PLACE
      ?auto_292277 - HOIST
      ?auto_292276 - SURFACE
      ?auto_292278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292273 ?auto_292272 ) ( IS-CRATE ?auto_292271 ) ( not ( = ?auto_292270 ?auto_292271 ) ) ( not ( = ?auto_292274 ?auto_292270 ) ) ( not ( = ?auto_292274 ?auto_292271 ) ) ( not ( = ?auto_292275 ?auto_292272 ) ) ( HOIST-AT ?auto_292277 ?auto_292275 ) ( not ( = ?auto_292273 ?auto_292277 ) ) ( AVAILABLE ?auto_292277 ) ( SURFACE-AT ?auto_292271 ?auto_292275 ) ( ON ?auto_292271 ?auto_292276 ) ( CLEAR ?auto_292271 ) ( not ( = ?auto_292270 ?auto_292276 ) ) ( not ( = ?auto_292271 ?auto_292276 ) ) ( not ( = ?auto_292274 ?auto_292276 ) ) ( TRUCK-AT ?auto_292278 ?auto_292272 ) ( SURFACE-AT ?auto_292274 ?auto_292272 ) ( CLEAR ?auto_292274 ) ( IS-CRATE ?auto_292270 ) ( AVAILABLE ?auto_292273 ) ( IN ?auto_292270 ?auto_292278 ) )
    :subtasks
    ( ( !UNLOAD ?auto_292273 ?auto_292270 ?auto_292278 ?auto_292272 )
      ( MAKE-2CRATE ?auto_292274 ?auto_292270 ?auto_292271 )
      ( MAKE-1CRATE-VERIFY ?auto_292270 ?auto_292271 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292279 - SURFACE
      ?auto_292280 - SURFACE
      ?auto_292281 - SURFACE
    )
    :vars
    (
      ?auto_292285 - HOIST
      ?auto_292287 - PLACE
      ?auto_292282 - PLACE
      ?auto_292286 - HOIST
      ?auto_292283 - SURFACE
      ?auto_292284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292285 ?auto_292287 ) ( IS-CRATE ?auto_292281 ) ( not ( = ?auto_292280 ?auto_292281 ) ) ( not ( = ?auto_292279 ?auto_292280 ) ) ( not ( = ?auto_292279 ?auto_292281 ) ) ( not ( = ?auto_292282 ?auto_292287 ) ) ( HOIST-AT ?auto_292286 ?auto_292282 ) ( not ( = ?auto_292285 ?auto_292286 ) ) ( AVAILABLE ?auto_292286 ) ( SURFACE-AT ?auto_292281 ?auto_292282 ) ( ON ?auto_292281 ?auto_292283 ) ( CLEAR ?auto_292281 ) ( not ( = ?auto_292280 ?auto_292283 ) ) ( not ( = ?auto_292281 ?auto_292283 ) ) ( not ( = ?auto_292279 ?auto_292283 ) ) ( TRUCK-AT ?auto_292284 ?auto_292287 ) ( SURFACE-AT ?auto_292279 ?auto_292287 ) ( CLEAR ?auto_292279 ) ( IS-CRATE ?auto_292280 ) ( AVAILABLE ?auto_292285 ) ( IN ?auto_292280 ?auto_292284 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292280 ?auto_292281 )
      ( MAKE-2CRATE-VERIFY ?auto_292279 ?auto_292280 ?auto_292281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292324 - SURFACE
      ?auto_292325 - SURFACE
    )
    :vars
    (
      ?auto_292329 - HOIST
      ?auto_292331 - PLACE
      ?auto_292332 - SURFACE
      ?auto_292330 - PLACE
      ?auto_292326 - HOIST
      ?auto_292328 - SURFACE
      ?auto_292327 - TRUCK
      ?auto_292333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292329 ?auto_292331 ) ( SURFACE-AT ?auto_292324 ?auto_292331 ) ( CLEAR ?auto_292324 ) ( IS-CRATE ?auto_292325 ) ( not ( = ?auto_292324 ?auto_292325 ) ) ( AVAILABLE ?auto_292329 ) ( ON ?auto_292324 ?auto_292332 ) ( not ( = ?auto_292332 ?auto_292324 ) ) ( not ( = ?auto_292332 ?auto_292325 ) ) ( not ( = ?auto_292330 ?auto_292331 ) ) ( HOIST-AT ?auto_292326 ?auto_292330 ) ( not ( = ?auto_292329 ?auto_292326 ) ) ( AVAILABLE ?auto_292326 ) ( SURFACE-AT ?auto_292325 ?auto_292330 ) ( ON ?auto_292325 ?auto_292328 ) ( CLEAR ?auto_292325 ) ( not ( = ?auto_292324 ?auto_292328 ) ) ( not ( = ?auto_292325 ?auto_292328 ) ) ( not ( = ?auto_292332 ?auto_292328 ) ) ( TRUCK-AT ?auto_292327 ?auto_292333 ) ( not ( = ?auto_292333 ?auto_292331 ) ) ( not ( = ?auto_292330 ?auto_292333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292327 ?auto_292333 ?auto_292331 )
      ( MAKE-1CRATE ?auto_292324 ?auto_292325 )
      ( MAKE-1CRATE-VERIFY ?auto_292324 ?auto_292325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292363 - SURFACE
      ?auto_292364 - SURFACE
      ?auto_292365 - SURFACE
      ?auto_292366 - SURFACE
    )
    :vars
    (
      ?auto_292368 - HOIST
      ?auto_292367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292368 ?auto_292367 ) ( SURFACE-AT ?auto_292365 ?auto_292367 ) ( CLEAR ?auto_292365 ) ( LIFTING ?auto_292368 ?auto_292366 ) ( IS-CRATE ?auto_292366 ) ( not ( = ?auto_292365 ?auto_292366 ) ) ( ON ?auto_292364 ?auto_292363 ) ( ON ?auto_292365 ?auto_292364 ) ( not ( = ?auto_292363 ?auto_292364 ) ) ( not ( = ?auto_292363 ?auto_292365 ) ) ( not ( = ?auto_292363 ?auto_292366 ) ) ( not ( = ?auto_292364 ?auto_292365 ) ) ( not ( = ?auto_292364 ?auto_292366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292365 ?auto_292366 )
      ( MAKE-3CRATE-VERIFY ?auto_292363 ?auto_292364 ?auto_292365 ?auto_292366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292380 - SURFACE
      ?auto_292381 - SURFACE
      ?auto_292382 - SURFACE
      ?auto_292383 - SURFACE
    )
    :vars
    (
      ?auto_292384 - HOIST
      ?auto_292386 - PLACE
      ?auto_292385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292384 ?auto_292386 ) ( SURFACE-AT ?auto_292382 ?auto_292386 ) ( CLEAR ?auto_292382 ) ( IS-CRATE ?auto_292383 ) ( not ( = ?auto_292382 ?auto_292383 ) ) ( TRUCK-AT ?auto_292385 ?auto_292386 ) ( AVAILABLE ?auto_292384 ) ( IN ?auto_292383 ?auto_292385 ) ( ON ?auto_292382 ?auto_292381 ) ( not ( = ?auto_292381 ?auto_292382 ) ) ( not ( = ?auto_292381 ?auto_292383 ) ) ( ON ?auto_292381 ?auto_292380 ) ( not ( = ?auto_292380 ?auto_292381 ) ) ( not ( = ?auto_292380 ?auto_292382 ) ) ( not ( = ?auto_292380 ?auto_292383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292381 ?auto_292382 ?auto_292383 )
      ( MAKE-3CRATE-VERIFY ?auto_292380 ?auto_292381 ?auto_292382 ?auto_292383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292401 - SURFACE
      ?auto_292402 - SURFACE
      ?auto_292403 - SURFACE
      ?auto_292404 - SURFACE
    )
    :vars
    (
      ?auto_292406 - HOIST
      ?auto_292408 - PLACE
      ?auto_292405 - TRUCK
      ?auto_292407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292406 ?auto_292408 ) ( SURFACE-AT ?auto_292403 ?auto_292408 ) ( CLEAR ?auto_292403 ) ( IS-CRATE ?auto_292404 ) ( not ( = ?auto_292403 ?auto_292404 ) ) ( AVAILABLE ?auto_292406 ) ( IN ?auto_292404 ?auto_292405 ) ( ON ?auto_292403 ?auto_292402 ) ( not ( = ?auto_292402 ?auto_292403 ) ) ( not ( = ?auto_292402 ?auto_292404 ) ) ( TRUCK-AT ?auto_292405 ?auto_292407 ) ( not ( = ?auto_292407 ?auto_292408 ) ) ( ON ?auto_292402 ?auto_292401 ) ( not ( = ?auto_292401 ?auto_292402 ) ) ( not ( = ?auto_292401 ?auto_292403 ) ) ( not ( = ?auto_292401 ?auto_292404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292402 ?auto_292403 ?auto_292404 )
      ( MAKE-3CRATE-VERIFY ?auto_292401 ?auto_292402 ?auto_292403 ?auto_292404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292425 - SURFACE
      ?auto_292426 - SURFACE
      ?auto_292427 - SURFACE
      ?auto_292428 - SURFACE
    )
    :vars
    (
      ?auto_292429 - HOIST
      ?auto_292430 - PLACE
      ?auto_292433 - TRUCK
      ?auto_292431 - PLACE
      ?auto_292432 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292429 ?auto_292430 ) ( SURFACE-AT ?auto_292427 ?auto_292430 ) ( CLEAR ?auto_292427 ) ( IS-CRATE ?auto_292428 ) ( not ( = ?auto_292427 ?auto_292428 ) ) ( AVAILABLE ?auto_292429 ) ( ON ?auto_292427 ?auto_292426 ) ( not ( = ?auto_292426 ?auto_292427 ) ) ( not ( = ?auto_292426 ?auto_292428 ) ) ( TRUCK-AT ?auto_292433 ?auto_292431 ) ( not ( = ?auto_292431 ?auto_292430 ) ) ( HOIST-AT ?auto_292432 ?auto_292431 ) ( LIFTING ?auto_292432 ?auto_292428 ) ( not ( = ?auto_292429 ?auto_292432 ) ) ( ON ?auto_292426 ?auto_292425 ) ( not ( = ?auto_292425 ?auto_292426 ) ) ( not ( = ?auto_292425 ?auto_292427 ) ) ( not ( = ?auto_292425 ?auto_292428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292426 ?auto_292427 ?auto_292428 )
      ( MAKE-3CRATE-VERIFY ?auto_292425 ?auto_292426 ?auto_292427 ?auto_292428 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292452 - SURFACE
      ?auto_292453 - SURFACE
      ?auto_292454 - SURFACE
      ?auto_292455 - SURFACE
    )
    :vars
    (
      ?auto_292457 - HOIST
      ?auto_292456 - PLACE
      ?auto_292461 - TRUCK
      ?auto_292458 - PLACE
      ?auto_292460 - HOIST
      ?auto_292459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292457 ?auto_292456 ) ( SURFACE-AT ?auto_292454 ?auto_292456 ) ( CLEAR ?auto_292454 ) ( IS-CRATE ?auto_292455 ) ( not ( = ?auto_292454 ?auto_292455 ) ) ( AVAILABLE ?auto_292457 ) ( ON ?auto_292454 ?auto_292453 ) ( not ( = ?auto_292453 ?auto_292454 ) ) ( not ( = ?auto_292453 ?auto_292455 ) ) ( TRUCK-AT ?auto_292461 ?auto_292458 ) ( not ( = ?auto_292458 ?auto_292456 ) ) ( HOIST-AT ?auto_292460 ?auto_292458 ) ( not ( = ?auto_292457 ?auto_292460 ) ) ( AVAILABLE ?auto_292460 ) ( SURFACE-AT ?auto_292455 ?auto_292458 ) ( ON ?auto_292455 ?auto_292459 ) ( CLEAR ?auto_292455 ) ( not ( = ?auto_292454 ?auto_292459 ) ) ( not ( = ?auto_292455 ?auto_292459 ) ) ( not ( = ?auto_292453 ?auto_292459 ) ) ( ON ?auto_292453 ?auto_292452 ) ( not ( = ?auto_292452 ?auto_292453 ) ) ( not ( = ?auto_292452 ?auto_292454 ) ) ( not ( = ?auto_292452 ?auto_292455 ) ) ( not ( = ?auto_292452 ?auto_292459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292453 ?auto_292454 ?auto_292455 )
      ( MAKE-3CRATE-VERIFY ?auto_292452 ?auto_292453 ?auto_292454 ?auto_292455 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292480 - SURFACE
      ?auto_292481 - SURFACE
      ?auto_292482 - SURFACE
      ?auto_292483 - SURFACE
    )
    :vars
    (
      ?auto_292487 - HOIST
      ?auto_292485 - PLACE
      ?auto_292486 - PLACE
      ?auto_292484 - HOIST
      ?auto_292489 - SURFACE
      ?auto_292488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292487 ?auto_292485 ) ( SURFACE-AT ?auto_292482 ?auto_292485 ) ( CLEAR ?auto_292482 ) ( IS-CRATE ?auto_292483 ) ( not ( = ?auto_292482 ?auto_292483 ) ) ( AVAILABLE ?auto_292487 ) ( ON ?auto_292482 ?auto_292481 ) ( not ( = ?auto_292481 ?auto_292482 ) ) ( not ( = ?auto_292481 ?auto_292483 ) ) ( not ( = ?auto_292486 ?auto_292485 ) ) ( HOIST-AT ?auto_292484 ?auto_292486 ) ( not ( = ?auto_292487 ?auto_292484 ) ) ( AVAILABLE ?auto_292484 ) ( SURFACE-AT ?auto_292483 ?auto_292486 ) ( ON ?auto_292483 ?auto_292489 ) ( CLEAR ?auto_292483 ) ( not ( = ?auto_292482 ?auto_292489 ) ) ( not ( = ?auto_292483 ?auto_292489 ) ) ( not ( = ?auto_292481 ?auto_292489 ) ) ( TRUCK-AT ?auto_292488 ?auto_292485 ) ( ON ?auto_292481 ?auto_292480 ) ( not ( = ?auto_292480 ?auto_292481 ) ) ( not ( = ?auto_292480 ?auto_292482 ) ) ( not ( = ?auto_292480 ?auto_292483 ) ) ( not ( = ?auto_292480 ?auto_292489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292481 ?auto_292482 ?auto_292483 )
      ( MAKE-3CRATE-VERIFY ?auto_292480 ?auto_292481 ?auto_292482 ?auto_292483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292508 - SURFACE
      ?auto_292509 - SURFACE
      ?auto_292510 - SURFACE
      ?auto_292511 - SURFACE
    )
    :vars
    (
      ?auto_292517 - HOIST
      ?auto_292512 - PLACE
      ?auto_292516 - PLACE
      ?auto_292515 - HOIST
      ?auto_292513 - SURFACE
      ?auto_292514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292517 ?auto_292512 ) ( IS-CRATE ?auto_292511 ) ( not ( = ?auto_292510 ?auto_292511 ) ) ( not ( = ?auto_292509 ?auto_292510 ) ) ( not ( = ?auto_292509 ?auto_292511 ) ) ( not ( = ?auto_292516 ?auto_292512 ) ) ( HOIST-AT ?auto_292515 ?auto_292516 ) ( not ( = ?auto_292517 ?auto_292515 ) ) ( AVAILABLE ?auto_292515 ) ( SURFACE-AT ?auto_292511 ?auto_292516 ) ( ON ?auto_292511 ?auto_292513 ) ( CLEAR ?auto_292511 ) ( not ( = ?auto_292510 ?auto_292513 ) ) ( not ( = ?auto_292511 ?auto_292513 ) ) ( not ( = ?auto_292509 ?auto_292513 ) ) ( TRUCK-AT ?auto_292514 ?auto_292512 ) ( SURFACE-AT ?auto_292509 ?auto_292512 ) ( CLEAR ?auto_292509 ) ( LIFTING ?auto_292517 ?auto_292510 ) ( IS-CRATE ?auto_292510 ) ( ON ?auto_292509 ?auto_292508 ) ( not ( = ?auto_292508 ?auto_292509 ) ) ( not ( = ?auto_292508 ?auto_292510 ) ) ( not ( = ?auto_292508 ?auto_292511 ) ) ( not ( = ?auto_292508 ?auto_292513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292509 ?auto_292510 ?auto_292511 )
      ( MAKE-3CRATE-VERIFY ?auto_292508 ?auto_292509 ?auto_292510 ?auto_292511 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292536 - SURFACE
      ?auto_292537 - SURFACE
      ?auto_292538 - SURFACE
      ?auto_292539 - SURFACE
    )
    :vars
    (
      ?auto_292542 - HOIST
      ?auto_292540 - PLACE
      ?auto_292543 - PLACE
      ?auto_292544 - HOIST
      ?auto_292541 - SURFACE
      ?auto_292545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292542 ?auto_292540 ) ( IS-CRATE ?auto_292539 ) ( not ( = ?auto_292538 ?auto_292539 ) ) ( not ( = ?auto_292537 ?auto_292538 ) ) ( not ( = ?auto_292537 ?auto_292539 ) ) ( not ( = ?auto_292543 ?auto_292540 ) ) ( HOIST-AT ?auto_292544 ?auto_292543 ) ( not ( = ?auto_292542 ?auto_292544 ) ) ( AVAILABLE ?auto_292544 ) ( SURFACE-AT ?auto_292539 ?auto_292543 ) ( ON ?auto_292539 ?auto_292541 ) ( CLEAR ?auto_292539 ) ( not ( = ?auto_292538 ?auto_292541 ) ) ( not ( = ?auto_292539 ?auto_292541 ) ) ( not ( = ?auto_292537 ?auto_292541 ) ) ( TRUCK-AT ?auto_292545 ?auto_292540 ) ( SURFACE-AT ?auto_292537 ?auto_292540 ) ( CLEAR ?auto_292537 ) ( IS-CRATE ?auto_292538 ) ( AVAILABLE ?auto_292542 ) ( IN ?auto_292538 ?auto_292545 ) ( ON ?auto_292537 ?auto_292536 ) ( not ( = ?auto_292536 ?auto_292537 ) ) ( not ( = ?auto_292536 ?auto_292538 ) ) ( not ( = ?auto_292536 ?auto_292539 ) ) ( not ( = ?auto_292536 ?auto_292541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292537 ?auto_292538 ?auto_292539 )
      ( MAKE-3CRATE-VERIFY ?auto_292536 ?auto_292537 ?auto_292538 ?auto_292539 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292827 - SURFACE
      ?auto_292828 - SURFACE
      ?auto_292829 - SURFACE
      ?auto_292830 - SURFACE
      ?auto_292831 - SURFACE
    )
    :vars
    (
      ?auto_292832 - HOIST
      ?auto_292833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292832 ?auto_292833 ) ( SURFACE-AT ?auto_292830 ?auto_292833 ) ( CLEAR ?auto_292830 ) ( LIFTING ?auto_292832 ?auto_292831 ) ( IS-CRATE ?auto_292831 ) ( not ( = ?auto_292830 ?auto_292831 ) ) ( ON ?auto_292828 ?auto_292827 ) ( ON ?auto_292829 ?auto_292828 ) ( ON ?auto_292830 ?auto_292829 ) ( not ( = ?auto_292827 ?auto_292828 ) ) ( not ( = ?auto_292827 ?auto_292829 ) ) ( not ( = ?auto_292827 ?auto_292830 ) ) ( not ( = ?auto_292827 ?auto_292831 ) ) ( not ( = ?auto_292828 ?auto_292829 ) ) ( not ( = ?auto_292828 ?auto_292830 ) ) ( not ( = ?auto_292828 ?auto_292831 ) ) ( not ( = ?auto_292829 ?auto_292830 ) ) ( not ( = ?auto_292829 ?auto_292831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292830 ?auto_292831 )
      ( MAKE-4CRATE-VERIFY ?auto_292827 ?auto_292828 ?auto_292829 ?auto_292830 ?auto_292831 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292852 - SURFACE
      ?auto_292853 - SURFACE
      ?auto_292854 - SURFACE
      ?auto_292855 - SURFACE
      ?auto_292856 - SURFACE
    )
    :vars
    (
      ?auto_292858 - HOIST
      ?auto_292857 - PLACE
      ?auto_292859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292858 ?auto_292857 ) ( SURFACE-AT ?auto_292855 ?auto_292857 ) ( CLEAR ?auto_292855 ) ( IS-CRATE ?auto_292856 ) ( not ( = ?auto_292855 ?auto_292856 ) ) ( TRUCK-AT ?auto_292859 ?auto_292857 ) ( AVAILABLE ?auto_292858 ) ( IN ?auto_292856 ?auto_292859 ) ( ON ?auto_292855 ?auto_292854 ) ( not ( = ?auto_292854 ?auto_292855 ) ) ( not ( = ?auto_292854 ?auto_292856 ) ) ( ON ?auto_292853 ?auto_292852 ) ( ON ?auto_292854 ?auto_292853 ) ( not ( = ?auto_292852 ?auto_292853 ) ) ( not ( = ?auto_292852 ?auto_292854 ) ) ( not ( = ?auto_292852 ?auto_292855 ) ) ( not ( = ?auto_292852 ?auto_292856 ) ) ( not ( = ?auto_292853 ?auto_292854 ) ) ( not ( = ?auto_292853 ?auto_292855 ) ) ( not ( = ?auto_292853 ?auto_292856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292854 ?auto_292855 ?auto_292856 )
      ( MAKE-4CRATE-VERIFY ?auto_292852 ?auto_292853 ?auto_292854 ?auto_292855 ?auto_292856 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292882 - SURFACE
      ?auto_292883 - SURFACE
      ?auto_292884 - SURFACE
      ?auto_292885 - SURFACE
      ?auto_292886 - SURFACE
    )
    :vars
    (
      ?auto_292890 - HOIST
      ?auto_292889 - PLACE
      ?auto_292888 - TRUCK
      ?auto_292887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292890 ?auto_292889 ) ( SURFACE-AT ?auto_292885 ?auto_292889 ) ( CLEAR ?auto_292885 ) ( IS-CRATE ?auto_292886 ) ( not ( = ?auto_292885 ?auto_292886 ) ) ( AVAILABLE ?auto_292890 ) ( IN ?auto_292886 ?auto_292888 ) ( ON ?auto_292885 ?auto_292884 ) ( not ( = ?auto_292884 ?auto_292885 ) ) ( not ( = ?auto_292884 ?auto_292886 ) ) ( TRUCK-AT ?auto_292888 ?auto_292887 ) ( not ( = ?auto_292887 ?auto_292889 ) ) ( ON ?auto_292883 ?auto_292882 ) ( ON ?auto_292884 ?auto_292883 ) ( not ( = ?auto_292882 ?auto_292883 ) ) ( not ( = ?auto_292882 ?auto_292884 ) ) ( not ( = ?auto_292882 ?auto_292885 ) ) ( not ( = ?auto_292882 ?auto_292886 ) ) ( not ( = ?auto_292883 ?auto_292884 ) ) ( not ( = ?auto_292883 ?auto_292885 ) ) ( not ( = ?auto_292883 ?auto_292886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292884 ?auto_292885 ?auto_292886 )
      ( MAKE-4CRATE-VERIFY ?auto_292882 ?auto_292883 ?auto_292884 ?auto_292885 ?auto_292886 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292916 - SURFACE
      ?auto_292917 - SURFACE
      ?auto_292918 - SURFACE
      ?auto_292919 - SURFACE
      ?auto_292920 - SURFACE
    )
    :vars
    (
      ?auto_292922 - HOIST
      ?auto_292925 - PLACE
      ?auto_292924 - TRUCK
      ?auto_292921 - PLACE
      ?auto_292923 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292922 ?auto_292925 ) ( SURFACE-AT ?auto_292919 ?auto_292925 ) ( CLEAR ?auto_292919 ) ( IS-CRATE ?auto_292920 ) ( not ( = ?auto_292919 ?auto_292920 ) ) ( AVAILABLE ?auto_292922 ) ( ON ?auto_292919 ?auto_292918 ) ( not ( = ?auto_292918 ?auto_292919 ) ) ( not ( = ?auto_292918 ?auto_292920 ) ) ( TRUCK-AT ?auto_292924 ?auto_292921 ) ( not ( = ?auto_292921 ?auto_292925 ) ) ( HOIST-AT ?auto_292923 ?auto_292921 ) ( LIFTING ?auto_292923 ?auto_292920 ) ( not ( = ?auto_292922 ?auto_292923 ) ) ( ON ?auto_292917 ?auto_292916 ) ( ON ?auto_292918 ?auto_292917 ) ( not ( = ?auto_292916 ?auto_292917 ) ) ( not ( = ?auto_292916 ?auto_292918 ) ) ( not ( = ?auto_292916 ?auto_292919 ) ) ( not ( = ?auto_292916 ?auto_292920 ) ) ( not ( = ?auto_292917 ?auto_292918 ) ) ( not ( = ?auto_292917 ?auto_292919 ) ) ( not ( = ?auto_292917 ?auto_292920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292918 ?auto_292919 ?auto_292920 )
      ( MAKE-4CRATE-VERIFY ?auto_292916 ?auto_292917 ?auto_292918 ?auto_292919 ?auto_292920 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292954 - SURFACE
      ?auto_292955 - SURFACE
      ?auto_292956 - SURFACE
      ?auto_292957 - SURFACE
      ?auto_292958 - SURFACE
    )
    :vars
    (
      ?auto_292961 - HOIST
      ?auto_292963 - PLACE
      ?auto_292962 - TRUCK
      ?auto_292964 - PLACE
      ?auto_292960 - HOIST
      ?auto_292959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292961 ?auto_292963 ) ( SURFACE-AT ?auto_292957 ?auto_292963 ) ( CLEAR ?auto_292957 ) ( IS-CRATE ?auto_292958 ) ( not ( = ?auto_292957 ?auto_292958 ) ) ( AVAILABLE ?auto_292961 ) ( ON ?auto_292957 ?auto_292956 ) ( not ( = ?auto_292956 ?auto_292957 ) ) ( not ( = ?auto_292956 ?auto_292958 ) ) ( TRUCK-AT ?auto_292962 ?auto_292964 ) ( not ( = ?auto_292964 ?auto_292963 ) ) ( HOIST-AT ?auto_292960 ?auto_292964 ) ( not ( = ?auto_292961 ?auto_292960 ) ) ( AVAILABLE ?auto_292960 ) ( SURFACE-AT ?auto_292958 ?auto_292964 ) ( ON ?auto_292958 ?auto_292959 ) ( CLEAR ?auto_292958 ) ( not ( = ?auto_292957 ?auto_292959 ) ) ( not ( = ?auto_292958 ?auto_292959 ) ) ( not ( = ?auto_292956 ?auto_292959 ) ) ( ON ?auto_292955 ?auto_292954 ) ( ON ?auto_292956 ?auto_292955 ) ( not ( = ?auto_292954 ?auto_292955 ) ) ( not ( = ?auto_292954 ?auto_292956 ) ) ( not ( = ?auto_292954 ?auto_292957 ) ) ( not ( = ?auto_292954 ?auto_292958 ) ) ( not ( = ?auto_292954 ?auto_292959 ) ) ( not ( = ?auto_292955 ?auto_292956 ) ) ( not ( = ?auto_292955 ?auto_292957 ) ) ( not ( = ?auto_292955 ?auto_292958 ) ) ( not ( = ?auto_292955 ?auto_292959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292956 ?auto_292957 ?auto_292958 )
      ( MAKE-4CRATE-VERIFY ?auto_292954 ?auto_292955 ?auto_292956 ?auto_292957 ?auto_292958 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292993 - SURFACE
      ?auto_292994 - SURFACE
      ?auto_292995 - SURFACE
      ?auto_292996 - SURFACE
      ?auto_292997 - SURFACE
    )
    :vars
    (
      ?auto_293002 - HOIST
      ?auto_292999 - PLACE
      ?auto_293001 - PLACE
      ?auto_293003 - HOIST
      ?auto_292998 - SURFACE
      ?auto_293000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293002 ?auto_292999 ) ( SURFACE-AT ?auto_292996 ?auto_292999 ) ( CLEAR ?auto_292996 ) ( IS-CRATE ?auto_292997 ) ( not ( = ?auto_292996 ?auto_292997 ) ) ( AVAILABLE ?auto_293002 ) ( ON ?auto_292996 ?auto_292995 ) ( not ( = ?auto_292995 ?auto_292996 ) ) ( not ( = ?auto_292995 ?auto_292997 ) ) ( not ( = ?auto_293001 ?auto_292999 ) ) ( HOIST-AT ?auto_293003 ?auto_293001 ) ( not ( = ?auto_293002 ?auto_293003 ) ) ( AVAILABLE ?auto_293003 ) ( SURFACE-AT ?auto_292997 ?auto_293001 ) ( ON ?auto_292997 ?auto_292998 ) ( CLEAR ?auto_292997 ) ( not ( = ?auto_292996 ?auto_292998 ) ) ( not ( = ?auto_292997 ?auto_292998 ) ) ( not ( = ?auto_292995 ?auto_292998 ) ) ( TRUCK-AT ?auto_293000 ?auto_292999 ) ( ON ?auto_292994 ?auto_292993 ) ( ON ?auto_292995 ?auto_292994 ) ( not ( = ?auto_292993 ?auto_292994 ) ) ( not ( = ?auto_292993 ?auto_292995 ) ) ( not ( = ?auto_292993 ?auto_292996 ) ) ( not ( = ?auto_292993 ?auto_292997 ) ) ( not ( = ?auto_292993 ?auto_292998 ) ) ( not ( = ?auto_292994 ?auto_292995 ) ) ( not ( = ?auto_292994 ?auto_292996 ) ) ( not ( = ?auto_292994 ?auto_292997 ) ) ( not ( = ?auto_292994 ?auto_292998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292995 ?auto_292996 ?auto_292997 )
      ( MAKE-4CRATE-VERIFY ?auto_292993 ?auto_292994 ?auto_292995 ?auto_292996 ?auto_292997 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293032 - SURFACE
      ?auto_293033 - SURFACE
      ?auto_293034 - SURFACE
      ?auto_293035 - SURFACE
      ?auto_293036 - SURFACE
    )
    :vars
    (
      ?auto_293042 - HOIST
      ?auto_293038 - PLACE
      ?auto_293040 - PLACE
      ?auto_293041 - HOIST
      ?auto_293039 - SURFACE
      ?auto_293037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293042 ?auto_293038 ) ( IS-CRATE ?auto_293036 ) ( not ( = ?auto_293035 ?auto_293036 ) ) ( not ( = ?auto_293034 ?auto_293035 ) ) ( not ( = ?auto_293034 ?auto_293036 ) ) ( not ( = ?auto_293040 ?auto_293038 ) ) ( HOIST-AT ?auto_293041 ?auto_293040 ) ( not ( = ?auto_293042 ?auto_293041 ) ) ( AVAILABLE ?auto_293041 ) ( SURFACE-AT ?auto_293036 ?auto_293040 ) ( ON ?auto_293036 ?auto_293039 ) ( CLEAR ?auto_293036 ) ( not ( = ?auto_293035 ?auto_293039 ) ) ( not ( = ?auto_293036 ?auto_293039 ) ) ( not ( = ?auto_293034 ?auto_293039 ) ) ( TRUCK-AT ?auto_293037 ?auto_293038 ) ( SURFACE-AT ?auto_293034 ?auto_293038 ) ( CLEAR ?auto_293034 ) ( LIFTING ?auto_293042 ?auto_293035 ) ( IS-CRATE ?auto_293035 ) ( ON ?auto_293033 ?auto_293032 ) ( ON ?auto_293034 ?auto_293033 ) ( not ( = ?auto_293032 ?auto_293033 ) ) ( not ( = ?auto_293032 ?auto_293034 ) ) ( not ( = ?auto_293032 ?auto_293035 ) ) ( not ( = ?auto_293032 ?auto_293036 ) ) ( not ( = ?auto_293032 ?auto_293039 ) ) ( not ( = ?auto_293033 ?auto_293034 ) ) ( not ( = ?auto_293033 ?auto_293035 ) ) ( not ( = ?auto_293033 ?auto_293036 ) ) ( not ( = ?auto_293033 ?auto_293039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293034 ?auto_293035 ?auto_293036 )
      ( MAKE-4CRATE-VERIFY ?auto_293032 ?auto_293033 ?auto_293034 ?auto_293035 ?auto_293036 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293071 - SURFACE
      ?auto_293072 - SURFACE
      ?auto_293073 - SURFACE
      ?auto_293074 - SURFACE
      ?auto_293075 - SURFACE
    )
    :vars
    (
      ?auto_293081 - HOIST
      ?auto_293077 - PLACE
      ?auto_293080 - PLACE
      ?auto_293078 - HOIST
      ?auto_293076 - SURFACE
      ?auto_293079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293081 ?auto_293077 ) ( IS-CRATE ?auto_293075 ) ( not ( = ?auto_293074 ?auto_293075 ) ) ( not ( = ?auto_293073 ?auto_293074 ) ) ( not ( = ?auto_293073 ?auto_293075 ) ) ( not ( = ?auto_293080 ?auto_293077 ) ) ( HOIST-AT ?auto_293078 ?auto_293080 ) ( not ( = ?auto_293081 ?auto_293078 ) ) ( AVAILABLE ?auto_293078 ) ( SURFACE-AT ?auto_293075 ?auto_293080 ) ( ON ?auto_293075 ?auto_293076 ) ( CLEAR ?auto_293075 ) ( not ( = ?auto_293074 ?auto_293076 ) ) ( not ( = ?auto_293075 ?auto_293076 ) ) ( not ( = ?auto_293073 ?auto_293076 ) ) ( TRUCK-AT ?auto_293079 ?auto_293077 ) ( SURFACE-AT ?auto_293073 ?auto_293077 ) ( CLEAR ?auto_293073 ) ( IS-CRATE ?auto_293074 ) ( AVAILABLE ?auto_293081 ) ( IN ?auto_293074 ?auto_293079 ) ( ON ?auto_293072 ?auto_293071 ) ( ON ?auto_293073 ?auto_293072 ) ( not ( = ?auto_293071 ?auto_293072 ) ) ( not ( = ?auto_293071 ?auto_293073 ) ) ( not ( = ?auto_293071 ?auto_293074 ) ) ( not ( = ?auto_293071 ?auto_293075 ) ) ( not ( = ?auto_293071 ?auto_293076 ) ) ( not ( = ?auto_293072 ?auto_293073 ) ) ( not ( = ?auto_293072 ?auto_293074 ) ) ( not ( = ?auto_293072 ?auto_293075 ) ) ( not ( = ?auto_293072 ?auto_293076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293073 ?auto_293074 ?auto_293075 )
      ( MAKE-4CRATE-VERIFY ?auto_293071 ?auto_293072 ?auto_293073 ?auto_293074 ?auto_293075 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293731 - SURFACE
      ?auto_293732 - SURFACE
      ?auto_293733 - SURFACE
      ?auto_293734 - SURFACE
      ?auto_293735 - SURFACE
      ?auto_293736 - SURFACE
    )
    :vars
    (
      ?auto_293737 - HOIST
      ?auto_293738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293737 ?auto_293738 ) ( SURFACE-AT ?auto_293735 ?auto_293738 ) ( CLEAR ?auto_293735 ) ( LIFTING ?auto_293737 ?auto_293736 ) ( IS-CRATE ?auto_293736 ) ( not ( = ?auto_293735 ?auto_293736 ) ) ( ON ?auto_293732 ?auto_293731 ) ( ON ?auto_293733 ?auto_293732 ) ( ON ?auto_293734 ?auto_293733 ) ( ON ?auto_293735 ?auto_293734 ) ( not ( = ?auto_293731 ?auto_293732 ) ) ( not ( = ?auto_293731 ?auto_293733 ) ) ( not ( = ?auto_293731 ?auto_293734 ) ) ( not ( = ?auto_293731 ?auto_293735 ) ) ( not ( = ?auto_293731 ?auto_293736 ) ) ( not ( = ?auto_293732 ?auto_293733 ) ) ( not ( = ?auto_293732 ?auto_293734 ) ) ( not ( = ?auto_293732 ?auto_293735 ) ) ( not ( = ?auto_293732 ?auto_293736 ) ) ( not ( = ?auto_293733 ?auto_293734 ) ) ( not ( = ?auto_293733 ?auto_293735 ) ) ( not ( = ?auto_293733 ?auto_293736 ) ) ( not ( = ?auto_293734 ?auto_293735 ) ) ( not ( = ?auto_293734 ?auto_293736 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_293735 ?auto_293736 )
      ( MAKE-5CRATE-VERIFY ?auto_293731 ?auto_293732 ?auto_293733 ?auto_293734 ?auto_293735 ?auto_293736 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293765 - SURFACE
      ?auto_293766 - SURFACE
      ?auto_293767 - SURFACE
      ?auto_293768 - SURFACE
      ?auto_293769 - SURFACE
      ?auto_293770 - SURFACE
    )
    :vars
    (
      ?auto_293773 - HOIST
      ?auto_293771 - PLACE
      ?auto_293772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293773 ?auto_293771 ) ( SURFACE-AT ?auto_293769 ?auto_293771 ) ( CLEAR ?auto_293769 ) ( IS-CRATE ?auto_293770 ) ( not ( = ?auto_293769 ?auto_293770 ) ) ( TRUCK-AT ?auto_293772 ?auto_293771 ) ( AVAILABLE ?auto_293773 ) ( IN ?auto_293770 ?auto_293772 ) ( ON ?auto_293769 ?auto_293768 ) ( not ( = ?auto_293768 ?auto_293769 ) ) ( not ( = ?auto_293768 ?auto_293770 ) ) ( ON ?auto_293766 ?auto_293765 ) ( ON ?auto_293767 ?auto_293766 ) ( ON ?auto_293768 ?auto_293767 ) ( not ( = ?auto_293765 ?auto_293766 ) ) ( not ( = ?auto_293765 ?auto_293767 ) ) ( not ( = ?auto_293765 ?auto_293768 ) ) ( not ( = ?auto_293765 ?auto_293769 ) ) ( not ( = ?auto_293765 ?auto_293770 ) ) ( not ( = ?auto_293766 ?auto_293767 ) ) ( not ( = ?auto_293766 ?auto_293768 ) ) ( not ( = ?auto_293766 ?auto_293769 ) ) ( not ( = ?auto_293766 ?auto_293770 ) ) ( not ( = ?auto_293767 ?auto_293768 ) ) ( not ( = ?auto_293767 ?auto_293769 ) ) ( not ( = ?auto_293767 ?auto_293770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293768 ?auto_293769 ?auto_293770 )
      ( MAKE-5CRATE-VERIFY ?auto_293765 ?auto_293766 ?auto_293767 ?auto_293768 ?auto_293769 ?auto_293770 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293805 - SURFACE
      ?auto_293806 - SURFACE
      ?auto_293807 - SURFACE
      ?auto_293808 - SURFACE
      ?auto_293809 - SURFACE
      ?auto_293810 - SURFACE
    )
    :vars
    (
      ?auto_293814 - HOIST
      ?auto_293813 - PLACE
      ?auto_293811 - TRUCK
      ?auto_293812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293814 ?auto_293813 ) ( SURFACE-AT ?auto_293809 ?auto_293813 ) ( CLEAR ?auto_293809 ) ( IS-CRATE ?auto_293810 ) ( not ( = ?auto_293809 ?auto_293810 ) ) ( AVAILABLE ?auto_293814 ) ( IN ?auto_293810 ?auto_293811 ) ( ON ?auto_293809 ?auto_293808 ) ( not ( = ?auto_293808 ?auto_293809 ) ) ( not ( = ?auto_293808 ?auto_293810 ) ) ( TRUCK-AT ?auto_293811 ?auto_293812 ) ( not ( = ?auto_293812 ?auto_293813 ) ) ( ON ?auto_293806 ?auto_293805 ) ( ON ?auto_293807 ?auto_293806 ) ( ON ?auto_293808 ?auto_293807 ) ( not ( = ?auto_293805 ?auto_293806 ) ) ( not ( = ?auto_293805 ?auto_293807 ) ) ( not ( = ?auto_293805 ?auto_293808 ) ) ( not ( = ?auto_293805 ?auto_293809 ) ) ( not ( = ?auto_293805 ?auto_293810 ) ) ( not ( = ?auto_293806 ?auto_293807 ) ) ( not ( = ?auto_293806 ?auto_293808 ) ) ( not ( = ?auto_293806 ?auto_293809 ) ) ( not ( = ?auto_293806 ?auto_293810 ) ) ( not ( = ?auto_293807 ?auto_293808 ) ) ( not ( = ?auto_293807 ?auto_293809 ) ) ( not ( = ?auto_293807 ?auto_293810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293808 ?auto_293809 ?auto_293810 )
      ( MAKE-5CRATE-VERIFY ?auto_293805 ?auto_293806 ?auto_293807 ?auto_293808 ?auto_293809 ?auto_293810 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293850 - SURFACE
      ?auto_293851 - SURFACE
      ?auto_293852 - SURFACE
      ?auto_293853 - SURFACE
      ?auto_293854 - SURFACE
      ?auto_293855 - SURFACE
    )
    :vars
    (
      ?auto_293859 - HOIST
      ?auto_293857 - PLACE
      ?auto_293860 - TRUCK
      ?auto_293856 - PLACE
      ?auto_293858 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_293859 ?auto_293857 ) ( SURFACE-AT ?auto_293854 ?auto_293857 ) ( CLEAR ?auto_293854 ) ( IS-CRATE ?auto_293855 ) ( not ( = ?auto_293854 ?auto_293855 ) ) ( AVAILABLE ?auto_293859 ) ( ON ?auto_293854 ?auto_293853 ) ( not ( = ?auto_293853 ?auto_293854 ) ) ( not ( = ?auto_293853 ?auto_293855 ) ) ( TRUCK-AT ?auto_293860 ?auto_293856 ) ( not ( = ?auto_293856 ?auto_293857 ) ) ( HOIST-AT ?auto_293858 ?auto_293856 ) ( LIFTING ?auto_293858 ?auto_293855 ) ( not ( = ?auto_293859 ?auto_293858 ) ) ( ON ?auto_293851 ?auto_293850 ) ( ON ?auto_293852 ?auto_293851 ) ( ON ?auto_293853 ?auto_293852 ) ( not ( = ?auto_293850 ?auto_293851 ) ) ( not ( = ?auto_293850 ?auto_293852 ) ) ( not ( = ?auto_293850 ?auto_293853 ) ) ( not ( = ?auto_293850 ?auto_293854 ) ) ( not ( = ?auto_293850 ?auto_293855 ) ) ( not ( = ?auto_293851 ?auto_293852 ) ) ( not ( = ?auto_293851 ?auto_293853 ) ) ( not ( = ?auto_293851 ?auto_293854 ) ) ( not ( = ?auto_293851 ?auto_293855 ) ) ( not ( = ?auto_293852 ?auto_293853 ) ) ( not ( = ?auto_293852 ?auto_293854 ) ) ( not ( = ?auto_293852 ?auto_293855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293853 ?auto_293854 ?auto_293855 )
      ( MAKE-5CRATE-VERIFY ?auto_293850 ?auto_293851 ?auto_293852 ?auto_293853 ?auto_293854 ?auto_293855 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293900 - SURFACE
      ?auto_293901 - SURFACE
      ?auto_293902 - SURFACE
      ?auto_293903 - SURFACE
      ?auto_293904 - SURFACE
      ?auto_293905 - SURFACE
    )
    :vars
    (
      ?auto_293906 - HOIST
      ?auto_293908 - PLACE
      ?auto_293907 - TRUCK
      ?auto_293909 - PLACE
      ?auto_293910 - HOIST
      ?auto_293911 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293906 ?auto_293908 ) ( SURFACE-AT ?auto_293904 ?auto_293908 ) ( CLEAR ?auto_293904 ) ( IS-CRATE ?auto_293905 ) ( not ( = ?auto_293904 ?auto_293905 ) ) ( AVAILABLE ?auto_293906 ) ( ON ?auto_293904 ?auto_293903 ) ( not ( = ?auto_293903 ?auto_293904 ) ) ( not ( = ?auto_293903 ?auto_293905 ) ) ( TRUCK-AT ?auto_293907 ?auto_293909 ) ( not ( = ?auto_293909 ?auto_293908 ) ) ( HOIST-AT ?auto_293910 ?auto_293909 ) ( not ( = ?auto_293906 ?auto_293910 ) ) ( AVAILABLE ?auto_293910 ) ( SURFACE-AT ?auto_293905 ?auto_293909 ) ( ON ?auto_293905 ?auto_293911 ) ( CLEAR ?auto_293905 ) ( not ( = ?auto_293904 ?auto_293911 ) ) ( not ( = ?auto_293905 ?auto_293911 ) ) ( not ( = ?auto_293903 ?auto_293911 ) ) ( ON ?auto_293901 ?auto_293900 ) ( ON ?auto_293902 ?auto_293901 ) ( ON ?auto_293903 ?auto_293902 ) ( not ( = ?auto_293900 ?auto_293901 ) ) ( not ( = ?auto_293900 ?auto_293902 ) ) ( not ( = ?auto_293900 ?auto_293903 ) ) ( not ( = ?auto_293900 ?auto_293904 ) ) ( not ( = ?auto_293900 ?auto_293905 ) ) ( not ( = ?auto_293900 ?auto_293911 ) ) ( not ( = ?auto_293901 ?auto_293902 ) ) ( not ( = ?auto_293901 ?auto_293903 ) ) ( not ( = ?auto_293901 ?auto_293904 ) ) ( not ( = ?auto_293901 ?auto_293905 ) ) ( not ( = ?auto_293901 ?auto_293911 ) ) ( not ( = ?auto_293902 ?auto_293903 ) ) ( not ( = ?auto_293902 ?auto_293904 ) ) ( not ( = ?auto_293902 ?auto_293905 ) ) ( not ( = ?auto_293902 ?auto_293911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293903 ?auto_293904 ?auto_293905 )
      ( MAKE-5CRATE-VERIFY ?auto_293900 ?auto_293901 ?auto_293902 ?auto_293903 ?auto_293904 ?auto_293905 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293951 - SURFACE
      ?auto_293952 - SURFACE
      ?auto_293953 - SURFACE
      ?auto_293954 - SURFACE
      ?auto_293955 - SURFACE
      ?auto_293956 - SURFACE
    )
    :vars
    (
      ?auto_293962 - HOIST
      ?auto_293961 - PLACE
      ?auto_293960 - PLACE
      ?auto_293958 - HOIST
      ?auto_293957 - SURFACE
      ?auto_293959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293962 ?auto_293961 ) ( SURFACE-AT ?auto_293955 ?auto_293961 ) ( CLEAR ?auto_293955 ) ( IS-CRATE ?auto_293956 ) ( not ( = ?auto_293955 ?auto_293956 ) ) ( AVAILABLE ?auto_293962 ) ( ON ?auto_293955 ?auto_293954 ) ( not ( = ?auto_293954 ?auto_293955 ) ) ( not ( = ?auto_293954 ?auto_293956 ) ) ( not ( = ?auto_293960 ?auto_293961 ) ) ( HOIST-AT ?auto_293958 ?auto_293960 ) ( not ( = ?auto_293962 ?auto_293958 ) ) ( AVAILABLE ?auto_293958 ) ( SURFACE-AT ?auto_293956 ?auto_293960 ) ( ON ?auto_293956 ?auto_293957 ) ( CLEAR ?auto_293956 ) ( not ( = ?auto_293955 ?auto_293957 ) ) ( not ( = ?auto_293956 ?auto_293957 ) ) ( not ( = ?auto_293954 ?auto_293957 ) ) ( TRUCK-AT ?auto_293959 ?auto_293961 ) ( ON ?auto_293952 ?auto_293951 ) ( ON ?auto_293953 ?auto_293952 ) ( ON ?auto_293954 ?auto_293953 ) ( not ( = ?auto_293951 ?auto_293952 ) ) ( not ( = ?auto_293951 ?auto_293953 ) ) ( not ( = ?auto_293951 ?auto_293954 ) ) ( not ( = ?auto_293951 ?auto_293955 ) ) ( not ( = ?auto_293951 ?auto_293956 ) ) ( not ( = ?auto_293951 ?auto_293957 ) ) ( not ( = ?auto_293952 ?auto_293953 ) ) ( not ( = ?auto_293952 ?auto_293954 ) ) ( not ( = ?auto_293952 ?auto_293955 ) ) ( not ( = ?auto_293952 ?auto_293956 ) ) ( not ( = ?auto_293952 ?auto_293957 ) ) ( not ( = ?auto_293953 ?auto_293954 ) ) ( not ( = ?auto_293953 ?auto_293955 ) ) ( not ( = ?auto_293953 ?auto_293956 ) ) ( not ( = ?auto_293953 ?auto_293957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293954 ?auto_293955 ?auto_293956 )
      ( MAKE-5CRATE-VERIFY ?auto_293951 ?auto_293952 ?auto_293953 ?auto_293954 ?auto_293955 ?auto_293956 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294002 - SURFACE
      ?auto_294003 - SURFACE
      ?auto_294004 - SURFACE
      ?auto_294005 - SURFACE
      ?auto_294006 - SURFACE
      ?auto_294007 - SURFACE
    )
    :vars
    (
      ?auto_294012 - HOIST
      ?auto_294010 - PLACE
      ?auto_294009 - PLACE
      ?auto_294008 - HOIST
      ?auto_294013 - SURFACE
      ?auto_294011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294012 ?auto_294010 ) ( IS-CRATE ?auto_294007 ) ( not ( = ?auto_294006 ?auto_294007 ) ) ( not ( = ?auto_294005 ?auto_294006 ) ) ( not ( = ?auto_294005 ?auto_294007 ) ) ( not ( = ?auto_294009 ?auto_294010 ) ) ( HOIST-AT ?auto_294008 ?auto_294009 ) ( not ( = ?auto_294012 ?auto_294008 ) ) ( AVAILABLE ?auto_294008 ) ( SURFACE-AT ?auto_294007 ?auto_294009 ) ( ON ?auto_294007 ?auto_294013 ) ( CLEAR ?auto_294007 ) ( not ( = ?auto_294006 ?auto_294013 ) ) ( not ( = ?auto_294007 ?auto_294013 ) ) ( not ( = ?auto_294005 ?auto_294013 ) ) ( TRUCK-AT ?auto_294011 ?auto_294010 ) ( SURFACE-AT ?auto_294005 ?auto_294010 ) ( CLEAR ?auto_294005 ) ( LIFTING ?auto_294012 ?auto_294006 ) ( IS-CRATE ?auto_294006 ) ( ON ?auto_294003 ?auto_294002 ) ( ON ?auto_294004 ?auto_294003 ) ( ON ?auto_294005 ?auto_294004 ) ( not ( = ?auto_294002 ?auto_294003 ) ) ( not ( = ?auto_294002 ?auto_294004 ) ) ( not ( = ?auto_294002 ?auto_294005 ) ) ( not ( = ?auto_294002 ?auto_294006 ) ) ( not ( = ?auto_294002 ?auto_294007 ) ) ( not ( = ?auto_294002 ?auto_294013 ) ) ( not ( = ?auto_294003 ?auto_294004 ) ) ( not ( = ?auto_294003 ?auto_294005 ) ) ( not ( = ?auto_294003 ?auto_294006 ) ) ( not ( = ?auto_294003 ?auto_294007 ) ) ( not ( = ?auto_294003 ?auto_294013 ) ) ( not ( = ?auto_294004 ?auto_294005 ) ) ( not ( = ?auto_294004 ?auto_294006 ) ) ( not ( = ?auto_294004 ?auto_294007 ) ) ( not ( = ?auto_294004 ?auto_294013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294005 ?auto_294006 ?auto_294007 )
      ( MAKE-5CRATE-VERIFY ?auto_294002 ?auto_294003 ?auto_294004 ?auto_294005 ?auto_294006 ?auto_294007 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294053 - SURFACE
      ?auto_294054 - SURFACE
      ?auto_294055 - SURFACE
      ?auto_294056 - SURFACE
      ?auto_294057 - SURFACE
      ?auto_294058 - SURFACE
    )
    :vars
    (
      ?auto_294059 - HOIST
      ?auto_294060 - PLACE
      ?auto_294062 - PLACE
      ?auto_294063 - HOIST
      ?auto_294064 - SURFACE
      ?auto_294061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294059 ?auto_294060 ) ( IS-CRATE ?auto_294058 ) ( not ( = ?auto_294057 ?auto_294058 ) ) ( not ( = ?auto_294056 ?auto_294057 ) ) ( not ( = ?auto_294056 ?auto_294058 ) ) ( not ( = ?auto_294062 ?auto_294060 ) ) ( HOIST-AT ?auto_294063 ?auto_294062 ) ( not ( = ?auto_294059 ?auto_294063 ) ) ( AVAILABLE ?auto_294063 ) ( SURFACE-AT ?auto_294058 ?auto_294062 ) ( ON ?auto_294058 ?auto_294064 ) ( CLEAR ?auto_294058 ) ( not ( = ?auto_294057 ?auto_294064 ) ) ( not ( = ?auto_294058 ?auto_294064 ) ) ( not ( = ?auto_294056 ?auto_294064 ) ) ( TRUCK-AT ?auto_294061 ?auto_294060 ) ( SURFACE-AT ?auto_294056 ?auto_294060 ) ( CLEAR ?auto_294056 ) ( IS-CRATE ?auto_294057 ) ( AVAILABLE ?auto_294059 ) ( IN ?auto_294057 ?auto_294061 ) ( ON ?auto_294054 ?auto_294053 ) ( ON ?auto_294055 ?auto_294054 ) ( ON ?auto_294056 ?auto_294055 ) ( not ( = ?auto_294053 ?auto_294054 ) ) ( not ( = ?auto_294053 ?auto_294055 ) ) ( not ( = ?auto_294053 ?auto_294056 ) ) ( not ( = ?auto_294053 ?auto_294057 ) ) ( not ( = ?auto_294053 ?auto_294058 ) ) ( not ( = ?auto_294053 ?auto_294064 ) ) ( not ( = ?auto_294054 ?auto_294055 ) ) ( not ( = ?auto_294054 ?auto_294056 ) ) ( not ( = ?auto_294054 ?auto_294057 ) ) ( not ( = ?auto_294054 ?auto_294058 ) ) ( not ( = ?auto_294054 ?auto_294064 ) ) ( not ( = ?auto_294055 ?auto_294056 ) ) ( not ( = ?auto_294055 ?auto_294057 ) ) ( not ( = ?auto_294055 ?auto_294058 ) ) ( not ( = ?auto_294055 ?auto_294064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294056 ?auto_294057 ?auto_294058 )
      ( MAKE-5CRATE-VERIFY ?auto_294053 ?auto_294054 ?auto_294055 ?auto_294056 ?auto_294057 ?auto_294058 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295262 - SURFACE
      ?auto_295263 - SURFACE
      ?auto_295264 - SURFACE
      ?auto_295265 - SURFACE
      ?auto_295266 - SURFACE
      ?auto_295267 - SURFACE
      ?auto_295268 - SURFACE
    )
    :vars
    (
      ?auto_295270 - HOIST
      ?auto_295269 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295270 ?auto_295269 ) ( SURFACE-AT ?auto_295267 ?auto_295269 ) ( CLEAR ?auto_295267 ) ( LIFTING ?auto_295270 ?auto_295268 ) ( IS-CRATE ?auto_295268 ) ( not ( = ?auto_295267 ?auto_295268 ) ) ( ON ?auto_295263 ?auto_295262 ) ( ON ?auto_295264 ?auto_295263 ) ( ON ?auto_295265 ?auto_295264 ) ( ON ?auto_295266 ?auto_295265 ) ( ON ?auto_295267 ?auto_295266 ) ( not ( = ?auto_295262 ?auto_295263 ) ) ( not ( = ?auto_295262 ?auto_295264 ) ) ( not ( = ?auto_295262 ?auto_295265 ) ) ( not ( = ?auto_295262 ?auto_295266 ) ) ( not ( = ?auto_295262 ?auto_295267 ) ) ( not ( = ?auto_295262 ?auto_295268 ) ) ( not ( = ?auto_295263 ?auto_295264 ) ) ( not ( = ?auto_295263 ?auto_295265 ) ) ( not ( = ?auto_295263 ?auto_295266 ) ) ( not ( = ?auto_295263 ?auto_295267 ) ) ( not ( = ?auto_295263 ?auto_295268 ) ) ( not ( = ?auto_295264 ?auto_295265 ) ) ( not ( = ?auto_295264 ?auto_295266 ) ) ( not ( = ?auto_295264 ?auto_295267 ) ) ( not ( = ?auto_295264 ?auto_295268 ) ) ( not ( = ?auto_295265 ?auto_295266 ) ) ( not ( = ?auto_295265 ?auto_295267 ) ) ( not ( = ?auto_295265 ?auto_295268 ) ) ( not ( = ?auto_295266 ?auto_295267 ) ) ( not ( = ?auto_295266 ?auto_295268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_295267 ?auto_295268 )
      ( MAKE-6CRATE-VERIFY ?auto_295262 ?auto_295263 ?auto_295264 ?auto_295265 ?auto_295266 ?auto_295267 ?auto_295268 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295306 - SURFACE
      ?auto_295307 - SURFACE
      ?auto_295308 - SURFACE
      ?auto_295309 - SURFACE
      ?auto_295310 - SURFACE
      ?auto_295311 - SURFACE
      ?auto_295312 - SURFACE
    )
    :vars
    (
      ?auto_295313 - HOIST
      ?auto_295314 - PLACE
      ?auto_295315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295313 ?auto_295314 ) ( SURFACE-AT ?auto_295311 ?auto_295314 ) ( CLEAR ?auto_295311 ) ( IS-CRATE ?auto_295312 ) ( not ( = ?auto_295311 ?auto_295312 ) ) ( TRUCK-AT ?auto_295315 ?auto_295314 ) ( AVAILABLE ?auto_295313 ) ( IN ?auto_295312 ?auto_295315 ) ( ON ?auto_295311 ?auto_295310 ) ( not ( = ?auto_295310 ?auto_295311 ) ) ( not ( = ?auto_295310 ?auto_295312 ) ) ( ON ?auto_295307 ?auto_295306 ) ( ON ?auto_295308 ?auto_295307 ) ( ON ?auto_295309 ?auto_295308 ) ( ON ?auto_295310 ?auto_295309 ) ( not ( = ?auto_295306 ?auto_295307 ) ) ( not ( = ?auto_295306 ?auto_295308 ) ) ( not ( = ?auto_295306 ?auto_295309 ) ) ( not ( = ?auto_295306 ?auto_295310 ) ) ( not ( = ?auto_295306 ?auto_295311 ) ) ( not ( = ?auto_295306 ?auto_295312 ) ) ( not ( = ?auto_295307 ?auto_295308 ) ) ( not ( = ?auto_295307 ?auto_295309 ) ) ( not ( = ?auto_295307 ?auto_295310 ) ) ( not ( = ?auto_295307 ?auto_295311 ) ) ( not ( = ?auto_295307 ?auto_295312 ) ) ( not ( = ?auto_295308 ?auto_295309 ) ) ( not ( = ?auto_295308 ?auto_295310 ) ) ( not ( = ?auto_295308 ?auto_295311 ) ) ( not ( = ?auto_295308 ?auto_295312 ) ) ( not ( = ?auto_295309 ?auto_295310 ) ) ( not ( = ?auto_295309 ?auto_295311 ) ) ( not ( = ?auto_295309 ?auto_295312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295310 ?auto_295311 ?auto_295312 )
      ( MAKE-6CRATE-VERIFY ?auto_295306 ?auto_295307 ?auto_295308 ?auto_295309 ?auto_295310 ?auto_295311 ?auto_295312 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295357 - SURFACE
      ?auto_295358 - SURFACE
      ?auto_295359 - SURFACE
      ?auto_295360 - SURFACE
      ?auto_295361 - SURFACE
      ?auto_295362 - SURFACE
      ?auto_295363 - SURFACE
    )
    :vars
    (
      ?auto_295366 - HOIST
      ?auto_295365 - PLACE
      ?auto_295364 - TRUCK
      ?auto_295367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295366 ?auto_295365 ) ( SURFACE-AT ?auto_295362 ?auto_295365 ) ( CLEAR ?auto_295362 ) ( IS-CRATE ?auto_295363 ) ( not ( = ?auto_295362 ?auto_295363 ) ) ( AVAILABLE ?auto_295366 ) ( IN ?auto_295363 ?auto_295364 ) ( ON ?auto_295362 ?auto_295361 ) ( not ( = ?auto_295361 ?auto_295362 ) ) ( not ( = ?auto_295361 ?auto_295363 ) ) ( TRUCK-AT ?auto_295364 ?auto_295367 ) ( not ( = ?auto_295367 ?auto_295365 ) ) ( ON ?auto_295358 ?auto_295357 ) ( ON ?auto_295359 ?auto_295358 ) ( ON ?auto_295360 ?auto_295359 ) ( ON ?auto_295361 ?auto_295360 ) ( not ( = ?auto_295357 ?auto_295358 ) ) ( not ( = ?auto_295357 ?auto_295359 ) ) ( not ( = ?auto_295357 ?auto_295360 ) ) ( not ( = ?auto_295357 ?auto_295361 ) ) ( not ( = ?auto_295357 ?auto_295362 ) ) ( not ( = ?auto_295357 ?auto_295363 ) ) ( not ( = ?auto_295358 ?auto_295359 ) ) ( not ( = ?auto_295358 ?auto_295360 ) ) ( not ( = ?auto_295358 ?auto_295361 ) ) ( not ( = ?auto_295358 ?auto_295362 ) ) ( not ( = ?auto_295358 ?auto_295363 ) ) ( not ( = ?auto_295359 ?auto_295360 ) ) ( not ( = ?auto_295359 ?auto_295361 ) ) ( not ( = ?auto_295359 ?auto_295362 ) ) ( not ( = ?auto_295359 ?auto_295363 ) ) ( not ( = ?auto_295360 ?auto_295361 ) ) ( not ( = ?auto_295360 ?auto_295362 ) ) ( not ( = ?auto_295360 ?auto_295363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295361 ?auto_295362 ?auto_295363 )
      ( MAKE-6CRATE-VERIFY ?auto_295357 ?auto_295358 ?auto_295359 ?auto_295360 ?auto_295361 ?auto_295362 ?auto_295363 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295414 - SURFACE
      ?auto_295415 - SURFACE
      ?auto_295416 - SURFACE
      ?auto_295417 - SURFACE
      ?auto_295418 - SURFACE
      ?auto_295419 - SURFACE
      ?auto_295420 - SURFACE
    )
    :vars
    (
      ?auto_295425 - HOIST
      ?auto_295423 - PLACE
      ?auto_295424 - TRUCK
      ?auto_295422 - PLACE
      ?auto_295421 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_295425 ?auto_295423 ) ( SURFACE-AT ?auto_295419 ?auto_295423 ) ( CLEAR ?auto_295419 ) ( IS-CRATE ?auto_295420 ) ( not ( = ?auto_295419 ?auto_295420 ) ) ( AVAILABLE ?auto_295425 ) ( ON ?auto_295419 ?auto_295418 ) ( not ( = ?auto_295418 ?auto_295419 ) ) ( not ( = ?auto_295418 ?auto_295420 ) ) ( TRUCK-AT ?auto_295424 ?auto_295422 ) ( not ( = ?auto_295422 ?auto_295423 ) ) ( HOIST-AT ?auto_295421 ?auto_295422 ) ( LIFTING ?auto_295421 ?auto_295420 ) ( not ( = ?auto_295425 ?auto_295421 ) ) ( ON ?auto_295415 ?auto_295414 ) ( ON ?auto_295416 ?auto_295415 ) ( ON ?auto_295417 ?auto_295416 ) ( ON ?auto_295418 ?auto_295417 ) ( not ( = ?auto_295414 ?auto_295415 ) ) ( not ( = ?auto_295414 ?auto_295416 ) ) ( not ( = ?auto_295414 ?auto_295417 ) ) ( not ( = ?auto_295414 ?auto_295418 ) ) ( not ( = ?auto_295414 ?auto_295419 ) ) ( not ( = ?auto_295414 ?auto_295420 ) ) ( not ( = ?auto_295415 ?auto_295416 ) ) ( not ( = ?auto_295415 ?auto_295417 ) ) ( not ( = ?auto_295415 ?auto_295418 ) ) ( not ( = ?auto_295415 ?auto_295419 ) ) ( not ( = ?auto_295415 ?auto_295420 ) ) ( not ( = ?auto_295416 ?auto_295417 ) ) ( not ( = ?auto_295416 ?auto_295418 ) ) ( not ( = ?auto_295416 ?auto_295419 ) ) ( not ( = ?auto_295416 ?auto_295420 ) ) ( not ( = ?auto_295417 ?auto_295418 ) ) ( not ( = ?auto_295417 ?auto_295419 ) ) ( not ( = ?auto_295417 ?auto_295420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295418 ?auto_295419 ?auto_295420 )
      ( MAKE-6CRATE-VERIFY ?auto_295414 ?auto_295415 ?auto_295416 ?auto_295417 ?auto_295418 ?auto_295419 ?auto_295420 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295477 - SURFACE
      ?auto_295478 - SURFACE
      ?auto_295479 - SURFACE
      ?auto_295480 - SURFACE
      ?auto_295481 - SURFACE
      ?auto_295482 - SURFACE
      ?auto_295483 - SURFACE
    )
    :vars
    (
      ?auto_295488 - HOIST
      ?auto_295487 - PLACE
      ?auto_295485 - TRUCK
      ?auto_295486 - PLACE
      ?auto_295489 - HOIST
      ?auto_295484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295488 ?auto_295487 ) ( SURFACE-AT ?auto_295482 ?auto_295487 ) ( CLEAR ?auto_295482 ) ( IS-CRATE ?auto_295483 ) ( not ( = ?auto_295482 ?auto_295483 ) ) ( AVAILABLE ?auto_295488 ) ( ON ?auto_295482 ?auto_295481 ) ( not ( = ?auto_295481 ?auto_295482 ) ) ( not ( = ?auto_295481 ?auto_295483 ) ) ( TRUCK-AT ?auto_295485 ?auto_295486 ) ( not ( = ?auto_295486 ?auto_295487 ) ) ( HOIST-AT ?auto_295489 ?auto_295486 ) ( not ( = ?auto_295488 ?auto_295489 ) ) ( AVAILABLE ?auto_295489 ) ( SURFACE-AT ?auto_295483 ?auto_295486 ) ( ON ?auto_295483 ?auto_295484 ) ( CLEAR ?auto_295483 ) ( not ( = ?auto_295482 ?auto_295484 ) ) ( not ( = ?auto_295483 ?auto_295484 ) ) ( not ( = ?auto_295481 ?auto_295484 ) ) ( ON ?auto_295478 ?auto_295477 ) ( ON ?auto_295479 ?auto_295478 ) ( ON ?auto_295480 ?auto_295479 ) ( ON ?auto_295481 ?auto_295480 ) ( not ( = ?auto_295477 ?auto_295478 ) ) ( not ( = ?auto_295477 ?auto_295479 ) ) ( not ( = ?auto_295477 ?auto_295480 ) ) ( not ( = ?auto_295477 ?auto_295481 ) ) ( not ( = ?auto_295477 ?auto_295482 ) ) ( not ( = ?auto_295477 ?auto_295483 ) ) ( not ( = ?auto_295477 ?auto_295484 ) ) ( not ( = ?auto_295478 ?auto_295479 ) ) ( not ( = ?auto_295478 ?auto_295480 ) ) ( not ( = ?auto_295478 ?auto_295481 ) ) ( not ( = ?auto_295478 ?auto_295482 ) ) ( not ( = ?auto_295478 ?auto_295483 ) ) ( not ( = ?auto_295478 ?auto_295484 ) ) ( not ( = ?auto_295479 ?auto_295480 ) ) ( not ( = ?auto_295479 ?auto_295481 ) ) ( not ( = ?auto_295479 ?auto_295482 ) ) ( not ( = ?auto_295479 ?auto_295483 ) ) ( not ( = ?auto_295479 ?auto_295484 ) ) ( not ( = ?auto_295480 ?auto_295481 ) ) ( not ( = ?auto_295480 ?auto_295482 ) ) ( not ( = ?auto_295480 ?auto_295483 ) ) ( not ( = ?auto_295480 ?auto_295484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295481 ?auto_295482 ?auto_295483 )
      ( MAKE-6CRATE-VERIFY ?auto_295477 ?auto_295478 ?auto_295479 ?auto_295480 ?auto_295481 ?auto_295482 ?auto_295483 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295541 - SURFACE
      ?auto_295542 - SURFACE
      ?auto_295543 - SURFACE
      ?auto_295544 - SURFACE
      ?auto_295545 - SURFACE
      ?auto_295546 - SURFACE
      ?auto_295547 - SURFACE
    )
    :vars
    (
      ?auto_295549 - HOIST
      ?auto_295553 - PLACE
      ?auto_295551 - PLACE
      ?auto_295552 - HOIST
      ?auto_295548 - SURFACE
      ?auto_295550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295549 ?auto_295553 ) ( SURFACE-AT ?auto_295546 ?auto_295553 ) ( CLEAR ?auto_295546 ) ( IS-CRATE ?auto_295547 ) ( not ( = ?auto_295546 ?auto_295547 ) ) ( AVAILABLE ?auto_295549 ) ( ON ?auto_295546 ?auto_295545 ) ( not ( = ?auto_295545 ?auto_295546 ) ) ( not ( = ?auto_295545 ?auto_295547 ) ) ( not ( = ?auto_295551 ?auto_295553 ) ) ( HOIST-AT ?auto_295552 ?auto_295551 ) ( not ( = ?auto_295549 ?auto_295552 ) ) ( AVAILABLE ?auto_295552 ) ( SURFACE-AT ?auto_295547 ?auto_295551 ) ( ON ?auto_295547 ?auto_295548 ) ( CLEAR ?auto_295547 ) ( not ( = ?auto_295546 ?auto_295548 ) ) ( not ( = ?auto_295547 ?auto_295548 ) ) ( not ( = ?auto_295545 ?auto_295548 ) ) ( TRUCK-AT ?auto_295550 ?auto_295553 ) ( ON ?auto_295542 ?auto_295541 ) ( ON ?auto_295543 ?auto_295542 ) ( ON ?auto_295544 ?auto_295543 ) ( ON ?auto_295545 ?auto_295544 ) ( not ( = ?auto_295541 ?auto_295542 ) ) ( not ( = ?auto_295541 ?auto_295543 ) ) ( not ( = ?auto_295541 ?auto_295544 ) ) ( not ( = ?auto_295541 ?auto_295545 ) ) ( not ( = ?auto_295541 ?auto_295546 ) ) ( not ( = ?auto_295541 ?auto_295547 ) ) ( not ( = ?auto_295541 ?auto_295548 ) ) ( not ( = ?auto_295542 ?auto_295543 ) ) ( not ( = ?auto_295542 ?auto_295544 ) ) ( not ( = ?auto_295542 ?auto_295545 ) ) ( not ( = ?auto_295542 ?auto_295546 ) ) ( not ( = ?auto_295542 ?auto_295547 ) ) ( not ( = ?auto_295542 ?auto_295548 ) ) ( not ( = ?auto_295543 ?auto_295544 ) ) ( not ( = ?auto_295543 ?auto_295545 ) ) ( not ( = ?auto_295543 ?auto_295546 ) ) ( not ( = ?auto_295543 ?auto_295547 ) ) ( not ( = ?auto_295543 ?auto_295548 ) ) ( not ( = ?auto_295544 ?auto_295545 ) ) ( not ( = ?auto_295544 ?auto_295546 ) ) ( not ( = ?auto_295544 ?auto_295547 ) ) ( not ( = ?auto_295544 ?auto_295548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295545 ?auto_295546 ?auto_295547 )
      ( MAKE-6CRATE-VERIFY ?auto_295541 ?auto_295542 ?auto_295543 ?auto_295544 ?auto_295545 ?auto_295546 ?auto_295547 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295605 - SURFACE
      ?auto_295606 - SURFACE
      ?auto_295607 - SURFACE
      ?auto_295608 - SURFACE
      ?auto_295609 - SURFACE
      ?auto_295610 - SURFACE
      ?auto_295611 - SURFACE
    )
    :vars
    (
      ?auto_295614 - HOIST
      ?auto_295616 - PLACE
      ?auto_295612 - PLACE
      ?auto_295615 - HOIST
      ?auto_295617 - SURFACE
      ?auto_295613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295614 ?auto_295616 ) ( IS-CRATE ?auto_295611 ) ( not ( = ?auto_295610 ?auto_295611 ) ) ( not ( = ?auto_295609 ?auto_295610 ) ) ( not ( = ?auto_295609 ?auto_295611 ) ) ( not ( = ?auto_295612 ?auto_295616 ) ) ( HOIST-AT ?auto_295615 ?auto_295612 ) ( not ( = ?auto_295614 ?auto_295615 ) ) ( AVAILABLE ?auto_295615 ) ( SURFACE-AT ?auto_295611 ?auto_295612 ) ( ON ?auto_295611 ?auto_295617 ) ( CLEAR ?auto_295611 ) ( not ( = ?auto_295610 ?auto_295617 ) ) ( not ( = ?auto_295611 ?auto_295617 ) ) ( not ( = ?auto_295609 ?auto_295617 ) ) ( TRUCK-AT ?auto_295613 ?auto_295616 ) ( SURFACE-AT ?auto_295609 ?auto_295616 ) ( CLEAR ?auto_295609 ) ( LIFTING ?auto_295614 ?auto_295610 ) ( IS-CRATE ?auto_295610 ) ( ON ?auto_295606 ?auto_295605 ) ( ON ?auto_295607 ?auto_295606 ) ( ON ?auto_295608 ?auto_295607 ) ( ON ?auto_295609 ?auto_295608 ) ( not ( = ?auto_295605 ?auto_295606 ) ) ( not ( = ?auto_295605 ?auto_295607 ) ) ( not ( = ?auto_295605 ?auto_295608 ) ) ( not ( = ?auto_295605 ?auto_295609 ) ) ( not ( = ?auto_295605 ?auto_295610 ) ) ( not ( = ?auto_295605 ?auto_295611 ) ) ( not ( = ?auto_295605 ?auto_295617 ) ) ( not ( = ?auto_295606 ?auto_295607 ) ) ( not ( = ?auto_295606 ?auto_295608 ) ) ( not ( = ?auto_295606 ?auto_295609 ) ) ( not ( = ?auto_295606 ?auto_295610 ) ) ( not ( = ?auto_295606 ?auto_295611 ) ) ( not ( = ?auto_295606 ?auto_295617 ) ) ( not ( = ?auto_295607 ?auto_295608 ) ) ( not ( = ?auto_295607 ?auto_295609 ) ) ( not ( = ?auto_295607 ?auto_295610 ) ) ( not ( = ?auto_295607 ?auto_295611 ) ) ( not ( = ?auto_295607 ?auto_295617 ) ) ( not ( = ?auto_295608 ?auto_295609 ) ) ( not ( = ?auto_295608 ?auto_295610 ) ) ( not ( = ?auto_295608 ?auto_295611 ) ) ( not ( = ?auto_295608 ?auto_295617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295609 ?auto_295610 ?auto_295611 )
      ( MAKE-6CRATE-VERIFY ?auto_295605 ?auto_295606 ?auto_295607 ?auto_295608 ?auto_295609 ?auto_295610 ?auto_295611 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295669 - SURFACE
      ?auto_295670 - SURFACE
      ?auto_295671 - SURFACE
      ?auto_295672 - SURFACE
      ?auto_295673 - SURFACE
      ?auto_295674 - SURFACE
      ?auto_295675 - SURFACE
    )
    :vars
    (
      ?auto_295678 - HOIST
      ?auto_295680 - PLACE
      ?auto_295681 - PLACE
      ?auto_295676 - HOIST
      ?auto_295677 - SURFACE
      ?auto_295679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295678 ?auto_295680 ) ( IS-CRATE ?auto_295675 ) ( not ( = ?auto_295674 ?auto_295675 ) ) ( not ( = ?auto_295673 ?auto_295674 ) ) ( not ( = ?auto_295673 ?auto_295675 ) ) ( not ( = ?auto_295681 ?auto_295680 ) ) ( HOIST-AT ?auto_295676 ?auto_295681 ) ( not ( = ?auto_295678 ?auto_295676 ) ) ( AVAILABLE ?auto_295676 ) ( SURFACE-AT ?auto_295675 ?auto_295681 ) ( ON ?auto_295675 ?auto_295677 ) ( CLEAR ?auto_295675 ) ( not ( = ?auto_295674 ?auto_295677 ) ) ( not ( = ?auto_295675 ?auto_295677 ) ) ( not ( = ?auto_295673 ?auto_295677 ) ) ( TRUCK-AT ?auto_295679 ?auto_295680 ) ( SURFACE-AT ?auto_295673 ?auto_295680 ) ( CLEAR ?auto_295673 ) ( IS-CRATE ?auto_295674 ) ( AVAILABLE ?auto_295678 ) ( IN ?auto_295674 ?auto_295679 ) ( ON ?auto_295670 ?auto_295669 ) ( ON ?auto_295671 ?auto_295670 ) ( ON ?auto_295672 ?auto_295671 ) ( ON ?auto_295673 ?auto_295672 ) ( not ( = ?auto_295669 ?auto_295670 ) ) ( not ( = ?auto_295669 ?auto_295671 ) ) ( not ( = ?auto_295669 ?auto_295672 ) ) ( not ( = ?auto_295669 ?auto_295673 ) ) ( not ( = ?auto_295669 ?auto_295674 ) ) ( not ( = ?auto_295669 ?auto_295675 ) ) ( not ( = ?auto_295669 ?auto_295677 ) ) ( not ( = ?auto_295670 ?auto_295671 ) ) ( not ( = ?auto_295670 ?auto_295672 ) ) ( not ( = ?auto_295670 ?auto_295673 ) ) ( not ( = ?auto_295670 ?auto_295674 ) ) ( not ( = ?auto_295670 ?auto_295675 ) ) ( not ( = ?auto_295670 ?auto_295677 ) ) ( not ( = ?auto_295671 ?auto_295672 ) ) ( not ( = ?auto_295671 ?auto_295673 ) ) ( not ( = ?auto_295671 ?auto_295674 ) ) ( not ( = ?auto_295671 ?auto_295675 ) ) ( not ( = ?auto_295671 ?auto_295677 ) ) ( not ( = ?auto_295672 ?auto_295673 ) ) ( not ( = ?auto_295672 ?auto_295674 ) ) ( not ( = ?auto_295672 ?auto_295675 ) ) ( not ( = ?auto_295672 ?auto_295677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295673 ?auto_295674 ?auto_295675 )
      ( MAKE-6CRATE-VERIFY ?auto_295669 ?auto_295670 ?auto_295671 ?auto_295672 ?auto_295673 ?auto_295674 ?auto_295675 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297625 - SURFACE
      ?auto_297626 - SURFACE
      ?auto_297627 - SURFACE
      ?auto_297628 - SURFACE
      ?auto_297629 - SURFACE
      ?auto_297630 - SURFACE
      ?auto_297631 - SURFACE
      ?auto_297632 - SURFACE
    )
    :vars
    (
      ?auto_297633 - HOIST
      ?auto_297634 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297633 ?auto_297634 ) ( SURFACE-AT ?auto_297631 ?auto_297634 ) ( CLEAR ?auto_297631 ) ( LIFTING ?auto_297633 ?auto_297632 ) ( IS-CRATE ?auto_297632 ) ( not ( = ?auto_297631 ?auto_297632 ) ) ( ON ?auto_297626 ?auto_297625 ) ( ON ?auto_297627 ?auto_297626 ) ( ON ?auto_297628 ?auto_297627 ) ( ON ?auto_297629 ?auto_297628 ) ( ON ?auto_297630 ?auto_297629 ) ( ON ?auto_297631 ?auto_297630 ) ( not ( = ?auto_297625 ?auto_297626 ) ) ( not ( = ?auto_297625 ?auto_297627 ) ) ( not ( = ?auto_297625 ?auto_297628 ) ) ( not ( = ?auto_297625 ?auto_297629 ) ) ( not ( = ?auto_297625 ?auto_297630 ) ) ( not ( = ?auto_297625 ?auto_297631 ) ) ( not ( = ?auto_297625 ?auto_297632 ) ) ( not ( = ?auto_297626 ?auto_297627 ) ) ( not ( = ?auto_297626 ?auto_297628 ) ) ( not ( = ?auto_297626 ?auto_297629 ) ) ( not ( = ?auto_297626 ?auto_297630 ) ) ( not ( = ?auto_297626 ?auto_297631 ) ) ( not ( = ?auto_297626 ?auto_297632 ) ) ( not ( = ?auto_297627 ?auto_297628 ) ) ( not ( = ?auto_297627 ?auto_297629 ) ) ( not ( = ?auto_297627 ?auto_297630 ) ) ( not ( = ?auto_297627 ?auto_297631 ) ) ( not ( = ?auto_297627 ?auto_297632 ) ) ( not ( = ?auto_297628 ?auto_297629 ) ) ( not ( = ?auto_297628 ?auto_297630 ) ) ( not ( = ?auto_297628 ?auto_297631 ) ) ( not ( = ?auto_297628 ?auto_297632 ) ) ( not ( = ?auto_297629 ?auto_297630 ) ) ( not ( = ?auto_297629 ?auto_297631 ) ) ( not ( = ?auto_297629 ?auto_297632 ) ) ( not ( = ?auto_297630 ?auto_297631 ) ) ( not ( = ?auto_297630 ?auto_297632 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_297631 ?auto_297632 )
      ( MAKE-7CRATE-VERIFY ?auto_297625 ?auto_297626 ?auto_297627 ?auto_297628 ?auto_297629 ?auto_297630 ?auto_297631 ?auto_297632 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297680 - SURFACE
      ?auto_297681 - SURFACE
      ?auto_297682 - SURFACE
      ?auto_297683 - SURFACE
      ?auto_297684 - SURFACE
      ?auto_297685 - SURFACE
      ?auto_297686 - SURFACE
      ?auto_297687 - SURFACE
    )
    :vars
    (
      ?auto_297689 - HOIST
      ?auto_297688 - PLACE
      ?auto_297690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_297689 ?auto_297688 ) ( SURFACE-AT ?auto_297686 ?auto_297688 ) ( CLEAR ?auto_297686 ) ( IS-CRATE ?auto_297687 ) ( not ( = ?auto_297686 ?auto_297687 ) ) ( TRUCK-AT ?auto_297690 ?auto_297688 ) ( AVAILABLE ?auto_297689 ) ( IN ?auto_297687 ?auto_297690 ) ( ON ?auto_297686 ?auto_297685 ) ( not ( = ?auto_297685 ?auto_297686 ) ) ( not ( = ?auto_297685 ?auto_297687 ) ) ( ON ?auto_297681 ?auto_297680 ) ( ON ?auto_297682 ?auto_297681 ) ( ON ?auto_297683 ?auto_297682 ) ( ON ?auto_297684 ?auto_297683 ) ( ON ?auto_297685 ?auto_297684 ) ( not ( = ?auto_297680 ?auto_297681 ) ) ( not ( = ?auto_297680 ?auto_297682 ) ) ( not ( = ?auto_297680 ?auto_297683 ) ) ( not ( = ?auto_297680 ?auto_297684 ) ) ( not ( = ?auto_297680 ?auto_297685 ) ) ( not ( = ?auto_297680 ?auto_297686 ) ) ( not ( = ?auto_297680 ?auto_297687 ) ) ( not ( = ?auto_297681 ?auto_297682 ) ) ( not ( = ?auto_297681 ?auto_297683 ) ) ( not ( = ?auto_297681 ?auto_297684 ) ) ( not ( = ?auto_297681 ?auto_297685 ) ) ( not ( = ?auto_297681 ?auto_297686 ) ) ( not ( = ?auto_297681 ?auto_297687 ) ) ( not ( = ?auto_297682 ?auto_297683 ) ) ( not ( = ?auto_297682 ?auto_297684 ) ) ( not ( = ?auto_297682 ?auto_297685 ) ) ( not ( = ?auto_297682 ?auto_297686 ) ) ( not ( = ?auto_297682 ?auto_297687 ) ) ( not ( = ?auto_297683 ?auto_297684 ) ) ( not ( = ?auto_297683 ?auto_297685 ) ) ( not ( = ?auto_297683 ?auto_297686 ) ) ( not ( = ?auto_297683 ?auto_297687 ) ) ( not ( = ?auto_297684 ?auto_297685 ) ) ( not ( = ?auto_297684 ?auto_297686 ) ) ( not ( = ?auto_297684 ?auto_297687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297685 ?auto_297686 ?auto_297687 )
      ( MAKE-7CRATE-VERIFY ?auto_297680 ?auto_297681 ?auto_297682 ?auto_297683 ?auto_297684 ?auto_297685 ?auto_297686 ?auto_297687 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297743 - SURFACE
      ?auto_297744 - SURFACE
      ?auto_297745 - SURFACE
      ?auto_297746 - SURFACE
      ?auto_297747 - SURFACE
      ?auto_297748 - SURFACE
      ?auto_297749 - SURFACE
      ?auto_297750 - SURFACE
    )
    :vars
    (
      ?auto_297753 - HOIST
      ?auto_297752 - PLACE
      ?auto_297751 - TRUCK
      ?auto_297754 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297753 ?auto_297752 ) ( SURFACE-AT ?auto_297749 ?auto_297752 ) ( CLEAR ?auto_297749 ) ( IS-CRATE ?auto_297750 ) ( not ( = ?auto_297749 ?auto_297750 ) ) ( AVAILABLE ?auto_297753 ) ( IN ?auto_297750 ?auto_297751 ) ( ON ?auto_297749 ?auto_297748 ) ( not ( = ?auto_297748 ?auto_297749 ) ) ( not ( = ?auto_297748 ?auto_297750 ) ) ( TRUCK-AT ?auto_297751 ?auto_297754 ) ( not ( = ?auto_297754 ?auto_297752 ) ) ( ON ?auto_297744 ?auto_297743 ) ( ON ?auto_297745 ?auto_297744 ) ( ON ?auto_297746 ?auto_297745 ) ( ON ?auto_297747 ?auto_297746 ) ( ON ?auto_297748 ?auto_297747 ) ( not ( = ?auto_297743 ?auto_297744 ) ) ( not ( = ?auto_297743 ?auto_297745 ) ) ( not ( = ?auto_297743 ?auto_297746 ) ) ( not ( = ?auto_297743 ?auto_297747 ) ) ( not ( = ?auto_297743 ?auto_297748 ) ) ( not ( = ?auto_297743 ?auto_297749 ) ) ( not ( = ?auto_297743 ?auto_297750 ) ) ( not ( = ?auto_297744 ?auto_297745 ) ) ( not ( = ?auto_297744 ?auto_297746 ) ) ( not ( = ?auto_297744 ?auto_297747 ) ) ( not ( = ?auto_297744 ?auto_297748 ) ) ( not ( = ?auto_297744 ?auto_297749 ) ) ( not ( = ?auto_297744 ?auto_297750 ) ) ( not ( = ?auto_297745 ?auto_297746 ) ) ( not ( = ?auto_297745 ?auto_297747 ) ) ( not ( = ?auto_297745 ?auto_297748 ) ) ( not ( = ?auto_297745 ?auto_297749 ) ) ( not ( = ?auto_297745 ?auto_297750 ) ) ( not ( = ?auto_297746 ?auto_297747 ) ) ( not ( = ?auto_297746 ?auto_297748 ) ) ( not ( = ?auto_297746 ?auto_297749 ) ) ( not ( = ?auto_297746 ?auto_297750 ) ) ( not ( = ?auto_297747 ?auto_297748 ) ) ( not ( = ?auto_297747 ?auto_297749 ) ) ( not ( = ?auto_297747 ?auto_297750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297748 ?auto_297749 ?auto_297750 )
      ( MAKE-7CRATE-VERIFY ?auto_297743 ?auto_297744 ?auto_297745 ?auto_297746 ?auto_297747 ?auto_297748 ?auto_297749 ?auto_297750 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297813 - SURFACE
      ?auto_297814 - SURFACE
      ?auto_297815 - SURFACE
      ?auto_297816 - SURFACE
      ?auto_297817 - SURFACE
      ?auto_297818 - SURFACE
      ?auto_297819 - SURFACE
      ?auto_297820 - SURFACE
    )
    :vars
    (
      ?auto_297821 - HOIST
      ?auto_297822 - PLACE
      ?auto_297825 - TRUCK
      ?auto_297823 - PLACE
      ?auto_297824 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_297821 ?auto_297822 ) ( SURFACE-AT ?auto_297819 ?auto_297822 ) ( CLEAR ?auto_297819 ) ( IS-CRATE ?auto_297820 ) ( not ( = ?auto_297819 ?auto_297820 ) ) ( AVAILABLE ?auto_297821 ) ( ON ?auto_297819 ?auto_297818 ) ( not ( = ?auto_297818 ?auto_297819 ) ) ( not ( = ?auto_297818 ?auto_297820 ) ) ( TRUCK-AT ?auto_297825 ?auto_297823 ) ( not ( = ?auto_297823 ?auto_297822 ) ) ( HOIST-AT ?auto_297824 ?auto_297823 ) ( LIFTING ?auto_297824 ?auto_297820 ) ( not ( = ?auto_297821 ?auto_297824 ) ) ( ON ?auto_297814 ?auto_297813 ) ( ON ?auto_297815 ?auto_297814 ) ( ON ?auto_297816 ?auto_297815 ) ( ON ?auto_297817 ?auto_297816 ) ( ON ?auto_297818 ?auto_297817 ) ( not ( = ?auto_297813 ?auto_297814 ) ) ( not ( = ?auto_297813 ?auto_297815 ) ) ( not ( = ?auto_297813 ?auto_297816 ) ) ( not ( = ?auto_297813 ?auto_297817 ) ) ( not ( = ?auto_297813 ?auto_297818 ) ) ( not ( = ?auto_297813 ?auto_297819 ) ) ( not ( = ?auto_297813 ?auto_297820 ) ) ( not ( = ?auto_297814 ?auto_297815 ) ) ( not ( = ?auto_297814 ?auto_297816 ) ) ( not ( = ?auto_297814 ?auto_297817 ) ) ( not ( = ?auto_297814 ?auto_297818 ) ) ( not ( = ?auto_297814 ?auto_297819 ) ) ( not ( = ?auto_297814 ?auto_297820 ) ) ( not ( = ?auto_297815 ?auto_297816 ) ) ( not ( = ?auto_297815 ?auto_297817 ) ) ( not ( = ?auto_297815 ?auto_297818 ) ) ( not ( = ?auto_297815 ?auto_297819 ) ) ( not ( = ?auto_297815 ?auto_297820 ) ) ( not ( = ?auto_297816 ?auto_297817 ) ) ( not ( = ?auto_297816 ?auto_297818 ) ) ( not ( = ?auto_297816 ?auto_297819 ) ) ( not ( = ?auto_297816 ?auto_297820 ) ) ( not ( = ?auto_297817 ?auto_297818 ) ) ( not ( = ?auto_297817 ?auto_297819 ) ) ( not ( = ?auto_297817 ?auto_297820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297818 ?auto_297819 ?auto_297820 )
      ( MAKE-7CRATE-VERIFY ?auto_297813 ?auto_297814 ?auto_297815 ?auto_297816 ?auto_297817 ?auto_297818 ?auto_297819 ?auto_297820 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297890 - SURFACE
      ?auto_297891 - SURFACE
      ?auto_297892 - SURFACE
      ?auto_297893 - SURFACE
      ?auto_297894 - SURFACE
      ?auto_297895 - SURFACE
      ?auto_297896 - SURFACE
      ?auto_297897 - SURFACE
    )
    :vars
    (
      ?auto_297903 - HOIST
      ?auto_297901 - PLACE
      ?auto_297900 - TRUCK
      ?auto_297902 - PLACE
      ?auto_297899 - HOIST
      ?auto_297898 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297903 ?auto_297901 ) ( SURFACE-AT ?auto_297896 ?auto_297901 ) ( CLEAR ?auto_297896 ) ( IS-CRATE ?auto_297897 ) ( not ( = ?auto_297896 ?auto_297897 ) ) ( AVAILABLE ?auto_297903 ) ( ON ?auto_297896 ?auto_297895 ) ( not ( = ?auto_297895 ?auto_297896 ) ) ( not ( = ?auto_297895 ?auto_297897 ) ) ( TRUCK-AT ?auto_297900 ?auto_297902 ) ( not ( = ?auto_297902 ?auto_297901 ) ) ( HOIST-AT ?auto_297899 ?auto_297902 ) ( not ( = ?auto_297903 ?auto_297899 ) ) ( AVAILABLE ?auto_297899 ) ( SURFACE-AT ?auto_297897 ?auto_297902 ) ( ON ?auto_297897 ?auto_297898 ) ( CLEAR ?auto_297897 ) ( not ( = ?auto_297896 ?auto_297898 ) ) ( not ( = ?auto_297897 ?auto_297898 ) ) ( not ( = ?auto_297895 ?auto_297898 ) ) ( ON ?auto_297891 ?auto_297890 ) ( ON ?auto_297892 ?auto_297891 ) ( ON ?auto_297893 ?auto_297892 ) ( ON ?auto_297894 ?auto_297893 ) ( ON ?auto_297895 ?auto_297894 ) ( not ( = ?auto_297890 ?auto_297891 ) ) ( not ( = ?auto_297890 ?auto_297892 ) ) ( not ( = ?auto_297890 ?auto_297893 ) ) ( not ( = ?auto_297890 ?auto_297894 ) ) ( not ( = ?auto_297890 ?auto_297895 ) ) ( not ( = ?auto_297890 ?auto_297896 ) ) ( not ( = ?auto_297890 ?auto_297897 ) ) ( not ( = ?auto_297890 ?auto_297898 ) ) ( not ( = ?auto_297891 ?auto_297892 ) ) ( not ( = ?auto_297891 ?auto_297893 ) ) ( not ( = ?auto_297891 ?auto_297894 ) ) ( not ( = ?auto_297891 ?auto_297895 ) ) ( not ( = ?auto_297891 ?auto_297896 ) ) ( not ( = ?auto_297891 ?auto_297897 ) ) ( not ( = ?auto_297891 ?auto_297898 ) ) ( not ( = ?auto_297892 ?auto_297893 ) ) ( not ( = ?auto_297892 ?auto_297894 ) ) ( not ( = ?auto_297892 ?auto_297895 ) ) ( not ( = ?auto_297892 ?auto_297896 ) ) ( not ( = ?auto_297892 ?auto_297897 ) ) ( not ( = ?auto_297892 ?auto_297898 ) ) ( not ( = ?auto_297893 ?auto_297894 ) ) ( not ( = ?auto_297893 ?auto_297895 ) ) ( not ( = ?auto_297893 ?auto_297896 ) ) ( not ( = ?auto_297893 ?auto_297897 ) ) ( not ( = ?auto_297893 ?auto_297898 ) ) ( not ( = ?auto_297894 ?auto_297895 ) ) ( not ( = ?auto_297894 ?auto_297896 ) ) ( not ( = ?auto_297894 ?auto_297897 ) ) ( not ( = ?auto_297894 ?auto_297898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297895 ?auto_297896 ?auto_297897 )
      ( MAKE-7CRATE-VERIFY ?auto_297890 ?auto_297891 ?auto_297892 ?auto_297893 ?auto_297894 ?auto_297895 ?auto_297896 ?auto_297897 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297968 - SURFACE
      ?auto_297969 - SURFACE
      ?auto_297970 - SURFACE
      ?auto_297971 - SURFACE
      ?auto_297972 - SURFACE
      ?auto_297973 - SURFACE
      ?auto_297974 - SURFACE
      ?auto_297975 - SURFACE
    )
    :vars
    (
      ?auto_297980 - HOIST
      ?auto_297977 - PLACE
      ?auto_297976 - PLACE
      ?auto_297979 - HOIST
      ?auto_297978 - SURFACE
      ?auto_297981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_297980 ?auto_297977 ) ( SURFACE-AT ?auto_297974 ?auto_297977 ) ( CLEAR ?auto_297974 ) ( IS-CRATE ?auto_297975 ) ( not ( = ?auto_297974 ?auto_297975 ) ) ( AVAILABLE ?auto_297980 ) ( ON ?auto_297974 ?auto_297973 ) ( not ( = ?auto_297973 ?auto_297974 ) ) ( not ( = ?auto_297973 ?auto_297975 ) ) ( not ( = ?auto_297976 ?auto_297977 ) ) ( HOIST-AT ?auto_297979 ?auto_297976 ) ( not ( = ?auto_297980 ?auto_297979 ) ) ( AVAILABLE ?auto_297979 ) ( SURFACE-AT ?auto_297975 ?auto_297976 ) ( ON ?auto_297975 ?auto_297978 ) ( CLEAR ?auto_297975 ) ( not ( = ?auto_297974 ?auto_297978 ) ) ( not ( = ?auto_297975 ?auto_297978 ) ) ( not ( = ?auto_297973 ?auto_297978 ) ) ( TRUCK-AT ?auto_297981 ?auto_297977 ) ( ON ?auto_297969 ?auto_297968 ) ( ON ?auto_297970 ?auto_297969 ) ( ON ?auto_297971 ?auto_297970 ) ( ON ?auto_297972 ?auto_297971 ) ( ON ?auto_297973 ?auto_297972 ) ( not ( = ?auto_297968 ?auto_297969 ) ) ( not ( = ?auto_297968 ?auto_297970 ) ) ( not ( = ?auto_297968 ?auto_297971 ) ) ( not ( = ?auto_297968 ?auto_297972 ) ) ( not ( = ?auto_297968 ?auto_297973 ) ) ( not ( = ?auto_297968 ?auto_297974 ) ) ( not ( = ?auto_297968 ?auto_297975 ) ) ( not ( = ?auto_297968 ?auto_297978 ) ) ( not ( = ?auto_297969 ?auto_297970 ) ) ( not ( = ?auto_297969 ?auto_297971 ) ) ( not ( = ?auto_297969 ?auto_297972 ) ) ( not ( = ?auto_297969 ?auto_297973 ) ) ( not ( = ?auto_297969 ?auto_297974 ) ) ( not ( = ?auto_297969 ?auto_297975 ) ) ( not ( = ?auto_297969 ?auto_297978 ) ) ( not ( = ?auto_297970 ?auto_297971 ) ) ( not ( = ?auto_297970 ?auto_297972 ) ) ( not ( = ?auto_297970 ?auto_297973 ) ) ( not ( = ?auto_297970 ?auto_297974 ) ) ( not ( = ?auto_297970 ?auto_297975 ) ) ( not ( = ?auto_297970 ?auto_297978 ) ) ( not ( = ?auto_297971 ?auto_297972 ) ) ( not ( = ?auto_297971 ?auto_297973 ) ) ( not ( = ?auto_297971 ?auto_297974 ) ) ( not ( = ?auto_297971 ?auto_297975 ) ) ( not ( = ?auto_297971 ?auto_297978 ) ) ( not ( = ?auto_297972 ?auto_297973 ) ) ( not ( = ?auto_297972 ?auto_297974 ) ) ( not ( = ?auto_297972 ?auto_297975 ) ) ( not ( = ?auto_297972 ?auto_297978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297973 ?auto_297974 ?auto_297975 )
      ( MAKE-7CRATE-VERIFY ?auto_297968 ?auto_297969 ?auto_297970 ?auto_297971 ?auto_297972 ?auto_297973 ?auto_297974 ?auto_297975 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298046 - SURFACE
      ?auto_298047 - SURFACE
      ?auto_298048 - SURFACE
      ?auto_298049 - SURFACE
      ?auto_298050 - SURFACE
      ?auto_298051 - SURFACE
      ?auto_298052 - SURFACE
      ?auto_298053 - SURFACE
    )
    :vars
    (
      ?auto_298059 - HOIST
      ?auto_298054 - PLACE
      ?auto_298055 - PLACE
      ?auto_298056 - HOIST
      ?auto_298057 - SURFACE
      ?auto_298058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298059 ?auto_298054 ) ( IS-CRATE ?auto_298053 ) ( not ( = ?auto_298052 ?auto_298053 ) ) ( not ( = ?auto_298051 ?auto_298052 ) ) ( not ( = ?auto_298051 ?auto_298053 ) ) ( not ( = ?auto_298055 ?auto_298054 ) ) ( HOIST-AT ?auto_298056 ?auto_298055 ) ( not ( = ?auto_298059 ?auto_298056 ) ) ( AVAILABLE ?auto_298056 ) ( SURFACE-AT ?auto_298053 ?auto_298055 ) ( ON ?auto_298053 ?auto_298057 ) ( CLEAR ?auto_298053 ) ( not ( = ?auto_298052 ?auto_298057 ) ) ( not ( = ?auto_298053 ?auto_298057 ) ) ( not ( = ?auto_298051 ?auto_298057 ) ) ( TRUCK-AT ?auto_298058 ?auto_298054 ) ( SURFACE-AT ?auto_298051 ?auto_298054 ) ( CLEAR ?auto_298051 ) ( LIFTING ?auto_298059 ?auto_298052 ) ( IS-CRATE ?auto_298052 ) ( ON ?auto_298047 ?auto_298046 ) ( ON ?auto_298048 ?auto_298047 ) ( ON ?auto_298049 ?auto_298048 ) ( ON ?auto_298050 ?auto_298049 ) ( ON ?auto_298051 ?auto_298050 ) ( not ( = ?auto_298046 ?auto_298047 ) ) ( not ( = ?auto_298046 ?auto_298048 ) ) ( not ( = ?auto_298046 ?auto_298049 ) ) ( not ( = ?auto_298046 ?auto_298050 ) ) ( not ( = ?auto_298046 ?auto_298051 ) ) ( not ( = ?auto_298046 ?auto_298052 ) ) ( not ( = ?auto_298046 ?auto_298053 ) ) ( not ( = ?auto_298046 ?auto_298057 ) ) ( not ( = ?auto_298047 ?auto_298048 ) ) ( not ( = ?auto_298047 ?auto_298049 ) ) ( not ( = ?auto_298047 ?auto_298050 ) ) ( not ( = ?auto_298047 ?auto_298051 ) ) ( not ( = ?auto_298047 ?auto_298052 ) ) ( not ( = ?auto_298047 ?auto_298053 ) ) ( not ( = ?auto_298047 ?auto_298057 ) ) ( not ( = ?auto_298048 ?auto_298049 ) ) ( not ( = ?auto_298048 ?auto_298050 ) ) ( not ( = ?auto_298048 ?auto_298051 ) ) ( not ( = ?auto_298048 ?auto_298052 ) ) ( not ( = ?auto_298048 ?auto_298053 ) ) ( not ( = ?auto_298048 ?auto_298057 ) ) ( not ( = ?auto_298049 ?auto_298050 ) ) ( not ( = ?auto_298049 ?auto_298051 ) ) ( not ( = ?auto_298049 ?auto_298052 ) ) ( not ( = ?auto_298049 ?auto_298053 ) ) ( not ( = ?auto_298049 ?auto_298057 ) ) ( not ( = ?auto_298050 ?auto_298051 ) ) ( not ( = ?auto_298050 ?auto_298052 ) ) ( not ( = ?auto_298050 ?auto_298053 ) ) ( not ( = ?auto_298050 ?auto_298057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298051 ?auto_298052 ?auto_298053 )
      ( MAKE-7CRATE-VERIFY ?auto_298046 ?auto_298047 ?auto_298048 ?auto_298049 ?auto_298050 ?auto_298051 ?auto_298052 ?auto_298053 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298124 - SURFACE
      ?auto_298125 - SURFACE
      ?auto_298126 - SURFACE
      ?auto_298127 - SURFACE
      ?auto_298128 - SURFACE
      ?auto_298129 - SURFACE
      ?auto_298130 - SURFACE
      ?auto_298131 - SURFACE
    )
    :vars
    (
      ?auto_298134 - HOIST
      ?auto_298132 - PLACE
      ?auto_298133 - PLACE
      ?auto_298135 - HOIST
      ?auto_298136 - SURFACE
      ?auto_298137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298134 ?auto_298132 ) ( IS-CRATE ?auto_298131 ) ( not ( = ?auto_298130 ?auto_298131 ) ) ( not ( = ?auto_298129 ?auto_298130 ) ) ( not ( = ?auto_298129 ?auto_298131 ) ) ( not ( = ?auto_298133 ?auto_298132 ) ) ( HOIST-AT ?auto_298135 ?auto_298133 ) ( not ( = ?auto_298134 ?auto_298135 ) ) ( AVAILABLE ?auto_298135 ) ( SURFACE-AT ?auto_298131 ?auto_298133 ) ( ON ?auto_298131 ?auto_298136 ) ( CLEAR ?auto_298131 ) ( not ( = ?auto_298130 ?auto_298136 ) ) ( not ( = ?auto_298131 ?auto_298136 ) ) ( not ( = ?auto_298129 ?auto_298136 ) ) ( TRUCK-AT ?auto_298137 ?auto_298132 ) ( SURFACE-AT ?auto_298129 ?auto_298132 ) ( CLEAR ?auto_298129 ) ( IS-CRATE ?auto_298130 ) ( AVAILABLE ?auto_298134 ) ( IN ?auto_298130 ?auto_298137 ) ( ON ?auto_298125 ?auto_298124 ) ( ON ?auto_298126 ?auto_298125 ) ( ON ?auto_298127 ?auto_298126 ) ( ON ?auto_298128 ?auto_298127 ) ( ON ?auto_298129 ?auto_298128 ) ( not ( = ?auto_298124 ?auto_298125 ) ) ( not ( = ?auto_298124 ?auto_298126 ) ) ( not ( = ?auto_298124 ?auto_298127 ) ) ( not ( = ?auto_298124 ?auto_298128 ) ) ( not ( = ?auto_298124 ?auto_298129 ) ) ( not ( = ?auto_298124 ?auto_298130 ) ) ( not ( = ?auto_298124 ?auto_298131 ) ) ( not ( = ?auto_298124 ?auto_298136 ) ) ( not ( = ?auto_298125 ?auto_298126 ) ) ( not ( = ?auto_298125 ?auto_298127 ) ) ( not ( = ?auto_298125 ?auto_298128 ) ) ( not ( = ?auto_298125 ?auto_298129 ) ) ( not ( = ?auto_298125 ?auto_298130 ) ) ( not ( = ?auto_298125 ?auto_298131 ) ) ( not ( = ?auto_298125 ?auto_298136 ) ) ( not ( = ?auto_298126 ?auto_298127 ) ) ( not ( = ?auto_298126 ?auto_298128 ) ) ( not ( = ?auto_298126 ?auto_298129 ) ) ( not ( = ?auto_298126 ?auto_298130 ) ) ( not ( = ?auto_298126 ?auto_298131 ) ) ( not ( = ?auto_298126 ?auto_298136 ) ) ( not ( = ?auto_298127 ?auto_298128 ) ) ( not ( = ?auto_298127 ?auto_298129 ) ) ( not ( = ?auto_298127 ?auto_298130 ) ) ( not ( = ?auto_298127 ?auto_298131 ) ) ( not ( = ?auto_298127 ?auto_298136 ) ) ( not ( = ?auto_298128 ?auto_298129 ) ) ( not ( = ?auto_298128 ?auto_298130 ) ) ( not ( = ?auto_298128 ?auto_298131 ) ) ( not ( = ?auto_298128 ?auto_298136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298129 ?auto_298130 ?auto_298131 )
      ( MAKE-7CRATE-VERIFY ?auto_298124 ?auto_298125 ?auto_298126 ?auto_298127 ?auto_298128 ?auto_298129 ?auto_298130 ?auto_298131 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301043 - SURFACE
      ?auto_301044 - SURFACE
      ?auto_301045 - SURFACE
      ?auto_301046 - SURFACE
      ?auto_301047 - SURFACE
      ?auto_301048 - SURFACE
      ?auto_301049 - SURFACE
      ?auto_301050 - SURFACE
      ?auto_301051 - SURFACE
    )
    :vars
    (
      ?auto_301052 - HOIST
      ?auto_301053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301052 ?auto_301053 ) ( SURFACE-AT ?auto_301050 ?auto_301053 ) ( CLEAR ?auto_301050 ) ( LIFTING ?auto_301052 ?auto_301051 ) ( IS-CRATE ?auto_301051 ) ( not ( = ?auto_301050 ?auto_301051 ) ) ( ON ?auto_301044 ?auto_301043 ) ( ON ?auto_301045 ?auto_301044 ) ( ON ?auto_301046 ?auto_301045 ) ( ON ?auto_301047 ?auto_301046 ) ( ON ?auto_301048 ?auto_301047 ) ( ON ?auto_301049 ?auto_301048 ) ( ON ?auto_301050 ?auto_301049 ) ( not ( = ?auto_301043 ?auto_301044 ) ) ( not ( = ?auto_301043 ?auto_301045 ) ) ( not ( = ?auto_301043 ?auto_301046 ) ) ( not ( = ?auto_301043 ?auto_301047 ) ) ( not ( = ?auto_301043 ?auto_301048 ) ) ( not ( = ?auto_301043 ?auto_301049 ) ) ( not ( = ?auto_301043 ?auto_301050 ) ) ( not ( = ?auto_301043 ?auto_301051 ) ) ( not ( = ?auto_301044 ?auto_301045 ) ) ( not ( = ?auto_301044 ?auto_301046 ) ) ( not ( = ?auto_301044 ?auto_301047 ) ) ( not ( = ?auto_301044 ?auto_301048 ) ) ( not ( = ?auto_301044 ?auto_301049 ) ) ( not ( = ?auto_301044 ?auto_301050 ) ) ( not ( = ?auto_301044 ?auto_301051 ) ) ( not ( = ?auto_301045 ?auto_301046 ) ) ( not ( = ?auto_301045 ?auto_301047 ) ) ( not ( = ?auto_301045 ?auto_301048 ) ) ( not ( = ?auto_301045 ?auto_301049 ) ) ( not ( = ?auto_301045 ?auto_301050 ) ) ( not ( = ?auto_301045 ?auto_301051 ) ) ( not ( = ?auto_301046 ?auto_301047 ) ) ( not ( = ?auto_301046 ?auto_301048 ) ) ( not ( = ?auto_301046 ?auto_301049 ) ) ( not ( = ?auto_301046 ?auto_301050 ) ) ( not ( = ?auto_301046 ?auto_301051 ) ) ( not ( = ?auto_301047 ?auto_301048 ) ) ( not ( = ?auto_301047 ?auto_301049 ) ) ( not ( = ?auto_301047 ?auto_301050 ) ) ( not ( = ?auto_301047 ?auto_301051 ) ) ( not ( = ?auto_301048 ?auto_301049 ) ) ( not ( = ?auto_301048 ?auto_301050 ) ) ( not ( = ?auto_301048 ?auto_301051 ) ) ( not ( = ?auto_301049 ?auto_301050 ) ) ( not ( = ?auto_301049 ?auto_301051 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_301050 ?auto_301051 )
      ( MAKE-8CRATE-VERIFY ?auto_301043 ?auto_301044 ?auto_301045 ?auto_301046 ?auto_301047 ?auto_301048 ?auto_301049 ?auto_301050 ?auto_301051 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301110 - SURFACE
      ?auto_301111 - SURFACE
      ?auto_301112 - SURFACE
      ?auto_301113 - SURFACE
      ?auto_301114 - SURFACE
      ?auto_301115 - SURFACE
      ?auto_301116 - SURFACE
      ?auto_301117 - SURFACE
      ?auto_301118 - SURFACE
    )
    :vars
    (
      ?auto_301119 - HOIST
      ?auto_301121 - PLACE
      ?auto_301120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301119 ?auto_301121 ) ( SURFACE-AT ?auto_301117 ?auto_301121 ) ( CLEAR ?auto_301117 ) ( IS-CRATE ?auto_301118 ) ( not ( = ?auto_301117 ?auto_301118 ) ) ( TRUCK-AT ?auto_301120 ?auto_301121 ) ( AVAILABLE ?auto_301119 ) ( IN ?auto_301118 ?auto_301120 ) ( ON ?auto_301117 ?auto_301116 ) ( not ( = ?auto_301116 ?auto_301117 ) ) ( not ( = ?auto_301116 ?auto_301118 ) ) ( ON ?auto_301111 ?auto_301110 ) ( ON ?auto_301112 ?auto_301111 ) ( ON ?auto_301113 ?auto_301112 ) ( ON ?auto_301114 ?auto_301113 ) ( ON ?auto_301115 ?auto_301114 ) ( ON ?auto_301116 ?auto_301115 ) ( not ( = ?auto_301110 ?auto_301111 ) ) ( not ( = ?auto_301110 ?auto_301112 ) ) ( not ( = ?auto_301110 ?auto_301113 ) ) ( not ( = ?auto_301110 ?auto_301114 ) ) ( not ( = ?auto_301110 ?auto_301115 ) ) ( not ( = ?auto_301110 ?auto_301116 ) ) ( not ( = ?auto_301110 ?auto_301117 ) ) ( not ( = ?auto_301110 ?auto_301118 ) ) ( not ( = ?auto_301111 ?auto_301112 ) ) ( not ( = ?auto_301111 ?auto_301113 ) ) ( not ( = ?auto_301111 ?auto_301114 ) ) ( not ( = ?auto_301111 ?auto_301115 ) ) ( not ( = ?auto_301111 ?auto_301116 ) ) ( not ( = ?auto_301111 ?auto_301117 ) ) ( not ( = ?auto_301111 ?auto_301118 ) ) ( not ( = ?auto_301112 ?auto_301113 ) ) ( not ( = ?auto_301112 ?auto_301114 ) ) ( not ( = ?auto_301112 ?auto_301115 ) ) ( not ( = ?auto_301112 ?auto_301116 ) ) ( not ( = ?auto_301112 ?auto_301117 ) ) ( not ( = ?auto_301112 ?auto_301118 ) ) ( not ( = ?auto_301113 ?auto_301114 ) ) ( not ( = ?auto_301113 ?auto_301115 ) ) ( not ( = ?auto_301113 ?auto_301116 ) ) ( not ( = ?auto_301113 ?auto_301117 ) ) ( not ( = ?auto_301113 ?auto_301118 ) ) ( not ( = ?auto_301114 ?auto_301115 ) ) ( not ( = ?auto_301114 ?auto_301116 ) ) ( not ( = ?auto_301114 ?auto_301117 ) ) ( not ( = ?auto_301114 ?auto_301118 ) ) ( not ( = ?auto_301115 ?auto_301116 ) ) ( not ( = ?auto_301115 ?auto_301117 ) ) ( not ( = ?auto_301115 ?auto_301118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301116 ?auto_301117 ?auto_301118 )
      ( MAKE-8CRATE-VERIFY ?auto_301110 ?auto_301111 ?auto_301112 ?auto_301113 ?auto_301114 ?auto_301115 ?auto_301116 ?auto_301117 ?auto_301118 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301186 - SURFACE
      ?auto_301187 - SURFACE
      ?auto_301188 - SURFACE
      ?auto_301189 - SURFACE
      ?auto_301190 - SURFACE
      ?auto_301191 - SURFACE
      ?auto_301192 - SURFACE
      ?auto_301193 - SURFACE
      ?auto_301194 - SURFACE
    )
    :vars
    (
      ?auto_301196 - HOIST
      ?auto_301197 - PLACE
      ?auto_301198 - TRUCK
      ?auto_301195 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301196 ?auto_301197 ) ( SURFACE-AT ?auto_301193 ?auto_301197 ) ( CLEAR ?auto_301193 ) ( IS-CRATE ?auto_301194 ) ( not ( = ?auto_301193 ?auto_301194 ) ) ( AVAILABLE ?auto_301196 ) ( IN ?auto_301194 ?auto_301198 ) ( ON ?auto_301193 ?auto_301192 ) ( not ( = ?auto_301192 ?auto_301193 ) ) ( not ( = ?auto_301192 ?auto_301194 ) ) ( TRUCK-AT ?auto_301198 ?auto_301195 ) ( not ( = ?auto_301195 ?auto_301197 ) ) ( ON ?auto_301187 ?auto_301186 ) ( ON ?auto_301188 ?auto_301187 ) ( ON ?auto_301189 ?auto_301188 ) ( ON ?auto_301190 ?auto_301189 ) ( ON ?auto_301191 ?auto_301190 ) ( ON ?auto_301192 ?auto_301191 ) ( not ( = ?auto_301186 ?auto_301187 ) ) ( not ( = ?auto_301186 ?auto_301188 ) ) ( not ( = ?auto_301186 ?auto_301189 ) ) ( not ( = ?auto_301186 ?auto_301190 ) ) ( not ( = ?auto_301186 ?auto_301191 ) ) ( not ( = ?auto_301186 ?auto_301192 ) ) ( not ( = ?auto_301186 ?auto_301193 ) ) ( not ( = ?auto_301186 ?auto_301194 ) ) ( not ( = ?auto_301187 ?auto_301188 ) ) ( not ( = ?auto_301187 ?auto_301189 ) ) ( not ( = ?auto_301187 ?auto_301190 ) ) ( not ( = ?auto_301187 ?auto_301191 ) ) ( not ( = ?auto_301187 ?auto_301192 ) ) ( not ( = ?auto_301187 ?auto_301193 ) ) ( not ( = ?auto_301187 ?auto_301194 ) ) ( not ( = ?auto_301188 ?auto_301189 ) ) ( not ( = ?auto_301188 ?auto_301190 ) ) ( not ( = ?auto_301188 ?auto_301191 ) ) ( not ( = ?auto_301188 ?auto_301192 ) ) ( not ( = ?auto_301188 ?auto_301193 ) ) ( not ( = ?auto_301188 ?auto_301194 ) ) ( not ( = ?auto_301189 ?auto_301190 ) ) ( not ( = ?auto_301189 ?auto_301191 ) ) ( not ( = ?auto_301189 ?auto_301192 ) ) ( not ( = ?auto_301189 ?auto_301193 ) ) ( not ( = ?auto_301189 ?auto_301194 ) ) ( not ( = ?auto_301190 ?auto_301191 ) ) ( not ( = ?auto_301190 ?auto_301192 ) ) ( not ( = ?auto_301190 ?auto_301193 ) ) ( not ( = ?auto_301190 ?auto_301194 ) ) ( not ( = ?auto_301191 ?auto_301192 ) ) ( not ( = ?auto_301191 ?auto_301193 ) ) ( not ( = ?auto_301191 ?auto_301194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301192 ?auto_301193 ?auto_301194 )
      ( MAKE-8CRATE-VERIFY ?auto_301186 ?auto_301187 ?auto_301188 ?auto_301189 ?auto_301190 ?auto_301191 ?auto_301192 ?auto_301193 ?auto_301194 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301270 - SURFACE
      ?auto_301271 - SURFACE
      ?auto_301272 - SURFACE
      ?auto_301273 - SURFACE
      ?auto_301274 - SURFACE
      ?auto_301275 - SURFACE
      ?auto_301276 - SURFACE
      ?auto_301277 - SURFACE
      ?auto_301278 - SURFACE
    )
    :vars
    (
      ?auto_301282 - HOIST
      ?auto_301283 - PLACE
      ?auto_301281 - TRUCK
      ?auto_301279 - PLACE
      ?auto_301280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_301282 ?auto_301283 ) ( SURFACE-AT ?auto_301277 ?auto_301283 ) ( CLEAR ?auto_301277 ) ( IS-CRATE ?auto_301278 ) ( not ( = ?auto_301277 ?auto_301278 ) ) ( AVAILABLE ?auto_301282 ) ( ON ?auto_301277 ?auto_301276 ) ( not ( = ?auto_301276 ?auto_301277 ) ) ( not ( = ?auto_301276 ?auto_301278 ) ) ( TRUCK-AT ?auto_301281 ?auto_301279 ) ( not ( = ?auto_301279 ?auto_301283 ) ) ( HOIST-AT ?auto_301280 ?auto_301279 ) ( LIFTING ?auto_301280 ?auto_301278 ) ( not ( = ?auto_301282 ?auto_301280 ) ) ( ON ?auto_301271 ?auto_301270 ) ( ON ?auto_301272 ?auto_301271 ) ( ON ?auto_301273 ?auto_301272 ) ( ON ?auto_301274 ?auto_301273 ) ( ON ?auto_301275 ?auto_301274 ) ( ON ?auto_301276 ?auto_301275 ) ( not ( = ?auto_301270 ?auto_301271 ) ) ( not ( = ?auto_301270 ?auto_301272 ) ) ( not ( = ?auto_301270 ?auto_301273 ) ) ( not ( = ?auto_301270 ?auto_301274 ) ) ( not ( = ?auto_301270 ?auto_301275 ) ) ( not ( = ?auto_301270 ?auto_301276 ) ) ( not ( = ?auto_301270 ?auto_301277 ) ) ( not ( = ?auto_301270 ?auto_301278 ) ) ( not ( = ?auto_301271 ?auto_301272 ) ) ( not ( = ?auto_301271 ?auto_301273 ) ) ( not ( = ?auto_301271 ?auto_301274 ) ) ( not ( = ?auto_301271 ?auto_301275 ) ) ( not ( = ?auto_301271 ?auto_301276 ) ) ( not ( = ?auto_301271 ?auto_301277 ) ) ( not ( = ?auto_301271 ?auto_301278 ) ) ( not ( = ?auto_301272 ?auto_301273 ) ) ( not ( = ?auto_301272 ?auto_301274 ) ) ( not ( = ?auto_301272 ?auto_301275 ) ) ( not ( = ?auto_301272 ?auto_301276 ) ) ( not ( = ?auto_301272 ?auto_301277 ) ) ( not ( = ?auto_301272 ?auto_301278 ) ) ( not ( = ?auto_301273 ?auto_301274 ) ) ( not ( = ?auto_301273 ?auto_301275 ) ) ( not ( = ?auto_301273 ?auto_301276 ) ) ( not ( = ?auto_301273 ?auto_301277 ) ) ( not ( = ?auto_301273 ?auto_301278 ) ) ( not ( = ?auto_301274 ?auto_301275 ) ) ( not ( = ?auto_301274 ?auto_301276 ) ) ( not ( = ?auto_301274 ?auto_301277 ) ) ( not ( = ?auto_301274 ?auto_301278 ) ) ( not ( = ?auto_301275 ?auto_301276 ) ) ( not ( = ?auto_301275 ?auto_301277 ) ) ( not ( = ?auto_301275 ?auto_301278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301276 ?auto_301277 ?auto_301278 )
      ( MAKE-8CRATE-VERIFY ?auto_301270 ?auto_301271 ?auto_301272 ?auto_301273 ?auto_301274 ?auto_301275 ?auto_301276 ?auto_301277 ?auto_301278 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301362 - SURFACE
      ?auto_301363 - SURFACE
      ?auto_301364 - SURFACE
      ?auto_301365 - SURFACE
      ?auto_301366 - SURFACE
      ?auto_301367 - SURFACE
      ?auto_301368 - SURFACE
      ?auto_301369 - SURFACE
      ?auto_301370 - SURFACE
    )
    :vars
    (
      ?auto_301376 - HOIST
      ?auto_301373 - PLACE
      ?auto_301375 - TRUCK
      ?auto_301372 - PLACE
      ?auto_301374 - HOIST
      ?auto_301371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301376 ?auto_301373 ) ( SURFACE-AT ?auto_301369 ?auto_301373 ) ( CLEAR ?auto_301369 ) ( IS-CRATE ?auto_301370 ) ( not ( = ?auto_301369 ?auto_301370 ) ) ( AVAILABLE ?auto_301376 ) ( ON ?auto_301369 ?auto_301368 ) ( not ( = ?auto_301368 ?auto_301369 ) ) ( not ( = ?auto_301368 ?auto_301370 ) ) ( TRUCK-AT ?auto_301375 ?auto_301372 ) ( not ( = ?auto_301372 ?auto_301373 ) ) ( HOIST-AT ?auto_301374 ?auto_301372 ) ( not ( = ?auto_301376 ?auto_301374 ) ) ( AVAILABLE ?auto_301374 ) ( SURFACE-AT ?auto_301370 ?auto_301372 ) ( ON ?auto_301370 ?auto_301371 ) ( CLEAR ?auto_301370 ) ( not ( = ?auto_301369 ?auto_301371 ) ) ( not ( = ?auto_301370 ?auto_301371 ) ) ( not ( = ?auto_301368 ?auto_301371 ) ) ( ON ?auto_301363 ?auto_301362 ) ( ON ?auto_301364 ?auto_301363 ) ( ON ?auto_301365 ?auto_301364 ) ( ON ?auto_301366 ?auto_301365 ) ( ON ?auto_301367 ?auto_301366 ) ( ON ?auto_301368 ?auto_301367 ) ( not ( = ?auto_301362 ?auto_301363 ) ) ( not ( = ?auto_301362 ?auto_301364 ) ) ( not ( = ?auto_301362 ?auto_301365 ) ) ( not ( = ?auto_301362 ?auto_301366 ) ) ( not ( = ?auto_301362 ?auto_301367 ) ) ( not ( = ?auto_301362 ?auto_301368 ) ) ( not ( = ?auto_301362 ?auto_301369 ) ) ( not ( = ?auto_301362 ?auto_301370 ) ) ( not ( = ?auto_301362 ?auto_301371 ) ) ( not ( = ?auto_301363 ?auto_301364 ) ) ( not ( = ?auto_301363 ?auto_301365 ) ) ( not ( = ?auto_301363 ?auto_301366 ) ) ( not ( = ?auto_301363 ?auto_301367 ) ) ( not ( = ?auto_301363 ?auto_301368 ) ) ( not ( = ?auto_301363 ?auto_301369 ) ) ( not ( = ?auto_301363 ?auto_301370 ) ) ( not ( = ?auto_301363 ?auto_301371 ) ) ( not ( = ?auto_301364 ?auto_301365 ) ) ( not ( = ?auto_301364 ?auto_301366 ) ) ( not ( = ?auto_301364 ?auto_301367 ) ) ( not ( = ?auto_301364 ?auto_301368 ) ) ( not ( = ?auto_301364 ?auto_301369 ) ) ( not ( = ?auto_301364 ?auto_301370 ) ) ( not ( = ?auto_301364 ?auto_301371 ) ) ( not ( = ?auto_301365 ?auto_301366 ) ) ( not ( = ?auto_301365 ?auto_301367 ) ) ( not ( = ?auto_301365 ?auto_301368 ) ) ( not ( = ?auto_301365 ?auto_301369 ) ) ( not ( = ?auto_301365 ?auto_301370 ) ) ( not ( = ?auto_301365 ?auto_301371 ) ) ( not ( = ?auto_301366 ?auto_301367 ) ) ( not ( = ?auto_301366 ?auto_301368 ) ) ( not ( = ?auto_301366 ?auto_301369 ) ) ( not ( = ?auto_301366 ?auto_301370 ) ) ( not ( = ?auto_301366 ?auto_301371 ) ) ( not ( = ?auto_301367 ?auto_301368 ) ) ( not ( = ?auto_301367 ?auto_301369 ) ) ( not ( = ?auto_301367 ?auto_301370 ) ) ( not ( = ?auto_301367 ?auto_301371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301368 ?auto_301369 ?auto_301370 )
      ( MAKE-8CRATE-VERIFY ?auto_301362 ?auto_301363 ?auto_301364 ?auto_301365 ?auto_301366 ?auto_301367 ?auto_301368 ?auto_301369 ?auto_301370 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301455 - SURFACE
      ?auto_301456 - SURFACE
      ?auto_301457 - SURFACE
      ?auto_301458 - SURFACE
      ?auto_301459 - SURFACE
      ?auto_301460 - SURFACE
      ?auto_301461 - SURFACE
      ?auto_301462 - SURFACE
      ?auto_301463 - SURFACE
    )
    :vars
    (
      ?auto_301469 - HOIST
      ?auto_301464 - PLACE
      ?auto_301467 - PLACE
      ?auto_301466 - HOIST
      ?auto_301468 - SURFACE
      ?auto_301465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301469 ?auto_301464 ) ( SURFACE-AT ?auto_301462 ?auto_301464 ) ( CLEAR ?auto_301462 ) ( IS-CRATE ?auto_301463 ) ( not ( = ?auto_301462 ?auto_301463 ) ) ( AVAILABLE ?auto_301469 ) ( ON ?auto_301462 ?auto_301461 ) ( not ( = ?auto_301461 ?auto_301462 ) ) ( not ( = ?auto_301461 ?auto_301463 ) ) ( not ( = ?auto_301467 ?auto_301464 ) ) ( HOIST-AT ?auto_301466 ?auto_301467 ) ( not ( = ?auto_301469 ?auto_301466 ) ) ( AVAILABLE ?auto_301466 ) ( SURFACE-AT ?auto_301463 ?auto_301467 ) ( ON ?auto_301463 ?auto_301468 ) ( CLEAR ?auto_301463 ) ( not ( = ?auto_301462 ?auto_301468 ) ) ( not ( = ?auto_301463 ?auto_301468 ) ) ( not ( = ?auto_301461 ?auto_301468 ) ) ( TRUCK-AT ?auto_301465 ?auto_301464 ) ( ON ?auto_301456 ?auto_301455 ) ( ON ?auto_301457 ?auto_301456 ) ( ON ?auto_301458 ?auto_301457 ) ( ON ?auto_301459 ?auto_301458 ) ( ON ?auto_301460 ?auto_301459 ) ( ON ?auto_301461 ?auto_301460 ) ( not ( = ?auto_301455 ?auto_301456 ) ) ( not ( = ?auto_301455 ?auto_301457 ) ) ( not ( = ?auto_301455 ?auto_301458 ) ) ( not ( = ?auto_301455 ?auto_301459 ) ) ( not ( = ?auto_301455 ?auto_301460 ) ) ( not ( = ?auto_301455 ?auto_301461 ) ) ( not ( = ?auto_301455 ?auto_301462 ) ) ( not ( = ?auto_301455 ?auto_301463 ) ) ( not ( = ?auto_301455 ?auto_301468 ) ) ( not ( = ?auto_301456 ?auto_301457 ) ) ( not ( = ?auto_301456 ?auto_301458 ) ) ( not ( = ?auto_301456 ?auto_301459 ) ) ( not ( = ?auto_301456 ?auto_301460 ) ) ( not ( = ?auto_301456 ?auto_301461 ) ) ( not ( = ?auto_301456 ?auto_301462 ) ) ( not ( = ?auto_301456 ?auto_301463 ) ) ( not ( = ?auto_301456 ?auto_301468 ) ) ( not ( = ?auto_301457 ?auto_301458 ) ) ( not ( = ?auto_301457 ?auto_301459 ) ) ( not ( = ?auto_301457 ?auto_301460 ) ) ( not ( = ?auto_301457 ?auto_301461 ) ) ( not ( = ?auto_301457 ?auto_301462 ) ) ( not ( = ?auto_301457 ?auto_301463 ) ) ( not ( = ?auto_301457 ?auto_301468 ) ) ( not ( = ?auto_301458 ?auto_301459 ) ) ( not ( = ?auto_301458 ?auto_301460 ) ) ( not ( = ?auto_301458 ?auto_301461 ) ) ( not ( = ?auto_301458 ?auto_301462 ) ) ( not ( = ?auto_301458 ?auto_301463 ) ) ( not ( = ?auto_301458 ?auto_301468 ) ) ( not ( = ?auto_301459 ?auto_301460 ) ) ( not ( = ?auto_301459 ?auto_301461 ) ) ( not ( = ?auto_301459 ?auto_301462 ) ) ( not ( = ?auto_301459 ?auto_301463 ) ) ( not ( = ?auto_301459 ?auto_301468 ) ) ( not ( = ?auto_301460 ?auto_301461 ) ) ( not ( = ?auto_301460 ?auto_301462 ) ) ( not ( = ?auto_301460 ?auto_301463 ) ) ( not ( = ?auto_301460 ?auto_301468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301461 ?auto_301462 ?auto_301463 )
      ( MAKE-8CRATE-VERIFY ?auto_301455 ?auto_301456 ?auto_301457 ?auto_301458 ?auto_301459 ?auto_301460 ?auto_301461 ?auto_301462 ?auto_301463 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301548 - SURFACE
      ?auto_301549 - SURFACE
      ?auto_301550 - SURFACE
      ?auto_301551 - SURFACE
      ?auto_301552 - SURFACE
      ?auto_301553 - SURFACE
      ?auto_301554 - SURFACE
      ?auto_301555 - SURFACE
      ?auto_301556 - SURFACE
    )
    :vars
    (
      ?auto_301560 - HOIST
      ?auto_301562 - PLACE
      ?auto_301561 - PLACE
      ?auto_301557 - HOIST
      ?auto_301559 - SURFACE
      ?auto_301558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301560 ?auto_301562 ) ( IS-CRATE ?auto_301556 ) ( not ( = ?auto_301555 ?auto_301556 ) ) ( not ( = ?auto_301554 ?auto_301555 ) ) ( not ( = ?auto_301554 ?auto_301556 ) ) ( not ( = ?auto_301561 ?auto_301562 ) ) ( HOIST-AT ?auto_301557 ?auto_301561 ) ( not ( = ?auto_301560 ?auto_301557 ) ) ( AVAILABLE ?auto_301557 ) ( SURFACE-AT ?auto_301556 ?auto_301561 ) ( ON ?auto_301556 ?auto_301559 ) ( CLEAR ?auto_301556 ) ( not ( = ?auto_301555 ?auto_301559 ) ) ( not ( = ?auto_301556 ?auto_301559 ) ) ( not ( = ?auto_301554 ?auto_301559 ) ) ( TRUCK-AT ?auto_301558 ?auto_301562 ) ( SURFACE-AT ?auto_301554 ?auto_301562 ) ( CLEAR ?auto_301554 ) ( LIFTING ?auto_301560 ?auto_301555 ) ( IS-CRATE ?auto_301555 ) ( ON ?auto_301549 ?auto_301548 ) ( ON ?auto_301550 ?auto_301549 ) ( ON ?auto_301551 ?auto_301550 ) ( ON ?auto_301552 ?auto_301551 ) ( ON ?auto_301553 ?auto_301552 ) ( ON ?auto_301554 ?auto_301553 ) ( not ( = ?auto_301548 ?auto_301549 ) ) ( not ( = ?auto_301548 ?auto_301550 ) ) ( not ( = ?auto_301548 ?auto_301551 ) ) ( not ( = ?auto_301548 ?auto_301552 ) ) ( not ( = ?auto_301548 ?auto_301553 ) ) ( not ( = ?auto_301548 ?auto_301554 ) ) ( not ( = ?auto_301548 ?auto_301555 ) ) ( not ( = ?auto_301548 ?auto_301556 ) ) ( not ( = ?auto_301548 ?auto_301559 ) ) ( not ( = ?auto_301549 ?auto_301550 ) ) ( not ( = ?auto_301549 ?auto_301551 ) ) ( not ( = ?auto_301549 ?auto_301552 ) ) ( not ( = ?auto_301549 ?auto_301553 ) ) ( not ( = ?auto_301549 ?auto_301554 ) ) ( not ( = ?auto_301549 ?auto_301555 ) ) ( not ( = ?auto_301549 ?auto_301556 ) ) ( not ( = ?auto_301549 ?auto_301559 ) ) ( not ( = ?auto_301550 ?auto_301551 ) ) ( not ( = ?auto_301550 ?auto_301552 ) ) ( not ( = ?auto_301550 ?auto_301553 ) ) ( not ( = ?auto_301550 ?auto_301554 ) ) ( not ( = ?auto_301550 ?auto_301555 ) ) ( not ( = ?auto_301550 ?auto_301556 ) ) ( not ( = ?auto_301550 ?auto_301559 ) ) ( not ( = ?auto_301551 ?auto_301552 ) ) ( not ( = ?auto_301551 ?auto_301553 ) ) ( not ( = ?auto_301551 ?auto_301554 ) ) ( not ( = ?auto_301551 ?auto_301555 ) ) ( not ( = ?auto_301551 ?auto_301556 ) ) ( not ( = ?auto_301551 ?auto_301559 ) ) ( not ( = ?auto_301552 ?auto_301553 ) ) ( not ( = ?auto_301552 ?auto_301554 ) ) ( not ( = ?auto_301552 ?auto_301555 ) ) ( not ( = ?auto_301552 ?auto_301556 ) ) ( not ( = ?auto_301552 ?auto_301559 ) ) ( not ( = ?auto_301553 ?auto_301554 ) ) ( not ( = ?auto_301553 ?auto_301555 ) ) ( not ( = ?auto_301553 ?auto_301556 ) ) ( not ( = ?auto_301553 ?auto_301559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301554 ?auto_301555 ?auto_301556 )
      ( MAKE-8CRATE-VERIFY ?auto_301548 ?auto_301549 ?auto_301550 ?auto_301551 ?auto_301552 ?auto_301553 ?auto_301554 ?auto_301555 ?auto_301556 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301641 - SURFACE
      ?auto_301642 - SURFACE
      ?auto_301643 - SURFACE
      ?auto_301644 - SURFACE
      ?auto_301645 - SURFACE
      ?auto_301646 - SURFACE
      ?auto_301647 - SURFACE
      ?auto_301648 - SURFACE
      ?auto_301649 - SURFACE
    )
    :vars
    (
      ?auto_301650 - HOIST
      ?auto_301651 - PLACE
      ?auto_301653 - PLACE
      ?auto_301655 - HOIST
      ?auto_301654 - SURFACE
      ?auto_301652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301650 ?auto_301651 ) ( IS-CRATE ?auto_301649 ) ( not ( = ?auto_301648 ?auto_301649 ) ) ( not ( = ?auto_301647 ?auto_301648 ) ) ( not ( = ?auto_301647 ?auto_301649 ) ) ( not ( = ?auto_301653 ?auto_301651 ) ) ( HOIST-AT ?auto_301655 ?auto_301653 ) ( not ( = ?auto_301650 ?auto_301655 ) ) ( AVAILABLE ?auto_301655 ) ( SURFACE-AT ?auto_301649 ?auto_301653 ) ( ON ?auto_301649 ?auto_301654 ) ( CLEAR ?auto_301649 ) ( not ( = ?auto_301648 ?auto_301654 ) ) ( not ( = ?auto_301649 ?auto_301654 ) ) ( not ( = ?auto_301647 ?auto_301654 ) ) ( TRUCK-AT ?auto_301652 ?auto_301651 ) ( SURFACE-AT ?auto_301647 ?auto_301651 ) ( CLEAR ?auto_301647 ) ( IS-CRATE ?auto_301648 ) ( AVAILABLE ?auto_301650 ) ( IN ?auto_301648 ?auto_301652 ) ( ON ?auto_301642 ?auto_301641 ) ( ON ?auto_301643 ?auto_301642 ) ( ON ?auto_301644 ?auto_301643 ) ( ON ?auto_301645 ?auto_301644 ) ( ON ?auto_301646 ?auto_301645 ) ( ON ?auto_301647 ?auto_301646 ) ( not ( = ?auto_301641 ?auto_301642 ) ) ( not ( = ?auto_301641 ?auto_301643 ) ) ( not ( = ?auto_301641 ?auto_301644 ) ) ( not ( = ?auto_301641 ?auto_301645 ) ) ( not ( = ?auto_301641 ?auto_301646 ) ) ( not ( = ?auto_301641 ?auto_301647 ) ) ( not ( = ?auto_301641 ?auto_301648 ) ) ( not ( = ?auto_301641 ?auto_301649 ) ) ( not ( = ?auto_301641 ?auto_301654 ) ) ( not ( = ?auto_301642 ?auto_301643 ) ) ( not ( = ?auto_301642 ?auto_301644 ) ) ( not ( = ?auto_301642 ?auto_301645 ) ) ( not ( = ?auto_301642 ?auto_301646 ) ) ( not ( = ?auto_301642 ?auto_301647 ) ) ( not ( = ?auto_301642 ?auto_301648 ) ) ( not ( = ?auto_301642 ?auto_301649 ) ) ( not ( = ?auto_301642 ?auto_301654 ) ) ( not ( = ?auto_301643 ?auto_301644 ) ) ( not ( = ?auto_301643 ?auto_301645 ) ) ( not ( = ?auto_301643 ?auto_301646 ) ) ( not ( = ?auto_301643 ?auto_301647 ) ) ( not ( = ?auto_301643 ?auto_301648 ) ) ( not ( = ?auto_301643 ?auto_301649 ) ) ( not ( = ?auto_301643 ?auto_301654 ) ) ( not ( = ?auto_301644 ?auto_301645 ) ) ( not ( = ?auto_301644 ?auto_301646 ) ) ( not ( = ?auto_301644 ?auto_301647 ) ) ( not ( = ?auto_301644 ?auto_301648 ) ) ( not ( = ?auto_301644 ?auto_301649 ) ) ( not ( = ?auto_301644 ?auto_301654 ) ) ( not ( = ?auto_301645 ?auto_301646 ) ) ( not ( = ?auto_301645 ?auto_301647 ) ) ( not ( = ?auto_301645 ?auto_301648 ) ) ( not ( = ?auto_301645 ?auto_301649 ) ) ( not ( = ?auto_301645 ?auto_301654 ) ) ( not ( = ?auto_301646 ?auto_301647 ) ) ( not ( = ?auto_301646 ?auto_301648 ) ) ( not ( = ?auto_301646 ?auto_301649 ) ) ( not ( = ?auto_301646 ?auto_301654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301647 ?auto_301648 ?auto_301649 )
      ( MAKE-8CRATE-VERIFY ?auto_301641 ?auto_301642 ?auto_301643 ?auto_301644 ?auto_301645 ?auto_301646 ?auto_301647 ?auto_301648 ?auto_301649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_304136 - SURFACE
      ?auto_304137 - SURFACE
    )
    :vars
    (
      ?auto_304143 - HOIST
      ?auto_304144 - PLACE
      ?auto_304141 - SURFACE
      ?auto_304138 - TRUCK
      ?auto_304140 - PLACE
      ?auto_304139 - HOIST
      ?auto_304142 - SURFACE
      ?auto_304145 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_304143 ?auto_304144 ) ( SURFACE-AT ?auto_304136 ?auto_304144 ) ( CLEAR ?auto_304136 ) ( IS-CRATE ?auto_304137 ) ( not ( = ?auto_304136 ?auto_304137 ) ) ( AVAILABLE ?auto_304143 ) ( ON ?auto_304136 ?auto_304141 ) ( not ( = ?auto_304141 ?auto_304136 ) ) ( not ( = ?auto_304141 ?auto_304137 ) ) ( TRUCK-AT ?auto_304138 ?auto_304140 ) ( not ( = ?auto_304140 ?auto_304144 ) ) ( HOIST-AT ?auto_304139 ?auto_304140 ) ( not ( = ?auto_304143 ?auto_304139 ) ) ( SURFACE-AT ?auto_304137 ?auto_304140 ) ( ON ?auto_304137 ?auto_304142 ) ( CLEAR ?auto_304137 ) ( not ( = ?auto_304136 ?auto_304142 ) ) ( not ( = ?auto_304137 ?auto_304142 ) ) ( not ( = ?auto_304141 ?auto_304142 ) ) ( LIFTING ?auto_304139 ?auto_304145 ) ( IS-CRATE ?auto_304145 ) ( not ( = ?auto_304136 ?auto_304145 ) ) ( not ( = ?auto_304137 ?auto_304145 ) ) ( not ( = ?auto_304141 ?auto_304145 ) ) ( not ( = ?auto_304142 ?auto_304145 ) ) )
    :subtasks
    ( ( !LOAD ?auto_304139 ?auto_304145 ?auto_304138 ?auto_304140 )
      ( MAKE-1CRATE ?auto_304136 ?auto_304137 )
      ( MAKE-1CRATE-VERIFY ?auto_304136 ?auto_304137 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_305747 - SURFACE
      ?auto_305748 - SURFACE
      ?auto_305749 - SURFACE
      ?auto_305750 - SURFACE
      ?auto_305751 - SURFACE
      ?auto_305752 - SURFACE
      ?auto_305753 - SURFACE
      ?auto_305754 - SURFACE
      ?auto_305755 - SURFACE
      ?auto_305756 - SURFACE
    )
    :vars
    (
      ?auto_305758 - HOIST
      ?auto_305757 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_305758 ?auto_305757 ) ( SURFACE-AT ?auto_305755 ?auto_305757 ) ( CLEAR ?auto_305755 ) ( LIFTING ?auto_305758 ?auto_305756 ) ( IS-CRATE ?auto_305756 ) ( not ( = ?auto_305755 ?auto_305756 ) ) ( ON ?auto_305748 ?auto_305747 ) ( ON ?auto_305749 ?auto_305748 ) ( ON ?auto_305750 ?auto_305749 ) ( ON ?auto_305751 ?auto_305750 ) ( ON ?auto_305752 ?auto_305751 ) ( ON ?auto_305753 ?auto_305752 ) ( ON ?auto_305754 ?auto_305753 ) ( ON ?auto_305755 ?auto_305754 ) ( not ( = ?auto_305747 ?auto_305748 ) ) ( not ( = ?auto_305747 ?auto_305749 ) ) ( not ( = ?auto_305747 ?auto_305750 ) ) ( not ( = ?auto_305747 ?auto_305751 ) ) ( not ( = ?auto_305747 ?auto_305752 ) ) ( not ( = ?auto_305747 ?auto_305753 ) ) ( not ( = ?auto_305747 ?auto_305754 ) ) ( not ( = ?auto_305747 ?auto_305755 ) ) ( not ( = ?auto_305747 ?auto_305756 ) ) ( not ( = ?auto_305748 ?auto_305749 ) ) ( not ( = ?auto_305748 ?auto_305750 ) ) ( not ( = ?auto_305748 ?auto_305751 ) ) ( not ( = ?auto_305748 ?auto_305752 ) ) ( not ( = ?auto_305748 ?auto_305753 ) ) ( not ( = ?auto_305748 ?auto_305754 ) ) ( not ( = ?auto_305748 ?auto_305755 ) ) ( not ( = ?auto_305748 ?auto_305756 ) ) ( not ( = ?auto_305749 ?auto_305750 ) ) ( not ( = ?auto_305749 ?auto_305751 ) ) ( not ( = ?auto_305749 ?auto_305752 ) ) ( not ( = ?auto_305749 ?auto_305753 ) ) ( not ( = ?auto_305749 ?auto_305754 ) ) ( not ( = ?auto_305749 ?auto_305755 ) ) ( not ( = ?auto_305749 ?auto_305756 ) ) ( not ( = ?auto_305750 ?auto_305751 ) ) ( not ( = ?auto_305750 ?auto_305752 ) ) ( not ( = ?auto_305750 ?auto_305753 ) ) ( not ( = ?auto_305750 ?auto_305754 ) ) ( not ( = ?auto_305750 ?auto_305755 ) ) ( not ( = ?auto_305750 ?auto_305756 ) ) ( not ( = ?auto_305751 ?auto_305752 ) ) ( not ( = ?auto_305751 ?auto_305753 ) ) ( not ( = ?auto_305751 ?auto_305754 ) ) ( not ( = ?auto_305751 ?auto_305755 ) ) ( not ( = ?auto_305751 ?auto_305756 ) ) ( not ( = ?auto_305752 ?auto_305753 ) ) ( not ( = ?auto_305752 ?auto_305754 ) ) ( not ( = ?auto_305752 ?auto_305755 ) ) ( not ( = ?auto_305752 ?auto_305756 ) ) ( not ( = ?auto_305753 ?auto_305754 ) ) ( not ( = ?auto_305753 ?auto_305755 ) ) ( not ( = ?auto_305753 ?auto_305756 ) ) ( not ( = ?auto_305754 ?auto_305755 ) ) ( not ( = ?auto_305754 ?auto_305756 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_305755 ?auto_305756 )
      ( MAKE-9CRATE-VERIFY ?auto_305747 ?auto_305748 ?auto_305749 ?auto_305750 ?auto_305751 ?auto_305752 ?auto_305753 ?auto_305754 ?auto_305755 ?auto_305756 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_305827 - SURFACE
      ?auto_305828 - SURFACE
      ?auto_305829 - SURFACE
      ?auto_305830 - SURFACE
      ?auto_305831 - SURFACE
      ?auto_305832 - SURFACE
      ?auto_305833 - SURFACE
      ?auto_305834 - SURFACE
      ?auto_305835 - SURFACE
      ?auto_305836 - SURFACE
    )
    :vars
    (
      ?auto_305839 - HOIST
      ?auto_305838 - PLACE
      ?auto_305837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_305839 ?auto_305838 ) ( SURFACE-AT ?auto_305835 ?auto_305838 ) ( CLEAR ?auto_305835 ) ( IS-CRATE ?auto_305836 ) ( not ( = ?auto_305835 ?auto_305836 ) ) ( TRUCK-AT ?auto_305837 ?auto_305838 ) ( AVAILABLE ?auto_305839 ) ( IN ?auto_305836 ?auto_305837 ) ( ON ?auto_305835 ?auto_305834 ) ( not ( = ?auto_305834 ?auto_305835 ) ) ( not ( = ?auto_305834 ?auto_305836 ) ) ( ON ?auto_305828 ?auto_305827 ) ( ON ?auto_305829 ?auto_305828 ) ( ON ?auto_305830 ?auto_305829 ) ( ON ?auto_305831 ?auto_305830 ) ( ON ?auto_305832 ?auto_305831 ) ( ON ?auto_305833 ?auto_305832 ) ( ON ?auto_305834 ?auto_305833 ) ( not ( = ?auto_305827 ?auto_305828 ) ) ( not ( = ?auto_305827 ?auto_305829 ) ) ( not ( = ?auto_305827 ?auto_305830 ) ) ( not ( = ?auto_305827 ?auto_305831 ) ) ( not ( = ?auto_305827 ?auto_305832 ) ) ( not ( = ?auto_305827 ?auto_305833 ) ) ( not ( = ?auto_305827 ?auto_305834 ) ) ( not ( = ?auto_305827 ?auto_305835 ) ) ( not ( = ?auto_305827 ?auto_305836 ) ) ( not ( = ?auto_305828 ?auto_305829 ) ) ( not ( = ?auto_305828 ?auto_305830 ) ) ( not ( = ?auto_305828 ?auto_305831 ) ) ( not ( = ?auto_305828 ?auto_305832 ) ) ( not ( = ?auto_305828 ?auto_305833 ) ) ( not ( = ?auto_305828 ?auto_305834 ) ) ( not ( = ?auto_305828 ?auto_305835 ) ) ( not ( = ?auto_305828 ?auto_305836 ) ) ( not ( = ?auto_305829 ?auto_305830 ) ) ( not ( = ?auto_305829 ?auto_305831 ) ) ( not ( = ?auto_305829 ?auto_305832 ) ) ( not ( = ?auto_305829 ?auto_305833 ) ) ( not ( = ?auto_305829 ?auto_305834 ) ) ( not ( = ?auto_305829 ?auto_305835 ) ) ( not ( = ?auto_305829 ?auto_305836 ) ) ( not ( = ?auto_305830 ?auto_305831 ) ) ( not ( = ?auto_305830 ?auto_305832 ) ) ( not ( = ?auto_305830 ?auto_305833 ) ) ( not ( = ?auto_305830 ?auto_305834 ) ) ( not ( = ?auto_305830 ?auto_305835 ) ) ( not ( = ?auto_305830 ?auto_305836 ) ) ( not ( = ?auto_305831 ?auto_305832 ) ) ( not ( = ?auto_305831 ?auto_305833 ) ) ( not ( = ?auto_305831 ?auto_305834 ) ) ( not ( = ?auto_305831 ?auto_305835 ) ) ( not ( = ?auto_305831 ?auto_305836 ) ) ( not ( = ?auto_305832 ?auto_305833 ) ) ( not ( = ?auto_305832 ?auto_305834 ) ) ( not ( = ?auto_305832 ?auto_305835 ) ) ( not ( = ?auto_305832 ?auto_305836 ) ) ( not ( = ?auto_305833 ?auto_305834 ) ) ( not ( = ?auto_305833 ?auto_305835 ) ) ( not ( = ?auto_305833 ?auto_305836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_305834 ?auto_305835 ?auto_305836 )
      ( MAKE-9CRATE-VERIFY ?auto_305827 ?auto_305828 ?auto_305829 ?auto_305830 ?auto_305831 ?auto_305832 ?auto_305833 ?auto_305834 ?auto_305835 ?auto_305836 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_305917 - SURFACE
      ?auto_305918 - SURFACE
      ?auto_305919 - SURFACE
      ?auto_305920 - SURFACE
      ?auto_305921 - SURFACE
      ?auto_305922 - SURFACE
      ?auto_305923 - SURFACE
      ?auto_305924 - SURFACE
      ?auto_305925 - SURFACE
      ?auto_305926 - SURFACE
    )
    :vars
    (
      ?auto_305930 - HOIST
      ?auto_305929 - PLACE
      ?auto_305928 - TRUCK
      ?auto_305927 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_305930 ?auto_305929 ) ( SURFACE-AT ?auto_305925 ?auto_305929 ) ( CLEAR ?auto_305925 ) ( IS-CRATE ?auto_305926 ) ( not ( = ?auto_305925 ?auto_305926 ) ) ( AVAILABLE ?auto_305930 ) ( IN ?auto_305926 ?auto_305928 ) ( ON ?auto_305925 ?auto_305924 ) ( not ( = ?auto_305924 ?auto_305925 ) ) ( not ( = ?auto_305924 ?auto_305926 ) ) ( TRUCK-AT ?auto_305928 ?auto_305927 ) ( not ( = ?auto_305927 ?auto_305929 ) ) ( ON ?auto_305918 ?auto_305917 ) ( ON ?auto_305919 ?auto_305918 ) ( ON ?auto_305920 ?auto_305919 ) ( ON ?auto_305921 ?auto_305920 ) ( ON ?auto_305922 ?auto_305921 ) ( ON ?auto_305923 ?auto_305922 ) ( ON ?auto_305924 ?auto_305923 ) ( not ( = ?auto_305917 ?auto_305918 ) ) ( not ( = ?auto_305917 ?auto_305919 ) ) ( not ( = ?auto_305917 ?auto_305920 ) ) ( not ( = ?auto_305917 ?auto_305921 ) ) ( not ( = ?auto_305917 ?auto_305922 ) ) ( not ( = ?auto_305917 ?auto_305923 ) ) ( not ( = ?auto_305917 ?auto_305924 ) ) ( not ( = ?auto_305917 ?auto_305925 ) ) ( not ( = ?auto_305917 ?auto_305926 ) ) ( not ( = ?auto_305918 ?auto_305919 ) ) ( not ( = ?auto_305918 ?auto_305920 ) ) ( not ( = ?auto_305918 ?auto_305921 ) ) ( not ( = ?auto_305918 ?auto_305922 ) ) ( not ( = ?auto_305918 ?auto_305923 ) ) ( not ( = ?auto_305918 ?auto_305924 ) ) ( not ( = ?auto_305918 ?auto_305925 ) ) ( not ( = ?auto_305918 ?auto_305926 ) ) ( not ( = ?auto_305919 ?auto_305920 ) ) ( not ( = ?auto_305919 ?auto_305921 ) ) ( not ( = ?auto_305919 ?auto_305922 ) ) ( not ( = ?auto_305919 ?auto_305923 ) ) ( not ( = ?auto_305919 ?auto_305924 ) ) ( not ( = ?auto_305919 ?auto_305925 ) ) ( not ( = ?auto_305919 ?auto_305926 ) ) ( not ( = ?auto_305920 ?auto_305921 ) ) ( not ( = ?auto_305920 ?auto_305922 ) ) ( not ( = ?auto_305920 ?auto_305923 ) ) ( not ( = ?auto_305920 ?auto_305924 ) ) ( not ( = ?auto_305920 ?auto_305925 ) ) ( not ( = ?auto_305920 ?auto_305926 ) ) ( not ( = ?auto_305921 ?auto_305922 ) ) ( not ( = ?auto_305921 ?auto_305923 ) ) ( not ( = ?auto_305921 ?auto_305924 ) ) ( not ( = ?auto_305921 ?auto_305925 ) ) ( not ( = ?auto_305921 ?auto_305926 ) ) ( not ( = ?auto_305922 ?auto_305923 ) ) ( not ( = ?auto_305922 ?auto_305924 ) ) ( not ( = ?auto_305922 ?auto_305925 ) ) ( not ( = ?auto_305922 ?auto_305926 ) ) ( not ( = ?auto_305923 ?auto_305924 ) ) ( not ( = ?auto_305923 ?auto_305925 ) ) ( not ( = ?auto_305923 ?auto_305926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_305924 ?auto_305925 ?auto_305926 )
      ( MAKE-9CRATE-VERIFY ?auto_305917 ?auto_305918 ?auto_305919 ?auto_305920 ?auto_305921 ?auto_305922 ?auto_305923 ?auto_305924 ?auto_305925 ?auto_305926 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306016 - SURFACE
      ?auto_306017 - SURFACE
      ?auto_306018 - SURFACE
      ?auto_306019 - SURFACE
      ?auto_306020 - SURFACE
      ?auto_306021 - SURFACE
      ?auto_306022 - SURFACE
      ?auto_306023 - SURFACE
      ?auto_306024 - SURFACE
      ?auto_306025 - SURFACE
    )
    :vars
    (
      ?auto_306030 - HOIST
      ?auto_306029 - PLACE
      ?auto_306028 - TRUCK
      ?auto_306027 - PLACE
      ?auto_306026 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_306030 ?auto_306029 ) ( SURFACE-AT ?auto_306024 ?auto_306029 ) ( CLEAR ?auto_306024 ) ( IS-CRATE ?auto_306025 ) ( not ( = ?auto_306024 ?auto_306025 ) ) ( AVAILABLE ?auto_306030 ) ( ON ?auto_306024 ?auto_306023 ) ( not ( = ?auto_306023 ?auto_306024 ) ) ( not ( = ?auto_306023 ?auto_306025 ) ) ( TRUCK-AT ?auto_306028 ?auto_306027 ) ( not ( = ?auto_306027 ?auto_306029 ) ) ( HOIST-AT ?auto_306026 ?auto_306027 ) ( LIFTING ?auto_306026 ?auto_306025 ) ( not ( = ?auto_306030 ?auto_306026 ) ) ( ON ?auto_306017 ?auto_306016 ) ( ON ?auto_306018 ?auto_306017 ) ( ON ?auto_306019 ?auto_306018 ) ( ON ?auto_306020 ?auto_306019 ) ( ON ?auto_306021 ?auto_306020 ) ( ON ?auto_306022 ?auto_306021 ) ( ON ?auto_306023 ?auto_306022 ) ( not ( = ?auto_306016 ?auto_306017 ) ) ( not ( = ?auto_306016 ?auto_306018 ) ) ( not ( = ?auto_306016 ?auto_306019 ) ) ( not ( = ?auto_306016 ?auto_306020 ) ) ( not ( = ?auto_306016 ?auto_306021 ) ) ( not ( = ?auto_306016 ?auto_306022 ) ) ( not ( = ?auto_306016 ?auto_306023 ) ) ( not ( = ?auto_306016 ?auto_306024 ) ) ( not ( = ?auto_306016 ?auto_306025 ) ) ( not ( = ?auto_306017 ?auto_306018 ) ) ( not ( = ?auto_306017 ?auto_306019 ) ) ( not ( = ?auto_306017 ?auto_306020 ) ) ( not ( = ?auto_306017 ?auto_306021 ) ) ( not ( = ?auto_306017 ?auto_306022 ) ) ( not ( = ?auto_306017 ?auto_306023 ) ) ( not ( = ?auto_306017 ?auto_306024 ) ) ( not ( = ?auto_306017 ?auto_306025 ) ) ( not ( = ?auto_306018 ?auto_306019 ) ) ( not ( = ?auto_306018 ?auto_306020 ) ) ( not ( = ?auto_306018 ?auto_306021 ) ) ( not ( = ?auto_306018 ?auto_306022 ) ) ( not ( = ?auto_306018 ?auto_306023 ) ) ( not ( = ?auto_306018 ?auto_306024 ) ) ( not ( = ?auto_306018 ?auto_306025 ) ) ( not ( = ?auto_306019 ?auto_306020 ) ) ( not ( = ?auto_306019 ?auto_306021 ) ) ( not ( = ?auto_306019 ?auto_306022 ) ) ( not ( = ?auto_306019 ?auto_306023 ) ) ( not ( = ?auto_306019 ?auto_306024 ) ) ( not ( = ?auto_306019 ?auto_306025 ) ) ( not ( = ?auto_306020 ?auto_306021 ) ) ( not ( = ?auto_306020 ?auto_306022 ) ) ( not ( = ?auto_306020 ?auto_306023 ) ) ( not ( = ?auto_306020 ?auto_306024 ) ) ( not ( = ?auto_306020 ?auto_306025 ) ) ( not ( = ?auto_306021 ?auto_306022 ) ) ( not ( = ?auto_306021 ?auto_306023 ) ) ( not ( = ?auto_306021 ?auto_306024 ) ) ( not ( = ?auto_306021 ?auto_306025 ) ) ( not ( = ?auto_306022 ?auto_306023 ) ) ( not ( = ?auto_306022 ?auto_306024 ) ) ( not ( = ?auto_306022 ?auto_306025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306023 ?auto_306024 ?auto_306025 )
      ( MAKE-9CRATE-VERIFY ?auto_306016 ?auto_306017 ?auto_306018 ?auto_306019 ?auto_306020 ?auto_306021 ?auto_306022 ?auto_306023 ?auto_306024 ?auto_306025 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306124 - SURFACE
      ?auto_306125 - SURFACE
      ?auto_306126 - SURFACE
      ?auto_306127 - SURFACE
      ?auto_306128 - SURFACE
      ?auto_306129 - SURFACE
      ?auto_306130 - SURFACE
      ?auto_306131 - SURFACE
      ?auto_306132 - SURFACE
      ?auto_306133 - SURFACE
    )
    :vars
    (
      ?auto_306137 - HOIST
      ?auto_306134 - PLACE
      ?auto_306135 - TRUCK
      ?auto_306139 - PLACE
      ?auto_306136 - HOIST
      ?auto_306138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_306137 ?auto_306134 ) ( SURFACE-AT ?auto_306132 ?auto_306134 ) ( CLEAR ?auto_306132 ) ( IS-CRATE ?auto_306133 ) ( not ( = ?auto_306132 ?auto_306133 ) ) ( AVAILABLE ?auto_306137 ) ( ON ?auto_306132 ?auto_306131 ) ( not ( = ?auto_306131 ?auto_306132 ) ) ( not ( = ?auto_306131 ?auto_306133 ) ) ( TRUCK-AT ?auto_306135 ?auto_306139 ) ( not ( = ?auto_306139 ?auto_306134 ) ) ( HOIST-AT ?auto_306136 ?auto_306139 ) ( not ( = ?auto_306137 ?auto_306136 ) ) ( AVAILABLE ?auto_306136 ) ( SURFACE-AT ?auto_306133 ?auto_306139 ) ( ON ?auto_306133 ?auto_306138 ) ( CLEAR ?auto_306133 ) ( not ( = ?auto_306132 ?auto_306138 ) ) ( not ( = ?auto_306133 ?auto_306138 ) ) ( not ( = ?auto_306131 ?auto_306138 ) ) ( ON ?auto_306125 ?auto_306124 ) ( ON ?auto_306126 ?auto_306125 ) ( ON ?auto_306127 ?auto_306126 ) ( ON ?auto_306128 ?auto_306127 ) ( ON ?auto_306129 ?auto_306128 ) ( ON ?auto_306130 ?auto_306129 ) ( ON ?auto_306131 ?auto_306130 ) ( not ( = ?auto_306124 ?auto_306125 ) ) ( not ( = ?auto_306124 ?auto_306126 ) ) ( not ( = ?auto_306124 ?auto_306127 ) ) ( not ( = ?auto_306124 ?auto_306128 ) ) ( not ( = ?auto_306124 ?auto_306129 ) ) ( not ( = ?auto_306124 ?auto_306130 ) ) ( not ( = ?auto_306124 ?auto_306131 ) ) ( not ( = ?auto_306124 ?auto_306132 ) ) ( not ( = ?auto_306124 ?auto_306133 ) ) ( not ( = ?auto_306124 ?auto_306138 ) ) ( not ( = ?auto_306125 ?auto_306126 ) ) ( not ( = ?auto_306125 ?auto_306127 ) ) ( not ( = ?auto_306125 ?auto_306128 ) ) ( not ( = ?auto_306125 ?auto_306129 ) ) ( not ( = ?auto_306125 ?auto_306130 ) ) ( not ( = ?auto_306125 ?auto_306131 ) ) ( not ( = ?auto_306125 ?auto_306132 ) ) ( not ( = ?auto_306125 ?auto_306133 ) ) ( not ( = ?auto_306125 ?auto_306138 ) ) ( not ( = ?auto_306126 ?auto_306127 ) ) ( not ( = ?auto_306126 ?auto_306128 ) ) ( not ( = ?auto_306126 ?auto_306129 ) ) ( not ( = ?auto_306126 ?auto_306130 ) ) ( not ( = ?auto_306126 ?auto_306131 ) ) ( not ( = ?auto_306126 ?auto_306132 ) ) ( not ( = ?auto_306126 ?auto_306133 ) ) ( not ( = ?auto_306126 ?auto_306138 ) ) ( not ( = ?auto_306127 ?auto_306128 ) ) ( not ( = ?auto_306127 ?auto_306129 ) ) ( not ( = ?auto_306127 ?auto_306130 ) ) ( not ( = ?auto_306127 ?auto_306131 ) ) ( not ( = ?auto_306127 ?auto_306132 ) ) ( not ( = ?auto_306127 ?auto_306133 ) ) ( not ( = ?auto_306127 ?auto_306138 ) ) ( not ( = ?auto_306128 ?auto_306129 ) ) ( not ( = ?auto_306128 ?auto_306130 ) ) ( not ( = ?auto_306128 ?auto_306131 ) ) ( not ( = ?auto_306128 ?auto_306132 ) ) ( not ( = ?auto_306128 ?auto_306133 ) ) ( not ( = ?auto_306128 ?auto_306138 ) ) ( not ( = ?auto_306129 ?auto_306130 ) ) ( not ( = ?auto_306129 ?auto_306131 ) ) ( not ( = ?auto_306129 ?auto_306132 ) ) ( not ( = ?auto_306129 ?auto_306133 ) ) ( not ( = ?auto_306129 ?auto_306138 ) ) ( not ( = ?auto_306130 ?auto_306131 ) ) ( not ( = ?auto_306130 ?auto_306132 ) ) ( not ( = ?auto_306130 ?auto_306133 ) ) ( not ( = ?auto_306130 ?auto_306138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306131 ?auto_306132 ?auto_306133 )
      ( MAKE-9CRATE-VERIFY ?auto_306124 ?auto_306125 ?auto_306126 ?auto_306127 ?auto_306128 ?auto_306129 ?auto_306130 ?auto_306131 ?auto_306132 ?auto_306133 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306233 - SURFACE
      ?auto_306234 - SURFACE
      ?auto_306235 - SURFACE
      ?auto_306236 - SURFACE
      ?auto_306237 - SURFACE
      ?auto_306238 - SURFACE
      ?auto_306239 - SURFACE
      ?auto_306240 - SURFACE
      ?auto_306241 - SURFACE
      ?auto_306242 - SURFACE
    )
    :vars
    (
      ?auto_306243 - HOIST
      ?auto_306246 - PLACE
      ?auto_306247 - PLACE
      ?auto_306248 - HOIST
      ?auto_306245 - SURFACE
      ?auto_306244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306243 ?auto_306246 ) ( SURFACE-AT ?auto_306241 ?auto_306246 ) ( CLEAR ?auto_306241 ) ( IS-CRATE ?auto_306242 ) ( not ( = ?auto_306241 ?auto_306242 ) ) ( AVAILABLE ?auto_306243 ) ( ON ?auto_306241 ?auto_306240 ) ( not ( = ?auto_306240 ?auto_306241 ) ) ( not ( = ?auto_306240 ?auto_306242 ) ) ( not ( = ?auto_306247 ?auto_306246 ) ) ( HOIST-AT ?auto_306248 ?auto_306247 ) ( not ( = ?auto_306243 ?auto_306248 ) ) ( AVAILABLE ?auto_306248 ) ( SURFACE-AT ?auto_306242 ?auto_306247 ) ( ON ?auto_306242 ?auto_306245 ) ( CLEAR ?auto_306242 ) ( not ( = ?auto_306241 ?auto_306245 ) ) ( not ( = ?auto_306242 ?auto_306245 ) ) ( not ( = ?auto_306240 ?auto_306245 ) ) ( TRUCK-AT ?auto_306244 ?auto_306246 ) ( ON ?auto_306234 ?auto_306233 ) ( ON ?auto_306235 ?auto_306234 ) ( ON ?auto_306236 ?auto_306235 ) ( ON ?auto_306237 ?auto_306236 ) ( ON ?auto_306238 ?auto_306237 ) ( ON ?auto_306239 ?auto_306238 ) ( ON ?auto_306240 ?auto_306239 ) ( not ( = ?auto_306233 ?auto_306234 ) ) ( not ( = ?auto_306233 ?auto_306235 ) ) ( not ( = ?auto_306233 ?auto_306236 ) ) ( not ( = ?auto_306233 ?auto_306237 ) ) ( not ( = ?auto_306233 ?auto_306238 ) ) ( not ( = ?auto_306233 ?auto_306239 ) ) ( not ( = ?auto_306233 ?auto_306240 ) ) ( not ( = ?auto_306233 ?auto_306241 ) ) ( not ( = ?auto_306233 ?auto_306242 ) ) ( not ( = ?auto_306233 ?auto_306245 ) ) ( not ( = ?auto_306234 ?auto_306235 ) ) ( not ( = ?auto_306234 ?auto_306236 ) ) ( not ( = ?auto_306234 ?auto_306237 ) ) ( not ( = ?auto_306234 ?auto_306238 ) ) ( not ( = ?auto_306234 ?auto_306239 ) ) ( not ( = ?auto_306234 ?auto_306240 ) ) ( not ( = ?auto_306234 ?auto_306241 ) ) ( not ( = ?auto_306234 ?auto_306242 ) ) ( not ( = ?auto_306234 ?auto_306245 ) ) ( not ( = ?auto_306235 ?auto_306236 ) ) ( not ( = ?auto_306235 ?auto_306237 ) ) ( not ( = ?auto_306235 ?auto_306238 ) ) ( not ( = ?auto_306235 ?auto_306239 ) ) ( not ( = ?auto_306235 ?auto_306240 ) ) ( not ( = ?auto_306235 ?auto_306241 ) ) ( not ( = ?auto_306235 ?auto_306242 ) ) ( not ( = ?auto_306235 ?auto_306245 ) ) ( not ( = ?auto_306236 ?auto_306237 ) ) ( not ( = ?auto_306236 ?auto_306238 ) ) ( not ( = ?auto_306236 ?auto_306239 ) ) ( not ( = ?auto_306236 ?auto_306240 ) ) ( not ( = ?auto_306236 ?auto_306241 ) ) ( not ( = ?auto_306236 ?auto_306242 ) ) ( not ( = ?auto_306236 ?auto_306245 ) ) ( not ( = ?auto_306237 ?auto_306238 ) ) ( not ( = ?auto_306237 ?auto_306239 ) ) ( not ( = ?auto_306237 ?auto_306240 ) ) ( not ( = ?auto_306237 ?auto_306241 ) ) ( not ( = ?auto_306237 ?auto_306242 ) ) ( not ( = ?auto_306237 ?auto_306245 ) ) ( not ( = ?auto_306238 ?auto_306239 ) ) ( not ( = ?auto_306238 ?auto_306240 ) ) ( not ( = ?auto_306238 ?auto_306241 ) ) ( not ( = ?auto_306238 ?auto_306242 ) ) ( not ( = ?auto_306238 ?auto_306245 ) ) ( not ( = ?auto_306239 ?auto_306240 ) ) ( not ( = ?auto_306239 ?auto_306241 ) ) ( not ( = ?auto_306239 ?auto_306242 ) ) ( not ( = ?auto_306239 ?auto_306245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306240 ?auto_306241 ?auto_306242 )
      ( MAKE-9CRATE-VERIFY ?auto_306233 ?auto_306234 ?auto_306235 ?auto_306236 ?auto_306237 ?auto_306238 ?auto_306239 ?auto_306240 ?auto_306241 ?auto_306242 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306342 - SURFACE
      ?auto_306343 - SURFACE
      ?auto_306344 - SURFACE
      ?auto_306345 - SURFACE
      ?auto_306346 - SURFACE
      ?auto_306347 - SURFACE
      ?auto_306348 - SURFACE
      ?auto_306349 - SURFACE
      ?auto_306350 - SURFACE
      ?auto_306351 - SURFACE
    )
    :vars
    (
      ?auto_306357 - HOIST
      ?auto_306353 - PLACE
      ?auto_306352 - PLACE
      ?auto_306356 - HOIST
      ?auto_306354 - SURFACE
      ?auto_306355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306357 ?auto_306353 ) ( IS-CRATE ?auto_306351 ) ( not ( = ?auto_306350 ?auto_306351 ) ) ( not ( = ?auto_306349 ?auto_306350 ) ) ( not ( = ?auto_306349 ?auto_306351 ) ) ( not ( = ?auto_306352 ?auto_306353 ) ) ( HOIST-AT ?auto_306356 ?auto_306352 ) ( not ( = ?auto_306357 ?auto_306356 ) ) ( AVAILABLE ?auto_306356 ) ( SURFACE-AT ?auto_306351 ?auto_306352 ) ( ON ?auto_306351 ?auto_306354 ) ( CLEAR ?auto_306351 ) ( not ( = ?auto_306350 ?auto_306354 ) ) ( not ( = ?auto_306351 ?auto_306354 ) ) ( not ( = ?auto_306349 ?auto_306354 ) ) ( TRUCK-AT ?auto_306355 ?auto_306353 ) ( SURFACE-AT ?auto_306349 ?auto_306353 ) ( CLEAR ?auto_306349 ) ( LIFTING ?auto_306357 ?auto_306350 ) ( IS-CRATE ?auto_306350 ) ( ON ?auto_306343 ?auto_306342 ) ( ON ?auto_306344 ?auto_306343 ) ( ON ?auto_306345 ?auto_306344 ) ( ON ?auto_306346 ?auto_306345 ) ( ON ?auto_306347 ?auto_306346 ) ( ON ?auto_306348 ?auto_306347 ) ( ON ?auto_306349 ?auto_306348 ) ( not ( = ?auto_306342 ?auto_306343 ) ) ( not ( = ?auto_306342 ?auto_306344 ) ) ( not ( = ?auto_306342 ?auto_306345 ) ) ( not ( = ?auto_306342 ?auto_306346 ) ) ( not ( = ?auto_306342 ?auto_306347 ) ) ( not ( = ?auto_306342 ?auto_306348 ) ) ( not ( = ?auto_306342 ?auto_306349 ) ) ( not ( = ?auto_306342 ?auto_306350 ) ) ( not ( = ?auto_306342 ?auto_306351 ) ) ( not ( = ?auto_306342 ?auto_306354 ) ) ( not ( = ?auto_306343 ?auto_306344 ) ) ( not ( = ?auto_306343 ?auto_306345 ) ) ( not ( = ?auto_306343 ?auto_306346 ) ) ( not ( = ?auto_306343 ?auto_306347 ) ) ( not ( = ?auto_306343 ?auto_306348 ) ) ( not ( = ?auto_306343 ?auto_306349 ) ) ( not ( = ?auto_306343 ?auto_306350 ) ) ( not ( = ?auto_306343 ?auto_306351 ) ) ( not ( = ?auto_306343 ?auto_306354 ) ) ( not ( = ?auto_306344 ?auto_306345 ) ) ( not ( = ?auto_306344 ?auto_306346 ) ) ( not ( = ?auto_306344 ?auto_306347 ) ) ( not ( = ?auto_306344 ?auto_306348 ) ) ( not ( = ?auto_306344 ?auto_306349 ) ) ( not ( = ?auto_306344 ?auto_306350 ) ) ( not ( = ?auto_306344 ?auto_306351 ) ) ( not ( = ?auto_306344 ?auto_306354 ) ) ( not ( = ?auto_306345 ?auto_306346 ) ) ( not ( = ?auto_306345 ?auto_306347 ) ) ( not ( = ?auto_306345 ?auto_306348 ) ) ( not ( = ?auto_306345 ?auto_306349 ) ) ( not ( = ?auto_306345 ?auto_306350 ) ) ( not ( = ?auto_306345 ?auto_306351 ) ) ( not ( = ?auto_306345 ?auto_306354 ) ) ( not ( = ?auto_306346 ?auto_306347 ) ) ( not ( = ?auto_306346 ?auto_306348 ) ) ( not ( = ?auto_306346 ?auto_306349 ) ) ( not ( = ?auto_306346 ?auto_306350 ) ) ( not ( = ?auto_306346 ?auto_306351 ) ) ( not ( = ?auto_306346 ?auto_306354 ) ) ( not ( = ?auto_306347 ?auto_306348 ) ) ( not ( = ?auto_306347 ?auto_306349 ) ) ( not ( = ?auto_306347 ?auto_306350 ) ) ( not ( = ?auto_306347 ?auto_306351 ) ) ( not ( = ?auto_306347 ?auto_306354 ) ) ( not ( = ?auto_306348 ?auto_306349 ) ) ( not ( = ?auto_306348 ?auto_306350 ) ) ( not ( = ?auto_306348 ?auto_306351 ) ) ( not ( = ?auto_306348 ?auto_306354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306349 ?auto_306350 ?auto_306351 )
      ( MAKE-9CRATE-VERIFY ?auto_306342 ?auto_306343 ?auto_306344 ?auto_306345 ?auto_306346 ?auto_306347 ?auto_306348 ?auto_306349 ?auto_306350 ?auto_306351 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306451 - SURFACE
      ?auto_306452 - SURFACE
      ?auto_306453 - SURFACE
      ?auto_306454 - SURFACE
      ?auto_306455 - SURFACE
      ?auto_306456 - SURFACE
      ?auto_306457 - SURFACE
      ?auto_306458 - SURFACE
      ?auto_306459 - SURFACE
      ?auto_306460 - SURFACE
    )
    :vars
    (
      ?auto_306464 - HOIST
      ?auto_306465 - PLACE
      ?auto_306462 - PLACE
      ?auto_306466 - HOIST
      ?auto_306463 - SURFACE
      ?auto_306461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306464 ?auto_306465 ) ( IS-CRATE ?auto_306460 ) ( not ( = ?auto_306459 ?auto_306460 ) ) ( not ( = ?auto_306458 ?auto_306459 ) ) ( not ( = ?auto_306458 ?auto_306460 ) ) ( not ( = ?auto_306462 ?auto_306465 ) ) ( HOIST-AT ?auto_306466 ?auto_306462 ) ( not ( = ?auto_306464 ?auto_306466 ) ) ( AVAILABLE ?auto_306466 ) ( SURFACE-AT ?auto_306460 ?auto_306462 ) ( ON ?auto_306460 ?auto_306463 ) ( CLEAR ?auto_306460 ) ( not ( = ?auto_306459 ?auto_306463 ) ) ( not ( = ?auto_306460 ?auto_306463 ) ) ( not ( = ?auto_306458 ?auto_306463 ) ) ( TRUCK-AT ?auto_306461 ?auto_306465 ) ( SURFACE-AT ?auto_306458 ?auto_306465 ) ( CLEAR ?auto_306458 ) ( IS-CRATE ?auto_306459 ) ( AVAILABLE ?auto_306464 ) ( IN ?auto_306459 ?auto_306461 ) ( ON ?auto_306452 ?auto_306451 ) ( ON ?auto_306453 ?auto_306452 ) ( ON ?auto_306454 ?auto_306453 ) ( ON ?auto_306455 ?auto_306454 ) ( ON ?auto_306456 ?auto_306455 ) ( ON ?auto_306457 ?auto_306456 ) ( ON ?auto_306458 ?auto_306457 ) ( not ( = ?auto_306451 ?auto_306452 ) ) ( not ( = ?auto_306451 ?auto_306453 ) ) ( not ( = ?auto_306451 ?auto_306454 ) ) ( not ( = ?auto_306451 ?auto_306455 ) ) ( not ( = ?auto_306451 ?auto_306456 ) ) ( not ( = ?auto_306451 ?auto_306457 ) ) ( not ( = ?auto_306451 ?auto_306458 ) ) ( not ( = ?auto_306451 ?auto_306459 ) ) ( not ( = ?auto_306451 ?auto_306460 ) ) ( not ( = ?auto_306451 ?auto_306463 ) ) ( not ( = ?auto_306452 ?auto_306453 ) ) ( not ( = ?auto_306452 ?auto_306454 ) ) ( not ( = ?auto_306452 ?auto_306455 ) ) ( not ( = ?auto_306452 ?auto_306456 ) ) ( not ( = ?auto_306452 ?auto_306457 ) ) ( not ( = ?auto_306452 ?auto_306458 ) ) ( not ( = ?auto_306452 ?auto_306459 ) ) ( not ( = ?auto_306452 ?auto_306460 ) ) ( not ( = ?auto_306452 ?auto_306463 ) ) ( not ( = ?auto_306453 ?auto_306454 ) ) ( not ( = ?auto_306453 ?auto_306455 ) ) ( not ( = ?auto_306453 ?auto_306456 ) ) ( not ( = ?auto_306453 ?auto_306457 ) ) ( not ( = ?auto_306453 ?auto_306458 ) ) ( not ( = ?auto_306453 ?auto_306459 ) ) ( not ( = ?auto_306453 ?auto_306460 ) ) ( not ( = ?auto_306453 ?auto_306463 ) ) ( not ( = ?auto_306454 ?auto_306455 ) ) ( not ( = ?auto_306454 ?auto_306456 ) ) ( not ( = ?auto_306454 ?auto_306457 ) ) ( not ( = ?auto_306454 ?auto_306458 ) ) ( not ( = ?auto_306454 ?auto_306459 ) ) ( not ( = ?auto_306454 ?auto_306460 ) ) ( not ( = ?auto_306454 ?auto_306463 ) ) ( not ( = ?auto_306455 ?auto_306456 ) ) ( not ( = ?auto_306455 ?auto_306457 ) ) ( not ( = ?auto_306455 ?auto_306458 ) ) ( not ( = ?auto_306455 ?auto_306459 ) ) ( not ( = ?auto_306455 ?auto_306460 ) ) ( not ( = ?auto_306455 ?auto_306463 ) ) ( not ( = ?auto_306456 ?auto_306457 ) ) ( not ( = ?auto_306456 ?auto_306458 ) ) ( not ( = ?auto_306456 ?auto_306459 ) ) ( not ( = ?auto_306456 ?auto_306460 ) ) ( not ( = ?auto_306456 ?auto_306463 ) ) ( not ( = ?auto_306457 ?auto_306458 ) ) ( not ( = ?auto_306457 ?auto_306459 ) ) ( not ( = ?auto_306457 ?auto_306460 ) ) ( not ( = ?auto_306457 ?auto_306463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306458 ?auto_306459 ?auto_306460 )
      ( MAKE-9CRATE-VERIFY ?auto_306451 ?auto_306452 ?auto_306453 ?auto_306454 ?auto_306455 ?auto_306456 ?auto_306457 ?auto_306458 ?auto_306459 ?auto_306460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_310101 - SURFACE
      ?auto_310102 - SURFACE
    )
    :vars
    (
      ?auto_310109 - HOIST
      ?auto_310105 - PLACE
      ?auto_310106 - SURFACE
      ?auto_310103 - PLACE
      ?auto_310108 - HOIST
      ?auto_310104 - SURFACE
      ?auto_310107 - TRUCK
      ?auto_310110 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_310109 ?auto_310105 ) ( SURFACE-AT ?auto_310101 ?auto_310105 ) ( CLEAR ?auto_310101 ) ( IS-CRATE ?auto_310102 ) ( not ( = ?auto_310101 ?auto_310102 ) ) ( ON ?auto_310101 ?auto_310106 ) ( not ( = ?auto_310106 ?auto_310101 ) ) ( not ( = ?auto_310106 ?auto_310102 ) ) ( not ( = ?auto_310103 ?auto_310105 ) ) ( HOIST-AT ?auto_310108 ?auto_310103 ) ( not ( = ?auto_310109 ?auto_310108 ) ) ( AVAILABLE ?auto_310108 ) ( SURFACE-AT ?auto_310102 ?auto_310103 ) ( ON ?auto_310102 ?auto_310104 ) ( CLEAR ?auto_310102 ) ( not ( = ?auto_310101 ?auto_310104 ) ) ( not ( = ?auto_310102 ?auto_310104 ) ) ( not ( = ?auto_310106 ?auto_310104 ) ) ( TRUCK-AT ?auto_310107 ?auto_310105 ) ( LIFTING ?auto_310109 ?auto_310110 ) ( IS-CRATE ?auto_310110 ) ( not ( = ?auto_310101 ?auto_310110 ) ) ( not ( = ?auto_310102 ?auto_310110 ) ) ( not ( = ?auto_310106 ?auto_310110 ) ) ( not ( = ?auto_310104 ?auto_310110 ) ) )
    :subtasks
    ( ( !LOAD ?auto_310109 ?auto_310110 ?auto_310107 ?auto_310105 )
      ( MAKE-1CRATE ?auto_310101 ?auto_310102 )
      ( MAKE-1CRATE-VERIFY ?auto_310101 ?auto_310102 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312004 - SURFACE
      ?auto_312005 - SURFACE
      ?auto_312006 - SURFACE
      ?auto_312007 - SURFACE
      ?auto_312008 - SURFACE
      ?auto_312009 - SURFACE
      ?auto_312010 - SURFACE
      ?auto_312011 - SURFACE
      ?auto_312012 - SURFACE
      ?auto_312013 - SURFACE
      ?auto_312014 - SURFACE
    )
    :vars
    (
      ?auto_312016 - HOIST
      ?auto_312015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312016 ?auto_312015 ) ( SURFACE-AT ?auto_312013 ?auto_312015 ) ( CLEAR ?auto_312013 ) ( LIFTING ?auto_312016 ?auto_312014 ) ( IS-CRATE ?auto_312014 ) ( not ( = ?auto_312013 ?auto_312014 ) ) ( ON ?auto_312005 ?auto_312004 ) ( ON ?auto_312006 ?auto_312005 ) ( ON ?auto_312007 ?auto_312006 ) ( ON ?auto_312008 ?auto_312007 ) ( ON ?auto_312009 ?auto_312008 ) ( ON ?auto_312010 ?auto_312009 ) ( ON ?auto_312011 ?auto_312010 ) ( ON ?auto_312012 ?auto_312011 ) ( ON ?auto_312013 ?auto_312012 ) ( not ( = ?auto_312004 ?auto_312005 ) ) ( not ( = ?auto_312004 ?auto_312006 ) ) ( not ( = ?auto_312004 ?auto_312007 ) ) ( not ( = ?auto_312004 ?auto_312008 ) ) ( not ( = ?auto_312004 ?auto_312009 ) ) ( not ( = ?auto_312004 ?auto_312010 ) ) ( not ( = ?auto_312004 ?auto_312011 ) ) ( not ( = ?auto_312004 ?auto_312012 ) ) ( not ( = ?auto_312004 ?auto_312013 ) ) ( not ( = ?auto_312004 ?auto_312014 ) ) ( not ( = ?auto_312005 ?auto_312006 ) ) ( not ( = ?auto_312005 ?auto_312007 ) ) ( not ( = ?auto_312005 ?auto_312008 ) ) ( not ( = ?auto_312005 ?auto_312009 ) ) ( not ( = ?auto_312005 ?auto_312010 ) ) ( not ( = ?auto_312005 ?auto_312011 ) ) ( not ( = ?auto_312005 ?auto_312012 ) ) ( not ( = ?auto_312005 ?auto_312013 ) ) ( not ( = ?auto_312005 ?auto_312014 ) ) ( not ( = ?auto_312006 ?auto_312007 ) ) ( not ( = ?auto_312006 ?auto_312008 ) ) ( not ( = ?auto_312006 ?auto_312009 ) ) ( not ( = ?auto_312006 ?auto_312010 ) ) ( not ( = ?auto_312006 ?auto_312011 ) ) ( not ( = ?auto_312006 ?auto_312012 ) ) ( not ( = ?auto_312006 ?auto_312013 ) ) ( not ( = ?auto_312006 ?auto_312014 ) ) ( not ( = ?auto_312007 ?auto_312008 ) ) ( not ( = ?auto_312007 ?auto_312009 ) ) ( not ( = ?auto_312007 ?auto_312010 ) ) ( not ( = ?auto_312007 ?auto_312011 ) ) ( not ( = ?auto_312007 ?auto_312012 ) ) ( not ( = ?auto_312007 ?auto_312013 ) ) ( not ( = ?auto_312007 ?auto_312014 ) ) ( not ( = ?auto_312008 ?auto_312009 ) ) ( not ( = ?auto_312008 ?auto_312010 ) ) ( not ( = ?auto_312008 ?auto_312011 ) ) ( not ( = ?auto_312008 ?auto_312012 ) ) ( not ( = ?auto_312008 ?auto_312013 ) ) ( not ( = ?auto_312008 ?auto_312014 ) ) ( not ( = ?auto_312009 ?auto_312010 ) ) ( not ( = ?auto_312009 ?auto_312011 ) ) ( not ( = ?auto_312009 ?auto_312012 ) ) ( not ( = ?auto_312009 ?auto_312013 ) ) ( not ( = ?auto_312009 ?auto_312014 ) ) ( not ( = ?auto_312010 ?auto_312011 ) ) ( not ( = ?auto_312010 ?auto_312012 ) ) ( not ( = ?auto_312010 ?auto_312013 ) ) ( not ( = ?auto_312010 ?auto_312014 ) ) ( not ( = ?auto_312011 ?auto_312012 ) ) ( not ( = ?auto_312011 ?auto_312013 ) ) ( not ( = ?auto_312011 ?auto_312014 ) ) ( not ( = ?auto_312012 ?auto_312013 ) ) ( not ( = ?auto_312012 ?auto_312014 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_312013 ?auto_312014 )
      ( MAKE-10CRATE-VERIFY ?auto_312004 ?auto_312005 ?auto_312006 ?auto_312007 ?auto_312008 ?auto_312009 ?auto_312010 ?auto_312011 ?auto_312012 ?auto_312013 ?auto_312014 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312098 - SURFACE
      ?auto_312099 - SURFACE
      ?auto_312100 - SURFACE
      ?auto_312101 - SURFACE
      ?auto_312102 - SURFACE
      ?auto_312103 - SURFACE
      ?auto_312104 - SURFACE
      ?auto_312105 - SURFACE
      ?auto_312106 - SURFACE
      ?auto_312107 - SURFACE
      ?auto_312108 - SURFACE
    )
    :vars
    (
      ?auto_312109 - HOIST
      ?auto_312111 - PLACE
      ?auto_312110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312109 ?auto_312111 ) ( SURFACE-AT ?auto_312107 ?auto_312111 ) ( CLEAR ?auto_312107 ) ( IS-CRATE ?auto_312108 ) ( not ( = ?auto_312107 ?auto_312108 ) ) ( TRUCK-AT ?auto_312110 ?auto_312111 ) ( AVAILABLE ?auto_312109 ) ( IN ?auto_312108 ?auto_312110 ) ( ON ?auto_312107 ?auto_312106 ) ( not ( = ?auto_312106 ?auto_312107 ) ) ( not ( = ?auto_312106 ?auto_312108 ) ) ( ON ?auto_312099 ?auto_312098 ) ( ON ?auto_312100 ?auto_312099 ) ( ON ?auto_312101 ?auto_312100 ) ( ON ?auto_312102 ?auto_312101 ) ( ON ?auto_312103 ?auto_312102 ) ( ON ?auto_312104 ?auto_312103 ) ( ON ?auto_312105 ?auto_312104 ) ( ON ?auto_312106 ?auto_312105 ) ( not ( = ?auto_312098 ?auto_312099 ) ) ( not ( = ?auto_312098 ?auto_312100 ) ) ( not ( = ?auto_312098 ?auto_312101 ) ) ( not ( = ?auto_312098 ?auto_312102 ) ) ( not ( = ?auto_312098 ?auto_312103 ) ) ( not ( = ?auto_312098 ?auto_312104 ) ) ( not ( = ?auto_312098 ?auto_312105 ) ) ( not ( = ?auto_312098 ?auto_312106 ) ) ( not ( = ?auto_312098 ?auto_312107 ) ) ( not ( = ?auto_312098 ?auto_312108 ) ) ( not ( = ?auto_312099 ?auto_312100 ) ) ( not ( = ?auto_312099 ?auto_312101 ) ) ( not ( = ?auto_312099 ?auto_312102 ) ) ( not ( = ?auto_312099 ?auto_312103 ) ) ( not ( = ?auto_312099 ?auto_312104 ) ) ( not ( = ?auto_312099 ?auto_312105 ) ) ( not ( = ?auto_312099 ?auto_312106 ) ) ( not ( = ?auto_312099 ?auto_312107 ) ) ( not ( = ?auto_312099 ?auto_312108 ) ) ( not ( = ?auto_312100 ?auto_312101 ) ) ( not ( = ?auto_312100 ?auto_312102 ) ) ( not ( = ?auto_312100 ?auto_312103 ) ) ( not ( = ?auto_312100 ?auto_312104 ) ) ( not ( = ?auto_312100 ?auto_312105 ) ) ( not ( = ?auto_312100 ?auto_312106 ) ) ( not ( = ?auto_312100 ?auto_312107 ) ) ( not ( = ?auto_312100 ?auto_312108 ) ) ( not ( = ?auto_312101 ?auto_312102 ) ) ( not ( = ?auto_312101 ?auto_312103 ) ) ( not ( = ?auto_312101 ?auto_312104 ) ) ( not ( = ?auto_312101 ?auto_312105 ) ) ( not ( = ?auto_312101 ?auto_312106 ) ) ( not ( = ?auto_312101 ?auto_312107 ) ) ( not ( = ?auto_312101 ?auto_312108 ) ) ( not ( = ?auto_312102 ?auto_312103 ) ) ( not ( = ?auto_312102 ?auto_312104 ) ) ( not ( = ?auto_312102 ?auto_312105 ) ) ( not ( = ?auto_312102 ?auto_312106 ) ) ( not ( = ?auto_312102 ?auto_312107 ) ) ( not ( = ?auto_312102 ?auto_312108 ) ) ( not ( = ?auto_312103 ?auto_312104 ) ) ( not ( = ?auto_312103 ?auto_312105 ) ) ( not ( = ?auto_312103 ?auto_312106 ) ) ( not ( = ?auto_312103 ?auto_312107 ) ) ( not ( = ?auto_312103 ?auto_312108 ) ) ( not ( = ?auto_312104 ?auto_312105 ) ) ( not ( = ?auto_312104 ?auto_312106 ) ) ( not ( = ?auto_312104 ?auto_312107 ) ) ( not ( = ?auto_312104 ?auto_312108 ) ) ( not ( = ?auto_312105 ?auto_312106 ) ) ( not ( = ?auto_312105 ?auto_312107 ) ) ( not ( = ?auto_312105 ?auto_312108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312106 ?auto_312107 ?auto_312108 )
      ( MAKE-10CRATE-VERIFY ?auto_312098 ?auto_312099 ?auto_312100 ?auto_312101 ?auto_312102 ?auto_312103 ?auto_312104 ?auto_312105 ?auto_312106 ?auto_312107 ?auto_312108 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312203 - SURFACE
      ?auto_312204 - SURFACE
      ?auto_312205 - SURFACE
      ?auto_312206 - SURFACE
      ?auto_312207 - SURFACE
      ?auto_312208 - SURFACE
      ?auto_312209 - SURFACE
      ?auto_312210 - SURFACE
      ?auto_312211 - SURFACE
      ?auto_312212 - SURFACE
      ?auto_312213 - SURFACE
    )
    :vars
    (
      ?auto_312214 - HOIST
      ?auto_312216 - PLACE
      ?auto_312217 - TRUCK
      ?auto_312215 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312214 ?auto_312216 ) ( SURFACE-AT ?auto_312212 ?auto_312216 ) ( CLEAR ?auto_312212 ) ( IS-CRATE ?auto_312213 ) ( not ( = ?auto_312212 ?auto_312213 ) ) ( AVAILABLE ?auto_312214 ) ( IN ?auto_312213 ?auto_312217 ) ( ON ?auto_312212 ?auto_312211 ) ( not ( = ?auto_312211 ?auto_312212 ) ) ( not ( = ?auto_312211 ?auto_312213 ) ) ( TRUCK-AT ?auto_312217 ?auto_312215 ) ( not ( = ?auto_312215 ?auto_312216 ) ) ( ON ?auto_312204 ?auto_312203 ) ( ON ?auto_312205 ?auto_312204 ) ( ON ?auto_312206 ?auto_312205 ) ( ON ?auto_312207 ?auto_312206 ) ( ON ?auto_312208 ?auto_312207 ) ( ON ?auto_312209 ?auto_312208 ) ( ON ?auto_312210 ?auto_312209 ) ( ON ?auto_312211 ?auto_312210 ) ( not ( = ?auto_312203 ?auto_312204 ) ) ( not ( = ?auto_312203 ?auto_312205 ) ) ( not ( = ?auto_312203 ?auto_312206 ) ) ( not ( = ?auto_312203 ?auto_312207 ) ) ( not ( = ?auto_312203 ?auto_312208 ) ) ( not ( = ?auto_312203 ?auto_312209 ) ) ( not ( = ?auto_312203 ?auto_312210 ) ) ( not ( = ?auto_312203 ?auto_312211 ) ) ( not ( = ?auto_312203 ?auto_312212 ) ) ( not ( = ?auto_312203 ?auto_312213 ) ) ( not ( = ?auto_312204 ?auto_312205 ) ) ( not ( = ?auto_312204 ?auto_312206 ) ) ( not ( = ?auto_312204 ?auto_312207 ) ) ( not ( = ?auto_312204 ?auto_312208 ) ) ( not ( = ?auto_312204 ?auto_312209 ) ) ( not ( = ?auto_312204 ?auto_312210 ) ) ( not ( = ?auto_312204 ?auto_312211 ) ) ( not ( = ?auto_312204 ?auto_312212 ) ) ( not ( = ?auto_312204 ?auto_312213 ) ) ( not ( = ?auto_312205 ?auto_312206 ) ) ( not ( = ?auto_312205 ?auto_312207 ) ) ( not ( = ?auto_312205 ?auto_312208 ) ) ( not ( = ?auto_312205 ?auto_312209 ) ) ( not ( = ?auto_312205 ?auto_312210 ) ) ( not ( = ?auto_312205 ?auto_312211 ) ) ( not ( = ?auto_312205 ?auto_312212 ) ) ( not ( = ?auto_312205 ?auto_312213 ) ) ( not ( = ?auto_312206 ?auto_312207 ) ) ( not ( = ?auto_312206 ?auto_312208 ) ) ( not ( = ?auto_312206 ?auto_312209 ) ) ( not ( = ?auto_312206 ?auto_312210 ) ) ( not ( = ?auto_312206 ?auto_312211 ) ) ( not ( = ?auto_312206 ?auto_312212 ) ) ( not ( = ?auto_312206 ?auto_312213 ) ) ( not ( = ?auto_312207 ?auto_312208 ) ) ( not ( = ?auto_312207 ?auto_312209 ) ) ( not ( = ?auto_312207 ?auto_312210 ) ) ( not ( = ?auto_312207 ?auto_312211 ) ) ( not ( = ?auto_312207 ?auto_312212 ) ) ( not ( = ?auto_312207 ?auto_312213 ) ) ( not ( = ?auto_312208 ?auto_312209 ) ) ( not ( = ?auto_312208 ?auto_312210 ) ) ( not ( = ?auto_312208 ?auto_312211 ) ) ( not ( = ?auto_312208 ?auto_312212 ) ) ( not ( = ?auto_312208 ?auto_312213 ) ) ( not ( = ?auto_312209 ?auto_312210 ) ) ( not ( = ?auto_312209 ?auto_312211 ) ) ( not ( = ?auto_312209 ?auto_312212 ) ) ( not ( = ?auto_312209 ?auto_312213 ) ) ( not ( = ?auto_312210 ?auto_312211 ) ) ( not ( = ?auto_312210 ?auto_312212 ) ) ( not ( = ?auto_312210 ?auto_312213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312211 ?auto_312212 ?auto_312213 )
      ( MAKE-10CRATE-VERIFY ?auto_312203 ?auto_312204 ?auto_312205 ?auto_312206 ?auto_312207 ?auto_312208 ?auto_312209 ?auto_312210 ?auto_312211 ?auto_312212 ?auto_312213 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312318 - SURFACE
      ?auto_312319 - SURFACE
      ?auto_312320 - SURFACE
      ?auto_312321 - SURFACE
      ?auto_312322 - SURFACE
      ?auto_312323 - SURFACE
      ?auto_312324 - SURFACE
      ?auto_312325 - SURFACE
      ?auto_312326 - SURFACE
      ?auto_312327 - SURFACE
      ?auto_312328 - SURFACE
    )
    :vars
    (
      ?auto_312329 - HOIST
      ?auto_312331 - PLACE
      ?auto_312332 - TRUCK
      ?auto_312330 - PLACE
      ?auto_312333 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_312329 ?auto_312331 ) ( SURFACE-AT ?auto_312327 ?auto_312331 ) ( CLEAR ?auto_312327 ) ( IS-CRATE ?auto_312328 ) ( not ( = ?auto_312327 ?auto_312328 ) ) ( AVAILABLE ?auto_312329 ) ( ON ?auto_312327 ?auto_312326 ) ( not ( = ?auto_312326 ?auto_312327 ) ) ( not ( = ?auto_312326 ?auto_312328 ) ) ( TRUCK-AT ?auto_312332 ?auto_312330 ) ( not ( = ?auto_312330 ?auto_312331 ) ) ( HOIST-AT ?auto_312333 ?auto_312330 ) ( LIFTING ?auto_312333 ?auto_312328 ) ( not ( = ?auto_312329 ?auto_312333 ) ) ( ON ?auto_312319 ?auto_312318 ) ( ON ?auto_312320 ?auto_312319 ) ( ON ?auto_312321 ?auto_312320 ) ( ON ?auto_312322 ?auto_312321 ) ( ON ?auto_312323 ?auto_312322 ) ( ON ?auto_312324 ?auto_312323 ) ( ON ?auto_312325 ?auto_312324 ) ( ON ?auto_312326 ?auto_312325 ) ( not ( = ?auto_312318 ?auto_312319 ) ) ( not ( = ?auto_312318 ?auto_312320 ) ) ( not ( = ?auto_312318 ?auto_312321 ) ) ( not ( = ?auto_312318 ?auto_312322 ) ) ( not ( = ?auto_312318 ?auto_312323 ) ) ( not ( = ?auto_312318 ?auto_312324 ) ) ( not ( = ?auto_312318 ?auto_312325 ) ) ( not ( = ?auto_312318 ?auto_312326 ) ) ( not ( = ?auto_312318 ?auto_312327 ) ) ( not ( = ?auto_312318 ?auto_312328 ) ) ( not ( = ?auto_312319 ?auto_312320 ) ) ( not ( = ?auto_312319 ?auto_312321 ) ) ( not ( = ?auto_312319 ?auto_312322 ) ) ( not ( = ?auto_312319 ?auto_312323 ) ) ( not ( = ?auto_312319 ?auto_312324 ) ) ( not ( = ?auto_312319 ?auto_312325 ) ) ( not ( = ?auto_312319 ?auto_312326 ) ) ( not ( = ?auto_312319 ?auto_312327 ) ) ( not ( = ?auto_312319 ?auto_312328 ) ) ( not ( = ?auto_312320 ?auto_312321 ) ) ( not ( = ?auto_312320 ?auto_312322 ) ) ( not ( = ?auto_312320 ?auto_312323 ) ) ( not ( = ?auto_312320 ?auto_312324 ) ) ( not ( = ?auto_312320 ?auto_312325 ) ) ( not ( = ?auto_312320 ?auto_312326 ) ) ( not ( = ?auto_312320 ?auto_312327 ) ) ( not ( = ?auto_312320 ?auto_312328 ) ) ( not ( = ?auto_312321 ?auto_312322 ) ) ( not ( = ?auto_312321 ?auto_312323 ) ) ( not ( = ?auto_312321 ?auto_312324 ) ) ( not ( = ?auto_312321 ?auto_312325 ) ) ( not ( = ?auto_312321 ?auto_312326 ) ) ( not ( = ?auto_312321 ?auto_312327 ) ) ( not ( = ?auto_312321 ?auto_312328 ) ) ( not ( = ?auto_312322 ?auto_312323 ) ) ( not ( = ?auto_312322 ?auto_312324 ) ) ( not ( = ?auto_312322 ?auto_312325 ) ) ( not ( = ?auto_312322 ?auto_312326 ) ) ( not ( = ?auto_312322 ?auto_312327 ) ) ( not ( = ?auto_312322 ?auto_312328 ) ) ( not ( = ?auto_312323 ?auto_312324 ) ) ( not ( = ?auto_312323 ?auto_312325 ) ) ( not ( = ?auto_312323 ?auto_312326 ) ) ( not ( = ?auto_312323 ?auto_312327 ) ) ( not ( = ?auto_312323 ?auto_312328 ) ) ( not ( = ?auto_312324 ?auto_312325 ) ) ( not ( = ?auto_312324 ?auto_312326 ) ) ( not ( = ?auto_312324 ?auto_312327 ) ) ( not ( = ?auto_312324 ?auto_312328 ) ) ( not ( = ?auto_312325 ?auto_312326 ) ) ( not ( = ?auto_312325 ?auto_312327 ) ) ( not ( = ?auto_312325 ?auto_312328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312326 ?auto_312327 ?auto_312328 )
      ( MAKE-10CRATE-VERIFY ?auto_312318 ?auto_312319 ?auto_312320 ?auto_312321 ?auto_312322 ?auto_312323 ?auto_312324 ?auto_312325 ?auto_312326 ?auto_312327 ?auto_312328 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312443 - SURFACE
      ?auto_312444 - SURFACE
      ?auto_312445 - SURFACE
      ?auto_312446 - SURFACE
      ?auto_312447 - SURFACE
      ?auto_312448 - SURFACE
      ?auto_312449 - SURFACE
      ?auto_312450 - SURFACE
      ?auto_312451 - SURFACE
      ?auto_312452 - SURFACE
      ?auto_312453 - SURFACE
    )
    :vars
    (
      ?auto_312454 - HOIST
      ?auto_312456 - PLACE
      ?auto_312458 - TRUCK
      ?auto_312457 - PLACE
      ?auto_312459 - HOIST
      ?auto_312455 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312454 ?auto_312456 ) ( SURFACE-AT ?auto_312452 ?auto_312456 ) ( CLEAR ?auto_312452 ) ( IS-CRATE ?auto_312453 ) ( not ( = ?auto_312452 ?auto_312453 ) ) ( AVAILABLE ?auto_312454 ) ( ON ?auto_312452 ?auto_312451 ) ( not ( = ?auto_312451 ?auto_312452 ) ) ( not ( = ?auto_312451 ?auto_312453 ) ) ( TRUCK-AT ?auto_312458 ?auto_312457 ) ( not ( = ?auto_312457 ?auto_312456 ) ) ( HOIST-AT ?auto_312459 ?auto_312457 ) ( not ( = ?auto_312454 ?auto_312459 ) ) ( AVAILABLE ?auto_312459 ) ( SURFACE-AT ?auto_312453 ?auto_312457 ) ( ON ?auto_312453 ?auto_312455 ) ( CLEAR ?auto_312453 ) ( not ( = ?auto_312452 ?auto_312455 ) ) ( not ( = ?auto_312453 ?auto_312455 ) ) ( not ( = ?auto_312451 ?auto_312455 ) ) ( ON ?auto_312444 ?auto_312443 ) ( ON ?auto_312445 ?auto_312444 ) ( ON ?auto_312446 ?auto_312445 ) ( ON ?auto_312447 ?auto_312446 ) ( ON ?auto_312448 ?auto_312447 ) ( ON ?auto_312449 ?auto_312448 ) ( ON ?auto_312450 ?auto_312449 ) ( ON ?auto_312451 ?auto_312450 ) ( not ( = ?auto_312443 ?auto_312444 ) ) ( not ( = ?auto_312443 ?auto_312445 ) ) ( not ( = ?auto_312443 ?auto_312446 ) ) ( not ( = ?auto_312443 ?auto_312447 ) ) ( not ( = ?auto_312443 ?auto_312448 ) ) ( not ( = ?auto_312443 ?auto_312449 ) ) ( not ( = ?auto_312443 ?auto_312450 ) ) ( not ( = ?auto_312443 ?auto_312451 ) ) ( not ( = ?auto_312443 ?auto_312452 ) ) ( not ( = ?auto_312443 ?auto_312453 ) ) ( not ( = ?auto_312443 ?auto_312455 ) ) ( not ( = ?auto_312444 ?auto_312445 ) ) ( not ( = ?auto_312444 ?auto_312446 ) ) ( not ( = ?auto_312444 ?auto_312447 ) ) ( not ( = ?auto_312444 ?auto_312448 ) ) ( not ( = ?auto_312444 ?auto_312449 ) ) ( not ( = ?auto_312444 ?auto_312450 ) ) ( not ( = ?auto_312444 ?auto_312451 ) ) ( not ( = ?auto_312444 ?auto_312452 ) ) ( not ( = ?auto_312444 ?auto_312453 ) ) ( not ( = ?auto_312444 ?auto_312455 ) ) ( not ( = ?auto_312445 ?auto_312446 ) ) ( not ( = ?auto_312445 ?auto_312447 ) ) ( not ( = ?auto_312445 ?auto_312448 ) ) ( not ( = ?auto_312445 ?auto_312449 ) ) ( not ( = ?auto_312445 ?auto_312450 ) ) ( not ( = ?auto_312445 ?auto_312451 ) ) ( not ( = ?auto_312445 ?auto_312452 ) ) ( not ( = ?auto_312445 ?auto_312453 ) ) ( not ( = ?auto_312445 ?auto_312455 ) ) ( not ( = ?auto_312446 ?auto_312447 ) ) ( not ( = ?auto_312446 ?auto_312448 ) ) ( not ( = ?auto_312446 ?auto_312449 ) ) ( not ( = ?auto_312446 ?auto_312450 ) ) ( not ( = ?auto_312446 ?auto_312451 ) ) ( not ( = ?auto_312446 ?auto_312452 ) ) ( not ( = ?auto_312446 ?auto_312453 ) ) ( not ( = ?auto_312446 ?auto_312455 ) ) ( not ( = ?auto_312447 ?auto_312448 ) ) ( not ( = ?auto_312447 ?auto_312449 ) ) ( not ( = ?auto_312447 ?auto_312450 ) ) ( not ( = ?auto_312447 ?auto_312451 ) ) ( not ( = ?auto_312447 ?auto_312452 ) ) ( not ( = ?auto_312447 ?auto_312453 ) ) ( not ( = ?auto_312447 ?auto_312455 ) ) ( not ( = ?auto_312448 ?auto_312449 ) ) ( not ( = ?auto_312448 ?auto_312450 ) ) ( not ( = ?auto_312448 ?auto_312451 ) ) ( not ( = ?auto_312448 ?auto_312452 ) ) ( not ( = ?auto_312448 ?auto_312453 ) ) ( not ( = ?auto_312448 ?auto_312455 ) ) ( not ( = ?auto_312449 ?auto_312450 ) ) ( not ( = ?auto_312449 ?auto_312451 ) ) ( not ( = ?auto_312449 ?auto_312452 ) ) ( not ( = ?auto_312449 ?auto_312453 ) ) ( not ( = ?auto_312449 ?auto_312455 ) ) ( not ( = ?auto_312450 ?auto_312451 ) ) ( not ( = ?auto_312450 ?auto_312452 ) ) ( not ( = ?auto_312450 ?auto_312453 ) ) ( not ( = ?auto_312450 ?auto_312455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312451 ?auto_312452 ?auto_312453 )
      ( MAKE-10CRATE-VERIFY ?auto_312443 ?auto_312444 ?auto_312445 ?auto_312446 ?auto_312447 ?auto_312448 ?auto_312449 ?auto_312450 ?auto_312451 ?auto_312452 ?auto_312453 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312569 - SURFACE
      ?auto_312570 - SURFACE
      ?auto_312571 - SURFACE
      ?auto_312572 - SURFACE
      ?auto_312573 - SURFACE
      ?auto_312574 - SURFACE
      ?auto_312575 - SURFACE
      ?auto_312576 - SURFACE
      ?auto_312577 - SURFACE
      ?auto_312578 - SURFACE
      ?auto_312579 - SURFACE
    )
    :vars
    (
      ?auto_312583 - HOIST
      ?auto_312585 - PLACE
      ?auto_312584 - PLACE
      ?auto_312581 - HOIST
      ?auto_312580 - SURFACE
      ?auto_312582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312583 ?auto_312585 ) ( SURFACE-AT ?auto_312578 ?auto_312585 ) ( CLEAR ?auto_312578 ) ( IS-CRATE ?auto_312579 ) ( not ( = ?auto_312578 ?auto_312579 ) ) ( AVAILABLE ?auto_312583 ) ( ON ?auto_312578 ?auto_312577 ) ( not ( = ?auto_312577 ?auto_312578 ) ) ( not ( = ?auto_312577 ?auto_312579 ) ) ( not ( = ?auto_312584 ?auto_312585 ) ) ( HOIST-AT ?auto_312581 ?auto_312584 ) ( not ( = ?auto_312583 ?auto_312581 ) ) ( AVAILABLE ?auto_312581 ) ( SURFACE-AT ?auto_312579 ?auto_312584 ) ( ON ?auto_312579 ?auto_312580 ) ( CLEAR ?auto_312579 ) ( not ( = ?auto_312578 ?auto_312580 ) ) ( not ( = ?auto_312579 ?auto_312580 ) ) ( not ( = ?auto_312577 ?auto_312580 ) ) ( TRUCK-AT ?auto_312582 ?auto_312585 ) ( ON ?auto_312570 ?auto_312569 ) ( ON ?auto_312571 ?auto_312570 ) ( ON ?auto_312572 ?auto_312571 ) ( ON ?auto_312573 ?auto_312572 ) ( ON ?auto_312574 ?auto_312573 ) ( ON ?auto_312575 ?auto_312574 ) ( ON ?auto_312576 ?auto_312575 ) ( ON ?auto_312577 ?auto_312576 ) ( not ( = ?auto_312569 ?auto_312570 ) ) ( not ( = ?auto_312569 ?auto_312571 ) ) ( not ( = ?auto_312569 ?auto_312572 ) ) ( not ( = ?auto_312569 ?auto_312573 ) ) ( not ( = ?auto_312569 ?auto_312574 ) ) ( not ( = ?auto_312569 ?auto_312575 ) ) ( not ( = ?auto_312569 ?auto_312576 ) ) ( not ( = ?auto_312569 ?auto_312577 ) ) ( not ( = ?auto_312569 ?auto_312578 ) ) ( not ( = ?auto_312569 ?auto_312579 ) ) ( not ( = ?auto_312569 ?auto_312580 ) ) ( not ( = ?auto_312570 ?auto_312571 ) ) ( not ( = ?auto_312570 ?auto_312572 ) ) ( not ( = ?auto_312570 ?auto_312573 ) ) ( not ( = ?auto_312570 ?auto_312574 ) ) ( not ( = ?auto_312570 ?auto_312575 ) ) ( not ( = ?auto_312570 ?auto_312576 ) ) ( not ( = ?auto_312570 ?auto_312577 ) ) ( not ( = ?auto_312570 ?auto_312578 ) ) ( not ( = ?auto_312570 ?auto_312579 ) ) ( not ( = ?auto_312570 ?auto_312580 ) ) ( not ( = ?auto_312571 ?auto_312572 ) ) ( not ( = ?auto_312571 ?auto_312573 ) ) ( not ( = ?auto_312571 ?auto_312574 ) ) ( not ( = ?auto_312571 ?auto_312575 ) ) ( not ( = ?auto_312571 ?auto_312576 ) ) ( not ( = ?auto_312571 ?auto_312577 ) ) ( not ( = ?auto_312571 ?auto_312578 ) ) ( not ( = ?auto_312571 ?auto_312579 ) ) ( not ( = ?auto_312571 ?auto_312580 ) ) ( not ( = ?auto_312572 ?auto_312573 ) ) ( not ( = ?auto_312572 ?auto_312574 ) ) ( not ( = ?auto_312572 ?auto_312575 ) ) ( not ( = ?auto_312572 ?auto_312576 ) ) ( not ( = ?auto_312572 ?auto_312577 ) ) ( not ( = ?auto_312572 ?auto_312578 ) ) ( not ( = ?auto_312572 ?auto_312579 ) ) ( not ( = ?auto_312572 ?auto_312580 ) ) ( not ( = ?auto_312573 ?auto_312574 ) ) ( not ( = ?auto_312573 ?auto_312575 ) ) ( not ( = ?auto_312573 ?auto_312576 ) ) ( not ( = ?auto_312573 ?auto_312577 ) ) ( not ( = ?auto_312573 ?auto_312578 ) ) ( not ( = ?auto_312573 ?auto_312579 ) ) ( not ( = ?auto_312573 ?auto_312580 ) ) ( not ( = ?auto_312574 ?auto_312575 ) ) ( not ( = ?auto_312574 ?auto_312576 ) ) ( not ( = ?auto_312574 ?auto_312577 ) ) ( not ( = ?auto_312574 ?auto_312578 ) ) ( not ( = ?auto_312574 ?auto_312579 ) ) ( not ( = ?auto_312574 ?auto_312580 ) ) ( not ( = ?auto_312575 ?auto_312576 ) ) ( not ( = ?auto_312575 ?auto_312577 ) ) ( not ( = ?auto_312575 ?auto_312578 ) ) ( not ( = ?auto_312575 ?auto_312579 ) ) ( not ( = ?auto_312575 ?auto_312580 ) ) ( not ( = ?auto_312576 ?auto_312577 ) ) ( not ( = ?auto_312576 ?auto_312578 ) ) ( not ( = ?auto_312576 ?auto_312579 ) ) ( not ( = ?auto_312576 ?auto_312580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312577 ?auto_312578 ?auto_312579 )
      ( MAKE-10CRATE-VERIFY ?auto_312569 ?auto_312570 ?auto_312571 ?auto_312572 ?auto_312573 ?auto_312574 ?auto_312575 ?auto_312576 ?auto_312577 ?auto_312578 ?auto_312579 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312695 - SURFACE
      ?auto_312696 - SURFACE
      ?auto_312697 - SURFACE
      ?auto_312698 - SURFACE
      ?auto_312699 - SURFACE
      ?auto_312700 - SURFACE
      ?auto_312701 - SURFACE
      ?auto_312702 - SURFACE
      ?auto_312703 - SURFACE
      ?auto_312704 - SURFACE
      ?auto_312705 - SURFACE
    )
    :vars
    (
      ?auto_312711 - HOIST
      ?auto_312709 - PLACE
      ?auto_312710 - PLACE
      ?auto_312706 - HOIST
      ?auto_312708 - SURFACE
      ?auto_312707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312711 ?auto_312709 ) ( IS-CRATE ?auto_312705 ) ( not ( = ?auto_312704 ?auto_312705 ) ) ( not ( = ?auto_312703 ?auto_312704 ) ) ( not ( = ?auto_312703 ?auto_312705 ) ) ( not ( = ?auto_312710 ?auto_312709 ) ) ( HOIST-AT ?auto_312706 ?auto_312710 ) ( not ( = ?auto_312711 ?auto_312706 ) ) ( AVAILABLE ?auto_312706 ) ( SURFACE-AT ?auto_312705 ?auto_312710 ) ( ON ?auto_312705 ?auto_312708 ) ( CLEAR ?auto_312705 ) ( not ( = ?auto_312704 ?auto_312708 ) ) ( not ( = ?auto_312705 ?auto_312708 ) ) ( not ( = ?auto_312703 ?auto_312708 ) ) ( TRUCK-AT ?auto_312707 ?auto_312709 ) ( SURFACE-AT ?auto_312703 ?auto_312709 ) ( CLEAR ?auto_312703 ) ( LIFTING ?auto_312711 ?auto_312704 ) ( IS-CRATE ?auto_312704 ) ( ON ?auto_312696 ?auto_312695 ) ( ON ?auto_312697 ?auto_312696 ) ( ON ?auto_312698 ?auto_312697 ) ( ON ?auto_312699 ?auto_312698 ) ( ON ?auto_312700 ?auto_312699 ) ( ON ?auto_312701 ?auto_312700 ) ( ON ?auto_312702 ?auto_312701 ) ( ON ?auto_312703 ?auto_312702 ) ( not ( = ?auto_312695 ?auto_312696 ) ) ( not ( = ?auto_312695 ?auto_312697 ) ) ( not ( = ?auto_312695 ?auto_312698 ) ) ( not ( = ?auto_312695 ?auto_312699 ) ) ( not ( = ?auto_312695 ?auto_312700 ) ) ( not ( = ?auto_312695 ?auto_312701 ) ) ( not ( = ?auto_312695 ?auto_312702 ) ) ( not ( = ?auto_312695 ?auto_312703 ) ) ( not ( = ?auto_312695 ?auto_312704 ) ) ( not ( = ?auto_312695 ?auto_312705 ) ) ( not ( = ?auto_312695 ?auto_312708 ) ) ( not ( = ?auto_312696 ?auto_312697 ) ) ( not ( = ?auto_312696 ?auto_312698 ) ) ( not ( = ?auto_312696 ?auto_312699 ) ) ( not ( = ?auto_312696 ?auto_312700 ) ) ( not ( = ?auto_312696 ?auto_312701 ) ) ( not ( = ?auto_312696 ?auto_312702 ) ) ( not ( = ?auto_312696 ?auto_312703 ) ) ( not ( = ?auto_312696 ?auto_312704 ) ) ( not ( = ?auto_312696 ?auto_312705 ) ) ( not ( = ?auto_312696 ?auto_312708 ) ) ( not ( = ?auto_312697 ?auto_312698 ) ) ( not ( = ?auto_312697 ?auto_312699 ) ) ( not ( = ?auto_312697 ?auto_312700 ) ) ( not ( = ?auto_312697 ?auto_312701 ) ) ( not ( = ?auto_312697 ?auto_312702 ) ) ( not ( = ?auto_312697 ?auto_312703 ) ) ( not ( = ?auto_312697 ?auto_312704 ) ) ( not ( = ?auto_312697 ?auto_312705 ) ) ( not ( = ?auto_312697 ?auto_312708 ) ) ( not ( = ?auto_312698 ?auto_312699 ) ) ( not ( = ?auto_312698 ?auto_312700 ) ) ( not ( = ?auto_312698 ?auto_312701 ) ) ( not ( = ?auto_312698 ?auto_312702 ) ) ( not ( = ?auto_312698 ?auto_312703 ) ) ( not ( = ?auto_312698 ?auto_312704 ) ) ( not ( = ?auto_312698 ?auto_312705 ) ) ( not ( = ?auto_312698 ?auto_312708 ) ) ( not ( = ?auto_312699 ?auto_312700 ) ) ( not ( = ?auto_312699 ?auto_312701 ) ) ( not ( = ?auto_312699 ?auto_312702 ) ) ( not ( = ?auto_312699 ?auto_312703 ) ) ( not ( = ?auto_312699 ?auto_312704 ) ) ( not ( = ?auto_312699 ?auto_312705 ) ) ( not ( = ?auto_312699 ?auto_312708 ) ) ( not ( = ?auto_312700 ?auto_312701 ) ) ( not ( = ?auto_312700 ?auto_312702 ) ) ( not ( = ?auto_312700 ?auto_312703 ) ) ( not ( = ?auto_312700 ?auto_312704 ) ) ( not ( = ?auto_312700 ?auto_312705 ) ) ( not ( = ?auto_312700 ?auto_312708 ) ) ( not ( = ?auto_312701 ?auto_312702 ) ) ( not ( = ?auto_312701 ?auto_312703 ) ) ( not ( = ?auto_312701 ?auto_312704 ) ) ( not ( = ?auto_312701 ?auto_312705 ) ) ( not ( = ?auto_312701 ?auto_312708 ) ) ( not ( = ?auto_312702 ?auto_312703 ) ) ( not ( = ?auto_312702 ?auto_312704 ) ) ( not ( = ?auto_312702 ?auto_312705 ) ) ( not ( = ?auto_312702 ?auto_312708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312703 ?auto_312704 ?auto_312705 )
      ( MAKE-10CRATE-VERIFY ?auto_312695 ?auto_312696 ?auto_312697 ?auto_312698 ?auto_312699 ?auto_312700 ?auto_312701 ?auto_312702 ?auto_312703 ?auto_312704 ?auto_312705 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312821 - SURFACE
      ?auto_312822 - SURFACE
      ?auto_312823 - SURFACE
      ?auto_312824 - SURFACE
      ?auto_312825 - SURFACE
      ?auto_312826 - SURFACE
      ?auto_312827 - SURFACE
      ?auto_312828 - SURFACE
      ?auto_312829 - SURFACE
      ?auto_312830 - SURFACE
      ?auto_312831 - SURFACE
    )
    :vars
    (
      ?auto_312833 - HOIST
      ?auto_312837 - PLACE
      ?auto_312835 - PLACE
      ?auto_312836 - HOIST
      ?auto_312832 - SURFACE
      ?auto_312834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312833 ?auto_312837 ) ( IS-CRATE ?auto_312831 ) ( not ( = ?auto_312830 ?auto_312831 ) ) ( not ( = ?auto_312829 ?auto_312830 ) ) ( not ( = ?auto_312829 ?auto_312831 ) ) ( not ( = ?auto_312835 ?auto_312837 ) ) ( HOIST-AT ?auto_312836 ?auto_312835 ) ( not ( = ?auto_312833 ?auto_312836 ) ) ( AVAILABLE ?auto_312836 ) ( SURFACE-AT ?auto_312831 ?auto_312835 ) ( ON ?auto_312831 ?auto_312832 ) ( CLEAR ?auto_312831 ) ( not ( = ?auto_312830 ?auto_312832 ) ) ( not ( = ?auto_312831 ?auto_312832 ) ) ( not ( = ?auto_312829 ?auto_312832 ) ) ( TRUCK-AT ?auto_312834 ?auto_312837 ) ( SURFACE-AT ?auto_312829 ?auto_312837 ) ( CLEAR ?auto_312829 ) ( IS-CRATE ?auto_312830 ) ( AVAILABLE ?auto_312833 ) ( IN ?auto_312830 ?auto_312834 ) ( ON ?auto_312822 ?auto_312821 ) ( ON ?auto_312823 ?auto_312822 ) ( ON ?auto_312824 ?auto_312823 ) ( ON ?auto_312825 ?auto_312824 ) ( ON ?auto_312826 ?auto_312825 ) ( ON ?auto_312827 ?auto_312826 ) ( ON ?auto_312828 ?auto_312827 ) ( ON ?auto_312829 ?auto_312828 ) ( not ( = ?auto_312821 ?auto_312822 ) ) ( not ( = ?auto_312821 ?auto_312823 ) ) ( not ( = ?auto_312821 ?auto_312824 ) ) ( not ( = ?auto_312821 ?auto_312825 ) ) ( not ( = ?auto_312821 ?auto_312826 ) ) ( not ( = ?auto_312821 ?auto_312827 ) ) ( not ( = ?auto_312821 ?auto_312828 ) ) ( not ( = ?auto_312821 ?auto_312829 ) ) ( not ( = ?auto_312821 ?auto_312830 ) ) ( not ( = ?auto_312821 ?auto_312831 ) ) ( not ( = ?auto_312821 ?auto_312832 ) ) ( not ( = ?auto_312822 ?auto_312823 ) ) ( not ( = ?auto_312822 ?auto_312824 ) ) ( not ( = ?auto_312822 ?auto_312825 ) ) ( not ( = ?auto_312822 ?auto_312826 ) ) ( not ( = ?auto_312822 ?auto_312827 ) ) ( not ( = ?auto_312822 ?auto_312828 ) ) ( not ( = ?auto_312822 ?auto_312829 ) ) ( not ( = ?auto_312822 ?auto_312830 ) ) ( not ( = ?auto_312822 ?auto_312831 ) ) ( not ( = ?auto_312822 ?auto_312832 ) ) ( not ( = ?auto_312823 ?auto_312824 ) ) ( not ( = ?auto_312823 ?auto_312825 ) ) ( not ( = ?auto_312823 ?auto_312826 ) ) ( not ( = ?auto_312823 ?auto_312827 ) ) ( not ( = ?auto_312823 ?auto_312828 ) ) ( not ( = ?auto_312823 ?auto_312829 ) ) ( not ( = ?auto_312823 ?auto_312830 ) ) ( not ( = ?auto_312823 ?auto_312831 ) ) ( not ( = ?auto_312823 ?auto_312832 ) ) ( not ( = ?auto_312824 ?auto_312825 ) ) ( not ( = ?auto_312824 ?auto_312826 ) ) ( not ( = ?auto_312824 ?auto_312827 ) ) ( not ( = ?auto_312824 ?auto_312828 ) ) ( not ( = ?auto_312824 ?auto_312829 ) ) ( not ( = ?auto_312824 ?auto_312830 ) ) ( not ( = ?auto_312824 ?auto_312831 ) ) ( not ( = ?auto_312824 ?auto_312832 ) ) ( not ( = ?auto_312825 ?auto_312826 ) ) ( not ( = ?auto_312825 ?auto_312827 ) ) ( not ( = ?auto_312825 ?auto_312828 ) ) ( not ( = ?auto_312825 ?auto_312829 ) ) ( not ( = ?auto_312825 ?auto_312830 ) ) ( not ( = ?auto_312825 ?auto_312831 ) ) ( not ( = ?auto_312825 ?auto_312832 ) ) ( not ( = ?auto_312826 ?auto_312827 ) ) ( not ( = ?auto_312826 ?auto_312828 ) ) ( not ( = ?auto_312826 ?auto_312829 ) ) ( not ( = ?auto_312826 ?auto_312830 ) ) ( not ( = ?auto_312826 ?auto_312831 ) ) ( not ( = ?auto_312826 ?auto_312832 ) ) ( not ( = ?auto_312827 ?auto_312828 ) ) ( not ( = ?auto_312827 ?auto_312829 ) ) ( not ( = ?auto_312827 ?auto_312830 ) ) ( not ( = ?auto_312827 ?auto_312831 ) ) ( not ( = ?auto_312827 ?auto_312832 ) ) ( not ( = ?auto_312828 ?auto_312829 ) ) ( not ( = ?auto_312828 ?auto_312830 ) ) ( not ( = ?auto_312828 ?auto_312831 ) ) ( not ( = ?auto_312828 ?auto_312832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312829 ?auto_312830 ?auto_312831 )
      ( MAKE-10CRATE-VERIFY ?auto_312821 ?auto_312822 ?auto_312823 ?auto_312824 ?auto_312825 ?auto_312826 ?auto_312827 ?auto_312828 ?auto_312829 ?auto_312830 ?auto_312831 ) )
  )

)

