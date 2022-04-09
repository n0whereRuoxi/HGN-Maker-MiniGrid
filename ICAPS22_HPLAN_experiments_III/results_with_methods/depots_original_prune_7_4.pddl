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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90176 - SURFACE
      ?auto_90177 - SURFACE
    )
    :vars
    (
      ?auto_90178 - HOIST
      ?auto_90179 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90178 ?auto_90179 ) ( SURFACE-AT ?auto_90176 ?auto_90179 ) ( CLEAR ?auto_90176 ) ( LIFTING ?auto_90178 ?auto_90177 ) ( IS-CRATE ?auto_90177 ) ( not ( = ?auto_90176 ?auto_90177 ) ) )
    :subtasks
    ( ( !DROP ?auto_90178 ?auto_90177 ?auto_90176 ?auto_90179 )
      ( MAKE-1CRATE-VERIFY ?auto_90176 ?auto_90177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90180 - SURFACE
      ?auto_90181 - SURFACE
    )
    :vars
    (
      ?auto_90183 - HOIST
      ?auto_90182 - PLACE
      ?auto_90184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90183 ?auto_90182 ) ( SURFACE-AT ?auto_90180 ?auto_90182 ) ( CLEAR ?auto_90180 ) ( IS-CRATE ?auto_90181 ) ( not ( = ?auto_90180 ?auto_90181 ) ) ( TRUCK-AT ?auto_90184 ?auto_90182 ) ( AVAILABLE ?auto_90183 ) ( IN ?auto_90181 ?auto_90184 ) )
    :subtasks
    ( ( !UNLOAD ?auto_90183 ?auto_90181 ?auto_90184 ?auto_90182 )
      ( MAKE-1CRATE ?auto_90180 ?auto_90181 )
      ( MAKE-1CRATE-VERIFY ?auto_90180 ?auto_90181 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90185 - SURFACE
      ?auto_90186 - SURFACE
    )
    :vars
    (
      ?auto_90187 - HOIST
      ?auto_90189 - PLACE
      ?auto_90188 - TRUCK
      ?auto_90190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90187 ?auto_90189 ) ( SURFACE-AT ?auto_90185 ?auto_90189 ) ( CLEAR ?auto_90185 ) ( IS-CRATE ?auto_90186 ) ( not ( = ?auto_90185 ?auto_90186 ) ) ( AVAILABLE ?auto_90187 ) ( IN ?auto_90186 ?auto_90188 ) ( TRUCK-AT ?auto_90188 ?auto_90190 ) ( not ( = ?auto_90190 ?auto_90189 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90188 ?auto_90190 ?auto_90189 )
      ( MAKE-1CRATE ?auto_90185 ?auto_90186 )
      ( MAKE-1CRATE-VERIFY ?auto_90185 ?auto_90186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90191 - SURFACE
      ?auto_90192 - SURFACE
    )
    :vars
    (
      ?auto_90195 - HOIST
      ?auto_90193 - PLACE
      ?auto_90194 - TRUCK
      ?auto_90196 - PLACE
      ?auto_90197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90195 ?auto_90193 ) ( SURFACE-AT ?auto_90191 ?auto_90193 ) ( CLEAR ?auto_90191 ) ( IS-CRATE ?auto_90192 ) ( not ( = ?auto_90191 ?auto_90192 ) ) ( AVAILABLE ?auto_90195 ) ( TRUCK-AT ?auto_90194 ?auto_90196 ) ( not ( = ?auto_90196 ?auto_90193 ) ) ( HOIST-AT ?auto_90197 ?auto_90196 ) ( LIFTING ?auto_90197 ?auto_90192 ) ( not ( = ?auto_90195 ?auto_90197 ) ) )
    :subtasks
    ( ( !LOAD ?auto_90197 ?auto_90192 ?auto_90194 ?auto_90196 )
      ( MAKE-1CRATE ?auto_90191 ?auto_90192 )
      ( MAKE-1CRATE-VERIFY ?auto_90191 ?auto_90192 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90198 - SURFACE
      ?auto_90199 - SURFACE
    )
    :vars
    (
      ?auto_90202 - HOIST
      ?auto_90200 - PLACE
      ?auto_90201 - TRUCK
      ?auto_90203 - PLACE
      ?auto_90204 - HOIST
      ?auto_90205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90202 ?auto_90200 ) ( SURFACE-AT ?auto_90198 ?auto_90200 ) ( CLEAR ?auto_90198 ) ( IS-CRATE ?auto_90199 ) ( not ( = ?auto_90198 ?auto_90199 ) ) ( AVAILABLE ?auto_90202 ) ( TRUCK-AT ?auto_90201 ?auto_90203 ) ( not ( = ?auto_90203 ?auto_90200 ) ) ( HOIST-AT ?auto_90204 ?auto_90203 ) ( not ( = ?auto_90202 ?auto_90204 ) ) ( AVAILABLE ?auto_90204 ) ( SURFACE-AT ?auto_90199 ?auto_90203 ) ( ON ?auto_90199 ?auto_90205 ) ( CLEAR ?auto_90199 ) ( not ( = ?auto_90198 ?auto_90205 ) ) ( not ( = ?auto_90199 ?auto_90205 ) ) )
    :subtasks
    ( ( !LIFT ?auto_90204 ?auto_90199 ?auto_90205 ?auto_90203 )
      ( MAKE-1CRATE ?auto_90198 ?auto_90199 )
      ( MAKE-1CRATE-VERIFY ?auto_90198 ?auto_90199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90206 - SURFACE
      ?auto_90207 - SURFACE
    )
    :vars
    (
      ?auto_90212 - HOIST
      ?auto_90209 - PLACE
      ?auto_90210 - PLACE
      ?auto_90211 - HOIST
      ?auto_90208 - SURFACE
      ?auto_90213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90212 ?auto_90209 ) ( SURFACE-AT ?auto_90206 ?auto_90209 ) ( CLEAR ?auto_90206 ) ( IS-CRATE ?auto_90207 ) ( not ( = ?auto_90206 ?auto_90207 ) ) ( AVAILABLE ?auto_90212 ) ( not ( = ?auto_90210 ?auto_90209 ) ) ( HOIST-AT ?auto_90211 ?auto_90210 ) ( not ( = ?auto_90212 ?auto_90211 ) ) ( AVAILABLE ?auto_90211 ) ( SURFACE-AT ?auto_90207 ?auto_90210 ) ( ON ?auto_90207 ?auto_90208 ) ( CLEAR ?auto_90207 ) ( not ( = ?auto_90206 ?auto_90208 ) ) ( not ( = ?auto_90207 ?auto_90208 ) ) ( TRUCK-AT ?auto_90213 ?auto_90209 ) )
    :subtasks
    ( ( !DRIVE ?auto_90213 ?auto_90209 ?auto_90210 )
      ( MAKE-1CRATE ?auto_90206 ?auto_90207 )
      ( MAKE-1CRATE-VERIFY ?auto_90206 ?auto_90207 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90223 - SURFACE
      ?auto_90224 - SURFACE
      ?auto_90225 - SURFACE
    )
    :vars
    (
      ?auto_90226 - HOIST
      ?auto_90227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90226 ?auto_90227 ) ( SURFACE-AT ?auto_90224 ?auto_90227 ) ( CLEAR ?auto_90224 ) ( LIFTING ?auto_90226 ?auto_90225 ) ( IS-CRATE ?auto_90225 ) ( not ( = ?auto_90224 ?auto_90225 ) ) ( ON ?auto_90224 ?auto_90223 ) ( not ( = ?auto_90223 ?auto_90224 ) ) ( not ( = ?auto_90223 ?auto_90225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90224 ?auto_90225 )
      ( MAKE-2CRATE-VERIFY ?auto_90223 ?auto_90224 ?auto_90225 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90233 - SURFACE
      ?auto_90234 - SURFACE
      ?auto_90235 - SURFACE
    )
    :vars
    (
      ?auto_90236 - HOIST
      ?auto_90238 - PLACE
      ?auto_90237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90236 ?auto_90238 ) ( SURFACE-AT ?auto_90234 ?auto_90238 ) ( CLEAR ?auto_90234 ) ( IS-CRATE ?auto_90235 ) ( not ( = ?auto_90234 ?auto_90235 ) ) ( TRUCK-AT ?auto_90237 ?auto_90238 ) ( AVAILABLE ?auto_90236 ) ( IN ?auto_90235 ?auto_90237 ) ( ON ?auto_90234 ?auto_90233 ) ( not ( = ?auto_90233 ?auto_90234 ) ) ( not ( = ?auto_90233 ?auto_90235 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90234 ?auto_90235 )
      ( MAKE-2CRATE-VERIFY ?auto_90233 ?auto_90234 ?auto_90235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90239 - SURFACE
      ?auto_90240 - SURFACE
    )
    :vars
    (
      ?auto_90242 - HOIST
      ?auto_90241 - PLACE
      ?auto_90243 - TRUCK
      ?auto_90244 - SURFACE
      ?auto_90245 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90242 ?auto_90241 ) ( SURFACE-AT ?auto_90239 ?auto_90241 ) ( CLEAR ?auto_90239 ) ( IS-CRATE ?auto_90240 ) ( not ( = ?auto_90239 ?auto_90240 ) ) ( AVAILABLE ?auto_90242 ) ( IN ?auto_90240 ?auto_90243 ) ( ON ?auto_90239 ?auto_90244 ) ( not ( = ?auto_90244 ?auto_90239 ) ) ( not ( = ?auto_90244 ?auto_90240 ) ) ( TRUCK-AT ?auto_90243 ?auto_90245 ) ( not ( = ?auto_90245 ?auto_90241 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90243 ?auto_90245 ?auto_90241 )
      ( MAKE-2CRATE ?auto_90244 ?auto_90239 ?auto_90240 )
      ( MAKE-1CRATE-VERIFY ?auto_90239 ?auto_90240 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90246 - SURFACE
      ?auto_90247 - SURFACE
      ?auto_90248 - SURFACE
    )
    :vars
    (
      ?auto_90250 - HOIST
      ?auto_90251 - PLACE
      ?auto_90252 - TRUCK
      ?auto_90249 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90250 ?auto_90251 ) ( SURFACE-AT ?auto_90247 ?auto_90251 ) ( CLEAR ?auto_90247 ) ( IS-CRATE ?auto_90248 ) ( not ( = ?auto_90247 ?auto_90248 ) ) ( AVAILABLE ?auto_90250 ) ( IN ?auto_90248 ?auto_90252 ) ( ON ?auto_90247 ?auto_90246 ) ( not ( = ?auto_90246 ?auto_90247 ) ) ( not ( = ?auto_90246 ?auto_90248 ) ) ( TRUCK-AT ?auto_90252 ?auto_90249 ) ( not ( = ?auto_90249 ?auto_90251 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90247 ?auto_90248 )
      ( MAKE-2CRATE-VERIFY ?auto_90246 ?auto_90247 ?auto_90248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90253 - SURFACE
      ?auto_90254 - SURFACE
    )
    :vars
    (
      ?auto_90255 - HOIST
      ?auto_90259 - PLACE
      ?auto_90257 - SURFACE
      ?auto_90258 - TRUCK
      ?auto_90256 - PLACE
      ?auto_90260 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90255 ?auto_90259 ) ( SURFACE-AT ?auto_90253 ?auto_90259 ) ( CLEAR ?auto_90253 ) ( IS-CRATE ?auto_90254 ) ( not ( = ?auto_90253 ?auto_90254 ) ) ( AVAILABLE ?auto_90255 ) ( ON ?auto_90253 ?auto_90257 ) ( not ( = ?auto_90257 ?auto_90253 ) ) ( not ( = ?auto_90257 ?auto_90254 ) ) ( TRUCK-AT ?auto_90258 ?auto_90256 ) ( not ( = ?auto_90256 ?auto_90259 ) ) ( HOIST-AT ?auto_90260 ?auto_90256 ) ( LIFTING ?auto_90260 ?auto_90254 ) ( not ( = ?auto_90255 ?auto_90260 ) ) )
    :subtasks
    ( ( !LOAD ?auto_90260 ?auto_90254 ?auto_90258 ?auto_90256 )
      ( MAKE-2CRATE ?auto_90257 ?auto_90253 ?auto_90254 )
      ( MAKE-1CRATE-VERIFY ?auto_90253 ?auto_90254 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90261 - SURFACE
      ?auto_90262 - SURFACE
      ?auto_90263 - SURFACE
    )
    :vars
    (
      ?auto_90265 - HOIST
      ?auto_90266 - PLACE
      ?auto_90268 - TRUCK
      ?auto_90267 - PLACE
      ?auto_90264 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90265 ?auto_90266 ) ( SURFACE-AT ?auto_90262 ?auto_90266 ) ( CLEAR ?auto_90262 ) ( IS-CRATE ?auto_90263 ) ( not ( = ?auto_90262 ?auto_90263 ) ) ( AVAILABLE ?auto_90265 ) ( ON ?auto_90262 ?auto_90261 ) ( not ( = ?auto_90261 ?auto_90262 ) ) ( not ( = ?auto_90261 ?auto_90263 ) ) ( TRUCK-AT ?auto_90268 ?auto_90267 ) ( not ( = ?auto_90267 ?auto_90266 ) ) ( HOIST-AT ?auto_90264 ?auto_90267 ) ( LIFTING ?auto_90264 ?auto_90263 ) ( not ( = ?auto_90265 ?auto_90264 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90262 ?auto_90263 )
      ( MAKE-2CRATE-VERIFY ?auto_90261 ?auto_90262 ?auto_90263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90269 - SURFACE
      ?auto_90270 - SURFACE
    )
    :vars
    (
      ?auto_90274 - HOIST
      ?auto_90272 - PLACE
      ?auto_90273 - SURFACE
      ?auto_90275 - TRUCK
      ?auto_90276 - PLACE
      ?auto_90271 - HOIST
      ?auto_90277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90274 ?auto_90272 ) ( SURFACE-AT ?auto_90269 ?auto_90272 ) ( CLEAR ?auto_90269 ) ( IS-CRATE ?auto_90270 ) ( not ( = ?auto_90269 ?auto_90270 ) ) ( AVAILABLE ?auto_90274 ) ( ON ?auto_90269 ?auto_90273 ) ( not ( = ?auto_90273 ?auto_90269 ) ) ( not ( = ?auto_90273 ?auto_90270 ) ) ( TRUCK-AT ?auto_90275 ?auto_90276 ) ( not ( = ?auto_90276 ?auto_90272 ) ) ( HOIST-AT ?auto_90271 ?auto_90276 ) ( not ( = ?auto_90274 ?auto_90271 ) ) ( AVAILABLE ?auto_90271 ) ( SURFACE-AT ?auto_90270 ?auto_90276 ) ( ON ?auto_90270 ?auto_90277 ) ( CLEAR ?auto_90270 ) ( not ( = ?auto_90269 ?auto_90277 ) ) ( not ( = ?auto_90270 ?auto_90277 ) ) ( not ( = ?auto_90273 ?auto_90277 ) ) )
    :subtasks
    ( ( !LIFT ?auto_90271 ?auto_90270 ?auto_90277 ?auto_90276 )
      ( MAKE-2CRATE ?auto_90273 ?auto_90269 ?auto_90270 )
      ( MAKE-1CRATE-VERIFY ?auto_90269 ?auto_90270 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90278 - SURFACE
      ?auto_90279 - SURFACE
      ?auto_90280 - SURFACE
    )
    :vars
    (
      ?auto_90282 - HOIST
      ?auto_90286 - PLACE
      ?auto_90285 - TRUCK
      ?auto_90284 - PLACE
      ?auto_90283 - HOIST
      ?auto_90281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90282 ?auto_90286 ) ( SURFACE-AT ?auto_90279 ?auto_90286 ) ( CLEAR ?auto_90279 ) ( IS-CRATE ?auto_90280 ) ( not ( = ?auto_90279 ?auto_90280 ) ) ( AVAILABLE ?auto_90282 ) ( ON ?auto_90279 ?auto_90278 ) ( not ( = ?auto_90278 ?auto_90279 ) ) ( not ( = ?auto_90278 ?auto_90280 ) ) ( TRUCK-AT ?auto_90285 ?auto_90284 ) ( not ( = ?auto_90284 ?auto_90286 ) ) ( HOIST-AT ?auto_90283 ?auto_90284 ) ( not ( = ?auto_90282 ?auto_90283 ) ) ( AVAILABLE ?auto_90283 ) ( SURFACE-AT ?auto_90280 ?auto_90284 ) ( ON ?auto_90280 ?auto_90281 ) ( CLEAR ?auto_90280 ) ( not ( = ?auto_90279 ?auto_90281 ) ) ( not ( = ?auto_90280 ?auto_90281 ) ) ( not ( = ?auto_90278 ?auto_90281 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90279 ?auto_90280 )
      ( MAKE-2CRATE-VERIFY ?auto_90278 ?auto_90279 ?auto_90280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90287 - SURFACE
      ?auto_90288 - SURFACE
    )
    :vars
    (
      ?auto_90295 - HOIST
      ?auto_90290 - PLACE
      ?auto_90292 - SURFACE
      ?auto_90293 - PLACE
      ?auto_90294 - HOIST
      ?auto_90289 - SURFACE
      ?auto_90291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90295 ?auto_90290 ) ( SURFACE-AT ?auto_90287 ?auto_90290 ) ( CLEAR ?auto_90287 ) ( IS-CRATE ?auto_90288 ) ( not ( = ?auto_90287 ?auto_90288 ) ) ( AVAILABLE ?auto_90295 ) ( ON ?auto_90287 ?auto_90292 ) ( not ( = ?auto_90292 ?auto_90287 ) ) ( not ( = ?auto_90292 ?auto_90288 ) ) ( not ( = ?auto_90293 ?auto_90290 ) ) ( HOIST-AT ?auto_90294 ?auto_90293 ) ( not ( = ?auto_90295 ?auto_90294 ) ) ( AVAILABLE ?auto_90294 ) ( SURFACE-AT ?auto_90288 ?auto_90293 ) ( ON ?auto_90288 ?auto_90289 ) ( CLEAR ?auto_90288 ) ( not ( = ?auto_90287 ?auto_90289 ) ) ( not ( = ?auto_90288 ?auto_90289 ) ) ( not ( = ?auto_90292 ?auto_90289 ) ) ( TRUCK-AT ?auto_90291 ?auto_90290 ) )
    :subtasks
    ( ( !DRIVE ?auto_90291 ?auto_90290 ?auto_90293 )
      ( MAKE-2CRATE ?auto_90292 ?auto_90287 ?auto_90288 )
      ( MAKE-1CRATE-VERIFY ?auto_90287 ?auto_90288 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90296 - SURFACE
      ?auto_90297 - SURFACE
      ?auto_90298 - SURFACE
    )
    :vars
    (
      ?auto_90300 - HOIST
      ?auto_90304 - PLACE
      ?auto_90299 - PLACE
      ?auto_90301 - HOIST
      ?auto_90302 - SURFACE
      ?auto_90303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90300 ?auto_90304 ) ( SURFACE-AT ?auto_90297 ?auto_90304 ) ( CLEAR ?auto_90297 ) ( IS-CRATE ?auto_90298 ) ( not ( = ?auto_90297 ?auto_90298 ) ) ( AVAILABLE ?auto_90300 ) ( ON ?auto_90297 ?auto_90296 ) ( not ( = ?auto_90296 ?auto_90297 ) ) ( not ( = ?auto_90296 ?auto_90298 ) ) ( not ( = ?auto_90299 ?auto_90304 ) ) ( HOIST-AT ?auto_90301 ?auto_90299 ) ( not ( = ?auto_90300 ?auto_90301 ) ) ( AVAILABLE ?auto_90301 ) ( SURFACE-AT ?auto_90298 ?auto_90299 ) ( ON ?auto_90298 ?auto_90302 ) ( CLEAR ?auto_90298 ) ( not ( = ?auto_90297 ?auto_90302 ) ) ( not ( = ?auto_90298 ?auto_90302 ) ) ( not ( = ?auto_90296 ?auto_90302 ) ) ( TRUCK-AT ?auto_90303 ?auto_90304 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90297 ?auto_90298 )
      ( MAKE-2CRATE-VERIFY ?auto_90296 ?auto_90297 ?auto_90298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90305 - SURFACE
      ?auto_90306 - SURFACE
    )
    :vars
    (
      ?auto_90307 - HOIST
      ?auto_90313 - PLACE
      ?auto_90312 - SURFACE
      ?auto_90311 - PLACE
      ?auto_90308 - HOIST
      ?auto_90309 - SURFACE
      ?auto_90310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90307 ?auto_90313 ) ( IS-CRATE ?auto_90306 ) ( not ( = ?auto_90305 ?auto_90306 ) ) ( not ( = ?auto_90312 ?auto_90305 ) ) ( not ( = ?auto_90312 ?auto_90306 ) ) ( not ( = ?auto_90311 ?auto_90313 ) ) ( HOIST-AT ?auto_90308 ?auto_90311 ) ( not ( = ?auto_90307 ?auto_90308 ) ) ( AVAILABLE ?auto_90308 ) ( SURFACE-AT ?auto_90306 ?auto_90311 ) ( ON ?auto_90306 ?auto_90309 ) ( CLEAR ?auto_90306 ) ( not ( = ?auto_90305 ?auto_90309 ) ) ( not ( = ?auto_90306 ?auto_90309 ) ) ( not ( = ?auto_90312 ?auto_90309 ) ) ( TRUCK-AT ?auto_90310 ?auto_90313 ) ( SURFACE-AT ?auto_90312 ?auto_90313 ) ( CLEAR ?auto_90312 ) ( LIFTING ?auto_90307 ?auto_90305 ) ( IS-CRATE ?auto_90305 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90312 ?auto_90305 )
      ( MAKE-2CRATE ?auto_90312 ?auto_90305 ?auto_90306 )
      ( MAKE-1CRATE-VERIFY ?auto_90305 ?auto_90306 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90314 - SURFACE
      ?auto_90315 - SURFACE
      ?auto_90316 - SURFACE
    )
    :vars
    (
      ?auto_90318 - HOIST
      ?auto_90319 - PLACE
      ?auto_90322 - PLACE
      ?auto_90317 - HOIST
      ?auto_90321 - SURFACE
      ?auto_90320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90318 ?auto_90319 ) ( IS-CRATE ?auto_90316 ) ( not ( = ?auto_90315 ?auto_90316 ) ) ( not ( = ?auto_90314 ?auto_90315 ) ) ( not ( = ?auto_90314 ?auto_90316 ) ) ( not ( = ?auto_90322 ?auto_90319 ) ) ( HOIST-AT ?auto_90317 ?auto_90322 ) ( not ( = ?auto_90318 ?auto_90317 ) ) ( AVAILABLE ?auto_90317 ) ( SURFACE-AT ?auto_90316 ?auto_90322 ) ( ON ?auto_90316 ?auto_90321 ) ( CLEAR ?auto_90316 ) ( not ( = ?auto_90315 ?auto_90321 ) ) ( not ( = ?auto_90316 ?auto_90321 ) ) ( not ( = ?auto_90314 ?auto_90321 ) ) ( TRUCK-AT ?auto_90320 ?auto_90319 ) ( SURFACE-AT ?auto_90314 ?auto_90319 ) ( CLEAR ?auto_90314 ) ( LIFTING ?auto_90318 ?auto_90315 ) ( IS-CRATE ?auto_90315 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90315 ?auto_90316 )
      ( MAKE-2CRATE-VERIFY ?auto_90314 ?auto_90315 ?auto_90316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90323 - SURFACE
      ?auto_90324 - SURFACE
    )
    :vars
    (
      ?auto_90327 - HOIST
      ?auto_90331 - PLACE
      ?auto_90325 - SURFACE
      ?auto_90326 - PLACE
      ?auto_90330 - HOIST
      ?auto_90329 - SURFACE
      ?auto_90328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90327 ?auto_90331 ) ( IS-CRATE ?auto_90324 ) ( not ( = ?auto_90323 ?auto_90324 ) ) ( not ( = ?auto_90325 ?auto_90323 ) ) ( not ( = ?auto_90325 ?auto_90324 ) ) ( not ( = ?auto_90326 ?auto_90331 ) ) ( HOIST-AT ?auto_90330 ?auto_90326 ) ( not ( = ?auto_90327 ?auto_90330 ) ) ( AVAILABLE ?auto_90330 ) ( SURFACE-AT ?auto_90324 ?auto_90326 ) ( ON ?auto_90324 ?auto_90329 ) ( CLEAR ?auto_90324 ) ( not ( = ?auto_90323 ?auto_90329 ) ) ( not ( = ?auto_90324 ?auto_90329 ) ) ( not ( = ?auto_90325 ?auto_90329 ) ) ( TRUCK-AT ?auto_90328 ?auto_90331 ) ( SURFACE-AT ?auto_90325 ?auto_90331 ) ( CLEAR ?auto_90325 ) ( IS-CRATE ?auto_90323 ) ( AVAILABLE ?auto_90327 ) ( IN ?auto_90323 ?auto_90328 ) )
    :subtasks
    ( ( !UNLOAD ?auto_90327 ?auto_90323 ?auto_90328 ?auto_90331 )
      ( MAKE-2CRATE ?auto_90325 ?auto_90323 ?auto_90324 )
      ( MAKE-1CRATE-VERIFY ?auto_90323 ?auto_90324 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90332 - SURFACE
      ?auto_90333 - SURFACE
      ?auto_90334 - SURFACE
    )
    :vars
    (
      ?auto_90339 - HOIST
      ?auto_90337 - PLACE
      ?auto_90335 - PLACE
      ?auto_90340 - HOIST
      ?auto_90338 - SURFACE
      ?auto_90336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90339 ?auto_90337 ) ( IS-CRATE ?auto_90334 ) ( not ( = ?auto_90333 ?auto_90334 ) ) ( not ( = ?auto_90332 ?auto_90333 ) ) ( not ( = ?auto_90332 ?auto_90334 ) ) ( not ( = ?auto_90335 ?auto_90337 ) ) ( HOIST-AT ?auto_90340 ?auto_90335 ) ( not ( = ?auto_90339 ?auto_90340 ) ) ( AVAILABLE ?auto_90340 ) ( SURFACE-AT ?auto_90334 ?auto_90335 ) ( ON ?auto_90334 ?auto_90338 ) ( CLEAR ?auto_90334 ) ( not ( = ?auto_90333 ?auto_90338 ) ) ( not ( = ?auto_90334 ?auto_90338 ) ) ( not ( = ?auto_90332 ?auto_90338 ) ) ( TRUCK-AT ?auto_90336 ?auto_90337 ) ( SURFACE-AT ?auto_90332 ?auto_90337 ) ( CLEAR ?auto_90332 ) ( IS-CRATE ?auto_90333 ) ( AVAILABLE ?auto_90339 ) ( IN ?auto_90333 ?auto_90336 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90333 ?auto_90334 )
      ( MAKE-2CRATE-VERIFY ?auto_90332 ?auto_90333 ?auto_90334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90377 - SURFACE
      ?auto_90378 - SURFACE
    )
    :vars
    (
      ?auto_90381 - HOIST
      ?auto_90379 - PLACE
      ?auto_90384 - SURFACE
      ?auto_90383 - PLACE
      ?auto_90385 - HOIST
      ?auto_90382 - SURFACE
      ?auto_90380 - TRUCK
      ?auto_90386 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90381 ?auto_90379 ) ( SURFACE-AT ?auto_90377 ?auto_90379 ) ( CLEAR ?auto_90377 ) ( IS-CRATE ?auto_90378 ) ( not ( = ?auto_90377 ?auto_90378 ) ) ( AVAILABLE ?auto_90381 ) ( ON ?auto_90377 ?auto_90384 ) ( not ( = ?auto_90384 ?auto_90377 ) ) ( not ( = ?auto_90384 ?auto_90378 ) ) ( not ( = ?auto_90383 ?auto_90379 ) ) ( HOIST-AT ?auto_90385 ?auto_90383 ) ( not ( = ?auto_90381 ?auto_90385 ) ) ( AVAILABLE ?auto_90385 ) ( SURFACE-AT ?auto_90378 ?auto_90383 ) ( ON ?auto_90378 ?auto_90382 ) ( CLEAR ?auto_90378 ) ( not ( = ?auto_90377 ?auto_90382 ) ) ( not ( = ?auto_90378 ?auto_90382 ) ) ( not ( = ?auto_90384 ?auto_90382 ) ) ( TRUCK-AT ?auto_90380 ?auto_90386 ) ( not ( = ?auto_90386 ?auto_90379 ) ) ( not ( = ?auto_90383 ?auto_90386 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90380 ?auto_90386 ?auto_90379 )
      ( MAKE-1CRATE ?auto_90377 ?auto_90378 )
      ( MAKE-1CRATE-VERIFY ?auto_90377 ?auto_90378 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90416 - SURFACE
      ?auto_90417 - SURFACE
      ?auto_90418 - SURFACE
      ?auto_90419 - SURFACE
    )
    :vars
    (
      ?auto_90421 - HOIST
      ?auto_90420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90421 ?auto_90420 ) ( SURFACE-AT ?auto_90418 ?auto_90420 ) ( CLEAR ?auto_90418 ) ( LIFTING ?auto_90421 ?auto_90419 ) ( IS-CRATE ?auto_90419 ) ( not ( = ?auto_90418 ?auto_90419 ) ) ( ON ?auto_90417 ?auto_90416 ) ( ON ?auto_90418 ?auto_90417 ) ( not ( = ?auto_90416 ?auto_90417 ) ) ( not ( = ?auto_90416 ?auto_90418 ) ) ( not ( = ?auto_90416 ?auto_90419 ) ) ( not ( = ?auto_90417 ?auto_90418 ) ) ( not ( = ?auto_90417 ?auto_90419 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90418 ?auto_90419 )
      ( MAKE-3CRATE-VERIFY ?auto_90416 ?auto_90417 ?auto_90418 ?auto_90419 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90433 - SURFACE
      ?auto_90434 - SURFACE
      ?auto_90435 - SURFACE
      ?auto_90436 - SURFACE
    )
    :vars
    (
      ?auto_90438 - HOIST
      ?auto_90437 - PLACE
      ?auto_90439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90438 ?auto_90437 ) ( SURFACE-AT ?auto_90435 ?auto_90437 ) ( CLEAR ?auto_90435 ) ( IS-CRATE ?auto_90436 ) ( not ( = ?auto_90435 ?auto_90436 ) ) ( TRUCK-AT ?auto_90439 ?auto_90437 ) ( AVAILABLE ?auto_90438 ) ( IN ?auto_90436 ?auto_90439 ) ( ON ?auto_90435 ?auto_90434 ) ( not ( = ?auto_90434 ?auto_90435 ) ) ( not ( = ?auto_90434 ?auto_90436 ) ) ( ON ?auto_90434 ?auto_90433 ) ( not ( = ?auto_90433 ?auto_90434 ) ) ( not ( = ?auto_90433 ?auto_90435 ) ) ( not ( = ?auto_90433 ?auto_90436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90434 ?auto_90435 ?auto_90436 )
      ( MAKE-3CRATE-VERIFY ?auto_90433 ?auto_90434 ?auto_90435 ?auto_90436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90454 - SURFACE
      ?auto_90455 - SURFACE
      ?auto_90456 - SURFACE
      ?auto_90457 - SURFACE
    )
    :vars
    (
      ?auto_90459 - HOIST
      ?auto_90458 - PLACE
      ?auto_90460 - TRUCK
      ?auto_90461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90459 ?auto_90458 ) ( SURFACE-AT ?auto_90456 ?auto_90458 ) ( CLEAR ?auto_90456 ) ( IS-CRATE ?auto_90457 ) ( not ( = ?auto_90456 ?auto_90457 ) ) ( AVAILABLE ?auto_90459 ) ( IN ?auto_90457 ?auto_90460 ) ( ON ?auto_90456 ?auto_90455 ) ( not ( = ?auto_90455 ?auto_90456 ) ) ( not ( = ?auto_90455 ?auto_90457 ) ) ( TRUCK-AT ?auto_90460 ?auto_90461 ) ( not ( = ?auto_90461 ?auto_90458 ) ) ( ON ?auto_90455 ?auto_90454 ) ( not ( = ?auto_90454 ?auto_90455 ) ) ( not ( = ?auto_90454 ?auto_90456 ) ) ( not ( = ?auto_90454 ?auto_90457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90455 ?auto_90456 ?auto_90457 )
      ( MAKE-3CRATE-VERIFY ?auto_90454 ?auto_90455 ?auto_90456 ?auto_90457 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90478 - SURFACE
      ?auto_90479 - SURFACE
      ?auto_90480 - SURFACE
      ?auto_90481 - SURFACE
    )
    :vars
    (
      ?auto_90484 - HOIST
      ?auto_90483 - PLACE
      ?auto_90486 - TRUCK
      ?auto_90485 - PLACE
      ?auto_90482 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90484 ?auto_90483 ) ( SURFACE-AT ?auto_90480 ?auto_90483 ) ( CLEAR ?auto_90480 ) ( IS-CRATE ?auto_90481 ) ( not ( = ?auto_90480 ?auto_90481 ) ) ( AVAILABLE ?auto_90484 ) ( ON ?auto_90480 ?auto_90479 ) ( not ( = ?auto_90479 ?auto_90480 ) ) ( not ( = ?auto_90479 ?auto_90481 ) ) ( TRUCK-AT ?auto_90486 ?auto_90485 ) ( not ( = ?auto_90485 ?auto_90483 ) ) ( HOIST-AT ?auto_90482 ?auto_90485 ) ( LIFTING ?auto_90482 ?auto_90481 ) ( not ( = ?auto_90484 ?auto_90482 ) ) ( ON ?auto_90479 ?auto_90478 ) ( not ( = ?auto_90478 ?auto_90479 ) ) ( not ( = ?auto_90478 ?auto_90480 ) ) ( not ( = ?auto_90478 ?auto_90481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90479 ?auto_90480 ?auto_90481 )
      ( MAKE-3CRATE-VERIFY ?auto_90478 ?auto_90479 ?auto_90480 ?auto_90481 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90505 - SURFACE
      ?auto_90506 - SURFACE
      ?auto_90507 - SURFACE
      ?auto_90508 - SURFACE
    )
    :vars
    (
      ?auto_90509 - HOIST
      ?auto_90514 - PLACE
      ?auto_90510 - TRUCK
      ?auto_90511 - PLACE
      ?auto_90513 - HOIST
      ?auto_90512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90509 ?auto_90514 ) ( SURFACE-AT ?auto_90507 ?auto_90514 ) ( CLEAR ?auto_90507 ) ( IS-CRATE ?auto_90508 ) ( not ( = ?auto_90507 ?auto_90508 ) ) ( AVAILABLE ?auto_90509 ) ( ON ?auto_90507 ?auto_90506 ) ( not ( = ?auto_90506 ?auto_90507 ) ) ( not ( = ?auto_90506 ?auto_90508 ) ) ( TRUCK-AT ?auto_90510 ?auto_90511 ) ( not ( = ?auto_90511 ?auto_90514 ) ) ( HOIST-AT ?auto_90513 ?auto_90511 ) ( not ( = ?auto_90509 ?auto_90513 ) ) ( AVAILABLE ?auto_90513 ) ( SURFACE-AT ?auto_90508 ?auto_90511 ) ( ON ?auto_90508 ?auto_90512 ) ( CLEAR ?auto_90508 ) ( not ( = ?auto_90507 ?auto_90512 ) ) ( not ( = ?auto_90508 ?auto_90512 ) ) ( not ( = ?auto_90506 ?auto_90512 ) ) ( ON ?auto_90506 ?auto_90505 ) ( not ( = ?auto_90505 ?auto_90506 ) ) ( not ( = ?auto_90505 ?auto_90507 ) ) ( not ( = ?auto_90505 ?auto_90508 ) ) ( not ( = ?auto_90505 ?auto_90512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90506 ?auto_90507 ?auto_90508 )
      ( MAKE-3CRATE-VERIFY ?auto_90505 ?auto_90506 ?auto_90507 ?auto_90508 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90533 - SURFACE
      ?auto_90534 - SURFACE
      ?auto_90535 - SURFACE
      ?auto_90536 - SURFACE
    )
    :vars
    (
      ?auto_90541 - HOIST
      ?auto_90537 - PLACE
      ?auto_90540 - PLACE
      ?auto_90538 - HOIST
      ?auto_90539 - SURFACE
      ?auto_90542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90541 ?auto_90537 ) ( SURFACE-AT ?auto_90535 ?auto_90537 ) ( CLEAR ?auto_90535 ) ( IS-CRATE ?auto_90536 ) ( not ( = ?auto_90535 ?auto_90536 ) ) ( AVAILABLE ?auto_90541 ) ( ON ?auto_90535 ?auto_90534 ) ( not ( = ?auto_90534 ?auto_90535 ) ) ( not ( = ?auto_90534 ?auto_90536 ) ) ( not ( = ?auto_90540 ?auto_90537 ) ) ( HOIST-AT ?auto_90538 ?auto_90540 ) ( not ( = ?auto_90541 ?auto_90538 ) ) ( AVAILABLE ?auto_90538 ) ( SURFACE-AT ?auto_90536 ?auto_90540 ) ( ON ?auto_90536 ?auto_90539 ) ( CLEAR ?auto_90536 ) ( not ( = ?auto_90535 ?auto_90539 ) ) ( not ( = ?auto_90536 ?auto_90539 ) ) ( not ( = ?auto_90534 ?auto_90539 ) ) ( TRUCK-AT ?auto_90542 ?auto_90537 ) ( ON ?auto_90534 ?auto_90533 ) ( not ( = ?auto_90533 ?auto_90534 ) ) ( not ( = ?auto_90533 ?auto_90535 ) ) ( not ( = ?auto_90533 ?auto_90536 ) ) ( not ( = ?auto_90533 ?auto_90539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90534 ?auto_90535 ?auto_90536 )
      ( MAKE-3CRATE-VERIFY ?auto_90533 ?auto_90534 ?auto_90535 ?auto_90536 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90561 - SURFACE
      ?auto_90562 - SURFACE
      ?auto_90563 - SURFACE
      ?auto_90564 - SURFACE
    )
    :vars
    (
      ?auto_90567 - HOIST
      ?auto_90569 - PLACE
      ?auto_90565 - PLACE
      ?auto_90570 - HOIST
      ?auto_90568 - SURFACE
      ?auto_90566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90567 ?auto_90569 ) ( IS-CRATE ?auto_90564 ) ( not ( = ?auto_90563 ?auto_90564 ) ) ( not ( = ?auto_90562 ?auto_90563 ) ) ( not ( = ?auto_90562 ?auto_90564 ) ) ( not ( = ?auto_90565 ?auto_90569 ) ) ( HOIST-AT ?auto_90570 ?auto_90565 ) ( not ( = ?auto_90567 ?auto_90570 ) ) ( AVAILABLE ?auto_90570 ) ( SURFACE-AT ?auto_90564 ?auto_90565 ) ( ON ?auto_90564 ?auto_90568 ) ( CLEAR ?auto_90564 ) ( not ( = ?auto_90563 ?auto_90568 ) ) ( not ( = ?auto_90564 ?auto_90568 ) ) ( not ( = ?auto_90562 ?auto_90568 ) ) ( TRUCK-AT ?auto_90566 ?auto_90569 ) ( SURFACE-AT ?auto_90562 ?auto_90569 ) ( CLEAR ?auto_90562 ) ( LIFTING ?auto_90567 ?auto_90563 ) ( IS-CRATE ?auto_90563 ) ( ON ?auto_90562 ?auto_90561 ) ( not ( = ?auto_90561 ?auto_90562 ) ) ( not ( = ?auto_90561 ?auto_90563 ) ) ( not ( = ?auto_90561 ?auto_90564 ) ) ( not ( = ?auto_90561 ?auto_90568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90562 ?auto_90563 ?auto_90564 )
      ( MAKE-3CRATE-VERIFY ?auto_90561 ?auto_90562 ?auto_90563 ?auto_90564 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90589 - SURFACE
      ?auto_90590 - SURFACE
      ?auto_90591 - SURFACE
      ?auto_90592 - SURFACE
    )
    :vars
    (
      ?auto_90593 - HOIST
      ?auto_90597 - PLACE
      ?auto_90596 - PLACE
      ?auto_90598 - HOIST
      ?auto_90594 - SURFACE
      ?auto_90595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90593 ?auto_90597 ) ( IS-CRATE ?auto_90592 ) ( not ( = ?auto_90591 ?auto_90592 ) ) ( not ( = ?auto_90590 ?auto_90591 ) ) ( not ( = ?auto_90590 ?auto_90592 ) ) ( not ( = ?auto_90596 ?auto_90597 ) ) ( HOIST-AT ?auto_90598 ?auto_90596 ) ( not ( = ?auto_90593 ?auto_90598 ) ) ( AVAILABLE ?auto_90598 ) ( SURFACE-AT ?auto_90592 ?auto_90596 ) ( ON ?auto_90592 ?auto_90594 ) ( CLEAR ?auto_90592 ) ( not ( = ?auto_90591 ?auto_90594 ) ) ( not ( = ?auto_90592 ?auto_90594 ) ) ( not ( = ?auto_90590 ?auto_90594 ) ) ( TRUCK-AT ?auto_90595 ?auto_90597 ) ( SURFACE-AT ?auto_90590 ?auto_90597 ) ( CLEAR ?auto_90590 ) ( IS-CRATE ?auto_90591 ) ( AVAILABLE ?auto_90593 ) ( IN ?auto_90591 ?auto_90595 ) ( ON ?auto_90590 ?auto_90589 ) ( not ( = ?auto_90589 ?auto_90590 ) ) ( not ( = ?auto_90589 ?auto_90591 ) ) ( not ( = ?auto_90589 ?auto_90592 ) ) ( not ( = ?auto_90589 ?auto_90594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90590 ?auto_90591 ?auto_90592 )
      ( MAKE-3CRATE-VERIFY ?auto_90589 ?auto_90590 ?auto_90591 ?auto_90592 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90880 - SURFACE
      ?auto_90881 - SURFACE
      ?auto_90882 - SURFACE
      ?auto_90883 - SURFACE
      ?auto_90884 - SURFACE
    )
    :vars
    (
      ?auto_90885 - HOIST
      ?auto_90886 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90885 ?auto_90886 ) ( SURFACE-AT ?auto_90883 ?auto_90886 ) ( CLEAR ?auto_90883 ) ( LIFTING ?auto_90885 ?auto_90884 ) ( IS-CRATE ?auto_90884 ) ( not ( = ?auto_90883 ?auto_90884 ) ) ( ON ?auto_90881 ?auto_90880 ) ( ON ?auto_90882 ?auto_90881 ) ( ON ?auto_90883 ?auto_90882 ) ( not ( = ?auto_90880 ?auto_90881 ) ) ( not ( = ?auto_90880 ?auto_90882 ) ) ( not ( = ?auto_90880 ?auto_90883 ) ) ( not ( = ?auto_90880 ?auto_90884 ) ) ( not ( = ?auto_90881 ?auto_90882 ) ) ( not ( = ?auto_90881 ?auto_90883 ) ) ( not ( = ?auto_90881 ?auto_90884 ) ) ( not ( = ?auto_90882 ?auto_90883 ) ) ( not ( = ?auto_90882 ?auto_90884 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90883 ?auto_90884 )
      ( MAKE-4CRATE-VERIFY ?auto_90880 ?auto_90881 ?auto_90882 ?auto_90883 ?auto_90884 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90905 - SURFACE
      ?auto_90906 - SURFACE
      ?auto_90907 - SURFACE
      ?auto_90908 - SURFACE
      ?auto_90909 - SURFACE
    )
    :vars
    (
      ?auto_90911 - HOIST
      ?auto_90910 - PLACE
      ?auto_90912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90911 ?auto_90910 ) ( SURFACE-AT ?auto_90908 ?auto_90910 ) ( CLEAR ?auto_90908 ) ( IS-CRATE ?auto_90909 ) ( not ( = ?auto_90908 ?auto_90909 ) ) ( TRUCK-AT ?auto_90912 ?auto_90910 ) ( AVAILABLE ?auto_90911 ) ( IN ?auto_90909 ?auto_90912 ) ( ON ?auto_90908 ?auto_90907 ) ( not ( = ?auto_90907 ?auto_90908 ) ) ( not ( = ?auto_90907 ?auto_90909 ) ) ( ON ?auto_90906 ?auto_90905 ) ( ON ?auto_90907 ?auto_90906 ) ( not ( = ?auto_90905 ?auto_90906 ) ) ( not ( = ?auto_90905 ?auto_90907 ) ) ( not ( = ?auto_90905 ?auto_90908 ) ) ( not ( = ?auto_90905 ?auto_90909 ) ) ( not ( = ?auto_90906 ?auto_90907 ) ) ( not ( = ?auto_90906 ?auto_90908 ) ) ( not ( = ?auto_90906 ?auto_90909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90907 ?auto_90908 ?auto_90909 )
      ( MAKE-4CRATE-VERIFY ?auto_90905 ?auto_90906 ?auto_90907 ?auto_90908 ?auto_90909 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90935 - SURFACE
      ?auto_90936 - SURFACE
      ?auto_90937 - SURFACE
      ?auto_90938 - SURFACE
      ?auto_90939 - SURFACE
    )
    :vars
    (
      ?auto_90942 - HOIST
      ?auto_90940 - PLACE
      ?auto_90941 - TRUCK
      ?auto_90943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90942 ?auto_90940 ) ( SURFACE-AT ?auto_90938 ?auto_90940 ) ( CLEAR ?auto_90938 ) ( IS-CRATE ?auto_90939 ) ( not ( = ?auto_90938 ?auto_90939 ) ) ( AVAILABLE ?auto_90942 ) ( IN ?auto_90939 ?auto_90941 ) ( ON ?auto_90938 ?auto_90937 ) ( not ( = ?auto_90937 ?auto_90938 ) ) ( not ( = ?auto_90937 ?auto_90939 ) ) ( TRUCK-AT ?auto_90941 ?auto_90943 ) ( not ( = ?auto_90943 ?auto_90940 ) ) ( ON ?auto_90936 ?auto_90935 ) ( ON ?auto_90937 ?auto_90936 ) ( not ( = ?auto_90935 ?auto_90936 ) ) ( not ( = ?auto_90935 ?auto_90937 ) ) ( not ( = ?auto_90935 ?auto_90938 ) ) ( not ( = ?auto_90935 ?auto_90939 ) ) ( not ( = ?auto_90936 ?auto_90937 ) ) ( not ( = ?auto_90936 ?auto_90938 ) ) ( not ( = ?auto_90936 ?auto_90939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90937 ?auto_90938 ?auto_90939 )
      ( MAKE-4CRATE-VERIFY ?auto_90935 ?auto_90936 ?auto_90937 ?auto_90938 ?auto_90939 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90969 - SURFACE
      ?auto_90970 - SURFACE
      ?auto_90971 - SURFACE
      ?auto_90972 - SURFACE
      ?auto_90973 - SURFACE
    )
    :vars
    (
      ?auto_90975 - HOIST
      ?auto_90978 - PLACE
      ?auto_90976 - TRUCK
      ?auto_90977 - PLACE
      ?auto_90974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90975 ?auto_90978 ) ( SURFACE-AT ?auto_90972 ?auto_90978 ) ( CLEAR ?auto_90972 ) ( IS-CRATE ?auto_90973 ) ( not ( = ?auto_90972 ?auto_90973 ) ) ( AVAILABLE ?auto_90975 ) ( ON ?auto_90972 ?auto_90971 ) ( not ( = ?auto_90971 ?auto_90972 ) ) ( not ( = ?auto_90971 ?auto_90973 ) ) ( TRUCK-AT ?auto_90976 ?auto_90977 ) ( not ( = ?auto_90977 ?auto_90978 ) ) ( HOIST-AT ?auto_90974 ?auto_90977 ) ( LIFTING ?auto_90974 ?auto_90973 ) ( not ( = ?auto_90975 ?auto_90974 ) ) ( ON ?auto_90970 ?auto_90969 ) ( ON ?auto_90971 ?auto_90970 ) ( not ( = ?auto_90969 ?auto_90970 ) ) ( not ( = ?auto_90969 ?auto_90971 ) ) ( not ( = ?auto_90969 ?auto_90972 ) ) ( not ( = ?auto_90969 ?auto_90973 ) ) ( not ( = ?auto_90970 ?auto_90971 ) ) ( not ( = ?auto_90970 ?auto_90972 ) ) ( not ( = ?auto_90970 ?auto_90973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90971 ?auto_90972 ?auto_90973 )
      ( MAKE-4CRATE-VERIFY ?auto_90969 ?auto_90970 ?auto_90971 ?auto_90972 ?auto_90973 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_91007 - SURFACE
      ?auto_91008 - SURFACE
      ?auto_91009 - SURFACE
      ?auto_91010 - SURFACE
      ?auto_91011 - SURFACE
    )
    :vars
    (
      ?auto_91016 - HOIST
      ?auto_91014 - PLACE
      ?auto_91013 - TRUCK
      ?auto_91017 - PLACE
      ?auto_91012 - HOIST
      ?auto_91015 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91016 ?auto_91014 ) ( SURFACE-AT ?auto_91010 ?auto_91014 ) ( CLEAR ?auto_91010 ) ( IS-CRATE ?auto_91011 ) ( not ( = ?auto_91010 ?auto_91011 ) ) ( AVAILABLE ?auto_91016 ) ( ON ?auto_91010 ?auto_91009 ) ( not ( = ?auto_91009 ?auto_91010 ) ) ( not ( = ?auto_91009 ?auto_91011 ) ) ( TRUCK-AT ?auto_91013 ?auto_91017 ) ( not ( = ?auto_91017 ?auto_91014 ) ) ( HOIST-AT ?auto_91012 ?auto_91017 ) ( not ( = ?auto_91016 ?auto_91012 ) ) ( AVAILABLE ?auto_91012 ) ( SURFACE-AT ?auto_91011 ?auto_91017 ) ( ON ?auto_91011 ?auto_91015 ) ( CLEAR ?auto_91011 ) ( not ( = ?auto_91010 ?auto_91015 ) ) ( not ( = ?auto_91011 ?auto_91015 ) ) ( not ( = ?auto_91009 ?auto_91015 ) ) ( ON ?auto_91008 ?auto_91007 ) ( ON ?auto_91009 ?auto_91008 ) ( not ( = ?auto_91007 ?auto_91008 ) ) ( not ( = ?auto_91007 ?auto_91009 ) ) ( not ( = ?auto_91007 ?auto_91010 ) ) ( not ( = ?auto_91007 ?auto_91011 ) ) ( not ( = ?auto_91007 ?auto_91015 ) ) ( not ( = ?auto_91008 ?auto_91009 ) ) ( not ( = ?auto_91008 ?auto_91010 ) ) ( not ( = ?auto_91008 ?auto_91011 ) ) ( not ( = ?auto_91008 ?auto_91015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91009 ?auto_91010 ?auto_91011 )
      ( MAKE-4CRATE-VERIFY ?auto_91007 ?auto_91008 ?auto_91009 ?auto_91010 ?auto_91011 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_91046 - SURFACE
      ?auto_91047 - SURFACE
      ?auto_91048 - SURFACE
      ?auto_91049 - SURFACE
      ?auto_91050 - SURFACE
    )
    :vars
    (
      ?auto_91051 - HOIST
      ?auto_91056 - PLACE
      ?auto_91053 - PLACE
      ?auto_91054 - HOIST
      ?auto_91055 - SURFACE
      ?auto_91052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91051 ?auto_91056 ) ( SURFACE-AT ?auto_91049 ?auto_91056 ) ( CLEAR ?auto_91049 ) ( IS-CRATE ?auto_91050 ) ( not ( = ?auto_91049 ?auto_91050 ) ) ( AVAILABLE ?auto_91051 ) ( ON ?auto_91049 ?auto_91048 ) ( not ( = ?auto_91048 ?auto_91049 ) ) ( not ( = ?auto_91048 ?auto_91050 ) ) ( not ( = ?auto_91053 ?auto_91056 ) ) ( HOIST-AT ?auto_91054 ?auto_91053 ) ( not ( = ?auto_91051 ?auto_91054 ) ) ( AVAILABLE ?auto_91054 ) ( SURFACE-AT ?auto_91050 ?auto_91053 ) ( ON ?auto_91050 ?auto_91055 ) ( CLEAR ?auto_91050 ) ( not ( = ?auto_91049 ?auto_91055 ) ) ( not ( = ?auto_91050 ?auto_91055 ) ) ( not ( = ?auto_91048 ?auto_91055 ) ) ( TRUCK-AT ?auto_91052 ?auto_91056 ) ( ON ?auto_91047 ?auto_91046 ) ( ON ?auto_91048 ?auto_91047 ) ( not ( = ?auto_91046 ?auto_91047 ) ) ( not ( = ?auto_91046 ?auto_91048 ) ) ( not ( = ?auto_91046 ?auto_91049 ) ) ( not ( = ?auto_91046 ?auto_91050 ) ) ( not ( = ?auto_91046 ?auto_91055 ) ) ( not ( = ?auto_91047 ?auto_91048 ) ) ( not ( = ?auto_91047 ?auto_91049 ) ) ( not ( = ?auto_91047 ?auto_91050 ) ) ( not ( = ?auto_91047 ?auto_91055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91048 ?auto_91049 ?auto_91050 )
      ( MAKE-4CRATE-VERIFY ?auto_91046 ?auto_91047 ?auto_91048 ?auto_91049 ?auto_91050 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_91085 - SURFACE
      ?auto_91086 - SURFACE
      ?auto_91087 - SURFACE
      ?auto_91088 - SURFACE
      ?auto_91089 - SURFACE
    )
    :vars
    (
      ?auto_91091 - HOIST
      ?auto_91094 - PLACE
      ?auto_91090 - PLACE
      ?auto_91093 - HOIST
      ?auto_91092 - SURFACE
      ?auto_91095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91091 ?auto_91094 ) ( IS-CRATE ?auto_91089 ) ( not ( = ?auto_91088 ?auto_91089 ) ) ( not ( = ?auto_91087 ?auto_91088 ) ) ( not ( = ?auto_91087 ?auto_91089 ) ) ( not ( = ?auto_91090 ?auto_91094 ) ) ( HOIST-AT ?auto_91093 ?auto_91090 ) ( not ( = ?auto_91091 ?auto_91093 ) ) ( AVAILABLE ?auto_91093 ) ( SURFACE-AT ?auto_91089 ?auto_91090 ) ( ON ?auto_91089 ?auto_91092 ) ( CLEAR ?auto_91089 ) ( not ( = ?auto_91088 ?auto_91092 ) ) ( not ( = ?auto_91089 ?auto_91092 ) ) ( not ( = ?auto_91087 ?auto_91092 ) ) ( TRUCK-AT ?auto_91095 ?auto_91094 ) ( SURFACE-AT ?auto_91087 ?auto_91094 ) ( CLEAR ?auto_91087 ) ( LIFTING ?auto_91091 ?auto_91088 ) ( IS-CRATE ?auto_91088 ) ( ON ?auto_91086 ?auto_91085 ) ( ON ?auto_91087 ?auto_91086 ) ( not ( = ?auto_91085 ?auto_91086 ) ) ( not ( = ?auto_91085 ?auto_91087 ) ) ( not ( = ?auto_91085 ?auto_91088 ) ) ( not ( = ?auto_91085 ?auto_91089 ) ) ( not ( = ?auto_91085 ?auto_91092 ) ) ( not ( = ?auto_91086 ?auto_91087 ) ) ( not ( = ?auto_91086 ?auto_91088 ) ) ( not ( = ?auto_91086 ?auto_91089 ) ) ( not ( = ?auto_91086 ?auto_91092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91087 ?auto_91088 ?auto_91089 )
      ( MAKE-4CRATE-VERIFY ?auto_91085 ?auto_91086 ?auto_91087 ?auto_91088 ?auto_91089 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_91124 - SURFACE
      ?auto_91125 - SURFACE
      ?auto_91126 - SURFACE
      ?auto_91127 - SURFACE
      ?auto_91128 - SURFACE
    )
    :vars
    (
      ?auto_91133 - HOIST
      ?auto_91130 - PLACE
      ?auto_91132 - PLACE
      ?auto_91134 - HOIST
      ?auto_91131 - SURFACE
      ?auto_91129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91133 ?auto_91130 ) ( IS-CRATE ?auto_91128 ) ( not ( = ?auto_91127 ?auto_91128 ) ) ( not ( = ?auto_91126 ?auto_91127 ) ) ( not ( = ?auto_91126 ?auto_91128 ) ) ( not ( = ?auto_91132 ?auto_91130 ) ) ( HOIST-AT ?auto_91134 ?auto_91132 ) ( not ( = ?auto_91133 ?auto_91134 ) ) ( AVAILABLE ?auto_91134 ) ( SURFACE-AT ?auto_91128 ?auto_91132 ) ( ON ?auto_91128 ?auto_91131 ) ( CLEAR ?auto_91128 ) ( not ( = ?auto_91127 ?auto_91131 ) ) ( not ( = ?auto_91128 ?auto_91131 ) ) ( not ( = ?auto_91126 ?auto_91131 ) ) ( TRUCK-AT ?auto_91129 ?auto_91130 ) ( SURFACE-AT ?auto_91126 ?auto_91130 ) ( CLEAR ?auto_91126 ) ( IS-CRATE ?auto_91127 ) ( AVAILABLE ?auto_91133 ) ( IN ?auto_91127 ?auto_91129 ) ( ON ?auto_91125 ?auto_91124 ) ( ON ?auto_91126 ?auto_91125 ) ( not ( = ?auto_91124 ?auto_91125 ) ) ( not ( = ?auto_91124 ?auto_91126 ) ) ( not ( = ?auto_91124 ?auto_91127 ) ) ( not ( = ?auto_91124 ?auto_91128 ) ) ( not ( = ?auto_91124 ?auto_91131 ) ) ( not ( = ?auto_91125 ?auto_91126 ) ) ( not ( = ?auto_91125 ?auto_91127 ) ) ( not ( = ?auto_91125 ?auto_91128 ) ) ( not ( = ?auto_91125 ?auto_91131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91126 ?auto_91127 ?auto_91128 )
      ( MAKE-4CRATE-VERIFY ?auto_91124 ?auto_91125 ?auto_91126 ?auto_91127 ?auto_91128 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91784 - SURFACE
      ?auto_91785 - SURFACE
      ?auto_91786 - SURFACE
      ?auto_91787 - SURFACE
      ?auto_91788 - SURFACE
      ?auto_91789 - SURFACE
    )
    :vars
    (
      ?auto_91790 - HOIST
      ?auto_91791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91790 ?auto_91791 ) ( SURFACE-AT ?auto_91788 ?auto_91791 ) ( CLEAR ?auto_91788 ) ( LIFTING ?auto_91790 ?auto_91789 ) ( IS-CRATE ?auto_91789 ) ( not ( = ?auto_91788 ?auto_91789 ) ) ( ON ?auto_91785 ?auto_91784 ) ( ON ?auto_91786 ?auto_91785 ) ( ON ?auto_91787 ?auto_91786 ) ( ON ?auto_91788 ?auto_91787 ) ( not ( = ?auto_91784 ?auto_91785 ) ) ( not ( = ?auto_91784 ?auto_91786 ) ) ( not ( = ?auto_91784 ?auto_91787 ) ) ( not ( = ?auto_91784 ?auto_91788 ) ) ( not ( = ?auto_91784 ?auto_91789 ) ) ( not ( = ?auto_91785 ?auto_91786 ) ) ( not ( = ?auto_91785 ?auto_91787 ) ) ( not ( = ?auto_91785 ?auto_91788 ) ) ( not ( = ?auto_91785 ?auto_91789 ) ) ( not ( = ?auto_91786 ?auto_91787 ) ) ( not ( = ?auto_91786 ?auto_91788 ) ) ( not ( = ?auto_91786 ?auto_91789 ) ) ( not ( = ?auto_91787 ?auto_91788 ) ) ( not ( = ?auto_91787 ?auto_91789 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_91788 ?auto_91789 )
      ( MAKE-5CRATE-VERIFY ?auto_91784 ?auto_91785 ?auto_91786 ?auto_91787 ?auto_91788 ?auto_91789 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91818 - SURFACE
      ?auto_91819 - SURFACE
      ?auto_91820 - SURFACE
      ?auto_91821 - SURFACE
      ?auto_91822 - SURFACE
      ?auto_91823 - SURFACE
    )
    :vars
    (
      ?auto_91825 - HOIST
      ?auto_91826 - PLACE
      ?auto_91824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91825 ?auto_91826 ) ( SURFACE-AT ?auto_91822 ?auto_91826 ) ( CLEAR ?auto_91822 ) ( IS-CRATE ?auto_91823 ) ( not ( = ?auto_91822 ?auto_91823 ) ) ( TRUCK-AT ?auto_91824 ?auto_91826 ) ( AVAILABLE ?auto_91825 ) ( IN ?auto_91823 ?auto_91824 ) ( ON ?auto_91822 ?auto_91821 ) ( not ( = ?auto_91821 ?auto_91822 ) ) ( not ( = ?auto_91821 ?auto_91823 ) ) ( ON ?auto_91819 ?auto_91818 ) ( ON ?auto_91820 ?auto_91819 ) ( ON ?auto_91821 ?auto_91820 ) ( not ( = ?auto_91818 ?auto_91819 ) ) ( not ( = ?auto_91818 ?auto_91820 ) ) ( not ( = ?auto_91818 ?auto_91821 ) ) ( not ( = ?auto_91818 ?auto_91822 ) ) ( not ( = ?auto_91818 ?auto_91823 ) ) ( not ( = ?auto_91819 ?auto_91820 ) ) ( not ( = ?auto_91819 ?auto_91821 ) ) ( not ( = ?auto_91819 ?auto_91822 ) ) ( not ( = ?auto_91819 ?auto_91823 ) ) ( not ( = ?auto_91820 ?auto_91821 ) ) ( not ( = ?auto_91820 ?auto_91822 ) ) ( not ( = ?auto_91820 ?auto_91823 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91821 ?auto_91822 ?auto_91823 )
      ( MAKE-5CRATE-VERIFY ?auto_91818 ?auto_91819 ?auto_91820 ?auto_91821 ?auto_91822 ?auto_91823 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91858 - SURFACE
      ?auto_91859 - SURFACE
      ?auto_91860 - SURFACE
      ?auto_91861 - SURFACE
      ?auto_91862 - SURFACE
      ?auto_91863 - SURFACE
    )
    :vars
    (
      ?auto_91864 - HOIST
      ?auto_91867 - PLACE
      ?auto_91866 - TRUCK
      ?auto_91865 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91864 ?auto_91867 ) ( SURFACE-AT ?auto_91862 ?auto_91867 ) ( CLEAR ?auto_91862 ) ( IS-CRATE ?auto_91863 ) ( not ( = ?auto_91862 ?auto_91863 ) ) ( AVAILABLE ?auto_91864 ) ( IN ?auto_91863 ?auto_91866 ) ( ON ?auto_91862 ?auto_91861 ) ( not ( = ?auto_91861 ?auto_91862 ) ) ( not ( = ?auto_91861 ?auto_91863 ) ) ( TRUCK-AT ?auto_91866 ?auto_91865 ) ( not ( = ?auto_91865 ?auto_91867 ) ) ( ON ?auto_91859 ?auto_91858 ) ( ON ?auto_91860 ?auto_91859 ) ( ON ?auto_91861 ?auto_91860 ) ( not ( = ?auto_91858 ?auto_91859 ) ) ( not ( = ?auto_91858 ?auto_91860 ) ) ( not ( = ?auto_91858 ?auto_91861 ) ) ( not ( = ?auto_91858 ?auto_91862 ) ) ( not ( = ?auto_91858 ?auto_91863 ) ) ( not ( = ?auto_91859 ?auto_91860 ) ) ( not ( = ?auto_91859 ?auto_91861 ) ) ( not ( = ?auto_91859 ?auto_91862 ) ) ( not ( = ?auto_91859 ?auto_91863 ) ) ( not ( = ?auto_91860 ?auto_91861 ) ) ( not ( = ?auto_91860 ?auto_91862 ) ) ( not ( = ?auto_91860 ?auto_91863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91861 ?auto_91862 ?auto_91863 )
      ( MAKE-5CRATE-VERIFY ?auto_91858 ?auto_91859 ?auto_91860 ?auto_91861 ?auto_91862 ?auto_91863 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91903 - SURFACE
      ?auto_91904 - SURFACE
      ?auto_91905 - SURFACE
      ?auto_91906 - SURFACE
      ?auto_91907 - SURFACE
      ?auto_91908 - SURFACE
    )
    :vars
    (
      ?auto_91910 - HOIST
      ?auto_91911 - PLACE
      ?auto_91912 - TRUCK
      ?auto_91913 - PLACE
      ?auto_91909 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_91910 ?auto_91911 ) ( SURFACE-AT ?auto_91907 ?auto_91911 ) ( CLEAR ?auto_91907 ) ( IS-CRATE ?auto_91908 ) ( not ( = ?auto_91907 ?auto_91908 ) ) ( AVAILABLE ?auto_91910 ) ( ON ?auto_91907 ?auto_91906 ) ( not ( = ?auto_91906 ?auto_91907 ) ) ( not ( = ?auto_91906 ?auto_91908 ) ) ( TRUCK-AT ?auto_91912 ?auto_91913 ) ( not ( = ?auto_91913 ?auto_91911 ) ) ( HOIST-AT ?auto_91909 ?auto_91913 ) ( LIFTING ?auto_91909 ?auto_91908 ) ( not ( = ?auto_91910 ?auto_91909 ) ) ( ON ?auto_91904 ?auto_91903 ) ( ON ?auto_91905 ?auto_91904 ) ( ON ?auto_91906 ?auto_91905 ) ( not ( = ?auto_91903 ?auto_91904 ) ) ( not ( = ?auto_91903 ?auto_91905 ) ) ( not ( = ?auto_91903 ?auto_91906 ) ) ( not ( = ?auto_91903 ?auto_91907 ) ) ( not ( = ?auto_91903 ?auto_91908 ) ) ( not ( = ?auto_91904 ?auto_91905 ) ) ( not ( = ?auto_91904 ?auto_91906 ) ) ( not ( = ?auto_91904 ?auto_91907 ) ) ( not ( = ?auto_91904 ?auto_91908 ) ) ( not ( = ?auto_91905 ?auto_91906 ) ) ( not ( = ?auto_91905 ?auto_91907 ) ) ( not ( = ?auto_91905 ?auto_91908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91906 ?auto_91907 ?auto_91908 )
      ( MAKE-5CRATE-VERIFY ?auto_91903 ?auto_91904 ?auto_91905 ?auto_91906 ?auto_91907 ?auto_91908 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91953 - SURFACE
      ?auto_91954 - SURFACE
      ?auto_91955 - SURFACE
      ?auto_91956 - SURFACE
      ?auto_91957 - SURFACE
      ?auto_91958 - SURFACE
    )
    :vars
    (
      ?auto_91963 - HOIST
      ?auto_91961 - PLACE
      ?auto_91964 - TRUCK
      ?auto_91962 - PLACE
      ?auto_91959 - HOIST
      ?auto_91960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91963 ?auto_91961 ) ( SURFACE-AT ?auto_91957 ?auto_91961 ) ( CLEAR ?auto_91957 ) ( IS-CRATE ?auto_91958 ) ( not ( = ?auto_91957 ?auto_91958 ) ) ( AVAILABLE ?auto_91963 ) ( ON ?auto_91957 ?auto_91956 ) ( not ( = ?auto_91956 ?auto_91957 ) ) ( not ( = ?auto_91956 ?auto_91958 ) ) ( TRUCK-AT ?auto_91964 ?auto_91962 ) ( not ( = ?auto_91962 ?auto_91961 ) ) ( HOIST-AT ?auto_91959 ?auto_91962 ) ( not ( = ?auto_91963 ?auto_91959 ) ) ( AVAILABLE ?auto_91959 ) ( SURFACE-AT ?auto_91958 ?auto_91962 ) ( ON ?auto_91958 ?auto_91960 ) ( CLEAR ?auto_91958 ) ( not ( = ?auto_91957 ?auto_91960 ) ) ( not ( = ?auto_91958 ?auto_91960 ) ) ( not ( = ?auto_91956 ?auto_91960 ) ) ( ON ?auto_91954 ?auto_91953 ) ( ON ?auto_91955 ?auto_91954 ) ( ON ?auto_91956 ?auto_91955 ) ( not ( = ?auto_91953 ?auto_91954 ) ) ( not ( = ?auto_91953 ?auto_91955 ) ) ( not ( = ?auto_91953 ?auto_91956 ) ) ( not ( = ?auto_91953 ?auto_91957 ) ) ( not ( = ?auto_91953 ?auto_91958 ) ) ( not ( = ?auto_91953 ?auto_91960 ) ) ( not ( = ?auto_91954 ?auto_91955 ) ) ( not ( = ?auto_91954 ?auto_91956 ) ) ( not ( = ?auto_91954 ?auto_91957 ) ) ( not ( = ?auto_91954 ?auto_91958 ) ) ( not ( = ?auto_91954 ?auto_91960 ) ) ( not ( = ?auto_91955 ?auto_91956 ) ) ( not ( = ?auto_91955 ?auto_91957 ) ) ( not ( = ?auto_91955 ?auto_91958 ) ) ( not ( = ?auto_91955 ?auto_91960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91956 ?auto_91957 ?auto_91958 )
      ( MAKE-5CRATE-VERIFY ?auto_91953 ?auto_91954 ?auto_91955 ?auto_91956 ?auto_91957 ?auto_91958 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_92004 - SURFACE
      ?auto_92005 - SURFACE
      ?auto_92006 - SURFACE
      ?auto_92007 - SURFACE
      ?auto_92008 - SURFACE
      ?auto_92009 - SURFACE
    )
    :vars
    (
      ?auto_92013 - HOIST
      ?auto_92010 - PLACE
      ?auto_92011 - PLACE
      ?auto_92012 - HOIST
      ?auto_92015 - SURFACE
      ?auto_92014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_92013 ?auto_92010 ) ( SURFACE-AT ?auto_92008 ?auto_92010 ) ( CLEAR ?auto_92008 ) ( IS-CRATE ?auto_92009 ) ( not ( = ?auto_92008 ?auto_92009 ) ) ( AVAILABLE ?auto_92013 ) ( ON ?auto_92008 ?auto_92007 ) ( not ( = ?auto_92007 ?auto_92008 ) ) ( not ( = ?auto_92007 ?auto_92009 ) ) ( not ( = ?auto_92011 ?auto_92010 ) ) ( HOIST-AT ?auto_92012 ?auto_92011 ) ( not ( = ?auto_92013 ?auto_92012 ) ) ( AVAILABLE ?auto_92012 ) ( SURFACE-AT ?auto_92009 ?auto_92011 ) ( ON ?auto_92009 ?auto_92015 ) ( CLEAR ?auto_92009 ) ( not ( = ?auto_92008 ?auto_92015 ) ) ( not ( = ?auto_92009 ?auto_92015 ) ) ( not ( = ?auto_92007 ?auto_92015 ) ) ( TRUCK-AT ?auto_92014 ?auto_92010 ) ( ON ?auto_92005 ?auto_92004 ) ( ON ?auto_92006 ?auto_92005 ) ( ON ?auto_92007 ?auto_92006 ) ( not ( = ?auto_92004 ?auto_92005 ) ) ( not ( = ?auto_92004 ?auto_92006 ) ) ( not ( = ?auto_92004 ?auto_92007 ) ) ( not ( = ?auto_92004 ?auto_92008 ) ) ( not ( = ?auto_92004 ?auto_92009 ) ) ( not ( = ?auto_92004 ?auto_92015 ) ) ( not ( = ?auto_92005 ?auto_92006 ) ) ( not ( = ?auto_92005 ?auto_92007 ) ) ( not ( = ?auto_92005 ?auto_92008 ) ) ( not ( = ?auto_92005 ?auto_92009 ) ) ( not ( = ?auto_92005 ?auto_92015 ) ) ( not ( = ?auto_92006 ?auto_92007 ) ) ( not ( = ?auto_92006 ?auto_92008 ) ) ( not ( = ?auto_92006 ?auto_92009 ) ) ( not ( = ?auto_92006 ?auto_92015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_92007 ?auto_92008 ?auto_92009 )
      ( MAKE-5CRATE-VERIFY ?auto_92004 ?auto_92005 ?auto_92006 ?auto_92007 ?auto_92008 ?auto_92009 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_92055 - SURFACE
      ?auto_92056 - SURFACE
      ?auto_92057 - SURFACE
      ?auto_92058 - SURFACE
      ?auto_92059 - SURFACE
      ?auto_92060 - SURFACE
    )
    :vars
    (
      ?auto_92061 - HOIST
      ?auto_92063 - PLACE
      ?auto_92062 - PLACE
      ?auto_92066 - HOIST
      ?auto_92065 - SURFACE
      ?auto_92064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_92061 ?auto_92063 ) ( IS-CRATE ?auto_92060 ) ( not ( = ?auto_92059 ?auto_92060 ) ) ( not ( = ?auto_92058 ?auto_92059 ) ) ( not ( = ?auto_92058 ?auto_92060 ) ) ( not ( = ?auto_92062 ?auto_92063 ) ) ( HOIST-AT ?auto_92066 ?auto_92062 ) ( not ( = ?auto_92061 ?auto_92066 ) ) ( AVAILABLE ?auto_92066 ) ( SURFACE-AT ?auto_92060 ?auto_92062 ) ( ON ?auto_92060 ?auto_92065 ) ( CLEAR ?auto_92060 ) ( not ( = ?auto_92059 ?auto_92065 ) ) ( not ( = ?auto_92060 ?auto_92065 ) ) ( not ( = ?auto_92058 ?auto_92065 ) ) ( TRUCK-AT ?auto_92064 ?auto_92063 ) ( SURFACE-AT ?auto_92058 ?auto_92063 ) ( CLEAR ?auto_92058 ) ( LIFTING ?auto_92061 ?auto_92059 ) ( IS-CRATE ?auto_92059 ) ( ON ?auto_92056 ?auto_92055 ) ( ON ?auto_92057 ?auto_92056 ) ( ON ?auto_92058 ?auto_92057 ) ( not ( = ?auto_92055 ?auto_92056 ) ) ( not ( = ?auto_92055 ?auto_92057 ) ) ( not ( = ?auto_92055 ?auto_92058 ) ) ( not ( = ?auto_92055 ?auto_92059 ) ) ( not ( = ?auto_92055 ?auto_92060 ) ) ( not ( = ?auto_92055 ?auto_92065 ) ) ( not ( = ?auto_92056 ?auto_92057 ) ) ( not ( = ?auto_92056 ?auto_92058 ) ) ( not ( = ?auto_92056 ?auto_92059 ) ) ( not ( = ?auto_92056 ?auto_92060 ) ) ( not ( = ?auto_92056 ?auto_92065 ) ) ( not ( = ?auto_92057 ?auto_92058 ) ) ( not ( = ?auto_92057 ?auto_92059 ) ) ( not ( = ?auto_92057 ?auto_92060 ) ) ( not ( = ?auto_92057 ?auto_92065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_92058 ?auto_92059 ?auto_92060 )
      ( MAKE-5CRATE-VERIFY ?auto_92055 ?auto_92056 ?auto_92057 ?auto_92058 ?auto_92059 ?auto_92060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_92106 - SURFACE
      ?auto_92107 - SURFACE
      ?auto_92108 - SURFACE
      ?auto_92109 - SURFACE
      ?auto_92110 - SURFACE
      ?auto_92111 - SURFACE
    )
    :vars
    (
      ?auto_92115 - HOIST
      ?auto_92116 - PLACE
      ?auto_92117 - PLACE
      ?auto_92113 - HOIST
      ?auto_92112 - SURFACE
      ?auto_92114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_92115 ?auto_92116 ) ( IS-CRATE ?auto_92111 ) ( not ( = ?auto_92110 ?auto_92111 ) ) ( not ( = ?auto_92109 ?auto_92110 ) ) ( not ( = ?auto_92109 ?auto_92111 ) ) ( not ( = ?auto_92117 ?auto_92116 ) ) ( HOIST-AT ?auto_92113 ?auto_92117 ) ( not ( = ?auto_92115 ?auto_92113 ) ) ( AVAILABLE ?auto_92113 ) ( SURFACE-AT ?auto_92111 ?auto_92117 ) ( ON ?auto_92111 ?auto_92112 ) ( CLEAR ?auto_92111 ) ( not ( = ?auto_92110 ?auto_92112 ) ) ( not ( = ?auto_92111 ?auto_92112 ) ) ( not ( = ?auto_92109 ?auto_92112 ) ) ( TRUCK-AT ?auto_92114 ?auto_92116 ) ( SURFACE-AT ?auto_92109 ?auto_92116 ) ( CLEAR ?auto_92109 ) ( IS-CRATE ?auto_92110 ) ( AVAILABLE ?auto_92115 ) ( IN ?auto_92110 ?auto_92114 ) ( ON ?auto_92107 ?auto_92106 ) ( ON ?auto_92108 ?auto_92107 ) ( ON ?auto_92109 ?auto_92108 ) ( not ( = ?auto_92106 ?auto_92107 ) ) ( not ( = ?auto_92106 ?auto_92108 ) ) ( not ( = ?auto_92106 ?auto_92109 ) ) ( not ( = ?auto_92106 ?auto_92110 ) ) ( not ( = ?auto_92106 ?auto_92111 ) ) ( not ( = ?auto_92106 ?auto_92112 ) ) ( not ( = ?auto_92107 ?auto_92108 ) ) ( not ( = ?auto_92107 ?auto_92109 ) ) ( not ( = ?auto_92107 ?auto_92110 ) ) ( not ( = ?auto_92107 ?auto_92111 ) ) ( not ( = ?auto_92107 ?auto_92112 ) ) ( not ( = ?auto_92108 ?auto_92109 ) ) ( not ( = ?auto_92108 ?auto_92110 ) ) ( not ( = ?auto_92108 ?auto_92111 ) ) ( not ( = ?auto_92108 ?auto_92112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_92109 ?auto_92110 ?auto_92111 )
      ( MAKE-5CRATE-VERIFY ?auto_92106 ?auto_92107 ?auto_92108 ?auto_92109 ?auto_92110 ?auto_92111 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93315 - SURFACE
      ?auto_93316 - SURFACE
      ?auto_93317 - SURFACE
      ?auto_93318 - SURFACE
      ?auto_93319 - SURFACE
      ?auto_93320 - SURFACE
      ?auto_93321 - SURFACE
    )
    :vars
    (
      ?auto_93323 - HOIST
      ?auto_93322 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93323 ?auto_93322 ) ( SURFACE-AT ?auto_93320 ?auto_93322 ) ( CLEAR ?auto_93320 ) ( LIFTING ?auto_93323 ?auto_93321 ) ( IS-CRATE ?auto_93321 ) ( not ( = ?auto_93320 ?auto_93321 ) ) ( ON ?auto_93316 ?auto_93315 ) ( ON ?auto_93317 ?auto_93316 ) ( ON ?auto_93318 ?auto_93317 ) ( ON ?auto_93319 ?auto_93318 ) ( ON ?auto_93320 ?auto_93319 ) ( not ( = ?auto_93315 ?auto_93316 ) ) ( not ( = ?auto_93315 ?auto_93317 ) ) ( not ( = ?auto_93315 ?auto_93318 ) ) ( not ( = ?auto_93315 ?auto_93319 ) ) ( not ( = ?auto_93315 ?auto_93320 ) ) ( not ( = ?auto_93315 ?auto_93321 ) ) ( not ( = ?auto_93316 ?auto_93317 ) ) ( not ( = ?auto_93316 ?auto_93318 ) ) ( not ( = ?auto_93316 ?auto_93319 ) ) ( not ( = ?auto_93316 ?auto_93320 ) ) ( not ( = ?auto_93316 ?auto_93321 ) ) ( not ( = ?auto_93317 ?auto_93318 ) ) ( not ( = ?auto_93317 ?auto_93319 ) ) ( not ( = ?auto_93317 ?auto_93320 ) ) ( not ( = ?auto_93317 ?auto_93321 ) ) ( not ( = ?auto_93318 ?auto_93319 ) ) ( not ( = ?auto_93318 ?auto_93320 ) ) ( not ( = ?auto_93318 ?auto_93321 ) ) ( not ( = ?auto_93319 ?auto_93320 ) ) ( not ( = ?auto_93319 ?auto_93321 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_93320 ?auto_93321 )
      ( MAKE-6CRATE-VERIFY ?auto_93315 ?auto_93316 ?auto_93317 ?auto_93318 ?auto_93319 ?auto_93320 ?auto_93321 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93359 - SURFACE
      ?auto_93360 - SURFACE
      ?auto_93361 - SURFACE
      ?auto_93362 - SURFACE
      ?auto_93363 - SURFACE
      ?auto_93364 - SURFACE
      ?auto_93365 - SURFACE
    )
    :vars
    (
      ?auto_93368 - HOIST
      ?auto_93367 - PLACE
      ?auto_93366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93368 ?auto_93367 ) ( SURFACE-AT ?auto_93364 ?auto_93367 ) ( CLEAR ?auto_93364 ) ( IS-CRATE ?auto_93365 ) ( not ( = ?auto_93364 ?auto_93365 ) ) ( TRUCK-AT ?auto_93366 ?auto_93367 ) ( AVAILABLE ?auto_93368 ) ( IN ?auto_93365 ?auto_93366 ) ( ON ?auto_93364 ?auto_93363 ) ( not ( = ?auto_93363 ?auto_93364 ) ) ( not ( = ?auto_93363 ?auto_93365 ) ) ( ON ?auto_93360 ?auto_93359 ) ( ON ?auto_93361 ?auto_93360 ) ( ON ?auto_93362 ?auto_93361 ) ( ON ?auto_93363 ?auto_93362 ) ( not ( = ?auto_93359 ?auto_93360 ) ) ( not ( = ?auto_93359 ?auto_93361 ) ) ( not ( = ?auto_93359 ?auto_93362 ) ) ( not ( = ?auto_93359 ?auto_93363 ) ) ( not ( = ?auto_93359 ?auto_93364 ) ) ( not ( = ?auto_93359 ?auto_93365 ) ) ( not ( = ?auto_93360 ?auto_93361 ) ) ( not ( = ?auto_93360 ?auto_93362 ) ) ( not ( = ?auto_93360 ?auto_93363 ) ) ( not ( = ?auto_93360 ?auto_93364 ) ) ( not ( = ?auto_93360 ?auto_93365 ) ) ( not ( = ?auto_93361 ?auto_93362 ) ) ( not ( = ?auto_93361 ?auto_93363 ) ) ( not ( = ?auto_93361 ?auto_93364 ) ) ( not ( = ?auto_93361 ?auto_93365 ) ) ( not ( = ?auto_93362 ?auto_93363 ) ) ( not ( = ?auto_93362 ?auto_93364 ) ) ( not ( = ?auto_93362 ?auto_93365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93363 ?auto_93364 ?auto_93365 )
      ( MAKE-6CRATE-VERIFY ?auto_93359 ?auto_93360 ?auto_93361 ?auto_93362 ?auto_93363 ?auto_93364 ?auto_93365 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93410 - SURFACE
      ?auto_93411 - SURFACE
      ?auto_93412 - SURFACE
      ?auto_93413 - SURFACE
      ?auto_93414 - SURFACE
      ?auto_93415 - SURFACE
      ?auto_93416 - SURFACE
    )
    :vars
    (
      ?auto_93417 - HOIST
      ?auto_93418 - PLACE
      ?auto_93420 - TRUCK
      ?auto_93419 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93417 ?auto_93418 ) ( SURFACE-AT ?auto_93415 ?auto_93418 ) ( CLEAR ?auto_93415 ) ( IS-CRATE ?auto_93416 ) ( not ( = ?auto_93415 ?auto_93416 ) ) ( AVAILABLE ?auto_93417 ) ( IN ?auto_93416 ?auto_93420 ) ( ON ?auto_93415 ?auto_93414 ) ( not ( = ?auto_93414 ?auto_93415 ) ) ( not ( = ?auto_93414 ?auto_93416 ) ) ( TRUCK-AT ?auto_93420 ?auto_93419 ) ( not ( = ?auto_93419 ?auto_93418 ) ) ( ON ?auto_93411 ?auto_93410 ) ( ON ?auto_93412 ?auto_93411 ) ( ON ?auto_93413 ?auto_93412 ) ( ON ?auto_93414 ?auto_93413 ) ( not ( = ?auto_93410 ?auto_93411 ) ) ( not ( = ?auto_93410 ?auto_93412 ) ) ( not ( = ?auto_93410 ?auto_93413 ) ) ( not ( = ?auto_93410 ?auto_93414 ) ) ( not ( = ?auto_93410 ?auto_93415 ) ) ( not ( = ?auto_93410 ?auto_93416 ) ) ( not ( = ?auto_93411 ?auto_93412 ) ) ( not ( = ?auto_93411 ?auto_93413 ) ) ( not ( = ?auto_93411 ?auto_93414 ) ) ( not ( = ?auto_93411 ?auto_93415 ) ) ( not ( = ?auto_93411 ?auto_93416 ) ) ( not ( = ?auto_93412 ?auto_93413 ) ) ( not ( = ?auto_93412 ?auto_93414 ) ) ( not ( = ?auto_93412 ?auto_93415 ) ) ( not ( = ?auto_93412 ?auto_93416 ) ) ( not ( = ?auto_93413 ?auto_93414 ) ) ( not ( = ?auto_93413 ?auto_93415 ) ) ( not ( = ?auto_93413 ?auto_93416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93414 ?auto_93415 ?auto_93416 )
      ( MAKE-6CRATE-VERIFY ?auto_93410 ?auto_93411 ?auto_93412 ?auto_93413 ?auto_93414 ?auto_93415 ?auto_93416 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93467 - SURFACE
      ?auto_93468 - SURFACE
      ?auto_93469 - SURFACE
      ?auto_93470 - SURFACE
      ?auto_93471 - SURFACE
      ?auto_93472 - SURFACE
      ?auto_93473 - SURFACE
    )
    :vars
    (
      ?auto_93474 - HOIST
      ?auto_93478 - PLACE
      ?auto_93475 - TRUCK
      ?auto_93476 - PLACE
      ?auto_93477 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_93474 ?auto_93478 ) ( SURFACE-AT ?auto_93472 ?auto_93478 ) ( CLEAR ?auto_93472 ) ( IS-CRATE ?auto_93473 ) ( not ( = ?auto_93472 ?auto_93473 ) ) ( AVAILABLE ?auto_93474 ) ( ON ?auto_93472 ?auto_93471 ) ( not ( = ?auto_93471 ?auto_93472 ) ) ( not ( = ?auto_93471 ?auto_93473 ) ) ( TRUCK-AT ?auto_93475 ?auto_93476 ) ( not ( = ?auto_93476 ?auto_93478 ) ) ( HOIST-AT ?auto_93477 ?auto_93476 ) ( LIFTING ?auto_93477 ?auto_93473 ) ( not ( = ?auto_93474 ?auto_93477 ) ) ( ON ?auto_93468 ?auto_93467 ) ( ON ?auto_93469 ?auto_93468 ) ( ON ?auto_93470 ?auto_93469 ) ( ON ?auto_93471 ?auto_93470 ) ( not ( = ?auto_93467 ?auto_93468 ) ) ( not ( = ?auto_93467 ?auto_93469 ) ) ( not ( = ?auto_93467 ?auto_93470 ) ) ( not ( = ?auto_93467 ?auto_93471 ) ) ( not ( = ?auto_93467 ?auto_93472 ) ) ( not ( = ?auto_93467 ?auto_93473 ) ) ( not ( = ?auto_93468 ?auto_93469 ) ) ( not ( = ?auto_93468 ?auto_93470 ) ) ( not ( = ?auto_93468 ?auto_93471 ) ) ( not ( = ?auto_93468 ?auto_93472 ) ) ( not ( = ?auto_93468 ?auto_93473 ) ) ( not ( = ?auto_93469 ?auto_93470 ) ) ( not ( = ?auto_93469 ?auto_93471 ) ) ( not ( = ?auto_93469 ?auto_93472 ) ) ( not ( = ?auto_93469 ?auto_93473 ) ) ( not ( = ?auto_93470 ?auto_93471 ) ) ( not ( = ?auto_93470 ?auto_93472 ) ) ( not ( = ?auto_93470 ?auto_93473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93471 ?auto_93472 ?auto_93473 )
      ( MAKE-6CRATE-VERIFY ?auto_93467 ?auto_93468 ?auto_93469 ?auto_93470 ?auto_93471 ?auto_93472 ?auto_93473 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93530 - SURFACE
      ?auto_93531 - SURFACE
      ?auto_93532 - SURFACE
      ?auto_93533 - SURFACE
      ?auto_93534 - SURFACE
      ?auto_93535 - SURFACE
      ?auto_93536 - SURFACE
    )
    :vars
    (
      ?auto_93538 - HOIST
      ?auto_93541 - PLACE
      ?auto_93540 - TRUCK
      ?auto_93539 - PLACE
      ?auto_93537 - HOIST
      ?auto_93542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93538 ?auto_93541 ) ( SURFACE-AT ?auto_93535 ?auto_93541 ) ( CLEAR ?auto_93535 ) ( IS-CRATE ?auto_93536 ) ( not ( = ?auto_93535 ?auto_93536 ) ) ( AVAILABLE ?auto_93538 ) ( ON ?auto_93535 ?auto_93534 ) ( not ( = ?auto_93534 ?auto_93535 ) ) ( not ( = ?auto_93534 ?auto_93536 ) ) ( TRUCK-AT ?auto_93540 ?auto_93539 ) ( not ( = ?auto_93539 ?auto_93541 ) ) ( HOIST-AT ?auto_93537 ?auto_93539 ) ( not ( = ?auto_93538 ?auto_93537 ) ) ( AVAILABLE ?auto_93537 ) ( SURFACE-AT ?auto_93536 ?auto_93539 ) ( ON ?auto_93536 ?auto_93542 ) ( CLEAR ?auto_93536 ) ( not ( = ?auto_93535 ?auto_93542 ) ) ( not ( = ?auto_93536 ?auto_93542 ) ) ( not ( = ?auto_93534 ?auto_93542 ) ) ( ON ?auto_93531 ?auto_93530 ) ( ON ?auto_93532 ?auto_93531 ) ( ON ?auto_93533 ?auto_93532 ) ( ON ?auto_93534 ?auto_93533 ) ( not ( = ?auto_93530 ?auto_93531 ) ) ( not ( = ?auto_93530 ?auto_93532 ) ) ( not ( = ?auto_93530 ?auto_93533 ) ) ( not ( = ?auto_93530 ?auto_93534 ) ) ( not ( = ?auto_93530 ?auto_93535 ) ) ( not ( = ?auto_93530 ?auto_93536 ) ) ( not ( = ?auto_93530 ?auto_93542 ) ) ( not ( = ?auto_93531 ?auto_93532 ) ) ( not ( = ?auto_93531 ?auto_93533 ) ) ( not ( = ?auto_93531 ?auto_93534 ) ) ( not ( = ?auto_93531 ?auto_93535 ) ) ( not ( = ?auto_93531 ?auto_93536 ) ) ( not ( = ?auto_93531 ?auto_93542 ) ) ( not ( = ?auto_93532 ?auto_93533 ) ) ( not ( = ?auto_93532 ?auto_93534 ) ) ( not ( = ?auto_93532 ?auto_93535 ) ) ( not ( = ?auto_93532 ?auto_93536 ) ) ( not ( = ?auto_93532 ?auto_93542 ) ) ( not ( = ?auto_93533 ?auto_93534 ) ) ( not ( = ?auto_93533 ?auto_93535 ) ) ( not ( = ?auto_93533 ?auto_93536 ) ) ( not ( = ?auto_93533 ?auto_93542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93534 ?auto_93535 ?auto_93536 )
      ( MAKE-6CRATE-VERIFY ?auto_93530 ?auto_93531 ?auto_93532 ?auto_93533 ?auto_93534 ?auto_93535 ?auto_93536 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93594 - SURFACE
      ?auto_93595 - SURFACE
      ?auto_93596 - SURFACE
      ?auto_93597 - SURFACE
      ?auto_93598 - SURFACE
      ?auto_93599 - SURFACE
      ?auto_93600 - SURFACE
    )
    :vars
    (
      ?auto_93605 - HOIST
      ?auto_93602 - PLACE
      ?auto_93603 - PLACE
      ?auto_93601 - HOIST
      ?auto_93606 - SURFACE
      ?auto_93604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93605 ?auto_93602 ) ( SURFACE-AT ?auto_93599 ?auto_93602 ) ( CLEAR ?auto_93599 ) ( IS-CRATE ?auto_93600 ) ( not ( = ?auto_93599 ?auto_93600 ) ) ( AVAILABLE ?auto_93605 ) ( ON ?auto_93599 ?auto_93598 ) ( not ( = ?auto_93598 ?auto_93599 ) ) ( not ( = ?auto_93598 ?auto_93600 ) ) ( not ( = ?auto_93603 ?auto_93602 ) ) ( HOIST-AT ?auto_93601 ?auto_93603 ) ( not ( = ?auto_93605 ?auto_93601 ) ) ( AVAILABLE ?auto_93601 ) ( SURFACE-AT ?auto_93600 ?auto_93603 ) ( ON ?auto_93600 ?auto_93606 ) ( CLEAR ?auto_93600 ) ( not ( = ?auto_93599 ?auto_93606 ) ) ( not ( = ?auto_93600 ?auto_93606 ) ) ( not ( = ?auto_93598 ?auto_93606 ) ) ( TRUCK-AT ?auto_93604 ?auto_93602 ) ( ON ?auto_93595 ?auto_93594 ) ( ON ?auto_93596 ?auto_93595 ) ( ON ?auto_93597 ?auto_93596 ) ( ON ?auto_93598 ?auto_93597 ) ( not ( = ?auto_93594 ?auto_93595 ) ) ( not ( = ?auto_93594 ?auto_93596 ) ) ( not ( = ?auto_93594 ?auto_93597 ) ) ( not ( = ?auto_93594 ?auto_93598 ) ) ( not ( = ?auto_93594 ?auto_93599 ) ) ( not ( = ?auto_93594 ?auto_93600 ) ) ( not ( = ?auto_93594 ?auto_93606 ) ) ( not ( = ?auto_93595 ?auto_93596 ) ) ( not ( = ?auto_93595 ?auto_93597 ) ) ( not ( = ?auto_93595 ?auto_93598 ) ) ( not ( = ?auto_93595 ?auto_93599 ) ) ( not ( = ?auto_93595 ?auto_93600 ) ) ( not ( = ?auto_93595 ?auto_93606 ) ) ( not ( = ?auto_93596 ?auto_93597 ) ) ( not ( = ?auto_93596 ?auto_93598 ) ) ( not ( = ?auto_93596 ?auto_93599 ) ) ( not ( = ?auto_93596 ?auto_93600 ) ) ( not ( = ?auto_93596 ?auto_93606 ) ) ( not ( = ?auto_93597 ?auto_93598 ) ) ( not ( = ?auto_93597 ?auto_93599 ) ) ( not ( = ?auto_93597 ?auto_93600 ) ) ( not ( = ?auto_93597 ?auto_93606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93598 ?auto_93599 ?auto_93600 )
      ( MAKE-6CRATE-VERIFY ?auto_93594 ?auto_93595 ?auto_93596 ?auto_93597 ?auto_93598 ?auto_93599 ?auto_93600 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93658 - SURFACE
      ?auto_93659 - SURFACE
      ?auto_93660 - SURFACE
      ?auto_93661 - SURFACE
      ?auto_93662 - SURFACE
      ?auto_93663 - SURFACE
      ?auto_93664 - SURFACE
    )
    :vars
    (
      ?auto_93668 - HOIST
      ?auto_93666 - PLACE
      ?auto_93665 - PLACE
      ?auto_93670 - HOIST
      ?auto_93667 - SURFACE
      ?auto_93669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93668 ?auto_93666 ) ( IS-CRATE ?auto_93664 ) ( not ( = ?auto_93663 ?auto_93664 ) ) ( not ( = ?auto_93662 ?auto_93663 ) ) ( not ( = ?auto_93662 ?auto_93664 ) ) ( not ( = ?auto_93665 ?auto_93666 ) ) ( HOIST-AT ?auto_93670 ?auto_93665 ) ( not ( = ?auto_93668 ?auto_93670 ) ) ( AVAILABLE ?auto_93670 ) ( SURFACE-AT ?auto_93664 ?auto_93665 ) ( ON ?auto_93664 ?auto_93667 ) ( CLEAR ?auto_93664 ) ( not ( = ?auto_93663 ?auto_93667 ) ) ( not ( = ?auto_93664 ?auto_93667 ) ) ( not ( = ?auto_93662 ?auto_93667 ) ) ( TRUCK-AT ?auto_93669 ?auto_93666 ) ( SURFACE-AT ?auto_93662 ?auto_93666 ) ( CLEAR ?auto_93662 ) ( LIFTING ?auto_93668 ?auto_93663 ) ( IS-CRATE ?auto_93663 ) ( ON ?auto_93659 ?auto_93658 ) ( ON ?auto_93660 ?auto_93659 ) ( ON ?auto_93661 ?auto_93660 ) ( ON ?auto_93662 ?auto_93661 ) ( not ( = ?auto_93658 ?auto_93659 ) ) ( not ( = ?auto_93658 ?auto_93660 ) ) ( not ( = ?auto_93658 ?auto_93661 ) ) ( not ( = ?auto_93658 ?auto_93662 ) ) ( not ( = ?auto_93658 ?auto_93663 ) ) ( not ( = ?auto_93658 ?auto_93664 ) ) ( not ( = ?auto_93658 ?auto_93667 ) ) ( not ( = ?auto_93659 ?auto_93660 ) ) ( not ( = ?auto_93659 ?auto_93661 ) ) ( not ( = ?auto_93659 ?auto_93662 ) ) ( not ( = ?auto_93659 ?auto_93663 ) ) ( not ( = ?auto_93659 ?auto_93664 ) ) ( not ( = ?auto_93659 ?auto_93667 ) ) ( not ( = ?auto_93660 ?auto_93661 ) ) ( not ( = ?auto_93660 ?auto_93662 ) ) ( not ( = ?auto_93660 ?auto_93663 ) ) ( not ( = ?auto_93660 ?auto_93664 ) ) ( not ( = ?auto_93660 ?auto_93667 ) ) ( not ( = ?auto_93661 ?auto_93662 ) ) ( not ( = ?auto_93661 ?auto_93663 ) ) ( not ( = ?auto_93661 ?auto_93664 ) ) ( not ( = ?auto_93661 ?auto_93667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93662 ?auto_93663 ?auto_93664 )
      ( MAKE-6CRATE-VERIFY ?auto_93658 ?auto_93659 ?auto_93660 ?auto_93661 ?auto_93662 ?auto_93663 ?auto_93664 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93722 - SURFACE
      ?auto_93723 - SURFACE
      ?auto_93724 - SURFACE
      ?auto_93725 - SURFACE
      ?auto_93726 - SURFACE
      ?auto_93727 - SURFACE
      ?auto_93728 - SURFACE
    )
    :vars
    (
      ?auto_93734 - HOIST
      ?auto_93733 - PLACE
      ?auto_93730 - PLACE
      ?auto_93729 - HOIST
      ?auto_93732 - SURFACE
      ?auto_93731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93734 ?auto_93733 ) ( IS-CRATE ?auto_93728 ) ( not ( = ?auto_93727 ?auto_93728 ) ) ( not ( = ?auto_93726 ?auto_93727 ) ) ( not ( = ?auto_93726 ?auto_93728 ) ) ( not ( = ?auto_93730 ?auto_93733 ) ) ( HOIST-AT ?auto_93729 ?auto_93730 ) ( not ( = ?auto_93734 ?auto_93729 ) ) ( AVAILABLE ?auto_93729 ) ( SURFACE-AT ?auto_93728 ?auto_93730 ) ( ON ?auto_93728 ?auto_93732 ) ( CLEAR ?auto_93728 ) ( not ( = ?auto_93727 ?auto_93732 ) ) ( not ( = ?auto_93728 ?auto_93732 ) ) ( not ( = ?auto_93726 ?auto_93732 ) ) ( TRUCK-AT ?auto_93731 ?auto_93733 ) ( SURFACE-AT ?auto_93726 ?auto_93733 ) ( CLEAR ?auto_93726 ) ( IS-CRATE ?auto_93727 ) ( AVAILABLE ?auto_93734 ) ( IN ?auto_93727 ?auto_93731 ) ( ON ?auto_93723 ?auto_93722 ) ( ON ?auto_93724 ?auto_93723 ) ( ON ?auto_93725 ?auto_93724 ) ( ON ?auto_93726 ?auto_93725 ) ( not ( = ?auto_93722 ?auto_93723 ) ) ( not ( = ?auto_93722 ?auto_93724 ) ) ( not ( = ?auto_93722 ?auto_93725 ) ) ( not ( = ?auto_93722 ?auto_93726 ) ) ( not ( = ?auto_93722 ?auto_93727 ) ) ( not ( = ?auto_93722 ?auto_93728 ) ) ( not ( = ?auto_93722 ?auto_93732 ) ) ( not ( = ?auto_93723 ?auto_93724 ) ) ( not ( = ?auto_93723 ?auto_93725 ) ) ( not ( = ?auto_93723 ?auto_93726 ) ) ( not ( = ?auto_93723 ?auto_93727 ) ) ( not ( = ?auto_93723 ?auto_93728 ) ) ( not ( = ?auto_93723 ?auto_93732 ) ) ( not ( = ?auto_93724 ?auto_93725 ) ) ( not ( = ?auto_93724 ?auto_93726 ) ) ( not ( = ?auto_93724 ?auto_93727 ) ) ( not ( = ?auto_93724 ?auto_93728 ) ) ( not ( = ?auto_93724 ?auto_93732 ) ) ( not ( = ?auto_93725 ?auto_93726 ) ) ( not ( = ?auto_93725 ?auto_93727 ) ) ( not ( = ?auto_93725 ?auto_93728 ) ) ( not ( = ?auto_93725 ?auto_93732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93726 ?auto_93727 ?auto_93728 )
      ( MAKE-6CRATE-VERIFY ?auto_93722 ?auto_93723 ?auto_93724 ?auto_93725 ?auto_93726 ?auto_93727 ?auto_93728 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95678 - SURFACE
      ?auto_95679 - SURFACE
      ?auto_95680 - SURFACE
      ?auto_95681 - SURFACE
      ?auto_95682 - SURFACE
      ?auto_95683 - SURFACE
      ?auto_95684 - SURFACE
      ?auto_95685 - SURFACE
    )
    :vars
    (
      ?auto_95687 - HOIST
      ?auto_95686 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95687 ?auto_95686 ) ( SURFACE-AT ?auto_95684 ?auto_95686 ) ( CLEAR ?auto_95684 ) ( LIFTING ?auto_95687 ?auto_95685 ) ( IS-CRATE ?auto_95685 ) ( not ( = ?auto_95684 ?auto_95685 ) ) ( ON ?auto_95679 ?auto_95678 ) ( ON ?auto_95680 ?auto_95679 ) ( ON ?auto_95681 ?auto_95680 ) ( ON ?auto_95682 ?auto_95681 ) ( ON ?auto_95683 ?auto_95682 ) ( ON ?auto_95684 ?auto_95683 ) ( not ( = ?auto_95678 ?auto_95679 ) ) ( not ( = ?auto_95678 ?auto_95680 ) ) ( not ( = ?auto_95678 ?auto_95681 ) ) ( not ( = ?auto_95678 ?auto_95682 ) ) ( not ( = ?auto_95678 ?auto_95683 ) ) ( not ( = ?auto_95678 ?auto_95684 ) ) ( not ( = ?auto_95678 ?auto_95685 ) ) ( not ( = ?auto_95679 ?auto_95680 ) ) ( not ( = ?auto_95679 ?auto_95681 ) ) ( not ( = ?auto_95679 ?auto_95682 ) ) ( not ( = ?auto_95679 ?auto_95683 ) ) ( not ( = ?auto_95679 ?auto_95684 ) ) ( not ( = ?auto_95679 ?auto_95685 ) ) ( not ( = ?auto_95680 ?auto_95681 ) ) ( not ( = ?auto_95680 ?auto_95682 ) ) ( not ( = ?auto_95680 ?auto_95683 ) ) ( not ( = ?auto_95680 ?auto_95684 ) ) ( not ( = ?auto_95680 ?auto_95685 ) ) ( not ( = ?auto_95681 ?auto_95682 ) ) ( not ( = ?auto_95681 ?auto_95683 ) ) ( not ( = ?auto_95681 ?auto_95684 ) ) ( not ( = ?auto_95681 ?auto_95685 ) ) ( not ( = ?auto_95682 ?auto_95683 ) ) ( not ( = ?auto_95682 ?auto_95684 ) ) ( not ( = ?auto_95682 ?auto_95685 ) ) ( not ( = ?auto_95683 ?auto_95684 ) ) ( not ( = ?auto_95683 ?auto_95685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_95684 ?auto_95685 )
      ( MAKE-7CRATE-VERIFY ?auto_95678 ?auto_95679 ?auto_95680 ?auto_95681 ?auto_95682 ?auto_95683 ?auto_95684 ?auto_95685 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95733 - SURFACE
      ?auto_95734 - SURFACE
      ?auto_95735 - SURFACE
      ?auto_95736 - SURFACE
      ?auto_95737 - SURFACE
      ?auto_95738 - SURFACE
      ?auto_95739 - SURFACE
      ?auto_95740 - SURFACE
    )
    :vars
    (
      ?auto_95742 - HOIST
      ?auto_95741 - PLACE
      ?auto_95743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_95742 ?auto_95741 ) ( SURFACE-AT ?auto_95739 ?auto_95741 ) ( CLEAR ?auto_95739 ) ( IS-CRATE ?auto_95740 ) ( not ( = ?auto_95739 ?auto_95740 ) ) ( TRUCK-AT ?auto_95743 ?auto_95741 ) ( AVAILABLE ?auto_95742 ) ( IN ?auto_95740 ?auto_95743 ) ( ON ?auto_95739 ?auto_95738 ) ( not ( = ?auto_95738 ?auto_95739 ) ) ( not ( = ?auto_95738 ?auto_95740 ) ) ( ON ?auto_95734 ?auto_95733 ) ( ON ?auto_95735 ?auto_95734 ) ( ON ?auto_95736 ?auto_95735 ) ( ON ?auto_95737 ?auto_95736 ) ( ON ?auto_95738 ?auto_95737 ) ( not ( = ?auto_95733 ?auto_95734 ) ) ( not ( = ?auto_95733 ?auto_95735 ) ) ( not ( = ?auto_95733 ?auto_95736 ) ) ( not ( = ?auto_95733 ?auto_95737 ) ) ( not ( = ?auto_95733 ?auto_95738 ) ) ( not ( = ?auto_95733 ?auto_95739 ) ) ( not ( = ?auto_95733 ?auto_95740 ) ) ( not ( = ?auto_95734 ?auto_95735 ) ) ( not ( = ?auto_95734 ?auto_95736 ) ) ( not ( = ?auto_95734 ?auto_95737 ) ) ( not ( = ?auto_95734 ?auto_95738 ) ) ( not ( = ?auto_95734 ?auto_95739 ) ) ( not ( = ?auto_95734 ?auto_95740 ) ) ( not ( = ?auto_95735 ?auto_95736 ) ) ( not ( = ?auto_95735 ?auto_95737 ) ) ( not ( = ?auto_95735 ?auto_95738 ) ) ( not ( = ?auto_95735 ?auto_95739 ) ) ( not ( = ?auto_95735 ?auto_95740 ) ) ( not ( = ?auto_95736 ?auto_95737 ) ) ( not ( = ?auto_95736 ?auto_95738 ) ) ( not ( = ?auto_95736 ?auto_95739 ) ) ( not ( = ?auto_95736 ?auto_95740 ) ) ( not ( = ?auto_95737 ?auto_95738 ) ) ( not ( = ?auto_95737 ?auto_95739 ) ) ( not ( = ?auto_95737 ?auto_95740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95738 ?auto_95739 ?auto_95740 )
      ( MAKE-7CRATE-VERIFY ?auto_95733 ?auto_95734 ?auto_95735 ?auto_95736 ?auto_95737 ?auto_95738 ?auto_95739 ?auto_95740 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95796 - SURFACE
      ?auto_95797 - SURFACE
      ?auto_95798 - SURFACE
      ?auto_95799 - SURFACE
      ?auto_95800 - SURFACE
      ?auto_95801 - SURFACE
      ?auto_95802 - SURFACE
      ?auto_95803 - SURFACE
    )
    :vars
    (
      ?auto_95806 - HOIST
      ?auto_95805 - PLACE
      ?auto_95804 - TRUCK
      ?auto_95807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95806 ?auto_95805 ) ( SURFACE-AT ?auto_95802 ?auto_95805 ) ( CLEAR ?auto_95802 ) ( IS-CRATE ?auto_95803 ) ( not ( = ?auto_95802 ?auto_95803 ) ) ( AVAILABLE ?auto_95806 ) ( IN ?auto_95803 ?auto_95804 ) ( ON ?auto_95802 ?auto_95801 ) ( not ( = ?auto_95801 ?auto_95802 ) ) ( not ( = ?auto_95801 ?auto_95803 ) ) ( TRUCK-AT ?auto_95804 ?auto_95807 ) ( not ( = ?auto_95807 ?auto_95805 ) ) ( ON ?auto_95797 ?auto_95796 ) ( ON ?auto_95798 ?auto_95797 ) ( ON ?auto_95799 ?auto_95798 ) ( ON ?auto_95800 ?auto_95799 ) ( ON ?auto_95801 ?auto_95800 ) ( not ( = ?auto_95796 ?auto_95797 ) ) ( not ( = ?auto_95796 ?auto_95798 ) ) ( not ( = ?auto_95796 ?auto_95799 ) ) ( not ( = ?auto_95796 ?auto_95800 ) ) ( not ( = ?auto_95796 ?auto_95801 ) ) ( not ( = ?auto_95796 ?auto_95802 ) ) ( not ( = ?auto_95796 ?auto_95803 ) ) ( not ( = ?auto_95797 ?auto_95798 ) ) ( not ( = ?auto_95797 ?auto_95799 ) ) ( not ( = ?auto_95797 ?auto_95800 ) ) ( not ( = ?auto_95797 ?auto_95801 ) ) ( not ( = ?auto_95797 ?auto_95802 ) ) ( not ( = ?auto_95797 ?auto_95803 ) ) ( not ( = ?auto_95798 ?auto_95799 ) ) ( not ( = ?auto_95798 ?auto_95800 ) ) ( not ( = ?auto_95798 ?auto_95801 ) ) ( not ( = ?auto_95798 ?auto_95802 ) ) ( not ( = ?auto_95798 ?auto_95803 ) ) ( not ( = ?auto_95799 ?auto_95800 ) ) ( not ( = ?auto_95799 ?auto_95801 ) ) ( not ( = ?auto_95799 ?auto_95802 ) ) ( not ( = ?auto_95799 ?auto_95803 ) ) ( not ( = ?auto_95800 ?auto_95801 ) ) ( not ( = ?auto_95800 ?auto_95802 ) ) ( not ( = ?auto_95800 ?auto_95803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95801 ?auto_95802 ?auto_95803 )
      ( MAKE-7CRATE-VERIFY ?auto_95796 ?auto_95797 ?auto_95798 ?auto_95799 ?auto_95800 ?auto_95801 ?auto_95802 ?auto_95803 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95866 - SURFACE
      ?auto_95867 - SURFACE
      ?auto_95868 - SURFACE
      ?auto_95869 - SURFACE
      ?auto_95870 - SURFACE
      ?auto_95871 - SURFACE
      ?auto_95872 - SURFACE
      ?auto_95873 - SURFACE
    )
    :vars
    (
      ?auto_95878 - HOIST
      ?auto_95876 - PLACE
      ?auto_95874 - TRUCK
      ?auto_95875 - PLACE
      ?auto_95877 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_95878 ?auto_95876 ) ( SURFACE-AT ?auto_95872 ?auto_95876 ) ( CLEAR ?auto_95872 ) ( IS-CRATE ?auto_95873 ) ( not ( = ?auto_95872 ?auto_95873 ) ) ( AVAILABLE ?auto_95878 ) ( ON ?auto_95872 ?auto_95871 ) ( not ( = ?auto_95871 ?auto_95872 ) ) ( not ( = ?auto_95871 ?auto_95873 ) ) ( TRUCK-AT ?auto_95874 ?auto_95875 ) ( not ( = ?auto_95875 ?auto_95876 ) ) ( HOIST-AT ?auto_95877 ?auto_95875 ) ( LIFTING ?auto_95877 ?auto_95873 ) ( not ( = ?auto_95878 ?auto_95877 ) ) ( ON ?auto_95867 ?auto_95866 ) ( ON ?auto_95868 ?auto_95867 ) ( ON ?auto_95869 ?auto_95868 ) ( ON ?auto_95870 ?auto_95869 ) ( ON ?auto_95871 ?auto_95870 ) ( not ( = ?auto_95866 ?auto_95867 ) ) ( not ( = ?auto_95866 ?auto_95868 ) ) ( not ( = ?auto_95866 ?auto_95869 ) ) ( not ( = ?auto_95866 ?auto_95870 ) ) ( not ( = ?auto_95866 ?auto_95871 ) ) ( not ( = ?auto_95866 ?auto_95872 ) ) ( not ( = ?auto_95866 ?auto_95873 ) ) ( not ( = ?auto_95867 ?auto_95868 ) ) ( not ( = ?auto_95867 ?auto_95869 ) ) ( not ( = ?auto_95867 ?auto_95870 ) ) ( not ( = ?auto_95867 ?auto_95871 ) ) ( not ( = ?auto_95867 ?auto_95872 ) ) ( not ( = ?auto_95867 ?auto_95873 ) ) ( not ( = ?auto_95868 ?auto_95869 ) ) ( not ( = ?auto_95868 ?auto_95870 ) ) ( not ( = ?auto_95868 ?auto_95871 ) ) ( not ( = ?auto_95868 ?auto_95872 ) ) ( not ( = ?auto_95868 ?auto_95873 ) ) ( not ( = ?auto_95869 ?auto_95870 ) ) ( not ( = ?auto_95869 ?auto_95871 ) ) ( not ( = ?auto_95869 ?auto_95872 ) ) ( not ( = ?auto_95869 ?auto_95873 ) ) ( not ( = ?auto_95870 ?auto_95871 ) ) ( not ( = ?auto_95870 ?auto_95872 ) ) ( not ( = ?auto_95870 ?auto_95873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95871 ?auto_95872 ?auto_95873 )
      ( MAKE-7CRATE-VERIFY ?auto_95866 ?auto_95867 ?auto_95868 ?auto_95869 ?auto_95870 ?auto_95871 ?auto_95872 ?auto_95873 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95943 - SURFACE
      ?auto_95944 - SURFACE
      ?auto_95945 - SURFACE
      ?auto_95946 - SURFACE
      ?auto_95947 - SURFACE
      ?auto_95948 - SURFACE
      ?auto_95949 - SURFACE
      ?auto_95950 - SURFACE
    )
    :vars
    (
      ?auto_95952 - HOIST
      ?auto_95953 - PLACE
      ?auto_95956 - TRUCK
      ?auto_95955 - PLACE
      ?auto_95954 - HOIST
      ?auto_95951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95952 ?auto_95953 ) ( SURFACE-AT ?auto_95949 ?auto_95953 ) ( CLEAR ?auto_95949 ) ( IS-CRATE ?auto_95950 ) ( not ( = ?auto_95949 ?auto_95950 ) ) ( AVAILABLE ?auto_95952 ) ( ON ?auto_95949 ?auto_95948 ) ( not ( = ?auto_95948 ?auto_95949 ) ) ( not ( = ?auto_95948 ?auto_95950 ) ) ( TRUCK-AT ?auto_95956 ?auto_95955 ) ( not ( = ?auto_95955 ?auto_95953 ) ) ( HOIST-AT ?auto_95954 ?auto_95955 ) ( not ( = ?auto_95952 ?auto_95954 ) ) ( AVAILABLE ?auto_95954 ) ( SURFACE-AT ?auto_95950 ?auto_95955 ) ( ON ?auto_95950 ?auto_95951 ) ( CLEAR ?auto_95950 ) ( not ( = ?auto_95949 ?auto_95951 ) ) ( not ( = ?auto_95950 ?auto_95951 ) ) ( not ( = ?auto_95948 ?auto_95951 ) ) ( ON ?auto_95944 ?auto_95943 ) ( ON ?auto_95945 ?auto_95944 ) ( ON ?auto_95946 ?auto_95945 ) ( ON ?auto_95947 ?auto_95946 ) ( ON ?auto_95948 ?auto_95947 ) ( not ( = ?auto_95943 ?auto_95944 ) ) ( not ( = ?auto_95943 ?auto_95945 ) ) ( not ( = ?auto_95943 ?auto_95946 ) ) ( not ( = ?auto_95943 ?auto_95947 ) ) ( not ( = ?auto_95943 ?auto_95948 ) ) ( not ( = ?auto_95943 ?auto_95949 ) ) ( not ( = ?auto_95943 ?auto_95950 ) ) ( not ( = ?auto_95943 ?auto_95951 ) ) ( not ( = ?auto_95944 ?auto_95945 ) ) ( not ( = ?auto_95944 ?auto_95946 ) ) ( not ( = ?auto_95944 ?auto_95947 ) ) ( not ( = ?auto_95944 ?auto_95948 ) ) ( not ( = ?auto_95944 ?auto_95949 ) ) ( not ( = ?auto_95944 ?auto_95950 ) ) ( not ( = ?auto_95944 ?auto_95951 ) ) ( not ( = ?auto_95945 ?auto_95946 ) ) ( not ( = ?auto_95945 ?auto_95947 ) ) ( not ( = ?auto_95945 ?auto_95948 ) ) ( not ( = ?auto_95945 ?auto_95949 ) ) ( not ( = ?auto_95945 ?auto_95950 ) ) ( not ( = ?auto_95945 ?auto_95951 ) ) ( not ( = ?auto_95946 ?auto_95947 ) ) ( not ( = ?auto_95946 ?auto_95948 ) ) ( not ( = ?auto_95946 ?auto_95949 ) ) ( not ( = ?auto_95946 ?auto_95950 ) ) ( not ( = ?auto_95946 ?auto_95951 ) ) ( not ( = ?auto_95947 ?auto_95948 ) ) ( not ( = ?auto_95947 ?auto_95949 ) ) ( not ( = ?auto_95947 ?auto_95950 ) ) ( not ( = ?auto_95947 ?auto_95951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95948 ?auto_95949 ?auto_95950 )
      ( MAKE-7CRATE-VERIFY ?auto_95943 ?auto_95944 ?auto_95945 ?auto_95946 ?auto_95947 ?auto_95948 ?auto_95949 ?auto_95950 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96021 - SURFACE
      ?auto_96022 - SURFACE
      ?auto_96023 - SURFACE
      ?auto_96024 - SURFACE
      ?auto_96025 - SURFACE
      ?auto_96026 - SURFACE
      ?auto_96027 - SURFACE
      ?auto_96028 - SURFACE
    )
    :vars
    (
      ?auto_96029 - HOIST
      ?auto_96032 - PLACE
      ?auto_96033 - PLACE
      ?auto_96031 - HOIST
      ?auto_96034 - SURFACE
      ?auto_96030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96029 ?auto_96032 ) ( SURFACE-AT ?auto_96027 ?auto_96032 ) ( CLEAR ?auto_96027 ) ( IS-CRATE ?auto_96028 ) ( not ( = ?auto_96027 ?auto_96028 ) ) ( AVAILABLE ?auto_96029 ) ( ON ?auto_96027 ?auto_96026 ) ( not ( = ?auto_96026 ?auto_96027 ) ) ( not ( = ?auto_96026 ?auto_96028 ) ) ( not ( = ?auto_96033 ?auto_96032 ) ) ( HOIST-AT ?auto_96031 ?auto_96033 ) ( not ( = ?auto_96029 ?auto_96031 ) ) ( AVAILABLE ?auto_96031 ) ( SURFACE-AT ?auto_96028 ?auto_96033 ) ( ON ?auto_96028 ?auto_96034 ) ( CLEAR ?auto_96028 ) ( not ( = ?auto_96027 ?auto_96034 ) ) ( not ( = ?auto_96028 ?auto_96034 ) ) ( not ( = ?auto_96026 ?auto_96034 ) ) ( TRUCK-AT ?auto_96030 ?auto_96032 ) ( ON ?auto_96022 ?auto_96021 ) ( ON ?auto_96023 ?auto_96022 ) ( ON ?auto_96024 ?auto_96023 ) ( ON ?auto_96025 ?auto_96024 ) ( ON ?auto_96026 ?auto_96025 ) ( not ( = ?auto_96021 ?auto_96022 ) ) ( not ( = ?auto_96021 ?auto_96023 ) ) ( not ( = ?auto_96021 ?auto_96024 ) ) ( not ( = ?auto_96021 ?auto_96025 ) ) ( not ( = ?auto_96021 ?auto_96026 ) ) ( not ( = ?auto_96021 ?auto_96027 ) ) ( not ( = ?auto_96021 ?auto_96028 ) ) ( not ( = ?auto_96021 ?auto_96034 ) ) ( not ( = ?auto_96022 ?auto_96023 ) ) ( not ( = ?auto_96022 ?auto_96024 ) ) ( not ( = ?auto_96022 ?auto_96025 ) ) ( not ( = ?auto_96022 ?auto_96026 ) ) ( not ( = ?auto_96022 ?auto_96027 ) ) ( not ( = ?auto_96022 ?auto_96028 ) ) ( not ( = ?auto_96022 ?auto_96034 ) ) ( not ( = ?auto_96023 ?auto_96024 ) ) ( not ( = ?auto_96023 ?auto_96025 ) ) ( not ( = ?auto_96023 ?auto_96026 ) ) ( not ( = ?auto_96023 ?auto_96027 ) ) ( not ( = ?auto_96023 ?auto_96028 ) ) ( not ( = ?auto_96023 ?auto_96034 ) ) ( not ( = ?auto_96024 ?auto_96025 ) ) ( not ( = ?auto_96024 ?auto_96026 ) ) ( not ( = ?auto_96024 ?auto_96027 ) ) ( not ( = ?auto_96024 ?auto_96028 ) ) ( not ( = ?auto_96024 ?auto_96034 ) ) ( not ( = ?auto_96025 ?auto_96026 ) ) ( not ( = ?auto_96025 ?auto_96027 ) ) ( not ( = ?auto_96025 ?auto_96028 ) ) ( not ( = ?auto_96025 ?auto_96034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96026 ?auto_96027 ?auto_96028 )
      ( MAKE-7CRATE-VERIFY ?auto_96021 ?auto_96022 ?auto_96023 ?auto_96024 ?auto_96025 ?auto_96026 ?auto_96027 ?auto_96028 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96099 - SURFACE
      ?auto_96100 - SURFACE
      ?auto_96101 - SURFACE
      ?auto_96102 - SURFACE
      ?auto_96103 - SURFACE
      ?auto_96104 - SURFACE
      ?auto_96105 - SURFACE
      ?auto_96106 - SURFACE
    )
    :vars
    (
      ?auto_96107 - HOIST
      ?auto_96108 - PLACE
      ?auto_96111 - PLACE
      ?auto_96112 - HOIST
      ?auto_96110 - SURFACE
      ?auto_96109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96107 ?auto_96108 ) ( IS-CRATE ?auto_96106 ) ( not ( = ?auto_96105 ?auto_96106 ) ) ( not ( = ?auto_96104 ?auto_96105 ) ) ( not ( = ?auto_96104 ?auto_96106 ) ) ( not ( = ?auto_96111 ?auto_96108 ) ) ( HOIST-AT ?auto_96112 ?auto_96111 ) ( not ( = ?auto_96107 ?auto_96112 ) ) ( AVAILABLE ?auto_96112 ) ( SURFACE-AT ?auto_96106 ?auto_96111 ) ( ON ?auto_96106 ?auto_96110 ) ( CLEAR ?auto_96106 ) ( not ( = ?auto_96105 ?auto_96110 ) ) ( not ( = ?auto_96106 ?auto_96110 ) ) ( not ( = ?auto_96104 ?auto_96110 ) ) ( TRUCK-AT ?auto_96109 ?auto_96108 ) ( SURFACE-AT ?auto_96104 ?auto_96108 ) ( CLEAR ?auto_96104 ) ( LIFTING ?auto_96107 ?auto_96105 ) ( IS-CRATE ?auto_96105 ) ( ON ?auto_96100 ?auto_96099 ) ( ON ?auto_96101 ?auto_96100 ) ( ON ?auto_96102 ?auto_96101 ) ( ON ?auto_96103 ?auto_96102 ) ( ON ?auto_96104 ?auto_96103 ) ( not ( = ?auto_96099 ?auto_96100 ) ) ( not ( = ?auto_96099 ?auto_96101 ) ) ( not ( = ?auto_96099 ?auto_96102 ) ) ( not ( = ?auto_96099 ?auto_96103 ) ) ( not ( = ?auto_96099 ?auto_96104 ) ) ( not ( = ?auto_96099 ?auto_96105 ) ) ( not ( = ?auto_96099 ?auto_96106 ) ) ( not ( = ?auto_96099 ?auto_96110 ) ) ( not ( = ?auto_96100 ?auto_96101 ) ) ( not ( = ?auto_96100 ?auto_96102 ) ) ( not ( = ?auto_96100 ?auto_96103 ) ) ( not ( = ?auto_96100 ?auto_96104 ) ) ( not ( = ?auto_96100 ?auto_96105 ) ) ( not ( = ?auto_96100 ?auto_96106 ) ) ( not ( = ?auto_96100 ?auto_96110 ) ) ( not ( = ?auto_96101 ?auto_96102 ) ) ( not ( = ?auto_96101 ?auto_96103 ) ) ( not ( = ?auto_96101 ?auto_96104 ) ) ( not ( = ?auto_96101 ?auto_96105 ) ) ( not ( = ?auto_96101 ?auto_96106 ) ) ( not ( = ?auto_96101 ?auto_96110 ) ) ( not ( = ?auto_96102 ?auto_96103 ) ) ( not ( = ?auto_96102 ?auto_96104 ) ) ( not ( = ?auto_96102 ?auto_96105 ) ) ( not ( = ?auto_96102 ?auto_96106 ) ) ( not ( = ?auto_96102 ?auto_96110 ) ) ( not ( = ?auto_96103 ?auto_96104 ) ) ( not ( = ?auto_96103 ?auto_96105 ) ) ( not ( = ?auto_96103 ?auto_96106 ) ) ( not ( = ?auto_96103 ?auto_96110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96104 ?auto_96105 ?auto_96106 )
      ( MAKE-7CRATE-VERIFY ?auto_96099 ?auto_96100 ?auto_96101 ?auto_96102 ?auto_96103 ?auto_96104 ?auto_96105 ?auto_96106 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96177 - SURFACE
      ?auto_96178 - SURFACE
      ?auto_96179 - SURFACE
      ?auto_96180 - SURFACE
      ?auto_96181 - SURFACE
      ?auto_96182 - SURFACE
      ?auto_96183 - SURFACE
      ?auto_96184 - SURFACE
    )
    :vars
    (
      ?auto_96188 - HOIST
      ?auto_96190 - PLACE
      ?auto_96187 - PLACE
      ?auto_96185 - HOIST
      ?auto_96186 - SURFACE
      ?auto_96189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96188 ?auto_96190 ) ( IS-CRATE ?auto_96184 ) ( not ( = ?auto_96183 ?auto_96184 ) ) ( not ( = ?auto_96182 ?auto_96183 ) ) ( not ( = ?auto_96182 ?auto_96184 ) ) ( not ( = ?auto_96187 ?auto_96190 ) ) ( HOIST-AT ?auto_96185 ?auto_96187 ) ( not ( = ?auto_96188 ?auto_96185 ) ) ( AVAILABLE ?auto_96185 ) ( SURFACE-AT ?auto_96184 ?auto_96187 ) ( ON ?auto_96184 ?auto_96186 ) ( CLEAR ?auto_96184 ) ( not ( = ?auto_96183 ?auto_96186 ) ) ( not ( = ?auto_96184 ?auto_96186 ) ) ( not ( = ?auto_96182 ?auto_96186 ) ) ( TRUCK-AT ?auto_96189 ?auto_96190 ) ( SURFACE-AT ?auto_96182 ?auto_96190 ) ( CLEAR ?auto_96182 ) ( IS-CRATE ?auto_96183 ) ( AVAILABLE ?auto_96188 ) ( IN ?auto_96183 ?auto_96189 ) ( ON ?auto_96178 ?auto_96177 ) ( ON ?auto_96179 ?auto_96178 ) ( ON ?auto_96180 ?auto_96179 ) ( ON ?auto_96181 ?auto_96180 ) ( ON ?auto_96182 ?auto_96181 ) ( not ( = ?auto_96177 ?auto_96178 ) ) ( not ( = ?auto_96177 ?auto_96179 ) ) ( not ( = ?auto_96177 ?auto_96180 ) ) ( not ( = ?auto_96177 ?auto_96181 ) ) ( not ( = ?auto_96177 ?auto_96182 ) ) ( not ( = ?auto_96177 ?auto_96183 ) ) ( not ( = ?auto_96177 ?auto_96184 ) ) ( not ( = ?auto_96177 ?auto_96186 ) ) ( not ( = ?auto_96178 ?auto_96179 ) ) ( not ( = ?auto_96178 ?auto_96180 ) ) ( not ( = ?auto_96178 ?auto_96181 ) ) ( not ( = ?auto_96178 ?auto_96182 ) ) ( not ( = ?auto_96178 ?auto_96183 ) ) ( not ( = ?auto_96178 ?auto_96184 ) ) ( not ( = ?auto_96178 ?auto_96186 ) ) ( not ( = ?auto_96179 ?auto_96180 ) ) ( not ( = ?auto_96179 ?auto_96181 ) ) ( not ( = ?auto_96179 ?auto_96182 ) ) ( not ( = ?auto_96179 ?auto_96183 ) ) ( not ( = ?auto_96179 ?auto_96184 ) ) ( not ( = ?auto_96179 ?auto_96186 ) ) ( not ( = ?auto_96180 ?auto_96181 ) ) ( not ( = ?auto_96180 ?auto_96182 ) ) ( not ( = ?auto_96180 ?auto_96183 ) ) ( not ( = ?auto_96180 ?auto_96184 ) ) ( not ( = ?auto_96180 ?auto_96186 ) ) ( not ( = ?auto_96181 ?auto_96182 ) ) ( not ( = ?auto_96181 ?auto_96183 ) ) ( not ( = ?auto_96181 ?auto_96184 ) ) ( not ( = ?auto_96181 ?auto_96186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96182 ?auto_96183 ?auto_96184 )
      ( MAKE-7CRATE-VERIFY ?auto_96177 ?auto_96178 ?auto_96179 ?auto_96180 ?auto_96181 ?auto_96182 ?auto_96183 ?auto_96184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_96191 - SURFACE
      ?auto_96192 - SURFACE
    )
    :vars
    (
      ?auto_96197 - HOIST
      ?auto_96199 - PLACE
      ?auto_96194 - SURFACE
      ?auto_96196 - PLACE
      ?auto_96193 - HOIST
      ?auto_96195 - SURFACE
      ?auto_96198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96197 ?auto_96199 ) ( IS-CRATE ?auto_96192 ) ( not ( = ?auto_96191 ?auto_96192 ) ) ( not ( = ?auto_96194 ?auto_96191 ) ) ( not ( = ?auto_96194 ?auto_96192 ) ) ( not ( = ?auto_96196 ?auto_96199 ) ) ( HOIST-AT ?auto_96193 ?auto_96196 ) ( not ( = ?auto_96197 ?auto_96193 ) ) ( AVAILABLE ?auto_96193 ) ( SURFACE-AT ?auto_96192 ?auto_96196 ) ( ON ?auto_96192 ?auto_96195 ) ( CLEAR ?auto_96192 ) ( not ( = ?auto_96191 ?auto_96195 ) ) ( not ( = ?auto_96192 ?auto_96195 ) ) ( not ( = ?auto_96194 ?auto_96195 ) ) ( SURFACE-AT ?auto_96194 ?auto_96199 ) ( CLEAR ?auto_96194 ) ( IS-CRATE ?auto_96191 ) ( AVAILABLE ?auto_96197 ) ( IN ?auto_96191 ?auto_96198 ) ( TRUCK-AT ?auto_96198 ?auto_96196 ) )
    :subtasks
    ( ( !DRIVE ?auto_96198 ?auto_96196 ?auto_96199 )
      ( MAKE-2CRATE ?auto_96194 ?auto_96191 ?auto_96192 )
      ( MAKE-1CRATE-VERIFY ?auto_96191 ?auto_96192 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_96200 - SURFACE
      ?auto_96201 - SURFACE
      ?auto_96202 - SURFACE
    )
    :vars
    (
      ?auto_96206 - HOIST
      ?auto_96208 - PLACE
      ?auto_96205 - PLACE
      ?auto_96207 - HOIST
      ?auto_96203 - SURFACE
      ?auto_96204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96206 ?auto_96208 ) ( IS-CRATE ?auto_96202 ) ( not ( = ?auto_96201 ?auto_96202 ) ) ( not ( = ?auto_96200 ?auto_96201 ) ) ( not ( = ?auto_96200 ?auto_96202 ) ) ( not ( = ?auto_96205 ?auto_96208 ) ) ( HOIST-AT ?auto_96207 ?auto_96205 ) ( not ( = ?auto_96206 ?auto_96207 ) ) ( AVAILABLE ?auto_96207 ) ( SURFACE-AT ?auto_96202 ?auto_96205 ) ( ON ?auto_96202 ?auto_96203 ) ( CLEAR ?auto_96202 ) ( not ( = ?auto_96201 ?auto_96203 ) ) ( not ( = ?auto_96202 ?auto_96203 ) ) ( not ( = ?auto_96200 ?auto_96203 ) ) ( SURFACE-AT ?auto_96200 ?auto_96208 ) ( CLEAR ?auto_96200 ) ( IS-CRATE ?auto_96201 ) ( AVAILABLE ?auto_96206 ) ( IN ?auto_96201 ?auto_96204 ) ( TRUCK-AT ?auto_96204 ?auto_96205 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_96201 ?auto_96202 )
      ( MAKE-2CRATE-VERIFY ?auto_96200 ?auto_96201 ?auto_96202 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_96209 - SURFACE
      ?auto_96210 - SURFACE
      ?auto_96211 - SURFACE
      ?auto_96212 - SURFACE
    )
    :vars
    (
      ?auto_96214 - HOIST
      ?auto_96216 - PLACE
      ?auto_96215 - PLACE
      ?auto_96213 - HOIST
      ?auto_96217 - SURFACE
      ?auto_96218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96214 ?auto_96216 ) ( IS-CRATE ?auto_96212 ) ( not ( = ?auto_96211 ?auto_96212 ) ) ( not ( = ?auto_96210 ?auto_96211 ) ) ( not ( = ?auto_96210 ?auto_96212 ) ) ( not ( = ?auto_96215 ?auto_96216 ) ) ( HOIST-AT ?auto_96213 ?auto_96215 ) ( not ( = ?auto_96214 ?auto_96213 ) ) ( AVAILABLE ?auto_96213 ) ( SURFACE-AT ?auto_96212 ?auto_96215 ) ( ON ?auto_96212 ?auto_96217 ) ( CLEAR ?auto_96212 ) ( not ( = ?auto_96211 ?auto_96217 ) ) ( not ( = ?auto_96212 ?auto_96217 ) ) ( not ( = ?auto_96210 ?auto_96217 ) ) ( SURFACE-AT ?auto_96210 ?auto_96216 ) ( CLEAR ?auto_96210 ) ( IS-CRATE ?auto_96211 ) ( AVAILABLE ?auto_96214 ) ( IN ?auto_96211 ?auto_96218 ) ( TRUCK-AT ?auto_96218 ?auto_96215 ) ( ON ?auto_96210 ?auto_96209 ) ( not ( = ?auto_96209 ?auto_96210 ) ) ( not ( = ?auto_96209 ?auto_96211 ) ) ( not ( = ?auto_96209 ?auto_96212 ) ) ( not ( = ?auto_96209 ?auto_96217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96210 ?auto_96211 ?auto_96212 )
      ( MAKE-3CRATE-VERIFY ?auto_96209 ?auto_96210 ?auto_96211 ?auto_96212 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_96219 - SURFACE
      ?auto_96220 - SURFACE
      ?auto_96221 - SURFACE
      ?auto_96222 - SURFACE
      ?auto_96223 - SURFACE
    )
    :vars
    (
      ?auto_96225 - HOIST
      ?auto_96227 - PLACE
      ?auto_96226 - PLACE
      ?auto_96224 - HOIST
      ?auto_96228 - SURFACE
      ?auto_96229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96225 ?auto_96227 ) ( IS-CRATE ?auto_96223 ) ( not ( = ?auto_96222 ?auto_96223 ) ) ( not ( = ?auto_96221 ?auto_96222 ) ) ( not ( = ?auto_96221 ?auto_96223 ) ) ( not ( = ?auto_96226 ?auto_96227 ) ) ( HOIST-AT ?auto_96224 ?auto_96226 ) ( not ( = ?auto_96225 ?auto_96224 ) ) ( AVAILABLE ?auto_96224 ) ( SURFACE-AT ?auto_96223 ?auto_96226 ) ( ON ?auto_96223 ?auto_96228 ) ( CLEAR ?auto_96223 ) ( not ( = ?auto_96222 ?auto_96228 ) ) ( not ( = ?auto_96223 ?auto_96228 ) ) ( not ( = ?auto_96221 ?auto_96228 ) ) ( SURFACE-AT ?auto_96221 ?auto_96227 ) ( CLEAR ?auto_96221 ) ( IS-CRATE ?auto_96222 ) ( AVAILABLE ?auto_96225 ) ( IN ?auto_96222 ?auto_96229 ) ( TRUCK-AT ?auto_96229 ?auto_96226 ) ( ON ?auto_96220 ?auto_96219 ) ( ON ?auto_96221 ?auto_96220 ) ( not ( = ?auto_96219 ?auto_96220 ) ) ( not ( = ?auto_96219 ?auto_96221 ) ) ( not ( = ?auto_96219 ?auto_96222 ) ) ( not ( = ?auto_96219 ?auto_96223 ) ) ( not ( = ?auto_96219 ?auto_96228 ) ) ( not ( = ?auto_96220 ?auto_96221 ) ) ( not ( = ?auto_96220 ?auto_96222 ) ) ( not ( = ?auto_96220 ?auto_96223 ) ) ( not ( = ?auto_96220 ?auto_96228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96221 ?auto_96222 ?auto_96223 )
      ( MAKE-4CRATE-VERIFY ?auto_96219 ?auto_96220 ?auto_96221 ?auto_96222 ?auto_96223 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_96230 - SURFACE
      ?auto_96231 - SURFACE
      ?auto_96232 - SURFACE
      ?auto_96233 - SURFACE
      ?auto_96234 - SURFACE
      ?auto_96235 - SURFACE
    )
    :vars
    (
      ?auto_96237 - HOIST
      ?auto_96239 - PLACE
      ?auto_96238 - PLACE
      ?auto_96236 - HOIST
      ?auto_96240 - SURFACE
      ?auto_96241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96237 ?auto_96239 ) ( IS-CRATE ?auto_96235 ) ( not ( = ?auto_96234 ?auto_96235 ) ) ( not ( = ?auto_96233 ?auto_96234 ) ) ( not ( = ?auto_96233 ?auto_96235 ) ) ( not ( = ?auto_96238 ?auto_96239 ) ) ( HOIST-AT ?auto_96236 ?auto_96238 ) ( not ( = ?auto_96237 ?auto_96236 ) ) ( AVAILABLE ?auto_96236 ) ( SURFACE-AT ?auto_96235 ?auto_96238 ) ( ON ?auto_96235 ?auto_96240 ) ( CLEAR ?auto_96235 ) ( not ( = ?auto_96234 ?auto_96240 ) ) ( not ( = ?auto_96235 ?auto_96240 ) ) ( not ( = ?auto_96233 ?auto_96240 ) ) ( SURFACE-AT ?auto_96233 ?auto_96239 ) ( CLEAR ?auto_96233 ) ( IS-CRATE ?auto_96234 ) ( AVAILABLE ?auto_96237 ) ( IN ?auto_96234 ?auto_96241 ) ( TRUCK-AT ?auto_96241 ?auto_96238 ) ( ON ?auto_96231 ?auto_96230 ) ( ON ?auto_96232 ?auto_96231 ) ( ON ?auto_96233 ?auto_96232 ) ( not ( = ?auto_96230 ?auto_96231 ) ) ( not ( = ?auto_96230 ?auto_96232 ) ) ( not ( = ?auto_96230 ?auto_96233 ) ) ( not ( = ?auto_96230 ?auto_96234 ) ) ( not ( = ?auto_96230 ?auto_96235 ) ) ( not ( = ?auto_96230 ?auto_96240 ) ) ( not ( = ?auto_96231 ?auto_96232 ) ) ( not ( = ?auto_96231 ?auto_96233 ) ) ( not ( = ?auto_96231 ?auto_96234 ) ) ( not ( = ?auto_96231 ?auto_96235 ) ) ( not ( = ?auto_96231 ?auto_96240 ) ) ( not ( = ?auto_96232 ?auto_96233 ) ) ( not ( = ?auto_96232 ?auto_96234 ) ) ( not ( = ?auto_96232 ?auto_96235 ) ) ( not ( = ?auto_96232 ?auto_96240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96233 ?auto_96234 ?auto_96235 )
      ( MAKE-5CRATE-VERIFY ?auto_96230 ?auto_96231 ?auto_96232 ?auto_96233 ?auto_96234 ?auto_96235 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_96242 - SURFACE
      ?auto_96243 - SURFACE
      ?auto_96244 - SURFACE
      ?auto_96245 - SURFACE
      ?auto_96246 - SURFACE
      ?auto_96247 - SURFACE
      ?auto_96248 - SURFACE
    )
    :vars
    (
      ?auto_96250 - HOIST
      ?auto_96252 - PLACE
      ?auto_96251 - PLACE
      ?auto_96249 - HOIST
      ?auto_96253 - SURFACE
      ?auto_96254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96250 ?auto_96252 ) ( IS-CRATE ?auto_96248 ) ( not ( = ?auto_96247 ?auto_96248 ) ) ( not ( = ?auto_96246 ?auto_96247 ) ) ( not ( = ?auto_96246 ?auto_96248 ) ) ( not ( = ?auto_96251 ?auto_96252 ) ) ( HOIST-AT ?auto_96249 ?auto_96251 ) ( not ( = ?auto_96250 ?auto_96249 ) ) ( AVAILABLE ?auto_96249 ) ( SURFACE-AT ?auto_96248 ?auto_96251 ) ( ON ?auto_96248 ?auto_96253 ) ( CLEAR ?auto_96248 ) ( not ( = ?auto_96247 ?auto_96253 ) ) ( not ( = ?auto_96248 ?auto_96253 ) ) ( not ( = ?auto_96246 ?auto_96253 ) ) ( SURFACE-AT ?auto_96246 ?auto_96252 ) ( CLEAR ?auto_96246 ) ( IS-CRATE ?auto_96247 ) ( AVAILABLE ?auto_96250 ) ( IN ?auto_96247 ?auto_96254 ) ( TRUCK-AT ?auto_96254 ?auto_96251 ) ( ON ?auto_96243 ?auto_96242 ) ( ON ?auto_96244 ?auto_96243 ) ( ON ?auto_96245 ?auto_96244 ) ( ON ?auto_96246 ?auto_96245 ) ( not ( = ?auto_96242 ?auto_96243 ) ) ( not ( = ?auto_96242 ?auto_96244 ) ) ( not ( = ?auto_96242 ?auto_96245 ) ) ( not ( = ?auto_96242 ?auto_96246 ) ) ( not ( = ?auto_96242 ?auto_96247 ) ) ( not ( = ?auto_96242 ?auto_96248 ) ) ( not ( = ?auto_96242 ?auto_96253 ) ) ( not ( = ?auto_96243 ?auto_96244 ) ) ( not ( = ?auto_96243 ?auto_96245 ) ) ( not ( = ?auto_96243 ?auto_96246 ) ) ( not ( = ?auto_96243 ?auto_96247 ) ) ( not ( = ?auto_96243 ?auto_96248 ) ) ( not ( = ?auto_96243 ?auto_96253 ) ) ( not ( = ?auto_96244 ?auto_96245 ) ) ( not ( = ?auto_96244 ?auto_96246 ) ) ( not ( = ?auto_96244 ?auto_96247 ) ) ( not ( = ?auto_96244 ?auto_96248 ) ) ( not ( = ?auto_96244 ?auto_96253 ) ) ( not ( = ?auto_96245 ?auto_96246 ) ) ( not ( = ?auto_96245 ?auto_96247 ) ) ( not ( = ?auto_96245 ?auto_96248 ) ) ( not ( = ?auto_96245 ?auto_96253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96246 ?auto_96247 ?auto_96248 )
      ( MAKE-6CRATE-VERIFY ?auto_96242 ?auto_96243 ?auto_96244 ?auto_96245 ?auto_96246 ?auto_96247 ?auto_96248 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96255 - SURFACE
      ?auto_96256 - SURFACE
      ?auto_96257 - SURFACE
      ?auto_96258 - SURFACE
      ?auto_96259 - SURFACE
      ?auto_96260 - SURFACE
      ?auto_96261 - SURFACE
      ?auto_96262 - SURFACE
    )
    :vars
    (
      ?auto_96264 - HOIST
      ?auto_96266 - PLACE
      ?auto_96265 - PLACE
      ?auto_96263 - HOIST
      ?auto_96267 - SURFACE
      ?auto_96268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96264 ?auto_96266 ) ( IS-CRATE ?auto_96262 ) ( not ( = ?auto_96261 ?auto_96262 ) ) ( not ( = ?auto_96260 ?auto_96261 ) ) ( not ( = ?auto_96260 ?auto_96262 ) ) ( not ( = ?auto_96265 ?auto_96266 ) ) ( HOIST-AT ?auto_96263 ?auto_96265 ) ( not ( = ?auto_96264 ?auto_96263 ) ) ( AVAILABLE ?auto_96263 ) ( SURFACE-AT ?auto_96262 ?auto_96265 ) ( ON ?auto_96262 ?auto_96267 ) ( CLEAR ?auto_96262 ) ( not ( = ?auto_96261 ?auto_96267 ) ) ( not ( = ?auto_96262 ?auto_96267 ) ) ( not ( = ?auto_96260 ?auto_96267 ) ) ( SURFACE-AT ?auto_96260 ?auto_96266 ) ( CLEAR ?auto_96260 ) ( IS-CRATE ?auto_96261 ) ( AVAILABLE ?auto_96264 ) ( IN ?auto_96261 ?auto_96268 ) ( TRUCK-AT ?auto_96268 ?auto_96265 ) ( ON ?auto_96256 ?auto_96255 ) ( ON ?auto_96257 ?auto_96256 ) ( ON ?auto_96258 ?auto_96257 ) ( ON ?auto_96259 ?auto_96258 ) ( ON ?auto_96260 ?auto_96259 ) ( not ( = ?auto_96255 ?auto_96256 ) ) ( not ( = ?auto_96255 ?auto_96257 ) ) ( not ( = ?auto_96255 ?auto_96258 ) ) ( not ( = ?auto_96255 ?auto_96259 ) ) ( not ( = ?auto_96255 ?auto_96260 ) ) ( not ( = ?auto_96255 ?auto_96261 ) ) ( not ( = ?auto_96255 ?auto_96262 ) ) ( not ( = ?auto_96255 ?auto_96267 ) ) ( not ( = ?auto_96256 ?auto_96257 ) ) ( not ( = ?auto_96256 ?auto_96258 ) ) ( not ( = ?auto_96256 ?auto_96259 ) ) ( not ( = ?auto_96256 ?auto_96260 ) ) ( not ( = ?auto_96256 ?auto_96261 ) ) ( not ( = ?auto_96256 ?auto_96262 ) ) ( not ( = ?auto_96256 ?auto_96267 ) ) ( not ( = ?auto_96257 ?auto_96258 ) ) ( not ( = ?auto_96257 ?auto_96259 ) ) ( not ( = ?auto_96257 ?auto_96260 ) ) ( not ( = ?auto_96257 ?auto_96261 ) ) ( not ( = ?auto_96257 ?auto_96262 ) ) ( not ( = ?auto_96257 ?auto_96267 ) ) ( not ( = ?auto_96258 ?auto_96259 ) ) ( not ( = ?auto_96258 ?auto_96260 ) ) ( not ( = ?auto_96258 ?auto_96261 ) ) ( not ( = ?auto_96258 ?auto_96262 ) ) ( not ( = ?auto_96258 ?auto_96267 ) ) ( not ( = ?auto_96259 ?auto_96260 ) ) ( not ( = ?auto_96259 ?auto_96261 ) ) ( not ( = ?auto_96259 ?auto_96262 ) ) ( not ( = ?auto_96259 ?auto_96267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96260 ?auto_96261 ?auto_96262 )
      ( MAKE-7CRATE-VERIFY ?auto_96255 ?auto_96256 ?auto_96257 ?auto_96258 ?auto_96259 ?auto_96260 ?auto_96261 ?auto_96262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_96269 - SURFACE
      ?auto_96270 - SURFACE
    )
    :vars
    (
      ?auto_96272 - HOIST
      ?auto_96275 - PLACE
      ?auto_96273 - SURFACE
      ?auto_96274 - PLACE
      ?auto_96271 - HOIST
      ?auto_96276 - SURFACE
      ?auto_96277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96272 ?auto_96275 ) ( IS-CRATE ?auto_96270 ) ( not ( = ?auto_96269 ?auto_96270 ) ) ( not ( = ?auto_96273 ?auto_96269 ) ) ( not ( = ?auto_96273 ?auto_96270 ) ) ( not ( = ?auto_96274 ?auto_96275 ) ) ( HOIST-AT ?auto_96271 ?auto_96274 ) ( not ( = ?auto_96272 ?auto_96271 ) ) ( SURFACE-AT ?auto_96270 ?auto_96274 ) ( ON ?auto_96270 ?auto_96276 ) ( CLEAR ?auto_96270 ) ( not ( = ?auto_96269 ?auto_96276 ) ) ( not ( = ?auto_96270 ?auto_96276 ) ) ( not ( = ?auto_96273 ?auto_96276 ) ) ( SURFACE-AT ?auto_96273 ?auto_96275 ) ( CLEAR ?auto_96273 ) ( IS-CRATE ?auto_96269 ) ( AVAILABLE ?auto_96272 ) ( TRUCK-AT ?auto_96277 ?auto_96274 ) ( LIFTING ?auto_96271 ?auto_96269 ) )
    :subtasks
    ( ( !LOAD ?auto_96271 ?auto_96269 ?auto_96277 ?auto_96274 )
      ( MAKE-2CRATE ?auto_96273 ?auto_96269 ?auto_96270 )
      ( MAKE-1CRATE-VERIFY ?auto_96269 ?auto_96270 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_96278 - SURFACE
      ?auto_96279 - SURFACE
      ?auto_96280 - SURFACE
    )
    :vars
    (
      ?auto_96284 - HOIST
      ?auto_96286 - PLACE
      ?auto_96283 - PLACE
      ?auto_96282 - HOIST
      ?auto_96285 - SURFACE
      ?auto_96281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96284 ?auto_96286 ) ( IS-CRATE ?auto_96280 ) ( not ( = ?auto_96279 ?auto_96280 ) ) ( not ( = ?auto_96278 ?auto_96279 ) ) ( not ( = ?auto_96278 ?auto_96280 ) ) ( not ( = ?auto_96283 ?auto_96286 ) ) ( HOIST-AT ?auto_96282 ?auto_96283 ) ( not ( = ?auto_96284 ?auto_96282 ) ) ( SURFACE-AT ?auto_96280 ?auto_96283 ) ( ON ?auto_96280 ?auto_96285 ) ( CLEAR ?auto_96280 ) ( not ( = ?auto_96279 ?auto_96285 ) ) ( not ( = ?auto_96280 ?auto_96285 ) ) ( not ( = ?auto_96278 ?auto_96285 ) ) ( SURFACE-AT ?auto_96278 ?auto_96286 ) ( CLEAR ?auto_96278 ) ( IS-CRATE ?auto_96279 ) ( AVAILABLE ?auto_96284 ) ( TRUCK-AT ?auto_96281 ?auto_96283 ) ( LIFTING ?auto_96282 ?auto_96279 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_96279 ?auto_96280 )
      ( MAKE-2CRATE-VERIFY ?auto_96278 ?auto_96279 ?auto_96280 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_96287 - SURFACE
      ?auto_96288 - SURFACE
      ?auto_96289 - SURFACE
      ?auto_96290 - SURFACE
    )
    :vars
    (
      ?auto_96293 - HOIST
      ?auto_96295 - PLACE
      ?auto_96294 - PLACE
      ?auto_96296 - HOIST
      ?auto_96291 - SURFACE
      ?auto_96292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96293 ?auto_96295 ) ( IS-CRATE ?auto_96290 ) ( not ( = ?auto_96289 ?auto_96290 ) ) ( not ( = ?auto_96288 ?auto_96289 ) ) ( not ( = ?auto_96288 ?auto_96290 ) ) ( not ( = ?auto_96294 ?auto_96295 ) ) ( HOIST-AT ?auto_96296 ?auto_96294 ) ( not ( = ?auto_96293 ?auto_96296 ) ) ( SURFACE-AT ?auto_96290 ?auto_96294 ) ( ON ?auto_96290 ?auto_96291 ) ( CLEAR ?auto_96290 ) ( not ( = ?auto_96289 ?auto_96291 ) ) ( not ( = ?auto_96290 ?auto_96291 ) ) ( not ( = ?auto_96288 ?auto_96291 ) ) ( SURFACE-AT ?auto_96288 ?auto_96295 ) ( CLEAR ?auto_96288 ) ( IS-CRATE ?auto_96289 ) ( AVAILABLE ?auto_96293 ) ( TRUCK-AT ?auto_96292 ?auto_96294 ) ( LIFTING ?auto_96296 ?auto_96289 ) ( ON ?auto_96288 ?auto_96287 ) ( not ( = ?auto_96287 ?auto_96288 ) ) ( not ( = ?auto_96287 ?auto_96289 ) ) ( not ( = ?auto_96287 ?auto_96290 ) ) ( not ( = ?auto_96287 ?auto_96291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96288 ?auto_96289 ?auto_96290 )
      ( MAKE-3CRATE-VERIFY ?auto_96287 ?auto_96288 ?auto_96289 ?auto_96290 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_96297 - SURFACE
      ?auto_96298 - SURFACE
      ?auto_96299 - SURFACE
      ?auto_96300 - SURFACE
      ?auto_96301 - SURFACE
    )
    :vars
    (
      ?auto_96304 - HOIST
      ?auto_96306 - PLACE
      ?auto_96305 - PLACE
      ?auto_96307 - HOIST
      ?auto_96302 - SURFACE
      ?auto_96303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96304 ?auto_96306 ) ( IS-CRATE ?auto_96301 ) ( not ( = ?auto_96300 ?auto_96301 ) ) ( not ( = ?auto_96299 ?auto_96300 ) ) ( not ( = ?auto_96299 ?auto_96301 ) ) ( not ( = ?auto_96305 ?auto_96306 ) ) ( HOIST-AT ?auto_96307 ?auto_96305 ) ( not ( = ?auto_96304 ?auto_96307 ) ) ( SURFACE-AT ?auto_96301 ?auto_96305 ) ( ON ?auto_96301 ?auto_96302 ) ( CLEAR ?auto_96301 ) ( not ( = ?auto_96300 ?auto_96302 ) ) ( not ( = ?auto_96301 ?auto_96302 ) ) ( not ( = ?auto_96299 ?auto_96302 ) ) ( SURFACE-AT ?auto_96299 ?auto_96306 ) ( CLEAR ?auto_96299 ) ( IS-CRATE ?auto_96300 ) ( AVAILABLE ?auto_96304 ) ( TRUCK-AT ?auto_96303 ?auto_96305 ) ( LIFTING ?auto_96307 ?auto_96300 ) ( ON ?auto_96298 ?auto_96297 ) ( ON ?auto_96299 ?auto_96298 ) ( not ( = ?auto_96297 ?auto_96298 ) ) ( not ( = ?auto_96297 ?auto_96299 ) ) ( not ( = ?auto_96297 ?auto_96300 ) ) ( not ( = ?auto_96297 ?auto_96301 ) ) ( not ( = ?auto_96297 ?auto_96302 ) ) ( not ( = ?auto_96298 ?auto_96299 ) ) ( not ( = ?auto_96298 ?auto_96300 ) ) ( not ( = ?auto_96298 ?auto_96301 ) ) ( not ( = ?auto_96298 ?auto_96302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96299 ?auto_96300 ?auto_96301 )
      ( MAKE-4CRATE-VERIFY ?auto_96297 ?auto_96298 ?auto_96299 ?auto_96300 ?auto_96301 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_96308 - SURFACE
      ?auto_96309 - SURFACE
      ?auto_96310 - SURFACE
      ?auto_96311 - SURFACE
      ?auto_96312 - SURFACE
      ?auto_96313 - SURFACE
    )
    :vars
    (
      ?auto_96316 - HOIST
      ?auto_96318 - PLACE
      ?auto_96317 - PLACE
      ?auto_96319 - HOIST
      ?auto_96314 - SURFACE
      ?auto_96315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96316 ?auto_96318 ) ( IS-CRATE ?auto_96313 ) ( not ( = ?auto_96312 ?auto_96313 ) ) ( not ( = ?auto_96311 ?auto_96312 ) ) ( not ( = ?auto_96311 ?auto_96313 ) ) ( not ( = ?auto_96317 ?auto_96318 ) ) ( HOIST-AT ?auto_96319 ?auto_96317 ) ( not ( = ?auto_96316 ?auto_96319 ) ) ( SURFACE-AT ?auto_96313 ?auto_96317 ) ( ON ?auto_96313 ?auto_96314 ) ( CLEAR ?auto_96313 ) ( not ( = ?auto_96312 ?auto_96314 ) ) ( not ( = ?auto_96313 ?auto_96314 ) ) ( not ( = ?auto_96311 ?auto_96314 ) ) ( SURFACE-AT ?auto_96311 ?auto_96318 ) ( CLEAR ?auto_96311 ) ( IS-CRATE ?auto_96312 ) ( AVAILABLE ?auto_96316 ) ( TRUCK-AT ?auto_96315 ?auto_96317 ) ( LIFTING ?auto_96319 ?auto_96312 ) ( ON ?auto_96309 ?auto_96308 ) ( ON ?auto_96310 ?auto_96309 ) ( ON ?auto_96311 ?auto_96310 ) ( not ( = ?auto_96308 ?auto_96309 ) ) ( not ( = ?auto_96308 ?auto_96310 ) ) ( not ( = ?auto_96308 ?auto_96311 ) ) ( not ( = ?auto_96308 ?auto_96312 ) ) ( not ( = ?auto_96308 ?auto_96313 ) ) ( not ( = ?auto_96308 ?auto_96314 ) ) ( not ( = ?auto_96309 ?auto_96310 ) ) ( not ( = ?auto_96309 ?auto_96311 ) ) ( not ( = ?auto_96309 ?auto_96312 ) ) ( not ( = ?auto_96309 ?auto_96313 ) ) ( not ( = ?auto_96309 ?auto_96314 ) ) ( not ( = ?auto_96310 ?auto_96311 ) ) ( not ( = ?auto_96310 ?auto_96312 ) ) ( not ( = ?auto_96310 ?auto_96313 ) ) ( not ( = ?auto_96310 ?auto_96314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96311 ?auto_96312 ?auto_96313 )
      ( MAKE-5CRATE-VERIFY ?auto_96308 ?auto_96309 ?auto_96310 ?auto_96311 ?auto_96312 ?auto_96313 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_96320 - SURFACE
      ?auto_96321 - SURFACE
      ?auto_96322 - SURFACE
      ?auto_96323 - SURFACE
      ?auto_96324 - SURFACE
      ?auto_96325 - SURFACE
      ?auto_96326 - SURFACE
    )
    :vars
    (
      ?auto_96329 - HOIST
      ?auto_96331 - PLACE
      ?auto_96330 - PLACE
      ?auto_96332 - HOIST
      ?auto_96327 - SURFACE
      ?auto_96328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96329 ?auto_96331 ) ( IS-CRATE ?auto_96326 ) ( not ( = ?auto_96325 ?auto_96326 ) ) ( not ( = ?auto_96324 ?auto_96325 ) ) ( not ( = ?auto_96324 ?auto_96326 ) ) ( not ( = ?auto_96330 ?auto_96331 ) ) ( HOIST-AT ?auto_96332 ?auto_96330 ) ( not ( = ?auto_96329 ?auto_96332 ) ) ( SURFACE-AT ?auto_96326 ?auto_96330 ) ( ON ?auto_96326 ?auto_96327 ) ( CLEAR ?auto_96326 ) ( not ( = ?auto_96325 ?auto_96327 ) ) ( not ( = ?auto_96326 ?auto_96327 ) ) ( not ( = ?auto_96324 ?auto_96327 ) ) ( SURFACE-AT ?auto_96324 ?auto_96331 ) ( CLEAR ?auto_96324 ) ( IS-CRATE ?auto_96325 ) ( AVAILABLE ?auto_96329 ) ( TRUCK-AT ?auto_96328 ?auto_96330 ) ( LIFTING ?auto_96332 ?auto_96325 ) ( ON ?auto_96321 ?auto_96320 ) ( ON ?auto_96322 ?auto_96321 ) ( ON ?auto_96323 ?auto_96322 ) ( ON ?auto_96324 ?auto_96323 ) ( not ( = ?auto_96320 ?auto_96321 ) ) ( not ( = ?auto_96320 ?auto_96322 ) ) ( not ( = ?auto_96320 ?auto_96323 ) ) ( not ( = ?auto_96320 ?auto_96324 ) ) ( not ( = ?auto_96320 ?auto_96325 ) ) ( not ( = ?auto_96320 ?auto_96326 ) ) ( not ( = ?auto_96320 ?auto_96327 ) ) ( not ( = ?auto_96321 ?auto_96322 ) ) ( not ( = ?auto_96321 ?auto_96323 ) ) ( not ( = ?auto_96321 ?auto_96324 ) ) ( not ( = ?auto_96321 ?auto_96325 ) ) ( not ( = ?auto_96321 ?auto_96326 ) ) ( not ( = ?auto_96321 ?auto_96327 ) ) ( not ( = ?auto_96322 ?auto_96323 ) ) ( not ( = ?auto_96322 ?auto_96324 ) ) ( not ( = ?auto_96322 ?auto_96325 ) ) ( not ( = ?auto_96322 ?auto_96326 ) ) ( not ( = ?auto_96322 ?auto_96327 ) ) ( not ( = ?auto_96323 ?auto_96324 ) ) ( not ( = ?auto_96323 ?auto_96325 ) ) ( not ( = ?auto_96323 ?auto_96326 ) ) ( not ( = ?auto_96323 ?auto_96327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96324 ?auto_96325 ?auto_96326 )
      ( MAKE-6CRATE-VERIFY ?auto_96320 ?auto_96321 ?auto_96322 ?auto_96323 ?auto_96324 ?auto_96325 ?auto_96326 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96333 - SURFACE
      ?auto_96334 - SURFACE
      ?auto_96335 - SURFACE
      ?auto_96336 - SURFACE
      ?auto_96337 - SURFACE
      ?auto_96338 - SURFACE
      ?auto_96339 - SURFACE
      ?auto_96340 - SURFACE
    )
    :vars
    (
      ?auto_96343 - HOIST
      ?auto_96345 - PLACE
      ?auto_96344 - PLACE
      ?auto_96346 - HOIST
      ?auto_96341 - SURFACE
      ?auto_96342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96343 ?auto_96345 ) ( IS-CRATE ?auto_96340 ) ( not ( = ?auto_96339 ?auto_96340 ) ) ( not ( = ?auto_96338 ?auto_96339 ) ) ( not ( = ?auto_96338 ?auto_96340 ) ) ( not ( = ?auto_96344 ?auto_96345 ) ) ( HOIST-AT ?auto_96346 ?auto_96344 ) ( not ( = ?auto_96343 ?auto_96346 ) ) ( SURFACE-AT ?auto_96340 ?auto_96344 ) ( ON ?auto_96340 ?auto_96341 ) ( CLEAR ?auto_96340 ) ( not ( = ?auto_96339 ?auto_96341 ) ) ( not ( = ?auto_96340 ?auto_96341 ) ) ( not ( = ?auto_96338 ?auto_96341 ) ) ( SURFACE-AT ?auto_96338 ?auto_96345 ) ( CLEAR ?auto_96338 ) ( IS-CRATE ?auto_96339 ) ( AVAILABLE ?auto_96343 ) ( TRUCK-AT ?auto_96342 ?auto_96344 ) ( LIFTING ?auto_96346 ?auto_96339 ) ( ON ?auto_96334 ?auto_96333 ) ( ON ?auto_96335 ?auto_96334 ) ( ON ?auto_96336 ?auto_96335 ) ( ON ?auto_96337 ?auto_96336 ) ( ON ?auto_96338 ?auto_96337 ) ( not ( = ?auto_96333 ?auto_96334 ) ) ( not ( = ?auto_96333 ?auto_96335 ) ) ( not ( = ?auto_96333 ?auto_96336 ) ) ( not ( = ?auto_96333 ?auto_96337 ) ) ( not ( = ?auto_96333 ?auto_96338 ) ) ( not ( = ?auto_96333 ?auto_96339 ) ) ( not ( = ?auto_96333 ?auto_96340 ) ) ( not ( = ?auto_96333 ?auto_96341 ) ) ( not ( = ?auto_96334 ?auto_96335 ) ) ( not ( = ?auto_96334 ?auto_96336 ) ) ( not ( = ?auto_96334 ?auto_96337 ) ) ( not ( = ?auto_96334 ?auto_96338 ) ) ( not ( = ?auto_96334 ?auto_96339 ) ) ( not ( = ?auto_96334 ?auto_96340 ) ) ( not ( = ?auto_96334 ?auto_96341 ) ) ( not ( = ?auto_96335 ?auto_96336 ) ) ( not ( = ?auto_96335 ?auto_96337 ) ) ( not ( = ?auto_96335 ?auto_96338 ) ) ( not ( = ?auto_96335 ?auto_96339 ) ) ( not ( = ?auto_96335 ?auto_96340 ) ) ( not ( = ?auto_96335 ?auto_96341 ) ) ( not ( = ?auto_96336 ?auto_96337 ) ) ( not ( = ?auto_96336 ?auto_96338 ) ) ( not ( = ?auto_96336 ?auto_96339 ) ) ( not ( = ?auto_96336 ?auto_96340 ) ) ( not ( = ?auto_96336 ?auto_96341 ) ) ( not ( = ?auto_96337 ?auto_96338 ) ) ( not ( = ?auto_96337 ?auto_96339 ) ) ( not ( = ?auto_96337 ?auto_96340 ) ) ( not ( = ?auto_96337 ?auto_96341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96338 ?auto_96339 ?auto_96340 )
      ( MAKE-7CRATE-VERIFY ?auto_96333 ?auto_96334 ?auto_96335 ?auto_96336 ?auto_96337 ?auto_96338 ?auto_96339 ?auto_96340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_96347 - SURFACE
      ?auto_96348 - SURFACE
    )
    :vars
    (
      ?auto_96352 - HOIST
      ?auto_96354 - PLACE
      ?auto_96350 - SURFACE
      ?auto_96353 - PLACE
      ?auto_96355 - HOIST
      ?auto_96349 - SURFACE
      ?auto_96351 - TRUCK
      ?auto_96356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96352 ?auto_96354 ) ( IS-CRATE ?auto_96348 ) ( not ( = ?auto_96347 ?auto_96348 ) ) ( not ( = ?auto_96350 ?auto_96347 ) ) ( not ( = ?auto_96350 ?auto_96348 ) ) ( not ( = ?auto_96353 ?auto_96354 ) ) ( HOIST-AT ?auto_96355 ?auto_96353 ) ( not ( = ?auto_96352 ?auto_96355 ) ) ( SURFACE-AT ?auto_96348 ?auto_96353 ) ( ON ?auto_96348 ?auto_96349 ) ( CLEAR ?auto_96348 ) ( not ( = ?auto_96347 ?auto_96349 ) ) ( not ( = ?auto_96348 ?auto_96349 ) ) ( not ( = ?auto_96350 ?auto_96349 ) ) ( SURFACE-AT ?auto_96350 ?auto_96354 ) ( CLEAR ?auto_96350 ) ( IS-CRATE ?auto_96347 ) ( AVAILABLE ?auto_96352 ) ( TRUCK-AT ?auto_96351 ?auto_96353 ) ( AVAILABLE ?auto_96355 ) ( SURFACE-AT ?auto_96347 ?auto_96353 ) ( ON ?auto_96347 ?auto_96356 ) ( CLEAR ?auto_96347 ) ( not ( = ?auto_96347 ?auto_96356 ) ) ( not ( = ?auto_96348 ?auto_96356 ) ) ( not ( = ?auto_96350 ?auto_96356 ) ) ( not ( = ?auto_96349 ?auto_96356 ) ) )
    :subtasks
    ( ( !LIFT ?auto_96355 ?auto_96347 ?auto_96356 ?auto_96353 )
      ( MAKE-2CRATE ?auto_96350 ?auto_96347 ?auto_96348 )
      ( MAKE-1CRATE-VERIFY ?auto_96347 ?auto_96348 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_96357 - SURFACE
      ?auto_96358 - SURFACE
      ?auto_96359 - SURFACE
    )
    :vars
    (
      ?auto_96362 - HOIST
      ?auto_96363 - PLACE
      ?auto_96365 - PLACE
      ?auto_96364 - HOIST
      ?auto_96360 - SURFACE
      ?auto_96361 - TRUCK
      ?auto_96366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96362 ?auto_96363 ) ( IS-CRATE ?auto_96359 ) ( not ( = ?auto_96358 ?auto_96359 ) ) ( not ( = ?auto_96357 ?auto_96358 ) ) ( not ( = ?auto_96357 ?auto_96359 ) ) ( not ( = ?auto_96365 ?auto_96363 ) ) ( HOIST-AT ?auto_96364 ?auto_96365 ) ( not ( = ?auto_96362 ?auto_96364 ) ) ( SURFACE-AT ?auto_96359 ?auto_96365 ) ( ON ?auto_96359 ?auto_96360 ) ( CLEAR ?auto_96359 ) ( not ( = ?auto_96358 ?auto_96360 ) ) ( not ( = ?auto_96359 ?auto_96360 ) ) ( not ( = ?auto_96357 ?auto_96360 ) ) ( SURFACE-AT ?auto_96357 ?auto_96363 ) ( CLEAR ?auto_96357 ) ( IS-CRATE ?auto_96358 ) ( AVAILABLE ?auto_96362 ) ( TRUCK-AT ?auto_96361 ?auto_96365 ) ( AVAILABLE ?auto_96364 ) ( SURFACE-AT ?auto_96358 ?auto_96365 ) ( ON ?auto_96358 ?auto_96366 ) ( CLEAR ?auto_96358 ) ( not ( = ?auto_96358 ?auto_96366 ) ) ( not ( = ?auto_96359 ?auto_96366 ) ) ( not ( = ?auto_96357 ?auto_96366 ) ) ( not ( = ?auto_96360 ?auto_96366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_96358 ?auto_96359 )
      ( MAKE-2CRATE-VERIFY ?auto_96357 ?auto_96358 ?auto_96359 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_96367 - SURFACE
      ?auto_96368 - SURFACE
      ?auto_96369 - SURFACE
      ?auto_96370 - SURFACE
    )
    :vars
    (
      ?auto_96373 - HOIST
      ?auto_96375 - PLACE
      ?auto_96376 - PLACE
      ?auto_96377 - HOIST
      ?auto_96371 - SURFACE
      ?auto_96374 - TRUCK
      ?auto_96372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96373 ?auto_96375 ) ( IS-CRATE ?auto_96370 ) ( not ( = ?auto_96369 ?auto_96370 ) ) ( not ( = ?auto_96368 ?auto_96369 ) ) ( not ( = ?auto_96368 ?auto_96370 ) ) ( not ( = ?auto_96376 ?auto_96375 ) ) ( HOIST-AT ?auto_96377 ?auto_96376 ) ( not ( = ?auto_96373 ?auto_96377 ) ) ( SURFACE-AT ?auto_96370 ?auto_96376 ) ( ON ?auto_96370 ?auto_96371 ) ( CLEAR ?auto_96370 ) ( not ( = ?auto_96369 ?auto_96371 ) ) ( not ( = ?auto_96370 ?auto_96371 ) ) ( not ( = ?auto_96368 ?auto_96371 ) ) ( SURFACE-AT ?auto_96368 ?auto_96375 ) ( CLEAR ?auto_96368 ) ( IS-CRATE ?auto_96369 ) ( AVAILABLE ?auto_96373 ) ( TRUCK-AT ?auto_96374 ?auto_96376 ) ( AVAILABLE ?auto_96377 ) ( SURFACE-AT ?auto_96369 ?auto_96376 ) ( ON ?auto_96369 ?auto_96372 ) ( CLEAR ?auto_96369 ) ( not ( = ?auto_96369 ?auto_96372 ) ) ( not ( = ?auto_96370 ?auto_96372 ) ) ( not ( = ?auto_96368 ?auto_96372 ) ) ( not ( = ?auto_96371 ?auto_96372 ) ) ( ON ?auto_96368 ?auto_96367 ) ( not ( = ?auto_96367 ?auto_96368 ) ) ( not ( = ?auto_96367 ?auto_96369 ) ) ( not ( = ?auto_96367 ?auto_96370 ) ) ( not ( = ?auto_96367 ?auto_96371 ) ) ( not ( = ?auto_96367 ?auto_96372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96368 ?auto_96369 ?auto_96370 )
      ( MAKE-3CRATE-VERIFY ?auto_96367 ?auto_96368 ?auto_96369 ?auto_96370 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_96378 - SURFACE
      ?auto_96379 - SURFACE
      ?auto_96380 - SURFACE
      ?auto_96381 - SURFACE
      ?auto_96382 - SURFACE
    )
    :vars
    (
      ?auto_96385 - HOIST
      ?auto_96387 - PLACE
      ?auto_96388 - PLACE
      ?auto_96389 - HOIST
      ?auto_96383 - SURFACE
      ?auto_96386 - TRUCK
      ?auto_96384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96385 ?auto_96387 ) ( IS-CRATE ?auto_96382 ) ( not ( = ?auto_96381 ?auto_96382 ) ) ( not ( = ?auto_96380 ?auto_96381 ) ) ( not ( = ?auto_96380 ?auto_96382 ) ) ( not ( = ?auto_96388 ?auto_96387 ) ) ( HOIST-AT ?auto_96389 ?auto_96388 ) ( not ( = ?auto_96385 ?auto_96389 ) ) ( SURFACE-AT ?auto_96382 ?auto_96388 ) ( ON ?auto_96382 ?auto_96383 ) ( CLEAR ?auto_96382 ) ( not ( = ?auto_96381 ?auto_96383 ) ) ( not ( = ?auto_96382 ?auto_96383 ) ) ( not ( = ?auto_96380 ?auto_96383 ) ) ( SURFACE-AT ?auto_96380 ?auto_96387 ) ( CLEAR ?auto_96380 ) ( IS-CRATE ?auto_96381 ) ( AVAILABLE ?auto_96385 ) ( TRUCK-AT ?auto_96386 ?auto_96388 ) ( AVAILABLE ?auto_96389 ) ( SURFACE-AT ?auto_96381 ?auto_96388 ) ( ON ?auto_96381 ?auto_96384 ) ( CLEAR ?auto_96381 ) ( not ( = ?auto_96381 ?auto_96384 ) ) ( not ( = ?auto_96382 ?auto_96384 ) ) ( not ( = ?auto_96380 ?auto_96384 ) ) ( not ( = ?auto_96383 ?auto_96384 ) ) ( ON ?auto_96379 ?auto_96378 ) ( ON ?auto_96380 ?auto_96379 ) ( not ( = ?auto_96378 ?auto_96379 ) ) ( not ( = ?auto_96378 ?auto_96380 ) ) ( not ( = ?auto_96378 ?auto_96381 ) ) ( not ( = ?auto_96378 ?auto_96382 ) ) ( not ( = ?auto_96378 ?auto_96383 ) ) ( not ( = ?auto_96378 ?auto_96384 ) ) ( not ( = ?auto_96379 ?auto_96380 ) ) ( not ( = ?auto_96379 ?auto_96381 ) ) ( not ( = ?auto_96379 ?auto_96382 ) ) ( not ( = ?auto_96379 ?auto_96383 ) ) ( not ( = ?auto_96379 ?auto_96384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96380 ?auto_96381 ?auto_96382 )
      ( MAKE-4CRATE-VERIFY ?auto_96378 ?auto_96379 ?auto_96380 ?auto_96381 ?auto_96382 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_96390 - SURFACE
      ?auto_96391 - SURFACE
      ?auto_96392 - SURFACE
      ?auto_96393 - SURFACE
      ?auto_96394 - SURFACE
      ?auto_96395 - SURFACE
    )
    :vars
    (
      ?auto_96398 - HOIST
      ?auto_96400 - PLACE
      ?auto_96401 - PLACE
      ?auto_96402 - HOIST
      ?auto_96396 - SURFACE
      ?auto_96399 - TRUCK
      ?auto_96397 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96398 ?auto_96400 ) ( IS-CRATE ?auto_96395 ) ( not ( = ?auto_96394 ?auto_96395 ) ) ( not ( = ?auto_96393 ?auto_96394 ) ) ( not ( = ?auto_96393 ?auto_96395 ) ) ( not ( = ?auto_96401 ?auto_96400 ) ) ( HOIST-AT ?auto_96402 ?auto_96401 ) ( not ( = ?auto_96398 ?auto_96402 ) ) ( SURFACE-AT ?auto_96395 ?auto_96401 ) ( ON ?auto_96395 ?auto_96396 ) ( CLEAR ?auto_96395 ) ( not ( = ?auto_96394 ?auto_96396 ) ) ( not ( = ?auto_96395 ?auto_96396 ) ) ( not ( = ?auto_96393 ?auto_96396 ) ) ( SURFACE-AT ?auto_96393 ?auto_96400 ) ( CLEAR ?auto_96393 ) ( IS-CRATE ?auto_96394 ) ( AVAILABLE ?auto_96398 ) ( TRUCK-AT ?auto_96399 ?auto_96401 ) ( AVAILABLE ?auto_96402 ) ( SURFACE-AT ?auto_96394 ?auto_96401 ) ( ON ?auto_96394 ?auto_96397 ) ( CLEAR ?auto_96394 ) ( not ( = ?auto_96394 ?auto_96397 ) ) ( not ( = ?auto_96395 ?auto_96397 ) ) ( not ( = ?auto_96393 ?auto_96397 ) ) ( not ( = ?auto_96396 ?auto_96397 ) ) ( ON ?auto_96391 ?auto_96390 ) ( ON ?auto_96392 ?auto_96391 ) ( ON ?auto_96393 ?auto_96392 ) ( not ( = ?auto_96390 ?auto_96391 ) ) ( not ( = ?auto_96390 ?auto_96392 ) ) ( not ( = ?auto_96390 ?auto_96393 ) ) ( not ( = ?auto_96390 ?auto_96394 ) ) ( not ( = ?auto_96390 ?auto_96395 ) ) ( not ( = ?auto_96390 ?auto_96396 ) ) ( not ( = ?auto_96390 ?auto_96397 ) ) ( not ( = ?auto_96391 ?auto_96392 ) ) ( not ( = ?auto_96391 ?auto_96393 ) ) ( not ( = ?auto_96391 ?auto_96394 ) ) ( not ( = ?auto_96391 ?auto_96395 ) ) ( not ( = ?auto_96391 ?auto_96396 ) ) ( not ( = ?auto_96391 ?auto_96397 ) ) ( not ( = ?auto_96392 ?auto_96393 ) ) ( not ( = ?auto_96392 ?auto_96394 ) ) ( not ( = ?auto_96392 ?auto_96395 ) ) ( not ( = ?auto_96392 ?auto_96396 ) ) ( not ( = ?auto_96392 ?auto_96397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96393 ?auto_96394 ?auto_96395 )
      ( MAKE-5CRATE-VERIFY ?auto_96390 ?auto_96391 ?auto_96392 ?auto_96393 ?auto_96394 ?auto_96395 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_96403 - SURFACE
      ?auto_96404 - SURFACE
      ?auto_96405 - SURFACE
      ?auto_96406 - SURFACE
      ?auto_96407 - SURFACE
      ?auto_96408 - SURFACE
      ?auto_96409 - SURFACE
    )
    :vars
    (
      ?auto_96412 - HOIST
      ?auto_96414 - PLACE
      ?auto_96415 - PLACE
      ?auto_96416 - HOIST
      ?auto_96410 - SURFACE
      ?auto_96413 - TRUCK
      ?auto_96411 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96412 ?auto_96414 ) ( IS-CRATE ?auto_96409 ) ( not ( = ?auto_96408 ?auto_96409 ) ) ( not ( = ?auto_96407 ?auto_96408 ) ) ( not ( = ?auto_96407 ?auto_96409 ) ) ( not ( = ?auto_96415 ?auto_96414 ) ) ( HOIST-AT ?auto_96416 ?auto_96415 ) ( not ( = ?auto_96412 ?auto_96416 ) ) ( SURFACE-AT ?auto_96409 ?auto_96415 ) ( ON ?auto_96409 ?auto_96410 ) ( CLEAR ?auto_96409 ) ( not ( = ?auto_96408 ?auto_96410 ) ) ( not ( = ?auto_96409 ?auto_96410 ) ) ( not ( = ?auto_96407 ?auto_96410 ) ) ( SURFACE-AT ?auto_96407 ?auto_96414 ) ( CLEAR ?auto_96407 ) ( IS-CRATE ?auto_96408 ) ( AVAILABLE ?auto_96412 ) ( TRUCK-AT ?auto_96413 ?auto_96415 ) ( AVAILABLE ?auto_96416 ) ( SURFACE-AT ?auto_96408 ?auto_96415 ) ( ON ?auto_96408 ?auto_96411 ) ( CLEAR ?auto_96408 ) ( not ( = ?auto_96408 ?auto_96411 ) ) ( not ( = ?auto_96409 ?auto_96411 ) ) ( not ( = ?auto_96407 ?auto_96411 ) ) ( not ( = ?auto_96410 ?auto_96411 ) ) ( ON ?auto_96404 ?auto_96403 ) ( ON ?auto_96405 ?auto_96404 ) ( ON ?auto_96406 ?auto_96405 ) ( ON ?auto_96407 ?auto_96406 ) ( not ( = ?auto_96403 ?auto_96404 ) ) ( not ( = ?auto_96403 ?auto_96405 ) ) ( not ( = ?auto_96403 ?auto_96406 ) ) ( not ( = ?auto_96403 ?auto_96407 ) ) ( not ( = ?auto_96403 ?auto_96408 ) ) ( not ( = ?auto_96403 ?auto_96409 ) ) ( not ( = ?auto_96403 ?auto_96410 ) ) ( not ( = ?auto_96403 ?auto_96411 ) ) ( not ( = ?auto_96404 ?auto_96405 ) ) ( not ( = ?auto_96404 ?auto_96406 ) ) ( not ( = ?auto_96404 ?auto_96407 ) ) ( not ( = ?auto_96404 ?auto_96408 ) ) ( not ( = ?auto_96404 ?auto_96409 ) ) ( not ( = ?auto_96404 ?auto_96410 ) ) ( not ( = ?auto_96404 ?auto_96411 ) ) ( not ( = ?auto_96405 ?auto_96406 ) ) ( not ( = ?auto_96405 ?auto_96407 ) ) ( not ( = ?auto_96405 ?auto_96408 ) ) ( not ( = ?auto_96405 ?auto_96409 ) ) ( not ( = ?auto_96405 ?auto_96410 ) ) ( not ( = ?auto_96405 ?auto_96411 ) ) ( not ( = ?auto_96406 ?auto_96407 ) ) ( not ( = ?auto_96406 ?auto_96408 ) ) ( not ( = ?auto_96406 ?auto_96409 ) ) ( not ( = ?auto_96406 ?auto_96410 ) ) ( not ( = ?auto_96406 ?auto_96411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96407 ?auto_96408 ?auto_96409 )
      ( MAKE-6CRATE-VERIFY ?auto_96403 ?auto_96404 ?auto_96405 ?auto_96406 ?auto_96407 ?auto_96408 ?auto_96409 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96417 - SURFACE
      ?auto_96418 - SURFACE
      ?auto_96419 - SURFACE
      ?auto_96420 - SURFACE
      ?auto_96421 - SURFACE
      ?auto_96422 - SURFACE
      ?auto_96423 - SURFACE
      ?auto_96424 - SURFACE
    )
    :vars
    (
      ?auto_96427 - HOIST
      ?auto_96429 - PLACE
      ?auto_96430 - PLACE
      ?auto_96431 - HOIST
      ?auto_96425 - SURFACE
      ?auto_96428 - TRUCK
      ?auto_96426 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96427 ?auto_96429 ) ( IS-CRATE ?auto_96424 ) ( not ( = ?auto_96423 ?auto_96424 ) ) ( not ( = ?auto_96422 ?auto_96423 ) ) ( not ( = ?auto_96422 ?auto_96424 ) ) ( not ( = ?auto_96430 ?auto_96429 ) ) ( HOIST-AT ?auto_96431 ?auto_96430 ) ( not ( = ?auto_96427 ?auto_96431 ) ) ( SURFACE-AT ?auto_96424 ?auto_96430 ) ( ON ?auto_96424 ?auto_96425 ) ( CLEAR ?auto_96424 ) ( not ( = ?auto_96423 ?auto_96425 ) ) ( not ( = ?auto_96424 ?auto_96425 ) ) ( not ( = ?auto_96422 ?auto_96425 ) ) ( SURFACE-AT ?auto_96422 ?auto_96429 ) ( CLEAR ?auto_96422 ) ( IS-CRATE ?auto_96423 ) ( AVAILABLE ?auto_96427 ) ( TRUCK-AT ?auto_96428 ?auto_96430 ) ( AVAILABLE ?auto_96431 ) ( SURFACE-AT ?auto_96423 ?auto_96430 ) ( ON ?auto_96423 ?auto_96426 ) ( CLEAR ?auto_96423 ) ( not ( = ?auto_96423 ?auto_96426 ) ) ( not ( = ?auto_96424 ?auto_96426 ) ) ( not ( = ?auto_96422 ?auto_96426 ) ) ( not ( = ?auto_96425 ?auto_96426 ) ) ( ON ?auto_96418 ?auto_96417 ) ( ON ?auto_96419 ?auto_96418 ) ( ON ?auto_96420 ?auto_96419 ) ( ON ?auto_96421 ?auto_96420 ) ( ON ?auto_96422 ?auto_96421 ) ( not ( = ?auto_96417 ?auto_96418 ) ) ( not ( = ?auto_96417 ?auto_96419 ) ) ( not ( = ?auto_96417 ?auto_96420 ) ) ( not ( = ?auto_96417 ?auto_96421 ) ) ( not ( = ?auto_96417 ?auto_96422 ) ) ( not ( = ?auto_96417 ?auto_96423 ) ) ( not ( = ?auto_96417 ?auto_96424 ) ) ( not ( = ?auto_96417 ?auto_96425 ) ) ( not ( = ?auto_96417 ?auto_96426 ) ) ( not ( = ?auto_96418 ?auto_96419 ) ) ( not ( = ?auto_96418 ?auto_96420 ) ) ( not ( = ?auto_96418 ?auto_96421 ) ) ( not ( = ?auto_96418 ?auto_96422 ) ) ( not ( = ?auto_96418 ?auto_96423 ) ) ( not ( = ?auto_96418 ?auto_96424 ) ) ( not ( = ?auto_96418 ?auto_96425 ) ) ( not ( = ?auto_96418 ?auto_96426 ) ) ( not ( = ?auto_96419 ?auto_96420 ) ) ( not ( = ?auto_96419 ?auto_96421 ) ) ( not ( = ?auto_96419 ?auto_96422 ) ) ( not ( = ?auto_96419 ?auto_96423 ) ) ( not ( = ?auto_96419 ?auto_96424 ) ) ( not ( = ?auto_96419 ?auto_96425 ) ) ( not ( = ?auto_96419 ?auto_96426 ) ) ( not ( = ?auto_96420 ?auto_96421 ) ) ( not ( = ?auto_96420 ?auto_96422 ) ) ( not ( = ?auto_96420 ?auto_96423 ) ) ( not ( = ?auto_96420 ?auto_96424 ) ) ( not ( = ?auto_96420 ?auto_96425 ) ) ( not ( = ?auto_96420 ?auto_96426 ) ) ( not ( = ?auto_96421 ?auto_96422 ) ) ( not ( = ?auto_96421 ?auto_96423 ) ) ( not ( = ?auto_96421 ?auto_96424 ) ) ( not ( = ?auto_96421 ?auto_96425 ) ) ( not ( = ?auto_96421 ?auto_96426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96422 ?auto_96423 ?auto_96424 )
      ( MAKE-7CRATE-VERIFY ?auto_96417 ?auto_96418 ?auto_96419 ?auto_96420 ?auto_96421 ?auto_96422 ?auto_96423 ?auto_96424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_96432 - SURFACE
      ?auto_96433 - SURFACE
    )
    :vars
    (
      ?auto_96436 - HOIST
      ?auto_96438 - PLACE
      ?auto_96440 - SURFACE
      ?auto_96439 - PLACE
      ?auto_96441 - HOIST
      ?auto_96434 - SURFACE
      ?auto_96435 - SURFACE
      ?auto_96437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96436 ?auto_96438 ) ( IS-CRATE ?auto_96433 ) ( not ( = ?auto_96432 ?auto_96433 ) ) ( not ( = ?auto_96440 ?auto_96432 ) ) ( not ( = ?auto_96440 ?auto_96433 ) ) ( not ( = ?auto_96439 ?auto_96438 ) ) ( HOIST-AT ?auto_96441 ?auto_96439 ) ( not ( = ?auto_96436 ?auto_96441 ) ) ( SURFACE-AT ?auto_96433 ?auto_96439 ) ( ON ?auto_96433 ?auto_96434 ) ( CLEAR ?auto_96433 ) ( not ( = ?auto_96432 ?auto_96434 ) ) ( not ( = ?auto_96433 ?auto_96434 ) ) ( not ( = ?auto_96440 ?auto_96434 ) ) ( SURFACE-AT ?auto_96440 ?auto_96438 ) ( CLEAR ?auto_96440 ) ( IS-CRATE ?auto_96432 ) ( AVAILABLE ?auto_96436 ) ( AVAILABLE ?auto_96441 ) ( SURFACE-AT ?auto_96432 ?auto_96439 ) ( ON ?auto_96432 ?auto_96435 ) ( CLEAR ?auto_96432 ) ( not ( = ?auto_96432 ?auto_96435 ) ) ( not ( = ?auto_96433 ?auto_96435 ) ) ( not ( = ?auto_96440 ?auto_96435 ) ) ( not ( = ?auto_96434 ?auto_96435 ) ) ( TRUCK-AT ?auto_96437 ?auto_96438 ) )
    :subtasks
    ( ( !DRIVE ?auto_96437 ?auto_96438 ?auto_96439 )
      ( MAKE-2CRATE ?auto_96440 ?auto_96432 ?auto_96433 )
      ( MAKE-1CRATE-VERIFY ?auto_96432 ?auto_96433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_96442 - SURFACE
      ?auto_96443 - SURFACE
      ?auto_96444 - SURFACE
    )
    :vars
    (
      ?auto_96451 - HOIST
      ?auto_96447 - PLACE
      ?auto_96449 - PLACE
      ?auto_96446 - HOIST
      ?auto_96445 - SURFACE
      ?auto_96448 - SURFACE
      ?auto_96450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96451 ?auto_96447 ) ( IS-CRATE ?auto_96444 ) ( not ( = ?auto_96443 ?auto_96444 ) ) ( not ( = ?auto_96442 ?auto_96443 ) ) ( not ( = ?auto_96442 ?auto_96444 ) ) ( not ( = ?auto_96449 ?auto_96447 ) ) ( HOIST-AT ?auto_96446 ?auto_96449 ) ( not ( = ?auto_96451 ?auto_96446 ) ) ( SURFACE-AT ?auto_96444 ?auto_96449 ) ( ON ?auto_96444 ?auto_96445 ) ( CLEAR ?auto_96444 ) ( not ( = ?auto_96443 ?auto_96445 ) ) ( not ( = ?auto_96444 ?auto_96445 ) ) ( not ( = ?auto_96442 ?auto_96445 ) ) ( SURFACE-AT ?auto_96442 ?auto_96447 ) ( CLEAR ?auto_96442 ) ( IS-CRATE ?auto_96443 ) ( AVAILABLE ?auto_96451 ) ( AVAILABLE ?auto_96446 ) ( SURFACE-AT ?auto_96443 ?auto_96449 ) ( ON ?auto_96443 ?auto_96448 ) ( CLEAR ?auto_96443 ) ( not ( = ?auto_96443 ?auto_96448 ) ) ( not ( = ?auto_96444 ?auto_96448 ) ) ( not ( = ?auto_96442 ?auto_96448 ) ) ( not ( = ?auto_96445 ?auto_96448 ) ) ( TRUCK-AT ?auto_96450 ?auto_96447 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_96443 ?auto_96444 )
      ( MAKE-2CRATE-VERIFY ?auto_96442 ?auto_96443 ?auto_96444 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_96452 - SURFACE
      ?auto_96453 - SURFACE
      ?auto_96454 - SURFACE
      ?auto_96455 - SURFACE
    )
    :vars
    (
      ?auto_96460 - HOIST
      ?auto_96457 - PLACE
      ?auto_96458 - PLACE
      ?auto_96456 - HOIST
      ?auto_96462 - SURFACE
      ?auto_96461 - SURFACE
      ?auto_96459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96460 ?auto_96457 ) ( IS-CRATE ?auto_96455 ) ( not ( = ?auto_96454 ?auto_96455 ) ) ( not ( = ?auto_96453 ?auto_96454 ) ) ( not ( = ?auto_96453 ?auto_96455 ) ) ( not ( = ?auto_96458 ?auto_96457 ) ) ( HOIST-AT ?auto_96456 ?auto_96458 ) ( not ( = ?auto_96460 ?auto_96456 ) ) ( SURFACE-AT ?auto_96455 ?auto_96458 ) ( ON ?auto_96455 ?auto_96462 ) ( CLEAR ?auto_96455 ) ( not ( = ?auto_96454 ?auto_96462 ) ) ( not ( = ?auto_96455 ?auto_96462 ) ) ( not ( = ?auto_96453 ?auto_96462 ) ) ( SURFACE-AT ?auto_96453 ?auto_96457 ) ( CLEAR ?auto_96453 ) ( IS-CRATE ?auto_96454 ) ( AVAILABLE ?auto_96460 ) ( AVAILABLE ?auto_96456 ) ( SURFACE-AT ?auto_96454 ?auto_96458 ) ( ON ?auto_96454 ?auto_96461 ) ( CLEAR ?auto_96454 ) ( not ( = ?auto_96454 ?auto_96461 ) ) ( not ( = ?auto_96455 ?auto_96461 ) ) ( not ( = ?auto_96453 ?auto_96461 ) ) ( not ( = ?auto_96462 ?auto_96461 ) ) ( TRUCK-AT ?auto_96459 ?auto_96457 ) ( ON ?auto_96453 ?auto_96452 ) ( not ( = ?auto_96452 ?auto_96453 ) ) ( not ( = ?auto_96452 ?auto_96454 ) ) ( not ( = ?auto_96452 ?auto_96455 ) ) ( not ( = ?auto_96452 ?auto_96462 ) ) ( not ( = ?auto_96452 ?auto_96461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96453 ?auto_96454 ?auto_96455 )
      ( MAKE-3CRATE-VERIFY ?auto_96452 ?auto_96453 ?auto_96454 ?auto_96455 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_96463 - SURFACE
      ?auto_96464 - SURFACE
      ?auto_96465 - SURFACE
      ?auto_96466 - SURFACE
      ?auto_96467 - SURFACE
    )
    :vars
    (
      ?auto_96472 - HOIST
      ?auto_96469 - PLACE
      ?auto_96470 - PLACE
      ?auto_96468 - HOIST
      ?auto_96474 - SURFACE
      ?auto_96473 - SURFACE
      ?auto_96471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96472 ?auto_96469 ) ( IS-CRATE ?auto_96467 ) ( not ( = ?auto_96466 ?auto_96467 ) ) ( not ( = ?auto_96465 ?auto_96466 ) ) ( not ( = ?auto_96465 ?auto_96467 ) ) ( not ( = ?auto_96470 ?auto_96469 ) ) ( HOIST-AT ?auto_96468 ?auto_96470 ) ( not ( = ?auto_96472 ?auto_96468 ) ) ( SURFACE-AT ?auto_96467 ?auto_96470 ) ( ON ?auto_96467 ?auto_96474 ) ( CLEAR ?auto_96467 ) ( not ( = ?auto_96466 ?auto_96474 ) ) ( not ( = ?auto_96467 ?auto_96474 ) ) ( not ( = ?auto_96465 ?auto_96474 ) ) ( SURFACE-AT ?auto_96465 ?auto_96469 ) ( CLEAR ?auto_96465 ) ( IS-CRATE ?auto_96466 ) ( AVAILABLE ?auto_96472 ) ( AVAILABLE ?auto_96468 ) ( SURFACE-AT ?auto_96466 ?auto_96470 ) ( ON ?auto_96466 ?auto_96473 ) ( CLEAR ?auto_96466 ) ( not ( = ?auto_96466 ?auto_96473 ) ) ( not ( = ?auto_96467 ?auto_96473 ) ) ( not ( = ?auto_96465 ?auto_96473 ) ) ( not ( = ?auto_96474 ?auto_96473 ) ) ( TRUCK-AT ?auto_96471 ?auto_96469 ) ( ON ?auto_96464 ?auto_96463 ) ( ON ?auto_96465 ?auto_96464 ) ( not ( = ?auto_96463 ?auto_96464 ) ) ( not ( = ?auto_96463 ?auto_96465 ) ) ( not ( = ?auto_96463 ?auto_96466 ) ) ( not ( = ?auto_96463 ?auto_96467 ) ) ( not ( = ?auto_96463 ?auto_96474 ) ) ( not ( = ?auto_96463 ?auto_96473 ) ) ( not ( = ?auto_96464 ?auto_96465 ) ) ( not ( = ?auto_96464 ?auto_96466 ) ) ( not ( = ?auto_96464 ?auto_96467 ) ) ( not ( = ?auto_96464 ?auto_96474 ) ) ( not ( = ?auto_96464 ?auto_96473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96465 ?auto_96466 ?auto_96467 )
      ( MAKE-4CRATE-VERIFY ?auto_96463 ?auto_96464 ?auto_96465 ?auto_96466 ?auto_96467 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_96475 - SURFACE
      ?auto_96476 - SURFACE
      ?auto_96477 - SURFACE
      ?auto_96478 - SURFACE
      ?auto_96479 - SURFACE
      ?auto_96480 - SURFACE
    )
    :vars
    (
      ?auto_96485 - HOIST
      ?auto_96482 - PLACE
      ?auto_96483 - PLACE
      ?auto_96481 - HOIST
      ?auto_96487 - SURFACE
      ?auto_96486 - SURFACE
      ?auto_96484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96485 ?auto_96482 ) ( IS-CRATE ?auto_96480 ) ( not ( = ?auto_96479 ?auto_96480 ) ) ( not ( = ?auto_96478 ?auto_96479 ) ) ( not ( = ?auto_96478 ?auto_96480 ) ) ( not ( = ?auto_96483 ?auto_96482 ) ) ( HOIST-AT ?auto_96481 ?auto_96483 ) ( not ( = ?auto_96485 ?auto_96481 ) ) ( SURFACE-AT ?auto_96480 ?auto_96483 ) ( ON ?auto_96480 ?auto_96487 ) ( CLEAR ?auto_96480 ) ( not ( = ?auto_96479 ?auto_96487 ) ) ( not ( = ?auto_96480 ?auto_96487 ) ) ( not ( = ?auto_96478 ?auto_96487 ) ) ( SURFACE-AT ?auto_96478 ?auto_96482 ) ( CLEAR ?auto_96478 ) ( IS-CRATE ?auto_96479 ) ( AVAILABLE ?auto_96485 ) ( AVAILABLE ?auto_96481 ) ( SURFACE-AT ?auto_96479 ?auto_96483 ) ( ON ?auto_96479 ?auto_96486 ) ( CLEAR ?auto_96479 ) ( not ( = ?auto_96479 ?auto_96486 ) ) ( not ( = ?auto_96480 ?auto_96486 ) ) ( not ( = ?auto_96478 ?auto_96486 ) ) ( not ( = ?auto_96487 ?auto_96486 ) ) ( TRUCK-AT ?auto_96484 ?auto_96482 ) ( ON ?auto_96476 ?auto_96475 ) ( ON ?auto_96477 ?auto_96476 ) ( ON ?auto_96478 ?auto_96477 ) ( not ( = ?auto_96475 ?auto_96476 ) ) ( not ( = ?auto_96475 ?auto_96477 ) ) ( not ( = ?auto_96475 ?auto_96478 ) ) ( not ( = ?auto_96475 ?auto_96479 ) ) ( not ( = ?auto_96475 ?auto_96480 ) ) ( not ( = ?auto_96475 ?auto_96487 ) ) ( not ( = ?auto_96475 ?auto_96486 ) ) ( not ( = ?auto_96476 ?auto_96477 ) ) ( not ( = ?auto_96476 ?auto_96478 ) ) ( not ( = ?auto_96476 ?auto_96479 ) ) ( not ( = ?auto_96476 ?auto_96480 ) ) ( not ( = ?auto_96476 ?auto_96487 ) ) ( not ( = ?auto_96476 ?auto_96486 ) ) ( not ( = ?auto_96477 ?auto_96478 ) ) ( not ( = ?auto_96477 ?auto_96479 ) ) ( not ( = ?auto_96477 ?auto_96480 ) ) ( not ( = ?auto_96477 ?auto_96487 ) ) ( not ( = ?auto_96477 ?auto_96486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96478 ?auto_96479 ?auto_96480 )
      ( MAKE-5CRATE-VERIFY ?auto_96475 ?auto_96476 ?auto_96477 ?auto_96478 ?auto_96479 ?auto_96480 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_96488 - SURFACE
      ?auto_96489 - SURFACE
      ?auto_96490 - SURFACE
      ?auto_96491 - SURFACE
      ?auto_96492 - SURFACE
      ?auto_96493 - SURFACE
      ?auto_96494 - SURFACE
    )
    :vars
    (
      ?auto_96499 - HOIST
      ?auto_96496 - PLACE
      ?auto_96497 - PLACE
      ?auto_96495 - HOIST
      ?auto_96501 - SURFACE
      ?auto_96500 - SURFACE
      ?auto_96498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96499 ?auto_96496 ) ( IS-CRATE ?auto_96494 ) ( not ( = ?auto_96493 ?auto_96494 ) ) ( not ( = ?auto_96492 ?auto_96493 ) ) ( not ( = ?auto_96492 ?auto_96494 ) ) ( not ( = ?auto_96497 ?auto_96496 ) ) ( HOIST-AT ?auto_96495 ?auto_96497 ) ( not ( = ?auto_96499 ?auto_96495 ) ) ( SURFACE-AT ?auto_96494 ?auto_96497 ) ( ON ?auto_96494 ?auto_96501 ) ( CLEAR ?auto_96494 ) ( not ( = ?auto_96493 ?auto_96501 ) ) ( not ( = ?auto_96494 ?auto_96501 ) ) ( not ( = ?auto_96492 ?auto_96501 ) ) ( SURFACE-AT ?auto_96492 ?auto_96496 ) ( CLEAR ?auto_96492 ) ( IS-CRATE ?auto_96493 ) ( AVAILABLE ?auto_96499 ) ( AVAILABLE ?auto_96495 ) ( SURFACE-AT ?auto_96493 ?auto_96497 ) ( ON ?auto_96493 ?auto_96500 ) ( CLEAR ?auto_96493 ) ( not ( = ?auto_96493 ?auto_96500 ) ) ( not ( = ?auto_96494 ?auto_96500 ) ) ( not ( = ?auto_96492 ?auto_96500 ) ) ( not ( = ?auto_96501 ?auto_96500 ) ) ( TRUCK-AT ?auto_96498 ?auto_96496 ) ( ON ?auto_96489 ?auto_96488 ) ( ON ?auto_96490 ?auto_96489 ) ( ON ?auto_96491 ?auto_96490 ) ( ON ?auto_96492 ?auto_96491 ) ( not ( = ?auto_96488 ?auto_96489 ) ) ( not ( = ?auto_96488 ?auto_96490 ) ) ( not ( = ?auto_96488 ?auto_96491 ) ) ( not ( = ?auto_96488 ?auto_96492 ) ) ( not ( = ?auto_96488 ?auto_96493 ) ) ( not ( = ?auto_96488 ?auto_96494 ) ) ( not ( = ?auto_96488 ?auto_96501 ) ) ( not ( = ?auto_96488 ?auto_96500 ) ) ( not ( = ?auto_96489 ?auto_96490 ) ) ( not ( = ?auto_96489 ?auto_96491 ) ) ( not ( = ?auto_96489 ?auto_96492 ) ) ( not ( = ?auto_96489 ?auto_96493 ) ) ( not ( = ?auto_96489 ?auto_96494 ) ) ( not ( = ?auto_96489 ?auto_96501 ) ) ( not ( = ?auto_96489 ?auto_96500 ) ) ( not ( = ?auto_96490 ?auto_96491 ) ) ( not ( = ?auto_96490 ?auto_96492 ) ) ( not ( = ?auto_96490 ?auto_96493 ) ) ( not ( = ?auto_96490 ?auto_96494 ) ) ( not ( = ?auto_96490 ?auto_96501 ) ) ( not ( = ?auto_96490 ?auto_96500 ) ) ( not ( = ?auto_96491 ?auto_96492 ) ) ( not ( = ?auto_96491 ?auto_96493 ) ) ( not ( = ?auto_96491 ?auto_96494 ) ) ( not ( = ?auto_96491 ?auto_96501 ) ) ( not ( = ?auto_96491 ?auto_96500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96492 ?auto_96493 ?auto_96494 )
      ( MAKE-6CRATE-VERIFY ?auto_96488 ?auto_96489 ?auto_96490 ?auto_96491 ?auto_96492 ?auto_96493 ?auto_96494 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96502 - SURFACE
      ?auto_96503 - SURFACE
      ?auto_96504 - SURFACE
      ?auto_96505 - SURFACE
      ?auto_96506 - SURFACE
      ?auto_96507 - SURFACE
      ?auto_96508 - SURFACE
      ?auto_96509 - SURFACE
    )
    :vars
    (
      ?auto_96514 - HOIST
      ?auto_96511 - PLACE
      ?auto_96512 - PLACE
      ?auto_96510 - HOIST
      ?auto_96516 - SURFACE
      ?auto_96515 - SURFACE
      ?auto_96513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96514 ?auto_96511 ) ( IS-CRATE ?auto_96509 ) ( not ( = ?auto_96508 ?auto_96509 ) ) ( not ( = ?auto_96507 ?auto_96508 ) ) ( not ( = ?auto_96507 ?auto_96509 ) ) ( not ( = ?auto_96512 ?auto_96511 ) ) ( HOIST-AT ?auto_96510 ?auto_96512 ) ( not ( = ?auto_96514 ?auto_96510 ) ) ( SURFACE-AT ?auto_96509 ?auto_96512 ) ( ON ?auto_96509 ?auto_96516 ) ( CLEAR ?auto_96509 ) ( not ( = ?auto_96508 ?auto_96516 ) ) ( not ( = ?auto_96509 ?auto_96516 ) ) ( not ( = ?auto_96507 ?auto_96516 ) ) ( SURFACE-AT ?auto_96507 ?auto_96511 ) ( CLEAR ?auto_96507 ) ( IS-CRATE ?auto_96508 ) ( AVAILABLE ?auto_96514 ) ( AVAILABLE ?auto_96510 ) ( SURFACE-AT ?auto_96508 ?auto_96512 ) ( ON ?auto_96508 ?auto_96515 ) ( CLEAR ?auto_96508 ) ( not ( = ?auto_96508 ?auto_96515 ) ) ( not ( = ?auto_96509 ?auto_96515 ) ) ( not ( = ?auto_96507 ?auto_96515 ) ) ( not ( = ?auto_96516 ?auto_96515 ) ) ( TRUCK-AT ?auto_96513 ?auto_96511 ) ( ON ?auto_96503 ?auto_96502 ) ( ON ?auto_96504 ?auto_96503 ) ( ON ?auto_96505 ?auto_96504 ) ( ON ?auto_96506 ?auto_96505 ) ( ON ?auto_96507 ?auto_96506 ) ( not ( = ?auto_96502 ?auto_96503 ) ) ( not ( = ?auto_96502 ?auto_96504 ) ) ( not ( = ?auto_96502 ?auto_96505 ) ) ( not ( = ?auto_96502 ?auto_96506 ) ) ( not ( = ?auto_96502 ?auto_96507 ) ) ( not ( = ?auto_96502 ?auto_96508 ) ) ( not ( = ?auto_96502 ?auto_96509 ) ) ( not ( = ?auto_96502 ?auto_96516 ) ) ( not ( = ?auto_96502 ?auto_96515 ) ) ( not ( = ?auto_96503 ?auto_96504 ) ) ( not ( = ?auto_96503 ?auto_96505 ) ) ( not ( = ?auto_96503 ?auto_96506 ) ) ( not ( = ?auto_96503 ?auto_96507 ) ) ( not ( = ?auto_96503 ?auto_96508 ) ) ( not ( = ?auto_96503 ?auto_96509 ) ) ( not ( = ?auto_96503 ?auto_96516 ) ) ( not ( = ?auto_96503 ?auto_96515 ) ) ( not ( = ?auto_96504 ?auto_96505 ) ) ( not ( = ?auto_96504 ?auto_96506 ) ) ( not ( = ?auto_96504 ?auto_96507 ) ) ( not ( = ?auto_96504 ?auto_96508 ) ) ( not ( = ?auto_96504 ?auto_96509 ) ) ( not ( = ?auto_96504 ?auto_96516 ) ) ( not ( = ?auto_96504 ?auto_96515 ) ) ( not ( = ?auto_96505 ?auto_96506 ) ) ( not ( = ?auto_96505 ?auto_96507 ) ) ( not ( = ?auto_96505 ?auto_96508 ) ) ( not ( = ?auto_96505 ?auto_96509 ) ) ( not ( = ?auto_96505 ?auto_96516 ) ) ( not ( = ?auto_96505 ?auto_96515 ) ) ( not ( = ?auto_96506 ?auto_96507 ) ) ( not ( = ?auto_96506 ?auto_96508 ) ) ( not ( = ?auto_96506 ?auto_96509 ) ) ( not ( = ?auto_96506 ?auto_96516 ) ) ( not ( = ?auto_96506 ?auto_96515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96507 ?auto_96508 ?auto_96509 )
      ( MAKE-7CRATE-VERIFY ?auto_96502 ?auto_96503 ?auto_96504 ?auto_96505 ?auto_96506 ?auto_96507 ?auto_96508 ?auto_96509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_96517 - SURFACE
      ?auto_96518 - SURFACE
    )
    :vars
    (
      ?auto_96524 - HOIST
      ?auto_96521 - PLACE
      ?auto_96519 - SURFACE
      ?auto_96522 - PLACE
      ?auto_96520 - HOIST
      ?auto_96526 - SURFACE
      ?auto_96525 - SURFACE
      ?auto_96523 - TRUCK
      ?auto_96527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96524 ?auto_96521 ) ( IS-CRATE ?auto_96518 ) ( not ( = ?auto_96517 ?auto_96518 ) ) ( not ( = ?auto_96519 ?auto_96517 ) ) ( not ( = ?auto_96519 ?auto_96518 ) ) ( not ( = ?auto_96522 ?auto_96521 ) ) ( HOIST-AT ?auto_96520 ?auto_96522 ) ( not ( = ?auto_96524 ?auto_96520 ) ) ( SURFACE-AT ?auto_96518 ?auto_96522 ) ( ON ?auto_96518 ?auto_96526 ) ( CLEAR ?auto_96518 ) ( not ( = ?auto_96517 ?auto_96526 ) ) ( not ( = ?auto_96518 ?auto_96526 ) ) ( not ( = ?auto_96519 ?auto_96526 ) ) ( IS-CRATE ?auto_96517 ) ( AVAILABLE ?auto_96520 ) ( SURFACE-AT ?auto_96517 ?auto_96522 ) ( ON ?auto_96517 ?auto_96525 ) ( CLEAR ?auto_96517 ) ( not ( = ?auto_96517 ?auto_96525 ) ) ( not ( = ?auto_96518 ?auto_96525 ) ) ( not ( = ?auto_96519 ?auto_96525 ) ) ( not ( = ?auto_96526 ?auto_96525 ) ) ( TRUCK-AT ?auto_96523 ?auto_96521 ) ( SURFACE-AT ?auto_96527 ?auto_96521 ) ( CLEAR ?auto_96527 ) ( LIFTING ?auto_96524 ?auto_96519 ) ( IS-CRATE ?auto_96519 ) ( not ( = ?auto_96527 ?auto_96519 ) ) ( not ( = ?auto_96517 ?auto_96527 ) ) ( not ( = ?auto_96518 ?auto_96527 ) ) ( not ( = ?auto_96526 ?auto_96527 ) ) ( not ( = ?auto_96525 ?auto_96527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_96527 ?auto_96519 )
      ( MAKE-2CRATE ?auto_96519 ?auto_96517 ?auto_96518 )
      ( MAKE-1CRATE-VERIFY ?auto_96517 ?auto_96518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_96528 - SURFACE
      ?auto_96529 - SURFACE
      ?auto_96530 - SURFACE
    )
    :vars
    (
      ?auto_96537 - HOIST
      ?auto_96533 - PLACE
      ?auto_96532 - PLACE
      ?auto_96531 - HOIST
      ?auto_96536 - SURFACE
      ?auto_96538 - SURFACE
      ?auto_96534 - TRUCK
      ?auto_96535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_96537 ?auto_96533 ) ( IS-CRATE ?auto_96530 ) ( not ( = ?auto_96529 ?auto_96530 ) ) ( not ( = ?auto_96528 ?auto_96529 ) ) ( not ( = ?auto_96528 ?auto_96530 ) ) ( not ( = ?auto_96532 ?auto_96533 ) ) ( HOIST-AT ?auto_96531 ?auto_96532 ) ( not ( = ?auto_96537 ?auto_96531 ) ) ( SURFACE-AT ?auto_96530 ?auto_96532 ) ( ON ?auto_96530 ?auto_96536 ) ( CLEAR ?auto_96530 ) ( not ( = ?auto_96529 ?auto_96536 ) ) ( not ( = ?auto_96530 ?auto_96536 ) ) ( not ( = ?auto_96528 ?auto_96536 ) ) ( IS-CRATE ?auto_96529 ) ( AVAILABLE ?auto_96531 ) ( SURFACE-AT ?auto_96529 ?auto_96532 ) ( ON ?auto_96529 ?auto_96538 ) ( CLEAR ?auto_96529 ) ( not ( = ?auto_96529 ?auto_96538 ) ) ( not ( = ?auto_96530 ?auto_96538 ) ) ( not ( = ?auto_96528 ?auto_96538 ) ) ( not ( = ?auto_96536 ?auto_96538 ) ) ( TRUCK-AT ?auto_96534 ?auto_96533 ) ( SURFACE-AT ?auto_96535 ?auto_96533 ) ( CLEAR ?auto_96535 ) ( LIFTING ?auto_96537 ?auto_96528 ) ( IS-CRATE ?auto_96528 ) ( not ( = ?auto_96535 ?auto_96528 ) ) ( not ( = ?auto_96529 ?auto_96535 ) ) ( not ( = ?auto_96530 ?auto_96535 ) ) ( not ( = ?auto_96536 ?auto_96535 ) ) ( not ( = ?auto_96538 ?auto_96535 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_96529 ?auto_96530 )
      ( MAKE-2CRATE-VERIFY ?auto_96528 ?auto_96529 ?auto_96530 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_96539 - SURFACE
      ?auto_96540 - SURFACE
      ?auto_96541 - SURFACE
      ?auto_96542 - SURFACE
    )
    :vars
    (
      ?auto_96547 - HOIST
      ?auto_96544 - PLACE
      ?auto_96549 - PLACE
      ?auto_96548 - HOIST
      ?auto_96546 - SURFACE
      ?auto_96543 - SURFACE
      ?auto_96545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96547 ?auto_96544 ) ( IS-CRATE ?auto_96542 ) ( not ( = ?auto_96541 ?auto_96542 ) ) ( not ( = ?auto_96540 ?auto_96541 ) ) ( not ( = ?auto_96540 ?auto_96542 ) ) ( not ( = ?auto_96549 ?auto_96544 ) ) ( HOIST-AT ?auto_96548 ?auto_96549 ) ( not ( = ?auto_96547 ?auto_96548 ) ) ( SURFACE-AT ?auto_96542 ?auto_96549 ) ( ON ?auto_96542 ?auto_96546 ) ( CLEAR ?auto_96542 ) ( not ( = ?auto_96541 ?auto_96546 ) ) ( not ( = ?auto_96542 ?auto_96546 ) ) ( not ( = ?auto_96540 ?auto_96546 ) ) ( IS-CRATE ?auto_96541 ) ( AVAILABLE ?auto_96548 ) ( SURFACE-AT ?auto_96541 ?auto_96549 ) ( ON ?auto_96541 ?auto_96543 ) ( CLEAR ?auto_96541 ) ( not ( = ?auto_96541 ?auto_96543 ) ) ( not ( = ?auto_96542 ?auto_96543 ) ) ( not ( = ?auto_96540 ?auto_96543 ) ) ( not ( = ?auto_96546 ?auto_96543 ) ) ( TRUCK-AT ?auto_96545 ?auto_96544 ) ( SURFACE-AT ?auto_96539 ?auto_96544 ) ( CLEAR ?auto_96539 ) ( LIFTING ?auto_96547 ?auto_96540 ) ( IS-CRATE ?auto_96540 ) ( not ( = ?auto_96539 ?auto_96540 ) ) ( not ( = ?auto_96541 ?auto_96539 ) ) ( not ( = ?auto_96542 ?auto_96539 ) ) ( not ( = ?auto_96546 ?auto_96539 ) ) ( not ( = ?auto_96543 ?auto_96539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96540 ?auto_96541 ?auto_96542 )
      ( MAKE-3CRATE-VERIFY ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_96550 - SURFACE
      ?auto_96551 - SURFACE
      ?auto_96552 - SURFACE
      ?auto_96553 - SURFACE
      ?auto_96554 - SURFACE
    )
    :vars
    (
      ?auto_96559 - HOIST
      ?auto_96556 - PLACE
      ?auto_96561 - PLACE
      ?auto_96560 - HOIST
      ?auto_96558 - SURFACE
      ?auto_96555 - SURFACE
      ?auto_96557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96559 ?auto_96556 ) ( IS-CRATE ?auto_96554 ) ( not ( = ?auto_96553 ?auto_96554 ) ) ( not ( = ?auto_96552 ?auto_96553 ) ) ( not ( = ?auto_96552 ?auto_96554 ) ) ( not ( = ?auto_96561 ?auto_96556 ) ) ( HOIST-AT ?auto_96560 ?auto_96561 ) ( not ( = ?auto_96559 ?auto_96560 ) ) ( SURFACE-AT ?auto_96554 ?auto_96561 ) ( ON ?auto_96554 ?auto_96558 ) ( CLEAR ?auto_96554 ) ( not ( = ?auto_96553 ?auto_96558 ) ) ( not ( = ?auto_96554 ?auto_96558 ) ) ( not ( = ?auto_96552 ?auto_96558 ) ) ( IS-CRATE ?auto_96553 ) ( AVAILABLE ?auto_96560 ) ( SURFACE-AT ?auto_96553 ?auto_96561 ) ( ON ?auto_96553 ?auto_96555 ) ( CLEAR ?auto_96553 ) ( not ( = ?auto_96553 ?auto_96555 ) ) ( not ( = ?auto_96554 ?auto_96555 ) ) ( not ( = ?auto_96552 ?auto_96555 ) ) ( not ( = ?auto_96558 ?auto_96555 ) ) ( TRUCK-AT ?auto_96557 ?auto_96556 ) ( SURFACE-AT ?auto_96551 ?auto_96556 ) ( CLEAR ?auto_96551 ) ( LIFTING ?auto_96559 ?auto_96552 ) ( IS-CRATE ?auto_96552 ) ( not ( = ?auto_96551 ?auto_96552 ) ) ( not ( = ?auto_96553 ?auto_96551 ) ) ( not ( = ?auto_96554 ?auto_96551 ) ) ( not ( = ?auto_96558 ?auto_96551 ) ) ( not ( = ?auto_96555 ?auto_96551 ) ) ( ON ?auto_96551 ?auto_96550 ) ( not ( = ?auto_96550 ?auto_96551 ) ) ( not ( = ?auto_96550 ?auto_96552 ) ) ( not ( = ?auto_96550 ?auto_96553 ) ) ( not ( = ?auto_96550 ?auto_96554 ) ) ( not ( = ?auto_96550 ?auto_96558 ) ) ( not ( = ?auto_96550 ?auto_96555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96552 ?auto_96553 ?auto_96554 )
      ( MAKE-4CRATE-VERIFY ?auto_96550 ?auto_96551 ?auto_96552 ?auto_96553 ?auto_96554 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_96562 - SURFACE
      ?auto_96563 - SURFACE
      ?auto_96564 - SURFACE
      ?auto_96565 - SURFACE
      ?auto_96566 - SURFACE
      ?auto_96567 - SURFACE
    )
    :vars
    (
      ?auto_96572 - HOIST
      ?auto_96569 - PLACE
      ?auto_96574 - PLACE
      ?auto_96573 - HOIST
      ?auto_96571 - SURFACE
      ?auto_96568 - SURFACE
      ?auto_96570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96572 ?auto_96569 ) ( IS-CRATE ?auto_96567 ) ( not ( = ?auto_96566 ?auto_96567 ) ) ( not ( = ?auto_96565 ?auto_96566 ) ) ( not ( = ?auto_96565 ?auto_96567 ) ) ( not ( = ?auto_96574 ?auto_96569 ) ) ( HOIST-AT ?auto_96573 ?auto_96574 ) ( not ( = ?auto_96572 ?auto_96573 ) ) ( SURFACE-AT ?auto_96567 ?auto_96574 ) ( ON ?auto_96567 ?auto_96571 ) ( CLEAR ?auto_96567 ) ( not ( = ?auto_96566 ?auto_96571 ) ) ( not ( = ?auto_96567 ?auto_96571 ) ) ( not ( = ?auto_96565 ?auto_96571 ) ) ( IS-CRATE ?auto_96566 ) ( AVAILABLE ?auto_96573 ) ( SURFACE-AT ?auto_96566 ?auto_96574 ) ( ON ?auto_96566 ?auto_96568 ) ( CLEAR ?auto_96566 ) ( not ( = ?auto_96566 ?auto_96568 ) ) ( not ( = ?auto_96567 ?auto_96568 ) ) ( not ( = ?auto_96565 ?auto_96568 ) ) ( not ( = ?auto_96571 ?auto_96568 ) ) ( TRUCK-AT ?auto_96570 ?auto_96569 ) ( SURFACE-AT ?auto_96564 ?auto_96569 ) ( CLEAR ?auto_96564 ) ( LIFTING ?auto_96572 ?auto_96565 ) ( IS-CRATE ?auto_96565 ) ( not ( = ?auto_96564 ?auto_96565 ) ) ( not ( = ?auto_96566 ?auto_96564 ) ) ( not ( = ?auto_96567 ?auto_96564 ) ) ( not ( = ?auto_96571 ?auto_96564 ) ) ( not ( = ?auto_96568 ?auto_96564 ) ) ( ON ?auto_96563 ?auto_96562 ) ( ON ?auto_96564 ?auto_96563 ) ( not ( = ?auto_96562 ?auto_96563 ) ) ( not ( = ?auto_96562 ?auto_96564 ) ) ( not ( = ?auto_96562 ?auto_96565 ) ) ( not ( = ?auto_96562 ?auto_96566 ) ) ( not ( = ?auto_96562 ?auto_96567 ) ) ( not ( = ?auto_96562 ?auto_96571 ) ) ( not ( = ?auto_96562 ?auto_96568 ) ) ( not ( = ?auto_96563 ?auto_96564 ) ) ( not ( = ?auto_96563 ?auto_96565 ) ) ( not ( = ?auto_96563 ?auto_96566 ) ) ( not ( = ?auto_96563 ?auto_96567 ) ) ( not ( = ?auto_96563 ?auto_96571 ) ) ( not ( = ?auto_96563 ?auto_96568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96565 ?auto_96566 ?auto_96567 )
      ( MAKE-5CRATE-VERIFY ?auto_96562 ?auto_96563 ?auto_96564 ?auto_96565 ?auto_96566 ?auto_96567 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_96575 - SURFACE
      ?auto_96576 - SURFACE
      ?auto_96577 - SURFACE
      ?auto_96578 - SURFACE
      ?auto_96579 - SURFACE
      ?auto_96580 - SURFACE
      ?auto_96581 - SURFACE
    )
    :vars
    (
      ?auto_96586 - HOIST
      ?auto_96583 - PLACE
      ?auto_96588 - PLACE
      ?auto_96587 - HOIST
      ?auto_96585 - SURFACE
      ?auto_96582 - SURFACE
      ?auto_96584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96586 ?auto_96583 ) ( IS-CRATE ?auto_96581 ) ( not ( = ?auto_96580 ?auto_96581 ) ) ( not ( = ?auto_96579 ?auto_96580 ) ) ( not ( = ?auto_96579 ?auto_96581 ) ) ( not ( = ?auto_96588 ?auto_96583 ) ) ( HOIST-AT ?auto_96587 ?auto_96588 ) ( not ( = ?auto_96586 ?auto_96587 ) ) ( SURFACE-AT ?auto_96581 ?auto_96588 ) ( ON ?auto_96581 ?auto_96585 ) ( CLEAR ?auto_96581 ) ( not ( = ?auto_96580 ?auto_96585 ) ) ( not ( = ?auto_96581 ?auto_96585 ) ) ( not ( = ?auto_96579 ?auto_96585 ) ) ( IS-CRATE ?auto_96580 ) ( AVAILABLE ?auto_96587 ) ( SURFACE-AT ?auto_96580 ?auto_96588 ) ( ON ?auto_96580 ?auto_96582 ) ( CLEAR ?auto_96580 ) ( not ( = ?auto_96580 ?auto_96582 ) ) ( not ( = ?auto_96581 ?auto_96582 ) ) ( not ( = ?auto_96579 ?auto_96582 ) ) ( not ( = ?auto_96585 ?auto_96582 ) ) ( TRUCK-AT ?auto_96584 ?auto_96583 ) ( SURFACE-AT ?auto_96578 ?auto_96583 ) ( CLEAR ?auto_96578 ) ( LIFTING ?auto_96586 ?auto_96579 ) ( IS-CRATE ?auto_96579 ) ( not ( = ?auto_96578 ?auto_96579 ) ) ( not ( = ?auto_96580 ?auto_96578 ) ) ( not ( = ?auto_96581 ?auto_96578 ) ) ( not ( = ?auto_96585 ?auto_96578 ) ) ( not ( = ?auto_96582 ?auto_96578 ) ) ( ON ?auto_96576 ?auto_96575 ) ( ON ?auto_96577 ?auto_96576 ) ( ON ?auto_96578 ?auto_96577 ) ( not ( = ?auto_96575 ?auto_96576 ) ) ( not ( = ?auto_96575 ?auto_96577 ) ) ( not ( = ?auto_96575 ?auto_96578 ) ) ( not ( = ?auto_96575 ?auto_96579 ) ) ( not ( = ?auto_96575 ?auto_96580 ) ) ( not ( = ?auto_96575 ?auto_96581 ) ) ( not ( = ?auto_96575 ?auto_96585 ) ) ( not ( = ?auto_96575 ?auto_96582 ) ) ( not ( = ?auto_96576 ?auto_96577 ) ) ( not ( = ?auto_96576 ?auto_96578 ) ) ( not ( = ?auto_96576 ?auto_96579 ) ) ( not ( = ?auto_96576 ?auto_96580 ) ) ( not ( = ?auto_96576 ?auto_96581 ) ) ( not ( = ?auto_96576 ?auto_96585 ) ) ( not ( = ?auto_96576 ?auto_96582 ) ) ( not ( = ?auto_96577 ?auto_96578 ) ) ( not ( = ?auto_96577 ?auto_96579 ) ) ( not ( = ?auto_96577 ?auto_96580 ) ) ( not ( = ?auto_96577 ?auto_96581 ) ) ( not ( = ?auto_96577 ?auto_96585 ) ) ( not ( = ?auto_96577 ?auto_96582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96579 ?auto_96580 ?auto_96581 )
      ( MAKE-6CRATE-VERIFY ?auto_96575 ?auto_96576 ?auto_96577 ?auto_96578 ?auto_96579 ?auto_96580 ?auto_96581 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96589 - SURFACE
      ?auto_96590 - SURFACE
      ?auto_96591 - SURFACE
      ?auto_96592 - SURFACE
      ?auto_96593 - SURFACE
      ?auto_96594 - SURFACE
      ?auto_96595 - SURFACE
      ?auto_96596 - SURFACE
    )
    :vars
    (
      ?auto_96601 - HOIST
      ?auto_96598 - PLACE
      ?auto_96603 - PLACE
      ?auto_96602 - HOIST
      ?auto_96600 - SURFACE
      ?auto_96597 - SURFACE
      ?auto_96599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96601 ?auto_96598 ) ( IS-CRATE ?auto_96596 ) ( not ( = ?auto_96595 ?auto_96596 ) ) ( not ( = ?auto_96594 ?auto_96595 ) ) ( not ( = ?auto_96594 ?auto_96596 ) ) ( not ( = ?auto_96603 ?auto_96598 ) ) ( HOIST-AT ?auto_96602 ?auto_96603 ) ( not ( = ?auto_96601 ?auto_96602 ) ) ( SURFACE-AT ?auto_96596 ?auto_96603 ) ( ON ?auto_96596 ?auto_96600 ) ( CLEAR ?auto_96596 ) ( not ( = ?auto_96595 ?auto_96600 ) ) ( not ( = ?auto_96596 ?auto_96600 ) ) ( not ( = ?auto_96594 ?auto_96600 ) ) ( IS-CRATE ?auto_96595 ) ( AVAILABLE ?auto_96602 ) ( SURFACE-AT ?auto_96595 ?auto_96603 ) ( ON ?auto_96595 ?auto_96597 ) ( CLEAR ?auto_96595 ) ( not ( = ?auto_96595 ?auto_96597 ) ) ( not ( = ?auto_96596 ?auto_96597 ) ) ( not ( = ?auto_96594 ?auto_96597 ) ) ( not ( = ?auto_96600 ?auto_96597 ) ) ( TRUCK-AT ?auto_96599 ?auto_96598 ) ( SURFACE-AT ?auto_96593 ?auto_96598 ) ( CLEAR ?auto_96593 ) ( LIFTING ?auto_96601 ?auto_96594 ) ( IS-CRATE ?auto_96594 ) ( not ( = ?auto_96593 ?auto_96594 ) ) ( not ( = ?auto_96595 ?auto_96593 ) ) ( not ( = ?auto_96596 ?auto_96593 ) ) ( not ( = ?auto_96600 ?auto_96593 ) ) ( not ( = ?auto_96597 ?auto_96593 ) ) ( ON ?auto_96590 ?auto_96589 ) ( ON ?auto_96591 ?auto_96590 ) ( ON ?auto_96592 ?auto_96591 ) ( ON ?auto_96593 ?auto_96592 ) ( not ( = ?auto_96589 ?auto_96590 ) ) ( not ( = ?auto_96589 ?auto_96591 ) ) ( not ( = ?auto_96589 ?auto_96592 ) ) ( not ( = ?auto_96589 ?auto_96593 ) ) ( not ( = ?auto_96589 ?auto_96594 ) ) ( not ( = ?auto_96589 ?auto_96595 ) ) ( not ( = ?auto_96589 ?auto_96596 ) ) ( not ( = ?auto_96589 ?auto_96600 ) ) ( not ( = ?auto_96589 ?auto_96597 ) ) ( not ( = ?auto_96590 ?auto_96591 ) ) ( not ( = ?auto_96590 ?auto_96592 ) ) ( not ( = ?auto_96590 ?auto_96593 ) ) ( not ( = ?auto_96590 ?auto_96594 ) ) ( not ( = ?auto_96590 ?auto_96595 ) ) ( not ( = ?auto_96590 ?auto_96596 ) ) ( not ( = ?auto_96590 ?auto_96600 ) ) ( not ( = ?auto_96590 ?auto_96597 ) ) ( not ( = ?auto_96591 ?auto_96592 ) ) ( not ( = ?auto_96591 ?auto_96593 ) ) ( not ( = ?auto_96591 ?auto_96594 ) ) ( not ( = ?auto_96591 ?auto_96595 ) ) ( not ( = ?auto_96591 ?auto_96596 ) ) ( not ( = ?auto_96591 ?auto_96600 ) ) ( not ( = ?auto_96591 ?auto_96597 ) ) ( not ( = ?auto_96592 ?auto_96593 ) ) ( not ( = ?auto_96592 ?auto_96594 ) ) ( not ( = ?auto_96592 ?auto_96595 ) ) ( not ( = ?auto_96592 ?auto_96596 ) ) ( not ( = ?auto_96592 ?auto_96600 ) ) ( not ( = ?auto_96592 ?auto_96597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96594 ?auto_96595 ?auto_96596 )
      ( MAKE-7CRATE-VERIFY ?auto_96589 ?auto_96590 ?auto_96591 ?auto_96592 ?auto_96593 ?auto_96594 ?auto_96595 ?auto_96596 ) )
  )

)

