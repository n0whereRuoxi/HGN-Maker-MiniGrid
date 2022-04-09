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
      ?auto_265 - HOIST
      ?auto_266 - PLACE
      ?auto_267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265 ?auto_266 ) ( SURFACE-AT ?auto_263 ?auto_266 ) ( CLEAR ?auto_263 ) ( IS-CRATE ?auto_264 ) ( not ( = ?auto_263 ?auto_264 ) ) ( TRUCK-AT ?auto_267 ?auto_266 ) ( AVAILABLE ?auto_265 ) ( IN ?auto_264 ?auto_267 ) )
    :subtasks
    ( ( !UNLOAD ?auto_265 ?auto_264 ?auto_267 ?auto_266 )
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
      ?auto_272 - HOIST
      ?auto_271 - PLACE
      ?auto_270 - TRUCK
      ?auto_273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_272 ?auto_271 ) ( SURFACE-AT ?auto_268 ?auto_271 ) ( CLEAR ?auto_268 ) ( IS-CRATE ?auto_269 ) ( not ( = ?auto_268 ?auto_269 ) ) ( AVAILABLE ?auto_272 ) ( IN ?auto_269 ?auto_270 ) ( TRUCK-AT ?auto_270 ?auto_273 ) ( not ( = ?auto_273 ?auto_271 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_270 ?auto_273 ?auto_271 )
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
      ?auto_277 - HOIST
      ?auto_276 - PLACE
      ?auto_279 - TRUCK
      ?auto_278 - PLACE
      ?auto_280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_277 ?auto_276 ) ( SURFACE-AT ?auto_274 ?auto_276 ) ( CLEAR ?auto_274 ) ( IS-CRATE ?auto_275 ) ( not ( = ?auto_274 ?auto_275 ) ) ( AVAILABLE ?auto_277 ) ( TRUCK-AT ?auto_279 ?auto_278 ) ( not ( = ?auto_278 ?auto_276 ) ) ( HOIST-AT ?auto_280 ?auto_278 ) ( LIFTING ?auto_280 ?auto_275 ) ( not ( = ?auto_277 ?auto_280 ) ) )
    :subtasks
    ( ( !LOAD ?auto_280 ?auto_275 ?auto_279 ?auto_278 )
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
      ?auto_286 - HOIST
      ?auto_283 - PLACE
      ?auto_285 - TRUCK
      ?auto_287 - PLACE
      ?auto_284 - HOIST
      ?auto_288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_286 ?auto_283 ) ( SURFACE-AT ?auto_281 ?auto_283 ) ( CLEAR ?auto_281 ) ( IS-CRATE ?auto_282 ) ( not ( = ?auto_281 ?auto_282 ) ) ( AVAILABLE ?auto_286 ) ( TRUCK-AT ?auto_285 ?auto_287 ) ( not ( = ?auto_287 ?auto_283 ) ) ( HOIST-AT ?auto_284 ?auto_287 ) ( not ( = ?auto_286 ?auto_284 ) ) ( AVAILABLE ?auto_284 ) ( SURFACE-AT ?auto_282 ?auto_287 ) ( ON ?auto_282 ?auto_288 ) ( CLEAR ?auto_282 ) ( not ( = ?auto_281 ?auto_288 ) ) ( not ( = ?auto_282 ?auto_288 ) ) )
    :subtasks
    ( ( !LIFT ?auto_284 ?auto_282 ?auto_288 ?auto_287 )
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
      ?auto_296 - HOIST
      ?auto_295 - PLACE
      ?auto_293 - PLACE
      ?auto_291 - HOIST
      ?auto_292 - SURFACE
      ?auto_294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_296 ?auto_295 ) ( SURFACE-AT ?auto_289 ?auto_295 ) ( CLEAR ?auto_289 ) ( IS-CRATE ?auto_290 ) ( not ( = ?auto_289 ?auto_290 ) ) ( AVAILABLE ?auto_296 ) ( not ( = ?auto_293 ?auto_295 ) ) ( HOIST-AT ?auto_291 ?auto_293 ) ( not ( = ?auto_296 ?auto_291 ) ) ( AVAILABLE ?auto_291 ) ( SURFACE-AT ?auto_290 ?auto_293 ) ( ON ?auto_290 ?auto_292 ) ( CLEAR ?auto_290 ) ( not ( = ?auto_289 ?auto_292 ) ) ( not ( = ?auto_290 ?auto_292 ) ) ( TRUCK-AT ?auto_294 ?auto_295 ) )
    :subtasks
    ( ( !DRIVE ?auto_294 ?auto_295 ?auto_293 )
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
      ?auto_319 - HOIST
      ?auto_321 - PLACE
      ?auto_320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319 ?auto_321 ) ( SURFACE-AT ?auto_317 ?auto_321 ) ( CLEAR ?auto_317 ) ( IS-CRATE ?auto_318 ) ( not ( = ?auto_317 ?auto_318 ) ) ( TRUCK-AT ?auto_320 ?auto_321 ) ( AVAILABLE ?auto_319 ) ( IN ?auto_318 ?auto_320 ) ( ON ?auto_317 ?auto_316 ) ( not ( = ?auto_316 ?auto_317 ) ) ( not ( = ?auto_316 ?auto_318 ) ) )
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
      ?auto_327 - HOIST
      ?auto_326 - PLACE
      ?auto_325 - TRUCK
      ?auto_324 - SURFACE
      ?auto_328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_327 ?auto_326 ) ( SURFACE-AT ?auto_322 ?auto_326 ) ( CLEAR ?auto_322 ) ( IS-CRATE ?auto_323 ) ( not ( = ?auto_322 ?auto_323 ) ) ( AVAILABLE ?auto_327 ) ( IN ?auto_323 ?auto_325 ) ( ON ?auto_322 ?auto_324 ) ( not ( = ?auto_324 ?auto_322 ) ) ( not ( = ?auto_324 ?auto_323 ) ) ( TRUCK-AT ?auto_325 ?auto_328 ) ( not ( = ?auto_328 ?auto_326 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_325 ?auto_328 ?auto_326 )
      ( MAKE-2CRATE ?auto_324 ?auto_322 ?auto_323 )
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
      ?auto_333 - PLACE
      ?auto_334 - TRUCK
      ?auto_332 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_335 ?auto_333 ) ( SURFACE-AT ?auto_330 ?auto_333 ) ( CLEAR ?auto_330 ) ( IS-CRATE ?auto_331 ) ( not ( = ?auto_330 ?auto_331 ) ) ( AVAILABLE ?auto_335 ) ( IN ?auto_331 ?auto_334 ) ( ON ?auto_330 ?auto_329 ) ( not ( = ?auto_329 ?auto_330 ) ) ( not ( = ?auto_329 ?auto_331 ) ) ( TRUCK-AT ?auto_334 ?auto_332 ) ( not ( = ?auto_332 ?auto_333 ) ) )
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
      ?auto_338 - HOIST
      ?auto_340 - PLACE
      ?auto_342 - SURFACE
      ?auto_341 - TRUCK
      ?auto_339 - PLACE
      ?auto_343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_338 ?auto_340 ) ( SURFACE-AT ?auto_336 ?auto_340 ) ( CLEAR ?auto_336 ) ( IS-CRATE ?auto_337 ) ( not ( = ?auto_336 ?auto_337 ) ) ( AVAILABLE ?auto_338 ) ( ON ?auto_336 ?auto_342 ) ( not ( = ?auto_342 ?auto_336 ) ) ( not ( = ?auto_342 ?auto_337 ) ) ( TRUCK-AT ?auto_341 ?auto_339 ) ( not ( = ?auto_339 ?auto_340 ) ) ( HOIST-AT ?auto_343 ?auto_339 ) ( LIFTING ?auto_343 ?auto_337 ) ( not ( = ?auto_338 ?auto_343 ) ) )
    :subtasks
    ( ( !LOAD ?auto_343 ?auto_337 ?auto_341 ?auto_339 )
      ( MAKE-2CRATE ?auto_342 ?auto_336 ?auto_337 )
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
      ?auto_348 - HOIST
      ?auto_351 - PLACE
      ?auto_347 - TRUCK
      ?auto_350 - PLACE
      ?auto_349 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348 ?auto_351 ) ( SURFACE-AT ?auto_345 ?auto_351 ) ( CLEAR ?auto_345 ) ( IS-CRATE ?auto_346 ) ( not ( = ?auto_345 ?auto_346 ) ) ( AVAILABLE ?auto_348 ) ( ON ?auto_345 ?auto_344 ) ( not ( = ?auto_344 ?auto_345 ) ) ( not ( = ?auto_344 ?auto_346 ) ) ( TRUCK-AT ?auto_347 ?auto_350 ) ( not ( = ?auto_350 ?auto_351 ) ) ( HOIST-AT ?auto_349 ?auto_350 ) ( LIFTING ?auto_349 ?auto_346 ) ( not ( = ?auto_348 ?auto_349 ) ) )
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
      ?auto_356 - HOIST
      ?auto_354 - PLACE
      ?auto_357 - SURFACE
      ?auto_359 - TRUCK
      ?auto_355 - PLACE
      ?auto_358 - HOIST
      ?auto_360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_356 ?auto_354 ) ( SURFACE-AT ?auto_352 ?auto_354 ) ( CLEAR ?auto_352 ) ( IS-CRATE ?auto_353 ) ( not ( = ?auto_352 ?auto_353 ) ) ( AVAILABLE ?auto_356 ) ( ON ?auto_352 ?auto_357 ) ( not ( = ?auto_357 ?auto_352 ) ) ( not ( = ?auto_357 ?auto_353 ) ) ( TRUCK-AT ?auto_359 ?auto_355 ) ( not ( = ?auto_355 ?auto_354 ) ) ( HOIST-AT ?auto_358 ?auto_355 ) ( not ( = ?auto_356 ?auto_358 ) ) ( AVAILABLE ?auto_358 ) ( SURFACE-AT ?auto_353 ?auto_355 ) ( ON ?auto_353 ?auto_360 ) ( CLEAR ?auto_353 ) ( not ( = ?auto_352 ?auto_360 ) ) ( not ( = ?auto_353 ?auto_360 ) ) ( not ( = ?auto_357 ?auto_360 ) ) )
    :subtasks
    ( ( !LIFT ?auto_358 ?auto_353 ?auto_360 ?auto_355 )
      ( MAKE-2CRATE ?auto_357 ?auto_352 ?auto_353 )
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
      ?auto_365 - PLACE
      ?auto_368 - TRUCK
      ?auto_369 - PLACE
      ?auto_366 - HOIST
      ?auto_364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367 ?auto_365 ) ( SURFACE-AT ?auto_362 ?auto_365 ) ( CLEAR ?auto_362 ) ( IS-CRATE ?auto_363 ) ( not ( = ?auto_362 ?auto_363 ) ) ( AVAILABLE ?auto_367 ) ( ON ?auto_362 ?auto_361 ) ( not ( = ?auto_361 ?auto_362 ) ) ( not ( = ?auto_361 ?auto_363 ) ) ( TRUCK-AT ?auto_368 ?auto_369 ) ( not ( = ?auto_369 ?auto_365 ) ) ( HOIST-AT ?auto_366 ?auto_369 ) ( not ( = ?auto_367 ?auto_366 ) ) ( AVAILABLE ?auto_366 ) ( SURFACE-AT ?auto_363 ?auto_369 ) ( ON ?auto_363 ?auto_364 ) ( CLEAR ?auto_363 ) ( not ( = ?auto_362 ?auto_364 ) ) ( not ( = ?auto_363 ?auto_364 ) ) ( not ( = ?auto_361 ?auto_364 ) ) )
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
      ?auto_374 - HOIST
      ?auto_376 - PLACE
      ?auto_377 - SURFACE
      ?auto_372 - PLACE
      ?auto_375 - HOIST
      ?auto_373 - SURFACE
      ?auto_378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_374 ?auto_376 ) ( SURFACE-AT ?auto_370 ?auto_376 ) ( CLEAR ?auto_370 ) ( IS-CRATE ?auto_371 ) ( not ( = ?auto_370 ?auto_371 ) ) ( AVAILABLE ?auto_374 ) ( ON ?auto_370 ?auto_377 ) ( not ( = ?auto_377 ?auto_370 ) ) ( not ( = ?auto_377 ?auto_371 ) ) ( not ( = ?auto_372 ?auto_376 ) ) ( HOIST-AT ?auto_375 ?auto_372 ) ( not ( = ?auto_374 ?auto_375 ) ) ( AVAILABLE ?auto_375 ) ( SURFACE-AT ?auto_371 ?auto_372 ) ( ON ?auto_371 ?auto_373 ) ( CLEAR ?auto_371 ) ( not ( = ?auto_370 ?auto_373 ) ) ( not ( = ?auto_371 ?auto_373 ) ) ( not ( = ?auto_377 ?auto_373 ) ) ( TRUCK-AT ?auto_378 ?auto_376 ) )
    :subtasks
    ( ( !DRIVE ?auto_378 ?auto_376 ?auto_372 )
      ( MAKE-2CRATE ?auto_377 ?auto_370 ?auto_371 )
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
      ?auto_382 - HOIST
      ?auto_387 - PLACE
      ?auto_385 - PLACE
      ?auto_384 - HOIST
      ?auto_383 - SURFACE
      ?auto_386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_382 ?auto_387 ) ( SURFACE-AT ?auto_380 ?auto_387 ) ( CLEAR ?auto_380 ) ( IS-CRATE ?auto_381 ) ( not ( = ?auto_380 ?auto_381 ) ) ( AVAILABLE ?auto_382 ) ( ON ?auto_380 ?auto_379 ) ( not ( = ?auto_379 ?auto_380 ) ) ( not ( = ?auto_379 ?auto_381 ) ) ( not ( = ?auto_385 ?auto_387 ) ) ( HOIST-AT ?auto_384 ?auto_385 ) ( not ( = ?auto_382 ?auto_384 ) ) ( AVAILABLE ?auto_384 ) ( SURFACE-AT ?auto_381 ?auto_385 ) ( ON ?auto_381 ?auto_383 ) ( CLEAR ?auto_381 ) ( not ( = ?auto_380 ?auto_383 ) ) ( not ( = ?auto_381 ?auto_383 ) ) ( not ( = ?auto_379 ?auto_383 ) ) ( TRUCK-AT ?auto_386 ?auto_387 ) )
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
      ?auto_391 - HOIST
      ?auto_394 - PLACE
      ?auto_395 - SURFACE
      ?auto_392 - PLACE
      ?auto_390 - HOIST
      ?auto_396 - SURFACE
      ?auto_393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_391 ?auto_394 ) ( IS-CRATE ?auto_389 ) ( not ( = ?auto_388 ?auto_389 ) ) ( not ( = ?auto_395 ?auto_388 ) ) ( not ( = ?auto_395 ?auto_389 ) ) ( not ( = ?auto_392 ?auto_394 ) ) ( HOIST-AT ?auto_390 ?auto_392 ) ( not ( = ?auto_391 ?auto_390 ) ) ( AVAILABLE ?auto_390 ) ( SURFACE-AT ?auto_389 ?auto_392 ) ( ON ?auto_389 ?auto_396 ) ( CLEAR ?auto_389 ) ( not ( = ?auto_388 ?auto_396 ) ) ( not ( = ?auto_389 ?auto_396 ) ) ( not ( = ?auto_395 ?auto_396 ) ) ( TRUCK-AT ?auto_393 ?auto_394 ) ( SURFACE-AT ?auto_395 ?auto_394 ) ( CLEAR ?auto_395 ) ( LIFTING ?auto_391 ?auto_388 ) ( IS-CRATE ?auto_388 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_395 ?auto_388 )
      ( MAKE-2CRATE ?auto_395 ?auto_388 ?auto_389 )
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
      ?auto_404 - HOIST
      ?auto_402 - PLACE
      ?auto_405 - PLACE
      ?auto_403 - HOIST
      ?auto_401 - SURFACE
      ?auto_400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404 ?auto_402 ) ( IS-CRATE ?auto_399 ) ( not ( = ?auto_398 ?auto_399 ) ) ( not ( = ?auto_397 ?auto_398 ) ) ( not ( = ?auto_397 ?auto_399 ) ) ( not ( = ?auto_405 ?auto_402 ) ) ( HOIST-AT ?auto_403 ?auto_405 ) ( not ( = ?auto_404 ?auto_403 ) ) ( AVAILABLE ?auto_403 ) ( SURFACE-AT ?auto_399 ?auto_405 ) ( ON ?auto_399 ?auto_401 ) ( CLEAR ?auto_399 ) ( not ( = ?auto_398 ?auto_401 ) ) ( not ( = ?auto_399 ?auto_401 ) ) ( not ( = ?auto_397 ?auto_401 ) ) ( TRUCK-AT ?auto_400 ?auto_402 ) ( SURFACE-AT ?auto_397 ?auto_402 ) ( CLEAR ?auto_397 ) ( LIFTING ?auto_404 ?auto_398 ) ( IS-CRATE ?auto_398 ) )
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
      ?auto_409 - HOIST
      ?auto_408 - PLACE
      ?auto_410 - SURFACE
      ?auto_411 - PLACE
      ?auto_413 - HOIST
      ?auto_414 - SURFACE
      ?auto_412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409 ?auto_408 ) ( IS-CRATE ?auto_407 ) ( not ( = ?auto_406 ?auto_407 ) ) ( not ( = ?auto_410 ?auto_406 ) ) ( not ( = ?auto_410 ?auto_407 ) ) ( not ( = ?auto_411 ?auto_408 ) ) ( HOIST-AT ?auto_413 ?auto_411 ) ( not ( = ?auto_409 ?auto_413 ) ) ( AVAILABLE ?auto_413 ) ( SURFACE-AT ?auto_407 ?auto_411 ) ( ON ?auto_407 ?auto_414 ) ( CLEAR ?auto_407 ) ( not ( = ?auto_406 ?auto_414 ) ) ( not ( = ?auto_407 ?auto_414 ) ) ( not ( = ?auto_410 ?auto_414 ) ) ( TRUCK-AT ?auto_412 ?auto_408 ) ( SURFACE-AT ?auto_410 ?auto_408 ) ( CLEAR ?auto_410 ) ( IS-CRATE ?auto_406 ) ( AVAILABLE ?auto_409 ) ( IN ?auto_406 ?auto_412 ) )
    :subtasks
    ( ( !UNLOAD ?auto_409 ?auto_406 ?auto_412 ?auto_408 )
      ( MAKE-2CRATE ?auto_410 ?auto_406 ?auto_407 )
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
      ?auto_418 - PLACE
      ?auto_422 - PLACE
      ?auto_420 - HOIST
      ?auto_423 - SURFACE
      ?auto_421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_419 ?auto_418 ) ( IS-CRATE ?auto_417 ) ( not ( = ?auto_416 ?auto_417 ) ) ( not ( = ?auto_415 ?auto_416 ) ) ( not ( = ?auto_415 ?auto_417 ) ) ( not ( = ?auto_422 ?auto_418 ) ) ( HOIST-AT ?auto_420 ?auto_422 ) ( not ( = ?auto_419 ?auto_420 ) ) ( AVAILABLE ?auto_420 ) ( SURFACE-AT ?auto_417 ?auto_422 ) ( ON ?auto_417 ?auto_423 ) ( CLEAR ?auto_417 ) ( not ( = ?auto_416 ?auto_423 ) ) ( not ( = ?auto_417 ?auto_423 ) ) ( not ( = ?auto_415 ?auto_423 ) ) ( TRUCK-AT ?auto_421 ?auto_418 ) ( SURFACE-AT ?auto_415 ?auto_418 ) ( CLEAR ?auto_415 ) ( IS-CRATE ?auto_416 ) ( AVAILABLE ?auto_419 ) ( IN ?auto_416 ?auto_421 ) )
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
      ?auto_427 - HOIST
      ?auto_430 - PLACE
      ?auto_431 - SURFACE
      ?auto_432 - PLACE
      ?auto_429 - HOIST
      ?auto_428 - SURFACE
      ?auto_426 - TRUCK
      ?auto_433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_427 ?auto_430 ) ( IS-CRATE ?auto_425 ) ( not ( = ?auto_424 ?auto_425 ) ) ( not ( = ?auto_431 ?auto_424 ) ) ( not ( = ?auto_431 ?auto_425 ) ) ( not ( = ?auto_432 ?auto_430 ) ) ( HOIST-AT ?auto_429 ?auto_432 ) ( not ( = ?auto_427 ?auto_429 ) ) ( AVAILABLE ?auto_429 ) ( SURFACE-AT ?auto_425 ?auto_432 ) ( ON ?auto_425 ?auto_428 ) ( CLEAR ?auto_425 ) ( not ( = ?auto_424 ?auto_428 ) ) ( not ( = ?auto_425 ?auto_428 ) ) ( not ( = ?auto_431 ?auto_428 ) ) ( SURFACE-AT ?auto_431 ?auto_430 ) ( CLEAR ?auto_431 ) ( IS-CRATE ?auto_424 ) ( AVAILABLE ?auto_427 ) ( IN ?auto_424 ?auto_426 ) ( TRUCK-AT ?auto_426 ?auto_433 ) ( not ( = ?auto_433 ?auto_430 ) ) ( not ( = ?auto_432 ?auto_433 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_426 ?auto_433 ?auto_430 )
      ( MAKE-2CRATE ?auto_431 ?auto_424 ?auto_425 )
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
      ?auto_438 - HOIST
      ?auto_443 - PLACE
      ?auto_440 - PLACE
      ?auto_439 - HOIST
      ?auto_442 - SURFACE
      ?auto_437 - TRUCK
      ?auto_441 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_438 ?auto_443 ) ( IS-CRATE ?auto_436 ) ( not ( = ?auto_435 ?auto_436 ) ) ( not ( = ?auto_434 ?auto_435 ) ) ( not ( = ?auto_434 ?auto_436 ) ) ( not ( = ?auto_440 ?auto_443 ) ) ( HOIST-AT ?auto_439 ?auto_440 ) ( not ( = ?auto_438 ?auto_439 ) ) ( AVAILABLE ?auto_439 ) ( SURFACE-AT ?auto_436 ?auto_440 ) ( ON ?auto_436 ?auto_442 ) ( CLEAR ?auto_436 ) ( not ( = ?auto_435 ?auto_442 ) ) ( not ( = ?auto_436 ?auto_442 ) ) ( not ( = ?auto_434 ?auto_442 ) ) ( SURFACE-AT ?auto_434 ?auto_443 ) ( CLEAR ?auto_434 ) ( IS-CRATE ?auto_435 ) ( AVAILABLE ?auto_438 ) ( IN ?auto_435 ?auto_437 ) ( TRUCK-AT ?auto_437 ?auto_441 ) ( not ( = ?auto_441 ?auto_443 ) ) ( not ( = ?auto_440 ?auto_441 ) ) )
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
      ?auto_447 - HOIST
      ?auto_448 - PLACE
      ?auto_452 - SURFACE
      ?auto_451 - PLACE
      ?auto_449 - HOIST
      ?auto_450 - SURFACE
      ?auto_446 - TRUCK
      ?auto_453 - PLACE
      ?auto_454 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_447 ?auto_448 ) ( IS-CRATE ?auto_445 ) ( not ( = ?auto_444 ?auto_445 ) ) ( not ( = ?auto_452 ?auto_444 ) ) ( not ( = ?auto_452 ?auto_445 ) ) ( not ( = ?auto_451 ?auto_448 ) ) ( HOIST-AT ?auto_449 ?auto_451 ) ( not ( = ?auto_447 ?auto_449 ) ) ( AVAILABLE ?auto_449 ) ( SURFACE-AT ?auto_445 ?auto_451 ) ( ON ?auto_445 ?auto_450 ) ( CLEAR ?auto_445 ) ( not ( = ?auto_444 ?auto_450 ) ) ( not ( = ?auto_445 ?auto_450 ) ) ( not ( = ?auto_452 ?auto_450 ) ) ( SURFACE-AT ?auto_452 ?auto_448 ) ( CLEAR ?auto_452 ) ( IS-CRATE ?auto_444 ) ( AVAILABLE ?auto_447 ) ( TRUCK-AT ?auto_446 ?auto_453 ) ( not ( = ?auto_453 ?auto_448 ) ) ( not ( = ?auto_451 ?auto_453 ) ) ( HOIST-AT ?auto_454 ?auto_453 ) ( LIFTING ?auto_454 ?auto_444 ) ( not ( = ?auto_447 ?auto_454 ) ) ( not ( = ?auto_449 ?auto_454 ) ) )
    :subtasks
    ( ( !LOAD ?auto_454 ?auto_444 ?auto_446 ?auto_453 )
      ( MAKE-2CRATE ?auto_452 ?auto_444 ?auto_445 )
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
      ?auto_460 - HOIST
      ?auto_459 - PLACE
      ?auto_463 - PLACE
      ?auto_462 - HOIST
      ?auto_464 - SURFACE
      ?auto_461 - TRUCK
      ?auto_465 - PLACE
      ?auto_458 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_460 ?auto_459 ) ( IS-CRATE ?auto_457 ) ( not ( = ?auto_456 ?auto_457 ) ) ( not ( = ?auto_455 ?auto_456 ) ) ( not ( = ?auto_455 ?auto_457 ) ) ( not ( = ?auto_463 ?auto_459 ) ) ( HOIST-AT ?auto_462 ?auto_463 ) ( not ( = ?auto_460 ?auto_462 ) ) ( AVAILABLE ?auto_462 ) ( SURFACE-AT ?auto_457 ?auto_463 ) ( ON ?auto_457 ?auto_464 ) ( CLEAR ?auto_457 ) ( not ( = ?auto_456 ?auto_464 ) ) ( not ( = ?auto_457 ?auto_464 ) ) ( not ( = ?auto_455 ?auto_464 ) ) ( SURFACE-AT ?auto_455 ?auto_459 ) ( CLEAR ?auto_455 ) ( IS-CRATE ?auto_456 ) ( AVAILABLE ?auto_460 ) ( TRUCK-AT ?auto_461 ?auto_465 ) ( not ( = ?auto_465 ?auto_459 ) ) ( not ( = ?auto_463 ?auto_465 ) ) ( HOIST-AT ?auto_458 ?auto_465 ) ( LIFTING ?auto_458 ?auto_456 ) ( not ( = ?auto_460 ?auto_458 ) ) ( not ( = ?auto_462 ?auto_458 ) ) )
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
      ?auto_471 - HOIST
      ?auto_470 - PLACE
      ?auto_472 - SURFACE
      ?auto_469 - PLACE
      ?auto_475 - HOIST
      ?auto_468 - SURFACE
      ?auto_473 - TRUCK
      ?auto_474 - PLACE
      ?auto_476 - HOIST
      ?auto_477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_471 ?auto_470 ) ( IS-CRATE ?auto_467 ) ( not ( = ?auto_466 ?auto_467 ) ) ( not ( = ?auto_472 ?auto_466 ) ) ( not ( = ?auto_472 ?auto_467 ) ) ( not ( = ?auto_469 ?auto_470 ) ) ( HOIST-AT ?auto_475 ?auto_469 ) ( not ( = ?auto_471 ?auto_475 ) ) ( AVAILABLE ?auto_475 ) ( SURFACE-AT ?auto_467 ?auto_469 ) ( ON ?auto_467 ?auto_468 ) ( CLEAR ?auto_467 ) ( not ( = ?auto_466 ?auto_468 ) ) ( not ( = ?auto_467 ?auto_468 ) ) ( not ( = ?auto_472 ?auto_468 ) ) ( SURFACE-AT ?auto_472 ?auto_470 ) ( CLEAR ?auto_472 ) ( IS-CRATE ?auto_466 ) ( AVAILABLE ?auto_471 ) ( TRUCK-AT ?auto_473 ?auto_474 ) ( not ( = ?auto_474 ?auto_470 ) ) ( not ( = ?auto_469 ?auto_474 ) ) ( HOIST-AT ?auto_476 ?auto_474 ) ( not ( = ?auto_471 ?auto_476 ) ) ( not ( = ?auto_475 ?auto_476 ) ) ( AVAILABLE ?auto_476 ) ( SURFACE-AT ?auto_466 ?auto_474 ) ( ON ?auto_466 ?auto_477 ) ( CLEAR ?auto_466 ) ( not ( = ?auto_466 ?auto_477 ) ) ( not ( = ?auto_467 ?auto_477 ) ) ( not ( = ?auto_472 ?auto_477 ) ) ( not ( = ?auto_468 ?auto_477 ) ) )
    :subtasks
    ( ( !LIFT ?auto_476 ?auto_466 ?auto_477 ?auto_474 )
      ( MAKE-2CRATE ?auto_472 ?auto_466 ?auto_467 )
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
      ?auto_482 - HOIST
      ?auto_486 - PLACE
      ?auto_488 - PLACE
      ?auto_483 - HOIST
      ?auto_485 - SURFACE
      ?auto_481 - TRUCK
      ?auto_487 - PLACE
      ?auto_484 - HOIST
      ?auto_489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482 ?auto_486 ) ( IS-CRATE ?auto_480 ) ( not ( = ?auto_479 ?auto_480 ) ) ( not ( = ?auto_478 ?auto_479 ) ) ( not ( = ?auto_478 ?auto_480 ) ) ( not ( = ?auto_488 ?auto_486 ) ) ( HOIST-AT ?auto_483 ?auto_488 ) ( not ( = ?auto_482 ?auto_483 ) ) ( AVAILABLE ?auto_483 ) ( SURFACE-AT ?auto_480 ?auto_488 ) ( ON ?auto_480 ?auto_485 ) ( CLEAR ?auto_480 ) ( not ( = ?auto_479 ?auto_485 ) ) ( not ( = ?auto_480 ?auto_485 ) ) ( not ( = ?auto_478 ?auto_485 ) ) ( SURFACE-AT ?auto_478 ?auto_486 ) ( CLEAR ?auto_478 ) ( IS-CRATE ?auto_479 ) ( AVAILABLE ?auto_482 ) ( TRUCK-AT ?auto_481 ?auto_487 ) ( not ( = ?auto_487 ?auto_486 ) ) ( not ( = ?auto_488 ?auto_487 ) ) ( HOIST-AT ?auto_484 ?auto_487 ) ( not ( = ?auto_482 ?auto_484 ) ) ( not ( = ?auto_483 ?auto_484 ) ) ( AVAILABLE ?auto_484 ) ( SURFACE-AT ?auto_479 ?auto_487 ) ( ON ?auto_479 ?auto_489 ) ( CLEAR ?auto_479 ) ( not ( = ?auto_479 ?auto_489 ) ) ( not ( = ?auto_480 ?auto_489 ) ) ( not ( = ?auto_478 ?auto_489 ) ) ( not ( = ?auto_485 ?auto_489 ) ) )
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
      ?auto_492 - HOIST
      ?auto_498 - PLACE
      ?auto_501 - SURFACE
      ?auto_493 - PLACE
      ?auto_494 - HOIST
      ?auto_500 - SURFACE
      ?auto_497 - PLACE
      ?auto_495 - HOIST
      ?auto_499 - SURFACE
      ?auto_496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_492 ?auto_498 ) ( IS-CRATE ?auto_491 ) ( not ( = ?auto_490 ?auto_491 ) ) ( not ( = ?auto_501 ?auto_490 ) ) ( not ( = ?auto_501 ?auto_491 ) ) ( not ( = ?auto_493 ?auto_498 ) ) ( HOIST-AT ?auto_494 ?auto_493 ) ( not ( = ?auto_492 ?auto_494 ) ) ( AVAILABLE ?auto_494 ) ( SURFACE-AT ?auto_491 ?auto_493 ) ( ON ?auto_491 ?auto_500 ) ( CLEAR ?auto_491 ) ( not ( = ?auto_490 ?auto_500 ) ) ( not ( = ?auto_491 ?auto_500 ) ) ( not ( = ?auto_501 ?auto_500 ) ) ( SURFACE-AT ?auto_501 ?auto_498 ) ( CLEAR ?auto_501 ) ( IS-CRATE ?auto_490 ) ( AVAILABLE ?auto_492 ) ( not ( = ?auto_497 ?auto_498 ) ) ( not ( = ?auto_493 ?auto_497 ) ) ( HOIST-AT ?auto_495 ?auto_497 ) ( not ( = ?auto_492 ?auto_495 ) ) ( not ( = ?auto_494 ?auto_495 ) ) ( AVAILABLE ?auto_495 ) ( SURFACE-AT ?auto_490 ?auto_497 ) ( ON ?auto_490 ?auto_499 ) ( CLEAR ?auto_490 ) ( not ( = ?auto_490 ?auto_499 ) ) ( not ( = ?auto_491 ?auto_499 ) ) ( not ( = ?auto_501 ?auto_499 ) ) ( not ( = ?auto_500 ?auto_499 ) ) ( TRUCK-AT ?auto_496 ?auto_498 ) )
    :subtasks
    ( ( !DRIVE ?auto_496 ?auto_498 ?auto_497 )
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
      ?auto_507 - HOIST
      ?auto_508 - PLACE
      ?auto_513 - PLACE
      ?auto_511 - HOIST
      ?auto_505 - SURFACE
      ?auto_506 - PLACE
      ?auto_510 - HOIST
      ?auto_509 - SURFACE
      ?auto_512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507 ?auto_508 ) ( IS-CRATE ?auto_504 ) ( not ( = ?auto_503 ?auto_504 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_504 ) ) ( not ( = ?auto_513 ?auto_508 ) ) ( HOIST-AT ?auto_511 ?auto_513 ) ( not ( = ?auto_507 ?auto_511 ) ) ( AVAILABLE ?auto_511 ) ( SURFACE-AT ?auto_504 ?auto_513 ) ( ON ?auto_504 ?auto_505 ) ( CLEAR ?auto_504 ) ( not ( = ?auto_503 ?auto_505 ) ) ( not ( = ?auto_504 ?auto_505 ) ) ( not ( = ?auto_502 ?auto_505 ) ) ( SURFACE-AT ?auto_502 ?auto_508 ) ( CLEAR ?auto_502 ) ( IS-CRATE ?auto_503 ) ( AVAILABLE ?auto_507 ) ( not ( = ?auto_506 ?auto_508 ) ) ( not ( = ?auto_513 ?auto_506 ) ) ( HOIST-AT ?auto_510 ?auto_506 ) ( not ( = ?auto_507 ?auto_510 ) ) ( not ( = ?auto_511 ?auto_510 ) ) ( AVAILABLE ?auto_510 ) ( SURFACE-AT ?auto_503 ?auto_506 ) ( ON ?auto_503 ?auto_509 ) ( CLEAR ?auto_503 ) ( not ( = ?auto_503 ?auto_509 ) ) ( not ( = ?auto_504 ?auto_509 ) ) ( not ( = ?auto_502 ?auto_509 ) ) ( not ( = ?auto_505 ?auto_509 ) ) ( TRUCK-AT ?auto_512 ?auto_508 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_503 ?auto_504 )
      ( MAKE-2CRATE-VERIFY ?auto_502 ?auto_503 ?auto_504 ) )
  )

)

