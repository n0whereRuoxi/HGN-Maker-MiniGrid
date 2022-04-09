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
      ?auto_292138 - SURFACE
      ?auto_292139 - SURFACE
    )
    :vars
    (
      ?auto_292140 - HOIST
      ?auto_292141 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292140 ?auto_292141 ) ( SURFACE-AT ?auto_292138 ?auto_292141 ) ( CLEAR ?auto_292138 ) ( LIFTING ?auto_292140 ?auto_292139 ) ( IS-CRATE ?auto_292139 ) ( not ( = ?auto_292138 ?auto_292139 ) ) )
    :subtasks
    ( ( !DROP ?auto_292140 ?auto_292139 ?auto_292138 ?auto_292141 )
      ( MAKE-1CRATE-VERIFY ?auto_292138 ?auto_292139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292142 - SURFACE
      ?auto_292143 - SURFACE
    )
    :vars
    (
      ?auto_292145 - HOIST
      ?auto_292144 - PLACE
      ?auto_292146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292145 ?auto_292144 ) ( SURFACE-AT ?auto_292142 ?auto_292144 ) ( CLEAR ?auto_292142 ) ( IS-CRATE ?auto_292143 ) ( not ( = ?auto_292142 ?auto_292143 ) ) ( TRUCK-AT ?auto_292146 ?auto_292144 ) ( AVAILABLE ?auto_292145 ) ( IN ?auto_292143 ?auto_292146 ) )
    :subtasks
    ( ( !UNLOAD ?auto_292145 ?auto_292143 ?auto_292146 ?auto_292144 )
      ( MAKE-1CRATE ?auto_292142 ?auto_292143 )
      ( MAKE-1CRATE-VERIFY ?auto_292142 ?auto_292143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292147 - SURFACE
      ?auto_292148 - SURFACE
    )
    :vars
    (
      ?auto_292150 - HOIST
      ?auto_292149 - PLACE
      ?auto_292151 - TRUCK
      ?auto_292152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292150 ?auto_292149 ) ( SURFACE-AT ?auto_292147 ?auto_292149 ) ( CLEAR ?auto_292147 ) ( IS-CRATE ?auto_292148 ) ( not ( = ?auto_292147 ?auto_292148 ) ) ( AVAILABLE ?auto_292150 ) ( IN ?auto_292148 ?auto_292151 ) ( TRUCK-AT ?auto_292151 ?auto_292152 ) ( not ( = ?auto_292152 ?auto_292149 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292151 ?auto_292152 ?auto_292149 )
      ( MAKE-1CRATE ?auto_292147 ?auto_292148 )
      ( MAKE-1CRATE-VERIFY ?auto_292147 ?auto_292148 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292153 - SURFACE
      ?auto_292154 - SURFACE
    )
    :vars
    (
      ?auto_292156 - HOIST
      ?auto_292158 - PLACE
      ?auto_292155 - TRUCK
      ?auto_292157 - PLACE
      ?auto_292159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292156 ?auto_292158 ) ( SURFACE-AT ?auto_292153 ?auto_292158 ) ( CLEAR ?auto_292153 ) ( IS-CRATE ?auto_292154 ) ( not ( = ?auto_292153 ?auto_292154 ) ) ( AVAILABLE ?auto_292156 ) ( TRUCK-AT ?auto_292155 ?auto_292157 ) ( not ( = ?auto_292157 ?auto_292158 ) ) ( HOIST-AT ?auto_292159 ?auto_292157 ) ( LIFTING ?auto_292159 ?auto_292154 ) ( not ( = ?auto_292156 ?auto_292159 ) ) )
    :subtasks
    ( ( !LOAD ?auto_292159 ?auto_292154 ?auto_292155 ?auto_292157 )
      ( MAKE-1CRATE ?auto_292153 ?auto_292154 )
      ( MAKE-1CRATE-VERIFY ?auto_292153 ?auto_292154 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292160 - SURFACE
      ?auto_292161 - SURFACE
    )
    :vars
    (
      ?auto_292165 - HOIST
      ?auto_292166 - PLACE
      ?auto_292163 - TRUCK
      ?auto_292164 - PLACE
      ?auto_292162 - HOIST
      ?auto_292167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292165 ?auto_292166 ) ( SURFACE-AT ?auto_292160 ?auto_292166 ) ( CLEAR ?auto_292160 ) ( IS-CRATE ?auto_292161 ) ( not ( = ?auto_292160 ?auto_292161 ) ) ( AVAILABLE ?auto_292165 ) ( TRUCK-AT ?auto_292163 ?auto_292164 ) ( not ( = ?auto_292164 ?auto_292166 ) ) ( HOIST-AT ?auto_292162 ?auto_292164 ) ( not ( = ?auto_292165 ?auto_292162 ) ) ( AVAILABLE ?auto_292162 ) ( SURFACE-AT ?auto_292161 ?auto_292164 ) ( ON ?auto_292161 ?auto_292167 ) ( CLEAR ?auto_292161 ) ( not ( = ?auto_292160 ?auto_292167 ) ) ( not ( = ?auto_292161 ?auto_292167 ) ) )
    :subtasks
    ( ( !LIFT ?auto_292162 ?auto_292161 ?auto_292167 ?auto_292164 )
      ( MAKE-1CRATE ?auto_292160 ?auto_292161 )
      ( MAKE-1CRATE-VERIFY ?auto_292160 ?auto_292161 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292168 - SURFACE
      ?auto_292169 - SURFACE
    )
    :vars
    (
      ?auto_292172 - HOIST
      ?auto_292173 - PLACE
      ?auto_292170 - PLACE
      ?auto_292171 - HOIST
      ?auto_292174 - SURFACE
      ?auto_292175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292172 ?auto_292173 ) ( SURFACE-AT ?auto_292168 ?auto_292173 ) ( CLEAR ?auto_292168 ) ( IS-CRATE ?auto_292169 ) ( not ( = ?auto_292168 ?auto_292169 ) ) ( AVAILABLE ?auto_292172 ) ( not ( = ?auto_292170 ?auto_292173 ) ) ( HOIST-AT ?auto_292171 ?auto_292170 ) ( not ( = ?auto_292172 ?auto_292171 ) ) ( AVAILABLE ?auto_292171 ) ( SURFACE-AT ?auto_292169 ?auto_292170 ) ( ON ?auto_292169 ?auto_292174 ) ( CLEAR ?auto_292169 ) ( not ( = ?auto_292168 ?auto_292174 ) ) ( not ( = ?auto_292169 ?auto_292174 ) ) ( TRUCK-AT ?auto_292175 ?auto_292173 ) )
    :subtasks
    ( ( !DRIVE ?auto_292175 ?auto_292173 ?auto_292170 )
      ( MAKE-1CRATE ?auto_292168 ?auto_292169 )
      ( MAKE-1CRATE-VERIFY ?auto_292168 ?auto_292169 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292185 - SURFACE
      ?auto_292186 - SURFACE
      ?auto_292187 - SURFACE
    )
    :vars
    (
      ?auto_292189 - HOIST
      ?auto_292188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292189 ?auto_292188 ) ( SURFACE-AT ?auto_292186 ?auto_292188 ) ( CLEAR ?auto_292186 ) ( LIFTING ?auto_292189 ?auto_292187 ) ( IS-CRATE ?auto_292187 ) ( not ( = ?auto_292186 ?auto_292187 ) ) ( ON ?auto_292186 ?auto_292185 ) ( not ( = ?auto_292185 ?auto_292186 ) ) ( not ( = ?auto_292185 ?auto_292187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292186 ?auto_292187 )
      ( MAKE-2CRATE-VERIFY ?auto_292185 ?auto_292186 ?auto_292187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292195 - SURFACE
      ?auto_292196 - SURFACE
      ?auto_292197 - SURFACE
    )
    :vars
    (
      ?auto_292198 - HOIST
      ?auto_292200 - PLACE
      ?auto_292199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292198 ?auto_292200 ) ( SURFACE-AT ?auto_292196 ?auto_292200 ) ( CLEAR ?auto_292196 ) ( IS-CRATE ?auto_292197 ) ( not ( = ?auto_292196 ?auto_292197 ) ) ( TRUCK-AT ?auto_292199 ?auto_292200 ) ( AVAILABLE ?auto_292198 ) ( IN ?auto_292197 ?auto_292199 ) ( ON ?auto_292196 ?auto_292195 ) ( not ( = ?auto_292195 ?auto_292196 ) ) ( not ( = ?auto_292195 ?auto_292197 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292196 ?auto_292197 )
      ( MAKE-2CRATE-VERIFY ?auto_292195 ?auto_292196 ?auto_292197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292201 - SURFACE
      ?auto_292202 - SURFACE
    )
    :vars
    (
      ?auto_292204 - HOIST
      ?auto_292205 - PLACE
      ?auto_292206 - TRUCK
      ?auto_292203 - SURFACE
      ?auto_292207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292204 ?auto_292205 ) ( SURFACE-AT ?auto_292201 ?auto_292205 ) ( CLEAR ?auto_292201 ) ( IS-CRATE ?auto_292202 ) ( not ( = ?auto_292201 ?auto_292202 ) ) ( AVAILABLE ?auto_292204 ) ( IN ?auto_292202 ?auto_292206 ) ( ON ?auto_292201 ?auto_292203 ) ( not ( = ?auto_292203 ?auto_292201 ) ) ( not ( = ?auto_292203 ?auto_292202 ) ) ( TRUCK-AT ?auto_292206 ?auto_292207 ) ( not ( = ?auto_292207 ?auto_292205 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292206 ?auto_292207 ?auto_292205 )
      ( MAKE-2CRATE ?auto_292203 ?auto_292201 ?auto_292202 )
      ( MAKE-1CRATE-VERIFY ?auto_292201 ?auto_292202 ) )
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
      ?auto_292213 - HOIST
      ?auto_292211 - PLACE
      ?auto_292214 - TRUCK
      ?auto_292212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292213 ?auto_292211 ) ( SURFACE-AT ?auto_292209 ?auto_292211 ) ( CLEAR ?auto_292209 ) ( IS-CRATE ?auto_292210 ) ( not ( = ?auto_292209 ?auto_292210 ) ) ( AVAILABLE ?auto_292213 ) ( IN ?auto_292210 ?auto_292214 ) ( ON ?auto_292209 ?auto_292208 ) ( not ( = ?auto_292208 ?auto_292209 ) ) ( not ( = ?auto_292208 ?auto_292210 ) ) ( TRUCK-AT ?auto_292214 ?auto_292212 ) ( not ( = ?auto_292212 ?auto_292211 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292209 ?auto_292210 )
      ( MAKE-2CRATE-VERIFY ?auto_292208 ?auto_292209 ?auto_292210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292215 - SURFACE
      ?auto_292216 - SURFACE
    )
    :vars
    (
      ?auto_292219 - HOIST
      ?auto_292220 - PLACE
      ?auto_292218 - SURFACE
      ?auto_292221 - TRUCK
      ?auto_292217 - PLACE
      ?auto_292222 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292219 ?auto_292220 ) ( SURFACE-AT ?auto_292215 ?auto_292220 ) ( CLEAR ?auto_292215 ) ( IS-CRATE ?auto_292216 ) ( not ( = ?auto_292215 ?auto_292216 ) ) ( AVAILABLE ?auto_292219 ) ( ON ?auto_292215 ?auto_292218 ) ( not ( = ?auto_292218 ?auto_292215 ) ) ( not ( = ?auto_292218 ?auto_292216 ) ) ( TRUCK-AT ?auto_292221 ?auto_292217 ) ( not ( = ?auto_292217 ?auto_292220 ) ) ( HOIST-AT ?auto_292222 ?auto_292217 ) ( LIFTING ?auto_292222 ?auto_292216 ) ( not ( = ?auto_292219 ?auto_292222 ) ) )
    :subtasks
    ( ( !LOAD ?auto_292222 ?auto_292216 ?auto_292221 ?auto_292217 )
      ( MAKE-2CRATE ?auto_292218 ?auto_292215 ?auto_292216 )
      ( MAKE-1CRATE-VERIFY ?auto_292215 ?auto_292216 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292223 - SURFACE
      ?auto_292224 - SURFACE
      ?auto_292225 - SURFACE
    )
    :vars
    (
      ?auto_292230 - HOIST
      ?auto_292229 - PLACE
      ?auto_292227 - TRUCK
      ?auto_292226 - PLACE
      ?auto_292228 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292230 ?auto_292229 ) ( SURFACE-AT ?auto_292224 ?auto_292229 ) ( CLEAR ?auto_292224 ) ( IS-CRATE ?auto_292225 ) ( not ( = ?auto_292224 ?auto_292225 ) ) ( AVAILABLE ?auto_292230 ) ( ON ?auto_292224 ?auto_292223 ) ( not ( = ?auto_292223 ?auto_292224 ) ) ( not ( = ?auto_292223 ?auto_292225 ) ) ( TRUCK-AT ?auto_292227 ?auto_292226 ) ( not ( = ?auto_292226 ?auto_292229 ) ) ( HOIST-AT ?auto_292228 ?auto_292226 ) ( LIFTING ?auto_292228 ?auto_292225 ) ( not ( = ?auto_292230 ?auto_292228 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292224 ?auto_292225 )
      ( MAKE-2CRATE-VERIFY ?auto_292223 ?auto_292224 ?auto_292225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292231 - SURFACE
      ?auto_292232 - SURFACE
    )
    :vars
    (
      ?auto_292236 - HOIST
      ?auto_292238 - PLACE
      ?auto_292235 - SURFACE
      ?auto_292237 - TRUCK
      ?auto_292233 - PLACE
      ?auto_292234 - HOIST
      ?auto_292239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292236 ?auto_292238 ) ( SURFACE-AT ?auto_292231 ?auto_292238 ) ( CLEAR ?auto_292231 ) ( IS-CRATE ?auto_292232 ) ( not ( = ?auto_292231 ?auto_292232 ) ) ( AVAILABLE ?auto_292236 ) ( ON ?auto_292231 ?auto_292235 ) ( not ( = ?auto_292235 ?auto_292231 ) ) ( not ( = ?auto_292235 ?auto_292232 ) ) ( TRUCK-AT ?auto_292237 ?auto_292233 ) ( not ( = ?auto_292233 ?auto_292238 ) ) ( HOIST-AT ?auto_292234 ?auto_292233 ) ( not ( = ?auto_292236 ?auto_292234 ) ) ( AVAILABLE ?auto_292234 ) ( SURFACE-AT ?auto_292232 ?auto_292233 ) ( ON ?auto_292232 ?auto_292239 ) ( CLEAR ?auto_292232 ) ( not ( = ?auto_292231 ?auto_292239 ) ) ( not ( = ?auto_292232 ?auto_292239 ) ) ( not ( = ?auto_292235 ?auto_292239 ) ) )
    :subtasks
    ( ( !LIFT ?auto_292234 ?auto_292232 ?auto_292239 ?auto_292233 )
      ( MAKE-2CRATE ?auto_292235 ?auto_292231 ?auto_292232 )
      ( MAKE-1CRATE-VERIFY ?auto_292231 ?auto_292232 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292240 - SURFACE
      ?auto_292241 - SURFACE
      ?auto_292242 - SURFACE
    )
    :vars
    (
      ?auto_292247 - HOIST
      ?auto_292245 - PLACE
      ?auto_292246 - TRUCK
      ?auto_292244 - PLACE
      ?auto_292243 - HOIST
      ?auto_292248 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292247 ?auto_292245 ) ( SURFACE-AT ?auto_292241 ?auto_292245 ) ( CLEAR ?auto_292241 ) ( IS-CRATE ?auto_292242 ) ( not ( = ?auto_292241 ?auto_292242 ) ) ( AVAILABLE ?auto_292247 ) ( ON ?auto_292241 ?auto_292240 ) ( not ( = ?auto_292240 ?auto_292241 ) ) ( not ( = ?auto_292240 ?auto_292242 ) ) ( TRUCK-AT ?auto_292246 ?auto_292244 ) ( not ( = ?auto_292244 ?auto_292245 ) ) ( HOIST-AT ?auto_292243 ?auto_292244 ) ( not ( = ?auto_292247 ?auto_292243 ) ) ( AVAILABLE ?auto_292243 ) ( SURFACE-AT ?auto_292242 ?auto_292244 ) ( ON ?auto_292242 ?auto_292248 ) ( CLEAR ?auto_292242 ) ( not ( = ?auto_292241 ?auto_292248 ) ) ( not ( = ?auto_292242 ?auto_292248 ) ) ( not ( = ?auto_292240 ?auto_292248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292241 ?auto_292242 )
      ( MAKE-2CRATE-VERIFY ?auto_292240 ?auto_292241 ?auto_292242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292249 - SURFACE
      ?auto_292250 - SURFACE
    )
    :vars
    (
      ?auto_292251 - HOIST
      ?auto_292253 - PLACE
      ?auto_292255 - SURFACE
      ?auto_292257 - PLACE
      ?auto_292252 - HOIST
      ?auto_292256 - SURFACE
      ?auto_292254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292251 ?auto_292253 ) ( SURFACE-AT ?auto_292249 ?auto_292253 ) ( CLEAR ?auto_292249 ) ( IS-CRATE ?auto_292250 ) ( not ( = ?auto_292249 ?auto_292250 ) ) ( AVAILABLE ?auto_292251 ) ( ON ?auto_292249 ?auto_292255 ) ( not ( = ?auto_292255 ?auto_292249 ) ) ( not ( = ?auto_292255 ?auto_292250 ) ) ( not ( = ?auto_292257 ?auto_292253 ) ) ( HOIST-AT ?auto_292252 ?auto_292257 ) ( not ( = ?auto_292251 ?auto_292252 ) ) ( AVAILABLE ?auto_292252 ) ( SURFACE-AT ?auto_292250 ?auto_292257 ) ( ON ?auto_292250 ?auto_292256 ) ( CLEAR ?auto_292250 ) ( not ( = ?auto_292249 ?auto_292256 ) ) ( not ( = ?auto_292250 ?auto_292256 ) ) ( not ( = ?auto_292255 ?auto_292256 ) ) ( TRUCK-AT ?auto_292254 ?auto_292253 ) )
    :subtasks
    ( ( !DRIVE ?auto_292254 ?auto_292253 ?auto_292257 )
      ( MAKE-2CRATE ?auto_292255 ?auto_292249 ?auto_292250 )
      ( MAKE-1CRATE-VERIFY ?auto_292249 ?auto_292250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292258 - SURFACE
      ?auto_292259 - SURFACE
      ?auto_292260 - SURFACE
    )
    :vars
    (
      ?auto_292266 - HOIST
      ?auto_292263 - PLACE
      ?auto_292264 - PLACE
      ?auto_292265 - HOIST
      ?auto_292262 - SURFACE
      ?auto_292261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292266 ?auto_292263 ) ( SURFACE-AT ?auto_292259 ?auto_292263 ) ( CLEAR ?auto_292259 ) ( IS-CRATE ?auto_292260 ) ( not ( = ?auto_292259 ?auto_292260 ) ) ( AVAILABLE ?auto_292266 ) ( ON ?auto_292259 ?auto_292258 ) ( not ( = ?auto_292258 ?auto_292259 ) ) ( not ( = ?auto_292258 ?auto_292260 ) ) ( not ( = ?auto_292264 ?auto_292263 ) ) ( HOIST-AT ?auto_292265 ?auto_292264 ) ( not ( = ?auto_292266 ?auto_292265 ) ) ( AVAILABLE ?auto_292265 ) ( SURFACE-AT ?auto_292260 ?auto_292264 ) ( ON ?auto_292260 ?auto_292262 ) ( CLEAR ?auto_292260 ) ( not ( = ?auto_292259 ?auto_292262 ) ) ( not ( = ?auto_292260 ?auto_292262 ) ) ( not ( = ?auto_292258 ?auto_292262 ) ) ( TRUCK-AT ?auto_292261 ?auto_292263 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292259 ?auto_292260 )
      ( MAKE-2CRATE-VERIFY ?auto_292258 ?auto_292259 ?auto_292260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292267 - SURFACE
      ?auto_292268 - SURFACE
    )
    :vars
    (
      ?auto_292275 - HOIST
      ?auto_292274 - PLACE
      ?auto_292270 - SURFACE
      ?auto_292271 - PLACE
      ?auto_292272 - HOIST
      ?auto_292273 - SURFACE
      ?auto_292269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292275 ?auto_292274 ) ( IS-CRATE ?auto_292268 ) ( not ( = ?auto_292267 ?auto_292268 ) ) ( not ( = ?auto_292270 ?auto_292267 ) ) ( not ( = ?auto_292270 ?auto_292268 ) ) ( not ( = ?auto_292271 ?auto_292274 ) ) ( HOIST-AT ?auto_292272 ?auto_292271 ) ( not ( = ?auto_292275 ?auto_292272 ) ) ( AVAILABLE ?auto_292272 ) ( SURFACE-AT ?auto_292268 ?auto_292271 ) ( ON ?auto_292268 ?auto_292273 ) ( CLEAR ?auto_292268 ) ( not ( = ?auto_292267 ?auto_292273 ) ) ( not ( = ?auto_292268 ?auto_292273 ) ) ( not ( = ?auto_292270 ?auto_292273 ) ) ( TRUCK-AT ?auto_292269 ?auto_292274 ) ( SURFACE-AT ?auto_292270 ?auto_292274 ) ( CLEAR ?auto_292270 ) ( LIFTING ?auto_292275 ?auto_292267 ) ( IS-CRATE ?auto_292267 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292270 ?auto_292267 )
      ( MAKE-2CRATE ?auto_292270 ?auto_292267 ?auto_292268 )
      ( MAKE-1CRATE-VERIFY ?auto_292267 ?auto_292268 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292276 - SURFACE
      ?auto_292277 - SURFACE
      ?auto_292278 - SURFACE
    )
    :vars
    (
      ?auto_292279 - HOIST
      ?auto_292282 - PLACE
      ?auto_292283 - PLACE
      ?auto_292280 - HOIST
      ?auto_292284 - SURFACE
      ?auto_292281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292279 ?auto_292282 ) ( IS-CRATE ?auto_292278 ) ( not ( = ?auto_292277 ?auto_292278 ) ) ( not ( = ?auto_292276 ?auto_292277 ) ) ( not ( = ?auto_292276 ?auto_292278 ) ) ( not ( = ?auto_292283 ?auto_292282 ) ) ( HOIST-AT ?auto_292280 ?auto_292283 ) ( not ( = ?auto_292279 ?auto_292280 ) ) ( AVAILABLE ?auto_292280 ) ( SURFACE-AT ?auto_292278 ?auto_292283 ) ( ON ?auto_292278 ?auto_292284 ) ( CLEAR ?auto_292278 ) ( not ( = ?auto_292277 ?auto_292284 ) ) ( not ( = ?auto_292278 ?auto_292284 ) ) ( not ( = ?auto_292276 ?auto_292284 ) ) ( TRUCK-AT ?auto_292281 ?auto_292282 ) ( SURFACE-AT ?auto_292276 ?auto_292282 ) ( CLEAR ?auto_292276 ) ( LIFTING ?auto_292279 ?auto_292277 ) ( IS-CRATE ?auto_292277 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292277 ?auto_292278 )
      ( MAKE-2CRATE-VERIFY ?auto_292276 ?auto_292277 ?auto_292278 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292285 - SURFACE
      ?auto_292286 - SURFACE
    )
    :vars
    (
      ?auto_292293 - HOIST
      ?auto_292290 - PLACE
      ?auto_292292 - SURFACE
      ?auto_292287 - PLACE
      ?auto_292291 - HOIST
      ?auto_292288 - SURFACE
      ?auto_292289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292293 ?auto_292290 ) ( IS-CRATE ?auto_292286 ) ( not ( = ?auto_292285 ?auto_292286 ) ) ( not ( = ?auto_292292 ?auto_292285 ) ) ( not ( = ?auto_292292 ?auto_292286 ) ) ( not ( = ?auto_292287 ?auto_292290 ) ) ( HOIST-AT ?auto_292291 ?auto_292287 ) ( not ( = ?auto_292293 ?auto_292291 ) ) ( AVAILABLE ?auto_292291 ) ( SURFACE-AT ?auto_292286 ?auto_292287 ) ( ON ?auto_292286 ?auto_292288 ) ( CLEAR ?auto_292286 ) ( not ( = ?auto_292285 ?auto_292288 ) ) ( not ( = ?auto_292286 ?auto_292288 ) ) ( not ( = ?auto_292292 ?auto_292288 ) ) ( TRUCK-AT ?auto_292289 ?auto_292290 ) ( SURFACE-AT ?auto_292292 ?auto_292290 ) ( CLEAR ?auto_292292 ) ( IS-CRATE ?auto_292285 ) ( AVAILABLE ?auto_292293 ) ( IN ?auto_292285 ?auto_292289 ) )
    :subtasks
    ( ( !UNLOAD ?auto_292293 ?auto_292285 ?auto_292289 ?auto_292290 )
      ( MAKE-2CRATE ?auto_292292 ?auto_292285 ?auto_292286 )
      ( MAKE-1CRATE-VERIFY ?auto_292285 ?auto_292286 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292294 - SURFACE
      ?auto_292295 - SURFACE
      ?auto_292296 - SURFACE
    )
    :vars
    (
      ?auto_292299 - HOIST
      ?auto_292298 - PLACE
      ?auto_292301 - PLACE
      ?auto_292300 - HOIST
      ?auto_292302 - SURFACE
      ?auto_292297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292299 ?auto_292298 ) ( IS-CRATE ?auto_292296 ) ( not ( = ?auto_292295 ?auto_292296 ) ) ( not ( = ?auto_292294 ?auto_292295 ) ) ( not ( = ?auto_292294 ?auto_292296 ) ) ( not ( = ?auto_292301 ?auto_292298 ) ) ( HOIST-AT ?auto_292300 ?auto_292301 ) ( not ( = ?auto_292299 ?auto_292300 ) ) ( AVAILABLE ?auto_292300 ) ( SURFACE-AT ?auto_292296 ?auto_292301 ) ( ON ?auto_292296 ?auto_292302 ) ( CLEAR ?auto_292296 ) ( not ( = ?auto_292295 ?auto_292302 ) ) ( not ( = ?auto_292296 ?auto_292302 ) ) ( not ( = ?auto_292294 ?auto_292302 ) ) ( TRUCK-AT ?auto_292297 ?auto_292298 ) ( SURFACE-AT ?auto_292294 ?auto_292298 ) ( CLEAR ?auto_292294 ) ( IS-CRATE ?auto_292295 ) ( AVAILABLE ?auto_292299 ) ( IN ?auto_292295 ?auto_292297 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292295 ?auto_292296 )
      ( MAKE-2CRATE-VERIFY ?auto_292294 ?auto_292295 ?auto_292296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_292339 - SURFACE
      ?auto_292340 - SURFACE
    )
    :vars
    (
      ?auto_292346 - HOIST
      ?auto_292342 - PLACE
      ?auto_292345 - SURFACE
      ?auto_292344 - PLACE
      ?auto_292347 - HOIST
      ?auto_292343 - SURFACE
      ?auto_292341 - TRUCK
      ?auto_292348 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292346 ?auto_292342 ) ( SURFACE-AT ?auto_292339 ?auto_292342 ) ( CLEAR ?auto_292339 ) ( IS-CRATE ?auto_292340 ) ( not ( = ?auto_292339 ?auto_292340 ) ) ( AVAILABLE ?auto_292346 ) ( ON ?auto_292339 ?auto_292345 ) ( not ( = ?auto_292345 ?auto_292339 ) ) ( not ( = ?auto_292345 ?auto_292340 ) ) ( not ( = ?auto_292344 ?auto_292342 ) ) ( HOIST-AT ?auto_292347 ?auto_292344 ) ( not ( = ?auto_292346 ?auto_292347 ) ) ( AVAILABLE ?auto_292347 ) ( SURFACE-AT ?auto_292340 ?auto_292344 ) ( ON ?auto_292340 ?auto_292343 ) ( CLEAR ?auto_292340 ) ( not ( = ?auto_292339 ?auto_292343 ) ) ( not ( = ?auto_292340 ?auto_292343 ) ) ( not ( = ?auto_292345 ?auto_292343 ) ) ( TRUCK-AT ?auto_292341 ?auto_292348 ) ( not ( = ?auto_292348 ?auto_292342 ) ) ( not ( = ?auto_292344 ?auto_292348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292341 ?auto_292348 ?auto_292342 )
      ( MAKE-1CRATE ?auto_292339 ?auto_292340 )
      ( MAKE-1CRATE-VERIFY ?auto_292339 ?auto_292340 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292378 - SURFACE
      ?auto_292379 - SURFACE
      ?auto_292380 - SURFACE
      ?auto_292381 - SURFACE
    )
    :vars
    (
      ?auto_292382 - HOIST
      ?auto_292383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292382 ?auto_292383 ) ( SURFACE-AT ?auto_292380 ?auto_292383 ) ( CLEAR ?auto_292380 ) ( LIFTING ?auto_292382 ?auto_292381 ) ( IS-CRATE ?auto_292381 ) ( not ( = ?auto_292380 ?auto_292381 ) ) ( ON ?auto_292379 ?auto_292378 ) ( ON ?auto_292380 ?auto_292379 ) ( not ( = ?auto_292378 ?auto_292379 ) ) ( not ( = ?auto_292378 ?auto_292380 ) ) ( not ( = ?auto_292378 ?auto_292381 ) ) ( not ( = ?auto_292379 ?auto_292380 ) ) ( not ( = ?auto_292379 ?auto_292381 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292380 ?auto_292381 )
      ( MAKE-3CRATE-VERIFY ?auto_292378 ?auto_292379 ?auto_292380 ?auto_292381 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292395 - SURFACE
      ?auto_292396 - SURFACE
      ?auto_292397 - SURFACE
      ?auto_292398 - SURFACE
    )
    :vars
    (
      ?auto_292399 - HOIST
      ?auto_292400 - PLACE
      ?auto_292401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292399 ?auto_292400 ) ( SURFACE-AT ?auto_292397 ?auto_292400 ) ( CLEAR ?auto_292397 ) ( IS-CRATE ?auto_292398 ) ( not ( = ?auto_292397 ?auto_292398 ) ) ( TRUCK-AT ?auto_292401 ?auto_292400 ) ( AVAILABLE ?auto_292399 ) ( IN ?auto_292398 ?auto_292401 ) ( ON ?auto_292397 ?auto_292396 ) ( not ( = ?auto_292396 ?auto_292397 ) ) ( not ( = ?auto_292396 ?auto_292398 ) ) ( ON ?auto_292396 ?auto_292395 ) ( not ( = ?auto_292395 ?auto_292396 ) ) ( not ( = ?auto_292395 ?auto_292397 ) ) ( not ( = ?auto_292395 ?auto_292398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292396 ?auto_292397 ?auto_292398 )
      ( MAKE-3CRATE-VERIFY ?auto_292395 ?auto_292396 ?auto_292397 ?auto_292398 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292416 - SURFACE
      ?auto_292417 - SURFACE
      ?auto_292418 - SURFACE
      ?auto_292419 - SURFACE
    )
    :vars
    (
      ?auto_292420 - HOIST
      ?auto_292421 - PLACE
      ?auto_292422 - TRUCK
      ?auto_292423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292420 ?auto_292421 ) ( SURFACE-AT ?auto_292418 ?auto_292421 ) ( CLEAR ?auto_292418 ) ( IS-CRATE ?auto_292419 ) ( not ( = ?auto_292418 ?auto_292419 ) ) ( AVAILABLE ?auto_292420 ) ( IN ?auto_292419 ?auto_292422 ) ( ON ?auto_292418 ?auto_292417 ) ( not ( = ?auto_292417 ?auto_292418 ) ) ( not ( = ?auto_292417 ?auto_292419 ) ) ( TRUCK-AT ?auto_292422 ?auto_292423 ) ( not ( = ?auto_292423 ?auto_292421 ) ) ( ON ?auto_292417 ?auto_292416 ) ( not ( = ?auto_292416 ?auto_292417 ) ) ( not ( = ?auto_292416 ?auto_292418 ) ) ( not ( = ?auto_292416 ?auto_292419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292417 ?auto_292418 ?auto_292419 )
      ( MAKE-3CRATE-VERIFY ?auto_292416 ?auto_292417 ?auto_292418 ?auto_292419 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292440 - SURFACE
      ?auto_292441 - SURFACE
      ?auto_292442 - SURFACE
      ?auto_292443 - SURFACE
    )
    :vars
    (
      ?auto_292444 - HOIST
      ?auto_292445 - PLACE
      ?auto_292446 - TRUCK
      ?auto_292448 - PLACE
      ?auto_292447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292444 ?auto_292445 ) ( SURFACE-AT ?auto_292442 ?auto_292445 ) ( CLEAR ?auto_292442 ) ( IS-CRATE ?auto_292443 ) ( not ( = ?auto_292442 ?auto_292443 ) ) ( AVAILABLE ?auto_292444 ) ( ON ?auto_292442 ?auto_292441 ) ( not ( = ?auto_292441 ?auto_292442 ) ) ( not ( = ?auto_292441 ?auto_292443 ) ) ( TRUCK-AT ?auto_292446 ?auto_292448 ) ( not ( = ?auto_292448 ?auto_292445 ) ) ( HOIST-AT ?auto_292447 ?auto_292448 ) ( LIFTING ?auto_292447 ?auto_292443 ) ( not ( = ?auto_292444 ?auto_292447 ) ) ( ON ?auto_292441 ?auto_292440 ) ( not ( = ?auto_292440 ?auto_292441 ) ) ( not ( = ?auto_292440 ?auto_292442 ) ) ( not ( = ?auto_292440 ?auto_292443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292441 ?auto_292442 ?auto_292443 )
      ( MAKE-3CRATE-VERIFY ?auto_292440 ?auto_292441 ?auto_292442 ?auto_292443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292467 - SURFACE
      ?auto_292468 - SURFACE
      ?auto_292469 - SURFACE
      ?auto_292470 - SURFACE
    )
    :vars
    (
      ?auto_292474 - HOIST
      ?auto_292472 - PLACE
      ?auto_292475 - TRUCK
      ?auto_292473 - PLACE
      ?auto_292471 - HOIST
      ?auto_292476 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292474 ?auto_292472 ) ( SURFACE-AT ?auto_292469 ?auto_292472 ) ( CLEAR ?auto_292469 ) ( IS-CRATE ?auto_292470 ) ( not ( = ?auto_292469 ?auto_292470 ) ) ( AVAILABLE ?auto_292474 ) ( ON ?auto_292469 ?auto_292468 ) ( not ( = ?auto_292468 ?auto_292469 ) ) ( not ( = ?auto_292468 ?auto_292470 ) ) ( TRUCK-AT ?auto_292475 ?auto_292473 ) ( not ( = ?auto_292473 ?auto_292472 ) ) ( HOIST-AT ?auto_292471 ?auto_292473 ) ( not ( = ?auto_292474 ?auto_292471 ) ) ( AVAILABLE ?auto_292471 ) ( SURFACE-AT ?auto_292470 ?auto_292473 ) ( ON ?auto_292470 ?auto_292476 ) ( CLEAR ?auto_292470 ) ( not ( = ?auto_292469 ?auto_292476 ) ) ( not ( = ?auto_292470 ?auto_292476 ) ) ( not ( = ?auto_292468 ?auto_292476 ) ) ( ON ?auto_292468 ?auto_292467 ) ( not ( = ?auto_292467 ?auto_292468 ) ) ( not ( = ?auto_292467 ?auto_292469 ) ) ( not ( = ?auto_292467 ?auto_292470 ) ) ( not ( = ?auto_292467 ?auto_292476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292468 ?auto_292469 ?auto_292470 )
      ( MAKE-3CRATE-VERIFY ?auto_292467 ?auto_292468 ?auto_292469 ?auto_292470 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292495 - SURFACE
      ?auto_292496 - SURFACE
      ?auto_292497 - SURFACE
      ?auto_292498 - SURFACE
    )
    :vars
    (
      ?auto_292500 - HOIST
      ?auto_292499 - PLACE
      ?auto_292503 - PLACE
      ?auto_292502 - HOIST
      ?auto_292501 - SURFACE
      ?auto_292504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292500 ?auto_292499 ) ( SURFACE-AT ?auto_292497 ?auto_292499 ) ( CLEAR ?auto_292497 ) ( IS-CRATE ?auto_292498 ) ( not ( = ?auto_292497 ?auto_292498 ) ) ( AVAILABLE ?auto_292500 ) ( ON ?auto_292497 ?auto_292496 ) ( not ( = ?auto_292496 ?auto_292497 ) ) ( not ( = ?auto_292496 ?auto_292498 ) ) ( not ( = ?auto_292503 ?auto_292499 ) ) ( HOIST-AT ?auto_292502 ?auto_292503 ) ( not ( = ?auto_292500 ?auto_292502 ) ) ( AVAILABLE ?auto_292502 ) ( SURFACE-AT ?auto_292498 ?auto_292503 ) ( ON ?auto_292498 ?auto_292501 ) ( CLEAR ?auto_292498 ) ( not ( = ?auto_292497 ?auto_292501 ) ) ( not ( = ?auto_292498 ?auto_292501 ) ) ( not ( = ?auto_292496 ?auto_292501 ) ) ( TRUCK-AT ?auto_292504 ?auto_292499 ) ( ON ?auto_292496 ?auto_292495 ) ( not ( = ?auto_292495 ?auto_292496 ) ) ( not ( = ?auto_292495 ?auto_292497 ) ) ( not ( = ?auto_292495 ?auto_292498 ) ) ( not ( = ?auto_292495 ?auto_292501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292496 ?auto_292497 ?auto_292498 )
      ( MAKE-3CRATE-VERIFY ?auto_292495 ?auto_292496 ?auto_292497 ?auto_292498 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292523 - SURFACE
      ?auto_292524 - SURFACE
      ?auto_292525 - SURFACE
      ?auto_292526 - SURFACE
    )
    :vars
    (
      ?auto_292527 - HOIST
      ?auto_292532 - PLACE
      ?auto_292531 - PLACE
      ?auto_292529 - HOIST
      ?auto_292530 - SURFACE
      ?auto_292528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292527 ?auto_292532 ) ( IS-CRATE ?auto_292526 ) ( not ( = ?auto_292525 ?auto_292526 ) ) ( not ( = ?auto_292524 ?auto_292525 ) ) ( not ( = ?auto_292524 ?auto_292526 ) ) ( not ( = ?auto_292531 ?auto_292532 ) ) ( HOIST-AT ?auto_292529 ?auto_292531 ) ( not ( = ?auto_292527 ?auto_292529 ) ) ( AVAILABLE ?auto_292529 ) ( SURFACE-AT ?auto_292526 ?auto_292531 ) ( ON ?auto_292526 ?auto_292530 ) ( CLEAR ?auto_292526 ) ( not ( = ?auto_292525 ?auto_292530 ) ) ( not ( = ?auto_292526 ?auto_292530 ) ) ( not ( = ?auto_292524 ?auto_292530 ) ) ( TRUCK-AT ?auto_292528 ?auto_292532 ) ( SURFACE-AT ?auto_292524 ?auto_292532 ) ( CLEAR ?auto_292524 ) ( LIFTING ?auto_292527 ?auto_292525 ) ( IS-CRATE ?auto_292525 ) ( ON ?auto_292524 ?auto_292523 ) ( not ( = ?auto_292523 ?auto_292524 ) ) ( not ( = ?auto_292523 ?auto_292525 ) ) ( not ( = ?auto_292523 ?auto_292526 ) ) ( not ( = ?auto_292523 ?auto_292530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292524 ?auto_292525 ?auto_292526 )
      ( MAKE-3CRATE-VERIFY ?auto_292523 ?auto_292524 ?auto_292525 ?auto_292526 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_292551 - SURFACE
      ?auto_292552 - SURFACE
      ?auto_292553 - SURFACE
      ?auto_292554 - SURFACE
    )
    :vars
    (
      ?auto_292555 - HOIST
      ?auto_292558 - PLACE
      ?auto_292560 - PLACE
      ?auto_292557 - HOIST
      ?auto_292559 - SURFACE
      ?auto_292556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292555 ?auto_292558 ) ( IS-CRATE ?auto_292554 ) ( not ( = ?auto_292553 ?auto_292554 ) ) ( not ( = ?auto_292552 ?auto_292553 ) ) ( not ( = ?auto_292552 ?auto_292554 ) ) ( not ( = ?auto_292560 ?auto_292558 ) ) ( HOIST-AT ?auto_292557 ?auto_292560 ) ( not ( = ?auto_292555 ?auto_292557 ) ) ( AVAILABLE ?auto_292557 ) ( SURFACE-AT ?auto_292554 ?auto_292560 ) ( ON ?auto_292554 ?auto_292559 ) ( CLEAR ?auto_292554 ) ( not ( = ?auto_292553 ?auto_292559 ) ) ( not ( = ?auto_292554 ?auto_292559 ) ) ( not ( = ?auto_292552 ?auto_292559 ) ) ( TRUCK-AT ?auto_292556 ?auto_292558 ) ( SURFACE-AT ?auto_292552 ?auto_292558 ) ( CLEAR ?auto_292552 ) ( IS-CRATE ?auto_292553 ) ( AVAILABLE ?auto_292555 ) ( IN ?auto_292553 ?auto_292556 ) ( ON ?auto_292552 ?auto_292551 ) ( not ( = ?auto_292551 ?auto_292552 ) ) ( not ( = ?auto_292551 ?auto_292553 ) ) ( not ( = ?auto_292551 ?auto_292554 ) ) ( not ( = ?auto_292551 ?auto_292559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292552 ?auto_292553 ?auto_292554 )
      ( MAKE-3CRATE-VERIFY ?auto_292551 ?auto_292552 ?auto_292553 ?auto_292554 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292842 - SURFACE
      ?auto_292843 - SURFACE
      ?auto_292844 - SURFACE
      ?auto_292846 - SURFACE
      ?auto_292845 - SURFACE
    )
    :vars
    (
      ?auto_292847 - HOIST
      ?auto_292848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292847 ?auto_292848 ) ( SURFACE-AT ?auto_292846 ?auto_292848 ) ( CLEAR ?auto_292846 ) ( LIFTING ?auto_292847 ?auto_292845 ) ( IS-CRATE ?auto_292845 ) ( not ( = ?auto_292846 ?auto_292845 ) ) ( ON ?auto_292843 ?auto_292842 ) ( ON ?auto_292844 ?auto_292843 ) ( ON ?auto_292846 ?auto_292844 ) ( not ( = ?auto_292842 ?auto_292843 ) ) ( not ( = ?auto_292842 ?auto_292844 ) ) ( not ( = ?auto_292842 ?auto_292846 ) ) ( not ( = ?auto_292842 ?auto_292845 ) ) ( not ( = ?auto_292843 ?auto_292844 ) ) ( not ( = ?auto_292843 ?auto_292846 ) ) ( not ( = ?auto_292843 ?auto_292845 ) ) ( not ( = ?auto_292844 ?auto_292846 ) ) ( not ( = ?auto_292844 ?auto_292845 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_292846 ?auto_292845 )
      ( MAKE-4CRATE-VERIFY ?auto_292842 ?auto_292843 ?auto_292844 ?auto_292846 ?auto_292845 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292867 - SURFACE
      ?auto_292868 - SURFACE
      ?auto_292869 - SURFACE
      ?auto_292871 - SURFACE
      ?auto_292870 - SURFACE
    )
    :vars
    (
      ?auto_292873 - HOIST
      ?auto_292872 - PLACE
      ?auto_292874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292873 ?auto_292872 ) ( SURFACE-AT ?auto_292871 ?auto_292872 ) ( CLEAR ?auto_292871 ) ( IS-CRATE ?auto_292870 ) ( not ( = ?auto_292871 ?auto_292870 ) ) ( TRUCK-AT ?auto_292874 ?auto_292872 ) ( AVAILABLE ?auto_292873 ) ( IN ?auto_292870 ?auto_292874 ) ( ON ?auto_292871 ?auto_292869 ) ( not ( = ?auto_292869 ?auto_292871 ) ) ( not ( = ?auto_292869 ?auto_292870 ) ) ( ON ?auto_292868 ?auto_292867 ) ( ON ?auto_292869 ?auto_292868 ) ( not ( = ?auto_292867 ?auto_292868 ) ) ( not ( = ?auto_292867 ?auto_292869 ) ) ( not ( = ?auto_292867 ?auto_292871 ) ) ( not ( = ?auto_292867 ?auto_292870 ) ) ( not ( = ?auto_292868 ?auto_292869 ) ) ( not ( = ?auto_292868 ?auto_292871 ) ) ( not ( = ?auto_292868 ?auto_292870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292869 ?auto_292871 ?auto_292870 )
      ( MAKE-4CRATE-VERIFY ?auto_292867 ?auto_292868 ?auto_292869 ?auto_292871 ?auto_292870 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292897 - SURFACE
      ?auto_292898 - SURFACE
      ?auto_292899 - SURFACE
      ?auto_292901 - SURFACE
      ?auto_292900 - SURFACE
    )
    :vars
    (
      ?auto_292905 - HOIST
      ?auto_292903 - PLACE
      ?auto_292904 - TRUCK
      ?auto_292902 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292905 ?auto_292903 ) ( SURFACE-AT ?auto_292901 ?auto_292903 ) ( CLEAR ?auto_292901 ) ( IS-CRATE ?auto_292900 ) ( not ( = ?auto_292901 ?auto_292900 ) ) ( AVAILABLE ?auto_292905 ) ( IN ?auto_292900 ?auto_292904 ) ( ON ?auto_292901 ?auto_292899 ) ( not ( = ?auto_292899 ?auto_292901 ) ) ( not ( = ?auto_292899 ?auto_292900 ) ) ( TRUCK-AT ?auto_292904 ?auto_292902 ) ( not ( = ?auto_292902 ?auto_292903 ) ) ( ON ?auto_292898 ?auto_292897 ) ( ON ?auto_292899 ?auto_292898 ) ( not ( = ?auto_292897 ?auto_292898 ) ) ( not ( = ?auto_292897 ?auto_292899 ) ) ( not ( = ?auto_292897 ?auto_292901 ) ) ( not ( = ?auto_292897 ?auto_292900 ) ) ( not ( = ?auto_292898 ?auto_292899 ) ) ( not ( = ?auto_292898 ?auto_292901 ) ) ( not ( = ?auto_292898 ?auto_292900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292899 ?auto_292901 ?auto_292900 )
      ( MAKE-4CRATE-VERIFY ?auto_292897 ?auto_292898 ?auto_292899 ?auto_292901 ?auto_292900 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292931 - SURFACE
      ?auto_292932 - SURFACE
      ?auto_292933 - SURFACE
      ?auto_292935 - SURFACE
      ?auto_292934 - SURFACE
    )
    :vars
    (
      ?auto_292940 - HOIST
      ?auto_292936 - PLACE
      ?auto_292939 - TRUCK
      ?auto_292938 - PLACE
      ?auto_292937 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_292940 ?auto_292936 ) ( SURFACE-AT ?auto_292935 ?auto_292936 ) ( CLEAR ?auto_292935 ) ( IS-CRATE ?auto_292934 ) ( not ( = ?auto_292935 ?auto_292934 ) ) ( AVAILABLE ?auto_292940 ) ( ON ?auto_292935 ?auto_292933 ) ( not ( = ?auto_292933 ?auto_292935 ) ) ( not ( = ?auto_292933 ?auto_292934 ) ) ( TRUCK-AT ?auto_292939 ?auto_292938 ) ( not ( = ?auto_292938 ?auto_292936 ) ) ( HOIST-AT ?auto_292937 ?auto_292938 ) ( LIFTING ?auto_292937 ?auto_292934 ) ( not ( = ?auto_292940 ?auto_292937 ) ) ( ON ?auto_292932 ?auto_292931 ) ( ON ?auto_292933 ?auto_292932 ) ( not ( = ?auto_292931 ?auto_292932 ) ) ( not ( = ?auto_292931 ?auto_292933 ) ) ( not ( = ?auto_292931 ?auto_292935 ) ) ( not ( = ?auto_292931 ?auto_292934 ) ) ( not ( = ?auto_292932 ?auto_292933 ) ) ( not ( = ?auto_292932 ?auto_292935 ) ) ( not ( = ?auto_292932 ?auto_292934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292933 ?auto_292935 ?auto_292934 )
      ( MAKE-4CRATE-VERIFY ?auto_292931 ?auto_292932 ?auto_292933 ?auto_292935 ?auto_292934 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_292969 - SURFACE
      ?auto_292970 - SURFACE
      ?auto_292971 - SURFACE
      ?auto_292973 - SURFACE
      ?auto_292972 - SURFACE
    )
    :vars
    (
      ?auto_292978 - HOIST
      ?auto_292975 - PLACE
      ?auto_292977 - TRUCK
      ?auto_292974 - PLACE
      ?auto_292979 - HOIST
      ?auto_292976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292978 ?auto_292975 ) ( SURFACE-AT ?auto_292973 ?auto_292975 ) ( CLEAR ?auto_292973 ) ( IS-CRATE ?auto_292972 ) ( not ( = ?auto_292973 ?auto_292972 ) ) ( AVAILABLE ?auto_292978 ) ( ON ?auto_292973 ?auto_292971 ) ( not ( = ?auto_292971 ?auto_292973 ) ) ( not ( = ?auto_292971 ?auto_292972 ) ) ( TRUCK-AT ?auto_292977 ?auto_292974 ) ( not ( = ?auto_292974 ?auto_292975 ) ) ( HOIST-AT ?auto_292979 ?auto_292974 ) ( not ( = ?auto_292978 ?auto_292979 ) ) ( AVAILABLE ?auto_292979 ) ( SURFACE-AT ?auto_292972 ?auto_292974 ) ( ON ?auto_292972 ?auto_292976 ) ( CLEAR ?auto_292972 ) ( not ( = ?auto_292973 ?auto_292976 ) ) ( not ( = ?auto_292972 ?auto_292976 ) ) ( not ( = ?auto_292971 ?auto_292976 ) ) ( ON ?auto_292970 ?auto_292969 ) ( ON ?auto_292971 ?auto_292970 ) ( not ( = ?auto_292969 ?auto_292970 ) ) ( not ( = ?auto_292969 ?auto_292971 ) ) ( not ( = ?auto_292969 ?auto_292973 ) ) ( not ( = ?auto_292969 ?auto_292972 ) ) ( not ( = ?auto_292969 ?auto_292976 ) ) ( not ( = ?auto_292970 ?auto_292971 ) ) ( not ( = ?auto_292970 ?auto_292973 ) ) ( not ( = ?auto_292970 ?auto_292972 ) ) ( not ( = ?auto_292970 ?auto_292976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_292971 ?auto_292973 ?auto_292972 )
      ( MAKE-4CRATE-VERIFY ?auto_292969 ?auto_292970 ?auto_292971 ?auto_292973 ?auto_292972 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293008 - SURFACE
      ?auto_293009 - SURFACE
      ?auto_293010 - SURFACE
      ?auto_293012 - SURFACE
      ?auto_293011 - SURFACE
    )
    :vars
    (
      ?auto_293015 - HOIST
      ?auto_293017 - PLACE
      ?auto_293013 - PLACE
      ?auto_293016 - HOIST
      ?auto_293018 - SURFACE
      ?auto_293014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293015 ?auto_293017 ) ( SURFACE-AT ?auto_293012 ?auto_293017 ) ( CLEAR ?auto_293012 ) ( IS-CRATE ?auto_293011 ) ( not ( = ?auto_293012 ?auto_293011 ) ) ( AVAILABLE ?auto_293015 ) ( ON ?auto_293012 ?auto_293010 ) ( not ( = ?auto_293010 ?auto_293012 ) ) ( not ( = ?auto_293010 ?auto_293011 ) ) ( not ( = ?auto_293013 ?auto_293017 ) ) ( HOIST-AT ?auto_293016 ?auto_293013 ) ( not ( = ?auto_293015 ?auto_293016 ) ) ( AVAILABLE ?auto_293016 ) ( SURFACE-AT ?auto_293011 ?auto_293013 ) ( ON ?auto_293011 ?auto_293018 ) ( CLEAR ?auto_293011 ) ( not ( = ?auto_293012 ?auto_293018 ) ) ( not ( = ?auto_293011 ?auto_293018 ) ) ( not ( = ?auto_293010 ?auto_293018 ) ) ( TRUCK-AT ?auto_293014 ?auto_293017 ) ( ON ?auto_293009 ?auto_293008 ) ( ON ?auto_293010 ?auto_293009 ) ( not ( = ?auto_293008 ?auto_293009 ) ) ( not ( = ?auto_293008 ?auto_293010 ) ) ( not ( = ?auto_293008 ?auto_293012 ) ) ( not ( = ?auto_293008 ?auto_293011 ) ) ( not ( = ?auto_293008 ?auto_293018 ) ) ( not ( = ?auto_293009 ?auto_293010 ) ) ( not ( = ?auto_293009 ?auto_293012 ) ) ( not ( = ?auto_293009 ?auto_293011 ) ) ( not ( = ?auto_293009 ?auto_293018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293010 ?auto_293012 ?auto_293011 )
      ( MAKE-4CRATE-VERIFY ?auto_293008 ?auto_293009 ?auto_293010 ?auto_293012 ?auto_293011 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293047 - SURFACE
      ?auto_293048 - SURFACE
      ?auto_293049 - SURFACE
      ?auto_293051 - SURFACE
      ?auto_293050 - SURFACE
    )
    :vars
    (
      ?auto_293052 - HOIST
      ?auto_293053 - PLACE
      ?auto_293055 - PLACE
      ?auto_293054 - HOIST
      ?auto_293057 - SURFACE
      ?auto_293056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293052 ?auto_293053 ) ( IS-CRATE ?auto_293050 ) ( not ( = ?auto_293051 ?auto_293050 ) ) ( not ( = ?auto_293049 ?auto_293051 ) ) ( not ( = ?auto_293049 ?auto_293050 ) ) ( not ( = ?auto_293055 ?auto_293053 ) ) ( HOIST-AT ?auto_293054 ?auto_293055 ) ( not ( = ?auto_293052 ?auto_293054 ) ) ( AVAILABLE ?auto_293054 ) ( SURFACE-AT ?auto_293050 ?auto_293055 ) ( ON ?auto_293050 ?auto_293057 ) ( CLEAR ?auto_293050 ) ( not ( = ?auto_293051 ?auto_293057 ) ) ( not ( = ?auto_293050 ?auto_293057 ) ) ( not ( = ?auto_293049 ?auto_293057 ) ) ( TRUCK-AT ?auto_293056 ?auto_293053 ) ( SURFACE-AT ?auto_293049 ?auto_293053 ) ( CLEAR ?auto_293049 ) ( LIFTING ?auto_293052 ?auto_293051 ) ( IS-CRATE ?auto_293051 ) ( ON ?auto_293048 ?auto_293047 ) ( ON ?auto_293049 ?auto_293048 ) ( not ( = ?auto_293047 ?auto_293048 ) ) ( not ( = ?auto_293047 ?auto_293049 ) ) ( not ( = ?auto_293047 ?auto_293051 ) ) ( not ( = ?auto_293047 ?auto_293050 ) ) ( not ( = ?auto_293047 ?auto_293057 ) ) ( not ( = ?auto_293048 ?auto_293049 ) ) ( not ( = ?auto_293048 ?auto_293051 ) ) ( not ( = ?auto_293048 ?auto_293050 ) ) ( not ( = ?auto_293048 ?auto_293057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293049 ?auto_293051 ?auto_293050 )
      ( MAKE-4CRATE-VERIFY ?auto_293047 ?auto_293048 ?auto_293049 ?auto_293051 ?auto_293050 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_293086 - SURFACE
      ?auto_293087 - SURFACE
      ?auto_293088 - SURFACE
      ?auto_293090 - SURFACE
      ?auto_293089 - SURFACE
    )
    :vars
    (
      ?auto_293093 - HOIST
      ?auto_293096 - PLACE
      ?auto_293094 - PLACE
      ?auto_293091 - HOIST
      ?auto_293092 - SURFACE
      ?auto_293095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293093 ?auto_293096 ) ( IS-CRATE ?auto_293089 ) ( not ( = ?auto_293090 ?auto_293089 ) ) ( not ( = ?auto_293088 ?auto_293090 ) ) ( not ( = ?auto_293088 ?auto_293089 ) ) ( not ( = ?auto_293094 ?auto_293096 ) ) ( HOIST-AT ?auto_293091 ?auto_293094 ) ( not ( = ?auto_293093 ?auto_293091 ) ) ( AVAILABLE ?auto_293091 ) ( SURFACE-AT ?auto_293089 ?auto_293094 ) ( ON ?auto_293089 ?auto_293092 ) ( CLEAR ?auto_293089 ) ( not ( = ?auto_293090 ?auto_293092 ) ) ( not ( = ?auto_293089 ?auto_293092 ) ) ( not ( = ?auto_293088 ?auto_293092 ) ) ( TRUCK-AT ?auto_293095 ?auto_293096 ) ( SURFACE-AT ?auto_293088 ?auto_293096 ) ( CLEAR ?auto_293088 ) ( IS-CRATE ?auto_293090 ) ( AVAILABLE ?auto_293093 ) ( IN ?auto_293090 ?auto_293095 ) ( ON ?auto_293087 ?auto_293086 ) ( ON ?auto_293088 ?auto_293087 ) ( not ( = ?auto_293086 ?auto_293087 ) ) ( not ( = ?auto_293086 ?auto_293088 ) ) ( not ( = ?auto_293086 ?auto_293090 ) ) ( not ( = ?auto_293086 ?auto_293089 ) ) ( not ( = ?auto_293086 ?auto_293092 ) ) ( not ( = ?auto_293087 ?auto_293088 ) ) ( not ( = ?auto_293087 ?auto_293090 ) ) ( not ( = ?auto_293087 ?auto_293089 ) ) ( not ( = ?auto_293087 ?auto_293092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293088 ?auto_293090 ?auto_293089 )
      ( MAKE-4CRATE-VERIFY ?auto_293086 ?auto_293087 ?auto_293088 ?auto_293090 ?auto_293089 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293746 - SURFACE
      ?auto_293747 - SURFACE
      ?auto_293748 - SURFACE
      ?auto_293750 - SURFACE
      ?auto_293749 - SURFACE
      ?auto_293751 - SURFACE
    )
    :vars
    (
      ?auto_293753 - HOIST
      ?auto_293752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293753 ?auto_293752 ) ( SURFACE-AT ?auto_293749 ?auto_293752 ) ( CLEAR ?auto_293749 ) ( LIFTING ?auto_293753 ?auto_293751 ) ( IS-CRATE ?auto_293751 ) ( not ( = ?auto_293749 ?auto_293751 ) ) ( ON ?auto_293747 ?auto_293746 ) ( ON ?auto_293748 ?auto_293747 ) ( ON ?auto_293750 ?auto_293748 ) ( ON ?auto_293749 ?auto_293750 ) ( not ( = ?auto_293746 ?auto_293747 ) ) ( not ( = ?auto_293746 ?auto_293748 ) ) ( not ( = ?auto_293746 ?auto_293750 ) ) ( not ( = ?auto_293746 ?auto_293749 ) ) ( not ( = ?auto_293746 ?auto_293751 ) ) ( not ( = ?auto_293747 ?auto_293748 ) ) ( not ( = ?auto_293747 ?auto_293750 ) ) ( not ( = ?auto_293747 ?auto_293749 ) ) ( not ( = ?auto_293747 ?auto_293751 ) ) ( not ( = ?auto_293748 ?auto_293750 ) ) ( not ( = ?auto_293748 ?auto_293749 ) ) ( not ( = ?auto_293748 ?auto_293751 ) ) ( not ( = ?auto_293750 ?auto_293749 ) ) ( not ( = ?auto_293750 ?auto_293751 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_293749 ?auto_293751 )
      ( MAKE-5CRATE-VERIFY ?auto_293746 ?auto_293747 ?auto_293748 ?auto_293750 ?auto_293749 ?auto_293751 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293780 - SURFACE
      ?auto_293781 - SURFACE
      ?auto_293782 - SURFACE
      ?auto_293784 - SURFACE
      ?auto_293783 - SURFACE
      ?auto_293785 - SURFACE
    )
    :vars
    (
      ?auto_293788 - HOIST
      ?auto_293787 - PLACE
      ?auto_293786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293788 ?auto_293787 ) ( SURFACE-AT ?auto_293783 ?auto_293787 ) ( CLEAR ?auto_293783 ) ( IS-CRATE ?auto_293785 ) ( not ( = ?auto_293783 ?auto_293785 ) ) ( TRUCK-AT ?auto_293786 ?auto_293787 ) ( AVAILABLE ?auto_293788 ) ( IN ?auto_293785 ?auto_293786 ) ( ON ?auto_293783 ?auto_293784 ) ( not ( = ?auto_293784 ?auto_293783 ) ) ( not ( = ?auto_293784 ?auto_293785 ) ) ( ON ?auto_293781 ?auto_293780 ) ( ON ?auto_293782 ?auto_293781 ) ( ON ?auto_293784 ?auto_293782 ) ( not ( = ?auto_293780 ?auto_293781 ) ) ( not ( = ?auto_293780 ?auto_293782 ) ) ( not ( = ?auto_293780 ?auto_293784 ) ) ( not ( = ?auto_293780 ?auto_293783 ) ) ( not ( = ?auto_293780 ?auto_293785 ) ) ( not ( = ?auto_293781 ?auto_293782 ) ) ( not ( = ?auto_293781 ?auto_293784 ) ) ( not ( = ?auto_293781 ?auto_293783 ) ) ( not ( = ?auto_293781 ?auto_293785 ) ) ( not ( = ?auto_293782 ?auto_293784 ) ) ( not ( = ?auto_293782 ?auto_293783 ) ) ( not ( = ?auto_293782 ?auto_293785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293784 ?auto_293783 ?auto_293785 )
      ( MAKE-5CRATE-VERIFY ?auto_293780 ?auto_293781 ?auto_293782 ?auto_293784 ?auto_293783 ?auto_293785 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293820 - SURFACE
      ?auto_293821 - SURFACE
      ?auto_293822 - SURFACE
      ?auto_293824 - SURFACE
      ?auto_293823 - SURFACE
      ?auto_293825 - SURFACE
    )
    :vars
    (
      ?auto_293828 - HOIST
      ?auto_293827 - PLACE
      ?auto_293829 - TRUCK
      ?auto_293826 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293828 ?auto_293827 ) ( SURFACE-AT ?auto_293823 ?auto_293827 ) ( CLEAR ?auto_293823 ) ( IS-CRATE ?auto_293825 ) ( not ( = ?auto_293823 ?auto_293825 ) ) ( AVAILABLE ?auto_293828 ) ( IN ?auto_293825 ?auto_293829 ) ( ON ?auto_293823 ?auto_293824 ) ( not ( = ?auto_293824 ?auto_293823 ) ) ( not ( = ?auto_293824 ?auto_293825 ) ) ( TRUCK-AT ?auto_293829 ?auto_293826 ) ( not ( = ?auto_293826 ?auto_293827 ) ) ( ON ?auto_293821 ?auto_293820 ) ( ON ?auto_293822 ?auto_293821 ) ( ON ?auto_293824 ?auto_293822 ) ( not ( = ?auto_293820 ?auto_293821 ) ) ( not ( = ?auto_293820 ?auto_293822 ) ) ( not ( = ?auto_293820 ?auto_293824 ) ) ( not ( = ?auto_293820 ?auto_293823 ) ) ( not ( = ?auto_293820 ?auto_293825 ) ) ( not ( = ?auto_293821 ?auto_293822 ) ) ( not ( = ?auto_293821 ?auto_293824 ) ) ( not ( = ?auto_293821 ?auto_293823 ) ) ( not ( = ?auto_293821 ?auto_293825 ) ) ( not ( = ?auto_293822 ?auto_293824 ) ) ( not ( = ?auto_293822 ?auto_293823 ) ) ( not ( = ?auto_293822 ?auto_293825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293824 ?auto_293823 ?auto_293825 )
      ( MAKE-5CRATE-VERIFY ?auto_293820 ?auto_293821 ?auto_293822 ?auto_293824 ?auto_293823 ?auto_293825 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293865 - SURFACE
      ?auto_293866 - SURFACE
      ?auto_293867 - SURFACE
      ?auto_293869 - SURFACE
      ?auto_293868 - SURFACE
      ?auto_293870 - SURFACE
    )
    :vars
    (
      ?auto_293871 - HOIST
      ?auto_293875 - PLACE
      ?auto_293873 - TRUCK
      ?auto_293872 - PLACE
      ?auto_293874 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_293871 ?auto_293875 ) ( SURFACE-AT ?auto_293868 ?auto_293875 ) ( CLEAR ?auto_293868 ) ( IS-CRATE ?auto_293870 ) ( not ( = ?auto_293868 ?auto_293870 ) ) ( AVAILABLE ?auto_293871 ) ( ON ?auto_293868 ?auto_293869 ) ( not ( = ?auto_293869 ?auto_293868 ) ) ( not ( = ?auto_293869 ?auto_293870 ) ) ( TRUCK-AT ?auto_293873 ?auto_293872 ) ( not ( = ?auto_293872 ?auto_293875 ) ) ( HOIST-AT ?auto_293874 ?auto_293872 ) ( LIFTING ?auto_293874 ?auto_293870 ) ( not ( = ?auto_293871 ?auto_293874 ) ) ( ON ?auto_293866 ?auto_293865 ) ( ON ?auto_293867 ?auto_293866 ) ( ON ?auto_293869 ?auto_293867 ) ( not ( = ?auto_293865 ?auto_293866 ) ) ( not ( = ?auto_293865 ?auto_293867 ) ) ( not ( = ?auto_293865 ?auto_293869 ) ) ( not ( = ?auto_293865 ?auto_293868 ) ) ( not ( = ?auto_293865 ?auto_293870 ) ) ( not ( = ?auto_293866 ?auto_293867 ) ) ( not ( = ?auto_293866 ?auto_293869 ) ) ( not ( = ?auto_293866 ?auto_293868 ) ) ( not ( = ?auto_293866 ?auto_293870 ) ) ( not ( = ?auto_293867 ?auto_293869 ) ) ( not ( = ?auto_293867 ?auto_293868 ) ) ( not ( = ?auto_293867 ?auto_293870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293869 ?auto_293868 ?auto_293870 )
      ( MAKE-5CRATE-VERIFY ?auto_293865 ?auto_293866 ?auto_293867 ?auto_293869 ?auto_293868 ?auto_293870 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293915 - SURFACE
      ?auto_293916 - SURFACE
      ?auto_293917 - SURFACE
      ?auto_293919 - SURFACE
      ?auto_293918 - SURFACE
      ?auto_293920 - SURFACE
    )
    :vars
    (
      ?auto_293924 - HOIST
      ?auto_293925 - PLACE
      ?auto_293926 - TRUCK
      ?auto_293922 - PLACE
      ?auto_293921 - HOIST
      ?auto_293923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293924 ?auto_293925 ) ( SURFACE-AT ?auto_293918 ?auto_293925 ) ( CLEAR ?auto_293918 ) ( IS-CRATE ?auto_293920 ) ( not ( = ?auto_293918 ?auto_293920 ) ) ( AVAILABLE ?auto_293924 ) ( ON ?auto_293918 ?auto_293919 ) ( not ( = ?auto_293919 ?auto_293918 ) ) ( not ( = ?auto_293919 ?auto_293920 ) ) ( TRUCK-AT ?auto_293926 ?auto_293922 ) ( not ( = ?auto_293922 ?auto_293925 ) ) ( HOIST-AT ?auto_293921 ?auto_293922 ) ( not ( = ?auto_293924 ?auto_293921 ) ) ( AVAILABLE ?auto_293921 ) ( SURFACE-AT ?auto_293920 ?auto_293922 ) ( ON ?auto_293920 ?auto_293923 ) ( CLEAR ?auto_293920 ) ( not ( = ?auto_293918 ?auto_293923 ) ) ( not ( = ?auto_293920 ?auto_293923 ) ) ( not ( = ?auto_293919 ?auto_293923 ) ) ( ON ?auto_293916 ?auto_293915 ) ( ON ?auto_293917 ?auto_293916 ) ( ON ?auto_293919 ?auto_293917 ) ( not ( = ?auto_293915 ?auto_293916 ) ) ( not ( = ?auto_293915 ?auto_293917 ) ) ( not ( = ?auto_293915 ?auto_293919 ) ) ( not ( = ?auto_293915 ?auto_293918 ) ) ( not ( = ?auto_293915 ?auto_293920 ) ) ( not ( = ?auto_293915 ?auto_293923 ) ) ( not ( = ?auto_293916 ?auto_293917 ) ) ( not ( = ?auto_293916 ?auto_293919 ) ) ( not ( = ?auto_293916 ?auto_293918 ) ) ( not ( = ?auto_293916 ?auto_293920 ) ) ( not ( = ?auto_293916 ?auto_293923 ) ) ( not ( = ?auto_293917 ?auto_293919 ) ) ( not ( = ?auto_293917 ?auto_293918 ) ) ( not ( = ?auto_293917 ?auto_293920 ) ) ( not ( = ?auto_293917 ?auto_293923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293919 ?auto_293918 ?auto_293920 )
      ( MAKE-5CRATE-VERIFY ?auto_293915 ?auto_293916 ?auto_293917 ?auto_293919 ?auto_293918 ?auto_293920 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_293966 - SURFACE
      ?auto_293967 - SURFACE
      ?auto_293968 - SURFACE
      ?auto_293970 - SURFACE
      ?auto_293969 - SURFACE
      ?auto_293971 - SURFACE
    )
    :vars
    (
      ?auto_293974 - HOIST
      ?auto_293972 - PLACE
      ?auto_293976 - PLACE
      ?auto_293977 - HOIST
      ?auto_293973 - SURFACE
      ?auto_293975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_293974 ?auto_293972 ) ( SURFACE-AT ?auto_293969 ?auto_293972 ) ( CLEAR ?auto_293969 ) ( IS-CRATE ?auto_293971 ) ( not ( = ?auto_293969 ?auto_293971 ) ) ( AVAILABLE ?auto_293974 ) ( ON ?auto_293969 ?auto_293970 ) ( not ( = ?auto_293970 ?auto_293969 ) ) ( not ( = ?auto_293970 ?auto_293971 ) ) ( not ( = ?auto_293976 ?auto_293972 ) ) ( HOIST-AT ?auto_293977 ?auto_293976 ) ( not ( = ?auto_293974 ?auto_293977 ) ) ( AVAILABLE ?auto_293977 ) ( SURFACE-AT ?auto_293971 ?auto_293976 ) ( ON ?auto_293971 ?auto_293973 ) ( CLEAR ?auto_293971 ) ( not ( = ?auto_293969 ?auto_293973 ) ) ( not ( = ?auto_293971 ?auto_293973 ) ) ( not ( = ?auto_293970 ?auto_293973 ) ) ( TRUCK-AT ?auto_293975 ?auto_293972 ) ( ON ?auto_293967 ?auto_293966 ) ( ON ?auto_293968 ?auto_293967 ) ( ON ?auto_293970 ?auto_293968 ) ( not ( = ?auto_293966 ?auto_293967 ) ) ( not ( = ?auto_293966 ?auto_293968 ) ) ( not ( = ?auto_293966 ?auto_293970 ) ) ( not ( = ?auto_293966 ?auto_293969 ) ) ( not ( = ?auto_293966 ?auto_293971 ) ) ( not ( = ?auto_293966 ?auto_293973 ) ) ( not ( = ?auto_293967 ?auto_293968 ) ) ( not ( = ?auto_293967 ?auto_293970 ) ) ( not ( = ?auto_293967 ?auto_293969 ) ) ( not ( = ?auto_293967 ?auto_293971 ) ) ( not ( = ?auto_293967 ?auto_293973 ) ) ( not ( = ?auto_293968 ?auto_293970 ) ) ( not ( = ?auto_293968 ?auto_293969 ) ) ( not ( = ?auto_293968 ?auto_293971 ) ) ( not ( = ?auto_293968 ?auto_293973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_293970 ?auto_293969 ?auto_293971 )
      ( MAKE-5CRATE-VERIFY ?auto_293966 ?auto_293967 ?auto_293968 ?auto_293970 ?auto_293969 ?auto_293971 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294017 - SURFACE
      ?auto_294018 - SURFACE
      ?auto_294019 - SURFACE
      ?auto_294021 - SURFACE
      ?auto_294020 - SURFACE
      ?auto_294022 - SURFACE
    )
    :vars
    (
      ?auto_294026 - HOIST
      ?auto_294024 - PLACE
      ?auto_294023 - PLACE
      ?auto_294028 - HOIST
      ?auto_294025 - SURFACE
      ?auto_294027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294026 ?auto_294024 ) ( IS-CRATE ?auto_294022 ) ( not ( = ?auto_294020 ?auto_294022 ) ) ( not ( = ?auto_294021 ?auto_294020 ) ) ( not ( = ?auto_294021 ?auto_294022 ) ) ( not ( = ?auto_294023 ?auto_294024 ) ) ( HOIST-AT ?auto_294028 ?auto_294023 ) ( not ( = ?auto_294026 ?auto_294028 ) ) ( AVAILABLE ?auto_294028 ) ( SURFACE-AT ?auto_294022 ?auto_294023 ) ( ON ?auto_294022 ?auto_294025 ) ( CLEAR ?auto_294022 ) ( not ( = ?auto_294020 ?auto_294025 ) ) ( not ( = ?auto_294022 ?auto_294025 ) ) ( not ( = ?auto_294021 ?auto_294025 ) ) ( TRUCK-AT ?auto_294027 ?auto_294024 ) ( SURFACE-AT ?auto_294021 ?auto_294024 ) ( CLEAR ?auto_294021 ) ( LIFTING ?auto_294026 ?auto_294020 ) ( IS-CRATE ?auto_294020 ) ( ON ?auto_294018 ?auto_294017 ) ( ON ?auto_294019 ?auto_294018 ) ( ON ?auto_294021 ?auto_294019 ) ( not ( = ?auto_294017 ?auto_294018 ) ) ( not ( = ?auto_294017 ?auto_294019 ) ) ( not ( = ?auto_294017 ?auto_294021 ) ) ( not ( = ?auto_294017 ?auto_294020 ) ) ( not ( = ?auto_294017 ?auto_294022 ) ) ( not ( = ?auto_294017 ?auto_294025 ) ) ( not ( = ?auto_294018 ?auto_294019 ) ) ( not ( = ?auto_294018 ?auto_294021 ) ) ( not ( = ?auto_294018 ?auto_294020 ) ) ( not ( = ?auto_294018 ?auto_294022 ) ) ( not ( = ?auto_294018 ?auto_294025 ) ) ( not ( = ?auto_294019 ?auto_294021 ) ) ( not ( = ?auto_294019 ?auto_294020 ) ) ( not ( = ?auto_294019 ?auto_294022 ) ) ( not ( = ?auto_294019 ?auto_294025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294021 ?auto_294020 ?auto_294022 )
      ( MAKE-5CRATE-VERIFY ?auto_294017 ?auto_294018 ?auto_294019 ?auto_294021 ?auto_294020 ?auto_294022 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_294068 - SURFACE
      ?auto_294069 - SURFACE
      ?auto_294070 - SURFACE
      ?auto_294072 - SURFACE
      ?auto_294071 - SURFACE
      ?auto_294073 - SURFACE
    )
    :vars
    (
      ?auto_294078 - HOIST
      ?auto_294076 - PLACE
      ?auto_294077 - PLACE
      ?auto_294074 - HOIST
      ?auto_294075 - SURFACE
      ?auto_294079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294078 ?auto_294076 ) ( IS-CRATE ?auto_294073 ) ( not ( = ?auto_294071 ?auto_294073 ) ) ( not ( = ?auto_294072 ?auto_294071 ) ) ( not ( = ?auto_294072 ?auto_294073 ) ) ( not ( = ?auto_294077 ?auto_294076 ) ) ( HOIST-AT ?auto_294074 ?auto_294077 ) ( not ( = ?auto_294078 ?auto_294074 ) ) ( AVAILABLE ?auto_294074 ) ( SURFACE-AT ?auto_294073 ?auto_294077 ) ( ON ?auto_294073 ?auto_294075 ) ( CLEAR ?auto_294073 ) ( not ( = ?auto_294071 ?auto_294075 ) ) ( not ( = ?auto_294073 ?auto_294075 ) ) ( not ( = ?auto_294072 ?auto_294075 ) ) ( TRUCK-AT ?auto_294079 ?auto_294076 ) ( SURFACE-AT ?auto_294072 ?auto_294076 ) ( CLEAR ?auto_294072 ) ( IS-CRATE ?auto_294071 ) ( AVAILABLE ?auto_294078 ) ( IN ?auto_294071 ?auto_294079 ) ( ON ?auto_294069 ?auto_294068 ) ( ON ?auto_294070 ?auto_294069 ) ( ON ?auto_294072 ?auto_294070 ) ( not ( = ?auto_294068 ?auto_294069 ) ) ( not ( = ?auto_294068 ?auto_294070 ) ) ( not ( = ?auto_294068 ?auto_294072 ) ) ( not ( = ?auto_294068 ?auto_294071 ) ) ( not ( = ?auto_294068 ?auto_294073 ) ) ( not ( = ?auto_294068 ?auto_294075 ) ) ( not ( = ?auto_294069 ?auto_294070 ) ) ( not ( = ?auto_294069 ?auto_294072 ) ) ( not ( = ?auto_294069 ?auto_294071 ) ) ( not ( = ?auto_294069 ?auto_294073 ) ) ( not ( = ?auto_294069 ?auto_294075 ) ) ( not ( = ?auto_294070 ?auto_294072 ) ) ( not ( = ?auto_294070 ?auto_294071 ) ) ( not ( = ?auto_294070 ?auto_294073 ) ) ( not ( = ?auto_294070 ?auto_294075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_294072 ?auto_294071 ?auto_294073 )
      ( MAKE-5CRATE-VERIFY ?auto_294068 ?auto_294069 ?auto_294070 ?auto_294072 ?auto_294071 ?auto_294073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_295060 - SURFACE
      ?auto_295061 - SURFACE
    )
    :vars
    (
      ?auto_295068 - HOIST
      ?auto_295066 - PLACE
      ?auto_295065 - SURFACE
      ?auto_295067 - TRUCK
      ?auto_295064 - PLACE
      ?auto_295063 - HOIST
      ?auto_295062 - SURFACE
      ?auto_295069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295068 ?auto_295066 ) ( SURFACE-AT ?auto_295060 ?auto_295066 ) ( CLEAR ?auto_295060 ) ( IS-CRATE ?auto_295061 ) ( not ( = ?auto_295060 ?auto_295061 ) ) ( AVAILABLE ?auto_295068 ) ( ON ?auto_295060 ?auto_295065 ) ( not ( = ?auto_295065 ?auto_295060 ) ) ( not ( = ?auto_295065 ?auto_295061 ) ) ( TRUCK-AT ?auto_295067 ?auto_295064 ) ( not ( = ?auto_295064 ?auto_295066 ) ) ( HOIST-AT ?auto_295063 ?auto_295064 ) ( not ( = ?auto_295068 ?auto_295063 ) ) ( SURFACE-AT ?auto_295061 ?auto_295064 ) ( ON ?auto_295061 ?auto_295062 ) ( CLEAR ?auto_295061 ) ( not ( = ?auto_295060 ?auto_295062 ) ) ( not ( = ?auto_295061 ?auto_295062 ) ) ( not ( = ?auto_295065 ?auto_295062 ) ) ( LIFTING ?auto_295063 ?auto_295069 ) ( IS-CRATE ?auto_295069 ) ( not ( = ?auto_295060 ?auto_295069 ) ) ( not ( = ?auto_295061 ?auto_295069 ) ) ( not ( = ?auto_295065 ?auto_295069 ) ) ( not ( = ?auto_295062 ?auto_295069 ) ) )
    :subtasks
    ( ( !LOAD ?auto_295063 ?auto_295069 ?auto_295067 ?auto_295064 )
      ( MAKE-1CRATE ?auto_295060 ?auto_295061 )
      ( MAKE-1CRATE-VERIFY ?auto_295060 ?auto_295061 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295275 - SURFACE
      ?auto_295276 - SURFACE
      ?auto_295277 - SURFACE
      ?auto_295279 - SURFACE
      ?auto_295278 - SURFACE
      ?auto_295280 - SURFACE
      ?auto_295281 - SURFACE
    )
    :vars
    (
      ?auto_295282 - HOIST
      ?auto_295283 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295282 ?auto_295283 ) ( SURFACE-AT ?auto_295280 ?auto_295283 ) ( CLEAR ?auto_295280 ) ( LIFTING ?auto_295282 ?auto_295281 ) ( IS-CRATE ?auto_295281 ) ( not ( = ?auto_295280 ?auto_295281 ) ) ( ON ?auto_295276 ?auto_295275 ) ( ON ?auto_295277 ?auto_295276 ) ( ON ?auto_295279 ?auto_295277 ) ( ON ?auto_295278 ?auto_295279 ) ( ON ?auto_295280 ?auto_295278 ) ( not ( = ?auto_295275 ?auto_295276 ) ) ( not ( = ?auto_295275 ?auto_295277 ) ) ( not ( = ?auto_295275 ?auto_295279 ) ) ( not ( = ?auto_295275 ?auto_295278 ) ) ( not ( = ?auto_295275 ?auto_295280 ) ) ( not ( = ?auto_295275 ?auto_295281 ) ) ( not ( = ?auto_295276 ?auto_295277 ) ) ( not ( = ?auto_295276 ?auto_295279 ) ) ( not ( = ?auto_295276 ?auto_295278 ) ) ( not ( = ?auto_295276 ?auto_295280 ) ) ( not ( = ?auto_295276 ?auto_295281 ) ) ( not ( = ?auto_295277 ?auto_295279 ) ) ( not ( = ?auto_295277 ?auto_295278 ) ) ( not ( = ?auto_295277 ?auto_295280 ) ) ( not ( = ?auto_295277 ?auto_295281 ) ) ( not ( = ?auto_295279 ?auto_295278 ) ) ( not ( = ?auto_295279 ?auto_295280 ) ) ( not ( = ?auto_295279 ?auto_295281 ) ) ( not ( = ?auto_295278 ?auto_295280 ) ) ( not ( = ?auto_295278 ?auto_295281 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_295280 ?auto_295281 )
      ( MAKE-6CRATE-VERIFY ?auto_295275 ?auto_295276 ?auto_295277 ?auto_295279 ?auto_295278 ?auto_295280 ?auto_295281 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295319 - SURFACE
      ?auto_295320 - SURFACE
      ?auto_295321 - SURFACE
      ?auto_295323 - SURFACE
      ?auto_295322 - SURFACE
      ?auto_295324 - SURFACE
      ?auto_295325 - SURFACE
    )
    :vars
    (
      ?auto_295327 - HOIST
      ?auto_295326 - PLACE
      ?auto_295328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295327 ?auto_295326 ) ( SURFACE-AT ?auto_295324 ?auto_295326 ) ( CLEAR ?auto_295324 ) ( IS-CRATE ?auto_295325 ) ( not ( = ?auto_295324 ?auto_295325 ) ) ( TRUCK-AT ?auto_295328 ?auto_295326 ) ( AVAILABLE ?auto_295327 ) ( IN ?auto_295325 ?auto_295328 ) ( ON ?auto_295324 ?auto_295322 ) ( not ( = ?auto_295322 ?auto_295324 ) ) ( not ( = ?auto_295322 ?auto_295325 ) ) ( ON ?auto_295320 ?auto_295319 ) ( ON ?auto_295321 ?auto_295320 ) ( ON ?auto_295323 ?auto_295321 ) ( ON ?auto_295322 ?auto_295323 ) ( not ( = ?auto_295319 ?auto_295320 ) ) ( not ( = ?auto_295319 ?auto_295321 ) ) ( not ( = ?auto_295319 ?auto_295323 ) ) ( not ( = ?auto_295319 ?auto_295322 ) ) ( not ( = ?auto_295319 ?auto_295324 ) ) ( not ( = ?auto_295319 ?auto_295325 ) ) ( not ( = ?auto_295320 ?auto_295321 ) ) ( not ( = ?auto_295320 ?auto_295323 ) ) ( not ( = ?auto_295320 ?auto_295322 ) ) ( not ( = ?auto_295320 ?auto_295324 ) ) ( not ( = ?auto_295320 ?auto_295325 ) ) ( not ( = ?auto_295321 ?auto_295323 ) ) ( not ( = ?auto_295321 ?auto_295322 ) ) ( not ( = ?auto_295321 ?auto_295324 ) ) ( not ( = ?auto_295321 ?auto_295325 ) ) ( not ( = ?auto_295323 ?auto_295322 ) ) ( not ( = ?auto_295323 ?auto_295324 ) ) ( not ( = ?auto_295323 ?auto_295325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295322 ?auto_295324 ?auto_295325 )
      ( MAKE-6CRATE-VERIFY ?auto_295319 ?auto_295320 ?auto_295321 ?auto_295323 ?auto_295322 ?auto_295324 ?auto_295325 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295370 - SURFACE
      ?auto_295371 - SURFACE
      ?auto_295372 - SURFACE
      ?auto_295374 - SURFACE
      ?auto_295373 - SURFACE
      ?auto_295375 - SURFACE
      ?auto_295376 - SURFACE
    )
    :vars
    (
      ?auto_295380 - HOIST
      ?auto_295377 - PLACE
      ?auto_295379 - TRUCK
      ?auto_295378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295380 ?auto_295377 ) ( SURFACE-AT ?auto_295375 ?auto_295377 ) ( CLEAR ?auto_295375 ) ( IS-CRATE ?auto_295376 ) ( not ( = ?auto_295375 ?auto_295376 ) ) ( AVAILABLE ?auto_295380 ) ( IN ?auto_295376 ?auto_295379 ) ( ON ?auto_295375 ?auto_295373 ) ( not ( = ?auto_295373 ?auto_295375 ) ) ( not ( = ?auto_295373 ?auto_295376 ) ) ( TRUCK-AT ?auto_295379 ?auto_295378 ) ( not ( = ?auto_295378 ?auto_295377 ) ) ( ON ?auto_295371 ?auto_295370 ) ( ON ?auto_295372 ?auto_295371 ) ( ON ?auto_295374 ?auto_295372 ) ( ON ?auto_295373 ?auto_295374 ) ( not ( = ?auto_295370 ?auto_295371 ) ) ( not ( = ?auto_295370 ?auto_295372 ) ) ( not ( = ?auto_295370 ?auto_295374 ) ) ( not ( = ?auto_295370 ?auto_295373 ) ) ( not ( = ?auto_295370 ?auto_295375 ) ) ( not ( = ?auto_295370 ?auto_295376 ) ) ( not ( = ?auto_295371 ?auto_295372 ) ) ( not ( = ?auto_295371 ?auto_295374 ) ) ( not ( = ?auto_295371 ?auto_295373 ) ) ( not ( = ?auto_295371 ?auto_295375 ) ) ( not ( = ?auto_295371 ?auto_295376 ) ) ( not ( = ?auto_295372 ?auto_295374 ) ) ( not ( = ?auto_295372 ?auto_295373 ) ) ( not ( = ?auto_295372 ?auto_295375 ) ) ( not ( = ?auto_295372 ?auto_295376 ) ) ( not ( = ?auto_295374 ?auto_295373 ) ) ( not ( = ?auto_295374 ?auto_295375 ) ) ( not ( = ?auto_295374 ?auto_295376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295373 ?auto_295375 ?auto_295376 )
      ( MAKE-6CRATE-VERIFY ?auto_295370 ?auto_295371 ?auto_295372 ?auto_295374 ?auto_295373 ?auto_295375 ?auto_295376 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295427 - SURFACE
      ?auto_295428 - SURFACE
      ?auto_295429 - SURFACE
      ?auto_295431 - SURFACE
      ?auto_295430 - SURFACE
      ?auto_295432 - SURFACE
      ?auto_295433 - SURFACE
    )
    :vars
    (
      ?auto_295437 - HOIST
      ?auto_295435 - PLACE
      ?auto_295434 - TRUCK
      ?auto_295436 - PLACE
      ?auto_295438 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_295437 ?auto_295435 ) ( SURFACE-AT ?auto_295432 ?auto_295435 ) ( CLEAR ?auto_295432 ) ( IS-CRATE ?auto_295433 ) ( not ( = ?auto_295432 ?auto_295433 ) ) ( AVAILABLE ?auto_295437 ) ( ON ?auto_295432 ?auto_295430 ) ( not ( = ?auto_295430 ?auto_295432 ) ) ( not ( = ?auto_295430 ?auto_295433 ) ) ( TRUCK-AT ?auto_295434 ?auto_295436 ) ( not ( = ?auto_295436 ?auto_295435 ) ) ( HOIST-AT ?auto_295438 ?auto_295436 ) ( LIFTING ?auto_295438 ?auto_295433 ) ( not ( = ?auto_295437 ?auto_295438 ) ) ( ON ?auto_295428 ?auto_295427 ) ( ON ?auto_295429 ?auto_295428 ) ( ON ?auto_295431 ?auto_295429 ) ( ON ?auto_295430 ?auto_295431 ) ( not ( = ?auto_295427 ?auto_295428 ) ) ( not ( = ?auto_295427 ?auto_295429 ) ) ( not ( = ?auto_295427 ?auto_295431 ) ) ( not ( = ?auto_295427 ?auto_295430 ) ) ( not ( = ?auto_295427 ?auto_295432 ) ) ( not ( = ?auto_295427 ?auto_295433 ) ) ( not ( = ?auto_295428 ?auto_295429 ) ) ( not ( = ?auto_295428 ?auto_295431 ) ) ( not ( = ?auto_295428 ?auto_295430 ) ) ( not ( = ?auto_295428 ?auto_295432 ) ) ( not ( = ?auto_295428 ?auto_295433 ) ) ( not ( = ?auto_295429 ?auto_295431 ) ) ( not ( = ?auto_295429 ?auto_295430 ) ) ( not ( = ?auto_295429 ?auto_295432 ) ) ( not ( = ?auto_295429 ?auto_295433 ) ) ( not ( = ?auto_295431 ?auto_295430 ) ) ( not ( = ?auto_295431 ?auto_295432 ) ) ( not ( = ?auto_295431 ?auto_295433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295430 ?auto_295432 ?auto_295433 )
      ( MAKE-6CRATE-VERIFY ?auto_295427 ?auto_295428 ?auto_295429 ?auto_295431 ?auto_295430 ?auto_295432 ?auto_295433 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295490 - SURFACE
      ?auto_295491 - SURFACE
      ?auto_295492 - SURFACE
      ?auto_295494 - SURFACE
      ?auto_295493 - SURFACE
      ?auto_295495 - SURFACE
      ?auto_295496 - SURFACE
    )
    :vars
    (
      ?auto_295500 - HOIST
      ?auto_295502 - PLACE
      ?auto_295498 - TRUCK
      ?auto_295497 - PLACE
      ?auto_295499 - HOIST
      ?auto_295501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_295500 ?auto_295502 ) ( SURFACE-AT ?auto_295495 ?auto_295502 ) ( CLEAR ?auto_295495 ) ( IS-CRATE ?auto_295496 ) ( not ( = ?auto_295495 ?auto_295496 ) ) ( AVAILABLE ?auto_295500 ) ( ON ?auto_295495 ?auto_295493 ) ( not ( = ?auto_295493 ?auto_295495 ) ) ( not ( = ?auto_295493 ?auto_295496 ) ) ( TRUCK-AT ?auto_295498 ?auto_295497 ) ( not ( = ?auto_295497 ?auto_295502 ) ) ( HOIST-AT ?auto_295499 ?auto_295497 ) ( not ( = ?auto_295500 ?auto_295499 ) ) ( AVAILABLE ?auto_295499 ) ( SURFACE-AT ?auto_295496 ?auto_295497 ) ( ON ?auto_295496 ?auto_295501 ) ( CLEAR ?auto_295496 ) ( not ( = ?auto_295495 ?auto_295501 ) ) ( not ( = ?auto_295496 ?auto_295501 ) ) ( not ( = ?auto_295493 ?auto_295501 ) ) ( ON ?auto_295491 ?auto_295490 ) ( ON ?auto_295492 ?auto_295491 ) ( ON ?auto_295494 ?auto_295492 ) ( ON ?auto_295493 ?auto_295494 ) ( not ( = ?auto_295490 ?auto_295491 ) ) ( not ( = ?auto_295490 ?auto_295492 ) ) ( not ( = ?auto_295490 ?auto_295494 ) ) ( not ( = ?auto_295490 ?auto_295493 ) ) ( not ( = ?auto_295490 ?auto_295495 ) ) ( not ( = ?auto_295490 ?auto_295496 ) ) ( not ( = ?auto_295490 ?auto_295501 ) ) ( not ( = ?auto_295491 ?auto_295492 ) ) ( not ( = ?auto_295491 ?auto_295494 ) ) ( not ( = ?auto_295491 ?auto_295493 ) ) ( not ( = ?auto_295491 ?auto_295495 ) ) ( not ( = ?auto_295491 ?auto_295496 ) ) ( not ( = ?auto_295491 ?auto_295501 ) ) ( not ( = ?auto_295492 ?auto_295494 ) ) ( not ( = ?auto_295492 ?auto_295493 ) ) ( not ( = ?auto_295492 ?auto_295495 ) ) ( not ( = ?auto_295492 ?auto_295496 ) ) ( not ( = ?auto_295492 ?auto_295501 ) ) ( not ( = ?auto_295494 ?auto_295493 ) ) ( not ( = ?auto_295494 ?auto_295495 ) ) ( not ( = ?auto_295494 ?auto_295496 ) ) ( not ( = ?auto_295494 ?auto_295501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295493 ?auto_295495 ?auto_295496 )
      ( MAKE-6CRATE-VERIFY ?auto_295490 ?auto_295491 ?auto_295492 ?auto_295494 ?auto_295493 ?auto_295495 ?auto_295496 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295554 - SURFACE
      ?auto_295555 - SURFACE
      ?auto_295556 - SURFACE
      ?auto_295558 - SURFACE
      ?auto_295557 - SURFACE
      ?auto_295559 - SURFACE
      ?auto_295560 - SURFACE
    )
    :vars
    (
      ?auto_295562 - HOIST
      ?auto_295564 - PLACE
      ?auto_295565 - PLACE
      ?auto_295563 - HOIST
      ?auto_295561 - SURFACE
      ?auto_295566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295562 ?auto_295564 ) ( SURFACE-AT ?auto_295559 ?auto_295564 ) ( CLEAR ?auto_295559 ) ( IS-CRATE ?auto_295560 ) ( not ( = ?auto_295559 ?auto_295560 ) ) ( AVAILABLE ?auto_295562 ) ( ON ?auto_295559 ?auto_295557 ) ( not ( = ?auto_295557 ?auto_295559 ) ) ( not ( = ?auto_295557 ?auto_295560 ) ) ( not ( = ?auto_295565 ?auto_295564 ) ) ( HOIST-AT ?auto_295563 ?auto_295565 ) ( not ( = ?auto_295562 ?auto_295563 ) ) ( AVAILABLE ?auto_295563 ) ( SURFACE-AT ?auto_295560 ?auto_295565 ) ( ON ?auto_295560 ?auto_295561 ) ( CLEAR ?auto_295560 ) ( not ( = ?auto_295559 ?auto_295561 ) ) ( not ( = ?auto_295560 ?auto_295561 ) ) ( not ( = ?auto_295557 ?auto_295561 ) ) ( TRUCK-AT ?auto_295566 ?auto_295564 ) ( ON ?auto_295555 ?auto_295554 ) ( ON ?auto_295556 ?auto_295555 ) ( ON ?auto_295558 ?auto_295556 ) ( ON ?auto_295557 ?auto_295558 ) ( not ( = ?auto_295554 ?auto_295555 ) ) ( not ( = ?auto_295554 ?auto_295556 ) ) ( not ( = ?auto_295554 ?auto_295558 ) ) ( not ( = ?auto_295554 ?auto_295557 ) ) ( not ( = ?auto_295554 ?auto_295559 ) ) ( not ( = ?auto_295554 ?auto_295560 ) ) ( not ( = ?auto_295554 ?auto_295561 ) ) ( not ( = ?auto_295555 ?auto_295556 ) ) ( not ( = ?auto_295555 ?auto_295558 ) ) ( not ( = ?auto_295555 ?auto_295557 ) ) ( not ( = ?auto_295555 ?auto_295559 ) ) ( not ( = ?auto_295555 ?auto_295560 ) ) ( not ( = ?auto_295555 ?auto_295561 ) ) ( not ( = ?auto_295556 ?auto_295558 ) ) ( not ( = ?auto_295556 ?auto_295557 ) ) ( not ( = ?auto_295556 ?auto_295559 ) ) ( not ( = ?auto_295556 ?auto_295560 ) ) ( not ( = ?auto_295556 ?auto_295561 ) ) ( not ( = ?auto_295558 ?auto_295557 ) ) ( not ( = ?auto_295558 ?auto_295559 ) ) ( not ( = ?auto_295558 ?auto_295560 ) ) ( not ( = ?auto_295558 ?auto_295561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295557 ?auto_295559 ?auto_295560 )
      ( MAKE-6CRATE-VERIFY ?auto_295554 ?auto_295555 ?auto_295556 ?auto_295558 ?auto_295557 ?auto_295559 ?auto_295560 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295618 - SURFACE
      ?auto_295619 - SURFACE
      ?auto_295620 - SURFACE
      ?auto_295622 - SURFACE
      ?auto_295621 - SURFACE
      ?auto_295623 - SURFACE
      ?auto_295624 - SURFACE
    )
    :vars
    (
      ?auto_295630 - HOIST
      ?auto_295626 - PLACE
      ?auto_295628 - PLACE
      ?auto_295629 - HOIST
      ?auto_295627 - SURFACE
      ?auto_295625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295630 ?auto_295626 ) ( IS-CRATE ?auto_295624 ) ( not ( = ?auto_295623 ?auto_295624 ) ) ( not ( = ?auto_295621 ?auto_295623 ) ) ( not ( = ?auto_295621 ?auto_295624 ) ) ( not ( = ?auto_295628 ?auto_295626 ) ) ( HOIST-AT ?auto_295629 ?auto_295628 ) ( not ( = ?auto_295630 ?auto_295629 ) ) ( AVAILABLE ?auto_295629 ) ( SURFACE-AT ?auto_295624 ?auto_295628 ) ( ON ?auto_295624 ?auto_295627 ) ( CLEAR ?auto_295624 ) ( not ( = ?auto_295623 ?auto_295627 ) ) ( not ( = ?auto_295624 ?auto_295627 ) ) ( not ( = ?auto_295621 ?auto_295627 ) ) ( TRUCK-AT ?auto_295625 ?auto_295626 ) ( SURFACE-AT ?auto_295621 ?auto_295626 ) ( CLEAR ?auto_295621 ) ( LIFTING ?auto_295630 ?auto_295623 ) ( IS-CRATE ?auto_295623 ) ( ON ?auto_295619 ?auto_295618 ) ( ON ?auto_295620 ?auto_295619 ) ( ON ?auto_295622 ?auto_295620 ) ( ON ?auto_295621 ?auto_295622 ) ( not ( = ?auto_295618 ?auto_295619 ) ) ( not ( = ?auto_295618 ?auto_295620 ) ) ( not ( = ?auto_295618 ?auto_295622 ) ) ( not ( = ?auto_295618 ?auto_295621 ) ) ( not ( = ?auto_295618 ?auto_295623 ) ) ( not ( = ?auto_295618 ?auto_295624 ) ) ( not ( = ?auto_295618 ?auto_295627 ) ) ( not ( = ?auto_295619 ?auto_295620 ) ) ( not ( = ?auto_295619 ?auto_295622 ) ) ( not ( = ?auto_295619 ?auto_295621 ) ) ( not ( = ?auto_295619 ?auto_295623 ) ) ( not ( = ?auto_295619 ?auto_295624 ) ) ( not ( = ?auto_295619 ?auto_295627 ) ) ( not ( = ?auto_295620 ?auto_295622 ) ) ( not ( = ?auto_295620 ?auto_295621 ) ) ( not ( = ?auto_295620 ?auto_295623 ) ) ( not ( = ?auto_295620 ?auto_295624 ) ) ( not ( = ?auto_295620 ?auto_295627 ) ) ( not ( = ?auto_295622 ?auto_295621 ) ) ( not ( = ?auto_295622 ?auto_295623 ) ) ( not ( = ?auto_295622 ?auto_295624 ) ) ( not ( = ?auto_295622 ?auto_295627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295621 ?auto_295623 ?auto_295624 )
      ( MAKE-6CRATE-VERIFY ?auto_295618 ?auto_295619 ?auto_295620 ?auto_295622 ?auto_295621 ?auto_295623 ?auto_295624 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_295682 - SURFACE
      ?auto_295683 - SURFACE
      ?auto_295684 - SURFACE
      ?auto_295686 - SURFACE
      ?auto_295685 - SURFACE
      ?auto_295687 - SURFACE
      ?auto_295688 - SURFACE
    )
    :vars
    (
      ?auto_295694 - HOIST
      ?auto_295692 - PLACE
      ?auto_295689 - PLACE
      ?auto_295690 - HOIST
      ?auto_295691 - SURFACE
      ?auto_295693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_295694 ?auto_295692 ) ( IS-CRATE ?auto_295688 ) ( not ( = ?auto_295687 ?auto_295688 ) ) ( not ( = ?auto_295685 ?auto_295687 ) ) ( not ( = ?auto_295685 ?auto_295688 ) ) ( not ( = ?auto_295689 ?auto_295692 ) ) ( HOIST-AT ?auto_295690 ?auto_295689 ) ( not ( = ?auto_295694 ?auto_295690 ) ) ( AVAILABLE ?auto_295690 ) ( SURFACE-AT ?auto_295688 ?auto_295689 ) ( ON ?auto_295688 ?auto_295691 ) ( CLEAR ?auto_295688 ) ( not ( = ?auto_295687 ?auto_295691 ) ) ( not ( = ?auto_295688 ?auto_295691 ) ) ( not ( = ?auto_295685 ?auto_295691 ) ) ( TRUCK-AT ?auto_295693 ?auto_295692 ) ( SURFACE-AT ?auto_295685 ?auto_295692 ) ( CLEAR ?auto_295685 ) ( IS-CRATE ?auto_295687 ) ( AVAILABLE ?auto_295694 ) ( IN ?auto_295687 ?auto_295693 ) ( ON ?auto_295683 ?auto_295682 ) ( ON ?auto_295684 ?auto_295683 ) ( ON ?auto_295686 ?auto_295684 ) ( ON ?auto_295685 ?auto_295686 ) ( not ( = ?auto_295682 ?auto_295683 ) ) ( not ( = ?auto_295682 ?auto_295684 ) ) ( not ( = ?auto_295682 ?auto_295686 ) ) ( not ( = ?auto_295682 ?auto_295685 ) ) ( not ( = ?auto_295682 ?auto_295687 ) ) ( not ( = ?auto_295682 ?auto_295688 ) ) ( not ( = ?auto_295682 ?auto_295691 ) ) ( not ( = ?auto_295683 ?auto_295684 ) ) ( not ( = ?auto_295683 ?auto_295686 ) ) ( not ( = ?auto_295683 ?auto_295685 ) ) ( not ( = ?auto_295683 ?auto_295687 ) ) ( not ( = ?auto_295683 ?auto_295688 ) ) ( not ( = ?auto_295683 ?auto_295691 ) ) ( not ( = ?auto_295684 ?auto_295686 ) ) ( not ( = ?auto_295684 ?auto_295685 ) ) ( not ( = ?auto_295684 ?auto_295687 ) ) ( not ( = ?auto_295684 ?auto_295688 ) ) ( not ( = ?auto_295684 ?auto_295691 ) ) ( not ( = ?auto_295686 ?auto_295685 ) ) ( not ( = ?auto_295686 ?auto_295687 ) ) ( not ( = ?auto_295686 ?auto_295688 ) ) ( not ( = ?auto_295686 ?auto_295691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_295685 ?auto_295687 ?auto_295688 )
      ( MAKE-6CRATE-VERIFY ?auto_295682 ?auto_295683 ?auto_295684 ?auto_295686 ?auto_295685 ?auto_295687 ?auto_295688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_297358 - SURFACE
      ?auto_297359 - SURFACE
    )
    :vars
    (
      ?auto_297360 - HOIST
      ?auto_297365 - PLACE
      ?auto_297361 - SURFACE
      ?auto_297366 - PLACE
      ?auto_297364 - HOIST
      ?auto_297362 - SURFACE
      ?auto_297363 - TRUCK
      ?auto_297367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297360 ?auto_297365 ) ( SURFACE-AT ?auto_297358 ?auto_297365 ) ( CLEAR ?auto_297358 ) ( IS-CRATE ?auto_297359 ) ( not ( = ?auto_297358 ?auto_297359 ) ) ( ON ?auto_297358 ?auto_297361 ) ( not ( = ?auto_297361 ?auto_297358 ) ) ( not ( = ?auto_297361 ?auto_297359 ) ) ( not ( = ?auto_297366 ?auto_297365 ) ) ( HOIST-AT ?auto_297364 ?auto_297366 ) ( not ( = ?auto_297360 ?auto_297364 ) ) ( AVAILABLE ?auto_297364 ) ( SURFACE-AT ?auto_297359 ?auto_297366 ) ( ON ?auto_297359 ?auto_297362 ) ( CLEAR ?auto_297359 ) ( not ( = ?auto_297358 ?auto_297362 ) ) ( not ( = ?auto_297359 ?auto_297362 ) ) ( not ( = ?auto_297361 ?auto_297362 ) ) ( TRUCK-AT ?auto_297363 ?auto_297365 ) ( LIFTING ?auto_297360 ?auto_297367 ) ( IS-CRATE ?auto_297367 ) ( not ( = ?auto_297358 ?auto_297367 ) ) ( not ( = ?auto_297359 ?auto_297367 ) ) ( not ( = ?auto_297361 ?auto_297367 ) ) ( not ( = ?auto_297362 ?auto_297367 ) ) )
    :subtasks
    ( ( !LOAD ?auto_297360 ?auto_297367 ?auto_297363 ?auto_297365 )
      ( MAKE-1CRATE ?auto_297358 ?auto_297359 )
      ( MAKE-1CRATE-VERIFY ?auto_297358 ?auto_297359 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297634 - SURFACE
      ?auto_297635 - SURFACE
      ?auto_297636 - SURFACE
      ?auto_297638 - SURFACE
      ?auto_297637 - SURFACE
      ?auto_297639 - SURFACE
      ?auto_297640 - SURFACE
      ?auto_297641 - SURFACE
    )
    :vars
    (
      ?auto_297642 - HOIST
      ?auto_297643 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297642 ?auto_297643 ) ( SURFACE-AT ?auto_297640 ?auto_297643 ) ( CLEAR ?auto_297640 ) ( LIFTING ?auto_297642 ?auto_297641 ) ( IS-CRATE ?auto_297641 ) ( not ( = ?auto_297640 ?auto_297641 ) ) ( ON ?auto_297635 ?auto_297634 ) ( ON ?auto_297636 ?auto_297635 ) ( ON ?auto_297638 ?auto_297636 ) ( ON ?auto_297637 ?auto_297638 ) ( ON ?auto_297639 ?auto_297637 ) ( ON ?auto_297640 ?auto_297639 ) ( not ( = ?auto_297634 ?auto_297635 ) ) ( not ( = ?auto_297634 ?auto_297636 ) ) ( not ( = ?auto_297634 ?auto_297638 ) ) ( not ( = ?auto_297634 ?auto_297637 ) ) ( not ( = ?auto_297634 ?auto_297639 ) ) ( not ( = ?auto_297634 ?auto_297640 ) ) ( not ( = ?auto_297634 ?auto_297641 ) ) ( not ( = ?auto_297635 ?auto_297636 ) ) ( not ( = ?auto_297635 ?auto_297638 ) ) ( not ( = ?auto_297635 ?auto_297637 ) ) ( not ( = ?auto_297635 ?auto_297639 ) ) ( not ( = ?auto_297635 ?auto_297640 ) ) ( not ( = ?auto_297635 ?auto_297641 ) ) ( not ( = ?auto_297636 ?auto_297638 ) ) ( not ( = ?auto_297636 ?auto_297637 ) ) ( not ( = ?auto_297636 ?auto_297639 ) ) ( not ( = ?auto_297636 ?auto_297640 ) ) ( not ( = ?auto_297636 ?auto_297641 ) ) ( not ( = ?auto_297638 ?auto_297637 ) ) ( not ( = ?auto_297638 ?auto_297639 ) ) ( not ( = ?auto_297638 ?auto_297640 ) ) ( not ( = ?auto_297638 ?auto_297641 ) ) ( not ( = ?auto_297637 ?auto_297639 ) ) ( not ( = ?auto_297637 ?auto_297640 ) ) ( not ( = ?auto_297637 ?auto_297641 ) ) ( not ( = ?auto_297639 ?auto_297640 ) ) ( not ( = ?auto_297639 ?auto_297641 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_297640 ?auto_297641 )
      ( MAKE-7CRATE-VERIFY ?auto_297634 ?auto_297635 ?auto_297636 ?auto_297638 ?auto_297637 ?auto_297639 ?auto_297640 ?auto_297641 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297689 - SURFACE
      ?auto_297690 - SURFACE
      ?auto_297691 - SURFACE
      ?auto_297693 - SURFACE
      ?auto_297692 - SURFACE
      ?auto_297694 - SURFACE
      ?auto_297695 - SURFACE
      ?auto_297696 - SURFACE
    )
    :vars
    (
      ?auto_297699 - HOIST
      ?auto_297697 - PLACE
      ?auto_297698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_297699 ?auto_297697 ) ( SURFACE-AT ?auto_297695 ?auto_297697 ) ( CLEAR ?auto_297695 ) ( IS-CRATE ?auto_297696 ) ( not ( = ?auto_297695 ?auto_297696 ) ) ( TRUCK-AT ?auto_297698 ?auto_297697 ) ( AVAILABLE ?auto_297699 ) ( IN ?auto_297696 ?auto_297698 ) ( ON ?auto_297695 ?auto_297694 ) ( not ( = ?auto_297694 ?auto_297695 ) ) ( not ( = ?auto_297694 ?auto_297696 ) ) ( ON ?auto_297690 ?auto_297689 ) ( ON ?auto_297691 ?auto_297690 ) ( ON ?auto_297693 ?auto_297691 ) ( ON ?auto_297692 ?auto_297693 ) ( ON ?auto_297694 ?auto_297692 ) ( not ( = ?auto_297689 ?auto_297690 ) ) ( not ( = ?auto_297689 ?auto_297691 ) ) ( not ( = ?auto_297689 ?auto_297693 ) ) ( not ( = ?auto_297689 ?auto_297692 ) ) ( not ( = ?auto_297689 ?auto_297694 ) ) ( not ( = ?auto_297689 ?auto_297695 ) ) ( not ( = ?auto_297689 ?auto_297696 ) ) ( not ( = ?auto_297690 ?auto_297691 ) ) ( not ( = ?auto_297690 ?auto_297693 ) ) ( not ( = ?auto_297690 ?auto_297692 ) ) ( not ( = ?auto_297690 ?auto_297694 ) ) ( not ( = ?auto_297690 ?auto_297695 ) ) ( not ( = ?auto_297690 ?auto_297696 ) ) ( not ( = ?auto_297691 ?auto_297693 ) ) ( not ( = ?auto_297691 ?auto_297692 ) ) ( not ( = ?auto_297691 ?auto_297694 ) ) ( not ( = ?auto_297691 ?auto_297695 ) ) ( not ( = ?auto_297691 ?auto_297696 ) ) ( not ( = ?auto_297693 ?auto_297692 ) ) ( not ( = ?auto_297693 ?auto_297694 ) ) ( not ( = ?auto_297693 ?auto_297695 ) ) ( not ( = ?auto_297693 ?auto_297696 ) ) ( not ( = ?auto_297692 ?auto_297694 ) ) ( not ( = ?auto_297692 ?auto_297695 ) ) ( not ( = ?auto_297692 ?auto_297696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297694 ?auto_297695 ?auto_297696 )
      ( MAKE-7CRATE-VERIFY ?auto_297689 ?auto_297690 ?auto_297691 ?auto_297693 ?auto_297692 ?auto_297694 ?auto_297695 ?auto_297696 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297752 - SURFACE
      ?auto_297753 - SURFACE
      ?auto_297754 - SURFACE
      ?auto_297756 - SURFACE
      ?auto_297755 - SURFACE
      ?auto_297757 - SURFACE
      ?auto_297758 - SURFACE
      ?auto_297759 - SURFACE
    )
    :vars
    (
      ?auto_297761 - HOIST
      ?auto_297760 - PLACE
      ?auto_297762 - TRUCK
      ?auto_297763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297761 ?auto_297760 ) ( SURFACE-AT ?auto_297758 ?auto_297760 ) ( CLEAR ?auto_297758 ) ( IS-CRATE ?auto_297759 ) ( not ( = ?auto_297758 ?auto_297759 ) ) ( AVAILABLE ?auto_297761 ) ( IN ?auto_297759 ?auto_297762 ) ( ON ?auto_297758 ?auto_297757 ) ( not ( = ?auto_297757 ?auto_297758 ) ) ( not ( = ?auto_297757 ?auto_297759 ) ) ( TRUCK-AT ?auto_297762 ?auto_297763 ) ( not ( = ?auto_297763 ?auto_297760 ) ) ( ON ?auto_297753 ?auto_297752 ) ( ON ?auto_297754 ?auto_297753 ) ( ON ?auto_297756 ?auto_297754 ) ( ON ?auto_297755 ?auto_297756 ) ( ON ?auto_297757 ?auto_297755 ) ( not ( = ?auto_297752 ?auto_297753 ) ) ( not ( = ?auto_297752 ?auto_297754 ) ) ( not ( = ?auto_297752 ?auto_297756 ) ) ( not ( = ?auto_297752 ?auto_297755 ) ) ( not ( = ?auto_297752 ?auto_297757 ) ) ( not ( = ?auto_297752 ?auto_297758 ) ) ( not ( = ?auto_297752 ?auto_297759 ) ) ( not ( = ?auto_297753 ?auto_297754 ) ) ( not ( = ?auto_297753 ?auto_297756 ) ) ( not ( = ?auto_297753 ?auto_297755 ) ) ( not ( = ?auto_297753 ?auto_297757 ) ) ( not ( = ?auto_297753 ?auto_297758 ) ) ( not ( = ?auto_297753 ?auto_297759 ) ) ( not ( = ?auto_297754 ?auto_297756 ) ) ( not ( = ?auto_297754 ?auto_297755 ) ) ( not ( = ?auto_297754 ?auto_297757 ) ) ( not ( = ?auto_297754 ?auto_297758 ) ) ( not ( = ?auto_297754 ?auto_297759 ) ) ( not ( = ?auto_297756 ?auto_297755 ) ) ( not ( = ?auto_297756 ?auto_297757 ) ) ( not ( = ?auto_297756 ?auto_297758 ) ) ( not ( = ?auto_297756 ?auto_297759 ) ) ( not ( = ?auto_297755 ?auto_297757 ) ) ( not ( = ?auto_297755 ?auto_297758 ) ) ( not ( = ?auto_297755 ?auto_297759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297757 ?auto_297758 ?auto_297759 )
      ( MAKE-7CRATE-VERIFY ?auto_297752 ?auto_297753 ?auto_297754 ?auto_297756 ?auto_297755 ?auto_297757 ?auto_297758 ?auto_297759 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297822 - SURFACE
      ?auto_297823 - SURFACE
      ?auto_297824 - SURFACE
      ?auto_297826 - SURFACE
      ?auto_297825 - SURFACE
      ?auto_297827 - SURFACE
      ?auto_297828 - SURFACE
      ?auto_297829 - SURFACE
    )
    :vars
    (
      ?auto_297831 - HOIST
      ?auto_297834 - PLACE
      ?auto_297833 - TRUCK
      ?auto_297830 - PLACE
      ?auto_297832 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_297831 ?auto_297834 ) ( SURFACE-AT ?auto_297828 ?auto_297834 ) ( CLEAR ?auto_297828 ) ( IS-CRATE ?auto_297829 ) ( not ( = ?auto_297828 ?auto_297829 ) ) ( AVAILABLE ?auto_297831 ) ( ON ?auto_297828 ?auto_297827 ) ( not ( = ?auto_297827 ?auto_297828 ) ) ( not ( = ?auto_297827 ?auto_297829 ) ) ( TRUCK-AT ?auto_297833 ?auto_297830 ) ( not ( = ?auto_297830 ?auto_297834 ) ) ( HOIST-AT ?auto_297832 ?auto_297830 ) ( LIFTING ?auto_297832 ?auto_297829 ) ( not ( = ?auto_297831 ?auto_297832 ) ) ( ON ?auto_297823 ?auto_297822 ) ( ON ?auto_297824 ?auto_297823 ) ( ON ?auto_297826 ?auto_297824 ) ( ON ?auto_297825 ?auto_297826 ) ( ON ?auto_297827 ?auto_297825 ) ( not ( = ?auto_297822 ?auto_297823 ) ) ( not ( = ?auto_297822 ?auto_297824 ) ) ( not ( = ?auto_297822 ?auto_297826 ) ) ( not ( = ?auto_297822 ?auto_297825 ) ) ( not ( = ?auto_297822 ?auto_297827 ) ) ( not ( = ?auto_297822 ?auto_297828 ) ) ( not ( = ?auto_297822 ?auto_297829 ) ) ( not ( = ?auto_297823 ?auto_297824 ) ) ( not ( = ?auto_297823 ?auto_297826 ) ) ( not ( = ?auto_297823 ?auto_297825 ) ) ( not ( = ?auto_297823 ?auto_297827 ) ) ( not ( = ?auto_297823 ?auto_297828 ) ) ( not ( = ?auto_297823 ?auto_297829 ) ) ( not ( = ?auto_297824 ?auto_297826 ) ) ( not ( = ?auto_297824 ?auto_297825 ) ) ( not ( = ?auto_297824 ?auto_297827 ) ) ( not ( = ?auto_297824 ?auto_297828 ) ) ( not ( = ?auto_297824 ?auto_297829 ) ) ( not ( = ?auto_297826 ?auto_297825 ) ) ( not ( = ?auto_297826 ?auto_297827 ) ) ( not ( = ?auto_297826 ?auto_297828 ) ) ( not ( = ?auto_297826 ?auto_297829 ) ) ( not ( = ?auto_297825 ?auto_297827 ) ) ( not ( = ?auto_297825 ?auto_297828 ) ) ( not ( = ?auto_297825 ?auto_297829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297827 ?auto_297828 ?auto_297829 )
      ( MAKE-7CRATE-VERIFY ?auto_297822 ?auto_297823 ?auto_297824 ?auto_297826 ?auto_297825 ?auto_297827 ?auto_297828 ?auto_297829 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297899 - SURFACE
      ?auto_297900 - SURFACE
      ?auto_297901 - SURFACE
      ?auto_297903 - SURFACE
      ?auto_297902 - SURFACE
      ?auto_297904 - SURFACE
      ?auto_297905 - SURFACE
      ?auto_297906 - SURFACE
    )
    :vars
    (
      ?auto_297912 - HOIST
      ?auto_297910 - PLACE
      ?auto_297911 - TRUCK
      ?auto_297908 - PLACE
      ?auto_297909 - HOIST
      ?auto_297907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_297912 ?auto_297910 ) ( SURFACE-AT ?auto_297905 ?auto_297910 ) ( CLEAR ?auto_297905 ) ( IS-CRATE ?auto_297906 ) ( not ( = ?auto_297905 ?auto_297906 ) ) ( AVAILABLE ?auto_297912 ) ( ON ?auto_297905 ?auto_297904 ) ( not ( = ?auto_297904 ?auto_297905 ) ) ( not ( = ?auto_297904 ?auto_297906 ) ) ( TRUCK-AT ?auto_297911 ?auto_297908 ) ( not ( = ?auto_297908 ?auto_297910 ) ) ( HOIST-AT ?auto_297909 ?auto_297908 ) ( not ( = ?auto_297912 ?auto_297909 ) ) ( AVAILABLE ?auto_297909 ) ( SURFACE-AT ?auto_297906 ?auto_297908 ) ( ON ?auto_297906 ?auto_297907 ) ( CLEAR ?auto_297906 ) ( not ( = ?auto_297905 ?auto_297907 ) ) ( not ( = ?auto_297906 ?auto_297907 ) ) ( not ( = ?auto_297904 ?auto_297907 ) ) ( ON ?auto_297900 ?auto_297899 ) ( ON ?auto_297901 ?auto_297900 ) ( ON ?auto_297903 ?auto_297901 ) ( ON ?auto_297902 ?auto_297903 ) ( ON ?auto_297904 ?auto_297902 ) ( not ( = ?auto_297899 ?auto_297900 ) ) ( not ( = ?auto_297899 ?auto_297901 ) ) ( not ( = ?auto_297899 ?auto_297903 ) ) ( not ( = ?auto_297899 ?auto_297902 ) ) ( not ( = ?auto_297899 ?auto_297904 ) ) ( not ( = ?auto_297899 ?auto_297905 ) ) ( not ( = ?auto_297899 ?auto_297906 ) ) ( not ( = ?auto_297899 ?auto_297907 ) ) ( not ( = ?auto_297900 ?auto_297901 ) ) ( not ( = ?auto_297900 ?auto_297903 ) ) ( not ( = ?auto_297900 ?auto_297902 ) ) ( not ( = ?auto_297900 ?auto_297904 ) ) ( not ( = ?auto_297900 ?auto_297905 ) ) ( not ( = ?auto_297900 ?auto_297906 ) ) ( not ( = ?auto_297900 ?auto_297907 ) ) ( not ( = ?auto_297901 ?auto_297903 ) ) ( not ( = ?auto_297901 ?auto_297902 ) ) ( not ( = ?auto_297901 ?auto_297904 ) ) ( not ( = ?auto_297901 ?auto_297905 ) ) ( not ( = ?auto_297901 ?auto_297906 ) ) ( not ( = ?auto_297901 ?auto_297907 ) ) ( not ( = ?auto_297903 ?auto_297902 ) ) ( not ( = ?auto_297903 ?auto_297904 ) ) ( not ( = ?auto_297903 ?auto_297905 ) ) ( not ( = ?auto_297903 ?auto_297906 ) ) ( not ( = ?auto_297903 ?auto_297907 ) ) ( not ( = ?auto_297902 ?auto_297904 ) ) ( not ( = ?auto_297902 ?auto_297905 ) ) ( not ( = ?auto_297902 ?auto_297906 ) ) ( not ( = ?auto_297902 ?auto_297907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297904 ?auto_297905 ?auto_297906 )
      ( MAKE-7CRATE-VERIFY ?auto_297899 ?auto_297900 ?auto_297901 ?auto_297903 ?auto_297902 ?auto_297904 ?auto_297905 ?auto_297906 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_297977 - SURFACE
      ?auto_297978 - SURFACE
      ?auto_297979 - SURFACE
      ?auto_297981 - SURFACE
      ?auto_297980 - SURFACE
      ?auto_297982 - SURFACE
      ?auto_297983 - SURFACE
      ?auto_297984 - SURFACE
    )
    :vars
    (
      ?auto_297989 - HOIST
      ?auto_297988 - PLACE
      ?auto_297987 - PLACE
      ?auto_297990 - HOIST
      ?auto_297985 - SURFACE
      ?auto_297986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_297989 ?auto_297988 ) ( SURFACE-AT ?auto_297983 ?auto_297988 ) ( CLEAR ?auto_297983 ) ( IS-CRATE ?auto_297984 ) ( not ( = ?auto_297983 ?auto_297984 ) ) ( AVAILABLE ?auto_297989 ) ( ON ?auto_297983 ?auto_297982 ) ( not ( = ?auto_297982 ?auto_297983 ) ) ( not ( = ?auto_297982 ?auto_297984 ) ) ( not ( = ?auto_297987 ?auto_297988 ) ) ( HOIST-AT ?auto_297990 ?auto_297987 ) ( not ( = ?auto_297989 ?auto_297990 ) ) ( AVAILABLE ?auto_297990 ) ( SURFACE-AT ?auto_297984 ?auto_297987 ) ( ON ?auto_297984 ?auto_297985 ) ( CLEAR ?auto_297984 ) ( not ( = ?auto_297983 ?auto_297985 ) ) ( not ( = ?auto_297984 ?auto_297985 ) ) ( not ( = ?auto_297982 ?auto_297985 ) ) ( TRUCK-AT ?auto_297986 ?auto_297988 ) ( ON ?auto_297978 ?auto_297977 ) ( ON ?auto_297979 ?auto_297978 ) ( ON ?auto_297981 ?auto_297979 ) ( ON ?auto_297980 ?auto_297981 ) ( ON ?auto_297982 ?auto_297980 ) ( not ( = ?auto_297977 ?auto_297978 ) ) ( not ( = ?auto_297977 ?auto_297979 ) ) ( not ( = ?auto_297977 ?auto_297981 ) ) ( not ( = ?auto_297977 ?auto_297980 ) ) ( not ( = ?auto_297977 ?auto_297982 ) ) ( not ( = ?auto_297977 ?auto_297983 ) ) ( not ( = ?auto_297977 ?auto_297984 ) ) ( not ( = ?auto_297977 ?auto_297985 ) ) ( not ( = ?auto_297978 ?auto_297979 ) ) ( not ( = ?auto_297978 ?auto_297981 ) ) ( not ( = ?auto_297978 ?auto_297980 ) ) ( not ( = ?auto_297978 ?auto_297982 ) ) ( not ( = ?auto_297978 ?auto_297983 ) ) ( not ( = ?auto_297978 ?auto_297984 ) ) ( not ( = ?auto_297978 ?auto_297985 ) ) ( not ( = ?auto_297979 ?auto_297981 ) ) ( not ( = ?auto_297979 ?auto_297980 ) ) ( not ( = ?auto_297979 ?auto_297982 ) ) ( not ( = ?auto_297979 ?auto_297983 ) ) ( not ( = ?auto_297979 ?auto_297984 ) ) ( not ( = ?auto_297979 ?auto_297985 ) ) ( not ( = ?auto_297981 ?auto_297980 ) ) ( not ( = ?auto_297981 ?auto_297982 ) ) ( not ( = ?auto_297981 ?auto_297983 ) ) ( not ( = ?auto_297981 ?auto_297984 ) ) ( not ( = ?auto_297981 ?auto_297985 ) ) ( not ( = ?auto_297980 ?auto_297982 ) ) ( not ( = ?auto_297980 ?auto_297983 ) ) ( not ( = ?auto_297980 ?auto_297984 ) ) ( not ( = ?auto_297980 ?auto_297985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_297982 ?auto_297983 ?auto_297984 )
      ( MAKE-7CRATE-VERIFY ?auto_297977 ?auto_297978 ?auto_297979 ?auto_297981 ?auto_297980 ?auto_297982 ?auto_297983 ?auto_297984 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298055 - SURFACE
      ?auto_298056 - SURFACE
      ?auto_298057 - SURFACE
      ?auto_298059 - SURFACE
      ?auto_298058 - SURFACE
      ?auto_298060 - SURFACE
      ?auto_298061 - SURFACE
      ?auto_298062 - SURFACE
    )
    :vars
    (
      ?auto_298067 - HOIST
      ?auto_298063 - PLACE
      ?auto_298064 - PLACE
      ?auto_298068 - HOIST
      ?auto_298066 - SURFACE
      ?auto_298065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298067 ?auto_298063 ) ( IS-CRATE ?auto_298062 ) ( not ( = ?auto_298061 ?auto_298062 ) ) ( not ( = ?auto_298060 ?auto_298061 ) ) ( not ( = ?auto_298060 ?auto_298062 ) ) ( not ( = ?auto_298064 ?auto_298063 ) ) ( HOIST-AT ?auto_298068 ?auto_298064 ) ( not ( = ?auto_298067 ?auto_298068 ) ) ( AVAILABLE ?auto_298068 ) ( SURFACE-AT ?auto_298062 ?auto_298064 ) ( ON ?auto_298062 ?auto_298066 ) ( CLEAR ?auto_298062 ) ( not ( = ?auto_298061 ?auto_298066 ) ) ( not ( = ?auto_298062 ?auto_298066 ) ) ( not ( = ?auto_298060 ?auto_298066 ) ) ( TRUCK-AT ?auto_298065 ?auto_298063 ) ( SURFACE-AT ?auto_298060 ?auto_298063 ) ( CLEAR ?auto_298060 ) ( LIFTING ?auto_298067 ?auto_298061 ) ( IS-CRATE ?auto_298061 ) ( ON ?auto_298056 ?auto_298055 ) ( ON ?auto_298057 ?auto_298056 ) ( ON ?auto_298059 ?auto_298057 ) ( ON ?auto_298058 ?auto_298059 ) ( ON ?auto_298060 ?auto_298058 ) ( not ( = ?auto_298055 ?auto_298056 ) ) ( not ( = ?auto_298055 ?auto_298057 ) ) ( not ( = ?auto_298055 ?auto_298059 ) ) ( not ( = ?auto_298055 ?auto_298058 ) ) ( not ( = ?auto_298055 ?auto_298060 ) ) ( not ( = ?auto_298055 ?auto_298061 ) ) ( not ( = ?auto_298055 ?auto_298062 ) ) ( not ( = ?auto_298055 ?auto_298066 ) ) ( not ( = ?auto_298056 ?auto_298057 ) ) ( not ( = ?auto_298056 ?auto_298059 ) ) ( not ( = ?auto_298056 ?auto_298058 ) ) ( not ( = ?auto_298056 ?auto_298060 ) ) ( not ( = ?auto_298056 ?auto_298061 ) ) ( not ( = ?auto_298056 ?auto_298062 ) ) ( not ( = ?auto_298056 ?auto_298066 ) ) ( not ( = ?auto_298057 ?auto_298059 ) ) ( not ( = ?auto_298057 ?auto_298058 ) ) ( not ( = ?auto_298057 ?auto_298060 ) ) ( not ( = ?auto_298057 ?auto_298061 ) ) ( not ( = ?auto_298057 ?auto_298062 ) ) ( not ( = ?auto_298057 ?auto_298066 ) ) ( not ( = ?auto_298059 ?auto_298058 ) ) ( not ( = ?auto_298059 ?auto_298060 ) ) ( not ( = ?auto_298059 ?auto_298061 ) ) ( not ( = ?auto_298059 ?auto_298062 ) ) ( not ( = ?auto_298059 ?auto_298066 ) ) ( not ( = ?auto_298058 ?auto_298060 ) ) ( not ( = ?auto_298058 ?auto_298061 ) ) ( not ( = ?auto_298058 ?auto_298062 ) ) ( not ( = ?auto_298058 ?auto_298066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298060 ?auto_298061 ?auto_298062 )
      ( MAKE-7CRATE-VERIFY ?auto_298055 ?auto_298056 ?auto_298057 ?auto_298059 ?auto_298058 ?auto_298060 ?auto_298061 ?auto_298062 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_298133 - SURFACE
      ?auto_298134 - SURFACE
      ?auto_298135 - SURFACE
      ?auto_298137 - SURFACE
      ?auto_298136 - SURFACE
      ?auto_298138 - SURFACE
      ?auto_298139 - SURFACE
      ?auto_298140 - SURFACE
    )
    :vars
    (
      ?auto_298141 - HOIST
      ?auto_298146 - PLACE
      ?auto_298144 - PLACE
      ?auto_298142 - HOIST
      ?auto_298145 - SURFACE
      ?auto_298143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_298141 ?auto_298146 ) ( IS-CRATE ?auto_298140 ) ( not ( = ?auto_298139 ?auto_298140 ) ) ( not ( = ?auto_298138 ?auto_298139 ) ) ( not ( = ?auto_298138 ?auto_298140 ) ) ( not ( = ?auto_298144 ?auto_298146 ) ) ( HOIST-AT ?auto_298142 ?auto_298144 ) ( not ( = ?auto_298141 ?auto_298142 ) ) ( AVAILABLE ?auto_298142 ) ( SURFACE-AT ?auto_298140 ?auto_298144 ) ( ON ?auto_298140 ?auto_298145 ) ( CLEAR ?auto_298140 ) ( not ( = ?auto_298139 ?auto_298145 ) ) ( not ( = ?auto_298140 ?auto_298145 ) ) ( not ( = ?auto_298138 ?auto_298145 ) ) ( TRUCK-AT ?auto_298143 ?auto_298146 ) ( SURFACE-AT ?auto_298138 ?auto_298146 ) ( CLEAR ?auto_298138 ) ( IS-CRATE ?auto_298139 ) ( AVAILABLE ?auto_298141 ) ( IN ?auto_298139 ?auto_298143 ) ( ON ?auto_298134 ?auto_298133 ) ( ON ?auto_298135 ?auto_298134 ) ( ON ?auto_298137 ?auto_298135 ) ( ON ?auto_298136 ?auto_298137 ) ( ON ?auto_298138 ?auto_298136 ) ( not ( = ?auto_298133 ?auto_298134 ) ) ( not ( = ?auto_298133 ?auto_298135 ) ) ( not ( = ?auto_298133 ?auto_298137 ) ) ( not ( = ?auto_298133 ?auto_298136 ) ) ( not ( = ?auto_298133 ?auto_298138 ) ) ( not ( = ?auto_298133 ?auto_298139 ) ) ( not ( = ?auto_298133 ?auto_298140 ) ) ( not ( = ?auto_298133 ?auto_298145 ) ) ( not ( = ?auto_298134 ?auto_298135 ) ) ( not ( = ?auto_298134 ?auto_298137 ) ) ( not ( = ?auto_298134 ?auto_298136 ) ) ( not ( = ?auto_298134 ?auto_298138 ) ) ( not ( = ?auto_298134 ?auto_298139 ) ) ( not ( = ?auto_298134 ?auto_298140 ) ) ( not ( = ?auto_298134 ?auto_298145 ) ) ( not ( = ?auto_298135 ?auto_298137 ) ) ( not ( = ?auto_298135 ?auto_298136 ) ) ( not ( = ?auto_298135 ?auto_298138 ) ) ( not ( = ?auto_298135 ?auto_298139 ) ) ( not ( = ?auto_298135 ?auto_298140 ) ) ( not ( = ?auto_298135 ?auto_298145 ) ) ( not ( = ?auto_298137 ?auto_298136 ) ) ( not ( = ?auto_298137 ?auto_298138 ) ) ( not ( = ?auto_298137 ?auto_298139 ) ) ( not ( = ?auto_298137 ?auto_298140 ) ) ( not ( = ?auto_298137 ?auto_298145 ) ) ( not ( = ?auto_298136 ?auto_298138 ) ) ( not ( = ?auto_298136 ?auto_298139 ) ) ( not ( = ?auto_298136 ?auto_298140 ) ) ( not ( = ?auto_298136 ?auto_298145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_298138 ?auto_298139 ?auto_298140 )
      ( MAKE-7CRATE-VERIFY ?auto_298133 ?auto_298134 ?auto_298135 ?auto_298137 ?auto_298136 ?auto_298138 ?auto_298139 ?auto_298140 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301044 - SURFACE
      ?auto_301045 - SURFACE
      ?auto_301046 - SURFACE
      ?auto_301048 - SURFACE
      ?auto_301047 - SURFACE
      ?auto_301049 - SURFACE
      ?auto_301050 - SURFACE
      ?auto_301051 - SURFACE
      ?auto_301052 - SURFACE
    )
    :vars
    (
      ?auto_301053 - HOIST
      ?auto_301054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301053 ?auto_301054 ) ( SURFACE-AT ?auto_301051 ?auto_301054 ) ( CLEAR ?auto_301051 ) ( LIFTING ?auto_301053 ?auto_301052 ) ( IS-CRATE ?auto_301052 ) ( not ( = ?auto_301051 ?auto_301052 ) ) ( ON ?auto_301045 ?auto_301044 ) ( ON ?auto_301046 ?auto_301045 ) ( ON ?auto_301048 ?auto_301046 ) ( ON ?auto_301047 ?auto_301048 ) ( ON ?auto_301049 ?auto_301047 ) ( ON ?auto_301050 ?auto_301049 ) ( ON ?auto_301051 ?auto_301050 ) ( not ( = ?auto_301044 ?auto_301045 ) ) ( not ( = ?auto_301044 ?auto_301046 ) ) ( not ( = ?auto_301044 ?auto_301048 ) ) ( not ( = ?auto_301044 ?auto_301047 ) ) ( not ( = ?auto_301044 ?auto_301049 ) ) ( not ( = ?auto_301044 ?auto_301050 ) ) ( not ( = ?auto_301044 ?auto_301051 ) ) ( not ( = ?auto_301044 ?auto_301052 ) ) ( not ( = ?auto_301045 ?auto_301046 ) ) ( not ( = ?auto_301045 ?auto_301048 ) ) ( not ( = ?auto_301045 ?auto_301047 ) ) ( not ( = ?auto_301045 ?auto_301049 ) ) ( not ( = ?auto_301045 ?auto_301050 ) ) ( not ( = ?auto_301045 ?auto_301051 ) ) ( not ( = ?auto_301045 ?auto_301052 ) ) ( not ( = ?auto_301046 ?auto_301048 ) ) ( not ( = ?auto_301046 ?auto_301047 ) ) ( not ( = ?auto_301046 ?auto_301049 ) ) ( not ( = ?auto_301046 ?auto_301050 ) ) ( not ( = ?auto_301046 ?auto_301051 ) ) ( not ( = ?auto_301046 ?auto_301052 ) ) ( not ( = ?auto_301048 ?auto_301047 ) ) ( not ( = ?auto_301048 ?auto_301049 ) ) ( not ( = ?auto_301048 ?auto_301050 ) ) ( not ( = ?auto_301048 ?auto_301051 ) ) ( not ( = ?auto_301048 ?auto_301052 ) ) ( not ( = ?auto_301047 ?auto_301049 ) ) ( not ( = ?auto_301047 ?auto_301050 ) ) ( not ( = ?auto_301047 ?auto_301051 ) ) ( not ( = ?auto_301047 ?auto_301052 ) ) ( not ( = ?auto_301049 ?auto_301050 ) ) ( not ( = ?auto_301049 ?auto_301051 ) ) ( not ( = ?auto_301049 ?auto_301052 ) ) ( not ( = ?auto_301050 ?auto_301051 ) ) ( not ( = ?auto_301050 ?auto_301052 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_301051 ?auto_301052 )
      ( MAKE-8CRATE-VERIFY ?auto_301044 ?auto_301045 ?auto_301046 ?auto_301048 ?auto_301047 ?auto_301049 ?auto_301050 ?auto_301051 ?auto_301052 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301111 - SURFACE
      ?auto_301112 - SURFACE
      ?auto_301113 - SURFACE
      ?auto_301115 - SURFACE
      ?auto_301114 - SURFACE
      ?auto_301116 - SURFACE
      ?auto_301117 - SURFACE
      ?auto_301118 - SURFACE
      ?auto_301119 - SURFACE
    )
    :vars
    (
      ?auto_301121 - HOIST
      ?auto_301120 - PLACE
      ?auto_301122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301121 ?auto_301120 ) ( SURFACE-AT ?auto_301118 ?auto_301120 ) ( CLEAR ?auto_301118 ) ( IS-CRATE ?auto_301119 ) ( not ( = ?auto_301118 ?auto_301119 ) ) ( TRUCK-AT ?auto_301122 ?auto_301120 ) ( AVAILABLE ?auto_301121 ) ( IN ?auto_301119 ?auto_301122 ) ( ON ?auto_301118 ?auto_301117 ) ( not ( = ?auto_301117 ?auto_301118 ) ) ( not ( = ?auto_301117 ?auto_301119 ) ) ( ON ?auto_301112 ?auto_301111 ) ( ON ?auto_301113 ?auto_301112 ) ( ON ?auto_301115 ?auto_301113 ) ( ON ?auto_301114 ?auto_301115 ) ( ON ?auto_301116 ?auto_301114 ) ( ON ?auto_301117 ?auto_301116 ) ( not ( = ?auto_301111 ?auto_301112 ) ) ( not ( = ?auto_301111 ?auto_301113 ) ) ( not ( = ?auto_301111 ?auto_301115 ) ) ( not ( = ?auto_301111 ?auto_301114 ) ) ( not ( = ?auto_301111 ?auto_301116 ) ) ( not ( = ?auto_301111 ?auto_301117 ) ) ( not ( = ?auto_301111 ?auto_301118 ) ) ( not ( = ?auto_301111 ?auto_301119 ) ) ( not ( = ?auto_301112 ?auto_301113 ) ) ( not ( = ?auto_301112 ?auto_301115 ) ) ( not ( = ?auto_301112 ?auto_301114 ) ) ( not ( = ?auto_301112 ?auto_301116 ) ) ( not ( = ?auto_301112 ?auto_301117 ) ) ( not ( = ?auto_301112 ?auto_301118 ) ) ( not ( = ?auto_301112 ?auto_301119 ) ) ( not ( = ?auto_301113 ?auto_301115 ) ) ( not ( = ?auto_301113 ?auto_301114 ) ) ( not ( = ?auto_301113 ?auto_301116 ) ) ( not ( = ?auto_301113 ?auto_301117 ) ) ( not ( = ?auto_301113 ?auto_301118 ) ) ( not ( = ?auto_301113 ?auto_301119 ) ) ( not ( = ?auto_301115 ?auto_301114 ) ) ( not ( = ?auto_301115 ?auto_301116 ) ) ( not ( = ?auto_301115 ?auto_301117 ) ) ( not ( = ?auto_301115 ?auto_301118 ) ) ( not ( = ?auto_301115 ?auto_301119 ) ) ( not ( = ?auto_301114 ?auto_301116 ) ) ( not ( = ?auto_301114 ?auto_301117 ) ) ( not ( = ?auto_301114 ?auto_301118 ) ) ( not ( = ?auto_301114 ?auto_301119 ) ) ( not ( = ?auto_301116 ?auto_301117 ) ) ( not ( = ?auto_301116 ?auto_301118 ) ) ( not ( = ?auto_301116 ?auto_301119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301117 ?auto_301118 ?auto_301119 )
      ( MAKE-8CRATE-VERIFY ?auto_301111 ?auto_301112 ?auto_301113 ?auto_301115 ?auto_301114 ?auto_301116 ?auto_301117 ?auto_301118 ?auto_301119 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301187 - SURFACE
      ?auto_301188 - SURFACE
      ?auto_301189 - SURFACE
      ?auto_301191 - SURFACE
      ?auto_301190 - SURFACE
      ?auto_301192 - SURFACE
      ?auto_301193 - SURFACE
      ?auto_301194 - SURFACE
      ?auto_301195 - SURFACE
    )
    :vars
    (
      ?auto_301199 - HOIST
      ?auto_301197 - PLACE
      ?auto_301198 - TRUCK
      ?auto_301196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301199 ?auto_301197 ) ( SURFACE-AT ?auto_301194 ?auto_301197 ) ( CLEAR ?auto_301194 ) ( IS-CRATE ?auto_301195 ) ( not ( = ?auto_301194 ?auto_301195 ) ) ( AVAILABLE ?auto_301199 ) ( IN ?auto_301195 ?auto_301198 ) ( ON ?auto_301194 ?auto_301193 ) ( not ( = ?auto_301193 ?auto_301194 ) ) ( not ( = ?auto_301193 ?auto_301195 ) ) ( TRUCK-AT ?auto_301198 ?auto_301196 ) ( not ( = ?auto_301196 ?auto_301197 ) ) ( ON ?auto_301188 ?auto_301187 ) ( ON ?auto_301189 ?auto_301188 ) ( ON ?auto_301191 ?auto_301189 ) ( ON ?auto_301190 ?auto_301191 ) ( ON ?auto_301192 ?auto_301190 ) ( ON ?auto_301193 ?auto_301192 ) ( not ( = ?auto_301187 ?auto_301188 ) ) ( not ( = ?auto_301187 ?auto_301189 ) ) ( not ( = ?auto_301187 ?auto_301191 ) ) ( not ( = ?auto_301187 ?auto_301190 ) ) ( not ( = ?auto_301187 ?auto_301192 ) ) ( not ( = ?auto_301187 ?auto_301193 ) ) ( not ( = ?auto_301187 ?auto_301194 ) ) ( not ( = ?auto_301187 ?auto_301195 ) ) ( not ( = ?auto_301188 ?auto_301189 ) ) ( not ( = ?auto_301188 ?auto_301191 ) ) ( not ( = ?auto_301188 ?auto_301190 ) ) ( not ( = ?auto_301188 ?auto_301192 ) ) ( not ( = ?auto_301188 ?auto_301193 ) ) ( not ( = ?auto_301188 ?auto_301194 ) ) ( not ( = ?auto_301188 ?auto_301195 ) ) ( not ( = ?auto_301189 ?auto_301191 ) ) ( not ( = ?auto_301189 ?auto_301190 ) ) ( not ( = ?auto_301189 ?auto_301192 ) ) ( not ( = ?auto_301189 ?auto_301193 ) ) ( not ( = ?auto_301189 ?auto_301194 ) ) ( not ( = ?auto_301189 ?auto_301195 ) ) ( not ( = ?auto_301191 ?auto_301190 ) ) ( not ( = ?auto_301191 ?auto_301192 ) ) ( not ( = ?auto_301191 ?auto_301193 ) ) ( not ( = ?auto_301191 ?auto_301194 ) ) ( not ( = ?auto_301191 ?auto_301195 ) ) ( not ( = ?auto_301190 ?auto_301192 ) ) ( not ( = ?auto_301190 ?auto_301193 ) ) ( not ( = ?auto_301190 ?auto_301194 ) ) ( not ( = ?auto_301190 ?auto_301195 ) ) ( not ( = ?auto_301192 ?auto_301193 ) ) ( not ( = ?auto_301192 ?auto_301194 ) ) ( not ( = ?auto_301192 ?auto_301195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301193 ?auto_301194 ?auto_301195 )
      ( MAKE-8CRATE-VERIFY ?auto_301187 ?auto_301188 ?auto_301189 ?auto_301191 ?auto_301190 ?auto_301192 ?auto_301193 ?auto_301194 ?auto_301195 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301271 - SURFACE
      ?auto_301272 - SURFACE
      ?auto_301273 - SURFACE
      ?auto_301275 - SURFACE
      ?auto_301274 - SURFACE
      ?auto_301276 - SURFACE
      ?auto_301277 - SURFACE
      ?auto_301278 - SURFACE
      ?auto_301279 - SURFACE
    )
    :vars
    (
      ?auto_301281 - HOIST
      ?auto_301284 - PLACE
      ?auto_301283 - TRUCK
      ?auto_301282 - PLACE
      ?auto_301280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_301281 ?auto_301284 ) ( SURFACE-AT ?auto_301278 ?auto_301284 ) ( CLEAR ?auto_301278 ) ( IS-CRATE ?auto_301279 ) ( not ( = ?auto_301278 ?auto_301279 ) ) ( AVAILABLE ?auto_301281 ) ( ON ?auto_301278 ?auto_301277 ) ( not ( = ?auto_301277 ?auto_301278 ) ) ( not ( = ?auto_301277 ?auto_301279 ) ) ( TRUCK-AT ?auto_301283 ?auto_301282 ) ( not ( = ?auto_301282 ?auto_301284 ) ) ( HOIST-AT ?auto_301280 ?auto_301282 ) ( LIFTING ?auto_301280 ?auto_301279 ) ( not ( = ?auto_301281 ?auto_301280 ) ) ( ON ?auto_301272 ?auto_301271 ) ( ON ?auto_301273 ?auto_301272 ) ( ON ?auto_301275 ?auto_301273 ) ( ON ?auto_301274 ?auto_301275 ) ( ON ?auto_301276 ?auto_301274 ) ( ON ?auto_301277 ?auto_301276 ) ( not ( = ?auto_301271 ?auto_301272 ) ) ( not ( = ?auto_301271 ?auto_301273 ) ) ( not ( = ?auto_301271 ?auto_301275 ) ) ( not ( = ?auto_301271 ?auto_301274 ) ) ( not ( = ?auto_301271 ?auto_301276 ) ) ( not ( = ?auto_301271 ?auto_301277 ) ) ( not ( = ?auto_301271 ?auto_301278 ) ) ( not ( = ?auto_301271 ?auto_301279 ) ) ( not ( = ?auto_301272 ?auto_301273 ) ) ( not ( = ?auto_301272 ?auto_301275 ) ) ( not ( = ?auto_301272 ?auto_301274 ) ) ( not ( = ?auto_301272 ?auto_301276 ) ) ( not ( = ?auto_301272 ?auto_301277 ) ) ( not ( = ?auto_301272 ?auto_301278 ) ) ( not ( = ?auto_301272 ?auto_301279 ) ) ( not ( = ?auto_301273 ?auto_301275 ) ) ( not ( = ?auto_301273 ?auto_301274 ) ) ( not ( = ?auto_301273 ?auto_301276 ) ) ( not ( = ?auto_301273 ?auto_301277 ) ) ( not ( = ?auto_301273 ?auto_301278 ) ) ( not ( = ?auto_301273 ?auto_301279 ) ) ( not ( = ?auto_301275 ?auto_301274 ) ) ( not ( = ?auto_301275 ?auto_301276 ) ) ( not ( = ?auto_301275 ?auto_301277 ) ) ( not ( = ?auto_301275 ?auto_301278 ) ) ( not ( = ?auto_301275 ?auto_301279 ) ) ( not ( = ?auto_301274 ?auto_301276 ) ) ( not ( = ?auto_301274 ?auto_301277 ) ) ( not ( = ?auto_301274 ?auto_301278 ) ) ( not ( = ?auto_301274 ?auto_301279 ) ) ( not ( = ?auto_301276 ?auto_301277 ) ) ( not ( = ?auto_301276 ?auto_301278 ) ) ( not ( = ?auto_301276 ?auto_301279 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301277 ?auto_301278 ?auto_301279 )
      ( MAKE-8CRATE-VERIFY ?auto_301271 ?auto_301272 ?auto_301273 ?auto_301275 ?auto_301274 ?auto_301276 ?auto_301277 ?auto_301278 ?auto_301279 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301363 - SURFACE
      ?auto_301364 - SURFACE
      ?auto_301365 - SURFACE
      ?auto_301367 - SURFACE
      ?auto_301366 - SURFACE
      ?auto_301368 - SURFACE
      ?auto_301369 - SURFACE
      ?auto_301370 - SURFACE
      ?auto_301371 - SURFACE
    )
    :vars
    (
      ?auto_301376 - HOIST
      ?auto_301374 - PLACE
      ?auto_301377 - TRUCK
      ?auto_301375 - PLACE
      ?auto_301372 - HOIST
      ?auto_301373 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_301376 ?auto_301374 ) ( SURFACE-AT ?auto_301370 ?auto_301374 ) ( CLEAR ?auto_301370 ) ( IS-CRATE ?auto_301371 ) ( not ( = ?auto_301370 ?auto_301371 ) ) ( AVAILABLE ?auto_301376 ) ( ON ?auto_301370 ?auto_301369 ) ( not ( = ?auto_301369 ?auto_301370 ) ) ( not ( = ?auto_301369 ?auto_301371 ) ) ( TRUCK-AT ?auto_301377 ?auto_301375 ) ( not ( = ?auto_301375 ?auto_301374 ) ) ( HOIST-AT ?auto_301372 ?auto_301375 ) ( not ( = ?auto_301376 ?auto_301372 ) ) ( AVAILABLE ?auto_301372 ) ( SURFACE-AT ?auto_301371 ?auto_301375 ) ( ON ?auto_301371 ?auto_301373 ) ( CLEAR ?auto_301371 ) ( not ( = ?auto_301370 ?auto_301373 ) ) ( not ( = ?auto_301371 ?auto_301373 ) ) ( not ( = ?auto_301369 ?auto_301373 ) ) ( ON ?auto_301364 ?auto_301363 ) ( ON ?auto_301365 ?auto_301364 ) ( ON ?auto_301367 ?auto_301365 ) ( ON ?auto_301366 ?auto_301367 ) ( ON ?auto_301368 ?auto_301366 ) ( ON ?auto_301369 ?auto_301368 ) ( not ( = ?auto_301363 ?auto_301364 ) ) ( not ( = ?auto_301363 ?auto_301365 ) ) ( not ( = ?auto_301363 ?auto_301367 ) ) ( not ( = ?auto_301363 ?auto_301366 ) ) ( not ( = ?auto_301363 ?auto_301368 ) ) ( not ( = ?auto_301363 ?auto_301369 ) ) ( not ( = ?auto_301363 ?auto_301370 ) ) ( not ( = ?auto_301363 ?auto_301371 ) ) ( not ( = ?auto_301363 ?auto_301373 ) ) ( not ( = ?auto_301364 ?auto_301365 ) ) ( not ( = ?auto_301364 ?auto_301367 ) ) ( not ( = ?auto_301364 ?auto_301366 ) ) ( not ( = ?auto_301364 ?auto_301368 ) ) ( not ( = ?auto_301364 ?auto_301369 ) ) ( not ( = ?auto_301364 ?auto_301370 ) ) ( not ( = ?auto_301364 ?auto_301371 ) ) ( not ( = ?auto_301364 ?auto_301373 ) ) ( not ( = ?auto_301365 ?auto_301367 ) ) ( not ( = ?auto_301365 ?auto_301366 ) ) ( not ( = ?auto_301365 ?auto_301368 ) ) ( not ( = ?auto_301365 ?auto_301369 ) ) ( not ( = ?auto_301365 ?auto_301370 ) ) ( not ( = ?auto_301365 ?auto_301371 ) ) ( not ( = ?auto_301365 ?auto_301373 ) ) ( not ( = ?auto_301367 ?auto_301366 ) ) ( not ( = ?auto_301367 ?auto_301368 ) ) ( not ( = ?auto_301367 ?auto_301369 ) ) ( not ( = ?auto_301367 ?auto_301370 ) ) ( not ( = ?auto_301367 ?auto_301371 ) ) ( not ( = ?auto_301367 ?auto_301373 ) ) ( not ( = ?auto_301366 ?auto_301368 ) ) ( not ( = ?auto_301366 ?auto_301369 ) ) ( not ( = ?auto_301366 ?auto_301370 ) ) ( not ( = ?auto_301366 ?auto_301371 ) ) ( not ( = ?auto_301366 ?auto_301373 ) ) ( not ( = ?auto_301368 ?auto_301369 ) ) ( not ( = ?auto_301368 ?auto_301370 ) ) ( not ( = ?auto_301368 ?auto_301371 ) ) ( not ( = ?auto_301368 ?auto_301373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301369 ?auto_301370 ?auto_301371 )
      ( MAKE-8CRATE-VERIFY ?auto_301363 ?auto_301364 ?auto_301365 ?auto_301367 ?auto_301366 ?auto_301368 ?auto_301369 ?auto_301370 ?auto_301371 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301456 - SURFACE
      ?auto_301457 - SURFACE
      ?auto_301458 - SURFACE
      ?auto_301460 - SURFACE
      ?auto_301459 - SURFACE
      ?auto_301461 - SURFACE
      ?auto_301462 - SURFACE
      ?auto_301463 - SURFACE
      ?auto_301464 - SURFACE
    )
    :vars
    (
      ?auto_301465 - HOIST
      ?auto_301469 - PLACE
      ?auto_301470 - PLACE
      ?auto_301466 - HOIST
      ?auto_301468 - SURFACE
      ?auto_301467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301465 ?auto_301469 ) ( SURFACE-AT ?auto_301463 ?auto_301469 ) ( CLEAR ?auto_301463 ) ( IS-CRATE ?auto_301464 ) ( not ( = ?auto_301463 ?auto_301464 ) ) ( AVAILABLE ?auto_301465 ) ( ON ?auto_301463 ?auto_301462 ) ( not ( = ?auto_301462 ?auto_301463 ) ) ( not ( = ?auto_301462 ?auto_301464 ) ) ( not ( = ?auto_301470 ?auto_301469 ) ) ( HOIST-AT ?auto_301466 ?auto_301470 ) ( not ( = ?auto_301465 ?auto_301466 ) ) ( AVAILABLE ?auto_301466 ) ( SURFACE-AT ?auto_301464 ?auto_301470 ) ( ON ?auto_301464 ?auto_301468 ) ( CLEAR ?auto_301464 ) ( not ( = ?auto_301463 ?auto_301468 ) ) ( not ( = ?auto_301464 ?auto_301468 ) ) ( not ( = ?auto_301462 ?auto_301468 ) ) ( TRUCK-AT ?auto_301467 ?auto_301469 ) ( ON ?auto_301457 ?auto_301456 ) ( ON ?auto_301458 ?auto_301457 ) ( ON ?auto_301460 ?auto_301458 ) ( ON ?auto_301459 ?auto_301460 ) ( ON ?auto_301461 ?auto_301459 ) ( ON ?auto_301462 ?auto_301461 ) ( not ( = ?auto_301456 ?auto_301457 ) ) ( not ( = ?auto_301456 ?auto_301458 ) ) ( not ( = ?auto_301456 ?auto_301460 ) ) ( not ( = ?auto_301456 ?auto_301459 ) ) ( not ( = ?auto_301456 ?auto_301461 ) ) ( not ( = ?auto_301456 ?auto_301462 ) ) ( not ( = ?auto_301456 ?auto_301463 ) ) ( not ( = ?auto_301456 ?auto_301464 ) ) ( not ( = ?auto_301456 ?auto_301468 ) ) ( not ( = ?auto_301457 ?auto_301458 ) ) ( not ( = ?auto_301457 ?auto_301460 ) ) ( not ( = ?auto_301457 ?auto_301459 ) ) ( not ( = ?auto_301457 ?auto_301461 ) ) ( not ( = ?auto_301457 ?auto_301462 ) ) ( not ( = ?auto_301457 ?auto_301463 ) ) ( not ( = ?auto_301457 ?auto_301464 ) ) ( not ( = ?auto_301457 ?auto_301468 ) ) ( not ( = ?auto_301458 ?auto_301460 ) ) ( not ( = ?auto_301458 ?auto_301459 ) ) ( not ( = ?auto_301458 ?auto_301461 ) ) ( not ( = ?auto_301458 ?auto_301462 ) ) ( not ( = ?auto_301458 ?auto_301463 ) ) ( not ( = ?auto_301458 ?auto_301464 ) ) ( not ( = ?auto_301458 ?auto_301468 ) ) ( not ( = ?auto_301460 ?auto_301459 ) ) ( not ( = ?auto_301460 ?auto_301461 ) ) ( not ( = ?auto_301460 ?auto_301462 ) ) ( not ( = ?auto_301460 ?auto_301463 ) ) ( not ( = ?auto_301460 ?auto_301464 ) ) ( not ( = ?auto_301460 ?auto_301468 ) ) ( not ( = ?auto_301459 ?auto_301461 ) ) ( not ( = ?auto_301459 ?auto_301462 ) ) ( not ( = ?auto_301459 ?auto_301463 ) ) ( not ( = ?auto_301459 ?auto_301464 ) ) ( not ( = ?auto_301459 ?auto_301468 ) ) ( not ( = ?auto_301461 ?auto_301462 ) ) ( not ( = ?auto_301461 ?auto_301463 ) ) ( not ( = ?auto_301461 ?auto_301464 ) ) ( not ( = ?auto_301461 ?auto_301468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301462 ?auto_301463 ?auto_301464 )
      ( MAKE-8CRATE-VERIFY ?auto_301456 ?auto_301457 ?auto_301458 ?auto_301460 ?auto_301459 ?auto_301461 ?auto_301462 ?auto_301463 ?auto_301464 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301549 - SURFACE
      ?auto_301550 - SURFACE
      ?auto_301551 - SURFACE
      ?auto_301553 - SURFACE
      ?auto_301552 - SURFACE
      ?auto_301554 - SURFACE
      ?auto_301555 - SURFACE
      ?auto_301556 - SURFACE
      ?auto_301557 - SURFACE
    )
    :vars
    (
      ?auto_301560 - HOIST
      ?auto_301563 - PLACE
      ?auto_301559 - PLACE
      ?auto_301562 - HOIST
      ?auto_301561 - SURFACE
      ?auto_301558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301560 ?auto_301563 ) ( IS-CRATE ?auto_301557 ) ( not ( = ?auto_301556 ?auto_301557 ) ) ( not ( = ?auto_301555 ?auto_301556 ) ) ( not ( = ?auto_301555 ?auto_301557 ) ) ( not ( = ?auto_301559 ?auto_301563 ) ) ( HOIST-AT ?auto_301562 ?auto_301559 ) ( not ( = ?auto_301560 ?auto_301562 ) ) ( AVAILABLE ?auto_301562 ) ( SURFACE-AT ?auto_301557 ?auto_301559 ) ( ON ?auto_301557 ?auto_301561 ) ( CLEAR ?auto_301557 ) ( not ( = ?auto_301556 ?auto_301561 ) ) ( not ( = ?auto_301557 ?auto_301561 ) ) ( not ( = ?auto_301555 ?auto_301561 ) ) ( TRUCK-AT ?auto_301558 ?auto_301563 ) ( SURFACE-AT ?auto_301555 ?auto_301563 ) ( CLEAR ?auto_301555 ) ( LIFTING ?auto_301560 ?auto_301556 ) ( IS-CRATE ?auto_301556 ) ( ON ?auto_301550 ?auto_301549 ) ( ON ?auto_301551 ?auto_301550 ) ( ON ?auto_301553 ?auto_301551 ) ( ON ?auto_301552 ?auto_301553 ) ( ON ?auto_301554 ?auto_301552 ) ( ON ?auto_301555 ?auto_301554 ) ( not ( = ?auto_301549 ?auto_301550 ) ) ( not ( = ?auto_301549 ?auto_301551 ) ) ( not ( = ?auto_301549 ?auto_301553 ) ) ( not ( = ?auto_301549 ?auto_301552 ) ) ( not ( = ?auto_301549 ?auto_301554 ) ) ( not ( = ?auto_301549 ?auto_301555 ) ) ( not ( = ?auto_301549 ?auto_301556 ) ) ( not ( = ?auto_301549 ?auto_301557 ) ) ( not ( = ?auto_301549 ?auto_301561 ) ) ( not ( = ?auto_301550 ?auto_301551 ) ) ( not ( = ?auto_301550 ?auto_301553 ) ) ( not ( = ?auto_301550 ?auto_301552 ) ) ( not ( = ?auto_301550 ?auto_301554 ) ) ( not ( = ?auto_301550 ?auto_301555 ) ) ( not ( = ?auto_301550 ?auto_301556 ) ) ( not ( = ?auto_301550 ?auto_301557 ) ) ( not ( = ?auto_301550 ?auto_301561 ) ) ( not ( = ?auto_301551 ?auto_301553 ) ) ( not ( = ?auto_301551 ?auto_301552 ) ) ( not ( = ?auto_301551 ?auto_301554 ) ) ( not ( = ?auto_301551 ?auto_301555 ) ) ( not ( = ?auto_301551 ?auto_301556 ) ) ( not ( = ?auto_301551 ?auto_301557 ) ) ( not ( = ?auto_301551 ?auto_301561 ) ) ( not ( = ?auto_301553 ?auto_301552 ) ) ( not ( = ?auto_301553 ?auto_301554 ) ) ( not ( = ?auto_301553 ?auto_301555 ) ) ( not ( = ?auto_301553 ?auto_301556 ) ) ( not ( = ?auto_301553 ?auto_301557 ) ) ( not ( = ?auto_301553 ?auto_301561 ) ) ( not ( = ?auto_301552 ?auto_301554 ) ) ( not ( = ?auto_301552 ?auto_301555 ) ) ( not ( = ?auto_301552 ?auto_301556 ) ) ( not ( = ?auto_301552 ?auto_301557 ) ) ( not ( = ?auto_301552 ?auto_301561 ) ) ( not ( = ?auto_301554 ?auto_301555 ) ) ( not ( = ?auto_301554 ?auto_301556 ) ) ( not ( = ?auto_301554 ?auto_301557 ) ) ( not ( = ?auto_301554 ?auto_301561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301555 ?auto_301556 ?auto_301557 )
      ( MAKE-8CRATE-VERIFY ?auto_301549 ?auto_301550 ?auto_301551 ?auto_301553 ?auto_301552 ?auto_301554 ?auto_301555 ?auto_301556 ?auto_301557 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_301642 - SURFACE
      ?auto_301643 - SURFACE
      ?auto_301644 - SURFACE
      ?auto_301646 - SURFACE
      ?auto_301645 - SURFACE
      ?auto_301647 - SURFACE
      ?auto_301648 - SURFACE
      ?auto_301649 - SURFACE
      ?auto_301650 - SURFACE
    )
    :vars
    (
      ?auto_301653 - HOIST
      ?auto_301651 - PLACE
      ?auto_301655 - PLACE
      ?auto_301656 - HOIST
      ?auto_301652 - SURFACE
      ?auto_301654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301653 ?auto_301651 ) ( IS-CRATE ?auto_301650 ) ( not ( = ?auto_301649 ?auto_301650 ) ) ( not ( = ?auto_301648 ?auto_301649 ) ) ( not ( = ?auto_301648 ?auto_301650 ) ) ( not ( = ?auto_301655 ?auto_301651 ) ) ( HOIST-AT ?auto_301656 ?auto_301655 ) ( not ( = ?auto_301653 ?auto_301656 ) ) ( AVAILABLE ?auto_301656 ) ( SURFACE-AT ?auto_301650 ?auto_301655 ) ( ON ?auto_301650 ?auto_301652 ) ( CLEAR ?auto_301650 ) ( not ( = ?auto_301649 ?auto_301652 ) ) ( not ( = ?auto_301650 ?auto_301652 ) ) ( not ( = ?auto_301648 ?auto_301652 ) ) ( TRUCK-AT ?auto_301654 ?auto_301651 ) ( SURFACE-AT ?auto_301648 ?auto_301651 ) ( CLEAR ?auto_301648 ) ( IS-CRATE ?auto_301649 ) ( AVAILABLE ?auto_301653 ) ( IN ?auto_301649 ?auto_301654 ) ( ON ?auto_301643 ?auto_301642 ) ( ON ?auto_301644 ?auto_301643 ) ( ON ?auto_301646 ?auto_301644 ) ( ON ?auto_301645 ?auto_301646 ) ( ON ?auto_301647 ?auto_301645 ) ( ON ?auto_301648 ?auto_301647 ) ( not ( = ?auto_301642 ?auto_301643 ) ) ( not ( = ?auto_301642 ?auto_301644 ) ) ( not ( = ?auto_301642 ?auto_301646 ) ) ( not ( = ?auto_301642 ?auto_301645 ) ) ( not ( = ?auto_301642 ?auto_301647 ) ) ( not ( = ?auto_301642 ?auto_301648 ) ) ( not ( = ?auto_301642 ?auto_301649 ) ) ( not ( = ?auto_301642 ?auto_301650 ) ) ( not ( = ?auto_301642 ?auto_301652 ) ) ( not ( = ?auto_301643 ?auto_301644 ) ) ( not ( = ?auto_301643 ?auto_301646 ) ) ( not ( = ?auto_301643 ?auto_301645 ) ) ( not ( = ?auto_301643 ?auto_301647 ) ) ( not ( = ?auto_301643 ?auto_301648 ) ) ( not ( = ?auto_301643 ?auto_301649 ) ) ( not ( = ?auto_301643 ?auto_301650 ) ) ( not ( = ?auto_301643 ?auto_301652 ) ) ( not ( = ?auto_301644 ?auto_301646 ) ) ( not ( = ?auto_301644 ?auto_301645 ) ) ( not ( = ?auto_301644 ?auto_301647 ) ) ( not ( = ?auto_301644 ?auto_301648 ) ) ( not ( = ?auto_301644 ?auto_301649 ) ) ( not ( = ?auto_301644 ?auto_301650 ) ) ( not ( = ?auto_301644 ?auto_301652 ) ) ( not ( = ?auto_301646 ?auto_301645 ) ) ( not ( = ?auto_301646 ?auto_301647 ) ) ( not ( = ?auto_301646 ?auto_301648 ) ) ( not ( = ?auto_301646 ?auto_301649 ) ) ( not ( = ?auto_301646 ?auto_301650 ) ) ( not ( = ?auto_301646 ?auto_301652 ) ) ( not ( = ?auto_301645 ?auto_301647 ) ) ( not ( = ?auto_301645 ?auto_301648 ) ) ( not ( = ?auto_301645 ?auto_301649 ) ) ( not ( = ?auto_301645 ?auto_301650 ) ) ( not ( = ?auto_301645 ?auto_301652 ) ) ( not ( = ?auto_301647 ?auto_301648 ) ) ( not ( = ?auto_301647 ?auto_301649 ) ) ( not ( = ?auto_301647 ?auto_301650 ) ) ( not ( = ?auto_301647 ?auto_301652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_301648 ?auto_301649 ?auto_301650 )
      ( MAKE-8CRATE-VERIFY ?auto_301642 ?auto_301643 ?auto_301644 ?auto_301646 ?auto_301645 ?auto_301647 ?auto_301648 ?auto_301649 ?auto_301650 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_305735 - SURFACE
      ?auto_305736 - SURFACE
      ?auto_305737 - SURFACE
      ?auto_305739 - SURFACE
      ?auto_305738 - SURFACE
      ?auto_305740 - SURFACE
      ?auto_305741 - SURFACE
      ?auto_305742 - SURFACE
      ?auto_305743 - SURFACE
      ?auto_305744 - SURFACE
    )
    :vars
    (
      ?auto_305746 - HOIST
      ?auto_305745 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_305746 ?auto_305745 ) ( SURFACE-AT ?auto_305743 ?auto_305745 ) ( CLEAR ?auto_305743 ) ( LIFTING ?auto_305746 ?auto_305744 ) ( IS-CRATE ?auto_305744 ) ( not ( = ?auto_305743 ?auto_305744 ) ) ( ON ?auto_305736 ?auto_305735 ) ( ON ?auto_305737 ?auto_305736 ) ( ON ?auto_305739 ?auto_305737 ) ( ON ?auto_305738 ?auto_305739 ) ( ON ?auto_305740 ?auto_305738 ) ( ON ?auto_305741 ?auto_305740 ) ( ON ?auto_305742 ?auto_305741 ) ( ON ?auto_305743 ?auto_305742 ) ( not ( = ?auto_305735 ?auto_305736 ) ) ( not ( = ?auto_305735 ?auto_305737 ) ) ( not ( = ?auto_305735 ?auto_305739 ) ) ( not ( = ?auto_305735 ?auto_305738 ) ) ( not ( = ?auto_305735 ?auto_305740 ) ) ( not ( = ?auto_305735 ?auto_305741 ) ) ( not ( = ?auto_305735 ?auto_305742 ) ) ( not ( = ?auto_305735 ?auto_305743 ) ) ( not ( = ?auto_305735 ?auto_305744 ) ) ( not ( = ?auto_305736 ?auto_305737 ) ) ( not ( = ?auto_305736 ?auto_305739 ) ) ( not ( = ?auto_305736 ?auto_305738 ) ) ( not ( = ?auto_305736 ?auto_305740 ) ) ( not ( = ?auto_305736 ?auto_305741 ) ) ( not ( = ?auto_305736 ?auto_305742 ) ) ( not ( = ?auto_305736 ?auto_305743 ) ) ( not ( = ?auto_305736 ?auto_305744 ) ) ( not ( = ?auto_305737 ?auto_305739 ) ) ( not ( = ?auto_305737 ?auto_305738 ) ) ( not ( = ?auto_305737 ?auto_305740 ) ) ( not ( = ?auto_305737 ?auto_305741 ) ) ( not ( = ?auto_305737 ?auto_305742 ) ) ( not ( = ?auto_305737 ?auto_305743 ) ) ( not ( = ?auto_305737 ?auto_305744 ) ) ( not ( = ?auto_305739 ?auto_305738 ) ) ( not ( = ?auto_305739 ?auto_305740 ) ) ( not ( = ?auto_305739 ?auto_305741 ) ) ( not ( = ?auto_305739 ?auto_305742 ) ) ( not ( = ?auto_305739 ?auto_305743 ) ) ( not ( = ?auto_305739 ?auto_305744 ) ) ( not ( = ?auto_305738 ?auto_305740 ) ) ( not ( = ?auto_305738 ?auto_305741 ) ) ( not ( = ?auto_305738 ?auto_305742 ) ) ( not ( = ?auto_305738 ?auto_305743 ) ) ( not ( = ?auto_305738 ?auto_305744 ) ) ( not ( = ?auto_305740 ?auto_305741 ) ) ( not ( = ?auto_305740 ?auto_305742 ) ) ( not ( = ?auto_305740 ?auto_305743 ) ) ( not ( = ?auto_305740 ?auto_305744 ) ) ( not ( = ?auto_305741 ?auto_305742 ) ) ( not ( = ?auto_305741 ?auto_305743 ) ) ( not ( = ?auto_305741 ?auto_305744 ) ) ( not ( = ?auto_305742 ?auto_305743 ) ) ( not ( = ?auto_305742 ?auto_305744 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_305743 ?auto_305744 )
      ( MAKE-9CRATE-VERIFY ?auto_305735 ?auto_305736 ?auto_305737 ?auto_305739 ?auto_305738 ?auto_305740 ?auto_305741 ?auto_305742 ?auto_305743 ?auto_305744 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_305815 - SURFACE
      ?auto_305816 - SURFACE
      ?auto_305817 - SURFACE
      ?auto_305819 - SURFACE
      ?auto_305818 - SURFACE
      ?auto_305820 - SURFACE
      ?auto_305821 - SURFACE
      ?auto_305822 - SURFACE
      ?auto_305823 - SURFACE
      ?auto_305824 - SURFACE
    )
    :vars
    (
      ?auto_305825 - HOIST
      ?auto_305826 - PLACE
      ?auto_305827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_305825 ?auto_305826 ) ( SURFACE-AT ?auto_305823 ?auto_305826 ) ( CLEAR ?auto_305823 ) ( IS-CRATE ?auto_305824 ) ( not ( = ?auto_305823 ?auto_305824 ) ) ( TRUCK-AT ?auto_305827 ?auto_305826 ) ( AVAILABLE ?auto_305825 ) ( IN ?auto_305824 ?auto_305827 ) ( ON ?auto_305823 ?auto_305822 ) ( not ( = ?auto_305822 ?auto_305823 ) ) ( not ( = ?auto_305822 ?auto_305824 ) ) ( ON ?auto_305816 ?auto_305815 ) ( ON ?auto_305817 ?auto_305816 ) ( ON ?auto_305819 ?auto_305817 ) ( ON ?auto_305818 ?auto_305819 ) ( ON ?auto_305820 ?auto_305818 ) ( ON ?auto_305821 ?auto_305820 ) ( ON ?auto_305822 ?auto_305821 ) ( not ( = ?auto_305815 ?auto_305816 ) ) ( not ( = ?auto_305815 ?auto_305817 ) ) ( not ( = ?auto_305815 ?auto_305819 ) ) ( not ( = ?auto_305815 ?auto_305818 ) ) ( not ( = ?auto_305815 ?auto_305820 ) ) ( not ( = ?auto_305815 ?auto_305821 ) ) ( not ( = ?auto_305815 ?auto_305822 ) ) ( not ( = ?auto_305815 ?auto_305823 ) ) ( not ( = ?auto_305815 ?auto_305824 ) ) ( not ( = ?auto_305816 ?auto_305817 ) ) ( not ( = ?auto_305816 ?auto_305819 ) ) ( not ( = ?auto_305816 ?auto_305818 ) ) ( not ( = ?auto_305816 ?auto_305820 ) ) ( not ( = ?auto_305816 ?auto_305821 ) ) ( not ( = ?auto_305816 ?auto_305822 ) ) ( not ( = ?auto_305816 ?auto_305823 ) ) ( not ( = ?auto_305816 ?auto_305824 ) ) ( not ( = ?auto_305817 ?auto_305819 ) ) ( not ( = ?auto_305817 ?auto_305818 ) ) ( not ( = ?auto_305817 ?auto_305820 ) ) ( not ( = ?auto_305817 ?auto_305821 ) ) ( not ( = ?auto_305817 ?auto_305822 ) ) ( not ( = ?auto_305817 ?auto_305823 ) ) ( not ( = ?auto_305817 ?auto_305824 ) ) ( not ( = ?auto_305819 ?auto_305818 ) ) ( not ( = ?auto_305819 ?auto_305820 ) ) ( not ( = ?auto_305819 ?auto_305821 ) ) ( not ( = ?auto_305819 ?auto_305822 ) ) ( not ( = ?auto_305819 ?auto_305823 ) ) ( not ( = ?auto_305819 ?auto_305824 ) ) ( not ( = ?auto_305818 ?auto_305820 ) ) ( not ( = ?auto_305818 ?auto_305821 ) ) ( not ( = ?auto_305818 ?auto_305822 ) ) ( not ( = ?auto_305818 ?auto_305823 ) ) ( not ( = ?auto_305818 ?auto_305824 ) ) ( not ( = ?auto_305820 ?auto_305821 ) ) ( not ( = ?auto_305820 ?auto_305822 ) ) ( not ( = ?auto_305820 ?auto_305823 ) ) ( not ( = ?auto_305820 ?auto_305824 ) ) ( not ( = ?auto_305821 ?auto_305822 ) ) ( not ( = ?auto_305821 ?auto_305823 ) ) ( not ( = ?auto_305821 ?auto_305824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_305822 ?auto_305823 ?auto_305824 )
      ( MAKE-9CRATE-VERIFY ?auto_305815 ?auto_305816 ?auto_305817 ?auto_305819 ?auto_305818 ?auto_305820 ?auto_305821 ?auto_305822 ?auto_305823 ?auto_305824 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_305905 - SURFACE
      ?auto_305906 - SURFACE
      ?auto_305907 - SURFACE
      ?auto_305909 - SURFACE
      ?auto_305908 - SURFACE
      ?auto_305910 - SURFACE
      ?auto_305911 - SURFACE
      ?auto_305912 - SURFACE
      ?auto_305913 - SURFACE
      ?auto_305914 - SURFACE
    )
    :vars
    (
      ?auto_305917 - HOIST
      ?auto_305918 - PLACE
      ?auto_305915 - TRUCK
      ?auto_305916 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_305917 ?auto_305918 ) ( SURFACE-AT ?auto_305913 ?auto_305918 ) ( CLEAR ?auto_305913 ) ( IS-CRATE ?auto_305914 ) ( not ( = ?auto_305913 ?auto_305914 ) ) ( AVAILABLE ?auto_305917 ) ( IN ?auto_305914 ?auto_305915 ) ( ON ?auto_305913 ?auto_305912 ) ( not ( = ?auto_305912 ?auto_305913 ) ) ( not ( = ?auto_305912 ?auto_305914 ) ) ( TRUCK-AT ?auto_305915 ?auto_305916 ) ( not ( = ?auto_305916 ?auto_305918 ) ) ( ON ?auto_305906 ?auto_305905 ) ( ON ?auto_305907 ?auto_305906 ) ( ON ?auto_305909 ?auto_305907 ) ( ON ?auto_305908 ?auto_305909 ) ( ON ?auto_305910 ?auto_305908 ) ( ON ?auto_305911 ?auto_305910 ) ( ON ?auto_305912 ?auto_305911 ) ( not ( = ?auto_305905 ?auto_305906 ) ) ( not ( = ?auto_305905 ?auto_305907 ) ) ( not ( = ?auto_305905 ?auto_305909 ) ) ( not ( = ?auto_305905 ?auto_305908 ) ) ( not ( = ?auto_305905 ?auto_305910 ) ) ( not ( = ?auto_305905 ?auto_305911 ) ) ( not ( = ?auto_305905 ?auto_305912 ) ) ( not ( = ?auto_305905 ?auto_305913 ) ) ( not ( = ?auto_305905 ?auto_305914 ) ) ( not ( = ?auto_305906 ?auto_305907 ) ) ( not ( = ?auto_305906 ?auto_305909 ) ) ( not ( = ?auto_305906 ?auto_305908 ) ) ( not ( = ?auto_305906 ?auto_305910 ) ) ( not ( = ?auto_305906 ?auto_305911 ) ) ( not ( = ?auto_305906 ?auto_305912 ) ) ( not ( = ?auto_305906 ?auto_305913 ) ) ( not ( = ?auto_305906 ?auto_305914 ) ) ( not ( = ?auto_305907 ?auto_305909 ) ) ( not ( = ?auto_305907 ?auto_305908 ) ) ( not ( = ?auto_305907 ?auto_305910 ) ) ( not ( = ?auto_305907 ?auto_305911 ) ) ( not ( = ?auto_305907 ?auto_305912 ) ) ( not ( = ?auto_305907 ?auto_305913 ) ) ( not ( = ?auto_305907 ?auto_305914 ) ) ( not ( = ?auto_305909 ?auto_305908 ) ) ( not ( = ?auto_305909 ?auto_305910 ) ) ( not ( = ?auto_305909 ?auto_305911 ) ) ( not ( = ?auto_305909 ?auto_305912 ) ) ( not ( = ?auto_305909 ?auto_305913 ) ) ( not ( = ?auto_305909 ?auto_305914 ) ) ( not ( = ?auto_305908 ?auto_305910 ) ) ( not ( = ?auto_305908 ?auto_305911 ) ) ( not ( = ?auto_305908 ?auto_305912 ) ) ( not ( = ?auto_305908 ?auto_305913 ) ) ( not ( = ?auto_305908 ?auto_305914 ) ) ( not ( = ?auto_305910 ?auto_305911 ) ) ( not ( = ?auto_305910 ?auto_305912 ) ) ( not ( = ?auto_305910 ?auto_305913 ) ) ( not ( = ?auto_305910 ?auto_305914 ) ) ( not ( = ?auto_305911 ?auto_305912 ) ) ( not ( = ?auto_305911 ?auto_305913 ) ) ( not ( = ?auto_305911 ?auto_305914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_305912 ?auto_305913 ?auto_305914 )
      ( MAKE-9CRATE-VERIFY ?auto_305905 ?auto_305906 ?auto_305907 ?auto_305909 ?auto_305908 ?auto_305910 ?auto_305911 ?auto_305912 ?auto_305913 ?auto_305914 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306004 - SURFACE
      ?auto_306005 - SURFACE
      ?auto_306006 - SURFACE
      ?auto_306008 - SURFACE
      ?auto_306007 - SURFACE
      ?auto_306009 - SURFACE
      ?auto_306010 - SURFACE
      ?auto_306011 - SURFACE
      ?auto_306012 - SURFACE
      ?auto_306013 - SURFACE
    )
    :vars
    (
      ?auto_306014 - HOIST
      ?auto_306018 - PLACE
      ?auto_306017 - TRUCK
      ?auto_306016 - PLACE
      ?auto_306015 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_306014 ?auto_306018 ) ( SURFACE-AT ?auto_306012 ?auto_306018 ) ( CLEAR ?auto_306012 ) ( IS-CRATE ?auto_306013 ) ( not ( = ?auto_306012 ?auto_306013 ) ) ( AVAILABLE ?auto_306014 ) ( ON ?auto_306012 ?auto_306011 ) ( not ( = ?auto_306011 ?auto_306012 ) ) ( not ( = ?auto_306011 ?auto_306013 ) ) ( TRUCK-AT ?auto_306017 ?auto_306016 ) ( not ( = ?auto_306016 ?auto_306018 ) ) ( HOIST-AT ?auto_306015 ?auto_306016 ) ( LIFTING ?auto_306015 ?auto_306013 ) ( not ( = ?auto_306014 ?auto_306015 ) ) ( ON ?auto_306005 ?auto_306004 ) ( ON ?auto_306006 ?auto_306005 ) ( ON ?auto_306008 ?auto_306006 ) ( ON ?auto_306007 ?auto_306008 ) ( ON ?auto_306009 ?auto_306007 ) ( ON ?auto_306010 ?auto_306009 ) ( ON ?auto_306011 ?auto_306010 ) ( not ( = ?auto_306004 ?auto_306005 ) ) ( not ( = ?auto_306004 ?auto_306006 ) ) ( not ( = ?auto_306004 ?auto_306008 ) ) ( not ( = ?auto_306004 ?auto_306007 ) ) ( not ( = ?auto_306004 ?auto_306009 ) ) ( not ( = ?auto_306004 ?auto_306010 ) ) ( not ( = ?auto_306004 ?auto_306011 ) ) ( not ( = ?auto_306004 ?auto_306012 ) ) ( not ( = ?auto_306004 ?auto_306013 ) ) ( not ( = ?auto_306005 ?auto_306006 ) ) ( not ( = ?auto_306005 ?auto_306008 ) ) ( not ( = ?auto_306005 ?auto_306007 ) ) ( not ( = ?auto_306005 ?auto_306009 ) ) ( not ( = ?auto_306005 ?auto_306010 ) ) ( not ( = ?auto_306005 ?auto_306011 ) ) ( not ( = ?auto_306005 ?auto_306012 ) ) ( not ( = ?auto_306005 ?auto_306013 ) ) ( not ( = ?auto_306006 ?auto_306008 ) ) ( not ( = ?auto_306006 ?auto_306007 ) ) ( not ( = ?auto_306006 ?auto_306009 ) ) ( not ( = ?auto_306006 ?auto_306010 ) ) ( not ( = ?auto_306006 ?auto_306011 ) ) ( not ( = ?auto_306006 ?auto_306012 ) ) ( not ( = ?auto_306006 ?auto_306013 ) ) ( not ( = ?auto_306008 ?auto_306007 ) ) ( not ( = ?auto_306008 ?auto_306009 ) ) ( not ( = ?auto_306008 ?auto_306010 ) ) ( not ( = ?auto_306008 ?auto_306011 ) ) ( not ( = ?auto_306008 ?auto_306012 ) ) ( not ( = ?auto_306008 ?auto_306013 ) ) ( not ( = ?auto_306007 ?auto_306009 ) ) ( not ( = ?auto_306007 ?auto_306010 ) ) ( not ( = ?auto_306007 ?auto_306011 ) ) ( not ( = ?auto_306007 ?auto_306012 ) ) ( not ( = ?auto_306007 ?auto_306013 ) ) ( not ( = ?auto_306009 ?auto_306010 ) ) ( not ( = ?auto_306009 ?auto_306011 ) ) ( not ( = ?auto_306009 ?auto_306012 ) ) ( not ( = ?auto_306009 ?auto_306013 ) ) ( not ( = ?auto_306010 ?auto_306011 ) ) ( not ( = ?auto_306010 ?auto_306012 ) ) ( not ( = ?auto_306010 ?auto_306013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306011 ?auto_306012 ?auto_306013 )
      ( MAKE-9CRATE-VERIFY ?auto_306004 ?auto_306005 ?auto_306006 ?auto_306008 ?auto_306007 ?auto_306009 ?auto_306010 ?auto_306011 ?auto_306012 ?auto_306013 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306112 - SURFACE
      ?auto_306113 - SURFACE
      ?auto_306114 - SURFACE
      ?auto_306116 - SURFACE
      ?auto_306115 - SURFACE
      ?auto_306117 - SURFACE
      ?auto_306118 - SURFACE
      ?auto_306119 - SURFACE
      ?auto_306120 - SURFACE
      ?auto_306121 - SURFACE
    )
    :vars
    (
      ?auto_306124 - HOIST
      ?auto_306127 - PLACE
      ?auto_306123 - TRUCK
      ?auto_306122 - PLACE
      ?auto_306125 - HOIST
      ?auto_306126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_306124 ?auto_306127 ) ( SURFACE-AT ?auto_306120 ?auto_306127 ) ( CLEAR ?auto_306120 ) ( IS-CRATE ?auto_306121 ) ( not ( = ?auto_306120 ?auto_306121 ) ) ( AVAILABLE ?auto_306124 ) ( ON ?auto_306120 ?auto_306119 ) ( not ( = ?auto_306119 ?auto_306120 ) ) ( not ( = ?auto_306119 ?auto_306121 ) ) ( TRUCK-AT ?auto_306123 ?auto_306122 ) ( not ( = ?auto_306122 ?auto_306127 ) ) ( HOIST-AT ?auto_306125 ?auto_306122 ) ( not ( = ?auto_306124 ?auto_306125 ) ) ( AVAILABLE ?auto_306125 ) ( SURFACE-AT ?auto_306121 ?auto_306122 ) ( ON ?auto_306121 ?auto_306126 ) ( CLEAR ?auto_306121 ) ( not ( = ?auto_306120 ?auto_306126 ) ) ( not ( = ?auto_306121 ?auto_306126 ) ) ( not ( = ?auto_306119 ?auto_306126 ) ) ( ON ?auto_306113 ?auto_306112 ) ( ON ?auto_306114 ?auto_306113 ) ( ON ?auto_306116 ?auto_306114 ) ( ON ?auto_306115 ?auto_306116 ) ( ON ?auto_306117 ?auto_306115 ) ( ON ?auto_306118 ?auto_306117 ) ( ON ?auto_306119 ?auto_306118 ) ( not ( = ?auto_306112 ?auto_306113 ) ) ( not ( = ?auto_306112 ?auto_306114 ) ) ( not ( = ?auto_306112 ?auto_306116 ) ) ( not ( = ?auto_306112 ?auto_306115 ) ) ( not ( = ?auto_306112 ?auto_306117 ) ) ( not ( = ?auto_306112 ?auto_306118 ) ) ( not ( = ?auto_306112 ?auto_306119 ) ) ( not ( = ?auto_306112 ?auto_306120 ) ) ( not ( = ?auto_306112 ?auto_306121 ) ) ( not ( = ?auto_306112 ?auto_306126 ) ) ( not ( = ?auto_306113 ?auto_306114 ) ) ( not ( = ?auto_306113 ?auto_306116 ) ) ( not ( = ?auto_306113 ?auto_306115 ) ) ( not ( = ?auto_306113 ?auto_306117 ) ) ( not ( = ?auto_306113 ?auto_306118 ) ) ( not ( = ?auto_306113 ?auto_306119 ) ) ( not ( = ?auto_306113 ?auto_306120 ) ) ( not ( = ?auto_306113 ?auto_306121 ) ) ( not ( = ?auto_306113 ?auto_306126 ) ) ( not ( = ?auto_306114 ?auto_306116 ) ) ( not ( = ?auto_306114 ?auto_306115 ) ) ( not ( = ?auto_306114 ?auto_306117 ) ) ( not ( = ?auto_306114 ?auto_306118 ) ) ( not ( = ?auto_306114 ?auto_306119 ) ) ( not ( = ?auto_306114 ?auto_306120 ) ) ( not ( = ?auto_306114 ?auto_306121 ) ) ( not ( = ?auto_306114 ?auto_306126 ) ) ( not ( = ?auto_306116 ?auto_306115 ) ) ( not ( = ?auto_306116 ?auto_306117 ) ) ( not ( = ?auto_306116 ?auto_306118 ) ) ( not ( = ?auto_306116 ?auto_306119 ) ) ( not ( = ?auto_306116 ?auto_306120 ) ) ( not ( = ?auto_306116 ?auto_306121 ) ) ( not ( = ?auto_306116 ?auto_306126 ) ) ( not ( = ?auto_306115 ?auto_306117 ) ) ( not ( = ?auto_306115 ?auto_306118 ) ) ( not ( = ?auto_306115 ?auto_306119 ) ) ( not ( = ?auto_306115 ?auto_306120 ) ) ( not ( = ?auto_306115 ?auto_306121 ) ) ( not ( = ?auto_306115 ?auto_306126 ) ) ( not ( = ?auto_306117 ?auto_306118 ) ) ( not ( = ?auto_306117 ?auto_306119 ) ) ( not ( = ?auto_306117 ?auto_306120 ) ) ( not ( = ?auto_306117 ?auto_306121 ) ) ( not ( = ?auto_306117 ?auto_306126 ) ) ( not ( = ?auto_306118 ?auto_306119 ) ) ( not ( = ?auto_306118 ?auto_306120 ) ) ( not ( = ?auto_306118 ?auto_306121 ) ) ( not ( = ?auto_306118 ?auto_306126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306119 ?auto_306120 ?auto_306121 )
      ( MAKE-9CRATE-VERIFY ?auto_306112 ?auto_306113 ?auto_306114 ?auto_306116 ?auto_306115 ?auto_306117 ?auto_306118 ?auto_306119 ?auto_306120 ?auto_306121 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306221 - SURFACE
      ?auto_306222 - SURFACE
      ?auto_306223 - SURFACE
      ?auto_306225 - SURFACE
      ?auto_306224 - SURFACE
      ?auto_306226 - SURFACE
      ?auto_306227 - SURFACE
      ?auto_306228 - SURFACE
      ?auto_306229 - SURFACE
      ?auto_306230 - SURFACE
    )
    :vars
    (
      ?auto_306234 - HOIST
      ?auto_306236 - PLACE
      ?auto_306231 - PLACE
      ?auto_306232 - HOIST
      ?auto_306233 - SURFACE
      ?auto_306235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306234 ?auto_306236 ) ( SURFACE-AT ?auto_306229 ?auto_306236 ) ( CLEAR ?auto_306229 ) ( IS-CRATE ?auto_306230 ) ( not ( = ?auto_306229 ?auto_306230 ) ) ( AVAILABLE ?auto_306234 ) ( ON ?auto_306229 ?auto_306228 ) ( not ( = ?auto_306228 ?auto_306229 ) ) ( not ( = ?auto_306228 ?auto_306230 ) ) ( not ( = ?auto_306231 ?auto_306236 ) ) ( HOIST-AT ?auto_306232 ?auto_306231 ) ( not ( = ?auto_306234 ?auto_306232 ) ) ( AVAILABLE ?auto_306232 ) ( SURFACE-AT ?auto_306230 ?auto_306231 ) ( ON ?auto_306230 ?auto_306233 ) ( CLEAR ?auto_306230 ) ( not ( = ?auto_306229 ?auto_306233 ) ) ( not ( = ?auto_306230 ?auto_306233 ) ) ( not ( = ?auto_306228 ?auto_306233 ) ) ( TRUCK-AT ?auto_306235 ?auto_306236 ) ( ON ?auto_306222 ?auto_306221 ) ( ON ?auto_306223 ?auto_306222 ) ( ON ?auto_306225 ?auto_306223 ) ( ON ?auto_306224 ?auto_306225 ) ( ON ?auto_306226 ?auto_306224 ) ( ON ?auto_306227 ?auto_306226 ) ( ON ?auto_306228 ?auto_306227 ) ( not ( = ?auto_306221 ?auto_306222 ) ) ( not ( = ?auto_306221 ?auto_306223 ) ) ( not ( = ?auto_306221 ?auto_306225 ) ) ( not ( = ?auto_306221 ?auto_306224 ) ) ( not ( = ?auto_306221 ?auto_306226 ) ) ( not ( = ?auto_306221 ?auto_306227 ) ) ( not ( = ?auto_306221 ?auto_306228 ) ) ( not ( = ?auto_306221 ?auto_306229 ) ) ( not ( = ?auto_306221 ?auto_306230 ) ) ( not ( = ?auto_306221 ?auto_306233 ) ) ( not ( = ?auto_306222 ?auto_306223 ) ) ( not ( = ?auto_306222 ?auto_306225 ) ) ( not ( = ?auto_306222 ?auto_306224 ) ) ( not ( = ?auto_306222 ?auto_306226 ) ) ( not ( = ?auto_306222 ?auto_306227 ) ) ( not ( = ?auto_306222 ?auto_306228 ) ) ( not ( = ?auto_306222 ?auto_306229 ) ) ( not ( = ?auto_306222 ?auto_306230 ) ) ( not ( = ?auto_306222 ?auto_306233 ) ) ( not ( = ?auto_306223 ?auto_306225 ) ) ( not ( = ?auto_306223 ?auto_306224 ) ) ( not ( = ?auto_306223 ?auto_306226 ) ) ( not ( = ?auto_306223 ?auto_306227 ) ) ( not ( = ?auto_306223 ?auto_306228 ) ) ( not ( = ?auto_306223 ?auto_306229 ) ) ( not ( = ?auto_306223 ?auto_306230 ) ) ( not ( = ?auto_306223 ?auto_306233 ) ) ( not ( = ?auto_306225 ?auto_306224 ) ) ( not ( = ?auto_306225 ?auto_306226 ) ) ( not ( = ?auto_306225 ?auto_306227 ) ) ( not ( = ?auto_306225 ?auto_306228 ) ) ( not ( = ?auto_306225 ?auto_306229 ) ) ( not ( = ?auto_306225 ?auto_306230 ) ) ( not ( = ?auto_306225 ?auto_306233 ) ) ( not ( = ?auto_306224 ?auto_306226 ) ) ( not ( = ?auto_306224 ?auto_306227 ) ) ( not ( = ?auto_306224 ?auto_306228 ) ) ( not ( = ?auto_306224 ?auto_306229 ) ) ( not ( = ?auto_306224 ?auto_306230 ) ) ( not ( = ?auto_306224 ?auto_306233 ) ) ( not ( = ?auto_306226 ?auto_306227 ) ) ( not ( = ?auto_306226 ?auto_306228 ) ) ( not ( = ?auto_306226 ?auto_306229 ) ) ( not ( = ?auto_306226 ?auto_306230 ) ) ( not ( = ?auto_306226 ?auto_306233 ) ) ( not ( = ?auto_306227 ?auto_306228 ) ) ( not ( = ?auto_306227 ?auto_306229 ) ) ( not ( = ?auto_306227 ?auto_306230 ) ) ( not ( = ?auto_306227 ?auto_306233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306228 ?auto_306229 ?auto_306230 )
      ( MAKE-9CRATE-VERIFY ?auto_306221 ?auto_306222 ?auto_306223 ?auto_306225 ?auto_306224 ?auto_306226 ?auto_306227 ?auto_306228 ?auto_306229 ?auto_306230 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306330 - SURFACE
      ?auto_306331 - SURFACE
      ?auto_306332 - SURFACE
      ?auto_306334 - SURFACE
      ?auto_306333 - SURFACE
      ?auto_306335 - SURFACE
      ?auto_306336 - SURFACE
      ?auto_306337 - SURFACE
      ?auto_306338 - SURFACE
      ?auto_306339 - SURFACE
    )
    :vars
    (
      ?auto_306340 - HOIST
      ?auto_306341 - PLACE
      ?auto_306344 - PLACE
      ?auto_306343 - HOIST
      ?auto_306342 - SURFACE
      ?auto_306345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306340 ?auto_306341 ) ( IS-CRATE ?auto_306339 ) ( not ( = ?auto_306338 ?auto_306339 ) ) ( not ( = ?auto_306337 ?auto_306338 ) ) ( not ( = ?auto_306337 ?auto_306339 ) ) ( not ( = ?auto_306344 ?auto_306341 ) ) ( HOIST-AT ?auto_306343 ?auto_306344 ) ( not ( = ?auto_306340 ?auto_306343 ) ) ( AVAILABLE ?auto_306343 ) ( SURFACE-AT ?auto_306339 ?auto_306344 ) ( ON ?auto_306339 ?auto_306342 ) ( CLEAR ?auto_306339 ) ( not ( = ?auto_306338 ?auto_306342 ) ) ( not ( = ?auto_306339 ?auto_306342 ) ) ( not ( = ?auto_306337 ?auto_306342 ) ) ( TRUCK-AT ?auto_306345 ?auto_306341 ) ( SURFACE-AT ?auto_306337 ?auto_306341 ) ( CLEAR ?auto_306337 ) ( LIFTING ?auto_306340 ?auto_306338 ) ( IS-CRATE ?auto_306338 ) ( ON ?auto_306331 ?auto_306330 ) ( ON ?auto_306332 ?auto_306331 ) ( ON ?auto_306334 ?auto_306332 ) ( ON ?auto_306333 ?auto_306334 ) ( ON ?auto_306335 ?auto_306333 ) ( ON ?auto_306336 ?auto_306335 ) ( ON ?auto_306337 ?auto_306336 ) ( not ( = ?auto_306330 ?auto_306331 ) ) ( not ( = ?auto_306330 ?auto_306332 ) ) ( not ( = ?auto_306330 ?auto_306334 ) ) ( not ( = ?auto_306330 ?auto_306333 ) ) ( not ( = ?auto_306330 ?auto_306335 ) ) ( not ( = ?auto_306330 ?auto_306336 ) ) ( not ( = ?auto_306330 ?auto_306337 ) ) ( not ( = ?auto_306330 ?auto_306338 ) ) ( not ( = ?auto_306330 ?auto_306339 ) ) ( not ( = ?auto_306330 ?auto_306342 ) ) ( not ( = ?auto_306331 ?auto_306332 ) ) ( not ( = ?auto_306331 ?auto_306334 ) ) ( not ( = ?auto_306331 ?auto_306333 ) ) ( not ( = ?auto_306331 ?auto_306335 ) ) ( not ( = ?auto_306331 ?auto_306336 ) ) ( not ( = ?auto_306331 ?auto_306337 ) ) ( not ( = ?auto_306331 ?auto_306338 ) ) ( not ( = ?auto_306331 ?auto_306339 ) ) ( not ( = ?auto_306331 ?auto_306342 ) ) ( not ( = ?auto_306332 ?auto_306334 ) ) ( not ( = ?auto_306332 ?auto_306333 ) ) ( not ( = ?auto_306332 ?auto_306335 ) ) ( not ( = ?auto_306332 ?auto_306336 ) ) ( not ( = ?auto_306332 ?auto_306337 ) ) ( not ( = ?auto_306332 ?auto_306338 ) ) ( not ( = ?auto_306332 ?auto_306339 ) ) ( not ( = ?auto_306332 ?auto_306342 ) ) ( not ( = ?auto_306334 ?auto_306333 ) ) ( not ( = ?auto_306334 ?auto_306335 ) ) ( not ( = ?auto_306334 ?auto_306336 ) ) ( not ( = ?auto_306334 ?auto_306337 ) ) ( not ( = ?auto_306334 ?auto_306338 ) ) ( not ( = ?auto_306334 ?auto_306339 ) ) ( not ( = ?auto_306334 ?auto_306342 ) ) ( not ( = ?auto_306333 ?auto_306335 ) ) ( not ( = ?auto_306333 ?auto_306336 ) ) ( not ( = ?auto_306333 ?auto_306337 ) ) ( not ( = ?auto_306333 ?auto_306338 ) ) ( not ( = ?auto_306333 ?auto_306339 ) ) ( not ( = ?auto_306333 ?auto_306342 ) ) ( not ( = ?auto_306335 ?auto_306336 ) ) ( not ( = ?auto_306335 ?auto_306337 ) ) ( not ( = ?auto_306335 ?auto_306338 ) ) ( not ( = ?auto_306335 ?auto_306339 ) ) ( not ( = ?auto_306335 ?auto_306342 ) ) ( not ( = ?auto_306336 ?auto_306337 ) ) ( not ( = ?auto_306336 ?auto_306338 ) ) ( not ( = ?auto_306336 ?auto_306339 ) ) ( not ( = ?auto_306336 ?auto_306342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306337 ?auto_306338 ?auto_306339 )
      ( MAKE-9CRATE-VERIFY ?auto_306330 ?auto_306331 ?auto_306332 ?auto_306334 ?auto_306333 ?auto_306335 ?auto_306336 ?auto_306337 ?auto_306338 ?auto_306339 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_306439 - SURFACE
      ?auto_306440 - SURFACE
      ?auto_306441 - SURFACE
      ?auto_306443 - SURFACE
      ?auto_306442 - SURFACE
      ?auto_306444 - SURFACE
      ?auto_306445 - SURFACE
      ?auto_306446 - SURFACE
      ?auto_306447 - SURFACE
      ?auto_306448 - SURFACE
    )
    :vars
    (
      ?auto_306452 - HOIST
      ?auto_306449 - PLACE
      ?auto_306450 - PLACE
      ?auto_306454 - HOIST
      ?auto_306453 - SURFACE
      ?auto_306451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306452 ?auto_306449 ) ( IS-CRATE ?auto_306448 ) ( not ( = ?auto_306447 ?auto_306448 ) ) ( not ( = ?auto_306446 ?auto_306447 ) ) ( not ( = ?auto_306446 ?auto_306448 ) ) ( not ( = ?auto_306450 ?auto_306449 ) ) ( HOIST-AT ?auto_306454 ?auto_306450 ) ( not ( = ?auto_306452 ?auto_306454 ) ) ( AVAILABLE ?auto_306454 ) ( SURFACE-AT ?auto_306448 ?auto_306450 ) ( ON ?auto_306448 ?auto_306453 ) ( CLEAR ?auto_306448 ) ( not ( = ?auto_306447 ?auto_306453 ) ) ( not ( = ?auto_306448 ?auto_306453 ) ) ( not ( = ?auto_306446 ?auto_306453 ) ) ( TRUCK-AT ?auto_306451 ?auto_306449 ) ( SURFACE-AT ?auto_306446 ?auto_306449 ) ( CLEAR ?auto_306446 ) ( IS-CRATE ?auto_306447 ) ( AVAILABLE ?auto_306452 ) ( IN ?auto_306447 ?auto_306451 ) ( ON ?auto_306440 ?auto_306439 ) ( ON ?auto_306441 ?auto_306440 ) ( ON ?auto_306443 ?auto_306441 ) ( ON ?auto_306442 ?auto_306443 ) ( ON ?auto_306444 ?auto_306442 ) ( ON ?auto_306445 ?auto_306444 ) ( ON ?auto_306446 ?auto_306445 ) ( not ( = ?auto_306439 ?auto_306440 ) ) ( not ( = ?auto_306439 ?auto_306441 ) ) ( not ( = ?auto_306439 ?auto_306443 ) ) ( not ( = ?auto_306439 ?auto_306442 ) ) ( not ( = ?auto_306439 ?auto_306444 ) ) ( not ( = ?auto_306439 ?auto_306445 ) ) ( not ( = ?auto_306439 ?auto_306446 ) ) ( not ( = ?auto_306439 ?auto_306447 ) ) ( not ( = ?auto_306439 ?auto_306448 ) ) ( not ( = ?auto_306439 ?auto_306453 ) ) ( not ( = ?auto_306440 ?auto_306441 ) ) ( not ( = ?auto_306440 ?auto_306443 ) ) ( not ( = ?auto_306440 ?auto_306442 ) ) ( not ( = ?auto_306440 ?auto_306444 ) ) ( not ( = ?auto_306440 ?auto_306445 ) ) ( not ( = ?auto_306440 ?auto_306446 ) ) ( not ( = ?auto_306440 ?auto_306447 ) ) ( not ( = ?auto_306440 ?auto_306448 ) ) ( not ( = ?auto_306440 ?auto_306453 ) ) ( not ( = ?auto_306441 ?auto_306443 ) ) ( not ( = ?auto_306441 ?auto_306442 ) ) ( not ( = ?auto_306441 ?auto_306444 ) ) ( not ( = ?auto_306441 ?auto_306445 ) ) ( not ( = ?auto_306441 ?auto_306446 ) ) ( not ( = ?auto_306441 ?auto_306447 ) ) ( not ( = ?auto_306441 ?auto_306448 ) ) ( not ( = ?auto_306441 ?auto_306453 ) ) ( not ( = ?auto_306443 ?auto_306442 ) ) ( not ( = ?auto_306443 ?auto_306444 ) ) ( not ( = ?auto_306443 ?auto_306445 ) ) ( not ( = ?auto_306443 ?auto_306446 ) ) ( not ( = ?auto_306443 ?auto_306447 ) ) ( not ( = ?auto_306443 ?auto_306448 ) ) ( not ( = ?auto_306443 ?auto_306453 ) ) ( not ( = ?auto_306442 ?auto_306444 ) ) ( not ( = ?auto_306442 ?auto_306445 ) ) ( not ( = ?auto_306442 ?auto_306446 ) ) ( not ( = ?auto_306442 ?auto_306447 ) ) ( not ( = ?auto_306442 ?auto_306448 ) ) ( not ( = ?auto_306442 ?auto_306453 ) ) ( not ( = ?auto_306444 ?auto_306445 ) ) ( not ( = ?auto_306444 ?auto_306446 ) ) ( not ( = ?auto_306444 ?auto_306447 ) ) ( not ( = ?auto_306444 ?auto_306448 ) ) ( not ( = ?auto_306444 ?auto_306453 ) ) ( not ( = ?auto_306445 ?auto_306446 ) ) ( not ( = ?auto_306445 ?auto_306447 ) ) ( not ( = ?auto_306445 ?auto_306448 ) ) ( not ( = ?auto_306445 ?auto_306453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_306446 ?auto_306447 ?auto_306448 )
      ( MAKE-9CRATE-VERIFY ?auto_306439 ?auto_306440 ?auto_306441 ?auto_306443 ?auto_306442 ?auto_306444 ?auto_306445 ?auto_306446 ?auto_306447 ?auto_306448 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_311949 - SURFACE
      ?auto_311950 - SURFACE
      ?auto_311951 - SURFACE
      ?auto_311953 - SURFACE
      ?auto_311952 - SURFACE
      ?auto_311954 - SURFACE
      ?auto_311955 - SURFACE
      ?auto_311956 - SURFACE
      ?auto_311957 - SURFACE
      ?auto_311958 - SURFACE
      ?auto_311959 - SURFACE
    )
    :vars
    (
      ?auto_311961 - HOIST
      ?auto_311960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_311961 ?auto_311960 ) ( SURFACE-AT ?auto_311958 ?auto_311960 ) ( CLEAR ?auto_311958 ) ( LIFTING ?auto_311961 ?auto_311959 ) ( IS-CRATE ?auto_311959 ) ( not ( = ?auto_311958 ?auto_311959 ) ) ( ON ?auto_311950 ?auto_311949 ) ( ON ?auto_311951 ?auto_311950 ) ( ON ?auto_311953 ?auto_311951 ) ( ON ?auto_311952 ?auto_311953 ) ( ON ?auto_311954 ?auto_311952 ) ( ON ?auto_311955 ?auto_311954 ) ( ON ?auto_311956 ?auto_311955 ) ( ON ?auto_311957 ?auto_311956 ) ( ON ?auto_311958 ?auto_311957 ) ( not ( = ?auto_311949 ?auto_311950 ) ) ( not ( = ?auto_311949 ?auto_311951 ) ) ( not ( = ?auto_311949 ?auto_311953 ) ) ( not ( = ?auto_311949 ?auto_311952 ) ) ( not ( = ?auto_311949 ?auto_311954 ) ) ( not ( = ?auto_311949 ?auto_311955 ) ) ( not ( = ?auto_311949 ?auto_311956 ) ) ( not ( = ?auto_311949 ?auto_311957 ) ) ( not ( = ?auto_311949 ?auto_311958 ) ) ( not ( = ?auto_311949 ?auto_311959 ) ) ( not ( = ?auto_311950 ?auto_311951 ) ) ( not ( = ?auto_311950 ?auto_311953 ) ) ( not ( = ?auto_311950 ?auto_311952 ) ) ( not ( = ?auto_311950 ?auto_311954 ) ) ( not ( = ?auto_311950 ?auto_311955 ) ) ( not ( = ?auto_311950 ?auto_311956 ) ) ( not ( = ?auto_311950 ?auto_311957 ) ) ( not ( = ?auto_311950 ?auto_311958 ) ) ( not ( = ?auto_311950 ?auto_311959 ) ) ( not ( = ?auto_311951 ?auto_311953 ) ) ( not ( = ?auto_311951 ?auto_311952 ) ) ( not ( = ?auto_311951 ?auto_311954 ) ) ( not ( = ?auto_311951 ?auto_311955 ) ) ( not ( = ?auto_311951 ?auto_311956 ) ) ( not ( = ?auto_311951 ?auto_311957 ) ) ( not ( = ?auto_311951 ?auto_311958 ) ) ( not ( = ?auto_311951 ?auto_311959 ) ) ( not ( = ?auto_311953 ?auto_311952 ) ) ( not ( = ?auto_311953 ?auto_311954 ) ) ( not ( = ?auto_311953 ?auto_311955 ) ) ( not ( = ?auto_311953 ?auto_311956 ) ) ( not ( = ?auto_311953 ?auto_311957 ) ) ( not ( = ?auto_311953 ?auto_311958 ) ) ( not ( = ?auto_311953 ?auto_311959 ) ) ( not ( = ?auto_311952 ?auto_311954 ) ) ( not ( = ?auto_311952 ?auto_311955 ) ) ( not ( = ?auto_311952 ?auto_311956 ) ) ( not ( = ?auto_311952 ?auto_311957 ) ) ( not ( = ?auto_311952 ?auto_311958 ) ) ( not ( = ?auto_311952 ?auto_311959 ) ) ( not ( = ?auto_311954 ?auto_311955 ) ) ( not ( = ?auto_311954 ?auto_311956 ) ) ( not ( = ?auto_311954 ?auto_311957 ) ) ( not ( = ?auto_311954 ?auto_311958 ) ) ( not ( = ?auto_311954 ?auto_311959 ) ) ( not ( = ?auto_311955 ?auto_311956 ) ) ( not ( = ?auto_311955 ?auto_311957 ) ) ( not ( = ?auto_311955 ?auto_311958 ) ) ( not ( = ?auto_311955 ?auto_311959 ) ) ( not ( = ?auto_311956 ?auto_311957 ) ) ( not ( = ?auto_311956 ?auto_311958 ) ) ( not ( = ?auto_311956 ?auto_311959 ) ) ( not ( = ?auto_311957 ?auto_311958 ) ) ( not ( = ?auto_311957 ?auto_311959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_311958 ?auto_311959 )
      ( MAKE-10CRATE-VERIFY ?auto_311949 ?auto_311950 ?auto_311951 ?auto_311953 ?auto_311952 ?auto_311954 ?auto_311955 ?auto_311956 ?auto_311957 ?auto_311958 ?auto_311959 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312043 - SURFACE
      ?auto_312044 - SURFACE
      ?auto_312045 - SURFACE
      ?auto_312047 - SURFACE
      ?auto_312046 - SURFACE
      ?auto_312048 - SURFACE
      ?auto_312049 - SURFACE
      ?auto_312050 - SURFACE
      ?auto_312051 - SURFACE
      ?auto_312052 - SURFACE
      ?auto_312053 - SURFACE
    )
    :vars
    (
      ?auto_312055 - HOIST
      ?auto_312056 - PLACE
      ?auto_312054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312055 ?auto_312056 ) ( SURFACE-AT ?auto_312052 ?auto_312056 ) ( CLEAR ?auto_312052 ) ( IS-CRATE ?auto_312053 ) ( not ( = ?auto_312052 ?auto_312053 ) ) ( TRUCK-AT ?auto_312054 ?auto_312056 ) ( AVAILABLE ?auto_312055 ) ( IN ?auto_312053 ?auto_312054 ) ( ON ?auto_312052 ?auto_312051 ) ( not ( = ?auto_312051 ?auto_312052 ) ) ( not ( = ?auto_312051 ?auto_312053 ) ) ( ON ?auto_312044 ?auto_312043 ) ( ON ?auto_312045 ?auto_312044 ) ( ON ?auto_312047 ?auto_312045 ) ( ON ?auto_312046 ?auto_312047 ) ( ON ?auto_312048 ?auto_312046 ) ( ON ?auto_312049 ?auto_312048 ) ( ON ?auto_312050 ?auto_312049 ) ( ON ?auto_312051 ?auto_312050 ) ( not ( = ?auto_312043 ?auto_312044 ) ) ( not ( = ?auto_312043 ?auto_312045 ) ) ( not ( = ?auto_312043 ?auto_312047 ) ) ( not ( = ?auto_312043 ?auto_312046 ) ) ( not ( = ?auto_312043 ?auto_312048 ) ) ( not ( = ?auto_312043 ?auto_312049 ) ) ( not ( = ?auto_312043 ?auto_312050 ) ) ( not ( = ?auto_312043 ?auto_312051 ) ) ( not ( = ?auto_312043 ?auto_312052 ) ) ( not ( = ?auto_312043 ?auto_312053 ) ) ( not ( = ?auto_312044 ?auto_312045 ) ) ( not ( = ?auto_312044 ?auto_312047 ) ) ( not ( = ?auto_312044 ?auto_312046 ) ) ( not ( = ?auto_312044 ?auto_312048 ) ) ( not ( = ?auto_312044 ?auto_312049 ) ) ( not ( = ?auto_312044 ?auto_312050 ) ) ( not ( = ?auto_312044 ?auto_312051 ) ) ( not ( = ?auto_312044 ?auto_312052 ) ) ( not ( = ?auto_312044 ?auto_312053 ) ) ( not ( = ?auto_312045 ?auto_312047 ) ) ( not ( = ?auto_312045 ?auto_312046 ) ) ( not ( = ?auto_312045 ?auto_312048 ) ) ( not ( = ?auto_312045 ?auto_312049 ) ) ( not ( = ?auto_312045 ?auto_312050 ) ) ( not ( = ?auto_312045 ?auto_312051 ) ) ( not ( = ?auto_312045 ?auto_312052 ) ) ( not ( = ?auto_312045 ?auto_312053 ) ) ( not ( = ?auto_312047 ?auto_312046 ) ) ( not ( = ?auto_312047 ?auto_312048 ) ) ( not ( = ?auto_312047 ?auto_312049 ) ) ( not ( = ?auto_312047 ?auto_312050 ) ) ( not ( = ?auto_312047 ?auto_312051 ) ) ( not ( = ?auto_312047 ?auto_312052 ) ) ( not ( = ?auto_312047 ?auto_312053 ) ) ( not ( = ?auto_312046 ?auto_312048 ) ) ( not ( = ?auto_312046 ?auto_312049 ) ) ( not ( = ?auto_312046 ?auto_312050 ) ) ( not ( = ?auto_312046 ?auto_312051 ) ) ( not ( = ?auto_312046 ?auto_312052 ) ) ( not ( = ?auto_312046 ?auto_312053 ) ) ( not ( = ?auto_312048 ?auto_312049 ) ) ( not ( = ?auto_312048 ?auto_312050 ) ) ( not ( = ?auto_312048 ?auto_312051 ) ) ( not ( = ?auto_312048 ?auto_312052 ) ) ( not ( = ?auto_312048 ?auto_312053 ) ) ( not ( = ?auto_312049 ?auto_312050 ) ) ( not ( = ?auto_312049 ?auto_312051 ) ) ( not ( = ?auto_312049 ?auto_312052 ) ) ( not ( = ?auto_312049 ?auto_312053 ) ) ( not ( = ?auto_312050 ?auto_312051 ) ) ( not ( = ?auto_312050 ?auto_312052 ) ) ( not ( = ?auto_312050 ?auto_312053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312051 ?auto_312052 ?auto_312053 )
      ( MAKE-10CRATE-VERIFY ?auto_312043 ?auto_312044 ?auto_312045 ?auto_312047 ?auto_312046 ?auto_312048 ?auto_312049 ?auto_312050 ?auto_312051 ?auto_312052 ?auto_312053 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312148 - SURFACE
      ?auto_312149 - SURFACE
      ?auto_312150 - SURFACE
      ?auto_312152 - SURFACE
      ?auto_312151 - SURFACE
      ?auto_312153 - SURFACE
      ?auto_312154 - SURFACE
      ?auto_312155 - SURFACE
      ?auto_312156 - SURFACE
      ?auto_312157 - SURFACE
      ?auto_312158 - SURFACE
    )
    :vars
    (
      ?auto_312161 - HOIST
      ?auto_312159 - PLACE
      ?auto_312162 - TRUCK
      ?auto_312160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312161 ?auto_312159 ) ( SURFACE-AT ?auto_312157 ?auto_312159 ) ( CLEAR ?auto_312157 ) ( IS-CRATE ?auto_312158 ) ( not ( = ?auto_312157 ?auto_312158 ) ) ( AVAILABLE ?auto_312161 ) ( IN ?auto_312158 ?auto_312162 ) ( ON ?auto_312157 ?auto_312156 ) ( not ( = ?auto_312156 ?auto_312157 ) ) ( not ( = ?auto_312156 ?auto_312158 ) ) ( TRUCK-AT ?auto_312162 ?auto_312160 ) ( not ( = ?auto_312160 ?auto_312159 ) ) ( ON ?auto_312149 ?auto_312148 ) ( ON ?auto_312150 ?auto_312149 ) ( ON ?auto_312152 ?auto_312150 ) ( ON ?auto_312151 ?auto_312152 ) ( ON ?auto_312153 ?auto_312151 ) ( ON ?auto_312154 ?auto_312153 ) ( ON ?auto_312155 ?auto_312154 ) ( ON ?auto_312156 ?auto_312155 ) ( not ( = ?auto_312148 ?auto_312149 ) ) ( not ( = ?auto_312148 ?auto_312150 ) ) ( not ( = ?auto_312148 ?auto_312152 ) ) ( not ( = ?auto_312148 ?auto_312151 ) ) ( not ( = ?auto_312148 ?auto_312153 ) ) ( not ( = ?auto_312148 ?auto_312154 ) ) ( not ( = ?auto_312148 ?auto_312155 ) ) ( not ( = ?auto_312148 ?auto_312156 ) ) ( not ( = ?auto_312148 ?auto_312157 ) ) ( not ( = ?auto_312148 ?auto_312158 ) ) ( not ( = ?auto_312149 ?auto_312150 ) ) ( not ( = ?auto_312149 ?auto_312152 ) ) ( not ( = ?auto_312149 ?auto_312151 ) ) ( not ( = ?auto_312149 ?auto_312153 ) ) ( not ( = ?auto_312149 ?auto_312154 ) ) ( not ( = ?auto_312149 ?auto_312155 ) ) ( not ( = ?auto_312149 ?auto_312156 ) ) ( not ( = ?auto_312149 ?auto_312157 ) ) ( not ( = ?auto_312149 ?auto_312158 ) ) ( not ( = ?auto_312150 ?auto_312152 ) ) ( not ( = ?auto_312150 ?auto_312151 ) ) ( not ( = ?auto_312150 ?auto_312153 ) ) ( not ( = ?auto_312150 ?auto_312154 ) ) ( not ( = ?auto_312150 ?auto_312155 ) ) ( not ( = ?auto_312150 ?auto_312156 ) ) ( not ( = ?auto_312150 ?auto_312157 ) ) ( not ( = ?auto_312150 ?auto_312158 ) ) ( not ( = ?auto_312152 ?auto_312151 ) ) ( not ( = ?auto_312152 ?auto_312153 ) ) ( not ( = ?auto_312152 ?auto_312154 ) ) ( not ( = ?auto_312152 ?auto_312155 ) ) ( not ( = ?auto_312152 ?auto_312156 ) ) ( not ( = ?auto_312152 ?auto_312157 ) ) ( not ( = ?auto_312152 ?auto_312158 ) ) ( not ( = ?auto_312151 ?auto_312153 ) ) ( not ( = ?auto_312151 ?auto_312154 ) ) ( not ( = ?auto_312151 ?auto_312155 ) ) ( not ( = ?auto_312151 ?auto_312156 ) ) ( not ( = ?auto_312151 ?auto_312157 ) ) ( not ( = ?auto_312151 ?auto_312158 ) ) ( not ( = ?auto_312153 ?auto_312154 ) ) ( not ( = ?auto_312153 ?auto_312155 ) ) ( not ( = ?auto_312153 ?auto_312156 ) ) ( not ( = ?auto_312153 ?auto_312157 ) ) ( not ( = ?auto_312153 ?auto_312158 ) ) ( not ( = ?auto_312154 ?auto_312155 ) ) ( not ( = ?auto_312154 ?auto_312156 ) ) ( not ( = ?auto_312154 ?auto_312157 ) ) ( not ( = ?auto_312154 ?auto_312158 ) ) ( not ( = ?auto_312155 ?auto_312156 ) ) ( not ( = ?auto_312155 ?auto_312157 ) ) ( not ( = ?auto_312155 ?auto_312158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312156 ?auto_312157 ?auto_312158 )
      ( MAKE-10CRATE-VERIFY ?auto_312148 ?auto_312149 ?auto_312150 ?auto_312152 ?auto_312151 ?auto_312153 ?auto_312154 ?auto_312155 ?auto_312156 ?auto_312157 ?auto_312158 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312263 - SURFACE
      ?auto_312264 - SURFACE
      ?auto_312265 - SURFACE
      ?auto_312267 - SURFACE
      ?auto_312266 - SURFACE
      ?auto_312268 - SURFACE
      ?auto_312269 - SURFACE
      ?auto_312270 - SURFACE
      ?auto_312271 - SURFACE
      ?auto_312272 - SURFACE
      ?auto_312273 - SURFACE
    )
    :vars
    (
      ?auto_312276 - HOIST
      ?auto_312275 - PLACE
      ?auto_312278 - TRUCK
      ?auto_312277 - PLACE
      ?auto_312274 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_312276 ?auto_312275 ) ( SURFACE-AT ?auto_312272 ?auto_312275 ) ( CLEAR ?auto_312272 ) ( IS-CRATE ?auto_312273 ) ( not ( = ?auto_312272 ?auto_312273 ) ) ( AVAILABLE ?auto_312276 ) ( ON ?auto_312272 ?auto_312271 ) ( not ( = ?auto_312271 ?auto_312272 ) ) ( not ( = ?auto_312271 ?auto_312273 ) ) ( TRUCK-AT ?auto_312278 ?auto_312277 ) ( not ( = ?auto_312277 ?auto_312275 ) ) ( HOIST-AT ?auto_312274 ?auto_312277 ) ( LIFTING ?auto_312274 ?auto_312273 ) ( not ( = ?auto_312276 ?auto_312274 ) ) ( ON ?auto_312264 ?auto_312263 ) ( ON ?auto_312265 ?auto_312264 ) ( ON ?auto_312267 ?auto_312265 ) ( ON ?auto_312266 ?auto_312267 ) ( ON ?auto_312268 ?auto_312266 ) ( ON ?auto_312269 ?auto_312268 ) ( ON ?auto_312270 ?auto_312269 ) ( ON ?auto_312271 ?auto_312270 ) ( not ( = ?auto_312263 ?auto_312264 ) ) ( not ( = ?auto_312263 ?auto_312265 ) ) ( not ( = ?auto_312263 ?auto_312267 ) ) ( not ( = ?auto_312263 ?auto_312266 ) ) ( not ( = ?auto_312263 ?auto_312268 ) ) ( not ( = ?auto_312263 ?auto_312269 ) ) ( not ( = ?auto_312263 ?auto_312270 ) ) ( not ( = ?auto_312263 ?auto_312271 ) ) ( not ( = ?auto_312263 ?auto_312272 ) ) ( not ( = ?auto_312263 ?auto_312273 ) ) ( not ( = ?auto_312264 ?auto_312265 ) ) ( not ( = ?auto_312264 ?auto_312267 ) ) ( not ( = ?auto_312264 ?auto_312266 ) ) ( not ( = ?auto_312264 ?auto_312268 ) ) ( not ( = ?auto_312264 ?auto_312269 ) ) ( not ( = ?auto_312264 ?auto_312270 ) ) ( not ( = ?auto_312264 ?auto_312271 ) ) ( not ( = ?auto_312264 ?auto_312272 ) ) ( not ( = ?auto_312264 ?auto_312273 ) ) ( not ( = ?auto_312265 ?auto_312267 ) ) ( not ( = ?auto_312265 ?auto_312266 ) ) ( not ( = ?auto_312265 ?auto_312268 ) ) ( not ( = ?auto_312265 ?auto_312269 ) ) ( not ( = ?auto_312265 ?auto_312270 ) ) ( not ( = ?auto_312265 ?auto_312271 ) ) ( not ( = ?auto_312265 ?auto_312272 ) ) ( not ( = ?auto_312265 ?auto_312273 ) ) ( not ( = ?auto_312267 ?auto_312266 ) ) ( not ( = ?auto_312267 ?auto_312268 ) ) ( not ( = ?auto_312267 ?auto_312269 ) ) ( not ( = ?auto_312267 ?auto_312270 ) ) ( not ( = ?auto_312267 ?auto_312271 ) ) ( not ( = ?auto_312267 ?auto_312272 ) ) ( not ( = ?auto_312267 ?auto_312273 ) ) ( not ( = ?auto_312266 ?auto_312268 ) ) ( not ( = ?auto_312266 ?auto_312269 ) ) ( not ( = ?auto_312266 ?auto_312270 ) ) ( not ( = ?auto_312266 ?auto_312271 ) ) ( not ( = ?auto_312266 ?auto_312272 ) ) ( not ( = ?auto_312266 ?auto_312273 ) ) ( not ( = ?auto_312268 ?auto_312269 ) ) ( not ( = ?auto_312268 ?auto_312270 ) ) ( not ( = ?auto_312268 ?auto_312271 ) ) ( not ( = ?auto_312268 ?auto_312272 ) ) ( not ( = ?auto_312268 ?auto_312273 ) ) ( not ( = ?auto_312269 ?auto_312270 ) ) ( not ( = ?auto_312269 ?auto_312271 ) ) ( not ( = ?auto_312269 ?auto_312272 ) ) ( not ( = ?auto_312269 ?auto_312273 ) ) ( not ( = ?auto_312270 ?auto_312271 ) ) ( not ( = ?auto_312270 ?auto_312272 ) ) ( not ( = ?auto_312270 ?auto_312273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312271 ?auto_312272 ?auto_312273 )
      ( MAKE-10CRATE-VERIFY ?auto_312263 ?auto_312264 ?auto_312265 ?auto_312267 ?auto_312266 ?auto_312268 ?auto_312269 ?auto_312270 ?auto_312271 ?auto_312272 ?auto_312273 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312388 - SURFACE
      ?auto_312389 - SURFACE
      ?auto_312390 - SURFACE
      ?auto_312392 - SURFACE
      ?auto_312391 - SURFACE
      ?auto_312393 - SURFACE
      ?auto_312394 - SURFACE
      ?auto_312395 - SURFACE
      ?auto_312396 - SURFACE
      ?auto_312397 - SURFACE
      ?auto_312398 - SURFACE
    )
    :vars
    (
      ?auto_312402 - HOIST
      ?auto_312401 - PLACE
      ?auto_312399 - TRUCK
      ?auto_312400 - PLACE
      ?auto_312404 - HOIST
      ?auto_312403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312402 ?auto_312401 ) ( SURFACE-AT ?auto_312397 ?auto_312401 ) ( CLEAR ?auto_312397 ) ( IS-CRATE ?auto_312398 ) ( not ( = ?auto_312397 ?auto_312398 ) ) ( AVAILABLE ?auto_312402 ) ( ON ?auto_312397 ?auto_312396 ) ( not ( = ?auto_312396 ?auto_312397 ) ) ( not ( = ?auto_312396 ?auto_312398 ) ) ( TRUCK-AT ?auto_312399 ?auto_312400 ) ( not ( = ?auto_312400 ?auto_312401 ) ) ( HOIST-AT ?auto_312404 ?auto_312400 ) ( not ( = ?auto_312402 ?auto_312404 ) ) ( AVAILABLE ?auto_312404 ) ( SURFACE-AT ?auto_312398 ?auto_312400 ) ( ON ?auto_312398 ?auto_312403 ) ( CLEAR ?auto_312398 ) ( not ( = ?auto_312397 ?auto_312403 ) ) ( not ( = ?auto_312398 ?auto_312403 ) ) ( not ( = ?auto_312396 ?auto_312403 ) ) ( ON ?auto_312389 ?auto_312388 ) ( ON ?auto_312390 ?auto_312389 ) ( ON ?auto_312392 ?auto_312390 ) ( ON ?auto_312391 ?auto_312392 ) ( ON ?auto_312393 ?auto_312391 ) ( ON ?auto_312394 ?auto_312393 ) ( ON ?auto_312395 ?auto_312394 ) ( ON ?auto_312396 ?auto_312395 ) ( not ( = ?auto_312388 ?auto_312389 ) ) ( not ( = ?auto_312388 ?auto_312390 ) ) ( not ( = ?auto_312388 ?auto_312392 ) ) ( not ( = ?auto_312388 ?auto_312391 ) ) ( not ( = ?auto_312388 ?auto_312393 ) ) ( not ( = ?auto_312388 ?auto_312394 ) ) ( not ( = ?auto_312388 ?auto_312395 ) ) ( not ( = ?auto_312388 ?auto_312396 ) ) ( not ( = ?auto_312388 ?auto_312397 ) ) ( not ( = ?auto_312388 ?auto_312398 ) ) ( not ( = ?auto_312388 ?auto_312403 ) ) ( not ( = ?auto_312389 ?auto_312390 ) ) ( not ( = ?auto_312389 ?auto_312392 ) ) ( not ( = ?auto_312389 ?auto_312391 ) ) ( not ( = ?auto_312389 ?auto_312393 ) ) ( not ( = ?auto_312389 ?auto_312394 ) ) ( not ( = ?auto_312389 ?auto_312395 ) ) ( not ( = ?auto_312389 ?auto_312396 ) ) ( not ( = ?auto_312389 ?auto_312397 ) ) ( not ( = ?auto_312389 ?auto_312398 ) ) ( not ( = ?auto_312389 ?auto_312403 ) ) ( not ( = ?auto_312390 ?auto_312392 ) ) ( not ( = ?auto_312390 ?auto_312391 ) ) ( not ( = ?auto_312390 ?auto_312393 ) ) ( not ( = ?auto_312390 ?auto_312394 ) ) ( not ( = ?auto_312390 ?auto_312395 ) ) ( not ( = ?auto_312390 ?auto_312396 ) ) ( not ( = ?auto_312390 ?auto_312397 ) ) ( not ( = ?auto_312390 ?auto_312398 ) ) ( not ( = ?auto_312390 ?auto_312403 ) ) ( not ( = ?auto_312392 ?auto_312391 ) ) ( not ( = ?auto_312392 ?auto_312393 ) ) ( not ( = ?auto_312392 ?auto_312394 ) ) ( not ( = ?auto_312392 ?auto_312395 ) ) ( not ( = ?auto_312392 ?auto_312396 ) ) ( not ( = ?auto_312392 ?auto_312397 ) ) ( not ( = ?auto_312392 ?auto_312398 ) ) ( not ( = ?auto_312392 ?auto_312403 ) ) ( not ( = ?auto_312391 ?auto_312393 ) ) ( not ( = ?auto_312391 ?auto_312394 ) ) ( not ( = ?auto_312391 ?auto_312395 ) ) ( not ( = ?auto_312391 ?auto_312396 ) ) ( not ( = ?auto_312391 ?auto_312397 ) ) ( not ( = ?auto_312391 ?auto_312398 ) ) ( not ( = ?auto_312391 ?auto_312403 ) ) ( not ( = ?auto_312393 ?auto_312394 ) ) ( not ( = ?auto_312393 ?auto_312395 ) ) ( not ( = ?auto_312393 ?auto_312396 ) ) ( not ( = ?auto_312393 ?auto_312397 ) ) ( not ( = ?auto_312393 ?auto_312398 ) ) ( not ( = ?auto_312393 ?auto_312403 ) ) ( not ( = ?auto_312394 ?auto_312395 ) ) ( not ( = ?auto_312394 ?auto_312396 ) ) ( not ( = ?auto_312394 ?auto_312397 ) ) ( not ( = ?auto_312394 ?auto_312398 ) ) ( not ( = ?auto_312394 ?auto_312403 ) ) ( not ( = ?auto_312395 ?auto_312396 ) ) ( not ( = ?auto_312395 ?auto_312397 ) ) ( not ( = ?auto_312395 ?auto_312398 ) ) ( not ( = ?auto_312395 ?auto_312403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312396 ?auto_312397 ?auto_312398 )
      ( MAKE-10CRATE-VERIFY ?auto_312388 ?auto_312389 ?auto_312390 ?auto_312392 ?auto_312391 ?auto_312393 ?auto_312394 ?auto_312395 ?auto_312396 ?auto_312397 ?auto_312398 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312514 - SURFACE
      ?auto_312515 - SURFACE
      ?auto_312516 - SURFACE
      ?auto_312518 - SURFACE
      ?auto_312517 - SURFACE
      ?auto_312519 - SURFACE
      ?auto_312520 - SURFACE
      ?auto_312521 - SURFACE
      ?auto_312522 - SURFACE
      ?auto_312523 - SURFACE
      ?auto_312524 - SURFACE
    )
    :vars
    (
      ?auto_312525 - HOIST
      ?auto_312528 - PLACE
      ?auto_312529 - PLACE
      ?auto_312527 - HOIST
      ?auto_312530 - SURFACE
      ?auto_312526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312525 ?auto_312528 ) ( SURFACE-AT ?auto_312523 ?auto_312528 ) ( CLEAR ?auto_312523 ) ( IS-CRATE ?auto_312524 ) ( not ( = ?auto_312523 ?auto_312524 ) ) ( AVAILABLE ?auto_312525 ) ( ON ?auto_312523 ?auto_312522 ) ( not ( = ?auto_312522 ?auto_312523 ) ) ( not ( = ?auto_312522 ?auto_312524 ) ) ( not ( = ?auto_312529 ?auto_312528 ) ) ( HOIST-AT ?auto_312527 ?auto_312529 ) ( not ( = ?auto_312525 ?auto_312527 ) ) ( AVAILABLE ?auto_312527 ) ( SURFACE-AT ?auto_312524 ?auto_312529 ) ( ON ?auto_312524 ?auto_312530 ) ( CLEAR ?auto_312524 ) ( not ( = ?auto_312523 ?auto_312530 ) ) ( not ( = ?auto_312524 ?auto_312530 ) ) ( not ( = ?auto_312522 ?auto_312530 ) ) ( TRUCK-AT ?auto_312526 ?auto_312528 ) ( ON ?auto_312515 ?auto_312514 ) ( ON ?auto_312516 ?auto_312515 ) ( ON ?auto_312518 ?auto_312516 ) ( ON ?auto_312517 ?auto_312518 ) ( ON ?auto_312519 ?auto_312517 ) ( ON ?auto_312520 ?auto_312519 ) ( ON ?auto_312521 ?auto_312520 ) ( ON ?auto_312522 ?auto_312521 ) ( not ( = ?auto_312514 ?auto_312515 ) ) ( not ( = ?auto_312514 ?auto_312516 ) ) ( not ( = ?auto_312514 ?auto_312518 ) ) ( not ( = ?auto_312514 ?auto_312517 ) ) ( not ( = ?auto_312514 ?auto_312519 ) ) ( not ( = ?auto_312514 ?auto_312520 ) ) ( not ( = ?auto_312514 ?auto_312521 ) ) ( not ( = ?auto_312514 ?auto_312522 ) ) ( not ( = ?auto_312514 ?auto_312523 ) ) ( not ( = ?auto_312514 ?auto_312524 ) ) ( not ( = ?auto_312514 ?auto_312530 ) ) ( not ( = ?auto_312515 ?auto_312516 ) ) ( not ( = ?auto_312515 ?auto_312518 ) ) ( not ( = ?auto_312515 ?auto_312517 ) ) ( not ( = ?auto_312515 ?auto_312519 ) ) ( not ( = ?auto_312515 ?auto_312520 ) ) ( not ( = ?auto_312515 ?auto_312521 ) ) ( not ( = ?auto_312515 ?auto_312522 ) ) ( not ( = ?auto_312515 ?auto_312523 ) ) ( not ( = ?auto_312515 ?auto_312524 ) ) ( not ( = ?auto_312515 ?auto_312530 ) ) ( not ( = ?auto_312516 ?auto_312518 ) ) ( not ( = ?auto_312516 ?auto_312517 ) ) ( not ( = ?auto_312516 ?auto_312519 ) ) ( not ( = ?auto_312516 ?auto_312520 ) ) ( not ( = ?auto_312516 ?auto_312521 ) ) ( not ( = ?auto_312516 ?auto_312522 ) ) ( not ( = ?auto_312516 ?auto_312523 ) ) ( not ( = ?auto_312516 ?auto_312524 ) ) ( not ( = ?auto_312516 ?auto_312530 ) ) ( not ( = ?auto_312518 ?auto_312517 ) ) ( not ( = ?auto_312518 ?auto_312519 ) ) ( not ( = ?auto_312518 ?auto_312520 ) ) ( not ( = ?auto_312518 ?auto_312521 ) ) ( not ( = ?auto_312518 ?auto_312522 ) ) ( not ( = ?auto_312518 ?auto_312523 ) ) ( not ( = ?auto_312518 ?auto_312524 ) ) ( not ( = ?auto_312518 ?auto_312530 ) ) ( not ( = ?auto_312517 ?auto_312519 ) ) ( not ( = ?auto_312517 ?auto_312520 ) ) ( not ( = ?auto_312517 ?auto_312521 ) ) ( not ( = ?auto_312517 ?auto_312522 ) ) ( not ( = ?auto_312517 ?auto_312523 ) ) ( not ( = ?auto_312517 ?auto_312524 ) ) ( not ( = ?auto_312517 ?auto_312530 ) ) ( not ( = ?auto_312519 ?auto_312520 ) ) ( not ( = ?auto_312519 ?auto_312521 ) ) ( not ( = ?auto_312519 ?auto_312522 ) ) ( not ( = ?auto_312519 ?auto_312523 ) ) ( not ( = ?auto_312519 ?auto_312524 ) ) ( not ( = ?auto_312519 ?auto_312530 ) ) ( not ( = ?auto_312520 ?auto_312521 ) ) ( not ( = ?auto_312520 ?auto_312522 ) ) ( not ( = ?auto_312520 ?auto_312523 ) ) ( not ( = ?auto_312520 ?auto_312524 ) ) ( not ( = ?auto_312520 ?auto_312530 ) ) ( not ( = ?auto_312521 ?auto_312522 ) ) ( not ( = ?auto_312521 ?auto_312523 ) ) ( not ( = ?auto_312521 ?auto_312524 ) ) ( not ( = ?auto_312521 ?auto_312530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312522 ?auto_312523 ?auto_312524 )
      ( MAKE-10CRATE-VERIFY ?auto_312514 ?auto_312515 ?auto_312516 ?auto_312518 ?auto_312517 ?auto_312519 ?auto_312520 ?auto_312521 ?auto_312522 ?auto_312523 ?auto_312524 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312640 - SURFACE
      ?auto_312641 - SURFACE
      ?auto_312642 - SURFACE
      ?auto_312644 - SURFACE
      ?auto_312643 - SURFACE
      ?auto_312645 - SURFACE
      ?auto_312646 - SURFACE
      ?auto_312647 - SURFACE
      ?auto_312648 - SURFACE
      ?auto_312649 - SURFACE
      ?auto_312650 - SURFACE
    )
    :vars
    (
      ?auto_312653 - HOIST
      ?auto_312656 - PLACE
      ?auto_312655 - PLACE
      ?auto_312651 - HOIST
      ?auto_312652 - SURFACE
      ?auto_312654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312653 ?auto_312656 ) ( IS-CRATE ?auto_312650 ) ( not ( = ?auto_312649 ?auto_312650 ) ) ( not ( = ?auto_312648 ?auto_312649 ) ) ( not ( = ?auto_312648 ?auto_312650 ) ) ( not ( = ?auto_312655 ?auto_312656 ) ) ( HOIST-AT ?auto_312651 ?auto_312655 ) ( not ( = ?auto_312653 ?auto_312651 ) ) ( AVAILABLE ?auto_312651 ) ( SURFACE-AT ?auto_312650 ?auto_312655 ) ( ON ?auto_312650 ?auto_312652 ) ( CLEAR ?auto_312650 ) ( not ( = ?auto_312649 ?auto_312652 ) ) ( not ( = ?auto_312650 ?auto_312652 ) ) ( not ( = ?auto_312648 ?auto_312652 ) ) ( TRUCK-AT ?auto_312654 ?auto_312656 ) ( SURFACE-AT ?auto_312648 ?auto_312656 ) ( CLEAR ?auto_312648 ) ( LIFTING ?auto_312653 ?auto_312649 ) ( IS-CRATE ?auto_312649 ) ( ON ?auto_312641 ?auto_312640 ) ( ON ?auto_312642 ?auto_312641 ) ( ON ?auto_312644 ?auto_312642 ) ( ON ?auto_312643 ?auto_312644 ) ( ON ?auto_312645 ?auto_312643 ) ( ON ?auto_312646 ?auto_312645 ) ( ON ?auto_312647 ?auto_312646 ) ( ON ?auto_312648 ?auto_312647 ) ( not ( = ?auto_312640 ?auto_312641 ) ) ( not ( = ?auto_312640 ?auto_312642 ) ) ( not ( = ?auto_312640 ?auto_312644 ) ) ( not ( = ?auto_312640 ?auto_312643 ) ) ( not ( = ?auto_312640 ?auto_312645 ) ) ( not ( = ?auto_312640 ?auto_312646 ) ) ( not ( = ?auto_312640 ?auto_312647 ) ) ( not ( = ?auto_312640 ?auto_312648 ) ) ( not ( = ?auto_312640 ?auto_312649 ) ) ( not ( = ?auto_312640 ?auto_312650 ) ) ( not ( = ?auto_312640 ?auto_312652 ) ) ( not ( = ?auto_312641 ?auto_312642 ) ) ( not ( = ?auto_312641 ?auto_312644 ) ) ( not ( = ?auto_312641 ?auto_312643 ) ) ( not ( = ?auto_312641 ?auto_312645 ) ) ( not ( = ?auto_312641 ?auto_312646 ) ) ( not ( = ?auto_312641 ?auto_312647 ) ) ( not ( = ?auto_312641 ?auto_312648 ) ) ( not ( = ?auto_312641 ?auto_312649 ) ) ( not ( = ?auto_312641 ?auto_312650 ) ) ( not ( = ?auto_312641 ?auto_312652 ) ) ( not ( = ?auto_312642 ?auto_312644 ) ) ( not ( = ?auto_312642 ?auto_312643 ) ) ( not ( = ?auto_312642 ?auto_312645 ) ) ( not ( = ?auto_312642 ?auto_312646 ) ) ( not ( = ?auto_312642 ?auto_312647 ) ) ( not ( = ?auto_312642 ?auto_312648 ) ) ( not ( = ?auto_312642 ?auto_312649 ) ) ( not ( = ?auto_312642 ?auto_312650 ) ) ( not ( = ?auto_312642 ?auto_312652 ) ) ( not ( = ?auto_312644 ?auto_312643 ) ) ( not ( = ?auto_312644 ?auto_312645 ) ) ( not ( = ?auto_312644 ?auto_312646 ) ) ( not ( = ?auto_312644 ?auto_312647 ) ) ( not ( = ?auto_312644 ?auto_312648 ) ) ( not ( = ?auto_312644 ?auto_312649 ) ) ( not ( = ?auto_312644 ?auto_312650 ) ) ( not ( = ?auto_312644 ?auto_312652 ) ) ( not ( = ?auto_312643 ?auto_312645 ) ) ( not ( = ?auto_312643 ?auto_312646 ) ) ( not ( = ?auto_312643 ?auto_312647 ) ) ( not ( = ?auto_312643 ?auto_312648 ) ) ( not ( = ?auto_312643 ?auto_312649 ) ) ( not ( = ?auto_312643 ?auto_312650 ) ) ( not ( = ?auto_312643 ?auto_312652 ) ) ( not ( = ?auto_312645 ?auto_312646 ) ) ( not ( = ?auto_312645 ?auto_312647 ) ) ( not ( = ?auto_312645 ?auto_312648 ) ) ( not ( = ?auto_312645 ?auto_312649 ) ) ( not ( = ?auto_312645 ?auto_312650 ) ) ( not ( = ?auto_312645 ?auto_312652 ) ) ( not ( = ?auto_312646 ?auto_312647 ) ) ( not ( = ?auto_312646 ?auto_312648 ) ) ( not ( = ?auto_312646 ?auto_312649 ) ) ( not ( = ?auto_312646 ?auto_312650 ) ) ( not ( = ?auto_312646 ?auto_312652 ) ) ( not ( = ?auto_312647 ?auto_312648 ) ) ( not ( = ?auto_312647 ?auto_312649 ) ) ( not ( = ?auto_312647 ?auto_312650 ) ) ( not ( = ?auto_312647 ?auto_312652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312648 ?auto_312649 ?auto_312650 )
      ( MAKE-10CRATE-VERIFY ?auto_312640 ?auto_312641 ?auto_312642 ?auto_312644 ?auto_312643 ?auto_312645 ?auto_312646 ?auto_312647 ?auto_312648 ?auto_312649 ?auto_312650 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312766 - SURFACE
      ?auto_312767 - SURFACE
      ?auto_312768 - SURFACE
      ?auto_312770 - SURFACE
      ?auto_312769 - SURFACE
      ?auto_312771 - SURFACE
      ?auto_312772 - SURFACE
      ?auto_312773 - SURFACE
      ?auto_312774 - SURFACE
      ?auto_312775 - SURFACE
      ?auto_312776 - SURFACE
    )
    :vars
    (
      ?auto_312782 - HOIST
      ?auto_312781 - PLACE
      ?auto_312780 - PLACE
      ?auto_312777 - HOIST
      ?auto_312779 - SURFACE
      ?auto_312778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312782 ?auto_312781 ) ( IS-CRATE ?auto_312776 ) ( not ( = ?auto_312775 ?auto_312776 ) ) ( not ( = ?auto_312774 ?auto_312775 ) ) ( not ( = ?auto_312774 ?auto_312776 ) ) ( not ( = ?auto_312780 ?auto_312781 ) ) ( HOIST-AT ?auto_312777 ?auto_312780 ) ( not ( = ?auto_312782 ?auto_312777 ) ) ( AVAILABLE ?auto_312777 ) ( SURFACE-AT ?auto_312776 ?auto_312780 ) ( ON ?auto_312776 ?auto_312779 ) ( CLEAR ?auto_312776 ) ( not ( = ?auto_312775 ?auto_312779 ) ) ( not ( = ?auto_312776 ?auto_312779 ) ) ( not ( = ?auto_312774 ?auto_312779 ) ) ( TRUCK-AT ?auto_312778 ?auto_312781 ) ( SURFACE-AT ?auto_312774 ?auto_312781 ) ( CLEAR ?auto_312774 ) ( IS-CRATE ?auto_312775 ) ( AVAILABLE ?auto_312782 ) ( IN ?auto_312775 ?auto_312778 ) ( ON ?auto_312767 ?auto_312766 ) ( ON ?auto_312768 ?auto_312767 ) ( ON ?auto_312770 ?auto_312768 ) ( ON ?auto_312769 ?auto_312770 ) ( ON ?auto_312771 ?auto_312769 ) ( ON ?auto_312772 ?auto_312771 ) ( ON ?auto_312773 ?auto_312772 ) ( ON ?auto_312774 ?auto_312773 ) ( not ( = ?auto_312766 ?auto_312767 ) ) ( not ( = ?auto_312766 ?auto_312768 ) ) ( not ( = ?auto_312766 ?auto_312770 ) ) ( not ( = ?auto_312766 ?auto_312769 ) ) ( not ( = ?auto_312766 ?auto_312771 ) ) ( not ( = ?auto_312766 ?auto_312772 ) ) ( not ( = ?auto_312766 ?auto_312773 ) ) ( not ( = ?auto_312766 ?auto_312774 ) ) ( not ( = ?auto_312766 ?auto_312775 ) ) ( not ( = ?auto_312766 ?auto_312776 ) ) ( not ( = ?auto_312766 ?auto_312779 ) ) ( not ( = ?auto_312767 ?auto_312768 ) ) ( not ( = ?auto_312767 ?auto_312770 ) ) ( not ( = ?auto_312767 ?auto_312769 ) ) ( not ( = ?auto_312767 ?auto_312771 ) ) ( not ( = ?auto_312767 ?auto_312772 ) ) ( not ( = ?auto_312767 ?auto_312773 ) ) ( not ( = ?auto_312767 ?auto_312774 ) ) ( not ( = ?auto_312767 ?auto_312775 ) ) ( not ( = ?auto_312767 ?auto_312776 ) ) ( not ( = ?auto_312767 ?auto_312779 ) ) ( not ( = ?auto_312768 ?auto_312770 ) ) ( not ( = ?auto_312768 ?auto_312769 ) ) ( not ( = ?auto_312768 ?auto_312771 ) ) ( not ( = ?auto_312768 ?auto_312772 ) ) ( not ( = ?auto_312768 ?auto_312773 ) ) ( not ( = ?auto_312768 ?auto_312774 ) ) ( not ( = ?auto_312768 ?auto_312775 ) ) ( not ( = ?auto_312768 ?auto_312776 ) ) ( not ( = ?auto_312768 ?auto_312779 ) ) ( not ( = ?auto_312770 ?auto_312769 ) ) ( not ( = ?auto_312770 ?auto_312771 ) ) ( not ( = ?auto_312770 ?auto_312772 ) ) ( not ( = ?auto_312770 ?auto_312773 ) ) ( not ( = ?auto_312770 ?auto_312774 ) ) ( not ( = ?auto_312770 ?auto_312775 ) ) ( not ( = ?auto_312770 ?auto_312776 ) ) ( not ( = ?auto_312770 ?auto_312779 ) ) ( not ( = ?auto_312769 ?auto_312771 ) ) ( not ( = ?auto_312769 ?auto_312772 ) ) ( not ( = ?auto_312769 ?auto_312773 ) ) ( not ( = ?auto_312769 ?auto_312774 ) ) ( not ( = ?auto_312769 ?auto_312775 ) ) ( not ( = ?auto_312769 ?auto_312776 ) ) ( not ( = ?auto_312769 ?auto_312779 ) ) ( not ( = ?auto_312771 ?auto_312772 ) ) ( not ( = ?auto_312771 ?auto_312773 ) ) ( not ( = ?auto_312771 ?auto_312774 ) ) ( not ( = ?auto_312771 ?auto_312775 ) ) ( not ( = ?auto_312771 ?auto_312776 ) ) ( not ( = ?auto_312771 ?auto_312779 ) ) ( not ( = ?auto_312772 ?auto_312773 ) ) ( not ( = ?auto_312772 ?auto_312774 ) ) ( not ( = ?auto_312772 ?auto_312775 ) ) ( not ( = ?auto_312772 ?auto_312776 ) ) ( not ( = ?auto_312772 ?auto_312779 ) ) ( not ( = ?auto_312773 ?auto_312774 ) ) ( not ( = ?auto_312773 ?auto_312775 ) ) ( not ( = ?auto_312773 ?auto_312776 ) ) ( not ( = ?auto_312773 ?auto_312779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312774 ?auto_312775 ?auto_312776 )
      ( MAKE-10CRATE-VERIFY ?auto_312766 ?auto_312767 ?auto_312768 ?auto_312770 ?auto_312769 ?auto_312771 ?auto_312772 ?auto_312773 ?auto_312774 ?auto_312775 ?auto_312776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_312783 - SURFACE
      ?auto_312784 - SURFACE
    )
    :vars
    (
      ?auto_312790 - HOIST
      ?auto_312789 - PLACE
      ?auto_312791 - SURFACE
      ?auto_312788 - PLACE
      ?auto_312785 - HOIST
      ?auto_312787 - SURFACE
      ?auto_312786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312790 ?auto_312789 ) ( IS-CRATE ?auto_312784 ) ( not ( = ?auto_312783 ?auto_312784 ) ) ( not ( = ?auto_312791 ?auto_312783 ) ) ( not ( = ?auto_312791 ?auto_312784 ) ) ( not ( = ?auto_312788 ?auto_312789 ) ) ( HOIST-AT ?auto_312785 ?auto_312788 ) ( not ( = ?auto_312790 ?auto_312785 ) ) ( AVAILABLE ?auto_312785 ) ( SURFACE-AT ?auto_312784 ?auto_312788 ) ( ON ?auto_312784 ?auto_312787 ) ( CLEAR ?auto_312784 ) ( not ( = ?auto_312783 ?auto_312787 ) ) ( not ( = ?auto_312784 ?auto_312787 ) ) ( not ( = ?auto_312791 ?auto_312787 ) ) ( SURFACE-AT ?auto_312791 ?auto_312789 ) ( CLEAR ?auto_312791 ) ( IS-CRATE ?auto_312783 ) ( AVAILABLE ?auto_312790 ) ( IN ?auto_312783 ?auto_312786 ) ( TRUCK-AT ?auto_312786 ?auto_312788 ) )
    :subtasks
    ( ( !DRIVE ?auto_312786 ?auto_312788 ?auto_312789 )
      ( MAKE-2CRATE ?auto_312791 ?auto_312783 ?auto_312784 )
      ( MAKE-1CRATE-VERIFY ?auto_312783 ?auto_312784 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_312792 - SURFACE
      ?auto_312793 - SURFACE
      ?auto_312794 - SURFACE
    )
    :vars
    (
      ?auto_312799 - HOIST
      ?auto_312800 - PLACE
      ?auto_312796 - PLACE
      ?auto_312795 - HOIST
      ?auto_312798 - SURFACE
      ?auto_312797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312799 ?auto_312800 ) ( IS-CRATE ?auto_312794 ) ( not ( = ?auto_312793 ?auto_312794 ) ) ( not ( = ?auto_312792 ?auto_312793 ) ) ( not ( = ?auto_312792 ?auto_312794 ) ) ( not ( = ?auto_312796 ?auto_312800 ) ) ( HOIST-AT ?auto_312795 ?auto_312796 ) ( not ( = ?auto_312799 ?auto_312795 ) ) ( AVAILABLE ?auto_312795 ) ( SURFACE-AT ?auto_312794 ?auto_312796 ) ( ON ?auto_312794 ?auto_312798 ) ( CLEAR ?auto_312794 ) ( not ( = ?auto_312793 ?auto_312798 ) ) ( not ( = ?auto_312794 ?auto_312798 ) ) ( not ( = ?auto_312792 ?auto_312798 ) ) ( SURFACE-AT ?auto_312792 ?auto_312800 ) ( CLEAR ?auto_312792 ) ( IS-CRATE ?auto_312793 ) ( AVAILABLE ?auto_312799 ) ( IN ?auto_312793 ?auto_312797 ) ( TRUCK-AT ?auto_312797 ?auto_312796 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_312793 ?auto_312794 )
      ( MAKE-2CRATE-VERIFY ?auto_312792 ?auto_312793 ?auto_312794 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_312801 - SURFACE
      ?auto_312802 - SURFACE
      ?auto_312803 - SURFACE
      ?auto_312804 - SURFACE
    )
    :vars
    (
      ?auto_312809 - HOIST
      ?auto_312805 - PLACE
      ?auto_312808 - PLACE
      ?auto_312806 - HOIST
      ?auto_312807 - SURFACE
      ?auto_312810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312809 ?auto_312805 ) ( IS-CRATE ?auto_312804 ) ( not ( = ?auto_312803 ?auto_312804 ) ) ( not ( = ?auto_312802 ?auto_312803 ) ) ( not ( = ?auto_312802 ?auto_312804 ) ) ( not ( = ?auto_312808 ?auto_312805 ) ) ( HOIST-AT ?auto_312806 ?auto_312808 ) ( not ( = ?auto_312809 ?auto_312806 ) ) ( AVAILABLE ?auto_312806 ) ( SURFACE-AT ?auto_312804 ?auto_312808 ) ( ON ?auto_312804 ?auto_312807 ) ( CLEAR ?auto_312804 ) ( not ( = ?auto_312803 ?auto_312807 ) ) ( not ( = ?auto_312804 ?auto_312807 ) ) ( not ( = ?auto_312802 ?auto_312807 ) ) ( SURFACE-AT ?auto_312802 ?auto_312805 ) ( CLEAR ?auto_312802 ) ( IS-CRATE ?auto_312803 ) ( AVAILABLE ?auto_312809 ) ( IN ?auto_312803 ?auto_312810 ) ( TRUCK-AT ?auto_312810 ?auto_312808 ) ( ON ?auto_312802 ?auto_312801 ) ( not ( = ?auto_312801 ?auto_312802 ) ) ( not ( = ?auto_312801 ?auto_312803 ) ) ( not ( = ?auto_312801 ?auto_312804 ) ) ( not ( = ?auto_312801 ?auto_312807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312802 ?auto_312803 ?auto_312804 )
      ( MAKE-3CRATE-VERIFY ?auto_312801 ?auto_312802 ?auto_312803 ?auto_312804 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_312811 - SURFACE
      ?auto_312812 - SURFACE
      ?auto_312813 - SURFACE
      ?auto_312815 - SURFACE
      ?auto_312814 - SURFACE
    )
    :vars
    (
      ?auto_312820 - HOIST
      ?auto_312816 - PLACE
      ?auto_312819 - PLACE
      ?auto_312817 - HOIST
      ?auto_312818 - SURFACE
      ?auto_312821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312820 ?auto_312816 ) ( IS-CRATE ?auto_312814 ) ( not ( = ?auto_312815 ?auto_312814 ) ) ( not ( = ?auto_312813 ?auto_312815 ) ) ( not ( = ?auto_312813 ?auto_312814 ) ) ( not ( = ?auto_312819 ?auto_312816 ) ) ( HOIST-AT ?auto_312817 ?auto_312819 ) ( not ( = ?auto_312820 ?auto_312817 ) ) ( AVAILABLE ?auto_312817 ) ( SURFACE-AT ?auto_312814 ?auto_312819 ) ( ON ?auto_312814 ?auto_312818 ) ( CLEAR ?auto_312814 ) ( not ( = ?auto_312815 ?auto_312818 ) ) ( not ( = ?auto_312814 ?auto_312818 ) ) ( not ( = ?auto_312813 ?auto_312818 ) ) ( SURFACE-AT ?auto_312813 ?auto_312816 ) ( CLEAR ?auto_312813 ) ( IS-CRATE ?auto_312815 ) ( AVAILABLE ?auto_312820 ) ( IN ?auto_312815 ?auto_312821 ) ( TRUCK-AT ?auto_312821 ?auto_312819 ) ( ON ?auto_312812 ?auto_312811 ) ( ON ?auto_312813 ?auto_312812 ) ( not ( = ?auto_312811 ?auto_312812 ) ) ( not ( = ?auto_312811 ?auto_312813 ) ) ( not ( = ?auto_312811 ?auto_312815 ) ) ( not ( = ?auto_312811 ?auto_312814 ) ) ( not ( = ?auto_312811 ?auto_312818 ) ) ( not ( = ?auto_312812 ?auto_312813 ) ) ( not ( = ?auto_312812 ?auto_312815 ) ) ( not ( = ?auto_312812 ?auto_312814 ) ) ( not ( = ?auto_312812 ?auto_312818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312813 ?auto_312815 ?auto_312814 )
      ( MAKE-4CRATE-VERIFY ?auto_312811 ?auto_312812 ?auto_312813 ?auto_312815 ?auto_312814 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_312822 - SURFACE
      ?auto_312823 - SURFACE
      ?auto_312824 - SURFACE
      ?auto_312826 - SURFACE
      ?auto_312825 - SURFACE
      ?auto_312827 - SURFACE
    )
    :vars
    (
      ?auto_312832 - HOIST
      ?auto_312828 - PLACE
      ?auto_312831 - PLACE
      ?auto_312829 - HOIST
      ?auto_312830 - SURFACE
      ?auto_312833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312832 ?auto_312828 ) ( IS-CRATE ?auto_312827 ) ( not ( = ?auto_312825 ?auto_312827 ) ) ( not ( = ?auto_312826 ?auto_312825 ) ) ( not ( = ?auto_312826 ?auto_312827 ) ) ( not ( = ?auto_312831 ?auto_312828 ) ) ( HOIST-AT ?auto_312829 ?auto_312831 ) ( not ( = ?auto_312832 ?auto_312829 ) ) ( AVAILABLE ?auto_312829 ) ( SURFACE-AT ?auto_312827 ?auto_312831 ) ( ON ?auto_312827 ?auto_312830 ) ( CLEAR ?auto_312827 ) ( not ( = ?auto_312825 ?auto_312830 ) ) ( not ( = ?auto_312827 ?auto_312830 ) ) ( not ( = ?auto_312826 ?auto_312830 ) ) ( SURFACE-AT ?auto_312826 ?auto_312828 ) ( CLEAR ?auto_312826 ) ( IS-CRATE ?auto_312825 ) ( AVAILABLE ?auto_312832 ) ( IN ?auto_312825 ?auto_312833 ) ( TRUCK-AT ?auto_312833 ?auto_312831 ) ( ON ?auto_312823 ?auto_312822 ) ( ON ?auto_312824 ?auto_312823 ) ( ON ?auto_312826 ?auto_312824 ) ( not ( = ?auto_312822 ?auto_312823 ) ) ( not ( = ?auto_312822 ?auto_312824 ) ) ( not ( = ?auto_312822 ?auto_312826 ) ) ( not ( = ?auto_312822 ?auto_312825 ) ) ( not ( = ?auto_312822 ?auto_312827 ) ) ( not ( = ?auto_312822 ?auto_312830 ) ) ( not ( = ?auto_312823 ?auto_312824 ) ) ( not ( = ?auto_312823 ?auto_312826 ) ) ( not ( = ?auto_312823 ?auto_312825 ) ) ( not ( = ?auto_312823 ?auto_312827 ) ) ( not ( = ?auto_312823 ?auto_312830 ) ) ( not ( = ?auto_312824 ?auto_312826 ) ) ( not ( = ?auto_312824 ?auto_312825 ) ) ( not ( = ?auto_312824 ?auto_312827 ) ) ( not ( = ?auto_312824 ?auto_312830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312826 ?auto_312825 ?auto_312827 )
      ( MAKE-5CRATE-VERIFY ?auto_312822 ?auto_312823 ?auto_312824 ?auto_312826 ?auto_312825 ?auto_312827 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_312834 - SURFACE
      ?auto_312835 - SURFACE
      ?auto_312836 - SURFACE
      ?auto_312838 - SURFACE
      ?auto_312837 - SURFACE
      ?auto_312839 - SURFACE
      ?auto_312840 - SURFACE
    )
    :vars
    (
      ?auto_312845 - HOIST
      ?auto_312841 - PLACE
      ?auto_312844 - PLACE
      ?auto_312842 - HOIST
      ?auto_312843 - SURFACE
      ?auto_312846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312845 ?auto_312841 ) ( IS-CRATE ?auto_312840 ) ( not ( = ?auto_312839 ?auto_312840 ) ) ( not ( = ?auto_312837 ?auto_312839 ) ) ( not ( = ?auto_312837 ?auto_312840 ) ) ( not ( = ?auto_312844 ?auto_312841 ) ) ( HOIST-AT ?auto_312842 ?auto_312844 ) ( not ( = ?auto_312845 ?auto_312842 ) ) ( AVAILABLE ?auto_312842 ) ( SURFACE-AT ?auto_312840 ?auto_312844 ) ( ON ?auto_312840 ?auto_312843 ) ( CLEAR ?auto_312840 ) ( not ( = ?auto_312839 ?auto_312843 ) ) ( not ( = ?auto_312840 ?auto_312843 ) ) ( not ( = ?auto_312837 ?auto_312843 ) ) ( SURFACE-AT ?auto_312837 ?auto_312841 ) ( CLEAR ?auto_312837 ) ( IS-CRATE ?auto_312839 ) ( AVAILABLE ?auto_312845 ) ( IN ?auto_312839 ?auto_312846 ) ( TRUCK-AT ?auto_312846 ?auto_312844 ) ( ON ?auto_312835 ?auto_312834 ) ( ON ?auto_312836 ?auto_312835 ) ( ON ?auto_312838 ?auto_312836 ) ( ON ?auto_312837 ?auto_312838 ) ( not ( = ?auto_312834 ?auto_312835 ) ) ( not ( = ?auto_312834 ?auto_312836 ) ) ( not ( = ?auto_312834 ?auto_312838 ) ) ( not ( = ?auto_312834 ?auto_312837 ) ) ( not ( = ?auto_312834 ?auto_312839 ) ) ( not ( = ?auto_312834 ?auto_312840 ) ) ( not ( = ?auto_312834 ?auto_312843 ) ) ( not ( = ?auto_312835 ?auto_312836 ) ) ( not ( = ?auto_312835 ?auto_312838 ) ) ( not ( = ?auto_312835 ?auto_312837 ) ) ( not ( = ?auto_312835 ?auto_312839 ) ) ( not ( = ?auto_312835 ?auto_312840 ) ) ( not ( = ?auto_312835 ?auto_312843 ) ) ( not ( = ?auto_312836 ?auto_312838 ) ) ( not ( = ?auto_312836 ?auto_312837 ) ) ( not ( = ?auto_312836 ?auto_312839 ) ) ( not ( = ?auto_312836 ?auto_312840 ) ) ( not ( = ?auto_312836 ?auto_312843 ) ) ( not ( = ?auto_312838 ?auto_312837 ) ) ( not ( = ?auto_312838 ?auto_312839 ) ) ( not ( = ?auto_312838 ?auto_312840 ) ) ( not ( = ?auto_312838 ?auto_312843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312837 ?auto_312839 ?auto_312840 )
      ( MAKE-6CRATE-VERIFY ?auto_312834 ?auto_312835 ?auto_312836 ?auto_312838 ?auto_312837 ?auto_312839 ?auto_312840 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_312847 - SURFACE
      ?auto_312848 - SURFACE
      ?auto_312849 - SURFACE
      ?auto_312851 - SURFACE
      ?auto_312850 - SURFACE
      ?auto_312852 - SURFACE
      ?auto_312853 - SURFACE
      ?auto_312854 - SURFACE
    )
    :vars
    (
      ?auto_312859 - HOIST
      ?auto_312855 - PLACE
      ?auto_312858 - PLACE
      ?auto_312856 - HOIST
      ?auto_312857 - SURFACE
      ?auto_312860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312859 ?auto_312855 ) ( IS-CRATE ?auto_312854 ) ( not ( = ?auto_312853 ?auto_312854 ) ) ( not ( = ?auto_312852 ?auto_312853 ) ) ( not ( = ?auto_312852 ?auto_312854 ) ) ( not ( = ?auto_312858 ?auto_312855 ) ) ( HOIST-AT ?auto_312856 ?auto_312858 ) ( not ( = ?auto_312859 ?auto_312856 ) ) ( AVAILABLE ?auto_312856 ) ( SURFACE-AT ?auto_312854 ?auto_312858 ) ( ON ?auto_312854 ?auto_312857 ) ( CLEAR ?auto_312854 ) ( not ( = ?auto_312853 ?auto_312857 ) ) ( not ( = ?auto_312854 ?auto_312857 ) ) ( not ( = ?auto_312852 ?auto_312857 ) ) ( SURFACE-AT ?auto_312852 ?auto_312855 ) ( CLEAR ?auto_312852 ) ( IS-CRATE ?auto_312853 ) ( AVAILABLE ?auto_312859 ) ( IN ?auto_312853 ?auto_312860 ) ( TRUCK-AT ?auto_312860 ?auto_312858 ) ( ON ?auto_312848 ?auto_312847 ) ( ON ?auto_312849 ?auto_312848 ) ( ON ?auto_312851 ?auto_312849 ) ( ON ?auto_312850 ?auto_312851 ) ( ON ?auto_312852 ?auto_312850 ) ( not ( = ?auto_312847 ?auto_312848 ) ) ( not ( = ?auto_312847 ?auto_312849 ) ) ( not ( = ?auto_312847 ?auto_312851 ) ) ( not ( = ?auto_312847 ?auto_312850 ) ) ( not ( = ?auto_312847 ?auto_312852 ) ) ( not ( = ?auto_312847 ?auto_312853 ) ) ( not ( = ?auto_312847 ?auto_312854 ) ) ( not ( = ?auto_312847 ?auto_312857 ) ) ( not ( = ?auto_312848 ?auto_312849 ) ) ( not ( = ?auto_312848 ?auto_312851 ) ) ( not ( = ?auto_312848 ?auto_312850 ) ) ( not ( = ?auto_312848 ?auto_312852 ) ) ( not ( = ?auto_312848 ?auto_312853 ) ) ( not ( = ?auto_312848 ?auto_312854 ) ) ( not ( = ?auto_312848 ?auto_312857 ) ) ( not ( = ?auto_312849 ?auto_312851 ) ) ( not ( = ?auto_312849 ?auto_312850 ) ) ( not ( = ?auto_312849 ?auto_312852 ) ) ( not ( = ?auto_312849 ?auto_312853 ) ) ( not ( = ?auto_312849 ?auto_312854 ) ) ( not ( = ?auto_312849 ?auto_312857 ) ) ( not ( = ?auto_312851 ?auto_312850 ) ) ( not ( = ?auto_312851 ?auto_312852 ) ) ( not ( = ?auto_312851 ?auto_312853 ) ) ( not ( = ?auto_312851 ?auto_312854 ) ) ( not ( = ?auto_312851 ?auto_312857 ) ) ( not ( = ?auto_312850 ?auto_312852 ) ) ( not ( = ?auto_312850 ?auto_312853 ) ) ( not ( = ?auto_312850 ?auto_312854 ) ) ( not ( = ?auto_312850 ?auto_312857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312852 ?auto_312853 ?auto_312854 )
      ( MAKE-7CRATE-VERIFY ?auto_312847 ?auto_312848 ?auto_312849 ?auto_312851 ?auto_312850 ?auto_312852 ?auto_312853 ?auto_312854 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_312861 - SURFACE
      ?auto_312862 - SURFACE
      ?auto_312863 - SURFACE
      ?auto_312865 - SURFACE
      ?auto_312864 - SURFACE
      ?auto_312866 - SURFACE
      ?auto_312867 - SURFACE
      ?auto_312868 - SURFACE
      ?auto_312869 - SURFACE
    )
    :vars
    (
      ?auto_312874 - HOIST
      ?auto_312870 - PLACE
      ?auto_312873 - PLACE
      ?auto_312871 - HOIST
      ?auto_312872 - SURFACE
      ?auto_312875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312874 ?auto_312870 ) ( IS-CRATE ?auto_312869 ) ( not ( = ?auto_312868 ?auto_312869 ) ) ( not ( = ?auto_312867 ?auto_312868 ) ) ( not ( = ?auto_312867 ?auto_312869 ) ) ( not ( = ?auto_312873 ?auto_312870 ) ) ( HOIST-AT ?auto_312871 ?auto_312873 ) ( not ( = ?auto_312874 ?auto_312871 ) ) ( AVAILABLE ?auto_312871 ) ( SURFACE-AT ?auto_312869 ?auto_312873 ) ( ON ?auto_312869 ?auto_312872 ) ( CLEAR ?auto_312869 ) ( not ( = ?auto_312868 ?auto_312872 ) ) ( not ( = ?auto_312869 ?auto_312872 ) ) ( not ( = ?auto_312867 ?auto_312872 ) ) ( SURFACE-AT ?auto_312867 ?auto_312870 ) ( CLEAR ?auto_312867 ) ( IS-CRATE ?auto_312868 ) ( AVAILABLE ?auto_312874 ) ( IN ?auto_312868 ?auto_312875 ) ( TRUCK-AT ?auto_312875 ?auto_312873 ) ( ON ?auto_312862 ?auto_312861 ) ( ON ?auto_312863 ?auto_312862 ) ( ON ?auto_312865 ?auto_312863 ) ( ON ?auto_312864 ?auto_312865 ) ( ON ?auto_312866 ?auto_312864 ) ( ON ?auto_312867 ?auto_312866 ) ( not ( = ?auto_312861 ?auto_312862 ) ) ( not ( = ?auto_312861 ?auto_312863 ) ) ( not ( = ?auto_312861 ?auto_312865 ) ) ( not ( = ?auto_312861 ?auto_312864 ) ) ( not ( = ?auto_312861 ?auto_312866 ) ) ( not ( = ?auto_312861 ?auto_312867 ) ) ( not ( = ?auto_312861 ?auto_312868 ) ) ( not ( = ?auto_312861 ?auto_312869 ) ) ( not ( = ?auto_312861 ?auto_312872 ) ) ( not ( = ?auto_312862 ?auto_312863 ) ) ( not ( = ?auto_312862 ?auto_312865 ) ) ( not ( = ?auto_312862 ?auto_312864 ) ) ( not ( = ?auto_312862 ?auto_312866 ) ) ( not ( = ?auto_312862 ?auto_312867 ) ) ( not ( = ?auto_312862 ?auto_312868 ) ) ( not ( = ?auto_312862 ?auto_312869 ) ) ( not ( = ?auto_312862 ?auto_312872 ) ) ( not ( = ?auto_312863 ?auto_312865 ) ) ( not ( = ?auto_312863 ?auto_312864 ) ) ( not ( = ?auto_312863 ?auto_312866 ) ) ( not ( = ?auto_312863 ?auto_312867 ) ) ( not ( = ?auto_312863 ?auto_312868 ) ) ( not ( = ?auto_312863 ?auto_312869 ) ) ( not ( = ?auto_312863 ?auto_312872 ) ) ( not ( = ?auto_312865 ?auto_312864 ) ) ( not ( = ?auto_312865 ?auto_312866 ) ) ( not ( = ?auto_312865 ?auto_312867 ) ) ( not ( = ?auto_312865 ?auto_312868 ) ) ( not ( = ?auto_312865 ?auto_312869 ) ) ( not ( = ?auto_312865 ?auto_312872 ) ) ( not ( = ?auto_312864 ?auto_312866 ) ) ( not ( = ?auto_312864 ?auto_312867 ) ) ( not ( = ?auto_312864 ?auto_312868 ) ) ( not ( = ?auto_312864 ?auto_312869 ) ) ( not ( = ?auto_312864 ?auto_312872 ) ) ( not ( = ?auto_312866 ?auto_312867 ) ) ( not ( = ?auto_312866 ?auto_312868 ) ) ( not ( = ?auto_312866 ?auto_312869 ) ) ( not ( = ?auto_312866 ?auto_312872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312867 ?auto_312868 ?auto_312869 )
      ( MAKE-8CRATE-VERIFY ?auto_312861 ?auto_312862 ?auto_312863 ?auto_312865 ?auto_312864 ?auto_312866 ?auto_312867 ?auto_312868 ?auto_312869 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_312876 - SURFACE
      ?auto_312877 - SURFACE
      ?auto_312878 - SURFACE
      ?auto_312880 - SURFACE
      ?auto_312879 - SURFACE
      ?auto_312881 - SURFACE
      ?auto_312882 - SURFACE
      ?auto_312883 - SURFACE
      ?auto_312884 - SURFACE
      ?auto_312885 - SURFACE
    )
    :vars
    (
      ?auto_312890 - HOIST
      ?auto_312886 - PLACE
      ?auto_312889 - PLACE
      ?auto_312887 - HOIST
      ?auto_312888 - SURFACE
      ?auto_312891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312890 ?auto_312886 ) ( IS-CRATE ?auto_312885 ) ( not ( = ?auto_312884 ?auto_312885 ) ) ( not ( = ?auto_312883 ?auto_312884 ) ) ( not ( = ?auto_312883 ?auto_312885 ) ) ( not ( = ?auto_312889 ?auto_312886 ) ) ( HOIST-AT ?auto_312887 ?auto_312889 ) ( not ( = ?auto_312890 ?auto_312887 ) ) ( AVAILABLE ?auto_312887 ) ( SURFACE-AT ?auto_312885 ?auto_312889 ) ( ON ?auto_312885 ?auto_312888 ) ( CLEAR ?auto_312885 ) ( not ( = ?auto_312884 ?auto_312888 ) ) ( not ( = ?auto_312885 ?auto_312888 ) ) ( not ( = ?auto_312883 ?auto_312888 ) ) ( SURFACE-AT ?auto_312883 ?auto_312886 ) ( CLEAR ?auto_312883 ) ( IS-CRATE ?auto_312884 ) ( AVAILABLE ?auto_312890 ) ( IN ?auto_312884 ?auto_312891 ) ( TRUCK-AT ?auto_312891 ?auto_312889 ) ( ON ?auto_312877 ?auto_312876 ) ( ON ?auto_312878 ?auto_312877 ) ( ON ?auto_312880 ?auto_312878 ) ( ON ?auto_312879 ?auto_312880 ) ( ON ?auto_312881 ?auto_312879 ) ( ON ?auto_312882 ?auto_312881 ) ( ON ?auto_312883 ?auto_312882 ) ( not ( = ?auto_312876 ?auto_312877 ) ) ( not ( = ?auto_312876 ?auto_312878 ) ) ( not ( = ?auto_312876 ?auto_312880 ) ) ( not ( = ?auto_312876 ?auto_312879 ) ) ( not ( = ?auto_312876 ?auto_312881 ) ) ( not ( = ?auto_312876 ?auto_312882 ) ) ( not ( = ?auto_312876 ?auto_312883 ) ) ( not ( = ?auto_312876 ?auto_312884 ) ) ( not ( = ?auto_312876 ?auto_312885 ) ) ( not ( = ?auto_312876 ?auto_312888 ) ) ( not ( = ?auto_312877 ?auto_312878 ) ) ( not ( = ?auto_312877 ?auto_312880 ) ) ( not ( = ?auto_312877 ?auto_312879 ) ) ( not ( = ?auto_312877 ?auto_312881 ) ) ( not ( = ?auto_312877 ?auto_312882 ) ) ( not ( = ?auto_312877 ?auto_312883 ) ) ( not ( = ?auto_312877 ?auto_312884 ) ) ( not ( = ?auto_312877 ?auto_312885 ) ) ( not ( = ?auto_312877 ?auto_312888 ) ) ( not ( = ?auto_312878 ?auto_312880 ) ) ( not ( = ?auto_312878 ?auto_312879 ) ) ( not ( = ?auto_312878 ?auto_312881 ) ) ( not ( = ?auto_312878 ?auto_312882 ) ) ( not ( = ?auto_312878 ?auto_312883 ) ) ( not ( = ?auto_312878 ?auto_312884 ) ) ( not ( = ?auto_312878 ?auto_312885 ) ) ( not ( = ?auto_312878 ?auto_312888 ) ) ( not ( = ?auto_312880 ?auto_312879 ) ) ( not ( = ?auto_312880 ?auto_312881 ) ) ( not ( = ?auto_312880 ?auto_312882 ) ) ( not ( = ?auto_312880 ?auto_312883 ) ) ( not ( = ?auto_312880 ?auto_312884 ) ) ( not ( = ?auto_312880 ?auto_312885 ) ) ( not ( = ?auto_312880 ?auto_312888 ) ) ( not ( = ?auto_312879 ?auto_312881 ) ) ( not ( = ?auto_312879 ?auto_312882 ) ) ( not ( = ?auto_312879 ?auto_312883 ) ) ( not ( = ?auto_312879 ?auto_312884 ) ) ( not ( = ?auto_312879 ?auto_312885 ) ) ( not ( = ?auto_312879 ?auto_312888 ) ) ( not ( = ?auto_312881 ?auto_312882 ) ) ( not ( = ?auto_312881 ?auto_312883 ) ) ( not ( = ?auto_312881 ?auto_312884 ) ) ( not ( = ?auto_312881 ?auto_312885 ) ) ( not ( = ?auto_312881 ?auto_312888 ) ) ( not ( = ?auto_312882 ?auto_312883 ) ) ( not ( = ?auto_312882 ?auto_312884 ) ) ( not ( = ?auto_312882 ?auto_312885 ) ) ( not ( = ?auto_312882 ?auto_312888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312883 ?auto_312884 ?auto_312885 )
      ( MAKE-9CRATE-VERIFY ?auto_312876 ?auto_312877 ?auto_312878 ?auto_312880 ?auto_312879 ?auto_312881 ?auto_312882 ?auto_312883 ?auto_312884 ?auto_312885 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_312892 - SURFACE
      ?auto_312893 - SURFACE
      ?auto_312894 - SURFACE
      ?auto_312896 - SURFACE
      ?auto_312895 - SURFACE
      ?auto_312897 - SURFACE
      ?auto_312898 - SURFACE
      ?auto_312899 - SURFACE
      ?auto_312900 - SURFACE
      ?auto_312901 - SURFACE
      ?auto_312902 - SURFACE
    )
    :vars
    (
      ?auto_312907 - HOIST
      ?auto_312903 - PLACE
      ?auto_312906 - PLACE
      ?auto_312904 - HOIST
      ?auto_312905 - SURFACE
      ?auto_312908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312907 ?auto_312903 ) ( IS-CRATE ?auto_312902 ) ( not ( = ?auto_312901 ?auto_312902 ) ) ( not ( = ?auto_312900 ?auto_312901 ) ) ( not ( = ?auto_312900 ?auto_312902 ) ) ( not ( = ?auto_312906 ?auto_312903 ) ) ( HOIST-AT ?auto_312904 ?auto_312906 ) ( not ( = ?auto_312907 ?auto_312904 ) ) ( AVAILABLE ?auto_312904 ) ( SURFACE-AT ?auto_312902 ?auto_312906 ) ( ON ?auto_312902 ?auto_312905 ) ( CLEAR ?auto_312902 ) ( not ( = ?auto_312901 ?auto_312905 ) ) ( not ( = ?auto_312902 ?auto_312905 ) ) ( not ( = ?auto_312900 ?auto_312905 ) ) ( SURFACE-AT ?auto_312900 ?auto_312903 ) ( CLEAR ?auto_312900 ) ( IS-CRATE ?auto_312901 ) ( AVAILABLE ?auto_312907 ) ( IN ?auto_312901 ?auto_312908 ) ( TRUCK-AT ?auto_312908 ?auto_312906 ) ( ON ?auto_312893 ?auto_312892 ) ( ON ?auto_312894 ?auto_312893 ) ( ON ?auto_312896 ?auto_312894 ) ( ON ?auto_312895 ?auto_312896 ) ( ON ?auto_312897 ?auto_312895 ) ( ON ?auto_312898 ?auto_312897 ) ( ON ?auto_312899 ?auto_312898 ) ( ON ?auto_312900 ?auto_312899 ) ( not ( = ?auto_312892 ?auto_312893 ) ) ( not ( = ?auto_312892 ?auto_312894 ) ) ( not ( = ?auto_312892 ?auto_312896 ) ) ( not ( = ?auto_312892 ?auto_312895 ) ) ( not ( = ?auto_312892 ?auto_312897 ) ) ( not ( = ?auto_312892 ?auto_312898 ) ) ( not ( = ?auto_312892 ?auto_312899 ) ) ( not ( = ?auto_312892 ?auto_312900 ) ) ( not ( = ?auto_312892 ?auto_312901 ) ) ( not ( = ?auto_312892 ?auto_312902 ) ) ( not ( = ?auto_312892 ?auto_312905 ) ) ( not ( = ?auto_312893 ?auto_312894 ) ) ( not ( = ?auto_312893 ?auto_312896 ) ) ( not ( = ?auto_312893 ?auto_312895 ) ) ( not ( = ?auto_312893 ?auto_312897 ) ) ( not ( = ?auto_312893 ?auto_312898 ) ) ( not ( = ?auto_312893 ?auto_312899 ) ) ( not ( = ?auto_312893 ?auto_312900 ) ) ( not ( = ?auto_312893 ?auto_312901 ) ) ( not ( = ?auto_312893 ?auto_312902 ) ) ( not ( = ?auto_312893 ?auto_312905 ) ) ( not ( = ?auto_312894 ?auto_312896 ) ) ( not ( = ?auto_312894 ?auto_312895 ) ) ( not ( = ?auto_312894 ?auto_312897 ) ) ( not ( = ?auto_312894 ?auto_312898 ) ) ( not ( = ?auto_312894 ?auto_312899 ) ) ( not ( = ?auto_312894 ?auto_312900 ) ) ( not ( = ?auto_312894 ?auto_312901 ) ) ( not ( = ?auto_312894 ?auto_312902 ) ) ( not ( = ?auto_312894 ?auto_312905 ) ) ( not ( = ?auto_312896 ?auto_312895 ) ) ( not ( = ?auto_312896 ?auto_312897 ) ) ( not ( = ?auto_312896 ?auto_312898 ) ) ( not ( = ?auto_312896 ?auto_312899 ) ) ( not ( = ?auto_312896 ?auto_312900 ) ) ( not ( = ?auto_312896 ?auto_312901 ) ) ( not ( = ?auto_312896 ?auto_312902 ) ) ( not ( = ?auto_312896 ?auto_312905 ) ) ( not ( = ?auto_312895 ?auto_312897 ) ) ( not ( = ?auto_312895 ?auto_312898 ) ) ( not ( = ?auto_312895 ?auto_312899 ) ) ( not ( = ?auto_312895 ?auto_312900 ) ) ( not ( = ?auto_312895 ?auto_312901 ) ) ( not ( = ?auto_312895 ?auto_312902 ) ) ( not ( = ?auto_312895 ?auto_312905 ) ) ( not ( = ?auto_312897 ?auto_312898 ) ) ( not ( = ?auto_312897 ?auto_312899 ) ) ( not ( = ?auto_312897 ?auto_312900 ) ) ( not ( = ?auto_312897 ?auto_312901 ) ) ( not ( = ?auto_312897 ?auto_312902 ) ) ( not ( = ?auto_312897 ?auto_312905 ) ) ( not ( = ?auto_312898 ?auto_312899 ) ) ( not ( = ?auto_312898 ?auto_312900 ) ) ( not ( = ?auto_312898 ?auto_312901 ) ) ( not ( = ?auto_312898 ?auto_312902 ) ) ( not ( = ?auto_312898 ?auto_312905 ) ) ( not ( = ?auto_312899 ?auto_312900 ) ) ( not ( = ?auto_312899 ?auto_312901 ) ) ( not ( = ?auto_312899 ?auto_312902 ) ) ( not ( = ?auto_312899 ?auto_312905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312900 ?auto_312901 ?auto_312902 )
      ( MAKE-10CRATE-VERIFY ?auto_312892 ?auto_312893 ?auto_312894 ?auto_312896 ?auto_312895 ?auto_312897 ?auto_312898 ?auto_312899 ?auto_312900 ?auto_312901 ?auto_312902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_312909 - SURFACE
      ?auto_312910 - SURFACE
    )
    :vars
    (
      ?auto_312916 - HOIST
      ?auto_312911 - PLACE
      ?auto_312913 - SURFACE
      ?auto_312915 - PLACE
      ?auto_312912 - HOIST
      ?auto_312914 - SURFACE
      ?auto_312917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312916 ?auto_312911 ) ( IS-CRATE ?auto_312910 ) ( not ( = ?auto_312909 ?auto_312910 ) ) ( not ( = ?auto_312913 ?auto_312909 ) ) ( not ( = ?auto_312913 ?auto_312910 ) ) ( not ( = ?auto_312915 ?auto_312911 ) ) ( HOIST-AT ?auto_312912 ?auto_312915 ) ( not ( = ?auto_312916 ?auto_312912 ) ) ( SURFACE-AT ?auto_312910 ?auto_312915 ) ( ON ?auto_312910 ?auto_312914 ) ( CLEAR ?auto_312910 ) ( not ( = ?auto_312909 ?auto_312914 ) ) ( not ( = ?auto_312910 ?auto_312914 ) ) ( not ( = ?auto_312913 ?auto_312914 ) ) ( SURFACE-AT ?auto_312913 ?auto_312911 ) ( CLEAR ?auto_312913 ) ( IS-CRATE ?auto_312909 ) ( AVAILABLE ?auto_312916 ) ( TRUCK-AT ?auto_312917 ?auto_312915 ) ( LIFTING ?auto_312912 ?auto_312909 ) )
    :subtasks
    ( ( !LOAD ?auto_312912 ?auto_312909 ?auto_312917 ?auto_312915 )
      ( MAKE-2CRATE ?auto_312913 ?auto_312909 ?auto_312910 )
      ( MAKE-1CRATE-VERIFY ?auto_312909 ?auto_312910 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_312918 - SURFACE
      ?auto_312919 - SURFACE
      ?auto_312920 - SURFACE
    )
    :vars
    (
      ?auto_312926 - HOIST
      ?auto_312922 - PLACE
      ?auto_312923 - PLACE
      ?auto_312925 - HOIST
      ?auto_312921 - SURFACE
      ?auto_312924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312926 ?auto_312922 ) ( IS-CRATE ?auto_312920 ) ( not ( = ?auto_312919 ?auto_312920 ) ) ( not ( = ?auto_312918 ?auto_312919 ) ) ( not ( = ?auto_312918 ?auto_312920 ) ) ( not ( = ?auto_312923 ?auto_312922 ) ) ( HOIST-AT ?auto_312925 ?auto_312923 ) ( not ( = ?auto_312926 ?auto_312925 ) ) ( SURFACE-AT ?auto_312920 ?auto_312923 ) ( ON ?auto_312920 ?auto_312921 ) ( CLEAR ?auto_312920 ) ( not ( = ?auto_312919 ?auto_312921 ) ) ( not ( = ?auto_312920 ?auto_312921 ) ) ( not ( = ?auto_312918 ?auto_312921 ) ) ( SURFACE-AT ?auto_312918 ?auto_312922 ) ( CLEAR ?auto_312918 ) ( IS-CRATE ?auto_312919 ) ( AVAILABLE ?auto_312926 ) ( TRUCK-AT ?auto_312924 ?auto_312923 ) ( LIFTING ?auto_312925 ?auto_312919 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_312919 ?auto_312920 )
      ( MAKE-2CRATE-VERIFY ?auto_312918 ?auto_312919 ?auto_312920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_312927 - SURFACE
      ?auto_312928 - SURFACE
      ?auto_312929 - SURFACE
      ?auto_312930 - SURFACE
    )
    :vars
    (
      ?auto_312932 - HOIST
      ?auto_312936 - PLACE
      ?auto_312935 - PLACE
      ?auto_312933 - HOIST
      ?auto_312934 - SURFACE
      ?auto_312931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312932 ?auto_312936 ) ( IS-CRATE ?auto_312930 ) ( not ( = ?auto_312929 ?auto_312930 ) ) ( not ( = ?auto_312928 ?auto_312929 ) ) ( not ( = ?auto_312928 ?auto_312930 ) ) ( not ( = ?auto_312935 ?auto_312936 ) ) ( HOIST-AT ?auto_312933 ?auto_312935 ) ( not ( = ?auto_312932 ?auto_312933 ) ) ( SURFACE-AT ?auto_312930 ?auto_312935 ) ( ON ?auto_312930 ?auto_312934 ) ( CLEAR ?auto_312930 ) ( not ( = ?auto_312929 ?auto_312934 ) ) ( not ( = ?auto_312930 ?auto_312934 ) ) ( not ( = ?auto_312928 ?auto_312934 ) ) ( SURFACE-AT ?auto_312928 ?auto_312936 ) ( CLEAR ?auto_312928 ) ( IS-CRATE ?auto_312929 ) ( AVAILABLE ?auto_312932 ) ( TRUCK-AT ?auto_312931 ?auto_312935 ) ( LIFTING ?auto_312933 ?auto_312929 ) ( ON ?auto_312928 ?auto_312927 ) ( not ( = ?auto_312927 ?auto_312928 ) ) ( not ( = ?auto_312927 ?auto_312929 ) ) ( not ( = ?auto_312927 ?auto_312930 ) ) ( not ( = ?auto_312927 ?auto_312934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312928 ?auto_312929 ?auto_312930 )
      ( MAKE-3CRATE-VERIFY ?auto_312927 ?auto_312928 ?auto_312929 ?auto_312930 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_312937 - SURFACE
      ?auto_312938 - SURFACE
      ?auto_312939 - SURFACE
      ?auto_312941 - SURFACE
      ?auto_312940 - SURFACE
    )
    :vars
    (
      ?auto_312943 - HOIST
      ?auto_312947 - PLACE
      ?auto_312946 - PLACE
      ?auto_312944 - HOIST
      ?auto_312945 - SURFACE
      ?auto_312942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312943 ?auto_312947 ) ( IS-CRATE ?auto_312940 ) ( not ( = ?auto_312941 ?auto_312940 ) ) ( not ( = ?auto_312939 ?auto_312941 ) ) ( not ( = ?auto_312939 ?auto_312940 ) ) ( not ( = ?auto_312946 ?auto_312947 ) ) ( HOIST-AT ?auto_312944 ?auto_312946 ) ( not ( = ?auto_312943 ?auto_312944 ) ) ( SURFACE-AT ?auto_312940 ?auto_312946 ) ( ON ?auto_312940 ?auto_312945 ) ( CLEAR ?auto_312940 ) ( not ( = ?auto_312941 ?auto_312945 ) ) ( not ( = ?auto_312940 ?auto_312945 ) ) ( not ( = ?auto_312939 ?auto_312945 ) ) ( SURFACE-AT ?auto_312939 ?auto_312947 ) ( CLEAR ?auto_312939 ) ( IS-CRATE ?auto_312941 ) ( AVAILABLE ?auto_312943 ) ( TRUCK-AT ?auto_312942 ?auto_312946 ) ( LIFTING ?auto_312944 ?auto_312941 ) ( ON ?auto_312938 ?auto_312937 ) ( ON ?auto_312939 ?auto_312938 ) ( not ( = ?auto_312937 ?auto_312938 ) ) ( not ( = ?auto_312937 ?auto_312939 ) ) ( not ( = ?auto_312937 ?auto_312941 ) ) ( not ( = ?auto_312937 ?auto_312940 ) ) ( not ( = ?auto_312937 ?auto_312945 ) ) ( not ( = ?auto_312938 ?auto_312939 ) ) ( not ( = ?auto_312938 ?auto_312941 ) ) ( not ( = ?auto_312938 ?auto_312940 ) ) ( not ( = ?auto_312938 ?auto_312945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312939 ?auto_312941 ?auto_312940 )
      ( MAKE-4CRATE-VERIFY ?auto_312937 ?auto_312938 ?auto_312939 ?auto_312941 ?auto_312940 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_312948 - SURFACE
      ?auto_312949 - SURFACE
      ?auto_312950 - SURFACE
      ?auto_312952 - SURFACE
      ?auto_312951 - SURFACE
      ?auto_312953 - SURFACE
    )
    :vars
    (
      ?auto_312955 - HOIST
      ?auto_312959 - PLACE
      ?auto_312958 - PLACE
      ?auto_312956 - HOIST
      ?auto_312957 - SURFACE
      ?auto_312954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312955 ?auto_312959 ) ( IS-CRATE ?auto_312953 ) ( not ( = ?auto_312951 ?auto_312953 ) ) ( not ( = ?auto_312952 ?auto_312951 ) ) ( not ( = ?auto_312952 ?auto_312953 ) ) ( not ( = ?auto_312958 ?auto_312959 ) ) ( HOIST-AT ?auto_312956 ?auto_312958 ) ( not ( = ?auto_312955 ?auto_312956 ) ) ( SURFACE-AT ?auto_312953 ?auto_312958 ) ( ON ?auto_312953 ?auto_312957 ) ( CLEAR ?auto_312953 ) ( not ( = ?auto_312951 ?auto_312957 ) ) ( not ( = ?auto_312953 ?auto_312957 ) ) ( not ( = ?auto_312952 ?auto_312957 ) ) ( SURFACE-AT ?auto_312952 ?auto_312959 ) ( CLEAR ?auto_312952 ) ( IS-CRATE ?auto_312951 ) ( AVAILABLE ?auto_312955 ) ( TRUCK-AT ?auto_312954 ?auto_312958 ) ( LIFTING ?auto_312956 ?auto_312951 ) ( ON ?auto_312949 ?auto_312948 ) ( ON ?auto_312950 ?auto_312949 ) ( ON ?auto_312952 ?auto_312950 ) ( not ( = ?auto_312948 ?auto_312949 ) ) ( not ( = ?auto_312948 ?auto_312950 ) ) ( not ( = ?auto_312948 ?auto_312952 ) ) ( not ( = ?auto_312948 ?auto_312951 ) ) ( not ( = ?auto_312948 ?auto_312953 ) ) ( not ( = ?auto_312948 ?auto_312957 ) ) ( not ( = ?auto_312949 ?auto_312950 ) ) ( not ( = ?auto_312949 ?auto_312952 ) ) ( not ( = ?auto_312949 ?auto_312951 ) ) ( not ( = ?auto_312949 ?auto_312953 ) ) ( not ( = ?auto_312949 ?auto_312957 ) ) ( not ( = ?auto_312950 ?auto_312952 ) ) ( not ( = ?auto_312950 ?auto_312951 ) ) ( not ( = ?auto_312950 ?auto_312953 ) ) ( not ( = ?auto_312950 ?auto_312957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312952 ?auto_312951 ?auto_312953 )
      ( MAKE-5CRATE-VERIFY ?auto_312948 ?auto_312949 ?auto_312950 ?auto_312952 ?auto_312951 ?auto_312953 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_312960 - SURFACE
      ?auto_312961 - SURFACE
      ?auto_312962 - SURFACE
      ?auto_312964 - SURFACE
      ?auto_312963 - SURFACE
      ?auto_312965 - SURFACE
      ?auto_312966 - SURFACE
    )
    :vars
    (
      ?auto_312968 - HOIST
      ?auto_312972 - PLACE
      ?auto_312971 - PLACE
      ?auto_312969 - HOIST
      ?auto_312970 - SURFACE
      ?auto_312967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312968 ?auto_312972 ) ( IS-CRATE ?auto_312966 ) ( not ( = ?auto_312965 ?auto_312966 ) ) ( not ( = ?auto_312963 ?auto_312965 ) ) ( not ( = ?auto_312963 ?auto_312966 ) ) ( not ( = ?auto_312971 ?auto_312972 ) ) ( HOIST-AT ?auto_312969 ?auto_312971 ) ( not ( = ?auto_312968 ?auto_312969 ) ) ( SURFACE-AT ?auto_312966 ?auto_312971 ) ( ON ?auto_312966 ?auto_312970 ) ( CLEAR ?auto_312966 ) ( not ( = ?auto_312965 ?auto_312970 ) ) ( not ( = ?auto_312966 ?auto_312970 ) ) ( not ( = ?auto_312963 ?auto_312970 ) ) ( SURFACE-AT ?auto_312963 ?auto_312972 ) ( CLEAR ?auto_312963 ) ( IS-CRATE ?auto_312965 ) ( AVAILABLE ?auto_312968 ) ( TRUCK-AT ?auto_312967 ?auto_312971 ) ( LIFTING ?auto_312969 ?auto_312965 ) ( ON ?auto_312961 ?auto_312960 ) ( ON ?auto_312962 ?auto_312961 ) ( ON ?auto_312964 ?auto_312962 ) ( ON ?auto_312963 ?auto_312964 ) ( not ( = ?auto_312960 ?auto_312961 ) ) ( not ( = ?auto_312960 ?auto_312962 ) ) ( not ( = ?auto_312960 ?auto_312964 ) ) ( not ( = ?auto_312960 ?auto_312963 ) ) ( not ( = ?auto_312960 ?auto_312965 ) ) ( not ( = ?auto_312960 ?auto_312966 ) ) ( not ( = ?auto_312960 ?auto_312970 ) ) ( not ( = ?auto_312961 ?auto_312962 ) ) ( not ( = ?auto_312961 ?auto_312964 ) ) ( not ( = ?auto_312961 ?auto_312963 ) ) ( not ( = ?auto_312961 ?auto_312965 ) ) ( not ( = ?auto_312961 ?auto_312966 ) ) ( not ( = ?auto_312961 ?auto_312970 ) ) ( not ( = ?auto_312962 ?auto_312964 ) ) ( not ( = ?auto_312962 ?auto_312963 ) ) ( not ( = ?auto_312962 ?auto_312965 ) ) ( not ( = ?auto_312962 ?auto_312966 ) ) ( not ( = ?auto_312962 ?auto_312970 ) ) ( not ( = ?auto_312964 ?auto_312963 ) ) ( not ( = ?auto_312964 ?auto_312965 ) ) ( not ( = ?auto_312964 ?auto_312966 ) ) ( not ( = ?auto_312964 ?auto_312970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312963 ?auto_312965 ?auto_312966 )
      ( MAKE-6CRATE-VERIFY ?auto_312960 ?auto_312961 ?auto_312962 ?auto_312964 ?auto_312963 ?auto_312965 ?auto_312966 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_312973 - SURFACE
      ?auto_312974 - SURFACE
      ?auto_312975 - SURFACE
      ?auto_312977 - SURFACE
      ?auto_312976 - SURFACE
      ?auto_312978 - SURFACE
      ?auto_312979 - SURFACE
      ?auto_312980 - SURFACE
    )
    :vars
    (
      ?auto_312982 - HOIST
      ?auto_312986 - PLACE
      ?auto_312985 - PLACE
      ?auto_312983 - HOIST
      ?auto_312984 - SURFACE
      ?auto_312981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312982 ?auto_312986 ) ( IS-CRATE ?auto_312980 ) ( not ( = ?auto_312979 ?auto_312980 ) ) ( not ( = ?auto_312978 ?auto_312979 ) ) ( not ( = ?auto_312978 ?auto_312980 ) ) ( not ( = ?auto_312985 ?auto_312986 ) ) ( HOIST-AT ?auto_312983 ?auto_312985 ) ( not ( = ?auto_312982 ?auto_312983 ) ) ( SURFACE-AT ?auto_312980 ?auto_312985 ) ( ON ?auto_312980 ?auto_312984 ) ( CLEAR ?auto_312980 ) ( not ( = ?auto_312979 ?auto_312984 ) ) ( not ( = ?auto_312980 ?auto_312984 ) ) ( not ( = ?auto_312978 ?auto_312984 ) ) ( SURFACE-AT ?auto_312978 ?auto_312986 ) ( CLEAR ?auto_312978 ) ( IS-CRATE ?auto_312979 ) ( AVAILABLE ?auto_312982 ) ( TRUCK-AT ?auto_312981 ?auto_312985 ) ( LIFTING ?auto_312983 ?auto_312979 ) ( ON ?auto_312974 ?auto_312973 ) ( ON ?auto_312975 ?auto_312974 ) ( ON ?auto_312977 ?auto_312975 ) ( ON ?auto_312976 ?auto_312977 ) ( ON ?auto_312978 ?auto_312976 ) ( not ( = ?auto_312973 ?auto_312974 ) ) ( not ( = ?auto_312973 ?auto_312975 ) ) ( not ( = ?auto_312973 ?auto_312977 ) ) ( not ( = ?auto_312973 ?auto_312976 ) ) ( not ( = ?auto_312973 ?auto_312978 ) ) ( not ( = ?auto_312973 ?auto_312979 ) ) ( not ( = ?auto_312973 ?auto_312980 ) ) ( not ( = ?auto_312973 ?auto_312984 ) ) ( not ( = ?auto_312974 ?auto_312975 ) ) ( not ( = ?auto_312974 ?auto_312977 ) ) ( not ( = ?auto_312974 ?auto_312976 ) ) ( not ( = ?auto_312974 ?auto_312978 ) ) ( not ( = ?auto_312974 ?auto_312979 ) ) ( not ( = ?auto_312974 ?auto_312980 ) ) ( not ( = ?auto_312974 ?auto_312984 ) ) ( not ( = ?auto_312975 ?auto_312977 ) ) ( not ( = ?auto_312975 ?auto_312976 ) ) ( not ( = ?auto_312975 ?auto_312978 ) ) ( not ( = ?auto_312975 ?auto_312979 ) ) ( not ( = ?auto_312975 ?auto_312980 ) ) ( not ( = ?auto_312975 ?auto_312984 ) ) ( not ( = ?auto_312977 ?auto_312976 ) ) ( not ( = ?auto_312977 ?auto_312978 ) ) ( not ( = ?auto_312977 ?auto_312979 ) ) ( not ( = ?auto_312977 ?auto_312980 ) ) ( not ( = ?auto_312977 ?auto_312984 ) ) ( not ( = ?auto_312976 ?auto_312978 ) ) ( not ( = ?auto_312976 ?auto_312979 ) ) ( not ( = ?auto_312976 ?auto_312980 ) ) ( not ( = ?auto_312976 ?auto_312984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312978 ?auto_312979 ?auto_312980 )
      ( MAKE-7CRATE-VERIFY ?auto_312973 ?auto_312974 ?auto_312975 ?auto_312977 ?auto_312976 ?auto_312978 ?auto_312979 ?auto_312980 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_312987 - SURFACE
      ?auto_312988 - SURFACE
      ?auto_312989 - SURFACE
      ?auto_312991 - SURFACE
      ?auto_312990 - SURFACE
      ?auto_312992 - SURFACE
      ?auto_312993 - SURFACE
      ?auto_312994 - SURFACE
      ?auto_312995 - SURFACE
    )
    :vars
    (
      ?auto_312997 - HOIST
      ?auto_313001 - PLACE
      ?auto_313000 - PLACE
      ?auto_312998 - HOIST
      ?auto_312999 - SURFACE
      ?auto_312996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_312997 ?auto_313001 ) ( IS-CRATE ?auto_312995 ) ( not ( = ?auto_312994 ?auto_312995 ) ) ( not ( = ?auto_312993 ?auto_312994 ) ) ( not ( = ?auto_312993 ?auto_312995 ) ) ( not ( = ?auto_313000 ?auto_313001 ) ) ( HOIST-AT ?auto_312998 ?auto_313000 ) ( not ( = ?auto_312997 ?auto_312998 ) ) ( SURFACE-AT ?auto_312995 ?auto_313000 ) ( ON ?auto_312995 ?auto_312999 ) ( CLEAR ?auto_312995 ) ( not ( = ?auto_312994 ?auto_312999 ) ) ( not ( = ?auto_312995 ?auto_312999 ) ) ( not ( = ?auto_312993 ?auto_312999 ) ) ( SURFACE-AT ?auto_312993 ?auto_313001 ) ( CLEAR ?auto_312993 ) ( IS-CRATE ?auto_312994 ) ( AVAILABLE ?auto_312997 ) ( TRUCK-AT ?auto_312996 ?auto_313000 ) ( LIFTING ?auto_312998 ?auto_312994 ) ( ON ?auto_312988 ?auto_312987 ) ( ON ?auto_312989 ?auto_312988 ) ( ON ?auto_312991 ?auto_312989 ) ( ON ?auto_312990 ?auto_312991 ) ( ON ?auto_312992 ?auto_312990 ) ( ON ?auto_312993 ?auto_312992 ) ( not ( = ?auto_312987 ?auto_312988 ) ) ( not ( = ?auto_312987 ?auto_312989 ) ) ( not ( = ?auto_312987 ?auto_312991 ) ) ( not ( = ?auto_312987 ?auto_312990 ) ) ( not ( = ?auto_312987 ?auto_312992 ) ) ( not ( = ?auto_312987 ?auto_312993 ) ) ( not ( = ?auto_312987 ?auto_312994 ) ) ( not ( = ?auto_312987 ?auto_312995 ) ) ( not ( = ?auto_312987 ?auto_312999 ) ) ( not ( = ?auto_312988 ?auto_312989 ) ) ( not ( = ?auto_312988 ?auto_312991 ) ) ( not ( = ?auto_312988 ?auto_312990 ) ) ( not ( = ?auto_312988 ?auto_312992 ) ) ( not ( = ?auto_312988 ?auto_312993 ) ) ( not ( = ?auto_312988 ?auto_312994 ) ) ( not ( = ?auto_312988 ?auto_312995 ) ) ( not ( = ?auto_312988 ?auto_312999 ) ) ( not ( = ?auto_312989 ?auto_312991 ) ) ( not ( = ?auto_312989 ?auto_312990 ) ) ( not ( = ?auto_312989 ?auto_312992 ) ) ( not ( = ?auto_312989 ?auto_312993 ) ) ( not ( = ?auto_312989 ?auto_312994 ) ) ( not ( = ?auto_312989 ?auto_312995 ) ) ( not ( = ?auto_312989 ?auto_312999 ) ) ( not ( = ?auto_312991 ?auto_312990 ) ) ( not ( = ?auto_312991 ?auto_312992 ) ) ( not ( = ?auto_312991 ?auto_312993 ) ) ( not ( = ?auto_312991 ?auto_312994 ) ) ( not ( = ?auto_312991 ?auto_312995 ) ) ( not ( = ?auto_312991 ?auto_312999 ) ) ( not ( = ?auto_312990 ?auto_312992 ) ) ( not ( = ?auto_312990 ?auto_312993 ) ) ( not ( = ?auto_312990 ?auto_312994 ) ) ( not ( = ?auto_312990 ?auto_312995 ) ) ( not ( = ?auto_312990 ?auto_312999 ) ) ( not ( = ?auto_312992 ?auto_312993 ) ) ( not ( = ?auto_312992 ?auto_312994 ) ) ( not ( = ?auto_312992 ?auto_312995 ) ) ( not ( = ?auto_312992 ?auto_312999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_312993 ?auto_312994 ?auto_312995 )
      ( MAKE-8CRATE-VERIFY ?auto_312987 ?auto_312988 ?auto_312989 ?auto_312991 ?auto_312990 ?auto_312992 ?auto_312993 ?auto_312994 ?auto_312995 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_313002 - SURFACE
      ?auto_313003 - SURFACE
      ?auto_313004 - SURFACE
      ?auto_313006 - SURFACE
      ?auto_313005 - SURFACE
      ?auto_313007 - SURFACE
      ?auto_313008 - SURFACE
      ?auto_313009 - SURFACE
      ?auto_313010 - SURFACE
      ?auto_313011 - SURFACE
    )
    :vars
    (
      ?auto_313013 - HOIST
      ?auto_313017 - PLACE
      ?auto_313016 - PLACE
      ?auto_313014 - HOIST
      ?auto_313015 - SURFACE
      ?auto_313012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313013 ?auto_313017 ) ( IS-CRATE ?auto_313011 ) ( not ( = ?auto_313010 ?auto_313011 ) ) ( not ( = ?auto_313009 ?auto_313010 ) ) ( not ( = ?auto_313009 ?auto_313011 ) ) ( not ( = ?auto_313016 ?auto_313017 ) ) ( HOIST-AT ?auto_313014 ?auto_313016 ) ( not ( = ?auto_313013 ?auto_313014 ) ) ( SURFACE-AT ?auto_313011 ?auto_313016 ) ( ON ?auto_313011 ?auto_313015 ) ( CLEAR ?auto_313011 ) ( not ( = ?auto_313010 ?auto_313015 ) ) ( not ( = ?auto_313011 ?auto_313015 ) ) ( not ( = ?auto_313009 ?auto_313015 ) ) ( SURFACE-AT ?auto_313009 ?auto_313017 ) ( CLEAR ?auto_313009 ) ( IS-CRATE ?auto_313010 ) ( AVAILABLE ?auto_313013 ) ( TRUCK-AT ?auto_313012 ?auto_313016 ) ( LIFTING ?auto_313014 ?auto_313010 ) ( ON ?auto_313003 ?auto_313002 ) ( ON ?auto_313004 ?auto_313003 ) ( ON ?auto_313006 ?auto_313004 ) ( ON ?auto_313005 ?auto_313006 ) ( ON ?auto_313007 ?auto_313005 ) ( ON ?auto_313008 ?auto_313007 ) ( ON ?auto_313009 ?auto_313008 ) ( not ( = ?auto_313002 ?auto_313003 ) ) ( not ( = ?auto_313002 ?auto_313004 ) ) ( not ( = ?auto_313002 ?auto_313006 ) ) ( not ( = ?auto_313002 ?auto_313005 ) ) ( not ( = ?auto_313002 ?auto_313007 ) ) ( not ( = ?auto_313002 ?auto_313008 ) ) ( not ( = ?auto_313002 ?auto_313009 ) ) ( not ( = ?auto_313002 ?auto_313010 ) ) ( not ( = ?auto_313002 ?auto_313011 ) ) ( not ( = ?auto_313002 ?auto_313015 ) ) ( not ( = ?auto_313003 ?auto_313004 ) ) ( not ( = ?auto_313003 ?auto_313006 ) ) ( not ( = ?auto_313003 ?auto_313005 ) ) ( not ( = ?auto_313003 ?auto_313007 ) ) ( not ( = ?auto_313003 ?auto_313008 ) ) ( not ( = ?auto_313003 ?auto_313009 ) ) ( not ( = ?auto_313003 ?auto_313010 ) ) ( not ( = ?auto_313003 ?auto_313011 ) ) ( not ( = ?auto_313003 ?auto_313015 ) ) ( not ( = ?auto_313004 ?auto_313006 ) ) ( not ( = ?auto_313004 ?auto_313005 ) ) ( not ( = ?auto_313004 ?auto_313007 ) ) ( not ( = ?auto_313004 ?auto_313008 ) ) ( not ( = ?auto_313004 ?auto_313009 ) ) ( not ( = ?auto_313004 ?auto_313010 ) ) ( not ( = ?auto_313004 ?auto_313011 ) ) ( not ( = ?auto_313004 ?auto_313015 ) ) ( not ( = ?auto_313006 ?auto_313005 ) ) ( not ( = ?auto_313006 ?auto_313007 ) ) ( not ( = ?auto_313006 ?auto_313008 ) ) ( not ( = ?auto_313006 ?auto_313009 ) ) ( not ( = ?auto_313006 ?auto_313010 ) ) ( not ( = ?auto_313006 ?auto_313011 ) ) ( not ( = ?auto_313006 ?auto_313015 ) ) ( not ( = ?auto_313005 ?auto_313007 ) ) ( not ( = ?auto_313005 ?auto_313008 ) ) ( not ( = ?auto_313005 ?auto_313009 ) ) ( not ( = ?auto_313005 ?auto_313010 ) ) ( not ( = ?auto_313005 ?auto_313011 ) ) ( not ( = ?auto_313005 ?auto_313015 ) ) ( not ( = ?auto_313007 ?auto_313008 ) ) ( not ( = ?auto_313007 ?auto_313009 ) ) ( not ( = ?auto_313007 ?auto_313010 ) ) ( not ( = ?auto_313007 ?auto_313011 ) ) ( not ( = ?auto_313007 ?auto_313015 ) ) ( not ( = ?auto_313008 ?auto_313009 ) ) ( not ( = ?auto_313008 ?auto_313010 ) ) ( not ( = ?auto_313008 ?auto_313011 ) ) ( not ( = ?auto_313008 ?auto_313015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313009 ?auto_313010 ?auto_313011 )
      ( MAKE-9CRATE-VERIFY ?auto_313002 ?auto_313003 ?auto_313004 ?auto_313006 ?auto_313005 ?auto_313007 ?auto_313008 ?auto_313009 ?auto_313010 ?auto_313011 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_313018 - SURFACE
      ?auto_313019 - SURFACE
      ?auto_313020 - SURFACE
      ?auto_313022 - SURFACE
      ?auto_313021 - SURFACE
      ?auto_313023 - SURFACE
      ?auto_313024 - SURFACE
      ?auto_313025 - SURFACE
      ?auto_313026 - SURFACE
      ?auto_313027 - SURFACE
      ?auto_313028 - SURFACE
    )
    :vars
    (
      ?auto_313030 - HOIST
      ?auto_313034 - PLACE
      ?auto_313033 - PLACE
      ?auto_313031 - HOIST
      ?auto_313032 - SURFACE
      ?auto_313029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313030 ?auto_313034 ) ( IS-CRATE ?auto_313028 ) ( not ( = ?auto_313027 ?auto_313028 ) ) ( not ( = ?auto_313026 ?auto_313027 ) ) ( not ( = ?auto_313026 ?auto_313028 ) ) ( not ( = ?auto_313033 ?auto_313034 ) ) ( HOIST-AT ?auto_313031 ?auto_313033 ) ( not ( = ?auto_313030 ?auto_313031 ) ) ( SURFACE-AT ?auto_313028 ?auto_313033 ) ( ON ?auto_313028 ?auto_313032 ) ( CLEAR ?auto_313028 ) ( not ( = ?auto_313027 ?auto_313032 ) ) ( not ( = ?auto_313028 ?auto_313032 ) ) ( not ( = ?auto_313026 ?auto_313032 ) ) ( SURFACE-AT ?auto_313026 ?auto_313034 ) ( CLEAR ?auto_313026 ) ( IS-CRATE ?auto_313027 ) ( AVAILABLE ?auto_313030 ) ( TRUCK-AT ?auto_313029 ?auto_313033 ) ( LIFTING ?auto_313031 ?auto_313027 ) ( ON ?auto_313019 ?auto_313018 ) ( ON ?auto_313020 ?auto_313019 ) ( ON ?auto_313022 ?auto_313020 ) ( ON ?auto_313021 ?auto_313022 ) ( ON ?auto_313023 ?auto_313021 ) ( ON ?auto_313024 ?auto_313023 ) ( ON ?auto_313025 ?auto_313024 ) ( ON ?auto_313026 ?auto_313025 ) ( not ( = ?auto_313018 ?auto_313019 ) ) ( not ( = ?auto_313018 ?auto_313020 ) ) ( not ( = ?auto_313018 ?auto_313022 ) ) ( not ( = ?auto_313018 ?auto_313021 ) ) ( not ( = ?auto_313018 ?auto_313023 ) ) ( not ( = ?auto_313018 ?auto_313024 ) ) ( not ( = ?auto_313018 ?auto_313025 ) ) ( not ( = ?auto_313018 ?auto_313026 ) ) ( not ( = ?auto_313018 ?auto_313027 ) ) ( not ( = ?auto_313018 ?auto_313028 ) ) ( not ( = ?auto_313018 ?auto_313032 ) ) ( not ( = ?auto_313019 ?auto_313020 ) ) ( not ( = ?auto_313019 ?auto_313022 ) ) ( not ( = ?auto_313019 ?auto_313021 ) ) ( not ( = ?auto_313019 ?auto_313023 ) ) ( not ( = ?auto_313019 ?auto_313024 ) ) ( not ( = ?auto_313019 ?auto_313025 ) ) ( not ( = ?auto_313019 ?auto_313026 ) ) ( not ( = ?auto_313019 ?auto_313027 ) ) ( not ( = ?auto_313019 ?auto_313028 ) ) ( not ( = ?auto_313019 ?auto_313032 ) ) ( not ( = ?auto_313020 ?auto_313022 ) ) ( not ( = ?auto_313020 ?auto_313021 ) ) ( not ( = ?auto_313020 ?auto_313023 ) ) ( not ( = ?auto_313020 ?auto_313024 ) ) ( not ( = ?auto_313020 ?auto_313025 ) ) ( not ( = ?auto_313020 ?auto_313026 ) ) ( not ( = ?auto_313020 ?auto_313027 ) ) ( not ( = ?auto_313020 ?auto_313028 ) ) ( not ( = ?auto_313020 ?auto_313032 ) ) ( not ( = ?auto_313022 ?auto_313021 ) ) ( not ( = ?auto_313022 ?auto_313023 ) ) ( not ( = ?auto_313022 ?auto_313024 ) ) ( not ( = ?auto_313022 ?auto_313025 ) ) ( not ( = ?auto_313022 ?auto_313026 ) ) ( not ( = ?auto_313022 ?auto_313027 ) ) ( not ( = ?auto_313022 ?auto_313028 ) ) ( not ( = ?auto_313022 ?auto_313032 ) ) ( not ( = ?auto_313021 ?auto_313023 ) ) ( not ( = ?auto_313021 ?auto_313024 ) ) ( not ( = ?auto_313021 ?auto_313025 ) ) ( not ( = ?auto_313021 ?auto_313026 ) ) ( not ( = ?auto_313021 ?auto_313027 ) ) ( not ( = ?auto_313021 ?auto_313028 ) ) ( not ( = ?auto_313021 ?auto_313032 ) ) ( not ( = ?auto_313023 ?auto_313024 ) ) ( not ( = ?auto_313023 ?auto_313025 ) ) ( not ( = ?auto_313023 ?auto_313026 ) ) ( not ( = ?auto_313023 ?auto_313027 ) ) ( not ( = ?auto_313023 ?auto_313028 ) ) ( not ( = ?auto_313023 ?auto_313032 ) ) ( not ( = ?auto_313024 ?auto_313025 ) ) ( not ( = ?auto_313024 ?auto_313026 ) ) ( not ( = ?auto_313024 ?auto_313027 ) ) ( not ( = ?auto_313024 ?auto_313028 ) ) ( not ( = ?auto_313024 ?auto_313032 ) ) ( not ( = ?auto_313025 ?auto_313026 ) ) ( not ( = ?auto_313025 ?auto_313027 ) ) ( not ( = ?auto_313025 ?auto_313028 ) ) ( not ( = ?auto_313025 ?auto_313032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313026 ?auto_313027 ?auto_313028 )
      ( MAKE-10CRATE-VERIFY ?auto_313018 ?auto_313019 ?auto_313020 ?auto_313022 ?auto_313021 ?auto_313023 ?auto_313024 ?auto_313025 ?auto_313026 ?auto_313027 ?auto_313028 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_313035 - SURFACE
      ?auto_313036 - SURFACE
    )
    :vars
    (
      ?auto_313039 - HOIST
      ?auto_313043 - PLACE
      ?auto_313037 - SURFACE
      ?auto_313042 - PLACE
      ?auto_313040 - HOIST
      ?auto_313041 - SURFACE
      ?auto_313038 - TRUCK
      ?auto_313044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313039 ?auto_313043 ) ( IS-CRATE ?auto_313036 ) ( not ( = ?auto_313035 ?auto_313036 ) ) ( not ( = ?auto_313037 ?auto_313035 ) ) ( not ( = ?auto_313037 ?auto_313036 ) ) ( not ( = ?auto_313042 ?auto_313043 ) ) ( HOIST-AT ?auto_313040 ?auto_313042 ) ( not ( = ?auto_313039 ?auto_313040 ) ) ( SURFACE-AT ?auto_313036 ?auto_313042 ) ( ON ?auto_313036 ?auto_313041 ) ( CLEAR ?auto_313036 ) ( not ( = ?auto_313035 ?auto_313041 ) ) ( not ( = ?auto_313036 ?auto_313041 ) ) ( not ( = ?auto_313037 ?auto_313041 ) ) ( SURFACE-AT ?auto_313037 ?auto_313043 ) ( CLEAR ?auto_313037 ) ( IS-CRATE ?auto_313035 ) ( AVAILABLE ?auto_313039 ) ( TRUCK-AT ?auto_313038 ?auto_313042 ) ( AVAILABLE ?auto_313040 ) ( SURFACE-AT ?auto_313035 ?auto_313042 ) ( ON ?auto_313035 ?auto_313044 ) ( CLEAR ?auto_313035 ) ( not ( = ?auto_313035 ?auto_313044 ) ) ( not ( = ?auto_313036 ?auto_313044 ) ) ( not ( = ?auto_313037 ?auto_313044 ) ) ( not ( = ?auto_313041 ?auto_313044 ) ) )
    :subtasks
    ( ( !LIFT ?auto_313040 ?auto_313035 ?auto_313044 ?auto_313042 )
      ( MAKE-2CRATE ?auto_313037 ?auto_313035 ?auto_313036 )
      ( MAKE-1CRATE-VERIFY ?auto_313035 ?auto_313036 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_313045 - SURFACE
      ?auto_313046 - SURFACE
      ?auto_313047 - SURFACE
    )
    :vars
    (
      ?auto_313050 - HOIST
      ?auto_313052 - PLACE
      ?auto_313054 - PLACE
      ?auto_313053 - HOIST
      ?auto_313051 - SURFACE
      ?auto_313049 - TRUCK
      ?auto_313048 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313050 ?auto_313052 ) ( IS-CRATE ?auto_313047 ) ( not ( = ?auto_313046 ?auto_313047 ) ) ( not ( = ?auto_313045 ?auto_313046 ) ) ( not ( = ?auto_313045 ?auto_313047 ) ) ( not ( = ?auto_313054 ?auto_313052 ) ) ( HOIST-AT ?auto_313053 ?auto_313054 ) ( not ( = ?auto_313050 ?auto_313053 ) ) ( SURFACE-AT ?auto_313047 ?auto_313054 ) ( ON ?auto_313047 ?auto_313051 ) ( CLEAR ?auto_313047 ) ( not ( = ?auto_313046 ?auto_313051 ) ) ( not ( = ?auto_313047 ?auto_313051 ) ) ( not ( = ?auto_313045 ?auto_313051 ) ) ( SURFACE-AT ?auto_313045 ?auto_313052 ) ( CLEAR ?auto_313045 ) ( IS-CRATE ?auto_313046 ) ( AVAILABLE ?auto_313050 ) ( TRUCK-AT ?auto_313049 ?auto_313054 ) ( AVAILABLE ?auto_313053 ) ( SURFACE-AT ?auto_313046 ?auto_313054 ) ( ON ?auto_313046 ?auto_313048 ) ( CLEAR ?auto_313046 ) ( not ( = ?auto_313046 ?auto_313048 ) ) ( not ( = ?auto_313047 ?auto_313048 ) ) ( not ( = ?auto_313045 ?auto_313048 ) ) ( not ( = ?auto_313051 ?auto_313048 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_313046 ?auto_313047 )
      ( MAKE-2CRATE-VERIFY ?auto_313045 ?auto_313046 ?auto_313047 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_313055 - SURFACE
      ?auto_313056 - SURFACE
      ?auto_313057 - SURFACE
      ?auto_313058 - SURFACE
    )
    :vars
    (
      ?auto_313063 - HOIST
      ?auto_313059 - PLACE
      ?auto_313062 - PLACE
      ?auto_313064 - HOIST
      ?auto_313060 - SURFACE
      ?auto_313065 - TRUCK
      ?auto_313061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313063 ?auto_313059 ) ( IS-CRATE ?auto_313058 ) ( not ( = ?auto_313057 ?auto_313058 ) ) ( not ( = ?auto_313056 ?auto_313057 ) ) ( not ( = ?auto_313056 ?auto_313058 ) ) ( not ( = ?auto_313062 ?auto_313059 ) ) ( HOIST-AT ?auto_313064 ?auto_313062 ) ( not ( = ?auto_313063 ?auto_313064 ) ) ( SURFACE-AT ?auto_313058 ?auto_313062 ) ( ON ?auto_313058 ?auto_313060 ) ( CLEAR ?auto_313058 ) ( not ( = ?auto_313057 ?auto_313060 ) ) ( not ( = ?auto_313058 ?auto_313060 ) ) ( not ( = ?auto_313056 ?auto_313060 ) ) ( SURFACE-AT ?auto_313056 ?auto_313059 ) ( CLEAR ?auto_313056 ) ( IS-CRATE ?auto_313057 ) ( AVAILABLE ?auto_313063 ) ( TRUCK-AT ?auto_313065 ?auto_313062 ) ( AVAILABLE ?auto_313064 ) ( SURFACE-AT ?auto_313057 ?auto_313062 ) ( ON ?auto_313057 ?auto_313061 ) ( CLEAR ?auto_313057 ) ( not ( = ?auto_313057 ?auto_313061 ) ) ( not ( = ?auto_313058 ?auto_313061 ) ) ( not ( = ?auto_313056 ?auto_313061 ) ) ( not ( = ?auto_313060 ?auto_313061 ) ) ( ON ?auto_313056 ?auto_313055 ) ( not ( = ?auto_313055 ?auto_313056 ) ) ( not ( = ?auto_313055 ?auto_313057 ) ) ( not ( = ?auto_313055 ?auto_313058 ) ) ( not ( = ?auto_313055 ?auto_313060 ) ) ( not ( = ?auto_313055 ?auto_313061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313056 ?auto_313057 ?auto_313058 )
      ( MAKE-3CRATE-VERIFY ?auto_313055 ?auto_313056 ?auto_313057 ?auto_313058 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_313066 - SURFACE
      ?auto_313067 - SURFACE
      ?auto_313068 - SURFACE
      ?auto_313070 - SURFACE
      ?auto_313069 - SURFACE
    )
    :vars
    (
      ?auto_313075 - HOIST
      ?auto_313071 - PLACE
      ?auto_313074 - PLACE
      ?auto_313076 - HOIST
      ?auto_313072 - SURFACE
      ?auto_313077 - TRUCK
      ?auto_313073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313075 ?auto_313071 ) ( IS-CRATE ?auto_313069 ) ( not ( = ?auto_313070 ?auto_313069 ) ) ( not ( = ?auto_313068 ?auto_313070 ) ) ( not ( = ?auto_313068 ?auto_313069 ) ) ( not ( = ?auto_313074 ?auto_313071 ) ) ( HOIST-AT ?auto_313076 ?auto_313074 ) ( not ( = ?auto_313075 ?auto_313076 ) ) ( SURFACE-AT ?auto_313069 ?auto_313074 ) ( ON ?auto_313069 ?auto_313072 ) ( CLEAR ?auto_313069 ) ( not ( = ?auto_313070 ?auto_313072 ) ) ( not ( = ?auto_313069 ?auto_313072 ) ) ( not ( = ?auto_313068 ?auto_313072 ) ) ( SURFACE-AT ?auto_313068 ?auto_313071 ) ( CLEAR ?auto_313068 ) ( IS-CRATE ?auto_313070 ) ( AVAILABLE ?auto_313075 ) ( TRUCK-AT ?auto_313077 ?auto_313074 ) ( AVAILABLE ?auto_313076 ) ( SURFACE-AT ?auto_313070 ?auto_313074 ) ( ON ?auto_313070 ?auto_313073 ) ( CLEAR ?auto_313070 ) ( not ( = ?auto_313070 ?auto_313073 ) ) ( not ( = ?auto_313069 ?auto_313073 ) ) ( not ( = ?auto_313068 ?auto_313073 ) ) ( not ( = ?auto_313072 ?auto_313073 ) ) ( ON ?auto_313067 ?auto_313066 ) ( ON ?auto_313068 ?auto_313067 ) ( not ( = ?auto_313066 ?auto_313067 ) ) ( not ( = ?auto_313066 ?auto_313068 ) ) ( not ( = ?auto_313066 ?auto_313070 ) ) ( not ( = ?auto_313066 ?auto_313069 ) ) ( not ( = ?auto_313066 ?auto_313072 ) ) ( not ( = ?auto_313066 ?auto_313073 ) ) ( not ( = ?auto_313067 ?auto_313068 ) ) ( not ( = ?auto_313067 ?auto_313070 ) ) ( not ( = ?auto_313067 ?auto_313069 ) ) ( not ( = ?auto_313067 ?auto_313072 ) ) ( not ( = ?auto_313067 ?auto_313073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313068 ?auto_313070 ?auto_313069 )
      ( MAKE-4CRATE-VERIFY ?auto_313066 ?auto_313067 ?auto_313068 ?auto_313070 ?auto_313069 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_313078 - SURFACE
      ?auto_313079 - SURFACE
      ?auto_313080 - SURFACE
      ?auto_313082 - SURFACE
      ?auto_313081 - SURFACE
      ?auto_313083 - SURFACE
    )
    :vars
    (
      ?auto_313088 - HOIST
      ?auto_313084 - PLACE
      ?auto_313087 - PLACE
      ?auto_313089 - HOIST
      ?auto_313085 - SURFACE
      ?auto_313090 - TRUCK
      ?auto_313086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313088 ?auto_313084 ) ( IS-CRATE ?auto_313083 ) ( not ( = ?auto_313081 ?auto_313083 ) ) ( not ( = ?auto_313082 ?auto_313081 ) ) ( not ( = ?auto_313082 ?auto_313083 ) ) ( not ( = ?auto_313087 ?auto_313084 ) ) ( HOIST-AT ?auto_313089 ?auto_313087 ) ( not ( = ?auto_313088 ?auto_313089 ) ) ( SURFACE-AT ?auto_313083 ?auto_313087 ) ( ON ?auto_313083 ?auto_313085 ) ( CLEAR ?auto_313083 ) ( not ( = ?auto_313081 ?auto_313085 ) ) ( not ( = ?auto_313083 ?auto_313085 ) ) ( not ( = ?auto_313082 ?auto_313085 ) ) ( SURFACE-AT ?auto_313082 ?auto_313084 ) ( CLEAR ?auto_313082 ) ( IS-CRATE ?auto_313081 ) ( AVAILABLE ?auto_313088 ) ( TRUCK-AT ?auto_313090 ?auto_313087 ) ( AVAILABLE ?auto_313089 ) ( SURFACE-AT ?auto_313081 ?auto_313087 ) ( ON ?auto_313081 ?auto_313086 ) ( CLEAR ?auto_313081 ) ( not ( = ?auto_313081 ?auto_313086 ) ) ( not ( = ?auto_313083 ?auto_313086 ) ) ( not ( = ?auto_313082 ?auto_313086 ) ) ( not ( = ?auto_313085 ?auto_313086 ) ) ( ON ?auto_313079 ?auto_313078 ) ( ON ?auto_313080 ?auto_313079 ) ( ON ?auto_313082 ?auto_313080 ) ( not ( = ?auto_313078 ?auto_313079 ) ) ( not ( = ?auto_313078 ?auto_313080 ) ) ( not ( = ?auto_313078 ?auto_313082 ) ) ( not ( = ?auto_313078 ?auto_313081 ) ) ( not ( = ?auto_313078 ?auto_313083 ) ) ( not ( = ?auto_313078 ?auto_313085 ) ) ( not ( = ?auto_313078 ?auto_313086 ) ) ( not ( = ?auto_313079 ?auto_313080 ) ) ( not ( = ?auto_313079 ?auto_313082 ) ) ( not ( = ?auto_313079 ?auto_313081 ) ) ( not ( = ?auto_313079 ?auto_313083 ) ) ( not ( = ?auto_313079 ?auto_313085 ) ) ( not ( = ?auto_313079 ?auto_313086 ) ) ( not ( = ?auto_313080 ?auto_313082 ) ) ( not ( = ?auto_313080 ?auto_313081 ) ) ( not ( = ?auto_313080 ?auto_313083 ) ) ( not ( = ?auto_313080 ?auto_313085 ) ) ( not ( = ?auto_313080 ?auto_313086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313082 ?auto_313081 ?auto_313083 )
      ( MAKE-5CRATE-VERIFY ?auto_313078 ?auto_313079 ?auto_313080 ?auto_313082 ?auto_313081 ?auto_313083 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_313091 - SURFACE
      ?auto_313092 - SURFACE
      ?auto_313093 - SURFACE
      ?auto_313095 - SURFACE
      ?auto_313094 - SURFACE
      ?auto_313096 - SURFACE
      ?auto_313097 - SURFACE
    )
    :vars
    (
      ?auto_313102 - HOIST
      ?auto_313098 - PLACE
      ?auto_313101 - PLACE
      ?auto_313103 - HOIST
      ?auto_313099 - SURFACE
      ?auto_313104 - TRUCK
      ?auto_313100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313102 ?auto_313098 ) ( IS-CRATE ?auto_313097 ) ( not ( = ?auto_313096 ?auto_313097 ) ) ( not ( = ?auto_313094 ?auto_313096 ) ) ( not ( = ?auto_313094 ?auto_313097 ) ) ( not ( = ?auto_313101 ?auto_313098 ) ) ( HOIST-AT ?auto_313103 ?auto_313101 ) ( not ( = ?auto_313102 ?auto_313103 ) ) ( SURFACE-AT ?auto_313097 ?auto_313101 ) ( ON ?auto_313097 ?auto_313099 ) ( CLEAR ?auto_313097 ) ( not ( = ?auto_313096 ?auto_313099 ) ) ( not ( = ?auto_313097 ?auto_313099 ) ) ( not ( = ?auto_313094 ?auto_313099 ) ) ( SURFACE-AT ?auto_313094 ?auto_313098 ) ( CLEAR ?auto_313094 ) ( IS-CRATE ?auto_313096 ) ( AVAILABLE ?auto_313102 ) ( TRUCK-AT ?auto_313104 ?auto_313101 ) ( AVAILABLE ?auto_313103 ) ( SURFACE-AT ?auto_313096 ?auto_313101 ) ( ON ?auto_313096 ?auto_313100 ) ( CLEAR ?auto_313096 ) ( not ( = ?auto_313096 ?auto_313100 ) ) ( not ( = ?auto_313097 ?auto_313100 ) ) ( not ( = ?auto_313094 ?auto_313100 ) ) ( not ( = ?auto_313099 ?auto_313100 ) ) ( ON ?auto_313092 ?auto_313091 ) ( ON ?auto_313093 ?auto_313092 ) ( ON ?auto_313095 ?auto_313093 ) ( ON ?auto_313094 ?auto_313095 ) ( not ( = ?auto_313091 ?auto_313092 ) ) ( not ( = ?auto_313091 ?auto_313093 ) ) ( not ( = ?auto_313091 ?auto_313095 ) ) ( not ( = ?auto_313091 ?auto_313094 ) ) ( not ( = ?auto_313091 ?auto_313096 ) ) ( not ( = ?auto_313091 ?auto_313097 ) ) ( not ( = ?auto_313091 ?auto_313099 ) ) ( not ( = ?auto_313091 ?auto_313100 ) ) ( not ( = ?auto_313092 ?auto_313093 ) ) ( not ( = ?auto_313092 ?auto_313095 ) ) ( not ( = ?auto_313092 ?auto_313094 ) ) ( not ( = ?auto_313092 ?auto_313096 ) ) ( not ( = ?auto_313092 ?auto_313097 ) ) ( not ( = ?auto_313092 ?auto_313099 ) ) ( not ( = ?auto_313092 ?auto_313100 ) ) ( not ( = ?auto_313093 ?auto_313095 ) ) ( not ( = ?auto_313093 ?auto_313094 ) ) ( not ( = ?auto_313093 ?auto_313096 ) ) ( not ( = ?auto_313093 ?auto_313097 ) ) ( not ( = ?auto_313093 ?auto_313099 ) ) ( not ( = ?auto_313093 ?auto_313100 ) ) ( not ( = ?auto_313095 ?auto_313094 ) ) ( not ( = ?auto_313095 ?auto_313096 ) ) ( not ( = ?auto_313095 ?auto_313097 ) ) ( not ( = ?auto_313095 ?auto_313099 ) ) ( not ( = ?auto_313095 ?auto_313100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313094 ?auto_313096 ?auto_313097 )
      ( MAKE-6CRATE-VERIFY ?auto_313091 ?auto_313092 ?auto_313093 ?auto_313095 ?auto_313094 ?auto_313096 ?auto_313097 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_313105 - SURFACE
      ?auto_313106 - SURFACE
      ?auto_313107 - SURFACE
      ?auto_313109 - SURFACE
      ?auto_313108 - SURFACE
      ?auto_313110 - SURFACE
      ?auto_313111 - SURFACE
      ?auto_313112 - SURFACE
    )
    :vars
    (
      ?auto_313117 - HOIST
      ?auto_313113 - PLACE
      ?auto_313116 - PLACE
      ?auto_313118 - HOIST
      ?auto_313114 - SURFACE
      ?auto_313119 - TRUCK
      ?auto_313115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313117 ?auto_313113 ) ( IS-CRATE ?auto_313112 ) ( not ( = ?auto_313111 ?auto_313112 ) ) ( not ( = ?auto_313110 ?auto_313111 ) ) ( not ( = ?auto_313110 ?auto_313112 ) ) ( not ( = ?auto_313116 ?auto_313113 ) ) ( HOIST-AT ?auto_313118 ?auto_313116 ) ( not ( = ?auto_313117 ?auto_313118 ) ) ( SURFACE-AT ?auto_313112 ?auto_313116 ) ( ON ?auto_313112 ?auto_313114 ) ( CLEAR ?auto_313112 ) ( not ( = ?auto_313111 ?auto_313114 ) ) ( not ( = ?auto_313112 ?auto_313114 ) ) ( not ( = ?auto_313110 ?auto_313114 ) ) ( SURFACE-AT ?auto_313110 ?auto_313113 ) ( CLEAR ?auto_313110 ) ( IS-CRATE ?auto_313111 ) ( AVAILABLE ?auto_313117 ) ( TRUCK-AT ?auto_313119 ?auto_313116 ) ( AVAILABLE ?auto_313118 ) ( SURFACE-AT ?auto_313111 ?auto_313116 ) ( ON ?auto_313111 ?auto_313115 ) ( CLEAR ?auto_313111 ) ( not ( = ?auto_313111 ?auto_313115 ) ) ( not ( = ?auto_313112 ?auto_313115 ) ) ( not ( = ?auto_313110 ?auto_313115 ) ) ( not ( = ?auto_313114 ?auto_313115 ) ) ( ON ?auto_313106 ?auto_313105 ) ( ON ?auto_313107 ?auto_313106 ) ( ON ?auto_313109 ?auto_313107 ) ( ON ?auto_313108 ?auto_313109 ) ( ON ?auto_313110 ?auto_313108 ) ( not ( = ?auto_313105 ?auto_313106 ) ) ( not ( = ?auto_313105 ?auto_313107 ) ) ( not ( = ?auto_313105 ?auto_313109 ) ) ( not ( = ?auto_313105 ?auto_313108 ) ) ( not ( = ?auto_313105 ?auto_313110 ) ) ( not ( = ?auto_313105 ?auto_313111 ) ) ( not ( = ?auto_313105 ?auto_313112 ) ) ( not ( = ?auto_313105 ?auto_313114 ) ) ( not ( = ?auto_313105 ?auto_313115 ) ) ( not ( = ?auto_313106 ?auto_313107 ) ) ( not ( = ?auto_313106 ?auto_313109 ) ) ( not ( = ?auto_313106 ?auto_313108 ) ) ( not ( = ?auto_313106 ?auto_313110 ) ) ( not ( = ?auto_313106 ?auto_313111 ) ) ( not ( = ?auto_313106 ?auto_313112 ) ) ( not ( = ?auto_313106 ?auto_313114 ) ) ( not ( = ?auto_313106 ?auto_313115 ) ) ( not ( = ?auto_313107 ?auto_313109 ) ) ( not ( = ?auto_313107 ?auto_313108 ) ) ( not ( = ?auto_313107 ?auto_313110 ) ) ( not ( = ?auto_313107 ?auto_313111 ) ) ( not ( = ?auto_313107 ?auto_313112 ) ) ( not ( = ?auto_313107 ?auto_313114 ) ) ( not ( = ?auto_313107 ?auto_313115 ) ) ( not ( = ?auto_313109 ?auto_313108 ) ) ( not ( = ?auto_313109 ?auto_313110 ) ) ( not ( = ?auto_313109 ?auto_313111 ) ) ( not ( = ?auto_313109 ?auto_313112 ) ) ( not ( = ?auto_313109 ?auto_313114 ) ) ( not ( = ?auto_313109 ?auto_313115 ) ) ( not ( = ?auto_313108 ?auto_313110 ) ) ( not ( = ?auto_313108 ?auto_313111 ) ) ( not ( = ?auto_313108 ?auto_313112 ) ) ( not ( = ?auto_313108 ?auto_313114 ) ) ( not ( = ?auto_313108 ?auto_313115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313110 ?auto_313111 ?auto_313112 )
      ( MAKE-7CRATE-VERIFY ?auto_313105 ?auto_313106 ?auto_313107 ?auto_313109 ?auto_313108 ?auto_313110 ?auto_313111 ?auto_313112 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_313120 - SURFACE
      ?auto_313121 - SURFACE
      ?auto_313122 - SURFACE
      ?auto_313124 - SURFACE
      ?auto_313123 - SURFACE
      ?auto_313125 - SURFACE
      ?auto_313126 - SURFACE
      ?auto_313127 - SURFACE
      ?auto_313128 - SURFACE
    )
    :vars
    (
      ?auto_313133 - HOIST
      ?auto_313129 - PLACE
      ?auto_313132 - PLACE
      ?auto_313134 - HOIST
      ?auto_313130 - SURFACE
      ?auto_313135 - TRUCK
      ?auto_313131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313133 ?auto_313129 ) ( IS-CRATE ?auto_313128 ) ( not ( = ?auto_313127 ?auto_313128 ) ) ( not ( = ?auto_313126 ?auto_313127 ) ) ( not ( = ?auto_313126 ?auto_313128 ) ) ( not ( = ?auto_313132 ?auto_313129 ) ) ( HOIST-AT ?auto_313134 ?auto_313132 ) ( not ( = ?auto_313133 ?auto_313134 ) ) ( SURFACE-AT ?auto_313128 ?auto_313132 ) ( ON ?auto_313128 ?auto_313130 ) ( CLEAR ?auto_313128 ) ( not ( = ?auto_313127 ?auto_313130 ) ) ( not ( = ?auto_313128 ?auto_313130 ) ) ( not ( = ?auto_313126 ?auto_313130 ) ) ( SURFACE-AT ?auto_313126 ?auto_313129 ) ( CLEAR ?auto_313126 ) ( IS-CRATE ?auto_313127 ) ( AVAILABLE ?auto_313133 ) ( TRUCK-AT ?auto_313135 ?auto_313132 ) ( AVAILABLE ?auto_313134 ) ( SURFACE-AT ?auto_313127 ?auto_313132 ) ( ON ?auto_313127 ?auto_313131 ) ( CLEAR ?auto_313127 ) ( not ( = ?auto_313127 ?auto_313131 ) ) ( not ( = ?auto_313128 ?auto_313131 ) ) ( not ( = ?auto_313126 ?auto_313131 ) ) ( not ( = ?auto_313130 ?auto_313131 ) ) ( ON ?auto_313121 ?auto_313120 ) ( ON ?auto_313122 ?auto_313121 ) ( ON ?auto_313124 ?auto_313122 ) ( ON ?auto_313123 ?auto_313124 ) ( ON ?auto_313125 ?auto_313123 ) ( ON ?auto_313126 ?auto_313125 ) ( not ( = ?auto_313120 ?auto_313121 ) ) ( not ( = ?auto_313120 ?auto_313122 ) ) ( not ( = ?auto_313120 ?auto_313124 ) ) ( not ( = ?auto_313120 ?auto_313123 ) ) ( not ( = ?auto_313120 ?auto_313125 ) ) ( not ( = ?auto_313120 ?auto_313126 ) ) ( not ( = ?auto_313120 ?auto_313127 ) ) ( not ( = ?auto_313120 ?auto_313128 ) ) ( not ( = ?auto_313120 ?auto_313130 ) ) ( not ( = ?auto_313120 ?auto_313131 ) ) ( not ( = ?auto_313121 ?auto_313122 ) ) ( not ( = ?auto_313121 ?auto_313124 ) ) ( not ( = ?auto_313121 ?auto_313123 ) ) ( not ( = ?auto_313121 ?auto_313125 ) ) ( not ( = ?auto_313121 ?auto_313126 ) ) ( not ( = ?auto_313121 ?auto_313127 ) ) ( not ( = ?auto_313121 ?auto_313128 ) ) ( not ( = ?auto_313121 ?auto_313130 ) ) ( not ( = ?auto_313121 ?auto_313131 ) ) ( not ( = ?auto_313122 ?auto_313124 ) ) ( not ( = ?auto_313122 ?auto_313123 ) ) ( not ( = ?auto_313122 ?auto_313125 ) ) ( not ( = ?auto_313122 ?auto_313126 ) ) ( not ( = ?auto_313122 ?auto_313127 ) ) ( not ( = ?auto_313122 ?auto_313128 ) ) ( not ( = ?auto_313122 ?auto_313130 ) ) ( not ( = ?auto_313122 ?auto_313131 ) ) ( not ( = ?auto_313124 ?auto_313123 ) ) ( not ( = ?auto_313124 ?auto_313125 ) ) ( not ( = ?auto_313124 ?auto_313126 ) ) ( not ( = ?auto_313124 ?auto_313127 ) ) ( not ( = ?auto_313124 ?auto_313128 ) ) ( not ( = ?auto_313124 ?auto_313130 ) ) ( not ( = ?auto_313124 ?auto_313131 ) ) ( not ( = ?auto_313123 ?auto_313125 ) ) ( not ( = ?auto_313123 ?auto_313126 ) ) ( not ( = ?auto_313123 ?auto_313127 ) ) ( not ( = ?auto_313123 ?auto_313128 ) ) ( not ( = ?auto_313123 ?auto_313130 ) ) ( not ( = ?auto_313123 ?auto_313131 ) ) ( not ( = ?auto_313125 ?auto_313126 ) ) ( not ( = ?auto_313125 ?auto_313127 ) ) ( not ( = ?auto_313125 ?auto_313128 ) ) ( not ( = ?auto_313125 ?auto_313130 ) ) ( not ( = ?auto_313125 ?auto_313131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313126 ?auto_313127 ?auto_313128 )
      ( MAKE-8CRATE-VERIFY ?auto_313120 ?auto_313121 ?auto_313122 ?auto_313124 ?auto_313123 ?auto_313125 ?auto_313126 ?auto_313127 ?auto_313128 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_313136 - SURFACE
      ?auto_313137 - SURFACE
      ?auto_313138 - SURFACE
      ?auto_313140 - SURFACE
      ?auto_313139 - SURFACE
      ?auto_313141 - SURFACE
      ?auto_313142 - SURFACE
      ?auto_313143 - SURFACE
      ?auto_313144 - SURFACE
      ?auto_313145 - SURFACE
    )
    :vars
    (
      ?auto_313150 - HOIST
      ?auto_313146 - PLACE
      ?auto_313149 - PLACE
      ?auto_313151 - HOIST
      ?auto_313147 - SURFACE
      ?auto_313152 - TRUCK
      ?auto_313148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313150 ?auto_313146 ) ( IS-CRATE ?auto_313145 ) ( not ( = ?auto_313144 ?auto_313145 ) ) ( not ( = ?auto_313143 ?auto_313144 ) ) ( not ( = ?auto_313143 ?auto_313145 ) ) ( not ( = ?auto_313149 ?auto_313146 ) ) ( HOIST-AT ?auto_313151 ?auto_313149 ) ( not ( = ?auto_313150 ?auto_313151 ) ) ( SURFACE-AT ?auto_313145 ?auto_313149 ) ( ON ?auto_313145 ?auto_313147 ) ( CLEAR ?auto_313145 ) ( not ( = ?auto_313144 ?auto_313147 ) ) ( not ( = ?auto_313145 ?auto_313147 ) ) ( not ( = ?auto_313143 ?auto_313147 ) ) ( SURFACE-AT ?auto_313143 ?auto_313146 ) ( CLEAR ?auto_313143 ) ( IS-CRATE ?auto_313144 ) ( AVAILABLE ?auto_313150 ) ( TRUCK-AT ?auto_313152 ?auto_313149 ) ( AVAILABLE ?auto_313151 ) ( SURFACE-AT ?auto_313144 ?auto_313149 ) ( ON ?auto_313144 ?auto_313148 ) ( CLEAR ?auto_313144 ) ( not ( = ?auto_313144 ?auto_313148 ) ) ( not ( = ?auto_313145 ?auto_313148 ) ) ( not ( = ?auto_313143 ?auto_313148 ) ) ( not ( = ?auto_313147 ?auto_313148 ) ) ( ON ?auto_313137 ?auto_313136 ) ( ON ?auto_313138 ?auto_313137 ) ( ON ?auto_313140 ?auto_313138 ) ( ON ?auto_313139 ?auto_313140 ) ( ON ?auto_313141 ?auto_313139 ) ( ON ?auto_313142 ?auto_313141 ) ( ON ?auto_313143 ?auto_313142 ) ( not ( = ?auto_313136 ?auto_313137 ) ) ( not ( = ?auto_313136 ?auto_313138 ) ) ( not ( = ?auto_313136 ?auto_313140 ) ) ( not ( = ?auto_313136 ?auto_313139 ) ) ( not ( = ?auto_313136 ?auto_313141 ) ) ( not ( = ?auto_313136 ?auto_313142 ) ) ( not ( = ?auto_313136 ?auto_313143 ) ) ( not ( = ?auto_313136 ?auto_313144 ) ) ( not ( = ?auto_313136 ?auto_313145 ) ) ( not ( = ?auto_313136 ?auto_313147 ) ) ( not ( = ?auto_313136 ?auto_313148 ) ) ( not ( = ?auto_313137 ?auto_313138 ) ) ( not ( = ?auto_313137 ?auto_313140 ) ) ( not ( = ?auto_313137 ?auto_313139 ) ) ( not ( = ?auto_313137 ?auto_313141 ) ) ( not ( = ?auto_313137 ?auto_313142 ) ) ( not ( = ?auto_313137 ?auto_313143 ) ) ( not ( = ?auto_313137 ?auto_313144 ) ) ( not ( = ?auto_313137 ?auto_313145 ) ) ( not ( = ?auto_313137 ?auto_313147 ) ) ( not ( = ?auto_313137 ?auto_313148 ) ) ( not ( = ?auto_313138 ?auto_313140 ) ) ( not ( = ?auto_313138 ?auto_313139 ) ) ( not ( = ?auto_313138 ?auto_313141 ) ) ( not ( = ?auto_313138 ?auto_313142 ) ) ( not ( = ?auto_313138 ?auto_313143 ) ) ( not ( = ?auto_313138 ?auto_313144 ) ) ( not ( = ?auto_313138 ?auto_313145 ) ) ( not ( = ?auto_313138 ?auto_313147 ) ) ( not ( = ?auto_313138 ?auto_313148 ) ) ( not ( = ?auto_313140 ?auto_313139 ) ) ( not ( = ?auto_313140 ?auto_313141 ) ) ( not ( = ?auto_313140 ?auto_313142 ) ) ( not ( = ?auto_313140 ?auto_313143 ) ) ( not ( = ?auto_313140 ?auto_313144 ) ) ( not ( = ?auto_313140 ?auto_313145 ) ) ( not ( = ?auto_313140 ?auto_313147 ) ) ( not ( = ?auto_313140 ?auto_313148 ) ) ( not ( = ?auto_313139 ?auto_313141 ) ) ( not ( = ?auto_313139 ?auto_313142 ) ) ( not ( = ?auto_313139 ?auto_313143 ) ) ( not ( = ?auto_313139 ?auto_313144 ) ) ( not ( = ?auto_313139 ?auto_313145 ) ) ( not ( = ?auto_313139 ?auto_313147 ) ) ( not ( = ?auto_313139 ?auto_313148 ) ) ( not ( = ?auto_313141 ?auto_313142 ) ) ( not ( = ?auto_313141 ?auto_313143 ) ) ( not ( = ?auto_313141 ?auto_313144 ) ) ( not ( = ?auto_313141 ?auto_313145 ) ) ( not ( = ?auto_313141 ?auto_313147 ) ) ( not ( = ?auto_313141 ?auto_313148 ) ) ( not ( = ?auto_313142 ?auto_313143 ) ) ( not ( = ?auto_313142 ?auto_313144 ) ) ( not ( = ?auto_313142 ?auto_313145 ) ) ( not ( = ?auto_313142 ?auto_313147 ) ) ( not ( = ?auto_313142 ?auto_313148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313143 ?auto_313144 ?auto_313145 )
      ( MAKE-9CRATE-VERIFY ?auto_313136 ?auto_313137 ?auto_313138 ?auto_313140 ?auto_313139 ?auto_313141 ?auto_313142 ?auto_313143 ?auto_313144 ?auto_313145 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_313153 - SURFACE
      ?auto_313154 - SURFACE
      ?auto_313155 - SURFACE
      ?auto_313157 - SURFACE
      ?auto_313156 - SURFACE
      ?auto_313158 - SURFACE
      ?auto_313159 - SURFACE
      ?auto_313160 - SURFACE
      ?auto_313161 - SURFACE
      ?auto_313162 - SURFACE
      ?auto_313163 - SURFACE
    )
    :vars
    (
      ?auto_313168 - HOIST
      ?auto_313164 - PLACE
      ?auto_313167 - PLACE
      ?auto_313169 - HOIST
      ?auto_313165 - SURFACE
      ?auto_313170 - TRUCK
      ?auto_313166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313168 ?auto_313164 ) ( IS-CRATE ?auto_313163 ) ( not ( = ?auto_313162 ?auto_313163 ) ) ( not ( = ?auto_313161 ?auto_313162 ) ) ( not ( = ?auto_313161 ?auto_313163 ) ) ( not ( = ?auto_313167 ?auto_313164 ) ) ( HOIST-AT ?auto_313169 ?auto_313167 ) ( not ( = ?auto_313168 ?auto_313169 ) ) ( SURFACE-AT ?auto_313163 ?auto_313167 ) ( ON ?auto_313163 ?auto_313165 ) ( CLEAR ?auto_313163 ) ( not ( = ?auto_313162 ?auto_313165 ) ) ( not ( = ?auto_313163 ?auto_313165 ) ) ( not ( = ?auto_313161 ?auto_313165 ) ) ( SURFACE-AT ?auto_313161 ?auto_313164 ) ( CLEAR ?auto_313161 ) ( IS-CRATE ?auto_313162 ) ( AVAILABLE ?auto_313168 ) ( TRUCK-AT ?auto_313170 ?auto_313167 ) ( AVAILABLE ?auto_313169 ) ( SURFACE-AT ?auto_313162 ?auto_313167 ) ( ON ?auto_313162 ?auto_313166 ) ( CLEAR ?auto_313162 ) ( not ( = ?auto_313162 ?auto_313166 ) ) ( not ( = ?auto_313163 ?auto_313166 ) ) ( not ( = ?auto_313161 ?auto_313166 ) ) ( not ( = ?auto_313165 ?auto_313166 ) ) ( ON ?auto_313154 ?auto_313153 ) ( ON ?auto_313155 ?auto_313154 ) ( ON ?auto_313157 ?auto_313155 ) ( ON ?auto_313156 ?auto_313157 ) ( ON ?auto_313158 ?auto_313156 ) ( ON ?auto_313159 ?auto_313158 ) ( ON ?auto_313160 ?auto_313159 ) ( ON ?auto_313161 ?auto_313160 ) ( not ( = ?auto_313153 ?auto_313154 ) ) ( not ( = ?auto_313153 ?auto_313155 ) ) ( not ( = ?auto_313153 ?auto_313157 ) ) ( not ( = ?auto_313153 ?auto_313156 ) ) ( not ( = ?auto_313153 ?auto_313158 ) ) ( not ( = ?auto_313153 ?auto_313159 ) ) ( not ( = ?auto_313153 ?auto_313160 ) ) ( not ( = ?auto_313153 ?auto_313161 ) ) ( not ( = ?auto_313153 ?auto_313162 ) ) ( not ( = ?auto_313153 ?auto_313163 ) ) ( not ( = ?auto_313153 ?auto_313165 ) ) ( not ( = ?auto_313153 ?auto_313166 ) ) ( not ( = ?auto_313154 ?auto_313155 ) ) ( not ( = ?auto_313154 ?auto_313157 ) ) ( not ( = ?auto_313154 ?auto_313156 ) ) ( not ( = ?auto_313154 ?auto_313158 ) ) ( not ( = ?auto_313154 ?auto_313159 ) ) ( not ( = ?auto_313154 ?auto_313160 ) ) ( not ( = ?auto_313154 ?auto_313161 ) ) ( not ( = ?auto_313154 ?auto_313162 ) ) ( not ( = ?auto_313154 ?auto_313163 ) ) ( not ( = ?auto_313154 ?auto_313165 ) ) ( not ( = ?auto_313154 ?auto_313166 ) ) ( not ( = ?auto_313155 ?auto_313157 ) ) ( not ( = ?auto_313155 ?auto_313156 ) ) ( not ( = ?auto_313155 ?auto_313158 ) ) ( not ( = ?auto_313155 ?auto_313159 ) ) ( not ( = ?auto_313155 ?auto_313160 ) ) ( not ( = ?auto_313155 ?auto_313161 ) ) ( not ( = ?auto_313155 ?auto_313162 ) ) ( not ( = ?auto_313155 ?auto_313163 ) ) ( not ( = ?auto_313155 ?auto_313165 ) ) ( not ( = ?auto_313155 ?auto_313166 ) ) ( not ( = ?auto_313157 ?auto_313156 ) ) ( not ( = ?auto_313157 ?auto_313158 ) ) ( not ( = ?auto_313157 ?auto_313159 ) ) ( not ( = ?auto_313157 ?auto_313160 ) ) ( not ( = ?auto_313157 ?auto_313161 ) ) ( not ( = ?auto_313157 ?auto_313162 ) ) ( not ( = ?auto_313157 ?auto_313163 ) ) ( not ( = ?auto_313157 ?auto_313165 ) ) ( not ( = ?auto_313157 ?auto_313166 ) ) ( not ( = ?auto_313156 ?auto_313158 ) ) ( not ( = ?auto_313156 ?auto_313159 ) ) ( not ( = ?auto_313156 ?auto_313160 ) ) ( not ( = ?auto_313156 ?auto_313161 ) ) ( not ( = ?auto_313156 ?auto_313162 ) ) ( not ( = ?auto_313156 ?auto_313163 ) ) ( not ( = ?auto_313156 ?auto_313165 ) ) ( not ( = ?auto_313156 ?auto_313166 ) ) ( not ( = ?auto_313158 ?auto_313159 ) ) ( not ( = ?auto_313158 ?auto_313160 ) ) ( not ( = ?auto_313158 ?auto_313161 ) ) ( not ( = ?auto_313158 ?auto_313162 ) ) ( not ( = ?auto_313158 ?auto_313163 ) ) ( not ( = ?auto_313158 ?auto_313165 ) ) ( not ( = ?auto_313158 ?auto_313166 ) ) ( not ( = ?auto_313159 ?auto_313160 ) ) ( not ( = ?auto_313159 ?auto_313161 ) ) ( not ( = ?auto_313159 ?auto_313162 ) ) ( not ( = ?auto_313159 ?auto_313163 ) ) ( not ( = ?auto_313159 ?auto_313165 ) ) ( not ( = ?auto_313159 ?auto_313166 ) ) ( not ( = ?auto_313160 ?auto_313161 ) ) ( not ( = ?auto_313160 ?auto_313162 ) ) ( not ( = ?auto_313160 ?auto_313163 ) ) ( not ( = ?auto_313160 ?auto_313165 ) ) ( not ( = ?auto_313160 ?auto_313166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313161 ?auto_313162 ?auto_313163 )
      ( MAKE-10CRATE-VERIFY ?auto_313153 ?auto_313154 ?auto_313155 ?auto_313157 ?auto_313156 ?auto_313158 ?auto_313159 ?auto_313160 ?auto_313161 ?auto_313162 ?auto_313163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_313171 - SURFACE
      ?auto_313172 - SURFACE
    )
    :vars
    (
      ?auto_313178 - HOIST
      ?auto_313173 - PLACE
      ?auto_313174 - SURFACE
      ?auto_313177 - PLACE
      ?auto_313179 - HOIST
      ?auto_313175 - SURFACE
      ?auto_313176 - SURFACE
      ?auto_313180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313178 ?auto_313173 ) ( IS-CRATE ?auto_313172 ) ( not ( = ?auto_313171 ?auto_313172 ) ) ( not ( = ?auto_313174 ?auto_313171 ) ) ( not ( = ?auto_313174 ?auto_313172 ) ) ( not ( = ?auto_313177 ?auto_313173 ) ) ( HOIST-AT ?auto_313179 ?auto_313177 ) ( not ( = ?auto_313178 ?auto_313179 ) ) ( SURFACE-AT ?auto_313172 ?auto_313177 ) ( ON ?auto_313172 ?auto_313175 ) ( CLEAR ?auto_313172 ) ( not ( = ?auto_313171 ?auto_313175 ) ) ( not ( = ?auto_313172 ?auto_313175 ) ) ( not ( = ?auto_313174 ?auto_313175 ) ) ( SURFACE-AT ?auto_313174 ?auto_313173 ) ( CLEAR ?auto_313174 ) ( IS-CRATE ?auto_313171 ) ( AVAILABLE ?auto_313178 ) ( AVAILABLE ?auto_313179 ) ( SURFACE-AT ?auto_313171 ?auto_313177 ) ( ON ?auto_313171 ?auto_313176 ) ( CLEAR ?auto_313171 ) ( not ( = ?auto_313171 ?auto_313176 ) ) ( not ( = ?auto_313172 ?auto_313176 ) ) ( not ( = ?auto_313174 ?auto_313176 ) ) ( not ( = ?auto_313175 ?auto_313176 ) ) ( TRUCK-AT ?auto_313180 ?auto_313173 ) )
    :subtasks
    ( ( !DRIVE ?auto_313180 ?auto_313173 ?auto_313177 )
      ( MAKE-2CRATE ?auto_313174 ?auto_313171 ?auto_313172 )
      ( MAKE-1CRATE-VERIFY ?auto_313171 ?auto_313172 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_313181 - SURFACE
      ?auto_313182 - SURFACE
      ?auto_313183 - SURFACE
    )
    :vars
    (
      ?auto_313190 - HOIST
      ?auto_313189 - PLACE
      ?auto_313187 - PLACE
      ?auto_313184 - HOIST
      ?auto_313185 - SURFACE
      ?auto_313188 - SURFACE
      ?auto_313186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313190 ?auto_313189 ) ( IS-CRATE ?auto_313183 ) ( not ( = ?auto_313182 ?auto_313183 ) ) ( not ( = ?auto_313181 ?auto_313182 ) ) ( not ( = ?auto_313181 ?auto_313183 ) ) ( not ( = ?auto_313187 ?auto_313189 ) ) ( HOIST-AT ?auto_313184 ?auto_313187 ) ( not ( = ?auto_313190 ?auto_313184 ) ) ( SURFACE-AT ?auto_313183 ?auto_313187 ) ( ON ?auto_313183 ?auto_313185 ) ( CLEAR ?auto_313183 ) ( not ( = ?auto_313182 ?auto_313185 ) ) ( not ( = ?auto_313183 ?auto_313185 ) ) ( not ( = ?auto_313181 ?auto_313185 ) ) ( SURFACE-AT ?auto_313181 ?auto_313189 ) ( CLEAR ?auto_313181 ) ( IS-CRATE ?auto_313182 ) ( AVAILABLE ?auto_313190 ) ( AVAILABLE ?auto_313184 ) ( SURFACE-AT ?auto_313182 ?auto_313187 ) ( ON ?auto_313182 ?auto_313188 ) ( CLEAR ?auto_313182 ) ( not ( = ?auto_313182 ?auto_313188 ) ) ( not ( = ?auto_313183 ?auto_313188 ) ) ( not ( = ?auto_313181 ?auto_313188 ) ) ( not ( = ?auto_313185 ?auto_313188 ) ) ( TRUCK-AT ?auto_313186 ?auto_313189 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_313182 ?auto_313183 )
      ( MAKE-2CRATE-VERIFY ?auto_313181 ?auto_313182 ?auto_313183 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_313191 - SURFACE
      ?auto_313192 - SURFACE
      ?auto_313193 - SURFACE
      ?auto_313194 - SURFACE
    )
    :vars
    (
      ?auto_313197 - HOIST
      ?auto_313196 - PLACE
      ?auto_313195 - PLACE
      ?auto_313201 - HOIST
      ?auto_313200 - SURFACE
      ?auto_313198 - SURFACE
      ?auto_313199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313197 ?auto_313196 ) ( IS-CRATE ?auto_313194 ) ( not ( = ?auto_313193 ?auto_313194 ) ) ( not ( = ?auto_313192 ?auto_313193 ) ) ( not ( = ?auto_313192 ?auto_313194 ) ) ( not ( = ?auto_313195 ?auto_313196 ) ) ( HOIST-AT ?auto_313201 ?auto_313195 ) ( not ( = ?auto_313197 ?auto_313201 ) ) ( SURFACE-AT ?auto_313194 ?auto_313195 ) ( ON ?auto_313194 ?auto_313200 ) ( CLEAR ?auto_313194 ) ( not ( = ?auto_313193 ?auto_313200 ) ) ( not ( = ?auto_313194 ?auto_313200 ) ) ( not ( = ?auto_313192 ?auto_313200 ) ) ( SURFACE-AT ?auto_313192 ?auto_313196 ) ( CLEAR ?auto_313192 ) ( IS-CRATE ?auto_313193 ) ( AVAILABLE ?auto_313197 ) ( AVAILABLE ?auto_313201 ) ( SURFACE-AT ?auto_313193 ?auto_313195 ) ( ON ?auto_313193 ?auto_313198 ) ( CLEAR ?auto_313193 ) ( not ( = ?auto_313193 ?auto_313198 ) ) ( not ( = ?auto_313194 ?auto_313198 ) ) ( not ( = ?auto_313192 ?auto_313198 ) ) ( not ( = ?auto_313200 ?auto_313198 ) ) ( TRUCK-AT ?auto_313199 ?auto_313196 ) ( ON ?auto_313192 ?auto_313191 ) ( not ( = ?auto_313191 ?auto_313192 ) ) ( not ( = ?auto_313191 ?auto_313193 ) ) ( not ( = ?auto_313191 ?auto_313194 ) ) ( not ( = ?auto_313191 ?auto_313200 ) ) ( not ( = ?auto_313191 ?auto_313198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313192 ?auto_313193 ?auto_313194 )
      ( MAKE-3CRATE-VERIFY ?auto_313191 ?auto_313192 ?auto_313193 ?auto_313194 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_313202 - SURFACE
      ?auto_313203 - SURFACE
      ?auto_313204 - SURFACE
      ?auto_313206 - SURFACE
      ?auto_313205 - SURFACE
    )
    :vars
    (
      ?auto_313209 - HOIST
      ?auto_313208 - PLACE
      ?auto_313207 - PLACE
      ?auto_313213 - HOIST
      ?auto_313212 - SURFACE
      ?auto_313210 - SURFACE
      ?auto_313211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313209 ?auto_313208 ) ( IS-CRATE ?auto_313205 ) ( not ( = ?auto_313206 ?auto_313205 ) ) ( not ( = ?auto_313204 ?auto_313206 ) ) ( not ( = ?auto_313204 ?auto_313205 ) ) ( not ( = ?auto_313207 ?auto_313208 ) ) ( HOIST-AT ?auto_313213 ?auto_313207 ) ( not ( = ?auto_313209 ?auto_313213 ) ) ( SURFACE-AT ?auto_313205 ?auto_313207 ) ( ON ?auto_313205 ?auto_313212 ) ( CLEAR ?auto_313205 ) ( not ( = ?auto_313206 ?auto_313212 ) ) ( not ( = ?auto_313205 ?auto_313212 ) ) ( not ( = ?auto_313204 ?auto_313212 ) ) ( SURFACE-AT ?auto_313204 ?auto_313208 ) ( CLEAR ?auto_313204 ) ( IS-CRATE ?auto_313206 ) ( AVAILABLE ?auto_313209 ) ( AVAILABLE ?auto_313213 ) ( SURFACE-AT ?auto_313206 ?auto_313207 ) ( ON ?auto_313206 ?auto_313210 ) ( CLEAR ?auto_313206 ) ( not ( = ?auto_313206 ?auto_313210 ) ) ( not ( = ?auto_313205 ?auto_313210 ) ) ( not ( = ?auto_313204 ?auto_313210 ) ) ( not ( = ?auto_313212 ?auto_313210 ) ) ( TRUCK-AT ?auto_313211 ?auto_313208 ) ( ON ?auto_313203 ?auto_313202 ) ( ON ?auto_313204 ?auto_313203 ) ( not ( = ?auto_313202 ?auto_313203 ) ) ( not ( = ?auto_313202 ?auto_313204 ) ) ( not ( = ?auto_313202 ?auto_313206 ) ) ( not ( = ?auto_313202 ?auto_313205 ) ) ( not ( = ?auto_313202 ?auto_313212 ) ) ( not ( = ?auto_313202 ?auto_313210 ) ) ( not ( = ?auto_313203 ?auto_313204 ) ) ( not ( = ?auto_313203 ?auto_313206 ) ) ( not ( = ?auto_313203 ?auto_313205 ) ) ( not ( = ?auto_313203 ?auto_313212 ) ) ( not ( = ?auto_313203 ?auto_313210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313204 ?auto_313206 ?auto_313205 )
      ( MAKE-4CRATE-VERIFY ?auto_313202 ?auto_313203 ?auto_313204 ?auto_313206 ?auto_313205 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_313214 - SURFACE
      ?auto_313215 - SURFACE
      ?auto_313216 - SURFACE
      ?auto_313218 - SURFACE
      ?auto_313217 - SURFACE
      ?auto_313219 - SURFACE
    )
    :vars
    (
      ?auto_313222 - HOIST
      ?auto_313221 - PLACE
      ?auto_313220 - PLACE
      ?auto_313226 - HOIST
      ?auto_313225 - SURFACE
      ?auto_313223 - SURFACE
      ?auto_313224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313222 ?auto_313221 ) ( IS-CRATE ?auto_313219 ) ( not ( = ?auto_313217 ?auto_313219 ) ) ( not ( = ?auto_313218 ?auto_313217 ) ) ( not ( = ?auto_313218 ?auto_313219 ) ) ( not ( = ?auto_313220 ?auto_313221 ) ) ( HOIST-AT ?auto_313226 ?auto_313220 ) ( not ( = ?auto_313222 ?auto_313226 ) ) ( SURFACE-AT ?auto_313219 ?auto_313220 ) ( ON ?auto_313219 ?auto_313225 ) ( CLEAR ?auto_313219 ) ( not ( = ?auto_313217 ?auto_313225 ) ) ( not ( = ?auto_313219 ?auto_313225 ) ) ( not ( = ?auto_313218 ?auto_313225 ) ) ( SURFACE-AT ?auto_313218 ?auto_313221 ) ( CLEAR ?auto_313218 ) ( IS-CRATE ?auto_313217 ) ( AVAILABLE ?auto_313222 ) ( AVAILABLE ?auto_313226 ) ( SURFACE-AT ?auto_313217 ?auto_313220 ) ( ON ?auto_313217 ?auto_313223 ) ( CLEAR ?auto_313217 ) ( not ( = ?auto_313217 ?auto_313223 ) ) ( not ( = ?auto_313219 ?auto_313223 ) ) ( not ( = ?auto_313218 ?auto_313223 ) ) ( not ( = ?auto_313225 ?auto_313223 ) ) ( TRUCK-AT ?auto_313224 ?auto_313221 ) ( ON ?auto_313215 ?auto_313214 ) ( ON ?auto_313216 ?auto_313215 ) ( ON ?auto_313218 ?auto_313216 ) ( not ( = ?auto_313214 ?auto_313215 ) ) ( not ( = ?auto_313214 ?auto_313216 ) ) ( not ( = ?auto_313214 ?auto_313218 ) ) ( not ( = ?auto_313214 ?auto_313217 ) ) ( not ( = ?auto_313214 ?auto_313219 ) ) ( not ( = ?auto_313214 ?auto_313225 ) ) ( not ( = ?auto_313214 ?auto_313223 ) ) ( not ( = ?auto_313215 ?auto_313216 ) ) ( not ( = ?auto_313215 ?auto_313218 ) ) ( not ( = ?auto_313215 ?auto_313217 ) ) ( not ( = ?auto_313215 ?auto_313219 ) ) ( not ( = ?auto_313215 ?auto_313225 ) ) ( not ( = ?auto_313215 ?auto_313223 ) ) ( not ( = ?auto_313216 ?auto_313218 ) ) ( not ( = ?auto_313216 ?auto_313217 ) ) ( not ( = ?auto_313216 ?auto_313219 ) ) ( not ( = ?auto_313216 ?auto_313225 ) ) ( not ( = ?auto_313216 ?auto_313223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313218 ?auto_313217 ?auto_313219 )
      ( MAKE-5CRATE-VERIFY ?auto_313214 ?auto_313215 ?auto_313216 ?auto_313218 ?auto_313217 ?auto_313219 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_313227 - SURFACE
      ?auto_313228 - SURFACE
      ?auto_313229 - SURFACE
      ?auto_313231 - SURFACE
      ?auto_313230 - SURFACE
      ?auto_313232 - SURFACE
      ?auto_313233 - SURFACE
    )
    :vars
    (
      ?auto_313236 - HOIST
      ?auto_313235 - PLACE
      ?auto_313234 - PLACE
      ?auto_313240 - HOIST
      ?auto_313239 - SURFACE
      ?auto_313237 - SURFACE
      ?auto_313238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313236 ?auto_313235 ) ( IS-CRATE ?auto_313233 ) ( not ( = ?auto_313232 ?auto_313233 ) ) ( not ( = ?auto_313230 ?auto_313232 ) ) ( not ( = ?auto_313230 ?auto_313233 ) ) ( not ( = ?auto_313234 ?auto_313235 ) ) ( HOIST-AT ?auto_313240 ?auto_313234 ) ( not ( = ?auto_313236 ?auto_313240 ) ) ( SURFACE-AT ?auto_313233 ?auto_313234 ) ( ON ?auto_313233 ?auto_313239 ) ( CLEAR ?auto_313233 ) ( not ( = ?auto_313232 ?auto_313239 ) ) ( not ( = ?auto_313233 ?auto_313239 ) ) ( not ( = ?auto_313230 ?auto_313239 ) ) ( SURFACE-AT ?auto_313230 ?auto_313235 ) ( CLEAR ?auto_313230 ) ( IS-CRATE ?auto_313232 ) ( AVAILABLE ?auto_313236 ) ( AVAILABLE ?auto_313240 ) ( SURFACE-AT ?auto_313232 ?auto_313234 ) ( ON ?auto_313232 ?auto_313237 ) ( CLEAR ?auto_313232 ) ( not ( = ?auto_313232 ?auto_313237 ) ) ( not ( = ?auto_313233 ?auto_313237 ) ) ( not ( = ?auto_313230 ?auto_313237 ) ) ( not ( = ?auto_313239 ?auto_313237 ) ) ( TRUCK-AT ?auto_313238 ?auto_313235 ) ( ON ?auto_313228 ?auto_313227 ) ( ON ?auto_313229 ?auto_313228 ) ( ON ?auto_313231 ?auto_313229 ) ( ON ?auto_313230 ?auto_313231 ) ( not ( = ?auto_313227 ?auto_313228 ) ) ( not ( = ?auto_313227 ?auto_313229 ) ) ( not ( = ?auto_313227 ?auto_313231 ) ) ( not ( = ?auto_313227 ?auto_313230 ) ) ( not ( = ?auto_313227 ?auto_313232 ) ) ( not ( = ?auto_313227 ?auto_313233 ) ) ( not ( = ?auto_313227 ?auto_313239 ) ) ( not ( = ?auto_313227 ?auto_313237 ) ) ( not ( = ?auto_313228 ?auto_313229 ) ) ( not ( = ?auto_313228 ?auto_313231 ) ) ( not ( = ?auto_313228 ?auto_313230 ) ) ( not ( = ?auto_313228 ?auto_313232 ) ) ( not ( = ?auto_313228 ?auto_313233 ) ) ( not ( = ?auto_313228 ?auto_313239 ) ) ( not ( = ?auto_313228 ?auto_313237 ) ) ( not ( = ?auto_313229 ?auto_313231 ) ) ( not ( = ?auto_313229 ?auto_313230 ) ) ( not ( = ?auto_313229 ?auto_313232 ) ) ( not ( = ?auto_313229 ?auto_313233 ) ) ( not ( = ?auto_313229 ?auto_313239 ) ) ( not ( = ?auto_313229 ?auto_313237 ) ) ( not ( = ?auto_313231 ?auto_313230 ) ) ( not ( = ?auto_313231 ?auto_313232 ) ) ( not ( = ?auto_313231 ?auto_313233 ) ) ( not ( = ?auto_313231 ?auto_313239 ) ) ( not ( = ?auto_313231 ?auto_313237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313230 ?auto_313232 ?auto_313233 )
      ( MAKE-6CRATE-VERIFY ?auto_313227 ?auto_313228 ?auto_313229 ?auto_313231 ?auto_313230 ?auto_313232 ?auto_313233 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_313241 - SURFACE
      ?auto_313242 - SURFACE
      ?auto_313243 - SURFACE
      ?auto_313245 - SURFACE
      ?auto_313244 - SURFACE
      ?auto_313246 - SURFACE
      ?auto_313247 - SURFACE
      ?auto_313248 - SURFACE
    )
    :vars
    (
      ?auto_313251 - HOIST
      ?auto_313250 - PLACE
      ?auto_313249 - PLACE
      ?auto_313255 - HOIST
      ?auto_313254 - SURFACE
      ?auto_313252 - SURFACE
      ?auto_313253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313251 ?auto_313250 ) ( IS-CRATE ?auto_313248 ) ( not ( = ?auto_313247 ?auto_313248 ) ) ( not ( = ?auto_313246 ?auto_313247 ) ) ( not ( = ?auto_313246 ?auto_313248 ) ) ( not ( = ?auto_313249 ?auto_313250 ) ) ( HOIST-AT ?auto_313255 ?auto_313249 ) ( not ( = ?auto_313251 ?auto_313255 ) ) ( SURFACE-AT ?auto_313248 ?auto_313249 ) ( ON ?auto_313248 ?auto_313254 ) ( CLEAR ?auto_313248 ) ( not ( = ?auto_313247 ?auto_313254 ) ) ( not ( = ?auto_313248 ?auto_313254 ) ) ( not ( = ?auto_313246 ?auto_313254 ) ) ( SURFACE-AT ?auto_313246 ?auto_313250 ) ( CLEAR ?auto_313246 ) ( IS-CRATE ?auto_313247 ) ( AVAILABLE ?auto_313251 ) ( AVAILABLE ?auto_313255 ) ( SURFACE-AT ?auto_313247 ?auto_313249 ) ( ON ?auto_313247 ?auto_313252 ) ( CLEAR ?auto_313247 ) ( not ( = ?auto_313247 ?auto_313252 ) ) ( not ( = ?auto_313248 ?auto_313252 ) ) ( not ( = ?auto_313246 ?auto_313252 ) ) ( not ( = ?auto_313254 ?auto_313252 ) ) ( TRUCK-AT ?auto_313253 ?auto_313250 ) ( ON ?auto_313242 ?auto_313241 ) ( ON ?auto_313243 ?auto_313242 ) ( ON ?auto_313245 ?auto_313243 ) ( ON ?auto_313244 ?auto_313245 ) ( ON ?auto_313246 ?auto_313244 ) ( not ( = ?auto_313241 ?auto_313242 ) ) ( not ( = ?auto_313241 ?auto_313243 ) ) ( not ( = ?auto_313241 ?auto_313245 ) ) ( not ( = ?auto_313241 ?auto_313244 ) ) ( not ( = ?auto_313241 ?auto_313246 ) ) ( not ( = ?auto_313241 ?auto_313247 ) ) ( not ( = ?auto_313241 ?auto_313248 ) ) ( not ( = ?auto_313241 ?auto_313254 ) ) ( not ( = ?auto_313241 ?auto_313252 ) ) ( not ( = ?auto_313242 ?auto_313243 ) ) ( not ( = ?auto_313242 ?auto_313245 ) ) ( not ( = ?auto_313242 ?auto_313244 ) ) ( not ( = ?auto_313242 ?auto_313246 ) ) ( not ( = ?auto_313242 ?auto_313247 ) ) ( not ( = ?auto_313242 ?auto_313248 ) ) ( not ( = ?auto_313242 ?auto_313254 ) ) ( not ( = ?auto_313242 ?auto_313252 ) ) ( not ( = ?auto_313243 ?auto_313245 ) ) ( not ( = ?auto_313243 ?auto_313244 ) ) ( not ( = ?auto_313243 ?auto_313246 ) ) ( not ( = ?auto_313243 ?auto_313247 ) ) ( not ( = ?auto_313243 ?auto_313248 ) ) ( not ( = ?auto_313243 ?auto_313254 ) ) ( not ( = ?auto_313243 ?auto_313252 ) ) ( not ( = ?auto_313245 ?auto_313244 ) ) ( not ( = ?auto_313245 ?auto_313246 ) ) ( not ( = ?auto_313245 ?auto_313247 ) ) ( not ( = ?auto_313245 ?auto_313248 ) ) ( not ( = ?auto_313245 ?auto_313254 ) ) ( not ( = ?auto_313245 ?auto_313252 ) ) ( not ( = ?auto_313244 ?auto_313246 ) ) ( not ( = ?auto_313244 ?auto_313247 ) ) ( not ( = ?auto_313244 ?auto_313248 ) ) ( not ( = ?auto_313244 ?auto_313254 ) ) ( not ( = ?auto_313244 ?auto_313252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313246 ?auto_313247 ?auto_313248 )
      ( MAKE-7CRATE-VERIFY ?auto_313241 ?auto_313242 ?auto_313243 ?auto_313245 ?auto_313244 ?auto_313246 ?auto_313247 ?auto_313248 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_313256 - SURFACE
      ?auto_313257 - SURFACE
      ?auto_313258 - SURFACE
      ?auto_313260 - SURFACE
      ?auto_313259 - SURFACE
      ?auto_313261 - SURFACE
      ?auto_313262 - SURFACE
      ?auto_313263 - SURFACE
      ?auto_313264 - SURFACE
    )
    :vars
    (
      ?auto_313267 - HOIST
      ?auto_313266 - PLACE
      ?auto_313265 - PLACE
      ?auto_313271 - HOIST
      ?auto_313270 - SURFACE
      ?auto_313268 - SURFACE
      ?auto_313269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313267 ?auto_313266 ) ( IS-CRATE ?auto_313264 ) ( not ( = ?auto_313263 ?auto_313264 ) ) ( not ( = ?auto_313262 ?auto_313263 ) ) ( not ( = ?auto_313262 ?auto_313264 ) ) ( not ( = ?auto_313265 ?auto_313266 ) ) ( HOIST-AT ?auto_313271 ?auto_313265 ) ( not ( = ?auto_313267 ?auto_313271 ) ) ( SURFACE-AT ?auto_313264 ?auto_313265 ) ( ON ?auto_313264 ?auto_313270 ) ( CLEAR ?auto_313264 ) ( not ( = ?auto_313263 ?auto_313270 ) ) ( not ( = ?auto_313264 ?auto_313270 ) ) ( not ( = ?auto_313262 ?auto_313270 ) ) ( SURFACE-AT ?auto_313262 ?auto_313266 ) ( CLEAR ?auto_313262 ) ( IS-CRATE ?auto_313263 ) ( AVAILABLE ?auto_313267 ) ( AVAILABLE ?auto_313271 ) ( SURFACE-AT ?auto_313263 ?auto_313265 ) ( ON ?auto_313263 ?auto_313268 ) ( CLEAR ?auto_313263 ) ( not ( = ?auto_313263 ?auto_313268 ) ) ( not ( = ?auto_313264 ?auto_313268 ) ) ( not ( = ?auto_313262 ?auto_313268 ) ) ( not ( = ?auto_313270 ?auto_313268 ) ) ( TRUCK-AT ?auto_313269 ?auto_313266 ) ( ON ?auto_313257 ?auto_313256 ) ( ON ?auto_313258 ?auto_313257 ) ( ON ?auto_313260 ?auto_313258 ) ( ON ?auto_313259 ?auto_313260 ) ( ON ?auto_313261 ?auto_313259 ) ( ON ?auto_313262 ?auto_313261 ) ( not ( = ?auto_313256 ?auto_313257 ) ) ( not ( = ?auto_313256 ?auto_313258 ) ) ( not ( = ?auto_313256 ?auto_313260 ) ) ( not ( = ?auto_313256 ?auto_313259 ) ) ( not ( = ?auto_313256 ?auto_313261 ) ) ( not ( = ?auto_313256 ?auto_313262 ) ) ( not ( = ?auto_313256 ?auto_313263 ) ) ( not ( = ?auto_313256 ?auto_313264 ) ) ( not ( = ?auto_313256 ?auto_313270 ) ) ( not ( = ?auto_313256 ?auto_313268 ) ) ( not ( = ?auto_313257 ?auto_313258 ) ) ( not ( = ?auto_313257 ?auto_313260 ) ) ( not ( = ?auto_313257 ?auto_313259 ) ) ( not ( = ?auto_313257 ?auto_313261 ) ) ( not ( = ?auto_313257 ?auto_313262 ) ) ( not ( = ?auto_313257 ?auto_313263 ) ) ( not ( = ?auto_313257 ?auto_313264 ) ) ( not ( = ?auto_313257 ?auto_313270 ) ) ( not ( = ?auto_313257 ?auto_313268 ) ) ( not ( = ?auto_313258 ?auto_313260 ) ) ( not ( = ?auto_313258 ?auto_313259 ) ) ( not ( = ?auto_313258 ?auto_313261 ) ) ( not ( = ?auto_313258 ?auto_313262 ) ) ( not ( = ?auto_313258 ?auto_313263 ) ) ( not ( = ?auto_313258 ?auto_313264 ) ) ( not ( = ?auto_313258 ?auto_313270 ) ) ( not ( = ?auto_313258 ?auto_313268 ) ) ( not ( = ?auto_313260 ?auto_313259 ) ) ( not ( = ?auto_313260 ?auto_313261 ) ) ( not ( = ?auto_313260 ?auto_313262 ) ) ( not ( = ?auto_313260 ?auto_313263 ) ) ( not ( = ?auto_313260 ?auto_313264 ) ) ( not ( = ?auto_313260 ?auto_313270 ) ) ( not ( = ?auto_313260 ?auto_313268 ) ) ( not ( = ?auto_313259 ?auto_313261 ) ) ( not ( = ?auto_313259 ?auto_313262 ) ) ( not ( = ?auto_313259 ?auto_313263 ) ) ( not ( = ?auto_313259 ?auto_313264 ) ) ( not ( = ?auto_313259 ?auto_313270 ) ) ( not ( = ?auto_313259 ?auto_313268 ) ) ( not ( = ?auto_313261 ?auto_313262 ) ) ( not ( = ?auto_313261 ?auto_313263 ) ) ( not ( = ?auto_313261 ?auto_313264 ) ) ( not ( = ?auto_313261 ?auto_313270 ) ) ( not ( = ?auto_313261 ?auto_313268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313262 ?auto_313263 ?auto_313264 )
      ( MAKE-8CRATE-VERIFY ?auto_313256 ?auto_313257 ?auto_313258 ?auto_313260 ?auto_313259 ?auto_313261 ?auto_313262 ?auto_313263 ?auto_313264 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_313272 - SURFACE
      ?auto_313273 - SURFACE
      ?auto_313274 - SURFACE
      ?auto_313276 - SURFACE
      ?auto_313275 - SURFACE
      ?auto_313277 - SURFACE
      ?auto_313278 - SURFACE
      ?auto_313279 - SURFACE
      ?auto_313280 - SURFACE
      ?auto_313281 - SURFACE
    )
    :vars
    (
      ?auto_313284 - HOIST
      ?auto_313283 - PLACE
      ?auto_313282 - PLACE
      ?auto_313288 - HOIST
      ?auto_313287 - SURFACE
      ?auto_313285 - SURFACE
      ?auto_313286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313284 ?auto_313283 ) ( IS-CRATE ?auto_313281 ) ( not ( = ?auto_313280 ?auto_313281 ) ) ( not ( = ?auto_313279 ?auto_313280 ) ) ( not ( = ?auto_313279 ?auto_313281 ) ) ( not ( = ?auto_313282 ?auto_313283 ) ) ( HOIST-AT ?auto_313288 ?auto_313282 ) ( not ( = ?auto_313284 ?auto_313288 ) ) ( SURFACE-AT ?auto_313281 ?auto_313282 ) ( ON ?auto_313281 ?auto_313287 ) ( CLEAR ?auto_313281 ) ( not ( = ?auto_313280 ?auto_313287 ) ) ( not ( = ?auto_313281 ?auto_313287 ) ) ( not ( = ?auto_313279 ?auto_313287 ) ) ( SURFACE-AT ?auto_313279 ?auto_313283 ) ( CLEAR ?auto_313279 ) ( IS-CRATE ?auto_313280 ) ( AVAILABLE ?auto_313284 ) ( AVAILABLE ?auto_313288 ) ( SURFACE-AT ?auto_313280 ?auto_313282 ) ( ON ?auto_313280 ?auto_313285 ) ( CLEAR ?auto_313280 ) ( not ( = ?auto_313280 ?auto_313285 ) ) ( not ( = ?auto_313281 ?auto_313285 ) ) ( not ( = ?auto_313279 ?auto_313285 ) ) ( not ( = ?auto_313287 ?auto_313285 ) ) ( TRUCK-AT ?auto_313286 ?auto_313283 ) ( ON ?auto_313273 ?auto_313272 ) ( ON ?auto_313274 ?auto_313273 ) ( ON ?auto_313276 ?auto_313274 ) ( ON ?auto_313275 ?auto_313276 ) ( ON ?auto_313277 ?auto_313275 ) ( ON ?auto_313278 ?auto_313277 ) ( ON ?auto_313279 ?auto_313278 ) ( not ( = ?auto_313272 ?auto_313273 ) ) ( not ( = ?auto_313272 ?auto_313274 ) ) ( not ( = ?auto_313272 ?auto_313276 ) ) ( not ( = ?auto_313272 ?auto_313275 ) ) ( not ( = ?auto_313272 ?auto_313277 ) ) ( not ( = ?auto_313272 ?auto_313278 ) ) ( not ( = ?auto_313272 ?auto_313279 ) ) ( not ( = ?auto_313272 ?auto_313280 ) ) ( not ( = ?auto_313272 ?auto_313281 ) ) ( not ( = ?auto_313272 ?auto_313287 ) ) ( not ( = ?auto_313272 ?auto_313285 ) ) ( not ( = ?auto_313273 ?auto_313274 ) ) ( not ( = ?auto_313273 ?auto_313276 ) ) ( not ( = ?auto_313273 ?auto_313275 ) ) ( not ( = ?auto_313273 ?auto_313277 ) ) ( not ( = ?auto_313273 ?auto_313278 ) ) ( not ( = ?auto_313273 ?auto_313279 ) ) ( not ( = ?auto_313273 ?auto_313280 ) ) ( not ( = ?auto_313273 ?auto_313281 ) ) ( not ( = ?auto_313273 ?auto_313287 ) ) ( not ( = ?auto_313273 ?auto_313285 ) ) ( not ( = ?auto_313274 ?auto_313276 ) ) ( not ( = ?auto_313274 ?auto_313275 ) ) ( not ( = ?auto_313274 ?auto_313277 ) ) ( not ( = ?auto_313274 ?auto_313278 ) ) ( not ( = ?auto_313274 ?auto_313279 ) ) ( not ( = ?auto_313274 ?auto_313280 ) ) ( not ( = ?auto_313274 ?auto_313281 ) ) ( not ( = ?auto_313274 ?auto_313287 ) ) ( not ( = ?auto_313274 ?auto_313285 ) ) ( not ( = ?auto_313276 ?auto_313275 ) ) ( not ( = ?auto_313276 ?auto_313277 ) ) ( not ( = ?auto_313276 ?auto_313278 ) ) ( not ( = ?auto_313276 ?auto_313279 ) ) ( not ( = ?auto_313276 ?auto_313280 ) ) ( not ( = ?auto_313276 ?auto_313281 ) ) ( not ( = ?auto_313276 ?auto_313287 ) ) ( not ( = ?auto_313276 ?auto_313285 ) ) ( not ( = ?auto_313275 ?auto_313277 ) ) ( not ( = ?auto_313275 ?auto_313278 ) ) ( not ( = ?auto_313275 ?auto_313279 ) ) ( not ( = ?auto_313275 ?auto_313280 ) ) ( not ( = ?auto_313275 ?auto_313281 ) ) ( not ( = ?auto_313275 ?auto_313287 ) ) ( not ( = ?auto_313275 ?auto_313285 ) ) ( not ( = ?auto_313277 ?auto_313278 ) ) ( not ( = ?auto_313277 ?auto_313279 ) ) ( not ( = ?auto_313277 ?auto_313280 ) ) ( not ( = ?auto_313277 ?auto_313281 ) ) ( not ( = ?auto_313277 ?auto_313287 ) ) ( not ( = ?auto_313277 ?auto_313285 ) ) ( not ( = ?auto_313278 ?auto_313279 ) ) ( not ( = ?auto_313278 ?auto_313280 ) ) ( not ( = ?auto_313278 ?auto_313281 ) ) ( not ( = ?auto_313278 ?auto_313287 ) ) ( not ( = ?auto_313278 ?auto_313285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313279 ?auto_313280 ?auto_313281 )
      ( MAKE-9CRATE-VERIFY ?auto_313272 ?auto_313273 ?auto_313274 ?auto_313276 ?auto_313275 ?auto_313277 ?auto_313278 ?auto_313279 ?auto_313280 ?auto_313281 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_313289 - SURFACE
      ?auto_313290 - SURFACE
      ?auto_313291 - SURFACE
      ?auto_313293 - SURFACE
      ?auto_313292 - SURFACE
      ?auto_313294 - SURFACE
      ?auto_313295 - SURFACE
      ?auto_313296 - SURFACE
      ?auto_313297 - SURFACE
      ?auto_313298 - SURFACE
      ?auto_313299 - SURFACE
    )
    :vars
    (
      ?auto_313302 - HOIST
      ?auto_313301 - PLACE
      ?auto_313300 - PLACE
      ?auto_313306 - HOIST
      ?auto_313305 - SURFACE
      ?auto_313303 - SURFACE
      ?auto_313304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313302 ?auto_313301 ) ( IS-CRATE ?auto_313299 ) ( not ( = ?auto_313298 ?auto_313299 ) ) ( not ( = ?auto_313297 ?auto_313298 ) ) ( not ( = ?auto_313297 ?auto_313299 ) ) ( not ( = ?auto_313300 ?auto_313301 ) ) ( HOIST-AT ?auto_313306 ?auto_313300 ) ( not ( = ?auto_313302 ?auto_313306 ) ) ( SURFACE-AT ?auto_313299 ?auto_313300 ) ( ON ?auto_313299 ?auto_313305 ) ( CLEAR ?auto_313299 ) ( not ( = ?auto_313298 ?auto_313305 ) ) ( not ( = ?auto_313299 ?auto_313305 ) ) ( not ( = ?auto_313297 ?auto_313305 ) ) ( SURFACE-AT ?auto_313297 ?auto_313301 ) ( CLEAR ?auto_313297 ) ( IS-CRATE ?auto_313298 ) ( AVAILABLE ?auto_313302 ) ( AVAILABLE ?auto_313306 ) ( SURFACE-AT ?auto_313298 ?auto_313300 ) ( ON ?auto_313298 ?auto_313303 ) ( CLEAR ?auto_313298 ) ( not ( = ?auto_313298 ?auto_313303 ) ) ( not ( = ?auto_313299 ?auto_313303 ) ) ( not ( = ?auto_313297 ?auto_313303 ) ) ( not ( = ?auto_313305 ?auto_313303 ) ) ( TRUCK-AT ?auto_313304 ?auto_313301 ) ( ON ?auto_313290 ?auto_313289 ) ( ON ?auto_313291 ?auto_313290 ) ( ON ?auto_313293 ?auto_313291 ) ( ON ?auto_313292 ?auto_313293 ) ( ON ?auto_313294 ?auto_313292 ) ( ON ?auto_313295 ?auto_313294 ) ( ON ?auto_313296 ?auto_313295 ) ( ON ?auto_313297 ?auto_313296 ) ( not ( = ?auto_313289 ?auto_313290 ) ) ( not ( = ?auto_313289 ?auto_313291 ) ) ( not ( = ?auto_313289 ?auto_313293 ) ) ( not ( = ?auto_313289 ?auto_313292 ) ) ( not ( = ?auto_313289 ?auto_313294 ) ) ( not ( = ?auto_313289 ?auto_313295 ) ) ( not ( = ?auto_313289 ?auto_313296 ) ) ( not ( = ?auto_313289 ?auto_313297 ) ) ( not ( = ?auto_313289 ?auto_313298 ) ) ( not ( = ?auto_313289 ?auto_313299 ) ) ( not ( = ?auto_313289 ?auto_313305 ) ) ( not ( = ?auto_313289 ?auto_313303 ) ) ( not ( = ?auto_313290 ?auto_313291 ) ) ( not ( = ?auto_313290 ?auto_313293 ) ) ( not ( = ?auto_313290 ?auto_313292 ) ) ( not ( = ?auto_313290 ?auto_313294 ) ) ( not ( = ?auto_313290 ?auto_313295 ) ) ( not ( = ?auto_313290 ?auto_313296 ) ) ( not ( = ?auto_313290 ?auto_313297 ) ) ( not ( = ?auto_313290 ?auto_313298 ) ) ( not ( = ?auto_313290 ?auto_313299 ) ) ( not ( = ?auto_313290 ?auto_313305 ) ) ( not ( = ?auto_313290 ?auto_313303 ) ) ( not ( = ?auto_313291 ?auto_313293 ) ) ( not ( = ?auto_313291 ?auto_313292 ) ) ( not ( = ?auto_313291 ?auto_313294 ) ) ( not ( = ?auto_313291 ?auto_313295 ) ) ( not ( = ?auto_313291 ?auto_313296 ) ) ( not ( = ?auto_313291 ?auto_313297 ) ) ( not ( = ?auto_313291 ?auto_313298 ) ) ( not ( = ?auto_313291 ?auto_313299 ) ) ( not ( = ?auto_313291 ?auto_313305 ) ) ( not ( = ?auto_313291 ?auto_313303 ) ) ( not ( = ?auto_313293 ?auto_313292 ) ) ( not ( = ?auto_313293 ?auto_313294 ) ) ( not ( = ?auto_313293 ?auto_313295 ) ) ( not ( = ?auto_313293 ?auto_313296 ) ) ( not ( = ?auto_313293 ?auto_313297 ) ) ( not ( = ?auto_313293 ?auto_313298 ) ) ( not ( = ?auto_313293 ?auto_313299 ) ) ( not ( = ?auto_313293 ?auto_313305 ) ) ( not ( = ?auto_313293 ?auto_313303 ) ) ( not ( = ?auto_313292 ?auto_313294 ) ) ( not ( = ?auto_313292 ?auto_313295 ) ) ( not ( = ?auto_313292 ?auto_313296 ) ) ( not ( = ?auto_313292 ?auto_313297 ) ) ( not ( = ?auto_313292 ?auto_313298 ) ) ( not ( = ?auto_313292 ?auto_313299 ) ) ( not ( = ?auto_313292 ?auto_313305 ) ) ( not ( = ?auto_313292 ?auto_313303 ) ) ( not ( = ?auto_313294 ?auto_313295 ) ) ( not ( = ?auto_313294 ?auto_313296 ) ) ( not ( = ?auto_313294 ?auto_313297 ) ) ( not ( = ?auto_313294 ?auto_313298 ) ) ( not ( = ?auto_313294 ?auto_313299 ) ) ( not ( = ?auto_313294 ?auto_313305 ) ) ( not ( = ?auto_313294 ?auto_313303 ) ) ( not ( = ?auto_313295 ?auto_313296 ) ) ( not ( = ?auto_313295 ?auto_313297 ) ) ( not ( = ?auto_313295 ?auto_313298 ) ) ( not ( = ?auto_313295 ?auto_313299 ) ) ( not ( = ?auto_313295 ?auto_313305 ) ) ( not ( = ?auto_313295 ?auto_313303 ) ) ( not ( = ?auto_313296 ?auto_313297 ) ) ( not ( = ?auto_313296 ?auto_313298 ) ) ( not ( = ?auto_313296 ?auto_313299 ) ) ( not ( = ?auto_313296 ?auto_313305 ) ) ( not ( = ?auto_313296 ?auto_313303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313297 ?auto_313298 ?auto_313299 )
      ( MAKE-10CRATE-VERIFY ?auto_313289 ?auto_313290 ?auto_313291 ?auto_313293 ?auto_313292 ?auto_313294 ?auto_313295 ?auto_313296 ?auto_313297 ?auto_313298 ?auto_313299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_313307 - SURFACE
      ?auto_313308 - SURFACE
    )
    :vars
    (
      ?auto_313312 - HOIST
      ?auto_313310 - PLACE
      ?auto_313311 - SURFACE
      ?auto_313309 - PLACE
      ?auto_313316 - HOIST
      ?auto_313315 - SURFACE
      ?auto_313313 - SURFACE
      ?auto_313314 - TRUCK
      ?auto_313317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313312 ?auto_313310 ) ( IS-CRATE ?auto_313308 ) ( not ( = ?auto_313307 ?auto_313308 ) ) ( not ( = ?auto_313311 ?auto_313307 ) ) ( not ( = ?auto_313311 ?auto_313308 ) ) ( not ( = ?auto_313309 ?auto_313310 ) ) ( HOIST-AT ?auto_313316 ?auto_313309 ) ( not ( = ?auto_313312 ?auto_313316 ) ) ( SURFACE-AT ?auto_313308 ?auto_313309 ) ( ON ?auto_313308 ?auto_313315 ) ( CLEAR ?auto_313308 ) ( not ( = ?auto_313307 ?auto_313315 ) ) ( not ( = ?auto_313308 ?auto_313315 ) ) ( not ( = ?auto_313311 ?auto_313315 ) ) ( IS-CRATE ?auto_313307 ) ( AVAILABLE ?auto_313316 ) ( SURFACE-AT ?auto_313307 ?auto_313309 ) ( ON ?auto_313307 ?auto_313313 ) ( CLEAR ?auto_313307 ) ( not ( = ?auto_313307 ?auto_313313 ) ) ( not ( = ?auto_313308 ?auto_313313 ) ) ( not ( = ?auto_313311 ?auto_313313 ) ) ( not ( = ?auto_313315 ?auto_313313 ) ) ( TRUCK-AT ?auto_313314 ?auto_313310 ) ( SURFACE-AT ?auto_313317 ?auto_313310 ) ( CLEAR ?auto_313317 ) ( LIFTING ?auto_313312 ?auto_313311 ) ( IS-CRATE ?auto_313311 ) ( not ( = ?auto_313317 ?auto_313311 ) ) ( not ( = ?auto_313307 ?auto_313317 ) ) ( not ( = ?auto_313308 ?auto_313317 ) ) ( not ( = ?auto_313315 ?auto_313317 ) ) ( not ( = ?auto_313313 ?auto_313317 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_313317 ?auto_313311 )
      ( MAKE-2CRATE ?auto_313311 ?auto_313307 ?auto_313308 )
      ( MAKE-1CRATE-VERIFY ?auto_313307 ?auto_313308 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_313318 - SURFACE
      ?auto_313319 - SURFACE
      ?auto_313320 - SURFACE
    )
    :vars
    (
      ?auto_313324 - HOIST
      ?auto_313326 - PLACE
      ?auto_313328 - PLACE
      ?auto_313322 - HOIST
      ?auto_313327 - SURFACE
      ?auto_313325 - SURFACE
      ?auto_313323 - TRUCK
      ?auto_313321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313324 ?auto_313326 ) ( IS-CRATE ?auto_313320 ) ( not ( = ?auto_313319 ?auto_313320 ) ) ( not ( = ?auto_313318 ?auto_313319 ) ) ( not ( = ?auto_313318 ?auto_313320 ) ) ( not ( = ?auto_313328 ?auto_313326 ) ) ( HOIST-AT ?auto_313322 ?auto_313328 ) ( not ( = ?auto_313324 ?auto_313322 ) ) ( SURFACE-AT ?auto_313320 ?auto_313328 ) ( ON ?auto_313320 ?auto_313327 ) ( CLEAR ?auto_313320 ) ( not ( = ?auto_313319 ?auto_313327 ) ) ( not ( = ?auto_313320 ?auto_313327 ) ) ( not ( = ?auto_313318 ?auto_313327 ) ) ( IS-CRATE ?auto_313319 ) ( AVAILABLE ?auto_313322 ) ( SURFACE-AT ?auto_313319 ?auto_313328 ) ( ON ?auto_313319 ?auto_313325 ) ( CLEAR ?auto_313319 ) ( not ( = ?auto_313319 ?auto_313325 ) ) ( not ( = ?auto_313320 ?auto_313325 ) ) ( not ( = ?auto_313318 ?auto_313325 ) ) ( not ( = ?auto_313327 ?auto_313325 ) ) ( TRUCK-AT ?auto_313323 ?auto_313326 ) ( SURFACE-AT ?auto_313321 ?auto_313326 ) ( CLEAR ?auto_313321 ) ( LIFTING ?auto_313324 ?auto_313318 ) ( IS-CRATE ?auto_313318 ) ( not ( = ?auto_313321 ?auto_313318 ) ) ( not ( = ?auto_313319 ?auto_313321 ) ) ( not ( = ?auto_313320 ?auto_313321 ) ) ( not ( = ?auto_313327 ?auto_313321 ) ) ( not ( = ?auto_313325 ?auto_313321 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_313319 ?auto_313320 )
      ( MAKE-2CRATE-VERIFY ?auto_313318 ?auto_313319 ?auto_313320 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_313329 - SURFACE
      ?auto_313330 - SURFACE
      ?auto_313331 - SURFACE
      ?auto_313332 - SURFACE
    )
    :vars
    (
      ?auto_313339 - HOIST
      ?auto_313334 - PLACE
      ?auto_313333 - PLACE
      ?auto_313335 - HOIST
      ?auto_313336 - SURFACE
      ?auto_313338 - SURFACE
      ?auto_313337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313339 ?auto_313334 ) ( IS-CRATE ?auto_313332 ) ( not ( = ?auto_313331 ?auto_313332 ) ) ( not ( = ?auto_313330 ?auto_313331 ) ) ( not ( = ?auto_313330 ?auto_313332 ) ) ( not ( = ?auto_313333 ?auto_313334 ) ) ( HOIST-AT ?auto_313335 ?auto_313333 ) ( not ( = ?auto_313339 ?auto_313335 ) ) ( SURFACE-AT ?auto_313332 ?auto_313333 ) ( ON ?auto_313332 ?auto_313336 ) ( CLEAR ?auto_313332 ) ( not ( = ?auto_313331 ?auto_313336 ) ) ( not ( = ?auto_313332 ?auto_313336 ) ) ( not ( = ?auto_313330 ?auto_313336 ) ) ( IS-CRATE ?auto_313331 ) ( AVAILABLE ?auto_313335 ) ( SURFACE-AT ?auto_313331 ?auto_313333 ) ( ON ?auto_313331 ?auto_313338 ) ( CLEAR ?auto_313331 ) ( not ( = ?auto_313331 ?auto_313338 ) ) ( not ( = ?auto_313332 ?auto_313338 ) ) ( not ( = ?auto_313330 ?auto_313338 ) ) ( not ( = ?auto_313336 ?auto_313338 ) ) ( TRUCK-AT ?auto_313337 ?auto_313334 ) ( SURFACE-AT ?auto_313329 ?auto_313334 ) ( CLEAR ?auto_313329 ) ( LIFTING ?auto_313339 ?auto_313330 ) ( IS-CRATE ?auto_313330 ) ( not ( = ?auto_313329 ?auto_313330 ) ) ( not ( = ?auto_313331 ?auto_313329 ) ) ( not ( = ?auto_313332 ?auto_313329 ) ) ( not ( = ?auto_313336 ?auto_313329 ) ) ( not ( = ?auto_313338 ?auto_313329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313330 ?auto_313331 ?auto_313332 )
      ( MAKE-3CRATE-VERIFY ?auto_313329 ?auto_313330 ?auto_313331 ?auto_313332 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_313340 - SURFACE
      ?auto_313341 - SURFACE
      ?auto_313342 - SURFACE
      ?auto_313344 - SURFACE
      ?auto_313343 - SURFACE
    )
    :vars
    (
      ?auto_313351 - HOIST
      ?auto_313346 - PLACE
      ?auto_313345 - PLACE
      ?auto_313347 - HOIST
      ?auto_313348 - SURFACE
      ?auto_313350 - SURFACE
      ?auto_313349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313351 ?auto_313346 ) ( IS-CRATE ?auto_313343 ) ( not ( = ?auto_313344 ?auto_313343 ) ) ( not ( = ?auto_313342 ?auto_313344 ) ) ( not ( = ?auto_313342 ?auto_313343 ) ) ( not ( = ?auto_313345 ?auto_313346 ) ) ( HOIST-AT ?auto_313347 ?auto_313345 ) ( not ( = ?auto_313351 ?auto_313347 ) ) ( SURFACE-AT ?auto_313343 ?auto_313345 ) ( ON ?auto_313343 ?auto_313348 ) ( CLEAR ?auto_313343 ) ( not ( = ?auto_313344 ?auto_313348 ) ) ( not ( = ?auto_313343 ?auto_313348 ) ) ( not ( = ?auto_313342 ?auto_313348 ) ) ( IS-CRATE ?auto_313344 ) ( AVAILABLE ?auto_313347 ) ( SURFACE-AT ?auto_313344 ?auto_313345 ) ( ON ?auto_313344 ?auto_313350 ) ( CLEAR ?auto_313344 ) ( not ( = ?auto_313344 ?auto_313350 ) ) ( not ( = ?auto_313343 ?auto_313350 ) ) ( not ( = ?auto_313342 ?auto_313350 ) ) ( not ( = ?auto_313348 ?auto_313350 ) ) ( TRUCK-AT ?auto_313349 ?auto_313346 ) ( SURFACE-AT ?auto_313341 ?auto_313346 ) ( CLEAR ?auto_313341 ) ( LIFTING ?auto_313351 ?auto_313342 ) ( IS-CRATE ?auto_313342 ) ( not ( = ?auto_313341 ?auto_313342 ) ) ( not ( = ?auto_313344 ?auto_313341 ) ) ( not ( = ?auto_313343 ?auto_313341 ) ) ( not ( = ?auto_313348 ?auto_313341 ) ) ( not ( = ?auto_313350 ?auto_313341 ) ) ( ON ?auto_313341 ?auto_313340 ) ( not ( = ?auto_313340 ?auto_313341 ) ) ( not ( = ?auto_313340 ?auto_313342 ) ) ( not ( = ?auto_313340 ?auto_313344 ) ) ( not ( = ?auto_313340 ?auto_313343 ) ) ( not ( = ?auto_313340 ?auto_313348 ) ) ( not ( = ?auto_313340 ?auto_313350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313342 ?auto_313344 ?auto_313343 )
      ( MAKE-4CRATE-VERIFY ?auto_313340 ?auto_313341 ?auto_313342 ?auto_313344 ?auto_313343 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_313352 - SURFACE
      ?auto_313353 - SURFACE
      ?auto_313354 - SURFACE
      ?auto_313356 - SURFACE
      ?auto_313355 - SURFACE
      ?auto_313357 - SURFACE
    )
    :vars
    (
      ?auto_313364 - HOIST
      ?auto_313359 - PLACE
      ?auto_313358 - PLACE
      ?auto_313360 - HOIST
      ?auto_313361 - SURFACE
      ?auto_313363 - SURFACE
      ?auto_313362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313364 ?auto_313359 ) ( IS-CRATE ?auto_313357 ) ( not ( = ?auto_313355 ?auto_313357 ) ) ( not ( = ?auto_313356 ?auto_313355 ) ) ( not ( = ?auto_313356 ?auto_313357 ) ) ( not ( = ?auto_313358 ?auto_313359 ) ) ( HOIST-AT ?auto_313360 ?auto_313358 ) ( not ( = ?auto_313364 ?auto_313360 ) ) ( SURFACE-AT ?auto_313357 ?auto_313358 ) ( ON ?auto_313357 ?auto_313361 ) ( CLEAR ?auto_313357 ) ( not ( = ?auto_313355 ?auto_313361 ) ) ( not ( = ?auto_313357 ?auto_313361 ) ) ( not ( = ?auto_313356 ?auto_313361 ) ) ( IS-CRATE ?auto_313355 ) ( AVAILABLE ?auto_313360 ) ( SURFACE-AT ?auto_313355 ?auto_313358 ) ( ON ?auto_313355 ?auto_313363 ) ( CLEAR ?auto_313355 ) ( not ( = ?auto_313355 ?auto_313363 ) ) ( not ( = ?auto_313357 ?auto_313363 ) ) ( not ( = ?auto_313356 ?auto_313363 ) ) ( not ( = ?auto_313361 ?auto_313363 ) ) ( TRUCK-AT ?auto_313362 ?auto_313359 ) ( SURFACE-AT ?auto_313354 ?auto_313359 ) ( CLEAR ?auto_313354 ) ( LIFTING ?auto_313364 ?auto_313356 ) ( IS-CRATE ?auto_313356 ) ( not ( = ?auto_313354 ?auto_313356 ) ) ( not ( = ?auto_313355 ?auto_313354 ) ) ( not ( = ?auto_313357 ?auto_313354 ) ) ( not ( = ?auto_313361 ?auto_313354 ) ) ( not ( = ?auto_313363 ?auto_313354 ) ) ( ON ?auto_313353 ?auto_313352 ) ( ON ?auto_313354 ?auto_313353 ) ( not ( = ?auto_313352 ?auto_313353 ) ) ( not ( = ?auto_313352 ?auto_313354 ) ) ( not ( = ?auto_313352 ?auto_313356 ) ) ( not ( = ?auto_313352 ?auto_313355 ) ) ( not ( = ?auto_313352 ?auto_313357 ) ) ( not ( = ?auto_313352 ?auto_313361 ) ) ( not ( = ?auto_313352 ?auto_313363 ) ) ( not ( = ?auto_313353 ?auto_313354 ) ) ( not ( = ?auto_313353 ?auto_313356 ) ) ( not ( = ?auto_313353 ?auto_313355 ) ) ( not ( = ?auto_313353 ?auto_313357 ) ) ( not ( = ?auto_313353 ?auto_313361 ) ) ( not ( = ?auto_313353 ?auto_313363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313356 ?auto_313355 ?auto_313357 )
      ( MAKE-5CRATE-VERIFY ?auto_313352 ?auto_313353 ?auto_313354 ?auto_313356 ?auto_313355 ?auto_313357 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_313365 - SURFACE
      ?auto_313366 - SURFACE
      ?auto_313367 - SURFACE
      ?auto_313369 - SURFACE
      ?auto_313368 - SURFACE
      ?auto_313370 - SURFACE
      ?auto_313371 - SURFACE
    )
    :vars
    (
      ?auto_313378 - HOIST
      ?auto_313373 - PLACE
      ?auto_313372 - PLACE
      ?auto_313374 - HOIST
      ?auto_313375 - SURFACE
      ?auto_313377 - SURFACE
      ?auto_313376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313378 ?auto_313373 ) ( IS-CRATE ?auto_313371 ) ( not ( = ?auto_313370 ?auto_313371 ) ) ( not ( = ?auto_313368 ?auto_313370 ) ) ( not ( = ?auto_313368 ?auto_313371 ) ) ( not ( = ?auto_313372 ?auto_313373 ) ) ( HOIST-AT ?auto_313374 ?auto_313372 ) ( not ( = ?auto_313378 ?auto_313374 ) ) ( SURFACE-AT ?auto_313371 ?auto_313372 ) ( ON ?auto_313371 ?auto_313375 ) ( CLEAR ?auto_313371 ) ( not ( = ?auto_313370 ?auto_313375 ) ) ( not ( = ?auto_313371 ?auto_313375 ) ) ( not ( = ?auto_313368 ?auto_313375 ) ) ( IS-CRATE ?auto_313370 ) ( AVAILABLE ?auto_313374 ) ( SURFACE-AT ?auto_313370 ?auto_313372 ) ( ON ?auto_313370 ?auto_313377 ) ( CLEAR ?auto_313370 ) ( not ( = ?auto_313370 ?auto_313377 ) ) ( not ( = ?auto_313371 ?auto_313377 ) ) ( not ( = ?auto_313368 ?auto_313377 ) ) ( not ( = ?auto_313375 ?auto_313377 ) ) ( TRUCK-AT ?auto_313376 ?auto_313373 ) ( SURFACE-AT ?auto_313369 ?auto_313373 ) ( CLEAR ?auto_313369 ) ( LIFTING ?auto_313378 ?auto_313368 ) ( IS-CRATE ?auto_313368 ) ( not ( = ?auto_313369 ?auto_313368 ) ) ( not ( = ?auto_313370 ?auto_313369 ) ) ( not ( = ?auto_313371 ?auto_313369 ) ) ( not ( = ?auto_313375 ?auto_313369 ) ) ( not ( = ?auto_313377 ?auto_313369 ) ) ( ON ?auto_313366 ?auto_313365 ) ( ON ?auto_313367 ?auto_313366 ) ( ON ?auto_313369 ?auto_313367 ) ( not ( = ?auto_313365 ?auto_313366 ) ) ( not ( = ?auto_313365 ?auto_313367 ) ) ( not ( = ?auto_313365 ?auto_313369 ) ) ( not ( = ?auto_313365 ?auto_313368 ) ) ( not ( = ?auto_313365 ?auto_313370 ) ) ( not ( = ?auto_313365 ?auto_313371 ) ) ( not ( = ?auto_313365 ?auto_313375 ) ) ( not ( = ?auto_313365 ?auto_313377 ) ) ( not ( = ?auto_313366 ?auto_313367 ) ) ( not ( = ?auto_313366 ?auto_313369 ) ) ( not ( = ?auto_313366 ?auto_313368 ) ) ( not ( = ?auto_313366 ?auto_313370 ) ) ( not ( = ?auto_313366 ?auto_313371 ) ) ( not ( = ?auto_313366 ?auto_313375 ) ) ( not ( = ?auto_313366 ?auto_313377 ) ) ( not ( = ?auto_313367 ?auto_313369 ) ) ( not ( = ?auto_313367 ?auto_313368 ) ) ( not ( = ?auto_313367 ?auto_313370 ) ) ( not ( = ?auto_313367 ?auto_313371 ) ) ( not ( = ?auto_313367 ?auto_313375 ) ) ( not ( = ?auto_313367 ?auto_313377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313368 ?auto_313370 ?auto_313371 )
      ( MAKE-6CRATE-VERIFY ?auto_313365 ?auto_313366 ?auto_313367 ?auto_313369 ?auto_313368 ?auto_313370 ?auto_313371 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_313379 - SURFACE
      ?auto_313380 - SURFACE
      ?auto_313381 - SURFACE
      ?auto_313383 - SURFACE
      ?auto_313382 - SURFACE
      ?auto_313384 - SURFACE
      ?auto_313385 - SURFACE
      ?auto_313386 - SURFACE
    )
    :vars
    (
      ?auto_313393 - HOIST
      ?auto_313388 - PLACE
      ?auto_313387 - PLACE
      ?auto_313389 - HOIST
      ?auto_313390 - SURFACE
      ?auto_313392 - SURFACE
      ?auto_313391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313393 ?auto_313388 ) ( IS-CRATE ?auto_313386 ) ( not ( = ?auto_313385 ?auto_313386 ) ) ( not ( = ?auto_313384 ?auto_313385 ) ) ( not ( = ?auto_313384 ?auto_313386 ) ) ( not ( = ?auto_313387 ?auto_313388 ) ) ( HOIST-AT ?auto_313389 ?auto_313387 ) ( not ( = ?auto_313393 ?auto_313389 ) ) ( SURFACE-AT ?auto_313386 ?auto_313387 ) ( ON ?auto_313386 ?auto_313390 ) ( CLEAR ?auto_313386 ) ( not ( = ?auto_313385 ?auto_313390 ) ) ( not ( = ?auto_313386 ?auto_313390 ) ) ( not ( = ?auto_313384 ?auto_313390 ) ) ( IS-CRATE ?auto_313385 ) ( AVAILABLE ?auto_313389 ) ( SURFACE-AT ?auto_313385 ?auto_313387 ) ( ON ?auto_313385 ?auto_313392 ) ( CLEAR ?auto_313385 ) ( not ( = ?auto_313385 ?auto_313392 ) ) ( not ( = ?auto_313386 ?auto_313392 ) ) ( not ( = ?auto_313384 ?auto_313392 ) ) ( not ( = ?auto_313390 ?auto_313392 ) ) ( TRUCK-AT ?auto_313391 ?auto_313388 ) ( SURFACE-AT ?auto_313382 ?auto_313388 ) ( CLEAR ?auto_313382 ) ( LIFTING ?auto_313393 ?auto_313384 ) ( IS-CRATE ?auto_313384 ) ( not ( = ?auto_313382 ?auto_313384 ) ) ( not ( = ?auto_313385 ?auto_313382 ) ) ( not ( = ?auto_313386 ?auto_313382 ) ) ( not ( = ?auto_313390 ?auto_313382 ) ) ( not ( = ?auto_313392 ?auto_313382 ) ) ( ON ?auto_313380 ?auto_313379 ) ( ON ?auto_313381 ?auto_313380 ) ( ON ?auto_313383 ?auto_313381 ) ( ON ?auto_313382 ?auto_313383 ) ( not ( = ?auto_313379 ?auto_313380 ) ) ( not ( = ?auto_313379 ?auto_313381 ) ) ( not ( = ?auto_313379 ?auto_313383 ) ) ( not ( = ?auto_313379 ?auto_313382 ) ) ( not ( = ?auto_313379 ?auto_313384 ) ) ( not ( = ?auto_313379 ?auto_313385 ) ) ( not ( = ?auto_313379 ?auto_313386 ) ) ( not ( = ?auto_313379 ?auto_313390 ) ) ( not ( = ?auto_313379 ?auto_313392 ) ) ( not ( = ?auto_313380 ?auto_313381 ) ) ( not ( = ?auto_313380 ?auto_313383 ) ) ( not ( = ?auto_313380 ?auto_313382 ) ) ( not ( = ?auto_313380 ?auto_313384 ) ) ( not ( = ?auto_313380 ?auto_313385 ) ) ( not ( = ?auto_313380 ?auto_313386 ) ) ( not ( = ?auto_313380 ?auto_313390 ) ) ( not ( = ?auto_313380 ?auto_313392 ) ) ( not ( = ?auto_313381 ?auto_313383 ) ) ( not ( = ?auto_313381 ?auto_313382 ) ) ( not ( = ?auto_313381 ?auto_313384 ) ) ( not ( = ?auto_313381 ?auto_313385 ) ) ( not ( = ?auto_313381 ?auto_313386 ) ) ( not ( = ?auto_313381 ?auto_313390 ) ) ( not ( = ?auto_313381 ?auto_313392 ) ) ( not ( = ?auto_313383 ?auto_313382 ) ) ( not ( = ?auto_313383 ?auto_313384 ) ) ( not ( = ?auto_313383 ?auto_313385 ) ) ( not ( = ?auto_313383 ?auto_313386 ) ) ( not ( = ?auto_313383 ?auto_313390 ) ) ( not ( = ?auto_313383 ?auto_313392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313384 ?auto_313385 ?auto_313386 )
      ( MAKE-7CRATE-VERIFY ?auto_313379 ?auto_313380 ?auto_313381 ?auto_313383 ?auto_313382 ?auto_313384 ?auto_313385 ?auto_313386 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_313394 - SURFACE
      ?auto_313395 - SURFACE
      ?auto_313396 - SURFACE
      ?auto_313398 - SURFACE
      ?auto_313397 - SURFACE
      ?auto_313399 - SURFACE
      ?auto_313400 - SURFACE
      ?auto_313401 - SURFACE
      ?auto_313402 - SURFACE
    )
    :vars
    (
      ?auto_313409 - HOIST
      ?auto_313404 - PLACE
      ?auto_313403 - PLACE
      ?auto_313405 - HOIST
      ?auto_313406 - SURFACE
      ?auto_313408 - SURFACE
      ?auto_313407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313409 ?auto_313404 ) ( IS-CRATE ?auto_313402 ) ( not ( = ?auto_313401 ?auto_313402 ) ) ( not ( = ?auto_313400 ?auto_313401 ) ) ( not ( = ?auto_313400 ?auto_313402 ) ) ( not ( = ?auto_313403 ?auto_313404 ) ) ( HOIST-AT ?auto_313405 ?auto_313403 ) ( not ( = ?auto_313409 ?auto_313405 ) ) ( SURFACE-AT ?auto_313402 ?auto_313403 ) ( ON ?auto_313402 ?auto_313406 ) ( CLEAR ?auto_313402 ) ( not ( = ?auto_313401 ?auto_313406 ) ) ( not ( = ?auto_313402 ?auto_313406 ) ) ( not ( = ?auto_313400 ?auto_313406 ) ) ( IS-CRATE ?auto_313401 ) ( AVAILABLE ?auto_313405 ) ( SURFACE-AT ?auto_313401 ?auto_313403 ) ( ON ?auto_313401 ?auto_313408 ) ( CLEAR ?auto_313401 ) ( not ( = ?auto_313401 ?auto_313408 ) ) ( not ( = ?auto_313402 ?auto_313408 ) ) ( not ( = ?auto_313400 ?auto_313408 ) ) ( not ( = ?auto_313406 ?auto_313408 ) ) ( TRUCK-AT ?auto_313407 ?auto_313404 ) ( SURFACE-AT ?auto_313399 ?auto_313404 ) ( CLEAR ?auto_313399 ) ( LIFTING ?auto_313409 ?auto_313400 ) ( IS-CRATE ?auto_313400 ) ( not ( = ?auto_313399 ?auto_313400 ) ) ( not ( = ?auto_313401 ?auto_313399 ) ) ( not ( = ?auto_313402 ?auto_313399 ) ) ( not ( = ?auto_313406 ?auto_313399 ) ) ( not ( = ?auto_313408 ?auto_313399 ) ) ( ON ?auto_313395 ?auto_313394 ) ( ON ?auto_313396 ?auto_313395 ) ( ON ?auto_313398 ?auto_313396 ) ( ON ?auto_313397 ?auto_313398 ) ( ON ?auto_313399 ?auto_313397 ) ( not ( = ?auto_313394 ?auto_313395 ) ) ( not ( = ?auto_313394 ?auto_313396 ) ) ( not ( = ?auto_313394 ?auto_313398 ) ) ( not ( = ?auto_313394 ?auto_313397 ) ) ( not ( = ?auto_313394 ?auto_313399 ) ) ( not ( = ?auto_313394 ?auto_313400 ) ) ( not ( = ?auto_313394 ?auto_313401 ) ) ( not ( = ?auto_313394 ?auto_313402 ) ) ( not ( = ?auto_313394 ?auto_313406 ) ) ( not ( = ?auto_313394 ?auto_313408 ) ) ( not ( = ?auto_313395 ?auto_313396 ) ) ( not ( = ?auto_313395 ?auto_313398 ) ) ( not ( = ?auto_313395 ?auto_313397 ) ) ( not ( = ?auto_313395 ?auto_313399 ) ) ( not ( = ?auto_313395 ?auto_313400 ) ) ( not ( = ?auto_313395 ?auto_313401 ) ) ( not ( = ?auto_313395 ?auto_313402 ) ) ( not ( = ?auto_313395 ?auto_313406 ) ) ( not ( = ?auto_313395 ?auto_313408 ) ) ( not ( = ?auto_313396 ?auto_313398 ) ) ( not ( = ?auto_313396 ?auto_313397 ) ) ( not ( = ?auto_313396 ?auto_313399 ) ) ( not ( = ?auto_313396 ?auto_313400 ) ) ( not ( = ?auto_313396 ?auto_313401 ) ) ( not ( = ?auto_313396 ?auto_313402 ) ) ( not ( = ?auto_313396 ?auto_313406 ) ) ( not ( = ?auto_313396 ?auto_313408 ) ) ( not ( = ?auto_313398 ?auto_313397 ) ) ( not ( = ?auto_313398 ?auto_313399 ) ) ( not ( = ?auto_313398 ?auto_313400 ) ) ( not ( = ?auto_313398 ?auto_313401 ) ) ( not ( = ?auto_313398 ?auto_313402 ) ) ( not ( = ?auto_313398 ?auto_313406 ) ) ( not ( = ?auto_313398 ?auto_313408 ) ) ( not ( = ?auto_313397 ?auto_313399 ) ) ( not ( = ?auto_313397 ?auto_313400 ) ) ( not ( = ?auto_313397 ?auto_313401 ) ) ( not ( = ?auto_313397 ?auto_313402 ) ) ( not ( = ?auto_313397 ?auto_313406 ) ) ( not ( = ?auto_313397 ?auto_313408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313400 ?auto_313401 ?auto_313402 )
      ( MAKE-8CRATE-VERIFY ?auto_313394 ?auto_313395 ?auto_313396 ?auto_313398 ?auto_313397 ?auto_313399 ?auto_313400 ?auto_313401 ?auto_313402 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_313410 - SURFACE
      ?auto_313411 - SURFACE
      ?auto_313412 - SURFACE
      ?auto_313414 - SURFACE
      ?auto_313413 - SURFACE
      ?auto_313415 - SURFACE
      ?auto_313416 - SURFACE
      ?auto_313417 - SURFACE
      ?auto_313418 - SURFACE
      ?auto_313419 - SURFACE
    )
    :vars
    (
      ?auto_313426 - HOIST
      ?auto_313421 - PLACE
      ?auto_313420 - PLACE
      ?auto_313422 - HOIST
      ?auto_313423 - SURFACE
      ?auto_313425 - SURFACE
      ?auto_313424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313426 ?auto_313421 ) ( IS-CRATE ?auto_313419 ) ( not ( = ?auto_313418 ?auto_313419 ) ) ( not ( = ?auto_313417 ?auto_313418 ) ) ( not ( = ?auto_313417 ?auto_313419 ) ) ( not ( = ?auto_313420 ?auto_313421 ) ) ( HOIST-AT ?auto_313422 ?auto_313420 ) ( not ( = ?auto_313426 ?auto_313422 ) ) ( SURFACE-AT ?auto_313419 ?auto_313420 ) ( ON ?auto_313419 ?auto_313423 ) ( CLEAR ?auto_313419 ) ( not ( = ?auto_313418 ?auto_313423 ) ) ( not ( = ?auto_313419 ?auto_313423 ) ) ( not ( = ?auto_313417 ?auto_313423 ) ) ( IS-CRATE ?auto_313418 ) ( AVAILABLE ?auto_313422 ) ( SURFACE-AT ?auto_313418 ?auto_313420 ) ( ON ?auto_313418 ?auto_313425 ) ( CLEAR ?auto_313418 ) ( not ( = ?auto_313418 ?auto_313425 ) ) ( not ( = ?auto_313419 ?auto_313425 ) ) ( not ( = ?auto_313417 ?auto_313425 ) ) ( not ( = ?auto_313423 ?auto_313425 ) ) ( TRUCK-AT ?auto_313424 ?auto_313421 ) ( SURFACE-AT ?auto_313416 ?auto_313421 ) ( CLEAR ?auto_313416 ) ( LIFTING ?auto_313426 ?auto_313417 ) ( IS-CRATE ?auto_313417 ) ( not ( = ?auto_313416 ?auto_313417 ) ) ( not ( = ?auto_313418 ?auto_313416 ) ) ( not ( = ?auto_313419 ?auto_313416 ) ) ( not ( = ?auto_313423 ?auto_313416 ) ) ( not ( = ?auto_313425 ?auto_313416 ) ) ( ON ?auto_313411 ?auto_313410 ) ( ON ?auto_313412 ?auto_313411 ) ( ON ?auto_313414 ?auto_313412 ) ( ON ?auto_313413 ?auto_313414 ) ( ON ?auto_313415 ?auto_313413 ) ( ON ?auto_313416 ?auto_313415 ) ( not ( = ?auto_313410 ?auto_313411 ) ) ( not ( = ?auto_313410 ?auto_313412 ) ) ( not ( = ?auto_313410 ?auto_313414 ) ) ( not ( = ?auto_313410 ?auto_313413 ) ) ( not ( = ?auto_313410 ?auto_313415 ) ) ( not ( = ?auto_313410 ?auto_313416 ) ) ( not ( = ?auto_313410 ?auto_313417 ) ) ( not ( = ?auto_313410 ?auto_313418 ) ) ( not ( = ?auto_313410 ?auto_313419 ) ) ( not ( = ?auto_313410 ?auto_313423 ) ) ( not ( = ?auto_313410 ?auto_313425 ) ) ( not ( = ?auto_313411 ?auto_313412 ) ) ( not ( = ?auto_313411 ?auto_313414 ) ) ( not ( = ?auto_313411 ?auto_313413 ) ) ( not ( = ?auto_313411 ?auto_313415 ) ) ( not ( = ?auto_313411 ?auto_313416 ) ) ( not ( = ?auto_313411 ?auto_313417 ) ) ( not ( = ?auto_313411 ?auto_313418 ) ) ( not ( = ?auto_313411 ?auto_313419 ) ) ( not ( = ?auto_313411 ?auto_313423 ) ) ( not ( = ?auto_313411 ?auto_313425 ) ) ( not ( = ?auto_313412 ?auto_313414 ) ) ( not ( = ?auto_313412 ?auto_313413 ) ) ( not ( = ?auto_313412 ?auto_313415 ) ) ( not ( = ?auto_313412 ?auto_313416 ) ) ( not ( = ?auto_313412 ?auto_313417 ) ) ( not ( = ?auto_313412 ?auto_313418 ) ) ( not ( = ?auto_313412 ?auto_313419 ) ) ( not ( = ?auto_313412 ?auto_313423 ) ) ( not ( = ?auto_313412 ?auto_313425 ) ) ( not ( = ?auto_313414 ?auto_313413 ) ) ( not ( = ?auto_313414 ?auto_313415 ) ) ( not ( = ?auto_313414 ?auto_313416 ) ) ( not ( = ?auto_313414 ?auto_313417 ) ) ( not ( = ?auto_313414 ?auto_313418 ) ) ( not ( = ?auto_313414 ?auto_313419 ) ) ( not ( = ?auto_313414 ?auto_313423 ) ) ( not ( = ?auto_313414 ?auto_313425 ) ) ( not ( = ?auto_313413 ?auto_313415 ) ) ( not ( = ?auto_313413 ?auto_313416 ) ) ( not ( = ?auto_313413 ?auto_313417 ) ) ( not ( = ?auto_313413 ?auto_313418 ) ) ( not ( = ?auto_313413 ?auto_313419 ) ) ( not ( = ?auto_313413 ?auto_313423 ) ) ( not ( = ?auto_313413 ?auto_313425 ) ) ( not ( = ?auto_313415 ?auto_313416 ) ) ( not ( = ?auto_313415 ?auto_313417 ) ) ( not ( = ?auto_313415 ?auto_313418 ) ) ( not ( = ?auto_313415 ?auto_313419 ) ) ( not ( = ?auto_313415 ?auto_313423 ) ) ( not ( = ?auto_313415 ?auto_313425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313417 ?auto_313418 ?auto_313419 )
      ( MAKE-9CRATE-VERIFY ?auto_313410 ?auto_313411 ?auto_313412 ?auto_313414 ?auto_313413 ?auto_313415 ?auto_313416 ?auto_313417 ?auto_313418 ?auto_313419 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_313427 - SURFACE
      ?auto_313428 - SURFACE
      ?auto_313429 - SURFACE
      ?auto_313431 - SURFACE
      ?auto_313430 - SURFACE
      ?auto_313432 - SURFACE
      ?auto_313433 - SURFACE
      ?auto_313434 - SURFACE
      ?auto_313435 - SURFACE
      ?auto_313436 - SURFACE
      ?auto_313437 - SURFACE
    )
    :vars
    (
      ?auto_313444 - HOIST
      ?auto_313439 - PLACE
      ?auto_313438 - PLACE
      ?auto_313440 - HOIST
      ?auto_313441 - SURFACE
      ?auto_313443 - SURFACE
      ?auto_313442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313444 ?auto_313439 ) ( IS-CRATE ?auto_313437 ) ( not ( = ?auto_313436 ?auto_313437 ) ) ( not ( = ?auto_313435 ?auto_313436 ) ) ( not ( = ?auto_313435 ?auto_313437 ) ) ( not ( = ?auto_313438 ?auto_313439 ) ) ( HOIST-AT ?auto_313440 ?auto_313438 ) ( not ( = ?auto_313444 ?auto_313440 ) ) ( SURFACE-AT ?auto_313437 ?auto_313438 ) ( ON ?auto_313437 ?auto_313441 ) ( CLEAR ?auto_313437 ) ( not ( = ?auto_313436 ?auto_313441 ) ) ( not ( = ?auto_313437 ?auto_313441 ) ) ( not ( = ?auto_313435 ?auto_313441 ) ) ( IS-CRATE ?auto_313436 ) ( AVAILABLE ?auto_313440 ) ( SURFACE-AT ?auto_313436 ?auto_313438 ) ( ON ?auto_313436 ?auto_313443 ) ( CLEAR ?auto_313436 ) ( not ( = ?auto_313436 ?auto_313443 ) ) ( not ( = ?auto_313437 ?auto_313443 ) ) ( not ( = ?auto_313435 ?auto_313443 ) ) ( not ( = ?auto_313441 ?auto_313443 ) ) ( TRUCK-AT ?auto_313442 ?auto_313439 ) ( SURFACE-AT ?auto_313434 ?auto_313439 ) ( CLEAR ?auto_313434 ) ( LIFTING ?auto_313444 ?auto_313435 ) ( IS-CRATE ?auto_313435 ) ( not ( = ?auto_313434 ?auto_313435 ) ) ( not ( = ?auto_313436 ?auto_313434 ) ) ( not ( = ?auto_313437 ?auto_313434 ) ) ( not ( = ?auto_313441 ?auto_313434 ) ) ( not ( = ?auto_313443 ?auto_313434 ) ) ( ON ?auto_313428 ?auto_313427 ) ( ON ?auto_313429 ?auto_313428 ) ( ON ?auto_313431 ?auto_313429 ) ( ON ?auto_313430 ?auto_313431 ) ( ON ?auto_313432 ?auto_313430 ) ( ON ?auto_313433 ?auto_313432 ) ( ON ?auto_313434 ?auto_313433 ) ( not ( = ?auto_313427 ?auto_313428 ) ) ( not ( = ?auto_313427 ?auto_313429 ) ) ( not ( = ?auto_313427 ?auto_313431 ) ) ( not ( = ?auto_313427 ?auto_313430 ) ) ( not ( = ?auto_313427 ?auto_313432 ) ) ( not ( = ?auto_313427 ?auto_313433 ) ) ( not ( = ?auto_313427 ?auto_313434 ) ) ( not ( = ?auto_313427 ?auto_313435 ) ) ( not ( = ?auto_313427 ?auto_313436 ) ) ( not ( = ?auto_313427 ?auto_313437 ) ) ( not ( = ?auto_313427 ?auto_313441 ) ) ( not ( = ?auto_313427 ?auto_313443 ) ) ( not ( = ?auto_313428 ?auto_313429 ) ) ( not ( = ?auto_313428 ?auto_313431 ) ) ( not ( = ?auto_313428 ?auto_313430 ) ) ( not ( = ?auto_313428 ?auto_313432 ) ) ( not ( = ?auto_313428 ?auto_313433 ) ) ( not ( = ?auto_313428 ?auto_313434 ) ) ( not ( = ?auto_313428 ?auto_313435 ) ) ( not ( = ?auto_313428 ?auto_313436 ) ) ( not ( = ?auto_313428 ?auto_313437 ) ) ( not ( = ?auto_313428 ?auto_313441 ) ) ( not ( = ?auto_313428 ?auto_313443 ) ) ( not ( = ?auto_313429 ?auto_313431 ) ) ( not ( = ?auto_313429 ?auto_313430 ) ) ( not ( = ?auto_313429 ?auto_313432 ) ) ( not ( = ?auto_313429 ?auto_313433 ) ) ( not ( = ?auto_313429 ?auto_313434 ) ) ( not ( = ?auto_313429 ?auto_313435 ) ) ( not ( = ?auto_313429 ?auto_313436 ) ) ( not ( = ?auto_313429 ?auto_313437 ) ) ( not ( = ?auto_313429 ?auto_313441 ) ) ( not ( = ?auto_313429 ?auto_313443 ) ) ( not ( = ?auto_313431 ?auto_313430 ) ) ( not ( = ?auto_313431 ?auto_313432 ) ) ( not ( = ?auto_313431 ?auto_313433 ) ) ( not ( = ?auto_313431 ?auto_313434 ) ) ( not ( = ?auto_313431 ?auto_313435 ) ) ( not ( = ?auto_313431 ?auto_313436 ) ) ( not ( = ?auto_313431 ?auto_313437 ) ) ( not ( = ?auto_313431 ?auto_313441 ) ) ( not ( = ?auto_313431 ?auto_313443 ) ) ( not ( = ?auto_313430 ?auto_313432 ) ) ( not ( = ?auto_313430 ?auto_313433 ) ) ( not ( = ?auto_313430 ?auto_313434 ) ) ( not ( = ?auto_313430 ?auto_313435 ) ) ( not ( = ?auto_313430 ?auto_313436 ) ) ( not ( = ?auto_313430 ?auto_313437 ) ) ( not ( = ?auto_313430 ?auto_313441 ) ) ( not ( = ?auto_313430 ?auto_313443 ) ) ( not ( = ?auto_313432 ?auto_313433 ) ) ( not ( = ?auto_313432 ?auto_313434 ) ) ( not ( = ?auto_313432 ?auto_313435 ) ) ( not ( = ?auto_313432 ?auto_313436 ) ) ( not ( = ?auto_313432 ?auto_313437 ) ) ( not ( = ?auto_313432 ?auto_313441 ) ) ( not ( = ?auto_313432 ?auto_313443 ) ) ( not ( = ?auto_313433 ?auto_313434 ) ) ( not ( = ?auto_313433 ?auto_313435 ) ) ( not ( = ?auto_313433 ?auto_313436 ) ) ( not ( = ?auto_313433 ?auto_313437 ) ) ( not ( = ?auto_313433 ?auto_313441 ) ) ( not ( = ?auto_313433 ?auto_313443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_313435 ?auto_313436 ?auto_313437 )
      ( MAKE-10CRATE-VERIFY ?auto_313427 ?auto_313428 ?auto_313429 ?auto_313431 ?auto_313430 ?auto_313432 ?auto_313433 ?auto_313434 ?auto_313435 ?auto_313436 ?auto_313437 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_316057 - SURFACE
      ?auto_316058 - SURFACE
    )
    :vars
    (
      ?auto_316065 - HOIST
      ?auto_316064 - PLACE
      ?auto_316062 - SURFACE
      ?auto_316066 - PLACE
      ?auto_316059 - HOIST
      ?auto_316063 - SURFACE
      ?auto_316060 - TRUCK
      ?auto_316061 - SURFACE
      ?auto_316067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_316065 ?auto_316064 ) ( IS-CRATE ?auto_316058 ) ( not ( = ?auto_316057 ?auto_316058 ) ) ( not ( = ?auto_316062 ?auto_316057 ) ) ( not ( = ?auto_316062 ?auto_316058 ) ) ( not ( = ?auto_316066 ?auto_316064 ) ) ( HOIST-AT ?auto_316059 ?auto_316066 ) ( not ( = ?auto_316065 ?auto_316059 ) ) ( SURFACE-AT ?auto_316058 ?auto_316066 ) ( ON ?auto_316058 ?auto_316063 ) ( CLEAR ?auto_316058 ) ( not ( = ?auto_316057 ?auto_316063 ) ) ( not ( = ?auto_316058 ?auto_316063 ) ) ( not ( = ?auto_316062 ?auto_316063 ) ) ( SURFACE-AT ?auto_316062 ?auto_316064 ) ( CLEAR ?auto_316062 ) ( IS-CRATE ?auto_316057 ) ( AVAILABLE ?auto_316065 ) ( TRUCK-AT ?auto_316060 ?auto_316066 ) ( SURFACE-AT ?auto_316057 ?auto_316066 ) ( ON ?auto_316057 ?auto_316061 ) ( CLEAR ?auto_316057 ) ( not ( = ?auto_316057 ?auto_316061 ) ) ( not ( = ?auto_316058 ?auto_316061 ) ) ( not ( = ?auto_316062 ?auto_316061 ) ) ( not ( = ?auto_316063 ?auto_316061 ) ) ( LIFTING ?auto_316059 ?auto_316067 ) ( IS-CRATE ?auto_316067 ) ( not ( = ?auto_316057 ?auto_316067 ) ) ( not ( = ?auto_316058 ?auto_316067 ) ) ( not ( = ?auto_316062 ?auto_316067 ) ) ( not ( = ?auto_316063 ?auto_316067 ) ) ( not ( = ?auto_316061 ?auto_316067 ) ) )
    :subtasks
    ( ( !LOAD ?auto_316059 ?auto_316067 ?auto_316060 ?auto_316066 )
      ( MAKE-2CRATE ?auto_316062 ?auto_316057 ?auto_316058 )
      ( MAKE-1CRATE-VERIFY ?auto_316057 ?auto_316058 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_316068 - SURFACE
      ?auto_316069 - SURFACE
      ?auto_316070 - SURFACE
    )
    :vars
    (
      ?auto_316075 - HOIST
      ?auto_316073 - PLACE
      ?auto_316074 - PLACE
      ?auto_316078 - HOIST
      ?auto_316077 - SURFACE
      ?auto_316076 - TRUCK
      ?auto_316071 - SURFACE
      ?auto_316072 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_316075 ?auto_316073 ) ( IS-CRATE ?auto_316070 ) ( not ( = ?auto_316069 ?auto_316070 ) ) ( not ( = ?auto_316068 ?auto_316069 ) ) ( not ( = ?auto_316068 ?auto_316070 ) ) ( not ( = ?auto_316074 ?auto_316073 ) ) ( HOIST-AT ?auto_316078 ?auto_316074 ) ( not ( = ?auto_316075 ?auto_316078 ) ) ( SURFACE-AT ?auto_316070 ?auto_316074 ) ( ON ?auto_316070 ?auto_316077 ) ( CLEAR ?auto_316070 ) ( not ( = ?auto_316069 ?auto_316077 ) ) ( not ( = ?auto_316070 ?auto_316077 ) ) ( not ( = ?auto_316068 ?auto_316077 ) ) ( SURFACE-AT ?auto_316068 ?auto_316073 ) ( CLEAR ?auto_316068 ) ( IS-CRATE ?auto_316069 ) ( AVAILABLE ?auto_316075 ) ( TRUCK-AT ?auto_316076 ?auto_316074 ) ( SURFACE-AT ?auto_316069 ?auto_316074 ) ( ON ?auto_316069 ?auto_316071 ) ( CLEAR ?auto_316069 ) ( not ( = ?auto_316069 ?auto_316071 ) ) ( not ( = ?auto_316070 ?auto_316071 ) ) ( not ( = ?auto_316068 ?auto_316071 ) ) ( not ( = ?auto_316077 ?auto_316071 ) ) ( LIFTING ?auto_316078 ?auto_316072 ) ( IS-CRATE ?auto_316072 ) ( not ( = ?auto_316069 ?auto_316072 ) ) ( not ( = ?auto_316070 ?auto_316072 ) ) ( not ( = ?auto_316068 ?auto_316072 ) ) ( not ( = ?auto_316077 ?auto_316072 ) ) ( not ( = ?auto_316071 ?auto_316072 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_316069 ?auto_316070 )
      ( MAKE-2CRATE-VERIFY ?auto_316068 ?auto_316069 ?auto_316070 ) )
  )

)

