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
      ?auto_226 - SURFACE
      ?auto_227 - SURFACE
    )
    :vars
    (
      ?auto_228 - HOIST
      ?auto_229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228 ?auto_229 ) ( SURFACE-AT ?auto_226 ?auto_229 ) ( CLEAR ?auto_226 ) ( LIFTING ?auto_228 ?auto_227 ) ( IS-CRATE ?auto_227 ) ( not ( = ?auto_226 ?auto_227 ) ) )
    :subtasks
    ( ( !DROP ?auto_228 ?auto_227 ?auto_226 ?auto_229 )
      ( MAKE-1CRATE-VERIFY ?auto_226 ?auto_227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_230 - SURFACE
      ?auto_231 - SURFACE
    )
    :vars
    (
      ?auto_233 - HOIST
      ?auto_232 - PLACE
      ?auto_234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_233 ?auto_232 ) ( SURFACE-AT ?auto_230 ?auto_232 ) ( CLEAR ?auto_230 ) ( IS-CRATE ?auto_231 ) ( not ( = ?auto_230 ?auto_231 ) ) ( TRUCK-AT ?auto_234 ?auto_232 ) ( AVAILABLE ?auto_233 ) ( IN ?auto_231 ?auto_234 ) )
    :subtasks
    ( ( !UNLOAD ?auto_233 ?auto_231 ?auto_234 ?auto_232 )
      ( MAKE-1CRATE ?auto_230 ?auto_231 )
      ( MAKE-1CRATE-VERIFY ?auto_230 ?auto_231 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_235 - SURFACE
      ?auto_236 - SURFACE
    )
    :vars
    (
      ?auto_237 - HOIST
      ?auto_239 - PLACE
      ?auto_238 - TRUCK
      ?auto_240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_237 ?auto_239 ) ( SURFACE-AT ?auto_235 ?auto_239 ) ( CLEAR ?auto_235 ) ( IS-CRATE ?auto_236 ) ( not ( = ?auto_235 ?auto_236 ) ) ( AVAILABLE ?auto_237 ) ( IN ?auto_236 ?auto_238 ) ( TRUCK-AT ?auto_238 ?auto_240 ) ( not ( = ?auto_240 ?auto_239 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_238 ?auto_240 ?auto_239 )
      ( MAKE-1CRATE ?auto_235 ?auto_236 )
      ( MAKE-1CRATE-VERIFY ?auto_235 ?auto_236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_241 - SURFACE
      ?auto_242 - SURFACE
    )
    :vars
    (
      ?auto_244 - HOIST
      ?auto_245 - PLACE
      ?auto_246 - TRUCK
      ?auto_243 - PLACE
      ?auto_247 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_244 ?auto_245 ) ( SURFACE-AT ?auto_241 ?auto_245 ) ( CLEAR ?auto_241 ) ( IS-CRATE ?auto_242 ) ( not ( = ?auto_241 ?auto_242 ) ) ( AVAILABLE ?auto_244 ) ( TRUCK-AT ?auto_246 ?auto_243 ) ( not ( = ?auto_243 ?auto_245 ) ) ( HOIST-AT ?auto_247 ?auto_243 ) ( LIFTING ?auto_247 ?auto_242 ) ( not ( = ?auto_244 ?auto_247 ) ) )
    :subtasks
    ( ( !LOAD ?auto_247 ?auto_242 ?auto_246 ?auto_243 )
      ( MAKE-1CRATE ?auto_241 ?auto_242 )
      ( MAKE-1CRATE-VERIFY ?auto_241 ?auto_242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_248 - SURFACE
      ?auto_249 - SURFACE
    )
    :vars
    (
      ?auto_253 - HOIST
      ?auto_250 - PLACE
      ?auto_254 - TRUCK
      ?auto_251 - PLACE
      ?auto_252 - HOIST
      ?auto_255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253 ?auto_250 ) ( SURFACE-AT ?auto_248 ?auto_250 ) ( CLEAR ?auto_248 ) ( IS-CRATE ?auto_249 ) ( not ( = ?auto_248 ?auto_249 ) ) ( AVAILABLE ?auto_253 ) ( TRUCK-AT ?auto_254 ?auto_251 ) ( not ( = ?auto_251 ?auto_250 ) ) ( HOIST-AT ?auto_252 ?auto_251 ) ( not ( = ?auto_253 ?auto_252 ) ) ( AVAILABLE ?auto_252 ) ( SURFACE-AT ?auto_249 ?auto_251 ) ( ON ?auto_249 ?auto_255 ) ( CLEAR ?auto_249 ) ( not ( = ?auto_248 ?auto_255 ) ) ( not ( = ?auto_249 ?auto_255 ) ) )
    :subtasks
    ( ( !LIFT ?auto_252 ?auto_249 ?auto_255 ?auto_251 )
      ( MAKE-1CRATE ?auto_248 ?auto_249 )
      ( MAKE-1CRATE-VERIFY ?auto_248 ?auto_249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_256 - SURFACE
      ?auto_257 - SURFACE
    )
    :vars
    (
      ?auto_263 - HOIST
      ?auto_261 - PLACE
      ?auto_262 - PLACE
      ?auto_259 - HOIST
      ?auto_260 - SURFACE
      ?auto_258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_263 ?auto_261 ) ( SURFACE-AT ?auto_256 ?auto_261 ) ( CLEAR ?auto_256 ) ( IS-CRATE ?auto_257 ) ( not ( = ?auto_256 ?auto_257 ) ) ( AVAILABLE ?auto_263 ) ( not ( = ?auto_262 ?auto_261 ) ) ( HOIST-AT ?auto_259 ?auto_262 ) ( not ( = ?auto_263 ?auto_259 ) ) ( AVAILABLE ?auto_259 ) ( SURFACE-AT ?auto_257 ?auto_262 ) ( ON ?auto_257 ?auto_260 ) ( CLEAR ?auto_257 ) ( not ( = ?auto_256 ?auto_260 ) ) ( not ( = ?auto_257 ?auto_260 ) ) ( TRUCK-AT ?auto_258 ?auto_261 ) )
    :subtasks
    ( ( !DRIVE ?auto_258 ?auto_261 ?auto_262 )
      ( MAKE-1CRATE ?auto_256 ?auto_257 )
      ( MAKE-1CRATE-VERIFY ?auto_256 ?auto_257 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_273 - SURFACE
      ?auto_274 - SURFACE
      ?auto_275 - SURFACE
    )
    :vars
    (
      ?auto_276 - HOIST
      ?auto_277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_276 ?auto_277 ) ( SURFACE-AT ?auto_274 ?auto_277 ) ( CLEAR ?auto_274 ) ( LIFTING ?auto_276 ?auto_275 ) ( IS-CRATE ?auto_275 ) ( not ( = ?auto_274 ?auto_275 ) ) ( ON ?auto_274 ?auto_273 ) ( not ( = ?auto_273 ?auto_274 ) ) ( not ( = ?auto_273 ?auto_275 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_274 ?auto_275 )
      ( MAKE-2CRATE-VERIFY ?auto_273 ?auto_274 ?auto_275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_283 - SURFACE
      ?auto_284 - SURFACE
      ?auto_285 - SURFACE
    )
    :vars
    (
      ?auto_287 - HOIST
      ?auto_286 - PLACE
      ?auto_288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_287 ?auto_286 ) ( SURFACE-AT ?auto_284 ?auto_286 ) ( CLEAR ?auto_284 ) ( IS-CRATE ?auto_285 ) ( not ( = ?auto_284 ?auto_285 ) ) ( TRUCK-AT ?auto_288 ?auto_286 ) ( AVAILABLE ?auto_287 ) ( IN ?auto_285 ?auto_288 ) ( ON ?auto_284 ?auto_283 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_285 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_284 ?auto_285 )
      ( MAKE-2CRATE-VERIFY ?auto_283 ?auto_284 ?auto_285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_289 - SURFACE
      ?auto_290 - SURFACE
    )
    :vars
    (
      ?auto_293 - HOIST
      ?auto_291 - PLACE
      ?auto_292 - TRUCK
      ?auto_294 - SURFACE
      ?auto_295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_293 ?auto_291 ) ( SURFACE-AT ?auto_289 ?auto_291 ) ( CLEAR ?auto_289 ) ( IS-CRATE ?auto_290 ) ( not ( = ?auto_289 ?auto_290 ) ) ( AVAILABLE ?auto_293 ) ( IN ?auto_290 ?auto_292 ) ( ON ?auto_289 ?auto_294 ) ( not ( = ?auto_294 ?auto_289 ) ) ( not ( = ?auto_294 ?auto_290 ) ) ( TRUCK-AT ?auto_292 ?auto_295 ) ( not ( = ?auto_295 ?auto_291 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_292 ?auto_295 ?auto_291 )
      ( MAKE-2CRATE ?auto_294 ?auto_289 ?auto_290 )
      ( MAKE-1CRATE-VERIFY ?auto_289 ?auto_290 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_296 - SURFACE
      ?auto_297 - SURFACE
      ?auto_298 - SURFACE
    )
    :vars
    (
      ?auto_302 - HOIST
      ?auto_301 - PLACE
      ?auto_299 - TRUCK
      ?auto_300 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_302 ?auto_301 ) ( SURFACE-AT ?auto_297 ?auto_301 ) ( CLEAR ?auto_297 ) ( IS-CRATE ?auto_298 ) ( not ( = ?auto_297 ?auto_298 ) ) ( AVAILABLE ?auto_302 ) ( IN ?auto_298 ?auto_299 ) ( ON ?auto_297 ?auto_296 ) ( not ( = ?auto_296 ?auto_297 ) ) ( not ( = ?auto_296 ?auto_298 ) ) ( TRUCK-AT ?auto_299 ?auto_300 ) ( not ( = ?auto_300 ?auto_301 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_297 ?auto_298 )
      ( MAKE-2CRATE-VERIFY ?auto_296 ?auto_297 ?auto_298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_303 - SURFACE
      ?auto_304 - SURFACE
    )
    :vars
    (
      ?auto_308 - HOIST
      ?auto_307 - PLACE
      ?auto_305 - SURFACE
      ?auto_309 - TRUCK
      ?auto_306 - PLACE
      ?auto_310 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_308 ?auto_307 ) ( SURFACE-AT ?auto_303 ?auto_307 ) ( CLEAR ?auto_303 ) ( IS-CRATE ?auto_304 ) ( not ( = ?auto_303 ?auto_304 ) ) ( AVAILABLE ?auto_308 ) ( ON ?auto_303 ?auto_305 ) ( not ( = ?auto_305 ?auto_303 ) ) ( not ( = ?auto_305 ?auto_304 ) ) ( TRUCK-AT ?auto_309 ?auto_306 ) ( not ( = ?auto_306 ?auto_307 ) ) ( HOIST-AT ?auto_310 ?auto_306 ) ( LIFTING ?auto_310 ?auto_304 ) ( not ( = ?auto_308 ?auto_310 ) ) )
    :subtasks
    ( ( !LOAD ?auto_310 ?auto_304 ?auto_309 ?auto_306 )
      ( MAKE-2CRATE ?auto_305 ?auto_303 ?auto_304 )
      ( MAKE-1CRATE-VERIFY ?auto_303 ?auto_304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_311 - SURFACE
      ?auto_312 - SURFACE
      ?auto_313 - SURFACE
    )
    :vars
    (
      ?auto_317 - HOIST
      ?auto_314 - PLACE
      ?auto_316 - TRUCK
      ?auto_315 - PLACE
      ?auto_318 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_317 ?auto_314 ) ( SURFACE-AT ?auto_312 ?auto_314 ) ( CLEAR ?auto_312 ) ( IS-CRATE ?auto_313 ) ( not ( = ?auto_312 ?auto_313 ) ) ( AVAILABLE ?auto_317 ) ( ON ?auto_312 ?auto_311 ) ( not ( = ?auto_311 ?auto_312 ) ) ( not ( = ?auto_311 ?auto_313 ) ) ( TRUCK-AT ?auto_316 ?auto_315 ) ( not ( = ?auto_315 ?auto_314 ) ) ( HOIST-AT ?auto_318 ?auto_315 ) ( LIFTING ?auto_318 ?auto_313 ) ( not ( = ?auto_317 ?auto_318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_312 ?auto_313 )
      ( MAKE-2CRATE-VERIFY ?auto_311 ?auto_312 ?auto_313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319 - SURFACE
      ?auto_320 - SURFACE
    )
    :vars
    (
      ?auto_322 - HOIST
      ?auto_325 - PLACE
      ?auto_321 - SURFACE
      ?auto_326 - TRUCK
      ?auto_323 - PLACE
      ?auto_324 - HOIST
      ?auto_327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322 ?auto_325 ) ( SURFACE-AT ?auto_319 ?auto_325 ) ( CLEAR ?auto_319 ) ( IS-CRATE ?auto_320 ) ( not ( = ?auto_319 ?auto_320 ) ) ( AVAILABLE ?auto_322 ) ( ON ?auto_319 ?auto_321 ) ( not ( = ?auto_321 ?auto_319 ) ) ( not ( = ?auto_321 ?auto_320 ) ) ( TRUCK-AT ?auto_326 ?auto_323 ) ( not ( = ?auto_323 ?auto_325 ) ) ( HOIST-AT ?auto_324 ?auto_323 ) ( not ( = ?auto_322 ?auto_324 ) ) ( AVAILABLE ?auto_324 ) ( SURFACE-AT ?auto_320 ?auto_323 ) ( ON ?auto_320 ?auto_327 ) ( CLEAR ?auto_320 ) ( not ( = ?auto_319 ?auto_327 ) ) ( not ( = ?auto_320 ?auto_327 ) ) ( not ( = ?auto_321 ?auto_327 ) ) )
    :subtasks
    ( ( !LIFT ?auto_324 ?auto_320 ?auto_327 ?auto_323 )
      ( MAKE-2CRATE ?auto_321 ?auto_319 ?auto_320 )
      ( MAKE-1CRATE-VERIFY ?auto_319 ?auto_320 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_328 - SURFACE
      ?auto_329 - SURFACE
      ?auto_330 - SURFACE
    )
    :vars
    (
      ?auto_335 - HOIST
      ?auto_333 - PLACE
      ?auto_331 - TRUCK
      ?auto_336 - PLACE
      ?auto_332 - HOIST
      ?auto_334 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_335 ?auto_333 ) ( SURFACE-AT ?auto_329 ?auto_333 ) ( CLEAR ?auto_329 ) ( IS-CRATE ?auto_330 ) ( not ( = ?auto_329 ?auto_330 ) ) ( AVAILABLE ?auto_335 ) ( ON ?auto_329 ?auto_328 ) ( not ( = ?auto_328 ?auto_329 ) ) ( not ( = ?auto_328 ?auto_330 ) ) ( TRUCK-AT ?auto_331 ?auto_336 ) ( not ( = ?auto_336 ?auto_333 ) ) ( HOIST-AT ?auto_332 ?auto_336 ) ( not ( = ?auto_335 ?auto_332 ) ) ( AVAILABLE ?auto_332 ) ( SURFACE-AT ?auto_330 ?auto_336 ) ( ON ?auto_330 ?auto_334 ) ( CLEAR ?auto_330 ) ( not ( = ?auto_329 ?auto_334 ) ) ( not ( = ?auto_330 ?auto_334 ) ) ( not ( = ?auto_328 ?auto_334 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_329 ?auto_330 )
      ( MAKE-2CRATE-VERIFY ?auto_328 ?auto_329 ?auto_330 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_337 - SURFACE
      ?auto_338 - SURFACE
    )
    :vars
    (
      ?auto_342 - HOIST
      ?auto_339 - PLACE
      ?auto_345 - SURFACE
      ?auto_340 - PLACE
      ?auto_341 - HOIST
      ?auto_344 - SURFACE
      ?auto_343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_342 ?auto_339 ) ( SURFACE-AT ?auto_337 ?auto_339 ) ( CLEAR ?auto_337 ) ( IS-CRATE ?auto_338 ) ( not ( = ?auto_337 ?auto_338 ) ) ( AVAILABLE ?auto_342 ) ( ON ?auto_337 ?auto_345 ) ( not ( = ?auto_345 ?auto_337 ) ) ( not ( = ?auto_345 ?auto_338 ) ) ( not ( = ?auto_340 ?auto_339 ) ) ( HOIST-AT ?auto_341 ?auto_340 ) ( not ( = ?auto_342 ?auto_341 ) ) ( AVAILABLE ?auto_341 ) ( SURFACE-AT ?auto_338 ?auto_340 ) ( ON ?auto_338 ?auto_344 ) ( CLEAR ?auto_338 ) ( not ( = ?auto_337 ?auto_344 ) ) ( not ( = ?auto_338 ?auto_344 ) ) ( not ( = ?auto_345 ?auto_344 ) ) ( TRUCK-AT ?auto_343 ?auto_339 ) )
    :subtasks
    ( ( !DRIVE ?auto_343 ?auto_339 ?auto_340 )
      ( MAKE-2CRATE ?auto_345 ?auto_337 ?auto_338 )
      ( MAKE-1CRATE-VERIFY ?auto_337 ?auto_338 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_346 - SURFACE
      ?auto_347 - SURFACE
      ?auto_348 - SURFACE
    )
    :vars
    (
      ?auto_352 - HOIST
      ?auto_353 - PLACE
      ?auto_349 - PLACE
      ?auto_351 - HOIST
      ?auto_354 - SURFACE
      ?auto_350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_352 ?auto_353 ) ( SURFACE-AT ?auto_347 ?auto_353 ) ( CLEAR ?auto_347 ) ( IS-CRATE ?auto_348 ) ( not ( = ?auto_347 ?auto_348 ) ) ( AVAILABLE ?auto_352 ) ( ON ?auto_347 ?auto_346 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_349 ?auto_353 ) ) ( HOIST-AT ?auto_351 ?auto_349 ) ( not ( = ?auto_352 ?auto_351 ) ) ( AVAILABLE ?auto_351 ) ( SURFACE-AT ?auto_348 ?auto_349 ) ( ON ?auto_348 ?auto_354 ) ( CLEAR ?auto_348 ) ( not ( = ?auto_347 ?auto_354 ) ) ( not ( = ?auto_348 ?auto_354 ) ) ( not ( = ?auto_346 ?auto_354 ) ) ( TRUCK-AT ?auto_350 ?auto_353 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347 ?auto_348 )
      ( MAKE-2CRATE-VERIFY ?auto_346 ?auto_347 ?auto_348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_355 - SURFACE
      ?auto_356 - SURFACE
    )
    :vars
    (
      ?auto_361 - HOIST
      ?auto_357 - PLACE
      ?auto_363 - SURFACE
      ?auto_362 - PLACE
      ?auto_358 - HOIST
      ?auto_360 - SURFACE
      ?auto_359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361 ?auto_357 ) ( IS-CRATE ?auto_356 ) ( not ( = ?auto_355 ?auto_356 ) ) ( not ( = ?auto_363 ?auto_355 ) ) ( not ( = ?auto_363 ?auto_356 ) ) ( not ( = ?auto_362 ?auto_357 ) ) ( HOIST-AT ?auto_358 ?auto_362 ) ( not ( = ?auto_361 ?auto_358 ) ) ( AVAILABLE ?auto_358 ) ( SURFACE-AT ?auto_356 ?auto_362 ) ( ON ?auto_356 ?auto_360 ) ( CLEAR ?auto_356 ) ( not ( = ?auto_355 ?auto_360 ) ) ( not ( = ?auto_356 ?auto_360 ) ) ( not ( = ?auto_363 ?auto_360 ) ) ( TRUCK-AT ?auto_359 ?auto_357 ) ( SURFACE-AT ?auto_363 ?auto_357 ) ( CLEAR ?auto_363 ) ( LIFTING ?auto_361 ?auto_355 ) ( IS-CRATE ?auto_355 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_363 ?auto_355 )
      ( MAKE-2CRATE ?auto_363 ?auto_355 ?auto_356 )
      ( MAKE-1CRATE-VERIFY ?auto_355 ?auto_356 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_364 - SURFACE
      ?auto_365 - SURFACE
      ?auto_366 - SURFACE
    )
    :vars
    (
      ?auto_372 - HOIST
      ?auto_368 - PLACE
      ?auto_371 - PLACE
      ?auto_370 - HOIST
      ?auto_367 - SURFACE
      ?auto_369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_372 ?auto_368 ) ( IS-CRATE ?auto_366 ) ( not ( = ?auto_365 ?auto_366 ) ) ( not ( = ?auto_364 ?auto_365 ) ) ( not ( = ?auto_364 ?auto_366 ) ) ( not ( = ?auto_371 ?auto_368 ) ) ( HOIST-AT ?auto_370 ?auto_371 ) ( not ( = ?auto_372 ?auto_370 ) ) ( AVAILABLE ?auto_370 ) ( SURFACE-AT ?auto_366 ?auto_371 ) ( ON ?auto_366 ?auto_367 ) ( CLEAR ?auto_366 ) ( not ( = ?auto_365 ?auto_367 ) ) ( not ( = ?auto_366 ?auto_367 ) ) ( not ( = ?auto_364 ?auto_367 ) ) ( TRUCK-AT ?auto_369 ?auto_368 ) ( SURFACE-AT ?auto_364 ?auto_368 ) ( CLEAR ?auto_364 ) ( LIFTING ?auto_372 ?auto_365 ) ( IS-CRATE ?auto_365 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_365 ?auto_366 )
      ( MAKE-2CRATE-VERIFY ?auto_364 ?auto_365 ?auto_366 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_373 - SURFACE
      ?auto_374 - SURFACE
    )
    :vars
    (
      ?auto_376 - HOIST
      ?auto_375 - PLACE
      ?auto_381 - SURFACE
      ?auto_379 - PLACE
      ?auto_377 - HOIST
      ?auto_380 - SURFACE
      ?auto_378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376 ?auto_375 ) ( IS-CRATE ?auto_374 ) ( not ( = ?auto_373 ?auto_374 ) ) ( not ( = ?auto_381 ?auto_373 ) ) ( not ( = ?auto_381 ?auto_374 ) ) ( not ( = ?auto_379 ?auto_375 ) ) ( HOIST-AT ?auto_377 ?auto_379 ) ( not ( = ?auto_376 ?auto_377 ) ) ( AVAILABLE ?auto_377 ) ( SURFACE-AT ?auto_374 ?auto_379 ) ( ON ?auto_374 ?auto_380 ) ( CLEAR ?auto_374 ) ( not ( = ?auto_373 ?auto_380 ) ) ( not ( = ?auto_374 ?auto_380 ) ) ( not ( = ?auto_381 ?auto_380 ) ) ( TRUCK-AT ?auto_378 ?auto_375 ) ( SURFACE-AT ?auto_381 ?auto_375 ) ( CLEAR ?auto_381 ) ( IS-CRATE ?auto_373 ) ( AVAILABLE ?auto_376 ) ( IN ?auto_373 ?auto_378 ) )
    :subtasks
    ( ( !UNLOAD ?auto_376 ?auto_373 ?auto_378 ?auto_375 )
      ( MAKE-2CRATE ?auto_381 ?auto_373 ?auto_374 )
      ( MAKE-1CRATE-VERIFY ?auto_373 ?auto_374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_382 - SURFACE
      ?auto_383 - SURFACE
      ?auto_384 - SURFACE
    )
    :vars
    (
      ?auto_389 - HOIST
      ?auto_386 - PLACE
      ?auto_385 - PLACE
      ?auto_388 - HOIST
      ?auto_387 - SURFACE
      ?auto_390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389 ?auto_386 ) ( IS-CRATE ?auto_384 ) ( not ( = ?auto_383 ?auto_384 ) ) ( not ( = ?auto_382 ?auto_383 ) ) ( not ( = ?auto_382 ?auto_384 ) ) ( not ( = ?auto_385 ?auto_386 ) ) ( HOIST-AT ?auto_388 ?auto_385 ) ( not ( = ?auto_389 ?auto_388 ) ) ( AVAILABLE ?auto_388 ) ( SURFACE-AT ?auto_384 ?auto_385 ) ( ON ?auto_384 ?auto_387 ) ( CLEAR ?auto_384 ) ( not ( = ?auto_383 ?auto_387 ) ) ( not ( = ?auto_384 ?auto_387 ) ) ( not ( = ?auto_382 ?auto_387 ) ) ( TRUCK-AT ?auto_390 ?auto_386 ) ( SURFACE-AT ?auto_382 ?auto_386 ) ( CLEAR ?auto_382 ) ( IS-CRATE ?auto_383 ) ( AVAILABLE ?auto_389 ) ( IN ?auto_383 ?auto_390 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_383 ?auto_384 )
      ( MAKE-2CRATE-VERIFY ?auto_382 ?auto_383 ?auto_384 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_427 - SURFACE
      ?auto_428 - SURFACE
    )
    :vars
    (
      ?auto_431 - HOIST
      ?auto_429 - PLACE
      ?auto_435 - SURFACE
      ?auto_434 - PLACE
      ?auto_433 - HOIST
      ?auto_430 - SURFACE
      ?auto_432 - TRUCK
      ?auto_436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431 ?auto_429 ) ( SURFACE-AT ?auto_427 ?auto_429 ) ( CLEAR ?auto_427 ) ( IS-CRATE ?auto_428 ) ( not ( = ?auto_427 ?auto_428 ) ) ( AVAILABLE ?auto_431 ) ( ON ?auto_427 ?auto_435 ) ( not ( = ?auto_435 ?auto_427 ) ) ( not ( = ?auto_435 ?auto_428 ) ) ( not ( = ?auto_434 ?auto_429 ) ) ( HOIST-AT ?auto_433 ?auto_434 ) ( not ( = ?auto_431 ?auto_433 ) ) ( AVAILABLE ?auto_433 ) ( SURFACE-AT ?auto_428 ?auto_434 ) ( ON ?auto_428 ?auto_430 ) ( CLEAR ?auto_428 ) ( not ( = ?auto_427 ?auto_430 ) ) ( not ( = ?auto_428 ?auto_430 ) ) ( not ( = ?auto_435 ?auto_430 ) ) ( TRUCK-AT ?auto_432 ?auto_436 ) ( not ( = ?auto_436 ?auto_429 ) ) ( not ( = ?auto_434 ?auto_436 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_432 ?auto_436 ?auto_429 )
      ( MAKE-1CRATE ?auto_427 ?auto_428 )
      ( MAKE-1CRATE-VERIFY ?auto_427 ?auto_428 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_466 - SURFACE
      ?auto_467 - SURFACE
      ?auto_468 - SURFACE
      ?auto_469 - SURFACE
    )
    :vars
    (
      ?auto_470 - HOIST
      ?auto_471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_470 ?auto_471 ) ( SURFACE-AT ?auto_468 ?auto_471 ) ( CLEAR ?auto_468 ) ( LIFTING ?auto_470 ?auto_469 ) ( IS-CRATE ?auto_469 ) ( not ( = ?auto_468 ?auto_469 ) ) ( ON ?auto_467 ?auto_466 ) ( ON ?auto_468 ?auto_467 ) ( not ( = ?auto_466 ?auto_467 ) ) ( not ( = ?auto_466 ?auto_468 ) ) ( not ( = ?auto_466 ?auto_469 ) ) ( not ( = ?auto_467 ?auto_468 ) ) ( not ( = ?auto_467 ?auto_469 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_468 ?auto_469 )
      ( MAKE-3CRATE-VERIFY ?auto_466 ?auto_467 ?auto_468 ?auto_469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_483 - SURFACE
      ?auto_484 - SURFACE
      ?auto_485 - SURFACE
      ?auto_486 - SURFACE
    )
    :vars
    (
      ?auto_488 - HOIST
      ?auto_487 - PLACE
      ?auto_489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488 ?auto_487 ) ( SURFACE-AT ?auto_485 ?auto_487 ) ( CLEAR ?auto_485 ) ( IS-CRATE ?auto_486 ) ( not ( = ?auto_485 ?auto_486 ) ) ( TRUCK-AT ?auto_489 ?auto_487 ) ( AVAILABLE ?auto_488 ) ( IN ?auto_486 ?auto_489 ) ( ON ?auto_485 ?auto_484 ) ( not ( = ?auto_484 ?auto_485 ) ) ( not ( = ?auto_484 ?auto_486 ) ) ( ON ?auto_484 ?auto_483 ) ( not ( = ?auto_483 ?auto_484 ) ) ( not ( = ?auto_483 ?auto_485 ) ) ( not ( = ?auto_483 ?auto_486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484 ?auto_485 ?auto_486 )
      ( MAKE-3CRATE-VERIFY ?auto_483 ?auto_484 ?auto_485 ?auto_486 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_504 - SURFACE
      ?auto_505 - SURFACE
      ?auto_506 - SURFACE
      ?auto_507 - SURFACE
    )
    :vars
    (
      ?auto_508 - HOIST
      ?auto_509 - PLACE
      ?auto_511 - TRUCK
      ?auto_510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_508 ?auto_509 ) ( SURFACE-AT ?auto_506 ?auto_509 ) ( CLEAR ?auto_506 ) ( IS-CRATE ?auto_507 ) ( not ( = ?auto_506 ?auto_507 ) ) ( AVAILABLE ?auto_508 ) ( IN ?auto_507 ?auto_511 ) ( ON ?auto_506 ?auto_505 ) ( not ( = ?auto_505 ?auto_506 ) ) ( not ( = ?auto_505 ?auto_507 ) ) ( TRUCK-AT ?auto_511 ?auto_510 ) ( not ( = ?auto_510 ?auto_509 ) ) ( ON ?auto_505 ?auto_504 ) ( not ( = ?auto_504 ?auto_505 ) ) ( not ( = ?auto_504 ?auto_506 ) ) ( not ( = ?auto_504 ?auto_507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_505 ?auto_506 ?auto_507 )
      ( MAKE-3CRATE-VERIFY ?auto_504 ?auto_505 ?auto_506 ?auto_507 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_528 - SURFACE
      ?auto_529 - SURFACE
      ?auto_530 - SURFACE
      ?auto_531 - SURFACE
    )
    :vars
    (
      ?auto_534 - HOIST
      ?auto_532 - PLACE
      ?auto_533 - TRUCK
      ?auto_535 - PLACE
      ?auto_536 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_534 ?auto_532 ) ( SURFACE-AT ?auto_530 ?auto_532 ) ( CLEAR ?auto_530 ) ( IS-CRATE ?auto_531 ) ( not ( = ?auto_530 ?auto_531 ) ) ( AVAILABLE ?auto_534 ) ( ON ?auto_530 ?auto_529 ) ( not ( = ?auto_529 ?auto_530 ) ) ( not ( = ?auto_529 ?auto_531 ) ) ( TRUCK-AT ?auto_533 ?auto_535 ) ( not ( = ?auto_535 ?auto_532 ) ) ( HOIST-AT ?auto_536 ?auto_535 ) ( LIFTING ?auto_536 ?auto_531 ) ( not ( = ?auto_534 ?auto_536 ) ) ( ON ?auto_529 ?auto_528 ) ( not ( = ?auto_528 ?auto_529 ) ) ( not ( = ?auto_528 ?auto_530 ) ) ( not ( = ?auto_528 ?auto_531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_529 ?auto_530 ?auto_531 )
      ( MAKE-3CRATE-VERIFY ?auto_528 ?auto_529 ?auto_530 ?auto_531 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555 - SURFACE
      ?auto_556 - SURFACE
      ?auto_557 - SURFACE
      ?auto_558 - SURFACE
    )
    :vars
    (
      ?auto_562 - HOIST
      ?auto_560 - PLACE
      ?auto_563 - TRUCK
      ?auto_564 - PLACE
      ?auto_559 - HOIST
      ?auto_561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_562 ?auto_560 ) ( SURFACE-AT ?auto_557 ?auto_560 ) ( CLEAR ?auto_557 ) ( IS-CRATE ?auto_558 ) ( not ( = ?auto_557 ?auto_558 ) ) ( AVAILABLE ?auto_562 ) ( ON ?auto_557 ?auto_556 ) ( not ( = ?auto_556 ?auto_557 ) ) ( not ( = ?auto_556 ?auto_558 ) ) ( TRUCK-AT ?auto_563 ?auto_564 ) ( not ( = ?auto_564 ?auto_560 ) ) ( HOIST-AT ?auto_559 ?auto_564 ) ( not ( = ?auto_562 ?auto_559 ) ) ( AVAILABLE ?auto_559 ) ( SURFACE-AT ?auto_558 ?auto_564 ) ( ON ?auto_558 ?auto_561 ) ( CLEAR ?auto_558 ) ( not ( = ?auto_557 ?auto_561 ) ) ( not ( = ?auto_558 ?auto_561 ) ) ( not ( = ?auto_556 ?auto_561 ) ) ( ON ?auto_556 ?auto_555 ) ( not ( = ?auto_555 ?auto_556 ) ) ( not ( = ?auto_555 ?auto_557 ) ) ( not ( = ?auto_555 ?auto_558 ) ) ( not ( = ?auto_555 ?auto_561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556 ?auto_557 ?auto_558 )
      ( MAKE-3CRATE-VERIFY ?auto_555 ?auto_556 ?auto_557 ?auto_558 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_583 - SURFACE
      ?auto_584 - SURFACE
      ?auto_585 - SURFACE
      ?auto_586 - SURFACE
    )
    :vars
    (
      ?auto_587 - HOIST
      ?auto_588 - PLACE
      ?auto_590 - PLACE
      ?auto_592 - HOIST
      ?auto_589 - SURFACE
      ?auto_591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_587 ?auto_588 ) ( SURFACE-AT ?auto_585 ?auto_588 ) ( CLEAR ?auto_585 ) ( IS-CRATE ?auto_586 ) ( not ( = ?auto_585 ?auto_586 ) ) ( AVAILABLE ?auto_587 ) ( ON ?auto_585 ?auto_584 ) ( not ( = ?auto_584 ?auto_585 ) ) ( not ( = ?auto_584 ?auto_586 ) ) ( not ( = ?auto_590 ?auto_588 ) ) ( HOIST-AT ?auto_592 ?auto_590 ) ( not ( = ?auto_587 ?auto_592 ) ) ( AVAILABLE ?auto_592 ) ( SURFACE-AT ?auto_586 ?auto_590 ) ( ON ?auto_586 ?auto_589 ) ( CLEAR ?auto_586 ) ( not ( = ?auto_585 ?auto_589 ) ) ( not ( = ?auto_586 ?auto_589 ) ) ( not ( = ?auto_584 ?auto_589 ) ) ( TRUCK-AT ?auto_591 ?auto_588 ) ( ON ?auto_584 ?auto_583 ) ( not ( = ?auto_583 ?auto_584 ) ) ( not ( = ?auto_583 ?auto_585 ) ) ( not ( = ?auto_583 ?auto_586 ) ) ( not ( = ?auto_583 ?auto_589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_584 ?auto_585 ?auto_586 )
      ( MAKE-3CRATE-VERIFY ?auto_583 ?auto_584 ?auto_585 ?auto_586 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_611 - SURFACE
      ?auto_612 - SURFACE
      ?auto_613 - SURFACE
      ?auto_614 - SURFACE
    )
    :vars
    (
      ?auto_615 - HOIST
      ?auto_620 - PLACE
      ?auto_619 - PLACE
      ?auto_616 - HOIST
      ?auto_618 - SURFACE
      ?auto_617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_615 ?auto_620 ) ( IS-CRATE ?auto_614 ) ( not ( = ?auto_613 ?auto_614 ) ) ( not ( = ?auto_612 ?auto_613 ) ) ( not ( = ?auto_612 ?auto_614 ) ) ( not ( = ?auto_619 ?auto_620 ) ) ( HOIST-AT ?auto_616 ?auto_619 ) ( not ( = ?auto_615 ?auto_616 ) ) ( AVAILABLE ?auto_616 ) ( SURFACE-AT ?auto_614 ?auto_619 ) ( ON ?auto_614 ?auto_618 ) ( CLEAR ?auto_614 ) ( not ( = ?auto_613 ?auto_618 ) ) ( not ( = ?auto_614 ?auto_618 ) ) ( not ( = ?auto_612 ?auto_618 ) ) ( TRUCK-AT ?auto_617 ?auto_620 ) ( SURFACE-AT ?auto_612 ?auto_620 ) ( CLEAR ?auto_612 ) ( LIFTING ?auto_615 ?auto_613 ) ( IS-CRATE ?auto_613 ) ( ON ?auto_612 ?auto_611 ) ( not ( = ?auto_611 ?auto_612 ) ) ( not ( = ?auto_611 ?auto_613 ) ) ( not ( = ?auto_611 ?auto_614 ) ) ( not ( = ?auto_611 ?auto_618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612 ?auto_613 ?auto_614 )
      ( MAKE-3CRATE-VERIFY ?auto_611 ?auto_612 ?auto_613 ?auto_614 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_639 - SURFACE
      ?auto_640 - SURFACE
      ?auto_641 - SURFACE
      ?auto_642 - SURFACE
    )
    :vars
    (
      ?auto_648 - HOIST
      ?auto_643 - PLACE
      ?auto_646 - PLACE
      ?auto_647 - HOIST
      ?auto_644 - SURFACE
      ?auto_645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_648 ?auto_643 ) ( IS-CRATE ?auto_642 ) ( not ( = ?auto_641 ?auto_642 ) ) ( not ( = ?auto_640 ?auto_641 ) ) ( not ( = ?auto_640 ?auto_642 ) ) ( not ( = ?auto_646 ?auto_643 ) ) ( HOIST-AT ?auto_647 ?auto_646 ) ( not ( = ?auto_648 ?auto_647 ) ) ( AVAILABLE ?auto_647 ) ( SURFACE-AT ?auto_642 ?auto_646 ) ( ON ?auto_642 ?auto_644 ) ( CLEAR ?auto_642 ) ( not ( = ?auto_641 ?auto_644 ) ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_640 ?auto_644 ) ) ( TRUCK-AT ?auto_645 ?auto_643 ) ( SURFACE-AT ?auto_640 ?auto_643 ) ( CLEAR ?auto_640 ) ( IS-CRATE ?auto_641 ) ( AVAILABLE ?auto_648 ) ( IN ?auto_641 ?auto_645 ) ( ON ?auto_640 ?auto_639 ) ( not ( = ?auto_639 ?auto_640 ) ) ( not ( = ?auto_639 ?auto_641 ) ) ( not ( = ?auto_639 ?auto_642 ) ) ( not ( = ?auto_639 ?auto_644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_640 ?auto_641 ?auto_642 )
      ( MAKE-3CRATE-VERIFY ?auto_639 ?auto_640 ?auto_641 ?auto_642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_649 - SURFACE
      ?auto_650 - SURFACE
    )
    :vars
    (
      ?auto_656 - HOIST
      ?auto_651 - PLACE
      ?auto_657 - SURFACE
      ?auto_654 - PLACE
      ?auto_655 - HOIST
      ?auto_652 - SURFACE
      ?auto_653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_656 ?auto_651 ) ( IS-CRATE ?auto_650 ) ( not ( = ?auto_649 ?auto_650 ) ) ( not ( = ?auto_657 ?auto_649 ) ) ( not ( = ?auto_657 ?auto_650 ) ) ( not ( = ?auto_654 ?auto_651 ) ) ( HOIST-AT ?auto_655 ?auto_654 ) ( not ( = ?auto_656 ?auto_655 ) ) ( AVAILABLE ?auto_655 ) ( SURFACE-AT ?auto_650 ?auto_654 ) ( ON ?auto_650 ?auto_652 ) ( CLEAR ?auto_650 ) ( not ( = ?auto_649 ?auto_652 ) ) ( not ( = ?auto_650 ?auto_652 ) ) ( not ( = ?auto_657 ?auto_652 ) ) ( SURFACE-AT ?auto_657 ?auto_651 ) ( CLEAR ?auto_657 ) ( IS-CRATE ?auto_649 ) ( AVAILABLE ?auto_656 ) ( IN ?auto_649 ?auto_653 ) ( TRUCK-AT ?auto_653 ?auto_654 ) )
    :subtasks
    ( ( !DRIVE ?auto_653 ?auto_654 ?auto_651 )
      ( MAKE-2CRATE ?auto_657 ?auto_649 ?auto_650 )
      ( MAKE-1CRATE-VERIFY ?auto_649 ?auto_650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_658 - SURFACE
      ?auto_659 - SURFACE
      ?auto_660 - SURFACE
    )
    :vars
    (
      ?auto_661 - HOIST
      ?auto_663 - PLACE
      ?auto_665 - PLACE
      ?auto_664 - HOIST
      ?auto_662 - SURFACE
      ?auto_666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_661 ?auto_663 ) ( IS-CRATE ?auto_660 ) ( not ( = ?auto_659 ?auto_660 ) ) ( not ( = ?auto_658 ?auto_659 ) ) ( not ( = ?auto_658 ?auto_660 ) ) ( not ( = ?auto_665 ?auto_663 ) ) ( HOIST-AT ?auto_664 ?auto_665 ) ( not ( = ?auto_661 ?auto_664 ) ) ( AVAILABLE ?auto_664 ) ( SURFACE-AT ?auto_660 ?auto_665 ) ( ON ?auto_660 ?auto_662 ) ( CLEAR ?auto_660 ) ( not ( = ?auto_659 ?auto_662 ) ) ( not ( = ?auto_660 ?auto_662 ) ) ( not ( = ?auto_658 ?auto_662 ) ) ( SURFACE-AT ?auto_658 ?auto_663 ) ( CLEAR ?auto_658 ) ( IS-CRATE ?auto_659 ) ( AVAILABLE ?auto_661 ) ( IN ?auto_659 ?auto_666 ) ( TRUCK-AT ?auto_666 ?auto_665 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_659 ?auto_660 )
      ( MAKE-2CRATE-VERIFY ?auto_658 ?auto_659 ?auto_660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_667 - SURFACE
      ?auto_668 - SURFACE
      ?auto_669 - SURFACE
      ?auto_670 - SURFACE
    )
    :vars
    (
      ?auto_674 - HOIST
      ?auto_673 - PLACE
      ?auto_671 - PLACE
      ?auto_675 - HOIST
      ?auto_672 - SURFACE
      ?auto_676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_674 ?auto_673 ) ( IS-CRATE ?auto_670 ) ( not ( = ?auto_669 ?auto_670 ) ) ( not ( = ?auto_668 ?auto_669 ) ) ( not ( = ?auto_668 ?auto_670 ) ) ( not ( = ?auto_671 ?auto_673 ) ) ( HOIST-AT ?auto_675 ?auto_671 ) ( not ( = ?auto_674 ?auto_675 ) ) ( AVAILABLE ?auto_675 ) ( SURFACE-AT ?auto_670 ?auto_671 ) ( ON ?auto_670 ?auto_672 ) ( CLEAR ?auto_670 ) ( not ( = ?auto_669 ?auto_672 ) ) ( not ( = ?auto_670 ?auto_672 ) ) ( not ( = ?auto_668 ?auto_672 ) ) ( SURFACE-AT ?auto_668 ?auto_673 ) ( CLEAR ?auto_668 ) ( IS-CRATE ?auto_669 ) ( AVAILABLE ?auto_674 ) ( IN ?auto_669 ?auto_676 ) ( TRUCK-AT ?auto_676 ?auto_671 ) ( ON ?auto_668 ?auto_667 ) ( not ( = ?auto_667 ?auto_668 ) ) ( not ( = ?auto_667 ?auto_669 ) ) ( not ( = ?auto_667 ?auto_670 ) ) ( not ( = ?auto_667 ?auto_672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_668 ?auto_669 ?auto_670 )
      ( MAKE-3CRATE-VERIFY ?auto_667 ?auto_668 ?auto_669 ?auto_670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_677 - SURFACE
      ?auto_678 - SURFACE
    )
    :vars
    (
      ?auto_682 - HOIST
      ?auto_681 - PLACE
      ?auto_683 - SURFACE
      ?auto_679 - PLACE
      ?auto_684 - HOIST
      ?auto_680 - SURFACE
      ?auto_685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_682 ?auto_681 ) ( IS-CRATE ?auto_678 ) ( not ( = ?auto_677 ?auto_678 ) ) ( not ( = ?auto_683 ?auto_677 ) ) ( not ( = ?auto_683 ?auto_678 ) ) ( not ( = ?auto_679 ?auto_681 ) ) ( HOIST-AT ?auto_684 ?auto_679 ) ( not ( = ?auto_682 ?auto_684 ) ) ( SURFACE-AT ?auto_678 ?auto_679 ) ( ON ?auto_678 ?auto_680 ) ( CLEAR ?auto_678 ) ( not ( = ?auto_677 ?auto_680 ) ) ( not ( = ?auto_678 ?auto_680 ) ) ( not ( = ?auto_683 ?auto_680 ) ) ( SURFACE-AT ?auto_683 ?auto_681 ) ( CLEAR ?auto_683 ) ( IS-CRATE ?auto_677 ) ( AVAILABLE ?auto_682 ) ( TRUCK-AT ?auto_685 ?auto_679 ) ( LIFTING ?auto_684 ?auto_677 ) )
    :subtasks
    ( ( !LOAD ?auto_684 ?auto_677 ?auto_685 ?auto_679 )
      ( MAKE-2CRATE ?auto_683 ?auto_677 ?auto_678 )
      ( MAKE-1CRATE-VERIFY ?auto_677 ?auto_678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_686 - SURFACE
      ?auto_687 - SURFACE
      ?auto_688 - SURFACE
    )
    :vars
    (
      ?auto_693 - HOIST
      ?auto_689 - PLACE
      ?auto_694 - PLACE
      ?auto_691 - HOIST
      ?auto_690 - SURFACE
      ?auto_692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693 ?auto_689 ) ( IS-CRATE ?auto_688 ) ( not ( = ?auto_687 ?auto_688 ) ) ( not ( = ?auto_686 ?auto_687 ) ) ( not ( = ?auto_686 ?auto_688 ) ) ( not ( = ?auto_694 ?auto_689 ) ) ( HOIST-AT ?auto_691 ?auto_694 ) ( not ( = ?auto_693 ?auto_691 ) ) ( SURFACE-AT ?auto_688 ?auto_694 ) ( ON ?auto_688 ?auto_690 ) ( CLEAR ?auto_688 ) ( not ( = ?auto_687 ?auto_690 ) ) ( not ( = ?auto_688 ?auto_690 ) ) ( not ( = ?auto_686 ?auto_690 ) ) ( SURFACE-AT ?auto_686 ?auto_689 ) ( CLEAR ?auto_686 ) ( IS-CRATE ?auto_687 ) ( AVAILABLE ?auto_693 ) ( TRUCK-AT ?auto_692 ?auto_694 ) ( LIFTING ?auto_691 ?auto_687 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_687 ?auto_688 )
      ( MAKE-2CRATE-VERIFY ?auto_686 ?auto_687 ?auto_688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_695 - SURFACE
      ?auto_696 - SURFACE
      ?auto_697 - SURFACE
      ?auto_698 - SURFACE
    )
    :vars
    (
      ?auto_703 - HOIST
      ?auto_701 - PLACE
      ?auto_699 - PLACE
      ?auto_700 - HOIST
      ?auto_702 - SURFACE
      ?auto_704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_703 ?auto_701 ) ( IS-CRATE ?auto_698 ) ( not ( = ?auto_697 ?auto_698 ) ) ( not ( = ?auto_696 ?auto_697 ) ) ( not ( = ?auto_696 ?auto_698 ) ) ( not ( = ?auto_699 ?auto_701 ) ) ( HOIST-AT ?auto_700 ?auto_699 ) ( not ( = ?auto_703 ?auto_700 ) ) ( SURFACE-AT ?auto_698 ?auto_699 ) ( ON ?auto_698 ?auto_702 ) ( CLEAR ?auto_698 ) ( not ( = ?auto_697 ?auto_702 ) ) ( not ( = ?auto_698 ?auto_702 ) ) ( not ( = ?auto_696 ?auto_702 ) ) ( SURFACE-AT ?auto_696 ?auto_701 ) ( CLEAR ?auto_696 ) ( IS-CRATE ?auto_697 ) ( AVAILABLE ?auto_703 ) ( TRUCK-AT ?auto_704 ?auto_699 ) ( LIFTING ?auto_700 ?auto_697 ) ( ON ?auto_696 ?auto_695 ) ( not ( = ?auto_695 ?auto_696 ) ) ( not ( = ?auto_695 ?auto_697 ) ) ( not ( = ?auto_695 ?auto_698 ) ) ( not ( = ?auto_695 ?auto_702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_696 ?auto_697 ?auto_698 )
      ( MAKE-3CRATE-VERIFY ?auto_695 ?auto_696 ?auto_697 ?auto_698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_705 - SURFACE
      ?auto_706 - SURFACE
    )
    :vars
    (
      ?auto_711 - HOIST
      ?auto_709 - PLACE
      ?auto_712 - SURFACE
      ?auto_707 - PLACE
      ?auto_708 - HOIST
      ?auto_710 - SURFACE
      ?auto_713 - TRUCK
      ?auto_714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_711 ?auto_709 ) ( IS-CRATE ?auto_706 ) ( not ( = ?auto_705 ?auto_706 ) ) ( not ( = ?auto_712 ?auto_705 ) ) ( not ( = ?auto_712 ?auto_706 ) ) ( not ( = ?auto_707 ?auto_709 ) ) ( HOIST-AT ?auto_708 ?auto_707 ) ( not ( = ?auto_711 ?auto_708 ) ) ( SURFACE-AT ?auto_706 ?auto_707 ) ( ON ?auto_706 ?auto_710 ) ( CLEAR ?auto_706 ) ( not ( = ?auto_705 ?auto_710 ) ) ( not ( = ?auto_706 ?auto_710 ) ) ( not ( = ?auto_712 ?auto_710 ) ) ( SURFACE-AT ?auto_712 ?auto_709 ) ( CLEAR ?auto_712 ) ( IS-CRATE ?auto_705 ) ( AVAILABLE ?auto_711 ) ( TRUCK-AT ?auto_713 ?auto_707 ) ( AVAILABLE ?auto_708 ) ( SURFACE-AT ?auto_705 ?auto_707 ) ( ON ?auto_705 ?auto_714 ) ( CLEAR ?auto_705 ) ( not ( = ?auto_705 ?auto_714 ) ) ( not ( = ?auto_706 ?auto_714 ) ) ( not ( = ?auto_712 ?auto_714 ) ) ( not ( = ?auto_710 ?auto_714 ) ) )
    :subtasks
    ( ( !LIFT ?auto_708 ?auto_705 ?auto_714 ?auto_707 )
      ( MAKE-2CRATE ?auto_712 ?auto_705 ?auto_706 )
      ( MAKE-1CRATE-VERIFY ?auto_705 ?auto_706 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_715 - SURFACE
      ?auto_716 - SURFACE
      ?auto_717 - SURFACE
    )
    :vars
    (
      ?auto_720 - HOIST
      ?auto_719 - PLACE
      ?auto_724 - PLACE
      ?auto_723 - HOIST
      ?auto_718 - SURFACE
      ?auto_721 - TRUCK
      ?auto_722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_720 ?auto_719 ) ( IS-CRATE ?auto_717 ) ( not ( = ?auto_716 ?auto_717 ) ) ( not ( = ?auto_715 ?auto_716 ) ) ( not ( = ?auto_715 ?auto_717 ) ) ( not ( = ?auto_724 ?auto_719 ) ) ( HOIST-AT ?auto_723 ?auto_724 ) ( not ( = ?auto_720 ?auto_723 ) ) ( SURFACE-AT ?auto_717 ?auto_724 ) ( ON ?auto_717 ?auto_718 ) ( CLEAR ?auto_717 ) ( not ( = ?auto_716 ?auto_718 ) ) ( not ( = ?auto_717 ?auto_718 ) ) ( not ( = ?auto_715 ?auto_718 ) ) ( SURFACE-AT ?auto_715 ?auto_719 ) ( CLEAR ?auto_715 ) ( IS-CRATE ?auto_716 ) ( AVAILABLE ?auto_720 ) ( TRUCK-AT ?auto_721 ?auto_724 ) ( AVAILABLE ?auto_723 ) ( SURFACE-AT ?auto_716 ?auto_724 ) ( ON ?auto_716 ?auto_722 ) ( CLEAR ?auto_716 ) ( not ( = ?auto_716 ?auto_722 ) ) ( not ( = ?auto_717 ?auto_722 ) ) ( not ( = ?auto_715 ?auto_722 ) ) ( not ( = ?auto_718 ?auto_722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_716 ?auto_717 )
      ( MAKE-2CRATE-VERIFY ?auto_715 ?auto_716 ?auto_717 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_725 - SURFACE
      ?auto_726 - SURFACE
      ?auto_727 - SURFACE
      ?auto_728 - SURFACE
    )
    :vars
    (
      ?auto_729 - HOIST
      ?auto_730 - PLACE
      ?auto_733 - PLACE
      ?auto_734 - HOIST
      ?auto_731 - SURFACE
      ?auto_735 - TRUCK
      ?auto_732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_729 ?auto_730 ) ( IS-CRATE ?auto_728 ) ( not ( = ?auto_727 ?auto_728 ) ) ( not ( = ?auto_726 ?auto_727 ) ) ( not ( = ?auto_726 ?auto_728 ) ) ( not ( = ?auto_733 ?auto_730 ) ) ( HOIST-AT ?auto_734 ?auto_733 ) ( not ( = ?auto_729 ?auto_734 ) ) ( SURFACE-AT ?auto_728 ?auto_733 ) ( ON ?auto_728 ?auto_731 ) ( CLEAR ?auto_728 ) ( not ( = ?auto_727 ?auto_731 ) ) ( not ( = ?auto_728 ?auto_731 ) ) ( not ( = ?auto_726 ?auto_731 ) ) ( SURFACE-AT ?auto_726 ?auto_730 ) ( CLEAR ?auto_726 ) ( IS-CRATE ?auto_727 ) ( AVAILABLE ?auto_729 ) ( TRUCK-AT ?auto_735 ?auto_733 ) ( AVAILABLE ?auto_734 ) ( SURFACE-AT ?auto_727 ?auto_733 ) ( ON ?auto_727 ?auto_732 ) ( CLEAR ?auto_727 ) ( not ( = ?auto_727 ?auto_732 ) ) ( not ( = ?auto_728 ?auto_732 ) ) ( not ( = ?auto_726 ?auto_732 ) ) ( not ( = ?auto_731 ?auto_732 ) ) ( ON ?auto_726 ?auto_725 ) ( not ( = ?auto_725 ?auto_726 ) ) ( not ( = ?auto_725 ?auto_727 ) ) ( not ( = ?auto_725 ?auto_728 ) ) ( not ( = ?auto_725 ?auto_731 ) ) ( not ( = ?auto_725 ?auto_732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_726 ?auto_727 ?auto_728 )
      ( MAKE-3CRATE-VERIFY ?auto_725 ?auto_726 ?auto_727 ?auto_728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_736 - SURFACE
      ?auto_737 - SURFACE
    )
    :vars
    (
      ?auto_738 - HOIST
      ?auto_739 - PLACE
      ?auto_745 - SURFACE
      ?auto_742 - PLACE
      ?auto_743 - HOIST
      ?auto_740 - SURFACE
      ?auto_741 - SURFACE
      ?auto_744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_738 ?auto_739 ) ( IS-CRATE ?auto_737 ) ( not ( = ?auto_736 ?auto_737 ) ) ( not ( = ?auto_745 ?auto_736 ) ) ( not ( = ?auto_745 ?auto_737 ) ) ( not ( = ?auto_742 ?auto_739 ) ) ( HOIST-AT ?auto_743 ?auto_742 ) ( not ( = ?auto_738 ?auto_743 ) ) ( SURFACE-AT ?auto_737 ?auto_742 ) ( ON ?auto_737 ?auto_740 ) ( CLEAR ?auto_737 ) ( not ( = ?auto_736 ?auto_740 ) ) ( not ( = ?auto_737 ?auto_740 ) ) ( not ( = ?auto_745 ?auto_740 ) ) ( SURFACE-AT ?auto_745 ?auto_739 ) ( CLEAR ?auto_745 ) ( IS-CRATE ?auto_736 ) ( AVAILABLE ?auto_738 ) ( AVAILABLE ?auto_743 ) ( SURFACE-AT ?auto_736 ?auto_742 ) ( ON ?auto_736 ?auto_741 ) ( CLEAR ?auto_736 ) ( not ( = ?auto_736 ?auto_741 ) ) ( not ( = ?auto_737 ?auto_741 ) ) ( not ( = ?auto_745 ?auto_741 ) ) ( not ( = ?auto_740 ?auto_741 ) ) ( TRUCK-AT ?auto_744 ?auto_739 ) )
    :subtasks
    ( ( !DRIVE ?auto_744 ?auto_739 ?auto_742 )
      ( MAKE-2CRATE ?auto_745 ?auto_736 ?auto_737 )
      ( MAKE-1CRATE-VERIFY ?auto_736 ?auto_737 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_746 - SURFACE
      ?auto_747 - SURFACE
      ?auto_748 - SURFACE
    )
    :vars
    (
      ?auto_752 - HOIST
      ?auto_755 - PLACE
      ?auto_754 - PLACE
      ?auto_753 - HOIST
      ?auto_751 - SURFACE
      ?auto_750 - SURFACE
      ?auto_749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_752 ?auto_755 ) ( IS-CRATE ?auto_748 ) ( not ( = ?auto_747 ?auto_748 ) ) ( not ( = ?auto_746 ?auto_747 ) ) ( not ( = ?auto_746 ?auto_748 ) ) ( not ( = ?auto_754 ?auto_755 ) ) ( HOIST-AT ?auto_753 ?auto_754 ) ( not ( = ?auto_752 ?auto_753 ) ) ( SURFACE-AT ?auto_748 ?auto_754 ) ( ON ?auto_748 ?auto_751 ) ( CLEAR ?auto_748 ) ( not ( = ?auto_747 ?auto_751 ) ) ( not ( = ?auto_748 ?auto_751 ) ) ( not ( = ?auto_746 ?auto_751 ) ) ( SURFACE-AT ?auto_746 ?auto_755 ) ( CLEAR ?auto_746 ) ( IS-CRATE ?auto_747 ) ( AVAILABLE ?auto_752 ) ( AVAILABLE ?auto_753 ) ( SURFACE-AT ?auto_747 ?auto_754 ) ( ON ?auto_747 ?auto_750 ) ( CLEAR ?auto_747 ) ( not ( = ?auto_747 ?auto_750 ) ) ( not ( = ?auto_748 ?auto_750 ) ) ( not ( = ?auto_746 ?auto_750 ) ) ( not ( = ?auto_751 ?auto_750 ) ) ( TRUCK-AT ?auto_749 ?auto_755 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_747 ?auto_748 )
      ( MAKE-2CRATE-VERIFY ?auto_746 ?auto_747 ?auto_748 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_756 - SURFACE
      ?auto_757 - SURFACE
      ?auto_758 - SURFACE
      ?auto_759 - SURFACE
    )
    :vars
    (
      ?auto_760 - HOIST
      ?auto_765 - PLACE
      ?auto_762 - PLACE
      ?auto_761 - HOIST
      ?auto_766 - SURFACE
      ?auto_764 - SURFACE
      ?auto_763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_760 ?auto_765 ) ( IS-CRATE ?auto_759 ) ( not ( = ?auto_758 ?auto_759 ) ) ( not ( = ?auto_757 ?auto_758 ) ) ( not ( = ?auto_757 ?auto_759 ) ) ( not ( = ?auto_762 ?auto_765 ) ) ( HOIST-AT ?auto_761 ?auto_762 ) ( not ( = ?auto_760 ?auto_761 ) ) ( SURFACE-AT ?auto_759 ?auto_762 ) ( ON ?auto_759 ?auto_766 ) ( CLEAR ?auto_759 ) ( not ( = ?auto_758 ?auto_766 ) ) ( not ( = ?auto_759 ?auto_766 ) ) ( not ( = ?auto_757 ?auto_766 ) ) ( SURFACE-AT ?auto_757 ?auto_765 ) ( CLEAR ?auto_757 ) ( IS-CRATE ?auto_758 ) ( AVAILABLE ?auto_760 ) ( AVAILABLE ?auto_761 ) ( SURFACE-AT ?auto_758 ?auto_762 ) ( ON ?auto_758 ?auto_764 ) ( CLEAR ?auto_758 ) ( not ( = ?auto_758 ?auto_764 ) ) ( not ( = ?auto_759 ?auto_764 ) ) ( not ( = ?auto_757 ?auto_764 ) ) ( not ( = ?auto_766 ?auto_764 ) ) ( TRUCK-AT ?auto_763 ?auto_765 ) ( ON ?auto_757 ?auto_756 ) ( not ( = ?auto_756 ?auto_757 ) ) ( not ( = ?auto_756 ?auto_758 ) ) ( not ( = ?auto_756 ?auto_759 ) ) ( not ( = ?auto_756 ?auto_766 ) ) ( not ( = ?auto_756 ?auto_764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_757 ?auto_758 ?auto_759 )
      ( MAKE-3CRATE-VERIFY ?auto_756 ?auto_757 ?auto_758 ?auto_759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_767 - SURFACE
      ?auto_768 - SURFACE
    )
    :vars
    (
      ?auto_769 - HOIST
      ?auto_774 - PLACE
      ?auto_776 - SURFACE
      ?auto_771 - PLACE
      ?auto_770 - HOIST
      ?auto_775 - SURFACE
      ?auto_773 - SURFACE
      ?auto_772 - TRUCK
      ?auto_777 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_769 ?auto_774 ) ( IS-CRATE ?auto_768 ) ( not ( = ?auto_767 ?auto_768 ) ) ( not ( = ?auto_776 ?auto_767 ) ) ( not ( = ?auto_776 ?auto_768 ) ) ( not ( = ?auto_771 ?auto_774 ) ) ( HOIST-AT ?auto_770 ?auto_771 ) ( not ( = ?auto_769 ?auto_770 ) ) ( SURFACE-AT ?auto_768 ?auto_771 ) ( ON ?auto_768 ?auto_775 ) ( CLEAR ?auto_768 ) ( not ( = ?auto_767 ?auto_775 ) ) ( not ( = ?auto_768 ?auto_775 ) ) ( not ( = ?auto_776 ?auto_775 ) ) ( IS-CRATE ?auto_767 ) ( AVAILABLE ?auto_770 ) ( SURFACE-AT ?auto_767 ?auto_771 ) ( ON ?auto_767 ?auto_773 ) ( CLEAR ?auto_767 ) ( not ( = ?auto_767 ?auto_773 ) ) ( not ( = ?auto_768 ?auto_773 ) ) ( not ( = ?auto_776 ?auto_773 ) ) ( not ( = ?auto_775 ?auto_773 ) ) ( TRUCK-AT ?auto_772 ?auto_774 ) ( SURFACE-AT ?auto_777 ?auto_774 ) ( CLEAR ?auto_777 ) ( LIFTING ?auto_769 ?auto_776 ) ( IS-CRATE ?auto_776 ) ( not ( = ?auto_777 ?auto_776 ) ) ( not ( = ?auto_767 ?auto_777 ) ) ( not ( = ?auto_768 ?auto_777 ) ) ( not ( = ?auto_775 ?auto_777 ) ) ( not ( = ?auto_773 ?auto_777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_777 ?auto_776 )
      ( MAKE-2CRATE ?auto_776 ?auto_767 ?auto_768 )
      ( MAKE-1CRATE-VERIFY ?auto_767 ?auto_768 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_778 - SURFACE
      ?auto_779 - SURFACE
      ?auto_780 - SURFACE
    )
    :vars
    (
      ?auto_783 - HOIST
      ?auto_787 - PLACE
      ?auto_782 - PLACE
      ?auto_785 - HOIST
      ?auto_788 - SURFACE
      ?auto_784 - SURFACE
      ?auto_781 - TRUCK
      ?auto_786 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_783 ?auto_787 ) ( IS-CRATE ?auto_780 ) ( not ( = ?auto_779 ?auto_780 ) ) ( not ( = ?auto_778 ?auto_779 ) ) ( not ( = ?auto_778 ?auto_780 ) ) ( not ( = ?auto_782 ?auto_787 ) ) ( HOIST-AT ?auto_785 ?auto_782 ) ( not ( = ?auto_783 ?auto_785 ) ) ( SURFACE-AT ?auto_780 ?auto_782 ) ( ON ?auto_780 ?auto_788 ) ( CLEAR ?auto_780 ) ( not ( = ?auto_779 ?auto_788 ) ) ( not ( = ?auto_780 ?auto_788 ) ) ( not ( = ?auto_778 ?auto_788 ) ) ( IS-CRATE ?auto_779 ) ( AVAILABLE ?auto_785 ) ( SURFACE-AT ?auto_779 ?auto_782 ) ( ON ?auto_779 ?auto_784 ) ( CLEAR ?auto_779 ) ( not ( = ?auto_779 ?auto_784 ) ) ( not ( = ?auto_780 ?auto_784 ) ) ( not ( = ?auto_778 ?auto_784 ) ) ( not ( = ?auto_788 ?auto_784 ) ) ( TRUCK-AT ?auto_781 ?auto_787 ) ( SURFACE-AT ?auto_786 ?auto_787 ) ( CLEAR ?auto_786 ) ( LIFTING ?auto_783 ?auto_778 ) ( IS-CRATE ?auto_778 ) ( not ( = ?auto_786 ?auto_778 ) ) ( not ( = ?auto_779 ?auto_786 ) ) ( not ( = ?auto_780 ?auto_786 ) ) ( not ( = ?auto_788 ?auto_786 ) ) ( not ( = ?auto_784 ?auto_786 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_779 ?auto_780 )
      ( MAKE-2CRATE-VERIFY ?auto_778 ?auto_779 ?auto_780 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_789 - SURFACE
      ?auto_790 - SURFACE
      ?auto_791 - SURFACE
      ?auto_792 - SURFACE
    )
    :vars
    (
      ?auto_793 - HOIST
      ?auto_798 - PLACE
      ?auto_799 - PLACE
      ?auto_794 - HOIST
      ?auto_796 - SURFACE
      ?auto_795 - SURFACE
      ?auto_797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_793 ?auto_798 ) ( IS-CRATE ?auto_792 ) ( not ( = ?auto_791 ?auto_792 ) ) ( not ( = ?auto_790 ?auto_791 ) ) ( not ( = ?auto_790 ?auto_792 ) ) ( not ( = ?auto_799 ?auto_798 ) ) ( HOIST-AT ?auto_794 ?auto_799 ) ( not ( = ?auto_793 ?auto_794 ) ) ( SURFACE-AT ?auto_792 ?auto_799 ) ( ON ?auto_792 ?auto_796 ) ( CLEAR ?auto_792 ) ( not ( = ?auto_791 ?auto_796 ) ) ( not ( = ?auto_792 ?auto_796 ) ) ( not ( = ?auto_790 ?auto_796 ) ) ( IS-CRATE ?auto_791 ) ( AVAILABLE ?auto_794 ) ( SURFACE-AT ?auto_791 ?auto_799 ) ( ON ?auto_791 ?auto_795 ) ( CLEAR ?auto_791 ) ( not ( = ?auto_791 ?auto_795 ) ) ( not ( = ?auto_792 ?auto_795 ) ) ( not ( = ?auto_790 ?auto_795 ) ) ( not ( = ?auto_796 ?auto_795 ) ) ( TRUCK-AT ?auto_797 ?auto_798 ) ( SURFACE-AT ?auto_789 ?auto_798 ) ( CLEAR ?auto_789 ) ( LIFTING ?auto_793 ?auto_790 ) ( IS-CRATE ?auto_790 ) ( not ( = ?auto_789 ?auto_790 ) ) ( not ( = ?auto_791 ?auto_789 ) ) ( not ( = ?auto_792 ?auto_789 ) ) ( not ( = ?auto_796 ?auto_789 ) ) ( not ( = ?auto_795 ?auto_789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_790 ?auto_791 ?auto_792 )
      ( MAKE-3CRATE-VERIFY ?auto_789 ?auto_790 ?auto_791 ?auto_792 ) )
  )

)

