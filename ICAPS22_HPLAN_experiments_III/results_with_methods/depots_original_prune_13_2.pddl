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

  ( :method MAKE-10CRATE-VERIFY
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
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977276 - SURFACE
      ?auto_977277 - SURFACE
    )
    :vars
    (
      ?auto_977278 - HOIST
      ?auto_977279 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977278 ?auto_977279 ) ( SURFACE-AT ?auto_977276 ?auto_977279 ) ( CLEAR ?auto_977276 ) ( LIFTING ?auto_977278 ?auto_977277 ) ( IS-CRATE ?auto_977277 ) ( not ( = ?auto_977276 ?auto_977277 ) ) )
    :subtasks
    ( ( !DROP ?auto_977278 ?auto_977277 ?auto_977276 ?auto_977279 )
      ( MAKE-1CRATE-VERIFY ?auto_977276 ?auto_977277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977280 - SURFACE
      ?auto_977281 - SURFACE
    )
    :vars
    (
      ?auto_977283 - HOIST
      ?auto_977282 - PLACE
      ?auto_977284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977283 ?auto_977282 ) ( SURFACE-AT ?auto_977280 ?auto_977282 ) ( CLEAR ?auto_977280 ) ( IS-CRATE ?auto_977281 ) ( not ( = ?auto_977280 ?auto_977281 ) ) ( TRUCK-AT ?auto_977284 ?auto_977282 ) ( AVAILABLE ?auto_977283 ) ( IN ?auto_977281 ?auto_977284 ) )
    :subtasks
    ( ( !UNLOAD ?auto_977283 ?auto_977281 ?auto_977284 ?auto_977282 )
      ( MAKE-1CRATE ?auto_977280 ?auto_977281 )
      ( MAKE-1CRATE-VERIFY ?auto_977280 ?auto_977281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977285 - SURFACE
      ?auto_977286 - SURFACE
    )
    :vars
    (
      ?auto_977289 - HOIST
      ?auto_977287 - PLACE
      ?auto_977288 - TRUCK
      ?auto_977290 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977289 ?auto_977287 ) ( SURFACE-AT ?auto_977285 ?auto_977287 ) ( CLEAR ?auto_977285 ) ( IS-CRATE ?auto_977286 ) ( not ( = ?auto_977285 ?auto_977286 ) ) ( AVAILABLE ?auto_977289 ) ( IN ?auto_977286 ?auto_977288 ) ( TRUCK-AT ?auto_977288 ?auto_977290 ) ( not ( = ?auto_977290 ?auto_977287 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_977288 ?auto_977290 ?auto_977287 )
      ( MAKE-1CRATE ?auto_977285 ?auto_977286 )
      ( MAKE-1CRATE-VERIFY ?auto_977285 ?auto_977286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977291 - SURFACE
      ?auto_977292 - SURFACE
    )
    :vars
    (
      ?auto_977296 - HOIST
      ?auto_977295 - PLACE
      ?auto_977293 - TRUCK
      ?auto_977294 - PLACE
      ?auto_977297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977296 ?auto_977295 ) ( SURFACE-AT ?auto_977291 ?auto_977295 ) ( CLEAR ?auto_977291 ) ( IS-CRATE ?auto_977292 ) ( not ( = ?auto_977291 ?auto_977292 ) ) ( AVAILABLE ?auto_977296 ) ( TRUCK-AT ?auto_977293 ?auto_977294 ) ( not ( = ?auto_977294 ?auto_977295 ) ) ( HOIST-AT ?auto_977297 ?auto_977294 ) ( LIFTING ?auto_977297 ?auto_977292 ) ( not ( = ?auto_977296 ?auto_977297 ) ) )
    :subtasks
    ( ( !LOAD ?auto_977297 ?auto_977292 ?auto_977293 ?auto_977294 )
      ( MAKE-1CRATE ?auto_977291 ?auto_977292 )
      ( MAKE-1CRATE-VERIFY ?auto_977291 ?auto_977292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977298 - SURFACE
      ?auto_977299 - SURFACE
    )
    :vars
    (
      ?auto_977301 - HOIST
      ?auto_977302 - PLACE
      ?auto_977303 - TRUCK
      ?auto_977304 - PLACE
      ?auto_977300 - HOIST
      ?auto_977305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977301 ?auto_977302 ) ( SURFACE-AT ?auto_977298 ?auto_977302 ) ( CLEAR ?auto_977298 ) ( IS-CRATE ?auto_977299 ) ( not ( = ?auto_977298 ?auto_977299 ) ) ( AVAILABLE ?auto_977301 ) ( TRUCK-AT ?auto_977303 ?auto_977304 ) ( not ( = ?auto_977304 ?auto_977302 ) ) ( HOIST-AT ?auto_977300 ?auto_977304 ) ( not ( = ?auto_977301 ?auto_977300 ) ) ( AVAILABLE ?auto_977300 ) ( SURFACE-AT ?auto_977299 ?auto_977304 ) ( ON ?auto_977299 ?auto_977305 ) ( CLEAR ?auto_977299 ) ( not ( = ?auto_977298 ?auto_977305 ) ) ( not ( = ?auto_977299 ?auto_977305 ) ) )
    :subtasks
    ( ( !LIFT ?auto_977300 ?auto_977299 ?auto_977305 ?auto_977304 )
      ( MAKE-1CRATE ?auto_977298 ?auto_977299 )
      ( MAKE-1CRATE-VERIFY ?auto_977298 ?auto_977299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977306 - SURFACE
      ?auto_977307 - SURFACE
    )
    :vars
    (
      ?auto_977313 - HOIST
      ?auto_977312 - PLACE
      ?auto_977311 - PLACE
      ?auto_977309 - HOIST
      ?auto_977308 - SURFACE
      ?auto_977310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977313 ?auto_977312 ) ( SURFACE-AT ?auto_977306 ?auto_977312 ) ( CLEAR ?auto_977306 ) ( IS-CRATE ?auto_977307 ) ( not ( = ?auto_977306 ?auto_977307 ) ) ( AVAILABLE ?auto_977313 ) ( not ( = ?auto_977311 ?auto_977312 ) ) ( HOIST-AT ?auto_977309 ?auto_977311 ) ( not ( = ?auto_977313 ?auto_977309 ) ) ( AVAILABLE ?auto_977309 ) ( SURFACE-AT ?auto_977307 ?auto_977311 ) ( ON ?auto_977307 ?auto_977308 ) ( CLEAR ?auto_977307 ) ( not ( = ?auto_977306 ?auto_977308 ) ) ( not ( = ?auto_977307 ?auto_977308 ) ) ( TRUCK-AT ?auto_977310 ?auto_977312 ) )
    :subtasks
    ( ( !DRIVE ?auto_977310 ?auto_977312 ?auto_977311 )
      ( MAKE-1CRATE ?auto_977306 ?auto_977307 )
      ( MAKE-1CRATE-VERIFY ?auto_977306 ?auto_977307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977323 - SURFACE
      ?auto_977324 - SURFACE
      ?auto_977325 - SURFACE
    )
    :vars
    (
      ?auto_977326 - HOIST
      ?auto_977327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977326 ?auto_977327 ) ( SURFACE-AT ?auto_977324 ?auto_977327 ) ( CLEAR ?auto_977324 ) ( LIFTING ?auto_977326 ?auto_977325 ) ( IS-CRATE ?auto_977325 ) ( not ( = ?auto_977324 ?auto_977325 ) ) ( ON ?auto_977324 ?auto_977323 ) ( not ( = ?auto_977323 ?auto_977324 ) ) ( not ( = ?auto_977323 ?auto_977325 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977324 ?auto_977325 )
      ( MAKE-2CRATE-VERIFY ?auto_977323 ?auto_977324 ?auto_977325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977333 - SURFACE
      ?auto_977334 - SURFACE
      ?auto_977335 - SURFACE
    )
    :vars
    (
      ?auto_977336 - HOIST
      ?auto_977338 - PLACE
      ?auto_977337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977336 ?auto_977338 ) ( SURFACE-AT ?auto_977334 ?auto_977338 ) ( CLEAR ?auto_977334 ) ( IS-CRATE ?auto_977335 ) ( not ( = ?auto_977334 ?auto_977335 ) ) ( TRUCK-AT ?auto_977337 ?auto_977338 ) ( AVAILABLE ?auto_977336 ) ( IN ?auto_977335 ?auto_977337 ) ( ON ?auto_977334 ?auto_977333 ) ( not ( = ?auto_977333 ?auto_977334 ) ) ( not ( = ?auto_977333 ?auto_977335 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977334 ?auto_977335 )
      ( MAKE-2CRATE-VERIFY ?auto_977333 ?auto_977334 ?auto_977335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977339 - SURFACE
      ?auto_977340 - SURFACE
    )
    :vars
    (
      ?auto_977342 - HOIST
      ?auto_977341 - PLACE
      ?auto_977344 - TRUCK
      ?auto_977343 - SURFACE
      ?auto_977345 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977342 ?auto_977341 ) ( SURFACE-AT ?auto_977339 ?auto_977341 ) ( CLEAR ?auto_977339 ) ( IS-CRATE ?auto_977340 ) ( not ( = ?auto_977339 ?auto_977340 ) ) ( AVAILABLE ?auto_977342 ) ( IN ?auto_977340 ?auto_977344 ) ( ON ?auto_977339 ?auto_977343 ) ( not ( = ?auto_977343 ?auto_977339 ) ) ( not ( = ?auto_977343 ?auto_977340 ) ) ( TRUCK-AT ?auto_977344 ?auto_977345 ) ( not ( = ?auto_977345 ?auto_977341 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_977344 ?auto_977345 ?auto_977341 )
      ( MAKE-2CRATE ?auto_977343 ?auto_977339 ?auto_977340 )
      ( MAKE-1CRATE-VERIFY ?auto_977339 ?auto_977340 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977346 - SURFACE
      ?auto_977347 - SURFACE
      ?auto_977348 - SURFACE
    )
    :vars
    (
      ?auto_977351 - HOIST
      ?auto_977352 - PLACE
      ?auto_977350 - TRUCK
      ?auto_977349 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977351 ?auto_977352 ) ( SURFACE-AT ?auto_977347 ?auto_977352 ) ( CLEAR ?auto_977347 ) ( IS-CRATE ?auto_977348 ) ( not ( = ?auto_977347 ?auto_977348 ) ) ( AVAILABLE ?auto_977351 ) ( IN ?auto_977348 ?auto_977350 ) ( ON ?auto_977347 ?auto_977346 ) ( not ( = ?auto_977346 ?auto_977347 ) ) ( not ( = ?auto_977346 ?auto_977348 ) ) ( TRUCK-AT ?auto_977350 ?auto_977349 ) ( not ( = ?auto_977349 ?auto_977352 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977347 ?auto_977348 )
      ( MAKE-2CRATE-VERIFY ?auto_977346 ?auto_977347 ?auto_977348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977353 - SURFACE
      ?auto_977354 - SURFACE
    )
    :vars
    (
      ?auto_977358 - HOIST
      ?auto_977355 - PLACE
      ?auto_977357 - SURFACE
      ?auto_977359 - TRUCK
      ?auto_977356 - PLACE
      ?auto_977360 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977358 ?auto_977355 ) ( SURFACE-AT ?auto_977353 ?auto_977355 ) ( CLEAR ?auto_977353 ) ( IS-CRATE ?auto_977354 ) ( not ( = ?auto_977353 ?auto_977354 ) ) ( AVAILABLE ?auto_977358 ) ( ON ?auto_977353 ?auto_977357 ) ( not ( = ?auto_977357 ?auto_977353 ) ) ( not ( = ?auto_977357 ?auto_977354 ) ) ( TRUCK-AT ?auto_977359 ?auto_977356 ) ( not ( = ?auto_977356 ?auto_977355 ) ) ( HOIST-AT ?auto_977360 ?auto_977356 ) ( LIFTING ?auto_977360 ?auto_977354 ) ( not ( = ?auto_977358 ?auto_977360 ) ) )
    :subtasks
    ( ( !LOAD ?auto_977360 ?auto_977354 ?auto_977359 ?auto_977356 )
      ( MAKE-2CRATE ?auto_977357 ?auto_977353 ?auto_977354 )
      ( MAKE-1CRATE-VERIFY ?auto_977353 ?auto_977354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977361 - SURFACE
      ?auto_977362 - SURFACE
      ?auto_977363 - SURFACE
    )
    :vars
    (
      ?auto_977365 - HOIST
      ?auto_977368 - PLACE
      ?auto_977364 - TRUCK
      ?auto_977367 - PLACE
      ?auto_977366 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977365 ?auto_977368 ) ( SURFACE-AT ?auto_977362 ?auto_977368 ) ( CLEAR ?auto_977362 ) ( IS-CRATE ?auto_977363 ) ( not ( = ?auto_977362 ?auto_977363 ) ) ( AVAILABLE ?auto_977365 ) ( ON ?auto_977362 ?auto_977361 ) ( not ( = ?auto_977361 ?auto_977362 ) ) ( not ( = ?auto_977361 ?auto_977363 ) ) ( TRUCK-AT ?auto_977364 ?auto_977367 ) ( not ( = ?auto_977367 ?auto_977368 ) ) ( HOIST-AT ?auto_977366 ?auto_977367 ) ( LIFTING ?auto_977366 ?auto_977363 ) ( not ( = ?auto_977365 ?auto_977366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977362 ?auto_977363 )
      ( MAKE-2CRATE-VERIFY ?auto_977361 ?auto_977362 ?auto_977363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977369 - SURFACE
      ?auto_977370 - SURFACE
    )
    :vars
    (
      ?auto_977374 - HOIST
      ?auto_977375 - PLACE
      ?auto_977371 - SURFACE
      ?auto_977376 - TRUCK
      ?auto_977373 - PLACE
      ?auto_977372 - HOIST
      ?auto_977377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977374 ?auto_977375 ) ( SURFACE-AT ?auto_977369 ?auto_977375 ) ( CLEAR ?auto_977369 ) ( IS-CRATE ?auto_977370 ) ( not ( = ?auto_977369 ?auto_977370 ) ) ( AVAILABLE ?auto_977374 ) ( ON ?auto_977369 ?auto_977371 ) ( not ( = ?auto_977371 ?auto_977369 ) ) ( not ( = ?auto_977371 ?auto_977370 ) ) ( TRUCK-AT ?auto_977376 ?auto_977373 ) ( not ( = ?auto_977373 ?auto_977375 ) ) ( HOIST-AT ?auto_977372 ?auto_977373 ) ( not ( = ?auto_977374 ?auto_977372 ) ) ( AVAILABLE ?auto_977372 ) ( SURFACE-AT ?auto_977370 ?auto_977373 ) ( ON ?auto_977370 ?auto_977377 ) ( CLEAR ?auto_977370 ) ( not ( = ?auto_977369 ?auto_977377 ) ) ( not ( = ?auto_977370 ?auto_977377 ) ) ( not ( = ?auto_977371 ?auto_977377 ) ) )
    :subtasks
    ( ( !LIFT ?auto_977372 ?auto_977370 ?auto_977377 ?auto_977373 )
      ( MAKE-2CRATE ?auto_977371 ?auto_977369 ?auto_977370 )
      ( MAKE-1CRATE-VERIFY ?auto_977369 ?auto_977370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977378 - SURFACE
      ?auto_977379 - SURFACE
      ?auto_977380 - SURFACE
    )
    :vars
    (
      ?auto_977385 - HOIST
      ?auto_977383 - PLACE
      ?auto_977384 - TRUCK
      ?auto_977382 - PLACE
      ?auto_977386 - HOIST
      ?auto_977381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977385 ?auto_977383 ) ( SURFACE-AT ?auto_977379 ?auto_977383 ) ( CLEAR ?auto_977379 ) ( IS-CRATE ?auto_977380 ) ( not ( = ?auto_977379 ?auto_977380 ) ) ( AVAILABLE ?auto_977385 ) ( ON ?auto_977379 ?auto_977378 ) ( not ( = ?auto_977378 ?auto_977379 ) ) ( not ( = ?auto_977378 ?auto_977380 ) ) ( TRUCK-AT ?auto_977384 ?auto_977382 ) ( not ( = ?auto_977382 ?auto_977383 ) ) ( HOIST-AT ?auto_977386 ?auto_977382 ) ( not ( = ?auto_977385 ?auto_977386 ) ) ( AVAILABLE ?auto_977386 ) ( SURFACE-AT ?auto_977380 ?auto_977382 ) ( ON ?auto_977380 ?auto_977381 ) ( CLEAR ?auto_977380 ) ( not ( = ?auto_977379 ?auto_977381 ) ) ( not ( = ?auto_977380 ?auto_977381 ) ) ( not ( = ?auto_977378 ?auto_977381 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977379 ?auto_977380 )
      ( MAKE-2CRATE-VERIFY ?auto_977378 ?auto_977379 ?auto_977380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977387 - SURFACE
      ?auto_977388 - SURFACE
    )
    :vars
    (
      ?auto_977395 - HOIST
      ?auto_977389 - PLACE
      ?auto_977393 - SURFACE
      ?auto_977390 - PLACE
      ?auto_977391 - HOIST
      ?auto_977392 - SURFACE
      ?auto_977394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977395 ?auto_977389 ) ( SURFACE-AT ?auto_977387 ?auto_977389 ) ( CLEAR ?auto_977387 ) ( IS-CRATE ?auto_977388 ) ( not ( = ?auto_977387 ?auto_977388 ) ) ( AVAILABLE ?auto_977395 ) ( ON ?auto_977387 ?auto_977393 ) ( not ( = ?auto_977393 ?auto_977387 ) ) ( not ( = ?auto_977393 ?auto_977388 ) ) ( not ( = ?auto_977390 ?auto_977389 ) ) ( HOIST-AT ?auto_977391 ?auto_977390 ) ( not ( = ?auto_977395 ?auto_977391 ) ) ( AVAILABLE ?auto_977391 ) ( SURFACE-AT ?auto_977388 ?auto_977390 ) ( ON ?auto_977388 ?auto_977392 ) ( CLEAR ?auto_977388 ) ( not ( = ?auto_977387 ?auto_977392 ) ) ( not ( = ?auto_977388 ?auto_977392 ) ) ( not ( = ?auto_977393 ?auto_977392 ) ) ( TRUCK-AT ?auto_977394 ?auto_977389 ) )
    :subtasks
    ( ( !DRIVE ?auto_977394 ?auto_977389 ?auto_977390 )
      ( MAKE-2CRATE ?auto_977393 ?auto_977387 ?auto_977388 )
      ( MAKE-1CRATE-VERIFY ?auto_977387 ?auto_977388 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977396 - SURFACE
      ?auto_977397 - SURFACE
      ?auto_977398 - SURFACE
    )
    :vars
    (
      ?auto_977403 - HOIST
      ?auto_977400 - PLACE
      ?auto_977404 - PLACE
      ?auto_977402 - HOIST
      ?auto_977401 - SURFACE
      ?auto_977399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977403 ?auto_977400 ) ( SURFACE-AT ?auto_977397 ?auto_977400 ) ( CLEAR ?auto_977397 ) ( IS-CRATE ?auto_977398 ) ( not ( = ?auto_977397 ?auto_977398 ) ) ( AVAILABLE ?auto_977403 ) ( ON ?auto_977397 ?auto_977396 ) ( not ( = ?auto_977396 ?auto_977397 ) ) ( not ( = ?auto_977396 ?auto_977398 ) ) ( not ( = ?auto_977404 ?auto_977400 ) ) ( HOIST-AT ?auto_977402 ?auto_977404 ) ( not ( = ?auto_977403 ?auto_977402 ) ) ( AVAILABLE ?auto_977402 ) ( SURFACE-AT ?auto_977398 ?auto_977404 ) ( ON ?auto_977398 ?auto_977401 ) ( CLEAR ?auto_977398 ) ( not ( = ?auto_977397 ?auto_977401 ) ) ( not ( = ?auto_977398 ?auto_977401 ) ) ( not ( = ?auto_977396 ?auto_977401 ) ) ( TRUCK-AT ?auto_977399 ?auto_977400 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977397 ?auto_977398 )
      ( MAKE-2CRATE-VERIFY ?auto_977396 ?auto_977397 ?auto_977398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977405 - SURFACE
      ?auto_977406 - SURFACE
    )
    :vars
    (
      ?auto_977410 - HOIST
      ?auto_977409 - PLACE
      ?auto_977408 - SURFACE
      ?auto_977413 - PLACE
      ?auto_977407 - HOIST
      ?auto_977411 - SURFACE
      ?auto_977412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977410 ?auto_977409 ) ( IS-CRATE ?auto_977406 ) ( not ( = ?auto_977405 ?auto_977406 ) ) ( not ( = ?auto_977408 ?auto_977405 ) ) ( not ( = ?auto_977408 ?auto_977406 ) ) ( not ( = ?auto_977413 ?auto_977409 ) ) ( HOIST-AT ?auto_977407 ?auto_977413 ) ( not ( = ?auto_977410 ?auto_977407 ) ) ( AVAILABLE ?auto_977407 ) ( SURFACE-AT ?auto_977406 ?auto_977413 ) ( ON ?auto_977406 ?auto_977411 ) ( CLEAR ?auto_977406 ) ( not ( = ?auto_977405 ?auto_977411 ) ) ( not ( = ?auto_977406 ?auto_977411 ) ) ( not ( = ?auto_977408 ?auto_977411 ) ) ( TRUCK-AT ?auto_977412 ?auto_977409 ) ( SURFACE-AT ?auto_977408 ?auto_977409 ) ( CLEAR ?auto_977408 ) ( LIFTING ?auto_977410 ?auto_977405 ) ( IS-CRATE ?auto_977405 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977408 ?auto_977405 )
      ( MAKE-2CRATE ?auto_977408 ?auto_977405 ?auto_977406 )
      ( MAKE-1CRATE-VERIFY ?auto_977405 ?auto_977406 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977414 - SURFACE
      ?auto_977415 - SURFACE
      ?auto_977416 - SURFACE
    )
    :vars
    (
      ?auto_977421 - HOIST
      ?auto_977418 - PLACE
      ?auto_977417 - PLACE
      ?auto_977420 - HOIST
      ?auto_977422 - SURFACE
      ?auto_977419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977421 ?auto_977418 ) ( IS-CRATE ?auto_977416 ) ( not ( = ?auto_977415 ?auto_977416 ) ) ( not ( = ?auto_977414 ?auto_977415 ) ) ( not ( = ?auto_977414 ?auto_977416 ) ) ( not ( = ?auto_977417 ?auto_977418 ) ) ( HOIST-AT ?auto_977420 ?auto_977417 ) ( not ( = ?auto_977421 ?auto_977420 ) ) ( AVAILABLE ?auto_977420 ) ( SURFACE-AT ?auto_977416 ?auto_977417 ) ( ON ?auto_977416 ?auto_977422 ) ( CLEAR ?auto_977416 ) ( not ( = ?auto_977415 ?auto_977422 ) ) ( not ( = ?auto_977416 ?auto_977422 ) ) ( not ( = ?auto_977414 ?auto_977422 ) ) ( TRUCK-AT ?auto_977419 ?auto_977418 ) ( SURFACE-AT ?auto_977414 ?auto_977418 ) ( CLEAR ?auto_977414 ) ( LIFTING ?auto_977421 ?auto_977415 ) ( IS-CRATE ?auto_977415 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977415 ?auto_977416 )
      ( MAKE-2CRATE-VERIFY ?auto_977414 ?auto_977415 ?auto_977416 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977423 - SURFACE
      ?auto_977424 - SURFACE
    )
    :vars
    (
      ?auto_977426 - HOIST
      ?auto_977431 - PLACE
      ?auto_977427 - SURFACE
      ?auto_977430 - PLACE
      ?auto_977425 - HOIST
      ?auto_977428 - SURFACE
      ?auto_977429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977426 ?auto_977431 ) ( IS-CRATE ?auto_977424 ) ( not ( = ?auto_977423 ?auto_977424 ) ) ( not ( = ?auto_977427 ?auto_977423 ) ) ( not ( = ?auto_977427 ?auto_977424 ) ) ( not ( = ?auto_977430 ?auto_977431 ) ) ( HOIST-AT ?auto_977425 ?auto_977430 ) ( not ( = ?auto_977426 ?auto_977425 ) ) ( AVAILABLE ?auto_977425 ) ( SURFACE-AT ?auto_977424 ?auto_977430 ) ( ON ?auto_977424 ?auto_977428 ) ( CLEAR ?auto_977424 ) ( not ( = ?auto_977423 ?auto_977428 ) ) ( not ( = ?auto_977424 ?auto_977428 ) ) ( not ( = ?auto_977427 ?auto_977428 ) ) ( TRUCK-AT ?auto_977429 ?auto_977431 ) ( SURFACE-AT ?auto_977427 ?auto_977431 ) ( CLEAR ?auto_977427 ) ( IS-CRATE ?auto_977423 ) ( AVAILABLE ?auto_977426 ) ( IN ?auto_977423 ?auto_977429 ) )
    :subtasks
    ( ( !UNLOAD ?auto_977426 ?auto_977423 ?auto_977429 ?auto_977431 )
      ( MAKE-2CRATE ?auto_977427 ?auto_977423 ?auto_977424 )
      ( MAKE-1CRATE-VERIFY ?auto_977423 ?auto_977424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_977432 - SURFACE
      ?auto_977433 - SURFACE
      ?auto_977434 - SURFACE
    )
    :vars
    (
      ?auto_977439 - HOIST
      ?auto_977440 - PLACE
      ?auto_977438 - PLACE
      ?auto_977436 - HOIST
      ?auto_977437 - SURFACE
      ?auto_977435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977439 ?auto_977440 ) ( IS-CRATE ?auto_977434 ) ( not ( = ?auto_977433 ?auto_977434 ) ) ( not ( = ?auto_977432 ?auto_977433 ) ) ( not ( = ?auto_977432 ?auto_977434 ) ) ( not ( = ?auto_977438 ?auto_977440 ) ) ( HOIST-AT ?auto_977436 ?auto_977438 ) ( not ( = ?auto_977439 ?auto_977436 ) ) ( AVAILABLE ?auto_977436 ) ( SURFACE-AT ?auto_977434 ?auto_977438 ) ( ON ?auto_977434 ?auto_977437 ) ( CLEAR ?auto_977434 ) ( not ( = ?auto_977433 ?auto_977437 ) ) ( not ( = ?auto_977434 ?auto_977437 ) ) ( not ( = ?auto_977432 ?auto_977437 ) ) ( TRUCK-AT ?auto_977435 ?auto_977440 ) ( SURFACE-AT ?auto_977432 ?auto_977440 ) ( CLEAR ?auto_977432 ) ( IS-CRATE ?auto_977433 ) ( AVAILABLE ?auto_977439 ) ( IN ?auto_977433 ?auto_977435 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977433 ?auto_977434 )
      ( MAKE-2CRATE-VERIFY ?auto_977432 ?auto_977433 ?auto_977434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977477 - SURFACE
      ?auto_977478 - SURFACE
    )
    :vars
    (
      ?auto_977482 - HOIST
      ?auto_977484 - PLACE
      ?auto_977485 - SURFACE
      ?auto_977481 - PLACE
      ?auto_977480 - HOIST
      ?auto_977479 - SURFACE
      ?auto_977483 - TRUCK
      ?auto_977486 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977482 ?auto_977484 ) ( SURFACE-AT ?auto_977477 ?auto_977484 ) ( CLEAR ?auto_977477 ) ( IS-CRATE ?auto_977478 ) ( not ( = ?auto_977477 ?auto_977478 ) ) ( AVAILABLE ?auto_977482 ) ( ON ?auto_977477 ?auto_977485 ) ( not ( = ?auto_977485 ?auto_977477 ) ) ( not ( = ?auto_977485 ?auto_977478 ) ) ( not ( = ?auto_977481 ?auto_977484 ) ) ( HOIST-AT ?auto_977480 ?auto_977481 ) ( not ( = ?auto_977482 ?auto_977480 ) ) ( AVAILABLE ?auto_977480 ) ( SURFACE-AT ?auto_977478 ?auto_977481 ) ( ON ?auto_977478 ?auto_977479 ) ( CLEAR ?auto_977478 ) ( not ( = ?auto_977477 ?auto_977479 ) ) ( not ( = ?auto_977478 ?auto_977479 ) ) ( not ( = ?auto_977485 ?auto_977479 ) ) ( TRUCK-AT ?auto_977483 ?auto_977486 ) ( not ( = ?auto_977486 ?auto_977484 ) ) ( not ( = ?auto_977481 ?auto_977486 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_977483 ?auto_977486 ?auto_977484 )
      ( MAKE-1CRATE ?auto_977477 ?auto_977478 )
      ( MAKE-1CRATE-VERIFY ?auto_977477 ?auto_977478 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977516 - SURFACE
      ?auto_977517 - SURFACE
      ?auto_977518 - SURFACE
      ?auto_977519 - SURFACE
    )
    :vars
    (
      ?auto_977521 - HOIST
      ?auto_977520 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977521 ?auto_977520 ) ( SURFACE-AT ?auto_977518 ?auto_977520 ) ( CLEAR ?auto_977518 ) ( LIFTING ?auto_977521 ?auto_977519 ) ( IS-CRATE ?auto_977519 ) ( not ( = ?auto_977518 ?auto_977519 ) ) ( ON ?auto_977517 ?auto_977516 ) ( ON ?auto_977518 ?auto_977517 ) ( not ( = ?auto_977516 ?auto_977517 ) ) ( not ( = ?auto_977516 ?auto_977518 ) ) ( not ( = ?auto_977516 ?auto_977519 ) ) ( not ( = ?auto_977517 ?auto_977518 ) ) ( not ( = ?auto_977517 ?auto_977519 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977518 ?auto_977519 )
      ( MAKE-3CRATE-VERIFY ?auto_977516 ?auto_977517 ?auto_977518 ?auto_977519 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977533 - SURFACE
      ?auto_977534 - SURFACE
      ?auto_977535 - SURFACE
      ?auto_977536 - SURFACE
    )
    :vars
    (
      ?auto_977538 - HOIST
      ?auto_977539 - PLACE
      ?auto_977537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977538 ?auto_977539 ) ( SURFACE-AT ?auto_977535 ?auto_977539 ) ( CLEAR ?auto_977535 ) ( IS-CRATE ?auto_977536 ) ( not ( = ?auto_977535 ?auto_977536 ) ) ( TRUCK-AT ?auto_977537 ?auto_977539 ) ( AVAILABLE ?auto_977538 ) ( IN ?auto_977536 ?auto_977537 ) ( ON ?auto_977535 ?auto_977534 ) ( not ( = ?auto_977534 ?auto_977535 ) ) ( not ( = ?auto_977534 ?auto_977536 ) ) ( ON ?auto_977534 ?auto_977533 ) ( not ( = ?auto_977533 ?auto_977534 ) ) ( not ( = ?auto_977533 ?auto_977535 ) ) ( not ( = ?auto_977533 ?auto_977536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977534 ?auto_977535 ?auto_977536 )
      ( MAKE-3CRATE-VERIFY ?auto_977533 ?auto_977534 ?auto_977535 ?auto_977536 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977554 - SURFACE
      ?auto_977555 - SURFACE
      ?auto_977556 - SURFACE
      ?auto_977557 - SURFACE
    )
    :vars
    (
      ?auto_977559 - HOIST
      ?auto_977560 - PLACE
      ?auto_977558 - TRUCK
      ?auto_977561 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977559 ?auto_977560 ) ( SURFACE-AT ?auto_977556 ?auto_977560 ) ( CLEAR ?auto_977556 ) ( IS-CRATE ?auto_977557 ) ( not ( = ?auto_977556 ?auto_977557 ) ) ( AVAILABLE ?auto_977559 ) ( IN ?auto_977557 ?auto_977558 ) ( ON ?auto_977556 ?auto_977555 ) ( not ( = ?auto_977555 ?auto_977556 ) ) ( not ( = ?auto_977555 ?auto_977557 ) ) ( TRUCK-AT ?auto_977558 ?auto_977561 ) ( not ( = ?auto_977561 ?auto_977560 ) ) ( ON ?auto_977555 ?auto_977554 ) ( not ( = ?auto_977554 ?auto_977555 ) ) ( not ( = ?auto_977554 ?auto_977556 ) ) ( not ( = ?auto_977554 ?auto_977557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977555 ?auto_977556 ?auto_977557 )
      ( MAKE-3CRATE-VERIFY ?auto_977554 ?auto_977555 ?auto_977556 ?auto_977557 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977578 - SURFACE
      ?auto_977579 - SURFACE
      ?auto_977580 - SURFACE
      ?auto_977581 - SURFACE
    )
    :vars
    (
      ?auto_977584 - HOIST
      ?auto_977585 - PLACE
      ?auto_977586 - TRUCK
      ?auto_977583 - PLACE
      ?auto_977582 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977584 ?auto_977585 ) ( SURFACE-AT ?auto_977580 ?auto_977585 ) ( CLEAR ?auto_977580 ) ( IS-CRATE ?auto_977581 ) ( not ( = ?auto_977580 ?auto_977581 ) ) ( AVAILABLE ?auto_977584 ) ( ON ?auto_977580 ?auto_977579 ) ( not ( = ?auto_977579 ?auto_977580 ) ) ( not ( = ?auto_977579 ?auto_977581 ) ) ( TRUCK-AT ?auto_977586 ?auto_977583 ) ( not ( = ?auto_977583 ?auto_977585 ) ) ( HOIST-AT ?auto_977582 ?auto_977583 ) ( LIFTING ?auto_977582 ?auto_977581 ) ( not ( = ?auto_977584 ?auto_977582 ) ) ( ON ?auto_977579 ?auto_977578 ) ( not ( = ?auto_977578 ?auto_977579 ) ) ( not ( = ?auto_977578 ?auto_977580 ) ) ( not ( = ?auto_977578 ?auto_977581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977579 ?auto_977580 ?auto_977581 )
      ( MAKE-3CRATE-VERIFY ?auto_977578 ?auto_977579 ?auto_977580 ?auto_977581 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977605 - SURFACE
      ?auto_977606 - SURFACE
      ?auto_977607 - SURFACE
      ?auto_977608 - SURFACE
    )
    :vars
    (
      ?auto_977614 - HOIST
      ?auto_977610 - PLACE
      ?auto_977613 - TRUCK
      ?auto_977611 - PLACE
      ?auto_977612 - HOIST
      ?auto_977609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977614 ?auto_977610 ) ( SURFACE-AT ?auto_977607 ?auto_977610 ) ( CLEAR ?auto_977607 ) ( IS-CRATE ?auto_977608 ) ( not ( = ?auto_977607 ?auto_977608 ) ) ( AVAILABLE ?auto_977614 ) ( ON ?auto_977607 ?auto_977606 ) ( not ( = ?auto_977606 ?auto_977607 ) ) ( not ( = ?auto_977606 ?auto_977608 ) ) ( TRUCK-AT ?auto_977613 ?auto_977611 ) ( not ( = ?auto_977611 ?auto_977610 ) ) ( HOIST-AT ?auto_977612 ?auto_977611 ) ( not ( = ?auto_977614 ?auto_977612 ) ) ( AVAILABLE ?auto_977612 ) ( SURFACE-AT ?auto_977608 ?auto_977611 ) ( ON ?auto_977608 ?auto_977609 ) ( CLEAR ?auto_977608 ) ( not ( = ?auto_977607 ?auto_977609 ) ) ( not ( = ?auto_977608 ?auto_977609 ) ) ( not ( = ?auto_977606 ?auto_977609 ) ) ( ON ?auto_977606 ?auto_977605 ) ( not ( = ?auto_977605 ?auto_977606 ) ) ( not ( = ?auto_977605 ?auto_977607 ) ) ( not ( = ?auto_977605 ?auto_977608 ) ) ( not ( = ?auto_977605 ?auto_977609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977606 ?auto_977607 ?auto_977608 )
      ( MAKE-3CRATE-VERIFY ?auto_977605 ?auto_977606 ?auto_977607 ?auto_977608 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977633 - SURFACE
      ?auto_977634 - SURFACE
      ?auto_977635 - SURFACE
      ?auto_977636 - SURFACE
    )
    :vars
    (
      ?auto_977641 - HOIST
      ?auto_977639 - PLACE
      ?auto_977638 - PLACE
      ?auto_977640 - HOIST
      ?auto_977642 - SURFACE
      ?auto_977637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977641 ?auto_977639 ) ( SURFACE-AT ?auto_977635 ?auto_977639 ) ( CLEAR ?auto_977635 ) ( IS-CRATE ?auto_977636 ) ( not ( = ?auto_977635 ?auto_977636 ) ) ( AVAILABLE ?auto_977641 ) ( ON ?auto_977635 ?auto_977634 ) ( not ( = ?auto_977634 ?auto_977635 ) ) ( not ( = ?auto_977634 ?auto_977636 ) ) ( not ( = ?auto_977638 ?auto_977639 ) ) ( HOIST-AT ?auto_977640 ?auto_977638 ) ( not ( = ?auto_977641 ?auto_977640 ) ) ( AVAILABLE ?auto_977640 ) ( SURFACE-AT ?auto_977636 ?auto_977638 ) ( ON ?auto_977636 ?auto_977642 ) ( CLEAR ?auto_977636 ) ( not ( = ?auto_977635 ?auto_977642 ) ) ( not ( = ?auto_977636 ?auto_977642 ) ) ( not ( = ?auto_977634 ?auto_977642 ) ) ( TRUCK-AT ?auto_977637 ?auto_977639 ) ( ON ?auto_977634 ?auto_977633 ) ( not ( = ?auto_977633 ?auto_977634 ) ) ( not ( = ?auto_977633 ?auto_977635 ) ) ( not ( = ?auto_977633 ?auto_977636 ) ) ( not ( = ?auto_977633 ?auto_977642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977634 ?auto_977635 ?auto_977636 )
      ( MAKE-3CRATE-VERIFY ?auto_977633 ?auto_977634 ?auto_977635 ?auto_977636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977661 - SURFACE
      ?auto_977662 - SURFACE
      ?auto_977663 - SURFACE
      ?auto_977664 - SURFACE
    )
    :vars
    (
      ?auto_977668 - HOIST
      ?auto_977665 - PLACE
      ?auto_977667 - PLACE
      ?auto_977669 - HOIST
      ?auto_977670 - SURFACE
      ?auto_977666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977668 ?auto_977665 ) ( IS-CRATE ?auto_977664 ) ( not ( = ?auto_977663 ?auto_977664 ) ) ( not ( = ?auto_977662 ?auto_977663 ) ) ( not ( = ?auto_977662 ?auto_977664 ) ) ( not ( = ?auto_977667 ?auto_977665 ) ) ( HOIST-AT ?auto_977669 ?auto_977667 ) ( not ( = ?auto_977668 ?auto_977669 ) ) ( AVAILABLE ?auto_977669 ) ( SURFACE-AT ?auto_977664 ?auto_977667 ) ( ON ?auto_977664 ?auto_977670 ) ( CLEAR ?auto_977664 ) ( not ( = ?auto_977663 ?auto_977670 ) ) ( not ( = ?auto_977664 ?auto_977670 ) ) ( not ( = ?auto_977662 ?auto_977670 ) ) ( TRUCK-AT ?auto_977666 ?auto_977665 ) ( SURFACE-AT ?auto_977662 ?auto_977665 ) ( CLEAR ?auto_977662 ) ( LIFTING ?auto_977668 ?auto_977663 ) ( IS-CRATE ?auto_977663 ) ( ON ?auto_977662 ?auto_977661 ) ( not ( = ?auto_977661 ?auto_977662 ) ) ( not ( = ?auto_977661 ?auto_977663 ) ) ( not ( = ?auto_977661 ?auto_977664 ) ) ( not ( = ?auto_977661 ?auto_977670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977662 ?auto_977663 ?auto_977664 )
      ( MAKE-3CRATE-VERIFY ?auto_977661 ?auto_977662 ?auto_977663 ?auto_977664 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_977689 - SURFACE
      ?auto_977690 - SURFACE
      ?auto_977691 - SURFACE
      ?auto_977692 - SURFACE
    )
    :vars
    (
      ?auto_977694 - HOIST
      ?auto_977698 - PLACE
      ?auto_977695 - PLACE
      ?auto_977697 - HOIST
      ?auto_977693 - SURFACE
      ?auto_977696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977694 ?auto_977698 ) ( IS-CRATE ?auto_977692 ) ( not ( = ?auto_977691 ?auto_977692 ) ) ( not ( = ?auto_977690 ?auto_977691 ) ) ( not ( = ?auto_977690 ?auto_977692 ) ) ( not ( = ?auto_977695 ?auto_977698 ) ) ( HOIST-AT ?auto_977697 ?auto_977695 ) ( not ( = ?auto_977694 ?auto_977697 ) ) ( AVAILABLE ?auto_977697 ) ( SURFACE-AT ?auto_977692 ?auto_977695 ) ( ON ?auto_977692 ?auto_977693 ) ( CLEAR ?auto_977692 ) ( not ( = ?auto_977691 ?auto_977693 ) ) ( not ( = ?auto_977692 ?auto_977693 ) ) ( not ( = ?auto_977690 ?auto_977693 ) ) ( TRUCK-AT ?auto_977696 ?auto_977698 ) ( SURFACE-AT ?auto_977690 ?auto_977698 ) ( CLEAR ?auto_977690 ) ( IS-CRATE ?auto_977691 ) ( AVAILABLE ?auto_977694 ) ( IN ?auto_977691 ?auto_977696 ) ( ON ?auto_977690 ?auto_977689 ) ( not ( = ?auto_977689 ?auto_977690 ) ) ( not ( = ?auto_977689 ?auto_977691 ) ) ( not ( = ?auto_977689 ?auto_977692 ) ) ( not ( = ?auto_977689 ?auto_977693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977690 ?auto_977691 ?auto_977692 )
      ( MAKE-3CRATE-VERIFY ?auto_977689 ?auto_977690 ?auto_977691 ?auto_977692 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977980 - SURFACE
      ?auto_977981 - SURFACE
      ?auto_977982 - SURFACE
      ?auto_977983 - SURFACE
      ?auto_977984 - SURFACE
    )
    :vars
    (
      ?auto_977986 - HOIST
      ?auto_977985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977986 ?auto_977985 ) ( SURFACE-AT ?auto_977983 ?auto_977985 ) ( CLEAR ?auto_977983 ) ( LIFTING ?auto_977986 ?auto_977984 ) ( IS-CRATE ?auto_977984 ) ( not ( = ?auto_977983 ?auto_977984 ) ) ( ON ?auto_977981 ?auto_977980 ) ( ON ?auto_977982 ?auto_977981 ) ( ON ?auto_977983 ?auto_977982 ) ( not ( = ?auto_977980 ?auto_977981 ) ) ( not ( = ?auto_977980 ?auto_977982 ) ) ( not ( = ?auto_977980 ?auto_977983 ) ) ( not ( = ?auto_977980 ?auto_977984 ) ) ( not ( = ?auto_977981 ?auto_977982 ) ) ( not ( = ?auto_977981 ?auto_977983 ) ) ( not ( = ?auto_977981 ?auto_977984 ) ) ( not ( = ?auto_977982 ?auto_977983 ) ) ( not ( = ?auto_977982 ?auto_977984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977983 ?auto_977984 )
      ( MAKE-4CRATE-VERIFY ?auto_977980 ?auto_977981 ?auto_977982 ?auto_977983 ?auto_977984 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978005 - SURFACE
      ?auto_978006 - SURFACE
      ?auto_978007 - SURFACE
      ?auto_978008 - SURFACE
      ?auto_978009 - SURFACE
    )
    :vars
    (
      ?auto_978011 - HOIST
      ?auto_978012 - PLACE
      ?auto_978010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978011 ?auto_978012 ) ( SURFACE-AT ?auto_978008 ?auto_978012 ) ( CLEAR ?auto_978008 ) ( IS-CRATE ?auto_978009 ) ( not ( = ?auto_978008 ?auto_978009 ) ) ( TRUCK-AT ?auto_978010 ?auto_978012 ) ( AVAILABLE ?auto_978011 ) ( IN ?auto_978009 ?auto_978010 ) ( ON ?auto_978008 ?auto_978007 ) ( not ( = ?auto_978007 ?auto_978008 ) ) ( not ( = ?auto_978007 ?auto_978009 ) ) ( ON ?auto_978006 ?auto_978005 ) ( ON ?auto_978007 ?auto_978006 ) ( not ( = ?auto_978005 ?auto_978006 ) ) ( not ( = ?auto_978005 ?auto_978007 ) ) ( not ( = ?auto_978005 ?auto_978008 ) ) ( not ( = ?auto_978005 ?auto_978009 ) ) ( not ( = ?auto_978006 ?auto_978007 ) ) ( not ( = ?auto_978006 ?auto_978008 ) ) ( not ( = ?auto_978006 ?auto_978009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978007 ?auto_978008 ?auto_978009 )
      ( MAKE-4CRATE-VERIFY ?auto_978005 ?auto_978006 ?auto_978007 ?auto_978008 ?auto_978009 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978035 - SURFACE
      ?auto_978036 - SURFACE
      ?auto_978037 - SURFACE
      ?auto_978038 - SURFACE
      ?auto_978039 - SURFACE
    )
    :vars
    (
      ?auto_978040 - HOIST
      ?auto_978042 - PLACE
      ?auto_978043 - TRUCK
      ?auto_978041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978040 ?auto_978042 ) ( SURFACE-AT ?auto_978038 ?auto_978042 ) ( CLEAR ?auto_978038 ) ( IS-CRATE ?auto_978039 ) ( not ( = ?auto_978038 ?auto_978039 ) ) ( AVAILABLE ?auto_978040 ) ( IN ?auto_978039 ?auto_978043 ) ( ON ?auto_978038 ?auto_978037 ) ( not ( = ?auto_978037 ?auto_978038 ) ) ( not ( = ?auto_978037 ?auto_978039 ) ) ( TRUCK-AT ?auto_978043 ?auto_978041 ) ( not ( = ?auto_978041 ?auto_978042 ) ) ( ON ?auto_978036 ?auto_978035 ) ( ON ?auto_978037 ?auto_978036 ) ( not ( = ?auto_978035 ?auto_978036 ) ) ( not ( = ?auto_978035 ?auto_978037 ) ) ( not ( = ?auto_978035 ?auto_978038 ) ) ( not ( = ?auto_978035 ?auto_978039 ) ) ( not ( = ?auto_978036 ?auto_978037 ) ) ( not ( = ?auto_978036 ?auto_978038 ) ) ( not ( = ?auto_978036 ?auto_978039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978037 ?auto_978038 ?auto_978039 )
      ( MAKE-4CRATE-VERIFY ?auto_978035 ?auto_978036 ?auto_978037 ?auto_978038 ?auto_978039 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978069 - SURFACE
      ?auto_978070 - SURFACE
      ?auto_978071 - SURFACE
      ?auto_978072 - SURFACE
      ?auto_978073 - SURFACE
    )
    :vars
    (
      ?auto_978074 - HOIST
      ?auto_978076 - PLACE
      ?auto_978075 - TRUCK
      ?auto_978078 - PLACE
      ?auto_978077 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_978074 ?auto_978076 ) ( SURFACE-AT ?auto_978072 ?auto_978076 ) ( CLEAR ?auto_978072 ) ( IS-CRATE ?auto_978073 ) ( not ( = ?auto_978072 ?auto_978073 ) ) ( AVAILABLE ?auto_978074 ) ( ON ?auto_978072 ?auto_978071 ) ( not ( = ?auto_978071 ?auto_978072 ) ) ( not ( = ?auto_978071 ?auto_978073 ) ) ( TRUCK-AT ?auto_978075 ?auto_978078 ) ( not ( = ?auto_978078 ?auto_978076 ) ) ( HOIST-AT ?auto_978077 ?auto_978078 ) ( LIFTING ?auto_978077 ?auto_978073 ) ( not ( = ?auto_978074 ?auto_978077 ) ) ( ON ?auto_978070 ?auto_978069 ) ( ON ?auto_978071 ?auto_978070 ) ( not ( = ?auto_978069 ?auto_978070 ) ) ( not ( = ?auto_978069 ?auto_978071 ) ) ( not ( = ?auto_978069 ?auto_978072 ) ) ( not ( = ?auto_978069 ?auto_978073 ) ) ( not ( = ?auto_978070 ?auto_978071 ) ) ( not ( = ?auto_978070 ?auto_978072 ) ) ( not ( = ?auto_978070 ?auto_978073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978071 ?auto_978072 ?auto_978073 )
      ( MAKE-4CRATE-VERIFY ?auto_978069 ?auto_978070 ?auto_978071 ?auto_978072 ?auto_978073 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978107 - SURFACE
      ?auto_978108 - SURFACE
      ?auto_978109 - SURFACE
      ?auto_978110 - SURFACE
      ?auto_978111 - SURFACE
    )
    :vars
    (
      ?auto_978113 - HOIST
      ?auto_978112 - PLACE
      ?auto_978117 - TRUCK
      ?auto_978116 - PLACE
      ?auto_978114 - HOIST
      ?auto_978115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978113 ?auto_978112 ) ( SURFACE-AT ?auto_978110 ?auto_978112 ) ( CLEAR ?auto_978110 ) ( IS-CRATE ?auto_978111 ) ( not ( = ?auto_978110 ?auto_978111 ) ) ( AVAILABLE ?auto_978113 ) ( ON ?auto_978110 ?auto_978109 ) ( not ( = ?auto_978109 ?auto_978110 ) ) ( not ( = ?auto_978109 ?auto_978111 ) ) ( TRUCK-AT ?auto_978117 ?auto_978116 ) ( not ( = ?auto_978116 ?auto_978112 ) ) ( HOIST-AT ?auto_978114 ?auto_978116 ) ( not ( = ?auto_978113 ?auto_978114 ) ) ( AVAILABLE ?auto_978114 ) ( SURFACE-AT ?auto_978111 ?auto_978116 ) ( ON ?auto_978111 ?auto_978115 ) ( CLEAR ?auto_978111 ) ( not ( = ?auto_978110 ?auto_978115 ) ) ( not ( = ?auto_978111 ?auto_978115 ) ) ( not ( = ?auto_978109 ?auto_978115 ) ) ( ON ?auto_978108 ?auto_978107 ) ( ON ?auto_978109 ?auto_978108 ) ( not ( = ?auto_978107 ?auto_978108 ) ) ( not ( = ?auto_978107 ?auto_978109 ) ) ( not ( = ?auto_978107 ?auto_978110 ) ) ( not ( = ?auto_978107 ?auto_978111 ) ) ( not ( = ?auto_978107 ?auto_978115 ) ) ( not ( = ?auto_978108 ?auto_978109 ) ) ( not ( = ?auto_978108 ?auto_978110 ) ) ( not ( = ?auto_978108 ?auto_978111 ) ) ( not ( = ?auto_978108 ?auto_978115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978109 ?auto_978110 ?auto_978111 )
      ( MAKE-4CRATE-VERIFY ?auto_978107 ?auto_978108 ?auto_978109 ?auto_978110 ?auto_978111 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978146 - SURFACE
      ?auto_978147 - SURFACE
      ?auto_978148 - SURFACE
      ?auto_978149 - SURFACE
      ?auto_978150 - SURFACE
    )
    :vars
    (
      ?auto_978156 - HOIST
      ?auto_978154 - PLACE
      ?auto_978151 - PLACE
      ?auto_978152 - HOIST
      ?auto_978153 - SURFACE
      ?auto_978155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978156 ?auto_978154 ) ( SURFACE-AT ?auto_978149 ?auto_978154 ) ( CLEAR ?auto_978149 ) ( IS-CRATE ?auto_978150 ) ( not ( = ?auto_978149 ?auto_978150 ) ) ( AVAILABLE ?auto_978156 ) ( ON ?auto_978149 ?auto_978148 ) ( not ( = ?auto_978148 ?auto_978149 ) ) ( not ( = ?auto_978148 ?auto_978150 ) ) ( not ( = ?auto_978151 ?auto_978154 ) ) ( HOIST-AT ?auto_978152 ?auto_978151 ) ( not ( = ?auto_978156 ?auto_978152 ) ) ( AVAILABLE ?auto_978152 ) ( SURFACE-AT ?auto_978150 ?auto_978151 ) ( ON ?auto_978150 ?auto_978153 ) ( CLEAR ?auto_978150 ) ( not ( = ?auto_978149 ?auto_978153 ) ) ( not ( = ?auto_978150 ?auto_978153 ) ) ( not ( = ?auto_978148 ?auto_978153 ) ) ( TRUCK-AT ?auto_978155 ?auto_978154 ) ( ON ?auto_978147 ?auto_978146 ) ( ON ?auto_978148 ?auto_978147 ) ( not ( = ?auto_978146 ?auto_978147 ) ) ( not ( = ?auto_978146 ?auto_978148 ) ) ( not ( = ?auto_978146 ?auto_978149 ) ) ( not ( = ?auto_978146 ?auto_978150 ) ) ( not ( = ?auto_978146 ?auto_978153 ) ) ( not ( = ?auto_978147 ?auto_978148 ) ) ( not ( = ?auto_978147 ?auto_978149 ) ) ( not ( = ?auto_978147 ?auto_978150 ) ) ( not ( = ?auto_978147 ?auto_978153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978148 ?auto_978149 ?auto_978150 )
      ( MAKE-4CRATE-VERIFY ?auto_978146 ?auto_978147 ?auto_978148 ?auto_978149 ?auto_978150 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978185 - SURFACE
      ?auto_978186 - SURFACE
      ?auto_978187 - SURFACE
      ?auto_978188 - SURFACE
      ?auto_978189 - SURFACE
    )
    :vars
    (
      ?auto_978193 - HOIST
      ?auto_978190 - PLACE
      ?auto_978191 - PLACE
      ?auto_978195 - HOIST
      ?auto_978192 - SURFACE
      ?auto_978194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978193 ?auto_978190 ) ( IS-CRATE ?auto_978189 ) ( not ( = ?auto_978188 ?auto_978189 ) ) ( not ( = ?auto_978187 ?auto_978188 ) ) ( not ( = ?auto_978187 ?auto_978189 ) ) ( not ( = ?auto_978191 ?auto_978190 ) ) ( HOIST-AT ?auto_978195 ?auto_978191 ) ( not ( = ?auto_978193 ?auto_978195 ) ) ( AVAILABLE ?auto_978195 ) ( SURFACE-AT ?auto_978189 ?auto_978191 ) ( ON ?auto_978189 ?auto_978192 ) ( CLEAR ?auto_978189 ) ( not ( = ?auto_978188 ?auto_978192 ) ) ( not ( = ?auto_978189 ?auto_978192 ) ) ( not ( = ?auto_978187 ?auto_978192 ) ) ( TRUCK-AT ?auto_978194 ?auto_978190 ) ( SURFACE-AT ?auto_978187 ?auto_978190 ) ( CLEAR ?auto_978187 ) ( LIFTING ?auto_978193 ?auto_978188 ) ( IS-CRATE ?auto_978188 ) ( ON ?auto_978186 ?auto_978185 ) ( ON ?auto_978187 ?auto_978186 ) ( not ( = ?auto_978185 ?auto_978186 ) ) ( not ( = ?auto_978185 ?auto_978187 ) ) ( not ( = ?auto_978185 ?auto_978188 ) ) ( not ( = ?auto_978185 ?auto_978189 ) ) ( not ( = ?auto_978185 ?auto_978192 ) ) ( not ( = ?auto_978186 ?auto_978187 ) ) ( not ( = ?auto_978186 ?auto_978188 ) ) ( not ( = ?auto_978186 ?auto_978189 ) ) ( not ( = ?auto_978186 ?auto_978192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978187 ?auto_978188 ?auto_978189 )
      ( MAKE-4CRATE-VERIFY ?auto_978185 ?auto_978186 ?auto_978187 ?auto_978188 ?auto_978189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_978224 - SURFACE
      ?auto_978225 - SURFACE
      ?auto_978226 - SURFACE
      ?auto_978227 - SURFACE
      ?auto_978228 - SURFACE
    )
    :vars
    (
      ?auto_978232 - HOIST
      ?auto_978233 - PLACE
      ?auto_978229 - PLACE
      ?auto_978231 - HOIST
      ?auto_978234 - SURFACE
      ?auto_978230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978232 ?auto_978233 ) ( IS-CRATE ?auto_978228 ) ( not ( = ?auto_978227 ?auto_978228 ) ) ( not ( = ?auto_978226 ?auto_978227 ) ) ( not ( = ?auto_978226 ?auto_978228 ) ) ( not ( = ?auto_978229 ?auto_978233 ) ) ( HOIST-AT ?auto_978231 ?auto_978229 ) ( not ( = ?auto_978232 ?auto_978231 ) ) ( AVAILABLE ?auto_978231 ) ( SURFACE-AT ?auto_978228 ?auto_978229 ) ( ON ?auto_978228 ?auto_978234 ) ( CLEAR ?auto_978228 ) ( not ( = ?auto_978227 ?auto_978234 ) ) ( not ( = ?auto_978228 ?auto_978234 ) ) ( not ( = ?auto_978226 ?auto_978234 ) ) ( TRUCK-AT ?auto_978230 ?auto_978233 ) ( SURFACE-AT ?auto_978226 ?auto_978233 ) ( CLEAR ?auto_978226 ) ( IS-CRATE ?auto_978227 ) ( AVAILABLE ?auto_978232 ) ( IN ?auto_978227 ?auto_978230 ) ( ON ?auto_978225 ?auto_978224 ) ( ON ?auto_978226 ?auto_978225 ) ( not ( = ?auto_978224 ?auto_978225 ) ) ( not ( = ?auto_978224 ?auto_978226 ) ) ( not ( = ?auto_978224 ?auto_978227 ) ) ( not ( = ?auto_978224 ?auto_978228 ) ) ( not ( = ?auto_978224 ?auto_978234 ) ) ( not ( = ?auto_978225 ?auto_978226 ) ) ( not ( = ?auto_978225 ?auto_978227 ) ) ( not ( = ?auto_978225 ?auto_978228 ) ) ( not ( = ?auto_978225 ?auto_978234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978226 ?auto_978227 ?auto_978228 )
      ( MAKE-4CRATE-VERIFY ?auto_978224 ?auto_978225 ?auto_978226 ?auto_978227 ?auto_978228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_978725 - SURFACE
      ?auto_978726 - SURFACE
    )
    :vars
    (
      ?auto_978729 - HOIST
      ?auto_978730 - PLACE
      ?auto_978727 - SURFACE
      ?auto_978732 - TRUCK
      ?auto_978733 - PLACE
      ?auto_978731 - HOIST
      ?auto_978728 - SURFACE
      ?auto_978734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978729 ?auto_978730 ) ( SURFACE-AT ?auto_978725 ?auto_978730 ) ( CLEAR ?auto_978725 ) ( IS-CRATE ?auto_978726 ) ( not ( = ?auto_978725 ?auto_978726 ) ) ( AVAILABLE ?auto_978729 ) ( ON ?auto_978725 ?auto_978727 ) ( not ( = ?auto_978727 ?auto_978725 ) ) ( not ( = ?auto_978727 ?auto_978726 ) ) ( TRUCK-AT ?auto_978732 ?auto_978733 ) ( not ( = ?auto_978733 ?auto_978730 ) ) ( HOIST-AT ?auto_978731 ?auto_978733 ) ( not ( = ?auto_978729 ?auto_978731 ) ) ( SURFACE-AT ?auto_978726 ?auto_978733 ) ( ON ?auto_978726 ?auto_978728 ) ( CLEAR ?auto_978726 ) ( not ( = ?auto_978725 ?auto_978728 ) ) ( not ( = ?auto_978726 ?auto_978728 ) ) ( not ( = ?auto_978727 ?auto_978728 ) ) ( LIFTING ?auto_978731 ?auto_978734 ) ( IS-CRATE ?auto_978734 ) ( not ( = ?auto_978725 ?auto_978734 ) ) ( not ( = ?auto_978726 ?auto_978734 ) ) ( not ( = ?auto_978727 ?auto_978734 ) ) ( not ( = ?auto_978728 ?auto_978734 ) ) )
    :subtasks
    ( ( !LOAD ?auto_978731 ?auto_978734 ?auto_978732 ?auto_978733 )
      ( MAKE-1CRATE ?auto_978725 ?auto_978726 )
      ( MAKE-1CRATE-VERIFY ?auto_978725 ?auto_978726 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978884 - SURFACE
      ?auto_978885 - SURFACE
      ?auto_978886 - SURFACE
      ?auto_978887 - SURFACE
      ?auto_978888 - SURFACE
      ?auto_978889 - SURFACE
    )
    :vars
    (
      ?auto_978890 - HOIST
      ?auto_978891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978890 ?auto_978891 ) ( SURFACE-AT ?auto_978888 ?auto_978891 ) ( CLEAR ?auto_978888 ) ( LIFTING ?auto_978890 ?auto_978889 ) ( IS-CRATE ?auto_978889 ) ( not ( = ?auto_978888 ?auto_978889 ) ) ( ON ?auto_978885 ?auto_978884 ) ( ON ?auto_978886 ?auto_978885 ) ( ON ?auto_978887 ?auto_978886 ) ( ON ?auto_978888 ?auto_978887 ) ( not ( = ?auto_978884 ?auto_978885 ) ) ( not ( = ?auto_978884 ?auto_978886 ) ) ( not ( = ?auto_978884 ?auto_978887 ) ) ( not ( = ?auto_978884 ?auto_978888 ) ) ( not ( = ?auto_978884 ?auto_978889 ) ) ( not ( = ?auto_978885 ?auto_978886 ) ) ( not ( = ?auto_978885 ?auto_978887 ) ) ( not ( = ?auto_978885 ?auto_978888 ) ) ( not ( = ?auto_978885 ?auto_978889 ) ) ( not ( = ?auto_978886 ?auto_978887 ) ) ( not ( = ?auto_978886 ?auto_978888 ) ) ( not ( = ?auto_978886 ?auto_978889 ) ) ( not ( = ?auto_978887 ?auto_978888 ) ) ( not ( = ?auto_978887 ?auto_978889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_978888 ?auto_978889 )
      ( MAKE-5CRATE-VERIFY ?auto_978884 ?auto_978885 ?auto_978886 ?auto_978887 ?auto_978888 ?auto_978889 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978918 - SURFACE
      ?auto_978919 - SURFACE
      ?auto_978920 - SURFACE
      ?auto_978921 - SURFACE
      ?auto_978922 - SURFACE
      ?auto_978923 - SURFACE
    )
    :vars
    (
      ?auto_978926 - HOIST
      ?auto_978925 - PLACE
      ?auto_978924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978926 ?auto_978925 ) ( SURFACE-AT ?auto_978922 ?auto_978925 ) ( CLEAR ?auto_978922 ) ( IS-CRATE ?auto_978923 ) ( not ( = ?auto_978922 ?auto_978923 ) ) ( TRUCK-AT ?auto_978924 ?auto_978925 ) ( AVAILABLE ?auto_978926 ) ( IN ?auto_978923 ?auto_978924 ) ( ON ?auto_978922 ?auto_978921 ) ( not ( = ?auto_978921 ?auto_978922 ) ) ( not ( = ?auto_978921 ?auto_978923 ) ) ( ON ?auto_978919 ?auto_978918 ) ( ON ?auto_978920 ?auto_978919 ) ( ON ?auto_978921 ?auto_978920 ) ( not ( = ?auto_978918 ?auto_978919 ) ) ( not ( = ?auto_978918 ?auto_978920 ) ) ( not ( = ?auto_978918 ?auto_978921 ) ) ( not ( = ?auto_978918 ?auto_978922 ) ) ( not ( = ?auto_978918 ?auto_978923 ) ) ( not ( = ?auto_978919 ?auto_978920 ) ) ( not ( = ?auto_978919 ?auto_978921 ) ) ( not ( = ?auto_978919 ?auto_978922 ) ) ( not ( = ?auto_978919 ?auto_978923 ) ) ( not ( = ?auto_978920 ?auto_978921 ) ) ( not ( = ?auto_978920 ?auto_978922 ) ) ( not ( = ?auto_978920 ?auto_978923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978921 ?auto_978922 ?auto_978923 )
      ( MAKE-5CRATE-VERIFY ?auto_978918 ?auto_978919 ?auto_978920 ?auto_978921 ?auto_978922 ?auto_978923 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978958 - SURFACE
      ?auto_978959 - SURFACE
      ?auto_978960 - SURFACE
      ?auto_978961 - SURFACE
      ?auto_978962 - SURFACE
      ?auto_978963 - SURFACE
    )
    :vars
    (
      ?auto_978965 - HOIST
      ?auto_978964 - PLACE
      ?auto_978966 - TRUCK
      ?auto_978967 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978965 ?auto_978964 ) ( SURFACE-AT ?auto_978962 ?auto_978964 ) ( CLEAR ?auto_978962 ) ( IS-CRATE ?auto_978963 ) ( not ( = ?auto_978962 ?auto_978963 ) ) ( AVAILABLE ?auto_978965 ) ( IN ?auto_978963 ?auto_978966 ) ( ON ?auto_978962 ?auto_978961 ) ( not ( = ?auto_978961 ?auto_978962 ) ) ( not ( = ?auto_978961 ?auto_978963 ) ) ( TRUCK-AT ?auto_978966 ?auto_978967 ) ( not ( = ?auto_978967 ?auto_978964 ) ) ( ON ?auto_978959 ?auto_978958 ) ( ON ?auto_978960 ?auto_978959 ) ( ON ?auto_978961 ?auto_978960 ) ( not ( = ?auto_978958 ?auto_978959 ) ) ( not ( = ?auto_978958 ?auto_978960 ) ) ( not ( = ?auto_978958 ?auto_978961 ) ) ( not ( = ?auto_978958 ?auto_978962 ) ) ( not ( = ?auto_978958 ?auto_978963 ) ) ( not ( = ?auto_978959 ?auto_978960 ) ) ( not ( = ?auto_978959 ?auto_978961 ) ) ( not ( = ?auto_978959 ?auto_978962 ) ) ( not ( = ?auto_978959 ?auto_978963 ) ) ( not ( = ?auto_978960 ?auto_978961 ) ) ( not ( = ?auto_978960 ?auto_978962 ) ) ( not ( = ?auto_978960 ?auto_978963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978961 ?auto_978962 ?auto_978963 )
      ( MAKE-5CRATE-VERIFY ?auto_978958 ?auto_978959 ?auto_978960 ?auto_978961 ?auto_978962 ?auto_978963 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979003 - SURFACE
      ?auto_979004 - SURFACE
      ?auto_979005 - SURFACE
      ?auto_979006 - SURFACE
      ?auto_979007 - SURFACE
      ?auto_979008 - SURFACE
    )
    :vars
    (
      ?auto_979012 - HOIST
      ?auto_979011 - PLACE
      ?auto_979013 - TRUCK
      ?auto_979010 - PLACE
      ?auto_979009 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_979012 ?auto_979011 ) ( SURFACE-AT ?auto_979007 ?auto_979011 ) ( CLEAR ?auto_979007 ) ( IS-CRATE ?auto_979008 ) ( not ( = ?auto_979007 ?auto_979008 ) ) ( AVAILABLE ?auto_979012 ) ( ON ?auto_979007 ?auto_979006 ) ( not ( = ?auto_979006 ?auto_979007 ) ) ( not ( = ?auto_979006 ?auto_979008 ) ) ( TRUCK-AT ?auto_979013 ?auto_979010 ) ( not ( = ?auto_979010 ?auto_979011 ) ) ( HOIST-AT ?auto_979009 ?auto_979010 ) ( LIFTING ?auto_979009 ?auto_979008 ) ( not ( = ?auto_979012 ?auto_979009 ) ) ( ON ?auto_979004 ?auto_979003 ) ( ON ?auto_979005 ?auto_979004 ) ( ON ?auto_979006 ?auto_979005 ) ( not ( = ?auto_979003 ?auto_979004 ) ) ( not ( = ?auto_979003 ?auto_979005 ) ) ( not ( = ?auto_979003 ?auto_979006 ) ) ( not ( = ?auto_979003 ?auto_979007 ) ) ( not ( = ?auto_979003 ?auto_979008 ) ) ( not ( = ?auto_979004 ?auto_979005 ) ) ( not ( = ?auto_979004 ?auto_979006 ) ) ( not ( = ?auto_979004 ?auto_979007 ) ) ( not ( = ?auto_979004 ?auto_979008 ) ) ( not ( = ?auto_979005 ?auto_979006 ) ) ( not ( = ?auto_979005 ?auto_979007 ) ) ( not ( = ?auto_979005 ?auto_979008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979006 ?auto_979007 ?auto_979008 )
      ( MAKE-5CRATE-VERIFY ?auto_979003 ?auto_979004 ?auto_979005 ?auto_979006 ?auto_979007 ?auto_979008 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979053 - SURFACE
      ?auto_979054 - SURFACE
      ?auto_979055 - SURFACE
      ?auto_979056 - SURFACE
      ?auto_979057 - SURFACE
      ?auto_979058 - SURFACE
    )
    :vars
    (
      ?auto_979061 - HOIST
      ?auto_979060 - PLACE
      ?auto_979059 - TRUCK
      ?auto_979063 - PLACE
      ?auto_979064 - HOIST
      ?auto_979062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_979061 ?auto_979060 ) ( SURFACE-AT ?auto_979057 ?auto_979060 ) ( CLEAR ?auto_979057 ) ( IS-CRATE ?auto_979058 ) ( not ( = ?auto_979057 ?auto_979058 ) ) ( AVAILABLE ?auto_979061 ) ( ON ?auto_979057 ?auto_979056 ) ( not ( = ?auto_979056 ?auto_979057 ) ) ( not ( = ?auto_979056 ?auto_979058 ) ) ( TRUCK-AT ?auto_979059 ?auto_979063 ) ( not ( = ?auto_979063 ?auto_979060 ) ) ( HOIST-AT ?auto_979064 ?auto_979063 ) ( not ( = ?auto_979061 ?auto_979064 ) ) ( AVAILABLE ?auto_979064 ) ( SURFACE-AT ?auto_979058 ?auto_979063 ) ( ON ?auto_979058 ?auto_979062 ) ( CLEAR ?auto_979058 ) ( not ( = ?auto_979057 ?auto_979062 ) ) ( not ( = ?auto_979058 ?auto_979062 ) ) ( not ( = ?auto_979056 ?auto_979062 ) ) ( ON ?auto_979054 ?auto_979053 ) ( ON ?auto_979055 ?auto_979054 ) ( ON ?auto_979056 ?auto_979055 ) ( not ( = ?auto_979053 ?auto_979054 ) ) ( not ( = ?auto_979053 ?auto_979055 ) ) ( not ( = ?auto_979053 ?auto_979056 ) ) ( not ( = ?auto_979053 ?auto_979057 ) ) ( not ( = ?auto_979053 ?auto_979058 ) ) ( not ( = ?auto_979053 ?auto_979062 ) ) ( not ( = ?auto_979054 ?auto_979055 ) ) ( not ( = ?auto_979054 ?auto_979056 ) ) ( not ( = ?auto_979054 ?auto_979057 ) ) ( not ( = ?auto_979054 ?auto_979058 ) ) ( not ( = ?auto_979054 ?auto_979062 ) ) ( not ( = ?auto_979055 ?auto_979056 ) ) ( not ( = ?auto_979055 ?auto_979057 ) ) ( not ( = ?auto_979055 ?auto_979058 ) ) ( not ( = ?auto_979055 ?auto_979062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979056 ?auto_979057 ?auto_979058 )
      ( MAKE-5CRATE-VERIFY ?auto_979053 ?auto_979054 ?auto_979055 ?auto_979056 ?auto_979057 ?auto_979058 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979104 - SURFACE
      ?auto_979105 - SURFACE
      ?auto_979106 - SURFACE
      ?auto_979107 - SURFACE
      ?auto_979108 - SURFACE
      ?auto_979109 - SURFACE
    )
    :vars
    (
      ?auto_979113 - HOIST
      ?auto_979112 - PLACE
      ?auto_979111 - PLACE
      ?auto_979114 - HOIST
      ?auto_979110 - SURFACE
      ?auto_979115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979113 ?auto_979112 ) ( SURFACE-AT ?auto_979108 ?auto_979112 ) ( CLEAR ?auto_979108 ) ( IS-CRATE ?auto_979109 ) ( not ( = ?auto_979108 ?auto_979109 ) ) ( AVAILABLE ?auto_979113 ) ( ON ?auto_979108 ?auto_979107 ) ( not ( = ?auto_979107 ?auto_979108 ) ) ( not ( = ?auto_979107 ?auto_979109 ) ) ( not ( = ?auto_979111 ?auto_979112 ) ) ( HOIST-AT ?auto_979114 ?auto_979111 ) ( not ( = ?auto_979113 ?auto_979114 ) ) ( AVAILABLE ?auto_979114 ) ( SURFACE-AT ?auto_979109 ?auto_979111 ) ( ON ?auto_979109 ?auto_979110 ) ( CLEAR ?auto_979109 ) ( not ( = ?auto_979108 ?auto_979110 ) ) ( not ( = ?auto_979109 ?auto_979110 ) ) ( not ( = ?auto_979107 ?auto_979110 ) ) ( TRUCK-AT ?auto_979115 ?auto_979112 ) ( ON ?auto_979105 ?auto_979104 ) ( ON ?auto_979106 ?auto_979105 ) ( ON ?auto_979107 ?auto_979106 ) ( not ( = ?auto_979104 ?auto_979105 ) ) ( not ( = ?auto_979104 ?auto_979106 ) ) ( not ( = ?auto_979104 ?auto_979107 ) ) ( not ( = ?auto_979104 ?auto_979108 ) ) ( not ( = ?auto_979104 ?auto_979109 ) ) ( not ( = ?auto_979104 ?auto_979110 ) ) ( not ( = ?auto_979105 ?auto_979106 ) ) ( not ( = ?auto_979105 ?auto_979107 ) ) ( not ( = ?auto_979105 ?auto_979108 ) ) ( not ( = ?auto_979105 ?auto_979109 ) ) ( not ( = ?auto_979105 ?auto_979110 ) ) ( not ( = ?auto_979106 ?auto_979107 ) ) ( not ( = ?auto_979106 ?auto_979108 ) ) ( not ( = ?auto_979106 ?auto_979109 ) ) ( not ( = ?auto_979106 ?auto_979110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979107 ?auto_979108 ?auto_979109 )
      ( MAKE-5CRATE-VERIFY ?auto_979104 ?auto_979105 ?auto_979106 ?auto_979107 ?auto_979108 ?auto_979109 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979155 - SURFACE
      ?auto_979156 - SURFACE
      ?auto_979157 - SURFACE
      ?auto_979158 - SURFACE
      ?auto_979159 - SURFACE
      ?auto_979160 - SURFACE
    )
    :vars
    (
      ?auto_979162 - HOIST
      ?auto_979161 - PLACE
      ?auto_979163 - PLACE
      ?auto_979164 - HOIST
      ?auto_979166 - SURFACE
      ?auto_979165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979162 ?auto_979161 ) ( IS-CRATE ?auto_979160 ) ( not ( = ?auto_979159 ?auto_979160 ) ) ( not ( = ?auto_979158 ?auto_979159 ) ) ( not ( = ?auto_979158 ?auto_979160 ) ) ( not ( = ?auto_979163 ?auto_979161 ) ) ( HOIST-AT ?auto_979164 ?auto_979163 ) ( not ( = ?auto_979162 ?auto_979164 ) ) ( AVAILABLE ?auto_979164 ) ( SURFACE-AT ?auto_979160 ?auto_979163 ) ( ON ?auto_979160 ?auto_979166 ) ( CLEAR ?auto_979160 ) ( not ( = ?auto_979159 ?auto_979166 ) ) ( not ( = ?auto_979160 ?auto_979166 ) ) ( not ( = ?auto_979158 ?auto_979166 ) ) ( TRUCK-AT ?auto_979165 ?auto_979161 ) ( SURFACE-AT ?auto_979158 ?auto_979161 ) ( CLEAR ?auto_979158 ) ( LIFTING ?auto_979162 ?auto_979159 ) ( IS-CRATE ?auto_979159 ) ( ON ?auto_979156 ?auto_979155 ) ( ON ?auto_979157 ?auto_979156 ) ( ON ?auto_979158 ?auto_979157 ) ( not ( = ?auto_979155 ?auto_979156 ) ) ( not ( = ?auto_979155 ?auto_979157 ) ) ( not ( = ?auto_979155 ?auto_979158 ) ) ( not ( = ?auto_979155 ?auto_979159 ) ) ( not ( = ?auto_979155 ?auto_979160 ) ) ( not ( = ?auto_979155 ?auto_979166 ) ) ( not ( = ?auto_979156 ?auto_979157 ) ) ( not ( = ?auto_979156 ?auto_979158 ) ) ( not ( = ?auto_979156 ?auto_979159 ) ) ( not ( = ?auto_979156 ?auto_979160 ) ) ( not ( = ?auto_979156 ?auto_979166 ) ) ( not ( = ?auto_979157 ?auto_979158 ) ) ( not ( = ?auto_979157 ?auto_979159 ) ) ( not ( = ?auto_979157 ?auto_979160 ) ) ( not ( = ?auto_979157 ?auto_979166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979158 ?auto_979159 ?auto_979160 )
      ( MAKE-5CRATE-VERIFY ?auto_979155 ?auto_979156 ?auto_979157 ?auto_979158 ?auto_979159 ?auto_979160 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_979206 - SURFACE
      ?auto_979207 - SURFACE
      ?auto_979208 - SURFACE
      ?auto_979209 - SURFACE
      ?auto_979210 - SURFACE
      ?auto_979211 - SURFACE
    )
    :vars
    (
      ?auto_979213 - HOIST
      ?auto_979215 - PLACE
      ?auto_979217 - PLACE
      ?auto_979214 - HOIST
      ?auto_979212 - SURFACE
      ?auto_979216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979213 ?auto_979215 ) ( IS-CRATE ?auto_979211 ) ( not ( = ?auto_979210 ?auto_979211 ) ) ( not ( = ?auto_979209 ?auto_979210 ) ) ( not ( = ?auto_979209 ?auto_979211 ) ) ( not ( = ?auto_979217 ?auto_979215 ) ) ( HOIST-AT ?auto_979214 ?auto_979217 ) ( not ( = ?auto_979213 ?auto_979214 ) ) ( AVAILABLE ?auto_979214 ) ( SURFACE-AT ?auto_979211 ?auto_979217 ) ( ON ?auto_979211 ?auto_979212 ) ( CLEAR ?auto_979211 ) ( not ( = ?auto_979210 ?auto_979212 ) ) ( not ( = ?auto_979211 ?auto_979212 ) ) ( not ( = ?auto_979209 ?auto_979212 ) ) ( TRUCK-AT ?auto_979216 ?auto_979215 ) ( SURFACE-AT ?auto_979209 ?auto_979215 ) ( CLEAR ?auto_979209 ) ( IS-CRATE ?auto_979210 ) ( AVAILABLE ?auto_979213 ) ( IN ?auto_979210 ?auto_979216 ) ( ON ?auto_979207 ?auto_979206 ) ( ON ?auto_979208 ?auto_979207 ) ( ON ?auto_979209 ?auto_979208 ) ( not ( = ?auto_979206 ?auto_979207 ) ) ( not ( = ?auto_979206 ?auto_979208 ) ) ( not ( = ?auto_979206 ?auto_979209 ) ) ( not ( = ?auto_979206 ?auto_979210 ) ) ( not ( = ?auto_979206 ?auto_979211 ) ) ( not ( = ?auto_979206 ?auto_979212 ) ) ( not ( = ?auto_979207 ?auto_979208 ) ) ( not ( = ?auto_979207 ?auto_979209 ) ) ( not ( = ?auto_979207 ?auto_979210 ) ) ( not ( = ?auto_979207 ?auto_979211 ) ) ( not ( = ?auto_979207 ?auto_979212 ) ) ( not ( = ?auto_979208 ?auto_979209 ) ) ( not ( = ?auto_979208 ?auto_979210 ) ) ( not ( = ?auto_979208 ?auto_979211 ) ) ( not ( = ?auto_979208 ?auto_979212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979209 ?auto_979210 ?auto_979211 )
      ( MAKE-5CRATE-VERIFY ?auto_979206 ?auto_979207 ?auto_979208 ?auto_979209 ?auto_979210 ?auto_979211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_980198 - SURFACE
      ?auto_980199 - SURFACE
    )
    :vars
    (
      ?auto_980204 - HOIST
      ?auto_980206 - PLACE
      ?auto_980201 - SURFACE
      ?auto_980205 - PLACE
      ?auto_980203 - HOIST
      ?auto_980200 - SURFACE
      ?auto_980202 - TRUCK
      ?auto_980207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980204 ?auto_980206 ) ( SURFACE-AT ?auto_980198 ?auto_980206 ) ( CLEAR ?auto_980198 ) ( IS-CRATE ?auto_980199 ) ( not ( = ?auto_980198 ?auto_980199 ) ) ( ON ?auto_980198 ?auto_980201 ) ( not ( = ?auto_980201 ?auto_980198 ) ) ( not ( = ?auto_980201 ?auto_980199 ) ) ( not ( = ?auto_980205 ?auto_980206 ) ) ( HOIST-AT ?auto_980203 ?auto_980205 ) ( not ( = ?auto_980204 ?auto_980203 ) ) ( AVAILABLE ?auto_980203 ) ( SURFACE-AT ?auto_980199 ?auto_980205 ) ( ON ?auto_980199 ?auto_980200 ) ( CLEAR ?auto_980199 ) ( not ( = ?auto_980198 ?auto_980200 ) ) ( not ( = ?auto_980199 ?auto_980200 ) ) ( not ( = ?auto_980201 ?auto_980200 ) ) ( TRUCK-AT ?auto_980202 ?auto_980206 ) ( LIFTING ?auto_980204 ?auto_980207 ) ( IS-CRATE ?auto_980207 ) ( not ( = ?auto_980198 ?auto_980207 ) ) ( not ( = ?auto_980199 ?auto_980207 ) ) ( not ( = ?auto_980201 ?auto_980207 ) ) ( not ( = ?auto_980200 ?auto_980207 ) ) )
    :subtasks
    ( ( !LOAD ?auto_980204 ?auto_980207 ?auto_980202 ?auto_980206 )
      ( MAKE-1CRATE ?auto_980198 ?auto_980199 )
      ( MAKE-1CRATE-VERIFY ?auto_980198 ?auto_980199 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980413 - SURFACE
      ?auto_980414 - SURFACE
      ?auto_980415 - SURFACE
      ?auto_980416 - SURFACE
      ?auto_980417 - SURFACE
      ?auto_980418 - SURFACE
      ?auto_980419 - SURFACE
    )
    :vars
    (
      ?auto_980420 - HOIST
      ?auto_980421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980420 ?auto_980421 ) ( SURFACE-AT ?auto_980418 ?auto_980421 ) ( CLEAR ?auto_980418 ) ( LIFTING ?auto_980420 ?auto_980419 ) ( IS-CRATE ?auto_980419 ) ( not ( = ?auto_980418 ?auto_980419 ) ) ( ON ?auto_980414 ?auto_980413 ) ( ON ?auto_980415 ?auto_980414 ) ( ON ?auto_980416 ?auto_980415 ) ( ON ?auto_980417 ?auto_980416 ) ( ON ?auto_980418 ?auto_980417 ) ( not ( = ?auto_980413 ?auto_980414 ) ) ( not ( = ?auto_980413 ?auto_980415 ) ) ( not ( = ?auto_980413 ?auto_980416 ) ) ( not ( = ?auto_980413 ?auto_980417 ) ) ( not ( = ?auto_980413 ?auto_980418 ) ) ( not ( = ?auto_980413 ?auto_980419 ) ) ( not ( = ?auto_980414 ?auto_980415 ) ) ( not ( = ?auto_980414 ?auto_980416 ) ) ( not ( = ?auto_980414 ?auto_980417 ) ) ( not ( = ?auto_980414 ?auto_980418 ) ) ( not ( = ?auto_980414 ?auto_980419 ) ) ( not ( = ?auto_980415 ?auto_980416 ) ) ( not ( = ?auto_980415 ?auto_980417 ) ) ( not ( = ?auto_980415 ?auto_980418 ) ) ( not ( = ?auto_980415 ?auto_980419 ) ) ( not ( = ?auto_980416 ?auto_980417 ) ) ( not ( = ?auto_980416 ?auto_980418 ) ) ( not ( = ?auto_980416 ?auto_980419 ) ) ( not ( = ?auto_980417 ?auto_980418 ) ) ( not ( = ?auto_980417 ?auto_980419 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_980418 ?auto_980419 )
      ( MAKE-6CRATE-VERIFY ?auto_980413 ?auto_980414 ?auto_980415 ?auto_980416 ?auto_980417 ?auto_980418 ?auto_980419 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980457 - SURFACE
      ?auto_980458 - SURFACE
      ?auto_980459 - SURFACE
      ?auto_980460 - SURFACE
      ?auto_980461 - SURFACE
      ?auto_980462 - SURFACE
      ?auto_980463 - SURFACE
    )
    :vars
    (
      ?auto_980465 - HOIST
      ?auto_980466 - PLACE
      ?auto_980464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980465 ?auto_980466 ) ( SURFACE-AT ?auto_980462 ?auto_980466 ) ( CLEAR ?auto_980462 ) ( IS-CRATE ?auto_980463 ) ( not ( = ?auto_980462 ?auto_980463 ) ) ( TRUCK-AT ?auto_980464 ?auto_980466 ) ( AVAILABLE ?auto_980465 ) ( IN ?auto_980463 ?auto_980464 ) ( ON ?auto_980462 ?auto_980461 ) ( not ( = ?auto_980461 ?auto_980462 ) ) ( not ( = ?auto_980461 ?auto_980463 ) ) ( ON ?auto_980458 ?auto_980457 ) ( ON ?auto_980459 ?auto_980458 ) ( ON ?auto_980460 ?auto_980459 ) ( ON ?auto_980461 ?auto_980460 ) ( not ( = ?auto_980457 ?auto_980458 ) ) ( not ( = ?auto_980457 ?auto_980459 ) ) ( not ( = ?auto_980457 ?auto_980460 ) ) ( not ( = ?auto_980457 ?auto_980461 ) ) ( not ( = ?auto_980457 ?auto_980462 ) ) ( not ( = ?auto_980457 ?auto_980463 ) ) ( not ( = ?auto_980458 ?auto_980459 ) ) ( not ( = ?auto_980458 ?auto_980460 ) ) ( not ( = ?auto_980458 ?auto_980461 ) ) ( not ( = ?auto_980458 ?auto_980462 ) ) ( not ( = ?auto_980458 ?auto_980463 ) ) ( not ( = ?auto_980459 ?auto_980460 ) ) ( not ( = ?auto_980459 ?auto_980461 ) ) ( not ( = ?auto_980459 ?auto_980462 ) ) ( not ( = ?auto_980459 ?auto_980463 ) ) ( not ( = ?auto_980460 ?auto_980461 ) ) ( not ( = ?auto_980460 ?auto_980462 ) ) ( not ( = ?auto_980460 ?auto_980463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980461 ?auto_980462 ?auto_980463 )
      ( MAKE-6CRATE-VERIFY ?auto_980457 ?auto_980458 ?auto_980459 ?auto_980460 ?auto_980461 ?auto_980462 ?auto_980463 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980508 - SURFACE
      ?auto_980509 - SURFACE
      ?auto_980510 - SURFACE
      ?auto_980511 - SURFACE
      ?auto_980512 - SURFACE
      ?auto_980513 - SURFACE
      ?auto_980514 - SURFACE
    )
    :vars
    (
      ?auto_980518 - HOIST
      ?auto_980517 - PLACE
      ?auto_980516 - TRUCK
      ?auto_980515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980518 ?auto_980517 ) ( SURFACE-AT ?auto_980513 ?auto_980517 ) ( CLEAR ?auto_980513 ) ( IS-CRATE ?auto_980514 ) ( not ( = ?auto_980513 ?auto_980514 ) ) ( AVAILABLE ?auto_980518 ) ( IN ?auto_980514 ?auto_980516 ) ( ON ?auto_980513 ?auto_980512 ) ( not ( = ?auto_980512 ?auto_980513 ) ) ( not ( = ?auto_980512 ?auto_980514 ) ) ( TRUCK-AT ?auto_980516 ?auto_980515 ) ( not ( = ?auto_980515 ?auto_980517 ) ) ( ON ?auto_980509 ?auto_980508 ) ( ON ?auto_980510 ?auto_980509 ) ( ON ?auto_980511 ?auto_980510 ) ( ON ?auto_980512 ?auto_980511 ) ( not ( = ?auto_980508 ?auto_980509 ) ) ( not ( = ?auto_980508 ?auto_980510 ) ) ( not ( = ?auto_980508 ?auto_980511 ) ) ( not ( = ?auto_980508 ?auto_980512 ) ) ( not ( = ?auto_980508 ?auto_980513 ) ) ( not ( = ?auto_980508 ?auto_980514 ) ) ( not ( = ?auto_980509 ?auto_980510 ) ) ( not ( = ?auto_980509 ?auto_980511 ) ) ( not ( = ?auto_980509 ?auto_980512 ) ) ( not ( = ?auto_980509 ?auto_980513 ) ) ( not ( = ?auto_980509 ?auto_980514 ) ) ( not ( = ?auto_980510 ?auto_980511 ) ) ( not ( = ?auto_980510 ?auto_980512 ) ) ( not ( = ?auto_980510 ?auto_980513 ) ) ( not ( = ?auto_980510 ?auto_980514 ) ) ( not ( = ?auto_980511 ?auto_980512 ) ) ( not ( = ?auto_980511 ?auto_980513 ) ) ( not ( = ?auto_980511 ?auto_980514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980512 ?auto_980513 ?auto_980514 )
      ( MAKE-6CRATE-VERIFY ?auto_980508 ?auto_980509 ?auto_980510 ?auto_980511 ?auto_980512 ?auto_980513 ?auto_980514 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980565 - SURFACE
      ?auto_980566 - SURFACE
      ?auto_980567 - SURFACE
      ?auto_980568 - SURFACE
      ?auto_980569 - SURFACE
      ?auto_980570 - SURFACE
      ?auto_980571 - SURFACE
    )
    :vars
    (
      ?auto_980572 - HOIST
      ?auto_980576 - PLACE
      ?auto_980575 - TRUCK
      ?auto_980574 - PLACE
      ?auto_980573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_980572 ?auto_980576 ) ( SURFACE-AT ?auto_980570 ?auto_980576 ) ( CLEAR ?auto_980570 ) ( IS-CRATE ?auto_980571 ) ( not ( = ?auto_980570 ?auto_980571 ) ) ( AVAILABLE ?auto_980572 ) ( ON ?auto_980570 ?auto_980569 ) ( not ( = ?auto_980569 ?auto_980570 ) ) ( not ( = ?auto_980569 ?auto_980571 ) ) ( TRUCK-AT ?auto_980575 ?auto_980574 ) ( not ( = ?auto_980574 ?auto_980576 ) ) ( HOIST-AT ?auto_980573 ?auto_980574 ) ( LIFTING ?auto_980573 ?auto_980571 ) ( not ( = ?auto_980572 ?auto_980573 ) ) ( ON ?auto_980566 ?auto_980565 ) ( ON ?auto_980567 ?auto_980566 ) ( ON ?auto_980568 ?auto_980567 ) ( ON ?auto_980569 ?auto_980568 ) ( not ( = ?auto_980565 ?auto_980566 ) ) ( not ( = ?auto_980565 ?auto_980567 ) ) ( not ( = ?auto_980565 ?auto_980568 ) ) ( not ( = ?auto_980565 ?auto_980569 ) ) ( not ( = ?auto_980565 ?auto_980570 ) ) ( not ( = ?auto_980565 ?auto_980571 ) ) ( not ( = ?auto_980566 ?auto_980567 ) ) ( not ( = ?auto_980566 ?auto_980568 ) ) ( not ( = ?auto_980566 ?auto_980569 ) ) ( not ( = ?auto_980566 ?auto_980570 ) ) ( not ( = ?auto_980566 ?auto_980571 ) ) ( not ( = ?auto_980567 ?auto_980568 ) ) ( not ( = ?auto_980567 ?auto_980569 ) ) ( not ( = ?auto_980567 ?auto_980570 ) ) ( not ( = ?auto_980567 ?auto_980571 ) ) ( not ( = ?auto_980568 ?auto_980569 ) ) ( not ( = ?auto_980568 ?auto_980570 ) ) ( not ( = ?auto_980568 ?auto_980571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980569 ?auto_980570 ?auto_980571 )
      ( MAKE-6CRATE-VERIFY ?auto_980565 ?auto_980566 ?auto_980567 ?auto_980568 ?auto_980569 ?auto_980570 ?auto_980571 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980628 - SURFACE
      ?auto_980629 - SURFACE
      ?auto_980630 - SURFACE
      ?auto_980631 - SURFACE
      ?auto_980632 - SURFACE
      ?auto_980633 - SURFACE
      ?auto_980634 - SURFACE
    )
    :vars
    (
      ?auto_980635 - HOIST
      ?auto_980638 - PLACE
      ?auto_980637 - TRUCK
      ?auto_980636 - PLACE
      ?auto_980639 - HOIST
      ?auto_980640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980635 ?auto_980638 ) ( SURFACE-AT ?auto_980633 ?auto_980638 ) ( CLEAR ?auto_980633 ) ( IS-CRATE ?auto_980634 ) ( not ( = ?auto_980633 ?auto_980634 ) ) ( AVAILABLE ?auto_980635 ) ( ON ?auto_980633 ?auto_980632 ) ( not ( = ?auto_980632 ?auto_980633 ) ) ( not ( = ?auto_980632 ?auto_980634 ) ) ( TRUCK-AT ?auto_980637 ?auto_980636 ) ( not ( = ?auto_980636 ?auto_980638 ) ) ( HOIST-AT ?auto_980639 ?auto_980636 ) ( not ( = ?auto_980635 ?auto_980639 ) ) ( AVAILABLE ?auto_980639 ) ( SURFACE-AT ?auto_980634 ?auto_980636 ) ( ON ?auto_980634 ?auto_980640 ) ( CLEAR ?auto_980634 ) ( not ( = ?auto_980633 ?auto_980640 ) ) ( not ( = ?auto_980634 ?auto_980640 ) ) ( not ( = ?auto_980632 ?auto_980640 ) ) ( ON ?auto_980629 ?auto_980628 ) ( ON ?auto_980630 ?auto_980629 ) ( ON ?auto_980631 ?auto_980630 ) ( ON ?auto_980632 ?auto_980631 ) ( not ( = ?auto_980628 ?auto_980629 ) ) ( not ( = ?auto_980628 ?auto_980630 ) ) ( not ( = ?auto_980628 ?auto_980631 ) ) ( not ( = ?auto_980628 ?auto_980632 ) ) ( not ( = ?auto_980628 ?auto_980633 ) ) ( not ( = ?auto_980628 ?auto_980634 ) ) ( not ( = ?auto_980628 ?auto_980640 ) ) ( not ( = ?auto_980629 ?auto_980630 ) ) ( not ( = ?auto_980629 ?auto_980631 ) ) ( not ( = ?auto_980629 ?auto_980632 ) ) ( not ( = ?auto_980629 ?auto_980633 ) ) ( not ( = ?auto_980629 ?auto_980634 ) ) ( not ( = ?auto_980629 ?auto_980640 ) ) ( not ( = ?auto_980630 ?auto_980631 ) ) ( not ( = ?auto_980630 ?auto_980632 ) ) ( not ( = ?auto_980630 ?auto_980633 ) ) ( not ( = ?auto_980630 ?auto_980634 ) ) ( not ( = ?auto_980630 ?auto_980640 ) ) ( not ( = ?auto_980631 ?auto_980632 ) ) ( not ( = ?auto_980631 ?auto_980633 ) ) ( not ( = ?auto_980631 ?auto_980634 ) ) ( not ( = ?auto_980631 ?auto_980640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980632 ?auto_980633 ?auto_980634 )
      ( MAKE-6CRATE-VERIFY ?auto_980628 ?auto_980629 ?auto_980630 ?auto_980631 ?auto_980632 ?auto_980633 ?auto_980634 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980692 - SURFACE
      ?auto_980693 - SURFACE
      ?auto_980694 - SURFACE
      ?auto_980695 - SURFACE
      ?auto_980696 - SURFACE
      ?auto_980697 - SURFACE
      ?auto_980698 - SURFACE
    )
    :vars
    (
      ?auto_980701 - HOIST
      ?auto_980703 - PLACE
      ?auto_980704 - PLACE
      ?auto_980700 - HOIST
      ?auto_980702 - SURFACE
      ?auto_980699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980701 ?auto_980703 ) ( SURFACE-AT ?auto_980697 ?auto_980703 ) ( CLEAR ?auto_980697 ) ( IS-CRATE ?auto_980698 ) ( not ( = ?auto_980697 ?auto_980698 ) ) ( AVAILABLE ?auto_980701 ) ( ON ?auto_980697 ?auto_980696 ) ( not ( = ?auto_980696 ?auto_980697 ) ) ( not ( = ?auto_980696 ?auto_980698 ) ) ( not ( = ?auto_980704 ?auto_980703 ) ) ( HOIST-AT ?auto_980700 ?auto_980704 ) ( not ( = ?auto_980701 ?auto_980700 ) ) ( AVAILABLE ?auto_980700 ) ( SURFACE-AT ?auto_980698 ?auto_980704 ) ( ON ?auto_980698 ?auto_980702 ) ( CLEAR ?auto_980698 ) ( not ( = ?auto_980697 ?auto_980702 ) ) ( not ( = ?auto_980698 ?auto_980702 ) ) ( not ( = ?auto_980696 ?auto_980702 ) ) ( TRUCK-AT ?auto_980699 ?auto_980703 ) ( ON ?auto_980693 ?auto_980692 ) ( ON ?auto_980694 ?auto_980693 ) ( ON ?auto_980695 ?auto_980694 ) ( ON ?auto_980696 ?auto_980695 ) ( not ( = ?auto_980692 ?auto_980693 ) ) ( not ( = ?auto_980692 ?auto_980694 ) ) ( not ( = ?auto_980692 ?auto_980695 ) ) ( not ( = ?auto_980692 ?auto_980696 ) ) ( not ( = ?auto_980692 ?auto_980697 ) ) ( not ( = ?auto_980692 ?auto_980698 ) ) ( not ( = ?auto_980692 ?auto_980702 ) ) ( not ( = ?auto_980693 ?auto_980694 ) ) ( not ( = ?auto_980693 ?auto_980695 ) ) ( not ( = ?auto_980693 ?auto_980696 ) ) ( not ( = ?auto_980693 ?auto_980697 ) ) ( not ( = ?auto_980693 ?auto_980698 ) ) ( not ( = ?auto_980693 ?auto_980702 ) ) ( not ( = ?auto_980694 ?auto_980695 ) ) ( not ( = ?auto_980694 ?auto_980696 ) ) ( not ( = ?auto_980694 ?auto_980697 ) ) ( not ( = ?auto_980694 ?auto_980698 ) ) ( not ( = ?auto_980694 ?auto_980702 ) ) ( not ( = ?auto_980695 ?auto_980696 ) ) ( not ( = ?auto_980695 ?auto_980697 ) ) ( not ( = ?auto_980695 ?auto_980698 ) ) ( not ( = ?auto_980695 ?auto_980702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980696 ?auto_980697 ?auto_980698 )
      ( MAKE-6CRATE-VERIFY ?auto_980692 ?auto_980693 ?auto_980694 ?auto_980695 ?auto_980696 ?auto_980697 ?auto_980698 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980756 - SURFACE
      ?auto_980757 - SURFACE
      ?auto_980758 - SURFACE
      ?auto_980759 - SURFACE
      ?auto_980760 - SURFACE
      ?auto_980761 - SURFACE
      ?auto_980762 - SURFACE
    )
    :vars
    (
      ?auto_980765 - HOIST
      ?auto_980764 - PLACE
      ?auto_980763 - PLACE
      ?auto_980766 - HOIST
      ?auto_980767 - SURFACE
      ?auto_980768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980765 ?auto_980764 ) ( IS-CRATE ?auto_980762 ) ( not ( = ?auto_980761 ?auto_980762 ) ) ( not ( = ?auto_980760 ?auto_980761 ) ) ( not ( = ?auto_980760 ?auto_980762 ) ) ( not ( = ?auto_980763 ?auto_980764 ) ) ( HOIST-AT ?auto_980766 ?auto_980763 ) ( not ( = ?auto_980765 ?auto_980766 ) ) ( AVAILABLE ?auto_980766 ) ( SURFACE-AT ?auto_980762 ?auto_980763 ) ( ON ?auto_980762 ?auto_980767 ) ( CLEAR ?auto_980762 ) ( not ( = ?auto_980761 ?auto_980767 ) ) ( not ( = ?auto_980762 ?auto_980767 ) ) ( not ( = ?auto_980760 ?auto_980767 ) ) ( TRUCK-AT ?auto_980768 ?auto_980764 ) ( SURFACE-AT ?auto_980760 ?auto_980764 ) ( CLEAR ?auto_980760 ) ( LIFTING ?auto_980765 ?auto_980761 ) ( IS-CRATE ?auto_980761 ) ( ON ?auto_980757 ?auto_980756 ) ( ON ?auto_980758 ?auto_980757 ) ( ON ?auto_980759 ?auto_980758 ) ( ON ?auto_980760 ?auto_980759 ) ( not ( = ?auto_980756 ?auto_980757 ) ) ( not ( = ?auto_980756 ?auto_980758 ) ) ( not ( = ?auto_980756 ?auto_980759 ) ) ( not ( = ?auto_980756 ?auto_980760 ) ) ( not ( = ?auto_980756 ?auto_980761 ) ) ( not ( = ?auto_980756 ?auto_980762 ) ) ( not ( = ?auto_980756 ?auto_980767 ) ) ( not ( = ?auto_980757 ?auto_980758 ) ) ( not ( = ?auto_980757 ?auto_980759 ) ) ( not ( = ?auto_980757 ?auto_980760 ) ) ( not ( = ?auto_980757 ?auto_980761 ) ) ( not ( = ?auto_980757 ?auto_980762 ) ) ( not ( = ?auto_980757 ?auto_980767 ) ) ( not ( = ?auto_980758 ?auto_980759 ) ) ( not ( = ?auto_980758 ?auto_980760 ) ) ( not ( = ?auto_980758 ?auto_980761 ) ) ( not ( = ?auto_980758 ?auto_980762 ) ) ( not ( = ?auto_980758 ?auto_980767 ) ) ( not ( = ?auto_980759 ?auto_980760 ) ) ( not ( = ?auto_980759 ?auto_980761 ) ) ( not ( = ?auto_980759 ?auto_980762 ) ) ( not ( = ?auto_980759 ?auto_980767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980760 ?auto_980761 ?auto_980762 )
      ( MAKE-6CRATE-VERIFY ?auto_980756 ?auto_980757 ?auto_980758 ?auto_980759 ?auto_980760 ?auto_980761 ?auto_980762 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980820 - SURFACE
      ?auto_980821 - SURFACE
      ?auto_980822 - SURFACE
      ?auto_980823 - SURFACE
      ?auto_980824 - SURFACE
      ?auto_980825 - SURFACE
      ?auto_980826 - SURFACE
    )
    :vars
    (
      ?auto_980828 - HOIST
      ?auto_980827 - PLACE
      ?auto_980832 - PLACE
      ?auto_980830 - HOIST
      ?auto_980831 - SURFACE
      ?auto_980829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980828 ?auto_980827 ) ( IS-CRATE ?auto_980826 ) ( not ( = ?auto_980825 ?auto_980826 ) ) ( not ( = ?auto_980824 ?auto_980825 ) ) ( not ( = ?auto_980824 ?auto_980826 ) ) ( not ( = ?auto_980832 ?auto_980827 ) ) ( HOIST-AT ?auto_980830 ?auto_980832 ) ( not ( = ?auto_980828 ?auto_980830 ) ) ( AVAILABLE ?auto_980830 ) ( SURFACE-AT ?auto_980826 ?auto_980832 ) ( ON ?auto_980826 ?auto_980831 ) ( CLEAR ?auto_980826 ) ( not ( = ?auto_980825 ?auto_980831 ) ) ( not ( = ?auto_980826 ?auto_980831 ) ) ( not ( = ?auto_980824 ?auto_980831 ) ) ( TRUCK-AT ?auto_980829 ?auto_980827 ) ( SURFACE-AT ?auto_980824 ?auto_980827 ) ( CLEAR ?auto_980824 ) ( IS-CRATE ?auto_980825 ) ( AVAILABLE ?auto_980828 ) ( IN ?auto_980825 ?auto_980829 ) ( ON ?auto_980821 ?auto_980820 ) ( ON ?auto_980822 ?auto_980821 ) ( ON ?auto_980823 ?auto_980822 ) ( ON ?auto_980824 ?auto_980823 ) ( not ( = ?auto_980820 ?auto_980821 ) ) ( not ( = ?auto_980820 ?auto_980822 ) ) ( not ( = ?auto_980820 ?auto_980823 ) ) ( not ( = ?auto_980820 ?auto_980824 ) ) ( not ( = ?auto_980820 ?auto_980825 ) ) ( not ( = ?auto_980820 ?auto_980826 ) ) ( not ( = ?auto_980820 ?auto_980831 ) ) ( not ( = ?auto_980821 ?auto_980822 ) ) ( not ( = ?auto_980821 ?auto_980823 ) ) ( not ( = ?auto_980821 ?auto_980824 ) ) ( not ( = ?auto_980821 ?auto_980825 ) ) ( not ( = ?auto_980821 ?auto_980826 ) ) ( not ( = ?auto_980821 ?auto_980831 ) ) ( not ( = ?auto_980822 ?auto_980823 ) ) ( not ( = ?auto_980822 ?auto_980824 ) ) ( not ( = ?auto_980822 ?auto_980825 ) ) ( not ( = ?auto_980822 ?auto_980826 ) ) ( not ( = ?auto_980822 ?auto_980831 ) ) ( not ( = ?auto_980823 ?auto_980824 ) ) ( not ( = ?auto_980823 ?auto_980825 ) ) ( not ( = ?auto_980823 ?auto_980826 ) ) ( not ( = ?auto_980823 ?auto_980831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980824 ?auto_980825 ?auto_980826 )
      ( MAKE-6CRATE-VERIFY ?auto_980820 ?auto_980821 ?auto_980822 ?auto_980823 ?auto_980824 ?auto_980825 ?auto_980826 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982757 - SURFACE
      ?auto_982758 - SURFACE
      ?auto_982759 - SURFACE
      ?auto_982760 - SURFACE
      ?auto_982761 - SURFACE
      ?auto_982762 - SURFACE
      ?auto_982763 - SURFACE
      ?auto_982764 - SURFACE
    )
    :vars
    (
      ?auto_982766 - HOIST
      ?auto_982765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982766 ?auto_982765 ) ( SURFACE-AT ?auto_982763 ?auto_982765 ) ( CLEAR ?auto_982763 ) ( LIFTING ?auto_982766 ?auto_982764 ) ( IS-CRATE ?auto_982764 ) ( not ( = ?auto_982763 ?auto_982764 ) ) ( ON ?auto_982758 ?auto_982757 ) ( ON ?auto_982759 ?auto_982758 ) ( ON ?auto_982760 ?auto_982759 ) ( ON ?auto_982761 ?auto_982760 ) ( ON ?auto_982762 ?auto_982761 ) ( ON ?auto_982763 ?auto_982762 ) ( not ( = ?auto_982757 ?auto_982758 ) ) ( not ( = ?auto_982757 ?auto_982759 ) ) ( not ( = ?auto_982757 ?auto_982760 ) ) ( not ( = ?auto_982757 ?auto_982761 ) ) ( not ( = ?auto_982757 ?auto_982762 ) ) ( not ( = ?auto_982757 ?auto_982763 ) ) ( not ( = ?auto_982757 ?auto_982764 ) ) ( not ( = ?auto_982758 ?auto_982759 ) ) ( not ( = ?auto_982758 ?auto_982760 ) ) ( not ( = ?auto_982758 ?auto_982761 ) ) ( not ( = ?auto_982758 ?auto_982762 ) ) ( not ( = ?auto_982758 ?auto_982763 ) ) ( not ( = ?auto_982758 ?auto_982764 ) ) ( not ( = ?auto_982759 ?auto_982760 ) ) ( not ( = ?auto_982759 ?auto_982761 ) ) ( not ( = ?auto_982759 ?auto_982762 ) ) ( not ( = ?auto_982759 ?auto_982763 ) ) ( not ( = ?auto_982759 ?auto_982764 ) ) ( not ( = ?auto_982760 ?auto_982761 ) ) ( not ( = ?auto_982760 ?auto_982762 ) ) ( not ( = ?auto_982760 ?auto_982763 ) ) ( not ( = ?auto_982760 ?auto_982764 ) ) ( not ( = ?auto_982761 ?auto_982762 ) ) ( not ( = ?auto_982761 ?auto_982763 ) ) ( not ( = ?auto_982761 ?auto_982764 ) ) ( not ( = ?auto_982762 ?auto_982763 ) ) ( not ( = ?auto_982762 ?auto_982764 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_982763 ?auto_982764 )
      ( MAKE-7CRATE-VERIFY ?auto_982757 ?auto_982758 ?auto_982759 ?auto_982760 ?auto_982761 ?auto_982762 ?auto_982763 ?auto_982764 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982812 - SURFACE
      ?auto_982813 - SURFACE
      ?auto_982814 - SURFACE
      ?auto_982815 - SURFACE
      ?auto_982816 - SURFACE
      ?auto_982817 - SURFACE
      ?auto_982818 - SURFACE
      ?auto_982819 - SURFACE
    )
    :vars
    (
      ?auto_982820 - HOIST
      ?auto_982821 - PLACE
      ?auto_982822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_982820 ?auto_982821 ) ( SURFACE-AT ?auto_982818 ?auto_982821 ) ( CLEAR ?auto_982818 ) ( IS-CRATE ?auto_982819 ) ( not ( = ?auto_982818 ?auto_982819 ) ) ( TRUCK-AT ?auto_982822 ?auto_982821 ) ( AVAILABLE ?auto_982820 ) ( IN ?auto_982819 ?auto_982822 ) ( ON ?auto_982818 ?auto_982817 ) ( not ( = ?auto_982817 ?auto_982818 ) ) ( not ( = ?auto_982817 ?auto_982819 ) ) ( ON ?auto_982813 ?auto_982812 ) ( ON ?auto_982814 ?auto_982813 ) ( ON ?auto_982815 ?auto_982814 ) ( ON ?auto_982816 ?auto_982815 ) ( ON ?auto_982817 ?auto_982816 ) ( not ( = ?auto_982812 ?auto_982813 ) ) ( not ( = ?auto_982812 ?auto_982814 ) ) ( not ( = ?auto_982812 ?auto_982815 ) ) ( not ( = ?auto_982812 ?auto_982816 ) ) ( not ( = ?auto_982812 ?auto_982817 ) ) ( not ( = ?auto_982812 ?auto_982818 ) ) ( not ( = ?auto_982812 ?auto_982819 ) ) ( not ( = ?auto_982813 ?auto_982814 ) ) ( not ( = ?auto_982813 ?auto_982815 ) ) ( not ( = ?auto_982813 ?auto_982816 ) ) ( not ( = ?auto_982813 ?auto_982817 ) ) ( not ( = ?auto_982813 ?auto_982818 ) ) ( not ( = ?auto_982813 ?auto_982819 ) ) ( not ( = ?auto_982814 ?auto_982815 ) ) ( not ( = ?auto_982814 ?auto_982816 ) ) ( not ( = ?auto_982814 ?auto_982817 ) ) ( not ( = ?auto_982814 ?auto_982818 ) ) ( not ( = ?auto_982814 ?auto_982819 ) ) ( not ( = ?auto_982815 ?auto_982816 ) ) ( not ( = ?auto_982815 ?auto_982817 ) ) ( not ( = ?auto_982815 ?auto_982818 ) ) ( not ( = ?auto_982815 ?auto_982819 ) ) ( not ( = ?auto_982816 ?auto_982817 ) ) ( not ( = ?auto_982816 ?auto_982818 ) ) ( not ( = ?auto_982816 ?auto_982819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982817 ?auto_982818 ?auto_982819 )
      ( MAKE-7CRATE-VERIFY ?auto_982812 ?auto_982813 ?auto_982814 ?auto_982815 ?auto_982816 ?auto_982817 ?auto_982818 ?auto_982819 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982875 - SURFACE
      ?auto_982876 - SURFACE
      ?auto_982877 - SURFACE
      ?auto_982878 - SURFACE
      ?auto_982879 - SURFACE
      ?auto_982880 - SURFACE
      ?auto_982881 - SURFACE
      ?auto_982882 - SURFACE
    )
    :vars
    (
      ?auto_982885 - HOIST
      ?auto_982886 - PLACE
      ?auto_982884 - TRUCK
      ?auto_982883 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982885 ?auto_982886 ) ( SURFACE-AT ?auto_982881 ?auto_982886 ) ( CLEAR ?auto_982881 ) ( IS-CRATE ?auto_982882 ) ( not ( = ?auto_982881 ?auto_982882 ) ) ( AVAILABLE ?auto_982885 ) ( IN ?auto_982882 ?auto_982884 ) ( ON ?auto_982881 ?auto_982880 ) ( not ( = ?auto_982880 ?auto_982881 ) ) ( not ( = ?auto_982880 ?auto_982882 ) ) ( TRUCK-AT ?auto_982884 ?auto_982883 ) ( not ( = ?auto_982883 ?auto_982886 ) ) ( ON ?auto_982876 ?auto_982875 ) ( ON ?auto_982877 ?auto_982876 ) ( ON ?auto_982878 ?auto_982877 ) ( ON ?auto_982879 ?auto_982878 ) ( ON ?auto_982880 ?auto_982879 ) ( not ( = ?auto_982875 ?auto_982876 ) ) ( not ( = ?auto_982875 ?auto_982877 ) ) ( not ( = ?auto_982875 ?auto_982878 ) ) ( not ( = ?auto_982875 ?auto_982879 ) ) ( not ( = ?auto_982875 ?auto_982880 ) ) ( not ( = ?auto_982875 ?auto_982881 ) ) ( not ( = ?auto_982875 ?auto_982882 ) ) ( not ( = ?auto_982876 ?auto_982877 ) ) ( not ( = ?auto_982876 ?auto_982878 ) ) ( not ( = ?auto_982876 ?auto_982879 ) ) ( not ( = ?auto_982876 ?auto_982880 ) ) ( not ( = ?auto_982876 ?auto_982881 ) ) ( not ( = ?auto_982876 ?auto_982882 ) ) ( not ( = ?auto_982877 ?auto_982878 ) ) ( not ( = ?auto_982877 ?auto_982879 ) ) ( not ( = ?auto_982877 ?auto_982880 ) ) ( not ( = ?auto_982877 ?auto_982881 ) ) ( not ( = ?auto_982877 ?auto_982882 ) ) ( not ( = ?auto_982878 ?auto_982879 ) ) ( not ( = ?auto_982878 ?auto_982880 ) ) ( not ( = ?auto_982878 ?auto_982881 ) ) ( not ( = ?auto_982878 ?auto_982882 ) ) ( not ( = ?auto_982879 ?auto_982880 ) ) ( not ( = ?auto_982879 ?auto_982881 ) ) ( not ( = ?auto_982879 ?auto_982882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982880 ?auto_982881 ?auto_982882 )
      ( MAKE-7CRATE-VERIFY ?auto_982875 ?auto_982876 ?auto_982877 ?auto_982878 ?auto_982879 ?auto_982880 ?auto_982881 ?auto_982882 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982945 - SURFACE
      ?auto_982946 - SURFACE
      ?auto_982947 - SURFACE
      ?auto_982948 - SURFACE
      ?auto_982949 - SURFACE
      ?auto_982950 - SURFACE
      ?auto_982951 - SURFACE
      ?auto_982952 - SURFACE
    )
    :vars
    (
      ?auto_982954 - HOIST
      ?auto_982953 - PLACE
      ?auto_982957 - TRUCK
      ?auto_982955 - PLACE
      ?auto_982956 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_982954 ?auto_982953 ) ( SURFACE-AT ?auto_982951 ?auto_982953 ) ( CLEAR ?auto_982951 ) ( IS-CRATE ?auto_982952 ) ( not ( = ?auto_982951 ?auto_982952 ) ) ( AVAILABLE ?auto_982954 ) ( ON ?auto_982951 ?auto_982950 ) ( not ( = ?auto_982950 ?auto_982951 ) ) ( not ( = ?auto_982950 ?auto_982952 ) ) ( TRUCK-AT ?auto_982957 ?auto_982955 ) ( not ( = ?auto_982955 ?auto_982953 ) ) ( HOIST-AT ?auto_982956 ?auto_982955 ) ( LIFTING ?auto_982956 ?auto_982952 ) ( not ( = ?auto_982954 ?auto_982956 ) ) ( ON ?auto_982946 ?auto_982945 ) ( ON ?auto_982947 ?auto_982946 ) ( ON ?auto_982948 ?auto_982947 ) ( ON ?auto_982949 ?auto_982948 ) ( ON ?auto_982950 ?auto_982949 ) ( not ( = ?auto_982945 ?auto_982946 ) ) ( not ( = ?auto_982945 ?auto_982947 ) ) ( not ( = ?auto_982945 ?auto_982948 ) ) ( not ( = ?auto_982945 ?auto_982949 ) ) ( not ( = ?auto_982945 ?auto_982950 ) ) ( not ( = ?auto_982945 ?auto_982951 ) ) ( not ( = ?auto_982945 ?auto_982952 ) ) ( not ( = ?auto_982946 ?auto_982947 ) ) ( not ( = ?auto_982946 ?auto_982948 ) ) ( not ( = ?auto_982946 ?auto_982949 ) ) ( not ( = ?auto_982946 ?auto_982950 ) ) ( not ( = ?auto_982946 ?auto_982951 ) ) ( not ( = ?auto_982946 ?auto_982952 ) ) ( not ( = ?auto_982947 ?auto_982948 ) ) ( not ( = ?auto_982947 ?auto_982949 ) ) ( not ( = ?auto_982947 ?auto_982950 ) ) ( not ( = ?auto_982947 ?auto_982951 ) ) ( not ( = ?auto_982947 ?auto_982952 ) ) ( not ( = ?auto_982948 ?auto_982949 ) ) ( not ( = ?auto_982948 ?auto_982950 ) ) ( not ( = ?auto_982948 ?auto_982951 ) ) ( not ( = ?auto_982948 ?auto_982952 ) ) ( not ( = ?auto_982949 ?auto_982950 ) ) ( not ( = ?auto_982949 ?auto_982951 ) ) ( not ( = ?auto_982949 ?auto_982952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982950 ?auto_982951 ?auto_982952 )
      ( MAKE-7CRATE-VERIFY ?auto_982945 ?auto_982946 ?auto_982947 ?auto_982948 ?auto_982949 ?auto_982950 ?auto_982951 ?auto_982952 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983022 - SURFACE
      ?auto_983023 - SURFACE
      ?auto_983024 - SURFACE
      ?auto_983025 - SURFACE
      ?auto_983026 - SURFACE
      ?auto_983027 - SURFACE
      ?auto_983028 - SURFACE
      ?auto_983029 - SURFACE
    )
    :vars
    (
      ?auto_983035 - HOIST
      ?auto_983030 - PLACE
      ?auto_983032 - TRUCK
      ?auto_983034 - PLACE
      ?auto_983033 - HOIST
      ?auto_983031 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_983035 ?auto_983030 ) ( SURFACE-AT ?auto_983028 ?auto_983030 ) ( CLEAR ?auto_983028 ) ( IS-CRATE ?auto_983029 ) ( not ( = ?auto_983028 ?auto_983029 ) ) ( AVAILABLE ?auto_983035 ) ( ON ?auto_983028 ?auto_983027 ) ( not ( = ?auto_983027 ?auto_983028 ) ) ( not ( = ?auto_983027 ?auto_983029 ) ) ( TRUCK-AT ?auto_983032 ?auto_983034 ) ( not ( = ?auto_983034 ?auto_983030 ) ) ( HOIST-AT ?auto_983033 ?auto_983034 ) ( not ( = ?auto_983035 ?auto_983033 ) ) ( AVAILABLE ?auto_983033 ) ( SURFACE-AT ?auto_983029 ?auto_983034 ) ( ON ?auto_983029 ?auto_983031 ) ( CLEAR ?auto_983029 ) ( not ( = ?auto_983028 ?auto_983031 ) ) ( not ( = ?auto_983029 ?auto_983031 ) ) ( not ( = ?auto_983027 ?auto_983031 ) ) ( ON ?auto_983023 ?auto_983022 ) ( ON ?auto_983024 ?auto_983023 ) ( ON ?auto_983025 ?auto_983024 ) ( ON ?auto_983026 ?auto_983025 ) ( ON ?auto_983027 ?auto_983026 ) ( not ( = ?auto_983022 ?auto_983023 ) ) ( not ( = ?auto_983022 ?auto_983024 ) ) ( not ( = ?auto_983022 ?auto_983025 ) ) ( not ( = ?auto_983022 ?auto_983026 ) ) ( not ( = ?auto_983022 ?auto_983027 ) ) ( not ( = ?auto_983022 ?auto_983028 ) ) ( not ( = ?auto_983022 ?auto_983029 ) ) ( not ( = ?auto_983022 ?auto_983031 ) ) ( not ( = ?auto_983023 ?auto_983024 ) ) ( not ( = ?auto_983023 ?auto_983025 ) ) ( not ( = ?auto_983023 ?auto_983026 ) ) ( not ( = ?auto_983023 ?auto_983027 ) ) ( not ( = ?auto_983023 ?auto_983028 ) ) ( not ( = ?auto_983023 ?auto_983029 ) ) ( not ( = ?auto_983023 ?auto_983031 ) ) ( not ( = ?auto_983024 ?auto_983025 ) ) ( not ( = ?auto_983024 ?auto_983026 ) ) ( not ( = ?auto_983024 ?auto_983027 ) ) ( not ( = ?auto_983024 ?auto_983028 ) ) ( not ( = ?auto_983024 ?auto_983029 ) ) ( not ( = ?auto_983024 ?auto_983031 ) ) ( not ( = ?auto_983025 ?auto_983026 ) ) ( not ( = ?auto_983025 ?auto_983027 ) ) ( not ( = ?auto_983025 ?auto_983028 ) ) ( not ( = ?auto_983025 ?auto_983029 ) ) ( not ( = ?auto_983025 ?auto_983031 ) ) ( not ( = ?auto_983026 ?auto_983027 ) ) ( not ( = ?auto_983026 ?auto_983028 ) ) ( not ( = ?auto_983026 ?auto_983029 ) ) ( not ( = ?auto_983026 ?auto_983031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983027 ?auto_983028 ?auto_983029 )
      ( MAKE-7CRATE-VERIFY ?auto_983022 ?auto_983023 ?auto_983024 ?auto_983025 ?auto_983026 ?auto_983027 ?auto_983028 ?auto_983029 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983100 - SURFACE
      ?auto_983101 - SURFACE
      ?auto_983102 - SURFACE
      ?auto_983103 - SURFACE
      ?auto_983104 - SURFACE
      ?auto_983105 - SURFACE
      ?auto_983106 - SURFACE
      ?auto_983107 - SURFACE
    )
    :vars
    (
      ?auto_983110 - HOIST
      ?auto_983111 - PLACE
      ?auto_983113 - PLACE
      ?auto_983112 - HOIST
      ?auto_983108 - SURFACE
      ?auto_983109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_983110 ?auto_983111 ) ( SURFACE-AT ?auto_983106 ?auto_983111 ) ( CLEAR ?auto_983106 ) ( IS-CRATE ?auto_983107 ) ( not ( = ?auto_983106 ?auto_983107 ) ) ( AVAILABLE ?auto_983110 ) ( ON ?auto_983106 ?auto_983105 ) ( not ( = ?auto_983105 ?auto_983106 ) ) ( not ( = ?auto_983105 ?auto_983107 ) ) ( not ( = ?auto_983113 ?auto_983111 ) ) ( HOIST-AT ?auto_983112 ?auto_983113 ) ( not ( = ?auto_983110 ?auto_983112 ) ) ( AVAILABLE ?auto_983112 ) ( SURFACE-AT ?auto_983107 ?auto_983113 ) ( ON ?auto_983107 ?auto_983108 ) ( CLEAR ?auto_983107 ) ( not ( = ?auto_983106 ?auto_983108 ) ) ( not ( = ?auto_983107 ?auto_983108 ) ) ( not ( = ?auto_983105 ?auto_983108 ) ) ( TRUCK-AT ?auto_983109 ?auto_983111 ) ( ON ?auto_983101 ?auto_983100 ) ( ON ?auto_983102 ?auto_983101 ) ( ON ?auto_983103 ?auto_983102 ) ( ON ?auto_983104 ?auto_983103 ) ( ON ?auto_983105 ?auto_983104 ) ( not ( = ?auto_983100 ?auto_983101 ) ) ( not ( = ?auto_983100 ?auto_983102 ) ) ( not ( = ?auto_983100 ?auto_983103 ) ) ( not ( = ?auto_983100 ?auto_983104 ) ) ( not ( = ?auto_983100 ?auto_983105 ) ) ( not ( = ?auto_983100 ?auto_983106 ) ) ( not ( = ?auto_983100 ?auto_983107 ) ) ( not ( = ?auto_983100 ?auto_983108 ) ) ( not ( = ?auto_983101 ?auto_983102 ) ) ( not ( = ?auto_983101 ?auto_983103 ) ) ( not ( = ?auto_983101 ?auto_983104 ) ) ( not ( = ?auto_983101 ?auto_983105 ) ) ( not ( = ?auto_983101 ?auto_983106 ) ) ( not ( = ?auto_983101 ?auto_983107 ) ) ( not ( = ?auto_983101 ?auto_983108 ) ) ( not ( = ?auto_983102 ?auto_983103 ) ) ( not ( = ?auto_983102 ?auto_983104 ) ) ( not ( = ?auto_983102 ?auto_983105 ) ) ( not ( = ?auto_983102 ?auto_983106 ) ) ( not ( = ?auto_983102 ?auto_983107 ) ) ( not ( = ?auto_983102 ?auto_983108 ) ) ( not ( = ?auto_983103 ?auto_983104 ) ) ( not ( = ?auto_983103 ?auto_983105 ) ) ( not ( = ?auto_983103 ?auto_983106 ) ) ( not ( = ?auto_983103 ?auto_983107 ) ) ( not ( = ?auto_983103 ?auto_983108 ) ) ( not ( = ?auto_983104 ?auto_983105 ) ) ( not ( = ?auto_983104 ?auto_983106 ) ) ( not ( = ?auto_983104 ?auto_983107 ) ) ( not ( = ?auto_983104 ?auto_983108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983105 ?auto_983106 ?auto_983107 )
      ( MAKE-7CRATE-VERIFY ?auto_983100 ?auto_983101 ?auto_983102 ?auto_983103 ?auto_983104 ?auto_983105 ?auto_983106 ?auto_983107 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983178 - SURFACE
      ?auto_983179 - SURFACE
      ?auto_983180 - SURFACE
      ?auto_983181 - SURFACE
      ?auto_983182 - SURFACE
      ?auto_983183 - SURFACE
      ?auto_983184 - SURFACE
      ?auto_983185 - SURFACE
    )
    :vars
    (
      ?auto_983190 - HOIST
      ?auto_983187 - PLACE
      ?auto_983188 - PLACE
      ?auto_983189 - HOIST
      ?auto_983191 - SURFACE
      ?auto_983186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_983190 ?auto_983187 ) ( IS-CRATE ?auto_983185 ) ( not ( = ?auto_983184 ?auto_983185 ) ) ( not ( = ?auto_983183 ?auto_983184 ) ) ( not ( = ?auto_983183 ?auto_983185 ) ) ( not ( = ?auto_983188 ?auto_983187 ) ) ( HOIST-AT ?auto_983189 ?auto_983188 ) ( not ( = ?auto_983190 ?auto_983189 ) ) ( AVAILABLE ?auto_983189 ) ( SURFACE-AT ?auto_983185 ?auto_983188 ) ( ON ?auto_983185 ?auto_983191 ) ( CLEAR ?auto_983185 ) ( not ( = ?auto_983184 ?auto_983191 ) ) ( not ( = ?auto_983185 ?auto_983191 ) ) ( not ( = ?auto_983183 ?auto_983191 ) ) ( TRUCK-AT ?auto_983186 ?auto_983187 ) ( SURFACE-AT ?auto_983183 ?auto_983187 ) ( CLEAR ?auto_983183 ) ( LIFTING ?auto_983190 ?auto_983184 ) ( IS-CRATE ?auto_983184 ) ( ON ?auto_983179 ?auto_983178 ) ( ON ?auto_983180 ?auto_983179 ) ( ON ?auto_983181 ?auto_983180 ) ( ON ?auto_983182 ?auto_983181 ) ( ON ?auto_983183 ?auto_983182 ) ( not ( = ?auto_983178 ?auto_983179 ) ) ( not ( = ?auto_983178 ?auto_983180 ) ) ( not ( = ?auto_983178 ?auto_983181 ) ) ( not ( = ?auto_983178 ?auto_983182 ) ) ( not ( = ?auto_983178 ?auto_983183 ) ) ( not ( = ?auto_983178 ?auto_983184 ) ) ( not ( = ?auto_983178 ?auto_983185 ) ) ( not ( = ?auto_983178 ?auto_983191 ) ) ( not ( = ?auto_983179 ?auto_983180 ) ) ( not ( = ?auto_983179 ?auto_983181 ) ) ( not ( = ?auto_983179 ?auto_983182 ) ) ( not ( = ?auto_983179 ?auto_983183 ) ) ( not ( = ?auto_983179 ?auto_983184 ) ) ( not ( = ?auto_983179 ?auto_983185 ) ) ( not ( = ?auto_983179 ?auto_983191 ) ) ( not ( = ?auto_983180 ?auto_983181 ) ) ( not ( = ?auto_983180 ?auto_983182 ) ) ( not ( = ?auto_983180 ?auto_983183 ) ) ( not ( = ?auto_983180 ?auto_983184 ) ) ( not ( = ?auto_983180 ?auto_983185 ) ) ( not ( = ?auto_983180 ?auto_983191 ) ) ( not ( = ?auto_983181 ?auto_983182 ) ) ( not ( = ?auto_983181 ?auto_983183 ) ) ( not ( = ?auto_983181 ?auto_983184 ) ) ( not ( = ?auto_983181 ?auto_983185 ) ) ( not ( = ?auto_983181 ?auto_983191 ) ) ( not ( = ?auto_983182 ?auto_983183 ) ) ( not ( = ?auto_983182 ?auto_983184 ) ) ( not ( = ?auto_983182 ?auto_983185 ) ) ( not ( = ?auto_983182 ?auto_983191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983183 ?auto_983184 ?auto_983185 )
      ( MAKE-7CRATE-VERIFY ?auto_983178 ?auto_983179 ?auto_983180 ?auto_983181 ?auto_983182 ?auto_983183 ?auto_983184 ?auto_983185 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_983256 - SURFACE
      ?auto_983257 - SURFACE
      ?auto_983258 - SURFACE
      ?auto_983259 - SURFACE
      ?auto_983260 - SURFACE
      ?auto_983261 - SURFACE
      ?auto_983262 - SURFACE
      ?auto_983263 - SURFACE
    )
    :vars
    (
      ?auto_983265 - HOIST
      ?auto_983267 - PLACE
      ?auto_983268 - PLACE
      ?auto_983269 - HOIST
      ?auto_983266 - SURFACE
      ?auto_983264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_983265 ?auto_983267 ) ( IS-CRATE ?auto_983263 ) ( not ( = ?auto_983262 ?auto_983263 ) ) ( not ( = ?auto_983261 ?auto_983262 ) ) ( not ( = ?auto_983261 ?auto_983263 ) ) ( not ( = ?auto_983268 ?auto_983267 ) ) ( HOIST-AT ?auto_983269 ?auto_983268 ) ( not ( = ?auto_983265 ?auto_983269 ) ) ( AVAILABLE ?auto_983269 ) ( SURFACE-AT ?auto_983263 ?auto_983268 ) ( ON ?auto_983263 ?auto_983266 ) ( CLEAR ?auto_983263 ) ( not ( = ?auto_983262 ?auto_983266 ) ) ( not ( = ?auto_983263 ?auto_983266 ) ) ( not ( = ?auto_983261 ?auto_983266 ) ) ( TRUCK-AT ?auto_983264 ?auto_983267 ) ( SURFACE-AT ?auto_983261 ?auto_983267 ) ( CLEAR ?auto_983261 ) ( IS-CRATE ?auto_983262 ) ( AVAILABLE ?auto_983265 ) ( IN ?auto_983262 ?auto_983264 ) ( ON ?auto_983257 ?auto_983256 ) ( ON ?auto_983258 ?auto_983257 ) ( ON ?auto_983259 ?auto_983258 ) ( ON ?auto_983260 ?auto_983259 ) ( ON ?auto_983261 ?auto_983260 ) ( not ( = ?auto_983256 ?auto_983257 ) ) ( not ( = ?auto_983256 ?auto_983258 ) ) ( not ( = ?auto_983256 ?auto_983259 ) ) ( not ( = ?auto_983256 ?auto_983260 ) ) ( not ( = ?auto_983256 ?auto_983261 ) ) ( not ( = ?auto_983256 ?auto_983262 ) ) ( not ( = ?auto_983256 ?auto_983263 ) ) ( not ( = ?auto_983256 ?auto_983266 ) ) ( not ( = ?auto_983257 ?auto_983258 ) ) ( not ( = ?auto_983257 ?auto_983259 ) ) ( not ( = ?auto_983257 ?auto_983260 ) ) ( not ( = ?auto_983257 ?auto_983261 ) ) ( not ( = ?auto_983257 ?auto_983262 ) ) ( not ( = ?auto_983257 ?auto_983263 ) ) ( not ( = ?auto_983257 ?auto_983266 ) ) ( not ( = ?auto_983258 ?auto_983259 ) ) ( not ( = ?auto_983258 ?auto_983260 ) ) ( not ( = ?auto_983258 ?auto_983261 ) ) ( not ( = ?auto_983258 ?auto_983262 ) ) ( not ( = ?auto_983258 ?auto_983263 ) ) ( not ( = ?auto_983258 ?auto_983266 ) ) ( not ( = ?auto_983259 ?auto_983260 ) ) ( not ( = ?auto_983259 ?auto_983261 ) ) ( not ( = ?auto_983259 ?auto_983262 ) ) ( not ( = ?auto_983259 ?auto_983263 ) ) ( not ( = ?auto_983259 ?auto_983266 ) ) ( not ( = ?auto_983260 ?auto_983261 ) ) ( not ( = ?auto_983260 ?auto_983262 ) ) ( not ( = ?auto_983260 ?auto_983263 ) ) ( not ( = ?auto_983260 ?auto_983266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_983261 ?auto_983262 ?auto_983263 )
      ( MAKE-7CRATE-VERIFY ?auto_983256 ?auto_983257 ?auto_983258 ?auto_983259 ?auto_983260 ?auto_983261 ?auto_983262 ?auto_983263 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986152 - SURFACE
      ?auto_986153 - SURFACE
      ?auto_986154 - SURFACE
      ?auto_986155 - SURFACE
      ?auto_986156 - SURFACE
      ?auto_986157 - SURFACE
      ?auto_986158 - SURFACE
      ?auto_986159 - SURFACE
      ?auto_986160 - SURFACE
    )
    :vars
    (
      ?auto_986162 - HOIST
      ?auto_986161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_986162 ?auto_986161 ) ( SURFACE-AT ?auto_986159 ?auto_986161 ) ( CLEAR ?auto_986159 ) ( LIFTING ?auto_986162 ?auto_986160 ) ( IS-CRATE ?auto_986160 ) ( not ( = ?auto_986159 ?auto_986160 ) ) ( ON ?auto_986153 ?auto_986152 ) ( ON ?auto_986154 ?auto_986153 ) ( ON ?auto_986155 ?auto_986154 ) ( ON ?auto_986156 ?auto_986155 ) ( ON ?auto_986157 ?auto_986156 ) ( ON ?auto_986158 ?auto_986157 ) ( ON ?auto_986159 ?auto_986158 ) ( not ( = ?auto_986152 ?auto_986153 ) ) ( not ( = ?auto_986152 ?auto_986154 ) ) ( not ( = ?auto_986152 ?auto_986155 ) ) ( not ( = ?auto_986152 ?auto_986156 ) ) ( not ( = ?auto_986152 ?auto_986157 ) ) ( not ( = ?auto_986152 ?auto_986158 ) ) ( not ( = ?auto_986152 ?auto_986159 ) ) ( not ( = ?auto_986152 ?auto_986160 ) ) ( not ( = ?auto_986153 ?auto_986154 ) ) ( not ( = ?auto_986153 ?auto_986155 ) ) ( not ( = ?auto_986153 ?auto_986156 ) ) ( not ( = ?auto_986153 ?auto_986157 ) ) ( not ( = ?auto_986153 ?auto_986158 ) ) ( not ( = ?auto_986153 ?auto_986159 ) ) ( not ( = ?auto_986153 ?auto_986160 ) ) ( not ( = ?auto_986154 ?auto_986155 ) ) ( not ( = ?auto_986154 ?auto_986156 ) ) ( not ( = ?auto_986154 ?auto_986157 ) ) ( not ( = ?auto_986154 ?auto_986158 ) ) ( not ( = ?auto_986154 ?auto_986159 ) ) ( not ( = ?auto_986154 ?auto_986160 ) ) ( not ( = ?auto_986155 ?auto_986156 ) ) ( not ( = ?auto_986155 ?auto_986157 ) ) ( not ( = ?auto_986155 ?auto_986158 ) ) ( not ( = ?auto_986155 ?auto_986159 ) ) ( not ( = ?auto_986155 ?auto_986160 ) ) ( not ( = ?auto_986156 ?auto_986157 ) ) ( not ( = ?auto_986156 ?auto_986158 ) ) ( not ( = ?auto_986156 ?auto_986159 ) ) ( not ( = ?auto_986156 ?auto_986160 ) ) ( not ( = ?auto_986157 ?auto_986158 ) ) ( not ( = ?auto_986157 ?auto_986159 ) ) ( not ( = ?auto_986157 ?auto_986160 ) ) ( not ( = ?auto_986158 ?auto_986159 ) ) ( not ( = ?auto_986158 ?auto_986160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_986159 ?auto_986160 )
      ( MAKE-8CRATE-VERIFY ?auto_986152 ?auto_986153 ?auto_986154 ?auto_986155 ?auto_986156 ?auto_986157 ?auto_986158 ?auto_986159 ?auto_986160 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986219 - SURFACE
      ?auto_986220 - SURFACE
      ?auto_986221 - SURFACE
      ?auto_986222 - SURFACE
      ?auto_986223 - SURFACE
      ?auto_986224 - SURFACE
      ?auto_986225 - SURFACE
      ?auto_986226 - SURFACE
      ?auto_986227 - SURFACE
    )
    :vars
    (
      ?auto_986228 - HOIST
      ?auto_986229 - PLACE
      ?auto_986230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986228 ?auto_986229 ) ( SURFACE-AT ?auto_986226 ?auto_986229 ) ( CLEAR ?auto_986226 ) ( IS-CRATE ?auto_986227 ) ( not ( = ?auto_986226 ?auto_986227 ) ) ( TRUCK-AT ?auto_986230 ?auto_986229 ) ( AVAILABLE ?auto_986228 ) ( IN ?auto_986227 ?auto_986230 ) ( ON ?auto_986226 ?auto_986225 ) ( not ( = ?auto_986225 ?auto_986226 ) ) ( not ( = ?auto_986225 ?auto_986227 ) ) ( ON ?auto_986220 ?auto_986219 ) ( ON ?auto_986221 ?auto_986220 ) ( ON ?auto_986222 ?auto_986221 ) ( ON ?auto_986223 ?auto_986222 ) ( ON ?auto_986224 ?auto_986223 ) ( ON ?auto_986225 ?auto_986224 ) ( not ( = ?auto_986219 ?auto_986220 ) ) ( not ( = ?auto_986219 ?auto_986221 ) ) ( not ( = ?auto_986219 ?auto_986222 ) ) ( not ( = ?auto_986219 ?auto_986223 ) ) ( not ( = ?auto_986219 ?auto_986224 ) ) ( not ( = ?auto_986219 ?auto_986225 ) ) ( not ( = ?auto_986219 ?auto_986226 ) ) ( not ( = ?auto_986219 ?auto_986227 ) ) ( not ( = ?auto_986220 ?auto_986221 ) ) ( not ( = ?auto_986220 ?auto_986222 ) ) ( not ( = ?auto_986220 ?auto_986223 ) ) ( not ( = ?auto_986220 ?auto_986224 ) ) ( not ( = ?auto_986220 ?auto_986225 ) ) ( not ( = ?auto_986220 ?auto_986226 ) ) ( not ( = ?auto_986220 ?auto_986227 ) ) ( not ( = ?auto_986221 ?auto_986222 ) ) ( not ( = ?auto_986221 ?auto_986223 ) ) ( not ( = ?auto_986221 ?auto_986224 ) ) ( not ( = ?auto_986221 ?auto_986225 ) ) ( not ( = ?auto_986221 ?auto_986226 ) ) ( not ( = ?auto_986221 ?auto_986227 ) ) ( not ( = ?auto_986222 ?auto_986223 ) ) ( not ( = ?auto_986222 ?auto_986224 ) ) ( not ( = ?auto_986222 ?auto_986225 ) ) ( not ( = ?auto_986222 ?auto_986226 ) ) ( not ( = ?auto_986222 ?auto_986227 ) ) ( not ( = ?auto_986223 ?auto_986224 ) ) ( not ( = ?auto_986223 ?auto_986225 ) ) ( not ( = ?auto_986223 ?auto_986226 ) ) ( not ( = ?auto_986223 ?auto_986227 ) ) ( not ( = ?auto_986224 ?auto_986225 ) ) ( not ( = ?auto_986224 ?auto_986226 ) ) ( not ( = ?auto_986224 ?auto_986227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986225 ?auto_986226 ?auto_986227 )
      ( MAKE-8CRATE-VERIFY ?auto_986219 ?auto_986220 ?auto_986221 ?auto_986222 ?auto_986223 ?auto_986224 ?auto_986225 ?auto_986226 ?auto_986227 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986295 - SURFACE
      ?auto_986296 - SURFACE
      ?auto_986297 - SURFACE
      ?auto_986298 - SURFACE
      ?auto_986299 - SURFACE
      ?auto_986300 - SURFACE
      ?auto_986301 - SURFACE
      ?auto_986302 - SURFACE
      ?auto_986303 - SURFACE
    )
    :vars
    (
      ?auto_986304 - HOIST
      ?auto_986305 - PLACE
      ?auto_986306 - TRUCK
      ?auto_986307 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_986304 ?auto_986305 ) ( SURFACE-AT ?auto_986302 ?auto_986305 ) ( CLEAR ?auto_986302 ) ( IS-CRATE ?auto_986303 ) ( not ( = ?auto_986302 ?auto_986303 ) ) ( AVAILABLE ?auto_986304 ) ( IN ?auto_986303 ?auto_986306 ) ( ON ?auto_986302 ?auto_986301 ) ( not ( = ?auto_986301 ?auto_986302 ) ) ( not ( = ?auto_986301 ?auto_986303 ) ) ( TRUCK-AT ?auto_986306 ?auto_986307 ) ( not ( = ?auto_986307 ?auto_986305 ) ) ( ON ?auto_986296 ?auto_986295 ) ( ON ?auto_986297 ?auto_986296 ) ( ON ?auto_986298 ?auto_986297 ) ( ON ?auto_986299 ?auto_986298 ) ( ON ?auto_986300 ?auto_986299 ) ( ON ?auto_986301 ?auto_986300 ) ( not ( = ?auto_986295 ?auto_986296 ) ) ( not ( = ?auto_986295 ?auto_986297 ) ) ( not ( = ?auto_986295 ?auto_986298 ) ) ( not ( = ?auto_986295 ?auto_986299 ) ) ( not ( = ?auto_986295 ?auto_986300 ) ) ( not ( = ?auto_986295 ?auto_986301 ) ) ( not ( = ?auto_986295 ?auto_986302 ) ) ( not ( = ?auto_986295 ?auto_986303 ) ) ( not ( = ?auto_986296 ?auto_986297 ) ) ( not ( = ?auto_986296 ?auto_986298 ) ) ( not ( = ?auto_986296 ?auto_986299 ) ) ( not ( = ?auto_986296 ?auto_986300 ) ) ( not ( = ?auto_986296 ?auto_986301 ) ) ( not ( = ?auto_986296 ?auto_986302 ) ) ( not ( = ?auto_986296 ?auto_986303 ) ) ( not ( = ?auto_986297 ?auto_986298 ) ) ( not ( = ?auto_986297 ?auto_986299 ) ) ( not ( = ?auto_986297 ?auto_986300 ) ) ( not ( = ?auto_986297 ?auto_986301 ) ) ( not ( = ?auto_986297 ?auto_986302 ) ) ( not ( = ?auto_986297 ?auto_986303 ) ) ( not ( = ?auto_986298 ?auto_986299 ) ) ( not ( = ?auto_986298 ?auto_986300 ) ) ( not ( = ?auto_986298 ?auto_986301 ) ) ( not ( = ?auto_986298 ?auto_986302 ) ) ( not ( = ?auto_986298 ?auto_986303 ) ) ( not ( = ?auto_986299 ?auto_986300 ) ) ( not ( = ?auto_986299 ?auto_986301 ) ) ( not ( = ?auto_986299 ?auto_986302 ) ) ( not ( = ?auto_986299 ?auto_986303 ) ) ( not ( = ?auto_986300 ?auto_986301 ) ) ( not ( = ?auto_986300 ?auto_986302 ) ) ( not ( = ?auto_986300 ?auto_986303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986301 ?auto_986302 ?auto_986303 )
      ( MAKE-8CRATE-VERIFY ?auto_986295 ?auto_986296 ?auto_986297 ?auto_986298 ?auto_986299 ?auto_986300 ?auto_986301 ?auto_986302 ?auto_986303 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986379 - SURFACE
      ?auto_986380 - SURFACE
      ?auto_986381 - SURFACE
      ?auto_986382 - SURFACE
      ?auto_986383 - SURFACE
      ?auto_986384 - SURFACE
      ?auto_986385 - SURFACE
      ?auto_986386 - SURFACE
      ?auto_986387 - SURFACE
    )
    :vars
    (
      ?auto_986390 - HOIST
      ?auto_986392 - PLACE
      ?auto_986388 - TRUCK
      ?auto_986391 - PLACE
      ?auto_986389 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_986390 ?auto_986392 ) ( SURFACE-AT ?auto_986386 ?auto_986392 ) ( CLEAR ?auto_986386 ) ( IS-CRATE ?auto_986387 ) ( not ( = ?auto_986386 ?auto_986387 ) ) ( AVAILABLE ?auto_986390 ) ( ON ?auto_986386 ?auto_986385 ) ( not ( = ?auto_986385 ?auto_986386 ) ) ( not ( = ?auto_986385 ?auto_986387 ) ) ( TRUCK-AT ?auto_986388 ?auto_986391 ) ( not ( = ?auto_986391 ?auto_986392 ) ) ( HOIST-AT ?auto_986389 ?auto_986391 ) ( LIFTING ?auto_986389 ?auto_986387 ) ( not ( = ?auto_986390 ?auto_986389 ) ) ( ON ?auto_986380 ?auto_986379 ) ( ON ?auto_986381 ?auto_986380 ) ( ON ?auto_986382 ?auto_986381 ) ( ON ?auto_986383 ?auto_986382 ) ( ON ?auto_986384 ?auto_986383 ) ( ON ?auto_986385 ?auto_986384 ) ( not ( = ?auto_986379 ?auto_986380 ) ) ( not ( = ?auto_986379 ?auto_986381 ) ) ( not ( = ?auto_986379 ?auto_986382 ) ) ( not ( = ?auto_986379 ?auto_986383 ) ) ( not ( = ?auto_986379 ?auto_986384 ) ) ( not ( = ?auto_986379 ?auto_986385 ) ) ( not ( = ?auto_986379 ?auto_986386 ) ) ( not ( = ?auto_986379 ?auto_986387 ) ) ( not ( = ?auto_986380 ?auto_986381 ) ) ( not ( = ?auto_986380 ?auto_986382 ) ) ( not ( = ?auto_986380 ?auto_986383 ) ) ( not ( = ?auto_986380 ?auto_986384 ) ) ( not ( = ?auto_986380 ?auto_986385 ) ) ( not ( = ?auto_986380 ?auto_986386 ) ) ( not ( = ?auto_986380 ?auto_986387 ) ) ( not ( = ?auto_986381 ?auto_986382 ) ) ( not ( = ?auto_986381 ?auto_986383 ) ) ( not ( = ?auto_986381 ?auto_986384 ) ) ( not ( = ?auto_986381 ?auto_986385 ) ) ( not ( = ?auto_986381 ?auto_986386 ) ) ( not ( = ?auto_986381 ?auto_986387 ) ) ( not ( = ?auto_986382 ?auto_986383 ) ) ( not ( = ?auto_986382 ?auto_986384 ) ) ( not ( = ?auto_986382 ?auto_986385 ) ) ( not ( = ?auto_986382 ?auto_986386 ) ) ( not ( = ?auto_986382 ?auto_986387 ) ) ( not ( = ?auto_986383 ?auto_986384 ) ) ( not ( = ?auto_986383 ?auto_986385 ) ) ( not ( = ?auto_986383 ?auto_986386 ) ) ( not ( = ?auto_986383 ?auto_986387 ) ) ( not ( = ?auto_986384 ?auto_986385 ) ) ( not ( = ?auto_986384 ?auto_986386 ) ) ( not ( = ?auto_986384 ?auto_986387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986385 ?auto_986386 ?auto_986387 )
      ( MAKE-8CRATE-VERIFY ?auto_986379 ?auto_986380 ?auto_986381 ?auto_986382 ?auto_986383 ?auto_986384 ?auto_986385 ?auto_986386 ?auto_986387 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986471 - SURFACE
      ?auto_986472 - SURFACE
      ?auto_986473 - SURFACE
      ?auto_986474 - SURFACE
      ?auto_986475 - SURFACE
      ?auto_986476 - SURFACE
      ?auto_986477 - SURFACE
      ?auto_986478 - SURFACE
      ?auto_986479 - SURFACE
    )
    :vars
    (
      ?auto_986481 - HOIST
      ?auto_986485 - PLACE
      ?auto_986482 - TRUCK
      ?auto_986484 - PLACE
      ?auto_986483 - HOIST
      ?auto_986480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_986481 ?auto_986485 ) ( SURFACE-AT ?auto_986478 ?auto_986485 ) ( CLEAR ?auto_986478 ) ( IS-CRATE ?auto_986479 ) ( not ( = ?auto_986478 ?auto_986479 ) ) ( AVAILABLE ?auto_986481 ) ( ON ?auto_986478 ?auto_986477 ) ( not ( = ?auto_986477 ?auto_986478 ) ) ( not ( = ?auto_986477 ?auto_986479 ) ) ( TRUCK-AT ?auto_986482 ?auto_986484 ) ( not ( = ?auto_986484 ?auto_986485 ) ) ( HOIST-AT ?auto_986483 ?auto_986484 ) ( not ( = ?auto_986481 ?auto_986483 ) ) ( AVAILABLE ?auto_986483 ) ( SURFACE-AT ?auto_986479 ?auto_986484 ) ( ON ?auto_986479 ?auto_986480 ) ( CLEAR ?auto_986479 ) ( not ( = ?auto_986478 ?auto_986480 ) ) ( not ( = ?auto_986479 ?auto_986480 ) ) ( not ( = ?auto_986477 ?auto_986480 ) ) ( ON ?auto_986472 ?auto_986471 ) ( ON ?auto_986473 ?auto_986472 ) ( ON ?auto_986474 ?auto_986473 ) ( ON ?auto_986475 ?auto_986474 ) ( ON ?auto_986476 ?auto_986475 ) ( ON ?auto_986477 ?auto_986476 ) ( not ( = ?auto_986471 ?auto_986472 ) ) ( not ( = ?auto_986471 ?auto_986473 ) ) ( not ( = ?auto_986471 ?auto_986474 ) ) ( not ( = ?auto_986471 ?auto_986475 ) ) ( not ( = ?auto_986471 ?auto_986476 ) ) ( not ( = ?auto_986471 ?auto_986477 ) ) ( not ( = ?auto_986471 ?auto_986478 ) ) ( not ( = ?auto_986471 ?auto_986479 ) ) ( not ( = ?auto_986471 ?auto_986480 ) ) ( not ( = ?auto_986472 ?auto_986473 ) ) ( not ( = ?auto_986472 ?auto_986474 ) ) ( not ( = ?auto_986472 ?auto_986475 ) ) ( not ( = ?auto_986472 ?auto_986476 ) ) ( not ( = ?auto_986472 ?auto_986477 ) ) ( not ( = ?auto_986472 ?auto_986478 ) ) ( not ( = ?auto_986472 ?auto_986479 ) ) ( not ( = ?auto_986472 ?auto_986480 ) ) ( not ( = ?auto_986473 ?auto_986474 ) ) ( not ( = ?auto_986473 ?auto_986475 ) ) ( not ( = ?auto_986473 ?auto_986476 ) ) ( not ( = ?auto_986473 ?auto_986477 ) ) ( not ( = ?auto_986473 ?auto_986478 ) ) ( not ( = ?auto_986473 ?auto_986479 ) ) ( not ( = ?auto_986473 ?auto_986480 ) ) ( not ( = ?auto_986474 ?auto_986475 ) ) ( not ( = ?auto_986474 ?auto_986476 ) ) ( not ( = ?auto_986474 ?auto_986477 ) ) ( not ( = ?auto_986474 ?auto_986478 ) ) ( not ( = ?auto_986474 ?auto_986479 ) ) ( not ( = ?auto_986474 ?auto_986480 ) ) ( not ( = ?auto_986475 ?auto_986476 ) ) ( not ( = ?auto_986475 ?auto_986477 ) ) ( not ( = ?auto_986475 ?auto_986478 ) ) ( not ( = ?auto_986475 ?auto_986479 ) ) ( not ( = ?auto_986475 ?auto_986480 ) ) ( not ( = ?auto_986476 ?auto_986477 ) ) ( not ( = ?auto_986476 ?auto_986478 ) ) ( not ( = ?auto_986476 ?auto_986479 ) ) ( not ( = ?auto_986476 ?auto_986480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986477 ?auto_986478 ?auto_986479 )
      ( MAKE-8CRATE-VERIFY ?auto_986471 ?auto_986472 ?auto_986473 ?auto_986474 ?auto_986475 ?auto_986476 ?auto_986477 ?auto_986478 ?auto_986479 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986564 - SURFACE
      ?auto_986565 - SURFACE
      ?auto_986566 - SURFACE
      ?auto_986567 - SURFACE
      ?auto_986568 - SURFACE
      ?auto_986569 - SURFACE
      ?auto_986570 - SURFACE
      ?auto_986571 - SURFACE
      ?auto_986572 - SURFACE
    )
    :vars
    (
      ?auto_986575 - HOIST
      ?auto_986576 - PLACE
      ?auto_986573 - PLACE
      ?auto_986574 - HOIST
      ?auto_986577 - SURFACE
      ?auto_986578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986575 ?auto_986576 ) ( SURFACE-AT ?auto_986571 ?auto_986576 ) ( CLEAR ?auto_986571 ) ( IS-CRATE ?auto_986572 ) ( not ( = ?auto_986571 ?auto_986572 ) ) ( AVAILABLE ?auto_986575 ) ( ON ?auto_986571 ?auto_986570 ) ( not ( = ?auto_986570 ?auto_986571 ) ) ( not ( = ?auto_986570 ?auto_986572 ) ) ( not ( = ?auto_986573 ?auto_986576 ) ) ( HOIST-AT ?auto_986574 ?auto_986573 ) ( not ( = ?auto_986575 ?auto_986574 ) ) ( AVAILABLE ?auto_986574 ) ( SURFACE-AT ?auto_986572 ?auto_986573 ) ( ON ?auto_986572 ?auto_986577 ) ( CLEAR ?auto_986572 ) ( not ( = ?auto_986571 ?auto_986577 ) ) ( not ( = ?auto_986572 ?auto_986577 ) ) ( not ( = ?auto_986570 ?auto_986577 ) ) ( TRUCK-AT ?auto_986578 ?auto_986576 ) ( ON ?auto_986565 ?auto_986564 ) ( ON ?auto_986566 ?auto_986565 ) ( ON ?auto_986567 ?auto_986566 ) ( ON ?auto_986568 ?auto_986567 ) ( ON ?auto_986569 ?auto_986568 ) ( ON ?auto_986570 ?auto_986569 ) ( not ( = ?auto_986564 ?auto_986565 ) ) ( not ( = ?auto_986564 ?auto_986566 ) ) ( not ( = ?auto_986564 ?auto_986567 ) ) ( not ( = ?auto_986564 ?auto_986568 ) ) ( not ( = ?auto_986564 ?auto_986569 ) ) ( not ( = ?auto_986564 ?auto_986570 ) ) ( not ( = ?auto_986564 ?auto_986571 ) ) ( not ( = ?auto_986564 ?auto_986572 ) ) ( not ( = ?auto_986564 ?auto_986577 ) ) ( not ( = ?auto_986565 ?auto_986566 ) ) ( not ( = ?auto_986565 ?auto_986567 ) ) ( not ( = ?auto_986565 ?auto_986568 ) ) ( not ( = ?auto_986565 ?auto_986569 ) ) ( not ( = ?auto_986565 ?auto_986570 ) ) ( not ( = ?auto_986565 ?auto_986571 ) ) ( not ( = ?auto_986565 ?auto_986572 ) ) ( not ( = ?auto_986565 ?auto_986577 ) ) ( not ( = ?auto_986566 ?auto_986567 ) ) ( not ( = ?auto_986566 ?auto_986568 ) ) ( not ( = ?auto_986566 ?auto_986569 ) ) ( not ( = ?auto_986566 ?auto_986570 ) ) ( not ( = ?auto_986566 ?auto_986571 ) ) ( not ( = ?auto_986566 ?auto_986572 ) ) ( not ( = ?auto_986566 ?auto_986577 ) ) ( not ( = ?auto_986567 ?auto_986568 ) ) ( not ( = ?auto_986567 ?auto_986569 ) ) ( not ( = ?auto_986567 ?auto_986570 ) ) ( not ( = ?auto_986567 ?auto_986571 ) ) ( not ( = ?auto_986567 ?auto_986572 ) ) ( not ( = ?auto_986567 ?auto_986577 ) ) ( not ( = ?auto_986568 ?auto_986569 ) ) ( not ( = ?auto_986568 ?auto_986570 ) ) ( not ( = ?auto_986568 ?auto_986571 ) ) ( not ( = ?auto_986568 ?auto_986572 ) ) ( not ( = ?auto_986568 ?auto_986577 ) ) ( not ( = ?auto_986569 ?auto_986570 ) ) ( not ( = ?auto_986569 ?auto_986571 ) ) ( not ( = ?auto_986569 ?auto_986572 ) ) ( not ( = ?auto_986569 ?auto_986577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986570 ?auto_986571 ?auto_986572 )
      ( MAKE-8CRATE-VERIFY ?auto_986564 ?auto_986565 ?auto_986566 ?auto_986567 ?auto_986568 ?auto_986569 ?auto_986570 ?auto_986571 ?auto_986572 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986657 - SURFACE
      ?auto_986658 - SURFACE
      ?auto_986659 - SURFACE
      ?auto_986660 - SURFACE
      ?auto_986661 - SURFACE
      ?auto_986662 - SURFACE
      ?auto_986663 - SURFACE
      ?auto_986664 - SURFACE
      ?auto_986665 - SURFACE
    )
    :vars
    (
      ?auto_986671 - HOIST
      ?auto_986666 - PLACE
      ?auto_986668 - PLACE
      ?auto_986670 - HOIST
      ?auto_986669 - SURFACE
      ?auto_986667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986671 ?auto_986666 ) ( IS-CRATE ?auto_986665 ) ( not ( = ?auto_986664 ?auto_986665 ) ) ( not ( = ?auto_986663 ?auto_986664 ) ) ( not ( = ?auto_986663 ?auto_986665 ) ) ( not ( = ?auto_986668 ?auto_986666 ) ) ( HOIST-AT ?auto_986670 ?auto_986668 ) ( not ( = ?auto_986671 ?auto_986670 ) ) ( AVAILABLE ?auto_986670 ) ( SURFACE-AT ?auto_986665 ?auto_986668 ) ( ON ?auto_986665 ?auto_986669 ) ( CLEAR ?auto_986665 ) ( not ( = ?auto_986664 ?auto_986669 ) ) ( not ( = ?auto_986665 ?auto_986669 ) ) ( not ( = ?auto_986663 ?auto_986669 ) ) ( TRUCK-AT ?auto_986667 ?auto_986666 ) ( SURFACE-AT ?auto_986663 ?auto_986666 ) ( CLEAR ?auto_986663 ) ( LIFTING ?auto_986671 ?auto_986664 ) ( IS-CRATE ?auto_986664 ) ( ON ?auto_986658 ?auto_986657 ) ( ON ?auto_986659 ?auto_986658 ) ( ON ?auto_986660 ?auto_986659 ) ( ON ?auto_986661 ?auto_986660 ) ( ON ?auto_986662 ?auto_986661 ) ( ON ?auto_986663 ?auto_986662 ) ( not ( = ?auto_986657 ?auto_986658 ) ) ( not ( = ?auto_986657 ?auto_986659 ) ) ( not ( = ?auto_986657 ?auto_986660 ) ) ( not ( = ?auto_986657 ?auto_986661 ) ) ( not ( = ?auto_986657 ?auto_986662 ) ) ( not ( = ?auto_986657 ?auto_986663 ) ) ( not ( = ?auto_986657 ?auto_986664 ) ) ( not ( = ?auto_986657 ?auto_986665 ) ) ( not ( = ?auto_986657 ?auto_986669 ) ) ( not ( = ?auto_986658 ?auto_986659 ) ) ( not ( = ?auto_986658 ?auto_986660 ) ) ( not ( = ?auto_986658 ?auto_986661 ) ) ( not ( = ?auto_986658 ?auto_986662 ) ) ( not ( = ?auto_986658 ?auto_986663 ) ) ( not ( = ?auto_986658 ?auto_986664 ) ) ( not ( = ?auto_986658 ?auto_986665 ) ) ( not ( = ?auto_986658 ?auto_986669 ) ) ( not ( = ?auto_986659 ?auto_986660 ) ) ( not ( = ?auto_986659 ?auto_986661 ) ) ( not ( = ?auto_986659 ?auto_986662 ) ) ( not ( = ?auto_986659 ?auto_986663 ) ) ( not ( = ?auto_986659 ?auto_986664 ) ) ( not ( = ?auto_986659 ?auto_986665 ) ) ( not ( = ?auto_986659 ?auto_986669 ) ) ( not ( = ?auto_986660 ?auto_986661 ) ) ( not ( = ?auto_986660 ?auto_986662 ) ) ( not ( = ?auto_986660 ?auto_986663 ) ) ( not ( = ?auto_986660 ?auto_986664 ) ) ( not ( = ?auto_986660 ?auto_986665 ) ) ( not ( = ?auto_986660 ?auto_986669 ) ) ( not ( = ?auto_986661 ?auto_986662 ) ) ( not ( = ?auto_986661 ?auto_986663 ) ) ( not ( = ?auto_986661 ?auto_986664 ) ) ( not ( = ?auto_986661 ?auto_986665 ) ) ( not ( = ?auto_986661 ?auto_986669 ) ) ( not ( = ?auto_986662 ?auto_986663 ) ) ( not ( = ?auto_986662 ?auto_986664 ) ) ( not ( = ?auto_986662 ?auto_986665 ) ) ( not ( = ?auto_986662 ?auto_986669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986663 ?auto_986664 ?auto_986665 )
      ( MAKE-8CRATE-VERIFY ?auto_986657 ?auto_986658 ?auto_986659 ?auto_986660 ?auto_986661 ?auto_986662 ?auto_986663 ?auto_986664 ?auto_986665 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_986750 - SURFACE
      ?auto_986751 - SURFACE
      ?auto_986752 - SURFACE
      ?auto_986753 - SURFACE
      ?auto_986754 - SURFACE
      ?auto_986755 - SURFACE
      ?auto_986756 - SURFACE
      ?auto_986757 - SURFACE
      ?auto_986758 - SURFACE
    )
    :vars
    (
      ?auto_986762 - HOIST
      ?auto_986763 - PLACE
      ?auto_986761 - PLACE
      ?auto_986764 - HOIST
      ?auto_986760 - SURFACE
      ?auto_986759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986762 ?auto_986763 ) ( IS-CRATE ?auto_986758 ) ( not ( = ?auto_986757 ?auto_986758 ) ) ( not ( = ?auto_986756 ?auto_986757 ) ) ( not ( = ?auto_986756 ?auto_986758 ) ) ( not ( = ?auto_986761 ?auto_986763 ) ) ( HOIST-AT ?auto_986764 ?auto_986761 ) ( not ( = ?auto_986762 ?auto_986764 ) ) ( AVAILABLE ?auto_986764 ) ( SURFACE-AT ?auto_986758 ?auto_986761 ) ( ON ?auto_986758 ?auto_986760 ) ( CLEAR ?auto_986758 ) ( not ( = ?auto_986757 ?auto_986760 ) ) ( not ( = ?auto_986758 ?auto_986760 ) ) ( not ( = ?auto_986756 ?auto_986760 ) ) ( TRUCK-AT ?auto_986759 ?auto_986763 ) ( SURFACE-AT ?auto_986756 ?auto_986763 ) ( CLEAR ?auto_986756 ) ( IS-CRATE ?auto_986757 ) ( AVAILABLE ?auto_986762 ) ( IN ?auto_986757 ?auto_986759 ) ( ON ?auto_986751 ?auto_986750 ) ( ON ?auto_986752 ?auto_986751 ) ( ON ?auto_986753 ?auto_986752 ) ( ON ?auto_986754 ?auto_986753 ) ( ON ?auto_986755 ?auto_986754 ) ( ON ?auto_986756 ?auto_986755 ) ( not ( = ?auto_986750 ?auto_986751 ) ) ( not ( = ?auto_986750 ?auto_986752 ) ) ( not ( = ?auto_986750 ?auto_986753 ) ) ( not ( = ?auto_986750 ?auto_986754 ) ) ( not ( = ?auto_986750 ?auto_986755 ) ) ( not ( = ?auto_986750 ?auto_986756 ) ) ( not ( = ?auto_986750 ?auto_986757 ) ) ( not ( = ?auto_986750 ?auto_986758 ) ) ( not ( = ?auto_986750 ?auto_986760 ) ) ( not ( = ?auto_986751 ?auto_986752 ) ) ( not ( = ?auto_986751 ?auto_986753 ) ) ( not ( = ?auto_986751 ?auto_986754 ) ) ( not ( = ?auto_986751 ?auto_986755 ) ) ( not ( = ?auto_986751 ?auto_986756 ) ) ( not ( = ?auto_986751 ?auto_986757 ) ) ( not ( = ?auto_986751 ?auto_986758 ) ) ( not ( = ?auto_986751 ?auto_986760 ) ) ( not ( = ?auto_986752 ?auto_986753 ) ) ( not ( = ?auto_986752 ?auto_986754 ) ) ( not ( = ?auto_986752 ?auto_986755 ) ) ( not ( = ?auto_986752 ?auto_986756 ) ) ( not ( = ?auto_986752 ?auto_986757 ) ) ( not ( = ?auto_986752 ?auto_986758 ) ) ( not ( = ?auto_986752 ?auto_986760 ) ) ( not ( = ?auto_986753 ?auto_986754 ) ) ( not ( = ?auto_986753 ?auto_986755 ) ) ( not ( = ?auto_986753 ?auto_986756 ) ) ( not ( = ?auto_986753 ?auto_986757 ) ) ( not ( = ?auto_986753 ?auto_986758 ) ) ( not ( = ?auto_986753 ?auto_986760 ) ) ( not ( = ?auto_986754 ?auto_986755 ) ) ( not ( = ?auto_986754 ?auto_986756 ) ) ( not ( = ?auto_986754 ?auto_986757 ) ) ( not ( = ?auto_986754 ?auto_986758 ) ) ( not ( = ?auto_986754 ?auto_986760 ) ) ( not ( = ?auto_986755 ?auto_986756 ) ) ( not ( = ?auto_986755 ?auto_986757 ) ) ( not ( = ?auto_986755 ?auto_986758 ) ) ( not ( = ?auto_986755 ?auto_986760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_986756 ?auto_986757 ?auto_986758 )
      ( MAKE-8CRATE-VERIFY ?auto_986750 ?auto_986751 ?auto_986752 ?auto_986753 ?auto_986754 ?auto_986755 ?auto_986756 ?auto_986757 ?auto_986758 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990848 - SURFACE
      ?auto_990849 - SURFACE
      ?auto_990850 - SURFACE
      ?auto_990851 - SURFACE
      ?auto_990852 - SURFACE
      ?auto_990853 - SURFACE
      ?auto_990854 - SURFACE
      ?auto_990855 - SURFACE
      ?auto_990856 - SURFACE
      ?auto_990857 - SURFACE
    )
    :vars
    (
      ?auto_990858 - HOIST
      ?auto_990859 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_990858 ?auto_990859 ) ( SURFACE-AT ?auto_990856 ?auto_990859 ) ( CLEAR ?auto_990856 ) ( LIFTING ?auto_990858 ?auto_990857 ) ( IS-CRATE ?auto_990857 ) ( not ( = ?auto_990856 ?auto_990857 ) ) ( ON ?auto_990849 ?auto_990848 ) ( ON ?auto_990850 ?auto_990849 ) ( ON ?auto_990851 ?auto_990850 ) ( ON ?auto_990852 ?auto_990851 ) ( ON ?auto_990853 ?auto_990852 ) ( ON ?auto_990854 ?auto_990853 ) ( ON ?auto_990855 ?auto_990854 ) ( ON ?auto_990856 ?auto_990855 ) ( not ( = ?auto_990848 ?auto_990849 ) ) ( not ( = ?auto_990848 ?auto_990850 ) ) ( not ( = ?auto_990848 ?auto_990851 ) ) ( not ( = ?auto_990848 ?auto_990852 ) ) ( not ( = ?auto_990848 ?auto_990853 ) ) ( not ( = ?auto_990848 ?auto_990854 ) ) ( not ( = ?auto_990848 ?auto_990855 ) ) ( not ( = ?auto_990848 ?auto_990856 ) ) ( not ( = ?auto_990848 ?auto_990857 ) ) ( not ( = ?auto_990849 ?auto_990850 ) ) ( not ( = ?auto_990849 ?auto_990851 ) ) ( not ( = ?auto_990849 ?auto_990852 ) ) ( not ( = ?auto_990849 ?auto_990853 ) ) ( not ( = ?auto_990849 ?auto_990854 ) ) ( not ( = ?auto_990849 ?auto_990855 ) ) ( not ( = ?auto_990849 ?auto_990856 ) ) ( not ( = ?auto_990849 ?auto_990857 ) ) ( not ( = ?auto_990850 ?auto_990851 ) ) ( not ( = ?auto_990850 ?auto_990852 ) ) ( not ( = ?auto_990850 ?auto_990853 ) ) ( not ( = ?auto_990850 ?auto_990854 ) ) ( not ( = ?auto_990850 ?auto_990855 ) ) ( not ( = ?auto_990850 ?auto_990856 ) ) ( not ( = ?auto_990850 ?auto_990857 ) ) ( not ( = ?auto_990851 ?auto_990852 ) ) ( not ( = ?auto_990851 ?auto_990853 ) ) ( not ( = ?auto_990851 ?auto_990854 ) ) ( not ( = ?auto_990851 ?auto_990855 ) ) ( not ( = ?auto_990851 ?auto_990856 ) ) ( not ( = ?auto_990851 ?auto_990857 ) ) ( not ( = ?auto_990852 ?auto_990853 ) ) ( not ( = ?auto_990852 ?auto_990854 ) ) ( not ( = ?auto_990852 ?auto_990855 ) ) ( not ( = ?auto_990852 ?auto_990856 ) ) ( not ( = ?auto_990852 ?auto_990857 ) ) ( not ( = ?auto_990853 ?auto_990854 ) ) ( not ( = ?auto_990853 ?auto_990855 ) ) ( not ( = ?auto_990853 ?auto_990856 ) ) ( not ( = ?auto_990853 ?auto_990857 ) ) ( not ( = ?auto_990854 ?auto_990855 ) ) ( not ( = ?auto_990854 ?auto_990856 ) ) ( not ( = ?auto_990854 ?auto_990857 ) ) ( not ( = ?auto_990855 ?auto_990856 ) ) ( not ( = ?auto_990855 ?auto_990857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_990856 ?auto_990857 )
      ( MAKE-9CRATE-VERIFY ?auto_990848 ?auto_990849 ?auto_990850 ?auto_990851 ?auto_990852 ?auto_990853 ?auto_990854 ?auto_990855 ?auto_990856 ?auto_990857 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990928 - SURFACE
      ?auto_990929 - SURFACE
      ?auto_990930 - SURFACE
      ?auto_990931 - SURFACE
      ?auto_990932 - SURFACE
      ?auto_990933 - SURFACE
      ?auto_990934 - SURFACE
      ?auto_990935 - SURFACE
      ?auto_990936 - SURFACE
      ?auto_990937 - SURFACE
    )
    :vars
    (
      ?auto_990939 - HOIST
      ?auto_990938 - PLACE
      ?auto_990940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_990939 ?auto_990938 ) ( SURFACE-AT ?auto_990936 ?auto_990938 ) ( CLEAR ?auto_990936 ) ( IS-CRATE ?auto_990937 ) ( not ( = ?auto_990936 ?auto_990937 ) ) ( TRUCK-AT ?auto_990940 ?auto_990938 ) ( AVAILABLE ?auto_990939 ) ( IN ?auto_990937 ?auto_990940 ) ( ON ?auto_990936 ?auto_990935 ) ( not ( = ?auto_990935 ?auto_990936 ) ) ( not ( = ?auto_990935 ?auto_990937 ) ) ( ON ?auto_990929 ?auto_990928 ) ( ON ?auto_990930 ?auto_990929 ) ( ON ?auto_990931 ?auto_990930 ) ( ON ?auto_990932 ?auto_990931 ) ( ON ?auto_990933 ?auto_990932 ) ( ON ?auto_990934 ?auto_990933 ) ( ON ?auto_990935 ?auto_990934 ) ( not ( = ?auto_990928 ?auto_990929 ) ) ( not ( = ?auto_990928 ?auto_990930 ) ) ( not ( = ?auto_990928 ?auto_990931 ) ) ( not ( = ?auto_990928 ?auto_990932 ) ) ( not ( = ?auto_990928 ?auto_990933 ) ) ( not ( = ?auto_990928 ?auto_990934 ) ) ( not ( = ?auto_990928 ?auto_990935 ) ) ( not ( = ?auto_990928 ?auto_990936 ) ) ( not ( = ?auto_990928 ?auto_990937 ) ) ( not ( = ?auto_990929 ?auto_990930 ) ) ( not ( = ?auto_990929 ?auto_990931 ) ) ( not ( = ?auto_990929 ?auto_990932 ) ) ( not ( = ?auto_990929 ?auto_990933 ) ) ( not ( = ?auto_990929 ?auto_990934 ) ) ( not ( = ?auto_990929 ?auto_990935 ) ) ( not ( = ?auto_990929 ?auto_990936 ) ) ( not ( = ?auto_990929 ?auto_990937 ) ) ( not ( = ?auto_990930 ?auto_990931 ) ) ( not ( = ?auto_990930 ?auto_990932 ) ) ( not ( = ?auto_990930 ?auto_990933 ) ) ( not ( = ?auto_990930 ?auto_990934 ) ) ( not ( = ?auto_990930 ?auto_990935 ) ) ( not ( = ?auto_990930 ?auto_990936 ) ) ( not ( = ?auto_990930 ?auto_990937 ) ) ( not ( = ?auto_990931 ?auto_990932 ) ) ( not ( = ?auto_990931 ?auto_990933 ) ) ( not ( = ?auto_990931 ?auto_990934 ) ) ( not ( = ?auto_990931 ?auto_990935 ) ) ( not ( = ?auto_990931 ?auto_990936 ) ) ( not ( = ?auto_990931 ?auto_990937 ) ) ( not ( = ?auto_990932 ?auto_990933 ) ) ( not ( = ?auto_990932 ?auto_990934 ) ) ( not ( = ?auto_990932 ?auto_990935 ) ) ( not ( = ?auto_990932 ?auto_990936 ) ) ( not ( = ?auto_990932 ?auto_990937 ) ) ( not ( = ?auto_990933 ?auto_990934 ) ) ( not ( = ?auto_990933 ?auto_990935 ) ) ( not ( = ?auto_990933 ?auto_990936 ) ) ( not ( = ?auto_990933 ?auto_990937 ) ) ( not ( = ?auto_990934 ?auto_990935 ) ) ( not ( = ?auto_990934 ?auto_990936 ) ) ( not ( = ?auto_990934 ?auto_990937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990935 ?auto_990936 ?auto_990937 )
      ( MAKE-9CRATE-VERIFY ?auto_990928 ?auto_990929 ?auto_990930 ?auto_990931 ?auto_990932 ?auto_990933 ?auto_990934 ?auto_990935 ?auto_990936 ?auto_990937 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991018 - SURFACE
      ?auto_991019 - SURFACE
      ?auto_991020 - SURFACE
      ?auto_991021 - SURFACE
      ?auto_991022 - SURFACE
      ?auto_991023 - SURFACE
      ?auto_991024 - SURFACE
      ?auto_991025 - SURFACE
      ?auto_991026 - SURFACE
      ?auto_991027 - SURFACE
    )
    :vars
    (
      ?auto_991028 - HOIST
      ?auto_991029 - PLACE
      ?auto_991031 - TRUCK
      ?auto_991030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_991028 ?auto_991029 ) ( SURFACE-AT ?auto_991026 ?auto_991029 ) ( CLEAR ?auto_991026 ) ( IS-CRATE ?auto_991027 ) ( not ( = ?auto_991026 ?auto_991027 ) ) ( AVAILABLE ?auto_991028 ) ( IN ?auto_991027 ?auto_991031 ) ( ON ?auto_991026 ?auto_991025 ) ( not ( = ?auto_991025 ?auto_991026 ) ) ( not ( = ?auto_991025 ?auto_991027 ) ) ( TRUCK-AT ?auto_991031 ?auto_991030 ) ( not ( = ?auto_991030 ?auto_991029 ) ) ( ON ?auto_991019 ?auto_991018 ) ( ON ?auto_991020 ?auto_991019 ) ( ON ?auto_991021 ?auto_991020 ) ( ON ?auto_991022 ?auto_991021 ) ( ON ?auto_991023 ?auto_991022 ) ( ON ?auto_991024 ?auto_991023 ) ( ON ?auto_991025 ?auto_991024 ) ( not ( = ?auto_991018 ?auto_991019 ) ) ( not ( = ?auto_991018 ?auto_991020 ) ) ( not ( = ?auto_991018 ?auto_991021 ) ) ( not ( = ?auto_991018 ?auto_991022 ) ) ( not ( = ?auto_991018 ?auto_991023 ) ) ( not ( = ?auto_991018 ?auto_991024 ) ) ( not ( = ?auto_991018 ?auto_991025 ) ) ( not ( = ?auto_991018 ?auto_991026 ) ) ( not ( = ?auto_991018 ?auto_991027 ) ) ( not ( = ?auto_991019 ?auto_991020 ) ) ( not ( = ?auto_991019 ?auto_991021 ) ) ( not ( = ?auto_991019 ?auto_991022 ) ) ( not ( = ?auto_991019 ?auto_991023 ) ) ( not ( = ?auto_991019 ?auto_991024 ) ) ( not ( = ?auto_991019 ?auto_991025 ) ) ( not ( = ?auto_991019 ?auto_991026 ) ) ( not ( = ?auto_991019 ?auto_991027 ) ) ( not ( = ?auto_991020 ?auto_991021 ) ) ( not ( = ?auto_991020 ?auto_991022 ) ) ( not ( = ?auto_991020 ?auto_991023 ) ) ( not ( = ?auto_991020 ?auto_991024 ) ) ( not ( = ?auto_991020 ?auto_991025 ) ) ( not ( = ?auto_991020 ?auto_991026 ) ) ( not ( = ?auto_991020 ?auto_991027 ) ) ( not ( = ?auto_991021 ?auto_991022 ) ) ( not ( = ?auto_991021 ?auto_991023 ) ) ( not ( = ?auto_991021 ?auto_991024 ) ) ( not ( = ?auto_991021 ?auto_991025 ) ) ( not ( = ?auto_991021 ?auto_991026 ) ) ( not ( = ?auto_991021 ?auto_991027 ) ) ( not ( = ?auto_991022 ?auto_991023 ) ) ( not ( = ?auto_991022 ?auto_991024 ) ) ( not ( = ?auto_991022 ?auto_991025 ) ) ( not ( = ?auto_991022 ?auto_991026 ) ) ( not ( = ?auto_991022 ?auto_991027 ) ) ( not ( = ?auto_991023 ?auto_991024 ) ) ( not ( = ?auto_991023 ?auto_991025 ) ) ( not ( = ?auto_991023 ?auto_991026 ) ) ( not ( = ?auto_991023 ?auto_991027 ) ) ( not ( = ?auto_991024 ?auto_991025 ) ) ( not ( = ?auto_991024 ?auto_991026 ) ) ( not ( = ?auto_991024 ?auto_991027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991025 ?auto_991026 ?auto_991027 )
      ( MAKE-9CRATE-VERIFY ?auto_991018 ?auto_991019 ?auto_991020 ?auto_991021 ?auto_991022 ?auto_991023 ?auto_991024 ?auto_991025 ?auto_991026 ?auto_991027 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991117 - SURFACE
      ?auto_991118 - SURFACE
      ?auto_991119 - SURFACE
      ?auto_991120 - SURFACE
      ?auto_991121 - SURFACE
      ?auto_991122 - SURFACE
      ?auto_991123 - SURFACE
      ?auto_991124 - SURFACE
      ?auto_991125 - SURFACE
      ?auto_991126 - SURFACE
    )
    :vars
    (
      ?auto_991131 - HOIST
      ?auto_991127 - PLACE
      ?auto_991128 - TRUCK
      ?auto_991130 - PLACE
      ?auto_991129 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_991131 ?auto_991127 ) ( SURFACE-AT ?auto_991125 ?auto_991127 ) ( CLEAR ?auto_991125 ) ( IS-CRATE ?auto_991126 ) ( not ( = ?auto_991125 ?auto_991126 ) ) ( AVAILABLE ?auto_991131 ) ( ON ?auto_991125 ?auto_991124 ) ( not ( = ?auto_991124 ?auto_991125 ) ) ( not ( = ?auto_991124 ?auto_991126 ) ) ( TRUCK-AT ?auto_991128 ?auto_991130 ) ( not ( = ?auto_991130 ?auto_991127 ) ) ( HOIST-AT ?auto_991129 ?auto_991130 ) ( LIFTING ?auto_991129 ?auto_991126 ) ( not ( = ?auto_991131 ?auto_991129 ) ) ( ON ?auto_991118 ?auto_991117 ) ( ON ?auto_991119 ?auto_991118 ) ( ON ?auto_991120 ?auto_991119 ) ( ON ?auto_991121 ?auto_991120 ) ( ON ?auto_991122 ?auto_991121 ) ( ON ?auto_991123 ?auto_991122 ) ( ON ?auto_991124 ?auto_991123 ) ( not ( = ?auto_991117 ?auto_991118 ) ) ( not ( = ?auto_991117 ?auto_991119 ) ) ( not ( = ?auto_991117 ?auto_991120 ) ) ( not ( = ?auto_991117 ?auto_991121 ) ) ( not ( = ?auto_991117 ?auto_991122 ) ) ( not ( = ?auto_991117 ?auto_991123 ) ) ( not ( = ?auto_991117 ?auto_991124 ) ) ( not ( = ?auto_991117 ?auto_991125 ) ) ( not ( = ?auto_991117 ?auto_991126 ) ) ( not ( = ?auto_991118 ?auto_991119 ) ) ( not ( = ?auto_991118 ?auto_991120 ) ) ( not ( = ?auto_991118 ?auto_991121 ) ) ( not ( = ?auto_991118 ?auto_991122 ) ) ( not ( = ?auto_991118 ?auto_991123 ) ) ( not ( = ?auto_991118 ?auto_991124 ) ) ( not ( = ?auto_991118 ?auto_991125 ) ) ( not ( = ?auto_991118 ?auto_991126 ) ) ( not ( = ?auto_991119 ?auto_991120 ) ) ( not ( = ?auto_991119 ?auto_991121 ) ) ( not ( = ?auto_991119 ?auto_991122 ) ) ( not ( = ?auto_991119 ?auto_991123 ) ) ( not ( = ?auto_991119 ?auto_991124 ) ) ( not ( = ?auto_991119 ?auto_991125 ) ) ( not ( = ?auto_991119 ?auto_991126 ) ) ( not ( = ?auto_991120 ?auto_991121 ) ) ( not ( = ?auto_991120 ?auto_991122 ) ) ( not ( = ?auto_991120 ?auto_991123 ) ) ( not ( = ?auto_991120 ?auto_991124 ) ) ( not ( = ?auto_991120 ?auto_991125 ) ) ( not ( = ?auto_991120 ?auto_991126 ) ) ( not ( = ?auto_991121 ?auto_991122 ) ) ( not ( = ?auto_991121 ?auto_991123 ) ) ( not ( = ?auto_991121 ?auto_991124 ) ) ( not ( = ?auto_991121 ?auto_991125 ) ) ( not ( = ?auto_991121 ?auto_991126 ) ) ( not ( = ?auto_991122 ?auto_991123 ) ) ( not ( = ?auto_991122 ?auto_991124 ) ) ( not ( = ?auto_991122 ?auto_991125 ) ) ( not ( = ?auto_991122 ?auto_991126 ) ) ( not ( = ?auto_991123 ?auto_991124 ) ) ( not ( = ?auto_991123 ?auto_991125 ) ) ( not ( = ?auto_991123 ?auto_991126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991124 ?auto_991125 ?auto_991126 )
      ( MAKE-9CRATE-VERIFY ?auto_991117 ?auto_991118 ?auto_991119 ?auto_991120 ?auto_991121 ?auto_991122 ?auto_991123 ?auto_991124 ?auto_991125 ?auto_991126 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991225 - SURFACE
      ?auto_991226 - SURFACE
      ?auto_991227 - SURFACE
      ?auto_991228 - SURFACE
      ?auto_991229 - SURFACE
      ?auto_991230 - SURFACE
      ?auto_991231 - SURFACE
      ?auto_991232 - SURFACE
      ?auto_991233 - SURFACE
      ?auto_991234 - SURFACE
    )
    :vars
    (
      ?auto_991236 - HOIST
      ?auto_991238 - PLACE
      ?auto_991240 - TRUCK
      ?auto_991235 - PLACE
      ?auto_991237 - HOIST
      ?auto_991239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_991236 ?auto_991238 ) ( SURFACE-AT ?auto_991233 ?auto_991238 ) ( CLEAR ?auto_991233 ) ( IS-CRATE ?auto_991234 ) ( not ( = ?auto_991233 ?auto_991234 ) ) ( AVAILABLE ?auto_991236 ) ( ON ?auto_991233 ?auto_991232 ) ( not ( = ?auto_991232 ?auto_991233 ) ) ( not ( = ?auto_991232 ?auto_991234 ) ) ( TRUCK-AT ?auto_991240 ?auto_991235 ) ( not ( = ?auto_991235 ?auto_991238 ) ) ( HOIST-AT ?auto_991237 ?auto_991235 ) ( not ( = ?auto_991236 ?auto_991237 ) ) ( AVAILABLE ?auto_991237 ) ( SURFACE-AT ?auto_991234 ?auto_991235 ) ( ON ?auto_991234 ?auto_991239 ) ( CLEAR ?auto_991234 ) ( not ( = ?auto_991233 ?auto_991239 ) ) ( not ( = ?auto_991234 ?auto_991239 ) ) ( not ( = ?auto_991232 ?auto_991239 ) ) ( ON ?auto_991226 ?auto_991225 ) ( ON ?auto_991227 ?auto_991226 ) ( ON ?auto_991228 ?auto_991227 ) ( ON ?auto_991229 ?auto_991228 ) ( ON ?auto_991230 ?auto_991229 ) ( ON ?auto_991231 ?auto_991230 ) ( ON ?auto_991232 ?auto_991231 ) ( not ( = ?auto_991225 ?auto_991226 ) ) ( not ( = ?auto_991225 ?auto_991227 ) ) ( not ( = ?auto_991225 ?auto_991228 ) ) ( not ( = ?auto_991225 ?auto_991229 ) ) ( not ( = ?auto_991225 ?auto_991230 ) ) ( not ( = ?auto_991225 ?auto_991231 ) ) ( not ( = ?auto_991225 ?auto_991232 ) ) ( not ( = ?auto_991225 ?auto_991233 ) ) ( not ( = ?auto_991225 ?auto_991234 ) ) ( not ( = ?auto_991225 ?auto_991239 ) ) ( not ( = ?auto_991226 ?auto_991227 ) ) ( not ( = ?auto_991226 ?auto_991228 ) ) ( not ( = ?auto_991226 ?auto_991229 ) ) ( not ( = ?auto_991226 ?auto_991230 ) ) ( not ( = ?auto_991226 ?auto_991231 ) ) ( not ( = ?auto_991226 ?auto_991232 ) ) ( not ( = ?auto_991226 ?auto_991233 ) ) ( not ( = ?auto_991226 ?auto_991234 ) ) ( not ( = ?auto_991226 ?auto_991239 ) ) ( not ( = ?auto_991227 ?auto_991228 ) ) ( not ( = ?auto_991227 ?auto_991229 ) ) ( not ( = ?auto_991227 ?auto_991230 ) ) ( not ( = ?auto_991227 ?auto_991231 ) ) ( not ( = ?auto_991227 ?auto_991232 ) ) ( not ( = ?auto_991227 ?auto_991233 ) ) ( not ( = ?auto_991227 ?auto_991234 ) ) ( not ( = ?auto_991227 ?auto_991239 ) ) ( not ( = ?auto_991228 ?auto_991229 ) ) ( not ( = ?auto_991228 ?auto_991230 ) ) ( not ( = ?auto_991228 ?auto_991231 ) ) ( not ( = ?auto_991228 ?auto_991232 ) ) ( not ( = ?auto_991228 ?auto_991233 ) ) ( not ( = ?auto_991228 ?auto_991234 ) ) ( not ( = ?auto_991228 ?auto_991239 ) ) ( not ( = ?auto_991229 ?auto_991230 ) ) ( not ( = ?auto_991229 ?auto_991231 ) ) ( not ( = ?auto_991229 ?auto_991232 ) ) ( not ( = ?auto_991229 ?auto_991233 ) ) ( not ( = ?auto_991229 ?auto_991234 ) ) ( not ( = ?auto_991229 ?auto_991239 ) ) ( not ( = ?auto_991230 ?auto_991231 ) ) ( not ( = ?auto_991230 ?auto_991232 ) ) ( not ( = ?auto_991230 ?auto_991233 ) ) ( not ( = ?auto_991230 ?auto_991234 ) ) ( not ( = ?auto_991230 ?auto_991239 ) ) ( not ( = ?auto_991231 ?auto_991232 ) ) ( not ( = ?auto_991231 ?auto_991233 ) ) ( not ( = ?auto_991231 ?auto_991234 ) ) ( not ( = ?auto_991231 ?auto_991239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991232 ?auto_991233 ?auto_991234 )
      ( MAKE-9CRATE-VERIFY ?auto_991225 ?auto_991226 ?auto_991227 ?auto_991228 ?auto_991229 ?auto_991230 ?auto_991231 ?auto_991232 ?auto_991233 ?auto_991234 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991334 - SURFACE
      ?auto_991335 - SURFACE
      ?auto_991336 - SURFACE
      ?auto_991337 - SURFACE
      ?auto_991338 - SURFACE
      ?auto_991339 - SURFACE
      ?auto_991340 - SURFACE
      ?auto_991341 - SURFACE
      ?auto_991342 - SURFACE
      ?auto_991343 - SURFACE
    )
    :vars
    (
      ?auto_991349 - HOIST
      ?auto_991346 - PLACE
      ?auto_991345 - PLACE
      ?auto_991347 - HOIST
      ?auto_991344 - SURFACE
      ?auto_991348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_991349 ?auto_991346 ) ( SURFACE-AT ?auto_991342 ?auto_991346 ) ( CLEAR ?auto_991342 ) ( IS-CRATE ?auto_991343 ) ( not ( = ?auto_991342 ?auto_991343 ) ) ( AVAILABLE ?auto_991349 ) ( ON ?auto_991342 ?auto_991341 ) ( not ( = ?auto_991341 ?auto_991342 ) ) ( not ( = ?auto_991341 ?auto_991343 ) ) ( not ( = ?auto_991345 ?auto_991346 ) ) ( HOIST-AT ?auto_991347 ?auto_991345 ) ( not ( = ?auto_991349 ?auto_991347 ) ) ( AVAILABLE ?auto_991347 ) ( SURFACE-AT ?auto_991343 ?auto_991345 ) ( ON ?auto_991343 ?auto_991344 ) ( CLEAR ?auto_991343 ) ( not ( = ?auto_991342 ?auto_991344 ) ) ( not ( = ?auto_991343 ?auto_991344 ) ) ( not ( = ?auto_991341 ?auto_991344 ) ) ( TRUCK-AT ?auto_991348 ?auto_991346 ) ( ON ?auto_991335 ?auto_991334 ) ( ON ?auto_991336 ?auto_991335 ) ( ON ?auto_991337 ?auto_991336 ) ( ON ?auto_991338 ?auto_991337 ) ( ON ?auto_991339 ?auto_991338 ) ( ON ?auto_991340 ?auto_991339 ) ( ON ?auto_991341 ?auto_991340 ) ( not ( = ?auto_991334 ?auto_991335 ) ) ( not ( = ?auto_991334 ?auto_991336 ) ) ( not ( = ?auto_991334 ?auto_991337 ) ) ( not ( = ?auto_991334 ?auto_991338 ) ) ( not ( = ?auto_991334 ?auto_991339 ) ) ( not ( = ?auto_991334 ?auto_991340 ) ) ( not ( = ?auto_991334 ?auto_991341 ) ) ( not ( = ?auto_991334 ?auto_991342 ) ) ( not ( = ?auto_991334 ?auto_991343 ) ) ( not ( = ?auto_991334 ?auto_991344 ) ) ( not ( = ?auto_991335 ?auto_991336 ) ) ( not ( = ?auto_991335 ?auto_991337 ) ) ( not ( = ?auto_991335 ?auto_991338 ) ) ( not ( = ?auto_991335 ?auto_991339 ) ) ( not ( = ?auto_991335 ?auto_991340 ) ) ( not ( = ?auto_991335 ?auto_991341 ) ) ( not ( = ?auto_991335 ?auto_991342 ) ) ( not ( = ?auto_991335 ?auto_991343 ) ) ( not ( = ?auto_991335 ?auto_991344 ) ) ( not ( = ?auto_991336 ?auto_991337 ) ) ( not ( = ?auto_991336 ?auto_991338 ) ) ( not ( = ?auto_991336 ?auto_991339 ) ) ( not ( = ?auto_991336 ?auto_991340 ) ) ( not ( = ?auto_991336 ?auto_991341 ) ) ( not ( = ?auto_991336 ?auto_991342 ) ) ( not ( = ?auto_991336 ?auto_991343 ) ) ( not ( = ?auto_991336 ?auto_991344 ) ) ( not ( = ?auto_991337 ?auto_991338 ) ) ( not ( = ?auto_991337 ?auto_991339 ) ) ( not ( = ?auto_991337 ?auto_991340 ) ) ( not ( = ?auto_991337 ?auto_991341 ) ) ( not ( = ?auto_991337 ?auto_991342 ) ) ( not ( = ?auto_991337 ?auto_991343 ) ) ( not ( = ?auto_991337 ?auto_991344 ) ) ( not ( = ?auto_991338 ?auto_991339 ) ) ( not ( = ?auto_991338 ?auto_991340 ) ) ( not ( = ?auto_991338 ?auto_991341 ) ) ( not ( = ?auto_991338 ?auto_991342 ) ) ( not ( = ?auto_991338 ?auto_991343 ) ) ( not ( = ?auto_991338 ?auto_991344 ) ) ( not ( = ?auto_991339 ?auto_991340 ) ) ( not ( = ?auto_991339 ?auto_991341 ) ) ( not ( = ?auto_991339 ?auto_991342 ) ) ( not ( = ?auto_991339 ?auto_991343 ) ) ( not ( = ?auto_991339 ?auto_991344 ) ) ( not ( = ?auto_991340 ?auto_991341 ) ) ( not ( = ?auto_991340 ?auto_991342 ) ) ( not ( = ?auto_991340 ?auto_991343 ) ) ( not ( = ?auto_991340 ?auto_991344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991341 ?auto_991342 ?auto_991343 )
      ( MAKE-9CRATE-VERIFY ?auto_991334 ?auto_991335 ?auto_991336 ?auto_991337 ?auto_991338 ?auto_991339 ?auto_991340 ?auto_991341 ?auto_991342 ?auto_991343 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991443 - SURFACE
      ?auto_991444 - SURFACE
      ?auto_991445 - SURFACE
      ?auto_991446 - SURFACE
      ?auto_991447 - SURFACE
      ?auto_991448 - SURFACE
      ?auto_991449 - SURFACE
      ?auto_991450 - SURFACE
      ?auto_991451 - SURFACE
      ?auto_991452 - SURFACE
    )
    :vars
    (
      ?auto_991454 - HOIST
      ?auto_991457 - PLACE
      ?auto_991453 - PLACE
      ?auto_991455 - HOIST
      ?auto_991456 - SURFACE
      ?auto_991458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_991454 ?auto_991457 ) ( IS-CRATE ?auto_991452 ) ( not ( = ?auto_991451 ?auto_991452 ) ) ( not ( = ?auto_991450 ?auto_991451 ) ) ( not ( = ?auto_991450 ?auto_991452 ) ) ( not ( = ?auto_991453 ?auto_991457 ) ) ( HOIST-AT ?auto_991455 ?auto_991453 ) ( not ( = ?auto_991454 ?auto_991455 ) ) ( AVAILABLE ?auto_991455 ) ( SURFACE-AT ?auto_991452 ?auto_991453 ) ( ON ?auto_991452 ?auto_991456 ) ( CLEAR ?auto_991452 ) ( not ( = ?auto_991451 ?auto_991456 ) ) ( not ( = ?auto_991452 ?auto_991456 ) ) ( not ( = ?auto_991450 ?auto_991456 ) ) ( TRUCK-AT ?auto_991458 ?auto_991457 ) ( SURFACE-AT ?auto_991450 ?auto_991457 ) ( CLEAR ?auto_991450 ) ( LIFTING ?auto_991454 ?auto_991451 ) ( IS-CRATE ?auto_991451 ) ( ON ?auto_991444 ?auto_991443 ) ( ON ?auto_991445 ?auto_991444 ) ( ON ?auto_991446 ?auto_991445 ) ( ON ?auto_991447 ?auto_991446 ) ( ON ?auto_991448 ?auto_991447 ) ( ON ?auto_991449 ?auto_991448 ) ( ON ?auto_991450 ?auto_991449 ) ( not ( = ?auto_991443 ?auto_991444 ) ) ( not ( = ?auto_991443 ?auto_991445 ) ) ( not ( = ?auto_991443 ?auto_991446 ) ) ( not ( = ?auto_991443 ?auto_991447 ) ) ( not ( = ?auto_991443 ?auto_991448 ) ) ( not ( = ?auto_991443 ?auto_991449 ) ) ( not ( = ?auto_991443 ?auto_991450 ) ) ( not ( = ?auto_991443 ?auto_991451 ) ) ( not ( = ?auto_991443 ?auto_991452 ) ) ( not ( = ?auto_991443 ?auto_991456 ) ) ( not ( = ?auto_991444 ?auto_991445 ) ) ( not ( = ?auto_991444 ?auto_991446 ) ) ( not ( = ?auto_991444 ?auto_991447 ) ) ( not ( = ?auto_991444 ?auto_991448 ) ) ( not ( = ?auto_991444 ?auto_991449 ) ) ( not ( = ?auto_991444 ?auto_991450 ) ) ( not ( = ?auto_991444 ?auto_991451 ) ) ( not ( = ?auto_991444 ?auto_991452 ) ) ( not ( = ?auto_991444 ?auto_991456 ) ) ( not ( = ?auto_991445 ?auto_991446 ) ) ( not ( = ?auto_991445 ?auto_991447 ) ) ( not ( = ?auto_991445 ?auto_991448 ) ) ( not ( = ?auto_991445 ?auto_991449 ) ) ( not ( = ?auto_991445 ?auto_991450 ) ) ( not ( = ?auto_991445 ?auto_991451 ) ) ( not ( = ?auto_991445 ?auto_991452 ) ) ( not ( = ?auto_991445 ?auto_991456 ) ) ( not ( = ?auto_991446 ?auto_991447 ) ) ( not ( = ?auto_991446 ?auto_991448 ) ) ( not ( = ?auto_991446 ?auto_991449 ) ) ( not ( = ?auto_991446 ?auto_991450 ) ) ( not ( = ?auto_991446 ?auto_991451 ) ) ( not ( = ?auto_991446 ?auto_991452 ) ) ( not ( = ?auto_991446 ?auto_991456 ) ) ( not ( = ?auto_991447 ?auto_991448 ) ) ( not ( = ?auto_991447 ?auto_991449 ) ) ( not ( = ?auto_991447 ?auto_991450 ) ) ( not ( = ?auto_991447 ?auto_991451 ) ) ( not ( = ?auto_991447 ?auto_991452 ) ) ( not ( = ?auto_991447 ?auto_991456 ) ) ( not ( = ?auto_991448 ?auto_991449 ) ) ( not ( = ?auto_991448 ?auto_991450 ) ) ( not ( = ?auto_991448 ?auto_991451 ) ) ( not ( = ?auto_991448 ?auto_991452 ) ) ( not ( = ?auto_991448 ?auto_991456 ) ) ( not ( = ?auto_991449 ?auto_991450 ) ) ( not ( = ?auto_991449 ?auto_991451 ) ) ( not ( = ?auto_991449 ?auto_991452 ) ) ( not ( = ?auto_991449 ?auto_991456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991450 ?auto_991451 ?auto_991452 )
      ( MAKE-9CRATE-VERIFY ?auto_991443 ?auto_991444 ?auto_991445 ?auto_991446 ?auto_991447 ?auto_991448 ?auto_991449 ?auto_991450 ?auto_991451 ?auto_991452 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_991552 - SURFACE
      ?auto_991553 - SURFACE
      ?auto_991554 - SURFACE
      ?auto_991555 - SURFACE
      ?auto_991556 - SURFACE
      ?auto_991557 - SURFACE
      ?auto_991558 - SURFACE
      ?auto_991559 - SURFACE
      ?auto_991560 - SURFACE
      ?auto_991561 - SURFACE
    )
    :vars
    (
      ?auto_991567 - HOIST
      ?auto_991564 - PLACE
      ?auto_991562 - PLACE
      ?auto_991563 - HOIST
      ?auto_991565 - SURFACE
      ?auto_991566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_991567 ?auto_991564 ) ( IS-CRATE ?auto_991561 ) ( not ( = ?auto_991560 ?auto_991561 ) ) ( not ( = ?auto_991559 ?auto_991560 ) ) ( not ( = ?auto_991559 ?auto_991561 ) ) ( not ( = ?auto_991562 ?auto_991564 ) ) ( HOIST-AT ?auto_991563 ?auto_991562 ) ( not ( = ?auto_991567 ?auto_991563 ) ) ( AVAILABLE ?auto_991563 ) ( SURFACE-AT ?auto_991561 ?auto_991562 ) ( ON ?auto_991561 ?auto_991565 ) ( CLEAR ?auto_991561 ) ( not ( = ?auto_991560 ?auto_991565 ) ) ( not ( = ?auto_991561 ?auto_991565 ) ) ( not ( = ?auto_991559 ?auto_991565 ) ) ( TRUCK-AT ?auto_991566 ?auto_991564 ) ( SURFACE-AT ?auto_991559 ?auto_991564 ) ( CLEAR ?auto_991559 ) ( IS-CRATE ?auto_991560 ) ( AVAILABLE ?auto_991567 ) ( IN ?auto_991560 ?auto_991566 ) ( ON ?auto_991553 ?auto_991552 ) ( ON ?auto_991554 ?auto_991553 ) ( ON ?auto_991555 ?auto_991554 ) ( ON ?auto_991556 ?auto_991555 ) ( ON ?auto_991557 ?auto_991556 ) ( ON ?auto_991558 ?auto_991557 ) ( ON ?auto_991559 ?auto_991558 ) ( not ( = ?auto_991552 ?auto_991553 ) ) ( not ( = ?auto_991552 ?auto_991554 ) ) ( not ( = ?auto_991552 ?auto_991555 ) ) ( not ( = ?auto_991552 ?auto_991556 ) ) ( not ( = ?auto_991552 ?auto_991557 ) ) ( not ( = ?auto_991552 ?auto_991558 ) ) ( not ( = ?auto_991552 ?auto_991559 ) ) ( not ( = ?auto_991552 ?auto_991560 ) ) ( not ( = ?auto_991552 ?auto_991561 ) ) ( not ( = ?auto_991552 ?auto_991565 ) ) ( not ( = ?auto_991553 ?auto_991554 ) ) ( not ( = ?auto_991553 ?auto_991555 ) ) ( not ( = ?auto_991553 ?auto_991556 ) ) ( not ( = ?auto_991553 ?auto_991557 ) ) ( not ( = ?auto_991553 ?auto_991558 ) ) ( not ( = ?auto_991553 ?auto_991559 ) ) ( not ( = ?auto_991553 ?auto_991560 ) ) ( not ( = ?auto_991553 ?auto_991561 ) ) ( not ( = ?auto_991553 ?auto_991565 ) ) ( not ( = ?auto_991554 ?auto_991555 ) ) ( not ( = ?auto_991554 ?auto_991556 ) ) ( not ( = ?auto_991554 ?auto_991557 ) ) ( not ( = ?auto_991554 ?auto_991558 ) ) ( not ( = ?auto_991554 ?auto_991559 ) ) ( not ( = ?auto_991554 ?auto_991560 ) ) ( not ( = ?auto_991554 ?auto_991561 ) ) ( not ( = ?auto_991554 ?auto_991565 ) ) ( not ( = ?auto_991555 ?auto_991556 ) ) ( not ( = ?auto_991555 ?auto_991557 ) ) ( not ( = ?auto_991555 ?auto_991558 ) ) ( not ( = ?auto_991555 ?auto_991559 ) ) ( not ( = ?auto_991555 ?auto_991560 ) ) ( not ( = ?auto_991555 ?auto_991561 ) ) ( not ( = ?auto_991555 ?auto_991565 ) ) ( not ( = ?auto_991556 ?auto_991557 ) ) ( not ( = ?auto_991556 ?auto_991558 ) ) ( not ( = ?auto_991556 ?auto_991559 ) ) ( not ( = ?auto_991556 ?auto_991560 ) ) ( not ( = ?auto_991556 ?auto_991561 ) ) ( not ( = ?auto_991556 ?auto_991565 ) ) ( not ( = ?auto_991557 ?auto_991558 ) ) ( not ( = ?auto_991557 ?auto_991559 ) ) ( not ( = ?auto_991557 ?auto_991560 ) ) ( not ( = ?auto_991557 ?auto_991561 ) ) ( not ( = ?auto_991557 ?auto_991565 ) ) ( not ( = ?auto_991558 ?auto_991559 ) ) ( not ( = ?auto_991558 ?auto_991560 ) ) ( not ( = ?auto_991558 ?auto_991561 ) ) ( not ( = ?auto_991558 ?auto_991565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_991559 ?auto_991560 ?auto_991561 )
      ( MAKE-9CRATE-VERIFY ?auto_991552 ?auto_991553 ?auto_991554 ?auto_991555 ?auto_991556 ?auto_991557 ?auto_991558 ?auto_991559 ?auto_991560 ?auto_991561 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997083 - SURFACE
      ?auto_997084 - SURFACE
      ?auto_997085 - SURFACE
      ?auto_997086 - SURFACE
      ?auto_997087 - SURFACE
      ?auto_997088 - SURFACE
      ?auto_997089 - SURFACE
      ?auto_997090 - SURFACE
      ?auto_997091 - SURFACE
      ?auto_997092 - SURFACE
      ?auto_997093 - SURFACE
    )
    :vars
    (
      ?auto_997094 - HOIST
      ?auto_997095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_997094 ?auto_997095 ) ( SURFACE-AT ?auto_997092 ?auto_997095 ) ( CLEAR ?auto_997092 ) ( LIFTING ?auto_997094 ?auto_997093 ) ( IS-CRATE ?auto_997093 ) ( not ( = ?auto_997092 ?auto_997093 ) ) ( ON ?auto_997084 ?auto_997083 ) ( ON ?auto_997085 ?auto_997084 ) ( ON ?auto_997086 ?auto_997085 ) ( ON ?auto_997087 ?auto_997086 ) ( ON ?auto_997088 ?auto_997087 ) ( ON ?auto_997089 ?auto_997088 ) ( ON ?auto_997090 ?auto_997089 ) ( ON ?auto_997091 ?auto_997090 ) ( ON ?auto_997092 ?auto_997091 ) ( not ( = ?auto_997083 ?auto_997084 ) ) ( not ( = ?auto_997083 ?auto_997085 ) ) ( not ( = ?auto_997083 ?auto_997086 ) ) ( not ( = ?auto_997083 ?auto_997087 ) ) ( not ( = ?auto_997083 ?auto_997088 ) ) ( not ( = ?auto_997083 ?auto_997089 ) ) ( not ( = ?auto_997083 ?auto_997090 ) ) ( not ( = ?auto_997083 ?auto_997091 ) ) ( not ( = ?auto_997083 ?auto_997092 ) ) ( not ( = ?auto_997083 ?auto_997093 ) ) ( not ( = ?auto_997084 ?auto_997085 ) ) ( not ( = ?auto_997084 ?auto_997086 ) ) ( not ( = ?auto_997084 ?auto_997087 ) ) ( not ( = ?auto_997084 ?auto_997088 ) ) ( not ( = ?auto_997084 ?auto_997089 ) ) ( not ( = ?auto_997084 ?auto_997090 ) ) ( not ( = ?auto_997084 ?auto_997091 ) ) ( not ( = ?auto_997084 ?auto_997092 ) ) ( not ( = ?auto_997084 ?auto_997093 ) ) ( not ( = ?auto_997085 ?auto_997086 ) ) ( not ( = ?auto_997085 ?auto_997087 ) ) ( not ( = ?auto_997085 ?auto_997088 ) ) ( not ( = ?auto_997085 ?auto_997089 ) ) ( not ( = ?auto_997085 ?auto_997090 ) ) ( not ( = ?auto_997085 ?auto_997091 ) ) ( not ( = ?auto_997085 ?auto_997092 ) ) ( not ( = ?auto_997085 ?auto_997093 ) ) ( not ( = ?auto_997086 ?auto_997087 ) ) ( not ( = ?auto_997086 ?auto_997088 ) ) ( not ( = ?auto_997086 ?auto_997089 ) ) ( not ( = ?auto_997086 ?auto_997090 ) ) ( not ( = ?auto_997086 ?auto_997091 ) ) ( not ( = ?auto_997086 ?auto_997092 ) ) ( not ( = ?auto_997086 ?auto_997093 ) ) ( not ( = ?auto_997087 ?auto_997088 ) ) ( not ( = ?auto_997087 ?auto_997089 ) ) ( not ( = ?auto_997087 ?auto_997090 ) ) ( not ( = ?auto_997087 ?auto_997091 ) ) ( not ( = ?auto_997087 ?auto_997092 ) ) ( not ( = ?auto_997087 ?auto_997093 ) ) ( not ( = ?auto_997088 ?auto_997089 ) ) ( not ( = ?auto_997088 ?auto_997090 ) ) ( not ( = ?auto_997088 ?auto_997091 ) ) ( not ( = ?auto_997088 ?auto_997092 ) ) ( not ( = ?auto_997088 ?auto_997093 ) ) ( not ( = ?auto_997089 ?auto_997090 ) ) ( not ( = ?auto_997089 ?auto_997091 ) ) ( not ( = ?auto_997089 ?auto_997092 ) ) ( not ( = ?auto_997089 ?auto_997093 ) ) ( not ( = ?auto_997090 ?auto_997091 ) ) ( not ( = ?auto_997090 ?auto_997092 ) ) ( not ( = ?auto_997090 ?auto_997093 ) ) ( not ( = ?auto_997091 ?auto_997092 ) ) ( not ( = ?auto_997091 ?auto_997093 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_997092 ?auto_997093 )
      ( MAKE-10CRATE-VERIFY ?auto_997083 ?auto_997084 ?auto_997085 ?auto_997086 ?auto_997087 ?auto_997088 ?auto_997089 ?auto_997090 ?auto_997091 ?auto_997092 ?auto_997093 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997177 - SURFACE
      ?auto_997178 - SURFACE
      ?auto_997179 - SURFACE
      ?auto_997180 - SURFACE
      ?auto_997181 - SURFACE
      ?auto_997182 - SURFACE
      ?auto_997183 - SURFACE
      ?auto_997184 - SURFACE
      ?auto_997185 - SURFACE
      ?auto_997186 - SURFACE
      ?auto_997187 - SURFACE
    )
    :vars
    (
      ?auto_997189 - HOIST
      ?auto_997188 - PLACE
      ?auto_997190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997189 ?auto_997188 ) ( SURFACE-AT ?auto_997186 ?auto_997188 ) ( CLEAR ?auto_997186 ) ( IS-CRATE ?auto_997187 ) ( not ( = ?auto_997186 ?auto_997187 ) ) ( TRUCK-AT ?auto_997190 ?auto_997188 ) ( AVAILABLE ?auto_997189 ) ( IN ?auto_997187 ?auto_997190 ) ( ON ?auto_997186 ?auto_997185 ) ( not ( = ?auto_997185 ?auto_997186 ) ) ( not ( = ?auto_997185 ?auto_997187 ) ) ( ON ?auto_997178 ?auto_997177 ) ( ON ?auto_997179 ?auto_997178 ) ( ON ?auto_997180 ?auto_997179 ) ( ON ?auto_997181 ?auto_997180 ) ( ON ?auto_997182 ?auto_997181 ) ( ON ?auto_997183 ?auto_997182 ) ( ON ?auto_997184 ?auto_997183 ) ( ON ?auto_997185 ?auto_997184 ) ( not ( = ?auto_997177 ?auto_997178 ) ) ( not ( = ?auto_997177 ?auto_997179 ) ) ( not ( = ?auto_997177 ?auto_997180 ) ) ( not ( = ?auto_997177 ?auto_997181 ) ) ( not ( = ?auto_997177 ?auto_997182 ) ) ( not ( = ?auto_997177 ?auto_997183 ) ) ( not ( = ?auto_997177 ?auto_997184 ) ) ( not ( = ?auto_997177 ?auto_997185 ) ) ( not ( = ?auto_997177 ?auto_997186 ) ) ( not ( = ?auto_997177 ?auto_997187 ) ) ( not ( = ?auto_997178 ?auto_997179 ) ) ( not ( = ?auto_997178 ?auto_997180 ) ) ( not ( = ?auto_997178 ?auto_997181 ) ) ( not ( = ?auto_997178 ?auto_997182 ) ) ( not ( = ?auto_997178 ?auto_997183 ) ) ( not ( = ?auto_997178 ?auto_997184 ) ) ( not ( = ?auto_997178 ?auto_997185 ) ) ( not ( = ?auto_997178 ?auto_997186 ) ) ( not ( = ?auto_997178 ?auto_997187 ) ) ( not ( = ?auto_997179 ?auto_997180 ) ) ( not ( = ?auto_997179 ?auto_997181 ) ) ( not ( = ?auto_997179 ?auto_997182 ) ) ( not ( = ?auto_997179 ?auto_997183 ) ) ( not ( = ?auto_997179 ?auto_997184 ) ) ( not ( = ?auto_997179 ?auto_997185 ) ) ( not ( = ?auto_997179 ?auto_997186 ) ) ( not ( = ?auto_997179 ?auto_997187 ) ) ( not ( = ?auto_997180 ?auto_997181 ) ) ( not ( = ?auto_997180 ?auto_997182 ) ) ( not ( = ?auto_997180 ?auto_997183 ) ) ( not ( = ?auto_997180 ?auto_997184 ) ) ( not ( = ?auto_997180 ?auto_997185 ) ) ( not ( = ?auto_997180 ?auto_997186 ) ) ( not ( = ?auto_997180 ?auto_997187 ) ) ( not ( = ?auto_997181 ?auto_997182 ) ) ( not ( = ?auto_997181 ?auto_997183 ) ) ( not ( = ?auto_997181 ?auto_997184 ) ) ( not ( = ?auto_997181 ?auto_997185 ) ) ( not ( = ?auto_997181 ?auto_997186 ) ) ( not ( = ?auto_997181 ?auto_997187 ) ) ( not ( = ?auto_997182 ?auto_997183 ) ) ( not ( = ?auto_997182 ?auto_997184 ) ) ( not ( = ?auto_997182 ?auto_997185 ) ) ( not ( = ?auto_997182 ?auto_997186 ) ) ( not ( = ?auto_997182 ?auto_997187 ) ) ( not ( = ?auto_997183 ?auto_997184 ) ) ( not ( = ?auto_997183 ?auto_997185 ) ) ( not ( = ?auto_997183 ?auto_997186 ) ) ( not ( = ?auto_997183 ?auto_997187 ) ) ( not ( = ?auto_997184 ?auto_997185 ) ) ( not ( = ?auto_997184 ?auto_997186 ) ) ( not ( = ?auto_997184 ?auto_997187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997185 ?auto_997186 ?auto_997187 )
      ( MAKE-10CRATE-VERIFY ?auto_997177 ?auto_997178 ?auto_997179 ?auto_997180 ?auto_997181 ?auto_997182 ?auto_997183 ?auto_997184 ?auto_997185 ?auto_997186 ?auto_997187 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997282 - SURFACE
      ?auto_997283 - SURFACE
      ?auto_997284 - SURFACE
      ?auto_997285 - SURFACE
      ?auto_997286 - SURFACE
      ?auto_997287 - SURFACE
      ?auto_997288 - SURFACE
      ?auto_997289 - SURFACE
      ?auto_997290 - SURFACE
      ?auto_997291 - SURFACE
      ?auto_997292 - SURFACE
    )
    :vars
    (
      ?auto_997295 - HOIST
      ?auto_997296 - PLACE
      ?auto_997294 - TRUCK
      ?auto_997293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_997295 ?auto_997296 ) ( SURFACE-AT ?auto_997291 ?auto_997296 ) ( CLEAR ?auto_997291 ) ( IS-CRATE ?auto_997292 ) ( not ( = ?auto_997291 ?auto_997292 ) ) ( AVAILABLE ?auto_997295 ) ( IN ?auto_997292 ?auto_997294 ) ( ON ?auto_997291 ?auto_997290 ) ( not ( = ?auto_997290 ?auto_997291 ) ) ( not ( = ?auto_997290 ?auto_997292 ) ) ( TRUCK-AT ?auto_997294 ?auto_997293 ) ( not ( = ?auto_997293 ?auto_997296 ) ) ( ON ?auto_997283 ?auto_997282 ) ( ON ?auto_997284 ?auto_997283 ) ( ON ?auto_997285 ?auto_997284 ) ( ON ?auto_997286 ?auto_997285 ) ( ON ?auto_997287 ?auto_997286 ) ( ON ?auto_997288 ?auto_997287 ) ( ON ?auto_997289 ?auto_997288 ) ( ON ?auto_997290 ?auto_997289 ) ( not ( = ?auto_997282 ?auto_997283 ) ) ( not ( = ?auto_997282 ?auto_997284 ) ) ( not ( = ?auto_997282 ?auto_997285 ) ) ( not ( = ?auto_997282 ?auto_997286 ) ) ( not ( = ?auto_997282 ?auto_997287 ) ) ( not ( = ?auto_997282 ?auto_997288 ) ) ( not ( = ?auto_997282 ?auto_997289 ) ) ( not ( = ?auto_997282 ?auto_997290 ) ) ( not ( = ?auto_997282 ?auto_997291 ) ) ( not ( = ?auto_997282 ?auto_997292 ) ) ( not ( = ?auto_997283 ?auto_997284 ) ) ( not ( = ?auto_997283 ?auto_997285 ) ) ( not ( = ?auto_997283 ?auto_997286 ) ) ( not ( = ?auto_997283 ?auto_997287 ) ) ( not ( = ?auto_997283 ?auto_997288 ) ) ( not ( = ?auto_997283 ?auto_997289 ) ) ( not ( = ?auto_997283 ?auto_997290 ) ) ( not ( = ?auto_997283 ?auto_997291 ) ) ( not ( = ?auto_997283 ?auto_997292 ) ) ( not ( = ?auto_997284 ?auto_997285 ) ) ( not ( = ?auto_997284 ?auto_997286 ) ) ( not ( = ?auto_997284 ?auto_997287 ) ) ( not ( = ?auto_997284 ?auto_997288 ) ) ( not ( = ?auto_997284 ?auto_997289 ) ) ( not ( = ?auto_997284 ?auto_997290 ) ) ( not ( = ?auto_997284 ?auto_997291 ) ) ( not ( = ?auto_997284 ?auto_997292 ) ) ( not ( = ?auto_997285 ?auto_997286 ) ) ( not ( = ?auto_997285 ?auto_997287 ) ) ( not ( = ?auto_997285 ?auto_997288 ) ) ( not ( = ?auto_997285 ?auto_997289 ) ) ( not ( = ?auto_997285 ?auto_997290 ) ) ( not ( = ?auto_997285 ?auto_997291 ) ) ( not ( = ?auto_997285 ?auto_997292 ) ) ( not ( = ?auto_997286 ?auto_997287 ) ) ( not ( = ?auto_997286 ?auto_997288 ) ) ( not ( = ?auto_997286 ?auto_997289 ) ) ( not ( = ?auto_997286 ?auto_997290 ) ) ( not ( = ?auto_997286 ?auto_997291 ) ) ( not ( = ?auto_997286 ?auto_997292 ) ) ( not ( = ?auto_997287 ?auto_997288 ) ) ( not ( = ?auto_997287 ?auto_997289 ) ) ( not ( = ?auto_997287 ?auto_997290 ) ) ( not ( = ?auto_997287 ?auto_997291 ) ) ( not ( = ?auto_997287 ?auto_997292 ) ) ( not ( = ?auto_997288 ?auto_997289 ) ) ( not ( = ?auto_997288 ?auto_997290 ) ) ( not ( = ?auto_997288 ?auto_997291 ) ) ( not ( = ?auto_997288 ?auto_997292 ) ) ( not ( = ?auto_997289 ?auto_997290 ) ) ( not ( = ?auto_997289 ?auto_997291 ) ) ( not ( = ?auto_997289 ?auto_997292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997290 ?auto_997291 ?auto_997292 )
      ( MAKE-10CRATE-VERIFY ?auto_997282 ?auto_997283 ?auto_997284 ?auto_997285 ?auto_997286 ?auto_997287 ?auto_997288 ?auto_997289 ?auto_997290 ?auto_997291 ?auto_997292 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997397 - SURFACE
      ?auto_997398 - SURFACE
      ?auto_997399 - SURFACE
      ?auto_997400 - SURFACE
      ?auto_997401 - SURFACE
      ?auto_997402 - SURFACE
      ?auto_997403 - SURFACE
      ?auto_997404 - SURFACE
      ?auto_997405 - SURFACE
      ?auto_997406 - SURFACE
      ?auto_997407 - SURFACE
    )
    :vars
    (
      ?auto_997410 - HOIST
      ?auto_997409 - PLACE
      ?auto_997408 - TRUCK
      ?auto_997412 - PLACE
      ?auto_997411 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_997410 ?auto_997409 ) ( SURFACE-AT ?auto_997406 ?auto_997409 ) ( CLEAR ?auto_997406 ) ( IS-CRATE ?auto_997407 ) ( not ( = ?auto_997406 ?auto_997407 ) ) ( AVAILABLE ?auto_997410 ) ( ON ?auto_997406 ?auto_997405 ) ( not ( = ?auto_997405 ?auto_997406 ) ) ( not ( = ?auto_997405 ?auto_997407 ) ) ( TRUCK-AT ?auto_997408 ?auto_997412 ) ( not ( = ?auto_997412 ?auto_997409 ) ) ( HOIST-AT ?auto_997411 ?auto_997412 ) ( LIFTING ?auto_997411 ?auto_997407 ) ( not ( = ?auto_997410 ?auto_997411 ) ) ( ON ?auto_997398 ?auto_997397 ) ( ON ?auto_997399 ?auto_997398 ) ( ON ?auto_997400 ?auto_997399 ) ( ON ?auto_997401 ?auto_997400 ) ( ON ?auto_997402 ?auto_997401 ) ( ON ?auto_997403 ?auto_997402 ) ( ON ?auto_997404 ?auto_997403 ) ( ON ?auto_997405 ?auto_997404 ) ( not ( = ?auto_997397 ?auto_997398 ) ) ( not ( = ?auto_997397 ?auto_997399 ) ) ( not ( = ?auto_997397 ?auto_997400 ) ) ( not ( = ?auto_997397 ?auto_997401 ) ) ( not ( = ?auto_997397 ?auto_997402 ) ) ( not ( = ?auto_997397 ?auto_997403 ) ) ( not ( = ?auto_997397 ?auto_997404 ) ) ( not ( = ?auto_997397 ?auto_997405 ) ) ( not ( = ?auto_997397 ?auto_997406 ) ) ( not ( = ?auto_997397 ?auto_997407 ) ) ( not ( = ?auto_997398 ?auto_997399 ) ) ( not ( = ?auto_997398 ?auto_997400 ) ) ( not ( = ?auto_997398 ?auto_997401 ) ) ( not ( = ?auto_997398 ?auto_997402 ) ) ( not ( = ?auto_997398 ?auto_997403 ) ) ( not ( = ?auto_997398 ?auto_997404 ) ) ( not ( = ?auto_997398 ?auto_997405 ) ) ( not ( = ?auto_997398 ?auto_997406 ) ) ( not ( = ?auto_997398 ?auto_997407 ) ) ( not ( = ?auto_997399 ?auto_997400 ) ) ( not ( = ?auto_997399 ?auto_997401 ) ) ( not ( = ?auto_997399 ?auto_997402 ) ) ( not ( = ?auto_997399 ?auto_997403 ) ) ( not ( = ?auto_997399 ?auto_997404 ) ) ( not ( = ?auto_997399 ?auto_997405 ) ) ( not ( = ?auto_997399 ?auto_997406 ) ) ( not ( = ?auto_997399 ?auto_997407 ) ) ( not ( = ?auto_997400 ?auto_997401 ) ) ( not ( = ?auto_997400 ?auto_997402 ) ) ( not ( = ?auto_997400 ?auto_997403 ) ) ( not ( = ?auto_997400 ?auto_997404 ) ) ( not ( = ?auto_997400 ?auto_997405 ) ) ( not ( = ?auto_997400 ?auto_997406 ) ) ( not ( = ?auto_997400 ?auto_997407 ) ) ( not ( = ?auto_997401 ?auto_997402 ) ) ( not ( = ?auto_997401 ?auto_997403 ) ) ( not ( = ?auto_997401 ?auto_997404 ) ) ( not ( = ?auto_997401 ?auto_997405 ) ) ( not ( = ?auto_997401 ?auto_997406 ) ) ( not ( = ?auto_997401 ?auto_997407 ) ) ( not ( = ?auto_997402 ?auto_997403 ) ) ( not ( = ?auto_997402 ?auto_997404 ) ) ( not ( = ?auto_997402 ?auto_997405 ) ) ( not ( = ?auto_997402 ?auto_997406 ) ) ( not ( = ?auto_997402 ?auto_997407 ) ) ( not ( = ?auto_997403 ?auto_997404 ) ) ( not ( = ?auto_997403 ?auto_997405 ) ) ( not ( = ?auto_997403 ?auto_997406 ) ) ( not ( = ?auto_997403 ?auto_997407 ) ) ( not ( = ?auto_997404 ?auto_997405 ) ) ( not ( = ?auto_997404 ?auto_997406 ) ) ( not ( = ?auto_997404 ?auto_997407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997405 ?auto_997406 ?auto_997407 )
      ( MAKE-10CRATE-VERIFY ?auto_997397 ?auto_997398 ?auto_997399 ?auto_997400 ?auto_997401 ?auto_997402 ?auto_997403 ?auto_997404 ?auto_997405 ?auto_997406 ?auto_997407 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997522 - SURFACE
      ?auto_997523 - SURFACE
      ?auto_997524 - SURFACE
      ?auto_997525 - SURFACE
      ?auto_997526 - SURFACE
      ?auto_997527 - SURFACE
      ?auto_997528 - SURFACE
      ?auto_997529 - SURFACE
      ?auto_997530 - SURFACE
      ?auto_997531 - SURFACE
      ?auto_997532 - SURFACE
    )
    :vars
    (
      ?auto_997536 - HOIST
      ?auto_997535 - PLACE
      ?auto_997533 - TRUCK
      ?auto_997537 - PLACE
      ?auto_997538 - HOIST
      ?auto_997534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_997536 ?auto_997535 ) ( SURFACE-AT ?auto_997531 ?auto_997535 ) ( CLEAR ?auto_997531 ) ( IS-CRATE ?auto_997532 ) ( not ( = ?auto_997531 ?auto_997532 ) ) ( AVAILABLE ?auto_997536 ) ( ON ?auto_997531 ?auto_997530 ) ( not ( = ?auto_997530 ?auto_997531 ) ) ( not ( = ?auto_997530 ?auto_997532 ) ) ( TRUCK-AT ?auto_997533 ?auto_997537 ) ( not ( = ?auto_997537 ?auto_997535 ) ) ( HOIST-AT ?auto_997538 ?auto_997537 ) ( not ( = ?auto_997536 ?auto_997538 ) ) ( AVAILABLE ?auto_997538 ) ( SURFACE-AT ?auto_997532 ?auto_997537 ) ( ON ?auto_997532 ?auto_997534 ) ( CLEAR ?auto_997532 ) ( not ( = ?auto_997531 ?auto_997534 ) ) ( not ( = ?auto_997532 ?auto_997534 ) ) ( not ( = ?auto_997530 ?auto_997534 ) ) ( ON ?auto_997523 ?auto_997522 ) ( ON ?auto_997524 ?auto_997523 ) ( ON ?auto_997525 ?auto_997524 ) ( ON ?auto_997526 ?auto_997525 ) ( ON ?auto_997527 ?auto_997526 ) ( ON ?auto_997528 ?auto_997527 ) ( ON ?auto_997529 ?auto_997528 ) ( ON ?auto_997530 ?auto_997529 ) ( not ( = ?auto_997522 ?auto_997523 ) ) ( not ( = ?auto_997522 ?auto_997524 ) ) ( not ( = ?auto_997522 ?auto_997525 ) ) ( not ( = ?auto_997522 ?auto_997526 ) ) ( not ( = ?auto_997522 ?auto_997527 ) ) ( not ( = ?auto_997522 ?auto_997528 ) ) ( not ( = ?auto_997522 ?auto_997529 ) ) ( not ( = ?auto_997522 ?auto_997530 ) ) ( not ( = ?auto_997522 ?auto_997531 ) ) ( not ( = ?auto_997522 ?auto_997532 ) ) ( not ( = ?auto_997522 ?auto_997534 ) ) ( not ( = ?auto_997523 ?auto_997524 ) ) ( not ( = ?auto_997523 ?auto_997525 ) ) ( not ( = ?auto_997523 ?auto_997526 ) ) ( not ( = ?auto_997523 ?auto_997527 ) ) ( not ( = ?auto_997523 ?auto_997528 ) ) ( not ( = ?auto_997523 ?auto_997529 ) ) ( not ( = ?auto_997523 ?auto_997530 ) ) ( not ( = ?auto_997523 ?auto_997531 ) ) ( not ( = ?auto_997523 ?auto_997532 ) ) ( not ( = ?auto_997523 ?auto_997534 ) ) ( not ( = ?auto_997524 ?auto_997525 ) ) ( not ( = ?auto_997524 ?auto_997526 ) ) ( not ( = ?auto_997524 ?auto_997527 ) ) ( not ( = ?auto_997524 ?auto_997528 ) ) ( not ( = ?auto_997524 ?auto_997529 ) ) ( not ( = ?auto_997524 ?auto_997530 ) ) ( not ( = ?auto_997524 ?auto_997531 ) ) ( not ( = ?auto_997524 ?auto_997532 ) ) ( not ( = ?auto_997524 ?auto_997534 ) ) ( not ( = ?auto_997525 ?auto_997526 ) ) ( not ( = ?auto_997525 ?auto_997527 ) ) ( not ( = ?auto_997525 ?auto_997528 ) ) ( not ( = ?auto_997525 ?auto_997529 ) ) ( not ( = ?auto_997525 ?auto_997530 ) ) ( not ( = ?auto_997525 ?auto_997531 ) ) ( not ( = ?auto_997525 ?auto_997532 ) ) ( not ( = ?auto_997525 ?auto_997534 ) ) ( not ( = ?auto_997526 ?auto_997527 ) ) ( not ( = ?auto_997526 ?auto_997528 ) ) ( not ( = ?auto_997526 ?auto_997529 ) ) ( not ( = ?auto_997526 ?auto_997530 ) ) ( not ( = ?auto_997526 ?auto_997531 ) ) ( not ( = ?auto_997526 ?auto_997532 ) ) ( not ( = ?auto_997526 ?auto_997534 ) ) ( not ( = ?auto_997527 ?auto_997528 ) ) ( not ( = ?auto_997527 ?auto_997529 ) ) ( not ( = ?auto_997527 ?auto_997530 ) ) ( not ( = ?auto_997527 ?auto_997531 ) ) ( not ( = ?auto_997527 ?auto_997532 ) ) ( not ( = ?auto_997527 ?auto_997534 ) ) ( not ( = ?auto_997528 ?auto_997529 ) ) ( not ( = ?auto_997528 ?auto_997530 ) ) ( not ( = ?auto_997528 ?auto_997531 ) ) ( not ( = ?auto_997528 ?auto_997532 ) ) ( not ( = ?auto_997528 ?auto_997534 ) ) ( not ( = ?auto_997529 ?auto_997530 ) ) ( not ( = ?auto_997529 ?auto_997531 ) ) ( not ( = ?auto_997529 ?auto_997532 ) ) ( not ( = ?auto_997529 ?auto_997534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997530 ?auto_997531 ?auto_997532 )
      ( MAKE-10CRATE-VERIFY ?auto_997522 ?auto_997523 ?auto_997524 ?auto_997525 ?auto_997526 ?auto_997527 ?auto_997528 ?auto_997529 ?auto_997530 ?auto_997531 ?auto_997532 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997648 - SURFACE
      ?auto_997649 - SURFACE
      ?auto_997650 - SURFACE
      ?auto_997651 - SURFACE
      ?auto_997652 - SURFACE
      ?auto_997653 - SURFACE
      ?auto_997654 - SURFACE
      ?auto_997655 - SURFACE
      ?auto_997656 - SURFACE
      ?auto_997657 - SURFACE
      ?auto_997658 - SURFACE
    )
    :vars
    (
      ?auto_997661 - HOIST
      ?auto_997660 - PLACE
      ?auto_997662 - PLACE
      ?auto_997664 - HOIST
      ?auto_997663 - SURFACE
      ?auto_997659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997661 ?auto_997660 ) ( SURFACE-AT ?auto_997657 ?auto_997660 ) ( CLEAR ?auto_997657 ) ( IS-CRATE ?auto_997658 ) ( not ( = ?auto_997657 ?auto_997658 ) ) ( AVAILABLE ?auto_997661 ) ( ON ?auto_997657 ?auto_997656 ) ( not ( = ?auto_997656 ?auto_997657 ) ) ( not ( = ?auto_997656 ?auto_997658 ) ) ( not ( = ?auto_997662 ?auto_997660 ) ) ( HOIST-AT ?auto_997664 ?auto_997662 ) ( not ( = ?auto_997661 ?auto_997664 ) ) ( AVAILABLE ?auto_997664 ) ( SURFACE-AT ?auto_997658 ?auto_997662 ) ( ON ?auto_997658 ?auto_997663 ) ( CLEAR ?auto_997658 ) ( not ( = ?auto_997657 ?auto_997663 ) ) ( not ( = ?auto_997658 ?auto_997663 ) ) ( not ( = ?auto_997656 ?auto_997663 ) ) ( TRUCK-AT ?auto_997659 ?auto_997660 ) ( ON ?auto_997649 ?auto_997648 ) ( ON ?auto_997650 ?auto_997649 ) ( ON ?auto_997651 ?auto_997650 ) ( ON ?auto_997652 ?auto_997651 ) ( ON ?auto_997653 ?auto_997652 ) ( ON ?auto_997654 ?auto_997653 ) ( ON ?auto_997655 ?auto_997654 ) ( ON ?auto_997656 ?auto_997655 ) ( not ( = ?auto_997648 ?auto_997649 ) ) ( not ( = ?auto_997648 ?auto_997650 ) ) ( not ( = ?auto_997648 ?auto_997651 ) ) ( not ( = ?auto_997648 ?auto_997652 ) ) ( not ( = ?auto_997648 ?auto_997653 ) ) ( not ( = ?auto_997648 ?auto_997654 ) ) ( not ( = ?auto_997648 ?auto_997655 ) ) ( not ( = ?auto_997648 ?auto_997656 ) ) ( not ( = ?auto_997648 ?auto_997657 ) ) ( not ( = ?auto_997648 ?auto_997658 ) ) ( not ( = ?auto_997648 ?auto_997663 ) ) ( not ( = ?auto_997649 ?auto_997650 ) ) ( not ( = ?auto_997649 ?auto_997651 ) ) ( not ( = ?auto_997649 ?auto_997652 ) ) ( not ( = ?auto_997649 ?auto_997653 ) ) ( not ( = ?auto_997649 ?auto_997654 ) ) ( not ( = ?auto_997649 ?auto_997655 ) ) ( not ( = ?auto_997649 ?auto_997656 ) ) ( not ( = ?auto_997649 ?auto_997657 ) ) ( not ( = ?auto_997649 ?auto_997658 ) ) ( not ( = ?auto_997649 ?auto_997663 ) ) ( not ( = ?auto_997650 ?auto_997651 ) ) ( not ( = ?auto_997650 ?auto_997652 ) ) ( not ( = ?auto_997650 ?auto_997653 ) ) ( not ( = ?auto_997650 ?auto_997654 ) ) ( not ( = ?auto_997650 ?auto_997655 ) ) ( not ( = ?auto_997650 ?auto_997656 ) ) ( not ( = ?auto_997650 ?auto_997657 ) ) ( not ( = ?auto_997650 ?auto_997658 ) ) ( not ( = ?auto_997650 ?auto_997663 ) ) ( not ( = ?auto_997651 ?auto_997652 ) ) ( not ( = ?auto_997651 ?auto_997653 ) ) ( not ( = ?auto_997651 ?auto_997654 ) ) ( not ( = ?auto_997651 ?auto_997655 ) ) ( not ( = ?auto_997651 ?auto_997656 ) ) ( not ( = ?auto_997651 ?auto_997657 ) ) ( not ( = ?auto_997651 ?auto_997658 ) ) ( not ( = ?auto_997651 ?auto_997663 ) ) ( not ( = ?auto_997652 ?auto_997653 ) ) ( not ( = ?auto_997652 ?auto_997654 ) ) ( not ( = ?auto_997652 ?auto_997655 ) ) ( not ( = ?auto_997652 ?auto_997656 ) ) ( not ( = ?auto_997652 ?auto_997657 ) ) ( not ( = ?auto_997652 ?auto_997658 ) ) ( not ( = ?auto_997652 ?auto_997663 ) ) ( not ( = ?auto_997653 ?auto_997654 ) ) ( not ( = ?auto_997653 ?auto_997655 ) ) ( not ( = ?auto_997653 ?auto_997656 ) ) ( not ( = ?auto_997653 ?auto_997657 ) ) ( not ( = ?auto_997653 ?auto_997658 ) ) ( not ( = ?auto_997653 ?auto_997663 ) ) ( not ( = ?auto_997654 ?auto_997655 ) ) ( not ( = ?auto_997654 ?auto_997656 ) ) ( not ( = ?auto_997654 ?auto_997657 ) ) ( not ( = ?auto_997654 ?auto_997658 ) ) ( not ( = ?auto_997654 ?auto_997663 ) ) ( not ( = ?auto_997655 ?auto_997656 ) ) ( not ( = ?auto_997655 ?auto_997657 ) ) ( not ( = ?auto_997655 ?auto_997658 ) ) ( not ( = ?auto_997655 ?auto_997663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997656 ?auto_997657 ?auto_997658 )
      ( MAKE-10CRATE-VERIFY ?auto_997648 ?auto_997649 ?auto_997650 ?auto_997651 ?auto_997652 ?auto_997653 ?auto_997654 ?auto_997655 ?auto_997656 ?auto_997657 ?auto_997658 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997774 - SURFACE
      ?auto_997775 - SURFACE
      ?auto_997776 - SURFACE
      ?auto_997777 - SURFACE
      ?auto_997778 - SURFACE
      ?auto_997779 - SURFACE
      ?auto_997780 - SURFACE
      ?auto_997781 - SURFACE
      ?auto_997782 - SURFACE
      ?auto_997783 - SURFACE
      ?auto_997784 - SURFACE
    )
    :vars
    (
      ?auto_997788 - HOIST
      ?auto_997790 - PLACE
      ?auto_997786 - PLACE
      ?auto_997789 - HOIST
      ?auto_997785 - SURFACE
      ?auto_997787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997788 ?auto_997790 ) ( IS-CRATE ?auto_997784 ) ( not ( = ?auto_997783 ?auto_997784 ) ) ( not ( = ?auto_997782 ?auto_997783 ) ) ( not ( = ?auto_997782 ?auto_997784 ) ) ( not ( = ?auto_997786 ?auto_997790 ) ) ( HOIST-AT ?auto_997789 ?auto_997786 ) ( not ( = ?auto_997788 ?auto_997789 ) ) ( AVAILABLE ?auto_997789 ) ( SURFACE-AT ?auto_997784 ?auto_997786 ) ( ON ?auto_997784 ?auto_997785 ) ( CLEAR ?auto_997784 ) ( not ( = ?auto_997783 ?auto_997785 ) ) ( not ( = ?auto_997784 ?auto_997785 ) ) ( not ( = ?auto_997782 ?auto_997785 ) ) ( TRUCK-AT ?auto_997787 ?auto_997790 ) ( SURFACE-AT ?auto_997782 ?auto_997790 ) ( CLEAR ?auto_997782 ) ( LIFTING ?auto_997788 ?auto_997783 ) ( IS-CRATE ?auto_997783 ) ( ON ?auto_997775 ?auto_997774 ) ( ON ?auto_997776 ?auto_997775 ) ( ON ?auto_997777 ?auto_997776 ) ( ON ?auto_997778 ?auto_997777 ) ( ON ?auto_997779 ?auto_997778 ) ( ON ?auto_997780 ?auto_997779 ) ( ON ?auto_997781 ?auto_997780 ) ( ON ?auto_997782 ?auto_997781 ) ( not ( = ?auto_997774 ?auto_997775 ) ) ( not ( = ?auto_997774 ?auto_997776 ) ) ( not ( = ?auto_997774 ?auto_997777 ) ) ( not ( = ?auto_997774 ?auto_997778 ) ) ( not ( = ?auto_997774 ?auto_997779 ) ) ( not ( = ?auto_997774 ?auto_997780 ) ) ( not ( = ?auto_997774 ?auto_997781 ) ) ( not ( = ?auto_997774 ?auto_997782 ) ) ( not ( = ?auto_997774 ?auto_997783 ) ) ( not ( = ?auto_997774 ?auto_997784 ) ) ( not ( = ?auto_997774 ?auto_997785 ) ) ( not ( = ?auto_997775 ?auto_997776 ) ) ( not ( = ?auto_997775 ?auto_997777 ) ) ( not ( = ?auto_997775 ?auto_997778 ) ) ( not ( = ?auto_997775 ?auto_997779 ) ) ( not ( = ?auto_997775 ?auto_997780 ) ) ( not ( = ?auto_997775 ?auto_997781 ) ) ( not ( = ?auto_997775 ?auto_997782 ) ) ( not ( = ?auto_997775 ?auto_997783 ) ) ( not ( = ?auto_997775 ?auto_997784 ) ) ( not ( = ?auto_997775 ?auto_997785 ) ) ( not ( = ?auto_997776 ?auto_997777 ) ) ( not ( = ?auto_997776 ?auto_997778 ) ) ( not ( = ?auto_997776 ?auto_997779 ) ) ( not ( = ?auto_997776 ?auto_997780 ) ) ( not ( = ?auto_997776 ?auto_997781 ) ) ( not ( = ?auto_997776 ?auto_997782 ) ) ( not ( = ?auto_997776 ?auto_997783 ) ) ( not ( = ?auto_997776 ?auto_997784 ) ) ( not ( = ?auto_997776 ?auto_997785 ) ) ( not ( = ?auto_997777 ?auto_997778 ) ) ( not ( = ?auto_997777 ?auto_997779 ) ) ( not ( = ?auto_997777 ?auto_997780 ) ) ( not ( = ?auto_997777 ?auto_997781 ) ) ( not ( = ?auto_997777 ?auto_997782 ) ) ( not ( = ?auto_997777 ?auto_997783 ) ) ( not ( = ?auto_997777 ?auto_997784 ) ) ( not ( = ?auto_997777 ?auto_997785 ) ) ( not ( = ?auto_997778 ?auto_997779 ) ) ( not ( = ?auto_997778 ?auto_997780 ) ) ( not ( = ?auto_997778 ?auto_997781 ) ) ( not ( = ?auto_997778 ?auto_997782 ) ) ( not ( = ?auto_997778 ?auto_997783 ) ) ( not ( = ?auto_997778 ?auto_997784 ) ) ( not ( = ?auto_997778 ?auto_997785 ) ) ( not ( = ?auto_997779 ?auto_997780 ) ) ( not ( = ?auto_997779 ?auto_997781 ) ) ( not ( = ?auto_997779 ?auto_997782 ) ) ( not ( = ?auto_997779 ?auto_997783 ) ) ( not ( = ?auto_997779 ?auto_997784 ) ) ( not ( = ?auto_997779 ?auto_997785 ) ) ( not ( = ?auto_997780 ?auto_997781 ) ) ( not ( = ?auto_997780 ?auto_997782 ) ) ( not ( = ?auto_997780 ?auto_997783 ) ) ( not ( = ?auto_997780 ?auto_997784 ) ) ( not ( = ?auto_997780 ?auto_997785 ) ) ( not ( = ?auto_997781 ?auto_997782 ) ) ( not ( = ?auto_997781 ?auto_997783 ) ) ( not ( = ?auto_997781 ?auto_997784 ) ) ( not ( = ?auto_997781 ?auto_997785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997782 ?auto_997783 ?auto_997784 )
      ( MAKE-10CRATE-VERIFY ?auto_997774 ?auto_997775 ?auto_997776 ?auto_997777 ?auto_997778 ?auto_997779 ?auto_997780 ?auto_997781 ?auto_997782 ?auto_997783 ?auto_997784 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997900 - SURFACE
      ?auto_997901 - SURFACE
      ?auto_997902 - SURFACE
      ?auto_997903 - SURFACE
      ?auto_997904 - SURFACE
      ?auto_997905 - SURFACE
      ?auto_997906 - SURFACE
      ?auto_997907 - SURFACE
      ?auto_997908 - SURFACE
      ?auto_997909 - SURFACE
      ?auto_997910 - SURFACE
    )
    :vars
    (
      ?auto_997914 - HOIST
      ?auto_997913 - PLACE
      ?auto_997916 - PLACE
      ?auto_997911 - HOIST
      ?auto_997912 - SURFACE
      ?auto_997915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997914 ?auto_997913 ) ( IS-CRATE ?auto_997910 ) ( not ( = ?auto_997909 ?auto_997910 ) ) ( not ( = ?auto_997908 ?auto_997909 ) ) ( not ( = ?auto_997908 ?auto_997910 ) ) ( not ( = ?auto_997916 ?auto_997913 ) ) ( HOIST-AT ?auto_997911 ?auto_997916 ) ( not ( = ?auto_997914 ?auto_997911 ) ) ( AVAILABLE ?auto_997911 ) ( SURFACE-AT ?auto_997910 ?auto_997916 ) ( ON ?auto_997910 ?auto_997912 ) ( CLEAR ?auto_997910 ) ( not ( = ?auto_997909 ?auto_997912 ) ) ( not ( = ?auto_997910 ?auto_997912 ) ) ( not ( = ?auto_997908 ?auto_997912 ) ) ( TRUCK-AT ?auto_997915 ?auto_997913 ) ( SURFACE-AT ?auto_997908 ?auto_997913 ) ( CLEAR ?auto_997908 ) ( IS-CRATE ?auto_997909 ) ( AVAILABLE ?auto_997914 ) ( IN ?auto_997909 ?auto_997915 ) ( ON ?auto_997901 ?auto_997900 ) ( ON ?auto_997902 ?auto_997901 ) ( ON ?auto_997903 ?auto_997902 ) ( ON ?auto_997904 ?auto_997903 ) ( ON ?auto_997905 ?auto_997904 ) ( ON ?auto_997906 ?auto_997905 ) ( ON ?auto_997907 ?auto_997906 ) ( ON ?auto_997908 ?auto_997907 ) ( not ( = ?auto_997900 ?auto_997901 ) ) ( not ( = ?auto_997900 ?auto_997902 ) ) ( not ( = ?auto_997900 ?auto_997903 ) ) ( not ( = ?auto_997900 ?auto_997904 ) ) ( not ( = ?auto_997900 ?auto_997905 ) ) ( not ( = ?auto_997900 ?auto_997906 ) ) ( not ( = ?auto_997900 ?auto_997907 ) ) ( not ( = ?auto_997900 ?auto_997908 ) ) ( not ( = ?auto_997900 ?auto_997909 ) ) ( not ( = ?auto_997900 ?auto_997910 ) ) ( not ( = ?auto_997900 ?auto_997912 ) ) ( not ( = ?auto_997901 ?auto_997902 ) ) ( not ( = ?auto_997901 ?auto_997903 ) ) ( not ( = ?auto_997901 ?auto_997904 ) ) ( not ( = ?auto_997901 ?auto_997905 ) ) ( not ( = ?auto_997901 ?auto_997906 ) ) ( not ( = ?auto_997901 ?auto_997907 ) ) ( not ( = ?auto_997901 ?auto_997908 ) ) ( not ( = ?auto_997901 ?auto_997909 ) ) ( not ( = ?auto_997901 ?auto_997910 ) ) ( not ( = ?auto_997901 ?auto_997912 ) ) ( not ( = ?auto_997902 ?auto_997903 ) ) ( not ( = ?auto_997902 ?auto_997904 ) ) ( not ( = ?auto_997902 ?auto_997905 ) ) ( not ( = ?auto_997902 ?auto_997906 ) ) ( not ( = ?auto_997902 ?auto_997907 ) ) ( not ( = ?auto_997902 ?auto_997908 ) ) ( not ( = ?auto_997902 ?auto_997909 ) ) ( not ( = ?auto_997902 ?auto_997910 ) ) ( not ( = ?auto_997902 ?auto_997912 ) ) ( not ( = ?auto_997903 ?auto_997904 ) ) ( not ( = ?auto_997903 ?auto_997905 ) ) ( not ( = ?auto_997903 ?auto_997906 ) ) ( not ( = ?auto_997903 ?auto_997907 ) ) ( not ( = ?auto_997903 ?auto_997908 ) ) ( not ( = ?auto_997903 ?auto_997909 ) ) ( not ( = ?auto_997903 ?auto_997910 ) ) ( not ( = ?auto_997903 ?auto_997912 ) ) ( not ( = ?auto_997904 ?auto_997905 ) ) ( not ( = ?auto_997904 ?auto_997906 ) ) ( not ( = ?auto_997904 ?auto_997907 ) ) ( not ( = ?auto_997904 ?auto_997908 ) ) ( not ( = ?auto_997904 ?auto_997909 ) ) ( not ( = ?auto_997904 ?auto_997910 ) ) ( not ( = ?auto_997904 ?auto_997912 ) ) ( not ( = ?auto_997905 ?auto_997906 ) ) ( not ( = ?auto_997905 ?auto_997907 ) ) ( not ( = ?auto_997905 ?auto_997908 ) ) ( not ( = ?auto_997905 ?auto_997909 ) ) ( not ( = ?auto_997905 ?auto_997910 ) ) ( not ( = ?auto_997905 ?auto_997912 ) ) ( not ( = ?auto_997906 ?auto_997907 ) ) ( not ( = ?auto_997906 ?auto_997908 ) ) ( not ( = ?auto_997906 ?auto_997909 ) ) ( not ( = ?auto_997906 ?auto_997910 ) ) ( not ( = ?auto_997906 ?auto_997912 ) ) ( not ( = ?auto_997907 ?auto_997908 ) ) ( not ( = ?auto_997907 ?auto_997909 ) ) ( not ( = ?auto_997907 ?auto_997910 ) ) ( not ( = ?auto_997907 ?auto_997912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997908 ?auto_997909 ?auto_997910 )
      ( MAKE-10CRATE-VERIFY ?auto_997900 ?auto_997901 ?auto_997902 ?auto_997903 ?auto_997904 ?auto_997905 ?auto_997906 ?auto_997907 ?auto_997908 ?auto_997909 ?auto_997910 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005108 - SURFACE
      ?auto_1005109 - SURFACE
      ?auto_1005110 - SURFACE
      ?auto_1005111 - SURFACE
      ?auto_1005112 - SURFACE
      ?auto_1005113 - SURFACE
      ?auto_1005114 - SURFACE
      ?auto_1005115 - SURFACE
      ?auto_1005116 - SURFACE
      ?auto_1005117 - SURFACE
      ?auto_1005118 - SURFACE
      ?auto_1005119 - SURFACE
    )
    :vars
    (
      ?auto_1005121 - HOIST
      ?auto_1005120 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005121 ?auto_1005120 ) ( SURFACE-AT ?auto_1005118 ?auto_1005120 ) ( CLEAR ?auto_1005118 ) ( LIFTING ?auto_1005121 ?auto_1005119 ) ( IS-CRATE ?auto_1005119 ) ( not ( = ?auto_1005118 ?auto_1005119 ) ) ( ON ?auto_1005109 ?auto_1005108 ) ( ON ?auto_1005110 ?auto_1005109 ) ( ON ?auto_1005111 ?auto_1005110 ) ( ON ?auto_1005112 ?auto_1005111 ) ( ON ?auto_1005113 ?auto_1005112 ) ( ON ?auto_1005114 ?auto_1005113 ) ( ON ?auto_1005115 ?auto_1005114 ) ( ON ?auto_1005116 ?auto_1005115 ) ( ON ?auto_1005117 ?auto_1005116 ) ( ON ?auto_1005118 ?auto_1005117 ) ( not ( = ?auto_1005108 ?auto_1005109 ) ) ( not ( = ?auto_1005108 ?auto_1005110 ) ) ( not ( = ?auto_1005108 ?auto_1005111 ) ) ( not ( = ?auto_1005108 ?auto_1005112 ) ) ( not ( = ?auto_1005108 ?auto_1005113 ) ) ( not ( = ?auto_1005108 ?auto_1005114 ) ) ( not ( = ?auto_1005108 ?auto_1005115 ) ) ( not ( = ?auto_1005108 ?auto_1005116 ) ) ( not ( = ?auto_1005108 ?auto_1005117 ) ) ( not ( = ?auto_1005108 ?auto_1005118 ) ) ( not ( = ?auto_1005108 ?auto_1005119 ) ) ( not ( = ?auto_1005109 ?auto_1005110 ) ) ( not ( = ?auto_1005109 ?auto_1005111 ) ) ( not ( = ?auto_1005109 ?auto_1005112 ) ) ( not ( = ?auto_1005109 ?auto_1005113 ) ) ( not ( = ?auto_1005109 ?auto_1005114 ) ) ( not ( = ?auto_1005109 ?auto_1005115 ) ) ( not ( = ?auto_1005109 ?auto_1005116 ) ) ( not ( = ?auto_1005109 ?auto_1005117 ) ) ( not ( = ?auto_1005109 ?auto_1005118 ) ) ( not ( = ?auto_1005109 ?auto_1005119 ) ) ( not ( = ?auto_1005110 ?auto_1005111 ) ) ( not ( = ?auto_1005110 ?auto_1005112 ) ) ( not ( = ?auto_1005110 ?auto_1005113 ) ) ( not ( = ?auto_1005110 ?auto_1005114 ) ) ( not ( = ?auto_1005110 ?auto_1005115 ) ) ( not ( = ?auto_1005110 ?auto_1005116 ) ) ( not ( = ?auto_1005110 ?auto_1005117 ) ) ( not ( = ?auto_1005110 ?auto_1005118 ) ) ( not ( = ?auto_1005110 ?auto_1005119 ) ) ( not ( = ?auto_1005111 ?auto_1005112 ) ) ( not ( = ?auto_1005111 ?auto_1005113 ) ) ( not ( = ?auto_1005111 ?auto_1005114 ) ) ( not ( = ?auto_1005111 ?auto_1005115 ) ) ( not ( = ?auto_1005111 ?auto_1005116 ) ) ( not ( = ?auto_1005111 ?auto_1005117 ) ) ( not ( = ?auto_1005111 ?auto_1005118 ) ) ( not ( = ?auto_1005111 ?auto_1005119 ) ) ( not ( = ?auto_1005112 ?auto_1005113 ) ) ( not ( = ?auto_1005112 ?auto_1005114 ) ) ( not ( = ?auto_1005112 ?auto_1005115 ) ) ( not ( = ?auto_1005112 ?auto_1005116 ) ) ( not ( = ?auto_1005112 ?auto_1005117 ) ) ( not ( = ?auto_1005112 ?auto_1005118 ) ) ( not ( = ?auto_1005112 ?auto_1005119 ) ) ( not ( = ?auto_1005113 ?auto_1005114 ) ) ( not ( = ?auto_1005113 ?auto_1005115 ) ) ( not ( = ?auto_1005113 ?auto_1005116 ) ) ( not ( = ?auto_1005113 ?auto_1005117 ) ) ( not ( = ?auto_1005113 ?auto_1005118 ) ) ( not ( = ?auto_1005113 ?auto_1005119 ) ) ( not ( = ?auto_1005114 ?auto_1005115 ) ) ( not ( = ?auto_1005114 ?auto_1005116 ) ) ( not ( = ?auto_1005114 ?auto_1005117 ) ) ( not ( = ?auto_1005114 ?auto_1005118 ) ) ( not ( = ?auto_1005114 ?auto_1005119 ) ) ( not ( = ?auto_1005115 ?auto_1005116 ) ) ( not ( = ?auto_1005115 ?auto_1005117 ) ) ( not ( = ?auto_1005115 ?auto_1005118 ) ) ( not ( = ?auto_1005115 ?auto_1005119 ) ) ( not ( = ?auto_1005116 ?auto_1005117 ) ) ( not ( = ?auto_1005116 ?auto_1005118 ) ) ( not ( = ?auto_1005116 ?auto_1005119 ) ) ( not ( = ?auto_1005117 ?auto_1005118 ) ) ( not ( = ?auto_1005117 ?auto_1005119 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1005118 ?auto_1005119 )
      ( MAKE-11CRATE-VERIFY ?auto_1005108 ?auto_1005109 ?auto_1005110 ?auto_1005111 ?auto_1005112 ?auto_1005113 ?auto_1005114 ?auto_1005115 ?auto_1005116 ?auto_1005117 ?auto_1005118 ?auto_1005119 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005217 - SURFACE
      ?auto_1005218 - SURFACE
      ?auto_1005219 - SURFACE
      ?auto_1005220 - SURFACE
      ?auto_1005221 - SURFACE
      ?auto_1005222 - SURFACE
      ?auto_1005223 - SURFACE
      ?auto_1005224 - SURFACE
      ?auto_1005225 - SURFACE
      ?auto_1005226 - SURFACE
      ?auto_1005227 - SURFACE
      ?auto_1005228 - SURFACE
    )
    :vars
    (
      ?auto_1005229 - HOIST
      ?auto_1005230 - PLACE
      ?auto_1005231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005229 ?auto_1005230 ) ( SURFACE-AT ?auto_1005227 ?auto_1005230 ) ( CLEAR ?auto_1005227 ) ( IS-CRATE ?auto_1005228 ) ( not ( = ?auto_1005227 ?auto_1005228 ) ) ( TRUCK-AT ?auto_1005231 ?auto_1005230 ) ( AVAILABLE ?auto_1005229 ) ( IN ?auto_1005228 ?auto_1005231 ) ( ON ?auto_1005227 ?auto_1005226 ) ( not ( = ?auto_1005226 ?auto_1005227 ) ) ( not ( = ?auto_1005226 ?auto_1005228 ) ) ( ON ?auto_1005218 ?auto_1005217 ) ( ON ?auto_1005219 ?auto_1005218 ) ( ON ?auto_1005220 ?auto_1005219 ) ( ON ?auto_1005221 ?auto_1005220 ) ( ON ?auto_1005222 ?auto_1005221 ) ( ON ?auto_1005223 ?auto_1005222 ) ( ON ?auto_1005224 ?auto_1005223 ) ( ON ?auto_1005225 ?auto_1005224 ) ( ON ?auto_1005226 ?auto_1005225 ) ( not ( = ?auto_1005217 ?auto_1005218 ) ) ( not ( = ?auto_1005217 ?auto_1005219 ) ) ( not ( = ?auto_1005217 ?auto_1005220 ) ) ( not ( = ?auto_1005217 ?auto_1005221 ) ) ( not ( = ?auto_1005217 ?auto_1005222 ) ) ( not ( = ?auto_1005217 ?auto_1005223 ) ) ( not ( = ?auto_1005217 ?auto_1005224 ) ) ( not ( = ?auto_1005217 ?auto_1005225 ) ) ( not ( = ?auto_1005217 ?auto_1005226 ) ) ( not ( = ?auto_1005217 ?auto_1005227 ) ) ( not ( = ?auto_1005217 ?auto_1005228 ) ) ( not ( = ?auto_1005218 ?auto_1005219 ) ) ( not ( = ?auto_1005218 ?auto_1005220 ) ) ( not ( = ?auto_1005218 ?auto_1005221 ) ) ( not ( = ?auto_1005218 ?auto_1005222 ) ) ( not ( = ?auto_1005218 ?auto_1005223 ) ) ( not ( = ?auto_1005218 ?auto_1005224 ) ) ( not ( = ?auto_1005218 ?auto_1005225 ) ) ( not ( = ?auto_1005218 ?auto_1005226 ) ) ( not ( = ?auto_1005218 ?auto_1005227 ) ) ( not ( = ?auto_1005218 ?auto_1005228 ) ) ( not ( = ?auto_1005219 ?auto_1005220 ) ) ( not ( = ?auto_1005219 ?auto_1005221 ) ) ( not ( = ?auto_1005219 ?auto_1005222 ) ) ( not ( = ?auto_1005219 ?auto_1005223 ) ) ( not ( = ?auto_1005219 ?auto_1005224 ) ) ( not ( = ?auto_1005219 ?auto_1005225 ) ) ( not ( = ?auto_1005219 ?auto_1005226 ) ) ( not ( = ?auto_1005219 ?auto_1005227 ) ) ( not ( = ?auto_1005219 ?auto_1005228 ) ) ( not ( = ?auto_1005220 ?auto_1005221 ) ) ( not ( = ?auto_1005220 ?auto_1005222 ) ) ( not ( = ?auto_1005220 ?auto_1005223 ) ) ( not ( = ?auto_1005220 ?auto_1005224 ) ) ( not ( = ?auto_1005220 ?auto_1005225 ) ) ( not ( = ?auto_1005220 ?auto_1005226 ) ) ( not ( = ?auto_1005220 ?auto_1005227 ) ) ( not ( = ?auto_1005220 ?auto_1005228 ) ) ( not ( = ?auto_1005221 ?auto_1005222 ) ) ( not ( = ?auto_1005221 ?auto_1005223 ) ) ( not ( = ?auto_1005221 ?auto_1005224 ) ) ( not ( = ?auto_1005221 ?auto_1005225 ) ) ( not ( = ?auto_1005221 ?auto_1005226 ) ) ( not ( = ?auto_1005221 ?auto_1005227 ) ) ( not ( = ?auto_1005221 ?auto_1005228 ) ) ( not ( = ?auto_1005222 ?auto_1005223 ) ) ( not ( = ?auto_1005222 ?auto_1005224 ) ) ( not ( = ?auto_1005222 ?auto_1005225 ) ) ( not ( = ?auto_1005222 ?auto_1005226 ) ) ( not ( = ?auto_1005222 ?auto_1005227 ) ) ( not ( = ?auto_1005222 ?auto_1005228 ) ) ( not ( = ?auto_1005223 ?auto_1005224 ) ) ( not ( = ?auto_1005223 ?auto_1005225 ) ) ( not ( = ?auto_1005223 ?auto_1005226 ) ) ( not ( = ?auto_1005223 ?auto_1005227 ) ) ( not ( = ?auto_1005223 ?auto_1005228 ) ) ( not ( = ?auto_1005224 ?auto_1005225 ) ) ( not ( = ?auto_1005224 ?auto_1005226 ) ) ( not ( = ?auto_1005224 ?auto_1005227 ) ) ( not ( = ?auto_1005224 ?auto_1005228 ) ) ( not ( = ?auto_1005225 ?auto_1005226 ) ) ( not ( = ?auto_1005225 ?auto_1005227 ) ) ( not ( = ?auto_1005225 ?auto_1005228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005226 ?auto_1005227 ?auto_1005228 )
      ( MAKE-11CRATE-VERIFY ?auto_1005217 ?auto_1005218 ?auto_1005219 ?auto_1005220 ?auto_1005221 ?auto_1005222 ?auto_1005223 ?auto_1005224 ?auto_1005225 ?auto_1005226 ?auto_1005227 ?auto_1005228 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005338 - SURFACE
      ?auto_1005339 - SURFACE
      ?auto_1005340 - SURFACE
      ?auto_1005341 - SURFACE
      ?auto_1005342 - SURFACE
      ?auto_1005343 - SURFACE
      ?auto_1005344 - SURFACE
      ?auto_1005345 - SURFACE
      ?auto_1005346 - SURFACE
      ?auto_1005347 - SURFACE
      ?auto_1005348 - SURFACE
      ?auto_1005349 - SURFACE
    )
    :vars
    (
      ?auto_1005352 - HOIST
      ?auto_1005351 - PLACE
      ?auto_1005353 - TRUCK
      ?auto_1005350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005352 ?auto_1005351 ) ( SURFACE-AT ?auto_1005348 ?auto_1005351 ) ( CLEAR ?auto_1005348 ) ( IS-CRATE ?auto_1005349 ) ( not ( = ?auto_1005348 ?auto_1005349 ) ) ( AVAILABLE ?auto_1005352 ) ( IN ?auto_1005349 ?auto_1005353 ) ( ON ?auto_1005348 ?auto_1005347 ) ( not ( = ?auto_1005347 ?auto_1005348 ) ) ( not ( = ?auto_1005347 ?auto_1005349 ) ) ( TRUCK-AT ?auto_1005353 ?auto_1005350 ) ( not ( = ?auto_1005350 ?auto_1005351 ) ) ( ON ?auto_1005339 ?auto_1005338 ) ( ON ?auto_1005340 ?auto_1005339 ) ( ON ?auto_1005341 ?auto_1005340 ) ( ON ?auto_1005342 ?auto_1005341 ) ( ON ?auto_1005343 ?auto_1005342 ) ( ON ?auto_1005344 ?auto_1005343 ) ( ON ?auto_1005345 ?auto_1005344 ) ( ON ?auto_1005346 ?auto_1005345 ) ( ON ?auto_1005347 ?auto_1005346 ) ( not ( = ?auto_1005338 ?auto_1005339 ) ) ( not ( = ?auto_1005338 ?auto_1005340 ) ) ( not ( = ?auto_1005338 ?auto_1005341 ) ) ( not ( = ?auto_1005338 ?auto_1005342 ) ) ( not ( = ?auto_1005338 ?auto_1005343 ) ) ( not ( = ?auto_1005338 ?auto_1005344 ) ) ( not ( = ?auto_1005338 ?auto_1005345 ) ) ( not ( = ?auto_1005338 ?auto_1005346 ) ) ( not ( = ?auto_1005338 ?auto_1005347 ) ) ( not ( = ?auto_1005338 ?auto_1005348 ) ) ( not ( = ?auto_1005338 ?auto_1005349 ) ) ( not ( = ?auto_1005339 ?auto_1005340 ) ) ( not ( = ?auto_1005339 ?auto_1005341 ) ) ( not ( = ?auto_1005339 ?auto_1005342 ) ) ( not ( = ?auto_1005339 ?auto_1005343 ) ) ( not ( = ?auto_1005339 ?auto_1005344 ) ) ( not ( = ?auto_1005339 ?auto_1005345 ) ) ( not ( = ?auto_1005339 ?auto_1005346 ) ) ( not ( = ?auto_1005339 ?auto_1005347 ) ) ( not ( = ?auto_1005339 ?auto_1005348 ) ) ( not ( = ?auto_1005339 ?auto_1005349 ) ) ( not ( = ?auto_1005340 ?auto_1005341 ) ) ( not ( = ?auto_1005340 ?auto_1005342 ) ) ( not ( = ?auto_1005340 ?auto_1005343 ) ) ( not ( = ?auto_1005340 ?auto_1005344 ) ) ( not ( = ?auto_1005340 ?auto_1005345 ) ) ( not ( = ?auto_1005340 ?auto_1005346 ) ) ( not ( = ?auto_1005340 ?auto_1005347 ) ) ( not ( = ?auto_1005340 ?auto_1005348 ) ) ( not ( = ?auto_1005340 ?auto_1005349 ) ) ( not ( = ?auto_1005341 ?auto_1005342 ) ) ( not ( = ?auto_1005341 ?auto_1005343 ) ) ( not ( = ?auto_1005341 ?auto_1005344 ) ) ( not ( = ?auto_1005341 ?auto_1005345 ) ) ( not ( = ?auto_1005341 ?auto_1005346 ) ) ( not ( = ?auto_1005341 ?auto_1005347 ) ) ( not ( = ?auto_1005341 ?auto_1005348 ) ) ( not ( = ?auto_1005341 ?auto_1005349 ) ) ( not ( = ?auto_1005342 ?auto_1005343 ) ) ( not ( = ?auto_1005342 ?auto_1005344 ) ) ( not ( = ?auto_1005342 ?auto_1005345 ) ) ( not ( = ?auto_1005342 ?auto_1005346 ) ) ( not ( = ?auto_1005342 ?auto_1005347 ) ) ( not ( = ?auto_1005342 ?auto_1005348 ) ) ( not ( = ?auto_1005342 ?auto_1005349 ) ) ( not ( = ?auto_1005343 ?auto_1005344 ) ) ( not ( = ?auto_1005343 ?auto_1005345 ) ) ( not ( = ?auto_1005343 ?auto_1005346 ) ) ( not ( = ?auto_1005343 ?auto_1005347 ) ) ( not ( = ?auto_1005343 ?auto_1005348 ) ) ( not ( = ?auto_1005343 ?auto_1005349 ) ) ( not ( = ?auto_1005344 ?auto_1005345 ) ) ( not ( = ?auto_1005344 ?auto_1005346 ) ) ( not ( = ?auto_1005344 ?auto_1005347 ) ) ( not ( = ?auto_1005344 ?auto_1005348 ) ) ( not ( = ?auto_1005344 ?auto_1005349 ) ) ( not ( = ?auto_1005345 ?auto_1005346 ) ) ( not ( = ?auto_1005345 ?auto_1005347 ) ) ( not ( = ?auto_1005345 ?auto_1005348 ) ) ( not ( = ?auto_1005345 ?auto_1005349 ) ) ( not ( = ?auto_1005346 ?auto_1005347 ) ) ( not ( = ?auto_1005346 ?auto_1005348 ) ) ( not ( = ?auto_1005346 ?auto_1005349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005347 ?auto_1005348 ?auto_1005349 )
      ( MAKE-11CRATE-VERIFY ?auto_1005338 ?auto_1005339 ?auto_1005340 ?auto_1005341 ?auto_1005342 ?auto_1005343 ?auto_1005344 ?auto_1005345 ?auto_1005346 ?auto_1005347 ?auto_1005348 ?auto_1005349 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005470 - SURFACE
      ?auto_1005471 - SURFACE
      ?auto_1005472 - SURFACE
      ?auto_1005473 - SURFACE
      ?auto_1005474 - SURFACE
      ?auto_1005475 - SURFACE
      ?auto_1005476 - SURFACE
      ?auto_1005477 - SURFACE
      ?auto_1005478 - SURFACE
      ?auto_1005479 - SURFACE
      ?auto_1005480 - SURFACE
      ?auto_1005481 - SURFACE
    )
    :vars
    (
      ?auto_1005483 - HOIST
      ?auto_1005486 - PLACE
      ?auto_1005482 - TRUCK
      ?auto_1005485 - PLACE
      ?auto_1005484 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005483 ?auto_1005486 ) ( SURFACE-AT ?auto_1005480 ?auto_1005486 ) ( CLEAR ?auto_1005480 ) ( IS-CRATE ?auto_1005481 ) ( not ( = ?auto_1005480 ?auto_1005481 ) ) ( AVAILABLE ?auto_1005483 ) ( ON ?auto_1005480 ?auto_1005479 ) ( not ( = ?auto_1005479 ?auto_1005480 ) ) ( not ( = ?auto_1005479 ?auto_1005481 ) ) ( TRUCK-AT ?auto_1005482 ?auto_1005485 ) ( not ( = ?auto_1005485 ?auto_1005486 ) ) ( HOIST-AT ?auto_1005484 ?auto_1005485 ) ( LIFTING ?auto_1005484 ?auto_1005481 ) ( not ( = ?auto_1005483 ?auto_1005484 ) ) ( ON ?auto_1005471 ?auto_1005470 ) ( ON ?auto_1005472 ?auto_1005471 ) ( ON ?auto_1005473 ?auto_1005472 ) ( ON ?auto_1005474 ?auto_1005473 ) ( ON ?auto_1005475 ?auto_1005474 ) ( ON ?auto_1005476 ?auto_1005475 ) ( ON ?auto_1005477 ?auto_1005476 ) ( ON ?auto_1005478 ?auto_1005477 ) ( ON ?auto_1005479 ?auto_1005478 ) ( not ( = ?auto_1005470 ?auto_1005471 ) ) ( not ( = ?auto_1005470 ?auto_1005472 ) ) ( not ( = ?auto_1005470 ?auto_1005473 ) ) ( not ( = ?auto_1005470 ?auto_1005474 ) ) ( not ( = ?auto_1005470 ?auto_1005475 ) ) ( not ( = ?auto_1005470 ?auto_1005476 ) ) ( not ( = ?auto_1005470 ?auto_1005477 ) ) ( not ( = ?auto_1005470 ?auto_1005478 ) ) ( not ( = ?auto_1005470 ?auto_1005479 ) ) ( not ( = ?auto_1005470 ?auto_1005480 ) ) ( not ( = ?auto_1005470 ?auto_1005481 ) ) ( not ( = ?auto_1005471 ?auto_1005472 ) ) ( not ( = ?auto_1005471 ?auto_1005473 ) ) ( not ( = ?auto_1005471 ?auto_1005474 ) ) ( not ( = ?auto_1005471 ?auto_1005475 ) ) ( not ( = ?auto_1005471 ?auto_1005476 ) ) ( not ( = ?auto_1005471 ?auto_1005477 ) ) ( not ( = ?auto_1005471 ?auto_1005478 ) ) ( not ( = ?auto_1005471 ?auto_1005479 ) ) ( not ( = ?auto_1005471 ?auto_1005480 ) ) ( not ( = ?auto_1005471 ?auto_1005481 ) ) ( not ( = ?auto_1005472 ?auto_1005473 ) ) ( not ( = ?auto_1005472 ?auto_1005474 ) ) ( not ( = ?auto_1005472 ?auto_1005475 ) ) ( not ( = ?auto_1005472 ?auto_1005476 ) ) ( not ( = ?auto_1005472 ?auto_1005477 ) ) ( not ( = ?auto_1005472 ?auto_1005478 ) ) ( not ( = ?auto_1005472 ?auto_1005479 ) ) ( not ( = ?auto_1005472 ?auto_1005480 ) ) ( not ( = ?auto_1005472 ?auto_1005481 ) ) ( not ( = ?auto_1005473 ?auto_1005474 ) ) ( not ( = ?auto_1005473 ?auto_1005475 ) ) ( not ( = ?auto_1005473 ?auto_1005476 ) ) ( not ( = ?auto_1005473 ?auto_1005477 ) ) ( not ( = ?auto_1005473 ?auto_1005478 ) ) ( not ( = ?auto_1005473 ?auto_1005479 ) ) ( not ( = ?auto_1005473 ?auto_1005480 ) ) ( not ( = ?auto_1005473 ?auto_1005481 ) ) ( not ( = ?auto_1005474 ?auto_1005475 ) ) ( not ( = ?auto_1005474 ?auto_1005476 ) ) ( not ( = ?auto_1005474 ?auto_1005477 ) ) ( not ( = ?auto_1005474 ?auto_1005478 ) ) ( not ( = ?auto_1005474 ?auto_1005479 ) ) ( not ( = ?auto_1005474 ?auto_1005480 ) ) ( not ( = ?auto_1005474 ?auto_1005481 ) ) ( not ( = ?auto_1005475 ?auto_1005476 ) ) ( not ( = ?auto_1005475 ?auto_1005477 ) ) ( not ( = ?auto_1005475 ?auto_1005478 ) ) ( not ( = ?auto_1005475 ?auto_1005479 ) ) ( not ( = ?auto_1005475 ?auto_1005480 ) ) ( not ( = ?auto_1005475 ?auto_1005481 ) ) ( not ( = ?auto_1005476 ?auto_1005477 ) ) ( not ( = ?auto_1005476 ?auto_1005478 ) ) ( not ( = ?auto_1005476 ?auto_1005479 ) ) ( not ( = ?auto_1005476 ?auto_1005480 ) ) ( not ( = ?auto_1005476 ?auto_1005481 ) ) ( not ( = ?auto_1005477 ?auto_1005478 ) ) ( not ( = ?auto_1005477 ?auto_1005479 ) ) ( not ( = ?auto_1005477 ?auto_1005480 ) ) ( not ( = ?auto_1005477 ?auto_1005481 ) ) ( not ( = ?auto_1005478 ?auto_1005479 ) ) ( not ( = ?auto_1005478 ?auto_1005480 ) ) ( not ( = ?auto_1005478 ?auto_1005481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005479 ?auto_1005480 ?auto_1005481 )
      ( MAKE-11CRATE-VERIFY ?auto_1005470 ?auto_1005471 ?auto_1005472 ?auto_1005473 ?auto_1005474 ?auto_1005475 ?auto_1005476 ?auto_1005477 ?auto_1005478 ?auto_1005479 ?auto_1005480 ?auto_1005481 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005613 - SURFACE
      ?auto_1005614 - SURFACE
      ?auto_1005615 - SURFACE
      ?auto_1005616 - SURFACE
      ?auto_1005617 - SURFACE
      ?auto_1005618 - SURFACE
      ?auto_1005619 - SURFACE
      ?auto_1005620 - SURFACE
      ?auto_1005621 - SURFACE
      ?auto_1005622 - SURFACE
      ?auto_1005623 - SURFACE
      ?auto_1005624 - SURFACE
    )
    :vars
    (
      ?auto_1005630 - HOIST
      ?auto_1005627 - PLACE
      ?auto_1005625 - TRUCK
      ?auto_1005629 - PLACE
      ?auto_1005628 - HOIST
      ?auto_1005626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005630 ?auto_1005627 ) ( SURFACE-AT ?auto_1005623 ?auto_1005627 ) ( CLEAR ?auto_1005623 ) ( IS-CRATE ?auto_1005624 ) ( not ( = ?auto_1005623 ?auto_1005624 ) ) ( AVAILABLE ?auto_1005630 ) ( ON ?auto_1005623 ?auto_1005622 ) ( not ( = ?auto_1005622 ?auto_1005623 ) ) ( not ( = ?auto_1005622 ?auto_1005624 ) ) ( TRUCK-AT ?auto_1005625 ?auto_1005629 ) ( not ( = ?auto_1005629 ?auto_1005627 ) ) ( HOIST-AT ?auto_1005628 ?auto_1005629 ) ( not ( = ?auto_1005630 ?auto_1005628 ) ) ( AVAILABLE ?auto_1005628 ) ( SURFACE-AT ?auto_1005624 ?auto_1005629 ) ( ON ?auto_1005624 ?auto_1005626 ) ( CLEAR ?auto_1005624 ) ( not ( = ?auto_1005623 ?auto_1005626 ) ) ( not ( = ?auto_1005624 ?auto_1005626 ) ) ( not ( = ?auto_1005622 ?auto_1005626 ) ) ( ON ?auto_1005614 ?auto_1005613 ) ( ON ?auto_1005615 ?auto_1005614 ) ( ON ?auto_1005616 ?auto_1005615 ) ( ON ?auto_1005617 ?auto_1005616 ) ( ON ?auto_1005618 ?auto_1005617 ) ( ON ?auto_1005619 ?auto_1005618 ) ( ON ?auto_1005620 ?auto_1005619 ) ( ON ?auto_1005621 ?auto_1005620 ) ( ON ?auto_1005622 ?auto_1005621 ) ( not ( = ?auto_1005613 ?auto_1005614 ) ) ( not ( = ?auto_1005613 ?auto_1005615 ) ) ( not ( = ?auto_1005613 ?auto_1005616 ) ) ( not ( = ?auto_1005613 ?auto_1005617 ) ) ( not ( = ?auto_1005613 ?auto_1005618 ) ) ( not ( = ?auto_1005613 ?auto_1005619 ) ) ( not ( = ?auto_1005613 ?auto_1005620 ) ) ( not ( = ?auto_1005613 ?auto_1005621 ) ) ( not ( = ?auto_1005613 ?auto_1005622 ) ) ( not ( = ?auto_1005613 ?auto_1005623 ) ) ( not ( = ?auto_1005613 ?auto_1005624 ) ) ( not ( = ?auto_1005613 ?auto_1005626 ) ) ( not ( = ?auto_1005614 ?auto_1005615 ) ) ( not ( = ?auto_1005614 ?auto_1005616 ) ) ( not ( = ?auto_1005614 ?auto_1005617 ) ) ( not ( = ?auto_1005614 ?auto_1005618 ) ) ( not ( = ?auto_1005614 ?auto_1005619 ) ) ( not ( = ?auto_1005614 ?auto_1005620 ) ) ( not ( = ?auto_1005614 ?auto_1005621 ) ) ( not ( = ?auto_1005614 ?auto_1005622 ) ) ( not ( = ?auto_1005614 ?auto_1005623 ) ) ( not ( = ?auto_1005614 ?auto_1005624 ) ) ( not ( = ?auto_1005614 ?auto_1005626 ) ) ( not ( = ?auto_1005615 ?auto_1005616 ) ) ( not ( = ?auto_1005615 ?auto_1005617 ) ) ( not ( = ?auto_1005615 ?auto_1005618 ) ) ( not ( = ?auto_1005615 ?auto_1005619 ) ) ( not ( = ?auto_1005615 ?auto_1005620 ) ) ( not ( = ?auto_1005615 ?auto_1005621 ) ) ( not ( = ?auto_1005615 ?auto_1005622 ) ) ( not ( = ?auto_1005615 ?auto_1005623 ) ) ( not ( = ?auto_1005615 ?auto_1005624 ) ) ( not ( = ?auto_1005615 ?auto_1005626 ) ) ( not ( = ?auto_1005616 ?auto_1005617 ) ) ( not ( = ?auto_1005616 ?auto_1005618 ) ) ( not ( = ?auto_1005616 ?auto_1005619 ) ) ( not ( = ?auto_1005616 ?auto_1005620 ) ) ( not ( = ?auto_1005616 ?auto_1005621 ) ) ( not ( = ?auto_1005616 ?auto_1005622 ) ) ( not ( = ?auto_1005616 ?auto_1005623 ) ) ( not ( = ?auto_1005616 ?auto_1005624 ) ) ( not ( = ?auto_1005616 ?auto_1005626 ) ) ( not ( = ?auto_1005617 ?auto_1005618 ) ) ( not ( = ?auto_1005617 ?auto_1005619 ) ) ( not ( = ?auto_1005617 ?auto_1005620 ) ) ( not ( = ?auto_1005617 ?auto_1005621 ) ) ( not ( = ?auto_1005617 ?auto_1005622 ) ) ( not ( = ?auto_1005617 ?auto_1005623 ) ) ( not ( = ?auto_1005617 ?auto_1005624 ) ) ( not ( = ?auto_1005617 ?auto_1005626 ) ) ( not ( = ?auto_1005618 ?auto_1005619 ) ) ( not ( = ?auto_1005618 ?auto_1005620 ) ) ( not ( = ?auto_1005618 ?auto_1005621 ) ) ( not ( = ?auto_1005618 ?auto_1005622 ) ) ( not ( = ?auto_1005618 ?auto_1005623 ) ) ( not ( = ?auto_1005618 ?auto_1005624 ) ) ( not ( = ?auto_1005618 ?auto_1005626 ) ) ( not ( = ?auto_1005619 ?auto_1005620 ) ) ( not ( = ?auto_1005619 ?auto_1005621 ) ) ( not ( = ?auto_1005619 ?auto_1005622 ) ) ( not ( = ?auto_1005619 ?auto_1005623 ) ) ( not ( = ?auto_1005619 ?auto_1005624 ) ) ( not ( = ?auto_1005619 ?auto_1005626 ) ) ( not ( = ?auto_1005620 ?auto_1005621 ) ) ( not ( = ?auto_1005620 ?auto_1005622 ) ) ( not ( = ?auto_1005620 ?auto_1005623 ) ) ( not ( = ?auto_1005620 ?auto_1005624 ) ) ( not ( = ?auto_1005620 ?auto_1005626 ) ) ( not ( = ?auto_1005621 ?auto_1005622 ) ) ( not ( = ?auto_1005621 ?auto_1005623 ) ) ( not ( = ?auto_1005621 ?auto_1005624 ) ) ( not ( = ?auto_1005621 ?auto_1005626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005622 ?auto_1005623 ?auto_1005624 )
      ( MAKE-11CRATE-VERIFY ?auto_1005613 ?auto_1005614 ?auto_1005615 ?auto_1005616 ?auto_1005617 ?auto_1005618 ?auto_1005619 ?auto_1005620 ?auto_1005621 ?auto_1005622 ?auto_1005623 ?auto_1005624 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005757 - SURFACE
      ?auto_1005758 - SURFACE
      ?auto_1005759 - SURFACE
      ?auto_1005760 - SURFACE
      ?auto_1005761 - SURFACE
      ?auto_1005762 - SURFACE
      ?auto_1005763 - SURFACE
      ?auto_1005764 - SURFACE
      ?auto_1005765 - SURFACE
      ?auto_1005766 - SURFACE
      ?auto_1005767 - SURFACE
      ?auto_1005768 - SURFACE
    )
    :vars
    (
      ?auto_1005771 - HOIST
      ?auto_1005774 - PLACE
      ?auto_1005769 - PLACE
      ?auto_1005773 - HOIST
      ?auto_1005772 - SURFACE
      ?auto_1005770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005771 ?auto_1005774 ) ( SURFACE-AT ?auto_1005767 ?auto_1005774 ) ( CLEAR ?auto_1005767 ) ( IS-CRATE ?auto_1005768 ) ( not ( = ?auto_1005767 ?auto_1005768 ) ) ( AVAILABLE ?auto_1005771 ) ( ON ?auto_1005767 ?auto_1005766 ) ( not ( = ?auto_1005766 ?auto_1005767 ) ) ( not ( = ?auto_1005766 ?auto_1005768 ) ) ( not ( = ?auto_1005769 ?auto_1005774 ) ) ( HOIST-AT ?auto_1005773 ?auto_1005769 ) ( not ( = ?auto_1005771 ?auto_1005773 ) ) ( AVAILABLE ?auto_1005773 ) ( SURFACE-AT ?auto_1005768 ?auto_1005769 ) ( ON ?auto_1005768 ?auto_1005772 ) ( CLEAR ?auto_1005768 ) ( not ( = ?auto_1005767 ?auto_1005772 ) ) ( not ( = ?auto_1005768 ?auto_1005772 ) ) ( not ( = ?auto_1005766 ?auto_1005772 ) ) ( TRUCK-AT ?auto_1005770 ?auto_1005774 ) ( ON ?auto_1005758 ?auto_1005757 ) ( ON ?auto_1005759 ?auto_1005758 ) ( ON ?auto_1005760 ?auto_1005759 ) ( ON ?auto_1005761 ?auto_1005760 ) ( ON ?auto_1005762 ?auto_1005761 ) ( ON ?auto_1005763 ?auto_1005762 ) ( ON ?auto_1005764 ?auto_1005763 ) ( ON ?auto_1005765 ?auto_1005764 ) ( ON ?auto_1005766 ?auto_1005765 ) ( not ( = ?auto_1005757 ?auto_1005758 ) ) ( not ( = ?auto_1005757 ?auto_1005759 ) ) ( not ( = ?auto_1005757 ?auto_1005760 ) ) ( not ( = ?auto_1005757 ?auto_1005761 ) ) ( not ( = ?auto_1005757 ?auto_1005762 ) ) ( not ( = ?auto_1005757 ?auto_1005763 ) ) ( not ( = ?auto_1005757 ?auto_1005764 ) ) ( not ( = ?auto_1005757 ?auto_1005765 ) ) ( not ( = ?auto_1005757 ?auto_1005766 ) ) ( not ( = ?auto_1005757 ?auto_1005767 ) ) ( not ( = ?auto_1005757 ?auto_1005768 ) ) ( not ( = ?auto_1005757 ?auto_1005772 ) ) ( not ( = ?auto_1005758 ?auto_1005759 ) ) ( not ( = ?auto_1005758 ?auto_1005760 ) ) ( not ( = ?auto_1005758 ?auto_1005761 ) ) ( not ( = ?auto_1005758 ?auto_1005762 ) ) ( not ( = ?auto_1005758 ?auto_1005763 ) ) ( not ( = ?auto_1005758 ?auto_1005764 ) ) ( not ( = ?auto_1005758 ?auto_1005765 ) ) ( not ( = ?auto_1005758 ?auto_1005766 ) ) ( not ( = ?auto_1005758 ?auto_1005767 ) ) ( not ( = ?auto_1005758 ?auto_1005768 ) ) ( not ( = ?auto_1005758 ?auto_1005772 ) ) ( not ( = ?auto_1005759 ?auto_1005760 ) ) ( not ( = ?auto_1005759 ?auto_1005761 ) ) ( not ( = ?auto_1005759 ?auto_1005762 ) ) ( not ( = ?auto_1005759 ?auto_1005763 ) ) ( not ( = ?auto_1005759 ?auto_1005764 ) ) ( not ( = ?auto_1005759 ?auto_1005765 ) ) ( not ( = ?auto_1005759 ?auto_1005766 ) ) ( not ( = ?auto_1005759 ?auto_1005767 ) ) ( not ( = ?auto_1005759 ?auto_1005768 ) ) ( not ( = ?auto_1005759 ?auto_1005772 ) ) ( not ( = ?auto_1005760 ?auto_1005761 ) ) ( not ( = ?auto_1005760 ?auto_1005762 ) ) ( not ( = ?auto_1005760 ?auto_1005763 ) ) ( not ( = ?auto_1005760 ?auto_1005764 ) ) ( not ( = ?auto_1005760 ?auto_1005765 ) ) ( not ( = ?auto_1005760 ?auto_1005766 ) ) ( not ( = ?auto_1005760 ?auto_1005767 ) ) ( not ( = ?auto_1005760 ?auto_1005768 ) ) ( not ( = ?auto_1005760 ?auto_1005772 ) ) ( not ( = ?auto_1005761 ?auto_1005762 ) ) ( not ( = ?auto_1005761 ?auto_1005763 ) ) ( not ( = ?auto_1005761 ?auto_1005764 ) ) ( not ( = ?auto_1005761 ?auto_1005765 ) ) ( not ( = ?auto_1005761 ?auto_1005766 ) ) ( not ( = ?auto_1005761 ?auto_1005767 ) ) ( not ( = ?auto_1005761 ?auto_1005768 ) ) ( not ( = ?auto_1005761 ?auto_1005772 ) ) ( not ( = ?auto_1005762 ?auto_1005763 ) ) ( not ( = ?auto_1005762 ?auto_1005764 ) ) ( not ( = ?auto_1005762 ?auto_1005765 ) ) ( not ( = ?auto_1005762 ?auto_1005766 ) ) ( not ( = ?auto_1005762 ?auto_1005767 ) ) ( not ( = ?auto_1005762 ?auto_1005768 ) ) ( not ( = ?auto_1005762 ?auto_1005772 ) ) ( not ( = ?auto_1005763 ?auto_1005764 ) ) ( not ( = ?auto_1005763 ?auto_1005765 ) ) ( not ( = ?auto_1005763 ?auto_1005766 ) ) ( not ( = ?auto_1005763 ?auto_1005767 ) ) ( not ( = ?auto_1005763 ?auto_1005768 ) ) ( not ( = ?auto_1005763 ?auto_1005772 ) ) ( not ( = ?auto_1005764 ?auto_1005765 ) ) ( not ( = ?auto_1005764 ?auto_1005766 ) ) ( not ( = ?auto_1005764 ?auto_1005767 ) ) ( not ( = ?auto_1005764 ?auto_1005768 ) ) ( not ( = ?auto_1005764 ?auto_1005772 ) ) ( not ( = ?auto_1005765 ?auto_1005766 ) ) ( not ( = ?auto_1005765 ?auto_1005767 ) ) ( not ( = ?auto_1005765 ?auto_1005768 ) ) ( not ( = ?auto_1005765 ?auto_1005772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005766 ?auto_1005767 ?auto_1005768 )
      ( MAKE-11CRATE-VERIFY ?auto_1005757 ?auto_1005758 ?auto_1005759 ?auto_1005760 ?auto_1005761 ?auto_1005762 ?auto_1005763 ?auto_1005764 ?auto_1005765 ?auto_1005766 ?auto_1005767 ?auto_1005768 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005901 - SURFACE
      ?auto_1005902 - SURFACE
      ?auto_1005903 - SURFACE
      ?auto_1005904 - SURFACE
      ?auto_1005905 - SURFACE
      ?auto_1005906 - SURFACE
      ?auto_1005907 - SURFACE
      ?auto_1005908 - SURFACE
      ?auto_1005909 - SURFACE
      ?auto_1005910 - SURFACE
      ?auto_1005911 - SURFACE
      ?auto_1005912 - SURFACE
    )
    :vars
    (
      ?auto_1005916 - HOIST
      ?auto_1005913 - PLACE
      ?auto_1005917 - PLACE
      ?auto_1005914 - HOIST
      ?auto_1005915 - SURFACE
      ?auto_1005918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005916 ?auto_1005913 ) ( IS-CRATE ?auto_1005912 ) ( not ( = ?auto_1005911 ?auto_1005912 ) ) ( not ( = ?auto_1005910 ?auto_1005911 ) ) ( not ( = ?auto_1005910 ?auto_1005912 ) ) ( not ( = ?auto_1005917 ?auto_1005913 ) ) ( HOIST-AT ?auto_1005914 ?auto_1005917 ) ( not ( = ?auto_1005916 ?auto_1005914 ) ) ( AVAILABLE ?auto_1005914 ) ( SURFACE-AT ?auto_1005912 ?auto_1005917 ) ( ON ?auto_1005912 ?auto_1005915 ) ( CLEAR ?auto_1005912 ) ( not ( = ?auto_1005911 ?auto_1005915 ) ) ( not ( = ?auto_1005912 ?auto_1005915 ) ) ( not ( = ?auto_1005910 ?auto_1005915 ) ) ( TRUCK-AT ?auto_1005918 ?auto_1005913 ) ( SURFACE-AT ?auto_1005910 ?auto_1005913 ) ( CLEAR ?auto_1005910 ) ( LIFTING ?auto_1005916 ?auto_1005911 ) ( IS-CRATE ?auto_1005911 ) ( ON ?auto_1005902 ?auto_1005901 ) ( ON ?auto_1005903 ?auto_1005902 ) ( ON ?auto_1005904 ?auto_1005903 ) ( ON ?auto_1005905 ?auto_1005904 ) ( ON ?auto_1005906 ?auto_1005905 ) ( ON ?auto_1005907 ?auto_1005906 ) ( ON ?auto_1005908 ?auto_1005907 ) ( ON ?auto_1005909 ?auto_1005908 ) ( ON ?auto_1005910 ?auto_1005909 ) ( not ( = ?auto_1005901 ?auto_1005902 ) ) ( not ( = ?auto_1005901 ?auto_1005903 ) ) ( not ( = ?auto_1005901 ?auto_1005904 ) ) ( not ( = ?auto_1005901 ?auto_1005905 ) ) ( not ( = ?auto_1005901 ?auto_1005906 ) ) ( not ( = ?auto_1005901 ?auto_1005907 ) ) ( not ( = ?auto_1005901 ?auto_1005908 ) ) ( not ( = ?auto_1005901 ?auto_1005909 ) ) ( not ( = ?auto_1005901 ?auto_1005910 ) ) ( not ( = ?auto_1005901 ?auto_1005911 ) ) ( not ( = ?auto_1005901 ?auto_1005912 ) ) ( not ( = ?auto_1005901 ?auto_1005915 ) ) ( not ( = ?auto_1005902 ?auto_1005903 ) ) ( not ( = ?auto_1005902 ?auto_1005904 ) ) ( not ( = ?auto_1005902 ?auto_1005905 ) ) ( not ( = ?auto_1005902 ?auto_1005906 ) ) ( not ( = ?auto_1005902 ?auto_1005907 ) ) ( not ( = ?auto_1005902 ?auto_1005908 ) ) ( not ( = ?auto_1005902 ?auto_1005909 ) ) ( not ( = ?auto_1005902 ?auto_1005910 ) ) ( not ( = ?auto_1005902 ?auto_1005911 ) ) ( not ( = ?auto_1005902 ?auto_1005912 ) ) ( not ( = ?auto_1005902 ?auto_1005915 ) ) ( not ( = ?auto_1005903 ?auto_1005904 ) ) ( not ( = ?auto_1005903 ?auto_1005905 ) ) ( not ( = ?auto_1005903 ?auto_1005906 ) ) ( not ( = ?auto_1005903 ?auto_1005907 ) ) ( not ( = ?auto_1005903 ?auto_1005908 ) ) ( not ( = ?auto_1005903 ?auto_1005909 ) ) ( not ( = ?auto_1005903 ?auto_1005910 ) ) ( not ( = ?auto_1005903 ?auto_1005911 ) ) ( not ( = ?auto_1005903 ?auto_1005912 ) ) ( not ( = ?auto_1005903 ?auto_1005915 ) ) ( not ( = ?auto_1005904 ?auto_1005905 ) ) ( not ( = ?auto_1005904 ?auto_1005906 ) ) ( not ( = ?auto_1005904 ?auto_1005907 ) ) ( not ( = ?auto_1005904 ?auto_1005908 ) ) ( not ( = ?auto_1005904 ?auto_1005909 ) ) ( not ( = ?auto_1005904 ?auto_1005910 ) ) ( not ( = ?auto_1005904 ?auto_1005911 ) ) ( not ( = ?auto_1005904 ?auto_1005912 ) ) ( not ( = ?auto_1005904 ?auto_1005915 ) ) ( not ( = ?auto_1005905 ?auto_1005906 ) ) ( not ( = ?auto_1005905 ?auto_1005907 ) ) ( not ( = ?auto_1005905 ?auto_1005908 ) ) ( not ( = ?auto_1005905 ?auto_1005909 ) ) ( not ( = ?auto_1005905 ?auto_1005910 ) ) ( not ( = ?auto_1005905 ?auto_1005911 ) ) ( not ( = ?auto_1005905 ?auto_1005912 ) ) ( not ( = ?auto_1005905 ?auto_1005915 ) ) ( not ( = ?auto_1005906 ?auto_1005907 ) ) ( not ( = ?auto_1005906 ?auto_1005908 ) ) ( not ( = ?auto_1005906 ?auto_1005909 ) ) ( not ( = ?auto_1005906 ?auto_1005910 ) ) ( not ( = ?auto_1005906 ?auto_1005911 ) ) ( not ( = ?auto_1005906 ?auto_1005912 ) ) ( not ( = ?auto_1005906 ?auto_1005915 ) ) ( not ( = ?auto_1005907 ?auto_1005908 ) ) ( not ( = ?auto_1005907 ?auto_1005909 ) ) ( not ( = ?auto_1005907 ?auto_1005910 ) ) ( not ( = ?auto_1005907 ?auto_1005911 ) ) ( not ( = ?auto_1005907 ?auto_1005912 ) ) ( not ( = ?auto_1005907 ?auto_1005915 ) ) ( not ( = ?auto_1005908 ?auto_1005909 ) ) ( not ( = ?auto_1005908 ?auto_1005910 ) ) ( not ( = ?auto_1005908 ?auto_1005911 ) ) ( not ( = ?auto_1005908 ?auto_1005912 ) ) ( not ( = ?auto_1005908 ?auto_1005915 ) ) ( not ( = ?auto_1005909 ?auto_1005910 ) ) ( not ( = ?auto_1005909 ?auto_1005911 ) ) ( not ( = ?auto_1005909 ?auto_1005912 ) ) ( not ( = ?auto_1005909 ?auto_1005915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005910 ?auto_1005911 ?auto_1005912 )
      ( MAKE-11CRATE-VERIFY ?auto_1005901 ?auto_1005902 ?auto_1005903 ?auto_1005904 ?auto_1005905 ?auto_1005906 ?auto_1005907 ?auto_1005908 ?auto_1005909 ?auto_1005910 ?auto_1005911 ?auto_1005912 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006045 - SURFACE
      ?auto_1006046 - SURFACE
      ?auto_1006047 - SURFACE
      ?auto_1006048 - SURFACE
      ?auto_1006049 - SURFACE
      ?auto_1006050 - SURFACE
      ?auto_1006051 - SURFACE
      ?auto_1006052 - SURFACE
      ?auto_1006053 - SURFACE
      ?auto_1006054 - SURFACE
      ?auto_1006055 - SURFACE
      ?auto_1006056 - SURFACE
    )
    :vars
    (
      ?auto_1006058 - HOIST
      ?auto_1006057 - PLACE
      ?auto_1006061 - PLACE
      ?auto_1006062 - HOIST
      ?auto_1006059 - SURFACE
      ?auto_1006060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006058 ?auto_1006057 ) ( IS-CRATE ?auto_1006056 ) ( not ( = ?auto_1006055 ?auto_1006056 ) ) ( not ( = ?auto_1006054 ?auto_1006055 ) ) ( not ( = ?auto_1006054 ?auto_1006056 ) ) ( not ( = ?auto_1006061 ?auto_1006057 ) ) ( HOIST-AT ?auto_1006062 ?auto_1006061 ) ( not ( = ?auto_1006058 ?auto_1006062 ) ) ( AVAILABLE ?auto_1006062 ) ( SURFACE-AT ?auto_1006056 ?auto_1006061 ) ( ON ?auto_1006056 ?auto_1006059 ) ( CLEAR ?auto_1006056 ) ( not ( = ?auto_1006055 ?auto_1006059 ) ) ( not ( = ?auto_1006056 ?auto_1006059 ) ) ( not ( = ?auto_1006054 ?auto_1006059 ) ) ( TRUCK-AT ?auto_1006060 ?auto_1006057 ) ( SURFACE-AT ?auto_1006054 ?auto_1006057 ) ( CLEAR ?auto_1006054 ) ( IS-CRATE ?auto_1006055 ) ( AVAILABLE ?auto_1006058 ) ( IN ?auto_1006055 ?auto_1006060 ) ( ON ?auto_1006046 ?auto_1006045 ) ( ON ?auto_1006047 ?auto_1006046 ) ( ON ?auto_1006048 ?auto_1006047 ) ( ON ?auto_1006049 ?auto_1006048 ) ( ON ?auto_1006050 ?auto_1006049 ) ( ON ?auto_1006051 ?auto_1006050 ) ( ON ?auto_1006052 ?auto_1006051 ) ( ON ?auto_1006053 ?auto_1006052 ) ( ON ?auto_1006054 ?auto_1006053 ) ( not ( = ?auto_1006045 ?auto_1006046 ) ) ( not ( = ?auto_1006045 ?auto_1006047 ) ) ( not ( = ?auto_1006045 ?auto_1006048 ) ) ( not ( = ?auto_1006045 ?auto_1006049 ) ) ( not ( = ?auto_1006045 ?auto_1006050 ) ) ( not ( = ?auto_1006045 ?auto_1006051 ) ) ( not ( = ?auto_1006045 ?auto_1006052 ) ) ( not ( = ?auto_1006045 ?auto_1006053 ) ) ( not ( = ?auto_1006045 ?auto_1006054 ) ) ( not ( = ?auto_1006045 ?auto_1006055 ) ) ( not ( = ?auto_1006045 ?auto_1006056 ) ) ( not ( = ?auto_1006045 ?auto_1006059 ) ) ( not ( = ?auto_1006046 ?auto_1006047 ) ) ( not ( = ?auto_1006046 ?auto_1006048 ) ) ( not ( = ?auto_1006046 ?auto_1006049 ) ) ( not ( = ?auto_1006046 ?auto_1006050 ) ) ( not ( = ?auto_1006046 ?auto_1006051 ) ) ( not ( = ?auto_1006046 ?auto_1006052 ) ) ( not ( = ?auto_1006046 ?auto_1006053 ) ) ( not ( = ?auto_1006046 ?auto_1006054 ) ) ( not ( = ?auto_1006046 ?auto_1006055 ) ) ( not ( = ?auto_1006046 ?auto_1006056 ) ) ( not ( = ?auto_1006046 ?auto_1006059 ) ) ( not ( = ?auto_1006047 ?auto_1006048 ) ) ( not ( = ?auto_1006047 ?auto_1006049 ) ) ( not ( = ?auto_1006047 ?auto_1006050 ) ) ( not ( = ?auto_1006047 ?auto_1006051 ) ) ( not ( = ?auto_1006047 ?auto_1006052 ) ) ( not ( = ?auto_1006047 ?auto_1006053 ) ) ( not ( = ?auto_1006047 ?auto_1006054 ) ) ( not ( = ?auto_1006047 ?auto_1006055 ) ) ( not ( = ?auto_1006047 ?auto_1006056 ) ) ( not ( = ?auto_1006047 ?auto_1006059 ) ) ( not ( = ?auto_1006048 ?auto_1006049 ) ) ( not ( = ?auto_1006048 ?auto_1006050 ) ) ( not ( = ?auto_1006048 ?auto_1006051 ) ) ( not ( = ?auto_1006048 ?auto_1006052 ) ) ( not ( = ?auto_1006048 ?auto_1006053 ) ) ( not ( = ?auto_1006048 ?auto_1006054 ) ) ( not ( = ?auto_1006048 ?auto_1006055 ) ) ( not ( = ?auto_1006048 ?auto_1006056 ) ) ( not ( = ?auto_1006048 ?auto_1006059 ) ) ( not ( = ?auto_1006049 ?auto_1006050 ) ) ( not ( = ?auto_1006049 ?auto_1006051 ) ) ( not ( = ?auto_1006049 ?auto_1006052 ) ) ( not ( = ?auto_1006049 ?auto_1006053 ) ) ( not ( = ?auto_1006049 ?auto_1006054 ) ) ( not ( = ?auto_1006049 ?auto_1006055 ) ) ( not ( = ?auto_1006049 ?auto_1006056 ) ) ( not ( = ?auto_1006049 ?auto_1006059 ) ) ( not ( = ?auto_1006050 ?auto_1006051 ) ) ( not ( = ?auto_1006050 ?auto_1006052 ) ) ( not ( = ?auto_1006050 ?auto_1006053 ) ) ( not ( = ?auto_1006050 ?auto_1006054 ) ) ( not ( = ?auto_1006050 ?auto_1006055 ) ) ( not ( = ?auto_1006050 ?auto_1006056 ) ) ( not ( = ?auto_1006050 ?auto_1006059 ) ) ( not ( = ?auto_1006051 ?auto_1006052 ) ) ( not ( = ?auto_1006051 ?auto_1006053 ) ) ( not ( = ?auto_1006051 ?auto_1006054 ) ) ( not ( = ?auto_1006051 ?auto_1006055 ) ) ( not ( = ?auto_1006051 ?auto_1006056 ) ) ( not ( = ?auto_1006051 ?auto_1006059 ) ) ( not ( = ?auto_1006052 ?auto_1006053 ) ) ( not ( = ?auto_1006052 ?auto_1006054 ) ) ( not ( = ?auto_1006052 ?auto_1006055 ) ) ( not ( = ?auto_1006052 ?auto_1006056 ) ) ( not ( = ?auto_1006052 ?auto_1006059 ) ) ( not ( = ?auto_1006053 ?auto_1006054 ) ) ( not ( = ?auto_1006053 ?auto_1006055 ) ) ( not ( = ?auto_1006053 ?auto_1006056 ) ) ( not ( = ?auto_1006053 ?auto_1006059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006054 ?auto_1006055 ?auto_1006056 )
      ( MAKE-11CRATE-VERIFY ?auto_1006045 ?auto_1006046 ?auto_1006047 ?auto_1006048 ?auto_1006049 ?auto_1006050 ?auto_1006051 ?auto_1006052 ?auto_1006053 ?auto_1006054 ?auto_1006055 ?auto_1006056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1006063 - SURFACE
      ?auto_1006064 - SURFACE
    )
    :vars
    (
      ?auto_1006066 - HOIST
      ?auto_1006065 - PLACE
      ?auto_1006070 - SURFACE
      ?auto_1006069 - PLACE
      ?auto_1006071 - HOIST
      ?auto_1006067 - SURFACE
      ?auto_1006068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006066 ?auto_1006065 ) ( IS-CRATE ?auto_1006064 ) ( not ( = ?auto_1006063 ?auto_1006064 ) ) ( not ( = ?auto_1006070 ?auto_1006063 ) ) ( not ( = ?auto_1006070 ?auto_1006064 ) ) ( not ( = ?auto_1006069 ?auto_1006065 ) ) ( HOIST-AT ?auto_1006071 ?auto_1006069 ) ( not ( = ?auto_1006066 ?auto_1006071 ) ) ( AVAILABLE ?auto_1006071 ) ( SURFACE-AT ?auto_1006064 ?auto_1006069 ) ( ON ?auto_1006064 ?auto_1006067 ) ( CLEAR ?auto_1006064 ) ( not ( = ?auto_1006063 ?auto_1006067 ) ) ( not ( = ?auto_1006064 ?auto_1006067 ) ) ( not ( = ?auto_1006070 ?auto_1006067 ) ) ( SURFACE-AT ?auto_1006070 ?auto_1006065 ) ( CLEAR ?auto_1006070 ) ( IS-CRATE ?auto_1006063 ) ( AVAILABLE ?auto_1006066 ) ( IN ?auto_1006063 ?auto_1006068 ) ( TRUCK-AT ?auto_1006068 ?auto_1006069 ) )
    :subtasks
    ( ( !DRIVE ?auto_1006068 ?auto_1006069 ?auto_1006065 )
      ( MAKE-2CRATE ?auto_1006070 ?auto_1006063 ?auto_1006064 )
      ( MAKE-1CRATE-VERIFY ?auto_1006063 ?auto_1006064 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1006072 - SURFACE
      ?auto_1006073 - SURFACE
      ?auto_1006074 - SURFACE
    )
    :vars
    (
      ?auto_1006076 - HOIST
      ?auto_1006077 - PLACE
      ?auto_1006079 - PLACE
      ?auto_1006080 - HOIST
      ?auto_1006075 - SURFACE
      ?auto_1006078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006076 ?auto_1006077 ) ( IS-CRATE ?auto_1006074 ) ( not ( = ?auto_1006073 ?auto_1006074 ) ) ( not ( = ?auto_1006072 ?auto_1006073 ) ) ( not ( = ?auto_1006072 ?auto_1006074 ) ) ( not ( = ?auto_1006079 ?auto_1006077 ) ) ( HOIST-AT ?auto_1006080 ?auto_1006079 ) ( not ( = ?auto_1006076 ?auto_1006080 ) ) ( AVAILABLE ?auto_1006080 ) ( SURFACE-AT ?auto_1006074 ?auto_1006079 ) ( ON ?auto_1006074 ?auto_1006075 ) ( CLEAR ?auto_1006074 ) ( not ( = ?auto_1006073 ?auto_1006075 ) ) ( not ( = ?auto_1006074 ?auto_1006075 ) ) ( not ( = ?auto_1006072 ?auto_1006075 ) ) ( SURFACE-AT ?auto_1006072 ?auto_1006077 ) ( CLEAR ?auto_1006072 ) ( IS-CRATE ?auto_1006073 ) ( AVAILABLE ?auto_1006076 ) ( IN ?auto_1006073 ?auto_1006078 ) ( TRUCK-AT ?auto_1006078 ?auto_1006079 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1006073 ?auto_1006074 )
      ( MAKE-2CRATE-VERIFY ?auto_1006072 ?auto_1006073 ?auto_1006074 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1006081 - SURFACE
      ?auto_1006082 - SURFACE
      ?auto_1006083 - SURFACE
      ?auto_1006084 - SURFACE
    )
    :vars
    (
      ?auto_1006089 - HOIST
      ?auto_1006088 - PLACE
      ?auto_1006090 - PLACE
      ?auto_1006085 - HOIST
      ?auto_1006087 - SURFACE
      ?auto_1006086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006089 ?auto_1006088 ) ( IS-CRATE ?auto_1006084 ) ( not ( = ?auto_1006083 ?auto_1006084 ) ) ( not ( = ?auto_1006082 ?auto_1006083 ) ) ( not ( = ?auto_1006082 ?auto_1006084 ) ) ( not ( = ?auto_1006090 ?auto_1006088 ) ) ( HOIST-AT ?auto_1006085 ?auto_1006090 ) ( not ( = ?auto_1006089 ?auto_1006085 ) ) ( AVAILABLE ?auto_1006085 ) ( SURFACE-AT ?auto_1006084 ?auto_1006090 ) ( ON ?auto_1006084 ?auto_1006087 ) ( CLEAR ?auto_1006084 ) ( not ( = ?auto_1006083 ?auto_1006087 ) ) ( not ( = ?auto_1006084 ?auto_1006087 ) ) ( not ( = ?auto_1006082 ?auto_1006087 ) ) ( SURFACE-AT ?auto_1006082 ?auto_1006088 ) ( CLEAR ?auto_1006082 ) ( IS-CRATE ?auto_1006083 ) ( AVAILABLE ?auto_1006089 ) ( IN ?auto_1006083 ?auto_1006086 ) ( TRUCK-AT ?auto_1006086 ?auto_1006090 ) ( ON ?auto_1006082 ?auto_1006081 ) ( not ( = ?auto_1006081 ?auto_1006082 ) ) ( not ( = ?auto_1006081 ?auto_1006083 ) ) ( not ( = ?auto_1006081 ?auto_1006084 ) ) ( not ( = ?auto_1006081 ?auto_1006087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006082 ?auto_1006083 ?auto_1006084 )
      ( MAKE-3CRATE-VERIFY ?auto_1006081 ?auto_1006082 ?auto_1006083 ?auto_1006084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1006091 - SURFACE
      ?auto_1006092 - SURFACE
      ?auto_1006093 - SURFACE
      ?auto_1006094 - SURFACE
      ?auto_1006095 - SURFACE
    )
    :vars
    (
      ?auto_1006100 - HOIST
      ?auto_1006099 - PLACE
      ?auto_1006101 - PLACE
      ?auto_1006096 - HOIST
      ?auto_1006098 - SURFACE
      ?auto_1006097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006100 ?auto_1006099 ) ( IS-CRATE ?auto_1006095 ) ( not ( = ?auto_1006094 ?auto_1006095 ) ) ( not ( = ?auto_1006093 ?auto_1006094 ) ) ( not ( = ?auto_1006093 ?auto_1006095 ) ) ( not ( = ?auto_1006101 ?auto_1006099 ) ) ( HOIST-AT ?auto_1006096 ?auto_1006101 ) ( not ( = ?auto_1006100 ?auto_1006096 ) ) ( AVAILABLE ?auto_1006096 ) ( SURFACE-AT ?auto_1006095 ?auto_1006101 ) ( ON ?auto_1006095 ?auto_1006098 ) ( CLEAR ?auto_1006095 ) ( not ( = ?auto_1006094 ?auto_1006098 ) ) ( not ( = ?auto_1006095 ?auto_1006098 ) ) ( not ( = ?auto_1006093 ?auto_1006098 ) ) ( SURFACE-AT ?auto_1006093 ?auto_1006099 ) ( CLEAR ?auto_1006093 ) ( IS-CRATE ?auto_1006094 ) ( AVAILABLE ?auto_1006100 ) ( IN ?auto_1006094 ?auto_1006097 ) ( TRUCK-AT ?auto_1006097 ?auto_1006101 ) ( ON ?auto_1006092 ?auto_1006091 ) ( ON ?auto_1006093 ?auto_1006092 ) ( not ( = ?auto_1006091 ?auto_1006092 ) ) ( not ( = ?auto_1006091 ?auto_1006093 ) ) ( not ( = ?auto_1006091 ?auto_1006094 ) ) ( not ( = ?auto_1006091 ?auto_1006095 ) ) ( not ( = ?auto_1006091 ?auto_1006098 ) ) ( not ( = ?auto_1006092 ?auto_1006093 ) ) ( not ( = ?auto_1006092 ?auto_1006094 ) ) ( not ( = ?auto_1006092 ?auto_1006095 ) ) ( not ( = ?auto_1006092 ?auto_1006098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006093 ?auto_1006094 ?auto_1006095 )
      ( MAKE-4CRATE-VERIFY ?auto_1006091 ?auto_1006092 ?auto_1006093 ?auto_1006094 ?auto_1006095 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1006102 - SURFACE
      ?auto_1006103 - SURFACE
      ?auto_1006104 - SURFACE
      ?auto_1006105 - SURFACE
      ?auto_1006106 - SURFACE
      ?auto_1006107 - SURFACE
    )
    :vars
    (
      ?auto_1006112 - HOIST
      ?auto_1006111 - PLACE
      ?auto_1006113 - PLACE
      ?auto_1006108 - HOIST
      ?auto_1006110 - SURFACE
      ?auto_1006109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006112 ?auto_1006111 ) ( IS-CRATE ?auto_1006107 ) ( not ( = ?auto_1006106 ?auto_1006107 ) ) ( not ( = ?auto_1006105 ?auto_1006106 ) ) ( not ( = ?auto_1006105 ?auto_1006107 ) ) ( not ( = ?auto_1006113 ?auto_1006111 ) ) ( HOIST-AT ?auto_1006108 ?auto_1006113 ) ( not ( = ?auto_1006112 ?auto_1006108 ) ) ( AVAILABLE ?auto_1006108 ) ( SURFACE-AT ?auto_1006107 ?auto_1006113 ) ( ON ?auto_1006107 ?auto_1006110 ) ( CLEAR ?auto_1006107 ) ( not ( = ?auto_1006106 ?auto_1006110 ) ) ( not ( = ?auto_1006107 ?auto_1006110 ) ) ( not ( = ?auto_1006105 ?auto_1006110 ) ) ( SURFACE-AT ?auto_1006105 ?auto_1006111 ) ( CLEAR ?auto_1006105 ) ( IS-CRATE ?auto_1006106 ) ( AVAILABLE ?auto_1006112 ) ( IN ?auto_1006106 ?auto_1006109 ) ( TRUCK-AT ?auto_1006109 ?auto_1006113 ) ( ON ?auto_1006103 ?auto_1006102 ) ( ON ?auto_1006104 ?auto_1006103 ) ( ON ?auto_1006105 ?auto_1006104 ) ( not ( = ?auto_1006102 ?auto_1006103 ) ) ( not ( = ?auto_1006102 ?auto_1006104 ) ) ( not ( = ?auto_1006102 ?auto_1006105 ) ) ( not ( = ?auto_1006102 ?auto_1006106 ) ) ( not ( = ?auto_1006102 ?auto_1006107 ) ) ( not ( = ?auto_1006102 ?auto_1006110 ) ) ( not ( = ?auto_1006103 ?auto_1006104 ) ) ( not ( = ?auto_1006103 ?auto_1006105 ) ) ( not ( = ?auto_1006103 ?auto_1006106 ) ) ( not ( = ?auto_1006103 ?auto_1006107 ) ) ( not ( = ?auto_1006103 ?auto_1006110 ) ) ( not ( = ?auto_1006104 ?auto_1006105 ) ) ( not ( = ?auto_1006104 ?auto_1006106 ) ) ( not ( = ?auto_1006104 ?auto_1006107 ) ) ( not ( = ?auto_1006104 ?auto_1006110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006105 ?auto_1006106 ?auto_1006107 )
      ( MAKE-5CRATE-VERIFY ?auto_1006102 ?auto_1006103 ?auto_1006104 ?auto_1006105 ?auto_1006106 ?auto_1006107 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1006114 - SURFACE
      ?auto_1006115 - SURFACE
      ?auto_1006116 - SURFACE
      ?auto_1006117 - SURFACE
      ?auto_1006118 - SURFACE
      ?auto_1006119 - SURFACE
      ?auto_1006120 - SURFACE
    )
    :vars
    (
      ?auto_1006125 - HOIST
      ?auto_1006124 - PLACE
      ?auto_1006126 - PLACE
      ?auto_1006121 - HOIST
      ?auto_1006123 - SURFACE
      ?auto_1006122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006125 ?auto_1006124 ) ( IS-CRATE ?auto_1006120 ) ( not ( = ?auto_1006119 ?auto_1006120 ) ) ( not ( = ?auto_1006118 ?auto_1006119 ) ) ( not ( = ?auto_1006118 ?auto_1006120 ) ) ( not ( = ?auto_1006126 ?auto_1006124 ) ) ( HOIST-AT ?auto_1006121 ?auto_1006126 ) ( not ( = ?auto_1006125 ?auto_1006121 ) ) ( AVAILABLE ?auto_1006121 ) ( SURFACE-AT ?auto_1006120 ?auto_1006126 ) ( ON ?auto_1006120 ?auto_1006123 ) ( CLEAR ?auto_1006120 ) ( not ( = ?auto_1006119 ?auto_1006123 ) ) ( not ( = ?auto_1006120 ?auto_1006123 ) ) ( not ( = ?auto_1006118 ?auto_1006123 ) ) ( SURFACE-AT ?auto_1006118 ?auto_1006124 ) ( CLEAR ?auto_1006118 ) ( IS-CRATE ?auto_1006119 ) ( AVAILABLE ?auto_1006125 ) ( IN ?auto_1006119 ?auto_1006122 ) ( TRUCK-AT ?auto_1006122 ?auto_1006126 ) ( ON ?auto_1006115 ?auto_1006114 ) ( ON ?auto_1006116 ?auto_1006115 ) ( ON ?auto_1006117 ?auto_1006116 ) ( ON ?auto_1006118 ?auto_1006117 ) ( not ( = ?auto_1006114 ?auto_1006115 ) ) ( not ( = ?auto_1006114 ?auto_1006116 ) ) ( not ( = ?auto_1006114 ?auto_1006117 ) ) ( not ( = ?auto_1006114 ?auto_1006118 ) ) ( not ( = ?auto_1006114 ?auto_1006119 ) ) ( not ( = ?auto_1006114 ?auto_1006120 ) ) ( not ( = ?auto_1006114 ?auto_1006123 ) ) ( not ( = ?auto_1006115 ?auto_1006116 ) ) ( not ( = ?auto_1006115 ?auto_1006117 ) ) ( not ( = ?auto_1006115 ?auto_1006118 ) ) ( not ( = ?auto_1006115 ?auto_1006119 ) ) ( not ( = ?auto_1006115 ?auto_1006120 ) ) ( not ( = ?auto_1006115 ?auto_1006123 ) ) ( not ( = ?auto_1006116 ?auto_1006117 ) ) ( not ( = ?auto_1006116 ?auto_1006118 ) ) ( not ( = ?auto_1006116 ?auto_1006119 ) ) ( not ( = ?auto_1006116 ?auto_1006120 ) ) ( not ( = ?auto_1006116 ?auto_1006123 ) ) ( not ( = ?auto_1006117 ?auto_1006118 ) ) ( not ( = ?auto_1006117 ?auto_1006119 ) ) ( not ( = ?auto_1006117 ?auto_1006120 ) ) ( not ( = ?auto_1006117 ?auto_1006123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006118 ?auto_1006119 ?auto_1006120 )
      ( MAKE-6CRATE-VERIFY ?auto_1006114 ?auto_1006115 ?auto_1006116 ?auto_1006117 ?auto_1006118 ?auto_1006119 ?auto_1006120 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1006127 - SURFACE
      ?auto_1006128 - SURFACE
      ?auto_1006129 - SURFACE
      ?auto_1006130 - SURFACE
      ?auto_1006131 - SURFACE
      ?auto_1006132 - SURFACE
      ?auto_1006133 - SURFACE
      ?auto_1006134 - SURFACE
    )
    :vars
    (
      ?auto_1006139 - HOIST
      ?auto_1006138 - PLACE
      ?auto_1006140 - PLACE
      ?auto_1006135 - HOIST
      ?auto_1006137 - SURFACE
      ?auto_1006136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006139 ?auto_1006138 ) ( IS-CRATE ?auto_1006134 ) ( not ( = ?auto_1006133 ?auto_1006134 ) ) ( not ( = ?auto_1006132 ?auto_1006133 ) ) ( not ( = ?auto_1006132 ?auto_1006134 ) ) ( not ( = ?auto_1006140 ?auto_1006138 ) ) ( HOIST-AT ?auto_1006135 ?auto_1006140 ) ( not ( = ?auto_1006139 ?auto_1006135 ) ) ( AVAILABLE ?auto_1006135 ) ( SURFACE-AT ?auto_1006134 ?auto_1006140 ) ( ON ?auto_1006134 ?auto_1006137 ) ( CLEAR ?auto_1006134 ) ( not ( = ?auto_1006133 ?auto_1006137 ) ) ( not ( = ?auto_1006134 ?auto_1006137 ) ) ( not ( = ?auto_1006132 ?auto_1006137 ) ) ( SURFACE-AT ?auto_1006132 ?auto_1006138 ) ( CLEAR ?auto_1006132 ) ( IS-CRATE ?auto_1006133 ) ( AVAILABLE ?auto_1006139 ) ( IN ?auto_1006133 ?auto_1006136 ) ( TRUCK-AT ?auto_1006136 ?auto_1006140 ) ( ON ?auto_1006128 ?auto_1006127 ) ( ON ?auto_1006129 ?auto_1006128 ) ( ON ?auto_1006130 ?auto_1006129 ) ( ON ?auto_1006131 ?auto_1006130 ) ( ON ?auto_1006132 ?auto_1006131 ) ( not ( = ?auto_1006127 ?auto_1006128 ) ) ( not ( = ?auto_1006127 ?auto_1006129 ) ) ( not ( = ?auto_1006127 ?auto_1006130 ) ) ( not ( = ?auto_1006127 ?auto_1006131 ) ) ( not ( = ?auto_1006127 ?auto_1006132 ) ) ( not ( = ?auto_1006127 ?auto_1006133 ) ) ( not ( = ?auto_1006127 ?auto_1006134 ) ) ( not ( = ?auto_1006127 ?auto_1006137 ) ) ( not ( = ?auto_1006128 ?auto_1006129 ) ) ( not ( = ?auto_1006128 ?auto_1006130 ) ) ( not ( = ?auto_1006128 ?auto_1006131 ) ) ( not ( = ?auto_1006128 ?auto_1006132 ) ) ( not ( = ?auto_1006128 ?auto_1006133 ) ) ( not ( = ?auto_1006128 ?auto_1006134 ) ) ( not ( = ?auto_1006128 ?auto_1006137 ) ) ( not ( = ?auto_1006129 ?auto_1006130 ) ) ( not ( = ?auto_1006129 ?auto_1006131 ) ) ( not ( = ?auto_1006129 ?auto_1006132 ) ) ( not ( = ?auto_1006129 ?auto_1006133 ) ) ( not ( = ?auto_1006129 ?auto_1006134 ) ) ( not ( = ?auto_1006129 ?auto_1006137 ) ) ( not ( = ?auto_1006130 ?auto_1006131 ) ) ( not ( = ?auto_1006130 ?auto_1006132 ) ) ( not ( = ?auto_1006130 ?auto_1006133 ) ) ( not ( = ?auto_1006130 ?auto_1006134 ) ) ( not ( = ?auto_1006130 ?auto_1006137 ) ) ( not ( = ?auto_1006131 ?auto_1006132 ) ) ( not ( = ?auto_1006131 ?auto_1006133 ) ) ( not ( = ?auto_1006131 ?auto_1006134 ) ) ( not ( = ?auto_1006131 ?auto_1006137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006132 ?auto_1006133 ?auto_1006134 )
      ( MAKE-7CRATE-VERIFY ?auto_1006127 ?auto_1006128 ?auto_1006129 ?auto_1006130 ?auto_1006131 ?auto_1006132 ?auto_1006133 ?auto_1006134 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1006141 - SURFACE
      ?auto_1006142 - SURFACE
      ?auto_1006143 - SURFACE
      ?auto_1006144 - SURFACE
      ?auto_1006145 - SURFACE
      ?auto_1006146 - SURFACE
      ?auto_1006147 - SURFACE
      ?auto_1006148 - SURFACE
      ?auto_1006149 - SURFACE
    )
    :vars
    (
      ?auto_1006154 - HOIST
      ?auto_1006153 - PLACE
      ?auto_1006155 - PLACE
      ?auto_1006150 - HOIST
      ?auto_1006152 - SURFACE
      ?auto_1006151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006154 ?auto_1006153 ) ( IS-CRATE ?auto_1006149 ) ( not ( = ?auto_1006148 ?auto_1006149 ) ) ( not ( = ?auto_1006147 ?auto_1006148 ) ) ( not ( = ?auto_1006147 ?auto_1006149 ) ) ( not ( = ?auto_1006155 ?auto_1006153 ) ) ( HOIST-AT ?auto_1006150 ?auto_1006155 ) ( not ( = ?auto_1006154 ?auto_1006150 ) ) ( AVAILABLE ?auto_1006150 ) ( SURFACE-AT ?auto_1006149 ?auto_1006155 ) ( ON ?auto_1006149 ?auto_1006152 ) ( CLEAR ?auto_1006149 ) ( not ( = ?auto_1006148 ?auto_1006152 ) ) ( not ( = ?auto_1006149 ?auto_1006152 ) ) ( not ( = ?auto_1006147 ?auto_1006152 ) ) ( SURFACE-AT ?auto_1006147 ?auto_1006153 ) ( CLEAR ?auto_1006147 ) ( IS-CRATE ?auto_1006148 ) ( AVAILABLE ?auto_1006154 ) ( IN ?auto_1006148 ?auto_1006151 ) ( TRUCK-AT ?auto_1006151 ?auto_1006155 ) ( ON ?auto_1006142 ?auto_1006141 ) ( ON ?auto_1006143 ?auto_1006142 ) ( ON ?auto_1006144 ?auto_1006143 ) ( ON ?auto_1006145 ?auto_1006144 ) ( ON ?auto_1006146 ?auto_1006145 ) ( ON ?auto_1006147 ?auto_1006146 ) ( not ( = ?auto_1006141 ?auto_1006142 ) ) ( not ( = ?auto_1006141 ?auto_1006143 ) ) ( not ( = ?auto_1006141 ?auto_1006144 ) ) ( not ( = ?auto_1006141 ?auto_1006145 ) ) ( not ( = ?auto_1006141 ?auto_1006146 ) ) ( not ( = ?auto_1006141 ?auto_1006147 ) ) ( not ( = ?auto_1006141 ?auto_1006148 ) ) ( not ( = ?auto_1006141 ?auto_1006149 ) ) ( not ( = ?auto_1006141 ?auto_1006152 ) ) ( not ( = ?auto_1006142 ?auto_1006143 ) ) ( not ( = ?auto_1006142 ?auto_1006144 ) ) ( not ( = ?auto_1006142 ?auto_1006145 ) ) ( not ( = ?auto_1006142 ?auto_1006146 ) ) ( not ( = ?auto_1006142 ?auto_1006147 ) ) ( not ( = ?auto_1006142 ?auto_1006148 ) ) ( not ( = ?auto_1006142 ?auto_1006149 ) ) ( not ( = ?auto_1006142 ?auto_1006152 ) ) ( not ( = ?auto_1006143 ?auto_1006144 ) ) ( not ( = ?auto_1006143 ?auto_1006145 ) ) ( not ( = ?auto_1006143 ?auto_1006146 ) ) ( not ( = ?auto_1006143 ?auto_1006147 ) ) ( not ( = ?auto_1006143 ?auto_1006148 ) ) ( not ( = ?auto_1006143 ?auto_1006149 ) ) ( not ( = ?auto_1006143 ?auto_1006152 ) ) ( not ( = ?auto_1006144 ?auto_1006145 ) ) ( not ( = ?auto_1006144 ?auto_1006146 ) ) ( not ( = ?auto_1006144 ?auto_1006147 ) ) ( not ( = ?auto_1006144 ?auto_1006148 ) ) ( not ( = ?auto_1006144 ?auto_1006149 ) ) ( not ( = ?auto_1006144 ?auto_1006152 ) ) ( not ( = ?auto_1006145 ?auto_1006146 ) ) ( not ( = ?auto_1006145 ?auto_1006147 ) ) ( not ( = ?auto_1006145 ?auto_1006148 ) ) ( not ( = ?auto_1006145 ?auto_1006149 ) ) ( not ( = ?auto_1006145 ?auto_1006152 ) ) ( not ( = ?auto_1006146 ?auto_1006147 ) ) ( not ( = ?auto_1006146 ?auto_1006148 ) ) ( not ( = ?auto_1006146 ?auto_1006149 ) ) ( not ( = ?auto_1006146 ?auto_1006152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006147 ?auto_1006148 ?auto_1006149 )
      ( MAKE-8CRATE-VERIFY ?auto_1006141 ?auto_1006142 ?auto_1006143 ?auto_1006144 ?auto_1006145 ?auto_1006146 ?auto_1006147 ?auto_1006148 ?auto_1006149 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1006156 - SURFACE
      ?auto_1006157 - SURFACE
      ?auto_1006158 - SURFACE
      ?auto_1006159 - SURFACE
      ?auto_1006160 - SURFACE
      ?auto_1006161 - SURFACE
      ?auto_1006162 - SURFACE
      ?auto_1006163 - SURFACE
      ?auto_1006164 - SURFACE
      ?auto_1006165 - SURFACE
    )
    :vars
    (
      ?auto_1006170 - HOIST
      ?auto_1006169 - PLACE
      ?auto_1006171 - PLACE
      ?auto_1006166 - HOIST
      ?auto_1006168 - SURFACE
      ?auto_1006167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006170 ?auto_1006169 ) ( IS-CRATE ?auto_1006165 ) ( not ( = ?auto_1006164 ?auto_1006165 ) ) ( not ( = ?auto_1006163 ?auto_1006164 ) ) ( not ( = ?auto_1006163 ?auto_1006165 ) ) ( not ( = ?auto_1006171 ?auto_1006169 ) ) ( HOIST-AT ?auto_1006166 ?auto_1006171 ) ( not ( = ?auto_1006170 ?auto_1006166 ) ) ( AVAILABLE ?auto_1006166 ) ( SURFACE-AT ?auto_1006165 ?auto_1006171 ) ( ON ?auto_1006165 ?auto_1006168 ) ( CLEAR ?auto_1006165 ) ( not ( = ?auto_1006164 ?auto_1006168 ) ) ( not ( = ?auto_1006165 ?auto_1006168 ) ) ( not ( = ?auto_1006163 ?auto_1006168 ) ) ( SURFACE-AT ?auto_1006163 ?auto_1006169 ) ( CLEAR ?auto_1006163 ) ( IS-CRATE ?auto_1006164 ) ( AVAILABLE ?auto_1006170 ) ( IN ?auto_1006164 ?auto_1006167 ) ( TRUCK-AT ?auto_1006167 ?auto_1006171 ) ( ON ?auto_1006157 ?auto_1006156 ) ( ON ?auto_1006158 ?auto_1006157 ) ( ON ?auto_1006159 ?auto_1006158 ) ( ON ?auto_1006160 ?auto_1006159 ) ( ON ?auto_1006161 ?auto_1006160 ) ( ON ?auto_1006162 ?auto_1006161 ) ( ON ?auto_1006163 ?auto_1006162 ) ( not ( = ?auto_1006156 ?auto_1006157 ) ) ( not ( = ?auto_1006156 ?auto_1006158 ) ) ( not ( = ?auto_1006156 ?auto_1006159 ) ) ( not ( = ?auto_1006156 ?auto_1006160 ) ) ( not ( = ?auto_1006156 ?auto_1006161 ) ) ( not ( = ?auto_1006156 ?auto_1006162 ) ) ( not ( = ?auto_1006156 ?auto_1006163 ) ) ( not ( = ?auto_1006156 ?auto_1006164 ) ) ( not ( = ?auto_1006156 ?auto_1006165 ) ) ( not ( = ?auto_1006156 ?auto_1006168 ) ) ( not ( = ?auto_1006157 ?auto_1006158 ) ) ( not ( = ?auto_1006157 ?auto_1006159 ) ) ( not ( = ?auto_1006157 ?auto_1006160 ) ) ( not ( = ?auto_1006157 ?auto_1006161 ) ) ( not ( = ?auto_1006157 ?auto_1006162 ) ) ( not ( = ?auto_1006157 ?auto_1006163 ) ) ( not ( = ?auto_1006157 ?auto_1006164 ) ) ( not ( = ?auto_1006157 ?auto_1006165 ) ) ( not ( = ?auto_1006157 ?auto_1006168 ) ) ( not ( = ?auto_1006158 ?auto_1006159 ) ) ( not ( = ?auto_1006158 ?auto_1006160 ) ) ( not ( = ?auto_1006158 ?auto_1006161 ) ) ( not ( = ?auto_1006158 ?auto_1006162 ) ) ( not ( = ?auto_1006158 ?auto_1006163 ) ) ( not ( = ?auto_1006158 ?auto_1006164 ) ) ( not ( = ?auto_1006158 ?auto_1006165 ) ) ( not ( = ?auto_1006158 ?auto_1006168 ) ) ( not ( = ?auto_1006159 ?auto_1006160 ) ) ( not ( = ?auto_1006159 ?auto_1006161 ) ) ( not ( = ?auto_1006159 ?auto_1006162 ) ) ( not ( = ?auto_1006159 ?auto_1006163 ) ) ( not ( = ?auto_1006159 ?auto_1006164 ) ) ( not ( = ?auto_1006159 ?auto_1006165 ) ) ( not ( = ?auto_1006159 ?auto_1006168 ) ) ( not ( = ?auto_1006160 ?auto_1006161 ) ) ( not ( = ?auto_1006160 ?auto_1006162 ) ) ( not ( = ?auto_1006160 ?auto_1006163 ) ) ( not ( = ?auto_1006160 ?auto_1006164 ) ) ( not ( = ?auto_1006160 ?auto_1006165 ) ) ( not ( = ?auto_1006160 ?auto_1006168 ) ) ( not ( = ?auto_1006161 ?auto_1006162 ) ) ( not ( = ?auto_1006161 ?auto_1006163 ) ) ( not ( = ?auto_1006161 ?auto_1006164 ) ) ( not ( = ?auto_1006161 ?auto_1006165 ) ) ( not ( = ?auto_1006161 ?auto_1006168 ) ) ( not ( = ?auto_1006162 ?auto_1006163 ) ) ( not ( = ?auto_1006162 ?auto_1006164 ) ) ( not ( = ?auto_1006162 ?auto_1006165 ) ) ( not ( = ?auto_1006162 ?auto_1006168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006163 ?auto_1006164 ?auto_1006165 )
      ( MAKE-9CRATE-VERIFY ?auto_1006156 ?auto_1006157 ?auto_1006158 ?auto_1006159 ?auto_1006160 ?auto_1006161 ?auto_1006162 ?auto_1006163 ?auto_1006164 ?auto_1006165 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1006172 - SURFACE
      ?auto_1006173 - SURFACE
      ?auto_1006174 - SURFACE
      ?auto_1006175 - SURFACE
      ?auto_1006176 - SURFACE
      ?auto_1006177 - SURFACE
      ?auto_1006178 - SURFACE
      ?auto_1006179 - SURFACE
      ?auto_1006180 - SURFACE
      ?auto_1006181 - SURFACE
      ?auto_1006182 - SURFACE
    )
    :vars
    (
      ?auto_1006187 - HOIST
      ?auto_1006186 - PLACE
      ?auto_1006188 - PLACE
      ?auto_1006183 - HOIST
      ?auto_1006185 - SURFACE
      ?auto_1006184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006187 ?auto_1006186 ) ( IS-CRATE ?auto_1006182 ) ( not ( = ?auto_1006181 ?auto_1006182 ) ) ( not ( = ?auto_1006180 ?auto_1006181 ) ) ( not ( = ?auto_1006180 ?auto_1006182 ) ) ( not ( = ?auto_1006188 ?auto_1006186 ) ) ( HOIST-AT ?auto_1006183 ?auto_1006188 ) ( not ( = ?auto_1006187 ?auto_1006183 ) ) ( AVAILABLE ?auto_1006183 ) ( SURFACE-AT ?auto_1006182 ?auto_1006188 ) ( ON ?auto_1006182 ?auto_1006185 ) ( CLEAR ?auto_1006182 ) ( not ( = ?auto_1006181 ?auto_1006185 ) ) ( not ( = ?auto_1006182 ?auto_1006185 ) ) ( not ( = ?auto_1006180 ?auto_1006185 ) ) ( SURFACE-AT ?auto_1006180 ?auto_1006186 ) ( CLEAR ?auto_1006180 ) ( IS-CRATE ?auto_1006181 ) ( AVAILABLE ?auto_1006187 ) ( IN ?auto_1006181 ?auto_1006184 ) ( TRUCK-AT ?auto_1006184 ?auto_1006188 ) ( ON ?auto_1006173 ?auto_1006172 ) ( ON ?auto_1006174 ?auto_1006173 ) ( ON ?auto_1006175 ?auto_1006174 ) ( ON ?auto_1006176 ?auto_1006175 ) ( ON ?auto_1006177 ?auto_1006176 ) ( ON ?auto_1006178 ?auto_1006177 ) ( ON ?auto_1006179 ?auto_1006178 ) ( ON ?auto_1006180 ?auto_1006179 ) ( not ( = ?auto_1006172 ?auto_1006173 ) ) ( not ( = ?auto_1006172 ?auto_1006174 ) ) ( not ( = ?auto_1006172 ?auto_1006175 ) ) ( not ( = ?auto_1006172 ?auto_1006176 ) ) ( not ( = ?auto_1006172 ?auto_1006177 ) ) ( not ( = ?auto_1006172 ?auto_1006178 ) ) ( not ( = ?auto_1006172 ?auto_1006179 ) ) ( not ( = ?auto_1006172 ?auto_1006180 ) ) ( not ( = ?auto_1006172 ?auto_1006181 ) ) ( not ( = ?auto_1006172 ?auto_1006182 ) ) ( not ( = ?auto_1006172 ?auto_1006185 ) ) ( not ( = ?auto_1006173 ?auto_1006174 ) ) ( not ( = ?auto_1006173 ?auto_1006175 ) ) ( not ( = ?auto_1006173 ?auto_1006176 ) ) ( not ( = ?auto_1006173 ?auto_1006177 ) ) ( not ( = ?auto_1006173 ?auto_1006178 ) ) ( not ( = ?auto_1006173 ?auto_1006179 ) ) ( not ( = ?auto_1006173 ?auto_1006180 ) ) ( not ( = ?auto_1006173 ?auto_1006181 ) ) ( not ( = ?auto_1006173 ?auto_1006182 ) ) ( not ( = ?auto_1006173 ?auto_1006185 ) ) ( not ( = ?auto_1006174 ?auto_1006175 ) ) ( not ( = ?auto_1006174 ?auto_1006176 ) ) ( not ( = ?auto_1006174 ?auto_1006177 ) ) ( not ( = ?auto_1006174 ?auto_1006178 ) ) ( not ( = ?auto_1006174 ?auto_1006179 ) ) ( not ( = ?auto_1006174 ?auto_1006180 ) ) ( not ( = ?auto_1006174 ?auto_1006181 ) ) ( not ( = ?auto_1006174 ?auto_1006182 ) ) ( not ( = ?auto_1006174 ?auto_1006185 ) ) ( not ( = ?auto_1006175 ?auto_1006176 ) ) ( not ( = ?auto_1006175 ?auto_1006177 ) ) ( not ( = ?auto_1006175 ?auto_1006178 ) ) ( not ( = ?auto_1006175 ?auto_1006179 ) ) ( not ( = ?auto_1006175 ?auto_1006180 ) ) ( not ( = ?auto_1006175 ?auto_1006181 ) ) ( not ( = ?auto_1006175 ?auto_1006182 ) ) ( not ( = ?auto_1006175 ?auto_1006185 ) ) ( not ( = ?auto_1006176 ?auto_1006177 ) ) ( not ( = ?auto_1006176 ?auto_1006178 ) ) ( not ( = ?auto_1006176 ?auto_1006179 ) ) ( not ( = ?auto_1006176 ?auto_1006180 ) ) ( not ( = ?auto_1006176 ?auto_1006181 ) ) ( not ( = ?auto_1006176 ?auto_1006182 ) ) ( not ( = ?auto_1006176 ?auto_1006185 ) ) ( not ( = ?auto_1006177 ?auto_1006178 ) ) ( not ( = ?auto_1006177 ?auto_1006179 ) ) ( not ( = ?auto_1006177 ?auto_1006180 ) ) ( not ( = ?auto_1006177 ?auto_1006181 ) ) ( not ( = ?auto_1006177 ?auto_1006182 ) ) ( not ( = ?auto_1006177 ?auto_1006185 ) ) ( not ( = ?auto_1006178 ?auto_1006179 ) ) ( not ( = ?auto_1006178 ?auto_1006180 ) ) ( not ( = ?auto_1006178 ?auto_1006181 ) ) ( not ( = ?auto_1006178 ?auto_1006182 ) ) ( not ( = ?auto_1006178 ?auto_1006185 ) ) ( not ( = ?auto_1006179 ?auto_1006180 ) ) ( not ( = ?auto_1006179 ?auto_1006181 ) ) ( not ( = ?auto_1006179 ?auto_1006182 ) ) ( not ( = ?auto_1006179 ?auto_1006185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006180 ?auto_1006181 ?auto_1006182 )
      ( MAKE-10CRATE-VERIFY ?auto_1006172 ?auto_1006173 ?auto_1006174 ?auto_1006175 ?auto_1006176 ?auto_1006177 ?auto_1006178 ?auto_1006179 ?auto_1006180 ?auto_1006181 ?auto_1006182 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006189 - SURFACE
      ?auto_1006190 - SURFACE
      ?auto_1006191 - SURFACE
      ?auto_1006192 - SURFACE
      ?auto_1006193 - SURFACE
      ?auto_1006194 - SURFACE
      ?auto_1006195 - SURFACE
      ?auto_1006196 - SURFACE
      ?auto_1006197 - SURFACE
      ?auto_1006198 - SURFACE
      ?auto_1006199 - SURFACE
      ?auto_1006200 - SURFACE
    )
    :vars
    (
      ?auto_1006205 - HOIST
      ?auto_1006204 - PLACE
      ?auto_1006206 - PLACE
      ?auto_1006201 - HOIST
      ?auto_1006203 - SURFACE
      ?auto_1006202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006205 ?auto_1006204 ) ( IS-CRATE ?auto_1006200 ) ( not ( = ?auto_1006199 ?auto_1006200 ) ) ( not ( = ?auto_1006198 ?auto_1006199 ) ) ( not ( = ?auto_1006198 ?auto_1006200 ) ) ( not ( = ?auto_1006206 ?auto_1006204 ) ) ( HOIST-AT ?auto_1006201 ?auto_1006206 ) ( not ( = ?auto_1006205 ?auto_1006201 ) ) ( AVAILABLE ?auto_1006201 ) ( SURFACE-AT ?auto_1006200 ?auto_1006206 ) ( ON ?auto_1006200 ?auto_1006203 ) ( CLEAR ?auto_1006200 ) ( not ( = ?auto_1006199 ?auto_1006203 ) ) ( not ( = ?auto_1006200 ?auto_1006203 ) ) ( not ( = ?auto_1006198 ?auto_1006203 ) ) ( SURFACE-AT ?auto_1006198 ?auto_1006204 ) ( CLEAR ?auto_1006198 ) ( IS-CRATE ?auto_1006199 ) ( AVAILABLE ?auto_1006205 ) ( IN ?auto_1006199 ?auto_1006202 ) ( TRUCK-AT ?auto_1006202 ?auto_1006206 ) ( ON ?auto_1006190 ?auto_1006189 ) ( ON ?auto_1006191 ?auto_1006190 ) ( ON ?auto_1006192 ?auto_1006191 ) ( ON ?auto_1006193 ?auto_1006192 ) ( ON ?auto_1006194 ?auto_1006193 ) ( ON ?auto_1006195 ?auto_1006194 ) ( ON ?auto_1006196 ?auto_1006195 ) ( ON ?auto_1006197 ?auto_1006196 ) ( ON ?auto_1006198 ?auto_1006197 ) ( not ( = ?auto_1006189 ?auto_1006190 ) ) ( not ( = ?auto_1006189 ?auto_1006191 ) ) ( not ( = ?auto_1006189 ?auto_1006192 ) ) ( not ( = ?auto_1006189 ?auto_1006193 ) ) ( not ( = ?auto_1006189 ?auto_1006194 ) ) ( not ( = ?auto_1006189 ?auto_1006195 ) ) ( not ( = ?auto_1006189 ?auto_1006196 ) ) ( not ( = ?auto_1006189 ?auto_1006197 ) ) ( not ( = ?auto_1006189 ?auto_1006198 ) ) ( not ( = ?auto_1006189 ?auto_1006199 ) ) ( not ( = ?auto_1006189 ?auto_1006200 ) ) ( not ( = ?auto_1006189 ?auto_1006203 ) ) ( not ( = ?auto_1006190 ?auto_1006191 ) ) ( not ( = ?auto_1006190 ?auto_1006192 ) ) ( not ( = ?auto_1006190 ?auto_1006193 ) ) ( not ( = ?auto_1006190 ?auto_1006194 ) ) ( not ( = ?auto_1006190 ?auto_1006195 ) ) ( not ( = ?auto_1006190 ?auto_1006196 ) ) ( not ( = ?auto_1006190 ?auto_1006197 ) ) ( not ( = ?auto_1006190 ?auto_1006198 ) ) ( not ( = ?auto_1006190 ?auto_1006199 ) ) ( not ( = ?auto_1006190 ?auto_1006200 ) ) ( not ( = ?auto_1006190 ?auto_1006203 ) ) ( not ( = ?auto_1006191 ?auto_1006192 ) ) ( not ( = ?auto_1006191 ?auto_1006193 ) ) ( not ( = ?auto_1006191 ?auto_1006194 ) ) ( not ( = ?auto_1006191 ?auto_1006195 ) ) ( not ( = ?auto_1006191 ?auto_1006196 ) ) ( not ( = ?auto_1006191 ?auto_1006197 ) ) ( not ( = ?auto_1006191 ?auto_1006198 ) ) ( not ( = ?auto_1006191 ?auto_1006199 ) ) ( not ( = ?auto_1006191 ?auto_1006200 ) ) ( not ( = ?auto_1006191 ?auto_1006203 ) ) ( not ( = ?auto_1006192 ?auto_1006193 ) ) ( not ( = ?auto_1006192 ?auto_1006194 ) ) ( not ( = ?auto_1006192 ?auto_1006195 ) ) ( not ( = ?auto_1006192 ?auto_1006196 ) ) ( not ( = ?auto_1006192 ?auto_1006197 ) ) ( not ( = ?auto_1006192 ?auto_1006198 ) ) ( not ( = ?auto_1006192 ?auto_1006199 ) ) ( not ( = ?auto_1006192 ?auto_1006200 ) ) ( not ( = ?auto_1006192 ?auto_1006203 ) ) ( not ( = ?auto_1006193 ?auto_1006194 ) ) ( not ( = ?auto_1006193 ?auto_1006195 ) ) ( not ( = ?auto_1006193 ?auto_1006196 ) ) ( not ( = ?auto_1006193 ?auto_1006197 ) ) ( not ( = ?auto_1006193 ?auto_1006198 ) ) ( not ( = ?auto_1006193 ?auto_1006199 ) ) ( not ( = ?auto_1006193 ?auto_1006200 ) ) ( not ( = ?auto_1006193 ?auto_1006203 ) ) ( not ( = ?auto_1006194 ?auto_1006195 ) ) ( not ( = ?auto_1006194 ?auto_1006196 ) ) ( not ( = ?auto_1006194 ?auto_1006197 ) ) ( not ( = ?auto_1006194 ?auto_1006198 ) ) ( not ( = ?auto_1006194 ?auto_1006199 ) ) ( not ( = ?auto_1006194 ?auto_1006200 ) ) ( not ( = ?auto_1006194 ?auto_1006203 ) ) ( not ( = ?auto_1006195 ?auto_1006196 ) ) ( not ( = ?auto_1006195 ?auto_1006197 ) ) ( not ( = ?auto_1006195 ?auto_1006198 ) ) ( not ( = ?auto_1006195 ?auto_1006199 ) ) ( not ( = ?auto_1006195 ?auto_1006200 ) ) ( not ( = ?auto_1006195 ?auto_1006203 ) ) ( not ( = ?auto_1006196 ?auto_1006197 ) ) ( not ( = ?auto_1006196 ?auto_1006198 ) ) ( not ( = ?auto_1006196 ?auto_1006199 ) ) ( not ( = ?auto_1006196 ?auto_1006200 ) ) ( not ( = ?auto_1006196 ?auto_1006203 ) ) ( not ( = ?auto_1006197 ?auto_1006198 ) ) ( not ( = ?auto_1006197 ?auto_1006199 ) ) ( not ( = ?auto_1006197 ?auto_1006200 ) ) ( not ( = ?auto_1006197 ?auto_1006203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006198 ?auto_1006199 ?auto_1006200 )
      ( MAKE-11CRATE-VERIFY ?auto_1006189 ?auto_1006190 ?auto_1006191 ?auto_1006192 ?auto_1006193 ?auto_1006194 ?auto_1006195 ?auto_1006196 ?auto_1006197 ?auto_1006198 ?auto_1006199 ?auto_1006200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1006207 - SURFACE
      ?auto_1006208 - SURFACE
    )
    :vars
    (
      ?auto_1006213 - HOIST
      ?auto_1006212 - PLACE
      ?auto_1006214 - SURFACE
      ?auto_1006215 - PLACE
      ?auto_1006209 - HOIST
      ?auto_1006211 - SURFACE
      ?auto_1006210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006213 ?auto_1006212 ) ( IS-CRATE ?auto_1006208 ) ( not ( = ?auto_1006207 ?auto_1006208 ) ) ( not ( = ?auto_1006214 ?auto_1006207 ) ) ( not ( = ?auto_1006214 ?auto_1006208 ) ) ( not ( = ?auto_1006215 ?auto_1006212 ) ) ( HOIST-AT ?auto_1006209 ?auto_1006215 ) ( not ( = ?auto_1006213 ?auto_1006209 ) ) ( SURFACE-AT ?auto_1006208 ?auto_1006215 ) ( ON ?auto_1006208 ?auto_1006211 ) ( CLEAR ?auto_1006208 ) ( not ( = ?auto_1006207 ?auto_1006211 ) ) ( not ( = ?auto_1006208 ?auto_1006211 ) ) ( not ( = ?auto_1006214 ?auto_1006211 ) ) ( SURFACE-AT ?auto_1006214 ?auto_1006212 ) ( CLEAR ?auto_1006214 ) ( IS-CRATE ?auto_1006207 ) ( AVAILABLE ?auto_1006213 ) ( TRUCK-AT ?auto_1006210 ?auto_1006215 ) ( LIFTING ?auto_1006209 ?auto_1006207 ) )
    :subtasks
    ( ( !LOAD ?auto_1006209 ?auto_1006207 ?auto_1006210 ?auto_1006215 )
      ( MAKE-2CRATE ?auto_1006214 ?auto_1006207 ?auto_1006208 )
      ( MAKE-1CRATE-VERIFY ?auto_1006207 ?auto_1006208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1006216 - SURFACE
      ?auto_1006217 - SURFACE
      ?auto_1006218 - SURFACE
    )
    :vars
    (
      ?auto_1006222 - HOIST
      ?auto_1006224 - PLACE
      ?auto_1006219 - PLACE
      ?auto_1006223 - HOIST
      ?auto_1006221 - SURFACE
      ?auto_1006220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006222 ?auto_1006224 ) ( IS-CRATE ?auto_1006218 ) ( not ( = ?auto_1006217 ?auto_1006218 ) ) ( not ( = ?auto_1006216 ?auto_1006217 ) ) ( not ( = ?auto_1006216 ?auto_1006218 ) ) ( not ( = ?auto_1006219 ?auto_1006224 ) ) ( HOIST-AT ?auto_1006223 ?auto_1006219 ) ( not ( = ?auto_1006222 ?auto_1006223 ) ) ( SURFACE-AT ?auto_1006218 ?auto_1006219 ) ( ON ?auto_1006218 ?auto_1006221 ) ( CLEAR ?auto_1006218 ) ( not ( = ?auto_1006217 ?auto_1006221 ) ) ( not ( = ?auto_1006218 ?auto_1006221 ) ) ( not ( = ?auto_1006216 ?auto_1006221 ) ) ( SURFACE-AT ?auto_1006216 ?auto_1006224 ) ( CLEAR ?auto_1006216 ) ( IS-CRATE ?auto_1006217 ) ( AVAILABLE ?auto_1006222 ) ( TRUCK-AT ?auto_1006220 ?auto_1006219 ) ( LIFTING ?auto_1006223 ?auto_1006217 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1006217 ?auto_1006218 )
      ( MAKE-2CRATE-VERIFY ?auto_1006216 ?auto_1006217 ?auto_1006218 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1006225 - SURFACE
      ?auto_1006226 - SURFACE
      ?auto_1006227 - SURFACE
      ?auto_1006228 - SURFACE
    )
    :vars
    (
      ?auto_1006234 - HOIST
      ?auto_1006232 - PLACE
      ?auto_1006229 - PLACE
      ?auto_1006230 - HOIST
      ?auto_1006231 - SURFACE
      ?auto_1006233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006234 ?auto_1006232 ) ( IS-CRATE ?auto_1006228 ) ( not ( = ?auto_1006227 ?auto_1006228 ) ) ( not ( = ?auto_1006226 ?auto_1006227 ) ) ( not ( = ?auto_1006226 ?auto_1006228 ) ) ( not ( = ?auto_1006229 ?auto_1006232 ) ) ( HOIST-AT ?auto_1006230 ?auto_1006229 ) ( not ( = ?auto_1006234 ?auto_1006230 ) ) ( SURFACE-AT ?auto_1006228 ?auto_1006229 ) ( ON ?auto_1006228 ?auto_1006231 ) ( CLEAR ?auto_1006228 ) ( not ( = ?auto_1006227 ?auto_1006231 ) ) ( not ( = ?auto_1006228 ?auto_1006231 ) ) ( not ( = ?auto_1006226 ?auto_1006231 ) ) ( SURFACE-AT ?auto_1006226 ?auto_1006232 ) ( CLEAR ?auto_1006226 ) ( IS-CRATE ?auto_1006227 ) ( AVAILABLE ?auto_1006234 ) ( TRUCK-AT ?auto_1006233 ?auto_1006229 ) ( LIFTING ?auto_1006230 ?auto_1006227 ) ( ON ?auto_1006226 ?auto_1006225 ) ( not ( = ?auto_1006225 ?auto_1006226 ) ) ( not ( = ?auto_1006225 ?auto_1006227 ) ) ( not ( = ?auto_1006225 ?auto_1006228 ) ) ( not ( = ?auto_1006225 ?auto_1006231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006226 ?auto_1006227 ?auto_1006228 )
      ( MAKE-3CRATE-VERIFY ?auto_1006225 ?auto_1006226 ?auto_1006227 ?auto_1006228 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1006235 - SURFACE
      ?auto_1006236 - SURFACE
      ?auto_1006237 - SURFACE
      ?auto_1006238 - SURFACE
      ?auto_1006239 - SURFACE
    )
    :vars
    (
      ?auto_1006245 - HOIST
      ?auto_1006243 - PLACE
      ?auto_1006240 - PLACE
      ?auto_1006241 - HOIST
      ?auto_1006242 - SURFACE
      ?auto_1006244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006245 ?auto_1006243 ) ( IS-CRATE ?auto_1006239 ) ( not ( = ?auto_1006238 ?auto_1006239 ) ) ( not ( = ?auto_1006237 ?auto_1006238 ) ) ( not ( = ?auto_1006237 ?auto_1006239 ) ) ( not ( = ?auto_1006240 ?auto_1006243 ) ) ( HOIST-AT ?auto_1006241 ?auto_1006240 ) ( not ( = ?auto_1006245 ?auto_1006241 ) ) ( SURFACE-AT ?auto_1006239 ?auto_1006240 ) ( ON ?auto_1006239 ?auto_1006242 ) ( CLEAR ?auto_1006239 ) ( not ( = ?auto_1006238 ?auto_1006242 ) ) ( not ( = ?auto_1006239 ?auto_1006242 ) ) ( not ( = ?auto_1006237 ?auto_1006242 ) ) ( SURFACE-AT ?auto_1006237 ?auto_1006243 ) ( CLEAR ?auto_1006237 ) ( IS-CRATE ?auto_1006238 ) ( AVAILABLE ?auto_1006245 ) ( TRUCK-AT ?auto_1006244 ?auto_1006240 ) ( LIFTING ?auto_1006241 ?auto_1006238 ) ( ON ?auto_1006236 ?auto_1006235 ) ( ON ?auto_1006237 ?auto_1006236 ) ( not ( = ?auto_1006235 ?auto_1006236 ) ) ( not ( = ?auto_1006235 ?auto_1006237 ) ) ( not ( = ?auto_1006235 ?auto_1006238 ) ) ( not ( = ?auto_1006235 ?auto_1006239 ) ) ( not ( = ?auto_1006235 ?auto_1006242 ) ) ( not ( = ?auto_1006236 ?auto_1006237 ) ) ( not ( = ?auto_1006236 ?auto_1006238 ) ) ( not ( = ?auto_1006236 ?auto_1006239 ) ) ( not ( = ?auto_1006236 ?auto_1006242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006237 ?auto_1006238 ?auto_1006239 )
      ( MAKE-4CRATE-VERIFY ?auto_1006235 ?auto_1006236 ?auto_1006237 ?auto_1006238 ?auto_1006239 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1006246 - SURFACE
      ?auto_1006247 - SURFACE
      ?auto_1006248 - SURFACE
      ?auto_1006249 - SURFACE
      ?auto_1006250 - SURFACE
      ?auto_1006251 - SURFACE
    )
    :vars
    (
      ?auto_1006257 - HOIST
      ?auto_1006255 - PLACE
      ?auto_1006252 - PLACE
      ?auto_1006253 - HOIST
      ?auto_1006254 - SURFACE
      ?auto_1006256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006257 ?auto_1006255 ) ( IS-CRATE ?auto_1006251 ) ( not ( = ?auto_1006250 ?auto_1006251 ) ) ( not ( = ?auto_1006249 ?auto_1006250 ) ) ( not ( = ?auto_1006249 ?auto_1006251 ) ) ( not ( = ?auto_1006252 ?auto_1006255 ) ) ( HOIST-AT ?auto_1006253 ?auto_1006252 ) ( not ( = ?auto_1006257 ?auto_1006253 ) ) ( SURFACE-AT ?auto_1006251 ?auto_1006252 ) ( ON ?auto_1006251 ?auto_1006254 ) ( CLEAR ?auto_1006251 ) ( not ( = ?auto_1006250 ?auto_1006254 ) ) ( not ( = ?auto_1006251 ?auto_1006254 ) ) ( not ( = ?auto_1006249 ?auto_1006254 ) ) ( SURFACE-AT ?auto_1006249 ?auto_1006255 ) ( CLEAR ?auto_1006249 ) ( IS-CRATE ?auto_1006250 ) ( AVAILABLE ?auto_1006257 ) ( TRUCK-AT ?auto_1006256 ?auto_1006252 ) ( LIFTING ?auto_1006253 ?auto_1006250 ) ( ON ?auto_1006247 ?auto_1006246 ) ( ON ?auto_1006248 ?auto_1006247 ) ( ON ?auto_1006249 ?auto_1006248 ) ( not ( = ?auto_1006246 ?auto_1006247 ) ) ( not ( = ?auto_1006246 ?auto_1006248 ) ) ( not ( = ?auto_1006246 ?auto_1006249 ) ) ( not ( = ?auto_1006246 ?auto_1006250 ) ) ( not ( = ?auto_1006246 ?auto_1006251 ) ) ( not ( = ?auto_1006246 ?auto_1006254 ) ) ( not ( = ?auto_1006247 ?auto_1006248 ) ) ( not ( = ?auto_1006247 ?auto_1006249 ) ) ( not ( = ?auto_1006247 ?auto_1006250 ) ) ( not ( = ?auto_1006247 ?auto_1006251 ) ) ( not ( = ?auto_1006247 ?auto_1006254 ) ) ( not ( = ?auto_1006248 ?auto_1006249 ) ) ( not ( = ?auto_1006248 ?auto_1006250 ) ) ( not ( = ?auto_1006248 ?auto_1006251 ) ) ( not ( = ?auto_1006248 ?auto_1006254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006249 ?auto_1006250 ?auto_1006251 )
      ( MAKE-5CRATE-VERIFY ?auto_1006246 ?auto_1006247 ?auto_1006248 ?auto_1006249 ?auto_1006250 ?auto_1006251 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1006258 - SURFACE
      ?auto_1006259 - SURFACE
      ?auto_1006260 - SURFACE
      ?auto_1006261 - SURFACE
      ?auto_1006262 - SURFACE
      ?auto_1006263 - SURFACE
      ?auto_1006264 - SURFACE
    )
    :vars
    (
      ?auto_1006270 - HOIST
      ?auto_1006268 - PLACE
      ?auto_1006265 - PLACE
      ?auto_1006266 - HOIST
      ?auto_1006267 - SURFACE
      ?auto_1006269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006270 ?auto_1006268 ) ( IS-CRATE ?auto_1006264 ) ( not ( = ?auto_1006263 ?auto_1006264 ) ) ( not ( = ?auto_1006262 ?auto_1006263 ) ) ( not ( = ?auto_1006262 ?auto_1006264 ) ) ( not ( = ?auto_1006265 ?auto_1006268 ) ) ( HOIST-AT ?auto_1006266 ?auto_1006265 ) ( not ( = ?auto_1006270 ?auto_1006266 ) ) ( SURFACE-AT ?auto_1006264 ?auto_1006265 ) ( ON ?auto_1006264 ?auto_1006267 ) ( CLEAR ?auto_1006264 ) ( not ( = ?auto_1006263 ?auto_1006267 ) ) ( not ( = ?auto_1006264 ?auto_1006267 ) ) ( not ( = ?auto_1006262 ?auto_1006267 ) ) ( SURFACE-AT ?auto_1006262 ?auto_1006268 ) ( CLEAR ?auto_1006262 ) ( IS-CRATE ?auto_1006263 ) ( AVAILABLE ?auto_1006270 ) ( TRUCK-AT ?auto_1006269 ?auto_1006265 ) ( LIFTING ?auto_1006266 ?auto_1006263 ) ( ON ?auto_1006259 ?auto_1006258 ) ( ON ?auto_1006260 ?auto_1006259 ) ( ON ?auto_1006261 ?auto_1006260 ) ( ON ?auto_1006262 ?auto_1006261 ) ( not ( = ?auto_1006258 ?auto_1006259 ) ) ( not ( = ?auto_1006258 ?auto_1006260 ) ) ( not ( = ?auto_1006258 ?auto_1006261 ) ) ( not ( = ?auto_1006258 ?auto_1006262 ) ) ( not ( = ?auto_1006258 ?auto_1006263 ) ) ( not ( = ?auto_1006258 ?auto_1006264 ) ) ( not ( = ?auto_1006258 ?auto_1006267 ) ) ( not ( = ?auto_1006259 ?auto_1006260 ) ) ( not ( = ?auto_1006259 ?auto_1006261 ) ) ( not ( = ?auto_1006259 ?auto_1006262 ) ) ( not ( = ?auto_1006259 ?auto_1006263 ) ) ( not ( = ?auto_1006259 ?auto_1006264 ) ) ( not ( = ?auto_1006259 ?auto_1006267 ) ) ( not ( = ?auto_1006260 ?auto_1006261 ) ) ( not ( = ?auto_1006260 ?auto_1006262 ) ) ( not ( = ?auto_1006260 ?auto_1006263 ) ) ( not ( = ?auto_1006260 ?auto_1006264 ) ) ( not ( = ?auto_1006260 ?auto_1006267 ) ) ( not ( = ?auto_1006261 ?auto_1006262 ) ) ( not ( = ?auto_1006261 ?auto_1006263 ) ) ( not ( = ?auto_1006261 ?auto_1006264 ) ) ( not ( = ?auto_1006261 ?auto_1006267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006262 ?auto_1006263 ?auto_1006264 )
      ( MAKE-6CRATE-VERIFY ?auto_1006258 ?auto_1006259 ?auto_1006260 ?auto_1006261 ?auto_1006262 ?auto_1006263 ?auto_1006264 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1006271 - SURFACE
      ?auto_1006272 - SURFACE
      ?auto_1006273 - SURFACE
      ?auto_1006274 - SURFACE
      ?auto_1006275 - SURFACE
      ?auto_1006276 - SURFACE
      ?auto_1006277 - SURFACE
      ?auto_1006278 - SURFACE
    )
    :vars
    (
      ?auto_1006284 - HOIST
      ?auto_1006282 - PLACE
      ?auto_1006279 - PLACE
      ?auto_1006280 - HOIST
      ?auto_1006281 - SURFACE
      ?auto_1006283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006284 ?auto_1006282 ) ( IS-CRATE ?auto_1006278 ) ( not ( = ?auto_1006277 ?auto_1006278 ) ) ( not ( = ?auto_1006276 ?auto_1006277 ) ) ( not ( = ?auto_1006276 ?auto_1006278 ) ) ( not ( = ?auto_1006279 ?auto_1006282 ) ) ( HOIST-AT ?auto_1006280 ?auto_1006279 ) ( not ( = ?auto_1006284 ?auto_1006280 ) ) ( SURFACE-AT ?auto_1006278 ?auto_1006279 ) ( ON ?auto_1006278 ?auto_1006281 ) ( CLEAR ?auto_1006278 ) ( not ( = ?auto_1006277 ?auto_1006281 ) ) ( not ( = ?auto_1006278 ?auto_1006281 ) ) ( not ( = ?auto_1006276 ?auto_1006281 ) ) ( SURFACE-AT ?auto_1006276 ?auto_1006282 ) ( CLEAR ?auto_1006276 ) ( IS-CRATE ?auto_1006277 ) ( AVAILABLE ?auto_1006284 ) ( TRUCK-AT ?auto_1006283 ?auto_1006279 ) ( LIFTING ?auto_1006280 ?auto_1006277 ) ( ON ?auto_1006272 ?auto_1006271 ) ( ON ?auto_1006273 ?auto_1006272 ) ( ON ?auto_1006274 ?auto_1006273 ) ( ON ?auto_1006275 ?auto_1006274 ) ( ON ?auto_1006276 ?auto_1006275 ) ( not ( = ?auto_1006271 ?auto_1006272 ) ) ( not ( = ?auto_1006271 ?auto_1006273 ) ) ( not ( = ?auto_1006271 ?auto_1006274 ) ) ( not ( = ?auto_1006271 ?auto_1006275 ) ) ( not ( = ?auto_1006271 ?auto_1006276 ) ) ( not ( = ?auto_1006271 ?auto_1006277 ) ) ( not ( = ?auto_1006271 ?auto_1006278 ) ) ( not ( = ?auto_1006271 ?auto_1006281 ) ) ( not ( = ?auto_1006272 ?auto_1006273 ) ) ( not ( = ?auto_1006272 ?auto_1006274 ) ) ( not ( = ?auto_1006272 ?auto_1006275 ) ) ( not ( = ?auto_1006272 ?auto_1006276 ) ) ( not ( = ?auto_1006272 ?auto_1006277 ) ) ( not ( = ?auto_1006272 ?auto_1006278 ) ) ( not ( = ?auto_1006272 ?auto_1006281 ) ) ( not ( = ?auto_1006273 ?auto_1006274 ) ) ( not ( = ?auto_1006273 ?auto_1006275 ) ) ( not ( = ?auto_1006273 ?auto_1006276 ) ) ( not ( = ?auto_1006273 ?auto_1006277 ) ) ( not ( = ?auto_1006273 ?auto_1006278 ) ) ( not ( = ?auto_1006273 ?auto_1006281 ) ) ( not ( = ?auto_1006274 ?auto_1006275 ) ) ( not ( = ?auto_1006274 ?auto_1006276 ) ) ( not ( = ?auto_1006274 ?auto_1006277 ) ) ( not ( = ?auto_1006274 ?auto_1006278 ) ) ( not ( = ?auto_1006274 ?auto_1006281 ) ) ( not ( = ?auto_1006275 ?auto_1006276 ) ) ( not ( = ?auto_1006275 ?auto_1006277 ) ) ( not ( = ?auto_1006275 ?auto_1006278 ) ) ( not ( = ?auto_1006275 ?auto_1006281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006276 ?auto_1006277 ?auto_1006278 )
      ( MAKE-7CRATE-VERIFY ?auto_1006271 ?auto_1006272 ?auto_1006273 ?auto_1006274 ?auto_1006275 ?auto_1006276 ?auto_1006277 ?auto_1006278 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1006285 - SURFACE
      ?auto_1006286 - SURFACE
      ?auto_1006287 - SURFACE
      ?auto_1006288 - SURFACE
      ?auto_1006289 - SURFACE
      ?auto_1006290 - SURFACE
      ?auto_1006291 - SURFACE
      ?auto_1006292 - SURFACE
      ?auto_1006293 - SURFACE
    )
    :vars
    (
      ?auto_1006299 - HOIST
      ?auto_1006297 - PLACE
      ?auto_1006294 - PLACE
      ?auto_1006295 - HOIST
      ?auto_1006296 - SURFACE
      ?auto_1006298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006299 ?auto_1006297 ) ( IS-CRATE ?auto_1006293 ) ( not ( = ?auto_1006292 ?auto_1006293 ) ) ( not ( = ?auto_1006291 ?auto_1006292 ) ) ( not ( = ?auto_1006291 ?auto_1006293 ) ) ( not ( = ?auto_1006294 ?auto_1006297 ) ) ( HOIST-AT ?auto_1006295 ?auto_1006294 ) ( not ( = ?auto_1006299 ?auto_1006295 ) ) ( SURFACE-AT ?auto_1006293 ?auto_1006294 ) ( ON ?auto_1006293 ?auto_1006296 ) ( CLEAR ?auto_1006293 ) ( not ( = ?auto_1006292 ?auto_1006296 ) ) ( not ( = ?auto_1006293 ?auto_1006296 ) ) ( not ( = ?auto_1006291 ?auto_1006296 ) ) ( SURFACE-AT ?auto_1006291 ?auto_1006297 ) ( CLEAR ?auto_1006291 ) ( IS-CRATE ?auto_1006292 ) ( AVAILABLE ?auto_1006299 ) ( TRUCK-AT ?auto_1006298 ?auto_1006294 ) ( LIFTING ?auto_1006295 ?auto_1006292 ) ( ON ?auto_1006286 ?auto_1006285 ) ( ON ?auto_1006287 ?auto_1006286 ) ( ON ?auto_1006288 ?auto_1006287 ) ( ON ?auto_1006289 ?auto_1006288 ) ( ON ?auto_1006290 ?auto_1006289 ) ( ON ?auto_1006291 ?auto_1006290 ) ( not ( = ?auto_1006285 ?auto_1006286 ) ) ( not ( = ?auto_1006285 ?auto_1006287 ) ) ( not ( = ?auto_1006285 ?auto_1006288 ) ) ( not ( = ?auto_1006285 ?auto_1006289 ) ) ( not ( = ?auto_1006285 ?auto_1006290 ) ) ( not ( = ?auto_1006285 ?auto_1006291 ) ) ( not ( = ?auto_1006285 ?auto_1006292 ) ) ( not ( = ?auto_1006285 ?auto_1006293 ) ) ( not ( = ?auto_1006285 ?auto_1006296 ) ) ( not ( = ?auto_1006286 ?auto_1006287 ) ) ( not ( = ?auto_1006286 ?auto_1006288 ) ) ( not ( = ?auto_1006286 ?auto_1006289 ) ) ( not ( = ?auto_1006286 ?auto_1006290 ) ) ( not ( = ?auto_1006286 ?auto_1006291 ) ) ( not ( = ?auto_1006286 ?auto_1006292 ) ) ( not ( = ?auto_1006286 ?auto_1006293 ) ) ( not ( = ?auto_1006286 ?auto_1006296 ) ) ( not ( = ?auto_1006287 ?auto_1006288 ) ) ( not ( = ?auto_1006287 ?auto_1006289 ) ) ( not ( = ?auto_1006287 ?auto_1006290 ) ) ( not ( = ?auto_1006287 ?auto_1006291 ) ) ( not ( = ?auto_1006287 ?auto_1006292 ) ) ( not ( = ?auto_1006287 ?auto_1006293 ) ) ( not ( = ?auto_1006287 ?auto_1006296 ) ) ( not ( = ?auto_1006288 ?auto_1006289 ) ) ( not ( = ?auto_1006288 ?auto_1006290 ) ) ( not ( = ?auto_1006288 ?auto_1006291 ) ) ( not ( = ?auto_1006288 ?auto_1006292 ) ) ( not ( = ?auto_1006288 ?auto_1006293 ) ) ( not ( = ?auto_1006288 ?auto_1006296 ) ) ( not ( = ?auto_1006289 ?auto_1006290 ) ) ( not ( = ?auto_1006289 ?auto_1006291 ) ) ( not ( = ?auto_1006289 ?auto_1006292 ) ) ( not ( = ?auto_1006289 ?auto_1006293 ) ) ( not ( = ?auto_1006289 ?auto_1006296 ) ) ( not ( = ?auto_1006290 ?auto_1006291 ) ) ( not ( = ?auto_1006290 ?auto_1006292 ) ) ( not ( = ?auto_1006290 ?auto_1006293 ) ) ( not ( = ?auto_1006290 ?auto_1006296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006291 ?auto_1006292 ?auto_1006293 )
      ( MAKE-8CRATE-VERIFY ?auto_1006285 ?auto_1006286 ?auto_1006287 ?auto_1006288 ?auto_1006289 ?auto_1006290 ?auto_1006291 ?auto_1006292 ?auto_1006293 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1006300 - SURFACE
      ?auto_1006301 - SURFACE
      ?auto_1006302 - SURFACE
      ?auto_1006303 - SURFACE
      ?auto_1006304 - SURFACE
      ?auto_1006305 - SURFACE
      ?auto_1006306 - SURFACE
      ?auto_1006307 - SURFACE
      ?auto_1006308 - SURFACE
      ?auto_1006309 - SURFACE
    )
    :vars
    (
      ?auto_1006315 - HOIST
      ?auto_1006313 - PLACE
      ?auto_1006310 - PLACE
      ?auto_1006311 - HOIST
      ?auto_1006312 - SURFACE
      ?auto_1006314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006315 ?auto_1006313 ) ( IS-CRATE ?auto_1006309 ) ( not ( = ?auto_1006308 ?auto_1006309 ) ) ( not ( = ?auto_1006307 ?auto_1006308 ) ) ( not ( = ?auto_1006307 ?auto_1006309 ) ) ( not ( = ?auto_1006310 ?auto_1006313 ) ) ( HOIST-AT ?auto_1006311 ?auto_1006310 ) ( not ( = ?auto_1006315 ?auto_1006311 ) ) ( SURFACE-AT ?auto_1006309 ?auto_1006310 ) ( ON ?auto_1006309 ?auto_1006312 ) ( CLEAR ?auto_1006309 ) ( not ( = ?auto_1006308 ?auto_1006312 ) ) ( not ( = ?auto_1006309 ?auto_1006312 ) ) ( not ( = ?auto_1006307 ?auto_1006312 ) ) ( SURFACE-AT ?auto_1006307 ?auto_1006313 ) ( CLEAR ?auto_1006307 ) ( IS-CRATE ?auto_1006308 ) ( AVAILABLE ?auto_1006315 ) ( TRUCK-AT ?auto_1006314 ?auto_1006310 ) ( LIFTING ?auto_1006311 ?auto_1006308 ) ( ON ?auto_1006301 ?auto_1006300 ) ( ON ?auto_1006302 ?auto_1006301 ) ( ON ?auto_1006303 ?auto_1006302 ) ( ON ?auto_1006304 ?auto_1006303 ) ( ON ?auto_1006305 ?auto_1006304 ) ( ON ?auto_1006306 ?auto_1006305 ) ( ON ?auto_1006307 ?auto_1006306 ) ( not ( = ?auto_1006300 ?auto_1006301 ) ) ( not ( = ?auto_1006300 ?auto_1006302 ) ) ( not ( = ?auto_1006300 ?auto_1006303 ) ) ( not ( = ?auto_1006300 ?auto_1006304 ) ) ( not ( = ?auto_1006300 ?auto_1006305 ) ) ( not ( = ?auto_1006300 ?auto_1006306 ) ) ( not ( = ?auto_1006300 ?auto_1006307 ) ) ( not ( = ?auto_1006300 ?auto_1006308 ) ) ( not ( = ?auto_1006300 ?auto_1006309 ) ) ( not ( = ?auto_1006300 ?auto_1006312 ) ) ( not ( = ?auto_1006301 ?auto_1006302 ) ) ( not ( = ?auto_1006301 ?auto_1006303 ) ) ( not ( = ?auto_1006301 ?auto_1006304 ) ) ( not ( = ?auto_1006301 ?auto_1006305 ) ) ( not ( = ?auto_1006301 ?auto_1006306 ) ) ( not ( = ?auto_1006301 ?auto_1006307 ) ) ( not ( = ?auto_1006301 ?auto_1006308 ) ) ( not ( = ?auto_1006301 ?auto_1006309 ) ) ( not ( = ?auto_1006301 ?auto_1006312 ) ) ( not ( = ?auto_1006302 ?auto_1006303 ) ) ( not ( = ?auto_1006302 ?auto_1006304 ) ) ( not ( = ?auto_1006302 ?auto_1006305 ) ) ( not ( = ?auto_1006302 ?auto_1006306 ) ) ( not ( = ?auto_1006302 ?auto_1006307 ) ) ( not ( = ?auto_1006302 ?auto_1006308 ) ) ( not ( = ?auto_1006302 ?auto_1006309 ) ) ( not ( = ?auto_1006302 ?auto_1006312 ) ) ( not ( = ?auto_1006303 ?auto_1006304 ) ) ( not ( = ?auto_1006303 ?auto_1006305 ) ) ( not ( = ?auto_1006303 ?auto_1006306 ) ) ( not ( = ?auto_1006303 ?auto_1006307 ) ) ( not ( = ?auto_1006303 ?auto_1006308 ) ) ( not ( = ?auto_1006303 ?auto_1006309 ) ) ( not ( = ?auto_1006303 ?auto_1006312 ) ) ( not ( = ?auto_1006304 ?auto_1006305 ) ) ( not ( = ?auto_1006304 ?auto_1006306 ) ) ( not ( = ?auto_1006304 ?auto_1006307 ) ) ( not ( = ?auto_1006304 ?auto_1006308 ) ) ( not ( = ?auto_1006304 ?auto_1006309 ) ) ( not ( = ?auto_1006304 ?auto_1006312 ) ) ( not ( = ?auto_1006305 ?auto_1006306 ) ) ( not ( = ?auto_1006305 ?auto_1006307 ) ) ( not ( = ?auto_1006305 ?auto_1006308 ) ) ( not ( = ?auto_1006305 ?auto_1006309 ) ) ( not ( = ?auto_1006305 ?auto_1006312 ) ) ( not ( = ?auto_1006306 ?auto_1006307 ) ) ( not ( = ?auto_1006306 ?auto_1006308 ) ) ( not ( = ?auto_1006306 ?auto_1006309 ) ) ( not ( = ?auto_1006306 ?auto_1006312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006307 ?auto_1006308 ?auto_1006309 )
      ( MAKE-9CRATE-VERIFY ?auto_1006300 ?auto_1006301 ?auto_1006302 ?auto_1006303 ?auto_1006304 ?auto_1006305 ?auto_1006306 ?auto_1006307 ?auto_1006308 ?auto_1006309 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1006316 - SURFACE
      ?auto_1006317 - SURFACE
      ?auto_1006318 - SURFACE
      ?auto_1006319 - SURFACE
      ?auto_1006320 - SURFACE
      ?auto_1006321 - SURFACE
      ?auto_1006322 - SURFACE
      ?auto_1006323 - SURFACE
      ?auto_1006324 - SURFACE
      ?auto_1006325 - SURFACE
      ?auto_1006326 - SURFACE
    )
    :vars
    (
      ?auto_1006332 - HOIST
      ?auto_1006330 - PLACE
      ?auto_1006327 - PLACE
      ?auto_1006328 - HOIST
      ?auto_1006329 - SURFACE
      ?auto_1006331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006332 ?auto_1006330 ) ( IS-CRATE ?auto_1006326 ) ( not ( = ?auto_1006325 ?auto_1006326 ) ) ( not ( = ?auto_1006324 ?auto_1006325 ) ) ( not ( = ?auto_1006324 ?auto_1006326 ) ) ( not ( = ?auto_1006327 ?auto_1006330 ) ) ( HOIST-AT ?auto_1006328 ?auto_1006327 ) ( not ( = ?auto_1006332 ?auto_1006328 ) ) ( SURFACE-AT ?auto_1006326 ?auto_1006327 ) ( ON ?auto_1006326 ?auto_1006329 ) ( CLEAR ?auto_1006326 ) ( not ( = ?auto_1006325 ?auto_1006329 ) ) ( not ( = ?auto_1006326 ?auto_1006329 ) ) ( not ( = ?auto_1006324 ?auto_1006329 ) ) ( SURFACE-AT ?auto_1006324 ?auto_1006330 ) ( CLEAR ?auto_1006324 ) ( IS-CRATE ?auto_1006325 ) ( AVAILABLE ?auto_1006332 ) ( TRUCK-AT ?auto_1006331 ?auto_1006327 ) ( LIFTING ?auto_1006328 ?auto_1006325 ) ( ON ?auto_1006317 ?auto_1006316 ) ( ON ?auto_1006318 ?auto_1006317 ) ( ON ?auto_1006319 ?auto_1006318 ) ( ON ?auto_1006320 ?auto_1006319 ) ( ON ?auto_1006321 ?auto_1006320 ) ( ON ?auto_1006322 ?auto_1006321 ) ( ON ?auto_1006323 ?auto_1006322 ) ( ON ?auto_1006324 ?auto_1006323 ) ( not ( = ?auto_1006316 ?auto_1006317 ) ) ( not ( = ?auto_1006316 ?auto_1006318 ) ) ( not ( = ?auto_1006316 ?auto_1006319 ) ) ( not ( = ?auto_1006316 ?auto_1006320 ) ) ( not ( = ?auto_1006316 ?auto_1006321 ) ) ( not ( = ?auto_1006316 ?auto_1006322 ) ) ( not ( = ?auto_1006316 ?auto_1006323 ) ) ( not ( = ?auto_1006316 ?auto_1006324 ) ) ( not ( = ?auto_1006316 ?auto_1006325 ) ) ( not ( = ?auto_1006316 ?auto_1006326 ) ) ( not ( = ?auto_1006316 ?auto_1006329 ) ) ( not ( = ?auto_1006317 ?auto_1006318 ) ) ( not ( = ?auto_1006317 ?auto_1006319 ) ) ( not ( = ?auto_1006317 ?auto_1006320 ) ) ( not ( = ?auto_1006317 ?auto_1006321 ) ) ( not ( = ?auto_1006317 ?auto_1006322 ) ) ( not ( = ?auto_1006317 ?auto_1006323 ) ) ( not ( = ?auto_1006317 ?auto_1006324 ) ) ( not ( = ?auto_1006317 ?auto_1006325 ) ) ( not ( = ?auto_1006317 ?auto_1006326 ) ) ( not ( = ?auto_1006317 ?auto_1006329 ) ) ( not ( = ?auto_1006318 ?auto_1006319 ) ) ( not ( = ?auto_1006318 ?auto_1006320 ) ) ( not ( = ?auto_1006318 ?auto_1006321 ) ) ( not ( = ?auto_1006318 ?auto_1006322 ) ) ( not ( = ?auto_1006318 ?auto_1006323 ) ) ( not ( = ?auto_1006318 ?auto_1006324 ) ) ( not ( = ?auto_1006318 ?auto_1006325 ) ) ( not ( = ?auto_1006318 ?auto_1006326 ) ) ( not ( = ?auto_1006318 ?auto_1006329 ) ) ( not ( = ?auto_1006319 ?auto_1006320 ) ) ( not ( = ?auto_1006319 ?auto_1006321 ) ) ( not ( = ?auto_1006319 ?auto_1006322 ) ) ( not ( = ?auto_1006319 ?auto_1006323 ) ) ( not ( = ?auto_1006319 ?auto_1006324 ) ) ( not ( = ?auto_1006319 ?auto_1006325 ) ) ( not ( = ?auto_1006319 ?auto_1006326 ) ) ( not ( = ?auto_1006319 ?auto_1006329 ) ) ( not ( = ?auto_1006320 ?auto_1006321 ) ) ( not ( = ?auto_1006320 ?auto_1006322 ) ) ( not ( = ?auto_1006320 ?auto_1006323 ) ) ( not ( = ?auto_1006320 ?auto_1006324 ) ) ( not ( = ?auto_1006320 ?auto_1006325 ) ) ( not ( = ?auto_1006320 ?auto_1006326 ) ) ( not ( = ?auto_1006320 ?auto_1006329 ) ) ( not ( = ?auto_1006321 ?auto_1006322 ) ) ( not ( = ?auto_1006321 ?auto_1006323 ) ) ( not ( = ?auto_1006321 ?auto_1006324 ) ) ( not ( = ?auto_1006321 ?auto_1006325 ) ) ( not ( = ?auto_1006321 ?auto_1006326 ) ) ( not ( = ?auto_1006321 ?auto_1006329 ) ) ( not ( = ?auto_1006322 ?auto_1006323 ) ) ( not ( = ?auto_1006322 ?auto_1006324 ) ) ( not ( = ?auto_1006322 ?auto_1006325 ) ) ( not ( = ?auto_1006322 ?auto_1006326 ) ) ( not ( = ?auto_1006322 ?auto_1006329 ) ) ( not ( = ?auto_1006323 ?auto_1006324 ) ) ( not ( = ?auto_1006323 ?auto_1006325 ) ) ( not ( = ?auto_1006323 ?auto_1006326 ) ) ( not ( = ?auto_1006323 ?auto_1006329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006324 ?auto_1006325 ?auto_1006326 )
      ( MAKE-10CRATE-VERIFY ?auto_1006316 ?auto_1006317 ?auto_1006318 ?auto_1006319 ?auto_1006320 ?auto_1006321 ?auto_1006322 ?auto_1006323 ?auto_1006324 ?auto_1006325 ?auto_1006326 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006333 - SURFACE
      ?auto_1006334 - SURFACE
      ?auto_1006335 - SURFACE
      ?auto_1006336 - SURFACE
      ?auto_1006337 - SURFACE
      ?auto_1006338 - SURFACE
      ?auto_1006339 - SURFACE
      ?auto_1006340 - SURFACE
      ?auto_1006341 - SURFACE
      ?auto_1006342 - SURFACE
      ?auto_1006343 - SURFACE
      ?auto_1006344 - SURFACE
    )
    :vars
    (
      ?auto_1006350 - HOIST
      ?auto_1006348 - PLACE
      ?auto_1006345 - PLACE
      ?auto_1006346 - HOIST
      ?auto_1006347 - SURFACE
      ?auto_1006349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006350 ?auto_1006348 ) ( IS-CRATE ?auto_1006344 ) ( not ( = ?auto_1006343 ?auto_1006344 ) ) ( not ( = ?auto_1006342 ?auto_1006343 ) ) ( not ( = ?auto_1006342 ?auto_1006344 ) ) ( not ( = ?auto_1006345 ?auto_1006348 ) ) ( HOIST-AT ?auto_1006346 ?auto_1006345 ) ( not ( = ?auto_1006350 ?auto_1006346 ) ) ( SURFACE-AT ?auto_1006344 ?auto_1006345 ) ( ON ?auto_1006344 ?auto_1006347 ) ( CLEAR ?auto_1006344 ) ( not ( = ?auto_1006343 ?auto_1006347 ) ) ( not ( = ?auto_1006344 ?auto_1006347 ) ) ( not ( = ?auto_1006342 ?auto_1006347 ) ) ( SURFACE-AT ?auto_1006342 ?auto_1006348 ) ( CLEAR ?auto_1006342 ) ( IS-CRATE ?auto_1006343 ) ( AVAILABLE ?auto_1006350 ) ( TRUCK-AT ?auto_1006349 ?auto_1006345 ) ( LIFTING ?auto_1006346 ?auto_1006343 ) ( ON ?auto_1006334 ?auto_1006333 ) ( ON ?auto_1006335 ?auto_1006334 ) ( ON ?auto_1006336 ?auto_1006335 ) ( ON ?auto_1006337 ?auto_1006336 ) ( ON ?auto_1006338 ?auto_1006337 ) ( ON ?auto_1006339 ?auto_1006338 ) ( ON ?auto_1006340 ?auto_1006339 ) ( ON ?auto_1006341 ?auto_1006340 ) ( ON ?auto_1006342 ?auto_1006341 ) ( not ( = ?auto_1006333 ?auto_1006334 ) ) ( not ( = ?auto_1006333 ?auto_1006335 ) ) ( not ( = ?auto_1006333 ?auto_1006336 ) ) ( not ( = ?auto_1006333 ?auto_1006337 ) ) ( not ( = ?auto_1006333 ?auto_1006338 ) ) ( not ( = ?auto_1006333 ?auto_1006339 ) ) ( not ( = ?auto_1006333 ?auto_1006340 ) ) ( not ( = ?auto_1006333 ?auto_1006341 ) ) ( not ( = ?auto_1006333 ?auto_1006342 ) ) ( not ( = ?auto_1006333 ?auto_1006343 ) ) ( not ( = ?auto_1006333 ?auto_1006344 ) ) ( not ( = ?auto_1006333 ?auto_1006347 ) ) ( not ( = ?auto_1006334 ?auto_1006335 ) ) ( not ( = ?auto_1006334 ?auto_1006336 ) ) ( not ( = ?auto_1006334 ?auto_1006337 ) ) ( not ( = ?auto_1006334 ?auto_1006338 ) ) ( not ( = ?auto_1006334 ?auto_1006339 ) ) ( not ( = ?auto_1006334 ?auto_1006340 ) ) ( not ( = ?auto_1006334 ?auto_1006341 ) ) ( not ( = ?auto_1006334 ?auto_1006342 ) ) ( not ( = ?auto_1006334 ?auto_1006343 ) ) ( not ( = ?auto_1006334 ?auto_1006344 ) ) ( not ( = ?auto_1006334 ?auto_1006347 ) ) ( not ( = ?auto_1006335 ?auto_1006336 ) ) ( not ( = ?auto_1006335 ?auto_1006337 ) ) ( not ( = ?auto_1006335 ?auto_1006338 ) ) ( not ( = ?auto_1006335 ?auto_1006339 ) ) ( not ( = ?auto_1006335 ?auto_1006340 ) ) ( not ( = ?auto_1006335 ?auto_1006341 ) ) ( not ( = ?auto_1006335 ?auto_1006342 ) ) ( not ( = ?auto_1006335 ?auto_1006343 ) ) ( not ( = ?auto_1006335 ?auto_1006344 ) ) ( not ( = ?auto_1006335 ?auto_1006347 ) ) ( not ( = ?auto_1006336 ?auto_1006337 ) ) ( not ( = ?auto_1006336 ?auto_1006338 ) ) ( not ( = ?auto_1006336 ?auto_1006339 ) ) ( not ( = ?auto_1006336 ?auto_1006340 ) ) ( not ( = ?auto_1006336 ?auto_1006341 ) ) ( not ( = ?auto_1006336 ?auto_1006342 ) ) ( not ( = ?auto_1006336 ?auto_1006343 ) ) ( not ( = ?auto_1006336 ?auto_1006344 ) ) ( not ( = ?auto_1006336 ?auto_1006347 ) ) ( not ( = ?auto_1006337 ?auto_1006338 ) ) ( not ( = ?auto_1006337 ?auto_1006339 ) ) ( not ( = ?auto_1006337 ?auto_1006340 ) ) ( not ( = ?auto_1006337 ?auto_1006341 ) ) ( not ( = ?auto_1006337 ?auto_1006342 ) ) ( not ( = ?auto_1006337 ?auto_1006343 ) ) ( not ( = ?auto_1006337 ?auto_1006344 ) ) ( not ( = ?auto_1006337 ?auto_1006347 ) ) ( not ( = ?auto_1006338 ?auto_1006339 ) ) ( not ( = ?auto_1006338 ?auto_1006340 ) ) ( not ( = ?auto_1006338 ?auto_1006341 ) ) ( not ( = ?auto_1006338 ?auto_1006342 ) ) ( not ( = ?auto_1006338 ?auto_1006343 ) ) ( not ( = ?auto_1006338 ?auto_1006344 ) ) ( not ( = ?auto_1006338 ?auto_1006347 ) ) ( not ( = ?auto_1006339 ?auto_1006340 ) ) ( not ( = ?auto_1006339 ?auto_1006341 ) ) ( not ( = ?auto_1006339 ?auto_1006342 ) ) ( not ( = ?auto_1006339 ?auto_1006343 ) ) ( not ( = ?auto_1006339 ?auto_1006344 ) ) ( not ( = ?auto_1006339 ?auto_1006347 ) ) ( not ( = ?auto_1006340 ?auto_1006341 ) ) ( not ( = ?auto_1006340 ?auto_1006342 ) ) ( not ( = ?auto_1006340 ?auto_1006343 ) ) ( not ( = ?auto_1006340 ?auto_1006344 ) ) ( not ( = ?auto_1006340 ?auto_1006347 ) ) ( not ( = ?auto_1006341 ?auto_1006342 ) ) ( not ( = ?auto_1006341 ?auto_1006343 ) ) ( not ( = ?auto_1006341 ?auto_1006344 ) ) ( not ( = ?auto_1006341 ?auto_1006347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006342 ?auto_1006343 ?auto_1006344 )
      ( MAKE-11CRATE-VERIFY ?auto_1006333 ?auto_1006334 ?auto_1006335 ?auto_1006336 ?auto_1006337 ?auto_1006338 ?auto_1006339 ?auto_1006340 ?auto_1006341 ?auto_1006342 ?auto_1006343 ?auto_1006344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1006351 - SURFACE
      ?auto_1006352 - SURFACE
    )
    :vars
    (
      ?auto_1006359 - HOIST
      ?auto_1006357 - PLACE
      ?auto_1006355 - SURFACE
      ?auto_1006353 - PLACE
      ?auto_1006354 - HOIST
      ?auto_1006356 - SURFACE
      ?auto_1006358 - TRUCK
      ?auto_1006360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006359 ?auto_1006357 ) ( IS-CRATE ?auto_1006352 ) ( not ( = ?auto_1006351 ?auto_1006352 ) ) ( not ( = ?auto_1006355 ?auto_1006351 ) ) ( not ( = ?auto_1006355 ?auto_1006352 ) ) ( not ( = ?auto_1006353 ?auto_1006357 ) ) ( HOIST-AT ?auto_1006354 ?auto_1006353 ) ( not ( = ?auto_1006359 ?auto_1006354 ) ) ( SURFACE-AT ?auto_1006352 ?auto_1006353 ) ( ON ?auto_1006352 ?auto_1006356 ) ( CLEAR ?auto_1006352 ) ( not ( = ?auto_1006351 ?auto_1006356 ) ) ( not ( = ?auto_1006352 ?auto_1006356 ) ) ( not ( = ?auto_1006355 ?auto_1006356 ) ) ( SURFACE-AT ?auto_1006355 ?auto_1006357 ) ( CLEAR ?auto_1006355 ) ( IS-CRATE ?auto_1006351 ) ( AVAILABLE ?auto_1006359 ) ( TRUCK-AT ?auto_1006358 ?auto_1006353 ) ( AVAILABLE ?auto_1006354 ) ( SURFACE-AT ?auto_1006351 ?auto_1006353 ) ( ON ?auto_1006351 ?auto_1006360 ) ( CLEAR ?auto_1006351 ) ( not ( = ?auto_1006351 ?auto_1006360 ) ) ( not ( = ?auto_1006352 ?auto_1006360 ) ) ( not ( = ?auto_1006355 ?auto_1006360 ) ) ( not ( = ?auto_1006356 ?auto_1006360 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1006354 ?auto_1006351 ?auto_1006360 ?auto_1006353 )
      ( MAKE-2CRATE ?auto_1006355 ?auto_1006351 ?auto_1006352 )
      ( MAKE-1CRATE-VERIFY ?auto_1006351 ?auto_1006352 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1006361 - SURFACE
      ?auto_1006362 - SURFACE
      ?auto_1006363 - SURFACE
    )
    :vars
    (
      ?auto_1006366 - HOIST
      ?auto_1006368 - PLACE
      ?auto_1006365 - PLACE
      ?auto_1006367 - HOIST
      ?auto_1006370 - SURFACE
      ?auto_1006369 - TRUCK
      ?auto_1006364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006366 ?auto_1006368 ) ( IS-CRATE ?auto_1006363 ) ( not ( = ?auto_1006362 ?auto_1006363 ) ) ( not ( = ?auto_1006361 ?auto_1006362 ) ) ( not ( = ?auto_1006361 ?auto_1006363 ) ) ( not ( = ?auto_1006365 ?auto_1006368 ) ) ( HOIST-AT ?auto_1006367 ?auto_1006365 ) ( not ( = ?auto_1006366 ?auto_1006367 ) ) ( SURFACE-AT ?auto_1006363 ?auto_1006365 ) ( ON ?auto_1006363 ?auto_1006370 ) ( CLEAR ?auto_1006363 ) ( not ( = ?auto_1006362 ?auto_1006370 ) ) ( not ( = ?auto_1006363 ?auto_1006370 ) ) ( not ( = ?auto_1006361 ?auto_1006370 ) ) ( SURFACE-AT ?auto_1006361 ?auto_1006368 ) ( CLEAR ?auto_1006361 ) ( IS-CRATE ?auto_1006362 ) ( AVAILABLE ?auto_1006366 ) ( TRUCK-AT ?auto_1006369 ?auto_1006365 ) ( AVAILABLE ?auto_1006367 ) ( SURFACE-AT ?auto_1006362 ?auto_1006365 ) ( ON ?auto_1006362 ?auto_1006364 ) ( CLEAR ?auto_1006362 ) ( not ( = ?auto_1006362 ?auto_1006364 ) ) ( not ( = ?auto_1006363 ?auto_1006364 ) ) ( not ( = ?auto_1006361 ?auto_1006364 ) ) ( not ( = ?auto_1006370 ?auto_1006364 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1006362 ?auto_1006363 )
      ( MAKE-2CRATE-VERIFY ?auto_1006361 ?auto_1006362 ?auto_1006363 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1006371 - SURFACE
      ?auto_1006372 - SURFACE
      ?auto_1006373 - SURFACE
      ?auto_1006374 - SURFACE
    )
    :vars
    (
      ?auto_1006376 - HOIST
      ?auto_1006380 - PLACE
      ?auto_1006377 - PLACE
      ?auto_1006375 - HOIST
      ?auto_1006381 - SURFACE
      ?auto_1006379 - TRUCK
      ?auto_1006378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006376 ?auto_1006380 ) ( IS-CRATE ?auto_1006374 ) ( not ( = ?auto_1006373 ?auto_1006374 ) ) ( not ( = ?auto_1006372 ?auto_1006373 ) ) ( not ( = ?auto_1006372 ?auto_1006374 ) ) ( not ( = ?auto_1006377 ?auto_1006380 ) ) ( HOIST-AT ?auto_1006375 ?auto_1006377 ) ( not ( = ?auto_1006376 ?auto_1006375 ) ) ( SURFACE-AT ?auto_1006374 ?auto_1006377 ) ( ON ?auto_1006374 ?auto_1006381 ) ( CLEAR ?auto_1006374 ) ( not ( = ?auto_1006373 ?auto_1006381 ) ) ( not ( = ?auto_1006374 ?auto_1006381 ) ) ( not ( = ?auto_1006372 ?auto_1006381 ) ) ( SURFACE-AT ?auto_1006372 ?auto_1006380 ) ( CLEAR ?auto_1006372 ) ( IS-CRATE ?auto_1006373 ) ( AVAILABLE ?auto_1006376 ) ( TRUCK-AT ?auto_1006379 ?auto_1006377 ) ( AVAILABLE ?auto_1006375 ) ( SURFACE-AT ?auto_1006373 ?auto_1006377 ) ( ON ?auto_1006373 ?auto_1006378 ) ( CLEAR ?auto_1006373 ) ( not ( = ?auto_1006373 ?auto_1006378 ) ) ( not ( = ?auto_1006374 ?auto_1006378 ) ) ( not ( = ?auto_1006372 ?auto_1006378 ) ) ( not ( = ?auto_1006381 ?auto_1006378 ) ) ( ON ?auto_1006372 ?auto_1006371 ) ( not ( = ?auto_1006371 ?auto_1006372 ) ) ( not ( = ?auto_1006371 ?auto_1006373 ) ) ( not ( = ?auto_1006371 ?auto_1006374 ) ) ( not ( = ?auto_1006371 ?auto_1006381 ) ) ( not ( = ?auto_1006371 ?auto_1006378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006372 ?auto_1006373 ?auto_1006374 )
      ( MAKE-3CRATE-VERIFY ?auto_1006371 ?auto_1006372 ?auto_1006373 ?auto_1006374 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1006382 - SURFACE
      ?auto_1006383 - SURFACE
      ?auto_1006384 - SURFACE
      ?auto_1006385 - SURFACE
      ?auto_1006386 - SURFACE
    )
    :vars
    (
      ?auto_1006388 - HOIST
      ?auto_1006392 - PLACE
      ?auto_1006389 - PLACE
      ?auto_1006387 - HOIST
      ?auto_1006393 - SURFACE
      ?auto_1006391 - TRUCK
      ?auto_1006390 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006388 ?auto_1006392 ) ( IS-CRATE ?auto_1006386 ) ( not ( = ?auto_1006385 ?auto_1006386 ) ) ( not ( = ?auto_1006384 ?auto_1006385 ) ) ( not ( = ?auto_1006384 ?auto_1006386 ) ) ( not ( = ?auto_1006389 ?auto_1006392 ) ) ( HOIST-AT ?auto_1006387 ?auto_1006389 ) ( not ( = ?auto_1006388 ?auto_1006387 ) ) ( SURFACE-AT ?auto_1006386 ?auto_1006389 ) ( ON ?auto_1006386 ?auto_1006393 ) ( CLEAR ?auto_1006386 ) ( not ( = ?auto_1006385 ?auto_1006393 ) ) ( not ( = ?auto_1006386 ?auto_1006393 ) ) ( not ( = ?auto_1006384 ?auto_1006393 ) ) ( SURFACE-AT ?auto_1006384 ?auto_1006392 ) ( CLEAR ?auto_1006384 ) ( IS-CRATE ?auto_1006385 ) ( AVAILABLE ?auto_1006388 ) ( TRUCK-AT ?auto_1006391 ?auto_1006389 ) ( AVAILABLE ?auto_1006387 ) ( SURFACE-AT ?auto_1006385 ?auto_1006389 ) ( ON ?auto_1006385 ?auto_1006390 ) ( CLEAR ?auto_1006385 ) ( not ( = ?auto_1006385 ?auto_1006390 ) ) ( not ( = ?auto_1006386 ?auto_1006390 ) ) ( not ( = ?auto_1006384 ?auto_1006390 ) ) ( not ( = ?auto_1006393 ?auto_1006390 ) ) ( ON ?auto_1006383 ?auto_1006382 ) ( ON ?auto_1006384 ?auto_1006383 ) ( not ( = ?auto_1006382 ?auto_1006383 ) ) ( not ( = ?auto_1006382 ?auto_1006384 ) ) ( not ( = ?auto_1006382 ?auto_1006385 ) ) ( not ( = ?auto_1006382 ?auto_1006386 ) ) ( not ( = ?auto_1006382 ?auto_1006393 ) ) ( not ( = ?auto_1006382 ?auto_1006390 ) ) ( not ( = ?auto_1006383 ?auto_1006384 ) ) ( not ( = ?auto_1006383 ?auto_1006385 ) ) ( not ( = ?auto_1006383 ?auto_1006386 ) ) ( not ( = ?auto_1006383 ?auto_1006393 ) ) ( not ( = ?auto_1006383 ?auto_1006390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006384 ?auto_1006385 ?auto_1006386 )
      ( MAKE-4CRATE-VERIFY ?auto_1006382 ?auto_1006383 ?auto_1006384 ?auto_1006385 ?auto_1006386 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1006394 - SURFACE
      ?auto_1006395 - SURFACE
      ?auto_1006396 - SURFACE
      ?auto_1006397 - SURFACE
      ?auto_1006398 - SURFACE
      ?auto_1006399 - SURFACE
    )
    :vars
    (
      ?auto_1006401 - HOIST
      ?auto_1006405 - PLACE
      ?auto_1006402 - PLACE
      ?auto_1006400 - HOIST
      ?auto_1006406 - SURFACE
      ?auto_1006404 - TRUCK
      ?auto_1006403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006401 ?auto_1006405 ) ( IS-CRATE ?auto_1006399 ) ( not ( = ?auto_1006398 ?auto_1006399 ) ) ( not ( = ?auto_1006397 ?auto_1006398 ) ) ( not ( = ?auto_1006397 ?auto_1006399 ) ) ( not ( = ?auto_1006402 ?auto_1006405 ) ) ( HOIST-AT ?auto_1006400 ?auto_1006402 ) ( not ( = ?auto_1006401 ?auto_1006400 ) ) ( SURFACE-AT ?auto_1006399 ?auto_1006402 ) ( ON ?auto_1006399 ?auto_1006406 ) ( CLEAR ?auto_1006399 ) ( not ( = ?auto_1006398 ?auto_1006406 ) ) ( not ( = ?auto_1006399 ?auto_1006406 ) ) ( not ( = ?auto_1006397 ?auto_1006406 ) ) ( SURFACE-AT ?auto_1006397 ?auto_1006405 ) ( CLEAR ?auto_1006397 ) ( IS-CRATE ?auto_1006398 ) ( AVAILABLE ?auto_1006401 ) ( TRUCK-AT ?auto_1006404 ?auto_1006402 ) ( AVAILABLE ?auto_1006400 ) ( SURFACE-AT ?auto_1006398 ?auto_1006402 ) ( ON ?auto_1006398 ?auto_1006403 ) ( CLEAR ?auto_1006398 ) ( not ( = ?auto_1006398 ?auto_1006403 ) ) ( not ( = ?auto_1006399 ?auto_1006403 ) ) ( not ( = ?auto_1006397 ?auto_1006403 ) ) ( not ( = ?auto_1006406 ?auto_1006403 ) ) ( ON ?auto_1006395 ?auto_1006394 ) ( ON ?auto_1006396 ?auto_1006395 ) ( ON ?auto_1006397 ?auto_1006396 ) ( not ( = ?auto_1006394 ?auto_1006395 ) ) ( not ( = ?auto_1006394 ?auto_1006396 ) ) ( not ( = ?auto_1006394 ?auto_1006397 ) ) ( not ( = ?auto_1006394 ?auto_1006398 ) ) ( not ( = ?auto_1006394 ?auto_1006399 ) ) ( not ( = ?auto_1006394 ?auto_1006406 ) ) ( not ( = ?auto_1006394 ?auto_1006403 ) ) ( not ( = ?auto_1006395 ?auto_1006396 ) ) ( not ( = ?auto_1006395 ?auto_1006397 ) ) ( not ( = ?auto_1006395 ?auto_1006398 ) ) ( not ( = ?auto_1006395 ?auto_1006399 ) ) ( not ( = ?auto_1006395 ?auto_1006406 ) ) ( not ( = ?auto_1006395 ?auto_1006403 ) ) ( not ( = ?auto_1006396 ?auto_1006397 ) ) ( not ( = ?auto_1006396 ?auto_1006398 ) ) ( not ( = ?auto_1006396 ?auto_1006399 ) ) ( not ( = ?auto_1006396 ?auto_1006406 ) ) ( not ( = ?auto_1006396 ?auto_1006403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006397 ?auto_1006398 ?auto_1006399 )
      ( MAKE-5CRATE-VERIFY ?auto_1006394 ?auto_1006395 ?auto_1006396 ?auto_1006397 ?auto_1006398 ?auto_1006399 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1006407 - SURFACE
      ?auto_1006408 - SURFACE
      ?auto_1006409 - SURFACE
      ?auto_1006410 - SURFACE
      ?auto_1006411 - SURFACE
      ?auto_1006412 - SURFACE
      ?auto_1006413 - SURFACE
    )
    :vars
    (
      ?auto_1006415 - HOIST
      ?auto_1006419 - PLACE
      ?auto_1006416 - PLACE
      ?auto_1006414 - HOIST
      ?auto_1006420 - SURFACE
      ?auto_1006418 - TRUCK
      ?auto_1006417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006415 ?auto_1006419 ) ( IS-CRATE ?auto_1006413 ) ( not ( = ?auto_1006412 ?auto_1006413 ) ) ( not ( = ?auto_1006411 ?auto_1006412 ) ) ( not ( = ?auto_1006411 ?auto_1006413 ) ) ( not ( = ?auto_1006416 ?auto_1006419 ) ) ( HOIST-AT ?auto_1006414 ?auto_1006416 ) ( not ( = ?auto_1006415 ?auto_1006414 ) ) ( SURFACE-AT ?auto_1006413 ?auto_1006416 ) ( ON ?auto_1006413 ?auto_1006420 ) ( CLEAR ?auto_1006413 ) ( not ( = ?auto_1006412 ?auto_1006420 ) ) ( not ( = ?auto_1006413 ?auto_1006420 ) ) ( not ( = ?auto_1006411 ?auto_1006420 ) ) ( SURFACE-AT ?auto_1006411 ?auto_1006419 ) ( CLEAR ?auto_1006411 ) ( IS-CRATE ?auto_1006412 ) ( AVAILABLE ?auto_1006415 ) ( TRUCK-AT ?auto_1006418 ?auto_1006416 ) ( AVAILABLE ?auto_1006414 ) ( SURFACE-AT ?auto_1006412 ?auto_1006416 ) ( ON ?auto_1006412 ?auto_1006417 ) ( CLEAR ?auto_1006412 ) ( not ( = ?auto_1006412 ?auto_1006417 ) ) ( not ( = ?auto_1006413 ?auto_1006417 ) ) ( not ( = ?auto_1006411 ?auto_1006417 ) ) ( not ( = ?auto_1006420 ?auto_1006417 ) ) ( ON ?auto_1006408 ?auto_1006407 ) ( ON ?auto_1006409 ?auto_1006408 ) ( ON ?auto_1006410 ?auto_1006409 ) ( ON ?auto_1006411 ?auto_1006410 ) ( not ( = ?auto_1006407 ?auto_1006408 ) ) ( not ( = ?auto_1006407 ?auto_1006409 ) ) ( not ( = ?auto_1006407 ?auto_1006410 ) ) ( not ( = ?auto_1006407 ?auto_1006411 ) ) ( not ( = ?auto_1006407 ?auto_1006412 ) ) ( not ( = ?auto_1006407 ?auto_1006413 ) ) ( not ( = ?auto_1006407 ?auto_1006420 ) ) ( not ( = ?auto_1006407 ?auto_1006417 ) ) ( not ( = ?auto_1006408 ?auto_1006409 ) ) ( not ( = ?auto_1006408 ?auto_1006410 ) ) ( not ( = ?auto_1006408 ?auto_1006411 ) ) ( not ( = ?auto_1006408 ?auto_1006412 ) ) ( not ( = ?auto_1006408 ?auto_1006413 ) ) ( not ( = ?auto_1006408 ?auto_1006420 ) ) ( not ( = ?auto_1006408 ?auto_1006417 ) ) ( not ( = ?auto_1006409 ?auto_1006410 ) ) ( not ( = ?auto_1006409 ?auto_1006411 ) ) ( not ( = ?auto_1006409 ?auto_1006412 ) ) ( not ( = ?auto_1006409 ?auto_1006413 ) ) ( not ( = ?auto_1006409 ?auto_1006420 ) ) ( not ( = ?auto_1006409 ?auto_1006417 ) ) ( not ( = ?auto_1006410 ?auto_1006411 ) ) ( not ( = ?auto_1006410 ?auto_1006412 ) ) ( not ( = ?auto_1006410 ?auto_1006413 ) ) ( not ( = ?auto_1006410 ?auto_1006420 ) ) ( not ( = ?auto_1006410 ?auto_1006417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006411 ?auto_1006412 ?auto_1006413 )
      ( MAKE-6CRATE-VERIFY ?auto_1006407 ?auto_1006408 ?auto_1006409 ?auto_1006410 ?auto_1006411 ?auto_1006412 ?auto_1006413 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1006421 - SURFACE
      ?auto_1006422 - SURFACE
      ?auto_1006423 - SURFACE
      ?auto_1006424 - SURFACE
      ?auto_1006425 - SURFACE
      ?auto_1006426 - SURFACE
      ?auto_1006427 - SURFACE
      ?auto_1006428 - SURFACE
    )
    :vars
    (
      ?auto_1006430 - HOIST
      ?auto_1006434 - PLACE
      ?auto_1006431 - PLACE
      ?auto_1006429 - HOIST
      ?auto_1006435 - SURFACE
      ?auto_1006433 - TRUCK
      ?auto_1006432 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006430 ?auto_1006434 ) ( IS-CRATE ?auto_1006428 ) ( not ( = ?auto_1006427 ?auto_1006428 ) ) ( not ( = ?auto_1006426 ?auto_1006427 ) ) ( not ( = ?auto_1006426 ?auto_1006428 ) ) ( not ( = ?auto_1006431 ?auto_1006434 ) ) ( HOIST-AT ?auto_1006429 ?auto_1006431 ) ( not ( = ?auto_1006430 ?auto_1006429 ) ) ( SURFACE-AT ?auto_1006428 ?auto_1006431 ) ( ON ?auto_1006428 ?auto_1006435 ) ( CLEAR ?auto_1006428 ) ( not ( = ?auto_1006427 ?auto_1006435 ) ) ( not ( = ?auto_1006428 ?auto_1006435 ) ) ( not ( = ?auto_1006426 ?auto_1006435 ) ) ( SURFACE-AT ?auto_1006426 ?auto_1006434 ) ( CLEAR ?auto_1006426 ) ( IS-CRATE ?auto_1006427 ) ( AVAILABLE ?auto_1006430 ) ( TRUCK-AT ?auto_1006433 ?auto_1006431 ) ( AVAILABLE ?auto_1006429 ) ( SURFACE-AT ?auto_1006427 ?auto_1006431 ) ( ON ?auto_1006427 ?auto_1006432 ) ( CLEAR ?auto_1006427 ) ( not ( = ?auto_1006427 ?auto_1006432 ) ) ( not ( = ?auto_1006428 ?auto_1006432 ) ) ( not ( = ?auto_1006426 ?auto_1006432 ) ) ( not ( = ?auto_1006435 ?auto_1006432 ) ) ( ON ?auto_1006422 ?auto_1006421 ) ( ON ?auto_1006423 ?auto_1006422 ) ( ON ?auto_1006424 ?auto_1006423 ) ( ON ?auto_1006425 ?auto_1006424 ) ( ON ?auto_1006426 ?auto_1006425 ) ( not ( = ?auto_1006421 ?auto_1006422 ) ) ( not ( = ?auto_1006421 ?auto_1006423 ) ) ( not ( = ?auto_1006421 ?auto_1006424 ) ) ( not ( = ?auto_1006421 ?auto_1006425 ) ) ( not ( = ?auto_1006421 ?auto_1006426 ) ) ( not ( = ?auto_1006421 ?auto_1006427 ) ) ( not ( = ?auto_1006421 ?auto_1006428 ) ) ( not ( = ?auto_1006421 ?auto_1006435 ) ) ( not ( = ?auto_1006421 ?auto_1006432 ) ) ( not ( = ?auto_1006422 ?auto_1006423 ) ) ( not ( = ?auto_1006422 ?auto_1006424 ) ) ( not ( = ?auto_1006422 ?auto_1006425 ) ) ( not ( = ?auto_1006422 ?auto_1006426 ) ) ( not ( = ?auto_1006422 ?auto_1006427 ) ) ( not ( = ?auto_1006422 ?auto_1006428 ) ) ( not ( = ?auto_1006422 ?auto_1006435 ) ) ( not ( = ?auto_1006422 ?auto_1006432 ) ) ( not ( = ?auto_1006423 ?auto_1006424 ) ) ( not ( = ?auto_1006423 ?auto_1006425 ) ) ( not ( = ?auto_1006423 ?auto_1006426 ) ) ( not ( = ?auto_1006423 ?auto_1006427 ) ) ( not ( = ?auto_1006423 ?auto_1006428 ) ) ( not ( = ?auto_1006423 ?auto_1006435 ) ) ( not ( = ?auto_1006423 ?auto_1006432 ) ) ( not ( = ?auto_1006424 ?auto_1006425 ) ) ( not ( = ?auto_1006424 ?auto_1006426 ) ) ( not ( = ?auto_1006424 ?auto_1006427 ) ) ( not ( = ?auto_1006424 ?auto_1006428 ) ) ( not ( = ?auto_1006424 ?auto_1006435 ) ) ( not ( = ?auto_1006424 ?auto_1006432 ) ) ( not ( = ?auto_1006425 ?auto_1006426 ) ) ( not ( = ?auto_1006425 ?auto_1006427 ) ) ( not ( = ?auto_1006425 ?auto_1006428 ) ) ( not ( = ?auto_1006425 ?auto_1006435 ) ) ( not ( = ?auto_1006425 ?auto_1006432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006426 ?auto_1006427 ?auto_1006428 )
      ( MAKE-7CRATE-VERIFY ?auto_1006421 ?auto_1006422 ?auto_1006423 ?auto_1006424 ?auto_1006425 ?auto_1006426 ?auto_1006427 ?auto_1006428 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1006436 - SURFACE
      ?auto_1006437 - SURFACE
      ?auto_1006438 - SURFACE
      ?auto_1006439 - SURFACE
      ?auto_1006440 - SURFACE
      ?auto_1006441 - SURFACE
      ?auto_1006442 - SURFACE
      ?auto_1006443 - SURFACE
      ?auto_1006444 - SURFACE
    )
    :vars
    (
      ?auto_1006446 - HOIST
      ?auto_1006450 - PLACE
      ?auto_1006447 - PLACE
      ?auto_1006445 - HOIST
      ?auto_1006451 - SURFACE
      ?auto_1006449 - TRUCK
      ?auto_1006448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006446 ?auto_1006450 ) ( IS-CRATE ?auto_1006444 ) ( not ( = ?auto_1006443 ?auto_1006444 ) ) ( not ( = ?auto_1006442 ?auto_1006443 ) ) ( not ( = ?auto_1006442 ?auto_1006444 ) ) ( not ( = ?auto_1006447 ?auto_1006450 ) ) ( HOIST-AT ?auto_1006445 ?auto_1006447 ) ( not ( = ?auto_1006446 ?auto_1006445 ) ) ( SURFACE-AT ?auto_1006444 ?auto_1006447 ) ( ON ?auto_1006444 ?auto_1006451 ) ( CLEAR ?auto_1006444 ) ( not ( = ?auto_1006443 ?auto_1006451 ) ) ( not ( = ?auto_1006444 ?auto_1006451 ) ) ( not ( = ?auto_1006442 ?auto_1006451 ) ) ( SURFACE-AT ?auto_1006442 ?auto_1006450 ) ( CLEAR ?auto_1006442 ) ( IS-CRATE ?auto_1006443 ) ( AVAILABLE ?auto_1006446 ) ( TRUCK-AT ?auto_1006449 ?auto_1006447 ) ( AVAILABLE ?auto_1006445 ) ( SURFACE-AT ?auto_1006443 ?auto_1006447 ) ( ON ?auto_1006443 ?auto_1006448 ) ( CLEAR ?auto_1006443 ) ( not ( = ?auto_1006443 ?auto_1006448 ) ) ( not ( = ?auto_1006444 ?auto_1006448 ) ) ( not ( = ?auto_1006442 ?auto_1006448 ) ) ( not ( = ?auto_1006451 ?auto_1006448 ) ) ( ON ?auto_1006437 ?auto_1006436 ) ( ON ?auto_1006438 ?auto_1006437 ) ( ON ?auto_1006439 ?auto_1006438 ) ( ON ?auto_1006440 ?auto_1006439 ) ( ON ?auto_1006441 ?auto_1006440 ) ( ON ?auto_1006442 ?auto_1006441 ) ( not ( = ?auto_1006436 ?auto_1006437 ) ) ( not ( = ?auto_1006436 ?auto_1006438 ) ) ( not ( = ?auto_1006436 ?auto_1006439 ) ) ( not ( = ?auto_1006436 ?auto_1006440 ) ) ( not ( = ?auto_1006436 ?auto_1006441 ) ) ( not ( = ?auto_1006436 ?auto_1006442 ) ) ( not ( = ?auto_1006436 ?auto_1006443 ) ) ( not ( = ?auto_1006436 ?auto_1006444 ) ) ( not ( = ?auto_1006436 ?auto_1006451 ) ) ( not ( = ?auto_1006436 ?auto_1006448 ) ) ( not ( = ?auto_1006437 ?auto_1006438 ) ) ( not ( = ?auto_1006437 ?auto_1006439 ) ) ( not ( = ?auto_1006437 ?auto_1006440 ) ) ( not ( = ?auto_1006437 ?auto_1006441 ) ) ( not ( = ?auto_1006437 ?auto_1006442 ) ) ( not ( = ?auto_1006437 ?auto_1006443 ) ) ( not ( = ?auto_1006437 ?auto_1006444 ) ) ( not ( = ?auto_1006437 ?auto_1006451 ) ) ( not ( = ?auto_1006437 ?auto_1006448 ) ) ( not ( = ?auto_1006438 ?auto_1006439 ) ) ( not ( = ?auto_1006438 ?auto_1006440 ) ) ( not ( = ?auto_1006438 ?auto_1006441 ) ) ( not ( = ?auto_1006438 ?auto_1006442 ) ) ( not ( = ?auto_1006438 ?auto_1006443 ) ) ( not ( = ?auto_1006438 ?auto_1006444 ) ) ( not ( = ?auto_1006438 ?auto_1006451 ) ) ( not ( = ?auto_1006438 ?auto_1006448 ) ) ( not ( = ?auto_1006439 ?auto_1006440 ) ) ( not ( = ?auto_1006439 ?auto_1006441 ) ) ( not ( = ?auto_1006439 ?auto_1006442 ) ) ( not ( = ?auto_1006439 ?auto_1006443 ) ) ( not ( = ?auto_1006439 ?auto_1006444 ) ) ( not ( = ?auto_1006439 ?auto_1006451 ) ) ( not ( = ?auto_1006439 ?auto_1006448 ) ) ( not ( = ?auto_1006440 ?auto_1006441 ) ) ( not ( = ?auto_1006440 ?auto_1006442 ) ) ( not ( = ?auto_1006440 ?auto_1006443 ) ) ( not ( = ?auto_1006440 ?auto_1006444 ) ) ( not ( = ?auto_1006440 ?auto_1006451 ) ) ( not ( = ?auto_1006440 ?auto_1006448 ) ) ( not ( = ?auto_1006441 ?auto_1006442 ) ) ( not ( = ?auto_1006441 ?auto_1006443 ) ) ( not ( = ?auto_1006441 ?auto_1006444 ) ) ( not ( = ?auto_1006441 ?auto_1006451 ) ) ( not ( = ?auto_1006441 ?auto_1006448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006442 ?auto_1006443 ?auto_1006444 )
      ( MAKE-8CRATE-VERIFY ?auto_1006436 ?auto_1006437 ?auto_1006438 ?auto_1006439 ?auto_1006440 ?auto_1006441 ?auto_1006442 ?auto_1006443 ?auto_1006444 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1006452 - SURFACE
      ?auto_1006453 - SURFACE
      ?auto_1006454 - SURFACE
      ?auto_1006455 - SURFACE
      ?auto_1006456 - SURFACE
      ?auto_1006457 - SURFACE
      ?auto_1006458 - SURFACE
      ?auto_1006459 - SURFACE
      ?auto_1006460 - SURFACE
      ?auto_1006461 - SURFACE
    )
    :vars
    (
      ?auto_1006463 - HOIST
      ?auto_1006467 - PLACE
      ?auto_1006464 - PLACE
      ?auto_1006462 - HOIST
      ?auto_1006468 - SURFACE
      ?auto_1006466 - TRUCK
      ?auto_1006465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006463 ?auto_1006467 ) ( IS-CRATE ?auto_1006461 ) ( not ( = ?auto_1006460 ?auto_1006461 ) ) ( not ( = ?auto_1006459 ?auto_1006460 ) ) ( not ( = ?auto_1006459 ?auto_1006461 ) ) ( not ( = ?auto_1006464 ?auto_1006467 ) ) ( HOIST-AT ?auto_1006462 ?auto_1006464 ) ( not ( = ?auto_1006463 ?auto_1006462 ) ) ( SURFACE-AT ?auto_1006461 ?auto_1006464 ) ( ON ?auto_1006461 ?auto_1006468 ) ( CLEAR ?auto_1006461 ) ( not ( = ?auto_1006460 ?auto_1006468 ) ) ( not ( = ?auto_1006461 ?auto_1006468 ) ) ( not ( = ?auto_1006459 ?auto_1006468 ) ) ( SURFACE-AT ?auto_1006459 ?auto_1006467 ) ( CLEAR ?auto_1006459 ) ( IS-CRATE ?auto_1006460 ) ( AVAILABLE ?auto_1006463 ) ( TRUCK-AT ?auto_1006466 ?auto_1006464 ) ( AVAILABLE ?auto_1006462 ) ( SURFACE-AT ?auto_1006460 ?auto_1006464 ) ( ON ?auto_1006460 ?auto_1006465 ) ( CLEAR ?auto_1006460 ) ( not ( = ?auto_1006460 ?auto_1006465 ) ) ( not ( = ?auto_1006461 ?auto_1006465 ) ) ( not ( = ?auto_1006459 ?auto_1006465 ) ) ( not ( = ?auto_1006468 ?auto_1006465 ) ) ( ON ?auto_1006453 ?auto_1006452 ) ( ON ?auto_1006454 ?auto_1006453 ) ( ON ?auto_1006455 ?auto_1006454 ) ( ON ?auto_1006456 ?auto_1006455 ) ( ON ?auto_1006457 ?auto_1006456 ) ( ON ?auto_1006458 ?auto_1006457 ) ( ON ?auto_1006459 ?auto_1006458 ) ( not ( = ?auto_1006452 ?auto_1006453 ) ) ( not ( = ?auto_1006452 ?auto_1006454 ) ) ( not ( = ?auto_1006452 ?auto_1006455 ) ) ( not ( = ?auto_1006452 ?auto_1006456 ) ) ( not ( = ?auto_1006452 ?auto_1006457 ) ) ( not ( = ?auto_1006452 ?auto_1006458 ) ) ( not ( = ?auto_1006452 ?auto_1006459 ) ) ( not ( = ?auto_1006452 ?auto_1006460 ) ) ( not ( = ?auto_1006452 ?auto_1006461 ) ) ( not ( = ?auto_1006452 ?auto_1006468 ) ) ( not ( = ?auto_1006452 ?auto_1006465 ) ) ( not ( = ?auto_1006453 ?auto_1006454 ) ) ( not ( = ?auto_1006453 ?auto_1006455 ) ) ( not ( = ?auto_1006453 ?auto_1006456 ) ) ( not ( = ?auto_1006453 ?auto_1006457 ) ) ( not ( = ?auto_1006453 ?auto_1006458 ) ) ( not ( = ?auto_1006453 ?auto_1006459 ) ) ( not ( = ?auto_1006453 ?auto_1006460 ) ) ( not ( = ?auto_1006453 ?auto_1006461 ) ) ( not ( = ?auto_1006453 ?auto_1006468 ) ) ( not ( = ?auto_1006453 ?auto_1006465 ) ) ( not ( = ?auto_1006454 ?auto_1006455 ) ) ( not ( = ?auto_1006454 ?auto_1006456 ) ) ( not ( = ?auto_1006454 ?auto_1006457 ) ) ( not ( = ?auto_1006454 ?auto_1006458 ) ) ( not ( = ?auto_1006454 ?auto_1006459 ) ) ( not ( = ?auto_1006454 ?auto_1006460 ) ) ( not ( = ?auto_1006454 ?auto_1006461 ) ) ( not ( = ?auto_1006454 ?auto_1006468 ) ) ( not ( = ?auto_1006454 ?auto_1006465 ) ) ( not ( = ?auto_1006455 ?auto_1006456 ) ) ( not ( = ?auto_1006455 ?auto_1006457 ) ) ( not ( = ?auto_1006455 ?auto_1006458 ) ) ( not ( = ?auto_1006455 ?auto_1006459 ) ) ( not ( = ?auto_1006455 ?auto_1006460 ) ) ( not ( = ?auto_1006455 ?auto_1006461 ) ) ( not ( = ?auto_1006455 ?auto_1006468 ) ) ( not ( = ?auto_1006455 ?auto_1006465 ) ) ( not ( = ?auto_1006456 ?auto_1006457 ) ) ( not ( = ?auto_1006456 ?auto_1006458 ) ) ( not ( = ?auto_1006456 ?auto_1006459 ) ) ( not ( = ?auto_1006456 ?auto_1006460 ) ) ( not ( = ?auto_1006456 ?auto_1006461 ) ) ( not ( = ?auto_1006456 ?auto_1006468 ) ) ( not ( = ?auto_1006456 ?auto_1006465 ) ) ( not ( = ?auto_1006457 ?auto_1006458 ) ) ( not ( = ?auto_1006457 ?auto_1006459 ) ) ( not ( = ?auto_1006457 ?auto_1006460 ) ) ( not ( = ?auto_1006457 ?auto_1006461 ) ) ( not ( = ?auto_1006457 ?auto_1006468 ) ) ( not ( = ?auto_1006457 ?auto_1006465 ) ) ( not ( = ?auto_1006458 ?auto_1006459 ) ) ( not ( = ?auto_1006458 ?auto_1006460 ) ) ( not ( = ?auto_1006458 ?auto_1006461 ) ) ( not ( = ?auto_1006458 ?auto_1006468 ) ) ( not ( = ?auto_1006458 ?auto_1006465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006459 ?auto_1006460 ?auto_1006461 )
      ( MAKE-9CRATE-VERIFY ?auto_1006452 ?auto_1006453 ?auto_1006454 ?auto_1006455 ?auto_1006456 ?auto_1006457 ?auto_1006458 ?auto_1006459 ?auto_1006460 ?auto_1006461 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1006469 - SURFACE
      ?auto_1006470 - SURFACE
      ?auto_1006471 - SURFACE
      ?auto_1006472 - SURFACE
      ?auto_1006473 - SURFACE
      ?auto_1006474 - SURFACE
      ?auto_1006475 - SURFACE
      ?auto_1006476 - SURFACE
      ?auto_1006477 - SURFACE
      ?auto_1006478 - SURFACE
      ?auto_1006479 - SURFACE
    )
    :vars
    (
      ?auto_1006481 - HOIST
      ?auto_1006485 - PLACE
      ?auto_1006482 - PLACE
      ?auto_1006480 - HOIST
      ?auto_1006486 - SURFACE
      ?auto_1006484 - TRUCK
      ?auto_1006483 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006481 ?auto_1006485 ) ( IS-CRATE ?auto_1006479 ) ( not ( = ?auto_1006478 ?auto_1006479 ) ) ( not ( = ?auto_1006477 ?auto_1006478 ) ) ( not ( = ?auto_1006477 ?auto_1006479 ) ) ( not ( = ?auto_1006482 ?auto_1006485 ) ) ( HOIST-AT ?auto_1006480 ?auto_1006482 ) ( not ( = ?auto_1006481 ?auto_1006480 ) ) ( SURFACE-AT ?auto_1006479 ?auto_1006482 ) ( ON ?auto_1006479 ?auto_1006486 ) ( CLEAR ?auto_1006479 ) ( not ( = ?auto_1006478 ?auto_1006486 ) ) ( not ( = ?auto_1006479 ?auto_1006486 ) ) ( not ( = ?auto_1006477 ?auto_1006486 ) ) ( SURFACE-AT ?auto_1006477 ?auto_1006485 ) ( CLEAR ?auto_1006477 ) ( IS-CRATE ?auto_1006478 ) ( AVAILABLE ?auto_1006481 ) ( TRUCK-AT ?auto_1006484 ?auto_1006482 ) ( AVAILABLE ?auto_1006480 ) ( SURFACE-AT ?auto_1006478 ?auto_1006482 ) ( ON ?auto_1006478 ?auto_1006483 ) ( CLEAR ?auto_1006478 ) ( not ( = ?auto_1006478 ?auto_1006483 ) ) ( not ( = ?auto_1006479 ?auto_1006483 ) ) ( not ( = ?auto_1006477 ?auto_1006483 ) ) ( not ( = ?auto_1006486 ?auto_1006483 ) ) ( ON ?auto_1006470 ?auto_1006469 ) ( ON ?auto_1006471 ?auto_1006470 ) ( ON ?auto_1006472 ?auto_1006471 ) ( ON ?auto_1006473 ?auto_1006472 ) ( ON ?auto_1006474 ?auto_1006473 ) ( ON ?auto_1006475 ?auto_1006474 ) ( ON ?auto_1006476 ?auto_1006475 ) ( ON ?auto_1006477 ?auto_1006476 ) ( not ( = ?auto_1006469 ?auto_1006470 ) ) ( not ( = ?auto_1006469 ?auto_1006471 ) ) ( not ( = ?auto_1006469 ?auto_1006472 ) ) ( not ( = ?auto_1006469 ?auto_1006473 ) ) ( not ( = ?auto_1006469 ?auto_1006474 ) ) ( not ( = ?auto_1006469 ?auto_1006475 ) ) ( not ( = ?auto_1006469 ?auto_1006476 ) ) ( not ( = ?auto_1006469 ?auto_1006477 ) ) ( not ( = ?auto_1006469 ?auto_1006478 ) ) ( not ( = ?auto_1006469 ?auto_1006479 ) ) ( not ( = ?auto_1006469 ?auto_1006486 ) ) ( not ( = ?auto_1006469 ?auto_1006483 ) ) ( not ( = ?auto_1006470 ?auto_1006471 ) ) ( not ( = ?auto_1006470 ?auto_1006472 ) ) ( not ( = ?auto_1006470 ?auto_1006473 ) ) ( not ( = ?auto_1006470 ?auto_1006474 ) ) ( not ( = ?auto_1006470 ?auto_1006475 ) ) ( not ( = ?auto_1006470 ?auto_1006476 ) ) ( not ( = ?auto_1006470 ?auto_1006477 ) ) ( not ( = ?auto_1006470 ?auto_1006478 ) ) ( not ( = ?auto_1006470 ?auto_1006479 ) ) ( not ( = ?auto_1006470 ?auto_1006486 ) ) ( not ( = ?auto_1006470 ?auto_1006483 ) ) ( not ( = ?auto_1006471 ?auto_1006472 ) ) ( not ( = ?auto_1006471 ?auto_1006473 ) ) ( not ( = ?auto_1006471 ?auto_1006474 ) ) ( not ( = ?auto_1006471 ?auto_1006475 ) ) ( not ( = ?auto_1006471 ?auto_1006476 ) ) ( not ( = ?auto_1006471 ?auto_1006477 ) ) ( not ( = ?auto_1006471 ?auto_1006478 ) ) ( not ( = ?auto_1006471 ?auto_1006479 ) ) ( not ( = ?auto_1006471 ?auto_1006486 ) ) ( not ( = ?auto_1006471 ?auto_1006483 ) ) ( not ( = ?auto_1006472 ?auto_1006473 ) ) ( not ( = ?auto_1006472 ?auto_1006474 ) ) ( not ( = ?auto_1006472 ?auto_1006475 ) ) ( not ( = ?auto_1006472 ?auto_1006476 ) ) ( not ( = ?auto_1006472 ?auto_1006477 ) ) ( not ( = ?auto_1006472 ?auto_1006478 ) ) ( not ( = ?auto_1006472 ?auto_1006479 ) ) ( not ( = ?auto_1006472 ?auto_1006486 ) ) ( not ( = ?auto_1006472 ?auto_1006483 ) ) ( not ( = ?auto_1006473 ?auto_1006474 ) ) ( not ( = ?auto_1006473 ?auto_1006475 ) ) ( not ( = ?auto_1006473 ?auto_1006476 ) ) ( not ( = ?auto_1006473 ?auto_1006477 ) ) ( not ( = ?auto_1006473 ?auto_1006478 ) ) ( not ( = ?auto_1006473 ?auto_1006479 ) ) ( not ( = ?auto_1006473 ?auto_1006486 ) ) ( not ( = ?auto_1006473 ?auto_1006483 ) ) ( not ( = ?auto_1006474 ?auto_1006475 ) ) ( not ( = ?auto_1006474 ?auto_1006476 ) ) ( not ( = ?auto_1006474 ?auto_1006477 ) ) ( not ( = ?auto_1006474 ?auto_1006478 ) ) ( not ( = ?auto_1006474 ?auto_1006479 ) ) ( not ( = ?auto_1006474 ?auto_1006486 ) ) ( not ( = ?auto_1006474 ?auto_1006483 ) ) ( not ( = ?auto_1006475 ?auto_1006476 ) ) ( not ( = ?auto_1006475 ?auto_1006477 ) ) ( not ( = ?auto_1006475 ?auto_1006478 ) ) ( not ( = ?auto_1006475 ?auto_1006479 ) ) ( not ( = ?auto_1006475 ?auto_1006486 ) ) ( not ( = ?auto_1006475 ?auto_1006483 ) ) ( not ( = ?auto_1006476 ?auto_1006477 ) ) ( not ( = ?auto_1006476 ?auto_1006478 ) ) ( not ( = ?auto_1006476 ?auto_1006479 ) ) ( not ( = ?auto_1006476 ?auto_1006486 ) ) ( not ( = ?auto_1006476 ?auto_1006483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006477 ?auto_1006478 ?auto_1006479 )
      ( MAKE-10CRATE-VERIFY ?auto_1006469 ?auto_1006470 ?auto_1006471 ?auto_1006472 ?auto_1006473 ?auto_1006474 ?auto_1006475 ?auto_1006476 ?auto_1006477 ?auto_1006478 ?auto_1006479 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006487 - SURFACE
      ?auto_1006488 - SURFACE
      ?auto_1006489 - SURFACE
      ?auto_1006490 - SURFACE
      ?auto_1006491 - SURFACE
      ?auto_1006492 - SURFACE
      ?auto_1006493 - SURFACE
      ?auto_1006494 - SURFACE
      ?auto_1006495 - SURFACE
      ?auto_1006496 - SURFACE
      ?auto_1006497 - SURFACE
      ?auto_1006498 - SURFACE
    )
    :vars
    (
      ?auto_1006500 - HOIST
      ?auto_1006504 - PLACE
      ?auto_1006501 - PLACE
      ?auto_1006499 - HOIST
      ?auto_1006505 - SURFACE
      ?auto_1006503 - TRUCK
      ?auto_1006502 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006500 ?auto_1006504 ) ( IS-CRATE ?auto_1006498 ) ( not ( = ?auto_1006497 ?auto_1006498 ) ) ( not ( = ?auto_1006496 ?auto_1006497 ) ) ( not ( = ?auto_1006496 ?auto_1006498 ) ) ( not ( = ?auto_1006501 ?auto_1006504 ) ) ( HOIST-AT ?auto_1006499 ?auto_1006501 ) ( not ( = ?auto_1006500 ?auto_1006499 ) ) ( SURFACE-AT ?auto_1006498 ?auto_1006501 ) ( ON ?auto_1006498 ?auto_1006505 ) ( CLEAR ?auto_1006498 ) ( not ( = ?auto_1006497 ?auto_1006505 ) ) ( not ( = ?auto_1006498 ?auto_1006505 ) ) ( not ( = ?auto_1006496 ?auto_1006505 ) ) ( SURFACE-AT ?auto_1006496 ?auto_1006504 ) ( CLEAR ?auto_1006496 ) ( IS-CRATE ?auto_1006497 ) ( AVAILABLE ?auto_1006500 ) ( TRUCK-AT ?auto_1006503 ?auto_1006501 ) ( AVAILABLE ?auto_1006499 ) ( SURFACE-AT ?auto_1006497 ?auto_1006501 ) ( ON ?auto_1006497 ?auto_1006502 ) ( CLEAR ?auto_1006497 ) ( not ( = ?auto_1006497 ?auto_1006502 ) ) ( not ( = ?auto_1006498 ?auto_1006502 ) ) ( not ( = ?auto_1006496 ?auto_1006502 ) ) ( not ( = ?auto_1006505 ?auto_1006502 ) ) ( ON ?auto_1006488 ?auto_1006487 ) ( ON ?auto_1006489 ?auto_1006488 ) ( ON ?auto_1006490 ?auto_1006489 ) ( ON ?auto_1006491 ?auto_1006490 ) ( ON ?auto_1006492 ?auto_1006491 ) ( ON ?auto_1006493 ?auto_1006492 ) ( ON ?auto_1006494 ?auto_1006493 ) ( ON ?auto_1006495 ?auto_1006494 ) ( ON ?auto_1006496 ?auto_1006495 ) ( not ( = ?auto_1006487 ?auto_1006488 ) ) ( not ( = ?auto_1006487 ?auto_1006489 ) ) ( not ( = ?auto_1006487 ?auto_1006490 ) ) ( not ( = ?auto_1006487 ?auto_1006491 ) ) ( not ( = ?auto_1006487 ?auto_1006492 ) ) ( not ( = ?auto_1006487 ?auto_1006493 ) ) ( not ( = ?auto_1006487 ?auto_1006494 ) ) ( not ( = ?auto_1006487 ?auto_1006495 ) ) ( not ( = ?auto_1006487 ?auto_1006496 ) ) ( not ( = ?auto_1006487 ?auto_1006497 ) ) ( not ( = ?auto_1006487 ?auto_1006498 ) ) ( not ( = ?auto_1006487 ?auto_1006505 ) ) ( not ( = ?auto_1006487 ?auto_1006502 ) ) ( not ( = ?auto_1006488 ?auto_1006489 ) ) ( not ( = ?auto_1006488 ?auto_1006490 ) ) ( not ( = ?auto_1006488 ?auto_1006491 ) ) ( not ( = ?auto_1006488 ?auto_1006492 ) ) ( not ( = ?auto_1006488 ?auto_1006493 ) ) ( not ( = ?auto_1006488 ?auto_1006494 ) ) ( not ( = ?auto_1006488 ?auto_1006495 ) ) ( not ( = ?auto_1006488 ?auto_1006496 ) ) ( not ( = ?auto_1006488 ?auto_1006497 ) ) ( not ( = ?auto_1006488 ?auto_1006498 ) ) ( not ( = ?auto_1006488 ?auto_1006505 ) ) ( not ( = ?auto_1006488 ?auto_1006502 ) ) ( not ( = ?auto_1006489 ?auto_1006490 ) ) ( not ( = ?auto_1006489 ?auto_1006491 ) ) ( not ( = ?auto_1006489 ?auto_1006492 ) ) ( not ( = ?auto_1006489 ?auto_1006493 ) ) ( not ( = ?auto_1006489 ?auto_1006494 ) ) ( not ( = ?auto_1006489 ?auto_1006495 ) ) ( not ( = ?auto_1006489 ?auto_1006496 ) ) ( not ( = ?auto_1006489 ?auto_1006497 ) ) ( not ( = ?auto_1006489 ?auto_1006498 ) ) ( not ( = ?auto_1006489 ?auto_1006505 ) ) ( not ( = ?auto_1006489 ?auto_1006502 ) ) ( not ( = ?auto_1006490 ?auto_1006491 ) ) ( not ( = ?auto_1006490 ?auto_1006492 ) ) ( not ( = ?auto_1006490 ?auto_1006493 ) ) ( not ( = ?auto_1006490 ?auto_1006494 ) ) ( not ( = ?auto_1006490 ?auto_1006495 ) ) ( not ( = ?auto_1006490 ?auto_1006496 ) ) ( not ( = ?auto_1006490 ?auto_1006497 ) ) ( not ( = ?auto_1006490 ?auto_1006498 ) ) ( not ( = ?auto_1006490 ?auto_1006505 ) ) ( not ( = ?auto_1006490 ?auto_1006502 ) ) ( not ( = ?auto_1006491 ?auto_1006492 ) ) ( not ( = ?auto_1006491 ?auto_1006493 ) ) ( not ( = ?auto_1006491 ?auto_1006494 ) ) ( not ( = ?auto_1006491 ?auto_1006495 ) ) ( not ( = ?auto_1006491 ?auto_1006496 ) ) ( not ( = ?auto_1006491 ?auto_1006497 ) ) ( not ( = ?auto_1006491 ?auto_1006498 ) ) ( not ( = ?auto_1006491 ?auto_1006505 ) ) ( not ( = ?auto_1006491 ?auto_1006502 ) ) ( not ( = ?auto_1006492 ?auto_1006493 ) ) ( not ( = ?auto_1006492 ?auto_1006494 ) ) ( not ( = ?auto_1006492 ?auto_1006495 ) ) ( not ( = ?auto_1006492 ?auto_1006496 ) ) ( not ( = ?auto_1006492 ?auto_1006497 ) ) ( not ( = ?auto_1006492 ?auto_1006498 ) ) ( not ( = ?auto_1006492 ?auto_1006505 ) ) ( not ( = ?auto_1006492 ?auto_1006502 ) ) ( not ( = ?auto_1006493 ?auto_1006494 ) ) ( not ( = ?auto_1006493 ?auto_1006495 ) ) ( not ( = ?auto_1006493 ?auto_1006496 ) ) ( not ( = ?auto_1006493 ?auto_1006497 ) ) ( not ( = ?auto_1006493 ?auto_1006498 ) ) ( not ( = ?auto_1006493 ?auto_1006505 ) ) ( not ( = ?auto_1006493 ?auto_1006502 ) ) ( not ( = ?auto_1006494 ?auto_1006495 ) ) ( not ( = ?auto_1006494 ?auto_1006496 ) ) ( not ( = ?auto_1006494 ?auto_1006497 ) ) ( not ( = ?auto_1006494 ?auto_1006498 ) ) ( not ( = ?auto_1006494 ?auto_1006505 ) ) ( not ( = ?auto_1006494 ?auto_1006502 ) ) ( not ( = ?auto_1006495 ?auto_1006496 ) ) ( not ( = ?auto_1006495 ?auto_1006497 ) ) ( not ( = ?auto_1006495 ?auto_1006498 ) ) ( not ( = ?auto_1006495 ?auto_1006505 ) ) ( not ( = ?auto_1006495 ?auto_1006502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006496 ?auto_1006497 ?auto_1006498 )
      ( MAKE-11CRATE-VERIFY ?auto_1006487 ?auto_1006488 ?auto_1006489 ?auto_1006490 ?auto_1006491 ?auto_1006492 ?auto_1006493 ?auto_1006494 ?auto_1006495 ?auto_1006496 ?auto_1006497 ?auto_1006498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1006506 - SURFACE
      ?auto_1006507 - SURFACE
    )
    :vars
    (
      ?auto_1006509 - HOIST
      ?auto_1006513 - PLACE
      ?auto_1006515 - SURFACE
      ?auto_1006510 - PLACE
      ?auto_1006508 - HOIST
      ?auto_1006514 - SURFACE
      ?auto_1006511 - SURFACE
      ?auto_1006512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006509 ?auto_1006513 ) ( IS-CRATE ?auto_1006507 ) ( not ( = ?auto_1006506 ?auto_1006507 ) ) ( not ( = ?auto_1006515 ?auto_1006506 ) ) ( not ( = ?auto_1006515 ?auto_1006507 ) ) ( not ( = ?auto_1006510 ?auto_1006513 ) ) ( HOIST-AT ?auto_1006508 ?auto_1006510 ) ( not ( = ?auto_1006509 ?auto_1006508 ) ) ( SURFACE-AT ?auto_1006507 ?auto_1006510 ) ( ON ?auto_1006507 ?auto_1006514 ) ( CLEAR ?auto_1006507 ) ( not ( = ?auto_1006506 ?auto_1006514 ) ) ( not ( = ?auto_1006507 ?auto_1006514 ) ) ( not ( = ?auto_1006515 ?auto_1006514 ) ) ( SURFACE-AT ?auto_1006515 ?auto_1006513 ) ( CLEAR ?auto_1006515 ) ( IS-CRATE ?auto_1006506 ) ( AVAILABLE ?auto_1006509 ) ( AVAILABLE ?auto_1006508 ) ( SURFACE-AT ?auto_1006506 ?auto_1006510 ) ( ON ?auto_1006506 ?auto_1006511 ) ( CLEAR ?auto_1006506 ) ( not ( = ?auto_1006506 ?auto_1006511 ) ) ( not ( = ?auto_1006507 ?auto_1006511 ) ) ( not ( = ?auto_1006515 ?auto_1006511 ) ) ( not ( = ?auto_1006514 ?auto_1006511 ) ) ( TRUCK-AT ?auto_1006512 ?auto_1006513 ) )
    :subtasks
    ( ( !DRIVE ?auto_1006512 ?auto_1006513 ?auto_1006510 )
      ( MAKE-2CRATE ?auto_1006515 ?auto_1006506 ?auto_1006507 )
      ( MAKE-1CRATE-VERIFY ?auto_1006506 ?auto_1006507 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1006516 - SURFACE
      ?auto_1006517 - SURFACE
      ?auto_1006518 - SURFACE
    )
    :vars
    (
      ?auto_1006523 - HOIST
      ?auto_1006522 - PLACE
      ?auto_1006521 - PLACE
      ?auto_1006525 - HOIST
      ?auto_1006524 - SURFACE
      ?auto_1006520 - SURFACE
      ?auto_1006519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006523 ?auto_1006522 ) ( IS-CRATE ?auto_1006518 ) ( not ( = ?auto_1006517 ?auto_1006518 ) ) ( not ( = ?auto_1006516 ?auto_1006517 ) ) ( not ( = ?auto_1006516 ?auto_1006518 ) ) ( not ( = ?auto_1006521 ?auto_1006522 ) ) ( HOIST-AT ?auto_1006525 ?auto_1006521 ) ( not ( = ?auto_1006523 ?auto_1006525 ) ) ( SURFACE-AT ?auto_1006518 ?auto_1006521 ) ( ON ?auto_1006518 ?auto_1006524 ) ( CLEAR ?auto_1006518 ) ( not ( = ?auto_1006517 ?auto_1006524 ) ) ( not ( = ?auto_1006518 ?auto_1006524 ) ) ( not ( = ?auto_1006516 ?auto_1006524 ) ) ( SURFACE-AT ?auto_1006516 ?auto_1006522 ) ( CLEAR ?auto_1006516 ) ( IS-CRATE ?auto_1006517 ) ( AVAILABLE ?auto_1006523 ) ( AVAILABLE ?auto_1006525 ) ( SURFACE-AT ?auto_1006517 ?auto_1006521 ) ( ON ?auto_1006517 ?auto_1006520 ) ( CLEAR ?auto_1006517 ) ( not ( = ?auto_1006517 ?auto_1006520 ) ) ( not ( = ?auto_1006518 ?auto_1006520 ) ) ( not ( = ?auto_1006516 ?auto_1006520 ) ) ( not ( = ?auto_1006524 ?auto_1006520 ) ) ( TRUCK-AT ?auto_1006519 ?auto_1006522 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1006517 ?auto_1006518 )
      ( MAKE-2CRATE-VERIFY ?auto_1006516 ?auto_1006517 ?auto_1006518 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1006526 - SURFACE
      ?auto_1006527 - SURFACE
      ?auto_1006528 - SURFACE
      ?auto_1006529 - SURFACE
    )
    :vars
    (
      ?auto_1006531 - HOIST
      ?auto_1006536 - PLACE
      ?auto_1006534 - PLACE
      ?auto_1006530 - HOIST
      ?auto_1006533 - SURFACE
      ?auto_1006535 - SURFACE
      ?auto_1006532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006531 ?auto_1006536 ) ( IS-CRATE ?auto_1006529 ) ( not ( = ?auto_1006528 ?auto_1006529 ) ) ( not ( = ?auto_1006527 ?auto_1006528 ) ) ( not ( = ?auto_1006527 ?auto_1006529 ) ) ( not ( = ?auto_1006534 ?auto_1006536 ) ) ( HOIST-AT ?auto_1006530 ?auto_1006534 ) ( not ( = ?auto_1006531 ?auto_1006530 ) ) ( SURFACE-AT ?auto_1006529 ?auto_1006534 ) ( ON ?auto_1006529 ?auto_1006533 ) ( CLEAR ?auto_1006529 ) ( not ( = ?auto_1006528 ?auto_1006533 ) ) ( not ( = ?auto_1006529 ?auto_1006533 ) ) ( not ( = ?auto_1006527 ?auto_1006533 ) ) ( SURFACE-AT ?auto_1006527 ?auto_1006536 ) ( CLEAR ?auto_1006527 ) ( IS-CRATE ?auto_1006528 ) ( AVAILABLE ?auto_1006531 ) ( AVAILABLE ?auto_1006530 ) ( SURFACE-AT ?auto_1006528 ?auto_1006534 ) ( ON ?auto_1006528 ?auto_1006535 ) ( CLEAR ?auto_1006528 ) ( not ( = ?auto_1006528 ?auto_1006535 ) ) ( not ( = ?auto_1006529 ?auto_1006535 ) ) ( not ( = ?auto_1006527 ?auto_1006535 ) ) ( not ( = ?auto_1006533 ?auto_1006535 ) ) ( TRUCK-AT ?auto_1006532 ?auto_1006536 ) ( ON ?auto_1006527 ?auto_1006526 ) ( not ( = ?auto_1006526 ?auto_1006527 ) ) ( not ( = ?auto_1006526 ?auto_1006528 ) ) ( not ( = ?auto_1006526 ?auto_1006529 ) ) ( not ( = ?auto_1006526 ?auto_1006533 ) ) ( not ( = ?auto_1006526 ?auto_1006535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006527 ?auto_1006528 ?auto_1006529 )
      ( MAKE-3CRATE-VERIFY ?auto_1006526 ?auto_1006527 ?auto_1006528 ?auto_1006529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1006537 - SURFACE
      ?auto_1006538 - SURFACE
      ?auto_1006539 - SURFACE
      ?auto_1006540 - SURFACE
      ?auto_1006541 - SURFACE
    )
    :vars
    (
      ?auto_1006543 - HOIST
      ?auto_1006548 - PLACE
      ?auto_1006546 - PLACE
      ?auto_1006542 - HOIST
      ?auto_1006545 - SURFACE
      ?auto_1006547 - SURFACE
      ?auto_1006544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006543 ?auto_1006548 ) ( IS-CRATE ?auto_1006541 ) ( not ( = ?auto_1006540 ?auto_1006541 ) ) ( not ( = ?auto_1006539 ?auto_1006540 ) ) ( not ( = ?auto_1006539 ?auto_1006541 ) ) ( not ( = ?auto_1006546 ?auto_1006548 ) ) ( HOIST-AT ?auto_1006542 ?auto_1006546 ) ( not ( = ?auto_1006543 ?auto_1006542 ) ) ( SURFACE-AT ?auto_1006541 ?auto_1006546 ) ( ON ?auto_1006541 ?auto_1006545 ) ( CLEAR ?auto_1006541 ) ( not ( = ?auto_1006540 ?auto_1006545 ) ) ( not ( = ?auto_1006541 ?auto_1006545 ) ) ( not ( = ?auto_1006539 ?auto_1006545 ) ) ( SURFACE-AT ?auto_1006539 ?auto_1006548 ) ( CLEAR ?auto_1006539 ) ( IS-CRATE ?auto_1006540 ) ( AVAILABLE ?auto_1006543 ) ( AVAILABLE ?auto_1006542 ) ( SURFACE-AT ?auto_1006540 ?auto_1006546 ) ( ON ?auto_1006540 ?auto_1006547 ) ( CLEAR ?auto_1006540 ) ( not ( = ?auto_1006540 ?auto_1006547 ) ) ( not ( = ?auto_1006541 ?auto_1006547 ) ) ( not ( = ?auto_1006539 ?auto_1006547 ) ) ( not ( = ?auto_1006545 ?auto_1006547 ) ) ( TRUCK-AT ?auto_1006544 ?auto_1006548 ) ( ON ?auto_1006538 ?auto_1006537 ) ( ON ?auto_1006539 ?auto_1006538 ) ( not ( = ?auto_1006537 ?auto_1006538 ) ) ( not ( = ?auto_1006537 ?auto_1006539 ) ) ( not ( = ?auto_1006537 ?auto_1006540 ) ) ( not ( = ?auto_1006537 ?auto_1006541 ) ) ( not ( = ?auto_1006537 ?auto_1006545 ) ) ( not ( = ?auto_1006537 ?auto_1006547 ) ) ( not ( = ?auto_1006538 ?auto_1006539 ) ) ( not ( = ?auto_1006538 ?auto_1006540 ) ) ( not ( = ?auto_1006538 ?auto_1006541 ) ) ( not ( = ?auto_1006538 ?auto_1006545 ) ) ( not ( = ?auto_1006538 ?auto_1006547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006539 ?auto_1006540 ?auto_1006541 )
      ( MAKE-4CRATE-VERIFY ?auto_1006537 ?auto_1006538 ?auto_1006539 ?auto_1006540 ?auto_1006541 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1006549 - SURFACE
      ?auto_1006550 - SURFACE
      ?auto_1006551 - SURFACE
      ?auto_1006552 - SURFACE
      ?auto_1006553 - SURFACE
      ?auto_1006554 - SURFACE
    )
    :vars
    (
      ?auto_1006556 - HOIST
      ?auto_1006561 - PLACE
      ?auto_1006559 - PLACE
      ?auto_1006555 - HOIST
      ?auto_1006558 - SURFACE
      ?auto_1006560 - SURFACE
      ?auto_1006557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006556 ?auto_1006561 ) ( IS-CRATE ?auto_1006554 ) ( not ( = ?auto_1006553 ?auto_1006554 ) ) ( not ( = ?auto_1006552 ?auto_1006553 ) ) ( not ( = ?auto_1006552 ?auto_1006554 ) ) ( not ( = ?auto_1006559 ?auto_1006561 ) ) ( HOIST-AT ?auto_1006555 ?auto_1006559 ) ( not ( = ?auto_1006556 ?auto_1006555 ) ) ( SURFACE-AT ?auto_1006554 ?auto_1006559 ) ( ON ?auto_1006554 ?auto_1006558 ) ( CLEAR ?auto_1006554 ) ( not ( = ?auto_1006553 ?auto_1006558 ) ) ( not ( = ?auto_1006554 ?auto_1006558 ) ) ( not ( = ?auto_1006552 ?auto_1006558 ) ) ( SURFACE-AT ?auto_1006552 ?auto_1006561 ) ( CLEAR ?auto_1006552 ) ( IS-CRATE ?auto_1006553 ) ( AVAILABLE ?auto_1006556 ) ( AVAILABLE ?auto_1006555 ) ( SURFACE-AT ?auto_1006553 ?auto_1006559 ) ( ON ?auto_1006553 ?auto_1006560 ) ( CLEAR ?auto_1006553 ) ( not ( = ?auto_1006553 ?auto_1006560 ) ) ( not ( = ?auto_1006554 ?auto_1006560 ) ) ( not ( = ?auto_1006552 ?auto_1006560 ) ) ( not ( = ?auto_1006558 ?auto_1006560 ) ) ( TRUCK-AT ?auto_1006557 ?auto_1006561 ) ( ON ?auto_1006550 ?auto_1006549 ) ( ON ?auto_1006551 ?auto_1006550 ) ( ON ?auto_1006552 ?auto_1006551 ) ( not ( = ?auto_1006549 ?auto_1006550 ) ) ( not ( = ?auto_1006549 ?auto_1006551 ) ) ( not ( = ?auto_1006549 ?auto_1006552 ) ) ( not ( = ?auto_1006549 ?auto_1006553 ) ) ( not ( = ?auto_1006549 ?auto_1006554 ) ) ( not ( = ?auto_1006549 ?auto_1006558 ) ) ( not ( = ?auto_1006549 ?auto_1006560 ) ) ( not ( = ?auto_1006550 ?auto_1006551 ) ) ( not ( = ?auto_1006550 ?auto_1006552 ) ) ( not ( = ?auto_1006550 ?auto_1006553 ) ) ( not ( = ?auto_1006550 ?auto_1006554 ) ) ( not ( = ?auto_1006550 ?auto_1006558 ) ) ( not ( = ?auto_1006550 ?auto_1006560 ) ) ( not ( = ?auto_1006551 ?auto_1006552 ) ) ( not ( = ?auto_1006551 ?auto_1006553 ) ) ( not ( = ?auto_1006551 ?auto_1006554 ) ) ( not ( = ?auto_1006551 ?auto_1006558 ) ) ( not ( = ?auto_1006551 ?auto_1006560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006552 ?auto_1006553 ?auto_1006554 )
      ( MAKE-5CRATE-VERIFY ?auto_1006549 ?auto_1006550 ?auto_1006551 ?auto_1006552 ?auto_1006553 ?auto_1006554 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1006562 - SURFACE
      ?auto_1006563 - SURFACE
      ?auto_1006564 - SURFACE
      ?auto_1006565 - SURFACE
      ?auto_1006566 - SURFACE
      ?auto_1006567 - SURFACE
      ?auto_1006568 - SURFACE
    )
    :vars
    (
      ?auto_1006570 - HOIST
      ?auto_1006575 - PLACE
      ?auto_1006573 - PLACE
      ?auto_1006569 - HOIST
      ?auto_1006572 - SURFACE
      ?auto_1006574 - SURFACE
      ?auto_1006571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006570 ?auto_1006575 ) ( IS-CRATE ?auto_1006568 ) ( not ( = ?auto_1006567 ?auto_1006568 ) ) ( not ( = ?auto_1006566 ?auto_1006567 ) ) ( not ( = ?auto_1006566 ?auto_1006568 ) ) ( not ( = ?auto_1006573 ?auto_1006575 ) ) ( HOIST-AT ?auto_1006569 ?auto_1006573 ) ( not ( = ?auto_1006570 ?auto_1006569 ) ) ( SURFACE-AT ?auto_1006568 ?auto_1006573 ) ( ON ?auto_1006568 ?auto_1006572 ) ( CLEAR ?auto_1006568 ) ( not ( = ?auto_1006567 ?auto_1006572 ) ) ( not ( = ?auto_1006568 ?auto_1006572 ) ) ( not ( = ?auto_1006566 ?auto_1006572 ) ) ( SURFACE-AT ?auto_1006566 ?auto_1006575 ) ( CLEAR ?auto_1006566 ) ( IS-CRATE ?auto_1006567 ) ( AVAILABLE ?auto_1006570 ) ( AVAILABLE ?auto_1006569 ) ( SURFACE-AT ?auto_1006567 ?auto_1006573 ) ( ON ?auto_1006567 ?auto_1006574 ) ( CLEAR ?auto_1006567 ) ( not ( = ?auto_1006567 ?auto_1006574 ) ) ( not ( = ?auto_1006568 ?auto_1006574 ) ) ( not ( = ?auto_1006566 ?auto_1006574 ) ) ( not ( = ?auto_1006572 ?auto_1006574 ) ) ( TRUCK-AT ?auto_1006571 ?auto_1006575 ) ( ON ?auto_1006563 ?auto_1006562 ) ( ON ?auto_1006564 ?auto_1006563 ) ( ON ?auto_1006565 ?auto_1006564 ) ( ON ?auto_1006566 ?auto_1006565 ) ( not ( = ?auto_1006562 ?auto_1006563 ) ) ( not ( = ?auto_1006562 ?auto_1006564 ) ) ( not ( = ?auto_1006562 ?auto_1006565 ) ) ( not ( = ?auto_1006562 ?auto_1006566 ) ) ( not ( = ?auto_1006562 ?auto_1006567 ) ) ( not ( = ?auto_1006562 ?auto_1006568 ) ) ( not ( = ?auto_1006562 ?auto_1006572 ) ) ( not ( = ?auto_1006562 ?auto_1006574 ) ) ( not ( = ?auto_1006563 ?auto_1006564 ) ) ( not ( = ?auto_1006563 ?auto_1006565 ) ) ( not ( = ?auto_1006563 ?auto_1006566 ) ) ( not ( = ?auto_1006563 ?auto_1006567 ) ) ( not ( = ?auto_1006563 ?auto_1006568 ) ) ( not ( = ?auto_1006563 ?auto_1006572 ) ) ( not ( = ?auto_1006563 ?auto_1006574 ) ) ( not ( = ?auto_1006564 ?auto_1006565 ) ) ( not ( = ?auto_1006564 ?auto_1006566 ) ) ( not ( = ?auto_1006564 ?auto_1006567 ) ) ( not ( = ?auto_1006564 ?auto_1006568 ) ) ( not ( = ?auto_1006564 ?auto_1006572 ) ) ( not ( = ?auto_1006564 ?auto_1006574 ) ) ( not ( = ?auto_1006565 ?auto_1006566 ) ) ( not ( = ?auto_1006565 ?auto_1006567 ) ) ( not ( = ?auto_1006565 ?auto_1006568 ) ) ( not ( = ?auto_1006565 ?auto_1006572 ) ) ( not ( = ?auto_1006565 ?auto_1006574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006566 ?auto_1006567 ?auto_1006568 )
      ( MAKE-6CRATE-VERIFY ?auto_1006562 ?auto_1006563 ?auto_1006564 ?auto_1006565 ?auto_1006566 ?auto_1006567 ?auto_1006568 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1006576 - SURFACE
      ?auto_1006577 - SURFACE
      ?auto_1006578 - SURFACE
      ?auto_1006579 - SURFACE
      ?auto_1006580 - SURFACE
      ?auto_1006581 - SURFACE
      ?auto_1006582 - SURFACE
      ?auto_1006583 - SURFACE
    )
    :vars
    (
      ?auto_1006585 - HOIST
      ?auto_1006590 - PLACE
      ?auto_1006588 - PLACE
      ?auto_1006584 - HOIST
      ?auto_1006587 - SURFACE
      ?auto_1006589 - SURFACE
      ?auto_1006586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006585 ?auto_1006590 ) ( IS-CRATE ?auto_1006583 ) ( not ( = ?auto_1006582 ?auto_1006583 ) ) ( not ( = ?auto_1006581 ?auto_1006582 ) ) ( not ( = ?auto_1006581 ?auto_1006583 ) ) ( not ( = ?auto_1006588 ?auto_1006590 ) ) ( HOIST-AT ?auto_1006584 ?auto_1006588 ) ( not ( = ?auto_1006585 ?auto_1006584 ) ) ( SURFACE-AT ?auto_1006583 ?auto_1006588 ) ( ON ?auto_1006583 ?auto_1006587 ) ( CLEAR ?auto_1006583 ) ( not ( = ?auto_1006582 ?auto_1006587 ) ) ( not ( = ?auto_1006583 ?auto_1006587 ) ) ( not ( = ?auto_1006581 ?auto_1006587 ) ) ( SURFACE-AT ?auto_1006581 ?auto_1006590 ) ( CLEAR ?auto_1006581 ) ( IS-CRATE ?auto_1006582 ) ( AVAILABLE ?auto_1006585 ) ( AVAILABLE ?auto_1006584 ) ( SURFACE-AT ?auto_1006582 ?auto_1006588 ) ( ON ?auto_1006582 ?auto_1006589 ) ( CLEAR ?auto_1006582 ) ( not ( = ?auto_1006582 ?auto_1006589 ) ) ( not ( = ?auto_1006583 ?auto_1006589 ) ) ( not ( = ?auto_1006581 ?auto_1006589 ) ) ( not ( = ?auto_1006587 ?auto_1006589 ) ) ( TRUCK-AT ?auto_1006586 ?auto_1006590 ) ( ON ?auto_1006577 ?auto_1006576 ) ( ON ?auto_1006578 ?auto_1006577 ) ( ON ?auto_1006579 ?auto_1006578 ) ( ON ?auto_1006580 ?auto_1006579 ) ( ON ?auto_1006581 ?auto_1006580 ) ( not ( = ?auto_1006576 ?auto_1006577 ) ) ( not ( = ?auto_1006576 ?auto_1006578 ) ) ( not ( = ?auto_1006576 ?auto_1006579 ) ) ( not ( = ?auto_1006576 ?auto_1006580 ) ) ( not ( = ?auto_1006576 ?auto_1006581 ) ) ( not ( = ?auto_1006576 ?auto_1006582 ) ) ( not ( = ?auto_1006576 ?auto_1006583 ) ) ( not ( = ?auto_1006576 ?auto_1006587 ) ) ( not ( = ?auto_1006576 ?auto_1006589 ) ) ( not ( = ?auto_1006577 ?auto_1006578 ) ) ( not ( = ?auto_1006577 ?auto_1006579 ) ) ( not ( = ?auto_1006577 ?auto_1006580 ) ) ( not ( = ?auto_1006577 ?auto_1006581 ) ) ( not ( = ?auto_1006577 ?auto_1006582 ) ) ( not ( = ?auto_1006577 ?auto_1006583 ) ) ( not ( = ?auto_1006577 ?auto_1006587 ) ) ( not ( = ?auto_1006577 ?auto_1006589 ) ) ( not ( = ?auto_1006578 ?auto_1006579 ) ) ( not ( = ?auto_1006578 ?auto_1006580 ) ) ( not ( = ?auto_1006578 ?auto_1006581 ) ) ( not ( = ?auto_1006578 ?auto_1006582 ) ) ( not ( = ?auto_1006578 ?auto_1006583 ) ) ( not ( = ?auto_1006578 ?auto_1006587 ) ) ( not ( = ?auto_1006578 ?auto_1006589 ) ) ( not ( = ?auto_1006579 ?auto_1006580 ) ) ( not ( = ?auto_1006579 ?auto_1006581 ) ) ( not ( = ?auto_1006579 ?auto_1006582 ) ) ( not ( = ?auto_1006579 ?auto_1006583 ) ) ( not ( = ?auto_1006579 ?auto_1006587 ) ) ( not ( = ?auto_1006579 ?auto_1006589 ) ) ( not ( = ?auto_1006580 ?auto_1006581 ) ) ( not ( = ?auto_1006580 ?auto_1006582 ) ) ( not ( = ?auto_1006580 ?auto_1006583 ) ) ( not ( = ?auto_1006580 ?auto_1006587 ) ) ( not ( = ?auto_1006580 ?auto_1006589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006581 ?auto_1006582 ?auto_1006583 )
      ( MAKE-7CRATE-VERIFY ?auto_1006576 ?auto_1006577 ?auto_1006578 ?auto_1006579 ?auto_1006580 ?auto_1006581 ?auto_1006582 ?auto_1006583 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1006591 - SURFACE
      ?auto_1006592 - SURFACE
      ?auto_1006593 - SURFACE
      ?auto_1006594 - SURFACE
      ?auto_1006595 - SURFACE
      ?auto_1006596 - SURFACE
      ?auto_1006597 - SURFACE
      ?auto_1006598 - SURFACE
      ?auto_1006599 - SURFACE
    )
    :vars
    (
      ?auto_1006601 - HOIST
      ?auto_1006606 - PLACE
      ?auto_1006604 - PLACE
      ?auto_1006600 - HOIST
      ?auto_1006603 - SURFACE
      ?auto_1006605 - SURFACE
      ?auto_1006602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006601 ?auto_1006606 ) ( IS-CRATE ?auto_1006599 ) ( not ( = ?auto_1006598 ?auto_1006599 ) ) ( not ( = ?auto_1006597 ?auto_1006598 ) ) ( not ( = ?auto_1006597 ?auto_1006599 ) ) ( not ( = ?auto_1006604 ?auto_1006606 ) ) ( HOIST-AT ?auto_1006600 ?auto_1006604 ) ( not ( = ?auto_1006601 ?auto_1006600 ) ) ( SURFACE-AT ?auto_1006599 ?auto_1006604 ) ( ON ?auto_1006599 ?auto_1006603 ) ( CLEAR ?auto_1006599 ) ( not ( = ?auto_1006598 ?auto_1006603 ) ) ( not ( = ?auto_1006599 ?auto_1006603 ) ) ( not ( = ?auto_1006597 ?auto_1006603 ) ) ( SURFACE-AT ?auto_1006597 ?auto_1006606 ) ( CLEAR ?auto_1006597 ) ( IS-CRATE ?auto_1006598 ) ( AVAILABLE ?auto_1006601 ) ( AVAILABLE ?auto_1006600 ) ( SURFACE-AT ?auto_1006598 ?auto_1006604 ) ( ON ?auto_1006598 ?auto_1006605 ) ( CLEAR ?auto_1006598 ) ( not ( = ?auto_1006598 ?auto_1006605 ) ) ( not ( = ?auto_1006599 ?auto_1006605 ) ) ( not ( = ?auto_1006597 ?auto_1006605 ) ) ( not ( = ?auto_1006603 ?auto_1006605 ) ) ( TRUCK-AT ?auto_1006602 ?auto_1006606 ) ( ON ?auto_1006592 ?auto_1006591 ) ( ON ?auto_1006593 ?auto_1006592 ) ( ON ?auto_1006594 ?auto_1006593 ) ( ON ?auto_1006595 ?auto_1006594 ) ( ON ?auto_1006596 ?auto_1006595 ) ( ON ?auto_1006597 ?auto_1006596 ) ( not ( = ?auto_1006591 ?auto_1006592 ) ) ( not ( = ?auto_1006591 ?auto_1006593 ) ) ( not ( = ?auto_1006591 ?auto_1006594 ) ) ( not ( = ?auto_1006591 ?auto_1006595 ) ) ( not ( = ?auto_1006591 ?auto_1006596 ) ) ( not ( = ?auto_1006591 ?auto_1006597 ) ) ( not ( = ?auto_1006591 ?auto_1006598 ) ) ( not ( = ?auto_1006591 ?auto_1006599 ) ) ( not ( = ?auto_1006591 ?auto_1006603 ) ) ( not ( = ?auto_1006591 ?auto_1006605 ) ) ( not ( = ?auto_1006592 ?auto_1006593 ) ) ( not ( = ?auto_1006592 ?auto_1006594 ) ) ( not ( = ?auto_1006592 ?auto_1006595 ) ) ( not ( = ?auto_1006592 ?auto_1006596 ) ) ( not ( = ?auto_1006592 ?auto_1006597 ) ) ( not ( = ?auto_1006592 ?auto_1006598 ) ) ( not ( = ?auto_1006592 ?auto_1006599 ) ) ( not ( = ?auto_1006592 ?auto_1006603 ) ) ( not ( = ?auto_1006592 ?auto_1006605 ) ) ( not ( = ?auto_1006593 ?auto_1006594 ) ) ( not ( = ?auto_1006593 ?auto_1006595 ) ) ( not ( = ?auto_1006593 ?auto_1006596 ) ) ( not ( = ?auto_1006593 ?auto_1006597 ) ) ( not ( = ?auto_1006593 ?auto_1006598 ) ) ( not ( = ?auto_1006593 ?auto_1006599 ) ) ( not ( = ?auto_1006593 ?auto_1006603 ) ) ( not ( = ?auto_1006593 ?auto_1006605 ) ) ( not ( = ?auto_1006594 ?auto_1006595 ) ) ( not ( = ?auto_1006594 ?auto_1006596 ) ) ( not ( = ?auto_1006594 ?auto_1006597 ) ) ( not ( = ?auto_1006594 ?auto_1006598 ) ) ( not ( = ?auto_1006594 ?auto_1006599 ) ) ( not ( = ?auto_1006594 ?auto_1006603 ) ) ( not ( = ?auto_1006594 ?auto_1006605 ) ) ( not ( = ?auto_1006595 ?auto_1006596 ) ) ( not ( = ?auto_1006595 ?auto_1006597 ) ) ( not ( = ?auto_1006595 ?auto_1006598 ) ) ( not ( = ?auto_1006595 ?auto_1006599 ) ) ( not ( = ?auto_1006595 ?auto_1006603 ) ) ( not ( = ?auto_1006595 ?auto_1006605 ) ) ( not ( = ?auto_1006596 ?auto_1006597 ) ) ( not ( = ?auto_1006596 ?auto_1006598 ) ) ( not ( = ?auto_1006596 ?auto_1006599 ) ) ( not ( = ?auto_1006596 ?auto_1006603 ) ) ( not ( = ?auto_1006596 ?auto_1006605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006597 ?auto_1006598 ?auto_1006599 )
      ( MAKE-8CRATE-VERIFY ?auto_1006591 ?auto_1006592 ?auto_1006593 ?auto_1006594 ?auto_1006595 ?auto_1006596 ?auto_1006597 ?auto_1006598 ?auto_1006599 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1006607 - SURFACE
      ?auto_1006608 - SURFACE
      ?auto_1006609 - SURFACE
      ?auto_1006610 - SURFACE
      ?auto_1006611 - SURFACE
      ?auto_1006612 - SURFACE
      ?auto_1006613 - SURFACE
      ?auto_1006614 - SURFACE
      ?auto_1006615 - SURFACE
      ?auto_1006616 - SURFACE
    )
    :vars
    (
      ?auto_1006618 - HOIST
      ?auto_1006623 - PLACE
      ?auto_1006621 - PLACE
      ?auto_1006617 - HOIST
      ?auto_1006620 - SURFACE
      ?auto_1006622 - SURFACE
      ?auto_1006619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006618 ?auto_1006623 ) ( IS-CRATE ?auto_1006616 ) ( not ( = ?auto_1006615 ?auto_1006616 ) ) ( not ( = ?auto_1006614 ?auto_1006615 ) ) ( not ( = ?auto_1006614 ?auto_1006616 ) ) ( not ( = ?auto_1006621 ?auto_1006623 ) ) ( HOIST-AT ?auto_1006617 ?auto_1006621 ) ( not ( = ?auto_1006618 ?auto_1006617 ) ) ( SURFACE-AT ?auto_1006616 ?auto_1006621 ) ( ON ?auto_1006616 ?auto_1006620 ) ( CLEAR ?auto_1006616 ) ( not ( = ?auto_1006615 ?auto_1006620 ) ) ( not ( = ?auto_1006616 ?auto_1006620 ) ) ( not ( = ?auto_1006614 ?auto_1006620 ) ) ( SURFACE-AT ?auto_1006614 ?auto_1006623 ) ( CLEAR ?auto_1006614 ) ( IS-CRATE ?auto_1006615 ) ( AVAILABLE ?auto_1006618 ) ( AVAILABLE ?auto_1006617 ) ( SURFACE-AT ?auto_1006615 ?auto_1006621 ) ( ON ?auto_1006615 ?auto_1006622 ) ( CLEAR ?auto_1006615 ) ( not ( = ?auto_1006615 ?auto_1006622 ) ) ( not ( = ?auto_1006616 ?auto_1006622 ) ) ( not ( = ?auto_1006614 ?auto_1006622 ) ) ( not ( = ?auto_1006620 ?auto_1006622 ) ) ( TRUCK-AT ?auto_1006619 ?auto_1006623 ) ( ON ?auto_1006608 ?auto_1006607 ) ( ON ?auto_1006609 ?auto_1006608 ) ( ON ?auto_1006610 ?auto_1006609 ) ( ON ?auto_1006611 ?auto_1006610 ) ( ON ?auto_1006612 ?auto_1006611 ) ( ON ?auto_1006613 ?auto_1006612 ) ( ON ?auto_1006614 ?auto_1006613 ) ( not ( = ?auto_1006607 ?auto_1006608 ) ) ( not ( = ?auto_1006607 ?auto_1006609 ) ) ( not ( = ?auto_1006607 ?auto_1006610 ) ) ( not ( = ?auto_1006607 ?auto_1006611 ) ) ( not ( = ?auto_1006607 ?auto_1006612 ) ) ( not ( = ?auto_1006607 ?auto_1006613 ) ) ( not ( = ?auto_1006607 ?auto_1006614 ) ) ( not ( = ?auto_1006607 ?auto_1006615 ) ) ( not ( = ?auto_1006607 ?auto_1006616 ) ) ( not ( = ?auto_1006607 ?auto_1006620 ) ) ( not ( = ?auto_1006607 ?auto_1006622 ) ) ( not ( = ?auto_1006608 ?auto_1006609 ) ) ( not ( = ?auto_1006608 ?auto_1006610 ) ) ( not ( = ?auto_1006608 ?auto_1006611 ) ) ( not ( = ?auto_1006608 ?auto_1006612 ) ) ( not ( = ?auto_1006608 ?auto_1006613 ) ) ( not ( = ?auto_1006608 ?auto_1006614 ) ) ( not ( = ?auto_1006608 ?auto_1006615 ) ) ( not ( = ?auto_1006608 ?auto_1006616 ) ) ( not ( = ?auto_1006608 ?auto_1006620 ) ) ( not ( = ?auto_1006608 ?auto_1006622 ) ) ( not ( = ?auto_1006609 ?auto_1006610 ) ) ( not ( = ?auto_1006609 ?auto_1006611 ) ) ( not ( = ?auto_1006609 ?auto_1006612 ) ) ( not ( = ?auto_1006609 ?auto_1006613 ) ) ( not ( = ?auto_1006609 ?auto_1006614 ) ) ( not ( = ?auto_1006609 ?auto_1006615 ) ) ( not ( = ?auto_1006609 ?auto_1006616 ) ) ( not ( = ?auto_1006609 ?auto_1006620 ) ) ( not ( = ?auto_1006609 ?auto_1006622 ) ) ( not ( = ?auto_1006610 ?auto_1006611 ) ) ( not ( = ?auto_1006610 ?auto_1006612 ) ) ( not ( = ?auto_1006610 ?auto_1006613 ) ) ( not ( = ?auto_1006610 ?auto_1006614 ) ) ( not ( = ?auto_1006610 ?auto_1006615 ) ) ( not ( = ?auto_1006610 ?auto_1006616 ) ) ( not ( = ?auto_1006610 ?auto_1006620 ) ) ( not ( = ?auto_1006610 ?auto_1006622 ) ) ( not ( = ?auto_1006611 ?auto_1006612 ) ) ( not ( = ?auto_1006611 ?auto_1006613 ) ) ( not ( = ?auto_1006611 ?auto_1006614 ) ) ( not ( = ?auto_1006611 ?auto_1006615 ) ) ( not ( = ?auto_1006611 ?auto_1006616 ) ) ( not ( = ?auto_1006611 ?auto_1006620 ) ) ( not ( = ?auto_1006611 ?auto_1006622 ) ) ( not ( = ?auto_1006612 ?auto_1006613 ) ) ( not ( = ?auto_1006612 ?auto_1006614 ) ) ( not ( = ?auto_1006612 ?auto_1006615 ) ) ( not ( = ?auto_1006612 ?auto_1006616 ) ) ( not ( = ?auto_1006612 ?auto_1006620 ) ) ( not ( = ?auto_1006612 ?auto_1006622 ) ) ( not ( = ?auto_1006613 ?auto_1006614 ) ) ( not ( = ?auto_1006613 ?auto_1006615 ) ) ( not ( = ?auto_1006613 ?auto_1006616 ) ) ( not ( = ?auto_1006613 ?auto_1006620 ) ) ( not ( = ?auto_1006613 ?auto_1006622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006614 ?auto_1006615 ?auto_1006616 )
      ( MAKE-9CRATE-VERIFY ?auto_1006607 ?auto_1006608 ?auto_1006609 ?auto_1006610 ?auto_1006611 ?auto_1006612 ?auto_1006613 ?auto_1006614 ?auto_1006615 ?auto_1006616 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1006624 - SURFACE
      ?auto_1006625 - SURFACE
      ?auto_1006626 - SURFACE
      ?auto_1006627 - SURFACE
      ?auto_1006628 - SURFACE
      ?auto_1006629 - SURFACE
      ?auto_1006630 - SURFACE
      ?auto_1006631 - SURFACE
      ?auto_1006632 - SURFACE
      ?auto_1006633 - SURFACE
      ?auto_1006634 - SURFACE
    )
    :vars
    (
      ?auto_1006636 - HOIST
      ?auto_1006641 - PLACE
      ?auto_1006639 - PLACE
      ?auto_1006635 - HOIST
      ?auto_1006638 - SURFACE
      ?auto_1006640 - SURFACE
      ?auto_1006637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006636 ?auto_1006641 ) ( IS-CRATE ?auto_1006634 ) ( not ( = ?auto_1006633 ?auto_1006634 ) ) ( not ( = ?auto_1006632 ?auto_1006633 ) ) ( not ( = ?auto_1006632 ?auto_1006634 ) ) ( not ( = ?auto_1006639 ?auto_1006641 ) ) ( HOIST-AT ?auto_1006635 ?auto_1006639 ) ( not ( = ?auto_1006636 ?auto_1006635 ) ) ( SURFACE-AT ?auto_1006634 ?auto_1006639 ) ( ON ?auto_1006634 ?auto_1006638 ) ( CLEAR ?auto_1006634 ) ( not ( = ?auto_1006633 ?auto_1006638 ) ) ( not ( = ?auto_1006634 ?auto_1006638 ) ) ( not ( = ?auto_1006632 ?auto_1006638 ) ) ( SURFACE-AT ?auto_1006632 ?auto_1006641 ) ( CLEAR ?auto_1006632 ) ( IS-CRATE ?auto_1006633 ) ( AVAILABLE ?auto_1006636 ) ( AVAILABLE ?auto_1006635 ) ( SURFACE-AT ?auto_1006633 ?auto_1006639 ) ( ON ?auto_1006633 ?auto_1006640 ) ( CLEAR ?auto_1006633 ) ( not ( = ?auto_1006633 ?auto_1006640 ) ) ( not ( = ?auto_1006634 ?auto_1006640 ) ) ( not ( = ?auto_1006632 ?auto_1006640 ) ) ( not ( = ?auto_1006638 ?auto_1006640 ) ) ( TRUCK-AT ?auto_1006637 ?auto_1006641 ) ( ON ?auto_1006625 ?auto_1006624 ) ( ON ?auto_1006626 ?auto_1006625 ) ( ON ?auto_1006627 ?auto_1006626 ) ( ON ?auto_1006628 ?auto_1006627 ) ( ON ?auto_1006629 ?auto_1006628 ) ( ON ?auto_1006630 ?auto_1006629 ) ( ON ?auto_1006631 ?auto_1006630 ) ( ON ?auto_1006632 ?auto_1006631 ) ( not ( = ?auto_1006624 ?auto_1006625 ) ) ( not ( = ?auto_1006624 ?auto_1006626 ) ) ( not ( = ?auto_1006624 ?auto_1006627 ) ) ( not ( = ?auto_1006624 ?auto_1006628 ) ) ( not ( = ?auto_1006624 ?auto_1006629 ) ) ( not ( = ?auto_1006624 ?auto_1006630 ) ) ( not ( = ?auto_1006624 ?auto_1006631 ) ) ( not ( = ?auto_1006624 ?auto_1006632 ) ) ( not ( = ?auto_1006624 ?auto_1006633 ) ) ( not ( = ?auto_1006624 ?auto_1006634 ) ) ( not ( = ?auto_1006624 ?auto_1006638 ) ) ( not ( = ?auto_1006624 ?auto_1006640 ) ) ( not ( = ?auto_1006625 ?auto_1006626 ) ) ( not ( = ?auto_1006625 ?auto_1006627 ) ) ( not ( = ?auto_1006625 ?auto_1006628 ) ) ( not ( = ?auto_1006625 ?auto_1006629 ) ) ( not ( = ?auto_1006625 ?auto_1006630 ) ) ( not ( = ?auto_1006625 ?auto_1006631 ) ) ( not ( = ?auto_1006625 ?auto_1006632 ) ) ( not ( = ?auto_1006625 ?auto_1006633 ) ) ( not ( = ?auto_1006625 ?auto_1006634 ) ) ( not ( = ?auto_1006625 ?auto_1006638 ) ) ( not ( = ?auto_1006625 ?auto_1006640 ) ) ( not ( = ?auto_1006626 ?auto_1006627 ) ) ( not ( = ?auto_1006626 ?auto_1006628 ) ) ( not ( = ?auto_1006626 ?auto_1006629 ) ) ( not ( = ?auto_1006626 ?auto_1006630 ) ) ( not ( = ?auto_1006626 ?auto_1006631 ) ) ( not ( = ?auto_1006626 ?auto_1006632 ) ) ( not ( = ?auto_1006626 ?auto_1006633 ) ) ( not ( = ?auto_1006626 ?auto_1006634 ) ) ( not ( = ?auto_1006626 ?auto_1006638 ) ) ( not ( = ?auto_1006626 ?auto_1006640 ) ) ( not ( = ?auto_1006627 ?auto_1006628 ) ) ( not ( = ?auto_1006627 ?auto_1006629 ) ) ( not ( = ?auto_1006627 ?auto_1006630 ) ) ( not ( = ?auto_1006627 ?auto_1006631 ) ) ( not ( = ?auto_1006627 ?auto_1006632 ) ) ( not ( = ?auto_1006627 ?auto_1006633 ) ) ( not ( = ?auto_1006627 ?auto_1006634 ) ) ( not ( = ?auto_1006627 ?auto_1006638 ) ) ( not ( = ?auto_1006627 ?auto_1006640 ) ) ( not ( = ?auto_1006628 ?auto_1006629 ) ) ( not ( = ?auto_1006628 ?auto_1006630 ) ) ( not ( = ?auto_1006628 ?auto_1006631 ) ) ( not ( = ?auto_1006628 ?auto_1006632 ) ) ( not ( = ?auto_1006628 ?auto_1006633 ) ) ( not ( = ?auto_1006628 ?auto_1006634 ) ) ( not ( = ?auto_1006628 ?auto_1006638 ) ) ( not ( = ?auto_1006628 ?auto_1006640 ) ) ( not ( = ?auto_1006629 ?auto_1006630 ) ) ( not ( = ?auto_1006629 ?auto_1006631 ) ) ( not ( = ?auto_1006629 ?auto_1006632 ) ) ( not ( = ?auto_1006629 ?auto_1006633 ) ) ( not ( = ?auto_1006629 ?auto_1006634 ) ) ( not ( = ?auto_1006629 ?auto_1006638 ) ) ( not ( = ?auto_1006629 ?auto_1006640 ) ) ( not ( = ?auto_1006630 ?auto_1006631 ) ) ( not ( = ?auto_1006630 ?auto_1006632 ) ) ( not ( = ?auto_1006630 ?auto_1006633 ) ) ( not ( = ?auto_1006630 ?auto_1006634 ) ) ( not ( = ?auto_1006630 ?auto_1006638 ) ) ( not ( = ?auto_1006630 ?auto_1006640 ) ) ( not ( = ?auto_1006631 ?auto_1006632 ) ) ( not ( = ?auto_1006631 ?auto_1006633 ) ) ( not ( = ?auto_1006631 ?auto_1006634 ) ) ( not ( = ?auto_1006631 ?auto_1006638 ) ) ( not ( = ?auto_1006631 ?auto_1006640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006632 ?auto_1006633 ?auto_1006634 )
      ( MAKE-10CRATE-VERIFY ?auto_1006624 ?auto_1006625 ?auto_1006626 ?auto_1006627 ?auto_1006628 ?auto_1006629 ?auto_1006630 ?auto_1006631 ?auto_1006632 ?auto_1006633 ?auto_1006634 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006642 - SURFACE
      ?auto_1006643 - SURFACE
      ?auto_1006644 - SURFACE
      ?auto_1006645 - SURFACE
      ?auto_1006646 - SURFACE
      ?auto_1006647 - SURFACE
      ?auto_1006648 - SURFACE
      ?auto_1006649 - SURFACE
      ?auto_1006650 - SURFACE
      ?auto_1006651 - SURFACE
      ?auto_1006652 - SURFACE
      ?auto_1006653 - SURFACE
    )
    :vars
    (
      ?auto_1006655 - HOIST
      ?auto_1006660 - PLACE
      ?auto_1006658 - PLACE
      ?auto_1006654 - HOIST
      ?auto_1006657 - SURFACE
      ?auto_1006659 - SURFACE
      ?auto_1006656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006655 ?auto_1006660 ) ( IS-CRATE ?auto_1006653 ) ( not ( = ?auto_1006652 ?auto_1006653 ) ) ( not ( = ?auto_1006651 ?auto_1006652 ) ) ( not ( = ?auto_1006651 ?auto_1006653 ) ) ( not ( = ?auto_1006658 ?auto_1006660 ) ) ( HOIST-AT ?auto_1006654 ?auto_1006658 ) ( not ( = ?auto_1006655 ?auto_1006654 ) ) ( SURFACE-AT ?auto_1006653 ?auto_1006658 ) ( ON ?auto_1006653 ?auto_1006657 ) ( CLEAR ?auto_1006653 ) ( not ( = ?auto_1006652 ?auto_1006657 ) ) ( not ( = ?auto_1006653 ?auto_1006657 ) ) ( not ( = ?auto_1006651 ?auto_1006657 ) ) ( SURFACE-AT ?auto_1006651 ?auto_1006660 ) ( CLEAR ?auto_1006651 ) ( IS-CRATE ?auto_1006652 ) ( AVAILABLE ?auto_1006655 ) ( AVAILABLE ?auto_1006654 ) ( SURFACE-AT ?auto_1006652 ?auto_1006658 ) ( ON ?auto_1006652 ?auto_1006659 ) ( CLEAR ?auto_1006652 ) ( not ( = ?auto_1006652 ?auto_1006659 ) ) ( not ( = ?auto_1006653 ?auto_1006659 ) ) ( not ( = ?auto_1006651 ?auto_1006659 ) ) ( not ( = ?auto_1006657 ?auto_1006659 ) ) ( TRUCK-AT ?auto_1006656 ?auto_1006660 ) ( ON ?auto_1006643 ?auto_1006642 ) ( ON ?auto_1006644 ?auto_1006643 ) ( ON ?auto_1006645 ?auto_1006644 ) ( ON ?auto_1006646 ?auto_1006645 ) ( ON ?auto_1006647 ?auto_1006646 ) ( ON ?auto_1006648 ?auto_1006647 ) ( ON ?auto_1006649 ?auto_1006648 ) ( ON ?auto_1006650 ?auto_1006649 ) ( ON ?auto_1006651 ?auto_1006650 ) ( not ( = ?auto_1006642 ?auto_1006643 ) ) ( not ( = ?auto_1006642 ?auto_1006644 ) ) ( not ( = ?auto_1006642 ?auto_1006645 ) ) ( not ( = ?auto_1006642 ?auto_1006646 ) ) ( not ( = ?auto_1006642 ?auto_1006647 ) ) ( not ( = ?auto_1006642 ?auto_1006648 ) ) ( not ( = ?auto_1006642 ?auto_1006649 ) ) ( not ( = ?auto_1006642 ?auto_1006650 ) ) ( not ( = ?auto_1006642 ?auto_1006651 ) ) ( not ( = ?auto_1006642 ?auto_1006652 ) ) ( not ( = ?auto_1006642 ?auto_1006653 ) ) ( not ( = ?auto_1006642 ?auto_1006657 ) ) ( not ( = ?auto_1006642 ?auto_1006659 ) ) ( not ( = ?auto_1006643 ?auto_1006644 ) ) ( not ( = ?auto_1006643 ?auto_1006645 ) ) ( not ( = ?auto_1006643 ?auto_1006646 ) ) ( not ( = ?auto_1006643 ?auto_1006647 ) ) ( not ( = ?auto_1006643 ?auto_1006648 ) ) ( not ( = ?auto_1006643 ?auto_1006649 ) ) ( not ( = ?auto_1006643 ?auto_1006650 ) ) ( not ( = ?auto_1006643 ?auto_1006651 ) ) ( not ( = ?auto_1006643 ?auto_1006652 ) ) ( not ( = ?auto_1006643 ?auto_1006653 ) ) ( not ( = ?auto_1006643 ?auto_1006657 ) ) ( not ( = ?auto_1006643 ?auto_1006659 ) ) ( not ( = ?auto_1006644 ?auto_1006645 ) ) ( not ( = ?auto_1006644 ?auto_1006646 ) ) ( not ( = ?auto_1006644 ?auto_1006647 ) ) ( not ( = ?auto_1006644 ?auto_1006648 ) ) ( not ( = ?auto_1006644 ?auto_1006649 ) ) ( not ( = ?auto_1006644 ?auto_1006650 ) ) ( not ( = ?auto_1006644 ?auto_1006651 ) ) ( not ( = ?auto_1006644 ?auto_1006652 ) ) ( not ( = ?auto_1006644 ?auto_1006653 ) ) ( not ( = ?auto_1006644 ?auto_1006657 ) ) ( not ( = ?auto_1006644 ?auto_1006659 ) ) ( not ( = ?auto_1006645 ?auto_1006646 ) ) ( not ( = ?auto_1006645 ?auto_1006647 ) ) ( not ( = ?auto_1006645 ?auto_1006648 ) ) ( not ( = ?auto_1006645 ?auto_1006649 ) ) ( not ( = ?auto_1006645 ?auto_1006650 ) ) ( not ( = ?auto_1006645 ?auto_1006651 ) ) ( not ( = ?auto_1006645 ?auto_1006652 ) ) ( not ( = ?auto_1006645 ?auto_1006653 ) ) ( not ( = ?auto_1006645 ?auto_1006657 ) ) ( not ( = ?auto_1006645 ?auto_1006659 ) ) ( not ( = ?auto_1006646 ?auto_1006647 ) ) ( not ( = ?auto_1006646 ?auto_1006648 ) ) ( not ( = ?auto_1006646 ?auto_1006649 ) ) ( not ( = ?auto_1006646 ?auto_1006650 ) ) ( not ( = ?auto_1006646 ?auto_1006651 ) ) ( not ( = ?auto_1006646 ?auto_1006652 ) ) ( not ( = ?auto_1006646 ?auto_1006653 ) ) ( not ( = ?auto_1006646 ?auto_1006657 ) ) ( not ( = ?auto_1006646 ?auto_1006659 ) ) ( not ( = ?auto_1006647 ?auto_1006648 ) ) ( not ( = ?auto_1006647 ?auto_1006649 ) ) ( not ( = ?auto_1006647 ?auto_1006650 ) ) ( not ( = ?auto_1006647 ?auto_1006651 ) ) ( not ( = ?auto_1006647 ?auto_1006652 ) ) ( not ( = ?auto_1006647 ?auto_1006653 ) ) ( not ( = ?auto_1006647 ?auto_1006657 ) ) ( not ( = ?auto_1006647 ?auto_1006659 ) ) ( not ( = ?auto_1006648 ?auto_1006649 ) ) ( not ( = ?auto_1006648 ?auto_1006650 ) ) ( not ( = ?auto_1006648 ?auto_1006651 ) ) ( not ( = ?auto_1006648 ?auto_1006652 ) ) ( not ( = ?auto_1006648 ?auto_1006653 ) ) ( not ( = ?auto_1006648 ?auto_1006657 ) ) ( not ( = ?auto_1006648 ?auto_1006659 ) ) ( not ( = ?auto_1006649 ?auto_1006650 ) ) ( not ( = ?auto_1006649 ?auto_1006651 ) ) ( not ( = ?auto_1006649 ?auto_1006652 ) ) ( not ( = ?auto_1006649 ?auto_1006653 ) ) ( not ( = ?auto_1006649 ?auto_1006657 ) ) ( not ( = ?auto_1006649 ?auto_1006659 ) ) ( not ( = ?auto_1006650 ?auto_1006651 ) ) ( not ( = ?auto_1006650 ?auto_1006652 ) ) ( not ( = ?auto_1006650 ?auto_1006653 ) ) ( not ( = ?auto_1006650 ?auto_1006657 ) ) ( not ( = ?auto_1006650 ?auto_1006659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006651 ?auto_1006652 ?auto_1006653 )
      ( MAKE-11CRATE-VERIFY ?auto_1006642 ?auto_1006643 ?auto_1006644 ?auto_1006645 ?auto_1006646 ?auto_1006647 ?auto_1006648 ?auto_1006649 ?auto_1006650 ?auto_1006651 ?auto_1006652 ?auto_1006653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1006661 - SURFACE
      ?auto_1006662 - SURFACE
    )
    :vars
    (
      ?auto_1006664 - HOIST
      ?auto_1006670 - PLACE
      ?auto_1006665 - SURFACE
      ?auto_1006668 - PLACE
      ?auto_1006663 - HOIST
      ?auto_1006667 - SURFACE
      ?auto_1006669 - SURFACE
      ?auto_1006666 - TRUCK
      ?auto_1006671 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006664 ?auto_1006670 ) ( IS-CRATE ?auto_1006662 ) ( not ( = ?auto_1006661 ?auto_1006662 ) ) ( not ( = ?auto_1006665 ?auto_1006661 ) ) ( not ( = ?auto_1006665 ?auto_1006662 ) ) ( not ( = ?auto_1006668 ?auto_1006670 ) ) ( HOIST-AT ?auto_1006663 ?auto_1006668 ) ( not ( = ?auto_1006664 ?auto_1006663 ) ) ( SURFACE-AT ?auto_1006662 ?auto_1006668 ) ( ON ?auto_1006662 ?auto_1006667 ) ( CLEAR ?auto_1006662 ) ( not ( = ?auto_1006661 ?auto_1006667 ) ) ( not ( = ?auto_1006662 ?auto_1006667 ) ) ( not ( = ?auto_1006665 ?auto_1006667 ) ) ( IS-CRATE ?auto_1006661 ) ( AVAILABLE ?auto_1006663 ) ( SURFACE-AT ?auto_1006661 ?auto_1006668 ) ( ON ?auto_1006661 ?auto_1006669 ) ( CLEAR ?auto_1006661 ) ( not ( = ?auto_1006661 ?auto_1006669 ) ) ( not ( = ?auto_1006662 ?auto_1006669 ) ) ( not ( = ?auto_1006665 ?auto_1006669 ) ) ( not ( = ?auto_1006667 ?auto_1006669 ) ) ( TRUCK-AT ?auto_1006666 ?auto_1006670 ) ( SURFACE-AT ?auto_1006671 ?auto_1006670 ) ( CLEAR ?auto_1006671 ) ( LIFTING ?auto_1006664 ?auto_1006665 ) ( IS-CRATE ?auto_1006665 ) ( not ( = ?auto_1006671 ?auto_1006665 ) ) ( not ( = ?auto_1006661 ?auto_1006671 ) ) ( not ( = ?auto_1006662 ?auto_1006671 ) ) ( not ( = ?auto_1006667 ?auto_1006671 ) ) ( not ( = ?auto_1006669 ?auto_1006671 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1006671 ?auto_1006665 )
      ( MAKE-2CRATE ?auto_1006665 ?auto_1006661 ?auto_1006662 )
      ( MAKE-1CRATE-VERIFY ?auto_1006661 ?auto_1006662 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1006672 - SURFACE
      ?auto_1006673 - SURFACE
      ?auto_1006674 - SURFACE
    )
    :vars
    (
      ?auto_1006676 - HOIST
      ?auto_1006680 - PLACE
      ?auto_1006677 - PLACE
      ?auto_1006682 - HOIST
      ?auto_1006679 - SURFACE
      ?auto_1006678 - SURFACE
      ?auto_1006675 - TRUCK
      ?auto_1006681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006676 ?auto_1006680 ) ( IS-CRATE ?auto_1006674 ) ( not ( = ?auto_1006673 ?auto_1006674 ) ) ( not ( = ?auto_1006672 ?auto_1006673 ) ) ( not ( = ?auto_1006672 ?auto_1006674 ) ) ( not ( = ?auto_1006677 ?auto_1006680 ) ) ( HOIST-AT ?auto_1006682 ?auto_1006677 ) ( not ( = ?auto_1006676 ?auto_1006682 ) ) ( SURFACE-AT ?auto_1006674 ?auto_1006677 ) ( ON ?auto_1006674 ?auto_1006679 ) ( CLEAR ?auto_1006674 ) ( not ( = ?auto_1006673 ?auto_1006679 ) ) ( not ( = ?auto_1006674 ?auto_1006679 ) ) ( not ( = ?auto_1006672 ?auto_1006679 ) ) ( IS-CRATE ?auto_1006673 ) ( AVAILABLE ?auto_1006682 ) ( SURFACE-AT ?auto_1006673 ?auto_1006677 ) ( ON ?auto_1006673 ?auto_1006678 ) ( CLEAR ?auto_1006673 ) ( not ( = ?auto_1006673 ?auto_1006678 ) ) ( not ( = ?auto_1006674 ?auto_1006678 ) ) ( not ( = ?auto_1006672 ?auto_1006678 ) ) ( not ( = ?auto_1006679 ?auto_1006678 ) ) ( TRUCK-AT ?auto_1006675 ?auto_1006680 ) ( SURFACE-AT ?auto_1006681 ?auto_1006680 ) ( CLEAR ?auto_1006681 ) ( LIFTING ?auto_1006676 ?auto_1006672 ) ( IS-CRATE ?auto_1006672 ) ( not ( = ?auto_1006681 ?auto_1006672 ) ) ( not ( = ?auto_1006673 ?auto_1006681 ) ) ( not ( = ?auto_1006674 ?auto_1006681 ) ) ( not ( = ?auto_1006679 ?auto_1006681 ) ) ( not ( = ?auto_1006678 ?auto_1006681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1006673 ?auto_1006674 )
      ( MAKE-2CRATE-VERIFY ?auto_1006672 ?auto_1006673 ?auto_1006674 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1006683 - SURFACE
      ?auto_1006684 - SURFACE
      ?auto_1006685 - SURFACE
      ?auto_1006686 - SURFACE
    )
    :vars
    (
      ?auto_1006693 - HOIST
      ?auto_1006691 - PLACE
      ?auto_1006690 - PLACE
      ?auto_1006692 - HOIST
      ?auto_1006689 - SURFACE
      ?auto_1006687 - SURFACE
      ?auto_1006688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006693 ?auto_1006691 ) ( IS-CRATE ?auto_1006686 ) ( not ( = ?auto_1006685 ?auto_1006686 ) ) ( not ( = ?auto_1006684 ?auto_1006685 ) ) ( not ( = ?auto_1006684 ?auto_1006686 ) ) ( not ( = ?auto_1006690 ?auto_1006691 ) ) ( HOIST-AT ?auto_1006692 ?auto_1006690 ) ( not ( = ?auto_1006693 ?auto_1006692 ) ) ( SURFACE-AT ?auto_1006686 ?auto_1006690 ) ( ON ?auto_1006686 ?auto_1006689 ) ( CLEAR ?auto_1006686 ) ( not ( = ?auto_1006685 ?auto_1006689 ) ) ( not ( = ?auto_1006686 ?auto_1006689 ) ) ( not ( = ?auto_1006684 ?auto_1006689 ) ) ( IS-CRATE ?auto_1006685 ) ( AVAILABLE ?auto_1006692 ) ( SURFACE-AT ?auto_1006685 ?auto_1006690 ) ( ON ?auto_1006685 ?auto_1006687 ) ( CLEAR ?auto_1006685 ) ( not ( = ?auto_1006685 ?auto_1006687 ) ) ( not ( = ?auto_1006686 ?auto_1006687 ) ) ( not ( = ?auto_1006684 ?auto_1006687 ) ) ( not ( = ?auto_1006689 ?auto_1006687 ) ) ( TRUCK-AT ?auto_1006688 ?auto_1006691 ) ( SURFACE-AT ?auto_1006683 ?auto_1006691 ) ( CLEAR ?auto_1006683 ) ( LIFTING ?auto_1006693 ?auto_1006684 ) ( IS-CRATE ?auto_1006684 ) ( not ( = ?auto_1006683 ?auto_1006684 ) ) ( not ( = ?auto_1006685 ?auto_1006683 ) ) ( not ( = ?auto_1006686 ?auto_1006683 ) ) ( not ( = ?auto_1006689 ?auto_1006683 ) ) ( not ( = ?auto_1006687 ?auto_1006683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006684 ?auto_1006685 ?auto_1006686 )
      ( MAKE-3CRATE-VERIFY ?auto_1006683 ?auto_1006684 ?auto_1006685 ?auto_1006686 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1006694 - SURFACE
      ?auto_1006695 - SURFACE
      ?auto_1006696 - SURFACE
      ?auto_1006697 - SURFACE
      ?auto_1006698 - SURFACE
    )
    :vars
    (
      ?auto_1006705 - HOIST
      ?auto_1006703 - PLACE
      ?auto_1006702 - PLACE
      ?auto_1006704 - HOIST
      ?auto_1006701 - SURFACE
      ?auto_1006699 - SURFACE
      ?auto_1006700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006705 ?auto_1006703 ) ( IS-CRATE ?auto_1006698 ) ( not ( = ?auto_1006697 ?auto_1006698 ) ) ( not ( = ?auto_1006696 ?auto_1006697 ) ) ( not ( = ?auto_1006696 ?auto_1006698 ) ) ( not ( = ?auto_1006702 ?auto_1006703 ) ) ( HOIST-AT ?auto_1006704 ?auto_1006702 ) ( not ( = ?auto_1006705 ?auto_1006704 ) ) ( SURFACE-AT ?auto_1006698 ?auto_1006702 ) ( ON ?auto_1006698 ?auto_1006701 ) ( CLEAR ?auto_1006698 ) ( not ( = ?auto_1006697 ?auto_1006701 ) ) ( not ( = ?auto_1006698 ?auto_1006701 ) ) ( not ( = ?auto_1006696 ?auto_1006701 ) ) ( IS-CRATE ?auto_1006697 ) ( AVAILABLE ?auto_1006704 ) ( SURFACE-AT ?auto_1006697 ?auto_1006702 ) ( ON ?auto_1006697 ?auto_1006699 ) ( CLEAR ?auto_1006697 ) ( not ( = ?auto_1006697 ?auto_1006699 ) ) ( not ( = ?auto_1006698 ?auto_1006699 ) ) ( not ( = ?auto_1006696 ?auto_1006699 ) ) ( not ( = ?auto_1006701 ?auto_1006699 ) ) ( TRUCK-AT ?auto_1006700 ?auto_1006703 ) ( SURFACE-AT ?auto_1006695 ?auto_1006703 ) ( CLEAR ?auto_1006695 ) ( LIFTING ?auto_1006705 ?auto_1006696 ) ( IS-CRATE ?auto_1006696 ) ( not ( = ?auto_1006695 ?auto_1006696 ) ) ( not ( = ?auto_1006697 ?auto_1006695 ) ) ( not ( = ?auto_1006698 ?auto_1006695 ) ) ( not ( = ?auto_1006701 ?auto_1006695 ) ) ( not ( = ?auto_1006699 ?auto_1006695 ) ) ( ON ?auto_1006695 ?auto_1006694 ) ( not ( = ?auto_1006694 ?auto_1006695 ) ) ( not ( = ?auto_1006694 ?auto_1006696 ) ) ( not ( = ?auto_1006694 ?auto_1006697 ) ) ( not ( = ?auto_1006694 ?auto_1006698 ) ) ( not ( = ?auto_1006694 ?auto_1006701 ) ) ( not ( = ?auto_1006694 ?auto_1006699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006696 ?auto_1006697 ?auto_1006698 )
      ( MAKE-4CRATE-VERIFY ?auto_1006694 ?auto_1006695 ?auto_1006696 ?auto_1006697 ?auto_1006698 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1006706 - SURFACE
      ?auto_1006707 - SURFACE
      ?auto_1006708 - SURFACE
      ?auto_1006709 - SURFACE
      ?auto_1006710 - SURFACE
      ?auto_1006711 - SURFACE
    )
    :vars
    (
      ?auto_1006718 - HOIST
      ?auto_1006716 - PLACE
      ?auto_1006715 - PLACE
      ?auto_1006717 - HOIST
      ?auto_1006714 - SURFACE
      ?auto_1006712 - SURFACE
      ?auto_1006713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006718 ?auto_1006716 ) ( IS-CRATE ?auto_1006711 ) ( not ( = ?auto_1006710 ?auto_1006711 ) ) ( not ( = ?auto_1006709 ?auto_1006710 ) ) ( not ( = ?auto_1006709 ?auto_1006711 ) ) ( not ( = ?auto_1006715 ?auto_1006716 ) ) ( HOIST-AT ?auto_1006717 ?auto_1006715 ) ( not ( = ?auto_1006718 ?auto_1006717 ) ) ( SURFACE-AT ?auto_1006711 ?auto_1006715 ) ( ON ?auto_1006711 ?auto_1006714 ) ( CLEAR ?auto_1006711 ) ( not ( = ?auto_1006710 ?auto_1006714 ) ) ( not ( = ?auto_1006711 ?auto_1006714 ) ) ( not ( = ?auto_1006709 ?auto_1006714 ) ) ( IS-CRATE ?auto_1006710 ) ( AVAILABLE ?auto_1006717 ) ( SURFACE-AT ?auto_1006710 ?auto_1006715 ) ( ON ?auto_1006710 ?auto_1006712 ) ( CLEAR ?auto_1006710 ) ( not ( = ?auto_1006710 ?auto_1006712 ) ) ( not ( = ?auto_1006711 ?auto_1006712 ) ) ( not ( = ?auto_1006709 ?auto_1006712 ) ) ( not ( = ?auto_1006714 ?auto_1006712 ) ) ( TRUCK-AT ?auto_1006713 ?auto_1006716 ) ( SURFACE-AT ?auto_1006708 ?auto_1006716 ) ( CLEAR ?auto_1006708 ) ( LIFTING ?auto_1006718 ?auto_1006709 ) ( IS-CRATE ?auto_1006709 ) ( not ( = ?auto_1006708 ?auto_1006709 ) ) ( not ( = ?auto_1006710 ?auto_1006708 ) ) ( not ( = ?auto_1006711 ?auto_1006708 ) ) ( not ( = ?auto_1006714 ?auto_1006708 ) ) ( not ( = ?auto_1006712 ?auto_1006708 ) ) ( ON ?auto_1006707 ?auto_1006706 ) ( ON ?auto_1006708 ?auto_1006707 ) ( not ( = ?auto_1006706 ?auto_1006707 ) ) ( not ( = ?auto_1006706 ?auto_1006708 ) ) ( not ( = ?auto_1006706 ?auto_1006709 ) ) ( not ( = ?auto_1006706 ?auto_1006710 ) ) ( not ( = ?auto_1006706 ?auto_1006711 ) ) ( not ( = ?auto_1006706 ?auto_1006714 ) ) ( not ( = ?auto_1006706 ?auto_1006712 ) ) ( not ( = ?auto_1006707 ?auto_1006708 ) ) ( not ( = ?auto_1006707 ?auto_1006709 ) ) ( not ( = ?auto_1006707 ?auto_1006710 ) ) ( not ( = ?auto_1006707 ?auto_1006711 ) ) ( not ( = ?auto_1006707 ?auto_1006714 ) ) ( not ( = ?auto_1006707 ?auto_1006712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006709 ?auto_1006710 ?auto_1006711 )
      ( MAKE-5CRATE-VERIFY ?auto_1006706 ?auto_1006707 ?auto_1006708 ?auto_1006709 ?auto_1006710 ?auto_1006711 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1006719 - SURFACE
      ?auto_1006720 - SURFACE
      ?auto_1006721 - SURFACE
      ?auto_1006722 - SURFACE
      ?auto_1006723 - SURFACE
      ?auto_1006724 - SURFACE
      ?auto_1006725 - SURFACE
    )
    :vars
    (
      ?auto_1006732 - HOIST
      ?auto_1006730 - PLACE
      ?auto_1006729 - PLACE
      ?auto_1006731 - HOIST
      ?auto_1006728 - SURFACE
      ?auto_1006726 - SURFACE
      ?auto_1006727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006732 ?auto_1006730 ) ( IS-CRATE ?auto_1006725 ) ( not ( = ?auto_1006724 ?auto_1006725 ) ) ( not ( = ?auto_1006723 ?auto_1006724 ) ) ( not ( = ?auto_1006723 ?auto_1006725 ) ) ( not ( = ?auto_1006729 ?auto_1006730 ) ) ( HOIST-AT ?auto_1006731 ?auto_1006729 ) ( not ( = ?auto_1006732 ?auto_1006731 ) ) ( SURFACE-AT ?auto_1006725 ?auto_1006729 ) ( ON ?auto_1006725 ?auto_1006728 ) ( CLEAR ?auto_1006725 ) ( not ( = ?auto_1006724 ?auto_1006728 ) ) ( not ( = ?auto_1006725 ?auto_1006728 ) ) ( not ( = ?auto_1006723 ?auto_1006728 ) ) ( IS-CRATE ?auto_1006724 ) ( AVAILABLE ?auto_1006731 ) ( SURFACE-AT ?auto_1006724 ?auto_1006729 ) ( ON ?auto_1006724 ?auto_1006726 ) ( CLEAR ?auto_1006724 ) ( not ( = ?auto_1006724 ?auto_1006726 ) ) ( not ( = ?auto_1006725 ?auto_1006726 ) ) ( not ( = ?auto_1006723 ?auto_1006726 ) ) ( not ( = ?auto_1006728 ?auto_1006726 ) ) ( TRUCK-AT ?auto_1006727 ?auto_1006730 ) ( SURFACE-AT ?auto_1006722 ?auto_1006730 ) ( CLEAR ?auto_1006722 ) ( LIFTING ?auto_1006732 ?auto_1006723 ) ( IS-CRATE ?auto_1006723 ) ( not ( = ?auto_1006722 ?auto_1006723 ) ) ( not ( = ?auto_1006724 ?auto_1006722 ) ) ( not ( = ?auto_1006725 ?auto_1006722 ) ) ( not ( = ?auto_1006728 ?auto_1006722 ) ) ( not ( = ?auto_1006726 ?auto_1006722 ) ) ( ON ?auto_1006720 ?auto_1006719 ) ( ON ?auto_1006721 ?auto_1006720 ) ( ON ?auto_1006722 ?auto_1006721 ) ( not ( = ?auto_1006719 ?auto_1006720 ) ) ( not ( = ?auto_1006719 ?auto_1006721 ) ) ( not ( = ?auto_1006719 ?auto_1006722 ) ) ( not ( = ?auto_1006719 ?auto_1006723 ) ) ( not ( = ?auto_1006719 ?auto_1006724 ) ) ( not ( = ?auto_1006719 ?auto_1006725 ) ) ( not ( = ?auto_1006719 ?auto_1006728 ) ) ( not ( = ?auto_1006719 ?auto_1006726 ) ) ( not ( = ?auto_1006720 ?auto_1006721 ) ) ( not ( = ?auto_1006720 ?auto_1006722 ) ) ( not ( = ?auto_1006720 ?auto_1006723 ) ) ( not ( = ?auto_1006720 ?auto_1006724 ) ) ( not ( = ?auto_1006720 ?auto_1006725 ) ) ( not ( = ?auto_1006720 ?auto_1006728 ) ) ( not ( = ?auto_1006720 ?auto_1006726 ) ) ( not ( = ?auto_1006721 ?auto_1006722 ) ) ( not ( = ?auto_1006721 ?auto_1006723 ) ) ( not ( = ?auto_1006721 ?auto_1006724 ) ) ( not ( = ?auto_1006721 ?auto_1006725 ) ) ( not ( = ?auto_1006721 ?auto_1006728 ) ) ( not ( = ?auto_1006721 ?auto_1006726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006723 ?auto_1006724 ?auto_1006725 )
      ( MAKE-6CRATE-VERIFY ?auto_1006719 ?auto_1006720 ?auto_1006721 ?auto_1006722 ?auto_1006723 ?auto_1006724 ?auto_1006725 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1006733 - SURFACE
      ?auto_1006734 - SURFACE
      ?auto_1006735 - SURFACE
      ?auto_1006736 - SURFACE
      ?auto_1006737 - SURFACE
      ?auto_1006738 - SURFACE
      ?auto_1006739 - SURFACE
      ?auto_1006740 - SURFACE
    )
    :vars
    (
      ?auto_1006747 - HOIST
      ?auto_1006745 - PLACE
      ?auto_1006744 - PLACE
      ?auto_1006746 - HOIST
      ?auto_1006743 - SURFACE
      ?auto_1006741 - SURFACE
      ?auto_1006742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006747 ?auto_1006745 ) ( IS-CRATE ?auto_1006740 ) ( not ( = ?auto_1006739 ?auto_1006740 ) ) ( not ( = ?auto_1006738 ?auto_1006739 ) ) ( not ( = ?auto_1006738 ?auto_1006740 ) ) ( not ( = ?auto_1006744 ?auto_1006745 ) ) ( HOIST-AT ?auto_1006746 ?auto_1006744 ) ( not ( = ?auto_1006747 ?auto_1006746 ) ) ( SURFACE-AT ?auto_1006740 ?auto_1006744 ) ( ON ?auto_1006740 ?auto_1006743 ) ( CLEAR ?auto_1006740 ) ( not ( = ?auto_1006739 ?auto_1006743 ) ) ( not ( = ?auto_1006740 ?auto_1006743 ) ) ( not ( = ?auto_1006738 ?auto_1006743 ) ) ( IS-CRATE ?auto_1006739 ) ( AVAILABLE ?auto_1006746 ) ( SURFACE-AT ?auto_1006739 ?auto_1006744 ) ( ON ?auto_1006739 ?auto_1006741 ) ( CLEAR ?auto_1006739 ) ( not ( = ?auto_1006739 ?auto_1006741 ) ) ( not ( = ?auto_1006740 ?auto_1006741 ) ) ( not ( = ?auto_1006738 ?auto_1006741 ) ) ( not ( = ?auto_1006743 ?auto_1006741 ) ) ( TRUCK-AT ?auto_1006742 ?auto_1006745 ) ( SURFACE-AT ?auto_1006737 ?auto_1006745 ) ( CLEAR ?auto_1006737 ) ( LIFTING ?auto_1006747 ?auto_1006738 ) ( IS-CRATE ?auto_1006738 ) ( not ( = ?auto_1006737 ?auto_1006738 ) ) ( not ( = ?auto_1006739 ?auto_1006737 ) ) ( not ( = ?auto_1006740 ?auto_1006737 ) ) ( not ( = ?auto_1006743 ?auto_1006737 ) ) ( not ( = ?auto_1006741 ?auto_1006737 ) ) ( ON ?auto_1006734 ?auto_1006733 ) ( ON ?auto_1006735 ?auto_1006734 ) ( ON ?auto_1006736 ?auto_1006735 ) ( ON ?auto_1006737 ?auto_1006736 ) ( not ( = ?auto_1006733 ?auto_1006734 ) ) ( not ( = ?auto_1006733 ?auto_1006735 ) ) ( not ( = ?auto_1006733 ?auto_1006736 ) ) ( not ( = ?auto_1006733 ?auto_1006737 ) ) ( not ( = ?auto_1006733 ?auto_1006738 ) ) ( not ( = ?auto_1006733 ?auto_1006739 ) ) ( not ( = ?auto_1006733 ?auto_1006740 ) ) ( not ( = ?auto_1006733 ?auto_1006743 ) ) ( not ( = ?auto_1006733 ?auto_1006741 ) ) ( not ( = ?auto_1006734 ?auto_1006735 ) ) ( not ( = ?auto_1006734 ?auto_1006736 ) ) ( not ( = ?auto_1006734 ?auto_1006737 ) ) ( not ( = ?auto_1006734 ?auto_1006738 ) ) ( not ( = ?auto_1006734 ?auto_1006739 ) ) ( not ( = ?auto_1006734 ?auto_1006740 ) ) ( not ( = ?auto_1006734 ?auto_1006743 ) ) ( not ( = ?auto_1006734 ?auto_1006741 ) ) ( not ( = ?auto_1006735 ?auto_1006736 ) ) ( not ( = ?auto_1006735 ?auto_1006737 ) ) ( not ( = ?auto_1006735 ?auto_1006738 ) ) ( not ( = ?auto_1006735 ?auto_1006739 ) ) ( not ( = ?auto_1006735 ?auto_1006740 ) ) ( not ( = ?auto_1006735 ?auto_1006743 ) ) ( not ( = ?auto_1006735 ?auto_1006741 ) ) ( not ( = ?auto_1006736 ?auto_1006737 ) ) ( not ( = ?auto_1006736 ?auto_1006738 ) ) ( not ( = ?auto_1006736 ?auto_1006739 ) ) ( not ( = ?auto_1006736 ?auto_1006740 ) ) ( not ( = ?auto_1006736 ?auto_1006743 ) ) ( not ( = ?auto_1006736 ?auto_1006741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006738 ?auto_1006739 ?auto_1006740 )
      ( MAKE-7CRATE-VERIFY ?auto_1006733 ?auto_1006734 ?auto_1006735 ?auto_1006736 ?auto_1006737 ?auto_1006738 ?auto_1006739 ?auto_1006740 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1006748 - SURFACE
      ?auto_1006749 - SURFACE
      ?auto_1006750 - SURFACE
      ?auto_1006751 - SURFACE
      ?auto_1006752 - SURFACE
      ?auto_1006753 - SURFACE
      ?auto_1006754 - SURFACE
      ?auto_1006755 - SURFACE
      ?auto_1006756 - SURFACE
    )
    :vars
    (
      ?auto_1006763 - HOIST
      ?auto_1006761 - PLACE
      ?auto_1006760 - PLACE
      ?auto_1006762 - HOIST
      ?auto_1006759 - SURFACE
      ?auto_1006757 - SURFACE
      ?auto_1006758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006763 ?auto_1006761 ) ( IS-CRATE ?auto_1006756 ) ( not ( = ?auto_1006755 ?auto_1006756 ) ) ( not ( = ?auto_1006754 ?auto_1006755 ) ) ( not ( = ?auto_1006754 ?auto_1006756 ) ) ( not ( = ?auto_1006760 ?auto_1006761 ) ) ( HOIST-AT ?auto_1006762 ?auto_1006760 ) ( not ( = ?auto_1006763 ?auto_1006762 ) ) ( SURFACE-AT ?auto_1006756 ?auto_1006760 ) ( ON ?auto_1006756 ?auto_1006759 ) ( CLEAR ?auto_1006756 ) ( not ( = ?auto_1006755 ?auto_1006759 ) ) ( not ( = ?auto_1006756 ?auto_1006759 ) ) ( not ( = ?auto_1006754 ?auto_1006759 ) ) ( IS-CRATE ?auto_1006755 ) ( AVAILABLE ?auto_1006762 ) ( SURFACE-AT ?auto_1006755 ?auto_1006760 ) ( ON ?auto_1006755 ?auto_1006757 ) ( CLEAR ?auto_1006755 ) ( not ( = ?auto_1006755 ?auto_1006757 ) ) ( not ( = ?auto_1006756 ?auto_1006757 ) ) ( not ( = ?auto_1006754 ?auto_1006757 ) ) ( not ( = ?auto_1006759 ?auto_1006757 ) ) ( TRUCK-AT ?auto_1006758 ?auto_1006761 ) ( SURFACE-AT ?auto_1006753 ?auto_1006761 ) ( CLEAR ?auto_1006753 ) ( LIFTING ?auto_1006763 ?auto_1006754 ) ( IS-CRATE ?auto_1006754 ) ( not ( = ?auto_1006753 ?auto_1006754 ) ) ( not ( = ?auto_1006755 ?auto_1006753 ) ) ( not ( = ?auto_1006756 ?auto_1006753 ) ) ( not ( = ?auto_1006759 ?auto_1006753 ) ) ( not ( = ?auto_1006757 ?auto_1006753 ) ) ( ON ?auto_1006749 ?auto_1006748 ) ( ON ?auto_1006750 ?auto_1006749 ) ( ON ?auto_1006751 ?auto_1006750 ) ( ON ?auto_1006752 ?auto_1006751 ) ( ON ?auto_1006753 ?auto_1006752 ) ( not ( = ?auto_1006748 ?auto_1006749 ) ) ( not ( = ?auto_1006748 ?auto_1006750 ) ) ( not ( = ?auto_1006748 ?auto_1006751 ) ) ( not ( = ?auto_1006748 ?auto_1006752 ) ) ( not ( = ?auto_1006748 ?auto_1006753 ) ) ( not ( = ?auto_1006748 ?auto_1006754 ) ) ( not ( = ?auto_1006748 ?auto_1006755 ) ) ( not ( = ?auto_1006748 ?auto_1006756 ) ) ( not ( = ?auto_1006748 ?auto_1006759 ) ) ( not ( = ?auto_1006748 ?auto_1006757 ) ) ( not ( = ?auto_1006749 ?auto_1006750 ) ) ( not ( = ?auto_1006749 ?auto_1006751 ) ) ( not ( = ?auto_1006749 ?auto_1006752 ) ) ( not ( = ?auto_1006749 ?auto_1006753 ) ) ( not ( = ?auto_1006749 ?auto_1006754 ) ) ( not ( = ?auto_1006749 ?auto_1006755 ) ) ( not ( = ?auto_1006749 ?auto_1006756 ) ) ( not ( = ?auto_1006749 ?auto_1006759 ) ) ( not ( = ?auto_1006749 ?auto_1006757 ) ) ( not ( = ?auto_1006750 ?auto_1006751 ) ) ( not ( = ?auto_1006750 ?auto_1006752 ) ) ( not ( = ?auto_1006750 ?auto_1006753 ) ) ( not ( = ?auto_1006750 ?auto_1006754 ) ) ( not ( = ?auto_1006750 ?auto_1006755 ) ) ( not ( = ?auto_1006750 ?auto_1006756 ) ) ( not ( = ?auto_1006750 ?auto_1006759 ) ) ( not ( = ?auto_1006750 ?auto_1006757 ) ) ( not ( = ?auto_1006751 ?auto_1006752 ) ) ( not ( = ?auto_1006751 ?auto_1006753 ) ) ( not ( = ?auto_1006751 ?auto_1006754 ) ) ( not ( = ?auto_1006751 ?auto_1006755 ) ) ( not ( = ?auto_1006751 ?auto_1006756 ) ) ( not ( = ?auto_1006751 ?auto_1006759 ) ) ( not ( = ?auto_1006751 ?auto_1006757 ) ) ( not ( = ?auto_1006752 ?auto_1006753 ) ) ( not ( = ?auto_1006752 ?auto_1006754 ) ) ( not ( = ?auto_1006752 ?auto_1006755 ) ) ( not ( = ?auto_1006752 ?auto_1006756 ) ) ( not ( = ?auto_1006752 ?auto_1006759 ) ) ( not ( = ?auto_1006752 ?auto_1006757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006754 ?auto_1006755 ?auto_1006756 )
      ( MAKE-8CRATE-VERIFY ?auto_1006748 ?auto_1006749 ?auto_1006750 ?auto_1006751 ?auto_1006752 ?auto_1006753 ?auto_1006754 ?auto_1006755 ?auto_1006756 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1006764 - SURFACE
      ?auto_1006765 - SURFACE
      ?auto_1006766 - SURFACE
      ?auto_1006767 - SURFACE
      ?auto_1006768 - SURFACE
      ?auto_1006769 - SURFACE
      ?auto_1006770 - SURFACE
      ?auto_1006771 - SURFACE
      ?auto_1006772 - SURFACE
      ?auto_1006773 - SURFACE
    )
    :vars
    (
      ?auto_1006780 - HOIST
      ?auto_1006778 - PLACE
      ?auto_1006777 - PLACE
      ?auto_1006779 - HOIST
      ?auto_1006776 - SURFACE
      ?auto_1006774 - SURFACE
      ?auto_1006775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006780 ?auto_1006778 ) ( IS-CRATE ?auto_1006773 ) ( not ( = ?auto_1006772 ?auto_1006773 ) ) ( not ( = ?auto_1006771 ?auto_1006772 ) ) ( not ( = ?auto_1006771 ?auto_1006773 ) ) ( not ( = ?auto_1006777 ?auto_1006778 ) ) ( HOIST-AT ?auto_1006779 ?auto_1006777 ) ( not ( = ?auto_1006780 ?auto_1006779 ) ) ( SURFACE-AT ?auto_1006773 ?auto_1006777 ) ( ON ?auto_1006773 ?auto_1006776 ) ( CLEAR ?auto_1006773 ) ( not ( = ?auto_1006772 ?auto_1006776 ) ) ( not ( = ?auto_1006773 ?auto_1006776 ) ) ( not ( = ?auto_1006771 ?auto_1006776 ) ) ( IS-CRATE ?auto_1006772 ) ( AVAILABLE ?auto_1006779 ) ( SURFACE-AT ?auto_1006772 ?auto_1006777 ) ( ON ?auto_1006772 ?auto_1006774 ) ( CLEAR ?auto_1006772 ) ( not ( = ?auto_1006772 ?auto_1006774 ) ) ( not ( = ?auto_1006773 ?auto_1006774 ) ) ( not ( = ?auto_1006771 ?auto_1006774 ) ) ( not ( = ?auto_1006776 ?auto_1006774 ) ) ( TRUCK-AT ?auto_1006775 ?auto_1006778 ) ( SURFACE-AT ?auto_1006770 ?auto_1006778 ) ( CLEAR ?auto_1006770 ) ( LIFTING ?auto_1006780 ?auto_1006771 ) ( IS-CRATE ?auto_1006771 ) ( not ( = ?auto_1006770 ?auto_1006771 ) ) ( not ( = ?auto_1006772 ?auto_1006770 ) ) ( not ( = ?auto_1006773 ?auto_1006770 ) ) ( not ( = ?auto_1006776 ?auto_1006770 ) ) ( not ( = ?auto_1006774 ?auto_1006770 ) ) ( ON ?auto_1006765 ?auto_1006764 ) ( ON ?auto_1006766 ?auto_1006765 ) ( ON ?auto_1006767 ?auto_1006766 ) ( ON ?auto_1006768 ?auto_1006767 ) ( ON ?auto_1006769 ?auto_1006768 ) ( ON ?auto_1006770 ?auto_1006769 ) ( not ( = ?auto_1006764 ?auto_1006765 ) ) ( not ( = ?auto_1006764 ?auto_1006766 ) ) ( not ( = ?auto_1006764 ?auto_1006767 ) ) ( not ( = ?auto_1006764 ?auto_1006768 ) ) ( not ( = ?auto_1006764 ?auto_1006769 ) ) ( not ( = ?auto_1006764 ?auto_1006770 ) ) ( not ( = ?auto_1006764 ?auto_1006771 ) ) ( not ( = ?auto_1006764 ?auto_1006772 ) ) ( not ( = ?auto_1006764 ?auto_1006773 ) ) ( not ( = ?auto_1006764 ?auto_1006776 ) ) ( not ( = ?auto_1006764 ?auto_1006774 ) ) ( not ( = ?auto_1006765 ?auto_1006766 ) ) ( not ( = ?auto_1006765 ?auto_1006767 ) ) ( not ( = ?auto_1006765 ?auto_1006768 ) ) ( not ( = ?auto_1006765 ?auto_1006769 ) ) ( not ( = ?auto_1006765 ?auto_1006770 ) ) ( not ( = ?auto_1006765 ?auto_1006771 ) ) ( not ( = ?auto_1006765 ?auto_1006772 ) ) ( not ( = ?auto_1006765 ?auto_1006773 ) ) ( not ( = ?auto_1006765 ?auto_1006776 ) ) ( not ( = ?auto_1006765 ?auto_1006774 ) ) ( not ( = ?auto_1006766 ?auto_1006767 ) ) ( not ( = ?auto_1006766 ?auto_1006768 ) ) ( not ( = ?auto_1006766 ?auto_1006769 ) ) ( not ( = ?auto_1006766 ?auto_1006770 ) ) ( not ( = ?auto_1006766 ?auto_1006771 ) ) ( not ( = ?auto_1006766 ?auto_1006772 ) ) ( not ( = ?auto_1006766 ?auto_1006773 ) ) ( not ( = ?auto_1006766 ?auto_1006776 ) ) ( not ( = ?auto_1006766 ?auto_1006774 ) ) ( not ( = ?auto_1006767 ?auto_1006768 ) ) ( not ( = ?auto_1006767 ?auto_1006769 ) ) ( not ( = ?auto_1006767 ?auto_1006770 ) ) ( not ( = ?auto_1006767 ?auto_1006771 ) ) ( not ( = ?auto_1006767 ?auto_1006772 ) ) ( not ( = ?auto_1006767 ?auto_1006773 ) ) ( not ( = ?auto_1006767 ?auto_1006776 ) ) ( not ( = ?auto_1006767 ?auto_1006774 ) ) ( not ( = ?auto_1006768 ?auto_1006769 ) ) ( not ( = ?auto_1006768 ?auto_1006770 ) ) ( not ( = ?auto_1006768 ?auto_1006771 ) ) ( not ( = ?auto_1006768 ?auto_1006772 ) ) ( not ( = ?auto_1006768 ?auto_1006773 ) ) ( not ( = ?auto_1006768 ?auto_1006776 ) ) ( not ( = ?auto_1006768 ?auto_1006774 ) ) ( not ( = ?auto_1006769 ?auto_1006770 ) ) ( not ( = ?auto_1006769 ?auto_1006771 ) ) ( not ( = ?auto_1006769 ?auto_1006772 ) ) ( not ( = ?auto_1006769 ?auto_1006773 ) ) ( not ( = ?auto_1006769 ?auto_1006776 ) ) ( not ( = ?auto_1006769 ?auto_1006774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006771 ?auto_1006772 ?auto_1006773 )
      ( MAKE-9CRATE-VERIFY ?auto_1006764 ?auto_1006765 ?auto_1006766 ?auto_1006767 ?auto_1006768 ?auto_1006769 ?auto_1006770 ?auto_1006771 ?auto_1006772 ?auto_1006773 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1006781 - SURFACE
      ?auto_1006782 - SURFACE
      ?auto_1006783 - SURFACE
      ?auto_1006784 - SURFACE
      ?auto_1006785 - SURFACE
      ?auto_1006786 - SURFACE
      ?auto_1006787 - SURFACE
      ?auto_1006788 - SURFACE
      ?auto_1006789 - SURFACE
      ?auto_1006790 - SURFACE
      ?auto_1006791 - SURFACE
    )
    :vars
    (
      ?auto_1006798 - HOIST
      ?auto_1006796 - PLACE
      ?auto_1006795 - PLACE
      ?auto_1006797 - HOIST
      ?auto_1006794 - SURFACE
      ?auto_1006792 - SURFACE
      ?auto_1006793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006798 ?auto_1006796 ) ( IS-CRATE ?auto_1006791 ) ( not ( = ?auto_1006790 ?auto_1006791 ) ) ( not ( = ?auto_1006789 ?auto_1006790 ) ) ( not ( = ?auto_1006789 ?auto_1006791 ) ) ( not ( = ?auto_1006795 ?auto_1006796 ) ) ( HOIST-AT ?auto_1006797 ?auto_1006795 ) ( not ( = ?auto_1006798 ?auto_1006797 ) ) ( SURFACE-AT ?auto_1006791 ?auto_1006795 ) ( ON ?auto_1006791 ?auto_1006794 ) ( CLEAR ?auto_1006791 ) ( not ( = ?auto_1006790 ?auto_1006794 ) ) ( not ( = ?auto_1006791 ?auto_1006794 ) ) ( not ( = ?auto_1006789 ?auto_1006794 ) ) ( IS-CRATE ?auto_1006790 ) ( AVAILABLE ?auto_1006797 ) ( SURFACE-AT ?auto_1006790 ?auto_1006795 ) ( ON ?auto_1006790 ?auto_1006792 ) ( CLEAR ?auto_1006790 ) ( not ( = ?auto_1006790 ?auto_1006792 ) ) ( not ( = ?auto_1006791 ?auto_1006792 ) ) ( not ( = ?auto_1006789 ?auto_1006792 ) ) ( not ( = ?auto_1006794 ?auto_1006792 ) ) ( TRUCK-AT ?auto_1006793 ?auto_1006796 ) ( SURFACE-AT ?auto_1006788 ?auto_1006796 ) ( CLEAR ?auto_1006788 ) ( LIFTING ?auto_1006798 ?auto_1006789 ) ( IS-CRATE ?auto_1006789 ) ( not ( = ?auto_1006788 ?auto_1006789 ) ) ( not ( = ?auto_1006790 ?auto_1006788 ) ) ( not ( = ?auto_1006791 ?auto_1006788 ) ) ( not ( = ?auto_1006794 ?auto_1006788 ) ) ( not ( = ?auto_1006792 ?auto_1006788 ) ) ( ON ?auto_1006782 ?auto_1006781 ) ( ON ?auto_1006783 ?auto_1006782 ) ( ON ?auto_1006784 ?auto_1006783 ) ( ON ?auto_1006785 ?auto_1006784 ) ( ON ?auto_1006786 ?auto_1006785 ) ( ON ?auto_1006787 ?auto_1006786 ) ( ON ?auto_1006788 ?auto_1006787 ) ( not ( = ?auto_1006781 ?auto_1006782 ) ) ( not ( = ?auto_1006781 ?auto_1006783 ) ) ( not ( = ?auto_1006781 ?auto_1006784 ) ) ( not ( = ?auto_1006781 ?auto_1006785 ) ) ( not ( = ?auto_1006781 ?auto_1006786 ) ) ( not ( = ?auto_1006781 ?auto_1006787 ) ) ( not ( = ?auto_1006781 ?auto_1006788 ) ) ( not ( = ?auto_1006781 ?auto_1006789 ) ) ( not ( = ?auto_1006781 ?auto_1006790 ) ) ( not ( = ?auto_1006781 ?auto_1006791 ) ) ( not ( = ?auto_1006781 ?auto_1006794 ) ) ( not ( = ?auto_1006781 ?auto_1006792 ) ) ( not ( = ?auto_1006782 ?auto_1006783 ) ) ( not ( = ?auto_1006782 ?auto_1006784 ) ) ( not ( = ?auto_1006782 ?auto_1006785 ) ) ( not ( = ?auto_1006782 ?auto_1006786 ) ) ( not ( = ?auto_1006782 ?auto_1006787 ) ) ( not ( = ?auto_1006782 ?auto_1006788 ) ) ( not ( = ?auto_1006782 ?auto_1006789 ) ) ( not ( = ?auto_1006782 ?auto_1006790 ) ) ( not ( = ?auto_1006782 ?auto_1006791 ) ) ( not ( = ?auto_1006782 ?auto_1006794 ) ) ( not ( = ?auto_1006782 ?auto_1006792 ) ) ( not ( = ?auto_1006783 ?auto_1006784 ) ) ( not ( = ?auto_1006783 ?auto_1006785 ) ) ( not ( = ?auto_1006783 ?auto_1006786 ) ) ( not ( = ?auto_1006783 ?auto_1006787 ) ) ( not ( = ?auto_1006783 ?auto_1006788 ) ) ( not ( = ?auto_1006783 ?auto_1006789 ) ) ( not ( = ?auto_1006783 ?auto_1006790 ) ) ( not ( = ?auto_1006783 ?auto_1006791 ) ) ( not ( = ?auto_1006783 ?auto_1006794 ) ) ( not ( = ?auto_1006783 ?auto_1006792 ) ) ( not ( = ?auto_1006784 ?auto_1006785 ) ) ( not ( = ?auto_1006784 ?auto_1006786 ) ) ( not ( = ?auto_1006784 ?auto_1006787 ) ) ( not ( = ?auto_1006784 ?auto_1006788 ) ) ( not ( = ?auto_1006784 ?auto_1006789 ) ) ( not ( = ?auto_1006784 ?auto_1006790 ) ) ( not ( = ?auto_1006784 ?auto_1006791 ) ) ( not ( = ?auto_1006784 ?auto_1006794 ) ) ( not ( = ?auto_1006784 ?auto_1006792 ) ) ( not ( = ?auto_1006785 ?auto_1006786 ) ) ( not ( = ?auto_1006785 ?auto_1006787 ) ) ( not ( = ?auto_1006785 ?auto_1006788 ) ) ( not ( = ?auto_1006785 ?auto_1006789 ) ) ( not ( = ?auto_1006785 ?auto_1006790 ) ) ( not ( = ?auto_1006785 ?auto_1006791 ) ) ( not ( = ?auto_1006785 ?auto_1006794 ) ) ( not ( = ?auto_1006785 ?auto_1006792 ) ) ( not ( = ?auto_1006786 ?auto_1006787 ) ) ( not ( = ?auto_1006786 ?auto_1006788 ) ) ( not ( = ?auto_1006786 ?auto_1006789 ) ) ( not ( = ?auto_1006786 ?auto_1006790 ) ) ( not ( = ?auto_1006786 ?auto_1006791 ) ) ( not ( = ?auto_1006786 ?auto_1006794 ) ) ( not ( = ?auto_1006786 ?auto_1006792 ) ) ( not ( = ?auto_1006787 ?auto_1006788 ) ) ( not ( = ?auto_1006787 ?auto_1006789 ) ) ( not ( = ?auto_1006787 ?auto_1006790 ) ) ( not ( = ?auto_1006787 ?auto_1006791 ) ) ( not ( = ?auto_1006787 ?auto_1006794 ) ) ( not ( = ?auto_1006787 ?auto_1006792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006789 ?auto_1006790 ?auto_1006791 )
      ( MAKE-10CRATE-VERIFY ?auto_1006781 ?auto_1006782 ?auto_1006783 ?auto_1006784 ?auto_1006785 ?auto_1006786 ?auto_1006787 ?auto_1006788 ?auto_1006789 ?auto_1006790 ?auto_1006791 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1006799 - SURFACE
      ?auto_1006800 - SURFACE
      ?auto_1006801 - SURFACE
      ?auto_1006802 - SURFACE
      ?auto_1006803 - SURFACE
      ?auto_1006804 - SURFACE
      ?auto_1006805 - SURFACE
      ?auto_1006806 - SURFACE
      ?auto_1006807 - SURFACE
      ?auto_1006808 - SURFACE
      ?auto_1006809 - SURFACE
      ?auto_1006810 - SURFACE
    )
    :vars
    (
      ?auto_1006817 - HOIST
      ?auto_1006815 - PLACE
      ?auto_1006814 - PLACE
      ?auto_1006816 - HOIST
      ?auto_1006813 - SURFACE
      ?auto_1006811 - SURFACE
      ?auto_1006812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006817 ?auto_1006815 ) ( IS-CRATE ?auto_1006810 ) ( not ( = ?auto_1006809 ?auto_1006810 ) ) ( not ( = ?auto_1006808 ?auto_1006809 ) ) ( not ( = ?auto_1006808 ?auto_1006810 ) ) ( not ( = ?auto_1006814 ?auto_1006815 ) ) ( HOIST-AT ?auto_1006816 ?auto_1006814 ) ( not ( = ?auto_1006817 ?auto_1006816 ) ) ( SURFACE-AT ?auto_1006810 ?auto_1006814 ) ( ON ?auto_1006810 ?auto_1006813 ) ( CLEAR ?auto_1006810 ) ( not ( = ?auto_1006809 ?auto_1006813 ) ) ( not ( = ?auto_1006810 ?auto_1006813 ) ) ( not ( = ?auto_1006808 ?auto_1006813 ) ) ( IS-CRATE ?auto_1006809 ) ( AVAILABLE ?auto_1006816 ) ( SURFACE-AT ?auto_1006809 ?auto_1006814 ) ( ON ?auto_1006809 ?auto_1006811 ) ( CLEAR ?auto_1006809 ) ( not ( = ?auto_1006809 ?auto_1006811 ) ) ( not ( = ?auto_1006810 ?auto_1006811 ) ) ( not ( = ?auto_1006808 ?auto_1006811 ) ) ( not ( = ?auto_1006813 ?auto_1006811 ) ) ( TRUCK-AT ?auto_1006812 ?auto_1006815 ) ( SURFACE-AT ?auto_1006807 ?auto_1006815 ) ( CLEAR ?auto_1006807 ) ( LIFTING ?auto_1006817 ?auto_1006808 ) ( IS-CRATE ?auto_1006808 ) ( not ( = ?auto_1006807 ?auto_1006808 ) ) ( not ( = ?auto_1006809 ?auto_1006807 ) ) ( not ( = ?auto_1006810 ?auto_1006807 ) ) ( not ( = ?auto_1006813 ?auto_1006807 ) ) ( not ( = ?auto_1006811 ?auto_1006807 ) ) ( ON ?auto_1006800 ?auto_1006799 ) ( ON ?auto_1006801 ?auto_1006800 ) ( ON ?auto_1006802 ?auto_1006801 ) ( ON ?auto_1006803 ?auto_1006802 ) ( ON ?auto_1006804 ?auto_1006803 ) ( ON ?auto_1006805 ?auto_1006804 ) ( ON ?auto_1006806 ?auto_1006805 ) ( ON ?auto_1006807 ?auto_1006806 ) ( not ( = ?auto_1006799 ?auto_1006800 ) ) ( not ( = ?auto_1006799 ?auto_1006801 ) ) ( not ( = ?auto_1006799 ?auto_1006802 ) ) ( not ( = ?auto_1006799 ?auto_1006803 ) ) ( not ( = ?auto_1006799 ?auto_1006804 ) ) ( not ( = ?auto_1006799 ?auto_1006805 ) ) ( not ( = ?auto_1006799 ?auto_1006806 ) ) ( not ( = ?auto_1006799 ?auto_1006807 ) ) ( not ( = ?auto_1006799 ?auto_1006808 ) ) ( not ( = ?auto_1006799 ?auto_1006809 ) ) ( not ( = ?auto_1006799 ?auto_1006810 ) ) ( not ( = ?auto_1006799 ?auto_1006813 ) ) ( not ( = ?auto_1006799 ?auto_1006811 ) ) ( not ( = ?auto_1006800 ?auto_1006801 ) ) ( not ( = ?auto_1006800 ?auto_1006802 ) ) ( not ( = ?auto_1006800 ?auto_1006803 ) ) ( not ( = ?auto_1006800 ?auto_1006804 ) ) ( not ( = ?auto_1006800 ?auto_1006805 ) ) ( not ( = ?auto_1006800 ?auto_1006806 ) ) ( not ( = ?auto_1006800 ?auto_1006807 ) ) ( not ( = ?auto_1006800 ?auto_1006808 ) ) ( not ( = ?auto_1006800 ?auto_1006809 ) ) ( not ( = ?auto_1006800 ?auto_1006810 ) ) ( not ( = ?auto_1006800 ?auto_1006813 ) ) ( not ( = ?auto_1006800 ?auto_1006811 ) ) ( not ( = ?auto_1006801 ?auto_1006802 ) ) ( not ( = ?auto_1006801 ?auto_1006803 ) ) ( not ( = ?auto_1006801 ?auto_1006804 ) ) ( not ( = ?auto_1006801 ?auto_1006805 ) ) ( not ( = ?auto_1006801 ?auto_1006806 ) ) ( not ( = ?auto_1006801 ?auto_1006807 ) ) ( not ( = ?auto_1006801 ?auto_1006808 ) ) ( not ( = ?auto_1006801 ?auto_1006809 ) ) ( not ( = ?auto_1006801 ?auto_1006810 ) ) ( not ( = ?auto_1006801 ?auto_1006813 ) ) ( not ( = ?auto_1006801 ?auto_1006811 ) ) ( not ( = ?auto_1006802 ?auto_1006803 ) ) ( not ( = ?auto_1006802 ?auto_1006804 ) ) ( not ( = ?auto_1006802 ?auto_1006805 ) ) ( not ( = ?auto_1006802 ?auto_1006806 ) ) ( not ( = ?auto_1006802 ?auto_1006807 ) ) ( not ( = ?auto_1006802 ?auto_1006808 ) ) ( not ( = ?auto_1006802 ?auto_1006809 ) ) ( not ( = ?auto_1006802 ?auto_1006810 ) ) ( not ( = ?auto_1006802 ?auto_1006813 ) ) ( not ( = ?auto_1006802 ?auto_1006811 ) ) ( not ( = ?auto_1006803 ?auto_1006804 ) ) ( not ( = ?auto_1006803 ?auto_1006805 ) ) ( not ( = ?auto_1006803 ?auto_1006806 ) ) ( not ( = ?auto_1006803 ?auto_1006807 ) ) ( not ( = ?auto_1006803 ?auto_1006808 ) ) ( not ( = ?auto_1006803 ?auto_1006809 ) ) ( not ( = ?auto_1006803 ?auto_1006810 ) ) ( not ( = ?auto_1006803 ?auto_1006813 ) ) ( not ( = ?auto_1006803 ?auto_1006811 ) ) ( not ( = ?auto_1006804 ?auto_1006805 ) ) ( not ( = ?auto_1006804 ?auto_1006806 ) ) ( not ( = ?auto_1006804 ?auto_1006807 ) ) ( not ( = ?auto_1006804 ?auto_1006808 ) ) ( not ( = ?auto_1006804 ?auto_1006809 ) ) ( not ( = ?auto_1006804 ?auto_1006810 ) ) ( not ( = ?auto_1006804 ?auto_1006813 ) ) ( not ( = ?auto_1006804 ?auto_1006811 ) ) ( not ( = ?auto_1006805 ?auto_1006806 ) ) ( not ( = ?auto_1006805 ?auto_1006807 ) ) ( not ( = ?auto_1006805 ?auto_1006808 ) ) ( not ( = ?auto_1006805 ?auto_1006809 ) ) ( not ( = ?auto_1006805 ?auto_1006810 ) ) ( not ( = ?auto_1006805 ?auto_1006813 ) ) ( not ( = ?auto_1006805 ?auto_1006811 ) ) ( not ( = ?auto_1006806 ?auto_1006807 ) ) ( not ( = ?auto_1006806 ?auto_1006808 ) ) ( not ( = ?auto_1006806 ?auto_1006809 ) ) ( not ( = ?auto_1006806 ?auto_1006810 ) ) ( not ( = ?auto_1006806 ?auto_1006813 ) ) ( not ( = ?auto_1006806 ?auto_1006811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1006808 ?auto_1006809 ?auto_1006810 )
      ( MAKE-11CRATE-VERIFY ?auto_1006799 ?auto_1006800 ?auto_1006801 ?auto_1006802 ?auto_1006803 ?auto_1006804 ?auto_1006805 ?auto_1006806 ?auto_1006807 ?auto_1006808 ?auto_1006809 ?auto_1006810 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1009842 - SURFACE
      ?auto_1009843 - SURFACE
    )
    :vars
    (
      ?auto_1009846 - HOIST
      ?auto_1009851 - PLACE
      ?auto_1009844 - SURFACE
      ?auto_1009847 - PLACE
      ?auto_1009848 - HOIST
      ?auto_1009849 - SURFACE
      ?auto_1009850 - TRUCK
      ?auto_1009845 - SURFACE
      ?auto_1009852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1009846 ?auto_1009851 ) ( IS-CRATE ?auto_1009843 ) ( not ( = ?auto_1009842 ?auto_1009843 ) ) ( not ( = ?auto_1009844 ?auto_1009842 ) ) ( not ( = ?auto_1009844 ?auto_1009843 ) ) ( not ( = ?auto_1009847 ?auto_1009851 ) ) ( HOIST-AT ?auto_1009848 ?auto_1009847 ) ( not ( = ?auto_1009846 ?auto_1009848 ) ) ( SURFACE-AT ?auto_1009843 ?auto_1009847 ) ( ON ?auto_1009843 ?auto_1009849 ) ( CLEAR ?auto_1009843 ) ( not ( = ?auto_1009842 ?auto_1009849 ) ) ( not ( = ?auto_1009843 ?auto_1009849 ) ) ( not ( = ?auto_1009844 ?auto_1009849 ) ) ( SURFACE-AT ?auto_1009844 ?auto_1009851 ) ( CLEAR ?auto_1009844 ) ( IS-CRATE ?auto_1009842 ) ( AVAILABLE ?auto_1009846 ) ( TRUCK-AT ?auto_1009850 ?auto_1009847 ) ( SURFACE-AT ?auto_1009842 ?auto_1009847 ) ( ON ?auto_1009842 ?auto_1009845 ) ( CLEAR ?auto_1009842 ) ( not ( = ?auto_1009842 ?auto_1009845 ) ) ( not ( = ?auto_1009843 ?auto_1009845 ) ) ( not ( = ?auto_1009844 ?auto_1009845 ) ) ( not ( = ?auto_1009849 ?auto_1009845 ) ) ( LIFTING ?auto_1009848 ?auto_1009852 ) ( IS-CRATE ?auto_1009852 ) ( not ( = ?auto_1009842 ?auto_1009852 ) ) ( not ( = ?auto_1009843 ?auto_1009852 ) ) ( not ( = ?auto_1009844 ?auto_1009852 ) ) ( not ( = ?auto_1009849 ?auto_1009852 ) ) ( not ( = ?auto_1009845 ?auto_1009852 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1009848 ?auto_1009852 ?auto_1009850 ?auto_1009847 )
      ( MAKE-2CRATE ?auto_1009844 ?auto_1009842 ?auto_1009843 )
      ( MAKE-1CRATE-VERIFY ?auto_1009842 ?auto_1009843 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1009853 - SURFACE
      ?auto_1009854 - SURFACE
      ?auto_1009855 - SURFACE
    )
    :vars
    (
      ?auto_1009859 - HOIST
      ?auto_1009858 - PLACE
      ?auto_1009861 - PLACE
      ?auto_1009862 - HOIST
      ?auto_1009857 - SURFACE
      ?auto_1009860 - TRUCK
      ?auto_1009856 - SURFACE
      ?auto_1009863 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1009859 ?auto_1009858 ) ( IS-CRATE ?auto_1009855 ) ( not ( = ?auto_1009854 ?auto_1009855 ) ) ( not ( = ?auto_1009853 ?auto_1009854 ) ) ( not ( = ?auto_1009853 ?auto_1009855 ) ) ( not ( = ?auto_1009861 ?auto_1009858 ) ) ( HOIST-AT ?auto_1009862 ?auto_1009861 ) ( not ( = ?auto_1009859 ?auto_1009862 ) ) ( SURFACE-AT ?auto_1009855 ?auto_1009861 ) ( ON ?auto_1009855 ?auto_1009857 ) ( CLEAR ?auto_1009855 ) ( not ( = ?auto_1009854 ?auto_1009857 ) ) ( not ( = ?auto_1009855 ?auto_1009857 ) ) ( not ( = ?auto_1009853 ?auto_1009857 ) ) ( SURFACE-AT ?auto_1009853 ?auto_1009858 ) ( CLEAR ?auto_1009853 ) ( IS-CRATE ?auto_1009854 ) ( AVAILABLE ?auto_1009859 ) ( TRUCK-AT ?auto_1009860 ?auto_1009861 ) ( SURFACE-AT ?auto_1009854 ?auto_1009861 ) ( ON ?auto_1009854 ?auto_1009856 ) ( CLEAR ?auto_1009854 ) ( not ( = ?auto_1009854 ?auto_1009856 ) ) ( not ( = ?auto_1009855 ?auto_1009856 ) ) ( not ( = ?auto_1009853 ?auto_1009856 ) ) ( not ( = ?auto_1009857 ?auto_1009856 ) ) ( LIFTING ?auto_1009862 ?auto_1009863 ) ( IS-CRATE ?auto_1009863 ) ( not ( = ?auto_1009854 ?auto_1009863 ) ) ( not ( = ?auto_1009855 ?auto_1009863 ) ) ( not ( = ?auto_1009853 ?auto_1009863 ) ) ( not ( = ?auto_1009857 ?auto_1009863 ) ) ( not ( = ?auto_1009856 ?auto_1009863 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1009854 ?auto_1009855 )
      ( MAKE-2CRATE-VERIFY ?auto_1009853 ?auto_1009854 ?auto_1009855 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015061 - SURFACE
      ?auto_1015062 - SURFACE
      ?auto_1015063 - SURFACE
      ?auto_1015064 - SURFACE
      ?auto_1015065 - SURFACE
      ?auto_1015066 - SURFACE
      ?auto_1015067 - SURFACE
      ?auto_1015068 - SURFACE
      ?auto_1015069 - SURFACE
      ?auto_1015070 - SURFACE
      ?auto_1015071 - SURFACE
      ?auto_1015072 - SURFACE
      ?auto_1015073 - SURFACE
    )
    :vars
    (
      ?auto_1015075 - HOIST
      ?auto_1015074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015075 ?auto_1015074 ) ( SURFACE-AT ?auto_1015072 ?auto_1015074 ) ( CLEAR ?auto_1015072 ) ( LIFTING ?auto_1015075 ?auto_1015073 ) ( IS-CRATE ?auto_1015073 ) ( not ( = ?auto_1015072 ?auto_1015073 ) ) ( ON ?auto_1015062 ?auto_1015061 ) ( ON ?auto_1015063 ?auto_1015062 ) ( ON ?auto_1015064 ?auto_1015063 ) ( ON ?auto_1015065 ?auto_1015064 ) ( ON ?auto_1015066 ?auto_1015065 ) ( ON ?auto_1015067 ?auto_1015066 ) ( ON ?auto_1015068 ?auto_1015067 ) ( ON ?auto_1015069 ?auto_1015068 ) ( ON ?auto_1015070 ?auto_1015069 ) ( ON ?auto_1015071 ?auto_1015070 ) ( ON ?auto_1015072 ?auto_1015071 ) ( not ( = ?auto_1015061 ?auto_1015062 ) ) ( not ( = ?auto_1015061 ?auto_1015063 ) ) ( not ( = ?auto_1015061 ?auto_1015064 ) ) ( not ( = ?auto_1015061 ?auto_1015065 ) ) ( not ( = ?auto_1015061 ?auto_1015066 ) ) ( not ( = ?auto_1015061 ?auto_1015067 ) ) ( not ( = ?auto_1015061 ?auto_1015068 ) ) ( not ( = ?auto_1015061 ?auto_1015069 ) ) ( not ( = ?auto_1015061 ?auto_1015070 ) ) ( not ( = ?auto_1015061 ?auto_1015071 ) ) ( not ( = ?auto_1015061 ?auto_1015072 ) ) ( not ( = ?auto_1015061 ?auto_1015073 ) ) ( not ( = ?auto_1015062 ?auto_1015063 ) ) ( not ( = ?auto_1015062 ?auto_1015064 ) ) ( not ( = ?auto_1015062 ?auto_1015065 ) ) ( not ( = ?auto_1015062 ?auto_1015066 ) ) ( not ( = ?auto_1015062 ?auto_1015067 ) ) ( not ( = ?auto_1015062 ?auto_1015068 ) ) ( not ( = ?auto_1015062 ?auto_1015069 ) ) ( not ( = ?auto_1015062 ?auto_1015070 ) ) ( not ( = ?auto_1015062 ?auto_1015071 ) ) ( not ( = ?auto_1015062 ?auto_1015072 ) ) ( not ( = ?auto_1015062 ?auto_1015073 ) ) ( not ( = ?auto_1015063 ?auto_1015064 ) ) ( not ( = ?auto_1015063 ?auto_1015065 ) ) ( not ( = ?auto_1015063 ?auto_1015066 ) ) ( not ( = ?auto_1015063 ?auto_1015067 ) ) ( not ( = ?auto_1015063 ?auto_1015068 ) ) ( not ( = ?auto_1015063 ?auto_1015069 ) ) ( not ( = ?auto_1015063 ?auto_1015070 ) ) ( not ( = ?auto_1015063 ?auto_1015071 ) ) ( not ( = ?auto_1015063 ?auto_1015072 ) ) ( not ( = ?auto_1015063 ?auto_1015073 ) ) ( not ( = ?auto_1015064 ?auto_1015065 ) ) ( not ( = ?auto_1015064 ?auto_1015066 ) ) ( not ( = ?auto_1015064 ?auto_1015067 ) ) ( not ( = ?auto_1015064 ?auto_1015068 ) ) ( not ( = ?auto_1015064 ?auto_1015069 ) ) ( not ( = ?auto_1015064 ?auto_1015070 ) ) ( not ( = ?auto_1015064 ?auto_1015071 ) ) ( not ( = ?auto_1015064 ?auto_1015072 ) ) ( not ( = ?auto_1015064 ?auto_1015073 ) ) ( not ( = ?auto_1015065 ?auto_1015066 ) ) ( not ( = ?auto_1015065 ?auto_1015067 ) ) ( not ( = ?auto_1015065 ?auto_1015068 ) ) ( not ( = ?auto_1015065 ?auto_1015069 ) ) ( not ( = ?auto_1015065 ?auto_1015070 ) ) ( not ( = ?auto_1015065 ?auto_1015071 ) ) ( not ( = ?auto_1015065 ?auto_1015072 ) ) ( not ( = ?auto_1015065 ?auto_1015073 ) ) ( not ( = ?auto_1015066 ?auto_1015067 ) ) ( not ( = ?auto_1015066 ?auto_1015068 ) ) ( not ( = ?auto_1015066 ?auto_1015069 ) ) ( not ( = ?auto_1015066 ?auto_1015070 ) ) ( not ( = ?auto_1015066 ?auto_1015071 ) ) ( not ( = ?auto_1015066 ?auto_1015072 ) ) ( not ( = ?auto_1015066 ?auto_1015073 ) ) ( not ( = ?auto_1015067 ?auto_1015068 ) ) ( not ( = ?auto_1015067 ?auto_1015069 ) ) ( not ( = ?auto_1015067 ?auto_1015070 ) ) ( not ( = ?auto_1015067 ?auto_1015071 ) ) ( not ( = ?auto_1015067 ?auto_1015072 ) ) ( not ( = ?auto_1015067 ?auto_1015073 ) ) ( not ( = ?auto_1015068 ?auto_1015069 ) ) ( not ( = ?auto_1015068 ?auto_1015070 ) ) ( not ( = ?auto_1015068 ?auto_1015071 ) ) ( not ( = ?auto_1015068 ?auto_1015072 ) ) ( not ( = ?auto_1015068 ?auto_1015073 ) ) ( not ( = ?auto_1015069 ?auto_1015070 ) ) ( not ( = ?auto_1015069 ?auto_1015071 ) ) ( not ( = ?auto_1015069 ?auto_1015072 ) ) ( not ( = ?auto_1015069 ?auto_1015073 ) ) ( not ( = ?auto_1015070 ?auto_1015071 ) ) ( not ( = ?auto_1015070 ?auto_1015072 ) ) ( not ( = ?auto_1015070 ?auto_1015073 ) ) ( not ( = ?auto_1015071 ?auto_1015072 ) ) ( not ( = ?auto_1015071 ?auto_1015073 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1015072 ?auto_1015073 )
      ( MAKE-12CRATE-VERIFY ?auto_1015061 ?auto_1015062 ?auto_1015063 ?auto_1015064 ?auto_1015065 ?auto_1015066 ?auto_1015067 ?auto_1015068 ?auto_1015069 ?auto_1015070 ?auto_1015071 ?auto_1015072 ?auto_1015073 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015186 - SURFACE
      ?auto_1015187 - SURFACE
      ?auto_1015188 - SURFACE
      ?auto_1015189 - SURFACE
      ?auto_1015190 - SURFACE
      ?auto_1015191 - SURFACE
      ?auto_1015192 - SURFACE
      ?auto_1015193 - SURFACE
      ?auto_1015194 - SURFACE
      ?auto_1015195 - SURFACE
      ?auto_1015196 - SURFACE
      ?auto_1015197 - SURFACE
      ?auto_1015198 - SURFACE
    )
    :vars
    (
      ?auto_1015201 - HOIST
      ?auto_1015200 - PLACE
      ?auto_1015199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015201 ?auto_1015200 ) ( SURFACE-AT ?auto_1015197 ?auto_1015200 ) ( CLEAR ?auto_1015197 ) ( IS-CRATE ?auto_1015198 ) ( not ( = ?auto_1015197 ?auto_1015198 ) ) ( TRUCK-AT ?auto_1015199 ?auto_1015200 ) ( AVAILABLE ?auto_1015201 ) ( IN ?auto_1015198 ?auto_1015199 ) ( ON ?auto_1015197 ?auto_1015196 ) ( not ( = ?auto_1015196 ?auto_1015197 ) ) ( not ( = ?auto_1015196 ?auto_1015198 ) ) ( ON ?auto_1015187 ?auto_1015186 ) ( ON ?auto_1015188 ?auto_1015187 ) ( ON ?auto_1015189 ?auto_1015188 ) ( ON ?auto_1015190 ?auto_1015189 ) ( ON ?auto_1015191 ?auto_1015190 ) ( ON ?auto_1015192 ?auto_1015191 ) ( ON ?auto_1015193 ?auto_1015192 ) ( ON ?auto_1015194 ?auto_1015193 ) ( ON ?auto_1015195 ?auto_1015194 ) ( ON ?auto_1015196 ?auto_1015195 ) ( not ( = ?auto_1015186 ?auto_1015187 ) ) ( not ( = ?auto_1015186 ?auto_1015188 ) ) ( not ( = ?auto_1015186 ?auto_1015189 ) ) ( not ( = ?auto_1015186 ?auto_1015190 ) ) ( not ( = ?auto_1015186 ?auto_1015191 ) ) ( not ( = ?auto_1015186 ?auto_1015192 ) ) ( not ( = ?auto_1015186 ?auto_1015193 ) ) ( not ( = ?auto_1015186 ?auto_1015194 ) ) ( not ( = ?auto_1015186 ?auto_1015195 ) ) ( not ( = ?auto_1015186 ?auto_1015196 ) ) ( not ( = ?auto_1015186 ?auto_1015197 ) ) ( not ( = ?auto_1015186 ?auto_1015198 ) ) ( not ( = ?auto_1015187 ?auto_1015188 ) ) ( not ( = ?auto_1015187 ?auto_1015189 ) ) ( not ( = ?auto_1015187 ?auto_1015190 ) ) ( not ( = ?auto_1015187 ?auto_1015191 ) ) ( not ( = ?auto_1015187 ?auto_1015192 ) ) ( not ( = ?auto_1015187 ?auto_1015193 ) ) ( not ( = ?auto_1015187 ?auto_1015194 ) ) ( not ( = ?auto_1015187 ?auto_1015195 ) ) ( not ( = ?auto_1015187 ?auto_1015196 ) ) ( not ( = ?auto_1015187 ?auto_1015197 ) ) ( not ( = ?auto_1015187 ?auto_1015198 ) ) ( not ( = ?auto_1015188 ?auto_1015189 ) ) ( not ( = ?auto_1015188 ?auto_1015190 ) ) ( not ( = ?auto_1015188 ?auto_1015191 ) ) ( not ( = ?auto_1015188 ?auto_1015192 ) ) ( not ( = ?auto_1015188 ?auto_1015193 ) ) ( not ( = ?auto_1015188 ?auto_1015194 ) ) ( not ( = ?auto_1015188 ?auto_1015195 ) ) ( not ( = ?auto_1015188 ?auto_1015196 ) ) ( not ( = ?auto_1015188 ?auto_1015197 ) ) ( not ( = ?auto_1015188 ?auto_1015198 ) ) ( not ( = ?auto_1015189 ?auto_1015190 ) ) ( not ( = ?auto_1015189 ?auto_1015191 ) ) ( not ( = ?auto_1015189 ?auto_1015192 ) ) ( not ( = ?auto_1015189 ?auto_1015193 ) ) ( not ( = ?auto_1015189 ?auto_1015194 ) ) ( not ( = ?auto_1015189 ?auto_1015195 ) ) ( not ( = ?auto_1015189 ?auto_1015196 ) ) ( not ( = ?auto_1015189 ?auto_1015197 ) ) ( not ( = ?auto_1015189 ?auto_1015198 ) ) ( not ( = ?auto_1015190 ?auto_1015191 ) ) ( not ( = ?auto_1015190 ?auto_1015192 ) ) ( not ( = ?auto_1015190 ?auto_1015193 ) ) ( not ( = ?auto_1015190 ?auto_1015194 ) ) ( not ( = ?auto_1015190 ?auto_1015195 ) ) ( not ( = ?auto_1015190 ?auto_1015196 ) ) ( not ( = ?auto_1015190 ?auto_1015197 ) ) ( not ( = ?auto_1015190 ?auto_1015198 ) ) ( not ( = ?auto_1015191 ?auto_1015192 ) ) ( not ( = ?auto_1015191 ?auto_1015193 ) ) ( not ( = ?auto_1015191 ?auto_1015194 ) ) ( not ( = ?auto_1015191 ?auto_1015195 ) ) ( not ( = ?auto_1015191 ?auto_1015196 ) ) ( not ( = ?auto_1015191 ?auto_1015197 ) ) ( not ( = ?auto_1015191 ?auto_1015198 ) ) ( not ( = ?auto_1015192 ?auto_1015193 ) ) ( not ( = ?auto_1015192 ?auto_1015194 ) ) ( not ( = ?auto_1015192 ?auto_1015195 ) ) ( not ( = ?auto_1015192 ?auto_1015196 ) ) ( not ( = ?auto_1015192 ?auto_1015197 ) ) ( not ( = ?auto_1015192 ?auto_1015198 ) ) ( not ( = ?auto_1015193 ?auto_1015194 ) ) ( not ( = ?auto_1015193 ?auto_1015195 ) ) ( not ( = ?auto_1015193 ?auto_1015196 ) ) ( not ( = ?auto_1015193 ?auto_1015197 ) ) ( not ( = ?auto_1015193 ?auto_1015198 ) ) ( not ( = ?auto_1015194 ?auto_1015195 ) ) ( not ( = ?auto_1015194 ?auto_1015196 ) ) ( not ( = ?auto_1015194 ?auto_1015197 ) ) ( not ( = ?auto_1015194 ?auto_1015198 ) ) ( not ( = ?auto_1015195 ?auto_1015196 ) ) ( not ( = ?auto_1015195 ?auto_1015197 ) ) ( not ( = ?auto_1015195 ?auto_1015198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015196 ?auto_1015197 ?auto_1015198 )
      ( MAKE-12CRATE-VERIFY ?auto_1015186 ?auto_1015187 ?auto_1015188 ?auto_1015189 ?auto_1015190 ?auto_1015191 ?auto_1015192 ?auto_1015193 ?auto_1015194 ?auto_1015195 ?auto_1015196 ?auto_1015197 ?auto_1015198 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015324 - SURFACE
      ?auto_1015325 - SURFACE
      ?auto_1015326 - SURFACE
      ?auto_1015327 - SURFACE
      ?auto_1015328 - SURFACE
      ?auto_1015329 - SURFACE
      ?auto_1015330 - SURFACE
      ?auto_1015331 - SURFACE
      ?auto_1015332 - SURFACE
      ?auto_1015333 - SURFACE
      ?auto_1015334 - SURFACE
      ?auto_1015335 - SURFACE
      ?auto_1015336 - SURFACE
    )
    :vars
    (
      ?auto_1015337 - HOIST
      ?auto_1015339 - PLACE
      ?auto_1015338 - TRUCK
      ?auto_1015340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015337 ?auto_1015339 ) ( SURFACE-AT ?auto_1015335 ?auto_1015339 ) ( CLEAR ?auto_1015335 ) ( IS-CRATE ?auto_1015336 ) ( not ( = ?auto_1015335 ?auto_1015336 ) ) ( AVAILABLE ?auto_1015337 ) ( IN ?auto_1015336 ?auto_1015338 ) ( ON ?auto_1015335 ?auto_1015334 ) ( not ( = ?auto_1015334 ?auto_1015335 ) ) ( not ( = ?auto_1015334 ?auto_1015336 ) ) ( TRUCK-AT ?auto_1015338 ?auto_1015340 ) ( not ( = ?auto_1015340 ?auto_1015339 ) ) ( ON ?auto_1015325 ?auto_1015324 ) ( ON ?auto_1015326 ?auto_1015325 ) ( ON ?auto_1015327 ?auto_1015326 ) ( ON ?auto_1015328 ?auto_1015327 ) ( ON ?auto_1015329 ?auto_1015328 ) ( ON ?auto_1015330 ?auto_1015329 ) ( ON ?auto_1015331 ?auto_1015330 ) ( ON ?auto_1015332 ?auto_1015331 ) ( ON ?auto_1015333 ?auto_1015332 ) ( ON ?auto_1015334 ?auto_1015333 ) ( not ( = ?auto_1015324 ?auto_1015325 ) ) ( not ( = ?auto_1015324 ?auto_1015326 ) ) ( not ( = ?auto_1015324 ?auto_1015327 ) ) ( not ( = ?auto_1015324 ?auto_1015328 ) ) ( not ( = ?auto_1015324 ?auto_1015329 ) ) ( not ( = ?auto_1015324 ?auto_1015330 ) ) ( not ( = ?auto_1015324 ?auto_1015331 ) ) ( not ( = ?auto_1015324 ?auto_1015332 ) ) ( not ( = ?auto_1015324 ?auto_1015333 ) ) ( not ( = ?auto_1015324 ?auto_1015334 ) ) ( not ( = ?auto_1015324 ?auto_1015335 ) ) ( not ( = ?auto_1015324 ?auto_1015336 ) ) ( not ( = ?auto_1015325 ?auto_1015326 ) ) ( not ( = ?auto_1015325 ?auto_1015327 ) ) ( not ( = ?auto_1015325 ?auto_1015328 ) ) ( not ( = ?auto_1015325 ?auto_1015329 ) ) ( not ( = ?auto_1015325 ?auto_1015330 ) ) ( not ( = ?auto_1015325 ?auto_1015331 ) ) ( not ( = ?auto_1015325 ?auto_1015332 ) ) ( not ( = ?auto_1015325 ?auto_1015333 ) ) ( not ( = ?auto_1015325 ?auto_1015334 ) ) ( not ( = ?auto_1015325 ?auto_1015335 ) ) ( not ( = ?auto_1015325 ?auto_1015336 ) ) ( not ( = ?auto_1015326 ?auto_1015327 ) ) ( not ( = ?auto_1015326 ?auto_1015328 ) ) ( not ( = ?auto_1015326 ?auto_1015329 ) ) ( not ( = ?auto_1015326 ?auto_1015330 ) ) ( not ( = ?auto_1015326 ?auto_1015331 ) ) ( not ( = ?auto_1015326 ?auto_1015332 ) ) ( not ( = ?auto_1015326 ?auto_1015333 ) ) ( not ( = ?auto_1015326 ?auto_1015334 ) ) ( not ( = ?auto_1015326 ?auto_1015335 ) ) ( not ( = ?auto_1015326 ?auto_1015336 ) ) ( not ( = ?auto_1015327 ?auto_1015328 ) ) ( not ( = ?auto_1015327 ?auto_1015329 ) ) ( not ( = ?auto_1015327 ?auto_1015330 ) ) ( not ( = ?auto_1015327 ?auto_1015331 ) ) ( not ( = ?auto_1015327 ?auto_1015332 ) ) ( not ( = ?auto_1015327 ?auto_1015333 ) ) ( not ( = ?auto_1015327 ?auto_1015334 ) ) ( not ( = ?auto_1015327 ?auto_1015335 ) ) ( not ( = ?auto_1015327 ?auto_1015336 ) ) ( not ( = ?auto_1015328 ?auto_1015329 ) ) ( not ( = ?auto_1015328 ?auto_1015330 ) ) ( not ( = ?auto_1015328 ?auto_1015331 ) ) ( not ( = ?auto_1015328 ?auto_1015332 ) ) ( not ( = ?auto_1015328 ?auto_1015333 ) ) ( not ( = ?auto_1015328 ?auto_1015334 ) ) ( not ( = ?auto_1015328 ?auto_1015335 ) ) ( not ( = ?auto_1015328 ?auto_1015336 ) ) ( not ( = ?auto_1015329 ?auto_1015330 ) ) ( not ( = ?auto_1015329 ?auto_1015331 ) ) ( not ( = ?auto_1015329 ?auto_1015332 ) ) ( not ( = ?auto_1015329 ?auto_1015333 ) ) ( not ( = ?auto_1015329 ?auto_1015334 ) ) ( not ( = ?auto_1015329 ?auto_1015335 ) ) ( not ( = ?auto_1015329 ?auto_1015336 ) ) ( not ( = ?auto_1015330 ?auto_1015331 ) ) ( not ( = ?auto_1015330 ?auto_1015332 ) ) ( not ( = ?auto_1015330 ?auto_1015333 ) ) ( not ( = ?auto_1015330 ?auto_1015334 ) ) ( not ( = ?auto_1015330 ?auto_1015335 ) ) ( not ( = ?auto_1015330 ?auto_1015336 ) ) ( not ( = ?auto_1015331 ?auto_1015332 ) ) ( not ( = ?auto_1015331 ?auto_1015333 ) ) ( not ( = ?auto_1015331 ?auto_1015334 ) ) ( not ( = ?auto_1015331 ?auto_1015335 ) ) ( not ( = ?auto_1015331 ?auto_1015336 ) ) ( not ( = ?auto_1015332 ?auto_1015333 ) ) ( not ( = ?auto_1015332 ?auto_1015334 ) ) ( not ( = ?auto_1015332 ?auto_1015335 ) ) ( not ( = ?auto_1015332 ?auto_1015336 ) ) ( not ( = ?auto_1015333 ?auto_1015334 ) ) ( not ( = ?auto_1015333 ?auto_1015335 ) ) ( not ( = ?auto_1015333 ?auto_1015336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015334 ?auto_1015335 ?auto_1015336 )
      ( MAKE-12CRATE-VERIFY ?auto_1015324 ?auto_1015325 ?auto_1015326 ?auto_1015327 ?auto_1015328 ?auto_1015329 ?auto_1015330 ?auto_1015331 ?auto_1015332 ?auto_1015333 ?auto_1015334 ?auto_1015335 ?auto_1015336 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015474 - SURFACE
      ?auto_1015475 - SURFACE
      ?auto_1015476 - SURFACE
      ?auto_1015477 - SURFACE
      ?auto_1015478 - SURFACE
      ?auto_1015479 - SURFACE
      ?auto_1015480 - SURFACE
      ?auto_1015481 - SURFACE
      ?auto_1015482 - SURFACE
      ?auto_1015483 - SURFACE
      ?auto_1015484 - SURFACE
      ?auto_1015485 - SURFACE
      ?auto_1015486 - SURFACE
    )
    :vars
    (
      ?auto_1015491 - HOIST
      ?auto_1015490 - PLACE
      ?auto_1015489 - TRUCK
      ?auto_1015487 - PLACE
      ?auto_1015488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015491 ?auto_1015490 ) ( SURFACE-AT ?auto_1015485 ?auto_1015490 ) ( CLEAR ?auto_1015485 ) ( IS-CRATE ?auto_1015486 ) ( not ( = ?auto_1015485 ?auto_1015486 ) ) ( AVAILABLE ?auto_1015491 ) ( ON ?auto_1015485 ?auto_1015484 ) ( not ( = ?auto_1015484 ?auto_1015485 ) ) ( not ( = ?auto_1015484 ?auto_1015486 ) ) ( TRUCK-AT ?auto_1015489 ?auto_1015487 ) ( not ( = ?auto_1015487 ?auto_1015490 ) ) ( HOIST-AT ?auto_1015488 ?auto_1015487 ) ( LIFTING ?auto_1015488 ?auto_1015486 ) ( not ( = ?auto_1015491 ?auto_1015488 ) ) ( ON ?auto_1015475 ?auto_1015474 ) ( ON ?auto_1015476 ?auto_1015475 ) ( ON ?auto_1015477 ?auto_1015476 ) ( ON ?auto_1015478 ?auto_1015477 ) ( ON ?auto_1015479 ?auto_1015478 ) ( ON ?auto_1015480 ?auto_1015479 ) ( ON ?auto_1015481 ?auto_1015480 ) ( ON ?auto_1015482 ?auto_1015481 ) ( ON ?auto_1015483 ?auto_1015482 ) ( ON ?auto_1015484 ?auto_1015483 ) ( not ( = ?auto_1015474 ?auto_1015475 ) ) ( not ( = ?auto_1015474 ?auto_1015476 ) ) ( not ( = ?auto_1015474 ?auto_1015477 ) ) ( not ( = ?auto_1015474 ?auto_1015478 ) ) ( not ( = ?auto_1015474 ?auto_1015479 ) ) ( not ( = ?auto_1015474 ?auto_1015480 ) ) ( not ( = ?auto_1015474 ?auto_1015481 ) ) ( not ( = ?auto_1015474 ?auto_1015482 ) ) ( not ( = ?auto_1015474 ?auto_1015483 ) ) ( not ( = ?auto_1015474 ?auto_1015484 ) ) ( not ( = ?auto_1015474 ?auto_1015485 ) ) ( not ( = ?auto_1015474 ?auto_1015486 ) ) ( not ( = ?auto_1015475 ?auto_1015476 ) ) ( not ( = ?auto_1015475 ?auto_1015477 ) ) ( not ( = ?auto_1015475 ?auto_1015478 ) ) ( not ( = ?auto_1015475 ?auto_1015479 ) ) ( not ( = ?auto_1015475 ?auto_1015480 ) ) ( not ( = ?auto_1015475 ?auto_1015481 ) ) ( not ( = ?auto_1015475 ?auto_1015482 ) ) ( not ( = ?auto_1015475 ?auto_1015483 ) ) ( not ( = ?auto_1015475 ?auto_1015484 ) ) ( not ( = ?auto_1015475 ?auto_1015485 ) ) ( not ( = ?auto_1015475 ?auto_1015486 ) ) ( not ( = ?auto_1015476 ?auto_1015477 ) ) ( not ( = ?auto_1015476 ?auto_1015478 ) ) ( not ( = ?auto_1015476 ?auto_1015479 ) ) ( not ( = ?auto_1015476 ?auto_1015480 ) ) ( not ( = ?auto_1015476 ?auto_1015481 ) ) ( not ( = ?auto_1015476 ?auto_1015482 ) ) ( not ( = ?auto_1015476 ?auto_1015483 ) ) ( not ( = ?auto_1015476 ?auto_1015484 ) ) ( not ( = ?auto_1015476 ?auto_1015485 ) ) ( not ( = ?auto_1015476 ?auto_1015486 ) ) ( not ( = ?auto_1015477 ?auto_1015478 ) ) ( not ( = ?auto_1015477 ?auto_1015479 ) ) ( not ( = ?auto_1015477 ?auto_1015480 ) ) ( not ( = ?auto_1015477 ?auto_1015481 ) ) ( not ( = ?auto_1015477 ?auto_1015482 ) ) ( not ( = ?auto_1015477 ?auto_1015483 ) ) ( not ( = ?auto_1015477 ?auto_1015484 ) ) ( not ( = ?auto_1015477 ?auto_1015485 ) ) ( not ( = ?auto_1015477 ?auto_1015486 ) ) ( not ( = ?auto_1015478 ?auto_1015479 ) ) ( not ( = ?auto_1015478 ?auto_1015480 ) ) ( not ( = ?auto_1015478 ?auto_1015481 ) ) ( not ( = ?auto_1015478 ?auto_1015482 ) ) ( not ( = ?auto_1015478 ?auto_1015483 ) ) ( not ( = ?auto_1015478 ?auto_1015484 ) ) ( not ( = ?auto_1015478 ?auto_1015485 ) ) ( not ( = ?auto_1015478 ?auto_1015486 ) ) ( not ( = ?auto_1015479 ?auto_1015480 ) ) ( not ( = ?auto_1015479 ?auto_1015481 ) ) ( not ( = ?auto_1015479 ?auto_1015482 ) ) ( not ( = ?auto_1015479 ?auto_1015483 ) ) ( not ( = ?auto_1015479 ?auto_1015484 ) ) ( not ( = ?auto_1015479 ?auto_1015485 ) ) ( not ( = ?auto_1015479 ?auto_1015486 ) ) ( not ( = ?auto_1015480 ?auto_1015481 ) ) ( not ( = ?auto_1015480 ?auto_1015482 ) ) ( not ( = ?auto_1015480 ?auto_1015483 ) ) ( not ( = ?auto_1015480 ?auto_1015484 ) ) ( not ( = ?auto_1015480 ?auto_1015485 ) ) ( not ( = ?auto_1015480 ?auto_1015486 ) ) ( not ( = ?auto_1015481 ?auto_1015482 ) ) ( not ( = ?auto_1015481 ?auto_1015483 ) ) ( not ( = ?auto_1015481 ?auto_1015484 ) ) ( not ( = ?auto_1015481 ?auto_1015485 ) ) ( not ( = ?auto_1015481 ?auto_1015486 ) ) ( not ( = ?auto_1015482 ?auto_1015483 ) ) ( not ( = ?auto_1015482 ?auto_1015484 ) ) ( not ( = ?auto_1015482 ?auto_1015485 ) ) ( not ( = ?auto_1015482 ?auto_1015486 ) ) ( not ( = ?auto_1015483 ?auto_1015484 ) ) ( not ( = ?auto_1015483 ?auto_1015485 ) ) ( not ( = ?auto_1015483 ?auto_1015486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015484 ?auto_1015485 ?auto_1015486 )
      ( MAKE-12CRATE-VERIFY ?auto_1015474 ?auto_1015475 ?auto_1015476 ?auto_1015477 ?auto_1015478 ?auto_1015479 ?auto_1015480 ?auto_1015481 ?auto_1015482 ?auto_1015483 ?auto_1015484 ?auto_1015485 ?auto_1015486 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015636 - SURFACE
      ?auto_1015637 - SURFACE
      ?auto_1015638 - SURFACE
      ?auto_1015639 - SURFACE
      ?auto_1015640 - SURFACE
      ?auto_1015641 - SURFACE
      ?auto_1015642 - SURFACE
      ?auto_1015643 - SURFACE
      ?auto_1015644 - SURFACE
      ?auto_1015645 - SURFACE
      ?auto_1015646 - SURFACE
      ?auto_1015647 - SURFACE
      ?auto_1015648 - SURFACE
    )
    :vars
    (
      ?auto_1015652 - HOIST
      ?auto_1015651 - PLACE
      ?auto_1015654 - TRUCK
      ?auto_1015649 - PLACE
      ?auto_1015653 - HOIST
      ?auto_1015650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015652 ?auto_1015651 ) ( SURFACE-AT ?auto_1015647 ?auto_1015651 ) ( CLEAR ?auto_1015647 ) ( IS-CRATE ?auto_1015648 ) ( not ( = ?auto_1015647 ?auto_1015648 ) ) ( AVAILABLE ?auto_1015652 ) ( ON ?auto_1015647 ?auto_1015646 ) ( not ( = ?auto_1015646 ?auto_1015647 ) ) ( not ( = ?auto_1015646 ?auto_1015648 ) ) ( TRUCK-AT ?auto_1015654 ?auto_1015649 ) ( not ( = ?auto_1015649 ?auto_1015651 ) ) ( HOIST-AT ?auto_1015653 ?auto_1015649 ) ( not ( = ?auto_1015652 ?auto_1015653 ) ) ( AVAILABLE ?auto_1015653 ) ( SURFACE-AT ?auto_1015648 ?auto_1015649 ) ( ON ?auto_1015648 ?auto_1015650 ) ( CLEAR ?auto_1015648 ) ( not ( = ?auto_1015647 ?auto_1015650 ) ) ( not ( = ?auto_1015648 ?auto_1015650 ) ) ( not ( = ?auto_1015646 ?auto_1015650 ) ) ( ON ?auto_1015637 ?auto_1015636 ) ( ON ?auto_1015638 ?auto_1015637 ) ( ON ?auto_1015639 ?auto_1015638 ) ( ON ?auto_1015640 ?auto_1015639 ) ( ON ?auto_1015641 ?auto_1015640 ) ( ON ?auto_1015642 ?auto_1015641 ) ( ON ?auto_1015643 ?auto_1015642 ) ( ON ?auto_1015644 ?auto_1015643 ) ( ON ?auto_1015645 ?auto_1015644 ) ( ON ?auto_1015646 ?auto_1015645 ) ( not ( = ?auto_1015636 ?auto_1015637 ) ) ( not ( = ?auto_1015636 ?auto_1015638 ) ) ( not ( = ?auto_1015636 ?auto_1015639 ) ) ( not ( = ?auto_1015636 ?auto_1015640 ) ) ( not ( = ?auto_1015636 ?auto_1015641 ) ) ( not ( = ?auto_1015636 ?auto_1015642 ) ) ( not ( = ?auto_1015636 ?auto_1015643 ) ) ( not ( = ?auto_1015636 ?auto_1015644 ) ) ( not ( = ?auto_1015636 ?auto_1015645 ) ) ( not ( = ?auto_1015636 ?auto_1015646 ) ) ( not ( = ?auto_1015636 ?auto_1015647 ) ) ( not ( = ?auto_1015636 ?auto_1015648 ) ) ( not ( = ?auto_1015636 ?auto_1015650 ) ) ( not ( = ?auto_1015637 ?auto_1015638 ) ) ( not ( = ?auto_1015637 ?auto_1015639 ) ) ( not ( = ?auto_1015637 ?auto_1015640 ) ) ( not ( = ?auto_1015637 ?auto_1015641 ) ) ( not ( = ?auto_1015637 ?auto_1015642 ) ) ( not ( = ?auto_1015637 ?auto_1015643 ) ) ( not ( = ?auto_1015637 ?auto_1015644 ) ) ( not ( = ?auto_1015637 ?auto_1015645 ) ) ( not ( = ?auto_1015637 ?auto_1015646 ) ) ( not ( = ?auto_1015637 ?auto_1015647 ) ) ( not ( = ?auto_1015637 ?auto_1015648 ) ) ( not ( = ?auto_1015637 ?auto_1015650 ) ) ( not ( = ?auto_1015638 ?auto_1015639 ) ) ( not ( = ?auto_1015638 ?auto_1015640 ) ) ( not ( = ?auto_1015638 ?auto_1015641 ) ) ( not ( = ?auto_1015638 ?auto_1015642 ) ) ( not ( = ?auto_1015638 ?auto_1015643 ) ) ( not ( = ?auto_1015638 ?auto_1015644 ) ) ( not ( = ?auto_1015638 ?auto_1015645 ) ) ( not ( = ?auto_1015638 ?auto_1015646 ) ) ( not ( = ?auto_1015638 ?auto_1015647 ) ) ( not ( = ?auto_1015638 ?auto_1015648 ) ) ( not ( = ?auto_1015638 ?auto_1015650 ) ) ( not ( = ?auto_1015639 ?auto_1015640 ) ) ( not ( = ?auto_1015639 ?auto_1015641 ) ) ( not ( = ?auto_1015639 ?auto_1015642 ) ) ( not ( = ?auto_1015639 ?auto_1015643 ) ) ( not ( = ?auto_1015639 ?auto_1015644 ) ) ( not ( = ?auto_1015639 ?auto_1015645 ) ) ( not ( = ?auto_1015639 ?auto_1015646 ) ) ( not ( = ?auto_1015639 ?auto_1015647 ) ) ( not ( = ?auto_1015639 ?auto_1015648 ) ) ( not ( = ?auto_1015639 ?auto_1015650 ) ) ( not ( = ?auto_1015640 ?auto_1015641 ) ) ( not ( = ?auto_1015640 ?auto_1015642 ) ) ( not ( = ?auto_1015640 ?auto_1015643 ) ) ( not ( = ?auto_1015640 ?auto_1015644 ) ) ( not ( = ?auto_1015640 ?auto_1015645 ) ) ( not ( = ?auto_1015640 ?auto_1015646 ) ) ( not ( = ?auto_1015640 ?auto_1015647 ) ) ( not ( = ?auto_1015640 ?auto_1015648 ) ) ( not ( = ?auto_1015640 ?auto_1015650 ) ) ( not ( = ?auto_1015641 ?auto_1015642 ) ) ( not ( = ?auto_1015641 ?auto_1015643 ) ) ( not ( = ?auto_1015641 ?auto_1015644 ) ) ( not ( = ?auto_1015641 ?auto_1015645 ) ) ( not ( = ?auto_1015641 ?auto_1015646 ) ) ( not ( = ?auto_1015641 ?auto_1015647 ) ) ( not ( = ?auto_1015641 ?auto_1015648 ) ) ( not ( = ?auto_1015641 ?auto_1015650 ) ) ( not ( = ?auto_1015642 ?auto_1015643 ) ) ( not ( = ?auto_1015642 ?auto_1015644 ) ) ( not ( = ?auto_1015642 ?auto_1015645 ) ) ( not ( = ?auto_1015642 ?auto_1015646 ) ) ( not ( = ?auto_1015642 ?auto_1015647 ) ) ( not ( = ?auto_1015642 ?auto_1015648 ) ) ( not ( = ?auto_1015642 ?auto_1015650 ) ) ( not ( = ?auto_1015643 ?auto_1015644 ) ) ( not ( = ?auto_1015643 ?auto_1015645 ) ) ( not ( = ?auto_1015643 ?auto_1015646 ) ) ( not ( = ?auto_1015643 ?auto_1015647 ) ) ( not ( = ?auto_1015643 ?auto_1015648 ) ) ( not ( = ?auto_1015643 ?auto_1015650 ) ) ( not ( = ?auto_1015644 ?auto_1015645 ) ) ( not ( = ?auto_1015644 ?auto_1015646 ) ) ( not ( = ?auto_1015644 ?auto_1015647 ) ) ( not ( = ?auto_1015644 ?auto_1015648 ) ) ( not ( = ?auto_1015644 ?auto_1015650 ) ) ( not ( = ?auto_1015645 ?auto_1015646 ) ) ( not ( = ?auto_1015645 ?auto_1015647 ) ) ( not ( = ?auto_1015645 ?auto_1015648 ) ) ( not ( = ?auto_1015645 ?auto_1015650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015646 ?auto_1015647 ?auto_1015648 )
      ( MAKE-12CRATE-VERIFY ?auto_1015636 ?auto_1015637 ?auto_1015638 ?auto_1015639 ?auto_1015640 ?auto_1015641 ?auto_1015642 ?auto_1015643 ?auto_1015644 ?auto_1015645 ?auto_1015646 ?auto_1015647 ?auto_1015648 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015799 - SURFACE
      ?auto_1015800 - SURFACE
      ?auto_1015801 - SURFACE
      ?auto_1015802 - SURFACE
      ?auto_1015803 - SURFACE
      ?auto_1015804 - SURFACE
      ?auto_1015805 - SURFACE
      ?auto_1015806 - SURFACE
      ?auto_1015807 - SURFACE
      ?auto_1015808 - SURFACE
      ?auto_1015809 - SURFACE
      ?auto_1015810 - SURFACE
      ?auto_1015811 - SURFACE
    )
    :vars
    (
      ?auto_1015815 - HOIST
      ?auto_1015817 - PLACE
      ?auto_1015816 - PLACE
      ?auto_1015813 - HOIST
      ?auto_1015814 - SURFACE
      ?auto_1015812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015815 ?auto_1015817 ) ( SURFACE-AT ?auto_1015810 ?auto_1015817 ) ( CLEAR ?auto_1015810 ) ( IS-CRATE ?auto_1015811 ) ( not ( = ?auto_1015810 ?auto_1015811 ) ) ( AVAILABLE ?auto_1015815 ) ( ON ?auto_1015810 ?auto_1015809 ) ( not ( = ?auto_1015809 ?auto_1015810 ) ) ( not ( = ?auto_1015809 ?auto_1015811 ) ) ( not ( = ?auto_1015816 ?auto_1015817 ) ) ( HOIST-AT ?auto_1015813 ?auto_1015816 ) ( not ( = ?auto_1015815 ?auto_1015813 ) ) ( AVAILABLE ?auto_1015813 ) ( SURFACE-AT ?auto_1015811 ?auto_1015816 ) ( ON ?auto_1015811 ?auto_1015814 ) ( CLEAR ?auto_1015811 ) ( not ( = ?auto_1015810 ?auto_1015814 ) ) ( not ( = ?auto_1015811 ?auto_1015814 ) ) ( not ( = ?auto_1015809 ?auto_1015814 ) ) ( TRUCK-AT ?auto_1015812 ?auto_1015817 ) ( ON ?auto_1015800 ?auto_1015799 ) ( ON ?auto_1015801 ?auto_1015800 ) ( ON ?auto_1015802 ?auto_1015801 ) ( ON ?auto_1015803 ?auto_1015802 ) ( ON ?auto_1015804 ?auto_1015803 ) ( ON ?auto_1015805 ?auto_1015804 ) ( ON ?auto_1015806 ?auto_1015805 ) ( ON ?auto_1015807 ?auto_1015806 ) ( ON ?auto_1015808 ?auto_1015807 ) ( ON ?auto_1015809 ?auto_1015808 ) ( not ( = ?auto_1015799 ?auto_1015800 ) ) ( not ( = ?auto_1015799 ?auto_1015801 ) ) ( not ( = ?auto_1015799 ?auto_1015802 ) ) ( not ( = ?auto_1015799 ?auto_1015803 ) ) ( not ( = ?auto_1015799 ?auto_1015804 ) ) ( not ( = ?auto_1015799 ?auto_1015805 ) ) ( not ( = ?auto_1015799 ?auto_1015806 ) ) ( not ( = ?auto_1015799 ?auto_1015807 ) ) ( not ( = ?auto_1015799 ?auto_1015808 ) ) ( not ( = ?auto_1015799 ?auto_1015809 ) ) ( not ( = ?auto_1015799 ?auto_1015810 ) ) ( not ( = ?auto_1015799 ?auto_1015811 ) ) ( not ( = ?auto_1015799 ?auto_1015814 ) ) ( not ( = ?auto_1015800 ?auto_1015801 ) ) ( not ( = ?auto_1015800 ?auto_1015802 ) ) ( not ( = ?auto_1015800 ?auto_1015803 ) ) ( not ( = ?auto_1015800 ?auto_1015804 ) ) ( not ( = ?auto_1015800 ?auto_1015805 ) ) ( not ( = ?auto_1015800 ?auto_1015806 ) ) ( not ( = ?auto_1015800 ?auto_1015807 ) ) ( not ( = ?auto_1015800 ?auto_1015808 ) ) ( not ( = ?auto_1015800 ?auto_1015809 ) ) ( not ( = ?auto_1015800 ?auto_1015810 ) ) ( not ( = ?auto_1015800 ?auto_1015811 ) ) ( not ( = ?auto_1015800 ?auto_1015814 ) ) ( not ( = ?auto_1015801 ?auto_1015802 ) ) ( not ( = ?auto_1015801 ?auto_1015803 ) ) ( not ( = ?auto_1015801 ?auto_1015804 ) ) ( not ( = ?auto_1015801 ?auto_1015805 ) ) ( not ( = ?auto_1015801 ?auto_1015806 ) ) ( not ( = ?auto_1015801 ?auto_1015807 ) ) ( not ( = ?auto_1015801 ?auto_1015808 ) ) ( not ( = ?auto_1015801 ?auto_1015809 ) ) ( not ( = ?auto_1015801 ?auto_1015810 ) ) ( not ( = ?auto_1015801 ?auto_1015811 ) ) ( not ( = ?auto_1015801 ?auto_1015814 ) ) ( not ( = ?auto_1015802 ?auto_1015803 ) ) ( not ( = ?auto_1015802 ?auto_1015804 ) ) ( not ( = ?auto_1015802 ?auto_1015805 ) ) ( not ( = ?auto_1015802 ?auto_1015806 ) ) ( not ( = ?auto_1015802 ?auto_1015807 ) ) ( not ( = ?auto_1015802 ?auto_1015808 ) ) ( not ( = ?auto_1015802 ?auto_1015809 ) ) ( not ( = ?auto_1015802 ?auto_1015810 ) ) ( not ( = ?auto_1015802 ?auto_1015811 ) ) ( not ( = ?auto_1015802 ?auto_1015814 ) ) ( not ( = ?auto_1015803 ?auto_1015804 ) ) ( not ( = ?auto_1015803 ?auto_1015805 ) ) ( not ( = ?auto_1015803 ?auto_1015806 ) ) ( not ( = ?auto_1015803 ?auto_1015807 ) ) ( not ( = ?auto_1015803 ?auto_1015808 ) ) ( not ( = ?auto_1015803 ?auto_1015809 ) ) ( not ( = ?auto_1015803 ?auto_1015810 ) ) ( not ( = ?auto_1015803 ?auto_1015811 ) ) ( not ( = ?auto_1015803 ?auto_1015814 ) ) ( not ( = ?auto_1015804 ?auto_1015805 ) ) ( not ( = ?auto_1015804 ?auto_1015806 ) ) ( not ( = ?auto_1015804 ?auto_1015807 ) ) ( not ( = ?auto_1015804 ?auto_1015808 ) ) ( not ( = ?auto_1015804 ?auto_1015809 ) ) ( not ( = ?auto_1015804 ?auto_1015810 ) ) ( not ( = ?auto_1015804 ?auto_1015811 ) ) ( not ( = ?auto_1015804 ?auto_1015814 ) ) ( not ( = ?auto_1015805 ?auto_1015806 ) ) ( not ( = ?auto_1015805 ?auto_1015807 ) ) ( not ( = ?auto_1015805 ?auto_1015808 ) ) ( not ( = ?auto_1015805 ?auto_1015809 ) ) ( not ( = ?auto_1015805 ?auto_1015810 ) ) ( not ( = ?auto_1015805 ?auto_1015811 ) ) ( not ( = ?auto_1015805 ?auto_1015814 ) ) ( not ( = ?auto_1015806 ?auto_1015807 ) ) ( not ( = ?auto_1015806 ?auto_1015808 ) ) ( not ( = ?auto_1015806 ?auto_1015809 ) ) ( not ( = ?auto_1015806 ?auto_1015810 ) ) ( not ( = ?auto_1015806 ?auto_1015811 ) ) ( not ( = ?auto_1015806 ?auto_1015814 ) ) ( not ( = ?auto_1015807 ?auto_1015808 ) ) ( not ( = ?auto_1015807 ?auto_1015809 ) ) ( not ( = ?auto_1015807 ?auto_1015810 ) ) ( not ( = ?auto_1015807 ?auto_1015811 ) ) ( not ( = ?auto_1015807 ?auto_1015814 ) ) ( not ( = ?auto_1015808 ?auto_1015809 ) ) ( not ( = ?auto_1015808 ?auto_1015810 ) ) ( not ( = ?auto_1015808 ?auto_1015811 ) ) ( not ( = ?auto_1015808 ?auto_1015814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015809 ?auto_1015810 ?auto_1015811 )
      ( MAKE-12CRATE-VERIFY ?auto_1015799 ?auto_1015800 ?auto_1015801 ?auto_1015802 ?auto_1015803 ?auto_1015804 ?auto_1015805 ?auto_1015806 ?auto_1015807 ?auto_1015808 ?auto_1015809 ?auto_1015810 ?auto_1015811 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015962 - SURFACE
      ?auto_1015963 - SURFACE
      ?auto_1015964 - SURFACE
      ?auto_1015965 - SURFACE
      ?auto_1015966 - SURFACE
      ?auto_1015967 - SURFACE
      ?auto_1015968 - SURFACE
      ?auto_1015969 - SURFACE
      ?auto_1015970 - SURFACE
      ?auto_1015971 - SURFACE
      ?auto_1015972 - SURFACE
      ?auto_1015973 - SURFACE
      ?auto_1015974 - SURFACE
    )
    :vars
    (
      ?auto_1015977 - HOIST
      ?auto_1015979 - PLACE
      ?auto_1015980 - PLACE
      ?auto_1015975 - HOIST
      ?auto_1015978 - SURFACE
      ?auto_1015976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015977 ?auto_1015979 ) ( IS-CRATE ?auto_1015974 ) ( not ( = ?auto_1015973 ?auto_1015974 ) ) ( not ( = ?auto_1015972 ?auto_1015973 ) ) ( not ( = ?auto_1015972 ?auto_1015974 ) ) ( not ( = ?auto_1015980 ?auto_1015979 ) ) ( HOIST-AT ?auto_1015975 ?auto_1015980 ) ( not ( = ?auto_1015977 ?auto_1015975 ) ) ( AVAILABLE ?auto_1015975 ) ( SURFACE-AT ?auto_1015974 ?auto_1015980 ) ( ON ?auto_1015974 ?auto_1015978 ) ( CLEAR ?auto_1015974 ) ( not ( = ?auto_1015973 ?auto_1015978 ) ) ( not ( = ?auto_1015974 ?auto_1015978 ) ) ( not ( = ?auto_1015972 ?auto_1015978 ) ) ( TRUCK-AT ?auto_1015976 ?auto_1015979 ) ( SURFACE-AT ?auto_1015972 ?auto_1015979 ) ( CLEAR ?auto_1015972 ) ( LIFTING ?auto_1015977 ?auto_1015973 ) ( IS-CRATE ?auto_1015973 ) ( ON ?auto_1015963 ?auto_1015962 ) ( ON ?auto_1015964 ?auto_1015963 ) ( ON ?auto_1015965 ?auto_1015964 ) ( ON ?auto_1015966 ?auto_1015965 ) ( ON ?auto_1015967 ?auto_1015966 ) ( ON ?auto_1015968 ?auto_1015967 ) ( ON ?auto_1015969 ?auto_1015968 ) ( ON ?auto_1015970 ?auto_1015969 ) ( ON ?auto_1015971 ?auto_1015970 ) ( ON ?auto_1015972 ?auto_1015971 ) ( not ( = ?auto_1015962 ?auto_1015963 ) ) ( not ( = ?auto_1015962 ?auto_1015964 ) ) ( not ( = ?auto_1015962 ?auto_1015965 ) ) ( not ( = ?auto_1015962 ?auto_1015966 ) ) ( not ( = ?auto_1015962 ?auto_1015967 ) ) ( not ( = ?auto_1015962 ?auto_1015968 ) ) ( not ( = ?auto_1015962 ?auto_1015969 ) ) ( not ( = ?auto_1015962 ?auto_1015970 ) ) ( not ( = ?auto_1015962 ?auto_1015971 ) ) ( not ( = ?auto_1015962 ?auto_1015972 ) ) ( not ( = ?auto_1015962 ?auto_1015973 ) ) ( not ( = ?auto_1015962 ?auto_1015974 ) ) ( not ( = ?auto_1015962 ?auto_1015978 ) ) ( not ( = ?auto_1015963 ?auto_1015964 ) ) ( not ( = ?auto_1015963 ?auto_1015965 ) ) ( not ( = ?auto_1015963 ?auto_1015966 ) ) ( not ( = ?auto_1015963 ?auto_1015967 ) ) ( not ( = ?auto_1015963 ?auto_1015968 ) ) ( not ( = ?auto_1015963 ?auto_1015969 ) ) ( not ( = ?auto_1015963 ?auto_1015970 ) ) ( not ( = ?auto_1015963 ?auto_1015971 ) ) ( not ( = ?auto_1015963 ?auto_1015972 ) ) ( not ( = ?auto_1015963 ?auto_1015973 ) ) ( not ( = ?auto_1015963 ?auto_1015974 ) ) ( not ( = ?auto_1015963 ?auto_1015978 ) ) ( not ( = ?auto_1015964 ?auto_1015965 ) ) ( not ( = ?auto_1015964 ?auto_1015966 ) ) ( not ( = ?auto_1015964 ?auto_1015967 ) ) ( not ( = ?auto_1015964 ?auto_1015968 ) ) ( not ( = ?auto_1015964 ?auto_1015969 ) ) ( not ( = ?auto_1015964 ?auto_1015970 ) ) ( not ( = ?auto_1015964 ?auto_1015971 ) ) ( not ( = ?auto_1015964 ?auto_1015972 ) ) ( not ( = ?auto_1015964 ?auto_1015973 ) ) ( not ( = ?auto_1015964 ?auto_1015974 ) ) ( not ( = ?auto_1015964 ?auto_1015978 ) ) ( not ( = ?auto_1015965 ?auto_1015966 ) ) ( not ( = ?auto_1015965 ?auto_1015967 ) ) ( not ( = ?auto_1015965 ?auto_1015968 ) ) ( not ( = ?auto_1015965 ?auto_1015969 ) ) ( not ( = ?auto_1015965 ?auto_1015970 ) ) ( not ( = ?auto_1015965 ?auto_1015971 ) ) ( not ( = ?auto_1015965 ?auto_1015972 ) ) ( not ( = ?auto_1015965 ?auto_1015973 ) ) ( not ( = ?auto_1015965 ?auto_1015974 ) ) ( not ( = ?auto_1015965 ?auto_1015978 ) ) ( not ( = ?auto_1015966 ?auto_1015967 ) ) ( not ( = ?auto_1015966 ?auto_1015968 ) ) ( not ( = ?auto_1015966 ?auto_1015969 ) ) ( not ( = ?auto_1015966 ?auto_1015970 ) ) ( not ( = ?auto_1015966 ?auto_1015971 ) ) ( not ( = ?auto_1015966 ?auto_1015972 ) ) ( not ( = ?auto_1015966 ?auto_1015973 ) ) ( not ( = ?auto_1015966 ?auto_1015974 ) ) ( not ( = ?auto_1015966 ?auto_1015978 ) ) ( not ( = ?auto_1015967 ?auto_1015968 ) ) ( not ( = ?auto_1015967 ?auto_1015969 ) ) ( not ( = ?auto_1015967 ?auto_1015970 ) ) ( not ( = ?auto_1015967 ?auto_1015971 ) ) ( not ( = ?auto_1015967 ?auto_1015972 ) ) ( not ( = ?auto_1015967 ?auto_1015973 ) ) ( not ( = ?auto_1015967 ?auto_1015974 ) ) ( not ( = ?auto_1015967 ?auto_1015978 ) ) ( not ( = ?auto_1015968 ?auto_1015969 ) ) ( not ( = ?auto_1015968 ?auto_1015970 ) ) ( not ( = ?auto_1015968 ?auto_1015971 ) ) ( not ( = ?auto_1015968 ?auto_1015972 ) ) ( not ( = ?auto_1015968 ?auto_1015973 ) ) ( not ( = ?auto_1015968 ?auto_1015974 ) ) ( not ( = ?auto_1015968 ?auto_1015978 ) ) ( not ( = ?auto_1015969 ?auto_1015970 ) ) ( not ( = ?auto_1015969 ?auto_1015971 ) ) ( not ( = ?auto_1015969 ?auto_1015972 ) ) ( not ( = ?auto_1015969 ?auto_1015973 ) ) ( not ( = ?auto_1015969 ?auto_1015974 ) ) ( not ( = ?auto_1015969 ?auto_1015978 ) ) ( not ( = ?auto_1015970 ?auto_1015971 ) ) ( not ( = ?auto_1015970 ?auto_1015972 ) ) ( not ( = ?auto_1015970 ?auto_1015973 ) ) ( not ( = ?auto_1015970 ?auto_1015974 ) ) ( not ( = ?auto_1015970 ?auto_1015978 ) ) ( not ( = ?auto_1015971 ?auto_1015972 ) ) ( not ( = ?auto_1015971 ?auto_1015973 ) ) ( not ( = ?auto_1015971 ?auto_1015974 ) ) ( not ( = ?auto_1015971 ?auto_1015978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015972 ?auto_1015973 ?auto_1015974 )
      ( MAKE-12CRATE-VERIFY ?auto_1015962 ?auto_1015963 ?auto_1015964 ?auto_1015965 ?auto_1015966 ?auto_1015967 ?auto_1015968 ?auto_1015969 ?auto_1015970 ?auto_1015971 ?auto_1015972 ?auto_1015973 ?auto_1015974 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1016125 - SURFACE
      ?auto_1016126 - SURFACE
      ?auto_1016127 - SURFACE
      ?auto_1016128 - SURFACE
      ?auto_1016129 - SURFACE
      ?auto_1016130 - SURFACE
      ?auto_1016131 - SURFACE
      ?auto_1016132 - SURFACE
      ?auto_1016133 - SURFACE
      ?auto_1016134 - SURFACE
      ?auto_1016135 - SURFACE
      ?auto_1016136 - SURFACE
      ?auto_1016137 - SURFACE
    )
    :vars
    (
      ?auto_1016143 - HOIST
      ?auto_1016140 - PLACE
      ?auto_1016141 - PLACE
      ?auto_1016138 - HOIST
      ?auto_1016142 - SURFACE
      ?auto_1016139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1016143 ?auto_1016140 ) ( IS-CRATE ?auto_1016137 ) ( not ( = ?auto_1016136 ?auto_1016137 ) ) ( not ( = ?auto_1016135 ?auto_1016136 ) ) ( not ( = ?auto_1016135 ?auto_1016137 ) ) ( not ( = ?auto_1016141 ?auto_1016140 ) ) ( HOIST-AT ?auto_1016138 ?auto_1016141 ) ( not ( = ?auto_1016143 ?auto_1016138 ) ) ( AVAILABLE ?auto_1016138 ) ( SURFACE-AT ?auto_1016137 ?auto_1016141 ) ( ON ?auto_1016137 ?auto_1016142 ) ( CLEAR ?auto_1016137 ) ( not ( = ?auto_1016136 ?auto_1016142 ) ) ( not ( = ?auto_1016137 ?auto_1016142 ) ) ( not ( = ?auto_1016135 ?auto_1016142 ) ) ( TRUCK-AT ?auto_1016139 ?auto_1016140 ) ( SURFACE-AT ?auto_1016135 ?auto_1016140 ) ( CLEAR ?auto_1016135 ) ( IS-CRATE ?auto_1016136 ) ( AVAILABLE ?auto_1016143 ) ( IN ?auto_1016136 ?auto_1016139 ) ( ON ?auto_1016126 ?auto_1016125 ) ( ON ?auto_1016127 ?auto_1016126 ) ( ON ?auto_1016128 ?auto_1016127 ) ( ON ?auto_1016129 ?auto_1016128 ) ( ON ?auto_1016130 ?auto_1016129 ) ( ON ?auto_1016131 ?auto_1016130 ) ( ON ?auto_1016132 ?auto_1016131 ) ( ON ?auto_1016133 ?auto_1016132 ) ( ON ?auto_1016134 ?auto_1016133 ) ( ON ?auto_1016135 ?auto_1016134 ) ( not ( = ?auto_1016125 ?auto_1016126 ) ) ( not ( = ?auto_1016125 ?auto_1016127 ) ) ( not ( = ?auto_1016125 ?auto_1016128 ) ) ( not ( = ?auto_1016125 ?auto_1016129 ) ) ( not ( = ?auto_1016125 ?auto_1016130 ) ) ( not ( = ?auto_1016125 ?auto_1016131 ) ) ( not ( = ?auto_1016125 ?auto_1016132 ) ) ( not ( = ?auto_1016125 ?auto_1016133 ) ) ( not ( = ?auto_1016125 ?auto_1016134 ) ) ( not ( = ?auto_1016125 ?auto_1016135 ) ) ( not ( = ?auto_1016125 ?auto_1016136 ) ) ( not ( = ?auto_1016125 ?auto_1016137 ) ) ( not ( = ?auto_1016125 ?auto_1016142 ) ) ( not ( = ?auto_1016126 ?auto_1016127 ) ) ( not ( = ?auto_1016126 ?auto_1016128 ) ) ( not ( = ?auto_1016126 ?auto_1016129 ) ) ( not ( = ?auto_1016126 ?auto_1016130 ) ) ( not ( = ?auto_1016126 ?auto_1016131 ) ) ( not ( = ?auto_1016126 ?auto_1016132 ) ) ( not ( = ?auto_1016126 ?auto_1016133 ) ) ( not ( = ?auto_1016126 ?auto_1016134 ) ) ( not ( = ?auto_1016126 ?auto_1016135 ) ) ( not ( = ?auto_1016126 ?auto_1016136 ) ) ( not ( = ?auto_1016126 ?auto_1016137 ) ) ( not ( = ?auto_1016126 ?auto_1016142 ) ) ( not ( = ?auto_1016127 ?auto_1016128 ) ) ( not ( = ?auto_1016127 ?auto_1016129 ) ) ( not ( = ?auto_1016127 ?auto_1016130 ) ) ( not ( = ?auto_1016127 ?auto_1016131 ) ) ( not ( = ?auto_1016127 ?auto_1016132 ) ) ( not ( = ?auto_1016127 ?auto_1016133 ) ) ( not ( = ?auto_1016127 ?auto_1016134 ) ) ( not ( = ?auto_1016127 ?auto_1016135 ) ) ( not ( = ?auto_1016127 ?auto_1016136 ) ) ( not ( = ?auto_1016127 ?auto_1016137 ) ) ( not ( = ?auto_1016127 ?auto_1016142 ) ) ( not ( = ?auto_1016128 ?auto_1016129 ) ) ( not ( = ?auto_1016128 ?auto_1016130 ) ) ( not ( = ?auto_1016128 ?auto_1016131 ) ) ( not ( = ?auto_1016128 ?auto_1016132 ) ) ( not ( = ?auto_1016128 ?auto_1016133 ) ) ( not ( = ?auto_1016128 ?auto_1016134 ) ) ( not ( = ?auto_1016128 ?auto_1016135 ) ) ( not ( = ?auto_1016128 ?auto_1016136 ) ) ( not ( = ?auto_1016128 ?auto_1016137 ) ) ( not ( = ?auto_1016128 ?auto_1016142 ) ) ( not ( = ?auto_1016129 ?auto_1016130 ) ) ( not ( = ?auto_1016129 ?auto_1016131 ) ) ( not ( = ?auto_1016129 ?auto_1016132 ) ) ( not ( = ?auto_1016129 ?auto_1016133 ) ) ( not ( = ?auto_1016129 ?auto_1016134 ) ) ( not ( = ?auto_1016129 ?auto_1016135 ) ) ( not ( = ?auto_1016129 ?auto_1016136 ) ) ( not ( = ?auto_1016129 ?auto_1016137 ) ) ( not ( = ?auto_1016129 ?auto_1016142 ) ) ( not ( = ?auto_1016130 ?auto_1016131 ) ) ( not ( = ?auto_1016130 ?auto_1016132 ) ) ( not ( = ?auto_1016130 ?auto_1016133 ) ) ( not ( = ?auto_1016130 ?auto_1016134 ) ) ( not ( = ?auto_1016130 ?auto_1016135 ) ) ( not ( = ?auto_1016130 ?auto_1016136 ) ) ( not ( = ?auto_1016130 ?auto_1016137 ) ) ( not ( = ?auto_1016130 ?auto_1016142 ) ) ( not ( = ?auto_1016131 ?auto_1016132 ) ) ( not ( = ?auto_1016131 ?auto_1016133 ) ) ( not ( = ?auto_1016131 ?auto_1016134 ) ) ( not ( = ?auto_1016131 ?auto_1016135 ) ) ( not ( = ?auto_1016131 ?auto_1016136 ) ) ( not ( = ?auto_1016131 ?auto_1016137 ) ) ( not ( = ?auto_1016131 ?auto_1016142 ) ) ( not ( = ?auto_1016132 ?auto_1016133 ) ) ( not ( = ?auto_1016132 ?auto_1016134 ) ) ( not ( = ?auto_1016132 ?auto_1016135 ) ) ( not ( = ?auto_1016132 ?auto_1016136 ) ) ( not ( = ?auto_1016132 ?auto_1016137 ) ) ( not ( = ?auto_1016132 ?auto_1016142 ) ) ( not ( = ?auto_1016133 ?auto_1016134 ) ) ( not ( = ?auto_1016133 ?auto_1016135 ) ) ( not ( = ?auto_1016133 ?auto_1016136 ) ) ( not ( = ?auto_1016133 ?auto_1016137 ) ) ( not ( = ?auto_1016133 ?auto_1016142 ) ) ( not ( = ?auto_1016134 ?auto_1016135 ) ) ( not ( = ?auto_1016134 ?auto_1016136 ) ) ( not ( = ?auto_1016134 ?auto_1016137 ) ) ( not ( = ?auto_1016134 ?auto_1016142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1016135 ?auto_1016136 ?auto_1016137 )
      ( MAKE-12CRATE-VERIFY ?auto_1016125 ?auto_1016126 ?auto_1016127 ?auto_1016128 ?auto_1016129 ?auto_1016130 ?auto_1016131 ?auto_1016132 ?auto_1016133 ?auto_1016134 ?auto_1016135 ?auto_1016136 ?auto_1016137 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027624 - SURFACE
      ?auto_1027625 - SURFACE
      ?auto_1027626 - SURFACE
      ?auto_1027627 - SURFACE
      ?auto_1027628 - SURFACE
      ?auto_1027629 - SURFACE
      ?auto_1027630 - SURFACE
      ?auto_1027631 - SURFACE
      ?auto_1027632 - SURFACE
      ?auto_1027633 - SURFACE
      ?auto_1027634 - SURFACE
      ?auto_1027635 - SURFACE
      ?auto_1027636 - SURFACE
      ?auto_1027637 - SURFACE
    )
    :vars
    (
      ?auto_1027638 - HOIST
      ?auto_1027639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027638 ?auto_1027639 ) ( SURFACE-AT ?auto_1027636 ?auto_1027639 ) ( CLEAR ?auto_1027636 ) ( LIFTING ?auto_1027638 ?auto_1027637 ) ( IS-CRATE ?auto_1027637 ) ( not ( = ?auto_1027636 ?auto_1027637 ) ) ( ON ?auto_1027625 ?auto_1027624 ) ( ON ?auto_1027626 ?auto_1027625 ) ( ON ?auto_1027627 ?auto_1027626 ) ( ON ?auto_1027628 ?auto_1027627 ) ( ON ?auto_1027629 ?auto_1027628 ) ( ON ?auto_1027630 ?auto_1027629 ) ( ON ?auto_1027631 ?auto_1027630 ) ( ON ?auto_1027632 ?auto_1027631 ) ( ON ?auto_1027633 ?auto_1027632 ) ( ON ?auto_1027634 ?auto_1027633 ) ( ON ?auto_1027635 ?auto_1027634 ) ( ON ?auto_1027636 ?auto_1027635 ) ( not ( = ?auto_1027624 ?auto_1027625 ) ) ( not ( = ?auto_1027624 ?auto_1027626 ) ) ( not ( = ?auto_1027624 ?auto_1027627 ) ) ( not ( = ?auto_1027624 ?auto_1027628 ) ) ( not ( = ?auto_1027624 ?auto_1027629 ) ) ( not ( = ?auto_1027624 ?auto_1027630 ) ) ( not ( = ?auto_1027624 ?auto_1027631 ) ) ( not ( = ?auto_1027624 ?auto_1027632 ) ) ( not ( = ?auto_1027624 ?auto_1027633 ) ) ( not ( = ?auto_1027624 ?auto_1027634 ) ) ( not ( = ?auto_1027624 ?auto_1027635 ) ) ( not ( = ?auto_1027624 ?auto_1027636 ) ) ( not ( = ?auto_1027624 ?auto_1027637 ) ) ( not ( = ?auto_1027625 ?auto_1027626 ) ) ( not ( = ?auto_1027625 ?auto_1027627 ) ) ( not ( = ?auto_1027625 ?auto_1027628 ) ) ( not ( = ?auto_1027625 ?auto_1027629 ) ) ( not ( = ?auto_1027625 ?auto_1027630 ) ) ( not ( = ?auto_1027625 ?auto_1027631 ) ) ( not ( = ?auto_1027625 ?auto_1027632 ) ) ( not ( = ?auto_1027625 ?auto_1027633 ) ) ( not ( = ?auto_1027625 ?auto_1027634 ) ) ( not ( = ?auto_1027625 ?auto_1027635 ) ) ( not ( = ?auto_1027625 ?auto_1027636 ) ) ( not ( = ?auto_1027625 ?auto_1027637 ) ) ( not ( = ?auto_1027626 ?auto_1027627 ) ) ( not ( = ?auto_1027626 ?auto_1027628 ) ) ( not ( = ?auto_1027626 ?auto_1027629 ) ) ( not ( = ?auto_1027626 ?auto_1027630 ) ) ( not ( = ?auto_1027626 ?auto_1027631 ) ) ( not ( = ?auto_1027626 ?auto_1027632 ) ) ( not ( = ?auto_1027626 ?auto_1027633 ) ) ( not ( = ?auto_1027626 ?auto_1027634 ) ) ( not ( = ?auto_1027626 ?auto_1027635 ) ) ( not ( = ?auto_1027626 ?auto_1027636 ) ) ( not ( = ?auto_1027626 ?auto_1027637 ) ) ( not ( = ?auto_1027627 ?auto_1027628 ) ) ( not ( = ?auto_1027627 ?auto_1027629 ) ) ( not ( = ?auto_1027627 ?auto_1027630 ) ) ( not ( = ?auto_1027627 ?auto_1027631 ) ) ( not ( = ?auto_1027627 ?auto_1027632 ) ) ( not ( = ?auto_1027627 ?auto_1027633 ) ) ( not ( = ?auto_1027627 ?auto_1027634 ) ) ( not ( = ?auto_1027627 ?auto_1027635 ) ) ( not ( = ?auto_1027627 ?auto_1027636 ) ) ( not ( = ?auto_1027627 ?auto_1027637 ) ) ( not ( = ?auto_1027628 ?auto_1027629 ) ) ( not ( = ?auto_1027628 ?auto_1027630 ) ) ( not ( = ?auto_1027628 ?auto_1027631 ) ) ( not ( = ?auto_1027628 ?auto_1027632 ) ) ( not ( = ?auto_1027628 ?auto_1027633 ) ) ( not ( = ?auto_1027628 ?auto_1027634 ) ) ( not ( = ?auto_1027628 ?auto_1027635 ) ) ( not ( = ?auto_1027628 ?auto_1027636 ) ) ( not ( = ?auto_1027628 ?auto_1027637 ) ) ( not ( = ?auto_1027629 ?auto_1027630 ) ) ( not ( = ?auto_1027629 ?auto_1027631 ) ) ( not ( = ?auto_1027629 ?auto_1027632 ) ) ( not ( = ?auto_1027629 ?auto_1027633 ) ) ( not ( = ?auto_1027629 ?auto_1027634 ) ) ( not ( = ?auto_1027629 ?auto_1027635 ) ) ( not ( = ?auto_1027629 ?auto_1027636 ) ) ( not ( = ?auto_1027629 ?auto_1027637 ) ) ( not ( = ?auto_1027630 ?auto_1027631 ) ) ( not ( = ?auto_1027630 ?auto_1027632 ) ) ( not ( = ?auto_1027630 ?auto_1027633 ) ) ( not ( = ?auto_1027630 ?auto_1027634 ) ) ( not ( = ?auto_1027630 ?auto_1027635 ) ) ( not ( = ?auto_1027630 ?auto_1027636 ) ) ( not ( = ?auto_1027630 ?auto_1027637 ) ) ( not ( = ?auto_1027631 ?auto_1027632 ) ) ( not ( = ?auto_1027631 ?auto_1027633 ) ) ( not ( = ?auto_1027631 ?auto_1027634 ) ) ( not ( = ?auto_1027631 ?auto_1027635 ) ) ( not ( = ?auto_1027631 ?auto_1027636 ) ) ( not ( = ?auto_1027631 ?auto_1027637 ) ) ( not ( = ?auto_1027632 ?auto_1027633 ) ) ( not ( = ?auto_1027632 ?auto_1027634 ) ) ( not ( = ?auto_1027632 ?auto_1027635 ) ) ( not ( = ?auto_1027632 ?auto_1027636 ) ) ( not ( = ?auto_1027632 ?auto_1027637 ) ) ( not ( = ?auto_1027633 ?auto_1027634 ) ) ( not ( = ?auto_1027633 ?auto_1027635 ) ) ( not ( = ?auto_1027633 ?auto_1027636 ) ) ( not ( = ?auto_1027633 ?auto_1027637 ) ) ( not ( = ?auto_1027634 ?auto_1027635 ) ) ( not ( = ?auto_1027634 ?auto_1027636 ) ) ( not ( = ?auto_1027634 ?auto_1027637 ) ) ( not ( = ?auto_1027635 ?auto_1027636 ) ) ( not ( = ?auto_1027635 ?auto_1027637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1027636 ?auto_1027637 )
      ( MAKE-13CRATE-VERIFY ?auto_1027624 ?auto_1027625 ?auto_1027626 ?auto_1027627 ?auto_1027628 ?auto_1027629 ?auto_1027630 ?auto_1027631 ?auto_1027632 ?auto_1027633 ?auto_1027634 ?auto_1027635 ?auto_1027636 ?auto_1027637 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027766 - SURFACE
      ?auto_1027767 - SURFACE
      ?auto_1027768 - SURFACE
      ?auto_1027769 - SURFACE
      ?auto_1027770 - SURFACE
      ?auto_1027771 - SURFACE
      ?auto_1027772 - SURFACE
      ?auto_1027773 - SURFACE
      ?auto_1027774 - SURFACE
      ?auto_1027775 - SURFACE
      ?auto_1027776 - SURFACE
      ?auto_1027777 - SURFACE
      ?auto_1027778 - SURFACE
      ?auto_1027779 - SURFACE
    )
    :vars
    (
      ?auto_1027782 - HOIST
      ?auto_1027780 - PLACE
      ?auto_1027781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027782 ?auto_1027780 ) ( SURFACE-AT ?auto_1027778 ?auto_1027780 ) ( CLEAR ?auto_1027778 ) ( IS-CRATE ?auto_1027779 ) ( not ( = ?auto_1027778 ?auto_1027779 ) ) ( TRUCK-AT ?auto_1027781 ?auto_1027780 ) ( AVAILABLE ?auto_1027782 ) ( IN ?auto_1027779 ?auto_1027781 ) ( ON ?auto_1027778 ?auto_1027777 ) ( not ( = ?auto_1027777 ?auto_1027778 ) ) ( not ( = ?auto_1027777 ?auto_1027779 ) ) ( ON ?auto_1027767 ?auto_1027766 ) ( ON ?auto_1027768 ?auto_1027767 ) ( ON ?auto_1027769 ?auto_1027768 ) ( ON ?auto_1027770 ?auto_1027769 ) ( ON ?auto_1027771 ?auto_1027770 ) ( ON ?auto_1027772 ?auto_1027771 ) ( ON ?auto_1027773 ?auto_1027772 ) ( ON ?auto_1027774 ?auto_1027773 ) ( ON ?auto_1027775 ?auto_1027774 ) ( ON ?auto_1027776 ?auto_1027775 ) ( ON ?auto_1027777 ?auto_1027776 ) ( not ( = ?auto_1027766 ?auto_1027767 ) ) ( not ( = ?auto_1027766 ?auto_1027768 ) ) ( not ( = ?auto_1027766 ?auto_1027769 ) ) ( not ( = ?auto_1027766 ?auto_1027770 ) ) ( not ( = ?auto_1027766 ?auto_1027771 ) ) ( not ( = ?auto_1027766 ?auto_1027772 ) ) ( not ( = ?auto_1027766 ?auto_1027773 ) ) ( not ( = ?auto_1027766 ?auto_1027774 ) ) ( not ( = ?auto_1027766 ?auto_1027775 ) ) ( not ( = ?auto_1027766 ?auto_1027776 ) ) ( not ( = ?auto_1027766 ?auto_1027777 ) ) ( not ( = ?auto_1027766 ?auto_1027778 ) ) ( not ( = ?auto_1027766 ?auto_1027779 ) ) ( not ( = ?auto_1027767 ?auto_1027768 ) ) ( not ( = ?auto_1027767 ?auto_1027769 ) ) ( not ( = ?auto_1027767 ?auto_1027770 ) ) ( not ( = ?auto_1027767 ?auto_1027771 ) ) ( not ( = ?auto_1027767 ?auto_1027772 ) ) ( not ( = ?auto_1027767 ?auto_1027773 ) ) ( not ( = ?auto_1027767 ?auto_1027774 ) ) ( not ( = ?auto_1027767 ?auto_1027775 ) ) ( not ( = ?auto_1027767 ?auto_1027776 ) ) ( not ( = ?auto_1027767 ?auto_1027777 ) ) ( not ( = ?auto_1027767 ?auto_1027778 ) ) ( not ( = ?auto_1027767 ?auto_1027779 ) ) ( not ( = ?auto_1027768 ?auto_1027769 ) ) ( not ( = ?auto_1027768 ?auto_1027770 ) ) ( not ( = ?auto_1027768 ?auto_1027771 ) ) ( not ( = ?auto_1027768 ?auto_1027772 ) ) ( not ( = ?auto_1027768 ?auto_1027773 ) ) ( not ( = ?auto_1027768 ?auto_1027774 ) ) ( not ( = ?auto_1027768 ?auto_1027775 ) ) ( not ( = ?auto_1027768 ?auto_1027776 ) ) ( not ( = ?auto_1027768 ?auto_1027777 ) ) ( not ( = ?auto_1027768 ?auto_1027778 ) ) ( not ( = ?auto_1027768 ?auto_1027779 ) ) ( not ( = ?auto_1027769 ?auto_1027770 ) ) ( not ( = ?auto_1027769 ?auto_1027771 ) ) ( not ( = ?auto_1027769 ?auto_1027772 ) ) ( not ( = ?auto_1027769 ?auto_1027773 ) ) ( not ( = ?auto_1027769 ?auto_1027774 ) ) ( not ( = ?auto_1027769 ?auto_1027775 ) ) ( not ( = ?auto_1027769 ?auto_1027776 ) ) ( not ( = ?auto_1027769 ?auto_1027777 ) ) ( not ( = ?auto_1027769 ?auto_1027778 ) ) ( not ( = ?auto_1027769 ?auto_1027779 ) ) ( not ( = ?auto_1027770 ?auto_1027771 ) ) ( not ( = ?auto_1027770 ?auto_1027772 ) ) ( not ( = ?auto_1027770 ?auto_1027773 ) ) ( not ( = ?auto_1027770 ?auto_1027774 ) ) ( not ( = ?auto_1027770 ?auto_1027775 ) ) ( not ( = ?auto_1027770 ?auto_1027776 ) ) ( not ( = ?auto_1027770 ?auto_1027777 ) ) ( not ( = ?auto_1027770 ?auto_1027778 ) ) ( not ( = ?auto_1027770 ?auto_1027779 ) ) ( not ( = ?auto_1027771 ?auto_1027772 ) ) ( not ( = ?auto_1027771 ?auto_1027773 ) ) ( not ( = ?auto_1027771 ?auto_1027774 ) ) ( not ( = ?auto_1027771 ?auto_1027775 ) ) ( not ( = ?auto_1027771 ?auto_1027776 ) ) ( not ( = ?auto_1027771 ?auto_1027777 ) ) ( not ( = ?auto_1027771 ?auto_1027778 ) ) ( not ( = ?auto_1027771 ?auto_1027779 ) ) ( not ( = ?auto_1027772 ?auto_1027773 ) ) ( not ( = ?auto_1027772 ?auto_1027774 ) ) ( not ( = ?auto_1027772 ?auto_1027775 ) ) ( not ( = ?auto_1027772 ?auto_1027776 ) ) ( not ( = ?auto_1027772 ?auto_1027777 ) ) ( not ( = ?auto_1027772 ?auto_1027778 ) ) ( not ( = ?auto_1027772 ?auto_1027779 ) ) ( not ( = ?auto_1027773 ?auto_1027774 ) ) ( not ( = ?auto_1027773 ?auto_1027775 ) ) ( not ( = ?auto_1027773 ?auto_1027776 ) ) ( not ( = ?auto_1027773 ?auto_1027777 ) ) ( not ( = ?auto_1027773 ?auto_1027778 ) ) ( not ( = ?auto_1027773 ?auto_1027779 ) ) ( not ( = ?auto_1027774 ?auto_1027775 ) ) ( not ( = ?auto_1027774 ?auto_1027776 ) ) ( not ( = ?auto_1027774 ?auto_1027777 ) ) ( not ( = ?auto_1027774 ?auto_1027778 ) ) ( not ( = ?auto_1027774 ?auto_1027779 ) ) ( not ( = ?auto_1027775 ?auto_1027776 ) ) ( not ( = ?auto_1027775 ?auto_1027777 ) ) ( not ( = ?auto_1027775 ?auto_1027778 ) ) ( not ( = ?auto_1027775 ?auto_1027779 ) ) ( not ( = ?auto_1027776 ?auto_1027777 ) ) ( not ( = ?auto_1027776 ?auto_1027778 ) ) ( not ( = ?auto_1027776 ?auto_1027779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1027777 ?auto_1027778 ?auto_1027779 )
      ( MAKE-13CRATE-VERIFY ?auto_1027766 ?auto_1027767 ?auto_1027768 ?auto_1027769 ?auto_1027770 ?auto_1027771 ?auto_1027772 ?auto_1027773 ?auto_1027774 ?auto_1027775 ?auto_1027776 ?auto_1027777 ?auto_1027778 ?auto_1027779 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027922 - SURFACE
      ?auto_1027923 - SURFACE
      ?auto_1027924 - SURFACE
      ?auto_1027925 - SURFACE
      ?auto_1027926 - SURFACE
      ?auto_1027927 - SURFACE
      ?auto_1027928 - SURFACE
      ?auto_1027929 - SURFACE
      ?auto_1027930 - SURFACE
      ?auto_1027931 - SURFACE
      ?auto_1027932 - SURFACE
      ?auto_1027933 - SURFACE
      ?auto_1027934 - SURFACE
      ?auto_1027935 - SURFACE
    )
    :vars
    (
      ?auto_1027937 - HOIST
      ?auto_1027939 - PLACE
      ?auto_1027938 - TRUCK
      ?auto_1027936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027937 ?auto_1027939 ) ( SURFACE-AT ?auto_1027934 ?auto_1027939 ) ( CLEAR ?auto_1027934 ) ( IS-CRATE ?auto_1027935 ) ( not ( = ?auto_1027934 ?auto_1027935 ) ) ( AVAILABLE ?auto_1027937 ) ( IN ?auto_1027935 ?auto_1027938 ) ( ON ?auto_1027934 ?auto_1027933 ) ( not ( = ?auto_1027933 ?auto_1027934 ) ) ( not ( = ?auto_1027933 ?auto_1027935 ) ) ( TRUCK-AT ?auto_1027938 ?auto_1027936 ) ( not ( = ?auto_1027936 ?auto_1027939 ) ) ( ON ?auto_1027923 ?auto_1027922 ) ( ON ?auto_1027924 ?auto_1027923 ) ( ON ?auto_1027925 ?auto_1027924 ) ( ON ?auto_1027926 ?auto_1027925 ) ( ON ?auto_1027927 ?auto_1027926 ) ( ON ?auto_1027928 ?auto_1027927 ) ( ON ?auto_1027929 ?auto_1027928 ) ( ON ?auto_1027930 ?auto_1027929 ) ( ON ?auto_1027931 ?auto_1027930 ) ( ON ?auto_1027932 ?auto_1027931 ) ( ON ?auto_1027933 ?auto_1027932 ) ( not ( = ?auto_1027922 ?auto_1027923 ) ) ( not ( = ?auto_1027922 ?auto_1027924 ) ) ( not ( = ?auto_1027922 ?auto_1027925 ) ) ( not ( = ?auto_1027922 ?auto_1027926 ) ) ( not ( = ?auto_1027922 ?auto_1027927 ) ) ( not ( = ?auto_1027922 ?auto_1027928 ) ) ( not ( = ?auto_1027922 ?auto_1027929 ) ) ( not ( = ?auto_1027922 ?auto_1027930 ) ) ( not ( = ?auto_1027922 ?auto_1027931 ) ) ( not ( = ?auto_1027922 ?auto_1027932 ) ) ( not ( = ?auto_1027922 ?auto_1027933 ) ) ( not ( = ?auto_1027922 ?auto_1027934 ) ) ( not ( = ?auto_1027922 ?auto_1027935 ) ) ( not ( = ?auto_1027923 ?auto_1027924 ) ) ( not ( = ?auto_1027923 ?auto_1027925 ) ) ( not ( = ?auto_1027923 ?auto_1027926 ) ) ( not ( = ?auto_1027923 ?auto_1027927 ) ) ( not ( = ?auto_1027923 ?auto_1027928 ) ) ( not ( = ?auto_1027923 ?auto_1027929 ) ) ( not ( = ?auto_1027923 ?auto_1027930 ) ) ( not ( = ?auto_1027923 ?auto_1027931 ) ) ( not ( = ?auto_1027923 ?auto_1027932 ) ) ( not ( = ?auto_1027923 ?auto_1027933 ) ) ( not ( = ?auto_1027923 ?auto_1027934 ) ) ( not ( = ?auto_1027923 ?auto_1027935 ) ) ( not ( = ?auto_1027924 ?auto_1027925 ) ) ( not ( = ?auto_1027924 ?auto_1027926 ) ) ( not ( = ?auto_1027924 ?auto_1027927 ) ) ( not ( = ?auto_1027924 ?auto_1027928 ) ) ( not ( = ?auto_1027924 ?auto_1027929 ) ) ( not ( = ?auto_1027924 ?auto_1027930 ) ) ( not ( = ?auto_1027924 ?auto_1027931 ) ) ( not ( = ?auto_1027924 ?auto_1027932 ) ) ( not ( = ?auto_1027924 ?auto_1027933 ) ) ( not ( = ?auto_1027924 ?auto_1027934 ) ) ( not ( = ?auto_1027924 ?auto_1027935 ) ) ( not ( = ?auto_1027925 ?auto_1027926 ) ) ( not ( = ?auto_1027925 ?auto_1027927 ) ) ( not ( = ?auto_1027925 ?auto_1027928 ) ) ( not ( = ?auto_1027925 ?auto_1027929 ) ) ( not ( = ?auto_1027925 ?auto_1027930 ) ) ( not ( = ?auto_1027925 ?auto_1027931 ) ) ( not ( = ?auto_1027925 ?auto_1027932 ) ) ( not ( = ?auto_1027925 ?auto_1027933 ) ) ( not ( = ?auto_1027925 ?auto_1027934 ) ) ( not ( = ?auto_1027925 ?auto_1027935 ) ) ( not ( = ?auto_1027926 ?auto_1027927 ) ) ( not ( = ?auto_1027926 ?auto_1027928 ) ) ( not ( = ?auto_1027926 ?auto_1027929 ) ) ( not ( = ?auto_1027926 ?auto_1027930 ) ) ( not ( = ?auto_1027926 ?auto_1027931 ) ) ( not ( = ?auto_1027926 ?auto_1027932 ) ) ( not ( = ?auto_1027926 ?auto_1027933 ) ) ( not ( = ?auto_1027926 ?auto_1027934 ) ) ( not ( = ?auto_1027926 ?auto_1027935 ) ) ( not ( = ?auto_1027927 ?auto_1027928 ) ) ( not ( = ?auto_1027927 ?auto_1027929 ) ) ( not ( = ?auto_1027927 ?auto_1027930 ) ) ( not ( = ?auto_1027927 ?auto_1027931 ) ) ( not ( = ?auto_1027927 ?auto_1027932 ) ) ( not ( = ?auto_1027927 ?auto_1027933 ) ) ( not ( = ?auto_1027927 ?auto_1027934 ) ) ( not ( = ?auto_1027927 ?auto_1027935 ) ) ( not ( = ?auto_1027928 ?auto_1027929 ) ) ( not ( = ?auto_1027928 ?auto_1027930 ) ) ( not ( = ?auto_1027928 ?auto_1027931 ) ) ( not ( = ?auto_1027928 ?auto_1027932 ) ) ( not ( = ?auto_1027928 ?auto_1027933 ) ) ( not ( = ?auto_1027928 ?auto_1027934 ) ) ( not ( = ?auto_1027928 ?auto_1027935 ) ) ( not ( = ?auto_1027929 ?auto_1027930 ) ) ( not ( = ?auto_1027929 ?auto_1027931 ) ) ( not ( = ?auto_1027929 ?auto_1027932 ) ) ( not ( = ?auto_1027929 ?auto_1027933 ) ) ( not ( = ?auto_1027929 ?auto_1027934 ) ) ( not ( = ?auto_1027929 ?auto_1027935 ) ) ( not ( = ?auto_1027930 ?auto_1027931 ) ) ( not ( = ?auto_1027930 ?auto_1027932 ) ) ( not ( = ?auto_1027930 ?auto_1027933 ) ) ( not ( = ?auto_1027930 ?auto_1027934 ) ) ( not ( = ?auto_1027930 ?auto_1027935 ) ) ( not ( = ?auto_1027931 ?auto_1027932 ) ) ( not ( = ?auto_1027931 ?auto_1027933 ) ) ( not ( = ?auto_1027931 ?auto_1027934 ) ) ( not ( = ?auto_1027931 ?auto_1027935 ) ) ( not ( = ?auto_1027932 ?auto_1027933 ) ) ( not ( = ?auto_1027932 ?auto_1027934 ) ) ( not ( = ?auto_1027932 ?auto_1027935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1027933 ?auto_1027934 ?auto_1027935 )
      ( MAKE-13CRATE-VERIFY ?auto_1027922 ?auto_1027923 ?auto_1027924 ?auto_1027925 ?auto_1027926 ?auto_1027927 ?auto_1027928 ?auto_1027929 ?auto_1027930 ?auto_1027931 ?auto_1027932 ?auto_1027933 ?auto_1027934 ?auto_1027935 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028091 - SURFACE
      ?auto_1028092 - SURFACE
      ?auto_1028093 - SURFACE
      ?auto_1028094 - SURFACE
      ?auto_1028095 - SURFACE
      ?auto_1028096 - SURFACE
      ?auto_1028097 - SURFACE
      ?auto_1028098 - SURFACE
      ?auto_1028099 - SURFACE
      ?auto_1028100 - SURFACE
      ?auto_1028101 - SURFACE
      ?auto_1028102 - SURFACE
      ?auto_1028103 - SURFACE
      ?auto_1028104 - SURFACE
    )
    :vars
    (
      ?auto_1028106 - HOIST
      ?auto_1028105 - PLACE
      ?auto_1028108 - TRUCK
      ?auto_1028109 - PLACE
      ?auto_1028107 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028106 ?auto_1028105 ) ( SURFACE-AT ?auto_1028103 ?auto_1028105 ) ( CLEAR ?auto_1028103 ) ( IS-CRATE ?auto_1028104 ) ( not ( = ?auto_1028103 ?auto_1028104 ) ) ( AVAILABLE ?auto_1028106 ) ( ON ?auto_1028103 ?auto_1028102 ) ( not ( = ?auto_1028102 ?auto_1028103 ) ) ( not ( = ?auto_1028102 ?auto_1028104 ) ) ( TRUCK-AT ?auto_1028108 ?auto_1028109 ) ( not ( = ?auto_1028109 ?auto_1028105 ) ) ( HOIST-AT ?auto_1028107 ?auto_1028109 ) ( LIFTING ?auto_1028107 ?auto_1028104 ) ( not ( = ?auto_1028106 ?auto_1028107 ) ) ( ON ?auto_1028092 ?auto_1028091 ) ( ON ?auto_1028093 ?auto_1028092 ) ( ON ?auto_1028094 ?auto_1028093 ) ( ON ?auto_1028095 ?auto_1028094 ) ( ON ?auto_1028096 ?auto_1028095 ) ( ON ?auto_1028097 ?auto_1028096 ) ( ON ?auto_1028098 ?auto_1028097 ) ( ON ?auto_1028099 ?auto_1028098 ) ( ON ?auto_1028100 ?auto_1028099 ) ( ON ?auto_1028101 ?auto_1028100 ) ( ON ?auto_1028102 ?auto_1028101 ) ( not ( = ?auto_1028091 ?auto_1028092 ) ) ( not ( = ?auto_1028091 ?auto_1028093 ) ) ( not ( = ?auto_1028091 ?auto_1028094 ) ) ( not ( = ?auto_1028091 ?auto_1028095 ) ) ( not ( = ?auto_1028091 ?auto_1028096 ) ) ( not ( = ?auto_1028091 ?auto_1028097 ) ) ( not ( = ?auto_1028091 ?auto_1028098 ) ) ( not ( = ?auto_1028091 ?auto_1028099 ) ) ( not ( = ?auto_1028091 ?auto_1028100 ) ) ( not ( = ?auto_1028091 ?auto_1028101 ) ) ( not ( = ?auto_1028091 ?auto_1028102 ) ) ( not ( = ?auto_1028091 ?auto_1028103 ) ) ( not ( = ?auto_1028091 ?auto_1028104 ) ) ( not ( = ?auto_1028092 ?auto_1028093 ) ) ( not ( = ?auto_1028092 ?auto_1028094 ) ) ( not ( = ?auto_1028092 ?auto_1028095 ) ) ( not ( = ?auto_1028092 ?auto_1028096 ) ) ( not ( = ?auto_1028092 ?auto_1028097 ) ) ( not ( = ?auto_1028092 ?auto_1028098 ) ) ( not ( = ?auto_1028092 ?auto_1028099 ) ) ( not ( = ?auto_1028092 ?auto_1028100 ) ) ( not ( = ?auto_1028092 ?auto_1028101 ) ) ( not ( = ?auto_1028092 ?auto_1028102 ) ) ( not ( = ?auto_1028092 ?auto_1028103 ) ) ( not ( = ?auto_1028092 ?auto_1028104 ) ) ( not ( = ?auto_1028093 ?auto_1028094 ) ) ( not ( = ?auto_1028093 ?auto_1028095 ) ) ( not ( = ?auto_1028093 ?auto_1028096 ) ) ( not ( = ?auto_1028093 ?auto_1028097 ) ) ( not ( = ?auto_1028093 ?auto_1028098 ) ) ( not ( = ?auto_1028093 ?auto_1028099 ) ) ( not ( = ?auto_1028093 ?auto_1028100 ) ) ( not ( = ?auto_1028093 ?auto_1028101 ) ) ( not ( = ?auto_1028093 ?auto_1028102 ) ) ( not ( = ?auto_1028093 ?auto_1028103 ) ) ( not ( = ?auto_1028093 ?auto_1028104 ) ) ( not ( = ?auto_1028094 ?auto_1028095 ) ) ( not ( = ?auto_1028094 ?auto_1028096 ) ) ( not ( = ?auto_1028094 ?auto_1028097 ) ) ( not ( = ?auto_1028094 ?auto_1028098 ) ) ( not ( = ?auto_1028094 ?auto_1028099 ) ) ( not ( = ?auto_1028094 ?auto_1028100 ) ) ( not ( = ?auto_1028094 ?auto_1028101 ) ) ( not ( = ?auto_1028094 ?auto_1028102 ) ) ( not ( = ?auto_1028094 ?auto_1028103 ) ) ( not ( = ?auto_1028094 ?auto_1028104 ) ) ( not ( = ?auto_1028095 ?auto_1028096 ) ) ( not ( = ?auto_1028095 ?auto_1028097 ) ) ( not ( = ?auto_1028095 ?auto_1028098 ) ) ( not ( = ?auto_1028095 ?auto_1028099 ) ) ( not ( = ?auto_1028095 ?auto_1028100 ) ) ( not ( = ?auto_1028095 ?auto_1028101 ) ) ( not ( = ?auto_1028095 ?auto_1028102 ) ) ( not ( = ?auto_1028095 ?auto_1028103 ) ) ( not ( = ?auto_1028095 ?auto_1028104 ) ) ( not ( = ?auto_1028096 ?auto_1028097 ) ) ( not ( = ?auto_1028096 ?auto_1028098 ) ) ( not ( = ?auto_1028096 ?auto_1028099 ) ) ( not ( = ?auto_1028096 ?auto_1028100 ) ) ( not ( = ?auto_1028096 ?auto_1028101 ) ) ( not ( = ?auto_1028096 ?auto_1028102 ) ) ( not ( = ?auto_1028096 ?auto_1028103 ) ) ( not ( = ?auto_1028096 ?auto_1028104 ) ) ( not ( = ?auto_1028097 ?auto_1028098 ) ) ( not ( = ?auto_1028097 ?auto_1028099 ) ) ( not ( = ?auto_1028097 ?auto_1028100 ) ) ( not ( = ?auto_1028097 ?auto_1028101 ) ) ( not ( = ?auto_1028097 ?auto_1028102 ) ) ( not ( = ?auto_1028097 ?auto_1028103 ) ) ( not ( = ?auto_1028097 ?auto_1028104 ) ) ( not ( = ?auto_1028098 ?auto_1028099 ) ) ( not ( = ?auto_1028098 ?auto_1028100 ) ) ( not ( = ?auto_1028098 ?auto_1028101 ) ) ( not ( = ?auto_1028098 ?auto_1028102 ) ) ( not ( = ?auto_1028098 ?auto_1028103 ) ) ( not ( = ?auto_1028098 ?auto_1028104 ) ) ( not ( = ?auto_1028099 ?auto_1028100 ) ) ( not ( = ?auto_1028099 ?auto_1028101 ) ) ( not ( = ?auto_1028099 ?auto_1028102 ) ) ( not ( = ?auto_1028099 ?auto_1028103 ) ) ( not ( = ?auto_1028099 ?auto_1028104 ) ) ( not ( = ?auto_1028100 ?auto_1028101 ) ) ( not ( = ?auto_1028100 ?auto_1028102 ) ) ( not ( = ?auto_1028100 ?auto_1028103 ) ) ( not ( = ?auto_1028100 ?auto_1028104 ) ) ( not ( = ?auto_1028101 ?auto_1028102 ) ) ( not ( = ?auto_1028101 ?auto_1028103 ) ) ( not ( = ?auto_1028101 ?auto_1028104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028102 ?auto_1028103 ?auto_1028104 )
      ( MAKE-13CRATE-VERIFY ?auto_1028091 ?auto_1028092 ?auto_1028093 ?auto_1028094 ?auto_1028095 ?auto_1028096 ?auto_1028097 ?auto_1028098 ?auto_1028099 ?auto_1028100 ?auto_1028101 ?auto_1028102 ?auto_1028103 ?auto_1028104 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028273 - SURFACE
      ?auto_1028274 - SURFACE
      ?auto_1028275 - SURFACE
      ?auto_1028276 - SURFACE
      ?auto_1028277 - SURFACE
      ?auto_1028278 - SURFACE
      ?auto_1028279 - SURFACE
      ?auto_1028280 - SURFACE
      ?auto_1028281 - SURFACE
      ?auto_1028282 - SURFACE
      ?auto_1028283 - SURFACE
      ?auto_1028284 - SURFACE
      ?auto_1028285 - SURFACE
      ?auto_1028286 - SURFACE
    )
    :vars
    (
      ?auto_1028290 - HOIST
      ?auto_1028289 - PLACE
      ?auto_1028287 - TRUCK
      ?auto_1028291 - PLACE
      ?auto_1028292 - HOIST
      ?auto_1028288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028290 ?auto_1028289 ) ( SURFACE-AT ?auto_1028285 ?auto_1028289 ) ( CLEAR ?auto_1028285 ) ( IS-CRATE ?auto_1028286 ) ( not ( = ?auto_1028285 ?auto_1028286 ) ) ( AVAILABLE ?auto_1028290 ) ( ON ?auto_1028285 ?auto_1028284 ) ( not ( = ?auto_1028284 ?auto_1028285 ) ) ( not ( = ?auto_1028284 ?auto_1028286 ) ) ( TRUCK-AT ?auto_1028287 ?auto_1028291 ) ( not ( = ?auto_1028291 ?auto_1028289 ) ) ( HOIST-AT ?auto_1028292 ?auto_1028291 ) ( not ( = ?auto_1028290 ?auto_1028292 ) ) ( AVAILABLE ?auto_1028292 ) ( SURFACE-AT ?auto_1028286 ?auto_1028291 ) ( ON ?auto_1028286 ?auto_1028288 ) ( CLEAR ?auto_1028286 ) ( not ( = ?auto_1028285 ?auto_1028288 ) ) ( not ( = ?auto_1028286 ?auto_1028288 ) ) ( not ( = ?auto_1028284 ?auto_1028288 ) ) ( ON ?auto_1028274 ?auto_1028273 ) ( ON ?auto_1028275 ?auto_1028274 ) ( ON ?auto_1028276 ?auto_1028275 ) ( ON ?auto_1028277 ?auto_1028276 ) ( ON ?auto_1028278 ?auto_1028277 ) ( ON ?auto_1028279 ?auto_1028278 ) ( ON ?auto_1028280 ?auto_1028279 ) ( ON ?auto_1028281 ?auto_1028280 ) ( ON ?auto_1028282 ?auto_1028281 ) ( ON ?auto_1028283 ?auto_1028282 ) ( ON ?auto_1028284 ?auto_1028283 ) ( not ( = ?auto_1028273 ?auto_1028274 ) ) ( not ( = ?auto_1028273 ?auto_1028275 ) ) ( not ( = ?auto_1028273 ?auto_1028276 ) ) ( not ( = ?auto_1028273 ?auto_1028277 ) ) ( not ( = ?auto_1028273 ?auto_1028278 ) ) ( not ( = ?auto_1028273 ?auto_1028279 ) ) ( not ( = ?auto_1028273 ?auto_1028280 ) ) ( not ( = ?auto_1028273 ?auto_1028281 ) ) ( not ( = ?auto_1028273 ?auto_1028282 ) ) ( not ( = ?auto_1028273 ?auto_1028283 ) ) ( not ( = ?auto_1028273 ?auto_1028284 ) ) ( not ( = ?auto_1028273 ?auto_1028285 ) ) ( not ( = ?auto_1028273 ?auto_1028286 ) ) ( not ( = ?auto_1028273 ?auto_1028288 ) ) ( not ( = ?auto_1028274 ?auto_1028275 ) ) ( not ( = ?auto_1028274 ?auto_1028276 ) ) ( not ( = ?auto_1028274 ?auto_1028277 ) ) ( not ( = ?auto_1028274 ?auto_1028278 ) ) ( not ( = ?auto_1028274 ?auto_1028279 ) ) ( not ( = ?auto_1028274 ?auto_1028280 ) ) ( not ( = ?auto_1028274 ?auto_1028281 ) ) ( not ( = ?auto_1028274 ?auto_1028282 ) ) ( not ( = ?auto_1028274 ?auto_1028283 ) ) ( not ( = ?auto_1028274 ?auto_1028284 ) ) ( not ( = ?auto_1028274 ?auto_1028285 ) ) ( not ( = ?auto_1028274 ?auto_1028286 ) ) ( not ( = ?auto_1028274 ?auto_1028288 ) ) ( not ( = ?auto_1028275 ?auto_1028276 ) ) ( not ( = ?auto_1028275 ?auto_1028277 ) ) ( not ( = ?auto_1028275 ?auto_1028278 ) ) ( not ( = ?auto_1028275 ?auto_1028279 ) ) ( not ( = ?auto_1028275 ?auto_1028280 ) ) ( not ( = ?auto_1028275 ?auto_1028281 ) ) ( not ( = ?auto_1028275 ?auto_1028282 ) ) ( not ( = ?auto_1028275 ?auto_1028283 ) ) ( not ( = ?auto_1028275 ?auto_1028284 ) ) ( not ( = ?auto_1028275 ?auto_1028285 ) ) ( not ( = ?auto_1028275 ?auto_1028286 ) ) ( not ( = ?auto_1028275 ?auto_1028288 ) ) ( not ( = ?auto_1028276 ?auto_1028277 ) ) ( not ( = ?auto_1028276 ?auto_1028278 ) ) ( not ( = ?auto_1028276 ?auto_1028279 ) ) ( not ( = ?auto_1028276 ?auto_1028280 ) ) ( not ( = ?auto_1028276 ?auto_1028281 ) ) ( not ( = ?auto_1028276 ?auto_1028282 ) ) ( not ( = ?auto_1028276 ?auto_1028283 ) ) ( not ( = ?auto_1028276 ?auto_1028284 ) ) ( not ( = ?auto_1028276 ?auto_1028285 ) ) ( not ( = ?auto_1028276 ?auto_1028286 ) ) ( not ( = ?auto_1028276 ?auto_1028288 ) ) ( not ( = ?auto_1028277 ?auto_1028278 ) ) ( not ( = ?auto_1028277 ?auto_1028279 ) ) ( not ( = ?auto_1028277 ?auto_1028280 ) ) ( not ( = ?auto_1028277 ?auto_1028281 ) ) ( not ( = ?auto_1028277 ?auto_1028282 ) ) ( not ( = ?auto_1028277 ?auto_1028283 ) ) ( not ( = ?auto_1028277 ?auto_1028284 ) ) ( not ( = ?auto_1028277 ?auto_1028285 ) ) ( not ( = ?auto_1028277 ?auto_1028286 ) ) ( not ( = ?auto_1028277 ?auto_1028288 ) ) ( not ( = ?auto_1028278 ?auto_1028279 ) ) ( not ( = ?auto_1028278 ?auto_1028280 ) ) ( not ( = ?auto_1028278 ?auto_1028281 ) ) ( not ( = ?auto_1028278 ?auto_1028282 ) ) ( not ( = ?auto_1028278 ?auto_1028283 ) ) ( not ( = ?auto_1028278 ?auto_1028284 ) ) ( not ( = ?auto_1028278 ?auto_1028285 ) ) ( not ( = ?auto_1028278 ?auto_1028286 ) ) ( not ( = ?auto_1028278 ?auto_1028288 ) ) ( not ( = ?auto_1028279 ?auto_1028280 ) ) ( not ( = ?auto_1028279 ?auto_1028281 ) ) ( not ( = ?auto_1028279 ?auto_1028282 ) ) ( not ( = ?auto_1028279 ?auto_1028283 ) ) ( not ( = ?auto_1028279 ?auto_1028284 ) ) ( not ( = ?auto_1028279 ?auto_1028285 ) ) ( not ( = ?auto_1028279 ?auto_1028286 ) ) ( not ( = ?auto_1028279 ?auto_1028288 ) ) ( not ( = ?auto_1028280 ?auto_1028281 ) ) ( not ( = ?auto_1028280 ?auto_1028282 ) ) ( not ( = ?auto_1028280 ?auto_1028283 ) ) ( not ( = ?auto_1028280 ?auto_1028284 ) ) ( not ( = ?auto_1028280 ?auto_1028285 ) ) ( not ( = ?auto_1028280 ?auto_1028286 ) ) ( not ( = ?auto_1028280 ?auto_1028288 ) ) ( not ( = ?auto_1028281 ?auto_1028282 ) ) ( not ( = ?auto_1028281 ?auto_1028283 ) ) ( not ( = ?auto_1028281 ?auto_1028284 ) ) ( not ( = ?auto_1028281 ?auto_1028285 ) ) ( not ( = ?auto_1028281 ?auto_1028286 ) ) ( not ( = ?auto_1028281 ?auto_1028288 ) ) ( not ( = ?auto_1028282 ?auto_1028283 ) ) ( not ( = ?auto_1028282 ?auto_1028284 ) ) ( not ( = ?auto_1028282 ?auto_1028285 ) ) ( not ( = ?auto_1028282 ?auto_1028286 ) ) ( not ( = ?auto_1028282 ?auto_1028288 ) ) ( not ( = ?auto_1028283 ?auto_1028284 ) ) ( not ( = ?auto_1028283 ?auto_1028285 ) ) ( not ( = ?auto_1028283 ?auto_1028286 ) ) ( not ( = ?auto_1028283 ?auto_1028288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028284 ?auto_1028285 ?auto_1028286 )
      ( MAKE-13CRATE-VERIFY ?auto_1028273 ?auto_1028274 ?auto_1028275 ?auto_1028276 ?auto_1028277 ?auto_1028278 ?auto_1028279 ?auto_1028280 ?auto_1028281 ?auto_1028282 ?auto_1028283 ?auto_1028284 ?auto_1028285 ?auto_1028286 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028456 - SURFACE
      ?auto_1028457 - SURFACE
      ?auto_1028458 - SURFACE
      ?auto_1028459 - SURFACE
      ?auto_1028460 - SURFACE
      ?auto_1028461 - SURFACE
      ?auto_1028462 - SURFACE
      ?auto_1028463 - SURFACE
      ?auto_1028464 - SURFACE
      ?auto_1028465 - SURFACE
      ?auto_1028466 - SURFACE
      ?auto_1028467 - SURFACE
      ?auto_1028468 - SURFACE
      ?auto_1028469 - SURFACE
    )
    :vars
    (
      ?auto_1028474 - HOIST
      ?auto_1028472 - PLACE
      ?auto_1028475 - PLACE
      ?auto_1028471 - HOIST
      ?auto_1028470 - SURFACE
      ?auto_1028473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028474 ?auto_1028472 ) ( SURFACE-AT ?auto_1028468 ?auto_1028472 ) ( CLEAR ?auto_1028468 ) ( IS-CRATE ?auto_1028469 ) ( not ( = ?auto_1028468 ?auto_1028469 ) ) ( AVAILABLE ?auto_1028474 ) ( ON ?auto_1028468 ?auto_1028467 ) ( not ( = ?auto_1028467 ?auto_1028468 ) ) ( not ( = ?auto_1028467 ?auto_1028469 ) ) ( not ( = ?auto_1028475 ?auto_1028472 ) ) ( HOIST-AT ?auto_1028471 ?auto_1028475 ) ( not ( = ?auto_1028474 ?auto_1028471 ) ) ( AVAILABLE ?auto_1028471 ) ( SURFACE-AT ?auto_1028469 ?auto_1028475 ) ( ON ?auto_1028469 ?auto_1028470 ) ( CLEAR ?auto_1028469 ) ( not ( = ?auto_1028468 ?auto_1028470 ) ) ( not ( = ?auto_1028469 ?auto_1028470 ) ) ( not ( = ?auto_1028467 ?auto_1028470 ) ) ( TRUCK-AT ?auto_1028473 ?auto_1028472 ) ( ON ?auto_1028457 ?auto_1028456 ) ( ON ?auto_1028458 ?auto_1028457 ) ( ON ?auto_1028459 ?auto_1028458 ) ( ON ?auto_1028460 ?auto_1028459 ) ( ON ?auto_1028461 ?auto_1028460 ) ( ON ?auto_1028462 ?auto_1028461 ) ( ON ?auto_1028463 ?auto_1028462 ) ( ON ?auto_1028464 ?auto_1028463 ) ( ON ?auto_1028465 ?auto_1028464 ) ( ON ?auto_1028466 ?auto_1028465 ) ( ON ?auto_1028467 ?auto_1028466 ) ( not ( = ?auto_1028456 ?auto_1028457 ) ) ( not ( = ?auto_1028456 ?auto_1028458 ) ) ( not ( = ?auto_1028456 ?auto_1028459 ) ) ( not ( = ?auto_1028456 ?auto_1028460 ) ) ( not ( = ?auto_1028456 ?auto_1028461 ) ) ( not ( = ?auto_1028456 ?auto_1028462 ) ) ( not ( = ?auto_1028456 ?auto_1028463 ) ) ( not ( = ?auto_1028456 ?auto_1028464 ) ) ( not ( = ?auto_1028456 ?auto_1028465 ) ) ( not ( = ?auto_1028456 ?auto_1028466 ) ) ( not ( = ?auto_1028456 ?auto_1028467 ) ) ( not ( = ?auto_1028456 ?auto_1028468 ) ) ( not ( = ?auto_1028456 ?auto_1028469 ) ) ( not ( = ?auto_1028456 ?auto_1028470 ) ) ( not ( = ?auto_1028457 ?auto_1028458 ) ) ( not ( = ?auto_1028457 ?auto_1028459 ) ) ( not ( = ?auto_1028457 ?auto_1028460 ) ) ( not ( = ?auto_1028457 ?auto_1028461 ) ) ( not ( = ?auto_1028457 ?auto_1028462 ) ) ( not ( = ?auto_1028457 ?auto_1028463 ) ) ( not ( = ?auto_1028457 ?auto_1028464 ) ) ( not ( = ?auto_1028457 ?auto_1028465 ) ) ( not ( = ?auto_1028457 ?auto_1028466 ) ) ( not ( = ?auto_1028457 ?auto_1028467 ) ) ( not ( = ?auto_1028457 ?auto_1028468 ) ) ( not ( = ?auto_1028457 ?auto_1028469 ) ) ( not ( = ?auto_1028457 ?auto_1028470 ) ) ( not ( = ?auto_1028458 ?auto_1028459 ) ) ( not ( = ?auto_1028458 ?auto_1028460 ) ) ( not ( = ?auto_1028458 ?auto_1028461 ) ) ( not ( = ?auto_1028458 ?auto_1028462 ) ) ( not ( = ?auto_1028458 ?auto_1028463 ) ) ( not ( = ?auto_1028458 ?auto_1028464 ) ) ( not ( = ?auto_1028458 ?auto_1028465 ) ) ( not ( = ?auto_1028458 ?auto_1028466 ) ) ( not ( = ?auto_1028458 ?auto_1028467 ) ) ( not ( = ?auto_1028458 ?auto_1028468 ) ) ( not ( = ?auto_1028458 ?auto_1028469 ) ) ( not ( = ?auto_1028458 ?auto_1028470 ) ) ( not ( = ?auto_1028459 ?auto_1028460 ) ) ( not ( = ?auto_1028459 ?auto_1028461 ) ) ( not ( = ?auto_1028459 ?auto_1028462 ) ) ( not ( = ?auto_1028459 ?auto_1028463 ) ) ( not ( = ?auto_1028459 ?auto_1028464 ) ) ( not ( = ?auto_1028459 ?auto_1028465 ) ) ( not ( = ?auto_1028459 ?auto_1028466 ) ) ( not ( = ?auto_1028459 ?auto_1028467 ) ) ( not ( = ?auto_1028459 ?auto_1028468 ) ) ( not ( = ?auto_1028459 ?auto_1028469 ) ) ( not ( = ?auto_1028459 ?auto_1028470 ) ) ( not ( = ?auto_1028460 ?auto_1028461 ) ) ( not ( = ?auto_1028460 ?auto_1028462 ) ) ( not ( = ?auto_1028460 ?auto_1028463 ) ) ( not ( = ?auto_1028460 ?auto_1028464 ) ) ( not ( = ?auto_1028460 ?auto_1028465 ) ) ( not ( = ?auto_1028460 ?auto_1028466 ) ) ( not ( = ?auto_1028460 ?auto_1028467 ) ) ( not ( = ?auto_1028460 ?auto_1028468 ) ) ( not ( = ?auto_1028460 ?auto_1028469 ) ) ( not ( = ?auto_1028460 ?auto_1028470 ) ) ( not ( = ?auto_1028461 ?auto_1028462 ) ) ( not ( = ?auto_1028461 ?auto_1028463 ) ) ( not ( = ?auto_1028461 ?auto_1028464 ) ) ( not ( = ?auto_1028461 ?auto_1028465 ) ) ( not ( = ?auto_1028461 ?auto_1028466 ) ) ( not ( = ?auto_1028461 ?auto_1028467 ) ) ( not ( = ?auto_1028461 ?auto_1028468 ) ) ( not ( = ?auto_1028461 ?auto_1028469 ) ) ( not ( = ?auto_1028461 ?auto_1028470 ) ) ( not ( = ?auto_1028462 ?auto_1028463 ) ) ( not ( = ?auto_1028462 ?auto_1028464 ) ) ( not ( = ?auto_1028462 ?auto_1028465 ) ) ( not ( = ?auto_1028462 ?auto_1028466 ) ) ( not ( = ?auto_1028462 ?auto_1028467 ) ) ( not ( = ?auto_1028462 ?auto_1028468 ) ) ( not ( = ?auto_1028462 ?auto_1028469 ) ) ( not ( = ?auto_1028462 ?auto_1028470 ) ) ( not ( = ?auto_1028463 ?auto_1028464 ) ) ( not ( = ?auto_1028463 ?auto_1028465 ) ) ( not ( = ?auto_1028463 ?auto_1028466 ) ) ( not ( = ?auto_1028463 ?auto_1028467 ) ) ( not ( = ?auto_1028463 ?auto_1028468 ) ) ( not ( = ?auto_1028463 ?auto_1028469 ) ) ( not ( = ?auto_1028463 ?auto_1028470 ) ) ( not ( = ?auto_1028464 ?auto_1028465 ) ) ( not ( = ?auto_1028464 ?auto_1028466 ) ) ( not ( = ?auto_1028464 ?auto_1028467 ) ) ( not ( = ?auto_1028464 ?auto_1028468 ) ) ( not ( = ?auto_1028464 ?auto_1028469 ) ) ( not ( = ?auto_1028464 ?auto_1028470 ) ) ( not ( = ?auto_1028465 ?auto_1028466 ) ) ( not ( = ?auto_1028465 ?auto_1028467 ) ) ( not ( = ?auto_1028465 ?auto_1028468 ) ) ( not ( = ?auto_1028465 ?auto_1028469 ) ) ( not ( = ?auto_1028465 ?auto_1028470 ) ) ( not ( = ?auto_1028466 ?auto_1028467 ) ) ( not ( = ?auto_1028466 ?auto_1028468 ) ) ( not ( = ?auto_1028466 ?auto_1028469 ) ) ( not ( = ?auto_1028466 ?auto_1028470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028467 ?auto_1028468 ?auto_1028469 )
      ( MAKE-13CRATE-VERIFY ?auto_1028456 ?auto_1028457 ?auto_1028458 ?auto_1028459 ?auto_1028460 ?auto_1028461 ?auto_1028462 ?auto_1028463 ?auto_1028464 ?auto_1028465 ?auto_1028466 ?auto_1028467 ?auto_1028468 ?auto_1028469 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028639 - SURFACE
      ?auto_1028640 - SURFACE
      ?auto_1028641 - SURFACE
      ?auto_1028642 - SURFACE
      ?auto_1028643 - SURFACE
      ?auto_1028644 - SURFACE
      ?auto_1028645 - SURFACE
      ?auto_1028646 - SURFACE
      ?auto_1028647 - SURFACE
      ?auto_1028648 - SURFACE
      ?auto_1028649 - SURFACE
      ?auto_1028650 - SURFACE
      ?auto_1028651 - SURFACE
      ?auto_1028652 - SURFACE
    )
    :vars
    (
      ?auto_1028653 - HOIST
      ?auto_1028658 - PLACE
      ?auto_1028655 - PLACE
      ?auto_1028656 - HOIST
      ?auto_1028657 - SURFACE
      ?auto_1028654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028653 ?auto_1028658 ) ( IS-CRATE ?auto_1028652 ) ( not ( = ?auto_1028651 ?auto_1028652 ) ) ( not ( = ?auto_1028650 ?auto_1028651 ) ) ( not ( = ?auto_1028650 ?auto_1028652 ) ) ( not ( = ?auto_1028655 ?auto_1028658 ) ) ( HOIST-AT ?auto_1028656 ?auto_1028655 ) ( not ( = ?auto_1028653 ?auto_1028656 ) ) ( AVAILABLE ?auto_1028656 ) ( SURFACE-AT ?auto_1028652 ?auto_1028655 ) ( ON ?auto_1028652 ?auto_1028657 ) ( CLEAR ?auto_1028652 ) ( not ( = ?auto_1028651 ?auto_1028657 ) ) ( not ( = ?auto_1028652 ?auto_1028657 ) ) ( not ( = ?auto_1028650 ?auto_1028657 ) ) ( TRUCK-AT ?auto_1028654 ?auto_1028658 ) ( SURFACE-AT ?auto_1028650 ?auto_1028658 ) ( CLEAR ?auto_1028650 ) ( LIFTING ?auto_1028653 ?auto_1028651 ) ( IS-CRATE ?auto_1028651 ) ( ON ?auto_1028640 ?auto_1028639 ) ( ON ?auto_1028641 ?auto_1028640 ) ( ON ?auto_1028642 ?auto_1028641 ) ( ON ?auto_1028643 ?auto_1028642 ) ( ON ?auto_1028644 ?auto_1028643 ) ( ON ?auto_1028645 ?auto_1028644 ) ( ON ?auto_1028646 ?auto_1028645 ) ( ON ?auto_1028647 ?auto_1028646 ) ( ON ?auto_1028648 ?auto_1028647 ) ( ON ?auto_1028649 ?auto_1028648 ) ( ON ?auto_1028650 ?auto_1028649 ) ( not ( = ?auto_1028639 ?auto_1028640 ) ) ( not ( = ?auto_1028639 ?auto_1028641 ) ) ( not ( = ?auto_1028639 ?auto_1028642 ) ) ( not ( = ?auto_1028639 ?auto_1028643 ) ) ( not ( = ?auto_1028639 ?auto_1028644 ) ) ( not ( = ?auto_1028639 ?auto_1028645 ) ) ( not ( = ?auto_1028639 ?auto_1028646 ) ) ( not ( = ?auto_1028639 ?auto_1028647 ) ) ( not ( = ?auto_1028639 ?auto_1028648 ) ) ( not ( = ?auto_1028639 ?auto_1028649 ) ) ( not ( = ?auto_1028639 ?auto_1028650 ) ) ( not ( = ?auto_1028639 ?auto_1028651 ) ) ( not ( = ?auto_1028639 ?auto_1028652 ) ) ( not ( = ?auto_1028639 ?auto_1028657 ) ) ( not ( = ?auto_1028640 ?auto_1028641 ) ) ( not ( = ?auto_1028640 ?auto_1028642 ) ) ( not ( = ?auto_1028640 ?auto_1028643 ) ) ( not ( = ?auto_1028640 ?auto_1028644 ) ) ( not ( = ?auto_1028640 ?auto_1028645 ) ) ( not ( = ?auto_1028640 ?auto_1028646 ) ) ( not ( = ?auto_1028640 ?auto_1028647 ) ) ( not ( = ?auto_1028640 ?auto_1028648 ) ) ( not ( = ?auto_1028640 ?auto_1028649 ) ) ( not ( = ?auto_1028640 ?auto_1028650 ) ) ( not ( = ?auto_1028640 ?auto_1028651 ) ) ( not ( = ?auto_1028640 ?auto_1028652 ) ) ( not ( = ?auto_1028640 ?auto_1028657 ) ) ( not ( = ?auto_1028641 ?auto_1028642 ) ) ( not ( = ?auto_1028641 ?auto_1028643 ) ) ( not ( = ?auto_1028641 ?auto_1028644 ) ) ( not ( = ?auto_1028641 ?auto_1028645 ) ) ( not ( = ?auto_1028641 ?auto_1028646 ) ) ( not ( = ?auto_1028641 ?auto_1028647 ) ) ( not ( = ?auto_1028641 ?auto_1028648 ) ) ( not ( = ?auto_1028641 ?auto_1028649 ) ) ( not ( = ?auto_1028641 ?auto_1028650 ) ) ( not ( = ?auto_1028641 ?auto_1028651 ) ) ( not ( = ?auto_1028641 ?auto_1028652 ) ) ( not ( = ?auto_1028641 ?auto_1028657 ) ) ( not ( = ?auto_1028642 ?auto_1028643 ) ) ( not ( = ?auto_1028642 ?auto_1028644 ) ) ( not ( = ?auto_1028642 ?auto_1028645 ) ) ( not ( = ?auto_1028642 ?auto_1028646 ) ) ( not ( = ?auto_1028642 ?auto_1028647 ) ) ( not ( = ?auto_1028642 ?auto_1028648 ) ) ( not ( = ?auto_1028642 ?auto_1028649 ) ) ( not ( = ?auto_1028642 ?auto_1028650 ) ) ( not ( = ?auto_1028642 ?auto_1028651 ) ) ( not ( = ?auto_1028642 ?auto_1028652 ) ) ( not ( = ?auto_1028642 ?auto_1028657 ) ) ( not ( = ?auto_1028643 ?auto_1028644 ) ) ( not ( = ?auto_1028643 ?auto_1028645 ) ) ( not ( = ?auto_1028643 ?auto_1028646 ) ) ( not ( = ?auto_1028643 ?auto_1028647 ) ) ( not ( = ?auto_1028643 ?auto_1028648 ) ) ( not ( = ?auto_1028643 ?auto_1028649 ) ) ( not ( = ?auto_1028643 ?auto_1028650 ) ) ( not ( = ?auto_1028643 ?auto_1028651 ) ) ( not ( = ?auto_1028643 ?auto_1028652 ) ) ( not ( = ?auto_1028643 ?auto_1028657 ) ) ( not ( = ?auto_1028644 ?auto_1028645 ) ) ( not ( = ?auto_1028644 ?auto_1028646 ) ) ( not ( = ?auto_1028644 ?auto_1028647 ) ) ( not ( = ?auto_1028644 ?auto_1028648 ) ) ( not ( = ?auto_1028644 ?auto_1028649 ) ) ( not ( = ?auto_1028644 ?auto_1028650 ) ) ( not ( = ?auto_1028644 ?auto_1028651 ) ) ( not ( = ?auto_1028644 ?auto_1028652 ) ) ( not ( = ?auto_1028644 ?auto_1028657 ) ) ( not ( = ?auto_1028645 ?auto_1028646 ) ) ( not ( = ?auto_1028645 ?auto_1028647 ) ) ( not ( = ?auto_1028645 ?auto_1028648 ) ) ( not ( = ?auto_1028645 ?auto_1028649 ) ) ( not ( = ?auto_1028645 ?auto_1028650 ) ) ( not ( = ?auto_1028645 ?auto_1028651 ) ) ( not ( = ?auto_1028645 ?auto_1028652 ) ) ( not ( = ?auto_1028645 ?auto_1028657 ) ) ( not ( = ?auto_1028646 ?auto_1028647 ) ) ( not ( = ?auto_1028646 ?auto_1028648 ) ) ( not ( = ?auto_1028646 ?auto_1028649 ) ) ( not ( = ?auto_1028646 ?auto_1028650 ) ) ( not ( = ?auto_1028646 ?auto_1028651 ) ) ( not ( = ?auto_1028646 ?auto_1028652 ) ) ( not ( = ?auto_1028646 ?auto_1028657 ) ) ( not ( = ?auto_1028647 ?auto_1028648 ) ) ( not ( = ?auto_1028647 ?auto_1028649 ) ) ( not ( = ?auto_1028647 ?auto_1028650 ) ) ( not ( = ?auto_1028647 ?auto_1028651 ) ) ( not ( = ?auto_1028647 ?auto_1028652 ) ) ( not ( = ?auto_1028647 ?auto_1028657 ) ) ( not ( = ?auto_1028648 ?auto_1028649 ) ) ( not ( = ?auto_1028648 ?auto_1028650 ) ) ( not ( = ?auto_1028648 ?auto_1028651 ) ) ( not ( = ?auto_1028648 ?auto_1028652 ) ) ( not ( = ?auto_1028648 ?auto_1028657 ) ) ( not ( = ?auto_1028649 ?auto_1028650 ) ) ( not ( = ?auto_1028649 ?auto_1028651 ) ) ( not ( = ?auto_1028649 ?auto_1028652 ) ) ( not ( = ?auto_1028649 ?auto_1028657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028650 ?auto_1028651 ?auto_1028652 )
      ( MAKE-13CRATE-VERIFY ?auto_1028639 ?auto_1028640 ?auto_1028641 ?auto_1028642 ?auto_1028643 ?auto_1028644 ?auto_1028645 ?auto_1028646 ?auto_1028647 ?auto_1028648 ?auto_1028649 ?auto_1028650 ?auto_1028651 ?auto_1028652 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028822 - SURFACE
      ?auto_1028823 - SURFACE
      ?auto_1028824 - SURFACE
      ?auto_1028825 - SURFACE
      ?auto_1028826 - SURFACE
      ?auto_1028827 - SURFACE
      ?auto_1028828 - SURFACE
      ?auto_1028829 - SURFACE
      ?auto_1028830 - SURFACE
      ?auto_1028831 - SURFACE
      ?auto_1028832 - SURFACE
      ?auto_1028833 - SURFACE
      ?auto_1028834 - SURFACE
      ?auto_1028835 - SURFACE
    )
    :vars
    (
      ?auto_1028840 - HOIST
      ?auto_1028839 - PLACE
      ?auto_1028838 - PLACE
      ?auto_1028836 - HOIST
      ?auto_1028841 - SURFACE
      ?auto_1028837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028840 ?auto_1028839 ) ( IS-CRATE ?auto_1028835 ) ( not ( = ?auto_1028834 ?auto_1028835 ) ) ( not ( = ?auto_1028833 ?auto_1028834 ) ) ( not ( = ?auto_1028833 ?auto_1028835 ) ) ( not ( = ?auto_1028838 ?auto_1028839 ) ) ( HOIST-AT ?auto_1028836 ?auto_1028838 ) ( not ( = ?auto_1028840 ?auto_1028836 ) ) ( AVAILABLE ?auto_1028836 ) ( SURFACE-AT ?auto_1028835 ?auto_1028838 ) ( ON ?auto_1028835 ?auto_1028841 ) ( CLEAR ?auto_1028835 ) ( not ( = ?auto_1028834 ?auto_1028841 ) ) ( not ( = ?auto_1028835 ?auto_1028841 ) ) ( not ( = ?auto_1028833 ?auto_1028841 ) ) ( TRUCK-AT ?auto_1028837 ?auto_1028839 ) ( SURFACE-AT ?auto_1028833 ?auto_1028839 ) ( CLEAR ?auto_1028833 ) ( IS-CRATE ?auto_1028834 ) ( AVAILABLE ?auto_1028840 ) ( IN ?auto_1028834 ?auto_1028837 ) ( ON ?auto_1028823 ?auto_1028822 ) ( ON ?auto_1028824 ?auto_1028823 ) ( ON ?auto_1028825 ?auto_1028824 ) ( ON ?auto_1028826 ?auto_1028825 ) ( ON ?auto_1028827 ?auto_1028826 ) ( ON ?auto_1028828 ?auto_1028827 ) ( ON ?auto_1028829 ?auto_1028828 ) ( ON ?auto_1028830 ?auto_1028829 ) ( ON ?auto_1028831 ?auto_1028830 ) ( ON ?auto_1028832 ?auto_1028831 ) ( ON ?auto_1028833 ?auto_1028832 ) ( not ( = ?auto_1028822 ?auto_1028823 ) ) ( not ( = ?auto_1028822 ?auto_1028824 ) ) ( not ( = ?auto_1028822 ?auto_1028825 ) ) ( not ( = ?auto_1028822 ?auto_1028826 ) ) ( not ( = ?auto_1028822 ?auto_1028827 ) ) ( not ( = ?auto_1028822 ?auto_1028828 ) ) ( not ( = ?auto_1028822 ?auto_1028829 ) ) ( not ( = ?auto_1028822 ?auto_1028830 ) ) ( not ( = ?auto_1028822 ?auto_1028831 ) ) ( not ( = ?auto_1028822 ?auto_1028832 ) ) ( not ( = ?auto_1028822 ?auto_1028833 ) ) ( not ( = ?auto_1028822 ?auto_1028834 ) ) ( not ( = ?auto_1028822 ?auto_1028835 ) ) ( not ( = ?auto_1028822 ?auto_1028841 ) ) ( not ( = ?auto_1028823 ?auto_1028824 ) ) ( not ( = ?auto_1028823 ?auto_1028825 ) ) ( not ( = ?auto_1028823 ?auto_1028826 ) ) ( not ( = ?auto_1028823 ?auto_1028827 ) ) ( not ( = ?auto_1028823 ?auto_1028828 ) ) ( not ( = ?auto_1028823 ?auto_1028829 ) ) ( not ( = ?auto_1028823 ?auto_1028830 ) ) ( not ( = ?auto_1028823 ?auto_1028831 ) ) ( not ( = ?auto_1028823 ?auto_1028832 ) ) ( not ( = ?auto_1028823 ?auto_1028833 ) ) ( not ( = ?auto_1028823 ?auto_1028834 ) ) ( not ( = ?auto_1028823 ?auto_1028835 ) ) ( not ( = ?auto_1028823 ?auto_1028841 ) ) ( not ( = ?auto_1028824 ?auto_1028825 ) ) ( not ( = ?auto_1028824 ?auto_1028826 ) ) ( not ( = ?auto_1028824 ?auto_1028827 ) ) ( not ( = ?auto_1028824 ?auto_1028828 ) ) ( not ( = ?auto_1028824 ?auto_1028829 ) ) ( not ( = ?auto_1028824 ?auto_1028830 ) ) ( not ( = ?auto_1028824 ?auto_1028831 ) ) ( not ( = ?auto_1028824 ?auto_1028832 ) ) ( not ( = ?auto_1028824 ?auto_1028833 ) ) ( not ( = ?auto_1028824 ?auto_1028834 ) ) ( not ( = ?auto_1028824 ?auto_1028835 ) ) ( not ( = ?auto_1028824 ?auto_1028841 ) ) ( not ( = ?auto_1028825 ?auto_1028826 ) ) ( not ( = ?auto_1028825 ?auto_1028827 ) ) ( not ( = ?auto_1028825 ?auto_1028828 ) ) ( not ( = ?auto_1028825 ?auto_1028829 ) ) ( not ( = ?auto_1028825 ?auto_1028830 ) ) ( not ( = ?auto_1028825 ?auto_1028831 ) ) ( not ( = ?auto_1028825 ?auto_1028832 ) ) ( not ( = ?auto_1028825 ?auto_1028833 ) ) ( not ( = ?auto_1028825 ?auto_1028834 ) ) ( not ( = ?auto_1028825 ?auto_1028835 ) ) ( not ( = ?auto_1028825 ?auto_1028841 ) ) ( not ( = ?auto_1028826 ?auto_1028827 ) ) ( not ( = ?auto_1028826 ?auto_1028828 ) ) ( not ( = ?auto_1028826 ?auto_1028829 ) ) ( not ( = ?auto_1028826 ?auto_1028830 ) ) ( not ( = ?auto_1028826 ?auto_1028831 ) ) ( not ( = ?auto_1028826 ?auto_1028832 ) ) ( not ( = ?auto_1028826 ?auto_1028833 ) ) ( not ( = ?auto_1028826 ?auto_1028834 ) ) ( not ( = ?auto_1028826 ?auto_1028835 ) ) ( not ( = ?auto_1028826 ?auto_1028841 ) ) ( not ( = ?auto_1028827 ?auto_1028828 ) ) ( not ( = ?auto_1028827 ?auto_1028829 ) ) ( not ( = ?auto_1028827 ?auto_1028830 ) ) ( not ( = ?auto_1028827 ?auto_1028831 ) ) ( not ( = ?auto_1028827 ?auto_1028832 ) ) ( not ( = ?auto_1028827 ?auto_1028833 ) ) ( not ( = ?auto_1028827 ?auto_1028834 ) ) ( not ( = ?auto_1028827 ?auto_1028835 ) ) ( not ( = ?auto_1028827 ?auto_1028841 ) ) ( not ( = ?auto_1028828 ?auto_1028829 ) ) ( not ( = ?auto_1028828 ?auto_1028830 ) ) ( not ( = ?auto_1028828 ?auto_1028831 ) ) ( not ( = ?auto_1028828 ?auto_1028832 ) ) ( not ( = ?auto_1028828 ?auto_1028833 ) ) ( not ( = ?auto_1028828 ?auto_1028834 ) ) ( not ( = ?auto_1028828 ?auto_1028835 ) ) ( not ( = ?auto_1028828 ?auto_1028841 ) ) ( not ( = ?auto_1028829 ?auto_1028830 ) ) ( not ( = ?auto_1028829 ?auto_1028831 ) ) ( not ( = ?auto_1028829 ?auto_1028832 ) ) ( not ( = ?auto_1028829 ?auto_1028833 ) ) ( not ( = ?auto_1028829 ?auto_1028834 ) ) ( not ( = ?auto_1028829 ?auto_1028835 ) ) ( not ( = ?auto_1028829 ?auto_1028841 ) ) ( not ( = ?auto_1028830 ?auto_1028831 ) ) ( not ( = ?auto_1028830 ?auto_1028832 ) ) ( not ( = ?auto_1028830 ?auto_1028833 ) ) ( not ( = ?auto_1028830 ?auto_1028834 ) ) ( not ( = ?auto_1028830 ?auto_1028835 ) ) ( not ( = ?auto_1028830 ?auto_1028841 ) ) ( not ( = ?auto_1028831 ?auto_1028832 ) ) ( not ( = ?auto_1028831 ?auto_1028833 ) ) ( not ( = ?auto_1028831 ?auto_1028834 ) ) ( not ( = ?auto_1028831 ?auto_1028835 ) ) ( not ( = ?auto_1028831 ?auto_1028841 ) ) ( not ( = ?auto_1028832 ?auto_1028833 ) ) ( not ( = ?auto_1028832 ?auto_1028834 ) ) ( not ( = ?auto_1028832 ?auto_1028835 ) ) ( not ( = ?auto_1028832 ?auto_1028841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028833 ?auto_1028834 ?auto_1028835 )
      ( MAKE-13CRATE-VERIFY ?auto_1028822 ?auto_1028823 ?auto_1028824 ?auto_1028825 ?auto_1028826 ?auto_1028827 ?auto_1028828 ?auto_1028829 ?auto_1028830 ?auto_1028831 ?auto_1028832 ?auto_1028833 ?auto_1028834 ?auto_1028835 ) )
  )

)

