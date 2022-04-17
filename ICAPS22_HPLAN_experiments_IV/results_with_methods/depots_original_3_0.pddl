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
      ?auto_259 - SURFACE
      ?auto_260 - SURFACE
    )
    :vars
    (
      ?auto_261 - HOIST
      ?auto_262 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_261 ?auto_262 ) ( SURFACE-AT ?auto_259 ?auto_262 ) ( CLEAR ?auto_259 ) ( LIFTING ?auto_261 ?auto_260 ) ( IS-CRATE ?auto_260 ) ( not ( = ?auto_259 ?auto_260 ) ) )
    :subtasks
    ( ( !DROP ?auto_261 ?auto_260 ?auto_259 ?auto_262 )
      ( MAKE-1CRATE-VERIFY ?auto_259 ?auto_260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_263 - SURFACE
      ?auto_264 - SURFACE
    )
    :vars
    (
      ?auto_266 - HOIST
      ?auto_265 - PLACE
      ?auto_267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266 ?auto_265 ) ( SURFACE-AT ?auto_263 ?auto_265 ) ( CLEAR ?auto_263 ) ( IS-CRATE ?auto_264 ) ( not ( = ?auto_263 ?auto_264 ) ) ( TRUCK-AT ?auto_267 ?auto_265 ) ( AVAILABLE ?auto_266 ) ( IN ?auto_264 ?auto_267 ) )
    :subtasks
    ( ( !UNLOAD ?auto_266 ?auto_264 ?auto_267 ?auto_265 )
      ( MAKE-1CRATE ?auto_263 ?auto_264 )
      ( MAKE-1CRATE-VERIFY ?auto_263 ?auto_264 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_268 - SURFACE
      ?auto_269 - SURFACE
    )
    :vars
    (
      ?auto_270 - HOIST
      ?auto_271 - PLACE
      ?auto_272 - TRUCK
      ?auto_273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270 ?auto_271 ) ( SURFACE-AT ?auto_268 ?auto_271 ) ( CLEAR ?auto_268 ) ( IS-CRATE ?auto_269 ) ( not ( = ?auto_268 ?auto_269 ) ) ( AVAILABLE ?auto_270 ) ( IN ?auto_269 ?auto_272 ) ( TRUCK-AT ?auto_272 ?auto_273 ) ( not ( = ?auto_273 ?auto_271 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_272 ?auto_273 ?auto_271 )
      ( MAKE-1CRATE ?auto_268 ?auto_269 )
      ( MAKE-1CRATE-VERIFY ?auto_268 ?auto_269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_274 - SURFACE
      ?auto_275 - SURFACE
    )
    :vars
    (
      ?auto_276 - HOIST
      ?auto_277 - PLACE
      ?auto_278 - TRUCK
      ?auto_279 - PLACE
      ?auto_280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_276 ?auto_277 ) ( SURFACE-AT ?auto_274 ?auto_277 ) ( CLEAR ?auto_274 ) ( IS-CRATE ?auto_275 ) ( not ( = ?auto_274 ?auto_275 ) ) ( AVAILABLE ?auto_276 ) ( TRUCK-AT ?auto_278 ?auto_279 ) ( not ( = ?auto_279 ?auto_277 ) ) ( HOIST-AT ?auto_280 ?auto_279 ) ( LIFTING ?auto_280 ?auto_275 ) ( not ( = ?auto_276 ?auto_280 ) ) )
    :subtasks
    ( ( !LOAD ?auto_280 ?auto_275 ?auto_278 ?auto_279 )
      ( MAKE-1CRATE ?auto_274 ?auto_275 )
      ( MAKE-1CRATE-VERIFY ?auto_274 ?auto_275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_281 - SURFACE
      ?auto_282 - SURFACE
    )
    :vars
    (
      ?auto_283 - HOIST
      ?auto_286 - PLACE
      ?auto_287 - TRUCK
      ?auto_284 - PLACE
      ?auto_285 - HOIST
      ?auto_288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_283 ?auto_286 ) ( SURFACE-AT ?auto_281 ?auto_286 ) ( CLEAR ?auto_281 ) ( IS-CRATE ?auto_282 ) ( not ( = ?auto_281 ?auto_282 ) ) ( AVAILABLE ?auto_283 ) ( TRUCK-AT ?auto_287 ?auto_284 ) ( not ( = ?auto_284 ?auto_286 ) ) ( HOIST-AT ?auto_285 ?auto_284 ) ( not ( = ?auto_283 ?auto_285 ) ) ( AVAILABLE ?auto_285 ) ( SURFACE-AT ?auto_282 ?auto_284 ) ( ON ?auto_282 ?auto_288 ) ( CLEAR ?auto_282 ) ( not ( = ?auto_281 ?auto_288 ) ) ( not ( = ?auto_282 ?auto_288 ) ) )
    :subtasks
    ( ( !LIFT ?auto_285 ?auto_282 ?auto_288 ?auto_284 )
      ( MAKE-1CRATE ?auto_281 ?auto_282 )
      ( MAKE-1CRATE-VERIFY ?auto_281 ?auto_282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_289 - SURFACE
      ?auto_290 - SURFACE
    )
    :vars
    (
      ?auto_292 - HOIST
      ?auto_295 - PLACE
      ?auto_296 - PLACE
      ?auto_294 - HOIST
      ?auto_291 - SURFACE
      ?auto_293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_292 ?auto_295 ) ( SURFACE-AT ?auto_289 ?auto_295 ) ( CLEAR ?auto_289 ) ( IS-CRATE ?auto_290 ) ( not ( = ?auto_289 ?auto_290 ) ) ( AVAILABLE ?auto_292 ) ( not ( = ?auto_296 ?auto_295 ) ) ( HOIST-AT ?auto_294 ?auto_296 ) ( not ( = ?auto_292 ?auto_294 ) ) ( AVAILABLE ?auto_294 ) ( SURFACE-AT ?auto_290 ?auto_296 ) ( ON ?auto_290 ?auto_291 ) ( CLEAR ?auto_290 ) ( not ( = ?auto_289 ?auto_291 ) ) ( not ( = ?auto_290 ?auto_291 ) ) ( TRUCK-AT ?auto_293 ?auto_295 ) )
    :subtasks
    ( ( !DRIVE ?auto_293 ?auto_295 ?auto_296 )
      ( MAKE-1CRATE ?auto_289 ?auto_290 )
      ( MAKE-1CRATE-VERIFY ?auto_289 ?auto_290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_302 - SURFACE
      ?auto_303 - SURFACE
    )
    :vars
    (
      ?auto_304 - HOIST
      ?auto_305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_304 ?auto_305 ) ( SURFACE-AT ?auto_302 ?auto_305 ) ( CLEAR ?auto_302 ) ( LIFTING ?auto_304 ?auto_303 ) ( IS-CRATE ?auto_303 ) ( not ( = ?auto_302 ?auto_303 ) ) )
    :subtasks
    ( ( !DROP ?auto_304 ?auto_303 ?auto_302 ?auto_305 )
      ( MAKE-1CRATE-VERIFY ?auto_302 ?auto_303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_306 - SURFACE
      ?auto_307 - SURFACE
      ?auto_308 - SURFACE
    )
    :vars
    (
      ?auto_309 - HOIST
      ?auto_310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_309 ?auto_310 ) ( SURFACE-AT ?auto_307 ?auto_310 ) ( CLEAR ?auto_307 ) ( LIFTING ?auto_309 ?auto_308 ) ( IS-CRATE ?auto_308 ) ( not ( = ?auto_307 ?auto_308 ) ) ( ON ?auto_307 ?auto_306 ) ( not ( = ?auto_306 ?auto_307 ) ) ( not ( = ?auto_306 ?auto_308 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_307 ?auto_308 )
      ( MAKE-2CRATE-VERIFY ?auto_306 ?auto_307 ?auto_308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_311 - SURFACE
      ?auto_312 - SURFACE
    )
    :vars
    (
      ?auto_313 - HOIST
      ?auto_314 - PLACE
      ?auto_315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313 ?auto_314 ) ( SURFACE-AT ?auto_311 ?auto_314 ) ( CLEAR ?auto_311 ) ( IS-CRATE ?auto_312 ) ( not ( = ?auto_311 ?auto_312 ) ) ( TRUCK-AT ?auto_315 ?auto_314 ) ( AVAILABLE ?auto_313 ) ( IN ?auto_312 ?auto_315 ) )
    :subtasks
    ( ( !UNLOAD ?auto_313 ?auto_312 ?auto_315 ?auto_314 )
      ( MAKE-1CRATE ?auto_311 ?auto_312 )
      ( MAKE-1CRATE-VERIFY ?auto_311 ?auto_312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_316 - SURFACE
      ?auto_317 - SURFACE
      ?auto_318 - SURFACE
    )
    :vars
    (
      ?auto_321 - HOIST
      ?auto_320 - PLACE
      ?auto_319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321 ?auto_320 ) ( SURFACE-AT ?auto_317 ?auto_320 ) ( CLEAR ?auto_317 ) ( IS-CRATE ?auto_318 ) ( not ( = ?auto_317 ?auto_318 ) ) ( TRUCK-AT ?auto_319 ?auto_320 ) ( AVAILABLE ?auto_321 ) ( IN ?auto_318 ?auto_319 ) ( ON ?auto_317 ?auto_316 ) ( not ( = ?auto_316 ?auto_317 ) ) ( not ( = ?auto_316 ?auto_318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_317 ?auto_318 )
      ( MAKE-2CRATE-VERIFY ?auto_316 ?auto_317 ?auto_318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_322 - SURFACE
      ?auto_323 - SURFACE
    )
    :vars
    (
      ?auto_324 - HOIST
      ?auto_327 - PLACE
      ?auto_326 - TRUCK
      ?auto_325 - SURFACE
      ?auto_328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_324 ?auto_327 ) ( SURFACE-AT ?auto_322 ?auto_327 ) ( CLEAR ?auto_322 ) ( IS-CRATE ?auto_323 ) ( not ( = ?auto_322 ?auto_323 ) ) ( AVAILABLE ?auto_324 ) ( IN ?auto_323 ?auto_326 ) ( ON ?auto_322 ?auto_325 ) ( not ( = ?auto_325 ?auto_322 ) ) ( not ( = ?auto_325 ?auto_323 ) ) ( TRUCK-AT ?auto_326 ?auto_328 ) ( not ( = ?auto_328 ?auto_327 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_326 ?auto_328 ?auto_327 )
      ( MAKE-2CRATE ?auto_325 ?auto_322 ?auto_323 )
      ( MAKE-1CRATE-VERIFY ?auto_322 ?auto_323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_329 - SURFACE
      ?auto_330 - SURFACE
      ?auto_331 - SURFACE
    )
    :vars
    (
      ?auto_335 - HOIST
      ?auto_332 - PLACE
      ?auto_334 - TRUCK
      ?auto_333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_335 ?auto_332 ) ( SURFACE-AT ?auto_330 ?auto_332 ) ( CLEAR ?auto_330 ) ( IS-CRATE ?auto_331 ) ( not ( = ?auto_330 ?auto_331 ) ) ( AVAILABLE ?auto_335 ) ( IN ?auto_331 ?auto_334 ) ( ON ?auto_330 ?auto_329 ) ( not ( = ?auto_329 ?auto_330 ) ) ( not ( = ?auto_329 ?auto_331 ) ) ( TRUCK-AT ?auto_334 ?auto_333 ) ( not ( = ?auto_333 ?auto_332 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_330 ?auto_331 )
      ( MAKE-2CRATE-VERIFY ?auto_329 ?auto_330 ?auto_331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_336 - SURFACE
      ?auto_337 - SURFACE
    )
    :vars
    (
      ?auto_339 - HOIST
      ?auto_341 - PLACE
      ?auto_338 - SURFACE
      ?auto_340 - TRUCK
      ?auto_342 - PLACE
      ?auto_343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_339 ?auto_341 ) ( SURFACE-AT ?auto_336 ?auto_341 ) ( CLEAR ?auto_336 ) ( IS-CRATE ?auto_337 ) ( not ( = ?auto_336 ?auto_337 ) ) ( AVAILABLE ?auto_339 ) ( ON ?auto_336 ?auto_338 ) ( not ( = ?auto_338 ?auto_336 ) ) ( not ( = ?auto_338 ?auto_337 ) ) ( TRUCK-AT ?auto_340 ?auto_342 ) ( not ( = ?auto_342 ?auto_341 ) ) ( HOIST-AT ?auto_343 ?auto_342 ) ( LIFTING ?auto_343 ?auto_337 ) ( not ( = ?auto_339 ?auto_343 ) ) )
    :subtasks
    ( ( !LOAD ?auto_343 ?auto_337 ?auto_340 ?auto_342 )
      ( MAKE-2CRATE ?auto_338 ?auto_336 ?auto_337 )
      ( MAKE-1CRATE-VERIFY ?auto_336 ?auto_337 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_344 - SURFACE
      ?auto_345 - SURFACE
      ?auto_346 - SURFACE
    )
    :vars
    (
      ?auto_347 - HOIST
      ?auto_350 - PLACE
      ?auto_348 - TRUCK
      ?auto_349 - PLACE
      ?auto_351 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347 ?auto_350 ) ( SURFACE-AT ?auto_345 ?auto_350 ) ( CLEAR ?auto_345 ) ( IS-CRATE ?auto_346 ) ( not ( = ?auto_345 ?auto_346 ) ) ( AVAILABLE ?auto_347 ) ( ON ?auto_345 ?auto_344 ) ( not ( = ?auto_344 ?auto_345 ) ) ( not ( = ?auto_344 ?auto_346 ) ) ( TRUCK-AT ?auto_348 ?auto_349 ) ( not ( = ?auto_349 ?auto_350 ) ) ( HOIST-AT ?auto_351 ?auto_349 ) ( LIFTING ?auto_351 ?auto_346 ) ( not ( = ?auto_347 ?auto_351 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_345 ?auto_346 )
      ( MAKE-2CRATE-VERIFY ?auto_344 ?auto_345 ?auto_346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_352 - SURFACE
      ?auto_353 - SURFACE
    )
    :vars
    (
      ?auto_358 - HOIST
      ?auto_356 - PLACE
      ?auto_359 - SURFACE
      ?auto_354 - TRUCK
      ?auto_357 - PLACE
      ?auto_355 - HOIST
      ?auto_360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_358 ?auto_356 ) ( SURFACE-AT ?auto_352 ?auto_356 ) ( CLEAR ?auto_352 ) ( IS-CRATE ?auto_353 ) ( not ( = ?auto_352 ?auto_353 ) ) ( AVAILABLE ?auto_358 ) ( ON ?auto_352 ?auto_359 ) ( not ( = ?auto_359 ?auto_352 ) ) ( not ( = ?auto_359 ?auto_353 ) ) ( TRUCK-AT ?auto_354 ?auto_357 ) ( not ( = ?auto_357 ?auto_356 ) ) ( HOIST-AT ?auto_355 ?auto_357 ) ( not ( = ?auto_358 ?auto_355 ) ) ( AVAILABLE ?auto_355 ) ( SURFACE-AT ?auto_353 ?auto_357 ) ( ON ?auto_353 ?auto_360 ) ( CLEAR ?auto_353 ) ( not ( = ?auto_352 ?auto_360 ) ) ( not ( = ?auto_353 ?auto_360 ) ) ( not ( = ?auto_359 ?auto_360 ) ) )
    :subtasks
    ( ( !LIFT ?auto_355 ?auto_353 ?auto_360 ?auto_357 )
      ( MAKE-2CRATE ?auto_359 ?auto_352 ?auto_353 )
      ( MAKE-1CRATE-VERIFY ?auto_352 ?auto_353 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_361 - SURFACE
      ?auto_362 - SURFACE
      ?auto_363 - SURFACE
    )
    :vars
    (
      ?auto_367 - HOIST
      ?auto_368 - PLACE
      ?auto_364 - TRUCK
      ?auto_369 - PLACE
      ?auto_365 - HOIST
      ?auto_366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367 ?auto_368 ) ( SURFACE-AT ?auto_362 ?auto_368 ) ( CLEAR ?auto_362 ) ( IS-CRATE ?auto_363 ) ( not ( = ?auto_362 ?auto_363 ) ) ( AVAILABLE ?auto_367 ) ( ON ?auto_362 ?auto_361 ) ( not ( = ?auto_361 ?auto_362 ) ) ( not ( = ?auto_361 ?auto_363 ) ) ( TRUCK-AT ?auto_364 ?auto_369 ) ( not ( = ?auto_369 ?auto_368 ) ) ( HOIST-AT ?auto_365 ?auto_369 ) ( not ( = ?auto_367 ?auto_365 ) ) ( AVAILABLE ?auto_365 ) ( SURFACE-AT ?auto_363 ?auto_369 ) ( ON ?auto_363 ?auto_366 ) ( CLEAR ?auto_363 ) ( not ( = ?auto_362 ?auto_366 ) ) ( not ( = ?auto_363 ?auto_366 ) ) ( not ( = ?auto_361 ?auto_366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_362 ?auto_363 )
      ( MAKE-2CRATE-VERIFY ?auto_361 ?auto_362 ?auto_363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_370 - SURFACE
      ?auto_371 - SURFACE
    )
    :vars
    (
      ?auto_377 - HOIST
      ?auto_373 - PLACE
      ?auto_378 - SURFACE
      ?auto_374 - PLACE
      ?auto_375 - HOIST
      ?auto_372 - SURFACE
      ?auto_376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377 ?auto_373 ) ( SURFACE-AT ?auto_370 ?auto_373 ) ( CLEAR ?auto_370 ) ( IS-CRATE ?auto_371 ) ( not ( = ?auto_370 ?auto_371 ) ) ( AVAILABLE ?auto_377 ) ( ON ?auto_370 ?auto_378 ) ( not ( = ?auto_378 ?auto_370 ) ) ( not ( = ?auto_378 ?auto_371 ) ) ( not ( = ?auto_374 ?auto_373 ) ) ( HOIST-AT ?auto_375 ?auto_374 ) ( not ( = ?auto_377 ?auto_375 ) ) ( AVAILABLE ?auto_375 ) ( SURFACE-AT ?auto_371 ?auto_374 ) ( ON ?auto_371 ?auto_372 ) ( CLEAR ?auto_371 ) ( not ( = ?auto_370 ?auto_372 ) ) ( not ( = ?auto_371 ?auto_372 ) ) ( not ( = ?auto_378 ?auto_372 ) ) ( TRUCK-AT ?auto_376 ?auto_373 ) )
    :subtasks
    ( ( !DRIVE ?auto_376 ?auto_373 ?auto_374 )
      ( MAKE-2CRATE ?auto_378 ?auto_370 ?auto_371 )
      ( MAKE-1CRATE-VERIFY ?auto_370 ?auto_371 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_379 - SURFACE
      ?auto_380 - SURFACE
      ?auto_381 - SURFACE
    )
    :vars
    (
      ?auto_387 - HOIST
      ?auto_382 - PLACE
      ?auto_384 - PLACE
      ?auto_386 - HOIST
      ?auto_383 - SURFACE
      ?auto_385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_387 ?auto_382 ) ( SURFACE-AT ?auto_380 ?auto_382 ) ( CLEAR ?auto_380 ) ( IS-CRATE ?auto_381 ) ( not ( = ?auto_380 ?auto_381 ) ) ( AVAILABLE ?auto_387 ) ( ON ?auto_380 ?auto_379 ) ( not ( = ?auto_379 ?auto_380 ) ) ( not ( = ?auto_379 ?auto_381 ) ) ( not ( = ?auto_384 ?auto_382 ) ) ( HOIST-AT ?auto_386 ?auto_384 ) ( not ( = ?auto_387 ?auto_386 ) ) ( AVAILABLE ?auto_386 ) ( SURFACE-AT ?auto_381 ?auto_384 ) ( ON ?auto_381 ?auto_383 ) ( CLEAR ?auto_381 ) ( not ( = ?auto_380 ?auto_383 ) ) ( not ( = ?auto_381 ?auto_383 ) ) ( not ( = ?auto_379 ?auto_383 ) ) ( TRUCK-AT ?auto_385 ?auto_382 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_380 ?auto_381 )
      ( MAKE-2CRATE-VERIFY ?auto_379 ?auto_380 ?auto_381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_388 - SURFACE
      ?auto_389 - SURFACE
    )
    :vars
    (
      ?auto_394 - HOIST
      ?auto_392 - PLACE
      ?auto_391 - SURFACE
      ?auto_390 - PLACE
      ?auto_396 - HOIST
      ?auto_393 - SURFACE
      ?auto_395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_394 ?auto_392 ) ( IS-CRATE ?auto_389 ) ( not ( = ?auto_388 ?auto_389 ) ) ( not ( = ?auto_391 ?auto_388 ) ) ( not ( = ?auto_391 ?auto_389 ) ) ( not ( = ?auto_390 ?auto_392 ) ) ( HOIST-AT ?auto_396 ?auto_390 ) ( not ( = ?auto_394 ?auto_396 ) ) ( AVAILABLE ?auto_396 ) ( SURFACE-AT ?auto_389 ?auto_390 ) ( ON ?auto_389 ?auto_393 ) ( CLEAR ?auto_389 ) ( not ( = ?auto_388 ?auto_393 ) ) ( not ( = ?auto_389 ?auto_393 ) ) ( not ( = ?auto_391 ?auto_393 ) ) ( TRUCK-AT ?auto_395 ?auto_392 ) ( SURFACE-AT ?auto_391 ?auto_392 ) ( CLEAR ?auto_391 ) ( LIFTING ?auto_394 ?auto_388 ) ( IS-CRATE ?auto_388 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_391 ?auto_388 )
      ( MAKE-2CRATE ?auto_391 ?auto_388 ?auto_389 )
      ( MAKE-1CRATE-VERIFY ?auto_388 ?auto_389 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_397 - SURFACE
      ?auto_398 - SURFACE
      ?auto_399 - SURFACE
    )
    :vars
    (
      ?auto_402 - HOIST
      ?auto_400 - PLACE
      ?auto_401 - PLACE
      ?auto_403 - HOIST
      ?auto_404 - SURFACE
      ?auto_405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_402 ?auto_400 ) ( IS-CRATE ?auto_399 ) ( not ( = ?auto_398 ?auto_399 ) ) ( not ( = ?auto_397 ?auto_398 ) ) ( not ( = ?auto_397 ?auto_399 ) ) ( not ( = ?auto_401 ?auto_400 ) ) ( HOIST-AT ?auto_403 ?auto_401 ) ( not ( = ?auto_402 ?auto_403 ) ) ( AVAILABLE ?auto_403 ) ( SURFACE-AT ?auto_399 ?auto_401 ) ( ON ?auto_399 ?auto_404 ) ( CLEAR ?auto_399 ) ( not ( = ?auto_398 ?auto_404 ) ) ( not ( = ?auto_399 ?auto_404 ) ) ( not ( = ?auto_397 ?auto_404 ) ) ( TRUCK-AT ?auto_405 ?auto_400 ) ( SURFACE-AT ?auto_397 ?auto_400 ) ( CLEAR ?auto_397 ) ( LIFTING ?auto_402 ?auto_398 ) ( IS-CRATE ?auto_398 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_398 ?auto_399 )
      ( MAKE-2CRATE-VERIFY ?auto_397 ?auto_398 ?auto_399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_406 - SURFACE
      ?auto_407 - SURFACE
    )
    :vars
    (
      ?auto_412 - HOIST
      ?auto_413 - PLACE
      ?auto_411 - SURFACE
      ?auto_408 - PLACE
      ?auto_409 - HOIST
      ?auto_410 - SURFACE
      ?auto_414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412 ?auto_413 ) ( IS-CRATE ?auto_407 ) ( not ( = ?auto_406 ?auto_407 ) ) ( not ( = ?auto_411 ?auto_406 ) ) ( not ( = ?auto_411 ?auto_407 ) ) ( not ( = ?auto_408 ?auto_413 ) ) ( HOIST-AT ?auto_409 ?auto_408 ) ( not ( = ?auto_412 ?auto_409 ) ) ( AVAILABLE ?auto_409 ) ( SURFACE-AT ?auto_407 ?auto_408 ) ( ON ?auto_407 ?auto_410 ) ( CLEAR ?auto_407 ) ( not ( = ?auto_406 ?auto_410 ) ) ( not ( = ?auto_407 ?auto_410 ) ) ( not ( = ?auto_411 ?auto_410 ) ) ( TRUCK-AT ?auto_414 ?auto_413 ) ( SURFACE-AT ?auto_411 ?auto_413 ) ( CLEAR ?auto_411 ) ( IS-CRATE ?auto_406 ) ( AVAILABLE ?auto_412 ) ( IN ?auto_406 ?auto_414 ) )
    :subtasks
    ( ( !UNLOAD ?auto_412 ?auto_406 ?auto_414 ?auto_413 )
      ( MAKE-2CRATE ?auto_411 ?auto_406 ?auto_407 )
      ( MAKE-1CRATE-VERIFY ?auto_406 ?auto_407 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_415 - SURFACE
      ?auto_416 - SURFACE
      ?auto_417 - SURFACE
    )
    :vars
    (
      ?auto_419 - HOIST
      ?auto_420 - PLACE
      ?auto_418 - PLACE
      ?auto_423 - HOIST
      ?auto_422 - SURFACE
      ?auto_421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_419 ?auto_420 ) ( IS-CRATE ?auto_417 ) ( not ( = ?auto_416 ?auto_417 ) ) ( not ( = ?auto_415 ?auto_416 ) ) ( not ( = ?auto_415 ?auto_417 ) ) ( not ( = ?auto_418 ?auto_420 ) ) ( HOIST-AT ?auto_423 ?auto_418 ) ( not ( = ?auto_419 ?auto_423 ) ) ( AVAILABLE ?auto_423 ) ( SURFACE-AT ?auto_417 ?auto_418 ) ( ON ?auto_417 ?auto_422 ) ( CLEAR ?auto_417 ) ( not ( = ?auto_416 ?auto_422 ) ) ( not ( = ?auto_417 ?auto_422 ) ) ( not ( = ?auto_415 ?auto_422 ) ) ( TRUCK-AT ?auto_421 ?auto_420 ) ( SURFACE-AT ?auto_415 ?auto_420 ) ( CLEAR ?auto_415 ) ( IS-CRATE ?auto_416 ) ( AVAILABLE ?auto_419 ) ( IN ?auto_416 ?auto_421 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_416 ?auto_417 )
      ( MAKE-2CRATE-VERIFY ?auto_415 ?auto_416 ?auto_417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_424 - SURFACE
      ?auto_425 - SURFACE
    )
    :vars
    (
      ?auto_432 - HOIST
      ?auto_426 - PLACE
      ?auto_429 - SURFACE
      ?auto_430 - PLACE
      ?auto_431 - HOIST
      ?auto_427 - SURFACE
      ?auto_428 - TRUCK
      ?auto_433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_432 ?auto_426 ) ( IS-CRATE ?auto_425 ) ( not ( = ?auto_424 ?auto_425 ) ) ( not ( = ?auto_429 ?auto_424 ) ) ( not ( = ?auto_429 ?auto_425 ) ) ( not ( = ?auto_430 ?auto_426 ) ) ( HOIST-AT ?auto_431 ?auto_430 ) ( not ( = ?auto_432 ?auto_431 ) ) ( AVAILABLE ?auto_431 ) ( SURFACE-AT ?auto_425 ?auto_430 ) ( ON ?auto_425 ?auto_427 ) ( CLEAR ?auto_425 ) ( not ( = ?auto_424 ?auto_427 ) ) ( not ( = ?auto_425 ?auto_427 ) ) ( not ( = ?auto_429 ?auto_427 ) ) ( SURFACE-AT ?auto_429 ?auto_426 ) ( CLEAR ?auto_429 ) ( IS-CRATE ?auto_424 ) ( AVAILABLE ?auto_432 ) ( IN ?auto_424 ?auto_428 ) ( TRUCK-AT ?auto_428 ?auto_433 ) ( not ( = ?auto_433 ?auto_426 ) ) ( not ( = ?auto_430 ?auto_433 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_428 ?auto_433 ?auto_426 )
      ( MAKE-2CRATE ?auto_429 ?auto_424 ?auto_425 )
      ( MAKE-1CRATE-VERIFY ?auto_424 ?auto_425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_434 - SURFACE
      ?auto_435 - SURFACE
      ?auto_436 - SURFACE
    )
    :vars
    (
      ?auto_442 - HOIST
      ?auto_441 - PLACE
      ?auto_438 - PLACE
      ?auto_437 - HOIST
      ?auto_443 - SURFACE
      ?auto_440 - TRUCK
      ?auto_439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442 ?auto_441 ) ( IS-CRATE ?auto_436 ) ( not ( = ?auto_435 ?auto_436 ) ) ( not ( = ?auto_434 ?auto_435 ) ) ( not ( = ?auto_434 ?auto_436 ) ) ( not ( = ?auto_438 ?auto_441 ) ) ( HOIST-AT ?auto_437 ?auto_438 ) ( not ( = ?auto_442 ?auto_437 ) ) ( AVAILABLE ?auto_437 ) ( SURFACE-AT ?auto_436 ?auto_438 ) ( ON ?auto_436 ?auto_443 ) ( CLEAR ?auto_436 ) ( not ( = ?auto_435 ?auto_443 ) ) ( not ( = ?auto_436 ?auto_443 ) ) ( not ( = ?auto_434 ?auto_443 ) ) ( SURFACE-AT ?auto_434 ?auto_441 ) ( CLEAR ?auto_434 ) ( IS-CRATE ?auto_435 ) ( AVAILABLE ?auto_442 ) ( IN ?auto_435 ?auto_440 ) ( TRUCK-AT ?auto_440 ?auto_439 ) ( not ( = ?auto_439 ?auto_441 ) ) ( not ( = ?auto_438 ?auto_439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_435 ?auto_436 )
      ( MAKE-2CRATE-VERIFY ?auto_434 ?auto_435 ?auto_436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_444 - SURFACE
      ?auto_445 - SURFACE
    )
    :vars
    (
      ?auto_452 - HOIST
      ?auto_447 - PLACE
      ?auto_446 - SURFACE
      ?auto_449 - PLACE
      ?auto_448 - HOIST
      ?auto_451 - SURFACE
      ?auto_453 - TRUCK
      ?auto_450 - PLACE
      ?auto_454 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_452 ?auto_447 ) ( IS-CRATE ?auto_445 ) ( not ( = ?auto_444 ?auto_445 ) ) ( not ( = ?auto_446 ?auto_444 ) ) ( not ( = ?auto_446 ?auto_445 ) ) ( not ( = ?auto_449 ?auto_447 ) ) ( HOIST-AT ?auto_448 ?auto_449 ) ( not ( = ?auto_452 ?auto_448 ) ) ( AVAILABLE ?auto_448 ) ( SURFACE-AT ?auto_445 ?auto_449 ) ( ON ?auto_445 ?auto_451 ) ( CLEAR ?auto_445 ) ( not ( = ?auto_444 ?auto_451 ) ) ( not ( = ?auto_445 ?auto_451 ) ) ( not ( = ?auto_446 ?auto_451 ) ) ( SURFACE-AT ?auto_446 ?auto_447 ) ( CLEAR ?auto_446 ) ( IS-CRATE ?auto_444 ) ( AVAILABLE ?auto_452 ) ( TRUCK-AT ?auto_453 ?auto_450 ) ( not ( = ?auto_450 ?auto_447 ) ) ( not ( = ?auto_449 ?auto_450 ) ) ( HOIST-AT ?auto_454 ?auto_450 ) ( LIFTING ?auto_454 ?auto_444 ) ( not ( = ?auto_452 ?auto_454 ) ) ( not ( = ?auto_448 ?auto_454 ) ) )
    :subtasks
    ( ( !LOAD ?auto_454 ?auto_444 ?auto_453 ?auto_450 )
      ( MAKE-2CRATE ?auto_446 ?auto_444 ?auto_445 )
      ( MAKE-1CRATE-VERIFY ?auto_444 ?auto_445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_455 - SURFACE
      ?auto_456 - SURFACE
      ?auto_457 - SURFACE
    )
    :vars
    (
      ?auto_465 - HOIST
      ?auto_460 - PLACE
      ?auto_459 - PLACE
      ?auto_462 - HOIST
      ?auto_458 - SURFACE
      ?auto_464 - TRUCK
      ?auto_463 - PLACE
      ?auto_461 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_465 ?auto_460 ) ( IS-CRATE ?auto_457 ) ( not ( = ?auto_456 ?auto_457 ) ) ( not ( = ?auto_455 ?auto_456 ) ) ( not ( = ?auto_455 ?auto_457 ) ) ( not ( = ?auto_459 ?auto_460 ) ) ( HOIST-AT ?auto_462 ?auto_459 ) ( not ( = ?auto_465 ?auto_462 ) ) ( AVAILABLE ?auto_462 ) ( SURFACE-AT ?auto_457 ?auto_459 ) ( ON ?auto_457 ?auto_458 ) ( CLEAR ?auto_457 ) ( not ( = ?auto_456 ?auto_458 ) ) ( not ( = ?auto_457 ?auto_458 ) ) ( not ( = ?auto_455 ?auto_458 ) ) ( SURFACE-AT ?auto_455 ?auto_460 ) ( CLEAR ?auto_455 ) ( IS-CRATE ?auto_456 ) ( AVAILABLE ?auto_465 ) ( TRUCK-AT ?auto_464 ?auto_463 ) ( not ( = ?auto_463 ?auto_460 ) ) ( not ( = ?auto_459 ?auto_463 ) ) ( HOIST-AT ?auto_461 ?auto_463 ) ( LIFTING ?auto_461 ?auto_456 ) ( not ( = ?auto_465 ?auto_461 ) ) ( not ( = ?auto_462 ?auto_461 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_456 ?auto_457 )
      ( MAKE-2CRATE-VERIFY ?auto_455 ?auto_456 ?auto_457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_466 - SURFACE
      ?auto_467 - SURFACE
    )
    :vars
    (
      ?auto_468 - HOIST
      ?auto_470 - PLACE
      ?auto_471 - SURFACE
      ?auto_469 - PLACE
      ?auto_475 - HOIST
      ?auto_476 - SURFACE
      ?auto_473 - TRUCK
      ?auto_474 - PLACE
      ?auto_472 - HOIST
      ?auto_477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_468 ?auto_470 ) ( IS-CRATE ?auto_467 ) ( not ( = ?auto_466 ?auto_467 ) ) ( not ( = ?auto_471 ?auto_466 ) ) ( not ( = ?auto_471 ?auto_467 ) ) ( not ( = ?auto_469 ?auto_470 ) ) ( HOIST-AT ?auto_475 ?auto_469 ) ( not ( = ?auto_468 ?auto_475 ) ) ( AVAILABLE ?auto_475 ) ( SURFACE-AT ?auto_467 ?auto_469 ) ( ON ?auto_467 ?auto_476 ) ( CLEAR ?auto_467 ) ( not ( = ?auto_466 ?auto_476 ) ) ( not ( = ?auto_467 ?auto_476 ) ) ( not ( = ?auto_471 ?auto_476 ) ) ( SURFACE-AT ?auto_471 ?auto_470 ) ( CLEAR ?auto_471 ) ( IS-CRATE ?auto_466 ) ( AVAILABLE ?auto_468 ) ( TRUCK-AT ?auto_473 ?auto_474 ) ( not ( = ?auto_474 ?auto_470 ) ) ( not ( = ?auto_469 ?auto_474 ) ) ( HOIST-AT ?auto_472 ?auto_474 ) ( not ( = ?auto_468 ?auto_472 ) ) ( not ( = ?auto_475 ?auto_472 ) ) ( AVAILABLE ?auto_472 ) ( SURFACE-AT ?auto_466 ?auto_474 ) ( ON ?auto_466 ?auto_477 ) ( CLEAR ?auto_466 ) ( not ( = ?auto_466 ?auto_477 ) ) ( not ( = ?auto_467 ?auto_477 ) ) ( not ( = ?auto_471 ?auto_477 ) ) ( not ( = ?auto_476 ?auto_477 ) ) )
    :subtasks
    ( ( !LIFT ?auto_472 ?auto_466 ?auto_477 ?auto_474 )
      ( MAKE-2CRATE ?auto_471 ?auto_466 ?auto_467 )
      ( MAKE-1CRATE-VERIFY ?auto_466 ?auto_467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478 - SURFACE
      ?auto_479 - SURFACE
      ?auto_480 - SURFACE
    )
    :vars
    (
      ?auto_486 - HOIST
      ?auto_481 - PLACE
      ?auto_483 - PLACE
      ?auto_484 - HOIST
      ?auto_482 - SURFACE
      ?auto_487 - TRUCK
      ?auto_488 - PLACE
      ?auto_485 - HOIST
      ?auto_489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_486 ?auto_481 ) ( IS-CRATE ?auto_480 ) ( not ( = ?auto_479 ?auto_480 ) ) ( not ( = ?auto_478 ?auto_479 ) ) ( not ( = ?auto_478 ?auto_480 ) ) ( not ( = ?auto_483 ?auto_481 ) ) ( HOIST-AT ?auto_484 ?auto_483 ) ( not ( = ?auto_486 ?auto_484 ) ) ( AVAILABLE ?auto_484 ) ( SURFACE-AT ?auto_480 ?auto_483 ) ( ON ?auto_480 ?auto_482 ) ( CLEAR ?auto_480 ) ( not ( = ?auto_479 ?auto_482 ) ) ( not ( = ?auto_480 ?auto_482 ) ) ( not ( = ?auto_478 ?auto_482 ) ) ( SURFACE-AT ?auto_478 ?auto_481 ) ( CLEAR ?auto_478 ) ( IS-CRATE ?auto_479 ) ( AVAILABLE ?auto_486 ) ( TRUCK-AT ?auto_487 ?auto_488 ) ( not ( = ?auto_488 ?auto_481 ) ) ( not ( = ?auto_483 ?auto_488 ) ) ( HOIST-AT ?auto_485 ?auto_488 ) ( not ( = ?auto_486 ?auto_485 ) ) ( not ( = ?auto_484 ?auto_485 ) ) ( AVAILABLE ?auto_485 ) ( SURFACE-AT ?auto_479 ?auto_488 ) ( ON ?auto_479 ?auto_489 ) ( CLEAR ?auto_479 ) ( not ( = ?auto_479 ?auto_489 ) ) ( not ( = ?auto_480 ?auto_489 ) ) ( not ( = ?auto_478 ?auto_489 ) ) ( not ( = ?auto_482 ?auto_489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479 ?auto_480 )
      ( MAKE-2CRATE-VERIFY ?auto_478 ?auto_479 ?auto_480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_490 - SURFACE
      ?auto_491 - SURFACE
    )
    :vars
    (
      ?auto_498 - HOIST
      ?auto_495 - PLACE
      ?auto_501 - SURFACE
      ?auto_494 - PLACE
      ?auto_496 - HOIST
      ?auto_492 - SURFACE
      ?auto_493 - PLACE
      ?auto_500 - HOIST
      ?auto_499 - SURFACE
      ?auto_497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_498 ?auto_495 ) ( IS-CRATE ?auto_491 ) ( not ( = ?auto_490 ?auto_491 ) ) ( not ( = ?auto_501 ?auto_490 ) ) ( not ( = ?auto_501 ?auto_491 ) ) ( not ( = ?auto_494 ?auto_495 ) ) ( HOIST-AT ?auto_496 ?auto_494 ) ( not ( = ?auto_498 ?auto_496 ) ) ( AVAILABLE ?auto_496 ) ( SURFACE-AT ?auto_491 ?auto_494 ) ( ON ?auto_491 ?auto_492 ) ( CLEAR ?auto_491 ) ( not ( = ?auto_490 ?auto_492 ) ) ( not ( = ?auto_491 ?auto_492 ) ) ( not ( = ?auto_501 ?auto_492 ) ) ( SURFACE-AT ?auto_501 ?auto_495 ) ( CLEAR ?auto_501 ) ( IS-CRATE ?auto_490 ) ( AVAILABLE ?auto_498 ) ( not ( = ?auto_493 ?auto_495 ) ) ( not ( = ?auto_494 ?auto_493 ) ) ( HOIST-AT ?auto_500 ?auto_493 ) ( not ( = ?auto_498 ?auto_500 ) ) ( not ( = ?auto_496 ?auto_500 ) ) ( AVAILABLE ?auto_500 ) ( SURFACE-AT ?auto_490 ?auto_493 ) ( ON ?auto_490 ?auto_499 ) ( CLEAR ?auto_490 ) ( not ( = ?auto_490 ?auto_499 ) ) ( not ( = ?auto_491 ?auto_499 ) ) ( not ( = ?auto_501 ?auto_499 ) ) ( not ( = ?auto_492 ?auto_499 ) ) ( TRUCK-AT ?auto_497 ?auto_495 ) )
    :subtasks
    ( ( !DRIVE ?auto_497 ?auto_495 ?auto_493 )
      ( MAKE-2CRATE ?auto_501 ?auto_490 ?auto_491 )
      ( MAKE-1CRATE-VERIFY ?auto_490 ?auto_491 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_502 - SURFACE
      ?auto_503 - SURFACE
      ?auto_504 - SURFACE
    )
    :vars
    (
      ?auto_510 - HOIST
      ?auto_507 - PLACE
      ?auto_512 - PLACE
      ?auto_511 - HOIST
      ?auto_508 - SURFACE
      ?auto_506 - PLACE
      ?auto_505 - HOIST
      ?auto_509 - SURFACE
      ?auto_513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_510 ?auto_507 ) ( IS-CRATE ?auto_504 ) ( not ( = ?auto_503 ?auto_504 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_504 ) ) ( not ( = ?auto_512 ?auto_507 ) ) ( HOIST-AT ?auto_511 ?auto_512 ) ( not ( = ?auto_510 ?auto_511 ) ) ( AVAILABLE ?auto_511 ) ( SURFACE-AT ?auto_504 ?auto_512 ) ( ON ?auto_504 ?auto_508 ) ( CLEAR ?auto_504 ) ( not ( = ?auto_503 ?auto_508 ) ) ( not ( = ?auto_504 ?auto_508 ) ) ( not ( = ?auto_502 ?auto_508 ) ) ( SURFACE-AT ?auto_502 ?auto_507 ) ( CLEAR ?auto_502 ) ( IS-CRATE ?auto_503 ) ( AVAILABLE ?auto_510 ) ( not ( = ?auto_506 ?auto_507 ) ) ( not ( = ?auto_512 ?auto_506 ) ) ( HOIST-AT ?auto_505 ?auto_506 ) ( not ( = ?auto_510 ?auto_505 ) ) ( not ( = ?auto_511 ?auto_505 ) ) ( AVAILABLE ?auto_505 ) ( SURFACE-AT ?auto_503 ?auto_506 ) ( ON ?auto_503 ?auto_509 ) ( CLEAR ?auto_503 ) ( not ( = ?auto_503 ?auto_509 ) ) ( not ( = ?auto_504 ?auto_509 ) ) ( not ( = ?auto_502 ?auto_509 ) ) ( not ( = ?auto_508 ?auto_509 ) ) ( TRUCK-AT ?auto_513 ?auto_507 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_503 ?auto_504 )
      ( MAKE-2CRATE-VERIFY ?auto_502 ?auto_503 ?auto_504 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_523 - SURFACE
      ?auto_524 - SURFACE
    )
    :vars
    (
      ?auto_525 - HOIST
      ?auto_526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_525 ?auto_526 ) ( SURFACE-AT ?auto_523 ?auto_526 ) ( CLEAR ?auto_523 ) ( LIFTING ?auto_525 ?auto_524 ) ( IS-CRATE ?auto_524 ) ( not ( = ?auto_523 ?auto_524 ) ) )
    :subtasks
    ( ( !DROP ?auto_525 ?auto_524 ?auto_523 ?auto_526 )
      ( MAKE-1CRATE-VERIFY ?auto_523 ?auto_524 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_527 - SURFACE
      ?auto_528 - SURFACE
      ?auto_529 - SURFACE
    )
    :vars
    (
      ?auto_530 - HOIST
      ?auto_531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_530 ?auto_531 ) ( SURFACE-AT ?auto_528 ?auto_531 ) ( CLEAR ?auto_528 ) ( LIFTING ?auto_530 ?auto_529 ) ( IS-CRATE ?auto_529 ) ( not ( = ?auto_528 ?auto_529 ) ) ( ON ?auto_528 ?auto_527 ) ( not ( = ?auto_527 ?auto_528 ) ) ( not ( = ?auto_527 ?auto_529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_528 ?auto_529 )
      ( MAKE-2CRATE-VERIFY ?auto_527 ?auto_528 ?auto_529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_532 - SURFACE
      ?auto_533 - SURFACE
      ?auto_534 - SURFACE
      ?auto_535 - SURFACE
    )
    :vars
    (
      ?auto_536 - HOIST
      ?auto_537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_536 ?auto_537 ) ( SURFACE-AT ?auto_534 ?auto_537 ) ( CLEAR ?auto_534 ) ( LIFTING ?auto_536 ?auto_535 ) ( IS-CRATE ?auto_535 ) ( not ( = ?auto_534 ?auto_535 ) ) ( ON ?auto_533 ?auto_532 ) ( ON ?auto_534 ?auto_533 ) ( not ( = ?auto_532 ?auto_533 ) ) ( not ( = ?auto_532 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_535 ) ) ( not ( = ?auto_533 ?auto_534 ) ) ( not ( = ?auto_533 ?auto_535 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_534 ?auto_535 )
      ( MAKE-3CRATE-VERIFY ?auto_532 ?auto_533 ?auto_534 ?auto_535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_538 - SURFACE
      ?auto_539 - SURFACE
    )
    :vars
    (
      ?auto_540 - HOIST
      ?auto_541 - PLACE
      ?auto_542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_540 ?auto_541 ) ( SURFACE-AT ?auto_538 ?auto_541 ) ( CLEAR ?auto_538 ) ( IS-CRATE ?auto_539 ) ( not ( = ?auto_538 ?auto_539 ) ) ( TRUCK-AT ?auto_542 ?auto_541 ) ( AVAILABLE ?auto_540 ) ( IN ?auto_539 ?auto_542 ) )
    :subtasks
    ( ( !UNLOAD ?auto_540 ?auto_539 ?auto_542 ?auto_541 )
      ( MAKE-1CRATE ?auto_538 ?auto_539 )
      ( MAKE-1CRATE-VERIFY ?auto_538 ?auto_539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_543 - SURFACE
      ?auto_544 - SURFACE
      ?auto_545 - SURFACE
    )
    :vars
    (
      ?auto_546 - HOIST
      ?auto_548 - PLACE
      ?auto_547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_546 ?auto_548 ) ( SURFACE-AT ?auto_544 ?auto_548 ) ( CLEAR ?auto_544 ) ( IS-CRATE ?auto_545 ) ( not ( = ?auto_544 ?auto_545 ) ) ( TRUCK-AT ?auto_547 ?auto_548 ) ( AVAILABLE ?auto_546 ) ( IN ?auto_545 ?auto_547 ) ( ON ?auto_544 ?auto_543 ) ( not ( = ?auto_543 ?auto_544 ) ) ( not ( = ?auto_543 ?auto_545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_544 ?auto_545 )
      ( MAKE-2CRATE-VERIFY ?auto_543 ?auto_544 ?auto_545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_549 - SURFACE
      ?auto_550 - SURFACE
      ?auto_551 - SURFACE
      ?auto_552 - SURFACE
    )
    :vars
    (
      ?auto_554 - HOIST
      ?auto_555 - PLACE
      ?auto_553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554 ?auto_555 ) ( SURFACE-AT ?auto_551 ?auto_555 ) ( CLEAR ?auto_551 ) ( IS-CRATE ?auto_552 ) ( not ( = ?auto_551 ?auto_552 ) ) ( TRUCK-AT ?auto_553 ?auto_555 ) ( AVAILABLE ?auto_554 ) ( IN ?auto_552 ?auto_553 ) ( ON ?auto_551 ?auto_550 ) ( not ( = ?auto_550 ?auto_551 ) ) ( not ( = ?auto_550 ?auto_552 ) ) ( ON ?auto_550 ?auto_549 ) ( not ( = ?auto_549 ?auto_550 ) ) ( not ( = ?auto_549 ?auto_551 ) ) ( not ( = ?auto_549 ?auto_552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_550 ?auto_551 ?auto_552 )
      ( MAKE-3CRATE-VERIFY ?auto_549 ?auto_550 ?auto_551 ?auto_552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_556 - SURFACE
      ?auto_557 - SURFACE
    )
    :vars
    (
      ?auto_559 - HOIST
      ?auto_560 - PLACE
      ?auto_558 - TRUCK
      ?auto_561 - SURFACE
      ?auto_562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_559 ?auto_560 ) ( SURFACE-AT ?auto_556 ?auto_560 ) ( CLEAR ?auto_556 ) ( IS-CRATE ?auto_557 ) ( not ( = ?auto_556 ?auto_557 ) ) ( AVAILABLE ?auto_559 ) ( IN ?auto_557 ?auto_558 ) ( ON ?auto_556 ?auto_561 ) ( not ( = ?auto_561 ?auto_556 ) ) ( not ( = ?auto_561 ?auto_557 ) ) ( TRUCK-AT ?auto_558 ?auto_562 ) ( not ( = ?auto_562 ?auto_560 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_558 ?auto_562 ?auto_560 )
      ( MAKE-2CRATE ?auto_561 ?auto_556 ?auto_557 )
      ( MAKE-1CRATE-VERIFY ?auto_556 ?auto_557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_563 - SURFACE
      ?auto_564 - SURFACE
      ?auto_565 - SURFACE
    )
    :vars
    (
      ?auto_569 - HOIST
      ?auto_566 - PLACE
      ?auto_567 - TRUCK
      ?auto_568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_569 ?auto_566 ) ( SURFACE-AT ?auto_564 ?auto_566 ) ( CLEAR ?auto_564 ) ( IS-CRATE ?auto_565 ) ( not ( = ?auto_564 ?auto_565 ) ) ( AVAILABLE ?auto_569 ) ( IN ?auto_565 ?auto_567 ) ( ON ?auto_564 ?auto_563 ) ( not ( = ?auto_563 ?auto_564 ) ) ( not ( = ?auto_563 ?auto_565 ) ) ( TRUCK-AT ?auto_567 ?auto_568 ) ( not ( = ?auto_568 ?auto_566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_564 ?auto_565 )
      ( MAKE-2CRATE-VERIFY ?auto_563 ?auto_564 ?auto_565 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_570 - SURFACE
      ?auto_571 - SURFACE
      ?auto_572 - SURFACE
      ?auto_573 - SURFACE
    )
    :vars
    (
      ?auto_576 - HOIST
      ?auto_577 - PLACE
      ?auto_575 - TRUCK
      ?auto_574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_576 ?auto_577 ) ( SURFACE-AT ?auto_572 ?auto_577 ) ( CLEAR ?auto_572 ) ( IS-CRATE ?auto_573 ) ( not ( = ?auto_572 ?auto_573 ) ) ( AVAILABLE ?auto_576 ) ( IN ?auto_573 ?auto_575 ) ( ON ?auto_572 ?auto_571 ) ( not ( = ?auto_571 ?auto_572 ) ) ( not ( = ?auto_571 ?auto_573 ) ) ( TRUCK-AT ?auto_575 ?auto_574 ) ( not ( = ?auto_574 ?auto_577 ) ) ( ON ?auto_571 ?auto_570 ) ( not ( = ?auto_570 ?auto_571 ) ) ( not ( = ?auto_570 ?auto_572 ) ) ( not ( = ?auto_570 ?auto_573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_571 ?auto_572 ?auto_573 )
      ( MAKE-3CRATE-VERIFY ?auto_570 ?auto_571 ?auto_572 ?auto_573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_578 - SURFACE
      ?auto_579 - SURFACE
    )
    :vars
    (
      ?auto_582 - HOIST
      ?auto_583 - PLACE
      ?auto_584 - SURFACE
      ?auto_581 - TRUCK
      ?auto_580 - PLACE
      ?auto_585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_582 ?auto_583 ) ( SURFACE-AT ?auto_578 ?auto_583 ) ( CLEAR ?auto_578 ) ( IS-CRATE ?auto_579 ) ( not ( = ?auto_578 ?auto_579 ) ) ( AVAILABLE ?auto_582 ) ( ON ?auto_578 ?auto_584 ) ( not ( = ?auto_584 ?auto_578 ) ) ( not ( = ?auto_584 ?auto_579 ) ) ( TRUCK-AT ?auto_581 ?auto_580 ) ( not ( = ?auto_580 ?auto_583 ) ) ( HOIST-AT ?auto_585 ?auto_580 ) ( LIFTING ?auto_585 ?auto_579 ) ( not ( = ?auto_582 ?auto_585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_585 ?auto_579 ?auto_581 ?auto_580 )
      ( MAKE-2CRATE ?auto_584 ?auto_578 ?auto_579 )
      ( MAKE-1CRATE-VERIFY ?auto_578 ?auto_579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_586 - SURFACE
      ?auto_587 - SURFACE
      ?auto_588 - SURFACE
    )
    :vars
    (
      ?auto_593 - HOIST
      ?auto_589 - PLACE
      ?auto_590 - TRUCK
      ?auto_591 - PLACE
      ?auto_592 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593 ?auto_589 ) ( SURFACE-AT ?auto_587 ?auto_589 ) ( CLEAR ?auto_587 ) ( IS-CRATE ?auto_588 ) ( not ( = ?auto_587 ?auto_588 ) ) ( AVAILABLE ?auto_593 ) ( ON ?auto_587 ?auto_586 ) ( not ( = ?auto_586 ?auto_587 ) ) ( not ( = ?auto_586 ?auto_588 ) ) ( TRUCK-AT ?auto_590 ?auto_591 ) ( not ( = ?auto_591 ?auto_589 ) ) ( HOIST-AT ?auto_592 ?auto_591 ) ( LIFTING ?auto_592 ?auto_588 ) ( not ( = ?auto_593 ?auto_592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_587 ?auto_588 )
      ( MAKE-2CRATE-VERIFY ?auto_586 ?auto_587 ?auto_588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_594 - SURFACE
      ?auto_595 - SURFACE
      ?auto_596 - SURFACE
      ?auto_597 - SURFACE
    )
    :vars
    (
      ?auto_601 - HOIST
      ?auto_599 - PLACE
      ?auto_598 - TRUCK
      ?auto_602 - PLACE
      ?auto_600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_601 ?auto_599 ) ( SURFACE-AT ?auto_596 ?auto_599 ) ( CLEAR ?auto_596 ) ( IS-CRATE ?auto_597 ) ( not ( = ?auto_596 ?auto_597 ) ) ( AVAILABLE ?auto_601 ) ( ON ?auto_596 ?auto_595 ) ( not ( = ?auto_595 ?auto_596 ) ) ( not ( = ?auto_595 ?auto_597 ) ) ( TRUCK-AT ?auto_598 ?auto_602 ) ( not ( = ?auto_602 ?auto_599 ) ) ( HOIST-AT ?auto_600 ?auto_602 ) ( LIFTING ?auto_600 ?auto_597 ) ( not ( = ?auto_601 ?auto_600 ) ) ( ON ?auto_595 ?auto_594 ) ( not ( = ?auto_594 ?auto_595 ) ) ( not ( = ?auto_594 ?auto_596 ) ) ( not ( = ?auto_594 ?auto_597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_595 ?auto_596 ?auto_597 )
      ( MAKE-3CRATE-VERIFY ?auto_594 ?auto_595 ?auto_596 ?auto_597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_603 - SURFACE
      ?auto_604 - SURFACE
    )
    :vars
    (
      ?auto_608 - HOIST
      ?auto_606 - PLACE
      ?auto_610 - SURFACE
      ?auto_605 - TRUCK
      ?auto_609 - PLACE
      ?auto_607 - HOIST
      ?auto_611 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_608 ?auto_606 ) ( SURFACE-AT ?auto_603 ?auto_606 ) ( CLEAR ?auto_603 ) ( IS-CRATE ?auto_604 ) ( not ( = ?auto_603 ?auto_604 ) ) ( AVAILABLE ?auto_608 ) ( ON ?auto_603 ?auto_610 ) ( not ( = ?auto_610 ?auto_603 ) ) ( not ( = ?auto_610 ?auto_604 ) ) ( TRUCK-AT ?auto_605 ?auto_609 ) ( not ( = ?auto_609 ?auto_606 ) ) ( HOIST-AT ?auto_607 ?auto_609 ) ( not ( = ?auto_608 ?auto_607 ) ) ( AVAILABLE ?auto_607 ) ( SURFACE-AT ?auto_604 ?auto_609 ) ( ON ?auto_604 ?auto_611 ) ( CLEAR ?auto_604 ) ( not ( = ?auto_603 ?auto_611 ) ) ( not ( = ?auto_604 ?auto_611 ) ) ( not ( = ?auto_610 ?auto_611 ) ) )
    :subtasks
    ( ( !LIFT ?auto_607 ?auto_604 ?auto_611 ?auto_609 )
      ( MAKE-2CRATE ?auto_610 ?auto_603 ?auto_604 )
      ( MAKE-1CRATE-VERIFY ?auto_603 ?auto_604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_612 - SURFACE
      ?auto_613 - SURFACE
      ?auto_614 - SURFACE
    )
    :vars
    (
      ?auto_616 - HOIST
      ?auto_615 - PLACE
      ?auto_617 - TRUCK
      ?auto_618 - PLACE
      ?auto_619 - HOIST
      ?auto_620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_616 ?auto_615 ) ( SURFACE-AT ?auto_613 ?auto_615 ) ( CLEAR ?auto_613 ) ( IS-CRATE ?auto_614 ) ( not ( = ?auto_613 ?auto_614 ) ) ( AVAILABLE ?auto_616 ) ( ON ?auto_613 ?auto_612 ) ( not ( = ?auto_612 ?auto_613 ) ) ( not ( = ?auto_612 ?auto_614 ) ) ( TRUCK-AT ?auto_617 ?auto_618 ) ( not ( = ?auto_618 ?auto_615 ) ) ( HOIST-AT ?auto_619 ?auto_618 ) ( not ( = ?auto_616 ?auto_619 ) ) ( AVAILABLE ?auto_619 ) ( SURFACE-AT ?auto_614 ?auto_618 ) ( ON ?auto_614 ?auto_620 ) ( CLEAR ?auto_614 ) ( not ( = ?auto_613 ?auto_620 ) ) ( not ( = ?auto_614 ?auto_620 ) ) ( not ( = ?auto_612 ?auto_620 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_613 ?auto_614 )
      ( MAKE-2CRATE-VERIFY ?auto_612 ?auto_613 ?auto_614 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_621 - SURFACE
      ?auto_622 - SURFACE
      ?auto_623 - SURFACE
      ?auto_624 - SURFACE
    )
    :vars
    (
      ?auto_627 - HOIST
      ?auto_625 - PLACE
      ?auto_630 - TRUCK
      ?auto_626 - PLACE
      ?auto_629 - HOIST
      ?auto_628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_627 ?auto_625 ) ( SURFACE-AT ?auto_623 ?auto_625 ) ( CLEAR ?auto_623 ) ( IS-CRATE ?auto_624 ) ( not ( = ?auto_623 ?auto_624 ) ) ( AVAILABLE ?auto_627 ) ( ON ?auto_623 ?auto_622 ) ( not ( = ?auto_622 ?auto_623 ) ) ( not ( = ?auto_622 ?auto_624 ) ) ( TRUCK-AT ?auto_630 ?auto_626 ) ( not ( = ?auto_626 ?auto_625 ) ) ( HOIST-AT ?auto_629 ?auto_626 ) ( not ( = ?auto_627 ?auto_629 ) ) ( AVAILABLE ?auto_629 ) ( SURFACE-AT ?auto_624 ?auto_626 ) ( ON ?auto_624 ?auto_628 ) ( CLEAR ?auto_624 ) ( not ( = ?auto_623 ?auto_628 ) ) ( not ( = ?auto_624 ?auto_628 ) ) ( not ( = ?auto_622 ?auto_628 ) ) ( ON ?auto_622 ?auto_621 ) ( not ( = ?auto_621 ?auto_622 ) ) ( not ( = ?auto_621 ?auto_623 ) ) ( not ( = ?auto_621 ?auto_624 ) ) ( not ( = ?auto_621 ?auto_628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_622 ?auto_623 ?auto_624 )
      ( MAKE-3CRATE-VERIFY ?auto_621 ?auto_622 ?auto_623 ?auto_624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_631 - SURFACE
      ?auto_632 - SURFACE
    )
    :vars
    (
      ?auto_635 - HOIST
      ?auto_633 - PLACE
      ?auto_639 - SURFACE
      ?auto_634 - PLACE
      ?auto_637 - HOIST
      ?auto_636 - SURFACE
      ?auto_638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_635 ?auto_633 ) ( SURFACE-AT ?auto_631 ?auto_633 ) ( CLEAR ?auto_631 ) ( IS-CRATE ?auto_632 ) ( not ( = ?auto_631 ?auto_632 ) ) ( AVAILABLE ?auto_635 ) ( ON ?auto_631 ?auto_639 ) ( not ( = ?auto_639 ?auto_631 ) ) ( not ( = ?auto_639 ?auto_632 ) ) ( not ( = ?auto_634 ?auto_633 ) ) ( HOIST-AT ?auto_637 ?auto_634 ) ( not ( = ?auto_635 ?auto_637 ) ) ( AVAILABLE ?auto_637 ) ( SURFACE-AT ?auto_632 ?auto_634 ) ( ON ?auto_632 ?auto_636 ) ( CLEAR ?auto_632 ) ( not ( = ?auto_631 ?auto_636 ) ) ( not ( = ?auto_632 ?auto_636 ) ) ( not ( = ?auto_639 ?auto_636 ) ) ( TRUCK-AT ?auto_638 ?auto_633 ) )
    :subtasks
    ( ( !DRIVE ?auto_638 ?auto_633 ?auto_634 )
      ( MAKE-2CRATE ?auto_639 ?auto_631 ?auto_632 )
      ( MAKE-1CRATE-VERIFY ?auto_631 ?auto_632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_640 - SURFACE
      ?auto_641 - SURFACE
      ?auto_642 - SURFACE
    )
    :vars
    (
      ?auto_644 - HOIST
      ?auto_648 - PLACE
      ?auto_646 - PLACE
      ?auto_643 - HOIST
      ?auto_647 - SURFACE
      ?auto_645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644 ?auto_648 ) ( SURFACE-AT ?auto_641 ?auto_648 ) ( CLEAR ?auto_641 ) ( IS-CRATE ?auto_642 ) ( not ( = ?auto_641 ?auto_642 ) ) ( AVAILABLE ?auto_644 ) ( ON ?auto_641 ?auto_640 ) ( not ( = ?auto_640 ?auto_641 ) ) ( not ( = ?auto_640 ?auto_642 ) ) ( not ( = ?auto_646 ?auto_648 ) ) ( HOIST-AT ?auto_643 ?auto_646 ) ( not ( = ?auto_644 ?auto_643 ) ) ( AVAILABLE ?auto_643 ) ( SURFACE-AT ?auto_642 ?auto_646 ) ( ON ?auto_642 ?auto_647 ) ( CLEAR ?auto_642 ) ( not ( = ?auto_641 ?auto_647 ) ) ( not ( = ?auto_642 ?auto_647 ) ) ( not ( = ?auto_640 ?auto_647 ) ) ( TRUCK-AT ?auto_645 ?auto_648 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_641 ?auto_642 )
      ( MAKE-2CRATE-VERIFY ?auto_640 ?auto_641 ?auto_642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_649 - SURFACE
      ?auto_650 - SURFACE
      ?auto_651 - SURFACE
      ?auto_652 - SURFACE
    )
    :vars
    (
      ?auto_658 - HOIST
      ?auto_654 - PLACE
      ?auto_653 - PLACE
      ?auto_656 - HOIST
      ?auto_657 - SURFACE
      ?auto_655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_658 ?auto_654 ) ( SURFACE-AT ?auto_651 ?auto_654 ) ( CLEAR ?auto_651 ) ( IS-CRATE ?auto_652 ) ( not ( = ?auto_651 ?auto_652 ) ) ( AVAILABLE ?auto_658 ) ( ON ?auto_651 ?auto_650 ) ( not ( = ?auto_650 ?auto_651 ) ) ( not ( = ?auto_650 ?auto_652 ) ) ( not ( = ?auto_653 ?auto_654 ) ) ( HOIST-AT ?auto_656 ?auto_653 ) ( not ( = ?auto_658 ?auto_656 ) ) ( AVAILABLE ?auto_656 ) ( SURFACE-AT ?auto_652 ?auto_653 ) ( ON ?auto_652 ?auto_657 ) ( CLEAR ?auto_652 ) ( not ( = ?auto_651 ?auto_657 ) ) ( not ( = ?auto_652 ?auto_657 ) ) ( not ( = ?auto_650 ?auto_657 ) ) ( TRUCK-AT ?auto_655 ?auto_654 ) ( ON ?auto_650 ?auto_649 ) ( not ( = ?auto_649 ?auto_650 ) ) ( not ( = ?auto_649 ?auto_651 ) ) ( not ( = ?auto_649 ?auto_652 ) ) ( not ( = ?auto_649 ?auto_657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_650 ?auto_651 ?auto_652 )
      ( MAKE-3CRATE-VERIFY ?auto_649 ?auto_650 ?auto_651 ?auto_652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_659 - SURFACE
      ?auto_660 - SURFACE
    )
    :vars
    (
      ?auto_666 - HOIST
      ?auto_662 - PLACE
      ?auto_667 - SURFACE
      ?auto_661 - PLACE
      ?auto_664 - HOIST
      ?auto_665 - SURFACE
      ?auto_663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_666 ?auto_662 ) ( IS-CRATE ?auto_660 ) ( not ( = ?auto_659 ?auto_660 ) ) ( not ( = ?auto_667 ?auto_659 ) ) ( not ( = ?auto_667 ?auto_660 ) ) ( not ( = ?auto_661 ?auto_662 ) ) ( HOIST-AT ?auto_664 ?auto_661 ) ( not ( = ?auto_666 ?auto_664 ) ) ( AVAILABLE ?auto_664 ) ( SURFACE-AT ?auto_660 ?auto_661 ) ( ON ?auto_660 ?auto_665 ) ( CLEAR ?auto_660 ) ( not ( = ?auto_659 ?auto_665 ) ) ( not ( = ?auto_660 ?auto_665 ) ) ( not ( = ?auto_667 ?auto_665 ) ) ( TRUCK-AT ?auto_663 ?auto_662 ) ( SURFACE-AT ?auto_667 ?auto_662 ) ( CLEAR ?auto_667 ) ( LIFTING ?auto_666 ?auto_659 ) ( IS-CRATE ?auto_659 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_667 ?auto_659 )
      ( MAKE-2CRATE ?auto_667 ?auto_659 ?auto_660 )
      ( MAKE-1CRATE-VERIFY ?auto_659 ?auto_660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_668 - SURFACE
      ?auto_669 - SURFACE
      ?auto_670 - SURFACE
    )
    :vars
    (
      ?auto_674 - HOIST
      ?auto_675 - PLACE
      ?auto_671 - PLACE
      ?auto_672 - HOIST
      ?auto_676 - SURFACE
      ?auto_673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_674 ?auto_675 ) ( IS-CRATE ?auto_670 ) ( not ( = ?auto_669 ?auto_670 ) ) ( not ( = ?auto_668 ?auto_669 ) ) ( not ( = ?auto_668 ?auto_670 ) ) ( not ( = ?auto_671 ?auto_675 ) ) ( HOIST-AT ?auto_672 ?auto_671 ) ( not ( = ?auto_674 ?auto_672 ) ) ( AVAILABLE ?auto_672 ) ( SURFACE-AT ?auto_670 ?auto_671 ) ( ON ?auto_670 ?auto_676 ) ( CLEAR ?auto_670 ) ( not ( = ?auto_669 ?auto_676 ) ) ( not ( = ?auto_670 ?auto_676 ) ) ( not ( = ?auto_668 ?auto_676 ) ) ( TRUCK-AT ?auto_673 ?auto_675 ) ( SURFACE-AT ?auto_668 ?auto_675 ) ( CLEAR ?auto_668 ) ( LIFTING ?auto_674 ?auto_669 ) ( IS-CRATE ?auto_669 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_669 ?auto_670 )
      ( MAKE-2CRATE-VERIFY ?auto_668 ?auto_669 ?auto_670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_677 - SURFACE
      ?auto_678 - SURFACE
      ?auto_679 - SURFACE
      ?auto_680 - SURFACE
    )
    :vars
    (
      ?auto_685 - HOIST
      ?auto_686 - PLACE
      ?auto_683 - PLACE
      ?auto_684 - HOIST
      ?auto_681 - SURFACE
      ?auto_682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_685 ?auto_686 ) ( IS-CRATE ?auto_680 ) ( not ( = ?auto_679 ?auto_680 ) ) ( not ( = ?auto_678 ?auto_679 ) ) ( not ( = ?auto_678 ?auto_680 ) ) ( not ( = ?auto_683 ?auto_686 ) ) ( HOIST-AT ?auto_684 ?auto_683 ) ( not ( = ?auto_685 ?auto_684 ) ) ( AVAILABLE ?auto_684 ) ( SURFACE-AT ?auto_680 ?auto_683 ) ( ON ?auto_680 ?auto_681 ) ( CLEAR ?auto_680 ) ( not ( = ?auto_679 ?auto_681 ) ) ( not ( = ?auto_680 ?auto_681 ) ) ( not ( = ?auto_678 ?auto_681 ) ) ( TRUCK-AT ?auto_682 ?auto_686 ) ( SURFACE-AT ?auto_678 ?auto_686 ) ( CLEAR ?auto_678 ) ( LIFTING ?auto_685 ?auto_679 ) ( IS-CRATE ?auto_679 ) ( ON ?auto_678 ?auto_677 ) ( not ( = ?auto_677 ?auto_678 ) ) ( not ( = ?auto_677 ?auto_679 ) ) ( not ( = ?auto_677 ?auto_680 ) ) ( not ( = ?auto_677 ?auto_681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_678 ?auto_679 ?auto_680 )
      ( MAKE-3CRATE-VERIFY ?auto_677 ?auto_678 ?auto_679 ?auto_680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_687 - SURFACE
      ?auto_688 - SURFACE
    )
    :vars
    (
      ?auto_693 - HOIST
      ?auto_694 - PLACE
      ?auto_695 - SURFACE
      ?auto_691 - PLACE
      ?auto_692 - HOIST
      ?auto_689 - SURFACE
      ?auto_690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693 ?auto_694 ) ( IS-CRATE ?auto_688 ) ( not ( = ?auto_687 ?auto_688 ) ) ( not ( = ?auto_695 ?auto_687 ) ) ( not ( = ?auto_695 ?auto_688 ) ) ( not ( = ?auto_691 ?auto_694 ) ) ( HOIST-AT ?auto_692 ?auto_691 ) ( not ( = ?auto_693 ?auto_692 ) ) ( AVAILABLE ?auto_692 ) ( SURFACE-AT ?auto_688 ?auto_691 ) ( ON ?auto_688 ?auto_689 ) ( CLEAR ?auto_688 ) ( not ( = ?auto_687 ?auto_689 ) ) ( not ( = ?auto_688 ?auto_689 ) ) ( not ( = ?auto_695 ?auto_689 ) ) ( TRUCK-AT ?auto_690 ?auto_694 ) ( SURFACE-AT ?auto_695 ?auto_694 ) ( CLEAR ?auto_695 ) ( IS-CRATE ?auto_687 ) ( AVAILABLE ?auto_693 ) ( IN ?auto_687 ?auto_690 ) )
    :subtasks
    ( ( !UNLOAD ?auto_693 ?auto_687 ?auto_690 ?auto_694 )
      ( MAKE-2CRATE ?auto_695 ?auto_687 ?auto_688 )
      ( MAKE-1CRATE-VERIFY ?auto_687 ?auto_688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_696 - SURFACE
      ?auto_697 - SURFACE
      ?auto_698 - SURFACE
    )
    :vars
    (
      ?auto_703 - HOIST
      ?auto_701 - PLACE
      ?auto_704 - PLACE
      ?auto_702 - HOIST
      ?auto_699 - SURFACE
      ?auto_700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_703 ?auto_701 ) ( IS-CRATE ?auto_698 ) ( not ( = ?auto_697 ?auto_698 ) ) ( not ( = ?auto_696 ?auto_697 ) ) ( not ( = ?auto_696 ?auto_698 ) ) ( not ( = ?auto_704 ?auto_701 ) ) ( HOIST-AT ?auto_702 ?auto_704 ) ( not ( = ?auto_703 ?auto_702 ) ) ( AVAILABLE ?auto_702 ) ( SURFACE-AT ?auto_698 ?auto_704 ) ( ON ?auto_698 ?auto_699 ) ( CLEAR ?auto_698 ) ( not ( = ?auto_697 ?auto_699 ) ) ( not ( = ?auto_698 ?auto_699 ) ) ( not ( = ?auto_696 ?auto_699 ) ) ( TRUCK-AT ?auto_700 ?auto_701 ) ( SURFACE-AT ?auto_696 ?auto_701 ) ( CLEAR ?auto_696 ) ( IS-CRATE ?auto_697 ) ( AVAILABLE ?auto_703 ) ( IN ?auto_697 ?auto_700 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_697 ?auto_698 )
      ( MAKE-2CRATE-VERIFY ?auto_696 ?auto_697 ?auto_698 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_705 - SURFACE
      ?auto_706 - SURFACE
      ?auto_707 - SURFACE
      ?auto_708 - SURFACE
    )
    :vars
    (
      ?auto_714 - HOIST
      ?auto_713 - PLACE
      ?auto_709 - PLACE
      ?auto_710 - HOIST
      ?auto_711 - SURFACE
      ?auto_712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714 ?auto_713 ) ( IS-CRATE ?auto_708 ) ( not ( = ?auto_707 ?auto_708 ) ) ( not ( = ?auto_706 ?auto_707 ) ) ( not ( = ?auto_706 ?auto_708 ) ) ( not ( = ?auto_709 ?auto_713 ) ) ( HOIST-AT ?auto_710 ?auto_709 ) ( not ( = ?auto_714 ?auto_710 ) ) ( AVAILABLE ?auto_710 ) ( SURFACE-AT ?auto_708 ?auto_709 ) ( ON ?auto_708 ?auto_711 ) ( CLEAR ?auto_708 ) ( not ( = ?auto_707 ?auto_711 ) ) ( not ( = ?auto_708 ?auto_711 ) ) ( not ( = ?auto_706 ?auto_711 ) ) ( TRUCK-AT ?auto_712 ?auto_713 ) ( SURFACE-AT ?auto_706 ?auto_713 ) ( CLEAR ?auto_706 ) ( IS-CRATE ?auto_707 ) ( AVAILABLE ?auto_714 ) ( IN ?auto_707 ?auto_712 ) ( ON ?auto_706 ?auto_705 ) ( not ( = ?auto_705 ?auto_706 ) ) ( not ( = ?auto_705 ?auto_707 ) ) ( not ( = ?auto_705 ?auto_708 ) ) ( not ( = ?auto_705 ?auto_711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_706 ?auto_707 ?auto_708 )
      ( MAKE-3CRATE-VERIFY ?auto_705 ?auto_706 ?auto_707 ?auto_708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_715 - SURFACE
      ?auto_716 - SURFACE
    )
    :vars
    (
      ?auto_722 - HOIST
      ?auto_721 - PLACE
      ?auto_723 - SURFACE
      ?auto_717 - PLACE
      ?auto_718 - HOIST
      ?auto_719 - SURFACE
      ?auto_720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722 ?auto_721 ) ( IS-CRATE ?auto_716 ) ( not ( = ?auto_715 ?auto_716 ) ) ( not ( = ?auto_723 ?auto_715 ) ) ( not ( = ?auto_723 ?auto_716 ) ) ( not ( = ?auto_717 ?auto_721 ) ) ( HOIST-AT ?auto_718 ?auto_717 ) ( not ( = ?auto_722 ?auto_718 ) ) ( AVAILABLE ?auto_718 ) ( SURFACE-AT ?auto_716 ?auto_717 ) ( ON ?auto_716 ?auto_719 ) ( CLEAR ?auto_716 ) ( not ( = ?auto_715 ?auto_719 ) ) ( not ( = ?auto_716 ?auto_719 ) ) ( not ( = ?auto_723 ?auto_719 ) ) ( SURFACE-AT ?auto_723 ?auto_721 ) ( CLEAR ?auto_723 ) ( IS-CRATE ?auto_715 ) ( AVAILABLE ?auto_722 ) ( IN ?auto_715 ?auto_720 ) ( TRUCK-AT ?auto_720 ?auto_717 ) )
    :subtasks
    ( ( !DRIVE ?auto_720 ?auto_717 ?auto_721 )
      ( MAKE-2CRATE ?auto_723 ?auto_715 ?auto_716 )
      ( MAKE-1CRATE-VERIFY ?auto_715 ?auto_716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_724 - SURFACE
      ?auto_725 - SURFACE
      ?auto_726 - SURFACE
    )
    :vars
    (
      ?auto_729 - HOIST
      ?auto_731 - PLACE
      ?auto_730 - PLACE
      ?auto_728 - HOIST
      ?auto_732 - SURFACE
      ?auto_727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_729 ?auto_731 ) ( IS-CRATE ?auto_726 ) ( not ( = ?auto_725 ?auto_726 ) ) ( not ( = ?auto_724 ?auto_725 ) ) ( not ( = ?auto_724 ?auto_726 ) ) ( not ( = ?auto_730 ?auto_731 ) ) ( HOIST-AT ?auto_728 ?auto_730 ) ( not ( = ?auto_729 ?auto_728 ) ) ( AVAILABLE ?auto_728 ) ( SURFACE-AT ?auto_726 ?auto_730 ) ( ON ?auto_726 ?auto_732 ) ( CLEAR ?auto_726 ) ( not ( = ?auto_725 ?auto_732 ) ) ( not ( = ?auto_726 ?auto_732 ) ) ( not ( = ?auto_724 ?auto_732 ) ) ( SURFACE-AT ?auto_724 ?auto_731 ) ( CLEAR ?auto_724 ) ( IS-CRATE ?auto_725 ) ( AVAILABLE ?auto_729 ) ( IN ?auto_725 ?auto_727 ) ( TRUCK-AT ?auto_727 ?auto_730 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_725 ?auto_726 )
      ( MAKE-2CRATE-VERIFY ?auto_724 ?auto_725 ?auto_726 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_733 - SURFACE
      ?auto_734 - SURFACE
      ?auto_735 - SURFACE
      ?auto_736 - SURFACE
    )
    :vars
    (
      ?auto_740 - HOIST
      ?auto_742 - PLACE
      ?auto_741 - PLACE
      ?auto_737 - HOIST
      ?auto_738 - SURFACE
      ?auto_739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_740 ?auto_742 ) ( IS-CRATE ?auto_736 ) ( not ( = ?auto_735 ?auto_736 ) ) ( not ( = ?auto_734 ?auto_735 ) ) ( not ( = ?auto_734 ?auto_736 ) ) ( not ( = ?auto_741 ?auto_742 ) ) ( HOIST-AT ?auto_737 ?auto_741 ) ( not ( = ?auto_740 ?auto_737 ) ) ( AVAILABLE ?auto_737 ) ( SURFACE-AT ?auto_736 ?auto_741 ) ( ON ?auto_736 ?auto_738 ) ( CLEAR ?auto_736 ) ( not ( = ?auto_735 ?auto_738 ) ) ( not ( = ?auto_736 ?auto_738 ) ) ( not ( = ?auto_734 ?auto_738 ) ) ( SURFACE-AT ?auto_734 ?auto_742 ) ( CLEAR ?auto_734 ) ( IS-CRATE ?auto_735 ) ( AVAILABLE ?auto_740 ) ( IN ?auto_735 ?auto_739 ) ( TRUCK-AT ?auto_739 ?auto_741 ) ( ON ?auto_734 ?auto_733 ) ( not ( = ?auto_733 ?auto_734 ) ) ( not ( = ?auto_733 ?auto_735 ) ) ( not ( = ?auto_733 ?auto_736 ) ) ( not ( = ?auto_733 ?auto_738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_734 ?auto_735 ?auto_736 )
      ( MAKE-3CRATE-VERIFY ?auto_733 ?auto_734 ?auto_735 ?auto_736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743 - SURFACE
      ?auto_744 - SURFACE
    )
    :vars
    (
      ?auto_748 - HOIST
      ?auto_750 - PLACE
      ?auto_751 - SURFACE
      ?auto_749 - PLACE
      ?auto_745 - HOIST
      ?auto_746 - SURFACE
      ?auto_747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_748 ?auto_750 ) ( IS-CRATE ?auto_744 ) ( not ( = ?auto_743 ?auto_744 ) ) ( not ( = ?auto_751 ?auto_743 ) ) ( not ( = ?auto_751 ?auto_744 ) ) ( not ( = ?auto_749 ?auto_750 ) ) ( HOIST-AT ?auto_745 ?auto_749 ) ( not ( = ?auto_748 ?auto_745 ) ) ( SURFACE-AT ?auto_744 ?auto_749 ) ( ON ?auto_744 ?auto_746 ) ( CLEAR ?auto_744 ) ( not ( = ?auto_743 ?auto_746 ) ) ( not ( = ?auto_744 ?auto_746 ) ) ( not ( = ?auto_751 ?auto_746 ) ) ( SURFACE-AT ?auto_751 ?auto_750 ) ( CLEAR ?auto_751 ) ( IS-CRATE ?auto_743 ) ( AVAILABLE ?auto_748 ) ( TRUCK-AT ?auto_747 ?auto_749 ) ( LIFTING ?auto_745 ?auto_743 ) )
    :subtasks
    ( ( !LOAD ?auto_745 ?auto_743 ?auto_747 ?auto_749 )
      ( MAKE-2CRATE ?auto_751 ?auto_743 ?auto_744 )
      ( MAKE-1CRATE-VERIFY ?auto_743 ?auto_744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_752 - SURFACE
      ?auto_753 - SURFACE
      ?auto_754 - SURFACE
    )
    :vars
    (
      ?auto_756 - HOIST
      ?auto_757 - PLACE
      ?auto_759 - PLACE
      ?auto_755 - HOIST
      ?auto_758 - SURFACE
      ?auto_760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_756 ?auto_757 ) ( IS-CRATE ?auto_754 ) ( not ( = ?auto_753 ?auto_754 ) ) ( not ( = ?auto_752 ?auto_753 ) ) ( not ( = ?auto_752 ?auto_754 ) ) ( not ( = ?auto_759 ?auto_757 ) ) ( HOIST-AT ?auto_755 ?auto_759 ) ( not ( = ?auto_756 ?auto_755 ) ) ( SURFACE-AT ?auto_754 ?auto_759 ) ( ON ?auto_754 ?auto_758 ) ( CLEAR ?auto_754 ) ( not ( = ?auto_753 ?auto_758 ) ) ( not ( = ?auto_754 ?auto_758 ) ) ( not ( = ?auto_752 ?auto_758 ) ) ( SURFACE-AT ?auto_752 ?auto_757 ) ( CLEAR ?auto_752 ) ( IS-CRATE ?auto_753 ) ( AVAILABLE ?auto_756 ) ( TRUCK-AT ?auto_760 ?auto_759 ) ( LIFTING ?auto_755 ?auto_753 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_753 ?auto_754 )
      ( MAKE-2CRATE-VERIFY ?auto_752 ?auto_753 ?auto_754 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_761 - SURFACE
      ?auto_762 - SURFACE
      ?auto_763 - SURFACE
      ?auto_764 - SURFACE
    )
    :vars
    (
      ?auto_769 - HOIST
      ?auto_768 - PLACE
      ?auto_765 - PLACE
      ?auto_766 - HOIST
      ?auto_770 - SURFACE
      ?auto_767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_769 ?auto_768 ) ( IS-CRATE ?auto_764 ) ( not ( = ?auto_763 ?auto_764 ) ) ( not ( = ?auto_762 ?auto_763 ) ) ( not ( = ?auto_762 ?auto_764 ) ) ( not ( = ?auto_765 ?auto_768 ) ) ( HOIST-AT ?auto_766 ?auto_765 ) ( not ( = ?auto_769 ?auto_766 ) ) ( SURFACE-AT ?auto_764 ?auto_765 ) ( ON ?auto_764 ?auto_770 ) ( CLEAR ?auto_764 ) ( not ( = ?auto_763 ?auto_770 ) ) ( not ( = ?auto_764 ?auto_770 ) ) ( not ( = ?auto_762 ?auto_770 ) ) ( SURFACE-AT ?auto_762 ?auto_768 ) ( CLEAR ?auto_762 ) ( IS-CRATE ?auto_763 ) ( AVAILABLE ?auto_769 ) ( TRUCK-AT ?auto_767 ?auto_765 ) ( LIFTING ?auto_766 ?auto_763 ) ( ON ?auto_762 ?auto_761 ) ( not ( = ?auto_761 ?auto_762 ) ) ( not ( = ?auto_761 ?auto_763 ) ) ( not ( = ?auto_761 ?auto_764 ) ) ( not ( = ?auto_761 ?auto_770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_762 ?auto_763 ?auto_764 )
      ( MAKE-3CRATE-VERIFY ?auto_761 ?auto_762 ?auto_763 ?auto_764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_771 - SURFACE
      ?auto_772 - SURFACE
    )
    :vars
    (
      ?auto_777 - HOIST
      ?auto_776 - PLACE
      ?auto_779 - SURFACE
      ?auto_773 - PLACE
      ?auto_774 - HOIST
      ?auto_778 - SURFACE
      ?auto_775 - TRUCK
      ?auto_780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_777 ?auto_776 ) ( IS-CRATE ?auto_772 ) ( not ( = ?auto_771 ?auto_772 ) ) ( not ( = ?auto_779 ?auto_771 ) ) ( not ( = ?auto_779 ?auto_772 ) ) ( not ( = ?auto_773 ?auto_776 ) ) ( HOIST-AT ?auto_774 ?auto_773 ) ( not ( = ?auto_777 ?auto_774 ) ) ( SURFACE-AT ?auto_772 ?auto_773 ) ( ON ?auto_772 ?auto_778 ) ( CLEAR ?auto_772 ) ( not ( = ?auto_771 ?auto_778 ) ) ( not ( = ?auto_772 ?auto_778 ) ) ( not ( = ?auto_779 ?auto_778 ) ) ( SURFACE-AT ?auto_779 ?auto_776 ) ( CLEAR ?auto_779 ) ( IS-CRATE ?auto_771 ) ( AVAILABLE ?auto_777 ) ( TRUCK-AT ?auto_775 ?auto_773 ) ( AVAILABLE ?auto_774 ) ( SURFACE-AT ?auto_771 ?auto_773 ) ( ON ?auto_771 ?auto_780 ) ( CLEAR ?auto_771 ) ( not ( = ?auto_771 ?auto_780 ) ) ( not ( = ?auto_772 ?auto_780 ) ) ( not ( = ?auto_779 ?auto_780 ) ) ( not ( = ?auto_778 ?auto_780 ) ) )
    :subtasks
    ( ( !LIFT ?auto_774 ?auto_771 ?auto_780 ?auto_773 )
      ( MAKE-2CRATE ?auto_779 ?auto_771 ?auto_772 )
      ( MAKE-1CRATE-VERIFY ?auto_771 ?auto_772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_781 - SURFACE
      ?auto_782 - SURFACE
      ?auto_783 - SURFACE
    )
    :vars
    (
      ?auto_789 - HOIST
      ?auto_785 - PLACE
      ?auto_787 - PLACE
      ?auto_784 - HOIST
      ?auto_786 - SURFACE
      ?auto_788 - TRUCK
      ?auto_790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_789 ?auto_785 ) ( IS-CRATE ?auto_783 ) ( not ( = ?auto_782 ?auto_783 ) ) ( not ( = ?auto_781 ?auto_782 ) ) ( not ( = ?auto_781 ?auto_783 ) ) ( not ( = ?auto_787 ?auto_785 ) ) ( HOIST-AT ?auto_784 ?auto_787 ) ( not ( = ?auto_789 ?auto_784 ) ) ( SURFACE-AT ?auto_783 ?auto_787 ) ( ON ?auto_783 ?auto_786 ) ( CLEAR ?auto_783 ) ( not ( = ?auto_782 ?auto_786 ) ) ( not ( = ?auto_783 ?auto_786 ) ) ( not ( = ?auto_781 ?auto_786 ) ) ( SURFACE-AT ?auto_781 ?auto_785 ) ( CLEAR ?auto_781 ) ( IS-CRATE ?auto_782 ) ( AVAILABLE ?auto_789 ) ( TRUCK-AT ?auto_788 ?auto_787 ) ( AVAILABLE ?auto_784 ) ( SURFACE-AT ?auto_782 ?auto_787 ) ( ON ?auto_782 ?auto_790 ) ( CLEAR ?auto_782 ) ( not ( = ?auto_782 ?auto_790 ) ) ( not ( = ?auto_783 ?auto_790 ) ) ( not ( = ?auto_781 ?auto_790 ) ) ( not ( = ?auto_786 ?auto_790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_782 ?auto_783 )
      ( MAKE-2CRATE-VERIFY ?auto_781 ?auto_782 ?auto_783 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_791 - SURFACE
      ?auto_792 - SURFACE
      ?auto_793 - SURFACE
      ?auto_794 - SURFACE
    )
    :vars
    (
      ?auto_796 - HOIST
      ?auto_800 - PLACE
      ?auto_797 - PLACE
      ?auto_795 - HOIST
      ?auto_798 - SURFACE
      ?auto_799 - TRUCK
      ?auto_801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796 ?auto_800 ) ( IS-CRATE ?auto_794 ) ( not ( = ?auto_793 ?auto_794 ) ) ( not ( = ?auto_792 ?auto_793 ) ) ( not ( = ?auto_792 ?auto_794 ) ) ( not ( = ?auto_797 ?auto_800 ) ) ( HOIST-AT ?auto_795 ?auto_797 ) ( not ( = ?auto_796 ?auto_795 ) ) ( SURFACE-AT ?auto_794 ?auto_797 ) ( ON ?auto_794 ?auto_798 ) ( CLEAR ?auto_794 ) ( not ( = ?auto_793 ?auto_798 ) ) ( not ( = ?auto_794 ?auto_798 ) ) ( not ( = ?auto_792 ?auto_798 ) ) ( SURFACE-AT ?auto_792 ?auto_800 ) ( CLEAR ?auto_792 ) ( IS-CRATE ?auto_793 ) ( AVAILABLE ?auto_796 ) ( TRUCK-AT ?auto_799 ?auto_797 ) ( AVAILABLE ?auto_795 ) ( SURFACE-AT ?auto_793 ?auto_797 ) ( ON ?auto_793 ?auto_801 ) ( CLEAR ?auto_793 ) ( not ( = ?auto_793 ?auto_801 ) ) ( not ( = ?auto_794 ?auto_801 ) ) ( not ( = ?auto_792 ?auto_801 ) ) ( not ( = ?auto_798 ?auto_801 ) ) ( ON ?auto_792 ?auto_791 ) ( not ( = ?auto_791 ?auto_792 ) ) ( not ( = ?auto_791 ?auto_793 ) ) ( not ( = ?auto_791 ?auto_794 ) ) ( not ( = ?auto_791 ?auto_798 ) ) ( not ( = ?auto_791 ?auto_801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_792 ?auto_793 ?auto_794 )
      ( MAKE-3CRATE-VERIFY ?auto_791 ?auto_792 ?auto_793 ?auto_794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_802 - SURFACE
      ?auto_803 - SURFACE
    )
    :vars
    (
      ?auto_805 - HOIST
      ?auto_809 - PLACE
      ?auto_811 - SURFACE
      ?auto_806 - PLACE
      ?auto_804 - HOIST
      ?auto_807 - SURFACE
      ?auto_810 - SURFACE
      ?auto_808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_805 ?auto_809 ) ( IS-CRATE ?auto_803 ) ( not ( = ?auto_802 ?auto_803 ) ) ( not ( = ?auto_811 ?auto_802 ) ) ( not ( = ?auto_811 ?auto_803 ) ) ( not ( = ?auto_806 ?auto_809 ) ) ( HOIST-AT ?auto_804 ?auto_806 ) ( not ( = ?auto_805 ?auto_804 ) ) ( SURFACE-AT ?auto_803 ?auto_806 ) ( ON ?auto_803 ?auto_807 ) ( CLEAR ?auto_803 ) ( not ( = ?auto_802 ?auto_807 ) ) ( not ( = ?auto_803 ?auto_807 ) ) ( not ( = ?auto_811 ?auto_807 ) ) ( SURFACE-AT ?auto_811 ?auto_809 ) ( CLEAR ?auto_811 ) ( IS-CRATE ?auto_802 ) ( AVAILABLE ?auto_805 ) ( AVAILABLE ?auto_804 ) ( SURFACE-AT ?auto_802 ?auto_806 ) ( ON ?auto_802 ?auto_810 ) ( CLEAR ?auto_802 ) ( not ( = ?auto_802 ?auto_810 ) ) ( not ( = ?auto_803 ?auto_810 ) ) ( not ( = ?auto_811 ?auto_810 ) ) ( not ( = ?auto_807 ?auto_810 ) ) ( TRUCK-AT ?auto_808 ?auto_809 ) )
    :subtasks
    ( ( !DRIVE ?auto_808 ?auto_809 ?auto_806 )
      ( MAKE-2CRATE ?auto_811 ?auto_802 ?auto_803 )
      ( MAKE-1CRATE-VERIFY ?auto_802 ?auto_803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_812 - SURFACE
      ?auto_813 - SURFACE
      ?auto_814 - SURFACE
    )
    :vars
    (
      ?auto_820 - HOIST
      ?auto_815 - PLACE
      ?auto_819 - PLACE
      ?auto_821 - HOIST
      ?auto_818 - SURFACE
      ?auto_817 - SURFACE
      ?auto_816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_820 ?auto_815 ) ( IS-CRATE ?auto_814 ) ( not ( = ?auto_813 ?auto_814 ) ) ( not ( = ?auto_812 ?auto_813 ) ) ( not ( = ?auto_812 ?auto_814 ) ) ( not ( = ?auto_819 ?auto_815 ) ) ( HOIST-AT ?auto_821 ?auto_819 ) ( not ( = ?auto_820 ?auto_821 ) ) ( SURFACE-AT ?auto_814 ?auto_819 ) ( ON ?auto_814 ?auto_818 ) ( CLEAR ?auto_814 ) ( not ( = ?auto_813 ?auto_818 ) ) ( not ( = ?auto_814 ?auto_818 ) ) ( not ( = ?auto_812 ?auto_818 ) ) ( SURFACE-AT ?auto_812 ?auto_815 ) ( CLEAR ?auto_812 ) ( IS-CRATE ?auto_813 ) ( AVAILABLE ?auto_820 ) ( AVAILABLE ?auto_821 ) ( SURFACE-AT ?auto_813 ?auto_819 ) ( ON ?auto_813 ?auto_817 ) ( CLEAR ?auto_813 ) ( not ( = ?auto_813 ?auto_817 ) ) ( not ( = ?auto_814 ?auto_817 ) ) ( not ( = ?auto_812 ?auto_817 ) ) ( not ( = ?auto_818 ?auto_817 ) ) ( TRUCK-AT ?auto_816 ?auto_815 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_813 ?auto_814 )
      ( MAKE-2CRATE-VERIFY ?auto_812 ?auto_813 ?auto_814 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_822 - SURFACE
      ?auto_823 - SURFACE
      ?auto_824 - SURFACE
      ?auto_825 - SURFACE
    )
    :vars
    (
      ?auto_827 - HOIST
      ?auto_829 - PLACE
      ?auto_828 - PLACE
      ?auto_832 - HOIST
      ?auto_830 - SURFACE
      ?auto_826 - SURFACE
      ?auto_831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_827 ?auto_829 ) ( IS-CRATE ?auto_825 ) ( not ( = ?auto_824 ?auto_825 ) ) ( not ( = ?auto_823 ?auto_824 ) ) ( not ( = ?auto_823 ?auto_825 ) ) ( not ( = ?auto_828 ?auto_829 ) ) ( HOIST-AT ?auto_832 ?auto_828 ) ( not ( = ?auto_827 ?auto_832 ) ) ( SURFACE-AT ?auto_825 ?auto_828 ) ( ON ?auto_825 ?auto_830 ) ( CLEAR ?auto_825 ) ( not ( = ?auto_824 ?auto_830 ) ) ( not ( = ?auto_825 ?auto_830 ) ) ( not ( = ?auto_823 ?auto_830 ) ) ( SURFACE-AT ?auto_823 ?auto_829 ) ( CLEAR ?auto_823 ) ( IS-CRATE ?auto_824 ) ( AVAILABLE ?auto_827 ) ( AVAILABLE ?auto_832 ) ( SURFACE-AT ?auto_824 ?auto_828 ) ( ON ?auto_824 ?auto_826 ) ( CLEAR ?auto_824 ) ( not ( = ?auto_824 ?auto_826 ) ) ( not ( = ?auto_825 ?auto_826 ) ) ( not ( = ?auto_823 ?auto_826 ) ) ( not ( = ?auto_830 ?auto_826 ) ) ( TRUCK-AT ?auto_831 ?auto_829 ) ( ON ?auto_823 ?auto_822 ) ( not ( = ?auto_822 ?auto_823 ) ) ( not ( = ?auto_822 ?auto_824 ) ) ( not ( = ?auto_822 ?auto_825 ) ) ( not ( = ?auto_822 ?auto_830 ) ) ( not ( = ?auto_822 ?auto_826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823 ?auto_824 ?auto_825 )
      ( MAKE-3CRATE-VERIFY ?auto_822 ?auto_823 ?auto_824 ?auto_825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_833 - SURFACE
      ?auto_834 - SURFACE
    )
    :vars
    (
      ?auto_836 - HOIST
      ?auto_838 - PLACE
      ?auto_842 - SURFACE
      ?auto_837 - PLACE
      ?auto_841 - HOIST
      ?auto_839 - SURFACE
      ?auto_835 - SURFACE
      ?auto_840 - TRUCK
      ?auto_843 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_836 ?auto_838 ) ( IS-CRATE ?auto_834 ) ( not ( = ?auto_833 ?auto_834 ) ) ( not ( = ?auto_842 ?auto_833 ) ) ( not ( = ?auto_842 ?auto_834 ) ) ( not ( = ?auto_837 ?auto_838 ) ) ( HOIST-AT ?auto_841 ?auto_837 ) ( not ( = ?auto_836 ?auto_841 ) ) ( SURFACE-AT ?auto_834 ?auto_837 ) ( ON ?auto_834 ?auto_839 ) ( CLEAR ?auto_834 ) ( not ( = ?auto_833 ?auto_839 ) ) ( not ( = ?auto_834 ?auto_839 ) ) ( not ( = ?auto_842 ?auto_839 ) ) ( IS-CRATE ?auto_833 ) ( AVAILABLE ?auto_841 ) ( SURFACE-AT ?auto_833 ?auto_837 ) ( ON ?auto_833 ?auto_835 ) ( CLEAR ?auto_833 ) ( not ( = ?auto_833 ?auto_835 ) ) ( not ( = ?auto_834 ?auto_835 ) ) ( not ( = ?auto_842 ?auto_835 ) ) ( not ( = ?auto_839 ?auto_835 ) ) ( TRUCK-AT ?auto_840 ?auto_838 ) ( SURFACE-AT ?auto_843 ?auto_838 ) ( CLEAR ?auto_843 ) ( LIFTING ?auto_836 ?auto_842 ) ( IS-CRATE ?auto_842 ) ( not ( = ?auto_843 ?auto_842 ) ) ( not ( = ?auto_833 ?auto_843 ) ) ( not ( = ?auto_834 ?auto_843 ) ) ( not ( = ?auto_839 ?auto_843 ) ) ( not ( = ?auto_835 ?auto_843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_843 ?auto_842 )
      ( MAKE-2CRATE ?auto_842 ?auto_833 ?auto_834 )
      ( MAKE-1CRATE-VERIFY ?auto_833 ?auto_834 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844 - SURFACE
      ?auto_845 - SURFACE
      ?auto_846 - SURFACE
    )
    :vars
    (
      ?auto_854 - HOIST
      ?auto_851 - PLACE
      ?auto_848 - PLACE
      ?auto_853 - HOIST
      ?auto_850 - SURFACE
      ?auto_849 - SURFACE
      ?auto_852 - TRUCK
      ?auto_847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854 ?auto_851 ) ( IS-CRATE ?auto_846 ) ( not ( = ?auto_845 ?auto_846 ) ) ( not ( = ?auto_844 ?auto_845 ) ) ( not ( = ?auto_844 ?auto_846 ) ) ( not ( = ?auto_848 ?auto_851 ) ) ( HOIST-AT ?auto_853 ?auto_848 ) ( not ( = ?auto_854 ?auto_853 ) ) ( SURFACE-AT ?auto_846 ?auto_848 ) ( ON ?auto_846 ?auto_850 ) ( CLEAR ?auto_846 ) ( not ( = ?auto_845 ?auto_850 ) ) ( not ( = ?auto_846 ?auto_850 ) ) ( not ( = ?auto_844 ?auto_850 ) ) ( IS-CRATE ?auto_845 ) ( AVAILABLE ?auto_853 ) ( SURFACE-AT ?auto_845 ?auto_848 ) ( ON ?auto_845 ?auto_849 ) ( CLEAR ?auto_845 ) ( not ( = ?auto_845 ?auto_849 ) ) ( not ( = ?auto_846 ?auto_849 ) ) ( not ( = ?auto_844 ?auto_849 ) ) ( not ( = ?auto_850 ?auto_849 ) ) ( TRUCK-AT ?auto_852 ?auto_851 ) ( SURFACE-AT ?auto_847 ?auto_851 ) ( CLEAR ?auto_847 ) ( LIFTING ?auto_854 ?auto_844 ) ( IS-CRATE ?auto_844 ) ( not ( = ?auto_847 ?auto_844 ) ) ( not ( = ?auto_845 ?auto_847 ) ) ( not ( = ?auto_846 ?auto_847 ) ) ( not ( = ?auto_850 ?auto_847 ) ) ( not ( = ?auto_849 ?auto_847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845 ?auto_846 )
      ( MAKE-2CRATE-VERIFY ?auto_844 ?auto_845 ?auto_846 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_855 - SURFACE
      ?auto_856 - SURFACE
      ?auto_857 - SURFACE
      ?auto_858 - SURFACE
    )
    :vars
    (
      ?auto_862 - HOIST
      ?auto_865 - PLACE
      ?auto_863 - PLACE
      ?auto_861 - HOIST
      ?auto_859 - SURFACE
      ?auto_860 - SURFACE
      ?auto_864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_862 ?auto_865 ) ( IS-CRATE ?auto_858 ) ( not ( = ?auto_857 ?auto_858 ) ) ( not ( = ?auto_856 ?auto_857 ) ) ( not ( = ?auto_856 ?auto_858 ) ) ( not ( = ?auto_863 ?auto_865 ) ) ( HOIST-AT ?auto_861 ?auto_863 ) ( not ( = ?auto_862 ?auto_861 ) ) ( SURFACE-AT ?auto_858 ?auto_863 ) ( ON ?auto_858 ?auto_859 ) ( CLEAR ?auto_858 ) ( not ( = ?auto_857 ?auto_859 ) ) ( not ( = ?auto_858 ?auto_859 ) ) ( not ( = ?auto_856 ?auto_859 ) ) ( IS-CRATE ?auto_857 ) ( AVAILABLE ?auto_861 ) ( SURFACE-AT ?auto_857 ?auto_863 ) ( ON ?auto_857 ?auto_860 ) ( CLEAR ?auto_857 ) ( not ( = ?auto_857 ?auto_860 ) ) ( not ( = ?auto_858 ?auto_860 ) ) ( not ( = ?auto_856 ?auto_860 ) ) ( not ( = ?auto_859 ?auto_860 ) ) ( TRUCK-AT ?auto_864 ?auto_865 ) ( SURFACE-AT ?auto_855 ?auto_865 ) ( CLEAR ?auto_855 ) ( LIFTING ?auto_862 ?auto_856 ) ( IS-CRATE ?auto_856 ) ( not ( = ?auto_855 ?auto_856 ) ) ( not ( = ?auto_857 ?auto_855 ) ) ( not ( = ?auto_858 ?auto_855 ) ) ( not ( = ?auto_859 ?auto_855 ) ) ( not ( = ?auto_860 ?auto_855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_856 ?auto_857 ?auto_858 )
      ( MAKE-3CRATE-VERIFY ?auto_855 ?auto_856 ?auto_857 ?auto_858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_866 - SURFACE
      ?auto_867 - SURFACE
    )
    :vars
    (
      ?auto_872 - HOIST
      ?auto_875 - PLACE
      ?auto_876 - SURFACE
      ?auto_873 - PLACE
      ?auto_871 - HOIST
      ?auto_868 - SURFACE
      ?auto_870 - SURFACE
      ?auto_874 - TRUCK
      ?auto_869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_872 ?auto_875 ) ( IS-CRATE ?auto_867 ) ( not ( = ?auto_866 ?auto_867 ) ) ( not ( = ?auto_876 ?auto_866 ) ) ( not ( = ?auto_876 ?auto_867 ) ) ( not ( = ?auto_873 ?auto_875 ) ) ( HOIST-AT ?auto_871 ?auto_873 ) ( not ( = ?auto_872 ?auto_871 ) ) ( SURFACE-AT ?auto_867 ?auto_873 ) ( ON ?auto_867 ?auto_868 ) ( CLEAR ?auto_867 ) ( not ( = ?auto_866 ?auto_868 ) ) ( not ( = ?auto_867 ?auto_868 ) ) ( not ( = ?auto_876 ?auto_868 ) ) ( IS-CRATE ?auto_866 ) ( AVAILABLE ?auto_871 ) ( SURFACE-AT ?auto_866 ?auto_873 ) ( ON ?auto_866 ?auto_870 ) ( CLEAR ?auto_866 ) ( not ( = ?auto_866 ?auto_870 ) ) ( not ( = ?auto_867 ?auto_870 ) ) ( not ( = ?auto_876 ?auto_870 ) ) ( not ( = ?auto_868 ?auto_870 ) ) ( TRUCK-AT ?auto_874 ?auto_875 ) ( SURFACE-AT ?auto_869 ?auto_875 ) ( CLEAR ?auto_869 ) ( IS-CRATE ?auto_876 ) ( not ( = ?auto_869 ?auto_876 ) ) ( not ( = ?auto_866 ?auto_869 ) ) ( not ( = ?auto_867 ?auto_869 ) ) ( not ( = ?auto_868 ?auto_869 ) ) ( not ( = ?auto_870 ?auto_869 ) ) ( AVAILABLE ?auto_872 ) ( IN ?auto_876 ?auto_874 ) )
    :subtasks
    ( ( !UNLOAD ?auto_872 ?auto_876 ?auto_874 ?auto_875 )
      ( MAKE-2CRATE ?auto_876 ?auto_866 ?auto_867 )
      ( MAKE-1CRATE-VERIFY ?auto_866 ?auto_867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_877 - SURFACE
      ?auto_878 - SURFACE
      ?auto_879 - SURFACE
    )
    :vars
    (
      ?auto_884 - HOIST
      ?auto_880 - PLACE
      ?auto_882 - PLACE
      ?auto_887 - HOIST
      ?auto_885 - SURFACE
      ?auto_883 - SURFACE
      ?auto_881 - TRUCK
      ?auto_886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_884 ?auto_880 ) ( IS-CRATE ?auto_879 ) ( not ( = ?auto_878 ?auto_879 ) ) ( not ( = ?auto_877 ?auto_878 ) ) ( not ( = ?auto_877 ?auto_879 ) ) ( not ( = ?auto_882 ?auto_880 ) ) ( HOIST-AT ?auto_887 ?auto_882 ) ( not ( = ?auto_884 ?auto_887 ) ) ( SURFACE-AT ?auto_879 ?auto_882 ) ( ON ?auto_879 ?auto_885 ) ( CLEAR ?auto_879 ) ( not ( = ?auto_878 ?auto_885 ) ) ( not ( = ?auto_879 ?auto_885 ) ) ( not ( = ?auto_877 ?auto_885 ) ) ( IS-CRATE ?auto_878 ) ( AVAILABLE ?auto_887 ) ( SURFACE-AT ?auto_878 ?auto_882 ) ( ON ?auto_878 ?auto_883 ) ( CLEAR ?auto_878 ) ( not ( = ?auto_878 ?auto_883 ) ) ( not ( = ?auto_879 ?auto_883 ) ) ( not ( = ?auto_877 ?auto_883 ) ) ( not ( = ?auto_885 ?auto_883 ) ) ( TRUCK-AT ?auto_881 ?auto_880 ) ( SURFACE-AT ?auto_886 ?auto_880 ) ( CLEAR ?auto_886 ) ( IS-CRATE ?auto_877 ) ( not ( = ?auto_886 ?auto_877 ) ) ( not ( = ?auto_878 ?auto_886 ) ) ( not ( = ?auto_879 ?auto_886 ) ) ( not ( = ?auto_885 ?auto_886 ) ) ( not ( = ?auto_883 ?auto_886 ) ) ( AVAILABLE ?auto_884 ) ( IN ?auto_877 ?auto_881 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_878 ?auto_879 )
      ( MAKE-2CRATE-VERIFY ?auto_877 ?auto_878 ?auto_879 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_888 - SURFACE
      ?auto_889 - SURFACE
      ?auto_890 - SURFACE
      ?auto_891 - SURFACE
    )
    :vars
    (
      ?auto_897 - HOIST
      ?auto_894 - PLACE
      ?auto_893 - PLACE
      ?auto_895 - HOIST
      ?auto_896 - SURFACE
      ?auto_892 - SURFACE
      ?auto_898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_897 ?auto_894 ) ( IS-CRATE ?auto_891 ) ( not ( = ?auto_890 ?auto_891 ) ) ( not ( = ?auto_889 ?auto_890 ) ) ( not ( = ?auto_889 ?auto_891 ) ) ( not ( = ?auto_893 ?auto_894 ) ) ( HOIST-AT ?auto_895 ?auto_893 ) ( not ( = ?auto_897 ?auto_895 ) ) ( SURFACE-AT ?auto_891 ?auto_893 ) ( ON ?auto_891 ?auto_896 ) ( CLEAR ?auto_891 ) ( not ( = ?auto_890 ?auto_896 ) ) ( not ( = ?auto_891 ?auto_896 ) ) ( not ( = ?auto_889 ?auto_896 ) ) ( IS-CRATE ?auto_890 ) ( AVAILABLE ?auto_895 ) ( SURFACE-AT ?auto_890 ?auto_893 ) ( ON ?auto_890 ?auto_892 ) ( CLEAR ?auto_890 ) ( not ( = ?auto_890 ?auto_892 ) ) ( not ( = ?auto_891 ?auto_892 ) ) ( not ( = ?auto_889 ?auto_892 ) ) ( not ( = ?auto_896 ?auto_892 ) ) ( TRUCK-AT ?auto_898 ?auto_894 ) ( SURFACE-AT ?auto_888 ?auto_894 ) ( CLEAR ?auto_888 ) ( IS-CRATE ?auto_889 ) ( not ( = ?auto_888 ?auto_889 ) ) ( not ( = ?auto_890 ?auto_888 ) ) ( not ( = ?auto_891 ?auto_888 ) ) ( not ( = ?auto_896 ?auto_888 ) ) ( not ( = ?auto_892 ?auto_888 ) ) ( AVAILABLE ?auto_897 ) ( IN ?auto_889 ?auto_898 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_889 ?auto_890 ?auto_891 )
      ( MAKE-3CRATE-VERIFY ?auto_888 ?auto_889 ?auto_890 ?auto_891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_899 - SURFACE
      ?auto_900 - SURFACE
    )
    :vars
    (
      ?auto_907 - HOIST
      ?auto_904 - PLACE
      ?auto_909 - SURFACE
      ?auto_902 - PLACE
      ?auto_905 - HOIST
      ?auto_906 - SURFACE
      ?auto_901 - SURFACE
      ?auto_903 - SURFACE
      ?auto_908 - TRUCK
      ?auto_910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_907 ?auto_904 ) ( IS-CRATE ?auto_900 ) ( not ( = ?auto_899 ?auto_900 ) ) ( not ( = ?auto_909 ?auto_899 ) ) ( not ( = ?auto_909 ?auto_900 ) ) ( not ( = ?auto_902 ?auto_904 ) ) ( HOIST-AT ?auto_905 ?auto_902 ) ( not ( = ?auto_907 ?auto_905 ) ) ( SURFACE-AT ?auto_900 ?auto_902 ) ( ON ?auto_900 ?auto_906 ) ( CLEAR ?auto_900 ) ( not ( = ?auto_899 ?auto_906 ) ) ( not ( = ?auto_900 ?auto_906 ) ) ( not ( = ?auto_909 ?auto_906 ) ) ( IS-CRATE ?auto_899 ) ( AVAILABLE ?auto_905 ) ( SURFACE-AT ?auto_899 ?auto_902 ) ( ON ?auto_899 ?auto_901 ) ( CLEAR ?auto_899 ) ( not ( = ?auto_899 ?auto_901 ) ) ( not ( = ?auto_900 ?auto_901 ) ) ( not ( = ?auto_909 ?auto_901 ) ) ( not ( = ?auto_906 ?auto_901 ) ) ( SURFACE-AT ?auto_903 ?auto_904 ) ( CLEAR ?auto_903 ) ( IS-CRATE ?auto_909 ) ( not ( = ?auto_903 ?auto_909 ) ) ( not ( = ?auto_899 ?auto_903 ) ) ( not ( = ?auto_900 ?auto_903 ) ) ( not ( = ?auto_906 ?auto_903 ) ) ( not ( = ?auto_901 ?auto_903 ) ) ( AVAILABLE ?auto_907 ) ( IN ?auto_909 ?auto_908 ) ( TRUCK-AT ?auto_908 ?auto_910 ) ( not ( = ?auto_910 ?auto_904 ) ) ( not ( = ?auto_902 ?auto_910 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_908 ?auto_910 ?auto_904 )
      ( MAKE-2CRATE ?auto_909 ?auto_899 ?auto_900 )
      ( MAKE-1CRATE-VERIFY ?auto_899 ?auto_900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911 - SURFACE
      ?auto_912 - SURFACE
      ?auto_913 - SURFACE
    )
    :vars
    (
      ?auto_914 - HOIST
      ?auto_916 - PLACE
      ?auto_922 - PLACE
      ?auto_915 - HOIST
      ?auto_920 - SURFACE
      ?auto_919 - SURFACE
      ?auto_918 - SURFACE
      ?auto_917 - TRUCK
      ?auto_921 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_914 ?auto_916 ) ( IS-CRATE ?auto_913 ) ( not ( = ?auto_912 ?auto_913 ) ) ( not ( = ?auto_911 ?auto_912 ) ) ( not ( = ?auto_911 ?auto_913 ) ) ( not ( = ?auto_922 ?auto_916 ) ) ( HOIST-AT ?auto_915 ?auto_922 ) ( not ( = ?auto_914 ?auto_915 ) ) ( SURFACE-AT ?auto_913 ?auto_922 ) ( ON ?auto_913 ?auto_920 ) ( CLEAR ?auto_913 ) ( not ( = ?auto_912 ?auto_920 ) ) ( not ( = ?auto_913 ?auto_920 ) ) ( not ( = ?auto_911 ?auto_920 ) ) ( IS-CRATE ?auto_912 ) ( AVAILABLE ?auto_915 ) ( SURFACE-AT ?auto_912 ?auto_922 ) ( ON ?auto_912 ?auto_919 ) ( CLEAR ?auto_912 ) ( not ( = ?auto_912 ?auto_919 ) ) ( not ( = ?auto_913 ?auto_919 ) ) ( not ( = ?auto_911 ?auto_919 ) ) ( not ( = ?auto_920 ?auto_919 ) ) ( SURFACE-AT ?auto_918 ?auto_916 ) ( CLEAR ?auto_918 ) ( IS-CRATE ?auto_911 ) ( not ( = ?auto_918 ?auto_911 ) ) ( not ( = ?auto_912 ?auto_918 ) ) ( not ( = ?auto_913 ?auto_918 ) ) ( not ( = ?auto_920 ?auto_918 ) ) ( not ( = ?auto_919 ?auto_918 ) ) ( AVAILABLE ?auto_914 ) ( IN ?auto_911 ?auto_917 ) ( TRUCK-AT ?auto_917 ?auto_921 ) ( not ( = ?auto_921 ?auto_916 ) ) ( not ( = ?auto_922 ?auto_921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_912 ?auto_913 )
      ( MAKE-2CRATE-VERIFY ?auto_911 ?auto_912 ?auto_913 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_923 - SURFACE
      ?auto_924 - SURFACE
      ?auto_925 - SURFACE
      ?auto_926 - SURFACE
    )
    :vars
    (
      ?auto_927 - HOIST
      ?auto_929 - PLACE
      ?auto_931 - PLACE
      ?auto_930 - HOIST
      ?auto_932 - SURFACE
      ?auto_934 - SURFACE
      ?auto_928 - TRUCK
      ?auto_933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_927 ?auto_929 ) ( IS-CRATE ?auto_926 ) ( not ( = ?auto_925 ?auto_926 ) ) ( not ( = ?auto_924 ?auto_925 ) ) ( not ( = ?auto_924 ?auto_926 ) ) ( not ( = ?auto_931 ?auto_929 ) ) ( HOIST-AT ?auto_930 ?auto_931 ) ( not ( = ?auto_927 ?auto_930 ) ) ( SURFACE-AT ?auto_926 ?auto_931 ) ( ON ?auto_926 ?auto_932 ) ( CLEAR ?auto_926 ) ( not ( = ?auto_925 ?auto_932 ) ) ( not ( = ?auto_926 ?auto_932 ) ) ( not ( = ?auto_924 ?auto_932 ) ) ( IS-CRATE ?auto_925 ) ( AVAILABLE ?auto_930 ) ( SURFACE-AT ?auto_925 ?auto_931 ) ( ON ?auto_925 ?auto_934 ) ( CLEAR ?auto_925 ) ( not ( = ?auto_925 ?auto_934 ) ) ( not ( = ?auto_926 ?auto_934 ) ) ( not ( = ?auto_924 ?auto_934 ) ) ( not ( = ?auto_932 ?auto_934 ) ) ( SURFACE-AT ?auto_923 ?auto_929 ) ( CLEAR ?auto_923 ) ( IS-CRATE ?auto_924 ) ( not ( = ?auto_923 ?auto_924 ) ) ( not ( = ?auto_925 ?auto_923 ) ) ( not ( = ?auto_926 ?auto_923 ) ) ( not ( = ?auto_932 ?auto_923 ) ) ( not ( = ?auto_934 ?auto_923 ) ) ( AVAILABLE ?auto_927 ) ( IN ?auto_924 ?auto_928 ) ( TRUCK-AT ?auto_928 ?auto_933 ) ( not ( = ?auto_933 ?auto_929 ) ) ( not ( = ?auto_931 ?auto_933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_924 ?auto_925 ?auto_926 )
      ( MAKE-3CRATE-VERIFY ?auto_923 ?auto_924 ?auto_925 ?auto_926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_935 - SURFACE
      ?auto_936 - SURFACE
    )
    :vars
    (
      ?auto_937 - HOIST
      ?auto_939 - PLACE
      ?auto_946 - SURFACE
      ?auto_942 - PLACE
      ?auto_941 - HOIST
      ?auto_943 - SURFACE
      ?auto_945 - SURFACE
      ?auto_940 - SURFACE
      ?auto_938 - TRUCK
      ?auto_944 - PLACE
      ?auto_947 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_937 ?auto_939 ) ( IS-CRATE ?auto_936 ) ( not ( = ?auto_935 ?auto_936 ) ) ( not ( = ?auto_946 ?auto_935 ) ) ( not ( = ?auto_946 ?auto_936 ) ) ( not ( = ?auto_942 ?auto_939 ) ) ( HOIST-AT ?auto_941 ?auto_942 ) ( not ( = ?auto_937 ?auto_941 ) ) ( SURFACE-AT ?auto_936 ?auto_942 ) ( ON ?auto_936 ?auto_943 ) ( CLEAR ?auto_936 ) ( not ( = ?auto_935 ?auto_943 ) ) ( not ( = ?auto_936 ?auto_943 ) ) ( not ( = ?auto_946 ?auto_943 ) ) ( IS-CRATE ?auto_935 ) ( AVAILABLE ?auto_941 ) ( SURFACE-AT ?auto_935 ?auto_942 ) ( ON ?auto_935 ?auto_945 ) ( CLEAR ?auto_935 ) ( not ( = ?auto_935 ?auto_945 ) ) ( not ( = ?auto_936 ?auto_945 ) ) ( not ( = ?auto_946 ?auto_945 ) ) ( not ( = ?auto_943 ?auto_945 ) ) ( SURFACE-AT ?auto_940 ?auto_939 ) ( CLEAR ?auto_940 ) ( IS-CRATE ?auto_946 ) ( not ( = ?auto_940 ?auto_946 ) ) ( not ( = ?auto_935 ?auto_940 ) ) ( not ( = ?auto_936 ?auto_940 ) ) ( not ( = ?auto_943 ?auto_940 ) ) ( not ( = ?auto_945 ?auto_940 ) ) ( AVAILABLE ?auto_937 ) ( TRUCK-AT ?auto_938 ?auto_944 ) ( not ( = ?auto_944 ?auto_939 ) ) ( not ( = ?auto_942 ?auto_944 ) ) ( HOIST-AT ?auto_947 ?auto_944 ) ( LIFTING ?auto_947 ?auto_946 ) ( not ( = ?auto_937 ?auto_947 ) ) ( not ( = ?auto_941 ?auto_947 ) ) )
    :subtasks
    ( ( !LOAD ?auto_947 ?auto_946 ?auto_938 ?auto_944 )
      ( MAKE-2CRATE ?auto_946 ?auto_935 ?auto_936 )
      ( MAKE-1CRATE-VERIFY ?auto_935 ?auto_936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_948 - SURFACE
      ?auto_949 - SURFACE
      ?auto_950 - SURFACE
    )
    :vars
    (
      ?auto_960 - HOIST
      ?auto_952 - PLACE
      ?auto_955 - PLACE
      ?auto_958 - HOIST
      ?auto_956 - SURFACE
      ?auto_957 - SURFACE
      ?auto_953 - SURFACE
      ?auto_954 - TRUCK
      ?auto_951 - PLACE
      ?auto_959 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_960 ?auto_952 ) ( IS-CRATE ?auto_950 ) ( not ( = ?auto_949 ?auto_950 ) ) ( not ( = ?auto_948 ?auto_949 ) ) ( not ( = ?auto_948 ?auto_950 ) ) ( not ( = ?auto_955 ?auto_952 ) ) ( HOIST-AT ?auto_958 ?auto_955 ) ( not ( = ?auto_960 ?auto_958 ) ) ( SURFACE-AT ?auto_950 ?auto_955 ) ( ON ?auto_950 ?auto_956 ) ( CLEAR ?auto_950 ) ( not ( = ?auto_949 ?auto_956 ) ) ( not ( = ?auto_950 ?auto_956 ) ) ( not ( = ?auto_948 ?auto_956 ) ) ( IS-CRATE ?auto_949 ) ( AVAILABLE ?auto_958 ) ( SURFACE-AT ?auto_949 ?auto_955 ) ( ON ?auto_949 ?auto_957 ) ( CLEAR ?auto_949 ) ( not ( = ?auto_949 ?auto_957 ) ) ( not ( = ?auto_950 ?auto_957 ) ) ( not ( = ?auto_948 ?auto_957 ) ) ( not ( = ?auto_956 ?auto_957 ) ) ( SURFACE-AT ?auto_953 ?auto_952 ) ( CLEAR ?auto_953 ) ( IS-CRATE ?auto_948 ) ( not ( = ?auto_953 ?auto_948 ) ) ( not ( = ?auto_949 ?auto_953 ) ) ( not ( = ?auto_950 ?auto_953 ) ) ( not ( = ?auto_956 ?auto_953 ) ) ( not ( = ?auto_957 ?auto_953 ) ) ( AVAILABLE ?auto_960 ) ( TRUCK-AT ?auto_954 ?auto_951 ) ( not ( = ?auto_951 ?auto_952 ) ) ( not ( = ?auto_955 ?auto_951 ) ) ( HOIST-AT ?auto_959 ?auto_951 ) ( LIFTING ?auto_959 ?auto_948 ) ( not ( = ?auto_960 ?auto_959 ) ) ( not ( = ?auto_958 ?auto_959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_949 ?auto_950 )
      ( MAKE-2CRATE-VERIFY ?auto_948 ?auto_949 ?auto_950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_961 - SURFACE
      ?auto_962 - SURFACE
      ?auto_963 - SURFACE
      ?auto_964 - SURFACE
    )
    :vars
    (
      ?auto_967 - HOIST
      ?auto_969 - PLACE
      ?auto_972 - PLACE
      ?auto_965 - HOIST
      ?auto_966 - SURFACE
      ?auto_973 - SURFACE
      ?auto_970 - TRUCK
      ?auto_971 - PLACE
      ?auto_968 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_967 ?auto_969 ) ( IS-CRATE ?auto_964 ) ( not ( = ?auto_963 ?auto_964 ) ) ( not ( = ?auto_962 ?auto_963 ) ) ( not ( = ?auto_962 ?auto_964 ) ) ( not ( = ?auto_972 ?auto_969 ) ) ( HOIST-AT ?auto_965 ?auto_972 ) ( not ( = ?auto_967 ?auto_965 ) ) ( SURFACE-AT ?auto_964 ?auto_972 ) ( ON ?auto_964 ?auto_966 ) ( CLEAR ?auto_964 ) ( not ( = ?auto_963 ?auto_966 ) ) ( not ( = ?auto_964 ?auto_966 ) ) ( not ( = ?auto_962 ?auto_966 ) ) ( IS-CRATE ?auto_963 ) ( AVAILABLE ?auto_965 ) ( SURFACE-AT ?auto_963 ?auto_972 ) ( ON ?auto_963 ?auto_973 ) ( CLEAR ?auto_963 ) ( not ( = ?auto_963 ?auto_973 ) ) ( not ( = ?auto_964 ?auto_973 ) ) ( not ( = ?auto_962 ?auto_973 ) ) ( not ( = ?auto_966 ?auto_973 ) ) ( SURFACE-AT ?auto_961 ?auto_969 ) ( CLEAR ?auto_961 ) ( IS-CRATE ?auto_962 ) ( not ( = ?auto_961 ?auto_962 ) ) ( not ( = ?auto_963 ?auto_961 ) ) ( not ( = ?auto_964 ?auto_961 ) ) ( not ( = ?auto_966 ?auto_961 ) ) ( not ( = ?auto_973 ?auto_961 ) ) ( AVAILABLE ?auto_967 ) ( TRUCK-AT ?auto_970 ?auto_971 ) ( not ( = ?auto_971 ?auto_969 ) ) ( not ( = ?auto_972 ?auto_971 ) ) ( HOIST-AT ?auto_968 ?auto_971 ) ( LIFTING ?auto_968 ?auto_962 ) ( not ( = ?auto_967 ?auto_968 ) ) ( not ( = ?auto_965 ?auto_968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962 ?auto_963 ?auto_964 )
      ( MAKE-3CRATE-VERIFY ?auto_961 ?auto_962 ?auto_963 ?auto_964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_974 - SURFACE
      ?auto_975 - SURFACE
    )
    :vars
    (
      ?auto_978 - HOIST
      ?auto_980 - PLACE
      ?auto_986 - SURFACE
      ?auto_983 - PLACE
      ?auto_976 - HOIST
      ?auto_977 - SURFACE
      ?auto_984 - SURFACE
      ?auto_985 - SURFACE
      ?auto_981 - TRUCK
      ?auto_982 - PLACE
      ?auto_979 - HOIST
      ?auto_987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978 ?auto_980 ) ( IS-CRATE ?auto_975 ) ( not ( = ?auto_974 ?auto_975 ) ) ( not ( = ?auto_986 ?auto_974 ) ) ( not ( = ?auto_986 ?auto_975 ) ) ( not ( = ?auto_983 ?auto_980 ) ) ( HOIST-AT ?auto_976 ?auto_983 ) ( not ( = ?auto_978 ?auto_976 ) ) ( SURFACE-AT ?auto_975 ?auto_983 ) ( ON ?auto_975 ?auto_977 ) ( CLEAR ?auto_975 ) ( not ( = ?auto_974 ?auto_977 ) ) ( not ( = ?auto_975 ?auto_977 ) ) ( not ( = ?auto_986 ?auto_977 ) ) ( IS-CRATE ?auto_974 ) ( AVAILABLE ?auto_976 ) ( SURFACE-AT ?auto_974 ?auto_983 ) ( ON ?auto_974 ?auto_984 ) ( CLEAR ?auto_974 ) ( not ( = ?auto_974 ?auto_984 ) ) ( not ( = ?auto_975 ?auto_984 ) ) ( not ( = ?auto_986 ?auto_984 ) ) ( not ( = ?auto_977 ?auto_984 ) ) ( SURFACE-AT ?auto_985 ?auto_980 ) ( CLEAR ?auto_985 ) ( IS-CRATE ?auto_986 ) ( not ( = ?auto_985 ?auto_986 ) ) ( not ( = ?auto_974 ?auto_985 ) ) ( not ( = ?auto_975 ?auto_985 ) ) ( not ( = ?auto_977 ?auto_985 ) ) ( not ( = ?auto_984 ?auto_985 ) ) ( AVAILABLE ?auto_978 ) ( TRUCK-AT ?auto_981 ?auto_982 ) ( not ( = ?auto_982 ?auto_980 ) ) ( not ( = ?auto_983 ?auto_982 ) ) ( HOIST-AT ?auto_979 ?auto_982 ) ( not ( = ?auto_978 ?auto_979 ) ) ( not ( = ?auto_976 ?auto_979 ) ) ( AVAILABLE ?auto_979 ) ( SURFACE-AT ?auto_986 ?auto_982 ) ( ON ?auto_986 ?auto_987 ) ( CLEAR ?auto_986 ) ( not ( = ?auto_974 ?auto_987 ) ) ( not ( = ?auto_975 ?auto_987 ) ) ( not ( = ?auto_986 ?auto_987 ) ) ( not ( = ?auto_977 ?auto_987 ) ) ( not ( = ?auto_984 ?auto_987 ) ) ( not ( = ?auto_985 ?auto_987 ) ) )
    :subtasks
    ( ( !LIFT ?auto_979 ?auto_986 ?auto_987 ?auto_982 )
      ( MAKE-2CRATE ?auto_986 ?auto_974 ?auto_975 )
      ( MAKE-1CRATE-VERIFY ?auto_974 ?auto_975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_988 - SURFACE
      ?auto_989 - SURFACE
      ?auto_990 - SURFACE
    )
    :vars
    (
      ?auto_994 - HOIST
      ?auto_993 - PLACE
      ?auto_992 - PLACE
      ?auto_995 - HOIST
      ?auto_1000 - SURFACE
      ?auto_1001 - SURFACE
      ?auto_998 - SURFACE
      ?auto_997 - TRUCK
      ?auto_991 - PLACE
      ?auto_996 - HOIST
      ?auto_999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_994 ?auto_993 ) ( IS-CRATE ?auto_990 ) ( not ( = ?auto_989 ?auto_990 ) ) ( not ( = ?auto_988 ?auto_989 ) ) ( not ( = ?auto_988 ?auto_990 ) ) ( not ( = ?auto_992 ?auto_993 ) ) ( HOIST-AT ?auto_995 ?auto_992 ) ( not ( = ?auto_994 ?auto_995 ) ) ( SURFACE-AT ?auto_990 ?auto_992 ) ( ON ?auto_990 ?auto_1000 ) ( CLEAR ?auto_990 ) ( not ( = ?auto_989 ?auto_1000 ) ) ( not ( = ?auto_990 ?auto_1000 ) ) ( not ( = ?auto_988 ?auto_1000 ) ) ( IS-CRATE ?auto_989 ) ( AVAILABLE ?auto_995 ) ( SURFACE-AT ?auto_989 ?auto_992 ) ( ON ?auto_989 ?auto_1001 ) ( CLEAR ?auto_989 ) ( not ( = ?auto_989 ?auto_1001 ) ) ( not ( = ?auto_990 ?auto_1001 ) ) ( not ( = ?auto_988 ?auto_1001 ) ) ( not ( = ?auto_1000 ?auto_1001 ) ) ( SURFACE-AT ?auto_998 ?auto_993 ) ( CLEAR ?auto_998 ) ( IS-CRATE ?auto_988 ) ( not ( = ?auto_998 ?auto_988 ) ) ( not ( = ?auto_989 ?auto_998 ) ) ( not ( = ?auto_990 ?auto_998 ) ) ( not ( = ?auto_1000 ?auto_998 ) ) ( not ( = ?auto_1001 ?auto_998 ) ) ( AVAILABLE ?auto_994 ) ( TRUCK-AT ?auto_997 ?auto_991 ) ( not ( = ?auto_991 ?auto_993 ) ) ( not ( = ?auto_992 ?auto_991 ) ) ( HOIST-AT ?auto_996 ?auto_991 ) ( not ( = ?auto_994 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_996 ) ) ( AVAILABLE ?auto_996 ) ( SURFACE-AT ?auto_988 ?auto_991 ) ( ON ?auto_988 ?auto_999 ) ( CLEAR ?auto_988 ) ( not ( = ?auto_989 ?auto_999 ) ) ( not ( = ?auto_990 ?auto_999 ) ) ( not ( = ?auto_988 ?auto_999 ) ) ( not ( = ?auto_1000 ?auto_999 ) ) ( not ( = ?auto_1001 ?auto_999 ) ) ( not ( = ?auto_998 ?auto_999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_989 ?auto_990 )
      ( MAKE-2CRATE-VERIFY ?auto_988 ?auto_989 ?auto_990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1002 - SURFACE
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
      ?auto_1005 - SURFACE
    )
    :vars
    (
      ?auto_1013 - HOIST
      ?auto_1006 - PLACE
      ?auto_1009 - PLACE
      ?auto_1011 - HOIST
      ?auto_1010 - SURFACE
      ?auto_1008 - SURFACE
      ?auto_1015 - TRUCK
      ?auto_1012 - PLACE
      ?auto_1014 - HOIST
      ?auto_1007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1013 ?auto_1006 ) ( IS-CRATE ?auto_1005 ) ( not ( = ?auto_1004 ?auto_1005 ) ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( not ( = ?auto_1003 ?auto_1005 ) ) ( not ( = ?auto_1009 ?auto_1006 ) ) ( HOIST-AT ?auto_1011 ?auto_1009 ) ( not ( = ?auto_1013 ?auto_1011 ) ) ( SURFACE-AT ?auto_1005 ?auto_1009 ) ( ON ?auto_1005 ?auto_1010 ) ( CLEAR ?auto_1005 ) ( not ( = ?auto_1004 ?auto_1010 ) ) ( not ( = ?auto_1005 ?auto_1010 ) ) ( not ( = ?auto_1003 ?auto_1010 ) ) ( IS-CRATE ?auto_1004 ) ( AVAILABLE ?auto_1011 ) ( SURFACE-AT ?auto_1004 ?auto_1009 ) ( ON ?auto_1004 ?auto_1008 ) ( CLEAR ?auto_1004 ) ( not ( = ?auto_1004 ?auto_1008 ) ) ( not ( = ?auto_1005 ?auto_1008 ) ) ( not ( = ?auto_1003 ?auto_1008 ) ) ( not ( = ?auto_1010 ?auto_1008 ) ) ( SURFACE-AT ?auto_1002 ?auto_1006 ) ( CLEAR ?auto_1002 ) ( IS-CRATE ?auto_1003 ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1004 ?auto_1002 ) ) ( not ( = ?auto_1005 ?auto_1002 ) ) ( not ( = ?auto_1010 ?auto_1002 ) ) ( not ( = ?auto_1008 ?auto_1002 ) ) ( AVAILABLE ?auto_1013 ) ( TRUCK-AT ?auto_1015 ?auto_1012 ) ( not ( = ?auto_1012 ?auto_1006 ) ) ( not ( = ?auto_1009 ?auto_1012 ) ) ( HOIST-AT ?auto_1014 ?auto_1012 ) ( not ( = ?auto_1013 ?auto_1014 ) ) ( not ( = ?auto_1011 ?auto_1014 ) ) ( AVAILABLE ?auto_1014 ) ( SURFACE-AT ?auto_1003 ?auto_1012 ) ( ON ?auto_1003 ?auto_1007 ) ( CLEAR ?auto_1003 ) ( not ( = ?auto_1004 ?auto_1007 ) ) ( not ( = ?auto_1005 ?auto_1007 ) ) ( not ( = ?auto_1003 ?auto_1007 ) ) ( not ( = ?auto_1010 ?auto_1007 ) ) ( not ( = ?auto_1008 ?auto_1007 ) ) ( not ( = ?auto_1002 ?auto_1007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1003 ?auto_1004 ?auto_1005 )
      ( MAKE-3CRATE-VERIFY ?auto_1002 ?auto_1003 ?auto_1004 ?auto_1005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1016 - SURFACE
      ?auto_1017 - SURFACE
    )
    :vars
    (
      ?auto_1026 - HOIST
      ?auto_1018 - PLACE
      ?auto_1029 - SURFACE
      ?auto_1021 - PLACE
      ?auto_1024 - HOIST
      ?auto_1023 - SURFACE
      ?auto_1020 - SURFACE
      ?auto_1022 - SURFACE
      ?auto_1025 - PLACE
      ?auto_1027 - HOIST
      ?auto_1019 - SURFACE
      ?auto_1028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1026 ?auto_1018 ) ( IS-CRATE ?auto_1017 ) ( not ( = ?auto_1016 ?auto_1017 ) ) ( not ( = ?auto_1029 ?auto_1016 ) ) ( not ( = ?auto_1029 ?auto_1017 ) ) ( not ( = ?auto_1021 ?auto_1018 ) ) ( HOIST-AT ?auto_1024 ?auto_1021 ) ( not ( = ?auto_1026 ?auto_1024 ) ) ( SURFACE-AT ?auto_1017 ?auto_1021 ) ( ON ?auto_1017 ?auto_1023 ) ( CLEAR ?auto_1017 ) ( not ( = ?auto_1016 ?auto_1023 ) ) ( not ( = ?auto_1017 ?auto_1023 ) ) ( not ( = ?auto_1029 ?auto_1023 ) ) ( IS-CRATE ?auto_1016 ) ( AVAILABLE ?auto_1024 ) ( SURFACE-AT ?auto_1016 ?auto_1021 ) ( ON ?auto_1016 ?auto_1020 ) ( CLEAR ?auto_1016 ) ( not ( = ?auto_1016 ?auto_1020 ) ) ( not ( = ?auto_1017 ?auto_1020 ) ) ( not ( = ?auto_1029 ?auto_1020 ) ) ( not ( = ?auto_1023 ?auto_1020 ) ) ( SURFACE-AT ?auto_1022 ?auto_1018 ) ( CLEAR ?auto_1022 ) ( IS-CRATE ?auto_1029 ) ( not ( = ?auto_1022 ?auto_1029 ) ) ( not ( = ?auto_1016 ?auto_1022 ) ) ( not ( = ?auto_1017 ?auto_1022 ) ) ( not ( = ?auto_1023 ?auto_1022 ) ) ( not ( = ?auto_1020 ?auto_1022 ) ) ( AVAILABLE ?auto_1026 ) ( not ( = ?auto_1025 ?auto_1018 ) ) ( not ( = ?auto_1021 ?auto_1025 ) ) ( HOIST-AT ?auto_1027 ?auto_1025 ) ( not ( = ?auto_1026 ?auto_1027 ) ) ( not ( = ?auto_1024 ?auto_1027 ) ) ( AVAILABLE ?auto_1027 ) ( SURFACE-AT ?auto_1029 ?auto_1025 ) ( ON ?auto_1029 ?auto_1019 ) ( CLEAR ?auto_1029 ) ( not ( = ?auto_1016 ?auto_1019 ) ) ( not ( = ?auto_1017 ?auto_1019 ) ) ( not ( = ?auto_1029 ?auto_1019 ) ) ( not ( = ?auto_1023 ?auto_1019 ) ) ( not ( = ?auto_1020 ?auto_1019 ) ) ( not ( = ?auto_1022 ?auto_1019 ) ) ( TRUCK-AT ?auto_1028 ?auto_1018 ) )
    :subtasks
    ( ( !DRIVE ?auto_1028 ?auto_1018 ?auto_1025 )
      ( MAKE-2CRATE ?auto_1029 ?auto_1016 ?auto_1017 )
      ( MAKE-1CRATE-VERIFY ?auto_1016 ?auto_1017 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1030 - SURFACE
      ?auto_1031 - SURFACE
      ?auto_1032 - SURFACE
    )
    :vars
    (
      ?auto_1033 - HOIST
      ?auto_1043 - PLACE
      ?auto_1035 - PLACE
      ?auto_1039 - HOIST
      ?auto_1038 - SURFACE
      ?auto_1041 - SURFACE
      ?auto_1036 - SURFACE
      ?auto_1040 - PLACE
      ?auto_1037 - HOIST
      ?auto_1034 - SURFACE
      ?auto_1042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1033 ?auto_1043 ) ( IS-CRATE ?auto_1032 ) ( not ( = ?auto_1031 ?auto_1032 ) ) ( not ( = ?auto_1030 ?auto_1031 ) ) ( not ( = ?auto_1030 ?auto_1032 ) ) ( not ( = ?auto_1035 ?auto_1043 ) ) ( HOIST-AT ?auto_1039 ?auto_1035 ) ( not ( = ?auto_1033 ?auto_1039 ) ) ( SURFACE-AT ?auto_1032 ?auto_1035 ) ( ON ?auto_1032 ?auto_1038 ) ( CLEAR ?auto_1032 ) ( not ( = ?auto_1031 ?auto_1038 ) ) ( not ( = ?auto_1032 ?auto_1038 ) ) ( not ( = ?auto_1030 ?auto_1038 ) ) ( IS-CRATE ?auto_1031 ) ( AVAILABLE ?auto_1039 ) ( SURFACE-AT ?auto_1031 ?auto_1035 ) ( ON ?auto_1031 ?auto_1041 ) ( CLEAR ?auto_1031 ) ( not ( = ?auto_1031 ?auto_1041 ) ) ( not ( = ?auto_1032 ?auto_1041 ) ) ( not ( = ?auto_1030 ?auto_1041 ) ) ( not ( = ?auto_1038 ?auto_1041 ) ) ( SURFACE-AT ?auto_1036 ?auto_1043 ) ( CLEAR ?auto_1036 ) ( IS-CRATE ?auto_1030 ) ( not ( = ?auto_1036 ?auto_1030 ) ) ( not ( = ?auto_1031 ?auto_1036 ) ) ( not ( = ?auto_1032 ?auto_1036 ) ) ( not ( = ?auto_1038 ?auto_1036 ) ) ( not ( = ?auto_1041 ?auto_1036 ) ) ( AVAILABLE ?auto_1033 ) ( not ( = ?auto_1040 ?auto_1043 ) ) ( not ( = ?auto_1035 ?auto_1040 ) ) ( HOIST-AT ?auto_1037 ?auto_1040 ) ( not ( = ?auto_1033 ?auto_1037 ) ) ( not ( = ?auto_1039 ?auto_1037 ) ) ( AVAILABLE ?auto_1037 ) ( SURFACE-AT ?auto_1030 ?auto_1040 ) ( ON ?auto_1030 ?auto_1034 ) ( CLEAR ?auto_1030 ) ( not ( = ?auto_1031 ?auto_1034 ) ) ( not ( = ?auto_1032 ?auto_1034 ) ) ( not ( = ?auto_1030 ?auto_1034 ) ) ( not ( = ?auto_1038 ?auto_1034 ) ) ( not ( = ?auto_1041 ?auto_1034 ) ) ( not ( = ?auto_1036 ?auto_1034 ) ) ( TRUCK-AT ?auto_1042 ?auto_1043 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1031 ?auto_1032 )
      ( MAKE-2CRATE-VERIFY ?auto_1030 ?auto_1031 ?auto_1032 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1044 - SURFACE
      ?auto_1045 - SURFACE
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
    )
    :vars
    (
      ?auto_1057 - HOIST
      ?auto_1052 - PLACE
      ?auto_1050 - PLACE
      ?auto_1055 - HOIST
      ?auto_1048 - SURFACE
      ?auto_1053 - SURFACE
      ?auto_1049 - PLACE
      ?auto_1054 - HOIST
      ?auto_1056 - SURFACE
      ?auto_1051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057 ?auto_1052 ) ( IS-CRATE ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( not ( = ?auto_1045 ?auto_1046 ) ) ( not ( = ?auto_1045 ?auto_1047 ) ) ( not ( = ?auto_1050 ?auto_1052 ) ) ( HOIST-AT ?auto_1055 ?auto_1050 ) ( not ( = ?auto_1057 ?auto_1055 ) ) ( SURFACE-AT ?auto_1047 ?auto_1050 ) ( ON ?auto_1047 ?auto_1048 ) ( CLEAR ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1048 ) ) ( not ( = ?auto_1047 ?auto_1048 ) ) ( not ( = ?auto_1045 ?auto_1048 ) ) ( IS-CRATE ?auto_1046 ) ( AVAILABLE ?auto_1055 ) ( SURFACE-AT ?auto_1046 ?auto_1050 ) ( ON ?auto_1046 ?auto_1053 ) ( CLEAR ?auto_1046 ) ( not ( = ?auto_1046 ?auto_1053 ) ) ( not ( = ?auto_1047 ?auto_1053 ) ) ( not ( = ?auto_1045 ?auto_1053 ) ) ( not ( = ?auto_1048 ?auto_1053 ) ) ( SURFACE-AT ?auto_1044 ?auto_1052 ) ( CLEAR ?auto_1044 ) ( IS-CRATE ?auto_1045 ) ( not ( = ?auto_1044 ?auto_1045 ) ) ( not ( = ?auto_1046 ?auto_1044 ) ) ( not ( = ?auto_1047 ?auto_1044 ) ) ( not ( = ?auto_1048 ?auto_1044 ) ) ( not ( = ?auto_1053 ?auto_1044 ) ) ( AVAILABLE ?auto_1057 ) ( not ( = ?auto_1049 ?auto_1052 ) ) ( not ( = ?auto_1050 ?auto_1049 ) ) ( HOIST-AT ?auto_1054 ?auto_1049 ) ( not ( = ?auto_1057 ?auto_1054 ) ) ( not ( = ?auto_1055 ?auto_1054 ) ) ( AVAILABLE ?auto_1054 ) ( SURFACE-AT ?auto_1045 ?auto_1049 ) ( ON ?auto_1045 ?auto_1056 ) ( CLEAR ?auto_1045 ) ( not ( = ?auto_1046 ?auto_1056 ) ) ( not ( = ?auto_1047 ?auto_1056 ) ) ( not ( = ?auto_1045 ?auto_1056 ) ) ( not ( = ?auto_1048 ?auto_1056 ) ) ( not ( = ?auto_1053 ?auto_1056 ) ) ( not ( = ?auto_1044 ?auto_1056 ) ) ( TRUCK-AT ?auto_1051 ?auto_1052 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045 ?auto_1046 ?auto_1047 )
      ( MAKE-3CRATE-VERIFY ?auto_1044 ?auto_1045 ?auto_1046 ?auto_1047 ) )
  )

)

