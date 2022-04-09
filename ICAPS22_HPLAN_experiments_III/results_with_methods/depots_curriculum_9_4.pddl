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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6296 - SURFACE
      ?auto_6297 - SURFACE
    )
    :vars
    (
      ?auto_6298 - HOIST
      ?auto_6299 - PLACE
      ?auto_6301 - PLACE
      ?auto_6302 - HOIST
      ?auto_6303 - SURFACE
      ?auto_6300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6298 ?auto_6299 ) ( SURFACE-AT ?auto_6296 ?auto_6299 ) ( CLEAR ?auto_6296 ) ( IS-CRATE ?auto_6297 ) ( AVAILABLE ?auto_6298 ) ( not ( = ?auto_6301 ?auto_6299 ) ) ( HOIST-AT ?auto_6302 ?auto_6301 ) ( AVAILABLE ?auto_6302 ) ( SURFACE-AT ?auto_6297 ?auto_6301 ) ( ON ?auto_6297 ?auto_6303 ) ( CLEAR ?auto_6297 ) ( TRUCK-AT ?auto_6300 ?auto_6299 ) ( not ( = ?auto_6296 ?auto_6297 ) ) ( not ( = ?auto_6296 ?auto_6303 ) ) ( not ( = ?auto_6297 ?auto_6303 ) ) ( not ( = ?auto_6298 ?auto_6302 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6300 ?auto_6299 ?auto_6301 )
      ( !LIFT ?auto_6302 ?auto_6297 ?auto_6303 ?auto_6301 )
      ( !LOAD ?auto_6302 ?auto_6297 ?auto_6300 ?auto_6301 )
      ( !DRIVE ?auto_6300 ?auto_6301 ?auto_6299 )
      ( !UNLOAD ?auto_6298 ?auto_6297 ?auto_6300 ?auto_6299 )
      ( !DROP ?auto_6298 ?auto_6297 ?auto_6296 ?auto_6299 )
      ( MAKE-1CRATE-VERIFY ?auto_6296 ?auto_6297 ) )
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
      ?auto_6310 - HOIST
      ?auto_6311 - PLACE
      ?auto_6315 - PLACE
      ?auto_6313 - HOIST
      ?auto_6312 - SURFACE
      ?auto_6317 - PLACE
      ?auto_6316 - HOIST
      ?auto_6318 - SURFACE
      ?auto_6314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6310 ?auto_6311 ) ( IS-CRATE ?auto_6309 ) ( not ( = ?auto_6315 ?auto_6311 ) ) ( HOIST-AT ?auto_6313 ?auto_6315 ) ( AVAILABLE ?auto_6313 ) ( SURFACE-AT ?auto_6309 ?auto_6315 ) ( ON ?auto_6309 ?auto_6312 ) ( CLEAR ?auto_6309 ) ( not ( = ?auto_6308 ?auto_6309 ) ) ( not ( = ?auto_6308 ?auto_6312 ) ) ( not ( = ?auto_6309 ?auto_6312 ) ) ( not ( = ?auto_6310 ?auto_6313 ) ) ( SURFACE-AT ?auto_6307 ?auto_6311 ) ( CLEAR ?auto_6307 ) ( IS-CRATE ?auto_6308 ) ( AVAILABLE ?auto_6310 ) ( not ( = ?auto_6317 ?auto_6311 ) ) ( HOIST-AT ?auto_6316 ?auto_6317 ) ( AVAILABLE ?auto_6316 ) ( SURFACE-AT ?auto_6308 ?auto_6317 ) ( ON ?auto_6308 ?auto_6318 ) ( CLEAR ?auto_6308 ) ( TRUCK-AT ?auto_6314 ?auto_6311 ) ( not ( = ?auto_6307 ?auto_6308 ) ) ( not ( = ?auto_6307 ?auto_6318 ) ) ( not ( = ?auto_6308 ?auto_6318 ) ) ( not ( = ?auto_6310 ?auto_6316 ) ) ( not ( = ?auto_6307 ?auto_6309 ) ) ( not ( = ?auto_6307 ?auto_6312 ) ) ( not ( = ?auto_6309 ?auto_6318 ) ) ( not ( = ?auto_6315 ?auto_6317 ) ) ( not ( = ?auto_6313 ?auto_6316 ) ) ( not ( = ?auto_6312 ?auto_6318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6307 ?auto_6308 )
      ( MAKE-1CRATE ?auto_6308 ?auto_6309 )
      ( MAKE-2CRATE-VERIFY ?auto_6307 ?auto_6308 ?auto_6309 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6321 - SURFACE
      ?auto_6322 - SURFACE
    )
    :vars
    (
      ?auto_6323 - HOIST
      ?auto_6324 - PLACE
      ?auto_6326 - PLACE
      ?auto_6327 - HOIST
      ?auto_6328 - SURFACE
      ?auto_6325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6323 ?auto_6324 ) ( SURFACE-AT ?auto_6321 ?auto_6324 ) ( CLEAR ?auto_6321 ) ( IS-CRATE ?auto_6322 ) ( AVAILABLE ?auto_6323 ) ( not ( = ?auto_6326 ?auto_6324 ) ) ( HOIST-AT ?auto_6327 ?auto_6326 ) ( AVAILABLE ?auto_6327 ) ( SURFACE-AT ?auto_6322 ?auto_6326 ) ( ON ?auto_6322 ?auto_6328 ) ( CLEAR ?auto_6322 ) ( TRUCK-AT ?auto_6325 ?auto_6324 ) ( not ( = ?auto_6321 ?auto_6322 ) ) ( not ( = ?auto_6321 ?auto_6328 ) ) ( not ( = ?auto_6322 ?auto_6328 ) ) ( not ( = ?auto_6323 ?auto_6327 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6325 ?auto_6324 ?auto_6326 )
      ( !LIFT ?auto_6327 ?auto_6322 ?auto_6328 ?auto_6326 )
      ( !LOAD ?auto_6327 ?auto_6322 ?auto_6325 ?auto_6326 )
      ( !DRIVE ?auto_6325 ?auto_6326 ?auto_6324 )
      ( !UNLOAD ?auto_6323 ?auto_6322 ?auto_6325 ?auto_6324 )
      ( !DROP ?auto_6323 ?auto_6322 ?auto_6321 ?auto_6324 )
      ( MAKE-1CRATE-VERIFY ?auto_6321 ?auto_6322 ) )
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
      ?auto_6341 - HOIST
      ?auto_6342 - PLACE
      ?auto_6339 - PLACE
      ?auto_6340 - HOIST
      ?auto_6337 - SURFACE
      ?auto_6347 - PLACE
      ?auto_6344 - HOIST
      ?auto_6348 - SURFACE
      ?auto_6345 - PLACE
      ?auto_6343 - HOIST
      ?auto_6346 - SURFACE
      ?auto_6338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6341 ?auto_6342 ) ( IS-CRATE ?auto_6336 ) ( not ( = ?auto_6339 ?auto_6342 ) ) ( HOIST-AT ?auto_6340 ?auto_6339 ) ( AVAILABLE ?auto_6340 ) ( SURFACE-AT ?auto_6336 ?auto_6339 ) ( ON ?auto_6336 ?auto_6337 ) ( CLEAR ?auto_6336 ) ( not ( = ?auto_6335 ?auto_6336 ) ) ( not ( = ?auto_6335 ?auto_6337 ) ) ( not ( = ?auto_6336 ?auto_6337 ) ) ( not ( = ?auto_6341 ?auto_6340 ) ) ( IS-CRATE ?auto_6335 ) ( not ( = ?auto_6347 ?auto_6342 ) ) ( HOIST-AT ?auto_6344 ?auto_6347 ) ( AVAILABLE ?auto_6344 ) ( SURFACE-AT ?auto_6335 ?auto_6347 ) ( ON ?auto_6335 ?auto_6348 ) ( CLEAR ?auto_6335 ) ( not ( = ?auto_6334 ?auto_6335 ) ) ( not ( = ?auto_6334 ?auto_6348 ) ) ( not ( = ?auto_6335 ?auto_6348 ) ) ( not ( = ?auto_6341 ?auto_6344 ) ) ( SURFACE-AT ?auto_6333 ?auto_6342 ) ( CLEAR ?auto_6333 ) ( IS-CRATE ?auto_6334 ) ( AVAILABLE ?auto_6341 ) ( not ( = ?auto_6345 ?auto_6342 ) ) ( HOIST-AT ?auto_6343 ?auto_6345 ) ( AVAILABLE ?auto_6343 ) ( SURFACE-AT ?auto_6334 ?auto_6345 ) ( ON ?auto_6334 ?auto_6346 ) ( CLEAR ?auto_6334 ) ( TRUCK-AT ?auto_6338 ?auto_6342 ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( not ( = ?auto_6333 ?auto_6346 ) ) ( not ( = ?auto_6334 ?auto_6346 ) ) ( not ( = ?auto_6341 ?auto_6343 ) ) ( not ( = ?auto_6333 ?auto_6335 ) ) ( not ( = ?auto_6333 ?auto_6348 ) ) ( not ( = ?auto_6335 ?auto_6346 ) ) ( not ( = ?auto_6347 ?auto_6345 ) ) ( not ( = ?auto_6344 ?auto_6343 ) ) ( not ( = ?auto_6348 ?auto_6346 ) ) ( not ( = ?auto_6333 ?auto_6336 ) ) ( not ( = ?auto_6333 ?auto_6337 ) ) ( not ( = ?auto_6334 ?auto_6336 ) ) ( not ( = ?auto_6334 ?auto_6337 ) ) ( not ( = ?auto_6336 ?auto_6348 ) ) ( not ( = ?auto_6336 ?auto_6346 ) ) ( not ( = ?auto_6339 ?auto_6347 ) ) ( not ( = ?auto_6339 ?auto_6345 ) ) ( not ( = ?auto_6340 ?auto_6344 ) ) ( not ( = ?auto_6340 ?auto_6343 ) ) ( not ( = ?auto_6337 ?auto_6348 ) ) ( not ( = ?auto_6337 ?auto_6346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6333 ?auto_6334 ?auto_6335 )
      ( MAKE-1CRATE ?auto_6335 ?auto_6336 )
      ( MAKE-3CRATE-VERIFY ?auto_6333 ?auto_6334 ?auto_6335 ?auto_6336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6351 - SURFACE
      ?auto_6352 - SURFACE
    )
    :vars
    (
      ?auto_6353 - HOIST
      ?auto_6354 - PLACE
      ?auto_6356 - PLACE
      ?auto_6357 - HOIST
      ?auto_6358 - SURFACE
      ?auto_6355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6353 ?auto_6354 ) ( SURFACE-AT ?auto_6351 ?auto_6354 ) ( CLEAR ?auto_6351 ) ( IS-CRATE ?auto_6352 ) ( AVAILABLE ?auto_6353 ) ( not ( = ?auto_6356 ?auto_6354 ) ) ( HOIST-AT ?auto_6357 ?auto_6356 ) ( AVAILABLE ?auto_6357 ) ( SURFACE-AT ?auto_6352 ?auto_6356 ) ( ON ?auto_6352 ?auto_6358 ) ( CLEAR ?auto_6352 ) ( TRUCK-AT ?auto_6355 ?auto_6354 ) ( not ( = ?auto_6351 ?auto_6352 ) ) ( not ( = ?auto_6351 ?auto_6358 ) ) ( not ( = ?auto_6352 ?auto_6358 ) ) ( not ( = ?auto_6353 ?auto_6357 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6355 ?auto_6354 ?auto_6356 )
      ( !LIFT ?auto_6357 ?auto_6352 ?auto_6358 ?auto_6356 )
      ( !LOAD ?auto_6357 ?auto_6352 ?auto_6355 ?auto_6356 )
      ( !DRIVE ?auto_6355 ?auto_6356 ?auto_6354 )
      ( !UNLOAD ?auto_6353 ?auto_6352 ?auto_6355 ?auto_6354 )
      ( !DROP ?auto_6353 ?auto_6352 ?auto_6351 ?auto_6354 )
      ( MAKE-1CRATE-VERIFY ?auto_6351 ?auto_6352 ) )
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
      ?auto_6373 - HOIST
      ?auto_6371 - PLACE
      ?auto_6369 - PLACE
      ?auto_6370 - HOIST
      ?auto_6372 - SURFACE
      ?auto_6375 - PLACE
      ?auto_6378 - HOIST
      ?auto_6380 - SURFACE
      ?auto_6379 - SURFACE
      ?auto_6376 - PLACE
      ?auto_6377 - HOIST
      ?auto_6381 - SURFACE
      ?auto_6374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6373 ?auto_6371 ) ( IS-CRATE ?auto_6368 ) ( not ( = ?auto_6369 ?auto_6371 ) ) ( HOIST-AT ?auto_6370 ?auto_6369 ) ( SURFACE-AT ?auto_6368 ?auto_6369 ) ( ON ?auto_6368 ?auto_6372 ) ( CLEAR ?auto_6368 ) ( not ( = ?auto_6367 ?auto_6368 ) ) ( not ( = ?auto_6367 ?auto_6372 ) ) ( not ( = ?auto_6368 ?auto_6372 ) ) ( not ( = ?auto_6373 ?auto_6370 ) ) ( IS-CRATE ?auto_6367 ) ( not ( = ?auto_6375 ?auto_6371 ) ) ( HOIST-AT ?auto_6378 ?auto_6375 ) ( AVAILABLE ?auto_6378 ) ( SURFACE-AT ?auto_6367 ?auto_6375 ) ( ON ?auto_6367 ?auto_6380 ) ( CLEAR ?auto_6367 ) ( not ( = ?auto_6366 ?auto_6367 ) ) ( not ( = ?auto_6366 ?auto_6380 ) ) ( not ( = ?auto_6367 ?auto_6380 ) ) ( not ( = ?auto_6373 ?auto_6378 ) ) ( IS-CRATE ?auto_6366 ) ( AVAILABLE ?auto_6370 ) ( SURFACE-AT ?auto_6366 ?auto_6369 ) ( ON ?auto_6366 ?auto_6379 ) ( CLEAR ?auto_6366 ) ( not ( = ?auto_6365 ?auto_6366 ) ) ( not ( = ?auto_6365 ?auto_6379 ) ) ( not ( = ?auto_6366 ?auto_6379 ) ) ( SURFACE-AT ?auto_6364 ?auto_6371 ) ( CLEAR ?auto_6364 ) ( IS-CRATE ?auto_6365 ) ( AVAILABLE ?auto_6373 ) ( not ( = ?auto_6376 ?auto_6371 ) ) ( HOIST-AT ?auto_6377 ?auto_6376 ) ( AVAILABLE ?auto_6377 ) ( SURFACE-AT ?auto_6365 ?auto_6376 ) ( ON ?auto_6365 ?auto_6381 ) ( CLEAR ?auto_6365 ) ( TRUCK-AT ?auto_6374 ?auto_6371 ) ( not ( = ?auto_6364 ?auto_6365 ) ) ( not ( = ?auto_6364 ?auto_6381 ) ) ( not ( = ?auto_6365 ?auto_6381 ) ) ( not ( = ?auto_6373 ?auto_6377 ) ) ( not ( = ?auto_6364 ?auto_6366 ) ) ( not ( = ?auto_6364 ?auto_6379 ) ) ( not ( = ?auto_6366 ?auto_6381 ) ) ( not ( = ?auto_6369 ?auto_6376 ) ) ( not ( = ?auto_6370 ?auto_6377 ) ) ( not ( = ?auto_6379 ?auto_6381 ) ) ( not ( = ?auto_6364 ?auto_6367 ) ) ( not ( = ?auto_6364 ?auto_6380 ) ) ( not ( = ?auto_6365 ?auto_6367 ) ) ( not ( = ?auto_6365 ?auto_6380 ) ) ( not ( = ?auto_6367 ?auto_6379 ) ) ( not ( = ?auto_6367 ?auto_6381 ) ) ( not ( = ?auto_6375 ?auto_6369 ) ) ( not ( = ?auto_6375 ?auto_6376 ) ) ( not ( = ?auto_6378 ?auto_6370 ) ) ( not ( = ?auto_6378 ?auto_6377 ) ) ( not ( = ?auto_6380 ?auto_6379 ) ) ( not ( = ?auto_6380 ?auto_6381 ) ) ( not ( = ?auto_6364 ?auto_6368 ) ) ( not ( = ?auto_6364 ?auto_6372 ) ) ( not ( = ?auto_6365 ?auto_6368 ) ) ( not ( = ?auto_6365 ?auto_6372 ) ) ( not ( = ?auto_6366 ?auto_6368 ) ) ( not ( = ?auto_6366 ?auto_6372 ) ) ( not ( = ?auto_6368 ?auto_6380 ) ) ( not ( = ?auto_6368 ?auto_6379 ) ) ( not ( = ?auto_6368 ?auto_6381 ) ) ( not ( = ?auto_6372 ?auto_6380 ) ) ( not ( = ?auto_6372 ?auto_6379 ) ) ( not ( = ?auto_6372 ?auto_6381 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6364 ?auto_6365 ?auto_6366 ?auto_6367 )
      ( MAKE-1CRATE ?auto_6367 ?auto_6368 )
      ( MAKE-4CRATE-VERIFY ?auto_6364 ?auto_6365 ?auto_6366 ?auto_6367 ?auto_6368 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6384 - SURFACE
      ?auto_6385 - SURFACE
    )
    :vars
    (
      ?auto_6386 - HOIST
      ?auto_6387 - PLACE
      ?auto_6389 - PLACE
      ?auto_6390 - HOIST
      ?auto_6391 - SURFACE
      ?auto_6388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6386 ?auto_6387 ) ( SURFACE-AT ?auto_6384 ?auto_6387 ) ( CLEAR ?auto_6384 ) ( IS-CRATE ?auto_6385 ) ( AVAILABLE ?auto_6386 ) ( not ( = ?auto_6389 ?auto_6387 ) ) ( HOIST-AT ?auto_6390 ?auto_6389 ) ( AVAILABLE ?auto_6390 ) ( SURFACE-AT ?auto_6385 ?auto_6389 ) ( ON ?auto_6385 ?auto_6391 ) ( CLEAR ?auto_6385 ) ( TRUCK-AT ?auto_6388 ?auto_6387 ) ( not ( = ?auto_6384 ?auto_6385 ) ) ( not ( = ?auto_6384 ?auto_6391 ) ) ( not ( = ?auto_6385 ?auto_6391 ) ) ( not ( = ?auto_6386 ?auto_6390 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6388 ?auto_6387 ?auto_6389 )
      ( !LIFT ?auto_6390 ?auto_6385 ?auto_6391 ?auto_6389 )
      ( !LOAD ?auto_6390 ?auto_6385 ?auto_6388 ?auto_6389 )
      ( !DRIVE ?auto_6388 ?auto_6389 ?auto_6387 )
      ( !UNLOAD ?auto_6386 ?auto_6385 ?auto_6388 ?auto_6387 )
      ( !DROP ?auto_6386 ?auto_6385 ?auto_6384 ?auto_6387 )
      ( MAKE-1CRATE-VERIFY ?auto_6384 ?auto_6385 ) )
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
      ?auto_6407 - HOIST
      ?auto_6405 - PLACE
      ?auto_6409 - PLACE
      ?auto_6404 - HOIST
      ?auto_6406 - SURFACE
      ?auto_6412 - PLACE
      ?auto_6415 - HOIST
      ?auto_6417 - SURFACE
      ?auto_6411 - PLACE
      ?auto_6414 - HOIST
      ?auto_6418 - SURFACE
      ?auto_6419 - SURFACE
      ?auto_6413 - PLACE
      ?auto_6410 - HOIST
      ?auto_6416 - SURFACE
      ?auto_6408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6407 ?auto_6405 ) ( IS-CRATE ?auto_6403 ) ( not ( = ?auto_6409 ?auto_6405 ) ) ( HOIST-AT ?auto_6404 ?auto_6409 ) ( AVAILABLE ?auto_6404 ) ( SURFACE-AT ?auto_6403 ?auto_6409 ) ( ON ?auto_6403 ?auto_6406 ) ( CLEAR ?auto_6403 ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6406 ) ) ( not ( = ?auto_6403 ?auto_6406 ) ) ( not ( = ?auto_6407 ?auto_6404 ) ) ( IS-CRATE ?auto_6402 ) ( not ( = ?auto_6412 ?auto_6405 ) ) ( HOIST-AT ?auto_6415 ?auto_6412 ) ( SURFACE-AT ?auto_6402 ?auto_6412 ) ( ON ?auto_6402 ?auto_6417 ) ( CLEAR ?auto_6402 ) ( not ( = ?auto_6401 ?auto_6402 ) ) ( not ( = ?auto_6401 ?auto_6417 ) ) ( not ( = ?auto_6402 ?auto_6417 ) ) ( not ( = ?auto_6407 ?auto_6415 ) ) ( IS-CRATE ?auto_6401 ) ( not ( = ?auto_6411 ?auto_6405 ) ) ( HOIST-AT ?auto_6414 ?auto_6411 ) ( AVAILABLE ?auto_6414 ) ( SURFACE-AT ?auto_6401 ?auto_6411 ) ( ON ?auto_6401 ?auto_6418 ) ( CLEAR ?auto_6401 ) ( not ( = ?auto_6400 ?auto_6401 ) ) ( not ( = ?auto_6400 ?auto_6418 ) ) ( not ( = ?auto_6401 ?auto_6418 ) ) ( not ( = ?auto_6407 ?auto_6414 ) ) ( IS-CRATE ?auto_6400 ) ( AVAILABLE ?auto_6415 ) ( SURFACE-AT ?auto_6400 ?auto_6412 ) ( ON ?auto_6400 ?auto_6419 ) ( CLEAR ?auto_6400 ) ( not ( = ?auto_6399 ?auto_6400 ) ) ( not ( = ?auto_6399 ?auto_6419 ) ) ( not ( = ?auto_6400 ?auto_6419 ) ) ( SURFACE-AT ?auto_6398 ?auto_6405 ) ( CLEAR ?auto_6398 ) ( IS-CRATE ?auto_6399 ) ( AVAILABLE ?auto_6407 ) ( not ( = ?auto_6413 ?auto_6405 ) ) ( HOIST-AT ?auto_6410 ?auto_6413 ) ( AVAILABLE ?auto_6410 ) ( SURFACE-AT ?auto_6399 ?auto_6413 ) ( ON ?auto_6399 ?auto_6416 ) ( CLEAR ?auto_6399 ) ( TRUCK-AT ?auto_6408 ?auto_6405 ) ( not ( = ?auto_6398 ?auto_6399 ) ) ( not ( = ?auto_6398 ?auto_6416 ) ) ( not ( = ?auto_6399 ?auto_6416 ) ) ( not ( = ?auto_6407 ?auto_6410 ) ) ( not ( = ?auto_6398 ?auto_6400 ) ) ( not ( = ?auto_6398 ?auto_6419 ) ) ( not ( = ?auto_6400 ?auto_6416 ) ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( not ( = ?auto_6415 ?auto_6410 ) ) ( not ( = ?auto_6419 ?auto_6416 ) ) ( not ( = ?auto_6398 ?auto_6401 ) ) ( not ( = ?auto_6398 ?auto_6418 ) ) ( not ( = ?auto_6399 ?auto_6401 ) ) ( not ( = ?auto_6399 ?auto_6418 ) ) ( not ( = ?auto_6401 ?auto_6419 ) ) ( not ( = ?auto_6401 ?auto_6416 ) ) ( not ( = ?auto_6411 ?auto_6412 ) ) ( not ( = ?auto_6411 ?auto_6413 ) ) ( not ( = ?auto_6414 ?auto_6415 ) ) ( not ( = ?auto_6414 ?auto_6410 ) ) ( not ( = ?auto_6418 ?auto_6419 ) ) ( not ( = ?auto_6418 ?auto_6416 ) ) ( not ( = ?auto_6398 ?auto_6402 ) ) ( not ( = ?auto_6398 ?auto_6417 ) ) ( not ( = ?auto_6399 ?auto_6402 ) ) ( not ( = ?auto_6399 ?auto_6417 ) ) ( not ( = ?auto_6400 ?auto_6402 ) ) ( not ( = ?auto_6400 ?auto_6417 ) ) ( not ( = ?auto_6402 ?auto_6418 ) ) ( not ( = ?auto_6402 ?auto_6419 ) ) ( not ( = ?auto_6402 ?auto_6416 ) ) ( not ( = ?auto_6417 ?auto_6418 ) ) ( not ( = ?auto_6417 ?auto_6419 ) ) ( not ( = ?auto_6417 ?auto_6416 ) ) ( not ( = ?auto_6398 ?auto_6403 ) ) ( not ( = ?auto_6398 ?auto_6406 ) ) ( not ( = ?auto_6399 ?auto_6403 ) ) ( not ( = ?auto_6399 ?auto_6406 ) ) ( not ( = ?auto_6400 ?auto_6403 ) ) ( not ( = ?auto_6400 ?auto_6406 ) ) ( not ( = ?auto_6401 ?auto_6403 ) ) ( not ( = ?auto_6401 ?auto_6406 ) ) ( not ( = ?auto_6403 ?auto_6417 ) ) ( not ( = ?auto_6403 ?auto_6418 ) ) ( not ( = ?auto_6403 ?auto_6419 ) ) ( not ( = ?auto_6403 ?auto_6416 ) ) ( not ( = ?auto_6409 ?auto_6412 ) ) ( not ( = ?auto_6409 ?auto_6411 ) ) ( not ( = ?auto_6409 ?auto_6413 ) ) ( not ( = ?auto_6404 ?auto_6415 ) ) ( not ( = ?auto_6404 ?auto_6414 ) ) ( not ( = ?auto_6404 ?auto_6410 ) ) ( not ( = ?auto_6406 ?auto_6417 ) ) ( not ( = ?auto_6406 ?auto_6418 ) ) ( not ( = ?auto_6406 ?auto_6419 ) ) ( not ( = ?auto_6406 ?auto_6416 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6398 ?auto_6399 ?auto_6400 ?auto_6401 ?auto_6402 )
      ( MAKE-1CRATE ?auto_6402 ?auto_6403 )
      ( MAKE-5CRATE-VERIFY ?auto_6398 ?auto_6399 ?auto_6400 ?auto_6401 ?auto_6402 ?auto_6403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6422 - SURFACE
      ?auto_6423 - SURFACE
    )
    :vars
    (
      ?auto_6424 - HOIST
      ?auto_6425 - PLACE
      ?auto_6427 - PLACE
      ?auto_6428 - HOIST
      ?auto_6429 - SURFACE
      ?auto_6426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6424 ?auto_6425 ) ( SURFACE-AT ?auto_6422 ?auto_6425 ) ( CLEAR ?auto_6422 ) ( IS-CRATE ?auto_6423 ) ( AVAILABLE ?auto_6424 ) ( not ( = ?auto_6427 ?auto_6425 ) ) ( HOIST-AT ?auto_6428 ?auto_6427 ) ( AVAILABLE ?auto_6428 ) ( SURFACE-AT ?auto_6423 ?auto_6427 ) ( ON ?auto_6423 ?auto_6429 ) ( CLEAR ?auto_6423 ) ( TRUCK-AT ?auto_6426 ?auto_6425 ) ( not ( = ?auto_6422 ?auto_6423 ) ) ( not ( = ?auto_6422 ?auto_6429 ) ) ( not ( = ?auto_6423 ?auto_6429 ) ) ( not ( = ?auto_6424 ?auto_6428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6426 ?auto_6425 ?auto_6427 )
      ( !LIFT ?auto_6428 ?auto_6423 ?auto_6429 ?auto_6427 )
      ( !LOAD ?auto_6428 ?auto_6423 ?auto_6426 ?auto_6427 )
      ( !DRIVE ?auto_6426 ?auto_6427 ?auto_6425 )
      ( !UNLOAD ?auto_6424 ?auto_6423 ?auto_6426 ?auto_6425 )
      ( !DROP ?auto_6424 ?auto_6423 ?auto_6422 ?auto_6425 )
      ( MAKE-1CRATE-VERIFY ?auto_6422 ?auto_6423 ) )
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
      ?auto_6449 - HOIST
      ?auto_6448 - PLACE
      ?auto_6446 - PLACE
      ?auto_6445 - HOIST
      ?auto_6444 - SURFACE
      ?auto_6461 - PLACE
      ?auto_6460 - HOIST
      ?auto_6459 - SURFACE
      ?auto_6457 - PLACE
      ?auto_6455 - HOIST
      ?auto_6450 - SURFACE
      ?auto_6452 - PLACE
      ?auto_6456 - HOIST
      ?auto_6462 - SURFACE
      ?auto_6453 - SURFACE
      ?auto_6454 - PLACE
      ?auto_6451 - HOIST
      ?auto_6458 - SURFACE
      ?auto_6447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6449 ?auto_6448 ) ( IS-CRATE ?auto_6443 ) ( not ( = ?auto_6446 ?auto_6448 ) ) ( HOIST-AT ?auto_6445 ?auto_6446 ) ( AVAILABLE ?auto_6445 ) ( SURFACE-AT ?auto_6443 ?auto_6446 ) ( ON ?auto_6443 ?auto_6444 ) ( CLEAR ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6449 ?auto_6445 ) ) ( IS-CRATE ?auto_6442 ) ( not ( = ?auto_6461 ?auto_6448 ) ) ( HOIST-AT ?auto_6460 ?auto_6461 ) ( AVAILABLE ?auto_6460 ) ( SURFACE-AT ?auto_6442 ?auto_6461 ) ( ON ?auto_6442 ?auto_6459 ) ( CLEAR ?auto_6442 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6459 ) ) ( not ( = ?auto_6442 ?auto_6459 ) ) ( not ( = ?auto_6449 ?auto_6460 ) ) ( IS-CRATE ?auto_6441 ) ( not ( = ?auto_6457 ?auto_6448 ) ) ( HOIST-AT ?auto_6455 ?auto_6457 ) ( SURFACE-AT ?auto_6441 ?auto_6457 ) ( ON ?auto_6441 ?auto_6450 ) ( CLEAR ?auto_6441 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6450 ) ) ( not ( = ?auto_6441 ?auto_6450 ) ) ( not ( = ?auto_6449 ?auto_6455 ) ) ( IS-CRATE ?auto_6440 ) ( not ( = ?auto_6452 ?auto_6448 ) ) ( HOIST-AT ?auto_6456 ?auto_6452 ) ( AVAILABLE ?auto_6456 ) ( SURFACE-AT ?auto_6440 ?auto_6452 ) ( ON ?auto_6440 ?auto_6462 ) ( CLEAR ?auto_6440 ) ( not ( = ?auto_6439 ?auto_6440 ) ) ( not ( = ?auto_6439 ?auto_6462 ) ) ( not ( = ?auto_6440 ?auto_6462 ) ) ( not ( = ?auto_6449 ?auto_6456 ) ) ( IS-CRATE ?auto_6439 ) ( AVAILABLE ?auto_6455 ) ( SURFACE-AT ?auto_6439 ?auto_6457 ) ( ON ?auto_6439 ?auto_6453 ) ( CLEAR ?auto_6439 ) ( not ( = ?auto_6438 ?auto_6439 ) ) ( not ( = ?auto_6438 ?auto_6453 ) ) ( not ( = ?auto_6439 ?auto_6453 ) ) ( SURFACE-AT ?auto_6437 ?auto_6448 ) ( CLEAR ?auto_6437 ) ( IS-CRATE ?auto_6438 ) ( AVAILABLE ?auto_6449 ) ( not ( = ?auto_6454 ?auto_6448 ) ) ( HOIST-AT ?auto_6451 ?auto_6454 ) ( AVAILABLE ?auto_6451 ) ( SURFACE-AT ?auto_6438 ?auto_6454 ) ( ON ?auto_6438 ?auto_6458 ) ( CLEAR ?auto_6438 ) ( TRUCK-AT ?auto_6447 ?auto_6448 ) ( not ( = ?auto_6437 ?auto_6438 ) ) ( not ( = ?auto_6437 ?auto_6458 ) ) ( not ( = ?auto_6438 ?auto_6458 ) ) ( not ( = ?auto_6449 ?auto_6451 ) ) ( not ( = ?auto_6437 ?auto_6439 ) ) ( not ( = ?auto_6437 ?auto_6453 ) ) ( not ( = ?auto_6439 ?auto_6458 ) ) ( not ( = ?auto_6457 ?auto_6454 ) ) ( not ( = ?auto_6455 ?auto_6451 ) ) ( not ( = ?auto_6453 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6440 ) ) ( not ( = ?auto_6437 ?auto_6462 ) ) ( not ( = ?auto_6438 ?auto_6440 ) ) ( not ( = ?auto_6438 ?auto_6462 ) ) ( not ( = ?auto_6440 ?auto_6453 ) ) ( not ( = ?auto_6440 ?auto_6458 ) ) ( not ( = ?auto_6452 ?auto_6457 ) ) ( not ( = ?auto_6452 ?auto_6454 ) ) ( not ( = ?auto_6456 ?auto_6455 ) ) ( not ( = ?auto_6456 ?auto_6451 ) ) ( not ( = ?auto_6462 ?auto_6453 ) ) ( not ( = ?auto_6462 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6441 ) ) ( not ( = ?auto_6437 ?auto_6450 ) ) ( not ( = ?auto_6438 ?auto_6441 ) ) ( not ( = ?auto_6438 ?auto_6450 ) ) ( not ( = ?auto_6439 ?auto_6441 ) ) ( not ( = ?auto_6439 ?auto_6450 ) ) ( not ( = ?auto_6441 ?auto_6462 ) ) ( not ( = ?auto_6441 ?auto_6453 ) ) ( not ( = ?auto_6441 ?auto_6458 ) ) ( not ( = ?auto_6450 ?auto_6462 ) ) ( not ( = ?auto_6450 ?auto_6453 ) ) ( not ( = ?auto_6450 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6442 ) ) ( not ( = ?auto_6437 ?auto_6459 ) ) ( not ( = ?auto_6438 ?auto_6442 ) ) ( not ( = ?auto_6438 ?auto_6459 ) ) ( not ( = ?auto_6439 ?auto_6442 ) ) ( not ( = ?auto_6439 ?auto_6459 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6459 ) ) ( not ( = ?auto_6442 ?auto_6450 ) ) ( not ( = ?auto_6442 ?auto_6462 ) ) ( not ( = ?auto_6442 ?auto_6453 ) ) ( not ( = ?auto_6442 ?auto_6458 ) ) ( not ( = ?auto_6461 ?auto_6457 ) ) ( not ( = ?auto_6461 ?auto_6452 ) ) ( not ( = ?auto_6461 ?auto_6454 ) ) ( not ( = ?auto_6460 ?auto_6455 ) ) ( not ( = ?auto_6460 ?auto_6456 ) ) ( not ( = ?auto_6460 ?auto_6451 ) ) ( not ( = ?auto_6459 ?auto_6450 ) ) ( not ( = ?auto_6459 ?auto_6462 ) ) ( not ( = ?auto_6459 ?auto_6453 ) ) ( not ( = ?auto_6459 ?auto_6458 ) ) ( not ( = ?auto_6437 ?auto_6443 ) ) ( not ( = ?auto_6437 ?auto_6444 ) ) ( not ( = ?auto_6438 ?auto_6443 ) ) ( not ( = ?auto_6438 ?auto_6444 ) ) ( not ( = ?auto_6439 ?auto_6443 ) ) ( not ( = ?auto_6439 ?auto_6444 ) ) ( not ( = ?auto_6440 ?auto_6443 ) ) ( not ( = ?auto_6440 ?auto_6444 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6459 ) ) ( not ( = ?auto_6443 ?auto_6450 ) ) ( not ( = ?auto_6443 ?auto_6462 ) ) ( not ( = ?auto_6443 ?auto_6453 ) ) ( not ( = ?auto_6443 ?auto_6458 ) ) ( not ( = ?auto_6446 ?auto_6461 ) ) ( not ( = ?auto_6446 ?auto_6457 ) ) ( not ( = ?auto_6446 ?auto_6452 ) ) ( not ( = ?auto_6446 ?auto_6454 ) ) ( not ( = ?auto_6445 ?auto_6460 ) ) ( not ( = ?auto_6445 ?auto_6455 ) ) ( not ( = ?auto_6445 ?auto_6456 ) ) ( not ( = ?auto_6445 ?auto_6451 ) ) ( not ( = ?auto_6444 ?auto_6459 ) ) ( not ( = ?auto_6444 ?auto_6450 ) ) ( not ( = ?auto_6444 ?auto_6462 ) ) ( not ( = ?auto_6444 ?auto_6453 ) ) ( not ( = ?auto_6444 ?auto_6458 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6437 ?auto_6438 ?auto_6439 ?auto_6440 ?auto_6441 ?auto_6442 )
      ( MAKE-1CRATE ?auto_6442 ?auto_6443 )
      ( MAKE-6CRATE-VERIFY ?auto_6437 ?auto_6438 ?auto_6439 ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6465 - SURFACE
      ?auto_6466 - SURFACE
    )
    :vars
    (
      ?auto_6467 - HOIST
      ?auto_6468 - PLACE
      ?auto_6470 - PLACE
      ?auto_6471 - HOIST
      ?auto_6472 - SURFACE
      ?auto_6469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6467 ?auto_6468 ) ( SURFACE-AT ?auto_6465 ?auto_6468 ) ( CLEAR ?auto_6465 ) ( IS-CRATE ?auto_6466 ) ( AVAILABLE ?auto_6467 ) ( not ( = ?auto_6470 ?auto_6468 ) ) ( HOIST-AT ?auto_6471 ?auto_6470 ) ( AVAILABLE ?auto_6471 ) ( SURFACE-AT ?auto_6466 ?auto_6470 ) ( ON ?auto_6466 ?auto_6472 ) ( CLEAR ?auto_6466 ) ( TRUCK-AT ?auto_6469 ?auto_6468 ) ( not ( = ?auto_6465 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6472 ) ) ( not ( = ?auto_6466 ?auto_6472 ) ) ( not ( = ?auto_6467 ?auto_6471 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6469 ?auto_6468 ?auto_6470 )
      ( !LIFT ?auto_6471 ?auto_6466 ?auto_6472 ?auto_6470 )
      ( !LOAD ?auto_6471 ?auto_6466 ?auto_6469 ?auto_6470 )
      ( !DRIVE ?auto_6469 ?auto_6470 ?auto_6468 )
      ( !UNLOAD ?auto_6467 ?auto_6466 ?auto_6469 ?auto_6468 )
      ( !DROP ?auto_6467 ?auto_6466 ?auto_6465 ?auto_6468 )
      ( MAKE-1CRATE-VERIFY ?auto_6465 ?auto_6466 ) )
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
      ?auto_6494 - HOIST
      ?auto_6492 - PLACE
      ?auto_6493 - PLACE
      ?auto_6491 - HOIST
      ?auto_6490 - SURFACE
      ?auto_6508 - SURFACE
      ?auto_6498 - PLACE
      ?auto_6503 - HOIST
      ?auto_6504 - SURFACE
      ?auto_6495 - PLACE
      ?auto_6496 - HOIST
      ?auto_6507 - SURFACE
      ?auto_6506 - PLACE
      ?auto_6500 - HOIST
      ?auto_6497 - SURFACE
      ?auto_6505 - SURFACE
      ?auto_6501 - PLACE
      ?auto_6499 - HOIST
      ?auto_6502 - SURFACE
      ?auto_6489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6494 ?auto_6492 ) ( IS-CRATE ?auto_6488 ) ( not ( = ?auto_6493 ?auto_6492 ) ) ( HOIST-AT ?auto_6491 ?auto_6493 ) ( SURFACE-AT ?auto_6488 ?auto_6493 ) ( ON ?auto_6488 ?auto_6490 ) ( CLEAR ?auto_6488 ) ( not ( = ?auto_6487 ?auto_6488 ) ) ( not ( = ?auto_6487 ?auto_6490 ) ) ( not ( = ?auto_6488 ?auto_6490 ) ) ( not ( = ?auto_6494 ?auto_6491 ) ) ( IS-CRATE ?auto_6487 ) ( AVAILABLE ?auto_6491 ) ( SURFACE-AT ?auto_6487 ?auto_6493 ) ( ON ?auto_6487 ?auto_6508 ) ( CLEAR ?auto_6487 ) ( not ( = ?auto_6486 ?auto_6487 ) ) ( not ( = ?auto_6486 ?auto_6508 ) ) ( not ( = ?auto_6487 ?auto_6508 ) ) ( IS-CRATE ?auto_6486 ) ( not ( = ?auto_6498 ?auto_6492 ) ) ( HOIST-AT ?auto_6503 ?auto_6498 ) ( AVAILABLE ?auto_6503 ) ( SURFACE-AT ?auto_6486 ?auto_6498 ) ( ON ?auto_6486 ?auto_6504 ) ( CLEAR ?auto_6486 ) ( not ( = ?auto_6485 ?auto_6486 ) ) ( not ( = ?auto_6485 ?auto_6504 ) ) ( not ( = ?auto_6486 ?auto_6504 ) ) ( not ( = ?auto_6494 ?auto_6503 ) ) ( IS-CRATE ?auto_6485 ) ( not ( = ?auto_6495 ?auto_6492 ) ) ( HOIST-AT ?auto_6496 ?auto_6495 ) ( SURFACE-AT ?auto_6485 ?auto_6495 ) ( ON ?auto_6485 ?auto_6507 ) ( CLEAR ?auto_6485 ) ( not ( = ?auto_6484 ?auto_6485 ) ) ( not ( = ?auto_6484 ?auto_6507 ) ) ( not ( = ?auto_6485 ?auto_6507 ) ) ( not ( = ?auto_6494 ?auto_6496 ) ) ( IS-CRATE ?auto_6484 ) ( not ( = ?auto_6506 ?auto_6492 ) ) ( HOIST-AT ?auto_6500 ?auto_6506 ) ( AVAILABLE ?auto_6500 ) ( SURFACE-AT ?auto_6484 ?auto_6506 ) ( ON ?auto_6484 ?auto_6497 ) ( CLEAR ?auto_6484 ) ( not ( = ?auto_6483 ?auto_6484 ) ) ( not ( = ?auto_6483 ?auto_6497 ) ) ( not ( = ?auto_6484 ?auto_6497 ) ) ( not ( = ?auto_6494 ?auto_6500 ) ) ( IS-CRATE ?auto_6483 ) ( AVAILABLE ?auto_6496 ) ( SURFACE-AT ?auto_6483 ?auto_6495 ) ( ON ?auto_6483 ?auto_6505 ) ( CLEAR ?auto_6483 ) ( not ( = ?auto_6482 ?auto_6483 ) ) ( not ( = ?auto_6482 ?auto_6505 ) ) ( not ( = ?auto_6483 ?auto_6505 ) ) ( SURFACE-AT ?auto_6481 ?auto_6492 ) ( CLEAR ?auto_6481 ) ( IS-CRATE ?auto_6482 ) ( AVAILABLE ?auto_6494 ) ( not ( = ?auto_6501 ?auto_6492 ) ) ( HOIST-AT ?auto_6499 ?auto_6501 ) ( AVAILABLE ?auto_6499 ) ( SURFACE-AT ?auto_6482 ?auto_6501 ) ( ON ?auto_6482 ?auto_6502 ) ( CLEAR ?auto_6482 ) ( TRUCK-AT ?auto_6489 ?auto_6492 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( not ( = ?auto_6481 ?auto_6502 ) ) ( not ( = ?auto_6482 ?auto_6502 ) ) ( not ( = ?auto_6494 ?auto_6499 ) ) ( not ( = ?auto_6481 ?auto_6483 ) ) ( not ( = ?auto_6481 ?auto_6505 ) ) ( not ( = ?auto_6483 ?auto_6502 ) ) ( not ( = ?auto_6495 ?auto_6501 ) ) ( not ( = ?auto_6496 ?auto_6499 ) ) ( not ( = ?auto_6505 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6484 ) ) ( not ( = ?auto_6481 ?auto_6497 ) ) ( not ( = ?auto_6482 ?auto_6484 ) ) ( not ( = ?auto_6482 ?auto_6497 ) ) ( not ( = ?auto_6484 ?auto_6505 ) ) ( not ( = ?auto_6484 ?auto_6502 ) ) ( not ( = ?auto_6506 ?auto_6495 ) ) ( not ( = ?auto_6506 ?auto_6501 ) ) ( not ( = ?auto_6500 ?auto_6496 ) ) ( not ( = ?auto_6500 ?auto_6499 ) ) ( not ( = ?auto_6497 ?auto_6505 ) ) ( not ( = ?auto_6497 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6485 ) ) ( not ( = ?auto_6481 ?auto_6507 ) ) ( not ( = ?auto_6482 ?auto_6485 ) ) ( not ( = ?auto_6482 ?auto_6507 ) ) ( not ( = ?auto_6483 ?auto_6485 ) ) ( not ( = ?auto_6483 ?auto_6507 ) ) ( not ( = ?auto_6485 ?auto_6497 ) ) ( not ( = ?auto_6485 ?auto_6505 ) ) ( not ( = ?auto_6485 ?auto_6502 ) ) ( not ( = ?auto_6507 ?auto_6497 ) ) ( not ( = ?auto_6507 ?auto_6505 ) ) ( not ( = ?auto_6507 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6486 ) ) ( not ( = ?auto_6481 ?auto_6504 ) ) ( not ( = ?auto_6482 ?auto_6486 ) ) ( not ( = ?auto_6482 ?auto_6504 ) ) ( not ( = ?auto_6483 ?auto_6486 ) ) ( not ( = ?auto_6483 ?auto_6504 ) ) ( not ( = ?auto_6484 ?auto_6486 ) ) ( not ( = ?auto_6484 ?auto_6504 ) ) ( not ( = ?auto_6486 ?auto_6507 ) ) ( not ( = ?auto_6486 ?auto_6497 ) ) ( not ( = ?auto_6486 ?auto_6505 ) ) ( not ( = ?auto_6486 ?auto_6502 ) ) ( not ( = ?auto_6498 ?auto_6495 ) ) ( not ( = ?auto_6498 ?auto_6506 ) ) ( not ( = ?auto_6498 ?auto_6501 ) ) ( not ( = ?auto_6503 ?auto_6496 ) ) ( not ( = ?auto_6503 ?auto_6500 ) ) ( not ( = ?auto_6503 ?auto_6499 ) ) ( not ( = ?auto_6504 ?auto_6507 ) ) ( not ( = ?auto_6504 ?auto_6497 ) ) ( not ( = ?auto_6504 ?auto_6505 ) ) ( not ( = ?auto_6504 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6487 ) ) ( not ( = ?auto_6481 ?auto_6508 ) ) ( not ( = ?auto_6482 ?auto_6487 ) ) ( not ( = ?auto_6482 ?auto_6508 ) ) ( not ( = ?auto_6483 ?auto_6487 ) ) ( not ( = ?auto_6483 ?auto_6508 ) ) ( not ( = ?auto_6484 ?auto_6487 ) ) ( not ( = ?auto_6484 ?auto_6508 ) ) ( not ( = ?auto_6485 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6508 ) ) ( not ( = ?auto_6487 ?auto_6504 ) ) ( not ( = ?auto_6487 ?auto_6507 ) ) ( not ( = ?auto_6487 ?auto_6497 ) ) ( not ( = ?auto_6487 ?auto_6505 ) ) ( not ( = ?auto_6487 ?auto_6502 ) ) ( not ( = ?auto_6493 ?auto_6498 ) ) ( not ( = ?auto_6493 ?auto_6495 ) ) ( not ( = ?auto_6493 ?auto_6506 ) ) ( not ( = ?auto_6493 ?auto_6501 ) ) ( not ( = ?auto_6491 ?auto_6503 ) ) ( not ( = ?auto_6491 ?auto_6496 ) ) ( not ( = ?auto_6491 ?auto_6500 ) ) ( not ( = ?auto_6491 ?auto_6499 ) ) ( not ( = ?auto_6508 ?auto_6504 ) ) ( not ( = ?auto_6508 ?auto_6507 ) ) ( not ( = ?auto_6508 ?auto_6497 ) ) ( not ( = ?auto_6508 ?auto_6505 ) ) ( not ( = ?auto_6508 ?auto_6502 ) ) ( not ( = ?auto_6481 ?auto_6488 ) ) ( not ( = ?auto_6481 ?auto_6490 ) ) ( not ( = ?auto_6482 ?auto_6488 ) ) ( not ( = ?auto_6482 ?auto_6490 ) ) ( not ( = ?auto_6483 ?auto_6488 ) ) ( not ( = ?auto_6483 ?auto_6490 ) ) ( not ( = ?auto_6484 ?auto_6488 ) ) ( not ( = ?auto_6484 ?auto_6490 ) ) ( not ( = ?auto_6485 ?auto_6488 ) ) ( not ( = ?auto_6485 ?auto_6490 ) ) ( not ( = ?auto_6486 ?auto_6488 ) ) ( not ( = ?auto_6486 ?auto_6490 ) ) ( not ( = ?auto_6488 ?auto_6508 ) ) ( not ( = ?auto_6488 ?auto_6504 ) ) ( not ( = ?auto_6488 ?auto_6507 ) ) ( not ( = ?auto_6488 ?auto_6497 ) ) ( not ( = ?auto_6488 ?auto_6505 ) ) ( not ( = ?auto_6488 ?auto_6502 ) ) ( not ( = ?auto_6490 ?auto_6508 ) ) ( not ( = ?auto_6490 ?auto_6504 ) ) ( not ( = ?auto_6490 ?auto_6507 ) ) ( not ( = ?auto_6490 ?auto_6497 ) ) ( not ( = ?auto_6490 ?auto_6505 ) ) ( not ( = ?auto_6490 ?auto_6502 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 ?auto_6485 ?auto_6486 ?auto_6487 )
      ( MAKE-1CRATE ?auto_6487 ?auto_6488 )
      ( MAKE-7CRATE-VERIFY ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 ?auto_6485 ?auto_6486 ?auto_6487 ?auto_6488 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6511 - SURFACE
      ?auto_6512 - SURFACE
    )
    :vars
    (
      ?auto_6513 - HOIST
      ?auto_6514 - PLACE
      ?auto_6516 - PLACE
      ?auto_6517 - HOIST
      ?auto_6518 - SURFACE
      ?auto_6515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6513 ?auto_6514 ) ( SURFACE-AT ?auto_6511 ?auto_6514 ) ( CLEAR ?auto_6511 ) ( IS-CRATE ?auto_6512 ) ( AVAILABLE ?auto_6513 ) ( not ( = ?auto_6516 ?auto_6514 ) ) ( HOIST-AT ?auto_6517 ?auto_6516 ) ( AVAILABLE ?auto_6517 ) ( SURFACE-AT ?auto_6512 ?auto_6516 ) ( ON ?auto_6512 ?auto_6518 ) ( CLEAR ?auto_6512 ) ( TRUCK-AT ?auto_6515 ?auto_6514 ) ( not ( = ?auto_6511 ?auto_6512 ) ) ( not ( = ?auto_6511 ?auto_6518 ) ) ( not ( = ?auto_6512 ?auto_6518 ) ) ( not ( = ?auto_6513 ?auto_6517 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6515 ?auto_6514 ?auto_6516 )
      ( !LIFT ?auto_6517 ?auto_6512 ?auto_6518 ?auto_6516 )
      ( !LOAD ?auto_6517 ?auto_6512 ?auto_6515 ?auto_6516 )
      ( !DRIVE ?auto_6515 ?auto_6516 ?auto_6514 )
      ( !UNLOAD ?auto_6513 ?auto_6512 ?auto_6515 ?auto_6514 )
      ( !DROP ?auto_6513 ?auto_6512 ?auto_6511 ?auto_6514 )
      ( MAKE-1CRATE-VERIFY ?auto_6511 ?auto_6512 ) )
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
      ?auto_6536 - SURFACE
      ?auto_6535 - SURFACE
    )
    :vars
    (
      ?auto_6541 - HOIST
      ?auto_6540 - PLACE
      ?auto_6538 - PLACE
      ?auto_6537 - HOIST
      ?auto_6539 - SURFACE
      ?auto_6553 - PLACE
      ?auto_6552 - HOIST
      ?auto_6543 - SURFACE
      ?auto_6551 - SURFACE
      ?auto_6547 - SURFACE
      ?auto_6546 - PLACE
      ?auto_6557 - HOIST
      ?auto_6549 - SURFACE
      ?auto_6550 - PLACE
      ?auto_6555 - HOIST
      ?auto_6544 - SURFACE
      ?auto_6548 - SURFACE
      ?auto_6554 - PLACE
      ?auto_6556 - HOIST
      ?auto_6545 - SURFACE
      ?auto_6542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6541 ?auto_6540 ) ( IS-CRATE ?auto_6535 ) ( not ( = ?auto_6538 ?auto_6540 ) ) ( HOIST-AT ?auto_6537 ?auto_6538 ) ( SURFACE-AT ?auto_6535 ?auto_6538 ) ( ON ?auto_6535 ?auto_6539 ) ( CLEAR ?auto_6535 ) ( not ( = ?auto_6536 ?auto_6535 ) ) ( not ( = ?auto_6536 ?auto_6539 ) ) ( not ( = ?auto_6535 ?auto_6539 ) ) ( not ( = ?auto_6541 ?auto_6537 ) ) ( IS-CRATE ?auto_6536 ) ( not ( = ?auto_6553 ?auto_6540 ) ) ( HOIST-AT ?auto_6552 ?auto_6553 ) ( SURFACE-AT ?auto_6536 ?auto_6553 ) ( ON ?auto_6536 ?auto_6543 ) ( CLEAR ?auto_6536 ) ( not ( = ?auto_6534 ?auto_6536 ) ) ( not ( = ?auto_6534 ?auto_6543 ) ) ( not ( = ?auto_6536 ?auto_6543 ) ) ( not ( = ?auto_6541 ?auto_6552 ) ) ( IS-CRATE ?auto_6534 ) ( AVAILABLE ?auto_6552 ) ( SURFACE-AT ?auto_6534 ?auto_6553 ) ( ON ?auto_6534 ?auto_6551 ) ( CLEAR ?auto_6534 ) ( not ( = ?auto_6533 ?auto_6534 ) ) ( not ( = ?auto_6533 ?auto_6551 ) ) ( not ( = ?auto_6534 ?auto_6551 ) ) ( IS-CRATE ?auto_6533 ) ( AVAILABLE ?auto_6537 ) ( SURFACE-AT ?auto_6533 ?auto_6538 ) ( ON ?auto_6533 ?auto_6547 ) ( CLEAR ?auto_6533 ) ( not ( = ?auto_6532 ?auto_6533 ) ) ( not ( = ?auto_6532 ?auto_6547 ) ) ( not ( = ?auto_6533 ?auto_6547 ) ) ( IS-CRATE ?auto_6532 ) ( not ( = ?auto_6546 ?auto_6540 ) ) ( HOIST-AT ?auto_6557 ?auto_6546 ) ( SURFACE-AT ?auto_6532 ?auto_6546 ) ( ON ?auto_6532 ?auto_6549 ) ( CLEAR ?auto_6532 ) ( not ( = ?auto_6531 ?auto_6532 ) ) ( not ( = ?auto_6531 ?auto_6549 ) ) ( not ( = ?auto_6532 ?auto_6549 ) ) ( not ( = ?auto_6541 ?auto_6557 ) ) ( IS-CRATE ?auto_6531 ) ( not ( = ?auto_6550 ?auto_6540 ) ) ( HOIST-AT ?auto_6555 ?auto_6550 ) ( AVAILABLE ?auto_6555 ) ( SURFACE-AT ?auto_6531 ?auto_6550 ) ( ON ?auto_6531 ?auto_6544 ) ( CLEAR ?auto_6531 ) ( not ( = ?auto_6530 ?auto_6531 ) ) ( not ( = ?auto_6530 ?auto_6544 ) ) ( not ( = ?auto_6531 ?auto_6544 ) ) ( not ( = ?auto_6541 ?auto_6555 ) ) ( IS-CRATE ?auto_6530 ) ( AVAILABLE ?auto_6557 ) ( SURFACE-AT ?auto_6530 ?auto_6546 ) ( ON ?auto_6530 ?auto_6548 ) ( CLEAR ?auto_6530 ) ( not ( = ?auto_6529 ?auto_6530 ) ) ( not ( = ?auto_6529 ?auto_6548 ) ) ( not ( = ?auto_6530 ?auto_6548 ) ) ( SURFACE-AT ?auto_6528 ?auto_6540 ) ( CLEAR ?auto_6528 ) ( IS-CRATE ?auto_6529 ) ( AVAILABLE ?auto_6541 ) ( not ( = ?auto_6554 ?auto_6540 ) ) ( HOIST-AT ?auto_6556 ?auto_6554 ) ( AVAILABLE ?auto_6556 ) ( SURFACE-AT ?auto_6529 ?auto_6554 ) ( ON ?auto_6529 ?auto_6545 ) ( CLEAR ?auto_6529 ) ( TRUCK-AT ?auto_6542 ?auto_6540 ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6545 ) ) ( not ( = ?auto_6529 ?auto_6545 ) ) ( not ( = ?auto_6541 ?auto_6556 ) ) ( not ( = ?auto_6528 ?auto_6530 ) ) ( not ( = ?auto_6528 ?auto_6548 ) ) ( not ( = ?auto_6530 ?auto_6545 ) ) ( not ( = ?auto_6546 ?auto_6554 ) ) ( not ( = ?auto_6557 ?auto_6556 ) ) ( not ( = ?auto_6548 ?auto_6545 ) ) ( not ( = ?auto_6528 ?auto_6531 ) ) ( not ( = ?auto_6528 ?auto_6544 ) ) ( not ( = ?auto_6529 ?auto_6531 ) ) ( not ( = ?auto_6529 ?auto_6544 ) ) ( not ( = ?auto_6531 ?auto_6548 ) ) ( not ( = ?auto_6531 ?auto_6545 ) ) ( not ( = ?auto_6550 ?auto_6546 ) ) ( not ( = ?auto_6550 ?auto_6554 ) ) ( not ( = ?auto_6555 ?auto_6557 ) ) ( not ( = ?auto_6555 ?auto_6556 ) ) ( not ( = ?auto_6544 ?auto_6548 ) ) ( not ( = ?auto_6544 ?auto_6545 ) ) ( not ( = ?auto_6528 ?auto_6532 ) ) ( not ( = ?auto_6528 ?auto_6549 ) ) ( not ( = ?auto_6529 ?auto_6532 ) ) ( not ( = ?auto_6529 ?auto_6549 ) ) ( not ( = ?auto_6530 ?auto_6532 ) ) ( not ( = ?auto_6530 ?auto_6549 ) ) ( not ( = ?auto_6532 ?auto_6544 ) ) ( not ( = ?auto_6532 ?auto_6548 ) ) ( not ( = ?auto_6532 ?auto_6545 ) ) ( not ( = ?auto_6549 ?auto_6544 ) ) ( not ( = ?auto_6549 ?auto_6548 ) ) ( not ( = ?auto_6549 ?auto_6545 ) ) ( not ( = ?auto_6528 ?auto_6533 ) ) ( not ( = ?auto_6528 ?auto_6547 ) ) ( not ( = ?auto_6529 ?auto_6533 ) ) ( not ( = ?auto_6529 ?auto_6547 ) ) ( not ( = ?auto_6530 ?auto_6533 ) ) ( not ( = ?auto_6530 ?auto_6547 ) ) ( not ( = ?auto_6531 ?auto_6533 ) ) ( not ( = ?auto_6531 ?auto_6547 ) ) ( not ( = ?auto_6533 ?auto_6549 ) ) ( not ( = ?auto_6533 ?auto_6544 ) ) ( not ( = ?auto_6533 ?auto_6548 ) ) ( not ( = ?auto_6533 ?auto_6545 ) ) ( not ( = ?auto_6538 ?auto_6546 ) ) ( not ( = ?auto_6538 ?auto_6550 ) ) ( not ( = ?auto_6538 ?auto_6554 ) ) ( not ( = ?auto_6537 ?auto_6557 ) ) ( not ( = ?auto_6537 ?auto_6555 ) ) ( not ( = ?auto_6537 ?auto_6556 ) ) ( not ( = ?auto_6547 ?auto_6549 ) ) ( not ( = ?auto_6547 ?auto_6544 ) ) ( not ( = ?auto_6547 ?auto_6548 ) ) ( not ( = ?auto_6547 ?auto_6545 ) ) ( not ( = ?auto_6528 ?auto_6534 ) ) ( not ( = ?auto_6528 ?auto_6551 ) ) ( not ( = ?auto_6529 ?auto_6534 ) ) ( not ( = ?auto_6529 ?auto_6551 ) ) ( not ( = ?auto_6530 ?auto_6534 ) ) ( not ( = ?auto_6530 ?auto_6551 ) ) ( not ( = ?auto_6531 ?auto_6534 ) ) ( not ( = ?auto_6531 ?auto_6551 ) ) ( not ( = ?auto_6532 ?auto_6534 ) ) ( not ( = ?auto_6532 ?auto_6551 ) ) ( not ( = ?auto_6534 ?auto_6547 ) ) ( not ( = ?auto_6534 ?auto_6549 ) ) ( not ( = ?auto_6534 ?auto_6544 ) ) ( not ( = ?auto_6534 ?auto_6548 ) ) ( not ( = ?auto_6534 ?auto_6545 ) ) ( not ( = ?auto_6553 ?auto_6538 ) ) ( not ( = ?auto_6553 ?auto_6546 ) ) ( not ( = ?auto_6553 ?auto_6550 ) ) ( not ( = ?auto_6553 ?auto_6554 ) ) ( not ( = ?auto_6552 ?auto_6537 ) ) ( not ( = ?auto_6552 ?auto_6557 ) ) ( not ( = ?auto_6552 ?auto_6555 ) ) ( not ( = ?auto_6552 ?auto_6556 ) ) ( not ( = ?auto_6551 ?auto_6547 ) ) ( not ( = ?auto_6551 ?auto_6549 ) ) ( not ( = ?auto_6551 ?auto_6544 ) ) ( not ( = ?auto_6551 ?auto_6548 ) ) ( not ( = ?auto_6551 ?auto_6545 ) ) ( not ( = ?auto_6528 ?auto_6536 ) ) ( not ( = ?auto_6528 ?auto_6543 ) ) ( not ( = ?auto_6529 ?auto_6536 ) ) ( not ( = ?auto_6529 ?auto_6543 ) ) ( not ( = ?auto_6530 ?auto_6536 ) ) ( not ( = ?auto_6530 ?auto_6543 ) ) ( not ( = ?auto_6531 ?auto_6536 ) ) ( not ( = ?auto_6531 ?auto_6543 ) ) ( not ( = ?auto_6532 ?auto_6536 ) ) ( not ( = ?auto_6532 ?auto_6543 ) ) ( not ( = ?auto_6533 ?auto_6536 ) ) ( not ( = ?auto_6533 ?auto_6543 ) ) ( not ( = ?auto_6536 ?auto_6551 ) ) ( not ( = ?auto_6536 ?auto_6547 ) ) ( not ( = ?auto_6536 ?auto_6549 ) ) ( not ( = ?auto_6536 ?auto_6544 ) ) ( not ( = ?auto_6536 ?auto_6548 ) ) ( not ( = ?auto_6536 ?auto_6545 ) ) ( not ( = ?auto_6543 ?auto_6551 ) ) ( not ( = ?auto_6543 ?auto_6547 ) ) ( not ( = ?auto_6543 ?auto_6549 ) ) ( not ( = ?auto_6543 ?auto_6544 ) ) ( not ( = ?auto_6543 ?auto_6548 ) ) ( not ( = ?auto_6543 ?auto_6545 ) ) ( not ( = ?auto_6528 ?auto_6535 ) ) ( not ( = ?auto_6528 ?auto_6539 ) ) ( not ( = ?auto_6529 ?auto_6535 ) ) ( not ( = ?auto_6529 ?auto_6539 ) ) ( not ( = ?auto_6530 ?auto_6535 ) ) ( not ( = ?auto_6530 ?auto_6539 ) ) ( not ( = ?auto_6531 ?auto_6535 ) ) ( not ( = ?auto_6531 ?auto_6539 ) ) ( not ( = ?auto_6532 ?auto_6535 ) ) ( not ( = ?auto_6532 ?auto_6539 ) ) ( not ( = ?auto_6533 ?auto_6535 ) ) ( not ( = ?auto_6533 ?auto_6539 ) ) ( not ( = ?auto_6534 ?auto_6535 ) ) ( not ( = ?auto_6534 ?auto_6539 ) ) ( not ( = ?auto_6535 ?auto_6543 ) ) ( not ( = ?auto_6535 ?auto_6551 ) ) ( not ( = ?auto_6535 ?auto_6547 ) ) ( not ( = ?auto_6535 ?auto_6549 ) ) ( not ( = ?auto_6535 ?auto_6544 ) ) ( not ( = ?auto_6535 ?auto_6548 ) ) ( not ( = ?auto_6535 ?auto_6545 ) ) ( not ( = ?auto_6539 ?auto_6543 ) ) ( not ( = ?auto_6539 ?auto_6551 ) ) ( not ( = ?auto_6539 ?auto_6547 ) ) ( not ( = ?auto_6539 ?auto_6549 ) ) ( not ( = ?auto_6539 ?auto_6544 ) ) ( not ( = ?auto_6539 ?auto_6548 ) ) ( not ( = ?auto_6539 ?auto_6545 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6528 ?auto_6529 ?auto_6530 ?auto_6531 ?auto_6532 ?auto_6533 ?auto_6534 ?auto_6536 )
      ( MAKE-1CRATE ?auto_6536 ?auto_6535 )
      ( MAKE-8CRATE-VERIFY ?auto_6528 ?auto_6529 ?auto_6530 ?auto_6531 ?auto_6532 ?auto_6533 ?auto_6534 ?auto_6536 ?auto_6535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6560 - SURFACE
      ?auto_6561 - SURFACE
    )
    :vars
    (
      ?auto_6562 - HOIST
      ?auto_6563 - PLACE
      ?auto_6565 - PLACE
      ?auto_6566 - HOIST
      ?auto_6567 - SURFACE
      ?auto_6564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6562 ?auto_6563 ) ( SURFACE-AT ?auto_6560 ?auto_6563 ) ( CLEAR ?auto_6560 ) ( IS-CRATE ?auto_6561 ) ( AVAILABLE ?auto_6562 ) ( not ( = ?auto_6565 ?auto_6563 ) ) ( HOIST-AT ?auto_6566 ?auto_6565 ) ( AVAILABLE ?auto_6566 ) ( SURFACE-AT ?auto_6561 ?auto_6565 ) ( ON ?auto_6561 ?auto_6567 ) ( CLEAR ?auto_6561 ) ( TRUCK-AT ?auto_6564 ?auto_6563 ) ( not ( = ?auto_6560 ?auto_6561 ) ) ( not ( = ?auto_6560 ?auto_6567 ) ) ( not ( = ?auto_6561 ?auto_6567 ) ) ( not ( = ?auto_6562 ?auto_6566 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6564 ?auto_6563 ?auto_6565 )
      ( !LIFT ?auto_6566 ?auto_6561 ?auto_6567 ?auto_6565 )
      ( !LOAD ?auto_6566 ?auto_6561 ?auto_6564 ?auto_6565 )
      ( !DRIVE ?auto_6564 ?auto_6565 ?auto_6563 )
      ( !UNLOAD ?auto_6562 ?auto_6561 ?auto_6564 ?auto_6563 )
      ( !DROP ?auto_6562 ?auto_6561 ?auto_6560 ?auto_6563 )
      ( MAKE-1CRATE-VERIFY ?auto_6560 ?auto_6561 ) )
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
      ?auto_6587 - SURFACE
      ?auto_6586 - SURFACE
      ?auto_6585 - SURFACE
    )
    :vars
    (
      ?auto_6593 - HOIST
      ?auto_6588 - PLACE
      ?auto_6590 - PLACE
      ?auto_6591 - HOIST
      ?auto_6589 - SURFACE
      ?auto_6609 - PLACE
      ?auto_6594 - HOIST
      ?auto_6600 - SURFACE
      ?auto_6598 - SURFACE
      ?auto_6601 - SURFACE
      ?auto_6608 - SURFACE
      ?auto_6599 - PLACE
      ?auto_6596 - HOIST
      ?auto_6606 - SURFACE
      ?auto_6605 - PLACE
      ?auto_6603 - HOIST
      ?auto_6597 - SURFACE
      ?auto_6607 - SURFACE
      ?auto_6602 - PLACE
      ?auto_6604 - HOIST
      ?auto_6595 - SURFACE
      ?auto_6592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6593 ?auto_6588 ) ( IS-CRATE ?auto_6585 ) ( not ( = ?auto_6590 ?auto_6588 ) ) ( HOIST-AT ?auto_6591 ?auto_6590 ) ( SURFACE-AT ?auto_6585 ?auto_6590 ) ( ON ?auto_6585 ?auto_6589 ) ( CLEAR ?auto_6585 ) ( not ( = ?auto_6586 ?auto_6585 ) ) ( not ( = ?auto_6586 ?auto_6589 ) ) ( not ( = ?auto_6585 ?auto_6589 ) ) ( not ( = ?auto_6593 ?auto_6591 ) ) ( IS-CRATE ?auto_6586 ) ( not ( = ?auto_6609 ?auto_6588 ) ) ( HOIST-AT ?auto_6594 ?auto_6609 ) ( SURFACE-AT ?auto_6586 ?auto_6609 ) ( ON ?auto_6586 ?auto_6600 ) ( CLEAR ?auto_6586 ) ( not ( = ?auto_6587 ?auto_6586 ) ) ( not ( = ?auto_6587 ?auto_6600 ) ) ( not ( = ?auto_6586 ?auto_6600 ) ) ( not ( = ?auto_6593 ?auto_6594 ) ) ( IS-CRATE ?auto_6587 ) ( SURFACE-AT ?auto_6587 ?auto_6590 ) ( ON ?auto_6587 ?auto_6598 ) ( CLEAR ?auto_6587 ) ( not ( = ?auto_6584 ?auto_6587 ) ) ( not ( = ?auto_6584 ?auto_6598 ) ) ( not ( = ?auto_6587 ?auto_6598 ) ) ( IS-CRATE ?auto_6584 ) ( AVAILABLE ?auto_6591 ) ( SURFACE-AT ?auto_6584 ?auto_6590 ) ( ON ?auto_6584 ?auto_6601 ) ( CLEAR ?auto_6584 ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( not ( = ?auto_6583 ?auto_6601 ) ) ( not ( = ?auto_6584 ?auto_6601 ) ) ( IS-CRATE ?auto_6583 ) ( AVAILABLE ?auto_6594 ) ( SURFACE-AT ?auto_6583 ?auto_6609 ) ( ON ?auto_6583 ?auto_6608 ) ( CLEAR ?auto_6583 ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( not ( = ?auto_6582 ?auto_6608 ) ) ( not ( = ?auto_6583 ?auto_6608 ) ) ( IS-CRATE ?auto_6582 ) ( not ( = ?auto_6599 ?auto_6588 ) ) ( HOIST-AT ?auto_6596 ?auto_6599 ) ( SURFACE-AT ?auto_6582 ?auto_6599 ) ( ON ?auto_6582 ?auto_6606 ) ( CLEAR ?auto_6582 ) ( not ( = ?auto_6581 ?auto_6582 ) ) ( not ( = ?auto_6581 ?auto_6606 ) ) ( not ( = ?auto_6582 ?auto_6606 ) ) ( not ( = ?auto_6593 ?auto_6596 ) ) ( IS-CRATE ?auto_6581 ) ( not ( = ?auto_6605 ?auto_6588 ) ) ( HOIST-AT ?auto_6603 ?auto_6605 ) ( AVAILABLE ?auto_6603 ) ( SURFACE-AT ?auto_6581 ?auto_6605 ) ( ON ?auto_6581 ?auto_6597 ) ( CLEAR ?auto_6581 ) ( not ( = ?auto_6580 ?auto_6581 ) ) ( not ( = ?auto_6580 ?auto_6597 ) ) ( not ( = ?auto_6581 ?auto_6597 ) ) ( not ( = ?auto_6593 ?auto_6603 ) ) ( IS-CRATE ?auto_6580 ) ( AVAILABLE ?auto_6596 ) ( SURFACE-AT ?auto_6580 ?auto_6599 ) ( ON ?auto_6580 ?auto_6607 ) ( CLEAR ?auto_6580 ) ( not ( = ?auto_6579 ?auto_6580 ) ) ( not ( = ?auto_6579 ?auto_6607 ) ) ( not ( = ?auto_6580 ?auto_6607 ) ) ( SURFACE-AT ?auto_6578 ?auto_6588 ) ( CLEAR ?auto_6578 ) ( IS-CRATE ?auto_6579 ) ( AVAILABLE ?auto_6593 ) ( not ( = ?auto_6602 ?auto_6588 ) ) ( HOIST-AT ?auto_6604 ?auto_6602 ) ( AVAILABLE ?auto_6604 ) ( SURFACE-AT ?auto_6579 ?auto_6602 ) ( ON ?auto_6579 ?auto_6595 ) ( CLEAR ?auto_6579 ) ( TRUCK-AT ?auto_6592 ?auto_6588 ) ( not ( = ?auto_6578 ?auto_6579 ) ) ( not ( = ?auto_6578 ?auto_6595 ) ) ( not ( = ?auto_6579 ?auto_6595 ) ) ( not ( = ?auto_6593 ?auto_6604 ) ) ( not ( = ?auto_6578 ?auto_6580 ) ) ( not ( = ?auto_6578 ?auto_6607 ) ) ( not ( = ?auto_6580 ?auto_6595 ) ) ( not ( = ?auto_6599 ?auto_6602 ) ) ( not ( = ?auto_6596 ?auto_6604 ) ) ( not ( = ?auto_6607 ?auto_6595 ) ) ( not ( = ?auto_6578 ?auto_6581 ) ) ( not ( = ?auto_6578 ?auto_6597 ) ) ( not ( = ?auto_6579 ?auto_6581 ) ) ( not ( = ?auto_6579 ?auto_6597 ) ) ( not ( = ?auto_6581 ?auto_6607 ) ) ( not ( = ?auto_6581 ?auto_6595 ) ) ( not ( = ?auto_6605 ?auto_6599 ) ) ( not ( = ?auto_6605 ?auto_6602 ) ) ( not ( = ?auto_6603 ?auto_6596 ) ) ( not ( = ?auto_6603 ?auto_6604 ) ) ( not ( = ?auto_6597 ?auto_6607 ) ) ( not ( = ?auto_6597 ?auto_6595 ) ) ( not ( = ?auto_6578 ?auto_6582 ) ) ( not ( = ?auto_6578 ?auto_6606 ) ) ( not ( = ?auto_6579 ?auto_6582 ) ) ( not ( = ?auto_6579 ?auto_6606 ) ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( not ( = ?auto_6580 ?auto_6606 ) ) ( not ( = ?auto_6582 ?auto_6597 ) ) ( not ( = ?auto_6582 ?auto_6607 ) ) ( not ( = ?auto_6582 ?auto_6595 ) ) ( not ( = ?auto_6606 ?auto_6597 ) ) ( not ( = ?auto_6606 ?auto_6607 ) ) ( not ( = ?auto_6606 ?auto_6595 ) ) ( not ( = ?auto_6578 ?auto_6583 ) ) ( not ( = ?auto_6578 ?auto_6608 ) ) ( not ( = ?auto_6579 ?auto_6583 ) ) ( not ( = ?auto_6579 ?auto_6608 ) ) ( not ( = ?auto_6580 ?auto_6583 ) ) ( not ( = ?auto_6580 ?auto_6608 ) ) ( not ( = ?auto_6581 ?auto_6583 ) ) ( not ( = ?auto_6581 ?auto_6608 ) ) ( not ( = ?auto_6583 ?auto_6606 ) ) ( not ( = ?auto_6583 ?auto_6597 ) ) ( not ( = ?auto_6583 ?auto_6607 ) ) ( not ( = ?auto_6583 ?auto_6595 ) ) ( not ( = ?auto_6609 ?auto_6599 ) ) ( not ( = ?auto_6609 ?auto_6605 ) ) ( not ( = ?auto_6609 ?auto_6602 ) ) ( not ( = ?auto_6594 ?auto_6596 ) ) ( not ( = ?auto_6594 ?auto_6603 ) ) ( not ( = ?auto_6594 ?auto_6604 ) ) ( not ( = ?auto_6608 ?auto_6606 ) ) ( not ( = ?auto_6608 ?auto_6597 ) ) ( not ( = ?auto_6608 ?auto_6607 ) ) ( not ( = ?auto_6608 ?auto_6595 ) ) ( not ( = ?auto_6578 ?auto_6584 ) ) ( not ( = ?auto_6578 ?auto_6601 ) ) ( not ( = ?auto_6579 ?auto_6584 ) ) ( not ( = ?auto_6579 ?auto_6601 ) ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( not ( = ?auto_6580 ?auto_6601 ) ) ( not ( = ?auto_6581 ?auto_6584 ) ) ( not ( = ?auto_6581 ?auto_6601 ) ) ( not ( = ?auto_6582 ?auto_6584 ) ) ( not ( = ?auto_6582 ?auto_6601 ) ) ( not ( = ?auto_6584 ?auto_6608 ) ) ( not ( = ?auto_6584 ?auto_6606 ) ) ( not ( = ?auto_6584 ?auto_6597 ) ) ( not ( = ?auto_6584 ?auto_6607 ) ) ( not ( = ?auto_6584 ?auto_6595 ) ) ( not ( = ?auto_6590 ?auto_6609 ) ) ( not ( = ?auto_6590 ?auto_6599 ) ) ( not ( = ?auto_6590 ?auto_6605 ) ) ( not ( = ?auto_6590 ?auto_6602 ) ) ( not ( = ?auto_6591 ?auto_6594 ) ) ( not ( = ?auto_6591 ?auto_6596 ) ) ( not ( = ?auto_6591 ?auto_6603 ) ) ( not ( = ?auto_6591 ?auto_6604 ) ) ( not ( = ?auto_6601 ?auto_6608 ) ) ( not ( = ?auto_6601 ?auto_6606 ) ) ( not ( = ?auto_6601 ?auto_6597 ) ) ( not ( = ?auto_6601 ?auto_6607 ) ) ( not ( = ?auto_6601 ?auto_6595 ) ) ( not ( = ?auto_6578 ?auto_6587 ) ) ( not ( = ?auto_6578 ?auto_6598 ) ) ( not ( = ?auto_6579 ?auto_6587 ) ) ( not ( = ?auto_6579 ?auto_6598 ) ) ( not ( = ?auto_6580 ?auto_6587 ) ) ( not ( = ?auto_6580 ?auto_6598 ) ) ( not ( = ?auto_6581 ?auto_6587 ) ) ( not ( = ?auto_6581 ?auto_6598 ) ) ( not ( = ?auto_6582 ?auto_6587 ) ) ( not ( = ?auto_6582 ?auto_6598 ) ) ( not ( = ?auto_6583 ?auto_6587 ) ) ( not ( = ?auto_6583 ?auto_6598 ) ) ( not ( = ?auto_6587 ?auto_6601 ) ) ( not ( = ?auto_6587 ?auto_6608 ) ) ( not ( = ?auto_6587 ?auto_6606 ) ) ( not ( = ?auto_6587 ?auto_6597 ) ) ( not ( = ?auto_6587 ?auto_6607 ) ) ( not ( = ?auto_6587 ?auto_6595 ) ) ( not ( = ?auto_6598 ?auto_6601 ) ) ( not ( = ?auto_6598 ?auto_6608 ) ) ( not ( = ?auto_6598 ?auto_6606 ) ) ( not ( = ?auto_6598 ?auto_6597 ) ) ( not ( = ?auto_6598 ?auto_6607 ) ) ( not ( = ?auto_6598 ?auto_6595 ) ) ( not ( = ?auto_6578 ?auto_6586 ) ) ( not ( = ?auto_6578 ?auto_6600 ) ) ( not ( = ?auto_6579 ?auto_6586 ) ) ( not ( = ?auto_6579 ?auto_6600 ) ) ( not ( = ?auto_6580 ?auto_6586 ) ) ( not ( = ?auto_6580 ?auto_6600 ) ) ( not ( = ?auto_6581 ?auto_6586 ) ) ( not ( = ?auto_6581 ?auto_6600 ) ) ( not ( = ?auto_6582 ?auto_6586 ) ) ( not ( = ?auto_6582 ?auto_6600 ) ) ( not ( = ?auto_6583 ?auto_6586 ) ) ( not ( = ?auto_6583 ?auto_6600 ) ) ( not ( = ?auto_6584 ?auto_6586 ) ) ( not ( = ?auto_6584 ?auto_6600 ) ) ( not ( = ?auto_6586 ?auto_6598 ) ) ( not ( = ?auto_6586 ?auto_6601 ) ) ( not ( = ?auto_6586 ?auto_6608 ) ) ( not ( = ?auto_6586 ?auto_6606 ) ) ( not ( = ?auto_6586 ?auto_6597 ) ) ( not ( = ?auto_6586 ?auto_6607 ) ) ( not ( = ?auto_6586 ?auto_6595 ) ) ( not ( = ?auto_6600 ?auto_6598 ) ) ( not ( = ?auto_6600 ?auto_6601 ) ) ( not ( = ?auto_6600 ?auto_6608 ) ) ( not ( = ?auto_6600 ?auto_6606 ) ) ( not ( = ?auto_6600 ?auto_6597 ) ) ( not ( = ?auto_6600 ?auto_6607 ) ) ( not ( = ?auto_6600 ?auto_6595 ) ) ( not ( = ?auto_6578 ?auto_6585 ) ) ( not ( = ?auto_6578 ?auto_6589 ) ) ( not ( = ?auto_6579 ?auto_6585 ) ) ( not ( = ?auto_6579 ?auto_6589 ) ) ( not ( = ?auto_6580 ?auto_6585 ) ) ( not ( = ?auto_6580 ?auto_6589 ) ) ( not ( = ?auto_6581 ?auto_6585 ) ) ( not ( = ?auto_6581 ?auto_6589 ) ) ( not ( = ?auto_6582 ?auto_6585 ) ) ( not ( = ?auto_6582 ?auto_6589 ) ) ( not ( = ?auto_6583 ?auto_6585 ) ) ( not ( = ?auto_6583 ?auto_6589 ) ) ( not ( = ?auto_6584 ?auto_6585 ) ) ( not ( = ?auto_6584 ?auto_6589 ) ) ( not ( = ?auto_6587 ?auto_6585 ) ) ( not ( = ?auto_6587 ?auto_6589 ) ) ( not ( = ?auto_6585 ?auto_6600 ) ) ( not ( = ?auto_6585 ?auto_6598 ) ) ( not ( = ?auto_6585 ?auto_6601 ) ) ( not ( = ?auto_6585 ?auto_6608 ) ) ( not ( = ?auto_6585 ?auto_6606 ) ) ( not ( = ?auto_6585 ?auto_6597 ) ) ( not ( = ?auto_6585 ?auto_6607 ) ) ( not ( = ?auto_6585 ?auto_6595 ) ) ( not ( = ?auto_6589 ?auto_6600 ) ) ( not ( = ?auto_6589 ?auto_6598 ) ) ( not ( = ?auto_6589 ?auto_6601 ) ) ( not ( = ?auto_6589 ?auto_6608 ) ) ( not ( = ?auto_6589 ?auto_6606 ) ) ( not ( = ?auto_6589 ?auto_6597 ) ) ( not ( = ?auto_6589 ?auto_6607 ) ) ( not ( = ?auto_6589 ?auto_6595 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6578 ?auto_6579 ?auto_6580 ?auto_6581 ?auto_6582 ?auto_6583 ?auto_6584 ?auto_6587 ?auto_6586 )
      ( MAKE-1CRATE ?auto_6586 ?auto_6585 )
      ( MAKE-9CRATE-VERIFY ?auto_6578 ?auto_6579 ?auto_6580 ?auto_6581 ?auto_6582 ?auto_6583 ?auto_6584 ?auto_6587 ?auto_6586 ?auto_6585 ) )
  )

)

