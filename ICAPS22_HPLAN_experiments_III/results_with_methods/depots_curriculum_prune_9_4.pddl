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

  ( :method MAKE-8CRATE-VERIFY
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
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
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
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6286 - SURFACE
      ?auto_6287 - SURFACE
    )
    :vars
    (
      ?auto_6288 - HOIST
      ?auto_6289 - PLACE
      ?auto_6291 - PLACE
      ?auto_6292 - HOIST
      ?auto_6293 - SURFACE
      ?auto_6290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6288 ?auto_6289 ) ( SURFACE-AT ?auto_6286 ?auto_6289 ) ( CLEAR ?auto_6286 ) ( IS-CRATE ?auto_6287 ) ( AVAILABLE ?auto_6288 ) ( not ( = ?auto_6291 ?auto_6289 ) ) ( HOIST-AT ?auto_6292 ?auto_6291 ) ( AVAILABLE ?auto_6292 ) ( SURFACE-AT ?auto_6287 ?auto_6291 ) ( ON ?auto_6287 ?auto_6293 ) ( CLEAR ?auto_6287 ) ( TRUCK-AT ?auto_6290 ?auto_6289 ) ( not ( = ?auto_6286 ?auto_6287 ) ) ( not ( = ?auto_6286 ?auto_6293 ) ) ( not ( = ?auto_6287 ?auto_6293 ) ) ( not ( = ?auto_6288 ?auto_6292 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6290 ?auto_6289 ?auto_6291 )
      ( !LIFT ?auto_6292 ?auto_6287 ?auto_6293 ?auto_6291 )
      ( !LOAD ?auto_6292 ?auto_6287 ?auto_6290 ?auto_6291 )
      ( !DRIVE ?auto_6290 ?auto_6291 ?auto_6289 )
      ( !UNLOAD ?auto_6288 ?auto_6287 ?auto_6290 ?auto_6289 )
      ( !DROP ?auto_6288 ?auto_6287 ?auto_6286 ?auto_6289 )
      ( MAKE-1CRATE-VERIFY ?auto_6286 ?auto_6287 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6307 - SURFACE
      ?auto_6308 - SURFACE
      ?auto_6309 - SURFACE
    )
    :vars
    (
      ?auto_6313 - HOIST
      ?auto_6312 - PLACE
      ?auto_6315 - PLACE
      ?auto_6314 - HOIST
      ?auto_6310 - SURFACE
      ?auto_6316 - PLACE
      ?auto_6318 - HOIST
      ?auto_6317 - SURFACE
      ?auto_6311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6313 ?auto_6312 ) ( IS-CRATE ?auto_6309 ) ( not ( = ?auto_6315 ?auto_6312 ) ) ( HOIST-AT ?auto_6314 ?auto_6315 ) ( AVAILABLE ?auto_6314 ) ( SURFACE-AT ?auto_6309 ?auto_6315 ) ( ON ?auto_6309 ?auto_6310 ) ( CLEAR ?auto_6309 ) ( not ( = ?auto_6308 ?auto_6309 ) ) ( not ( = ?auto_6308 ?auto_6310 ) ) ( not ( = ?auto_6309 ?auto_6310 ) ) ( not ( = ?auto_6313 ?auto_6314 ) ) ( SURFACE-AT ?auto_6307 ?auto_6312 ) ( CLEAR ?auto_6307 ) ( IS-CRATE ?auto_6308 ) ( AVAILABLE ?auto_6313 ) ( not ( = ?auto_6316 ?auto_6312 ) ) ( HOIST-AT ?auto_6318 ?auto_6316 ) ( AVAILABLE ?auto_6318 ) ( SURFACE-AT ?auto_6308 ?auto_6316 ) ( ON ?auto_6308 ?auto_6317 ) ( CLEAR ?auto_6308 ) ( TRUCK-AT ?auto_6311 ?auto_6312 ) ( not ( = ?auto_6307 ?auto_6308 ) ) ( not ( = ?auto_6307 ?auto_6317 ) ) ( not ( = ?auto_6308 ?auto_6317 ) ) ( not ( = ?auto_6313 ?auto_6318 ) ) ( not ( = ?auto_6307 ?auto_6309 ) ) ( not ( = ?auto_6307 ?auto_6310 ) ) ( not ( = ?auto_6309 ?auto_6317 ) ) ( not ( = ?auto_6315 ?auto_6316 ) ) ( not ( = ?auto_6314 ?auto_6318 ) ) ( not ( = ?auto_6310 ?auto_6317 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6307 ?auto_6308 )
      ( MAKE-1CRATE ?auto_6308 ?auto_6309 )
      ( MAKE-2CRATE-VERIFY ?auto_6307 ?auto_6308 ?auto_6309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6333 - SURFACE
      ?auto_6334 - SURFACE
      ?auto_6335 - SURFACE
      ?auto_6336 - SURFACE
    )
    :vars
    (
      ?auto_6342 - HOIST
      ?auto_6338 - PLACE
      ?auto_6340 - PLACE
      ?auto_6341 - HOIST
      ?auto_6337 - SURFACE
      ?auto_6348 - PLACE
      ?auto_6347 - HOIST
      ?auto_6346 - SURFACE
      ?auto_6343 - PLACE
      ?auto_6345 - HOIST
      ?auto_6344 - SURFACE
      ?auto_6339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6342 ?auto_6338 ) ( IS-CRATE ?auto_6336 ) ( not ( = ?auto_6340 ?auto_6338 ) ) ( HOIST-AT ?auto_6341 ?auto_6340 ) ( AVAILABLE ?auto_6341 ) ( SURFACE-AT ?auto_6336 ?auto_6340 ) ( ON ?auto_6336 ?auto_6337 ) ( CLEAR ?auto_6336 ) ( not ( = ?auto_6335 ?auto_6336 ) ) ( not ( = ?auto_6335 ?auto_6337 ) ) ( not ( = ?auto_6336 ?auto_6337 ) ) ( not ( = ?auto_6342 ?auto_6341 ) ) ( IS-CRATE ?auto_6335 ) ( not ( = ?auto_6348 ?auto_6338 ) ) ( HOIST-AT ?auto_6347 ?auto_6348 ) ( AVAILABLE ?auto_6347 ) ( SURFACE-AT ?auto_6335 ?auto_6348 ) ( ON ?auto_6335 ?auto_6346 ) ( CLEAR ?auto_6335 ) ( not ( = ?auto_6334 ?auto_6335 ) ) ( not ( = ?auto_6334 ?auto_6346 ) ) ( not ( = ?auto_6335 ?auto_6346 ) ) ( not ( = ?auto_6342 ?auto_6347 ) ) ( SURFACE-AT ?auto_6333 ?auto_6338 ) ( CLEAR ?auto_6333 ) ( IS-CRATE ?auto_6334 ) ( AVAILABLE ?auto_6342 ) ( not ( = ?auto_6343 ?auto_6338 ) ) ( HOIST-AT ?auto_6345 ?auto_6343 ) ( AVAILABLE ?auto_6345 ) ( SURFACE-AT ?auto_6334 ?auto_6343 ) ( ON ?auto_6334 ?auto_6344 ) ( CLEAR ?auto_6334 ) ( TRUCK-AT ?auto_6339 ?auto_6338 ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( not ( = ?auto_6333 ?auto_6344 ) ) ( not ( = ?auto_6334 ?auto_6344 ) ) ( not ( = ?auto_6342 ?auto_6345 ) ) ( not ( = ?auto_6333 ?auto_6335 ) ) ( not ( = ?auto_6333 ?auto_6346 ) ) ( not ( = ?auto_6335 ?auto_6344 ) ) ( not ( = ?auto_6348 ?auto_6343 ) ) ( not ( = ?auto_6347 ?auto_6345 ) ) ( not ( = ?auto_6346 ?auto_6344 ) ) ( not ( = ?auto_6333 ?auto_6336 ) ) ( not ( = ?auto_6333 ?auto_6337 ) ) ( not ( = ?auto_6334 ?auto_6336 ) ) ( not ( = ?auto_6334 ?auto_6337 ) ) ( not ( = ?auto_6336 ?auto_6346 ) ) ( not ( = ?auto_6336 ?auto_6344 ) ) ( not ( = ?auto_6340 ?auto_6348 ) ) ( not ( = ?auto_6340 ?auto_6343 ) ) ( not ( = ?auto_6341 ?auto_6347 ) ) ( not ( = ?auto_6341 ?auto_6345 ) ) ( not ( = ?auto_6337 ?auto_6346 ) ) ( not ( = ?auto_6337 ?auto_6344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6333 ?auto_6334 ?auto_6335 )
      ( MAKE-1CRATE ?auto_6335 ?auto_6336 )
      ( MAKE-3CRATE-VERIFY ?auto_6333 ?auto_6334 ?auto_6335 ?auto_6336 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6364 - SURFACE
      ?auto_6365 - SURFACE
      ?auto_6366 - SURFACE
      ?auto_6367 - SURFACE
      ?auto_6368 - SURFACE
    )
    :vars
    (
      ?auto_6369 - HOIST
      ?auto_6370 - PLACE
      ?auto_6374 - PLACE
      ?auto_6371 - HOIST
      ?auto_6373 - SURFACE
      ?auto_6379 - PLACE
      ?auto_6378 - HOIST
      ?auto_6377 - SURFACE
      ?auto_6376 - SURFACE
      ?auto_6380 - PLACE
      ?auto_6375 - HOIST
      ?auto_6381 - SURFACE
      ?auto_6372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6369 ?auto_6370 ) ( IS-CRATE ?auto_6368 ) ( not ( = ?auto_6374 ?auto_6370 ) ) ( HOIST-AT ?auto_6371 ?auto_6374 ) ( SURFACE-AT ?auto_6368 ?auto_6374 ) ( ON ?auto_6368 ?auto_6373 ) ( CLEAR ?auto_6368 ) ( not ( = ?auto_6367 ?auto_6368 ) ) ( not ( = ?auto_6367 ?auto_6373 ) ) ( not ( = ?auto_6368 ?auto_6373 ) ) ( not ( = ?auto_6369 ?auto_6371 ) ) ( IS-CRATE ?auto_6367 ) ( not ( = ?auto_6379 ?auto_6370 ) ) ( HOIST-AT ?auto_6378 ?auto_6379 ) ( AVAILABLE ?auto_6378 ) ( SURFACE-AT ?auto_6367 ?auto_6379 ) ( ON ?auto_6367 ?auto_6377 ) ( CLEAR ?auto_6367 ) ( not ( = ?auto_6366 ?auto_6367 ) ) ( not ( = ?auto_6366 ?auto_6377 ) ) ( not ( = ?auto_6367 ?auto_6377 ) ) ( not ( = ?auto_6369 ?auto_6378 ) ) ( IS-CRATE ?auto_6366 ) ( AVAILABLE ?auto_6371 ) ( SURFACE-AT ?auto_6366 ?auto_6374 ) ( ON ?auto_6366 ?auto_6376 ) ( CLEAR ?auto_6366 ) ( not ( = ?auto_6365 ?auto_6366 ) ) ( not ( = ?auto_6365 ?auto_6376 ) ) ( not ( = ?auto_6366 ?auto_6376 ) ) ( SURFACE-AT ?auto_6364 ?auto_6370 ) ( CLEAR ?auto_6364 ) ( IS-CRATE ?auto_6365 ) ( AVAILABLE ?auto_6369 ) ( not ( = ?auto_6380 ?auto_6370 ) ) ( HOIST-AT ?auto_6375 ?auto_6380 ) ( AVAILABLE ?auto_6375 ) ( SURFACE-AT ?auto_6365 ?auto_6380 ) ( ON ?auto_6365 ?auto_6381 ) ( CLEAR ?auto_6365 ) ( TRUCK-AT ?auto_6372 ?auto_6370 ) ( not ( = ?auto_6364 ?auto_6365 ) ) ( not ( = ?auto_6364 ?auto_6381 ) ) ( not ( = ?auto_6365 ?auto_6381 ) ) ( not ( = ?auto_6369 ?auto_6375 ) ) ( not ( = ?auto_6364 ?auto_6366 ) ) ( not ( = ?auto_6364 ?auto_6376 ) ) ( not ( = ?auto_6366 ?auto_6381 ) ) ( not ( = ?auto_6374 ?auto_6380 ) ) ( not ( = ?auto_6371 ?auto_6375 ) ) ( not ( = ?auto_6376 ?auto_6381 ) ) ( not ( = ?auto_6364 ?auto_6367 ) ) ( not ( = ?auto_6364 ?auto_6377 ) ) ( not ( = ?auto_6365 ?auto_6367 ) ) ( not ( = ?auto_6365 ?auto_6377 ) ) ( not ( = ?auto_6367 ?auto_6376 ) ) ( not ( = ?auto_6367 ?auto_6381 ) ) ( not ( = ?auto_6379 ?auto_6374 ) ) ( not ( = ?auto_6379 ?auto_6380 ) ) ( not ( = ?auto_6378 ?auto_6371 ) ) ( not ( = ?auto_6378 ?auto_6375 ) ) ( not ( = ?auto_6377 ?auto_6376 ) ) ( not ( = ?auto_6377 ?auto_6381 ) ) ( not ( = ?auto_6364 ?auto_6368 ) ) ( not ( = ?auto_6364 ?auto_6373 ) ) ( not ( = ?auto_6365 ?auto_6368 ) ) ( not ( = ?auto_6365 ?auto_6373 ) ) ( not ( = ?auto_6366 ?auto_6368 ) ) ( not ( = ?auto_6366 ?auto_6373 ) ) ( not ( = ?auto_6368 ?auto_6377 ) ) ( not ( = ?auto_6368 ?auto_6376 ) ) ( not ( = ?auto_6368 ?auto_6381 ) ) ( not ( = ?auto_6373 ?auto_6377 ) ) ( not ( = ?auto_6373 ?auto_6376 ) ) ( not ( = ?auto_6373 ?auto_6381 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6364 ?auto_6365 ?auto_6366 ?auto_6367 )
      ( MAKE-1CRATE ?auto_6367 ?auto_6368 )
      ( MAKE-4CRATE-VERIFY ?auto_6364 ?auto_6365 ?auto_6366 ?auto_6367 ?auto_6368 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6398 - SURFACE
      ?auto_6399 - SURFACE
      ?auto_6400 - SURFACE
      ?auto_6401 - SURFACE
      ?auto_6402 - SURFACE
      ?auto_6403 - SURFACE
    )
    :vars
    (
      ?auto_6408 - HOIST
      ?auto_6406 - PLACE
      ?auto_6404 - PLACE
      ?auto_6405 - HOIST
      ?auto_6409 - SURFACE
      ?auto_6411 - PLACE
      ?auto_6414 - HOIST
      ?auto_6415 - SURFACE
      ?auto_6416 - PLACE
      ?auto_6410 - HOIST
      ?auto_6418 - SURFACE
      ?auto_6413 - SURFACE
      ?auto_6417 - PLACE
      ?auto_6419 - HOIST
      ?auto_6412 - SURFACE
      ?auto_6407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6408 ?auto_6406 ) ( IS-CRATE ?auto_6403 ) ( not ( = ?auto_6404 ?auto_6406 ) ) ( HOIST-AT ?auto_6405 ?auto_6404 ) ( AVAILABLE ?auto_6405 ) ( SURFACE-AT ?auto_6403 ?auto_6404 ) ( ON ?auto_6403 ?auto_6409 ) ( CLEAR ?auto_6403 ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6409 ) ) ( not ( = ?auto_6403 ?auto_6409 ) ) ( not ( = ?auto_6408 ?auto_6405 ) ) ( IS-CRATE ?auto_6402 ) ( not ( = ?auto_6411 ?auto_6406 ) ) ( HOIST-AT ?auto_6414 ?auto_6411 ) ( SURFACE-AT ?auto_6402 ?auto_6411 ) ( ON ?auto_6402 ?auto_6415 ) ( CLEAR ?auto_6402 ) ( not ( = ?auto_6401 ?auto_6402 ) ) ( not ( = ?auto_6401 ?auto_6415 ) ) ( not ( = ?auto_6402 ?auto_6415 ) ) ( not ( = ?auto_6408 ?auto_6414 ) ) ( IS-CRATE ?auto_6401 ) ( not ( = ?auto_6416 ?auto_6406 ) ) ( HOIST-AT ?auto_6410 ?auto_6416 ) ( AVAILABLE ?auto_6410 ) ( SURFACE-AT ?auto_6401 ?auto_6416 ) ( ON ?auto_6401 ?auto_6418 ) ( CLEAR ?auto_6401 ) ( not ( = ?auto_6400 ?auto_6401 ) ) ( not ( = ?auto_6400 ?auto_6418 ) ) ( not ( = ?auto_6401 ?auto_6418 ) ) ( not ( = ?auto_6408 ?auto_6410 ) ) ( IS-CRATE ?auto_6400 ) ( AVAILABLE ?auto_6414 ) ( SURFACE-AT ?auto_6400 ?auto_6411 ) ( ON ?auto_6400 ?auto_6413 ) ( CLEAR ?auto_6400 ) ( not ( = ?auto_6399 ?auto_6400 ) ) ( not ( = ?auto_6399 ?auto_6413 ) ) ( not ( = ?auto_6400 ?auto_6413 ) ) ( SURFACE-AT ?auto_6398 ?auto_6406 ) ( CLEAR ?auto_6398 ) ( IS-CRATE ?auto_6399 ) ( AVAILABLE ?auto_6408 ) ( not ( = ?auto_6417 ?auto_6406 ) ) ( HOIST-AT ?auto_6419 ?auto_6417 ) ( AVAILABLE ?auto_6419 ) ( SURFACE-AT ?auto_6399 ?auto_6417 ) ( ON ?auto_6399 ?auto_6412 ) ( CLEAR ?auto_6399 ) ( TRUCK-AT ?auto_6407 ?auto_6406 ) ( not ( = ?auto_6398 ?auto_6399 ) ) ( not ( = ?auto_6398 ?auto_6412 ) ) ( not ( = ?auto_6399 ?auto_6412 ) ) ( not ( = ?auto_6408 ?auto_6419 ) ) ( not ( = ?auto_6398 ?auto_6400 ) ) ( not ( = ?auto_6398 ?auto_6413 ) ) ( not ( = ?auto_6400 ?auto_6412 ) ) ( not ( = ?auto_6411 ?auto_6417 ) ) ( not ( = ?auto_6414 ?auto_6419 ) ) ( not ( = ?auto_6413 ?auto_6412 ) ) ( not ( = ?auto_6398 ?auto_6401 ) ) ( not ( = ?auto_6398 ?auto_6418 ) ) ( not ( = ?auto_6399 ?auto_6401 ) ) ( not ( = ?auto_6399 ?auto_6418 ) ) ( not ( = ?auto_6401 ?auto_6413 ) ) ( not ( = ?auto_6401 ?auto_6412 ) ) ( not ( = ?auto_6416 ?auto_6411 ) ) ( not ( = ?auto_6416 ?auto_6417 ) ) ( not ( = ?auto_6410 ?auto_6414 ) ) ( not ( = ?auto_6410 ?auto_6419 ) ) ( not ( = ?auto_6418 ?auto_6413 ) ) ( not ( = ?auto_6418 ?auto_6412 ) ) ( not ( = ?auto_6398 ?auto_6402 ) ) ( not ( = ?auto_6398 ?auto_6415 ) ) ( not ( = ?auto_6399 ?auto_6402 ) ) ( not ( = ?auto_6399 ?auto_6415 ) ) ( not ( = ?auto_6400 ?auto_6402 ) ) ( not ( = ?auto_6400 ?auto_6415 ) ) ( not ( = ?auto_6402 ?auto_6418 ) ) ( not ( = ?auto_6402 ?auto_6413 ) ) ( not ( = ?auto_6402 ?auto_6412 ) ) ( not ( = ?auto_6415 ?auto_6418 ) ) ( not ( = ?auto_6415 ?auto_6413 ) ) ( not ( = ?auto_6415 ?auto_6412 ) ) ( not ( = ?auto_6398 ?auto_6403 ) ) ( not ( = ?auto_6398 ?auto_6409 ) ) ( not ( = ?auto_6399 ?auto_6403 ) ) ( not ( = ?auto_6399 ?auto_6409 ) ) ( not ( = ?auto_6400 ?auto_6403 ) ) ( not ( = ?auto_6400 ?auto_6409 ) ) ( not ( = ?auto_6401 ?auto_6403 ) ) ( not ( = ?auto_6401 ?auto_6409 ) ) ( not ( = ?auto_6403 ?auto_6415 ) ) ( not ( = ?auto_6403 ?auto_6418 ) ) ( not ( = ?auto_6403 ?auto_6413 ) ) ( not ( = ?auto_6403 ?auto_6412 ) ) ( not ( = ?auto_6404 ?auto_6411 ) ) ( not ( = ?auto_6404 ?auto_6416 ) ) ( not ( = ?auto_6404 ?auto_6417 ) ) ( not ( = ?auto_6405 ?auto_6414 ) ) ( not ( = ?auto_6405 ?auto_6410 ) ) ( not ( = ?auto_6405 ?auto_6419 ) ) ( not ( = ?auto_6409 ?auto_6415 ) ) ( not ( = ?auto_6409 ?auto_6418 ) ) ( not ( = ?auto_6409 ?auto_6413 ) ) ( not ( = ?auto_6409 ?auto_6412 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6398 ?auto_6399 ?auto_6400 ?auto_6401 ?auto_6402 )
      ( MAKE-1CRATE ?auto_6402 ?auto_6403 )
      ( MAKE-5CRATE-VERIFY ?auto_6398 ?auto_6399 ?auto_6400 ?auto_6401 ?auto_6402 ?auto_6403 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6437 - SURFACE
      ?auto_6438 - SURFACE
      ?auto_6439 - SURFACE
      ?auto_6440 - SURFACE
      ?auto_6441 - SURFACE
      ?auto_6442 - SURFACE
      ?auto_6443 - SURFACE
    )
    :vars
    (
      ?auto_6448 - HOIST
      ?auto_6449 - PLACE
      ?auto_6445 - PLACE
      ?auto_6446 - HOIST
      ?auto_6444 - SURFACE
      ?auto_6462 - PLACE
      ?auto_6461 - HOIST
      ?auto_6450 - SURFACE
      ?auto_6454 - PLACE
      ?auto_6460 - HOIST
      ?auto_6459 - SURFACE
      ?auto_6455 - PLACE
      ?auto_6456 - HOIST
      ?auto_6451 - SURFACE
      ?auto_6457 - SURFACE
      ?auto_6452 - PLACE
      ?auto_6453 - HOIST
      ?auto_6458 - SURFACE
      ?auto_6447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6448 ?auto_6449 ) ( IS-CRATE ?auto_6443 ) ( not ( = ?auto_6445 ?auto_6449 ) ) ( HOIST-AT ?auto_6446 ?auto_6445 ) ( AVAILABLE ?auto_6446 ) ( SURFACE-AT ?auto_6443 ?auto_6445 ) ( ON ?auto_6443 ?auto_6444 ) ( CLEAR ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6448 ?auto_6446 ) ) ( IS-CRATE ?auto_6442 ) ( not ( = ?auto_6462 ?auto_6449 ) ) ( HOIST-AT ?auto_6461 ?auto_6462 ) ( AVAILABLE ?auto_6461 ) ( SURFACE-AT ?auto_6442 ?auto_6462 ) ( ON ?auto_6442 ?auto_6450 ) ( CLEAR ?auto_6442 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6450 ) ) ( not ( = ?auto_6442 ?auto_6450 ) ) ( not ( = ?auto_6448 ?auto_6461 ) ) ( IS-CRATE ?auto_6441 ) ( not ( = ?auto_6454 ?auto_6449 ) ) ( HOIST-AT ?auto_6460 ?auto_6454 ) ( SURFACE-AT ?auto_6441 ?auto_6454 ) ( ON ?auto_6441 ?auto_6459 ) ( CLEAR ?auto_6441 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6459 ) ) ( not ( = ?auto_6441 ?auto_6459 ) ) ( not ( = ?auto_6448 ?auto_6460 ) ) ( IS-CRATE ?auto_6440 ) ( not ( = ?auto_6455 ?auto_6449 ) ) ( HOIST-AT ?auto_6456 ?auto_6455 ) ( AVAILABLE ?auto_6456 ) ( SURFACE-AT ?auto_6440 ?auto_6455 ) ( ON ?auto_6440 ?auto_6451 ) ( CLEAR ?auto_6440 ) ( not ( = ?auto_6439 ?auto_6440 ) ) ( not ( = ?auto_6439 ?auto_6451 ) ) ( not ( = ?auto_6440 ?auto_6451 ) ) ( not ( = ?auto_6448 ?auto_6456 ) ) ( IS-CRATE ?auto_6439 ) ( AVAILABLE ?auto_6460 ) ( SURFACE-AT ?auto_6439 ?auto_6454 ) ( ON ?auto_6439 ?auto_6457 ) ( CLEAR ?auto_6439 ) ( not ( = ?auto_6438 ?auto_6439 ) ) ( not ( = ?auto_6438 ?auto_6457 ) ) ( not ( = ?auto_6439 ?auto_6457 ) ) ( SURFACE-AT ?auto_6437 ?auto_6449 ) ( CLEAR ?auto_6437 ) ( IS-CRATE ?auto_6438 ) ( AVAILABLE ?auto_6448 ) ( not ( = ?auto_6452 ?auto_6449 ) ) ( HOIST-AT ?auto_6453 ?auto_6452 ) ( AVAILABLE ?auto_6453 ) ( SURFACE-AT ?auto_6438 ?auto_6452 ) ( ON ?auto_6438 ?auto_6458 ) ( CLEAR ?auto_6438 ) ( TRUCK-AT ?auto_6447 ?auto_6449 ) ( not ( = ?auto_6437 ?auto_6438 ) ) ( not ( = ?auto_6437 ?auto_6458 ) ) ( not ( = ?auto_6438 ?auto_6458 ) ) ( not ( = ?auto_6448 ?auto_6453 ) ) ( not ( = ?auto_6437 ?auto_6439 ) ) ( not ( = ?auto_6437 ?auto_6457 ) ) ( not ( = ?auto_6439 ?auto_6458 ) ) ( not ( = ?auto_6454 ?auto_6452 ) ) ( not ( = ?auto_6460 ?auto_6453 ) ) ( not ( = ?auto_6457 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6440 ) ) ( not ( = ?auto_6437 ?auto_6451 ) ) ( not ( = ?auto_6438 ?auto_6440 ) ) ( not ( = ?auto_6438 ?auto_6451 ) ) ( not ( = ?auto_6440 ?auto_6457 ) ) ( not ( = ?auto_6440 ?auto_6458 ) ) ( not ( = ?auto_6455 ?auto_6454 ) ) ( not ( = ?auto_6455 ?auto_6452 ) ) ( not ( = ?auto_6456 ?auto_6460 ) ) ( not ( = ?auto_6456 ?auto_6453 ) ) ( not ( = ?auto_6451 ?auto_6457 ) ) ( not ( = ?auto_6451 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6441 ) ) ( not ( = ?auto_6437 ?auto_6459 ) ) ( not ( = ?auto_6438 ?auto_6441 ) ) ( not ( = ?auto_6438 ?auto_6459 ) ) ( not ( = ?auto_6439 ?auto_6441 ) ) ( not ( = ?auto_6439 ?auto_6459 ) ) ( not ( = ?auto_6441 ?auto_6451 ) ) ( not ( = ?auto_6441 ?auto_6457 ) ) ( not ( = ?auto_6441 ?auto_6458 ) ) ( not ( = ?auto_6459 ?auto_6451 ) ) ( not ( = ?auto_6459 ?auto_6457 ) ) ( not ( = ?auto_6459 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6442 ) ) ( not ( = ?auto_6437 ?auto_6450 ) ) ( not ( = ?auto_6438 ?auto_6442 ) ) ( not ( = ?auto_6438 ?auto_6450 ) ) ( not ( = ?auto_6439 ?auto_6442 ) ) ( not ( = ?auto_6439 ?auto_6450 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6450 ) ) ( not ( = ?auto_6442 ?auto_6459 ) ) ( not ( = ?auto_6442 ?auto_6451 ) ) ( not ( = ?auto_6442 ?auto_6457 ) ) ( not ( = ?auto_6442 ?auto_6458 ) ) ( not ( = ?auto_6462 ?auto_6454 ) ) ( not ( = ?auto_6462 ?auto_6455 ) ) ( not ( = ?auto_6462 ?auto_6452 ) ) ( not ( = ?auto_6461 ?auto_6460 ) ) ( not ( = ?auto_6461 ?auto_6456 ) ) ( not ( = ?auto_6461 ?auto_6453 ) ) ( not ( = ?auto_6450 ?auto_6459 ) ) ( not ( = ?auto_6450 ?auto_6451 ) ) ( not ( = ?auto_6450 ?auto_6457 ) ) ( not ( = ?auto_6450 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6443 ) ) ( not ( = ?auto_6437 ?auto_6444 ) ) ( not ( = ?auto_6438 ?auto_6443 ) ) ( not ( = ?auto_6438 ?auto_6444 ) ) ( not ( = ?auto_6439 ?auto_6443 ) ) ( not ( = ?auto_6439 ?auto_6444 ) ) ( not ( = ?auto_6440 ?auto_6443 ) ) ( not ( = ?auto_6440 ?auto_6444 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6450 ) ) ( not ( = ?auto_6443 ?auto_6459 ) ) ( not ( = ?auto_6443 ?auto_6451 ) ) ( not ( = ?auto_6443 ?auto_6457 ) ) ( not ( = ?auto_6443 ?auto_6458 ) ) ( not ( = ?auto_6445 ?auto_6462 ) ) ( not ( = ?auto_6445 ?auto_6454 ) ) ( not ( = ?auto_6445 ?auto_6455 ) ) ( not ( = ?auto_6445 ?auto_6452 ) ) ( not ( = ?auto_6446 ?auto_6461 ) ) ( not ( = ?auto_6446 ?auto_6460 ) ) ( not ( = ?auto_6446 ?auto_6456 ) ) ( not ( = ?auto_6446 ?auto_6453 ) ) ( not ( = ?auto_6444 ?auto_6450 ) ) ( not ( = ?auto_6444 ?auto_6459 ) ) ( not ( = ?auto_6444 ?auto_6451 ) ) ( not ( = ?auto_6444 ?auto_6457 ) ) ( not ( = ?auto_6444 ?auto_6458 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6437 ?auto_6438 ?auto_6439 ?auto_6440 ?auto_6441 ?auto_6442 )
      ( MAKE-1CRATE ?auto_6442 ?auto_6443 )
      ( MAKE-6CRATE-VERIFY ?auto_6437 ?auto_6438 ?auto_6439 ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6481 - SURFACE
      ?auto_6482 - SURFACE
      ?auto_6483 - SURFACE
      ?auto_6484 - SURFACE
      ?auto_6485 - SURFACE
      ?auto_6486 - SURFACE
      ?auto_6487 - SURFACE
      ?auto_6488 - SURFACE
    )
    :vars
    (
      ?auto_6492 - HOIST
      ?auto_6494 - PLACE
      ?auto_6489 - PLACE
      ?auto_6490 - HOIST
      ?auto_6491 - SURFACE
      ?auto_6496 - SURFACE
      ?auto_6508 - PLACE
      ?auto_6505 - HOIST
      ?auto_6507 - SURFACE
      ?auto_6499 - PLACE
      ?auto_6503 - HOIST
      ?auto_6495 - SURFACE
      ?auto_6500 - PLACE
      ?auto_6504 - HOIST
      ?auto_6498 - SURFACE
      ?auto_6506 - SURFACE
      ?auto_6497 - PLACE
      ?auto_6501 - HOIST
      ?auto_6502 - SURFACE
      ?auto_6493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6492 ?auto_6494 ) ( IS-CRATE ?auto_6488 ) ( not ( = ?auto_6489 ?auto_6494 ) ) ( HOIST-AT ?auto_6490 ?auto_6489 ) ( SURFACE-AT ?auto_6488 ?auto_6489 ) ( ON ?auto_6488 ?auto_6491 ) ( CLEAR ?auto_6488 ) ( not ( = ?auto_6487 ?auto_6488 ) ) ( not ( = ?auto_6487 ?auto_6491 ) ) ( not ( = ?auto_6488 ?auto_6491 ) ) ( not ( = ?auto_6492 ?auto_6490 ) ) ( IS-CRATE ?auto_6487 ) ( AVAILABLE ?auto_6490 ) ( SURFACE-AT ?auto_6487 ?auto_6489 ) ( ON ?auto_6487 ?auto_6496 ) ( CLEAR ?auto_6487 ) ( not ( = ?auto_6486 ?auto_6487 ) ) ( not ( = ?auto_6486 ?auto_6496 ) ) ( not ( = ?auto_6487 ?auto_6496 ) ) ( IS-CRATE ?auto_6486 ) ( not ( = ?auto_6508 ?auto_6494 ) ) ( HOIST-AT ?auto_6505 ?auto_6508 ) ( AVAILABLE ?auto_6505 ) ( SURFACE-AT ?auto_6486 ?auto_6508 ) ( ON ?auto_6486 ?auto_6507 ) ( CLEAR ?auto_6486 ) ( not ( = ?auto_6485 ?auto_6486 ) ) ( not ( = ?auto_6485 ?auto_6507 ) ) ( not ( = ?auto_6486 ?auto_6507 ) ) ( not ( = ?auto_6492 ?auto_6505 ) ) ( IS-CRATE ?auto_6485 ) ( not ( = ?auto_6499 ?auto_6494 ) ) ( HOIST-AT ?auto_6503 ?auto_6499 ) ( SURFACE-AT ?auto_6485 ?auto_6499 ) ( ON ?auto_6485 ?auto_6495 ) ( CLEAR ?auto_6485 ) ( not ( = ?auto_6484 ?auto_6485 ) ) ( not ( = ?auto_6484 ?auto_6495 ) ) ( not ( = ?auto_6485 ?auto_6495 ) ) ( not ( = ?auto_6492 ?auto_6503 ) ) ( IS-CRATE ?auto_6484 ) ( not ( = ?auto_6500 ?auto_6494 ) ) ( HOIST-AT ?auto_6504 ?auto_6500 ) ( AVAILABLE ?auto_6504 ) ( SURFACE-AT ?auto_6484 ?auto_6500 ) ( ON ?auto_6484 ?auto_6498 ) ( CLEAR ?auto_6484 ) ( not ( = ?auto_6483 ?auto_6484 ) ) ( not ( = ?auto_6483 ?auto_6498 ) ) ( not ( = ?auto_6484 ?auto_6498 ) ) ( not ( = ?auto_6492 ?auto_6504 ) ) ( IS-CRATE ?auto_6483 ) ( AVAILABLE ?auto_6503 ) ( SURFACE-AT ?auto_6483 ?auto_6499 ) ( ON ?auto_6483 ?auto_6506 ) ( CLEAR ?auto_6483 ) ( not ( = ?auto_6482 ?auto_6483 ) ) ( not ( = ?auto_6482 ?auto_6506 ) ) ( not ( = ?auto_6483 ?auto_6506 ) ) ( SURFACE-AT ?auto_6481 ?auto_6494 ) ( CLEAR ?auto_6481 ) ( IS-CRATE ?auto_6482 ) ( AVAILABLE ?auto_6492 ) ( not ( = ?auto_6497 ?auto_6494 ) ) ( HOIST-AT ?auto_6501 ?auto_6497 ) ( AVAILABLE ?auto_6501 ) ( SURFACE-AT ?auto_6482 ?auto_6497 ) ( ON ?auto_6482 ?auto_6502 ) ( CLEAR ?auto_6482 ) ( TRUCK-AT ?auto_6493 ?auto_6494 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( not ( = ?auto_6481 ?auto_6502 ) ) ( not ( = ?auto_6482 ?auto_6502 ) ) ( not ( = ?auto_6492 ?auto_6501 ) ) ( not ( = ?auto_6481 ?auto_6483 ) ) ( not ( = ?auto_6481 ?auto_6506 ) ) ( not ( = ?auto_6483 ?auto_6502 ) ) ( not ( = ?auto_6499 ?auto_6497 ) ) ( not ( = ?auto_6503 ?auto_6501 ) ) ( not ( = ?auto_6506 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6484 ) ) ( not ( = ?auto_6481 ?auto_6498 ) ) ( not ( = ?auto_6482 ?auto_6484 ) ) ( not ( = ?auto_6482 ?auto_6498 ) ) ( not ( = ?auto_6484 ?auto_6506 ) ) ( not ( = ?auto_6484 ?auto_6502 ) ) ( not ( = ?auto_6500 ?auto_6499 ) ) ( not ( = ?auto_6500 ?auto_6497 ) ) ( not ( = ?auto_6504 ?auto_6503 ) ) ( not ( = ?auto_6504 ?auto_6501 ) ) ( not ( = ?auto_6498 ?auto_6506 ) ) ( not ( = ?auto_6498 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6485 ) ) ( not ( = ?auto_6481 ?auto_6495 ) ) ( not ( = ?auto_6482 ?auto_6485 ) ) ( not ( = ?auto_6482 ?auto_6495 ) ) ( not ( = ?auto_6483 ?auto_6485 ) ) ( not ( = ?auto_6483 ?auto_6495 ) ) ( not ( = ?auto_6485 ?auto_6498 ) ) ( not ( = ?auto_6485 ?auto_6506 ) ) ( not ( = ?auto_6485 ?auto_6502 ) ) ( not ( = ?auto_6495 ?auto_6498 ) ) ( not ( = ?auto_6495 ?auto_6506 ) ) ( not ( = ?auto_6495 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6486 ) ) ( not ( = ?auto_6481 ?auto_6507 ) ) ( not ( = ?auto_6482 ?auto_6486 ) ) ( not ( = ?auto_6482 ?auto_6507 ) ) ( not ( = ?auto_6483 ?auto_6486 ) ) ( not ( = ?auto_6483 ?auto_6507 ) ) ( not ( = ?auto_6484 ?auto_6486 ) ) ( not ( = ?auto_6484 ?auto_6507 ) ) ( not ( = ?auto_6486 ?auto_6495 ) ) ( not ( = ?auto_6486 ?auto_6498 ) ) ( not ( = ?auto_6486 ?auto_6506 ) ) ( not ( = ?auto_6486 ?auto_6502 ) ) ( not ( = ?auto_6508 ?auto_6499 ) ) ( not ( = ?auto_6508 ?auto_6500 ) ) ( not ( = ?auto_6508 ?auto_6497 ) ) ( not ( = ?auto_6505 ?auto_6503 ) ) ( not ( = ?auto_6505 ?auto_6504 ) ) ( not ( = ?auto_6505 ?auto_6501 ) ) ( not ( = ?auto_6507 ?auto_6495 ) ) ( not ( = ?auto_6507 ?auto_6498 ) ) ( not ( = ?auto_6507 ?auto_6506 ) ) ( not ( = ?auto_6507 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6487 ) ) ( not ( = ?auto_6481 ?auto_6496 ) ) ( not ( = ?auto_6482 ?auto_6487 ) ) ( not ( = ?auto_6482 ?auto_6496 ) ) ( not ( = ?auto_6483 ?auto_6487 ) ) ( not ( = ?auto_6483 ?auto_6496 ) ) ( not ( = ?auto_6484 ?auto_6487 ) ) ( not ( = ?auto_6484 ?auto_6496 ) ) ( not ( = ?auto_6485 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6496 ) ) ( not ( = ?auto_6487 ?auto_6507 ) ) ( not ( = ?auto_6487 ?auto_6495 ) ) ( not ( = ?auto_6487 ?auto_6498 ) ) ( not ( = ?auto_6487 ?auto_6506 ) ) ( not ( = ?auto_6487 ?auto_6502 ) ) ( not ( = ?auto_6489 ?auto_6508 ) ) ( not ( = ?auto_6489 ?auto_6499 ) ) ( not ( = ?auto_6489 ?auto_6500 ) ) ( not ( = ?auto_6489 ?auto_6497 ) ) ( not ( = ?auto_6490 ?auto_6505 ) ) ( not ( = ?auto_6490 ?auto_6503 ) ) ( not ( = ?auto_6490 ?auto_6504 ) ) ( not ( = ?auto_6490 ?auto_6501 ) ) ( not ( = ?auto_6496 ?auto_6507 ) ) ( not ( = ?auto_6496 ?auto_6495 ) ) ( not ( = ?auto_6496 ?auto_6498 ) ) ( not ( = ?auto_6496 ?auto_6506 ) ) ( not ( = ?auto_6496 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6488 ) ) ( not ( = ?auto_6481 ?auto_6491 ) ) ( not ( = ?auto_6482 ?auto_6488 ) ) ( not ( = ?auto_6482 ?auto_6491 ) ) ( not ( = ?auto_6483 ?auto_6488 ) ) ( not ( = ?auto_6483 ?auto_6491 ) ) ( not ( = ?auto_6484 ?auto_6488 ) ) ( not ( = ?auto_6484 ?auto_6491 ) ) ( not ( = ?auto_6485 ?auto_6488 ) ) ( not ( = ?auto_6485 ?auto_6491 ) ) ( not ( = ?auto_6486 ?auto_6488 ) ) ( not ( = ?auto_6486 ?auto_6491 ) ) ( not ( = ?auto_6488 ?auto_6496 ) ) ( not ( = ?auto_6488 ?auto_6507 ) ) ( not ( = ?auto_6488 ?auto_6495 ) ) ( not ( = ?auto_6488 ?auto_6498 ) ) ( not ( = ?auto_6488 ?auto_6506 ) ) ( not ( = ?auto_6488 ?auto_6502 ) ) ( not ( = ?auto_6491 ?auto_6496 ) ) ( not ( = ?auto_6491 ?auto_6507 ) ) ( not ( = ?auto_6491 ?auto_6495 ) ) ( not ( = ?auto_6491 ?auto_6498 ) ) ( not ( = ?auto_6491 ?auto_6506 ) ) ( not ( = ?auto_6491 ?auto_6502 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 ?auto_6485 ?auto_6486 ?auto_6487 )
      ( MAKE-1CRATE ?auto_6487 ?auto_6488 )
      ( MAKE-7CRATE-VERIFY ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 ?auto_6485 ?auto_6486 ?auto_6487 ?auto_6488 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6528 - SURFACE
      ?auto_6529 - SURFACE
      ?auto_6530 - SURFACE
      ?auto_6531 - SURFACE
      ?auto_6532 - SURFACE
      ?auto_6533 - SURFACE
      ?auto_6534 - SURFACE
      ?auto_6535 - SURFACE
      ?auto_6536 - SURFACE
    )
    :vars
    (
      ?auto_6542 - HOIST
      ?auto_6541 - PLACE
      ?auto_6537 - PLACE
      ?auto_6538 - HOIST
      ?auto_6539 - SURFACE
      ?auto_6556 - PLACE
      ?auto_6546 - HOIST
      ?auto_6554 - SURFACE
      ?auto_6551 - SURFACE
      ?auto_6548 - SURFACE
      ?auto_6544 - PLACE
      ?auto_6550 - HOIST
      ?auto_6543 - SURFACE
      ?auto_6557 - PLACE
      ?auto_6552 - HOIST
      ?auto_6555 - SURFACE
      ?auto_6545 - SURFACE
      ?auto_6547 - PLACE
      ?auto_6553 - HOIST
      ?auto_6549 - SURFACE
      ?auto_6540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6542 ?auto_6541 ) ( IS-CRATE ?auto_6536 ) ( not ( = ?auto_6537 ?auto_6541 ) ) ( HOIST-AT ?auto_6538 ?auto_6537 ) ( SURFACE-AT ?auto_6536 ?auto_6537 ) ( ON ?auto_6536 ?auto_6539 ) ( CLEAR ?auto_6536 ) ( not ( = ?auto_6535 ?auto_6536 ) ) ( not ( = ?auto_6535 ?auto_6539 ) ) ( not ( = ?auto_6536 ?auto_6539 ) ) ( not ( = ?auto_6542 ?auto_6538 ) ) ( IS-CRATE ?auto_6535 ) ( not ( = ?auto_6556 ?auto_6541 ) ) ( HOIST-AT ?auto_6546 ?auto_6556 ) ( SURFACE-AT ?auto_6535 ?auto_6556 ) ( ON ?auto_6535 ?auto_6554 ) ( CLEAR ?auto_6535 ) ( not ( = ?auto_6534 ?auto_6535 ) ) ( not ( = ?auto_6534 ?auto_6554 ) ) ( not ( = ?auto_6535 ?auto_6554 ) ) ( not ( = ?auto_6542 ?auto_6546 ) ) ( IS-CRATE ?auto_6534 ) ( AVAILABLE ?auto_6546 ) ( SURFACE-AT ?auto_6534 ?auto_6556 ) ( ON ?auto_6534 ?auto_6551 ) ( CLEAR ?auto_6534 ) ( not ( = ?auto_6533 ?auto_6534 ) ) ( not ( = ?auto_6533 ?auto_6551 ) ) ( not ( = ?auto_6534 ?auto_6551 ) ) ( IS-CRATE ?auto_6533 ) ( AVAILABLE ?auto_6538 ) ( SURFACE-AT ?auto_6533 ?auto_6537 ) ( ON ?auto_6533 ?auto_6548 ) ( CLEAR ?auto_6533 ) ( not ( = ?auto_6532 ?auto_6533 ) ) ( not ( = ?auto_6532 ?auto_6548 ) ) ( not ( = ?auto_6533 ?auto_6548 ) ) ( IS-CRATE ?auto_6532 ) ( not ( = ?auto_6544 ?auto_6541 ) ) ( HOIST-AT ?auto_6550 ?auto_6544 ) ( SURFACE-AT ?auto_6532 ?auto_6544 ) ( ON ?auto_6532 ?auto_6543 ) ( CLEAR ?auto_6532 ) ( not ( = ?auto_6531 ?auto_6532 ) ) ( not ( = ?auto_6531 ?auto_6543 ) ) ( not ( = ?auto_6532 ?auto_6543 ) ) ( not ( = ?auto_6542 ?auto_6550 ) ) ( IS-CRATE ?auto_6531 ) ( not ( = ?auto_6557 ?auto_6541 ) ) ( HOIST-AT ?auto_6552 ?auto_6557 ) ( AVAILABLE ?auto_6552 ) ( SURFACE-AT ?auto_6531 ?auto_6557 ) ( ON ?auto_6531 ?auto_6555 ) ( CLEAR ?auto_6531 ) ( not ( = ?auto_6530 ?auto_6531 ) ) ( not ( = ?auto_6530 ?auto_6555 ) ) ( not ( = ?auto_6531 ?auto_6555 ) ) ( not ( = ?auto_6542 ?auto_6552 ) ) ( IS-CRATE ?auto_6530 ) ( AVAILABLE ?auto_6550 ) ( SURFACE-AT ?auto_6530 ?auto_6544 ) ( ON ?auto_6530 ?auto_6545 ) ( CLEAR ?auto_6530 ) ( not ( = ?auto_6529 ?auto_6530 ) ) ( not ( = ?auto_6529 ?auto_6545 ) ) ( not ( = ?auto_6530 ?auto_6545 ) ) ( SURFACE-AT ?auto_6528 ?auto_6541 ) ( CLEAR ?auto_6528 ) ( IS-CRATE ?auto_6529 ) ( AVAILABLE ?auto_6542 ) ( not ( = ?auto_6547 ?auto_6541 ) ) ( HOIST-AT ?auto_6553 ?auto_6547 ) ( AVAILABLE ?auto_6553 ) ( SURFACE-AT ?auto_6529 ?auto_6547 ) ( ON ?auto_6529 ?auto_6549 ) ( CLEAR ?auto_6529 ) ( TRUCK-AT ?auto_6540 ?auto_6541 ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6549 ) ) ( not ( = ?auto_6529 ?auto_6549 ) ) ( not ( = ?auto_6542 ?auto_6553 ) ) ( not ( = ?auto_6528 ?auto_6530 ) ) ( not ( = ?auto_6528 ?auto_6545 ) ) ( not ( = ?auto_6530 ?auto_6549 ) ) ( not ( = ?auto_6544 ?auto_6547 ) ) ( not ( = ?auto_6550 ?auto_6553 ) ) ( not ( = ?auto_6545 ?auto_6549 ) ) ( not ( = ?auto_6528 ?auto_6531 ) ) ( not ( = ?auto_6528 ?auto_6555 ) ) ( not ( = ?auto_6529 ?auto_6531 ) ) ( not ( = ?auto_6529 ?auto_6555 ) ) ( not ( = ?auto_6531 ?auto_6545 ) ) ( not ( = ?auto_6531 ?auto_6549 ) ) ( not ( = ?auto_6557 ?auto_6544 ) ) ( not ( = ?auto_6557 ?auto_6547 ) ) ( not ( = ?auto_6552 ?auto_6550 ) ) ( not ( = ?auto_6552 ?auto_6553 ) ) ( not ( = ?auto_6555 ?auto_6545 ) ) ( not ( = ?auto_6555 ?auto_6549 ) ) ( not ( = ?auto_6528 ?auto_6532 ) ) ( not ( = ?auto_6528 ?auto_6543 ) ) ( not ( = ?auto_6529 ?auto_6532 ) ) ( not ( = ?auto_6529 ?auto_6543 ) ) ( not ( = ?auto_6530 ?auto_6532 ) ) ( not ( = ?auto_6530 ?auto_6543 ) ) ( not ( = ?auto_6532 ?auto_6555 ) ) ( not ( = ?auto_6532 ?auto_6545 ) ) ( not ( = ?auto_6532 ?auto_6549 ) ) ( not ( = ?auto_6543 ?auto_6555 ) ) ( not ( = ?auto_6543 ?auto_6545 ) ) ( not ( = ?auto_6543 ?auto_6549 ) ) ( not ( = ?auto_6528 ?auto_6533 ) ) ( not ( = ?auto_6528 ?auto_6548 ) ) ( not ( = ?auto_6529 ?auto_6533 ) ) ( not ( = ?auto_6529 ?auto_6548 ) ) ( not ( = ?auto_6530 ?auto_6533 ) ) ( not ( = ?auto_6530 ?auto_6548 ) ) ( not ( = ?auto_6531 ?auto_6533 ) ) ( not ( = ?auto_6531 ?auto_6548 ) ) ( not ( = ?auto_6533 ?auto_6543 ) ) ( not ( = ?auto_6533 ?auto_6555 ) ) ( not ( = ?auto_6533 ?auto_6545 ) ) ( not ( = ?auto_6533 ?auto_6549 ) ) ( not ( = ?auto_6537 ?auto_6544 ) ) ( not ( = ?auto_6537 ?auto_6557 ) ) ( not ( = ?auto_6537 ?auto_6547 ) ) ( not ( = ?auto_6538 ?auto_6550 ) ) ( not ( = ?auto_6538 ?auto_6552 ) ) ( not ( = ?auto_6538 ?auto_6553 ) ) ( not ( = ?auto_6548 ?auto_6543 ) ) ( not ( = ?auto_6548 ?auto_6555 ) ) ( not ( = ?auto_6548 ?auto_6545 ) ) ( not ( = ?auto_6548 ?auto_6549 ) ) ( not ( = ?auto_6528 ?auto_6534 ) ) ( not ( = ?auto_6528 ?auto_6551 ) ) ( not ( = ?auto_6529 ?auto_6534 ) ) ( not ( = ?auto_6529 ?auto_6551 ) ) ( not ( = ?auto_6530 ?auto_6534 ) ) ( not ( = ?auto_6530 ?auto_6551 ) ) ( not ( = ?auto_6531 ?auto_6534 ) ) ( not ( = ?auto_6531 ?auto_6551 ) ) ( not ( = ?auto_6532 ?auto_6534 ) ) ( not ( = ?auto_6532 ?auto_6551 ) ) ( not ( = ?auto_6534 ?auto_6548 ) ) ( not ( = ?auto_6534 ?auto_6543 ) ) ( not ( = ?auto_6534 ?auto_6555 ) ) ( not ( = ?auto_6534 ?auto_6545 ) ) ( not ( = ?auto_6534 ?auto_6549 ) ) ( not ( = ?auto_6556 ?auto_6537 ) ) ( not ( = ?auto_6556 ?auto_6544 ) ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( not ( = ?auto_6556 ?auto_6547 ) ) ( not ( = ?auto_6546 ?auto_6538 ) ) ( not ( = ?auto_6546 ?auto_6550 ) ) ( not ( = ?auto_6546 ?auto_6552 ) ) ( not ( = ?auto_6546 ?auto_6553 ) ) ( not ( = ?auto_6551 ?auto_6548 ) ) ( not ( = ?auto_6551 ?auto_6543 ) ) ( not ( = ?auto_6551 ?auto_6555 ) ) ( not ( = ?auto_6551 ?auto_6545 ) ) ( not ( = ?auto_6551 ?auto_6549 ) ) ( not ( = ?auto_6528 ?auto_6535 ) ) ( not ( = ?auto_6528 ?auto_6554 ) ) ( not ( = ?auto_6529 ?auto_6535 ) ) ( not ( = ?auto_6529 ?auto_6554 ) ) ( not ( = ?auto_6530 ?auto_6535 ) ) ( not ( = ?auto_6530 ?auto_6554 ) ) ( not ( = ?auto_6531 ?auto_6535 ) ) ( not ( = ?auto_6531 ?auto_6554 ) ) ( not ( = ?auto_6532 ?auto_6535 ) ) ( not ( = ?auto_6532 ?auto_6554 ) ) ( not ( = ?auto_6533 ?auto_6535 ) ) ( not ( = ?auto_6533 ?auto_6554 ) ) ( not ( = ?auto_6535 ?auto_6551 ) ) ( not ( = ?auto_6535 ?auto_6548 ) ) ( not ( = ?auto_6535 ?auto_6543 ) ) ( not ( = ?auto_6535 ?auto_6555 ) ) ( not ( = ?auto_6535 ?auto_6545 ) ) ( not ( = ?auto_6535 ?auto_6549 ) ) ( not ( = ?auto_6554 ?auto_6551 ) ) ( not ( = ?auto_6554 ?auto_6548 ) ) ( not ( = ?auto_6554 ?auto_6543 ) ) ( not ( = ?auto_6554 ?auto_6555 ) ) ( not ( = ?auto_6554 ?auto_6545 ) ) ( not ( = ?auto_6554 ?auto_6549 ) ) ( not ( = ?auto_6528 ?auto_6536 ) ) ( not ( = ?auto_6528 ?auto_6539 ) ) ( not ( = ?auto_6529 ?auto_6536 ) ) ( not ( = ?auto_6529 ?auto_6539 ) ) ( not ( = ?auto_6530 ?auto_6536 ) ) ( not ( = ?auto_6530 ?auto_6539 ) ) ( not ( = ?auto_6531 ?auto_6536 ) ) ( not ( = ?auto_6531 ?auto_6539 ) ) ( not ( = ?auto_6532 ?auto_6536 ) ) ( not ( = ?auto_6532 ?auto_6539 ) ) ( not ( = ?auto_6533 ?auto_6536 ) ) ( not ( = ?auto_6533 ?auto_6539 ) ) ( not ( = ?auto_6534 ?auto_6536 ) ) ( not ( = ?auto_6534 ?auto_6539 ) ) ( not ( = ?auto_6536 ?auto_6554 ) ) ( not ( = ?auto_6536 ?auto_6551 ) ) ( not ( = ?auto_6536 ?auto_6548 ) ) ( not ( = ?auto_6536 ?auto_6543 ) ) ( not ( = ?auto_6536 ?auto_6555 ) ) ( not ( = ?auto_6536 ?auto_6545 ) ) ( not ( = ?auto_6536 ?auto_6549 ) ) ( not ( = ?auto_6539 ?auto_6554 ) ) ( not ( = ?auto_6539 ?auto_6551 ) ) ( not ( = ?auto_6539 ?auto_6548 ) ) ( not ( = ?auto_6539 ?auto_6543 ) ) ( not ( = ?auto_6539 ?auto_6555 ) ) ( not ( = ?auto_6539 ?auto_6545 ) ) ( not ( = ?auto_6539 ?auto_6549 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6528 ?auto_6529 ?auto_6530 ?auto_6531 ?auto_6532 ?auto_6533 ?auto_6534 ?auto_6535 )
      ( MAKE-1CRATE ?auto_6535 ?auto_6536 )
      ( MAKE-8CRATE-VERIFY ?auto_6528 ?auto_6529 ?auto_6530 ?auto_6531 ?auto_6532 ?auto_6533 ?auto_6534 ?auto_6535 ?auto_6536 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6578 - SURFACE
      ?auto_6579 - SURFACE
      ?auto_6580 - SURFACE
      ?auto_6581 - SURFACE
      ?auto_6582 - SURFACE
      ?auto_6583 - SURFACE
      ?auto_6584 - SURFACE
      ?auto_6585 - SURFACE
      ?auto_6586 - SURFACE
      ?auto_6587 - SURFACE
    )
    :vars
    (
      ?auto_6591 - HOIST
      ?auto_6593 - PLACE
      ?auto_6592 - PLACE
      ?auto_6588 - HOIST
      ?auto_6589 - SURFACE
      ?auto_6609 - PLACE
      ?auto_6603 - HOIST
      ?auto_6608 - SURFACE
      ?auto_6606 - SURFACE
      ?auto_6599 - SURFACE
      ?auto_6595 - SURFACE
      ?auto_6598 - PLACE
      ?auto_6604 - HOIST
      ?auto_6596 - SURFACE
      ?auto_6594 - PLACE
      ?auto_6602 - HOIST
      ?auto_6600 - SURFACE
      ?auto_6601 - SURFACE
      ?auto_6597 - PLACE
      ?auto_6607 - HOIST
      ?auto_6605 - SURFACE
      ?auto_6590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6591 ?auto_6593 ) ( IS-CRATE ?auto_6587 ) ( not ( = ?auto_6592 ?auto_6593 ) ) ( HOIST-AT ?auto_6588 ?auto_6592 ) ( SURFACE-AT ?auto_6587 ?auto_6592 ) ( ON ?auto_6587 ?auto_6589 ) ( CLEAR ?auto_6587 ) ( not ( = ?auto_6586 ?auto_6587 ) ) ( not ( = ?auto_6586 ?auto_6589 ) ) ( not ( = ?auto_6587 ?auto_6589 ) ) ( not ( = ?auto_6591 ?auto_6588 ) ) ( IS-CRATE ?auto_6586 ) ( not ( = ?auto_6609 ?auto_6593 ) ) ( HOIST-AT ?auto_6603 ?auto_6609 ) ( SURFACE-AT ?auto_6586 ?auto_6609 ) ( ON ?auto_6586 ?auto_6608 ) ( CLEAR ?auto_6586 ) ( not ( = ?auto_6585 ?auto_6586 ) ) ( not ( = ?auto_6585 ?auto_6608 ) ) ( not ( = ?auto_6586 ?auto_6608 ) ) ( not ( = ?auto_6591 ?auto_6603 ) ) ( IS-CRATE ?auto_6585 ) ( SURFACE-AT ?auto_6585 ?auto_6592 ) ( ON ?auto_6585 ?auto_6606 ) ( CLEAR ?auto_6585 ) ( not ( = ?auto_6584 ?auto_6585 ) ) ( not ( = ?auto_6584 ?auto_6606 ) ) ( not ( = ?auto_6585 ?auto_6606 ) ) ( IS-CRATE ?auto_6584 ) ( AVAILABLE ?auto_6588 ) ( SURFACE-AT ?auto_6584 ?auto_6592 ) ( ON ?auto_6584 ?auto_6599 ) ( CLEAR ?auto_6584 ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( not ( = ?auto_6583 ?auto_6599 ) ) ( not ( = ?auto_6584 ?auto_6599 ) ) ( IS-CRATE ?auto_6583 ) ( AVAILABLE ?auto_6603 ) ( SURFACE-AT ?auto_6583 ?auto_6609 ) ( ON ?auto_6583 ?auto_6595 ) ( CLEAR ?auto_6583 ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( not ( = ?auto_6582 ?auto_6595 ) ) ( not ( = ?auto_6583 ?auto_6595 ) ) ( IS-CRATE ?auto_6582 ) ( not ( = ?auto_6598 ?auto_6593 ) ) ( HOIST-AT ?auto_6604 ?auto_6598 ) ( SURFACE-AT ?auto_6582 ?auto_6598 ) ( ON ?auto_6582 ?auto_6596 ) ( CLEAR ?auto_6582 ) ( not ( = ?auto_6581 ?auto_6582 ) ) ( not ( = ?auto_6581 ?auto_6596 ) ) ( not ( = ?auto_6582 ?auto_6596 ) ) ( not ( = ?auto_6591 ?auto_6604 ) ) ( IS-CRATE ?auto_6581 ) ( not ( = ?auto_6594 ?auto_6593 ) ) ( HOIST-AT ?auto_6602 ?auto_6594 ) ( AVAILABLE ?auto_6602 ) ( SURFACE-AT ?auto_6581 ?auto_6594 ) ( ON ?auto_6581 ?auto_6600 ) ( CLEAR ?auto_6581 ) ( not ( = ?auto_6580 ?auto_6581 ) ) ( not ( = ?auto_6580 ?auto_6600 ) ) ( not ( = ?auto_6581 ?auto_6600 ) ) ( not ( = ?auto_6591 ?auto_6602 ) ) ( IS-CRATE ?auto_6580 ) ( AVAILABLE ?auto_6604 ) ( SURFACE-AT ?auto_6580 ?auto_6598 ) ( ON ?auto_6580 ?auto_6601 ) ( CLEAR ?auto_6580 ) ( not ( = ?auto_6579 ?auto_6580 ) ) ( not ( = ?auto_6579 ?auto_6601 ) ) ( not ( = ?auto_6580 ?auto_6601 ) ) ( SURFACE-AT ?auto_6578 ?auto_6593 ) ( CLEAR ?auto_6578 ) ( IS-CRATE ?auto_6579 ) ( AVAILABLE ?auto_6591 ) ( not ( = ?auto_6597 ?auto_6593 ) ) ( HOIST-AT ?auto_6607 ?auto_6597 ) ( AVAILABLE ?auto_6607 ) ( SURFACE-AT ?auto_6579 ?auto_6597 ) ( ON ?auto_6579 ?auto_6605 ) ( CLEAR ?auto_6579 ) ( TRUCK-AT ?auto_6590 ?auto_6593 ) ( not ( = ?auto_6578 ?auto_6579 ) ) ( not ( = ?auto_6578 ?auto_6605 ) ) ( not ( = ?auto_6579 ?auto_6605 ) ) ( not ( = ?auto_6591 ?auto_6607 ) ) ( not ( = ?auto_6578 ?auto_6580 ) ) ( not ( = ?auto_6578 ?auto_6601 ) ) ( not ( = ?auto_6580 ?auto_6605 ) ) ( not ( = ?auto_6598 ?auto_6597 ) ) ( not ( = ?auto_6604 ?auto_6607 ) ) ( not ( = ?auto_6601 ?auto_6605 ) ) ( not ( = ?auto_6578 ?auto_6581 ) ) ( not ( = ?auto_6578 ?auto_6600 ) ) ( not ( = ?auto_6579 ?auto_6581 ) ) ( not ( = ?auto_6579 ?auto_6600 ) ) ( not ( = ?auto_6581 ?auto_6601 ) ) ( not ( = ?auto_6581 ?auto_6605 ) ) ( not ( = ?auto_6594 ?auto_6598 ) ) ( not ( = ?auto_6594 ?auto_6597 ) ) ( not ( = ?auto_6602 ?auto_6604 ) ) ( not ( = ?auto_6602 ?auto_6607 ) ) ( not ( = ?auto_6600 ?auto_6601 ) ) ( not ( = ?auto_6600 ?auto_6605 ) ) ( not ( = ?auto_6578 ?auto_6582 ) ) ( not ( = ?auto_6578 ?auto_6596 ) ) ( not ( = ?auto_6579 ?auto_6582 ) ) ( not ( = ?auto_6579 ?auto_6596 ) ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( not ( = ?auto_6580 ?auto_6596 ) ) ( not ( = ?auto_6582 ?auto_6600 ) ) ( not ( = ?auto_6582 ?auto_6601 ) ) ( not ( = ?auto_6582 ?auto_6605 ) ) ( not ( = ?auto_6596 ?auto_6600 ) ) ( not ( = ?auto_6596 ?auto_6601 ) ) ( not ( = ?auto_6596 ?auto_6605 ) ) ( not ( = ?auto_6578 ?auto_6583 ) ) ( not ( = ?auto_6578 ?auto_6595 ) ) ( not ( = ?auto_6579 ?auto_6583 ) ) ( not ( = ?auto_6579 ?auto_6595 ) ) ( not ( = ?auto_6580 ?auto_6583 ) ) ( not ( = ?auto_6580 ?auto_6595 ) ) ( not ( = ?auto_6581 ?auto_6583 ) ) ( not ( = ?auto_6581 ?auto_6595 ) ) ( not ( = ?auto_6583 ?auto_6596 ) ) ( not ( = ?auto_6583 ?auto_6600 ) ) ( not ( = ?auto_6583 ?auto_6601 ) ) ( not ( = ?auto_6583 ?auto_6605 ) ) ( not ( = ?auto_6609 ?auto_6598 ) ) ( not ( = ?auto_6609 ?auto_6594 ) ) ( not ( = ?auto_6609 ?auto_6597 ) ) ( not ( = ?auto_6603 ?auto_6604 ) ) ( not ( = ?auto_6603 ?auto_6602 ) ) ( not ( = ?auto_6603 ?auto_6607 ) ) ( not ( = ?auto_6595 ?auto_6596 ) ) ( not ( = ?auto_6595 ?auto_6600 ) ) ( not ( = ?auto_6595 ?auto_6601 ) ) ( not ( = ?auto_6595 ?auto_6605 ) ) ( not ( = ?auto_6578 ?auto_6584 ) ) ( not ( = ?auto_6578 ?auto_6599 ) ) ( not ( = ?auto_6579 ?auto_6584 ) ) ( not ( = ?auto_6579 ?auto_6599 ) ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( not ( = ?auto_6580 ?auto_6599 ) ) ( not ( = ?auto_6581 ?auto_6584 ) ) ( not ( = ?auto_6581 ?auto_6599 ) ) ( not ( = ?auto_6582 ?auto_6584 ) ) ( not ( = ?auto_6582 ?auto_6599 ) ) ( not ( = ?auto_6584 ?auto_6595 ) ) ( not ( = ?auto_6584 ?auto_6596 ) ) ( not ( = ?auto_6584 ?auto_6600 ) ) ( not ( = ?auto_6584 ?auto_6601 ) ) ( not ( = ?auto_6584 ?auto_6605 ) ) ( not ( = ?auto_6592 ?auto_6609 ) ) ( not ( = ?auto_6592 ?auto_6598 ) ) ( not ( = ?auto_6592 ?auto_6594 ) ) ( not ( = ?auto_6592 ?auto_6597 ) ) ( not ( = ?auto_6588 ?auto_6603 ) ) ( not ( = ?auto_6588 ?auto_6604 ) ) ( not ( = ?auto_6588 ?auto_6602 ) ) ( not ( = ?auto_6588 ?auto_6607 ) ) ( not ( = ?auto_6599 ?auto_6595 ) ) ( not ( = ?auto_6599 ?auto_6596 ) ) ( not ( = ?auto_6599 ?auto_6600 ) ) ( not ( = ?auto_6599 ?auto_6601 ) ) ( not ( = ?auto_6599 ?auto_6605 ) ) ( not ( = ?auto_6578 ?auto_6585 ) ) ( not ( = ?auto_6578 ?auto_6606 ) ) ( not ( = ?auto_6579 ?auto_6585 ) ) ( not ( = ?auto_6579 ?auto_6606 ) ) ( not ( = ?auto_6580 ?auto_6585 ) ) ( not ( = ?auto_6580 ?auto_6606 ) ) ( not ( = ?auto_6581 ?auto_6585 ) ) ( not ( = ?auto_6581 ?auto_6606 ) ) ( not ( = ?auto_6582 ?auto_6585 ) ) ( not ( = ?auto_6582 ?auto_6606 ) ) ( not ( = ?auto_6583 ?auto_6585 ) ) ( not ( = ?auto_6583 ?auto_6606 ) ) ( not ( = ?auto_6585 ?auto_6599 ) ) ( not ( = ?auto_6585 ?auto_6595 ) ) ( not ( = ?auto_6585 ?auto_6596 ) ) ( not ( = ?auto_6585 ?auto_6600 ) ) ( not ( = ?auto_6585 ?auto_6601 ) ) ( not ( = ?auto_6585 ?auto_6605 ) ) ( not ( = ?auto_6606 ?auto_6599 ) ) ( not ( = ?auto_6606 ?auto_6595 ) ) ( not ( = ?auto_6606 ?auto_6596 ) ) ( not ( = ?auto_6606 ?auto_6600 ) ) ( not ( = ?auto_6606 ?auto_6601 ) ) ( not ( = ?auto_6606 ?auto_6605 ) ) ( not ( = ?auto_6578 ?auto_6586 ) ) ( not ( = ?auto_6578 ?auto_6608 ) ) ( not ( = ?auto_6579 ?auto_6586 ) ) ( not ( = ?auto_6579 ?auto_6608 ) ) ( not ( = ?auto_6580 ?auto_6586 ) ) ( not ( = ?auto_6580 ?auto_6608 ) ) ( not ( = ?auto_6581 ?auto_6586 ) ) ( not ( = ?auto_6581 ?auto_6608 ) ) ( not ( = ?auto_6582 ?auto_6586 ) ) ( not ( = ?auto_6582 ?auto_6608 ) ) ( not ( = ?auto_6583 ?auto_6586 ) ) ( not ( = ?auto_6583 ?auto_6608 ) ) ( not ( = ?auto_6584 ?auto_6586 ) ) ( not ( = ?auto_6584 ?auto_6608 ) ) ( not ( = ?auto_6586 ?auto_6606 ) ) ( not ( = ?auto_6586 ?auto_6599 ) ) ( not ( = ?auto_6586 ?auto_6595 ) ) ( not ( = ?auto_6586 ?auto_6596 ) ) ( not ( = ?auto_6586 ?auto_6600 ) ) ( not ( = ?auto_6586 ?auto_6601 ) ) ( not ( = ?auto_6586 ?auto_6605 ) ) ( not ( = ?auto_6608 ?auto_6606 ) ) ( not ( = ?auto_6608 ?auto_6599 ) ) ( not ( = ?auto_6608 ?auto_6595 ) ) ( not ( = ?auto_6608 ?auto_6596 ) ) ( not ( = ?auto_6608 ?auto_6600 ) ) ( not ( = ?auto_6608 ?auto_6601 ) ) ( not ( = ?auto_6608 ?auto_6605 ) ) ( not ( = ?auto_6578 ?auto_6587 ) ) ( not ( = ?auto_6578 ?auto_6589 ) ) ( not ( = ?auto_6579 ?auto_6587 ) ) ( not ( = ?auto_6579 ?auto_6589 ) ) ( not ( = ?auto_6580 ?auto_6587 ) ) ( not ( = ?auto_6580 ?auto_6589 ) ) ( not ( = ?auto_6581 ?auto_6587 ) ) ( not ( = ?auto_6581 ?auto_6589 ) ) ( not ( = ?auto_6582 ?auto_6587 ) ) ( not ( = ?auto_6582 ?auto_6589 ) ) ( not ( = ?auto_6583 ?auto_6587 ) ) ( not ( = ?auto_6583 ?auto_6589 ) ) ( not ( = ?auto_6584 ?auto_6587 ) ) ( not ( = ?auto_6584 ?auto_6589 ) ) ( not ( = ?auto_6585 ?auto_6587 ) ) ( not ( = ?auto_6585 ?auto_6589 ) ) ( not ( = ?auto_6587 ?auto_6608 ) ) ( not ( = ?auto_6587 ?auto_6606 ) ) ( not ( = ?auto_6587 ?auto_6599 ) ) ( not ( = ?auto_6587 ?auto_6595 ) ) ( not ( = ?auto_6587 ?auto_6596 ) ) ( not ( = ?auto_6587 ?auto_6600 ) ) ( not ( = ?auto_6587 ?auto_6601 ) ) ( not ( = ?auto_6587 ?auto_6605 ) ) ( not ( = ?auto_6589 ?auto_6608 ) ) ( not ( = ?auto_6589 ?auto_6606 ) ) ( not ( = ?auto_6589 ?auto_6599 ) ) ( not ( = ?auto_6589 ?auto_6595 ) ) ( not ( = ?auto_6589 ?auto_6596 ) ) ( not ( = ?auto_6589 ?auto_6600 ) ) ( not ( = ?auto_6589 ?auto_6601 ) ) ( not ( = ?auto_6589 ?auto_6605 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6578 ?auto_6579 ?auto_6580 ?auto_6581 ?auto_6582 ?auto_6583 ?auto_6584 ?auto_6585 ?auto_6586 )
      ( MAKE-1CRATE ?auto_6586 ?auto_6587 )
      ( MAKE-9CRATE-VERIFY ?auto_6578 ?auto_6579 ?auto_6580 ?auto_6581 ?auto_6582 ?auto_6583 ?auto_6584 ?auto_6585 ?auto_6586 ?auto_6587 ) )
  )

)

