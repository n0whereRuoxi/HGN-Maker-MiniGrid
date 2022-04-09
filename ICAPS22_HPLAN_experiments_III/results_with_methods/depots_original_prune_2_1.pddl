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
      ?auto_252 - HOIST
      ?auto_251 - PLACE
      ?auto_253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_252 ?auto_251 ) ( SURFACE-AT ?auto_249 ?auto_251 ) ( CLEAR ?auto_249 ) ( IS-CRATE ?auto_250 ) ( not ( = ?auto_249 ?auto_250 ) ) ( TRUCK-AT ?auto_253 ?auto_251 ) ( AVAILABLE ?auto_252 ) ( IN ?auto_250 ?auto_253 ) )
    :subtasks
    ( ( !UNLOAD ?auto_252 ?auto_250 ?auto_253 ?auto_251 )
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
      ?auto_256 - HOIST
      ?auto_258 - PLACE
      ?auto_257 - TRUCK
      ?auto_259 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_256 ?auto_258 ) ( SURFACE-AT ?auto_254 ?auto_258 ) ( CLEAR ?auto_254 ) ( IS-CRATE ?auto_255 ) ( not ( = ?auto_254 ?auto_255 ) ) ( AVAILABLE ?auto_256 ) ( IN ?auto_255 ?auto_257 ) ( TRUCK-AT ?auto_257 ?auto_259 ) ( not ( = ?auto_259 ?auto_258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_257 ?auto_259 ?auto_258 )
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
      ?auto_263 - HOIST
      ?auto_264 - PLACE
      ?auto_265 - TRUCK
      ?auto_262 - PLACE
      ?auto_266 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_263 ?auto_264 ) ( SURFACE-AT ?auto_260 ?auto_264 ) ( CLEAR ?auto_260 ) ( IS-CRATE ?auto_261 ) ( not ( = ?auto_260 ?auto_261 ) ) ( AVAILABLE ?auto_263 ) ( TRUCK-AT ?auto_265 ?auto_262 ) ( not ( = ?auto_262 ?auto_264 ) ) ( HOIST-AT ?auto_266 ?auto_262 ) ( LIFTING ?auto_266 ?auto_261 ) ( not ( = ?auto_263 ?auto_266 ) ) )
    :subtasks
    ( ( !LOAD ?auto_266 ?auto_261 ?auto_265 ?auto_262 )
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
      ?auto_269 - PLACE
      ?auto_271 - TRUCK
      ?auto_273 - PLACE
      ?auto_270 - HOIST
      ?auto_274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_272 ?auto_269 ) ( SURFACE-AT ?auto_267 ?auto_269 ) ( CLEAR ?auto_267 ) ( IS-CRATE ?auto_268 ) ( not ( = ?auto_267 ?auto_268 ) ) ( AVAILABLE ?auto_272 ) ( TRUCK-AT ?auto_271 ?auto_273 ) ( not ( = ?auto_273 ?auto_269 ) ) ( HOIST-AT ?auto_270 ?auto_273 ) ( not ( = ?auto_272 ?auto_270 ) ) ( AVAILABLE ?auto_270 ) ( SURFACE-AT ?auto_268 ?auto_273 ) ( ON ?auto_268 ?auto_274 ) ( CLEAR ?auto_268 ) ( not ( = ?auto_267 ?auto_274 ) ) ( not ( = ?auto_268 ?auto_274 ) ) )
    :subtasks
    ( ( !LIFT ?auto_270 ?auto_268 ?auto_274 ?auto_273 )
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
      ?auto_277 - PLACE
      ?auto_278 - PLACE
      ?auto_281 - HOIST
      ?auto_279 - SURFACE
      ?auto_280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_282 ?auto_277 ) ( SURFACE-AT ?auto_275 ?auto_277 ) ( CLEAR ?auto_275 ) ( IS-CRATE ?auto_276 ) ( not ( = ?auto_275 ?auto_276 ) ) ( AVAILABLE ?auto_282 ) ( not ( = ?auto_278 ?auto_277 ) ) ( HOIST-AT ?auto_281 ?auto_278 ) ( not ( = ?auto_282 ?auto_281 ) ) ( AVAILABLE ?auto_281 ) ( SURFACE-AT ?auto_276 ?auto_278 ) ( ON ?auto_276 ?auto_279 ) ( CLEAR ?auto_276 ) ( not ( = ?auto_275 ?auto_279 ) ) ( not ( = ?auto_276 ?auto_279 ) ) ( TRUCK-AT ?auto_280 ?auto_277 ) )
    :subtasks
    ( ( !DRIVE ?auto_280 ?auto_277 ?auto_278 )
      ( MAKE-1CRATE ?auto_275 ?auto_276 )
      ( MAKE-1CRATE-VERIFY ?auto_275 ?auto_276 ) )
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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_302 - SURFACE
      ?auto_303 - SURFACE
      ?auto_304 - SURFACE
    )
    :vars
    (
      ?auto_307 - HOIST
      ?auto_306 - PLACE
      ?auto_305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_307 ?auto_306 ) ( SURFACE-AT ?auto_303 ?auto_306 ) ( CLEAR ?auto_303 ) ( IS-CRATE ?auto_304 ) ( not ( = ?auto_303 ?auto_304 ) ) ( TRUCK-AT ?auto_305 ?auto_306 ) ( AVAILABLE ?auto_307 ) ( IN ?auto_304 ?auto_305 ) ( ON ?auto_303 ?auto_302 ) ( not ( = ?auto_302 ?auto_303 ) ) ( not ( = ?auto_302 ?auto_304 ) ) )
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
      ?auto_311 - HOIST
      ?auto_310 - PLACE
      ?auto_312 - TRUCK
      ?auto_313 - SURFACE
      ?auto_314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_311 ?auto_310 ) ( SURFACE-AT ?auto_308 ?auto_310 ) ( CLEAR ?auto_308 ) ( IS-CRATE ?auto_309 ) ( not ( = ?auto_308 ?auto_309 ) ) ( AVAILABLE ?auto_311 ) ( IN ?auto_309 ?auto_312 ) ( ON ?auto_308 ?auto_313 ) ( not ( = ?auto_313 ?auto_308 ) ) ( not ( = ?auto_313 ?auto_309 ) ) ( TRUCK-AT ?auto_312 ?auto_314 ) ( not ( = ?auto_314 ?auto_310 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_312 ?auto_314 ?auto_310 )
      ( MAKE-2CRATE ?auto_313 ?auto_308 ?auto_309 )
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
      ?auto_319 - PLACE
      ?auto_318 - TRUCK
      ?auto_320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321 ?auto_319 ) ( SURFACE-AT ?auto_316 ?auto_319 ) ( CLEAR ?auto_316 ) ( IS-CRATE ?auto_317 ) ( not ( = ?auto_316 ?auto_317 ) ) ( AVAILABLE ?auto_321 ) ( IN ?auto_317 ?auto_318 ) ( ON ?auto_316 ?auto_315 ) ( not ( = ?auto_315 ?auto_316 ) ) ( not ( = ?auto_315 ?auto_317 ) ) ( TRUCK-AT ?auto_318 ?auto_320 ) ( not ( = ?auto_320 ?auto_319 ) ) )
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
      ?auto_327 - HOIST
      ?auto_324 - PLACE
      ?auto_326 - SURFACE
      ?auto_325 - TRUCK
      ?auto_328 - PLACE
      ?auto_329 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_327 ?auto_324 ) ( SURFACE-AT ?auto_322 ?auto_324 ) ( CLEAR ?auto_322 ) ( IS-CRATE ?auto_323 ) ( not ( = ?auto_322 ?auto_323 ) ) ( AVAILABLE ?auto_327 ) ( ON ?auto_322 ?auto_326 ) ( not ( = ?auto_326 ?auto_322 ) ) ( not ( = ?auto_326 ?auto_323 ) ) ( TRUCK-AT ?auto_325 ?auto_328 ) ( not ( = ?auto_328 ?auto_324 ) ) ( HOIST-AT ?auto_329 ?auto_328 ) ( LIFTING ?auto_329 ?auto_323 ) ( not ( = ?auto_327 ?auto_329 ) ) )
    :subtasks
    ( ( !LOAD ?auto_329 ?auto_323 ?auto_325 ?auto_328 )
      ( MAKE-2CRATE ?auto_326 ?auto_322 ?auto_323 )
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
      ?auto_337 - HOIST
      ?auto_336 - PLACE
      ?auto_334 - TRUCK
      ?auto_333 - PLACE
      ?auto_335 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_337 ?auto_336 ) ( SURFACE-AT ?auto_331 ?auto_336 ) ( CLEAR ?auto_331 ) ( IS-CRATE ?auto_332 ) ( not ( = ?auto_331 ?auto_332 ) ) ( AVAILABLE ?auto_337 ) ( ON ?auto_331 ?auto_330 ) ( not ( = ?auto_330 ?auto_331 ) ) ( not ( = ?auto_330 ?auto_332 ) ) ( TRUCK-AT ?auto_334 ?auto_333 ) ( not ( = ?auto_333 ?auto_336 ) ) ( HOIST-AT ?auto_335 ?auto_333 ) ( LIFTING ?auto_335 ?auto_332 ) ( not ( = ?auto_337 ?auto_335 ) ) )
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
      ?auto_345 - PLACE
      ?auto_340 - SURFACE
      ?auto_342 - TRUCK
      ?auto_344 - PLACE
      ?auto_343 - HOIST
      ?auto_346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_341 ?auto_345 ) ( SURFACE-AT ?auto_338 ?auto_345 ) ( CLEAR ?auto_338 ) ( IS-CRATE ?auto_339 ) ( not ( = ?auto_338 ?auto_339 ) ) ( AVAILABLE ?auto_341 ) ( ON ?auto_338 ?auto_340 ) ( not ( = ?auto_340 ?auto_338 ) ) ( not ( = ?auto_340 ?auto_339 ) ) ( TRUCK-AT ?auto_342 ?auto_344 ) ( not ( = ?auto_344 ?auto_345 ) ) ( HOIST-AT ?auto_343 ?auto_344 ) ( not ( = ?auto_341 ?auto_343 ) ) ( AVAILABLE ?auto_343 ) ( SURFACE-AT ?auto_339 ?auto_344 ) ( ON ?auto_339 ?auto_346 ) ( CLEAR ?auto_339 ) ( not ( = ?auto_338 ?auto_346 ) ) ( not ( = ?auto_339 ?auto_346 ) ) ( not ( = ?auto_340 ?auto_346 ) ) )
    :subtasks
    ( ( !LIFT ?auto_343 ?auto_339 ?auto_346 ?auto_344 )
      ( MAKE-2CRATE ?auto_340 ?auto_338 ?auto_339 )
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
      ?auto_354 - HOIST
      ?auto_355 - PLACE
      ?auto_353 - TRUCK
      ?auto_351 - PLACE
      ?auto_352 - HOIST
      ?auto_350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_354 ?auto_355 ) ( SURFACE-AT ?auto_348 ?auto_355 ) ( CLEAR ?auto_348 ) ( IS-CRATE ?auto_349 ) ( not ( = ?auto_348 ?auto_349 ) ) ( AVAILABLE ?auto_354 ) ( ON ?auto_348 ?auto_347 ) ( not ( = ?auto_347 ?auto_348 ) ) ( not ( = ?auto_347 ?auto_349 ) ) ( TRUCK-AT ?auto_353 ?auto_351 ) ( not ( = ?auto_351 ?auto_355 ) ) ( HOIST-AT ?auto_352 ?auto_351 ) ( not ( = ?auto_354 ?auto_352 ) ) ( AVAILABLE ?auto_352 ) ( SURFACE-AT ?auto_349 ?auto_351 ) ( ON ?auto_349 ?auto_350 ) ( CLEAR ?auto_349 ) ( not ( = ?auto_348 ?auto_350 ) ) ( not ( = ?auto_349 ?auto_350 ) ) ( not ( = ?auto_347 ?auto_350 ) ) )
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
      ?auto_360 - HOIST
      ?auto_364 - PLACE
      ?auto_363 - SURFACE
      ?auto_362 - PLACE
      ?auto_358 - HOIST
      ?auto_361 - SURFACE
      ?auto_359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_360 ?auto_364 ) ( SURFACE-AT ?auto_356 ?auto_364 ) ( CLEAR ?auto_356 ) ( IS-CRATE ?auto_357 ) ( not ( = ?auto_356 ?auto_357 ) ) ( AVAILABLE ?auto_360 ) ( ON ?auto_356 ?auto_363 ) ( not ( = ?auto_363 ?auto_356 ) ) ( not ( = ?auto_363 ?auto_357 ) ) ( not ( = ?auto_362 ?auto_364 ) ) ( HOIST-AT ?auto_358 ?auto_362 ) ( not ( = ?auto_360 ?auto_358 ) ) ( AVAILABLE ?auto_358 ) ( SURFACE-AT ?auto_357 ?auto_362 ) ( ON ?auto_357 ?auto_361 ) ( CLEAR ?auto_357 ) ( not ( = ?auto_356 ?auto_361 ) ) ( not ( = ?auto_357 ?auto_361 ) ) ( not ( = ?auto_363 ?auto_361 ) ) ( TRUCK-AT ?auto_359 ?auto_364 ) )
    :subtasks
    ( ( !DRIVE ?auto_359 ?auto_364 ?auto_362 )
      ( MAKE-2CRATE ?auto_363 ?auto_356 ?auto_357 )
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
      ?auto_372 - HOIST
      ?auto_371 - PLACE
      ?auto_369 - PLACE
      ?auto_368 - HOIST
      ?auto_370 - SURFACE
      ?auto_373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_372 ?auto_371 ) ( SURFACE-AT ?auto_366 ?auto_371 ) ( CLEAR ?auto_366 ) ( IS-CRATE ?auto_367 ) ( not ( = ?auto_366 ?auto_367 ) ) ( AVAILABLE ?auto_372 ) ( ON ?auto_366 ?auto_365 ) ( not ( = ?auto_365 ?auto_366 ) ) ( not ( = ?auto_365 ?auto_367 ) ) ( not ( = ?auto_369 ?auto_371 ) ) ( HOIST-AT ?auto_368 ?auto_369 ) ( not ( = ?auto_372 ?auto_368 ) ) ( AVAILABLE ?auto_368 ) ( SURFACE-AT ?auto_367 ?auto_369 ) ( ON ?auto_367 ?auto_370 ) ( CLEAR ?auto_367 ) ( not ( = ?auto_366 ?auto_370 ) ) ( not ( = ?auto_367 ?auto_370 ) ) ( not ( = ?auto_365 ?auto_370 ) ) ( TRUCK-AT ?auto_373 ?auto_371 ) )
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
      ?auto_376 - HOIST
      ?auto_382 - PLACE
      ?auto_379 - SURFACE
      ?auto_380 - PLACE
      ?auto_381 - HOIST
      ?auto_377 - SURFACE
      ?auto_378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376 ?auto_382 ) ( IS-CRATE ?auto_375 ) ( not ( = ?auto_374 ?auto_375 ) ) ( not ( = ?auto_379 ?auto_374 ) ) ( not ( = ?auto_379 ?auto_375 ) ) ( not ( = ?auto_380 ?auto_382 ) ) ( HOIST-AT ?auto_381 ?auto_380 ) ( not ( = ?auto_376 ?auto_381 ) ) ( AVAILABLE ?auto_381 ) ( SURFACE-AT ?auto_375 ?auto_380 ) ( ON ?auto_375 ?auto_377 ) ( CLEAR ?auto_375 ) ( not ( = ?auto_374 ?auto_377 ) ) ( not ( = ?auto_375 ?auto_377 ) ) ( not ( = ?auto_379 ?auto_377 ) ) ( TRUCK-AT ?auto_378 ?auto_382 ) ( SURFACE-AT ?auto_379 ?auto_382 ) ( CLEAR ?auto_379 ) ( LIFTING ?auto_376 ?auto_374 ) ( IS-CRATE ?auto_374 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_379 ?auto_374 )
      ( MAKE-2CRATE ?auto_379 ?auto_374 ?auto_375 )
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
      ?auto_391 - HOIST
      ?auto_387 - PLACE
      ?auto_388 - PLACE
      ?auto_386 - HOIST
      ?auto_390 - SURFACE
      ?auto_389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_391 ?auto_387 ) ( IS-CRATE ?auto_385 ) ( not ( = ?auto_384 ?auto_385 ) ) ( not ( = ?auto_383 ?auto_384 ) ) ( not ( = ?auto_383 ?auto_385 ) ) ( not ( = ?auto_388 ?auto_387 ) ) ( HOIST-AT ?auto_386 ?auto_388 ) ( not ( = ?auto_391 ?auto_386 ) ) ( AVAILABLE ?auto_386 ) ( SURFACE-AT ?auto_385 ?auto_388 ) ( ON ?auto_385 ?auto_390 ) ( CLEAR ?auto_385 ) ( not ( = ?auto_384 ?auto_390 ) ) ( not ( = ?auto_385 ?auto_390 ) ) ( not ( = ?auto_383 ?auto_390 ) ) ( TRUCK-AT ?auto_389 ?auto_387 ) ( SURFACE-AT ?auto_383 ?auto_387 ) ( CLEAR ?auto_383 ) ( LIFTING ?auto_391 ?auto_384 ) ( IS-CRATE ?auto_384 ) )
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
      ?auto_394 - HOIST
      ?auto_399 - PLACE
      ?auto_396 - SURFACE
      ?auto_397 - PLACE
      ?auto_400 - HOIST
      ?auto_398 - SURFACE
      ?auto_395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_394 ?auto_399 ) ( IS-CRATE ?auto_393 ) ( not ( = ?auto_392 ?auto_393 ) ) ( not ( = ?auto_396 ?auto_392 ) ) ( not ( = ?auto_396 ?auto_393 ) ) ( not ( = ?auto_397 ?auto_399 ) ) ( HOIST-AT ?auto_400 ?auto_397 ) ( not ( = ?auto_394 ?auto_400 ) ) ( AVAILABLE ?auto_400 ) ( SURFACE-AT ?auto_393 ?auto_397 ) ( ON ?auto_393 ?auto_398 ) ( CLEAR ?auto_393 ) ( not ( = ?auto_392 ?auto_398 ) ) ( not ( = ?auto_393 ?auto_398 ) ) ( not ( = ?auto_396 ?auto_398 ) ) ( TRUCK-AT ?auto_395 ?auto_399 ) ( SURFACE-AT ?auto_396 ?auto_399 ) ( CLEAR ?auto_396 ) ( IS-CRATE ?auto_392 ) ( AVAILABLE ?auto_394 ) ( IN ?auto_392 ?auto_395 ) )
    :subtasks
    ( ( !UNLOAD ?auto_394 ?auto_392 ?auto_395 ?auto_399 )
      ( MAKE-2CRATE ?auto_396 ?auto_392 ?auto_393 )
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
      ?auto_406 - HOIST
      ?auto_405 - PLACE
      ?auto_408 - PLACE
      ?auto_404 - HOIST
      ?auto_409 - SURFACE
      ?auto_407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406 ?auto_405 ) ( IS-CRATE ?auto_403 ) ( not ( = ?auto_402 ?auto_403 ) ) ( not ( = ?auto_401 ?auto_402 ) ) ( not ( = ?auto_401 ?auto_403 ) ) ( not ( = ?auto_408 ?auto_405 ) ) ( HOIST-AT ?auto_404 ?auto_408 ) ( not ( = ?auto_406 ?auto_404 ) ) ( AVAILABLE ?auto_404 ) ( SURFACE-AT ?auto_403 ?auto_408 ) ( ON ?auto_403 ?auto_409 ) ( CLEAR ?auto_403 ) ( not ( = ?auto_402 ?auto_409 ) ) ( not ( = ?auto_403 ?auto_409 ) ) ( not ( = ?auto_401 ?auto_409 ) ) ( TRUCK-AT ?auto_407 ?auto_405 ) ( SURFACE-AT ?auto_401 ?auto_405 ) ( CLEAR ?auto_401 ) ( IS-CRATE ?auto_402 ) ( AVAILABLE ?auto_406 ) ( IN ?auto_402 ?auto_407 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402 ?auto_403 )
      ( MAKE-2CRATE-VERIFY ?auto_401 ?auto_402 ?auto_403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_446 - SURFACE
      ?auto_447 - SURFACE
    )
    :vars
    (
      ?auto_448 - HOIST
      ?auto_454 - PLACE
      ?auto_452 - SURFACE
      ?auto_450 - PLACE
      ?auto_451 - HOIST
      ?auto_453 - SURFACE
      ?auto_449 - TRUCK
      ?auto_455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_448 ?auto_454 ) ( SURFACE-AT ?auto_446 ?auto_454 ) ( CLEAR ?auto_446 ) ( IS-CRATE ?auto_447 ) ( not ( = ?auto_446 ?auto_447 ) ) ( AVAILABLE ?auto_448 ) ( ON ?auto_446 ?auto_452 ) ( not ( = ?auto_452 ?auto_446 ) ) ( not ( = ?auto_452 ?auto_447 ) ) ( not ( = ?auto_450 ?auto_454 ) ) ( HOIST-AT ?auto_451 ?auto_450 ) ( not ( = ?auto_448 ?auto_451 ) ) ( AVAILABLE ?auto_451 ) ( SURFACE-AT ?auto_447 ?auto_450 ) ( ON ?auto_447 ?auto_453 ) ( CLEAR ?auto_447 ) ( not ( = ?auto_446 ?auto_453 ) ) ( not ( = ?auto_447 ?auto_453 ) ) ( not ( = ?auto_452 ?auto_453 ) ) ( TRUCK-AT ?auto_449 ?auto_455 ) ( not ( = ?auto_455 ?auto_454 ) ) ( not ( = ?auto_450 ?auto_455 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_449 ?auto_455 ?auto_454 )
      ( MAKE-1CRATE ?auto_446 ?auto_447 )
      ( MAKE-1CRATE-VERIFY ?auto_446 ?auto_447 ) )
  )

)

