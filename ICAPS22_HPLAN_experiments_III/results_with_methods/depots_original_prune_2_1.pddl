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
      ?auto_232 - HOIST
      ?auto_233 - PLACE
      ?auto_234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_232 ?auto_233 ) ( SURFACE-AT ?auto_230 ?auto_233 ) ( CLEAR ?auto_230 ) ( IS-CRATE ?auto_231 ) ( not ( = ?auto_230 ?auto_231 ) ) ( TRUCK-AT ?auto_234 ?auto_233 ) ( AVAILABLE ?auto_232 ) ( IN ?auto_231 ?auto_234 ) )
    :subtasks
    ( ( !UNLOAD ?auto_232 ?auto_231 ?auto_234 ?auto_233 )
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
      ?auto_238 - HOIST
      ?auto_237 - PLACE
      ?auto_239 - TRUCK
      ?auto_240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_238 ?auto_237 ) ( SURFACE-AT ?auto_235 ?auto_237 ) ( CLEAR ?auto_235 ) ( IS-CRATE ?auto_236 ) ( not ( = ?auto_235 ?auto_236 ) ) ( AVAILABLE ?auto_238 ) ( IN ?auto_236 ?auto_239 ) ( TRUCK-AT ?auto_239 ?auto_240 ) ( not ( = ?auto_240 ?auto_237 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_239 ?auto_240 ?auto_237 )
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
      ?auto_246 - HOIST
      ?auto_244 - PLACE
      ?auto_243 - TRUCK
      ?auto_245 - PLACE
      ?auto_247 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_246 ?auto_244 ) ( SURFACE-AT ?auto_241 ?auto_244 ) ( CLEAR ?auto_241 ) ( IS-CRATE ?auto_242 ) ( not ( = ?auto_241 ?auto_242 ) ) ( AVAILABLE ?auto_246 ) ( TRUCK-AT ?auto_243 ?auto_245 ) ( not ( = ?auto_245 ?auto_244 ) ) ( HOIST-AT ?auto_247 ?auto_245 ) ( LIFTING ?auto_247 ?auto_242 ) ( not ( = ?auto_246 ?auto_247 ) ) )
    :subtasks
    ( ( !LOAD ?auto_247 ?auto_242 ?auto_243 ?auto_245 )
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
      ?auto_251 - PLACE
      ?auto_252 - TRUCK
      ?auto_254 - PLACE
      ?auto_250 - HOIST
      ?auto_255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253 ?auto_251 ) ( SURFACE-AT ?auto_248 ?auto_251 ) ( CLEAR ?auto_248 ) ( IS-CRATE ?auto_249 ) ( not ( = ?auto_248 ?auto_249 ) ) ( AVAILABLE ?auto_253 ) ( TRUCK-AT ?auto_252 ?auto_254 ) ( not ( = ?auto_254 ?auto_251 ) ) ( HOIST-AT ?auto_250 ?auto_254 ) ( not ( = ?auto_253 ?auto_250 ) ) ( AVAILABLE ?auto_250 ) ( SURFACE-AT ?auto_249 ?auto_254 ) ( ON ?auto_249 ?auto_255 ) ( CLEAR ?auto_249 ) ( not ( = ?auto_248 ?auto_255 ) ) ( not ( = ?auto_249 ?auto_255 ) ) )
    :subtasks
    ( ( !LIFT ?auto_250 ?auto_249 ?auto_255 ?auto_254 )
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
      ?auto_258 - HOIST
      ?auto_261 - PLACE
      ?auto_263 - PLACE
      ?auto_259 - HOIST
      ?auto_262 - SURFACE
      ?auto_260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258 ?auto_261 ) ( SURFACE-AT ?auto_256 ?auto_261 ) ( CLEAR ?auto_256 ) ( IS-CRATE ?auto_257 ) ( not ( = ?auto_256 ?auto_257 ) ) ( AVAILABLE ?auto_258 ) ( not ( = ?auto_263 ?auto_261 ) ) ( HOIST-AT ?auto_259 ?auto_263 ) ( not ( = ?auto_258 ?auto_259 ) ) ( AVAILABLE ?auto_259 ) ( SURFACE-AT ?auto_257 ?auto_263 ) ( ON ?auto_257 ?auto_262 ) ( CLEAR ?auto_257 ) ( not ( = ?auto_256 ?auto_262 ) ) ( not ( = ?auto_257 ?auto_262 ) ) ( TRUCK-AT ?auto_260 ?auto_261 ) )
    :subtasks
    ( ( !DRIVE ?auto_260 ?auto_261 ?auto_263 )
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
      ?auto_277 - HOIST
      ?auto_276 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_277 ?auto_276 ) ( SURFACE-AT ?auto_274 ?auto_276 ) ( CLEAR ?auto_274 ) ( LIFTING ?auto_277 ?auto_275 ) ( IS-CRATE ?auto_275 ) ( not ( = ?auto_274 ?auto_275 ) ) ( ON ?auto_274 ?auto_273 ) ( not ( = ?auto_273 ?auto_274 ) ) ( not ( = ?auto_273 ?auto_275 ) ) )
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
      ?auto_288 - HOIST
      ?auto_286 - PLACE
      ?auto_287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_288 ?auto_286 ) ( SURFACE-AT ?auto_284 ?auto_286 ) ( CLEAR ?auto_284 ) ( IS-CRATE ?auto_285 ) ( not ( = ?auto_284 ?auto_285 ) ) ( TRUCK-AT ?auto_287 ?auto_286 ) ( AVAILABLE ?auto_288 ) ( IN ?auto_285 ?auto_287 ) ( ON ?auto_284 ?auto_283 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_285 ) ) )
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
      ?auto_292 - HOIST
      ?auto_293 - PLACE
      ?auto_291 - TRUCK
      ?auto_294 - SURFACE
      ?auto_295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292 ?auto_293 ) ( SURFACE-AT ?auto_289 ?auto_293 ) ( CLEAR ?auto_289 ) ( IS-CRATE ?auto_290 ) ( not ( = ?auto_289 ?auto_290 ) ) ( AVAILABLE ?auto_292 ) ( IN ?auto_290 ?auto_291 ) ( ON ?auto_289 ?auto_294 ) ( not ( = ?auto_294 ?auto_289 ) ) ( not ( = ?auto_294 ?auto_290 ) ) ( TRUCK-AT ?auto_291 ?auto_295 ) ( not ( = ?auto_295 ?auto_293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_291 ?auto_295 ?auto_293 )
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
      ?auto_300 - HOIST
      ?auto_301 - PLACE
      ?auto_302 - TRUCK
      ?auto_299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_300 ?auto_301 ) ( SURFACE-AT ?auto_297 ?auto_301 ) ( CLEAR ?auto_297 ) ( IS-CRATE ?auto_298 ) ( not ( = ?auto_297 ?auto_298 ) ) ( AVAILABLE ?auto_300 ) ( IN ?auto_298 ?auto_302 ) ( ON ?auto_297 ?auto_296 ) ( not ( = ?auto_296 ?auto_297 ) ) ( not ( = ?auto_296 ?auto_298 ) ) ( TRUCK-AT ?auto_302 ?auto_299 ) ( not ( = ?auto_299 ?auto_301 ) ) )
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
      ?auto_307 - HOIST
      ?auto_305 - PLACE
      ?auto_309 - SURFACE
      ?auto_308 - TRUCK
      ?auto_306 - PLACE
      ?auto_310 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_307 ?auto_305 ) ( SURFACE-AT ?auto_303 ?auto_305 ) ( CLEAR ?auto_303 ) ( IS-CRATE ?auto_304 ) ( not ( = ?auto_303 ?auto_304 ) ) ( AVAILABLE ?auto_307 ) ( ON ?auto_303 ?auto_309 ) ( not ( = ?auto_309 ?auto_303 ) ) ( not ( = ?auto_309 ?auto_304 ) ) ( TRUCK-AT ?auto_308 ?auto_306 ) ( not ( = ?auto_306 ?auto_305 ) ) ( HOIST-AT ?auto_310 ?auto_306 ) ( LIFTING ?auto_310 ?auto_304 ) ( not ( = ?auto_307 ?auto_310 ) ) )
    :subtasks
    ( ( !LOAD ?auto_310 ?auto_304 ?auto_308 ?auto_306 )
      ( MAKE-2CRATE ?auto_309 ?auto_303 ?auto_304 )
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
      ?auto_316 - PLACE
      ?auto_314 - TRUCK
      ?auto_315 - PLACE
      ?auto_318 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_317 ?auto_316 ) ( SURFACE-AT ?auto_312 ?auto_316 ) ( CLEAR ?auto_312 ) ( IS-CRATE ?auto_313 ) ( not ( = ?auto_312 ?auto_313 ) ) ( AVAILABLE ?auto_317 ) ( ON ?auto_312 ?auto_311 ) ( not ( = ?auto_311 ?auto_312 ) ) ( not ( = ?auto_311 ?auto_313 ) ) ( TRUCK-AT ?auto_314 ?auto_315 ) ( not ( = ?auto_315 ?auto_316 ) ) ( HOIST-AT ?auto_318 ?auto_315 ) ( LIFTING ?auto_318 ?auto_313 ) ( not ( = ?auto_317 ?auto_318 ) ) )
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
      ?auto_326 - PLACE
      ?auto_325 - SURFACE
      ?auto_324 - TRUCK
      ?auto_323 - PLACE
      ?auto_321 - HOIST
      ?auto_327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322 ?auto_326 ) ( SURFACE-AT ?auto_319 ?auto_326 ) ( CLEAR ?auto_319 ) ( IS-CRATE ?auto_320 ) ( not ( = ?auto_319 ?auto_320 ) ) ( AVAILABLE ?auto_322 ) ( ON ?auto_319 ?auto_325 ) ( not ( = ?auto_325 ?auto_319 ) ) ( not ( = ?auto_325 ?auto_320 ) ) ( TRUCK-AT ?auto_324 ?auto_323 ) ( not ( = ?auto_323 ?auto_326 ) ) ( HOIST-AT ?auto_321 ?auto_323 ) ( not ( = ?auto_322 ?auto_321 ) ) ( AVAILABLE ?auto_321 ) ( SURFACE-AT ?auto_320 ?auto_323 ) ( ON ?auto_320 ?auto_327 ) ( CLEAR ?auto_320 ) ( not ( = ?auto_319 ?auto_327 ) ) ( not ( = ?auto_320 ?auto_327 ) ) ( not ( = ?auto_325 ?auto_327 ) ) )
    :subtasks
    ( ( !LIFT ?auto_321 ?auto_320 ?auto_327 ?auto_323 )
      ( MAKE-2CRATE ?auto_325 ?auto_319 ?auto_320 )
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
      ?auto_333 - HOIST
      ?auto_331 - PLACE
      ?auto_335 - TRUCK
      ?auto_336 - PLACE
      ?auto_334 - HOIST
      ?auto_332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333 ?auto_331 ) ( SURFACE-AT ?auto_329 ?auto_331 ) ( CLEAR ?auto_329 ) ( IS-CRATE ?auto_330 ) ( not ( = ?auto_329 ?auto_330 ) ) ( AVAILABLE ?auto_333 ) ( ON ?auto_329 ?auto_328 ) ( not ( = ?auto_328 ?auto_329 ) ) ( not ( = ?auto_328 ?auto_330 ) ) ( TRUCK-AT ?auto_335 ?auto_336 ) ( not ( = ?auto_336 ?auto_331 ) ) ( HOIST-AT ?auto_334 ?auto_336 ) ( not ( = ?auto_333 ?auto_334 ) ) ( AVAILABLE ?auto_334 ) ( SURFACE-AT ?auto_330 ?auto_336 ) ( ON ?auto_330 ?auto_332 ) ( CLEAR ?auto_330 ) ( not ( = ?auto_329 ?auto_332 ) ) ( not ( = ?auto_330 ?auto_332 ) ) ( not ( = ?auto_328 ?auto_332 ) ) )
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
      ?auto_339 - HOIST
      ?auto_341 - PLACE
      ?auto_342 - SURFACE
      ?auto_345 - PLACE
      ?auto_343 - HOIST
      ?auto_340 - SURFACE
      ?auto_344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_339 ?auto_341 ) ( SURFACE-AT ?auto_337 ?auto_341 ) ( CLEAR ?auto_337 ) ( IS-CRATE ?auto_338 ) ( not ( = ?auto_337 ?auto_338 ) ) ( AVAILABLE ?auto_339 ) ( ON ?auto_337 ?auto_342 ) ( not ( = ?auto_342 ?auto_337 ) ) ( not ( = ?auto_342 ?auto_338 ) ) ( not ( = ?auto_345 ?auto_341 ) ) ( HOIST-AT ?auto_343 ?auto_345 ) ( not ( = ?auto_339 ?auto_343 ) ) ( AVAILABLE ?auto_343 ) ( SURFACE-AT ?auto_338 ?auto_345 ) ( ON ?auto_338 ?auto_340 ) ( CLEAR ?auto_338 ) ( not ( = ?auto_337 ?auto_340 ) ) ( not ( = ?auto_338 ?auto_340 ) ) ( not ( = ?auto_342 ?auto_340 ) ) ( TRUCK-AT ?auto_344 ?auto_341 ) )
    :subtasks
    ( ( !DRIVE ?auto_344 ?auto_341 ?auto_345 )
      ( MAKE-2CRATE ?auto_342 ?auto_337 ?auto_338 )
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
      ?auto_353 - HOIST
      ?auto_354 - PLACE
      ?auto_350 - PLACE
      ?auto_352 - HOIST
      ?auto_349 - SURFACE
      ?auto_351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353 ?auto_354 ) ( SURFACE-AT ?auto_347 ?auto_354 ) ( CLEAR ?auto_347 ) ( IS-CRATE ?auto_348 ) ( not ( = ?auto_347 ?auto_348 ) ) ( AVAILABLE ?auto_353 ) ( ON ?auto_347 ?auto_346 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_350 ?auto_354 ) ) ( HOIST-AT ?auto_352 ?auto_350 ) ( not ( = ?auto_353 ?auto_352 ) ) ( AVAILABLE ?auto_352 ) ( SURFACE-AT ?auto_348 ?auto_350 ) ( ON ?auto_348 ?auto_349 ) ( CLEAR ?auto_348 ) ( not ( = ?auto_347 ?auto_349 ) ) ( not ( = ?auto_348 ?auto_349 ) ) ( not ( = ?auto_346 ?auto_349 ) ) ( TRUCK-AT ?auto_351 ?auto_354 ) )
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
      ?auto_359 - HOIST
      ?auto_361 - PLACE
      ?auto_360 - SURFACE
      ?auto_357 - PLACE
      ?auto_363 - HOIST
      ?auto_362 - SURFACE
      ?auto_358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_359 ?auto_361 ) ( IS-CRATE ?auto_356 ) ( not ( = ?auto_355 ?auto_356 ) ) ( not ( = ?auto_360 ?auto_355 ) ) ( not ( = ?auto_360 ?auto_356 ) ) ( not ( = ?auto_357 ?auto_361 ) ) ( HOIST-AT ?auto_363 ?auto_357 ) ( not ( = ?auto_359 ?auto_363 ) ) ( AVAILABLE ?auto_363 ) ( SURFACE-AT ?auto_356 ?auto_357 ) ( ON ?auto_356 ?auto_362 ) ( CLEAR ?auto_356 ) ( not ( = ?auto_355 ?auto_362 ) ) ( not ( = ?auto_356 ?auto_362 ) ) ( not ( = ?auto_360 ?auto_362 ) ) ( TRUCK-AT ?auto_358 ?auto_361 ) ( SURFACE-AT ?auto_360 ?auto_361 ) ( CLEAR ?auto_360 ) ( LIFTING ?auto_359 ?auto_355 ) ( IS-CRATE ?auto_355 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_360 ?auto_355 )
      ( MAKE-2CRATE ?auto_360 ?auto_355 ?auto_356 )
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
      ?auto_367 - HOIST
      ?auto_370 - PLACE
      ?auto_368 - PLACE
      ?auto_372 - HOIST
      ?auto_369 - SURFACE
      ?auto_371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367 ?auto_370 ) ( IS-CRATE ?auto_366 ) ( not ( = ?auto_365 ?auto_366 ) ) ( not ( = ?auto_364 ?auto_365 ) ) ( not ( = ?auto_364 ?auto_366 ) ) ( not ( = ?auto_368 ?auto_370 ) ) ( HOIST-AT ?auto_372 ?auto_368 ) ( not ( = ?auto_367 ?auto_372 ) ) ( AVAILABLE ?auto_372 ) ( SURFACE-AT ?auto_366 ?auto_368 ) ( ON ?auto_366 ?auto_369 ) ( CLEAR ?auto_366 ) ( not ( = ?auto_365 ?auto_369 ) ) ( not ( = ?auto_366 ?auto_369 ) ) ( not ( = ?auto_364 ?auto_369 ) ) ( TRUCK-AT ?auto_371 ?auto_370 ) ( SURFACE-AT ?auto_364 ?auto_370 ) ( CLEAR ?auto_364 ) ( LIFTING ?auto_367 ?auto_365 ) ( IS-CRATE ?auto_365 ) )
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
      ?auto_377 - HOIST
      ?auto_375 - PLACE
      ?auto_381 - SURFACE
      ?auto_379 - PLACE
      ?auto_380 - HOIST
      ?auto_376 - SURFACE
      ?auto_378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377 ?auto_375 ) ( IS-CRATE ?auto_374 ) ( not ( = ?auto_373 ?auto_374 ) ) ( not ( = ?auto_381 ?auto_373 ) ) ( not ( = ?auto_381 ?auto_374 ) ) ( not ( = ?auto_379 ?auto_375 ) ) ( HOIST-AT ?auto_380 ?auto_379 ) ( not ( = ?auto_377 ?auto_380 ) ) ( AVAILABLE ?auto_380 ) ( SURFACE-AT ?auto_374 ?auto_379 ) ( ON ?auto_374 ?auto_376 ) ( CLEAR ?auto_374 ) ( not ( = ?auto_373 ?auto_376 ) ) ( not ( = ?auto_374 ?auto_376 ) ) ( not ( = ?auto_381 ?auto_376 ) ) ( TRUCK-AT ?auto_378 ?auto_375 ) ( SURFACE-AT ?auto_381 ?auto_375 ) ( CLEAR ?auto_381 ) ( IS-CRATE ?auto_373 ) ( AVAILABLE ?auto_377 ) ( IN ?auto_373 ?auto_378 ) )
    :subtasks
    ( ( !UNLOAD ?auto_377 ?auto_373 ?auto_378 ?auto_375 )
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
      ?auto_385 - HOIST
      ?auto_390 - PLACE
      ?auto_389 - PLACE
      ?auto_387 - HOIST
      ?auto_386 - SURFACE
      ?auto_388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_385 ?auto_390 ) ( IS-CRATE ?auto_384 ) ( not ( = ?auto_383 ?auto_384 ) ) ( not ( = ?auto_382 ?auto_383 ) ) ( not ( = ?auto_382 ?auto_384 ) ) ( not ( = ?auto_389 ?auto_390 ) ) ( HOIST-AT ?auto_387 ?auto_389 ) ( not ( = ?auto_385 ?auto_387 ) ) ( AVAILABLE ?auto_387 ) ( SURFACE-AT ?auto_384 ?auto_389 ) ( ON ?auto_384 ?auto_386 ) ( CLEAR ?auto_384 ) ( not ( = ?auto_383 ?auto_386 ) ) ( not ( = ?auto_384 ?auto_386 ) ) ( not ( = ?auto_382 ?auto_386 ) ) ( TRUCK-AT ?auto_388 ?auto_390 ) ( SURFACE-AT ?auto_382 ?auto_390 ) ( CLEAR ?auto_382 ) ( IS-CRATE ?auto_383 ) ( AVAILABLE ?auto_385 ) ( IN ?auto_383 ?auto_388 ) )
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
      ?auto_429 - HOIST
      ?auto_430 - PLACE
      ?auto_432 - SURFACE
      ?auto_434 - PLACE
      ?auto_433 - HOIST
      ?auto_431 - SURFACE
      ?auto_435 - TRUCK
      ?auto_436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_429 ?auto_430 ) ( SURFACE-AT ?auto_427 ?auto_430 ) ( CLEAR ?auto_427 ) ( IS-CRATE ?auto_428 ) ( not ( = ?auto_427 ?auto_428 ) ) ( AVAILABLE ?auto_429 ) ( ON ?auto_427 ?auto_432 ) ( not ( = ?auto_432 ?auto_427 ) ) ( not ( = ?auto_432 ?auto_428 ) ) ( not ( = ?auto_434 ?auto_430 ) ) ( HOIST-AT ?auto_433 ?auto_434 ) ( not ( = ?auto_429 ?auto_433 ) ) ( AVAILABLE ?auto_433 ) ( SURFACE-AT ?auto_428 ?auto_434 ) ( ON ?auto_428 ?auto_431 ) ( CLEAR ?auto_428 ) ( not ( = ?auto_427 ?auto_431 ) ) ( not ( = ?auto_428 ?auto_431 ) ) ( not ( = ?auto_432 ?auto_431 ) ) ( TRUCK-AT ?auto_435 ?auto_436 ) ( not ( = ?auto_436 ?auto_430 ) ) ( not ( = ?auto_434 ?auto_436 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_435 ?auto_436 ?auto_430 )
      ( MAKE-1CRATE ?auto_427 ?auto_428 )
      ( MAKE-1CRATE-VERIFY ?auto_427 ?auto_428 ) )
  )

)

