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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244 - SURFACE
      ?auto_245 - SURFACE
    )
    :vars
    (
      ?auto_246 - HOIST
      ?auto_247 - PLACE
      ?auto_249 - PLACE
      ?auto_250 - HOIST
      ?auto_251 - SURFACE
      ?auto_248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246 ?auto_247 ) ( SURFACE-AT ?auto_244 ?auto_247 ) ( CLEAR ?auto_244 ) ( IS-CRATE ?auto_245 ) ( AVAILABLE ?auto_246 ) ( not ( = ?auto_249 ?auto_247 ) ) ( HOIST-AT ?auto_250 ?auto_249 ) ( AVAILABLE ?auto_250 ) ( SURFACE-AT ?auto_245 ?auto_249 ) ( ON ?auto_245 ?auto_251 ) ( CLEAR ?auto_245 ) ( TRUCK-AT ?auto_248 ?auto_247 ) ( not ( = ?auto_244 ?auto_245 ) ) ( not ( = ?auto_244 ?auto_251 ) ) ( not ( = ?auto_245 ?auto_251 ) ) ( not ( = ?auto_246 ?auto_250 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_248 ?auto_247 ?auto_249 )
      ( !LIFT ?auto_250 ?auto_245 ?auto_251 ?auto_249 )
      ( !LOAD ?auto_250 ?auto_245 ?auto_248 ?auto_249 )
      ( !DRIVE ?auto_248 ?auto_249 ?auto_247 )
      ( !UNLOAD ?auto_246 ?auto_245 ?auto_248 ?auto_247 )
      ( !DROP ?auto_246 ?auto_245 ?auto_244 ?auto_247 )
      ( MAKE-1CRATE-VERIFY ?auto_244 ?auto_245 ) )
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
      ?auto_259 - HOIST
      ?auto_263 - PLACE
      ?auto_262 - PLACE
      ?auto_258 - HOIST
      ?auto_261 - SURFACE
      ?auto_264 - PLACE
      ?auto_265 - HOIST
      ?auto_266 - SURFACE
      ?auto_260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_259 ?auto_263 ) ( IS-CRATE ?auto_257 ) ( not ( = ?auto_262 ?auto_263 ) ) ( HOIST-AT ?auto_258 ?auto_262 ) ( AVAILABLE ?auto_258 ) ( SURFACE-AT ?auto_257 ?auto_262 ) ( ON ?auto_257 ?auto_261 ) ( CLEAR ?auto_257 ) ( not ( = ?auto_256 ?auto_257 ) ) ( not ( = ?auto_256 ?auto_261 ) ) ( not ( = ?auto_257 ?auto_261 ) ) ( not ( = ?auto_259 ?auto_258 ) ) ( SURFACE-AT ?auto_255 ?auto_263 ) ( CLEAR ?auto_255 ) ( IS-CRATE ?auto_256 ) ( AVAILABLE ?auto_259 ) ( not ( = ?auto_264 ?auto_263 ) ) ( HOIST-AT ?auto_265 ?auto_264 ) ( AVAILABLE ?auto_265 ) ( SURFACE-AT ?auto_256 ?auto_264 ) ( ON ?auto_256 ?auto_266 ) ( CLEAR ?auto_256 ) ( TRUCK-AT ?auto_260 ?auto_263 ) ( not ( = ?auto_255 ?auto_256 ) ) ( not ( = ?auto_255 ?auto_266 ) ) ( not ( = ?auto_256 ?auto_266 ) ) ( not ( = ?auto_259 ?auto_265 ) ) ( not ( = ?auto_255 ?auto_257 ) ) ( not ( = ?auto_255 ?auto_261 ) ) ( not ( = ?auto_257 ?auto_266 ) ) ( not ( = ?auto_262 ?auto_264 ) ) ( not ( = ?auto_258 ?auto_265 ) ) ( not ( = ?auto_261 ?auto_266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_255 ?auto_256 )
      ( MAKE-1CRATE ?auto_256 ?auto_257 )
      ( MAKE-2CRATE-VERIFY ?auto_255 ?auto_256 ?auto_257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_269 - SURFACE
      ?auto_270 - SURFACE
    )
    :vars
    (
      ?auto_271 - HOIST
      ?auto_272 - PLACE
      ?auto_274 - PLACE
      ?auto_275 - HOIST
      ?auto_276 - SURFACE
      ?auto_273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_271 ?auto_272 ) ( SURFACE-AT ?auto_269 ?auto_272 ) ( CLEAR ?auto_269 ) ( IS-CRATE ?auto_270 ) ( AVAILABLE ?auto_271 ) ( not ( = ?auto_274 ?auto_272 ) ) ( HOIST-AT ?auto_275 ?auto_274 ) ( AVAILABLE ?auto_275 ) ( SURFACE-AT ?auto_270 ?auto_274 ) ( ON ?auto_270 ?auto_276 ) ( CLEAR ?auto_270 ) ( TRUCK-AT ?auto_273 ?auto_272 ) ( not ( = ?auto_269 ?auto_270 ) ) ( not ( = ?auto_269 ?auto_276 ) ) ( not ( = ?auto_270 ?auto_276 ) ) ( not ( = ?auto_271 ?auto_275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_273 ?auto_272 ?auto_274 )
      ( !LIFT ?auto_275 ?auto_270 ?auto_276 ?auto_274 )
      ( !LOAD ?auto_275 ?auto_270 ?auto_273 ?auto_274 )
      ( !DRIVE ?auto_273 ?auto_274 ?auto_272 )
      ( !UNLOAD ?auto_271 ?auto_270 ?auto_273 ?auto_272 )
      ( !DROP ?auto_271 ?auto_270 ?auto_269 ?auto_272 )
      ( MAKE-1CRATE-VERIFY ?auto_269 ?auto_270 ) )
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
      ?auto_285 - PLACE
      ?auto_289 - PLACE
      ?auto_288 - HOIST
      ?auto_286 - SURFACE
      ?auto_292 - SURFACE
      ?auto_291 - PLACE
      ?auto_293 - HOIST
      ?auto_294 - SURFACE
      ?auto_290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_287 ?auto_285 ) ( IS-CRATE ?auto_284 ) ( not ( = ?auto_289 ?auto_285 ) ) ( HOIST-AT ?auto_288 ?auto_289 ) ( SURFACE-AT ?auto_284 ?auto_289 ) ( ON ?auto_284 ?auto_286 ) ( CLEAR ?auto_284 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_286 ) ) ( not ( = ?auto_284 ?auto_286 ) ) ( not ( = ?auto_287 ?auto_288 ) ) ( IS-CRATE ?auto_283 ) ( AVAILABLE ?auto_288 ) ( SURFACE-AT ?auto_283 ?auto_289 ) ( ON ?auto_283 ?auto_292 ) ( CLEAR ?auto_283 ) ( not ( = ?auto_282 ?auto_283 ) ) ( not ( = ?auto_282 ?auto_292 ) ) ( not ( = ?auto_283 ?auto_292 ) ) ( SURFACE-AT ?auto_281 ?auto_285 ) ( CLEAR ?auto_281 ) ( IS-CRATE ?auto_282 ) ( AVAILABLE ?auto_287 ) ( not ( = ?auto_291 ?auto_285 ) ) ( HOIST-AT ?auto_293 ?auto_291 ) ( AVAILABLE ?auto_293 ) ( SURFACE-AT ?auto_282 ?auto_291 ) ( ON ?auto_282 ?auto_294 ) ( CLEAR ?auto_282 ) ( TRUCK-AT ?auto_290 ?auto_285 ) ( not ( = ?auto_281 ?auto_282 ) ) ( not ( = ?auto_281 ?auto_294 ) ) ( not ( = ?auto_282 ?auto_294 ) ) ( not ( = ?auto_287 ?auto_293 ) ) ( not ( = ?auto_281 ?auto_283 ) ) ( not ( = ?auto_281 ?auto_292 ) ) ( not ( = ?auto_283 ?auto_294 ) ) ( not ( = ?auto_289 ?auto_291 ) ) ( not ( = ?auto_288 ?auto_293 ) ) ( not ( = ?auto_292 ?auto_294 ) ) ( not ( = ?auto_281 ?auto_284 ) ) ( not ( = ?auto_281 ?auto_286 ) ) ( not ( = ?auto_282 ?auto_284 ) ) ( not ( = ?auto_282 ?auto_286 ) ) ( not ( = ?auto_284 ?auto_292 ) ) ( not ( = ?auto_284 ?auto_294 ) ) ( not ( = ?auto_286 ?auto_292 ) ) ( not ( = ?auto_286 ?auto_294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_281 ?auto_282 ?auto_283 )
      ( MAKE-1CRATE ?auto_283 ?auto_284 )
      ( MAKE-3CRATE-VERIFY ?auto_281 ?auto_282 ?auto_283 ?auto_284 ) )
  )

)

