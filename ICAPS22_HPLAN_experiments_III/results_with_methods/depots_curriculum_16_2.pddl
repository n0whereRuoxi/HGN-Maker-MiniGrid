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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25298 - SURFACE
      ?auto_25299 - SURFACE
    )
    :vars
    (
      ?auto_25300 - HOIST
      ?auto_25301 - PLACE
      ?auto_25303 - PLACE
      ?auto_25304 - HOIST
      ?auto_25305 - SURFACE
      ?auto_25302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25300 ?auto_25301 ) ( SURFACE-AT ?auto_25298 ?auto_25301 ) ( CLEAR ?auto_25298 ) ( IS-CRATE ?auto_25299 ) ( AVAILABLE ?auto_25300 ) ( not ( = ?auto_25303 ?auto_25301 ) ) ( HOIST-AT ?auto_25304 ?auto_25303 ) ( AVAILABLE ?auto_25304 ) ( SURFACE-AT ?auto_25299 ?auto_25303 ) ( ON ?auto_25299 ?auto_25305 ) ( CLEAR ?auto_25299 ) ( TRUCK-AT ?auto_25302 ?auto_25301 ) ( not ( = ?auto_25298 ?auto_25299 ) ) ( not ( = ?auto_25298 ?auto_25305 ) ) ( not ( = ?auto_25299 ?auto_25305 ) ) ( not ( = ?auto_25300 ?auto_25304 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25302 ?auto_25301 ?auto_25303 )
      ( !LIFT ?auto_25304 ?auto_25299 ?auto_25305 ?auto_25303 )
      ( !LOAD ?auto_25304 ?auto_25299 ?auto_25302 ?auto_25303 )
      ( !DRIVE ?auto_25302 ?auto_25303 ?auto_25301 )
      ( !UNLOAD ?auto_25300 ?auto_25299 ?auto_25302 ?auto_25301 )
      ( !DROP ?auto_25300 ?auto_25299 ?auto_25298 ?auto_25301 )
      ( MAKE-1CRATE-VERIFY ?auto_25298 ?auto_25299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25308 - SURFACE
      ?auto_25309 - SURFACE
    )
    :vars
    (
      ?auto_25310 - HOIST
      ?auto_25311 - PLACE
      ?auto_25313 - PLACE
      ?auto_25314 - HOIST
      ?auto_25315 - SURFACE
      ?auto_25312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25310 ?auto_25311 ) ( SURFACE-AT ?auto_25308 ?auto_25311 ) ( CLEAR ?auto_25308 ) ( IS-CRATE ?auto_25309 ) ( AVAILABLE ?auto_25310 ) ( not ( = ?auto_25313 ?auto_25311 ) ) ( HOIST-AT ?auto_25314 ?auto_25313 ) ( AVAILABLE ?auto_25314 ) ( SURFACE-AT ?auto_25309 ?auto_25313 ) ( ON ?auto_25309 ?auto_25315 ) ( CLEAR ?auto_25309 ) ( TRUCK-AT ?auto_25312 ?auto_25311 ) ( not ( = ?auto_25308 ?auto_25309 ) ) ( not ( = ?auto_25308 ?auto_25315 ) ) ( not ( = ?auto_25309 ?auto_25315 ) ) ( not ( = ?auto_25310 ?auto_25314 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25312 ?auto_25311 ?auto_25313 )
      ( !LIFT ?auto_25314 ?auto_25309 ?auto_25315 ?auto_25313 )
      ( !LOAD ?auto_25314 ?auto_25309 ?auto_25312 ?auto_25313 )
      ( !DRIVE ?auto_25312 ?auto_25313 ?auto_25311 )
      ( !UNLOAD ?auto_25310 ?auto_25309 ?auto_25312 ?auto_25311 )
      ( !DROP ?auto_25310 ?auto_25309 ?auto_25308 ?auto_25311 )
      ( MAKE-1CRATE-VERIFY ?auto_25308 ?auto_25309 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25319 - SURFACE
      ?auto_25320 - SURFACE
      ?auto_25321 - SURFACE
    )
    :vars
    (
      ?auto_25326 - HOIST
      ?auto_25323 - PLACE
      ?auto_25324 - PLACE
      ?auto_25322 - HOIST
      ?auto_25327 - SURFACE
      ?auto_25330 - PLACE
      ?auto_25328 - HOIST
      ?auto_25329 - SURFACE
      ?auto_25325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25326 ?auto_25323 ) ( IS-CRATE ?auto_25321 ) ( not ( = ?auto_25324 ?auto_25323 ) ) ( HOIST-AT ?auto_25322 ?auto_25324 ) ( AVAILABLE ?auto_25322 ) ( SURFACE-AT ?auto_25321 ?auto_25324 ) ( ON ?auto_25321 ?auto_25327 ) ( CLEAR ?auto_25321 ) ( not ( = ?auto_25320 ?auto_25321 ) ) ( not ( = ?auto_25320 ?auto_25327 ) ) ( not ( = ?auto_25321 ?auto_25327 ) ) ( not ( = ?auto_25326 ?auto_25322 ) ) ( SURFACE-AT ?auto_25319 ?auto_25323 ) ( CLEAR ?auto_25319 ) ( IS-CRATE ?auto_25320 ) ( AVAILABLE ?auto_25326 ) ( not ( = ?auto_25330 ?auto_25323 ) ) ( HOIST-AT ?auto_25328 ?auto_25330 ) ( AVAILABLE ?auto_25328 ) ( SURFACE-AT ?auto_25320 ?auto_25330 ) ( ON ?auto_25320 ?auto_25329 ) ( CLEAR ?auto_25320 ) ( TRUCK-AT ?auto_25325 ?auto_25323 ) ( not ( = ?auto_25319 ?auto_25320 ) ) ( not ( = ?auto_25319 ?auto_25329 ) ) ( not ( = ?auto_25320 ?auto_25329 ) ) ( not ( = ?auto_25326 ?auto_25328 ) ) ( not ( = ?auto_25319 ?auto_25321 ) ) ( not ( = ?auto_25319 ?auto_25327 ) ) ( not ( = ?auto_25321 ?auto_25329 ) ) ( not ( = ?auto_25324 ?auto_25330 ) ) ( not ( = ?auto_25322 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25329 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25319 ?auto_25320 )
      ( MAKE-1CRATE ?auto_25320 ?auto_25321 )
      ( MAKE-2CRATE-VERIFY ?auto_25319 ?auto_25320 ?auto_25321 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25333 - SURFACE
      ?auto_25334 - SURFACE
    )
    :vars
    (
      ?auto_25335 - HOIST
      ?auto_25336 - PLACE
      ?auto_25338 - PLACE
      ?auto_25339 - HOIST
      ?auto_25340 - SURFACE
      ?auto_25337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25335 ?auto_25336 ) ( SURFACE-AT ?auto_25333 ?auto_25336 ) ( CLEAR ?auto_25333 ) ( IS-CRATE ?auto_25334 ) ( AVAILABLE ?auto_25335 ) ( not ( = ?auto_25338 ?auto_25336 ) ) ( HOIST-AT ?auto_25339 ?auto_25338 ) ( AVAILABLE ?auto_25339 ) ( SURFACE-AT ?auto_25334 ?auto_25338 ) ( ON ?auto_25334 ?auto_25340 ) ( CLEAR ?auto_25334 ) ( TRUCK-AT ?auto_25337 ?auto_25336 ) ( not ( = ?auto_25333 ?auto_25334 ) ) ( not ( = ?auto_25333 ?auto_25340 ) ) ( not ( = ?auto_25334 ?auto_25340 ) ) ( not ( = ?auto_25335 ?auto_25339 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25337 ?auto_25336 ?auto_25338 )
      ( !LIFT ?auto_25339 ?auto_25334 ?auto_25340 ?auto_25338 )
      ( !LOAD ?auto_25339 ?auto_25334 ?auto_25337 ?auto_25338 )
      ( !DRIVE ?auto_25337 ?auto_25338 ?auto_25336 )
      ( !UNLOAD ?auto_25335 ?auto_25334 ?auto_25337 ?auto_25336 )
      ( !DROP ?auto_25335 ?auto_25334 ?auto_25333 ?auto_25336 )
      ( MAKE-1CRATE-VERIFY ?auto_25333 ?auto_25334 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25345 - SURFACE
      ?auto_25346 - SURFACE
      ?auto_25347 - SURFACE
      ?auto_25348 - SURFACE
    )
    :vars
    (
      ?auto_25351 - HOIST
      ?auto_25354 - PLACE
      ?auto_25352 - PLACE
      ?auto_25349 - HOIST
      ?auto_25350 - SURFACE
      ?auto_25359 - PLACE
      ?auto_25360 - HOIST
      ?auto_25355 - SURFACE
      ?auto_25357 - PLACE
      ?auto_25358 - HOIST
      ?auto_25356 - SURFACE
      ?auto_25353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25351 ?auto_25354 ) ( IS-CRATE ?auto_25348 ) ( not ( = ?auto_25352 ?auto_25354 ) ) ( HOIST-AT ?auto_25349 ?auto_25352 ) ( AVAILABLE ?auto_25349 ) ( SURFACE-AT ?auto_25348 ?auto_25352 ) ( ON ?auto_25348 ?auto_25350 ) ( CLEAR ?auto_25348 ) ( not ( = ?auto_25347 ?auto_25348 ) ) ( not ( = ?auto_25347 ?auto_25350 ) ) ( not ( = ?auto_25348 ?auto_25350 ) ) ( not ( = ?auto_25351 ?auto_25349 ) ) ( IS-CRATE ?auto_25347 ) ( not ( = ?auto_25359 ?auto_25354 ) ) ( HOIST-AT ?auto_25360 ?auto_25359 ) ( AVAILABLE ?auto_25360 ) ( SURFACE-AT ?auto_25347 ?auto_25359 ) ( ON ?auto_25347 ?auto_25355 ) ( CLEAR ?auto_25347 ) ( not ( = ?auto_25346 ?auto_25347 ) ) ( not ( = ?auto_25346 ?auto_25355 ) ) ( not ( = ?auto_25347 ?auto_25355 ) ) ( not ( = ?auto_25351 ?auto_25360 ) ) ( SURFACE-AT ?auto_25345 ?auto_25354 ) ( CLEAR ?auto_25345 ) ( IS-CRATE ?auto_25346 ) ( AVAILABLE ?auto_25351 ) ( not ( = ?auto_25357 ?auto_25354 ) ) ( HOIST-AT ?auto_25358 ?auto_25357 ) ( AVAILABLE ?auto_25358 ) ( SURFACE-AT ?auto_25346 ?auto_25357 ) ( ON ?auto_25346 ?auto_25356 ) ( CLEAR ?auto_25346 ) ( TRUCK-AT ?auto_25353 ?auto_25354 ) ( not ( = ?auto_25345 ?auto_25346 ) ) ( not ( = ?auto_25345 ?auto_25356 ) ) ( not ( = ?auto_25346 ?auto_25356 ) ) ( not ( = ?auto_25351 ?auto_25358 ) ) ( not ( = ?auto_25345 ?auto_25347 ) ) ( not ( = ?auto_25345 ?auto_25355 ) ) ( not ( = ?auto_25347 ?auto_25356 ) ) ( not ( = ?auto_25359 ?auto_25357 ) ) ( not ( = ?auto_25360 ?auto_25358 ) ) ( not ( = ?auto_25355 ?auto_25356 ) ) ( not ( = ?auto_25345 ?auto_25348 ) ) ( not ( = ?auto_25345 ?auto_25350 ) ) ( not ( = ?auto_25346 ?auto_25348 ) ) ( not ( = ?auto_25346 ?auto_25350 ) ) ( not ( = ?auto_25348 ?auto_25355 ) ) ( not ( = ?auto_25348 ?auto_25356 ) ) ( not ( = ?auto_25352 ?auto_25359 ) ) ( not ( = ?auto_25352 ?auto_25357 ) ) ( not ( = ?auto_25349 ?auto_25360 ) ) ( not ( = ?auto_25349 ?auto_25358 ) ) ( not ( = ?auto_25350 ?auto_25355 ) ) ( not ( = ?auto_25350 ?auto_25356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25345 ?auto_25346 ?auto_25347 )
      ( MAKE-1CRATE ?auto_25347 ?auto_25348 )
      ( MAKE-3CRATE-VERIFY ?auto_25345 ?auto_25346 ?auto_25347 ?auto_25348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25363 - SURFACE
      ?auto_25364 - SURFACE
    )
    :vars
    (
      ?auto_25365 - HOIST
      ?auto_25366 - PLACE
      ?auto_25368 - PLACE
      ?auto_25369 - HOIST
      ?auto_25370 - SURFACE
      ?auto_25367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25365 ?auto_25366 ) ( SURFACE-AT ?auto_25363 ?auto_25366 ) ( CLEAR ?auto_25363 ) ( IS-CRATE ?auto_25364 ) ( AVAILABLE ?auto_25365 ) ( not ( = ?auto_25368 ?auto_25366 ) ) ( HOIST-AT ?auto_25369 ?auto_25368 ) ( AVAILABLE ?auto_25369 ) ( SURFACE-AT ?auto_25364 ?auto_25368 ) ( ON ?auto_25364 ?auto_25370 ) ( CLEAR ?auto_25364 ) ( TRUCK-AT ?auto_25367 ?auto_25366 ) ( not ( = ?auto_25363 ?auto_25364 ) ) ( not ( = ?auto_25363 ?auto_25370 ) ) ( not ( = ?auto_25364 ?auto_25370 ) ) ( not ( = ?auto_25365 ?auto_25369 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25367 ?auto_25366 ?auto_25368 )
      ( !LIFT ?auto_25369 ?auto_25364 ?auto_25370 ?auto_25368 )
      ( !LOAD ?auto_25369 ?auto_25364 ?auto_25367 ?auto_25368 )
      ( !DRIVE ?auto_25367 ?auto_25368 ?auto_25366 )
      ( !UNLOAD ?auto_25365 ?auto_25364 ?auto_25367 ?auto_25366 )
      ( !DROP ?auto_25365 ?auto_25364 ?auto_25363 ?auto_25366 )
      ( MAKE-1CRATE-VERIFY ?auto_25363 ?auto_25364 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25376 - SURFACE
      ?auto_25377 - SURFACE
      ?auto_25378 - SURFACE
      ?auto_25379 - SURFACE
      ?auto_25380 - SURFACE
    )
    :vars
    (
      ?auto_25385 - HOIST
      ?auto_25386 - PLACE
      ?auto_25381 - PLACE
      ?auto_25383 - HOIST
      ?auto_25382 - SURFACE
      ?auto_25391 - PLACE
      ?auto_25389 - HOIST
      ?auto_25392 - SURFACE
      ?auto_25395 - PLACE
      ?auto_25393 - HOIST
      ?auto_25394 - SURFACE
      ?auto_25390 - PLACE
      ?auto_25387 - HOIST
      ?auto_25388 - SURFACE
      ?auto_25384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25385 ?auto_25386 ) ( IS-CRATE ?auto_25380 ) ( not ( = ?auto_25381 ?auto_25386 ) ) ( HOIST-AT ?auto_25383 ?auto_25381 ) ( AVAILABLE ?auto_25383 ) ( SURFACE-AT ?auto_25380 ?auto_25381 ) ( ON ?auto_25380 ?auto_25382 ) ( CLEAR ?auto_25380 ) ( not ( = ?auto_25379 ?auto_25380 ) ) ( not ( = ?auto_25379 ?auto_25382 ) ) ( not ( = ?auto_25380 ?auto_25382 ) ) ( not ( = ?auto_25385 ?auto_25383 ) ) ( IS-CRATE ?auto_25379 ) ( not ( = ?auto_25391 ?auto_25386 ) ) ( HOIST-AT ?auto_25389 ?auto_25391 ) ( AVAILABLE ?auto_25389 ) ( SURFACE-AT ?auto_25379 ?auto_25391 ) ( ON ?auto_25379 ?auto_25392 ) ( CLEAR ?auto_25379 ) ( not ( = ?auto_25378 ?auto_25379 ) ) ( not ( = ?auto_25378 ?auto_25392 ) ) ( not ( = ?auto_25379 ?auto_25392 ) ) ( not ( = ?auto_25385 ?auto_25389 ) ) ( IS-CRATE ?auto_25378 ) ( not ( = ?auto_25395 ?auto_25386 ) ) ( HOIST-AT ?auto_25393 ?auto_25395 ) ( AVAILABLE ?auto_25393 ) ( SURFACE-AT ?auto_25378 ?auto_25395 ) ( ON ?auto_25378 ?auto_25394 ) ( CLEAR ?auto_25378 ) ( not ( = ?auto_25377 ?auto_25378 ) ) ( not ( = ?auto_25377 ?auto_25394 ) ) ( not ( = ?auto_25378 ?auto_25394 ) ) ( not ( = ?auto_25385 ?auto_25393 ) ) ( SURFACE-AT ?auto_25376 ?auto_25386 ) ( CLEAR ?auto_25376 ) ( IS-CRATE ?auto_25377 ) ( AVAILABLE ?auto_25385 ) ( not ( = ?auto_25390 ?auto_25386 ) ) ( HOIST-AT ?auto_25387 ?auto_25390 ) ( AVAILABLE ?auto_25387 ) ( SURFACE-AT ?auto_25377 ?auto_25390 ) ( ON ?auto_25377 ?auto_25388 ) ( CLEAR ?auto_25377 ) ( TRUCK-AT ?auto_25384 ?auto_25386 ) ( not ( = ?auto_25376 ?auto_25377 ) ) ( not ( = ?auto_25376 ?auto_25388 ) ) ( not ( = ?auto_25377 ?auto_25388 ) ) ( not ( = ?auto_25385 ?auto_25387 ) ) ( not ( = ?auto_25376 ?auto_25378 ) ) ( not ( = ?auto_25376 ?auto_25394 ) ) ( not ( = ?auto_25378 ?auto_25388 ) ) ( not ( = ?auto_25395 ?auto_25390 ) ) ( not ( = ?auto_25393 ?auto_25387 ) ) ( not ( = ?auto_25394 ?auto_25388 ) ) ( not ( = ?auto_25376 ?auto_25379 ) ) ( not ( = ?auto_25376 ?auto_25392 ) ) ( not ( = ?auto_25377 ?auto_25379 ) ) ( not ( = ?auto_25377 ?auto_25392 ) ) ( not ( = ?auto_25379 ?auto_25394 ) ) ( not ( = ?auto_25379 ?auto_25388 ) ) ( not ( = ?auto_25391 ?auto_25395 ) ) ( not ( = ?auto_25391 ?auto_25390 ) ) ( not ( = ?auto_25389 ?auto_25393 ) ) ( not ( = ?auto_25389 ?auto_25387 ) ) ( not ( = ?auto_25392 ?auto_25394 ) ) ( not ( = ?auto_25392 ?auto_25388 ) ) ( not ( = ?auto_25376 ?auto_25380 ) ) ( not ( = ?auto_25376 ?auto_25382 ) ) ( not ( = ?auto_25377 ?auto_25380 ) ) ( not ( = ?auto_25377 ?auto_25382 ) ) ( not ( = ?auto_25378 ?auto_25380 ) ) ( not ( = ?auto_25378 ?auto_25382 ) ) ( not ( = ?auto_25380 ?auto_25392 ) ) ( not ( = ?auto_25380 ?auto_25394 ) ) ( not ( = ?auto_25380 ?auto_25388 ) ) ( not ( = ?auto_25381 ?auto_25391 ) ) ( not ( = ?auto_25381 ?auto_25395 ) ) ( not ( = ?auto_25381 ?auto_25390 ) ) ( not ( = ?auto_25383 ?auto_25389 ) ) ( not ( = ?auto_25383 ?auto_25393 ) ) ( not ( = ?auto_25383 ?auto_25387 ) ) ( not ( = ?auto_25382 ?auto_25392 ) ) ( not ( = ?auto_25382 ?auto_25394 ) ) ( not ( = ?auto_25382 ?auto_25388 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_25376 ?auto_25377 ?auto_25378 ?auto_25379 )
      ( MAKE-1CRATE ?auto_25379 ?auto_25380 )
      ( MAKE-4CRATE-VERIFY ?auto_25376 ?auto_25377 ?auto_25378 ?auto_25379 ?auto_25380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25398 - SURFACE
      ?auto_25399 - SURFACE
    )
    :vars
    (
      ?auto_25400 - HOIST
      ?auto_25401 - PLACE
      ?auto_25403 - PLACE
      ?auto_25404 - HOIST
      ?auto_25405 - SURFACE
      ?auto_25402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25400 ?auto_25401 ) ( SURFACE-AT ?auto_25398 ?auto_25401 ) ( CLEAR ?auto_25398 ) ( IS-CRATE ?auto_25399 ) ( AVAILABLE ?auto_25400 ) ( not ( = ?auto_25403 ?auto_25401 ) ) ( HOIST-AT ?auto_25404 ?auto_25403 ) ( AVAILABLE ?auto_25404 ) ( SURFACE-AT ?auto_25399 ?auto_25403 ) ( ON ?auto_25399 ?auto_25405 ) ( CLEAR ?auto_25399 ) ( TRUCK-AT ?auto_25402 ?auto_25401 ) ( not ( = ?auto_25398 ?auto_25399 ) ) ( not ( = ?auto_25398 ?auto_25405 ) ) ( not ( = ?auto_25399 ?auto_25405 ) ) ( not ( = ?auto_25400 ?auto_25404 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25402 ?auto_25401 ?auto_25403 )
      ( !LIFT ?auto_25404 ?auto_25399 ?auto_25405 ?auto_25403 )
      ( !LOAD ?auto_25404 ?auto_25399 ?auto_25402 ?auto_25403 )
      ( !DRIVE ?auto_25402 ?auto_25403 ?auto_25401 )
      ( !UNLOAD ?auto_25400 ?auto_25399 ?auto_25402 ?auto_25401 )
      ( !DROP ?auto_25400 ?auto_25399 ?auto_25398 ?auto_25401 )
      ( MAKE-1CRATE-VERIFY ?auto_25398 ?auto_25399 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_25412 - SURFACE
      ?auto_25413 - SURFACE
      ?auto_25414 - SURFACE
      ?auto_25415 - SURFACE
      ?auto_25416 - SURFACE
      ?auto_25417 - SURFACE
    )
    :vars
    (
      ?auto_25419 - HOIST
      ?auto_25418 - PLACE
      ?auto_25423 - PLACE
      ?auto_25422 - HOIST
      ?auto_25421 - SURFACE
      ?auto_25431 - PLACE
      ?auto_25429 - HOIST
      ?auto_25425 - SURFACE
      ?auto_25432 - SURFACE
      ?auto_25433 - PLACE
      ?auto_25427 - HOIST
      ?auto_25426 - SURFACE
      ?auto_25424 - PLACE
      ?auto_25430 - HOIST
      ?auto_25428 - SURFACE
      ?auto_25420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25419 ?auto_25418 ) ( IS-CRATE ?auto_25417 ) ( not ( = ?auto_25423 ?auto_25418 ) ) ( HOIST-AT ?auto_25422 ?auto_25423 ) ( SURFACE-AT ?auto_25417 ?auto_25423 ) ( ON ?auto_25417 ?auto_25421 ) ( CLEAR ?auto_25417 ) ( not ( = ?auto_25416 ?auto_25417 ) ) ( not ( = ?auto_25416 ?auto_25421 ) ) ( not ( = ?auto_25417 ?auto_25421 ) ) ( not ( = ?auto_25419 ?auto_25422 ) ) ( IS-CRATE ?auto_25416 ) ( not ( = ?auto_25431 ?auto_25418 ) ) ( HOIST-AT ?auto_25429 ?auto_25431 ) ( AVAILABLE ?auto_25429 ) ( SURFACE-AT ?auto_25416 ?auto_25431 ) ( ON ?auto_25416 ?auto_25425 ) ( CLEAR ?auto_25416 ) ( not ( = ?auto_25415 ?auto_25416 ) ) ( not ( = ?auto_25415 ?auto_25425 ) ) ( not ( = ?auto_25416 ?auto_25425 ) ) ( not ( = ?auto_25419 ?auto_25429 ) ) ( IS-CRATE ?auto_25415 ) ( AVAILABLE ?auto_25422 ) ( SURFACE-AT ?auto_25415 ?auto_25423 ) ( ON ?auto_25415 ?auto_25432 ) ( CLEAR ?auto_25415 ) ( not ( = ?auto_25414 ?auto_25415 ) ) ( not ( = ?auto_25414 ?auto_25432 ) ) ( not ( = ?auto_25415 ?auto_25432 ) ) ( IS-CRATE ?auto_25414 ) ( not ( = ?auto_25433 ?auto_25418 ) ) ( HOIST-AT ?auto_25427 ?auto_25433 ) ( AVAILABLE ?auto_25427 ) ( SURFACE-AT ?auto_25414 ?auto_25433 ) ( ON ?auto_25414 ?auto_25426 ) ( CLEAR ?auto_25414 ) ( not ( = ?auto_25413 ?auto_25414 ) ) ( not ( = ?auto_25413 ?auto_25426 ) ) ( not ( = ?auto_25414 ?auto_25426 ) ) ( not ( = ?auto_25419 ?auto_25427 ) ) ( SURFACE-AT ?auto_25412 ?auto_25418 ) ( CLEAR ?auto_25412 ) ( IS-CRATE ?auto_25413 ) ( AVAILABLE ?auto_25419 ) ( not ( = ?auto_25424 ?auto_25418 ) ) ( HOIST-AT ?auto_25430 ?auto_25424 ) ( AVAILABLE ?auto_25430 ) ( SURFACE-AT ?auto_25413 ?auto_25424 ) ( ON ?auto_25413 ?auto_25428 ) ( CLEAR ?auto_25413 ) ( TRUCK-AT ?auto_25420 ?auto_25418 ) ( not ( = ?auto_25412 ?auto_25413 ) ) ( not ( = ?auto_25412 ?auto_25428 ) ) ( not ( = ?auto_25413 ?auto_25428 ) ) ( not ( = ?auto_25419 ?auto_25430 ) ) ( not ( = ?auto_25412 ?auto_25414 ) ) ( not ( = ?auto_25412 ?auto_25426 ) ) ( not ( = ?auto_25414 ?auto_25428 ) ) ( not ( = ?auto_25433 ?auto_25424 ) ) ( not ( = ?auto_25427 ?auto_25430 ) ) ( not ( = ?auto_25426 ?auto_25428 ) ) ( not ( = ?auto_25412 ?auto_25415 ) ) ( not ( = ?auto_25412 ?auto_25432 ) ) ( not ( = ?auto_25413 ?auto_25415 ) ) ( not ( = ?auto_25413 ?auto_25432 ) ) ( not ( = ?auto_25415 ?auto_25426 ) ) ( not ( = ?auto_25415 ?auto_25428 ) ) ( not ( = ?auto_25423 ?auto_25433 ) ) ( not ( = ?auto_25423 ?auto_25424 ) ) ( not ( = ?auto_25422 ?auto_25427 ) ) ( not ( = ?auto_25422 ?auto_25430 ) ) ( not ( = ?auto_25432 ?auto_25426 ) ) ( not ( = ?auto_25432 ?auto_25428 ) ) ( not ( = ?auto_25412 ?auto_25416 ) ) ( not ( = ?auto_25412 ?auto_25425 ) ) ( not ( = ?auto_25413 ?auto_25416 ) ) ( not ( = ?auto_25413 ?auto_25425 ) ) ( not ( = ?auto_25414 ?auto_25416 ) ) ( not ( = ?auto_25414 ?auto_25425 ) ) ( not ( = ?auto_25416 ?auto_25432 ) ) ( not ( = ?auto_25416 ?auto_25426 ) ) ( not ( = ?auto_25416 ?auto_25428 ) ) ( not ( = ?auto_25431 ?auto_25423 ) ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25431 ?auto_25424 ) ) ( not ( = ?auto_25429 ?auto_25422 ) ) ( not ( = ?auto_25429 ?auto_25427 ) ) ( not ( = ?auto_25429 ?auto_25430 ) ) ( not ( = ?auto_25425 ?auto_25432 ) ) ( not ( = ?auto_25425 ?auto_25426 ) ) ( not ( = ?auto_25425 ?auto_25428 ) ) ( not ( = ?auto_25412 ?auto_25417 ) ) ( not ( = ?auto_25412 ?auto_25421 ) ) ( not ( = ?auto_25413 ?auto_25417 ) ) ( not ( = ?auto_25413 ?auto_25421 ) ) ( not ( = ?auto_25414 ?auto_25417 ) ) ( not ( = ?auto_25414 ?auto_25421 ) ) ( not ( = ?auto_25415 ?auto_25417 ) ) ( not ( = ?auto_25415 ?auto_25421 ) ) ( not ( = ?auto_25417 ?auto_25425 ) ) ( not ( = ?auto_25417 ?auto_25432 ) ) ( not ( = ?auto_25417 ?auto_25426 ) ) ( not ( = ?auto_25417 ?auto_25428 ) ) ( not ( = ?auto_25421 ?auto_25425 ) ) ( not ( = ?auto_25421 ?auto_25432 ) ) ( not ( = ?auto_25421 ?auto_25426 ) ) ( not ( = ?auto_25421 ?auto_25428 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_25412 ?auto_25413 ?auto_25414 ?auto_25415 ?auto_25416 )
      ( MAKE-1CRATE ?auto_25416 ?auto_25417 )
      ( MAKE-5CRATE-VERIFY ?auto_25412 ?auto_25413 ?auto_25414 ?auto_25415 ?auto_25416 ?auto_25417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25436 - SURFACE
      ?auto_25437 - SURFACE
    )
    :vars
    (
      ?auto_25438 - HOIST
      ?auto_25439 - PLACE
      ?auto_25441 - PLACE
      ?auto_25442 - HOIST
      ?auto_25443 - SURFACE
      ?auto_25440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25438 ?auto_25439 ) ( SURFACE-AT ?auto_25436 ?auto_25439 ) ( CLEAR ?auto_25436 ) ( IS-CRATE ?auto_25437 ) ( AVAILABLE ?auto_25438 ) ( not ( = ?auto_25441 ?auto_25439 ) ) ( HOIST-AT ?auto_25442 ?auto_25441 ) ( AVAILABLE ?auto_25442 ) ( SURFACE-AT ?auto_25437 ?auto_25441 ) ( ON ?auto_25437 ?auto_25443 ) ( CLEAR ?auto_25437 ) ( TRUCK-AT ?auto_25440 ?auto_25439 ) ( not ( = ?auto_25436 ?auto_25437 ) ) ( not ( = ?auto_25436 ?auto_25443 ) ) ( not ( = ?auto_25437 ?auto_25443 ) ) ( not ( = ?auto_25438 ?auto_25442 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25440 ?auto_25439 ?auto_25441 )
      ( !LIFT ?auto_25442 ?auto_25437 ?auto_25443 ?auto_25441 )
      ( !LOAD ?auto_25442 ?auto_25437 ?auto_25440 ?auto_25441 )
      ( !DRIVE ?auto_25440 ?auto_25441 ?auto_25439 )
      ( !UNLOAD ?auto_25438 ?auto_25437 ?auto_25440 ?auto_25439 )
      ( !DROP ?auto_25438 ?auto_25437 ?auto_25436 ?auto_25439 )
      ( MAKE-1CRATE-VERIFY ?auto_25436 ?auto_25437 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_25451 - SURFACE
      ?auto_25452 - SURFACE
      ?auto_25453 - SURFACE
      ?auto_25454 - SURFACE
      ?auto_25455 - SURFACE
      ?auto_25456 - SURFACE
      ?auto_25457 - SURFACE
    )
    :vars
    (
      ?auto_25460 - HOIST
      ?auto_25463 - PLACE
      ?auto_25461 - PLACE
      ?auto_25462 - HOIST
      ?auto_25459 - SURFACE
      ?auto_25472 - PLACE
      ?auto_25475 - HOIST
      ?auto_25474 - SURFACE
      ?auto_25466 - PLACE
      ?auto_25468 - HOIST
      ?auto_25476 - SURFACE
      ?auto_25467 - SURFACE
      ?auto_25473 - PLACE
      ?auto_25470 - HOIST
      ?auto_25465 - SURFACE
      ?auto_25471 - PLACE
      ?auto_25464 - HOIST
      ?auto_25469 - SURFACE
      ?auto_25458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25460 ?auto_25463 ) ( IS-CRATE ?auto_25457 ) ( not ( = ?auto_25461 ?auto_25463 ) ) ( HOIST-AT ?auto_25462 ?auto_25461 ) ( AVAILABLE ?auto_25462 ) ( SURFACE-AT ?auto_25457 ?auto_25461 ) ( ON ?auto_25457 ?auto_25459 ) ( CLEAR ?auto_25457 ) ( not ( = ?auto_25456 ?auto_25457 ) ) ( not ( = ?auto_25456 ?auto_25459 ) ) ( not ( = ?auto_25457 ?auto_25459 ) ) ( not ( = ?auto_25460 ?auto_25462 ) ) ( IS-CRATE ?auto_25456 ) ( not ( = ?auto_25472 ?auto_25463 ) ) ( HOIST-AT ?auto_25475 ?auto_25472 ) ( SURFACE-AT ?auto_25456 ?auto_25472 ) ( ON ?auto_25456 ?auto_25474 ) ( CLEAR ?auto_25456 ) ( not ( = ?auto_25455 ?auto_25456 ) ) ( not ( = ?auto_25455 ?auto_25474 ) ) ( not ( = ?auto_25456 ?auto_25474 ) ) ( not ( = ?auto_25460 ?auto_25475 ) ) ( IS-CRATE ?auto_25455 ) ( not ( = ?auto_25466 ?auto_25463 ) ) ( HOIST-AT ?auto_25468 ?auto_25466 ) ( AVAILABLE ?auto_25468 ) ( SURFACE-AT ?auto_25455 ?auto_25466 ) ( ON ?auto_25455 ?auto_25476 ) ( CLEAR ?auto_25455 ) ( not ( = ?auto_25454 ?auto_25455 ) ) ( not ( = ?auto_25454 ?auto_25476 ) ) ( not ( = ?auto_25455 ?auto_25476 ) ) ( not ( = ?auto_25460 ?auto_25468 ) ) ( IS-CRATE ?auto_25454 ) ( AVAILABLE ?auto_25475 ) ( SURFACE-AT ?auto_25454 ?auto_25472 ) ( ON ?auto_25454 ?auto_25467 ) ( CLEAR ?auto_25454 ) ( not ( = ?auto_25453 ?auto_25454 ) ) ( not ( = ?auto_25453 ?auto_25467 ) ) ( not ( = ?auto_25454 ?auto_25467 ) ) ( IS-CRATE ?auto_25453 ) ( not ( = ?auto_25473 ?auto_25463 ) ) ( HOIST-AT ?auto_25470 ?auto_25473 ) ( AVAILABLE ?auto_25470 ) ( SURFACE-AT ?auto_25453 ?auto_25473 ) ( ON ?auto_25453 ?auto_25465 ) ( CLEAR ?auto_25453 ) ( not ( = ?auto_25452 ?auto_25453 ) ) ( not ( = ?auto_25452 ?auto_25465 ) ) ( not ( = ?auto_25453 ?auto_25465 ) ) ( not ( = ?auto_25460 ?auto_25470 ) ) ( SURFACE-AT ?auto_25451 ?auto_25463 ) ( CLEAR ?auto_25451 ) ( IS-CRATE ?auto_25452 ) ( AVAILABLE ?auto_25460 ) ( not ( = ?auto_25471 ?auto_25463 ) ) ( HOIST-AT ?auto_25464 ?auto_25471 ) ( AVAILABLE ?auto_25464 ) ( SURFACE-AT ?auto_25452 ?auto_25471 ) ( ON ?auto_25452 ?auto_25469 ) ( CLEAR ?auto_25452 ) ( TRUCK-AT ?auto_25458 ?auto_25463 ) ( not ( = ?auto_25451 ?auto_25452 ) ) ( not ( = ?auto_25451 ?auto_25469 ) ) ( not ( = ?auto_25452 ?auto_25469 ) ) ( not ( = ?auto_25460 ?auto_25464 ) ) ( not ( = ?auto_25451 ?auto_25453 ) ) ( not ( = ?auto_25451 ?auto_25465 ) ) ( not ( = ?auto_25453 ?auto_25469 ) ) ( not ( = ?auto_25473 ?auto_25471 ) ) ( not ( = ?auto_25470 ?auto_25464 ) ) ( not ( = ?auto_25465 ?auto_25469 ) ) ( not ( = ?auto_25451 ?auto_25454 ) ) ( not ( = ?auto_25451 ?auto_25467 ) ) ( not ( = ?auto_25452 ?auto_25454 ) ) ( not ( = ?auto_25452 ?auto_25467 ) ) ( not ( = ?auto_25454 ?auto_25465 ) ) ( not ( = ?auto_25454 ?auto_25469 ) ) ( not ( = ?auto_25472 ?auto_25473 ) ) ( not ( = ?auto_25472 ?auto_25471 ) ) ( not ( = ?auto_25475 ?auto_25470 ) ) ( not ( = ?auto_25475 ?auto_25464 ) ) ( not ( = ?auto_25467 ?auto_25465 ) ) ( not ( = ?auto_25467 ?auto_25469 ) ) ( not ( = ?auto_25451 ?auto_25455 ) ) ( not ( = ?auto_25451 ?auto_25476 ) ) ( not ( = ?auto_25452 ?auto_25455 ) ) ( not ( = ?auto_25452 ?auto_25476 ) ) ( not ( = ?auto_25453 ?auto_25455 ) ) ( not ( = ?auto_25453 ?auto_25476 ) ) ( not ( = ?auto_25455 ?auto_25467 ) ) ( not ( = ?auto_25455 ?auto_25465 ) ) ( not ( = ?auto_25455 ?auto_25469 ) ) ( not ( = ?auto_25466 ?auto_25472 ) ) ( not ( = ?auto_25466 ?auto_25473 ) ) ( not ( = ?auto_25466 ?auto_25471 ) ) ( not ( = ?auto_25468 ?auto_25475 ) ) ( not ( = ?auto_25468 ?auto_25470 ) ) ( not ( = ?auto_25468 ?auto_25464 ) ) ( not ( = ?auto_25476 ?auto_25467 ) ) ( not ( = ?auto_25476 ?auto_25465 ) ) ( not ( = ?auto_25476 ?auto_25469 ) ) ( not ( = ?auto_25451 ?auto_25456 ) ) ( not ( = ?auto_25451 ?auto_25474 ) ) ( not ( = ?auto_25452 ?auto_25456 ) ) ( not ( = ?auto_25452 ?auto_25474 ) ) ( not ( = ?auto_25453 ?auto_25456 ) ) ( not ( = ?auto_25453 ?auto_25474 ) ) ( not ( = ?auto_25454 ?auto_25456 ) ) ( not ( = ?auto_25454 ?auto_25474 ) ) ( not ( = ?auto_25456 ?auto_25476 ) ) ( not ( = ?auto_25456 ?auto_25467 ) ) ( not ( = ?auto_25456 ?auto_25465 ) ) ( not ( = ?auto_25456 ?auto_25469 ) ) ( not ( = ?auto_25474 ?auto_25476 ) ) ( not ( = ?auto_25474 ?auto_25467 ) ) ( not ( = ?auto_25474 ?auto_25465 ) ) ( not ( = ?auto_25474 ?auto_25469 ) ) ( not ( = ?auto_25451 ?auto_25457 ) ) ( not ( = ?auto_25451 ?auto_25459 ) ) ( not ( = ?auto_25452 ?auto_25457 ) ) ( not ( = ?auto_25452 ?auto_25459 ) ) ( not ( = ?auto_25453 ?auto_25457 ) ) ( not ( = ?auto_25453 ?auto_25459 ) ) ( not ( = ?auto_25454 ?auto_25457 ) ) ( not ( = ?auto_25454 ?auto_25459 ) ) ( not ( = ?auto_25455 ?auto_25457 ) ) ( not ( = ?auto_25455 ?auto_25459 ) ) ( not ( = ?auto_25457 ?auto_25474 ) ) ( not ( = ?auto_25457 ?auto_25476 ) ) ( not ( = ?auto_25457 ?auto_25467 ) ) ( not ( = ?auto_25457 ?auto_25465 ) ) ( not ( = ?auto_25457 ?auto_25469 ) ) ( not ( = ?auto_25461 ?auto_25472 ) ) ( not ( = ?auto_25461 ?auto_25466 ) ) ( not ( = ?auto_25461 ?auto_25473 ) ) ( not ( = ?auto_25461 ?auto_25471 ) ) ( not ( = ?auto_25462 ?auto_25475 ) ) ( not ( = ?auto_25462 ?auto_25468 ) ) ( not ( = ?auto_25462 ?auto_25470 ) ) ( not ( = ?auto_25462 ?auto_25464 ) ) ( not ( = ?auto_25459 ?auto_25474 ) ) ( not ( = ?auto_25459 ?auto_25476 ) ) ( not ( = ?auto_25459 ?auto_25467 ) ) ( not ( = ?auto_25459 ?auto_25465 ) ) ( not ( = ?auto_25459 ?auto_25469 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_25451 ?auto_25452 ?auto_25453 ?auto_25454 ?auto_25455 ?auto_25456 )
      ( MAKE-1CRATE ?auto_25456 ?auto_25457 )
      ( MAKE-6CRATE-VERIFY ?auto_25451 ?auto_25452 ?auto_25453 ?auto_25454 ?auto_25455 ?auto_25456 ?auto_25457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25479 - SURFACE
      ?auto_25480 - SURFACE
    )
    :vars
    (
      ?auto_25481 - HOIST
      ?auto_25482 - PLACE
      ?auto_25484 - PLACE
      ?auto_25485 - HOIST
      ?auto_25486 - SURFACE
      ?auto_25483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25481 ?auto_25482 ) ( SURFACE-AT ?auto_25479 ?auto_25482 ) ( CLEAR ?auto_25479 ) ( IS-CRATE ?auto_25480 ) ( AVAILABLE ?auto_25481 ) ( not ( = ?auto_25484 ?auto_25482 ) ) ( HOIST-AT ?auto_25485 ?auto_25484 ) ( AVAILABLE ?auto_25485 ) ( SURFACE-AT ?auto_25480 ?auto_25484 ) ( ON ?auto_25480 ?auto_25486 ) ( CLEAR ?auto_25480 ) ( TRUCK-AT ?auto_25483 ?auto_25482 ) ( not ( = ?auto_25479 ?auto_25480 ) ) ( not ( = ?auto_25479 ?auto_25486 ) ) ( not ( = ?auto_25480 ?auto_25486 ) ) ( not ( = ?auto_25481 ?auto_25485 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25483 ?auto_25482 ?auto_25484 )
      ( !LIFT ?auto_25485 ?auto_25480 ?auto_25486 ?auto_25484 )
      ( !LOAD ?auto_25485 ?auto_25480 ?auto_25483 ?auto_25484 )
      ( !DRIVE ?auto_25483 ?auto_25484 ?auto_25482 )
      ( !UNLOAD ?auto_25481 ?auto_25480 ?auto_25483 ?auto_25482 )
      ( !DROP ?auto_25481 ?auto_25480 ?auto_25479 ?auto_25482 )
      ( MAKE-1CRATE-VERIFY ?auto_25479 ?auto_25480 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_25495 - SURFACE
      ?auto_25496 - SURFACE
      ?auto_25497 - SURFACE
      ?auto_25498 - SURFACE
      ?auto_25499 - SURFACE
      ?auto_25500 - SURFACE
      ?auto_25502 - SURFACE
      ?auto_25501 - SURFACE
    )
    :vars
    (
      ?auto_25508 - HOIST
      ?auto_25504 - PLACE
      ?auto_25506 - PLACE
      ?auto_25505 - HOIST
      ?auto_25507 - SURFACE
      ?auto_25524 - PLACE
      ?auto_25522 - HOIST
      ?auto_25516 - SURFACE
      ?auto_25514 - PLACE
      ?auto_25519 - HOIST
      ?auto_25517 - SURFACE
      ?auto_25520 - PLACE
      ?auto_25513 - HOIST
      ?auto_25509 - SURFACE
      ?auto_25515 - SURFACE
      ?auto_25518 - PLACE
      ?auto_25511 - HOIST
      ?auto_25523 - SURFACE
      ?auto_25510 - PLACE
      ?auto_25521 - HOIST
      ?auto_25512 - SURFACE
      ?auto_25503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25508 ?auto_25504 ) ( IS-CRATE ?auto_25501 ) ( not ( = ?auto_25506 ?auto_25504 ) ) ( HOIST-AT ?auto_25505 ?auto_25506 ) ( AVAILABLE ?auto_25505 ) ( SURFACE-AT ?auto_25501 ?auto_25506 ) ( ON ?auto_25501 ?auto_25507 ) ( CLEAR ?auto_25501 ) ( not ( = ?auto_25502 ?auto_25501 ) ) ( not ( = ?auto_25502 ?auto_25507 ) ) ( not ( = ?auto_25501 ?auto_25507 ) ) ( not ( = ?auto_25508 ?auto_25505 ) ) ( IS-CRATE ?auto_25502 ) ( not ( = ?auto_25524 ?auto_25504 ) ) ( HOIST-AT ?auto_25522 ?auto_25524 ) ( AVAILABLE ?auto_25522 ) ( SURFACE-AT ?auto_25502 ?auto_25524 ) ( ON ?auto_25502 ?auto_25516 ) ( CLEAR ?auto_25502 ) ( not ( = ?auto_25500 ?auto_25502 ) ) ( not ( = ?auto_25500 ?auto_25516 ) ) ( not ( = ?auto_25502 ?auto_25516 ) ) ( not ( = ?auto_25508 ?auto_25522 ) ) ( IS-CRATE ?auto_25500 ) ( not ( = ?auto_25514 ?auto_25504 ) ) ( HOIST-AT ?auto_25519 ?auto_25514 ) ( SURFACE-AT ?auto_25500 ?auto_25514 ) ( ON ?auto_25500 ?auto_25517 ) ( CLEAR ?auto_25500 ) ( not ( = ?auto_25499 ?auto_25500 ) ) ( not ( = ?auto_25499 ?auto_25517 ) ) ( not ( = ?auto_25500 ?auto_25517 ) ) ( not ( = ?auto_25508 ?auto_25519 ) ) ( IS-CRATE ?auto_25499 ) ( not ( = ?auto_25520 ?auto_25504 ) ) ( HOIST-AT ?auto_25513 ?auto_25520 ) ( AVAILABLE ?auto_25513 ) ( SURFACE-AT ?auto_25499 ?auto_25520 ) ( ON ?auto_25499 ?auto_25509 ) ( CLEAR ?auto_25499 ) ( not ( = ?auto_25498 ?auto_25499 ) ) ( not ( = ?auto_25498 ?auto_25509 ) ) ( not ( = ?auto_25499 ?auto_25509 ) ) ( not ( = ?auto_25508 ?auto_25513 ) ) ( IS-CRATE ?auto_25498 ) ( AVAILABLE ?auto_25519 ) ( SURFACE-AT ?auto_25498 ?auto_25514 ) ( ON ?auto_25498 ?auto_25515 ) ( CLEAR ?auto_25498 ) ( not ( = ?auto_25497 ?auto_25498 ) ) ( not ( = ?auto_25497 ?auto_25515 ) ) ( not ( = ?auto_25498 ?auto_25515 ) ) ( IS-CRATE ?auto_25497 ) ( not ( = ?auto_25518 ?auto_25504 ) ) ( HOIST-AT ?auto_25511 ?auto_25518 ) ( AVAILABLE ?auto_25511 ) ( SURFACE-AT ?auto_25497 ?auto_25518 ) ( ON ?auto_25497 ?auto_25523 ) ( CLEAR ?auto_25497 ) ( not ( = ?auto_25496 ?auto_25497 ) ) ( not ( = ?auto_25496 ?auto_25523 ) ) ( not ( = ?auto_25497 ?auto_25523 ) ) ( not ( = ?auto_25508 ?auto_25511 ) ) ( SURFACE-AT ?auto_25495 ?auto_25504 ) ( CLEAR ?auto_25495 ) ( IS-CRATE ?auto_25496 ) ( AVAILABLE ?auto_25508 ) ( not ( = ?auto_25510 ?auto_25504 ) ) ( HOIST-AT ?auto_25521 ?auto_25510 ) ( AVAILABLE ?auto_25521 ) ( SURFACE-AT ?auto_25496 ?auto_25510 ) ( ON ?auto_25496 ?auto_25512 ) ( CLEAR ?auto_25496 ) ( TRUCK-AT ?auto_25503 ?auto_25504 ) ( not ( = ?auto_25495 ?auto_25496 ) ) ( not ( = ?auto_25495 ?auto_25512 ) ) ( not ( = ?auto_25496 ?auto_25512 ) ) ( not ( = ?auto_25508 ?auto_25521 ) ) ( not ( = ?auto_25495 ?auto_25497 ) ) ( not ( = ?auto_25495 ?auto_25523 ) ) ( not ( = ?auto_25497 ?auto_25512 ) ) ( not ( = ?auto_25518 ?auto_25510 ) ) ( not ( = ?auto_25511 ?auto_25521 ) ) ( not ( = ?auto_25523 ?auto_25512 ) ) ( not ( = ?auto_25495 ?auto_25498 ) ) ( not ( = ?auto_25495 ?auto_25515 ) ) ( not ( = ?auto_25496 ?auto_25498 ) ) ( not ( = ?auto_25496 ?auto_25515 ) ) ( not ( = ?auto_25498 ?auto_25523 ) ) ( not ( = ?auto_25498 ?auto_25512 ) ) ( not ( = ?auto_25514 ?auto_25518 ) ) ( not ( = ?auto_25514 ?auto_25510 ) ) ( not ( = ?auto_25519 ?auto_25511 ) ) ( not ( = ?auto_25519 ?auto_25521 ) ) ( not ( = ?auto_25515 ?auto_25523 ) ) ( not ( = ?auto_25515 ?auto_25512 ) ) ( not ( = ?auto_25495 ?auto_25499 ) ) ( not ( = ?auto_25495 ?auto_25509 ) ) ( not ( = ?auto_25496 ?auto_25499 ) ) ( not ( = ?auto_25496 ?auto_25509 ) ) ( not ( = ?auto_25497 ?auto_25499 ) ) ( not ( = ?auto_25497 ?auto_25509 ) ) ( not ( = ?auto_25499 ?auto_25515 ) ) ( not ( = ?auto_25499 ?auto_25523 ) ) ( not ( = ?auto_25499 ?auto_25512 ) ) ( not ( = ?auto_25520 ?auto_25514 ) ) ( not ( = ?auto_25520 ?auto_25518 ) ) ( not ( = ?auto_25520 ?auto_25510 ) ) ( not ( = ?auto_25513 ?auto_25519 ) ) ( not ( = ?auto_25513 ?auto_25511 ) ) ( not ( = ?auto_25513 ?auto_25521 ) ) ( not ( = ?auto_25509 ?auto_25515 ) ) ( not ( = ?auto_25509 ?auto_25523 ) ) ( not ( = ?auto_25509 ?auto_25512 ) ) ( not ( = ?auto_25495 ?auto_25500 ) ) ( not ( = ?auto_25495 ?auto_25517 ) ) ( not ( = ?auto_25496 ?auto_25500 ) ) ( not ( = ?auto_25496 ?auto_25517 ) ) ( not ( = ?auto_25497 ?auto_25500 ) ) ( not ( = ?auto_25497 ?auto_25517 ) ) ( not ( = ?auto_25498 ?auto_25500 ) ) ( not ( = ?auto_25498 ?auto_25517 ) ) ( not ( = ?auto_25500 ?auto_25509 ) ) ( not ( = ?auto_25500 ?auto_25515 ) ) ( not ( = ?auto_25500 ?auto_25523 ) ) ( not ( = ?auto_25500 ?auto_25512 ) ) ( not ( = ?auto_25517 ?auto_25509 ) ) ( not ( = ?auto_25517 ?auto_25515 ) ) ( not ( = ?auto_25517 ?auto_25523 ) ) ( not ( = ?auto_25517 ?auto_25512 ) ) ( not ( = ?auto_25495 ?auto_25502 ) ) ( not ( = ?auto_25495 ?auto_25516 ) ) ( not ( = ?auto_25496 ?auto_25502 ) ) ( not ( = ?auto_25496 ?auto_25516 ) ) ( not ( = ?auto_25497 ?auto_25502 ) ) ( not ( = ?auto_25497 ?auto_25516 ) ) ( not ( = ?auto_25498 ?auto_25502 ) ) ( not ( = ?auto_25498 ?auto_25516 ) ) ( not ( = ?auto_25499 ?auto_25502 ) ) ( not ( = ?auto_25499 ?auto_25516 ) ) ( not ( = ?auto_25502 ?auto_25517 ) ) ( not ( = ?auto_25502 ?auto_25509 ) ) ( not ( = ?auto_25502 ?auto_25515 ) ) ( not ( = ?auto_25502 ?auto_25523 ) ) ( not ( = ?auto_25502 ?auto_25512 ) ) ( not ( = ?auto_25524 ?auto_25514 ) ) ( not ( = ?auto_25524 ?auto_25520 ) ) ( not ( = ?auto_25524 ?auto_25518 ) ) ( not ( = ?auto_25524 ?auto_25510 ) ) ( not ( = ?auto_25522 ?auto_25519 ) ) ( not ( = ?auto_25522 ?auto_25513 ) ) ( not ( = ?auto_25522 ?auto_25511 ) ) ( not ( = ?auto_25522 ?auto_25521 ) ) ( not ( = ?auto_25516 ?auto_25517 ) ) ( not ( = ?auto_25516 ?auto_25509 ) ) ( not ( = ?auto_25516 ?auto_25515 ) ) ( not ( = ?auto_25516 ?auto_25523 ) ) ( not ( = ?auto_25516 ?auto_25512 ) ) ( not ( = ?auto_25495 ?auto_25501 ) ) ( not ( = ?auto_25495 ?auto_25507 ) ) ( not ( = ?auto_25496 ?auto_25501 ) ) ( not ( = ?auto_25496 ?auto_25507 ) ) ( not ( = ?auto_25497 ?auto_25501 ) ) ( not ( = ?auto_25497 ?auto_25507 ) ) ( not ( = ?auto_25498 ?auto_25501 ) ) ( not ( = ?auto_25498 ?auto_25507 ) ) ( not ( = ?auto_25499 ?auto_25501 ) ) ( not ( = ?auto_25499 ?auto_25507 ) ) ( not ( = ?auto_25500 ?auto_25501 ) ) ( not ( = ?auto_25500 ?auto_25507 ) ) ( not ( = ?auto_25501 ?auto_25516 ) ) ( not ( = ?auto_25501 ?auto_25517 ) ) ( not ( = ?auto_25501 ?auto_25509 ) ) ( not ( = ?auto_25501 ?auto_25515 ) ) ( not ( = ?auto_25501 ?auto_25523 ) ) ( not ( = ?auto_25501 ?auto_25512 ) ) ( not ( = ?auto_25506 ?auto_25524 ) ) ( not ( = ?auto_25506 ?auto_25514 ) ) ( not ( = ?auto_25506 ?auto_25520 ) ) ( not ( = ?auto_25506 ?auto_25518 ) ) ( not ( = ?auto_25506 ?auto_25510 ) ) ( not ( = ?auto_25505 ?auto_25522 ) ) ( not ( = ?auto_25505 ?auto_25519 ) ) ( not ( = ?auto_25505 ?auto_25513 ) ) ( not ( = ?auto_25505 ?auto_25511 ) ) ( not ( = ?auto_25505 ?auto_25521 ) ) ( not ( = ?auto_25507 ?auto_25516 ) ) ( not ( = ?auto_25507 ?auto_25517 ) ) ( not ( = ?auto_25507 ?auto_25509 ) ) ( not ( = ?auto_25507 ?auto_25515 ) ) ( not ( = ?auto_25507 ?auto_25523 ) ) ( not ( = ?auto_25507 ?auto_25512 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_25495 ?auto_25496 ?auto_25497 ?auto_25498 ?auto_25499 ?auto_25500 ?auto_25502 )
      ( MAKE-1CRATE ?auto_25502 ?auto_25501 )
      ( MAKE-7CRATE-VERIFY ?auto_25495 ?auto_25496 ?auto_25497 ?auto_25498 ?auto_25499 ?auto_25500 ?auto_25502 ?auto_25501 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25527 - SURFACE
      ?auto_25528 - SURFACE
    )
    :vars
    (
      ?auto_25529 - HOIST
      ?auto_25530 - PLACE
      ?auto_25532 - PLACE
      ?auto_25533 - HOIST
      ?auto_25534 - SURFACE
      ?auto_25531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25529 ?auto_25530 ) ( SURFACE-AT ?auto_25527 ?auto_25530 ) ( CLEAR ?auto_25527 ) ( IS-CRATE ?auto_25528 ) ( AVAILABLE ?auto_25529 ) ( not ( = ?auto_25532 ?auto_25530 ) ) ( HOIST-AT ?auto_25533 ?auto_25532 ) ( AVAILABLE ?auto_25533 ) ( SURFACE-AT ?auto_25528 ?auto_25532 ) ( ON ?auto_25528 ?auto_25534 ) ( CLEAR ?auto_25528 ) ( TRUCK-AT ?auto_25531 ?auto_25530 ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25534 ) ) ( not ( = ?auto_25528 ?auto_25534 ) ) ( not ( = ?auto_25529 ?auto_25533 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25531 ?auto_25530 ?auto_25532 )
      ( !LIFT ?auto_25533 ?auto_25528 ?auto_25534 ?auto_25532 )
      ( !LOAD ?auto_25533 ?auto_25528 ?auto_25531 ?auto_25532 )
      ( !DRIVE ?auto_25531 ?auto_25532 ?auto_25530 )
      ( !UNLOAD ?auto_25529 ?auto_25528 ?auto_25531 ?auto_25530 )
      ( !DROP ?auto_25529 ?auto_25528 ?auto_25527 ?auto_25530 )
      ( MAKE-1CRATE-VERIFY ?auto_25527 ?auto_25528 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_25544 - SURFACE
      ?auto_25545 - SURFACE
      ?auto_25546 - SURFACE
      ?auto_25547 - SURFACE
      ?auto_25548 - SURFACE
      ?auto_25549 - SURFACE
      ?auto_25552 - SURFACE
      ?auto_25551 - SURFACE
      ?auto_25550 - SURFACE
    )
    :vars
    (
      ?auto_25558 - HOIST
      ?auto_25555 - PLACE
      ?auto_25554 - PLACE
      ?auto_25556 - HOIST
      ?auto_25553 - SURFACE
      ?auto_25564 - PLACE
      ?auto_25577 - HOIST
      ?auto_25565 - SURFACE
      ?auto_25569 - PLACE
      ?auto_25559 - HOIST
      ?auto_25560 - SURFACE
      ?auto_25562 - PLACE
      ?auto_25571 - HOIST
      ?auto_25570 - SURFACE
      ?auto_25573 - PLACE
      ?auto_25563 - HOIST
      ?auto_25576 - SURFACE
      ?auto_25561 - SURFACE
      ?auto_25572 - PLACE
      ?auto_25566 - HOIST
      ?auto_25575 - SURFACE
      ?auto_25567 - PLACE
      ?auto_25574 - HOIST
      ?auto_25568 - SURFACE
      ?auto_25557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25558 ?auto_25555 ) ( IS-CRATE ?auto_25550 ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( HOIST-AT ?auto_25556 ?auto_25554 ) ( AVAILABLE ?auto_25556 ) ( SURFACE-AT ?auto_25550 ?auto_25554 ) ( ON ?auto_25550 ?auto_25553 ) ( CLEAR ?auto_25550 ) ( not ( = ?auto_25551 ?auto_25550 ) ) ( not ( = ?auto_25551 ?auto_25553 ) ) ( not ( = ?auto_25550 ?auto_25553 ) ) ( not ( = ?auto_25558 ?auto_25556 ) ) ( IS-CRATE ?auto_25551 ) ( not ( = ?auto_25564 ?auto_25555 ) ) ( HOIST-AT ?auto_25577 ?auto_25564 ) ( AVAILABLE ?auto_25577 ) ( SURFACE-AT ?auto_25551 ?auto_25564 ) ( ON ?auto_25551 ?auto_25565 ) ( CLEAR ?auto_25551 ) ( not ( = ?auto_25552 ?auto_25551 ) ) ( not ( = ?auto_25552 ?auto_25565 ) ) ( not ( = ?auto_25551 ?auto_25565 ) ) ( not ( = ?auto_25558 ?auto_25577 ) ) ( IS-CRATE ?auto_25552 ) ( not ( = ?auto_25569 ?auto_25555 ) ) ( HOIST-AT ?auto_25559 ?auto_25569 ) ( AVAILABLE ?auto_25559 ) ( SURFACE-AT ?auto_25552 ?auto_25569 ) ( ON ?auto_25552 ?auto_25560 ) ( CLEAR ?auto_25552 ) ( not ( = ?auto_25549 ?auto_25552 ) ) ( not ( = ?auto_25549 ?auto_25560 ) ) ( not ( = ?auto_25552 ?auto_25560 ) ) ( not ( = ?auto_25558 ?auto_25559 ) ) ( IS-CRATE ?auto_25549 ) ( not ( = ?auto_25562 ?auto_25555 ) ) ( HOIST-AT ?auto_25571 ?auto_25562 ) ( SURFACE-AT ?auto_25549 ?auto_25562 ) ( ON ?auto_25549 ?auto_25570 ) ( CLEAR ?auto_25549 ) ( not ( = ?auto_25548 ?auto_25549 ) ) ( not ( = ?auto_25548 ?auto_25570 ) ) ( not ( = ?auto_25549 ?auto_25570 ) ) ( not ( = ?auto_25558 ?auto_25571 ) ) ( IS-CRATE ?auto_25548 ) ( not ( = ?auto_25573 ?auto_25555 ) ) ( HOIST-AT ?auto_25563 ?auto_25573 ) ( AVAILABLE ?auto_25563 ) ( SURFACE-AT ?auto_25548 ?auto_25573 ) ( ON ?auto_25548 ?auto_25576 ) ( CLEAR ?auto_25548 ) ( not ( = ?auto_25547 ?auto_25548 ) ) ( not ( = ?auto_25547 ?auto_25576 ) ) ( not ( = ?auto_25548 ?auto_25576 ) ) ( not ( = ?auto_25558 ?auto_25563 ) ) ( IS-CRATE ?auto_25547 ) ( AVAILABLE ?auto_25571 ) ( SURFACE-AT ?auto_25547 ?auto_25562 ) ( ON ?auto_25547 ?auto_25561 ) ( CLEAR ?auto_25547 ) ( not ( = ?auto_25546 ?auto_25547 ) ) ( not ( = ?auto_25546 ?auto_25561 ) ) ( not ( = ?auto_25547 ?auto_25561 ) ) ( IS-CRATE ?auto_25546 ) ( not ( = ?auto_25572 ?auto_25555 ) ) ( HOIST-AT ?auto_25566 ?auto_25572 ) ( AVAILABLE ?auto_25566 ) ( SURFACE-AT ?auto_25546 ?auto_25572 ) ( ON ?auto_25546 ?auto_25575 ) ( CLEAR ?auto_25546 ) ( not ( = ?auto_25545 ?auto_25546 ) ) ( not ( = ?auto_25545 ?auto_25575 ) ) ( not ( = ?auto_25546 ?auto_25575 ) ) ( not ( = ?auto_25558 ?auto_25566 ) ) ( SURFACE-AT ?auto_25544 ?auto_25555 ) ( CLEAR ?auto_25544 ) ( IS-CRATE ?auto_25545 ) ( AVAILABLE ?auto_25558 ) ( not ( = ?auto_25567 ?auto_25555 ) ) ( HOIST-AT ?auto_25574 ?auto_25567 ) ( AVAILABLE ?auto_25574 ) ( SURFACE-AT ?auto_25545 ?auto_25567 ) ( ON ?auto_25545 ?auto_25568 ) ( CLEAR ?auto_25545 ) ( TRUCK-AT ?auto_25557 ?auto_25555 ) ( not ( = ?auto_25544 ?auto_25545 ) ) ( not ( = ?auto_25544 ?auto_25568 ) ) ( not ( = ?auto_25545 ?auto_25568 ) ) ( not ( = ?auto_25558 ?auto_25574 ) ) ( not ( = ?auto_25544 ?auto_25546 ) ) ( not ( = ?auto_25544 ?auto_25575 ) ) ( not ( = ?auto_25546 ?auto_25568 ) ) ( not ( = ?auto_25572 ?auto_25567 ) ) ( not ( = ?auto_25566 ?auto_25574 ) ) ( not ( = ?auto_25575 ?auto_25568 ) ) ( not ( = ?auto_25544 ?auto_25547 ) ) ( not ( = ?auto_25544 ?auto_25561 ) ) ( not ( = ?auto_25545 ?auto_25547 ) ) ( not ( = ?auto_25545 ?auto_25561 ) ) ( not ( = ?auto_25547 ?auto_25575 ) ) ( not ( = ?auto_25547 ?auto_25568 ) ) ( not ( = ?auto_25562 ?auto_25572 ) ) ( not ( = ?auto_25562 ?auto_25567 ) ) ( not ( = ?auto_25571 ?auto_25566 ) ) ( not ( = ?auto_25571 ?auto_25574 ) ) ( not ( = ?auto_25561 ?auto_25575 ) ) ( not ( = ?auto_25561 ?auto_25568 ) ) ( not ( = ?auto_25544 ?auto_25548 ) ) ( not ( = ?auto_25544 ?auto_25576 ) ) ( not ( = ?auto_25545 ?auto_25548 ) ) ( not ( = ?auto_25545 ?auto_25576 ) ) ( not ( = ?auto_25546 ?auto_25548 ) ) ( not ( = ?auto_25546 ?auto_25576 ) ) ( not ( = ?auto_25548 ?auto_25561 ) ) ( not ( = ?auto_25548 ?auto_25575 ) ) ( not ( = ?auto_25548 ?auto_25568 ) ) ( not ( = ?auto_25573 ?auto_25562 ) ) ( not ( = ?auto_25573 ?auto_25572 ) ) ( not ( = ?auto_25573 ?auto_25567 ) ) ( not ( = ?auto_25563 ?auto_25571 ) ) ( not ( = ?auto_25563 ?auto_25566 ) ) ( not ( = ?auto_25563 ?auto_25574 ) ) ( not ( = ?auto_25576 ?auto_25561 ) ) ( not ( = ?auto_25576 ?auto_25575 ) ) ( not ( = ?auto_25576 ?auto_25568 ) ) ( not ( = ?auto_25544 ?auto_25549 ) ) ( not ( = ?auto_25544 ?auto_25570 ) ) ( not ( = ?auto_25545 ?auto_25549 ) ) ( not ( = ?auto_25545 ?auto_25570 ) ) ( not ( = ?auto_25546 ?auto_25549 ) ) ( not ( = ?auto_25546 ?auto_25570 ) ) ( not ( = ?auto_25547 ?auto_25549 ) ) ( not ( = ?auto_25547 ?auto_25570 ) ) ( not ( = ?auto_25549 ?auto_25576 ) ) ( not ( = ?auto_25549 ?auto_25561 ) ) ( not ( = ?auto_25549 ?auto_25575 ) ) ( not ( = ?auto_25549 ?auto_25568 ) ) ( not ( = ?auto_25570 ?auto_25576 ) ) ( not ( = ?auto_25570 ?auto_25561 ) ) ( not ( = ?auto_25570 ?auto_25575 ) ) ( not ( = ?auto_25570 ?auto_25568 ) ) ( not ( = ?auto_25544 ?auto_25552 ) ) ( not ( = ?auto_25544 ?auto_25560 ) ) ( not ( = ?auto_25545 ?auto_25552 ) ) ( not ( = ?auto_25545 ?auto_25560 ) ) ( not ( = ?auto_25546 ?auto_25552 ) ) ( not ( = ?auto_25546 ?auto_25560 ) ) ( not ( = ?auto_25547 ?auto_25552 ) ) ( not ( = ?auto_25547 ?auto_25560 ) ) ( not ( = ?auto_25548 ?auto_25552 ) ) ( not ( = ?auto_25548 ?auto_25560 ) ) ( not ( = ?auto_25552 ?auto_25570 ) ) ( not ( = ?auto_25552 ?auto_25576 ) ) ( not ( = ?auto_25552 ?auto_25561 ) ) ( not ( = ?auto_25552 ?auto_25575 ) ) ( not ( = ?auto_25552 ?auto_25568 ) ) ( not ( = ?auto_25569 ?auto_25562 ) ) ( not ( = ?auto_25569 ?auto_25573 ) ) ( not ( = ?auto_25569 ?auto_25572 ) ) ( not ( = ?auto_25569 ?auto_25567 ) ) ( not ( = ?auto_25559 ?auto_25571 ) ) ( not ( = ?auto_25559 ?auto_25563 ) ) ( not ( = ?auto_25559 ?auto_25566 ) ) ( not ( = ?auto_25559 ?auto_25574 ) ) ( not ( = ?auto_25560 ?auto_25570 ) ) ( not ( = ?auto_25560 ?auto_25576 ) ) ( not ( = ?auto_25560 ?auto_25561 ) ) ( not ( = ?auto_25560 ?auto_25575 ) ) ( not ( = ?auto_25560 ?auto_25568 ) ) ( not ( = ?auto_25544 ?auto_25551 ) ) ( not ( = ?auto_25544 ?auto_25565 ) ) ( not ( = ?auto_25545 ?auto_25551 ) ) ( not ( = ?auto_25545 ?auto_25565 ) ) ( not ( = ?auto_25546 ?auto_25551 ) ) ( not ( = ?auto_25546 ?auto_25565 ) ) ( not ( = ?auto_25547 ?auto_25551 ) ) ( not ( = ?auto_25547 ?auto_25565 ) ) ( not ( = ?auto_25548 ?auto_25551 ) ) ( not ( = ?auto_25548 ?auto_25565 ) ) ( not ( = ?auto_25549 ?auto_25551 ) ) ( not ( = ?auto_25549 ?auto_25565 ) ) ( not ( = ?auto_25551 ?auto_25560 ) ) ( not ( = ?auto_25551 ?auto_25570 ) ) ( not ( = ?auto_25551 ?auto_25576 ) ) ( not ( = ?auto_25551 ?auto_25561 ) ) ( not ( = ?auto_25551 ?auto_25575 ) ) ( not ( = ?auto_25551 ?auto_25568 ) ) ( not ( = ?auto_25564 ?auto_25569 ) ) ( not ( = ?auto_25564 ?auto_25562 ) ) ( not ( = ?auto_25564 ?auto_25573 ) ) ( not ( = ?auto_25564 ?auto_25572 ) ) ( not ( = ?auto_25564 ?auto_25567 ) ) ( not ( = ?auto_25577 ?auto_25559 ) ) ( not ( = ?auto_25577 ?auto_25571 ) ) ( not ( = ?auto_25577 ?auto_25563 ) ) ( not ( = ?auto_25577 ?auto_25566 ) ) ( not ( = ?auto_25577 ?auto_25574 ) ) ( not ( = ?auto_25565 ?auto_25560 ) ) ( not ( = ?auto_25565 ?auto_25570 ) ) ( not ( = ?auto_25565 ?auto_25576 ) ) ( not ( = ?auto_25565 ?auto_25561 ) ) ( not ( = ?auto_25565 ?auto_25575 ) ) ( not ( = ?auto_25565 ?auto_25568 ) ) ( not ( = ?auto_25544 ?auto_25550 ) ) ( not ( = ?auto_25544 ?auto_25553 ) ) ( not ( = ?auto_25545 ?auto_25550 ) ) ( not ( = ?auto_25545 ?auto_25553 ) ) ( not ( = ?auto_25546 ?auto_25550 ) ) ( not ( = ?auto_25546 ?auto_25553 ) ) ( not ( = ?auto_25547 ?auto_25550 ) ) ( not ( = ?auto_25547 ?auto_25553 ) ) ( not ( = ?auto_25548 ?auto_25550 ) ) ( not ( = ?auto_25548 ?auto_25553 ) ) ( not ( = ?auto_25549 ?auto_25550 ) ) ( not ( = ?auto_25549 ?auto_25553 ) ) ( not ( = ?auto_25552 ?auto_25550 ) ) ( not ( = ?auto_25552 ?auto_25553 ) ) ( not ( = ?auto_25550 ?auto_25565 ) ) ( not ( = ?auto_25550 ?auto_25560 ) ) ( not ( = ?auto_25550 ?auto_25570 ) ) ( not ( = ?auto_25550 ?auto_25576 ) ) ( not ( = ?auto_25550 ?auto_25561 ) ) ( not ( = ?auto_25550 ?auto_25575 ) ) ( not ( = ?auto_25550 ?auto_25568 ) ) ( not ( = ?auto_25554 ?auto_25564 ) ) ( not ( = ?auto_25554 ?auto_25569 ) ) ( not ( = ?auto_25554 ?auto_25562 ) ) ( not ( = ?auto_25554 ?auto_25573 ) ) ( not ( = ?auto_25554 ?auto_25572 ) ) ( not ( = ?auto_25554 ?auto_25567 ) ) ( not ( = ?auto_25556 ?auto_25577 ) ) ( not ( = ?auto_25556 ?auto_25559 ) ) ( not ( = ?auto_25556 ?auto_25571 ) ) ( not ( = ?auto_25556 ?auto_25563 ) ) ( not ( = ?auto_25556 ?auto_25566 ) ) ( not ( = ?auto_25556 ?auto_25574 ) ) ( not ( = ?auto_25553 ?auto_25565 ) ) ( not ( = ?auto_25553 ?auto_25560 ) ) ( not ( = ?auto_25553 ?auto_25570 ) ) ( not ( = ?auto_25553 ?auto_25576 ) ) ( not ( = ?auto_25553 ?auto_25561 ) ) ( not ( = ?auto_25553 ?auto_25575 ) ) ( not ( = ?auto_25553 ?auto_25568 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_25544 ?auto_25545 ?auto_25546 ?auto_25547 ?auto_25548 ?auto_25549 ?auto_25552 ?auto_25551 )
      ( MAKE-1CRATE ?auto_25551 ?auto_25550 )
      ( MAKE-8CRATE-VERIFY ?auto_25544 ?auto_25545 ?auto_25546 ?auto_25547 ?auto_25548 ?auto_25549 ?auto_25552 ?auto_25551 ?auto_25550 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25580 - SURFACE
      ?auto_25581 - SURFACE
    )
    :vars
    (
      ?auto_25582 - HOIST
      ?auto_25583 - PLACE
      ?auto_25585 - PLACE
      ?auto_25586 - HOIST
      ?auto_25587 - SURFACE
      ?auto_25584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25582 ?auto_25583 ) ( SURFACE-AT ?auto_25580 ?auto_25583 ) ( CLEAR ?auto_25580 ) ( IS-CRATE ?auto_25581 ) ( AVAILABLE ?auto_25582 ) ( not ( = ?auto_25585 ?auto_25583 ) ) ( HOIST-AT ?auto_25586 ?auto_25585 ) ( AVAILABLE ?auto_25586 ) ( SURFACE-AT ?auto_25581 ?auto_25585 ) ( ON ?auto_25581 ?auto_25587 ) ( CLEAR ?auto_25581 ) ( TRUCK-AT ?auto_25584 ?auto_25583 ) ( not ( = ?auto_25580 ?auto_25581 ) ) ( not ( = ?auto_25580 ?auto_25587 ) ) ( not ( = ?auto_25581 ?auto_25587 ) ) ( not ( = ?auto_25582 ?auto_25586 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25584 ?auto_25583 ?auto_25585 )
      ( !LIFT ?auto_25586 ?auto_25581 ?auto_25587 ?auto_25585 )
      ( !LOAD ?auto_25586 ?auto_25581 ?auto_25584 ?auto_25585 )
      ( !DRIVE ?auto_25584 ?auto_25585 ?auto_25583 )
      ( !UNLOAD ?auto_25582 ?auto_25581 ?auto_25584 ?auto_25583 )
      ( !DROP ?auto_25582 ?auto_25581 ?auto_25580 ?auto_25583 )
      ( MAKE-1CRATE-VERIFY ?auto_25580 ?auto_25581 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_25598 - SURFACE
      ?auto_25599 - SURFACE
      ?auto_25600 - SURFACE
      ?auto_25601 - SURFACE
      ?auto_25602 - SURFACE
      ?auto_25603 - SURFACE
      ?auto_25606 - SURFACE
      ?auto_25605 - SURFACE
      ?auto_25604 - SURFACE
      ?auto_25607 - SURFACE
    )
    :vars
    (
      ?auto_25611 - HOIST
      ?auto_25613 - PLACE
      ?auto_25612 - PLACE
      ?auto_25610 - HOIST
      ?auto_25609 - SURFACE
      ?auto_25617 - PLACE
      ?auto_25635 - HOIST
      ?auto_25623 - SURFACE
      ?auto_25619 - PLACE
      ?auto_25627 - HOIST
      ?auto_25620 - SURFACE
      ?auto_25630 - PLACE
      ?auto_25625 - HOIST
      ?auto_25614 - SURFACE
      ?auto_25615 - PLACE
      ?auto_25633 - HOIST
      ?auto_25632 - SURFACE
      ?auto_25616 - PLACE
      ?auto_25618 - HOIST
      ?auto_25624 - SURFACE
      ?auto_25622 - SURFACE
      ?auto_25634 - PLACE
      ?auto_25621 - HOIST
      ?auto_25626 - SURFACE
      ?auto_25629 - PLACE
      ?auto_25628 - HOIST
      ?auto_25631 - SURFACE
      ?auto_25608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25611 ?auto_25613 ) ( IS-CRATE ?auto_25607 ) ( not ( = ?auto_25612 ?auto_25613 ) ) ( HOIST-AT ?auto_25610 ?auto_25612 ) ( AVAILABLE ?auto_25610 ) ( SURFACE-AT ?auto_25607 ?auto_25612 ) ( ON ?auto_25607 ?auto_25609 ) ( CLEAR ?auto_25607 ) ( not ( = ?auto_25604 ?auto_25607 ) ) ( not ( = ?auto_25604 ?auto_25609 ) ) ( not ( = ?auto_25607 ?auto_25609 ) ) ( not ( = ?auto_25611 ?auto_25610 ) ) ( IS-CRATE ?auto_25604 ) ( not ( = ?auto_25617 ?auto_25613 ) ) ( HOIST-AT ?auto_25635 ?auto_25617 ) ( AVAILABLE ?auto_25635 ) ( SURFACE-AT ?auto_25604 ?auto_25617 ) ( ON ?auto_25604 ?auto_25623 ) ( CLEAR ?auto_25604 ) ( not ( = ?auto_25605 ?auto_25604 ) ) ( not ( = ?auto_25605 ?auto_25623 ) ) ( not ( = ?auto_25604 ?auto_25623 ) ) ( not ( = ?auto_25611 ?auto_25635 ) ) ( IS-CRATE ?auto_25605 ) ( not ( = ?auto_25619 ?auto_25613 ) ) ( HOIST-AT ?auto_25627 ?auto_25619 ) ( AVAILABLE ?auto_25627 ) ( SURFACE-AT ?auto_25605 ?auto_25619 ) ( ON ?auto_25605 ?auto_25620 ) ( CLEAR ?auto_25605 ) ( not ( = ?auto_25606 ?auto_25605 ) ) ( not ( = ?auto_25606 ?auto_25620 ) ) ( not ( = ?auto_25605 ?auto_25620 ) ) ( not ( = ?auto_25611 ?auto_25627 ) ) ( IS-CRATE ?auto_25606 ) ( not ( = ?auto_25630 ?auto_25613 ) ) ( HOIST-AT ?auto_25625 ?auto_25630 ) ( AVAILABLE ?auto_25625 ) ( SURFACE-AT ?auto_25606 ?auto_25630 ) ( ON ?auto_25606 ?auto_25614 ) ( CLEAR ?auto_25606 ) ( not ( = ?auto_25603 ?auto_25606 ) ) ( not ( = ?auto_25603 ?auto_25614 ) ) ( not ( = ?auto_25606 ?auto_25614 ) ) ( not ( = ?auto_25611 ?auto_25625 ) ) ( IS-CRATE ?auto_25603 ) ( not ( = ?auto_25615 ?auto_25613 ) ) ( HOIST-AT ?auto_25633 ?auto_25615 ) ( SURFACE-AT ?auto_25603 ?auto_25615 ) ( ON ?auto_25603 ?auto_25632 ) ( CLEAR ?auto_25603 ) ( not ( = ?auto_25602 ?auto_25603 ) ) ( not ( = ?auto_25602 ?auto_25632 ) ) ( not ( = ?auto_25603 ?auto_25632 ) ) ( not ( = ?auto_25611 ?auto_25633 ) ) ( IS-CRATE ?auto_25602 ) ( not ( = ?auto_25616 ?auto_25613 ) ) ( HOIST-AT ?auto_25618 ?auto_25616 ) ( AVAILABLE ?auto_25618 ) ( SURFACE-AT ?auto_25602 ?auto_25616 ) ( ON ?auto_25602 ?auto_25624 ) ( CLEAR ?auto_25602 ) ( not ( = ?auto_25601 ?auto_25602 ) ) ( not ( = ?auto_25601 ?auto_25624 ) ) ( not ( = ?auto_25602 ?auto_25624 ) ) ( not ( = ?auto_25611 ?auto_25618 ) ) ( IS-CRATE ?auto_25601 ) ( AVAILABLE ?auto_25633 ) ( SURFACE-AT ?auto_25601 ?auto_25615 ) ( ON ?auto_25601 ?auto_25622 ) ( CLEAR ?auto_25601 ) ( not ( = ?auto_25600 ?auto_25601 ) ) ( not ( = ?auto_25600 ?auto_25622 ) ) ( not ( = ?auto_25601 ?auto_25622 ) ) ( IS-CRATE ?auto_25600 ) ( not ( = ?auto_25634 ?auto_25613 ) ) ( HOIST-AT ?auto_25621 ?auto_25634 ) ( AVAILABLE ?auto_25621 ) ( SURFACE-AT ?auto_25600 ?auto_25634 ) ( ON ?auto_25600 ?auto_25626 ) ( CLEAR ?auto_25600 ) ( not ( = ?auto_25599 ?auto_25600 ) ) ( not ( = ?auto_25599 ?auto_25626 ) ) ( not ( = ?auto_25600 ?auto_25626 ) ) ( not ( = ?auto_25611 ?auto_25621 ) ) ( SURFACE-AT ?auto_25598 ?auto_25613 ) ( CLEAR ?auto_25598 ) ( IS-CRATE ?auto_25599 ) ( AVAILABLE ?auto_25611 ) ( not ( = ?auto_25629 ?auto_25613 ) ) ( HOIST-AT ?auto_25628 ?auto_25629 ) ( AVAILABLE ?auto_25628 ) ( SURFACE-AT ?auto_25599 ?auto_25629 ) ( ON ?auto_25599 ?auto_25631 ) ( CLEAR ?auto_25599 ) ( TRUCK-AT ?auto_25608 ?auto_25613 ) ( not ( = ?auto_25598 ?auto_25599 ) ) ( not ( = ?auto_25598 ?auto_25631 ) ) ( not ( = ?auto_25599 ?auto_25631 ) ) ( not ( = ?auto_25611 ?auto_25628 ) ) ( not ( = ?auto_25598 ?auto_25600 ) ) ( not ( = ?auto_25598 ?auto_25626 ) ) ( not ( = ?auto_25600 ?auto_25631 ) ) ( not ( = ?auto_25634 ?auto_25629 ) ) ( not ( = ?auto_25621 ?auto_25628 ) ) ( not ( = ?auto_25626 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25601 ) ) ( not ( = ?auto_25598 ?auto_25622 ) ) ( not ( = ?auto_25599 ?auto_25601 ) ) ( not ( = ?auto_25599 ?auto_25622 ) ) ( not ( = ?auto_25601 ?auto_25626 ) ) ( not ( = ?auto_25601 ?auto_25631 ) ) ( not ( = ?auto_25615 ?auto_25634 ) ) ( not ( = ?auto_25615 ?auto_25629 ) ) ( not ( = ?auto_25633 ?auto_25621 ) ) ( not ( = ?auto_25633 ?auto_25628 ) ) ( not ( = ?auto_25622 ?auto_25626 ) ) ( not ( = ?auto_25622 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25602 ) ) ( not ( = ?auto_25598 ?auto_25624 ) ) ( not ( = ?auto_25599 ?auto_25602 ) ) ( not ( = ?auto_25599 ?auto_25624 ) ) ( not ( = ?auto_25600 ?auto_25602 ) ) ( not ( = ?auto_25600 ?auto_25624 ) ) ( not ( = ?auto_25602 ?auto_25622 ) ) ( not ( = ?auto_25602 ?auto_25626 ) ) ( not ( = ?auto_25602 ?auto_25631 ) ) ( not ( = ?auto_25616 ?auto_25615 ) ) ( not ( = ?auto_25616 ?auto_25634 ) ) ( not ( = ?auto_25616 ?auto_25629 ) ) ( not ( = ?auto_25618 ?auto_25633 ) ) ( not ( = ?auto_25618 ?auto_25621 ) ) ( not ( = ?auto_25618 ?auto_25628 ) ) ( not ( = ?auto_25624 ?auto_25622 ) ) ( not ( = ?auto_25624 ?auto_25626 ) ) ( not ( = ?auto_25624 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25603 ) ) ( not ( = ?auto_25598 ?auto_25632 ) ) ( not ( = ?auto_25599 ?auto_25603 ) ) ( not ( = ?auto_25599 ?auto_25632 ) ) ( not ( = ?auto_25600 ?auto_25603 ) ) ( not ( = ?auto_25600 ?auto_25632 ) ) ( not ( = ?auto_25601 ?auto_25603 ) ) ( not ( = ?auto_25601 ?auto_25632 ) ) ( not ( = ?auto_25603 ?auto_25624 ) ) ( not ( = ?auto_25603 ?auto_25622 ) ) ( not ( = ?auto_25603 ?auto_25626 ) ) ( not ( = ?auto_25603 ?auto_25631 ) ) ( not ( = ?auto_25632 ?auto_25624 ) ) ( not ( = ?auto_25632 ?auto_25622 ) ) ( not ( = ?auto_25632 ?auto_25626 ) ) ( not ( = ?auto_25632 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25606 ) ) ( not ( = ?auto_25598 ?auto_25614 ) ) ( not ( = ?auto_25599 ?auto_25606 ) ) ( not ( = ?auto_25599 ?auto_25614 ) ) ( not ( = ?auto_25600 ?auto_25606 ) ) ( not ( = ?auto_25600 ?auto_25614 ) ) ( not ( = ?auto_25601 ?auto_25606 ) ) ( not ( = ?auto_25601 ?auto_25614 ) ) ( not ( = ?auto_25602 ?auto_25606 ) ) ( not ( = ?auto_25602 ?auto_25614 ) ) ( not ( = ?auto_25606 ?auto_25632 ) ) ( not ( = ?auto_25606 ?auto_25624 ) ) ( not ( = ?auto_25606 ?auto_25622 ) ) ( not ( = ?auto_25606 ?auto_25626 ) ) ( not ( = ?auto_25606 ?auto_25631 ) ) ( not ( = ?auto_25630 ?auto_25615 ) ) ( not ( = ?auto_25630 ?auto_25616 ) ) ( not ( = ?auto_25630 ?auto_25634 ) ) ( not ( = ?auto_25630 ?auto_25629 ) ) ( not ( = ?auto_25625 ?auto_25633 ) ) ( not ( = ?auto_25625 ?auto_25618 ) ) ( not ( = ?auto_25625 ?auto_25621 ) ) ( not ( = ?auto_25625 ?auto_25628 ) ) ( not ( = ?auto_25614 ?auto_25632 ) ) ( not ( = ?auto_25614 ?auto_25624 ) ) ( not ( = ?auto_25614 ?auto_25622 ) ) ( not ( = ?auto_25614 ?auto_25626 ) ) ( not ( = ?auto_25614 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25605 ) ) ( not ( = ?auto_25598 ?auto_25620 ) ) ( not ( = ?auto_25599 ?auto_25605 ) ) ( not ( = ?auto_25599 ?auto_25620 ) ) ( not ( = ?auto_25600 ?auto_25605 ) ) ( not ( = ?auto_25600 ?auto_25620 ) ) ( not ( = ?auto_25601 ?auto_25605 ) ) ( not ( = ?auto_25601 ?auto_25620 ) ) ( not ( = ?auto_25602 ?auto_25605 ) ) ( not ( = ?auto_25602 ?auto_25620 ) ) ( not ( = ?auto_25603 ?auto_25605 ) ) ( not ( = ?auto_25603 ?auto_25620 ) ) ( not ( = ?auto_25605 ?auto_25614 ) ) ( not ( = ?auto_25605 ?auto_25632 ) ) ( not ( = ?auto_25605 ?auto_25624 ) ) ( not ( = ?auto_25605 ?auto_25622 ) ) ( not ( = ?auto_25605 ?auto_25626 ) ) ( not ( = ?auto_25605 ?auto_25631 ) ) ( not ( = ?auto_25619 ?auto_25630 ) ) ( not ( = ?auto_25619 ?auto_25615 ) ) ( not ( = ?auto_25619 ?auto_25616 ) ) ( not ( = ?auto_25619 ?auto_25634 ) ) ( not ( = ?auto_25619 ?auto_25629 ) ) ( not ( = ?auto_25627 ?auto_25625 ) ) ( not ( = ?auto_25627 ?auto_25633 ) ) ( not ( = ?auto_25627 ?auto_25618 ) ) ( not ( = ?auto_25627 ?auto_25621 ) ) ( not ( = ?auto_25627 ?auto_25628 ) ) ( not ( = ?auto_25620 ?auto_25614 ) ) ( not ( = ?auto_25620 ?auto_25632 ) ) ( not ( = ?auto_25620 ?auto_25624 ) ) ( not ( = ?auto_25620 ?auto_25622 ) ) ( not ( = ?auto_25620 ?auto_25626 ) ) ( not ( = ?auto_25620 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25604 ) ) ( not ( = ?auto_25598 ?auto_25623 ) ) ( not ( = ?auto_25599 ?auto_25604 ) ) ( not ( = ?auto_25599 ?auto_25623 ) ) ( not ( = ?auto_25600 ?auto_25604 ) ) ( not ( = ?auto_25600 ?auto_25623 ) ) ( not ( = ?auto_25601 ?auto_25604 ) ) ( not ( = ?auto_25601 ?auto_25623 ) ) ( not ( = ?auto_25602 ?auto_25604 ) ) ( not ( = ?auto_25602 ?auto_25623 ) ) ( not ( = ?auto_25603 ?auto_25604 ) ) ( not ( = ?auto_25603 ?auto_25623 ) ) ( not ( = ?auto_25606 ?auto_25604 ) ) ( not ( = ?auto_25606 ?auto_25623 ) ) ( not ( = ?auto_25604 ?auto_25620 ) ) ( not ( = ?auto_25604 ?auto_25614 ) ) ( not ( = ?auto_25604 ?auto_25632 ) ) ( not ( = ?auto_25604 ?auto_25624 ) ) ( not ( = ?auto_25604 ?auto_25622 ) ) ( not ( = ?auto_25604 ?auto_25626 ) ) ( not ( = ?auto_25604 ?auto_25631 ) ) ( not ( = ?auto_25617 ?auto_25619 ) ) ( not ( = ?auto_25617 ?auto_25630 ) ) ( not ( = ?auto_25617 ?auto_25615 ) ) ( not ( = ?auto_25617 ?auto_25616 ) ) ( not ( = ?auto_25617 ?auto_25634 ) ) ( not ( = ?auto_25617 ?auto_25629 ) ) ( not ( = ?auto_25635 ?auto_25627 ) ) ( not ( = ?auto_25635 ?auto_25625 ) ) ( not ( = ?auto_25635 ?auto_25633 ) ) ( not ( = ?auto_25635 ?auto_25618 ) ) ( not ( = ?auto_25635 ?auto_25621 ) ) ( not ( = ?auto_25635 ?auto_25628 ) ) ( not ( = ?auto_25623 ?auto_25620 ) ) ( not ( = ?auto_25623 ?auto_25614 ) ) ( not ( = ?auto_25623 ?auto_25632 ) ) ( not ( = ?auto_25623 ?auto_25624 ) ) ( not ( = ?auto_25623 ?auto_25622 ) ) ( not ( = ?auto_25623 ?auto_25626 ) ) ( not ( = ?auto_25623 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25607 ) ) ( not ( = ?auto_25598 ?auto_25609 ) ) ( not ( = ?auto_25599 ?auto_25607 ) ) ( not ( = ?auto_25599 ?auto_25609 ) ) ( not ( = ?auto_25600 ?auto_25607 ) ) ( not ( = ?auto_25600 ?auto_25609 ) ) ( not ( = ?auto_25601 ?auto_25607 ) ) ( not ( = ?auto_25601 ?auto_25609 ) ) ( not ( = ?auto_25602 ?auto_25607 ) ) ( not ( = ?auto_25602 ?auto_25609 ) ) ( not ( = ?auto_25603 ?auto_25607 ) ) ( not ( = ?auto_25603 ?auto_25609 ) ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25609 ) ) ( not ( = ?auto_25605 ?auto_25607 ) ) ( not ( = ?auto_25605 ?auto_25609 ) ) ( not ( = ?auto_25607 ?auto_25623 ) ) ( not ( = ?auto_25607 ?auto_25620 ) ) ( not ( = ?auto_25607 ?auto_25614 ) ) ( not ( = ?auto_25607 ?auto_25632 ) ) ( not ( = ?auto_25607 ?auto_25624 ) ) ( not ( = ?auto_25607 ?auto_25622 ) ) ( not ( = ?auto_25607 ?auto_25626 ) ) ( not ( = ?auto_25607 ?auto_25631 ) ) ( not ( = ?auto_25612 ?auto_25617 ) ) ( not ( = ?auto_25612 ?auto_25619 ) ) ( not ( = ?auto_25612 ?auto_25630 ) ) ( not ( = ?auto_25612 ?auto_25615 ) ) ( not ( = ?auto_25612 ?auto_25616 ) ) ( not ( = ?auto_25612 ?auto_25634 ) ) ( not ( = ?auto_25612 ?auto_25629 ) ) ( not ( = ?auto_25610 ?auto_25635 ) ) ( not ( = ?auto_25610 ?auto_25627 ) ) ( not ( = ?auto_25610 ?auto_25625 ) ) ( not ( = ?auto_25610 ?auto_25633 ) ) ( not ( = ?auto_25610 ?auto_25618 ) ) ( not ( = ?auto_25610 ?auto_25621 ) ) ( not ( = ?auto_25610 ?auto_25628 ) ) ( not ( = ?auto_25609 ?auto_25623 ) ) ( not ( = ?auto_25609 ?auto_25620 ) ) ( not ( = ?auto_25609 ?auto_25614 ) ) ( not ( = ?auto_25609 ?auto_25632 ) ) ( not ( = ?auto_25609 ?auto_25624 ) ) ( not ( = ?auto_25609 ?auto_25622 ) ) ( not ( = ?auto_25609 ?auto_25626 ) ) ( not ( = ?auto_25609 ?auto_25631 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_25598 ?auto_25599 ?auto_25600 ?auto_25601 ?auto_25602 ?auto_25603 ?auto_25606 ?auto_25605 ?auto_25604 )
      ( MAKE-1CRATE ?auto_25604 ?auto_25607 )
      ( MAKE-9CRATE-VERIFY ?auto_25598 ?auto_25599 ?auto_25600 ?auto_25601 ?auto_25602 ?auto_25603 ?auto_25606 ?auto_25605 ?auto_25604 ?auto_25607 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25638 - SURFACE
      ?auto_25639 - SURFACE
    )
    :vars
    (
      ?auto_25640 - HOIST
      ?auto_25641 - PLACE
      ?auto_25643 - PLACE
      ?auto_25644 - HOIST
      ?auto_25645 - SURFACE
      ?auto_25642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25640 ?auto_25641 ) ( SURFACE-AT ?auto_25638 ?auto_25641 ) ( CLEAR ?auto_25638 ) ( IS-CRATE ?auto_25639 ) ( AVAILABLE ?auto_25640 ) ( not ( = ?auto_25643 ?auto_25641 ) ) ( HOIST-AT ?auto_25644 ?auto_25643 ) ( AVAILABLE ?auto_25644 ) ( SURFACE-AT ?auto_25639 ?auto_25643 ) ( ON ?auto_25639 ?auto_25645 ) ( CLEAR ?auto_25639 ) ( TRUCK-AT ?auto_25642 ?auto_25641 ) ( not ( = ?auto_25638 ?auto_25639 ) ) ( not ( = ?auto_25638 ?auto_25645 ) ) ( not ( = ?auto_25639 ?auto_25645 ) ) ( not ( = ?auto_25640 ?auto_25644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25642 ?auto_25641 ?auto_25643 )
      ( !LIFT ?auto_25644 ?auto_25639 ?auto_25645 ?auto_25643 )
      ( !LOAD ?auto_25644 ?auto_25639 ?auto_25642 ?auto_25643 )
      ( !DRIVE ?auto_25642 ?auto_25643 ?auto_25641 )
      ( !UNLOAD ?auto_25640 ?auto_25639 ?auto_25642 ?auto_25641 )
      ( !DROP ?auto_25640 ?auto_25639 ?auto_25638 ?auto_25641 )
      ( MAKE-1CRATE-VERIFY ?auto_25638 ?auto_25639 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_25657 - SURFACE
      ?auto_25658 - SURFACE
      ?auto_25659 - SURFACE
      ?auto_25660 - SURFACE
      ?auto_25661 - SURFACE
      ?auto_25662 - SURFACE
      ?auto_25665 - SURFACE
      ?auto_25664 - SURFACE
      ?auto_25663 - SURFACE
      ?auto_25666 - SURFACE
      ?auto_25667 - SURFACE
    )
    :vars
    (
      ?auto_25671 - HOIST
      ?auto_25669 - PLACE
      ?auto_25672 - PLACE
      ?auto_25673 - HOIST
      ?auto_25670 - SURFACE
      ?auto_25683 - PLACE
      ?auto_25678 - HOIST
      ?auto_25681 - SURFACE
      ?auto_25680 - PLACE
      ?auto_25675 - HOIST
      ?auto_25697 - SURFACE
      ?auto_25698 - PLACE
      ?auto_25692 - HOIST
      ?auto_25684 - SURFACE
      ?auto_25677 - PLACE
      ?auto_25696 - HOIST
      ?auto_25682 - SURFACE
      ?auto_25686 - PLACE
      ?auto_25693 - HOIST
      ?auto_25687 - SURFACE
      ?auto_25674 - PLACE
      ?auto_25694 - HOIST
      ?auto_25676 - SURFACE
      ?auto_25685 - SURFACE
      ?auto_25695 - PLACE
      ?auto_25690 - HOIST
      ?auto_25689 - SURFACE
      ?auto_25688 - PLACE
      ?auto_25691 - HOIST
      ?auto_25679 - SURFACE
      ?auto_25668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25671 ?auto_25669 ) ( IS-CRATE ?auto_25667 ) ( not ( = ?auto_25672 ?auto_25669 ) ) ( HOIST-AT ?auto_25673 ?auto_25672 ) ( AVAILABLE ?auto_25673 ) ( SURFACE-AT ?auto_25667 ?auto_25672 ) ( ON ?auto_25667 ?auto_25670 ) ( CLEAR ?auto_25667 ) ( not ( = ?auto_25666 ?auto_25667 ) ) ( not ( = ?auto_25666 ?auto_25670 ) ) ( not ( = ?auto_25667 ?auto_25670 ) ) ( not ( = ?auto_25671 ?auto_25673 ) ) ( IS-CRATE ?auto_25666 ) ( not ( = ?auto_25683 ?auto_25669 ) ) ( HOIST-AT ?auto_25678 ?auto_25683 ) ( AVAILABLE ?auto_25678 ) ( SURFACE-AT ?auto_25666 ?auto_25683 ) ( ON ?auto_25666 ?auto_25681 ) ( CLEAR ?auto_25666 ) ( not ( = ?auto_25663 ?auto_25666 ) ) ( not ( = ?auto_25663 ?auto_25681 ) ) ( not ( = ?auto_25666 ?auto_25681 ) ) ( not ( = ?auto_25671 ?auto_25678 ) ) ( IS-CRATE ?auto_25663 ) ( not ( = ?auto_25680 ?auto_25669 ) ) ( HOIST-AT ?auto_25675 ?auto_25680 ) ( AVAILABLE ?auto_25675 ) ( SURFACE-AT ?auto_25663 ?auto_25680 ) ( ON ?auto_25663 ?auto_25697 ) ( CLEAR ?auto_25663 ) ( not ( = ?auto_25664 ?auto_25663 ) ) ( not ( = ?auto_25664 ?auto_25697 ) ) ( not ( = ?auto_25663 ?auto_25697 ) ) ( not ( = ?auto_25671 ?auto_25675 ) ) ( IS-CRATE ?auto_25664 ) ( not ( = ?auto_25698 ?auto_25669 ) ) ( HOIST-AT ?auto_25692 ?auto_25698 ) ( AVAILABLE ?auto_25692 ) ( SURFACE-AT ?auto_25664 ?auto_25698 ) ( ON ?auto_25664 ?auto_25684 ) ( CLEAR ?auto_25664 ) ( not ( = ?auto_25665 ?auto_25664 ) ) ( not ( = ?auto_25665 ?auto_25684 ) ) ( not ( = ?auto_25664 ?auto_25684 ) ) ( not ( = ?auto_25671 ?auto_25692 ) ) ( IS-CRATE ?auto_25665 ) ( not ( = ?auto_25677 ?auto_25669 ) ) ( HOIST-AT ?auto_25696 ?auto_25677 ) ( AVAILABLE ?auto_25696 ) ( SURFACE-AT ?auto_25665 ?auto_25677 ) ( ON ?auto_25665 ?auto_25682 ) ( CLEAR ?auto_25665 ) ( not ( = ?auto_25662 ?auto_25665 ) ) ( not ( = ?auto_25662 ?auto_25682 ) ) ( not ( = ?auto_25665 ?auto_25682 ) ) ( not ( = ?auto_25671 ?auto_25696 ) ) ( IS-CRATE ?auto_25662 ) ( not ( = ?auto_25686 ?auto_25669 ) ) ( HOIST-AT ?auto_25693 ?auto_25686 ) ( SURFACE-AT ?auto_25662 ?auto_25686 ) ( ON ?auto_25662 ?auto_25687 ) ( CLEAR ?auto_25662 ) ( not ( = ?auto_25661 ?auto_25662 ) ) ( not ( = ?auto_25661 ?auto_25687 ) ) ( not ( = ?auto_25662 ?auto_25687 ) ) ( not ( = ?auto_25671 ?auto_25693 ) ) ( IS-CRATE ?auto_25661 ) ( not ( = ?auto_25674 ?auto_25669 ) ) ( HOIST-AT ?auto_25694 ?auto_25674 ) ( AVAILABLE ?auto_25694 ) ( SURFACE-AT ?auto_25661 ?auto_25674 ) ( ON ?auto_25661 ?auto_25676 ) ( CLEAR ?auto_25661 ) ( not ( = ?auto_25660 ?auto_25661 ) ) ( not ( = ?auto_25660 ?auto_25676 ) ) ( not ( = ?auto_25661 ?auto_25676 ) ) ( not ( = ?auto_25671 ?auto_25694 ) ) ( IS-CRATE ?auto_25660 ) ( AVAILABLE ?auto_25693 ) ( SURFACE-AT ?auto_25660 ?auto_25686 ) ( ON ?auto_25660 ?auto_25685 ) ( CLEAR ?auto_25660 ) ( not ( = ?auto_25659 ?auto_25660 ) ) ( not ( = ?auto_25659 ?auto_25685 ) ) ( not ( = ?auto_25660 ?auto_25685 ) ) ( IS-CRATE ?auto_25659 ) ( not ( = ?auto_25695 ?auto_25669 ) ) ( HOIST-AT ?auto_25690 ?auto_25695 ) ( AVAILABLE ?auto_25690 ) ( SURFACE-AT ?auto_25659 ?auto_25695 ) ( ON ?auto_25659 ?auto_25689 ) ( CLEAR ?auto_25659 ) ( not ( = ?auto_25658 ?auto_25659 ) ) ( not ( = ?auto_25658 ?auto_25689 ) ) ( not ( = ?auto_25659 ?auto_25689 ) ) ( not ( = ?auto_25671 ?auto_25690 ) ) ( SURFACE-AT ?auto_25657 ?auto_25669 ) ( CLEAR ?auto_25657 ) ( IS-CRATE ?auto_25658 ) ( AVAILABLE ?auto_25671 ) ( not ( = ?auto_25688 ?auto_25669 ) ) ( HOIST-AT ?auto_25691 ?auto_25688 ) ( AVAILABLE ?auto_25691 ) ( SURFACE-AT ?auto_25658 ?auto_25688 ) ( ON ?auto_25658 ?auto_25679 ) ( CLEAR ?auto_25658 ) ( TRUCK-AT ?auto_25668 ?auto_25669 ) ( not ( = ?auto_25657 ?auto_25658 ) ) ( not ( = ?auto_25657 ?auto_25679 ) ) ( not ( = ?auto_25658 ?auto_25679 ) ) ( not ( = ?auto_25671 ?auto_25691 ) ) ( not ( = ?auto_25657 ?auto_25659 ) ) ( not ( = ?auto_25657 ?auto_25689 ) ) ( not ( = ?auto_25659 ?auto_25679 ) ) ( not ( = ?auto_25695 ?auto_25688 ) ) ( not ( = ?auto_25690 ?auto_25691 ) ) ( not ( = ?auto_25689 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25660 ) ) ( not ( = ?auto_25657 ?auto_25685 ) ) ( not ( = ?auto_25658 ?auto_25660 ) ) ( not ( = ?auto_25658 ?auto_25685 ) ) ( not ( = ?auto_25660 ?auto_25689 ) ) ( not ( = ?auto_25660 ?auto_25679 ) ) ( not ( = ?auto_25686 ?auto_25695 ) ) ( not ( = ?auto_25686 ?auto_25688 ) ) ( not ( = ?auto_25693 ?auto_25690 ) ) ( not ( = ?auto_25693 ?auto_25691 ) ) ( not ( = ?auto_25685 ?auto_25689 ) ) ( not ( = ?auto_25685 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25661 ) ) ( not ( = ?auto_25657 ?auto_25676 ) ) ( not ( = ?auto_25658 ?auto_25661 ) ) ( not ( = ?auto_25658 ?auto_25676 ) ) ( not ( = ?auto_25659 ?auto_25661 ) ) ( not ( = ?auto_25659 ?auto_25676 ) ) ( not ( = ?auto_25661 ?auto_25685 ) ) ( not ( = ?auto_25661 ?auto_25689 ) ) ( not ( = ?auto_25661 ?auto_25679 ) ) ( not ( = ?auto_25674 ?auto_25686 ) ) ( not ( = ?auto_25674 ?auto_25695 ) ) ( not ( = ?auto_25674 ?auto_25688 ) ) ( not ( = ?auto_25694 ?auto_25693 ) ) ( not ( = ?auto_25694 ?auto_25690 ) ) ( not ( = ?auto_25694 ?auto_25691 ) ) ( not ( = ?auto_25676 ?auto_25685 ) ) ( not ( = ?auto_25676 ?auto_25689 ) ) ( not ( = ?auto_25676 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25662 ) ) ( not ( = ?auto_25657 ?auto_25687 ) ) ( not ( = ?auto_25658 ?auto_25662 ) ) ( not ( = ?auto_25658 ?auto_25687 ) ) ( not ( = ?auto_25659 ?auto_25662 ) ) ( not ( = ?auto_25659 ?auto_25687 ) ) ( not ( = ?auto_25660 ?auto_25662 ) ) ( not ( = ?auto_25660 ?auto_25687 ) ) ( not ( = ?auto_25662 ?auto_25676 ) ) ( not ( = ?auto_25662 ?auto_25685 ) ) ( not ( = ?auto_25662 ?auto_25689 ) ) ( not ( = ?auto_25662 ?auto_25679 ) ) ( not ( = ?auto_25687 ?auto_25676 ) ) ( not ( = ?auto_25687 ?auto_25685 ) ) ( not ( = ?auto_25687 ?auto_25689 ) ) ( not ( = ?auto_25687 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25665 ) ) ( not ( = ?auto_25657 ?auto_25682 ) ) ( not ( = ?auto_25658 ?auto_25665 ) ) ( not ( = ?auto_25658 ?auto_25682 ) ) ( not ( = ?auto_25659 ?auto_25665 ) ) ( not ( = ?auto_25659 ?auto_25682 ) ) ( not ( = ?auto_25660 ?auto_25665 ) ) ( not ( = ?auto_25660 ?auto_25682 ) ) ( not ( = ?auto_25661 ?auto_25665 ) ) ( not ( = ?auto_25661 ?auto_25682 ) ) ( not ( = ?auto_25665 ?auto_25687 ) ) ( not ( = ?auto_25665 ?auto_25676 ) ) ( not ( = ?auto_25665 ?auto_25685 ) ) ( not ( = ?auto_25665 ?auto_25689 ) ) ( not ( = ?auto_25665 ?auto_25679 ) ) ( not ( = ?auto_25677 ?auto_25686 ) ) ( not ( = ?auto_25677 ?auto_25674 ) ) ( not ( = ?auto_25677 ?auto_25695 ) ) ( not ( = ?auto_25677 ?auto_25688 ) ) ( not ( = ?auto_25696 ?auto_25693 ) ) ( not ( = ?auto_25696 ?auto_25694 ) ) ( not ( = ?auto_25696 ?auto_25690 ) ) ( not ( = ?auto_25696 ?auto_25691 ) ) ( not ( = ?auto_25682 ?auto_25687 ) ) ( not ( = ?auto_25682 ?auto_25676 ) ) ( not ( = ?auto_25682 ?auto_25685 ) ) ( not ( = ?auto_25682 ?auto_25689 ) ) ( not ( = ?auto_25682 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25664 ) ) ( not ( = ?auto_25657 ?auto_25684 ) ) ( not ( = ?auto_25658 ?auto_25664 ) ) ( not ( = ?auto_25658 ?auto_25684 ) ) ( not ( = ?auto_25659 ?auto_25664 ) ) ( not ( = ?auto_25659 ?auto_25684 ) ) ( not ( = ?auto_25660 ?auto_25664 ) ) ( not ( = ?auto_25660 ?auto_25684 ) ) ( not ( = ?auto_25661 ?auto_25664 ) ) ( not ( = ?auto_25661 ?auto_25684 ) ) ( not ( = ?auto_25662 ?auto_25664 ) ) ( not ( = ?auto_25662 ?auto_25684 ) ) ( not ( = ?auto_25664 ?auto_25682 ) ) ( not ( = ?auto_25664 ?auto_25687 ) ) ( not ( = ?auto_25664 ?auto_25676 ) ) ( not ( = ?auto_25664 ?auto_25685 ) ) ( not ( = ?auto_25664 ?auto_25689 ) ) ( not ( = ?auto_25664 ?auto_25679 ) ) ( not ( = ?auto_25698 ?auto_25677 ) ) ( not ( = ?auto_25698 ?auto_25686 ) ) ( not ( = ?auto_25698 ?auto_25674 ) ) ( not ( = ?auto_25698 ?auto_25695 ) ) ( not ( = ?auto_25698 ?auto_25688 ) ) ( not ( = ?auto_25692 ?auto_25696 ) ) ( not ( = ?auto_25692 ?auto_25693 ) ) ( not ( = ?auto_25692 ?auto_25694 ) ) ( not ( = ?auto_25692 ?auto_25690 ) ) ( not ( = ?auto_25692 ?auto_25691 ) ) ( not ( = ?auto_25684 ?auto_25682 ) ) ( not ( = ?auto_25684 ?auto_25687 ) ) ( not ( = ?auto_25684 ?auto_25676 ) ) ( not ( = ?auto_25684 ?auto_25685 ) ) ( not ( = ?auto_25684 ?auto_25689 ) ) ( not ( = ?auto_25684 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25663 ) ) ( not ( = ?auto_25657 ?auto_25697 ) ) ( not ( = ?auto_25658 ?auto_25663 ) ) ( not ( = ?auto_25658 ?auto_25697 ) ) ( not ( = ?auto_25659 ?auto_25663 ) ) ( not ( = ?auto_25659 ?auto_25697 ) ) ( not ( = ?auto_25660 ?auto_25663 ) ) ( not ( = ?auto_25660 ?auto_25697 ) ) ( not ( = ?auto_25661 ?auto_25663 ) ) ( not ( = ?auto_25661 ?auto_25697 ) ) ( not ( = ?auto_25662 ?auto_25663 ) ) ( not ( = ?auto_25662 ?auto_25697 ) ) ( not ( = ?auto_25665 ?auto_25663 ) ) ( not ( = ?auto_25665 ?auto_25697 ) ) ( not ( = ?auto_25663 ?auto_25684 ) ) ( not ( = ?auto_25663 ?auto_25682 ) ) ( not ( = ?auto_25663 ?auto_25687 ) ) ( not ( = ?auto_25663 ?auto_25676 ) ) ( not ( = ?auto_25663 ?auto_25685 ) ) ( not ( = ?auto_25663 ?auto_25689 ) ) ( not ( = ?auto_25663 ?auto_25679 ) ) ( not ( = ?auto_25680 ?auto_25698 ) ) ( not ( = ?auto_25680 ?auto_25677 ) ) ( not ( = ?auto_25680 ?auto_25686 ) ) ( not ( = ?auto_25680 ?auto_25674 ) ) ( not ( = ?auto_25680 ?auto_25695 ) ) ( not ( = ?auto_25680 ?auto_25688 ) ) ( not ( = ?auto_25675 ?auto_25692 ) ) ( not ( = ?auto_25675 ?auto_25696 ) ) ( not ( = ?auto_25675 ?auto_25693 ) ) ( not ( = ?auto_25675 ?auto_25694 ) ) ( not ( = ?auto_25675 ?auto_25690 ) ) ( not ( = ?auto_25675 ?auto_25691 ) ) ( not ( = ?auto_25697 ?auto_25684 ) ) ( not ( = ?auto_25697 ?auto_25682 ) ) ( not ( = ?auto_25697 ?auto_25687 ) ) ( not ( = ?auto_25697 ?auto_25676 ) ) ( not ( = ?auto_25697 ?auto_25685 ) ) ( not ( = ?auto_25697 ?auto_25689 ) ) ( not ( = ?auto_25697 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25666 ) ) ( not ( = ?auto_25657 ?auto_25681 ) ) ( not ( = ?auto_25658 ?auto_25666 ) ) ( not ( = ?auto_25658 ?auto_25681 ) ) ( not ( = ?auto_25659 ?auto_25666 ) ) ( not ( = ?auto_25659 ?auto_25681 ) ) ( not ( = ?auto_25660 ?auto_25666 ) ) ( not ( = ?auto_25660 ?auto_25681 ) ) ( not ( = ?auto_25661 ?auto_25666 ) ) ( not ( = ?auto_25661 ?auto_25681 ) ) ( not ( = ?auto_25662 ?auto_25666 ) ) ( not ( = ?auto_25662 ?auto_25681 ) ) ( not ( = ?auto_25665 ?auto_25666 ) ) ( not ( = ?auto_25665 ?auto_25681 ) ) ( not ( = ?auto_25664 ?auto_25666 ) ) ( not ( = ?auto_25664 ?auto_25681 ) ) ( not ( = ?auto_25666 ?auto_25697 ) ) ( not ( = ?auto_25666 ?auto_25684 ) ) ( not ( = ?auto_25666 ?auto_25682 ) ) ( not ( = ?auto_25666 ?auto_25687 ) ) ( not ( = ?auto_25666 ?auto_25676 ) ) ( not ( = ?auto_25666 ?auto_25685 ) ) ( not ( = ?auto_25666 ?auto_25689 ) ) ( not ( = ?auto_25666 ?auto_25679 ) ) ( not ( = ?auto_25683 ?auto_25680 ) ) ( not ( = ?auto_25683 ?auto_25698 ) ) ( not ( = ?auto_25683 ?auto_25677 ) ) ( not ( = ?auto_25683 ?auto_25686 ) ) ( not ( = ?auto_25683 ?auto_25674 ) ) ( not ( = ?auto_25683 ?auto_25695 ) ) ( not ( = ?auto_25683 ?auto_25688 ) ) ( not ( = ?auto_25678 ?auto_25675 ) ) ( not ( = ?auto_25678 ?auto_25692 ) ) ( not ( = ?auto_25678 ?auto_25696 ) ) ( not ( = ?auto_25678 ?auto_25693 ) ) ( not ( = ?auto_25678 ?auto_25694 ) ) ( not ( = ?auto_25678 ?auto_25690 ) ) ( not ( = ?auto_25678 ?auto_25691 ) ) ( not ( = ?auto_25681 ?auto_25697 ) ) ( not ( = ?auto_25681 ?auto_25684 ) ) ( not ( = ?auto_25681 ?auto_25682 ) ) ( not ( = ?auto_25681 ?auto_25687 ) ) ( not ( = ?auto_25681 ?auto_25676 ) ) ( not ( = ?auto_25681 ?auto_25685 ) ) ( not ( = ?auto_25681 ?auto_25689 ) ) ( not ( = ?auto_25681 ?auto_25679 ) ) ( not ( = ?auto_25657 ?auto_25667 ) ) ( not ( = ?auto_25657 ?auto_25670 ) ) ( not ( = ?auto_25658 ?auto_25667 ) ) ( not ( = ?auto_25658 ?auto_25670 ) ) ( not ( = ?auto_25659 ?auto_25667 ) ) ( not ( = ?auto_25659 ?auto_25670 ) ) ( not ( = ?auto_25660 ?auto_25667 ) ) ( not ( = ?auto_25660 ?auto_25670 ) ) ( not ( = ?auto_25661 ?auto_25667 ) ) ( not ( = ?auto_25661 ?auto_25670 ) ) ( not ( = ?auto_25662 ?auto_25667 ) ) ( not ( = ?auto_25662 ?auto_25670 ) ) ( not ( = ?auto_25665 ?auto_25667 ) ) ( not ( = ?auto_25665 ?auto_25670 ) ) ( not ( = ?auto_25664 ?auto_25667 ) ) ( not ( = ?auto_25664 ?auto_25670 ) ) ( not ( = ?auto_25663 ?auto_25667 ) ) ( not ( = ?auto_25663 ?auto_25670 ) ) ( not ( = ?auto_25667 ?auto_25681 ) ) ( not ( = ?auto_25667 ?auto_25697 ) ) ( not ( = ?auto_25667 ?auto_25684 ) ) ( not ( = ?auto_25667 ?auto_25682 ) ) ( not ( = ?auto_25667 ?auto_25687 ) ) ( not ( = ?auto_25667 ?auto_25676 ) ) ( not ( = ?auto_25667 ?auto_25685 ) ) ( not ( = ?auto_25667 ?auto_25689 ) ) ( not ( = ?auto_25667 ?auto_25679 ) ) ( not ( = ?auto_25672 ?auto_25683 ) ) ( not ( = ?auto_25672 ?auto_25680 ) ) ( not ( = ?auto_25672 ?auto_25698 ) ) ( not ( = ?auto_25672 ?auto_25677 ) ) ( not ( = ?auto_25672 ?auto_25686 ) ) ( not ( = ?auto_25672 ?auto_25674 ) ) ( not ( = ?auto_25672 ?auto_25695 ) ) ( not ( = ?auto_25672 ?auto_25688 ) ) ( not ( = ?auto_25673 ?auto_25678 ) ) ( not ( = ?auto_25673 ?auto_25675 ) ) ( not ( = ?auto_25673 ?auto_25692 ) ) ( not ( = ?auto_25673 ?auto_25696 ) ) ( not ( = ?auto_25673 ?auto_25693 ) ) ( not ( = ?auto_25673 ?auto_25694 ) ) ( not ( = ?auto_25673 ?auto_25690 ) ) ( not ( = ?auto_25673 ?auto_25691 ) ) ( not ( = ?auto_25670 ?auto_25681 ) ) ( not ( = ?auto_25670 ?auto_25697 ) ) ( not ( = ?auto_25670 ?auto_25684 ) ) ( not ( = ?auto_25670 ?auto_25682 ) ) ( not ( = ?auto_25670 ?auto_25687 ) ) ( not ( = ?auto_25670 ?auto_25676 ) ) ( not ( = ?auto_25670 ?auto_25685 ) ) ( not ( = ?auto_25670 ?auto_25689 ) ) ( not ( = ?auto_25670 ?auto_25679 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_25657 ?auto_25658 ?auto_25659 ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25665 ?auto_25664 ?auto_25663 ?auto_25666 )
      ( MAKE-1CRATE ?auto_25666 ?auto_25667 )
      ( MAKE-10CRATE-VERIFY ?auto_25657 ?auto_25658 ?auto_25659 ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25665 ?auto_25664 ?auto_25663 ?auto_25666 ?auto_25667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25701 - SURFACE
      ?auto_25702 - SURFACE
    )
    :vars
    (
      ?auto_25703 - HOIST
      ?auto_25704 - PLACE
      ?auto_25706 - PLACE
      ?auto_25707 - HOIST
      ?auto_25708 - SURFACE
      ?auto_25705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25703 ?auto_25704 ) ( SURFACE-AT ?auto_25701 ?auto_25704 ) ( CLEAR ?auto_25701 ) ( IS-CRATE ?auto_25702 ) ( AVAILABLE ?auto_25703 ) ( not ( = ?auto_25706 ?auto_25704 ) ) ( HOIST-AT ?auto_25707 ?auto_25706 ) ( AVAILABLE ?auto_25707 ) ( SURFACE-AT ?auto_25702 ?auto_25706 ) ( ON ?auto_25702 ?auto_25708 ) ( CLEAR ?auto_25702 ) ( TRUCK-AT ?auto_25705 ?auto_25704 ) ( not ( = ?auto_25701 ?auto_25702 ) ) ( not ( = ?auto_25701 ?auto_25708 ) ) ( not ( = ?auto_25702 ?auto_25708 ) ) ( not ( = ?auto_25703 ?auto_25707 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25705 ?auto_25704 ?auto_25706 )
      ( !LIFT ?auto_25707 ?auto_25702 ?auto_25708 ?auto_25706 )
      ( !LOAD ?auto_25707 ?auto_25702 ?auto_25705 ?auto_25706 )
      ( !DRIVE ?auto_25705 ?auto_25706 ?auto_25704 )
      ( !UNLOAD ?auto_25703 ?auto_25702 ?auto_25705 ?auto_25704 )
      ( !DROP ?auto_25703 ?auto_25702 ?auto_25701 ?auto_25704 )
      ( MAKE-1CRATE-VERIFY ?auto_25701 ?auto_25702 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_25721 - SURFACE
      ?auto_25722 - SURFACE
      ?auto_25723 - SURFACE
      ?auto_25724 - SURFACE
      ?auto_25725 - SURFACE
      ?auto_25726 - SURFACE
      ?auto_25729 - SURFACE
      ?auto_25728 - SURFACE
      ?auto_25727 - SURFACE
      ?auto_25730 - SURFACE
      ?auto_25732 - SURFACE
      ?auto_25731 - SURFACE
    )
    :vars
    (
      ?auto_25734 - HOIST
      ?auto_25736 - PLACE
      ?auto_25735 - PLACE
      ?auto_25733 - HOIST
      ?auto_25737 - SURFACE
      ?auto_25748 - PLACE
      ?auto_25766 - HOIST
      ?auto_25742 - SURFACE
      ?auto_25749 - PLACE
      ?auto_25765 - HOIST
      ?auto_25762 - SURFACE
      ?auto_25759 - PLACE
      ?auto_25758 - HOIST
      ?auto_25741 - SURFACE
      ?auto_25747 - PLACE
      ?auto_25745 - HOIST
      ?auto_25740 - SURFACE
      ?auto_25755 - PLACE
      ?auto_25760 - HOIST
      ?auto_25739 - SURFACE
      ?auto_25750 - PLACE
      ?auto_25761 - HOIST
      ?auto_25751 - SURFACE
      ?auto_25754 - PLACE
      ?auto_25763 - HOIST
      ?auto_25744 - SURFACE
      ?auto_25756 - SURFACE
      ?auto_25746 - PLACE
      ?auto_25743 - HOIST
      ?auto_25757 - SURFACE
      ?auto_25752 - PLACE
      ?auto_25764 - HOIST
      ?auto_25753 - SURFACE
      ?auto_25738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25734 ?auto_25736 ) ( IS-CRATE ?auto_25731 ) ( not ( = ?auto_25735 ?auto_25736 ) ) ( HOIST-AT ?auto_25733 ?auto_25735 ) ( AVAILABLE ?auto_25733 ) ( SURFACE-AT ?auto_25731 ?auto_25735 ) ( ON ?auto_25731 ?auto_25737 ) ( CLEAR ?auto_25731 ) ( not ( = ?auto_25732 ?auto_25731 ) ) ( not ( = ?auto_25732 ?auto_25737 ) ) ( not ( = ?auto_25731 ?auto_25737 ) ) ( not ( = ?auto_25734 ?auto_25733 ) ) ( IS-CRATE ?auto_25732 ) ( not ( = ?auto_25748 ?auto_25736 ) ) ( HOIST-AT ?auto_25766 ?auto_25748 ) ( AVAILABLE ?auto_25766 ) ( SURFACE-AT ?auto_25732 ?auto_25748 ) ( ON ?auto_25732 ?auto_25742 ) ( CLEAR ?auto_25732 ) ( not ( = ?auto_25730 ?auto_25732 ) ) ( not ( = ?auto_25730 ?auto_25742 ) ) ( not ( = ?auto_25732 ?auto_25742 ) ) ( not ( = ?auto_25734 ?auto_25766 ) ) ( IS-CRATE ?auto_25730 ) ( not ( = ?auto_25749 ?auto_25736 ) ) ( HOIST-AT ?auto_25765 ?auto_25749 ) ( AVAILABLE ?auto_25765 ) ( SURFACE-AT ?auto_25730 ?auto_25749 ) ( ON ?auto_25730 ?auto_25762 ) ( CLEAR ?auto_25730 ) ( not ( = ?auto_25727 ?auto_25730 ) ) ( not ( = ?auto_25727 ?auto_25762 ) ) ( not ( = ?auto_25730 ?auto_25762 ) ) ( not ( = ?auto_25734 ?auto_25765 ) ) ( IS-CRATE ?auto_25727 ) ( not ( = ?auto_25759 ?auto_25736 ) ) ( HOIST-AT ?auto_25758 ?auto_25759 ) ( AVAILABLE ?auto_25758 ) ( SURFACE-AT ?auto_25727 ?auto_25759 ) ( ON ?auto_25727 ?auto_25741 ) ( CLEAR ?auto_25727 ) ( not ( = ?auto_25728 ?auto_25727 ) ) ( not ( = ?auto_25728 ?auto_25741 ) ) ( not ( = ?auto_25727 ?auto_25741 ) ) ( not ( = ?auto_25734 ?auto_25758 ) ) ( IS-CRATE ?auto_25728 ) ( not ( = ?auto_25747 ?auto_25736 ) ) ( HOIST-AT ?auto_25745 ?auto_25747 ) ( AVAILABLE ?auto_25745 ) ( SURFACE-AT ?auto_25728 ?auto_25747 ) ( ON ?auto_25728 ?auto_25740 ) ( CLEAR ?auto_25728 ) ( not ( = ?auto_25729 ?auto_25728 ) ) ( not ( = ?auto_25729 ?auto_25740 ) ) ( not ( = ?auto_25728 ?auto_25740 ) ) ( not ( = ?auto_25734 ?auto_25745 ) ) ( IS-CRATE ?auto_25729 ) ( not ( = ?auto_25755 ?auto_25736 ) ) ( HOIST-AT ?auto_25760 ?auto_25755 ) ( AVAILABLE ?auto_25760 ) ( SURFACE-AT ?auto_25729 ?auto_25755 ) ( ON ?auto_25729 ?auto_25739 ) ( CLEAR ?auto_25729 ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25726 ?auto_25739 ) ) ( not ( = ?auto_25729 ?auto_25739 ) ) ( not ( = ?auto_25734 ?auto_25760 ) ) ( IS-CRATE ?auto_25726 ) ( not ( = ?auto_25750 ?auto_25736 ) ) ( HOIST-AT ?auto_25761 ?auto_25750 ) ( SURFACE-AT ?auto_25726 ?auto_25750 ) ( ON ?auto_25726 ?auto_25751 ) ( CLEAR ?auto_25726 ) ( not ( = ?auto_25725 ?auto_25726 ) ) ( not ( = ?auto_25725 ?auto_25751 ) ) ( not ( = ?auto_25726 ?auto_25751 ) ) ( not ( = ?auto_25734 ?auto_25761 ) ) ( IS-CRATE ?auto_25725 ) ( not ( = ?auto_25754 ?auto_25736 ) ) ( HOIST-AT ?auto_25763 ?auto_25754 ) ( AVAILABLE ?auto_25763 ) ( SURFACE-AT ?auto_25725 ?auto_25754 ) ( ON ?auto_25725 ?auto_25744 ) ( CLEAR ?auto_25725 ) ( not ( = ?auto_25724 ?auto_25725 ) ) ( not ( = ?auto_25724 ?auto_25744 ) ) ( not ( = ?auto_25725 ?auto_25744 ) ) ( not ( = ?auto_25734 ?auto_25763 ) ) ( IS-CRATE ?auto_25724 ) ( AVAILABLE ?auto_25761 ) ( SURFACE-AT ?auto_25724 ?auto_25750 ) ( ON ?auto_25724 ?auto_25756 ) ( CLEAR ?auto_25724 ) ( not ( = ?auto_25723 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25756 ) ) ( not ( = ?auto_25724 ?auto_25756 ) ) ( IS-CRATE ?auto_25723 ) ( not ( = ?auto_25746 ?auto_25736 ) ) ( HOIST-AT ?auto_25743 ?auto_25746 ) ( AVAILABLE ?auto_25743 ) ( SURFACE-AT ?auto_25723 ?auto_25746 ) ( ON ?auto_25723 ?auto_25757 ) ( CLEAR ?auto_25723 ) ( not ( = ?auto_25722 ?auto_25723 ) ) ( not ( = ?auto_25722 ?auto_25757 ) ) ( not ( = ?auto_25723 ?auto_25757 ) ) ( not ( = ?auto_25734 ?auto_25743 ) ) ( SURFACE-AT ?auto_25721 ?auto_25736 ) ( CLEAR ?auto_25721 ) ( IS-CRATE ?auto_25722 ) ( AVAILABLE ?auto_25734 ) ( not ( = ?auto_25752 ?auto_25736 ) ) ( HOIST-AT ?auto_25764 ?auto_25752 ) ( AVAILABLE ?auto_25764 ) ( SURFACE-AT ?auto_25722 ?auto_25752 ) ( ON ?auto_25722 ?auto_25753 ) ( CLEAR ?auto_25722 ) ( TRUCK-AT ?auto_25738 ?auto_25736 ) ( not ( = ?auto_25721 ?auto_25722 ) ) ( not ( = ?auto_25721 ?auto_25753 ) ) ( not ( = ?auto_25722 ?auto_25753 ) ) ( not ( = ?auto_25734 ?auto_25764 ) ) ( not ( = ?auto_25721 ?auto_25723 ) ) ( not ( = ?auto_25721 ?auto_25757 ) ) ( not ( = ?auto_25723 ?auto_25753 ) ) ( not ( = ?auto_25746 ?auto_25752 ) ) ( not ( = ?auto_25743 ?auto_25764 ) ) ( not ( = ?auto_25757 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25724 ) ) ( not ( = ?auto_25721 ?auto_25756 ) ) ( not ( = ?auto_25722 ?auto_25724 ) ) ( not ( = ?auto_25722 ?auto_25756 ) ) ( not ( = ?auto_25724 ?auto_25757 ) ) ( not ( = ?auto_25724 ?auto_25753 ) ) ( not ( = ?auto_25750 ?auto_25746 ) ) ( not ( = ?auto_25750 ?auto_25752 ) ) ( not ( = ?auto_25761 ?auto_25743 ) ) ( not ( = ?auto_25761 ?auto_25764 ) ) ( not ( = ?auto_25756 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25725 ) ) ( not ( = ?auto_25721 ?auto_25744 ) ) ( not ( = ?auto_25722 ?auto_25725 ) ) ( not ( = ?auto_25722 ?auto_25744 ) ) ( not ( = ?auto_25723 ?auto_25725 ) ) ( not ( = ?auto_25723 ?auto_25744 ) ) ( not ( = ?auto_25725 ?auto_25756 ) ) ( not ( = ?auto_25725 ?auto_25757 ) ) ( not ( = ?auto_25725 ?auto_25753 ) ) ( not ( = ?auto_25754 ?auto_25750 ) ) ( not ( = ?auto_25754 ?auto_25746 ) ) ( not ( = ?auto_25754 ?auto_25752 ) ) ( not ( = ?auto_25763 ?auto_25761 ) ) ( not ( = ?auto_25763 ?auto_25743 ) ) ( not ( = ?auto_25763 ?auto_25764 ) ) ( not ( = ?auto_25744 ?auto_25756 ) ) ( not ( = ?auto_25744 ?auto_25757 ) ) ( not ( = ?auto_25744 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25726 ) ) ( not ( = ?auto_25721 ?auto_25751 ) ) ( not ( = ?auto_25722 ?auto_25726 ) ) ( not ( = ?auto_25722 ?auto_25751 ) ) ( not ( = ?auto_25723 ?auto_25726 ) ) ( not ( = ?auto_25723 ?auto_25751 ) ) ( not ( = ?auto_25724 ?auto_25726 ) ) ( not ( = ?auto_25724 ?auto_25751 ) ) ( not ( = ?auto_25726 ?auto_25744 ) ) ( not ( = ?auto_25726 ?auto_25756 ) ) ( not ( = ?auto_25726 ?auto_25757 ) ) ( not ( = ?auto_25726 ?auto_25753 ) ) ( not ( = ?auto_25751 ?auto_25744 ) ) ( not ( = ?auto_25751 ?auto_25756 ) ) ( not ( = ?auto_25751 ?auto_25757 ) ) ( not ( = ?auto_25751 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25729 ) ) ( not ( = ?auto_25721 ?auto_25739 ) ) ( not ( = ?auto_25722 ?auto_25729 ) ) ( not ( = ?auto_25722 ?auto_25739 ) ) ( not ( = ?auto_25723 ?auto_25729 ) ) ( not ( = ?auto_25723 ?auto_25739 ) ) ( not ( = ?auto_25724 ?auto_25729 ) ) ( not ( = ?auto_25724 ?auto_25739 ) ) ( not ( = ?auto_25725 ?auto_25729 ) ) ( not ( = ?auto_25725 ?auto_25739 ) ) ( not ( = ?auto_25729 ?auto_25751 ) ) ( not ( = ?auto_25729 ?auto_25744 ) ) ( not ( = ?auto_25729 ?auto_25756 ) ) ( not ( = ?auto_25729 ?auto_25757 ) ) ( not ( = ?auto_25729 ?auto_25753 ) ) ( not ( = ?auto_25755 ?auto_25750 ) ) ( not ( = ?auto_25755 ?auto_25754 ) ) ( not ( = ?auto_25755 ?auto_25746 ) ) ( not ( = ?auto_25755 ?auto_25752 ) ) ( not ( = ?auto_25760 ?auto_25761 ) ) ( not ( = ?auto_25760 ?auto_25763 ) ) ( not ( = ?auto_25760 ?auto_25743 ) ) ( not ( = ?auto_25760 ?auto_25764 ) ) ( not ( = ?auto_25739 ?auto_25751 ) ) ( not ( = ?auto_25739 ?auto_25744 ) ) ( not ( = ?auto_25739 ?auto_25756 ) ) ( not ( = ?auto_25739 ?auto_25757 ) ) ( not ( = ?auto_25739 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25728 ) ) ( not ( = ?auto_25721 ?auto_25740 ) ) ( not ( = ?auto_25722 ?auto_25728 ) ) ( not ( = ?auto_25722 ?auto_25740 ) ) ( not ( = ?auto_25723 ?auto_25728 ) ) ( not ( = ?auto_25723 ?auto_25740 ) ) ( not ( = ?auto_25724 ?auto_25728 ) ) ( not ( = ?auto_25724 ?auto_25740 ) ) ( not ( = ?auto_25725 ?auto_25728 ) ) ( not ( = ?auto_25725 ?auto_25740 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25726 ?auto_25740 ) ) ( not ( = ?auto_25728 ?auto_25739 ) ) ( not ( = ?auto_25728 ?auto_25751 ) ) ( not ( = ?auto_25728 ?auto_25744 ) ) ( not ( = ?auto_25728 ?auto_25756 ) ) ( not ( = ?auto_25728 ?auto_25757 ) ) ( not ( = ?auto_25728 ?auto_25753 ) ) ( not ( = ?auto_25747 ?auto_25755 ) ) ( not ( = ?auto_25747 ?auto_25750 ) ) ( not ( = ?auto_25747 ?auto_25754 ) ) ( not ( = ?auto_25747 ?auto_25746 ) ) ( not ( = ?auto_25747 ?auto_25752 ) ) ( not ( = ?auto_25745 ?auto_25760 ) ) ( not ( = ?auto_25745 ?auto_25761 ) ) ( not ( = ?auto_25745 ?auto_25763 ) ) ( not ( = ?auto_25745 ?auto_25743 ) ) ( not ( = ?auto_25745 ?auto_25764 ) ) ( not ( = ?auto_25740 ?auto_25739 ) ) ( not ( = ?auto_25740 ?auto_25751 ) ) ( not ( = ?auto_25740 ?auto_25744 ) ) ( not ( = ?auto_25740 ?auto_25756 ) ) ( not ( = ?auto_25740 ?auto_25757 ) ) ( not ( = ?auto_25740 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25727 ) ) ( not ( = ?auto_25721 ?auto_25741 ) ) ( not ( = ?auto_25722 ?auto_25727 ) ) ( not ( = ?auto_25722 ?auto_25741 ) ) ( not ( = ?auto_25723 ?auto_25727 ) ) ( not ( = ?auto_25723 ?auto_25741 ) ) ( not ( = ?auto_25724 ?auto_25727 ) ) ( not ( = ?auto_25724 ?auto_25741 ) ) ( not ( = ?auto_25725 ?auto_25727 ) ) ( not ( = ?auto_25725 ?auto_25741 ) ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25741 ) ) ( not ( = ?auto_25729 ?auto_25727 ) ) ( not ( = ?auto_25729 ?auto_25741 ) ) ( not ( = ?auto_25727 ?auto_25740 ) ) ( not ( = ?auto_25727 ?auto_25739 ) ) ( not ( = ?auto_25727 ?auto_25751 ) ) ( not ( = ?auto_25727 ?auto_25744 ) ) ( not ( = ?auto_25727 ?auto_25756 ) ) ( not ( = ?auto_25727 ?auto_25757 ) ) ( not ( = ?auto_25727 ?auto_25753 ) ) ( not ( = ?auto_25759 ?auto_25747 ) ) ( not ( = ?auto_25759 ?auto_25755 ) ) ( not ( = ?auto_25759 ?auto_25750 ) ) ( not ( = ?auto_25759 ?auto_25754 ) ) ( not ( = ?auto_25759 ?auto_25746 ) ) ( not ( = ?auto_25759 ?auto_25752 ) ) ( not ( = ?auto_25758 ?auto_25745 ) ) ( not ( = ?auto_25758 ?auto_25760 ) ) ( not ( = ?auto_25758 ?auto_25761 ) ) ( not ( = ?auto_25758 ?auto_25763 ) ) ( not ( = ?auto_25758 ?auto_25743 ) ) ( not ( = ?auto_25758 ?auto_25764 ) ) ( not ( = ?auto_25741 ?auto_25740 ) ) ( not ( = ?auto_25741 ?auto_25739 ) ) ( not ( = ?auto_25741 ?auto_25751 ) ) ( not ( = ?auto_25741 ?auto_25744 ) ) ( not ( = ?auto_25741 ?auto_25756 ) ) ( not ( = ?auto_25741 ?auto_25757 ) ) ( not ( = ?auto_25741 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25730 ) ) ( not ( = ?auto_25721 ?auto_25762 ) ) ( not ( = ?auto_25722 ?auto_25730 ) ) ( not ( = ?auto_25722 ?auto_25762 ) ) ( not ( = ?auto_25723 ?auto_25730 ) ) ( not ( = ?auto_25723 ?auto_25762 ) ) ( not ( = ?auto_25724 ?auto_25730 ) ) ( not ( = ?auto_25724 ?auto_25762 ) ) ( not ( = ?auto_25725 ?auto_25730 ) ) ( not ( = ?auto_25725 ?auto_25762 ) ) ( not ( = ?auto_25726 ?auto_25730 ) ) ( not ( = ?auto_25726 ?auto_25762 ) ) ( not ( = ?auto_25729 ?auto_25730 ) ) ( not ( = ?auto_25729 ?auto_25762 ) ) ( not ( = ?auto_25728 ?auto_25730 ) ) ( not ( = ?auto_25728 ?auto_25762 ) ) ( not ( = ?auto_25730 ?auto_25741 ) ) ( not ( = ?auto_25730 ?auto_25740 ) ) ( not ( = ?auto_25730 ?auto_25739 ) ) ( not ( = ?auto_25730 ?auto_25751 ) ) ( not ( = ?auto_25730 ?auto_25744 ) ) ( not ( = ?auto_25730 ?auto_25756 ) ) ( not ( = ?auto_25730 ?auto_25757 ) ) ( not ( = ?auto_25730 ?auto_25753 ) ) ( not ( = ?auto_25749 ?auto_25759 ) ) ( not ( = ?auto_25749 ?auto_25747 ) ) ( not ( = ?auto_25749 ?auto_25755 ) ) ( not ( = ?auto_25749 ?auto_25750 ) ) ( not ( = ?auto_25749 ?auto_25754 ) ) ( not ( = ?auto_25749 ?auto_25746 ) ) ( not ( = ?auto_25749 ?auto_25752 ) ) ( not ( = ?auto_25765 ?auto_25758 ) ) ( not ( = ?auto_25765 ?auto_25745 ) ) ( not ( = ?auto_25765 ?auto_25760 ) ) ( not ( = ?auto_25765 ?auto_25761 ) ) ( not ( = ?auto_25765 ?auto_25763 ) ) ( not ( = ?auto_25765 ?auto_25743 ) ) ( not ( = ?auto_25765 ?auto_25764 ) ) ( not ( = ?auto_25762 ?auto_25741 ) ) ( not ( = ?auto_25762 ?auto_25740 ) ) ( not ( = ?auto_25762 ?auto_25739 ) ) ( not ( = ?auto_25762 ?auto_25751 ) ) ( not ( = ?auto_25762 ?auto_25744 ) ) ( not ( = ?auto_25762 ?auto_25756 ) ) ( not ( = ?auto_25762 ?auto_25757 ) ) ( not ( = ?auto_25762 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25732 ) ) ( not ( = ?auto_25721 ?auto_25742 ) ) ( not ( = ?auto_25722 ?auto_25732 ) ) ( not ( = ?auto_25722 ?auto_25742 ) ) ( not ( = ?auto_25723 ?auto_25732 ) ) ( not ( = ?auto_25723 ?auto_25742 ) ) ( not ( = ?auto_25724 ?auto_25732 ) ) ( not ( = ?auto_25724 ?auto_25742 ) ) ( not ( = ?auto_25725 ?auto_25732 ) ) ( not ( = ?auto_25725 ?auto_25742 ) ) ( not ( = ?auto_25726 ?auto_25732 ) ) ( not ( = ?auto_25726 ?auto_25742 ) ) ( not ( = ?auto_25729 ?auto_25732 ) ) ( not ( = ?auto_25729 ?auto_25742 ) ) ( not ( = ?auto_25728 ?auto_25732 ) ) ( not ( = ?auto_25728 ?auto_25742 ) ) ( not ( = ?auto_25727 ?auto_25732 ) ) ( not ( = ?auto_25727 ?auto_25742 ) ) ( not ( = ?auto_25732 ?auto_25762 ) ) ( not ( = ?auto_25732 ?auto_25741 ) ) ( not ( = ?auto_25732 ?auto_25740 ) ) ( not ( = ?auto_25732 ?auto_25739 ) ) ( not ( = ?auto_25732 ?auto_25751 ) ) ( not ( = ?auto_25732 ?auto_25744 ) ) ( not ( = ?auto_25732 ?auto_25756 ) ) ( not ( = ?auto_25732 ?auto_25757 ) ) ( not ( = ?auto_25732 ?auto_25753 ) ) ( not ( = ?auto_25748 ?auto_25749 ) ) ( not ( = ?auto_25748 ?auto_25759 ) ) ( not ( = ?auto_25748 ?auto_25747 ) ) ( not ( = ?auto_25748 ?auto_25755 ) ) ( not ( = ?auto_25748 ?auto_25750 ) ) ( not ( = ?auto_25748 ?auto_25754 ) ) ( not ( = ?auto_25748 ?auto_25746 ) ) ( not ( = ?auto_25748 ?auto_25752 ) ) ( not ( = ?auto_25766 ?auto_25765 ) ) ( not ( = ?auto_25766 ?auto_25758 ) ) ( not ( = ?auto_25766 ?auto_25745 ) ) ( not ( = ?auto_25766 ?auto_25760 ) ) ( not ( = ?auto_25766 ?auto_25761 ) ) ( not ( = ?auto_25766 ?auto_25763 ) ) ( not ( = ?auto_25766 ?auto_25743 ) ) ( not ( = ?auto_25766 ?auto_25764 ) ) ( not ( = ?auto_25742 ?auto_25762 ) ) ( not ( = ?auto_25742 ?auto_25741 ) ) ( not ( = ?auto_25742 ?auto_25740 ) ) ( not ( = ?auto_25742 ?auto_25739 ) ) ( not ( = ?auto_25742 ?auto_25751 ) ) ( not ( = ?auto_25742 ?auto_25744 ) ) ( not ( = ?auto_25742 ?auto_25756 ) ) ( not ( = ?auto_25742 ?auto_25757 ) ) ( not ( = ?auto_25742 ?auto_25753 ) ) ( not ( = ?auto_25721 ?auto_25731 ) ) ( not ( = ?auto_25721 ?auto_25737 ) ) ( not ( = ?auto_25722 ?auto_25731 ) ) ( not ( = ?auto_25722 ?auto_25737 ) ) ( not ( = ?auto_25723 ?auto_25731 ) ) ( not ( = ?auto_25723 ?auto_25737 ) ) ( not ( = ?auto_25724 ?auto_25731 ) ) ( not ( = ?auto_25724 ?auto_25737 ) ) ( not ( = ?auto_25725 ?auto_25731 ) ) ( not ( = ?auto_25725 ?auto_25737 ) ) ( not ( = ?auto_25726 ?auto_25731 ) ) ( not ( = ?auto_25726 ?auto_25737 ) ) ( not ( = ?auto_25729 ?auto_25731 ) ) ( not ( = ?auto_25729 ?auto_25737 ) ) ( not ( = ?auto_25728 ?auto_25731 ) ) ( not ( = ?auto_25728 ?auto_25737 ) ) ( not ( = ?auto_25727 ?auto_25731 ) ) ( not ( = ?auto_25727 ?auto_25737 ) ) ( not ( = ?auto_25730 ?auto_25731 ) ) ( not ( = ?auto_25730 ?auto_25737 ) ) ( not ( = ?auto_25731 ?auto_25742 ) ) ( not ( = ?auto_25731 ?auto_25762 ) ) ( not ( = ?auto_25731 ?auto_25741 ) ) ( not ( = ?auto_25731 ?auto_25740 ) ) ( not ( = ?auto_25731 ?auto_25739 ) ) ( not ( = ?auto_25731 ?auto_25751 ) ) ( not ( = ?auto_25731 ?auto_25744 ) ) ( not ( = ?auto_25731 ?auto_25756 ) ) ( not ( = ?auto_25731 ?auto_25757 ) ) ( not ( = ?auto_25731 ?auto_25753 ) ) ( not ( = ?auto_25735 ?auto_25748 ) ) ( not ( = ?auto_25735 ?auto_25749 ) ) ( not ( = ?auto_25735 ?auto_25759 ) ) ( not ( = ?auto_25735 ?auto_25747 ) ) ( not ( = ?auto_25735 ?auto_25755 ) ) ( not ( = ?auto_25735 ?auto_25750 ) ) ( not ( = ?auto_25735 ?auto_25754 ) ) ( not ( = ?auto_25735 ?auto_25746 ) ) ( not ( = ?auto_25735 ?auto_25752 ) ) ( not ( = ?auto_25733 ?auto_25766 ) ) ( not ( = ?auto_25733 ?auto_25765 ) ) ( not ( = ?auto_25733 ?auto_25758 ) ) ( not ( = ?auto_25733 ?auto_25745 ) ) ( not ( = ?auto_25733 ?auto_25760 ) ) ( not ( = ?auto_25733 ?auto_25761 ) ) ( not ( = ?auto_25733 ?auto_25763 ) ) ( not ( = ?auto_25733 ?auto_25743 ) ) ( not ( = ?auto_25733 ?auto_25764 ) ) ( not ( = ?auto_25737 ?auto_25742 ) ) ( not ( = ?auto_25737 ?auto_25762 ) ) ( not ( = ?auto_25737 ?auto_25741 ) ) ( not ( = ?auto_25737 ?auto_25740 ) ) ( not ( = ?auto_25737 ?auto_25739 ) ) ( not ( = ?auto_25737 ?auto_25751 ) ) ( not ( = ?auto_25737 ?auto_25744 ) ) ( not ( = ?auto_25737 ?auto_25756 ) ) ( not ( = ?auto_25737 ?auto_25757 ) ) ( not ( = ?auto_25737 ?auto_25753 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25729 ?auto_25728 ?auto_25727 ?auto_25730 ?auto_25732 )
      ( MAKE-1CRATE ?auto_25732 ?auto_25731 )
      ( MAKE-11CRATE-VERIFY ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25729 ?auto_25728 ?auto_25727 ?auto_25730 ?auto_25732 ?auto_25731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25769 - SURFACE
      ?auto_25770 - SURFACE
    )
    :vars
    (
      ?auto_25771 - HOIST
      ?auto_25772 - PLACE
      ?auto_25774 - PLACE
      ?auto_25775 - HOIST
      ?auto_25776 - SURFACE
      ?auto_25773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25771 ?auto_25772 ) ( SURFACE-AT ?auto_25769 ?auto_25772 ) ( CLEAR ?auto_25769 ) ( IS-CRATE ?auto_25770 ) ( AVAILABLE ?auto_25771 ) ( not ( = ?auto_25774 ?auto_25772 ) ) ( HOIST-AT ?auto_25775 ?auto_25774 ) ( AVAILABLE ?auto_25775 ) ( SURFACE-AT ?auto_25770 ?auto_25774 ) ( ON ?auto_25770 ?auto_25776 ) ( CLEAR ?auto_25770 ) ( TRUCK-AT ?auto_25773 ?auto_25772 ) ( not ( = ?auto_25769 ?auto_25770 ) ) ( not ( = ?auto_25769 ?auto_25776 ) ) ( not ( = ?auto_25770 ?auto_25776 ) ) ( not ( = ?auto_25771 ?auto_25775 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25773 ?auto_25772 ?auto_25774 )
      ( !LIFT ?auto_25775 ?auto_25770 ?auto_25776 ?auto_25774 )
      ( !LOAD ?auto_25775 ?auto_25770 ?auto_25773 ?auto_25774 )
      ( !DRIVE ?auto_25773 ?auto_25774 ?auto_25772 )
      ( !UNLOAD ?auto_25771 ?auto_25770 ?auto_25773 ?auto_25772 )
      ( !DROP ?auto_25771 ?auto_25770 ?auto_25769 ?auto_25772 )
      ( MAKE-1CRATE-VERIFY ?auto_25769 ?auto_25770 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_25790 - SURFACE
      ?auto_25791 - SURFACE
      ?auto_25792 - SURFACE
      ?auto_25793 - SURFACE
      ?auto_25794 - SURFACE
      ?auto_25795 - SURFACE
      ?auto_25798 - SURFACE
      ?auto_25797 - SURFACE
      ?auto_25796 - SURFACE
      ?auto_25799 - SURFACE
      ?auto_25801 - SURFACE
      ?auto_25800 - SURFACE
      ?auto_25802 - SURFACE
    )
    :vars
    (
      ?auto_25804 - HOIST
      ?auto_25808 - PLACE
      ?auto_25805 - PLACE
      ?auto_25803 - HOIST
      ?auto_25807 - SURFACE
      ?auto_25821 - PLACE
      ?auto_25826 - HOIST
      ?auto_25812 - SURFACE
      ?auto_25822 - PLACE
      ?auto_25820 - HOIST
      ?auto_25838 - SURFACE
      ?auto_25827 - PLACE
      ?auto_25829 - HOIST
      ?auto_25831 - SURFACE
      ?auto_25817 - PLACE
      ?auto_25810 - HOIST
      ?auto_25832 - SURFACE
      ?auto_25828 - PLACE
      ?auto_25835 - HOIST
      ?auto_25830 - SURFACE
      ?auto_25834 - PLACE
      ?auto_25811 - HOIST
      ?auto_25818 - SURFACE
      ?auto_25839 - PLACE
      ?auto_25819 - HOIST
      ?auto_25825 - SURFACE
      ?auto_25813 - PLACE
      ?auto_25833 - HOIST
      ?auto_25809 - SURFACE
      ?auto_25836 - SURFACE
      ?auto_25824 - PLACE
      ?auto_25814 - HOIST
      ?auto_25837 - SURFACE
      ?auto_25815 - PLACE
      ?auto_25823 - HOIST
      ?auto_25816 - SURFACE
      ?auto_25806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25804 ?auto_25808 ) ( IS-CRATE ?auto_25802 ) ( not ( = ?auto_25805 ?auto_25808 ) ) ( HOIST-AT ?auto_25803 ?auto_25805 ) ( AVAILABLE ?auto_25803 ) ( SURFACE-AT ?auto_25802 ?auto_25805 ) ( ON ?auto_25802 ?auto_25807 ) ( CLEAR ?auto_25802 ) ( not ( = ?auto_25800 ?auto_25802 ) ) ( not ( = ?auto_25800 ?auto_25807 ) ) ( not ( = ?auto_25802 ?auto_25807 ) ) ( not ( = ?auto_25804 ?auto_25803 ) ) ( IS-CRATE ?auto_25800 ) ( not ( = ?auto_25821 ?auto_25808 ) ) ( HOIST-AT ?auto_25826 ?auto_25821 ) ( AVAILABLE ?auto_25826 ) ( SURFACE-AT ?auto_25800 ?auto_25821 ) ( ON ?auto_25800 ?auto_25812 ) ( CLEAR ?auto_25800 ) ( not ( = ?auto_25801 ?auto_25800 ) ) ( not ( = ?auto_25801 ?auto_25812 ) ) ( not ( = ?auto_25800 ?auto_25812 ) ) ( not ( = ?auto_25804 ?auto_25826 ) ) ( IS-CRATE ?auto_25801 ) ( not ( = ?auto_25822 ?auto_25808 ) ) ( HOIST-AT ?auto_25820 ?auto_25822 ) ( AVAILABLE ?auto_25820 ) ( SURFACE-AT ?auto_25801 ?auto_25822 ) ( ON ?auto_25801 ?auto_25838 ) ( CLEAR ?auto_25801 ) ( not ( = ?auto_25799 ?auto_25801 ) ) ( not ( = ?auto_25799 ?auto_25838 ) ) ( not ( = ?auto_25801 ?auto_25838 ) ) ( not ( = ?auto_25804 ?auto_25820 ) ) ( IS-CRATE ?auto_25799 ) ( not ( = ?auto_25827 ?auto_25808 ) ) ( HOIST-AT ?auto_25829 ?auto_25827 ) ( AVAILABLE ?auto_25829 ) ( SURFACE-AT ?auto_25799 ?auto_25827 ) ( ON ?auto_25799 ?auto_25831 ) ( CLEAR ?auto_25799 ) ( not ( = ?auto_25796 ?auto_25799 ) ) ( not ( = ?auto_25796 ?auto_25831 ) ) ( not ( = ?auto_25799 ?auto_25831 ) ) ( not ( = ?auto_25804 ?auto_25829 ) ) ( IS-CRATE ?auto_25796 ) ( not ( = ?auto_25817 ?auto_25808 ) ) ( HOIST-AT ?auto_25810 ?auto_25817 ) ( AVAILABLE ?auto_25810 ) ( SURFACE-AT ?auto_25796 ?auto_25817 ) ( ON ?auto_25796 ?auto_25832 ) ( CLEAR ?auto_25796 ) ( not ( = ?auto_25797 ?auto_25796 ) ) ( not ( = ?auto_25797 ?auto_25832 ) ) ( not ( = ?auto_25796 ?auto_25832 ) ) ( not ( = ?auto_25804 ?auto_25810 ) ) ( IS-CRATE ?auto_25797 ) ( not ( = ?auto_25828 ?auto_25808 ) ) ( HOIST-AT ?auto_25835 ?auto_25828 ) ( AVAILABLE ?auto_25835 ) ( SURFACE-AT ?auto_25797 ?auto_25828 ) ( ON ?auto_25797 ?auto_25830 ) ( CLEAR ?auto_25797 ) ( not ( = ?auto_25798 ?auto_25797 ) ) ( not ( = ?auto_25798 ?auto_25830 ) ) ( not ( = ?auto_25797 ?auto_25830 ) ) ( not ( = ?auto_25804 ?auto_25835 ) ) ( IS-CRATE ?auto_25798 ) ( not ( = ?auto_25834 ?auto_25808 ) ) ( HOIST-AT ?auto_25811 ?auto_25834 ) ( AVAILABLE ?auto_25811 ) ( SURFACE-AT ?auto_25798 ?auto_25834 ) ( ON ?auto_25798 ?auto_25818 ) ( CLEAR ?auto_25798 ) ( not ( = ?auto_25795 ?auto_25798 ) ) ( not ( = ?auto_25795 ?auto_25818 ) ) ( not ( = ?auto_25798 ?auto_25818 ) ) ( not ( = ?auto_25804 ?auto_25811 ) ) ( IS-CRATE ?auto_25795 ) ( not ( = ?auto_25839 ?auto_25808 ) ) ( HOIST-AT ?auto_25819 ?auto_25839 ) ( SURFACE-AT ?auto_25795 ?auto_25839 ) ( ON ?auto_25795 ?auto_25825 ) ( CLEAR ?auto_25795 ) ( not ( = ?auto_25794 ?auto_25795 ) ) ( not ( = ?auto_25794 ?auto_25825 ) ) ( not ( = ?auto_25795 ?auto_25825 ) ) ( not ( = ?auto_25804 ?auto_25819 ) ) ( IS-CRATE ?auto_25794 ) ( not ( = ?auto_25813 ?auto_25808 ) ) ( HOIST-AT ?auto_25833 ?auto_25813 ) ( AVAILABLE ?auto_25833 ) ( SURFACE-AT ?auto_25794 ?auto_25813 ) ( ON ?auto_25794 ?auto_25809 ) ( CLEAR ?auto_25794 ) ( not ( = ?auto_25793 ?auto_25794 ) ) ( not ( = ?auto_25793 ?auto_25809 ) ) ( not ( = ?auto_25794 ?auto_25809 ) ) ( not ( = ?auto_25804 ?auto_25833 ) ) ( IS-CRATE ?auto_25793 ) ( AVAILABLE ?auto_25819 ) ( SURFACE-AT ?auto_25793 ?auto_25839 ) ( ON ?auto_25793 ?auto_25836 ) ( CLEAR ?auto_25793 ) ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25836 ) ) ( not ( = ?auto_25793 ?auto_25836 ) ) ( IS-CRATE ?auto_25792 ) ( not ( = ?auto_25824 ?auto_25808 ) ) ( HOIST-AT ?auto_25814 ?auto_25824 ) ( AVAILABLE ?auto_25814 ) ( SURFACE-AT ?auto_25792 ?auto_25824 ) ( ON ?auto_25792 ?auto_25837 ) ( CLEAR ?auto_25792 ) ( not ( = ?auto_25791 ?auto_25792 ) ) ( not ( = ?auto_25791 ?auto_25837 ) ) ( not ( = ?auto_25792 ?auto_25837 ) ) ( not ( = ?auto_25804 ?auto_25814 ) ) ( SURFACE-AT ?auto_25790 ?auto_25808 ) ( CLEAR ?auto_25790 ) ( IS-CRATE ?auto_25791 ) ( AVAILABLE ?auto_25804 ) ( not ( = ?auto_25815 ?auto_25808 ) ) ( HOIST-AT ?auto_25823 ?auto_25815 ) ( AVAILABLE ?auto_25823 ) ( SURFACE-AT ?auto_25791 ?auto_25815 ) ( ON ?auto_25791 ?auto_25816 ) ( CLEAR ?auto_25791 ) ( TRUCK-AT ?auto_25806 ?auto_25808 ) ( not ( = ?auto_25790 ?auto_25791 ) ) ( not ( = ?auto_25790 ?auto_25816 ) ) ( not ( = ?auto_25791 ?auto_25816 ) ) ( not ( = ?auto_25804 ?auto_25823 ) ) ( not ( = ?auto_25790 ?auto_25792 ) ) ( not ( = ?auto_25790 ?auto_25837 ) ) ( not ( = ?auto_25792 ?auto_25816 ) ) ( not ( = ?auto_25824 ?auto_25815 ) ) ( not ( = ?auto_25814 ?auto_25823 ) ) ( not ( = ?auto_25837 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25793 ) ) ( not ( = ?auto_25790 ?auto_25836 ) ) ( not ( = ?auto_25791 ?auto_25793 ) ) ( not ( = ?auto_25791 ?auto_25836 ) ) ( not ( = ?auto_25793 ?auto_25837 ) ) ( not ( = ?auto_25793 ?auto_25816 ) ) ( not ( = ?auto_25839 ?auto_25824 ) ) ( not ( = ?auto_25839 ?auto_25815 ) ) ( not ( = ?auto_25819 ?auto_25814 ) ) ( not ( = ?auto_25819 ?auto_25823 ) ) ( not ( = ?auto_25836 ?auto_25837 ) ) ( not ( = ?auto_25836 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25794 ) ) ( not ( = ?auto_25790 ?auto_25809 ) ) ( not ( = ?auto_25791 ?auto_25794 ) ) ( not ( = ?auto_25791 ?auto_25809 ) ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25792 ?auto_25809 ) ) ( not ( = ?auto_25794 ?auto_25836 ) ) ( not ( = ?auto_25794 ?auto_25837 ) ) ( not ( = ?auto_25794 ?auto_25816 ) ) ( not ( = ?auto_25813 ?auto_25839 ) ) ( not ( = ?auto_25813 ?auto_25824 ) ) ( not ( = ?auto_25813 ?auto_25815 ) ) ( not ( = ?auto_25833 ?auto_25819 ) ) ( not ( = ?auto_25833 ?auto_25814 ) ) ( not ( = ?auto_25833 ?auto_25823 ) ) ( not ( = ?auto_25809 ?auto_25836 ) ) ( not ( = ?auto_25809 ?auto_25837 ) ) ( not ( = ?auto_25809 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25795 ) ) ( not ( = ?auto_25790 ?auto_25825 ) ) ( not ( = ?auto_25791 ?auto_25795 ) ) ( not ( = ?auto_25791 ?auto_25825 ) ) ( not ( = ?auto_25792 ?auto_25795 ) ) ( not ( = ?auto_25792 ?auto_25825 ) ) ( not ( = ?auto_25793 ?auto_25795 ) ) ( not ( = ?auto_25793 ?auto_25825 ) ) ( not ( = ?auto_25795 ?auto_25809 ) ) ( not ( = ?auto_25795 ?auto_25836 ) ) ( not ( = ?auto_25795 ?auto_25837 ) ) ( not ( = ?auto_25795 ?auto_25816 ) ) ( not ( = ?auto_25825 ?auto_25809 ) ) ( not ( = ?auto_25825 ?auto_25836 ) ) ( not ( = ?auto_25825 ?auto_25837 ) ) ( not ( = ?auto_25825 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25798 ) ) ( not ( = ?auto_25790 ?auto_25818 ) ) ( not ( = ?auto_25791 ?auto_25798 ) ) ( not ( = ?auto_25791 ?auto_25818 ) ) ( not ( = ?auto_25792 ?auto_25798 ) ) ( not ( = ?auto_25792 ?auto_25818 ) ) ( not ( = ?auto_25793 ?auto_25798 ) ) ( not ( = ?auto_25793 ?auto_25818 ) ) ( not ( = ?auto_25794 ?auto_25798 ) ) ( not ( = ?auto_25794 ?auto_25818 ) ) ( not ( = ?auto_25798 ?auto_25825 ) ) ( not ( = ?auto_25798 ?auto_25809 ) ) ( not ( = ?auto_25798 ?auto_25836 ) ) ( not ( = ?auto_25798 ?auto_25837 ) ) ( not ( = ?auto_25798 ?auto_25816 ) ) ( not ( = ?auto_25834 ?auto_25839 ) ) ( not ( = ?auto_25834 ?auto_25813 ) ) ( not ( = ?auto_25834 ?auto_25824 ) ) ( not ( = ?auto_25834 ?auto_25815 ) ) ( not ( = ?auto_25811 ?auto_25819 ) ) ( not ( = ?auto_25811 ?auto_25833 ) ) ( not ( = ?auto_25811 ?auto_25814 ) ) ( not ( = ?auto_25811 ?auto_25823 ) ) ( not ( = ?auto_25818 ?auto_25825 ) ) ( not ( = ?auto_25818 ?auto_25809 ) ) ( not ( = ?auto_25818 ?auto_25836 ) ) ( not ( = ?auto_25818 ?auto_25837 ) ) ( not ( = ?auto_25818 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25797 ) ) ( not ( = ?auto_25790 ?auto_25830 ) ) ( not ( = ?auto_25791 ?auto_25797 ) ) ( not ( = ?auto_25791 ?auto_25830 ) ) ( not ( = ?auto_25792 ?auto_25797 ) ) ( not ( = ?auto_25792 ?auto_25830 ) ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25793 ?auto_25830 ) ) ( not ( = ?auto_25794 ?auto_25797 ) ) ( not ( = ?auto_25794 ?auto_25830 ) ) ( not ( = ?auto_25795 ?auto_25797 ) ) ( not ( = ?auto_25795 ?auto_25830 ) ) ( not ( = ?auto_25797 ?auto_25818 ) ) ( not ( = ?auto_25797 ?auto_25825 ) ) ( not ( = ?auto_25797 ?auto_25809 ) ) ( not ( = ?auto_25797 ?auto_25836 ) ) ( not ( = ?auto_25797 ?auto_25837 ) ) ( not ( = ?auto_25797 ?auto_25816 ) ) ( not ( = ?auto_25828 ?auto_25834 ) ) ( not ( = ?auto_25828 ?auto_25839 ) ) ( not ( = ?auto_25828 ?auto_25813 ) ) ( not ( = ?auto_25828 ?auto_25824 ) ) ( not ( = ?auto_25828 ?auto_25815 ) ) ( not ( = ?auto_25835 ?auto_25811 ) ) ( not ( = ?auto_25835 ?auto_25819 ) ) ( not ( = ?auto_25835 ?auto_25833 ) ) ( not ( = ?auto_25835 ?auto_25814 ) ) ( not ( = ?auto_25835 ?auto_25823 ) ) ( not ( = ?auto_25830 ?auto_25818 ) ) ( not ( = ?auto_25830 ?auto_25825 ) ) ( not ( = ?auto_25830 ?auto_25809 ) ) ( not ( = ?auto_25830 ?auto_25836 ) ) ( not ( = ?auto_25830 ?auto_25837 ) ) ( not ( = ?auto_25830 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25796 ) ) ( not ( = ?auto_25790 ?auto_25832 ) ) ( not ( = ?auto_25791 ?auto_25796 ) ) ( not ( = ?auto_25791 ?auto_25832 ) ) ( not ( = ?auto_25792 ?auto_25796 ) ) ( not ( = ?auto_25792 ?auto_25832 ) ) ( not ( = ?auto_25793 ?auto_25796 ) ) ( not ( = ?auto_25793 ?auto_25832 ) ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( not ( = ?auto_25794 ?auto_25832 ) ) ( not ( = ?auto_25795 ?auto_25796 ) ) ( not ( = ?auto_25795 ?auto_25832 ) ) ( not ( = ?auto_25798 ?auto_25796 ) ) ( not ( = ?auto_25798 ?auto_25832 ) ) ( not ( = ?auto_25796 ?auto_25830 ) ) ( not ( = ?auto_25796 ?auto_25818 ) ) ( not ( = ?auto_25796 ?auto_25825 ) ) ( not ( = ?auto_25796 ?auto_25809 ) ) ( not ( = ?auto_25796 ?auto_25836 ) ) ( not ( = ?auto_25796 ?auto_25837 ) ) ( not ( = ?auto_25796 ?auto_25816 ) ) ( not ( = ?auto_25817 ?auto_25828 ) ) ( not ( = ?auto_25817 ?auto_25834 ) ) ( not ( = ?auto_25817 ?auto_25839 ) ) ( not ( = ?auto_25817 ?auto_25813 ) ) ( not ( = ?auto_25817 ?auto_25824 ) ) ( not ( = ?auto_25817 ?auto_25815 ) ) ( not ( = ?auto_25810 ?auto_25835 ) ) ( not ( = ?auto_25810 ?auto_25811 ) ) ( not ( = ?auto_25810 ?auto_25819 ) ) ( not ( = ?auto_25810 ?auto_25833 ) ) ( not ( = ?auto_25810 ?auto_25814 ) ) ( not ( = ?auto_25810 ?auto_25823 ) ) ( not ( = ?auto_25832 ?auto_25830 ) ) ( not ( = ?auto_25832 ?auto_25818 ) ) ( not ( = ?auto_25832 ?auto_25825 ) ) ( not ( = ?auto_25832 ?auto_25809 ) ) ( not ( = ?auto_25832 ?auto_25836 ) ) ( not ( = ?auto_25832 ?auto_25837 ) ) ( not ( = ?auto_25832 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25799 ) ) ( not ( = ?auto_25790 ?auto_25831 ) ) ( not ( = ?auto_25791 ?auto_25799 ) ) ( not ( = ?auto_25791 ?auto_25831 ) ) ( not ( = ?auto_25792 ?auto_25799 ) ) ( not ( = ?auto_25792 ?auto_25831 ) ) ( not ( = ?auto_25793 ?auto_25799 ) ) ( not ( = ?auto_25793 ?auto_25831 ) ) ( not ( = ?auto_25794 ?auto_25799 ) ) ( not ( = ?auto_25794 ?auto_25831 ) ) ( not ( = ?auto_25795 ?auto_25799 ) ) ( not ( = ?auto_25795 ?auto_25831 ) ) ( not ( = ?auto_25798 ?auto_25799 ) ) ( not ( = ?auto_25798 ?auto_25831 ) ) ( not ( = ?auto_25797 ?auto_25799 ) ) ( not ( = ?auto_25797 ?auto_25831 ) ) ( not ( = ?auto_25799 ?auto_25832 ) ) ( not ( = ?auto_25799 ?auto_25830 ) ) ( not ( = ?auto_25799 ?auto_25818 ) ) ( not ( = ?auto_25799 ?auto_25825 ) ) ( not ( = ?auto_25799 ?auto_25809 ) ) ( not ( = ?auto_25799 ?auto_25836 ) ) ( not ( = ?auto_25799 ?auto_25837 ) ) ( not ( = ?auto_25799 ?auto_25816 ) ) ( not ( = ?auto_25827 ?auto_25817 ) ) ( not ( = ?auto_25827 ?auto_25828 ) ) ( not ( = ?auto_25827 ?auto_25834 ) ) ( not ( = ?auto_25827 ?auto_25839 ) ) ( not ( = ?auto_25827 ?auto_25813 ) ) ( not ( = ?auto_25827 ?auto_25824 ) ) ( not ( = ?auto_25827 ?auto_25815 ) ) ( not ( = ?auto_25829 ?auto_25810 ) ) ( not ( = ?auto_25829 ?auto_25835 ) ) ( not ( = ?auto_25829 ?auto_25811 ) ) ( not ( = ?auto_25829 ?auto_25819 ) ) ( not ( = ?auto_25829 ?auto_25833 ) ) ( not ( = ?auto_25829 ?auto_25814 ) ) ( not ( = ?auto_25829 ?auto_25823 ) ) ( not ( = ?auto_25831 ?auto_25832 ) ) ( not ( = ?auto_25831 ?auto_25830 ) ) ( not ( = ?auto_25831 ?auto_25818 ) ) ( not ( = ?auto_25831 ?auto_25825 ) ) ( not ( = ?auto_25831 ?auto_25809 ) ) ( not ( = ?auto_25831 ?auto_25836 ) ) ( not ( = ?auto_25831 ?auto_25837 ) ) ( not ( = ?auto_25831 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25801 ) ) ( not ( = ?auto_25790 ?auto_25838 ) ) ( not ( = ?auto_25791 ?auto_25801 ) ) ( not ( = ?auto_25791 ?auto_25838 ) ) ( not ( = ?auto_25792 ?auto_25801 ) ) ( not ( = ?auto_25792 ?auto_25838 ) ) ( not ( = ?auto_25793 ?auto_25801 ) ) ( not ( = ?auto_25793 ?auto_25838 ) ) ( not ( = ?auto_25794 ?auto_25801 ) ) ( not ( = ?auto_25794 ?auto_25838 ) ) ( not ( = ?auto_25795 ?auto_25801 ) ) ( not ( = ?auto_25795 ?auto_25838 ) ) ( not ( = ?auto_25798 ?auto_25801 ) ) ( not ( = ?auto_25798 ?auto_25838 ) ) ( not ( = ?auto_25797 ?auto_25801 ) ) ( not ( = ?auto_25797 ?auto_25838 ) ) ( not ( = ?auto_25796 ?auto_25801 ) ) ( not ( = ?auto_25796 ?auto_25838 ) ) ( not ( = ?auto_25801 ?auto_25831 ) ) ( not ( = ?auto_25801 ?auto_25832 ) ) ( not ( = ?auto_25801 ?auto_25830 ) ) ( not ( = ?auto_25801 ?auto_25818 ) ) ( not ( = ?auto_25801 ?auto_25825 ) ) ( not ( = ?auto_25801 ?auto_25809 ) ) ( not ( = ?auto_25801 ?auto_25836 ) ) ( not ( = ?auto_25801 ?auto_25837 ) ) ( not ( = ?auto_25801 ?auto_25816 ) ) ( not ( = ?auto_25822 ?auto_25827 ) ) ( not ( = ?auto_25822 ?auto_25817 ) ) ( not ( = ?auto_25822 ?auto_25828 ) ) ( not ( = ?auto_25822 ?auto_25834 ) ) ( not ( = ?auto_25822 ?auto_25839 ) ) ( not ( = ?auto_25822 ?auto_25813 ) ) ( not ( = ?auto_25822 ?auto_25824 ) ) ( not ( = ?auto_25822 ?auto_25815 ) ) ( not ( = ?auto_25820 ?auto_25829 ) ) ( not ( = ?auto_25820 ?auto_25810 ) ) ( not ( = ?auto_25820 ?auto_25835 ) ) ( not ( = ?auto_25820 ?auto_25811 ) ) ( not ( = ?auto_25820 ?auto_25819 ) ) ( not ( = ?auto_25820 ?auto_25833 ) ) ( not ( = ?auto_25820 ?auto_25814 ) ) ( not ( = ?auto_25820 ?auto_25823 ) ) ( not ( = ?auto_25838 ?auto_25831 ) ) ( not ( = ?auto_25838 ?auto_25832 ) ) ( not ( = ?auto_25838 ?auto_25830 ) ) ( not ( = ?auto_25838 ?auto_25818 ) ) ( not ( = ?auto_25838 ?auto_25825 ) ) ( not ( = ?auto_25838 ?auto_25809 ) ) ( not ( = ?auto_25838 ?auto_25836 ) ) ( not ( = ?auto_25838 ?auto_25837 ) ) ( not ( = ?auto_25838 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25800 ) ) ( not ( = ?auto_25790 ?auto_25812 ) ) ( not ( = ?auto_25791 ?auto_25800 ) ) ( not ( = ?auto_25791 ?auto_25812 ) ) ( not ( = ?auto_25792 ?auto_25800 ) ) ( not ( = ?auto_25792 ?auto_25812 ) ) ( not ( = ?auto_25793 ?auto_25800 ) ) ( not ( = ?auto_25793 ?auto_25812 ) ) ( not ( = ?auto_25794 ?auto_25800 ) ) ( not ( = ?auto_25794 ?auto_25812 ) ) ( not ( = ?auto_25795 ?auto_25800 ) ) ( not ( = ?auto_25795 ?auto_25812 ) ) ( not ( = ?auto_25798 ?auto_25800 ) ) ( not ( = ?auto_25798 ?auto_25812 ) ) ( not ( = ?auto_25797 ?auto_25800 ) ) ( not ( = ?auto_25797 ?auto_25812 ) ) ( not ( = ?auto_25796 ?auto_25800 ) ) ( not ( = ?auto_25796 ?auto_25812 ) ) ( not ( = ?auto_25799 ?auto_25800 ) ) ( not ( = ?auto_25799 ?auto_25812 ) ) ( not ( = ?auto_25800 ?auto_25838 ) ) ( not ( = ?auto_25800 ?auto_25831 ) ) ( not ( = ?auto_25800 ?auto_25832 ) ) ( not ( = ?auto_25800 ?auto_25830 ) ) ( not ( = ?auto_25800 ?auto_25818 ) ) ( not ( = ?auto_25800 ?auto_25825 ) ) ( not ( = ?auto_25800 ?auto_25809 ) ) ( not ( = ?auto_25800 ?auto_25836 ) ) ( not ( = ?auto_25800 ?auto_25837 ) ) ( not ( = ?auto_25800 ?auto_25816 ) ) ( not ( = ?auto_25821 ?auto_25822 ) ) ( not ( = ?auto_25821 ?auto_25827 ) ) ( not ( = ?auto_25821 ?auto_25817 ) ) ( not ( = ?auto_25821 ?auto_25828 ) ) ( not ( = ?auto_25821 ?auto_25834 ) ) ( not ( = ?auto_25821 ?auto_25839 ) ) ( not ( = ?auto_25821 ?auto_25813 ) ) ( not ( = ?auto_25821 ?auto_25824 ) ) ( not ( = ?auto_25821 ?auto_25815 ) ) ( not ( = ?auto_25826 ?auto_25820 ) ) ( not ( = ?auto_25826 ?auto_25829 ) ) ( not ( = ?auto_25826 ?auto_25810 ) ) ( not ( = ?auto_25826 ?auto_25835 ) ) ( not ( = ?auto_25826 ?auto_25811 ) ) ( not ( = ?auto_25826 ?auto_25819 ) ) ( not ( = ?auto_25826 ?auto_25833 ) ) ( not ( = ?auto_25826 ?auto_25814 ) ) ( not ( = ?auto_25826 ?auto_25823 ) ) ( not ( = ?auto_25812 ?auto_25838 ) ) ( not ( = ?auto_25812 ?auto_25831 ) ) ( not ( = ?auto_25812 ?auto_25832 ) ) ( not ( = ?auto_25812 ?auto_25830 ) ) ( not ( = ?auto_25812 ?auto_25818 ) ) ( not ( = ?auto_25812 ?auto_25825 ) ) ( not ( = ?auto_25812 ?auto_25809 ) ) ( not ( = ?auto_25812 ?auto_25836 ) ) ( not ( = ?auto_25812 ?auto_25837 ) ) ( not ( = ?auto_25812 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25802 ) ) ( not ( = ?auto_25790 ?auto_25807 ) ) ( not ( = ?auto_25791 ?auto_25802 ) ) ( not ( = ?auto_25791 ?auto_25807 ) ) ( not ( = ?auto_25792 ?auto_25802 ) ) ( not ( = ?auto_25792 ?auto_25807 ) ) ( not ( = ?auto_25793 ?auto_25802 ) ) ( not ( = ?auto_25793 ?auto_25807 ) ) ( not ( = ?auto_25794 ?auto_25802 ) ) ( not ( = ?auto_25794 ?auto_25807 ) ) ( not ( = ?auto_25795 ?auto_25802 ) ) ( not ( = ?auto_25795 ?auto_25807 ) ) ( not ( = ?auto_25798 ?auto_25802 ) ) ( not ( = ?auto_25798 ?auto_25807 ) ) ( not ( = ?auto_25797 ?auto_25802 ) ) ( not ( = ?auto_25797 ?auto_25807 ) ) ( not ( = ?auto_25796 ?auto_25802 ) ) ( not ( = ?auto_25796 ?auto_25807 ) ) ( not ( = ?auto_25799 ?auto_25802 ) ) ( not ( = ?auto_25799 ?auto_25807 ) ) ( not ( = ?auto_25801 ?auto_25802 ) ) ( not ( = ?auto_25801 ?auto_25807 ) ) ( not ( = ?auto_25802 ?auto_25812 ) ) ( not ( = ?auto_25802 ?auto_25838 ) ) ( not ( = ?auto_25802 ?auto_25831 ) ) ( not ( = ?auto_25802 ?auto_25832 ) ) ( not ( = ?auto_25802 ?auto_25830 ) ) ( not ( = ?auto_25802 ?auto_25818 ) ) ( not ( = ?auto_25802 ?auto_25825 ) ) ( not ( = ?auto_25802 ?auto_25809 ) ) ( not ( = ?auto_25802 ?auto_25836 ) ) ( not ( = ?auto_25802 ?auto_25837 ) ) ( not ( = ?auto_25802 ?auto_25816 ) ) ( not ( = ?auto_25805 ?auto_25821 ) ) ( not ( = ?auto_25805 ?auto_25822 ) ) ( not ( = ?auto_25805 ?auto_25827 ) ) ( not ( = ?auto_25805 ?auto_25817 ) ) ( not ( = ?auto_25805 ?auto_25828 ) ) ( not ( = ?auto_25805 ?auto_25834 ) ) ( not ( = ?auto_25805 ?auto_25839 ) ) ( not ( = ?auto_25805 ?auto_25813 ) ) ( not ( = ?auto_25805 ?auto_25824 ) ) ( not ( = ?auto_25805 ?auto_25815 ) ) ( not ( = ?auto_25803 ?auto_25826 ) ) ( not ( = ?auto_25803 ?auto_25820 ) ) ( not ( = ?auto_25803 ?auto_25829 ) ) ( not ( = ?auto_25803 ?auto_25810 ) ) ( not ( = ?auto_25803 ?auto_25835 ) ) ( not ( = ?auto_25803 ?auto_25811 ) ) ( not ( = ?auto_25803 ?auto_25819 ) ) ( not ( = ?auto_25803 ?auto_25833 ) ) ( not ( = ?auto_25803 ?auto_25814 ) ) ( not ( = ?auto_25803 ?auto_25823 ) ) ( not ( = ?auto_25807 ?auto_25812 ) ) ( not ( = ?auto_25807 ?auto_25838 ) ) ( not ( = ?auto_25807 ?auto_25831 ) ) ( not ( = ?auto_25807 ?auto_25832 ) ) ( not ( = ?auto_25807 ?auto_25830 ) ) ( not ( = ?auto_25807 ?auto_25818 ) ) ( not ( = ?auto_25807 ?auto_25825 ) ) ( not ( = ?auto_25807 ?auto_25809 ) ) ( not ( = ?auto_25807 ?auto_25836 ) ) ( not ( = ?auto_25807 ?auto_25837 ) ) ( not ( = ?auto_25807 ?auto_25816 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25798 ?auto_25797 ?auto_25796 ?auto_25799 ?auto_25801 ?auto_25800 )
      ( MAKE-1CRATE ?auto_25800 ?auto_25802 )
      ( MAKE-12CRATE-VERIFY ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25798 ?auto_25797 ?auto_25796 ?auto_25799 ?auto_25801 ?auto_25800 ?auto_25802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25842 - SURFACE
      ?auto_25843 - SURFACE
    )
    :vars
    (
      ?auto_25844 - HOIST
      ?auto_25845 - PLACE
      ?auto_25847 - PLACE
      ?auto_25848 - HOIST
      ?auto_25849 - SURFACE
      ?auto_25846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25844 ?auto_25845 ) ( SURFACE-AT ?auto_25842 ?auto_25845 ) ( CLEAR ?auto_25842 ) ( IS-CRATE ?auto_25843 ) ( AVAILABLE ?auto_25844 ) ( not ( = ?auto_25847 ?auto_25845 ) ) ( HOIST-AT ?auto_25848 ?auto_25847 ) ( AVAILABLE ?auto_25848 ) ( SURFACE-AT ?auto_25843 ?auto_25847 ) ( ON ?auto_25843 ?auto_25849 ) ( CLEAR ?auto_25843 ) ( TRUCK-AT ?auto_25846 ?auto_25845 ) ( not ( = ?auto_25842 ?auto_25843 ) ) ( not ( = ?auto_25842 ?auto_25849 ) ) ( not ( = ?auto_25843 ?auto_25849 ) ) ( not ( = ?auto_25844 ?auto_25848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25846 ?auto_25845 ?auto_25847 )
      ( !LIFT ?auto_25848 ?auto_25843 ?auto_25849 ?auto_25847 )
      ( !LOAD ?auto_25848 ?auto_25843 ?auto_25846 ?auto_25847 )
      ( !DRIVE ?auto_25846 ?auto_25847 ?auto_25845 )
      ( !UNLOAD ?auto_25844 ?auto_25843 ?auto_25846 ?auto_25845 )
      ( !DROP ?auto_25844 ?auto_25843 ?auto_25842 ?auto_25845 )
      ( MAKE-1CRATE-VERIFY ?auto_25842 ?auto_25843 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_25864 - SURFACE
      ?auto_25865 - SURFACE
      ?auto_25866 - SURFACE
      ?auto_25867 - SURFACE
      ?auto_25868 - SURFACE
      ?auto_25869 - SURFACE
      ?auto_25872 - SURFACE
      ?auto_25871 - SURFACE
      ?auto_25870 - SURFACE
      ?auto_25873 - SURFACE
      ?auto_25875 - SURFACE
      ?auto_25874 - SURFACE
      ?auto_25876 - SURFACE
      ?auto_25877 - SURFACE
    )
    :vars
    (
      ?auto_25881 - HOIST
      ?auto_25879 - PLACE
      ?auto_25882 - PLACE
      ?auto_25883 - HOIST
      ?auto_25880 - SURFACE
      ?auto_25886 - PLACE
      ?auto_25905 - HOIST
      ?auto_25895 - SURFACE
      ?auto_25910 - PLACE
      ?auto_25894 - HOIST
      ?auto_25906 - SURFACE
      ?auto_25904 - PLACE
      ?auto_25884 - HOIST
      ?auto_25911 - SURFACE
      ?auto_25885 - PLACE
      ?auto_25888 - HOIST
      ?auto_25900 - SURFACE
      ?auto_25889 - PLACE
      ?auto_25891 - HOIST
      ?auto_25903 - SURFACE
      ?auto_25901 - PLACE
      ?auto_25902 - HOIST
      ?auto_25896 - SURFACE
      ?auto_25898 - PLACE
      ?auto_25907 - HOIST
      ?auto_25909 - SURFACE
      ?auto_25913 - PLACE
      ?auto_25917 - HOIST
      ?auto_25887 - SURFACE
      ?auto_25912 - PLACE
      ?auto_25916 - HOIST
      ?auto_25915 - SURFACE
      ?auto_25893 - SURFACE
      ?auto_25890 - PLACE
      ?auto_25908 - HOIST
      ?auto_25914 - SURFACE
      ?auto_25892 - PLACE
      ?auto_25899 - HOIST
      ?auto_25897 - SURFACE
      ?auto_25878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25881 ?auto_25879 ) ( IS-CRATE ?auto_25877 ) ( not ( = ?auto_25882 ?auto_25879 ) ) ( HOIST-AT ?auto_25883 ?auto_25882 ) ( AVAILABLE ?auto_25883 ) ( SURFACE-AT ?auto_25877 ?auto_25882 ) ( ON ?auto_25877 ?auto_25880 ) ( CLEAR ?auto_25877 ) ( not ( = ?auto_25876 ?auto_25877 ) ) ( not ( = ?auto_25876 ?auto_25880 ) ) ( not ( = ?auto_25877 ?auto_25880 ) ) ( not ( = ?auto_25881 ?auto_25883 ) ) ( IS-CRATE ?auto_25876 ) ( not ( = ?auto_25886 ?auto_25879 ) ) ( HOIST-AT ?auto_25905 ?auto_25886 ) ( AVAILABLE ?auto_25905 ) ( SURFACE-AT ?auto_25876 ?auto_25886 ) ( ON ?auto_25876 ?auto_25895 ) ( CLEAR ?auto_25876 ) ( not ( = ?auto_25874 ?auto_25876 ) ) ( not ( = ?auto_25874 ?auto_25895 ) ) ( not ( = ?auto_25876 ?auto_25895 ) ) ( not ( = ?auto_25881 ?auto_25905 ) ) ( IS-CRATE ?auto_25874 ) ( not ( = ?auto_25910 ?auto_25879 ) ) ( HOIST-AT ?auto_25894 ?auto_25910 ) ( AVAILABLE ?auto_25894 ) ( SURFACE-AT ?auto_25874 ?auto_25910 ) ( ON ?auto_25874 ?auto_25906 ) ( CLEAR ?auto_25874 ) ( not ( = ?auto_25875 ?auto_25874 ) ) ( not ( = ?auto_25875 ?auto_25906 ) ) ( not ( = ?auto_25874 ?auto_25906 ) ) ( not ( = ?auto_25881 ?auto_25894 ) ) ( IS-CRATE ?auto_25875 ) ( not ( = ?auto_25904 ?auto_25879 ) ) ( HOIST-AT ?auto_25884 ?auto_25904 ) ( AVAILABLE ?auto_25884 ) ( SURFACE-AT ?auto_25875 ?auto_25904 ) ( ON ?auto_25875 ?auto_25911 ) ( CLEAR ?auto_25875 ) ( not ( = ?auto_25873 ?auto_25875 ) ) ( not ( = ?auto_25873 ?auto_25911 ) ) ( not ( = ?auto_25875 ?auto_25911 ) ) ( not ( = ?auto_25881 ?auto_25884 ) ) ( IS-CRATE ?auto_25873 ) ( not ( = ?auto_25885 ?auto_25879 ) ) ( HOIST-AT ?auto_25888 ?auto_25885 ) ( AVAILABLE ?auto_25888 ) ( SURFACE-AT ?auto_25873 ?auto_25885 ) ( ON ?auto_25873 ?auto_25900 ) ( CLEAR ?auto_25873 ) ( not ( = ?auto_25870 ?auto_25873 ) ) ( not ( = ?auto_25870 ?auto_25900 ) ) ( not ( = ?auto_25873 ?auto_25900 ) ) ( not ( = ?auto_25881 ?auto_25888 ) ) ( IS-CRATE ?auto_25870 ) ( not ( = ?auto_25889 ?auto_25879 ) ) ( HOIST-AT ?auto_25891 ?auto_25889 ) ( AVAILABLE ?auto_25891 ) ( SURFACE-AT ?auto_25870 ?auto_25889 ) ( ON ?auto_25870 ?auto_25903 ) ( CLEAR ?auto_25870 ) ( not ( = ?auto_25871 ?auto_25870 ) ) ( not ( = ?auto_25871 ?auto_25903 ) ) ( not ( = ?auto_25870 ?auto_25903 ) ) ( not ( = ?auto_25881 ?auto_25891 ) ) ( IS-CRATE ?auto_25871 ) ( not ( = ?auto_25901 ?auto_25879 ) ) ( HOIST-AT ?auto_25902 ?auto_25901 ) ( AVAILABLE ?auto_25902 ) ( SURFACE-AT ?auto_25871 ?auto_25901 ) ( ON ?auto_25871 ?auto_25896 ) ( CLEAR ?auto_25871 ) ( not ( = ?auto_25872 ?auto_25871 ) ) ( not ( = ?auto_25872 ?auto_25896 ) ) ( not ( = ?auto_25871 ?auto_25896 ) ) ( not ( = ?auto_25881 ?auto_25902 ) ) ( IS-CRATE ?auto_25872 ) ( not ( = ?auto_25898 ?auto_25879 ) ) ( HOIST-AT ?auto_25907 ?auto_25898 ) ( AVAILABLE ?auto_25907 ) ( SURFACE-AT ?auto_25872 ?auto_25898 ) ( ON ?auto_25872 ?auto_25909 ) ( CLEAR ?auto_25872 ) ( not ( = ?auto_25869 ?auto_25872 ) ) ( not ( = ?auto_25869 ?auto_25909 ) ) ( not ( = ?auto_25872 ?auto_25909 ) ) ( not ( = ?auto_25881 ?auto_25907 ) ) ( IS-CRATE ?auto_25869 ) ( not ( = ?auto_25913 ?auto_25879 ) ) ( HOIST-AT ?auto_25917 ?auto_25913 ) ( SURFACE-AT ?auto_25869 ?auto_25913 ) ( ON ?auto_25869 ?auto_25887 ) ( CLEAR ?auto_25869 ) ( not ( = ?auto_25868 ?auto_25869 ) ) ( not ( = ?auto_25868 ?auto_25887 ) ) ( not ( = ?auto_25869 ?auto_25887 ) ) ( not ( = ?auto_25881 ?auto_25917 ) ) ( IS-CRATE ?auto_25868 ) ( not ( = ?auto_25912 ?auto_25879 ) ) ( HOIST-AT ?auto_25916 ?auto_25912 ) ( AVAILABLE ?auto_25916 ) ( SURFACE-AT ?auto_25868 ?auto_25912 ) ( ON ?auto_25868 ?auto_25915 ) ( CLEAR ?auto_25868 ) ( not ( = ?auto_25867 ?auto_25868 ) ) ( not ( = ?auto_25867 ?auto_25915 ) ) ( not ( = ?auto_25868 ?auto_25915 ) ) ( not ( = ?auto_25881 ?auto_25916 ) ) ( IS-CRATE ?auto_25867 ) ( AVAILABLE ?auto_25917 ) ( SURFACE-AT ?auto_25867 ?auto_25913 ) ( ON ?auto_25867 ?auto_25893 ) ( CLEAR ?auto_25867 ) ( not ( = ?auto_25866 ?auto_25867 ) ) ( not ( = ?auto_25866 ?auto_25893 ) ) ( not ( = ?auto_25867 ?auto_25893 ) ) ( IS-CRATE ?auto_25866 ) ( not ( = ?auto_25890 ?auto_25879 ) ) ( HOIST-AT ?auto_25908 ?auto_25890 ) ( AVAILABLE ?auto_25908 ) ( SURFACE-AT ?auto_25866 ?auto_25890 ) ( ON ?auto_25866 ?auto_25914 ) ( CLEAR ?auto_25866 ) ( not ( = ?auto_25865 ?auto_25866 ) ) ( not ( = ?auto_25865 ?auto_25914 ) ) ( not ( = ?auto_25866 ?auto_25914 ) ) ( not ( = ?auto_25881 ?auto_25908 ) ) ( SURFACE-AT ?auto_25864 ?auto_25879 ) ( CLEAR ?auto_25864 ) ( IS-CRATE ?auto_25865 ) ( AVAILABLE ?auto_25881 ) ( not ( = ?auto_25892 ?auto_25879 ) ) ( HOIST-AT ?auto_25899 ?auto_25892 ) ( AVAILABLE ?auto_25899 ) ( SURFACE-AT ?auto_25865 ?auto_25892 ) ( ON ?auto_25865 ?auto_25897 ) ( CLEAR ?auto_25865 ) ( TRUCK-AT ?auto_25878 ?auto_25879 ) ( not ( = ?auto_25864 ?auto_25865 ) ) ( not ( = ?auto_25864 ?auto_25897 ) ) ( not ( = ?auto_25865 ?auto_25897 ) ) ( not ( = ?auto_25881 ?auto_25899 ) ) ( not ( = ?auto_25864 ?auto_25866 ) ) ( not ( = ?auto_25864 ?auto_25914 ) ) ( not ( = ?auto_25866 ?auto_25897 ) ) ( not ( = ?auto_25890 ?auto_25892 ) ) ( not ( = ?auto_25908 ?auto_25899 ) ) ( not ( = ?auto_25914 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25867 ) ) ( not ( = ?auto_25864 ?auto_25893 ) ) ( not ( = ?auto_25865 ?auto_25867 ) ) ( not ( = ?auto_25865 ?auto_25893 ) ) ( not ( = ?auto_25867 ?auto_25914 ) ) ( not ( = ?auto_25867 ?auto_25897 ) ) ( not ( = ?auto_25913 ?auto_25890 ) ) ( not ( = ?auto_25913 ?auto_25892 ) ) ( not ( = ?auto_25917 ?auto_25908 ) ) ( not ( = ?auto_25917 ?auto_25899 ) ) ( not ( = ?auto_25893 ?auto_25914 ) ) ( not ( = ?auto_25893 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25868 ) ) ( not ( = ?auto_25864 ?auto_25915 ) ) ( not ( = ?auto_25865 ?auto_25868 ) ) ( not ( = ?auto_25865 ?auto_25915 ) ) ( not ( = ?auto_25866 ?auto_25868 ) ) ( not ( = ?auto_25866 ?auto_25915 ) ) ( not ( = ?auto_25868 ?auto_25893 ) ) ( not ( = ?auto_25868 ?auto_25914 ) ) ( not ( = ?auto_25868 ?auto_25897 ) ) ( not ( = ?auto_25912 ?auto_25913 ) ) ( not ( = ?auto_25912 ?auto_25890 ) ) ( not ( = ?auto_25912 ?auto_25892 ) ) ( not ( = ?auto_25916 ?auto_25917 ) ) ( not ( = ?auto_25916 ?auto_25908 ) ) ( not ( = ?auto_25916 ?auto_25899 ) ) ( not ( = ?auto_25915 ?auto_25893 ) ) ( not ( = ?auto_25915 ?auto_25914 ) ) ( not ( = ?auto_25915 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25869 ) ) ( not ( = ?auto_25864 ?auto_25887 ) ) ( not ( = ?auto_25865 ?auto_25869 ) ) ( not ( = ?auto_25865 ?auto_25887 ) ) ( not ( = ?auto_25866 ?auto_25869 ) ) ( not ( = ?auto_25866 ?auto_25887 ) ) ( not ( = ?auto_25867 ?auto_25869 ) ) ( not ( = ?auto_25867 ?auto_25887 ) ) ( not ( = ?auto_25869 ?auto_25915 ) ) ( not ( = ?auto_25869 ?auto_25893 ) ) ( not ( = ?auto_25869 ?auto_25914 ) ) ( not ( = ?auto_25869 ?auto_25897 ) ) ( not ( = ?auto_25887 ?auto_25915 ) ) ( not ( = ?auto_25887 ?auto_25893 ) ) ( not ( = ?auto_25887 ?auto_25914 ) ) ( not ( = ?auto_25887 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25872 ) ) ( not ( = ?auto_25864 ?auto_25909 ) ) ( not ( = ?auto_25865 ?auto_25872 ) ) ( not ( = ?auto_25865 ?auto_25909 ) ) ( not ( = ?auto_25866 ?auto_25872 ) ) ( not ( = ?auto_25866 ?auto_25909 ) ) ( not ( = ?auto_25867 ?auto_25872 ) ) ( not ( = ?auto_25867 ?auto_25909 ) ) ( not ( = ?auto_25868 ?auto_25872 ) ) ( not ( = ?auto_25868 ?auto_25909 ) ) ( not ( = ?auto_25872 ?auto_25887 ) ) ( not ( = ?auto_25872 ?auto_25915 ) ) ( not ( = ?auto_25872 ?auto_25893 ) ) ( not ( = ?auto_25872 ?auto_25914 ) ) ( not ( = ?auto_25872 ?auto_25897 ) ) ( not ( = ?auto_25898 ?auto_25913 ) ) ( not ( = ?auto_25898 ?auto_25912 ) ) ( not ( = ?auto_25898 ?auto_25890 ) ) ( not ( = ?auto_25898 ?auto_25892 ) ) ( not ( = ?auto_25907 ?auto_25917 ) ) ( not ( = ?auto_25907 ?auto_25916 ) ) ( not ( = ?auto_25907 ?auto_25908 ) ) ( not ( = ?auto_25907 ?auto_25899 ) ) ( not ( = ?auto_25909 ?auto_25887 ) ) ( not ( = ?auto_25909 ?auto_25915 ) ) ( not ( = ?auto_25909 ?auto_25893 ) ) ( not ( = ?auto_25909 ?auto_25914 ) ) ( not ( = ?auto_25909 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25871 ) ) ( not ( = ?auto_25864 ?auto_25896 ) ) ( not ( = ?auto_25865 ?auto_25871 ) ) ( not ( = ?auto_25865 ?auto_25896 ) ) ( not ( = ?auto_25866 ?auto_25871 ) ) ( not ( = ?auto_25866 ?auto_25896 ) ) ( not ( = ?auto_25867 ?auto_25871 ) ) ( not ( = ?auto_25867 ?auto_25896 ) ) ( not ( = ?auto_25868 ?auto_25871 ) ) ( not ( = ?auto_25868 ?auto_25896 ) ) ( not ( = ?auto_25869 ?auto_25871 ) ) ( not ( = ?auto_25869 ?auto_25896 ) ) ( not ( = ?auto_25871 ?auto_25909 ) ) ( not ( = ?auto_25871 ?auto_25887 ) ) ( not ( = ?auto_25871 ?auto_25915 ) ) ( not ( = ?auto_25871 ?auto_25893 ) ) ( not ( = ?auto_25871 ?auto_25914 ) ) ( not ( = ?auto_25871 ?auto_25897 ) ) ( not ( = ?auto_25901 ?auto_25898 ) ) ( not ( = ?auto_25901 ?auto_25913 ) ) ( not ( = ?auto_25901 ?auto_25912 ) ) ( not ( = ?auto_25901 ?auto_25890 ) ) ( not ( = ?auto_25901 ?auto_25892 ) ) ( not ( = ?auto_25902 ?auto_25907 ) ) ( not ( = ?auto_25902 ?auto_25917 ) ) ( not ( = ?auto_25902 ?auto_25916 ) ) ( not ( = ?auto_25902 ?auto_25908 ) ) ( not ( = ?auto_25902 ?auto_25899 ) ) ( not ( = ?auto_25896 ?auto_25909 ) ) ( not ( = ?auto_25896 ?auto_25887 ) ) ( not ( = ?auto_25896 ?auto_25915 ) ) ( not ( = ?auto_25896 ?auto_25893 ) ) ( not ( = ?auto_25896 ?auto_25914 ) ) ( not ( = ?auto_25896 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25870 ) ) ( not ( = ?auto_25864 ?auto_25903 ) ) ( not ( = ?auto_25865 ?auto_25870 ) ) ( not ( = ?auto_25865 ?auto_25903 ) ) ( not ( = ?auto_25866 ?auto_25870 ) ) ( not ( = ?auto_25866 ?auto_25903 ) ) ( not ( = ?auto_25867 ?auto_25870 ) ) ( not ( = ?auto_25867 ?auto_25903 ) ) ( not ( = ?auto_25868 ?auto_25870 ) ) ( not ( = ?auto_25868 ?auto_25903 ) ) ( not ( = ?auto_25869 ?auto_25870 ) ) ( not ( = ?auto_25869 ?auto_25903 ) ) ( not ( = ?auto_25872 ?auto_25870 ) ) ( not ( = ?auto_25872 ?auto_25903 ) ) ( not ( = ?auto_25870 ?auto_25896 ) ) ( not ( = ?auto_25870 ?auto_25909 ) ) ( not ( = ?auto_25870 ?auto_25887 ) ) ( not ( = ?auto_25870 ?auto_25915 ) ) ( not ( = ?auto_25870 ?auto_25893 ) ) ( not ( = ?auto_25870 ?auto_25914 ) ) ( not ( = ?auto_25870 ?auto_25897 ) ) ( not ( = ?auto_25889 ?auto_25901 ) ) ( not ( = ?auto_25889 ?auto_25898 ) ) ( not ( = ?auto_25889 ?auto_25913 ) ) ( not ( = ?auto_25889 ?auto_25912 ) ) ( not ( = ?auto_25889 ?auto_25890 ) ) ( not ( = ?auto_25889 ?auto_25892 ) ) ( not ( = ?auto_25891 ?auto_25902 ) ) ( not ( = ?auto_25891 ?auto_25907 ) ) ( not ( = ?auto_25891 ?auto_25917 ) ) ( not ( = ?auto_25891 ?auto_25916 ) ) ( not ( = ?auto_25891 ?auto_25908 ) ) ( not ( = ?auto_25891 ?auto_25899 ) ) ( not ( = ?auto_25903 ?auto_25896 ) ) ( not ( = ?auto_25903 ?auto_25909 ) ) ( not ( = ?auto_25903 ?auto_25887 ) ) ( not ( = ?auto_25903 ?auto_25915 ) ) ( not ( = ?auto_25903 ?auto_25893 ) ) ( not ( = ?auto_25903 ?auto_25914 ) ) ( not ( = ?auto_25903 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25873 ) ) ( not ( = ?auto_25864 ?auto_25900 ) ) ( not ( = ?auto_25865 ?auto_25873 ) ) ( not ( = ?auto_25865 ?auto_25900 ) ) ( not ( = ?auto_25866 ?auto_25873 ) ) ( not ( = ?auto_25866 ?auto_25900 ) ) ( not ( = ?auto_25867 ?auto_25873 ) ) ( not ( = ?auto_25867 ?auto_25900 ) ) ( not ( = ?auto_25868 ?auto_25873 ) ) ( not ( = ?auto_25868 ?auto_25900 ) ) ( not ( = ?auto_25869 ?auto_25873 ) ) ( not ( = ?auto_25869 ?auto_25900 ) ) ( not ( = ?auto_25872 ?auto_25873 ) ) ( not ( = ?auto_25872 ?auto_25900 ) ) ( not ( = ?auto_25871 ?auto_25873 ) ) ( not ( = ?auto_25871 ?auto_25900 ) ) ( not ( = ?auto_25873 ?auto_25903 ) ) ( not ( = ?auto_25873 ?auto_25896 ) ) ( not ( = ?auto_25873 ?auto_25909 ) ) ( not ( = ?auto_25873 ?auto_25887 ) ) ( not ( = ?auto_25873 ?auto_25915 ) ) ( not ( = ?auto_25873 ?auto_25893 ) ) ( not ( = ?auto_25873 ?auto_25914 ) ) ( not ( = ?auto_25873 ?auto_25897 ) ) ( not ( = ?auto_25885 ?auto_25889 ) ) ( not ( = ?auto_25885 ?auto_25901 ) ) ( not ( = ?auto_25885 ?auto_25898 ) ) ( not ( = ?auto_25885 ?auto_25913 ) ) ( not ( = ?auto_25885 ?auto_25912 ) ) ( not ( = ?auto_25885 ?auto_25890 ) ) ( not ( = ?auto_25885 ?auto_25892 ) ) ( not ( = ?auto_25888 ?auto_25891 ) ) ( not ( = ?auto_25888 ?auto_25902 ) ) ( not ( = ?auto_25888 ?auto_25907 ) ) ( not ( = ?auto_25888 ?auto_25917 ) ) ( not ( = ?auto_25888 ?auto_25916 ) ) ( not ( = ?auto_25888 ?auto_25908 ) ) ( not ( = ?auto_25888 ?auto_25899 ) ) ( not ( = ?auto_25900 ?auto_25903 ) ) ( not ( = ?auto_25900 ?auto_25896 ) ) ( not ( = ?auto_25900 ?auto_25909 ) ) ( not ( = ?auto_25900 ?auto_25887 ) ) ( not ( = ?auto_25900 ?auto_25915 ) ) ( not ( = ?auto_25900 ?auto_25893 ) ) ( not ( = ?auto_25900 ?auto_25914 ) ) ( not ( = ?auto_25900 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25875 ) ) ( not ( = ?auto_25864 ?auto_25911 ) ) ( not ( = ?auto_25865 ?auto_25875 ) ) ( not ( = ?auto_25865 ?auto_25911 ) ) ( not ( = ?auto_25866 ?auto_25875 ) ) ( not ( = ?auto_25866 ?auto_25911 ) ) ( not ( = ?auto_25867 ?auto_25875 ) ) ( not ( = ?auto_25867 ?auto_25911 ) ) ( not ( = ?auto_25868 ?auto_25875 ) ) ( not ( = ?auto_25868 ?auto_25911 ) ) ( not ( = ?auto_25869 ?auto_25875 ) ) ( not ( = ?auto_25869 ?auto_25911 ) ) ( not ( = ?auto_25872 ?auto_25875 ) ) ( not ( = ?auto_25872 ?auto_25911 ) ) ( not ( = ?auto_25871 ?auto_25875 ) ) ( not ( = ?auto_25871 ?auto_25911 ) ) ( not ( = ?auto_25870 ?auto_25875 ) ) ( not ( = ?auto_25870 ?auto_25911 ) ) ( not ( = ?auto_25875 ?auto_25900 ) ) ( not ( = ?auto_25875 ?auto_25903 ) ) ( not ( = ?auto_25875 ?auto_25896 ) ) ( not ( = ?auto_25875 ?auto_25909 ) ) ( not ( = ?auto_25875 ?auto_25887 ) ) ( not ( = ?auto_25875 ?auto_25915 ) ) ( not ( = ?auto_25875 ?auto_25893 ) ) ( not ( = ?auto_25875 ?auto_25914 ) ) ( not ( = ?auto_25875 ?auto_25897 ) ) ( not ( = ?auto_25904 ?auto_25885 ) ) ( not ( = ?auto_25904 ?auto_25889 ) ) ( not ( = ?auto_25904 ?auto_25901 ) ) ( not ( = ?auto_25904 ?auto_25898 ) ) ( not ( = ?auto_25904 ?auto_25913 ) ) ( not ( = ?auto_25904 ?auto_25912 ) ) ( not ( = ?auto_25904 ?auto_25890 ) ) ( not ( = ?auto_25904 ?auto_25892 ) ) ( not ( = ?auto_25884 ?auto_25888 ) ) ( not ( = ?auto_25884 ?auto_25891 ) ) ( not ( = ?auto_25884 ?auto_25902 ) ) ( not ( = ?auto_25884 ?auto_25907 ) ) ( not ( = ?auto_25884 ?auto_25917 ) ) ( not ( = ?auto_25884 ?auto_25916 ) ) ( not ( = ?auto_25884 ?auto_25908 ) ) ( not ( = ?auto_25884 ?auto_25899 ) ) ( not ( = ?auto_25911 ?auto_25900 ) ) ( not ( = ?auto_25911 ?auto_25903 ) ) ( not ( = ?auto_25911 ?auto_25896 ) ) ( not ( = ?auto_25911 ?auto_25909 ) ) ( not ( = ?auto_25911 ?auto_25887 ) ) ( not ( = ?auto_25911 ?auto_25915 ) ) ( not ( = ?auto_25911 ?auto_25893 ) ) ( not ( = ?auto_25911 ?auto_25914 ) ) ( not ( = ?auto_25911 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25874 ) ) ( not ( = ?auto_25864 ?auto_25906 ) ) ( not ( = ?auto_25865 ?auto_25874 ) ) ( not ( = ?auto_25865 ?auto_25906 ) ) ( not ( = ?auto_25866 ?auto_25874 ) ) ( not ( = ?auto_25866 ?auto_25906 ) ) ( not ( = ?auto_25867 ?auto_25874 ) ) ( not ( = ?auto_25867 ?auto_25906 ) ) ( not ( = ?auto_25868 ?auto_25874 ) ) ( not ( = ?auto_25868 ?auto_25906 ) ) ( not ( = ?auto_25869 ?auto_25874 ) ) ( not ( = ?auto_25869 ?auto_25906 ) ) ( not ( = ?auto_25872 ?auto_25874 ) ) ( not ( = ?auto_25872 ?auto_25906 ) ) ( not ( = ?auto_25871 ?auto_25874 ) ) ( not ( = ?auto_25871 ?auto_25906 ) ) ( not ( = ?auto_25870 ?auto_25874 ) ) ( not ( = ?auto_25870 ?auto_25906 ) ) ( not ( = ?auto_25873 ?auto_25874 ) ) ( not ( = ?auto_25873 ?auto_25906 ) ) ( not ( = ?auto_25874 ?auto_25911 ) ) ( not ( = ?auto_25874 ?auto_25900 ) ) ( not ( = ?auto_25874 ?auto_25903 ) ) ( not ( = ?auto_25874 ?auto_25896 ) ) ( not ( = ?auto_25874 ?auto_25909 ) ) ( not ( = ?auto_25874 ?auto_25887 ) ) ( not ( = ?auto_25874 ?auto_25915 ) ) ( not ( = ?auto_25874 ?auto_25893 ) ) ( not ( = ?auto_25874 ?auto_25914 ) ) ( not ( = ?auto_25874 ?auto_25897 ) ) ( not ( = ?auto_25910 ?auto_25904 ) ) ( not ( = ?auto_25910 ?auto_25885 ) ) ( not ( = ?auto_25910 ?auto_25889 ) ) ( not ( = ?auto_25910 ?auto_25901 ) ) ( not ( = ?auto_25910 ?auto_25898 ) ) ( not ( = ?auto_25910 ?auto_25913 ) ) ( not ( = ?auto_25910 ?auto_25912 ) ) ( not ( = ?auto_25910 ?auto_25890 ) ) ( not ( = ?auto_25910 ?auto_25892 ) ) ( not ( = ?auto_25894 ?auto_25884 ) ) ( not ( = ?auto_25894 ?auto_25888 ) ) ( not ( = ?auto_25894 ?auto_25891 ) ) ( not ( = ?auto_25894 ?auto_25902 ) ) ( not ( = ?auto_25894 ?auto_25907 ) ) ( not ( = ?auto_25894 ?auto_25917 ) ) ( not ( = ?auto_25894 ?auto_25916 ) ) ( not ( = ?auto_25894 ?auto_25908 ) ) ( not ( = ?auto_25894 ?auto_25899 ) ) ( not ( = ?auto_25906 ?auto_25911 ) ) ( not ( = ?auto_25906 ?auto_25900 ) ) ( not ( = ?auto_25906 ?auto_25903 ) ) ( not ( = ?auto_25906 ?auto_25896 ) ) ( not ( = ?auto_25906 ?auto_25909 ) ) ( not ( = ?auto_25906 ?auto_25887 ) ) ( not ( = ?auto_25906 ?auto_25915 ) ) ( not ( = ?auto_25906 ?auto_25893 ) ) ( not ( = ?auto_25906 ?auto_25914 ) ) ( not ( = ?auto_25906 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25876 ) ) ( not ( = ?auto_25864 ?auto_25895 ) ) ( not ( = ?auto_25865 ?auto_25876 ) ) ( not ( = ?auto_25865 ?auto_25895 ) ) ( not ( = ?auto_25866 ?auto_25876 ) ) ( not ( = ?auto_25866 ?auto_25895 ) ) ( not ( = ?auto_25867 ?auto_25876 ) ) ( not ( = ?auto_25867 ?auto_25895 ) ) ( not ( = ?auto_25868 ?auto_25876 ) ) ( not ( = ?auto_25868 ?auto_25895 ) ) ( not ( = ?auto_25869 ?auto_25876 ) ) ( not ( = ?auto_25869 ?auto_25895 ) ) ( not ( = ?auto_25872 ?auto_25876 ) ) ( not ( = ?auto_25872 ?auto_25895 ) ) ( not ( = ?auto_25871 ?auto_25876 ) ) ( not ( = ?auto_25871 ?auto_25895 ) ) ( not ( = ?auto_25870 ?auto_25876 ) ) ( not ( = ?auto_25870 ?auto_25895 ) ) ( not ( = ?auto_25873 ?auto_25876 ) ) ( not ( = ?auto_25873 ?auto_25895 ) ) ( not ( = ?auto_25875 ?auto_25876 ) ) ( not ( = ?auto_25875 ?auto_25895 ) ) ( not ( = ?auto_25876 ?auto_25906 ) ) ( not ( = ?auto_25876 ?auto_25911 ) ) ( not ( = ?auto_25876 ?auto_25900 ) ) ( not ( = ?auto_25876 ?auto_25903 ) ) ( not ( = ?auto_25876 ?auto_25896 ) ) ( not ( = ?auto_25876 ?auto_25909 ) ) ( not ( = ?auto_25876 ?auto_25887 ) ) ( not ( = ?auto_25876 ?auto_25915 ) ) ( not ( = ?auto_25876 ?auto_25893 ) ) ( not ( = ?auto_25876 ?auto_25914 ) ) ( not ( = ?auto_25876 ?auto_25897 ) ) ( not ( = ?auto_25886 ?auto_25910 ) ) ( not ( = ?auto_25886 ?auto_25904 ) ) ( not ( = ?auto_25886 ?auto_25885 ) ) ( not ( = ?auto_25886 ?auto_25889 ) ) ( not ( = ?auto_25886 ?auto_25901 ) ) ( not ( = ?auto_25886 ?auto_25898 ) ) ( not ( = ?auto_25886 ?auto_25913 ) ) ( not ( = ?auto_25886 ?auto_25912 ) ) ( not ( = ?auto_25886 ?auto_25890 ) ) ( not ( = ?auto_25886 ?auto_25892 ) ) ( not ( = ?auto_25905 ?auto_25894 ) ) ( not ( = ?auto_25905 ?auto_25884 ) ) ( not ( = ?auto_25905 ?auto_25888 ) ) ( not ( = ?auto_25905 ?auto_25891 ) ) ( not ( = ?auto_25905 ?auto_25902 ) ) ( not ( = ?auto_25905 ?auto_25907 ) ) ( not ( = ?auto_25905 ?auto_25917 ) ) ( not ( = ?auto_25905 ?auto_25916 ) ) ( not ( = ?auto_25905 ?auto_25908 ) ) ( not ( = ?auto_25905 ?auto_25899 ) ) ( not ( = ?auto_25895 ?auto_25906 ) ) ( not ( = ?auto_25895 ?auto_25911 ) ) ( not ( = ?auto_25895 ?auto_25900 ) ) ( not ( = ?auto_25895 ?auto_25903 ) ) ( not ( = ?auto_25895 ?auto_25896 ) ) ( not ( = ?auto_25895 ?auto_25909 ) ) ( not ( = ?auto_25895 ?auto_25887 ) ) ( not ( = ?auto_25895 ?auto_25915 ) ) ( not ( = ?auto_25895 ?auto_25893 ) ) ( not ( = ?auto_25895 ?auto_25914 ) ) ( not ( = ?auto_25895 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25877 ) ) ( not ( = ?auto_25864 ?auto_25880 ) ) ( not ( = ?auto_25865 ?auto_25877 ) ) ( not ( = ?auto_25865 ?auto_25880 ) ) ( not ( = ?auto_25866 ?auto_25877 ) ) ( not ( = ?auto_25866 ?auto_25880 ) ) ( not ( = ?auto_25867 ?auto_25877 ) ) ( not ( = ?auto_25867 ?auto_25880 ) ) ( not ( = ?auto_25868 ?auto_25877 ) ) ( not ( = ?auto_25868 ?auto_25880 ) ) ( not ( = ?auto_25869 ?auto_25877 ) ) ( not ( = ?auto_25869 ?auto_25880 ) ) ( not ( = ?auto_25872 ?auto_25877 ) ) ( not ( = ?auto_25872 ?auto_25880 ) ) ( not ( = ?auto_25871 ?auto_25877 ) ) ( not ( = ?auto_25871 ?auto_25880 ) ) ( not ( = ?auto_25870 ?auto_25877 ) ) ( not ( = ?auto_25870 ?auto_25880 ) ) ( not ( = ?auto_25873 ?auto_25877 ) ) ( not ( = ?auto_25873 ?auto_25880 ) ) ( not ( = ?auto_25875 ?auto_25877 ) ) ( not ( = ?auto_25875 ?auto_25880 ) ) ( not ( = ?auto_25874 ?auto_25877 ) ) ( not ( = ?auto_25874 ?auto_25880 ) ) ( not ( = ?auto_25877 ?auto_25895 ) ) ( not ( = ?auto_25877 ?auto_25906 ) ) ( not ( = ?auto_25877 ?auto_25911 ) ) ( not ( = ?auto_25877 ?auto_25900 ) ) ( not ( = ?auto_25877 ?auto_25903 ) ) ( not ( = ?auto_25877 ?auto_25896 ) ) ( not ( = ?auto_25877 ?auto_25909 ) ) ( not ( = ?auto_25877 ?auto_25887 ) ) ( not ( = ?auto_25877 ?auto_25915 ) ) ( not ( = ?auto_25877 ?auto_25893 ) ) ( not ( = ?auto_25877 ?auto_25914 ) ) ( not ( = ?auto_25877 ?auto_25897 ) ) ( not ( = ?auto_25882 ?auto_25886 ) ) ( not ( = ?auto_25882 ?auto_25910 ) ) ( not ( = ?auto_25882 ?auto_25904 ) ) ( not ( = ?auto_25882 ?auto_25885 ) ) ( not ( = ?auto_25882 ?auto_25889 ) ) ( not ( = ?auto_25882 ?auto_25901 ) ) ( not ( = ?auto_25882 ?auto_25898 ) ) ( not ( = ?auto_25882 ?auto_25913 ) ) ( not ( = ?auto_25882 ?auto_25912 ) ) ( not ( = ?auto_25882 ?auto_25890 ) ) ( not ( = ?auto_25882 ?auto_25892 ) ) ( not ( = ?auto_25883 ?auto_25905 ) ) ( not ( = ?auto_25883 ?auto_25894 ) ) ( not ( = ?auto_25883 ?auto_25884 ) ) ( not ( = ?auto_25883 ?auto_25888 ) ) ( not ( = ?auto_25883 ?auto_25891 ) ) ( not ( = ?auto_25883 ?auto_25902 ) ) ( not ( = ?auto_25883 ?auto_25907 ) ) ( not ( = ?auto_25883 ?auto_25917 ) ) ( not ( = ?auto_25883 ?auto_25916 ) ) ( not ( = ?auto_25883 ?auto_25908 ) ) ( not ( = ?auto_25883 ?auto_25899 ) ) ( not ( = ?auto_25880 ?auto_25895 ) ) ( not ( = ?auto_25880 ?auto_25906 ) ) ( not ( = ?auto_25880 ?auto_25911 ) ) ( not ( = ?auto_25880 ?auto_25900 ) ) ( not ( = ?auto_25880 ?auto_25903 ) ) ( not ( = ?auto_25880 ?auto_25896 ) ) ( not ( = ?auto_25880 ?auto_25909 ) ) ( not ( = ?auto_25880 ?auto_25887 ) ) ( not ( = ?auto_25880 ?auto_25915 ) ) ( not ( = ?auto_25880 ?auto_25893 ) ) ( not ( = ?auto_25880 ?auto_25914 ) ) ( not ( = ?auto_25880 ?auto_25897 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25864 ?auto_25865 ?auto_25866 ?auto_25867 ?auto_25868 ?auto_25869 ?auto_25872 ?auto_25871 ?auto_25870 ?auto_25873 ?auto_25875 ?auto_25874 ?auto_25876 )
      ( MAKE-1CRATE ?auto_25876 ?auto_25877 )
      ( MAKE-13CRATE-VERIFY ?auto_25864 ?auto_25865 ?auto_25866 ?auto_25867 ?auto_25868 ?auto_25869 ?auto_25872 ?auto_25871 ?auto_25870 ?auto_25873 ?auto_25875 ?auto_25874 ?auto_25876 ?auto_25877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25920 - SURFACE
      ?auto_25921 - SURFACE
    )
    :vars
    (
      ?auto_25922 - HOIST
      ?auto_25923 - PLACE
      ?auto_25925 - PLACE
      ?auto_25926 - HOIST
      ?auto_25927 - SURFACE
      ?auto_25924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25922 ?auto_25923 ) ( SURFACE-AT ?auto_25920 ?auto_25923 ) ( CLEAR ?auto_25920 ) ( IS-CRATE ?auto_25921 ) ( AVAILABLE ?auto_25922 ) ( not ( = ?auto_25925 ?auto_25923 ) ) ( HOIST-AT ?auto_25926 ?auto_25925 ) ( AVAILABLE ?auto_25926 ) ( SURFACE-AT ?auto_25921 ?auto_25925 ) ( ON ?auto_25921 ?auto_25927 ) ( CLEAR ?auto_25921 ) ( TRUCK-AT ?auto_25924 ?auto_25923 ) ( not ( = ?auto_25920 ?auto_25921 ) ) ( not ( = ?auto_25920 ?auto_25927 ) ) ( not ( = ?auto_25921 ?auto_25927 ) ) ( not ( = ?auto_25922 ?auto_25926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25924 ?auto_25923 ?auto_25925 )
      ( !LIFT ?auto_25926 ?auto_25921 ?auto_25927 ?auto_25925 )
      ( !LOAD ?auto_25926 ?auto_25921 ?auto_25924 ?auto_25925 )
      ( !DRIVE ?auto_25924 ?auto_25925 ?auto_25923 )
      ( !UNLOAD ?auto_25922 ?auto_25921 ?auto_25924 ?auto_25923 )
      ( !DROP ?auto_25922 ?auto_25921 ?auto_25920 ?auto_25923 )
      ( MAKE-1CRATE-VERIFY ?auto_25920 ?auto_25921 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_25943 - SURFACE
      ?auto_25944 - SURFACE
      ?auto_25945 - SURFACE
      ?auto_25946 - SURFACE
      ?auto_25947 - SURFACE
      ?auto_25948 - SURFACE
      ?auto_25951 - SURFACE
      ?auto_25950 - SURFACE
      ?auto_25949 - SURFACE
      ?auto_25952 - SURFACE
      ?auto_25954 - SURFACE
      ?auto_25953 - SURFACE
      ?auto_25955 - SURFACE
      ?auto_25957 - SURFACE
      ?auto_25956 - SURFACE
    )
    :vars
    (
      ?auto_25962 - HOIST
      ?auto_25959 - PLACE
      ?auto_25958 - PLACE
      ?auto_25960 - HOIST
      ?auto_25963 - SURFACE
      ?auto_26000 - PLACE
      ?auto_25995 - HOIST
      ?auto_25973 - SURFACE
      ?auto_25983 - PLACE
      ?auto_25998 - HOIST
      ?auto_25993 - SURFACE
      ?auto_25974 - PLACE
      ?auto_25972 - HOIST
      ?auto_25996 - SURFACE
      ?auto_25976 - PLACE
      ?auto_25988 - HOIST
      ?auto_25978 - SURFACE
      ?auto_25992 - PLACE
      ?auto_25987 - HOIST
      ?auto_25997 - SURFACE
      ?auto_25967 - PLACE
      ?auto_25982 - HOIST
      ?auto_25984 - SURFACE
      ?auto_25964 - PLACE
      ?auto_25990 - HOIST
      ?auto_25970 - SURFACE
      ?auto_25966 - PLACE
      ?auto_25965 - HOIST
      ?auto_25989 - SURFACE
      ?auto_25969 - PLACE
      ?auto_25981 - HOIST
      ?auto_25986 - SURFACE
      ?auto_25991 - PLACE
      ?auto_25968 - HOIST
      ?auto_25985 - SURFACE
      ?auto_25999 - SURFACE
      ?auto_25980 - PLACE
      ?auto_25979 - HOIST
      ?auto_25975 - SURFACE
      ?auto_25994 - PLACE
      ?auto_25971 - HOIST
      ?auto_25977 - SURFACE
      ?auto_25961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25962 ?auto_25959 ) ( IS-CRATE ?auto_25956 ) ( not ( = ?auto_25958 ?auto_25959 ) ) ( HOIST-AT ?auto_25960 ?auto_25958 ) ( AVAILABLE ?auto_25960 ) ( SURFACE-AT ?auto_25956 ?auto_25958 ) ( ON ?auto_25956 ?auto_25963 ) ( CLEAR ?auto_25956 ) ( not ( = ?auto_25957 ?auto_25956 ) ) ( not ( = ?auto_25957 ?auto_25963 ) ) ( not ( = ?auto_25956 ?auto_25963 ) ) ( not ( = ?auto_25962 ?auto_25960 ) ) ( IS-CRATE ?auto_25957 ) ( not ( = ?auto_26000 ?auto_25959 ) ) ( HOIST-AT ?auto_25995 ?auto_26000 ) ( AVAILABLE ?auto_25995 ) ( SURFACE-AT ?auto_25957 ?auto_26000 ) ( ON ?auto_25957 ?auto_25973 ) ( CLEAR ?auto_25957 ) ( not ( = ?auto_25955 ?auto_25957 ) ) ( not ( = ?auto_25955 ?auto_25973 ) ) ( not ( = ?auto_25957 ?auto_25973 ) ) ( not ( = ?auto_25962 ?auto_25995 ) ) ( IS-CRATE ?auto_25955 ) ( not ( = ?auto_25983 ?auto_25959 ) ) ( HOIST-AT ?auto_25998 ?auto_25983 ) ( AVAILABLE ?auto_25998 ) ( SURFACE-AT ?auto_25955 ?auto_25983 ) ( ON ?auto_25955 ?auto_25993 ) ( CLEAR ?auto_25955 ) ( not ( = ?auto_25953 ?auto_25955 ) ) ( not ( = ?auto_25953 ?auto_25993 ) ) ( not ( = ?auto_25955 ?auto_25993 ) ) ( not ( = ?auto_25962 ?auto_25998 ) ) ( IS-CRATE ?auto_25953 ) ( not ( = ?auto_25974 ?auto_25959 ) ) ( HOIST-AT ?auto_25972 ?auto_25974 ) ( AVAILABLE ?auto_25972 ) ( SURFACE-AT ?auto_25953 ?auto_25974 ) ( ON ?auto_25953 ?auto_25996 ) ( CLEAR ?auto_25953 ) ( not ( = ?auto_25954 ?auto_25953 ) ) ( not ( = ?auto_25954 ?auto_25996 ) ) ( not ( = ?auto_25953 ?auto_25996 ) ) ( not ( = ?auto_25962 ?auto_25972 ) ) ( IS-CRATE ?auto_25954 ) ( not ( = ?auto_25976 ?auto_25959 ) ) ( HOIST-AT ?auto_25988 ?auto_25976 ) ( AVAILABLE ?auto_25988 ) ( SURFACE-AT ?auto_25954 ?auto_25976 ) ( ON ?auto_25954 ?auto_25978 ) ( CLEAR ?auto_25954 ) ( not ( = ?auto_25952 ?auto_25954 ) ) ( not ( = ?auto_25952 ?auto_25978 ) ) ( not ( = ?auto_25954 ?auto_25978 ) ) ( not ( = ?auto_25962 ?auto_25988 ) ) ( IS-CRATE ?auto_25952 ) ( not ( = ?auto_25992 ?auto_25959 ) ) ( HOIST-AT ?auto_25987 ?auto_25992 ) ( AVAILABLE ?auto_25987 ) ( SURFACE-AT ?auto_25952 ?auto_25992 ) ( ON ?auto_25952 ?auto_25997 ) ( CLEAR ?auto_25952 ) ( not ( = ?auto_25949 ?auto_25952 ) ) ( not ( = ?auto_25949 ?auto_25997 ) ) ( not ( = ?auto_25952 ?auto_25997 ) ) ( not ( = ?auto_25962 ?auto_25987 ) ) ( IS-CRATE ?auto_25949 ) ( not ( = ?auto_25967 ?auto_25959 ) ) ( HOIST-AT ?auto_25982 ?auto_25967 ) ( AVAILABLE ?auto_25982 ) ( SURFACE-AT ?auto_25949 ?auto_25967 ) ( ON ?auto_25949 ?auto_25984 ) ( CLEAR ?auto_25949 ) ( not ( = ?auto_25950 ?auto_25949 ) ) ( not ( = ?auto_25950 ?auto_25984 ) ) ( not ( = ?auto_25949 ?auto_25984 ) ) ( not ( = ?auto_25962 ?auto_25982 ) ) ( IS-CRATE ?auto_25950 ) ( not ( = ?auto_25964 ?auto_25959 ) ) ( HOIST-AT ?auto_25990 ?auto_25964 ) ( AVAILABLE ?auto_25990 ) ( SURFACE-AT ?auto_25950 ?auto_25964 ) ( ON ?auto_25950 ?auto_25970 ) ( CLEAR ?auto_25950 ) ( not ( = ?auto_25951 ?auto_25950 ) ) ( not ( = ?auto_25951 ?auto_25970 ) ) ( not ( = ?auto_25950 ?auto_25970 ) ) ( not ( = ?auto_25962 ?auto_25990 ) ) ( IS-CRATE ?auto_25951 ) ( not ( = ?auto_25966 ?auto_25959 ) ) ( HOIST-AT ?auto_25965 ?auto_25966 ) ( AVAILABLE ?auto_25965 ) ( SURFACE-AT ?auto_25951 ?auto_25966 ) ( ON ?auto_25951 ?auto_25989 ) ( CLEAR ?auto_25951 ) ( not ( = ?auto_25948 ?auto_25951 ) ) ( not ( = ?auto_25948 ?auto_25989 ) ) ( not ( = ?auto_25951 ?auto_25989 ) ) ( not ( = ?auto_25962 ?auto_25965 ) ) ( IS-CRATE ?auto_25948 ) ( not ( = ?auto_25969 ?auto_25959 ) ) ( HOIST-AT ?auto_25981 ?auto_25969 ) ( SURFACE-AT ?auto_25948 ?auto_25969 ) ( ON ?auto_25948 ?auto_25986 ) ( CLEAR ?auto_25948 ) ( not ( = ?auto_25947 ?auto_25948 ) ) ( not ( = ?auto_25947 ?auto_25986 ) ) ( not ( = ?auto_25948 ?auto_25986 ) ) ( not ( = ?auto_25962 ?auto_25981 ) ) ( IS-CRATE ?auto_25947 ) ( not ( = ?auto_25991 ?auto_25959 ) ) ( HOIST-AT ?auto_25968 ?auto_25991 ) ( AVAILABLE ?auto_25968 ) ( SURFACE-AT ?auto_25947 ?auto_25991 ) ( ON ?auto_25947 ?auto_25985 ) ( CLEAR ?auto_25947 ) ( not ( = ?auto_25946 ?auto_25947 ) ) ( not ( = ?auto_25946 ?auto_25985 ) ) ( not ( = ?auto_25947 ?auto_25985 ) ) ( not ( = ?auto_25962 ?auto_25968 ) ) ( IS-CRATE ?auto_25946 ) ( AVAILABLE ?auto_25981 ) ( SURFACE-AT ?auto_25946 ?auto_25969 ) ( ON ?auto_25946 ?auto_25999 ) ( CLEAR ?auto_25946 ) ( not ( = ?auto_25945 ?auto_25946 ) ) ( not ( = ?auto_25945 ?auto_25999 ) ) ( not ( = ?auto_25946 ?auto_25999 ) ) ( IS-CRATE ?auto_25945 ) ( not ( = ?auto_25980 ?auto_25959 ) ) ( HOIST-AT ?auto_25979 ?auto_25980 ) ( AVAILABLE ?auto_25979 ) ( SURFACE-AT ?auto_25945 ?auto_25980 ) ( ON ?auto_25945 ?auto_25975 ) ( CLEAR ?auto_25945 ) ( not ( = ?auto_25944 ?auto_25945 ) ) ( not ( = ?auto_25944 ?auto_25975 ) ) ( not ( = ?auto_25945 ?auto_25975 ) ) ( not ( = ?auto_25962 ?auto_25979 ) ) ( SURFACE-AT ?auto_25943 ?auto_25959 ) ( CLEAR ?auto_25943 ) ( IS-CRATE ?auto_25944 ) ( AVAILABLE ?auto_25962 ) ( not ( = ?auto_25994 ?auto_25959 ) ) ( HOIST-AT ?auto_25971 ?auto_25994 ) ( AVAILABLE ?auto_25971 ) ( SURFACE-AT ?auto_25944 ?auto_25994 ) ( ON ?auto_25944 ?auto_25977 ) ( CLEAR ?auto_25944 ) ( TRUCK-AT ?auto_25961 ?auto_25959 ) ( not ( = ?auto_25943 ?auto_25944 ) ) ( not ( = ?auto_25943 ?auto_25977 ) ) ( not ( = ?auto_25944 ?auto_25977 ) ) ( not ( = ?auto_25962 ?auto_25971 ) ) ( not ( = ?auto_25943 ?auto_25945 ) ) ( not ( = ?auto_25943 ?auto_25975 ) ) ( not ( = ?auto_25945 ?auto_25977 ) ) ( not ( = ?auto_25980 ?auto_25994 ) ) ( not ( = ?auto_25979 ?auto_25971 ) ) ( not ( = ?auto_25975 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25946 ) ) ( not ( = ?auto_25943 ?auto_25999 ) ) ( not ( = ?auto_25944 ?auto_25946 ) ) ( not ( = ?auto_25944 ?auto_25999 ) ) ( not ( = ?auto_25946 ?auto_25975 ) ) ( not ( = ?auto_25946 ?auto_25977 ) ) ( not ( = ?auto_25969 ?auto_25980 ) ) ( not ( = ?auto_25969 ?auto_25994 ) ) ( not ( = ?auto_25981 ?auto_25979 ) ) ( not ( = ?auto_25981 ?auto_25971 ) ) ( not ( = ?auto_25999 ?auto_25975 ) ) ( not ( = ?auto_25999 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25947 ) ) ( not ( = ?auto_25943 ?auto_25985 ) ) ( not ( = ?auto_25944 ?auto_25947 ) ) ( not ( = ?auto_25944 ?auto_25985 ) ) ( not ( = ?auto_25945 ?auto_25947 ) ) ( not ( = ?auto_25945 ?auto_25985 ) ) ( not ( = ?auto_25947 ?auto_25999 ) ) ( not ( = ?auto_25947 ?auto_25975 ) ) ( not ( = ?auto_25947 ?auto_25977 ) ) ( not ( = ?auto_25991 ?auto_25969 ) ) ( not ( = ?auto_25991 ?auto_25980 ) ) ( not ( = ?auto_25991 ?auto_25994 ) ) ( not ( = ?auto_25968 ?auto_25981 ) ) ( not ( = ?auto_25968 ?auto_25979 ) ) ( not ( = ?auto_25968 ?auto_25971 ) ) ( not ( = ?auto_25985 ?auto_25999 ) ) ( not ( = ?auto_25985 ?auto_25975 ) ) ( not ( = ?auto_25985 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25948 ) ) ( not ( = ?auto_25943 ?auto_25986 ) ) ( not ( = ?auto_25944 ?auto_25948 ) ) ( not ( = ?auto_25944 ?auto_25986 ) ) ( not ( = ?auto_25945 ?auto_25948 ) ) ( not ( = ?auto_25945 ?auto_25986 ) ) ( not ( = ?auto_25946 ?auto_25948 ) ) ( not ( = ?auto_25946 ?auto_25986 ) ) ( not ( = ?auto_25948 ?auto_25985 ) ) ( not ( = ?auto_25948 ?auto_25999 ) ) ( not ( = ?auto_25948 ?auto_25975 ) ) ( not ( = ?auto_25948 ?auto_25977 ) ) ( not ( = ?auto_25986 ?auto_25985 ) ) ( not ( = ?auto_25986 ?auto_25999 ) ) ( not ( = ?auto_25986 ?auto_25975 ) ) ( not ( = ?auto_25986 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25951 ) ) ( not ( = ?auto_25943 ?auto_25989 ) ) ( not ( = ?auto_25944 ?auto_25951 ) ) ( not ( = ?auto_25944 ?auto_25989 ) ) ( not ( = ?auto_25945 ?auto_25951 ) ) ( not ( = ?auto_25945 ?auto_25989 ) ) ( not ( = ?auto_25946 ?auto_25951 ) ) ( not ( = ?auto_25946 ?auto_25989 ) ) ( not ( = ?auto_25947 ?auto_25951 ) ) ( not ( = ?auto_25947 ?auto_25989 ) ) ( not ( = ?auto_25951 ?auto_25986 ) ) ( not ( = ?auto_25951 ?auto_25985 ) ) ( not ( = ?auto_25951 ?auto_25999 ) ) ( not ( = ?auto_25951 ?auto_25975 ) ) ( not ( = ?auto_25951 ?auto_25977 ) ) ( not ( = ?auto_25966 ?auto_25969 ) ) ( not ( = ?auto_25966 ?auto_25991 ) ) ( not ( = ?auto_25966 ?auto_25980 ) ) ( not ( = ?auto_25966 ?auto_25994 ) ) ( not ( = ?auto_25965 ?auto_25981 ) ) ( not ( = ?auto_25965 ?auto_25968 ) ) ( not ( = ?auto_25965 ?auto_25979 ) ) ( not ( = ?auto_25965 ?auto_25971 ) ) ( not ( = ?auto_25989 ?auto_25986 ) ) ( not ( = ?auto_25989 ?auto_25985 ) ) ( not ( = ?auto_25989 ?auto_25999 ) ) ( not ( = ?auto_25989 ?auto_25975 ) ) ( not ( = ?auto_25989 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25950 ) ) ( not ( = ?auto_25943 ?auto_25970 ) ) ( not ( = ?auto_25944 ?auto_25950 ) ) ( not ( = ?auto_25944 ?auto_25970 ) ) ( not ( = ?auto_25945 ?auto_25950 ) ) ( not ( = ?auto_25945 ?auto_25970 ) ) ( not ( = ?auto_25946 ?auto_25950 ) ) ( not ( = ?auto_25946 ?auto_25970 ) ) ( not ( = ?auto_25947 ?auto_25950 ) ) ( not ( = ?auto_25947 ?auto_25970 ) ) ( not ( = ?auto_25948 ?auto_25950 ) ) ( not ( = ?auto_25948 ?auto_25970 ) ) ( not ( = ?auto_25950 ?auto_25989 ) ) ( not ( = ?auto_25950 ?auto_25986 ) ) ( not ( = ?auto_25950 ?auto_25985 ) ) ( not ( = ?auto_25950 ?auto_25999 ) ) ( not ( = ?auto_25950 ?auto_25975 ) ) ( not ( = ?auto_25950 ?auto_25977 ) ) ( not ( = ?auto_25964 ?auto_25966 ) ) ( not ( = ?auto_25964 ?auto_25969 ) ) ( not ( = ?auto_25964 ?auto_25991 ) ) ( not ( = ?auto_25964 ?auto_25980 ) ) ( not ( = ?auto_25964 ?auto_25994 ) ) ( not ( = ?auto_25990 ?auto_25965 ) ) ( not ( = ?auto_25990 ?auto_25981 ) ) ( not ( = ?auto_25990 ?auto_25968 ) ) ( not ( = ?auto_25990 ?auto_25979 ) ) ( not ( = ?auto_25990 ?auto_25971 ) ) ( not ( = ?auto_25970 ?auto_25989 ) ) ( not ( = ?auto_25970 ?auto_25986 ) ) ( not ( = ?auto_25970 ?auto_25985 ) ) ( not ( = ?auto_25970 ?auto_25999 ) ) ( not ( = ?auto_25970 ?auto_25975 ) ) ( not ( = ?auto_25970 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25949 ) ) ( not ( = ?auto_25943 ?auto_25984 ) ) ( not ( = ?auto_25944 ?auto_25949 ) ) ( not ( = ?auto_25944 ?auto_25984 ) ) ( not ( = ?auto_25945 ?auto_25949 ) ) ( not ( = ?auto_25945 ?auto_25984 ) ) ( not ( = ?auto_25946 ?auto_25949 ) ) ( not ( = ?auto_25946 ?auto_25984 ) ) ( not ( = ?auto_25947 ?auto_25949 ) ) ( not ( = ?auto_25947 ?auto_25984 ) ) ( not ( = ?auto_25948 ?auto_25949 ) ) ( not ( = ?auto_25948 ?auto_25984 ) ) ( not ( = ?auto_25951 ?auto_25949 ) ) ( not ( = ?auto_25951 ?auto_25984 ) ) ( not ( = ?auto_25949 ?auto_25970 ) ) ( not ( = ?auto_25949 ?auto_25989 ) ) ( not ( = ?auto_25949 ?auto_25986 ) ) ( not ( = ?auto_25949 ?auto_25985 ) ) ( not ( = ?auto_25949 ?auto_25999 ) ) ( not ( = ?auto_25949 ?auto_25975 ) ) ( not ( = ?auto_25949 ?auto_25977 ) ) ( not ( = ?auto_25967 ?auto_25964 ) ) ( not ( = ?auto_25967 ?auto_25966 ) ) ( not ( = ?auto_25967 ?auto_25969 ) ) ( not ( = ?auto_25967 ?auto_25991 ) ) ( not ( = ?auto_25967 ?auto_25980 ) ) ( not ( = ?auto_25967 ?auto_25994 ) ) ( not ( = ?auto_25982 ?auto_25990 ) ) ( not ( = ?auto_25982 ?auto_25965 ) ) ( not ( = ?auto_25982 ?auto_25981 ) ) ( not ( = ?auto_25982 ?auto_25968 ) ) ( not ( = ?auto_25982 ?auto_25979 ) ) ( not ( = ?auto_25982 ?auto_25971 ) ) ( not ( = ?auto_25984 ?auto_25970 ) ) ( not ( = ?auto_25984 ?auto_25989 ) ) ( not ( = ?auto_25984 ?auto_25986 ) ) ( not ( = ?auto_25984 ?auto_25985 ) ) ( not ( = ?auto_25984 ?auto_25999 ) ) ( not ( = ?auto_25984 ?auto_25975 ) ) ( not ( = ?auto_25984 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25952 ) ) ( not ( = ?auto_25943 ?auto_25997 ) ) ( not ( = ?auto_25944 ?auto_25952 ) ) ( not ( = ?auto_25944 ?auto_25997 ) ) ( not ( = ?auto_25945 ?auto_25952 ) ) ( not ( = ?auto_25945 ?auto_25997 ) ) ( not ( = ?auto_25946 ?auto_25952 ) ) ( not ( = ?auto_25946 ?auto_25997 ) ) ( not ( = ?auto_25947 ?auto_25952 ) ) ( not ( = ?auto_25947 ?auto_25997 ) ) ( not ( = ?auto_25948 ?auto_25952 ) ) ( not ( = ?auto_25948 ?auto_25997 ) ) ( not ( = ?auto_25951 ?auto_25952 ) ) ( not ( = ?auto_25951 ?auto_25997 ) ) ( not ( = ?auto_25950 ?auto_25952 ) ) ( not ( = ?auto_25950 ?auto_25997 ) ) ( not ( = ?auto_25952 ?auto_25984 ) ) ( not ( = ?auto_25952 ?auto_25970 ) ) ( not ( = ?auto_25952 ?auto_25989 ) ) ( not ( = ?auto_25952 ?auto_25986 ) ) ( not ( = ?auto_25952 ?auto_25985 ) ) ( not ( = ?auto_25952 ?auto_25999 ) ) ( not ( = ?auto_25952 ?auto_25975 ) ) ( not ( = ?auto_25952 ?auto_25977 ) ) ( not ( = ?auto_25992 ?auto_25967 ) ) ( not ( = ?auto_25992 ?auto_25964 ) ) ( not ( = ?auto_25992 ?auto_25966 ) ) ( not ( = ?auto_25992 ?auto_25969 ) ) ( not ( = ?auto_25992 ?auto_25991 ) ) ( not ( = ?auto_25992 ?auto_25980 ) ) ( not ( = ?auto_25992 ?auto_25994 ) ) ( not ( = ?auto_25987 ?auto_25982 ) ) ( not ( = ?auto_25987 ?auto_25990 ) ) ( not ( = ?auto_25987 ?auto_25965 ) ) ( not ( = ?auto_25987 ?auto_25981 ) ) ( not ( = ?auto_25987 ?auto_25968 ) ) ( not ( = ?auto_25987 ?auto_25979 ) ) ( not ( = ?auto_25987 ?auto_25971 ) ) ( not ( = ?auto_25997 ?auto_25984 ) ) ( not ( = ?auto_25997 ?auto_25970 ) ) ( not ( = ?auto_25997 ?auto_25989 ) ) ( not ( = ?auto_25997 ?auto_25986 ) ) ( not ( = ?auto_25997 ?auto_25985 ) ) ( not ( = ?auto_25997 ?auto_25999 ) ) ( not ( = ?auto_25997 ?auto_25975 ) ) ( not ( = ?auto_25997 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25954 ) ) ( not ( = ?auto_25943 ?auto_25978 ) ) ( not ( = ?auto_25944 ?auto_25954 ) ) ( not ( = ?auto_25944 ?auto_25978 ) ) ( not ( = ?auto_25945 ?auto_25954 ) ) ( not ( = ?auto_25945 ?auto_25978 ) ) ( not ( = ?auto_25946 ?auto_25954 ) ) ( not ( = ?auto_25946 ?auto_25978 ) ) ( not ( = ?auto_25947 ?auto_25954 ) ) ( not ( = ?auto_25947 ?auto_25978 ) ) ( not ( = ?auto_25948 ?auto_25954 ) ) ( not ( = ?auto_25948 ?auto_25978 ) ) ( not ( = ?auto_25951 ?auto_25954 ) ) ( not ( = ?auto_25951 ?auto_25978 ) ) ( not ( = ?auto_25950 ?auto_25954 ) ) ( not ( = ?auto_25950 ?auto_25978 ) ) ( not ( = ?auto_25949 ?auto_25954 ) ) ( not ( = ?auto_25949 ?auto_25978 ) ) ( not ( = ?auto_25954 ?auto_25997 ) ) ( not ( = ?auto_25954 ?auto_25984 ) ) ( not ( = ?auto_25954 ?auto_25970 ) ) ( not ( = ?auto_25954 ?auto_25989 ) ) ( not ( = ?auto_25954 ?auto_25986 ) ) ( not ( = ?auto_25954 ?auto_25985 ) ) ( not ( = ?auto_25954 ?auto_25999 ) ) ( not ( = ?auto_25954 ?auto_25975 ) ) ( not ( = ?auto_25954 ?auto_25977 ) ) ( not ( = ?auto_25976 ?auto_25992 ) ) ( not ( = ?auto_25976 ?auto_25967 ) ) ( not ( = ?auto_25976 ?auto_25964 ) ) ( not ( = ?auto_25976 ?auto_25966 ) ) ( not ( = ?auto_25976 ?auto_25969 ) ) ( not ( = ?auto_25976 ?auto_25991 ) ) ( not ( = ?auto_25976 ?auto_25980 ) ) ( not ( = ?auto_25976 ?auto_25994 ) ) ( not ( = ?auto_25988 ?auto_25987 ) ) ( not ( = ?auto_25988 ?auto_25982 ) ) ( not ( = ?auto_25988 ?auto_25990 ) ) ( not ( = ?auto_25988 ?auto_25965 ) ) ( not ( = ?auto_25988 ?auto_25981 ) ) ( not ( = ?auto_25988 ?auto_25968 ) ) ( not ( = ?auto_25988 ?auto_25979 ) ) ( not ( = ?auto_25988 ?auto_25971 ) ) ( not ( = ?auto_25978 ?auto_25997 ) ) ( not ( = ?auto_25978 ?auto_25984 ) ) ( not ( = ?auto_25978 ?auto_25970 ) ) ( not ( = ?auto_25978 ?auto_25989 ) ) ( not ( = ?auto_25978 ?auto_25986 ) ) ( not ( = ?auto_25978 ?auto_25985 ) ) ( not ( = ?auto_25978 ?auto_25999 ) ) ( not ( = ?auto_25978 ?auto_25975 ) ) ( not ( = ?auto_25978 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25953 ) ) ( not ( = ?auto_25943 ?auto_25996 ) ) ( not ( = ?auto_25944 ?auto_25953 ) ) ( not ( = ?auto_25944 ?auto_25996 ) ) ( not ( = ?auto_25945 ?auto_25953 ) ) ( not ( = ?auto_25945 ?auto_25996 ) ) ( not ( = ?auto_25946 ?auto_25953 ) ) ( not ( = ?auto_25946 ?auto_25996 ) ) ( not ( = ?auto_25947 ?auto_25953 ) ) ( not ( = ?auto_25947 ?auto_25996 ) ) ( not ( = ?auto_25948 ?auto_25953 ) ) ( not ( = ?auto_25948 ?auto_25996 ) ) ( not ( = ?auto_25951 ?auto_25953 ) ) ( not ( = ?auto_25951 ?auto_25996 ) ) ( not ( = ?auto_25950 ?auto_25953 ) ) ( not ( = ?auto_25950 ?auto_25996 ) ) ( not ( = ?auto_25949 ?auto_25953 ) ) ( not ( = ?auto_25949 ?auto_25996 ) ) ( not ( = ?auto_25952 ?auto_25953 ) ) ( not ( = ?auto_25952 ?auto_25996 ) ) ( not ( = ?auto_25953 ?auto_25978 ) ) ( not ( = ?auto_25953 ?auto_25997 ) ) ( not ( = ?auto_25953 ?auto_25984 ) ) ( not ( = ?auto_25953 ?auto_25970 ) ) ( not ( = ?auto_25953 ?auto_25989 ) ) ( not ( = ?auto_25953 ?auto_25986 ) ) ( not ( = ?auto_25953 ?auto_25985 ) ) ( not ( = ?auto_25953 ?auto_25999 ) ) ( not ( = ?auto_25953 ?auto_25975 ) ) ( not ( = ?auto_25953 ?auto_25977 ) ) ( not ( = ?auto_25974 ?auto_25976 ) ) ( not ( = ?auto_25974 ?auto_25992 ) ) ( not ( = ?auto_25974 ?auto_25967 ) ) ( not ( = ?auto_25974 ?auto_25964 ) ) ( not ( = ?auto_25974 ?auto_25966 ) ) ( not ( = ?auto_25974 ?auto_25969 ) ) ( not ( = ?auto_25974 ?auto_25991 ) ) ( not ( = ?auto_25974 ?auto_25980 ) ) ( not ( = ?auto_25974 ?auto_25994 ) ) ( not ( = ?auto_25972 ?auto_25988 ) ) ( not ( = ?auto_25972 ?auto_25987 ) ) ( not ( = ?auto_25972 ?auto_25982 ) ) ( not ( = ?auto_25972 ?auto_25990 ) ) ( not ( = ?auto_25972 ?auto_25965 ) ) ( not ( = ?auto_25972 ?auto_25981 ) ) ( not ( = ?auto_25972 ?auto_25968 ) ) ( not ( = ?auto_25972 ?auto_25979 ) ) ( not ( = ?auto_25972 ?auto_25971 ) ) ( not ( = ?auto_25996 ?auto_25978 ) ) ( not ( = ?auto_25996 ?auto_25997 ) ) ( not ( = ?auto_25996 ?auto_25984 ) ) ( not ( = ?auto_25996 ?auto_25970 ) ) ( not ( = ?auto_25996 ?auto_25989 ) ) ( not ( = ?auto_25996 ?auto_25986 ) ) ( not ( = ?auto_25996 ?auto_25985 ) ) ( not ( = ?auto_25996 ?auto_25999 ) ) ( not ( = ?auto_25996 ?auto_25975 ) ) ( not ( = ?auto_25996 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25955 ) ) ( not ( = ?auto_25943 ?auto_25993 ) ) ( not ( = ?auto_25944 ?auto_25955 ) ) ( not ( = ?auto_25944 ?auto_25993 ) ) ( not ( = ?auto_25945 ?auto_25955 ) ) ( not ( = ?auto_25945 ?auto_25993 ) ) ( not ( = ?auto_25946 ?auto_25955 ) ) ( not ( = ?auto_25946 ?auto_25993 ) ) ( not ( = ?auto_25947 ?auto_25955 ) ) ( not ( = ?auto_25947 ?auto_25993 ) ) ( not ( = ?auto_25948 ?auto_25955 ) ) ( not ( = ?auto_25948 ?auto_25993 ) ) ( not ( = ?auto_25951 ?auto_25955 ) ) ( not ( = ?auto_25951 ?auto_25993 ) ) ( not ( = ?auto_25950 ?auto_25955 ) ) ( not ( = ?auto_25950 ?auto_25993 ) ) ( not ( = ?auto_25949 ?auto_25955 ) ) ( not ( = ?auto_25949 ?auto_25993 ) ) ( not ( = ?auto_25952 ?auto_25955 ) ) ( not ( = ?auto_25952 ?auto_25993 ) ) ( not ( = ?auto_25954 ?auto_25955 ) ) ( not ( = ?auto_25954 ?auto_25993 ) ) ( not ( = ?auto_25955 ?auto_25996 ) ) ( not ( = ?auto_25955 ?auto_25978 ) ) ( not ( = ?auto_25955 ?auto_25997 ) ) ( not ( = ?auto_25955 ?auto_25984 ) ) ( not ( = ?auto_25955 ?auto_25970 ) ) ( not ( = ?auto_25955 ?auto_25989 ) ) ( not ( = ?auto_25955 ?auto_25986 ) ) ( not ( = ?auto_25955 ?auto_25985 ) ) ( not ( = ?auto_25955 ?auto_25999 ) ) ( not ( = ?auto_25955 ?auto_25975 ) ) ( not ( = ?auto_25955 ?auto_25977 ) ) ( not ( = ?auto_25983 ?auto_25974 ) ) ( not ( = ?auto_25983 ?auto_25976 ) ) ( not ( = ?auto_25983 ?auto_25992 ) ) ( not ( = ?auto_25983 ?auto_25967 ) ) ( not ( = ?auto_25983 ?auto_25964 ) ) ( not ( = ?auto_25983 ?auto_25966 ) ) ( not ( = ?auto_25983 ?auto_25969 ) ) ( not ( = ?auto_25983 ?auto_25991 ) ) ( not ( = ?auto_25983 ?auto_25980 ) ) ( not ( = ?auto_25983 ?auto_25994 ) ) ( not ( = ?auto_25998 ?auto_25972 ) ) ( not ( = ?auto_25998 ?auto_25988 ) ) ( not ( = ?auto_25998 ?auto_25987 ) ) ( not ( = ?auto_25998 ?auto_25982 ) ) ( not ( = ?auto_25998 ?auto_25990 ) ) ( not ( = ?auto_25998 ?auto_25965 ) ) ( not ( = ?auto_25998 ?auto_25981 ) ) ( not ( = ?auto_25998 ?auto_25968 ) ) ( not ( = ?auto_25998 ?auto_25979 ) ) ( not ( = ?auto_25998 ?auto_25971 ) ) ( not ( = ?auto_25993 ?auto_25996 ) ) ( not ( = ?auto_25993 ?auto_25978 ) ) ( not ( = ?auto_25993 ?auto_25997 ) ) ( not ( = ?auto_25993 ?auto_25984 ) ) ( not ( = ?auto_25993 ?auto_25970 ) ) ( not ( = ?auto_25993 ?auto_25989 ) ) ( not ( = ?auto_25993 ?auto_25986 ) ) ( not ( = ?auto_25993 ?auto_25985 ) ) ( not ( = ?auto_25993 ?auto_25999 ) ) ( not ( = ?auto_25993 ?auto_25975 ) ) ( not ( = ?auto_25993 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25957 ) ) ( not ( = ?auto_25943 ?auto_25973 ) ) ( not ( = ?auto_25944 ?auto_25957 ) ) ( not ( = ?auto_25944 ?auto_25973 ) ) ( not ( = ?auto_25945 ?auto_25957 ) ) ( not ( = ?auto_25945 ?auto_25973 ) ) ( not ( = ?auto_25946 ?auto_25957 ) ) ( not ( = ?auto_25946 ?auto_25973 ) ) ( not ( = ?auto_25947 ?auto_25957 ) ) ( not ( = ?auto_25947 ?auto_25973 ) ) ( not ( = ?auto_25948 ?auto_25957 ) ) ( not ( = ?auto_25948 ?auto_25973 ) ) ( not ( = ?auto_25951 ?auto_25957 ) ) ( not ( = ?auto_25951 ?auto_25973 ) ) ( not ( = ?auto_25950 ?auto_25957 ) ) ( not ( = ?auto_25950 ?auto_25973 ) ) ( not ( = ?auto_25949 ?auto_25957 ) ) ( not ( = ?auto_25949 ?auto_25973 ) ) ( not ( = ?auto_25952 ?auto_25957 ) ) ( not ( = ?auto_25952 ?auto_25973 ) ) ( not ( = ?auto_25954 ?auto_25957 ) ) ( not ( = ?auto_25954 ?auto_25973 ) ) ( not ( = ?auto_25953 ?auto_25957 ) ) ( not ( = ?auto_25953 ?auto_25973 ) ) ( not ( = ?auto_25957 ?auto_25993 ) ) ( not ( = ?auto_25957 ?auto_25996 ) ) ( not ( = ?auto_25957 ?auto_25978 ) ) ( not ( = ?auto_25957 ?auto_25997 ) ) ( not ( = ?auto_25957 ?auto_25984 ) ) ( not ( = ?auto_25957 ?auto_25970 ) ) ( not ( = ?auto_25957 ?auto_25989 ) ) ( not ( = ?auto_25957 ?auto_25986 ) ) ( not ( = ?auto_25957 ?auto_25985 ) ) ( not ( = ?auto_25957 ?auto_25999 ) ) ( not ( = ?auto_25957 ?auto_25975 ) ) ( not ( = ?auto_25957 ?auto_25977 ) ) ( not ( = ?auto_26000 ?auto_25983 ) ) ( not ( = ?auto_26000 ?auto_25974 ) ) ( not ( = ?auto_26000 ?auto_25976 ) ) ( not ( = ?auto_26000 ?auto_25992 ) ) ( not ( = ?auto_26000 ?auto_25967 ) ) ( not ( = ?auto_26000 ?auto_25964 ) ) ( not ( = ?auto_26000 ?auto_25966 ) ) ( not ( = ?auto_26000 ?auto_25969 ) ) ( not ( = ?auto_26000 ?auto_25991 ) ) ( not ( = ?auto_26000 ?auto_25980 ) ) ( not ( = ?auto_26000 ?auto_25994 ) ) ( not ( = ?auto_25995 ?auto_25998 ) ) ( not ( = ?auto_25995 ?auto_25972 ) ) ( not ( = ?auto_25995 ?auto_25988 ) ) ( not ( = ?auto_25995 ?auto_25987 ) ) ( not ( = ?auto_25995 ?auto_25982 ) ) ( not ( = ?auto_25995 ?auto_25990 ) ) ( not ( = ?auto_25995 ?auto_25965 ) ) ( not ( = ?auto_25995 ?auto_25981 ) ) ( not ( = ?auto_25995 ?auto_25968 ) ) ( not ( = ?auto_25995 ?auto_25979 ) ) ( not ( = ?auto_25995 ?auto_25971 ) ) ( not ( = ?auto_25973 ?auto_25993 ) ) ( not ( = ?auto_25973 ?auto_25996 ) ) ( not ( = ?auto_25973 ?auto_25978 ) ) ( not ( = ?auto_25973 ?auto_25997 ) ) ( not ( = ?auto_25973 ?auto_25984 ) ) ( not ( = ?auto_25973 ?auto_25970 ) ) ( not ( = ?auto_25973 ?auto_25989 ) ) ( not ( = ?auto_25973 ?auto_25986 ) ) ( not ( = ?auto_25973 ?auto_25985 ) ) ( not ( = ?auto_25973 ?auto_25999 ) ) ( not ( = ?auto_25973 ?auto_25975 ) ) ( not ( = ?auto_25973 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25956 ) ) ( not ( = ?auto_25943 ?auto_25963 ) ) ( not ( = ?auto_25944 ?auto_25956 ) ) ( not ( = ?auto_25944 ?auto_25963 ) ) ( not ( = ?auto_25945 ?auto_25956 ) ) ( not ( = ?auto_25945 ?auto_25963 ) ) ( not ( = ?auto_25946 ?auto_25956 ) ) ( not ( = ?auto_25946 ?auto_25963 ) ) ( not ( = ?auto_25947 ?auto_25956 ) ) ( not ( = ?auto_25947 ?auto_25963 ) ) ( not ( = ?auto_25948 ?auto_25956 ) ) ( not ( = ?auto_25948 ?auto_25963 ) ) ( not ( = ?auto_25951 ?auto_25956 ) ) ( not ( = ?auto_25951 ?auto_25963 ) ) ( not ( = ?auto_25950 ?auto_25956 ) ) ( not ( = ?auto_25950 ?auto_25963 ) ) ( not ( = ?auto_25949 ?auto_25956 ) ) ( not ( = ?auto_25949 ?auto_25963 ) ) ( not ( = ?auto_25952 ?auto_25956 ) ) ( not ( = ?auto_25952 ?auto_25963 ) ) ( not ( = ?auto_25954 ?auto_25956 ) ) ( not ( = ?auto_25954 ?auto_25963 ) ) ( not ( = ?auto_25953 ?auto_25956 ) ) ( not ( = ?auto_25953 ?auto_25963 ) ) ( not ( = ?auto_25955 ?auto_25956 ) ) ( not ( = ?auto_25955 ?auto_25963 ) ) ( not ( = ?auto_25956 ?auto_25973 ) ) ( not ( = ?auto_25956 ?auto_25993 ) ) ( not ( = ?auto_25956 ?auto_25996 ) ) ( not ( = ?auto_25956 ?auto_25978 ) ) ( not ( = ?auto_25956 ?auto_25997 ) ) ( not ( = ?auto_25956 ?auto_25984 ) ) ( not ( = ?auto_25956 ?auto_25970 ) ) ( not ( = ?auto_25956 ?auto_25989 ) ) ( not ( = ?auto_25956 ?auto_25986 ) ) ( not ( = ?auto_25956 ?auto_25985 ) ) ( not ( = ?auto_25956 ?auto_25999 ) ) ( not ( = ?auto_25956 ?auto_25975 ) ) ( not ( = ?auto_25956 ?auto_25977 ) ) ( not ( = ?auto_25958 ?auto_26000 ) ) ( not ( = ?auto_25958 ?auto_25983 ) ) ( not ( = ?auto_25958 ?auto_25974 ) ) ( not ( = ?auto_25958 ?auto_25976 ) ) ( not ( = ?auto_25958 ?auto_25992 ) ) ( not ( = ?auto_25958 ?auto_25967 ) ) ( not ( = ?auto_25958 ?auto_25964 ) ) ( not ( = ?auto_25958 ?auto_25966 ) ) ( not ( = ?auto_25958 ?auto_25969 ) ) ( not ( = ?auto_25958 ?auto_25991 ) ) ( not ( = ?auto_25958 ?auto_25980 ) ) ( not ( = ?auto_25958 ?auto_25994 ) ) ( not ( = ?auto_25960 ?auto_25995 ) ) ( not ( = ?auto_25960 ?auto_25998 ) ) ( not ( = ?auto_25960 ?auto_25972 ) ) ( not ( = ?auto_25960 ?auto_25988 ) ) ( not ( = ?auto_25960 ?auto_25987 ) ) ( not ( = ?auto_25960 ?auto_25982 ) ) ( not ( = ?auto_25960 ?auto_25990 ) ) ( not ( = ?auto_25960 ?auto_25965 ) ) ( not ( = ?auto_25960 ?auto_25981 ) ) ( not ( = ?auto_25960 ?auto_25968 ) ) ( not ( = ?auto_25960 ?auto_25979 ) ) ( not ( = ?auto_25960 ?auto_25971 ) ) ( not ( = ?auto_25963 ?auto_25973 ) ) ( not ( = ?auto_25963 ?auto_25993 ) ) ( not ( = ?auto_25963 ?auto_25996 ) ) ( not ( = ?auto_25963 ?auto_25978 ) ) ( not ( = ?auto_25963 ?auto_25997 ) ) ( not ( = ?auto_25963 ?auto_25984 ) ) ( not ( = ?auto_25963 ?auto_25970 ) ) ( not ( = ?auto_25963 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25986 ) ) ( not ( = ?auto_25963 ?auto_25985 ) ) ( not ( = ?auto_25963 ?auto_25999 ) ) ( not ( = ?auto_25963 ?auto_25975 ) ) ( not ( = ?auto_25963 ?auto_25977 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25943 ?auto_25944 ?auto_25945 ?auto_25946 ?auto_25947 ?auto_25948 ?auto_25951 ?auto_25950 ?auto_25949 ?auto_25952 ?auto_25954 ?auto_25953 ?auto_25955 ?auto_25957 )
      ( MAKE-1CRATE ?auto_25957 ?auto_25956 )
      ( MAKE-14CRATE-VERIFY ?auto_25943 ?auto_25944 ?auto_25945 ?auto_25946 ?auto_25947 ?auto_25948 ?auto_25951 ?auto_25950 ?auto_25949 ?auto_25952 ?auto_25954 ?auto_25953 ?auto_25955 ?auto_25957 ?auto_25956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26003 - SURFACE
      ?auto_26004 - SURFACE
    )
    :vars
    (
      ?auto_26005 - HOIST
      ?auto_26006 - PLACE
      ?auto_26008 - PLACE
      ?auto_26009 - HOIST
      ?auto_26010 - SURFACE
      ?auto_26007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26005 ?auto_26006 ) ( SURFACE-AT ?auto_26003 ?auto_26006 ) ( CLEAR ?auto_26003 ) ( IS-CRATE ?auto_26004 ) ( AVAILABLE ?auto_26005 ) ( not ( = ?auto_26008 ?auto_26006 ) ) ( HOIST-AT ?auto_26009 ?auto_26008 ) ( AVAILABLE ?auto_26009 ) ( SURFACE-AT ?auto_26004 ?auto_26008 ) ( ON ?auto_26004 ?auto_26010 ) ( CLEAR ?auto_26004 ) ( TRUCK-AT ?auto_26007 ?auto_26006 ) ( not ( = ?auto_26003 ?auto_26004 ) ) ( not ( = ?auto_26003 ?auto_26010 ) ) ( not ( = ?auto_26004 ?auto_26010 ) ) ( not ( = ?auto_26005 ?auto_26009 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26007 ?auto_26006 ?auto_26008 )
      ( !LIFT ?auto_26009 ?auto_26004 ?auto_26010 ?auto_26008 )
      ( !LOAD ?auto_26009 ?auto_26004 ?auto_26007 ?auto_26008 )
      ( !DRIVE ?auto_26007 ?auto_26008 ?auto_26006 )
      ( !UNLOAD ?auto_26005 ?auto_26004 ?auto_26007 ?auto_26006 )
      ( !DROP ?auto_26005 ?auto_26004 ?auto_26003 ?auto_26006 )
      ( MAKE-1CRATE-VERIFY ?auto_26003 ?auto_26004 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26027 - SURFACE
      ?auto_26028 - SURFACE
      ?auto_26029 - SURFACE
      ?auto_26030 - SURFACE
      ?auto_26031 - SURFACE
      ?auto_26032 - SURFACE
      ?auto_26035 - SURFACE
      ?auto_26034 - SURFACE
      ?auto_26033 - SURFACE
      ?auto_26036 - SURFACE
      ?auto_26038 - SURFACE
      ?auto_26037 - SURFACE
      ?auto_26039 - SURFACE
      ?auto_26041 - SURFACE
      ?auto_26040 - SURFACE
      ?auto_26042 - SURFACE
    )
    :vars
    (
      ?auto_26046 - HOIST
      ?auto_26048 - PLACE
      ?auto_26045 - PLACE
      ?auto_26047 - HOIST
      ?auto_26043 - SURFACE
      ?auto_26080 - PLACE
      ?auto_26049 - HOIST
      ?auto_26085 - SURFACE
      ?auto_26074 - PLACE
      ?auto_26083 - HOIST
      ?auto_26056 - SURFACE
      ?auto_26063 - PLACE
      ?auto_26088 - HOIST
      ?auto_26059 - SURFACE
      ?auto_26064 - PLACE
      ?auto_26055 - HOIST
      ?auto_26051 - SURFACE
      ?auto_26058 - PLACE
      ?auto_26061 - HOIST
      ?auto_26066 - SURFACE
      ?auto_26081 - PLACE
      ?auto_26079 - HOIST
      ?auto_26087 - SURFACE
      ?auto_26076 - PLACE
      ?auto_26052 - HOIST
      ?auto_26077 - SURFACE
      ?auto_26050 - PLACE
      ?auto_26073 - HOIST
      ?auto_26054 - SURFACE
      ?auto_26053 - PLACE
      ?auto_26060 - HOIST
      ?auto_26086 - SURFACE
      ?auto_26057 - PLACE
      ?auto_26071 - HOIST
      ?auto_26078 - SURFACE
      ?auto_26069 - PLACE
      ?auto_26068 - HOIST
      ?auto_26067 - SURFACE
      ?auto_26072 - SURFACE
      ?auto_26084 - PLACE
      ?auto_26075 - HOIST
      ?auto_26082 - SURFACE
      ?auto_26065 - PLACE
      ?auto_26062 - HOIST
      ?auto_26070 - SURFACE
      ?auto_26044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26046 ?auto_26048 ) ( IS-CRATE ?auto_26042 ) ( not ( = ?auto_26045 ?auto_26048 ) ) ( HOIST-AT ?auto_26047 ?auto_26045 ) ( AVAILABLE ?auto_26047 ) ( SURFACE-AT ?auto_26042 ?auto_26045 ) ( ON ?auto_26042 ?auto_26043 ) ( CLEAR ?auto_26042 ) ( not ( = ?auto_26040 ?auto_26042 ) ) ( not ( = ?auto_26040 ?auto_26043 ) ) ( not ( = ?auto_26042 ?auto_26043 ) ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( IS-CRATE ?auto_26040 ) ( not ( = ?auto_26080 ?auto_26048 ) ) ( HOIST-AT ?auto_26049 ?auto_26080 ) ( AVAILABLE ?auto_26049 ) ( SURFACE-AT ?auto_26040 ?auto_26080 ) ( ON ?auto_26040 ?auto_26085 ) ( CLEAR ?auto_26040 ) ( not ( = ?auto_26041 ?auto_26040 ) ) ( not ( = ?auto_26041 ?auto_26085 ) ) ( not ( = ?auto_26040 ?auto_26085 ) ) ( not ( = ?auto_26046 ?auto_26049 ) ) ( IS-CRATE ?auto_26041 ) ( not ( = ?auto_26074 ?auto_26048 ) ) ( HOIST-AT ?auto_26083 ?auto_26074 ) ( AVAILABLE ?auto_26083 ) ( SURFACE-AT ?auto_26041 ?auto_26074 ) ( ON ?auto_26041 ?auto_26056 ) ( CLEAR ?auto_26041 ) ( not ( = ?auto_26039 ?auto_26041 ) ) ( not ( = ?auto_26039 ?auto_26056 ) ) ( not ( = ?auto_26041 ?auto_26056 ) ) ( not ( = ?auto_26046 ?auto_26083 ) ) ( IS-CRATE ?auto_26039 ) ( not ( = ?auto_26063 ?auto_26048 ) ) ( HOIST-AT ?auto_26088 ?auto_26063 ) ( AVAILABLE ?auto_26088 ) ( SURFACE-AT ?auto_26039 ?auto_26063 ) ( ON ?auto_26039 ?auto_26059 ) ( CLEAR ?auto_26039 ) ( not ( = ?auto_26037 ?auto_26039 ) ) ( not ( = ?auto_26037 ?auto_26059 ) ) ( not ( = ?auto_26039 ?auto_26059 ) ) ( not ( = ?auto_26046 ?auto_26088 ) ) ( IS-CRATE ?auto_26037 ) ( not ( = ?auto_26064 ?auto_26048 ) ) ( HOIST-AT ?auto_26055 ?auto_26064 ) ( AVAILABLE ?auto_26055 ) ( SURFACE-AT ?auto_26037 ?auto_26064 ) ( ON ?auto_26037 ?auto_26051 ) ( CLEAR ?auto_26037 ) ( not ( = ?auto_26038 ?auto_26037 ) ) ( not ( = ?auto_26038 ?auto_26051 ) ) ( not ( = ?auto_26037 ?auto_26051 ) ) ( not ( = ?auto_26046 ?auto_26055 ) ) ( IS-CRATE ?auto_26038 ) ( not ( = ?auto_26058 ?auto_26048 ) ) ( HOIST-AT ?auto_26061 ?auto_26058 ) ( AVAILABLE ?auto_26061 ) ( SURFACE-AT ?auto_26038 ?auto_26058 ) ( ON ?auto_26038 ?auto_26066 ) ( CLEAR ?auto_26038 ) ( not ( = ?auto_26036 ?auto_26038 ) ) ( not ( = ?auto_26036 ?auto_26066 ) ) ( not ( = ?auto_26038 ?auto_26066 ) ) ( not ( = ?auto_26046 ?auto_26061 ) ) ( IS-CRATE ?auto_26036 ) ( not ( = ?auto_26081 ?auto_26048 ) ) ( HOIST-AT ?auto_26079 ?auto_26081 ) ( AVAILABLE ?auto_26079 ) ( SURFACE-AT ?auto_26036 ?auto_26081 ) ( ON ?auto_26036 ?auto_26087 ) ( CLEAR ?auto_26036 ) ( not ( = ?auto_26033 ?auto_26036 ) ) ( not ( = ?auto_26033 ?auto_26087 ) ) ( not ( = ?auto_26036 ?auto_26087 ) ) ( not ( = ?auto_26046 ?auto_26079 ) ) ( IS-CRATE ?auto_26033 ) ( not ( = ?auto_26076 ?auto_26048 ) ) ( HOIST-AT ?auto_26052 ?auto_26076 ) ( AVAILABLE ?auto_26052 ) ( SURFACE-AT ?auto_26033 ?auto_26076 ) ( ON ?auto_26033 ?auto_26077 ) ( CLEAR ?auto_26033 ) ( not ( = ?auto_26034 ?auto_26033 ) ) ( not ( = ?auto_26034 ?auto_26077 ) ) ( not ( = ?auto_26033 ?auto_26077 ) ) ( not ( = ?auto_26046 ?auto_26052 ) ) ( IS-CRATE ?auto_26034 ) ( not ( = ?auto_26050 ?auto_26048 ) ) ( HOIST-AT ?auto_26073 ?auto_26050 ) ( AVAILABLE ?auto_26073 ) ( SURFACE-AT ?auto_26034 ?auto_26050 ) ( ON ?auto_26034 ?auto_26054 ) ( CLEAR ?auto_26034 ) ( not ( = ?auto_26035 ?auto_26034 ) ) ( not ( = ?auto_26035 ?auto_26054 ) ) ( not ( = ?auto_26034 ?auto_26054 ) ) ( not ( = ?auto_26046 ?auto_26073 ) ) ( IS-CRATE ?auto_26035 ) ( not ( = ?auto_26053 ?auto_26048 ) ) ( HOIST-AT ?auto_26060 ?auto_26053 ) ( AVAILABLE ?auto_26060 ) ( SURFACE-AT ?auto_26035 ?auto_26053 ) ( ON ?auto_26035 ?auto_26086 ) ( CLEAR ?auto_26035 ) ( not ( = ?auto_26032 ?auto_26035 ) ) ( not ( = ?auto_26032 ?auto_26086 ) ) ( not ( = ?auto_26035 ?auto_26086 ) ) ( not ( = ?auto_26046 ?auto_26060 ) ) ( IS-CRATE ?auto_26032 ) ( not ( = ?auto_26057 ?auto_26048 ) ) ( HOIST-AT ?auto_26071 ?auto_26057 ) ( SURFACE-AT ?auto_26032 ?auto_26057 ) ( ON ?auto_26032 ?auto_26078 ) ( CLEAR ?auto_26032 ) ( not ( = ?auto_26031 ?auto_26032 ) ) ( not ( = ?auto_26031 ?auto_26078 ) ) ( not ( = ?auto_26032 ?auto_26078 ) ) ( not ( = ?auto_26046 ?auto_26071 ) ) ( IS-CRATE ?auto_26031 ) ( not ( = ?auto_26069 ?auto_26048 ) ) ( HOIST-AT ?auto_26068 ?auto_26069 ) ( AVAILABLE ?auto_26068 ) ( SURFACE-AT ?auto_26031 ?auto_26069 ) ( ON ?auto_26031 ?auto_26067 ) ( CLEAR ?auto_26031 ) ( not ( = ?auto_26030 ?auto_26031 ) ) ( not ( = ?auto_26030 ?auto_26067 ) ) ( not ( = ?auto_26031 ?auto_26067 ) ) ( not ( = ?auto_26046 ?auto_26068 ) ) ( IS-CRATE ?auto_26030 ) ( AVAILABLE ?auto_26071 ) ( SURFACE-AT ?auto_26030 ?auto_26057 ) ( ON ?auto_26030 ?auto_26072 ) ( CLEAR ?auto_26030 ) ( not ( = ?auto_26029 ?auto_26030 ) ) ( not ( = ?auto_26029 ?auto_26072 ) ) ( not ( = ?auto_26030 ?auto_26072 ) ) ( IS-CRATE ?auto_26029 ) ( not ( = ?auto_26084 ?auto_26048 ) ) ( HOIST-AT ?auto_26075 ?auto_26084 ) ( AVAILABLE ?auto_26075 ) ( SURFACE-AT ?auto_26029 ?auto_26084 ) ( ON ?auto_26029 ?auto_26082 ) ( CLEAR ?auto_26029 ) ( not ( = ?auto_26028 ?auto_26029 ) ) ( not ( = ?auto_26028 ?auto_26082 ) ) ( not ( = ?auto_26029 ?auto_26082 ) ) ( not ( = ?auto_26046 ?auto_26075 ) ) ( SURFACE-AT ?auto_26027 ?auto_26048 ) ( CLEAR ?auto_26027 ) ( IS-CRATE ?auto_26028 ) ( AVAILABLE ?auto_26046 ) ( not ( = ?auto_26065 ?auto_26048 ) ) ( HOIST-AT ?auto_26062 ?auto_26065 ) ( AVAILABLE ?auto_26062 ) ( SURFACE-AT ?auto_26028 ?auto_26065 ) ( ON ?auto_26028 ?auto_26070 ) ( CLEAR ?auto_26028 ) ( TRUCK-AT ?auto_26044 ?auto_26048 ) ( not ( = ?auto_26027 ?auto_26028 ) ) ( not ( = ?auto_26027 ?auto_26070 ) ) ( not ( = ?auto_26028 ?auto_26070 ) ) ( not ( = ?auto_26046 ?auto_26062 ) ) ( not ( = ?auto_26027 ?auto_26029 ) ) ( not ( = ?auto_26027 ?auto_26082 ) ) ( not ( = ?auto_26029 ?auto_26070 ) ) ( not ( = ?auto_26084 ?auto_26065 ) ) ( not ( = ?auto_26075 ?auto_26062 ) ) ( not ( = ?auto_26082 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26030 ) ) ( not ( = ?auto_26027 ?auto_26072 ) ) ( not ( = ?auto_26028 ?auto_26030 ) ) ( not ( = ?auto_26028 ?auto_26072 ) ) ( not ( = ?auto_26030 ?auto_26082 ) ) ( not ( = ?auto_26030 ?auto_26070 ) ) ( not ( = ?auto_26057 ?auto_26084 ) ) ( not ( = ?auto_26057 ?auto_26065 ) ) ( not ( = ?auto_26071 ?auto_26075 ) ) ( not ( = ?auto_26071 ?auto_26062 ) ) ( not ( = ?auto_26072 ?auto_26082 ) ) ( not ( = ?auto_26072 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26031 ) ) ( not ( = ?auto_26027 ?auto_26067 ) ) ( not ( = ?auto_26028 ?auto_26031 ) ) ( not ( = ?auto_26028 ?auto_26067 ) ) ( not ( = ?auto_26029 ?auto_26031 ) ) ( not ( = ?auto_26029 ?auto_26067 ) ) ( not ( = ?auto_26031 ?auto_26072 ) ) ( not ( = ?auto_26031 ?auto_26082 ) ) ( not ( = ?auto_26031 ?auto_26070 ) ) ( not ( = ?auto_26069 ?auto_26057 ) ) ( not ( = ?auto_26069 ?auto_26084 ) ) ( not ( = ?auto_26069 ?auto_26065 ) ) ( not ( = ?auto_26068 ?auto_26071 ) ) ( not ( = ?auto_26068 ?auto_26075 ) ) ( not ( = ?auto_26068 ?auto_26062 ) ) ( not ( = ?auto_26067 ?auto_26072 ) ) ( not ( = ?auto_26067 ?auto_26082 ) ) ( not ( = ?auto_26067 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26032 ) ) ( not ( = ?auto_26027 ?auto_26078 ) ) ( not ( = ?auto_26028 ?auto_26032 ) ) ( not ( = ?auto_26028 ?auto_26078 ) ) ( not ( = ?auto_26029 ?auto_26032 ) ) ( not ( = ?auto_26029 ?auto_26078 ) ) ( not ( = ?auto_26030 ?auto_26032 ) ) ( not ( = ?auto_26030 ?auto_26078 ) ) ( not ( = ?auto_26032 ?auto_26067 ) ) ( not ( = ?auto_26032 ?auto_26072 ) ) ( not ( = ?auto_26032 ?auto_26082 ) ) ( not ( = ?auto_26032 ?auto_26070 ) ) ( not ( = ?auto_26078 ?auto_26067 ) ) ( not ( = ?auto_26078 ?auto_26072 ) ) ( not ( = ?auto_26078 ?auto_26082 ) ) ( not ( = ?auto_26078 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26035 ) ) ( not ( = ?auto_26027 ?auto_26086 ) ) ( not ( = ?auto_26028 ?auto_26035 ) ) ( not ( = ?auto_26028 ?auto_26086 ) ) ( not ( = ?auto_26029 ?auto_26035 ) ) ( not ( = ?auto_26029 ?auto_26086 ) ) ( not ( = ?auto_26030 ?auto_26035 ) ) ( not ( = ?auto_26030 ?auto_26086 ) ) ( not ( = ?auto_26031 ?auto_26035 ) ) ( not ( = ?auto_26031 ?auto_26086 ) ) ( not ( = ?auto_26035 ?auto_26078 ) ) ( not ( = ?auto_26035 ?auto_26067 ) ) ( not ( = ?auto_26035 ?auto_26072 ) ) ( not ( = ?auto_26035 ?auto_26082 ) ) ( not ( = ?auto_26035 ?auto_26070 ) ) ( not ( = ?auto_26053 ?auto_26057 ) ) ( not ( = ?auto_26053 ?auto_26069 ) ) ( not ( = ?auto_26053 ?auto_26084 ) ) ( not ( = ?auto_26053 ?auto_26065 ) ) ( not ( = ?auto_26060 ?auto_26071 ) ) ( not ( = ?auto_26060 ?auto_26068 ) ) ( not ( = ?auto_26060 ?auto_26075 ) ) ( not ( = ?auto_26060 ?auto_26062 ) ) ( not ( = ?auto_26086 ?auto_26078 ) ) ( not ( = ?auto_26086 ?auto_26067 ) ) ( not ( = ?auto_26086 ?auto_26072 ) ) ( not ( = ?auto_26086 ?auto_26082 ) ) ( not ( = ?auto_26086 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26034 ) ) ( not ( = ?auto_26027 ?auto_26054 ) ) ( not ( = ?auto_26028 ?auto_26034 ) ) ( not ( = ?auto_26028 ?auto_26054 ) ) ( not ( = ?auto_26029 ?auto_26034 ) ) ( not ( = ?auto_26029 ?auto_26054 ) ) ( not ( = ?auto_26030 ?auto_26034 ) ) ( not ( = ?auto_26030 ?auto_26054 ) ) ( not ( = ?auto_26031 ?auto_26034 ) ) ( not ( = ?auto_26031 ?auto_26054 ) ) ( not ( = ?auto_26032 ?auto_26034 ) ) ( not ( = ?auto_26032 ?auto_26054 ) ) ( not ( = ?auto_26034 ?auto_26086 ) ) ( not ( = ?auto_26034 ?auto_26078 ) ) ( not ( = ?auto_26034 ?auto_26067 ) ) ( not ( = ?auto_26034 ?auto_26072 ) ) ( not ( = ?auto_26034 ?auto_26082 ) ) ( not ( = ?auto_26034 ?auto_26070 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26057 ) ) ( not ( = ?auto_26050 ?auto_26069 ) ) ( not ( = ?auto_26050 ?auto_26084 ) ) ( not ( = ?auto_26050 ?auto_26065 ) ) ( not ( = ?auto_26073 ?auto_26060 ) ) ( not ( = ?auto_26073 ?auto_26071 ) ) ( not ( = ?auto_26073 ?auto_26068 ) ) ( not ( = ?auto_26073 ?auto_26075 ) ) ( not ( = ?auto_26073 ?auto_26062 ) ) ( not ( = ?auto_26054 ?auto_26086 ) ) ( not ( = ?auto_26054 ?auto_26078 ) ) ( not ( = ?auto_26054 ?auto_26067 ) ) ( not ( = ?auto_26054 ?auto_26072 ) ) ( not ( = ?auto_26054 ?auto_26082 ) ) ( not ( = ?auto_26054 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26033 ) ) ( not ( = ?auto_26027 ?auto_26077 ) ) ( not ( = ?auto_26028 ?auto_26033 ) ) ( not ( = ?auto_26028 ?auto_26077 ) ) ( not ( = ?auto_26029 ?auto_26033 ) ) ( not ( = ?auto_26029 ?auto_26077 ) ) ( not ( = ?auto_26030 ?auto_26033 ) ) ( not ( = ?auto_26030 ?auto_26077 ) ) ( not ( = ?auto_26031 ?auto_26033 ) ) ( not ( = ?auto_26031 ?auto_26077 ) ) ( not ( = ?auto_26032 ?auto_26033 ) ) ( not ( = ?auto_26032 ?auto_26077 ) ) ( not ( = ?auto_26035 ?auto_26033 ) ) ( not ( = ?auto_26035 ?auto_26077 ) ) ( not ( = ?auto_26033 ?auto_26054 ) ) ( not ( = ?auto_26033 ?auto_26086 ) ) ( not ( = ?auto_26033 ?auto_26078 ) ) ( not ( = ?auto_26033 ?auto_26067 ) ) ( not ( = ?auto_26033 ?auto_26072 ) ) ( not ( = ?auto_26033 ?auto_26082 ) ) ( not ( = ?auto_26033 ?auto_26070 ) ) ( not ( = ?auto_26076 ?auto_26050 ) ) ( not ( = ?auto_26076 ?auto_26053 ) ) ( not ( = ?auto_26076 ?auto_26057 ) ) ( not ( = ?auto_26076 ?auto_26069 ) ) ( not ( = ?auto_26076 ?auto_26084 ) ) ( not ( = ?auto_26076 ?auto_26065 ) ) ( not ( = ?auto_26052 ?auto_26073 ) ) ( not ( = ?auto_26052 ?auto_26060 ) ) ( not ( = ?auto_26052 ?auto_26071 ) ) ( not ( = ?auto_26052 ?auto_26068 ) ) ( not ( = ?auto_26052 ?auto_26075 ) ) ( not ( = ?auto_26052 ?auto_26062 ) ) ( not ( = ?auto_26077 ?auto_26054 ) ) ( not ( = ?auto_26077 ?auto_26086 ) ) ( not ( = ?auto_26077 ?auto_26078 ) ) ( not ( = ?auto_26077 ?auto_26067 ) ) ( not ( = ?auto_26077 ?auto_26072 ) ) ( not ( = ?auto_26077 ?auto_26082 ) ) ( not ( = ?auto_26077 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26036 ) ) ( not ( = ?auto_26027 ?auto_26087 ) ) ( not ( = ?auto_26028 ?auto_26036 ) ) ( not ( = ?auto_26028 ?auto_26087 ) ) ( not ( = ?auto_26029 ?auto_26036 ) ) ( not ( = ?auto_26029 ?auto_26087 ) ) ( not ( = ?auto_26030 ?auto_26036 ) ) ( not ( = ?auto_26030 ?auto_26087 ) ) ( not ( = ?auto_26031 ?auto_26036 ) ) ( not ( = ?auto_26031 ?auto_26087 ) ) ( not ( = ?auto_26032 ?auto_26036 ) ) ( not ( = ?auto_26032 ?auto_26087 ) ) ( not ( = ?auto_26035 ?auto_26036 ) ) ( not ( = ?auto_26035 ?auto_26087 ) ) ( not ( = ?auto_26034 ?auto_26036 ) ) ( not ( = ?auto_26034 ?auto_26087 ) ) ( not ( = ?auto_26036 ?auto_26077 ) ) ( not ( = ?auto_26036 ?auto_26054 ) ) ( not ( = ?auto_26036 ?auto_26086 ) ) ( not ( = ?auto_26036 ?auto_26078 ) ) ( not ( = ?auto_26036 ?auto_26067 ) ) ( not ( = ?auto_26036 ?auto_26072 ) ) ( not ( = ?auto_26036 ?auto_26082 ) ) ( not ( = ?auto_26036 ?auto_26070 ) ) ( not ( = ?auto_26081 ?auto_26076 ) ) ( not ( = ?auto_26081 ?auto_26050 ) ) ( not ( = ?auto_26081 ?auto_26053 ) ) ( not ( = ?auto_26081 ?auto_26057 ) ) ( not ( = ?auto_26081 ?auto_26069 ) ) ( not ( = ?auto_26081 ?auto_26084 ) ) ( not ( = ?auto_26081 ?auto_26065 ) ) ( not ( = ?auto_26079 ?auto_26052 ) ) ( not ( = ?auto_26079 ?auto_26073 ) ) ( not ( = ?auto_26079 ?auto_26060 ) ) ( not ( = ?auto_26079 ?auto_26071 ) ) ( not ( = ?auto_26079 ?auto_26068 ) ) ( not ( = ?auto_26079 ?auto_26075 ) ) ( not ( = ?auto_26079 ?auto_26062 ) ) ( not ( = ?auto_26087 ?auto_26077 ) ) ( not ( = ?auto_26087 ?auto_26054 ) ) ( not ( = ?auto_26087 ?auto_26086 ) ) ( not ( = ?auto_26087 ?auto_26078 ) ) ( not ( = ?auto_26087 ?auto_26067 ) ) ( not ( = ?auto_26087 ?auto_26072 ) ) ( not ( = ?auto_26087 ?auto_26082 ) ) ( not ( = ?auto_26087 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26038 ) ) ( not ( = ?auto_26027 ?auto_26066 ) ) ( not ( = ?auto_26028 ?auto_26038 ) ) ( not ( = ?auto_26028 ?auto_26066 ) ) ( not ( = ?auto_26029 ?auto_26038 ) ) ( not ( = ?auto_26029 ?auto_26066 ) ) ( not ( = ?auto_26030 ?auto_26038 ) ) ( not ( = ?auto_26030 ?auto_26066 ) ) ( not ( = ?auto_26031 ?auto_26038 ) ) ( not ( = ?auto_26031 ?auto_26066 ) ) ( not ( = ?auto_26032 ?auto_26038 ) ) ( not ( = ?auto_26032 ?auto_26066 ) ) ( not ( = ?auto_26035 ?auto_26038 ) ) ( not ( = ?auto_26035 ?auto_26066 ) ) ( not ( = ?auto_26034 ?auto_26038 ) ) ( not ( = ?auto_26034 ?auto_26066 ) ) ( not ( = ?auto_26033 ?auto_26038 ) ) ( not ( = ?auto_26033 ?auto_26066 ) ) ( not ( = ?auto_26038 ?auto_26087 ) ) ( not ( = ?auto_26038 ?auto_26077 ) ) ( not ( = ?auto_26038 ?auto_26054 ) ) ( not ( = ?auto_26038 ?auto_26086 ) ) ( not ( = ?auto_26038 ?auto_26078 ) ) ( not ( = ?auto_26038 ?auto_26067 ) ) ( not ( = ?auto_26038 ?auto_26072 ) ) ( not ( = ?auto_26038 ?auto_26082 ) ) ( not ( = ?auto_26038 ?auto_26070 ) ) ( not ( = ?auto_26058 ?auto_26081 ) ) ( not ( = ?auto_26058 ?auto_26076 ) ) ( not ( = ?auto_26058 ?auto_26050 ) ) ( not ( = ?auto_26058 ?auto_26053 ) ) ( not ( = ?auto_26058 ?auto_26057 ) ) ( not ( = ?auto_26058 ?auto_26069 ) ) ( not ( = ?auto_26058 ?auto_26084 ) ) ( not ( = ?auto_26058 ?auto_26065 ) ) ( not ( = ?auto_26061 ?auto_26079 ) ) ( not ( = ?auto_26061 ?auto_26052 ) ) ( not ( = ?auto_26061 ?auto_26073 ) ) ( not ( = ?auto_26061 ?auto_26060 ) ) ( not ( = ?auto_26061 ?auto_26071 ) ) ( not ( = ?auto_26061 ?auto_26068 ) ) ( not ( = ?auto_26061 ?auto_26075 ) ) ( not ( = ?auto_26061 ?auto_26062 ) ) ( not ( = ?auto_26066 ?auto_26087 ) ) ( not ( = ?auto_26066 ?auto_26077 ) ) ( not ( = ?auto_26066 ?auto_26054 ) ) ( not ( = ?auto_26066 ?auto_26086 ) ) ( not ( = ?auto_26066 ?auto_26078 ) ) ( not ( = ?auto_26066 ?auto_26067 ) ) ( not ( = ?auto_26066 ?auto_26072 ) ) ( not ( = ?auto_26066 ?auto_26082 ) ) ( not ( = ?auto_26066 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26037 ) ) ( not ( = ?auto_26027 ?auto_26051 ) ) ( not ( = ?auto_26028 ?auto_26037 ) ) ( not ( = ?auto_26028 ?auto_26051 ) ) ( not ( = ?auto_26029 ?auto_26037 ) ) ( not ( = ?auto_26029 ?auto_26051 ) ) ( not ( = ?auto_26030 ?auto_26037 ) ) ( not ( = ?auto_26030 ?auto_26051 ) ) ( not ( = ?auto_26031 ?auto_26037 ) ) ( not ( = ?auto_26031 ?auto_26051 ) ) ( not ( = ?auto_26032 ?auto_26037 ) ) ( not ( = ?auto_26032 ?auto_26051 ) ) ( not ( = ?auto_26035 ?auto_26037 ) ) ( not ( = ?auto_26035 ?auto_26051 ) ) ( not ( = ?auto_26034 ?auto_26037 ) ) ( not ( = ?auto_26034 ?auto_26051 ) ) ( not ( = ?auto_26033 ?auto_26037 ) ) ( not ( = ?auto_26033 ?auto_26051 ) ) ( not ( = ?auto_26036 ?auto_26037 ) ) ( not ( = ?auto_26036 ?auto_26051 ) ) ( not ( = ?auto_26037 ?auto_26066 ) ) ( not ( = ?auto_26037 ?auto_26087 ) ) ( not ( = ?auto_26037 ?auto_26077 ) ) ( not ( = ?auto_26037 ?auto_26054 ) ) ( not ( = ?auto_26037 ?auto_26086 ) ) ( not ( = ?auto_26037 ?auto_26078 ) ) ( not ( = ?auto_26037 ?auto_26067 ) ) ( not ( = ?auto_26037 ?auto_26072 ) ) ( not ( = ?auto_26037 ?auto_26082 ) ) ( not ( = ?auto_26037 ?auto_26070 ) ) ( not ( = ?auto_26064 ?auto_26058 ) ) ( not ( = ?auto_26064 ?auto_26081 ) ) ( not ( = ?auto_26064 ?auto_26076 ) ) ( not ( = ?auto_26064 ?auto_26050 ) ) ( not ( = ?auto_26064 ?auto_26053 ) ) ( not ( = ?auto_26064 ?auto_26057 ) ) ( not ( = ?auto_26064 ?auto_26069 ) ) ( not ( = ?auto_26064 ?auto_26084 ) ) ( not ( = ?auto_26064 ?auto_26065 ) ) ( not ( = ?auto_26055 ?auto_26061 ) ) ( not ( = ?auto_26055 ?auto_26079 ) ) ( not ( = ?auto_26055 ?auto_26052 ) ) ( not ( = ?auto_26055 ?auto_26073 ) ) ( not ( = ?auto_26055 ?auto_26060 ) ) ( not ( = ?auto_26055 ?auto_26071 ) ) ( not ( = ?auto_26055 ?auto_26068 ) ) ( not ( = ?auto_26055 ?auto_26075 ) ) ( not ( = ?auto_26055 ?auto_26062 ) ) ( not ( = ?auto_26051 ?auto_26066 ) ) ( not ( = ?auto_26051 ?auto_26087 ) ) ( not ( = ?auto_26051 ?auto_26077 ) ) ( not ( = ?auto_26051 ?auto_26054 ) ) ( not ( = ?auto_26051 ?auto_26086 ) ) ( not ( = ?auto_26051 ?auto_26078 ) ) ( not ( = ?auto_26051 ?auto_26067 ) ) ( not ( = ?auto_26051 ?auto_26072 ) ) ( not ( = ?auto_26051 ?auto_26082 ) ) ( not ( = ?auto_26051 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26039 ) ) ( not ( = ?auto_26027 ?auto_26059 ) ) ( not ( = ?auto_26028 ?auto_26039 ) ) ( not ( = ?auto_26028 ?auto_26059 ) ) ( not ( = ?auto_26029 ?auto_26039 ) ) ( not ( = ?auto_26029 ?auto_26059 ) ) ( not ( = ?auto_26030 ?auto_26039 ) ) ( not ( = ?auto_26030 ?auto_26059 ) ) ( not ( = ?auto_26031 ?auto_26039 ) ) ( not ( = ?auto_26031 ?auto_26059 ) ) ( not ( = ?auto_26032 ?auto_26039 ) ) ( not ( = ?auto_26032 ?auto_26059 ) ) ( not ( = ?auto_26035 ?auto_26039 ) ) ( not ( = ?auto_26035 ?auto_26059 ) ) ( not ( = ?auto_26034 ?auto_26039 ) ) ( not ( = ?auto_26034 ?auto_26059 ) ) ( not ( = ?auto_26033 ?auto_26039 ) ) ( not ( = ?auto_26033 ?auto_26059 ) ) ( not ( = ?auto_26036 ?auto_26039 ) ) ( not ( = ?auto_26036 ?auto_26059 ) ) ( not ( = ?auto_26038 ?auto_26039 ) ) ( not ( = ?auto_26038 ?auto_26059 ) ) ( not ( = ?auto_26039 ?auto_26051 ) ) ( not ( = ?auto_26039 ?auto_26066 ) ) ( not ( = ?auto_26039 ?auto_26087 ) ) ( not ( = ?auto_26039 ?auto_26077 ) ) ( not ( = ?auto_26039 ?auto_26054 ) ) ( not ( = ?auto_26039 ?auto_26086 ) ) ( not ( = ?auto_26039 ?auto_26078 ) ) ( not ( = ?auto_26039 ?auto_26067 ) ) ( not ( = ?auto_26039 ?auto_26072 ) ) ( not ( = ?auto_26039 ?auto_26082 ) ) ( not ( = ?auto_26039 ?auto_26070 ) ) ( not ( = ?auto_26063 ?auto_26064 ) ) ( not ( = ?auto_26063 ?auto_26058 ) ) ( not ( = ?auto_26063 ?auto_26081 ) ) ( not ( = ?auto_26063 ?auto_26076 ) ) ( not ( = ?auto_26063 ?auto_26050 ) ) ( not ( = ?auto_26063 ?auto_26053 ) ) ( not ( = ?auto_26063 ?auto_26057 ) ) ( not ( = ?auto_26063 ?auto_26069 ) ) ( not ( = ?auto_26063 ?auto_26084 ) ) ( not ( = ?auto_26063 ?auto_26065 ) ) ( not ( = ?auto_26088 ?auto_26055 ) ) ( not ( = ?auto_26088 ?auto_26061 ) ) ( not ( = ?auto_26088 ?auto_26079 ) ) ( not ( = ?auto_26088 ?auto_26052 ) ) ( not ( = ?auto_26088 ?auto_26073 ) ) ( not ( = ?auto_26088 ?auto_26060 ) ) ( not ( = ?auto_26088 ?auto_26071 ) ) ( not ( = ?auto_26088 ?auto_26068 ) ) ( not ( = ?auto_26088 ?auto_26075 ) ) ( not ( = ?auto_26088 ?auto_26062 ) ) ( not ( = ?auto_26059 ?auto_26051 ) ) ( not ( = ?auto_26059 ?auto_26066 ) ) ( not ( = ?auto_26059 ?auto_26087 ) ) ( not ( = ?auto_26059 ?auto_26077 ) ) ( not ( = ?auto_26059 ?auto_26054 ) ) ( not ( = ?auto_26059 ?auto_26086 ) ) ( not ( = ?auto_26059 ?auto_26078 ) ) ( not ( = ?auto_26059 ?auto_26067 ) ) ( not ( = ?auto_26059 ?auto_26072 ) ) ( not ( = ?auto_26059 ?auto_26082 ) ) ( not ( = ?auto_26059 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26041 ) ) ( not ( = ?auto_26027 ?auto_26056 ) ) ( not ( = ?auto_26028 ?auto_26041 ) ) ( not ( = ?auto_26028 ?auto_26056 ) ) ( not ( = ?auto_26029 ?auto_26041 ) ) ( not ( = ?auto_26029 ?auto_26056 ) ) ( not ( = ?auto_26030 ?auto_26041 ) ) ( not ( = ?auto_26030 ?auto_26056 ) ) ( not ( = ?auto_26031 ?auto_26041 ) ) ( not ( = ?auto_26031 ?auto_26056 ) ) ( not ( = ?auto_26032 ?auto_26041 ) ) ( not ( = ?auto_26032 ?auto_26056 ) ) ( not ( = ?auto_26035 ?auto_26041 ) ) ( not ( = ?auto_26035 ?auto_26056 ) ) ( not ( = ?auto_26034 ?auto_26041 ) ) ( not ( = ?auto_26034 ?auto_26056 ) ) ( not ( = ?auto_26033 ?auto_26041 ) ) ( not ( = ?auto_26033 ?auto_26056 ) ) ( not ( = ?auto_26036 ?auto_26041 ) ) ( not ( = ?auto_26036 ?auto_26056 ) ) ( not ( = ?auto_26038 ?auto_26041 ) ) ( not ( = ?auto_26038 ?auto_26056 ) ) ( not ( = ?auto_26037 ?auto_26041 ) ) ( not ( = ?auto_26037 ?auto_26056 ) ) ( not ( = ?auto_26041 ?auto_26059 ) ) ( not ( = ?auto_26041 ?auto_26051 ) ) ( not ( = ?auto_26041 ?auto_26066 ) ) ( not ( = ?auto_26041 ?auto_26087 ) ) ( not ( = ?auto_26041 ?auto_26077 ) ) ( not ( = ?auto_26041 ?auto_26054 ) ) ( not ( = ?auto_26041 ?auto_26086 ) ) ( not ( = ?auto_26041 ?auto_26078 ) ) ( not ( = ?auto_26041 ?auto_26067 ) ) ( not ( = ?auto_26041 ?auto_26072 ) ) ( not ( = ?auto_26041 ?auto_26082 ) ) ( not ( = ?auto_26041 ?auto_26070 ) ) ( not ( = ?auto_26074 ?auto_26063 ) ) ( not ( = ?auto_26074 ?auto_26064 ) ) ( not ( = ?auto_26074 ?auto_26058 ) ) ( not ( = ?auto_26074 ?auto_26081 ) ) ( not ( = ?auto_26074 ?auto_26076 ) ) ( not ( = ?auto_26074 ?auto_26050 ) ) ( not ( = ?auto_26074 ?auto_26053 ) ) ( not ( = ?auto_26074 ?auto_26057 ) ) ( not ( = ?auto_26074 ?auto_26069 ) ) ( not ( = ?auto_26074 ?auto_26084 ) ) ( not ( = ?auto_26074 ?auto_26065 ) ) ( not ( = ?auto_26083 ?auto_26088 ) ) ( not ( = ?auto_26083 ?auto_26055 ) ) ( not ( = ?auto_26083 ?auto_26061 ) ) ( not ( = ?auto_26083 ?auto_26079 ) ) ( not ( = ?auto_26083 ?auto_26052 ) ) ( not ( = ?auto_26083 ?auto_26073 ) ) ( not ( = ?auto_26083 ?auto_26060 ) ) ( not ( = ?auto_26083 ?auto_26071 ) ) ( not ( = ?auto_26083 ?auto_26068 ) ) ( not ( = ?auto_26083 ?auto_26075 ) ) ( not ( = ?auto_26083 ?auto_26062 ) ) ( not ( = ?auto_26056 ?auto_26059 ) ) ( not ( = ?auto_26056 ?auto_26051 ) ) ( not ( = ?auto_26056 ?auto_26066 ) ) ( not ( = ?auto_26056 ?auto_26087 ) ) ( not ( = ?auto_26056 ?auto_26077 ) ) ( not ( = ?auto_26056 ?auto_26054 ) ) ( not ( = ?auto_26056 ?auto_26086 ) ) ( not ( = ?auto_26056 ?auto_26078 ) ) ( not ( = ?auto_26056 ?auto_26067 ) ) ( not ( = ?auto_26056 ?auto_26072 ) ) ( not ( = ?auto_26056 ?auto_26082 ) ) ( not ( = ?auto_26056 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26040 ) ) ( not ( = ?auto_26027 ?auto_26085 ) ) ( not ( = ?auto_26028 ?auto_26040 ) ) ( not ( = ?auto_26028 ?auto_26085 ) ) ( not ( = ?auto_26029 ?auto_26040 ) ) ( not ( = ?auto_26029 ?auto_26085 ) ) ( not ( = ?auto_26030 ?auto_26040 ) ) ( not ( = ?auto_26030 ?auto_26085 ) ) ( not ( = ?auto_26031 ?auto_26040 ) ) ( not ( = ?auto_26031 ?auto_26085 ) ) ( not ( = ?auto_26032 ?auto_26040 ) ) ( not ( = ?auto_26032 ?auto_26085 ) ) ( not ( = ?auto_26035 ?auto_26040 ) ) ( not ( = ?auto_26035 ?auto_26085 ) ) ( not ( = ?auto_26034 ?auto_26040 ) ) ( not ( = ?auto_26034 ?auto_26085 ) ) ( not ( = ?auto_26033 ?auto_26040 ) ) ( not ( = ?auto_26033 ?auto_26085 ) ) ( not ( = ?auto_26036 ?auto_26040 ) ) ( not ( = ?auto_26036 ?auto_26085 ) ) ( not ( = ?auto_26038 ?auto_26040 ) ) ( not ( = ?auto_26038 ?auto_26085 ) ) ( not ( = ?auto_26037 ?auto_26040 ) ) ( not ( = ?auto_26037 ?auto_26085 ) ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26039 ?auto_26085 ) ) ( not ( = ?auto_26040 ?auto_26056 ) ) ( not ( = ?auto_26040 ?auto_26059 ) ) ( not ( = ?auto_26040 ?auto_26051 ) ) ( not ( = ?auto_26040 ?auto_26066 ) ) ( not ( = ?auto_26040 ?auto_26087 ) ) ( not ( = ?auto_26040 ?auto_26077 ) ) ( not ( = ?auto_26040 ?auto_26054 ) ) ( not ( = ?auto_26040 ?auto_26086 ) ) ( not ( = ?auto_26040 ?auto_26078 ) ) ( not ( = ?auto_26040 ?auto_26067 ) ) ( not ( = ?auto_26040 ?auto_26072 ) ) ( not ( = ?auto_26040 ?auto_26082 ) ) ( not ( = ?auto_26040 ?auto_26070 ) ) ( not ( = ?auto_26080 ?auto_26074 ) ) ( not ( = ?auto_26080 ?auto_26063 ) ) ( not ( = ?auto_26080 ?auto_26064 ) ) ( not ( = ?auto_26080 ?auto_26058 ) ) ( not ( = ?auto_26080 ?auto_26081 ) ) ( not ( = ?auto_26080 ?auto_26076 ) ) ( not ( = ?auto_26080 ?auto_26050 ) ) ( not ( = ?auto_26080 ?auto_26053 ) ) ( not ( = ?auto_26080 ?auto_26057 ) ) ( not ( = ?auto_26080 ?auto_26069 ) ) ( not ( = ?auto_26080 ?auto_26084 ) ) ( not ( = ?auto_26080 ?auto_26065 ) ) ( not ( = ?auto_26049 ?auto_26083 ) ) ( not ( = ?auto_26049 ?auto_26088 ) ) ( not ( = ?auto_26049 ?auto_26055 ) ) ( not ( = ?auto_26049 ?auto_26061 ) ) ( not ( = ?auto_26049 ?auto_26079 ) ) ( not ( = ?auto_26049 ?auto_26052 ) ) ( not ( = ?auto_26049 ?auto_26073 ) ) ( not ( = ?auto_26049 ?auto_26060 ) ) ( not ( = ?auto_26049 ?auto_26071 ) ) ( not ( = ?auto_26049 ?auto_26068 ) ) ( not ( = ?auto_26049 ?auto_26075 ) ) ( not ( = ?auto_26049 ?auto_26062 ) ) ( not ( = ?auto_26085 ?auto_26056 ) ) ( not ( = ?auto_26085 ?auto_26059 ) ) ( not ( = ?auto_26085 ?auto_26051 ) ) ( not ( = ?auto_26085 ?auto_26066 ) ) ( not ( = ?auto_26085 ?auto_26087 ) ) ( not ( = ?auto_26085 ?auto_26077 ) ) ( not ( = ?auto_26085 ?auto_26054 ) ) ( not ( = ?auto_26085 ?auto_26086 ) ) ( not ( = ?auto_26085 ?auto_26078 ) ) ( not ( = ?auto_26085 ?auto_26067 ) ) ( not ( = ?auto_26085 ?auto_26072 ) ) ( not ( = ?auto_26085 ?auto_26082 ) ) ( not ( = ?auto_26085 ?auto_26070 ) ) ( not ( = ?auto_26027 ?auto_26042 ) ) ( not ( = ?auto_26027 ?auto_26043 ) ) ( not ( = ?auto_26028 ?auto_26042 ) ) ( not ( = ?auto_26028 ?auto_26043 ) ) ( not ( = ?auto_26029 ?auto_26042 ) ) ( not ( = ?auto_26029 ?auto_26043 ) ) ( not ( = ?auto_26030 ?auto_26042 ) ) ( not ( = ?auto_26030 ?auto_26043 ) ) ( not ( = ?auto_26031 ?auto_26042 ) ) ( not ( = ?auto_26031 ?auto_26043 ) ) ( not ( = ?auto_26032 ?auto_26042 ) ) ( not ( = ?auto_26032 ?auto_26043 ) ) ( not ( = ?auto_26035 ?auto_26042 ) ) ( not ( = ?auto_26035 ?auto_26043 ) ) ( not ( = ?auto_26034 ?auto_26042 ) ) ( not ( = ?auto_26034 ?auto_26043 ) ) ( not ( = ?auto_26033 ?auto_26042 ) ) ( not ( = ?auto_26033 ?auto_26043 ) ) ( not ( = ?auto_26036 ?auto_26042 ) ) ( not ( = ?auto_26036 ?auto_26043 ) ) ( not ( = ?auto_26038 ?auto_26042 ) ) ( not ( = ?auto_26038 ?auto_26043 ) ) ( not ( = ?auto_26037 ?auto_26042 ) ) ( not ( = ?auto_26037 ?auto_26043 ) ) ( not ( = ?auto_26039 ?auto_26042 ) ) ( not ( = ?auto_26039 ?auto_26043 ) ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( not ( = ?auto_26041 ?auto_26043 ) ) ( not ( = ?auto_26042 ?auto_26085 ) ) ( not ( = ?auto_26042 ?auto_26056 ) ) ( not ( = ?auto_26042 ?auto_26059 ) ) ( not ( = ?auto_26042 ?auto_26051 ) ) ( not ( = ?auto_26042 ?auto_26066 ) ) ( not ( = ?auto_26042 ?auto_26087 ) ) ( not ( = ?auto_26042 ?auto_26077 ) ) ( not ( = ?auto_26042 ?auto_26054 ) ) ( not ( = ?auto_26042 ?auto_26086 ) ) ( not ( = ?auto_26042 ?auto_26078 ) ) ( not ( = ?auto_26042 ?auto_26067 ) ) ( not ( = ?auto_26042 ?auto_26072 ) ) ( not ( = ?auto_26042 ?auto_26082 ) ) ( not ( = ?auto_26042 ?auto_26070 ) ) ( not ( = ?auto_26045 ?auto_26080 ) ) ( not ( = ?auto_26045 ?auto_26074 ) ) ( not ( = ?auto_26045 ?auto_26063 ) ) ( not ( = ?auto_26045 ?auto_26064 ) ) ( not ( = ?auto_26045 ?auto_26058 ) ) ( not ( = ?auto_26045 ?auto_26081 ) ) ( not ( = ?auto_26045 ?auto_26076 ) ) ( not ( = ?auto_26045 ?auto_26050 ) ) ( not ( = ?auto_26045 ?auto_26053 ) ) ( not ( = ?auto_26045 ?auto_26057 ) ) ( not ( = ?auto_26045 ?auto_26069 ) ) ( not ( = ?auto_26045 ?auto_26084 ) ) ( not ( = ?auto_26045 ?auto_26065 ) ) ( not ( = ?auto_26047 ?auto_26049 ) ) ( not ( = ?auto_26047 ?auto_26083 ) ) ( not ( = ?auto_26047 ?auto_26088 ) ) ( not ( = ?auto_26047 ?auto_26055 ) ) ( not ( = ?auto_26047 ?auto_26061 ) ) ( not ( = ?auto_26047 ?auto_26079 ) ) ( not ( = ?auto_26047 ?auto_26052 ) ) ( not ( = ?auto_26047 ?auto_26073 ) ) ( not ( = ?auto_26047 ?auto_26060 ) ) ( not ( = ?auto_26047 ?auto_26071 ) ) ( not ( = ?auto_26047 ?auto_26068 ) ) ( not ( = ?auto_26047 ?auto_26075 ) ) ( not ( = ?auto_26047 ?auto_26062 ) ) ( not ( = ?auto_26043 ?auto_26085 ) ) ( not ( = ?auto_26043 ?auto_26056 ) ) ( not ( = ?auto_26043 ?auto_26059 ) ) ( not ( = ?auto_26043 ?auto_26051 ) ) ( not ( = ?auto_26043 ?auto_26066 ) ) ( not ( = ?auto_26043 ?auto_26087 ) ) ( not ( = ?auto_26043 ?auto_26077 ) ) ( not ( = ?auto_26043 ?auto_26054 ) ) ( not ( = ?auto_26043 ?auto_26086 ) ) ( not ( = ?auto_26043 ?auto_26078 ) ) ( not ( = ?auto_26043 ?auto_26067 ) ) ( not ( = ?auto_26043 ?auto_26072 ) ) ( not ( = ?auto_26043 ?auto_26082 ) ) ( not ( = ?auto_26043 ?auto_26070 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26027 ?auto_26028 ?auto_26029 ?auto_26030 ?auto_26031 ?auto_26032 ?auto_26035 ?auto_26034 ?auto_26033 ?auto_26036 ?auto_26038 ?auto_26037 ?auto_26039 ?auto_26041 ?auto_26040 )
      ( MAKE-1CRATE ?auto_26040 ?auto_26042 )
      ( MAKE-15CRATE-VERIFY ?auto_26027 ?auto_26028 ?auto_26029 ?auto_26030 ?auto_26031 ?auto_26032 ?auto_26035 ?auto_26034 ?auto_26033 ?auto_26036 ?auto_26038 ?auto_26037 ?auto_26039 ?auto_26041 ?auto_26040 ?auto_26042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26091 - SURFACE
      ?auto_26092 - SURFACE
    )
    :vars
    (
      ?auto_26093 - HOIST
      ?auto_26094 - PLACE
      ?auto_26096 - PLACE
      ?auto_26097 - HOIST
      ?auto_26098 - SURFACE
      ?auto_26095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26093 ?auto_26094 ) ( SURFACE-AT ?auto_26091 ?auto_26094 ) ( CLEAR ?auto_26091 ) ( IS-CRATE ?auto_26092 ) ( AVAILABLE ?auto_26093 ) ( not ( = ?auto_26096 ?auto_26094 ) ) ( HOIST-AT ?auto_26097 ?auto_26096 ) ( AVAILABLE ?auto_26097 ) ( SURFACE-AT ?auto_26092 ?auto_26096 ) ( ON ?auto_26092 ?auto_26098 ) ( CLEAR ?auto_26092 ) ( TRUCK-AT ?auto_26095 ?auto_26094 ) ( not ( = ?auto_26091 ?auto_26092 ) ) ( not ( = ?auto_26091 ?auto_26098 ) ) ( not ( = ?auto_26092 ?auto_26098 ) ) ( not ( = ?auto_26093 ?auto_26097 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26095 ?auto_26094 ?auto_26096 )
      ( !LIFT ?auto_26097 ?auto_26092 ?auto_26098 ?auto_26096 )
      ( !LOAD ?auto_26097 ?auto_26092 ?auto_26095 ?auto_26096 )
      ( !DRIVE ?auto_26095 ?auto_26096 ?auto_26094 )
      ( !UNLOAD ?auto_26093 ?auto_26092 ?auto_26095 ?auto_26094 )
      ( !DROP ?auto_26093 ?auto_26092 ?auto_26091 ?auto_26094 )
      ( MAKE-1CRATE-VERIFY ?auto_26091 ?auto_26092 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26116 - SURFACE
      ?auto_26117 - SURFACE
      ?auto_26118 - SURFACE
      ?auto_26119 - SURFACE
      ?auto_26120 - SURFACE
      ?auto_26121 - SURFACE
      ?auto_26124 - SURFACE
      ?auto_26123 - SURFACE
      ?auto_26122 - SURFACE
      ?auto_26125 - SURFACE
      ?auto_26127 - SURFACE
      ?auto_26126 - SURFACE
      ?auto_26128 - SURFACE
      ?auto_26130 - SURFACE
      ?auto_26129 - SURFACE
      ?auto_26131 - SURFACE
      ?auto_26132 - SURFACE
    )
    :vars
    (
      ?auto_26137 - HOIST
      ?auto_26133 - PLACE
      ?auto_26134 - PLACE
      ?auto_26138 - HOIST
      ?auto_26136 - SURFACE
      ?auto_26165 - PLACE
      ?auto_26175 - HOIST
      ?auto_26146 - SURFACE
      ?auto_26144 - PLACE
      ?auto_26169 - HOIST
      ?auto_26172 - SURFACE
      ?auto_26142 - PLACE
      ?auto_26155 - HOIST
      ?auto_26160 - SURFACE
      ?auto_26139 - SURFACE
      ?auto_26156 - PLACE
      ?auto_26147 - HOIST
      ?auto_26152 - SURFACE
      ?auto_26151 - PLACE
      ?auto_26149 - HOIST
      ?auto_26153 - SURFACE
      ?auto_26162 - PLACE
      ?auto_26166 - HOIST
      ?auto_26154 - SURFACE
      ?auto_26176 - PLACE
      ?auto_26164 - HOIST
      ?auto_26173 - SURFACE
      ?auto_26159 - PLACE
      ?auto_26143 - HOIST
      ?auto_26161 - SURFACE
      ?auto_26140 - PLACE
      ?auto_26145 - HOIST
      ?auto_26168 - SURFACE
      ?auto_26158 - PLACE
      ?auto_26171 - HOIST
      ?auto_26179 - SURFACE
      ?auto_26178 - PLACE
      ?auto_26141 - HOIST
      ?auto_26170 - SURFACE
      ?auto_26163 - SURFACE
      ?auto_26177 - PLACE
      ?auto_26150 - HOIST
      ?auto_26174 - SURFACE
      ?auto_26148 - PLACE
      ?auto_26157 - HOIST
      ?auto_26167 - SURFACE
      ?auto_26135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26137 ?auto_26133 ) ( IS-CRATE ?auto_26132 ) ( not ( = ?auto_26134 ?auto_26133 ) ) ( HOIST-AT ?auto_26138 ?auto_26134 ) ( SURFACE-AT ?auto_26132 ?auto_26134 ) ( ON ?auto_26132 ?auto_26136 ) ( CLEAR ?auto_26132 ) ( not ( = ?auto_26131 ?auto_26132 ) ) ( not ( = ?auto_26131 ?auto_26136 ) ) ( not ( = ?auto_26132 ?auto_26136 ) ) ( not ( = ?auto_26137 ?auto_26138 ) ) ( IS-CRATE ?auto_26131 ) ( not ( = ?auto_26165 ?auto_26133 ) ) ( HOIST-AT ?auto_26175 ?auto_26165 ) ( AVAILABLE ?auto_26175 ) ( SURFACE-AT ?auto_26131 ?auto_26165 ) ( ON ?auto_26131 ?auto_26146 ) ( CLEAR ?auto_26131 ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( not ( = ?auto_26129 ?auto_26146 ) ) ( not ( = ?auto_26131 ?auto_26146 ) ) ( not ( = ?auto_26137 ?auto_26175 ) ) ( IS-CRATE ?auto_26129 ) ( not ( = ?auto_26144 ?auto_26133 ) ) ( HOIST-AT ?auto_26169 ?auto_26144 ) ( AVAILABLE ?auto_26169 ) ( SURFACE-AT ?auto_26129 ?auto_26144 ) ( ON ?auto_26129 ?auto_26172 ) ( CLEAR ?auto_26129 ) ( not ( = ?auto_26130 ?auto_26129 ) ) ( not ( = ?auto_26130 ?auto_26172 ) ) ( not ( = ?auto_26129 ?auto_26172 ) ) ( not ( = ?auto_26137 ?auto_26169 ) ) ( IS-CRATE ?auto_26130 ) ( not ( = ?auto_26142 ?auto_26133 ) ) ( HOIST-AT ?auto_26155 ?auto_26142 ) ( AVAILABLE ?auto_26155 ) ( SURFACE-AT ?auto_26130 ?auto_26142 ) ( ON ?auto_26130 ?auto_26160 ) ( CLEAR ?auto_26130 ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26160 ) ) ( not ( = ?auto_26130 ?auto_26160 ) ) ( not ( = ?auto_26137 ?auto_26155 ) ) ( IS-CRATE ?auto_26128 ) ( AVAILABLE ?auto_26138 ) ( SURFACE-AT ?auto_26128 ?auto_26134 ) ( ON ?auto_26128 ?auto_26139 ) ( CLEAR ?auto_26128 ) ( not ( = ?auto_26126 ?auto_26128 ) ) ( not ( = ?auto_26126 ?auto_26139 ) ) ( not ( = ?auto_26128 ?auto_26139 ) ) ( IS-CRATE ?auto_26126 ) ( not ( = ?auto_26156 ?auto_26133 ) ) ( HOIST-AT ?auto_26147 ?auto_26156 ) ( AVAILABLE ?auto_26147 ) ( SURFACE-AT ?auto_26126 ?auto_26156 ) ( ON ?auto_26126 ?auto_26152 ) ( CLEAR ?auto_26126 ) ( not ( = ?auto_26127 ?auto_26126 ) ) ( not ( = ?auto_26127 ?auto_26152 ) ) ( not ( = ?auto_26126 ?auto_26152 ) ) ( not ( = ?auto_26137 ?auto_26147 ) ) ( IS-CRATE ?auto_26127 ) ( not ( = ?auto_26151 ?auto_26133 ) ) ( HOIST-AT ?auto_26149 ?auto_26151 ) ( AVAILABLE ?auto_26149 ) ( SURFACE-AT ?auto_26127 ?auto_26151 ) ( ON ?auto_26127 ?auto_26153 ) ( CLEAR ?auto_26127 ) ( not ( = ?auto_26125 ?auto_26127 ) ) ( not ( = ?auto_26125 ?auto_26153 ) ) ( not ( = ?auto_26127 ?auto_26153 ) ) ( not ( = ?auto_26137 ?auto_26149 ) ) ( IS-CRATE ?auto_26125 ) ( not ( = ?auto_26162 ?auto_26133 ) ) ( HOIST-AT ?auto_26166 ?auto_26162 ) ( AVAILABLE ?auto_26166 ) ( SURFACE-AT ?auto_26125 ?auto_26162 ) ( ON ?auto_26125 ?auto_26154 ) ( CLEAR ?auto_26125 ) ( not ( = ?auto_26122 ?auto_26125 ) ) ( not ( = ?auto_26122 ?auto_26154 ) ) ( not ( = ?auto_26125 ?auto_26154 ) ) ( not ( = ?auto_26137 ?auto_26166 ) ) ( IS-CRATE ?auto_26122 ) ( not ( = ?auto_26176 ?auto_26133 ) ) ( HOIST-AT ?auto_26164 ?auto_26176 ) ( AVAILABLE ?auto_26164 ) ( SURFACE-AT ?auto_26122 ?auto_26176 ) ( ON ?auto_26122 ?auto_26173 ) ( CLEAR ?auto_26122 ) ( not ( = ?auto_26123 ?auto_26122 ) ) ( not ( = ?auto_26123 ?auto_26173 ) ) ( not ( = ?auto_26122 ?auto_26173 ) ) ( not ( = ?auto_26137 ?auto_26164 ) ) ( IS-CRATE ?auto_26123 ) ( not ( = ?auto_26159 ?auto_26133 ) ) ( HOIST-AT ?auto_26143 ?auto_26159 ) ( AVAILABLE ?auto_26143 ) ( SURFACE-AT ?auto_26123 ?auto_26159 ) ( ON ?auto_26123 ?auto_26161 ) ( CLEAR ?auto_26123 ) ( not ( = ?auto_26124 ?auto_26123 ) ) ( not ( = ?auto_26124 ?auto_26161 ) ) ( not ( = ?auto_26123 ?auto_26161 ) ) ( not ( = ?auto_26137 ?auto_26143 ) ) ( IS-CRATE ?auto_26124 ) ( not ( = ?auto_26140 ?auto_26133 ) ) ( HOIST-AT ?auto_26145 ?auto_26140 ) ( AVAILABLE ?auto_26145 ) ( SURFACE-AT ?auto_26124 ?auto_26140 ) ( ON ?auto_26124 ?auto_26168 ) ( CLEAR ?auto_26124 ) ( not ( = ?auto_26121 ?auto_26124 ) ) ( not ( = ?auto_26121 ?auto_26168 ) ) ( not ( = ?auto_26124 ?auto_26168 ) ) ( not ( = ?auto_26137 ?auto_26145 ) ) ( IS-CRATE ?auto_26121 ) ( not ( = ?auto_26158 ?auto_26133 ) ) ( HOIST-AT ?auto_26171 ?auto_26158 ) ( SURFACE-AT ?auto_26121 ?auto_26158 ) ( ON ?auto_26121 ?auto_26179 ) ( CLEAR ?auto_26121 ) ( not ( = ?auto_26120 ?auto_26121 ) ) ( not ( = ?auto_26120 ?auto_26179 ) ) ( not ( = ?auto_26121 ?auto_26179 ) ) ( not ( = ?auto_26137 ?auto_26171 ) ) ( IS-CRATE ?auto_26120 ) ( not ( = ?auto_26178 ?auto_26133 ) ) ( HOIST-AT ?auto_26141 ?auto_26178 ) ( AVAILABLE ?auto_26141 ) ( SURFACE-AT ?auto_26120 ?auto_26178 ) ( ON ?auto_26120 ?auto_26170 ) ( CLEAR ?auto_26120 ) ( not ( = ?auto_26119 ?auto_26120 ) ) ( not ( = ?auto_26119 ?auto_26170 ) ) ( not ( = ?auto_26120 ?auto_26170 ) ) ( not ( = ?auto_26137 ?auto_26141 ) ) ( IS-CRATE ?auto_26119 ) ( AVAILABLE ?auto_26171 ) ( SURFACE-AT ?auto_26119 ?auto_26158 ) ( ON ?auto_26119 ?auto_26163 ) ( CLEAR ?auto_26119 ) ( not ( = ?auto_26118 ?auto_26119 ) ) ( not ( = ?auto_26118 ?auto_26163 ) ) ( not ( = ?auto_26119 ?auto_26163 ) ) ( IS-CRATE ?auto_26118 ) ( not ( = ?auto_26177 ?auto_26133 ) ) ( HOIST-AT ?auto_26150 ?auto_26177 ) ( AVAILABLE ?auto_26150 ) ( SURFACE-AT ?auto_26118 ?auto_26177 ) ( ON ?auto_26118 ?auto_26174 ) ( CLEAR ?auto_26118 ) ( not ( = ?auto_26117 ?auto_26118 ) ) ( not ( = ?auto_26117 ?auto_26174 ) ) ( not ( = ?auto_26118 ?auto_26174 ) ) ( not ( = ?auto_26137 ?auto_26150 ) ) ( SURFACE-AT ?auto_26116 ?auto_26133 ) ( CLEAR ?auto_26116 ) ( IS-CRATE ?auto_26117 ) ( AVAILABLE ?auto_26137 ) ( not ( = ?auto_26148 ?auto_26133 ) ) ( HOIST-AT ?auto_26157 ?auto_26148 ) ( AVAILABLE ?auto_26157 ) ( SURFACE-AT ?auto_26117 ?auto_26148 ) ( ON ?auto_26117 ?auto_26167 ) ( CLEAR ?auto_26117 ) ( TRUCK-AT ?auto_26135 ?auto_26133 ) ( not ( = ?auto_26116 ?auto_26117 ) ) ( not ( = ?auto_26116 ?auto_26167 ) ) ( not ( = ?auto_26117 ?auto_26167 ) ) ( not ( = ?auto_26137 ?auto_26157 ) ) ( not ( = ?auto_26116 ?auto_26118 ) ) ( not ( = ?auto_26116 ?auto_26174 ) ) ( not ( = ?auto_26118 ?auto_26167 ) ) ( not ( = ?auto_26177 ?auto_26148 ) ) ( not ( = ?auto_26150 ?auto_26157 ) ) ( not ( = ?auto_26174 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26119 ) ) ( not ( = ?auto_26116 ?auto_26163 ) ) ( not ( = ?auto_26117 ?auto_26119 ) ) ( not ( = ?auto_26117 ?auto_26163 ) ) ( not ( = ?auto_26119 ?auto_26174 ) ) ( not ( = ?auto_26119 ?auto_26167 ) ) ( not ( = ?auto_26158 ?auto_26177 ) ) ( not ( = ?auto_26158 ?auto_26148 ) ) ( not ( = ?auto_26171 ?auto_26150 ) ) ( not ( = ?auto_26171 ?auto_26157 ) ) ( not ( = ?auto_26163 ?auto_26174 ) ) ( not ( = ?auto_26163 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26120 ) ) ( not ( = ?auto_26116 ?auto_26170 ) ) ( not ( = ?auto_26117 ?auto_26120 ) ) ( not ( = ?auto_26117 ?auto_26170 ) ) ( not ( = ?auto_26118 ?auto_26120 ) ) ( not ( = ?auto_26118 ?auto_26170 ) ) ( not ( = ?auto_26120 ?auto_26163 ) ) ( not ( = ?auto_26120 ?auto_26174 ) ) ( not ( = ?auto_26120 ?auto_26167 ) ) ( not ( = ?auto_26178 ?auto_26158 ) ) ( not ( = ?auto_26178 ?auto_26177 ) ) ( not ( = ?auto_26178 ?auto_26148 ) ) ( not ( = ?auto_26141 ?auto_26171 ) ) ( not ( = ?auto_26141 ?auto_26150 ) ) ( not ( = ?auto_26141 ?auto_26157 ) ) ( not ( = ?auto_26170 ?auto_26163 ) ) ( not ( = ?auto_26170 ?auto_26174 ) ) ( not ( = ?auto_26170 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26121 ) ) ( not ( = ?auto_26116 ?auto_26179 ) ) ( not ( = ?auto_26117 ?auto_26121 ) ) ( not ( = ?auto_26117 ?auto_26179 ) ) ( not ( = ?auto_26118 ?auto_26121 ) ) ( not ( = ?auto_26118 ?auto_26179 ) ) ( not ( = ?auto_26119 ?auto_26121 ) ) ( not ( = ?auto_26119 ?auto_26179 ) ) ( not ( = ?auto_26121 ?auto_26170 ) ) ( not ( = ?auto_26121 ?auto_26163 ) ) ( not ( = ?auto_26121 ?auto_26174 ) ) ( not ( = ?auto_26121 ?auto_26167 ) ) ( not ( = ?auto_26179 ?auto_26170 ) ) ( not ( = ?auto_26179 ?auto_26163 ) ) ( not ( = ?auto_26179 ?auto_26174 ) ) ( not ( = ?auto_26179 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26124 ) ) ( not ( = ?auto_26116 ?auto_26168 ) ) ( not ( = ?auto_26117 ?auto_26124 ) ) ( not ( = ?auto_26117 ?auto_26168 ) ) ( not ( = ?auto_26118 ?auto_26124 ) ) ( not ( = ?auto_26118 ?auto_26168 ) ) ( not ( = ?auto_26119 ?auto_26124 ) ) ( not ( = ?auto_26119 ?auto_26168 ) ) ( not ( = ?auto_26120 ?auto_26124 ) ) ( not ( = ?auto_26120 ?auto_26168 ) ) ( not ( = ?auto_26124 ?auto_26179 ) ) ( not ( = ?auto_26124 ?auto_26170 ) ) ( not ( = ?auto_26124 ?auto_26163 ) ) ( not ( = ?auto_26124 ?auto_26174 ) ) ( not ( = ?auto_26124 ?auto_26167 ) ) ( not ( = ?auto_26140 ?auto_26158 ) ) ( not ( = ?auto_26140 ?auto_26178 ) ) ( not ( = ?auto_26140 ?auto_26177 ) ) ( not ( = ?auto_26140 ?auto_26148 ) ) ( not ( = ?auto_26145 ?auto_26171 ) ) ( not ( = ?auto_26145 ?auto_26141 ) ) ( not ( = ?auto_26145 ?auto_26150 ) ) ( not ( = ?auto_26145 ?auto_26157 ) ) ( not ( = ?auto_26168 ?auto_26179 ) ) ( not ( = ?auto_26168 ?auto_26170 ) ) ( not ( = ?auto_26168 ?auto_26163 ) ) ( not ( = ?auto_26168 ?auto_26174 ) ) ( not ( = ?auto_26168 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26123 ) ) ( not ( = ?auto_26116 ?auto_26161 ) ) ( not ( = ?auto_26117 ?auto_26123 ) ) ( not ( = ?auto_26117 ?auto_26161 ) ) ( not ( = ?auto_26118 ?auto_26123 ) ) ( not ( = ?auto_26118 ?auto_26161 ) ) ( not ( = ?auto_26119 ?auto_26123 ) ) ( not ( = ?auto_26119 ?auto_26161 ) ) ( not ( = ?auto_26120 ?auto_26123 ) ) ( not ( = ?auto_26120 ?auto_26161 ) ) ( not ( = ?auto_26121 ?auto_26123 ) ) ( not ( = ?auto_26121 ?auto_26161 ) ) ( not ( = ?auto_26123 ?auto_26168 ) ) ( not ( = ?auto_26123 ?auto_26179 ) ) ( not ( = ?auto_26123 ?auto_26170 ) ) ( not ( = ?auto_26123 ?auto_26163 ) ) ( not ( = ?auto_26123 ?auto_26174 ) ) ( not ( = ?auto_26123 ?auto_26167 ) ) ( not ( = ?auto_26159 ?auto_26140 ) ) ( not ( = ?auto_26159 ?auto_26158 ) ) ( not ( = ?auto_26159 ?auto_26178 ) ) ( not ( = ?auto_26159 ?auto_26177 ) ) ( not ( = ?auto_26159 ?auto_26148 ) ) ( not ( = ?auto_26143 ?auto_26145 ) ) ( not ( = ?auto_26143 ?auto_26171 ) ) ( not ( = ?auto_26143 ?auto_26141 ) ) ( not ( = ?auto_26143 ?auto_26150 ) ) ( not ( = ?auto_26143 ?auto_26157 ) ) ( not ( = ?auto_26161 ?auto_26168 ) ) ( not ( = ?auto_26161 ?auto_26179 ) ) ( not ( = ?auto_26161 ?auto_26170 ) ) ( not ( = ?auto_26161 ?auto_26163 ) ) ( not ( = ?auto_26161 ?auto_26174 ) ) ( not ( = ?auto_26161 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26122 ) ) ( not ( = ?auto_26116 ?auto_26173 ) ) ( not ( = ?auto_26117 ?auto_26122 ) ) ( not ( = ?auto_26117 ?auto_26173 ) ) ( not ( = ?auto_26118 ?auto_26122 ) ) ( not ( = ?auto_26118 ?auto_26173 ) ) ( not ( = ?auto_26119 ?auto_26122 ) ) ( not ( = ?auto_26119 ?auto_26173 ) ) ( not ( = ?auto_26120 ?auto_26122 ) ) ( not ( = ?auto_26120 ?auto_26173 ) ) ( not ( = ?auto_26121 ?auto_26122 ) ) ( not ( = ?auto_26121 ?auto_26173 ) ) ( not ( = ?auto_26124 ?auto_26122 ) ) ( not ( = ?auto_26124 ?auto_26173 ) ) ( not ( = ?auto_26122 ?auto_26161 ) ) ( not ( = ?auto_26122 ?auto_26168 ) ) ( not ( = ?auto_26122 ?auto_26179 ) ) ( not ( = ?auto_26122 ?auto_26170 ) ) ( not ( = ?auto_26122 ?auto_26163 ) ) ( not ( = ?auto_26122 ?auto_26174 ) ) ( not ( = ?auto_26122 ?auto_26167 ) ) ( not ( = ?auto_26176 ?auto_26159 ) ) ( not ( = ?auto_26176 ?auto_26140 ) ) ( not ( = ?auto_26176 ?auto_26158 ) ) ( not ( = ?auto_26176 ?auto_26178 ) ) ( not ( = ?auto_26176 ?auto_26177 ) ) ( not ( = ?auto_26176 ?auto_26148 ) ) ( not ( = ?auto_26164 ?auto_26143 ) ) ( not ( = ?auto_26164 ?auto_26145 ) ) ( not ( = ?auto_26164 ?auto_26171 ) ) ( not ( = ?auto_26164 ?auto_26141 ) ) ( not ( = ?auto_26164 ?auto_26150 ) ) ( not ( = ?auto_26164 ?auto_26157 ) ) ( not ( = ?auto_26173 ?auto_26161 ) ) ( not ( = ?auto_26173 ?auto_26168 ) ) ( not ( = ?auto_26173 ?auto_26179 ) ) ( not ( = ?auto_26173 ?auto_26170 ) ) ( not ( = ?auto_26173 ?auto_26163 ) ) ( not ( = ?auto_26173 ?auto_26174 ) ) ( not ( = ?auto_26173 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26125 ) ) ( not ( = ?auto_26116 ?auto_26154 ) ) ( not ( = ?auto_26117 ?auto_26125 ) ) ( not ( = ?auto_26117 ?auto_26154 ) ) ( not ( = ?auto_26118 ?auto_26125 ) ) ( not ( = ?auto_26118 ?auto_26154 ) ) ( not ( = ?auto_26119 ?auto_26125 ) ) ( not ( = ?auto_26119 ?auto_26154 ) ) ( not ( = ?auto_26120 ?auto_26125 ) ) ( not ( = ?auto_26120 ?auto_26154 ) ) ( not ( = ?auto_26121 ?auto_26125 ) ) ( not ( = ?auto_26121 ?auto_26154 ) ) ( not ( = ?auto_26124 ?auto_26125 ) ) ( not ( = ?auto_26124 ?auto_26154 ) ) ( not ( = ?auto_26123 ?auto_26125 ) ) ( not ( = ?auto_26123 ?auto_26154 ) ) ( not ( = ?auto_26125 ?auto_26173 ) ) ( not ( = ?auto_26125 ?auto_26161 ) ) ( not ( = ?auto_26125 ?auto_26168 ) ) ( not ( = ?auto_26125 ?auto_26179 ) ) ( not ( = ?auto_26125 ?auto_26170 ) ) ( not ( = ?auto_26125 ?auto_26163 ) ) ( not ( = ?auto_26125 ?auto_26174 ) ) ( not ( = ?auto_26125 ?auto_26167 ) ) ( not ( = ?auto_26162 ?auto_26176 ) ) ( not ( = ?auto_26162 ?auto_26159 ) ) ( not ( = ?auto_26162 ?auto_26140 ) ) ( not ( = ?auto_26162 ?auto_26158 ) ) ( not ( = ?auto_26162 ?auto_26178 ) ) ( not ( = ?auto_26162 ?auto_26177 ) ) ( not ( = ?auto_26162 ?auto_26148 ) ) ( not ( = ?auto_26166 ?auto_26164 ) ) ( not ( = ?auto_26166 ?auto_26143 ) ) ( not ( = ?auto_26166 ?auto_26145 ) ) ( not ( = ?auto_26166 ?auto_26171 ) ) ( not ( = ?auto_26166 ?auto_26141 ) ) ( not ( = ?auto_26166 ?auto_26150 ) ) ( not ( = ?auto_26166 ?auto_26157 ) ) ( not ( = ?auto_26154 ?auto_26173 ) ) ( not ( = ?auto_26154 ?auto_26161 ) ) ( not ( = ?auto_26154 ?auto_26168 ) ) ( not ( = ?auto_26154 ?auto_26179 ) ) ( not ( = ?auto_26154 ?auto_26170 ) ) ( not ( = ?auto_26154 ?auto_26163 ) ) ( not ( = ?auto_26154 ?auto_26174 ) ) ( not ( = ?auto_26154 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26127 ) ) ( not ( = ?auto_26116 ?auto_26153 ) ) ( not ( = ?auto_26117 ?auto_26127 ) ) ( not ( = ?auto_26117 ?auto_26153 ) ) ( not ( = ?auto_26118 ?auto_26127 ) ) ( not ( = ?auto_26118 ?auto_26153 ) ) ( not ( = ?auto_26119 ?auto_26127 ) ) ( not ( = ?auto_26119 ?auto_26153 ) ) ( not ( = ?auto_26120 ?auto_26127 ) ) ( not ( = ?auto_26120 ?auto_26153 ) ) ( not ( = ?auto_26121 ?auto_26127 ) ) ( not ( = ?auto_26121 ?auto_26153 ) ) ( not ( = ?auto_26124 ?auto_26127 ) ) ( not ( = ?auto_26124 ?auto_26153 ) ) ( not ( = ?auto_26123 ?auto_26127 ) ) ( not ( = ?auto_26123 ?auto_26153 ) ) ( not ( = ?auto_26122 ?auto_26127 ) ) ( not ( = ?auto_26122 ?auto_26153 ) ) ( not ( = ?auto_26127 ?auto_26154 ) ) ( not ( = ?auto_26127 ?auto_26173 ) ) ( not ( = ?auto_26127 ?auto_26161 ) ) ( not ( = ?auto_26127 ?auto_26168 ) ) ( not ( = ?auto_26127 ?auto_26179 ) ) ( not ( = ?auto_26127 ?auto_26170 ) ) ( not ( = ?auto_26127 ?auto_26163 ) ) ( not ( = ?auto_26127 ?auto_26174 ) ) ( not ( = ?auto_26127 ?auto_26167 ) ) ( not ( = ?auto_26151 ?auto_26162 ) ) ( not ( = ?auto_26151 ?auto_26176 ) ) ( not ( = ?auto_26151 ?auto_26159 ) ) ( not ( = ?auto_26151 ?auto_26140 ) ) ( not ( = ?auto_26151 ?auto_26158 ) ) ( not ( = ?auto_26151 ?auto_26178 ) ) ( not ( = ?auto_26151 ?auto_26177 ) ) ( not ( = ?auto_26151 ?auto_26148 ) ) ( not ( = ?auto_26149 ?auto_26166 ) ) ( not ( = ?auto_26149 ?auto_26164 ) ) ( not ( = ?auto_26149 ?auto_26143 ) ) ( not ( = ?auto_26149 ?auto_26145 ) ) ( not ( = ?auto_26149 ?auto_26171 ) ) ( not ( = ?auto_26149 ?auto_26141 ) ) ( not ( = ?auto_26149 ?auto_26150 ) ) ( not ( = ?auto_26149 ?auto_26157 ) ) ( not ( = ?auto_26153 ?auto_26154 ) ) ( not ( = ?auto_26153 ?auto_26173 ) ) ( not ( = ?auto_26153 ?auto_26161 ) ) ( not ( = ?auto_26153 ?auto_26168 ) ) ( not ( = ?auto_26153 ?auto_26179 ) ) ( not ( = ?auto_26153 ?auto_26170 ) ) ( not ( = ?auto_26153 ?auto_26163 ) ) ( not ( = ?auto_26153 ?auto_26174 ) ) ( not ( = ?auto_26153 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26126 ) ) ( not ( = ?auto_26116 ?auto_26152 ) ) ( not ( = ?auto_26117 ?auto_26126 ) ) ( not ( = ?auto_26117 ?auto_26152 ) ) ( not ( = ?auto_26118 ?auto_26126 ) ) ( not ( = ?auto_26118 ?auto_26152 ) ) ( not ( = ?auto_26119 ?auto_26126 ) ) ( not ( = ?auto_26119 ?auto_26152 ) ) ( not ( = ?auto_26120 ?auto_26126 ) ) ( not ( = ?auto_26120 ?auto_26152 ) ) ( not ( = ?auto_26121 ?auto_26126 ) ) ( not ( = ?auto_26121 ?auto_26152 ) ) ( not ( = ?auto_26124 ?auto_26126 ) ) ( not ( = ?auto_26124 ?auto_26152 ) ) ( not ( = ?auto_26123 ?auto_26126 ) ) ( not ( = ?auto_26123 ?auto_26152 ) ) ( not ( = ?auto_26122 ?auto_26126 ) ) ( not ( = ?auto_26122 ?auto_26152 ) ) ( not ( = ?auto_26125 ?auto_26126 ) ) ( not ( = ?auto_26125 ?auto_26152 ) ) ( not ( = ?auto_26126 ?auto_26153 ) ) ( not ( = ?auto_26126 ?auto_26154 ) ) ( not ( = ?auto_26126 ?auto_26173 ) ) ( not ( = ?auto_26126 ?auto_26161 ) ) ( not ( = ?auto_26126 ?auto_26168 ) ) ( not ( = ?auto_26126 ?auto_26179 ) ) ( not ( = ?auto_26126 ?auto_26170 ) ) ( not ( = ?auto_26126 ?auto_26163 ) ) ( not ( = ?auto_26126 ?auto_26174 ) ) ( not ( = ?auto_26126 ?auto_26167 ) ) ( not ( = ?auto_26156 ?auto_26151 ) ) ( not ( = ?auto_26156 ?auto_26162 ) ) ( not ( = ?auto_26156 ?auto_26176 ) ) ( not ( = ?auto_26156 ?auto_26159 ) ) ( not ( = ?auto_26156 ?auto_26140 ) ) ( not ( = ?auto_26156 ?auto_26158 ) ) ( not ( = ?auto_26156 ?auto_26178 ) ) ( not ( = ?auto_26156 ?auto_26177 ) ) ( not ( = ?auto_26156 ?auto_26148 ) ) ( not ( = ?auto_26147 ?auto_26149 ) ) ( not ( = ?auto_26147 ?auto_26166 ) ) ( not ( = ?auto_26147 ?auto_26164 ) ) ( not ( = ?auto_26147 ?auto_26143 ) ) ( not ( = ?auto_26147 ?auto_26145 ) ) ( not ( = ?auto_26147 ?auto_26171 ) ) ( not ( = ?auto_26147 ?auto_26141 ) ) ( not ( = ?auto_26147 ?auto_26150 ) ) ( not ( = ?auto_26147 ?auto_26157 ) ) ( not ( = ?auto_26152 ?auto_26153 ) ) ( not ( = ?auto_26152 ?auto_26154 ) ) ( not ( = ?auto_26152 ?auto_26173 ) ) ( not ( = ?auto_26152 ?auto_26161 ) ) ( not ( = ?auto_26152 ?auto_26168 ) ) ( not ( = ?auto_26152 ?auto_26179 ) ) ( not ( = ?auto_26152 ?auto_26170 ) ) ( not ( = ?auto_26152 ?auto_26163 ) ) ( not ( = ?auto_26152 ?auto_26174 ) ) ( not ( = ?auto_26152 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26128 ) ) ( not ( = ?auto_26116 ?auto_26139 ) ) ( not ( = ?auto_26117 ?auto_26128 ) ) ( not ( = ?auto_26117 ?auto_26139 ) ) ( not ( = ?auto_26118 ?auto_26128 ) ) ( not ( = ?auto_26118 ?auto_26139 ) ) ( not ( = ?auto_26119 ?auto_26128 ) ) ( not ( = ?auto_26119 ?auto_26139 ) ) ( not ( = ?auto_26120 ?auto_26128 ) ) ( not ( = ?auto_26120 ?auto_26139 ) ) ( not ( = ?auto_26121 ?auto_26128 ) ) ( not ( = ?auto_26121 ?auto_26139 ) ) ( not ( = ?auto_26124 ?auto_26128 ) ) ( not ( = ?auto_26124 ?auto_26139 ) ) ( not ( = ?auto_26123 ?auto_26128 ) ) ( not ( = ?auto_26123 ?auto_26139 ) ) ( not ( = ?auto_26122 ?auto_26128 ) ) ( not ( = ?auto_26122 ?auto_26139 ) ) ( not ( = ?auto_26125 ?auto_26128 ) ) ( not ( = ?auto_26125 ?auto_26139 ) ) ( not ( = ?auto_26127 ?auto_26128 ) ) ( not ( = ?auto_26127 ?auto_26139 ) ) ( not ( = ?auto_26128 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26153 ) ) ( not ( = ?auto_26128 ?auto_26154 ) ) ( not ( = ?auto_26128 ?auto_26173 ) ) ( not ( = ?auto_26128 ?auto_26161 ) ) ( not ( = ?auto_26128 ?auto_26168 ) ) ( not ( = ?auto_26128 ?auto_26179 ) ) ( not ( = ?auto_26128 ?auto_26170 ) ) ( not ( = ?auto_26128 ?auto_26163 ) ) ( not ( = ?auto_26128 ?auto_26174 ) ) ( not ( = ?auto_26128 ?auto_26167 ) ) ( not ( = ?auto_26134 ?auto_26156 ) ) ( not ( = ?auto_26134 ?auto_26151 ) ) ( not ( = ?auto_26134 ?auto_26162 ) ) ( not ( = ?auto_26134 ?auto_26176 ) ) ( not ( = ?auto_26134 ?auto_26159 ) ) ( not ( = ?auto_26134 ?auto_26140 ) ) ( not ( = ?auto_26134 ?auto_26158 ) ) ( not ( = ?auto_26134 ?auto_26178 ) ) ( not ( = ?auto_26134 ?auto_26177 ) ) ( not ( = ?auto_26134 ?auto_26148 ) ) ( not ( = ?auto_26138 ?auto_26147 ) ) ( not ( = ?auto_26138 ?auto_26149 ) ) ( not ( = ?auto_26138 ?auto_26166 ) ) ( not ( = ?auto_26138 ?auto_26164 ) ) ( not ( = ?auto_26138 ?auto_26143 ) ) ( not ( = ?auto_26138 ?auto_26145 ) ) ( not ( = ?auto_26138 ?auto_26171 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26150 ) ) ( not ( = ?auto_26138 ?auto_26157 ) ) ( not ( = ?auto_26139 ?auto_26152 ) ) ( not ( = ?auto_26139 ?auto_26153 ) ) ( not ( = ?auto_26139 ?auto_26154 ) ) ( not ( = ?auto_26139 ?auto_26173 ) ) ( not ( = ?auto_26139 ?auto_26161 ) ) ( not ( = ?auto_26139 ?auto_26168 ) ) ( not ( = ?auto_26139 ?auto_26179 ) ) ( not ( = ?auto_26139 ?auto_26170 ) ) ( not ( = ?auto_26139 ?auto_26163 ) ) ( not ( = ?auto_26139 ?auto_26174 ) ) ( not ( = ?auto_26139 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26130 ) ) ( not ( = ?auto_26116 ?auto_26160 ) ) ( not ( = ?auto_26117 ?auto_26130 ) ) ( not ( = ?auto_26117 ?auto_26160 ) ) ( not ( = ?auto_26118 ?auto_26130 ) ) ( not ( = ?auto_26118 ?auto_26160 ) ) ( not ( = ?auto_26119 ?auto_26130 ) ) ( not ( = ?auto_26119 ?auto_26160 ) ) ( not ( = ?auto_26120 ?auto_26130 ) ) ( not ( = ?auto_26120 ?auto_26160 ) ) ( not ( = ?auto_26121 ?auto_26130 ) ) ( not ( = ?auto_26121 ?auto_26160 ) ) ( not ( = ?auto_26124 ?auto_26130 ) ) ( not ( = ?auto_26124 ?auto_26160 ) ) ( not ( = ?auto_26123 ?auto_26130 ) ) ( not ( = ?auto_26123 ?auto_26160 ) ) ( not ( = ?auto_26122 ?auto_26130 ) ) ( not ( = ?auto_26122 ?auto_26160 ) ) ( not ( = ?auto_26125 ?auto_26130 ) ) ( not ( = ?auto_26125 ?auto_26160 ) ) ( not ( = ?auto_26127 ?auto_26130 ) ) ( not ( = ?auto_26127 ?auto_26160 ) ) ( not ( = ?auto_26126 ?auto_26130 ) ) ( not ( = ?auto_26126 ?auto_26160 ) ) ( not ( = ?auto_26130 ?auto_26139 ) ) ( not ( = ?auto_26130 ?auto_26152 ) ) ( not ( = ?auto_26130 ?auto_26153 ) ) ( not ( = ?auto_26130 ?auto_26154 ) ) ( not ( = ?auto_26130 ?auto_26173 ) ) ( not ( = ?auto_26130 ?auto_26161 ) ) ( not ( = ?auto_26130 ?auto_26168 ) ) ( not ( = ?auto_26130 ?auto_26179 ) ) ( not ( = ?auto_26130 ?auto_26170 ) ) ( not ( = ?auto_26130 ?auto_26163 ) ) ( not ( = ?auto_26130 ?auto_26174 ) ) ( not ( = ?auto_26130 ?auto_26167 ) ) ( not ( = ?auto_26142 ?auto_26134 ) ) ( not ( = ?auto_26142 ?auto_26156 ) ) ( not ( = ?auto_26142 ?auto_26151 ) ) ( not ( = ?auto_26142 ?auto_26162 ) ) ( not ( = ?auto_26142 ?auto_26176 ) ) ( not ( = ?auto_26142 ?auto_26159 ) ) ( not ( = ?auto_26142 ?auto_26140 ) ) ( not ( = ?auto_26142 ?auto_26158 ) ) ( not ( = ?auto_26142 ?auto_26178 ) ) ( not ( = ?auto_26142 ?auto_26177 ) ) ( not ( = ?auto_26142 ?auto_26148 ) ) ( not ( = ?auto_26155 ?auto_26138 ) ) ( not ( = ?auto_26155 ?auto_26147 ) ) ( not ( = ?auto_26155 ?auto_26149 ) ) ( not ( = ?auto_26155 ?auto_26166 ) ) ( not ( = ?auto_26155 ?auto_26164 ) ) ( not ( = ?auto_26155 ?auto_26143 ) ) ( not ( = ?auto_26155 ?auto_26145 ) ) ( not ( = ?auto_26155 ?auto_26171 ) ) ( not ( = ?auto_26155 ?auto_26141 ) ) ( not ( = ?auto_26155 ?auto_26150 ) ) ( not ( = ?auto_26155 ?auto_26157 ) ) ( not ( = ?auto_26160 ?auto_26139 ) ) ( not ( = ?auto_26160 ?auto_26152 ) ) ( not ( = ?auto_26160 ?auto_26153 ) ) ( not ( = ?auto_26160 ?auto_26154 ) ) ( not ( = ?auto_26160 ?auto_26173 ) ) ( not ( = ?auto_26160 ?auto_26161 ) ) ( not ( = ?auto_26160 ?auto_26168 ) ) ( not ( = ?auto_26160 ?auto_26179 ) ) ( not ( = ?auto_26160 ?auto_26170 ) ) ( not ( = ?auto_26160 ?auto_26163 ) ) ( not ( = ?auto_26160 ?auto_26174 ) ) ( not ( = ?auto_26160 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26129 ) ) ( not ( = ?auto_26116 ?auto_26172 ) ) ( not ( = ?auto_26117 ?auto_26129 ) ) ( not ( = ?auto_26117 ?auto_26172 ) ) ( not ( = ?auto_26118 ?auto_26129 ) ) ( not ( = ?auto_26118 ?auto_26172 ) ) ( not ( = ?auto_26119 ?auto_26129 ) ) ( not ( = ?auto_26119 ?auto_26172 ) ) ( not ( = ?auto_26120 ?auto_26129 ) ) ( not ( = ?auto_26120 ?auto_26172 ) ) ( not ( = ?auto_26121 ?auto_26129 ) ) ( not ( = ?auto_26121 ?auto_26172 ) ) ( not ( = ?auto_26124 ?auto_26129 ) ) ( not ( = ?auto_26124 ?auto_26172 ) ) ( not ( = ?auto_26123 ?auto_26129 ) ) ( not ( = ?auto_26123 ?auto_26172 ) ) ( not ( = ?auto_26122 ?auto_26129 ) ) ( not ( = ?auto_26122 ?auto_26172 ) ) ( not ( = ?auto_26125 ?auto_26129 ) ) ( not ( = ?auto_26125 ?auto_26172 ) ) ( not ( = ?auto_26127 ?auto_26129 ) ) ( not ( = ?auto_26127 ?auto_26172 ) ) ( not ( = ?auto_26126 ?auto_26129 ) ) ( not ( = ?auto_26126 ?auto_26172 ) ) ( not ( = ?auto_26128 ?auto_26129 ) ) ( not ( = ?auto_26128 ?auto_26172 ) ) ( not ( = ?auto_26129 ?auto_26160 ) ) ( not ( = ?auto_26129 ?auto_26139 ) ) ( not ( = ?auto_26129 ?auto_26152 ) ) ( not ( = ?auto_26129 ?auto_26153 ) ) ( not ( = ?auto_26129 ?auto_26154 ) ) ( not ( = ?auto_26129 ?auto_26173 ) ) ( not ( = ?auto_26129 ?auto_26161 ) ) ( not ( = ?auto_26129 ?auto_26168 ) ) ( not ( = ?auto_26129 ?auto_26179 ) ) ( not ( = ?auto_26129 ?auto_26170 ) ) ( not ( = ?auto_26129 ?auto_26163 ) ) ( not ( = ?auto_26129 ?auto_26174 ) ) ( not ( = ?auto_26129 ?auto_26167 ) ) ( not ( = ?auto_26144 ?auto_26142 ) ) ( not ( = ?auto_26144 ?auto_26134 ) ) ( not ( = ?auto_26144 ?auto_26156 ) ) ( not ( = ?auto_26144 ?auto_26151 ) ) ( not ( = ?auto_26144 ?auto_26162 ) ) ( not ( = ?auto_26144 ?auto_26176 ) ) ( not ( = ?auto_26144 ?auto_26159 ) ) ( not ( = ?auto_26144 ?auto_26140 ) ) ( not ( = ?auto_26144 ?auto_26158 ) ) ( not ( = ?auto_26144 ?auto_26178 ) ) ( not ( = ?auto_26144 ?auto_26177 ) ) ( not ( = ?auto_26144 ?auto_26148 ) ) ( not ( = ?auto_26169 ?auto_26155 ) ) ( not ( = ?auto_26169 ?auto_26138 ) ) ( not ( = ?auto_26169 ?auto_26147 ) ) ( not ( = ?auto_26169 ?auto_26149 ) ) ( not ( = ?auto_26169 ?auto_26166 ) ) ( not ( = ?auto_26169 ?auto_26164 ) ) ( not ( = ?auto_26169 ?auto_26143 ) ) ( not ( = ?auto_26169 ?auto_26145 ) ) ( not ( = ?auto_26169 ?auto_26171 ) ) ( not ( = ?auto_26169 ?auto_26141 ) ) ( not ( = ?auto_26169 ?auto_26150 ) ) ( not ( = ?auto_26169 ?auto_26157 ) ) ( not ( = ?auto_26172 ?auto_26160 ) ) ( not ( = ?auto_26172 ?auto_26139 ) ) ( not ( = ?auto_26172 ?auto_26152 ) ) ( not ( = ?auto_26172 ?auto_26153 ) ) ( not ( = ?auto_26172 ?auto_26154 ) ) ( not ( = ?auto_26172 ?auto_26173 ) ) ( not ( = ?auto_26172 ?auto_26161 ) ) ( not ( = ?auto_26172 ?auto_26168 ) ) ( not ( = ?auto_26172 ?auto_26179 ) ) ( not ( = ?auto_26172 ?auto_26170 ) ) ( not ( = ?auto_26172 ?auto_26163 ) ) ( not ( = ?auto_26172 ?auto_26174 ) ) ( not ( = ?auto_26172 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26131 ) ) ( not ( = ?auto_26116 ?auto_26146 ) ) ( not ( = ?auto_26117 ?auto_26131 ) ) ( not ( = ?auto_26117 ?auto_26146 ) ) ( not ( = ?auto_26118 ?auto_26131 ) ) ( not ( = ?auto_26118 ?auto_26146 ) ) ( not ( = ?auto_26119 ?auto_26131 ) ) ( not ( = ?auto_26119 ?auto_26146 ) ) ( not ( = ?auto_26120 ?auto_26131 ) ) ( not ( = ?auto_26120 ?auto_26146 ) ) ( not ( = ?auto_26121 ?auto_26131 ) ) ( not ( = ?auto_26121 ?auto_26146 ) ) ( not ( = ?auto_26124 ?auto_26131 ) ) ( not ( = ?auto_26124 ?auto_26146 ) ) ( not ( = ?auto_26123 ?auto_26131 ) ) ( not ( = ?auto_26123 ?auto_26146 ) ) ( not ( = ?auto_26122 ?auto_26131 ) ) ( not ( = ?auto_26122 ?auto_26146 ) ) ( not ( = ?auto_26125 ?auto_26131 ) ) ( not ( = ?auto_26125 ?auto_26146 ) ) ( not ( = ?auto_26127 ?auto_26131 ) ) ( not ( = ?auto_26127 ?auto_26146 ) ) ( not ( = ?auto_26126 ?auto_26131 ) ) ( not ( = ?auto_26126 ?auto_26146 ) ) ( not ( = ?auto_26128 ?auto_26131 ) ) ( not ( = ?auto_26128 ?auto_26146 ) ) ( not ( = ?auto_26130 ?auto_26131 ) ) ( not ( = ?auto_26130 ?auto_26146 ) ) ( not ( = ?auto_26131 ?auto_26172 ) ) ( not ( = ?auto_26131 ?auto_26160 ) ) ( not ( = ?auto_26131 ?auto_26139 ) ) ( not ( = ?auto_26131 ?auto_26152 ) ) ( not ( = ?auto_26131 ?auto_26153 ) ) ( not ( = ?auto_26131 ?auto_26154 ) ) ( not ( = ?auto_26131 ?auto_26173 ) ) ( not ( = ?auto_26131 ?auto_26161 ) ) ( not ( = ?auto_26131 ?auto_26168 ) ) ( not ( = ?auto_26131 ?auto_26179 ) ) ( not ( = ?auto_26131 ?auto_26170 ) ) ( not ( = ?auto_26131 ?auto_26163 ) ) ( not ( = ?auto_26131 ?auto_26174 ) ) ( not ( = ?auto_26131 ?auto_26167 ) ) ( not ( = ?auto_26165 ?auto_26144 ) ) ( not ( = ?auto_26165 ?auto_26142 ) ) ( not ( = ?auto_26165 ?auto_26134 ) ) ( not ( = ?auto_26165 ?auto_26156 ) ) ( not ( = ?auto_26165 ?auto_26151 ) ) ( not ( = ?auto_26165 ?auto_26162 ) ) ( not ( = ?auto_26165 ?auto_26176 ) ) ( not ( = ?auto_26165 ?auto_26159 ) ) ( not ( = ?auto_26165 ?auto_26140 ) ) ( not ( = ?auto_26165 ?auto_26158 ) ) ( not ( = ?auto_26165 ?auto_26178 ) ) ( not ( = ?auto_26165 ?auto_26177 ) ) ( not ( = ?auto_26165 ?auto_26148 ) ) ( not ( = ?auto_26175 ?auto_26169 ) ) ( not ( = ?auto_26175 ?auto_26155 ) ) ( not ( = ?auto_26175 ?auto_26138 ) ) ( not ( = ?auto_26175 ?auto_26147 ) ) ( not ( = ?auto_26175 ?auto_26149 ) ) ( not ( = ?auto_26175 ?auto_26166 ) ) ( not ( = ?auto_26175 ?auto_26164 ) ) ( not ( = ?auto_26175 ?auto_26143 ) ) ( not ( = ?auto_26175 ?auto_26145 ) ) ( not ( = ?auto_26175 ?auto_26171 ) ) ( not ( = ?auto_26175 ?auto_26141 ) ) ( not ( = ?auto_26175 ?auto_26150 ) ) ( not ( = ?auto_26175 ?auto_26157 ) ) ( not ( = ?auto_26146 ?auto_26172 ) ) ( not ( = ?auto_26146 ?auto_26160 ) ) ( not ( = ?auto_26146 ?auto_26139 ) ) ( not ( = ?auto_26146 ?auto_26152 ) ) ( not ( = ?auto_26146 ?auto_26153 ) ) ( not ( = ?auto_26146 ?auto_26154 ) ) ( not ( = ?auto_26146 ?auto_26173 ) ) ( not ( = ?auto_26146 ?auto_26161 ) ) ( not ( = ?auto_26146 ?auto_26168 ) ) ( not ( = ?auto_26146 ?auto_26179 ) ) ( not ( = ?auto_26146 ?auto_26170 ) ) ( not ( = ?auto_26146 ?auto_26163 ) ) ( not ( = ?auto_26146 ?auto_26174 ) ) ( not ( = ?auto_26146 ?auto_26167 ) ) ( not ( = ?auto_26116 ?auto_26132 ) ) ( not ( = ?auto_26116 ?auto_26136 ) ) ( not ( = ?auto_26117 ?auto_26132 ) ) ( not ( = ?auto_26117 ?auto_26136 ) ) ( not ( = ?auto_26118 ?auto_26132 ) ) ( not ( = ?auto_26118 ?auto_26136 ) ) ( not ( = ?auto_26119 ?auto_26132 ) ) ( not ( = ?auto_26119 ?auto_26136 ) ) ( not ( = ?auto_26120 ?auto_26132 ) ) ( not ( = ?auto_26120 ?auto_26136 ) ) ( not ( = ?auto_26121 ?auto_26132 ) ) ( not ( = ?auto_26121 ?auto_26136 ) ) ( not ( = ?auto_26124 ?auto_26132 ) ) ( not ( = ?auto_26124 ?auto_26136 ) ) ( not ( = ?auto_26123 ?auto_26132 ) ) ( not ( = ?auto_26123 ?auto_26136 ) ) ( not ( = ?auto_26122 ?auto_26132 ) ) ( not ( = ?auto_26122 ?auto_26136 ) ) ( not ( = ?auto_26125 ?auto_26132 ) ) ( not ( = ?auto_26125 ?auto_26136 ) ) ( not ( = ?auto_26127 ?auto_26132 ) ) ( not ( = ?auto_26127 ?auto_26136 ) ) ( not ( = ?auto_26126 ?auto_26132 ) ) ( not ( = ?auto_26126 ?auto_26136 ) ) ( not ( = ?auto_26128 ?auto_26132 ) ) ( not ( = ?auto_26128 ?auto_26136 ) ) ( not ( = ?auto_26130 ?auto_26132 ) ) ( not ( = ?auto_26130 ?auto_26136 ) ) ( not ( = ?auto_26129 ?auto_26132 ) ) ( not ( = ?auto_26129 ?auto_26136 ) ) ( not ( = ?auto_26132 ?auto_26146 ) ) ( not ( = ?auto_26132 ?auto_26172 ) ) ( not ( = ?auto_26132 ?auto_26160 ) ) ( not ( = ?auto_26132 ?auto_26139 ) ) ( not ( = ?auto_26132 ?auto_26152 ) ) ( not ( = ?auto_26132 ?auto_26153 ) ) ( not ( = ?auto_26132 ?auto_26154 ) ) ( not ( = ?auto_26132 ?auto_26173 ) ) ( not ( = ?auto_26132 ?auto_26161 ) ) ( not ( = ?auto_26132 ?auto_26168 ) ) ( not ( = ?auto_26132 ?auto_26179 ) ) ( not ( = ?auto_26132 ?auto_26170 ) ) ( not ( = ?auto_26132 ?auto_26163 ) ) ( not ( = ?auto_26132 ?auto_26174 ) ) ( not ( = ?auto_26132 ?auto_26167 ) ) ( not ( = ?auto_26136 ?auto_26146 ) ) ( not ( = ?auto_26136 ?auto_26172 ) ) ( not ( = ?auto_26136 ?auto_26160 ) ) ( not ( = ?auto_26136 ?auto_26139 ) ) ( not ( = ?auto_26136 ?auto_26152 ) ) ( not ( = ?auto_26136 ?auto_26153 ) ) ( not ( = ?auto_26136 ?auto_26154 ) ) ( not ( = ?auto_26136 ?auto_26173 ) ) ( not ( = ?auto_26136 ?auto_26161 ) ) ( not ( = ?auto_26136 ?auto_26168 ) ) ( not ( = ?auto_26136 ?auto_26179 ) ) ( not ( = ?auto_26136 ?auto_26170 ) ) ( not ( = ?auto_26136 ?auto_26163 ) ) ( not ( = ?auto_26136 ?auto_26174 ) ) ( not ( = ?auto_26136 ?auto_26167 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26116 ?auto_26117 ?auto_26118 ?auto_26119 ?auto_26120 ?auto_26121 ?auto_26124 ?auto_26123 ?auto_26122 ?auto_26125 ?auto_26127 ?auto_26126 ?auto_26128 ?auto_26130 ?auto_26129 ?auto_26131 )
      ( MAKE-1CRATE ?auto_26131 ?auto_26132 )
      ( MAKE-16CRATE-VERIFY ?auto_26116 ?auto_26117 ?auto_26118 ?auto_26119 ?auto_26120 ?auto_26121 ?auto_26124 ?auto_26123 ?auto_26122 ?auto_26125 ?auto_26127 ?auto_26126 ?auto_26128 ?auto_26130 ?auto_26129 ?auto_26131 ?auto_26132 ) )
  )

)

