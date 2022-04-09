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
      ?auto_911302 - SURFACE
      ?auto_911303 - SURFACE
    )
    :vars
    (
      ?auto_911304 - HOIST
      ?auto_911305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911304 ?auto_911305 ) ( SURFACE-AT ?auto_911302 ?auto_911305 ) ( CLEAR ?auto_911302 ) ( LIFTING ?auto_911304 ?auto_911303 ) ( IS-CRATE ?auto_911303 ) ( not ( = ?auto_911302 ?auto_911303 ) ) )
    :subtasks
    ( ( !DROP ?auto_911304 ?auto_911303 ?auto_911302 ?auto_911305 )
      ( MAKE-1CRATE-VERIFY ?auto_911302 ?auto_911303 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911306 - SURFACE
      ?auto_911307 - SURFACE
    )
    :vars
    (
      ?auto_911308 - HOIST
      ?auto_911309 - PLACE
      ?auto_911310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911308 ?auto_911309 ) ( SURFACE-AT ?auto_911306 ?auto_911309 ) ( CLEAR ?auto_911306 ) ( IS-CRATE ?auto_911307 ) ( not ( = ?auto_911306 ?auto_911307 ) ) ( TRUCK-AT ?auto_911310 ?auto_911309 ) ( AVAILABLE ?auto_911308 ) ( IN ?auto_911307 ?auto_911310 ) )
    :subtasks
    ( ( !UNLOAD ?auto_911308 ?auto_911307 ?auto_911310 ?auto_911309 )
      ( MAKE-1CRATE ?auto_911306 ?auto_911307 )
      ( MAKE-1CRATE-VERIFY ?auto_911306 ?auto_911307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911311 - SURFACE
      ?auto_911312 - SURFACE
    )
    :vars
    (
      ?auto_911313 - HOIST
      ?auto_911314 - PLACE
      ?auto_911315 - TRUCK
      ?auto_911316 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911313 ?auto_911314 ) ( SURFACE-AT ?auto_911311 ?auto_911314 ) ( CLEAR ?auto_911311 ) ( IS-CRATE ?auto_911312 ) ( not ( = ?auto_911311 ?auto_911312 ) ) ( AVAILABLE ?auto_911313 ) ( IN ?auto_911312 ?auto_911315 ) ( TRUCK-AT ?auto_911315 ?auto_911316 ) ( not ( = ?auto_911316 ?auto_911314 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911315 ?auto_911316 ?auto_911314 )
      ( MAKE-1CRATE ?auto_911311 ?auto_911312 )
      ( MAKE-1CRATE-VERIFY ?auto_911311 ?auto_911312 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911317 - SURFACE
      ?auto_911318 - SURFACE
    )
    :vars
    (
      ?auto_911321 - HOIST
      ?auto_911322 - PLACE
      ?auto_911320 - TRUCK
      ?auto_911319 - PLACE
      ?auto_911323 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911321 ?auto_911322 ) ( SURFACE-AT ?auto_911317 ?auto_911322 ) ( CLEAR ?auto_911317 ) ( IS-CRATE ?auto_911318 ) ( not ( = ?auto_911317 ?auto_911318 ) ) ( AVAILABLE ?auto_911321 ) ( TRUCK-AT ?auto_911320 ?auto_911319 ) ( not ( = ?auto_911319 ?auto_911322 ) ) ( HOIST-AT ?auto_911323 ?auto_911319 ) ( LIFTING ?auto_911323 ?auto_911318 ) ( not ( = ?auto_911321 ?auto_911323 ) ) )
    :subtasks
    ( ( !LOAD ?auto_911323 ?auto_911318 ?auto_911320 ?auto_911319 )
      ( MAKE-1CRATE ?auto_911317 ?auto_911318 )
      ( MAKE-1CRATE-VERIFY ?auto_911317 ?auto_911318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911324 - SURFACE
      ?auto_911325 - SURFACE
    )
    :vars
    (
      ?auto_911326 - HOIST
      ?auto_911328 - PLACE
      ?auto_911329 - TRUCK
      ?auto_911330 - PLACE
      ?auto_911327 - HOIST
      ?auto_911331 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911326 ?auto_911328 ) ( SURFACE-AT ?auto_911324 ?auto_911328 ) ( CLEAR ?auto_911324 ) ( IS-CRATE ?auto_911325 ) ( not ( = ?auto_911324 ?auto_911325 ) ) ( AVAILABLE ?auto_911326 ) ( TRUCK-AT ?auto_911329 ?auto_911330 ) ( not ( = ?auto_911330 ?auto_911328 ) ) ( HOIST-AT ?auto_911327 ?auto_911330 ) ( not ( = ?auto_911326 ?auto_911327 ) ) ( AVAILABLE ?auto_911327 ) ( SURFACE-AT ?auto_911325 ?auto_911330 ) ( ON ?auto_911325 ?auto_911331 ) ( CLEAR ?auto_911325 ) ( not ( = ?auto_911324 ?auto_911331 ) ) ( not ( = ?auto_911325 ?auto_911331 ) ) )
    :subtasks
    ( ( !LIFT ?auto_911327 ?auto_911325 ?auto_911331 ?auto_911330 )
      ( MAKE-1CRATE ?auto_911324 ?auto_911325 )
      ( MAKE-1CRATE-VERIFY ?auto_911324 ?auto_911325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911332 - SURFACE
      ?auto_911333 - SURFACE
    )
    :vars
    (
      ?auto_911339 - HOIST
      ?auto_911334 - PLACE
      ?auto_911338 - PLACE
      ?auto_911336 - HOIST
      ?auto_911337 - SURFACE
      ?auto_911335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911339 ?auto_911334 ) ( SURFACE-AT ?auto_911332 ?auto_911334 ) ( CLEAR ?auto_911332 ) ( IS-CRATE ?auto_911333 ) ( not ( = ?auto_911332 ?auto_911333 ) ) ( AVAILABLE ?auto_911339 ) ( not ( = ?auto_911338 ?auto_911334 ) ) ( HOIST-AT ?auto_911336 ?auto_911338 ) ( not ( = ?auto_911339 ?auto_911336 ) ) ( AVAILABLE ?auto_911336 ) ( SURFACE-AT ?auto_911333 ?auto_911338 ) ( ON ?auto_911333 ?auto_911337 ) ( CLEAR ?auto_911333 ) ( not ( = ?auto_911332 ?auto_911337 ) ) ( not ( = ?auto_911333 ?auto_911337 ) ) ( TRUCK-AT ?auto_911335 ?auto_911334 ) )
    :subtasks
    ( ( !DRIVE ?auto_911335 ?auto_911334 ?auto_911338 )
      ( MAKE-1CRATE ?auto_911332 ?auto_911333 )
      ( MAKE-1CRATE-VERIFY ?auto_911332 ?auto_911333 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911349 - SURFACE
      ?auto_911350 - SURFACE
      ?auto_911351 - SURFACE
    )
    :vars
    (
      ?auto_911353 - HOIST
      ?auto_911352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911353 ?auto_911352 ) ( SURFACE-AT ?auto_911350 ?auto_911352 ) ( CLEAR ?auto_911350 ) ( LIFTING ?auto_911353 ?auto_911351 ) ( IS-CRATE ?auto_911351 ) ( not ( = ?auto_911350 ?auto_911351 ) ) ( ON ?auto_911350 ?auto_911349 ) ( not ( = ?auto_911349 ?auto_911350 ) ) ( not ( = ?auto_911349 ?auto_911351 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911350 ?auto_911351 )
      ( MAKE-2CRATE-VERIFY ?auto_911349 ?auto_911350 ?auto_911351 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911359 - SURFACE
      ?auto_911360 - SURFACE
      ?auto_911361 - SURFACE
    )
    :vars
    (
      ?auto_911363 - HOIST
      ?auto_911364 - PLACE
      ?auto_911362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911363 ?auto_911364 ) ( SURFACE-AT ?auto_911360 ?auto_911364 ) ( CLEAR ?auto_911360 ) ( IS-CRATE ?auto_911361 ) ( not ( = ?auto_911360 ?auto_911361 ) ) ( TRUCK-AT ?auto_911362 ?auto_911364 ) ( AVAILABLE ?auto_911363 ) ( IN ?auto_911361 ?auto_911362 ) ( ON ?auto_911360 ?auto_911359 ) ( not ( = ?auto_911359 ?auto_911360 ) ) ( not ( = ?auto_911359 ?auto_911361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911360 ?auto_911361 )
      ( MAKE-2CRATE-VERIFY ?auto_911359 ?auto_911360 ?auto_911361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911365 - SURFACE
      ?auto_911366 - SURFACE
    )
    :vars
    (
      ?auto_911370 - HOIST
      ?auto_911368 - PLACE
      ?auto_911367 - TRUCK
      ?auto_911369 - SURFACE
      ?auto_911371 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911370 ?auto_911368 ) ( SURFACE-AT ?auto_911365 ?auto_911368 ) ( CLEAR ?auto_911365 ) ( IS-CRATE ?auto_911366 ) ( not ( = ?auto_911365 ?auto_911366 ) ) ( AVAILABLE ?auto_911370 ) ( IN ?auto_911366 ?auto_911367 ) ( ON ?auto_911365 ?auto_911369 ) ( not ( = ?auto_911369 ?auto_911365 ) ) ( not ( = ?auto_911369 ?auto_911366 ) ) ( TRUCK-AT ?auto_911367 ?auto_911371 ) ( not ( = ?auto_911371 ?auto_911368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911367 ?auto_911371 ?auto_911368 )
      ( MAKE-2CRATE ?auto_911369 ?auto_911365 ?auto_911366 )
      ( MAKE-1CRATE-VERIFY ?auto_911365 ?auto_911366 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911372 - SURFACE
      ?auto_911373 - SURFACE
      ?auto_911374 - SURFACE
    )
    :vars
    (
      ?auto_911375 - HOIST
      ?auto_911377 - PLACE
      ?auto_911378 - TRUCK
      ?auto_911376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911375 ?auto_911377 ) ( SURFACE-AT ?auto_911373 ?auto_911377 ) ( CLEAR ?auto_911373 ) ( IS-CRATE ?auto_911374 ) ( not ( = ?auto_911373 ?auto_911374 ) ) ( AVAILABLE ?auto_911375 ) ( IN ?auto_911374 ?auto_911378 ) ( ON ?auto_911373 ?auto_911372 ) ( not ( = ?auto_911372 ?auto_911373 ) ) ( not ( = ?auto_911372 ?auto_911374 ) ) ( TRUCK-AT ?auto_911378 ?auto_911376 ) ( not ( = ?auto_911376 ?auto_911377 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911373 ?auto_911374 )
      ( MAKE-2CRATE-VERIFY ?auto_911372 ?auto_911373 ?auto_911374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911379 - SURFACE
      ?auto_911380 - SURFACE
    )
    :vars
    (
      ?auto_911383 - HOIST
      ?auto_911381 - PLACE
      ?auto_911384 - SURFACE
      ?auto_911382 - TRUCK
      ?auto_911385 - PLACE
      ?auto_911386 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911383 ?auto_911381 ) ( SURFACE-AT ?auto_911379 ?auto_911381 ) ( CLEAR ?auto_911379 ) ( IS-CRATE ?auto_911380 ) ( not ( = ?auto_911379 ?auto_911380 ) ) ( AVAILABLE ?auto_911383 ) ( ON ?auto_911379 ?auto_911384 ) ( not ( = ?auto_911384 ?auto_911379 ) ) ( not ( = ?auto_911384 ?auto_911380 ) ) ( TRUCK-AT ?auto_911382 ?auto_911385 ) ( not ( = ?auto_911385 ?auto_911381 ) ) ( HOIST-AT ?auto_911386 ?auto_911385 ) ( LIFTING ?auto_911386 ?auto_911380 ) ( not ( = ?auto_911383 ?auto_911386 ) ) )
    :subtasks
    ( ( !LOAD ?auto_911386 ?auto_911380 ?auto_911382 ?auto_911385 )
      ( MAKE-2CRATE ?auto_911384 ?auto_911379 ?auto_911380 )
      ( MAKE-1CRATE-VERIFY ?auto_911379 ?auto_911380 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911387 - SURFACE
      ?auto_911388 - SURFACE
      ?auto_911389 - SURFACE
    )
    :vars
    (
      ?auto_911393 - HOIST
      ?auto_911390 - PLACE
      ?auto_911392 - TRUCK
      ?auto_911391 - PLACE
      ?auto_911394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911393 ?auto_911390 ) ( SURFACE-AT ?auto_911388 ?auto_911390 ) ( CLEAR ?auto_911388 ) ( IS-CRATE ?auto_911389 ) ( not ( = ?auto_911388 ?auto_911389 ) ) ( AVAILABLE ?auto_911393 ) ( ON ?auto_911388 ?auto_911387 ) ( not ( = ?auto_911387 ?auto_911388 ) ) ( not ( = ?auto_911387 ?auto_911389 ) ) ( TRUCK-AT ?auto_911392 ?auto_911391 ) ( not ( = ?auto_911391 ?auto_911390 ) ) ( HOIST-AT ?auto_911394 ?auto_911391 ) ( LIFTING ?auto_911394 ?auto_911389 ) ( not ( = ?auto_911393 ?auto_911394 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911388 ?auto_911389 )
      ( MAKE-2CRATE-VERIFY ?auto_911387 ?auto_911388 ?auto_911389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911395 - SURFACE
      ?auto_911396 - SURFACE
    )
    :vars
    (
      ?auto_911401 - HOIST
      ?auto_911398 - PLACE
      ?auto_911397 - SURFACE
      ?auto_911399 - TRUCK
      ?auto_911400 - PLACE
      ?auto_911402 - HOIST
      ?auto_911403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911401 ?auto_911398 ) ( SURFACE-AT ?auto_911395 ?auto_911398 ) ( CLEAR ?auto_911395 ) ( IS-CRATE ?auto_911396 ) ( not ( = ?auto_911395 ?auto_911396 ) ) ( AVAILABLE ?auto_911401 ) ( ON ?auto_911395 ?auto_911397 ) ( not ( = ?auto_911397 ?auto_911395 ) ) ( not ( = ?auto_911397 ?auto_911396 ) ) ( TRUCK-AT ?auto_911399 ?auto_911400 ) ( not ( = ?auto_911400 ?auto_911398 ) ) ( HOIST-AT ?auto_911402 ?auto_911400 ) ( not ( = ?auto_911401 ?auto_911402 ) ) ( AVAILABLE ?auto_911402 ) ( SURFACE-AT ?auto_911396 ?auto_911400 ) ( ON ?auto_911396 ?auto_911403 ) ( CLEAR ?auto_911396 ) ( not ( = ?auto_911395 ?auto_911403 ) ) ( not ( = ?auto_911396 ?auto_911403 ) ) ( not ( = ?auto_911397 ?auto_911403 ) ) )
    :subtasks
    ( ( !LIFT ?auto_911402 ?auto_911396 ?auto_911403 ?auto_911400 )
      ( MAKE-2CRATE ?auto_911397 ?auto_911395 ?auto_911396 )
      ( MAKE-1CRATE-VERIFY ?auto_911395 ?auto_911396 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911404 - SURFACE
      ?auto_911405 - SURFACE
      ?auto_911406 - SURFACE
    )
    :vars
    (
      ?auto_911408 - HOIST
      ?auto_911410 - PLACE
      ?auto_911412 - TRUCK
      ?auto_911409 - PLACE
      ?auto_911411 - HOIST
      ?auto_911407 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911408 ?auto_911410 ) ( SURFACE-AT ?auto_911405 ?auto_911410 ) ( CLEAR ?auto_911405 ) ( IS-CRATE ?auto_911406 ) ( not ( = ?auto_911405 ?auto_911406 ) ) ( AVAILABLE ?auto_911408 ) ( ON ?auto_911405 ?auto_911404 ) ( not ( = ?auto_911404 ?auto_911405 ) ) ( not ( = ?auto_911404 ?auto_911406 ) ) ( TRUCK-AT ?auto_911412 ?auto_911409 ) ( not ( = ?auto_911409 ?auto_911410 ) ) ( HOIST-AT ?auto_911411 ?auto_911409 ) ( not ( = ?auto_911408 ?auto_911411 ) ) ( AVAILABLE ?auto_911411 ) ( SURFACE-AT ?auto_911406 ?auto_911409 ) ( ON ?auto_911406 ?auto_911407 ) ( CLEAR ?auto_911406 ) ( not ( = ?auto_911405 ?auto_911407 ) ) ( not ( = ?auto_911406 ?auto_911407 ) ) ( not ( = ?auto_911404 ?auto_911407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911405 ?auto_911406 )
      ( MAKE-2CRATE-VERIFY ?auto_911404 ?auto_911405 ?auto_911406 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911413 - SURFACE
      ?auto_911414 - SURFACE
    )
    :vars
    (
      ?auto_911418 - HOIST
      ?auto_911421 - PLACE
      ?auto_911420 - SURFACE
      ?auto_911415 - PLACE
      ?auto_911416 - HOIST
      ?auto_911419 - SURFACE
      ?auto_911417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911418 ?auto_911421 ) ( SURFACE-AT ?auto_911413 ?auto_911421 ) ( CLEAR ?auto_911413 ) ( IS-CRATE ?auto_911414 ) ( not ( = ?auto_911413 ?auto_911414 ) ) ( AVAILABLE ?auto_911418 ) ( ON ?auto_911413 ?auto_911420 ) ( not ( = ?auto_911420 ?auto_911413 ) ) ( not ( = ?auto_911420 ?auto_911414 ) ) ( not ( = ?auto_911415 ?auto_911421 ) ) ( HOIST-AT ?auto_911416 ?auto_911415 ) ( not ( = ?auto_911418 ?auto_911416 ) ) ( AVAILABLE ?auto_911416 ) ( SURFACE-AT ?auto_911414 ?auto_911415 ) ( ON ?auto_911414 ?auto_911419 ) ( CLEAR ?auto_911414 ) ( not ( = ?auto_911413 ?auto_911419 ) ) ( not ( = ?auto_911414 ?auto_911419 ) ) ( not ( = ?auto_911420 ?auto_911419 ) ) ( TRUCK-AT ?auto_911417 ?auto_911421 ) )
    :subtasks
    ( ( !DRIVE ?auto_911417 ?auto_911421 ?auto_911415 )
      ( MAKE-2CRATE ?auto_911420 ?auto_911413 ?auto_911414 )
      ( MAKE-1CRATE-VERIFY ?auto_911413 ?auto_911414 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911422 - SURFACE
      ?auto_911423 - SURFACE
      ?auto_911424 - SURFACE
    )
    :vars
    (
      ?auto_911429 - HOIST
      ?auto_911425 - PLACE
      ?auto_911426 - PLACE
      ?auto_911428 - HOIST
      ?auto_911430 - SURFACE
      ?auto_911427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911429 ?auto_911425 ) ( SURFACE-AT ?auto_911423 ?auto_911425 ) ( CLEAR ?auto_911423 ) ( IS-CRATE ?auto_911424 ) ( not ( = ?auto_911423 ?auto_911424 ) ) ( AVAILABLE ?auto_911429 ) ( ON ?auto_911423 ?auto_911422 ) ( not ( = ?auto_911422 ?auto_911423 ) ) ( not ( = ?auto_911422 ?auto_911424 ) ) ( not ( = ?auto_911426 ?auto_911425 ) ) ( HOIST-AT ?auto_911428 ?auto_911426 ) ( not ( = ?auto_911429 ?auto_911428 ) ) ( AVAILABLE ?auto_911428 ) ( SURFACE-AT ?auto_911424 ?auto_911426 ) ( ON ?auto_911424 ?auto_911430 ) ( CLEAR ?auto_911424 ) ( not ( = ?auto_911423 ?auto_911430 ) ) ( not ( = ?auto_911424 ?auto_911430 ) ) ( not ( = ?auto_911422 ?auto_911430 ) ) ( TRUCK-AT ?auto_911427 ?auto_911425 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911423 ?auto_911424 )
      ( MAKE-2CRATE-VERIFY ?auto_911422 ?auto_911423 ?auto_911424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911431 - SURFACE
      ?auto_911432 - SURFACE
    )
    :vars
    (
      ?auto_911433 - HOIST
      ?auto_911436 - PLACE
      ?auto_911438 - SURFACE
      ?auto_911439 - PLACE
      ?auto_911435 - HOIST
      ?auto_911434 - SURFACE
      ?auto_911437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911433 ?auto_911436 ) ( IS-CRATE ?auto_911432 ) ( not ( = ?auto_911431 ?auto_911432 ) ) ( not ( = ?auto_911438 ?auto_911431 ) ) ( not ( = ?auto_911438 ?auto_911432 ) ) ( not ( = ?auto_911439 ?auto_911436 ) ) ( HOIST-AT ?auto_911435 ?auto_911439 ) ( not ( = ?auto_911433 ?auto_911435 ) ) ( AVAILABLE ?auto_911435 ) ( SURFACE-AT ?auto_911432 ?auto_911439 ) ( ON ?auto_911432 ?auto_911434 ) ( CLEAR ?auto_911432 ) ( not ( = ?auto_911431 ?auto_911434 ) ) ( not ( = ?auto_911432 ?auto_911434 ) ) ( not ( = ?auto_911438 ?auto_911434 ) ) ( TRUCK-AT ?auto_911437 ?auto_911436 ) ( SURFACE-AT ?auto_911438 ?auto_911436 ) ( CLEAR ?auto_911438 ) ( LIFTING ?auto_911433 ?auto_911431 ) ( IS-CRATE ?auto_911431 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911438 ?auto_911431 )
      ( MAKE-2CRATE ?auto_911438 ?auto_911431 ?auto_911432 )
      ( MAKE-1CRATE-VERIFY ?auto_911431 ?auto_911432 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911440 - SURFACE
      ?auto_911441 - SURFACE
      ?auto_911442 - SURFACE
    )
    :vars
    (
      ?auto_911444 - HOIST
      ?auto_911445 - PLACE
      ?auto_911446 - PLACE
      ?auto_911447 - HOIST
      ?auto_911443 - SURFACE
      ?auto_911448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911444 ?auto_911445 ) ( IS-CRATE ?auto_911442 ) ( not ( = ?auto_911441 ?auto_911442 ) ) ( not ( = ?auto_911440 ?auto_911441 ) ) ( not ( = ?auto_911440 ?auto_911442 ) ) ( not ( = ?auto_911446 ?auto_911445 ) ) ( HOIST-AT ?auto_911447 ?auto_911446 ) ( not ( = ?auto_911444 ?auto_911447 ) ) ( AVAILABLE ?auto_911447 ) ( SURFACE-AT ?auto_911442 ?auto_911446 ) ( ON ?auto_911442 ?auto_911443 ) ( CLEAR ?auto_911442 ) ( not ( = ?auto_911441 ?auto_911443 ) ) ( not ( = ?auto_911442 ?auto_911443 ) ) ( not ( = ?auto_911440 ?auto_911443 ) ) ( TRUCK-AT ?auto_911448 ?auto_911445 ) ( SURFACE-AT ?auto_911440 ?auto_911445 ) ( CLEAR ?auto_911440 ) ( LIFTING ?auto_911444 ?auto_911441 ) ( IS-CRATE ?auto_911441 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911441 ?auto_911442 )
      ( MAKE-2CRATE-VERIFY ?auto_911440 ?auto_911441 ?auto_911442 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911449 - SURFACE
      ?auto_911450 - SURFACE
    )
    :vars
    (
      ?auto_911456 - HOIST
      ?auto_911454 - PLACE
      ?auto_911452 - SURFACE
      ?auto_911457 - PLACE
      ?auto_911455 - HOIST
      ?auto_911453 - SURFACE
      ?auto_911451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911456 ?auto_911454 ) ( IS-CRATE ?auto_911450 ) ( not ( = ?auto_911449 ?auto_911450 ) ) ( not ( = ?auto_911452 ?auto_911449 ) ) ( not ( = ?auto_911452 ?auto_911450 ) ) ( not ( = ?auto_911457 ?auto_911454 ) ) ( HOIST-AT ?auto_911455 ?auto_911457 ) ( not ( = ?auto_911456 ?auto_911455 ) ) ( AVAILABLE ?auto_911455 ) ( SURFACE-AT ?auto_911450 ?auto_911457 ) ( ON ?auto_911450 ?auto_911453 ) ( CLEAR ?auto_911450 ) ( not ( = ?auto_911449 ?auto_911453 ) ) ( not ( = ?auto_911450 ?auto_911453 ) ) ( not ( = ?auto_911452 ?auto_911453 ) ) ( TRUCK-AT ?auto_911451 ?auto_911454 ) ( SURFACE-AT ?auto_911452 ?auto_911454 ) ( CLEAR ?auto_911452 ) ( IS-CRATE ?auto_911449 ) ( AVAILABLE ?auto_911456 ) ( IN ?auto_911449 ?auto_911451 ) )
    :subtasks
    ( ( !UNLOAD ?auto_911456 ?auto_911449 ?auto_911451 ?auto_911454 )
      ( MAKE-2CRATE ?auto_911452 ?auto_911449 ?auto_911450 )
      ( MAKE-1CRATE-VERIFY ?auto_911449 ?auto_911450 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911458 - SURFACE
      ?auto_911459 - SURFACE
      ?auto_911460 - SURFACE
    )
    :vars
    (
      ?auto_911461 - HOIST
      ?auto_911462 - PLACE
      ?auto_911463 - PLACE
      ?auto_911464 - HOIST
      ?auto_911465 - SURFACE
      ?auto_911466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911461 ?auto_911462 ) ( IS-CRATE ?auto_911460 ) ( not ( = ?auto_911459 ?auto_911460 ) ) ( not ( = ?auto_911458 ?auto_911459 ) ) ( not ( = ?auto_911458 ?auto_911460 ) ) ( not ( = ?auto_911463 ?auto_911462 ) ) ( HOIST-AT ?auto_911464 ?auto_911463 ) ( not ( = ?auto_911461 ?auto_911464 ) ) ( AVAILABLE ?auto_911464 ) ( SURFACE-AT ?auto_911460 ?auto_911463 ) ( ON ?auto_911460 ?auto_911465 ) ( CLEAR ?auto_911460 ) ( not ( = ?auto_911459 ?auto_911465 ) ) ( not ( = ?auto_911460 ?auto_911465 ) ) ( not ( = ?auto_911458 ?auto_911465 ) ) ( TRUCK-AT ?auto_911466 ?auto_911462 ) ( SURFACE-AT ?auto_911458 ?auto_911462 ) ( CLEAR ?auto_911458 ) ( IS-CRATE ?auto_911459 ) ( AVAILABLE ?auto_911461 ) ( IN ?auto_911459 ?auto_911466 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911459 ?auto_911460 )
      ( MAKE-2CRATE-VERIFY ?auto_911458 ?auto_911459 ?auto_911460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911503 - SURFACE
      ?auto_911504 - SURFACE
    )
    :vars
    (
      ?auto_911509 - HOIST
      ?auto_911506 - PLACE
      ?auto_911510 - SURFACE
      ?auto_911505 - PLACE
      ?auto_911507 - HOIST
      ?auto_911511 - SURFACE
      ?auto_911508 - TRUCK
      ?auto_911512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911509 ?auto_911506 ) ( SURFACE-AT ?auto_911503 ?auto_911506 ) ( CLEAR ?auto_911503 ) ( IS-CRATE ?auto_911504 ) ( not ( = ?auto_911503 ?auto_911504 ) ) ( AVAILABLE ?auto_911509 ) ( ON ?auto_911503 ?auto_911510 ) ( not ( = ?auto_911510 ?auto_911503 ) ) ( not ( = ?auto_911510 ?auto_911504 ) ) ( not ( = ?auto_911505 ?auto_911506 ) ) ( HOIST-AT ?auto_911507 ?auto_911505 ) ( not ( = ?auto_911509 ?auto_911507 ) ) ( AVAILABLE ?auto_911507 ) ( SURFACE-AT ?auto_911504 ?auto_911505 ) ( ON ?auto_911504 ?auto_911511 ) ( CLEAR ?auto_911504 ) ( not ( = ?auto_911503 ?auto_911511 ) ) ( not ( = ?auto_911504 ?auto_911511 ) ) ( not ( = ?auto_911510 ?auto_911511 ) ) ( TRUCK-AT ?auto_911508 ?auto_911512 ) ( not ( = ?auto_911512 ?auto_911506 ) ) ( not ( = ?auto_911505 ?auto_911512 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911508 ?auto_911512 ?auto_911506 )
      ( MAKE-1CRATE ?auto_911503 ?auto_911504 )
      ( MAKE-1CRATE-VERIFY ?auto_911503 ?auto_911504 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911542 - SURFACE
      ?auto_911543 - SURFACE
      ?auto_911544 - SURFACE
      ?auto_911545 - SURFACE
    )
    :vars
    (
      ?auto_911547 - HOIST
      ?auto_911546 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911547 ?auto_911546 ) ( SURFACE-AT ?auto_911544 ?auto_911546 ) ( CLEAR ?auto_911544 ) ( LIFTING ?auto_911547 ?auto_911545 ) ( IS-CRATE ?auto_911545 ) ( not ( = ?auto_911544 ?auto_911545 ) ) ( ON ?auto_911543 ?auto_911542 ) ( ON ?auto_911544 ?auto_911543 ) ( not ( = ?auto_911542 ?auto_911543 ) ) ( not ( = ?auto_911542 ?auto_911544 ) ) ( not ( = ?auto_911542 ?auto_911545 ) ) ( not ( = ?auto_911543 ?auto_911544 ) ) ( not ( = ?auto_911543 ?auto_911545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911544 ?auto_911545 )
      ( MAKE-3CRATE-VERIFY ?auto_911542 ?auto_911543 ?auto_911544 ?auto_911545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911559 - SURFACE
      ?auto_911560 - SURFACE
      ?auto_911561 - SURFACE
      ?auto_911562 - SURFACE
    )
    :vars
    (
      ?auto_911565 - HOIST
      ?auto_911563 - PLACE
      ?auto_911564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911565 ?auto_911563 ) ( SURFACE-AT ?auto_911561 ?auto_911563 ) ( CLEAR ?auto_911561 ) ( IS-CRATE ?auto_911562 ) ( not ( = ?auto_911561 ?auto_911562 ) ) ( TRUCK-AT ?auto_911564 ?auto_911563 ) ( AVAILABLE ?auto_911565 ) ( IN ?auto_911562 ?auto_911564 ) ( ON ?auto_911561 ?auto_911560 ) ( not ( = ?auto_911560 ?auto_911561 ) ) ( not ( = ?auto_911560 ?auto_911562 ) ) ( ON ?auto_911560 ?auto_911559 ) ( not ( = ?auto_911559 ?auto_911560 ) ) ( not ( = ?auto_911559 ?auto_911561 ) ) ( not ( = ?auto_911559 ?auto_911562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911560 ?auto_911561 ?auto_911562 )
      ( MAKE-3CRATE-VERIFY ?auto_911559 ?auto_911560 ?auto_911561 ?auto_911562 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911580 - SURFACE
      ?auto_911581 - SURFACE
      ?auto_911582 - SURFACE
      ?auto_911583 - SURFACE
    )
    :vars
    (
      ?auto_911584 - HOIST
      ?auto_911585 - PLACE
      ?auto_911587 - TRUCK
      ?auto_911586 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911584 ?auto_911585 ) ( SURFACE-AT ?auto_911582 ?auto_911585 ) ( CLEAR ?auto_911582 ) ( IS-CRATE ?auto_911583 ) ( not ( = ?auto_911582 ?auto_911583 ) ) ( AVAILABLE ?auto_911584 ) ( IN ?auto_911583 ?auto_911587 ) ( ON ?auto_911582 ?auto_911581 ) ( not ( = ?auto_911581 ?auto_911582 ) ) ( not ( = ?auto_911581 ?auto_911583 ) ) ( TRUCK-AT ?auto_911587 ?auto_911586 ) ( not ( = ?auto_911586 ?auto_911585 ) ) ( ON ?auto_911581 ?auto_911580 ) ( not ( = ?auto_911580 ?auto_911581 ) ) ( not ( = ?auto_911580 ?auto_911582 ) ) ( not ( = ?auto_911580 ?auto_911583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911581 ?auto_911582 ?auto_911583 )
      ( MAKE-3CRATE-VERIFY ?auto_911580 ?auto_911581 ?auto_911582 ?auto_911583 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911604 - SURFACE
      ?auto_911605 - SURFACE
      ?auto_911606 - SURFACE
      ?auto_911607 - SURFACE
    )
    :vars
    (
      ?auto_911610 - HOIST
      ?auto_911608 - PLACE
      ?auto_911611 - TRUCK
      ?auto_911609 - PLACE
      ?auto_911612 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911610 ?auto_911608 ) ( SURFACE-AT ?auto_911606 ?auto_911608 ) ( CLEAR ?auto_911606 ) ( IS-CRATE ?auto_911607 ) ( not ( = ?auto_911606 ?auto_911607 ) ) ( AVAILABLE ?auto_911610 ) ( ON ?auto_911606 ?auto_911605 ) ( not ( = ?auto_911605 ?auto_911606 ) ) ( not ( = ?auto_911605 ?auto_911607 ) ) ( TRUCK-AT ?auto_911611 ?auto_911609 ) ( not ( = ?auto_911609 ?auto_911608 ) ) ( HOIST-AT ?auto_911612 ?auto_911609 ) ( LIFTING ?auto_911612 ?auto_911607 ) ( not ( = ?auto_911610 ?auto_911612 ) ) ( ON ?auto_911605 ?auto_911604 ) ( not ( = ?auto_911604 ?auto_911605 ) ) ( not ( = ?auto_911604 ?auto_911606 ) ) ( not ( = ?auto_911604 ?auto_911607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911605 ?auto_911606 ?auto_911607 )
      ( MAKE-3CRATE-VERIFY ?auto_911604 ?auto_911605 ?auto_911606 ?auto_911607 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911631 - SURFACE
      ?auto_911632 - SURFACE
      ?auto_911633 - SURFACE
      ?auto_911634 - SURFACE
    )
    :vars
    (
      ?auto_911637 - HOIST
      ?auto_911636 - PLACE
      ?auto_911639 - TRUCK
      ?auto_911635 - PLACE
      ?auto_911640 - HOIST
      ?auto_911638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911637 ?auto_911636 ) ( SURFACE-AT ?auto_911633 ?auto_911636 ) ( CLEAR ?auto_911633 ) ( IS-CRATE ?auto_911634 ) ( not ( = ?auto_911633 ?auto_911634 ) ) ( AVAILABLE ?auto_911637 ) ( ON ?auto_911633 ?auto_911632 ) ( not ( = ?auto_911632 ?auto_911633 ) ) ( not ( = ?auto_911632 ?auto_911634 ) ) ( TRUCK-AT ?auto_911639 ?auto_911635 ) ( not ( = ?auto_911635 ?auto_911636 ) ) ( HOIST-AT ?auto_911640 ?auto_911635 ) ( not ( = ?auto_911637 ?auto_911640 ) ) ( AVAILABLE ?auto_911640 ) ( SURFACE-AT ?auto_911634 ?auto_911635 ) ( ON ?auto_911634 ?auto_911638 ) ( CLEAR ?auto_911634 ) ( not ( = ?auto_911633 ?auto_911638 ) ) ( not ( = ?auto_911634 ?auto_911638 ) ) ( not ( = ?auto_911632 ?auto_911638 ) ) ( ON ?auto_911632 ?auto_911631 ) ( not ( = ?auto_911631 ?auto_911632 ) ) ( not ( = ?auto_911631 ?auto_911633 ) ) ( not ( = ?auto_911631 ?auto_911634 ) ) ( not ( = ?auto_911631 ?auto_911638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911632 ?auto_911633 ?auto_911634 )
      ( MAKE-3CRATE-VERIFY ?auto_911631 ?auto_911632 ?auto_911633 ?auto_911634 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911659 - SURFACE
      ?auto_911660 - SURFACE
      ?auto_911661 - SURFACE
      ?auto_911662 - SURFACE
    )
    :vars
    (
      ?auto_911666 - HOIST
      ?auto_911663 - PLACE
      ?auto_911668 - PLACE
      ?auto_911664 - HOIST
      ?auto_911665 - SURFACE
      ?auto_911667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911666 ?auto_911663 ) ( SURFACE-AT ?auto_911661 ?auto_911663 ) ( CLEAR ?auto_911661 ) ( IS-CRATE ?auto_911662 ) ( not ( = ?auto_911661 ?auto_911662 ) ) ( AVAILABLE ?auto_911666 ) ( ON ?auto_911661 ?auto_911660 ) ( not ( = ?auto_911660 ?auto_911661 ) ) ( not ( = ?auto_911660 ?auto_911662 ) ) ( not ( = ?auto_911668 ?auto_911663 ) ) ( HOIST-AT ?auto_911664 ?auto_911668 ) ( not ( = ?auto_911666 ?auto_911664 ) ) ( AVAILABLE ?auto_911664 ) ( SURFACE-AT ?auto_911662 ?auto_911668 ) ( ON ?auto_911662 ?auto_911665 ) ( CLEAR ?auto_911662 ) ( not ( = ?auto_911661 ?auto_911665 ) ) ( not ( = ?auto_911662 ?auto_911665 ) ) ( not ( = ?auto_911660 ?auto_911665 ) ) ( TRUCK-AT ?auto_911667 ?auto_911663 ) ( ON ?auto_911660 ?auto_911659 ) ( not ( = ?auto_911659 ?auto_911660 ) ) ( not ( = ?auto_911659 ?auto_911661 ) ) ( not ( = ?auto_911659 ?auto_911662 ) ) ( not ( = ?auto_911659 ?auto_911665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911660 ?auto_911661 ?auto_911662 )
      ( MAKE-3CRATE-VERIFY ?auto_911659 ?auto_911660 ?auto_911661 ?auto_911662 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911687 - SURFACE
      ?auto_911688 - SURFACE
      ?auto_911689 - SURFACE
      ?auto_911690 - SURFACE
    )
    :vars
    (
      ?auto_911694 - HOIST
      ?auto_911691 - PLACE
      ?auto_911692 - PLACE
      ?auto_911696 - HOIST
      ?auto_911695 - SURFACE
      ?auto_911693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911694 ?auto_911691 ) ( IS-CRATE ?auto_911690 ) ( not ( = ?auto_911689 ?auto_911690 ) ) ( not ( = ?auto_911688 ?auto_911689 ) ) ( not ( = ?auto_911688 ?auto_911690 ) ) ( not ( = ?auto_911692 ?auto_911691 ) ) ( HOIST-AT ?auto_911696 ?auto_911692 ) ( not ( = ?auto_911694 ?auto_911696 ) ) ( AVAILABLE ?auto_911696 ) ( SURFACE-AT ?auto_911690 ?auto_911692 ) ( ON ?auto_911690 ?auto_911695 ) ( CLEAR ?auto_911690 ) ( not ( = ?auto_911689 ?auto_911695 ) ) ( not ( = ?auto_911690 ?auto_911695 ) ) ( not ( = ?auto_911688 ?auto_911695 ) ) ( TRUCK-AT ?auto_911693 ?auto_911691 ) ( SURFACE-AT ?auto_911688 ?auto_911691 ) ( CLEAR ?auto_911688 ) ( LIFTING ?auto_911694 ?auto_911689 ) ( IS-CRATE ?auto_911689 ) ( ON ?auto_911688 ?auto_911687 ) ( not ( = ?auto_911687 ?auto_911688 ) ) ( not ( = ?auto_911687 ?auto_911689 ) ) ( not ( = ?auto_911687 ?auto_911690 ) ) ( not ( = ?auto_911687 ?auto_911695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911688 ?auto_911689 ?auto_911690 )
      ( MAKE-3CRATE-VERIFY ?auto_911687 ?auto_911688 ?auto_911689 ?auto_911690 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911715 - SURFACE
      ?auto_911716 - SURFACE
      ?auto_911717 - SURFACE
      ?auto_911718 - SURFACE
    )
    :vars
    (
      ?auto_911720 - HOIST
      ?auto_911719 - PLACE
      ?auto_911724 - PLACE
      ?auto_911723 - HOIST
      ?auto_911721 - SURFACE
      ?auto_911722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911720 ?auto_911719 ) ( IS-CRATE ?auto_911718 ) ( not ( = ?auto_911717 ?auto_911718 ) ) ( not ( = ?auto_911716 ?auto_911717 ) ) ( not ( = ?auto_911716 ?auto_911718 ) ) ( not ( = ?auto_911724 ?auto_911719 ) ) ( HOIST-AT ?auto_911723 ?auto_911724 ) ( not ( = ?auto_911720 ?auto_911723 ) ) ( AVAILABLE ?auto_911723 ) ( SURFACE-AT ?auto_911718 ?auto_911724 ) ( ON ?auto_911718 ?auto_911721 ) ( CLEAR ?auto_911718 ) ( not ( = ?auto_911717 ?auto_911721 ) ) ( not ( = ?auto_911718 ?auto_911721 ) ) ( not ( = ?auto_911716 ?auto_911721 ) ) ( TRUCK-AT ?auto_911722 ?auto_911719 ) ( SURFACE-AT ?auto_911716 ?auto_911719 ) ( CLEAR ?auto_911716 ) ( IS-CRATE ?auto_911717 ) ( AVAILABLE ?auto_911720 ) ( IN ?auto_911717 ?auto_911722 ) ( ON ?auto_911716 ?auto_911715 ) ( not ( = ?auto_911715 ?auto_911716 ) ) ( not ( = ?auto_911715 ?auto_911717 ) ) ( not ( = ?auto_911715 ?auto_911718 ) ) ( not ( = ?auto_911715 ?auto_911721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911716 ?auto_911717 ?auto_911718 )
      ( MAKE-3CRATE-VERIFY ?auto_911715 ?auto_911716 ?auto_911717 ?auto_911718 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912006 - SURFACE
      ?auto_912007 - SURFACE
      ?auto_912008 - SURFACE
      ?auto_912009 - SURFACE
      ?auto_912010 - SURFACE
    )
    :vars
    (
      ?auto_912011 - HOIST
      ?auto_912012 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912011 ?auto_912012 ) ( SURFACE-AT ?auto_912009 ?auto_912012 ) ( CLEAR ?auto_912009 ) ( LIFTING ?auto_912011 ?auto_912010 ) ( IS-CRATE ?auto_912010 ) ( not ( = ?auto_912009 ?auto_912010 ) ) ( ON ?auto_912007 ?auto_912006 ) ( ON ?auto_912008 ?auto_912007 ) ( ON ?auto_912009 ?auto_912008 ) ( not ( = ?auto_912006 ?auto_912007 ) ) ( not ( = ?auto_912006 ?auto_912008 ) ) ( not ( = ?auto_912006 ?auto_912009 ) ) ( not ( = ?auto_912006 ?auto_912010 ) ) ( not ( = ?auto_912007 ?auto_912008 ) ) ( not ( = ?auto_912007 ?auto_912009 ) ) ( not ( = ?auto_912007 ?auto_912010 ) ) ( not ( = ?auto_912008 ?auto_912009 ) ) ( not ( = ?auto_912008 ?auto_912010 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_912009 ?auto_912010 )
      ( MAKE-4CRATE-VERIFY ?auto_912006 ?auto_912007 ?auto_912008 ?auto_912009 ?auto_912010 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912031 - SURFACE
      ?auto_912032 - SURFACE
      ?auto_912033 - SURFACE
      ?auto_912034 - SURFACE
      ?auto_912035 - SURFACE
    )
    :vars
    (
      ?auto_912037 - HOIST
      ?auto_912036 - PLACE
      ?auto_912038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912037 ?auto_912036 ) ( SURFACE-AT ?auto_912034 ?auto_912036 ) ( CLEAR ?auto_912034 ) ( IS-CRATE ?auto_912035 ) ( not ( = ?auto_912034 ?auto_912035 ) ) ( TRUCK-AT ?auto_912038 ?auto_912036 ) ( AVAILABLE ?auto_912037 ) ( IN ?auto_912035 ?auto_912038 ) ( ON ?auto_912034 ?auto_912033 ) ( not ( = ?auto_912033 ?auto_912034 ) ) ( not ( = ?auto_912033 ?auto_912035 ) ) ( ON ?auto_912032 ?auto_912031 ) ( ON ?auto_912033 ?auto_912032 ) ( not ( = ?auto_912031 ?auto_912032 ) ) ( not ( = ?auto_912031 ?auto_912033 ) ) ( not ( = ?auto_912031 ?auto_912034 ) ) ( not ( = ?auto_912031 ?auto_912035 ) ) ( not ( = ?auto_912032 ?auto_912033 ) ) ( not ( = ?auto_912032 ?auto_912034 ) ) ( not ( = ?auto_912032 ?auto_912035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912033 ?auto_912034 ?auto_912035 )
      ( MAKE-4CRATE-VERIFY ?auto_912031 ?auto_912032 ?auto_912033 ?auto_912034 ?auto_912035 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912061 - SURFACE
      ?auto_912062 - SURFACE
      ?auto_912063 - SURFACE
      ?auto_912064 - SURFACE
      ?auto_912065 - SURFACE
    )
    :vars
    (
      ?auto_912067 - HOIST
      ?auto_912066 - PLACE
      ?auto_912069 - TRUCK
      ?auto_912068 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912067 ?auto_912066 ) ( SURFACE-AT ?auto_912064 ?auto_912066 ) ( CLEAR ?auto_912064 ) ( IS-CRATE ?auto_912065 ) ( not ( = ?auto_912064 ?auto_912065 ) ) ( AVAILABLE ?auto_912067 ) ( IN ?auto_912065 ?auto_912069 ) ( ON ?auto_912064 ?auto_912063 ) ( not ( = ?auto_912063 ?auto_912064 ) ) ( not ( = ?auto_912063 ?auto_912065 ) ) ( TRUCK-AT ?auto_912069 ?auto_912068 ) ( not ( = ?auto_912068 ?auto_912066 ) ) ( ON ?auto_912062 ?auto_912061 ) ( ON ?auto_912063 ?auto_912062 ) ( not ( = ?auto_912061 ?auto_912062 ) ) ( not ( = ?auto_912061 ?auto_912063 ) ) ( not ( = ?auto_912061 ?auto_912064 ) ) ( not ( = ?auto_912061 ?auto_912065 ) ) ( not ( = ?auto_912062 ?auto_912063 ) ) ( not ( = ?auto_912062 ?auto_912064 ) ) ( not ( = ?auto_912062 ?auto_912065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912063 ?auto_912064 ?auto_912065 )
      ( MAKE-4CRATE-VERIFY ?auto_912061 ?auto_912062 ?auto_912063 ?auto_912064 ?auto_912065 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912095 - SURFACE
      ?auto_912096 - SURFACE
      ?auto_912097 - SURFACE
      ?auto_912098 - SURFACE
      ?auto_912099 - SURFACE
    )
    :vars
    (
      ?auto_912100 - HOIST
      ?auto_912104 - PLACE
      ?auto_912101 - TRUCK
      ?auto_912103 - PLACE
      ?auto_912102 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_912100 ?auto_912104 ) ( SURFACE-AT ?auto_912098 ?auto_912104 ) ( CLEAR ?auto_912098 ) ( IS-CRATE ?auto_912099 ) ( not ( = ?auto_912098 ?auto_912099 ) ) ( AVAILABLE ?auto_912100 ) ( ON ?auto_912098 ?auto_912097 ) ( not ( = ?auto_912097 ?auto_912098 ) ) ( not ( = ?auto_912097 ?auto_912099 ) ) ( TRUCK-AT ?auto_912101 ?auto_912103 ) ( not ( = ?auto_912103 ?auto_912104 ) ) ( HOIST-AT ?auto_912102 ?auto_912103 ) ( LIFTING ?auto_912102 ?auto_912099 ) ( not ( = ?auto_912100 ?auto_912102 ) ) ( ON ?auto_912096 ?auto_912095 ) ( ON ?auto_912097 ?auto_912096 ) ( not ( = ?auto_912095 ?auto_912096 ) ) ( not ( = ?auto_912095 ?auto_912097 ) ) ( not ( = ?auto_912095 ?auto_912098 ) ) ( not ( = ?auto_912095 ?auto_912099 ) ) ( not ( = ?auto_912096 ?auto_912097 ) ) ( not ( = ?auto_912096 ?auto_912098 ) ) ( not ( = ?auto_912096 ?auto_912099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912097 ?auto_912098 ?auto_912099 )
      ( MAKE-4CRATE-VERIFY ?auto_912095 ?auto_912096 ?auto_912097 ?auto_912098 ?auto_912099 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912133 - SURFACE
      ?auto_912134 - SURFACE
      ?auto_912135 - SURFACE
      ?auto_912136 - SURFACE
      ?auto_912137 - SURFACE
    )
    :vars
    (
      ?auto_912139 - HOIST
      ?auto_912142 - PLACE
      ?auto_912143 - TRUCK
      ?auto_912140 - PLACE
      ?auto_912138 - HOIST
      ?auto_912141 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912139 ?auto_912142 ) ( SURFACE-AT ?auto_912136 ?auto_912142 ) ( CLEAR ?auto_912136 ) ( IS-CRATE ?auto_912137 ) ( not ( = ?auto_912136 ?auto_912137 ) ) ( AVAILABLE ?auto_912139 ) ( ON ?auto_912136 ?auto_912135 ) ( not ( = ?auto_912135 ?auto_912136 ) ) ( not ( = ?auto_912135 ?auto_912137 ) ) ( TRUCK-AT ?auto_912143 ?auto_912140 ) ( not ( = ?auto_912140 ?auto_912142 ) ) ( HOIST-AT ?auto_912138 ?auto_912140 ) ( not ( = ?auto_912139 ?auto_912138 ) ) ( AVAILABLE ?auto_912138 ) ( SURFACE-AT ?auto_912137 ?auto_912140 ) ( ON ?auto_912137 ?auto_912141 ) ( CLEAR ?auto_912137 ) ( not ( = ?auto_912136 ?auto_912141 ) ) ( not ( = ?auto_912137 ?auto_912141 ) ) ( not ( = ?auto_912135 ?auto_912141 ) ) ( ON ?auto_912134 ?auto_912133 ) ( ON ?auto_912135 ?auto_912134 ) ( not ( = ?auto_912133 ?auto_912134 ) ) ( not ( = ?auto_912133 ?auto_912135 ) ) ( not ( = ?auto_912133 ?auto_912136 ) ) ( not ( = ?auto_912133 ?auto_912137 ) ) ( not ( = ?auto_912133 ?auto_912141 ) ) ( not ( = ?auto_912134 ?auto_912135 ) ) ( not ( = ?auto_912134 ?auto_912136 ) ) ( not ( = ?auto_912134 ?auto_912137 ) ) ( not ( = ?auto_912134 ?auto_912141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912135 ?auto_912136 ?auto_912137 )
      ( MAKE-4CRATE-VERIFY ?auto_912133 ?auto_912134 ?auto_912135 ?auto_912136 ?auto_912137 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912172 - SURFACE
      ?auto_912173 - SURFACE
      ?auto_912174 - SURFACE
      ?auto_912175 - SURFACE
      ?auto_912176 - SURFACE
    )
    :vars
    (
      ?auto_912177 - HOIST
      ?auto_912181 - PLACE
      ?auto_912179 - PLACE
      ?auto_912180 - HOIST
      ?auto_912182 - SURFACE
      ?auto_912178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912177 ?auto_912181 ) ( SURFACE-AT ?auto_912175 ?auto_912181 ) ( CLEAR ?auto_912175 ) ( IS-CRATE ?auto_912176 ) ( not ( = ?auto_912175 ?auto_912176 ) ) ( AVAILABLE ?auto_912177 ) ( ON ?auto_912175 ?auto_912174 ) ( not ( = ?auto_912174 ?auto_912175 ) ) ( not ( = ?auto_912174 ?auto_912176 ) ) ( not ( = ?auto_912179 ?auto_912181 ) ) ( HOIST-AT ?auto_912180 ?auto_912179 ) ( not ( = ?auto_912177 ?auto_912180 ) ) ( AVAILABLE ?auto_912180 ) ( SURFACE-AT ?auto_912176 ?auto_912179 ) ( ON ?auto_912176 ?auto_912182 ) ( CLEAR ?auto_912176 ) ( not ( = ?auto_912175 ?auto_912182 ) ) ( not ( = ?auto_912176 ?auto_912182 ) ) ( not ( = ?auto_912174 ?auto_912182 ) ) ( TRUCK-AT ?auto_912178 ?auto_912181 ) ( ON ?auto_912173 ?auto_912172 ) ( ON ?auto_912174 ?auto_912173 ) ( not ( = ?auto_912172 ?auto_912173 ) ) ( not ( = ?auto_912172 ?auto_912174 ) ) ( not ( = ?auto_912172 ?auto_912175 ) ) ( not ( = ?auto_912172 ?auto_912176 ) ) ( not ( = ?auto_912172 ?auto_912182 ) ) ( not ( = ?auto_912173 ?auto_912174 ) ) ( not ( = ?auto_912173 ?auto_912175 ) ) ( not ( = ?auto_912173 ?auto_912176 ) ) ( not ( = ?auto_912173 ?auto_912182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912174 ?auto_912175 ?auto_912176 )
      ( MAKE-4CRATE-VERIFY ?auto_912172 ?auto_912173 ?auto_912174 ?auto_912175 ?auto_912176 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912211 - SURFACE
      ?auto_912212 - SURFACE
      ?auto_912213 - SURFACE
      ?auto_912214 - SURFACE
      ?auto_912215 - SURFACE
    )
    :vars
    (
      ?auto_912220 - HOIST
      ?auto_912219 - PLACE
      ?auto_912217 - PLACE
      ?auto_912216 - HOIST
      ?auto_912221 - SURFACE
      ?auto_912218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912220 ?auto_912219 ) ( IS-CRATE ?auto_912215 ) ( not ( = ?auto_912214 ?auto_912215 ) ) ( not ( = ?auto_912213 ?auto_912214 ) ) ( not ( = ?auto_912213 ?auto_912215 ) ) ( not ( = ?auto_912217 ?auto_912219 ) ) ( HOIST-AT ?auto_912216 ?auto_912217 ) ( not ( = ?auto_912220 ?auto_912216 ) ) ( AVAILABLE ?auto_912216 ) ( SURFACE-AT ?auto_912215 ?auto_912217 ) ( ON ?auto_912215 ?auto_912221 ) ( CLEAR ?auto_912215 ) ( not ( = ?auto_912214 ?auto_912221 ) ) ( not ( = ?auto_912215 ?auto_912221 ) ) ( not ( = ?auto_912213 ?auto_912221 ) ) ( TRUCK-AT ?auto_912218 ?auto_912219 ) ( SURFACE-AT ?auto_912213 ?auto_912219 ) ( CLEAR ?auto_912213 ) ( LIFTING ?auto_912220 ?auto_912214 ) ( IS-CRATE ?auto_912214 ) ( ON ?auto_912212 ?auto_912211 ) ( ON ?auto_912213 ?auto_912212 ) ( not ( = ?auto_912211 ?auto_912212 ) ) ( not ( = ?auto_912211 ?auto_912213 ) ) ( not ( = ?auto_912211 ?auto_912214 ) ) ( not ( = ?auto_912211 ?auto_912215 ) ) ( not ( = ?auto_912211 ?auto_912221 ) ) ( not ( = ?auto_912212 ?auto_912213 ) ) ( not ( = ?auto_912212 ?auto_912214 ) ) ( not ( = ?auto_912212 ?auto_912215 ) ) ( not ( = ?auto_912212 ?auto_912221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912213 ?auto_912214 ?auto_912215 )
      ( MAKE-4CRATE-VERIFY ?auto_912211 ?auto_912212 ?auto_912213 ?auto_912214 ?auto_912215 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912250 - SURFACE
      ?auto_912251 - SURFACE
      ?auto_912252 - SURFACE
      ?auto_912253 - SURFACE
      ?auto_912254 - SURFACE
    )
    :vars
    (
      ?auto_912260 - HOIST
      ?auto_912258 - PLACE
      ?auto_912257 - PLACE
      ?auto_912256 - HOIST
      ?auto_912255 - SURFACE
      ?auto_912259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912260 ?auto_912258 ) ( IS-CRATE ?auto_912254 ) ( not ( = ?auto_912253 ?auto_912254 ) ) ( not ( = ?auto_912252 ?auto_912253 ) ) ( not ( = ?auto_912252 ?auto_912254 ) ) ( not ( = ?auto_912257 ?auto_912258 ) ) ( HOIST-AT ?auto_912256 ?auto_912257 ) ( not ( = ?auto_912260 ?auto_912256 ) ) ( AVAILABLE ?auto_912256 ) ( SURFACE-AT ?auto_912254 ?auto_912257 ) ( ON ?auto_912254 ?auto_912255 ) ( CLEAR ?auto_912254 ) ( not ( = ?auto_912253 ?auto_912255 ) ) ( not ( = ?auto_912254 ?auto_912255 ) ) ( not ( = ?auto_912252 ?auto_912255 ) ) ( TRUCK-AT ?auto_912259 ?auto_912258 ) ( SURFACE-AT ?auto_912252 ?auto_912258 ) ( CLEAR ?auto_912252 ) ( IS-CRATE ?auto_912253 ) ( AVAILABLE ?auto_912260 ) ( IN ?auto_912253 ?auto_912259 ) ( ON ?auto_912251 ?auto_912250 ) ( ON ?auto_912252 ?auto_912251 ) ( not ( = ?auto_912250 ?auto_912251 ) ) ( not ( = ?auto_912250 ?auto_912252 ) ) ( not ( = ?auto_912250 ?auto_912253 ) ) ( not ( = ?auto_912250 ?auto_912254 ) ) ( not ( = ?auto_912250 ?auto_912255 ) ) ( not ( = ?auto_912251 ?auto_912252 ) ) ( not ( = ?auto_912251 ?auto_912253 ) ) ( not ( = ?auto_912251 ?auto_912254 ) ) ( not ( = ?auto_912251 ?auto_912255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912252 ?auto_912253 ?auto_912254 )
      ( MAKE-4CRATE-VERIFY ?auto_912250 ?auto_912251 ?auto_912252 ?auto_912253 ?auto_912254 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912910 - SURFACE
      ?auto_912911 - SURFACE
      ?auto_912912 - SURFACE
      ?auto_912913 - SURFACE
      ?auto_912914 - SURFACE
      ?auto_912915 - SURFACE
    )
    :vars
    (
      ?auto_912916 - HOIST
      ?auto_912917 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912916 ?auto_912917 ) ( SURFACE-AT ?auto_912914 ?auto_912917 ) ( CLEAR ?auto_912914 ) ( LIFTING ?auto_912916 ?auto_912915 ) ( IS-CRATE ?auto_912915 ) ( not ( = ?auto_912914 ?auto_912915 ) ) ( ON ?auto_912911 ?auto_912910 ) ( ON ?auto_912912 ?auto_912911 ) ( ON ?auto_912913 ?auto_912912 ) ( ON ?auto_912914 ?auto_912913 ) ( not ( = ?auto_912910 ?auto_912911 ) ) ( not ( = ?auto_912910 ?auto_912912 ) ) ( not ( = ?auto_912910 ?auto_912913 ) ) ( not ( = ?auto_912910 ?auto_912914 ) ) ( not ( = ?auto_912910 ?auto_912915 ) ) ( not ( = ?auto_912911 ?auto_912912 ) ) ( not ( = ?auto_912911 ?auto_912913 ) ) ( not ( = ?auto_912911 ?auto_912914 ) ) ( not ( = ?auto_912911 ?auto_912915 ) ) ( not ( = ?auto_912912 ?auto_912913 ) ) ( not ( = ?auto_912912 ?auto_912914 ) ) ( not ( = ?auto_912912 ?auto_912915 ) ) ( not ( = ?auto_912913 ?auto_912914 ) ) ( not ( = ?auto_912913 ?auto_912915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_912914 ?auto_912915 )
      ( MAKE-5CRATE-VERIFY ?auto_912910 ?auto_912911 ?auto_912912 ?auto_912913 ?auto_912914 ?auto_912915 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912944 - SURFACE
      ?auto_912945 - SURFACE
      ?auto_912946 - SURFACE
      ?auto_912947 - SURFACE
      ?auto_912948 - SURFACE
      ?auto_912949 - SURFACE
    )
    :vars
    (
      ?auto_912951 - HOIST
      ?auto_912952 - PLACE
      ?auto_912950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912951 ?auto_912952 ) ( SURFACE-AT ?auto_912948 ?auto_912952 ) ( CLEAR ?auto_912948 ) ( IS-CRATE ?auto_912949 ) ( not ( = ?auto_912948 ?auto_912949 ) ) ( TRUCK-AT ?auto_912950 ?auto_912952 ) ( AVAILABLE ?auto_912951 ) ( IN ?auto_912949 ?auto_912950 ) ( ON ?auto_912948 ?auto_912947 ) ( not ( = ?auto_912947 ?auto_912948 ) ) ( not ( = ?auto_912947 ?auto_912949 ) ) ( ON ?auto_912945 ?auto_912944 ) ( ON ?auto_912946 ?auto_912945 ) ( ON ?auto_912947 ?auto_912946 ) ( not ( = ?auto_912944 ?auto_912945 ) ) ( not ( = ?auto_912944 ?auto_912946 ) ) ( not ( = ?auto_912944 ?auto_912947 ) ) ( not ( = ?auto_912944 ?auto_912948 ) ) ( not ( = ?auto_912944 ?auto_912949 ) ) ( not ( = ?auto_912945 ?auto_912946 ) ) ( not ( = ?auto_912945 ?auto_912947 ) ) ( not ( = ?auto_912945 ?auto_912948 ) ) ( not ( = ?auto_912945 ?auto_912949 ) ) ( not ( = ?auto_912946 ?auto_912947 ) ) ( not ( = ?auto_912946 ?auto_912948 ) ) ( not ( = ?auto_912946 ?auto_912949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912947 ?auto_912948 ?auto_912949 )
      ( MAKE-5CRATE-VERIFY ?auto_912944 ?auto_912945 ?auto_912946 ?auto_912947 ?auto_912948 ?auto_912949 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_912984 - SURFACE
      ?auto_912985 - SURFACE
      ?auto_912986 - SURFACE
      ?auto_912987 - SURFACE
      ?auto_912988 - SURFACE
      ?auto_912989 - SURFACE
    )
    :vars
    (
      ?auto_912993 - HOIST
      ?auto_912991 - PLACE
      ?auto_912990 - TRUCK
      ?auto_912992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912993 ?auto_912991 ) ( SURFACE-AT ?auto_912988 ?auto_912991 ) ( CLEAR ?auto_912988 ) ( IS-CRATE ?auto_912989 ) ( not ( = ?auto_912988 ?auto_912989 ) ) ( AVAILABLE ?auto_912993 ) ( IN ?auto_912989 ?auto_912990 ) ( ON ?auto_912988 ?auto_912987 ) ( not ( = ?auto_912987 ?auto_912988 ) ) ( not ( = ?auto_912987 ?auto_912989 ) ) ( TRUCK-AT ?auto_912990 ?auto_912992 ) ( not ( = ?auto_912992 ?auto_912991 ) ) ( ON ?auto_912985 ?auto_912984 ) ( ON ?auto_912986 ?auto_912985 ) ( ON ?auto_912987 ?auto_912986 ) ( not ( = ?auto_912984 ?auto_912985 ) ) ( not ( = ?auto_912984 ?auto_912986 ) ) ( not ( = ?auto_912984 ?auto_912987 ) ) ( not ( = ?auto_912984 ?auto_912988 ) ) ( not ( = ?auto_912984 ?auto_912989 ) ) ( not ( = ?auto_912985 ?auto_912986 ) ) ( not ( = ?auto_912985 ?auto_912987 ) ) ( not ( = ?auto_912985 ?auto_912988 ) ) ( not ( = ?auto_912985 ?auto_912989 ) ) ( not ( = ?auto_912986 ?auto_912987 ) ) ( not ( = ?auto_912986 ?auto_912988 ) ) ( not ( = ?auto_912986 ?auto_912989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912987 ?auto_912988 ?auto_912989 )
      ( MAKE-5CRATE-VERIFY ?auto_912984 ?auto_912985 ?auto_912986 ?auto_912987 ?auto_912988 ?auto_912989 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913029 - SURFACE
      ?auto_913030 - SURFACE
      ?auto_913031 - SURFACE
      ?auto_913032 - SURFACE
      ?auto_913033 - SURFACE
      ?auto_913034 - SURFACE
    )
    :vars
    (
      ?auto_913037 - HOIST
      ?auto_913036 - PLACE
      ?auto_913035 - TRUCK
      ?auto_913039 - PLACE
      ?auto_913038 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_913037 ?auto_913036 ) ( SURFACE-AT ?auto_913033 ?auto_913036 ) ( CLEAR ?auto_913033 ) ( IS-CRATE ?auto_913034 ) ( not ( = ?auto_913033 ?auto_913034 ) ) ( AVAILABLE ?auto_913037 ) ( ON ?auto_913033 ?auto_913032 ) ( not ( = ?auto_913032 ?auto_913033 ) ) ( not ( = ?auto_913032 ?auto_913034 ) ) ( TRUCK-AT ?auto_913035 ?auto_913039 ) ( not ( = ?auto_913039 ?auto_913036 ) ) ( HOIST-AT ?auto_913038 ?auto_913039 ) ( LIFTING ?auto_913038 ?auto_913034 ) ( not ( = ?auto_913037 ?auto_913038 ) ) ( ON ?auto_913030 ?auto_913029 ) ( ON ?auto_913031 ?auto_913030 ) ( ON ?auto_913032 ?auto_913031 ) ( not ( = ?auto_913029 ?auto_913030 ) ) ( not ( = ?auto_913029 ?auto_913031 ) ) ( not ( = ?auto_913029 ?auto_913032 ) ) ( not ( = ?auto_913029 ?auto_913033 ) ) ( not ( = ?auto_913029 ?auto_913034 ) ) ( not ( = ?auto_913030 ?auto_913031 ) ) ( not ( = ?auto_913030 ?auto_913032 ) ) ( not ( = ?auto_913030 ?auto_913033 ) ) ( not ( = ?auto_913030 ?auto_913034 ) ) ( not ( = ?auto_913031 ?auto_913032 ) ) ( not ( = ?auto_913031 ?auto_913033 ) ) ( not ( = ?auto_913031 ?auto_913034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913032 ?auto_913033 ?auto_913034 )
      ( MAKE-5CRATE-VERIFY ?auto_913029 ?auto_913030 ?auto_913031 ?auto_913032 ?auto_913033 ?auto_913034 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913079 - SURFACE
      ?auto_913080 - SURFACE
      ?auto_913081 - SURFACE
      ?auto_913082 - SURFACE
      ?auto_913083 - SURFACE
      ?auto_913084 - SURFACE
    )
    :vars
    (
      ?auto_913088 - HOIST
      ?auto_913085 - PLACE
      ?auto_913089 - TRUCK
      ?auto_913086 - PLACE
      ?auto_913087 - HOIST
      ?auto_913090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_913088 ?auto_913085 ) ( SURFACE-AT ?auto_913083 ?auto_913085 ) ( CLEAR ?auto_913083 ) ( IS-CRATE ?auto_913084 ) ( not ( = ?auto_913083 ?auto_913084 ) ) ( AVAILABLE ?auto_913088 ) ( ON ?auto_913083 ?auto_913082 ) ( not ( = ?auto_913082 ?auto_913083 ) ) ( not ( = ?auto_913082 ?auto_913084 ) ) ( TRUCK-AT ?auto_913089 ?auto_913086 ) ( not ( = ?auto_913086 ?auto_913085 ) ) ( HOIST-AT ?auto_913087 ?auto_913086 ) ( not ( = ?auto_913088 ?auto_913087 ) ) ( AVAILABLE ?auto_913087 ) ( SURFACE-AT ?auto_913084 ?auto_913086 ) ( ON ?auto_913084 ?auto_913090 ) ( CLEAR ?auto_913084 ) ( not ( = ?auto_913083 ?auto_913090 ) ) ( not ( = ?auto_913084 ?auto_913090 ) ) ( not ( = ?auto_913082 ?auto_913090 ) ) ( ON ?auto_913080 ?auto_913079 ) ( ON ?auto_913081 ?auto_913080 ) ( ON ?auto_913082 ?auto_913081 ) ( not ( = ?auto_913079 ?auto_913080 ) ) ( not ( = ?auto_913079 ?auto_913081 ) ) ( not ( = ?auto_913079 ?auto_913082 ) ) ( not ( = ?auto_913079 ?auto_913083 ) ) ( not ( = ?auto_913079 ?auto_913084 ) ) ( not ( = ?auto_913079 ?auto_913090 ) ) ( not ( = ?auto_913080 ?auto_913081 ) ) ( not ( = ?auto_913080 ?auto_913082 ) ) ( not ( = ?auto_913080 ?auto_913083 ) ) ( not ( = ?auto_913080 ?auto_913084 ) ) ( not ( = ?auto_913080 ?auto_913090 ) ) ( not ( = ?auto_913081 ?auto_913082 ) ) ( not ( = ?auto_913081 ?auto_913083 ) ) ( not ( = ?auto_913081 ?auto_913084 ) ) ( not ( = ?auto_913081 ?auto_913090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913082 ?auto_913083 ?auto_913084 )
      ( MAKE-5CRATE-VERIFY ?auto_913079 ?auto_913080 ?auto_913081 ?auto_913082 ?auto_913083 ?auto_913084 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913130 - SURFACE
      ?auto_913131 - SURFACE
      ?auto_913132 - SURFACE
      ?auto_913133 - SURFACE
      ?auto_913134 - SURFACE
      ?auto_913135 - SURFACE
    )
    :vars
    (
      ?auto_913138 - HOIST
      ?auto_913140 - PLACE
      ?auto_913141 - PLACE
      ?auto_913139 - HOIST
      ?auto_913136 - SURFACE
      ?auto_913137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913138 ?auto_913140 ) ( SURFACE-AT ?auto_913134 ?auto_913140 ) ( CLEAR ?auto_913134 ) ( IS-CRATE ?auto_913135 ) ( not ( = ?auto_913134 ?auto_913135 ) ) ( AVAILABLE ?auto_913138 ) ( ON ?auto_913134 ?auto_913133 ) ( not ( = ?auto_913133 ?auto_913134 ) ) ( not ( = ?auto_913133 ?auto_913135 ) ) ( not ( = ?auto_913141 ?auto_913140 ) ) ( HOIST-AT ?auto_913139 ?auto_913141 ) ( not ( = ?auto_913138 ?auto_913139 ) ) ( AVAILABLE ?auto_913139 ) ( SURFACE-AT ?auto_913135 ?auto_913141 ) ( ON ?auto_913135 ?auto_913136 ) ( CLEAR ?auto_913135 ) ( not ( = ?auto_913134 ?auto_913136 ) ) ( not ( = ?auto_913135 ?auto_913136 ) ) ( not ( = ?auto_913133 ?auto_913136 ) ) ( TRUCK-AT ?auto_913137 ?auto_913140 ) ( ON ?auto_913131 ?auto_913130 ) ( ON ?auto_913132 ?auto_913131 ) ( ON ?auto_913133 ?auto_913132 ) ( not ( = ?auto_913130 ?auto_913131 ) ) ( not ( = ?auto_913130 ?auto_913132 ) ) ( not ( = ?auto_913130 ?auto_913133 ) ) ( not ( = ?auto_913130 ?auto_913134 ) ) ( not ( = ?auto_913130 ?auto_913135 ) ) ( not ( = ?auto_913130 ?auto_913136 ) ) ( not ( = ?auto_913131 ?auto_913132 ) ) ( not ( = ?auto_913131 ?auto_913133 ) ) ( not ( = ?auto_913131 ?auto_913134 ) ) ( not ( = ?auto_913131 ?auto_913135 ) ) ( not ( = ?auto_913131 ?auto_913136 ) ) ( not ( = ?auto_913132 ?auto_913133 ) ) ( not ( = ?auto_913132 ?auto_913134 ) ) ( not ( = ?auto_913132 ?auto_913135 ) ) ( not ( = ?auto_913132 ?auto_913136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913133 ?auto_913134 ?auto_913135 )
      ( MAKE-5CRATE-VERIFY ?auto_913130 ?auto_913131 ?auto_913132 ?auto_913133 ?auto_913134 ?auto_913135 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913181 - SURFACE
      ?auto_913182 - SURFACE
      ?auto_913183 - SURFACE
      ?auto_913184 - SURFACE
      ?auto_913185 - SURFACE
      ?auto_913186 - SURFACE
    )
    :vars
    (
      ?auto_913190 - HOIST
      ?auto_913188 - PLACE
      ?auto_913187 - PLACE
      ?auto_913192 - HOIST
      ?auto_913191 - SURFACE
      ?auto_913189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913190 ?auto_913188 ) ( IS-CRATE ?auto_913186 ) ( not ( = ?auto_913185 ?auto_913186 ) ) ( not ( = ?auto_913184 ?auto_913185 ) ) ( not ( = ?auto_913184 ?auto_913186 ) ) ( not ( = ?auto_913187 ?auto_913188 ) ) ( HOIST-AT ?auto_913192 ?auto_913187 ) ( not ( = ?auto_913190 ?auto_913192 ) ) ( AVAILABLE ?auto_913192 ) ( SURFACE-AT ?auto_913186 ?auto_913187 ) ( ON ?auto_913186 ?auto_913191 ) ( CLEAR ?auto_913186 ) ( not ( = ?auto_913185 ?auto_913191 ) ) ( not ( = ?auto_913186 ?auto_913191 ) ) ( not ( = ?auto_913184 ?auto_913191 ) ) ( TRUCK-AT ?auto_913189 ?auto_913188 ) ( SURFACE-AT ?auto_913184 ?auto_913188 ) ( CLEAR ?auto_913184 ) ( LIFTING ?auto_913190 ?auto_913185 ) ( IS-CRATE ?auto_913185 ) ( ON ?auto_913182 ?auto_913181 ) ( ON ?auto_913183 ?auto_913182 ) ( ON ?auto_913184 ?auto_913183 ) ( not ( = ?auto_913181 ?auto_913182 ) ) ( not ( = ?auto_913181 ?auto_913183 ) ) ( not ( = ?auto_913181 ?auto_913184 ) ) ( not ( = ?auto_913181 ?auto_913185 ) ) ( not ( = ?auto_913181 ?auto_913186 ) ) ( not ( = ?auto_913181 ?auto_913191 ) ) ( not ( = ?auto_913182 ?auto_913183 ) ) ( not ( = ?auto_913182 ?auto_913184 ) ) ( not ( = ?auto_913182 ?auto_913185 ) ) ( not ( = ?auto_913182 ?auto_913186 ) ) ( not ( = ?auto_913182 ?auto_913191 ) ) ( not ( = ?auto_913183 ?auto_913184 ) ) ( not ( = ?auto_913183 ?auto_913185 ) ) ( not ( = ?auto_913183 ?auto_913186 ) ) ( not ( = ?auto_913183 ?auto_913191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913184 ?auto_913185 ?auto_913186 )
      ( MAKE-5CRATE-VERIFY ?auto_913181 ?auto_913182 ?auto_913183 ?auto_913184 ?auto_913185 ?auto_913186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913232 - SURFACE
      ?auto_913233 - SURFACE
      ?auto_913234 - SURFACE
      ?auto_913235 - SURFACE
      ?auto_913236 - SURFACE
      ?auto_913237 - SURFACE
    )
    :vars
    (
      ?auto_913240 - HOIST
      ?auto_913239 - PLACE
      ?auto_913238 - PLACE
      ?auto_913241 - HOIST
      ?auto_913243 - SURFACE
      ?auto_913242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913240 ?auto_913239 ) ( IS-CRATE ?auto_913237 ) ( not ( = ?auto_913236 ?auto_913237 ) ) ( not ( = ?auto_913235 ?auto_913236 ) ) ( not ( = ?auto_913235 ?auto_913237 ) ) ( not ( = ?auto_913238 ?auto_913239 ) ) ( HOIST-AT ?auto_913241 ?auto_913238 ) ( not ( = ?auto_913240 ?auto_913241 ) ) ( AVAILABLE ?auto_913241 ) ( SURFACE-AT ?auto_913237 ?auto_913238 ) ( ON ?auto_913237 ?auto_913243 ) ( CLEAR ?auto_913237 ) ( not ( = ?auto_913236 ?auto_913243 ) ) ( not ( = ?auto_913237 ?auto_913243 ) ) ( not ( = ?auto_913235 ?auto_913243 ) ) ( TRUCK-AT ?auto_913242 ?auto_913239 ) ( SURFACE-AT ?auto_913235 ?auto_913239 ) ( CLEAR ?auto_913235 ) ( IS-CRATE ?auto_913236 ) ( AVAILABLE ?auto_913240 ) ( IN ?auto_913236 ?auto_913242 ) ( ON ?auto_913233 ?auto_913232 ) ( ON ?auto_913234 ?auto_913233 ) ( ON ?auto_913235 ?auto_913234 ) ( not ( = ?auto_913232 ?auto_913233 ) ) ( not ( = ?auto_913232 ?auto_913234 ) ) ( not ( = ?auto_913232 ?auto_913235 ) ) ( not ( = ?auto_913232 ?auto_913236 ) ) ( not ( = ?auto_913232 ?auto_913237 ) ) ( not ( = ?auto_913232 ?auto_913243 ) ) ( not ( = ?auto_913233 ?auto_913234 ) ) ( not ( = ?auto_913233 ?auto_913235 ) ) ( not ( = ?auto_913233 ?auto_913236 ) ) ( not ( = ?auto_913233 ?auto_913237 ) ) ( not ( = ?auto_913233 ?auto_913243 ) ) ( not ( = ?auto_913234 ?auto_913235 ) ) ( not ( = ?auto_913234 ?auto_913236 ) ) ( not ( = ?auto_913234 ?auto_913237 ) ) ( not ( = ?auto_913234 ?auto_913243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913235 ?auto_913236 ?auto_913237 )
      ( MAKE-5CRATE-VERIFY ?auto_913232 ?auto_913233 ?auto_913234 ?auto_913235 ?auto_913236 ?auto_913237 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914441 - SURFACE
      ?auto_914442 - SURFACE
      ?auto_914443 - SURFACE
      ?auto_914444 - SURFACE
      ?auto_914445 - SURFACE
      ?auto_914446 - SURFACE
      ?auto_914447 - SURFACE
    )
    :vars
    (
      ?auto_914448 - HOIST
      ?auto_914449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_914448 ?auto_914449 ) ( SURFACE-AT ?auto_914446 ?auto_914449 ) ( CLEAR ?auto_914446 ) ( LIFTING ?auto_914448 ?auto_914447 ) ( IS-CRATE ?auto_914447 ) ( not ( = ?auto_914446 ?auto_914447 ) ) ( ON ?auto_914442 ?auto_914441 ) ( ON ?auto_914443 ?auto_914442 ) ( ON ?auto_914444 ?auto_914443 ) ( ON ?auto_914445 ?auto_914444 ) ( ON ?auto_914446 ?auto_914445 ) ( not ( = ?auto_914441 ?auto_914442 ) ) ( not ( = ?auto_914441 ?auto_914443 ) ) ( not ( = ?auto_914441 ?auto_914444 ) ) ( not ( = ?auto_914441 ?auto_914445 ) ) ( not ( = ?auto_914441 ?auto_914446 ) ) ( not ( = ?auto_914441 ?auto_914447 ) ) ( not ( = ?auto_914442 ?auto_914443 ) ) ( not ( = ?auto_914442 ?auto_914444 ) ) ( not ( = ?auto_914442 ?auto_914445 ) ) ( not ( = ?auto_914442 ?auto_914446 ) ) ( not ( = ?auto_914442 ?auto_914447 ) ) ( not ( = ?auto_914443 ?auto_914444 ) ) ( not ( = ?auto_914443 ?auto_914445 ) ) ( not ( = ?auto_914443 ?auto_914446 ) ) ( not ( = ?auto_914443 ?auto_914447 ) ) ( not ( = ?auto_914444 ?auto_914445 ) ) ( not ( = ?auto_914444 ?auto_914446 ) ) ( not ( = ?auto_914444 ?auto_914447 ) ) ( not ( = ?auto_914445 ?auto_914446 ) ) ( not ( = ?auto_914445 ?auto_914447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_914446 ?auto_914447 )
      ( MAKE-6CRATE-VERIFY ?auto_914441 ?auto_914442 ?auto_914443 ?auto_914444 ?auto_914445 ?auto_914446 ?auto_914447 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914485 - SURFACE
      ?auto_914486 - SURFACE
      ?auto_914487 - SURFACE
      ?auto_914488 - SURFACE
      ?auto_914489 - SURFACE
      ?auto_914490 - SURFACE
      ?auto_914491 - SURFACE
    )
    :vars
    (
      ?auto_914494 - HOIST
      ?auto_914493 - PLACE
      ?auto_914492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914494 ?auto_914493 ) ( SURFACE-AT ?auto_914490 ?auto_914493 ) ( CLEAR ?auto_914490 ) ( IS-CRATE ?auto_914491 ) ( not ( = ?auto_914490 ?auto_914491 ) ) ( TRUCK-AT ?auto_914492 ?auto_914493 ) ( AVAILABLE ?auto_914494 ) ( IN ?auto_914491 ?auto_914492 ) ( ON ?auto_914490 ?auto_914489 ) ( not ( = ?auto_914489 ?auto_914490 ) ) ( not ( = ?auto_914489 ?auto_914491 ) ) ( ON ?auto_914486 ?auto_914485 ) ( ON ?auto_914487 ?auto_914486 ) ( ON ?auto_914488 ?auto_914487 ) ( ON ?auto_914489 ?auto_914488 ) ( not ( = ?auto_914485 ?auto_914486 ) ) ( not ( = ?auto_914485 ?auto_914487 ) ) ( not ( = ?auto_914485 ?auto_914488 ) ) ( not ( = ?auto_914485 ?auto_914489 ) ) ( not ( = ?auto_914485 ?auto_914490 ) ) ( not ( = ?auto_914485 ?auto_914491 ) ) ( not ( = ?auto_914486 ?auto_914487 ) ) ( not ( = ?auto_914486 ?auto_914488 ) ) ( not ( = ?auto_914486 ?auto_914489 ) ) ( not ( = ?auto_914486 ?auto_914490 ) ) ( not ( = ?auto_914486 ?auto_914491 ) ) ( not ( = ?auto_914487 ?auto_914488 ) ) ( not ( = ?auto_914487 ?auto_914489 ) ) ( not ( = ?auto_914487 ?auto_914490 ) ) ( not ( = ?auto_914487 ?auto_914491 ) ) ( not ( = ?auto_914488 ?auto_914489 ) ) ( not ( = ?auto_914488 ?auto_914490 ) ) ( not ( = ?auto_914488 ?auto_914491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914489 ?auto_914490 ?auto_914491 )
      ( MAKE-6CRATE-VERIFY ?auto_914485 ?auto_914486 ?auto_914487 ?auto_914488 ?auto_914489 ?auto_914490 ?auto_914491 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914536 - SURFACE
      ?auto_914537 - SURFACE
      ?auto_914538 - SURFACE
      ?auto_914539 - SURFACE
      ?auto_914540 - SURFACE
      ?auto_914541 - SURFACE
      ?auto_914542 - SURFACE
    )
    :vars
    (
      ?auto_914546 - HOIST
      ?auto_914544 - PLACE
      ?auto_914543 - TRUCK
      ?auto_914545 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_914546 ?auto_914544 ) ( SURFACE-AT ?auto_914541 ?auto_914544 ) ( CLEAR ?auto_914541 ) ( IS-CRATE ?auto_914542 ) ( not ( = ?auto_914541 ?auto_914542 ) ) ( AVAILABLE ?auto_914546 ) ( IN ?auto_914542 ?auto_914543 ) ( ON ?auto_914541 ?auto_914540 ) ( not ( = ?auto_914540 ?auto_914541 ) ) ( not ( = ?auto_914540 ?auto_914542 ) ) ( TRUCK-AT ?auto_914543 ?auto_914545 ) ( not ( = ?auto_914545 ?auto_914544 ) ) ( ON ?auto_914537 ?auto_914536 ) ( ON ?auto_914538 ?auto_914537 ) ( ON ?auto_914539 ?auto_914538 ) ( ON ?auto_914540 ?auto_914539 ) ( not ( = ?auto_914536 ?auto_914537 ) ) ( not ( = ?auto_914536 ?auto_914538 ) ) ( not ( = ?auto_914536 ?auto_914539 ) ) ( not ( = ?auto_914536 ?auto_914540 ) ) ( not ( = ?auto_914536 ?auto_914541 ) ) ( not ( = ?auto_914536 ?auto_914542 ) ) ( not ( = ?auto_914537 ?auto_914538 ) ) ( not ( = ?auto_914537 ?auto_914539 ) ) ( not ( = ?auto_914537 ?auto_914540 ) ) ( not ( = ?auto_914537 ?auto_914541 ) ) ( not ( = ?auto_914537 ?auto_914542 ) ) ( not ( = ?auto_914538 ?auto_914539 ) ) ( not ( = ?auto_914538 ?auto_914540 ) ) ( not ( = ?auto_914538 ?auto_914541 ) ) ( not ( = ?auto_914538 ?auto_914542 ) ) ( not ( = ?auto_914539 ?auto_914540 ) ) ( not ( = ?auto_914539 ?auto_914541 ) ) ( not ( = ?auto_914539 ?auto_914542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914540 ?auto_914541 ?auto_914542 )
      ( MAKE-6CRATE-VERIFY ?auto_914536 ?auto_914537 ?auto_914538 ?auto_914539 ?auto_914540 ?auto_914541 ?auto_914542 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914593 - SURFACE
      ?auto_914594 - SURFACE
      ?auto_914595 - SURFACE
      ?auto_914596 - SURFACE
      ?auto_914597 - SURFACE
      ?auto_914598 - SURFACE
      ?auto_914599 - SURFACE
    )
    :vars
    (
      ?auto_914604 - HOIST
      ?auto_914600 - PLACE
      ?auto_914603 - TRUCK
      ?auto_914602 - PLACE
      ?auto_914601 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_914604 ?auto_914600 ) ( SURFACE-AT ?auto_914598 ?auto_914600 ) ( CLEAR ?auto_914598 ) ( IS-CRATE ?auto_914599 ) ( not ( = ?auto_914598 ?auto_914599 ) ) ( AVAILABLE ?auto_914604 ) ( ON ?auto_914598 ?auto_914597 ) ( not ( = ?auto_914597 ?auto_914598 ) ) ( not ( = ?auto_914597 ?auto_914599 ) ) ( TRUCK-AT ?auto_914603 ?auto_914602 ) ( not ( = ?auto_914602 ?auto_914600 ) ) ( HOIST-AT ?auto_914601 ?auto_914602 ) ( LIFTING ?auto_914601 ?auto_914599 ) ( not ( = ?auto_914604 ?auto_914601 ) ) ( ON ?auto_914594 ?auto_914593 ) ( ON ?auto_914595 ?auto_914594 ) ( ON ?auto_914596 ?auto_914595 ) ( ON ?auto_914597 ?auto_914596 ) ( not ( = ?auto_914593 ?auto_914594 ) ) ( not ( = ?auto_914593 ?auto_914595 ) ) ( not ( = ?auto_914593 ?auto_914596 ) ) ( not ( = ?auto_914593 ?auto_914597 ) ) ( not ( = ?auto_914593 ?auto_914598 ) ) ( not ( = ?auto_914593 ?auto_914599 ) ) ( not ( = ?auto_914594 ?auto_914595 ) ) ( not ( = ?auto_914594 ?auto_914596 ) ) ( not ( = ?auto_914594 ?auto_914597 ) ) ( not ( = ?auto_914594 ?auto_914598 ) ) ( not ( = ?auto_914594 ?auto_914599 ) ) ( not ( = ?auto_914595 ?auto_914596 ) ) ( not ( = ?auto_914595 ?auto_914597 ) ) ( not ( = ?auto_914595 ?auto_914598 ) ) ( not ( = ?auto_914595 ?auto_914599 ) ) ( not ( = ?auto_914596 ?auto_914597 ) ) ( not ( = ?auto_914596 ?auto_914598 ) ) ( not ( = ?auto_914596 ?auto_914599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914597 ?auto_914598 ?auto_914599 )
      ( MAKE-6CRATE-VERIFY ?auto_914593 ?auto_914594 ?auto_914595 ?auto_914596 ?auto_914597 ?auto_914598 ?auto_914599 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914656 - SURFACE
      ?auto_914657 - SURFACE
      ?auto_914658 - SURFACE
      ?auto_914659 - SURFACE
      ?auto_914660 - SURFACE
      ?auto_914661 - SURFACE
      ?auto_914662 - SURFACE
    )
    :vars
    (
      ?auto_914664 - HOIST
      ?auto_914663 - PLACE
      ?auto_914668 - TRUCK
      ?auto_914665 - PLACE
      ?auto_914666 - HOIST
      ?auto_914667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_914664 ?auto_914663 ) ( SURFACE-AT ?auto_914661 ?auto_914663 ) ( CLEAR ?auto_914661 ) ( IS-CRATE ?auto_914662 ) ( not ( = ?auto_914661 ?auto_914662 ) ) ( AVAILABLE ?auto_914664 ) ( ON ?auto_914661 ?auto_914660 ) ( not ( = ?auto_914660 ?auto_914661 ) ) ( not ( = ?auto_914660 ?auto_914662 ) ) ( TRUCK-AT ?auto_914668 ?auto_914665 ) ( not ( = ?auto_914665 ?auto_914663 ) ) ( HOIST-AT ?auto_914666 ?auto_914665 ) ( not ( = ?auto_914664 ?auto_914666 ) ) ( AVAILABLE ?auto_914666 ) ( SURFACE-AT ?auto_914662 ?auto_914665 ) ( ON ?auto_914662 ?auto_914667 ) ( CLEAR ?auto_914662 ) ( not ( = ?auto_914661 ?auto_914667 ) ) ( not ( = ?auto_914662 ?auto_914667 ) ) ( not ( = ?auto_914660 ?auto_914667 ) ) ( ON ?auto_914657 ?auto_914656 ) ( ON ?auto_914658 ?auto_914657 ) ( ON ?auto_914659 ?auto_914658 ) ( ON ?auto_914660 ?auto_914659 ) ( not ( = ?auto_914656 ?auto_914657 ) ) ( not ( = ?auto_914656 ?auto_914658 ) ) ( not ( = ?auto_914656 ?auto_914659 ) ) ( not ( = ?auto_914656 ?auto_914660 ) ) ( not ( = ?auto_914656 ?auto_914661 ) ) ( not ( = ?auto_914656 ?auto_914662 ) ) ( not ( = ?auto_914656 ?auto_914667 ) ) ( not ( = ?auto_914657 ?auto_914658 ) ) ( not ( = ?auto_914657 ?auto_914659 ) ) ( not ( = ?auto_914657 ?auto_914660 ) ) ( not ( = ?auto_914657 ?auto_914661 ) ) ( not ( = ?auto_914657 ?auto_914662 ) ) ( not ( = ?auto_914657 ?auto_914667 ) ) ( not ( = ?auto_914658 ?auto_914659 ) ) ( not ( = ?auto_914658 ?auto_914660 ) ) ( not ( = ?auto_914658 ?auto_914661 ) ) ( not ( = ?auto_914658 ?auto_914662 ) ) ( not ( = ?auto_914658 ?auto_914667 ) ) ( not ( = ?auto_914659 ?auto_914660 ) ) ( not ( = ?auto_914659 ?auto_914661 ) ) ( not ( = ?auto_914659 ?auto_914662 ) ) ( not ( = ?auto_914659 ?auto_914667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914660 ?auto_914661 ?auto_914662 )
      ( MAKE-6CRATE-VERIFY ?auto_914656 ?auto_914657 ?auto_914658 ?auto_914659 ?auto_914660 ?auto_914661 ?auto_914662 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914720 - SURFACE
      ?auto_914721 - SURFACE
      ?auto_914722 - SURFACE
      ?auto_914723 - SURFACE
      ?auto_914724 - SURFACE
      ?auto_914725 - SURFACE
      ?auto_914726 - SURFACE
    )
    :vars
    (
      ?auto_914731 - HOIST
      ?auto_914732 - PLACE
      ?auto_914727 - PLACE
      ?auto_914728 - HOIST
      ?auto_914729 - SURFACE
      ?auto_914730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914731 ?auto_914732 ) ( SURFACE-AT ?auto_914725 ?auto_914732 ) ( CLEAR ?auto_914725 ) ( IS-CRATE ?auto_914726 ) ( not ( = ?auto_914725 ?auto_914726 ) ) ( AVAILABLE ?auto_914731 ) ( ON ?auto_914725 ?auto_914724 ) ( not ( = ?auto_914724 ?auto_914725 ) ) ( not ( = ?auto_914724 ?auto_914726 ) ) ( not ( = ?auto_914727 ?auto_914732 ) ) ( HOIST-AT ?auto_914728 ?auto_914727 ) ( not ( = ?auto_914731 ?auto_914728 ) ) ( AVAILABLE ?auto_914728 ) ( SURFACE-AT ?auto_914726 ?auto_914727 ) ( ON ?auto_914726 ?auto_914729 ) ( CLEAR ?auto_914726 ) ( not ( = ?auto_914725 ?auto_914729 ) ) ( not ( = ?auto_914726 ?auto_914729 ) ) ( not ( = ?auto_914724 ?auto_914729 ) ) ( TRUCK-AT ?auto_914730 ?auto_914732 ) ( ON ?auto_914721 ?auto_914720 ) ( ON ?auto_914722 ?auto_914721 ) ( ON ?auto_914723 ?auto_914722 ) ( ON ?auto_914724 ?auto_914723 ) ( not ( = ?auto_914720 ?auto_914721 ) ) ( not ( = ?auto_914720 ?auto_914722 ) ) ( not ( = ?auto_914720 ?auto_914723 ) ) ( not ( = ?auto_914720 ?auto_914724 ) ) ( not ( = ?auto_914720 ?auto_914725 ) ) ( not ( = ?auto_914720 ?auto_914726 ) ) ( not ( = ?auto_914720 ?auto_914729 ) ) ( not ( = ?auto_914721 ?auto_914722 ) ) ( not ( = ?auto_914721 ?auto_914723 ) ) ( not ( = ?auto_914721 ?auto_914724 ) ) ( not ( = ?auto_914721 ?auto_914725 ) ) ( not ( = ?auto_914721 ?auto_914726 ) ) ( not ( = ?auto_914721 ?auto_914729 ) ) ( not ( = ?auto_914722 ?auto_914723 ) ) ( not ( = ?auto_914722 ?auto_914724 ) ) ( not ( = ?auto_914722 ?auto_914725 ) ) ( not ( = ?auto_914722 ?auto_914726 ) ) ( not ( = ?auto_914722 ?auto_914729 ) ) ( not ( = ?auto_914723 ?auto_914724 ) ) ( not ( = ?auto_914723 ?auto_914725 ) ) ( not ( = ?auto_914723 ?auto_914726 ) ) ( not ( = ?auto_914723 ?auto_914729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914724 ?auto_914725 ?auto_914726 )
      ( MAKE-6CRATE-VERIFY ?auto_914720 ?auto_914721 ?auto_914722 ?auto_914723 ?auto_914724 ?auto_914725 ?auto_914726 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914784 - SURFACE
      ?auto_914785 - SURFACE
      ?auto_914786 - SURFACE
      ?auto_914787 - SURFACE
      ?auto_914788 - SURFACE
      ?auto_914789 - SURFACE
      ?auto_914790 - SURFACE
    )
    :vars
    (
      ?auto_914792 - HOIST
      ?auto_914791 - PLACE
      ?auto_914796 - PLACE
      ?auto_914793 - HOIST
      ?auto_914795 - SURFACE
      ?auto_914794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914792 ?auto_914791 ) ( IS-CRATE ?auto_914790 ) ( not ( = ?auto_914789 ?auto_914790 ) ) ( not ( = ?auto_914788 ?auto_914789 ) ) ( not ( = ?auto_914788 ?auto_914790 ) ) ( not ( = ?auto_914796 ?auto_914791 ) ) ( HOIST-AT ?auto_914793 ?auto_914796 ) ( not ( = ?auto_914792 ?auto_914793 ) ) ( AVAILABLE ?auto_914793 ) ( SURFACE-AT ?auto_914790 ?auto_914796 ) ( ON ?auto_914790 ?auto_914795 ) ( CLEAR ?auto_914790 ) ( not ( = ?auto_914789 ?auto_914795 ) ) ( not ( = ?auto_914790 ?auto_914795 ) ) ( not ( = ?auto_914788 ?auto_914795 ) ) ( TRUCK-AT ?auto_914794 ?auto_914791 ) ( SURFACE-AT ?auto_914788 ?auto_914791 ) ( CLEAR ?auto_914788 ) ( LIFTING ?auto_914792 ?auto_914789 ) ( IS-CRATE ?auto_914789 ) ( ON ?auto_914785 ?auto_914784 ) ( ON ?auto_914786 ?auto_914785 ) ( ON ?auto_914787 ?auto_914786 ) ( ON ?auto_914788 ?auto_914787 ) ( not ( = ?auto_914784 ?auto_914785 ) ) ( not ( = ?auto_914784 ?auto_914786 ) ) ( not ( = ?auto_914784 ?auto_914787 ) ) ( not ( = ?auto_914784 ?auto_914788 ) ) ( not ( = ?auto_914784 ?auto_914789 ) ) ( not ( = ?auto_914784 ?auto_914790 ) ) ( not ( = ?auto_914784 ?auto_914795 ) ) ( not ( = ?auto_914785 ?auto_914786 ) ) ( not ( = ?auto_914785 ?auto_914787 ) ) ( not ( = ?auto_914785 ?auto_914788 ) ) ( not ( = ?auto_914785 ?auto_914789 ) ) ( not ( = ?auto_914785 ?auto_914790 ) ) ( not ( = ?auto_914785 ?auto_914795 ) ) ( not ( = ?auto_914786 ?auto_914787 ) ) ( not ( = ?auto_914786 ?auto_914788 ) ) ( not ( = ?auto_914786 ?auto_914789 ) ) ( not ( = ?auto_914786 ?auto_914790 ) ) ( not ( = ?auto_914786 ?auto_914795 ) ) ( not ( = ?auto_914787 ?auto_914788 ) ) ( not ( = ?auto_914787 ?auto_914789 ) ) ( not ( = ?auto_914787 ?auto_914790 ) ) ( not ( = ?auto_914787 ?auto_914795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914788 ?auto_914789 ?auto_914790 )
      ( MAKE-6CRATE-VERIFY ?auto_914784 ?auto_914785 ?auto_914786 ?auto_914787 ?auto_914788 ?auto_914789 ?auto_914790 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914848 - SURFACE
      ?auto_914849 - SURFACE
      ?auto_914850 - SURFACE
      ?auto_914851 - SURFACE
      ?auto_914852 - SURFACE
      ?auto_914853 - SURFACE
      ?auto_914854 - SURFACE
    )
    :vars
    (
      ?auto_914857 - HOIST
      ?auto_914860 - PLACE
      ?auto_914856 - PLACE
      ?auto_914855 - HOIST
      ?auto_914858 - SURFACE
      ?auto_914859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914857 ?auto_914860 ) ( IS-CRATE ?auto_914854 ) ( not ( = ?auto_914853 ?auto_914854 ) ) ( not ( = ?auto_914852 ?auto_914853 ) ) ( not ( = ?auto_914852 ?auto_914854 ) ) ( not ( = ?auto_914856 ?auto_914860 ) ) ( HOIST-AT ?auto_914855 ?auto_914856 ) ( not ( = ?auto_914857 ?auto_914855 ) ) ( AVAILABLE ?auto_914855 ) ( SURFACE-AT ?auto_914854 ?auto_914856 ) ( ON ?auto_914854 ?auto_914858 ) ( CLEAR ?auto_914854 ) ( not ( = ?auto_914853 ?auto_914858 ) ) ( not ( = ?auto_914854 ?auto_914858 ) ) ( not ( = ?auto_914852 ?auto_914858 ) ) ( TRUCK-AT ?auto_914859 ?auto_914860 ) ( SURFACE-AT ?auto_914852 ?auto_914860 ) ( CLEAR ?auto_914852 ) ( IS-CRATE ?auto_914853 ) ( AVAILABLE ?auto_914857 ) ( IN ?auto_914853 ?auto_914859 ) ( ON ?auto_914849 ?auto_914848 ) ( ON ?auto_914850 ?auto_914849 ) ( ON ?auto_914851 ?auto_914850 ) ( ON ?auto_914852 ?auto_914851 ) ( not ( = ?auto_914848 ?auto_914849 ) ) ( not ( = ?auto_914848 ?auto_914850 ) ) ( not ( = ?auto_914848 ?auto_914851 ) ) ( not ( = ?auto_914848 ?auto_914852 ) ) ( not ( = ?auto_914848 ?auto_914853 ) ) ( not ( = ?auto_914848 ?auto_914854 ) ) ( not ( = ?auto_914848 ?auto_914858 ) ) ( not ( = ?auto_914849 ?auto_914850 ) ) ( not ( = ?auto_914849 ?auto_914851 ) ) ( not ( = ?auto_914849 ?auto_914852 ) ) ( not ( = ?auto_914849 ?auto_914853 ) ) ( not ( = ?auto_914849 ?auto_914854 ) ) ( not ( = ?auto_914849 ?auto_914858 ) ) ( not ( = ?auto_914850 ?auto_914851 ) ) ( not ( = ?auto_914850 ?auto_914852 ) ) ( not ( = ?auto_914850 ?auto_914853 ) ) ( not ( = ?auto_914850 ?auto_914854 ) ) ( not ( = ?auto_914850 ?auto_914858 ) ) ( not ( = ?auto_914851 ?auto_914852 ) ) ( not ( = ?auto_914851 ?auto_914853 ) ) ( not ( = ?auto_914851 ?auto_914854 ) ) ( not ( = ?auto_914851 ?auto_914858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914852 ?auto_914853 ?auto_914854 )
      ( MAKE-6CRATE-VERIFY ?auto_914848 ?auto_914849 ?auto_914850 ?auto_914851 ?auto_914852 ?auto_914853 ?auto_914854 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916804 - SURFACE
      ?auto_916805 - SURFACE
      ?auto_916806 - SURFACE
      ?auto_916807 - SURFACE
      ?auto_916808 - SURFACE
      ?auto_916809 - SURFACE
      ?auto_916810 - SURFACE
      ?auto_916811 - SURFACE
    )
    :vars
    (
      ?auto_916812 - HOIST
      ?auto_916813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_916812 ?auto_916813 ) ( SURFACE-AT ?auto_916810 ?auto_916813 ) ( CLEAR ?auto_916810 ) ( LIFTING ?auto_916812 ?auto_916811 ) ( IS-CRATE ?auto_916811 ) ( not ( = ?auto_916810 ?auto_916811 ) ) ( ON ?auto_916805 ?auto_916804 ) ( ON ?auto_916806 ?auto_916805 ) ( ON ?auto_916807 ?auto_916806 ) ( ON ?auto_916808 ?auto_916807 ) ( ON ?auto_916809 ?auto_916808 ) ( ON ?auto_916810 ?auto_916809 ) ( not ( = ?auto_916804 ?auto_916805 ) ) ( not ( = ?auto_916804 ?auto_916806 ) ) ( not ( = ?auto_916804 ?auto_916807 ) ) ( not ( = ?auto_916804 ?auto_916808 ) ) ( not ( = ?auto_916804 ?auto_916809 ) ) ( not ( = ?auto_916804 ?auto_916810 ) ) ( not ( = ?auto_916804 ?auto_916811 ) ) ( not ( = ?auto_916805 ?auto_916806 ) ) ( not ( = ?auto_916805 ?auto_916807 ) ) ( not ( = ?auto_916805 ?auto_916808 ) ) ( not ( = ?auto_916805 ?auto_916809 ) ) ( not ( = ?auto_916805 ?auto_916810 ) ) ( not ( = ?auto_916805 ?auto_916811 ) ) ( not ( = ?auto_916806 ?auto_916807 ) ) ( not ( = ?auto_916806 ?auto_916808 ) ) ( not ( = ?auto_916806 ?auto_916809 ) ) ( not ( = ?auto_916806 ?auto_916810 ) ) ( not ( = ?auto_916806 ?auto_916811 ) ) ( not ( = ?auto_916807 ?auto_916808 ) ) ( not ( = ?auto_916807 ?auto_916809 ) ) ( not ( = ?auto_916807 ?auto_916810 ) ) ( not ( = ?auto_916807 ?auto_916811 ) ) ( not ( = ?auto_916808 ?auto_916809 ) ) ( not ( = ?auto_916808 ?auto_916810 ) ) ( not ( = ?auto_916808 ?auto_916811 ) ) ( not ( = ?auto_916809 ?auto_916810 ) ) ( not ( = ?auto_916809 ?auto_916811 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_916810 ?auto_916811 )
      ( MAKE-7CRATE-VERIFY ?auto_916804 ?auto_916805 ?auto_916806 ?auto_916807 ?auto_916808 ?auto_916809 ?auto_916810 ?auto_916811 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916859 - SURFACE
      ?auto_916860 - SURFACE
      ?auto_916861 - SURFACE
      ?auto_916862 - SURFACE
      ?auto_916863 - SURFACE
      ?auto_916864 - SURFACE
      ?auto_916865 - SURFACE
      ?auto_916866 - SURFACE
    )
    :vars
    (
      ?auto_916869 - HOIST
      ?auto_916867 - PLACE
      ?auto_916868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_916869 ?auto_916867 ) ( SURFACE-AT ?auto_916865 ?auto_916867 ) ( CLEAR ?auto_916865 ) ( IS-CRATE ?auto_916866 ) ( not ( = ?auto_916865 ?auto_916866 ) ) ( TRUCK-AT ?auto_916868 ?auto_916867 ) ( AVAILABLE ?auto_916869 ) ( IN ?auto_916866 ?auto_916868 ) ( ON ?auto_916865 ?auto_916864 ) ( not ( = ?auto_916864 ?auto_916865 ) ) ( not ( = ?auto_916864 ?auto_916866 ) ) ( ON ?auto_916860 ?auto_916859 ) ( ON ?auto_916861 ?auto_916860 ) ( ON ?auto_916862 ?auto_916861 ) ( ON ?auto_916863 ?auto_916862 ) ( ON ?auto_916864 ?auto_916863 ) ( not ( = ?auto_916859 ?auto_916860 ) ) ( not ( = ?auto_916859 ?auto_916861 ) ) ( not ( = ?auto_916859 ?auto_916862 ) ) ( not ( = ?auto_916859 ?auto_916863 ) ) ( not ( = ?auto_916859 ?auto_916864 ) ) ( not ( = ?auto_916859 ?auto_916865 ) ) ( not ( = ?auto_916859 ?auto_916866 ) ) ( not ( = ?auto_916860 ?auto_916861 ) ) ( not ( = ?auto_916860 ?auto_916862 ) ) ( not ( = ?auto_916860 ?auto_916863 ) ) ( not ( = ?auto_916860 ?auto_916864 ) ) ( not ( = ?auto_916860 ?auto_916865 ) ) ( not ( = ?auto_916860 ?auto_916866 ) ) ( not ( = ?auto_916861 ?auto_916862 ) ) ( not ( = ?auto_916861 ?auto_916863 ) ) ( not ( = ?auto_916861 ?auto_916864 ) ) ( not ( = ?auto_916861 ?auto_916865 ) ) ( not ( = ?auto_916861 ?auto_916866 ) ) ( not ( = ?auto_916862 ?auto_916863 ) ) ( not ( = ?auto_916862 ?auto_916864 ) ) ( not ( = ?auto_916862 ?auto_916865 ) ) ( not ( = ?auto_916862 ?auto_916866 ) ) ( not ( = ?auto_916863 ?auto_916864 ) ) ( not ( = ?auto_916863 ?auto_916865 ) ) ( not ( = ?auto_916863 ?auto_916866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916864 ?auto_916865 ?auto_916866 )
      ( MAKE-7CRATE-VERIFY ?auto_916859 ?auto_916860 ?auto_916861 ?auto_916862 ?auto_916863 ?auto_916864 ?auto_916865 ?auto_916866 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916922 - SURFACE
      ?auto_916923 - SURFACE
      ?auto_916924 - SURFACE
      ?auto_916925 - SURFACE
      ?auto_916926 - SURFACE
      ?auto_916927 - SURFACE
      ?auto_916928 - SURFACE
      ?auto_916929 - SURFACE
    )
    :vars
    (
      ?auto_916932 - HOIST
      ?auto_916931 - PLACE
      ?auto_916933 - TRUCK
      ?auto_916930 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_916932 ?auto_916931 ) ( SURFACE-AT ?auto_916928 ?auto_916931 ) ( CLEAR ?auto_916928 ) ( IS-CRATE ?auto_916929 ) ( not ( = ?auto_916928 ?auto_916929 ) ) ( AVAILABLE ?auto_916932 ) ( IN ?auto_916929 ?auto_916933 ) ( ON ?auto_916928 ?auto_916927 ) ( not ( = ?auto_916927 ?auto_916928 ) ) ( not ( = ?auto_916927 ?auto_916929 ) ) ( TRUCK-AT ?auto_916933 ?auto_916930 ) ( not ( = ?auto_916930 ?auto_916931 ) ) ( ON ?auto_916923 ?auto_916922 ) ( ON ?auto_916924 ?auto_916923 ) ( ON ?auto_916925 ?auto_916924 ) ( ON ?auto_916926 ?auto_916925 ) ( ON ?auto_916927 ?auto_916926 ) ( not ( = ?auto_916922 ?auto_916923 ) ) ( not ( = ?auto_916922 ?auto_916924 ) ) ( not ( = ?auto_916922 ?auto_916925 ) ) ( not ( = ?auto_916922 ?auto_916926 ) ) ( not ( = ?auto_916922 ?auto_916927 ) ) ( not ( = ?auto_916922 ?auto_916928 ) ) ( not ( = ?auto_916922 ?auto_916929 ) ) ( not ( = ?auto_916923 ?auto_916924 ) ) ( not ( = ?auto_916923 ?auto_916925 ) ) ( not ( = ?auto_916923 ?auto_916926 ) ) ( not ( = ?auto_916923 ?auto_916927 ) ) ( not ( = ?auto_916923 ?auto_916928 ) ) ( not ( = ?auto_916923 ?auto_916929 ) ) ( not ( = ?auto_916924 ?auto_916925 ) ) ( not ( = ?auto_916924 ?auto_916926 ) ) ( not ( = ?auto_916924 ?auto_916927 ) ) ( not ( = ?auto_916924 ?auto_916928 ) ) ( not ( = ?auto_916924 ?auto_916929 ) ) ( not ( = ?auto_916925 ?auto_916926 ) ) ( not ( = ?auto_916925 ?auto_916927 ) ) ( not ( = ?auto_916925 ?auto_916928 ) ) ( not ( = ?auto_916925 ?auto_916929 ) ) ( not ( = ?auto_916926 ?auto_916927 ) ) ( not ( = ?auto_916926 ?auto_916928 ) ) ( not ( = ?auto_916926 ?auto_916929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916927 ?auto_916928 ?auto_916929 )
      ( MAKE-7CRATE-VERIFY ?auto_916922 ?auto_916923 ?auto_916924 ?auto_916925 ?auto_916926 ?auto_916927 ?auto_916928 ?auto_916929 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_916992 - SURFACE
      ?auto_916993 - SURFACE
      ?auto_916994 - SURFACE
      ?auto_916995 - SURFACE
      ?auto_916996 - SURFACE
      ?auto_916997 - SURFACE
      ?auto_916998 - SURFACE
      ?auto_916999 - SURFACE
    )
    :vars
    (
      ?auto_917002 - HOIST
      ?auto_917001 - PLACE
      ?auto_917000 - TRUCK
      ?auto_917004 - PLACE
      ?auto_917003 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_917002 ?auto_917001 ) ( SURFACE-AT ?auto_916998 ?auto_917001 ) ( CLEAR ?auto_916998 ) ( IS-CRATE ?auto_916999 ) ( not ( = ?auto_916998 ?auto_916999 ) ) ( AVAILABLE ?auto_917002 ) ( ON ?auto_916998 ?auto_916997 ) ( not ( = ?auto_916997 ?auto_916998 ) ) ( not ( = ?auto_916997 ?auto_916999 ) ) ( TRUCK-AT ?auto_917000 ?auto_917004 ) ( not ( = ?auto_917004 ?auto_917001 ) ) ( HOIST-AT ?auto_917003 ?auto_917004 ) ( LIFTING ?auto_917003 ?auto_916999 ) ( not ( = ?auto_917002 ?auto_917003 ) ) ( ON ?auto_916993 ?auto_916992 ) ( ON ?auto_916994 ?auto_916993 ) ( ON ?auto_916995 ?auto_916994 ) ( ON ?auto_916996 ?auto_916995 ) ( ON ?auto_916997 ?auto_916996 ) ( not ( = ?auto_916992 ?auto_916993 ) ) ( not ( = ?auto_916992 ?auto_916994 ) ) ( not ( = ?auto_916992 ?auto_916995 ) ) ( not ( = ?auto_916992 ?auto_916996 ) ) ( not ( = ?auto_916992 ?auto_916997 ) ) ( not ( = ?auto_916992 ?auto_916998 ) ) ( not ( = ?auto_916992 ?auto_916999 ) ) ( not ( = ?auto_916993 ?auto_916994 ) ) ( not ( = ?auto_916993 ?auto_916995 ) ) ( not ( = ?auto_916993 ?auto_916996 ) ) ( not ( = ?auto_916993 ?auto_916997 ) ) ( not ( = ?auto_916993 ?auto_916998 ) ) ( not ( = ?auto_916993 ?auto_916999 ) ) ( not ( = ?auto_916994 ?auto_916995 ) ) ( not ( = ?auto_916994 ?auto_916996 ) ) ( not ( = ?auto_916994 ?auto_916997 ) ) ( not ( = ?auto_916994 ?auto_916998 ) ) ( not ( = ?auto_916994 ?auto_916999 ) ) ( not ( = ?auto_916995 ?auto_916996 ) ) ( not ( = ?auto_916995 ?auto_916997 ) ) ( not ( = ?auto_916995 ?auto_916998 ) ) ( not ( = ?auto_916995 ?auto_916999 ) ) ( not ( = ?auto_916996 ?auto_916997 ) ) ( not ( = ?auto_916996 ?auto_916998 ) ) ( not ( = ?auto_916996 ?auto_916999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_916997 ?auto_916998 ?auto_916999 )
      ( MAKE-7CRATE-VERIFY ?auto_916992 ?auto_916993 ?auto_916994 ?auto_916995 ?auto_916996 ?auto_916997 ?auto_916998 ?auto_916999 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917069 - SURFACE
      ?auto_917070 - SURFACE
      ?auto_917071 - SURFACE
      ?auto_917072 - SURFACE
      ?auto_917073 - SURFACE
      ?auto_917074 - SURFACE
      ?auto_917075 - SURFACE
      ?auto_917076 - SURFACE
    )
    :vars
    (
      ?auto_917078 - HOIST
      ?auto_917079 - PLACE
      ?auto_917081 - TRUCK
      ?auto_917077 - PLACE
      ?auto_917080 - HOIST
      ?auto_917082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_917078 ?auto_917079 ) ( SURFACE-AT ?auto_917075 ?auto_917079 ) ( CLEAR ?auto_917075 ) ( IS-CRATE ?auto_917076 ) ( not ( = ?auto_917075 ?auto_917076 ) ) ( AVAILABLE ?auto_917078 ) ( ON ?auto_917075 ?auto_917074 ) ( not ( = ?auto_917074 ?auto_917075 ) ) ( not ( = ?auto_917074 ?auto_917076 ) ) ( TRUCK-AT ?auto_917081 ?auto_917077 ) ( not ( = ?auto_917077 ?auto_917079 ) ) ( HOIST-AT ?auto_917080 ?auto_917077 ) ( not ( = ?auto_917078 ?auto_917080 ) ) ( AVAILABLE ?auto_917080 ) ( SURFACE-AT ?auto_917076 ?auto_917077 ) ( ON ?auto_917076 ?auto_917082 ) ( CLEAR ?auto_917076 ) ( not ( = ?auto_917075 ?auto_917082 ) ) ( not ( = ?auto_917076 ?auto_917082 ) ) ( not ( = ?auto_917074 ?auto_917082 ) ) ( ON ?auto_917070 ?auto_917069 ) ( ON ?auto_917071 ?auto_917070 ) ( ON ?auto_917072 ?auto_917071 ) ( ON ?auto_917073 ?auto_917072 ) ( ON ?auto_917074 ?auto_917073 ) ( not ( = ?auto_917069 ?auto_917070 ) ) ( not ( = ?auto_917069 ?auto_917071 ) ) ( not ( = ?auto_917069 ?auto_917072 ) ) ( not ( = ?auto_917069 ?auto_917073 ) ) ( not ( = ?auto_917069 ?auto_917074 ) ) ( not ( = ?auto_917069 ?auto_917075 ) ) ( not ( = ?auto_917069 ?auto_917076 ) ) ( not ( = ?auto_917069 ?auto_917082 ) ) ( not ( = ?auto_917070 ?auto_917071 ) ) ( not ( = ?auto_917070 ?auto_917072 ) ) ( not ( = ?auto_917070 ?auto_917073 ) ) ( not ( = ?auto_917070 ?auto_917074 ) ) ( not ( = ?auto_917070 ?auto_917075 ) ) ( not ( = ?auto_917070 ?auto_917076 ) ) ( not ( = ?auto_917070 ?auto_917082 ) ) ( not ( = ?auto_917071 ?auto_917072 ) ) ( not ( = ?auto_917071 ?auto_917073 ) ) ( not ( = ?auto_917071 ?auto_917074 ) ) ( not ( = ?auto_917071 ?auto_917075 ) ) ( not ( = ?auto_917071 ?auto_917076 ) ) ( not ( = ?auto_917071 ?auto_917082 ) ) ( not ( = ?auto_917072 ?auto_917073 ) ) ( not ( = ?auto_917072 ?auto_917074 ) ) ( not ( = ?auto_917072 ?auto_917075 ) ) ( not ( = ?auto_917072 ?auto_917076 ) ) ( not ( = ?auto_917072 ?auto_917082 ) ) ( not ( = ?auto_917073 ?auto_917074 ) ) ( not ( = ?auto_917073 ?auto_917075 ) ) ( not ( = ?auto_917073 ?auto_917076 ) ) ( not ( = ?auto_917073 ?auto_917082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917074 ?auto_917075 ?auto_917076 )
      ( MAKE-7CRATE-VERIFY ?auto_917069 ?auto_917070 ?auto_917071 ?auto_917072 ?auto_917073 ?auto_917074 ?auto_917075 ?auto_917076 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917147 - SURFACE
      ?auto_917148 - SURFACE
      ?auto_917149 - SURFACE
      ?auto_917150 - SURFACE
      ?auto_917151 - SURFACE
      ?auto_917152 - SURFACE
      ?auto_917153 - SURFACE
      ?auto_917154 - SURFACE
    )
    :vars
    (
      ?auto_917157 - HOIST
      ?auto_917160 - PLACE
      ?auto_917156 - PLACE
      ?auto_917159 - HOIST
      ?auto_917158 - SURFACE
      ?auto_917155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_917157 ?auto_917160 ) ( SURFACE-AT ?auto_917153 ?auto_917160 ) ( CLEAR ?auto_917153 ) ( IS-CRATE ?auto_917154 ) ( not ( = ?auto_917153 ?auto_917154 ) ) ( AVAILABLE ?auto_917157 ) ( ON ?auto_917153 ?auto_917152 ) ( not ( = ?auto_917152 ?auto_917153 ) ) ( not ( = ?auto_917152 ?auto_917154 ) ) ( not ( = ?auto_917156 ?auto_917160 ) ) ( HOIST-AT ?auto_917159 ?auto_917156 ) ( not ( = ?auto_917157 ?auto_917159 ) ) ( AVAILABLE ?auto_917159 ) ( SURFACE-AT ?auto_917154 ?auto_917156 ) ( ON ?auto_917154 ?auto_917158 ) ( CLEAR ?auto_917154 ) ( not ( = ?auto_917153 ?auto_917158 ) ) ( not ( = ?auto_917154 ?auto_917158 ) ) ( not ( = ?auto_917152 ?auto_917158 ) ) ( TRUCK-AT ?auto_917155 ?auto_917160 ) ( ON ?auto_917148 ?auto_917147 ) ( ON ?auto_917149 ?auto_917148 ) ( ON ?auto_917150 ?auto_917149 ) ( ON ?auto_917151 ?auto_917150 ) ( ON ?auto_917152 ?auto_917151 ) ( not ( = ?auto_917147 ?auto_917148 ) ) ( not ( = ?auto_917147 ?auto_917149 ) ) ( not ( = ?auto_917147 ?auto_917150 ) ) ( not ( = ?auto_917147 ?auto_917151 ) ) ( not ( = ?auto_917147 ?auto_917152 ) ) ( not ( = ?auto_917147 ?auto_917153 ) ) ( not ( = ?auto_917147 ?auto_917154 ) ) ( not ( = ?auto_917147 ?auto_917158 ) ) ( not ( = ?auto_917148 ?auto_917149 ) ) ( not ( = ?auto_917148 ?auto_917150 ) ) ( not ( = ?auto_917148 ?auto_917151 ) ) ( not ( = ?auto_917148 ?auto_917152 ) ) ( not ( = ?auto_917148 ?auto_917153 ) ) ( not ( = ?auto_917148 ?auto_917154 ) ) ( not ( = ?auto_917148 ?auto_917158 ) ) ( not ( = ?auto_917149 ?auto_917150 ) ) ( not ( = ?auto_917149 ?auto_917151 ) ) ( not ( = ?auto_917149 ?auto_917152 ) ) ( not ( = ?auto_917149 ?auto_917153 ) ) ( not ( = ?auto_917149 ?auto_917154 ) ) ( not ( = ?auto_917149 ?auto_917158 ) ) ( not ( = ?auto_917150 ?auto_917151 ) ) ( not ( = ?auto_917150 ?auto_917152 ) ) ( not ( = ?auto_917150 ?auto_917153 ) ) ( not ( = ?auto_917150 ?auto_917154 ) ) ( not ( = ?auto_917150 ?auto_917158 ) ) ( not ( = ?auto_917151 ?auto_917152 ) ) ( not ( = ?auto_917151 ?auto_917153 ) ) ( not ( = ?auto_917151 ?auto_917154 ) ) ( not ( = ?auto_917151 ?auto_917158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917152 ?auto_917153 ?auto_917154 )
      ( MAKE-7CRATE-VERIFY ?auto_917147 ?auto_917148 ?auto_917149 ?auto_917150 ?auto_917151 ?auto_917152 ?auto_917153 ?auto_917154 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917225 - SURFACE
      ?auto_917226 - SURFACE
      ?auto_917227 - SURFACE
      ?auto_917228 - SURFACE
      ?auto_917229 - SURFACE
      ?auto_917230 - SURFACE
      ?auto_917231 - SURFACE
      ?auto_917232 - SURFACE
    )
    :vars
    (
      ?auto_917238 - HOIST
      ?auto_917233 - PLACE
      ?auto_917234 - PLACE
      ?auto_917236 - HOIST
      ?auto_917237 - SURFACE
      ?auto_917235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_917238 ?auto_917233 ) ( IS-CRATE ?auto_917232 ) ( not ( = ?auto_917231 ?auto_917232 ) ) ( not ( = ?auto_917230 ?auto_917231 ) ) ( not ( = ?auto_917230 ?auto_917232 ) ) ( not ( = ?auto_917234 ?auto_917233 ) ) ( HOIST-AT ?auto_917236 ?auto_917234 ) ( not ( = ?auto_917238 ?auto_917236 ) ) ( AVAILABLE ?auto_917236 ) ( SURFACE-AT ?auto_917232 ?auto_917234 ) ( ON ?auto_917232 ?auto_917237 ) ( CLEAR ?auto_917232 ) ( not ( = ?auto_917231 ?auto_917237 ) ) ( not ( = ?auto_917232 ?auto_917237 ) ) ( not ( = ?auto_917230 ?auto_917237 ) ) ( TRUCK-AT ?auto_917235 ?auto_917233 ) ( SURFACE-AT ?auto_917230 ?auto_917233 ) ( CLEAR ?auto_917230 ) ( LIFTING ?auto_917238 ?auto_917231 ) ( IS-CRATE ?auto_917231 ) ( ON ?auto_917226 ?auto_917225 ) ( ON ?auto_917227 ?auto_917226 ) ( ON ?auto_917228 ?auto_917227 ) ( ON ?auto_917229 ?auto_917228 ) ( ON ?auto_917230 ?auto_917229 ) ( not ( = ?auto_917225 ?auto_917226 ) ) ( not ( = ?auto_917225 ?auto_917227 ) ) ( not ( = ?auto_917225 ?auto_917228 ) ) ( not ( = ?auto_917225 ?auto_917229 ) ) ( not ( = ?auto_917225 ?auto_917230 ) ) ( not ( = ?auto_917225 ?auto_917231 ) ) ( not ( = ?auto_917225 ?auto_917232 ) ) ( not ( = ?auto_917225 ?auto_917237 ) ) ( not ( = ?auto_917226 ?auto_917227 ) ) ( not ( = ?auto_917226 ?auto_917228 ) ) ( not ( = ?auto_917226 ?auto_917229 ) ) ( not ( = ?auto_917226 ?auto_917230 ) ) ( not ( = ?auto_917226 ?auto_917231 ) ) ( not ( = ?auto_917226 ?auto_917232 ) ) ( not ( = ?auto_917226 ?auto_917237 ) ) ( not ( = ?auto_917227 ?auto_917228 ) ) ( not ( = ?auto_917227 ?auto_917229 ) ) ( not ( = ?auto_917227 ?auto_917230 ) ) ( not ( = ?auto_917227 ?auto_917231 ) ) ( not ( = ?auto_917227 ?auto_917232 ) ) ( not ( = ?auto_917227 ?auto_917237 ) ) ( not ( = ?auto_917228 ?auto_917229 ) ) ( not ( = ?auto_917228 ?auto_917230 ) ) ( not ( = ?auto_917228 ?auto_917231 ) ) ( not ( = ?auto_917228 ?auto_917232 ) ) ( not ( = ?auto_917228 ?auto_917237 ) ) ( not ( = ?auto_917229 ?auto_917230 ) ) ( not ( = ?auto_917229 ?auto_917231 ) ) ( not ( = ?auto_917229 ?auto_917232 ) ) ( not ( = ?auto_917229 ?auto_917237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917230 ?auto_917231 ?auto_917232 )
      ( MAKE-7CRATE-VERIFY ?auto_917225 ?auto_917226 ?auto_917227 ?auto_917228 ?auto_917229 ?auto_917230 ?auto_917231 ?auto_917232 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917303 - SURFACE
      ?auto_917304 - SURFACE
      ?auto_917305 - SURFACE
      ?auto_917306 - SURFACE
      ?auto_917307 - SURFACE
      ?auto_917308 - SURFACE
      ?auto_917309 - SURFACE
      ?auto_917310 - SURFACE
    )
    :vars
    (
      ?auto_917315 - HOIST
      ?auto_917313 - PLACE
      ?auto_917314 - PLACE
      ?auto_917312 - HOIST
      ?auto_917311 - SURFACE
      ?auto_917316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_917315 ?auto_917313 ) ( IS-CRATE ?auto_917310 ) ( not ( = ?auto_917309 ?auto_917310 ) ) ( not ( = ?auto_917308 ?auto_917309 ) ) ( not ( = ?auto_917308 ?auto_917310 ) ) ( not ( = ?auto_917314 ?auto_917313 ) ) ( HOIST-AT ?auto_917312 ?auto_917314 ) ( not ( = ?auto_917315 ?auto_917312 ) ) ( AVAILABLE ?auto_917312 ) ( SURFACE-AT ?auto_917310 ?auto_917314 ) ( ON ?auto_917310 ?auto_917311 ) ( CLEAR ?auto_917310 ) ( not ( = ?auto_917309 ?auto_917311 ) ) ( not ( = ?auto_917310 ?auto_917311 ) ) ( not ( = ?auto_917308 ?auto_917311 ) ) ( TRUCK-AT ?auto_917316 ?auto_917313 ) ( SURFACE-AT ?auto_917308 ?auto_917313 ) ( CLEAR ?auto_917308 ) ( IS-CRATE ?auto_917309 ) ( AVAILABLE ?auto_917315 ) ( IN ?auto_917309 ?auto_917316 ) ( ON ?auto_917304 ?auto_917303 ) ( ON ?auto_917305 ?auto_917304 ) ( ON ?auto_917306 ?auto_917305 ) ( ON ?auto_917307 ?auto_917306 ) ( ON ?auto_917308 ?auto_917307 ) ( not ( = ?auto_917303 ?auto_917304 ) ) ( not ( = ?auto_917303 ?auto_917305 ) ) ( not ( = ?auto_917303 ?auto_917306 ) ) ( not ( = ?auto_917303 ?auto_917307 ) ) ( not ( = ?auto_917303 ?auto_917308 ) ) ( not ( = ?auto_917303 ?auto_917309 ) ) ( not ( = ?auto_917303 ?auto_917310 ) ) ( not ( = ?auto_917303 ?auto_917311 ) ) ( not ( = ?auto_917304 ?auto_917305 ) ) ( not ( = ?auto_917304 ?auto_917306 ) ) ( not ( = ?auto_917304 ?auto_917307 ) ) ( not ( = ?auto_917304 ?auto_917308 ) ) ( not ( = ?auto_917304 ?auto_917309 ) ) ( not ( = ?auto_917304 ?auto_917310 ) ) ( not ( = ?auto_917304 ?auto_917311 ) ) ( not ( = ?auto_917305 ?auto_917306 ) ) ( not ( = ?auto_917305 ?auto_917307 ) ) ( not ( = ?auto_917305 ?auto_917308 ) ) ( not ( = ?auto_917305 ?auto_917309 ) ) ( not ( = ?auto_917305 ?auto_917310 ) ) ( not ( = ?auto_917305 ?auto_917311 ) ) ( not ( = ?auto_917306 ?auto_917307 ) ) ( not ( = ?auto_917306 ?auto_917308 ) ) ( not ( = ?auto_917306 ?auto_917309 ) ) ( not ( = ?auto_917306 ?auto_917310 ) ) ( not ( = ?auto_917306 ?auto_917311 ) ) ( not ( = ?auto_917307 ?auto_917308 ) ) ( not ( = ?auto_917307 ?auto_917309 ) ) ( not ( = ?auto_917307 ?auto_917310 ) ) ( not ( = ?auto_917307 ?auto_917311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917308 ?auto_917309 ?auto_917310 )
      ( MAKE-7CRATE-VERIFY ?auto_917303 ?auto_917304 ?auto_917305 ?auto_917306 ?auto_917307 ?auto_917308 ?auto_917309 ?auto_917310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_918380 - SURFACE
      ?auto_918381 - SURFACE
    )
    :vars
    (
      ?auto_918384 - HOIST
      ?auto_918388 - PLACE
      ?auto_918386 - SURFACE
      ?auto_918387 - TRUCK
      ?auto_918383 - PLACE
      ?auto_918382 - HOIST
      ?auto_918385 - SURFACE
      ?auto_918389 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_918384 ?auto_918388 ) ( SURFACE-AT ?auto_918380 ?auto_918388 ) ( CLEAR ?auto_918380 ) ( IS-CRATE ?auto_918381 ) ( not ( = ?auto_918380 ?auto_918381 ) ) ( AVAILABLE ?auto_918384 ) ( ON ?auto_918380 ?auto_918386 ) ( not ( = ?auto_918386 ?auto_918380 ) ) ( not ( = ?auto_918386 ?auto_918381 ) ) ( TRUCK-AT ?auto_918387 ?auto_918383 ) ( not ( = ?auto_918383 ?auto_918388 ) ) ( HOIST-AT ?auto_918382 ?auto_918383 ) ( not ( = ?auto_918384 ?auto_918382 ) ) ( SURFACE-AT ?auto_918381 ?auto_918383 ) ( ON ?auto_918381 ?auto_918385 ) ( CLEAR ?auto_918381 ) ( not ( = ?auto_918380 ?auto_918385 ) ) ( not ( = ?auto_918381 ?auto_918385 ) ) ( not ( = ?auto_918386 ?auto_918385 ) ) ( LIFTING ?auto_918382 ?auto_918389 ) ( IS-CRATE ?auto_918389 ) ( not ( = ?auto_918380 ?auto_918389 ) ) ( not ( = ?auto_918381 ?auto_918389 ) ) ( not ( = ?auto_918386 ?auto_918389 ) ) ( not ( = ?auto_918385 ?auto_918389 ) ) )
    :subtasks
    ( ( !LOAD ?auto_918382 ?auto_918389 ?auto_918387 ?auto_918383 )
      ( MAKE-1CRATE ?auto_918380 ?auto_918381 )
      ( MAKE-1CRATE-VERIFY ?auto_918380 ?auto_918381 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920213 - SURFACE
      ?auto_920214 - SURFACE
      ?auto_920215 - SURFACE
      ?auto_920216 - SURFACE
      ?auto_920217 - SURFACE
      ?auto_920218 - SURFACE
      ?auto_920219 - SURFACE
      ?auto_920220 - SURFACE
      ?auto_920221 - SURFACE
    )
    :vars
    (
      ?auto_920222 - HOIST
      ?auto_920223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_920222 ?auto_920223 ) ( SURFACE-AT ?auto_920220 ?auto_920223 ) ( CLEAR ?auto_920220 ) ( LIFTING ?auto_920222 ?auto_920221 ) ( IS-CRATE ?auto_920221 ) ( not ( = ?auto_920220 ?auto_920221 ) ) ( ON ?auto_920214 ?auto_920213 ) ( ON ?auto_920215 ?auto_920214 ) ( ON ?auto_920216 ?auto_920215 ) ( ON ?auto_920217 ?auto_920216 ) ( ON ?auto_920218 ?auto_920217 ) ( ON ?auto_920219 ?auto_920218 ) ( ON ?auto_920220 ?auto_920219 ) ( not ( = ?auto_920213 ?auto_920214 ) ) ( not ( = ?auto_920213 ?auto_920215 ) ) ( not ( = ?auto_920213 ?auto_920216 ) ) ( not ( = ?auto_920213 ?auto_920217 ) ) ( not ( = ?auto_920213 ?auto_920218 ) ) ( not ( = ?auto_920213 ?auto_920219 ) ) ( not ( = ?auto_920213 ?auto_920220 ) ) ( not ( = ?auto_920213 ?auto_920221 ) ) ( not ( = ?auto_920214 ?auto_920215 ) ) ( not ( = ?auto_920214 ?auto_920216 ) ) ( not ( = ?auto_920214 ?auto_920217 ) ) ( not ( = ?auto_920214 ?auto_920218 ) ) ( not ( = ?auto_920214 ?auto_920219 ) ) ( not ( = ?auto_920214 ?auto_920220 ) ) ( not ( = ?auto_920214 ?auto_920221 ) ) ( not ( = ?auto_920215 ?auto_920216 ) ) ( not ( = ?auto_920215 ?auto_920217 ) ) ( not ( = ?auto_920215 ?auto_920218 ) ) ( not ( = ?auto_920215 ?auto_920219 ) ) ( not ( = ?auto_920215 ?auto_920220 ) ) ( not ( = ?auto_920215 ?auto_920221 ) ) ( not ( = ?auto_920216 ?auto_920217 ) ) ( not ( = ?auto_920216 ?auto_920218 ) ) ( not ( = ?auto_920216 ?auto_920219 ) ) ( not ( = ?auto_920216 ?auto_920220 ) ) ( not ( = ?auto_920216 ?auto_920221 ) ) ( not ( = ?auto_920217 ?auto_920218 ) ) ( not ( = ?auto_920217 ?auto_920219 ) ) ( not ( = ?auto_920217 ?auto_920220 ) ) ( not ( = ?auto_920217 ?auto_920221 ) ) ( not ( = ?auto_920218 ?auto_920219 ) ) ( not ( = ?auto_920218 ?auto_920220 ) ) ( not ( = ?auto_920218 ?auto_920221 ) ) ( not ( = ?auto_920219 ?auto_920220 ) ) ( not ( = ?auto_920219 ?auto_920221 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_920220 ?auto_920221 )
      ( MAKE-8CRATE-VERIFY ?auto_920213 ?auto_920214 ?auto_920215 ?auto_920216 ?auto_920217 ?auto_920218 ?auto_920219 ?auto_920220 ?auto_920221 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920280 - SURFACE
      ?auto_920281 - SURFACE
      ?auto_920282 - SURFACE
      ?auto_920283 - SURFACE
      ?auto_920284 - SURFACE
      ?auto_920285 - SURFACE
      ?auto_920286 - SURFACE
      ?auto_920287 - SURFACE
      ?auto_920288 - SURFACE
    )
    :vars
    (
      ?auto_920290 - HOIST
      ?auto_920291 - PLACE
      ?auto_920289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920290 ?auto_920291 ) ( SURFACE-AT ?auto_920287 ?auto_920291 ) ( CLEAR ?auto_920287 ) ( IS-CRATE ?auto_920288 ) ( not ( = ?auto_920287 ?auto_920288 ) ) ( TRUCK-AT ?auto_920289 ?auto_920291 ) ( AVAILABLE ?auto_920290 ) ( IN ?auto_920288 ?auto_920289 ) ( ON ?auto_920287 ?auto_920286 ) ( not ( = ?auto_920286 ?auto_920287 ) ) ( not ( = ?auto_920286 ?auto_920288 ) ) ( ON ?auto_920281 ?auto_920280 ) ( ON ?auto_920282 ?auto_920281 ) ( ON ?auto_920283 ?auto_920282 ) ( ON ?auto_920284 ?auto_920283 ) ( ON ?auto_920285 ?auto_920284 ) ( ON ?auto_920286 ?auto_920285 ) ( not ( = ?auto_920280 ?auto_920281 ) ) ( not ( = ?auto_920280 ?auto_920282 ) ) ( not ( = ?auto_920280 ?auto_920283 ) ) ( not ( = ?auto_920280 ?auto_920284 ) ) ( not ( = ?auto_920280 ?auto_920285 ) ) ( not ( = ?auto_920280 ?auto_920286 ) ) ( not ( = ?auto_920280 ?auto_920287 ) ) ( not ( = ?auto_920280 ?auto_920288 ) ) ( not ( = ?auto_920281 ?auto_920282 ) ) ( not ( = ?auto_920281 ?auto_920283 ) ) ( not ( = ?auto_920281 ?auto_920284 ) ) ( not ( = ?auto_920281 ?auto_920285 ) ) ( not ( = ?auto_920281 ?auto_920286 ) ) ( not ( = ?auto_920281 ?auto_920287 ) ) ( not ( = ?auto_920281 ?auto_920288 ) ) ( not ( = ?auto_920282 ?auto_920283 ) ) ( not ( = ?auto_920282 ?auto_920284 ) ) ( not ( = ?auto_920282 ?auto_920285 ) ) ( not ( = ?auto_920282 ?auto_920286 ) ) ( not ( = ?auto_920282 ?auto_920287 ) ) ( not ( = ?auto_920282 ?auto_920288 ) ) ( not ( = ?auto_920283 ?auto_920284 ) ) ( not ( = ?auto_920283 ?auto_920285 ) ) ( not ( = ?auto_920283 ?auto_920286 ) ) ( not ( = ?auto_920283 ?auto_920287 ) ) ( not ( = ?auto_920283 ?auto_920288 ) ) ( not ( = ?auto_920284 ?auto_920285 ) ) ( not ( = ?auto_920284 ?auto_920286 ) ) ( not ( = ?auto_920284 ?auto_920287 ) ) ( not ( = ?auto_920284 ?auto_920288 ) ) ( not ( = ?auto_920285 ?auto_920286 ) ) ( not ( = ?auto_920285 ?auto_920287 ) ) ( not ( = ?auto_920285 ?auto_920288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920286 ?auto_920287 ?auto_920288 )
      ( MAKE-8CRATE-VERIFY ?auto_920280 ?auto_920281 ?auto_920282 ?auto_920283 ?auto_920284 ?auto_920285 ?auto_920286 ?auto_920287 ?auto_920288 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920356 - SURFACE
      ?auto_920357 - SURFACE
      ?auto_920358 - SURFACE
      ?auto_920359 - SURFACE
      ?auto_920360 - SURFACE
      ?auto_920361 - SURFACE
      ?auto_920362 - SURFACE
      ?auto_920363 - SURFACE
      ?auto_920364 - SURFACE
    )
    :vars
    (
      ?auto_920368 - HOIST
      ?auto_920366 - PLACE
      ?auto_920365 - TRUCK
      ?auto_920367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_920368 ?auto_920366 ) ( SURFACE-AT ?auto_920363 ?auto_920366 ) ( CLEAR ?auto_920363 ) ( IS-CRATE ?auto_920364 ) ( not ( = ?auto_920363 ?auto_920364 ) ) ( AVAILABLE ?auto_920368 ) ( IN ?auto_920364 ?auto_920365 ) ( ON ?auto_920363 ?auto_920362 ) ( not ( = ?auto_920362 ?auto_920363 ) ) ( not ( = ?auto_920362 ?auto_920364 ) ) ( TRUCK-AT ?auto_920365 ?auto_920367 ) ( not ( = ?auto_920367 ?auto_920366 ) ) ( ON ?auto_920357 ?auto_920356 ) ( ON ?auto_920358 ?auto_920357 ) ( ON ?auto_920359 ?auto_920358 ) ( ON ?auto_920360 ?auto_920359 ) ( ON ?auto_920361 ?auto_920360 ) ( ON ?auto_920362 ?auto_920361 ) ( not ( = ?auto_920356 ?auto_920357 ) ) ( not ( = ?auto_920356 ?auto_920358 ) ) ( not ( = ?auto_920356 ?auto_920359 ) ) ( not ( = ?auto_920356 ?auto_920360 ) ) ( not ( = ?auto_920356 ?auto_920361 ) ) ( not ( = ?auto_920356 ?auto_920362 ) ) ( not ( = ?auto_920356 ?auto_920363 ) ) ( not ( = ?auto_920356 ?auto_920364 ) ) ( not ( = ?auto_920357 ?auto_920358 ) ) ( not ( = ?auto_920357 ?auto_920359 ) ) ( not ( = ?auto_920357 ?auto_920360 ) ) ( not ( = ?auto_920357 ?auto_920361 ) ) ( not ( = ?auto_920357 ?auto_920362 ) ) ( not ( = ?auto_920357 ?auto_920363 ) ) ( not ( = ?auto_920357 ?auto_920364 ) ) ( not ( = ?auto_920358 ?auto_920359 ) ) ( not ( = ?auto_920358 ?auto_920360 ) ) ( not ( = ?auto_920358 ?auto_920361 ) ) ( not ( = ?auto_920358 ?auto_920362 ) ) ( not ( = ?auto_920358 ?auto_920363 ) ) ( not ( = ?auto_920358 ?auto_920364 ) ) ( not ( = ?auto_920359 ?auto_920360 ) ) ( not ( = ?auto_920359 ?auto_920361 ) ) ( not ( = ?auto_920359 ?auto_920362 ) ) ( not ( = ?auto_920359 ?auto_920363 ) ) ( not ( = ?auto_920359 ?auto_920364 ) ) ( not ( = ?auto_920360 ?auto_920361 ) ) ( not ( = ?auto_920360 ?auto_920362 ) ) ( not ( = ?auto_920360 ?auto_920363 ) ) ( not ( = ?auto_920360 ?auto_920364 ) ) ( not ( = ?auto_920361 ?auto_920362 ) ) ( not ( = ?auto_920361 ?auto_920363 ) ) ( not ( = ?auto_920361 ?auto_920364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920362 ?auto_920363 ?auto_920364 )
      ( MAKE-8CRATE-VERIFY ?auto_920356 ?auto_920357 ?auto_920358 ?auto_920359 ?auto_920360 ?auto_920361 ?auto_920362 ?auto_920363 ?auto_920364 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920440 - SURFACE
      ?auto_920441 - SURFACE
      ?auto_920442 - SURFACE
      ?auto_920443 - SURFACE
      ?auto_920444 - SURFACE
      ?auto_920445 - SURFACE
      ?auto_920446 - SURFACE
      ?auto_920447 - SURFACE
      ?auto_920448 - SURFACE
    )
    :vars
    (
      ?auto_920453 - HOIST
      ?auto_920450 - PLACE
      ?auto_920452 - TRUCK
      ?auto_920451 - PLACE
      ?auto_920449 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_920453 ?auto_920450 ) ( SURFACE-AT ?auto_920447 ?auto_920450 ) ( CLEAR ?auto_920447 ) ( IS-CRATE ?auto_920448 ) ( not ( = ?auto_920447 ?auto_920448 ) ) ( AVAILABLE ?auto_920453 ) ( ON ?auto_920447 ?auto_920446 ) ( not ( = ?auto_920446 ?auto_920447 ) ) ( not ( = ?auto_920446 ?auto_920448 ) ) ( TRUCK-AT ?auto_920452 ?auto_920451 ) ( not ( = ?auto_920451 ?auto_920450 ) ) ( HOIST-AT ?auto_920449 ?auto_920451 ) ( LIFTING ?auto_920449 ?auto_920448 ) ( not ( = ?auto_920453 ?auto_920449 ) ) ( ON ?auto_920441 ?auto_920440 ) ( ON ?auto_920442 ?auto_920441 ) ( ON ?auto_920443 ?auto_920442 ) ( ON ?auto_920444 ?auto_920443 ) ( ON ?auto_920445 ?auto_920444 ) ( ON ?auto_920446 ?auto_920445 ) ( not ( = ?auto_920440 ?auto_920441 ) ) ( not ( = ?auto_920440 ?auto_920442 ) ) ( not ( = ?auto_920440 ?auto_920443 ) ) ( not ( = ?auto_920440 ?auto_920444 ) ) ( not ( = ?auto_920440 ?auto_920445 ) ) ( not ( = ?auto_920440 ?auto_920446 ) ) ( not ( = ?auto_920440 ?auto_920447 ) ) ( not ( = ?auto_920440 ?auto_920448 ) ) ( not ( = ?auto_920441 ?auto_920442 ) ) ( not ( = ?auto_920441 ?auto_920443 ) ) ( not ( = ?auto_920441 ?auto_920444 ) ) ( not ( = ?auto_920441 ?auto_920445 ) ) ( not ( = ?auto_920441 ?auto_920446 ) ) ( not ( = ?auto_920441 ?auto_920447 ) ) ( not ( = ?auto_920441 ?auto_920448 ) ) ( not ( = ?auto_920442 ?auto_920443 ) ) ( not ( = ?auto_920442 ?auto_920444 ) ) ( not ( = ?auto_920442 ?auto_920445 ) ) ( not ( = ?auto_920442 ?auto_920446 ) ) ( not ( = ?auto_920442 ?auto_920447 ) ) ( not ( = ?auto_920442 ?auto_920448 ) ) ( not ( = ?auto_920443 ?auto_920444 ) ) ( not ( = ?auto_920443 ?auto_920445 ) ) ( not ( = ?auto_920443 ?auto_920446 ) ) ( not ( = ?auto_920443 ?auto_920447 ) ) ( not ( = ?auto_920443 ?auto_920448 ) ) ( not ( = ?auto_920444 ?auto_920445 ) ) ( not ( = ?auto_920444 ?auto_920446 ) ) ( not ( = ?auto_920444 ?auto_920447 ) ) ( not ( = ?auto_920444 ?auto_920448 ) ) ( not ( = ?auto_920445 ?auto_920446 ) ) ( not ( = ?auto_920445 ?auto_920447 ) ) ( not ( = ?auto_920445 ?auto_920448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920446 ?auto_920447 ?auto_920448 )
      ( MAKE-8CRATE-VERIFY ?auto_920440 ?auto_920441 ?auto_920442 ?auto_920443 ?auto_920444 ?auto_920445 ?auto_920446 ?auto_920447 ?auto_920448 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920532 - SURFACE
      ?auto_920533 - SURFACE
      ?auto_920534 - SURFACE
      ?auto_920535 - SURFACE
      ?auto_920536 - SURFACE
      ?auto_920537 - SURFACE
      ?auto_920538 - SURFACE
      ?auto_920539 - SURFACE
      ?auto_920540 - SURFACE
    )
    :vars
    (
      ?auto_920545 - HOIST
      ?auto_920541 - PLACE
      ?auto_920542 - TRUCK
      ?auto_920544 - PLACE
      ?auto_920546 - HOIST
      ?auto_920543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_920545 ?auto_920541 ) ( SURFACE-AT ?auto_920539 ?auto_920541 ) ( CLEAR ?auto_920539 ) ( IS-CRATE ?auto_920540 ) ( not ( = ?auto_920539 ?auto_920540 ) ) ( AVAILABLE ?auto_920545 ) ( ON ?auto_920539 ?auto_920538 ) ( not ( = ?auto_920538 ?auto_920539 ) ) ( not ( = ?auto_920538 ?auto_920540 ) ) ( TRUCK-AT ?auto_920542 ?auto_920544 ) ( not ( = ?auto_920544 ?auto_920541 ) ) ( HOIST-AT ?auto_920546 ?auto_920544 ) ( not ( = ?auto_920545 ?auto_920546 ) ) ( AVAILABLE ?auto_920546 ) ( SURFACE-AT ?auto_920540 ?auto_920544 ) ( ON ?auto_920540 ?auto_920543 ) ( CLEAR ?auto_920540 ) ( not ( = ?auto_920539 ?auto_920543 ) ) ( not ( = ?auto_920540 ?auto_920543 ) ) ( not ( = ?auto_920538 ?auto_920543 ) ) ( ON ?auto_920533 ?auto_920532 ) ( ON ?auto_920534 ?auto_920533 ) ( ON ?auto_920535 ?auto_920534 ) ( ON ?auto_920536 ?auto_920535 ) ( ON ?auto_920537 ?auto_920536 ) ( ON ?auto_920538 ?auto_920537 ) ( not ( = ?auto_920532 ?auto_920533 ) ) ( not ( = ?auto_920532 ?auto_920534 ) ) ( not ( = ?auto_920532 ?auto_920535 ) ) ( not ( = ?auto_920532 ?auto_920536 ) ) ( not ( = ?auto_920532 ?auto_920537 ) ) ( not ( = ?auto_920532 ?auto_920538 ) ) ( not ( = ?auto_920532 ?auto_920539 ) ) ( not ( = ?auto_920532 ?auto_920540 ) ) ( not ( = ?auto_920532 ?auto_920543 ) ) ( not ( = ?auto_920533 ?auto_920534 ) ) ( not ( = ?auto_920533 ?auto_920535 ) ) ( not ( = ?auto_920533 ?auto_920536 ) ) ( not ( = ?auto_920533 ?auto_920537 ) ) ( not ( = ?auto_920533 ?auto_920538 ) ) ( not ( = ?auto_920533 ?auto_920539 ) ) ( not ( = ?auto_920533 ?auto_920540 ) ) ( not ( = ?auto_920533 ?auto_920543 ) ) ( not ( = ?auto_920534 ?auto_920535 ) ) ( not ( = ?auto_920534 ?auto_920536 ) ) ( not ( = ?auto_920534 ?auto_920537 ) ) ( not ( = ?auto_920534 ?auto_920538 ) ) ( not ( = ?auto_920534 ?auto_920539 ) ) ( not ( = ?auto_920534 ?auto_920540 ) ) ( not ( = ?auto_920534 ?auto_920543 ) ) ( not ( = ?auto_920535 ?auto_920536 ) ) ( not ( = ?auto_920535 ?auto_920537 ) ) ( not ( = ?auto_920535 ?auto_920538 ) ) ( not ( = ?auto_920535 ?auto_920539 ) ) ( not ( = ?auto_920535 ?auto_920540 ) ) ( not ( = ?auto_920535 ?auto_920543 ) ) ( not ( = ?auto_920536 ?auto_920537 ) ) ( not ( = ?auto_920536 ?auto_920538 ) ) ( not ( = ?auto_920536 ?auto_920539 ) ) ( not ( = ?auto_920536 ?auto_920540 ) ) ( not ( = ?auto_920536 ?auto_920543 ) ) ( not ( = ?auto_920537 ?auto_920538 ) ) ( not ( = ?auto_920537 ?auto_920539 ) ) ( not ( = ?auto_920537 ?auto_920540 ) ) ( not ( = ?auto_920537 ?auto_920543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920538 ?auto_920539 ?auto_920540 )
      ( MAKE-8CRATE-VERIFY ?auto_920532 ?auto_920533 ?auto_920534 ?auto_920535 ?auto_920536 ?auto_920537 ?auto_920538 ?auto_920539 ?auto_920540 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920625 - SURFACE
      ?auto_920626 - SURFACE
      ?auto_920627 - SURFACE
      ?auto_920628 - SURFACE
      ?auto_920629 - SURFACE
      ?auto_920630 - SURFACE
      ?auto_920631 - SURFACE
      ?auto_920632 - SURFACE
      ?auto_920633 - SURFACE
    )
    :vars
    (
      ?auto_920634 - HOIST
      ?auto_920635 - PLACE
      ?auto_920636 - PLACE
      ?auto_920638 - HOIST
      ?auto_920637 - SURFACE
      ?auto_920639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920634 ?auto_920635 ) ( SURFACE-AT ?auto_920632 ?auto_920635 ) ( CLEAR ?auto_920632 ) ( IS-CRATE ?auto_920633 ) ( not ( = ?auto_920632 ?auto_920633 ) ) ( AVAILABLE ?auto_920634 ) ( ON ?auto_920632 ?auto_920631 ) ( not ( = ?auto_920631 ?auto_920632 ) ) ( not ( = ?auto_920631 ?auto_920633 ) ) ( not ( = ?auto_920636 ?auto_920635 ) ) ( HOIST-AT ?auto_920638 ?auto_920636 ) ( not ( = ?auto_920634 ?auto_920638 ) ) ( AVAILABLE ?auto_920638 ) ( SURFACE-AT ?auto_920633 ?auto_920636 ) ( ON ?auto_920633 ?auto_920637 ) ( CLEAR ?auto_920633 ) ( not ( = ?auto_920632 ?auto_920637 ) ) ( not ( = ?auto_920633 ?auto_920637 ) ) ( not ( = ?auto_920631 ?auto_920637 ) ) ( TRUCK-AT ?auto_920639 ?auto_920635 ) ( ON ?auto_920626 ?auto_920625 ) ( ON ?auto_920627 ?auto_920626 ) ( ON ?auto_920628 ?auto_920627 ) ( ON ?auto_920629 ?auto_920628 ) ( ON ?auto_920630 ?auto_920629 ) ( ON ?auto_920631 ?auto_920630 ) ( not ( = ?auto_920625 ?auto_920626 ) ) ( not ( = ?auto_920625 ?auto_920627 ) ) ( not ( = ?auto_920625 ?auto_920628 ) ) ( not ( = ?auto_920625 ?auto_920629 ) ) ( not ( = ?auto_920625 ?auto_920630 ) ) ( not ( = ?auto_920625 ?auto_920631 ) ) ( not ( = ?auto_920625 ?auto_920632 ) ) ( not ( = ?auto_920625 ?auto_920633 ) ) ( not ( = ?auto_920625 ?auto_920637 ) ) ( not ( = ?auto_920626 ?auto_920627 ) ) ( not ( = ?auto_920626 ?auto_920628 ) ) ( not ( = ?auto_920626 ?auto_920629 ) ) ( not ( = ?auto_920626 ?auto_920630 ) ) ( not ( = ?auto_920626 ?auto_920631 ) ) ( not ( = ?auto_920626 ?auto_920632 ) ) ( not ( = ?auto_920626 ?auto_920633 ) ) ( not ( = ?auto_920626 ?auto_920637 ) ) ( not ( = ?auto_920627 ?auto_920628 ) ) ( not ( = ?auto_920627 ?auto_920629 ) ) ( not ( = ?auto_920627 ?auto_920630 ) ) ( not ( = ?auto_920627 ?auto_920631 ) ) ( not ( = ?auto_920627 ?auto_920632 ) ) ( not ( = ?auto_920627 ?auto_920633 ) ) ( not ( = ?auto_920627 ?auto_920637 ) ) ( not ( = ?auto_920628 ?auto_920629 ) ) ( not ( = ?auto_920628 ?auto_920630 ) ) ( not ( = ?auto_920628 ?auto_920631 ) ) ( not ( = ?auto_920628 ?auto_920632 ) ) ( not ( = ?auto_920628 ?auto_920633 ) ) ( not ( = ?auto_920628 ?auto_920637 ) ) ( not ( = ?auto_920629 ?auto_920630 ) ) ( not ( = ?auto_920629 ?auto_920631 ) ) ( not ( = ?auto_920629 ?auto_920632 ) ) ( not ( = ?auto_920629 ?auto_920633 ) ) ( not ( = ?auto_920629 ?auto_920637 ) ) ( not ( = ?auto_920630 ?auto_920631 ) ) ( not ( = ?auto_920630 ?auto_920632 ) ) ( not ( = ?auto_920630 ?auto_920633 ) ) ( not ( = ?auto_920630 ?auto_920637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920631 ?auto_920632 ?auto_920633 )
      ( MAKE-8CRATE-VERIFY ?auto_920625 ?auto_920626 ?auto_920627 ?auto_920628 ?auto_920629 ?auto_920630 ?auto_920631 ?auto_920632 ?auto_920633 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920718 - SURFACE
      ?auto_920719 - SURFACE
      ?auto_920720 - SURFACE
      ?auto_920721 - SURFACE
      ?auto_920722 - SURFACE
      ?auto_920723 - SURFACE
      ?auto_920724 - SURFACE
      ?auto_920725 - SURFACE
      ?auto_920726 - SURFACE
    )
    :vars
    (
      ?auto_920728 - HOIST
      ?auto_920727 - PLACE
      ?auto_920730 - PLACE
      ?auto_920732 - HOIST
      ?auto_920729 - SURFACE
      ?auto_920731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920728 ?auto_920727 ) ( IS-CRATE ?auto_920726 ) ( not ( = ?auto_920725 ?auto_920726 ) ) ( not ( = ?auto_920724 ?auto_920725 ) ) ( not ( = ?auto_920724 ?auto_920726 ) ) ( not ( = ?auto_920730 ?auto_920727 ) ) ( HOIST-AT ?auto_920732 ?auto_920730 ) ( not ( = ?auto_920728 ?auto_920732 ) ) ( AVAILABLE ?auto_920732 ) ( SURFACE-AT ?auto_920726 ?auto_920730 ) ( ON ?auto_920726 ?auto_920729 ) ( CLEAR ?auto_920726 ) ( not ( = ?auto_920725 ?auto_920729 ) ) ( not ( = ?auto_920726 ?auto_920729 ) ) ( not ( = ?auto_920724 ?auto_920729 ) ) ( TRUCK-AT ?auto_920731 ?auto_920727 ) ( SURFACE-AT ?auto_920724 ?auto_920727 ) ( CLEAR ?auto_920724 ) ( LIFTING ?auto_920728 ?auto_920725 ) ( IS-CRATE ?auto_920725 ) ( ON ?auto_920719 ?auto_920718 ) ( ON ?auto_920720 ?auto_920719 ) ( ON ?auto_920721 ?auto_920720 ) ( ON ?auto_920722 ?auto_920721 ) ( ON ?auto_920723 ?auto_920722 ) ( ON ?auto_920724 ?auto_920723 ) ( not ( = ?auto_920718 ?auto_920719 ) ) ( not ( = ?auto_920718 ?auto_920720 ) ) ( not ( = ?auto_920718 ?auto_920721 ) ) ( not ( = ?auto_920718 ?auto_920722 ) ) ( not ( = ?auto_920718 ?auto_920723 ) ) ( not ( = ?auto_920718 ?auto_920724 ) ) ( not ( = ?auto_920718 ?auto_920725 ) ) ( not ( = ?auto_920718 ?auto_920726 ) ) ( not ( = ?auto_920718 ?auto_920729 ) ) ( not ( = ?auto_920719 ?auto_920720 ) ) ( not ( = ?auto_920719 ?auto_920721 ) ) ( not ( = ?auto_920719 ?auto_920722 ) ) ( not ( = ?auto_920719 ?auto_920723 ) ) ( not ( = ?auto_920719 ?auto_920724 ) ) ( not ( = ?auto_920719 ?auto_920725 ) ) ( not ( = ?auto_920719 ?auto_920726 ) ) ( not ( = ?auto_920719 ?auto_920729 ) ) ( not ( = ?auto_920720 ?auto_920721 ) ) ( not ( = ?auto_920720 ?auto_920722 ) ) ( not ( = ?auto_920720 ?auto_920723 ) ) ( not ( = ?auto_920720 ?auto_920724 ) ) ( not ( = ?auto_920720 ?auto_920725 ) ) ( not ( = ?auto_920720 ?auto_920726 ) ) ( not ( = ?auto_920720 ?auto_920729 ) ) ( not ( = ?auto_920721 ?auto_920722 ) ) ( not ( = ?auto_920721 ?auto_920723 ) ) ( not ( = ?auto_920721 ?auto_920724 ) ) ( not ( = ?auto_920721 ?auto_920725 ) ) ( not ( = ?auto_920721 ?auto_920726 ) ) ( not ( = ?auto_920721 ?auto_920729 ) ) ( not ( = ?auto_920722 ?auto_920723 ) ) ( not ( = ?auto_920722 ?auto_920724 ) ) ( not ( = ?auto_920722 ?auto_920725 ) ) ( not ( = ?auto_920722 ?auto_920726 ) ) ( not ( = ?auto_920722 ?auto_920729 ) ) ( not ( = ?auto_920723 ?auto_920724 ) ) ( not ( = ?auto_920723 ?auto_920725 ) ) ( not ( = ?auto_920723 ?auto_920726 ) ) ( not ( = ?auto_920723 ?auto_920729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920724 ?auto_920725 ?auto_920726 )
      ( MAKE-8CRATE-VERIFY ?auto_920718 ?auto_920719 ?auto_920720 ?auto_920721 ?auto_920722 ?auto_920723 ?auto_920724 ?auto_920725 ?auto_920726 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920811 - SURFACE
      ?auto_920812 - SURFACE
      ?auto_920813 - SURFACE
      ?auto_920814 - SURFACE
      ?auto_920815 - SURFACE
      ?auto_920816 - SURFACE
      ?auto_920817 - SURFACE
      ?auto_920818 - SURFACE
      ?auto_920819 - SURFACE
    )
    :vars
    (
      ?auto_920823 - HOIST
      ?auto_920821 - PLACE
      ?auto_920822 - PLACE
      ?auto_920824 - HOIST
      ?auto_920825 - SURFACE
      ?auto_920820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920823 ?auto_920821 ) ( IS-CRATE ?auto_920819 ) ( not ( = ?auto_920818 ?auto_920819 ) ) ( not ( = ?auto_920817 ?auto_920818 ) ) ( not ( = ?auto_920817 ?auto_920819 ) ) ( not ( = ?auto_920822 ?auto_920821 ) ) ( HOIST-AT ?auto_920824 ?auto_920822 ) ( not ( = ?auto_920823 ?auto_920824 ) ) ( AVAILABLE ?auto_920824 ) ( SURFACE-AT ?auto_920819 ?auto_920822 ) ( ON ?auto_920819 ?auto_920825 ) ( CLEAR ?auto_920819 ) ( not ( = ?auto_920818 ?auto_920825 ) ) ( not ( = ?auto_920819 ?auto_920825 ) ) ( not ( = ?auto_920817 ?auto_920825 ) ) ( TRUCK-AT ?auto_920820 ?auto_920821 ) ( SURFACE-AT ?auto_920817 ?auto_920821 ) ( CLEAR ?auto_920817 ) ( IS-CRATE ?auto_920818 ) ( AVAILABLE ?auto_920823 ) ( IN ?auto_920818 ?auto_920820 ) ( ON ?auto_920812 ?auto_920811 ) ( ON ?auto_920813 ?auto_920812 ) ( ON ?auto_920814 ?auto_920813 ) ( ON ?auto_920815 ?auto_920814 ) ( ON ?auto_920816 ?auto_920815 ) ( ON ?auto_920817 ?auto_920816 ) ( not ( = ?auto_920811 ?auto_920812 ) ) ( not ( = ?auto_920811 ?auto_920813 ) ) ( not ( = ?auto_920811 ?auto_920814 ) ) ( not ( = ?auto_920811 ?auto_920815 ) ) ( not ( = ?auto_920811 ?auto_920816 ) ) ( not ( = ?auto_920811 ?auto_920817 ) ) ( not ( = ?auto_920811 ?auto_920818 ) ) ( not ( = ?auto_920811 ?auto_920819 ) ) ( not ( = ?auto_920811 ?auto_920825 ) ) ( not ( = ?auto_920812 ?auto_920813 ) ) ( not ( = ?auto_920812 ?auto_920814 ) ) ( not ( = ?auto_920812 ?auto_920815 ) ) ( not ( = ?auto_920812 ?auto_920816 ) ) ( not ( = ?auto_920812 ?auto_920817 ) ) ( not ( = ?auto_920812 ?auto_920818 ) ) ( not ( = ?auto_920812 ?auto_920819 ) ) ( not ( = ?auto_920812 ?auto_920825 ) ) ( not ( = ?auto_920813 ?auto_920814 ) ) ( not ( = ?auto_920813 ?auto_920815 ) ) ( not ( = ?auto_920813 ?auto_920816 ) ) ( not ( = ?auto_920813 ?auto_920817 ) ) ( not ( = ?auto_920813 ?auto_920818 ) ) ( not ( = ?auto_920813 ?auto_920819 ) ) ( not ( = ?auto_920813 ?auto_920825 ) ) ( not ( = ?auto_920814 ?auto_920815 ) ) ( not ( = ?auto_920814 ?auto_920816 ) ) ( not ( = ?auto_920814 ?auto_920817 ) ) ( not ( = ?auto_920814 ?auto_920818 ) ) ( not ( = ?auto_920814 ?auto_920819 ) ) ( not ( = ?auto_920814 ?auto_920825 ) ) ( not ( = ?auto_920815 ?auto_920816 ) ) ( not ( = ?auto_920815 ?auto_920817 ) ) ( not ( = ?auto_920815 ?auto_920818 ) ) ( not ( = ?auto_920815 ?auto_920819 ) ) ( not ( = ?auto_920815 ?auto_920825 ) ) ( not ( = ?auto_920816 ?auto_920817 ) ) ( not ( = ?auto_920816 ?auto_920818 ) ) ( not ( = ?auto_920816 ?auto_920819 ) ) ( not ( = ?auto_920816 ?auto_920825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920817 ?auto_920818 ?auto_920819 )
      ( MAKE-8CRATE-VERIFY ?auto_920811 ?auto_920812 ?auto_920813 ?auto_920814 ?auto_920815 ?auto_920816 ?auto_920817 ?auto_920818 ?auto_920819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_922706 - SURFACE
      ?auto_922707 - SURFACE
    )
    :vars
    (
      ?auto_922713 - HOIST
      ?auto_922712 - PLACE
      ?auto_922711 - SURFACE
      ?auto_922708 - PLACE
      ?auto_922709 - HOIST
      ?auto_922714 - SURFACE
      ?auto_922710 - TRUCK
      ?auto_922715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_922713 ?auto_922712 ) ( SURFACE-AT ?auto_922706 ?auto_922712 ) ( CLEAR ?auto_922706 ) ( IS-CRATE ?auto_922707 ) ( not ( = ?auto_922706 ?auto_922707 ) ) ( ON ?auto_922706 ?auto_922711 ) ( not ( = ?auto_922711 ?auto_922706 ) ) ( not ( = ?auto_922711 ?auto_922707 ) ) ( not ( = ?auto_922708 ?auto_922712 ) ) ( HOIST-AT ?auto_922709 ?auto_922708 ) ( not ( = ?auto_922713 ?auto_922709 ) ) ( AVAILABLE ?auto_922709 ) ( SURFACE-AT ?auto_922707 ?auto_922708 ) ( ON ?auto_922707 ?auto_922714 ) ( CLEAR ?auto_922707 ) ( not ( = ?auto_922706 ?auto_922714 ) ) ( not ( = ?auto_922707 ?auto_922714 ) ) ( not ( = ?auto_922711 ?auto_922714 ) ) ( TRUCK-AT ?auto_922710 ?auto_922712 ) ( LIFTING ?auto_922713 ?auto_922715 ) ( IS-CRATE ?auto_922715 ) ( not ( = ?auto_922706 ?auto_922715 ) ) ( not ( = ?auto_922707 ?auto_922715 ) ) ( not ( = ?auto_922711 ?auto_922715 ) ) ( not ( = ?auto_922714 ?auto_922715 ) ) )
    :subtasks
    ( ( !LOAD ?auto_922713 ?auto_922715 ?auto_922710 ?auto_922712 )
      ( MAKE-1CRATE ?auto_922706 ?auto_922707 )
      ( MAKE-1CRATE-VERIFY ?auto_922706 ?auto_922707 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924916 - SURFACE
      ?auto_924917 - SURFACE
      ?auto_924918 - SURFACE
      ?auto_924919 - SURFACE
      ?auto_924920 - SURFACE
      ?auto_924921 - SURFACE
      ?auto_924922 - SURFACE
      ?auto_924923 - SURFACE
      ?auto_924924 - SURFACE
      ?auto_924925 - SURFACE
    )
    :vars
    (
      ?auto_924926 - HOIST
      ?auto_924927 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_924926 ?auto_924927 ) ( SURFACE-AT ?auto_924924 ?auto_924927 ) ( CLEAR ?auto_924924 ) ( LIFTING ?auto_924926 ?auto_924925 ) ( IS-CRATE ?auto_924925 ) ( not ( = ?auto_924924 ?auto_924925 ) ) ( ON ?auto_924917 ?auto_924916 ) ( ON ?auto_924918 ?auto_924917 ) ( ON ?auto_924919 ?auto_924918 ) ( ON ?auto_924920 ?auto_924919 ) ( ON ?auto_924921 ?auto_924920 ) ( ON ?auto_924922 ?auto_924921 ) ( ON ?auto_924923 ?auto_924922 ) ( ON ?auto_924924 ?auto_924923 ) ( not ( = ?auto_924916 ?auto_924917 ) ) ( not ( = ?auto_924916 ?auto_924918 ) ) ( not ( = ?auto_924916 ?auto_924919 ) ) ( not ( = ?auto_924916 ?auto_924920 ) ) ( not ( = ?auto_924916 ?auto_924921 ) ) ( not ( = ?auto_924916 ?auto_924922 ) ) ( not ( = ?auto_924916 ?auto_924923 ) ) ( not ( = ?auto_924916 ?auto_924924 ) ) ( not ( = ?auto_924916 ?auto_924925 ) ) ( not ( = ?auto_924917 ?auto_924918 ) ) ( not ( = ?auto_924917 ?auto_924919 ) ) ( not ( = ?auto_924917 ?auto_924920 ) ) ( not ( = ?auto_924917 ?auto_924921 ) ) ( not ( = ?auto_924917 ?auto_924922 ) ) ( not ( = ?auto_924917 ?auto_924923 ) ) ( not ( = ?auto_924917 ?auto_924924 ) ) ( not ( = ?auto_924917 ?auto_924925 ) ) ( not ( = ?auto_924918 ?auto_924919 ) ) ( not ( = ?auto_924918 ?auto_924920 ) ) ( not ( = ?auto_924918 ?auto_924921 ) ) ( not ( = ?auto_924918 ?auto_924922 ) ) ( not ( = ?auto_924918 ?auto_924923 ) ) ( not ( = ?auto_924918 ?auto_924924 ) ) ( not ( = ?auto_924918 ?auto_924925 ) ) ( not ( = ?auto_924919 ?auto_924920 ) ) ( not ( = ?auto_924919 ?auto_924921 ) ) ( not ( = ?auto_924919 ?auto_924922 ) ) ( not ( = ?auto_924919 ?auto_924923 ) ) ( not ( = ?auto_924919 ?auto_924924 ) ) ( not ( = ?auto_924919 ?auto_924925 ) ) ( not ( = ?auto_924920 ?auto_924921 ) ) ( not ( = ?auto_924920 ?auto_924922 ) ) ( not ( = ?auto_924920 ?auto_924923 ) ) ( not ( = ?auto_924920 ?auto_924924 ) ) ( not ( = ?auto_924920 ?auto_924925 ) ) ( not ( = ?auto_924921 ?auto_924922 ) ) ( not ( = ?auto_924921 ?auto_924923 ) ) ( not ( = ?auto_924921 ?auto_924924 ) ) ( not ( = ?auto_924921 ?auto_924925 ) ) ( not ( = ?auto_924922 ?auto_924923 ) ) ( not ( = ?auto_924922 ?auto_924924 ) ) ( not ( = ?auto_924922 ?auto_924925 ) ) ( not ( = ?auto_924923 ?auto_924924 ) ) ( not ( = ?auto_924923 ?auto_924925 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_924924 ?auto_924925 )
      ( MAKE-9CRATE-VERIFY ?auto_924916 ?auto_924917 ?auto_924918 ?auto_924919 ?auto_924920 ?auto_924921 ?auto_924922 ?auto_924923 ?auto_924924 ?auto_924925 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_924996 - SURFACE
      ?auto_924997 - SURFACE
      ?auto_924998 - SURFACE
      ?auto_924999 - SURFACE
      ?auto_925000 - SURFACE
      ?auto_925001 - SURFACE
      ?auto_925002 - SURFACE
      ?auto_925003 - SURFACE
      ?auto_925004 - SURFACE
      ?auto_925005 - SURFACE
    )
    :vars
    (
      ?auto_925008 - HOIST
      ?auto_925007 - PLACE
      ?auto_925006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925008 ?auto_925007 ) ( SURFACE-AT ?auto_925004 ?auto_925007 ) ( CLEAR ?auto_925004 ) ( IS-CRATE ?auto_925005 ) ( not ( = ?auto_925004 ?auto_925005 ) ) ( TRUCK-AT ?auto_925006 ?auto_925007 ) ( AVAILABLE ?auto_925008 ) ( IN ?auto_925005 ?auto_925006 ) ( ON ?auto_925004 ?auto_925003 ) ( not ( = ?auto_925003 ?auto_925004 ) ) ( not ( = ?auto_925003 ?auto_925005 ) ) ( ON ?auto_924997 ?auto_924996 ) ( ON ?auto_924998 ?auto_924997 ) ( ON ?auto_924999 ?auto_924998 ) ( ON ?auto_925000 ?auto_924999 ) ( ON ?auto_925001 ?auto_925000 ) ( ON ?auto_925002 ?auto_925001 ) ( ON ?auto_925003 ?auto_925002 ) ( not ( = ?auto_924996 ?auto_924997 ) ) ( not ( = ?auto_924996 ?auto_924998 ) ) ( not ( = ?auto_924996 ?auto_924999 ) ) ( not ( = ?auto_924996 ?auto_925000 ) ) ( not ( = ?auto_924996 ?auto_925001 ) ) ( not ( = ?auto_924996 ?auto_925002 ) ) ( not ( = ?auto_924996 ?auto_925003 ) ) ( not ( = ?auto_924996 ?auto_925004 ) ) ( not ( = ?auto_924996 ?auto_925005 ) ) ( not ( = ?auto_924997 ?auto_924998 ) ) ( not ( = ?auto_924997 ?auto_924999 ) ) ( not ( = ?auto_924997 ?auto_925000 ) ) ( not ( = ?auto_924997 ?auto_925001 ) ) ( not ( = ?auto_924997 ?auto_925002 ) ) ( not ( = ?auto_924997 ?auto_925003 ) ) ( not ( = ?auto_924997 ?auto_925004 ) ) ( not ( = ?auto_924997 ?auto_925005 ) ) ( not ( = ?auto_924998 ?auto_924999 ) ) ( not ( = ?auto_924998 ?auto_925000 ) ) ( not ( = ?auto_924998 ?auto_925001 ) ) ( not ( = ?auto_924998 ?auto_925002 ) ) ( not ( = ?auto_924998 ?auto_925003 ) ) ( not ( = ?auto_924998 ?auto_925004 ) ) ( not ( = ?auto_924998 ?auto_925005 ) ) ( not ( = ?auto_924999 ?auto_925000 ) ) ( not ( = ?auto_924999 ?auto_925001 ) ) ( not ( = ?auto_924999 ?auto_925002 ) ) ( not ( = ?auto_924999 ?auto_925003 ) ) ( not ( = ?auto_924999 ?auto_925004 ) ) ( not ( = ?auto_924999 ?auto_925005 ) ) ( not ( = ?auto_925000 ?auto_925001 ) ) ( not ( = ?auto_925000 ?auto_925002 ) ) ( not ( = ?auto_925000 ?auto_925003 ) ) ( not ( = ?auto_925000 ?auto_925004 ) ) ( not ( = ?auto_925000 ?auto_925005 ) ) ( not ( = ?auto_925001 ?auto_925002 ) ) ( not ( = ?auto_925001 ?auto_925003 ) ) ( not ( = ?auto_925001 ?auto_925004 ) ) ( not ( = ?auto_925001 ?auto_925005 ) ) ( not ( = ?auto_925002 ?auto_925003 ) ) ( not ( = ?auto_925002 ?auto_925004 ) ) ( not ( = ?auto_925002 ?auto_925005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925003 ?auto_925004 ?auto_925005 )
      ( MAKE-9CRATE-VERIFY ?auto_924996 ?auto_924997 ?auto_924998 ?auto_924999 ?auto_925000 ?auto_925001 ?auto_925002 ?auto_925003 ?auto_925004 ?auto_925005 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925086 - SURFACE
      ?auto_925087 - SURFACE
      ?auto_925088 - SURFACE
      ?auto_925089 - SURFACE
      ?auto_925090 - SURFACE
      ?auto_925091 - SURFACE
      ?auto_925092 - SURFACE
      ?auto_925093 - SURFACE
      ?auto_925094 - SURFACE
      ?auto_925095 - SURFACE
    )
    :vars
    (
      ?auto_925098 - HOIST
      ?auto_925099 - PLACE
      ?auto_925097 - TRUCK
      ?auto_925096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_925098 ?auto_925099 ) ( SURFACE-AT ?auto_925094 ?auto_925099 ) ( CLEAR ?auto_925094 ) ( IS-CRATE ?auto_925095 ) ( not ( = ?auto_925094 ?auto_925095 ) ) ( AVAILABLE ?auto_925098 ) ( IN ?auto_925095 ?auto_925097 ) ( ON ?auto_925094 ?auto_925093 ) ( not ( = ?auto_925093 ?auto_925094 ) ) ( not ( = ?auto_925093 ?auto_925095 ) ) ( TRUCK-AT ?auto_925097 ?auto_925096 ) ( not ( = ?auto_925096 ?auto_925099 ) ) ( ON ?auto_925087 ?auto_925086 ) ( ON ?auto_925088 ?auto_925087 ) ( ON ?auto_925089 ?auto_925088 ) ( ON ?auto_925090 ?auto_925089 ) ( ON ?auto_925091 ?auto_925090 ) ( ON ?auto_925092 ?auto_925091 ) ( ON ?auto_925093 ?auto_925092 ) ( not ( = ?auto_925086 ?auto_925087 ) ) ( not ( = ?auto_925086 ?auto_925088 ) ) ( not ( = ?auto_925086 ?auto_925089 ) ) ( not ( = ?auto_925086 ?auto_925090 ) ) ( not ( = ?auto_925086 ?auto_925091 ) ) ( not ( = ?auto_925086 ?auto_925092 ) ) ( not ( = ?auto_925086 ?auto_925093 ) ) ( not ( = ?auto_925086 ?auto_925094 ) ) ( not ( = ?auto_925086 ?auto_925095 ) ) ( not ( = ?auto_925087 ?auto_925088 ) ) ( not ( = ?auto_925087 ?auto_925089 ) ) ( not ( = ?auto_925087 ?auto_925090 ) ) ( not ( = ?auto_925087 ?auto_925091 ) ) ( not ( = ?auto_925087 ?auto_925092 ) ) ( not ( = ?auto_925087 ?auto_925093 ) ) ( not ( = ?auto_925087 ?auto_925094 ) ) ( not ( = ?auto_925087 ?auto_925095 ) ) ( not ( = ?auto_925088 ?auto_925089 ) ) ( not ( = ?auto_925088 ?auto_925090 ) ) ( not ( = ?auto_925088 ?auto_925091 ) ) ( not ( = ?auto_925088 ?auto_925092 ) ) ( not ( = ?auto_925088 ?auto_925093 ) ) ( not ( = ?auto_925088 ?auto_925094 ) ) ( not ( = ?auto_925088 ?auto_925095 ) ) ( not ( = ?auto_925089 ?auto_925090 ) ) ( not ( = ?auto_925089 ?auto_925091 ) ) ( not ( = ?auto_925089 ?auto_925092 ) ) ( not ( = ?auto_925089 ?auto_925093 ) ) ( not ( = ?auto_925089 ?auto_925094 ) ) ( not ( = ?auto_925089 ?auto_925095 ) ) ( not ( = ?auto_925090 ?auto_925091 ) ) ( not ( = ?auto_925090 ?auto_925092 ) ) ( not ( = ?auto_925090 ?auto_925093 ) ) ( not ( = ?auto_925090 ?auto_925094 ) ) ( not ( = ?auto_925090 ?auto_925095 ) ) ( not ( = ?auto_925091 ?auto_925092 ) ) ( not ( = ?auto_925091 ?auto_925093 ) ) ( not ( = ?auto_925091 ?auto_925094 ) ) ( not ( = ?auto_925091 ?auto_925095 ) ) ( not ( = ?auto_925092 ?auto_925093 ) ) ( not ( = ?auto_925092 ?auto_925094 ) ) ( not ( = ?auto_925092 ?auto_925095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925093 ?auto_925094 ?auto_925095 )
      ( MAKE-9CRATE-VERIFY ?auto_925086 ?auto_925087 ?auto_925088 ?auto_925089 ?auto_925090 ?auto_925091 ?auto_925092 ?auto_925093 ?auto_925094 ?auto_925095 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925185 - SURFACE
      ?auto_925186 - SURFACE
      ?auto_925187 - SURFACE
      ?auto_925188 - SURFACE
      ?auto_925189 - SURFACE
      ?auto_925190 - SURFACE
      ?auto_925191 - SURFACE
      ?auto_925192 - SURFACE
      ?auto_925193 - SURFACE
      ?auto_925194 - SURFACE
    )
    :vars
    (
      ?auto_925197 - HOIST
      ?auto_925195 - PLACE
      ?auto_925196 - TRUCK
      ?auto_925198 - PLACE
      ?auto_925199 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_925197 ?auto_925195 ) ( SURFACE-AT ?auto_925193 ?auto_925195 ) ( CLEAR ?auto_925193 ) ( IS-CRATE ?auto_925194 ) ( not ( = ?auto_925193 ?auto_925194 ) ) ( AVAILABLE ?auto_925197 ) ( ON ?auto_925193 ?auto_925192 ) ( not ( = ?auto_925192 ?auto_925193 ) ) ( not ( = ?auto_925192 ?auto_925194 ) ) ( TRUCK-AT ?auto_925196 ?auto_925198 ) ( not ( = ?auto_925198 ?auto_925195 ) ) ( HOIST-AT ?auto_925199 ?auto_925198 ) ( LIFTING ?auto_925199 ?auto_925194 ) ( not ( = ?auto_925197 ?auto_925199 ) ) ( ON ?auto_925186 ?auto_925185 ) ( ON ?auto_925187 ?auto_925186 ) ( ON ?auto_925188 ?auto_925187 ) ( ON ?auto_925189 ?auto_925188 ) ( ON ?auto_925190 ?auto_925189 ) ( ON ?auto_925191 ?auto_925190 ) ( ON ?auto_925192 ?auto_925191 ) ( not ( = ?auto_925185 ?auto_925186 ) ) ( not ( = ?auto_925185 ?auto_925187 ) ) ( not ( = ?auto_925185 ?auto_925188 ) ) ( not ( = ?auto_925185 ?auto_925189 ) ) ( not ( = ?auto_925185 ?auto_925190 ) ) ( not ( = ?auto_925185 ?auto_925191 ) ) ( not ( = ?auto_925185 ?auto_925192 ) ) ( not ( = ?auto_925185 ?auto_925193 ) ) ( not ( = ?auto_925185 ?auto_925194 ) ) ( not ( = ?auto_925186 ?auto_925187 ) ) ( not ( = ?auto_925186 ?auto_925188 ) ) ( not ( = ?auto_925186 ?auto_925189 ) ) ( not ( = ?auto_925186 ?auto_925190 ) ) ( not ( = ?auto_925186 ?auto_925191 ) ) ( not ( = ?auto_925186 ?auto_925192 ) ) ( not ( = ?auto_925186 ?auto_925193 ) ) ( not ( = ?auto_925186 ?auto_925194 ) ) ( not ( = ?auto_925187 ?auto_925188 ) ) ( not ( = ?auto_925187 ?auto_925189 ) ) ( not ( = ?auto_925187 ?auto_925190 ) ) ( not ( = ?auto_925187 ?auto_925191 ) ) ( not ( = ?auto_925187 ?auto_925192 ) ) ( not ( = ?auto_925187 ?auto_925193 ) ) ( not ( = ?auto_925187 ?auto_925194 ) ) ( not ( = ?auto_925188 ?auto_925189 ) ) ( not ( = ?auto_925188 ?auto_925190 ) ) ( not ( = ?auto_925188 ?auto_925191 ) ) ( not ( = ?auto_925188 ?auto_925192 ) ) ( not ( = ?auto_925188 ?auto_925193 ) ) ( not ( = ?auto_925188 ?auto_925194 ) ) ( not ( = ?auto_925189 ?auto_925190 ) ) ( not ( = ?auto_925189 ?auto_925191 ) ) ( not ( = ?auto_925189 ?auto_925192 ) ) ( not ( = ?auto_925189 ?auto_925193 ) ) ( not ( = ?auto_925189 ?auto_925194 ) ) ( not ( = ?auto_925190 ?auto_925191 ) ) ( not ( = ?auto_925190 ?auto_925192 ) ) ( not ( = ?auto_925190 ?auto_925193 ) ) ( not ( = ?auto_925190 ?auto_925194 ) ) ( not ( = ?auto_925191 ?auto_925192 ) ) ( not ( = ?auto_925191 ?auto_925193 ) ) ( not ( = ?auto_925191 ?auto_925194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925192 ?auto_925193 ?auto_925194 )
      ( MAKE-9CRATE-VERIFY ?auto_925185 ?auto_925186 ?auto_925187 ?auto_925188 ?auto_925189 ?auto_925190 ?auto_925191 ?auto_925192 ?auto_925193 ?auto_925194 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925293 - SURFACE
      ?auto_925294 - SURFACE
      ?auto_925295 - SURFACE
      ?auto_925296 - SURFACE
      ?auto_925297 - SURFACE
      ?auto_925298 - SURFACE
      ?auto_925299 - SURFACE
      ?auto_925300 - SURFACE
      ?auto_925301 - SURFACE
      ?auto_925302 - SURFACE
    )
    :vars
    (
      ?auto_925304 - HOIST
      ?auto_925303 - PLACE
      ?auto_925308 - TRUCK
      ?auto_925305 - PLACE
      ?auto_925306 - HOIST
      ?auto_925307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_925304 ?auto_925303 ) ( SURFACE-AT ?auto_925301 ?auto_925303 ) ( CLEAR ?auto_925301 ) ( IS-CRATE ?auto_925302 ) ( not ( = ?auto_925301 ?auto_925302 ) ) ( AVAILABLE ?auto_925304 ) ( ON ?auto_925301 ?auto_925300 ) ( not ( = ?auto_925300 ?auto_925301 ) ) ( not ( = ?auto_925300 ?auto_925302 ) ) ( TRUCK-AT ?auto_925308 ?auto_925305 ) ( not ( = ?auto_925305 ?auto_925303 ) ) ( HOIST-AT ?auto_925306 ?auto_925305 ) ( not ( = ?auto_925304 ?auto_925306 ) ) ( AVAILABLE ?auto_925306 ) ( SURFACE-AT ?auto_925302 ?auto_925305 ) ( ON ?auto_925302 ?auto_925307 ) ( CLEAR ?auto_925302 ) ( not ( = ?auto_925301 ?auto_925307 ) ) ( not ( = ?auto_925302 ?auto_925307 ) ) ( not ( = ?auto_925300 ?auto_925307 ) ) ( ON ?auto_925294 ?auto_925293 ) ( ON ?auto_925295 ?auto_925294 ) ( ON ?auto_925296 ?auto_925295 ) ( ON ?auto_925297 ?auto_925296 ) ( ON ?auto_925298 ?auto_925297 ) ( ON ?auto_925299 ?auto_925298 ) ( ON ?auto_925300 ?auto_925299 ) ( not ( = ?auto_925293 ?auto_925294 ) ) ( not ( = ?auto_925293 ?auto_925295 ) ) ( not ( = ?auto_925293 ?auto_925296 ) ) ( not ( = ?auto_925293 ?auto_925297 ) ) ( not ( = ?auto_925293 ?auto_925298 ) ) ( not ( = ?auto_925293 ?auto_925299 ) ) ( not ( = ?auto_925293 ?auto_925300 ) ) ( not ( = ?auto_925293 ?auto_925301 ) ) ( not ( = ?auto_925293 ?auto_925302 ) ) ( not ( = ?auto_925293 ?auto_925307 ) ) ( not ( = ?auto_925294 ?auto_925295 ) ) ( not ( = ?auto_925294 ?auto_925296 ) ) ( not ( = ?auto_925294 ?auto_925297 ) ) ( not ( = ?auto_925294 ?auto_925298 ) ) ( not ( = ?auto_925294 ?auto_925299 ) ) ( not ( = ?auto_925294 ?auto_925300 ) ) ( not ( = ?auto_925294 ?auto_925301 ) ) ( not ( = ?auto_925294 ?auto_925302 ) ) ( not ( = ?auto_925294 ?auto_925307 ) ) ( not ( = ?auto_925295 ?auto_925296 ) ) ( not ( = ?auto_925295 ?auto_925297 ) ) ( not ( = ?auto_925295 ?auto_925298 ) ) ( not ( = ?auto_925295 ?auto_925299 ) ) ( not ( = ?auto_925295 ?auto_925300 ) ) ( not ( = ?auto_925295 ?auto_925301 ) ) ( not ( = ?auto_925295 ?auto_925302 ) ) ( not ( = ?auto_925295 ?auto_925307 ) ) ( not ( = ?auto_925296 ?auto_925297 ) ) ( not ( = ?auto_925296 ?auto_925298 ) ) ( not ( = ?auto_925296 ?auto_925299 ) ) ( not ( = ?auto_925296 ?auto_925300 ) ) ( not ( = ?auto_925296 ?auto_925301 ) ) ( not ( = ?auto_925296 ?auto_925302 ) ) ( not ( = ?auto_925296 ?auto_925307 ) ) ( not ( = ?auto_925297 ?auto_925298 ) ) ( not ( = ?auto_925297 ?auto_925299 ) ) ( not ( = ?auto_925297 ?auto_925300 ) ) ( not ( = ?auto_925297 ?auto_925301 ) ) ( not ( = ?auto_925297 ?auto_925302 ) ) ( not ( = ?auto_925297 ?auto_925307 ) ) ( not ( = ?auto_925298 ?auto_925299 ) ) ( not ( = ?auto_925298 ?auto_925300 ) ) ( not ( = ?auto_925298 ?auto_925301 ) ) ( not ( = ?auto_925298 ?auto_925302 ) ) ( not ( = ?auto_925298 ?auto_925307 ) ) ( not ( = ?auto_925299 ?auto_925300 ) ) ( not ( = ?auto_925299 ?auto_925301 ) ) ( not ( = ?auto_925299 ?auto_925302 ) ) ( not ( = ?auto_925299 ?auto_925307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925300 ?auto_925301 ?auto_925302 )
      ( MAKE-9CRATE-VERIFY ?auto_925293 ?auto_925294 ?auto_925295 ?auto_925296 ?auto_925297 ?auto_925298 ?auto_925299 ?auto_925300 ?auto_925301 ?auto_925302 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925402 - SURFACE
      ?auto_925403 - SURFACE
      ?auto_925404 - SURFACE
      ?auto_925405 - SURFACE
      ?auto_925406 - SURFACE
      ?auto_925407 - SURFACE
      ?auto_925408 - SURFACE
      ?auto_925409 - SURFACE
      ?auto_925410 - SURFACE
      ?auto_925411 - SURFACE
    )
    :vars
    (
      ?auto_925413 - HOIST
      ?auto_925416 - PLACE
      ?auto_925417 - PLACE
      ?auto_925415 - HOIST
      ?auto_925412 - SURFACE
      ?auto_925414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925413 ?auto_925416 ) ( SURFACE-AT ?auto_925410 ?auto_925416 ) ( CLEAR ?auto_925410 ) ( IS-CRATE ?auto_925411 ) ( not ( = ?auto_925410 ?auto_925411 ) ) ( AVAILABLE ?auto_925413 ) ( ON ?auto_925410 ?auto_925409 ) ( not ( = ?auto_925409 ?auto_925410 ) ) ( not ( = ?auto_925409 ?auto_925411 ) ) ( not ( = ?auto_925417 ?auto_925416 ) ) ( HOIST-AT ?auto_925415 ?auto_925417 ) ( not ( = ?auto_925413 ?auto_925415 ) ) ( AVAILABLE ?auto_925415 ) ( SURFACE-AT ?auto_925411 ?auto_925417 ) ( ON ?auto_925411 ?auto_925412 ) ( CLEAR ?auto_925411 ) ( not ( = ?auto_925410 ?auto_925412 ) ) ( not ( = ?auto_925411 ?auto_925412 ) ) ( not ( = ?auto_925409 ?auto_925412 ) ) ( TRUCK-AT ?auto_925414 ?auto_925416 ) ( ON ?auto_925403 ?auto_925402 ) ( ON ?auto_925404 ?auto_925403 ) ( ON ?auto_925405 ?auto_925404 ) ( ON ?auto_925406 ?auto_925405 ) ( ON ?auto_925407 ?auto_925406 ) ( ON ?auto_925408 ?auto_925407 ) ( ON ?auto_925409 ?auto_925408 ) ( not ( = ?auto_925402 ?auto_925403 ) ) ( not ( = ?auto_925402 ?auto_925404 ) ) ( not ( = ?auto_925402 ?auto_925405 ) ) ( not ( = ?auto_925402 ?auto_925406 ) ) ( not ( = ?auto_925402 ?auto_925407 ) ) ( not ( = ?auto_925402 ?auto_925408 ) ) ( not ( = ?auto_925402 ?auto_925409 ) ) ( not ( = ?auto_925402 ?auto_925410 ) ) ( not ( = ?auto_925402 ?auto_925411 ) ) ( not ( = ?auto_925402 ?auto_925412 ) ) ( not ( = ?auto_925403 ?auto_925404 ) ) ( not ( = ?auto_925403 ?auto_925405 ) ) ( not ( = ?auto_925403 ?auto_925406 ) ) ( not ( = ?auto_925403 ?auto_925407 ) ) ( not ( = ?auto_925403 ?auto_925408 ) ) ( not ( = ?auto_925403 ?auto_925409 ) ) ( not ( = ?auto_925403 ?auto_925410 ) ) ( not ( = ?auto_925403 ?auto_925411 ) ) ( not ( = ?auto_925403 ?auto_925412 ) ) ( not ( = ?auto_925404 ?auto_925405 ) ) ( not ( = ?auto_925404 ?auto_925406 ) ) ( not ( = ?auto_925404 ?auto_925407 ) ) ( not ( = ?auto_925404 ?auto_925408 ) ) ( not ( = ?auto_925404 ?auto_925409 ) ) ( not ( = ?auto_925404 ?auto_925410 ) ) ( not ( = ?auto_925404 ?auto_925411 ) ) ( not ( = ?auto_925404 ?auto_925412 ) ) ( not ( = ?auto_925405 ?auto_925406 ) ) ( not ( = ?auto_925405 ?auto_925407 ) ) ( not ( = ?auto_925405 ?auto_925408 ) ) ( not ( = ?auto_925405 ?auto_925409 ) ) ( not ( = ?auto_925405 ?auto_925410 ) ) ( not ( = ?auto_925405 ?auto_925411 ) ) ( not ( = ?auto_925405 ?auto_925412 ) ) ( not ( = ?auto_925406 ?auto_925407 ) ) ( not ( = ?auto_925406 ?auto_925408 ) ) ( not ( = ?auto_925406 ?auto_925409 ) ) ( not ( = ?auto_925406 ?auto_925410 ) ) ( not ( = ?auto_925406 ?auto_925411 ) ) ( not ( = ?auto_925406 ?auto_925412 ) ) ( not ( = ?auto_925407 ?auto_925408 ) ) ( not ( = ?auto_925407 ?auto_925409 ) ) ( not ( = ?auto_925407 ?auto_925410 ) ) ( not ( = ?auto_925407 ?auto_925411 ) ) ( not ( = ?auto_925407 ?auto_925412 ) ) ( not ( = ?auto_925408 ?auto_925409 ) ) ( not ( = ?auto_925408 ?auto_925410 ) ) ( not ( = ?auto_925408 ?auto_925411 ) ) ( not ( = ?auto_925408 ?auto_925412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925409 ?auto_925410 ?auto_925411 )
      ( MAKE-9CRATE-VERIFY ?auto_925402 ?auto_925403 ?auto_925404 ?auto_925405 ?auto_925406 ?auto_925407 ?auto_925408 ?auto_925409 ?auto_925410 ?auto_925411 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925511 - SURFACE
      ?auto_925512 - SURFACE
      ?auto_925513 - SURFACE
      ?auto_925514 - SURFACE
      ?auto_925515 - SURFACE
      ?auto_925516 - SURFACE
      ?auto_925517 - SURFACE
      ?auto_925518 - SURFACE
      ?auto_925519 - SURFACE
      ?auto_925520 - SURFACE
    )
    :vars
    (
      ?auto_925526 - HOIST
      ?auto_925523 - PLACE
      ?auto_925521 - PLACE
      ?auto_925524 - HOIST
      ?auto_925525 - SURFACE
      ?auto_925522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925526 ?auto_925523 ) ( IS-CRATE ?auto_925520 ) ( not ( = ?auto_925519 ?auto_925520 ) ) ( not ( = ?auto_925518 ?auto_925519 ) ) ( not ( = ?auto_925518 ?auto_925520 ) ) ( not ( = ?auto_925521 ?auto_925523 ) ) ( HOIST-AT ?auto_925524 ?auto_925521 ) ( not ( = ?auto_925526 ?auto_925524 ) ) ( AVAILABLE ?auto_925524 ) ( SURFACE-AT ?auto_925520 ?auto_925521 ) ( ON ?auto_925520 ?auto_925525 ) ( CLEAR ?auto_925520 ) ( not ( = ?auto_925519 ?auto_925525 ) ) ( not ( = ?auto_925520 ?auto_925525 ) ) ( not ( = ?auto_925518 ?auto_925525 ) ) ( TRUCK-AT ?auto_925522 ?auto_925523 ) ( SURFACE-AT ?auto_925518 ?auto_925523 ) ( CLEAR ?auto_925518 ) ( LIFTING ?auto_925526 ?auto_925519 ) ( IS-CRATE ?auto_925519 ) ( ON ?auto_925512 ?auto_925511 ) ( ON ?auto_925513 ?auto_925512 ) ( ON ?auto_925514 ?auto_925513 ) ( ON ?auto_925515 ?auto_925514 ) ( ON ?auto_925516 ?auto_925515 ) ( ON ?auto_925517 ?auto_925516 ) ( ON ?auto_925518 ?auto_925517 ) ( not ( = ?auto_925511 ?auto_925512 ) ) ( not ( = ?auto_925511 ?auto_925513 ) ) ( not ( = ?auto_925511 ?auto_925514 ) ) ( not ( = ?auto_925511 ?auto_925515 ) ) ( not ( = ?auto_925511 ?auto_925516 ) ) ( not ( = ?auto_925511 ?auto_925517 ) ) ( not ( = ?auto_925511 ?auto_925518 ) ) ( not ( = ?auto_925511 ?auto_925519 ) ) ( not ( = ?auto_925511 ?auto_925520 ) ) ( not ( = ?auto_925511 ?auto_925525 ) ) ( not ( = ?auto_925512 ?auto_925513 ) ) ( not ( = ?auto_925512 ?auto_925514 ) ) ( not ( = ?auto_925512 ?auto_925515 ) ) ( not ( = ?auto_925512 ?auto_925516 ) ) ( not ( = ?auto_925512 ?auto_925517 ) ) ( not ( = ?auto_925512 ?auto_925518 ) ) ( not ( = ?auto_925512 ?auto_925519 ) ) ( not ( = ?auto_925512 ?auto_925520 ) ) ( not ( = ?auto_925512 ?auto_925525 ) ) ( not ( = ?auto_925513 ?auto_925514 ) ) ( not ( = ?auto_925513 ?auto_925515 ) ) ( not ( = ?auto_925513 ?auto_925516 ) ) ( not ( = ?auto_925513 ?auto_925517 ) ) ( not ( = ?auto_925513 ?auto_925518 ) ) ( not ( = ?auto_925513 ?auto_925519 ) ) ( not ( = ?auto_925513 ?auto_925520 ) ) ( not ( = ?auto_925513 ?auto_925525 ) ) ( not ( = ?auto_925514 ?auto_925515 ) ) ( not ( = ?auto_925514 ?auto_925516 ) ) ( not ( = ?auto_925514 ?auto_925517 ) ) ( not ( = ?auto_925514 ?auto_925518 ) ) ( not ( = ?auto_925514 ?auto_925519 ) ) ( not ( = ?auto_925514 ?auto_925520 ) ) ( not ( = ?auto_925514 ?auto_925525 ) ) ( not ( = ?auto_925515 ?auto_925516 ) ) ( not ( = ?auto_925515 ?auto_925517 ) ) ( not ( = ?auto_925515 ?auto_925518 ) ) ( not ( = ?auto_925515 ?auto_925519 ) ) ( not ( = ?auto_925515 ?auto_925520 ) ) ( not ( = ?auto_925515 ?auto_925525 ) ) ( not ( = ?auto_925516 ?auto_925517 ) ) ( not ( = ?auto_925516 ?auto_925518 ) ) ( not ( = ?auto_925516 ?auto_925519 ) ) ( not ( = ?auto_925516 ?auto_925520 ) ) ( not ( = ?auto_925516 ?auto_925525 ) ) ( not ( = ?auto_925517 ?auto_925518 ) ) ( not ( = ?auto_925517 ?auto_925519 ) ) ( not ( = ?auto_925517 ?auto_925520 ) ) ( not ( = ?auto_925517 ?auto_925525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925518 ?auto_925519 ?auto_925520 )
      ( MAKE-9CRATE-VERIFY ?auto_925511 ?auto_925512 ?auto_925513 ?auto_925514 ?auto_925515 ?auto_925516 ?auto_925517 ?auto_925518 ?auto_925519 ?auto_925520 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925620 - SURFACE
      ?auto_925621 - SURFACE
      ?auto_925622 - SURFACE
      ?auto_925623 - SURFACE
      ?auto_925624 - SURFACE
      ?auto_925625 - SURFACE
      ?auto_925626 - SURFACE
      ?auto_925627 - SURFACE
      ?auto_925628 - SURFACE
      ?auto_925629 - SURFACE
    )
    :vars
    (
      ?auto_925634 - HOIST
      ?auto_925631 - PLACE
      ?auto_925630 - PLACE
      ?auto_925632 - HOIST
      ?auto_925633 - SURFACE
      ?auto_925635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925634 ?auto_925631 ) ( IS-CRATE ?auto_925629 ) ( not ( = ?auto_925628 ?auto_925629 ) ) ( not ( = ?auto_925627 ?auto_925628 ) ) ( not ( = ?auto_925627 ?auto_925629 ) ) ( not ( = ?auto_925630 ?auto_925631 ) ) ( HOIST-AT ?auto_925632 ?auto_925630 ) ( not ( = ?auto_925634 ?auto_925632 ) ) ( AVAILABLE ?auto_925632 ) ( SURFACE-AT ?auto_925629 ?auto_925630 ) ( ON ?auto_925629 ?auto_925633 ) ( CLEAR ?auto_925629 ) ( not ( = ?auto_925628 ?auto_925633 ) ) ( not ( = ?auto_925629 ?auto_925633 ) ) ( not ( = ?auto_925627 ?auto_925633 ) ) ( TRUCK-AT ?auto_925635 ?auto_925631 ) ( SURFACE-AT ?auto_925627 ?auto_925631 ) ( CLEAR ?auto_925627 ) ( IS-CRATE ?auto_925628 ) ( AVAILABLE ?auto_925634 ) ( IN ?auto_925628 ?auto_925635 ) ( ON ?auto_925621 ?auto_925620 ) ( ON ?auto_925622 ?auto_925621 ) ( ON ?auto_925623 ?auto_925622 ) ( ON ?auto_925624 ?auto_925623 ) ( ON ?auto_925625 ?auto_925624 ) ( ON ?auto_925626 ?auto_925625 ) ( ON ?auto_925627 ?auto_925626 ) ( not ( = ?auto_925620 ?auto_925621 ) ) ( not ( = ?auto_925620 ?auto_925622 ) ) ( not ( = ?auto_925620 ?auto_925623 ) ) ( not ( = ?auto_925620 ?auto_925624 ) ) ( not ( = ?auto_925620 ?auto_925625 ) ) ( not ( = ?auto_925620 ?auto_925626 ) ) ( not ( = ?auto_925620 ?auto_925627 ) ) ( not ( = ?auto_925620 ?auto_925628 ) ) ( not ( = ?auto_925620 ?auto_925629 ) ) ( not ( = ?auto_925620 ?auto_925633 ) ) ( not ( = ?auto_925621 ?auto_925622 ) ) ( not ( = ?auto_925621 ?auto_925623 ) ) ( not ( = ?auto_925621 ?auto_925624 ) ) ( not ( = ?auto_925621 ?auto_925625 ) ) ( not ( = ?auto_925621 ?auto_925626 ) ) ( not ( = ?auto_925621 ?auto_925627 ) ) ( not ( = ?auto_925621 ?auto_925628 ) ) ( not ( = ?auto_925621 ?auto_925629 ) ) ( not ( = ?auto_925621 ?auto_925633 ) ) ( not ( = ?auto_925622 ?auto_925623 ) ) ( not ( = ?auto_925622 ?auto_925624 ) ) ( not ( = ?auto_925622 ?auto_925625 ) ) ( not ( = ?auto_925622 ?auto_925626 ) ) ( not ( = ?auto_925622 ?auto_925627 ) ) ( not ( = ?auto_925622 ?auto_925628 ) ) ( not ( = ?auto_925622 ?auto_925629 ) ) ( not ( = ?auto_925622 ?auto_925633 ) ) ( not ( = ?auto_925623 ?auto_925624 ) ) ( not ( = ?auto_925623 ?auto_925625 ) ) ( not ( = ?auto_925623 ?auto_925626 ) ) ( not ( = ?auto_925623 ?auto_925627 ) ) ( not ( = ?auto_925623 ?auto_925628 ) ) ( not ( = ?auto_925623 ?auto_925629 ) ) ( not ( = ?auto_925623 ?auto_925633 ) ) ( not ( = ?auto_925624 ?auto_925625 ) ) ( not ( = ?auto_925624 ?auto_925626 ) ) ( not ( = ?auto_925624 ?auto_925627 ) ) ( not ( = ?auto_925624 ?auto_925628 ) ) ( not ( = ?auto_925624 ?auto_925629 ) ) ( not ( = ?auto_925624 ?auto_925633 ) ) ( not ( = ?auto_925625 ?auto_925626 ) ) ( not ( = ?auto_925625 ?auto_925627 ) ) ( not ( = ?auto_925625 ?auto_925628 ) ) ( not ( = ?auto_925625 ?auto_925629 ) ) ( not ( = ?auto_925625 ?auto_925633 ) ) ( not ( = ?auto_925626 ?auto_925627 ) ) ( not ( = ?auto_925626 ?auto_925628 ) ) ( not ( = ?auto_925626 ?auto_925629 ) ) ( not ( = ?auto_925626 ?auto_925633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925627 ?auto_925628 ?auto_925629 )
      ( MAKE-9CRATE-VERIFY ?auto_925620 ?auto_925621 ?auto_925622 ?auto_925623 ?auto_925624 ?auto_925625 ?auto_925626 ?auto_925627 ?auto_925628 ?auto_925629 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931185 - SURFACE
      ?auto_931186 - SURFACE
      ?auto_931187 - SURFACE
      ?auto_931188 - SURFACE
      ?auto_931189 - SURFACE
      ?auto_931190 - SURFACE
      ?auto_931191 - SURFACE
      ?auto_931192 - SURFACE
      ?auto_931193 - SURFACE
      ?auto_931194 - SURFACE
      ?auto_931195 - SURFACE
    )
    :vars
    (
      ?auto_931197 - HOIST
      ?auto_931196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_931197 ?auto_931196 ) ( SURFACE-AT ?auto_931194 ?auto_931196 ) ( CLEAR ?auto_931194 ) ( LIFTING ?auto_931197 ?auto_931195 ) ( IS-CRATE ?auto_931195 ) ( not ( = ?auto_931194 ?auto_931195 ) ) ( ON ?auto_931186 ?auto_931185 ) ( ON ?auto_931187 ?auto_931186 ) ( ON ?auto_931188 ?auto_931187 ) ( ON ?auto_931189 ?auto_931188 ) ( ON ?auto_931190 ?auto_931189 ) ( ON ?auto_931191 ?auto_931190 ) ( ON ?auto_931192 ?auto_931191 ) ( ON ?auto_931193 ?auto_931192 ) ( ON ?auto_931194 ?auto_931193 ) ( not ( = ?auto_931185 ?auto_931186 ) ) ( not ( = ?auto_931185 ?auto_931187 ) ) ( not ( = ?auto_931185 ?auto_931188 ) ) ( not ( = ?auto_931185 ?auto_931189 ) ) ( not ( = ?auto_931185 ?auto_931190 ) ) ( not ( = ?auto_931185 ?auto_931191 ) ) ( not ( = ?auto_931185 ?auto_931192 ) ) ( not ( = ?auto_931185 ?auto_931193 ) ) ( not ( = ?auto_931185 ?auto_931194 ) ) ( not ( = ?auto_931185 ?auto_931195 ) ) ( not ( = ?auto_931186 ?auto_931187 ) ) ( not ( = ?auto_931186 ?auto_931188 ) ) ( not ( = ?auto_931186 ?auto_931189 ) ) ( not ( = ?auto_931186 ?auto_931190 ) ) ( not ( = ?auto_931186 ?auto_931191 ) ) ( not ( = ?auto_931186 ?auto_931192 ) ) ( not ( = ?auto_931186 ?auto_931193 ) ) ( not ( = ?auto_931186 ?auto_931194 ) ) ( not ( = ?auto_931186 ?auto_931195 ) ) ( not ( = ?auto_931187 ?auto_931188 ) ) ( not ( = ?auto_931187 ?auto_931189 ) ) ( not ( = ?auto_931187 ?auto_931190 ) ) ( not ( = ?auto_931187 ?auto_931191 ) ) ( not ( = ?auto_931187 ?auto_931192 ) ) ( not ( = ?auto_931187 ?auto_931193 ) ) ( not ( = ?auto_931187 ?auto_931194 ) ) ( not ( = ?auto_931187 ?auto_931195 ) ) ( not ( = ?auto_931188 ?auto_931189 ) ) ( not ( = ?auto_931188 ?auto_931190 ) ) ( not ( = ?auto_931188 ?auto_931191 ) ) ( not ( = ?auto_931188 ?auto_931192 ) ) ( not ( = ?auto_931188 ?auto_931193 ) ) ( not ( = ?auto_931188 ?auto_931194 ) ) ( not ( = ?auto_931188 ?auto_931195 ) ) ( not ( = ?auto_931189 ?auto_931190 ) ) ( not ( = ?auto_931189 ?auto_931191 ) ) ( not ( = ?auto_931189 ?auto_931192 ) ) ( not ( = ?auto_931189 ?auto_931193 ) ) ( not ( = ?auto_931189 ?auto_931194 ) ) ( not ( = ?auto_931189 ?auto_931195 ) ) ( not ( = ?auto_931190 ?auto_931191 ) ) ( not ( = ?auto_931190 ?auto_931192 ) ) ( not ( = ?auto_931190 ?auto_931193 ) ) ( not ( = ?auto_931190 ?auto_931194 ) ) ( not ( = ?auto_931190 ?auto_931195 ) ) ( not ( = ?auto_931191 ?auto_931192 ) ) ( not ( = ?auto_931191 ?auto_931193 ) ) ( not ( = ?auto_931191 ?auto_931194 ) ) ( not ( = ?auto_931191 ?auto_931195 ) ) ( not ( = ?auto_931192 ?auto_931193 ) ) ( not ( = ?auto_931192 ?auto_931194 ) ) ( not ( = ?auto_931192 ?auto_931195 ) ) ( not ( = ?auto_931193 ?auto_931194 ) ) ( not ( = ?auto_931193 ?auto_931195 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_931194 ?auto_931195 )
      ( MAKE-10CRATE-VERIFY ?auto_931185 ?auto_931186 ?auto_931187 ?auto_931188 ?auto_931189 ?auto_931190 ?auto_931191 ?auto_931192 ?auto_931193 ?auto_931194 ?auto_931195 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931279 - SURFACE
      ?auto_931280 - SURFACE
      ?auto_931281 - SURFACE
      ?auto_931282 - SURFACE
      ?auto_931283 - SURFACE
      ?auto_931284 - SURFACE
      ?auto_931285 - SURFACE
      ?auto_931286 - SURFACE
      ?auto_931287 - SURFACE
      ?auto_931288 - SURFACE
      ?auto_931289 - SURFACE
    )
    :vars
    (
      ?auto_931292 - HOIST
      ?auto_931290 - PLACE
      ?auto_931291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931292 ?auto_931290 ) ( SURFACE-AT ?auto_931288 ?auto_931290 ) ( CLEAR ?auto_931288 ) ( IS-CRATE ?auto_931289 ) ( not ( = ?auto_931288 ?auto_931289 ) ) ( TRUCK-AT ?auto_931291 ?auto_931290 ) ( AVAILABLE ?auto_931292 ) ( IN ?auto_931289 ?auto_931291 ) ( ON ?auto_931288 ?auto_931287 ) ( not ( = ?auto_931287 ?auto_931288 ) ) ( not ( = ?auto_931287 ?auto_931289 ) ) ( ON ?auto_931280 ?auto_931279 ) ( ON ?auto_931281 ?auto_931280 ) ( ON ?auto_931282 ?auto_931281 ) ( ON ?auto_931283 ?auto_931282 ) ( ON ?auto_931284 ?auto_931283 ) ( ON ?auto_931285 ?auto_931284 ) ( ON ?auto_931286 ?auto_931285 ) ( ON ?auto_931287 ?auto_931286 ) ( not ( = ?auto_931279 ?auto_931280 ) ) ( not ( = ?auto_931279 ?auto_931281 ) ) ( not ( = ?auto_931279 ?auto_931282 ) ) ( not ( = ?auto_931279 ?auto_931283 ) ) ( not ( = ?auto_931279 ?auto_931284 ) ) ( not ( = ?auto_931279 ?auto_931285 ) ) ( not ( = ?auto_931279 ?auto_931286 ) ) ( not ( = ?auto_931279 ?auto_931287 ) ) ( not ( = ?auto_931279 ?auto_931288 ) ) ( not ( = ?auto_931279 ?auto_931289 ) ) ( not ( = ?auto_931280 ?auto_931281 ) ) ( not ( = ?auto_931280 ?auto_931282 ) ) ( not ( = ?auto_931280 ?auto_931283 ) ) ( not ( = ?auto_931280 ?auto_931284 ) ) ( not ( = ?auto_931280 ?auto_931285 ) ) ( not ( = ?auto_931280 ?auto_931286 ) ) ( not ( = ?auto_931280 ?auto_931287 ) ) ( not ( = ?auto_931280 ?auto_931288 ) ) ( not ( = ?auto_931280 ?auto_931289 ) ) ( not ( = ?auto_931281 ?auto_931282 ) ) ( not ( = ?auto_931281 ?auto_931283 ) ) ( not ( = ?auto_931281 ?auto_931284 ) ) ( not ( = ?auto_931281 ?auto_931285 ) ) ( not ( = ?auto_931281 ?auto_931286 ) ) ( not ( = ?auto_931281 ?auto_931287 ) ) ( not ( = ?auto_931281 ?auto_931288 ) ) ( not ( = ?auto_931281 ?auto_931289 ) ) ( not ( = ?auto_931282 ?auto_931283 ) ) ( not ( = ?auto_931282 ?auto_931284 ) ) ( not ( = ?auto_931282 ?auto_931285 ) ) ( not ( = ?auto_931282 ?auto_931286 ) ) ( not ( = ?auto_931282 ?auto_931287 ) ) ( not ( = ?auto_931282 ?auto_931288 ) ) ( not ( = ?auto_931282 ?auto_931289 ) ) ( not ( = ?auto_931283 ?auto_931284 ) ) ( not ( = ?auto_931283 ?auto_931285 ) ) ( not ( = ?auto_931283 ?auto_931286 ) ) ( not ( = ?auto_931283 ?auto_931287 ) ) ( not ( = ?auto_931283 ?auto_931288 ) ) ( not ( = ?auto_931283 ?auto_931289 ) ) ( not ( = ?auto_931284 ?auto_931285 ) ) ( not ( = ?auto_931284 ?auto_931286 ) ) ( not ( = ?auto_931284 ?auto_931287 ) ) ( not ( = ?auto_931284 ?auto_931288 ) ) ( not ( = ?auto_931284 ?auto_931289 ) ) ( not ( = ?auto_931285 ?auto_931286 ) ) ( not ( = ?auto_931285 ?auto_931287 ) ) ( not ( = ?auto_931285 ?auto_931288 ) ) ( not ( = ?auto_931285 ?auto_931289 ) ) ( not ( = ?auto_931286 ?auto_931287 ) ) ( not ( = ?auto_931286 ?auto_931288 ) ) ( not ( = ?auto_931286 ?auto_931289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931287 ?auto_931288 ?auto_931289 )
      ( MAKE-10CRATE-VERIFY ?auto_931279 ?auto_931280 ?auto_931281 ?auto_931282 ?auto_931283 ?auto_931284 ?auto_931285 ?auto_931286 ?auto_931287 ?auto_931288 ?auto_931289 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931384 - SURFACE
      ?auto_931385 - SURFACE
      ?auto_931386 - SURFACE
      ?auto_931387 - SURFACE
      ?auto_931388 - SURFACE
      ?auto_931389 - SURFACE
      ?auto_931390 - SURFACE
      ?auto_931391 - SURFACE
      ?auto_931392 - SURFACE
      ?auto_931393 - SURFACE
      ?auto_931394 - SURFACE
    )
    :vars
    (
      ?auto_931397 - HOIST
      ?auto_931398 - PLACE
      ?auto_931396 - TRUCK
      ?auto_931395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_931397 ?auto_931398 ) ( SURFACE-AT ?auto_931393 ?auto_931398 ) ( CLEAR ?auto_931393 ) ( IS-CRATE ?auto_931394 ) ( not ( = ?auto_931393 ?auto_931394 ) ) ( AVAILABLE ?auto_931397 ) ( IN ?auto_931394 ?auto_931396 ) ( ON ?auto_931393 ?auto_931392 ) ( not ( = ?auto_931392 ?auto_931393 ) ) ( not ( = ?auto_931392 ?auto_931394 ) ) ( TRUCK-AT ?auto_931396 ?auto_931395 ) ( not ( = ?auto_931395 ?auto_931398 ) ) ( ON ?auto_931385 ?auto_931384 ) ( ON ?auto_931386 ?auto_931385 ) ( ON ?auto_931387 ?auto_931386 ) ( ON ?auto_931388 ?auto_931387 ) ( ON ?auto_931389 ?auto_931388 ) ( ON ?auto_931390 ?auto_931389 ) ( ON ?auto_931391 ?auto_931390 ) ( ON ?auto_931392 ?auto_931391 ) ( not ( = ?auto_931384 ?auto_931385 ) ) ( not ( = ?auto_931384 ?auto_931386 ) ) ( not ( = ?auto_931384 ?auto_931387 ) ) ( not ( = ?auto_931384 ?auto_931388 ) ) ( not ( = ?auto_931384 ?auto_931389 ) ) ( not ( = ?auto_931384 ?auto_931390 ) ) ( not ( = ?auto_931384 ?auto_931391 ) ) ( not ( = ?auto_931384 ?auto_931392 ) ) ( not ( = ?auto_931384 ?auto_931393 ) ) ( not ( = ?auto_931384 ?auto_931394 ) ) ( not ( = ?auto_931385 ?auto_931386 ) ) ( not ( = ?auto_931385 ?auto_931387 ) ) ( not ( = ?auto_931385 ?auto_931388 ) ) ( not ( = ?auto_931385 ?auto_931389 ) ) ( not ( = ?auto_931385 ?auto_931390 ) ) ( not ( = ?auto_931385 ?auto_931391 ) ) ( not ( = ?auto_931385 ?auto_931392 ) ) ( not ( = ?auto_931385 ?auto_931393 ) ) ( not ( = ?auto_931385 ?auto_931394 ) ) ( not ( = ?auto_931386 ?auto_931387 ) ) ( not ( = ?auto_931386 ?auto_931388 ) ) ( not ( = ?auto_931386 ?auto_931389 ) ) ( not ( = ?auto_931386 ?auto_931390 ) ) ( not ( = ?auto_931386 ?auto_931391 ) ) ( not ( = ?auto_931386 ?auto_931392 ) ) ( not ( = ?auto_931386 ?auto_931393 ) ) ( not ( = ?auto_931386 ?auto_931394 ) ) ( not ( = ?auto_931387 ?auto_931388 ) ) ( not ( = ?auto_931387 ?auto_931389 ) ) ( not ( = ?auto_931387 ?auto_931390 ) ) ( not ( = ?auto_931387 ?auto_931391 ) ) ( not ( = ?auto_931387 ?auto_931392 ) ) ( not ( = ?auto_931387 ?auto_931393 ) ) ( not ( = ?auto_931387 ?auto_931394 ) ) ( not ( = ?auto_931388 ?auto_931389 ) ) ( not ( = ?auto_931388 ?auto_931390 ) ) ( not ( = ?auto_931388 ?auto_931391 ) ) ( not ( = ?auto_931388 ?auto_931392 ) ) ( not ( = ?auto_931388 ?auto_931393 ) ) ( not ( = ?auto_931388 ?auto_931394 ) ) ( not ( = ?auto_931389 ?auto_931390 ) ) ( not ( = ?auto_931389 ?auto_931391 ) ) ( not ( = ?auto_931389 ?auto_931392 ) ) ( not ( = ?auto_931389 ?auto_931393 ) ) ( not ( = ?auto_931389 ?auto_931394 ) ) ( not ( = ?auto_931390 ?auto_931391 ) ) ( not ( = ?auto_931390 ?auto_931392 ) ) ( not ( = ?auto_931390 ?auto_931393 ) ) ( not ( = ?auto_931390 ?auto_931394 ) ) ( not ( = ?auto_931391 ?auto_931392 ) ) ( not ( = ?auto_931391 ?auto_931393 ) ) ( not ( = ?auto_931391 ?auto_931394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931392 ?auto_931393 ?auto_931394 )
      ( MAKE-10CRATE-VERIFY ?auto_931384 ?auto_931385 ?auto_931386 ?auto_931387 ?auto_931388 ?auto_931389 ?auto_931390 ?auto_931391 ?auto_931392 ?auto_931393 ?auto_931394 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931499 - SURFACE
      ?auto_931500 - SURFACE
      ?auto_931501 - SURFACE
      ?auto_931502 - SURFACE
      ?auto_931503 - SURFACE
      ?auto_931504 - SURFACE
      ?auto_931505 - SURFACE
      ?auto_931506 - SURFACE
      ?auto_931507 - SURFACE
      ?auto_931508 - SURFACE
      ?auto_931509 - SURFACE
    )
    :vars
    (
      ?auto_931512 - HOIST
      ?auto_931513 - PLACE
      ?auto_931510 - TRUCK
      ?auto_931511 - PLACE
      ?auto_931514 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_931512 ?auto_931513 ) ( SURFACE-AT ?auto_931508 ?auto_931513 ) ( CLEAR ?auto_931508 ) ( IS-CRATE ?auto_931509 ) ( not ( = ?auto_931508 ?auto_931509 ) ) ( AVAILABLE ?auto_931512 ) ( ON ?auto_931508 ?auto_931507 ) ( not ( = ?auto_931507 ?auto_931508 ) ) ( not ( = ?auto_931507 ?auto_931509 ) ) ( TRUCK-AT ?auto_931510 ?auto_931511 ) ( not ( = ?auto_931511 ?auto_931513 ) ) ( HOIST-AT ?auto_931514 ?auto_931511 ) ( LIFTING ?auto_931514 ?auto_931509 ) ( not ( = ?auto_931512 ?auto_931514 ) ) ( ON ?auto_931500 ?auto_931499 ) ( ON ?auto_931501 ?auto_931500 ) ( ON ?auto_931502 ?auto_931501 ) ( ON ?auto_931503 ?auto_931502 ) ( ON ?auto_931504 ?auto_931503 ) ( ON ?auto_931505 ?auto_931504 ) ( ON ?auto_931506 ?auto_931505 ) ( ON ?auto_931507 ?auto_931506 ) ( not ( = ?auto_931499 ?auto_931500 ) ) ( not ( = ?auto_931499 ?auto_931501 ) ) ( not ( = ?auto_931499 ?auto_931502 ) ) ( not ( = ?auto_931499 ?auto_931503 ) ) ( not ( = ?auto_931499 ?auto_931504 ) ) ( not ( = ?auto_931499 ?auto_931505 ) ) ( not ( = ?auto_931499 ?auto_931506 ) ) ( not ( = ?auto_931499 ?auto_931507 ) ) ( not ( = ?auto_931499 ?auto_931508 ) ) ( not ( = ?auto_931499 ?auto_931509 ) ) ( not ( = ?auto_931500 ?auto_931501 ) ) ( not ( = ?auto_931500 ?auto_931502 ) ) ( not ( = ?auto_931500 ?auto_931503 ) ) ( not ( = ?auto_931500 ?auto_931504 ) ) ( not ( = ?auto_931500 ?auto_931505 ) ) ( not ( = ?auto_931500 ?auto_931506 ) ) ( not ( = ?auto_931500 ?auto_931507 ) ) ( not ( = ?auto_931500 ?auto_931508 ) ) ( not ( = ?auto_931500 ?auto_931509 ) ) ( not ( = ?auto_931501 ?auto_931502 ) ) ( not ( = ?auto_931501 ?auto_931503 ) ) ( not ( = ?auto_931501 ?auto_931504 ) ) ( not ( = ?auto_931501 ?auto_931505 ) ) ( not ( = ?auto_931501 ?auto_931506 ) ) ( not ( = ?auto_931501 ?auto_931507 ) ) ( not ( = ?auto_931501 ?auto_931508 ) ) ( not ( = ?auto_931501 ?auto_931509 ) ) ( not ( = ?auto_931502 ?auto_931503 ) ) ( not ( = ?auto_931502 ?auto_931504 ) ) ( not ( = ?auto_931502 ?auto_931505 ) ) ( not ( = ?auto_931502 ?auto_931506 ) ) ( not ( = ?auto_931502 ?auto_931507 ) ) ( not ( = ?auto_931502 ?auto_931508 ) ) ( not ( = ?auto_931502 ?auto_931509 ) ) ( not ( = ?auto_931503 ?auto_931504 ) ) ( not ( = ?auto_931503 ?auto_931505 ) ) ( not ( = ?auto_931503 ?auto_931506 ) ) ( not ( = ?auto_931503 ?auto_931507 ) ) ( not ( = ?auto_931503 ?auto_931508 ) ) ( not ( = ?auto_931503 ?auto_931509 ) ) ( not ( = ?auto_931504 ?auto_931505 ) ) ( not ( = ?auto_931504 ?auto_931506 ) ) ( not ( = ?auto_931504 ?auto_931507 ) ) ( not ( = ?auto_931504 ?auto_931508 ) ) ( not ( = ?auto_931504 ?auto_931509 ) ) ( not ( = ?auto_931505 ?auto_931506 ) ) ( not ( = ?auto_931505 ?auto_931507 ) ) ( not ( = ?auto_931505 ?auto_931508 ) ) ( not ( = ?auto_931505 ?auto_931509 ) ) ( not ( = ?auto_931506 ?auto_931507 ) ) ( not ( = ?auto_931506 ?auto_931508 ) ) ( not ( = ?auto_931506 ?auto_931509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931507 ?auto_931508 ?auto_931509 )
      ( MAKE-10CRATE-VERIFY ?auto_931499 ?auto_931500 ?auto_931501 ?auto_931502 ?auto_931503 ?auto_931504 ?auto_931505 ?auto_931506 ?auto_931507 ?auto_931508 ?auto_931509 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931624 - SURFACE
      ?auto_931625 - SURFACE
      ?auto_931626 - SURFACE
      ?auto_931627 - SURFACE
      ?auto_931628 - SURFACE
      ?auto_931629 - SURFACE
      ?auto_931630 - SURFACE
      ?auto_931631 - SURFACE
      ?auto_931632 - SURFACE
      ?auto_931633 - SURFACE
      ?auto_931634 - SURFACE
    )
    :vars
    (
      ?auto_931639 - HOIST
      ?auto_931638 - PLACE
      ?auto_931637 - TRUCK
      ?auto_931636 - PLACE
      ?auto_931640 - HOIST
      ?auto_931635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_931639 ?auto_931638 ) ( SURFACE-AT ?auto_931633 ?auto_931638 ) ( CLEAR ?auto_931633 ) ( IS-CRATE ?auto_931634 ) ( not ( = ?auto_931633 ?auto_931634 ) ) ( AVAILABLE ?auto_931639 ) ( ON ?auto_931633 ?auto_931632 ) ( not ( = ?auto_931632 ?auto_931633 ) ) ( not ( = ?auto_931632 ?auto_931634 ) ) ( TRUCK-AT ?auto_931637 ?auto_931636 ) ( not ( = ?auto_931636 ?auto_931638 ) ) ( HOIST-AT ?auto_931640 ?auto_931636 ) ( not ( = ?auto_931639 ?auto_931640 ) ) ( AVAILABLE ?auto_931640 ) ( SURFACE-AT ?auto_931634 ?auto_931636 ) ( ON ?auto_931634 ?auto_931635 ) ( CLEAR ?auto_931634 ) ( not ( = ?auto_931633 ?auto_931635 ) ) ( not ( = ?auto_931634 ?auto_931635 ) ) ( not ( = ?auto_931632 ?auto_931635 ) ) ( ON ?auto_931625 ?auto_931624 ) ( ON ?auto_931626 ?auto_931625 ) ( ON ?auto_931627 ?auto_931626 ) ( ON ?auto_931628 ?auto_931627 ) ( ON ?auto_931629 ?auto_931628 ) ( ON ?auto_931630 ?auto_931629 ) ( ON ?auto_931631 ?auto_931630 ) ( ON ?auto_931632 ?auto_931631 ) ( not ( = ?auto_931624 ?auto_931625 ) ) ( not ( = ?auto_931624 ?auto_931626 ) ) ( not ( = ?auto_931624 ?auto_931627 ) ) ( not ( = ?auto_931624 ?auto_931628 ) ) ( not ( = ?auto_931624 ?auto_931629 ) ) ( not ( = ?auto_931624 ?auto_931630 ) ) ( not ( = ?auto_931624 ?auto_931631 ) ) ( not ( = ?auto_931624 ?auto_931632 ) ) ( not ( = ?auto_931624 ?auto_931633 ) ) ( not ( = ?auto_931624 ?auto_931634 ) ) ( not ( = ?auto_931624 ?auto_931635 ) ) ( not ( = ?auto_931625 ?auto_931626 ) ) ( not ( = ?auto_931625 ?auto_931627 ) ) ( not ( = ?auto_931625 ?auto_931628 ) ) ( not ( = ?auto_931625 ?auto_931629 ) ) ( not ( = ?auto_931625 ?auto_931630 ) ) ( not ( = ?auto_931625 ?auto_931631 ) ) ( not ( = ?auto_931625 ?auto_931632 ) ) ( not ( = ?auto_931625 ?auto_931633 ) ) ( not ( = ?auto_931625 ?auto_931634 ) ) ( not ( = ?auto_931625 ?auto_931635 ) ) ( not ( = ?auto_931626 ?auto_931627 ) ) ( not ( = ?auto_931626 ?auto_931628 ) ) ( not ( = ?auto_931626 ?auto_931629 ) ) ( not ( = ?auto_931626 ?auto_931630 ) ) ( not ( = ?auto_931626 ?auto_931631 ) ) ( not ( = ?auto_931626 ?auto_931632 ) ) ( not ( = ?auto_931626 ?auto_931633 ) ) ( not ( = ?auto_931626 ?auto_931634 ) ) ( not ( = ?auto_931626 ?auto_931635 ) ) ( not ( = ?auto_931627 ?auto_931628 ) ) ( not ( = ?auto_931627 ?auto_931629 ) ) ( not ( = ?auto_931627 ?auto_931630 ) ) ( not ( = ?auto_931627 ?auto_931631 ) ) ( not ( = ?auto_931627 ?auto_931632 ) ) ( not ( = ?auto_931627 ?auto_931633 ) ) ( not ( = ?auto_931627 ?auto_931634 ) ) ( not ( = ?auto_931627 ?auto_931635 ) ) ( not ( = ?auto_931628 ?auto_931629 ) ) ( not ( = ?auto_931628 ?auto_931630 ) ) ( not ( = ?auto_931628 ?auto_931631 ) ) ( not ( = ?auto_931628 ?auto_931632 ) ) ( not ( = ?auto_931628 ?auto_931633 ) ) ( not ( = ?auto_931628 ?auto_931634 ) ) ( not ( = ?auto_931628 ?auto_931635 ) ) ( not ( = ?auto_931629 ?auto_931630 ) ) ( not ( = ?auto_931629 ?auto_931631 ) ) ( not ( = ?auto_931629 ?auto_931632 ) ) ( not ( = ?auto_931629 ?auto_931633 ) ) ( not ( = ?auto_931629 ?auto_931634 ) ) ( not ( = ?auto_931629 ?auto_931635 ) ) ( not ( = ?auto_931630 ?auto_931631 ) ) ( not ( = ?auto_931630 ?auto_931632 ) ) ( not ( = ?auto_931630 ?auto_931633 ) ) ( not ( = ?auto_931630 ?auto_931634 ) ) ( not ( = ?auto_931630 ?auto_931635 ) ) ( not ( = ?auto_931631 ?auto_931632 ) ) ( not ( = ?auto_931631 ?auto_931633 ) ) ( not ( = ?auto_931631 ?auto_931634 ) ) ( not ( = ?auto_931631 ?auto_931635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931632 ?auto_931633 ?auto_931634 )
      ( MAKE-10CRATE-VERIFY ?auto_931624 ?auto_931625 ?auto_931626 ?auto_931627 ?auto_931628 ?auto_931629 ?auto_931630 ?auto_931631 ?auto_931632 ?auto_931633 ?auto_931634 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931750 - SURFACE
      ?auto_931751 - SURFACE
      ?auto_931752 - SURFACE
      ?auto_931753 - SURFACE
      ?auto_931754 - SURFACE
      ?auto_931755 - SURFACE
      ?auto_931756 - SURFACE
      ?auto_931757 - SURFACE
      ?auto_931758 - SURFACE
      ?auto_931759 - SURFACE
      ?auto_931760 - SURFACE
    )
    :vars
    (
      ?auto_931765 - HOIST
      ?auto_931761 - PLACE
      ?auto_931762 - PLACE
      ?auto_931764 - HOIST
      ?auto_931763 - SURFACE
      ?auto_931766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931765 ?auto_931761 ) ( SURFACE-AT ?auto_931759 ?auto_931761 ) ( CLEAR ?auto_931759 ) ( IS-CRATE ?auto_931760 ) ( not ( = ?auto_931759 ?auto_931760 ) ) ( AVAILABLE ?auto_931765 ) ( ON ?auto_931759 ?auto_931758 ) ( not ( = ?auto_931758 ?auto_931759 ) ) ( not ( = ?auto_931758 ?auto_931760 ) ) ( not ( = ?auto_931762 ?auto_931761 ) ) ( HOIST-AT ?auto_931764 ?auto_931762 ) ( not ( = ?auto_931765 ?auto_931764 ) ) ( AVAILABLE ?auto_931764 ) ( SURFACE-AT ?auto_931760 ?auto_931762 ) ( ON ?auto_931760 ?auto_931763 ) ( CLEAR ?auto_931760 ) ( not ( = ?auto_931759 ?auto_931763 ) ) ( not ( = ?auto_931760 ?auto_931763 ) ) ( not ( = ?auto_931758 ?auto_931763 ) ) ( TRUCK-AT ?auto_931766 ?auto_931761 ) ( ON ?auto_931751 ?auto_931750 ) ( ON ?auto_931752 ?auto_931751 ) ( ON ?auto_931753 ?auto_931752 ) ( ON ?auto_931754 ?auto_931753 ) ( ON ?auto_931755 ?auto_931754 ) ( ON ?auto_931756 ?auto_931755 ) ( ON ?auto_931757 ?auto_931756 ) ( ON ?auto_931758 ?auto_931757 ) ( not ( = ?auto_931750 ?auto_931751 ) ) ( not ( = ?auto_931750 ?auto_931752 ) ) ( not ( = ?auto_931750 ?auto_931753 ) ) ( not ( = ?auto_931750 ?auto_931754 ) ) ( not ( = ?auto_931750 ?auto_931755 ) ) ( not ( = ?auto_931750 ?auto_931756 ) ) ( not ( = ?auto_931750 ?auto_931757 ) ) ( not ( = ?auto_931750 ?auto_931758 ) ) ( not ( = ?auto_931750 ?auto_931759 ) ) ( not ( = ?auto_931750 ?auto_931760 ) ) ( not ( = ?auto_931750 ?auto_931763 ) ) ( not ( = ?auto_931751 ?auto_931752 ) ) ( not ( = ?auto_931751 ?auto_931753 ) ) ( not ( = ?auto_931751 ?auto_931754 ) ) ( not ( = ?auto_931751 ?auto_931755 ) ) ( not ( = ?auto_931751 ?auto_931756 ) ) ( not ( = ?auto_931751 ?auto_931757 ) ) ( not ( = ?auto_931751 ?auto_931758 ) ) ( not ( = ?auto_931751 ?auto_931759 ) ) ( not ( = ?auto_931751 ?auto_931760 ) ) ( not ( = ?auto_931751 ?auto_931763 ) ) ( not ( = ?auto_931752 ?auto_931753 ) ) ( not ( = ?auto_931752 ?auto_931754 ) ) ( not ( = ?auto_931752 ?auto_931755 ) ) ( not ( = ?auto_931752 ?auto_931756 ) ) ( not ( = ?auto_931752 ?auto_931757 ) ) ( not ( = ?auto_931752 ?auto_931758 ) ) ( not ( = ?auto_931752 ?auto_931759 ) ) ( not ( = ?auto_931752 ?auto_931760 ) ) ( not ( = ?auto_931752 ?auto_931763 ) ) ( not ( = ?auto_931753 ?auto_931754 ) ) ( not ( = ?auto_931753 ?auto_931755 ) ) ( not ( = ?auto_931753 ?auto_931756 ) ) ( not ( = ?auto_931753 ?auto_931757 ) ) ( not ( = ?auto_931753 ?auto_931758 ) ) ( not ( = ?auto_931753 ?auto_931759 ) ) ( not ( = ?auto_931753 ?auto_931760 ) ) ( not ( = ?auto_931753 ?auto_931763 ) ) ( not ( = ?auto_931754 ?auto_931755 ) ) ( not ( = ?auto_931754 ?auto_931756 ) ) ( not ( = ?auto_931754 ?auto_931757 ) ) ( not ( = ?auto_931754 ?auto_931758 ) ) ( not ( = ?auto_931754 ?auto_931759 ) ) ( not ( = ?auto_931754 ?auto_931760 ) ) ( not ( = ?auto_931754 ?auto_931763 ) ) ( not ( = ?auto_931755 ?auto_931756 ) ) ( not ( = ?auto_931755 ?auto_931757 ) ) ( not ( = ?auto_931755 ?auto_931758 ) ) ( not ( = ?auto_931755 ?auto_931759 ) ) ( not ( = ?auto_931755 ?auto_931760 ) ) ( not ( = ?auto_931755 ?auto_931763 ) ) ( not ( = ?auto_931756 ?auto_931757 ) ) ( not ( = ?auto_931756 ?auto_931758 ) ) ( not ( = ?auto_931756 ?auto_931759 ) ) ( not ( = ?auto_931756 ?auto_931760 ) ) ( not ( = ?auto_931756 ?auto_931763 ) ) ( not ( = ?auto_931757 ?auto_931758 ) ) ( not ( = ?auto_931757 ?auto_931759 ) ) ( not ( = ?auto_931757 ?auto_931760 ) ) ( not ( = ?auto_931757 ?auto_931763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931758 ?auto_931759 ?auto_931760 )
      ( MAKE-10CRATE-VERIFY ?auto_931750 ?auto_931751 ?auto_931752 ?auto_931753 ?auto_931754 ?auto_931755 ?auto_931756 ?auto_931757 ?auto_931758 ?auto_931759 ?auto_931760 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931876 - SURFACE
      ?auto_931877 - SURFACE
      ?auto_931878 - SURFACE
      ?auto_931879 - SURFACE
      ?auto_931880 - SURFACE
      ?auto_931881 - SURFACE
      ?auto_931882 - SURFACE
      ?auto_931883 - SURFACE
      ?auto_931884 - SURFACE
      ?auto_931885 - SURFACE
      ?auto_931886 - SURFACE
    )
    :vars
    (
      ?auto_931892 - HOIST
      ?auto_931887 - PLACE
      ?auto_931890 - PLACE
      ?auto_931891 - HOIST
      ?auto_931889 - SURFACE
      ?auto_931888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931892 ?auto_931887 ) ( IS-CRATE ?auto_931886 ) ( not ( = ?auto_931885 ?auto_931886 ) ) ( not ( = ?auto_931884 ?auto_931885 ) ) ( not ( = ?auto_931884 ?auto_931886 ) ) ( not ( = ?auto_931890 ?auto_931887 ) ) ( HOIST-AT ?auto_931891 ?auto_931890 ) ( not ( = ?auto_931892 ?auto_931891 ) ) ( AVAILABLE ?auto_931891 ) ( SURFACE-AT ?auto_931886 ?auto_931890 ) ( ON ?auto_931886 ?auto_931889 ) ( CLEAR ?auto_931886 ) ( not ( = ?auto_931885 ?auto_931889 ) ) ( not ( = ?auto_931886 ?auto_931889 ) ) ( not ( = ?auto_931884 ?auto_931889 ) ) ( TRUCK-AT ?auto_931888 ?auto_931887 ) ( SURFACE-AT ?auto_931884 ?auto_931887 ) ( CLEAR ?auto_931884 ) ( LIFTING ?auto_931892 ?auto_931885 ) ( IS-CRATE ?auto_931885 ) ( ON ?auto_931877 ?auto_931876 ) ( ON ?auto_931878 ?auto_931877 ) ( ON ?auto_931879 ?auto_931878 ) ( ON ?auto_931880 ?auto_931879 ) ( ON ?auto_931881 ?auto_931880 ) ( ON ?auto_931882 ?auto_931881 ) ( ON ?auto_931883 ?auto_931882 ) ( ON ?auto_931884 ?auto_931883 ) ( not ( = ?auto_931876 ?auto_931877 ) ) ( not ( = ?auto_931876 ?auto_931878 ) ) ( not ( = ?auto_931876 ?auto_931879 ) ) ( not ( = ?auto_931876 ?auto_931880 ) ) ( not ( = ?auto_931876 ?auto_931881 ) ) ( not ( = ?auto_931876 ?auto_931882 ) ) ( not ( = ?auto_931876 ?auto_931883 ) ) ( not ( = ?auto_931876 ?auto_931884 ) ) ( not ( = ?auto_931876 ?auto_931885 ) ) ( not ( = ?auto_931876 ?auto_931886 ) ) ( not ( = ?auto_931876 ?auto_931889 ) ) ( not ( = ?auto_931877 ?auto_931878 ) ) ( not ( = ?auto_931877 ?auto_931879 ) ) ( not ( = ?auto_931877 ?auto_931880 ) ) ( not ( = ?auto_931877 ?auto_931881 ) ) ( not ( = ?auto_931877 ?auto_931882 ) ) ( not ( = ?auto_931877 ?auto_931883 ) ) ( not ( = ?auto_931877 ?auto_931884 ) ) ( not ( = ?auto_931877 ?auto_931885 ) ) ( not ( = ?auto_931877 ?auto_931886 ) ) ( not ( = ?auto_931877 ?auto_931889 ) ) ( not ( = ?auto_931878 ?auto_931879 ) ) ( not ( = ?auto_931878 ?auto_931880 ) ) ( not ( = ?auto_931878 ?auto_931881 ) ) ( not ( = ?auto_931878 ?auto_931882 ) ) ( not ( = ?auto_931878 ?auto_931883 ) ) ( not ( = ?auto_931878 ?auto_931884 ) ) ( not ( = ?auto_931878 ?auto_931885 ) ) ( not ( = ?auto_931878 ?auto_931886 ) ) ( not ( = ?auto_931878 ?auto_931889 ) ) ( not ( = ?auto_931879 ?auto_931880 ) ) ( not ( = ?auto_931879 ?auto_931881 ) ) ( not ( = ?auto_931879 ?auto_931882 ) ) ( not ( = ?auto_931879 ?auto_931883 ) ) ( not ( = ?auto_931879 ?auto_931884 ) ) ( not ( = ?auto_931879 ?auto_931885 ) ) ( not ( = ?auto_931879 ?auto_931886 ) ) ( not ( = ?auto_931879 ?auto_931889 ) ) ( not ( = ?auto_931880 ?auto_931881 ) ) ( not ( = ?auto_931880 ?auto_931882 ) ) ( not ( = ?auto_931880 ?auto_931883 ) ) ( not ( = ?auto_931880 ?auto_931884 ) ) ( not ( = ?auto_931880 ?auto_931885 ) ) ( not ( = ?auto_931880 ?auto_931886 ) ) ( not ( = ?auto_931880 ?auto_931889 ) ) ( not ( = ?auto_931881 ?auto_931882 ) ) ( not ( = ?auto_931881 ?auto_931883 ) ) ( not ( = ?auto_931881 ?auto_931884 ) ) ( not ( = ?auto_931881 ?auto_931885 ) ) ( not ( = ?auto_931881 ?auto_931886 ) ) ( not ( = ?auto_931881 ?auto_931889 ) ) ( not ( = ?auto_931882 ?auto_931883 ) ) ( not ( = ?auto_931882 ?auto_931884 ) ) ( not ( = ?auto_931882 ?auto_931885 ) ) ( not ( = ?auto_931882 ?auto_931886 ) ) ( not ( = ?auto_931882 ?auto_931889 ) ) ( not ( = ?auto_931883 ?auto_931884 ) ) ( not ( = ?auto_931883 ?auto_931885 ) ) ( not ( = ?auto_931883 ?auto_931886 ) ) ( not ( = ?auto_931883 ?auto_931889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931884 ?auto_931885 ?auto_931886 )
      ( MAKE-10CRATE-VERIFY ?auto_931876 ?auto_931877 ?auto_931878 ?auto_931879 ?auto_931880 ?auto_931881 ?auto_931882 ?auto_931883 ?auto_931884 ?auto_931885 ?auto_931886 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_932002 - SURFACE
      ?auto_932003 - SURFACE
      ?auto_932004 - SURFACE
      ?auto_932005 - SURFACE
      ?auto_932006 - SURFACE
      ?auto_932007 - SURFACE
      ?auto_932008 - SURFACE
      ?auto_932009 - SURFACE
      ?auto_932010 - SURFACE
      ?auto_932011 - SURFACE
      ?auto_932012 - SURFACE
    )
    :vars
    (
      ?auto_932016 - HOIST
      ?auto_932013 - PLACE
      ?auto_932018 - PLACE
      ?auto_932014 - HOIST
      ?auto_932015 - SURFACE
      ?auto_932017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_932016 ?auto_932013 ) ( IS-CRATE ?auto_932012 ) ( not ( = ?auto_932011 ?auto_932012 ) ) ( not ( = ?auto_932010 ?auto_932011 ) ) ( not ( = ?auto_932010 ?auto_932012 ) ) ( not ( = ?auto_932018 ?auto_932013 ) ) ( HOIST-AT ?auto_932014 ?auto_932018 ) ( not ( = ?auto_932016 ?auto_932014 ) ) ( AVAILABLE ?auto_932014 ) ( SURFACE-AT ?auto_932012 ?auto_932018 ) ( ON ?auto_932012 ?auto_932015 ) ( CLEAR ?auto_932012 ) ( not ( = ?auto_932011 ?auto_932015 ) ) ( not ( = ?auto_932012 ?auto_932015 ) ) ( not ( = ?auto_932010 ?auto_932015 ) ) ( TRUCK-AT ?auto_932017 ?auto_932013 ) ( SURFACE-AT ?auto_932010 ?auto_932013 ) ( CLEAR ?auto_932010 ) ( IS-CRATE ?auto_932011 ) ( AVAILABLE ?auto_932016 ) ( IN ?auto_932011 ?auto_932017 ) ( ON ?auto_932003 ?auto_932002 ) ( ON ?auto_932004 ?auto_932003 ) ( ON ?auto_932005 ?auto_932004 ) ( ON ?auto_932006 ?auto_932005 ) ( ON ?auto_932007 ?auto_932006 ) ( ON ?auto_932008 ?auto_932007 ) ( ON ?auto_932009 ?auto_932008 ) ( ON ?auto_932010 ?auto_932009 ) ( not ( = ?auto_932002 ?auto_932003 ) ) ( not ( = ?auto_932002 ?auto_932004 ) ) ( not ( = ?auto_932002 ?auto_932005 ) ) ( not ( = ?auto_932002 ?auto_932006 ) ) ( not ( = ?auto_932002 ?auto_932007 ) ) ( not ( = ?auto_932002 ?auto_932008 ) ) ( not ( = ?auto_932002 ?auto_932009 ) ) ( not ( = ?auto_932002 ?auto_932010 ) ) ( not ( = ?auto_932002 ?auto_932011 ) ) ( not ( = ?auto_932002 ?auto_932012 ) ) ( not ( = ?auto_932002 ?auto_932015 ) ) ( not ( = ?auto_932003 ?auto_932004 ) ) ( not ( = ?auto_932003 ?auto_932005 ) ) ( not ( = ?auto_932003 ?auto_932006 ) ) ( not ( = ?auto_932003 ?auto_932007 ) ) ( not ( = ?auto_932003 ?auto_932008 ) ) ( not ( = ?auto_932003 ?auto_932009 ) ) ( not ( = ?auto_932003 ?auto_932010 ) ) ( not ( = ?auto_932003 ?auto_932011 ) ) ( not ( = ?auto_932003 ?auto_932012 ) ) ( not ( = ?auto_932003 ?auto_932015 ) ) ( not ( = ?auto_932004 ?auto_932005 ) ) ( not ( = ?auto_932004 ?auto_932006 ) ) ( not ( = ?auto_932004 ?auto_932007 ) ) ( not ( = ?auto_932004 ?auto_932008 ) ) ( not ( = ?auto_932004 ?auto_932009 ) ) ( not ( = ?auto_932004 ?auto_932010 ) ) ( not ( = ?auto_932004 ?auto_932011 ) ) ( not ( = ?auto_932004 ?auto_932012 ) ) ( not ( = ?auto_932004 ?auto_932015 ) ) ( not ( = ?auto_932005 ?auto_932006 ) ) ( not ( = ?auto_932005 ?auto_932007 ) ) ( not ( = ?auto_932005 ?auto_932008 ) ) ( not ( = ?auto_932005 ?auto_932009 ) ) ( not ( = ?auto_932005 ?auto_932010 ) ) ( not ( = ?auto_932005 ?auto_932011 ) ) ( not ( = ?auto_932005 ?auto_932012 ) ) ( not ( = ?auto_932005 ?auto_932015 ) ) ( not ( = ?auto_932006 ?auto_932007 ) ) ( not ( = ?auto_932006 ?auto_932008 ) ) ( not ( = ?auto_932006 ?auto_932009 ) ) ( not ( = ?auto_932006 ?auto_932010 ) ) ( not ( = ?auto_932006 ?auto_932011 ) ) ( not ( = ?auto_932006 ?auto_932012 ) ) ( not ( = ?auto_932006 ?auto_932015 ) ) ( not ( = ?auto_932007 ?auto_932008 ) ) ( not ( = ?auto_932007 ?auto_932009 ) ) ( not ( = ?auto_932007 ?auto_932010 ) ) ( not ( = ?auto_932007 ?auto_932011 ) ) ( not ( = ?auto_932007 ?auto_932012 ) ) ( not ( = ?auto_932007 ?auto_932015 ) ) ( not ( = ?auto_932008 ?auto_932009 ) ) ( not ( = ?auto_932008 ?auto_932010 ) ) ( not ( = ?auto_932008 ?auto_932011 ) ) ( not ( = ?auto_932008 ?auto_932012 ) ) ( not ( = ?auto_932008 ?auto_932015 ) ) ( not ( = ?auto_932009 ?auto_932010 ) ) ( not ( = ?auto_932009 ?auto_932011 ) ) ( not ( = ?auto_932009 ?auto_932012 ) ) ( not ( = ?auto_932009 ?auto_932015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_932010 ?auto_932011 ?auto_932012 )
      ( MAKE-10CRATE-VERIFY ?auto_932002 ?auto_932003 ?auto_932004 ?auto_932005 ?auto_932006 ?auto_932007 ?auto_932008 ?auto_932009 ?auto_932010 ?auto_932011 ?auto_932012 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939286 - SURFACE
      ?auto_939287 - SURFACE
      ?auto_939288 - SURFACE
      ?auto_939289 - SURFACE
      ?auto_939290 - SURFACE
      ?auto_939291 - SURFACE
      ?auto_939292 - SURFACE
      ?auto_939293 - SURFACE
      ?auto_939294 - SURFACE
      ?auto_939295 - SURFACE
      ?auto_939296 - SURFACE
      ?auto_939297 - SURFACE
    )
    :vars
    (
      ?auto_939298 - HOIST
      ?auto_939299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939298 ?auto_939299 ) ( SURFACE-AT ?auto_939296 ?auto_939299 ) ( CLEAR ?auto_939296 ) ( LIFTING ?auto_939298 ?auto_939297 ) ( IS-CRATE ?auto_939297 ) ( not ( = ?auto_939296 ?auto_939297 ) ) ( ON ?auto_939287 ?auto_939286 ) ( ON ?auto_939288 ?auto_939287 ) ( ON ?auto_939289 ?auto_939288 ) ( ON ?auto_939290 ?auto_939289 ) ( ON ?auto_939291 ?auto_939290 ) ( ON ?auto_939292 ?auto_939291 ) ( ON ?auto_939293 ?auto_939292 ) ( ON ?auto_939294 ?auto_939293 ) ( ON ?auto_939295 ?auto_939294 ) ( ON ?auto_939296 ?auto_939295 ) ( not ( = ?auto_939286 ?auto_939287 ) ) ( not ( = ?auto_939286 ?auto_939288 ) ) ( not ( = ?auto_939286 ?auto_939289 ) ) ( not ( = ?auto_939286 ?auto_939290 ) ) ( not ( = ?auto_939286 ?auto_939291 ) ) ( not ( = ?auto_939286 ?auto_939292 ) ) ( not ( = ?auto_939286 ?auto_939293 ) ) ( not ( = ?auto_939286 ?auto_939294 ) ) ( not ( = ?auto_939286 ?auto_939295 ) ) ( not ( = ?auto_939286 ?auto_939296 ) ) ( not ( = ?auto_939286 ?auto_939297 ) ) ( not ( = ?auto_939287 ?auto_939288 ) ) ( not ( = ?auto_939287 ?auto_939289 ) ) ( not ( = ?auto_939287 ?auto_939290 ) ) ( not ( = ?auto_939287 ?auto_939291 ) ) ( not ( = ?auto_939287 ?auto_939292 ) ) ( not ( = ?auto_939287 ?auto_939293 ) ) ( not ( = ?auto_939287 ?auto_939294 ) ) ( not ( = ?auto_939287 ?auto_939295 ) ) ( not ( = ?auto_939287 ?auto_939296 ) ) ( not ( = ?auto_939287 ?auto_939297 ) ) ( not ( = ?auto_939288 ?auto_939289 ) ) ( not ( = ?auto_939288 ?auto_939290 ) ) ( not ( = ?auto_939288 ?auto_939291 ) ) ( not ( = ?auto_939288 ?auto_939292 ) ) ( not ( = ?auto_939288 ?auto_939293 ) ) ( not ( = ?auto_939288 ?auto_939294 ) ) ( not ( = ?auto_939288 ?auto_939295 ) ) ( not ( = ?auto_939288 ?auto_939296 ) ) ( not ( = ?auto_939288 ?auto_939297 ) ) ( not ( = ?auto_939289 ?auto_939290 ) ) ( not ( = ?auto_939289 ?auto_939291 ) ) ( not ( = ?auto_939289 ?auto_939292 ) ) ( not ( = ?auto_939289 ?auto_939293 ) ) ( not ( = ?auto_939289 ?auto_939294 ) ) ( not ( = ?auto_939289 ?auto_939295 ) ) ( not ( = ?auto_939289 ?auto_939296 ) ) ( not ( = ?auto_939289 ?auto_939297 ) ) ( not ( = ?auto_939290 ?auto_939291 ) ) ( not ( = ?auto_939290 ?auto_939292 ) ) ( not ( = ?auto_939290 ?auto_939293 ) ) ( not ( = ?auto_939290 ?auto_939294 ) ) ( not ( = ?auto_939290 ?auto_939295 ) ) ( not ( = ?auto_939290 ?auto_939296 ) ) ( not ( = ?auto_939290 ?auto_939297 ) ) ( not ( = ?auto_939291 ?auto_939292 ) ) ( not ( = ?auto_939291 ?auto_939293 ) ) ( not ( = ?auto_939291 ?auto_939294 ) ) ( not ( = ?auto_939291 ?auto_939295 ) ) ( not ( = ?auto_939291 ?auto_939296 ) ) ( not ( = ?auto_939291 ?auto_939297 ) ) ( not ( = ?auto_939292 ?auto_939293 ) ) ( not ( = ?auto_939292 ?auto_939294 ) ) ( not ( = ?auto_939292 ?auto_939295 ) ) ( not ( = ?auto_939292 ?auto_939296 ) ) ( not ( = ?auto_939292 ?auto_939297 ) ) ( not ( = ?auto_939293 ?auto_939294 ) ) ( not ( = ?auto_939293 ?auto_939295 ) ) ( not ( = ?auto_939293 ?auto_939296 ) ) ( not ( = ?auto_939293 ?auto_939297 ) ) ( not ( = ?auto_939294 ?auto_939295 ) ) ( not ( = ?auto_939294 ?auto_939296 ) ) ( not ( = ?auto_939294 ?auto_939297 ) ) ( not ( = ?auto_939295 ?auto_939296 ) ) ( not ( = ?auto_939295 ?auto_939297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_939296 ?auto_939297 )
      ( MAKE-11CRATE-VERIFY ?auto_939286 ?auto_939287 ?auto_939288 ?auto_939289 ?auto_939290 ?auto_939291 ?auto_939292 ?auto_939293 ?auto_939294 ?auto_939295 ?auto_939296 ?auto_939297 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939395 - SURFACE
      ?auto_939396 - SURFACE
      ?auto_939397 - SURFACE
      ?auto_939398 - SURFACE
      ?auto_939399 - SURFACE
      ?auto_939400 - SURFACE
      ?auto_939401 - SURFACE
      ?auto_939402 - SURFACE
      ?auto_939403 - SURFACE
      ?auto_939404 - SURFACE
      ?auto_939405 - SURFACE
      ?auto_939406 - SURFACE
    )
    :vars
    (
      ?auto_939407 - HOIST
      ?auto_939409 - PLACE
      ?auto_939408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_939407 ?auto_939409 ) ( SURFACE-AT ?auto_939405 ?auto_939409 ) ( CLEAR ?auto_939405 ) ( IS-CRATE ?auto_939406 ) ( not ( = ?auto_939405 ?auto_939406 ) ) ( TRUCK-AT ?auto_939408 ?auto_939409 ) ( AVAILABLE ?auto_939407 ) ( IN ?auto_939406 ?auto_939408 ) ( ON ?auto_939405 ?auto_939404 ) ( not ( = ?auto_939404 ?auto_939405 ) ) ( not ( = ?auto_939404 ?auto_939406 ) ) ( ON ?auto_939396 ?auto_939395 ) ( ON ?auto_939397 ?auto_939396 ) ( ON ?auto_939398 ?auto_939397 ) ( ON ?auto_939399 ?auto_939398 ) ( ON ?auto_939400 ?auto_939399 ) ( ON ?auto_939401 ?auto_939400 ) ( ON ?auto_939402 ?auto_939401 ) ( ON ?auto_939403 ?auto_939402 ) ( ON ?auto_939404 ?auto_939403 ) ( not ( = ?auto_939395 ?auto_939396 ) ) ( not ( = ?auto_939395 ?auto_939397 ) ) ( not ( = ?auto_939395 ?auto_939398 ) ) ( not ( = ?auto_939395 ?auto_939399 ) ) ( not ( = ?auto_939395 ?auto_939400 ) ) ( not ( = ?auto_939395 ?auto_939401 ) ) ( not ( = ?auto_939395 ?auto_939402 ) ) ( not ( = ?auto_939395 ?auto_939403 ) ) ( not ( = ?auto_939395 ?auto_939404 ) ) ( not ( = ?auto_939395 ?auto_939405 ) ) ( not ( = ?auto_939395 ?auto_939406 ) ) ( not ( = ?auto_939396 ?auto_939397 ) ) ( not ( = ?auto_939396 ?auto_939398 ) ) ( not ( = ?auto_939396 ?auto_939399 ) ) ( not ( = ?auto_939396 ?auto_939400 ) ) ( not ( = ?auto_939396 ?auto_939401 ) ) ( not ( = ?auto_939396 ?auto_939402 ) ) ( not ( = ?auto_939396 ?auto_939403 ) ) ( not ( = ?auto_939396 ?auto_939404 ) ) ( not ( = ?auto_939396 ?auto_939405 ) ) ( not ( = ?auto_939396 ?auto_939406 ) ) ( not ( = ?auto_939397 ?auto_939398 ) ) ( not ( = ?auto_939397 ?auto_939399 ) ) ( not ( = ?auto_939397 ?auto_939400 ) ) ( not ( = ?auto_939397 ?auto_939401 ) ) ( not ( = ?auto_939397 ?auto_939402 ) ) ( not ( = ?auto_939397 ?auto_939403 ) ) ( not ( = ?auto_939397 ?auto_939404 ) ) ( not ( = ?auto_939397 ?auto_939405 ) ) ( not ( = ?auto_939397 ?auto_939406 ) ) ( not ( = ?auto_939398 ?auto_939399 ) ) ( not ( = ?auto_939398 ?auto_939400 ) ) ( not ( = ?auto_939398 ?auto_939401 ) ) ( not ( = ?auto_939398 ?auto_939402 ) ) ( not ( = ?auto_939398 ?auto_939403 ) ) ( not ( = ?auto_939398 ?auto_939404 ) ) ( not ( = ?auto_939398 ?auto_939405 ) ) ( not ( = ?auto_939398 ?auto_939406 ) ) ( not ( = ?auto_939399 ?auto_939400 ) ) ( not ( = ?auto_939399 ?auto_939401 ) ) ( not ( = ?auto_939399 ?auto_939402 ) ) ( not ( = ?auto_939399 ?auto_939403 ) ) ( not ( = ?auto_939399 ?auto_939404 ) ) ( not ( = ?auto_939399 ?auto_939405 ) ) ( not ( = ?auto_939399 ?auto_939406 ) ) ( not ( = ?auto_939400 ?auto_939401 ) ) ( not ( = ?auto_939400 ?auto_939402 ) ) ( not ( = ?auto_939400 ?auto_939403 ) ) ( not ( = ?auto_939400 ?auto_939404 ) ) ( not ( = ?auto_939400 ?auto_939405 ) ) ( not ( = ?auto_939400 ?auto_939406 ) ) ( not ( = ?auto_939401 ?auto_939402 ) ) ( not ( = ?auto_939401 ?auto_939403 ) ) ( not ( = ?auto_939401 ?auto_939404 ) ) ( not ( = ?auto_939401 ?auto_939405 ) ) ( not ( = ?auto_939401 ?auto_939406 ) ) ( not ( = ?auto_939402 ?auto_939403 ) ) ( not ( = ?auto_939402 ?auto_939404 ) ) ( not ( = ?auto_939402 ?auto_939405 ) ) ( not ( = ?auto_939402 ?auto_939406 ) ) ( not ( = ?auto_939403 ?auto_939404 ) ) ( not ( = ?auto_939403 ?auto_939405 ) ) ( not ( = ?auto_939403 ?auto_939406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939404 ?auto_939405 ?auto_939406 )
      ( MAKE-11CRATE-VERIFY ?auto_939395 ?auto_939396 ?auto_939397 ?auto_939398 ?auto_939399 ?auto_939400 ?auto_939401 ?auto_939402 ?auto_939403 ?auto_939404 ?auto_939405 ?auto_939406 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939516 - SURFACE
      ?auto_939517 - SURFACE
      ?auto_939518 - SURFACE
      ?auto_939519 - SURFACE
      ?auto_939520 - SURFACE
      ?auto_939521 - SURFACE
      ?auto_939522 - SURFACE
      ?auto_939523 - SURFACE
      ?auto_939524 - SURFACE
      ?auto_939525 - SURFACE
      ?auto_939526 - SURFACE
      ?auto_939527 - SURFACE
    )
    :vars
    (
      ?auto_939530 - HOIST
      ?auto_939528 - PLACE
      ?auto_939531 - TRUCK
      ?auto_939529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939530 ?auto_939528 ) ( SURFACE-AT ?auto_939526 ?auto_939528 ) ( CLEAR ?auto_939526 ) ( IS-CRATE ?auto_939527 ) ( not ( = ?auto_939526 ?auto_939527 ) ) ( AVAILABLE ?auto_939530 ) ( IN ?auto_939527 ?auto_939531 ) ( ON ?auto_939526 ?auto_939525 ) ( not ( = ?auto_939525 ?auto_939526 ) ) ( not ( = ?auto_939525 ?auto_939527 ) ) ( TRUCK-AT ?auto_939531 ?auto_939529 ) ( not ( = ?auto_939529 ?auto_939528 ) ) ( ON ?auto_939517 ?auto_939516 ) ( ON ?auto_939518 ?auto_939517 ) ( ON ?auto_939519 ?auto_939518 ) ( ON ?auto_939520 ?auto_939519 ) ( ON ?auto_939521 ?auto_939520 ) ( ON ?auto_939522 ?auto_939521 ) ( ON ?auto_939523 ?auto_939522 ) ( ON ?auto_939524 ?auto_939523 ) ( ON ?auto_939525 ?auto_939524 ) ( not ( = ?auto_939516 ?auto_939517 ) ) ( not ( = ?auto_939516 ?auto_939518 ) ) ( not ( = ?auto_939516 ?auto_939519 ) ) ( not ( = ?auto_939516 ?auto_939520 ) ) ( not ( = ?auto_939516 ?auto_939521 ) ) ( not ( = ?auto_939516 ?auto_939522 ) ) ( not ( = ?auto_939516 ?auto_939523 ) ) ( not ( = ?auto_939516 ?auto_939524 ) ) ( not ( = ?auto_939516 ?auto_939525 ) ) ( not ( = ?auto_939516 ?auto_939526 ) ) ( not ( = ?auto_939516 ?auto_939527 ) ) ( not ( = ?auto_939517 ?auto_939518 ) ) ( not ( = ?auto_939517 ?auto_939519 ) ) ( not ( = ?auto_939517 ?auto_939520 ) ) ( not ( = ?auto_939517 ?auto_939521 ) ) ( not ( = ?auto_939517 ?auto_939522 ) ) ( not ( = ?auto_939517 ?auto_939523 ) ) ( not ( = ?auto_939517 ?auto_939524 ) ) ( not ( = ?auto_939517 ?auto_939525 ) ) ( not ( = ?auto_939517 ?auto_939526 ) ) ( not ( = ?auto_939517 ?auto_939527 ) ) ( not ( = ?auto_939518 ?auto_939519 ) ) ( not ( = ?auto_939518 ?auto_939520 ) ) ( not ( = ?auto_939518 ?auto_939521 ) ) ( not ( = ?auto_939518 ?auto_939522 ) ) ( not ( = ?auto_939518 ?auto_939523 ) ) ( not ( = ?auto_939518 ?auto_939524 ) ) ( not ( = ?auto_939518 ?auto_939525 ) ) ( not ( = ?auto_939518 ?auto_939526 ) ) ( not ( = ?auto_939518 ?auto_939527 ) ) ( not ( = ?auto_939519 ?auto_939520 ) ) ( not ( = ?auto_939519 ?auto_939521 ) ) ( not ( = ?auto_939519 ?auto_939522 ) ) ( not ( = ?auto_939519 ?auto_939523 ) ) ( not ( = ?auto_939519 ?auto_939524 ) ) ( not ( = ?auto_939519 ?auto_939525 ) ) ( not ( = ?auto_939519 ?auto_939526 ) ) ( not ( = ?auto_939519 ?auto_939527 ) ) ( not ( = ?auto_939520 ?auto_939521 ) ) ( not ( = ?auto_939520 ?auto_939522 ) ) ( not ( = ?auto_939520 ?auto_939523 ) ) ( not ( = ?auto_939520 ?auto_939524 ) ) ( not ( = ?auto_939520 ?auto_939525 ) ) ( not ( = ?auto_939520 ?auto_939526 ) ) ( not ( = ?auto_939520 ?auto_939527 ) ) ( not ( = ?auto_939521 ?auto_939522 ) ) ( not ( = ?auto_939521 ?auto_939523 ) ) ( not ( = ?auto_939521 ?auto_939524 ) ) ( not ( = ?auto_939521 ?auto_939525 ) ) ( not ( = ?auto_939521 ?auto_939526 ) ) ( not ( = ?auto_939521 ?auto_939527 ) ) ( not ( = ?auto_939522 ?auto_939523 ) ) ( not ( = ?auto_939522 ?auto_939524 ) ) ( not ( = ?auto_939522 ?auto_939525 ) ) ( not ( = ?auto_939522 ?auto_939526 ) ) ( not ( = ?auto_939522 ?auto_939527 ) ) ( not ( = ?auto_939523 ?auto_939524 ) ) ( not ( = ?auto_939523 ?auto_939525 ) ) ( not ( = ?auto_939523 ?auto_939526 ) ) ( not ( = ?auto_939523 ?auto_939527 ) ) ( not ( = ?auto_939524 ?auto_939525 ) ) ( not ( = ?auto_939524 ?auto_939526 ) ) ( not ( = ?auto_939524 ?auto_939527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939525 ?auto_939526 ?auto_939527 )
      ( MAKE-11CRATE-VERIFY ?auto_939516 ?auto_939517 ?auto_939518 ?auto_939519 ?auto_939520 ?auto_939521 ?auto_939522 ?auto_939523 ?auto_939524 ?auto_939525 ?auto_939526 ?auto_939527 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939648 - SURFACE
      ?auto_939649 - SURFACE
      ?auto_939650 - SURFACE
      ?auto_939651 - SURFACE
      ?auto_939652 - SURFACE
      ?auto_939653 - SURFACE
      ?auto_939654 - SURFACE
      ?auto_939655 - SURFACE
      ?auto_939656 - SURFACE
      ?auto_939657 - SURFACE
      ?auto_939658 - SURFACE
      ?auto_939659 - SURFACE
    )
    :vars
    (
      ?auto_939660 - HOIST
      ?auto_939663 - PLACE
      ?auto_939661 - TRUCK
      ?auto_939664 - PLACE
      ?auto_939662 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_939660 ?auto_939663 ) ( SURFACE-AT ?auto_939658 ?auto_939663 ) ( CLEAR ?auto_939658 ) ( IS-CRATE ?auto_939659 ) ( not ( = ?auto_939658 ?auto_939659 ) ) ( AVAILABLE ?auto_939660 ) ( ON ?auto_939658 ?auto_939657 ) ( not ( = ?auto_939657 ?auto_939658 ) ) ( not ( = ?auto_939657 ?auto_939659 ) ) ( TRUCK-AT ?auto_939661 ?auto_939664 ) ( not ( = ?auto_939664 ?auto_939663 ) ) ( HOIST-AT ?auto_939662 ?auto_939664 ) ( LIFTING ?auto_939662 ?auto_939659 ) ( not ( = ?auto_939660 ?auto_939662 ) ) ( ON ?auto_939649 ?auto_939648 ) ( ON ?auto_939650 ?auto_939649 ) ( ON ?auto_939651 ?auto_939650 ) ( ON ?auto_939652 ?auto_939651 ) ( ON ?auto_939653 ?auto_939652 ) ( ON ?auto_939654 ?auto_939653 ) ( ON ?auto_939655 ?auto_939654 ) ( ON ?auto_939656 ?auto_939655 ) ( ON ?auto_939657 ?auto_939656 ) ( not ( = ?auto_939648 ?auto_939649 ) ) ( not ( = ?auto_939648 ?auto_939650 ) ) ( not ( = ?auto_939648 ?auto_939651 ) ) ( not ( = ?auto_939648 ?auto_939652 ) ) ( not ( = ?auto_939648 ?auto_939653 ) ) ( not ( = ?auto_939648 ?auto_939654 ) ) ( not ( = ?auto_939648 ?auto_939655 ) ) ( not ( = ?auto_939648 ?auto_939656 ) ) ( not ( = ?auto_939648 ?auto_939657 ) ) ( not ( = ?auto_939648 ?auto_939658 ) ) ( not ( = ?auto_939648 ?auto_939659 ) ) ( not ( = ?auto_939649 ?auto_939650 ) ) ( not ( = ?auto_939649 ?auto_939651 ) ) ( not ( = ?auto_939649 ?auto_939652 ) ) ( not ( = ?auto_939649 ?auto_939653 ) ) ( not ( = ?auto_939649 ?auto_939654 ) ) ( not ( = ?auto_939649 ?auto_939655 ) ) ( not ( = ?auto_939649 ?auto_939656 ) ) ( not ( = ?auto_939649 ?auto_939657 ) ) ( not ( = ?auto_939649 ?auto_939658 ) ) ( not ( = ?auto_939649 ?auto_939659 ) ) ( not ( = ?auto_939650 ?auto_939651 ) ) ( not ( = ?auto_939650 ?auto_939652 ) ) ( not ( = ?auto_939650 ?auto_939653 ) ) ( not ( = ?auto_939650 ?auto_939654 ) ) ( not ( = ?auto_939650 ?auto_939655 ) ) ( not ( = ?auto_939650 ?auto_939656 ) ) ( not ( = ?auto_939650 ?auto_939657 ) ) ( not ( = ?auto_939650 ?auto_939658 ) ) ( not ( = ?auto_939650 ?auto_939659 ) ) ( not ( = ?auto_939651 ?auto_939652 ) ) ( not ( = ?auto_939651 ?auto_939653 ) ) ( not ( = ?auto_939651 ?auto_939654 ) ) ( not ( = ?auto_939651 ?auto_939655 ) ) ( not ( = ?auto_939651 ?auto_939656 ) ) ( not ( = ?auto_939651 ?auto_939657 ) ) ( not ( = ?auto_939651 ?auto_939658 ) ) ( not ( = ?auto_939651 ?auto_939659 ) ) ( not ( = ?auto_939652 ?auto_939653 ) ) ( not ( = ?auto_939652 ?auto_939654 ) ) ( not ( = ?auto_939652 ?auto_939655 ) ) ( not ( = ?auto_939652 ?auto_939656 ) ) ( not ( = ?auto_939652 ?auto_939657 ) ) ( not ( = ?auto_939652 ?auto_939658 ) ) ( not ( = ?auto_939652 ?auto_939659 ) ) ( not ( = ?auto_939653 ?auto_939654 ) ) ( not ( = ?auto_939653 ?auto_939655 ) ) ( not ( = ?auto_939653 ?auto_939656 ) ) ( not ( = ?auto_939653 ?auto_939657 ) ) ( not ( = ?auto_939653 ?auto_939658 ) ) ( not ( = ?auto_939653 ?auto_939659 ) ) ( not ( = ?auto_939654 ?auto_939655 ) ) ( not ( = ?auto_939654 ?auto_939656 ) ) ( not ( = ?auto_939654 ?auto_939657 ) ) ( not ( = ?auto_939654 ?auto_939658 ) ) ( not ( = ?auto_939654 ?auto_939659 ) ) ( not ( = ?auto_939655 ?auto_939656 ) ) ( not ( = ?auto_939655 ?auto_939657 ) ) ( not ( = ?auto_939655 ?auto_939658 ) ) ( not ( = ?auto_939655 ?auto_939659 ) ) ( not ( = ?auto_939656 ?auto_939657 ) ) ( not ( = ?auto_939656 ?auto_939658 ) ) ( not ( = ?auto_939656 ?auto_939659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939657 ?auto_939658 ?auto_939659 )
      ( MAKE-11CRATE-VERIFY ?auto_939648 ?auto_939649 ?auto_939650 ?auto_939651 ?auto_939652 ?auto_939653 ?auto_939654 ?auto_939655 ?auto_939656 ?auto_939657 ?auto_939658 ?auto_939659 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939791 - SURFACE
      ?auto_939792 - SURFACE
      ?auto_939793 - SURFACE
      ?auto_939794 - SURFACE
      ?auto_939795 - SURFACE
      ?auto_939796 - SURFACE
      ?auto_939797 - SURFACE
      ?auto_939798 - SURFACE
      ?auto_939799 - SURFACE
      ?auto_939800 - SURFACE
      ?auto_939801 - SURFACE
      ?auto_939802 - SURFACE
    )
    :vars
    (
      ?auto_939808 - HOIST
      ?auto_939806 - PLACE
      ?auto_939807 - TRUCK
      ?auto_939805 - PLACE
      ?auto_939803 - HOIST
      ?auto_939804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939808 ?auto_939806 ) ( SURFACE-AT ?auto_939801 ?auto_939806 ) ( CLEAR ?auto_939801 ) ( IS-CRATE ?auto_939802 ) ( not ( = ?auto_939801 ?auto_939802 ) ) ( AVAILABLE ?auto_939808 ) ( ON ?auto_939801 ?auto_939800 ) ( not ( = ?auto_939800 ?auto_939801 ) ) ( not ( = ?auto_939800 ?auto_939802 ) ) ( TRUCK-AT ?auto_939807 ?auto_939805 ) ( not ( = ?auto_939805 ?auto_939806 ) ) ( HOIST-AT ?auto_939803 ?auto_939805 ) ( not ( = ?auto_939808 ?auto_939803 ) ) ( AVAILABLE ?auto_939803 ) ( SURFACE-AT ?auto_939802 ?auto_939805 ) ( ON ?auto_939802 ?auto_939804 ) ( CLEAR ?auto_939802 ) ( not ( = ?auto_939801 ?auto_939804 ) ) ( not ( = ?auto_939802 ?auto_939804 ) ) ( not ( = ?auto_939800 ?auto_939804 ) ) ( ON ?auto_939792 ?auto_939791 ) ( ON ?auto_939793 ?auto_939792 ) ( ON ?auto_939794 ?auto_939793 ) ( ON ?auto_939795 ?auto_939794 ) ( ON ?auto_939796 ?auto_939795 ) ( ON ?auto_939797 ?auto_939796 ) ( ON ?auto_939798 ?auto_939797 ) ( ON ?auto_939799 ?auto_939798 ) ( ON ?auto_939800 ?auto_939799 ) ( not ( = ?auto_939791 ?auto_939792 ) ) ( not ( = ?auto_939791 ?auto_939793 ) ) ( not ( = ?auto_939791 ?auto_939794 ) ) ( not ( = ?auto_939791 ?auto_939795 ) ) ( not ( = ?auto_939791 ?auto_939796 ) ) ( not ( = ?auto_939791 ?auto_939797 ) ) ( not ( = ?auto_939791 ?auto_939798 ) ) ( not ( = ?auto_939791 ?auto_939799 ) ) ( not ( = ?auto_939791 ?auto_939800 ) ) ( not ( = ?auto_939791 ?auto_939801 ) ) ( not ( = ?auto_939791 ?auto_939802 ) ) ( not ( = ?auto_939791 ?auto_939804 ) ) ( not ( = ?auto_939792 ?auto_939793 ) ) ( not ( = ?auto_939792 ?auto_939794 ) ) ( not ( = ?auto_939792 ?auto_939795 ) ) ( not ( = ?auto_939792 ?auto_939796 ) ) ( not ( = ?auto_939792 ?auto_939797 ) ) ( not ( = ?auto_939792 ?auto_939798 ) ) ( not ( = ?auto_939792 ?auto_939799 ) ) ( not ( = ?auto_939792 ?auto_939800 ) ) ( not ( = ?auto_939792 ?auto_939801 ) ) ( not ( = ?auto_939792 ?auto_939802 ) ) ( not ( = ?auto_939792 ?auto_939804 ) ) ( not ( = ?auto_939793 ?auto_939794 ) ) ( not ( = ?auto_939793 ?auto_939795 ) ) ( not ( = ?auto_939793 ?auto_939796 ) ) ( not ( = ?auto_939793 ?auto_939797 ) ) ( not ( = ?auto_939793 ?auto_939798 ) ) ( not ( = ?auto_939793 ?auto_939799 ) ) ( not ( = ?auto_939793 ?auto_939800 ) ) ( not ( = ?auto_939793 ?auto_939801 ) ) ( not ( = ?auto_939793 ?auto_939802 ) ) ( not ( = ?auto_939793 ?auto_939804 ) ) ( not ( = ?auto_939794 ?auto_939795 ) ) ( not ( = ?auto_939794 ?auto_939796 ) ) ( not ( = ?auto_939794 ?auto_939797 ) ) ( not ( = ?auto_939794 ?auto_939798 ) ) ( not ( = ?auto_939794 ?auto_939799 ) ) ( not ( = ?auto_939794 ?auto_939800 ) ) ( not ( = ?auto_939794 ?auto_939801 ) ) ( not ( = ?auto_939794 ?auto_939802 ) ) ( not ( = ?auto_939794 ?auto_939804 ) ) ( not ( = ?auto_939795 ?auto_939796 ) ) ( not ( = ?auto_939795 ?auto_939797 ) ) ( not ( = ?auto_939795 ?auto_939798 ) ) ( not ( = ?auto_939795 ?auto_939799 ) ) ( not ( = ?auto_939795 ?auto_939800 ) ) ( not ( = ?auto_939795 ?auto_939801 ) ) ( not ( = ?auto_939795 ?auto_939802 ) ) ( not ( = ?auto_939795 ?auto_939804 ) ) ( not ( = ?auto_939796 ?auto_939797 ) ) ( not ( = ?auto_939796 ?auto_939798 ) ) ( not ( = ?auto_939796 ?auto_939799 ) ) ( not ( = ?auto_939796 ?auto_939800 ) ) ( not ( = ?auto_939796 ?auto_939801 ) ) ( not ( = ?auto_939796 ?auto_939802 ) ) ( not ( = ?auto_939796 ?auto_939804 ) ) ( not ( = ?auto_939797 ?auto_939798 ) ) ( not ( = ?auto_939797 ?auto_939799 ) ) ( not ( = ?auto_939797 ?auto_939800 ) ) ( not ( = ?auto_939797 ?auto_939801 ) ) ( not ( = ?auto_939797 ?auto_939802 ) ) ( not ( = ?auto_939797 ?auto_939804 ) ) ( not ( = ?auto_939798 ?auto_939799 ) ) ( not ( = ?auto_939798 ?auto_939800 ) ) ( not ( = ?auto_939798 ?auto_939801 ) ) ( not ( = ?auto_939798 ?auto_939802 ) ) ( not ( = ?auto_939798 ?auto_939804 ) ) ( not ( = ?auto_939799 ?auto_939800 ) ) ( not ( = ?auto_939799 ?auto_939801 ) ) ( not ( = ?auto_939799 ?auto_939802 ) ) ( not ( = ?auto_939799 ?auto_939804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939800 ?auto_939801 ?auto_939802 )
      ( MAKE-11CRATE-VERIFY ?auto_939791 ?auto_939792 ?auto_939793 ?auto_939794 ?auto_939795 ?auto_939796 ?auto_939797 ?auto_939798 ?auto_939799 ?auto_939800 ?auto_939801 ?auto_939802 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939935 - SURFACE
      ?auto_939936 - SURFACE
      ?auto_939937 - SURFACE
      ?auto_939938 - SURFACE
      ?auto_939939 - SURFACE
      ?auto_939940 - SURFACE
      ?auto_939941 - SURFACE
      ?auto_939942 - SURFACE
      ?auto_939943 - SURFACE
      ?auto_939944 - SURFACE
      ?auto_939945 - SURFACE
      ?auto_939946 - SURFACE
    )
    :vars
    (
      ?auto_939948 - HOIST
      ?auto_939949 - PLACE
      ?auto_939947 - PLACE
      ?auto_939952 - HOIST
      ?auto_939951 - SURFACE
      ?auto_939950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_939948 ?auto_939949 ) ( SURFACE-AT ?auto_939945 ?auto_939949 ) ( CLEAR ?auto_939945 ) ( IS-CRATE ?auto_939946 ) ( not ( = ?auto_939945 ?auto_939946 ) ) ( AVAILABLE ?auto_939948 ) ( ON ?auto_939945 ?auto_939944 ) ( not ( = ?auto_939944 ?auto_939945 ) ) ( not ( = ?auto_939944 ?auto_939946 ) ) ( not ( = ?auto_939947 ?auto_939949 ) ) ( HOIST-AT ?auto_939952 ?auto_939947 ) ( not ( = ?auto_939948 ?auto_939952 ) ) ( AVAILABLE ?auto_939952 ) ( SURFACE-AT ?auto_939946 ?auto_939947 ) ( ON ?auto_939946 ?auto_939951 ) ( CLEAR ?auto_939946 ) ( not ( = ?auto_939945 ?auto_939951 ) ) ( not ( = ?auto_939946 ?auto_939951 ) ) ( not ( = ?auto_939944 ?auto_939951 ) ) ( TRUCK-AT ?auto_939950 ?auto_939949 ) ( ON ?auto_939936 ?auto_939935 ) ( ON ?auto_939937 ?auto_939936 ) ( ON ?auto_939938 ?auto_939937 ) ( ON ?auto_939939 ?auto_939938 ) ( ON ?auto_939940 ?auto_939939 ) ( ON ?auto_939941 ?auto_939940 ) ( ON ?auto_939942 ?auto_939941 ) ( ON ?auto_939943 ?auto_939942 ) ( ON ?auto_939944 ?auto_939943 ) ( not ( = ?auto_939935 ?auto_939936 ) ) ( not ( = ?auto_939935 ?auto_939937 ) ) ( not ( = ?auto_939935 ?auto_939938 ) ) ( not ( = ?auto_939935 ?auto_939939 ) ) ( not ( = ?auto_939935 ?auto_939940 ) ) ( not ( = ?auto_939935 ?auto_939941 ) ) ( not ( = ?auto_939935 ?auto_939942 ) ) ( not ( = ?auto_939935 ?auto_939943 ) ) ( not ( = ?auto_939935 ?auto_939944 ) ) ( not ( = ?auto_939935 ?auto_939945 ) ) ( not ( = ?auto_939935 ?auto_939946 ) ) ( not ( = ?auto_939935 ?auto_939951 ) ) ( not ( = ?auto_939936 ?auto_939937 ) ) ( not ( = ?auto_939936 ?auto_939938 ) ) ( not ( = ?auto_939936 ?auto_939939 ) ) ( not ( = ?auto_939936 ?auto_939940 ) ) ( not ( = ?auto_939936 ?auto_939941 ) ) ( not ( = ?auto_939936 ?auto_939942 ) ) ( not ( = ?auto_939936 ?auto_939943 ) ) ( not ( = ?auto_939936 ?auto_939944 ) ) ( not ( = ?auto_939936 ?auto_939945 ) ) ( not ( = ?auto_939936 ?auto_939946 ) ) ( not ( = ?auto_939936 ?auto_939951 ) ) ( not ( = ?auto_939937 ?auto_939938 ) ) ( not ( = ?auto_939937 ?auto_939939 ) ) ( not ( = ?auto_939937 ?auto_939940 ) ) ( not ( = ?auto_939937 ?auto_939941 ) ) ( not ( = ?auto_939937 ?auto_939942 ) ) ( not ( = ?auto_939937 ?auto_939943 ) ) ( not ( = ?auto_939937 ?auto_939944 ) ) ( not ( = ?auto_939937 ?auto_939945 ) ) ( not ( = ?auto_939937 ?auto_939946 ) ) ( not ( = ?auto_939937 ?auto_939951 ) ) ( not ( = ?auto_939938 ?auto_939939 ) ) ( not ( = ?auto_939938 ?auto_939940 ) ) ( not ( = ?auto_939938 ?auto_939941 ) ) ( not ( = ?auto_939938 ?auto_939942 ) ) ( not ( = ?auto_939938 ?auto_939943 ) ) ( not ( = ?auto_939938 ?auto_939944 ) ) ( not ( = ?auto_939938 ?auto_939945 ) ) ( not ( = ?auto_939938 ?auto_939946 ) ) ( not ( = ?auto_939938 ?auto_939951 ) ) ( not ( = ?auto_939939 ?auto_939940 ) ) ( not ( = ?auto_939939 ?auto_939941 ) ) ( not ( = ?auto_939939 ?auto_939942 ) ) ( not ( = ?auto_939939 ?auto_939943 ) ) ( not ( = ?auto_939939 ?auto_939944 ) ) ( not ( = ?auto_939939 ?auto_939945 ) ) ( not ( = ?auto_939939 ?auto_939946 ) ) ( not ( = ?auto_939939 ?auto_939951 ) ) ( not ( = ?auto_939940 ?auto_939941 ) ) ( not ( = ?auto_939940 ?auto_939942 ) ) ( not ( = ?auto_939940 ?auto_939943 ) ) ( not ( = ?auto_939940 ?auto_939944 ) ) ( not ( = ?auto_939940 ?auto_939945 ) ) ( not ( = ?auto_939940 ?auto_939946 ) ) ( not ( = ?auto_939940 ?auto_939951 ) ) ( not ( = ?auto_939941 ?auto_939942 ) ) ( not ( = ?auto_939941 ?auto_939943 ) ) ( not ( = ?auto_939941 ?auto_939944 ) ) ( not ( = ?auto_939941 ?auto_939945 ) ) ( not ( = ?auto_939941 ?auto_939946 ) ) ( not ( = ?auto_939941 ?auto_939951 ) ) ( not ( = ?auto_939942 ?auto_939943 ) ) ( not ( = ?auto_939942 ?auto_939944 ) ) ( not ( = ?auto_939942 ?auto_939945 ) ) ( not ( = ?auto_939942 ?auto_939946 ) ) ( not ( = ?auto_939942 ?auto_939951 ) ) ( not ( = ?auto_939943 ?auto_939944 ) ) ( not ( = ?auto_939943 ?auto_939945 ) ) ( not ( = ?auto_939943 ?auto_939946 ) ) ( not ( = ?auto_939943 ?auto_939951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939944 ?auto_939945 ?auto_939946 )
      ( MAKE-11CRATE-VERIFY ?auto_939935 ?auto_939936 ?auto_939937 ?auto_939938 ?auto_939939 ?auto_939940 ?auto_939941 ?auto_939942 ?auto_939943 ?auto_939944 ?auto_939945 ?auto_939946 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_940079 - SURFACE
      ?auto_940080 - SURFACE
      ?auto_940081 - SURFACE
      ?auto_940082 - SURFACE
      ?auto_940083 - SURFACE
      ?auto_940084 - SURFACE
      ?auto_940085 - SURFACE
      ?auto_940086 - SURFACE
      ?auto_940087 - SURFACE
      ?auto_940088 - SURFACE
      ?auto_940089 - SURFACE
      ?auto_940090 - SURFACE
    )
    :vars
    (
      ?auto_940092 - HOIST
      ?auto_940096 - PLACE
      ?auto_940093 - PLACE
      ?auto_940094 - HOIST
      ?auto_940091 - SURFACE
      ?auto_940095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_940092 ?auto_940096 ) ( IS-CRATE ?auto_940090 ) ( not ( = ?auto_940089 ?auto_940090 ) ) ( not ( = ?auto_940088 ?auto_940089 ) ) ( not ( = ?auto_940088 ?auto_940090 ) ) ( not ( = ?auto_940093 ?auto_940096 ) ) ( HOIST-AT ?auto_940094 ?auto_940093 ) ( not ( = ?auto_940092 ?auto_940094 ) ) ( AVAILABLE ?auto_940094 ) ( SURFACE-AT ?auto_940090 ?auto_940093 ) ( ON ?auto_940090 ?auto_940091 ) ( CLEAR ?auto_940090 ) ( not ( = ?auto_940089 ?auto_940091 ) ) ( not ( = ?auto_940090 ?auto_940091 ) ) ( not ( = ?auto_940088 ?auto_940091 ) ) ( TRUCK-AT ?auto_940095 ?auto_940096 ) ( SURFACE-AT ?auto_940088 ?auto_940096 ) ( CLEAR ?auto_940088 ) ( LIFTING ?auto_940092 ?auto_940089 ) ( IS-CRATE ?auto_940089 ) ( ON ?auto_940080 ?auto_940079 ) ( ON ?auto_940081 ?auto_940080 ) ( ON ?auto_940082 ?auto_940081 ) ( ON ?auto_940083 ?auto_940082 ) ( ON ?auto_940084 ?auto_940083 ) ( ON ?auto_940085 ?auto_940084 ) ( ON ?auto_940086 ?auto_940085 ) ( ON ?auto_940087 ?auto_940086 ) ( ON ?auto_940088 ?auto_940087 ) ( not ( = ?auto_940079 ?auto_940080 ) ) ( not ( = ?auto_940079 ?auto_940081 ) ) ( not ( = ?auto_940079 ?auto_940082 ) ) ( not ( = ?auto_940079 ?auto_940083 ) ) ( not ( = ?auto_940079 ?auto_940084 ) ) ( not ( = ?auto_940079 ?auto_940085 ) ) ( not ( = ?auto_940079 ?auto_940086 ) ) ( not ( = ?auto_940079 ?auto_940087 ) ) ( not ( = ?auto_940079 ?auto_940088 ) ) ( not ( = ?auto_940079 ?auto_940089 ) ) ( not ( = ?auto_940079 ?auto_940090 ) ) ( not ( = ?auto_940079 ?auto_940091 ) ) ( not ( = ?auto_940080 ?auto_940081 ) ) ( not ( = ?auto_940080 ?auto_940082 ) ) ( not ( = ?auto_940080 ?auto_940083 ) ) ( not ( = ?auto_940080 ?auto_940084 ) ) ( not ( = ?auto_940080 ?auto_940085 ) ) ( not ( = ?auto_940080 ?auto_940086 ) ) ( not ( = ?auto_940080 ?auto_940087 ) ) ( not ( = ?auto_940080 ?auto_940088 ) ) ( not ( = ?auto_940080 ?auto_940089 ) ) ( not ( = ?auto_940080 ?auto_940090 ) ) ( not ( = ?auto_940080 ?auto_940091 ) ) ( not ( = ?auto_940081 ?auto_940082 ) ) ( not ( = ?auto_940081 ?auto_940083 ) ) ( not ( = ?auto_940081 ?auto_940084 ) ) ( not ( = ?auto_940081 ?auto_940085 ) ) ( not ( = ?auto_940081 ?auto_940086 ) ) ( not ( = ?auto_940081 ?auto_940087 ) ) ( not ( = ?auto_940081 ?auto_940088 ) ) ( not ( = ?auto_940081 ?auto_940089 ) ) ( not ( = ?auto_940081 ?auto_940090 ) ) ( not ( = ?auto_940081 ?auto_940091 ) ) ( not ( = ?auto_940082 ?auto_940083 ) ) ( not ( = ?auto_940082 ?auto_940084 ) ) ( not ( = ?auto_940082 ?auto_940085 ) ) ( not ( = ?auto_940082 ?auto_940086 ) ) ( not ( = ?auto_940082 ?auto_940087 ) ) ( not ( = ?auto_940082 ?auto_940088 ) ) ( not ( = ?auto_940082 ?auto_940089 ) ) ( not ( = ?auto_940082 ?auto_940090 ) ) ( not ( = ?auto_940082 ?auto_940091 ) ) ( not ( = ?auto_940083 ?auto_940084 ) ) ( not ( = ?auto_940083 ?auto_940085 ) ) ( not ( = ?auto_940083 ?auto_940086 ) ) ( not ( = ?auto_940083 ?auto_940087 ) ) ( not ( = ?auto_940083 ?auto_940088 ) ) ( not ( = ?auto_940083 ?auto_940089 ) ) ( not ( = ?auto_940083 ?auto_940090 ) ) ( not ( = ?auto_940083 ?auto_940091 ) ) ( not ( = ?auto_940084 ?auto_940085 ) ) ( not ( = ?auto_940084 ?auto_940086 ) ) ( not ( = ?auto_940084 ?auto_940087 ) ) ( not ( = ?auto_940084 ?auto_940088 ) ) ( not ( = ?auto_940084 ?auto_940089 ) ) ( not ( = ?auto_940084 ?auto_940090 ) ) ( not ( = ?auto_940084 ?auto_940091 ) ) ( not ( = ?auto_940085 ?auto_940086 ) ) ( not ( = ?auto_940085 ?auto_940087 ) ) ( not ( = ?auto_940085 ?auto_940088 ) ) ( not ( = ?auto_940085 ?auto_940089 ) ) ( not ( = ?auto_940085 ?auto_940090 ) ) ( not ( = ?auto_940085 ?auto_940091 ) ) ( not ( = ?auto_940086 ?auto_940087 ) ) ( not ( = ?auto_940086 ?auto_940088 ) ) ( not ( = ?auto_940086 ?auto_940089 ) ) ( not ( = ?auto_940086 ?auto_940090 ) ) ( not ( = ?auto_940086 ?auto_940091 ) ) ( not ( = ?auto_940087 ?auto_940088 ) ) ( not ( = ?auto_940087 ?auto_940089 ) ) ( not ( = ?auto_940087 ?auto_940090 ) ) ( not ( = ?auto_940087 ?auto_940091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_940088 ?auto_940089 ?auto_940090 )
      ( MAKE-11CRATE-VERIFY ?auto_940079 ?auto_940080 ?auto_940081 ?auto_940082 ?auto_940083 ?auto_940084 ?auto_940085 ?auto_940086 ?auto_940087 ?auto_940088 ?auto_940089 ?auto_940090 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_940223 - SURFACE
      ?auto_940224 - SURFACE
      ?auto_940225 - SURFACE
      ?auto_940226 - SURFACE
      ?auto_940227 - SURFACE
      ?auto_940228 - SURFACE
      ?auto_940229 - SURFACE
      ?auto_940230 - SURFACE
      ?auto_940231 - SURFACE
      ?auto_940232 - SURFACE
      ?auto_940233 - SURFACE
      ?auto_940234 - SURFACE
    )
    :vars
    (
      ?auto_940236 - HOIST
      ?auto_940238 - PLACE
      ?auto_940240 - PLACE
      ?auto_940235 - HOIST
      ?auto_940239 - SURFACE
      ?auto_940237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_940236 ?auto_940238 ) ( IS-CRATE ?auto_940234 ) ( not ( = ?auto_940233 ?auto_940234 ) ) ( not ( = ?auto_940232 ?auto_940233 ) ) ( not ( = ?auto_940232 ?auto_940234 ) ) ( not ( = ?auto_940240 ?auto_940238 ) ) ( HOIST-AT ?auto_940235 ?auto_940240 ) ( not ( = ?auto_940236 ?auto_940235 ) ) ( AVAILABLE ?auto_940235 ) ( SURFACE-AT ?auto_940234 ?auto_940240 ) ( ON ?auto_940234 ?auto_940239 ) ( CLEAR ?auto_940234 ) ( not ( = ?auto_940233 ?auto_940239 ) ) ( not ( = ?auto_940234 ?auto_940239 ) ) ( not ( = ?auto_940232 ?auto_940239 ) ) ( TRUCK-AT ?auto_940237 ?auto_940238 ) ( SURFACE-AT ?auto_940232 ?auto_940238 ) ( CLEAR ?auto_940232 ) ( IS-CRATE ?auto_940233 ) ( AVAILABLE ?auto_940236 ) ( IN ?auto_940233 ?auto_940237 ) ( ON ?auto_940224 ?auto_940223 ) ( ON ?auto_940225 ?auto_940224 ) ( ON ?auto_940226 ?auto_940225 ) ( ON ?auto_940227 ?auto_940226 ) ( ON ?auto_940228 ?auto_940227 ) ( ON ?auto_940229 ?auto_940228 ) ( ON ?auto_940230 ?auto_940229 ) ( ON ?auto_940231 ?auto_940230 ) ( ON ?auto_940232 ?auto_940231 ) ( not ( = ?auto_940223 ?auto_940224 ) ) ( not ( = ?auto_940223 ?auto_940225 ) ) ( not ( = ?auto_940223 ?auto_940226 ) ) ( not ( = ?auto_940223 ?auto_940227 ) ) ( not ( = ?auto_940223 ?auto_940228 ) ) ( not ( = ?auto_940223 ?auto_940229 ) ) ( not ( = ?auto_940223 ?auto_940230 ) ) ( not ( = ?auto_940223 ?auto_940231 ) ) ( not ( = ?auto_940223 ?auto_940232 ) ) ( not ( = ?auto_940223 ?auto_940233 ) ) ( not ( = ?auto_940223 ?auto_940234 ) ) ( not ( = ?auto_940223 ?auto_940239 ) ) ( not ( = ?auto_940224 ?auto_940225 ) ) ( not ( = ?auto_940224 ?auto_940226 ) ) ( not ( = ?auto_940224 ?auto_940227 ) ) ( not ( = ?auto_940224 ?auto_940228 ) ) ( not ( = ?auto_940224 ?auto_940229 ) ) ( not ( = ?auto_940224 ?auto_940230 ) ) ( not ( = ?auto_940224 ?auto_940231 ) ) ( not ( = ?auto_940224 ?auto_940232 ) ) ( not ( = ?auto_940224 ?auto_940233 ) ) ( not ( = ?auto_940224 ?auto_940234 ) ) ( not ( = ?auto_940224 ?auto_940239 ) ) ( not ( = ?auto_940225 ?auto_940226 ) ) ( not ( = ?auto_940225 ?auto_940227 ) ) ( not ( = ?auto_940225 ?auto_940228 ) ) ( not ( = ?auto_940225 ?auto_940229 ) ) ( not ( = ?auto_940225 ?auto_940230 ) ) ( not ( = ?auto_940225 ?auto_940231 ) ) ( not ( = ?auto_940225 ?auto_940232 ) ) ( not ( = ?auto_940225 ?auto_940233 ) ) ( not ( = ?auto_940225 ?auto_940234 ) ) ( not ( = ?auto_940225 ?auto_940239 ) ) ( not ( = ?auto_940226 ?auto_940227 ) ) ( not ( = ?auto_940226 ?auto_940228 ) ) ( not ( = ?auto_940226 ?auto_940229 ) ) ( not ( = ?auto_940226 ?auto_940230 ) ) ( not ( = ?auto_940226 ?auto_940231 ) ) ( not ( = ?auto_940226 ?auto_940232 ) ) ( not ( = ?auto_940226 ?auto_940233 ) ) ( not ( = ?auto_940226 ?auto_940234 ) ) ( not ( = ?auto_940226 ?auto_940239 ) ) ( not ( = ?auto_940227 ?auto_940228 ) ) ( not ( = ?auto_940227 ?auto_940229 ) ) ( not ( = ?auto_940227 ?auto_940230 ) ) ( not ( = ?auto_940227 ?auto_940231 ) ) ( not ( = ?auto_940227 ?auto_940232 ) ) ( not ( = ?auto_940227 ?auto_940233 ) ) ( not ( = ?auto_940227 ?auto_940234 ) ) ( not ( = ?auto_940227 ?auto_940239 ) ) ( not ( = ?auto_940228 ?auto_940229 ) ) ( not ( = ?auto_940228 ?auto_940230 ) ) ( not ( = ?auto_940228 ?auto_940231 ) ) ( not ( = ?auto_940228 ?auto_940232 ) ) ( not ( = ?auto_940228 ?auto_940233 ) ) ( not ( = ?auto_940228 ?auto_940234 ) ) ( not ( = ?auto_940228 ?auto_940239 ) ) ( not ( = ?auto_940229 ?auto_940230 ) ) ( not ( = ?auto_940229 ?auto_940231 ) ) ( not ( = ?auto_940229 ?auto_940232 ) ) ( not ( = ?auto_940229 ?auto_940233 ) ) ( not ( = ?auto_940229 ?auto_940234 ) ) ( not ( = ?auto_940229 ?auto_940239 ) ) ( not ( = ?auto_940230 ?auto_940231 ) ) ( not ( = ?auto_940230 ?auto_940232 ) ) ( not ( = ?auto_940230 ?auto_940233 ) ) ( not ( = ?auto_940230 ?auto_940234 ) ) ( not ( = ?auto_940230 ?auto_940239 ) ) ( not ( = ?auto_940231 ?auto_940232 ) ) ( not ( = ?auto_940231 ?auto_940233 ) ) ( not ( = ?auto_940231 ?auto_940234 ) ) ( not ( = ?auto_940231 ?auto_940239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_940232 ?auto_940233 ?auto_940234 )
      ( MAKE-11CRATE-VERIFY ?auto_940223 ?auto_940224 ?auto_940225 ?auto_940226 ?auto_940227 ?auto_940228 ?auto_940229 ?auto_940230 ?auto_940231 ?auto_940232 ?auto_940233 ?auto_940234 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949493 - SURFACE
      ?auto_949494 - SURFACE
      ?auto_949495 - SURFACE
      ?auto_949496 - SURFACE
      ?auto_949497 - SURFACE
      ?auto_949498 - SURFACE
      ?auto_949499 - SURFACE
      ?auto_949500 - SURFACE
      ?auto_949501 - SURFACE
      ?auto_949502 - SURFACE
      ?auto_949503 - SURFACE
      ?auto_949504 - SURFACE
      ?auto_949505 - SURFACE
    )
    :vars
    (
      ?auto_949507 - HOIST
      ?auto_949506 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_949507 ?auto_949506 ) ( SURFACE-AT ?auto_949504 ?auto_949506 ) ( CLEAR ?auto_949504 ) ( LIFTING ?auto_949507 ?auto_949505 ) ( IS-CRATE ?auto_949505 ) ( not ( = ?auto_949504 ?auto_949505 ) ) ( ON ?auto_949494 ?auto_949493 ) ( ON ?auto_949495 ?auto_949494 ) ( ON ?auto_949496 ?auto_949495 ) ( ON ?auto_949497 ?auto_949496 ) ( ON ?auto_949498 ?auto_949497 ) ( ON ?auto_949499 ?auto_949498 ) ( ON ?auto_949500 ?auto_949499 ) ( ON ?auto_949501 ?auto_949500 ) ( ON ?auto_949502 ?auto_949501 ) ( ON ?auto_949503 ?auto_949502 ) ( ON ?auto_949504 ?auto_949503 ) ( not ( = ?auto_949493 ?auto_949494 ) ) ( not ( = ?auto_949493 ?auto_949495 ) ) ( not ( = ?auto_949493 ?auto_949496 ) ) ( not ( = ?auto_949493 ?auto_949497 ) ) ( not ( = ?auto_949493 ?auto_949498 ) ) ( not ( = ?auto_949493 ?auto_949499 ) ) ( not ( = ?auto_949493 ?auto_949500 ) ) ( not ( = ?auto_949493 ?auto_949501 ) ) ( not ( = ?auto_949493 ?auto_949502 ) ) ( not ( = ?auto_949493 ?auto_949503 ) ) ( not ( = ?auto_949493 ?auto_949504 ) ) ( not ( = ?auto_949493 ?auto_949505 ) ) ( not ( = ?auto_949494 ?auto_949495 ) ) ( not ( = ?auto_949494 ?auto_949496 ) ) ( not ( = ?auto_949494 ?auto_949497 ) ) ( not ( = ?auto_949494 ?auto_949498 ) ) ( not ( = ?auto_949494 ?auto_949499 ) ) ( not ( = ?auto_949494 ?auto_949500 ) ) ( not ( = ?auto_949494 ?auto_949501 ) ) ( not ( = ?auto_949494 ?auto_949502 ) ) ( not ( = ?auto_949494 ?auto_949503 ) ) ( not ( = ?auto_949494 ?auto_949504 ) ) ( not ( = ?auto_949494 ?auto_949505 ) ) ( not ( = ?auto_949495 ?auto_949496 ) ) ( not ( = ?auto_949495 ?auto_949497 ) ) ( not ( = ?auto_949495 ?auto_949498 ) ) ( not ( = ?auto_949495 ?auto_949499 ) ) ( not ( = ?auto_949495 ?auto_949500 ) ) ( not ( = ?auto_949495 ?auto_949501 ) ) ( not ( = ?auto_949495 ?auto_949502 ) ) ( not ( = ?auto_949495 ?auto_949503 ) ) ( not ( = ?auto_949495 ?auto_949504 ) ) ( not ( = ?auto_949495 ?auto_949505 ) ) ( not ( = ?auto_949496 ?auto_949497 ) ) ( not ( = ?auto_949496 ?auto_949498 ) ) ( not ( = ?auto_949496 ?auto_949499 ) ) ( not ( = ?auto_949496 ?auto_949500 ) ) ( not ( = ?auto_949496 ?auto_949501 ) ) ( not ( = ?auto_949496 ?auto_949502 ) ) ( not ( = ?auto_949496 ?auto_949503 ) ) ( not ( = ?auto_949496 ?auto_949504 ) ) ( not ( = ?auto_949496 ?auto_949505 ) ) ( not ( = ?auto_949497 ?auto_949498 ) ) ( not ( = ?auto_949497 ?auto_949499 ) ) ( not ( = ?auto_949497 ?auto_949500 ) ) ( not ( = ?auto_949497 ?auto_949501 ) ) ( not ( = ?auto_949497 ?auto_949502 ) ) ( not ( = ?auto_949497 ?auto_949503 ) ) ( not ( = ?auto_949497 ?auto_949504 ) ) ( not ( = ?auto_949497 ?auto_949505 ) ) ( not ( = ?auto_949498 ?auto_949499 ) ) ( not ( = ?auto_949498 ?auto_949500 ) ) ( not ( = ?auto_949498 ?auto_949501 ) ) ( not ( = ?auto_949498 ?auto_949502 ) ) ( not ( = ?auto_949498 ?auto_949503 ) ) ( not ( = ?auto_949498 ?auto_949504 ) ) ( not ( = ?auto_949498 ?auto_949505 ) ) ( not ( = ?auto_949499 ?auto_949500 ) ) ( not ( = ?auto_949499 ?auto_949501 ) ) ( not ( = ?auto_949499 ?auto_949502 ) ) ( not ( = ?auto_949499 ?auto_949503 ) ) ( not ( = ?auto_949499 ?auto_949504 ) ) ( not ( = ?auto_949499 ?auto_949505 ) ) ( not ( = ?auto_949500 ?auto_949501 ) ) ( not ( = ?auto_949500 ?auto_949502 ) ) ( not ( = ?auto_949500 ?auto_949503 ) ) ( not ( = ?auto_949500 ?auto_949504 ) ) ( not ( = ?auto_949500 ?auto_949505 ) ) ( not ( = ?auto_949501 ?auto_949502 ) ) ( not ( = ?auto_949501 ?auto_949503 ) ) ( not ( = ?auto_949501 ?auto_949504 ) ) ( not ( = ?auto_949501 ?auto_949505 ) ) ( not ( = ?auto_949502 ?auto_949503 ) ) ( not ( = ?auto_949502 ?auto_949504 ) ) ( not ( = ?auto_949502 ?auto_949505 ) ) ( not ( = ?auto_949503 ?auto_949504 ) ) ( not ( = ?auto_949503 ?auto_949505 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_949504 ?auto_949505 )
      ( MAKE-12CRATE-VERIFY ?auto_949493 ?auto_949494 ?auto_949495 ?auto_949496 ?auto_949497 ?auto_949498 ?auto_949499 ?auto_949500 ?auto_949501 ?auto_949502 ?auto_949503 ?auto_949504 ?auto_949505 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949618 - SURFACE
      ?auto_949619 - SURFACE
      ?auto_949620 - SURFACE
      ?auto_949621 - SURFACE
      ?auto_949622 - SURFACE
      ?auto_949623 - SURFACE
      ?auto_949624 - SURFACE
      ?auto_949625 - SURFACE
      ?auto_949626 - SURFACE
      ?auto_949627 - SURFACE
      ?auto_949628 - SURFACE
      ?auto_949629 - SURFACE
      ?auto_949630 - SURFACE
    )
    :vars
    (
      ?auto_949632 - HOIST
      ?auto_949631 - PLACE
      ?auto_949633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_949632 ?auto_949631 ) ( SURFACE-AT ?auto_949629 ?auto_949631 ) ( CLEAR ?auto_949629 ) ( IS-CRATE ?auto_949630 ) ( not ( = ?auto_949629 ?auto_949630 ) ) ( TRUCK-AT ?auto_949633 ?auto_949631 ) ( AVAILABLE ?auto_949632 ) ( IN ?auto_949630 ?auto_949633 ) ( ON ?auto_949629 ?auto_949628 ) ( not ( = ?auto_949628 ?auto_949629 ) ) ( not ( = ?auto_949628 ?auto_949630 ) ) ( ON ?auto_949619 ?auto_949618 ) ( ON ?auto_949620 ?auto_949619 ) ( ON ?auto_949621 ?auto_949620 ) ( ON ?auto_949622 ?auto_949621 ) ( ON ?auto_949623 ?auto_949622 ) ( ON ?auto_949624 ?auto_949623 ) ( ON ?auto_949625 ?auto_949624 ) ( ON ?auto_949626 ?auto_949625 ) ( ON ?auto_949627 ?auto_949626 ) ( ON ?auto_949628 ?auto_949627 ) ( not ( = ?auto_949618 ?auto_949619 ) ) ( not ( = ?auto_949618 ?auto_949620 ) ) ( not ( = ?auto_949618 ?auto_949621 ) ) ( not ( = ?auto_949618 ?auto_949622 ) ) ( not ( = ?auto_949618 ?auto_949623 ) ) ( not ( = ?auto_949618 ?auto_949624 ) ) ( not ( = ?auto_949618 ?auto_949625 ) ) ( not ( = ?auto_949618 ?auto_949626 ) ) ( not ( = ?auto_949618 ?auto_949627 ) ) ( not ( = ?auto_949618 ?auto_949628 ) ) ( not ( = ?auto_949618 ?auto_949629 ) ) ( not ( = ?auto_949618 ?auto_949630 ) ) ( not ( = ?auto_949619 ?auto_949620 ) ) ( not ( = ?auto_949619 ?auto_949621 ) ) ( not ( = ?auto_949619 ?auto_949622 ) ) ( not ( = ?auto_949619 ?auto_949623 ) ) ( not ( = ?auto_949619 ?auto_949624 ) ) ( not ( = ?auto_949619 ?auto_949625 ) ) ( not ( = ?auto_949619 ?auto_949626 ) ) ( not ( = ?auto_949619 ?auto_949627 ) ) ( not ( = ?auto_949619 ?auto_949628 ) ) ( not ( = ?auto_949619 ?auto_949629 ) ) ( not ( = ?auto_949619 ?auto_949630 ) ) ( not ( = ?auto_949620 ?auto_949621 ) ) ( not ( = ?auto_949620 ?auto_949622 ) ) ( not ( = ?auto_949620 ?auto_949623 ) ) ( not ( = ?auto_949620 ?auto_949624 ) ) ( not ( = ?auto_949620 ?auto_949625 ) ) ( not ( = ?auto_949620 ?auto_949626 ) ) ( not ( = ?auto_949620 ?auto_949627 ) ) ( not ( = ?auto_949620 ?auto_949628 ) ) ( not ( = ?auto_949620 ?auto_949629 ) ) ( not ( = ?auto_949620 ?auto_949630 ) ) ( not ( = ?auto_949621 ?auto_949622 ) ) ( not ( = ?auto_949621 ?auto_949623 ) ) ( not ( = ?auto_949621 ?auto_949624 ) ) ( not ( = ?auto_949621 ?auto_949625 ) ) ( not ( = ?auto_949621 ?auto_949626 ) ) ( not ( = ?auto_949621 ?auto_949627 ) ) ( not ( = ?auto_949621 ?auto_949628 ) ) ( not ( = ?auto_949621 ?auto_949629 ) ) ( not ( = ?auto_949621 ?auto_949630 ) ) ( not ( = ?auto_949622 ?auto_949623 ) ) ( not ( = ?auto_949622 ?auto_949624 ) ) ( not ( = ?auto_949622 ?auto_949625 ) ) ( not ( = ?auto_949622 ?auto_949626 ) ) ( not ( = ?auto_949622 ?auto_949627 ) ) ( not ( = ?auto_949622 ?auto_949628 ) ) ( not ( = ?auto_949622 ?auto_949629 ) ) ( not ( = ?auto_949622 ?auto_949630 ) ) ( not ( = ?auto_949623 ?auto_949624 ) ) ( not ( = ?auto_949623 ?auto_949625 ) ) ( not ( = ?auto_949623 ?auto_949626 ) ) ( not ( = ?auto_949623 ?auto_949627 ) ) ( not ( = ?auto_949623 ?auto_949628 ) ) ( not ( = ?auto_949623 ?auto_949629 ) ) ( not ( = ?auto_949623 ?auto_949630 ) ) ( not ( = ?auto_949624 ?auto_949625 ) ) ( not ( = ?auto_949624 ?auto_949626 ) ) ( not ( = ?auto_949624 ?auto_949627 ) ) ( not ( = ?auto_949624 ?auto_949628 ) ) ( not ( = ?auto_949624 ?auto_949629 ) ) ( not ( = ?auto_949624 ?auto_949630 ) ) ( not ( = ?auto_949625 ?auto_949626 ) ) ( not ( = ?auto_949625 ?auto_949627 ) ) ( not ( = ?auto_949625 ?auto_949628 ) ) ( not ( = ?auto_949625 ?auto_949629 ) ) ( not ( = ?auto_949625 ?auto_949630 ) ) ( not ( = ?auto_949626 ?auto_949627 ) ) ( not ( = ?auto_949626 ?auto_949628 ) ) ( not ( = ?auto_949626 ?auto_949629 ) ) ( not ( = ?auto_949626 ?auto_949630 ) ) ( not ( = ?auto_949627 ?auto_949628 ) ) ( not ( = ?auto_949627 ?auto_949629 ) ) ( not ( = ?auto_949627 ?auto_949630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949628 ?auto_949629 ?auto_949630 )
      ( MAKE-12CRATE-VERIFY ?auto_949618 ?auto_949619 ?auto_949620 ?auto_949621 ?auto_949622 ?auto_949623 ?auto_949624 ?auto_949625 ?auto_949626 ?auto_949627 ?auto_949628 ?auto_949629 ?auto_949630 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949756 - SURFACE
      ?auto_949757 - SURFACE
      ?auto_949758 - SURFACE
      ?auto_949759 - SURFACE
      ?auto_949760 - SURFACE
      ?auto_949761 - SURFACE
      ?auto_949762 - SURFACE
      ?auto_949763 - SURFACE
      ?auto_949764 - SURFACE
      ?auto_949765 - SURFACE
      ?auto_949766 - SURFACE
      ?auto_949767 - SURFACE
      ?auto_949768 - SURFACE
    )
    :vars
    (
      ?auto_949769 - HOIST
      ?auto_949771 - PLACE
      ?auto_949770 - TRUCK
      ?auto_949772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_949769 ?auto_949771 ) ( SURFACE-AT ?auto_949767 ?auto_949771 ) ( CLEAR ?auto_949767 ) ( IS-CRATE ?auto_949768 ) ( not ( = ?auto_949767 ?auto_949768 ) ) ( AVAILABLE ?auto_949769 ) ( IN ?auto_949768 ?auto_949770 ) ( ON ?auto_949767 ?auto_949766 ) ( not ( = ?auto_949766 ?auto_949767 ) ) ( not ( = ?auto_949766 ?auto_949768 ) ) ( TRUCK-AT ?auto_949770 ?auto_949772 ) ( not ( = ?auto_949772 ?auto_949771 ) ) ( ON ?auto_949757 ?auto_949756 ) ( ON ?auto_949758 ?auto_949757 ) ( ON ?auto_949759 ?auto_949758 ) ( ON ?auto_949760 ?auto_949759 ) ( ON ?auto_949761 ?auto_949760 ) ( ON ?auto_949762 ?auto_949761 ) ( ON ?auto_949763 ?auto_949762 ) ( ON ?auto_949764 ?auto_949763 ) ( ON ?auto_949765 ?auto_949764 ) ( ON ?auto_949766 ?auto_949765 ) ( not ( = ?auto_949756 ?auto_949757 ) ) ( not ( = ?auto_949756 ?auto_949758 ) ) ( not ( = ?auto_949756 ?auto_949759 ) ) ( not ( = ?auto_949756 ?auto_949760 ) ) ( not ( = ?auto_949756 ?auto_949761 ) ) ( not ( = ?auto_949756 ?auto_949762 ) ) ( not ( = ?auto_949756 ?auto_949763 ) ) ( not ( = ?auto_949756 ?auto_949764 ) ) ( not ( = ?auto_949756 ?auto_949765 ) ) ( not ( = ?auto_949756 ?auto_949766 ) ) ( not ( = ?auto_949756 ?auto_949767 ) ) ( not ( = ?auto_949756 ?auto_949768 ) ) ( not ( = ?auto_949757 ?auto_949758 ) ) ( not ( = ?auto_949757 ?auto_949759 ) ) ( not ( = ?auto_949757 ?auto_949760 ) ) ( not ( = ?auto_949757 ?auto_949761 ) ) ( not ( = ?auto_949757 ?auto_949762 ) ) ( not ( = ?auto_949757 ?auto_949763 ) ) ( not ( = ?auto_949757 ?auto_949764 ) ) ( not ( = ?auto_949757 ?auto_949765 ) ) ( not ( = ?auto_949757 ?auto_949766 ) ) ( not ( = ?auto_949757 ?auto_949767 ) ) ( not ( = ?auto_949757 ?auto_949768 ) ) ( not ( = ?auto_949758 ?auto_949759 ) ) ( not ( = ?auto_949758 ?auto_949760 ) ) ( not ( = ?auto_949758 ?auto_949761 ) ) ( not ( = ?auto_949758 ?auto_949762 ) ) ( not ( = ?auto_949758 ?auto_949763 ) ) ( not ( = ?auto_949758 ?auto_949764 ) ) ( not ( = ?auto_949758 ?auto_949765 ) ) ( not ( = ?auto_949758 ?auto_949766 ) ) ( not ( = ?auto_949758 ?auto_949767 ) ) ( not ( = ?auto_949758 ?auto_949768 ) ) ( not ( = ?auto_949759 ?auto_949760 ) ) ( not ( = ?auto_949759 ?auto_949761 ) ) ( not ( = ?auto_949759 ?auto_949762 ) ) ( not ( = ?auto_949759 ?auto_949763 ) ) ( not ( = ?auto_949759 ?auto_949764 ) ) ( not ( = ?auto_949759 ?auto_949765 ) ) ( not ( = ?auto_949759 ?auto_949766 ) ) ( not ( = ?auto_949759 ?auto_949767 ) ) ( not ( = ?auto_949759 ?auto_949768 ) ) ( not ( = ?auto_949760 ?auto_949761 ) ) ( not ( = ?auto_949760 ?auto_949762 ) ) ( not ( = ?auto_949760 ?auto_949763 ) ) ( not ( = ?auto_949760 ?auto_949764 ) ) ( not ( = ?auto_949760 ?auto_949765 ) ) ( not ( = ?auto_949760 ?auto_949766 ) ) ( not ( = ?auto_949760 ?auto_949767 ) ) ( not ( = ?auto_949760 ?auto_949768 ) ) ( not ( = ?auto_949761 ?auto_949762 ) ) ( not ( = ?auto_949761 ?auto_949763 ) ) ( not ( = ?auto_949761 ?auto_949764 ) ) ( not ( = ?auto_949761 ?auto_949765 ) ) ( not ( = ?auto_949761 ?auto_949766 ) ) ( not ( = ?auto_949761 ?auto_949767 ) ) ( not ( = ?auto_949761 ?auto_949768 ) ) ( not ( = ?auto_949762 ?auto_949763 ) ) ( not ( = ?auto_949762 ?auto_949764 ) ) ( not ( = ?auto_949762 ?auto_949765 ) ) ( not ( = ?auto_949762 ?auto_949766 ) ) ( not ( = ?auto_949762 ?auto_949767 ) ) ( not ( = ?auto_949762 ?auto_949768 ) ) ( not ( = ?auto_949763 ?auto_949764 ) ) ( not ( = ?auto_949763 ?auto_949765 ) ) ( not ( = ?auto_949763 ?auto_949766 ) ) ( not ( = ?auto_949763 ?auto_949767 ) ) ( not ( = ?auto_949763 ?auto_949768 ) ) ( not ( = ?auto_949764 ?auto_949765 ) ) ( not ( = ?auto_949764 ?auto_949766 ) ) ( not ( = ?auto_949764 ?auto_949767 ) ) ( not ( = ?auto_949764 ?auto_949768 ) ) ( not ( = ?auto_949765 ?auto_949766 ) ) ( not ( = ?auto_949765 ?auto_949767 ) ) ( not ( = ?auto_949765 ?auto_949768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949766 ?auto_949767 ?auto_949768 )
      ( MAKE-12CRATE-VERIFY ?auto_949756 ?auto_949757 ?auto_949758 ?auto_949759 ?auto_949760 ?auto_949761 ?auto_949762 ?auto_949763 ?auto_949764 ?auto_949765 ?auto_949766 ?auto_949767 ?auto_949768 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949906 - SURFACE
      ?auto_949907 - SURFACE
      ?auto_949908 - SURFACE
      ?auto_949909 - SURFACE
      ?auto_949910 - SURFACE
      ?auto_949911 - SURFACE
      ?auto_949912 - SURFACE
      ?auto_949913 - SURFACE
      ?auto_949914 - SURFACE
      ?auto_949915 - SURFACE
      ?auto_949916 - SURFACE
      ?auto_949917 - SURFACE
      ?auto_949918 - SURFACE
    )
    :vars
    (
      ?auto_949922 - HOIST
      ?auto_949920 - PLACE
      ?auto_949919 - TRUCK
      ?auto_949921 - PLACE
      ?auto_949923 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_949922 ?auto_949920 ) ( SURFACE-AT ?auto_949917 ?auto_949920 ) ( CLEAR ?auto_949917 ) ( IS-CRATE ?auto_949918 ) ( not ( = ?auto_949917 ?auto_949918 ) ) ( AVAILABLE ?auto_949922 ) ( ON ?auto_949917 ?auto_949916 ) ( not ( = ?auto_949916 ?auto_949917 ) ) ( not ( = ?auto_949916 ?auto_949918 ) ) ( TRUCK-AT ?auto_949919 ?auto_949921 ) ( not ( = ?auto_949921 ?auto_949920 ) ) ( HOIST-AT ?auto_949923 ?auto_949921 ) ( LIFTING ?auto_949923 ?auto_949918 ) ( not ( = ?auto_949922 ?auto_949923 ) ) ( ON ?auto_949907 ?auto_949906 ) ( ON ?auto_949908 ?auto_949907 ) ( ON ?auto_949909 ?auto_949908 ) ( ON ?auto_949910 ?auto_949909 ) ( ON ?auto_949911 ?auto_949910 ) ( ON ?auto_949912 ?auto_949911 ) ( ON ?auto_949913 ?auto_949912 ) ( ON ?auto_949914 ?auto_949913 ) ( ON ?auto_949915 ?auto_949914 ) ( ON ?auto_949916 ?auto_949915 ) ( not ( = ?auto_949906 ?auto_949907 ) ) ( not ( = ?auto_949906 ?auto_949908 ) ) ( not ( = ?auto_949906 ?auto_949909 ) ) ( not ( = ?auto_949906 ?auto_949910 ) ) ( not ( = ?auto_949906 ?auto_949911 ) ) ( not ( = ?auto_949906 ?auto_949912 ) ) ( not ( = ?auto_949906 ?auto_949913 ) ) ( not ( = ?auto_949906 ?auto_949914 ) ) ( not ( = ?auto_949906 ?auto_949915 ) ) ( not ( = ?auto_949906 ?auto_949916 ) ) ( not ( = ?auto_949906 ?auto_949917 ) ) ( not ( = ?auto_949906 ?auto_949918 ) ) ( not ( = ?auto_949907 ?auto_949908 ) ) ( not ( = ?auto_949907 ?auto_949909 ) ) ( not ( = ?auto_949907 ?auto_949910 ) ) ( not ( = ?auto_949907 ?auto_949911 ) ) ( not ( = ?auto_949907 ?auto_949912 ) ) ( not ( = ?auto_949907 ?auto_949913 ) ) ( not ( = ?auto_949907 ?auto_949914 ) ) ( not ( = ?auto_949907 ?auto_949915 ) ) ( not ( = ?auto_949907 ?auto_949916 ) ) ( not ( = ?auto_949907 ?auto_949917 ) ) ( not ( = ?auto_949907 ?auto_949918 ) ) ( not ( = ?auto_949908 ?auto_949909 ) ) ( not ( = ?auto_949908 ?auto_949910 ) ) ( not ( = ?auto_949908 ?auto_949911 ) ) ( not ( = ?auto_949908 ?auto_949912 ) ) ( not ( = ?auto_949908 ?auto_949913 ) ) ( not ( = ?auto_949908 ?auto_949914 ) ) ( not ( = ?auto_949908 ?auto_949915 ) ) ( not ( = ?auto_949908 ?auto_949916 ) ) ( not ( = ?auto_949908 ?auto_949917 ) ) ( not ( = ?auto_949908 ?auto_949918 ) ) ( not ( = ?auto_949909 ?auto_949910 ) ) ( not ( = ?auto_949909 ?auto_949911 ) ) ( not ( = ?auto_949909 ?auto_949912 ) ) ( not ( = ?auto_949909 ?auto_949913 ) ) ( not ( = ?auto_949909 ?auto_949914 ) ) ( not ( = ?auto_949909 ?auto_949915 ) ) ( not ( = ?auto_949909 ?auto_949916 ) ) ( not ( = ?auto_949909 ?auto_949917 ) ) ( not ( = ?auto_949909 ?auto_949918 ) ) ( not ( = ?auto_949910 ?auto_949911 ) ) ( not ( = ?auto_949910 ?auto_949912 ) ) ( not ( = ?auto_949910 ?auto_949913 ) ) ( not ( = ?auto_949910 ?auto_949914 ) ) ( not ( = ?auto_949910 ?auto_949915 ) ) ( not ( = ?auto_949910 ?auto_949916 ) ) ( not ( = ?auto_949910 ?auto_949917 ) ) ( not ( = ?auto_949910 ?auto_949918 ) ) ( not ( = ?auto_949911 ?auto_949912 ) ) ( not ( = ?auto_949911 ?auto_949913 ) ) ( not ( = ?auto_949911 ?auto_949914 ) ) ( not ( = ?auto_949911 ?auto_949915 ) ) ( not ( = ?auto_949911 ?auto_949916 ) ) ( not ( = ?auto_949911 ?auto_949917 ) ) ( not ( = ?auto_949911 ?auto_949918 ) ) ( not ( = ?auto_949912 ?auto_949913 ) ) ( not ( = ?auto_949912 ?auto_949914 ) ) ( not ( = ?auto_949912 ?auto_949915 ) ) ( not ( = ?auto_949912 ?auto_949916 ) ) ( not ( = ?auto_949912 ?auto_949917 ) ) ( not ( = ?auto_949912 ?auto_949918 ) ) ( not ( = ?auto_949913 ?auto_949914 ) ) ( not ( = ?auto_949913 ?auto_949915 ) ) ( not ( = ?auto_949913 ?auto_949916 ) ) ( not ( = ?auto_949913 ?auto_949917 ) ) ( not ( = ?auto_949913 ?auto_949918 ) ) ( not ( = ?auto_949914 ?auto_949915 ) ) ( not ( = ?auto_949914 ?auto_949916 ) ) ( not ( = ?auto_949914 ?auto_949917 ) ) ( not ( = ?auto_949914 ?auto_949918 ) ) ( not ( = ?auto_949915 ?auto_949916 ) ) ( not ( = ?auto_949915 ?auto_949917 ) ) ( not ( = ?auto_949915 ?auto_949918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949916 ?auto_949917 ?auto_949918 )
      ( MAKE-12CRATE-VERIFY ?auto_949906 ?auto_949907 ?auto_949908 ?auto_949909 ?auto_949910 ?auto_949911 ?auto_949912 ?auto_949913 ?auto_949914 ?auto_949915 ?auto_949916 ?auto_949917 ?auto_949918 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950068 - SURFACE
      ?auto_950069 - SURFACE
      ?auto_950070 - SURFACE
      ?auto_950071 - SURFACE
      ?auto_950072 - SURFACE
      ?auto_950073 - SURFACE
      ?auto_950074 - SURFACE
      ?auto_950075 - SURFACE
      ?auto_950076 - SURFACE
      ?auto_950077 - SURFACE
      ?auto_950078 - SURFACE
      ?auto_950079 - SURFACE
      ?auto_950080 - SURFACE
    )
    :vars
    (
      ?auto_950085 - HOIST
      ?auto_950081 - PLACE
      ?auto_950086 - TRUCK
      ?auto_950082 - PLACE
      ?auto_950083 - HOIST
      ?auto_950084 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_950085 ?auto_950081 ) ( SURFACE-AT ?auto_950079 ?auto_950081 ) ( CLEAR ?auto_950079 ) ( IS-CRATE ?auto_950080 ) ( not ( = ?auto_950079 ?auto_950080 ) ) ( AVAILABLE ?auto_950085 ) ( ON ?auto_950079 ?auto_950078 ) ( not ( = ?auto_950078 ?auto_950079 ) ) ( not ( = ?auto_950078 ?auto_950080 ) ) ( TRUCK-AT ?auto_950086 ?auto_950082 ) ( not ( = ?auto_950082 ?auto_950081 ) ) ( HOIST-AT ?auto_950083 ?auto_950082 ) ( not ( = ?auto_950085 ?auto_950083 ) ) ( AVAILABLE ?auto_950083 ) ( SURFACE-AT ?auto_950080 ?auto_950082 ) ( ON ?auto_950080 ?auto_950084 ) ( CLEAR ?auto_950080 ) ( not ( = ?auto_950079 ?auto_950084 ) ) ( not ( = ?auto_950080 ?auto_950084 ) ) ( not ( = ?auto_950078 ?auto_950084 ) ) ( ON ?auto_950069 ?auto_950068 ) ( ON ?auto_950070 ?auto_950069 ) ( ON ?auto_950071 ?auto_950070 ) ( ON ?auto_950072 ?auto_950071 ) ( ON ?auto_950073 ?auto_950072 ) ( ON ?auto_950074 ?auto_950073 ) ( ON ?auto_950075 ?auto_950074 ) ( ON ?auto_950076 ?auto_950075 ) ( ON ?auto_950077 ?auto_950076 ) ( ON ?auto_950078 ?auto_950077 ) ( not ( = ?auto_950068 ?auto_950069 ) ) ( not ( = ?auto_950068 ?auto_950070 ) ) ( not ( = ?auto_950068 ?auto_950071 ) ) ( not ( = ?auto_950068 ?auto_950072 ) ) ( not ( = ?auto_950068 ?auto_950073 ) ) ( not ( = ?auto_950068 ?auto_950074 ) ) ( not ( = ?auto_950068 ?auto_950075 ) ) ( not ( = ?auto_950068 ?auto_950076 ) ) ( not ( = ?auto_950068 ?auto_950077 ) ) ( not ( = ?auto_950068 ?auto_950078 ) ) ( not ( = ?auto_950068 ?auto_950079 ) ) ( not ( = ?auto_950068 ?auto_950080 ) ) ( not ( = ?auto_950068 ?auto_950084 ) ) ( not ( = ?auto_950069 ?auto_950070 ) ) ( not ( = ?auto_950069 ?auto_950071 ) ) ( not ( = ?auto_950069 ?auto_950072 ) ) ( not ( = ?auto_950069 ?auto_950073 ) ) ( not ( = ?auto_950069 ?auto_950074 ) ) ( not ( = ?auto_950069 ?auto_950075 ) ) ( not ( = ?auto_950069 ?auto_950076 ) ) ( not ( = ?auto_950069 ?auto_950077 ) ) ( not ( = ?auto_950069 ?auto_950078 ) ) ( not ( = ?auto_950069 ?auto_950079 ) ) ( not ( = ?auto_950069 ?auto_950080 ) ) ( not ( = ?auto_950069 ?auto_950084 ) ) ( not ( = ?auto_950070 ?auto_950071 ) ) ( not ( = ?auto_950070 ?auto_950072 ) ) ( not ( = ?auto_950070 ?auto_950073 ) ) ( not ( = ?auto_950070 ?auto_950074 ) ) ( not ( = ?auto_950070 ?auto_950075 ) ) ( not ( = ?auto_950070 ?auto_950076 ) ) ( not ( = ?auto_950070 ?auto_950077 ) ) ( not ( = ?auto_950070 ?auto_950078 ) ) ( not ( = ?auto_950070 ?auto_950079 ) ) ( not ( = ?auto_950070 ?auto_950080 ) ) ( not ( = ?auto_950070 ?auto_950084 ) ) ( not ( = ?auto_950071 ?auto_950072 ) ) ( not ( = ?auto_950071 ?auto_950073 ) ) ( not ( = ?auto_950071 ?auto_950074 ) ) ( not ( = ?auto_950071 ?auto_950075 ) ) ( not ( = ?auto_950071 ?auto_950076 ) ) ( not ( = ?auto_950071 ?auto_950077 ) ) ( not ( = ?auto_950071 ?auto_950078 ) ) ( not ( = ?auto_950071 ?auto_950079 ) ) ( not ( = ?auto_950071 ?auto_950080 ) ) ( not ( = ?auto_950071 ?auto_950084 ) ) ( not ( = ?auto_950072 ?auto_950073 ) ) ( not ( = ?auto_950072 ?auto_950074 ) ) ( not ( = ?auto_950072 ?auto_950075 ) ) ( not ( = ?auto_950072 ?auto_950076 ) ) ( not ( = ?auto_950072 ?auto_950077 ) ) ( not ( = ?auto_950072 ?auto_950078 ) ) ( not ( = ?auto_950072 ?auto_950079 ) ) ( not ( = ?auto_950072 ?auto_950080 ) ) ( not ( = ?auto_950072 ?auto_950084 ) ) ( not ( = ?auto_950073 ?auto_950074 ) ) ( not ( = ?auto_950073 ?auto_950075 ) ) ( not ( = ?auto_950073 ?auto_950076 ) ) ( not ( = ?auto_950073 ?auto_950077 ) ) ( not ( = ?auto_950073 ?auto_950078 ) ) ( not ( = ?auto_950073 ?auto_950079 ) ) ( not ( = ?auto_950073 ?auto_950080 ) ) ( not ( = ?auto_950073 ?auto_950084 ) ) ( not ( = ?auto_950074 ?auto_950075 ) ) ( not ( = ?auto_950074 ?auto_950076 ) ) ( not ( = ?auto_950074 ?auto_950077 ) ) ( not ( = ?auto_950074 ?auto_950078 ) ) ( not ( = ?auto_950074 ?auto_950079 ) ) ( not ( = ?auto_950074 ?auto_950080 ) ) ( not ( = ?auto_950074 ?auto_950084 ) ) ( not ( = ?auto_950075 ?auto_950076 ) ) ( not ( = ?auto_950075 ?auto_950077 ) ) ( not ( = ?auto_950075 ?auto_950078 ) ) ( not ( = ?auto_950075 ?auto_950079 ) ) ( not ( = ?auto_950075 ?auto_950080 ) ) ( not ( = ?auto_950075 ?auto_950084 ) ) ( not ( = ?auto_950076 ?auto_950077 ) ) ( not ( = ?auto_950076 ?auto_950078 ) ) ( not ( = ?auto_950076 ?auto_950079 ) ) ( not ( = ?auto_950076 ?auto_950080 ) ) ( not ( = ?auto_950076 ?auto_950084 ) ) ( not ( = ?auto_950077 ?auto_950078 ) ) ( not ( = ?auto_950077 ?auto_950079 ) ) ( not ( = ?auto_950077 ?auto_950080 ) ) ( not ( = ?auto_950077 ?auto_950084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950078 ?auto_950079 ?auto_950080 )
      ( MAKE-12CRATE-VERIFY ?auto_950068 ?auto_950069 ?auto_950070 ?auto_950071 ?auto_950072 ?auto_950073 ?auto_950074 ?auto_950075 ?auto_950076 ?auto_950077 ?auto_950078 ?auto_950079 ?auto_950080 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950231 - SURFACE
      ?auto_950232 - SURFACE
      ?auto_950233 - SURFACE
      ?auto_950234 - SURFACE
      ?auto_950235 - SURFACE
      ?auto_950236 - SURFACE
      ?auto_950237 - SURFACE
      ?auto_950238 - SURFACE
      ?auto_950239 - SURFACE
      ?auto_950240 - SURFACE
      ?auto_950241 - SURFACE
      ?auto_950242 - SURFACE
      ?auto_950243 - SURFACE
    )
    :vars
    (
      ?auto_950246 - HOIST
      ?auto_950247 - PLACE
      ?auto_950245 - PLACE
      ?auto_950249 - HOIST
      ?auto_950248 - SURFACE
      ?auto_950244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_950246 ?auto_950247 ) ( SURFACE-AT ?auto_950242 ?auto_950247 ) ( CLEAR ?auto_950242 ) ( IS-CRATE ?auto_950243 ) ( not ( = ?auto_950242 ?auto_950243 ) ) ( AVAILABLE ?auto_950246 ) ( ON ?auto_950242 ?auto_950241 ) ( not ( = ?auto_950241 ?auto_950242 ) ) ( not ( = ?auto_950241 ?auto_950243 ) ) ( not ( = ?auto_950245 ?auto_950247 ) ) ( HOIST-AT ?auto_950249 ?auto_950245 ) ( not ( = ?auto_950246 ?auto_950249 ) ) ( AVAILABLE ?auto_950249 ) ( SURFACE-AT ?auto_950243 ?auto_950245 ) ( ON ?auto_950243 ?auto_950248 ) ( CLEAR ?auto_950243 ) ( not ( = ?auto_950242 ?auto_950248 ) ) ( not ( = ?auto_950243 ?auto_950248 ) ) ( not ( = ?auto_950241 ?auto_950248 ) ) ( TRUCK-AT ?auto_950244 ?auto_950247 ) ( ON ?auto_950232 ?auto_950231 ) ( ON ?auto_950233 ?auto_950232 ) ( ON ?auto_950234 ?auto_950233 ) ( ON ?auto_950235 ?auto_950234 ) ( ON ?auto_950236 ?auto_950235 ) ( ON ?auto_950237 ?auto_950236 ) ( ON ?auto_950238 ?auto_950237 ) ( ON ?auto_950239 ?auto_950238 ) ( ON ?auto_950240 ?auto_950239 ) ( ON ?auto_950241 ?auto_950240 ) ( not ( = ?auto_950231 ?auto_950232 ) ) ( not ( = ?auto_950231 ?auto_950233 ) ) ( not ( = ?auto_950231 ?auto_950234 ) ) ( not ( = ?auto_950231 ?auto_950235 ) ) ( not ( = ?auto_950231 ?auto_950236 ) ) ( not ( = ?auto_950231 ?auto_950237 ) ) ( not ( = ?auto_950231 ?auto_950238 ) ) ( not ( = ?auto_950231 ?auto_950239 ) ) ( not ( = ?auto_950231 ?auto_950240 ) ) ( not ( = ?auto_950231 ?auto_950241 ) ) ( not ( = ?auto_950231 ?auto_950242 ) ) ( not ( = ?auto_950231 ?auto_950243 ) ) ( not ( = ?auto_950231 ?auto_950248 ) ) ( not ( = ?auto_950232 ?auto_950233 ) ) ( not ( = ?auto_950232 ?auto_950234 ) ) ( not ( = ?auto_950232 ?auto_950235 ) ) ( not ( = ?auto_950232 ?auto_950236 ) ) ( not ( = ?auto_950232 ?auto_950237 ) ) ( not ( = ?auto_950232 ?auto_950238 ) ) ( not ( = ?auto_950232 ?auto_950239 ) ) ( not ( = ?auto_950232 ?auto_950240 ) ) ( not ( = ?auto_950232 ?auto_950241 ) ) ( not ( = ?auto_950232 ?auto_950242 ) ) ( not ( = ?auto_950232 ?auto_950243 ) ) ( not ( = ?auto_950232 ?auto_950248 ) ) ( not ( = ?auto_950233 ?auto_950234 ) ) ( not ( = ?auto_950233 ?auto_950235 ) ) ( not ( = ?auto_950233 ?auto_950236 ) ) ( not ( = ?auto_950233 ?auto_950237 ) ) ( not ( = ?auto_950233 ?auto_950238 ) ) ( not ( = ?auto_950233 ?auto_950239 ) ) ( not ( = ?auto_950233 ?auto_950240 ) ) ( not ( = ?auto_950233 ?auto_950241 ) ) ( not ( = ?auto_950233 ?auto_950242 ) ) ( not ( = ?auto_950233 ?auto_950243 ) ) ( not ( = ?auto_950233 ?auto_950248 ) ) ( not ( = ?auto_950234 ?auto_950235 ) ) ( not ( = ?auto_950234 ?auto_950236 ) ) ( not ( = ?auto_950234 ?auto_950237 ) ) ( not ( = ?auto_950234 ?auto_950238 ) ) ( not ( = ?auto_950234 ?auto_950239 ) ) ( not ( = ?auto_950234 ?auto_950240 ) ) ( not ( = ?auto_950234 ?auto_950241 ) ) ( not ( = ?auto_950234 ?auto_950242 ) ) ( not ( = ?auto_950234 ?auto_950243 ) ) ( not ( = ?auto_950234 ?auto_950248 ) ) ( not ( = ?auto_950235 ?auto_950236 ) ) ( not ( = ?auto_950235 ?auto_950237 ) ) ( not ( = ?auto_950235 ?auto_950238 ) ) ( not ( = ?auto_950235 ?auto_950239 ) ) ( not ( = ?auto_950235 ?auto_950240 ) ) ( not ( = ?auto_950235 ?auto_950241 ) ) ( not ( = ?auto_950235 ?auto_950242 ) ) ( not ( = ?auto_950235 ?auto_950243 ) ) ( not ( = ?auto_950235 ?auto_950248 ) ) ( not ( = ?auto_950236 ?auto_950237 ) ) ( not ( = ?auto_950236 ?auto_950238 ) ) ( not ( = ?auto_950236 ?auto_950239 ) ) ( not ( = ?auto_950236 ?auto_950240 ) ) ( not ( = ?auto_950236 ?auto_950241 ) ) ( not ( = ?auto_950236 ?auto_950242 ) ) ( not ( = ?auto_950236 ?auto_950243 ) ) ( not ( = ?auto_950236 ?auto_950248 ) ) ( not ( = ?auto_950237 ?auto_950238 ) ) ( not ( = ?auto_950237 ?auto_950239 ) ) ( not ( = ?auto_950237 ?auto_950240 ) ) ( not ( = ?auto_950237 ?auto_950241 ) ) ( not ( = ?auto_950237 ?auto_950242 ) ) ( not ( = ?auto_950237 ?auto_950243 ) ) ( not ( = ?auto_950237 ?auto_950248 ) ) ( not ( = ?auto_950238 ?auto_950239 ) ) ( not ( = ?auto_950238 ?auto_950240 ) ) ( not ( = ?auto_950238 ?auto_950241 ) ) ( not ( = ?auto_950238 ?auto_950242 ) ) ( not ( = ?auto_950238 ?auto_950243 ) ) ( not ( = ?auto_950238 ?auto_950248 ) ) ( not ( = ?auto_950239 ?auto_950240 ) ) ( not ( = ?auto_950239 ?auto_950241 ) ) ( not ( = ?auto_950239 ?auto_950242 ) ) ( not ( = ?auto_950239 ?auto_950243 ) ) ( not ( = ?auto_950239 ?auto_950248 ) ) ( not ( = ?auto_950240 ?auto_950241 ) ) ( not ( = ?auto_950240 ?auto_950242 ) ) ( not ( = ?auto_950240 ?auto_950243 ) ) ( not ( = ?auto_950240 ?auto_950248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950241 ?auto_950242 ?auto_950243 )
      ( MAKE-12CRATE-VERIFY ?auto_950231 ?auto_950232 ?auto_950233 ?auto_950234 ?auto_950235 ?auto_950236 ?auto_950237 ?auto_950238 ?auto_950239 ?auto_950240 ?auto_950241 ?auto_950242 ?auto_950243 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950394 - SURFACE
      ?auto_950395 - SURFACE
      ?auto_950396 - SURFACE
      ?auto_950397 - SURFACE
      ?auto_950398 - SURFACE
      ?auto_950399 - SURFACE
      ?auto_950400 - SURFACE
      ?auto_950401 - SURFACE
      ?auto_950402 - SURFACE
      ?auto_950403 - SURFACE
      ?auto_950404 - SURFACE
      ?auto_950405 - SURFACE
      ?auto_950406 - SURFACE
    )
    :vars
    (
      ?auto_950411 - HOIST
      ?auto_950412 - PLACE
      ?auto_950410 - PLACE
      ?auto_950408 - HOIST
      ?auto_950409 - SURFACE
      ?auto_950407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_950411 ?auto_950412 ) ( IS-CRATE ?auto_950406 ) ( not ( = ?auto_950405 ?auto_950406 ) ) ( not ( = ?auto_950404 ?auto_950405 ) ) ( not ( = ?auto_950404 ?auto_950406 ) ) ( not ( = ?auto_950410 ?auto_950412 ) ) ( HOIST-AT ?auto_950408 ?auto_950410 ) ( not ( = ?auto_950411 ?auto_950408 ) ) ( AVAILABLE ?auto_950408 ) ( SURFACE-AT ?auto_950406 ?auto_950410 ) ( ON ?auto_950406 ?auto_950409 ) ( CLEAR ?auto_950406 ) ( not ( = ?auto_950405 ?auto_950409 ) ) ( not ( = ?auto_950406 ?auto_950409 ) ) ( not ( = ?auto_950404 ?auto_950409 ) ) ( TRUCK-AT ?auto_950407 ?auto_950412 ) ( SURFACE-AT ?auto_950404 ?auto_950412 ) ( CLEAR ?auto_950404 ) ( LIFTING ?auto_950411 ?auto_950405 ) ( IS-CRATE ?auto_950405 ) ( ON ?auto_950395 ?auto_950394 ) ( ON ?auto_950396 ?auto_950395 ) ( ON ?auto_950397 ?auto_950396 ) ( ON ?auto_950398 ?auto_950397 ) ( ON ?auto_950399 ?auto_950398 ) ( ON ?auto_950400 ?auto_950399 ) ( ON ?auto_950401 ?auto_950400 ) ( ON ?auto_950402 ?auto_950401 ) ( ON ?auto_950403 ?auto_950402 ) ( ON ?auto_950404 ?auto_950403 ) ( not ( = ?auto_950394 ?auto_950395 ) ) ( not ( = ?auto_950394 ?auto_950396 ) ) ( not ( = ?auto_950394 ?auto_950397 ) ) ( not ( = ?auto_950394 ?auto_950398 ) ) ( not ( = ?auto_950394 ?auto_950399 ) ) ( not ( = ?auto_950394 ?auto_950400 ) ) ( not ( = ?auto_950394 ?auto_950401 ) ) ( not ( = ?auto_950394 ?auto_950402 ) ) ( not ( = ?auto_950394 ?auto_950403 ) ) ( not ( = ?auto_950394 ?auto_950404 ) ) ( not ( = ?auto_950394 ?auto_950405 ) ) ( not ( = ?auto_950394 ?auto_950406 ) ) ( not ( = ?auto_950394 ?auto_950409 ) ) ( not ( = ?auto_950395 ?auto_950396 ) ) ( not ( = ?auto_950395 ?auto_950397 ) ) ( not ( = ?auto_950395 ?auto_950398 ) ) ( not ( = ?auto_950395 ?auto_950399 ) ) ( not ( = ?auto_950395 ?auto_950400 ) ) ( not ( = ?auto_950395 ?auto_950401 ) ) ( not ( = ?auto_950395 ?auto_950402 ) ) ( not ( = ?auto_950395 ?auto_950403 ) ) ( not ( = ?auto_950395 ?auto_950404 ) ) ( not ( = ?auto_950395 ?auto_950405 ) ) ( not ( = ?auto_950395 ?auto_950406 ) ) ( not ( = ?auto_950395 ?auto_950409 ) ) ( not ( = ?auto_950396 ?auto_950397 ) ) ( not ( = ?auto_950396 ?auto_950398 ) ) ( not ( = ?auto_950396 ?auto_950399 ) ) ( not ( = ?auto_950396 ?auto_950400 ) ) ( not ( = ?auto_950396 ?auto_950401 ) ) ( not ( = ?auto_950396 ?auto_950402 ) ) ( not ( = ?auto_950396 ?auto_950403 ) ) ( not ( = ?auto_950396 ?auto_950404 ) ) ( not ( = ?auto_950396 ?auto_950405 ) ) ( not ( = ?auto_950396 ?auto_950406 ) ) ( not ( = ?auto_950396 ?auto_950409 ) ) ( not ( = ?auto_950397 ?auto_950398 ) ) ( not ( = ?auto_950397 ?auto_950399 ) ) ( not ( = ?auto_950397 ?auto_950400 ) ) ( not ( = ?auto_950397 ?auto_950401 ) ) ( not ( = ?auto_950397 ?auto_950402 ) ) ( not ( = ?auto_950397 ?auto_950403 ) ) ( not ( = ?auto_950397 ?auto_950404 ) ) ( not ( = ?auto_950397 ?auto_950405 ) ) ( not ( = ?auto_950397 ?auto_950406 ) ) ( not ( = ?auto_950397 ?auto_950409 ) ) ( not ( = ?auto_950398 ?auto_950399 ) ) ( not ( = ?auto_950398 ?auto_950400 ) ) ( not ( = ?auto_950398 ?auto_950401 ) ) ( not ( = ?auto_950398 ?auto_950402 ) ) ( not ( = ?auto_950398 ?auto_950403 ) ) ( not ( = ?auto_950398 ?auto_950404 ) ) ( not ( = ?auto_950398 ?auto_950405 ) ) ( not ( = ?auto_950398 ?auto_950406 ) ) ( not ( = ?auto_950398 ?auto_950409 ) ) ( not ( = ?auto_950399 ?auto_950400 ) ) ( not ( = ?auto_950399 ?auto_950401 ) ) ( not ( = ?auto_950399 ?auto_950402 ) ) ( not ( = ?auto_950399 ?auto_950403 ) ) ( not ( = ?auto_950399 ?auto_950404 ) ) ( not ( = ?auto_950399 ?auto_950405 ) ) ( not ( = ?auto_950399 ?auto_950406 ) ) ( not ( = ?auto_950399 ?auto_950409 ) ) ( not ( = ?auto_950400 ?auto_950401 ) ) ( not ( = ?auto_950400 ?auto_950402 ) ) ( not ( = ?auto_950400 ?auto_950403 ) ) ( not ( = ?auto_950400 ?auto_950404 ) ) ( not ( = ?auto_950400 ?auto_950405 ) ) ( not ( = ?auto_950400 ?auto_950406 ) ) ( not ( = ?auto_950400 ?auto_950409 ) ) ( not ( = ?auto_950401 ?auto_950402 ) ) ( not ( = ?auto_950401 ?auto_950403 ) ) ( not ( = ?auto_950401 ?auto_950404 ) ) ( not ( = ?auto_950401 ?auto_950405 ) ) ( not ( = ?auto_950401 ?auto_950406 ) ) ( not ( = ?auto_950401 ?auto_950409 ) ) ( not ( = ?auto_950402 ?auto_950403 ) ) ( not ( = ?auto_950402 ?auto_950404 ) ) ( not ( = ?auto_950402 ?auto_950405 ) ) ( not ( = ?auto_950402 ?auto_950406 ) ) ( not ( = ?auto_950402 ?auto_950409 ) ) ( not ( = ?auto_950403 ?auto_950404 ) ) ( not ( = ?auto_950403 ?auto_950405 ) ) ( not ( = ?auto_950403 ?auto_950406 ) ) ( not ( = ?auto_950403 ?auto_950409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950404 ?auto_950405 ?auto_950406 )
      ( MAKE-12CRATE-VERIFY ?auto_950394 ?auto_950395 ?auto_950396 ?auto_950397 ?auto_950398 ?auto_950399 ?auto_950400 ?auto_950401 ?auto_950402 ?auto_950403 ?auto_950404 ?auto_950405 ?auto_950406 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950557 - SURFACE
      ?auto_950558 - SURFACE
      ?auto_950559 - SURFACE
      ?auto_950560 - SURFACE
      ?auto_950561 - SURFACE
      ?auto_950562 - SURFACE
      ?auto_950563 - SURFACE
      ?auto_950564 - SURFACE
      ?auto_950565 - SURFACE
      ?auto_950566 - SURFACE
      ?auto_950567 - SURFACE
      ?auto_950568 - SURFACE
      ?auto_950569 - SURFACE
    )
    :vars
    (
      ?auto_950571 - HOIST
      ?auto_950574 - PLACE
      ?auto_950575 - PLACE
      ?auto_950572 - HOIST
      ?auto_950573 - SURFACE
      ?auto_950570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_950571 ?auto_950574 ) ( IS-CRATE ?auto_950569 ) ( not ( = ?auto_950568 ?auto_950569 ) ) ( not ( = ?auto_950567 ?auto_950568 ) ) ( not ( = ?auto_950567 ?auto_950569 ) ) ( not ( = ?auto_950575 ?auto_950574 ) ) ( HOIST-AT ?auto_950572 ?auto_950575 ) ( not ( = ?auto_950571 ?auto_950572 ) ) ( AVAILABLE ?auto_950572 ) ( SURFACE-AT ?auto_950569 ?auto_950575 ) ( ON ?auto_950569 ?auto_950573 ) ( CLEAR ?auto_950569 ) ( not ( = ?auto_950568 ?auto_950573 ) ) ( not ( = ?auto_950569 ?auto_950573 ) ) ( not ( = ?auto_950567 ?auto_950573 ) ) ( TRUCK-AT ?auto_950570 ?auto_950574 ) ( SURFACE-AT ?auto_950567 ?auto_950574 ) ( CLEAR ?auto_950567 ) ( IS-CRATE ?auto_950568 ) ( AVAILABLE ?auto_950571 ) ( IN ?auto_950568 ?auto_950570 ) ( ON ?auto_950558 ?auto_950557 ) ( ON ?auto_950559 ?auto_950558 ) ( ON ?auto_950560 ?auto_950559 ) ( ON ?auto_950561 ?auto_950560 ) ( ON ?auto_950562 ?auto_950561 ) ( ON ?auto_950563 ?auto_950562 ) ( ON ?auto_950564 ?auto_950563 ) ( ON ?auto_950565 ?auto_950564 ) ( ON ?auto_950566 ?auto_950565 ) ( ON ?auto_950567 ?auto_950566 ) ( not ( = ?auto_950557 ?auto_950558 ) ) ( not ( = ?auto_950557 ?auto_950559 ) ) ( not ( = ?auto_950557 ?auto_950560 ) ) ( not ( = ?auto_950557 ?auto_950561 ) ) ( not ( = ?auto_950557 ?auto_950562 ) ) ( not ( = ?auto_950557 ?auto_950563 ) ) ( not ( = ?auto_950557 ?auto_950564 ) ) ( not ( = ?auto_950557 ?auto_950565 ) ) ( not ( = ?auto_950557 ?auto_950566 ) ) ( not ( = ?auto_950557 ?auto_950567 ) ) ( not ( = ?auto_950557 ?auto_950568 ) ) ( not ( = ?auto_950557 ?auto_950569 ) ) ( not ( = ?auto_950557 ?auto_950573 ) ) ( not ( = ?auto_950558 ?auto_950559 ) ) ( not ( = ?auto_950558 ?auto_950560 ) ) ( not ( = ?auto_950558 ?auto_950561 ) ) ( not ( = ?auto_950558 ?auto_950562 ) ) ( not ( = ?auto_950558 ?auto_950563 ) ) ( not ( = ?auto_950558 ?auto_950564 ) ) ( not ( = ?auto_950558 ?auto_950565 ) ) ( not ( = ?auto_950558 ?auto_950566 ) ) ( not ( = ?auto_950558 ?auto_950567 ) ) ( not ( = ?auto_950558 ?auto_950568 ) ) ( not ( = ?auto_950558 ?auto_950569 ) ) ( not ( = ?auto_950558 ?auto_950573 ) ) ( not ( = ?auto_950559 ?auto_950560 ) ) ( not ( = ?auto_950559 ?auto_950561 ) ) ( not ( = ?auto_950559 ?auto_950562 ) ) ( not ( = ?auto_950559 ?auto_950563 ) ) ( not ( = ?auto_950559 ?auto_950564 ) ) ( not ( = ?auto_950559 ?auto_950565 ) ) ( not ( = ?auto_950559 ?auto_950566 ) ) ( not ( = ?auto_950559 ?auto_950567 ) ) ( not ( = ?auto_950559 ?auto_950568 ) ) ( not ( = ?auto_950559 ?auto_950569 ) ) ( not ( = ?auto_950559 ?auto_950573 ) ) ( not ( = ?auto_950560 ?auto_950561 ) ) ( not ( = ?auto_950560 ?auto_950562 ) ) ( not ( = ?auto_950560 ?auto_950563 ) ) ( not ( = ?auto_950560 ?auto_950564 ) ) ( not ( = ?auto_950560 ?auto_950565 ) ) ( not ( = ?auto_950560 ?auto_950566 ) ) ( not ( = ?auto_950560 ?auto_950567 ) ) ( not ( = ?auto_950560 ?auto_950568 ) ) ( not ( = ?auto_950560 ?auto_950569 ) ) ( not ( = ?auto_950560 ?auto_950573 ) ) ( not ( = ?auto_950561 ?auto_950562 ) ) ( not ( = ?auto_950561 ?auto_950563 ) ) ( not ( = ?auto_950561 ?auto_950564 ) ) ( not ( = ?auto_950561 ?auto_950565 ) ) ( not ( = ?auto_950561 ?auto_950566 ) ) ( not ( = ?auto_950561 ?auto_950567 ) ) ( not ( = ?auto_950561 ?auto_950568 ) ) ( not ( = ?auto_950561 ?auto_950569 ) ) ( not ( = ?auto_950561 ?auto_950573 ) ) ( not ( = ?auto_950562 ?auto_950563 ) ) ( not ( = ?auto_950562 ?auto_950564 ) ) ( not ( = ?auto_950562 ?auto_950565 ) ) ( not ( = ?auto_950562 ?auto_950566 ) ) ( not ( = ?auto_950562 ?auto_950567 ) ) ( not ( = ?auto_950562 ?auto_950568 ) ) ( not ( = ?auto_950562 ?auto_950569 ) ) ( not ( = ?auto_950562 ?auto_950573 ) ) ( not ( = ?auto_950563 ?auto_950564 ) ) ( not ( = ?auto_950563 ?auto_950565 ) ) ( not ( = ?auto_950563 ?auto_950566 ) ) ( not ( = ?auto_950563 ?auto_950567 ) ) ( not ( = ?auto_950563 ?auto_950568 ) ) ( not ( = ?auto_950563 ?auto_950569 ) ) ( not ( = ?auto_950563 ?auto_950573 ) ) ( not ( = ?auto_950564 ?auto_950565 ) ) ( not ( = ?auto_950564 ?auto_950566 ) ) ( not ( = ?auto_950564 ?auto_950567 ) ) ( not ( = ?auto_950564 ?auto_950568 ) ) ( not ( = ?auto_950564 ?auto_950569 ) ) ( not ( = ?auto_950564 ?auto_950573 ) ) ( not ( = ?auto_950565 ?auto_950566 ) ) ( not ( = ?auto_950565 ?auto_950567 ) ) ( not ( = ?auto_950565 ?auto_950568 ) ) ( not ( = ?auto_950565 ?auto_950569 ) ) ( not ( = ?auto_950565 ?auto_950573 ) ) ( not ( = ?auto_950566 ?auto_950567 ) ) ( not ( = ?auto_950566 ?auto_950568 ) ) ( not ( = ?auto_950566 ?auto_950569 ) ) ( not ( = ?auto_950566 ?auto_950573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950567 ?auto_950568 ?auto_950569 )
      ( MAKE-12CRATE-VERIFY ?auto_950557 ?auto_950558 ?auto_950559 ?auto_950560 ?auto_950561 ?auto_950562 ?auto_950563 ?auto_950564 ?auto_950565 ?auto_950566 ?auto_950567 ?auto_950568 ?auto_950569 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962112 - SURFACE
      ?auto_962113 - SURFACE
      ?auto_962114 - SURFACE
      ?auto_962115 - SURFACE
      ?auto_962116 - SURFACE
      ?auto_962117 - SURFACE
      ?auto_962118 - SURFACE
      ?auto_962119 - SURFACE
      ?auto_962120 - SURFACE
      ?auto_962121 - SURFACE
      ?auto_962122 - SURFACE
      ?auto_962123 - SURFACE
      ?auto_962124 - SURFACE
      ?auto_962125 - SURFACE
    )
    :vars
    (
      ?auto_962126 - HOIST
      ?auto_962127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962126 ?auto_962127 ) ( SURFACE-AT ?auto_962124 ?auto_962127 ) ( CLEAR ?auto_962124 ) ( LIFTING ?auto_962126 ?auto_962125 ) ( IS-CRATE ?auto_962125 ) ( not ( = ?auto_962124 ?auto_962125 ) ) ( ON ?auto_962113 ?auto_962112 ) ( ON ?auto_962114 ?auto_962113 ) ( ON ?auto_962115 ?auto_962114 ) ( ON ?auto_962116 ?auto_962115 ) ( ON ?auto_962117 ?auto_962116 ) ( ON ?auto_962118 ?auto_962117 ) ( ON ?auto_962119 ?auto_962118 ) ( ON ?auto_962120 ?auto_962119 ) ( ON ?auto_962121 ?auto_962120 ) ( ON ?auto_962122 ?auto_962121 ) ( ON ?auto_962123 ?auto_962122 ) ( ON ?auto_962124 ?auto_962123 ) ( not ( = ?auto_962112 ?auto_962113 ) ) ( not ( = ?auto_962112 ?auto_962114 ) ) ( not ( = ?auto_962112 ?auto_962115 ) ) ( not ( = ?auto_962112 ?auto_962116 ) ) ( not ( = ?auto_962112 ?auto_962117 ) ) ( not ( = ?auto_962112 ?auto_962118 ) ) ( not ( = ?auto_962112 ?auto_962119 ) ) ( not ( = ?auto_962112 ?auto_962120 ) ) ( not ( = ?auto_962112 ?auto_962121 ) ) ( not ( = ?auto_962112 ?auto_962122 ) ) ( not ( = ?auto_962112 ?auto_962123 ) ) ( not ( = ?auto_962112 ?auto_962124 ) ) ( not ( = ?auto_962112 ?auto_962125 ) ) ( not ( = ?auto_962113 ?auto_962114 ) ) ( not ( = ?auto_962113 ?auto_962115 ) ) ( not ( = ?auto_962113 ?auto_962116 ) ) ( not ( = ?auto_962113 ?auto_962117 ) ) ( not ( = ?auto_962113 ?auto_962118 ) ) ( not ( = ?auto_962113 ?auto_962119 ) ) ( not ( = ?auto_962113 ?auto_962120 ) ) ( not ( = ?auto_962113 ?auto_962121 ) ) ( not ( = ?auto_962113 ?auto_962122 ) ) ( not ( = ?auto_962113 ?auto_962123 ) ) ( not ( = ?auto_962113 ?auto_962124 ) ) ( not ( = ?auto_962113 ?auto_962125 ) ) ( not ( = ?auto_962114 ?auto_962115 ) ) ( not ( = ?auto_962114 ?auto_962116 ) ) ( not ( = ?auto_962114 ?auto_962117 ) ) ( not ( = ?auto_962114 ?auto_962118 ) ) ( not ( = ?auto_962114 ?auto_962119 ) ) ( not ( = ?auto_962114 ?auto_962120 ) ) ( not ( = ?auto_962114 ?auto_962121 ) ) ( not ( = ?auto_962114 ?auto_962122 ) ) ( not ( = ?auto_962114 ?auto_962123 ) ) ( not ( = ?auto_962114 ?auto_962124 ) ) ( not ( = ?auto_962114 ?auto_962125 ) ) ( not ( = ?auto_962115 ?auto_962116 ) ) ( not ( = ?auto_962115 ?auto_962117 ) ) ( not ( = ?auto_962115 ?auto_962118 ) ) ( not ( = ?auto_962115 ?auto_962119 ) ) ( not ( = ?auto_962115 ?auto_962120 ) ) ( not ( = ?auto_962115 ?auto_962121 ) ) ( not ( = ?auto_962115 ?auto_962122 ) ) ( not ( = ?auto_962115 ?auto_962123 ) ) ( not ( = ?auto_962115 ?auto_962124 ) ) ( not ( = ?auto_962115 ?auto_962125 ) ) ( not ( = ?auto_962116 ?auto_962117 ) ) ( not ( = ?auto_962116 ?auto_962118 ) ) ( not ( = ?auto_962116 ?auto_962119 ) ) ( not ( = ?auto_962116 ?auto_962120 ) ) ( not ( = ?auto_962116 ?auto_962121 ) ) ( not ( = ?auto_962116 ?auto_962122 ) ) ( not ( = ?auto_962116 ?auto_962123 ) ) ( not ( = ?auto_962116 ?auto_962124 ) ) ( not ( = ?auto_962116 ?auto_962125 ) ) ( not ( = ?auto_962117 ?auto_962118 ) ) ( not ( = ?auto_962117 ?auto_962119 ) ) ( not ( = ?auto_962117 ?auto_962120 ) ) ( not ( = ?auto_962117 ?auto_962121 ) ) ( not ( = ?auto_962117 ?auto_962122 ) ) ( not ( = ?auto_962117 ?auto_962123 ) ) ( not ( = ?auto_962117 ?auto_962124 ) ) ( not ( = ?auto_962117 ?auto_962125 ) ) ( not ( = ?auto_962118 ?auto_962119 ) ) ( not ( = ?auto_962118 ?auto_962120 ) ) ( not ( = ?auto_962118 ?auto_962121 ) ) ( not ( = ?auto_962118 ?auto_962122 ) ) ( not ( = ?auto_962118 ?auto_962123 ) ) ( not ( = ?auto_962118 ?auto_962124 ) ) ( not ( = ?auto_962118 ?auto_962125 ) ) ( not ( = ?auto_962119 ?auto_962120 ) ) ( not ( = ?auto_962119 ?auto_962121 ) ) ( not ( = ?auto_962119 ?auto_962122 ) ) ( not ( = ?auto_962119 ?auto_962123 ) ) ( not ( = ?auto_962119 ?auto_962124 ) ) ( not ( = ?auto_962119 ?auto_962125 ) ) ( not ( = ?auto_962120 ?auto_962121 ) ) ( not ( = ?auto_962120 ?auto_962122 ) ) ( not ( = ?auto_962120 ?auto_962123 ) ) ( not ( = ?auto_962120 ?auto_962124 ) ) ( not ( = ?auto_962120 ?auto_962125 ) ) ( not ( = ?auto_962121 ?auto_962122 ) ) ( not ( = ?auto_962121 ?auto_962123 ) ) ( not ( = ?auto_962121 ?auto_962124 ) ) ( not ( = ?auto_962121 ?auto_962125 ) ) ( not ( = ?auto_962122 ?auto_962123 ) ) ( not ( = ?auto_962122 ?auto_962124 ) ) ( not ( = ?auto_962122 ?auto_962125 ) ) ( not ( = ?auto_962123 ?auto_962124 ) ) ( not ( = ?auto_962123 ?auto_962125 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_962124 ?auto_962125 )
      ( MAKE-13CRATE-VERIFY ?auto_962112 ?auto_962113 ?auto_962114 ?auto_962115 ?auto_962116 ?auto_962117 ?auto_962118 ?auto_962119 ?auto_962120 ?auto_962121 ?auto_962122 ?auto_962123 ?auto_962124 ?auto_962125 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962254 - SURFACE
      ?auto_962255 - SURFACE
      ?auto_962256 - SURFACE
      ?auto_962257 - SURFACE
      ?auto_962258 - SURFACE
      ?auto_962259 - SURFACE
      ?auto_962260 - SURFACE
      ?auto_962261 - SURFACE
      ?auto_962262 - SURFACE
      ?auto_962263 - SURFACE
      ?auto_962264 - SURFACE
      ?auto_962265 - SURFACE
      ?auto_962266 - SURFACE
      ?auto_962267 - SURFACE
    )
    :vars
    (
      ?auto_962269 - HOIST
      ?auto_962268 - PLACE
      ?auto_962270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_962269 ?auto_962268 ) ( SURFACE-AT ?auto_962266 ?auto_962268 ) ( CLEAR ?auto_962266 ) ( IS-CRATE ?auto_962267 ) ( not ( = ?auto_962266 ?auto_962267 ) ) ( TRUCK-AT ?auto_962270 ?auto_962268 ) ( AVAILABLE ?auto_962269 ) ( IN ?auto_962267 ?auto_962270 ) ( ON ?auto_962266 ?auto_962265 ) ( not ( = ?auto_962265 ?auto_962266 ) ) ( not ( = ?auto_962265 ?auto_962267 ) ) ( ON ?auto_962255 ?auto_962254 ) ( ON ?auto_962256 ?auto_962255 ) ( ON ?auto_962257 ?auto_962256 ) ( ON ?auto_962258 ?auto_962257 ) ( ON ?auto_962259 ?auto_962258 ) ( ON ?auto_962260 ?auto_962259 ) ( ON ?auto_962261 ?auto_962260 ) ( ON ?auto_962262 ?auto_962261 ) ( ON ?auto_962263 ?auto_962262 ) ( ON ?auto_962264 ?auto_962263 ) ( ON ?auto_962265 ?auto_962264 ) ( not ( = ?auto_962254 ?auto_962255 ) ) ( not ( = ?auto_962254 ?auto_962256 ) ) ( not ( = ?auto_962254 ?auto_962257 ) ) ( not ( = ?auto_962254 ?auto_962258 ) ) ( not ( = ?auto_962254 ?auto_962259 ) ) ( not ( = ?auto_962254 ?auto_962260 ) ) ( not ( = ?auto_962254 ?auto_962261 ) ) ( not ( = ?auto_962254 ?auto_962262 ) ) ( not ( = ?auto_962254 ?auto_962263 ) ) ( not ( = ?auto_962254 ?auto_962264 ) ) ( not ( = ?auto_962254 ?auto_962265 ) ) ( not ( = ?auto_962254 ?auto_962266 ) ) ( not ( = ?auto_962254 ?auto_962267 ) ) ( not ( = ?auto_962255 ?auto_962256 ) ) ( not ( = ?auto_962255 ?auto_962257 ) ) ( not ( = ?auto_962255 ?auto_962258 ) ) ( not ( = ?auto_962255 ?auto_962259 ) ) ( not ( = ?auto_962255 ?auto_962260 ) ) ( not ( = ?auto_962255 ?auto_962261 ) ) ( not ( = ?auto_962255 ?auto_962262 ) ) ( not ( = ?auto_962255 ?auto_962263 ) ) ( not ( = ?auto_962255 ?auto_962264 ) ) ( not ( = ?auto_962255 ?auto_962265 ) ) ( not ( = ?auto_962255 ?auto_962266 ) ) ( not ( = ?auto_962255 ?auto_962267 ) ) ( not ( = ?auto_962256 ?auto_962257 ) ) ( not ( = ?auto_962256 ?auto_962258 ) ) ( not ( = ?auto_962256 ?auto_962259 ) ) ( not ( = ?auto_962256 ?auto_962260 ) ) ( not ( = ?auto_962256 ?auto_962261 ) ) ( not ( = ?auto_962256 ?auto_962262 ) ) ( not ( = ?auto_962256 ?auto_962263 ) ) ( not ( = ?auto_962256 ?auto_962264 ) ) ( not ( = ?auto_962256 ?auto_962265 ) ) ( not ( = ?auto_962256 ?auto_962266 ) ) ( not ( = ?auto_962256 ?auto_962267 ) ) ( not ( = ?auto_962257 ?auto_962258 ) ) ( not ( = ?auto_962257 ?auto_962259 ) ) ( not ( = ?auto_962257 ?auto_962260 ) ) ( not ( = ?auto_962257 ?auto_962261 ) ) ( not ( = ?auto_962257 ?auto_962262 ) ) ( not ( = ?auto_962257 ?auto_962263 ) ) ( not ( = ?auto_962257 ?auto_962264 ) ) ( not ( = ?auto_962257 ?auto_962265 ) ) ( not ( = ?auto_962257 ?auto_962266 ) ) ( not ( = ?auto_962257 ?auto_962267 ) ) ( not ( = ?auto_962258 ?auto_962259 ) ) ( not ( = ?auto_962258 ?auto_962260 ) ) ( not ( = ?auto_962258 ?auto_962261 ) ) ( not ( = ?auto_962258 ?auto_962262 ) ) ( not ( = ?auto_962258 ?auto_962263 ) ) ( not ( = ?auto_962258 ?auto_962264 ) ) ( not ( = ?auto_962258 ?auto_962265 ) ) ( not ( = ?auto_962258 ?auto_962266 ) ) ( not ( = ?auto_962258 ?auto_962267 ) ) ( not ( = ?auto_962259 ?auto_962260 ) ) ( not ( = ?auto_962259 ?auto_962261 ) ) ( not ( = ?auto_962259 ?auto_962262 ) ) ( not ( = ?auto_962259 ?auto_962263 ) ) ( not ( = ?auto_962259 ?auto_962264 ) ) ( not ( = ?auto_962259 ?auto_962265 ) ) ( not ( = ?auto_962259 ?auto_962266 ) ) ( not ( = ?auto_962259 ?auto_962267 ) ) ( not ( = ?auto_962260 ?auto_962261 ) ) ( not ( = ?auto_962260 ?auto_962262 ) ) ( not ( = ?auto_962260 ?auto_962263 ) ) ( not ( = ?auto_962260 ?auto_962264 ) ) ( not ( = ?auto_962260 ?auto_962265 ) ) ( not ( = ?auto_962260 ?auto_962266 ) ) ( not ( = ?auto_962260 ?auto_962267 ) ) ( not ( = ?auto_962261 ?auto_962262 ) ) ( not ( = ?auto_962261 ?auto_962263 ) ) ( not ( = ?auto_962261 ?auto_962264 ) ) ( not ( = ?auto_962261 ?auto_962265 ) ) ( not ( = ?auto_962261 ?auto_962266 ) ) ( not ( = ?auto_962261 ?auto_962267 ) ) ( not ( = ?auto_962262 ?auto_962263 ) ) ( not ( = ?auto_962262 ?auto_962264 ) ) ( not ( = ?auto_962262 ?auto_962265 ) ) ( not ( = ?auto_962262 ?auto_962266 ) ) ( not ( = ?auto_962262 ?auto_962267 ) ) ( not ( = ?auto_962263 ?auto_962264 ) ) ( not ( = ?auto_962263 ?auto_962265 ) ) ( not ( = ?auto_962263 ?auto_962266 ) ) ( not ( = ?auto_962263 ?auto_962267 ) ) ( not ( = ?auto_962264 ?auto_962265 ) ) ( not ( = ?auto_962264 ?auto_962266 ) ) ( not ( = ?auto_962264 ?auto_962267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962265 ?auto_962266 ?auto_962267 )
      ( MAKE-13CRATE-VERIFY ?auto_962254 ?auto_962255 ?auto_962256 ?auto_962257 ?auto_962258 ?auto_962259 ?auto_962260 ?auto_962261 ?auto_962262 ?auto_962263 ?auto_962264 ?auto_962265 ?auto_962266 ?auto_962267 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962410 - SURFACE
      ?auto_962411 - SURFACE
      ?auto_962412 - SURFACE
      ?auto_962413 - SURFACE
      ?auto_962414 - SURFACE
      ?auto_962415 - SURFACE
      ?auto_962416 - SURFACE
      ?auto_962417 - SURFACE
      ?auto_962418 - SURFACE
      ?auto_962419 - SURFACE
      ?auto_962420 - SURFACE
      ?auto_962421 - SURFACE
      ?auto_962422 - SURFACE
      ?auto_962423 - SURFACE
    )
    :vars
    (
      ?auto_962427 - HOIST
      ?auto_962426 - PLACE
      ?auto_962424 - TRUCK
      ?auto_962425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962427 ?auto_962426 ) ( SURFACE-AT ?auto_962422 ?auto_962426 ) ( CLEAR ?auto_962422 ) ( IS-CRATE ?auto_962423 ) ( not ( = ?auto_962422 ?auto_962423 ) ) ( AVAILABLE ?auto_962427 ) ( IN ?auto_962423 ?auto_962424 ) ( ON ?auto_962422 ?auto_962421 ) ( not ( = ?auto_962421 ?auto_962422 ) ) ( not ( = ?auto_962421 ?auto_962423 ) ) ( TRUCK-AT ?auto_962424 ?auto_962425 ) ( not ( = ?auto_962425 ?auto_962426 ) ) ( ON ?auto_962411 ?auto_962410 ) ( ON ?auto_962412 ?auto_962411 ) ( ON ?auto_962413 ?auto_962412 ) ( ON ?auto_962414 ?auto_962413 ) ( ON ?auto_962415 ?auto_962414 ) ( ON ?auto_962416 ?auto_962415 ) ( ON ?auto_962417 ?auto_962416 ) ( ON ?auto_962418 ?auto_962417 ) ( ON ?auto_962419 ?auto_962418 ) ( ON ?auto_962420 ?auto_962419 ) ( ON ?auto_962421 ?auto_962420 ) ( not ( = ?auto_962410 ?auto_962411 ) ) ( not ( = ?auto_962410 ?auto_962412 ) ) ( not ( = ?auto_962410 ?auto_962413 ) ) ( not ( = ?auto_962410 ?auto_962414 ) ) ( not ( = ?auto_962410 ?auto_962415 ) ) ( not ( = ?auto_962410 ?auto_962416 ) ) ( not ( = ?auto_962410 ?auto_962417 ) ) ( not ( = ?auto_962410 ?auto_962418 ) ) ( not ( = ?auto_962410 ?auto_962419 ) ) ( not ( = ?auto_962410 ?auto_962420 ) ) ( not ( = ?auto_962410 ?auto_962421 ) ) ( not ( = ?auto_962410 ?auto_962422 ) ) ( not ( = ?auto_962410 ?auto_962423 ) ) ( not ( = ?auto_962411 ?auto_962412 ) ) ( not ( = ?auto_962411 ?auto_962413 ) ) ( not ( = ?auto_962411 ?auto_962414 ) ) ( not ( = ?auto_962411 ?auto_962415 ) ) ( not ( = ?auto_962411 ?auto_962416 ) ) ( not ( = ?auto_962411 ?auto_962417 ) ) ( not ( = ?auto_962411 ?auto_962418 ) ) ( not ( = ?auto_962411 ?auto_962419 ) ) ( not ( = ?auto_962411 ?auto_962420 ) ) ( not ( = ?auto_962411 ?auto_962421 ) ) ( not ( = ?auto_962411 ?auto_962422 ) ) ( not ( = ?auto_962411 ?auto_962423 ) ) ( not ( = ?auto_962412 ?auto_962413 ) ) ( not ( = ?auto_962412 ?auto_962414 ) ) ( not ( = ?auto_962412 ?auto_962415 ) ) ( not ( = ?auto_962412 ?auto_962416 ) ) ( not ( = ?auto_962412 ?auto_962417 ) ) ( not ( = ?auto_962412 ?auto_962418 ) ) ( not ( = ?auto_962412 ?auto_962419 ) ) ( not ( = ?auto_962412 ?auto_962420 ) ) ( not ( = ?auto_962412 ?auto_962421 ) ) ( not ( = ?auto_962412 ?auto_962422 ) ) ( not ( = ?auto_962412 ?auto_962423 ) ) ( not ( = ?auto_962413 ?auto_962414 ) ) ( not ( = ?auto_962413 ?auto_962415 ) ) ( not ( = ?auto_962413 ?auto_962416 ) ) ( not ( = ?auto_962413 ?auto_962417 ) ) ( not ( = ?auto_962413 ?auto_962418 ) ) ( not ( = ?auto_962413 ?auto_962419 ) ) ( not ( = ?auto_962413 ?auto_962420 ) ) ( not ( = ?auto_962413 ?auto_962421 ) ) ( not ( = ?auto_962413 ?auto_962422 ) ) ( not ( = ?auto_962413 ?auto_962423 ) ) ( not ( = ?auto_962414 ?auto_962415 ) ) ( not ( = ?auto_962414 ?auto_962416 ) ) ( not ( = ?auto_962414 ?auto_962417 ) ) ( not ( = ?auto_962414 ?auto_962418 ) ) ( not ( = ?auto_962414 ?auto_962419 ) ) ( not ( = ?auto_962414 ?auto_962420 ) ) ( not ( = ?auto_962414 ?auto_962421 ) ) ( not ( = ?auto_962414 ?auto_962422 ) ) ( not ( = ?auto_962414 ?auto_962423 ) ) ( not ( = ?auto_962415 ?auto_962416 ) ) ( not ( = ?auto_962415 ?auto_962417 ) ) ( not ( = ?auto_962415 ?auto_962418 ) ) ( not ( = ?auto_962415 ?auto_962419 ) ) ( not ( = ?auto_962415 ?auto_962420 ) ) ( not ( = ?auto_962415 ?auto_962421 ) ) ( not ( = ?auto_962415 ?auto_962422 ) ) ( not ( = ?auto_962415 ?auto_962423 ) ) ( not ( = ?auto_962416 ?auto_962417 ) ) ( not ( = ?auto_962416 ?auto_962418 ) ) ( not ( = ?auto_962416 ?auto_962419 ) ) ( not ( = ?auto_962416 ?auto_962420 ) ) ( not ( = ?auto_962416 ?auto_962421 ) ) ( not ( = ?auto_962416 ?auto_962422 ) ) ( not ( = ?auto_962416 ?auto_962423 ) ) ( not ( = ?auto_962417 ?auto_962418 ) ) ( not ( = ?auto_962417 ?auto_962419 ) ) ( not ( = ?auto_962417 ?auto_962420 ) ) ( not ( = ?auto_962417 ?auto_962421 ) ) ( not ( = ?auto_962417 ?auto_962422 ) ) ( not ( = ?auto_962417 ?auto_962423 ) ) ( not ( = ?auto_962418 ?auto_962419 ) ) ( not ( = ?auto_962418 ?auto_962420 ) ) ( not ( = ?auto_962418 ?auto_962421 ) ) ( not ( = ?auto_962418 ?auto_962422 ) ) ( not ( = ?auto_962418 ?auto_962423 ) ) ( not ( = ?auto_962419 ?auto_962420 ) ) ( not ( = ?auto_962419 ?auto_962421 ) ) ( not ( = ?auto_962419 ?auto_962422 ) ) ( not ( = ?auto_962419 ?auto_962423 ) ) ( not ( = ?auto_962420 ?auto_962421 ) ) ( not ( = ?auto_962420 ?auto_962422 ) ) ( not ( = ?auto_962420 ?auto_962423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962421 ?auto_962422 ?auto_962423 )
      ( MAKE-13CRATE-VERIFY ?auto_962410 ?auto_962411 ?auto_962412 ?auto_962413 ?auto_962414 ?auto_962415 ?auto_962416 ?auto_962417 ?auto_962418 ?auto_962419 ?auto_962420 ?auto_962421 ?auto_962422 ?auto_962423 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962579 - SURFACE
      ?auto_962580 - SURFACE
      ?auto_962581 - SURFACE
      ?auto_962582 - SURFACE
      ?auto_962583 - SURFACE
      ?auto_962584 - SURFACE
      ?auto_962585 - SURFACE
      ?auto_962586 - SURFACE
      ?auto_962587 - SURFACE
      ?auto_962588 - SURFACE
      ?auto_962589 - SURFACE
      ?auto_962590 - SURFACE
      ?auto_962591 - SURFACE
      ?auto_962592 - SURFACE
    )
    :vars
    (
      ?auto_962596 - HOIST
      ?auto_962593 - PLACE
      ?auto_962595 - TRUCK
      ?auto_962594 - PLACE
      ?auto_962597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_962596 ?auto_962593 ) ( SURFACE-AT ?auto_962591 ?auto_962593 ) ( CLEAR ?auto_962591 ) ( IS-CRATE ?auto_962592 ) ( not ( = ?auto_962591 ?auto_962592 ) ) ( AVAILABLE ?auto_962596 ) ( ON ?auto_962591 ?auto_962590 ) ( not ( = ?auto_962590 ?auto_962591 ) ) ( not ( = ?auto_962590 ?auto_962592 ) ) ( TRUCK-AT ?auto_962595 ?auto_962594 ) ( not ( = ?auto_962594 ?auto_962593 ) ) ( HOIST-AT ?auto_962597 ?auto_962594 ) ( LIFTING ?auto_962597 ?auto_962592 ) ( not ( = ?auto_962596 ?auto_962597 ) ) ( ON ?auto_962580 ?auto_962579 ) ( ON ?auto_962581 ?auto_962580 ) ( ON ?auto_962582 ?auto_962581 ) ( ON ?auto_962583 ?auto_962582 ) ( ON ?auto_962584 ?auto_962583 ) ( ON ?auto_962585 ?auto_962584 ) ( ON ?auto_962586 ?auto_962585 ) ( ON ?auto_962587 ?auto_962586 ) ( ON ?auto_962588 ?auto_962587 ) ( ON ?auto_962589 ?auto_962588 ) ( ON ?auto_962590 ?auto_962589 ) ( not ( = ?auto_962579 ?auto_962580 ) ) ( not ( = ?auto_962579 ?auto_962581 ) ) ( not ( = ?auto_962579 ?auto_962582 ) ) ( not ( = ?auto_962579 ?auto_962583 ) ) ( not ( = ?auto_962579 ?auto_962584 ) ) ( not ( = ?auto_962579 ?auto_962585 ) ) ( not ( = ?auto_962579 ?auto_962586 ) ) ( not ( = ?auto_962579 ?auto_962587 ) ) ( not ( = ?auto_962579 ?auto_962588 ) ) ( not ( = ?auto_962579 ?auto_962589 ) ) ( not ( = ?auto_962579 ?auto_962590 ) ) ( not ( = ?auto_962579 ?auto_962591 ) ) ( not ( = ?auto_962579 ?auto_962592 ) ) ( not ( = ?auto_962580 ?auto_962581 ) ) ( not ( = ?auto_962580 ?auto_962582 ) ) ( not ( = ?auto_962580 ?auto_962583 ) ) ( not ( = ?auto_962580 ?auto_962584 ) ) ( not ( = ?auto_962580 ?auto_962585 ) ) ( not ( = ?auto_962580 ?auto_962586 ) ) ( not ( = ?auto_962580 ?auto_962587 ) ) ( not ( = ?auto_962580 ?auto_962588 ) ) ( not ( = ?auto_962580 ?auto_962589 ) ) ( not ( = ?auto_962580 ?auto_962590 ) ) ( not ( = ?auto_962580 ?auto_962591 ) ) ( not ( = ?auto_962580 ?auto_962592 ) ) ( not ( = ?auto_962581 ?auto_962582 ) ) ( not ( = ?auto_962581 ?auto_962583 ) ) ( not ( = ?auto_962581 ?auto_962584 ) ) ( not ( = ?auto_962581 ?auto_962585 ) ) ( not ( = ?auto_962581 ?auto_962586 ) ) ( not ( = ?auto_962581 ?auto_962587 ) ) ( not ( = ?auto_962581 ?auto_962588 ) ) ( not ( = ?auto_962581 ?auto_962589 ) ) ( not ( = ?auto_962581 ?auto_962590 ) ) ( not ( = ?auto_962581 ?auto_962591 ) ) ( not ( = ?auto_962581 ?auto_962592 ) ) ( not ( = ?auto_962582 ?auto_962583 ) ) ( not ( = ?auto_962582 ?auto_962584 ) ) ( not ( = ?auto_962582 ?auto_962585 ) ) ( not ( = ?auto_962582 ?auto_962586 ) ) ( not ( = ?auto_962582 ?auto_962587 ) ) ( not ( = ?auto_962582 ?auto_962588 ) ) ( not ( = ?auto_962582 ?auto_962589 ) ) ( not ( = ?auto_962582 ?auto_962590 ) ) ( not ( = ?auto_962582 ?auto_962591 ) ) ( not ( = ?auto_962582 ?auto_962592 ) ) ( not ( = ?auto_962583 ?auto_962584 ) ) ( not ( = ?auto_962583 ?auto_962585 ) ) ( not ( = ?auto_962583 ?auto_962586 ) ) ( not ( = ?auto_962583 ?auto_962587 ) ) ( not ( = ?auto_962583 ?auto_962588 ) ) ( not ( = ?auto_962583 ?auto_962589 ) ) ( not ( = ?auto_962583 ?auto_962590 ) ) ( not ( = ?auto_962583 ?auto_962591 ) ) ( not ( = ?auto_962583 ?auto_962592 ) ) ( not ( = ?auto_962584 ?auto_962585 ) ) ( not ( = ?auto_962584 ?auto_962586 ) ) ( not ( = ?auto_962584 ?auto_962587 ) ) ( not ( = ?auto_962584 ?auto_962588 ) ) ( not ( = ?auto_962584 ?auto_962589 ) ) ( not ( = ?auto_962584 ?auto_962590 ) ) ( not ( = ?auto_962584 ?auto_962591 ) ) ( not ( = ?auto_962584 ?auto_962592 ) ) ( not ( = ?auto_962585 ?auto_962586 ) ) ( not ( = ?auto_962585 ?auto_962587 ) ) ( not ( = ?auto_962585 ?auto_962588 ) ) ( not ( = ?auto_962585 ?auto_962589 ) ) ( not ( = ?auto_962585 ?auto_962590 ) ) ( not ( = ?auto_962585 ?auto_962591 ) ) ( not ( = ?auto_962585 ?auto_962592 ) ) ( not ( = ?auto_962586 ?auto_962587 ) ) ( not ( = ?auto_962586 ?auto_962588 ) ) ( not ( = ?auto_962586 ?auto_962589 ) ) ( not ( = ?auto_962586 ?auto_962590 ) ) ( not ( = ?auto_962586 ?auto_962591 ) ) ( not ( = ?auto_962586 ?auto_962592 ) ) ( not ( = ?auto_962587 ?auto_962588 ) ) ( not ( = ?auto_962587 ?auto_962589 ) ) ( not ( = ?auto_962587 ?auto_962590 ) ) ( not ( = ?auto_962587 ?auto_962591 ) ) ( not ( = ?auto_962587 ?auto_962592 ) ) ( not ( = ?auto_962588 ?auto_962589 ) ) ( not ( = ?auto_962588 ?auto_962590 ) ) ( not ( = ?auto_962588 ?auto_962591 ) ) ( not ( = ?auto_962588 ?auto_962592 ) ) ( not ( = ?auto_962589 ?auto_962590 ) ) ( not ( = ?auto_962589 ?auto_962591 ) ) ( not ( = ?auto_962589 ?auto_962592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962590 ?auto_962591 ?auto_962592 )
      ( MAKE-13CRATE-VERIFY ?auto_962579 ?auto_962580 ?auto_962581 ?auto_962582 ?auto_962583 ?auto_962584 ?auto_962585 ?auto_962586 ?auto_962587 ?auto_962588 ?auto_962589 ?auto_962590 ?auto_962591 ?auto_962592 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962761 - SURFACE
      ?auto_962762 - SURFACE
      ?auto_962763 - SURFACE
      ?auto_962764 - SURFACE
      ?auto_962765 - SURFACE
      ?auto_962766 - SURFACE
      ?auto_962767 - SURFACE
      ?auto_962768 - SURFACE
      ?auto_962769 - SURFACE
      ?auto_962770 - SURFACE
      ?auto_962771 - SURFACE
      ?auto_962772 - SURFACE
      ?auto_962773 - SURFACE
      ?auto_962774 - SURFACE
    )
    :vars
    (
      ?auto_962776 - HOIST
      ?auto_962780 - PLACE
      ?auto_962779 - TRUCK
      ?auto_962777 - PLACE
      ?auto_962775 - HOIST
      ?auto_962778 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962776 ?auto_962780 ) ( SURFACE-AT ?auto_962773 ?auto_962780 ) ( CLEAR ?auto_962773 ) ( IS-CRATE ?auto_962774 ) ( not ( = ?auto_962773 ?auto_962774 ) ) ( AVAILABLE ?auto_962776 ) ( ON ?auto_962773 ?auto_962772 ) ( not ( = ?auto_962772 ?auto_962773 ) ) ( not ( = ?auto_962772 ?auto_962774 ) ) ( TRUCK-AT ?auto_962779 ?auto_962777 ) ( not ( = ?auto_962777 ?auto_962780 ) ) ( HOIST-AT ?auto_962775 ?auto_962777 ) ( not ( = ?auto_962776 ?auto_962775 ) ) ( AVAILABLE ?auto_962775 ) ( SURFACE-AT ?auto_962774 ?auto_962777 ) ( ON ?auto_962774 ?auto_962778 ) ( CLEAR ?auto_962774 ) ( not ( = ?auto_962773 ?auto_962778 ) ) ( not ( = ?auto_962774 ?auto_962778 ) ) ( not ( = ?auto_962772 ?auto_962778 ) ) ( ON ?auto_962762 ?auto_962761 ) ( ON ?auto_962763 ?auto_962762 ) ( ON ?auto_962764 ?auto_962763 ) ( ON ?auto_962765 ?auto_962764 ) ( ON ?auto_962766 ?auto_962765 ) ( ON ?auto_962767 ?auto_962766 ) ( ON ?auto_962768 ?auto_962767 ) ( ON ?auto_962769 ?auto_962768 ) ( ON ?auto_962770 ?auto_962769 ) ( ON ?auto_962771 ?auto_962770 ) ( ON ?auto_962772 ?auto_962771 ) ( not ( = ?auto_962761 ?auto_962762 ) ) ( not ( = ?auto_962761 ?auto_962763 ) ) ( not ( = ?auto_962761 ?auto_962764 ) ) ( not ( = ?auto_962761 ?auto_962765 ) ) ( not ( = ?auto_962761 ?auto_962766 ) ) ( not ( = ?auto_962761 ?auto_962767 ) ) ( not ( = ?auto_962761 ?auto_962768 ) ) ( not ( = ?auto_962761 ?auto_962769 ) ) ( not ( = ?auto_962761 ?auto_962770 ) ) ( not ( = ?auto_962761 ?auto_962771 ) ) ( not ( = ?auto_962761 ?auto_962772 ) ) ( not ( = ?auto_962761 ?auto_962773 ) ) ( not ( = ?auto_962761 ?auto_962774 ) ) ( not ( = ?auto_962761 ?auto_962778 ) ) ( not ( = ?auto_962762 ?auto_962763 ) ) ( not ( = ?auto_962762 ?auto_962764 ) ) ( not ( = ?auto_962762 ?auto_962765 ) ) ( not ( = ?auto_962762 ?auto_962766 ) ) ( not ( = ?auto_962762 ?auto_962767 ) ) ( not ( = ?auto_962762 ?auto_962768 ) ) ( not ( = ?auto_962762 ?auto_962769 ) ) ( not ( = ?auto_962762 ?auto_962770 ) ) ( not ( = ?auto_962762 ?auto_962771 ) ) ( not ( = ?auto_962762 ?auto_962772 ) ) ( not ( = ?auto_962762 ?auto_962773 ) ) ( not ( = ?auto_962762 ?auto_962774 ) ) ( not ( = ?auto_962762 ?auto_962778 ) ) ( not ( = ?auto_962763 ?auto_962764 ) ) ( not ( = ?auto_962763 ?auto_962765 ) ) ( not ( = ?auto_962763 ?auto_962766 ) ) ( not ( = ?auto_962763 ?auto_962767 ) ) ( not ( = ?auto_962763 ?auto_962768 ) ) ( not ( = ?auto_962763 ?auto_962769 ) ) ( not ( = ?auto_962763 ?auto_962770 ) ) ( not ( = ?auto_962763 ?auto_962771 ) ) ( not ( = ?auto_962763 ?auto_962772 ) ) ( not ( = ?auto_962763 ?auto_962773 ) ) ( not ( = ?auto_962763 ?auto_962774 ) ) ( not ( = ?auto_962763 ?auto_962778 ) ) ( not ( = ?auto_962764 ?auto_962765 ) ) ( not ( = ?auto_962764 ?auto_962766 ) ) ( not ( = ?auto_962764 ?auto_962767 ) ) ( not ( = ?auto_962764 ?auto_962768 ) ) ( not ( = ?auto_962764 ?auto_962769 ) ) ( not ( = ?auto_962764 ?auto_962770 ) ) ( not ( = ?auto_962764 ?auto_962771 ) ) ( not ( = ?auto_962764 ?auto_962772 ) ) ( not ( = ?auto_962764 ?auto_962773 ) ) ( not ( = ?auto_962764 ?auto_962774 ) ) ( not ( = ?auto_962764 ?auto_962778 ) ) ( not ( = ?auto_962765 ?auto_962766 ) ) ( not ( = ?auto_962765 ?auto_962767 ) ) ( not ( = ?auto_962765 ?auto_962768 ) ) ( not ( = ?auto_962765 ?auto_962769 ) ) ( not ( = ?auto_962765 ?auto_962770 ) ) ( not ( = ?auto_962765 ?auto_962771 ) ) ( not ( = ?auto_962765 ?auto_962772 ) ) ( not ( = ?auto_962765 ?auto_962773 ) ) ( not ( = ?auto_962765 ?auto_962774 ) ) ( not ( = ?auto_962765 ?auto_962778 ) ) ( not ( = ?auto_962766 ?auto_962767 ) ) ( not ( = ?auto_962766 ?auto_962768 ) ) ( not ( = ?auto_962766 ?auto_962769 ) ) ( not ( = ?auto_962766 ?auto_962770 ) ) ( not ( = ?auto_962766 ?auto_962771 ) ) ( not ( = ?auto_962766 ?auto_962772 ) ) ( not ( = ?auto_962766 ?auto_962773 ) ) ( not ( = ?auto_962766 ?auto_962774 ) ) ( not ( = ?auto_962766 ?auto_962778 ) ) ( not ( = ?auto_962767 ?auto_962768 ) ) ( not ( = ?auto_962767 ?auto_962769 ) ) ( not ( = ?auto_962767 ?auto_962770 ) ) ( not ( = ?auto_962767 ?auto_962771 ) ) ( not ( = ?auto_962767 ?auto_962772 ) ) ( not ( = ?auto_962767 ?auto_962773 ) ) ( not ( = ?auto_962767 ?auto_962774 ) ) ( not ( = ?auto_962767 ?auto_962778 ) ) ( not ( = ?auto_962768 ?auto_962769 ) ) ( not ( = ?auto_962768 ?auto_962770 ) ) ( not ( = ?auto_962768 ?auto_962771 ) ) ( not ( = ?auto_962768 ?auto_962772 ) ) ( not ( = ?auto_962768 ?auto_962773 ) ) ( not ( = ?auto_962768 ?auto_962774 ) ) ( not ( = ?auto_962768 ?auto_962778 ) ) ( not ( = ?auto_962769 ?auto_962770 ) ) ( not ( = ?auto_962769 ?auto_962771 ) ) ( not ( = ?auto_962769 ?auto_962772 ) ) ( not ( = ?auto_962769 ?auto_962773 ) ) ( not ( = ?auto_962769 ?auto_962774 ) ) ( not ( = ?auto_962769 ?auto_962778 ) ) ( not ( = ?auto_962770 ?auto_962771 ) ) ( not ( = ?auto_962770 ?auto_962772 ) ) ( not ( = ?auto_962770 ?auto_962773 ) ) ( not ( = ?auto_962770 ?auto_962774 ) ) ( not ( = ?auto_962770 ?auto_962778 ) ) ( not ( = ?auto_962771 ?auto_962772 ) ) ( not ( = ?auto_962771 ?auto_962773 ) ) ( not ( = ?auto_962771 ?auto_962774 ) ) ( not ( = ?auto_962771 ?auto_962778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962772 ?auto_962773 ?auto_962774 )
      ( MAKE-13CRATE-VERIFY ?auto_962761 ?auto_962762 ?auto_962763 ?auto_962764 ?auto_962765 ?auto_962766 ?auto_962767 ?auto_962768 ?auto_962769 ?auto_962770 ?auto_962771 ?auto_962772 ?auto_962773 ?auto_962774 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962944 - SURFACE
      ?auto_962945 - SURFACE
      ?auto_962946 - SURFACE
      ?auto_962947 - SURFACE
      ?auto_962948 - SURFACE
      ?auto_962949 - SURFACE
      ?auto_962950 - SURFACE
      ?auto_962951 - SURFACE
      ?auto_962952 - SURFACE
      ?auto_962953 - SURFACE
      ?auto_962954 - SURFACE
      ?auto_962955 - SURFACE
      ?auto_962956 - SURFACE
      ?auto_962957 - SURFACE
    )
    :vars
    (
      ?auto_962963 - HOIST
      ?auto_962962 - PLACE
      ?auto_962961 - PLACE
      ?auto_962959 - HOIST
      ?auto_962958 - SURFACE
      ?auto_962960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_962963 ?auto_962962 ) ( SURFACE-AT ?auto_962956 ?auto_962962 ) ( CLEAR ?auto_962956 ) ( IS-CRATE ?auto_962957 ) ( not ( = ?auto_962956 ?auto_962957 ) ) ( AVAILABLE ?auto_962963 ) ( ON ?auto_962956 ?auto_962955 ) ( not ( = ?auto_962955 ?auto_962956 ) ) ( not ( = ?auto_962955 ?auto_962957 ) ) ( not ( = ?auto_962961 ?auto_962962 ) ) ( HOIST-AT ?auto_962959 ?auto_962961 ) ( not ( = ?auto_962963 ?auto_962959 ) ) ( AVAILABLE ?auto_962959 ) ( SURFACE-AT ?auto_962957 ?auto_962961 ) ( ON ?auto_962957 ?auto_962958 ) ( CLEAR ?auto_962957 ) ( not ( = ?auto_962956 ?auto_962958 ) ) ( not ( = ?auto_962957 ?auto_962958 ) ) ( not ( = ?auto_962955 ?auto_962958 ) ) ( TRUCK-AT ?auto_962960 ?auto_962962 ) ( ON ?auto_962945 ?auto_962944 ) ( ON ?auto_962946 ?auto_962945 ) ( ON ?auto_962947 ?auto_962946 ) ( ON ?auto_962948 ?auto_962947 ) ( ON ?auto_962949 ?auto_962948 ) ( ON ?auto_962950 ?auto_962949 ) ( ON ?auto_962951 ?auto_962950 ) ( ON ?auto_962952 ?auto_962951 ) ( ON ?auto_962953 ?auto_962952 ) ( ON ?auto_962954 ?auto_962953 ) ( ON ?auto_962955 ?auto_962954 ) ( not ( = ?auto_962944 ?auto_962945 ) ) ( not ( = ?auto_962944 ?auto_962946 ) ) ( not ( = ?auto_962944 ?auto_962947 ) ) ( not ( = ?auto_962944 ?auto_962948 ) ) ( not ( = ?auto_962944 ?auto_962949 ) ) ( not ( = ?auto_962944 ?auto_962950 ) ) ( not ( = ?auto_962944 ?auto_962951 ) ) ( not ( = ?auto_962944 ?auto_962952 ) ) ( not ( = ?auto_962944 ?auto_962953 ) ) ( not ( = ?auto_962944 ?auto_962954 ) ) ( not ( = ?auto_962944 ?auto_962955 ) ) ( not ( = ?auto_962944 ?auto_962956 ) ) ( not ( = ?auto_962944 ?auto_962957 ) ) ( not ( = ?auto_962944 ?auto_962958 ) ) ( not ( = ?auto_962945 ?auto_962946 ) ) ( not ( = ?auto_962945 ?auto_962947 ) ) ( not ( = ?auto_962945 ?auto_962948 ) ) ( not ( = ?auto_962945 ?auto_962949 ) ) ( not ( = ?auto_962945 ?auto_962950 ) ) ( not ( = ?auto_962945 ?auto_962951 ) ) ( not ( = ?auto_962945 ?auto_962952 ) ) ( not ( = ?auto_962945 ?auto_962953 ) ) ( not ( = ?auto_962945 ?auto_962954 ) ) ( not ( = ?auto_962945 ?auto_962955 ) ) ( not ( = ?auto_962945 ?auto_962956 ) ) ( not ( = ?auto_962945 ?auto_962957 ) ) ( not ( = ?auto_962945 ?auto_962958 ) ) ( not ( = ?auto_962946 ?auto_962947 ) ) ( not ( = ?auto_962946 ?auto_962948 ) ) ( not ( = ?auto_962946 ?auto_962949 ) ) ( not ( = ?auto_962946 ?auto_962950 ) ) ( not ( = ?auto_962946 ?auto_962951 ) ) ( not ( = ?auto_962946 ?auto_962952 ) ) ( not ( = ?auto_962946 ?auto_962953 ) ) ( not ( = ?auto_962946 ?auto_962954 ) ) ( not ( = ?auto_962946 ?auto_962955 ) ) ( not ( = ?auto_962946 ?auto_962956 ) ) ( not ( = ?auto_962946 ?auto_962957 ) ) ( not ( = ?auto_962946 ?auto_962958 ) ) ( not ( = ?auto_962947 ?auto_962948 ) ) ( not ( = ?auto_962947 ?auto_962949 ) ) ( not ( = ?auto_962947 ?auto_962950 ) ) ( not ( = ?auto_962947 ?auto_962951 ) ) ( not ( = ?auto_962947 ?auto_962952 ) ) ( not ( = ?auto_962947 ?auto_962953 ) ) ( not ( = ?auto_962947 ?auto_962954 ) ) ( not ( = ?auto_962947 ?auto_962955 ) ) ( not ( = ?auto_962947 ?auto_962956 ) ) ( not ( = ?auto_962947 ?auto_962957 ) ) ( not ( = ?auto_962947 ?auto_962958 ) ) ( not ( = ?auto_962948 ?auto_962949 ) ) ( not ( = ?auto_962948 ?auto_962950 ) ) ( not ( = ?auto_962948 ?auto_962951 ) ) ( not ( = ?auto_962948 ?auto_962952 ) ) ( not ( = ?auto_962948 ?auto_962953 ) ) ( not ( = ?auto_962948 ?auto_962954 ) ) ( not ( = ?auto_962948 ?auto_962955 ) ) ( not ( = ?auto_962948 ?auto_962956 ) ) ( not ( = ?auto_962948 ?auto_962957 ) ) ( not ( = ?auto_962948 ?auto_962958 ) ) ( not ( = ?auto_962949 ?auto_962950 ) ) ( not ( = ?auto_962949 ?auto_962951 ) ) ( not ( = ?auto_962949 ?auto_962952 ) ) ( not ( = ?auto_962949 ?auto_962953 ) ) ( not ( = ?auto_962949 ?auto_962954 ) ) ( not ( = ?auto_962949 ?auto_962955 ) ) ( not ( = ?auto_962949 ?auto_962956 ) ) ( not ( = ?auto_962949 ?auto_962957 ) ) ( not ( = ?auto_962949 ?auto_962958 ) ) ( not ( = ?auto_962950 ?auto_962951 ) ) ( not ( = ?auto_962950 ?auto_962952 ) ) ( not ( = ?auto_962950 ?auto_962953 ) ) ( not ( = ?auto_962950 ?auto_962954 ) ) ( not ( = ?auto_962950 ?auto_962955 ) ) ( not ( = ?auto_962950 ?auto_962956 ) ) ( not ( = ?auto_962950 ?auto_962957 ) ) ( not ( = ?auto_962950 ?auto_962958 ) ) ( not ( = ?auto_962951 ?auto_962952 ) ) ( not ( = ?auto_962951 ?auto_962953 ) ) ( not ( = ?auto_962951 ?auto_962954 ) ) ( not ( = ?auto_962951 ?auto_962955 ) ) ( not ( = ?auto_962951 ?auto_962956 ) ) ( not ( = ?auto_962951 ?auto_962957 ) ) ( not ( = ?auto_962951 ?auto_962958 ) ) ( not ( = ?auto_962952 ?auto_962953 ) ) ( not ( = ?auto_962952 ?auto_962954 ) ) ( not ( = ?auto_962952 ?auto_962955 ) ) ( not ( = ?auto_962952 ?auto_962956 ) ) ( not ( = ?auto_962952 ?auto_962957 ) ) ( not ( = ?auto_962952 ?auto_962958 ) ) ( not ( = ?auto_962953 ?auto_962954 ) ) ( not ( = ?auto_962953 ?auto_962955 ) ) ( not ( = ?auto_962953 ?auto_962956 ) ) ( not ( = ?auto_962953 ?auto_962957 ) ) ( not ( = ?auto_962953 ?auto_962958 ) ) ( not ( = ?auto_962954 ?auto_962955 ) ) ( not ( = ?auto_962954 ?auto_962956 ) ) ( not ( = ?auto_962954 ?auto_962957 ) ) ( not ( = ?auto_962954 ?auto_962958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962955 ?auto_962956 ?auto_962957 )
      ( MAKE-13CRATE-VERIFY ?auto_962944 ?auto_962945 ?auto_962946 ?auto_962947 ?auto_962948 ?auto_962949 ?auto_962950 ?auto_962951 ?auto_962952 ?auto_962953 ?auto_962954 ?auto_962955 ?auto_962956 ?auto_962957 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_963127 - SURFACE
      ?auto_963128 - SURFACE
      ?auto_963129 - SURFACE
      ?auto_963130 - SURFACE
      ?auto_963131 - SURFACE
      ?auto_963132 - SURFACE
      ?auto_963133 - SURFACE
      ?auto_963134 - SURFACE
      ?auto_963135 - SURFACE
      ?auto_963136 - SURFACE
      ?auto_963137 - SURFACE
      ?auto_963138 - SURFACE
      ?auto_963139 - SURFACE
      ?auto_963140 - SURFACE
    )
    :vars
    (
      ?auto_963142 - HOIST
      ?auto_963144 - PLACE
      ?auto_963145 - PLACE
      ?auto_963146 - HOIST
      ?auto_963143 - SURFACE
      ?auto_963141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963142 ?auto_963144 ) ( IS-CRATE ?auto_963140 ) ( not ( = ?auto_963139 ?auto_963140 ) ) ( not ( = ?auto_963138 ?auto_963139 ) ) ( not ( = ?auto_963138 ?auto_963140 ) ) ( not ( = ?auto_963145 ?auto_963144 ) ) ( HOIST-AT ?auto_963146 ?auto_963145 ) ( not ( = ?auto_963142 ?auto_963146 ) ) ( AVAILABLE ?auto_963146 ) ( SURFACE-AT ?auto_963140 ?auto_963145 ) ( ON ?auto_963140 ?auto_963143 ) ( CLEAR ?auto_963140 ) ( not ( = ?auto_963139 ?auto_963143 ) ) ( not ( = ?auto_963140 ?auto_963143 ) ) ( not ( = ?auto_963138 ?auto_963143 ) ) ( TRUCK-AT ?auto_963141 ?auto_963144 ) ( SURFACE-AT ?auto_963138 ?auto_963144 ) ( CLEAR ?auto_963138 ) ( LIFTING ?auto_963142 ?auto_963139 ) ( IS-CRATE ?auto_963139 ) ( ON ?auto_963128 ?auto_963127 ) ( ON ?auto_963129 ?auto_963128 ) ( ON ?auto_963130 ?auto_963129 ) ( ON ?auto_963131 ?auto_963130 ) ( ON ?auto_963132 ?auto_963131 ) ( ON ?auto_963133 ?auto_963132 ) ( ON ?auto_963134 ?auto_963133 ) ( ON ?auto_963135 ?auto_963134 ) ( ON ?auto_963136 ?auto_963135 ) ( ON ?auto_963137 ?auto_963136 ) ( ON ?auto_963138 ?auto_963137 ) ( not ( = ?auto_963127 ?auto_963128 ) ) ( not ( = ?auto_963127 ?auto_963129 ) ) ( not ( = ?auto_963127 ?auto_963130 ) ) ( not ( = ?auto_963127 ?auto_963131 ) ) ( not ( = ?auto_963127 ?auto_963132 ) ) ( not ( = ?auto_963127 ?auto_963133 ) ) ( not ( = ?auto_963127 ?auto_963134 ) ) ( not ( = ?auto_963127 ?auto_963135 ) ) ( not ( = ?auto_963127 ?auto_963136 ) ) ( not ( = ?auto_963127 ?auto_963137 ) ) ( not ( = ?auto_963127 ?auto_963138 ) ) ( not ( = ?auto_963127 ?auto_963139 ) ) ( not ( = ?auto_963127 ?auto_963140 ) ) ( not ( = ?auto_963127 ?auto_963143 ) ) ( not ( = ?auto_963128 ?auto_963129 ) ) ( not ( = ?auto_963128 ?auto_963130 ) ) ( not ( = ?auto_963128 ?auto_963131 ) ) ( not ( = ?auto_963128 ?auto_963132 ) ) ( not ( = ?auto_963128 ?auto_963133 ) ) ( not ( = ?auto_963128 ?auto_963134 ) ) ( not ( = ?auto_963128 ?auto_963135 ) ) ( not ( = ?auto_963128 ?auto_963136 ) ) ( not ( = ?auto_963128 ?auto_963137 ) ) ( not ( = ?auto_963128 ?auto_963138 ) ) ( not ( = ?auto_963128 ?auto_963139 ) ) ( not ( = ?auto_963128 ?auto_963140 ) ) ( not ( = ?auto_963128 ?auto_963143 ) ) ( not ( = ?auto_963129 ?auto_963130 ) ) ( not ( = ?auto_963129 ?auto_963131 ) ) ( not ( = ?auto_963129 ?auto_963132 ) ) ( not ( = ?auto_963129 ?auto_963133 ) ) ( not ( = ?auto_963129 ?auto_963134 ) ) ( not ( = ?auto_963129 ?auto_963135 ) ) ( not ( = ?auto_963129 ?auto_963136 ) ) ( not ( = ?auto_963129 ?auto_963137 ) ) ( not ( = ?auto_963129 ?auto_963138 ) ) ( not ( = ?auto_963129 ?auto_963139 ) ) ( not ( = ?auto_963129 ?auto_963140 ) ) ( not ( = ?auto_963129 ?auto_963143 ) ) ( not ( = ?auto_963130 ?auto_963131 ) ) ( not ( = ?auto_963130 ?auto_963132 ) ) ( not ( = ?auto_963130 ?auto_963133 ) ) ( not ( = ?auto_963130 ?auto_963134 ) ) ( not ( = ?auto_963130 ?auto_963135 ) ) ( not ( = ?auto_963130 ?auto_963136 ) ) ( not ( = ?auto_963130 ?auto_963137 ) ) ( not ( = ?auto_963130 ?auto_963138 ) ) ( not ( = ?auto_963130 ?auto_963139 ) ) ( not ( = ?auto_963130 ?auto_963140 ) ) ( not ( = ?auto_963130 ?auto_963143 ) ) ( not ( = ?auto_963131 ?auto_963132 ) ) ( not ( = ?auto_963131 ?auto_963133 ) ) ( not ( = ?auto_963131 ?auto_963134 ) ) ( not ( = ?auto_963131 ?auto_963135 ) ) ( not ( = ?auto_963131 ?auto_963136 ) ) ( not ( = ?auto_963131 ?auto_963137 ) ) ( not ( = ?auto_963131 ?auto_963138 ) ) ( not ( = ?auto_963131 ?auto_963139 ) ) ( not ( = ?auto_963131 ?auto_963140 ) ) ( not ( = ?auto_963131 ?auto_963143 ) ) ( not ( = ?auto_963132 ?auto_963133 ) ) ( not ( = ?auto_963132 ?auto_963134 ) ) ( not ( = ?auto_963132 ?auto_963135 ) ) ( not ( = ?auto_963132 ?auto_963136 ) ) ( not ( = ?auto_963132 ?auto_963137 ) ) ( not ( = ?auto_963132 ?auto_963138 ) ) ( not ( = ?auto_963132 ?auto_963139 ) ) ( not ( = ?auto_963132 ?auto_963140 ) ) ( not ( = ?auto_963132 ?auto_963143 ) ) ( not ( = ?auto_963133 ?auto_963134 ) ) ( not ( = ?auto_963133 ?auto_963135 ) ) ( not ( = ?auto_963133 ?auto_963136 ) ) ( not ( = ?auto_963133 ?auto_963137 ) ) ( not ( = ?auto_963133 ?auto_963138 ) ) ( not ( = ?auto_963133 ?auto_963139 ) ) ( not ( = ?auto_963133 ?auto_963140 ) ) ( not ( = ?auto_963133 ?auto_963143 ) ) ( not ( = ?auto_963134 ?auto_963135 ) ) ( not ( = ?auto_963134 ?auto_963136 ) ) ( not ( = ?auto_963134 ?auto_963137 ) ) ( not ( = ?auto_963134 ?auto_963138 ) ) ( not ( = ?auto_963134 ?auto_963139 ) ) ( not ( = ?auto_963134 ?auto_963140 ) ) ( not ( = ?auto_963134 ?auto_963143 ) ) ( not ( = ?auto_963135 ?auto_963136 ) ) ( not ( = ?auto_963135 ?auto_963137 ) ) ( not ( = ?auto_963135 ?auto_963138 ) ) ( not ( = ?auto_963135 ?auto_963139 ) ) ( not ( = ?auto_963135 ?auto_963140 ) ) ( not ( = ?auto_963135 ?auto_963143 ) ) ( not ( = ?auto_963136 ?auto_963137 ) ) ( not ( = ?auto_963136 ?auto_963138 ) ) ( not ( = ?auto_963136 ?auto_963139 ) ) ( not ( = ?auto_963136 ?auto_963140 ) ) ( not ( = ?auto_963136 ?auto_963143 ) ) ( not ( = ?auto_963137 ?auto_963138 ) ) ( not ( = ?auto_963137 ?auto_963139 ) ) ( not ( = ?auto_963137 ?auto_963140 ) ) ( not ( = ?auto_963137 ?auto_963143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963138 ?auto_963139 ?auto_963140 )
      ( MAKE-13CRATE-VERIFY ?auto_963127 ?auto_963128 ?auto_963129 ?auto_963130 ?auto_963131 ?auto_963132 ?auto_963133 ?auto_963134 ?auto_963135 ?auto_963136 ?auto_963137 ?auto_963138 ?auto_963139 ?auto_963140 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_963310 - SURFACE
      ?auto_963311 - SURFACE
      ?auto_963312 - SURFACE
      ?auto_963313 - SURFACE
      ?auto_963314 - SURFACE
      ?auto_963315 - SURFACE
      ?auto_963316 - SURFACE
      ?auto_963317 - SURFACE
      ?auto_963318 - SURFACE
      ?auto_963319 - SURFACE
      ?auto_963320 - SURFACE
      ?auto_963321 - SURFACE
      ?auto_963322 - SURFACE
      ?auto_963323 - SURFACE
    )
    :vars
    (
      ?auto_963324 - HOIST
      ?auto_963329 - PLACE
      ?auto_963326 - PLACE
      ?auto_963327 - HOIST
      ?auto_963328 - SURFACE
      ?auto_963325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963324 ?auto_963329 ) ( IS-CRATE ?auto_963323 ) ( not ( = ?auto_963322 ?auto_963323 ) ) ( not ( = ?auto_963321 ?auto_963322 ) ) ( not ( = ?auto_963321 ?auto_963323 ) ) ( not ( = ?auto_963326 ?auto_963329 ) ) ( HOIST-AT ?auto_963327 ?auto_963326 ) ( not ( = ?auto_963324 ?auto_963327 ) ) ( AVAILABLE ?auto_963327 ) ( SURFACE-AT ?auto_963323 ?auto_963326 ) ( ON ?auto_963323 ?auto_963328 ) ( CLEAR ?auto_963323 ) ( not ( = ?auto_963322 ?auto_963328 ) ) ( not ( = ?auto_963323 ?auto_963328 ) ) ( not ( = ?auto_963321 ?auto_963328 ) ) ( TRUCK-AT ?auto_963325 ?auto_963329 ) ( SURFACE-AT ?auto_963321 ?auto_963329 ) ( CLEAR ?auto_963321 ) ( IS-CRATE ?auto_963322 ) ( AVAILABLE ?auto_963324 ) ( IN ?auto_963322 ?auto_963325 ) ( ON ?auto_963311 ?auto_963310 ) ( ON ?auto_963312 ?auto_963311 ) ( ON ?auto_963313 ?auto_963312 ) ( ON ?auto_963314 ?auto_963313 ) ( ON ?auto_963315 ?auto_963314 ) ( ON ?auto_963316 ?auto_963315 ) ( ON ?auto_963317 ?auto_963316 ) ( ON ?auto_963318 ?auto_963317 ) ( ON ?auto_963319 ?auto_963318 ) ( ON ?auto_963320 ?auto_963319 ) ( ON ?auto_963321 ?auto_963320 ) ( not ( = ?auto_963310 ?auto_963311 ) ) ( not ( = ?auto_963310 ?auto_963312 ) ) ( not ( = ?auto_963310 ?auto_963313 ) ) ( not ( = ?auto_963310 ?auto_963314 ) ) ( not ( = ?auto_963310 ?auto_963315 ) ) ( not ( = ?auto_963310 ?auto_963316 ) ) ( not ( = ?auto_963310 ?auto_963317 ) ) ( not ( = ?auto_963310 ?auto_963318 ) ) ( not ( = ?auto_963310 ?auto_963319 ) ) ( not ( = ?auto_963310 ?auto_963320 ) ) ( not ( = ?auto_963310 ?auto_963321 ) ) ( not ( = ?auto_963310 ?auto_963322 ) ) ( not ( = ?auto_963310 ?auto_963323 ) ) ( not ( = ?auto_963310 ?auto_963328 ) ) ( not ( = ?auto_963311 ?auto_963312 ) ) ( not ( = ?auto_963311 ?auto_963313 ) ) ( not ( = ?auto_963311 ?auto_963314 ) ) ( not ( = ?auto_963311 ?auto_963315 ) ) ( not ( = ?auto_963311 ?auto_963316 ) ) ( not ( = ?auto_963311 ?auto_963317 ) ) ( not ( = ?auto_963311 ?auto_963318 ) ) ( not ( = ?auto_963311 ?auto_963319 ) ) ( not ( = ?auto_963311 ?auto_963320 ) ) ( not ( = ?auto_963311 ?auto_963321 ) ) ( not ( = ?auto_963311 ?auto_963322 ) ) ( not ( = ?auto_963311 ?auto_963323 ) ) ( not ( = ?auto_963311 ?auto_963328 ) ) ( not ( = ?auto_963312 ?auto_963313 ) ) ( not ( = ?auto_963312 ?auto_963314 ) ) ( not ( = ?auto_963312 ?auto_963315 ) ) ( not ( = ?auto_963312 ?auto_963316 ) ) ( not ( = ?auto_963312 ?auto_963317 ) ) ( not ( = ?auto_963312 ?auto_963318 ) ) ( not ( = ?auto_963312 ?auto_963319 ) ) ( not ( = ?auto_963312 ?auto_963320 ) ) ( not ( = ?auto_963312 ?auto_963321 ) ) ( not ( = ?auto_963312 ?auto_963322 ) ) ( not ( = ?auto_963312 ?auto_963323 ) ) ( not ( = ?auto_963312 ?auto_963328 ) ) ( not ( = ?auto_963313 ?auto_963314 ) ) ( not ( = ?auto_963313 ?auto_963315 ) ) ( not ( = ?auto_963313 ?auto_963316 ) ) ( not ( = ?auto_963313 ?auto_963317 ) ) ( not ( = ?auto_963313 ?auto_963318 ) ) ( not ( = ?auto_963313 ?auto_963319 ) ) ( not ( = ?auto_963313 ?auto_963320 ) ) ( not ( = ?auto_963313 ?auto_963321 ) ) ( not ( = ?auto_963313 ?auto_963322 ) ) ( not ( = ?auto_963313 ?auto_963323 ) ) ( not ( = ?auto_963313 ?auto_963328 ) ) ( not ( = ?auto_963314 ?auto_963315 ) ) ( not ( = ?auto_963314 ?auto_963316 ) ) ( not ( = ?auto_963314 ?auto_963317 ) ) ( not ( = ?auto_963314 ?auto_963318 ) ) ( not ( = ?auto_963314 ?auto_963319 ) ) ( not ( = ?auto_963314 ?auto_963320 ) ) ( not ( = ?auto_963314 ?auto_963321 ) ) ( not ( = ?auto_963314 ?auto_963322 ) ) ( not ( = ?auto_963314 ?auto_963323 ) ) ( not ( = ?auto_963314 ?auto_963328 ) ) ( not ( = ?auto_963315 ?auto_963316 ) ) ( not ( = ?auto_963315 ?auto_963317 ) ) ( not ( = ?auto_963315 ?auto_963318 ) ) ( not ( = ?auto_963315 ?auto_963319 ) ) ( not ( = ?auto_963315 ?auto_963320 ) ) ( not ( = ?auto_963315 ?auto_963321 ) ) ( not ( = ?auto_963315 ?auto_963322 ) ) ( not ( = ?auto_963315 ?auto_963323 ) ) ( not ( = ?auto_963315 ?auto_963328 ) ) ( not ( = ?auto_963316 ?auto_963317 ) ) ( not ( = ?auto_963316 ?auto_963318 ) ) ( not ( = ?auto_963316 ?auto_963319 ) ) ( not ( = ?auto_963316 ?auto_963320 ) ) ( not ( = ?auto_963316 ?auto_963321 ) ) ( not ( = ?auto_963316 ?auto_963322 ) ) ( not ( = ?auto_963316 ?auto_963323 ) ) ( not ( = ?auto_963316 ?auto_963328 ) ) ( not ( = ?auto_963317 ?auto_963318 ) ) ( not ( = ?auto_963317 ?auto_963319 ) ) ( not ( = ?auto_963317 ?auto_963320 ) ) ( not ( = ?auto_963317 ?auto_963321 ) ) ( not ( = ?auto_963317 ?auto_963322 ) ) ( not ( = ?auto_963317 ?auto_963323 ) ) ( not ( = ?auto_963317 ?auto_963328 ) ) ( not ( = ?auto_963318 ?auto_963319 ) ) ( not ( = ?auto_963318 ?auto_963320 ) ) ( not ( = ?auto_963318 ?auto_963321 ) ) ( not ( = ?auto_963318 ?auto_963322 ) ) ( not ( = ?auto_963318 ?auto_963323 ) ) ( not ( = ?auto_963318 ?auto_963328 ) ) ( not ( = ?auto_963319 ?auto_963320 ) ) ( not ( = ?auto_963319 ?auto_963321 ) ) ( not ( = ?auto_963319 ?auto_963322 ) ) ( not ( = ?auto_963319 ?auto_963323 ) ) ( not ( = ?auto_963319 ?auto_963328 ) ) ( not ( = ?auto_963320 ?auto_963321 ) ) ( not ( = ?auto_963320 ?auto_963322 ) ) ( not ( = ?auto_963320 ?auto_963323 ) ) ( not ( = ?auto_963320 ?auto_963328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963321 ?auto_963322 ?auto_963323 )
      ( MAKE-13CRATE-VERIFY ?auto_963310 ?auto_963311 ?auto_963312 ?auto_963313 ?auto_963314 ?auto_963315 ?auto_963316 ?auto_963317 ?auto_963318 ?auto_963319 ?auto_963320 ?auto_963321 ?auto_963322 ?auto_963323 ) )
  )

)

