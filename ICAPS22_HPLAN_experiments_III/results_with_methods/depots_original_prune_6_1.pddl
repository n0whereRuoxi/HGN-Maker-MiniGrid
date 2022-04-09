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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33270 - SURFACE
      ?auto_33271 - SURFACE
    )
    :vars
    (
      ?auto_33272 - HOIST
      ?auto_33273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33272 ?auto_33273 ) ( SURFACE-AT ?auto_33270 ?auto_33273 ) ( CLEAR ?auto_33270 ) ( LIFTING ?auto_33272 ?auto_33271 ) ( IS-CRATE ?auto_33271 ) ( not ( = ?auto_33270 ?auto_33271 ) ) )
    :subtasks
    ( ( !DROP ?auto_33272 ?auto_33271 ?auto_33270 ?auto_33273 )
      ( MAKE-1CRATE-VERIFY ?auto_33270 ?auto_33271 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33274 - SURFACE
      ?auto_33275 - SURFACE
    )
    :vars
    (
      ?auto_33277 - HOIST
      ?auto_33276 - PLACE
      ?auto_33278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33277 ?auto_33276 ) ( SURFACE-AT ?auto_33274 ?auto_33276 ) ( CLEAR ?auto_33274 ) ( IS-CRATE ?auto_33275 ) ( not ( = ?auto_33274 ?auto_33275 ) ) ( TRUCK-AT ?auto_33278 ?auto_33276 ) ( AVAILABLE ?auto_33277 ) ( IN ?auto_33275 ?auto_33278 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33277 ?auto_33275 ?auto_33278 ?auto_33276 )
      ( MAKE-1CRATE ?auto_33274 ?auto_33275 )
      ( MAKE-1CRATE-VERIFY ?auto_33274 ?auto_33275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33279 - SURFACE
      ?auto_33280 - SURFACE
    )
    :vars
    (
      ?auto_33282 - HOIST
      ?auto_33281 - PLACE
      ?auto_33283 - TRUCK
      ?auto_33284 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33282 ?auto_33281 ) ( SURFACE-AT ?auto_33279 ?auto_33281 ) ( CLEAR ?auto_33279 ) ( IS-CRATE ?auto_33280 ) ( not ( = ?auto_33279 ?auto_33280 ) ) ( AVAILABLE ?auto_33282 ) ( IN ?auto_33280 ?auto_33283 ) ( TRUCK-AT ?auto_33283 ?auto_33284 ) ( not ( = ?auto_33284 ?auto_33281 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33283 ?auto_33284 ?auto_33281 )
      ( MAKE-1CRATE ?auto_33279 ?auto_33280 )
      ( MAKE-1CRATE-VERIFY ?auto_33279 ?auto_33280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33285 - SURFACE
      ?auto_33286 - SURFACE
    )
    :vars
    (
      ?auto_33288 - HOIST
      ?auto_33287 - PLACE
      ?auto_33290 - TRUCK
      ?auto_33289 - PLACE
      ?auto_33291 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33288 ?auto_33287 ) ( SURFACE-AT ?auto_33285 ?auto_33287 ) ( CLEAR ?auto_33285 ) ( IS-CRATE ?auto_33286 ) ( not ( = ?auto_33285 ?auto_33286 ) ) ( AVAILABLE ?auto_33288 ) ( TRUCK-AT ?auto_33290 ?auto_33289 ) ( not ( = ?auto_33289 ?auto_33287 ) ) ( HOIST-AT ?auto_33291 ?auto_33289 ) ( LIFTING ?auto_33291 ?auto_33286 ) ( not ( = ?auto_33288 ?auto_33291 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33291 ?auto_33286 ?auto_33290 ?auto_33289 )
      ( MAKE-1CRATE ?auto_33285 ?auto_33286 )
      ( MAKE-1CRATE-VERIFY ?auto_33285 ?auto_33286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33292 - SURFACE
      ?auto_33293 - SURFACE
    )
    :vars
    (
      ?auto_33296 - HOIST
      ?auto_33298 - PLACE
      ?auto_33295 - TRUCK
      ?auto_33297 - PLACE
      ?auto_33294 - HOIST
      ?auto_33299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33296 ?auto_33298 ) ( SURFACE-AT ?auto_33292 ?auto_33298 ) ( CLEAR ?auto_33292 ) ( IS-CRATE ?auto_33293 ) ( not ( = ?auto_33292 ?auto_33293 ) ) ( AVAILABLE ?auto_33296 ) ( TRUCK-AT ?auto_33295 ?auto_33297 ) ( not ( = ?auto_33297 ?auto_33298 ) ) ( HOIST-AT ?auto_33294 ?auto_33297 ) ( not ( = ?auto_33296 ?auto_33294 ) ) ( AVAILABLE ?auto_33294 ) ( SURFACE-AT ?auto_33293 ?auto_33297 ) ( ON ?auto_33293 ?auto_33299 ) ( CLEAR ?auto_33293 ) ( not ( = ?auto_33292 ?auto_33299 ) ) ( not ( = ?auto_33293 ?auto_33299 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33294 ?auto_33293 ?auto_33299 ?auto_33297 )
      ( MAKE-1CRATE ?auto_33292 ?auto_33293 )
      ( MAKE-1CRATE-VERIFY ?auto_33292 ?auto_33293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33300 - SURFACE
      ?auto_33301 - SURFACE
    )
    :vars
    (
      ?auto_33307 - HOIST
      ?auto_33302 - PLACE
      ?auto_33305 - PLACE
      ?auto_33303 - HOIST
      ?auto_33306 - SURFACE
      ?auto_33304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33307 ?auto_33302 ) ( SURFACE-AT ?auto_33300 ?auto_33302 ) ( CLEAR ?auto_33300 ) ( IS-CRATE ?auto_33301 ) ( not ( = ?auto_33300 ?auto_33301 ) ) ( AVAILABLE ?auto_33307 ) ( not ( = ?auto_33305 ?auto_33302 ) ) ( HOIST-AT ?auto_33303 ?auto_33305 ) ( not ( = ?auto_33307 ?auto_33303 ) ) ( AVAILABLE ?auto_33303 ) ( SURFACE-AT ?auto_33301 ?auto_33305 ) ( ON ?auto_33301 ?auto_33306 ) ( CLEAR ?auto_33301 ) ( not ( = ?auto_33300 ?auto_33306 ) ) ( not ( = ?auto_33301 ?auto_33306 ) ) ( TRUCK-AT ?auto_33304 ?auto_33302 ) )
    :subtasks
    ( ( !DRIVE ?auto_33304 ?auto_33302 ?auto_33305 )
      ( MAKE-1CRATE ?auto_33300 ?auto_33301 )
      ( MAKE-1CRATE-VERIFY ?auto_33300 ?auto_33301 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33317 - SURFACE
      ?auto_33318 - SURFACE
      ?auto_33319 - SURFACE
    )
    :vars
    (
      ?auto_33320 - HOIST
      ?auto_33321 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33320 ?auto_33321 ) ( SURFACE-AT ?auto_33318 ?auto_33321 ) ( CLEAR ?auto_33318 ) ( LIFTING ?auto_33320 ?auto_33319 ) ( IS-CRATE ?auto_33319 ) ( not ( = ?auto_33318 ?auto_33319 ) ) ( ON ?auto_33318 ?auto_33317 ) ( not ( = ?auto_33317 ?auto_33318 ) ) ( not ( = ?auto_33317 ?auto_33319 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33318 ?auto_33319 )
      ( MAKE-2CRATE-VERIFY ?auto_33317 ?auto_33318 ?auto_33319 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33327 - SURFACE
      ?auto_33328 - SURFACE
      ?auto_33329 - SURFACE
    )
    :vars
    (
      ?auto_33330 - HOIST
      ?auto_33331 - PLACE
      ?auto_33332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33330 ?auto_33331 ) ( SURFACE-AT ?auto_33328 ?auto_33331 ) ( CLEAR ?auto_33328 ) ( IS-CRATE ?auto_33329 ) ( not ( = ?auto_33328 ?auto_33329 ) ) ( TRUCK-AT ?auto_33332 ?auto_33331 ) ( AVAILABLE ?auto_33330 ) ( IN ?auto_33329 ?auto_33332 ) ( ON ?auto_33328 ?auto_33327 ) ( not ( = ?auto_33327 ?auto_33328 ) ) ( not ( = ?auto_33327 ?auto_33329 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33328 ?auto_33329 )
      ( MAKE-2CRATE-VERIFY ?auto_33327 ?auto_33328 ?auto_33329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33333 - SURFACE
      ?auto_33334 - SURFACE
    )
    :vars
    (
      ?auto_33336 - HOIST
      ?auto_33338 - PLACE
      ?auto_33335 - TRUCK
      ?auto_33337 - SURFACE
      ?auto_33339 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33336 ?auto_33338 ) ( SURFACE-AT ?auto_33333 ?auto_33338 ) ( CLEAR ?auto_33333 ) ( IS-CRATE ?auto_33334 ) ( not ( = ?auto_33333 ?auto_33334 ) ) ( AVAILABLE ?auto_33336 ) ( IN ?auto_33334 ?auto_33335 ) ( ON ?auto_33333 ?auto_33337 ) ( not ( = ?auto_33337 ?auto_33333 ) ) ( not ( = ?auto_33337 ?auto_33334 ) ) ( TRUCK-AT ?auto_33335 ?auto_33339 ) ( not ( = ?auto_33339 ?auto_33338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33335 ?auto_33339 ?auto_33338 )
      ( MAKE-2CRATE ?auto_33337 ?auto_33333 ?auto_33334 )
      ( MAKE-1CRATE-VERIFY ?auto_33333 ?auto_33334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33340 - SURFACE
      ?auto_33341 - SURFACE
      ?auto_33342 - SURFACE
    )
    :vars
    (
      ?auto_33344 - HOIST
      ?auto_33343 - PLACE
      ?auto_33346 - TRUCK
      ?auto_33345 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33344 ?auto_33343 ) ( SURFACE-AT ?auto_33341 ?auto_33343 ) ( CLEAR ?auto_33341 ) ( IS-CRATE ?auto_33342 ) ( not ( = ?auto_33341 ?auto_33342 ) ) ( AVAILABLE ?auto_33344 ) ( IN ?auto_33342 ?auto_33346 ) ( ON ?auto_33341 ?auto_33340 ) ( not ( = ?auto_33340 ?auto_33341 ) ) ( not ( = ?auto_33340 ?auto_33342 ) ) ( TRUCK-AT ?auto_33346 ?auto_33345 ) ( not ( = ?auto_33345 ?auto_33343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33341 ?auto_33342 )
      ( MAKE-2CRATE-VERIFY ?auto_33340 ?auto_33341 ?auto_33342 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33347 - SURFACE
      ?auto_33348 - SURFACE
    )
    :vars
    (
      ?auto_33351 - HOIST
      ?auto_33353 - PLACE
      ?auto_33352 - SURFACE
      ?auto_33350 - TRUCK
      ?auto_33349 - PLACE
      ?auto_33354 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33351 ?auto_33353 ) ( SURFACE-AT ?auto_33347 ?auto_33353 ) ( CLEAR ?auto_33347 ) ( IS-CRATE ?auto_33348 ) ( not ( = ?auto_33347 ?auto_33348 ) ) ( AVAILABLE ?auto_33351 ) ( ON ?auto_33347 ?auto_33352 ) ( not ( = ?auto_33352 ?auto_33347 ) ) ( not ( = ?auto_33352 ?auto_33348 ) ) ( TRUCK-AT ?auto_33350 ?auto_33349 ) ( not ( = ?auto_33349 ?auto_33353 ) ) ( HOIST-AT ?auto_33354 ?auto_33349 ) ( LIFTING ?auto_33354 ?auto_33348 ) ( not ( = ?auto_33351 ?auto_33354 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33354 ?auto_33348 ?auto_33350 ?auto_33349 )
      ( MAKE-2CRATE ?auto_33352 ?auto_33347 ?auto_33348 )
      ( MAKE-1CRATE-VERIFY ?auto_33347 ?auto_33348 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33355 - SURFACE
      ?auto_33356 - SURFACE
      ?auto_33357 - SURFACE
    )
    :vars
    (
      ?auto_33362 - HOIST
      ?auto_33359 - PLACE
      ?auto_33358 - TRUCK
      ?auto_33360 - PLACE
      ?auto_33361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33362 ?auto_33359 ) ( SURFACE-AT ?auto_33356 ?auto_33359 ) ( CLEAR ?auto_33356 ) ( IS-CRATE ?auto_33357 ) ( not ( = ?auto_33356 ?auto_33357 ) ) ( AVAILABLE ?auto_33362 ) ( ON ?auto_33356 ?auto_33355 ) ( not ( = ?auto_33355 ?auto_33356 ) ) ( not ( = ?auto_33355 ?auto_33357 ) ) ( TRUCK-AT ?auto_33358 ?auto_33360 ) ( not ( = ?auto_33360 ?auto_33359 ) ) ( HOIST-AT ?auto_33361 ?auto_33360 ) ( LIFTING ?auto_33361 ?auto_33357 ) ( not ( = ?auto_33362 ?auto_33361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33356 ?auto_33357 )
      ( MAKE-2CRATE-VERIFY ?auto_33355 ?auto_33356 ?auto_33357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33363 - SURFACE
      ?auto_33364 - SURFACE
    )
    :vars
    (
      ?auto_33367 - HOIST
      ?auto_33368 - PLACE
      ?auto_33365 - SURFACE
      ?auto_33369 - TRUCK
      ?auto_33366 - PLACE
      ?auto_33370 - HOIST
      ?auto_33371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33367 ?auto_33368 ) ( SURFACE-AT ?auto_33363 ?auto_33368 ) ( CLEAR ?auto_33363 ) ( IS-CRATE ?auto_33364 ) ( not ( = ?auto_33363 ?auto_33364 ) ) ( AVAILABLE ?auto_33367 ) ( ON ?auto_33363 ?auto_33365 ) ( not ( = ?auto_33365 ?auto_33363 ) ) ( not ( = ?auto_33365 ?auto_33364 ) ) ( TRUCK-AT ?auto_33369 ?auto_33366 ) ( not ( = ?auto_33366 ?auto_33368 ) ) ( HOIST-AT ?auto_33370 ?auto_33366 ) ( not ( = ?auto_33367 ?auto_33370 ) ) ( AVAILABLE ?auto_33370 ) ( SURFACE-AT ?auto_33364 ?auto_33366 ) ( ON ?auto_33364 ?auto_33371 ) ( CLEAR ?auto_33364 ) ( not ( = ?auto_33363 ?auto_33371 ) ) ( not ( = ?auto_33364 ?auto_33371 ) ) ( not ( = ?auto_33365 ?auto_33371 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33370 ?auto_33364 ?auto_33371 ?auto_33366 )
      ( MAKE-2CRATE ?auto_33365 ?auto_33363 ?auto_33364 )
      ( MAKE-1CRATE-VERIFY ?auto_33363 ?auto_33364 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33372 - SURFACE
      ?auto_33373 - SURFACE
      ?auto_33374 - SURFACE
    )
    :vars
    (
      ?auto_33377 - HOIST
      ?auto_33380 - PLACE
      ?auto_33375 - TRUCK
      ?auto_33379 - PLACE
      ?auto_33376 - HOIST
      ?auto_33378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33377 ?auto_33380 ) ( SURFACE-AT ?auto_33373 ?auto_33380 ) ( CLEAR ?auto_33373 ) ( IS-CRATE ?auto_33374 ) ( not ( = ?auto_33373 ?auto_33374 ) ) ( AVAILABLE ?auto_33377 ) ( ON ?auto_33373 ?auto_33372 ) ( not ( = ?auto_33372 ?auto_33373 ) ) ( not ( = ?auto_33372 ?auto_33374 ) ) ( TRUCK-AT ?auto_33375 ?auto_33379 ) ( not ( = ?auto_33379 ?auto_33380 ) ) ( HOIST-AT ?auto_33376 ?auto_33379 ) ( not ( = ?auto_33377 ?auto_33376 ) ) ( AVAILABLE ?auto_33376 ) ( SURFACE-AT ?auto_33374 ?auto_33379 ) ( ON ?auto_33374 ?auto_33378 ) ( CLEAR ?auto_33374 ) ( not ( = ?auto_33373 ?auto_33378 ) ) ( not ( = ?auto_33374 ?auto_33378 ) ) ( not ( = ?auto_33372 ?auto_33378 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33373 ?auto_33374 )
      ( MAKE-2CRATE-VERIFY ?auto_33372 ?auto_33373 ?auto_33374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33381 - SURFACE
      ?auto_33382 - SURFACE
    )
    :vars
    (
      ?auto_33386 - HOIST
      ?auto_33388 - PLACE
      ?auto_33387 - SURFACE
      ?auto_33385 - PLACE
      ?auto_33383 - HOIST
      ?auto_33389 - SURFACE
      ?auto_33384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33386 ?auto_33388 ) ( SURFACE-AT ?auto_33381 ?auto_33388 ) ( CLEAR ?auto_33381 ) ( IS-CRATE ?auto_33382 ) ( not ( = ?auto_33381 ?auto_33382 ) ) ( AVAILABLE ?auto_33386 ) ( ON ?auto_33381 ?auto_33387 ) ( not ( = ?auto_33387 ?auto_33381 ) ) ( not ( = ?auto_33387 ?auto_33382 ) ) ( not ( = ?auto_33385 ?auto_33388 ) ) ( HOIST-AT ?auto_33383 ?auto_33385 ) ( not ( = ?auto_33386 ?auto_33383 ) ) ( AVAILABLE ?auto_33383 ) ( SURFACE-AT ?auto_33382 ?auto_33385 ) ( ON ?auto_33382 ?auto_33389 ) ( CLEAR ?auto_33382 ) ( not ( = ?auto_33381 ?auto_33389 ) ) ( not ( = ?auto_33382 ?auto_33389 ) ) ( not ( = ?auto_33387 ?auto_33389 ) ) ( TRUCK-AT ?auto_33384 ?auto_33388 ) )
    :subtasks
    ( ( !DRIVE ?auto_33384 ?auto_33388 ?auto_33385 )
      ( MAKE-2CRATE ?auto_33387 ?auto_33381 ?auto_33382 )
      ( MAKE-1CRATE-VERIFY ?auto_33381 ?auto_33382 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33390 - SURFACE
      ?auto_33391 - SURFACE
      ?auto_33392 - SURFACE
    )
    :vars
    (
      ?auto_33393 - HOIST
      ?auto_33396 - PLACE
      ?auto_33395 - PLACE
      ?auto_33394 - HOIST
      ?auto_33398 - SURFACE
      ?auto_33397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33393 ?auto_33396 ) ( SURFACE-AT ?auto_33391 ?auto_33396 ) ( CLEAR ?auto_33391 ) ( IS-CRATE ?auto_33392 ) ( not ( = ?auto_33391 ?auto_33392 ) ) ( AVAILABLE ?auto_33393 ) ( ON ?auto_33391 ?auto_33390 ) ( not ( = ?auto_33390 ?auto_33391 ) ) ( not ( = ?auto_33390 ?auto_33392 ) ) ( not ( = ?auto_33395 ?auto_33396 ) ) ( HOIST-AT ?auto_33394 ?auto_33395 ) ( not ( = ?auto_33393 ?auto_33394 ) ) ( AVAILABLE ?auto_33394 ) ( SURFACE-AT ?auto_33392 ?auto_33395 ) ( ON ?auto_33392 ?auto_33398 ) ( CLEAR ?auto_33392 ) ( not ( = ?auto_33391 ?auto_33398 ) ) ( not ( = ?auto_33392 ?auto_33398 ) ) ( not ( = ?auto_33390 ?auto_33398 ) ) ( TRUCK-AT ?auto_33397 ?auto_33396 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33391 ?auto_33392 )
      ( MAKE-2CRATE-VERIFY ?auto_33390 ?auto_33391 ?auto_33392 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33399 - SURFACE
      ?auto_33400 - SURFACE
    )
    :vars
    (
      ?auto_33402 - HOIST
      ?auto_33401 - PLACE
      ?auto_33407 - SURFACE
      ?auto_33405 - PLACE
      ?auto_33404 - HOIST
      ?auto_33406 - SURFACE
      ?auto_33403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33402 ?auto_33401 ) ( IS-CRATE ?auto_33400 ) ( not ( = ?auto_33399 ?auto_33400 ) ) ( not ( = ?auto_33407 ?auto_33399 ) ) ( not ( = ?auto_33407 ?auto_33400 ) ) ( not ( = ?auto_33405 ?auto_33401 ) ) ( HOIST-AT ?auto_33404 ?auto_33405 ) ( not ( = ?auto_33402 ?auto_33404 ) ) ( AVAILABLE ?auto_33404 ) ( SURFACE-AT ?auto_33400 ?auto_33405 ) ( ON ?auto_33400 ?auto_33406 ) ( CLEAR ?auto_33400 ) ( not ( = ?auto_33399 ?auto_33406 ) ) ( not ( = ?auto_33400 ?auto_33406 ) ) ( not ( = ?auto_33407 ?auto_33406 ) ) ( TRUCK-AT ?auto_33403 ?auto_33401 ) ( SURFACE-AT ?auto_33407 ?auto_33401 ) ( CLEAR ?auto_33407 ) ( LIFTING ?auto_33402 ?auto_33399 ) ( IS-CRATE ?auto_33399 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33407 ?auto_33399 )
      ( MAKE-2CRATE ?auto_33407 ?auto_33399 ?auto_33400 )
      ( MAKE-1CRATE-VERIFY ?auto_33399 ?auto_33400 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33408 - SURFACE
      ?auto_33409 - SURFACE
      ?auto_33410 - SURFACE
    )
    :vars
    (
      ?auto_33413 - HOIST
      ?auto_33415 - PLACE
      ?auto_33414 - PLACE
      ?auto_33416 - HOIST
      ?auto_33411 - SURFACE
      ?auto_33412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33413 ?auto_33415 ) ( IS-CRATE ?auto_33410 ) ( not ( = ?auto_33409 ?auto_33410 ) ) ( not ( = ?auto_33408 ?auto_33409 ) ) ( not ( = ?auto_33408 ?auto_33410 ) ) ( not ( = ?auto_33414 ?auto_33415 ) ) ( HOIST-AT ?auto_33416 ?auto_33414 ) ( not ( = ?auto_33413 ?auto_33416 ) ) ( AVAILABLE ?auto_33416 ) ( SURFACE-AT ?auto_33410 ?auto_33414 ) ( ON ?auto_33410 ?auto_33411 ) ( CLEAR ?auto_33410 ) ( not ( = ?auto_33409 ?auto_33411 ) ) ( not ( = ?auto_33410 ?auto_33411 ) ) ( not ( = ?auto_33408 ?auto_33411 ) ) ( TRUCK-AT ?auto_33412 ?auto_33415 ) ( SURFACE-AT ?auto_33408 ?auto_33415 ) ( CLEAR ?auto_33408 ) ( LIFTING ?auto_33413 ?auto_33409 ) ( IS-CRATE ?auto_33409 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33409 ?auto_33410 )
      ( MAKE-2CRATE-VERIFY ?auto_33408 ?auto_33409 ?auto_33410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33417 - SURFACE
      ?auto_33418 - SURFACE
    )
    :vars
    (
      ?auto_33423 - HOIST
      ?auto_33425 - PLACE
      ?auto_33422 - SURFACE
      ?auto_33420 - PLACE
      ?auto_33421 - HOIST
      ?auto_33419 - SURFACE
      ?auto_33424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33423 ?auto_33425 ) ( IS-CRATE ?auto_33418 ) ( not ( = ?auto_33417 ?auto_33418 ) ) ( not ( = ?auto_33422 ?auto_33417 ) ) ( not ( = ?auto_33422 ?auto_33418 ) ) ( not ( = ?auto_33420 ?auto_33425 ) ) ( HOIST-AT ?auto_33421 ?auto_33420 ) ( not ( = ?auto_33423 ?auto_33421 ) ) ( AVAILABLE ?auto_33421 ) ( SURFACE-AT ?auto_33418 ?auto_33420 ) ( ON ?auto_33418 ?auto_33419 ) ( CLEAR ?auto_33418 ) ( not ( = ?auto_33417 ?auto_33419 ) ) ( not ( = ?auto_33418 ?auto_33419 ) ) ( not ( = ?auto_33422 ?auto_33419 ) ) ( TRUCK-AT ?auto_33424 ?auto_33425 ) ( SURFACE-AT ?auto_33422 ?auto_33425 ) ( CLEAR ?auto_33422 ) ( IS-CRATE ?auto_33417 ) ( AVAILABLE ?auto_33423 ) ( IN ?auto_33417 ?auto_33424 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33423 ?auto_33417 ?auto_33424 ?auto_33425 )
      ( MAKE-2CRATE ?auto_33422 ?auto_33417 ?auto_33418 )
      ( MAKE-1CRATE-VERIFY ?auto_33417 ?auto_33418 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33426 - SURFACE
      ?auto_33427 - SURFACE
      ?auto_33428 - SURFACE
    )
    :vars
    (
      ?auto_33429 - HOIST
      ?auto_33434 - PLACE
      ?auto_33432 - PLACE
      ?auto_33431 - HOIST
      ?auto_33430 - SURFACE
      ?auto_33433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33429 ?auto_33434 ) ( IS-CRATE ?auto_33428 ) ( not ( = ?auto_33427 ?auto_33428 ) ) ( not ( = ?auto_33426 ?auto_33427 ) ) ( not ( = ?auto_33426 ?auto_33428 ) ) ( not ( = ?auto_33432 ?auto_33434 ) ) ( HOIST-AT ?auto_33431 ?auto_33432 ) ( not ( = ?auto_33429 ?auto_33431 ) ) ( AVAILABLE ?auto_33431 ) ( SURFACE-AT ?auto_33428 ?auto_33432 ) ( ON ?auto_33428 ?auto_33430 ) ( CLEAR ?auto_33428 ) ( not ( = ?auto_33427 ?auto_33430 ) ) ( not ( = ?auto_33428 ?auto_33430 ) ) ( not ( = ?auto_33426 ?auto_33430 ) ) ( TRUCK-AT ?auto_33433 ?auto_33434 ) ( SURFACE-AT ?auto_33426 ?auto_33434 ) ( CLEAR ?auto_33426 ) ( IS-CRATE ?auto_33427 ) ( AVAILABLE ?auto_33429 ) ( IN ?auto_33427 ?auto_33433 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33427 ?auto_33428 )
      ( MAKE-2CRATE-VERIFY ?auto_33426 ?auto_33427 ?auto_33428 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33471 - SURFACE
      ?auto_33472 - SURFACE
    )
    :vars
    (
      ?auto_33477 - HOIST
      ?auto_33476 - PLACE
      ?auto_33473 - SURFACE
      ?auto_33479 - PLACE
      ?auto_33478 - HOIST
      ?auto_33475 - SURFACE
      ?auto_33474 - TRUCK
      ?auto_33480 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33477 ?auto_33476 ) ( SURFACE-AT ?auto_33471 ?auto_33476 ) ( CLEAR ?auto_33471 ) ( IS-CRATE ?auto_33472 ) ( not ( = ?auto_33471 ?auto_33472 ) ) ( AVAILABLE ?auto_33477 ) ( ON ?auto_33471 ?auto_33473 ) ( not ( = ?auto_33473 ?auto_33471 ) ) ( not ( = ?auto_33473 ?auto_33472 ) ) ( not ( = ?auto_33479 ?auto_33476 ) ) ( HOIST-AT ?auto_33478 ?auto_33479 ) ( not ( = ?auto_33477 ?auto_33478 ) ) ( AVAILABLE ?auto_33478 ) ( SURFACE-AT ?auto_33472 ?auto_33479 ) ( ON ?auto_33472 ?auto_33475 ) ( CLEAR ?auto_33472 ) ( not ( = ?auto_33471 ?auto_33475 ) ) ( not ( = ?auto_33472 ?auto_33475 ) ) ( not ( = ?auto_33473 ?auto_33475 ) ) ( TRUCK-AT ?auto_33474 ?auto_33480 ) ( not ( = ?auto_33480 ?auto_33476 ) ) ( not ( = ?auto_33479 ?auto_33480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33474 ?auto_33480 ?auto_33476 )
      ( MAKE-1CRATE ?auto_33471 ?auto_33472 )
      ( MAKE-1CRATE-VERIFY ?auto_33471 ?auto_33472 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33510 - SURFACE
      ?auto_33511 - SURFACE
      ?auto_33512 - SURFACE
      ?auto_33513 - SURFACE
    )
    :vars
    (
      ?auto_33514 - HOIST
      ?auto_33515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33514 ?auto_33515 ) ( SURFACE-AT ?auto_33512 ?auto_33515 ) ( CLEAR ?auto_33512 ) ( LIFTING ?auto_33514 ?auto_33513 ) ( IS-CRATE ?auto_33513 ) ( not ( = ?auto_33512 ?auto_33513 ) ) ( ON ?auto_33511 ?auto_33510 ) ( ON ?auto_33512 ?auto_33511 ) ( not ( = ?auto_33510 ?auto_33511 ) ) ( not ( = ?auto_33510 ?auto_33512 ) ) ( not ( = ?auto_33510 ?auto_33513 ) ) ( not ( = ?auto_33511 ?auto_33512 ) ) ( not ( = ?auto_33511 ?auto_33513 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33512 ?auto_33513 )
      ( MAKE-3CRATE-VERIFY ?auto_33510 ?auto_33511 ?auto_33512 ?auto_33513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33527 - SURFACE
      ?auto_33528 - SURFACE
      ?auto_33529 - SURFACE
      ?auto_33530 - SURFACE
    )
    :vars
    (
      ?auto_33532 - HOIST
      ?auto_33533 - PLACE
      ?auto_33531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33532 ?auto_33533 ) ( SURFACE-AT ?auto_33529 ?auto_33533 ) ( CLEAR ?auto_33529 ) ( IS-CRATE ?auto_33530 ) ( not ( = ?auto_33529 ?auto_33530 ) ) ( TRUCK-AT ?auto_33531 ?auto_33533 ) ( AVAILABLE ?auto_33532 ) ( IN ?auto_33530 ?auto_33531 ) ( ON ?auto_33529 ?auto_33528 ) ( not ( = ?auto_33528 ?auto_33529 ) ) ( not ( = ?auto_33528 ?auto_33530 ) ) ( ON ?auto_33528 ?auto_33527 ) ( not ( = ?auto_33527 ?auto_33528 ) ) ( not ( = ?auto_33527 ?auto_33529 ) ) ( not ( = ?auto_33527 ?auto_33530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33528 ?auto_33529 ?auto_33530 )
      ( MAKE-3CRATE-VERIFY ?auto_33527 ?auto_33528 ?auto_33529 ?auto_33530 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33548 - SURFACE
      ?auto_33549 - SURFACE
      ?auto_33550 - SURFACE
      ?auto_33551 - SURFACE
    )
    :vars
    (
      ?auto_33554 - HOIST
      ?auto_33555 - PLACE
      ?auto_33552 - TRUCK
      ?auto_33553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33554 ?auto_33555 ) ( SURFACE-AT ?auto_33550 ?auto_33555 ) ( CLEAR ?auto_33550 ) ( IS-CRATE ?auto_33551 ) ( not ( = ?auto_33550 ?auto_33551 ) ) ( AVAILABLE ?auto_33554 ) ( IN ?auto_33551 ?auto_33552 ) ( ON ?auto_33550 ?auto_33549 ) ( not ( = ?auto_33549 ?auto_33550 ) ) ( not ( = ?auto_33549 ?auto_33551 ) ) ( TRUCK-AT ?auto_33552 ?auto_33553 ) ( not ( = ?auto_33553 ?auto_33555 ) ) ( ON ?auto_33549 ?auto_33548 ) ( not ( = ?auto_33548 ?auto_33549 ) ) ( not ( = ?auto_33548 ?auto_33550 ) ) ( not ( = ?auto_33548 ?auto_33551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33549 ?auto_33550 ?auto_33551 )
      ( MAKE-3CRATE-VERIFY ?auto_33548 ?auto_33549 ?auto_33550 ?auto_33551 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33572 - SURFACE
      ?auto_33573 - SURFACE
      ?auto_33574 - SURFACE
      ?auto_33575 - SURFACE
    )
    :vars
    (
      ?auto_33576 - HOIST
      ?auto_33580 - PLACE
      ?auto_33578 - TRUCK
      ?auto_33579 - PLACE
      ?auto_33577 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33576 ?auto_33580 ) ( SURFACE-AT ?auto_33574 ?auto_33580 ) ( CLEAR ?auto_33574 ) ( IS-CRATE ?auto_33575 ) ( not ( = ?auto_33574 ?auto_33575 ) ) ( AVAILABLE ?auto_33576 ) ( ON ?auto_33574 ?auto_33573 ) ( not ( = ?auto_33573 ?auto_33574 ) ) ( not ( = ?auto_33573 ?auto_33575 ) ) ( TRUCK-AT ?auto_33578 ?auto_33579 ) ( not ( = ?auto_33579 ?auto_33580 ) ) ( HOIST-AT ?auto_33577 ?auto_33579 ) ( LIFTING ?auto_33577 ?auto_33575 ) ( not ( = ?auto_33576 ?auto_33577 ) ) ( ON ?auto_33573 ?auto_33572 ) ( not ( = ?auto_33572 ?auto_33573 ) ) ( not ( = ?auto_33572 ?auto_33574 ) ) ( not ( = ?auto_33572 ?auto_33575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33573 ?auto_33574 ?auto_33575 )
      ( MAKE-3CRATE-VERIFY ?auto_33572 ?auto_33573 ?auto_33574 ?auto_33575 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33599 - SURFACE
      ?auto_33600 - SURFACE
      ?auto_33601 - SURFACE
      ?auto_33602 - SURFACE
    )
    :vars
    (
      ?auto_33604 - HOIST
      ?auto_33607 - PLACE
      ?auto_33606 - TRUCK
      ?auto_33605 - PLACE
      ?auto_33603 - HOIST
      ?auto_33608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33604 ?auto_33607 ) ( SURFACE-AT ?auto_33601 ?auto_33607 ) ( CLEAR ?auto_33601 ) ( IS-CRATE ?auto_33602 ) ( not ( = ?auto_33601 ?auto_33602 ) ) ( AVAILABLE ?auto_33604 ) ( ON ?auto_33601 ?auto_33600 ) ( not ( = ?auto_33600 ?auto_33601 ) ) ( not ( = ?auto_33600 ?auto_33602 ) ) ( TRUCK-AT ?auto_33606 ?auto_33605 ) ( not ( = ?auto_33605 ?auto_33607 ) ) ( HOIST-AT ?auto_33603 ?auto_33605 ) ( not ( = ?auto_33604 ?auto_33603 ) ) ( AVAILABLE ?auto_33603 ) ( SURFACE-AT ?auto_33602 ?auto_33605 ) ( ON ?auto_33602 ?auto_33608 ) ( CLEAR ?auto_33602 ) ( not ( = ?auto_33601 ?auto_33608 ) ) ( not ( = ?auto_33602 ?auto_33608 ) ) ( not ( = ?auto_33600 ?auto_33608 ) ) ( ON ?auto_33600 ?auto_33599 ) ( not ( = ?auto_33599 ?auto_33600 ) ) ( not ( = ?auto_33599 ?auto_33601 ) ) ( not ( = ?auto_33599 ?auto_33602 ) ) ( not ( = ?auto_33599 ?auto_33608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33600 ?auto_33601 ?auto_33602 )
      ( MAKE-3CRATE-VERIFY ?auto_33599 ?auto_33600 ?auto_33601 ?auto_33602 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33627 - SURFACE
      ?auto_33628 - SURFACE
      ?auto_33629 - SURFACE
      ?auto_33630 - SURFACE
    )
    :vars
    (
      ?auto_33636 - HOIST
      ?auto_33632 - PLACE
      ?auto_33635 - PLACE
      ?auto_33633 - HOIST
      ?auto_33634 - SURFACE
      ?auto_33631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33636 ?auto_33632 ) ( SURFACE-AT ?auto_33629 ?auto_33632 ) ( CLEAR ?auto_33629 ) ( IS-CRATE ?auto_33630 ) ( not ( = ?auto_33629 ?auto_33630 ) ) ( AVAILABLE ?auto_33636 ) ( ON ?auto_33629 ?auto_33628 ) ( not ( = ?auto_33628 ?auto_33629 ) ) ( not ( = ?auto_33628 ?auto_33630 ) ) ( not ( = ?auto_33635 ?auto_33632 ) ) ( HOIST-AT ?auto_33633 ?auto_33635 ) ( not ( = ?auto_33636 ?auto_33633 ) ) ( AVAILABLE ?auto_33633 ) ( SURFACE-AT ?auto_33630 ?auto_33635 ) ( ON ?auto_33630 ?auto_33634 ) ( CLEAR ?auto_33630 ) ( not ( = ?auto_33629 ?auto_33634 ) ) ( not ( = ?auto_33630 ?auto_33634 ) ) ( not ( = ?auto_33628 ?auto_33634 ) ) ( TRUCK-AT ?auto_33631 ?auto_33632 ) ( ON ?auto_33628 ?auto_33627 ) ( not ( = ?auto_33627 ?auto_33628 ) ) ( not ( = ?auto_33627 ?auto_33629 ) ) ( not ( = ?auto_33627 ?auto_33630 ) ) ( not ( = ?auto_33627 ?auto_33634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33628 ?auto_33629 ?auto_33630 )
      ( MAKE-3CRATE-VERIFY ?auto_33627 ?auto_33628 ?auto_33629 ?auto_33630 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33655 - SURFACE
      ?auto_33656 - SURFACE
      ?auto_33657 - SURFACE
      ?auto_33658 - SURFACE
    )
    :vars
    (
      ?auto_33664 - HOIST
      ?auto_33662 - PLACE
      ?auto_33660 - PLACE
      ?auto_33659 - HOIST
      ?auto_33663 - SURFACE
      ?auto_33661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33664 ?auto_33662 ) ( IS-CRATE ?auto_33658 ) ( not ( = ?auto_33657 ?auto_33658 ) ) ( not ( = ?auto_33656 ?auto_33657 ) ) ( not ( = ?auto_33656 ?auto_33658 ) ) ( not ( = ?auto_33660 ?auto_33662 ) ) ( HOIST-AT ?auto_33659 ?auto_33660 ) ( not ( = ?auto_33664 ?auto_33659 ) ) ( AVAILABLE ?auto_33659 ) ( SURFACE-AT ?auto_33658 ?auto_33660 ) ( ON ?auto_33658 ?auto_33663 ) ( CLEAR ?auto_33658 ) ( not ( = ?auto_33657 ?auto_33663 ) ) ( not ( = ?auto_33658 ?auto_33663 ) ) ( not ( = ?auto_33656 ?auto_33663 ) ) ( TRUCK-AT ?auto_33661 ?auto_33662 ) ( SURFACE-AT ?auto_33656 ?auto_33662 ) ( CLEAR ?auto_33656 ) ( LIFTING ?auto_33664 ?auto_33657 ) ( IS-CRATE ?auto_33657 ) ( ON ?auto_33656 ?auto_33655 ) ( not ( = ?auto_33655 ?auto_33656 ) ) ( not ( = ?auto_33655 ?auto_33657 ) ) ( not ( = ?auto_33655 ?auto_33658 ) ) ( not ( = ?auto_33655 ?auto_33663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33656 ?auto_33657 ?auto_33658 )
      ( MAKE-3CRATE-VERIFY ?auto_33655 ?auto_33656 ?auto_33657 ?auto_33658 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33683 - SURFACE
      ?auto_33684 - SURFACE
      ?auto_33685 - SURFACE
      ?auto_33686 - SURFACE
    )
    :vars
    (
      ?auto_33687 - HOIST
      ?auto_33688 - PLACE
      ?auto_33689 - PLACE
      ?auto_33691 - HOIST
      ?auto_33692 - SURFACE
      ?auto_33690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33687 ?auto_33688 ) ( IS-CRATE ?auto_33686 ) ( not ( = ?auto_33685 ?auto_33686 ) ) ( not ( = ?auto_33684 ?auto_33685 ) ) ( not ( = ?auto_33684 ?auto_33686 ) ) ( not ( = ?auto_33689 ?auto_33688 ) ) ( HOIST-AT ?auto_33691 ?auto_33689 ) ( not ( = ?auto_33687 ?auto_33691 ) ) ( AVAILABLE ?auto_33691 ) ( SURFACE-AT ?auto_33686 ?auto_33689 ) ( ON ?auto_33686 ?auto_33692 ) ( CLEAR ?auto_33686 ) ( not ( = ?auto_33685 ?auto_33692 ) ) ( not ( = ?auto_33686 ?auto_33692 ) ) ( not ( = ?auto_33684 ?auto_33692 ) ) ( TRUCK-AT ?auto_33690 ?auto_33688 ) ( SURFACE-AT ?auto_33684 ?auto_33688 ) ( CLEAR ?auto_33684 ) ( IS-CRATE ?auto_33685 ) ( AVAILABLE ?auto_33687 ) ( IN ?auto_33685 ?auto_33690 ) ( ON ?auto_33684 ?auto_33683 ) ( not ( = ?auto_33683 ?auto_33684 ) ) ( not ( = ?auto_33683 ?auto_33685 ) ) ( not ( = ?auto_33683 ?auto_33686 ) ) ( not ( = ?auto_33683 ?auto_33692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33684 ?auto_33685 ?auto_33686 )
      ( MAKE-3CRATE-VERIFY ?auto_33683 ?auto_33684 ?auto_33685 ?auto_33686 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33974 - SURFACE
      ?auto_33975 - SURFACE
      ?auto_33976 - SURFACE
      ?auto_33977 - SURFACE
      ?auto_33978 - SURFACE
    )
    :vars
    (
      ?auto_33979 - HOIST
      ?auto_33980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33979 ?auto_33980 ) ( SURFACE-AT ?auto_33977 ?auto_33980 ) ( CLEAR ?auto_33977 ) ( LIFTING ?auto_33979 ?auto_33978 ) ( IS-CRATE ?auto_33978 ) ( not ( = ?auto_33977 ?auto_33978 ) ) ( ON ?auto_33975 ?auto_33974 ) ( ON ?auto_33976 ?auto_33975 ) ( ON ?auto_33977 ?auto_33976 ) ( not ( = ?auto_33974 ?auto_33975 ) ) ( not ( = ?auto_33974 ?auto_33976 ) ) ( not ( = ?auto_33974 ?auto_33977 ) ) ( not ( = ?auto_33974 ?auto_33978 ) ) ( not ( = ?auto_33975 ?auto_33976 ) ) ( not ( = ?auto_33975 ?auto_33977 ) ) ( not ( = ?auto_33975 ?auto_33978 ) ) ( not ( = ?auto_33976 ?auto_33977 ) ) ( not ( = ?auto_33976 ?auto_33978 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33977 ?auto_33978 )
      ( MAKE-4CRATE-VERIFY ?auto_33974 ?auto_33975 ?auto_33976 ?auto_33977 ?auto_33978 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33999 - SURFACE
      ?auto_34000 - SURFACE
      ?auto_34001 - SURFACE
      ?auto_34002 - SURFACE
      ?auto_34003 - SURFACE
    )
    :vars
    (
      ?auto_34006 - HOIST
      ?auto_34004 - PLACE
      ?auto_34005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34006 ?auto_34004 ) ( SURFACE-AT ?auto_34002 ?auto_34004 ) ( CLEAR ?auto_34002 ) ( IS-CRATE ?auto_34003 ) ( not ( = ?auto_34002 ?auto_34003 ) ) ( TRUCK-AT ?auto_34005 ?auto_34004 ) ( AVAILABLE ?auto_34006 ) ( IN ?auto_34003 ?auto_34005 ) ( ON ?auto_34002 ?auto_34001 ) ( not ( = ?auto_34001 ?auto_34002 ) ) ( not ( = ?auto_34001 ?auto_34003 ) ) ( ON ?auto_34000 ?auto_33999 ) ( ON ?auto_34001 ?auto_34000 ) ( not ( = ?auto_33999 ?auto_34000 ) ) ( not ( = ?auto_33999 ?auto_34001 ) ) ( not ( = ?auto_33999 ?auto_34002 ) ) ( not ( = ?auto_33999 ?auto_34003 ) ) ( not ( = ?auto_34000 ?auto_34001 ) ) ( not ( = ?auto_34000 ?auto_34002 ) ) ( not ( = ?auto_34000 ?auto_34003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34001 ?auto_34002 ?auto_34003 )
      ( MAKE-4CRATE-VERIFY ?auto_33999 ?auto_34000 ?auto_34001 ?auto_34002 ?auto_34003 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34029 - SURFACE
      ?auto_34030 - SURFACE
      ?auto_34031 - SURFACE
      ?auto_34032 - SURFACE
      ?auto_34033 - SURFACE
    )
    :vars
    (
      ?auto_34036 - HOIST
      ?auto_34035 - PLACE
      ?auto_34034 - TRUCK
      ?auto_34037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34036 ?auto_34035 ) ( SURFACE-AT ?auto_34032 ?auto_34035 ) ( CLEAR ?auto_34032 ) ( IS-CRATE ?auto_34033 ) ( not ( = ?auto_34032 ?auto_34033 ) ) ( AVAILABLE ?auto_34036 ) ( IN ?auto_34033 ?auto_34034 ) ( ON ?auto_34032 ?auto_34031 ) ( not ( = ?auto_34031 ?auto_34032 ) ) ( not ( = ?auto_34031 ?auto_34033 ) ) ( TRUCK-AT ?auto_34034 ?auto_34037 ) ( not ( = ?auto_34037 ?auto_34035 ) ) ( ON ?auto_34030 ?auto_34029 ) ( ON ?auto_34031 ?auto_34030 ) ( not ( = ?auto_34029 ?auto_34030 ) ) ( not ( = ?auto_34029 ?auto_34031 ) ) ( not ( = ?auto_34029 ?auto_34032 ) ) ( not ( = ?auto_34029 ?auto_34033 ) ) ( not ( = ?auto_34030 ?auto_34031 ) ) ( not ( = ?auto_34030 ?auto_34032 ) ) ( not ( = ?auto_34030 ?auto_34033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34031 ?auto_34032 ?auto_34033 )
      ( MAKE-4CRATE-VERIFY ?auto_34029 ?auto_34030 ?auto_34031 ?auto_34032 ?auto_34033 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34063 - SURFACE
      ?auto_34064 - SURFACE
      ?auto_34065 - SURFACE
      ?auto_34066 - SURFACE
      ?auto_34067 - SURFACE
    )
    :vars
    (
      ?auto_34070 - HOIST
      ?auto_34068 - PLACE
      ?auto_34069 - TRUCK
      ?auto_34072 - PLACE
      ?auto_34071 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34070 ?auto_34068 ) ( SURFACE-AT ?auto_34066 ?auto_34068 ) ( CLEAR ?auto_34066 ) ( IS-CRATE ?auto_34067 ) ( not ( = ?auto_34066 ?auto_34067 ) ) ( AVAILABLE ?auto_34070 ) ( ON ?auto_34066 ?auto_34065 ) ( not ( = ?auto_34065 ?auto_34066 ) ) ( not ( = ?auto_34065 ?auto_34067 ) ) ( TRUCK-AT ?auto_34069 ?auto_34072 ) ( not ( = ?auto_34072 ?auto_34068 ) ) ( HOIST-AT ?auto_34071 ?auto_34072 ) ( LIFTING ?auto_34071 ?auto_34067 ) ( not ( = ?auto_34070 ?auto_34071 ) ) ( ON ?auto_34064 ?auto_34063 ) ( ON ?auto_34065 ?auto_34064 ) ( not ( = ?auto_34063 ?auto_34064 ) ) ( not ( = ?auto_34063 ?auto_34065 ) ) ( not ( = ?auto_34063 ?auto_34066 ) ) ( not ( = ?auto_34063 ?auto_34067 ) ) ( not ( = ?auto_34064 ?auto_34065 ) ) ( not ( = ?auto_34064 ?auto_34066 ) ) ( not ( = ?auto_34064 ?auto_34067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34065 ?auto_34066 ?auto_34067 )
      ( MAKE-4CRATE-VERIFY ?auto_34063 ?auto_34064 ?auto_34065 ?auto_34066 ?auto_34067 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34101 - SURFACE
      ?auto_34102 - SURFACE
      ?auto_34103 - SURFACE
      ?auto_34104 - SURFACE
      ?auto_34105 - SURFACE
    )
    :vars
    (
      ?auto_34109 - HOIST
      ?auto_34107 - PLACE
      ?auto_34110 - TRUCK
      ?auto_34108 - PLACE
      ?auto_34111 - HOIST
      ?auto_34106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34109 ?auto_34107 ) ( SURFACE-AT ?auto_34104 ?auto_34107 ) ( CLEAR ?auto_34104 ) ( IS-CRATE ?auto_34105 ) ( not ( = ?auto_34104 ?auto_34105 ) ) ( AVAILABLE ?auto_34109 ) ( ON ?auto_34104 ?auto_34103 ) ( not ( = ?auto_34103 ?auto_34104 ) ) ( not ( = ?auto_34103 ?auto_34105 ) ) ( TRUCK-AT ?auto_34110 ?auto_34108 ) ( not ( = ?auto_34108 ?auto_34107 ) ) ( HOIST-AT ?auto_34111 ?auto_34108 ) ( not ( = ?auto_34109 ?auto_34111 ) ) ( AVAILABLE ?auto_34111 ) ( SURFACE-AT ?auto_34105 ?auto_34108 ) ( ON ?auto_34105 ?auto_34106 ) ( CLEAR ?auto_34105 ) ( not ( = ?auto_34104 ?auto_34106 ) ) ( not ( = ?auto_34105 ?auto_34106 ) ) ( not ( = ?auto_34103 ?auto_34106 ) ) ( ON ?auto_34102 ?auto_34101 ) ( ON ?auto_34103 ?auto_34102 ) ( not ( = ?auto_34101 ?auto_34102 ) ) ( not ( = ?auto_34101 ?auto_34103 ) ) ( not ( = ?auto_34101 ?auto_34104 ) ) ( not ( = ?auto_34101 ?auto_34105 ) ) ( not ( = ?auto_34101 ?auto_34106 ) ) ( not ( = ?auto_34102 ?auto_34103 ) ) ( not ( = ?auto_34102 ?auto_34104 ) ) ( not ( = ?auto_34102 ?auto_34105 ) ) ( not ( = ?auto_34102 ?auto_34106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34103 ?auto_34104 ?auto_34105 )
      ( MAKE-4CRATE-VERIFY ?auto_34101 ?auto_34102 ?auto_34103 ?auto_34104 ?auto_34105 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34140 - SURFACE
      ?auto_34141 - SURFACE
      ?auto_34142 - SURFACE
      ?auto_34143 - SURFACE
      ?auto_34144 - SURFACE
    )
    :vars
    (
      ?auto_34148 - HOIST
      ?auto_34146 - PLACE
      ?auto_34147 - PLACE
      ?auto_34150 - HOIST
      ?auto_34149 - SURFACE
      ?auto_34145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34148 ?auto_34146 ) ( SURFACE-AT ?auto_34143 ?auto_34146 ) ( CLEAR ?auto_34143 ) ( IS-CRATE ?auto_34144 ) ( not ( = ?auto_34143 ?auto_34144 ) ) ( AVAILABLE ?auto_34148 ) ( ON ?auto_34143 ?auto_34142 ) ( not ( = ?auto_34142 ?auto_34143 ) ) ( not ( = ?auto_34142 ?auto_34144 ) ) ( not ( = ?auto_34147 ?auto_34146 ) ) ( HOIST-AT ?auto_34150 ?auto_34147 ) ( not ( = ?auto_34148 ?auto_34150 ) ) ( AVAILABLE ?auto_34150 ) ( SURFACE-AT ?auto_34144 ?auto_34147 ) ( ON ?auto_34144 ?auto_34149 ) ( CLEAR ?auto_34144 ) ( not ( = ?auto_34143 ?auto_34149 ) ) ( not ( = ?auto_34144 ?auto_34149 ) ) ( not ( = ?auto_34142 ?auto_34149 ) ) ( TRUCK-AT ?auto_34145 ?auto_34146 ) ( ON ?auto_34141 ?auto_34140 ) ( ON ?auto_34142 ?auto_34141 ) ( not ( = ?auto_34140 ?auto_34141 ) ) ( not ( = ?auto_34140 ?auto_34142 ) ) ( not ( = ?auto_34140 ?auto_34143 ) ) ( not ( = ?auto_34140 ?auto_34144 ) ) ( not ( = ?auto_34140 ?auto_34149 ) ) ( not ( = ?auto_34141 ?auto_34142 ) ) ( not ( = ?auto_34141 ?auto_34143 ) ) ( not ( = ?auto_34141 ?auto_34144 ) ) ( not ( = ?auto_34141 ?auto_34149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34142 ?auto_34143 ?auto_34144 )
      ( MAKE-4CRATE-VERIFY ?auto_34140 ?auto_34141 ?auto_34142 ?auto_34143 ?auto_34144 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34179 - SURFACE
      ?auto_34180 - SURFACE
      ?auto_34181 - SURFACE
      ?auto_34182 - SURFACE
      ?auto_34183 - SURFACE
    )
    :vars
    (
      ?auto_34187 - HOIST
      ?auto_34185 - PLACE
      ?auto_34188 - PLACE
      ?auto_34186 - HOIST
      ?auto_34184 - SURFACE
      ?auto_34189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34187 ?auto_34185 ) ( IS-CRATE ?auto_34183 ) ( not ( = ?auto_34182 ?auto_34183 ) ) ( not ( = ?auto_34181 ?auto_34182 ) ) ( not ( = ?auto_34181 ?auto_34183 ) ) ( not ( = ?auto_34188 ?auto_34185 ) ) ( HOIST-AT ?auto_34186 ?auto_34188 ) ( not ( = ?auto_34187 ?auto_34186 ) ) ( AVAILABLE ?auto_34186 ) ( SURFACE-AT ?auto_34183 ?auto_34188 ) ( ON ?auto_34183 ?auto_34184 ) ( CLEAR ?auto_34183 ) ( not ( = ?auto_34182 ?auto_34184 ) ) ( not ( = ?auto_34183 ?auto_34184 ) ) ( not ( = ?auto_34181 ?auto_34184 ) ) ( TRUCK-AT ?auto_34189 ?auto_34185 ) ( SURFACE-AT ?auto_34181 ?auto_34185 ) ( CLEAR ?auto_34181 ) ( LIFTING ?auto_34187 ?auto_34182 ) ( IS-CRATE ?auto_34182 ) ( ON ?auto_34180 ?auto_34179 ) ( ON ?auto_34181 ?auto_34180 ) ( not ( = ?auto_34179 ?auto_34180 ) ) ( not ( = ?auto_34179 ?auto_34181 ) ) ( not ( = ?auto_34179 ?auto_34182 ) ) ( not ( = ?auto_34179 ?auto_34183 ) ) ( not ( = ?auto_34179 ?auto_34184 ) ) ( not ( = ?auto_34180 ?auto_34181 ) ) ( not ( = ?auto_34180 ?auto_34182 ) ) ( not ( = ?auto_34180 ?auto_34183 ) ) ( not ( = ?auto_34180 ?auto_34184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34181 ?auto_34182 ?auto_34183 )
      ( MAKE-4CRATE-VERIFY ?auto_34179 ?auto_34180 ?auto_34181 ?auto_34182 ?auto_34183 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34218 - SURFACE
      ?auto_34219 - SURFACE
      ?auto_34220 - SURFACE
      ?auto_34221 - SURFACE
      ?auto_34222 - SURFACE
    )
    :vars
    (
      ?auto_34226 - HOIST
      ?auto_34224 - PLACE
      ?auto_34228 - PLACE
      ?auto_34227 - HOIST
      ?auto_34223 - SURFACE
      ?auto_34225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34226 ?auto_34224 ) ( IS-CRATE ?auto_34222 ) ( not ( = ?auto_34221 ?auto_34222 ) ) ( not ( = ?auto_34220 ?auto_34221 ) ) ( not ( = ?auto_34220 ?auto_34222 ) ) ( not ( = ?auto_34228 ?auto_34224 ) ) ( HOIST-AT ?auto_34227 ?auto_34228 ) ( not ( = ?auto_34226 ?auto_34227 ) ) ( AVAILABLE ?auto_34227 ) ( SURFACE-AT ?auto_34222 ?auto_34228 ) ( ON ?auto_34222 ?auto_34223 ) ( CLEAR ?auto_34222 ) ( not ( = ?auto_34221 ?auto_34223 ) ) ( not ( = ?auto_34222 ?auto_34223 ) ) ( not ( = ?auto_34220 ?auto_34223 ) ) ( TRUCK-AT ?auto_34225 ?auto_34224 ) ( SURFACE-AT ?auto_34220 ?auto_34224 ) ( CLEAR ?auto_34220 ) ( IS-CRATE ?auto_34221 ) ( AVAILABLE ?auto_34226 ) ( IN ?auto_34221 ?auto_34225 ) ( ON ?auto_34219 ?auto_34218 ) ( ON ?auto_34220 ?auto_34219 ) ( not ( = ?auto_34218 ?auto_34219 ) ) ( not ( = ?auto_34218 ?auto_34220 ) ) ( not ( = ?auto_34218 ?auto_34221 ) ) ( not ( = ?auto_34218 ?auto_34222 ) ) ( not ( = ?auto_34218 ?auto_34223 ) ) ( not ( = ?auto_34219 ?auto_34220 ) ) ( not ( = ?auto_34219 ?auto_34221 ) ) ( not ( = ?auto_34219 ?auto_34222 ) ) ( not ( = ?auto_34219 ?auto_34223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34220 ?auto_34221 ?auto_34222 )
      ( MAKE-4CRATE-VERIFY ?auto_34218 ?auto_34219 ?auto_34220 ?auto_34221 ?auto_34222 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34878 - SURFACE
      ?auto_34879 - SURFACE
      ?auto_34880 - SURFACE
      ?auto_34881 - SURFACE
      ?auto_34882 - SURFACE
      ?auto_34883 - SURFACE
    )
    :vars
    (
      ?auto_34884 - HOIST
      ?auto_34885 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34884 ?auto_34885 ) ( SURFACE-AT ?auto_34882 ?auto_34885 ) ( CLEAR ?auto_34882 ) ( LIFTING ?auto_34884 ?auto_34883 ) ( IS-CRATE ?auto_34883 ) ( not ( = ?auto_34882 ?auto_34883 ) ) ( ON ?auto_34879 ?auto_34878 ) ( ON ?auto_34880 ?auto_34879 ) ( ON ?auto_34881 ?auto_34880 ) ( ON ?auto_34882 ?auto_34881 ) ( not ( = ?auto_34878 ?auto_34879 ) ) ( not ( = ?auto_34878 ?auto_34880 ) ) ( not ( = ?auto_34878 ?auto_34881 ) ) ( not ( = ?auto_34878 ?auto_34882 ) ) ( not ( = ?auto_34878 ?auto_34883 ) ) ( not ( = ?auto_34879 ?auto_34880 ) ) ( not ( = ?auto_34879 ?auto_34881 ) ) ( not ( = ?auto_34879 ?auto_34882 ) ) ( not ( = ?auto_34879 ?auto_34883 ) ) ( not ( = ?auto_34880 ?auto_34881 ) ) ( not ( = ?auto_34880 ?auto_34882 ) ) ( not ( = ?auto_34880 ?auto_34883 ) ) ( not ( = ?auto_34881 ?auto_34882 ) ) ( not ( = ?auto_34881 ?auto_34883 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34882 ?auto_34883 )
      ( MAKE-5CRATE-VERIFY ?auto_34878 ?auto_34879 ?auto_34880 ?auto_34881 ?auto_34882 ?auto_34883 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34912 - SURFACE
      ?auto_34913 - SURFACE
      ?auto_34914 - SURFACE
      ?auto_34915 - SURFACE
      ?auto_34916 - SURFACE
      ?auto_34917 - SURFACE
    )
    :vars
    (
      ?auto_34920 - HOIST
      ?auto_34918 - PLACE
      ?auto_34919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34920 ?auto_34918 ) ( SURFACE-AT ?auto_34916 ?auto_34918 ) ( CLEAR ?auto_34916 ) ( IS-CRATE ?auto_34917 ) ( not ( = ?auto_34916 ?auto_34917 ) ) ( TRUCK-AT ?auto_34919 ?auto_34918 ) ( AVAILABLE ?auto_34920 ) ( IN ?auto_34917 ?auto_34919 ) ( ON ?auto_34916 ?auto_34915 ) ( not ( = ?auto_34915 ?auto_34916 ) ) ( not ( = ?auto_34915 ?auto_34917 ) ) ( ON ?auto_34913 ?auto_34912 ) ( ON ?auto_34914 ?auto_34913 ) ( ON ?auto_34915 ?auto_34914 ) ( not ( = ?auto_34912 ?auto_34913 ) ) ( not ( = ?auto_34912 ?auto_34914 ) ) ( not ( = ?auto_34912 ?auto_34915 ) ) ( not ( = ?auto_34912 ?auto_34916 ) ) ( not ( = ?auto_34912 ?auto_34917 ) ) ( not ( = ?auto_34913 ?auto_34914 ) ) ( not ( = ?auto_34913 ?auto_34915 ) ) ( not ( = ?auto_34913 ?auto_34916 ) ) ( not ( = ?auto_34913 ?auto_34917 ) ) ( not ( = ?auto_34914 ?auto_34915 ) ) ( not ( = ?auto_34914 ?auto_34916 ) ) ( not ( = ?auto_34914 ?auto_34917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34915 ?auto_34916 ?auto_34917 )
      ( MAKE-5CRATE-VERIFY ?auto_34912 ?auto_34913 ?auto_34914 ?auto_34915 ?auto_34916 ?auto_34917 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34952 - SURFACE
      ?auto_34953 - SURFACE
      ?auto_34954 - SURFACE
      ?auto_34955 - SURFACE
      ?auto_34956 - SURFACE
      ?auto_34957 - SURFACE
    )
    :vars
    (
      ?auto_34958 - HOIST
      ?auto_34959 - PLACE
      ?auto_34960 - TRUCK
      ?auto_34961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34958 ?auto_34959 ) ( SURFACE-AT ?auto_34956 ?auto_34959 ) ( CLEAR ?auto_34956 ) ( IS-CRATE ?auto_34957 ) ( not ( = ?auto_34956 ?auto_34957 ) ) ( AVAILABLE ?auto_34958 ) ( IN ?auto_34957 ?auto_34960 ) ( ON ?auto_34956 ?auto_34955 ) ( not ( = ?auto_34955 ?auto_34956 ) ) ( not ( = ?auto_34955 ?auto_34957 ) ) ( TRUCK-AT ?auto_34960 ?auto_34961 ) ( not ( = ?auto_34961 ?auto_34959 ) ) ( ON ?auto_34953 ?auto_34952 ) ( ON ?auto_34954 ?auto_34953 ) ( ON ?auto_34955 ?auto_34954 ) ( not ( = ?auto_34952 ?auto_34953 ) ) ( not ( = ?auto_34952 ?auto_34954 ) ) ( not ( = ?auto_34952 ?auto_34955 ) ) ( not ( = ?auto_34952 ?auto_34956 ) ) ( not ( = ?auto_34952 ?auto_34957 ) ) ( not ( = ?auto_34953 ?auto_34954 ) ) ( not ( = ?auto_34953 ?auto_34955 ) ) ( not ( = ?auto_34953 ?auto_34956 ) ) ( not ( = ?auto_34953 ?auto_34957 ) ) ( not ( = ?auto_34954 ?auto_34955 ) ) ( not ( = ?auto_34954 ?auto_34956 ) ) ( not ( = ?auto_34954 ?auto_34957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34955 ?auto_34956 ?auto_34957 )
      ( MAKE-5CRATE-VERIFY ?auto_34952 ?auto_34953 ?auto_34954 ?auto_34955 ?auto_34956 ?auto_34957 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34997 - SURFACE
      ?auto_34998 - SURFACE
      ?auto_34999 - SURFACE
      ?auto_35000 - SURFACE
      ?auto_35001 - SURFACE
      ?auto_35002 - SURFACE
    )
    :vars
    (
      ?auto_35003 - HOIST
      ?auto_35004 - PLACE
      ?auto_35007 - TRUCK
      ?auto_35005 - PLACE
      ?auto_35006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35003 ?auto_35004 ) ( SURFACE-AT ?auto_35001 ?auto_35004 ) ( CLEAR ?auto_35001 ) ( IS-CRATE ?auto_35002 ) ( not ( = ?auto_35001 ?auto_35002 ) ) ( AVAILABLE ?auto_35003 ) ( ON ?auto_35001 ?auto_35000 ) ( not ( = ?auto_35000 ?auto_35001 ) ) ( not ( = ?auto_35000 ?auto_35002 ) ) ( TRUCK-AT ?auto_35007 ?auto_35005 ) ( not ( = ?auto_35005 ?auto_35004 ) ) ( HOIST-AT ?auto_35006 ?auto_35005 ) ( LIFTING ?auto_35006 ?auto_35002 ) ( not ( = ?auto_35003 ?auto_35006 ) ) ( ON ?auto_34998 ?auto_34997 ) ( ON ?auto_34999 ?auto_34998 ) ( ON ?auto_35000 ?auto_34999 ) ( not ( = ?auto_34997 ?auto_34998 ) ) ( not ( = ?auto_34997 ?auto_34999 ) ) ( not ( = ?auto_34997 ?auto_35000 ) ) ( not ( = ?auto_34997 ?auto_35001 ) ) ( not ( = ?auto_34997 ?auto_35002 ) ) ( not ( = ?auto_34998 ?auto_34999 ) ) ( not ( = ?auto_34998 ?auto_35000 ) ) ( not ( = ?auto_34998 ?auto_35001 ) ) ( not ( = ?auto_34998 ?auto_35002 ) ) ( not ( = ?auto_34999 ?auto_35000 ) ) ( not ( = ?auto_34999 ?auto_35001 ) ) ( not ( = ?auto_34999 ?auto_35002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35000 ?auto_35001 ?auto_35002 )
      ( MAKE-5CRATE-VERIFY ?auto_34997 ?auto_34998 ?auto_34999 ?auto_35000 ?auto_35001 ?auto_35002 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35047 - SURFACE
      ?auto_35048 - SURFACE
      ?auto_35049 - SURFACE
      ?auto_35050 - SURFACE
      ?auto_35051 - SURFACE
      ?auto_35052 - SURFACE
    )
    :vars
    (
      ?auto_35056 - HOIST
      ?auto_35055 - PLACE
      ?auto_35057 - TRUCK
      ?auto_35053 - PLACE
      ?auto_35058 - HOIST
      ?auto_35054 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35056 ?auto_35055 ) ( SURFACE-AT ?auto_35051 ?auto_35055 ) ( CLEAR ?auto_35051 ) ( IS-CRATE ?auto_35052 ) ( not ( = ?auto_35051 ?auto_35052 ) ) ( AVAILABLE ?auto_35056 ) ( ON ?auto_35051 ?auto_35050 ) ( not ( = ?auto_35050 ?auto_35051 ) ) ( not ( = ?auto_35050 ?auto_35052 ) ) ( TRUCK-AT ?auto_35057 ?auto_35053 ) ( not ( = ?auto_35053 ?auto_35055 ) ) ( HOIST-AT ?auto_35058 ?auto_35053 ) ( not ( = ?auto_35056 ?auto_35058 ) ) ( AVAILABLE ?auto_35058 ) ( SURFACE-AT ?auto_35052 ?auto_35053 ) ( ON ?auto_35052 ?auto_35054 ) ( CLEAR ?auto_35052 ) ( not ( = ?auto_35051 ?auto_35054 ) ) ( not ( = ?auto_35052 ?auto_35054 ) ) ( not ( = ?auto_35050 ?auto_35054 ) ) ( ON ?auto_35048 ?auto_35047 ) ( ON ?auto_35049 ?auto_35048 ) ( ON ?auto_35050 ?auto_35049 ) ( not ( = ?auto_35047 ?auto_35048 ) ) ( not ( = ?auto_35047 ?auto_35049 ) ) ( not ( = ?auto_35047 ?auto_35050 ) ) ( not ( = ?auto_35047 ?auto_35051 ) ) ( not ( = ?auto_35047 ?auto_35052 ) ) ( not ( = ?auto_35047 ?auto_35054 ) ) ( not ( = ?auto_35048 ?auto_35049 ) ) ( not ( = ?auto_35048 ?auto_35050 ) ) ( not ( = ?auto_35048 ?auto_35051 ) ) ( not ( = ?auto_35048 ?auto_35052 ) ) ( not ( = ?auto_35048 ?auto_35054 ) ) ( not ( = ?auto_35049 ?auto_35050 ) ) ( not ( = ?auto_35049 ?auto_35051 ) ) ( not ( = ?auto_35049 ?auto_35052 ) ) ( not ( = ?auto_35049 ?auto_35054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35050 ?auto_35051 ?auto_35052 )
      ( MAKE-5CRATE-VERIFY ?auto_35047 ?auto_35048 ?auto_35049 ?auto_35050 ?auto_35051 ?auto_35052 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35098 - SURFACE
      ?auto_35099 - SURFACE
      ?auto_35100 - SURFACE
      ?auto_35101 - SURFACE
      ?auto_35102 - SURFACE
      ?auto_35103 - SURFACE
    )
    :vars
    (
      ?auto_35109 - HOIST
      ?auto_35108 - PLACE
      ?auto_35104 - PLACE
      ?auto_35105 - HOIST
      ?auto_35107 - SURFACE
      ?auto_35106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35109 ?auto_35108 ) ( SURFACE-AT ?auto_35102 ?auto_35108 ) ( CLEAR ?auto_35102 ) ( IS-CRATE ?auto_35103 ) ( not ( = ?auto_35102 ?auto_35103 ) ) ( AVAILABLE ?auto_35109 ) ( ON ?auto_35102 ?auto_35101 ) ( not ( = ?auto_35101 ?auto_35102 ) ) ( not ( = ?auto_35101 ?auto_35103 ) ) ( not ( = ?auto_35104 ?auto_35108 ) ) ( HOIST-AT ?auto_35105 ?auto_35104 ) ( not ( = ?auto_35109 ?auto_35105 ) ) ( AVAILABLE ?auto_35105 ) ( SURFACE-AT ?auto_35103 ?auto_35104 ) ( ON ?auto_35103 ?auto_35107 ) ( CLEAR ?auto_35103 ) ( not ( = ?auto_35102 ?auto_35107 ) ) ( not ( = ?auto_35103 ?auto_35107 ) ) ( not ( = ?auto_35101 ?auto_35107 ) ) ( TRUCK-AT ?auto_35106 ?auto_35108 ) ( ON ?auto_35099 ?auto_35098 ) ( ON ?auto_35100 ?auto_35099 ) ( ON ?auto_35101 ?auto_35100 ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( not ( = ?auto_35098 ?auto_35100 ) ) ( not ( = ?auto_35098 ?auto_35101 ) ) ( not ( = ?auto_35098 ?auto_35102 ) ) ( not ( = ?auto_35098 ?auto_35103 ) ) ( not ( = ?auto_35098 ?auto_35107 ) ) ( not ( = ?auto_35099 ?auto_35100 ) ) ( not ( = ?auto_35099 ?auto_35101 ) ) ( not ( = ?auto_35099 ?auto_35102 ) ) ( not ( = ?auto_35099 ?auto_35103 ) ) ( not ( = ?auto_35099 ?auto_35107 ) ) ( not ( = ?auto_35100 ?auto_35101 ) ) ( not ( = ?auto_35100 ?auto_35102 ) ) ( not ( = ?auto_35100 ?auto_35103 ) ) ( not ( = ?auto_35100 ?auto_35107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35101 ?auto_35102 ?auto_35103 )
      ( MAKE-5CRATE-VERIFY ?auto_35098 ?auto_35099 ?auto_35100 ?auto_35101 ?auto_35102 ?auto_35103 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35149 - SURFACE
      ?auto_35150 - SURFACE
      ?auto_35151 - SURFACE
      ?auto_35152 - SURFACE
      ?auto_35153 - SURFACE
      ?auto_35154 - SURFACE
    )
    :vars
    (
      ?auto_35155 - HOIST
      ?auto_35157 - PLACE
      ?auto_35158 - PLACE
      ?auto_35160 - HOIST
      ?auto_35156 - SURFACE
      ?auto_35159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35155 ?auto_35157 ) ( IS-CRATE ?auto_35154 ) ( not ( = ?auto_35153 ?auto_35154 ) ) ( not ( = ?auto_35152 ?auto_35153 ) ) ( not ( = ?auto_35152 ?auto_35154 ) ) ( not ( = ?auto_35158 ?auto_35157 ) ) ( HOIST-AT ?auto_35160 ?auto_35158 ) ( not ( = ?auto_35155 ?auto_35160 ) ) ( AVAILABLE ?auto_35160 ) ( SURFACE-AT ?auto_35154 ?auto_35158 ) ( ON ?auto_35154 ?auto_35156 ) ( CLEAR ?auto_35154 ) ( not ( = ?auto_35153 ?auto_35156 ) ) ( not ( = ?auto_35154 ?auto_35156 ) ) ( not ( = ?auto_35152 ?auto_35156 ) ) ( TRUCK-AT ?auto_35159 ?auto_35157 ) ( SURFACE-AT ?auto_35152 ?auto_35157 ) ( CLEAR ?auto_35152 ) ( LIFTING ?auto_35155 ?auto_35153 ) ( IS-CRATE ?auto_35153 ) ( ON ?auto_35150 ?auto_35149 ) ( ON ?auto_35151 ?auto_35150 ) ( ON ?auto_35152 ?auto_35151 ) ( not ( = ?auto_35149 ?auto_35150 ) ) ( not ( = ?auto_35149 ?auto_35151 ) ) ( not ( = ?auto_35149 ?auto_35152 ) ) ( not ( = ?auto_35149 ?auto_35153 ) ) ( not ( = ?auto_35149 ?auto_35154 ) ) ( not ( = ?auto_35149 ?auto_35156 ) ) ( not ( = ?auto_35150 ?auto_35151 ) ) ( not ( = ?auto_35150 ?auto_35152 ) ) ( not ( = ?auto_35150 ?auto_35153 ) ) ( not ( = ?auto_35150 ?auto_35154 ) ) ( not ( = ?auto_35150 ?auto_35156 ) ) ( not ( = ?auto_35151 ?auto_35152 ) ) ( not ( = ?auto_35151 ?auto_35153 ) ) ( not ( = ?auto_35151 ?auto_35154 ) ) ( not ( = ?auto_35151 ?auto_35156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35152 ?auto_35153 ?auto_35154 )
      ( MAKE-5CRATE-VERIFY ?auto_35149 ?auto_35150 ?auto_35151 ?auto_35152 ?auto_35153 ?auto_35154 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35200 - SURFACE
      ?auto_35201 - SURFACE
      ?auto_35202 - SURFACE
      ?auto_35203 - SURFACE
      ?auto_35204 - SURFACE
      ?auto_35205 - SURFACE
    )
    :vars
    (
      ?auto_35211 - HOIST
      ?auto_35208 - PLACE
      ?auto_35206 - PLACE
      ?auto_35210 - HOIST
      ?auto_35209 - SURFACE
      ?auto_35207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35211 ?auto_35208 ) ( IS-CRATE ?auto_35205 ) ( not ( = ?auto_35204 ?auto_35205 ) ) ( not ( = ?auto_35203 ?auto_35204 ) ) ( not ( = ?auto_35203 ?auto_35205 ) ) ( not ( = ?auto_35206 ?auto_35208 ) ) ( HOIST-AT ?auto_35210 ?auto_35206 ) ( not ( = ?auto_35211 ?auto_35210 ) ) ( AVAILABLE ?auto_35210 ) ( SURFACE-AT ?auto_35205 ?auto_35206 ) ( ON ?auto_35205 ?auto_35209 ) ( CLEAR ?auto_35205 ) ( not ( = ?auto_35204 ?auto_35209 ) ) ( not ( = ?auto_35205 ?auto_35209 ) ) ( not ( = ?auto_35203 ?auto_35209 ) ) ( TRUCK-AT ?auto_35207 ?auto_35208 ) ( SURFACE-AT ?auto_35203 ?auto_35208 ) ( CLEAR ?auto_35203 ) ( IS-CRATE ?auto_35204 ) ( AVAILABLE ?auto_35211 ) ( IN ?auto_35204 ?auto_35207 ) ( ON ?auto_35201 ?auto_35200 ) ( ON ?auto_35202 ?auto_35201 ) ( ON ?auto_35203 ?auto_35202 ) ( not ( = ?auto_35200 ?auto_35201 ) ) ( not ( = ?auto_35200 ?auto_35202 ) ) ( not ( = ?auto_35200 ?auto_35203 ) ) ( not ( = ?auto_35200 ?auto_35204 ) ) ( not ( = ?auto_35200 ?auto_35205 ) ) ( not ( = ?auto_35200 ?auto_35209 ) ) ( not ( = ?auto_35201 ?auto_35202 ) ) ( not ( = ?auto_35201 ?auto_35203 ) ) ( not ( = ?auto_35201 ?auto_35204 ) ) ( not ( = ?auto_35201 ?auto_35205 ) ) ( not ( = ?auto_35201 ?auto_35209 ) ) ( not ( = ?auto_35202 ?auto_35203 ) ) ( not ( = ?auto_35202 ?auto_35204 ) ) ( not ( = ?auto_35202 ?auto_35205 ) ) ( not ( = ?auto_35202 ?auto_35209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35203 ?auto_35204 ?auto_35205 )
      ( MAKE-5CRATE-VERIFY ?auto_35200 ?auto_35201 ?auto_35202 ?auto_35203 ?auto_35204 ?auto_35205 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35568 - SURFACE
      ?auto_35569 - SURFACE
    )
    :vars
    (
      ?auto_35573 - HOIST
      ?auto_35572 - PLACE
      ?auto_35571 - SURFACE
      ?auto_35574 - TRUCK
      ?auto_35575 - PLACE
      ?auto_35570 - HOIST
      ?auto_35576 - SURFACE
      ?auto_35577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35573 ?auto_35572 ) ( SURFACE-AT ?auto_35568 ?auto_35572 ) ( CLEAR ?auto_35568 ) ( IS-CRATE ?auto_35569 ) ( not ( = ?auto_35568 ?auto_35569 ) ) ( AVAILABLE ?auto_35573 ) ( ON ?auto_35568 ?auto_35571 ) ( not ( = ?auto_35571 ?auto_35568 ) ) ( not ( = ?auto_35571 ?auto_35569 ) ) ( TRUCK-AT ?auto_35574 ?auto_35575 ) ( not ( = ?auto_35575 ?auto_35572 ) ) ( HOIST-AT ?auto_35570 ?auto_35575 ) ( not ( = ?auto_35573 ?auto_35570 ) ) ( SURFACE-AT ?auto_35569 ?auto_35575 ) ( ON ?auto_35569 ?auto_35576 ) ( CLEAR ?auto_35569 ) ( not ( = ?auto_35568 ?auto_35576 ) ) ( not ( = ?auto_35569 ?auto_35576 ) ) ( not ( = ?auto_35571 ?auto_35576 ) ) ( LIFTING ?auto_35570 ?auto_35577 ) ( IS-CRATE ?auto_35577 ) ( not ( = ?auto_35568 ?auto_35577 ) ) ( not ( = ?auto_35569 ?auto_35577 ) ) ( not ( = ?auto_35571 ?auto_35577 ) ) ( not ( = ?auto_35576 ?auto_35577 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35570 ?auto_35577 ?auto_35574 ?auto_35575 )
      ( MAKE-1CRATE ?auto_35568 ?auto_35569 )
      ( MAKE-1CRATE-VERIFY ?auto_35568 ?auto_35569 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36405 - SURFACE
      ?auto_36406 - SURFACE
      ?auto_36407 - SURFACE
      ?auto_36408 - SURFACE
      ?auto_36409 - SURFACE
      ?auto_36410 - SURFACE
      ?auto_36411 - SURFACE
    )
    :vars
    (
      ?auto_36413 - HOIST
      ?auto_36412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36413 ?auto_36412 ) ( SURFACE-AT ?auto_36410 ?auto_36412 ) ( CLEAR ?auto_36410 ) ( LIFTING ?auto_36413 ?auto_36411 ) ( IS-CRATE ?auto_36411 ) ( not ( = ?auto_36410 ?auto_36411 ) ) ( ON ?auto_36406 ?auto_36405 ) ( ON ?auto_36407 ?auto_36406 ) ( ON ?auto_36408 ?auto_36407 ) ( ON ?auto_36409 ?auto_36408 ) ( ON ?auto_36410 ?auto_36409 ) ( not ( = ?auto_36405 ?auto_36406 ) ) ( not ( = ?auto_36405 ?auto_36407 ) ) ( not ( = ?auto_36405 ?auto_36408 ) ) ( not ( = ?auto_36405 ?auto_36409 ) ) ( not ( = ?auto_36405 ?auto_36410 ) ) ( not ( = ?auto_36405 ?auto_36411 ) ) ( not ( = ?auto_36406 ?auto_36407 ) ) ( not ( = ?auto_36406 ?auto_36408 ) ) ( not ( = ?auto_36406 ?auto_36409 ) ) ( not ( = ?auto_36406 ?auto_36410 ) ) ( not ( = ?auto_36406 ?auto_36411 ) ) ( not ( = ?auto_36407 ?auto_36408 ) ) ( not ( = ?auto_36407 ?auto_36409 ) ) ( not ( = ?auto_36407 ?auto_36410 ) ) ( not ( = ?auto_36407 ?auto_36411 ) ) ( not ( = ?auto_36408 ?auto_36409 ) ) ( not ( = ?auto_36408 ?auto_36410 ) ) ( not ( = ?auto_36408 ?auto_36411 ) ) ( not ( = ?auto_36409 ?auto_36410 ) ) ( not ( = ?auto_36409 ?auto_36411 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36410 ?auto_36411 )
      ( MAKE-6CRATE-VERIFY ?auto_36405 ?auto_36406 ?auto_36407 ?auto_36408 ?auto_36409 ?auto_36410 ?auto_36411 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36449 - SURFACE
      ?auto_36450 - SURFACE
      ?auto_36451 - SURFACE
      ?auto_36452 - SURFACE
      ?auto_36453 - SURFACE
      ?auto_36454 - SURFACE
      ?auto_36455 - SURFACE
    )
    :vars
    (
      ?auto_36457 - HOIST
      ?auto_36456 - PLACE
      ?auto_36458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36457 ?auto_36456 ) ( SURFACE-AT ?auto_36454 ?auto_36456 ) ( CLEAR ?auto_36454 ) ( IS-CRATE ?auto_36455 ) ( not ( = ?auto_36454 ?auto_36455 ) ) ( TRUCK-AT ?auto_36458 ?auto_36456 ) ( AVAILABLE ?auto_36457 ) ( IN ?auto_36455 ?auto_36458 ) ( ON ?auto_36454 ?auto_36453 ) ( not ( = ?auto_36453 ?auto_36454 ) ) ( not ( = ?auto_36453 ?auto_36455 ) ) ( ON ?auto_36450 ?auto_36449 ) ( ON ?auto_36451 ?auto_36450 ) ( ON ?auto_36452 ?auto_36451 ) ( ON ?auto_36453 ?auto_36452 ) ( not ( = ?auto_36449 ?auto_36450 ) ) ( not ( = ?auto_36449 ?auto_36451 ) ) ( not ( = ?auto_36449 ?auto_36452 ) ) ( not ( = ?auto_36449 ?auto_36453 ) ) ( not ( = ?auto_36449 ?auto_36454 ) ) ( not ( = ?auto_36449 ?auto_36455 ) ) ( not ( = ?auto_36450 ?auto_36451 ) ) ( not ( = ?auto_36450 ?auto_36452 ) ) ( not ( = ?auto_36450 ?auto_36453 ) ) ( not ( = ?auto_36450 ?auto_36454 ) ) ( not ( = ?auto_36450 ?auto_36455 ) ) ( not ( = ?auto_36451 ?auto_36452 ) ) ( not ( = ?auto_36451 ?auto_36453 ) ) ( not ( = ?auto_36451 ?auto_36454 ) ) ( not ( = ?auto_36451 ?auto_36455 ) ) ( not ( = ?auto_36452 ?auto_36453 ) ) ( not ( = ?auto_36452 ?auto_36454 ) ) ( not ( = ?auto_36452 ?auto_36455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36453 ?auto_36454 ?auto_36455 )
      ( MAKE-6CRATE-VERIFY ?auto_36449 ?auto_36450 ?auto_36451 ?auto_36452 ?auto_36453 ?auto_36454 ?auto_36455 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36500 - SURFACE
      ?auto_36501 - SURFACE
      ?auto_36502 - SURFACE
      ?auto_36503 - SURFACE
      ?auto_36504 - SURFACE
      ?auto_36505 - SURFACE
      ?auto_36506 - SURFACE
    )
    :vars
    (
      ?auto_36507 - HOIST
      ?auto_36508 - PLACE
      ?auto_36509 - TRUCK
      ?auto_36510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36507 ?auto_36508 ) ( SURFACE-AT ?auto_36505 ?auto_36508 ) ( CLEAR ?auto_36505 ) ( IS-CRATE ?auto_36506 ) ( not ( = ?auto_36505 ?auto_36506 ) ) ( AVAILABLE ?auto_36507 ) ( IN ?auto_36506 ?auto_36509 ) ( ON ?auto_36505 ?auto_36504 ) ( not ( = ?auto_36504 ?auto_36505 ) ) ( not ( = ?auto_36504 ?auto_36506 ) ) ( TRUCK-AT ?auto_36509 ?auto_36510 ) ( not ( = ?auto_36510 ?auto_36508 ) ) ( ON ?auto_36501 ?auto_36500 ) ( ON ?auto_36502 ?auto_36501 ) ( ON ?auto_36503 ?auto_36502 ) ( ON ?auto_36504 ?auto_36503 ) ( not ( = ?auto_36500 ?auto_36501 ) ) ( not ( = ?auto_36500 ?auto_36502 ) ) ( not ( = ?auto_36500 ?auto_36503 ) ) ( not ( = ?auto_36500 ?auto_36504 ) ) ( not ( = ?auto_36500 ?auto_36505 ) ) ( not ( = ?auto_36500 ?auto_36506 ) ) ( not ( = ?auto_36501 ?auto_36502 ) ) ( not ( = ?auto_36501 ?auto_36503 ) ) ( not ( = ?auto_36501 ?auto_36504 ) ) ( not ( = ?auto_36501 ?auto_36505 ) ) ( not ( = ?auto_36501 ?auto_36506 ) ) ( not ( = ?auto_36502 ?auto_36503 ) ) ( not ( = ?auto_36502 ?auto_36504 ) ) ( not ( = ?auto_36502 ?auto_36505 ) ) ( not ( = ?auto_36502 ?auto_36506 ) ) ( not ( = ?auto_36503 ?auto_36504 ) ) ( not ( = ?auto_36503 ?auto_36505 ) ) ( not ( = ?auto_36503 ?auto_36506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36504 ?auto_36505 ?auto_36506 )
      ( MAKE-6CRATE-VERIFY ?auto_36500 ?auto_36501 ?auto_36502 ?auto_36503 ?auto_36504 ?auto_36505 ?auto_36506 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36557 - SURFACE
      ?auto_36558 - SURFACE
      ?auto_36559 - SURFACE
      ?auto_36560 - SURFACE
      ?auto_36561 - SURFACE
      ?auto_36562 - SURFACE
      ?auto_36563 - SURFACE
    )
    :vars
    (
      ?auto_36567 - HOIST
      ?auto_36568 - PLACE
      ?auto_36566 - TRUCK
      ?auto_36565 - PLACE
      ?auto_36564 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36567 ?auto_36568 ) ( SURFACE-AT ?auto_36562 ?auto_36568 ) ( CLEAR ?auto_36562 ) ( IS-CRATE ?auto_36563 ) ( not ( = ?auto_36562 ?auto_36563 ) ) ( AVAILABLE ?auto_36567 ) ( ON ?auto_36562 ?auto_36561 ) ( not ( = ?auto_36561 ?auto_36562 ) ) ( not ( = ?auto_36561 ?auto_36563 ) ) ( TRUCK-AT ?auto_36566 ?auto_36565 ) ( not ( = ?auto_36565 ?auto_36568 ) ) ( HOIST-AT ?auto_36564 ?auto_36565 ) ( LIFTING ?auto_36564 ?auto_36563 ) ( not ( = ?auto_36567 ?auto_36564 ) ) ( ON ?auto_36558 ?auto_36557 ) ( ON ?auto_36559 ?auto_36558 ) ( ON ?auto_36560 ?auto_36559 ) ( ON ?auto_36561 ?auto_36560 ) ( not ( = ?auto_36557 ?auto_36558 ) ) ( not ( = ?auto_36557 ?auto_36559 ) ) ( not ( = ?auto_36557 ?auto_36560 ) ) ( not ( = ?auto_36557 ?auto_36561 ) ) ( not ( = ?auto_36557 ?auto_36562 ) ) ( not ( = ?auto_36557 ?auto_36563 ) ) ( not ( = ?auto_36558 ?auto_36559 ) ) ( not ( = ?auto_36558 ?auto_36560 ) ) ( not ( = ?auto_36558 ?auto_36561 ) ) ( not ( = ?auto_36558 ?auto_36562 ) ) ( not ( = ?auto_36558 ?auto_36563 ) ) ( not ( = ?auto_36559 ?auto_36560 ) ) ( not ( = ?auto_36559 ?auto_36561 ) ) ( not ( = ?auto_36559 ?auto_36562 ) ) ( not ( = ?auto_36559 ?auto_36563 ) ) ( not ( = ?auto_36560 ?auto_36561 ) ) ( not ( = ?auto_36560 ?auto_36562 ) ) ( not ( = ?auto_36560 ?auto_36563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36561 ?auto_36562 ?auto_36563 )
      ( MAKE-6CRATE-VERIFY ?auto_36557 ?auto_36558 ?auto_36559 ?auto_36560 ?auto_36561 ?auto_36562 ?auto_36563 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36620 - SURFACE
      ?auto_36621 - SURFACE
      ?auto_36622 - SURFACE
      ?auto_36623 - SURFACE
      ?auto_36624 - SURFACE
      ?auto_36625 - SURFACE
      ?auto_36626 - SURFACE
    )
    :vars
    (
      ?auto_36630 - HOIST
      ?auto_36632 - PLACE
      ?auto_36631 - TRUCK
      ?auto_36629 - PLACE
      ?auto_36628 - HOIST
      ?auto_36627 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36630 ?auto_36632 ) ( SURFACE-AT ?auto_36625 ?auto_36632 ) ( CLEAR ?auto_36625 ) ( IS-CRATE ?auto_36626 ) ( not ( = ?auto_36625 ?auto_36626 ) ) ( AVAILABLE ?auto_36630 ) ( ON ?auto_36625 ?auto_36624 ) ( not ( = ?auto_36624 ?auto_36625 ) ) ( not ( = ?auto_36624 ?auto_36626 ) ) ( TRUCK-AT ?auto_36631 ?auto_36629 ) ( not ( = ?auto_36629 ?auto_36632 ) ) ( HOIST-AT ?auto_36628 ?auto_36629 ) ( not ( = ?auto_36630 ?auto_36628 ) ) ( AVAILABLE ?auto_36628 ) ( SURFACE-AT ?auto_36626 ?auto_36629 ) ( ON ?auto_36626 ?auto_36627 ) ( CLEAR ?auto_36626 ) ( not ( = ?auto_36625 ?auto_36627 ) ) ( not ( = ?auto_36626 ?auto_36627 ) ) ( not ( = ?auto_36624 ?auto_36627 ) ) ( ON ?auto_36621 ?auto_36620 ) ( ON ?auto_36622 ?auto_36621 ) ( ON ?auto_36623 ?auto_36622 ) ( ON ?auto_36624 ?auto_36623 ) ( not ( = ?auto_36620 ?auto_36621 ) ) ( not ( = ?auto_36620 ?auto_36622 ) ) ( not ( = ?auto_36620 ?auto_36623 ) ) ( not ( = ?auto_36620 ?auto_36624 ) ) ( not ( = ?auto_36620 ?auto_36625 ) ) ( not ( = ?auto_36620 ?auto_36626 ) ) ( not ( = ?auto_36620 ?auto_36627 ) ) ( not ( = ?auto_36621 ?auto_36622 ) ) ( not ( = ?auto_36621 ?auto_36623 ) ) ( not ( = ?auto_36621 ?auto_36624 ) ) ( not ( = ?auto_36621 ?auto_36625 ) ) ( not ( = ?auto_36621 ?auto_36626 ) ) ( not ( = ?auto_36621 ?auto_36627 ) ) ( not ( = ?auto_36622 ?auto_36623 ) ) ( not ( = ?auto_36622 ?auto_36624 ) ) ( not ( = ?auto_36622 ?auto_36625 ) ) ( not ( = ?auto_36622 ?auto_36626 ) ) ( not ( = ?auto_36622 ?auto_36627 ) ) ( not ( = ?auto_36623 ?auto_36624 ) ) ( not ( = ?auto_36623 ?auto_36625 ) ) ( not ( = ?auto_36623 ?auto_36626 ) ) ( not ( = ?auto_36623 ?auto_36627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36624 ?auto_36625 ?auto_36626 )
      ( MAKE-6CRATE-VERIFY ?auto_36620 ?auto_36621 ?auto_36622 ?auto_36623 ?auto_36624 ?auto_36625 ?auto_36626 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36684 - SURFACE
      ?auto_36685 - SURFACE
      ?auto_36686 - SURFACE
      ?auto_36687 - SURFACE
      ?auto_36688 - SURFACE
      ?auto_36689 - SURFACE
      ?auto_36690 - SURFACE
    )
    :vars
    (
      ?auto_36694 - HOIST
      ?auto_36691 - PLACE
      ?auto_36693 - PLACE
      ?auto_36695 - HOIST
      ?auto_36692 - SURFACE
      ?auto_36696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36694 ?auto_36691 ) ( SURFACE-AT ?auto_36689 ?auto_36691 ) ( CLEAR ?auto_36689 ) ( IS-CRATE ?auto_36690 ) ( not ( = ?auto_36689 ?auto_36690 ) ) ( AVAILABLE ?auto_36694 ) ( ON ?auto_36689 ?auto_36688 ) ( not ( = ?auto_36688 ?auto_36689 ) ) ( not ( = ?auto_36688 ?auto_36690 ) ) ( not ( = ?auto_36693 ?auto_36691 ) ) ( HOIST-AT ?auto_36695 ?auto_36693 ) ( not ( = ?auto_36694 ?auto_36695 ) ) ( AVAILABLE ?auto_36695 ) ( SURFACE-AT ?auto_36690 ?auto_36693 ) ( ON ?auto_36690 ?auto_36692 ) ( CLEAR ?auto_36690 ) ( not ( = ?auto_36689 ?auto_36692 ) ) ( not ( = ?auto_36690 ?auto_36692 ) ) ( not ( = ?auto_36688 ?auto_36692 ) ) ( TRUCK-AT ?auto_36696 ?auto_36691 ) ( ON ?auto_36685 ?auto_36684 ) ( ON ?auto_36686 ?auto_36685 ) ( ON ?auto_36687 ?auto_36686 ) ( ON ?auto_36688 ?auto_36687 ) ( not ( = ?auto_36684 ?auto_36685 ) ) ( not ( = ?auto_36684 ?auto_36686 ) ) ( not ( = ?auto_36684 ?auto_36687 ) ) ( not ( = ?auto_36684 ?auto_36688 ) ) ( not ( = ?auto_36684 ?auto_36689 ) ) ( not ( = ?auto_36684 ?auto_36690 ) ) ( not ( = ?auto_36684 ?auto_36692 ) ) ( not ( = ?auto_36685 ?auto_36686 ) ) ( not ( = ?auto_36685 ?auto_36687 ) ) ( not ( = ?auto_36685 ?auto_36688 ) ) ( not ( = ?auto_36685 ?auto_36689 ) ) ( not ( = ?auto_36685 ?auto_36690 ) ) ( not ( = ?auto_36685 ?auto_36692 ) ) ( not ( = ?auto_36686 ?auto_36687 ) ) ( not ( = ?auto_36686 ?auto_36688 ) ) ( not ( = ?auto_36686 ?auto_36689 ) ) ( not ( = ?auto_36686 ?auto_36690 ) ) ( not ( = ?auto_36686 ?auto_36692 ) ) ( not ( = ?auto_36687 ?auto_36688 ) ) ( not ( = ?auto_36687 ?auto_36689 ) ) ( not ( = ?auto_36687 ?auto_36690 ) ) ( not ( = ?auto_36687 ?auto_36692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36688 ?auto_36689 ?auto_36690 )
      ( MAKE-6CRATE-VERIFY ?auto_36684 ?auto_36685 ?auto_36686 ?auto_36687 ?auto_36688 ?auto_36689 ?auto_36690 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36748 - SURFACE
      ?auto_36749 - SURFACE
      ?auto_36750 - SURFACE
      ?auto_36751 - SURFACE
      ?auto_36752 - SURFACE
      ?auto_36753 - SURFACE
      ?auto_36754 - SURFACE
    )
    :vars
    (
      ?auto_36755 - HOIST
      ?auto_36757 - PLACE
      ?auto_36758 - PLACE
      ?auto_36759 - HOIST
      ?auto_36756 - SURFACE
      ?auto_36760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36755 ?auto_36757 ) ( IS-CRATE ?auto_36754 ) ( not ( = ?auto_36753 ?auto_36754 ) ) ( not ( = ?auto_36752 ?auto_36753 ) ) ( not ( = ?auto_36752 ?auto_36754 ) ) ( not ( = ?auto_36758 ?auto_36757 ) ) ( HOIST-AT ?auto_36759 ?auto_36758 ) ( not ( = ?auto_36755 ?auto_36759 ) ) ( AVAILABLE ?auto_36759 ) ( SURFACE-AT ?auto_36754 ?auto_36758 ) ( ON ?auto_36754 ?auto_36756 ) ( CLEAR ?auto_36754 ) ( not ( = ?auto_36753 ?auto_36756 ) ) ( not ( = ?auto_36754 ?auto_36756 ) ) ( not ( = ?auto_36752 ?auto_36756 ) ) ( TRUCK-AT ?auto_36760 ?auto_36757 ) ( SURFACE-AT ?auto_36752 ?auto_36757 ) ( CLEAR ?auto_36752 ) ( LIFTING ?auto_36755 ?auto_36753 ) ( IS-CRATE ?auto_36753 ) ( ON ?auto_36749 ?auto_36748 ) ( ON ?auto_36750 ?auto_36749 ) ( ON ?auto_36751 ?auto_36750 ) ( ON ?auto_36752 ?auto_36751 ) ( not ( = ?auto_36748 ?auto_36749 ) ) ( not ( = ?auto_36748 ?auto_36750 ) ) ( not ( = ?auto_36748 ?auto_36751 ) ) ( not ( = ?auto_36748 ?auto_36752 ) ) ( not ( = ?auto_36748 ?auto_36753 ) ) ( not ( = ?auto_36748 ?auto_36754 ) ) ( not ( = ?auto_36748 ?auto_36756 ) ) ( not ( = ?auto_36749 ?auto_36750 ) ) ( not ( = ?auto_36749 ?auto_36751 ) ) ( not ( = ?auto_36749 ?auto_36752 ) ) ( not ( = ?auto_36749 ?auto_36753 ) ) ( not ( = ?auto_36749 ?auto_36754 ) ) ( not ( = ?auto_36749 ?auto_36756 ) ) ( not ( = ?auto_36750 ?auto_36751 ) ) ( not ( = ?auto_36750 ?auto_36752 ) ) ( not ( = ?auto_36750 ?auto_36753 ) ) ( not ( = ?auto_36750 ?auto_36754 ) ) ( not ( = ?auto_36750 ?auto_36756 ) ) ( not ( = ?auto_36751 ?auto_36752 ) ) ( not ( = ?auto_36751 ?auto_36753 ) ) ( not ( = ?auto_36751 ?auto_36754 ) ) ( not ( = ?auto_36751 ?auto_36756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36752 ?auto_36753 ?auto_36754 )
      ( MAKE-6CRATE-VERIFY ?auto_36748 ?auto_36749 ?auto_36750 ?auto_36751 ?auto_36752 ?auto_36753 ?auto_36754 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_36812 - SURFACE
      ?auto_36813 - SURFACE
      ?auto_36814 - SURFACE
      ?auto_36815 - SURFACE
      ?auto_36816 - SURFACE
      ?auto_36817 - SURFACE
      ?auto_36818 - SURFACE
    )
    :vars
    (
      ?auto_36823 - HOIST
      ?auto_36819 - PLACE
      ?auto_36821 - PLACE
      ?auto_36820 - HOIST
      ?auto_36822 - SURFACE
      ?auto_36824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36823 ?auto_36819 ) ( IS-CRATE ?auto_36818 ) ( not ( = ?auto_36817 ?auto_36818 ) ) ( not ( = ?auto_36816 ?auto_36817 ) ) ( not ( = ?auto_36816 ?auto_36818 ) ) ( not ( = ?auto_36821 ?auto_36819 ) ) ( HOIST-AT ?auto_36820 ?auto_36821 ) ( not ( = ?auto_36823 ?auto_36820 ) ) ( AVAILABLE ?auto_36820 ) ( SURFACE-AT ?auto_36818 ?auto_36821 ) ( ON ?auto_36818 ?auto_36822 ) ( CLEAR ?auto_36818 ) ( not ( = ?auto_36817 ?auto_36822 ) ) ( not ( = ?auto_36818 ?auto_36822 ) ) ( not ( = ?auto_36816 ?auto_36822 ) ) ( TRUCK-AT ?auto_36824 ?auto_36819 ) ( SURFACE-AT ?auto_36816 ?auto_36819 ) ( CLEAR ?auto_36816 ) ( IS-CRATE ?auto_36817 ) ( AVAILABLE ?auto_36823 ) ( IN ?auto_36817 ?auto_36824 ) ( ON ?auto_36813 ?auto_36812 ) ( ON ?auto_36814 ?auto_36813 ) ( ON ?auto_36815 ?auto_36814 ) ( ON ?auto_36816 ?auto_36815 ) ( not ( = ?auto_36812 ?auto_36813 ) ) ( not ( = ?auto_36812 ?auto_36814 ) ) ( not ( = ?auto_36812 ?auto_36815 ) ) ( not ( = ?auto_36812 ?auto_36816 ) ) ( not ( = ?auto_36812 ?auto_36817 ) ) ( not ( = ?auto_36812 ?auto_36818 ) ) ( not ( = ?auto_36812 ?auto_36822 ) ) ( not ( = ?auto_36813 ?auto_36814 ) ) ( not ( = ?auto_36813 ?auto_36815 ) ) ( not ( = ?auto_36813 ?auto_36816 ) ) ( not ( = ?auto_36813 ?auto_36817 ) ) ( not ( = ?auto_36813 ?auto_36818 ) ) ( not ( = ?auto_36813 ?auto_36822 ) ) ( not ( = ?auto_36814 ?auto_36815 ) ) ( not ( = ?auto_36814 ?auto_36816 ) ) ( not ( = ?auto_36814 ?auto_36817 ) ) ( not ( = ?auto_36814 ?auto_36818 ) ) ( not ( = ?auto_36814 ?auto_36822 ) ) ( not ( = ?auto_36815 ?auto_36816 ) ) ( not ( = ?auto_36815 ?auto_36817 ) ) ( not ( = ?auto_36815 ?auto_36818 ) ) ( not ( = ?auto_36815 ?auto_36822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36816 ?auto_36817 ?auto_36818 )
      ( MAKE-6CRATE-VERIFY ?auto_36812 ?auto_36813 ?auto_36814 ?auto_36815 ?auto_36816 ?auto_36817 ?auto_36818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_37684 - SURFACE
      ?auto_37685 - SURFACE
    )
    :vars
    (
      ?auto_37691 - HOIST
      ?auto_37690 - PLACE
      ?auto_37692 - SURFACE
      ?auto_37687 - PLACE
      ?auto_37689 - HOIST
      ?auto_37688 - SURFACE
      ?auto_37686 - TRUCK
      ?auto_37693 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37691 ?auto_37690 ) ( SURFACE-AT ?auto_37684 ?auto_37690 ) ( CLEAR ?auto_37684 ) ( IS-CRATE ?auto_37685 ) ( not ( = ?auto_37684 ?auto_37685 ) ) ( ON ?auto_37684 ?auto_37692 ) ( not ( = ?auto_37692 ?auto_37684 ) ) ( not ( = ?auto_37692 ?auto_37685 ) ) ( not ( = ?auto_37687 ?auto_37690 ) ) ( HOIST-AT ?auto_37689 ?auto_37687 ) ( not ( = ?auto_37691 ?auto_37689 ) ) ( AVAILABLE ?auto_37689 ) ( SURFACE-AT ?auto_37685 ?auto_37687 ) ( ON ?auto_37685 ?auto_37688 ) ( CLEAR ?auto_37685 ) ( not ( = ?auto_37684 ?auto_37688 ) ) ( not ( = ?auto_37685 ?auto_37688 ) ) ( not ( = ?auto_37692 ?auto_37688 ) ) ( TRUCK-AT ?auto_37686 ?auto_37690 ) ( LIFTING ?auto_37691 ?auto_37693 ) ( IS-CRATE ?auto_37693 ) ( not ( = ?auto_37684 ?auto_37693 ) ) ( not ( = ?auto_37685 ?auto_37693 ) ) ( not ( = ?auto_37692 ?auto_37693 ) ) ( not ( = ?auto_37688 ?auto_37693 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37691 ?auto_37693 ?auto_37686 ?auto_37690 )
      ( MAKE-1CRATE ?auto_37684 ?auto_37685 )
      ( MAKE-1CRATE-VERIFY ?auto_37684 ?auto_37685 ) )
  )

)

