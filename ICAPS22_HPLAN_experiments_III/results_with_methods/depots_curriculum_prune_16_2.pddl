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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25319 - SURFACE
      ?auto_25320 - SURFACE
      ?auto_25321 - SURFACE
    )
    :vars
    (
      ?auto_25324 - HOIST
      ?auto_25325 - PLACE
      ?auto_25322 - PLACE
      ?auto_25323 - HOIST
      ?auto_25327 - SURFACE
      ?auto_25328 - PLACE
      ?auto_25329 - HOIST
      ?auto_25330 - SURFACE
      ?auto_25326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25324 ?auto_25325 ) ( IS-CRATE ?auto_25321 ) ( not ( = ?auto_25322 ?auto_25325 ) ) ( HOIST-AT ?auto_25323 ?auto_25322 ) ( AVAILABLE ?auto_25323 ) ( SURFACE-AT ?auto_25321 ?auto_25322 ) ( ON ?auto_25321 ?auto_25327 ) ( CLEAR ?auto_25321 ) ( not ( = ?auto_25320 ?auto_25321 ) ) ( not ( = ?auto_25320 ?auto_25327 ) ) ( not ( = ?auto_25321 ?auto_25327 ) ) ( not ( = ?auto_25324 ?auto_25323 ) ) ( SURFACE-AT ?auto_25319 ?auto_25325 ) ( CLEAR ?auto_25319 ) ( IS-CRATE ?auto_25320 ) ( AVAILABLE ?auto_25324 ) ( not ( = ?auto_25328 ?auto_25325 ) ) ( HOIST-AT ?auto_25329 ?auto_25328 ) ( AVAILABLE ?auto_25329 ) ( SURFACE-AT ?auto_25320 ?auto_25328 ) ( ON ?auto_25320 ?auto_25330 ) ( CLEAR ?auto_25320 ) ( TRUCK-AT ?auto_25326 ?auto_25325 ) ( not ( = ?auto_25319 ?auto_25320 ) ) ( not ( = ?auto_25319 ?auto_25330 ) ) ( not ( = ?auto_25320 ?auto_25330 ) ) ( not ( = ?auto_25324 ?auto_25329 ) ) ( not ( = ?auto_25319 ?auto_25321 ) ) ( not ( = ?auto_25319 ?auto_25327 ) ) ( not ( = ?auto_25321 ?auto_25330 ) ) ( not ( = ?auto_25322 ?auto_25328 ) ) ( not ( = ?auto_25323 ?auto_25329 ) ) ( not ( = ?auto_25327 ?auto_25330 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25319 ?auto_25320 )
      ( MAKE-1CRATE ?auto_25320 ?auto_25321 )
      ( MAKE-2CRATE-VERIFY ?auto_25319 ?auto_25320 ?auto_25321 ) )
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
      ?auto_25353 - HOIST
      ?auto_25352 - PLACE
      ?auto_25351 - PLACE
      ?auto_25354 - HOIST
      ?auto_25350 - SURFACE
      ?auto_25358 - PLACE
      ?auto_25359 - HOIST
      ?auto_25355 - SURFACE
      ?auto_25360 - PLACE
      ?auto_25356 - HOIST
      ?auto_25357 - SURFACE
      ?auto_25349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25353 ?auto_25352 ) ( IS-CRATE ?auto_25348 ) ( not ( = ?auto_25351 ?auto_25352 ) ) ( HOIST-AT ?auto_25354 ?auto_25351 ) ( AVAILABLE ?auto_25354 ) ( SURFACE-AT ?auto_25348 ?auto_25351 ) ( ON ?auto_25348 ?auto_25350 ) ( CLEAR ?auto_25348 ) ( not ( = ?auto_25347 ?auto_25348 ) ) ( not ( = ?auto_25347 ?auto_25350 ) ) ( not ( = ?auto_25348 ?auto_25350 ) ) ( not ( = ?auto_25353 ?auto_25354 ) ) ( IS-CRATE ?auto_25347 ) ( not ( = ?auto_25358 ?auto_25352 ) ) ( HOIST-AT ?auto_25359 ?auto_25358 ) ( AVAILABLE ?auto_25359 ) ( SURFACE-AT ?auto_25347 ?auto_25358 ) ( ON ?auto_25347 ?auto_25355 ) ( CLEAR ?auto_25347 ) ( not ( = ?auto_25346 ?auto_25347 ) ) ( not ( = ?auto_25346 ?auto_25355 ) ) ( not ( = ?auto_25347 ?auto_25355 ) ) ( not ( = ?auto_25353 ?auto_25359 ) ) ( SURFACE-AT ?auto_25345 ?auto_25352 ) ( CLEAR ?auto_25345 ) ( IS-CRATE ?auto_25346 ) ( AVAILABLE ?auto_25353 ) ( not ( = ?auto_25360 ?auto_25352 ) ) ( HOIST-AT ?auto_25356 ?auto_25360 ) ( AVAILABLE ?auto_25356 ) ( SURFACE-AT ?auto_25346 ?auto_25360 ) ( ON ?auto_25346 ?auto_25357 ) ( CLEAR ?auto_25346 ) ( TRUCK-AT ?auto_25349 ?auto_25352 ) ( not ( = ?auto_25345 ?auto_25346 ) ) ( not ( = ?auto_25345 ?auto_25357 ) ) ( not ( = ?auto_25346 ?auto_25357 ) ) ( not ( = ?auto_25353 ?auto_25356 ) ) ( not ( = ?auto_25345 ?auto_25347 ) ) ( not ( = ?auto_25345 ?auto_25355 ) ) ( not ( = ?auto_25347 ?auto_25357 ) ) ( not ( = ?auto_25358 ?auto_25360 ) ) ( not ( = ?auto_25359 ?auto_25356 ) ) ( not ( = ?auto_25355 ?auto_25357 ) ) ( not ( = ?auto_25345 ?auto_25348 ) ) ( not ( = ?auto_25345 ?auto_25350 ) ) ( not ( = ?auto_25346 ?auto_25348 ) ) ( not ( = ?auto_25346 ?auto_25350 ) ) ( not ( = ?auto_25348 ?auto_25355 ) ) ( not ( = ?auto_25348 ?auto_25357 ) ) ( not ( = ?auto_25351 ?auto_25358 ) ) ( not ( = ?auto_25351 ?auto_25360 ) ) ( not ( = ?auto_25354 ?auto_25359 ) ) ( not ( = ?auto_25354 ?auto_25356 ) ) ( not ( = ?auto_25350 ?auto_25355 ) ) ( not ( = ?auto_25350 ?auto_25357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25345 ?auto_25346 ?auto_25347 )
      ( MAKE-1CRATE ?auto_25347 ?auto_25348 )
      ( MAKE-3CRATE-VERIFY ?auto_25345 ?auto_25346 ?auto_25347 ?auto_25348 ) )
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
      ?auto_25382 - PLACE
      ?auto_25381 - PLACE
      ?auto_25384 - HOIST
      ?auto_25386 - SURFACE
      ?auto_25387 - PLACE
      ?auto_25393 - HOIST
      ?auto_25390 - SURFACE
      ?auto_25391 - PLACE
      ?auto_25394 - HOIST
      ?auto_25392 - SURFACE
      ?auto_25395 - PLACE
      ?auto_25388 - HOIST
      ?auto_25389 - SURFACE
      ?auto_25383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25385 ?auto_25382 ) ( IS-CRATE ?auto_25380 ) ( not ( = ?auto_25381 ?auto_25382 ) ) ( HOIST-AT ?auto_25384 ?auto_25381 ) ( AVAILABLE ?auto_25384 ) ( SURFACE-AT ?auto_25380 ?auto_25381 ) ( ON ?auto_25380 ?auto_25386 ) ( CLEAR ?auto_25380 ) ( not ( = ?auto_25379 ?auto_25380 ) ) ( not ( = ?auto_25379 ?auto_25386 ) ) ( not ( = ?auto_25380 ?auto_25386 ) ) ( not ( = ?auto_25385 ?auto_25384 ) ) ( IS-CRATE ?auto_25379 ) ( not ( = ?auto_25387 ?auto_25382 ) ) ( HOIST-AT ?auto_25393 ?auto_25387 ) ( AVAILABLE ?auto_25393 ) ( SURFACE-AT ?auto_25379 ?auto_25387 ) ( ON ?auto_25379 ?auto_25390 ) ( CLEAR ?auto_25379 ) ( not ( = ?auto_25378 ?auto_25379 ) ) ( not ( = ?auto_25378 ?auto_25390 ) ) ( not ( = ?auto_25379 ?auto_25390 ) ) ( not ( = ?auto_25385 ?auto_25393 ) ) ( IS-CRATE ?auto_25378 ) ( not ( = ?auto_25391 ?auto_25382 ) ) ( HOIST-AT ?auto_25394 ?auto_25391 ) ( AVAILABLE ?auto_25394 ) ( SURFACE-AT ?auto_25378 ?auto_25391 ) ( ON ?auto_25378 ?auto_25392 ) ( CLEAR ?auto_25378 ) ( not ( = ?auto_25377 ?auto_25378 ) ) ( not ( = ?auto_25377 ?auto_25392 ) ) ( not ( = ?auto_25378 ?auto_25392 ) ) ( not ( = ?auto_25385 ?auto_25394 ) ) ( SURFACE-AT ?auto_25376 ?auto_25382 ) ( CLEAR ?auto_25376 ) ( IS-CRATE ?auto_25377 ) ( AVAILABLE ?auto_25385 ) ( not ( = ?auto_25395 ?auto_25382 ) ) ( HOIST-AT ?auto_25388 ?auto_25395 ) ( AVAILABLE ?auto_25388 ) ( SURFACE-AT ?auto_25377 ?auto_25395 ) ( ON ?auto_25377 ?auto_25389 ) ( CLEAR ?auto_25377 ) ( TRUCK-AT ?auto_25383 ?auto_25382 ) ( not ( = ?auto_25376 ?auto_25377 ) ) ( not ( = ?auto_25376 ?auto_25389 ) ) ( not ( = ?auto_25377 ?auto_25389 ) ) ( not ( = ?auto_25385 ?auto_25388 ) ) ( not ( = ?auto_25376 ?auto_25378 ) ) ( not ( = ?auto_25376 ?auto_25392 ) ) ( not ( = ?auto_25378 ?auto_25389 ) ) ( not ( = ?auto_25391 ?auto_25395 ) ) ( not ( = ?auto_25394 ?auto_25388 ) ) ( not ( = ?auto_25392 ?auto_25389 ) ) ( not ( = ?auto_25376 ?auto_25379 ) ) ( not ( = ?auto_25376 ?auto_25390 ) ) ( not ( = ?auto_25377 ?auto_25379 ) ) ( not ( = ?auto_25377 ?auto_25390 ) ) ( not ( = ?auto_25379 ?auto_25392 ) ) ( not ( = ?auto_25379 ?auto_25389 ) ) ( not ( = ?auto_25387 ?auto_25391 ) ) ( not ( = ?auto_25387 ?auto_25395 ) ) ( not ( = ?auto_25393 ?auto_25394 ) ) ( not ( = ?auto_25393 ?auto_25388 ) ) ( not ( = ?auto_25390 ?auto_25392 ) ) ( not ( = ?auto_25390 ?auto_25389 ) ) ( not ( = ?auto_25376 ?auto_25380 ) ) ( not ( = ?auto_25376 ?auto_25386 ) ) ( not ( = ?auto_25377 ?auto_25380 ) ) ( not ( = ?auto_25377 ?auto_25386 ) ) ( not ( = ?auto_25378 ?auto_25380 ) ) ( not ( = ?auto_25378 ?auto_25386 ) ) ( not ( = ?auto_25380 ?auto_25390 ) ) ( not ( = ?auto_25380 ?auto_25392 ) ) ( not ( = ?auto_25380 ?auto_25389 ) ) ( not ( = ?auto_25381 ?auto_25387 ) ) ( not ( = ?auto_25381 ?auto_25391 ) ) ( not ( = ?auto_25381 ?auto_25395 ) ) ( not ( = ?auto_25384 ?auto_25393 ) ) ( not ( = ?auto_25384 ?auto_25394 ) ) ( not ( = ?auto_25384 ?auto_25388 ) ) ( not ( = ?auto_25386 ?auto_25390 ) ) ( not ( = ?auto_25386 ?auto_25392 ) ) ( not ( = ?auto_25386 ?auto_25389 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_25376 ?auto_25377 ?auto_25378 ?auto_25379 )
      ( MAKE-1CRATE ?auto_25379 ?auto_25380 )
      ( MAKE-4CRATE-VERIFY ?auto_25376 ?auto_25377 ?auto_25378 ?auto_25379 ?auto_25380 ) )
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
      ?auto_25418 - HOIST
      ?auto_25421 - PLACE
      ?auto_25419 - PLACE
      ?auto_25423 - HOIST
      ?auto_25422 - SURFACE
      ?auto_25431 - PLACE
      ?auto_25428 - HOIST
      ?auto_25429 - SURFACE
      ?auto_25426 - SURFACE
      ?auto_25432 - PLACE
      ?auto_25430 - HOIST
      ?auto_25427 - SURFACE
      ?auto_25433 - PLACE
      ?auto_25425 - HOIST
      ?auto_25424 - SURFACE
      ?auto_25420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25418 ?auto_25421 ) ( IS-CRATE ?auto_25417 ) ( not ( = ?auto_25419 ?auto_25421 ) ) ( HOIST-AT ?auto_25423 ?auto_25419 ) ( SURFACE-AT ?auto_25417 ?auto_25419 ) ( ON ?auto_25417 ?auto_25422 ) ( CLEAR ?auto_25417 ) ( not ( = ?auto_25416 ?auto_25417 ) ) ( not ( = ?auto_25416 ?auto_25422 ) ) ( not ( = ?auto_25417 ?auto_25422 ) ) ( not ( = ?auto_25418 ?auto_25423 ) ) ( IS-CRATE ?auto_25416 ) ( not ( = ?auto_25431 ?auto_25421 ) ) ( HOIST-AT ?auto_25428 ?auto_25431 ) ( AVAILABLE ?auto_25428 ) ( SURFACE-AT ?auto_25416 ?auto_25431 ) ( ON ?auto_25416 ?auto_25429 ) ( CLEAR ?auto_25416 ) ( not ( = ?auto_25415 ?auto_25416 ) ) ( not ( = ?auto_25415 ?auto_25429 ) ) ( not ( = ?auto_25416 ?auto_25429 ) ) ( not ( = ?auto_25418 ?auto_25428 ) ) ( IS-CRATE ?auto_25415 ) ( AVAILABLE ?auto_25423 ) ( SURFACE-AT ?auto_25415 ?auto_25419 ) ( ON ?auto_25415 ?auto_25426 ) ( CLEAR ?auto_25415 ) ( not ( = ?auto_25414 ?auto_25415 ) ) ( not ( = ?auto_25414 ?auto_25426 ) ) ( not ( = ?auto_25415 ?auto_25426 ) ) ( IS-CRATE ?auto_25414 ) ( not ( = ?auto_25432 ?auto_25421 ) ) ( HOIST-AT ?auto_25430 ?auto_25432 ) ( AVAILABLE ?auto_25430 ) ( SURFACE-AT ?auto_25414 ?auto_25432 ) ( ON ?auto_25414 ?auto_25427 ) ( CLEAR ?auto_25414 ) ( not ( = ?auto_25413 ?auto_25414 ) ) ( not ( = ?auto_25413 ?auto_25427 ) ) ( not ( = ?auto_25414 ?auto_25427 ) ) ( not ( = ?auto_25418 ?auto_25430 ) ) ( SURFACE-AT ?auto_25412 ?auto_25421 ) ( CLEAR ?auto_25412 ) ( IS-CRATE ?auto_25413 ) ( AVAILABLE ?auto_25418 ) ( not ( = ?auto_25433 ?auto_25421 ) ) ( HOIST-AT ?auto_25425 ?auto_25433 ) ( AVAILABLE ?auto_25425 ) ( SURFACE-AT ?auto_25413 ?auto_25433 ) ( ON ?auto_25413 ?auto_25424 ) ( CLEAR ?auto_25413 ) ( TRUCK-AT ?auto_25420 ?auto_25421 ) ( not ( = ?auto_25412 ?auto_25413 ) ) ( not ( = ?auto_25412 ?auto_25424 ) ) ( not ( = ?auto_25413 ?auto_25424 ) ) ( not ( = ?auto_25418 ?auto_25425 ) ) ( not ( = ?auto_25412 ?auto_25414 ) ) ( not ( = ?auto_25412 ?auto_25427 ) ) ( not ( = ?auto_25414 ?auto_25424 ) ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25430 ?auto_25425 ) ) ( not ( = ?auto_25427 ?auto_25424 ) ) ( not ( = ?auto_25412 ?auto_25415 ) ) ( not ( = ?auto_25412 ?auto_25426 ) ) ( not ( = ?auto_25413 ?auto_25415 ) ) ( not ( = ?auto_25413 ?auto_25426 ) ) ( not ( = ?auto_25415 ?auto_25427 ) ) ( not ( = ?auto_25415 ?auto_25424 ) ) ( not ( = ?auto_25419 ?auto_25432 ) ) ( not ( = ?auto_25419 ?auto_25433 ) ) ( not ( = ?auto_25423 ?auto_25430 ) ) ( not ( = ?auto_25423 ?auto_25425 ) ) ( not ( = ?auto_25426 ?auto_25427 ) ) ( not ( = ?auto_25426 ?auto_25424 ) ) ( not ( = ?auto_25412 ?auto_25416 ) ) ( not ( = ?auto_25412 ?auto_25429 ) ) ( not ( = ?auto_25413 ?auto_25416 ) ) ( not ( = ?auto_25413 ?auto_25429 ) ) ( not ( = ?auto_25414 ?auto_25416 ) ) ( not ( = ?auto_25414 ?auto_25429 ) ) ( not ( = ?auto_25416 ?auto_25426 ) ) ( not ( = ?auto_25416 ?auto_25427 ) ) ( not ( = ?auto_25416 ?auto_25424 ) ) ( not ( = ?auto_25431 ?auto_25419 ) ) ( not ( = ?auto_25431 ?auto_25432 ) ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25428 ?auto_25423 ) ) ( not ( = ?auto_25428 ?auto_25430 ) ) ( not ( = ?auto_25428 ?auto_25425 ) ) ( not ( = ?auto_25429 ?auto_25426 ) ) ( not ( = ?auto_25429 ?auto_25427 ) ) ( not ( = ?auto_25429 ?auto_25424 ) ) ( not ( = ?auto_25412 ?auto_25417 ) ) ( not ( = ?auto_25412 ?auto_25422 ) ) ( not ( = ?auto_25413 ?auto_25417 ) ) ( not ( = ?auto_25413 ?auto_25422 ) ) ( not ( = ?auto_25414 ?auto_25417 ) ) ( not ( = ?auto_25414 ?auto_25422 ) ) ( not ( = ?auto_25415 ?auto_25417 ) ) ( not ( = ?auto_25415 ?auto_25422 ) ) ( not ( = ?auto_25417 ?auto_25429 ) ) ( not ( = ?auto_25417 ?auto_25426 ) ) ( not ( = ?auto_25417 ?auto_25427 ) ) ( not ( = ?auto_25417 ?auto_25424 ) ) ( not ( = ?auto_25422 ?auto_25429 ) ) ( not ( = ?auto_25422 ?auto_25426 ) ) ( not ( = ?auto_25422 ?auto_25427 ) ) ( not ( = ?auto_25422 ?auto_25424 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_25412 ?auto_25413 ?auto_25414 ?auto_25415 ?auto_25416 )
      ( MAKE-1CRATE ?auto_25416 ?auto_25417 )
      ( MAKE-5CRATE-VERIFY ?auto_25412 ?auto_25413 ?auto_25414 ?auto_25415 ?auto_25416 ?auto_25417 ) )
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
      ?auto_25462 - HOIST
      ?auto_25461 - PLACE
      ?auto_25463 - PLACE
      ?auto_25460 - HOIST
      ?auto_25459 - SURFACE
      ?auto_25464 - PLACE
      ?auto_25474 - HOIST
      ?auto_25473 - SURFACE
      ?auto_25467 - PLACE
      ?auto_25472 - HOIST
      ?auto_25471 - SURFACE
      ?auto_25469 - SURFACE
      ?auto_25476 - PLACE
      ?auto_25468 - HOIST
      ?auto_25475 - SURFACE
      ?auto_25466 - PLACE
      ?auto_25470 - HOIST
      ?auto_25465 - SURFACE
      ?auto_25458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25462 ?auto_25461 ) ( IS-CRATE ?auto_25457 ) ( not ( = ?auto_25463 ?auto_25461 ) ) ( HOIST-AT ?auto_25460 ?auto_25463 ) ( AVAILABLE ?auto_25460 ) ( SURFACE-AT ?auto_25457 ?auto_25463 ) ( ON ?auto_25457 ?auto_25459 ) ( CLEAR ?auto_25457 ) ( not ( = ?auto_25456 ?auto_25457 ) ) ( not ( = ?auto_25456 ?auto_25459 ) ) ( not ( = ?auto_25457 ?auto_25459 ) ) ( not ( = ?auto_25462 ?auto_25460 ) ) ( IS-CRATE ?auto_25456 ) ( not ( = ?auto_25464 ?auto_25461 ) ) ( HOIST-AT ?auto_25474 ?auto_25464 ) ( SURFACE-AT ?auto_25456 ?auto_25464 ) ( ON ?auto_25456 ?auto_25473 ) ( CLEAR ?auto_25456 ) ( not ( = ?auto_25455 ?auto_25456 ) ) ( not ( = ?auto_25455 ?auto_25473 ) ) ( not ( = ?auto_25456 ?auto_25473 ) ) ( not ( = ?auto_25462 ?auto_25474 ) ) ( IS-CRATE ?auto_25455 ) ( not ( = ?auto_25467 ?auto_25461 ) ) ( HOIST-AT ?auto_25472 ?auto_25467 ) ( AVAILABLE ?auto_25472 ) ( SURFACE-AT ?auto_25455 ?auto_25467 ) ( ON ?auto_25455 ?auto_25471 ) ( CLEAR ?auto_25455 ) ( not ( = ?auto_25454 ?auto_25455 ) ) ( not ( = ?auto_25454 ?auto_25471 ) ) ( not ( = ?auto_25455 ?auto_25471 ) ) ( not ( = ?auto_25462 ?auto_25472 ) ) ( IS-CRATE ?auto_25454 ) ( AVAILABLE ?auto_25474 ) ( SURFACE-AT ?auto_25454 ?auto_25464 ) ( ON ?auto_25454 ?auto_25469 ) ( CLEAR ?auto_25454 ) ( not ( = ?auto_25453 ?auto_25454 ) ) ( not ( = ?auto_25453 ?auto_25469 ) ) ( not ( = ?auto_25454 ?auto_25469 ) ) ( IS-CRATE ?auto_25453 ) ( not ( = ?auto_25476 ?auto_25461 ) ) ( HOIST-AT ?auto_25468 ?auto_25476 ) ( AVAILABLE ?auto_25468 ) ( SURFACE-AT ?auto_25453 ?auto_25476 ) ( ON ?auto_25453 ?auto_25475 ) ( CLEAR ?auto_25453 ) ( not ( = ?auto_25452 ?auto_25453 ) ) ( not ( = ?auto_25452 ?auto_25475 ) ) ( not ( = ?auto_25453 ?auto_25475 ) ) ( not ( = ?auto_25462 ?auto_25468 ) ) ( SURFACE-AT ?auto_25451 ?auto_25461 ) ( CLEAR ?auto_25451 ) ( IS-CRATE ?auto_25452 ) ( AVAILABLE ?auto_25462 ) ( not ( = ?auto_25466 ?auto_25461 ) ) ( HOIST-AT ?auto_25470 ?auto_25466 ) ( AVAILABLE ?auto_25470 ) ( SURFACE-AT ?auto_25452 ?auto_25466 ) ( ON ?auto_25452 ?auto_25465 ) ( CLEAR ?auto_25452 ) ( TRUCK-AT ?auto_25458 ?auto_25461 ) ( not ( = ?auto_25451 ?auto_25452 ) ) ( not ( = ?auto_25451 ?auto_25465 ) ) ( not ( = ?auto_25452 ?auto_25465 ) ) ( not ( = ?auto_25462 ?auto_25470 ) ) ( not ( = ?auto_25451 ?auto_25453 ) ) ( not ( = ?auto_25451 ?auto_25475 ) ) ( not ( = ?auto_25453 ?auto_25465 ) ) ( not ( = ?auto_25476 ?auto_25466 ) ) ( not ( = ?auto_25468 ?auto_25470 ) ) ( not ( = ?auto_25475 ?auto_25465 ) ) ( not ( = ?auto_25451 ?auto_25454 ) ) ( not ( = ?auto_25451 ?auto_25469 ) ) ( not ( = ?auto_25452 ?auto_25454 ) ) ( not ( = ?auto_25452 ?auto_25469 ) ) ( not ( = ?auto_25454 ?auto_25475 ) ) ( not ( = ?auto_25454 ?auto_25465 ) ) ( not ( = ?auto_25464 ?auto_25476 ) ) ( not ( = ?auto_25464 ?auto_25466 ) ) ( not ( = ?auto_25474 ?auto_25468 ) ) ( not ( = ?auto_25474 ?auto_25470 ) ) ( not ( = ?auto_25469 ?auto_25475 ) ) ( not ( = ?auto_25469 ?auto_25465 ) ) ( not ( = ?auto_25451 ?auto_25455 ) ) ( not ( = ?auto_25451 ?auto_25471 ) ) ( not ( = ?auto_25452 ?auto_25455 ) ) ( not ( = ?auto_25452 ?auto_25471 ) ) ( not ( = ?auto_25453 ?auto_25455 ) ) ( not ( = ?auto_25453 ?auto_25471 ) ) ( not ( = ?auto_25455 ?auto_25469 ) ) ( not ( = ?auto_25455 ?auto_25475 ) ) ( not ( = ?auto_25455 ?auto_25465 ) ) ( not ( = ?auto_25467 ?auto_25464 ) ) ( not ( = ?auto_25467 ?auto_25476 ) ) ( not ( = ?auto_25467 ?auto_25466 ) ) ( not ( = ?auto_25472 ?auto_25474 ) ) ( not ( = ?auto_25472 ?auto_25468 ) ) ( not ( = ?auto_25472 ?auto_25470 ) ) ( not ( = ?auto_25471 ?auto_25469 ) ) ( not ( = ?auto_25471 ?auto_25475 ) ) ( not ( = ?auto_25471 ?auto_25465 ) ) ( not ( = ?auto_25451 ?auto_25456 ) ) ( not ( = ?auto_25451 ?auto_25473 ) ) ( not ( = ?auto_25452 ?auto_25456 ) ) ( not ( = ?auto_25452 ?auto_25473 ) ) ( not ( = ?auto_25453 ?auto_25456 ) ) ( not ( = ?auto_25453 ?auto_25473 ) ) ( not ( = ?auto_25454 ?auto_25456 ) ) ( not ( = ?auto_25454 ?auto_25473 ) ) ( not ( = ?auto_25456 ?auto_25471 ) ) ( not ( = ?auto_25456 ?auto_25469 ) ) ( not ( = ?auto_25456 ?auto_25475 ) ) ( not ( = ?auto_25456 ?auto_25465 ) ) ( not ( = ?auto_25473 ?auto_25471 ) ) ( not ( = ?auto_25473 ?auto_25469 ) ) ( not ( = ?auto_25473 ?auto_25475 ) ) ( not ( = ?auto_25473 ?auto_25465 ) ) ( not ( = ?auto_25451 ?auto_25457 ) ) ( not ( = ?auto_25451 ?auto_25459 ) ) ( not ( = ?auto_25452 ?auto_25457 ) ) ( not ( = ?auto_25452 ?auto_25459 ) ) ( not ( = ?auto_25453 ?auto_25457 ) ) ( not ( = ?auto_25453 ?auto_25459 ) ) ( not ( = ?auto_25454 ?auto_25457 ) ) ( not ( = ?auto_25454 ?auto_25459 ) ) ( not ( = ?auto_25455 ?auto_25457 ) ) ( not ( = ?auto_25455 ?auto_25459 ) ) ( not ( = ?auto_25457 ?auto_25473 ) ) ( not ( = ?auto_25457 ?auto_25471 ) ) ( not ( = ?auto_25457 ?auto_25469 ) ) ( not ( = ?auto_25457 ?auto_25475 ) ) ( not ( = ?auto_25457 ?auto_25465 ) ) ( not ( = ?auto_25463 ?auto_25464 ) ) ( not ( = ?auto_25463 ?auto_25467 ) ) ( not ( = ?auto_25463 ?auto_25476 ) ) ( not ( = ?auto_25463 ?auto_25466 ) ) ( not ( = ?auto_25460 ?auto_25474 ) ) ( not ( = ?auto_25460 ?auto_25472 ) ) ( not ( = ?auto_25460 ?auto_25468 ) ) ( not ( = ?auto_25460 ?auto_25470 ) ) ( not ( = ?auto_25459 ?auto_25473 ) ) ( not ( = ?auto_25459 ?auto_25471 ) ) ( not ( = ?auto_25459 ?auto_25469 ) ) ( not ( = ?auto_25459 ?auto_25475 ) ) ( not ( = ?auto_25459 ?auto_25465 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_25451 ?auto_25452 ?auto_25453 ?auto_25454 ?auto_25455 ?auto_25456 )
      ( MAKE-1CRATE ?auto_25456 ?auto_25457 )
      ( MAKE-6CRATE-VERIFY ?auto_25451 ?auto_25452 ?auto_25453 ?auto_25454 ?auto_25455 ?auto_25456 ?auto_25457 ) )
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
      ?auto_25501 - SURFACE
      ?auto_25502 - SURFACE
    )
    :vars
    (
      ?auto_25504 - HOIST
      ?auto_25508 - PLACE
      ?auto_25507 - PLACE
      ?auto_25505 - HOIST
      ?auto_25506 - SURFACE
      ?auto_25509 - PLACE
      ?auto_25515 - HOIST
      ?auto_25519 - SURFACE
      ?auto_25516 - PLACE
      ?auto_25518 - HOIST
      ?auto_25510 - SURFACE
      ?auto_25520 - PLACE
      ?auto_25517 - HOIST
      ?auto_25513 - SURFACE
      ?auto_25524 - SURFACE
      ?auto_25512 - PLACE
      ?auto_25523 - HOIST
      ?auto_25511 - SURFACE
      ?auto_25521 - PLACE
      ?auto_25514 - HOIST
      ?auto_25522 - SURFACE
      ?auto_25503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25504 ?auto_25508 ) ( IS-CRATE ?auto_25502 ) ( not ( = ?auto_25507 ?auto_25508 ) ) ( HOIST-AT ?auto_25505 ?auto_25507 ) ( AVAILABLE ?auto_25505 ) ( SURFACE-AT ?auto_25502 ?auto_25507 ) ( ON ?auto_25502 ?auto_25506 ) ( CLEAR ?auto_25502 ) ( not ( = ?auto_25501 ?auto_25502 ) ) ( not ( = ?auto_25501 ?auto_25506 ) ) ( not ( = ?auto_25502 ?auto_25506 ) ) ( not ( = ?auto_25504 ?auto_25505 ) ) ( IS-CRATE ?auto_25501 ) ( not ( = ?auto_25509 ?auto_25508 ) ) ( HOIST-AT ?auto_25515 ?auto_25509 ) ( AVAILABLE ?auto_25515 ) ( SURFACE-AT ?auto_25501 ?auto_25509 ) ( ON ?auto_25501 ?auto_25519 ) ( CLEAR ?auto_25501 ) ( not ( = ?auto_25500 ?auto_25501 ) ) ( not ( = ?auto_25500 ?auto_25519 ) ) ( not ( = ?auto_25501 ?auto_25519 ) ) ( not ( = ?auto_25504 ?auto_25515 ) ) ( IS-CRATE ?auto_25500 ) ( not ( = ?auto_25516 ?auto_25508 ) ) ( HOIST-AT ?auto_25518 ?auto_25516 ) ( SURFACE-AT ?auto_25500 ?auto_25516 ) ( ON ?auto_25500 ?auto_25510 ) ( CLEAR ?auto_25500 ) ( not ( = ?auto_25499 ?auto_25500 ) ) ( not ( = ?auto_25499 ?auto_25510 ) ) ( not ( = ?auto_25500 ?auto_25510 ) ) ( not ( = ?auto_25504 ?auto_25518 ) ) ( IS-CRATE ?auto_25499 ) ( not ( = ?auto_25520 ?auto_25508 ) ) ( HOIST-AT ?auto_25517 ?auto_25520 ) ( AVAILABLE ?auto_25517 ) ( SURFACE-AT ?auto_25499 ?auto_25520 ) ( ON ?auto_25499 ?auto_25513 ) ( CLEAR ?auto_25499 ) ( not ( = ?auto_25498 ?auto_25499 ) ) ( not ( = ?auto_25498 ?auto_25513 ) ) ( not ( = ?auto_25499 ?auto_25513 ) ) ( not ( = ?auto_25504 ?auto_25517 ) ) ( IS-CRATE ?auto_25498 ) ( AVAILABLE ?auto_25518 ) ( SURFACE-AT ?auto_25498 ?auto_25516 ) ( ON ?auto_25498 ?auto_25524 ) ( CLEAR ?auto_25498 ) ( not ( = ?auto_25497 ?auto_25498 ) ) ( not ( = ?auto_25497 ?auto_25524 ) ) ( not ( = ?auto_25498 ?auto_25524 ) ) ( IS-CRATE ?auto_25497 ) ( not ( = ?auto_25512 ?auto_25508 ) ) ( HOIST-AT ?auto_25523 ?auto_25512 ) ( AVAILABLE ?auto_25523 ) ( SURFACE-AT ?auto_25497 ?auto_25512 ) ( ON ?auto_25497 ?auto_25511 ) ( CLEAR ?auto_25497 ) ( not ( = ?auto_25496 ?auto_25497 ) ) ( not ( = ?auto_25496 ?auto_25511 ) ) ( not ( = ?auto_25497 ?auto_25511 ) ) ( not ( = ?auto_25504 ?auto_25523 ) ) ( SURFACE-AT ?auto_25495 ?auto_25508 ) ( CLEAR ?auto_25495 ) ( IS-CRATE ?auto_25496 ) ( AVAILABLE ?auto_25504 ) ( not ( = ?auto_25521 ?auto_25508 ) ) ( HOIST-AT ?auto_25514 ?auto_25521 ) ( AVAILABLE ?auto_25514 ) ( SURFACE-AT ?auto_25496 ?auto_25521 ) ( ON ?auto_25496 ?auto_25522 ) ( CLEAR ?auto_25496 ) ( TRUCK-AT ?auto_25503 ?auto_25508 ) ( not ( = ?auto_25495 ?auto_25496 ) ) ( not ( = ?auto_25495 ?auto_25522 ) ) ( not ( = ?auto_25496 ?auto_25522 ) ) ( not ( = ?auto_25504 ?auto_25514 ) ) ( not ( = ?auto_25495 ?auto_25497 ) ) ( not ( = ?auto_25495 ?auto_25511 ) ) ( not ( = ?auto_25497 ?auto_25522 ) ) ( not ( = ?auto_25512 ?auto_25521 ) ) ( not ( = ?auto_25523 ?auto_25514 ) ) ( not ( = ?auto_25511 ?auto_25522 ) ) ( not ( = ?auto_25495 ?auto_25498 ) ) ( not ( = ?auto_25495 ?auto_25524 ) ) ( not ( = ?auto_25496 ?auto_25498 ) ) ( not ( = ?auto_25496 ?auto_25524 ) ) ( not ( = ?auto_25498 ?auto_25511 ) ) ( not ( = ?auto_25498 ?auto_25522 ) ) ( not ( = ?auto_25516 ?auto_25512 ) ) ( not ( = ?auto_25516 ?auto_25521 ) ) ( not ( = ?auto_25518 ?auto_25523 ) ) ( not ( = ?auto_25518 ?auto_25514 ) ) ( not ( = ?auto_25524 ?auto_25511 ) ) ( not ( = ?auto_25524 ?auto_25522 ) ) ( not ( = ?auto_25495 ?auto_25499 ) ) ( not ( = ?auto_25495 ?auto_25513 ) ) ( not ( = ?auto_25496 ?auto_25499 ) ) ( not ( = ?auto_25496 ?auto_25513 ) ) ( not ( = ?auto_25497 ?auto_25499 ) ) ( not ( = ?auto_25497 ?auto_25513 ) ) ( not ( = ?auto_25499 ?auto_25524 ) ) ( not ( = ?auto_25499 ?auto_25511 ) ) ( not ( = ?auto_25499 ?auto_25522 ) ) ( not ( = ?auto_25520 ?auto_25516 ) ) ( not ( = ?auto_25520 ?auto_25512 ) ) ( not ( = ?auto_25520 ?auto_25521 ) ) ( not ( = ?auto_25517 ?auto_25518 ) ) ( not ( = ?auto_25517 ?auto_25523 ) ) ( not ( = ?auto_25517 ?auto_25514 ) ) ( not ( = ?auto_25513 ?auto_25524 ) ) ( not ( = ?auto_25513 ?auto_25511 ) ) ( not ( = ?auto_25513 ?auto_25522 ) ) ( not ( = ?auto_25495 ?auto_25500 ) ) ( not ( = ?auto_25495 ?auto_25510 ) ) ( not ( = ?auto_25496 ?auto_25500 ) ) ( not ( = ?auto_25496 ?auto_25510 ) ) ( not ( = ?auto_25497 ?auto_25500 ) ) ( not ( = ?auto_25497 ?auto_25510 ) ) ( not ( = ?auto_25498 ?auto_25500 ) ) ( not ( = ?auto_25498 ?auto_25510 ) ) ( not ( = ?auto_25500 ?auto_25513 ) ) ( not ( = ?auto_25500 ?auto_25524 ) ) ( not ( = ?auto_25500 ?auto_25511 ) ) ( not ( = ?auto_25500 ?auto_25522 ) ) ( not ( = ?auto_25510 ?auto_25513 ) ) ( not ( = ?auto_25510 ?auto_25524 ) ) ( not ( = ?auto_25510 ?auto_25511 ) ) ( not ( = ?auto_25510 ?auto_25522 ) ) ( not ( = ?auto_25495 ?auto_25501 ) ) ( not ( = ?auto_25495 ?auto_25519 ) ) ( not ( = ?auto_25496 ?auto_25501 ) ) ( not ( = ?auto_25496 ?auto_25519 ) ) ( not ( = ?auto_25497 ?auto_25501 ) ) ( not ( = ?auto_25497 ?auto_25519 ) ) ( not ( = ?auto_25498 ?auto_25501 ) ) ( not ( = ?auto_25498 ?auto_25519 ) ) ( not ( = ?auto_25499 ?auto_25501 ) ) ( not ( = ?auto_25499 ?auto_25519 ) ) ( not ( = ?auto_25501 ?auto_25510 ) ) ( not ( = ?auto_25501 ?auto_25513 ) ) ( not ( = ?auto_25501 ?auto_25524 ) ) ( not ( = ?auto_25501 ?auto_25511 ) ) ( not ( = ?auto_25501 ?auto_25522 ) ) ( not ( = ?auto_25509 ?auto_25516 ) ) ( not ( = ?auto_25509 ?auto_25520 ) ) ( not ( = ?auto_25509 ?auto_25512 ) ) ( not ( = ?auto_25509 ?auto_25521 ) ) ( not ( = ?auto_25515 ?auto_25518 ) ) ( not ( = ?auto_25515 ?auto_25517 ) ) ( not ( = ?auto_25515 ?auto_25523 ) ) ( not ( = ?auto_25515 ?auto_25514 ) ) ( not ( = ?auto_25519 ?auto_25510 ) ) ( not ( = ?auto_25519 ?auto_25513 ) ) ( not ( = ?auto_25519 ?auto_25524 ) ) ( not ( = ?auto_25519 ?auto_25511 ) ) ( not ( = ?auto_25519 ?auto_25522 ) ) ( not ( = ?auto_25495 ?auto_25502 ) ) ( not ( = ?auto_25495 ?auto_25506 ) ) ( not ( = ?auto_25496 ?auto_25502 ) ) ( not ( = ?auto_25496 ?auto_25506 ) ) ( not ( = ?auto_25497 ?auto_25502 ) ) ( not ( = ?auto_25497 ?auto_25506 ) ) ( not ( = ?auto_25498 ?auto_25502 ) ) ( not ( = ?auto_25498 ?auto_25506 ) ) ( not ( = ?auto_25499 ?auto_25502 ) ) ( not ( = ?auto_25499 ?auto_25506 ) ) ( not ( = ?auto_25500 ?auto_25502 ) ) ( not ( = ?auto_25500 ?auto_25506 ) ) ( not ( = ?auto_25502 ?auto_25519 ) ) ( not ( = ?auto_25502 ?auto_25510 ) ) ( not ( = ?auto_25502 ?auto_25513 ) ) ( not ( = ?auto_25502 ?auto_25524 ) ) ( not ( = ?auto_25502 ?auto_25511 ) ) ( not ( = ?auto_25502 ?auto_25522 ) ) ( not ( = ?auto_25507 ?auto_25509 ) ) ( not ( = ?auto_25507 ?auto_25516 ) ) ( not ( = ?auto_25507 ?auto_25520 ) ) ( not ( = ?auto_25507 ?auto_25512 ) ) ( not ( = ?auto_25507 ?auto_25521 ) ) ( not ( = ?auto_25505 ?auto_25515 ) ) ( not ( = ?auto_25505 ?auto_25518 ) ) ( not ( = ?auto_25505 ?auto_25517 ) ) ( not ( = ?auto_25505 ?auto_25523 ) ) ( not ( = ?auto_25505 ?auto_25514 ) ) ( not ( = ?auto_25506 ?auto_25519 ) ) ( not ( = ?auto_25506 ?auto_25510 ) ) ( not ( = ?auto_25506 ?auto_25513 ) ) ( not ( = ?auto_25506 ?auto_25524 ) ) ( not ( = ?auto_25506 ?auto_25511 ) ) ( not ( = ?auto_25506 ?auto_25522 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_25495 ?auto_25496 ?auto_25497 ?auto_25498 ?auto_25499 ?auto_25500 ?auto_25501 )
      ( MAKE-1CRATE ?auto_25501 ?auto_25502 )
      ( MAKE-7CRATE-VERIFY ?auto_25495 ?auto_25496 ?auto_25497 ?auto_25498 ?auto_25499 ?auto_25500 ?auto_25501 ?auto_25502 ) )
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
      ?auto_25550 - SURFACE
      ?auto_25551 - SURFACE
      ?auto_25552 - SURFACE
    )
    :vars
    (
      ?auto_25557 - HOIST
      ?auto_25553 - PLACE
      ?auto_25558 - PLACE
      ?auto_25555 - HOIST
      ?auto_25556 - SURFACE
      ?auto_25564 - PLACE
      ?auto_25571 - HOIST
      ?auto_25563 - SURFACE
      ?auto_25572 - PLACE
      ?auto_25568 - HOIST
      ?auto_25575 - SURFACE
      ?auto_25567 - PLACE
      ?auto_25576 - HOIST
      ?auto_25562 - SURFACE
      ?auto_25559 - PLACE
      ?auto_25574 - HOIST
      ?auto_25570 - SURFACE
      ?auto_25573 - SURFACE
      ?auto_25577 - PLACE
      ?auto_25561 - HOIST
      ?auto_25565 - SURFACE
      ?auto_25560 - PLACE
      ?auto_25569 - HOIST
      ?auto_25566 - SURFACE
      ?auto_25554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25557 ?auto_25553 ) ( IS-CRATE ?auto_25552 ) ( not ( = ?auto_25558 ?auto_25553 ) ) ( HOIST-AT ?auto_25555 ?auto_25558 ) ( AVAILABLE ?auto_25555 ) ( SURFACE-AT ?auto_25552 ?auto_25558 ) ( ON ?auto_25552 ?auto_25556 ) ( CLEAR ?auto_25552 ) ( not ( = ?auto_25551 ?auto_25552 ) ) ( not ( = ?auto_25551 ?auto_25556 ) ) ( not ( = ?auto_25552 ?auto_25556 ) ) ( not ( = ?auto_25557 ?auto_25555 ) ) ( IS-CRATE ?auto_25551 ) ( not ( = ?auto_25564 ?auto_25553 ) ) ( HOIST-AT ?auto_25571 ?auto_25564 ) ( AVAILABLE ?auto_25571 ) ( SURFACE-AT ?auto_25551 ?auto_25564 ) ( ON ?auto_25551 ?auto_25563 ) ( CLEAR ?auto_25551 ) ( not ( = ?auto_25550 ?auto_25551 ) ) ( not ( = ?auto_25550 ?auto_25563 ) ) ( not ( = ?auto_25551 ?auto_25563 ) ) ( not ( = ?auto_25557 ?auto_25571 ) ) ( IS-CRATE ?auto_25550 ) ( not ( = ?auto_25572 ?auto_25553 ) ) ( HOIST-AT ?auto_25568 ?auto_25572 ) ( AVAILABLE ?auto_25568 ) ( SURFACE-AT ?auto_25550 ?auto_25572 ) ( ON ?auto_25550 ?auto_25575 ) ( CLEAR ?auto_25550 ) ( not ( = ?auto_25549 ?auto_25550 ) ) ( not ( = ?auto_25549 ?auto_25575 ) ) ( not ( = ?auto_25550 ?auto_25575 ) ) ( not ( = ?auto_25557 ?auto_25568 ) ) ( IS-CRATE ?auto_25549 ) ( not ( = ?auto_25567 ?auto_25553 ) ) ( HOIST-AT ?auto_25576 ?auto_25567 ) ( SURFACE-AT ?auto_25549 ?auto_25567 ) ( ON ?auto_25549 ?auto_25562 ) ( CLEAR ?auto_25549 ) ( not ( = ?auto_25548 ?auto_25549 ) ) ( not ( = ?auto_25548 ?auto_25562 ) ) ( not ( = ?auto_25549 ?auto_25562 ) ) ( not ( = ?auto_25557 ?auto_25576 ) ) ( IS-CRATE ?auto_25548 ) ( not ( = ?auto_25559 ?auto_25553 ) ) ( HOIST-AT ?auto_25574 ?auto_25559 ) ( AVAILABLE ?auto_25574 ) ( SURFACE-AT ?auto_25548 ?auto_25559 ) ( ON ?auto_25548 ?auto_25570 ) ( CLEAR ?auto_25548 ) ( not ( = ?auto_25547 ?auto_25548 ) ) ( not ( = ?auto_25547 ?auto_25570 ) ) ( not ( = ?auto_25548 ?auto_25570 ) ) ( not ( = ?auto_25557 ?auto_25574 ) ) ( IS-CRATE ?auto_25547 ) ( AVAILABLE ?auto_25576 ) ( SURFACE-AT ?auto_25547 ?auto_25567 ) ( ON ?auto_25547 ?auto_25573 ) ( CLEAR ?auto_25547 ) ( not ( = ?auto_25546 ?auto_25547 ) ) ( not ( = ?auto_25546 ?auto_25573 ) ) ( not ( = ?auto_25547 ?auto_25573 ) ) ( IS-CRATE ?auto_25546 ) ( not ( = ?auto_25577 ?auto_25553 ) ) ( HOIST-AT ?auto_25561 ?auto_25577 ) ( AVAILABLE ?auto_25561 ) ( SURFACE-AT ?auto_25546 ?auto_25577 ) ( ON ?auto_25546 ?auto_25565 ) ( CLEAR ?auto_25546 ) ( not ( = ?auto_25545 ?auto_25546 ) ) ( not ( = ?auto_25545 ?auto_25565 ) ) ( not ( = ?auto_25546 ?auto_25565 ) ) ( not ( = ?auto_25557 ?auto_25561 ) ) ( SURFACE-AT ?auto_25544 ?auto_25553 ) ( CLEAR ?auto_25544 ) ( IS-CRATE ?auto_25545 ) ( AVAILABLE ?auto_25557 ) ( not ( = ?auto_25560 ?auto_25553 ) ) ( HOIST-AT ?auto_25569 ?auto_25560 ) ( AVAILABLE ?auto_25569 ) ( SURFACE-AT ?auto_25545 ?auto_25560 ) ( ON ?auto_25545 ?auto_25566 ) ( CLEAR ?auto_25545 ) ( TRUCK-AT ?auto_25554 ?auto_25553 ) ( not ( = ?auto_25544 ?auto_25545 ) ) ( not ( = ?auto_25544 ?auto_25566 ) ) ( not ( = ?auto_25545 ?auto_25566 ) ) ( not ( = ?auto_25557 ?auto_25569 ) ) ( not ( = ?auto_25544 ?auto_25546 ) ) ( not ( = ?auto_25544 ?auto_25565 ) ) ( not ( = ?auto_25546 ?auto_25566 ) ) ( not ( = ?auto_25577 ?auto_25560 ) ) ( not ( = ?auto_25561 ?auto_25569 ) ) ( not ( = ?auto_25565 ?auto_25566 ) ) ( not ( = ?auto_25544 ?auto_25547 ) ) ( not ( = ?auto_25544 ?auto_25573 ) ) ( not ( = ?auto_25545 ?auto_25547 ) ) ( not ( = ?auto_25545 ?auto_25573 ) ) ( not ( = ?auto_25547 ?auto_25565 ) ) ( not ( = ?auto_25547 ?auto_25566 ) ) ( not ( = ?auto_25567 ?auto_25577 ) ) ( not ( = ?auto_25567 ?auto_25560 ) ) ( not ( = ?auto_25576 ?auto_25561 ) ) ( not ( = ?auto_25576 ?auto_25569 ) ) ( not ( = ?auto_25573 ?auto_25565 ) ) ( not ( = ?auto_25573 ?auto_25566 ) ) ( not ( = ?auto_25544 ?auto_25548 ) ) ( not ( = ?auto_25544 ?auto_25570 ) ) ( not ( = ?auto_25545 ?auto_25548 ) ) ( not ( = ?auto_25545 ?auto_25570 ) ) ( not ( = ?auto_25546 ?auto_25548 ) ) ( not ( = ?auto_25546 ?auto_25570 ) ) ( not ( = ?auto_25548 ?auto_25573 ) ) ( not ( = ?auto_25548 ?auto_25565 ) ) ( not ( = ?auto_25548 ?auto_25566 ) ) ( not ( = ?auto_25559 ?auto_25567 ) ) ( not ( = ?auto_25559 ?auto_25577 ) ) ( not ( = ?auto_25559 ?auto_25560 ) ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25574 ?auto_25561 ) ) ( not ( = ?auto_25574 ?auto_25569 ) ) ( not ( = ?auto_25570 ?auto_25573 ) ) ( not ( = ?auto_25570 ?auto_25565 ) ) ( not ( = ?auto_25570 ?auto_25566 ) ) ( not ( = ?auto_25544 ?auto_25549 ) ) ( not ( = ?auto_25544 ?auto_25562 ) ) ( not ( = ?auto_25545 ?auto_25549 ) ) ( not ( = ?auto_25545 ?auto_25562 ) ) ( not ( = ?auto_25546 ?auto_25549 ) ) ( not ( = ?auto_25546 ?auto_25562 ) ) ( not ( = ?auto_25547 ?auto_25549 ) ) ( not ( = ?auto_25547 ?auto_25562 ) ) ( not ( = ?auto_25549 ?auto_25570 ) ) ( not ( = ?auto_25549 ?auto_25573 ) ) ( not ( = ?auto_25549 ?auto_25565 ) ) ( not ( = ?auto_25549 ?auto_25566 ) ) ( not ( = ?auto_25562 ?auto_25570 ) ) ( not ( = ?auto_25562 ?auto_25573 ) ) ( not ( = ?auto_25562 ?auto_25565 ) ) ( not ( = ?auto_25562 ?auto_25566 ) ) ( not ( = ?auto_25544 ?auto_25550 ) ) ( not ( = ?auto_25544 ?auto_25575 ) ) ( not ( = ?auto_25545 ?auto_25550 ) ) ( not ( = ?auto_25545 ?auto_25575 ) ) ( not ( = ?auto_25546 ?auto_25550 ) ) ( not ( = ?auto_25546 ?auto_25575 ) ) ( not ( = ?auto_25547 ?auto_25550 ) ) ( not ( = ?auto_25547 ?auto_25575 ) ) ( not ( = ?auto_25548 ?auto_25550 ) ) ( not ( = ?auto_25548 ?auto_25575 ) ) ( not ( = ?auto_25550 ?auto_25562 ) ) ( not ( = ?auto_25550 ?auto_25570 ) ) ( not ( = ?auto_25550 ?auto_25573 ) ) ( not ( = ?auto_25550 ?auto_25565 ) ) ( not ( = ?auto_25550 ?auto_25566 ) ) ( not ( = ?auto_25572 ?auto_25567 ) ) ( not ( = ?auto_25572 ?auto_25559 ) ) ( not ( = ?auto_25572 ?auto_25577 ) ) ( not ( = ?auto_25572 ?auto_25560 ) ) ( not ( = ?auto_25568 ?auto_25576 ) ) ( not ( = ?auto_25568 ?auto_25574 ) ) ( not ( = ?auto_25568 ?auto_25561 ) ) ( not ( = ?auto_25568 ?auto_25569 ) ) ( not ( = ?auto_25575 ?auto_25562 ) ) ( not ( = ?auto_25575 ?auto_25570 ) ) ( not ( = ?auto_25575 ?auto_25573 ) ) ( not ( = ?auto_25575 ?auto_25565 ) ) ( not ( = ?auto_25575 ?auto_25566 ) ) ( not ( = ?auto_25544 ?auto_25551 ) ) ( not ( = ?auto_25544 ?auto_25563 ) ) ( not ( = ?auto_25545 ?auto_25551 ) ) ( not ( = ?auto_25545 ?auto_25563 ) ) ( not ( = ?auto_25546 ?auto_25551 ) ) ( not ( = ?auto_25546 ?auto_25563 ) ) ( not ( = ?auto_25547 ?auto_25551 ) ) ( not ( = ?auto_25547 ?auto_25563 ) ) ( not ( = ?auto_25548 ?auto_25551 ) ) ( not ( = ?auto_25548 ?auto_25563 ) ) ( not ( = ?auto_25549 ?auto_25551 ) ) ( not ( = ?auto_25549 ?auto_25563 ) ) ( not ( = ?auto_25551 ?auto_25575 ) ) ( not ( = ?auto_25551 ?auto_25562 ) ) ( not ( = ?auto_25551 ?auto_25570 ) ) ( not ( = ?auto_25551 ?auto_25573 ) ) ( not ( = ?auto_25551 ?auto_25565 ) ) ( not ( = ?auto_25551 ?auto_25566 ) ) ( not ( = ?auto_25564 ?auto_25572 ) ) ( not ( = ?auto_25564 ?auto_25567 ) ) ( not ( = ?auto_25564 ?auto_25559 ) ) ( not ( = ?auto_25564 ?auto_25577 ) ) ( not ( = ?auto_25564 ?auto_25560 ) ) ( not ( = ?auto_25571 ?auto_25568 ) ) ( not ( = ?auto_25571 ?auto_25576 ) ) ( not ( = ?auto_25571 ?auto_25574 ) ) ( not ( = ?auto_25571 ?auto_25561 ) ) ( not ( = ?auto_25571 ?auto_25569 ) ) ( not ( = ?auto_25563 ?auto_25575 ) ) ( not ( = ?auto_25563 ?auto_25562 ) ) ( not ( = ?auto_25563 ?auto_25570 ) ) ( not ( = ?auto_25563 ?auto_25573 ) ) ( not ( = ?auto_25563 ?auto_25565 ) ) ( not ( = ?auto_25563 ?auto_25566 ) ) ( not ( = ?auto_25544 ?auto_25552 ) ) ( not ( = ?auto_25544 ?auto_25556 ) ) ( not ( = ?auto_25545 ?auto_25552 ) ) ( not ( = ?auto_25545 ?auto_25556 ) ) ( not ( = ?auto_25546 ?auto_25552 ) ) ( not ( = ?auto_25546 ?auto_25556 ) ) ( not ( = ?auto_25547 ?auto_25552 ) ) ( not ( = ?auto_25547 ?auto_25556 ) ) ( not ( = ?auto_25548 ?auto_25552 ) ) ( not ( = ?auto_25548 ?auto_25556 ) ) ( not ( = ?auto_25549 ?auto_25552 ) ) ( not ( = ?auto_25549 ?auto_25556 ) ) ( not ( = ?auto_25550 ?auto_25552 ) ) ( not ( = ?auto_25550 ?auto_25556 ) ) ( not ( = ?auto_25552 ?auto_25563 ) ) ( not ( = ?auto_25552 ?auto_25575 ) ) ( not ( = ?auto_25552 ?auto_25562 ) ) ( not ( = ?auto_25552 ?auto_25570 ) ) ( not ( = ?auto_25552 ?auto_25573 ) ) ( not ( = ?auto_25552 ?auto_25565 ) ) ( not ( = ?auto_25552 ?auto_25566 ) ) ( not ( = ?auto_25558 ?auto_25564 ) ) ( not ( = ?auto_25558 ?auto_25572 ) ) ( not ( = ?auto_25558 ?auto_25567 ) ) ( not ( = ?auto_25558 ?auto_25559 ) ) ( not ( = ?auto_25558 ?auto_25577 ) ) ( not ( = ?auto_25558 ?auto_25560 ) ) ( not ( = ?auto_25555 ?auto_25571 ) ) ( not ( = ?auto_25555 ?auto_25568 ) ) ( not ( = ?auto_25555 ?auto_25576 ) ) ( not ( = ?auto_25555 ?auto_25574 ) ) ( not ( = ?auto_25555 ?auto_25561 ) ) ( not ( = ?auto_25555 ?auto_25569 ) ) ( not ( = ?auto_25556 ?auto_25563 ) ) ( not ( = ?auto_25556 ?auto_25575 ) ) ( not ( = ?auto_25556 ?auto_25562 ) ) ( not ( = ?auto_25556 ?auto_25570 ) ) ( not ( = ?auto_25556 ?auto_25573 ) ) ( not ( = ?auto_25556 ?auto_25565 ) ) ( not ( = ?auto_25556 ?auto_25566 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_25544 ?auto_25545 ?auto_25546 ?auto_25547 ?auto_25548 ?auto_25549 ?auto_25550 ?auto_25551 )
      ( MAKE-1CRATE ?auto_25551 ?auto_25552 )
      ( MAKE-8CRATE-VERIFY ?auto_25544 ?auto_25545 ?auto_25546 ?auto_25547 ?auto_25548 ?auto_25549 ?auto_25550 ?auto_25551 ?auto_25552 ) )
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
      ?auto_25604 - SURFACE
      ?auto_25605 - SURFACE
      ?auto_25606 - SURFACE
      ?auto_25607 - SURFACE
    )
    :vars
    (
      ?auto_25609 - HOIST
      ?auto_25610 - PLACE
      ?auto_25608 - PLACE
      ?auto_25613 - HOIST
      ?auto_25611 - SURFACE
      ?auto_25619 - PLACE
      ?auto_25622 - HOIST
      ?auto_25633 - SURFACE
      ?auto_25617 - PLACE
      ?auto_25628 - HOIST
      ?auto_25618 - SURFACE
      ?auto_25629 - PLACE
      ?auto_25614 - HOIST
      ?auto_25627 - SURFACE
      ?auto_25615 - PLACE
      ?auto_25624 - HOIST
      ?auto_25625 - SURFACE
      ?auto_25634 - PLACE
      ?auto_25621 - HOIST
      ?auto_25635 - SURFACE
      ?auto_25626 - SURFACE
      ?auto_25623 - PLACE
      ?auto_25630 - HOIST
      ?auto_25616 - SURFACE
      ?auto_25620 - PLACE
      ?auto_25632 - HOIST
      ?auto_25631 - SURFACE
      ?auto_25612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25609 ?auto_25610 ) ( IS-CRATE ?auto_25607 ) ( not ( = ?auto_25608 ?auto_25610 ) ) ( HOIST-AT ?auto_25613 ?auto_25608 ) ( AVAILABLE ?auto_25613 ) ( SURFACE-AT ?auto_25607 ?auto_25608 ) ( ON ?auto_25607 ?auto_25611 ) ( CLEAR ?auto_25607 ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25611 ) ) ( not ( = ?auto_25607 ?auto_25611 ) ) ( not ( = ?auto_25609 ?auto_25613 ) ) ( IS-CRATE ?auto_25606 ) ( not ( = ?auto_25619 ?auto_25610 ) ) ( HOIST-AT ?auto_25622 ?auto_25619 ) ( AVAILABLE ?auto_25622 ) ( SURFACE-AT ?auto_25606 ?auto_25619 ) ( ON ?auto_25606 ?auto_25633 ) ( CLEAR ?auto_25606 ) ( not ( = ?auto_25605 ?auto_25606 ) ) ( not ( = ?auto_25605 ?auto_25633 ) ) ( not ( = ?auto_25606 ?auto_25633 ) ) ( not ( = ?auto_25609 ?auto_25622 ) ) ( IS-CRATE ?auto_25605 ) ( not ( = ?auto_25617 ?auto_25610 ) ) ( HOIST-AT ?auto_25628 ?auto_25617 ) ( AVAILABLE ?auto_25628 ) ( SURFACE-AT ?auto_25605 ?auto_25617 ) ( ON ?auto_25605 ?auto_25618 ) ( CLEAR ?auto_25605 ) ( not ( = ?auto_25604 ?auto_25605 ) ) ( not ( = ?auto_25604 ?auto_25618 ) ) ( not ( = ?auto_25605 ?auto_25618 ) ) ( not ( = ?auto_25609 ?auto_25628 ) ) ( IS-CRATE ?auto_25604 ) ( not ( = ?auto_25629 ?auto_25610 ) ) ( HOIST-AT ?auto_25614 ?auto_25629 ) ( AVAILABLE ?auto_25614 ) ( SURFACE-AT ?auto_25604 ?auto_25629 ) ( ON ?auto_25604 ?auto_25627 ) ( CLEAR ?auto_25604 ) ( not ( = ?auto_25603 ?auto_25604 ) ) ( not ( = ?auto_25603 ?auto_25627 ) ) ( not ( = ?auto_25604 ?auto_25627 ) ) ( not ( = ?auto_25609 ?auto_25614 ) ) ( IS-CRATE ?auto_25603 ) ( not ( = ?auto_25615 ?auto_25610 ) ) ( HOIST-AT ?auto_25624 ?auto_25615 ) ( SURFACE-AT ?auto_25603 ?auto_25615 ) ( ON ?auto_25603 ?auto_25625 ) ( CLEAR ?auto_25603 ) ( not ( = ?auto_25602 ?auto_25603 ) ) ( not ( = ?auto_25602 ?auto_25625 ) ) ( not ( = ?auto_25603 ?auto_25625 ) ) ( not ( = ?auto_25609 ?auto_25624 ) ) ( IS-CRATE ?auto_25602 ) ( not ( = ?auto_25634 ?auto_25610 ) ) ( HOIST-AT ?auto_25621 ?auto_25634 ) ( AVAILABLE ?auto_25621 ) ( SURFACE-AT ?auto_25602 ?auto_25634 ) ( ON ?auto_25602 ?auto_25635 ) ( CLEAR ?auto_25602 ) ( not ( = ?auto_25601 ?auto_25602 ) ) ( not ( = ?auto_25601 ?auto_25635 ) ) ( not ( = ?auto_25602 ?auto_25635 ) ) ( not ( = ?auto_25609 ?auto_25621 ) ) ( IS-CRATE ?auto_25601 ) ( AVAILABLE ?auto_25624 ) ( SURFACE-AT ?auto_25601 ?auto_25615 ) ( ON ?auto_25601 ?auto_25626 ) ( CLEAR ?auto_25601 ) ( not ( = ?auto_25600 ?auto_25601 ) ) ( not ( = ?auto_25600 ?auto_25626 ) ) ( not ( = ?auto_25601 ?auto_25626 ) ) ( IS-CRATE ?auto_25600 ) ( not ( = ?auto_25623 ?auto_25610 ) ) ( HOIST-AT ?auto_25630 ?auto_25623 ) ( AVAILABLE ?auto_25630 ) ( SURFACE-AT ?auto_25600 ?auto_25623 ) ( ON ?auto_25600 ?auto_25616 ) ( CLEAR ?auto_25600 ) ( not ( = ?auto_25599 ?auto_25600 ) ) ( not ( = ?auto_25599 ?auto_25616 ) ) ( not ( = ?auto_25600 ?auto_25616 ) ) ( not ( = ?auto_25609 ?auto_25630 ) ) ( SURFACE-AT ?auto_25598 ?auto_25610 ) ( CLEAR ?auto_25598 ) ( IS-CRATE ?auto_25599 ) ( AVAILABLE ?auto_25609 ) ( not ( = ?auto_25620 ?auto_25610 ) ) ( HOIST-AT ?auto_25632 ?auto_25620 ) ( AVAILABLE ?auto_25632 ) ( SURFACE-AT ?auto_25599 ?auto_25620 ) ( ON ?auto_25599 ?auto_25631 ) ( CLEAR ?auto_25599 ) ( TRUCK-AT ?auto_25612 ?auto_25610 ) ( not ( = ?auto_25598 ?auto_25599 ) ) ( not ( = ?auto_25598 ?auto_25631 ) ) ( not ( = ?auto_25599 ?auto_25631 ) ) ( not ( = ?auto_25609 ?auto_25632 ) ) ( not ( = ?auto_25598 ?auto_25600 ) ) ( not ( = ?auto_25598 ?auto_25616 ) ) ( not ( = ?auto_25600 ?auto_25631 ) ) ( not ( = ?auto_25623 ?auto_25620 ) ) ( not ( = ?auto_25630 ?auto_25632 ) ) ( not ( = ?auto_25616 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25601 ) ) ( not ( = ?auto_25598 ?auto_25626 ) ) ( not ( = ?auto_25599 ?auto_25601 ) ) ( not ( = ?auto_25599 ?auto_25626 ) ) ( not ( = ?auto_25601 ?auto_25616 ) ) ( not ( = ?auto_25601 ?auto_25631 ) ) ( not ( = ?auto_25615 ?auto_25623 ) ) ( not ( = ?auto_25615 ?auto_25620 ) ) ( not ( = ?auto_25624 ?auto_25630 ) ) ( not ( = ?auto_25624 ?auto_25632 ) ) ( not ( = ?auto_25626 ?auto_25616 ) ) ( not ( = ?auto_25626 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25602 ) ) ( not ( = ?auto_25598 ?auto_25635 ) ) ( not ( = ?auto_25599 ?auto_25602 ) ) ( not ( = ?auto_25599 ?auto_25635 ) ) ( not ( = ?auto_25600 ?auto_25602 ) ) ( not ( = ?auto_25600 ?auto_25635 ) ) ( not ( = ?auto_25602 ?auto_25626 ) ) ( not ( = ?auto_25602 ?auto_25616 ) ) ( not ( = ?auto_25602 ?auto_25631 ) ) ( not ( = ?auto_25634 ?auto_25615 ) ) ( not ( = ?auto_25634 ?auto_25623 ) ) ( not ( = ?auto_25634 ?auto_25620 ) ) ( not ( = ?auto_25621 ?auto_25624 ) ) ( not ( = ?auto_25621 ?auto_25630 ) ) ( not ( = ?auto_25621 ?auto_25632 ) ) ( not ( = ?auto_25635 ?auto_25626 ) ) ( not ( = ?auto_25635 ?auto_25616 ) ) ( not ( = ?auto_25635 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25603 ) ) ( not ( = ?auto_25598 ?auto_25625 ) ) ( not ( = ?auto_25599 ?auto_25603 ) ) ( not ( = ?auto_25599 ?auto_25625 ) ) ( not ( = ?auto_25600 ?auto_25603 ) ) ( not ( = ?auto_25600 ?auto_25625 ) ) ( not ( = ?auto_25601 ?auto_25603 ) ) ( not ( = ?auto_25601 ?auto_25625 ) ) ( not ( = ?auto_25603 ?auto_25635 ) ) ( not ( = ?auto_25603 ?auto_25626 ) ) ( not ( = ?auto_25603 ?auto_25616 ) ) ( not ( = ?auto_25603 ?auto_25631 ) ) ( not ( = ?auto_25625 ?auto_25635 ) ) ( not ( = ?auto_25625 ?auto_25626 ) ) ( not ( = ?auto_25625 ?auto_25616 ) ) ( not ( = ?auto_25625 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25604 ) ) ( not ( = ?auto_25598 ?auto_25627 ) ) ( not ( = ?auto_25599 ?auto_25604 ) ) ( not ( = ?auto_25599 ?auto_25627 ) ) ( not ( = ?auto_25600 ?auto_25604 ) ) ( not ( = ?auto_25600 ?auto_25627 ) ) ( not ( = ?auto_25601 ?auto_25604 ) ) ( not ( = ?auto_25601 ?auto_25627 ) ) ( not ( = ?auto_25602 ?auto_25604 ) ) ( not ( = ?auto_25602 ?auto_25627 ) ) ( not ( = ?auto_25604 ?auto_25625 ) ) ( not ( = ?auto_25604 ?auto_25635 ) ) ( not ( = ?auto_25604 ?auto_25626 ) ) ( not ( = ?auto_25604 ?auto_25616 ) ) ( not ( = ?auto_25604 ?auto_25631 ) ) ( not ( = ?auto_25629 ?auto_25615 ) ) ( not ( = ?auto_25629 ?auto_25634 ) ) ( not ( = ?auto_25629 ?auto_25623 ) ) ( not ( = ?auto_25629 ?auto_25620 ) ) ( not ( = ?auto_25614 ?auto_25624 ) ) ( not ( = ?auto_25614 ?auto_25621 ) ) ( not ( = ?auto_25614 ?auto_25630 ) ) ( not ( = ?auto_25614 ?auto_25632 ) ) ( not ( = ?auto_25627 ?auto_25625 ) ) ( not ( = ?auto_25627 ?auto_25635 ) ) ( not ( = ?auto_25627 ?auto_25626 ) ) ( not ( = ?auto_25627 ?auto_25616 ) ) ( not ( = ?auto_25627 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25605 ) ) ( not ( = ?auto_25598 ?auto_25618 ) ) ( not ( = ?auto_25599 ?auto_25605 ) ) ( not ( = ?auto_25599 ?auto_25618 ) ) ( not ( = ?auto_25600 ?auto_25605 ) ) ( not ( = ?auto_25600 ?auto_25618 ) ) ( not ( = ?auto_25601 ?auto_25605 ) ) ( not ( = ?auto_25601 ?auto_25618 ) ) ( not ( = ?auto_25602 ?auto_25605 ) ) ( not ( = ?auto_25602 ?auto_25618 ) ) ( not ( = ?auto_25603 ?auto_25605 ) ) ( not ( = ?auto_25603 ?auto_25618 ) ) ( not ( = ?auto_25605 ?auto_25627 ) ) ( not ( = ?auto_25605 ?auto_25625 ) ) ( not ( = ?auto_25605 ?auto_25635 ) ) ( not ( = ?auto_25605 ?auto_25626 ) ) ( not ( = ?auto_25605 ?auto_25616 ) ) ( not ( = ?auto_25605 ?auto_25631 ) ) ( not ( = ?auto_25617 ?auto_25629 ) ) ( not ( = ?auto_25617 ?auto_25615 ) ) ( not ( = ?auto_25617 ?auto_25634 ) ) ( not ( = ?auto_25617 ?auto_25623 ) ) ( not ( = ?auto_25617 ?auto_25620 ) ) ( not ( = ?auto_25628 ?auto_25614 ) ) ( not ( = ?auto_25628 ?auto_25624 ) ) ( not ( = ?auto_25628 ?auto_25621 ) ) ( not ( = ?auto_25628 ?auto_25630 ) ) ( not ( = ?auto_25628 ?auto_25632 ) ) ( not ( = ?auto_25618 ?auto_25627 ) ) ( not ( = ?auto_25618 ?auto_25625 ) ) ( not ( = ?auto_25618 ?auto_25635 ) ) ( not ( = ?auto_25618 ?auto_25626 ) ) ( not ( = ?auto_25618 ?auto_25616 ) ) ( not ( = ?auto_25618 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25606 ) ) ( not ( = ?auto_25598 ?auto_25633 ) ) ( not ( = ?auto_25599 ?auto_25606 ) ) ( not ( = ?auto_25599 ?auto_25633 ) ) ( not ( = ?auto_25600 ?auto_25606 ) ) ( not ( = ?auto_25600 ?auto_25633 ) ) ( not ( = ?auto_25601 ?auto_25606 ) ) ( not ( = ?auto_25601 ?auto_25633 ) ) ( not ( = ?auto_25602 ?auto_25606 ) ) ( not ( = ?auto_25602 ?auto_25633 ) ) ( not ( = ?auto_25603 ?auto_25606 ) ) ( not ( = ?auto_25603 ?auto_25633 ) ) ( not ( = ?auto_25604 ?auto_25606 ) ) ( not ( = ?auto_25604 ?auto_25633 ) ) ( not ( = ?auto_25606 ?auto_25618 ) ) ( not ( = ?auto_25606 ?auto_25627 ) ) ( not ( = ?auto_25606 ?auto_25625 ) ) ( not ( = ?auto_25606 ?auto_25635 ) ) ( not ( = ?auto_25606 ?auto_25626 ) ) ( not ( = ?auto_25606 ?auto_25616 ) ) ( not ( = ?auto_25606 ?auto_25631 ) ) ( not ( = ?auto_25619 ?auto_25617 ) ) ( not ( = ?auto_25619 ?auto_25629 ) ) ( not ( = ?auto_25619 ?auto_25615 ) ) ( not ( = ?auto_25619 ?auto_25634 ) ) ( not ( = ?auto_25619 ?auto_25623 ) ) ( not ( = ?auto_25619 ?auto_25620 ) ) ( not ( = ?auto_25622 ?auto_25628 ) ) ( not ( = ?auto_25622 ?auto_25614 ) ) ( not ( = ?auto_25622 ?auto_25624 ) ) ( not ( = ?auto_25622 ?auto_25621 ) ) ( not ( = ?auto_25622 ?auto_25630 ) ) ( not ( = ?auto_25622 ?auto_25632 ) ) ( not ( = ?auto_25633 ?auto_25618 ) ) ( not ( = ?auto_25633 ?auto_25627 ) ) ( not ( = ?auto_25633 ?auto_25625 ) ) ( not ( = ?auto_25633 ?auto_25635 ) ) ( not ( = ?auto_25633 ?auto_25626 ) ) ( not ( = ?auto_25633 ?auto_25616 ) ) ( not ( = ?auto_25633 ?auto_25631 ) ) ( not ( = ?auto_25598 ?auto_25607 ) ) ( not ( = ?auto_25598 ?auto_25611 ) ) ( not ( = ?auto_25599 ?auto_25607 ) ) ( not ( = ?auto_25599 ?auto_25611 ) ) ( not ( = ?auto_25600 ?auto_25607 ) ) ( not ( = ?auto_25600 ?auto_25611 ) ) ( not ( = ?auto_25601 ?auto_25607 ) ) ( not ( = ?auto_25601 ?auto_25611 ) ) ( not ( = ?auto_25602 ?auto_25607 ) ) ( not ( = ?auto_25602 ?auto_25611 ) ) ( not ( = ?auto_25603 ?auto_25607 ) ) ( not ( = ?auto_25603 ?auto_25611 ) ) ( not ( = ?auto_25604 ?auto_25607 ) ) ( not ( = ?auto_25604 ?auto_25611 ) ) ( not ( = ?auto_25605 ?auto_25607 ) ) ( not ( = ?auto_25605 ?auto_25611 ) ) ( not ( = ?auto_25607 ?auto_25633 ) ) ( not ( = ?auto_25607 ?auto_25618 ) ) ( not ( = ?auto_25607 ?auto_25627 ) ) ( not ( = ?auto_25607 ?auto_25625 ) ) ( not ( = ?auto_25607 ?auto_25635 ) ) ( not ( = ?auto_25607 ?auto_25626 ) ) ( not ( = ?auto_25607 ?auto_25616 ) ) ( not ( = ?auto_25607 ?auto_25631 ) ) ( not ( = ?auto_25608 ?auto_25619 ) ) ( not ( = ?auto_25608 ?auto_25617 ) ) ( not ( = ?auto_25608 ?auto_25629 ) ) ( not ( = ?auto_25608 ?auto_25615 ) ) ( not ( = ?auto_25608 ?auto_25634 ) ) ( not ( = ?auto_25608 ?auto_25623 ) ) ( not ( = ?auto_25608 ?auto_25620 ) ) ( not ( = ?auto_25613 ?auto_25622 ) ) ( not ( = ?auto_25613 ?auto_25628 ) ) ( not ( = ?auto_25613 ?auto_25614 ) ) ( not ( = ?auto_25613 ?auto_25624 ) ) ( not ( = ?auto_25613 ?auto_25621 ) ) ( not ( = ?auto_25613 ?auto_25630 ) ) ( not ( = ?auto_25613 ?auto_25632 ) ) ( not ( = ?auto_25611 ?auto_25633 ) ) ( not ( = ?auto_25611 ?auto_25618 ) ) ( not ( = ?auto_25611 ?auto_25627 ) ) ( not ( = ?auto_25611 ?auto_25625 ) ) ( not ( = ?auto_25611 ?auto_25635 ) ) ( not ( = ?auto_25611 ?auto_25626 ) ) ( not ( = ?auto_25611 ?auto_25616 ) ) ( not ( = ?auto_25611 ?auto_25631 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_25598 ?auto_25599 ?auto_25600 ?auto_25601 ?auto_25602 ?auto_25603 ?auto_25604 ?auto_25605 ?auto_25606 )
      ( MAKE-1CRATE ?auto_25606 ?auto_25607 )
      ( MAKE-9CRATE-VERIFY ?auto_25598 ?auto_25599 ?auto_25600 ?auto_25601 ?auto_25602 ?auto_25603 ?auto_25604 ?auto_25605 ?auto_25606 ?auto_25607 ) )
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
      ?auto_25663 - SURFACE
      ?auto_25664 - SURFACE
      ?auto_25665 - SURFACE
      ?auto_25666 - SURFACE
      ?auto_25667 - SURFACE
    )
    :vars
    (
      ?auto_25669 - HOIST
      ?auto_25671 - PLACE
      ?auto_25673 - PLACE
      ?auto_25668 - HOIST
      ?auto_25670 - SURFACE
      ?auto_25691 - PLACE
      ?auto_25683 - HOIST
      ?auto_25693 - SURFACE
      ?auto_25680 - PLACE
      ?auto_25688 - HOIST
      ?auto_25687 - SURFACE
      ?auto_25696 - PLACE
      ?auto_25697 - HOIST
      ?auto_25681 - SURFACE
      ?auto_25698 - PLACE
      ?auto_25676 - HOIST
      ?auto_25684 - SURFACE
      ?auto_25677 - PLACE
      ?auto_25694 - HOIST
      ?auto_25682 - SURFACE
      ?auto_25685 - PLACE
      ?auto_25675 - HOIST
      ?auto_25695 - SURFACE
      ?auto_25674 - SURFACE
      ?auto_25689 - PLACE
      ?auto_25692 - HOIST
      ?auto_25686 - SURFACE
      ?auto_25679 - PLACE
      ?auto_25678 - HOIST
      ?auto_25690 - SURFACE
      ?auto_25672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25669 ?auto_25671 ) ( IS-CRATE ?auto_25667 ) ( not ( = ?auto_25673 ?auto_25671 ) ) ( HOIST-AT ?auto_25668 ?auto_25673 ) ( AVAILABLE ?auto_25668 ) ( SURFACE-AT ?auto_25667 ?auto_25673 ) ( ON ?auto_25667 ?auto_25670 ) ( CLEAR ?auto_25667 ) ( not ( = ?auto_25666 ?auto_25667 ) ) ( not ( = ?auto_25666 ?auto_25670 ) ) ( not ( = ?auto_25667 ?auto_25670 ) ) ( not ( = ?auto_25669 ?auto_25668 ) ) ( IS-CRATE ?auto_25666 ) ( not ( = ?auto_25691 ?auto_25671 ) ) ( HOIST-AT ?auto_25683 ?auto_25691 ) ( AVAILABLE ?auto_25683 ) ( SURFACE-AT ?auto_25666 ?auto_25691 ) ( ON ?auto_25666 ?auto_25693 ) ( CLEAR ?auto_25666 ) ( not ( = ?auto_25665 ?auto_25666 ) ) ( not ( = ?auto_25665 ?auto_25693 ) ) ( not ( = ?auto_25666 ?auto_25693 ) ) ( not ( = ?auto_25669 ?auto_25683 ) ) ( IS-CRATE ?auto_25665 ) ( not ( = ?auto_25680 ?auto_25671 ) ) ( HOIST-AT ?auto_25688 ?auto_25680 ) ( AVAILABLE ?auto_25688 ) ( SURFACE-AT ?auto_25665 ?auto_25680 ) ( ON ?auto_25665 ?auto_25687 ) ( CLEAR ?auto_25665 ) ( not ( = ?auto_25664 ?auto_25665 ) ) ( not ( = ?auto_25664 ?auto_25687 ) ) ( not ( = ?auto_25665 ?auto_25687 ) ) ( not ( = ?auto_25669 ?auto_25688 ) ) ( IS-CRATE ?auto_25664 ) ( not ( = ?auto_25696 ?auto_25671 ) ) ( HOIST-AT ?auto_25697 ?auto_25696 ) ( AVAILABLE ?auto_25697 ) ( SURFACE-AT ?auto_25664 ?auto_25696 ) ( ON ?auto_25664 ?auto_25681 ) ( CLEAR ?auto_25664 ) ( not ( = ?auto_25663 ?auto_25664 ) ) ( not ( = ?auto_25663 ?auto_25681 ) ) ( not ( = ?auto_25664 ?auto_25681 ) ) ( not ( = ?auto_25669 ?auto_25697 ) ) ( IS-CRATE ?auto_25663 ) ( not ( = ?auto_25698 ?auto_25671 ) ) ( HOIST-AT ?auto_25676 ?auto_25698 ) ( AVAILABLE ?auto_25676 ) ( SURFACE-AT ?auto_25663 ?auto_25698 ) ( ON ?auto_25663 ?auto_25684 ) ( CLEAR ?auto_25663 ) ( not ( = ?auto_25662 ?auto_25663 ) ) ( not ( = ?auto_25662 ?auto_25684 ) ) ( not ( = ?auto_25663 ?auto_25684 ) ) ( not ( = ?auto_25669 ?auto_25676 ) ) ( IS-CRATE ?auto_25662 ) ( not ( = ?auto_25677 ?auto_25671 ) ) ( HOIST-AT ?auto_25694 ?auto_25677 ) ( SURFACE-AT ?auto_25662 ?auto_25677 ) ( ON ?auto_25662 ?auto_25682 ) ( CLEAR ?auto_25662 ) ( not ( = ?auto_25661 ?auto_25662 ) ) ( not ( = ?auto_25661 ?auto_25682 ) ) ( not ( = ?auto_25662 ?auto_25682 ) ) ( not ( = ?auto_25669 ?auto_25694 ) ) ( IS-CRATE ?auto_25661 ) ( not ( = ?auto_25685 ?auto_25671 ) ) ( HOIST-AT ?auto_25675 ?auto_25685 ) ( AVAILABLE ?auto_25675 ) ( SURFACE-AT ?auto_25661 ?auto_25685 ) ( ON ?auto_25661 ?auto_25695 ) ( CLEAR ?auto_25661 ) ( not ( = ?auto_25660 ?auto_25661 ) ) ( not ( = ?auto_25660 ?auto_25695 ) ) ( not ( = ?auto_25661 ?auto_25695 ) ) ( not ( = ?auto_25669 ?auto_25675 ) ) ( IS-CRATE ?auto_25660 ) ( AVAILABLE ?auto_25694 ) ( SURFACE-AT ?auto_25660 ?auto_25677 ) ( ON ?auto_25660 ?auto_25674 ) ( CLEAR ?auto_25660 ) ( not ( = ?auto_25659 ?auto_25660 ) ) ( not ( = ?auto_25659 ?auto_25674 ) ) ( not ( = ?auto_25660 ?auto_25674 ) ) ( IS-CRATE ?auto_25659 ) ( not ( = ?auto_25689 ?auto_25671 ) ) ( HOIST-AT ?auto_25692 ?auto_25689 ) ( AVAILABLE ?auto_25692 ) ( SURFACE-AT ?auto_25659 ?auto_25689 ) ( ON ?auto_25659 ?auto_25686 ) ( CLEAR ?auto_25659 ) ( not ( = ?auto_25658 ?auto_25659 ) ) ( not ( = ?auto_25658 ?auto_25686 ) ) ( not ( = ?auto_25659 ?auto_25686 ) ) ( not ( = ?auto_25669 ?auto_25692 ) ) ( SURFACE-AT ?auto_25657 ?auto_25671 ) ( CLEAR ?auto_25657 ) ( IS-CRATE ?auto_25658 ) ( AVAILABLE ?auto_25669 ) ( not ( = ?auto_25679 ?auto_25671 ) ) ( HOIST-AT ?auto_25678 ?auto_25679 ) ( AVAILABLE ?auto_25678 ) ( SURFACE-AT ?auto_25658 ?auto_25679 ) ( ON ?auto_25658 ?auto_25690 ) ( CLEAR ?auto_25658 ) ( TRUCK-AT ?auto_25672 ?auto_25671 ) ( not ( = ?auto_25657 ?auto_25658 ) ) ( not ( = ?auto_25657 ?auto_25690 ) ) ( not ( = ?auto_25658 ?auto_25690 ) ) ( not ( = ?auto_25669 ?auto_25678 ) ) ( not ( = ?auto_25657 ?auto_25659 ) ) ( not ( = ?auto_25657 ?auto_25686 ) ) ( not ( = ?auto_25659 ?auto_25690 ) ) ( not ( = ?auto_25689 ?auto_25679 ) ) ( not ( = ?auto_25692 ?auto_25678 ) ) ( not ( = ?auto_25686 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25660 ) ) ( not ( = ?auto_25657 ?auto_25674 ) ) ( not ( = ?auto_25658 ?auto_25660 ) ) ( not ( = ?auto_25658 ?auto_25674 ) ) ( not ( = ?auto_25660 ?auto_25686 ) ) ( not ( = ?auto_25660 ?auto_25690 ) ) ( not ( = ?auto_25677 ?auto_25689 ) ) ( not ( = ?auto_25677 ?auto_25679 ) ) ( not ( = ?auto_25694 ?auto_25692 ) ) ( not ( = ?auto_25694 ?auto_25678 ) ) ( not ( = ?auto_25674 ?auto_25686 ) ) ( not ( = ?auto_25674 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25661 ) ) ( not ( = ?auto_25657 ?auto_25695 ) ) ( not ( = ?auto_25658 ?auto_25661 ) ) ( not ( = ?auto_25658 ?auto_25695 ) ) ( not ( = ?auto_25659 ?auto_25661 ) ) ( not ( = ?auto_25659 ?auto_25695 ) ) ( not ( = ?auto_25661 ?auto_25674 ) ) ( not ( = ?auto_25661 ?auto_25686 ) ) ( not ( = ?auto_25661 ?auto_25690 ) ) ( not ( = ?auto_25685 ?auto_25677 ) ) ( not ( = ?auto_25685 ?auto_25689 ) ) ( not ( = ?auto_25685 ?auto_25679 ) ) ( not ( = ?auto_25675 ?auto_25694 ) ) ( not ( = ?auto_25675 ?auto_25692 ) ) ( not ( = ?auto_25675 ?auto_25678 ) ) ( not ( = ?auto_25695 ?auto_25674 ) ) ( not ( = ?auto_25695 ?auto_25686 ) ) ( not ( = ?auto_25695 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25662 ) ) ( not ( = ?auto_25657 ?auto_25682 ) ) ( not ( = ?auto_25658 ?auto_25662 ) ) ( not ( = ?auto_25658 ?auto_25682 ) ) ( not ( = ?auto_25659 ?auto_25662 ) ) ( not ( = ?auto_25659 ?auto_25682 ) ) ( not ( = ?auto_25660 ?auto_25662 ) ) ( not ( = ?auto_25660 ?auto_25682 ) ) ( not ( = ?auto_25662 ?auto_25695 ) ) ( not ( = ?auto_25662 ?auto_25674 ) ) ( not ( = ?auto_25662 ?auto_25686 ) ) ( not ( = ?auto_25662 ?auto_25690 ) ) ( not ( = ?auto_25682 ?auto_25695 ) ) ( not ( = ?auto_25682 ?auto_25674 ) ) ( not ( = ?auto_25682 ?auto_25686 ) ) ( not ( = ?auto_25682 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25663 ) ) ( not ( = ?auto_25657 ?auto_25684 ) ) ( not ( = ?auto_25658 ?auto_25663 ) ) ( not ( = ?auto_25658 ?auto_25684 ) ) ( not ( = ?auto_25659 ?auto_25663 ) ) ( not ( = ?auto_25659 ?auto_25684 ) ) ( not ( = ?auto_25660 ?auto_25663 ) ) ( not ( = ?auto_25660 ?auto_25684 ) ) ( not ( = ?auto_25661 ?auto_25663 ) ) ( not ( = ?auto_25661 ?auto_25684 ) ) ( not ( = ?auto_25663 ?auto_25682 ) ) ( not ( = ?auto_25663 ?auto_25695 ) ) ( not ( = ?auto_25663 ?auto_25674 ) ) ( not ( = ?auto_25663 ?auto_25686 ) ) ( not ( = ?auto_25663 ?auto_25690 ) ) ( not ( = ?auto_25698 ?auto_25677 ) ) ( not ( = ?auto_25698 ?auto_25685 ) ) ( not ( = ?auto_25698 ?auto_25689 ) ) ( not ( = ?auto_25698 ?auto_25679 ) ) ( not ( = ?auto_25676 ?auto_25694 ) ) ( not ( = ?auto_25676 ?auto_25675 ) ) ( not ( = ?auto_25676 ?auto_25692 ) ) ( not ( = ?auto_25676 ?auto_25678 ) ) ( not ( = ?auto_25684 ?auto_25682 ) ) ( not ( = ?auto_25684 ?auto_25695 ) ) ( not ( = ?auto_25684 ?auto_25674 ) ) ( not ( = ?auto_25684 ?auto_25686 ) ) ( not ( = ?auto_25684 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25664 ) ) ( not ( = ?auto_25657 ?auto_25681 ) ) ( not ( = ?auto_25658 ?auto_25664 ) ) ( not ( = ?auto_25658 ?auto_25681 ) ) ( not ( = ?auto_25659 ?auto_25664 ) ) ( not ( = ?auto_25659 ?auto_25681 ) ) ( not ( = ?auto_25660 ?auto_25664 ) ) ( not ( = ?auto_25660 ?auto_25681 ) ) ( not ( = ?auto_25661 ?auto_25664 ) ) ( not ( = ?auto_25661 ?auto_25681 ) ) ( not ( = ?auto_25662 ?auto_25664 ) ) ( not ( = ?auto_25662 ?auto_25681 ) ) ( not ( = ?auto_25664 ?auto_25684 ) ) ( not ( = ?auto_25664 ?auto_25682 ) ) ( not ( = ?auto_25664 ?auto_25695 ) ) ( not ( = ?auto_25664 ?auto_25674 ) ) ( not ( = ?auto_25664 ?auto_25686 ) ) ( not ( = ?auto_25664 ?auto_25690 ) ) ( not ( = ?auto_25696 ?auto_25698 ) ) ( not ( = ?auto_25696 ?auto_25677 ) ) ( not ( = ?auto_25696 ?auto_25685 ) ) ( not ( = ?auto_25696 ?auto_25689 ) ) ( not ( = ?auto_25696 ?auto_25679 ) ) ( not ( = ?auto_25697 ?auto_25676 ) ) ( not ( = ?auto_25697 ?auto_25694 ) ) ( not ( = ?auto_25697 ?auto_25675 ) ) ( not ( = ?auto_25697 ?auto_25692 ) ) ( not ( = ?auto_25697 ?auto_25678 ) ) ( not ( = ?auto_25681 ?auto_25684 ) ) ( not ( = ?auto_25681 ?auto_25682 ) ) ( not ( = ?auto_25681 ?auto_25695 ) ) ( not ( = ?auto_25681 ?auto_25674 ) ) ( not ( = ?auto_25681 ?auto_25686 ) ) ( not ( = ?auto_25681 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25665 ) ) ( not ( = ?auto_25657 ?auto_25687 ) ) ( not ( = ?auto_25658 ?auto_25665 ) ) ( not ( = ?auto_25658 ?auto_25687 ) ) ( not ( = ?auto_25659 ?auto_25665 ) ) ( not ( = ?auto_25659 ?auto_25687 ) ) ( not ( = ?auto_25660 ?auto_25665 ) ) ( not ( = ?auto_25660 ?auto_25687 ) ) ( not ( = ?auto_25661 ?auto_25665 ) ) ( not ( = ?auto_25661 ?auto_25687 ) ) ( not ( = ?auto_25662 ?auto_25665 ) ) ( not ( = ?auto_25662 ?auto_25687 ) ) ( not ( = ?auto_25663 ?auto_25665 ) ) ( not ( = ?auto_25663 ?auto_25687 ) ) ( not ( = ?auto_25665 ?auto_25681 ) ) ( not ( = ?auto_25665 ?auto_25684 ) ) ( not ( = ?auto_25665 ?auto_25682 ) ) ( not ( = ?auto_25665 ?auto_25695 ) ) ( not ( = ?auto_25665 ?auto_25674 ) ) ( not ( = ?auto_25665 ?auto_25686 ) ) ( not ( = ?auto_25665 ?auto_25690 ) ) ( not ( = ?auto_25680 ?auto_25696 ) ) ( not ( = ?auto_25680 ?auto_25698 ) ) ( not ( = ?auto_25680 ?auto_25677 ) ) ( not ( = ?auto_25680 ?auto_25685 ) ) ( not ( = ?auto_25680 ?auto_25689 ) ) ( not ( = ?auto_25680 ?auto_25679 ) ) ( not ( = ?auto_25688 ?auto_25697 ) ) ( not ( = ?auto_25688 ?auto_25676 ) ) ( not ( = ?auto_25688 ?auto_25694 ) ) ( not ( = ?auto_25688 ?auto_25675 ) ) ( not ( = ?auto_25688 ?auto_25692 ) ) ( not ( = ?auto_25688 ?auto_25678 ) ) ( not ( = ?auto_25687 ?auto_25681 ) ) ( not ( = ?auto_25687 ?auto_25684 ) ) ( not ( = ?auto_25687 ?auto_25682 ) ) ( not ( = ?auto_25687 ?auto_25695 ) ) ( not ( = ?auto_25687 ?auto_25674 ) ) ( not ( = ?auto_25687 ?auto_25686 ) ) ( not ( = ?auto_25687 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25666 ) ) ( not ( = ?auto_25657 ?auto_25693 ) ) ( not ( = ?auto_25658 ?auto_25666 ) ) ( not ( = ?auto_25658 ?auto_25693 ) ) ( not ( = ?auto_25659 ?auto_25666 ) ) ( not ( = ?auto_25659 ?auto_25693 ) ) ( not ( = ?auto_25660 ?auto_25666 ) ) ( not ( = ?auto_25660 ?auto_25693 ) ) ( not ( = ?auto_25661 ?auto_25666 ) ) ( not ( = ?auto_25661 ?auto_25693 ) ) ( not ( = ?auto_25662 ?auto_25666 ) ) ( not ( = ?auto_25662 ?auto_25693 ) ) ( not ( = ?auto_25663 ?auto_25666 ) ) ( not ( = ?auto_25663 ?auto_25693 ) ) ( not ( = ?auto_25664 ?auto_25666 ) ) ( not ( = ?auto_25664 ?auto_25693 ) ) ( not ( = ?auto_25666 ?auto_25687 ) ) ( not ( = ?auto_25666 ?auto_25681 ) ) ( not ( = ?auto_25666 ?auto_25684 ) ) ( not ( = ?auto_25666 ?auto_25682 ) ) ( not ( = ?auto_25666 ?auto_25695 ) ) ( not ( = ?auto_25666 ?auto_25674 ) ) ( not ( = ?auto_25666 ?auto_25686 ) ) ( not ( = ?auto_25666 ?auto_25690 ) ) ( not ( = ?auto_25691 ?auto_25680 ) ) ( not ( = ?auto_25691 ?auto_25696 ) ) ( not ( = ?auto_25691 ?auto_25698 ) ) ( not ( = ?auto_25691 ?auto_25677 ) ) ( not ( = ?auto_25691 ?auto_25685 ) ) ( not ( = ?auto_25691 ?auto_25689 ) ) ( not ( = ?auto_25691 ?auto_25679 ) ) ( not ( = ?auto_25683 ?auto_25688 ) ) ( not ( = ?auto_25683 ?auto_25697 ) ) ( not ( = ?auto_25683 ?auto_25676 ) ) ( not ( = ?auto_25683 ?auto_25694 ) ) ( not ( = ?auto_25683 ?auto_25675 ) ) ( not ( = ?auto_25683 ?auto_25692 ) ) ( not ( = ?auto_25683 ?auto_25678 ) ) ( not ( = ?auto_25693 ?auto_25687 ) ) ( not ( = ?auto_25693 ?auto_25681 ) ) ( not ( = ?auto_25693 ?auto_25684 ) ) ( not ( = ?auto_25693 ?auto_25682 ) ) ( not ( = ?auto_25693 ?auto_25695 ) ) ( not ( = ?auto_25693 ?auto_25674 ) ) ( not ( = ?auto_25693 ?auto_25686 ) ) ( not ( = ?auto_25693 ?auto_25690 ) ) ( not ( = ?auto_25657 ?auto_25667 ) ) ( not ( = ?auto_25657 ?auto_25670 ) ) ( not ( = ?auto_25658 ?auto_25667 ) ) ( not ( = ?auto_25658 ?auto_25670 ) ) ( not ( = ?auto_25659 ?auto_25667 ) ) ( not ( = ?auto_25659 ?auto_25670 ) ) ( not ( = ?auto_25660 ?auto_25667 ) ) ( not ( = ?auto_25660 ?auto_25670 ) ) ( not ( = ?auto_25661 ?auto_25667 ) ) ( not ( = ?auto_25661 ?auto_25670 ) ) ( not ( = ?auto_25662 ?auto_25667 ) ) ( not ( = ?auto_25662 ?auto_25670 ) ) ( not ( = ?auto_25663 ?auto_25667 ) ) ( not ( = ?auto_25663 ?auto_25670 ) ) ( not ( = ?auto_25664 ?auto_25667 ) ) ( not ( = ?auto_25664 ?auto_25670 ) ) ( not ( = ?auto_25665 ?auto_25667 ) ) ( not ( = ?auto_25665 ?auto_25670 ) ) ( not ( = ?auto_25667 ?auto_25693 ) ) ( not ( = ?auto_25667 ?auto_25687 ) ) ( not ( = ?auto_25667 ?auto_25681 ) ) ( not ( = ?auto_25667 ?auto_25684 ) ) ( not ( = ?auto_25667 ?auto_25682 ) ) ( not ( = ?auto_25667 ?auto_25695 ) ) ( not ( = ?auto_25667 ?auto_25674 ) ) ( not ( = ?auto_25667 ?auto_25686 ) ) ( not ( = ?auto_25667 ?auto_25690 ) ) ( not ( = ?auto_25673 ?auto_25691 ) ) ( not ( = ?auto_25673 ?auto_25680 ) ) ( not ( = ?auto_25673 ?auto_25696 ) ) ( not ( = ?auto_25673 ?auto_25698 ) ) ( not ( = ?auto_25673 ?auto_25677 ) ) ( not ( = ?auto_25673 ?auto_25685 ) ) ( not ( = ?auto_25673 ?auto_25689 ) ) ( not ( = ?auto_25673 ?auto_25679 ) ) ( not ( = ?auto_25668 ?auto_25683 ) ) ( not ( = ?auto_25668 ?auto_25688 ) ) ( not ( = ?auto_25668 ?auto_25697 ) ) ( not ( = ?auto_25668 ?auto_25676 ) ) ( not ( = ?auto_25668 ?auto_25694 ) ) ( not ( = ?auto_25668 ?auto_25675 ) ) ( not ( = ?auto_25668 ?auto_25692 ) ) ( not ( = ?auto_25668 ?auto_25678 ) ) ( not ( = ?auto_25670 ?auto_25693 ) ) ( not ( = ?auto_25670 ?auto_25687 ) ) ( not ( = ?auto_25670 ?auto_25681 ) ) ( not ( = ?auto_25670 ?auto_25684 ) ) ( not ( = ?auto_25670 ?auto_25682 ) ) ( not ( = ?auto_25670 ?auto_25695 ) ) ( not ( = ?auto_25670 ?auto_25674 ) ) ( not ( = ?auto_25670 ?auto_25686 ) ) ( not ( = ?auto_25670 ?auto_25690 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_25657 ?auto_25658 ?auto_25659 ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25663 ?auto_25664 ?auto_25665 ?auto_25666 )
      ( MAKE-1CRATE ?auto_25666 ?auto_25667 )
      ( MAKE-10CRATE-VERIFY ?auto_25657 ?auto_25658 ?auto_25659 ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25663 ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25667 ) )
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
      ?auto_25727 - SURFACE
      ?auto_25728 - SURFACE
      ?auto_25729 - SURFACE
      ?auto_25730 - SURFACE
      ?auto_25731 - SURFACE
      ?auto_25732 - SURFACE
    )
    :vars
    (
      ?auto_25736 - HOIST
      ?auto_25737 - PLACE
      ?auto_25738 - PLACE
      ?auto_25734 - HOIST
      ?auto_25733 - SURFACE
      ?auto_25761 - PLACE
      ?auto_25749 - HOIST
      ?auto_25750 - SURFACE
      ?auto_25758 - PLACE
      ?auto_25766 - HOIST
      ?auto_25756 - SURFACE
      ?auto_25765 - PLACE
      ?auto_25760 - HOIST
      ?auto_25764 - SURFACE
      ?auto_25759 - PLACE
      ?auto_25757 - HOIST
      ?auto_25755 - SURFACE
      ?auto_25743 - PLACE
      ?auto_25739 - HOIST
      ?auto_25762 - SURFACE
      ?auto_25742 - PLACE
      ?auto_25754 - HOIST
      ?auto_25745 - SURFACE
      ?auto_25740 - PLACE
      ?auto_25752 - HOIST
      ?auto_25744 - SURFACE
      ?auto_25747 - SURFACE
      ?auto_25753 - PLACE
      ?auto_25741 - HOIST
      ?auto_25763 - SURFACE
      ?auto_25746 - PLACE
      ?auto_25751 - HOIST
      ?auto_25748 - SURFACE
      ?auto_25735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25736 ?auto_25737 ) ( IS-CRATE ?auto_25732 ) ( not ( = ?auto_25738 ?auto_25737 ) ) ( HOIST-AT ?auto_25734 ?auto_25738 ) ( AVAILABLE ?auto_25734 ) ( SURFACE-AT ?auto_25732 ?auto_25738 ) ( ON ?auto_25732 ?auto_25733 ) ( CLEAR ?auto_25732 ) ( not ( = ?auto_25731 ?auto_25732 ) ) ( not ( = ?auto_25731 ?auto_25733 ) ) ( not ( = ?auto_25732 ?auto_25733 ) ) ( not ( = ?auto_25736 ?auto_25734 ) ) ( IS-CRATE ?auto_25731 ) ( not ( = ?auto_25761 ?auto_25737 ) ) ( HOIST-AT ?auto_25749 ?auto_25761 ) ( AVAILABLE ?auto_25749 ) ( SURFACE-AT ?auto_25731 ?auto_25761 ) ( ON ?auto_25731 ?auto_25750 ) ( CLEAR ?auto_25731 ) ( not ( = ?auto_25730 ?auto_25731 ) ) ( not ( = ?auto_25730 ?auto_25750 ) ) ( not ( = ?auto_25731 ?auto_25750 ) ) ( not ( = ?auto_25736 ?auto_25749 ) ) ( IS-CRATE ?auto_25730 ) ( not ( = ?auto_25758 ?auto_25737 ) ) ( HOIST-AT ?auto_25766 ?auto_25758 ) ( AVAILABLE ?auto_25766 ) ( SURFACE-AT ?auto_25730 ?auto_25758 ) ( ON ?auto_25730 ?auto_25756 ) ( CLEAR ?auto_25730 ) ( not ( = ?auto_25729 ?auto_25730 ) ) ( not ( = ?auto_25729 ?auto_25756 ) ) ( not ( = ?auto_25730 ?auto_25756 ) ) ( not ( = ?auto_25736 ?auto_25766 ) ) ( IS-CRATE ?auto_25729 ) ( not ( = ?auto_25765 ?auto_25737 ) ) ( HOIST-AT ?auto_25760 ?auto_25765 ) ( AVAILABLE ?auto_25760 ) ( SURFACE-AT ?auto_25729 ?auto_25765 ) ( ON ?auto_25729 ?auto_25764 ) ( CLEAR ?auto_25729 ) ( not ( = ?auto_25728 ?auto_25729 ) ) ( not ( = ?auto_25728 ?auto_25764 ) ) ( not ( = ?auto_25729 ?auto_25764 ) ) ( not ( = ?auto_25736 ?auto_25760 ) ) ( IS-CRATE ?auto_25728 ) ( not ( = ?auto_25759 ?auto_25737 ) ) ( HOIST-AT ?auto_25757 ?auto_25759 ) ( AVAILABLE ?auto_25757 ) ( SURFACE-AT ?auto_25728 ?auto_25759 ) ( ON ?auto_25728 ?auto_25755 ) ( CLEAR ?auto_25728 ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( not ( = ?auto_25727 ?auto_25755 ) ) ( not ( = ?auto_25728 ?auto_25755 ) ) ( not ( = ?auto_25736 ?auto_25757 ) ) ( IS-CRATE ?auto_25727 ) ( not ( = ?auto_25743 ?auto_25737 ) ) ( HOIST-AT ?auto_25739 ?auto_25743 ) ( AVAILABLE ?auto_25739 ) ( SURFACE-AT ?auto_25727 ?auto_25743 ) ( ON ?auto_25727 ?auto_25762 ) ( CLEAR ?auto_25727 ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25762 ) ) ( not ( = ?auto_25727 ?auto_25762 ) ) ( not ( = ?auto_25736 ?auto_25739 ) ) ( IS-CRATE ?auto_25726 ) ( not ( = ?auto_25742 ?auto_25737 ) ) ( HOIST-AT ?auto_25754 ?auto_25742 ) ( SURFACE-AT ?auto_25726 ?auto_25742 ) ( ON ?auto_25726 ?auto_25745 ) ( CLEAR ?auto_25726 ) ( not ( = ?auto_25725 ?auto_25726 ) ) ( not ( = ?auto_25725 ?auto_25745 ) ) ( not ( = ?auto_25726 ?auto_25745 ) ) ( not ( = ?auto_25736 ?auto_25754 ) ) ( IS-CRATE ?auto_25725 ) ( not ( = ?auto_25740 ?auto_25737 ) ) ( HOIST-AT ?auto_25752 ?auto_25740 ) ( AVAILABLE ?auto_25752 ) ( SURFACE-AT ?auto_25725 ?auto_25740 ) ( ON ?auto_25725 ?auto_25744 ) ( CLEAR ?auto_25725 ) ( not ( = ?auto_25724 ?auto_25725 ) ) ( not ( = ?auto_25724 ?auto_25744 ) ) ( not ( = ?auto_25725 ?auto_25744 ) ) ( not ( = ?auto_25736 ?auto_25752 ) ) ( IS-CRATE ?auto_25724 ) ( AVAILABLE ?auto_25754 ) ( SURFACE-AT ?auto_25724 ?auto_25742 ) ( ON ?auto_25724 ?auto_25747 ) ( CLEAR ?auto_25724 ) ( not ( = ?auto_25723 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25747 ) ) ( not ( = ?auto_25724 ?auto_25747 ) ) ( IS-CRATE ?auto_25723 ) ( not ( = ?auto_25753 ?auto_25737 ) ) ( HOIST-AT ?auto_25741 ?auto_25753 ) ( AVAILABLE ?auto_25741 ) ( SURFACE-AT ?auto_25723 ?auto_25753 ) ( ON ?auto_25723 ?auto_25763 ) ( CLEAR ?auto_25723 ) ( not ( = ?auto_25722 ?auto_25723 ) ) ( not ( = ?auto_25722 ?auto_25763 ) ) ( not ( = ?auto_25723 ?auto_25763 ) ) ( not ( = ?auto_25736 ?auto_25741 ) ) ( SURFACE-AT ?auto_25721 ?auto_25737 ) ( CLEAR ?auto_25721 ) ( IS-CRATE ?auto_25722 ) ( AVAILABLE ?auto_25736 ) ( not ( = ?auto_25746 ?auto_25737 ) ) ( HOIST-AT ?auto_25751 ?auto_25746 ) ( AVAILABLE ?auto_25751 ) ( SURFACE-AT ?auto_25722 ?auto_25746 ) ( ON ?auto_25722 ?auto_25748 ) ( CLEAR ?auto_25722 ) ( TRUCK-AT ?auto_25735 ?auto_25737 ) ( not ( = ?auto_25721 ?auto_25722 ) ) ( not ( = ?auto_25721 ?auto_25748 ) ) ( not ( = ?auto_25722 ?auto_25748 ) ) ( not ( = ?auto_25736 ?auto_25751 ) ) ( not ( = ?auto_25721 ?auto_25723 ) ) ( not ( = ?auto_25721 ?auto_25763 ) ) ( not ( = ?auto_25723 ?auto_25748 ) ) ( not ( = ?auto_25753 ?auto_25746 ) ) ( not ( = ?auto_25741 ?auto_25751 ) ) ( not ( = ?auto_25763 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25724 ) ) ( not ( = ?auto_25721 ?auto_25747 ) ) ( not ( = ?auto_25722 ?auto_25724 ) ) ( not ( = ?auto_25722 ?auto_25747 ) ) ( not ( = ?auto_25724 ?auto_25763 ) ) ( not ( = ?auto_25724 ?auto_25748 ) ) ( not ( = ?auto_25742 ?auto_25753 ) ) ( not ( = ?auto_25742 ?auto_25746 ) ) ( not ( = ?auto_25754 ?auto_25741 ) ) ( not ( = ?auto_25754 ?auto_25751 ) ) ( not ( = ?auto_25747 ?auto_25763 ) ) ( not ( = ?auto_25747 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25725 ) ) ( not ( = ?auto_25721 ?auto_25744 ) ) ( not ( = ?auto_25722 ?auto_25725 ) ) ( not ( = ?auto_25722 ?auto_25744 ) ) ( not ( = ?auto_25723 ?auto_25725 ) ) ( not ( = ?auto_25723 ?auto_25744 ) ) ( not ( = ?auto_25725 ?auto_25747 ) ) ( not ( = ?auto_25725 ?auto_25763 ) ) ( not ( = ?auto_25725 ?auto_25748 ) ) ( not ( = ?auto_25740 ?auto_25742 ) ) ( not ( = ?auto_25740 ?auto_25753 ) ) ( not ( = ?auto_25740 ?auto_25746 ) ) ( not ( = ?auto_25752 ?auto_25754 ) ) ( not ( = ?auto_25752 ?auto_25741 ) ) ( not ( = ?auto_25752 ?auto_25751 ) ) ( not ( = ?auto_25744 ?auto_25747 ) ) ( not ( = ?auto_25744 ?auto_25763 ) ) ( not ( = ?auto_25744 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25726 ) ) ( not ( = ?auto_25721 ?auto_25745 ) ) ( not ( = ?auto_25722 ?auto_25726 ) ) ( not ( = ?auto_25722 ?auto_25745 ) ) ( not ( = ?auto_25723 ?auto_25726 ) ) ( not ( = ?auto_25723 ?auto_25745 ) ) ( not ( = ?auto_25724 ?auto_25726 ) ) ( not ( = ?auto_25724 ?auto_25745 ) ) ( not ( = ?auto_25726 ?auto_25744 ) ) ( not ( = ?auto_25726 ?auto_25747 ) ) ( not ( = ?auto_25726 ?auto_25763 ) ) ( not ( = ?auto_25726 ?auto_25748 ) ) ( not ( = ?auto_25745 ?auto_25744 ) ) ( not ( = ?auto_25745 ?auto_25747 ) ) ( not ( = ?auto_25745 ?auto_25763 ) ) ( not ( = ?auto_25745 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25727 ) ) ( not ( = ?auto_25721 ?auto_25762 ) ) ( not ( = ?auto_25722 ?auto_25727 ) ) ( not ( = ?auto_25722 ?auto_25762 ) ) ( not ( = ?auto_25723 ?auto_25727 ) ) ( not ( = ?auto_25723 ?auto_25762 ) ) ( not ( = ?auto_25724 ?auto_25727 ) ) ( not ( = ?auto_25724 ?auto_25762 ) ) ( not ( = ?auto_25725 ?auto_25727 ) ) ( not ( = ?auto_25725 ?auto_25762 ) ) ( not ( = ?auto_25727 ?auto_25745 ) ) ( not ( = ?auto_25727 ?auto_25744 ) ) ( not ( = ?auto_25727 ?auto_25747 ) ) ( not ( = ?auto_25727 ?auto_25763 ) ) ( not ( = ?auto_25727 ?auto_25748 ) ) ( not ( = ?auto_25743 ?auto_25742 ) ) ( not ( = ?auto_25743 ?auto_25740 ) ) ( not ( = ?auto_25743 ?auto_25753 ) ) ( not ( = ?auto_25743 ?auto_25746 ) ) ( not ( = ?auto_25739 ?auto_25754 ) ) ( not ( = ?auto_25739 ?auto_25752 ) ) ( not ( = ?auto_25739 ?auto_25741 ) ) ( not ( = ?auto_25739 ?auto_25751 ) ) ( not ( = ?auto_25762 ?auto_25745 ) ) ( not ( = ?auto_25762 ?auto_25744 ) ) ( not ( = ?auto_25762 ?auto_25747 ) ) ( not ( = ?auto_25762 ?auto_25763 ) ) ( not ( = ?auto_25762 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25728 ) ) ( not ( = ?auto_25721 ?auto_25755 ) ) ( not ( = ?auto_25722 ?auto_25728 ) ) ( not ( = ?auto_25722 ?auto_25755 ) ) ( not ( = ?auto_25723 ?auto_25728 ) ) ( not ( = ?auto_25723 ?auto_25755 ) ) ( not ( = ?auto_25724 ?auto_25728 ) ) ( not ( = ?auto_25724 ?auto_25755 ) ) ( not ( = ?auto_25725 ?auto_25728 ) ) ( not ( = ?auto_25725 ?auto_25755 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25726 ?auto_25755 ) ) ( not ( = ?auto_25728 ?auto_25762 ) ) ( not ( = ?auto_25728 ?auto_25745 ) ) ( not ( = ?auto_25728 ?auto_25744 ) ) ( not ( = ?auto_25728 ?auto_25747 ) ) ( not ( = ?auto_25728 ?auto_25763 ) ) ( not ( = ?auto_25728 ?auto_25748 ) ) ( not ( = ?auto_25759 ?auto_25743 ) ) ( not ( = ?auto_25759 ?auto_25742 ) ) ( not ( = ?auto_25759 ?auto_25740 ) ) ( not ( = ?auto_25759 ?auto_25753 ) ) ( not ( = ?auto_25759 ?auto_25746 ) ) ( not ( = ?auto_25757 ?auto_25739 ) ) ( not ( = ?auto_25757 ?auto_25754 ) ) ( not ( = ?auto_25757 ?auto_25752 ) ) ( not ( = ?auto_25757 ?auto_25741 ) ) ( not ( = ?auto_25757 ?auto_25751 ) ) ( not ( = ?auto_25755 ?auto_25762 ) ) ( not ( = ?auto_25755 ?auto_25745 ) ) ( not ( = ?auto_25755 ?auto_25744 ) ) ( not ( = ?auto_25755 ?auto_25747 ) ) ( not ( = ?auto_25755 ?auto_25763 ) ) ( not ( = ?auto_25755 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25729 ) ) ( not ( = ?auto_25721 ?auto_25764 ) ) ( not ( = ?auto_25722 ?auto_25729 ) ) ( not ( = ?auto_25722 ?auto_25764 ) ) ( not ( = ?auto_25723 ?auto_25729 ) ) ( not ( = ?auto_25723 ?auto_25764 ) ) ( not ( = ?auto_25724 ?auto_25729 ) ) ( not ( = ?auto_25724 ?auto_25764 ) ) ( not ( = ?auto_25725 ?auto_25729 ) ) ( not ( = ?auto_25725 ?auto_25764 ) ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25726 ?auto_25764 ) ) ( not ( = ?auto_25727 ?auto_25729 ) ) ( not ( = ?auto_25727 ?auto_25764 ) ) ( not ( = ?auto_25729 ?auto_25755 ) ) ( not ( = ?auto_25729 ?auto_25762 ) ) ( not ( = ?auto_25729 ?auto_25745 ) ) ( not ( = ?auto_25729 ?auto_25744 ) ) ( not ( = ?auto_25729 ?auto_25747 ) ) ( not ( = ?auto_25729 ?auto_25763 ) ) ( not ( = ?auto_25729 ?auto_25748 ) ) ( not ( = ?auto_25765 ?auto_25759 ) ) ( not ( = ?auto_25765 ?auto_25743 ) ) ( not ( = ?auto_25765 ?auto_25742 ) ) ( not ( = ?auto_25765 ?auto_25740 ) ) ( not ( = ?auto_25765 ?auto_25753 ) ) ( not ( = ?auto_25765 ?auto_25746 ) ) ( not ( = ?auto_25760 ?auto_25757 ) ) ( not ( = ?auto_25760 ?auto_25739 ) ) ( not ( = ?auto_25760 ?auto_25754 ) ) ( not ( = ?auto_25760 ?auto_25752 ) ) ( not ( = ?auto_25760 ?auto_25741 ) ) ( not ( = ?auto_25760 ?auto_25751 ) ) ( not ( = ?auto_25764 ?auto_25755 ) ) ( not ( = ?auto_25764 ?auto_25762 ) ) ( not ( = ?auto_25764 ?auto_25745 ) ) ( not ( = ?auto_25764 ?auto_25744 ) ) ( not ( = ?auto_25764 ?auto_25747 ) ) ( not ( = ?auto_25764 ?auto_25763 ) ) ( not ( = ?auto_25764 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25730 ) ) ( not ( = ?auto_25721 ?auto_25756 ) ) ( not ( = ?auto_25722 ?auto_25730 ) ) ( not ( = ?auto_25722 ?auto_25756 ) ) ( not ( = ?auto_25723 ?auto_25730 ) ) ( not ( = ?auto_25723 ?auto_25756 ) ) ( not ( = ?auto_25724 ?auto_25730 ) ) ( not ( = ?auto_25724 ?auto_25756 ) ) ( not ( = ?auto_25725 ?auto_25730 ) ) ( not ( = ?auto_25725 ?auto_25756 ) ) ( not ( = ?auto_25726 ?auto_25730 ) ) ( not ( = ?auto_25726 ?auto_25756 ) ) ( not ( = ?auto_25727 ?auto_25730 ) ) ( not ( = ?auto_25727 ?auto_25756 ) ) ( not ( = ?auto_25728 ?auto_25730 ) ) ( not ( = ?auto_25728 ?auto_25756 ) ) ( not ( = ?auto_25730 ?auto_25764 ) ) ( not ( = ?auto_25730 ?auto_25755 ) ) ( not ( = ?auto_25730 ?auto_25762 ) ) ( not ( = ?auto_25730 ?auto_25745 ) ) ( not ( = ?auto_25730 ?auto_25744 ) ) ( not ( = ?auto_25730 ?auto_25747 ) ) ( not ( = ?auto_25730 ?auto_25763 ) ) ( not ( = ?auto_25730 ?auto_25748 ) ) ( not ( = ?auto_25758 ?auto_25765 ) ) ( not ( = ?auto_25758 ?auto_25759 ) ) ( not ( = ?auto_25758 ?auto_25743 ) ) ( not ( = ?auto_25758 ?auto_25742 ) ) ( not ( = ?auto_25758 ?auto_25740 ) ) ( not ( = ?auto_25758 ?auto_25753 ) ) ( not ( = ?auto_25758 ?auto_25746 ) ) ( not ( = ?auto_25766 ?auto_25760 ) ) ( not ( = ?auto_25766 ?auto_25757 ) ) ( not ( = ?auto_25766 ?auto_25739 ) ) ( not ( = ?auto_25766 ?auto_25754 ) ) ( not ( = ?auto_25766 ?auto_25752 ) ) ( not ( = ?auto_25766 ?auto_25741 ) ) ( not ( = ?auto_25766 ?auto_25751 ) ) ( not ( = ?auto_25756 ?auto_25764 ) ) ( not ( = ?auto_25756 ?auto_25755 ) ) ( not ( = ?auto_25756 ?auto_25762 ) ) ( not ( = ?auto_25756 ?auto_25745 ) ) ( not ( = ?auto_25756 ?auto_25744 ) ) ( not ( = ?auto_25756 ?auto_25747 ) ) ( not ( = ?auto_25756 ?auto_25763 ) ) ( not ( = ?auto_25756 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25731 ) ) ( not ( = ?auto_25721 ?auto_25750 ) ) ( not ( = ?auto_25722 ?auto_25731 ) ) ( not ( = ?auto_25722 ?auto_25750 ) ) ( not ( = ?auto_25723 ?auto_25731 ) ) ( not ( = ?auto_25723 ?auto_25750 ) ) ( not ( = ?auto_25724 ?auto_25731 ) ) ( not ( = ?auto_25724 ?auto_25750 ) ) ( not ( = ?auto_25725 ?auto_25731 ) ) ( not ( = ?auto_25725 ?auto_25750 ) ) ( not ( = ?auto_25726 ?auto_25731 ) ) ( not ( = ?auto_25726 ?auto_25750 ) ) ( not ( = ?auto_25727 ?auto_25731 ) ) ( not ( = ?auto_25727 ?auto_25750 ) ) ( not ( = ?auto_25728 ?auto_25731 ) ) ( not ( = ?auto_25728 ?auto_25750 ) ) ( not ( = ?auto_25729 ?auto_25731 ) ) ( not ( = ?auto_25729 ?auto_25750 ) ) ( not ( = ?auto_25731 ?auto_25756 ) ) ( not ( = ?auto_25731 ?auto_25764 ) ) ( not ( = ?auto_25731 ?auto_25755 ) ) ( not ( = ?auto_25731 ?auto_25762 ) ) ( not ( = ?auto_25731 ?auto_25745 ) ) ( not ( = ?auto_25731 ?auto_25744 ) ) ( not ( = ?auto_25731 ?auto_25747 ) ) ( not ( = ?auto_25731 ?auto_25763 ) ) ( not ( = ?auto_25731 ?auto_25748 ) ) ( not ( = ?auto_25761 ?auto_25758 ) ) ( not ( = ?auto_25761 ?auto_25765 ) ) ( not ( = ?auto_25761 ?auto_25759 ) ) ( not ( = ?auto_25761 ?auto_25743 ) ) ( not ( = ?auto_25761 ?auto_25742 ) ) ( not ( = ?auto_25761 ?auto_25740 ) ) ( not ( = ?auto_25761 ?auto_25753 ) ) ( not ( = ?auto_25761 ?auto_25746 ) ) ( not ( = ?auto_25749 ?auto_25766 ) ) ( not ( = ?auto_25749 ?auto_25760 ) ) ( not ( = ?auto_25749 ?auto_25757 ) ) ( not ( = ?auto_25749 ?auto_25739 ) ) ( not ( = ?auto_25749 ?auto_25754 ) ) ( not ( = ?auto_25749 ?auto_25752 ) ) ( not ( = ?auto_25749 ?auto_25741 ) ) ( not ( = ?auto_25749 ?auto_25751 ) ) ( not ( = ?auto_25750 ?auto_25756 ) ) ( not ( = ?auto_25750 ?auto_25764 ) ) ( not ( = ?auto_25750 ?auto_25755 ) ) ( not ( = ?auto_25750 ?auto_25762 ) ) ( not ( = ?auto_25750 ?auto_25745 ) ) ( not ( = ?auto_25750 ?auto_25744 ) ) ( not ( = ?auto_25750 ?auto_25747 ) ) ( not ( = ?auto_25750 ?auto_25763 ) ) ( not ( = ?auto_25750 ?auto_25748 ) ) ( not ( = ?auto_25721 ?auto_25732 ) ) ( not ( = ?auto_25721 ?auto_25733 ) ) ( not ( = ?auto_25722 ?auto_25732 ) ) ( not ( = ?auto_25722 ?auto_25733 ) ) ( not ( = ?auto_25723 ?auto_25732 ) ) ( not ( = ?auto_25723 ?auto_25733 ) ) ( not ( = ?auto_25724 ?auto_25732 ) ) ( not ( = ?auto_25724 ?auto_25733 ) ) ( not ( = ?auto_25725 ?auto_25732 ) ) ( not ( = ?auto_25725 ?auto_25733 ) ) ( not ( = ?auto_25726 ?auto_25732 ) ) ( not ( = ?auto_25726 ?auto_25733 ) ) ( not ( = ?auto_25727 ?auto_25732 ) ) ( not ( = ?auto_25727 ?auto_25733 ) ) ( not ( = ?auto_25728 ?auto_25732 ) ) ( not ( = ?auto_25728 ?auto_25733 ) ) ( not ( = ?auto_25729 ?auto_25732 ) ) ( not ( = ?auto_25729 ?auto_25733 ) ) ( not ( = ?auto_25730 ?auto_25732 ) ) ( not ( = ?auto_25730 ?auto_25733 ) ) ( not ( = ?auto_25732 ?auto_25750 ) ) ( not ( = ?auto_25732 ?auto_25756 ) ) ( not ( = ?auto_25732 ?auto_25764 ) ) ( not ( = ?auto_25732 ?auto_25755 ) ) ( not ( = ?auto_25732 ?auto_25762 ) ) ( not ( = ?auto_25732 ?auto_25745 ) ) ( not ( = ?auto_25732 ?auto_25744 ) ) ( not ( = ?auto_25732 ?auto_25747 ) ) ( not ( = ?auto_25732 ?auto_25763 ) ) ( not ( = ?auto_25732 ?auto_25748 ) ) ( not ( = ?auto_25738 ?auto_25761 ) ) ( not ( = ?auto_25738 ?auto_25758 ) ) ( not ( = ?auto_25738 ?auto_25765 ) ) ( not ( = ?auto_25738 ?auto_25759 ) ) ( not ( = ?auto_25738 ?auto_25743 ) ) ( not ( = ?auto_25738 ?auto_25742 ) ) ( not ( = ?auto_25738 ?auto_25740 ) ) ( not ( = ?auto_25738 ?auto_25753 ) ) ( not ( = ?auto_25738 ?auto_25746 ) ) ( not ( = ?auto_25734 ?auto_25749 ) ) ( not ( = ?auto_25734 ?auto_25766 ) ) ( not ( = ?auto_25734 ?auto_25760 ) ) ( not ( = ?auto_25734 ?auto_25757 ) ) ( not ( = ?auto_25734 ?auto_25739 ) ) ( not ( = ?auto_25734 ?auto_25754 ) ) ( not ( = ?auto_25734 ?auto_25752 ) ) ( not ( = ?auto_25734 ?auto_25741 ) ) ( not ( = ?auto_25734 ?auto_25751 ) ) ( not ( = ?auto_25733 ?auto_25750 ) ) ( not ( = ?auto_25733 ?auto_25756 ) ) ( not ( = ?auto_25733 ?auto_25764 ) ) ( not ( = ?auto_25733 ?auto_25755 ) ) ( not ( = ?auto_25733 ?auto_25762 ) ) ( not ( = ?auto_25733 ?auto_25745 ) ) ( not ( = ?auto_25733 ?auto_25744 ) ) ( not ( = ?auto_25733 ?auto_25747 ) ) ( not ( = ?auto_25733 ?auto_25763 ) ) ( not ( = ?auto_25733 ?auto_25748 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25728 ?auto_25729 ?auto_25730 ?auto_25731 )
      ( MAKE-1CRATE ?auto_25731 ?auto_25732 )
      ( MAKE-11CRATE-VERIFY ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25728 ?auto_25729 ?auto_25730 ?auto_25731 ?auto_25732 ) )
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
      ?auto_25796 - SURFACE
      ?auto_25797 - SURFACE
      ?auto_25798 - SURFACE
      ?auto_25799 - SURFACE
      ?auto_25800 - SURFACE
      ?auto_25801 - SURFACE
      ?auto_25802 - SURFACE
    )
    :vars
    (
      ?auto_25803 - HOIST
      ?auto_25808 - PLACE
      ?auto_25807 - PLACE
      ?auto_25805 - HOIST
      ?auto_25804 - SURFACE
      ?auto_25809 - PLACE
      ?auto_25810 - HOIST
      ?auto_25813 - SURFACE
      ?auto_25815 - PLACE
      ?auto_25812 - HOIST
      ?auto_25829 - SURFACE
      ?auto_25828 - PLACE
      ?auto_25816 - HOIST
      ?auto_25834 - SURFACE
      ?auto_25825 - PLACE
      ?auto_25820 - HOIST
      ?auto_25835 - SURFACE
      ?auto_25811 - PLACE
      ?auto_25822 - HOIST
      ?auto_25838 - SURFACE
      ?auto_25837 - PLACE
      ?auto_25823 - HOIST
      ?auto_25832 - SURFACE
      ?auto_25833 - PLACE
      ?auto_25821 - HOIST
      ?auto_25839 - SURFACE
      ?auto_25818 - PLACE
      ?auto_25819 - HOIST
      ?auto_25817 - SURFACE
      ?auto_25826 - SURFACE
      ?auto_25824 - PLACE
      ?auto_25830 - HOIST
      ?auto_25831 - SURFACE
      ?auto_25836 - PLACE
      ?auto_25827 - HOIST
      ?auto_25814 - SURFACE
      ?auto_25806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25803 ?auto_25808 ) ( IS-CRATE ?auto_25802 ) ( not ( = ?auto_25807 ?auto_25808 ) ) ( HOIST-AT ?auto_25805 ?auto_25807 ) ( AVAILABLE ?auto_25805 ) ( SURFACE-AT ?auto_25802 ?auto_25807 ) ( ON ?auto_25802 ?auto_25804 ) ( CLEAR ?auto_25802 ) ( not ( = ?auto_25801 ?auto_25802 ) ) ( not ( = ?auto_25801 ?auto_25804 ) ) ( not ( = ?auto_25802 ?auto_25804 ) ) ( not ( = ?auto_25803 ?auto_25805 ) ) ( IS-CRATE ?auto_25801 ) ( not ( = ?auto_25809 ?auto_25808 ) ) ( HOIST-AT ?auto_25810 ?auto_25809 ) ( AVAILABLE ?auto_25810 ) ( SURFACE-AT ?auto_25801 ?auto_25809 ) ( ON ?auto_25801 ?auto_25813 ) ( CLEAR ?auto_25801 ) ( not ( = ?auto_25800 ?auto_25801 ) ) ( not ( = ?auto_25800 ?auto_25813 ) ) ( not ( = ?auto_25801 ?auto_25813 ) ) ( not ( = ?auto_25803 ?auto_25810 ) ) ( IS-CRATE ?auto_25800 ) ( not ( = ?auto_25815 ?auto_25808 ) ) ( HOIST-AT ?auto_25812 ?auto_25815 ) ( AVAILABLE ?auto_25812 ) ( SURFACE-AT ?auto_25800 ?auto_25815 ) ( ON ?auto_25800 ?auto_25829 ) ( CLEAR ?auto_25800 ) ( not ( = ?auto_25799 ?auto_25800 ) ) ( not ( = ?auto_25799 ?auto_25829 ) ) ( not ( = ?auto_25800 ?auto_25829 ) ) ( not ( = ?auto_25803 ?auto_25812 ) ) ( IS-CRATE ?auto_25799 ) ( not ( = ?auto_25828 ?auto_25808 ) ) ( HOIST-AT ?auto_25816 ?auto_25828 ) ( AVAILABLE ?auto_25816 ) ( SURFACE-AT ?auto_25799 ?auto_25828 ) ( ON ?auto_25799 ?auto_25834 ) ( CLEAR ?auto_25799 ) ( not ( = ?auto_25798 ?auto_25799 ) ) ( not ( = ?auto_25798 ?auto_25834 ) ) ( not ( = ?auto_25799 ?auto_25834 ) ) ( not ( = ?auto_25803 ?auto_25816 ) ) ( IS-CRATE ?auto_25798 ) ( not ( = ?auto_25825 ?auto_25808 ) ) ( HOIST-AT ?auto_25820 ?auto_25825 ) ( AVAILABLE ?auto_25820 ) ( SURFACE-AT ?auto_25798 ?auto_25825 ) ( ON ?auto_25798 ?auto_25835 ) ( CLEAR ?auto_25798 ) ( not ( = ?auto_25797 ?auto_25798 ) ) ( not ( = ?auto_25797 ?auto_25835 ) ) ( not ( = ?auto_25798 ?auto_25835 ) ) ( not ( = ?auto_25803 ?auto_25820 ) ) ( IS-CRATE ?auto_25797 ) ( not ( = ?auto_25811 ?auto_25808 ) ) ( HOIST-AT ?auto_25822 ?auto_25811 ) ( AVAILABLE ?auto_25822 ) ( SURFACE-AT ?auto_25797 ?auto_25811 ) ( ON ?auto_25797 ?auto_25838 ) ( CLEAR ?auto_25797 ) ( not ( = ?auto_25796 ?auto_25797 ) ) ( not ( = ?auto_25796 ?auto_25838 ) ) ( not ( = ?auto_25797 ?auto_25838 ) ) ( not ( = ?auto_25803 ?auto_25822 ) ) ( IS-CRATE ?auto_25796 ) ( not ( = ?auto_25837 ?auto_25808 ) ) ( HOIST-AT ?auto_25823 ?auto_25837 ) ( AVAILABLE ?auto_25823 ) ( SURFACE-AT ?auto_25796 ?auto_25837 ) ( ON ?auto_25796 ?auto_25832 ) ( CLEAR ?auto_25796 ) ( not ( = ?auto_25795 ?auto_25796 ) ) ( not ( = ?auto_25795 ?auto_25832 ) ) ( not ( = ?auto_25796 ?auto_25832 ) ) ( not ( = ?auto_25803 ?auto_25823 ) ) ( IS-CRATE ?auto_25795 ) ( not ( = ?auto_25833 ?auto_25808 ) ) ( HOIST-AT ?auto_25821 ?auto_25833 ) ( SURFACE-AT ?auto_25795 ?auto_25833 ) ( ON ?auto_25795 ?auto_25839 ) ( CLEAR ?auto_25795 ) ( not ( = ?auto_25794 ?auto_25795 ) ) ( not ( = ?auto_25794 ?auto_25839 ) ) ( not ( = ?auto_25795 ?auto_25839 ) ) ( not ( = ?auto_25803 ?auto_25821 ) ) ( IS-CRATE ?auto_25794 ) ( not ( = ?auto_25818 ?auto_25808 ) ) ( HOIST-AT ?auto_25819 ?auto_25818 ) ( AVAILABLE ?auto_25819 ) ( SURFACE-AT ?auto_25794 ?auto_25818 ) ( ON ?auto_25794 ?auto_25817 ) ( CLEAR ?auto_25794 ) ( not ( = ?auto_25793 ?auto_25794 ) ) ( not ( = ?auto_25793 ?auto_25817 ) ) ( not ( = ?auto_25794 ?auto_25817 ) ) ( not ( = ?auto_25803 ?auto_25819 ) ) ( IS-CRATE ?auto_25793 ) ( AVAILABLE ?auto_25821 ) ( SURFACE-AT ?auto_25793 ?auto_25833 ) ( ON ?auto_25793 ?auto_25826 ) ( CLEAR ?auto_25793 ) ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25826 ) ) ( not ( = ?auto_25793 ?auto_25826 ) ) ( IS-CRATE ?auto_25792 ) ( not ( = ?auto_25824 ?auto_25808 ) ) ( HOIST-AT ?auto_25830 ?auto_25824 ) ( AVAILABLE ?auto_25830 ) ( SURFACE-AT ?auto_25792 ?auto_25824 ) ( ON ?auto_25792 ?auto_25831 ) ( CLEAR ?auto_25792 ) ( not ( = ?auto_25791 ?auto_25792 ) ) ( not ( = ?auto_25791 ?auto_25831 ) ) ( not ( = ?auto_25792 ?auto_25831 ) ) ( not ( = ?auto_25803 ?auto_25830 ) ) ( SURFACE-AT ?auto_25790 ?auto_25808 ) ( CLEAR ?auto_25790 ) ( IS-CRATE ?auto_25791 ) ( AVAILABLE ?auto_25803 ) ( not ( = ?auto_25836 ?auto_25808 ) ) ( HOIST-AT ?auto_25827 ?auto_25836 ) ( AVAILABLE ?auto_25827 ) ( SURFACE-AT ?auto_25791 ?auto_25836 ) ( ON ?auto_25791 ?auto_25814 ) ( CLEAR ?auto_25791 ) ( TRUCK-AT ?auto_25806 ?auto_25808 ) ( not ( = ?auto_25790 ?auto_25791 ) ) ( not ( = ?auto_25790 ?auto_25814 ) ) ( not ( = ?auto_25791 ?auto_25814 ) ) ( not ( = ?auto_25803 ?auto_25827 ) ) ( not ( = ?auto_25790 ?auto_25792 ) ) ( not ( = ?auto_25790 ?auto_25831 ) ) ( not ( = ?auto_25792 ?auto_25814 ) ) ( not ( = ?auto_25824 ?auto_25836 ) ) ( not ( = ?auto_25830 ?auto_25827 ) ) ( not ( = ?auto_25831 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25793 ) ) ( not ( = ?auto_25790 ?auto_25826 ) ) ( not ( = ?auto_25791 ?auto_25793 ) ) ( not ( = ?auto_25791 ?auto_25826 ) ) ( not ( = ?auto_25793 ?auto_25831 ) ) ( not ( = ?auto_25793 ?auto_25814 ) ) ( not ( = ?auto_25833 ?auto_25824 ) ) ( not ( = ?auto_25833 ?auto_25836 ) ) ( not ( = ?auto_25821 ?auto_25830 ) ) ( not ( = ?auto_25821 ?auto_25827 ) ) ( not ( = ?auto_25826 ?auto_25831 ) ) ( not ( = ?auto_25826 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25794 ) ) ( not ( = ?auto_25790 ?auto_25817 ) ) ( not ( = ?auto_25791 ?auto_25794 ) ) ( not ( = ?auto_25791 ?auto_25817 ) ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25792 ?auto_25817 ) ) ( not ( = ?auto_25794 ?auto_25826 ) ) ( not ( = ?auto_25794 ?auto_25831 ) ) ( not ( = ?auto_25794 ?auto_25814 ) ) ( not ( = ?auto_25818 ?auto_25833 ) ) ( not ( = ?auto_25818 ?auto_25824 ) ) ( not ( = ?auto_25818 ?auto_25836 ) ) ( not ( = ?auto_25819 ?auto_25821 ) ) ( not ( = ?auto_25819 ?auto_25830 ) ) ( not ( = ?auto_25819 ?auto_25827 ) ) ( not ( = ?auto_25817 ?auto_25826 ) ) ( not ( = ?auto_25817 ?auto_25831 ) ) ( not ( = ?auto_25817 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25795 ) ) ( not ( = ?auto_25790 ?auto_25839 ) ) ( not ( = ?auto_25791 ?auto_25795 ) ) ( not ( = ?auto_25791 ?auto_25839 ) ) ( not ( = ?auto_25792 ?auto_25795 ) ) ( not ( = ?auto_25792 ?auto_25839 ) ) ( not ( = ?auto_25793 ?auto_25795 ) ) ( not ( = ?auto_25793 ?auto_25839 ) ) ( not ( = ?auto_25795 ?auto_25817 ) ) ( not ( = ?auto_25795 ?auto_25826 ) ) ( not ( = ?auto_25795 ?auto_25831 ) ) ( not ( = ?auto_25795 ?auto_25814 ) ) ( not ( = ?auto_25839 ?auto_25817 ) ) ( not ( = ?auto_25839 ?auto_25826 ) ) ( not ( = ?auto_25839 ?auto_25831 ) ) ( not ( = ?auto_25839 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25796 ) ) ( not ( = ?auto_25790 ?auto_25832 ) ) ( not ( = ?auto_25791 ?auto_25796 ) ) ( not ( = ?auto_25791 ?auto_25832 ) ) ( not ( = ?auto_25792 ?auto_25796 ) ) ( not ( = ?auto_25792 ?auto_25832 ) ) ( not ( = ?auto_25793 ?auto_25796 ) ) ( not ( = ?auto_25793 ?auto_25832 ) ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( not ( = ?auto_25794 ?auto_25832 ) ) ( not ( = ?auto_25796 ?auto_25839 ) ) ( not ( = ?auto_25796 ?auto_25817 ) ) ( not ( = ?auto_25796 ?auto_25826 ) ) ( not ( = ?auto_25796 ?auto_25831 ) ) ( not ( = ?auto_25796 ?auto_25814 ) ) ( not ( = ?auto_25837 ?auto_25833 ) ) ( not ( = ?auto_25837 ?auto_25818 ) ) ( not ( = ?auto_25837 ?auto_25824 ) ) ( not ( = ?auto_25837 ?auto_25836 ) ) ( not ( = ?auto_25823 ?auto_25821 ) ) ( not ( = ?auto_25823 ?auto_25819 ) ) ( not ( = ?auto_25823 ?auto_25830 ) ) ( not ( = ?auto_25823 ?auto_25827 ) ) ( not ( = ?auto_25832 ?auto_25839 ) ) ( not ( = ?auto_25832 ?auto_25817 ) ) ( not ( = ?auto_25832 ?auto_25826 ) ) ( not ( = ?auto_25832 ?auto_25831 ) ) ( not ( = ?auto_25832 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25797 ) ) ( not ( = ?auto_25790 ?auto_25838 ) ) ( not ( = ?auto_25791 ?auto_25797 ) ) ( not ( = ?auto_25791 ?auto_25838 ) ) ( not ( = ?auto_25792 ?auto_25797 ) ) ( not ( = ?auto_25792 ?auto_25838 ) ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25793 ?auto_25838 ) ) ( not ( = ?auto_25794 ?auto_25797 ) ) ( not ( = ?auto_25794 ?auto_25838 ) ) ( not ( = ?auto_25795 ?auto_25797 ) ) ( not ( = ?auto_25795 ?auto_25838 ) ) ( not ( = ?auto_25797 ?auto_25832 ) ) ( not ( = ?auto_25797 ?auto_25839 ) ) ( not ( = ?auto_25797 ?auto_25817 ) ) ( not ( = ?auto_25797 ?auto_25826 ) ) ( not ( = ?auto_25797 ?auto_25831 ) ) ( not ( = ?auto_25797 ?auto_25814 ) ) ( not ( = ?auto_25811 ?auto_25837 ) ) ( not ( = ?auto_25811 ?auto_25833 ) ) ( not ( = ?auto_25811 ?auto_25818 ) ) ( not ( = ?auto_25811 ?auto_25824 ) ) ( not ( = ?auto_25811 ?auto_25836 ) ) ( not ( = ?auto_25822 ?auto_25823 ) ) ( not ( = ?auto_25822 ?auto_25821 ) ) ( not ( = ?auto_25822 ?auto_25819 ) ) ( not ( = ?auto_25822 ?auto_25830 ) ) ( not ( = ?auto_25822 ?auto_25827 ) ) ( not ( = ?auto_25838 ?auto_25832 ) ) ( not ( = ?auto_25838 ?auto_25839 ) ) ( not ( = ?auto_25838 ?auto_25817 ) ) ( not ( = ?auto_25838 ?auto_25826 ) ) ( not ( = ?auto_25838 ?auto_25831 ) ) ( not ( = ?auto_25838 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25798 ) ) ( not ( = ?auto_25790 ?auto_25835 ) ) ( not ( = ?auto_25791 ?auto_25798 ) ) ( not ( = ?auto_25791 ?auto_25835 ) ) ( not ( = ?auto_25792 ?auto_25798 ) ) ( not ( = ?auto_25792 ?auto_25835 ) ) ( not ( = ?auto_25793 ?auto_25798 ) ) ( not ( = ?auto_25793 ?auto_25835 ) ) ( not ( = ?auto_25794 ?auto_25798 ) ) ( not ( = ?auto_25794 ?auto_25835 ) ) ( not ( = ?auto_25795 ?auto_25798 ) ) ( not ( = ?auto_25795 ?auto_25835 ) ) ( not ( = ?auto_25796 ?auto_25798 ) ) ( not ( = ?auto_25796 ?auto_25835 ) ) ( not ( = ?auto_25798 ?auto_25838 ) ) ( not ( = ?auto_25798 ?auto_25832 ) ) ( not ( = ?auto_25798 ?auto_25839 ) ) ( not ( = ?auto_25798 ?auto_25817 ) ) ( not ( = ?auto_25798 ?auto_25826 ) ) ( not ( = ?auto_25798 ?auto_25831 ) ) ( not ( = ?auto_25798 ?auto_25814 ) ) ( not ( = ?auto_25825 ?auto_25811 ) ) ( not ( = ?auto_25825 ?auto_25837 ) ) ( not ( = ?auto_25825 ?auto_25833 ) ) ( not ( = ?auto_25825 ?auto_25818 ) ) ( not ( = ?auto_25825 ?auto_25824 ) ) ( not ( = ?auto_25825 ?auto_25836 ) ) ( not ( = ?auto_25820 ?auto_25822 ) ) ( not ( = ?auto_25820 ?auto_25823 ) ) ( not ( = ?auto_25820 ?auto_25821 ) ) ( not ( = ?auto_25820 ?auto_25819 ) ) ( not ( = ?auto_25820 ?auto_25830 ) ) ( not ( = ?auto_25820 ?auto_25827 ) ) ( not ( = ?auto_25835 ?auto_25838 ) ) ( not ( = ?auto_25835 ?auto_25832 ) ) ( not ( = ?auto_25835 ?auto_25839 ) ) ( not ( = ?auto_25835 ?auto_25817 ) ) ( not ( = ?auto_25835 ?auto_25826 ) ) ( not ( = ?auto_25835 ?auto_25831 ) ) ( not ( = ?auto_25835 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25799 ) ) ( not ( = ?auto_25790 ?auto_25834 ) ) ( not ( = ?auto_25791 ?auto_25799 ) ) ( not ( = ?auto_25791 ?auto_25834 ) ) ( not ( = ?auto_25792 ?auto_25799 ) ) ( not ( = ?auto_25792 ?auto_25834 ) ) ( not ( = ?auto_25793 ?auto_25799 ) ) ( not ( = ?auto_25793 ?auto_25834 ) ) ( not ( = ?auto_25794 ?auto_25799 ) ) ( not ( = ?auto_25794 ?auto_25834 ) ) ( not ( = ?auto_25795 ?auto_25799 ) ) ( not ( = ?auto_25795 ?auto_25834 ) ) ( not ( = ?auto_25796 ?auto_25799 ) ) ( not ( = ?auto_25796 ?auto_25834 ) ) ( not ( = ?auto_25797 ?auto_25799 ) ) ( not ( = ?auto_25797 ?auto_25834 ) ) ( not ( = ?auto_25799 ?auto_25835 ) ) ( not ( = ?auto_25799 ?auto_25838 ) ) ( not ( = ?auto_25799 ?auto_25832 ) ) ( not ( = ?auto_25799 ?auto_25839 ) ) ( not ( = ?auto_25799 ?auto_25817 ) ) ( not ( = ?auto_25799 ?auto_25826 ) ) ( not ( = ?auto_25799 ?auto_25831 ) ) ( not ( = ?auto_25799 ?auto_25814 ) ) ( not ( = ?auto_25828 ?auto_25825 ) ) ( not ( = ?auto_25828 ?auto_25811 ) ) ( not ( = ?auto_25828 ?auto_25837 ) ) ( not ( = ?auto_25828 ?auto_25833 ) ) ( not ( = ?auto_25828 ?auto_25818 ) ) ( not ( = ?auto_25828 ?auto_25824 ) ) ( not ( = ?auto_25828 ?auto_25836 ) ) ( not ( = ?auto_25816 ?auto_25820 ) ) ( not ( = ?auto_25816 ?auto_25822 ) ) ( not ( = ?auto_25816 ?auto_25823 ) ) ( not ( = ?auto_25816 ?auto_25821 ) ) ( not ( = ?auto_25816 ?auto_25819 ) ) ( not ( = ?auto_25816 ?auto_25830 ) ) ( not ( = ?auto_25816 ?auto_25827 ) ) ( not ( = ?auto_25834 ?auto_25835 ) ) ( not ( = ?auto_25834 ?auto_25838 ) ) ( not ( = ?auto_25834 ?auto_25832 ) ) ( not ( = ?auto_25834 ?auto_25839 ) ) ( not ( = ?auto_25834 ?auto_25817 ) ) ( not ( = ?auto_25834 ?auto_25826 ) ) ( not ( = ?auto_25834 ?auto_25831 ) ) ( not ( = ?auto_25834 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25800 ) ) ( not ( = ?auto_25790 ?auto_25829 ) ) ( not ( = ?auto_25791 ?auto_25800 ) ) ( not ( = ?auto_25791 ?auto_25829 ) ) ( not ( = ?auto_25792 ?auto_25800 ) ) ( not ( = ?auto_25792 ?auto_25829 ) ) ( not ( = ?auto_25793 ?auto_25800 ) ) ( not ( = ?auto_25793 ?auto_25829 ) ) ( not ( = ?auto_25794 ?auto_25800 ) ) ( not ( = ?auto_25794 ?auto_25829 ) ) ( not ( = ?auto_25795 ?auto_25800 ) ) ( not ( = ?auto_25795 ?auto_25829 ) ) ( not ( = ?auto_25796 ?auto_25800 ) ) ( not ( = ?auto_25796 ?auto_25829 ) ) ( not ( = ?auto_25797 ?auto_25800 ) ) ( not ( = ?auto_25797 ?auto_25829 ) ) ( not ( = ?auto_25798 ?auto_25800 ) ) ( not ( = ?auto_25798 ?auto_25829 ) ) ( not ( = ?auto_25800 ?auto_25834 ) ) ( not ( = ?auto_25800 ?auto_25835 ) ) ( not ( = ?auto_25800 ?auto_25838 ) ) ( not ( = ?auto_25800 ?auto_25832 ) ) ( not ( = ?auto_25800 ?auto_25839 ) ) ( not ( = ?auto_25800 ?auto_25817 ) ) ( not ( = ?auto_25800 ?auto_25826 ) ) ( not ( = ?auto_25800 ?auto_25831 ) ) ( not ( = ?auto_25800 ?auto_25814 ) ) ( not ( = ?auto_25815 ?auto_25828 ) ) ( not ( = ?auto_25815 ?auto_25825 ) ) ( not ( = ?auto_25815 ?auto_25811 ) ) ( not ( = ?auto_25815 ?auto_25837 ) ) ( not ( = ?auto_25815 ?auto_25833 ) ) ( not ( = ?auto_25815 ?auto_25818 ) ) ( not ( = ?auto_25815 ?auto_25824 ) ) ( not ( = ?auto_25815 ?auto_25836 ) ) ( not ( = ?auto_25812 ?auto_25816 ) ) ( not ( = ?auto_25812 ?auto_25820 ) ) ( not ( = ?auto_25812 ?auto_25822 ) ) ( not ( = ?auto_25812 ?auto_25823 ) ) ( not ( = ?auto_25812 ?auto_25821 ) ) ( not ( = ?auto_25812 ?auto_25819 ) ) ( not ( = ?auto_25812 ?auto_25830 ) ) ( not ( = ?auto_25812 ?auto_25827 ) ) ( not ( = ?auto_25829 ?auto_25834 ) ) ( not ( = ?auto_25829 ?auto_25835 ) ) ( not ( = ?auto_25829 ?auto_25838 ) ) ( not ( = ?auto_25829 ?auto_25832 ) ) ( not ( = ?auto_25829 ?auto_25839 ) ) ( not ( = ?auto_25829 ?auto_25817 ) ) ( not ( = ?auto_25829 ?auto_25826 ) ) ( not ( = ?auto_25829 ?auto_25831 ) ) ( not ( = ?auto_25829 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25801 ) ) ( not ( = ?auto_25790 ?auto_25813 ) ) ( not ( = ?auto_25791 ?auto_25801 ) ) ( not ( = ?auto_25791 ?auto_25813 ) ) ( not ( = ?auto_25792 ?auto_25801 ) ) ( not ( = ?auto_25792 ?auto_25813 ) ) ( not ( = ?auto_25793 ?auto_25801 ) ) ( not ( = ?auto_25793 ?auto_25813 ) ) ( not ( = ?auto_25794 ?auto_25801 ) ) ( not ( = ?auto_25794 ?auto_25813 ) ) ( not ( = ?auto_25795 ?auto_25801 ) ) ( not ( = ?auto_25795 ?auto_25813 ) ) ( not ( = ?auto_25796 ?auto_25801 ) ) ( not ( = ?auto_25796 ?auto_25813 ) ) ( not ( = ?auto_25797 ?auto_25801 ) ) ( not ( = ?auto_25797 ?auto_25813 ) ) ( not ( = ?auto_25798 ?auto_25801 ) ) ( not ( = ?auto_25798 ?auto_25813 ) ) ( not ( = ?auto_25799 ?auto_25801 ) ) ( not ( = ?auto_25799 ?auto_25813 ) ) ( not ( = ?auto_25801 ?auto_25829 ) ) ( not ( = ?auto_25801 ?auto_25834 ) ) ( not ( = ?auto_25801 ?auto_25835 ) ) ( not ( = ?auto_25801 ?auto_25838 ) ) ( not ( = ?auto_25801 ?auto_25832 ) ) ( not ( = ?auto_25801 ?auto_25839 ) ) ( not ( = ?auto_25801 ?auto_25817 ) ) ( not ( = ?auto_25801 ?auto_25826 ) ) ( not ( = ?auto_25801 ?auto_25831 ) ) ( not ( = ?auto_25801 ?auto_25814 ) ) ( not ( = ?auto_25809 ?auto_25815 ) ) ( not ( = ?auto_25809 ?auto_25828 ) ) ( not ( = ?auto_25809 ?auto_25825 ) ) ( not ( = ?auto_25809 ?auto_25811 ) ) ( not ( = ?auto_25809 ?auto_25837 ) ) ( not ( = ?auto_25809 ?auto_25833 ) ) ( not ( = ?auto_25809 ?auto_25818 ) ) ( not ( = ?auto_25809 ?auto_25824 ) ) ( not ( = ?auto_25809 ?auto_25836 ) ) ( not ( = ?auto_25810 ?auto_25812 ) ) ( not ( = ?auto_25810 ?auto_25816 ) ) ( not ( = ?auto_25810 ?auto_25820 ) ) ( not ( = ?auto_25810 ?auto_25822 ) ) ( not ( = ?auto_25810 ?auto_25823 ) ) ( not ( = ?auto_25810 ?auto_25821 ) ) ( not ( = ?auto_25810 ?auto_25819 ) ) ( not ( = ?auto_25810 ?auto_25830 ) ) ( not ( = ?auto_25810 ?auto_25827 ) ) ( not ( = ?auto_25813 ?auto_25829 ) ) ( not ( = ?auto_25813 ?auto_25834 ) ) ( not ( = ?auto_25813 ?auto_25835 ) ) ( not ( = ?auto_25813 ?auto_25838 ) ) ( not ( = ?auto_25813 ?auto_25832 ) ) ( not ( = ?auto_25813 ?auto_25839 ) ) ( not ( = ?auto_25813 ?auto_25817 ) ) ( not ( = ?auto_25813 ?auto_25826 ) ) ( not ( = ?auto_25813 ?auto_25831 ) ) ( not ( = ?auto_25813 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25802 ) ) ( not ( = ?auto_25790 ?auto_25804 ) ) ( not ( = ?auto_25791 ?auto_25802 ) ) ( not ( = ?auto_25791 ?auto_25804 ) ) ( not ( = ?auto_25792 ?auto_25802 ) ) ( not ( = ?auto_25792 ?auto_25804 ) ) ( not ( = ?auto_25793 ?auto_25802 ) ) ( not ( = ?auto_25793 ?auto_25804 ) ) ( not ( = ?auto_25794 ?auto_25802 ) ) ( not ( = ?auto_25794 ?auto_25804 ) ) ( not ( = ?auto_25795 ?auto_25802 ) ) ( not ( = ?auto_25795 ?auto_25804 ) ) ( not ( = ?auto_25796 ?auto_25802 ) ) ( not ( = ?auto_25796 ?auto_25804 ) ) ( not ( = ?auto_25797 ?auto_25802 ) ) ( not ( = ?auto_25797 ?auto_25804 ) ) ( not ( = ?auto_25798 ?auto_25802 ) ) ( not ( = ?auto_25798 ?auto_25804 ) ) ( not ( = ?auto_25799 ?auto_25802 ) ) ( not ( = ?auto_25799 ?auto_25804 ) ) ( not ( = ?auto_25800 ?auto_25802 ) ) ( not ( = ?auto_25800 ?auto_25804 ) ) ( not ( = ?auto_25802 ?auto_25813 ) ) ( not ( = ?auto_25802 ?auto_25829 ) ) ( not ( = ?auto_25802 ?auto_25834 ) ) ( not ( = ?auto_25802 ?auto_25835 ) ) ( not ( = ?auto_25802 ?auto_25838 ) ) ( not ( = ?auto_25802 ?auto_25832 ) ) ( not ( = ?auto_25802 ?auto_25839 ) ) ( not ( = ?auto_25802 ?auto_25817 ) ) ( not ( = ?auto_25802 ?auto_25826 ) ) ( not ( = ?auto_25802 ?auto_25831 ) ) ( not ( = ?auto_25802 ?auto_25814 ) ) ( not ( = ?auto_25807 ?auto_25809 ) ) ( not ( = ?auto_25807 ?auto_25815 ) ) ( not ( = ?auto_25807 ?auto_25828 ) ) ( not ( = ?auto_25807 ?auto_25825 ) ) ( not ( = ?auto_25807 ?auto_25811 ) ) ( not ( = ?auto_25807 ?auto_25837 ) ) ( not ( = ?auto_25807 ?auto_25833 ) ) ( not ( = ?auto_25807 ?auto_25818 ) ) ( not ( = ?auto_25807 ?auto_25824 ) ) ( not ( = ?auto_25807 ?auto_25836 ) ) ( not ( = ?auto_25805 ?auto_25810 ) ) ( not ( = ?auto_25805 ?auto_25812 ) ) ( not ( = ?auto_25805 ?auto_25816 ) ) ( not ( = ?auto_25805 ?auto_25820 ) ) ( not ( = ?auto_25805 ?auto_25822 ) ) ( not ( = ?auto_25805 ?auto_25823 ) ) ( not ( = ?auto_25805 ?auto_25821 ) ) ( not ( = ?auto_25805 ?auto_25819 ) ) ( not ( = ?auto_25805 ?auto_25830 ) ) ( not ( = ?auto_25805 ?auto_25827 ) ) ( not ( = ?auto_25804 ?auto_25813 ) ) ( not ( = ?auto_25804 ?auto_25829 ) ) ( not ( = ?auto_25804 ?auto_25834 ) ) ( not ( = ?auto_25804 ?auto_25835 ) ) ( not ( = ?auto_25804 ?auto_25838 ) ) ( not ( = ?auto_25804 ?auto_25832 ) ) ( not ( = ?auto_25804 ?auto_25839 ) ) ( not ( = ?auto_25804 ?auto_25817 ) ) ( not ( = ?auto_25804 ?auto_25826 ) ) ( not ( = ?auto_25804 ?auto_25831 ) ) ( not ( = ?auto_25804 ?auto_25814 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25796 ?auto_25797 ?auto_25798 ?auto_25799 ?auto_25800 ?auto_25801 )
      ( MAKE-1CRATE ?auto_25801 ?auto_25802 )
      ( MAKE-12CRATE-VERIFY ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25796 ?auto_25797 ?auto_25798 ?auto_25799 ?auto_25800 ?auto_25801 ?auto_25802 ) )
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
      ?auto_25870 - SURFACE
      ?auto_25871 - SURFACE
      ?auto_25872 - SURFACE
      ?auto_25873 - SURFACE
      ?auto_25874 - SURFACE
      ?auto_25875 - SURFACE
      ?auto_25876 - SURFACE
      ?auto_25877 - SURFACE
    )
    :vars
    (
      ?auto_25882 - HOIST
      ?auto_25883 - PLACE
      ?auto_25880 - PLACE
      ?auto_25879 - HOIST
      ?auto_25878 - SURFACE
      ?auto_25892 - PLACE
      ?auto_25894 - HOIST
      ?auto_25913 - SURFACE
      ?auto_25899 - PLACE
      ?auto_25907 - HOIST
      ?auto_25887 - SURFACE
      ?auto_25909 - PLACE
      ?auto_25911 - HOIST
      ?auto_25904 - SURFACE
      ?auto_25897 - PLACE
      ?auto_25906 - HOIST
      ?auto_25916 - SURFACE
      ?auto_25914 - PLACE
      ?auto_25902 - HOIST
      ?auto_25898 - SURFACE
      ?auto_25888 - PLACE
      ?auto_25884 - HOIST
      ?auto_25886 - SURFACE
      ?auto_25901 - PLACE
      ?auto_25895 - HOIST
      ?auto_25891 - SURFACE
      ?auto_25893 - PLACE
      ?auto_25915 - HOIST
      ?auto_25885 - SURFACE
      ?auto_25890 - PLACE
      ?auto_25900 - HOIST
      ?auto_25905 - SURFACE
      ?auto_25917 - SURFACE
      ?auto_25903 - PLACE
      ?auto_25910 - HOIST
      ?auto_25896 - SURFACE
      ?auto_25908 - PLACE
      ?auto_25912 - HOIST
      ?auto_25889 - SURFACE
      ?auto_25881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25882 ?auto_25883 ) ( IS-CRATE ?auto_25877 ) ( not ( = ?auto_25880 ?auto_25883 ) ) ( HOIST-AT ?auto_25879 ?auto_25880 ) ( AVAILABLE ?auto_25879 ) ( SURFACE-AT ?auto_25877 ?auto_25880 ) ( ON ?auto_25877 ?auto_25878 ) ( CLEAR ?auto_25877 ) ( not ( = ?auto_25876 ?auto_25877 ) ) ( not ( = ?auto_25876 ?auto_25878 ) ) ( not ( = ?auto_25877 ?auto_25878 ) ) ( not ( = ?auto_25882 ?auto_25879 ) ) ( IS-CRATE ?auto_25876 ) ( not ( = ?auto_25892 ?auto_25883 ) ) ( HOIST-AT ?auto_25894 ?auto_25892 ) ( AVAILABLE ?auto_25894 ) ( SURFACE-AT ?auto_25876 ?auto_25892 ) ( ON ?auto_25876 ?auto_25913 ) ( CLEAR ?auto_25876 ) ( not ( = ?auto_25875 ?auto_25876 ) ) ( not ( = ?auto_25875 ?auto_25913 ) ) ( not ( = ?auto_25876 ?auto_25913 ) ) ( not ( = ?auto_25882 ?auto_25894 ) ) ( IS-CRATE ?auto_25875 ) ( not ( = ?auto_25899 ?auto_25883 ) ) ( HOIST-AT ?auto_25907 ?auto_25899 ) ( AVAILABLE ?auto_25907 ) ( SURFACE-AT ?auto_25875 ?auto_25899 ) ( ON ?auto_25875 ?auto_25887 ) ( CLEAR ?auto_25875 ) ( not ( = ?auto_25874 ?auto_25875 ) ) ( not ( = ?auto_25874 ?auto_25887 ) ) ( not ( = ?auto_25875 ?auto_25887 ) ) ( not ( = ?auto_25882 ?auto_25907 ) ) ( IS-CRATE ?auto_25874 ) ( not ( = ?auto_25909 ?auto_25883 ) ) ( HOIST-AT ?auto_25911 ?auto_25909 ) ( AVAILABLE ?auto_25911 ) ( SURFACE-AT ?auto_25874 ?auto_25909 ) ( ON ?auto_25874 ?auto_25904 ) ( CLEAR ?auto_25874 ) ( not ( = ?auto_25873 ?auto_25874 ) ) ( not ( = ?auto_25873 ?auto_25904 ) ) ( not ( = ?auto_25874 ?auto_25904 ) ) ( not ( = ?auto_25882 ?auto_25911 ) ) ( IS-CRATE ?auto_25873 ) ( not ( = ?auto_25897 ?auto_25883 ) ) ( HOIST-AT ?auto_25906 ?auto_25897 ) ( AVAILABLE ?auto_25906 ) ( SURFACE-AT ?auto_25873 ?auto_25897 ) ( ON ?auto_25873 ?auto_25916 ) ( CLEAR ?auto_25873 ) ( not ( = ?auto_25872 ?auto_25873 ) ) ( not ( = ?auto_25872 ?auto_25916 ) ) ( not ( = ?auto_25873 ?auto_25916 ) ) ( not ( = ?auto_25882 ?auto_25906 ) ) ( IS-CRATE ?auto_25872 ) ( not ( = ?auto_25914 ?auto_25883 ) ) ( HOIST-AT ?auto_25902 ?auto_25914 ) ( AVAILABLE ?auto_25902 ) ( SURFACE-AT ?auto_25872 ?auto_25914 ) ( ON ?auto_25872 ?auto_25898 ) ( CLEAR ?auto_25872 ) ( not ( = ?auto_25871 ?auto_25872 ) ) ( not ( = ?auto_25871 ?auto_25898 ) ) ( not ( = ?auto_25872 ?auto_25898 ) ) ( not ( = ?auto_25882 ?auto_25902 ) ) ( IS-CRATE ?auto_25871 ) ( not ( = ?auto_25888 ?auto_25883 ) ) ( HOIST-AT ?auto_25884 ?auto_25888 ) ( AVAILABLE ?auto_25884 ) ( SURFACE-AT ?auto_25871 ?auto_25888 ) ( ON ?auto_25871 ?auto_25886 ) ( CLEAR ?auto_25871 ) ( not ( = ?auto_25870 ?auto_25871 ) ) ( not ( = ?auto_25870 ?auto_25886 ) ) ( not ( = ?auto_25871 ?auto_25886 ) ) ( not ( = ?auto_25882 ?auto_25884 ) ) ( IS-CRATE ?auto_25870 ) ( not ( = ?auto_25901 ?auto_25883 ) ) ( HOIST-AT ?auto_25895 ?auto_25901 ) ( AVAILABLE ?auto_25895 ) ( SURFACE-AT ?auto_25870 ?auto_25901 ) ( ON ?auto_25870 ?auto_25891 ) ( CLEAR ?auto_25870 ) ( not ( = ?auto_25869 ?auto_25870 ) ) ( not ( = ?auto_25869 ?auto_25891 ) ) ( not ( = ?auto_25870 ?auto_25891 ) ) ( not ( = ?auto_25882 ?auto_25895 ) ) ( IS-CRATE ?auto_25869 ) ( not ( = ?auto_25893 ?auto_25883 ) ) ( HOIST-AT ?auto_25915 ?auto_25893 ) ( SURFACE-AT ?auto_25869 ?auto_25893 ) ( ON ?auto_25869 ?auto_25885 ) ( CLEAR ?auto_25869 ) ( not ( = ?auto_25868 ?auto_25869 ) ) ( not ( = ?auto_25868 ?auto_25885 ) ) ( not ( = ?auto_25869 ?auto_25885 ) ) ( not ( = ?auto_25882 ?auto_25915 ) ) ( IS-CRATE ?auto_25868 ) ( not ( = ?auto_25890 ?auto_25883 ) ) ( HOIST-AT ?auto_25900 ?auto_25890 ) ( AVAILABLE ?auto_25900 ) ( SURFACE-AT ?auto_25868 ?auto_25890 ) ( ON ?auto_25868 ?auto_25905 ) ( CLEAR ?auto_25868 ) ( not ( = ?auto_25867 ?auto_25868 ) ) ( not ( = ?auto_25867 ?auto_25905 ) ) ( not ( = ?auto_25868 ?auto_25905 ) ) ( not ( = ?auto_25882 ?auto_25900 ) ) ( IS-CRATE ?auto_25867 ) ( AVAILABLE ?auto_25915 ) ( SURFACE-AT ?auto_25867 ?auto_25893 ) ( ON ?auto_25867 ?auto_25917 ) ( CLEAR ?auto_25867 ) ( not ( = ?auto_25866 ?auto_25867 ) ) ( not ( = ?auto_25866 ?auto_25917 ) ) ( not ( = ?auto_25867 ?auto_25917 ) ) ( IS-CRATE ?auto_25866 ) ( not ( = ?auto_25903 ?auto_25883 ) ) ( HOIST-AT ?auto_25910 ?auto_25903 ) ( AVAILABLE ?auto_25910 ) ( SURFACE-AT ?auto_25866 ?auto_25903 ) ( ON ?auto_25866 ?auto_25896 ) ( CLEAR ?auto_25866 ) ( not ( = ?auto_25865 ?auto_25866 ) ) ( not ( = ?auto_25865 ?auto_25896 ) ) ( not ( = ?auto_25866 ?auto_25896 ) ) ( not ( = ?auto_25882 ?auto_25910 ) ) ( SURFACE-AT ?auto_25864 ?auto_25883 ) ( CLEAR ?auto_25864 ) ( IS-CRATE ?auto_25865 ) ( AVAILABLE ?auto_25882 ) ( not ( = ?auto_25908 ?auto_25883 ) ) ( HOIST-AT ?auto_25912 ?auto_25908 ) ( AVAILABLE ?auto_25912 ) ( SURFACE-AT ?auto_25865 ?auto_25908 ) ( ON ?auto_25865 ?auto_25889 ) ( CLEAR ?auto_25865 ) ( TRUCK-AT ?auto_25881 ?auto_25883 ) ( not ( = ?auto_25864 ?auto_25865 ) ) ( not ( = ?auto_25864 ?auto_25889 ) ) ( not ( = ?auto_25865 ?auto_25889 ) ) ( not ( = ?auto_25882 ?auto_25912 ) ) ( not ( = ?auto_25864 ?auto_25866 ) ) ( not ( = ?auto_25864 ?auto_25896 ) ) ( not ( = ?auto_25866 ?auto_25889 ) ) ( not ( = ?auto_25903 ?auto_25908 ) ) ( not ( = ?auto_25910 ?auto_25912 ) ) ( not ( = ?auto_25896 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25867 ) ) ( not ( = ?auto_25864 ?auto_25917 ) ) ( not ( = ?auto_25865 ?auto_25867 ) ) ( not ( = ?auto_25865 ?auto_25917 ) ) ( not ( = ?auto_25867 ?auto_25896 ) ) ( not ( = ?auto_25867 ?auto_25889 ) ) ( not ( = ?auto_25893 ?auto_25903 ) ) ( not ( = ?auto_25893 ?auto_25908 ) ) ( not ( = ?auto_25915 ?auto_25910 ) ) ( not ( = ?auto_25915 ?auto_25912 ) ) ( not ( = ?auto_25917 ?auto_25896 ) ) ( not ( = ?auto_25917 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25868 ) ) ( not ( = ?auto_25864 ?auto_25905 ) ) ( not ( = ?auto_25865 ?auto_25868 ) ) ( not ( = ?auto_25865 ?auto_25905 ) ) ( not ( = ?auto_25866 ?auto_25868 ) ) ( not ( = ?auto_25866 ?auto_25905 ) ) ( not ( = ?auto_25868 ?auto_25917 ) ) ( not ( = ?auto_25868 ?auto_25896 ) ) ( not ( = ?auto_25868 ?auto_25889 ) ) ( not ( = ?auto_25890 ?auto_25893 ) ) ( not ( = ?auto_25890 ?auto_25903 ) ) ( not ( = ?auto_25890 ?auto_25908 ) ) ( not ( = ?auto_25900 ?auto_25915 ) ) ( not ( = ?auto_25900 ?auto_25910 ) ) ( not ( = ?auto_25900 ?auto_25912 ) ) ( not ( = ?auto_25905 ?auto_25917 ) ) ( not ( = ?auto_25905 ?auto_25896 ) ) ( not ( = ?auto_25905 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25869 ) ) ( not ( = ?auto_25864 ?auto_25885 ) ) ( not ( = ?auto_25865 ?auto_25869 ) ) ( not ( = ?auto_25865 ?auto_25885 ) ) ( not ( = ?auto_25866 ?auto_25869 ) ) ( not ( = ?auto_25866 ?auto_25885 ) ) ( not ( = ?auto_25867 ?auto_25869 ) ) ( not ( = ?auto_25867 ?auto_25885 ) ) ( not ( = ?auto_25869 ?auto_25905 ) ) ( not ( = ?auto_25869 ?auto_25917 ) ) ( not ( = ?auto_25869 ?auto_25896 ) ) ( not ( = ?auto_25869 ?auto_25889 ) ) ( not ( = ?auto_25885 ?auto_25905 ) ) ( not ( = ?auto_25885 ?auto_25917 ) ) ( not ( = ?auto_25885 ?auto_25896 ) ) ( not ( = ?auto_25885 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25870 ) ) ( not ( = ?auto_25864 ?auto_25891 ) ) ( not ( = ?auto_25865 ?auto_25870 ) ) ( not ( = ?auto_25865 ?auto_25891 ) ) ( not ( = ?auto_25866 ?auto_25870 ) ) ( not ( = ?auto_25866 ?auto_25891 ) ) ( not ( = ?auto_25867 ?auto_25870 ) ) ( not ( = ?auto_25867 ?auto_25891 ) ) ( not ( = ?auto_25868 ?auto_25870 ) ) ( not ( = ?auto_25868 ?auto_25891 ) ) ( not ( = ?auto_25870 ?auto_25885 ) ) ( not ( = ?auto_25870 ?auto_25905 ) ) ( not ( = ?auto_25870 ?auto_25917 ) ) ( not ( = ?auto_25870 ?auto_25896 ) ) ( not ( = ?auto_25870 ?auto_25889 ) ) ( not ( = ?auto_25901 ?auto_25893 ) ) ( not ( = ?auto_25901 ?auto_25890 ) ) ( not ( = ?auto_25901 ?auto_25903 ) ) ( not ( = ?auto_25901 ?auto_25908 ) ) ( not ( = ?auto_25895 ?auto_25915 ) ) ( not ( = ?auto_25895 ?auto_25900 ) ) ( not ( = ?auto_25895 ?auto_25910 ) ) ( not ( = ?auto_25895 ?auto_25912 ) ) ( not ( = ?auto_25891 ?auto_25885 ) ) ( not ( = ?auto_25891 ?auto_25905 ) ) ( not ( = ?auto_25891 ?auto_25917 ) ) ( not ( = ?auto_25891 ?auto_25896 ) ) ( not ( = ?auto_25891 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25871 ) ) ( not ( = ?auto_25864 ?auto_25886 ) ) ( not ( = ?auto_25865 ?auto_25871 ) ) ( not ( = ?auto_25865 ?auto_25886 ) ) ( not ( = ?auto_25866 ?auto_25871 ) ) ( not ( = ?auto_25866 ?auto_25886 ) ) ( not ( = ?auto_25867 ?auto_25871 ) ) ( not ( = ?auto_25867 ?auto_25886 ) ) ( not ( = ?auto_25868 ?auto_25871 ) ) ( not ( = ?auto_25868 ?auto_25886 ) ) ( not ( = ?auto_25869 ?auto_25871 ) ) ( not ( = ?auto_25869 ?auto_25886 ) ) ( not ( = ?auto_25871 ?auto_25891 ) ) ( not ( = ?auto_25871 ?auto_25885 ) ) ( not ( = ?auto_25871 ?auto_25905 ) ) ( not ( = ?auto_25871 ?auto_25917 ) ) ( not ( = ?auto_25871 ?auto_25896 ) ) ( not ( = ?auto_25871 ?auto_25889 ) ) ( not ( = ?auto_25888 ?auto_25901 ) ) ( not ( = ?auto_25888 ?auto_25893 ) ) ( not ( = ?auto_25888 ?auto_25890 ) ) ( not ( = ?auto_25888 ?auto_25903 ) ) ( not ( = ?auto_25888 ?auto_25908 ) ) ( not ( = ?auto_25884 ?auto_25895 ) ) ( not ( = ?auto_25884 ?auto_25915 ) ) ( not ( = ?auto_25884 ?auto_25900 ) ) ( not ( = ?auto_25884 ?auto_25910 ) ) ( not ( = ?auto_25884 ?auto_25912 ) ) ( not ( = ?auto_25886 ?auto_25891 ) ) ( not ( = ?auto_25886 ?auto_25885 ) ) ( not ( = ?auto_25886 ?auto_25905 ) ) ( not ( = ?auto_25886 ?auto_25917 ) ) ( not ( = ?auto_25886 ?auto_25896 ) ) ( not ( = ?auto_25886 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25872 ) ) ( not ( = ?auto_25864 ?auto_25898 ) ) ( not ( = ?auto_25865 ?auto_25872 ) ) ( not ( = ?auto_25865 ?auto_25898 ) ) ( not ( = ?auto_25866 ?auto_25872 ) ) ( not ( = ?auto_25866 ?auto_25898 ) ) ( not ( = ?auto_25867 ?auto_25872 ) ) ( not ( = ?auto_25867 ?auto_25898 ) ) ( not ( = ?auto_25868 ?auto_25872 ) ) ( not ( = ?auto_25868 ?auto_25898 ) ) ( not ( = ?auto_25869 ?auto_25872 ) ) ( not ( = ?auto_25869 ?auto_25898 ) ) ( not ( = ?auto_25870 ?auto_25872 ) ) ( not ( = ?auto_25870 ?auto_25898 ) ) ( not ( = ?auto_25872 ?auto_25886 ) ) ( not ( = ?auto_25872 ?auto_25891 ) ) ( not ( = ?auto_25872 ?auto_25885 ) ) ( not ( = ?auto_25872 ?auto_25905 ) ) ( not ( = ?auto_25872 ?auto_25917 ) ) ( not ( = ?auto_25872 ?auto_25896 ) ) ( not ( = ?auto_25872 ?auto_25889 ) ) ( not ( = ?auto_25914 ?auto_25888 ) ) ( not ( = ?auto_25914 ?auto_25901 ) ) ( not ( = ?auto_25914 ?auto_25893 ) ) ( not ( = ?auto_25914 ?auto_25890 ) ) ( not ( = ?auto_25914 ?auto_25903 ) ) ( not ( = ?auto_25914 ?auto_25908 ) ) ( not ( = ?auto_25902 ?auto_25884 ) ) ( not ( = ?auto_25902 ?auto_25895 ) ) ( not ( = ?auto_25902 ?auto_25915 ) ) ( not ( = ?auto_25902 ?auto_25900 ) ) ( not ( = ?auto_25902 ?auto_25910 ) ) ( not ( = ?auto_25902 ?auto_25912 ) ) ( not ( = ?auto_25898 ?auto_25886 ) ) ( not ( = ?auto_25898 ?auto_25891 ) ) ( not ( = ?auto_25898 ?auto_25885 ) ) ( not ( = ?auto_25898 ?auto_25905 ) ) ( not ( = ?auto_25898 ?auto_25917 ) ) ( not ( = ?auto_25898 ?auto_25896 ) ) ( not ( = ?auto_25898 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25873 ) ) ( not ( = ?auto_25864 ?auto_25916 ) ) ( not ( = ?auto_25865 ?auto_25873 ) ) ( not ( = ?auto_25865 ?auto_25916 ) ) ( not ( = ?auto_25866 ?auto_25873 ) ) ( not ( = ?auto_25866 ?auto_25916 ) ) ( not ( = ?auto_25867 ?auto_25873 ) ) ( not ( = ?auto_25867 ?auto_25916 ) ) ( not ( = ?auto_25868 ?auto_25873 ) ) ( not ( = ?auto_25868 ?auto_25916 ) ) ( not ( = ?auto_25869 ?auto_25873 ) ) ( not ( = ?auto_25869 ?auto_25916 ) ) ( not ( = ?auto_25870 ?auto_25873 ) ) ( not ( = ?auto_25870 ?auto_25916 ) ) ( not ( = ?auto_25871 ?auto_25873 ) ) ( not ( = ?auto_25871 ?auto_25916 ) ) ( not ( = ?auto_25873 ?auto_25898 ) ) ( not ( = ?auto_25873 ?auto_25886 ) ) ( not ( = ?auto_25873 ?auto_25891 ) ) ( not ( = ?auto_25873 ?auto_25885 ) ) ( not ( = ?auto_25873 ?auto_25905 ) ) ( not ( = ?auto_25873 ?auto_25917 ) ) ( not ( = ?auto_25873 ?auto_25896 ) ) ( not ( = ?auto_25873 ?auto_25889 ) ) ( not ( = ?auto_25897 ?auto_25914 ) ) ( not ( = ?auto_25897 ?auto_25888 ) ) ( not ( = ?auto_25897 ?auto_25901 ) ) ( not ( = ?auto_25897 ?auto_25893 ) ) ( not ( = ?auto_25897 ?auto_25890 ) ) ( not ( = ?auto_25897 ?auto_25903 ) ) ( not ( = ?auto_25897 ?auto_25908 ) ) ( not ( = ?auto_25906 ?auto_25902 ) ) ( not ( = ?auto_25906 ?auto_25884 ) ) ( not ( = ?auto_25906 ?auto_25895 ) ) ( not ( = ?auto_25906 ?auto_25915 ) ) ( not ( = ?auto_25906 ?auto_25900 ) ) ( not ( = ?auto_25906 ?auto_25910 ) ) ( not ( = ?auto_25906 ?auto_25912 ) ) ( not ( = ?auto_25916 ?auto_25898 ) ) ( not ( = ?auto_25916 ?auto_25886 ) ) ( not ( = ?auto_25916 ?auto_25891 ) ) ( not ( = ?auto_25916 ?auto_25885 ) ) ( not ( = ?auto_25916 ?auto_25905 ) ) ( not ( = ?auto_25916 ?auto_25917 ) ) ( not ( = ?auto_25916 ?auto_25896 ) ) ( not ( = ?auto_25916 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25874 ) ) ( not ( = ?auto_25864 ?auto_25904 ) ) ( not ( = ?auto_25865 ?auto_25874 ) ) ( not ( = ?auto_25865 ?auto_25904 ) ) ( not ( = ?auto_25866 ?auto_25874 ) ) ( not ( = ?auto_25866 ?auto_25904 ) ) ( not ( = ?auto_25867 ?auto_25874 ) ) ( not ( = ?auto_25867 ?auto_25904 ) ) ( not ( = ?auto_25868 ?auto_25874 ) ) ( not ( = ?auto_25868 ?auto_25904 ) ) ( not ( = ?auto_25869 ?auto_25874 ) ) ( not ( = ?auto_25869 ?auto_25904 ) ) ( not ( = ?auto_25870 ?auto_25874 ) ) ( not ( = ?auto_25870 ?auto_25904 ) ) ( not ( = ?auto_25871 ?auto_25874 ) ) ( not ( = ?auto_25871 ?auto_25904 ) ) ( not ( = ?auto_25872 ?auto_25874 ) ) ( not ( = ?auto_25872 ?auto_25904 ) ) ( not ( = ?auto_25874 ?auto_25916 ) ) ( not ( = ?auto_25874 ?auto_25898 ) ) ( not ( = ?auto_25874 ?auto_25886 ) ) ( not ( = ?auto_25874 ?auto_25891 ) ) ( not ( = ?auto_25874 ?auto_25885 ) ) ( not ( = ?auto_25874 ?auto_25905 ) ) ( not ( = ?auto_25874 ?auto_25917 ) ) ( not ( = ?auto_25874 ?auto_25896 ) ) ( not ( = ?auto_25874 ?auto_25889 ) ) ( not ( = ?auto_25909 ?auto_25897 ) ) ( not ( = ?auto_25909 ?auto_25914 ) ) ( not ( = ?auto_25909 ?auto_25888 ) ) ( not ( = ?auto_25909 ?auto_25901 ) ) ( not ( = ?auto_25909 ?auto_25893 ) ) ( not ( = ?auto_25909 ?auto_25890 ) ) ( not ( = ?auto_25909 ?auto_25903 ) ) ( not ( = ?auto_25909 ?auto_25908 ) ) ( not ( = ?auto_25911 ?auto_25906 ) ) ( not ( = ?auto_25911 ?auto_25902 ) ) ( not ( = ?auto_25911 ?auto_25884 ) ) ( not ( = ?auto_25911 ?auto_25895 ) ) ( not ( = ?auto_25911 ?auto_25915 ) ) ( not ( = ?auto_25911 ?auto_25900 ) ) ( not ( = ?auto_25911 ?auto_25910 ) ) ( not ( = ?auto_25911 ?auto_25912 ) ) ( not ( = ?auto_25904 ?auto_25916 ) ) ( not ( = ?auto_25904 ?auto_25898 ) ) ( not ( = ?auto_25904 ?auto_25886 ) ) ( not ( = ?auto_25904 ?auto_25891 ) ) ( not ( = ?auto_25904 ?auto_25885 ) ) ( not ( = ?auto_25904 ?auto_25905 ) ) ( not ( = ?auto_25904 ?auto_25917 ) ) ( not ( = ?auto_25904 ?auto_25896 ) ) ( not ( = ?auto_25904 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25875 ) ) ( not ( = ?auto_25864 ?auto_25887 ) ) ( not ( = ?auto_25865 ?auto_25875 ) ) ( not ( = ?auto_25865 ?auto_25887 ) ) ( not ( = ?auto_25866 ?auto_25875 ) ) ( not ( = ?auto_25866 ?auto_25887 ) ) ( not ( = ?auto_25867 ?auto_25875 ) ) ( not ( = ?auto_25867 ?auto_25887 ) ) ( not ( = ?auto_25868 ?auto_25875 ) ) ( not ( = ?auto_25868 ?auto_25887 ) ) ( not ( = ?auto_25869 ?auto_25875 ) ) ( not ( = ?auto_25869 ?auto_25887 ) ) ( not ( = ?auto_25870 ?auto_25875 ) ) ( not ( = ?auto_25870 ?auto_25887 ) ) ( not ( = ?auto_25871 ?auto_25875 ) ) ( not ( = ?auto_25871 ?auto_25887 ) ) ( not ( = ?auto_25872 ?auto_25875 ) ) ( not ( = ?auto_25872 ?auto_25887 ) ) ( not ( = ?auto_25873 ?auto_25875 ) ) ( not ( = ?auto_25873 ?auto_25887 ) ) ( not ( = ?auto_25875 ?auto_25904 ) ) ( not ( = ?auto_25875 ?auto_25916 ) ) ( not ( = ?auto_25875 ?auto_25898 ) ) ( not ( = ?auto_25875 ?auto_25886 ) ) ( not ( = ?auto_25875 ?auto_25891 ) ) ( not ( = ?auto_25875 ?auto_25885 ) ) ( not ( = ?auto_25875 ?auto_25905 ) ) ( not ( = ?auto_25875 ?auto_25917 ) ) ( not ( = ?auto_25875 ?auto_25896 ) ) ( not ( = ?auto_25875 ?auto_25889 ) ) ( not ( = ?auto_25899 ?auto_25909 ) ) ( not ( = ?auto_25899 ?auto_25897 ) ) ( not ( = ?auto_25899 ?auto_25914 ) ) ( not ( = ?auto_25899 ?auto_25888 ) ) ( not ( = ?auto_25899 ?auto_25901 ) ) ( not ( = ?auto_25899 ?auto_25893 ) ) ( not ( = ?auto_25899 ?auto_25890 ) ) ( not ( = ?auto_25899 ?auto_25903 ) ) ( not ( = ?auto_25899 ?auto_25908 ) ) ( not ( = ?auto_25907 ?auto_25911 ) ) ( not ( = ?auto_25907 ?auto_25906 ) ) ( not ( = ?auto_25907 ?auto_25902 ) ) ( not ( = ?auto_25907 ?auto_25884 ) ) ( not ( = ?auto_25907 ?auto_25895 ) ) ( not ( = ?auto_25907 ?auto_25915 ) ) ( not ( = ?auto_25907 ?auto_25900 ) ) ( not ( = ?auto_25907 ?auto_25910 ) ) ( not ( = ?auto_25907 ?auto_25912 ) ) ( not ( = ?auto_25887 ?auto_25904 ) ) ( not ( = ?auto_25887 ?auto_25916 ) ) ( not ( = ?auto_25887 ?auto_25898 ) ) ( not ( = ?auto_25887 ?auto_25886 ) ) ( not ( = ?auto_25887 ?auto_25891 ) ) ( not ( = ?auto_25887 ?auto_25885 ) ) ( not ( = ?auto_25887 ?auto_25905 ) ) ( not ( = ?auto_25887 ?auto_25917 ) ) ( not ( = ?auto_25887 ?auto_25896 ) ) ( not ( = ?auto_25887 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25876 ) ) ( not ( = ?auto_25864 ?auto_25913 ) ) ( not ( = ?auto_25865 ?auto_25876 ) ) ( not ( = ?auto_25865 ?auto_25913 ) ) ( not ( = ?auto_25866 ?auto_25876 ) ) ( not ( = ?auto_25866 ?auto_25913 ) ) ( not ( = ?auto_25867 ?auto_25876 ) ) ( not ( = ?auto_25867 ?auto_25913 ) ) ( not ( = ?auto_25868 ?auto_25876 ) ) ( not ( = ?auto_25868 ?auto_25913 ) ) ( not ( = ?auto_25869 ?auto_25876 ) ) ( not ( = ?auto_25869 ?auto_25913 ) ) ( not ( = ?auto_25870 ?auto_25876 ) ) ( not ( = ?auto_25870 ?auto_25913 ) ) ( not ( = ?auto_25871 ?auto_25876 ) ) ( not ( = ?auto_25871 ?auto_25913 ) ) ( not ( = ?auto_25872 ?auto_25876 ) ) ( not ( = ?auto_25872 ?auto_25913 ) ) ( not ( = ?auto_25873 ?auto_25876 ) ) ( not ( = ?auto_25873 ?auto_25913 ) ) ( not ( = ?auto_25874 ?auto_25876 ) ) ( not ( = ?auto_25874 ?auto_25913 ) ) ( not ( = ?auto_25876 ?auto_25887 ) ) ( not ( = ?auto_25876 ?auto_25904 ) ) ( not ( = ?auto_25876 ?auto_25916 ) ) ( not ( = ?auto_25876 ?auto_25898 ) ) ( not ( = ?auto_25876 ?auto_25886 ) ) ( not ( = ?auto_25876 ?auto_25891 ) ) ( not ( = ?auto_25876 ?auto_25885 ) ) ( not ( = ?auto_25876 ?auto_25905 ) ) ( not ( = ?auto_25876 ?auto_25917 ) ) ( not ( = ?auto_25876 ?auto_25896 ) ) ( not ( = ?auto_25876 ?auto_25889 ) ) ( not ( = ?auto_25892 ?auto_25899 ) ) ( not ( = ?auto_25892 ?auto_25909 ) ) ( not ( = ?auto_25892 ?auto_25897 ) ) ( not ( = ?auto_25892 ?auto_25914 ) ) ( not ( = ?auto_25892 ?auto_25888 ) ) ( not ( = ?auto_25892 ?auto_25901 ) ) ( not ( = ?auto_25892 ?auto_25893 ) ) ( not ( = ?auto_25892 ?auto_25890 ) ) ( not ( = ?auto_25892 ?auto_25903 ) ) ( not ( = ?auto_25892 ?auto_25908 ) ) ( not ( = ?auto_25894 ?auto_25907 ) ) ( not ( = ?auto_25894 ?auto_25911 ) ) ( not ( = ?auto_25894 ?auto_25906 ) ) ( not ( = ?auto_25894 ?auto_25902 ) ) ( not ( = ?auto_25894 ?auto_25884 ) ) ( not ( = ?auto_25894 ?auto_25895 ) ) ( not ( = ?auto_25894 ?auto_25915 ) ) ( not ( = ?auto_25894 ?auto_25900 ) ) ( not ( = ?auto_25894 ?auto_25910 ) ) ( not ( = ?auto_25894 ?auto_25912 ) ) ( not ( = ?auto_25913 ?auto_25887 ) ) ( not ( = ?auto_25913 ?auto_25904 ) ) ( not ( = ?auto_25913 ?auto_25916 ) ) ( not ( = ?auto_25913 ?auto_25898 ) ) ( not ( = ?auto_25913 ?auto_25886 ) ) ( not ( = ?auto_25913 ?auto_25891 ) ) ( not ( = ?auto_25913 ?auto_25885 ) ) ( not ( = ?auto_25913 ?auto_25905 ) ) ( not ( = ?auto_25913 ?auto_25917 ) ) ( not ( = ?auto_25913 ?auto_25896 ) ) ( not ( = ?auto_25913 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25877 ) ) ( not ( = ?auto_25864 ?auto_25878 ) ) ( not ( = ?auto_25865 ?auto_25877 ) ) ( not ( = ?auto_25865 ?auto_25878 ) ) ( not ( = ?auto_25866 ?auto_25877 ) ) ( not ( = ?auto_25866 ?auto_25878 ) ) ( not ( = ?auto_25867 ?auto_25877 ) ) ( not ( = ?auto_25867 ?auto_25878 ) ) ( not ( = ?auto_25868 ?auto_25877 ) ) ( not ( = ?auto_25868 ?auto_25878 ) ) ( not ( = ?auto_25869 ?auto_25877 ) ) ( not ( = ?auto_25869 ?auto_25878 ) ) ( not ( = ?auto_25870 ?auto_25877 ) ) ( not ( = ?auto_25870 ?auto_25878 ) ) ( not ( = ?auto_25871 ?auto_25877 ) ) ( not ( = ?auto_25871 ?auto_25878 ) ) ( not ( = ?auto_25872 ?auto_25877 ) ) ( not ( = ?auto_25872 ?auto_25878 ) ) ( not ( = ?auto_25873 ?auto_25877 ) ) ( not ( = ?auto_25873 ?auto_25878 ) ) ( not ( = ?auto_25874 ?auto_25877 ) ) ( not ( = ?auto_25874 ?auto_25878 ) ) ( not ( = ?auto_25875 ?auto_25877 ) ) ( not ( = ?auto_25875 ?auto_25878 ) ) ( not ( = ?auto_25877 ?auto_25913 ) ) ( not ( = ?auto_25877 ?auto_25887 ) ) ( not ( = ?auto_25877 ?auto_25904 ) ) ( not ( = ?auto_25877 ?auto_25916 ) ) ( not ( = ?auto_25877 ?auto_25898 ) ) ( not ( = ?auto_25877 ?auto_25886 ) ) ( not ( = ?auto_25877 ?auto_25891 ) ) ( not ( = ?auto_25877 ?auto_25885 ) ) ( not ( = ?auto_25877 ?auto_25905 ) ) ( not ( = ?auto_25877 ?auto_25917 ) ) ( not ( = ?auto_25877 ?auto_25896 ) ) ( not ( = ?auto_25877 ?auto_25889 ) ) ( not ( = ?auto_25880 ?auto_25892 ) ) ( not ( = ?auto_25880 ?auto_25899 ) ) ( not ( = ?auto_25880 ?auto_25909 ) ) ( not ( = ?auto_25880 ?auto_25897 ) ) ( not ( = ?auto_25880 ?auto_25914 ) ) ( not ( = ?auto_25880 ?auto_25888 ) ) ( not ( = ?auto_25880 ?auto_25901 ) ) ( not ( = ?auto_25880 ?auto_25893 ) ) ( not ( = ?auto_25880 ?auto_25890 ) ) ( not ( = ?auto_25880 ?auto_25903 ) ) ( not ( = ?auto_25880 ?auto_25908 ) ) ( not ( = ?auto_25879 ?auto_25894 ) ) ( not ( = ?auto_25879 ?auto_25907 ) ) ( not ( = ?auto_25879 ?auto_25911 ) ) ( not ( = ?auto_25879 ?auto_25906 ) ) ( not ( = ?auto_25879 ?auto_25902 ) ) ( not ( = ?auto_25879 ?auto_25884 ) ) ( not ( = ?auto_25879 ?auto_25895 ) ) ( not ( = ?auto_25879 ?auto_25915 ) ) ( not ( = ?auto_25879 ?auto_25900 ) ) ( not ( = ?auto_25879 ?auto_25910 ) ) ( not ( = ?auto_25879 ?auto_25912 ) ) ( not ( = ?auto_25878 ?auto_25913 ) ) ( not ( = ?auto_25878 ?auto_25887 ) ) ( not ( = ?auto_25878 ?auto_25904 ) ) ( not ( = ?auto_25878 ?auto_25916 ) ) ( not ( = ?auto_25878 ?auto_25898 ) ) ( not ( = ?auto_25878 ?auto_25886 ) ) ( not ( = ?auto_25878 ?auto_25891 ) ) ( not ( = ?auto_25878 ?auto_25885 ) ) ( not ( = ?auto_25878 ?auto_25905 ) ) ( not ( = ?auto_25878 ?auto_25917 ) ) ( not ( = ?auto_25878 ?auto_25896 ) ) ( not ( = ?auto_25878 ?auto_25889 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25864 ?auto_25865 ?auto_25866 ?auto_25867 ?auto_25868 ?auto_25869 ?auto_25870 ?auto_25871 ?auto_25872 ?auto_25873 ?auto_25874 ?auto_25875 ?auto_25876 )
      ( MAKE-1CRATE ?auto_25876 ?auto_25877 )
      ( MAKE-13CRATE-VERIFY ?auto_25864 ?auto_25865 ?auto_25866 ?auto_25867 ?auto_25868 ?auto_25869 ?auto_25870 ?auto_25871 ?auto_25872 ?auto_25873 ?auto_25874 ?auto_25875 ?auto_25876 ?auto_25877 ) )
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
      ?auto_25949 - SURFACE
      ?auto_25950 - SURFACE
      ?auto_25951 - SURFACE
      ?auto_25952 - SURFACE
      ?auto_25953 - SURFACE
      ?auto_25954 - SURFACE
      ?auto_25955 - SURFACE
      ?auto_25956 - SURFACE
      ?auto_25957 - SURFACE
    )
    :vars
    (
      ?auto_25961 - HOIST
      ?auto_25960 - PLACE
      ?auto_25959 - PLACE
      ?auto_25963 - HOIST
      ?auto_25962 - SURFACE
      ?auto_25969 - PLACE
      ?auto_25968 - HOIST
      ?auto_25976 - SURFACE
      ?auto_25991 - PLACE
      ?auto_25988 - HOIST
      ?auto_25979 - SURFACE
      ?auto_25987 - PLACE
      ?auto_25971 - HOIST
      ?auto_25994 - SURFACE
      ?auto_25964 - PLACE
      ?auto_25978 - HOIST
      ?auto_25965 - SURFACE
      ?auto_25977 - PLACE
      ?auto_25980 - HOIST
      ?auto_25983 - SURFACE
      ?auto_25993 - PLACE
      ?auto_25967 - HOIST
      ?auto_25990 - SURFACE
      ?auto_25996 - PLACE
      ?auto_25970 - HOIST
      ?auto_25982 - SURFACE
      ?auto_25972 - PLACE
      ?auto_25975 - HOIST
      ?auto_26000 - SURFACE
      ?auto_25989 - PLACE
      ?auto_25997 - HOIST
      ?auto_25995 - SURFACE
      ?auto_25998 - PLACE
      ?auto_25985 - HOIST
      ?auto_25984 - SURFACE
      ?auto_25999 - SURFACE
      ?auto_25973 - PLACE
      ?auto_25981 - HOIST
      ?auto_25986 - SURFACE
      ?auto_25966 - PLACE
      ?auto_25992 - HOIST
      ?auto_25974 - SURFACE
      ?auto_25958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25961 ?auto_25960 ) ( IS-CRATE ?auto_25957 ) ( not ( = ?auto_25959 ?auto_25960 ) ) ( HOIST-AT ?auto_25963 ?auto_25959 ) ( AVAILABLE ?auto_25963 ) ( SURFACE-AT ?auto_25957 ?auto_25959 ) ( ON ?auto_25957 ?auto_25962 ) ( CLEAR ?auto_25957 ) ( not ( = ?auto_25956 ?auto_25957 ) ) ( not ( = ?auto_25956 ?auto_25962 ) ) ( not ( = ?auto_25957 ?auto_25962 ) ) ( not ( = ?auto_25961 ?auto_25963 ) ) ( IS-CRATE ?auto_25956 ) ( not ( = ?auto_25969 ?auto_25960 ) ) ( HOIST-AT ?auto_25968 ?auto_25969 ) ( AVAILABLE ?auto_25968 ) ( SURFACE-AT ?auto_25956 ?auto_25969 ) ( ON ?auto_25956 ?auto_25976 ) ( CLEAR ?auto_25956 ) ( not ( = ?auto_25955 ?auto_25956 ) ) ( not ( = ?auto_25955 ?auto_25976 ) ) ( not ( = ?auto_25956 ?auto_25976 ) ) ( not ( = ?auto_25961 ?auto_25968 ) ) ( IS-CRATE ?auto_25955 ) ( not ( = ?auto_25991 ?auto_25960 ) ) ( HOIST-AT ?auto_25988 ?auto_25991 ) ( AVAILABLE ?auto_25988 ) ( SURFACE-AT ?auto_25955 ?auto_25991 ) ( ON ?auto_25955 ?auto_25979 ) ( CLEAR ?auto_25955 ) ( not ( = ?auto_25954 ?auto_25955 ) ) ( not ( = ?auto_25954 ?auto_25979 ) ) ( not ( = ?auto_25955 ?auto_25979 ) ) ( not ( = ?auto_25961 ?auto_25988 ) ) ( IS-CRATE ?auto_25954 ) ( not ( = ?auto_25987 ?auto_25960 ) ) ( HOIST-AT ?auto_25971 ?auto_25987 ) ( AVAILABLE ?auto_25971 ) ( SURFACE-AT ?auto_25954 ?auto_25987 ) ( ON ?auto_25954 ?auto_25994 ) ( CLEAR ?auto_25954 ) ( not ( = ?auto_25953 ?auto_25954 ) ) ( not ( = ?auto_25953 ?auto_25994 ) ) ( not ( = ?auto_25954 ?auto_25994 ) ) ( not ( = ?auto_25961 ?auto_25971 ) ) ( IS-CRATE ?auto_25953 ) ( not ( = ?auto_25964 ?auto_25960 ) ) ( HOIST-AT ?auto_25978 ?auto_25964 ) ( AVAILABLE ?auto_25978 ) ( SURFACE-AT ?auto_25953 ?auto_25964 ) ( ON ?auto_25953 ?auto_25965 ) ( CLEAR ?auto_25953 ) ( not ( = ?auto_25952 ?auto_25953 ) ) ( not ( = ?auto_25952 ?auto_25965 ) ) ( not ( = ?auto_25953 ?auto_25965 ) ) ( not ( = ?auto_25961 ?auto_25978 ) ) ( IS-CRATE ?auto_25952 ) ( not ( = ?auto_25977 ?auto_25960 ) ) ( HOIST-AT ?auto_25980 ?auto_25977 ) ( AVAILABLE ?auto_25980 ) ( SURFACE-AT ?auto_25952 ?auto_25977 ) ( ON ?auto_25952 ?auto_25983 ) ( CLEAR ?auto_25952 ) ( not ( = ?auto_25951 ?auto_25952 ) ) ( not ( = ?auto_25951 ?auto_25983 ) ) ( not ( = ?auto_25952 ?auto_25983 ) ) ( not ( = ?auto_25961 ?auto_25980 ) ) ( IS-CRATE ?auto_25951 ) ( not ( = ?auto_25993 ?auto_25960 ) ) ( HOIST-AT ?auto_25967 ?auto_25993 ) ( AVAILABLE ?auto_25967 ) ( SURFACE-AT ?auto_25951 ?auto_25993 ) ( ON ?auto_25951 ?auto_25990 ) ( CLEAR ?auto_25951 ) ( not ( = ?auto_25950 ?auto_25951 ) ) ( not ( = ?auto_25950 ?auto_25990 ) ) ( not ( = ?auto_25951 ?auto_25990 ) ) ( not ( = ?auto_25961 ?auto_25967 ) ) ( IS-CRATE ?auto_25950 ) ( not ( = ?auto_25996 ?auto_25960 ) ) ( HOIST-AT ?auto_25970 ?auto_25996 ) ( AVAILABLE ?auto_25970 ) ( SURFACE-AT ?auto_25950 ?auto_25996 ) ( ON ?auto_25950 ?auto_25982 ) ( CLEAR ?auto_25950 ) ( not ( = ?auto_25949 ?auto_25950 ) ) ( not ( = ?auto_25949 ?auto_25982 ) ) ( not ( = ?auto_25950 ?auto_25982 ) ) ( not ( = ?auto_25961 ?auto_25970 ) ) ( IS-CRATE ?auto_25949 ) ( not ( = ?auto_25972 ?auto_25960 ) ) ( HOIST-AT ?auto_25975 ?auto_25972 ) ( AVAILABLE ?auto_25975 ) ( SURFACE-AT ?auto_25949 ?auto_25972 ) ( ON ?auto_25949 ?auto_26000 ) ( CLEAR ?auto_25949 ) ( not ( = ?auto_25948 ?auto_25949 ) ) ( not ( = ?auto_25948 ?auto_26000 ) ) ( not ( = ?auto_25949 ?auto_26000 ) ) ( not ( = ?auto_25961 ?auto_25975 ) ) ( IS-CRATE ?auto_25948 ) ( not ( = ?auto_25989 ?auto_25960 ) ) ( HOIST-AT ?auto_25997 ?auto_25989 ) ( SURFACE-AT ?auto_25948 ?auto_25989 ) ( ON ?auto_25948 ?auto_25995 ) ( CLEAR ?auto_25948 ) ( not ( = ?auto_25947 ?auto_25948 ) ) ( not ( = ?auto_25947 ?auto_25995 ) ) ( not ( = ?auto_25948 ?auto_25995 ) ) ( not ( = ?auto_25961 ?auto_25997 ) ) ( IS-CRATE ?auto_25947 ) ( not ( = ?auto_25998 ?auto_25960 ) ) ( HOIST-AT ?auto_25985 ?auto_25998 ) ( AVAILABLE ?auto_25985 ) ( SURFACE-AT ?auto_25947 ?auto_25998 ) ( ON ?auto_25947 ?auto_25984 ) ( CLEAR ?auto_25947 ) ( not ( = ?auto_25946 ?auto_25947 ) ) ( not ( = ?auto_25946 ?auto_25984 ) ) ( not ( = ?auto_25947 ?auto_25984 ) ) ( not ( = ?auto_25961 ?auto_25985 ) ) ( IS-CRATE ?auto_25946 ) ( AVAILABLE ?auto_25997 ) ( SURFACE-AT ?auto_25946 ?auto_25989 ) ( ON ?auto_25946 ?auto_25999 ) ( CLEAR ?auto_25946 ) ( not ( = ?auto_25945 ?auto_25946 ) ) ( not ( = ?auto_25945 ?auto_25999 ) ) ( not ( = ?auto_25946 ?auto_25999 ) ) ( IS-CRATE ?auto_25945 ) ( not ( = ?auto_25973 ?auto_25960 ) ) ( HOIST-AT ?auto_25981 ?auto_25973 ) ( AVAILABLE ?auto_25981 ) ( SURFACE-AT ?auto_25945 ?auto_25973 ) ( ON ?auto_25945 ?auto_25986 ) ( CLEAR ?auto_25945 ) ( not ( = ?auto_25944 ?auto_25945 ) ) ( not ( = ?auto_25944 ?auto_25986 ) ) ( not ( = ?auto_25945 ?auto_25986 ) ) ( not ( = ?auto_25961 ?auto_25981 ) ) ( SURFACE-AT ?auto_25943 ?auto_25960 ) ( CLEAR ?auto_25943 ) ( IS-CRATE ?auto_25944 ) ( AVAILABLE ?auto_25961 ) ( not ( = ?auto_25966 ?auto_25960 ) ) ( HOIST-AT ?auto_25992 ?auto_25966 ) ( AVAILABLE ?auto_25992 ) ( SURFACE-AT ?auto_25944 ?auto_25966 ) ( ON ?auto_25944 ?auto_25974 ) ( CLEAR ?auto_25944 ) ( TRUCK-AT ?auto_25958 ?auto_25960 ) ( not ( = ?auto_25943 ?auto_25944 ) ) ( not ( = ?auto_25943 ?auto_25974 ) ) ( not ( = ?auto_25944 ?auto_25974 ) ) ( not ( = ?auto_25961 ?auto_25992 ) ) ( not ( = ?auto_25943 ?auto_25945 ) ) ( not ( = ?auto_25943 ?auto_25986 ) ) ( not ( = ?auto_25945 ?auto_25974 ) ) ( not ( = ?auto_25973 ?auto_25966 ) ) ( not ( = ?auto_25981 ?auto_25992 ) ) ( not ( = ?auto_25986 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25946 ) ) ( not ( = ?auto_25943 ?auto_25999 ) ) ( not ( = ?auto_25944 ?auto_25946 ) ) ( not ( = ?auto_25944 ?auto_25999 ) ) ( not ( = ?auto_25946 ?auto_25986 ) ) ( not ( = ?auto_25946 ?auto_25974 ) ) ( not ( = ?auto_25989 ?auto_25973 ) ) ( not ( = ?auto_25989 ?auto_25966 ) ) ( not ( = ?auto_25997 ?auto_25981 ) ) ( not ( = ?auto_25997 ?auto_25992 ) ) ( not ( = ?auto_25999 ?auto_25986 ) ) ( not ( = ?auto_25999 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25947 ) ) ( not ( = ?auto_25943 ?auto_25984 ) ) ( not ( = ?auto_25944 ?auto_25947 ) ) ( not ( = ?auto_25944 ?auto_25984 ) ) ( not ( = ?auto_25945 ?auto_25947 ) ) ( not ( = ?auto_25945 ?auto_25984 ) ) ( not ( = ?auto_25947 ?auto_25999 ) ) ( not ( = ?auto_25947 ?auto_25986 ) ) ( not ( = ?auto_25947 ?auto_25974 ) ) ( not ( = ?auto_25998 ?auto_25989 ) ) ( not ( = ?auto_25998 ?auto_25973 ) ) ( not ( = ?auto_25998 ?auto_25966 ) ) ( not ( = ?auto_25985 ?auto_25997 ) ) ( not ( = ?auto_25985 ?auto_25981 ) ) ( not ( = ?auto_25985 ?auto_25992 ) ) ( not ( = ?auto_25984 ?auto_25999 ) ) ( not ( = ?auto_25984 ?auto_25986 ) ) ( not ( = ?auto_25984 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25948 ) ) ( not ( = ?auto_25943 ?auto_25995 ) ) ( not ( = ?auto_25944 ?auto_25948 ) ) ( not ( = ?auto_25944 ?auto_25995 ) ) ( not ( = ?auto_25945 ?auto_25948 ) ) ( not ( = ?auto_25945 ?auto_25995 ) ) ( not ( = ?auto_25946 ?auto_25948 ) ) ( not ( = ?auto_25946 ?auto_25995 ) ) ( not ( = ?auto_25948 ?auto_25984 ) ) ( not ( = ?auto_25948 ?auto_25999 ) ) ( not ( = ?auto_25948 ?auto_25986 ) ) ( not ( = ?auto_25948 ?auto_25974 ) ) ( not ( = ?auto_25995 ?auto_25984 ) ) ( not ( = ?auto_25995 ?auto_25999 ) ) ( not ( = ?auto_25995 ?auto_25986 ) ) ( not ( = ?auto_25995 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25949 ) ) ( not ( = ?auto_25943 ?auto_26000 ) ) ( not ( = ?auto_25944 ?auto_25949 ) ) ( not ( = ?auto_25944 ?auto_26000 ) ) ( not ( = ?auto_25945 ?auto_25949 ) ) ( not ( = ?auto_25945 ?auto_26000 ) ) ( not ( = ?auto_25946 ?auto_25949 ) ) ( not ( = ?auto_25946 ?auto_26000 ) ) ( not ( = ?auto_25947 ?auto_25949 ) ) ( not ( = ?auto_25947 ?auto_26000 ) ) ( not ( = ?auto_25949 ?auto_25995 ) ) ( not ( = ?auto_25949 ?auto_25984 ) ) ( not ( = ?auto_25949 ?auto_25999 ) ) ( not ( = ?auto_25949 ?auto_25986 ) ) ( not ( = ?auto_25949 ?auto_25974 ) ) ( not ( = ?auto_25972 ?auto_25989 ) ) ( not ( = ?auto_25972 ?auto_25998 ) ) ( not ( = ?auto_25972 ?auto_25973 ) ) ( not ( = ?auto_25972 ?auto_25966 ) ) ( not ( = ?auto_25975 ?auto_25997 ) ) ( not ( = ?auto_25975 ?auto_25985 ) ) ( not ( = ?auto_25975 ?auto_25981 ) ) ( not ( = ?auto_25975 ?auto_25992 ) ) ( not ( = ?auto_26000 ?auto_25995 ) ) ( not ( = ?auto_26000 ?auto_25984 ) ) ( not ( = ?auto_26000 ?auto_25999 ) ) ( not ( = ?auto_26000 ?auto_25986 ) ) ( not ( = ?auto_26000 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25950 ) ) ( not ( = ?auto_25943 ?auto_25982 ) ) ( not ( = ?auto_25944 ?auto_25950 ) ) ( not ( = ?auto_25944 ?auto_25982 ) ) ( not ( = ?auto_25945 ?auto_25950 ) ) ( not ( = ?auto_25945 ?auto_25982 ) ) ( not ( = ?auto_25946 ?auto_25950 ) ) ( not ( = ?auto_25946 ?auto_25982 ) ) ( not ( = ?auto_25947 ?auto_25950 ) ) ( not ( = ?auto_25947 ?auto_25982 ) ) ( not ( = ?auto_25948 ?auto_25950 ) ) ( not ( = ?auto_25948 ?auto_25982 ) ) ( not ( = ?auto_25950 ?auto_26000 ) ) ( not ( = ?auto_25950 ?auto_25995 ) ) ( not ( = ?auto_25950 ?auto_25984 ) ) ( not ( = ?auto_25950 ?auto_25999 ) ) ( not ( = ?auto_25950 ?auto_25986 ) ) ( not ( = ?auto_25950 ?auto_25974 ) ) ( not ( = ?auto_25996 ?auto_25972 ) ) ( not ( = ?auto_25996 ?auto_25989 ) ) ( not ( = ?auto_25996 ?auto_25998 ) ) ( not ( = ?auto_25996 ?auto_25973 ) ) ( not ( = ?auto_25996 ?auto_25966 ) ) ( not ( = ?auto_25970 ?auto_25975 ) ) ( not ( = ?auto_25970 ?auto_25997 ) ) ( not ( = ?auto_25970 ?auto_25985 ) ) ( not ( = ?auto_25970 ?auto_25981 ) ) ( not ( = ?auto_25970 ?auto_25992 ) ) ( not ( = ?auto_25982 ?auto_26000 ) ) ( not ( = ?auto_25982 ?auto_25995 ) ) ( not ( = ?auto_25982 ?auto_25984 ) ) ( not ( = ?auto_25982 ?auto_25999 ) ) ( not ( = ?auto_25982 ?auto_25986 ) ) ( not ( = ?auto_25982 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25951 ) ) ( not ( = ?auto_25943 ?auto_25990 ) ) ( not ( = ?auto_25944 ?auto_25951 ) ) ( not ( = ?auto_25944 ?auto_25990 ) ) ( not ( = ?auto_25945 ?auto_25951 ) ) ( not ( = ?auto_25945 ?auto_25990 ) ) ( not ( = ?auto_25946 ?auto_25951 ) ) ( not ( = ?auto_25946 ?auto_25990 ) ) ( not ( = ?auto_25947 ?auto_25951 ) ) ( not ( = ?auto_25947 ?auto_25990 ) ) ( not ( = ?auto_25948 ?auto_25951 ) ) ( not ( = ?auto_25948 ?auto_25990 ) ) ( not ( = ?auto_25949 ?auto_25951 ) ) ( not ( = ?auto_25949 ?auto_25990 ) ) ( not ( = ?auto_25951 ?auto_25982 ) ) ( not ( = ?auto_25951 ?auto_26000 ) ) ( not ( = ?auto_25951 ?auto_25995 ) ) ( not ( = ?auto_25951 ?auto_25984 ) ) ( not ( = ?auto_25951 ?auto_25999 ) ) ( not ( = ?auto_25951 ?auto_25986 ) ) ( not ( = ?auto_25951 ?auto_25974 ) ) ( not ( = ?auto_25993 ?auto_25996 ) ) ( not ( = ?auto_25993 ?auto_25972 ) ) ( not ( = ?auto_25993 ?auto_25989 ) ) ( not ( = ?auto_25993 ?auto_25998 ) ) ( not ( = ?auto_25993 ?auto_25973 ) ) ( not ( = ?auto_25993 ?auto_25966 ) ) ( not ( = ?auto_25967 ?auto_25970 ) ) ( not ( = ?auto_25967 ?auto_25975 ) ) ( not ( = ?auto_25967 ?auto_25997 ) ) ( not ( = ?auto_25967 ?auto_25985 ) ) ( not ( = ?auto_25967 ?auto_25981 ) ) ( not ( = ?auto_25967 ?auto_25992 ) ) ( not ( = ?auto_25990 ?auto_25982 ) ) ( not ( = ?auto_25990 ?auto_26000 ) ) ( not ( = ?auto_25990 ?auto_25995 ) ) ( not ( = ?auto_25990 ?auto_25984 ) ) ( not ( = ?auto_25990 ?auto_25999 ) ) ( not ( = ?auto_25990 ?auto_25986 ) ) ( not ( = ?auto_25990 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25952 ) ) ( not ( = ?auto_25943 ?auto_25983 ) ) ( not ( = ?auto_25944 ?auto_25952 ) ) ( not ( = ?auto_25944 ?auto_25983 ) ) ( not ( = ?auto_25945 ?auto_25952 ) ) ( not ( = ?auto_25945 ?auto_25983 ) ) ( not ( = ?auto_25946 ?auto_25952 ) ) ( not ( = ?auto_25946 ?auto_25983 ) ) ( not ( = ?auto_25947 ?auto_25952 ) ) ( not ( = ?auto_25947 ?auto_25983 ) ) ( not ( = ?auto_25948 ?auto_25952 ) ) ( not ( = ?auto_25948 ?auto_25983 ) ) ( not ( = ?auto_25949 ?auto_25952 ) ) ( not ( = ?auto_25949 ?auto_25983 ) ) ( not ( = ?auto_25950 ?auto_25952 ) ) ( not ( = ?auto_25950 ?auto_25983 ) ) ( not ( = ?auto_25952 ?auto_25990 ) ) ( not ( = ?auto_25952 ?auto_25982 ) ) ( not ( = ?auto_25952 ?auto_26000 ) ) ( not ( = ?auto_25952 ?auto_25995 ) ) ( not ( = ?auto_25952 ?auto_25984 ) ) ( not ( = ?auto_25952 ?auto_25999 ) ) ( not ( = ?auto_25952 ?auto_25986 ) ) ( not ( = ?auto_25952 ?auto_25974 ) ) ( not ( = ?auto_25977 ?auto_25993 ) ) ( not ( = ?auto_25977 ?auto_25996 ) ) ( not ( = ?auto_25977 ?auto_25972 ) ) ( not ( = ?auto_25977 ?auto_25989 ) ) ( not ( = ?auto_25977 ?auto_25998 ) ) ( not ( = ?auto_25977 ?auto_25973 ) ) ( not ( = ?auto_25977 ?auto_25966 ) ) ( not ( = ?auto_25980 ?auto_25967 ) ) ( not ( = ?auto_25980 ?auto_25970 ) ) ( not ( = ?auto_25980 ?auto_25975 ) ) ( not ( = ?auto_25980 ?auto_25997 ) ) ( not ( = ?auto_25980 ?auto_25985 ) ) ( not ( = ?auto_25980 ?auto_25981 ) ) ( not ( = ?auto_25980 ?auto_25992 ) ) ( not ( = ?auto_25983 ?auto_25990 ) ) ( not ( = ?auto_25983 ?auto_25982 ) ) ( not ( = ?auto_25983 ?auto_26000 ) ) ( not ( = ?auto_25983 ?auto_25995 ) ) ( not ( = ?auto_25983 ?auto_25984 ) ) ( not ( = ?auto_25983 ?auto_25999 ) ) ( not ( = ?auto_25983 ?auto_25986 ) ) ( not ( = ?auto_25983 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25953 ) ) ( not ( = ?auto_25943 ?auto_25965 ) ) ( not ( = ?auto_25944 ?auto_25953 ) ) ( not ( = ?auto_25944 ?auto_25965 ) ) ( not ( = ?auto_25945 ?auto_25953 ) ) ( not ( = ?auto_25945 ?auto_25965 ) ) ( not ( = ?auto_25946 ?auto_25953 ) ) ( not ( = ?auto_25946 ?auto_25965 ) ) ( not ( = ?auto_25947 ?auto_25953 ) ) ( not ( = ?auto_25947 ?auto_25965 ) ) ( not ( = ?auto_25948 ?auto_25953 ) ) ( not ( = ?auto_25948 ?auto_25965 ) ) ( not ( = ?auto_25949 ?auto_25953 ) ) ( not ( = ?auto_25949 ?auto_25965 ) ) ( not ( = ?auto_25950 ?auto_25953 ) ) ( not ( = ?auto_25950 ?auto_25965 ) ) ( not ( = ?auto_25951 ?auto_25953 ) ) ( not ( = ?auto_25951 ?auto_25965 ) ) ( not ( = ?auto_25953 ?auto_25983 ) ) ( not ( = ?auto_25953 ?auto_25990 ) ) ( not ( = ?auto_25953 ?auto_25982 ) ) ( not ( = ?auto_25953 ?auto_26000 ) ) ( not ( = ?auto_25953 ?auto_25995 ) ) ( not ( = ?auto_25953 ?auto_25984 ) ) ( not ( = ?auto_25953 ?auto_25999 ) ) ( not ( = ?auto_25953 ?auto_25986 ) ) ( not ( = ?auto_25953 ?auto_25974 ) ) ( not ( = ?auto_25964 ?auto_25977 ) ) ( not ( = ?auto_25964 ?auto_25993 ) ) ( not ( = ?auto_25964 ?auto_25996 ) ) ( not ( = ?auto_25964 ?auto_25972 ) ) ( not ( = ?auto_25964 ?auto_25989 ) ) ( not ( = ?auto_25964 ?auto_25998 ) ) ( not ( = ?auto_25964 ?auto_25973 ) ) ( not ( = ?auto_25964 ?auto_25966 ) ) ( not ( = ?auto_25978 ?auto_25980 ) ) ( not ( = ?auto_25978 ?auto_25967 ) ) ( not ( = ?auto_25978 ?auto_25970 ) ) ( not ( = ?auto_25978 ?auto_25975 ) ) ( not ( = ?auto_25978 ?auto_25997 ) ) ( not ( = ?auto_25978 ?auto_25985 ) ) ( not ( = ?auto_25978 ?auto_25981 ) ) ( not ( = ?auto_25978 ?auto_25992 ) ) ( not ( = ?auto_25965 ?auto_25983 ) ) ( not ( = ?auto_25965 ?auto_25990 ) ) ( not ( = ?auto_25965 ?auto_25982 ) ) ( not ( = ?auto_25965 ?auto_26000 ) ) ( not ( = ?auto_25965 ?auto_25995 ) ) ( not ( = ?auto_25965 ?auto_25984 ) ) ( not ( = ?auto_25965 ?auto_25999 ) ) ( not ( = ?auto_25965 ?auto_25986 ) ) ( not ( = ?auto_25965 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25954 ) ) ( not ( = ?auto_25943 ?auto_25994 ) ) ( not ( = ?auto_25944 ?auto_25954 ) ) ( not ( = ?auto_25944 ?auto_25994 ) ) ( not ( = ?auto_25945 ?auto_25954 ) ) ( not ( = ?auto_25945 ?auto_25994 ) ) ( not ( = ?auto_25946 ?auto_25954 ) ) ( not ( = ?auto_25946 ?auto_25994 ) ) ( not ( = ?auto_25947 ?auto_25954 ) ) ( not ( = ?auto_25947 ?auto_25994 ) ) ( not ( = ?auto_25948 ?auto_25954 ) ) ( not ( = ?auto_25948 ?auto_25994 ) ) ( not ( = ?auto_25949 ?auto_25954 ) ) ( not ( = ?auto_25949 ?auto_25994 ) ) ( not ( = ?auto_25950 ?auto_25954 ) ) ( not ( = ?auto_25950 ?auto_25994 ) ) ( not ( = ?auto_25951 ?auto_25954 ) ) ( not ( = ?auto_25951 ?auto_25994 ) ) ( not ( = ?auto_25952 ?auto_25954 ) ) ( not ( = ?auto_25952 ?auto_25994 ) ) ( not ( = ?auto_25954 ?auto_25965 ) ) ( not ( = ?auto_25954 ?auto_25983 ) ) ( not ( = ?auto_25954 ?auto_25990 ) ) ( not ( = ?auto_25954 ?auto_25982 ) ) ( not ( = ?auto_25954 ?auto_26000 ) ) ( not ( = ?auto_25954 ?auto_25995 ) ) ( not ( = ?auto_25954 ?auto_25984 ) ) ( not ( = ?auto_25954 ?auto_25999 ) ) ( not ( = ?auto_25954 ?auto_25986 ) ) ( not ( = ?auto_25954 ?auto_25974 ) ) ( not ( = ?auto_25987 ?auto_25964 ) ) ( not ( = ?auto_25987 ?auto_25977 ) ) ( not ( = ?auto_25987 ?auto_25993 ) ) ( not ( = ?auto_25987 ?auto_25996 ) ) ( not ( = ?auto_25987 ?auto_25972 ) ) ( not ( = ?auto_25987 ?auto_25989 ) ) ( not ( = ?auto_25987 ?auto_25998 ) ) ( not ( = ?auto_25987 ?auto_25973 ) ) ( not ( = ?auto_25987 ?auto_25966 ) ) ( not ( = ?auto_25971 ?auto_25978 ) ) ( not ( = ?auto_25971 ?auto_25980 ) ) ( not ( = ?auto_25971 ?auto_25967 ) ) ( not ( = ?auto_25971 ?auto_25970 ) ) ( not ( = ?auto_25971 ?auto_25975 ) ) ( not ( = ?auto_25971 ?auto_25997 ) ) ( not ( = ?auto_25971 ?auto_25985 ) ) ( not ( = ?auto_25971 ?auto_25981 ) ) ( not ( = ?auto_25971 ?auto_25992 ) ) ( not ( = ?auto_25994 ?auto_25965 ) ) ( not ( = ?auto_25994 ?auto_25983 ) ) ( not ( = ?auto_25994 ?auto_25990 ) ) ( not ( = ?auto_25994 ?auto_25982 ) ) ( not ( = ?auto_25994 ?auto_26000 ) ) ( not ( = ?auto_25994 ?auto_25995 ) ) ( not ( = ?auto_25994 ?auto_25984 ) ) ( not ( = ?auto_25994 ?auto_25999 ) ) ( not ( = ?auto_25994 ?auto_25986 ) ) ( not ( = ?auto_25994 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25955 ) ) ( not ( = ?auto_25943 ?auto_25979 ) ) ( not ( = ?auto_25944 ?auto_25955 ) ) ( not ( = ?auto_25944 ?auto_25979 ) ) ( not ( = ?auto_25945 ?auto_25955 ) ) ( not ( = ?auto_25945 ?auto_25979 ) ) ( not ( = ?auto_25946 ?auto_25955 ) ) ( not ( = ?auto_25946 ?auto_25979 ) ) ( not ( = ?auto_25947 ?auto_25955 ) ) ( not ( = ?auto_25947 ?auto_25979 ) ) ( not ( = ?auto_25948 ?auto_25955 ) ) ( not ( = ?auto_25948 ?auto_25979 ) ) ( not ( = ?auto_25949 ?auto_25955 ) ) ( not ( = ?auto_25949 ?auto_25979 ) ) ( not ( = ?auto_25950 ?auto_25955 ) ) ( not ( = ?auto_25950 ?auto_25979 ) ) ( not ( = ?auto_25951 ?auto_25955 ) ) ( not ( = ?auto_25951 ?auto_25979 ) ) ( not ( = ?auto_25952 ?auto_25955 ) ) ( not ( = ?auto_25952 ?auto_25979 ) ) ( not ( = ?auto_25953 ?auto_25955 ) ) ( not ( = ?auto_25953 ?auto_25979 ) ) ( not ( = ?auto_25955 ?auto_25994 ) ) ( not ( = ?auto_25955 ?auto_25965 ) ) ( not ( = ?auto_25955 ?auto_25983 ) ) ( not ( = ?auto_25955 ?auto_25990 ) ) ( not ( = ?auto_25955 ?auto_25982 ) ) ( not ( = ?auto_25955 ?auto_26000 ) ) ( not ( = ?auto_25955 ?auto_25995 ) ) ( not ( = ?auto_25955 ?auto_25984 ) ) ( not ( = ?auto_25955 ?auto_25999 ) ) ( not ( = ?auto_25955 ?auto_25986 ) ) ( not ( = ?auto_25955 ?auto_25974 ) ) ( not ( = ?auto_25991 ?auto_25987 ) ) ( not ( = ?auto_25991 ?auto_25964 ) ) ( not ( = ?auto_25991 ?auto_25977 ) ) ( not ( = ?auto_25991 ?auto_25993 ) ) ( not ( = ?auto_25991 ?auto_25996 ) ) ( not ( = ?auto_25991 ?auto_25972 ) ) ( not ( = ?auto_25991 ?auto_25989 ) ) ( not ( = ?auto_25991 ?auto_25998 ) ) ( not ( = ?auto_25991 ?auto_25973 ) ) ( not ( = ?auto_25991 ?auto_25966 ) ) ( not ( = ?auto_25988 ?auto_25971 ) ) ( not ( = ?auto_25988 ?auto_25978 ) ) ( not ( = ?auto_25988 ?auto_25980 ) ) ( not ( = ?auto_25988 ?auto_25967 ) ) ( not ( = ?auto_25988 ?auto_25970 ) ) ( not ( = ?auto_25988 ?auto_25975 ) ) ( not ( = ?auto_25988 ?auto_25997 ) ) ( not ( = ?auto_25988 ?auto_25985 ) ) ( not ( = ?auto_25988 ?auto_25981 ) ) ( not ( = ?auto_25988 ?auto_25992 ) ) ( not ( = ?auto_25979 ?auto_25994 ) ) ( not ( = ?auto_25979 ?auto_25965 ) ) ( not ( = ?auto_25979 ?auto_25983 ) ) ( not ( = ?auto_25979 ?auto_25990 ) ) ( not ( = ?auto_25979 ?auto_25982 ) ) ( not ( = ?auto_25979 ?auto_26000 ) ) ( not ( = ?auto_25979 ?auto_25995 ) ) ( not ( = ?auto_25979 ?auto_25984 ) ) ( not ( = ?auto_25979 ?auto_25999 ) ) ( not ( = ?auto_25979 ?auto_25986 ) ) ( not ( = ?auto_25979 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25956 ) ) ( not ( = ?auto_25943 ?auto_25976 ) ) ( not ( = ?auto_25944 ?auto_25956 ) ) ( not ( = ?auto_25944 ?auto_25976 ) ) ( not ( = ?auto_25945 ?auto_25956 ) ) ( not ( = ?auto_25945 ?auto_25976 ) ) ( not ( = ?auto_25946 ?auto_25956 ) ) ( not ( = ?auto_25946 ?auto_25976 ) ) ( not ( = ?auto_25947 ?auto_25956 ) ) ( not ( = ?auto_25947 ?auto_25976 ) ) ( not ( = ?auto_25948 ?auto_25956 ) ) ( not ( = ?auto_25948 ?auto_25976 ) ) ( not ( = ?auto_25949 ?auto_25956 ) ) ( not ( = ?auto_25949 ?auto_25976 ) ) ( not ( = ?auto_25950 ?auto_25956 ) ) ( not ( = ?auto_25950 ?auto_25976 ) ) ( not ( = ?auto_25951 ?auto_25956 ) ) ( not ( = ?auto_25951 ?auto_25976 ) ) ( not ( = ?auto_25952 ?auto_25956 ) ) ( not ( = ?auto_25952 ?auto_25976 ) ) ( not ( = ?auto_25953 ?auto_25956 ) ) ( not ( = ?auto_25953 ?auto_25976 ) ) ( not ( = ?auto_25954 ?auto_25956 ) ) ( not ( = ?auto_25954 ?auto_25976 ) ) ( not ( = ?auto_25956 ?auto_25979 ) ) ( not ( = ?auto_25956 ?auto_25994 ) ) ( not ( = ?auto_25956 ?auto_25965 ) ) ( not ( = ?auto_25956 ?auto_25983 ) ) ( not ( = ?auto_25956 ?auto_25990 ) ) ( not ( = ?auto_25956 ?auto_25982 ) ) ( not ( = ?auto_25956 ?auto_26000 ) ) ( not ( = ?auto_25956 ?auto_25995 ) ) ( not ( = ?auto_25956 ?auto_25984 ) ) ( not ( = ?auto_25956 ?auto_25999 ) ) ( not ( = ?auto_25956 ?auto_25986 ) ) ( not ( = ?auto_25956 ?auto_25974 ) ) ( not ( = ?auto_25969 ?auto_25991 ) ) ( not ( = ?auto_25969 ?auto_25987 ) ) ( not ( = ?auto_25969 ?auto_25964 ) ) ( not ( = ?auto_25969 ?auto_25977 ) ) ( not ( = ?auto_25969 ?auto_25993 ) ) ( not ( = ?auto_25969 ?auto_25996 ) ) ( not ( = ?auto_25969 ?auto_25972 ) ) ( not ( = ?auto_25969 ?auto_25989 ) ) ( not ( = ?auto_25969 ?auto_25998 ) ) ( not ( = ?auto_25969 ?auto_25973 ) ) ( not ( = ?auto_25969 ?auto_25966 ) ) ( not ( = ?auto_25968 ?auto_25988 ) ) ( not ( = ?auto_25968 ?auto_25971 ) ) ( not ( = ?auto_25968 ?auto_25978 ) ) ( not ( = ?auto_25968 ?auto_25980 ) ) ( not ( = ?auto_25968 ?auto_25967 ) ) ( not ( = ?auto_25968 ?auto_25970 ) ) ( not ( = ?auto_25968 ?auto_25975 ) ) ( not ( = ?auto_25968 ?auto_25997 ) ) ( not ( = ?auto_25968 ?auto_25985 ) ) ( not ( = ?auto_25968 ?auto_25981 ) ) ( not ( = ?auto_25968 ?auto_25992 ) ) ( not ( = ?auto_25976 ?auto_25979 ) ) ( not ( = ?auto_25976 ?auto_25994 ) ) ( not ( = ?auto_25976 ?auto_25965 ) ) ( not ( = ?auto_25976 ?auto_25983 ) ) ( not ( = ?auto_25976 ?auto_25990 ) ) ( not ( = ?auto_25976 ?auto_25982 ) ) ( not ( = ?auto_25976 ?auto_26000 ) ) ( not ( = ?auto_25976 ?auto_25995 ) ) ( not ( = ?auto_25976 ?auto_25984 ) ) ( not ( = ?auto_25976 ?auto_25999 ) ) ( not ( = ?auto_25976 ?auto_25986 ) ) ( not ( = ?auto_25976 ?auto_25974 ) ) ( not ( = ?auto_25943 ?auto_25957 ) ) ( not ( = ?auto_25943 ?auto_25962 ) ) ( not ( = ?auto_25944 ?auto_25957 ) ) ( not ( = ?auto_25944 ?auto_25962 ) ) ( not ( = ?auto_25945 ?auto_25957 ) ) ( not ( = ?auto_25945 ?auto_25962 ) ) ( not ( = ?auto_25946 ?auto_25957 ) ) ( not ( = ?auto_25946 ?auto_25962 ) ) ( not ( = ?auto_25947 ?auto_25957 ) ) ( not ( = ?auto_25947 ?auto_25962 ) ) ( not ( = ?auto_25948 ?auto_25957 ) ) ( not ( = ?auto_25948 ?auto_25962 ) ) ( not ( = ?auto_25949 ?auto_25957 ) ) ( not ( = ?auto_25949 ?auto_25962 ) ) ( not ( = ?auto_25950 ?auto_25957 ) ) ( not ( = ?auto_25950 ?auto_25962 ) ) ( not ( = ?auto_25951 ?auto_25957 ) ) ( not ( = ?auto_25951 ?auto_25962 ) ) ( not ( = ?auto_25952 ?auto_25957 ) ) ( not ( = ?auto_25952 ?auto_25962 ) ) ( not ( = ?auto_25953 ?auto_25957 ) ) ( not ( = ?auto_25953 ?auto_25962 ) ) ( not ( = ?auto_25954 ?auto_25957 ) ) ( not ( = ?auto_25954 ?auto_25962 ) ) ( not ( = ?auto_25955 ?auto_25957 ) ) ( not ( = ?auto_25955 ?auto_25962 ) ) ( not ( = ?auto_25957 ?auto_25976 ) ) ( not ( = ?auto_25957 ?auto_25979 ) ) ( not ( = ?auto_25957 ?auto_25994 ) ) ( not ( = ?auto_25957 ?auto_25965 ) ) ( not ( = ?auto_25957 ?auto_25983 ) ) ( not ( = ?auto_25957 ?auto_25990 ) ) ( not ( = ?auto_25957 ?auto_25982 ) ) ( not ( = ?auto_25957 ?auto_26000 ) ) ( not ( = ?auto_25957 ?auto_25995 ) ) ( not ( = ?auto_25957 ?auto_25984 ) ) ( not ( = ?auto_25957 ?auto_25999 ) ) ( not ( = ?auto_25957 ?auto_25986 ) ) ( not ( = ?auto_25957 ?auto_25974 ) ) ( not ( = ?auto_25959 ?auto_25969 ) ) ( not ( = ?auto_25959 ?auto_25991 ) ) ( not ( = ?auto_25959 ?auto_25987 ) ) ( not ( = ?auto_25959 ?auto_25964 ) ) ( not ( = ?auto_25959 ?auto_25977 ) ) ( not ( = ?auto_25959 ?auto_25993 ) ) ( not ( = ?auto_25959 ?auto_25996 ) ) ( not ( = ?auto_25959 ?auto_25972 ) ) ( not ( = ?auto_25959 ?auto_25989 ) ) ( not ( = ?auto_25959 ?auto_25998 ) ) ( not ( = ?auto_25959 ?auto_25973 ) ) ( not ( = ?auto_25959 ?auto_25966 ) ) ( not ( = ?auto_25963 ?auto_25968 ) ) ( not ( = ?auto_25963 ?auto_25988 ) ) ( not ( = ?auto_25963 ?auto_25971 ) ) ( not ( = ?auto_25963 ?auto_25978 ) ) ( not ( = ?auto_25963 ?auto_25980 ) ) ( not ( = ?auto_25963 ?auto_25967 ) ) ( not ( = ?auto_25963 ?auto_25970 ) ) ( not ( = ?auto_25963 ?auto_25975 ) ) ( not ( = ?auto_25963 ?auto_25997 ) ) ( not ( = ?auto_25963 ?auto_25985 ) ) ( not ( = ?auto_25963 ?auto_25981 ) ) ( not ( = ?auto_25963 ?auto_25992 ) ) ( not ( = ?auto_25962 ?auto_25976 ) ) ( not ( = ?auto_25962 ?auto_25979 ) ) ( not ( = ?auto_25962 ?auto_25994 ) ) ( not ( = ?auto_25962 ?auto_25965 ) ) ( not ( = ?auto_25962 ?auto_25983 ) ) ( not ( = ?auto_25962 ?auto_25990 ) ) ( not ( = ?auto_25962 ?auto_25982 ) ) ( not ( = ?auto_25962 ?auto_26000 ) ) ( not ( = ?auto_25962 ?auto_25995 ) ) ( not ( = ?auto_25962 ?auto_25984 ) ) ( not ( = ?auto_25962 ?auto_25999 ) ) ( not ( = ?auto_25962 ?auto_25986 ) ) ( not ( = ?auto_25962 ?auto_25974 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25943 ?auto_25944 ?auto_25945 ?auto_25946 ?auto_25947 ?auto_25948 ?auto_25949 ?auto_25950 ?auto_25951 ?auto_25952 ?auto_25953 ?auto_25954 ?auto_25955 ?auto_25956 )
      ( MAKE-1CRATE ?auto_25956 ?auto_25957 )
      ( MAKE-14CRATE-VERIFY ?auto_25943 ?auto_25944 ?auto_25945 ?auto_25946 ?auto_25947 ?auto_25948 ?auto_25949 ?auto_25950 ?auto_25951 ?auto_25952 ?auto_25953 ?auto_25954 ?auto_25955 ?auto_25956 ?auto_25957 ) )
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
      ?auto_26033 - SURFACE
      ?auto_26034 - SURFACE
      ?auto_26035 - SURFACE
      ?auto_26036 - SURFACE
      ?auto_26037 - SURFACE
      ?auto_26038 - SURFACE
      ?auto_26039 - SURFACE
      ?auto_26040 - SURFACE
      ?auto_26042 - SURFACE
      ?auto_26041 - SURFACE
    )
    :vars
    (
      ?auto_26044 - HOIST
      ?auto_26047 - PLACE
      ?auto_26046 - PLACE
      ?auto_26045 - HOIST
      ?auto_26048 - SURFACE
      ?auto_26082 - PLACE
      ?auto_26081 - HOIST
      ?auto_26064 - SURFACE
      ?auto_26075 - PLACE
      ?auto_26074 - HOIST
      ?auto_26060 - SURFACE
      ?auto_26083 - PLACE
      ?auto_26087 - HOIST
      ?auto_26049 - SURFACE
      ?auto_26066 - PLACE
      ?auto_26056 - HOIST
      ?auto_26053 - SURFACE
      ?auto_26051 - PLACE
      ?auto_26052 - HOIST
      ?auto_26088 - SURFACE
      ?auto_26085 - PLACE
      ?auto_26086 - HOIST
      ?auto_26057 - SURFACE
      ?auto_26055 - PLACE
      ?auto_26050 - HOIST
      ?auto_26062 - SURFACE
      ?auto_26058 - PLACE
      ?auto_26071 - HOIST
      ?auto_26059 - SURFACE
      ?auto_26070 - PLACE
      ?auto_26061 - HOIST
      ?auto_26063 - SURFACE
      ?auto_26080 - PLACE
      ?auto_26078 - HOIST
      ?auto_26077 - SURFACE
      ?auto_26079 - PLACE
      ?auto_26073 - HOIST
      ?auto_26065 - SURFACE
      ?auto_26068 - SURFACE
      ?auto_26072 - PLACE
      ?auto_26084 - HOIST
      ?auto_26054 - SURFACE
      ?auto_26076 - PLACE
      ?auto_26067 - HOIST
      ?auto_26069 - SURFACE
      ?auto_26043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26044 ?auto_26047 ) ( IS-CRATE ?auto_26041 ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( HOIST-AT ?auto_26045 ?auto_26046 ) ( AVAILABLE ?auto_26045 ) ( SURFACE-AT ?auto_26041 ?auto_26046 ) ( ON ?auto_26041 ?auto_26048 ) ( CLEAR ?auto_26041 ) ( not ( = ?auto_26042 ?auto_26041 ) ) ( not ( = ?auto_26042 ?auto_26048 ) ) ( not ( = ?auto_26041 ?auto_26048 ) ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( IS-CRATE ?auto_26042 ) ( not ( = ?auto_26082 ?auto_26047 ) ) ( HOIST-AT ?auto_26081 ?auto_26082 ) ( AVAILABLE ?auto_26081 ) ( SURFACE-AT ?auto_26042 ?auto_26082 ) ( ON ?auto_26042 ?auto_26064 ) ( CLEAR ?auto_26042 ) ( not ( = ?auto_26040 ?auto_26042 ) ) ( not ( = ?auto_26040 ?auto_26064 ) ) ( not ( = ?auto_26042 ?auto_26064 ) ) ( not ( = ?auto_26044 ?auto_26081 ) ) ( IS-CRATE ?auto_26040 ) ( not ( = ?auto_26075 ?auto_26047 ) ) ( HOIST-AT ?auto_26074 ?auto_26075 ) ( AVAILABLE ?auto_26074 ) ( SURFACE-AT ?auto_26040 ?auto_26075 ) ( ON ?auto_26040 ?auto_26060 ) ( CLEAR ?auto_26040 ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26039 ?auto_26060 ) ) ( not ( = ?auto_26040 ?auto_26060 ) ) ( not ( = ?auto_26044 ?auto_26074 ) ) ( IS-CRATE ?auto_26039 ) ( not ( = ?auto_26083 ?auto_26047 ) ) ( HOIST-AT ?auto_26087 ?auto_26083 ) ( AVAILABLE ?auto_26087 ) ( SURFACE-AT ?auto_26039 ?auto_26083 ) ( ON ?auto_26039 ?auto_26049 ) ( CLEAR ?auto_26039 ) ( not ( = ?auto_26038 ?auto_26039 ) ) ( not ( = ?auto_26038 ?auto_26049 ) ) ( not ( = ?auto_26039 ?auto_26049 ) ) ( not ( = ?auto_26044 ?auto_26087 ) ) ( IS-CRATE ?auto_26038 ) ( not ( = ?auto_26066 ?auto_26047 ) ) ( HOIST-AT ?auto_26056 ?auto_26066 ) ( AVAILABLE ?auto_26056 ) ( SURFACE-AT ?auto_26038 ?auto_26066 ) ( ON ?auto_26038 ?auto_26053 ) ( CLEAR ?auto_26038 ) ( not ( = ?auto_26037 ?auto_26038 ) ) ( not ( = ?auto_26037 ?auto_26053 ) ) ( not ( = ?auto_26038 ?auto_26053 ) ) ( not ( = ?auto_26044 ?auto_26056 ) ) ( IS-CRATE ?auto_26037 ) ( not ( = ?auto_26051 ?auto_26047 ) ) ( HOIST-AT ?auto_26052 ?auto_26051 ) ( AVAILABLE ?auto_26052 ) ( SURFACE-AT ?auto_26037 ?auto_26051 ) ( ON ?auto_26037 ?auto_26088 ) ( CLEAR ?auto_26037 ) ( not ( = ?auto_26036 ?auto_26037 ) ) ( not ( = ?auto_26036 ?auto_26088 ) ) ( not ( = ?auto_26037 ?auto_26088 ) ) ( not ( = ?auto_26044 ?auto_26052 ) ) ( IS-CRATE ?auto_26036 ) ( not ( = ?auto_26085 ?auto_26047 ) ) ( HOIST-AT ?auto_26086 ?auto_26085 ) ( AVAILABLE ?auto_26086 ) ( SURFACE-AT ?auto_26036 ?auto_26085 ) ( ON ?auto_26036 ?auto_26057 ) ( CLEAR ?auto_26036 ) ( not ( = ?auto_26035 ?auto_26036 ) ) ( not ( = ?auto_26035 ?auto_26057 ) ) ( not ( = ?auto_26036 ?auto_26057 ) ) ( not ( = ?auto_26044 ?auto_26086 ) ) ( IS-CRATE ?auto_26035 ) ( not ( = ?auto_26055 ?auto_26047 ) ) ( HOIST-AT ?auto_26050 ?auto_26055 ) ( AVAILABLE ?auto_26050 ) ( SURFACE-AT ?auto_26035 ?auto_26055 ) ( ON ?auto_26035 ?auto_26062 ) ( CLEAR ?auto_26035 ) ( not ( = ?auto_26034 ?auto_26035 ) ) ( not ( = ?auto_26034 ?auto_26062 ) ) ( not ( = ?auto_26035 ?auto_26062 ) ) ( not ( = ?auto_26044 ?auto_26050 ) ) ( IS-CRATE ?auto_26034 ) ( not ( = ?auto_26058 ?auto_26047 ) ) ( HOIST-AT ?auto_26071 ?auto_26058 ) ( AVAILABLE ?auto_26071 ) ( SURFACE-AT ?auto_26034 ?auto_26058 ) ( ON ?auto_26034 ?auto_26059 ) ( CLEAR ?auto_26034 ) ( not ( = ?auto_26033 ?auto_26034 ) ) ( not ( = ?auto_26033 ?auto_26059 ) ) ( not ( = ?auto_26034 ?auto_26059 ) ) ( not ( = ?auto_26044 ?auto_26071 ) ) ( IS-CRATE ?auto_26033 ) ( not ( = ?auto_26070 ?auto_26047 ) ) ( HOIST-AT ?auto_26061 ?auto_26070 ) ( AVAILABLE ?auto_26061 ) ( SURFACE-AT ?auto_26033 ?auto_26070 ) ( ON ?auto_26033 ?auto_26063 ) ( CLEAR ?auto_26033 ) ( not ( = ?auto_26032 ?auto_26033 ) ) ( not ( = ?auto_26032 ?auto_26063 ) ) ( not ( = ?auto_26033 ?auto_26063 ) ) ( not ( = ?auto_26044 ?auto_26061 ) ) ( IS-CRATE ?auto_26032 ) ( not ( = ?auto_26080 ?auto_26047 ) ) ( HOIST-AT ?auto_26078 ?auto_26080 ) ( SURFACE-AT ?auto_26032 ?auto_26080 ) ( ON ?auto_26032 ?auto_26077 ) ( CLEAR ?auto_26032 ) ( not ( = ?auto_26031 ?auto_26032 ) ) ( not ( = ?auto_26031 ?auto_26077 ) ) ( not ( = ?auto_26032 ?auto_26077 ) ) ( not ( = ?auto_26044 ?auto_26078 ) ) ( IS-CRATE ?auto_26031 ) ( not ( = ?auto_26079 ?auto_26047 ) ) ( HOIST-AT ?auto_26073 ?auto_26079 ) ( AVAILABLE ?auto_26073 ) ( SURFACE-AT ?auto_26031 ?auto_26079 ) ( ON ?auto_26031 ?auto_26065 ) ( CLEAR ?auto_26031 ) ( not ( = ?auto_26030 ?auto_26031 ) ) ( not ( = ?auto_26030 ?auto_26065 ) ) ( not ( = ?auto_26031 ?auto_26065 ) ) ( not ( = ?auto_26044 ?auto_26073 ) ) ( IS-CRATE ?auto_26030 ) ( AVAILABLE ?auto_26078 ) ( SURFACE-AT ?auto_26030 ?auto_26080 ) ( ON ?auto_26030 ?auto_26068 ) ( CLEAR ?auto_26030 ) ( not ( = ?auto_26029 ?auto_26030 ) ) ( not ( = ?auto_26029 ?auto_26068 ) ) ( not ( = ?auto_26030 ?auto_26068 ) ) ( IS-CRATE ?auto_26029 ) ( not ( = ?auto_26072 ?auto_26047 ) ) ( HOIST-AT ?auto_26084 ?auto_26072 ) ( AVAILABLE ?auto_26084 ) ( SURFACE-AT ?auto_26029 ?auto_26072 ) ( ON ?auto_26029 ?auto_26054 ) ( CLEAR ?auto_26029 ) ( not ( = ?auto_26028 ?auto_26029 ) ) ( not ( = ?auto_26028 ?auto_26054 ) ) ( not ( = ?auto_26029 ?auto_26054 ) ) ( not ( = ?auto_26044 ?auto_26084 ) ) ( SURFACE-AT ?auto_26027 ?auto_26047 ) ( CLEAR ?auto_26027 ) ( IS-CRATE ?auto_26028 ) ( AVAILABLE ?auto_26044 ) ( not ( = ?auto_26076 ?auto_26047 ) ) ( HOIST-AT ?auto_26067 ?auto_26076 ) ( AVAILABLE ?auto_26067 ) ( SURFACE-AT ?auto_26028 ?auto_26076 ) ( ON ?auto_26028 ?auto_26069 ) ( CLEAR ?auto_26028 ) ( TRUCK-AT ?auto_26043 ?auto_26047 ) ( not ( = ?auto_26027 ?auto_26028 ) ) ( not ( = ?auto_26027 ?auto_26069 ) ) ( not ( = ?auto_26028 ?auto_26069 ) ) ( not ( = ?auto_26044 ?auto_26067 ) ) ( not ( = ?auto_26027 ?auto_26029 ) ) ( not ( = ?auto_26027 ?auto_26054 ) ) ( not ( = ?auto_26029 ?auto_26069 ) ) ( not ( = ?auto_26072 ?auto_26076 ) ) ( not ( = ?auto_26084 ?auto_26067 ) ) ( not ( = ?auto_26054 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26030 ) ) ( not ( = ?auto_26027 ?auto_26068 ) ) ( not ( = ?auto_26028 ?auto_26030 ) ) ( not ( = ?auto_26028 ?auto_26068 ) ) ( not ( = ?auto_26030 ?auto_26054 ) ) ( not ( = ?auto_26030 ?auto_26069 ) ) ( not ( = ?auto_26080 ?auto_26072 ) ) ( not ( = ?auto_26080 ?auto_26076 ) ) ( not ( = ?auto_26078 ?auto_26084 ) ) ( not ( = ?auto_26078 ?auto_26067 ) ) ( not ( = ?auto_26068 ?auto_26054 ) ) ( not ( = ?auto_26068 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26031 ) ) ( not ( = ?auto_26027 ?auto_26065 ) ) ( not ( = ?auto_26028 ?auto_26031 ) ) ( not ( = ?auto_26028 ?auto_26065 ) ) ( not ( = ?auto_26029 ?auto_26031 ) ) ( not ( = ?auto_26029 ?auto_26065 ) ) ( not ( = ?auto_26031 ?auto_26068 ) ) ( not ( = ?auto_26031 ?auto_26054 ) ) ( not ( = ?auto_26031 ?auto_26069 ) ) ( not ( = ?auto_26079 ?auto_26080 ) ) ( not ( = ?auto_26079 ?auto_26072 ) ) ( not ( = ?auto_26079 ?auto_26076 ) ) ( not ( = ?auto_26073 ?auto_26078 ) ) ( not ( = ?auto_26073 ?auto_26084 ) ) ( not ( = ?auto_26073 ?auto_26067 ) ) ( not ( = ?auto_26065 ?auto_26068 ) ) ( not ( = ?auto_26065 ?auto_26054 ) ) ( not ( = ?auto_26065 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26032 ) ) ( not ( = ?auto_26027 ?auto_26077 ) ) ( not ( = ?auto_26028 ?auto_26032 ) ) ( not ( = ?auto_26028 ?auto_26077 ) ) ( not ( = ?auto_26029 ?auto_26032 ) ) ( not ( = ?auto_26029 ?auto_26077 ) ) ( not ( = ?auto_26030 ?auto_26032 ) ) ( not ( = ?auto_26030 ?auto_26077 ) ) ( not ( = ?auto_26032 ?auto_26065 ) ) ( not ( = ?auto_26032 ?auto_26068 ) ) ( not ( = ?auto_26032 ?auto_26054 ) ) ( not ( = ?auto_26032 ?auto_26069 ) ) ( not ( = ?auto_26077 ?auto_26065 ) ) ( not ( = ?auto_26077 ?auto_26068 ) ) ( not ( = ?auto_26077 ?auto_26054 ) ) ( not ( = ?auto_26077 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26033 ) ) ( not ( = ?auto_26027 ?auto_26063 ) ) ( not ( = ?auto_26028 ?auto_26033 ) ) ( not ( = ?auto_26028 ?auto_26063 ) ) ( not ( = ?auto_26029 ?auto_26033 ) ) ( not ( = ?auto_26029 ?auto_26063 ) ) ( not ( = ?auto_26030 ?auto_26033 ) ) ( not ( = ?auto_26030 ?auto_26063 ) ) ( not ( = ?auto_26031 ?auto_26033 ) ) ( not ( = ?auto_26031 ?auto_26063 ) ) ( not ( = ?auto_26033 ?auto_26077 ) ) ( not ( = ?auto_26033 ?auto_26065 ) ) ( not ( = ?auto_26033 ?auto_26068 ) ) ( not ( = ?auto_26033 ?auto_26054 ) ) ( not ( = ?auto_26033 ?auto_26069 ) ) ( not ( = ?auto_26070 ?auto_26080 ) ) ( not ( = ?auto_26070 ?auto_26079 ) ) ( not ( = ?auto_26070 ?auto_26072 ) ) ( not ( = ?auto_26070 ?auto_26076 ) ) ( not ( = ?auto_26061 ?auto_26078 ) ) ( not ( = ?auto_26061 ?auto_26073 ) ) ( not ( = ?auto_26061 ?auto_26084 ) ) ( not ( = ?auto_26061 ?auto_26067 ) ) ( not ( = ?auto_26063 ?auto_26077 ) ) ( not ( = ?auto_26063 ?auto_26065 ) ) ( not ( = ?auto_26063 ?auto_26068 ) ) ( not ( = ?auto_26063 ?auto_26054 ) ) ( not ( = ?auto_26063 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26034 ) ) ( not ( = ?auto_26027 ?auto_26059 ) ) ( not ( = ?auto_26028 ?auto_26034 ) ) ( not ( = ?auto_26028 ?auto_26059 ) ) ( not ( = ?auto_26029 ?auto_26034 ) ) ( not ( = ?auto_26029 ?auto_26059 ) ) ( not ( = ?auto_26030 ?auto_26034 ) ) ( not ( = ?auto_26030 ?auto_26059 ) ) ( not ( = ?auto_26031 ?auto_26034 ) ) ( not ( = ?auto_26031 ?auto_26059 ) ) ( not ( = ?auto_26032 ?auto_26034 ) ) ( not ( = ?auto_26032 ?auto_26059 ) ) ( not ( = ?auto_26034 ?auto_26063 ) ) ( not ( = ?auto_26034 ?auto_26077 ) ) ( not ( = ?auto_26034 ?auto_26065 ) ) ( not ( = ?auto_26034 ?auto_26068 ) ) ( not ( = ?auto_26034 ?auto_26054 ) ) ( not ( = ?auto_26034 ?auto_26069 ) ) ( not ( = ?auto_26058 ?auto_26070 ) ) ( not ( = ?auto_26058 ?auto_26080 ) ) ( not ( = ?auto_26058 ?auto_26079 ) ) ( not ( = ?auto_26058 ?auto_26072 ) ) ( not ( = ?auto_26058 ?auto_26076 ) ) ( not ( = ?auto_26071 ?auto_26061 ) ) ( not ( = ?auto_26071 ?auto_26078 ) ) ( not ( = ?auto_26071 ?auto_26073 ) ) ( not ( = ?auto_26071 ?auto_26084 ) ) ( not ( = ?auto_26071 ?auto_26067 ) ) ( not ( = ?auto_26059 ?auto_26063 ) ) ( not ( = ?auto_26059 ?auto_26077 ) ) ( not ( = ?auto_26059 ?auto_26065 ) ) ( not ( = ?auto_26059 ?auto_26068 ) ) ( not ( = ?auto_26059 ?auto_26054 ) ) ( not ( = ?auto_26059 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26035 ) ) ( not ( = ?auto_26027 ?auto_26062 ) ) ( not ( = ?auto_26028 ?auto_26035 ) ) ( not ( = ?auto_26028 ?auto_26062 ) ) ( not ( = ?auto_26029 ?auto_26035 ) ) ( not ( = ?auto_26029 ?auto_26062 ) ) ( not ( = ?auto_26030 ?auto_26035 ) ) ( not ( = ?auto_26030 ?auto_26062 ) ) ( not ( = ?auto_26031 ?auto_26035 ) ) ( not ( = ?auto_26031 ?auto_26062 ) ) ( not ( = ?auto_26032 ?auto_26035 ) ) ( not ( = ?auto_26032 ?auto_26062 ) ) ( not ( = ?auto_26033 ?auto_26035 ) ) ( not ( = ?auto_26033 ?auto_26062 ) ) ( not ( = ?auto_26035 ?auto_26059 ) ) ( not ( = ?auto_26035 ?auto_26063 ) ) ( not ( = ?auto_26035 ?auto_26077 ) ) ( not ( = ?auto_26035 ?auto_26065 ) ) ( not ( = ?auto_26035 ?auto_26068 ) ) ( not ( = ?auto_26035 ?auto_26054 ) ) ( not ( = ?auto_26035 ?auto_26069 ) ) ( not ( = ?auto_26055 ?auto_26058 ) ) ( not ( = ?auto_26055 ?auto_26070 ) ) ( not ( = ?auto_26055 ?auto_26080 ) ) ( not ( = ?auto_26055 ?auto_26079 ) ) ( not ( = ?auto_26055 ?auto_26072 ) ) ( not ( = ?auto_26055 ?auto_26076 ) ) ( not ( = ?auto_26050 ?auto_26071 ) ) ( not ( = ?auto_26050 ?auto_26061 ) ) ( not ( = ?auto_26050 ?auto_26078 ) ) ( not ( = ?auto_26050 ?auto_26073 ) ) ( not ( = ?auto_26050 ?auto_26084 ) ) ( not ( = ?auto_26050 ?auto_26067 ) ) ( not ( = ?auto_26062 ?auto_26059 ) ) ( not ( = ?auto_26062 ?auto_26063 ) ) ( not ( = ?auto_26062 ?auto_26077 ) ) ( not ( = ?auto_26062 ?auto_26065 ) ) ( not ( = ?auto_26062 ?auto_26068 ) ) ( not ( = ?auto_26062 ?auto_26054 ) ) ( not ( = ?auto_26062 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26036 ) ) ( not ( = ?auto_26027 ?auto_26057 ) ) ( not ( = ?auto_26028 ?auto_26036 ) ) ( not ( = ?auto_26028 ?auto_26057 ) ) ( not ( = ?auto_26029 ?auto_26036 ) ) ( not ( = ?auto_26029 ?auto_26057 ) ) ( not ( = ?auto_26030 ?auto_26036 ) ) ( not ( = ?auto_26030 ?auto_26057 ) ) ( not ( = ?auto_26031 ?auto_26036 ) ) ( not ( = ?auto_26031 ?auto_26057 ) ) ( not ( = ?auto_26032 ?auto_26036 ) ) ( not ( = ?auto_26032 ?auto_26057 ) ) ( not ( = ?auto_26033 ?auto_26036 ) ) ( not ( = ?auto_26033 ?auto_26057 ) ) ( not ( = ?auto_26034 ?auto_26036 ) ) ( not ( = ?auto_26034 ?auto_26057 ) ) ( not ( = ?auto_26036 ?auto_26062 ) ) ( not ( = ?auto_26036 ?auto_26059 ) ) ( not ( = ?auto_26036 ?auto_26063 ) ) ( not ( = ?auto_26036 ?auto_26077 ) ) ( not ( = ?auto_26036 ?auto_26065 ) ) ( not ( = ?auto_26036 ?auto_26068 ) ) ( not ( = ?auto_26036 ?auto_26054 ) ) ( not ( = ?auto_26036 ?auto_26069 ) ) ( not ( = ?auto_26085 ?auto_26055 ) ) ( not ( = ?auto_26085 ?auto_26058 ) ) ( not ( = ?auto_26085 ?auto_26070 ) ) ( not ( = ?auto_26085 ?auto_26080 ) ) ( not ( = ?auto_26085 ?auto_26079 ) ) ( not ( = ?auto_26085 ?auto_26072 ) ) ( not ( = ?auto_26085 ?auto_26076 ) ) ( not ( = ?auto_26086 ?auto_26050 ) ) ( not ( = ?auto_26086 ?auto_26071 ) ) ( not ( = ?auto_26086 ?auto_26061 ) ) ( not ( = ?auto_26086 ?auto_26078 ) ) ( not ( = ?auto_26086 ?auto_26073 ) ) ( not ( = ?auto_26086 ?auto_26084 ) ) ( not ( = ?auto_26086 ?auto_26067 ) ) ( not ( = ?auto_26057 ?auto_26062 ) ) ( not ( = ?auto_26057 ?auto_26059 ) ) ( not ( = ?auto_26057 ?auto_26063 ) ) ( not ( = ?auto_26057 ?auto_26077 ) ) ( not ( = ?auto_26057 ?auto_26065 ) ) ( not ( = ?auto_26057 ?auto_26068 ) ) ( not ( = ?auto_26057 ?auto_26054 ) ) ( not ( = ?auto_26057 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26037 ) ) ( not ( = ?auto_26027 ?auto_26088 ) ) ( not ( = ?auto_26028 ?auto_26037 ) ) ( not ( = ?auto_26028 ?auto_26088 ) ) ( not ( = ?auto_26029 ?auto_26037 ) ) ( not ( = ?auto_26029 ?auto_26088 ) ) ( not ( = ?auto_26030 ?auto_26037 ) ) ( not ( = ?auto_26030 ?auto_26088 ) ) ( not ( = ?auto_26031 ?auto_26037 ) ) ( not ( = ?auto_26031 ?auto_26088 ) ) ( not ( = ?auto_26032 ?auto_26037 ) ) ( not ( = ?auto_26032 ?auto_26088 ) ) ( not ( = ?auto_26033 ?auto_26037 ) ) ( not ( = ?auto_26033 ?auto_26088 ) ) ( not ( = ?auto_26034 ?auto_26037 ) ) ( not ( = ?auto_26034 ?auto_26088 ) ) ( not ( = ?auto_26035 ?auto_26037 ) ) ( not ( = ?auto_26035 ?auto_26088 ) ) ( not ( = ?auto_26037 ?auto_26057 ) ) ( not ( = ?auto_26037 ?auto_26062 ) ) ( not ( = ?auto_26037 ?auto_26059 ) ) ( not ( = ?auto_26037 ?auto_26063 ) ) ( not ( = ?auto_26037 ?auto_26077 ) ) ( not ( = ?auto_26037 ?auto_26065 ) ) ( not ( = ?auto_26037 ?auto_26068 ) ) ( not ( = ?auto_26037 ?auto_26054 ) ) ( not ( = ?auto_26037 ?auto_26069 ) ) ( not ( = ?auto_26051 ?auto_26085 ) ) ( not ( = ?auto_26051 ?auto_26055 ) ) ( not ( = ?auto_26051 ?auto_26058 ) ) ( not ( = ?auto_26051 ?auto_26070 ) ) ( not ( = ?auto_26051 ?auto_26080 ) ) ( not ( = ?auto_26051 ?auto_26079 ) ) ( not ( = ?auto_26051 ?auto_26072 ) ) ( not ( = ?auto_26051 ?auto_26076 ) ) ( not ( = ?auto_26052 ?auto_26086 ) ) ( not ( = ?auto_26052 ?auto_26050 ) ) ( not ( = ?auto_26052 ?auto_26071 ) ) ( not ( = ?auto_26052 ?auto_26061 ) ) ( not ( = ?auto_26052 ?auto_26078 ) ) ( not ( = ?auto_26052 ?auto_26073 ) ) ( not ( = ?auto_26052 ?auto_26084 ) ) ( not ( = ?auto_26052 ?auto_26067 ) ) ( not ( = ?auto_26088 ?auto_26057 ) ) ( not ( = ?auto_26088 ?auto_26062 ) ) ( not ( = ?auto_26088 ?auto_26059 ) ) ( not ( = ?auto_26088 ?auto_26063 ) ) ( not ( = ?auto_26088 ?auto_26077 ) ) ( not ( = ?auto_26088 ?auto_26065 ) ) ( not ( = ?auto_26088 ?auto_26068 ) ) ( not ( = ?auto_26088 ?auto_26054 ) ) ( not ( = ?auto_26088 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26038 ) ) ( not ( = ?auto_26027 ?auto_26053 ) ) ( not ( = ?auto_26028 ?auto_26038 ) ) ( not ( = ?auto_26028 ?auto_26053 ) ) ( not ( = ?auto_26029 ?auto_26038 ) ) ( not ( = ?auto_26029 ?auto_26053 ) ) ( not ( = ?auto_26030 ?auto_26038 ) ) ( not ( = ?auto_26030 ?auto_26053 ) ) ( not ( = ?auto_26031 ?auto_26038 ) ) ( not ( = ?auto_26031 ?auto_26053 ) ) ( not ( = ?auto_26032 ?auto_26038 ) ) ( not ( = ?auto_26032 ?auto_26053 ) ) ( not ( = ?auto_26033 ?auto_26038 ) ) ( not ( = ?auto_26033 ?auto_26053 ) ) ( not ( = ?auto_26034 ?auto_26038 ) ) ( not ( = ?auto_26034 ?auto_26053 ) ) ( not ( = ?auto_26035 ?auto_26038 ) ) ( not ( = ?auto_26035 ?auto_26053 ) ) ( not ( = ?auto_26036 ?auto_26038 ) ) ( not ( = ?auto_26036 ?auto_26053 ) ) ( not ( = ?auto_26038 ?auto_26088 ) ) ( not ( = ?auto_26038 ?auto_26057 ) ) ( not ( = ?auto_26038 ?auto_26062 ) ) ( not ( = ?auto_26038 ?auto_26059 ) ) ( not ( = ?auto_26038 ?auto_26063 ) ) ( not ( = ?auto_26038 ?auto_26077 ) ) ( not ( = ?auto_26038 ?auto_26065 ) ) ( not ( = ?auto_26038 ?auto_26068 ) ) ( not ( = ?auto_26038 ?auto_26054 ) ) ( not ( = ?auto_26038 ?auto_26069 ) ) ( not ( = ?auto_26066 ?auto_26051 ) ) ( not ( = ?auto_26066 ?auto_26085 ) ) ( not ( = ?auto_26066 ?auto_26055 ) ) ( not ( = ?auto_26066 ?auto_26058 ) ) ( not ( = ?auto_26066 ?auto_26070 ) ) ( not ( = ?auto_26066 ?auto_26080 ) ) ( not ( = ?auto_26066 ?auto_26079 ) ) ( not ( = ?auto_26066 ?auto_26072 ) ) ( not ( = ?auto_26066 ?auto_26076 ) ) ( not ( = ?auto_26056 ?auto_26052 ) ) ( not ( = ?auto_26056 ?auto_26086 ) ) ( not ( = ?auto_26056 ?auto_26050 ) ) ( not ( = ?auto_26056 ?auto_26071 ) ) ( not ( = ?auto_26056 ?auto_26061 ) ) ( not ( = ?auto_26056 ?auto_26078 ) ) ( not ( = ?auto_26056 ?auto_26073 ) ) ( not ( = ?auto_26056 ?auto_26084 ) ) ( not ( = ?auto_26056 ?auto_26067 ) ) ( not ( = ?auto_26053 ?auto_26088 ) ) ( not ( = ?auto_26053 ?auto_26057 ) ) ( not ( = ?auto_26053 ?auto_26062 ) ) ( not ( = ?auto_26053 ?auto_26059 ) ) ( not ( = ?auto_26053 ?auto_26063 ) ) ( not ( = ?auto_26053 ?auto_26077 ) ) ( not ( = ?auto_26053 ?auto_26065 ) ) ( not ( = ?auto_26053 ?auto_26068 ) ) ( not ( = ?auto_26053 ?auto_26054 ) ) ( not ( = ?auto_26053 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26039 ) ) ( not ( = ?auto_26027 ?auto_26049 ) ) ( not ( = ?auto_26028 ?auto_26039 ) ) ( not ( = ?auto_26028 ?auto_26049 ) ) ( not ( = ?auto_26029 ?auto_26039 ) ) ( not ( = ?auto_26029 ?auto_26049 ) ) ( not ( = ?auto_26030 ?auto_26039 ) ) ( not ( = ?auto_26030 ?auto_26049 ) ) ( not ( = ?auto_26031 ?auto_26039 ) ) ( not ( = ?auto_26031 ?auto_26049 ) ) ( not ( = ?auto_26032 ?auto_26039 ) ) ( not ( = ?auto_26032 ?auto_26049 ) ) ( not ( = ?auto_26033 ?auto_26039 ) ) ( not ( = ?auto_26033 ?auto_26049 ) ) ( not ( = ?auto_26034 ?auto_26039 ) ) ( not ( = ?auto_26034 ?auto_26049 ) ) ( not ( = ?auto_26035 ?auto_26039 ) ) ( not ( = ?auto_26035 ?auto_26049 ) ) ( not ( = ?auto_26036 ?auto_26039 ) ) ( not ( = ?auto_26036 ?auto_26049 ) ) ( not ( = ?auto_26037 ?auto_26039 ) ) ( not ( = ?auto_26037 ?auto_26049 ) ) ( not ( = ?auto_26039 ?auto_26053 ) ) ( not ( = ?auto_26039 ?auto_26088 ) ) ( not ( = ?auto_26039 ?auto_26057 ) ) ( not ( = ?auto_26039 ?auto_26062 ) ) ( not ( = ?auto_26039 ?auto_26059 ) ) ( not ( = ?auto_26039 ?auto_26063 ) ) ( not ( = ?auto_26039 ?auto_26077 ) ) ( not ( = ?auto_26039 ?auto_26065 ) ) ( not ( = ?auto_26039 ?auto_26068 ) ) ( not ( = ?auto_26039 ?auto_26054 ) ) ( not ( = ?auto_26039 ?auto_26069 ) ) ( not ( = ?auto_26083 ?auto_26066 ) ) ( not ( = ?auto_26083 ?auto_26051 ) ) ( not ( = ?auto_26083 ?auto_26085 ) ) ( not ( = ?auto_26083 ?auto_26055 ) ) ( not ( = ?auto_26083 ?auto_26058 ) ) ( not ( = ?auto_26083 ?auto_26070 ) ) ( not ( = ?auto_26083 ?auto_26080 ) ) ( not ( = ?auto_26083 ?auto_26079 ) ) ( not ( = ?auto_26083 ?auto_26072 ) ) ( not ( = ?auto_26083 ?auto_26076 ) ) ( not ( = ?auto_26087 ?auto_26056 ) ) ( not ( = ?auto_26087 ?auto_26052 ) ) ( not ( = ?auto_26087 ?auto_26086 ) ) ( not ( = ?auto_26087 ?auto_26050 ) ) ( not ( = ?auto_26087 ?auto_26071 ) ) ( not ( = ?auto_26087 ?auto_26061 ) ) ( not ( = ?auto_26087 ?auto_26078 ) ) ( not ( = ?auto_26087 ?auto_26073 ) ) ( not ( = ?auto_26087 ?auto_26084 ) ) ( not ( = ?auto_26087 ?auto_26067 ) ) ( not ( = ?auto_26049 ?auto_26053 ) ) ( not ( = ?auto_26049 ?auto_26088 ) ) ( not ( = ?auto_26049 ?auto_26057 ) ) ( not ( = ?auto_26049 ?auto_26062 ) ) ( not ( = ?auto_26049 ?auto_26059 ) ) ( not ( = ?auto_26049 ?auto_26063 ) ) ( not ( = ?auto_26049 ?auto_26077 ) ) ( not ( = ?auto_26049 ?auto_26065 ) ) ( not ( = ?auto_26049 ?auto_26068 ) ) ( not ( = ?auto_26049 ?auto_26054 ) ) ( not ( = ?auto_26049 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26040 ) ) ( not ( = ?auto_26027 ?auto_26060 ) ) ( not ( = ?auto_26028 ?auto_26040 ) ) ( not ( = ?auto_26028 ?auto_26060 ) ) ( not ( = ?auto_26029 ?auto_26040 ) ) ( not ( = ?auto_26029 ?auto_26060 ) ) ( not ( = ?auto_26030 ?auto_26040 ) ) ( not ( = ?auto_26030 ?auto_26060 ) ) ( not ( = ?auto_26031 ?auto_26040 ) ) ( not ( = ?auto_26031 ?auto_26060 ) ) ( not ( = ?auto_26032 ?auto_26040 ) ) ( not ( = ?auto_26032 ?auto_26060 ) ) ( not ( = ?auto_26033 ?auto_26040 ) ) ( not ( = ?auto_26033 ?auto_26060 ) ) ( not ( = ?auto_26034 ?auto_26040 ) ) ( not ( = ?auto_26034 ?auto_26060 ) ) ( not ( = ?auto_26035 ?auto_26040 ) ) ( not ( = ?auto_26035 ?auto_26060 ) ) ( not ( = ?auto_26036 ?auto_26040 ) ) ( not ( = ?auto_26036 ?auto_26060 ) ) ( not ( = ?auto_26037 ?auto_26040 ) ) ( not ( = ?auto_26037 ?auto_26060 ) ) ( not ( = ?auto_26038 ?auto_26040 ) ) ( not ( = ?auto_26038 ?auto_26060 ) ) ( not ( = ?auto_26040 ?auto_26049 ) ) ( not ( = ?auto_26040 ?auto_26053 ) ) ( not ( = ?auto_26040 ?auto_26088 ) ) ( not ( = ?auto_26040 ?auto_26057 ) ) ( not ( = ?auto_26040 ?auto_26062 ) ) ( not ( = ?auto_26040 ?auto_26059 ) ) ( not ( = ?auto_26040 ?auto_26063 ) ) ( not ( = ?auto_26040 ?auto_26077 ) ) ( not ( = ?auto_26040 ?auto_26065 ) ) ( not ( = ?auto_26040 ?auto_26068 ) ) ( not ( = ?auto_26040 ?auto_26054 ) ) ( not ( = ?auto_26040 ?auto_26069 ) ) ( not ( = ?auto_26075 ?auto_26083 ) ) ( not ( = ?auto_26075 ?auto_26066 ) ) ( not ( = ?auto_26075 ?auto_26051 ) ) ( not ( = ?auto_26075 ?auto_26085 ) ) ( not ( = ?auto_26075 ?auto_26055 ) ) ( not ( = ?auto_26075 ?auto_26058 ) ) ( not ( = ?auto_26075 ?auto_26070 ) ) ( not ( = ?auto_26075 ?auto_26080 ) ) ( not ( = ?auto_26075 ?auto_26079 ) ) ( not ( = ?auto_26075 ?auto_26072 ) ) ( not ( = ?auto_26075 ?auto_26076 ) ) ( not ( = ?auto_26074 ?auto_26087 ) ) ( not ( = ?auto_26074 ?auto_26056 ) ) ( not ( = ?auto_26074 ?auto_26052 ) ) ( not ( = ?auto_26074 ?auto_26086 ) ) ( not ( = ?auto_26074 ?auto_26050 ) ) ( not ( = ?auto_26074 ?auto_26071 ) ) ( not ( = ?auto_26074 ?auto_26061 ) ) ( not ( = ?auto_26074 ?auto_26078 ) ) ( not ( = ?auto_26074 ?auto_26073 ) ) ( not ( = ?auto_26074 ?auto_26084 ) ) ( not ( = ?auto_26074 ?auto_26067 ) ) ( not ( = ?auto_26060 ?auto_26049 ) ) ( not ( = ?auto_26060 ?auto_26053 ) ) ( not ( = ?auto_26060 ?auto_26088 ) ) ( not ( = ?auto_26060 ?auto_26057 ) ) ( not ( = ?auto_26060 ?auto_26062 ) ) ( not ( = ?auto_26060 ?auto_26059 ) ) ( not ( = ?auto_26060 ?auto_26063 ) ) ( not ( = ?auto_26060 ?auto_26077 ) ) ( not ( = ?auto_26060 ?auto_26065 ) ) ( not ( = ?auto_26060 ?auto_26068 ) ) ( not ( = ?auto_26060 ?auto_26054 ) ) ( not ( = ?auto_26060 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26042 ) ) ( not ( = ?auto_26027 ?auto_26064 ) ) ( not ( = ?auto_26028 ?auto_26042 ) ) ( not ( = ?auto_26028 ?auto_26064 ) ) ( not ( = ?auto_26029 ?auto_26042 ) ) ( not ( = ?auto_26029 ?auto_26064 ) ) ( not ( = ?auto_26030 ?auto_26042 ) ) ( not ( = ?auto_26030 ?auto_26064 ) ) ( not ( = ?auto_26031 ?auto_26042 ) ) ( not ( = ?auto_26031 ?auto_26064 ) ) ( not ( = ?auto_26032 ?auto_26042 ) ) ( not ( = ?auto_26032 ?auto_26064 ) ) ( not ( = ?auto_26033 ?auto_26042 ) ) ( not ( = ?auto_26033 ?auto_26064 ) ) ( not ( = ?auto_26034 ?auto_26042 ) ) ( not ( = ?auto_26034 ?auto_26064 ) ) ( not ( = ?auto_26035 ?auto_26042 ) ) ( not ( = ?auto_26035 ?auto_26064 ) ) ( not ( = ?auto_26036 ?auto_26042 ) ) ( not ( = ?auto_26036 ?auto_26064 ) ) ( not ( = ?auto_26037 ?auto_26042 ) ) ( not ( = ?auto_26037 ?auto_26064 ) ) ( not ( = ?auto_26038 ?auto_26042 ) ) ( not ( = ?auto_26038 ?auto_26064 ) ) ( not ( = ?auto_26039 ?auto_26042 ) ) ( not ( = ?auto_26039 ?auto_26064 ) ) ( not ( = ?auto_26042 ?auto_26060 ) ) ( not ( = ?auto_26042 ?auto_26049 ) ) ( not ( = ?auto_26042 ?auto_26053 ) ) ( not ( = ?auto_26042 ?auto_26088 ) ) ( not ( = ?auto_26042 ?auto_26057 ) ) ( not ( = ?auto_26042 ?auto_26062 ) ) ( not ( = ?auto_26042 ?auto_26059 ) ) ( not ( = ?auto_26042 ?auto_26063 ) ) ( not ( = ?auto_26042 ?auto_26077 ) ) ( not ( = ?auto_26042 ?auto_26065 ) ) ( not ( = ?auto_26042 ?auto_26068 ) ) ( not ( = ?auto_26042 ?auto_26054 ) ) ( not ( = ?auto_26042 ?auto_26069 ) ) ( not ( = ?auto_26082 ?auto_26075 ) ) ( not ( = ?auto_26082 ?auto_26083 ) ) ( not ( = ?auto_26082 ?auto_26066 ) ) ( not ( = ?auto_26082 ?auto_26051 ) ) ( not ( = ?auto_26082 ?auto_26085 ) ) ( not ( = ?auto_26082 ?auto_26055 ) ) ( not ( = ?auto_26082 ?auto_26058 ) ) ( not ( = ?auto_26082 ?auto_26070 ) ) ( not ( = ?auto_26082 ?auto_26080 ) ) ( not ( = ?auto_26082 ?auto_26079 ) ) ( not ( = ?auto_26082 ?auto_26072 ) ) ( not ( = ?auto_26082 ?auto_26076 ) ) ( not ( = ?auto_26081 ?auto_26074 ) ) ( not ( = ?auto_26081 ?auto_26087 ) ) ( not ( = ?auto_26081 ?auto_26056 ) ) ( not ( = ?auto_26081 ?auto_26052 ) ) ( not ( = ?auto_26081 ?auto_26086 ) ) ( not ( = ?auto_26081 ?auto_26050 ) ) ( not ( = ?auto_26081 ?auto_26071 ) ) ( not ( = ?auto_26081 ?auto_26061 ) ) ( not ( = ?auto_26081 ?auto_26078 ) ) ( not ( = ?auto_26081 ?auto_26073 ) ) ( not ( = ?auto_26081 ?auto_26084 ) ) ( not ( = ?auto_26081 ?auto_26067 ) ) ( not ( = ?auto_26064 ?auto_26060 ) ) ( not ( = ?auto_26064 ?auto_26049 ) ) ( not ( = ?auto_26064 ?auto_26053 ) ) ( not ( = ?auto_26064 ?auto_26088 ) ) ( not ( = ?auto_26064 ?auto_26057 ) ) ( not ( = ?auto_26064 ?auto_26062 ) ) ( not ( = ?auto_26064 ?auto_26059 ) ) ( not ( = ?auto_26064 ?auto_26063 ) ) ( not ( = ?auto_26064 ?auto_26077 ) ) ( not ( = ?auto_26064 ?auto_26065 ) ) ( not ( = ?auto_26064 ?auto_26068 ) ) ( not ( = ?auto_26064 ?auto_26054 ) ) ( not ( = ?auto_26064 ?auto_26069 ) ) ( not ( = ?auto_26027 ?auto_26041 ) ) ( not ( = ?auto_26027 ?auto_26048 ) ) ( not ( = ?auto_26028 ?auto_26041 ) ) ( not ( = ?auto_26028 ?auto_26048 ) ) ( not ( = ?auto_26029 ?auto_26041 ) ) ( not ( = ?auto_26029 ?auto_26048 ) ) ( not ( = ?auto_26030 ?auto_26041 ) ) ( not ( = ?auto_26030 ?auto_26048 ) ) ( not ( = ?auto_26031 ?auto_26041 ) ) ( not ( = ?auto_26031 ?auto_26048 ) ) ( not ( = ?auto_26032 ?auto_26041 ) ) ( not ( = ?auto_26032 ?auto_26048 ) ) ( not ( = ?auto_26033 ?auto_26041 ) ) ( not ( = ?auto_26033 ?auto_26048 ) ) ( not ( = ?auto_26034 ?auto_26041 ) ) ( not ( = ?auto_26034 ?auto_26048 ) ) ( not ( = ?auto_26035 ?auto_26041 ) ) ( not ( = ?auto_26035 ?auto_26048 ) ) ( not ( = ?auto_26036 ?auto_26041 ) ) ( not ( = ?auto_26036 ?auto_26048 ) ) ( not ( = ?auto_26037 ?auto_26041 ) ) ( not ( = ?auto_26037 ?auto_26048 ) ) ( not ( = ?auto_26038 ?auto_26041 ) ) ( not ( = ?auto_26038 ?auto_26048 ) ) ( not ( = ?auto_26039 ?auto_26041 ) ) ( not ( = ?auto_26039 ?auto_26048 ) ) ( not ( = ?auto_26040 ?auto_26041 ) ) ( not ( = ?auto_26040 ?auto_26048 ) ) ( not ( = ?auto_26041 ?auto_26064 ) ) ( not ( = ?auto_26041 ?auto_26060 ) ) ( not ( = ?auto_26041 ?auto_26049 ) ) ( not ( = ?auto_26041 ?auto_26053 ) ) ( not ( = ?auto_26041 ?auto_26088 ) ) ( not ( = ?auto_26041 ?auto_26057 ) ) ( not ( = ?auto_26041 ?auto_26062 ) ) ( not ( = ?auto_26041 ?auto_26059 ) ) ( not ( = ?auto_26041 ?auto_26063 ) ) ( not ( = ?auto_26041 ?auto_26077 ) ) ( not ( = ?auto_26041 ?auto_26065 ) ) ( not ( = ?auto_26041 ?auto_26068 ) ) ( not ( = ?auto_26041 ?auto_26054 ) ) ( not ( = ?auto_26041 ?auto_26069 ) ) ( not ( = ?auto_26046 ?auto_26082 ) ) ( not ( = ?auto_26046 ?auto_26075 ) ) ( not ( = ?auto_26046 ?auto_26083 ) ) ( not ( = ?auto_26046 ?auto_26066 ) ) ( not ( = ?auto_26046 ?auto_26051 ) ) ( not ( = ?auto_26046 ?auto_26085 ) ) ( not ( = ?auto_26046 ?auto_26055 ) ) ( not ( = ?auto_26046 ?auto_26058 ) ) ( not ( = ?auto_26046 ?auto_26070 ) ) ( not ( = ?auto_26046 ?auto_26080 ) ) ( not ( = ?auto_26046 ?auto_26079 ) ) ( not ( = ?auto_26046 ?auto_26072 ) ) ( not ( = ?auto_26046 ?auto_26076 ) ) ( not ( = ?auto_26045 ?auto_26081 ) ) ( not ( = ?auto_26045 ?auto_26074 ) ) ( not ( = ?auto_26045 ?auto_26087 ) ) ( not ( = ?auto_26045 ?auto_26056 ) ) ( not ( = ?auto_26045 ?auto_26052 ) ) ( not ( = ?auto_26045 ?auto_26086 ) ) ( not ( = ?auto_26045 ?auto_26050 ) ) ( not ( = ?auto_26045 ?auto_26071 ) ) ( not ( = ?auto_26045 ?auto_26061 ) ) ( not ( = ?auto_26045 ?auto_26078 ) ) ( not ( = ?auto_26045 ?auto_26073 ) ) ( not ( = ?auto_26045 ?auto_26084 ) ) ( not ( = ?auto_26045 ?auto_26067 ) ) ( not ( = ?auto_26048 ?auto_26064 ) ) ( not ( = ?auto_26048 ?auto_26060 ) ) ( not ( = ?auto_26048 ?auto_26049 ) ) ( not ( = ?auto_26048 ?auto_26053 ) ) ( not ( = ?auto_26048 ?auto_26088 ) ) ( not ( = ?auto_26048 ?auto_26057 ) ) ( not ( = ?auto_26048 ?auto_26062 ) ) ( not ( = ?auto_26048 ?auto_26059 ) ) ( not ( = ?auto_26048 ?auto_26063 ) ) ( not ( = ?auto_26048 ?auto_26077 ) ) ( not ( = ?auto_26048 ?auto_26065 ) ) ( not ( = ?auto_26048 ?auto_26068 ) ) ( not ( = ?auto_26048 ?auto_26054 ) ) ( not ( = ?auto_26048 ?auto_26069 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26027 ?auto_26028 ?auto_26029 ?auto_26030 ?auto_26031 ?auto_26032 ?auto_26033 ?auto_26034 ?auto_26035 ?auto_26036 ?auto_26037 ?auto_26038 ?auto_26039 ?auto_26040 ?auto_26042 )
      ( MAKE-1CRATE ?auto_26042 ?auto_26041 )
      ( MAKE-15CRATE-VERIFY ?auto_26027 ?auto_26028 ?auto_26029 ?auto_26030 ?auto_26031 ?auto_26032 ?auto_26033 ?auto_26034 ?auto_26035 ?auto_26036 ?auto_26037 ?auto_26038 ?auto_26039 ?auto_26040 ?auto_26042 ?auto_26041 ) )
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
      ?auto_26122 - SURFACE
      ?auto_26123 - SURFACE
      ?auto_26124 - SURFACE
      ?auto_26125 - SURFACE
      ?auto_26126 - SURFACE
      ?auto_26127 - SURFACE
      ?auto_26128 - SURFACE
      ?auto_26129 - SURFACE
      ?auto_26131 - SURFACE
      ?auto_26130 - SURFACE
      ?auto_26132 - SURFACE
    )
    :vars
    (
      ?auto_26138 - HOIST
      ?auto_26136 - PLACE
      ?auto_26134 - PLACE
      ?auto_26133 - HOIST
      ?auto_26137 - SURFACE
      ?auto_26147 - PLACE
      ?auto_26167 - HOIST
      ?auto_26152 - SURFACE
      ?auto_26148 - PLACE
      ?auto_26145 - HOIST
      ?auto_26179 - SURFACE
      ?auto_26170 - PLACE
      ?auto_26173 - HOIST
      ?auto_26168 - SURFACE
      ?auto_26139 - SURFACE
      ?auto_26151 - PLACE
      ?auto_26158 - HOIST
      ?auto_26178 - SURFACE
      ?auto_26176 - PLACE
      ?auto_26153 - HOIST
      ?auto_26175 - SURFACE
      ?auto_26146 - PLACE
      ?auto_26169 - HOIST
      ?auto_26156 - SURFACE
      ?auto_26154 - PLACE
      ?auto_26155 - HOIST
      ?auto_26141 - SURFACE
      ?auto_26172 - PLACE
      ?auto_26171 - HOIST
      ?auto_26160 - SURFACE
      ?auto_26165 - PLACE
      ?auto_26161 - HOIST
      ?auto_26174 - SURFACE
      ?auto_26144 - PLACE
      ?auto_26150 - HOIST
      ?auto_26163 - SURFACE
      ?auto_26166 - PLACE
      ?auto_26177 - HOIST
      ?auto_26162 - SURFACE
      ?auto_26157 - SURFACE
      ?auto_26140 - PLACE
      ?auto_26142 - HOIST
      ?auto_26159 - SURFACE
      ?auto_26143 - PLACE
      ?auto_26164 - HOIST
      ?auto_26149 - SURFACE
      ?auto_26135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26138 ?auto_26136 ) ( IS-CRATE ?auto_26132 ) ( not ( = ?auto_26134 ?auto_26136 ) ) ( HOIST-AT ?auto_26133 ?auto_26134 ) ( SURFACE-AT ?auto_26132 ?auto_26134 ) ( ON ?auto_26132 ?auto_26137 ) ( CLEAR ?auto_26132 ) ( not ( = ?auto_26130 ?auto_26132 ) ) ( not ( = ?auto_26130 ?auto_26137 ) ) ( not ( = ?auto_26132 ?auto_26137 ) ) ( not ( = ?auto_26138 ?auto_26133 ) ) ( IS-CRATE ?auto_26130 ) ( not ( = ?auto_26147 ?auto_26136 ) ) ( HOIST-AT ?auto_26167 ?auto_26147 ) ( AVAILABLE ?auto_26167 ) ( SURFACE-AT ?auto_26130 ?auto_26147 ) ( ON ?auto_26130 ?auto_26152 ) ( CLEAR ?auto_26130 ) ( not ( = ?auto_26131 ?auto_26130 ) ) ( not ( = ?auto_26131 ?auto_26152 ) ) ( not ( = ?auto_26130 ?auto_26152 ) ) ( not ( = ?auto_26138 ?auto_26167 ) ) ( IS-CRATE ?auto_26131 ) ( not ( = ?auto_26148 ?auto_26136 ) ) ( HOIST-AT ?auto_26145 ?auto_26148 ) ( AVAILABLE ?auto_26145 ) ( SURFACE-AT ?auto_26131 ?auto_26148 ) ( ON ?auto_26131 ?auto_26179 ) ( CLEAR ?auto_26131 ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( not ( = ?auto_26129 ?auto_26179 ) ) ( not ( = ?auto_26131 ?auto_26179 ) ) ( not ( = ?auto_26138 ?auto_26145 ) ) ( IS-CRATE ?auto_26129 ) ( not ( = ?auto_26170 ?auto_26136 ) ) ( HOIST-AT ?auto_26173 ?auto_26170 ) ( AVAILABLE ?auto_26173 ) ( SURFACE-AT ?auto_26129 ?auto_26170 ) ( ON ?auto_26129 ?auto_26168 ) ( CLEAR ?auto_26129 ) ( not ( = ?auto_26128 ?auto_26129 ) ) ( not ( = ?auto_26128 ?auto_26168 ) ) ( not ( = ?auto_26129 ?auto_26168 ) ) ( not ( = ?auto_26138 ?auto_26173 ) ) ( IS-CRATE ?auto_26128 ) ( AVAILABLE ?auto_26133 ) ( SURFACE-AT ?auto_26128 ?auto_26134 ) ( ON ?auto_26128 ?auto_26139 ) ( CLEAR ?auto_26128 ) ( not ( = ?auto_26127 ?auto_26128 ) ) ( not ( = ?auto_26127 ?auto_26139 ) ) ( not ( = ?auto_26128 ?auto_26139 ) ) ( IS-CRATE ?auto_26127 ) ( not ( = ?auto_26151 ?auto_26136 ) ) ( HOIST-AT ?auto_26158 ?auto_26151 ) ( AVAILABLE ?auto_26158 ) ( SURFACE-AT ?auto_26127 ?auto_26151 ) ( ON ?auto_26127 ?auto_26178 ) ( CLEAR ?auto_26127 ) ( not ( = ?auto_26126 ?auto_26127 ) ) ( not ( = ?auto_26126 ?auto_26178 ) ) ( not ( = ?auto_26127 ?auto_26178 ) ) ( not ( = ?auto_26138 ?auto_26158 ) ) ( IS-CRATE ?auto_26126 ) ( not ( = ?auto_26176 ?auto_26136 ) ) ( HOIST-AT ?auto_26153 ?auto_26176 ) ( AVAILABLE ?auto_26153 ) ( SURFACE-AT ?auto_26126 ?auto_26176 ) ( ON ?auto_26126 ?auto_26175 ) ( CLEAR ?auto_26126 ) ( not ( = ?auto_26125 ?auto_26126 ) ) ( not ( = ?auto_26125 ?auto_26175 ) ) ( not ( = ?auto_26126 ?auto_26175 ) ) ( not ( = ?auto_26138 ?auto_26153 ) ) ( IS-CRATE ?auto_26125 ) ( not ( = ?auto_26146 ?auto_26136 ) ) ( HOIST-AT ?auto_26169 ?auto_26146 ) ( AVAILABLE ?auto_26169 ) ( SURFACE-AT ?auto_26125 ?auto_26146 ) ( ON ?auto_26125 ?auto_26156 ) ( CLEAR ?auto_26125 ) ( not ( = ?auto_26124 ?auto_26125 ) ) ( not ( = ?auto_26124 ?auto_26156 ) ) ( not ( = ?auto_26125 ?auto_26156 ) ) ( not ( = ?auto_26138 ?auto_26169 ) ) ( IS-CRATE ?auto_26124 ) ( not ( = ?auto_26154 ?auto_26136 ) ) ( HOIST-AT ?auto_26155 ?auto_26154 ) ( AVAILABLE ?auto_26155 ) ( SURFACE-AT ?auto_26124 ?auto_26154 ) ( ON ?auto_26124 ?auto_26141 ) ( CLEAR ?auto_26124 ) ( not ( = ?auto_26123 ?auto_26124 ) ) ( not ( = ?auto_26123 ?auto_26141 ) ) ( not ( = ?auto_26124 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26155 ) ) ( IS-CRATE ?auto_26123 ) ( not ( = ?auto_26172 ?auto_26136 ) ) ( HOIST-AT ?auto_26171 ?auto_26172 ) ( AVAILABLE ?auto_26171 ) ( SURFACE-AT ?auto_26123 ?auto_26172 ) ( ON ?auto_26123 ?auto_26160 ) ( CLEAR ?auto_26123 ) ( not ( = ?auto_26122 ?auto_26123 ) ) ( not ( = ?auto_26122 ?auto_26160 ) ) ( not ( = ?auto_26123 ?auto_26160 ) ) ( not ( = ?auto_26138 ?auto_26171 ) ) ( IS-CRATE ?auto_26122 ) ( not ( = ?auto_26165 ?auto_26136 ) ) ( HOIST-AT ?auto_26161 ?auto_26165 ) ( AVAILABLE ?auto_26161 ) ( SURFACE-AT ?auto_26122 ?auto_26165 ) ( ON ?auto_26122 ?auto_26174 ) ( CLEAR ?auto_26122 ) ( not ( = ?auto_26121 ?auto_26122 ) ) ( not ( = ?auto_26121 ?auto_26174 ) ) ( not ( = ?auto_26122 ?auto_26174 ) ) ( not ( = ?auto_26138 ?auto_26161 ) ) ( IS-CRATE ?auto_26121 ) ( not ( = ?auto_26144 ?auto_26136 ) ) ( HOIST-AT ?auto_26150 ?auto_26144 ) ( SURFACE-AT ?auto_26121 ?auto_26144 ) ( ON ?auto_26121 ?auto_26163 ) ( CLEAR ?auto_26121 ) ( not ( = ?auto_26120 ?auto_26121 ) ) ( not ( = ?auto_26120 ?auto_26163 ) ) ( not ( = ?auto_26121 ?auto_26163 ) ) ( not ( = ?auto_26138 ?auto_26150 ) ) ( IS-CRATE ?auto_26120 ) ( not ( = ?auto_26166 ?auto_26136 ) ) ( HOIST-AT ?auto_26177 ?auto_26166 ) ( AVAILABLE ?auto_26177 ) ( SURFACE-AT ?auto_26120 ?auto_26166 ) ( ON ?auto_26120 ?auto_26162 ) ( CLEAR ?auto_26120 ) ( not ( = ?auto_26119 ?auto_26120 ) ) ( not ( = ?auto_26119 ?auto_26162 ) ) ( not ( = ?auto_26120 ?auto_26162 ) ) ( not ( = ?auto_26138 ?auto_26177 ) ) ( IS-CRATE ?auto_26119 ) ( AVAILABLE ?auto_26150 ) ( SURFACE-AT ?auto_26119 ?auto_26144 ) ( ON ?auto_26119 ?auto_26157 ) ( CLEAR ?auto_26119 ) ( not ( = ?auto_26118 ?auto_26119 ) ) ( not ( = ?auto_26118 ?auto_26157 ) ) ( not ( = ?auto_26119 ?auto_26157 ) ) ( IS-CRATE ?auto_26118 ) ( not ( = ?auto_26140 ?auto_26136 ) ) ( HOIST-AT ?auto_26142 ?auto_26140 ) ( AVAILABLE ?auto_26142 ) ( SURFACE-AT ?auto_26118 ?auto_26140 ) ( ON ?auto_26118 ?auto_26159 ) ( CLEAR ?auto_26118 ) ( not ( = ?auto_26117 ?auto_26118 ) ) ( not ( = ?auto_26117 ?auto_26159 ) ) ( not ( = ?auto_26118 ?auto_26159 ) ) ( not ( = ?auto_26138 ?auto_26142 ) ) ( SURFACE-AT ?auto_26116 ?auto_26136 ) ( CLEAR ?auto_26116 ) ( IS-CRATE ?auto_26117 ) ( AVAILABLE ?auto_26138 ) ( not ( = ?auto_26143 ?auto_26136 ) ) ( HOIST-AT ?auto_26164 ?auto_26143 ) ( AVAILABLE ?auto_26164 ) ( SURFACE-AT ?auto_26117 ?auto_26143 ) ( ON ?auto_26117 ?auto_26149 ) ( CLEAR ?auto_26117 ) ( TRUCK-AT ?auto_26135 ?auto_26136 ) ( not ( = ?auto_26116 ?auto_26117 ) ) ( not ( = ?auto_26116 ?auto_26149 ) ) ( not ( = ?auto_26117 ?auto_26149 ) ) ( not ( = ?auto_26138 ?auto_26164 ) ) ( not ( = ?auto_26116 ?auto_26118 ) ) ( not ( = ?auto_26116 ?auto_26159 ) ) ( not ( = ?auto_26118 ?auto_26149 ) ) ( not ( = ?auto_26140 ?auto_26143 ) ) ( not ( = ?auto_26142 ?auto_26164 ) ) ( not ( = ?auto_26159 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26119 ) ) ( not ( = ?auto_26116 ?auto_26157 ) ) ( not ( = ?auto_26117 ?auto_26119 ) ) ( not ( = ?auto_26117 ?auto_26157 ) ) ( not ( = ?auto_26119 ?auto_26159 ) ) ( not ( = ?auto_26119 ?auto_26149 ) ) ( not ( = ?auto_26144 ?auto_26140 ) ) ( not ( = ?auto_26144 ?auto_26143 ) ) ( not ( = ?auto_26150 ?auto_26142 ) ) ( not ( = ?auto_26150 ?auto_26164 ) ) ( not ( = ?auto_26157 ?auto_26159 ) ) ( not ( = ?auto_26157 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26120 ) ) ( not ( = ?auto_26116 ?auto_26162 ) ) ( not ( = ?auto_26117 ?auto_26120 ) ) ( not ( = ?auto_26117 ?auto_26162 ) ) ( not ( = ?auto_26118 ?auto_26120 ) ) ( not ( = ?auto_26118 ?auto_26162 ) ) ( not ( = ?auto_26120 ?auto_26157 ) ) ( not ( = ?auto_26120 ?auto_26159 ) ) ( not ( = ?auto_26120 ?auto_26149 ) ) ( not ( = ?auto_26166 ?auto_26144 ) ) ( not ( = ?auto_26166 ?auto_26140 ) ) ( not ( = ?auto_26166 ?auto_26143 ) ) ( not ( = ?auto_26177 ?auto_26150 ) ) ( not ( = ?auto_26177 ?auto_26142 ) ) ( not ( = ?auto_26177 ?auto_26164 ) ) ( not ( = ?auto_26162 ?auto_26157 ) ) ( not ( = ?auto_26162 ?auto_26159 ) ) ( not ( = ?auto_26162 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26121 ) ) ( not ( = ?auto_26116 ?auto_26163 ) ) ( not ( = ?auto_26117 ?auto_26121 ) ) ( not ( = ?auto_26117 ?auto_26163 ) ) ( not ( = ?auto_26118 ?auto_26121 ) ) ( not ( = ?auto_26118 ?auto_26163 ) ) ( not ( = ?auto_26119 ?auto_26121 ) ) ( not ( = ?auto_26119 ?auto_26163 ) ) ( not ( = ?auto_26121 ?auto_26162 ) ) ( not ( = ?auto_26121 ?auto_26157 ) ) ( not ( = ?auto_26121 ?auto_26159 ) ) ( not ( = ?auto_26121 ?auto_26149 ) ) ( not ( = ?auto_26163 ?auto_26162 ) ) ( not ( = ?auto_26163 ?auto_26157 ) ) ( not ( = ?auto_26163 ?auto_26159 ) ) ( not ( = ?auto_26163 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26122 ) ) ( not ( = ?auto_26116 ?auto_26174 ) ) ( not ( = ?auto_26117 ?auto_26122 ) ) ( not ( = ?auto_26117 ?auto_26174 ) ) ( not ( = ?auto_26118 ?auto_26122 ) ) ( not ( = ?auto_26118 ?auto_26174 ) ) ( not ( = ?auto_26119 ?auto_26122 ) ) ( not ( = ?auto_26119 ?auto_26174 ) ) ( not ( = ?auto_26120 ?auto_26122 ) ) ( not ( = ?auto_26120 ?auto_26174 ) ) ( not ( = ?auto_26122 ?auto_26163 ) ) ( not ( = ?auto_26122 ?auto_26162 ) ) ( not ( = ?auto_26122 ?auto_26157 ) ) ( not ( = ?auto_26122 ?auto_26159 ) ) ( not ( = ?auto_26122 ?auto_26149 ) ) ( not ( = ?auto_26165 ?auto_26144 ) ) ( not ( = ?auto_26165 ?auto_26166 ) ) ( not ( = ?auto_26165 ?auto_26140 ) ) ( not ( = ?auto_26165 ?auto_26143 ) ) ( not ( = ?auto_26161 ?auto_26150 ) ) ( not ( = ?auto_26161 ?auto_26177 ) ) ( not ( = ?auto_26161 ?auto_26142 ) ) ( not ( = ?auto_26161 ?auto_26164 ) ) ( not ( = ?auto_26174 ?auto_26163 ) ) ( not ( = ?auto_26174 ?auto_26162 ) ) ( not ( = ?auto_26174 ?auto_26157 ) ) ( not ( = ?auto_26174 ?auto_26159 ) ) ( not ( = ?auto_26174 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26123 ) ) ( not ( = ?auto_26116 ?auto_26160 ) ) ( not ( = ?auto_26117 ?auto_26123 ) ) ( not ( = ?auto_26117 ?auto_26160 ) ) ( not ( = ?auto_26118 ?auto_26123 ) ) ( not ( = ?auto_26118 ?auto_26160 ) ) ( not ( = ?auto_26119 ?auto_26123 ) ) ( not ( = ?auto_26119 ?auto_26160 ) ) ( not ( = ?auto_26120 ?auto_26123 ) ) ( not ( = ?auto_26120 ?auto_26160 ) ) ( not ( = ?auto_26121 ?auto_26123 ) ) ( not ( = ?auto_26121 ?auto_26160 ) ) ( not ( = ?auto_26123 ?auto_26174 ) ) ( not ( = ?auto_26123 ?auto_26163 ) ) ( not ( = ?auto_26123 ?auto_26162 ) ) ( not ( = ?auto_26123 ?auto_26157 ) ) ( not ( = ?auto_26123 ?auto_26159 ) ) ( not ( = ?auto_26123 ?auto_26149 ) ) ( not ( = ?auto_26172 ?auto_26165 ) ) ( not ( = ?auto_26172 ?auto_26144 ) ) ( not ( = ?auto_26172 ?auto_26166 ) ) ( not ( = ?auto_26172 ?auto_26140 ) ) ( not ( = ?auto_26172 ?auto_26143 ) ) ( not ( = ?auto_26171 ?auto_26161 ) ) ( not ( = ?auto_26171 ?auto_26150 ) ) ( not ( = ?auto_26171 ?auto_26177 ) ) ( not ( = ?auto_26171 ?auto_26142 ) ) ( not ( = ?auto_26171 ?auto_26164 ) ) ( not ( = ?auto_26160 ?auto_26174 ) ) ( not ( = ?auto_26160 ?auto_26163 ) ) ( not ( = ?auto_26160 ?auto_26162 ) ) ( not ( = ?auto_26160 ?auto_26157 ) ) ( not ( = ?auto_26160 ?auto_26159 ) ) ( not ( = ?auto_26160 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26124 ) ) ( not ( = ?auto_26116 ?auto_26141 ) ) ( not ( = ?auto_26117 ?auto_26124 ) ) ( not ( = ?auto_26117 ?auto_26141 ) ) ( not ( = ?auto_26118 ?auto_26124 ) ) ( not ( = ?auto_26118 ?auto_26141 ) ) ( not ( = ?auto_26119 ?auto_26124 ) ) ( not ( = ?auto_26119 ?auto_26141 ) ) ( not ( = ?auto_26120 ?auto_26124 ) ) ( not ( = ?auto_26120 ?auto_26141 ) ) ( not ( = ?auto_26121 ?auto_26124 ) ) ( not ( = ?auto_26121 ?auto_26141 ) ) ( not ( = ?auto_26122 ?auto_26124 ) ) ( not ( = ?auto_26122 ?auto_26141 ) ) ( not ( = ?auto_26124 ?auto_26160 ) ) ( not ( = ?auto_26124 ?auto_26174 ) ) ( not ( = ?auto_26124 ?auto_26163 ) ) ( not ( = ?auto_26124 ?auto_26162 ) ) ( not ( = ?auto_26124 ?auto_26157 ) ) ( not ( = ?auto_26124 ?auto_26159 ) ) ( not ( = ?auto_26124 ?auto_26149 ) ) ( not ( = ?auto_26154 ?auto_26172 ) ) ( not ( = ?auto_26154 ?auto_26165 ) ) ( not ( = ?auto_26154 ?auto_26144 ) ) ( not ( = ?auto_26154 ?auto_26166 ) ) ( not ( = ?auto_26154 ?auto_26140 ) ) ( not ( = ?auto_26154 ?auto_26143 ) ) ( not ( = ?auto_26155 ?auto_26171 ) ) ( not ( = ?auto_26155 ?auto_26161 ) ) ( not ( = ?auto_26155 ?auto_26150 ) ) ( not ( = ?auto_26155 ?auto_26177 ) ) ( not ( = ?auto_26155 ?auto_26142 ) ) ( not ( = ?auto_26155 ?auto_26164 ) ) ( not ( = ?auto_26141 ?auto_26160 ) ) ( not ( = ?auto_26141 ?auto_26174 ) ) ( not ( = ?auto_26141 ?auto_26163 ) ) ( not ( = ?auto_26141 ?auto_26162 ) ) ( not ( = ?auto_26141 ?auto_26157 ) ) ( not ( = ?auto_26141 ?auto_26159 ) ) ( not ( = ?auto_26141 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26125 ) ) ( not ( = ?auto_26116 ?auto_26156 ) ) ( not ( = ?auto_26117 ?auto_26125 ) ) ( not ( = ?auto_26117 ?auto_26156 ) ) ( not ( = ?auto_26118 ?auto_26125 ) ) ( not ( = ?auto_26118 ?auto_26156 ) ) ( not ( = ?auto_26119 ?auto_26125 ) ) ( not ( = ?auto_26119 ?auto_26156 ) ) ( not ( = ?auto_26120 ?auto_26125 ) ) ( not ( = ?auto_26120 ?auto_26156 ) ) ( not ( = ?auto_26121 ?auto_26125 ) ) ( not ( = ?auto_26121 ?auto_26156 ) ) ( not ( = ?auto_26122 ?auto_26125 ) ) ( not ( = ?auto_26122 ?auto_26156 ) ) ( not ( = ?auto_26123 ?auto_26125 ) ) ( not ( = ?auto_26123 ?auto_26156 ) ) ( not ( = ?auto_26125 ?auto_26141 ) ) ( not ( = ?auto_26125 ?auto_26160 ) ) ( not ( = ?auto_26125 ?auto_26174 ) ) ( not ( = ?auto_26125 ?auto_26163 ) ) ( not ( = ?auto_26125 ?auto_26162 ) ) ( not ( = ?auto_26125 ?auto_26157 ) ) ( not ( = ?auto_26125 ?auto_26159 ) ) ( not ( = ?auto_26125 ?auto_26149 ) ) ( not ( = ?auto_26146 ?auto_26154 ) ) ( not ( = ?auto_26146 ?auto_26172 ) ) ( not ( = ?auto_26146 ?auto_26165 ) ) ( not ( = ?auto_26146 ?auto_26144 ) ) ( not ( = ?auto_26146 ?auto_26166 ) ) ( not ( = ?auto_26146 ?auto_26140 ) ) ( not ( = ?auto_26146 ?auto_26143 ) ) ( not ( = ?auto_26169 ?auto_26155 ) ) ( not ( = ?auto_26169 ?auto_26171 ) ) ( not ( = ?auto_26169 ?auto_26161 ) ) ( not ( = ?auto_26169 ?auto_26150 ) ) ( not ( = ?auto_26169 ?auto_26177 ) ) ( not ( = ?auto_26169 ?auto_26142 ) ) ( not ( = ?auto_26169 ?auto_26164 ) ) ( not ( = ?auto_26156 ?auto_26141 ) ) ( not ( = ?auto_26156 ?auto_26160 ) ) ( not ( = ?auto_26156 ?auto_26174 ) ) ( not ( = ?auto_26156 ?auto_26163 ) ) ( not ( = ?auto_26156 ?auto_26162 ) ) ( not ( = ?auto_26156 ?auto_26157 ) ) ( not ( = ?auto_26156 ?auto_26159 ) ) ( not ( = ?auto_26156 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26126 ) ) ( not ( = ?auto_26116 ?auto_26175 ) ) ( not ( = ?auto_26117 ?auto_26126 ) ) ( not ( = ?auto_26117 ?auto_26175 ) ) ( not ( = ?auto_26118 ?auto_26126 ) ) ( not ( = ?auto_26118 ?auto_26175 ) ) ( not ( = ?auto_26119 ?auto_26126 ) ) ( not ( = ?auto_26119 ?auto_26175 ) ) ( not ( = ?auto_26120 ?auto_26126 ) ) ( not ( = ?auto_26120 ?auto_26175 ) ) ( not ( = ?auto_26121 ?auto_26126 ) ) ( not ( = ?auto_26121 ?auto_26175 ) ) ( not ( = ?auto_26122 ?auto_26126 ) ) ( not ( = ?auto_26122 ?auto_26175 ) ) ( not ( = ?auto_26123 ?auto_26126 ) ) ( not ( = ?auto_26123 ?auto_26175 ) ) ( not ( = ?auto_26124 ?auto_26126 ) ) ( not ( = ?auto_26124 ?auto_26175 ) ) ( not ( = ?auto_26126 ?auto_26156 ) ) ( not ( = ?auto_26126 ?auto_26141 ) ) ( not ( = ?auto_26126 ?auto_26160 ) ) ( not ( = ?auto_26126 ?auto_26174 ) ) ( not ( = ?auto_26126 ?auto_26163 ) ) ( not ( = ?auto_26126 ?auto_26162 ) ) ( not ( = ?auto_26126 ?auto_26157 ) ) ( not ( = ?auto_26126 ?auto_26159 ) ) ( not ( = ?auto_26126 ?auto_26149 ) ) ( not ( = ?auto_26176 ?auto_26146 ) ) ( not ( = ?auto_26176 ?auto_26154 ) ) ( not ( = ?auto_26176 ?auto_26172 ) ) ( not ( = ?auto_26176 ?auto_26165 ) ) ( not ( = ?auto_26176 ?auto_26144 ) ) ( not ( = ?auto_26176 ?auto_26166 ) ) ( not ( = ?auto_26176 ?auto_26140 ) ) ( not ( = ?auto_26176 ?auto_26143 ) ) ( not ( = ?auto_26153 ?auto_26169 ) ) ( not ( = ?auto_26153 ?auto_26155 ) ) ( not ( = ?auto_26153 ?auto_26171 ) ) ( not ( = ?auto_26153 ?auto_26161 ) ) ( not ( = ?auto_26153 ?auto_26150 ) ) ( not ( = ?auto_26153 ?auto_26177 ) ) ( not ( = ?auto_26153 ?auto_26142 ) ) ( not ( = ?auto_26153 ?auto_26164 ) ) ( not ( = ?auto_26175 ?auto_26156 ) ) ( not ( = ?auto_26175 ?auto_26141 ) ) ( not ( = ?auto_26175 ?auto_26160 ) ) ( not ( = ?auto_26175 ?auto_26174 ) ) ( not ( = ?auto_26175 ?auto_26163 ) ) ( not ( = ?auto_26175 ?auto_26162 ) ) ( not ( = ?auto_26175 ?auto_26157 ) ) ( not ( = ?auto_26175 ?auto_26159 ) ) ( not ( = ?auto_26175 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26127 ) ) ( not ( = ?auto_26116 ?auto_26178 ) ) ( not ( = ?auto_26117 ?auto_26127 ) ) ( not ( = ?auto_26117 ?auto_26178 ) ) ( not ( = ?auto_26118 ?auto_26127 ) ) ( not ( = ?auto_26118 ?auto_26178 ) ) ( not ( = ?auto_26119 ?auto_26127 ) ) ( not ( = ?auto_26119 ?auto_26178 ) ) ( not ( = ?auto_26120 ?auto_26127 ) ) ( not ( = ?auto_26120 ?auto_26178 ) ) ( not ( = ?auto_26121 ?auto_26127 ) ) ( not ( = ?auto_26121 ?auto_26178 ) ) ( not ( = ?auto_26122 ?auto_26127 ) ) ( not ( = ?auto_26122 ?auto_26178 ) ) ( not ( = ?auto_26123 ?auto_26127 ) ) ( not ( = ?auto_26123 ?auto_26178 ) ) ( not ( = ?auto_26124 ?auto_26127 ) ) ( not ( = ?auto_26124 ?auto_26178 ) ) ( not ( = ?auto_26125 ?auto_26127 ) ) ( not ( = ?auto_26125 ?auto_26178 ) ) ( not ( = ?auto_26127 ?auto_26175 ) ) ( not ( = ?auto_26127 ?auto_26156 ) ) ( not ( = ?auto_26127 ?auto_26141 ) ) ( not ( = ?auto_26127 ?auto_26160 ) ) ( not ( = ?auto_26127 ?auto_26174 ) ) ( not ( = ?auto_26127 ?auto_26163 ) ) ( not ( = ?auto_26127 ?auto_26162 ) ) ( not ( = ?auto_26127 ?auto_26157 ) ) ( not ( = ?auto_26127 ?auto_26159 ) ) ( not ( = ?auto_26127 ?auto_26149 ) ) ( not ( = ?auto_26151 ?auto_26176 ) ) ( not ( = ?auto_26151 ?auto_26146 ) ) ( not ( = ?auto_26151 ?auto_26154 ) ) ( not ( = ?auto_26151 ?auto_26172 ) ) ( not ( = ?auto_26151 ?auto_26165 ) ) ( not ( = ?auto_26151 ?auto_26144 ) ) ( not ( = ?auto_26151 ?auto_26166 ) ) ( not ( = ?auto_26151 ?auto_26140 ) ) ( not ( = ?auto_26151 ?auto_26143 ) ) ( not ( = ?auto_26158 ?auto_26153 ) ) ( not ( = ?auto_26158 ?auto_26169 ) ) ( not ( = ?auto_26158 ?auto_26155 ) ) ( not ( = ?auto_26158 ?auto_26171 ) ) ( not ( = ?auto_26158 ?auto_26161 ) ) ( not ( = ?auto_26158 ?auto_26150 ) ) ( not ( = ?auto_26158 ?auto_26177 ) ) ( not ( = ?auto_26158 ?auto_26142 ) ) ( not ( = ?auto_26158 ?auto_26164 ) ) ( not ( = ?auto_26178 ?auto_26175 ) ) ( not ( = ?auto_26178 ?auto_26156 ) ) ( not ( = ?auto_26178 ?auto_26141 ) ) ( not ( = ?auto_26178 ?auto_26160 ) ) ( not ( = ?auto_26178 ?auto_26174 ) ) ( not ( = ?auto_26178 ?auto_26163 ) ) ( not ( = ?auto_26178 ?auto_26162 ) ) ( not ( = ?auto_26178 ?auto_26157 ) ) ( not ( = ?auto_26178 ?auto_26159 ) ) ( not ( = ?auto_26178 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26128 ) ) ( not ( = ?auto_26116 ?auto_26139 ) ) ( not ( = ?auto_26117 ?auto_26128 ) ) ( not ( = ?auto_26117 ?auto_26139 ) ) ( not ( = ?auto_26118 ?auto_26128 ) ) ( not ( = ?auto_26118 ?auto_26139 ) ) ( not ( = ?auto_26119 ?auto_26128 ) ) ( not ( = ?auto_26119 ?auto_26139 ) ) ( not ( = ?auto_26120 ?auto_26128 ) ) ( not ( = ?auto_26120 ?auto_26139 ) ) ( not ( = ?auto_26121 ?auto_26128 ) ) ( not ( = ?auto_26121 ?auto_26139 ) ) ( not ( = ?auto_26122 ?auto_26128 ) ) ( not ( = ?auto_26122 ?auto_26139 ) ) ( not ( = ?auto_26123 ?auto_26128 ) ) ( not ( = ?auto_26123 ?auto_26139 ) ) ( not ( = ?auto_26124 ?auto_26128 ) ) ( not ( = ?auto_26124 ?auto_26139 ) ) ( not ( = ?auto_26125 ?auto_26128 ) ) ( not ( = ?auto_26125 ?auto_26139 ) ) ( not ( = ?auto_26126 ?auto_26128 ) ) ( not ( = ?auto_26126 ?auto_26139 ) ) ( not ( = ?auto_26128 ?auto_26178 ) ) ( not ( = ?auto_26128 ?auto_26175 ) ) ( not ( = ?auto_26128 ?auto_26156 ) ) ( not ( = ?auto_26128 ?auto_26141 ) ) ( not ( = ?auto_26128 ?auto_26160 ) ) ( not ( = ?auto_26128 ?auto_26174 ) ) ( not ( = ?auto_26128 ?auto_26163 ) ) ( not ( = ?auto_26128 ?auto_26162 ) ) ( not ( = ?auto_26128 ?auto_26157 ) ) ( not ( = ?auto_26128 ?auto_26159 ) ) ( not ( = ?auto_26128 ?auto_26149 ) ) ( not ( = ?auto_26134 ?auto_26151 ) ) ( not ( = ?auto_26134 ?auto_26176 ) ) ( not ( = ?auto_26134 ?auto_26146 ) ) ( not ( = ?auto_26134 ?auto_26154 ) ) ( not ( = ?auto_26134 ?auto_26172 ) ) ( not ( = ?auto_26134 ?auto_26165 ) ) ( not ( = ?auto_26134 ?auto_26144 ) ) ( not ( = ?auto_26134 ?auto_26166 ) ) ( not ( = ?auto_26134 ?auto_26140 ) ) ( not ( = ?auto_26134 ?auto_26143 ) ) ( not ( = ?auto_26133 ?auto_26158 ) ) ( not ( = ?auto_26133 ?auto_26153 ) ) ( not ( = ?auto_26133 ?auto_26169 ) ) ( not ( = ?auto_26133 ?auto_26155 ) ) ( not ( = ?auto_26133 ?auto_26171 ) ) ( not ( = ?auto_26133 ?auto_26161 ) ) ( not ( = ?auto_26133 ?auto_26150 ) ) ( not ( = ?auto_26133 ?auto_26177 ) ) ( not ( = ?auto_26133 ?auto_26142 ) ) ( not ( = ?auto_26133 ?auto_26164 ) ) ( not ( = ?auto_26139 ?auto_26178 ) ) ( not ( = ?auto_26139 ?auto_26175 ) ) ( not ( = ?auto_26139 ?auto_26156 ) ) ( not ( = ?auto_26139 ?auto_26141 ) ) ( not ( = ?auto_26139 ?auto_26160 ) ) ( not ( = ?auto_26139 ?auto_26174 ) ) ( not ( = ?auto_26139 ?auto_26163 ) ) ( not ( = ?auto_26139 ?auto_26162 ) ) ( not ( = ?auto_26139 ?auto_26157 ) ) ( not ( = ?auto_26139 ?auto_26159 ) ) ( not ( = ?auto_26139 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26129 ) ) ( not ( = ?auto_26116 ?auto_26168 ) ) ( not ( = ?auto_26117 ?auto_26129 ) ) ( not ( = ?auto_26117 ?auto_26168 ) ) ( not ( = ?auto_26118 ?auto_26129 ) ) ( not ( = ?auto_26118 ?auto_26168 ) ) ( not ( = ?auto_26119 ?auto_26129 ) ) ( not ( = ?auto_26119 ?auto_26168 ) ) ( not ( = ?auto_26120 ?auto_26129 ) ) ( not ( = ?auto_26120 ?auto_26168 ) ) ( not ( = ?auto_26121 ?auto_26129 ) ) ( not ( = ?auto_26121 ?auto_26168 ) ) ( not ( = ?auto_26122 ?auto_26129 ) ) ( not ( = ?auto_26122 ?auto_26168 ) ) ( not ( = ?auto_26123 ?auto_26129 ) ) ( not ( = ?auto_26123 ?auto_26168 ) ) ( not ( = ?auto_26124 ?auto_26129 ) ) ( not ( = ?auto_26124 ?auto_26168 ) ) ( not ( = ?auto_26125 ?auto_26129 ) ) ( not ( = ?auto_26125 ?auto_26168 ) ) ( not ( = ?auto_26126 ?auto_26129 ) ) ( not ( = ?auto_26126 ?auto_26168 ) ) ( not ( = ?auto_26127 ?auto_26129 ) ) ( not ( = ?auto_26127 ?auto_26168 ) ) ( not ( = ?auto_26129 ?auto_26139 ) ) ( not ( = ?auto_26129 ?auto_26178 ) ) ( not ( = ?auto_26129 ?auto_26175 ) ) ( not ( = ?auto_26129 ?auto_26156 ) ) ( not ( = ?auto_26129 ?auto_26141 ) ) ( not ( = ?auto_26129 ?auto_26160 ) ) ( not ( = ?auto_26129 ?auto_26174 ) ) ( not ( = ?auto_26129 ?auto_26163 ) ) ( not ( = ?auto_26129 ?auto_26162 ) ) ( not ( = ?auto_26129 ?auto_26157 ) ) ( not ( = ?auto_26129 ?auto_26159 ) ) ( not ( = ?auto_26129 ?auto_26149 ) ) ( not ( = ?auto_26170 ?auto_26134 ) ) ( not ( = ?auto_26170 ?auto_26151 ) ) ( not ( = ?auto_26170 ?auto_26176 ) ) ( not ( = ?auto_26170 ?auto_26146 ) ) ( not ( = ?auto_26170 ?auto_26154 ) ) ( not ( = ?auto_26170 ?auto_26172 ) ) ( not ( = ?auto_26170 ?auto_26165 ) ) ( not ( = ?auto_26170 ?auto_26144 ) ) ( not ( = ?auto_26170 ?auto_26166 ) ) ( not ( = ?auto_26170 ?auto_26140 ) ) ( not ( = ?auto_26170 ?auto_26143 ) ) ( not ( = ?auto_26173 ?auto_26133 ) ) ( not ( = ?auto_26173 ?auto_26158 ) ) ( not ( = ?auto_26173 ?auto_26153 ) ) ( not ( = ?auto_26173 ?auto_26169 ) ) ( not ( = ?auto_26173 ?auto_26155 ) ) ( not ( = ?auto_26173 ?auto_26171 ) ) ( not ( = ?auto_26173 ?auto_26161 ) ) ( not ( = ?auto_26173 ?auto_26150 ) ) ( not ( = ?auto_26173 ?auto_26177 ) ) ( not ( = ?auto_26173 ?auto_26142 ) ) ( not ( = ?auto_26173 ?auto_26164 ) ) ( not ( = ?auto_26168 ?auto_26139 ) ) ( not ( = ?auto_26168 ?auto_26178 ) ) ( not ( = ?auto_26168 ?auto_26175 ) ) ( not ( = ?auto_26168 ?auto_26156 ) ) ( not ( = ?auto_26168 ?auto_26141 ) ) ( not ( = ?auto_26168 ?auto_26160 ) ) ( not ( = ?auto_26168 ?auto_26174 ) ) ( not ( = ?auto_26168 ?auto_26163 ) ) ( not ( = ?auto_26168 ?auto_26162 ) ) ( not ( = ?auto_26168 ?auto_26157 ) ) ( not ( = ?auto_26168 ?auto_26159 ) ) ( not ( = ?auto_26168 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26131 ) ) ( not ( = ?auto_26116 ?auto_26179 ) ) ( not ( = ?auto_26117 ?auto_26131 ) ) ( not ( = ?auto_26117 ?auto_26179 ) ) ( not ( = ?auto_26118 ?auto_26131 ) ) ( not ( = ?auto_26118 ?auto_26179 ) ) ( not ( = ?auto_26119 ?auto_26131 ) ) ( not ( = ?auto_26119 ?auto_26179 ) ) ( not ( = ?auto_26120 ?auto_26131 ) ) ( not ( = ?auto_26120 ?auto_26179 ) ) ( not ( = ?auto_26121 ?auto_26131 ) ) ( not ( = ?auto_26121 ?auto_26179 ) ) ( not ( = ?auto_26122 ?auto_26131 ) ) ( not ( = ?auto_26122 ?auto_26179 ) ) ( not ( = ?auto_26123 ?auto_26131 ) ) ( not ( = ?auto_26123 ?auto_26179 ) ) ( not ( = ?auto_26124 ?auto_26131 ) ) ( not ( = ?auto_26124 ?auto_26179 ) ) ( not ( = ?auto_26125 ?auto_26131 ) ) ( not ( = ?auto_26125 ?auto_26179 ) ) ( not ( = ?auto_26126 ?auto_26131 ) ) ( not ( = ?auto_26126 ?auto_26179 ) ) ( not ( = ?auto_26127 ?auto_26131 ) ) ( not ( = ?auto_26127 ?auto_26179 ) ) ( not ( = ?auto_26128 ?auto_26131 ) ) ( not ( = ?auto_26128 ?auto_26179 ) ) ( not ( = ?auto_26131 ?auto_26168 ) ) ( not ( = ?auto_26131 ?auto_26139 ) ) ( not ( = ?auto_26131 ?auto_26178 ) ) ( not ( = ?auto_26131 ?auto_26175 ) ) ( not ( = ?auto_26131 ?auto_26156 ) ) ( not ( = ?auto_26131 ?auto_26141 ) ) ( not ( = ?auto_26131 ?auto_26160 ) ) ( not ( = ?auto_26131 ?auto_26174 ) ) ( not ( = ?auto_26131 ?auto_26163 ) ) ( not ( = ?auto_26131 ?auto_26162 ) ) ( not ( = ?auto_26131 ?auto_26157 ) ) ( not ( = ?auto_26131 ?auto_26159 ) ) ( not ( = ?auto_26131 ?auto_26149 ) ) ( not ( = ?auto_26148 ?auto_26170 ) ) ( not ( = ?auto_26148 ?auto_26134 ) ) ( not ( = ?auto_26148 ?auto_26151 ) ) ( not ( = ?auto_26148 ?auto_26176 ) ) ( not ( = ?auto_26148 ?auto_26146 ) ) ( not ( = ?auto_26148 ?auto_26154 ) ) ( not ( = ?auto_26148 ?auto_26172 ) ) ( not ( = ?auto_26148 ?auto_26165 ) ) ( not ( = ?auto_26148 ?auto_26144 ) ) ( not ( = ?auto_26148 ?auto_26166 ) ) ( not ( = ?auto_26148 ?auto_26140 ) ) ( not ( = ?auto_26148 ?auto_26143 ) ) ( not ( = ?auto_26145 ?auto_26173 ) ) ( not ( = ?auto_26145 ?auto_26133 ) ) ( not ( = ?auto_26145 ?auto_26158 ) ) ( not ( = ?auto_26145 ?auto_26153 ) ) ( not ( = ?auto_26145 ?auto_26169 ) ) ( not ( = ?auto_26145 ?auto_26155 ) ) ( not ( = ?auto_26145 ?auto_26171 ) ) ( not ( = ?auto_26145 ?auto_26161 ) ) ( not ( = ?auto_26145 ?auto_26150 ) ) ( not ( = ?auto_26145 ?auto_26177 ) ) ( not ( = ?auto_26145 ?auto_26142 ) ) ( not ( = ?auto_26145 ?auto_26164 ) ) ( not ( = ?auto_26179 ?auto_26168 ) ) ( not ( = ?auto_26179 ?auto_26139 ) ) ( not ( = ?auto_26179 ?auto_26178 ) ) ( not ( = ?auto_26179 ?auto_26175 ) ) ( not ( = ?auto_26179 ?auto_26156 ) ) ( not ( = ?auto_26179 ?auto_26141 ) ) ( not ( = ?auto_26179 ?auto_26160 ) ) ( not ( = ?auto_26179 ?auto_26174 ) ) ( not ( = ?auto_26179 ?auto_26163 ) ) ( not ( = ?auto_26179 ?auto_26162 ) ) ( not ( = ?auto_26179 ?auto_26157 ) ) ( not ( = ?auto_26179 ?auto_26159 ) ) ( not ( = ?auto_26179 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26130 ) ) ( not ( = ?auto_26116 ?auto_26152 ) ) ( not ( = ?auto_26117 ?auto_26130 ) ) ( not ( = ?auto_26117 ?auto_26152 ) ) ( not ( = ?auto_26118 ?auto_26130 ) ) ( not ( = ?auto_26118 ?auto_26152 ) ) ( not ( = ?auto_26119 ?auto_26130 ) ) ( not ( = ?auto_26119 ?auto_26152 ) ) ( not ( = ?auto_26120 ?auto_26130 ) ) ( not ( = ?auto_26120 ?auto_26152 ) ) ( not ( = ?auto_26121 ?auto_26130 ) ) ( not ( = ?auto_26121 ?auto_26152 ) ) ( not ( = ?auto_26122 ?auto_26130 ) ) ( not ( = ?auto_26122 ?auto_26152 ) ) ( not ( = ?auto_26123 ?auto_26130 ) ) ( not ( = ?auto_26123 ?auto_26152 ) ) ( not ( = ?auto_26124 ?auto_26130 ) ) ( not ( = ?auto_26124 ?auto_26152 ) ) ( not ( = ?auto_26125 ?auto_26130 ) ) ( not ( = ?auto_26125 ?auto_26152 ) ) ( not ( = ?auto_26126 ?auto_26130 ) ) ( not ( = ?auto_26126 ?auto_26152 ) ) ( not ( = ?auto_26127 ?auto_26130 ) ) ( not ( = ?auto_26127 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26152 ) ) ( not ( = ?auto_26129 ?auto_26130 ) ) ( not ( = ?auto_26129 ?auto_26152 ) ) ( not ( = ?auto_26130 ?auto_26179 ) ) ( not ( = ?auto_26130 ?auto_26168 ) ) ( not ( = ?auto_26130 ?auto_26139 ) ) ( not ( = ?auto_26130 ?auto_26178 ) ) ( not ( = ?auto_26130 ?auto_26175 ) ) ( not ( = ?auto_26130 ?auto_26156 ) ) ( not ( = ?auto_26130 ?auto_26141 ) ) ( not ( = ?auto_26130 ?auto_26160 ) ) ( not ( = ?auto_26130 ?auto_26174 ) ) ( not ( = ?auto_26130 ?auto_26163 ) ) ( not ( = ?auto_26130 ?auto_26162 ) ) ( not ( = ?auto_26130 ?auto_26157 ) ) ( not ( = ?auto_26130 ?auto_26159 ) ) ( not ( = ?auto_26130 ?auto_26149 ) ) ( not ( = ?auto_26147 ?auto_26148 ) ) ( not ( = ?auto_26147 ?auto_26170 ) ) ( not ( = ?auto_26147 ?auto_26134 ) ) ( not ( = ?auto_26147 ?auto_26151 ) ) ( not ( = ?auto_26147 ?auto_26176 ) ) ( not ( = ?auto_26147 ?auto_26146 ) ) ( not ( = ?auto_26147 ?auto_26154 ) ) ( not ( = ?auto_26147 ?auto_26172 ) ) ( not ( = ?auto_26147 ?auto_26165 ) ) ( not ( = ?auto_26147 ?auto_26144 ) ) ( not ( = ?auto_26147 ?auto_26166 ) ) ( not ( = ?auto_26147 ?auto_26140 ) ) ( not ( = ?auto_26147 ?auto_26143 ) ) ( not ( = ?auto_26167 ?auto_26145 ) ) ( not ( = ?auto_26167 ?auto_26173 ) ) ( not ( = ?auto_26167 ?auto_26133 ) ) ( not ( = ?auto_26167 ?auto_26158 ) ) ( not ( = ?auto_26167 ?auto_26153 ) ) ( not ( = ?auto_26167 ?auto_26169 ) ) ( not ( = ?auto_26167 ?auto_26155 ) ) ( not ( = ?auto_26167 ?auto_26171 ) ) ( not ( = ?auto_26167 ?auto_26161 ) ) ( not ( = ?auto_26167 ?auto_26150 ) ) ( not ( = ?auto_26167 ?auto_26177 ) ) ( not ( = ?auto_26167 ?auto_26142 ) ) ( not ( = ?auto_26167 ?auto_26164 ) ) ( not ( = ?auto_26152 ?auto_26179 ) ) ( not ( = ?auto_26152 ?auto_26168 ) ) ( not ( = ?auto_26152 ?auto_26139 ) ) ( not ( = ?auto_26152 ?auto_26178 ) ) ( not ( = ?auto_26152 ?auto_26175 ) ) ( not ( = ?auto_26152 ?auto_26156 ) ) ( not ( = ?auto_26152 ?auto_26141 ) ) ( not ( = ?auto_26152 ?auto_26160 ) ) ( not ( = ?auto_26152 ?auto_26174 ) ) ( not ( = ?auto_26152 ?auto_26163 ) ) ( not ( = ?auto_26152 ?auto_26162 ) ) ( not ( = ?auto_26152 ?auto_26157 ) ) ( not ( = ?auto_26152 ?auto_26159 ) ) ( not ( = ?auto_26152 ?auto_26149 ) ) ( not ( = ?auto_26116 ?auto_26132 ) ) ( not ( = ?auto_26116 ?auto_26137 ) ) ( not ( = ?auto_26117 ?auto_26132 ) ) ( not ( = ?auto_26117 ?auto_26137 ) ) ( not ( = ?auto_26118 ?auto_26132 ) ) ( not ( = ?auto_26118 ?auto_26137 ) ) ( not ( = ?auto_26119 ?auto_26132 ) ) ( not ( = ?auto_26119 ?auto_26137 ) ) ( not ( = ?auto_26120 ?auto_26132 ) ) ( not ( = ?auto_26120 ?auto_26137 ) ) ( not ( = ?auto_26121 ?auto_26132 ) ) ( not ( = ?auto_26121 ?auto_26137 ) ) ( not ( = ?auto_26122 ?auto_26132 ) ) ( not ( = ?auto_26122 ?auto_26137 ) ) ( not ( = ?auto_26123 ?auto_26132 ) ) ( not ( = ?auto_26123 ?auto_26137 ) ) ( not ( = ?auto_26124 ?auto_26132 ) ) ( not ( = ?auto_26124 ?auto_26137 ) ) ( not ( = ?auto_26125 ?auto_26132 ) ) ( not ( = ?auto_26125 ?auto_26137 ) ) ( not ( = ?auto_26126 ?auto_26132 ) ) ( not ( = ?auto_26126 ?auto_26137 ) ) ( not ( = ?auto_26127 ?auto_26132 ) ) ( not ( = ?auto_26127 ?auto_26137 ) ) ( not ( = ?auto_26128 ?auto_26132 ) ) ( not ( = ?auto_26128 ?auto_26137 ) ) ( not ( = ?auto_26129 ?auto_26132 ) ) ( not ( = ?auto_26129 ?auto_26137 ) ) ( not ( = ?auto_26131 ?auto_26132 ) ) ( not ( = ?auto_26131 ?auto_26137 ) ) ( not ( = ?auto_26132 ?auto_26152 ) ) ( not ( = ?auto_26132 ?auto_26179 ) ) ( not ( = ?auto_26132 ?auto_26168 ) ) ( not ( = ?auto_26132 ?auto_26139 ) ) ( not ( = ?auto_26132 ?auto_26178 ) ) ( not ( = ?auto_26132 ?auto_26175 ) ) ( not ( = ?auto_26132 ?auto_26156 ) ) ( not ( = ?auto_26132 ?auto_26141 ) ) ( not ( = ?auto_26132 ?auto_26160 ) ) ( not ( = ?auto_26132 ?auto_26174 ) ) ( not ( = ?auto_26132 ?auto_26163 ) ) ( not ( = ?auto_26132 ?auto_26162 ) ) ( not ( = ?auto_26132 ?auto_26157 ) ) ( not ( = ?auto_26132 ?auto_26159 ) ) ( not ( = ?auto_26132 ?auto_26149 ) ) ( not ( = ?auto_26137 ?auto_26152 ) ) ( not ( = ?auto_26137 ?auto_26179 ) ) ( not ( = ?auto_26137 ?auto_26168 ) ) ( not ( = ?auto_26137 ?auto_26139 ) ) ( not ( = ?auto_26137 ?auto_26178 ) ) ( not ( = ?auto_26137 ?auto_26175 ) ) ( not ( = ?auto_26137 ?auto_26156 ) ) ( not ( = ?auto_26137 ?auto_26141 ) ) ( not ( = ?auto_26137 ?auto_26160 ) ) ( not ( = ?auto_26137 ?auto_26174 ) ) ( not ( = ?auto_26137 ?auto_26163 ) ) ( not ( = ?auto_26137 ?auto_26162 ) ) ( not ( = ?auto_26137 ?auto_26157 ) ) ( not ( = ?auto_26137 ?auto_26159 ) ) ( not ( = ?auto_26137 ?auto_26149 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26116 ?auto_26117 ?auto_26118 ?auto_26119 ?auto_26120 ?auto_26121 ?auto_26122 ?auto_26123 ?auto_26124 ?auto_26125 ?auto_26126 ?auto_26127 ?auto_26128 ?auto_26129 ?auto_26131 ?auto_26130 )
      ( MAKE-1CRATE ?auto_26130 ?auto_26132 )
      ( MAKE-16CRATE-VERIFY ?auto_26116 ?auto_26117 ?auto_26118 ?auto_26119 ?auto_26120 ?auto_26121 ?auto_26122 ?auto_26123 ?auto_26124 ?auto_26125 ?auto_26126 ?auto_26127 ?auto_26128 ?auto_26129 ?auto_26131 ?auto_26130 ?auto_26132 ) )
  )

)

