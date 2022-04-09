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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245 - SURFACE
      ?auto_246 - SURFACE
    )
    :vars
    (
      ?auto_247 - HOIST
      ?auto_248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_247 ?auto_248 ) ( SURFACE-AT ?auto_245 ?auto_248 ) ( CLEAR ?auto_245 ) ( LIFTING ?auto_247 ?auto_246 ) ( IS-CRATE ?auto_246 ) ( not ( = ?auto_245 ?auto_246 ) ) )
    :subtasks
    ( ( !DROP ?auto_247 ?auto_246 ?auto_245 ?auto_248 )
      ( MAKE-1CRATE-VERIFY ?auto_245 ?auto_246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_249 - SURFACE
      ?auto_250 - SURFACE
    )
    :vars
    (
      ?auto_251 - HOIST
      ?auto_252 - PLACE
      ?auto_253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251 ?auto_252 ) ( SURFACE-AT ?auto_249 ?auto_252 ) ( CLEAR ?auto_249 ) ( IS-CRATE ?auto_250 ) ( not ( = ?auto_249 ?auto_250 ) ) ( TRUCK-AT ?auto_253 ?auto_252 ) ( AVAILABLE ?auto_251 ) ( IN ?auto_250 ?auto_253 ) )
    :subtasks
    ( ( !UNLOAD ?auto_251 ?auto_250 ?auto_253 ?auto_252 )
      ( MAKE-1CRATE ?auto_249 ?auto_250 )
      ( MAKE-1CRATE-VERIFY ?auto_249 ?auto_250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_254 - SURFACE
      ?auto_255 - SURFACE
    )
    :vars
    (
      ?auto_257 - HOIST
      ?auto_256 - PLACE
      ?auto_258 - TRUCK
      ?auto_259 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_257 ?auto_256 ) ( SURFACE-AT ?auto_254 ?auto_256 ) ( CLEAR ?auto_254 ) ( IS-CRATE ?auto_255 ) ( not ( = ?auto_254 ?auto_255 ) ) ( AVAILABLE ?auto_257 ) ( IN ?auto_255 ?auto_258 ) ( TRUCK-AT ?auto_258 ?auto_259 ) ( not ( = ?auto_259 ?auto_256 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_258 ?auto_259 ?auto_256 )
      ( MAKE-1CRATE ?auto_254 ?auto_255 )
      ( MAKE-1CRATE-VERIFY ?auto_254 ?auto_255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_260 - SURFACE
      ?auto_261 - SURFACE
    )
    :vars
    (
      ?auto_262 - HOIST
      ?auto_263 - PLACE
      ?auto_265 - TRUCK
      ?auto_264 - PLACE
      ?auto_266 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_262 ?auto_263 ) ( SURFACE-AT ?auto_260 ?auto_263 ) ( CLEAR ?auto_260 ) ( IS-CRATE ?auto_261 ) ( not ( = ?auto_260 ?auto_261 ) ) ( AVAILABLE ?auto_262 ) ( TRUCK-AT ?auto_265 ?auto_264 ) ( not ( = ?auto_264 ?auto_263 ) ) ( HOIST-AT ?auto_266 ?auto_264 ) ( LIFTING ?auto_266 ?auto_261 ) ( not ( = ?auto_262 ?auto_266 ) ) )
    :subtasks
    ( ( !LOAD ?auto_266 ?auto_261 ?auto_265 ?auto_264 )
      ( MAKE-1CRATE ?auto_260 ?auto_261 )
      ( MAKE-1CRATE-VERIFY ?auto_260 ?auto_261 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_267 - SURFACE
      ?auto_268 - SURFACE
    )
    :vars
    (
      ?auto_272 - HOIST
      ?auto_270 - PLACE
      ?auto_271 - TRUCK
      ?auto_269 - PLACE
      ?auto_273 - HOIST
      ?auto_274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_272 ?auto_270 ) ( SURFACE-AT ?auto_267 ?auto_270 ) ( CLEAR ?auto_267 ) ( IS-CRATE ?auto_268 ) ( not ( = ?auto_267 ?auto_268 ) ) ( AVAILABLE ?auto_272 ) ( TRUCK-AT ?auto_271 ?auto_269 ) ( not ( = ?auto_269 ?auto_270 ) ) ( HOIST-AT ?auto_273 ?auto_269 ) ( not ( = ?auto_272 ?auto_273 ) ) ( AVAILABLE ?auto_273 ) ( SURFACE-AT ?auto_268 ?auto_269 ) ( ON ?auto_268 ?auto_274 ) ( CLEAR ?auto_268 ) ( not ( = ?auto_267 ?auto_274 ) ) ( not ( = ?auto_268 ?auto_274 ) ) )
    :subtasks
    ( ( !LIFT ?auto_273 ?auto_268 ?auto_274 ?auto_269 )
      ( MAKE-1CRATE ?auto_267 ?auto_268 )
      ( MAKE-1CRATE-VERIFY ?auto_267 ?auto_268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_275 - SURFACE
      ?auto_276 - SURFACE
    )
    :vars
    (
      ?auto_282 - HOIST
      ?auto_278 - PLACE
      ?auto_279 - PLACE
      ?auto_281 - HOIST
      ?auto_277 - SURFACE
      ?auto_280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_282 ?auto_278 ) ( SURFACE-AT ?auto_275 ?auto_278 ) ( CLEAR ?auto_275 ) ( IS-CRATE ?auto_276 ) ( not ( = ?auto_275 ?auto_276 ) ) ( AVAILABLE ?auto_282 ) ( not ( = ?auto_279 ?auto_278 ) ) ( HOIST-AT ?auto_281 ?auto_279 ) ( not ( = ?auto_282 ?auto_281 ) ) ( AVAILABLE ?auto_281 ) ( SURFACE-AT ?auto_276 ?auto_279 ) ( ON ?auto_276 ?auto_277 ) ( CLEAR ?auto_276 ) ( not ( = ?auto_275 ?auto_277 ) ) ( not ( = ?auto_276 ?auto_277 ) ) ( TRUCK-AT ?auto_280 ?auto_278 ) )
    :subtasks
    ( ( !DRIVE ?auto_280 ?auto_278 ?auto_279 )
      ( MAKE-1CRATE ?auto_275 ?auto_276 )
      ( MAKE-1CRATE-VERIFY ?auto_275 ?auto_276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_288 - SURFACE
      ?auto_289 - SURFACE
    )
    :vars
    (
      ?auto_290 - HOIST
      ?auto_291 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_290 ?auto_291 ) ( SURFACE-AT ?auto_288 ?auto_291 ) ( CLEAR ?auto_288 ) ( LIFTING ?auto_290 ?auto_289 ) ( IS-CRATE ?auto_289 ) ( not ( = ?auto_288 ?auto_289 ) ) )
    :subtasks
    ( ( !DROP ?auto_290 ?auto_289 ?auto_288 ?auto_291 )
      ( MAKE-1CRATE-VERIFY ?auto_288 ?auto_289 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_292 - SURFACE
      ?auto_293 - SURFACE
      ?auto_294 - SURFACE
    )
    :vars
    (
      ?auto_296 - HOIST
      ?auto_295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_296 ?auto_295 ) ( SURFACE-AT ?auto_293 ?auto_295 ) ( CLEAR ?auto_293 ) ( LIFTING ?auto_296 ?auto_294 ) ( IS-CRATE ?auto_294 ) ( not ( = ?auto_293 ?auto_294 ) ) ( ON ?auto_293 ?auto_292 ) ( not ( = ?auto_292 ?auto_293 ) ) ( not ( = ?auto_292 ?auto_294 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_293 ?auto_294 )
      ( MAKE-2CRATE-VERIFY ?auto_292 ?auto_293 ?auto_294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_297 - SURFACE
      ?auto_298 - SURFACE
    )
    :vars
    (
      ?auto_300 - HOIST
      ?auto_299 - PLACE
      ?auto_301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_300 ?auto_299 ) ( SURFACE-AT ?auto_297 ?auto_299 ) ( CLEAR ?auto_297 ) ( IS-CRATE ?auto_298 ) ( not ( = ?auto_297 ?auto_298 ) ) ( TRUCK-AT ?auto_301 ?auto_299 ) ( AVAILABLE ?auto_300 ) ( IN ?auto_298 ?auto_301 ) )
    :subtasks
    ( ( !UNLOAD ?auto_300 ?auto_298 ?auto_301 ?auto_299 )
      ( MAKE-1CRATE ?auto_297 ?auto_298 )
      ( MAKE-1CRATE-VERIFY ?auto_297 ?auto_298 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_302 - SURFACE
      ?auto_303 - SURFACE
      ?auto_304 - SURFACE
    )
    :vars
    (
      ?auto_306 - HOIST
      ?auto_307 - PLACE
      ?auto_305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_306 ?auto_307 ) ( SURFACE-AT ?auto_303 ?auto_307 ) ( CLEAR ?auto_303 ) ( IS-CRATE ?auto_304 ) ( not ( = ?auto_303 ?auto_304 ) ) ( TRUCK-AT ?auto_305 ?auto_307 ) ( AVAILABLE ?auto_306 ) ( IN ?auto_304 ?auto_305 ) ( ON ?auto_303 ?auto_302 ) ( not ( = ?auto_302 ?auto_303 ) ) ( not ( = ?auto_302 ?auto_304 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_303 ?auto_304 )
      ( MAKE-2CRATE-VERIFY ?auto_302 ?auto_303 ?auto_304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_308 - SURFACE
      ?auto_309 - SURFACE
    )
    :vars
    (
      ?auto_313 - HOIST
      ?auto_310 - PLACE
      ?auto_311 - TRUCK
      ?auto_312 - SURFACE
      ?auto_314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_313 ?auto_310 ) ( SURFACE-AT ?auto_308 ?auto_310 ) ( CLEAR ?auto_308 ) ( IS-CRATE ?auto_309 ) ( not ( = ?auto_308 ?auto_309 ) ) ( AVAILABLE ?auto_313 ) ( IN ?auto_309 ?auto_311 ) ( ON ?auto_308 ?auto_312 ) ( not ( = ?auto_312 ?auto_308 ) ) ( not ( = ?auto_312 ?auto_309 ) ) ( TRUCK-AT ?auto_311 ?auto_314 ) ( not ( = ?auto_314 ?auto_310 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_311 ?auto_314 ?auto_310 )
      ( MAKE-2CRATE ?auto_312 ?auto_308 ?auto_309 )
      ( MAKE-1CRATE-VERIFY ?auto_308 ?auto_309 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_315 - SURFACE
      ?auto_316 - SURFACE
      ?auto_317 - SURFACE
    )
    :vars
    (
      ?auto_321 - HOIST
      ?auto_318 - PLACE
      ?auto_319 - TRUCK
      ?auto_320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321 ?auto_318 ) ( SURFACE-AT ?auto_316 ?auto_318 ) ( CLEAR ?auto_316 ) ( IS-CRATE ?auto_317 ) ( not ( = ?auto_316 ?auto_317 ) ) ( AVAILABLE ?auto_321 ) ( IN ?auto_317 ?auto_319 ) ( ON ?auto_316 ?auto_315 ) ( not ( = ?auto_315 ?auto_316 ) ) ( not ( = ?auto_315 ?auto_317 ) ) ( TRUCK-AT ?auto_319 ?auto_320 ) ( not ( = ?auto_320 ?auto_318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_316 ?auto_317 )
      ( MAKE-2CRATE-VERIFY ?auto_315 ?auto_316 ?auto_317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_322 - SURFACE
      ?auto_323 - SURFACE
    )
    :vars
    (
      ?auto_325 - HOIST
      ?auto_328 - PLACE
      ?auto_324 - SURFACE
      ?auto_326 - TRUCK
      ?auto_327 - PLACE
      ?auto_329 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_325 ?auto_328 ) ( SURFACE-AT ?auto_322 ?auto_328 ) ( CLEAR ?auto_322 ) ( IS-CRATE ?auto_323 ) ( not ( = ?auto_322 ?auto_323 ) ) ( AVAILABLE ?auto_325 ) ( ON ?auto_322 ?auto_324 ) ( not ( = ?auto_324 ?auto_322 ) ) ( not ( = ?auto_324 ?auto_323 ) ) ( TRUCK-AT ?auto_326 ?auto_327 ) ( not ( = ?auto_327 ?auto_328 ) ) ( HOIST-AT ?auto_329 ?auto_327 ) ( LIFTING ?auto_329 ?auto_323 ) ( not ( = ?auto_325 ?auto_329 ) ) )
    :subtasks
    ( ( !LOAD ?auto_329 ?auto_323 ?auto_326 ?auto_327 )
      ( MAKE-2CRATE ?auto_324 ?auto_322 ?auto_323 )
      ( MAKE-1CRATE-VERIFY ?auto_322 ?auto_323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_330 - SURFACE
      ?auto_331 - SURFACE
      ?auto_332 - SURFACE
    )
    :vars
    (
      ?auto_335 - HOIST
      ?auto_334 - PLACE
      ?auto_336 - TRUCK
      ?auto_337 - PLACE
      ?auto_333 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_335 ?auto_334 ) ( SURFACE-AT ?auto_331 ?auto_334 ) ( CLEAR ?auto_331 ) ( IS-CRATE ?auto_332 ) ( not ( = ?auto_331 ?auto_332 ) ) ( AVAILABLE ?auto_335 ) ( ON ?auto_331 ?auto_330 ) ( not ( = ?auto_330 ?auto_331 ) ) ( not ( = ?auto_330 ?auto_332 ) ) ( TRUCK-AT ?auto_336 ?auto_337 ) ( not ( = ?auto_337 ?auto_334 ) ) ( HOIST-AT ?auto_333 ?auto_337 ) ( LIFTING ?auto_333 ?auto_332 ) ( not ( = ?auto_335 ?auto_333 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_331 ?auto_332 )
      ( MAKE-2CRATE-VERIFY ?auto_330 ?auto_331 ?auto_332 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_338 - SURFACE
      ?auto_339 - SURFACE
    )
    :vars
    (
      ?auto_341 - HOIST
      ?auto_340 - PLACE
      ?auto_344 - SURFACE
      ?auto_345 - TRUCK
      ?auto_343 - PLACE
      ?auto_342 - HOIST
      ?auto_346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_341 ?auto_340 ) ( SURFACE-AT ?auto_338 ?auto_340 ) ( CLEAR ?auto_338 ) ( IS-CRATE ?auto_339 ) ( not ( = ?auto_338 ?auto_339 ) ) ( AVAILABLE ?auto_341 ) ( ON ?auto_338 ?auto_344 ) ( not ( = ?auto_344 ?auto_338 ) ) ( not ( = ?auto_344 ?auto_339 ) ) ( TRUCK-AT ?auto_345 ?auto_343 ) ( not ( = ?auto_343 ?auto_340 ) ) ( HOIST-AT ?auto_342 ?auto_343 ) ( not ( = ?auto_341 ?auto_342 ) ) ( AVAILABLE ?auto_342 ) ( SURFACE-AT ?auto_339 ?auto_343 ) ( ON ?auto_339 ?auto_346 ) ( CLEAR ?auto_339 ) ( not ( = ?auto_338 ?auto_346 ) ) ( not ( = ?auto_339 ?auto_346 ) ) ( not ( = ?auto_344 ?auto_346 ) ) )
    :subtasks
    ( ( !LIFT ?auto_342 ?auto_339 ?auto_346 ?auto_343 )
      ( MAKE-2CRATE ?auto_344 ?auto_338 ?auto_339 )
      ( MAKE-1CRATE-VERIFY ?auto_338 ?auto_339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347 - SURFACE
      ?auto_348 - SURFACE
      ?auto_349 - SURFACE
    )
    :vars
    (
      ?auto_351 - HOIST
      ?auto_353 - PLACE
      ?auto_355 - TRUCK
      ?auto_352 - PLACE
      ?auto_350 - HOIST
      ?auto_354 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_351 ?auto_353 ) ( SURFACE-AT ?auto_348 ?auto_353 ) ( CLEAR ?auto_348 ) ( IS-CRATE ?auto_349 ) ( not ( = ?auto_348 ?auto_349 ) ) ( AVAILABLE ?auto_351 ) ( ON ?auto_348 ?auto_347 ) ( not ( = ?auto_347 ?auto_348 ) ) ( not ( = ?auto_347 ?auto_349 ) ) ( TRUCK-AT ?auto_355 ?auto_352 ) ( not ( = ?auto_352 ?auto_353 ) ) ( HOIST-AT ?auto_350 ?auto_352 ) ( not ( = ?auto_351 ?auto_350 ) ) ( AVAILABLE ?auto_350 ) ( SURFACE-AT ?auto_349 ?auto_352 ) ( ON ?auto_349 ?auto_354 ) ( CLEAR ?auto_349 ) ( not ( = ?auto_348 ?auto_354 ) ) ( not ( = ?auto_349 ?auto_354 ) ) ( not ( = ?auto_347 ?auto_354 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348 ?auto_349 )
      ( MAKE-2CRATE-VERIFY ?auto_347 ?auto_348 ?auto_349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_356 - SURFACE
      ?auto_357 - SURFACE
    )
    :vars
    (
      ?auto_362 - HOIST
      ?auto_360 - PLACE
      ?auto_358 - SURFACE
      ?auto_364 - PLACE
      ?auto_359 - HOIST
      ?auto_361 - SURFACE
      ?auto_363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362 ?auto_360 ) ( SURFACE-AT ?auto_356 ?auto_360 ) ( CLEAR ?auto_356 ) ( IS-CRATE ?auto_357 ) ( not ( = ?auto_356 ?auto_357 ) ) ( AVAILABLE ?auto_362 ) ( ON ?auto_356 ?auto_358 ) ( not ( = ?auto_358 ?auto_356 ) ) ( not ( = ?auto_358 ?auto_357 ) ) ( not ( = ?auto_364 ?auto_360 ) ) ( HOIST-AT ?auto_359 ?auto_364 ) ( not ( = ?auto_362 ?auto_359 ) ) ( AVAILABLE ?auto_359 ) ( SURFACE-AT ?auto_357 ?auto_364 ) ( ON ?auto_357 ?auto_361 ) ( CLEAR ?auto_357 ) ( not ( = ?auto_356 ?auto_361 ) ) ( not ( = ?auto_357 ?auto_361 ) ) ( not ( = ?auto_358 ?auto_361 ) ) ( TRUCK-AT ?auto_363 ?auto_360 ) )
    :subtasks
    ( ( !DRIVE ?auto_363 ?auto_360 ?auto_364 )
      ( MAKE-2CRATE ?auto_358 ?auto_356 ?auto_357 )
      ( MAKE-1CRATE-VERIFY ?auto_356 ?auto_357 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_365 - SURFACE
      ?auto_366 - SURFACE
      ?auto_367 - SURFACE
    )
    :vars
    (
      ?auto_371 - HOIST
      ?auto_369 - PLACE
      ?auto_370 - PLACE
      ?auto_368 - HOIST
      ?auto_372 - SURFACE
      ?auto_373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_371 ?auto_369 ) ( SURFACE-AT ?auto_366 ?auto_369 ) ( CLEAR ?auto_366 ) ( IS-CRATE ?auto_367 ) ( not ( = ?auto_366 ?auto_367 ) ) ( AVAILABLE ?auto_371 ) ( ON ?auto_366 ?auto_365 ) ( not ( = ?auto_365 ?auto_366 ) ) ( not ( = ?auto_365 ?auto_367 ) ) ( not ( = ?auto_370 ?auto_369 ) ) ( HOIST-AT ?auto_368 ?auto_370 ) ( not ( = ?auto_371 ?auto_368 ) ) ( AVAILABLE ?auto_368 ) ( SURFACE-AT ?auto_367 ?auto_370 ) ( ON ?auto_367 ?auto_372 ) ( CLEAR ?auto_367 ) ( not ( = ?auto_366 ?auto_372 ) ) ( not ( = ?auto_367 ?auto_372 ) ) ( not ( = ?auto_365 ?auto_372 ) ) ( TRUCK-AT ?auto_373 ?auto_369 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_366 ?auto_367 )
      ( MAKE-2CRATE-VERIFY ?auto_365 ?auto_366 ?auto_367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_374 - SURFACE
      ?auto_375 - SURFACE
    )
    :vars
    (
      ?auto_378 - HOIST
      ?auto_382 - PLACE
      ?auto_377 - SURFACE
      ?auto_380 - PLACE
      ?auto_381 - HOIST
      ?auto_379 - SURFACE
      ?auto_376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_378 ?auto_382 ) ( IS-CRATE ?auto_375 ) ( not ( = ?auto_374 ?auto_375 ) ) ( not ( = ?auto_377 ?auto_374 ) ) ( not ( = ?auto_377 ?auto_375 ) ) ( not ( = ?auto_380 ?auto_382 ) ) ( HOIST-AT ?auto_381 ?auto_380 ) ( not ( = ?auto_378 ?auto_381 ) ) ( AVAILABLE ?auto_381 ) ( SURFACE-AT ?auto_375 ?auto_380 ) ( ON ?auto_375 ?auto_379 ) ( CLEAR ?auto_375 ) ( not ( = ?auto_374 ?auto_379 ) ) ( not ( = ?auto_375 ?auto_379 ) ) ( not ( = ?auto_377 ?auto_379 ) ) ( TRUCK-AT ?auto_376 ?auto_382 ) ( SURFACE-AT ?auto_377 ?auto_382 ) ( CLEAR ?auto_377 ) ( LIFTING ?auto_378 ?auto_374 ) ( IS-CRATE ?auto_374 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_377 ?auto_374 )
      ( MAKE-2CRATE ?auto_377 ?auto_374 ?auto_375 )
      ( MAKE-1CRATE-VERIFY ?auto_374 ?auto_375 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_383 - SURFACE
      ?auto_384 - SURFACE
      ?auto_385 - SURFACE
    )
    :vars
    (
      ?auto_388 - HOIST
      ?auto_389 - PLACE
      ?auto_386 - PLACE
      ?auto_391 - HOIST
      ?auto_390 - SURFACE
      ?auto_387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_388 ?auto_389 ) ( IS-CRATE ?auto_385 ) ( not ( = ?auto_384 ?auto_385 ) ) ( not ( = ?auto_383 ?auto_384 ) ) ( not ( = ?auto_383 ?auto_385 ) ) ( not ( = ?auto_386 ?auto_389 ) ) ( HOIST-AT ?auto_391 ?auto_386 ) ( not ( = ?auto_388 ?auto_391 ) ) ( AVAILABLE ?auto_391 ) ( SURFACE-AT ?auto_385 ?auto_386 ) ( ON ?auto_385 ?auto_390 ) ( CLEAR ?auto_385 ) ( not ( = ?auto_384 ?auto_390 ) ) ( not ( = ?auto_385 ?auto_390 ) ) ( not ( = ?auto_383 ?auto_390 ) ) ( TRUCK-AT ?auto_387 ?auto_389 ) ( SURFACE-AT ?auto_383 ?auto_389 ) ( CLEAR ?auto_383 ) ( LIFTING ?auto_388 ?auto_384 ) ( IS-CRATE ?auto_384 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_384 ?auto_385 )
      ( MAKE-2CRATE-VERIFY ?auto_383 ?auto_384 ?auto_385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_392 - SURFACE
      ?auto_393 - SURFACE
    )
    :vars
    (
      ?auto_396 - HOIST
      ?auto_395 - PLACE
      ?auto_397 - SURFACE
      ?auto_399 - PLACE
      ?auto_400 - HOIST
      ?auto_398 - SURFACE
      ?auto_394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_396 ?auto_395 ) ( IS-CRATE ?auto_393 ) ( not ( = ?auto_392 ?auto_393 ) ) ( not ( = ?auto_397 ?auto_392 ) ) ( not ( = ?auto_397 ?auto_393 ) ) ( not ( = ?auto_399 ?auto_395 ) ) ( HOIST-AT ?auto_400 ?auto_399 ) ( not ( = ?auto_396 ?auto_400 ) ) ( AVAILABLE ?auto_400 ) ( SURFACE-AT ?auto_393 ?auto_399 ) ( ON ?auto_393 ?auto_398 ) ( CLEAR ?auto_393 ) ( not ( = ?auto_392 ?auto_398 ) ) ( not ( = ?auto_393 ?auto_398 ) ) ( not ( = ?auto_397 ?auto_398 ) ) ( TRUCK-AT ?auto_394 ?auto_395 ) ( SURFACE-AT ?auto_397 ?auto_395 ) ( CLEAR ?auto_397 ) ( IS-CRATE ?auto_392 ) ( AVAILABLE ?auto_396 ) ( IN ?auto_392 ?auto_394 ) )
    :subtasks
    ( ( !UNLOAD ?auto_396 ?auto_392 ?auto_394 ?auto_395 )
      ( MAKE-2CRATE ?auto_397 ?auto_392 ?auto_393 )
      ( MAKE-1CRATE-VERIFY ?auto_392 ?auto_393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_401 - SURFACE
      ?auto_402 - SURFACE
      ?auto_403 - SURFACE
    )
    :vars
    (
      ?auto_408 - HOIST
      ?auto_405 - PLACE
      ?auto_407 - PLACE
      ?auto_406 - HOIST
      ?auto_404 - SURFACE
      ?auto_409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_408 ?auto_405 ) ( IS-CRATE ?auto_403 ) ( not ( = ?auto_402 ?auto_403 ) ) ( not ( = ?auto_401 ?auto_402 ) ) ( not ( = ?auto_401 ?auto_403 ) ) ( not ( = ?auto_407 ?auto_405 ) ) ( HOIST-AT ?auto_406 ?auto_407 ) ( not ( = ?auto_408 ?auto_406 ) ) ( AVAILABLE ?auto_406 ) ( SURFACE-AT ?auto_403 ?auto_407 ) ( ON ?auto_403 ?auto_404 ) ( CLEAR ?auto_403 ) ( not ( = ?auto_402 ?auto_404 ) ) ( not ( = ?auto_403 ?auto_404 ) ) ( not ( = ?auto_401 ?auto_404 ) ) ( TRUCK-AT ?auto_409 ?auto_405 ) ( SURFACE-AT ?auto_401 ?auto_405 ) ( CLEAR ?auto_401 ) ( IS-CRATE ?auto_402 ) ( AVAILABLE ?auto_408 ) ( IN ?auto_402 ?auto_409 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402 ?auto_403 )
      ( MAKE-2CRATE-VERIFY ?auto_401 ?auto_402 ?auto_403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_410 - SURFACE
      ?auto_411 - SURFACE
    )
    :vars
    (
      ?auto_418 - HOIST
      ?auto_417 - PLACE
      ?auto_414 - SURFACE
      ?auto_412 - PLACE
      ?auto_415 - HOIST
      ?auto_416 - SURFACE
      ?auto_413 - TRUCK
      ?auto_419 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_418 ?auto_417 ) ( IS-CRATE ?auto_411 ) ( not ( = ?auto_410 ?auto_411 ) ) ( not ( = ?auto_414 ?auto_410 ) ) ( not ( = ?auto_414 ?auto_411 ) ) ( not ( = ?auto_412 ?auto_417 ) ) ( HOIST-AT ?auto_415 ?auto_412 ) ( not ( = ?auto_418 ?auto_415 ) ) ( AVAILABLE ?auto_415 ) ( SURFACE-AT ?auto_411 ?auto_412 ) ( ON ?auto_411 ?auto_416 ) ( CLEAR ?auto_411 ) ( not ( = ?auto_410 ?auto_416 ) ) ( not ( = ?auto_411 ?auto_416 ) ) ( not ( = ?auto_414 ?auto_416 ) ) ( SURFACE-AT ?auto_414 ?auto_417 ) ( CLEAR ?auto_414 ) ( IS-CRATE ?auto_410 ) ( AVAILABLE ?auto_418 ) ( IN ?auto_410 ?auto_413 ) ( TRUCK-AT ?auto_413 ?auto_419 ) ( not ( = ?auto_419 ?auto_417 ) ) ( not ( = ?auto_412 ?auto_419 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_413 ?auto_419 ?auto_417 )
      ( MAKE-2CRATE ?auto_414 ?auto_410 ?auto_411 )
      ( MAKE-1CRATE-VERIFY ?auto_410 ?auto_411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_420 - SURFACE
      ?auto_421 - SURFACE
      ?auto_422 - SURFACE
    )
    :vars
    (
      ?auto_427 - HOIST
      ?auto_429 - PLACE
      ?auto_425 - PLACE
      ?auto_428 - HOIST
      ?auto_424 - SURFACE
      ?auto_423 - TRUCK
      ?auto_426 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_427 ?auto_429 ) ( IS-CRATE ?auto_422 ) ( not ( = ?auto_421 ?auto_422 ) ) ( not ( = ?auto_420 ?auto_421 ) ) ( not ( = ?auto_420 ?auto_422 ) ) ( not ( = ?auto_425 ?auto_429 ) ) ( HOIST-AT ?auto_428 ?auto_425 ) ( not ( = ?auto_427 ?auto_428 ) ) ( AVAILABLE ?auto_428 ) ( SURFACE-AT ?auto_422 ?auto_425 ) ( ON ?auto_422 ?auto_424 ) ( CLEAR ?auto_422 ) ( not ( = ?auto_421 ?auto_424 ) ) ( not ( = ?auto_422 ?auto_424 ) ) ( not ( = ?auto_420 ?auto_424 ) ) ( SURFACE-AT ?auto_420 ?auto_429 ) ( CLEAR ?auto_420 ) ( IS-CRATE ?auto_421 ) ( AVAILABLE ?auto_427 ) ( IN ?auto_421 ?auto_423 ) ( TRUCK-AT ?auto_423 ?auto_426 ) ( not ( = ?auto_426 ?auto_429 ) ) ( not ( = ?auto_425 ?auto_426 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_421 ?auto_422 )
      ( MAKE-2CRATE-VERIFY ?auto_420 ?auto_421 ?auto_422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_430 - SURFACE
      ?auto_431 - SURFACE
    )
    :vars
    (
      ?auto_437 - HOIST
      ?auto_433 - PLACE
      ?auto_432 - SURFACE
      ?auto_434 - PLACE
      ?auto_438 - HOIST
      ?auto_435 - SURFACE
      ?auto_436 - TRUCK
      ?auto_439 - PLACE
      ?auto_440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_437 ?auto_433 ) ( IS-CRATE ?auto_431 ) ( not ( = ?auto_430 ?auto_431 ) ) ( not ( = ?auto_432 ?auto_430 ) ) ( not ( = ?auto_432 ?auto_431 ) ) ( not ( = ?auto_434 ?auto_433 ) ) ( HOIST-AT ?auto_438 ?auto_434 ) ( not ( = ?auto_437 ?auto_438 ) ) ( AVAILABLE ?auto_438 ) ( SURFACE-AT ?auto_431 ?auto_434 ) ( ON ?auto_431 ?auto_435 ) ( CLEAR ?auto_431 ) ( not ( = ?auto_430 ?auto_435 ) ) ( not ( = ?auto_431 ?auto_435 ) ) ( not ( = ?auto_432 ?auto_435 ) ) ( SURFACE-AT ?auto_432 ?auto_433 ) ( CLEAR ?auto_432 ) ( IS-CRATE ?auto_430 ) ( AVAILABLE ?auto_437 ) ( TRUCK-AT ?auto_436 ?auto_439 ) ( not ( = ?auto_439 ?auto_433 ) ) ( not ( = ?auto_434 ?auto_439 ) ) ( HOIST-AT ?auto_440 ?auto_439 ) ( LIFTING ?auto_440 ?auto_430 ) ( not ( = ?auto_437 ?auto_440 ) ) ( not ( = ?auto_438 ?auto_440 ) ) )
    :subtasks
    ( ( !LOAD ?auto_440 ?auto_430 ?auto_436 ?auto_439 )
      ( MAKE-2CRATE ?auto_432 ?auto_430 ?auto_431 )
      ( MAKE-1CRATE-VERIFY ?auto_430 ?auto_431 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441 - SURFACE
      ?auto_442 - SURFACE
      ?auto_443 - SURFACE
    )
    :vars
    (
      ?auto_448 - HOIST
      ?auto_444 - PLACE
      ?auto_445 - PLACE
      ?auto_451 - HOIST
      ?auto_447 - SURFACE
      ?auto_449 - TRUCK
      ?auto_450 - PLACE
      ?auto_446 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_448 ?auto_444 ) ( IS-CRATE ?auto_443 ) ( not ( = ?auto_442 ?auto_443 ) ) ( not ( = ?auto_441 ?auto_442 ) ) ( not ( = ?auto_441 ?auto_443 ) ) ( not ( = ?auto_445 ?auto_444 ) ) ( HOIST-AT ?auto_451 ?auto_445 ) ( not ( = ?auto_448 ?auto_451 ) ) ( AVAILABLE ?auto_451 ) ( SURFACE-AT ?auto_443 ?auto_445 ) ( ON ?auto_443 ?auto_447 ) ( CLEAR ?auto_443 ) ( not ( = ?auto_442 ?auto_447 ) ) ( not ( = ?auto_443 ?auto_447 ) ) ( not ( = ?auto_441 ?auto_447 ) ) ( SURFACE-AT ?auto_441 ?auto_444 ) ( CLEAR ?auto_441 ) ( IS-CRATE ?auto_442 ) ( AVAILABLE ?auto_448 ) ( TRUCK-AT ?auto_449 ?auto_450 ) ( not ( = ?auto_450 ?auto_444 ) ) ( not ( = ?auto_445 ?auto_450 ) ) ( HOIST-AT ?auto_446 ?auto_450 ) ( LIFTING ?auto_446 ?auto_442 ) ( not ( = ?auto_448 ?auto_446 ) ) ( not ( = ?auto_451 ?auto_446 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442 ?auto_443 )
      ( MAKE-2CRATE-VERIFY ?auto_441 ?auto_442 ?auto_443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_452 - SURFACE
      ?auto_453 - SURFACE
    )
    :vars
    (
      ?auto_461 - HOIST
      ?auto_462 - PLACE
      ?auto_459 - SURFACE
      ?auto_456 - PLACE
      ?auto_460 - HOIST
      ?auto_458 - SURFACE
      ?auto_454 - TRUCK
      ?auto_455 - PLACE
      ?auto_457 - HOIST
      ?auto_463 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461 ?auto_462 ) ( IS-CRATE ?auto_453 ) ( not ( = ?auto_452 ?auto_453 ) ) ( not ( = ?auto_459 ?auto_452 ) ) ( not ( = ?auto_459 ?auto_453 ) ) ( not ( = ?auto_456 ?auto_462 ) ) ( HOIST-AT ?auto_460 ?auto_456 ) ( not ( = ?auto_461 ?auto_460 ) ) ( AVAILABLE ?auto_460 ) ( SURFACE-AT ?auto_453 ?auto_456 ) ( ON ?auto_453 ?auto_458 ) ( CLEAR ?auto_453 ) ( not ( = ?auto_452 ?auto_458 ) ) ( not ( = ?auto_453 ?auto_458 ) ) ( not ( = ?auto_459 ?auto_458 ) ) ( SURFACE-AT ?auto_459 ?auto_462 ) ( CLEAR ?auto_459 ) ( IS-CRATE ?auto_452 ) ( AVAILABLE ?auto_461 ) ( TRUCK-AT ?auto_454 ?auto_455 ) ( not ( = ?auto_455 ?auto_462 ) ) ( not ( = ?auto_456 ?auto_455 ) ) ( HOIST-AT ?auto_457 ?auto_455 ) ( not ( = ?auto_461 ?auto_457 ) ) ( not ( = ?auto_460 ?auto_457 ) ) ( AVAILABLE ?auto_457 ) ( SURFACE-AT ?auto_452 ?auto_455 ) ( ON ?auto_452 ?auto_463 ) ( CLEAR ?auto_452 ) ( not ( = ?auto_452 ?auto_463 ) ) ( not ( = ?auto_453 ?auto_463 ) ) ( not ( = ?auto_459 ?auto_463 ) ) ( not ( = ?auto_458 ?auto_463 ) ) )
    :subtasks
    ( ( !LIFT ?auto_457 ?auto_452 ?auto_463 ?auto_455 )
      ( MAKE-2CRATE ?auto_459 ?auto_452 ?auto_453 )
      ( MAKE-1CRATE-VERIFY ?auto_452 ?auto_453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_464 - SURFACE
      ?auto_465 - SURFACE
      ?auto_466 - SURFACE
    )
    :vars
    (
      ?auto_471 - HOIST
      ?auto_470 - PLACE
      ?auto_467 - PLACE
      ?auto_474 - HOIST
      ?auto_472 - SURFACE
      ?auto_473 - TRUCK
      ?auto_469 - PLACE
      ?auto_468 - HOIST
      ?auto_475 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_471 ?auto_470 ) ( IS-CRATE ?auto_466 ) ( not ( = ?auto_465 ?auto_466 ) ) ( not ( = ?auto_464 ?auto_465 ) ) ( not ( = ?auto_464 ?auto_466 ) ) ( not ( = ?auto_467 ?auto_470 ) ) ( HOIST-AT ?auto_474 ?auto_467 ) ( not ( = ?auto_471 ?auto_474 ) ) ( AVAILABLE ?auto_474 ) ( SURFACE-AT ?auto_466 ?auto_467 ) ( ON ?auto_466 ?auto_472 ) ( CLEAR ?auto_466 ) ( not ( = ?auto_465 ?auto_472 ) ) ( not ( = ?auto_466 ?auto_472 ) ) ( not ( = ?auto_464 ?auto_472 ) ) ( SURFACE-AT ?auto_464 ?auto_470 ) ( CLEAR ?auto_464 ) ( IS-CRATE ?auto_465 ) ( AVAILABLE ?auto_471 ) ( TRUCK-AT ?auto_473 ?auto_469 ) ( not ( = ?auto_469 ?auto_470 ) ) ( not ( = ?auto_467 ?auto_469 ) ) ( HOIST-AT ?auto_468 ?auto_469 ) ( not ( = ?auto_471 ?auto_468 ) ) ( not ( = ?auto_474 ?auto_468 ) ) ( AVAILABLE ?auto_468 ) ( SURFACE-AT ?auto_465 ?auto_469 ) ( ON ?auto_465 ?auto_475 ) ( CLEAR ?auto_465 ) ( not ( = ?auto_465 ?auto_475 ) ) ( not ( = ?auto_466 ?auto_475 ) ) ( not ( = ?auto_464 ?auto_475 ) ) ( not ( = ?auto_472 ?auto_475 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_465 ?auto_466 )
      ( MAKE-2CRATE-VERIFY ?auto_464 ?auto_465 ?auto_466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_476 - SURFACE
      ?auto_477 - SURFACE
    )
    :vars
    (
      ?auto_486 - HOIST
      ?auto_478 - PLACE
      ?auto_487 - SURFACE
      ?auto_482 - PLACE
      ?auto_480 - HOIST
      ?auto_484 - SURFACE
      ?auto_481 - PLACE
      ?auto_479 - HOIST
      ?auto_485 - SURFACE
      ?auto_483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_486 ?auto_478 ) ( IS-CRATE ?auto_477 ) ( not ( = ?auto_476 ?auto_477 ) ) ( not ( = ?auto_487 ?auto_476 ) ) ( not ( = ?auto_487 ?auto_477 ) ) ( not ( = ?auto_482 ?auto_478 ) ) ( HOIST-AT ?auto_480 ?auto_482 ) ( not ( = ?auto_486 ?auto_480 ) ) ( AVAILABLE ?auto_480 ) ( SURFACE-AT ?auto_477 ?auto_482 ) ( ON ?auto_477 ?auto_484 ) ( CLEAR ?auto_477 ) ( not ( = ?auto_476 ?auto_484 ) ) ( not ( = ?auto_477 ?auto_484 ) ) ( not ( = ?auto_487 ?auto_484 ) ) ( SURFACE-AT ?auto_487 ?auto_478 ) ( CLEAR ?auto_487 ) ( IS-CRATE ?auto_476 ) ( AVAILABLE ?auto_486 ) ( not ( = ?auto_481 ?auto_478 ) ) ( not ( = ?auto_482 ?auto_481 ) ) ( HOIST-AT ?auto_479 ?auto_481 ) ( not ( = ?auto_486 ?auto_479 ) ) ( not ( = ?auto_480 ?auto_479 ) ) ( AVAILABLE ?auto_479 ) ( SURFACE-AT ?auto_476 ?auto_481 ) ( ON ?auto_476 ?auto_485 ) ( CLEAR ?auto_476 ) ( not ( = ?auto_476 ?auto_485 ) ) ( not ( = ?auto_477 ?auto_485 ) ) ( not ( = ?auto_487 ?auto_485 ) ) ( not ( = ?auto_484 ?auto_485 ) ) ( TRUCK-AT ?auto_483 ?auto_478 ) )
    :subtasks
    ( ( !DRIVE ?auto_483 ?auto_478 ?auto_481 )
      ( MAKE-2CRATE ?auto_487 ?auto_476 ?auto_477 )
      ( MAKE-1CRATE-VERIFY ?auto_476 ?auto_477 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_488 - SURFACE
      ?auto_489 - SURFACE
      ?auto_490 - SURFACE
    )
    :vars
    (
      ?auto_491 - HOIST
      ?auto_494 - PLACE
      ?auto_497 - PLACE
      ?auto_498 - HOIST
      ?auto_496 - SURFACE
      ?auto_493 - PLACE
      ?auto_492 - HOIST
      ?auto_495 - SURFACE
      ?auto_499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_491 ?auto_494 ) ( IS-CRATE ?auto_490 ) ( not ( = ?auto_489 ?auto_490 ) ) ( not ( = ?auto_488 ?auto_489 ) ) ( not ( = ?auto_488 ?auto_490 ) ) ( not ( = ?auto_497 ?auto_494 ) ) ( HOIST-AT ?auto_498 ?auto_497 ) ( not ( = ?auto_491 ?auto_498 ) ) ( AVAILABLE ?auto_498 ) ( SURFACE-AT ?auto_490 ?auto_497 ) ( ON ?auto_490 ?auto_496 ) ( CLEAR ?auto_490 ) ( not ( = ?auto_489 ?auto_496 ) ) ( not ( = ?auto_490 ?auto_496 ) ) ( not ( = ?auto_488 ?auto_496 ) ) ( SURFACE-AT ?auto_488 ?auto_494 ) ( CLEAR ?auto_488 ) ( IS-CRATE ?auto_489 ) ( AVAILABLE ?auto_491 ) ( not ( = ?auto_493 ?auto_494 ) ) ( not ( = ?auto_497 ?auto_493 ) ) ( HOIST-AT ?auto_492 ?auto_493 ) ( not ( = ?auto_491 ?auto_492 ) ) ( not ( = ?auto_498 ?auto_492 ) ) ( AVAILABLE ?auto_492 ) ( SURFACE-AT ?auto_489 ?auto_493 ) ( ON ?auto_489 ?auto_495 ) ( CLEAR ?auto_489 ) ( not ( = ?auto_489 ?auto_495 ) ) ( not ( = ?auto_490 ?auto_495 ) ) ( not ( = ?auto_488 ?auto_495 ) ) ( not ( = ?auto_496 ?auto_495 ) ) ( TRUCK-AT ?auto_499 ?auto_494 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_489 ?auto_490 )
      ( MAKE-2CRATE-VERIFY ?auto_488 ?auto_489 ?auto_490 ) )
  )

)

