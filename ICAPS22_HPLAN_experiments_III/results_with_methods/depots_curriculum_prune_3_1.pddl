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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_234 - SURFACE
      ?auto_235 - SURFACE
    )
    :vars
    (
      ?auto_236 - HOIST
      ?auto_237 - PLACE
      ?auto_239 - PLACE
      ?auto_240 - HOIST
      ?auto_241 - SURFACE
      ?auto_238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_236 ?auto_237 ) ( SURFACE-AT ?auto_234 ?auto_237 ) ( CLEAR ?auto_234 ) ( IS-CRATE ?auto_235 ) ( AVAILABLE ?auto_236 ) ( not ( = ?auto_239 ?auto_237 ) ) ( HOIST-AT ?auto_240 ?auto_239 ) ( AVAILABLE ?auto_240 ) ( SURFACE-AT ?auto_235 ?auto_239 ) ( ON ?auto_235 ?auto_241 ) ( CLEAR ?auto_235 ) ( TRUCK-AT ?auto_238 ?auto_237 ) ( not ( = ?auto_234 ?auto_235 ) ) ( not ( = ?auto_234 ?auto_241 ) ) ( not ( = ?auto_235 ?auto_241 ) ) ( not ( = ?auto_236 ?auto_240 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_238 ?auto_237 ?auto_239 )
      ( !LIFT ?auto_240 ?auto_235 ?auto_241 ?auto_239 )
      ( !LOAD ?auto_240 ?auto_235 ?auto_238 ?auto_239 )
      ( !DRIVE ?auto_238 ?auto_239 ?auto_237 )
      ( !UNLOAD ?auto_236 ?auto_235 ?auto_238 ?auto_237 )
      ( !DROP ?auto_236 ?auto_235 ?auto_234 ?auto_237 )
      ( MAKE-1CRATE-VERIFY ?auto_234 ?auto_235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_255 - SURFACE
      ?auto_256 - SURFACE
      ?auto_257 - SURFACE
    )
    :vars
    (
      ?auto_260 - HOIST
      ?auto_259 - PLACE
      ?auto_258 - PLACE
      ?auto_262 - HOIST
      ?auto_261 - SURFACE
      ?auto_264 - PLACE
      ?auto_265 - HOIST
      ?auto_266 - SURFACE
      ?auto_263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_260 ?auto_259 ) ( IS-CRATE ?auto_257 ) ( not ( = ?auto_258 ?auto_259 ) ) ( HOIST-AT ?auto_262 ?auto_258 ) ( AVAILABLE ?auto_262 ) ( SURFACE-AT ?auto_257 ?auto_258 ) ( ON ?auto_257 ?auto_261 ) ( CLEAR ?auto_257 ) ( not ( = ?auto_256 ?auto_257 ) ) ( not ( = ?auto_256 ?auto_261 ) ) ( not ( = ?auto_257 ?auto_261 ) ) ( not ( = ?auto_260 ?auto_262 ) ) ( SURFACE-AT ?auto_255 ?auto_259 ) ( CLEAR ?auto_255 ) ( IS-CRATE ?auto_256 ) ( AVAILABLE ?auto_260 ) ( not ( = ?auto_264 ?auto_259 ) ) ( HOIST-AT ?auto_265 ?auto_264 ) ( AVAILABLE ?auto_265 ) ( SURFACE-AT ?auto_256 ?auto_264 ) ( ON ?auto_256 ?auto_266 ) ( CLEAR ?auto_256 ) ( TRUCK-AT ?auto_263 ?auto_259 ) ( not ( = ?auto_255 ?auto_256 ) ) ( not ( = ?auto_255 ?auto_266 ) ) ( not ( = ?auto_256 ?auto_266 ) ) ( not ( = ?auto_260 ?auto_265 ) ) ( not ( = ?auto_255 ?auto_257 ) ) ( not ( = ?auto_255 ?auto_261 ) ) ( not ( = ?auto_257 ?auto_266 ) ) ( not ( = ?auto_258 ?auto_264 ) ) ( not ( = ?auto_262 ?auto_265 ) ) ( not ( = ?auto_261 ?auto_266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_255 ?auto_256 )
      ( MAKE-1CRATE ?auto_256 ?auto_257 )
      ( MAKE-2CRATE-VERIFY ?auto_255 ?auto_256 ?auto_257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_281 - SURFACE
      ?auto_282 - SURFACE
      ?auto_283 - SURFACE
      ?auto_284 - SURFACE
    )
    :vars
    (
      ?auto_287 - HOIST
      ?auto_289 - PLACE
      ?auto_288 - PLACE
      ?auto_285 - HOIST
      ?auto_286 - SURFACE
      ?auto_292 - SURFACE
      ?auto_291 - PLACE
      ?auto_293 - HOIST
      ?auto_294 - SURFACE
      ?auto_290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_287 ?auto_289 ) ( IS-CRATE ?auto_284 ) ( not ( = ?auto_288 ?auto_289 ) ) ( HOIST-AT ?auto_285 ?auto_288 ) ( SURFACE-AT ?auto_284 ?auto_288 ) ( ON ?auto_284 ?auto_286 ) ( CLEAR ?auto_284 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_286 ) ) ( not ( = ?auto_284 ?auto_286 ) ) ( not ( = ?auto_287 ?auto_285 ) ) ( IS-CRATE ?auto_283 ) ( AVAILABLE ?auto_285 ) ( SURFACE-AT ?auto_283 ?auto_288 ) ( ON ?auto_283 ?auto_292 ) ( CLEAR ?auto_283 ) ( not ( = ?auto_282 ?auto_283 ) ) ( not ( = ?auto_282 ?auto_292 ) ) ( not ( = ?auto_283 ?auto_292 ) ) ( SURFACE-AT ?auto_281 ?auto_289 ) ( CLEAR ?auto_281 ) ( IS-CRATE ?auto_282 ) ( AVAILABLE ?auto_287 ) ( not ( = ?auto_291 ?auto_289 ) ) ( HOIST-AT ?auto_293 ?auto_291 ) ( AVAILABLE ?auto_293 ) ( SURFACE-AT ?auto_282 ?auto_291 ) ( ON ?auto_282 ?auto_294 ) ( CLEAR ?auto_282 ) ( TRUCK-AT ?auto_290 ?auto_289 ) ( not ( = ?auto_281 ?auto_282 ) ) ( not ( = ?auto_281 ?auto_294 ) ) ( not ( = ?auto_282 ?auto_294 ) ) ( not ( = ?auto_287 ?auto_293 ) ) ( not ( = ?auto_281 ?auto_283 ) ) ( not ( = ?auto_281 ?auto_292 ) ) ( not ( = ?auto_283 ?auto_294 ) ) ( not ( = ?auto_288 ?auto_291 ) ) ( not ( = ?auto_285 ?auto_293 ) ) ( not ( = ?auto_292 ?auto_294 ) ) ( not ( = ?auto_281 ?auto_284 ) ) ( not ( = ?auto_281 ?auto_286 ) ) ( not ( = ?auto_282 ?auto_284 ) ) ( not ( = ?auto_282 ?auto_286 ) ) ( not ( = ?auto_284 ?auto_292 ) ) ( not ( = ?auto_284 ?auto_294 ) ) ( not ( = ?auto_286 ?auto_292 ) ) ( not ( = ?auto_286 ?auto_294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_281 ?auto_282 ?auto_283 )
      ( MAKE-1CRATE ?auto_283 ?auto_284 )
      ( MAKE-3CRATE-VERIFY ?auto_281 ?auto_282 ?auto_283 ?auto_284 ) )
  )

)

