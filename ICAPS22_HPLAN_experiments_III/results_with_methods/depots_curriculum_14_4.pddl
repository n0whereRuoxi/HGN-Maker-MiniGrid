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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19294 - SURFACE
      ?auto_19295 - SURFACE
    )
    :vars
    (
      ?auto_19296 - HOIST
      ?auto_19297 - PLACE
      ?auto_19299 - PLACE
      ?auto_19300 - HOIST
      ?auto_19301 - SURFACE
      ?auto_19298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19296 ?auto_19297 ) ( SURFACE-AT ?auto_19294 ?auto_19297 ) ( CLEAR ?auto_19294 ) ( IS-CRATE ?auto_19295 ) ( AVAILABLE ?auto_19296 ) ( not ( = ?auto_19299 ?auto_19297 ) ) ( HOIST-AT ?auto_19300 ?auto_19299 ) ( AVAILABLE ?auto_19300 ) ( SURFACE-AT ?auto_19295 ?auto_19299 ) ( ON ?auto_19295 ?auto_19301 ) ( CLEAR ?auto_19295 ) ( TRUCK-AT ?auto_19298 ?auto_19297 ) ( not ( = ?auto_19294 ?auto_19295 ) ) ( not ( = ?auto_19294 ?auto_19301 ) ) ( not ( = ?auto_19295 ?auto_19301 ) ) ( not ( = ?auto_19296 ?auto_19300 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19298 ?auto_19297 ?auto_19299 )
      ( !LIFT ?auto_19300 ?auto_19295 ?auto_19301 ?auto_19299 )
      ( !LOAD ?auto_19300 ?auto_19295 ?auto_19298 ?auto_19299 )
      ( !DRIVE ?auto_19298 ?auto_19299 ?auto_19297 )
      ( !UNLOAD ?auto_19296 ?auto_19295 ?auto_19298 ?auto_19297 )
      ( !DROP ?auto_19296 ?auto_19295 ?auto_19294 ?auto_19297 )
      ( MAKE-1CRATE-VERIFY ?auto_19294 ?auto_19295 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19304 - SURFACE
      ?auto_19305 - SURFACE
    )
    :vars
    (
      ?auto_19306 - HOIST
      ?auto_19307 - PLACE
      ?auto_19309 - PLACE
      ?auto_19310 - HOIST
      ?auto_19311 - SURFACE
      ?auto_19308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19306 ?auto_19307 ) ( SURFACE-AT ?auto_19304 ?auto_19307 ) ( CLEAR ?auto_19304 ) ( IS-CRATE ?auto_19305 ) ( AVAILABLE ?auto_19306 ) ( not ( = ?auto_19309 ?auto_19307 ) ) ( HOIST-AT ?auto_19310 ?auto_19309 ) ( AVAILABLE ?auto_19310 ) ( SURFACE-AT ?auto_19305 ?auto_19309 ) ( ON ?auto_19305 ?auto_19311 ) ( CLEAR ?auto_19305 ) ( TRUCK-AT ?auto_19308 ?auto_19307 ) ( not ( = ?auto_19304 ?auto_19305 ) ) ( not ( = ?auto_19304 ?auto_19311 ) ) ( not ( = ?auto_19305 ?auto_19311 ) ) ( not ( = ?auto_19306 ?auto_19310 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19308 ?auto_19307 ?auto_19309 )
      ( !LIFT ?auto_19310 ?auto_19305 ?auto_19311 ?auto_19309 )
      ( !LOAD ?auto_19310 ?auto_19305 ?auto_19308 ?auto_19309 )
      ( !DRIVE ?auto_19308 ?auto_19309 ?auto_19307 )
      ( !UNLOAD ?auto_19306 ?auto_19305 ?auto_19308 ?auto_19307 )
      ( !DROP ?auto_19306 ?auto_19305 ?auto_19304 ?auto_19307 )
      ( MAKE-1CRATE-VERIFY ?auto_19304 ?auto_19305 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19315 - SURFACE
      ?auto_19316 - SURFACE
      ?auto_19317 - SURFACE
    )
    :vars
    (
      ?auto_19323 - HOIST
      ?auto_19319 - PLACE
      ?auto_19318 - PLACE
      ?auto_19321 - HOIST
      ?auto_19322 - SURFACE
      ?auto_19325 - PLACE
      ?auto_19326 - HOIST
      ?auto_19324 - SURFACE
      ?auto_19320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19323 ?auto_19319 ) ( IS-CRATE ?auto_19317 ) ( not ( = ?auto_19318 ?auto_19319 ) ) ( HOIST-AT ?auto_19321 ?auto_19318 ) ( AVAILABLE ?auto_19321 ) ( SURFACE-AT ?auto_19317 ?auto_19318 ) ( ON ?auto_19317 ?auto_19322 ) ( CLEAR ?auto_19317 ) ( not ( = ?auto_19316 ?auto_19317 ) ) ( not ( = ?auto_19316 ?auto_19322 ) ) ( not ( = ?auto_19317 ?auto_19322 ) ) ( not ( = ?auto_19323 ?auto_19321 ) ) ( SURFACE-AT ?auto_19315 ?auto_19319 ) ( CLEAR ?auto_19315 ) ( IS-CRATE ?auto_19316 ) ( AVAILABLE ?auto_19323 ) ( not ( = ?auto_19325 ?auto_19319 ) ) ( HOIST-AT ?auto_19326 ?auto_19325 ) ( AVAILABLE ?auto_19326 ) ( SURFACE-AT ?auto_19316 ?auto_19325 ) ( ON ?auto_19316 ?auto_19324 ) ( CLEAR ?auto_19316 ) ( TRUCK-AT ?auto_19320 ?auto_19319 ) ( not ( = ?auto_19315 ?auto_19316 ) ) ( not ( = ?auto_19315 ?auto_19324 ) ) ( not ( = ?auto_19316 ?auto_19324 ) ) ( not ( = ?auto_19323 ?auto_19326 ) ) ( not ( = ?auto_19315 ?auto_19317 ) ) ( not ( = ?auto_19315 ?auto_19322 ) ) ( not ( = ?auto_19317 ?auto_19324 ) ) ( not ( = ?auto_19318 ?auto_19325 ) ) ( not ( = ?auto_19321 ?auto_19326 ) ) ( not ( = ?auto_19322 ?auto_19324 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19315 ?auto_19316 )
      ( MAKE-1CRATE ?auto_19316 ?auto_19317 )
      ( MAKE-2CRATE-VERIFY ?auto_19315 ?auto_19316 ?auto_19317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19329 - SURFACE
      ?auto_19330 - SURFACE
    )
    :vars
    (
      ?auto_19331 - HOIST
      ?auto_19332 - PLACE
      ?auto_19334 - PLACE
      ?auto_19335 - HOIST
      ?auto_19336 - SURFACE
      ?auto_19333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19331 ?auto_19332 ) ( SURFACE-AT ?auto_19329 ?auto_19332 ) ( CLEAR ?auto_19329 ) ( IS-CRATE ?auto_19330 ) ( AVAILABLE ?auto_19331 ) ( not ( = ?auto_19334 ?auto_19332 ) ) ( HOIST-AT ?auto_19335 ?auto_19334 ) ( AVAILABLE ?auto_19335 ) ( SURFACE-AT ?auto_19330 ?auto_19334 ) ( ON ?auto_19330 ?auto_19336 ) ( CLEAR ?auto_19330 ) ( TRUCK-AT ?auto_19333 ?auto_19332 ) ( not ( = ?auto_19329 ?auto_19330 ) ) ( not ( = ?auto_19329 ?auto_19336 ) ) ( not ( = ?auto_19330 ?auto_19336 ) ) ( not ( = ?auto_19331 ?auto_19335 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19333 ?auto_19332 ?auto_19334 )
      ( !LIFT ?auto_19335 ?auto_19330 ?auto_19336 ?auto_19334 )
      ( !LOAD ?auto_19335 ?auto_19330 ?auto_19333 ?auto_19334 )
      ( !DRIVE ?auto_19333 ?auto_19334 ?auto_19332 )
      ( !UNLOAD ?auto_19331 ?auto_19330 ?auto_19333 ?auto_19332 )
      ( !DROP ?auto_19331 ?auto_19330 ?auto_19329 ?auto_19332 )
      ( MAKE-1CRATE-VERIFY ?auto_19329 ?auto_19330 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19341 - SURFACE
      ?auto_19342 - SURFACE
      ?auto_19343 - SURFACE
      ?auto_19344 - SURFACE
    )
    :vars
    (
      ?auto_19347 - HOIST
      ?auto_19350 - PLACE
      ?auto_19348 - PLACE
      ?auto_19346 - HOIST
      ?auto_19345 - SURFACE
      ?auto_19352 - PLACE
      ?auto_19354 - HOIST
      ?auto_19353 - SURFACE
      ?auto_19351 - PLACE
      ?auto_19355 - HOIST
      ?auto_19356 - SURFACE
      ?auto_19349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19347 ?auto_19350 ) ( IS-CRATE ?auto_19344 ) ( not ( = ?auto_19348 ?auto_19350 ) ) ( HOIST-AT ?auto_19346 ?auto_19348 ) ( AVAILABLE ?auto_19346 ) ( SURFACE-AT ?auto_19344 ?auto_19348 ) ( ON ?auto_19344 ?auto_19345 ) ( CLEAR ?auto_19344 ) ( not ( = ?auto_19343 ?auto_19344 ) ) ( not ( = ?auto_19343 ?auto_19345 ) ) ( not ( = ?auto_19344 ?auto_19345 ) ) ( not ( = ?auto_19347 ?auto_19346 ) ) ( IS-CRATE ?auto_19343 ) ( not ( = ?auto_19352 ?auto_19350 ) ) ( HOIST-AT ?auto_19354 ?auto_19352 ) ( AVAILABLE ?auto_19354 ) ( SURFACE-AT ?auto_19343 ?auto_19352 ) ( ON ?auto_19343 ?auto_19353 ) ( CLEAR ?auto_19343 ) ( not ( = ?auto_19342 ?auto_19343 ) ) ( not ( = ?auto_19342 ?auto_19353 ) ) ( not ( = ?auto_19343 ?auto_19353 ) ) ( not ( = ?auto_19347 ?auto_19354 ) ) ( SURFACE-AT ?auto_19341 ?auto_19350 ) ( CLEAR ?auto_19341 ) ( IS-CRATE ?auto_19342 ) ( AVAILABLE ?auto_19347 ) ( not ( = ?auto_19351 ?auto_19350 ) ) ( HOIST-AT ?auto_19355 ?auto_19351 ) ( AVAILABLE ?auto_19355 ) ( SURFACE-AT ?auto_19342 ?auto_19351 ) ( ON ?auto_19342 ?auto_19356 ) ( CLEAR ?auto_19342 ) ( TRUCK-AT ?auto_19349 ?auto_19350 ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( not ( = ?auto_19341 ?auto_19356 ) ) ( not ( = ?auto_19342 ?auto_19356 ) ) ( not ( = ?auto_19347 ?auto_19355 ) ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( not ( = ?auto_19341 ?auto_19353 ) ) ( not ( = ?auto_19343 ?auto_19356 ) ) ( not ( = ?auto_19352 ?auto_19351 ) ) ( not ( = ?auto_19354 ?auto_19355 ) ) ( not ( = ?auto_19353 ?auto_19356 ) ) ( not ( = ?auto_19341 ?auto_19344 ) ) ( not ( = ?auto_19341 ?auto_19345 ) ) ( not ( = ?auto_19342 ?auto_19344 ) ) ( not ( = ?auto_19342 ?auto_19345 ) ) ( not ( = ?auto_19344 ?auto_19353 ) ) ( not ( = ?auto_19344 ?auto_19356 ) ) ( not ( = ?auto_19348 ?auto_19352 ) ) ( not ( = ?auto_19348 ?auto_19351 ) ) ( not ( = ?auto_19346 ?auto_19354 ) ) ( not ( = ?auto_19346 ?auto_19355 ) ) ( not ( = ?auto_19345 ?auto_19353 ) ) ( not ( = ?auto_19345 ?auto_19356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19341 ?auto_19342 ?auto_19343 )
      ( MAKE-1CRATE ?auto_19343 ?auto_19344 )
      ( MAKE-3CRATE-VERIFY ?auto_19341 ?auto_19342 ?auto_19343 ?auto_19344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19359 - SURFACE
      ?auto_19360 - SURFACE
    )
    :vars
    (
      ?auto_19361 - HOIST
      ?auto_19362 - PLACE
      ?auto_19364 - PLACE
      ?auto_19365 - HOIST
      ?auto_19366 - SURFACE
      ?auto_19363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19361 ?auto_19362 ) ( SURFACE-AT ?auto_19359 ?auto_19362 ) ( CLEAR ?auto_19359 ) ( IS-CRATE ?auto_19360 ) ( AVAILABLE ?auto_19361 ) ( not ( = ?auto_19364 ?auto_19362 ) ) ( HOIST-AT ?auto_19365 ?auto_19364 ) ( AVAILABLE ?auto_19365 ) ( SURFACE-AT ?auto_19360 ?auto_19364 ) ( ON ?auto_19360 ?auto_19366 ) ( CLEAR ?auto_19360 ) ( TRUCK-AT ?auto_19363 ?auto_19362 ) ( not ( = ?auto_19359 ?auto_19360 ) ) ( not ( = ?auto_19359 ?auto_19366 ) ) ( not ( = ?auto_19360 ?auto_19366 ) ) ( not ( = ?auto_19361 ?auto_19365 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19363 ?auto_19362 ?auto_19364 )
      ( !LIFT ?auto_19365 ?auto_19360 ?auto_19366 ?auto_19364 )
      ( !LOAD ?auto_19365 ?auto_19360 ?auto_19363 ?auto_19364 )
      ( !DRIVE ?auto_19363 ?auto_19364 ?auto_19362 )
      ( !UNLOAD ?auto_19361 ?auto_19360 ?auto_19363 ?auto_19362 )
      ( !DROP ?auto_19361 ?auto_19360 ?auto_19359 ?auto_19362 )
      ( MAKE-1CRATE-VERIFY ?auto_19359 ?auto_19360 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19372 - SURFACE
      ?auto_19373 - SURFACE
      ?auto_19374 - SURFACE
      ?auto_19375 - SURFACE
      ?auto_19376 - SURFACE
    )
    :vars
    (
      ?auto_19382 - HOIST
      ?auto_19378 - PLACE
      ?auto_19379 - PLACE
      ?auto_19377 - HOIST
      ?auto_19380 - SURFACE
      ?auto_19385 - PLACE
      ?auto_19386 - HOIST
      ?auto_19391 - SURFACE
      ?auto_19388 - PLACE
      ?auto_19384 - HOIST
      ?auto_19383 - SURFACE
      ?auto_19387 - PLACE
      ?auto_19390 - HOIST
      ?auto_19389 - SURFACE
      ?auto_19381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19382 ?auto_19378 ) ( IS-CRATE ?auto_19376 ) ( not ( = ?auto_19379 ?auto_19378 ) ) ( HOIST-AT ?auto_19377 ?auto_19379 ) ( AVAILABLE ?auto_19377 ) ( SURFACE-AT ?auto_19376 ?auto_19379 ) ( ON ?auto_19376 ?auto_19380 ) ( CLEAR ?auto_19376 ) ( not ( = ?auto_19375 ?auto_19376 ) ) ( not ( = ?auto_19375 ?auto_19380 ) ) ( not ( = ?auto_19376 ?auto_19380 ) ) ( not ( = ?auto_19382 ?auto_19377 ) ) ( IS-CRATE ?auto_19375 ) ( not ( = ?auto_19385 ?auto_19378 ) ) ( HOIST-AT ?auto_19386 ?auto_19385 ) ( AVAILABLE ?auto_19386 ) ( SURFACE-AT ?auto_19375 ?auto_19385 ) ( ON ?auto_19375 ?auto_19391 ) ( CLEAR ?auto_19375 ) ( not ( = ?auto_19374 ?auto_19375 ) ) ( not ( = ?auto_19374 ?auto_19391 ) ) ( not ( = ?auto_19375 ?auto_19391 ) ) ( not ( = ?auto_19382 ?auto_19386 ) ) ( IS-CRATE ?auto_19374 ) ( not ( = ?auto_19388 ?auto_19378 ) ) ( HOIST-AT ?auto_19384 ?auto_19388 ) ( AVAILABLE ?auto_19384 ) ( SURFACE-AT ?auto_19374 ?auto_19388 ) ( ON ?auto_19374 ?auto_19383 ) ( CLEAR ?auto_19374 ) ( not ( = ?auto_19373 ?auto_19374 ) ) ( not ( = ?auto_19373 ?auto_19383 ) ) ( not ( = ?auto_19374 ?auto_19383 ) ) ( not ( = ?auto_19382 ?auto_19384 ) ) ( SURFACE-AT ?auto_19372 ?auto_19378 ) ( CLEAR ?auto_19372 ) ( IS-CRATE ?auto_19373 ) ( AVAILABLE ?auto_19382 ) ( not ( = ?auto_19387 ?auto_19378 ) ) ( HOIST-AT ?auto_19390 ?auto_19387 ) ( AVAILABLE ?auto_19390 ) ( SURFACE-AT ?auto_19373 ?auto_19387 ) ( ON ?auto_19373 ?auto_19389 ) ( CLEAR ?auto_19373 ) ( TRUCK-AT ?auto_19381 ?auto_19378 ) ( not ( = ?auto_19372 ?auto_19373 ) ) ( not ( = ?auto_19372 ?auto_19389 ) ) ( not ( = ?auto_19373 ?auto_19389 ) ) ( not ( = ?auto_19382 ?auto_19390 ) ) ( not ( = ?auto_19372 ?auto_19374 ) ) ( not ( = ?auto_19372 ?auto_19383 ) ) ( not ( = ?auto_19374 ?auto_19389 ) ) ( not ( = ?auto_19388 ?auto_19387 ) ) ( not ( = ?auto_19384 ?auto_19390 ) ) ( not ( = ?auto_19383 ?auto_19389 ) ) ( not ( = ?auto_19372 ?auto_19375 ) ) ( not ( = ?auto_19372 ?auto_19391 ) ) ( not ( = ?auto_19373 ?auto_19375 ) ) ( not ( = ?auto_19373 ?auto_19391 ) ) ( not ( = ?auto_19375 ?auto_19383 ) ) ( not ( = ?auto_19375 ?auto_19389 ) ) ( not ( = ?auto_19385 ?auto_19388 ) ) ( not ( = ?auto_19385 ?auto_19387 ) ) ( not ( = ?auto_19386 ?auto_19384 ) ) ( not ( = ?auto_19386 ?auto_19390 ) ) ( not ( = ?auto_19391 ?auto_19383 ) ) ( not ( = ?auto_19391 ?auto_19389 ) ) ( not ( = ?auto_19372 ?auto_19376 ) ) ( not ( = ?auto_19372 ?auto_19380 ) ) ( not ( = ?auto_19373 ?auto_19376 ) ) ( not ( = ?auto_19373 ?auto_19380 ) ) ( not ( = ?auto_19374 ?auto_19376 ) ) ( not ( = ?auto_19374 ?auto_19380 ) ) ( not ( = ?auto_19376 ?auto_19391 ) ) ( not ( = ?auto_19376 ?auto_19383 ) ) ( not ( = ?auto_19376 ?auto_19389 ) ) ( not ( = ?auto_19379 ?auto_19385 ) ) ( not ( = ?auto_19379 ?auto_19388 ) ) ( not ( = ?auto_19379 ?auto_19387 ) ) ( not ( = ?auto_19377 ?auto_19386 ) ) ( not ( = ?auto_19377 ?auto_19384 ) ) ( not ( = ?auto_19377 ?auto_19390 ) ) ( not ( = ?auto_19380 ?auto_19391 ) ) ( not ( = ?auto_19380 ?auto_19383 ) ) ( not ( = ?auto_19380 ?auto_19389 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19372 ?auto_19373 ?auto_19374 ?auto_19375 )
      ( MAKE-1CRATE ?auto_19375 ?auto_19376 )
      ( MAKE-4CRATE-VERIFY ?auto_19372 ?auto_19373 ?auto_19374 ?auto_19375 ?auto_19376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19394 - SURFACE
      ?auto_19395 - SURFACE
    )
    :vars
    (
      ?auto_19396 - HOIST
      ?auto_19397 - PLACE
      ?auto_19399 - PLACE
      ?auto_19400 - HOIST
      ?auto_19401 - SURFACE
      ?auto_19398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19396 ?auto_19397 ) ( SURFACE-AT ?auto_19394 ?auto_19397 ) ( CLEAR ?auto_19394 ) ( IS-CRATE ?auto_19395 ) ( AVAILABLE ?auto_19396 ) ( not ( = ?auto_19399 ?auto_19397 ) ) ( HOIST-AT ?auto_19400 ?auto_19399 ) ( AVAILABLE ?auto_19400 ) ( SURFACE-AT ?auto_19395 ?auto_19399 ) ( ON ?auto_19395 ?auto_19401 ) ( CLEAR ?auto_19395 ) ( TRUCK-AT ?auto_19398 ?auto_19397 ) ( not ( = ?auto_19394 ?auto_19395 ) ) ( not ( = ?auto_19394 ?auto_19401 ) ) ( not ( = ?auto_19395 ?auto_19401 ) ) ( not ( = ?auto_19396 ?auto_19400 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19398 ?auto_19397 ?auto_19399 )
      ( !LIFT ?auto_19400 ?auto_19395 ?auto_19401 ?auto_19399 )
      ( !LOAD ?auto_19400 ?auto_19395 ?auto_19398 ?auto_19399 )
      ( !DRIVE ?auto_19398 ?auto_19399 ?auto_19397 )
      ( !UNLOAD ?auto_19396 ?auto_19395 ?auto_19398 ?auto_19397 )
      ( !DROP ?auto_19396 ?auto_19395 ?auto_19394 ?auto_19397 )
      ( MAKE-1CRATE-VERIFY ?auto_19394 ?auto_19395 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19408 - SURFACE
      ?auto_19409 - SURFACE
      ?auto_19410 - SURFACE
      ?auto_19411 - SURFACE
      ?auto_19412 - SURFACE
      ?auto_19413 - SURFACE
    )
    :vars
    (
      ?auto_19418 - HOIST
      ?auto_19414 - PLACE
      ?auto_19416 - PLACE
      ?auto_19417 - HOIST
      ?auto_19415 - SURFACE
      ?auto_19422 - PLACE
      ?auto_19424 - HOIST
      ?auto_19421 - SURFACE
      ?auto_19426 - PLACE
      ?auto_19420 - HOIST
      ?auto_19427 - SURFACE
      ?auto_19423 - PLACE
      ?auto_19429 - HOIST
      ?auto_19425 - SURFACE
      ?auto_19428 - SURFACE
      ?auto_19419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19418 ?auto_19414 ) ( IS-CRATE ?auto_19413 ) ( not ( = ?auto_19416 ?auto_19414 ) ) ( HOIST-AT ?auto_19417 ?auto_19416 ) ( SURFACE-AT ?auto_19413 ?auto_19416 ) ( ON ?auto_19413 ?auto_19415 ) ( CLEAR ?auto_19413 ) ( not ( = ?auto_19412 ?auto_19413 ) ) ( not ( = ?auto_19412 ?auto_19415 ) ) ( not ( = ?auto_19413 ?auto_19415 ) ) ( not ( = ?auto_19418 ?auto_19417 ) ) ( IS-CRATE ?auto_19412 ) ( not ( = ?auto_19422 ?auto_19414 ) ) ( HOIST-AT ?auto_19424 ?auto_19422 ) ( AVAILABLE ?auto_19424 ) ( SURFACE-AT ?auto_19412 ?auto_19422 ) ( ON ?auto_19412 ?auto_19421 ) ( CLEAR ?auto_19412 ) ( not ( = ?auto_19411 ?auto_19412 ) ) ( not ( = ?auto_19411 ?auto_19421 ) ) ( not ( = ?auto_19412 ?auto_19421 ) ) ( not ( = ?auto_19418 ?auto_19424 ) ) ( IS-CRATE ?auto_19411 ) ( not ( = ?auto_19426 ?auto_19414 ) ) ( HOIST-AT ?auto_19420 ?auto_19426 ) ( AVAILABLE ?auto_19420 ) ( SURFACE-AT ?auto_19411 ?auto_19426 ) ( ON ?auto_19411 ?auto_19427 ) ( CLEAR ?auto_19411 ) ( not ( = ?auto_19410 ?auto_19411 ) ) ( not ( = ?auto_19410 ?auto_19427 ) ) ( not ( = ?auto_19411 ?auto_19427 ) ) ( not ( = ?auto_19418 ?auto_19420 ) ) ( IS-CRATE ?auto_19410 ) ( not ( = ?auto_19423 ?auto_19414 ) ) ( HOIST-AT ?auto_19429 ?auto_19423 ) ( AVAILABLE ?auto_19429 ) ( SURFACE-AT ?auto_19410 ?auto_19423 ) ( ON ?auto_19410 ?auto_19425 ) ( CLEAR ?auto_19410 ) ( not ( = ?auto_19409 ?auto_19410 ) ) ( not ( = ?auto_19409 ?auto_19425 ) ) ( not ( = ?auto_19410 ?auto_19425 ) ) ( not ( = ?auto_19418 ?auto_19429 ) ) ( SURFACE-AT ?auto_19408 ?auto_19414 ) ( CLEAR ?auto_19408 ) ( IS-CRATE ?auto_19409 ) ( AVAILABLE ?auto_19418 ) ( AVAILABLE ?auto_19417 ) ( SURFACE-AT ?auto_19409 ?auto_19416 ) ( ON ?auto_19409 ?auto_19428 ) ( CLEAR ?auto_19409 ) ( TRUCK-AT ?auto_19419 ?auto_19414 ) ( not ( = ?auto_19408 ?auto_19409 ) ) ( not ( = ?auto_19408 ?auto_19428 ) ) ( not ( = ?auto_19409 ?auto_19428 ) ) ( not ( = ?auto_19408 ?auto_19410 ) ) ( not ( = ?auto_19408 ?auto_19425 ) ) ( not ( = ?auto_19410 ?auto_19428 ) ) ( not ( = ?auto_19423 ?auto_19416 ) ) ( not ( = ?auto_19429 ?auto_19417 ) ) ( not ( = ?auto_19425 ?auto_19428 ) ) ( not ( = ?auto_19408 ?auto_19411 ) ) ( not ( = ?auto_19408 ?auto_19427 ) ) ( not ( = ?auto_19409 ?auto_19411 ) ) ( not ( = ?auto_19409 ?auto_19427 ) ) ( not ( = ?auto_19411 ?auto_19425 ) ) ( not ( = ?auto_19411 ?auto_19428 ) ) ( not ( = ?auto_19426 ?auto_19423 ) ) ( not ( = ?auto_19426 ?auto_19416 ) ) ( not ( = ?auto_19420 ?auto_19429 ) ) ( not ( = ?auto_19420 ?auto_19417 ) ) ( not ( = ?auto_19427 ?auto_19425 ) ) ( not ( = ?auto_19427 ?auto_19428 ) ) ( not ( = ?auto_19408 ?auto_19412 ) ) ( not ( = ?auto_19408 ?auto_19421 ) ) ( not ( = ?auto_19409 ?auto_19412 ) ) ( not ( = ?auto_19409 ?auto_19421 ) ) ( not ( = ?auto_19410 ?auto_19412 ) ) ( not ( = ?auto_19410 ?auto_19421 ) ) ( not ( = ?auto_19412 ?auto_19427 ) ) ( not ( = ?auto_19412 ?auto_19425 ) ) ( not ( = ?auto_19412 ?auto_19428 ) ) ( not ( = ?auto_19422 ?auto_19426 ) ) ( not ( = ?auto_19422 ?auto_19423 ) ) ( not ( = ?auto_19422 ?auto_19416 ) ) ( not ( = ?auto_19424 ?auto_19420 ) ) ( not ( = ?auto_19424 ?auto_19429 ) ) ( not ( = ?auto_19424 ?auto_19417 ) ) ( not ( = ?auto_19421 ?auto_19427 ) ) ( not ( = ?auto_19421 ?auto_19425 ) ) ( not ( = ?auto_19421 ?auto_19428 ) ) ( not ( = ?auto_19408 ?auto_19413 ) ) ( not ( = ?auto_19408 ?auto_19415 ) ) ( not ( = ?auto_19409 ?auto_19413 ) ) ( not ( = ?auto_19409 ?auto_19415 ) ) ( not ( = ?auto_19410 ?auto_19413 ) ) ( not ( = ?auto_19410 ?auto_19415 ) ) ( not ( = ?auto_19411 ?auto_19413 ) ) ( not ( = ?auto_19411 ?auto_19415 ) ) ( not ( = ?auto_19413 ?auto_19421 ) ) ( not ( = ?auto_19413 ?auto_19427 ) ) ( not ( = ?auto_19413 ?auto_19425 ) ) ( not ( = ?auto_19413 ?auto_19428 ) ) ( not ( = ?auto_19415 ?auto_19421 ) ) ( not ( = ?auto_19415 ?auto_19427 ) ) ( not ( = ?auto_19415 ?auto_19425 ) ) ( not ( = ?auto_19415 ?auto_19428 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19408 ?auto_19409 ?auto_19410 ?auto_19411 ?auto_19412 )
      ( MAKE-1CRATE ?auto_19412 ?auto_19413 )
      ( MAKE-5CRATE-VERIFY ?auto_19408 ?auto_19409 ?auto_19410 ?auto_19411 ?auto_19412 ?auto_19413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19432 - SURFACE
      ?auto_19433 - SURFACE
    )
    :vars
    (
      ?auto_19434 - HOIST
      ?auto_19435 - PLACE
      ?auto_19437 - PLACE
      ?auto_19438 - HOIST
      ?auto_19439 - SURFACE
      ?auto_19436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19434 ?auto_19435 ) ( SURFACE-AT ?auto_19432 ?auto_19435 ) ( CLEAR ?auto_19432 ) ( IS-CRATE ?auto_19433 ) ( AVAILABLE ?auto_19434 ) ( not ( = ?auto_19437 ?auto_19435 ) ) ( HOIST-AT ?auto_19438 ?auto_19437 ) ( AVAILABLE ?auto_19438 ) ( SURFACE-AT ?auto_19433 ?auto_19437 ) ( ON ?auto_19433 ?auto_19439 ) ( CLEAR ?auto_19433 ) ( TRUCK-AT ?auto_19436 ?auto_19435 ) ( not ( = ?auto_19432 ?auto_19433 ) ) ( not ( = ?auto_19432 ?auto_19439 ) ) ( not ( = ?auto_19433 ?auto_19439 ) ) ( not ( = ?auto_19434 ?auto_19438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19436 ?auto_19435 ?auto_19437 )
      ( !LIFT ?auto_19438 ?auto_19433 ?auto_19439 ?auto_19437 )
      ( !LOAD ?auto_19438 ?auto_19433 ?auto_19436 ?auto_19437 )
      ( !DRIVE ?auto_19436 ?auto_19437 ?auto_19435 )
      ( !UNLOAD ?auto_19434 ?auto_19433 ?auto_19436 ?auto_19435 )
      ( !DROP ?auto_19434 ?auto_19433 ?auto_19432 ?auto_19435 )
      ( MAKE-1CRATE-VERIFY ?auto_19432 ?auto_19433 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_19447 - SURFACE
      ?auto_19448 - SURFACE
      ?auto_19449 - SURFACE
      ?auto_19450 - SURFACE
      ?auto_19451 - SURFACE
      ?auto_19452 - SURFACE
      ?auto_19453 - SURFACE
    )
    :vars
    (
      ?auto_19455 - HOIST
      ?auto_19456 - PLACE
      ?auto_19458 - PLACE
      ?auto_19454 - HOIST
      ?auto_19457 - SURFACE
      ?auto_19464 - PLACE
      ?auto_19470 - HOIST
      ?auto_19463 - SURFACE
      ?auto_19465 - PLACE
      ?auto_19467 - HOIST
      ?auto_19466 - SURFACE
      ?auto_19469 - PLACE
      ?auto_19462 - HOIST
      ?auto_19460 - SURFACE
      ?auto_19468 - SURFACE
      ?auto_19461 - SURFACE
      ?auto_19459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19455 ?auto_19456 ) ( IS-CRATE ?auto_19453 ) ( not ( = ?auto_19458 ?auto_19456 ) ) ( HOIST-AT ?auto_19454 ?auto_19458 ) ( SURFACE-AT ?auto_19453 ?auto_19458 ) ( ON ?auto_19453 ?auto_19457 ) ( CLEAR ?auto_19453 ) ( not ( = ?auto_19452 ?auto_19453 ) ) ( not ( = ?auto_19452 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19454 ) ) ( IS-CRATE ?auto_19452 ) ( not ( = ?auto_19464 ?auto_19456 ) ) ( HOIST-AT ?auto_19470 ?auto_19464 ) ( SURFACE-AT ?auto_19452 ?auto_19464 ) ( ON ?auto_19452 ?auto_19463 ) ( CLEAR ?auto_19452 ) ( not ( = ?auto_19451 ?auto_19452 ) ) ( not ( = ?auto_19451 ?auto_19463 ) ) ( not ( = ?auto_19452 ?auto_19463 ) ) ( not ( = ?auto_19455 ?auto_19470 ) ) ( IS-CRATE ?auto_19451 ) ( not ( = ?auto_19465 ?auto_19456 ) ) ( HOIST-AT ?auto_19467 ?auto_19465 ) ( AVAILABLE ?auto_19467 ) ( SURFACE-AT ?auto_19451 ?auto_19465 ) ( ON ?auto_19451 ?auto_19466 ) ( CLEAR ?auto_19451 ) ( not ( = ?auto_19450 ?auto_19451 ) ) ( not ( = ?auto_19450 ?auto_19466 ) ) ( not ( = ?auto_19451 ?auto_19466 ) ) ( not ( = ?auto_19455 ?auto_19467 ) ) ( IS-CRATE ?auto_19450 ) ( not ( = ?auto_19469 ?auto_19456 ) ) ( HOIST-AT ?auto_19462 ?auto_19469 ) ( AVAILABLE ?auto_19462 ) ( SURFACE-AT ?auto_19450 ?auto_19469 ) ( ON ?auto_19450 ?auto_19460 ) ( CLEAR ?auto_19450 ) ( not ( = ?auto_19449 ?auto_19450 ) ) ( not ( = ?auto_19449 ?auto_19460 ) ) ( not ( = ?auto_19450 ?auto_19460 ) ) ( not ( = ?auto_19455 ?auto_19462 ) ) ( IS-CRATE ?auto_19449 ) ( AVAILABLE ?auto_19454 ) ( SURFACE-AT ?auto_19449 ?auto_19458 ) ( ON ?auto_19449 ?auto_19468 ) ( CLEAR ?auto_19449 ) ( not ( = ?auto_19448 ?auto_19449 ) ) ( not ( = ?auto_19448 ?auto_19468 ) ) ( not ( = ?auto_19449 ?auto_19468 ) ) ( SURFACE-AT ?auto_19447 ?auto_19456 ) ( CLEAR ?auto_19447 ) ( IS-CRATE ?auto_19448 ) ( AVAILABLE ?auto_19455 ) ( AVAILABLE ?auto_19470 ) ( SURFACE-AT ?auto_19448 ?auto_19464 ) ( ON ?auto_19448 ?auto_19461 ) ( CLEAR ?auto_19448 ) ( TRUCK-AT ?auto_19459 ?auto_19456 ) ( not ( = ?auto_19447 ?auto_19448 ) ) ( not ( = ?auto_19447 ?auto_19461 ) ) ( not ( = ?auto_19448 ?auto_19461 ) ) ( not ( = ?auto_19447 ?auto_19449 ) ) ( not ( = ?auto_19447 ?auto_19468 ) ) ( not ( = ?auto_19449 ?auto_19461 ) ) ( not ( = ?auto_19458 ?auto_19464 ) ) ( not ( = ?auto_19454 ?auto_19470 ) ) ( not ( = ?auto_19468 ?auto_19461 ) ) ( not ( = ?auto_19447 ?auto_19450 ) ) ( not ( = ?auto_19447 ?auto_19460 ) ) ( not ( = ?auto_19448 ?auto_19450 ) ) ( not ( = ?auto_19448 ?auto_19460 ) ) ( not ( = ?auto_19450 ?auto_19468 ) ) ( not ( = ?auto_19450 ?auto_19461 ) ) ( not ( = ?auto_19469 ?auto_19458 ) ) ( not ( = ?auto_19469 ?auto_19464 ) ) ( not ( = ?auto_19462 ?auto_19454 ) ) ( not ( = ?auto_19462 ?auto_19470 ) ) ( not ( = ?auto_19460 ?auto_19468 ) ) ( not ( = ?auto_19460 ?auto_19461 ) ) ( not ( = ?auto_19447 ?auto_19451 ) ) ( not ( = ?auto_19447 ?auto_19466 ) ) ( not ( = ?auto_19448 ?auto_19451 ) ) ( not ( = ?auto_19448 ?auto_19466 ) ) ( not ( = ?auto_19449 ?auto_19451 ) ) ( not ( = ?auto_19449 ?auto_19466 ) ) ( not ( = ?auto_19451 ?auto_19460 ) ) ( not ( = ?auto_19451 ?auto_19468 ) ) ( not ( = ?auto_19451 ?auto_19461 ) ) ( not ( = ?auto_19465 ?auto_19469 ) ) ( not ( = ?auto_19465 ?auto_19458 ) ) ( not ( = ?auto_19465 ?auto_19464 ) ) ( not ( = ?auto_19467 ?auto_19462 ) ) ( not ( = ?auto_19467 ?auto_19454 ) ) ( not ( = ?auto_19467 ?auto_19470 ) ) ( not ( = ?auto_19466 ?auto_19460 ) ) ( not ( = ?auto_19466 ?auto_19468 ) ) ( not ( = ?auto_19466 ?auto_19461 ) ) ( not ( = ?auto_19447 ?auto_19452 ) ) ( not ( = ?auto_19447 ?auto_19463 ) ) ( not ( = ?auto_19448 ?auto_19452 ) ) ( not ( = ?auto_19448 ?auto_19463 ) ) ( not ( = ?auto_19449 ?auto_19452 ) ) ( not ( = ?auto_19449 ?auto_19463 ) ) ( not ( = ?auto_19450 ?auto_19452 ) ) ( not ( = ?auto_19450 ?auto_19463 ) ) ( not ( = ?auto_19452 ?auto_19466 ) ) ( not ( = ?auto_19452 ?auto_19460 ) ) ( not ( = ?auto_19452 ?auto_19468 ) ) ( not ( = ?auto_19452 ?auto_19461 ) ) ( not ( = ?auto_19463 ?auto_19466 ) ) ( not ( = ?auto_19463 ?auto_19460 ) ) ( not ( = ?auto_19463 ?auto_19468 ) ) ( not ( = ?auto_19463 ?auto_19461 ) ) ( not ( = ?auto_19447 ?auto_19453 ) ) ( not ( = ?auto_19447 ?auto_19457 ) ) ( not ( = ?auto_19448 ?auto_19453 ) ) ( not ( = ?auto_19448 ?auto_19457 ) ) ( not ( = ?auto_19449 ?auto_19453 ) ) ( not ( = ?auto_19449 ?auto_19457 ) ) ( not ( = ?auto_19450 ?auto_19453 ) ) ( not ( = ?auto_19450 ?auto_19457 ) ) ( not ( = ?auto_19451 ?auto_19453 ) ) ( not ( = ?auto_19451 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19463 ) ) ( not ( = ?auto_19453 ?auto_19466 ) ) ( not ( = ?auto_19453 ?auto_19460 ) ) ( not ( = ?auto_19453 ?auto_19468 ) ) ( not ( = ?auto_19453 ?auto_19461 ) ) ( not ( = ?auto_19457 ?auto_19463 ) ) ( not ( = ?auto_19457 ?auto_19466 ) ) ( not ( = ?auto_19457 ?auto_19460 ) ) ( not ( = ?auto_19457 ?auto_19468 ) ) ( not ( = ?auto_19457 ?auto_19461 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19447 ?auto_19448 ?auto_19449 ?auto_19450 ?auto_19451 ?auto_19452 )
      ( MAKE-1CRATE ?auto_19452 ?auto_19453 )
      ( MAKE-6CRATE-VERIFY ?auto_19447 ?auto_19448 ?auto_19449 ?auto_19450 ?auto_19451 ?auto_19452 ?auto_19453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19473 - SURFACE
      ?auto_19474 - SURFACE
    )
    :vars
    (
      ?auto_19475 - HOIST
      ?auto_19476 - PLACE
      ?auto_19478 - PLACE
      ?auto_19479 - HOIST
      ?auto_19480 - SURFACE
      ?auto_19477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19475 ?auto_19476 ) ( SURFACE-AT ?auto_19473 ?auto_19476 ) ( CLEAR ?auto_19473 ) ( IS-CRATE ?auto_19474 ) ( AVAILABLE ?auto_19475 ) ( not ( = ?auto_19478 ?auto_19476 ) ) ( HOIST-AT ?auto_19479 ?auto_19478 ) ( AVAILABLE ?auto_19479 ) ( SURFACE-AT ?auto_19474 ?auto_19478 ) ( ON ?auto_19474 ?auto_19480 ) ( CLEAR ?auto_19474 ) ( TRUCK-AT ?auto_19477 ?auto_19476 ) ( not ( = ?auto_19473 ?auto_19474 ) ) ( not ( = ?auto_19473 ?auto_19480 ) ) ( not ( = ?auto_19474 ?auto_19480 ) ) ( not ( = ?auto_19475 ?auto_19479 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19477 ?auto_19476 ?auto_19478 )
      ( !LIFT ?auto_19479 ?auto_19474 ?auto_19480 ?auto_19478 )
      ( !LOAD ?auto_19479 ?auto_19474 ?auto_19477 ?auto_19478 )
      ( !DRIVE ?auto_19477 ?auto_19478 ?auto_19476 )
      ( !UNLOAD ?auto_19475 ?auto_19474 ?auto_19477 ?auto_19476 )
      ( !DROP ?auto_19475 ?auto_19474 ?auto_19473 ?auto_19476 )
      ( MAKE-1CRATE-VERIFY ?auto_19473 ?auto_19474 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_19489 - SURFACE
      ?auto_19490 - SURFACE
      ?auto_19491 - SURFACE
      ?auto_19492 - SURFACE
      ?auto_19493 - SURFACE
      ?auto_19494 - SURFACE
      ?auto_19495 - SURFACE
      ?auto_19496 - SURFACE
    )
    :vars
    (
      ?auto_19502 - HOIST
      ?auto_19499 - PLACE
      ?auto_19497 - PLACE
      ?auto_19500 - HOIST
      ?auto_19501 - SURFACE
      ?auto_19509 - PLACE
      ?auto_19513 - HOIST
      ?auto_19504 - SURFACE
      ?auto_19511 - PLACE
      ?auto_19503 - HOIST
      ?auto_19512 - SURFACE
      ?auto_19510 - SURFACE
      ?auto_19508 - PLACE
      ?auto_19505 - HOIST
      ?auto_19514 - SURFACE
      ?auto_19507 - SURFACE
      ?auto_19506 - SURFACE
      ?auto_19498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19502 ?auto_19499 ) ( IS-CRATE ?auto_19496 ) ( not ( = ?auto_19497 ?auto_19499 ) ) ( HOIST-AT ?auto_19500 ?auto_19497 ) ( SURFACE-AT ?auto_19496 ?auto_19497 ) ( ON ?auto_19496 ?auto_19501 ) ( CLEAR ?auto_19496 ) ( not ( = ?auto_19495 ?auto_19496 ) ) ( not ( = ?auto_19495 ?auto_19501 ) ) ( not ( = ?auto_19496 ?auto_19501 ) ) ( not ( = ?auto_19502 ?auto_19500 ) ) ( IS-CRATE ?auto_19495 ) ( not ( = ?auto_19509 ?auto_19499 ) ) ( HOIST-AT ?auto_19513 ?auto_19509 ) ( SURFACE-AT ?auto_19495 ?auto_19509 ) ( ON ?auto_19495 ?auto_19504 ) ( CLEAR ?auto_19495 ) ( not ( = ?auto_19494 ?auto_19495 ) ) ( not ( = ?auto_19494 ?auto_19504 ) ) ( not ( = ?auto_19495 ?auto_19504 ) ) ( not ( = ?auto_19502 ?auto_19513 ) ) ( IS-CRATE ?auto_19494 ) ( not ( = ?auto_19511 ?auto_19499 ) ) ( HOIST-AT ?auto_19503 ?auto_19511 ) ( SURFACE-AT ?auto_19494 ?auto_19511 ) ( ON ?auto_19494 ?auto_19512 ) ( CLEAR ?auto_19494 ) ( not ( = ?auto_19493 ?auto_19494 ) ) ( not ( = ?auto_19493 ?auto_19512 ) ) ( not ( = ?auto_19494 ?auto_19512 ) ) ( not ( = ?auto_19502 ?auto_19503 ) ) ( IS-CRATE ?auto_19493 ) ( AVAILABLE ?auto_19500 ) ( SURFACE-AT ?auto_19493 ?auto_19497 ) ( ON ?auto_19493 ?auto_19510 ) ( CLEAR ?auto_19493 ) ( not ( = ?auto_19492 ?auto_19493 ) ) ( not ( = ?auto_19492 ?auto_19510 ) ) ( not ( = ?auto_19493 ?auto_19510 ) ) ( IS-CRATE ?auto_19492 ) ( not ( = ?auto_19508 ?auto_19499 ) ) ( HOIST-AT ?auto_19505 ?auto_19508 ) ( AVAILABLE ?auto_19505 ) ( SURFACE-AT ?auto_19492 ?auto_19508 ) ( ON ?auto_19492 ?auto_19514 ) ( CLEAR ?auto_19492 ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19514 ) ) ( not ( = ?auto_19492 ?auto_19514 ) ) ( not ( = ?auto_19502 ?auto_19505 ) ) ( IS-CRATE ?auto_19491 ) ( AVAILABLE ?auto_19513 ) ( SURFACE-AT ?auto_19491 ?auto_19509 ) ( ON ?auto_19491 ?auto_19507 ) ( CLEAR ?auto_19491 ) ( not ( = ?auto_19490 ?auto_19491 ) ) ( not ( = ?auto_19490 ?auto_19507 ) ) ( not ( = ?auto_19491 ?auto_19507 ) ) ( SURFACE-AT ?auto_19489 ?auto_19499 ) ( CLEAR ?auto_19489 ) ( IS-CRATE ?auto_19490 ) ( AVAILABLE ?auto_19502 ) ( AVAILABLE ?auto_19503 ) ( SURFACE-AT ?auto_19490 ?auto_19511 ) ( ON ?auto_19490 ?auto_19506 ) ( CLEAR ?auto_19490 ) ( TRUCK-AT ?auto_19498 ?auto_19499 ) ( not ( = ?auto_19489 ?auto_19490 ) ) ( not ( = ?auto_19489 ?auto_19506 ) ) ( not ( = ?auto_19490 ?auto_19506 ) ) ( not ( = ?auto_19489 ?auto_19491 ) ) ( not ( = ?auto_19489 ?auto_19507 ) ) ( not ( = ?auto_19491 ?auto_19506 ) ) ( not ( = ?auto_19509 ?auto_19511 ) ) ( not ( = ?auto_19513 ?auto_19503 ) ) ( not ( = ?auto_19507 ?auto_19506 ) ) ( not ( = ?auto_19489 ?auto_19492 ) ) ( not ( = ?auto_19489 ?auto_19514 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19490 ?auto_19514 ) ) ( not ( = ?auto_19492 ?auto_19507 ) ) ( not ( = ?auto_19492 ?auto_19506 ) ) ( not ( = ?auto_19508 ?auto_19509 ) ) ( not ( = ?auto_19508 ?auto_19511 ) ) ( not ( = ?auto_19505 ?auto_19513 ) ) ( not ( = ?auto_19505 ?auto_19503 ) ) ( not ( = ?auto_19514 ?auto_19507 ) ) ( not ( = ?auto_19514 ?auto_19506 ) ) ( not ( = ?auto_19489 ?auto_19493 ) ) ( not ( = ?auto_19489 ?auto_19510 ) ) ( not ( = ?auto_19490 ?auto_19493 ) ) ( not ( = ?auto_19490 ?auto_19510 ) ) ( not ( = ?auto_19491 ?auto_19493 ) ) ( not ( = ?auto_19491 ?auto_19510 ) ) ( not ( = ?auto_19493 ?auto_19514 ) ) ( not ( = ?auto_19493 ?auto_19507 ) ) ( not ( = ?auto_19493 ?auto_19506 ) ) ( not ( = ?auto_19497 ?auto_19508 ) ) ( not ( = ?auto_19497 ?auto_19509 ) ) ( not ( = ?auto_19497 ?auto_19511 ) ) ( not ( = ?auto_19500 ?auto_19505 ) ) ( not ( = ?auto_19500 ?auto_19513 ) ) ( not ( = ?auto_19500 ?auto_19503 ) ) ( not ( = ?auto_19510 ?auto_19514 ) ) ( not ( = ?auto_19510 ?auto_19507 ) ) ( not ( = ?auto_19510 ?auto_19506 ) ) ( not ( = ?auto_19489 ?auto_19494 ) ) ( not ( = ?auto_19489 ?auto_19512 ) ) ( not ( = ?auto_19490 ?auto_19494 ) ) ( not ( = ?auto_19490 ?auto_19512 ) ) ( not ( = ?auto_19491 ?auto_19494 ) ) ( not ( = ?auto_19491 ?auto_19512 ) ) ( not ( = ?auto_19492 ?auto_19494 ) ) ( not ( = ?auto_19492 ?auto_19512 ) ) ( not ( = ?auto_19494 ?auto_19510 ) ) ( not ( = ?auto_19494 ?auto_19514 ) ) ( not ( = ?auto_19494 ?auto_19507 ) ) ( not ( = ?auto_19494 ?auto_19506 ) ) ( not ( = ?auto_19512 ?auto_19510 ) ) ( not ( = ?auto_19512 ?auto_19514 ) ) ( not ( = ?auto_19512 ?auto_19507 ) ) ( not ( = ?auto_19512 ?auto_19506 ) ) ( not ( = ?auto_19489 ?auto_19495 ) ) ( not ( = ?auto_19489 ?auto_19504 ) ) ( not ( = ?auto_19490 ?auto_19495 ) ) ( not ( = ?auto_19490 ?auto_19504 ) ) ( not ( = ?auto_19491 ?auto_19495 ) ) ( not ( = ?auto_19491 ?auto_19504 ) ) ( not ( = ?auto_19492 ?auto_19495 ) ) ( not ( = ?auto_19492 ?auto_19504 ) ) ( not ( = ?auto_19493 ?auto_19495 ) ) ( not ( = ?auto_19493 ?auto_19504 ) ) ( not ( = ?auto_19495 ?auto_19512 ) ) ( not ( = ?auto_19495 ?auto_19510 ) ) ( not ( = ?auto_19495 ?auto_19514 ) ) ( not ( = ?auto_19495 ?auto_19507 ) ) ( not ( = ?auto_19495 ?auto_19506 ) ) ( not ( = ?auto_19504 ?auto_19512 ) ) ( not ( = ?auto_19504 ?auto_19510 ) ) ( not ( = ?auto_19504 ?auto_19514 ) ) ( not ( = ?auto_19504 ?auto_19507 ) ) ( not ( = ?auto_19504 ?auto_19506 ) ) ( not ( = ?auto_19489 ?auto_19496 ) ) ( not ( = ?auto_19489 ?auto_19501 ) ) ( not ( = ?auto_19490 ?auto_19496 ) ) ( not ( = ?auto_19490 ?auto_19501 ) ) ( not ( = ?auto_19491 ?auto_19496 ) ) ( not ( = ?auto_19491 ?auto_19501 ) ) ( not ( = ?auto_19492 ?auto_19496 ) ) ( not ( = ?auto_19492 ?auto_19501 ) ) ( not ( = ?auto_19493 ?auto_19496 ) ) ( not ( = ?auto_19493 ?auto_19501 ) ) ( not ( = ?auto_19494 ?auto_19496 ) ) ( not ( = ?auto_19494 ?auto_19501 ) ) ( not ( = ?auto_19496 ?auto_19504 ) ) ( not ( = ?auto_19496 ?auto_19512 ) ) ( not ( = ?auto_19496 ?auto_19510 ) ) ( not ( = ?auto_19496 ?auto_19514 ) ) ( not ( = ?auto_19496 ?auto_19507 ) ) ( not ( = ?auto_19496 ?auto_19506 ) ) ( not ( = ?auto_19501 ?auto_19504 ) ) ( not ( = ?auto_19501 ?auto_19512 ) ) ( not ( = ?auto_19501 ?auto_19510 ) ) ( not ( = ?auto_19501 ?auto_19514 ) ) ( not ( = ?auto_19501 ?auto_19507 ) ) ( not ( = ?auto_19501 ?auto_19506 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_19489 ?auto_19490 ?auto_19491 ?auto_19492 ?auto_19493 ?auto_19494 ?auto_19495 )
      ( MAKE-1CRATE ?auto_19495 ?auto_19496 )
      ( MAKE-7CRATE-VERIFY ?auto_19489 ?auto_19490 ?auto_19491 ?auto_19492 ?auto_19493 ?auto_19494 ?auto_19495 ?auto_19496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19517 - SURFACE
      ?auto_19518 - SURFACE
    )
    :vars
    (
      ?auto_19519 - HOIST
      ?auto_19520 - PLACE
      ?auto_19522 - PLACE
      ?auto_19523 - HOIST
      ?auto_19524 - SURFACE
      ?auto_19521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19519 ?auto_19520 ) ( SURFACE-AT ?auto_19517 ?auto_19520 ) ( CLEAR ?auto_19517 ) ( IS-CRATE ?auto_19518 ) ( AVAILABLE ?auto_19519 ) ( not ( = ?auto_19522 ?auto_19520 ) ) ( HOIST-AT ?auto_19523 ?auto_19522 ) ( AVAILABLE ?auto_19523 ) ( SURFACE-AT ?auto_19518 ?auto_19522 ) ( ON ?auto_19518 ?auto_19524 ) ( CLEAR ?auto_19518 ) ( TRUCK-AT ?auto_19521 ?auto_19520 ) ( not ( = ?auto_19517 ?auto_19518 ) ) ( not ( = ?auto_19517 ?auto_19524 ) ) ( not ( = ?auto_19518 ?auto_19524 ) ) ( not ( = ?auto_19519 ?auto_19523 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19521 ?auto_19520 ?auto_19522 )
      ( !LIFT ?auto_19523 ?auto_19518 ?auto_19524 ?auto_19522 )
      ( !LOAD ?auto_19523 ?auto_19518 ?auto_19521 ?auto_19522 )
      ( !DRIVE ?auto_19521 ?auto_19522 ?auto_19520 )
      ( !UNLOAD ?auto_19519 ?auto_19518 ?auto_19521 ?auto_19520 )
      ( !DROP ?auto_19519 ?auto_19518 ?auto_19517 ?auto_19520 )
      ( MAKE-1CRATE-VERIFY ?auto_19517 ?auto_19518 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_19534 - SURFACE
      ?auto_19535 - SURFACE
      ?auto_19536 - SURFACE
      ?auto_19537 - SURFACE
      ?auto_19538 - SURFACE
      ?auto_19539 - SURFACE
      ?auto_19540 - SURFACE
      ?auto_19542 - SURFACE
      ?auto_19541 - SURFACE
    )
    :vars
    (
      ?auto_19546 - HOIST
      ?auto_19547 - PLACE
      ?auto_19545 - PLACE
      ?auto_19544 - HOIST
      ?auto_19543 - SURFACE
      ?auto_19550 - PLACE
      ?auto_19553 - HOIST
      ?auto_19554 - SURFACE
      ?auto_19556 - PLACE
      ?auto_19560 - HOIST
      ?auto_19555 - SURFACE
      ?auto_19559 - PLACE
      ?auto_19552 - HOIST
      ?auto_19561 - SURFACE
      ?auto_19563 - SURFACE
      ?auto_19557 - PLACE
      ?auto_19551 - HOIST
      ?auto_19562 - SURFACE
      ?auto_19558 - SURFACE
      ?auto_19549 - SURFACE
      ?auto_19548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19546 ?auto_19547 ) ( IS-CRATE ?auto_19541 ) ( not ( = ?auto_19545 ?auto_19547 ) ) ( HOIST-AT ?auto_19544 ?auto_19545 ) ( AVAILABLE ?auto_19544 ) ( SURFACE-AT ?auto_19541 ?auto_19545 ) ( ON ?auto_19541 ?auto_19543 ) ( CLEAR ?auto_19541 ) ( not ( = ?auto_19542 ?auto_19541 ) ) ( not ( = ?auto_19542 ?auto_19543 ) ) ( not ( = ?auto_19541 ?auto_19543 ) ) ( not ( = ?auto_19546 ?auto_19544 ) ) ( IS-CRATE ?auto_19542 ) ( not ( = ?auto_19550 ?auto_19547 ) ) ( HOIST-AT ?auto_19553 ?auto_19550 ) ( SURFACE-AT ?auto_19542 ?auto_19550 ) ( ON ?auto_19542 ?auto_19554 ) ( CLEAR ?auto_19542 ) ( not ( = ?auto_19540 ?auto_19542 ) ) ( not ( = ?auto_19540 ?auto_19554 ) ) ( not ( = ?auto_19542 ?auto_19554 ) ) ( not ( = ?auto_19546 ?auto_19553 ) ) ( IS-CRATE ?auto_19540 ) ( not ( = ?auto_19556 ?auto_19547 ) ) ( HOIST-AT ?auto_19560 ?auto_19556 ) ( SURFACE-AT ?auto_19540 ?auto_19556 ) ( ON ?auto_19540 ?auto_19555 ) ( CLEAR ?auto_19540 ) ( not ( = ?auto_19539 ?auto_19540 ) ) ( not ( = ?auto_19539 ?auto_19555 ) ) ( not ( = ?auto_19540 ?auto_19555 ) ) ( not ( = ?auto_19546 ?auto_19560 ) ) ( IS-CRATE ?auto_19539 ) ( not ( = ?auto_19559 ?auto_19547 ) ) ( HOIST-AT ?auto_19552 ?auto_19559 ) ( SURFACE-AT ?auto_19539 ?auto_19559 ) ( ON ?auto_19539 ?auto_19561 ) ( CLEAR ?auto_19539 ) ( not ( = ?auto_19538 ?auto_19539 ) ) ( not ( = ?auto_19538 ?auto_19561 ) ) ( not ( = ?auto_19539 ?auto_19561 ) ) ( not ( = ?auto_19546 ?auto_19552 ) ) ( IS-CRATE ?auto_19538 ) ( AVAILABLE ?auto_19553 ) ( SURFACE-AT ?auto_19538 ?auto_19550 ) ( ON ?auto_19538 ?auto_19563 ) ( CLEAR ?auto_19538 ) ( not ( = ?auto_19537 ?auto_19538 ) ) ( not ( = ?auto_19537 ?auto_19563 ) ) ( not ( = ?auto_19538 ?auto_19563 ) ) ( IS-CRATE ?auto_19537 ) ( not ( = ?auto_19557 ?auto_19547 ) ) ( HOIST-AT ?auto_19551 ?auto_19557 ) ( AVAILABLE ?auto_19551 ) ( SURFACE-AT ?auto_19537 ?auto_19557 ) ( ON ?auto_19537 ?auto_19562 ) ( CLEAR ?auto_19537 ) ( not ( = ?auto_19536 ?auto_19537 ) ) ( not ( = ?auto_19536 ?auto_19562 ) ) ( not ( = ?auto_19537 ?auto_19562 ) ) ( not ( = ?auto_19546 ?auto_19551 ) ) ( IS-CRATE ?auto_19536 ) ( AVAILABLE ?auto_19560 ) ( SURFACE-AT ?auto_19536 ?auto_19556 ) ( ON ?auto_19536 ?auto_19558 ) ( CLEAR ?auto_19536 ) ( not ( = ?auto_19535 ?auto_19536 ) ) ( not ( = ?auto_19535 ?auto_19558 ) ) ( not ( = ?auto_19536 ?auto_19558 ) ) ( SURFACE-AT ?auto_19534 ?auto_19547 ) ( CLEAR ?auto_19534 ) ( IS-CRATE ?auto_19535 ) ( AVAILABLE ?auto_19546 ) ( AVAILABLE ?auto_19552 ) ( SURFACE-AT ?auto_19535 ?auto_19559 ) ( ON ?auto_19535 ?auto_19549 ) ( CLEAR ?auto_19535 ) ( TRUCK-AT ?auto_19548 ?auto_19547 ) ( not ( = ?auto_19534 ?auto_19535 ) ) ( not ( = ?auto_19534 ?auto_19549 ) ) ( not ( = ?auto_19535 ?auto_19549 ) ) ( not ( = ?auto_19534 ?auto_19536 ) ) ( not ( = ?auto_19534 ?auto_19558 ) ) ( not ( = ?auto_19536 ?auto_19549 ) ) ( not ( = ?auto_19556 ?auto_19559 ) ) ( not ( = ?auto_19560 ?auto_19552 ) ) ( not ( = ?auto_19558 ?auto_19549 ) ) ( not ( = ?auto_19534 ?auto_19537 ) ) ( not ( = ?auto_19534 ?auto_19562 ) ) ( not ( = ?auto_19535 ?auto_19537 ) ) ( not ( = ?auto_19535 ?auto_19562 ) ) ( not ( = ?auto_19537 ?auto_19558 ) ) ( not ( = ?auto_19537 ?auto_19549 ) ) ( not ( = ?auto_19557 ?auto_19556 ) ) ( not ( = ?auto_19557 ?auto_19559 ) ) ( not ( = ?auto_19551 ?auto_19560 ) ) ( not ( = ?auto_19551 ?auto_19552 ) ) ( not ( = ?auto_19562 ?auto_19558 ) ) ( not ( = ?auto_19562 ?auto_19549 ) ) ( not ( = ?auto_19534 ?auto_19538 ) ) ( not ( = ?auto_19534 ?auto_19563 ) ) ( not ( = ?auto_19535 ?auto_19538 ) ) ( not ( = ?auto_19535 ?auto_19563 ) ) ( not ( = ?auto_19536 ?auto_19538 ) ) ( not ( = ?auto_19536 ?auto_19563 ) ) ( not ( = ?auto_19538 ?auto_19562 ) ) ( not ( = ?auto_19538 ?auto_19558 ) ) ( not ( = ?auto_19538 ?auto_19549 ) ) ( not ( = ?auto_19550 ?auto_19557 ) ) ( not ( = ?auto_19550 ?auto_19556 ) ) ( not ( = ?auto_19550 ?auto_19559 ) ) ( not ( = ?auto_19553 ?auto_19551 ) ) ( not ( = ?auto_19553 ?auto_19560 ) ) ( not ( = ?auto_19553 ?auto_19552 ) ) ( not ( = ?auto_19563 ?auto_19562 ) ) ( not ( = ?auto_19563 ?auto_19558 ) ) ( not ( = ?auto_19563 ?auto_19549 ) ) ( not ( = ?auto_19534 ?auto_19539 ) ) ( not ( = ?auto_19534 ?auto_19561 ) ) ( not ( = ?auto_19535 ?auto_19539 ) ) ( not ( = ?auto_19535 ?auto_19561 ) ) ( not ( = ?auto_19536 ?auto_19539 ) ) ( not ( = ?auto_19536 ?auto_19561 ) ) ( not ( = ?auto_19537 ?auto_19539 ) ) ( not ( = ?auto_19537 ?auto_19561 ) ) ( not ( = ?auto_19539 ?auto_19563 ) ) ( not ( = ?auto_19539 ?auto_19562 ) ) ( not ( = ?auto_19539 ?auto_19558 ) ) ( not ( = ?auto_19539 ?auto_19549 ) ) ( not ( = ?auto_19561 ?auto_19563 ) ) ( not ( = ?auto_19561 ?auto_19562 ) ) ( not ( = ?auto_19561 ?auto_19558 ) ) ( not ( = ?auto_19561 ?auto_19549 ) ) ( not ( = ?auto_19534 ?auto_19540 ) ) ( not ( = ?auto_19534 ?auto_19555 ) ) ( not ( = ?auto_19535 ?auto_19540 ) ) ( not ( = ?auto_19535 ?auto_19555 ) ) ( not ( = ?auto_19536 ?auto_19540 ) ) ( not ( = ?auto_19536 ?auto_19555 ) ) ( not ( = ?auto_19537 ?auto_19540 ) ) ( not ( = ?auto_19537 ?auto_19555 ) ) ( not ( = ?auto_19538 ?auto_19540 ) ) ( not ( = ?auto_19538 ?auto_19555 ) ) ( not ( = ?auto_19540 ?auto_19561 ) ) ( not ( = ?auto_19540 ?auto_19563 ) ) ( not ( = ?auto_19540 ?auto_19562 ) ) ( not ( = ?auto_19540 ?auto_19558 ) ) ( not ( = ?auto_19540 ?auto_19549 ) ) ( not ( = ?auto_19555 ?auto_19561 ) ) ( not ( = ?auto_19555 ?auto_19563 ) ) ( not ( = ?auto_19555 ?auto_19562 ) ) ( not ( = ?auto_19555 ?auto_19558 ) ) ( not ( = ?auto_19555 ?auto_19549 ) ) ( not ( = ?auto_19534 ?auto_19542 ) ) ( not ( = ?auto_19534 ?auto_19554 ) ) ( not ( = ?auto_19535 ?auto_19542 ) ) ( not ( = ?auto_19535 ?auto_19554 ) ) ( not ( = ?auto_19536 ?auto_19542 ) ) ( not ( = ?auto_19536 ?auto_19554 ) ) ( not ( = ?auto_19537 ?auto_19542 ) ) ( not ( = ?auto_19537 ?auto_19554 ) ) ( not ( = ?auto_19538 ?auto_19542 ) ) ( not ( = ?auto_19538 ?auto_19554 ) ) ( not ( = ?auto_19539 ?auto_19542 ) ) ( not ( = ?auto_19539 ?auto_19554 ) ) ( not ( = ?auto_19542 ?auto_19555 ) ) ( not ( = ?auto_19542 ?auto_19561 ) ) ( not ( = ?auto_19542 ?auto_19563 ) ) ( not ( = ?auto_19542 ?auto_19562 ) ) ( not ( = ?auto_19542 ?auto_19558 ) ) ( not ( = ?auto_19542 ?auto_19549 ) ) ( not ( = ?auto_19554 ?auto_19555 ) ) ( not ( = ?auto_19554 ?auto_19561 ) ) ( not ( = ?auto_19554 ?auto_19563 ) ) ( not ( = ?auto_19554 ?auto_19562 ) ) ( not ( = ?auto_19554 ?auto_19558 ) ) ( not ( = ?auto_19554 ?auto_19549 ) ) ( not ( = ?auto_19534 ?auto_19541 ) ) ( not ( = ?auto_19534 ?auto_19543 ) ) ( not ( = ?auto_19535 ?auto_19541 ) ) ( not ( = ?auto_19535 ?auto_19543 ) ) ( not ( = ?auto_19536 ?auto_19541 ) ) ( not ( = ?auto_19536 ?auto_19543 ) ) ( not ( = ?auto_19537 ?auto_19541 ) ) ( not ( = ?auto_19537 ?auto_19543 ) ) ( not ( = ?auto_19538 ?auto_19541 ) ) ( not ( = ?auto_19538 ?auto_19543 ) ) ( not ( = ?auto_19539 ?auto_19541 ) ) ( not ( = ?auto_19539 ?auto_19543 ) ) ( not ( = ?auto_19540 ?auto_19541 ) ) ( not ( = ?auto_19540 ?auto_19543 ) ) ( not ( = ?auto_19541 ?auto_19554 ) ) ( not ( = ?auto_19541 ?auto_19555 ) ) ( not ( = ?auto_19541 ?auto_19561 ) ) ( not ( = ?auto_19541 ?auto_19563 ) ) ( not ( = ?auto_19541 ?auto_19562 ) ) ( not ( = ?auto_19541 ?auto_19558 ) ) ( not ( = ?auto_19541 ?auto_19549 ) ) ( not ( = ?auto_19545 ?auto_19550 ) ) ( not ( = ?auto_19545 ?auto_19556 ) ) ( not ( = ?auto_19545 ?auto_19559 ) ) ( not ( = ?auto_19545 ?auto_19557 ) ) ( not ( = ?auto_19544 ?auto_19553 ) ) ( not ( = ?auto_19544 ?auto_19560 ) ) ( not ( = ?auto_19544 ?auto_19552 ) ) ( not ( = ?auto_19544 ?auto_19551 ) ) ( not ( = ?auto_19543 ?auto_19554 ) ) ( not ( = ?auto_19543 ?auto_19555 ) ) ( not ( = ?auto_19543 ?auto_19561 ) ) ( not ( = ?auto_19543 ?auto_19563 ) ) ( not ( = ?auto_19543 ?auto_19562 ) ) ( not ( = ?auto_19543 ?auto_19558 ) ) ( not ( = ?auto_19543 ?auto_19549 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_19534 ?auto_19535 ?auto_19536 ?auto_19537 ?auto_19538 ?auto_19539 ?auto_19540 ?auto_19542 )
      ( MAKE-1CRATE ?auto_19542 ?auto_19541 )
      ( MAKE-8CRATE-VERIFY ?auto_19534 ?auto_19535 ?auto_19536 ?auto_19537 ?auto_19538 ?auto_19539 ?auto_19540 ?auto_19542 ?auto_19541 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19566 - SURFACE
      ?auto_19567 - SURFACE
    )
    :vars
    (
      ?auto_19568 - HOIST
      ?auto_19569 - PLACE
      ?auto_19571 - PLACE
      ?auto_19572 - HOIST
      ?auto_19573 - SURFACE
      ?auto_19570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19568 ?auto_19569 ) ( SURFACE-AT ?auto_19566 ?auto_19569 ) ( CLEAR ?auto_19566 ) ( IS-CRATE ?auto_19567 ) ( AVAILABLE ?auto_19568 ) ( not ( = ?auto_19571 ?auto_19569 ) ) ( HOIST-AT ?auto_19572 ?auto_19571 ) ( AVAILABLE ?auto_19572 ) ( SURFACE-AT ?auto_19567 ?auto_19571 ) ( ON ?auto_19567 ?auto_19573 ) ( CLEAR ?auto_19567 ) ( TRUCK-AT ?auto_19570 ?auto_19569 ) ( not ( = ?auto_19566 ?auto_19567 ) ) ( not ( = ?auto_19566 ?auto_19573 ) ) ( not ( = ?auto_19567 ?auto_19573 ) ) ( not ( = ?auto_19568 ?auto_19572 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19570 ?auto_19569 ?auto_19571 )
      ( !LIFT ?auto_19572 ?auto_19567 ?auto_19573 ?auto_19571 )
      ( !LOAD ?auto_19572 ?auto_19567 ?auto_19570 ?auto_19571 )
      ( !DRIVE ?auto_19570 ?auto_19571 ?auto_19569 )
      ( !UNLOAD ?auto_19568 ?auto_19567 ?auto_19570 ?auto_19569 )
      ( !DROP ?auto_19568 ?auto_19567 ?auto_19566 ?auto_19569 )
      ( MAKE-1CRATE-VERIFY ?auto_19566 ?auto_19567 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_19584 - SURFACE
      ?auto_19585 - SURFACE
      ?auto_19586 - SURFACE
      ?auto_19587 - SURFACE
      ?auto_19588 - SURFACE
      ?auto_19589 - SURFACE
      ?auto_19590 - SURFACE
      ?auto_19593 - SURFACE
      ?auto_19592 - SURFACE
      ?auto_19591 - SURFACE
    )
    :vars
    (
      ?auto_19599 - HOIST
      ?auto_19598 - PLACE
      ?auto_19597 - PLACE
      ?auto_19594 - HOIST
      ?auto_19595 - SURFACE
      ?auto_19606 - PLACE
      ?auto_19607 - HOIST
      ?auto_19600 - SURFACE
      ?auto_19610 - PLACE
      ?auto_19603 - HOIST
      ?auto_19602 - SURFACE
      ?auto_19616 - PLACE
      ?auto_19613 - HOIST
      ?auto_19601 - SURFACE
      ?auto_19611 - PLACE
      ?auto_19609 - HOIST
      ?auto_19614 - SURFACE
      ?auto_19605 - SURFACE
      ?auto_19617 - PLACE
      ?auto_19608 - HOIST
      ?auto_19615 - SURFACE
      ?auto_19612 - SURFACE
      ?auto_19604 - SURFACE
      ?auto_19596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19599 ?auto_19598 ) ( IS-CRATE ?auto_19591 ) ( not ( = ?auto_19597 ?auto_19598 ) ) ( HOIST-AT ?auto_19594 ?auto_19597 ) ( AVAILABLE ?auto_19594 ) ( SURFACE-AT ?auto_19591 ?auto_19597 ) ( ON ?auto_19591 ?auto_19595 ) ( CLEAR ?auto_19591 ) ( not ( = ?auto_19592 ?auto_19591 ) ) ( not ( = ?auto_19592 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) ( not ( = ?auto_19599 ?auto_19594 ) ) ( IS-CRATE ?auto_19592 ) ( not ( = ?auto_19606 ?auto_19598 ) ) ( HOIST-AT ?auto_19607 ?auto_19606 ) ( AVAILABLE ?auto_19607 ) ( SURFACE-AT ?auto_19592 ?auto_19606 ) ( ON ?auto_19592 ?auto_19600 ) ( CLEAR ?auto_19592 ) ( not ( = ?auto_19593 ?auto_19592 ) ) ( not ( = ?auto_19593 ?auto_19600 ) ) ( not ( = ?auto_19592 ?auto_19600 ) ) ( not ( = ?auto_19599 ?auto_19607 ) ) ( IS-CRATE ?auto_19593 ) ( not ( = ?auto_19610 ?auto_19598 ) ) ( HOIST-AT ?auto_19603 ?auto_19610 ) ( SURFACE-AT ?auto_19593 ?auto_19610 ) ( ON ?auto_19593 ?auto_19602 ) ( CLEAR ?auto_19593 ) ( not ( = ?auto_19590 ?auto_19593 ) ) ( not ( = ?auto_19590 ?auto_19602 ) ) ( not ( = ?auto_19593 ?auto_19602 ) ) ( not ( = ?auto_19599 ?auto_19603 ) ) ( IS-CRATE ?auto_19590 ) ( not ( = ?auto_19616 ?auto_19598 ) ) ( HOIST-AT ?auto_19613 ?auto_19616 ) ( SURFACE-AT ?auto_19590 ?auto_19616 ) ( ON ?auto_19590 ?auto_19601 ) ( CLEAR ?auto_19590 ) ( not ( = ?auto_19589 ?auto_19590 ) ) ( not ( = ?auto_19589 ?auto_19601 ) ) ( not ( = ?auto_19590 ?auto_19601 ) ) ( not ( = ?auto_19599 ?auto_19613 ) ) ( IS-CRATE ?auto_19589 ) ( not ( = ?auto_19611 ?auto_19598 ) ) ( HOIST-AT ?auto_19609 ?auto_19611 ) ( SURFACE-AT ?auto_19589 ?auto_19611 ) ( ON ?auto_19589 ?auto_19614 ) ( CLEAR ?auto_19589 ) ( not ( = ?auto_19588 ?auto_19589 ) ) ( not ( = ?auto_19588 ?auto_19614 ) ) ( not ( = ?auto_19589 ?auto_19614 ) ) ( not ( = ?auto_19599 ?auto_19609 ) ) ( IS-CRATE ?auto_19588 ) ( AVAILABLE ?auto_19603 ) ( SURFACE-AT ?auto_19588 ?auto_19610 ) ( ON ?auto_19588 ?auto_19605 ) ( CLEAR ?auto_19588 ) ( not ( = ?auto_19587 ?auto_19588 ) ) ( not ( = ?auto_19587 ?auto_19605 ) ) ( not ( = ?auto_19588 ?auto_19605 ) ) ( IS-CRATE ?auto_19587 ) ( not ( = ?auto_19617 ?auto_19598 ) ) ( HOIST-AT ?auto_19608 ?auto_19617 ) ( AVAILABLE ?auto_19608 ) ( SURFACE-AT ?auto_19587 ?auto_19617 ) ( ON ?auto_19587 ?auto_19615 ) ( CLEAR ?auto_19587 ) ( not ( = ?auto_19586 ?auto_19587 ) ) ( not ( = ?auto_19586 ?auto_19615 ) ) ( not ( = ?auto_19587 ?auto_19615 ) ) ( not ( = ?auto_19599 ?auto_19608 ) ) ( IS-CRATE ?auto_19586 ) ( AVAILABLE ?auto_19613 ) ( SURFACE-AT ?auto_19586 ?auto_19616 ) ( ON ?auto_19586 ?auto_19612 ) ( CLEAR ?auto_19586 ) ( not ( = ?auto_19585 ?auto_19586 ) ) ( not ( = ?auto_19585 ?auto_19612 ) ) ( not ( = ?auto_19586 ?auto_19612 ) ) ( SURFACE-AT ?auto_19584 ?auto_19598 ) ( CLEAR ?auto_19584 ) ( IS-CRATE ?auto_19585 ) ( AVAILABLE ?auto_19599 ) ( AVAILABLE ?auto_19609 ) ( SURFACE-AT ?auto_19585 ?auto_19611 ) ( ON ?auto_19585 ?auto_19604 ) ( CLEAR ?auto_19585 ) ( TRUCK-AT ?auto_19596 ?auto_19598 ) ( not ( = ?auto_19584 ?auto_19585 ) ) ( not ( = ?auto_19584 ?auto_19604 ) ) ( not ( = ?auto_19585 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19586 ) ) ( not ( = ?auto_19584 ?auto_19612 ) ) ( not ( = ?auto_19586 ?auto_19604 ) ) ( not ( = ?auto_19616 ?auto_19611 ) ) ( not ( = ?auto_19613 ?auto_19609 ) ) ( not ( = ?auto_19612 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19587 ) ) ( not ( = ?auto_19584 ?auto_19615 ) ) ( not ( = ?auto_19585 ?auto_19587 ) ) ( not ( = ?auto_19585 ?auto_19615 ) ) ( not ( = ?auto_19587 ?auto_19612 ) ) ( not ( = ?auto_19587 ?auto_19604 ) ) ( not ( = ?auto_19617 ?auto_19616 ) ) ( not ( = ?auto_19617 ?auto_19611 ) ) ( not ( = ?auto_19608 ?auto_19613 ) ) ( not ( = ?auto_19608 ?auto_19609 ) ) ( not ( = ?auto_19615 ?auto_19612 ) ) ( not ( = ?auto_19615 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19588 ) ) ( not ( = ?auto_19584 ?auto_19605 ) ) ( not ( = ?auto_19585 ?auto_19588 ) ) ( not ( = ?auto_19585 ?auto_19605 ) ) ( not ( = ?auto_19586 ?auto_19588 ) ) ( not ( = ?auto_19586 ?auto_19605 ) ) ( not ( = ?auto_19588 ?auto_19615 ) ) ( not ( = ?auto_19588 ?auto_19612 ) ) ( not ( = ?auto_19588 ?auto_19604 ) ) ( not ( = ?auto_19610 ?auto_19617 ) ) ( not ( = ?auto_19610 ?auto_19616 ) ) ( not ( = ?auto_19610 ?auto_19611 ) ) ( not ( = ?auto_19603 ?auto_19608 ) ) ( not ( = ?auto_19603 ?auto_19613 ) ) ( not ( = ?auto_19603 ?auto_19609 ) ) ( not ( = ?auto_19605 ?auto_19615 ) ) ( not ( = ?auto_19605 ?auto_19612 ) ) ( not ( = ?auto_19605 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19589 ) ) ( not ( = ?auto_19584 ?auto_19614 ) ) ( not ( = ?auto_19585 ?auto_19589 ) ) ( not ( = ?auto_19585 ?auto_19614 ) ) ( not ( = ?auto_19586 ?auto_19589 ) ) ( not ( = ?auto_19586 ?auto_19614 ) ) ( not ( = ?auto_19587 ?auto_19589 ) ) ( not ( = ?auto_19587 ?auto_19614 ) ) ( not ( = ?auto_19589 ?auto_19605 ) ) ( not ( = ?auto_19589 ?auto_19615 ) ) ( not ( = ?auto_19589 ?auto_19612 ) ) ( not ( = ?auto_19589 ?auto_19604 ) ) ( not ( = ?auto_19614 ?auto_19605 ) ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( not ( = ?auto_19614 ?auto_19612 ) ) ( not ( = ?auto_19614 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19590 ) ) ( not ( = ?auto_19584 ?auto_19601 ) ) ( not ( = ?auto_19585 ?auto_19590 ) ) ( not ( = ?auto_19585 ?auto_19601 ) ) ( not ( = ?auto_19586 ?auto_19590 ) ) ( not ( = ?auto_19586 ?auto_19601 ) ) ( not ( = ?auto_19587 ?auto_19590 ) ) ( not ( = ?auto_19587 ?auto_19601 ) ) ( not ( = ?auto_19588 ?auto_19590 ) ) ( not ( = ?auto_19588 ?auto_19601 ) ) ( not ( = ?auto_19590 ?auto_19614 ) ) ( not ( = ?auto_19590 ?auto_19605 ) ) ( not ( = ?auto_19590 ?auto_19615 ) ) ( not ( = ?auto_19590 ?auto_19612 ) ) ( not ( = ?auto_19590 ?auto_19604 ) ) ( not ( = ?auto_19601 ?auto_19614 ) ) ( not ( = ?auto_19601 ?auto_19605 ) ) ( not ( = ?auto_19601 ?auto_19615 ) ) ( not ( = ?auto_19601 ?auto_19612 ) ) ( not ( = ?auto_19601 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19593 ) ) ( not ( = ?auto_19584 ?auto_19602 ) ) ( not ( = ?auto_19585 ?auto_19593 ) ) ( not ( = ?auto_19585 ?auto_19602 ) ) ( not ( = ?auto_19586 ?auto_19593 ) ) ( not ( = ?auto_19586 ?auto_19602 ) ) ( not ( = ?auto_19587 ?auto_19593 ) ) ( not ( = ?auto_19587 ?auto_19602 ) ) ( not ( = ?auto_19588 ?auto_19593 ) ) ( not ( = ?auto_19588 ?auto_19602 ) ) ( not ( = ?auto_19589 ?auto_19593 ) ) ( not ( = ?auto_19589 ?auto_19602 ) ) ( not ( = ?auto_19593 ?auto_19601 ) ) ( not ( = ?auto_19593 ?auto_19614 ) ) ( not ( = ?auto_19593 ?auto_19605 ) ) ( not ( = ?auto_19593 ?auto_19615 ) ) ( not ( = ?auto_19593 ?auto_19612 ) ) ( not ( = ?auto_19593 ?auto_19604 ) ) ( not ( = ?auto_19602 ?auto_19601 ) ) ( not ( = ?auto_19602 ?auto_19614 ) ) ( not ( = ?auto_19602 ?auto_19605 ) ) ( not ( = ?auto_19602 ?auto_19615 ) ) ( not ( = ?auto_19602 ?auto_19612 ) ) ( not ( = ?auto_19602 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19592 ) ) ( not ( = ?auto_19584 ?auto_19600 ) ) ( not ( = ?auto_19585 ?auto_19592 ) ) ( not ( = ?auto_19585 ?auto_19600 ) ) ( not ( = ?auto_19586 ?auto_19592 ) ) ( not ( = ?auto_19586 ?auto_19600 ) ) ( not ( = ?auto_19587 ?auto_19592 ) ) ( not ( = ?auto_19587 ?auto_19600 ) ) ( not ( = ?auto_19588 ?auto_19592 ) ) ( not ( = ?auto_19588 ?auto_19600 ) ) ( not ( = ?auto_19589 ?auto_19592 ) ) ( not ( = ?auto_19589 ?auto_19600 ) ) ( not ( = ?auto_19590 ?auto_19592 ) ) ( not ( = ?auto_19590 ?auto_19600 ) ) ( not ( = ?auto_19592 ?auto_19602 ) ) ( not ( = ?auto_19592 ?auto_19601 ) ) ( not ( = ?auto_19592 ?auto_19614 ) ) ( not ( = ?auto_19592 ?auto_19605 ) ) ( not ( = ?auto_19592 ?auto_19615 ) ) ( not ( = ?auto_19592 ?auto_19612 ) ) ( not ( = ?auto_19592 ?auto_19604 ) ) ( not ( = ?auto_19606 ?auto_19610 ) ) ( not ( = ?auto_19606 ?auto_19616 ) ) ( not ( = ?auto_19606 ?auto_19611 ) ) ( not ( = ?auto_19606 ?auto_19617 ) ) ( not ( = ?auto_19607 ?auto_19603 ) ) ( not ( = ?auto_19607 ?auto_19613 ) ) ( not ( = ?auto_19607 ?auto_19609 ) ) ( not ( = ?auto_19607 ?auto_19608 ) ) ( not ( = ?auto_19600 ?auto_19602 ) ) ( not ( = ?auto_19600 ?auto_19601 ) ) ( not ( = ?auto_19600 ?auto_19614 ) ) ( not ( = ?auto_19600 ?auto_19605 ) ) ( not ( = ?auto_19600 ?auto_19615 ) ) ( not ( = ?auto_19600 ?auto_19612 ) ) ( not ( = ?auto_19600 ?auto_19604 ) ) ( not ( = ?auto_19584 ?auto_19591 ) ) ( not ( = ?auto_19584 ?auto_19595 ) ) ( not ( = ?auto_19585 ?auto_19591 ) ) ( not ( = ?auto_19585 ?auto_19595 ) ) ( not ( = ?auto_19586 ?auto_19591 ) ) ( not ( = ?auto_19586 ?auto_19595 ) ) ( not ( = ?auto_19587 ?auto_19591 ) ) ( not ( = ?auto_19587 ?auto_19595 ) ) ( not ( = ?auto_19588 ?auto_19591 ) ) ( not ( = ?auto_19588 ?auto_19595 ) ) ( not ( = ?auto_19589 ?auto_19591 ) ) ( not ( = ?auto_19589 ?auto_19595 ) ) ( not ( = ?auto_19590 ?auto_19591 ) ) ( not ( = ?auto_19590 ?auto_19595 ) ) ( not ( = ?auto_19593 ?auto_19591 ) ) ( not ( = ?auto_19593 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19600 ) ) ( not ( = ?auto_19591 ?auto_19602 ) ) ( not ( = ?auto_19591 ?auto_19601 ) ) ( not ( = ?auto_19591 ?auto_19614 ) ) ( not ( = ?auto_19591 ?auto_19605 ) ) ( not ( = ?auto_19591 ?auto_19615 ) ) ( not ( = ?auto_19591 ?auto_19612 ) ) ( not ( = ?auto_19591 ?auto_19604 ) ) ( not ( = ?auto_19597 ?auto_19606 ) ) ( not ( = ?auto_19597 ?auto_19610 ) ) ( not ( = ?auto_19597 ?auto_19616 ) ) ( not ( = ?auto_19597 ?auto_19611 ) ) ( not ( = ?auto_19597 ?auto_19617 ) ) ( not ( = ?auto_19594 ?auto_19607 ) ) ( not ( = ?auto_19594 ?auto_19603 ) ) ( not ( = ?auto_19594 ?auto_19613 ) ) ( not ( = ?auto_19594 ?auto_19609 ) ) ( not ( = ?auto_19594 ?auto_19608 ) ) ( not ( = ?auto_19595 ?auto_19600 ) ) ( not ( = ?auto_19595 ?auto_19602 ) ) ( not ( = ?auto_19595 ?auto_19601 ) ) ( not ( = ?auto_19595 ?auto_19614 ) ) ( not ( = ?auto_19595 ?auto_19605 ) ) ( not ( = ?auto_19595 ?auto_19615 ) ) ( not ( = ?auto_19595 ?auto_19612 ) ) ( not ( = ?auto_19595 ?auto_19604 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_19584 ?auto_19585 ?auto_19586 ?auto_19587 ?auto_19588 ?auto_19589 ?auto_19590 ?auto_19593 ?auto_19592 )
      ( MAKE-1CRATE ?auto_19592 ?auto_19591 )
      ( MAKE-9CRATE-VERIFY ?auto_19584 ?auto_19585 ?auto_19586 ?auto_19587 ?auto_19588 ?auto_19589 ?auto_19590 ?auto_19593 ?auto_19592 ?auto_19591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19620 - SURFACE
      ?auto_19621 - SURFACE
    )
    :vars
    (
      ?auto_19622 - HOIST
      ?auto_19623 - PLACE
      ?auto_19625 - PLACE
      ?auto_19626 - HOIST
      ?auto_19627 - SURFACE
      ?auto_19624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19622 ?auto_19623 ) ( SURFACE-AT ?auto_19620 ?auto_19623 ) ( CLEAR ?auto_19620 ) ( IS-CRATE ?auto_19621 ) ( AVAILABLE ?auto_19622 ) ( not ( = ?auto_19625 ?auto_19623 ) ) ( HOIST-AT ?auto_19626 ?auto_19625 ) ( AVAILABLE ?auto_19626 ) ( SURFACE-AT ?auto_19621 ?auto_19625 ) ( ON ?auto_19621 ?auto_19627 ) ( CLEAR ?auto_19621 ) ( TRUCK-AT ?auto_19624 ?auto_19623 ) ( not ( = ?auto_19620 ?auto_19621 ) ) ( not ( = ?auto_19620 ?auto_19627 ) ) ( not ( = ?auto_19621 ?auto_19627 ) ) ( not ( = ?auto_19622 ?auto_19626 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19624 ?auto_19623 ?auto_19625 )
      ( !LIFT ?auto_19626 ?auto_19621 ?auto_19627 ?auto_19625 )
      ( !LOAD ?auto_19626 ?auto_19621 ?auto_19624 ?auto_19625 )
      ( !DRIVE ?auto_19624 ?auto_19625 ?auto_19623 )
      ( !UNLOAD ?auto_19622 ?auto_19621 ?auto_19624 ?auto_19623 )
      ( !DROP ?auto_19622 ?auto_19621 ?auto_19620 ?auto_19623 )
      ( MAKE-1CRATE-VERIFY ?auto_19620 ?auto_19621 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_19639 - SURFACE
      ?auto_19640 - SURFACE
      ?auto_19641 - SURFACE
      ?auto_19642 - SURFACE
      ?auto_19643 - SURFACE
      ?auto_19644 - SURFACE
      ?auto_19645 - SURFACE
      ?auto_19648 - SURFACE
      ?auto_19647 - SURFACE
      ?auto_19646 - SURFACE
      ?auto_19649 - SURFACE
    )
    :vars
    (
      ?auto_19650 - HOIST
      ?auto_19651 - PLACE
      ?auto_19654 - PLACE
      ?auto_19653 - HOIST
      ?auto_19655 - SURFACE
      ?auto_19670 - PLACE
      ?auto_19663 - HOIST
      ?auto_19674 - SURFACE
      ?auto_19668 - PLACE
      ?auto_19659 - HOIST
      ?auto_19657 - SURFACE
      ?auto_19662 - PLACE
      ?auto_19671 - HOIST
      ?auto_19661 - SURFACE
      ?auto_19660 - PLACE
      ?auto_19666 - HOIST
      ?auto_19658 - SURFACE
      ?auto_19673 - PLACE
      ?auto_19664 - HOIST
      ?auto_19656 - SURFACE
      ?auto_19669 - SURFACE
      ?auto_19667 - SURFACE
      ?auto_19665 - SURFACE
      ?auto_19672 - SURFACE
      ?auto_19652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19650 ?auto_19651 ) ( IS-CRATE ?auto_19649 ) ( not ( = ?auto_19654 ?auto_19651 ) ) ( HOIST-AT ?auto_19653 ?auto_19654 ) ( SURFACE-AT ?auto_19649 ?auto_19654 ) ( ON ?auto_19649 ?auto_19655 ) ( CLEAR ?auto_19649 ) ( not ( = ?auto_19646 ?auto_19649 ) ) ( not ( = ?auto_19646 ?auto_19655 ) ) ( not ( = ?auto_19649 ?auto_19655 ) ) ( not ( = ?auto_19650 ?auto_19653 ) ) ( IS-CRATE ?auto_19646 ) ( not ( = ?auto_19670 ?auto_19651 ) ) ( HOIST-AT ?auto_19663 ?auto_19670 ) ( AVAILABLE ?auto_19663 ) ( SURFACE-AT ?auto_19646 ?auto_19670 ) ( ON ?auto_19646 ?auto_19674 ) ( CLEAR ?auto_19646 ) ( not ( = ?auto_19647 ?auto_19646 ) ) ( not ( = ?auto_19647 ?auto_19674 ) ) ( not ( = ?auto_19646 ?auto_19674 ) ) ( not ( = ?auto_19650 ?auto_19663 ) ) ( IS-CRATE ?auto_19647 ) ( not ( = ?auto_19668 ?auto_19651 ) ) ( HOIST-AT ?auto_19659 ?auto_19668 ) ( AVAILABLE ?auto_19659 ) ( SURFACE-AT ?auto_19647 ?auto_19668 ) ( ON ?auto_19647 ?auto_19657 ) ( CLEAR ?auto_19647 ) ( not ( = ?auto_19648 ?auto_19647 ) ) ( not ( = ?auto_19648 ?auto_19657 ) ) ( not ( = ?auto_19647 ?auto_19657 ) ) ( not ( = ?auto_19650 ?auto_19659 ) ) ( IS-CRATE ?auto_19648 ) ( not ( = ?auto_19662 ?auto_19651 ) ) ( HOIST-AT ?auto_19671 ?auto_19662 ) ( SURFACE-AT ?auto_19648 ?auto_19662 ) ( ON ?auto_19648 ?auto_19661 ) ( CLEAR ?auto_19648 ) ( not ( = ?auto_19645 ?auto_19648 ) ) ( not ( = ?auto_19645 ?auto_19661 ) ) ( not ( = ?auto_19648 ?auto_19661 ) ) ( not ( = ?auto_19650 ?auto_19671 ) ) ( IS-CRATE ?auto_19645 ) ( not ( = ?auto_19660 ?auto_19651 ) ) ( HOIST-AT ?auto_19666 ?auto_19660 ) ( SURFACE-AT ?auto_19645 ?auto_19660 ) ( ON ?auto_19645 ?auto_19658 ) ( CLEAR ?auto_19645 ) ( not ( = ?auto_19644 ?auto_19645 ) ) ( not ( = ?auto_19644 ?auto_19658 ) ) ( not ( = ?auto_19645 ?auto_19658 ) ) ( not ( = ?auto_19650 ?auto_19666 ) ) ( IS-CRATE ?auto_19644 ) ( not ( = ?auto_19673 ?auto_19651 ) ) ( HOIST-AT ?auto_19664 ?auto_19673 ) ( SURFACE-AT ?auto_19644 ?auto_19673 ) ( ON ?auto_19644 ?auto_19656 ) ( CLEAR ?auto_19644 ) ( not ( = ?auto_19643 ?auto_19644 ) ) ( not ( = ?auto_19643 ?auto_19656 ) ) ( not ( = ?auto_19644 ?auto_19656 ) ) ( not ( = ?auto_19650 ?auto_19664 ) ) ( IS-CRATE ?auto_19643 ) ( AVAILABLE ?auto_19671 ) ( SURFACE-AT ?auto_19643 ?auto_19662 ) ( ON ?auto_19643 ?auto_19669 ) ( CLEAR ?auto_19643 ) ( not ( = ?auto_19642 ?auto_19643 ) ) ( not ( = ?auto_19642 ?auto_19669 ) ) ( not ( = ?auto_19643 ?auto_19669 ) ) ( IS-CRATE ?auto_19642 ) ( AVAILABLE ?auto_19653 ) ( SURFACE-AT ?auto_19642 ?auto_19654 ) ( ON ?auto_19642 ?auto_19667 ) ( CLEAR ?auto_19642 ) ( not ( = ?auto_19641 ?auto_19642 ) ) ( not ( = ?auto_19641 ?auto_19667 ) ) ( not ( = ?auto_19642 ?auto_19667 ) ) ( IS-CRATE ?auto_19641 ) ( AVAILABLE ?auto_19666 ) ( SURFACE-AT ?auto_19641 ?auto_19660 ) ( ON ?auto_19641 ?auto_19665 ) ( CLEAR ?auto_19641 ) ( not ( = ?auto_19640 ?auto_19641 ) ) ( not ( = ?auto_19640 ?auto_19665 ) ) ( not ( = ?auto_19641 ?auto_19665 ) ) ( SURFACE-AT ?auto_19639 ?auto_19651 ) ( CLEAR ?auto_19639 ) ( IS-CRATE ?auto_19640 ) ( AVAILABLE ?auto_19650 ) ( AVAILABLE ?auto_19664 ) ( SURFACE-AT ?auto_19640 ?auto_19673 ) ( ON ?auto_19640 ?auto_19672 ) ( CLEAR ?auto_19640 ) ( TRUCK-AT ?auto_19652 ?auto_19651 ) ( not ( = ?auto_19639 ?auto_19640 ) ) ( not ( = ?auto_19639 ?auto_19672 ) ) ( not ( = ?auto_19640 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19641 ) ) ( not ( = ?auto_19639 ?auto_19665 ) ) ( not ( = ?auto_19641 ?auto_19672 ) ) ( not ( = ?auto_19660 ?auto_19673 ) ) ( not ( = ?auto_19666 ?auto_19664 ) ) ( not ( = ?auto_19665 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19642 ) ) ( not ( = ?auto_19639 ?auto_19667 ) ) ( not ( = ?auto_19640 ?auto_19642 ) ) ( not ( = ?auto_19640 ?auto_19667 ) ) ( not ( = ?auto_19642 ?auto_19665 ) ) ( not ( = ?auto_19642 ?auto_19672 ) ) ( not ( = ?auto_19654 ?auto_19660 ) ) ( not ( = ?auto_19654 ?auto_19673 ) ) ( not ( = ?auto_19653 ?auto_19666 ) ) ( not ( = ?auto_19653 ?auto_19664 ) ) ( not ( = ?auto_19667 ?auto_19665 ) ) ( not ( = ?auto_19667 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19643 ) ) ( not ( = ?auto_19639 ?auto_19669 ) ) ( not ( = ?auto_19640 ?auto_19643 ) ) ( not ( = ?auto_19640 ?auto_19669 ) ) ( not ( = ?auto_19641 ?auto_19643 ) ) ( not ( = ?auto_19641 ?auto_19669 ) ) ( not ( = ?auto_19643 ?auto_19667 ) ) ( not ( = ?auto_19643 ?auto_19665 ) ) ( not ( = ?auto_19643 ?auto_19672 ) ) ( not ( = ?auto_19662 ?auto_19654 ) ) ( not ( = ?auto_19662 ?auto_19660 ) ) ( not ( = ?auto_19662 ?auto_19673 ) ) ( not ( = ?auto_19671 ?auto_19653 ) ) ( not ( = ?auto_19671 ?auto_19666 ) ) ( not ( = ?auto_19671 ?auto_19664 ) ) ( not ( = ?auto_19669 ?auto_19667 ) ) ( not ( = ?auto_19669 ?auto_19665 ) ) ( not ( = ?auto_19669 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19644 ) ) ( not ( = ?auto_19639 ?auto_19656 ) ) ( not ( = ?auto_19640 ?auto_19644 ) ) ( not ( = ?auto_19640 ?auto_19656 ) ) ( not ( = ?auto_19641 ?auto_19644 ) ) ( not ( = ?auto_19641 ?auto_19656 ) ) ( not ( = ?auto_19642 ?auto_19644 ) ) ( not ( = ?auto_19642 ?auto_19656 ) ) ( not ( = ?auto_19644 ?auto_19669 ) ) ( not ( = ?auto_19644 ?auto_19667 ) ) ( not ( = ?auto_19644 ?auto_19665 ) ) ( not ( = ?auto_19644 ?auto_19672 ) ) ( not ( = ?auto_19656 ?auto_19669 ) ) ( not ( = ?auto_19656 ?auto_19667 ) ) ( not ( = ?auto_19656 ?auto_19665 ) ) ( not ( = ?auto_19656 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19645 ) ) ( not ( = ?auto_19639 ?auto_19658 ) ) ( not ( = ?auto_19640 ?auto_19645 ) ) ( not ( = ?auto_19640 ?auto_19658 ) ) ( not ( = ?auto_19641 ?auto_19645 ) ) ( not ( = ?auto_19641 ?auto_19658 ) ) ( not ( = ?auto_19642 ?auto_19645 ) ) ( not ( = ?auto_19642 ?auto_19658 ) ) ( not ( = ?auto_19643 ?auto_19645 ) ) ( not ( = ?auto_19643 ?auto_19658 ) ) ( not ( = ?auto_19645 ?auto_19656 ) ) ( not ( = ?auto_19645 ?auto_19669 ) ) ( not ( = ?auto_19645 ?auto_19667 ) ) ( not ( = ?auto_19645 ?auto_19665 ) ) ( not ( = ?auto_19645 ?auto_19672 ) ) ( not ( = ?auto_19658 ?auto_19656 ) ) ( not ( = ?auto_19658 ?auto_19669 ) ) ( not ( = ?auto_19658 ?auto_19667 ) ) ( not ( = ?auto_19658 ?auto_19665 ) ) ( not ( = ?auto_19658 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19648 ) ) ( not ( = ?auto_19639 ?auto_19661 ) ) ( not ( = ?auto_19640 ?auto_19648 ) ) ( not ( = ?auto_19640 ?auto_19661 ) ) ( not ( = ?auto_19641 ?auto_19648 ) ) ( not ( = ?auto_19641 ?auto_19661 ) ) ( not ( = ?auto_19642 ?auto_19648 ) ) ( not ( = ?auto_19642 ?auto_19661 ) ) ( not ( = ?auto_19643 ?auto_19648 ) ) ( not ( = ?auto_19643 ?auto_19661 ) ) ( not ( = ?auto_19644 ?auto_19648 ) ) ( not ( = ?auto_19644 ?auto_19661 ) ) ( not ( = ?auto_19648 ?auto_19658 ) ) ( not ( = ?auto_19648 ?auto_19656 ) ) ( not ( = ?auto_19648 ?auto_19669 ) ) ( not ( = ?auto_19648 ?auto_19667 ) ) ( not ( = ?auto_19648 ?auto_19665 ) ) ( not ( = ?auto_19648 ?auto_19672 ) ) ( not ( = ?auto_19661 ?auto_19658 ) ) ( not ( = ?auto_19661 ?auto_19656 ) ) ( not ( = ?auto_19661 ?auto_19669 ) ) ( not ( = ?auto_19661 ?auto_19667 ) ) ( not ( = ?auto_19661 ?auto_19665 ) ) ( not ( = ?auto_19661 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19647 ) ) ( not ( = ?auto_19639 ?auto_19657 ) ) ( not ( = ?auto_19640 ?auto_19647 ) ) ( not ( = ?auto_19640 ?auto_19657 ) ) ( not ( = ?auto_19641 ?auto_19647 ) ) ( not ( = ?auto_19641 ?auto_19657 ) ) ( not ( = ?auto_19642 ?auto_19647 ) ) ( not ( = ?auto_19642 ?auto_19657 ) ) ( not ( = ?auto_19643 ?auto_19647 ) ) ( not ( = ?auto_19643 ?auto_19657 ) ) ( not ( = ?auto_19644 ?auto_19647 ) ) ( not ( = ?auto_19644 ?auto_19657 ) ) ( not ( = ?auto_19645 ?auto_19647 ) ) ( not ( = ?auto_19645 ?auto_19657 ) ) ( not ( = ?auto_19647 ?auto_19661 ) ) ( not ( = ?auto_19647 ?auto_19658 ) ) ( not ( = ?auto_19647 ?auto_19656 ) ) ( not ( = ?auto_19647 ?auto_19669 ) ) ( not ( = ?auto_19647 ?auto_19667 ) ) ( not ( = ?auto_19647 ?auto_19665 ) ) ( not ( = ?auto_19647 ?auto_19672 ) ) ( not ( = ?auto_19668 ?auto_19662 ) ) ( not ( = ?auto_19668 ?auto_19660 ) ) ( not ( = ?auto_19668 ?auto_19673 ) ) ( not ( = ?auto_19668 ?auto_19654 ) ) ( not ( = ?auto_19659 ?auto_19671 ) ) ( not ( = ?auto_19659 ?auto_19666 ) ) ( not ( = ?auto_19659 ?auto_19664 ) ) ( not ( = ?auto_19659 ?auto_19653 ) ) ( not ( = ?auto_19657 ?auto_19661 ) ) ( not ( = ?auto_19657 ?auto_19658 ) ) ( not ( = ?auto_19657 ?auto_19656 ) ) ( not ( = ?auto_19657 ?auto_19669 ) ) ( not ( = ?auto_19657 ?auto_19667 ) ) ( not ( = ?auto_19657 ?auto_19665 ) ) ( not ( = ?auto_19657 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19646 ) ) ( not ( = ?auto_19639 ?auto_19674 ) ) ( not ( = ?auto_19640 ?auto_19646 ) ) ( not ( = ?auto_19640 ?auto_19674 ) ) ( not ( = ?auto_19641 ?auto_19646 ) ) ( not ( = ?auto_19641 ?auto_19674 ) ) ( not ( = ?auto_19642 ?auto_19646 ) ) ( not ( = ?auto_19642 ?auto_19674 ) ) ( not ( = ?auto_19643 ?auto_19646 ) ) ( not ( = ?auto_19643 ?auto_19674 ) ) ( not ( = ?auto_19644 ?auto_19646 ) ) ( not ( = ?auto_19644 ?auto_19674 ) ) ( not ( = ?auto_19645 ?auto_19646 ) ) ( not ( = ?auto_19645 ?auto_19674 ) ) ( not ( = ?auto_19648 ?auto_19646 ) ) ( not ( = ?auto_19648 ?auto_19674 ) ) ( not ( = ?auto_19646 ?auto_19657 ) ) ( not ( = ?auto_19646 ?auto_19661 ) ) ( not ( = ?auto_19646 ?auto_19658 ) ) ( not ( = ?auto_19646 ?auto_19656 ) ) ( not ( = ?auto_19646 ?auto_19669 ) ) ( not ( = ?auto_19646 ?auto_19667 ) ) ( not ( = ?auto_19646 ?auto_19665 ) ) ( not ( = ?auto_19646 ?auto_19672 ) ) ( not ( = ?auto_19670 ?auto_19668 ) ) ( not ( = ?auto_19670 ?auto_19662 ) ) ( not ( = ?auto_19670 ?auto_19660 ) ) ( not ( = ?auto_19670 ?auto_19673 ) ) ( not ( = ?auto_19670 ?auto_19654 ) ) ( not ( = ?auto_19663 ?auto_19659 ) ) ( not ( = ?auto_19663 ?auto_19671 ) ) ( not ( = ?auto_19663 ?auto_19666 ) ) ( not ( = ?auto_19663 ?auto_19664 ) ) ( not ( = ?auto_19663 ?auto_19653 ) ) ( not ( = ?auto_19674 ?auto_19657 ) ) ( not ( = ?auto_19674 ?auto_19661 ) ) ( not ( = ?auto_19674 ?auto_19658 ) ) ( not ( = ?auto_19674 ?auto_19656 ) ) ( not ( = ?auto_19674 ?auto_19669 ) ) ( not ( = ?auto_19674 ?auto_19667 ) ) ( not ( = ?auto_19674 ?auto_19665 ) ) ( not ( = ?auto_19674 ?auto_19672 ) ) ( not ( = ?auto_19639 ?auto_19649 ) ) ( not ( = ?auto_19639 ?auto_19655 ) ) ( not ( = ?auto_19640 ?auto_19649 ) ) ( not ( = ?auto_19640 ?auto_19655 ) ) ( not ( = ?auto_19641 ?auto_19649 ) ) ( not ( = ?auto_19641 ?auto_19655 ) ) ( not ( = ?auto_19642 ?auto_19649 ) ) ( not ( = ?auto_19642 ?auto_19655 ) ) ( not ( = ?auto_19643 ?auto_19649 ) ) ( not ( = ?auto_19643 ?auto_19655 ) ) ( not ( = ?auto_19644 ?auto_19649 ) ) ( not ( = ?auto_19644 ?auto_19655 ) ) ( not ( = ?auto_19645 ?auto_19649 ) ) ( not ( = ?auto_19645 ?auto_19655 ) ) ( not ( = ?auto_19648 ?auto_19649 ) ) ( not ( = ?auto_19648 ?auto_19655 ) ) ( not ( = ?auto_19647 ?auto_19649 ) ) ( not ( = ?auto_19647 ?auto_19655 ) ) ( not ( = ?auto_19649 ?auto_19674 ) ) ( not ( = ?auto_19649 ?auto_19657 ) ) ( not ( = ?auto_19649 ?auto_19661 ) ) ( not ( = ?auto_19649 ?auto_19658 ) ) ( not ( = ?auto_19649 ?auto_19656 ) ) ( not ( = ?auto_19649 ?auto_19669 ) ) ( not ( = ?auto_19649 ?auto_19667 ) ) ( not ( = ?auto_19649 ?auto_19665 ) ) ( not ( = ?auto_19649 ?auto_19672 ) ) ( not ( = ?auto_19655 ?auto_19674 ) ) ( not ( = ?auto_19655 ?auto_19657 ) ) ( not ( = ?auto_19655 ?auto_19661 ) ) ( not ( = ?auto_19655 ?auto_19658 ) ) ( not ( = ?auto_19655 ?auto_19656 ) ) ( not ( = ?auto_19655 ?auto_19669 ) ) ( not ( = ?auto_19655 ?auto_19667 ) ) ( not ( = ?auto_19655 ?auto_19665 ) ) ( not ( = ?auto_19655 ?auto_19672 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_19639 ?auto_19640 ?auto_19641 ?auto_19642 ?auto_19643 ?auto_19644 ?auto_19645 ?auto_19648 ?auto_19647 ?auto_19646 )
      ( MAKE-1CRATE ?auto_19646 ?auto_19649 )
      ( MAKE-10CRATE-VERIFY ?auto_19639 ?auto_19640 ?auto_19641 ?auto_19642 ?auto_19643 ?auto_19644 ?auto_19645 ?auto_19648 ?auto_19647 ?auto_19646 ?auto_19649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19677 - SURFACE
      ?auto_19678 - SURFACE
    )
    :vars
    (
      ?auto_19679 - HOIST
      ?auto_19680 - PLACE
      ?auto_19682 - PLACE
      ?auto_19683 - HOIST
      ?auto_19684 - SURFACE
      ?auto_19681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19679 ?auto_19680 ) ( SURFACE-AT ?auto_19677 ?auto_19680 ) ( CLEAR ?auto_19677 ) ( IS-CRATE ?auto_19678 ) ( AVAILABLE ?auto_19679 ) ( not ( = ?auto_19682 ?auto_19680 ) ) ( HOIST-AT ?auto_19683 ?auto_19682 ) ( AVAILABLE ?auto_19683 ) ( SURFACE-AT ?auto_19678 ?auto_19682 ) ( ON ?auto_19678 ?auto_19684 ) ( CLEAR ?auto_19678 ) ( TRUCK-AT ?auto_19681 ?auto_19680 ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( not ( = ?auto_19677 ?auto_19684 ) ) ( not ( = ?auto_19678 ?auto_19684 ) ) ( not ( = ?auto_19679 ?auto_19683 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19681 ?auto_19680 ?auto_19682 )
      ( !LIFT ?auto_19683 ?auto_19678 ?auto_19684 ?auto_19682 )
      ( !LOAD ?auto_19683 ?auto_19678 ?auto_19681 ?auto_19682 )
      ( !DRIVE ?auto_19681 ?auto_19682 ?auto_19680 )
      ( !UNLOAD ?auto_19679 ?auto_19678 ?auto_19681 ?auto_19680 )
      ( !DROP ?auto_19679 ?auto_19678 ?auto_19677 ?auto_19680 )
      ( MAKE-1CRATE-VERIFY ?auto_19677 ?auto_19678 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_19697 - SURFACE
      ?auto_19698 - SURFACE
      ?auto_19699 - SURFACE
      ?auto_19700 - SURFACE
      ?auto_19701 - SURFACE
      ?auto_19702 - SURFACE
      ?auto_19703 - SURFACE
      ?auto_19706 - SURFACE
      ?auto_19705 - SURFACE
      ?auto_19704 - SURFACE
      ?auto_19707 - SURFACE
      ?auto_19708 - SURFACE
    )
    :vars
    (
      ?auto_19713 - HOIST
      ?auto_19710 - PLACE
      ?auto_19711 - PLACE
      ?auto_19714 - HOIST
      ?auto_19709 - SURFACE
      ?auto_19726 - PLACE
      ?auto_19728 - HOIST
      ?auto_19727 - SURFACE
      ?auto_19734 - PLACE
      ?auto_19724 - HOIST
      ?auto_19718 - SURFACE
      ?auto_19729 - SURFACE
      ?auto_19730 - PLACE
      ?auto_19732 - HOIST
      ?auto_19716 - SURFACE
      ?auto_19723 - PLACE
      ?auto_19725 - HOIST
      ?auto_19720 - SURFACE
      ?auto_19722 - PLACE
      ?auto_19717 - HOIST
      ?auto_19715 - SURFACE
      ?auto_19731 - SURFACE
      ?auto_19721 - SURFACE
      ?auto_19733 - SURFACE
      ?auto_19719 - SURFACE
      ?auto_19712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19713 ?auto_19710 ) ( IS-CRATE ?auto_19708 ) ( not ( = ?auto_19711 ?auto_19710 ) ) ( HOIST-AT ?auto_19714 ?auto_19711 ) ( SURFACE-AT ?auto_19708 ?auto_19711 ) ( ON ?auto_19708 ?auto_19709 ) ( CLEAR ?auto_19708 ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( not ( = ?auto_19707 ?auto_19709 ) ) ( not ( = ?auto_19708 ?auto_19709 ) ) ( not ( = ?auto_19713 ?auto_19714 ) ) ( IS-CRATE ?auto_19707 ) ( not ( = ?auto_19726 ?auto_19710 ) ) ( HOIST-AT ?auto_19728 ?auto_19726 ) ( SURFACE-AT ?auto_19707 ?auto_19726 ) ( ON ?auto_19707 ?auto_19727 ) ( CLEAR ?auto_19707 ) ( not ( = ?auto_19704 ?auto_19707 ) ) ( not ( = ?auto_19704 ?auto_19727 ) ) ( not ( = ?auto_19707 ?auto_19727 ) ) ( not ( = ?auto_19713 ?auto_19728 ) ) ( IS-CRATE ?auto_19704 ) ( not ( = ?auto_19734 ?auto_19710 ) ) ( HOIST-AT ?auto_19724 ?auto_19734 ) ( AVAILABLE ?auto_19724 ) ( SURFACE-AT ?auto_19704 ?auto_19734 ) ( ON ?auto_19704 ?auto_19718 ) ( CLEAR ?auto_19704 ) ( not ( = ?auto_19705 ?auto_19704 ) ) ( not ( = ?auto_19705 ?auto_19718 ) ) ( not ( = ?auto_19704 ?auto_19718 ) ) ( not ( = ?auto_19713 ?auto_19724 ) ) ( IS-CRATE ?auto_19705 ) ( AVAILABLE ?auto_19714 ) ( SURFACE-AT ?auto_19705 ?auto_19711 ) ( ON ?auto_19705 ?auto_19729 ) ( CLEAR ?auto_19705 ) ( not ( = ?auto_19706 ?auto_19705 ) ) ( not ( = ?auto_19706 ?auto_19729 ) ) ( not ( = ?auto_19705 ?auto_19729 ) ) ( IS-CRATE ?auto_19706 ) ( not ( = ?auto_19730 ?auto_19710 ) ) ( HOIST-AT ?auto_19732 ?auto_19730 ) ( SURFACE-AT ?auto_19706 ?auto_19730 ) ( ON ?auto_19706 ?auto_19716 ) ( CLEAR ?auto_19706 ) ( not ( = ?auto_19703 ?auto_19706 ) ) ( not ( = ?auto_19703 ?auto_19716 ) ) ( not ( = ?auto_19706 ?auto_19716 ) ) ( not ( = ?auto_19713 ?auto_19732 ) ) ( IS-CRATE ?auto_19703 ) ( not ( = ?auto_19723 ?auto_19710 ) ) ( HOIST-AT ?auto_19725 ?auto_19723 ) ( SURFACE-AT ?auto_19703 ?auto_19723 ) ( ON ?auto_19703 ?auto_19720 ) ( CLEAR ?auto_19703 ) ( not ( = ?auto_19702 ?auto_19703 ) ) ( not ( = ?auto_19702 ?auto_19720 ) ) ( not ( = ?auto_19703 ?auto_19720 ) ) ( not ( = ?auto_19713 ?auto_19725 ) ) ( IS-CRATE ?auto_19702 ) ( not ( = ?auto_19722 ?auto_19710 ) ) ( HOIST-AT ?auto_19717 ?auto_19722 ) ( SURFACE-AT ?auto_19702 ?auto_19722 ) ( ON ?auto_19702 ?auto_19715 ) ( CLEAR ?auto_19702 ) ( not ( = ?auto_19701 ?auto_19702 ) ) ( not ( = ?auto_19701 ?auto_19715 ) ) ( not ( = ?auto_19702 ?auto_19715 ) ) ( not ( = ?auto_19713 ?auto_19717 ) ) ( IS-CRATE ?auto_19701 ) ( AVAILABLE ?auto_19732 ) ( SURFACE-AT ?auto_19701 ?auto_19730 ) ( ON ?auto_19701 ?auto_19731 ) ( CLEAR ?auto_19701 ) ( not ( = ?auto_19700 ?auto_19701 ) ) ( not ( = ?auto_19700 ?auto_19731 ) ) ( not ( = ?auto_19701 ?auto_19731 ) ) ( IS-CRATE ?auto_19700 ) ( AVAILABLE ?auto_19728 ) ( SURFACE-AT ?auto_19700 ?auto_19726 ) ( ON ?auto_19700 ?auto_19721 ) ( CLEAR ?auto_19700 ) ( not ( = ?auto_19699 ?auto_19700 ) ) ( not ( = ?auto_19699 ?auto_19721 ) ) ( not ( = ?auto_19700 ?auto_19721 ) ) ( IS-CRATE ?auto_19699 ) ( AVAILABLE ?auto_19725 ) ( SURFACE-AT ?auto_19699 ?auto_19723 ) ( ON ?auto_19699 ?auto_19733 ) ( CLEAR ?auto_19699 ) ( not ( = ?auto_19698 ?auto_19699 ) ) ( not ( = ?auto_19698 ?auto_19733 ) ) ( not ( = ?auto_19699 ?auto_19733 ) ) ( SURFACE-AT ?auto_19697 ?auto_19710 ) ( CLEAR ?auto_19697 ) ( IS-CRATE ?auto_19698 ) ( AVAILABLE ?auto_19713 ) ( AVAILABLE ?auto_19717 ) ( SURFACE-AT ?auto_19698 ?auto_19722 ) ( ON ?auto_19698 ?auto_19719 ) ( CLEAR ?auto_19698 ) ( TRUCK-AT ?auto_19712 ?auto_19710 ) ( not ( = ?auto_19697 ?auto_19698 ) ) ( not ( = ?auto_19697 ?auto_19719 ) ) ( not ( = ?auto_19698 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19699 ) ) ( not ( = ?auto_19697 ?auto_19733 ) ) ( not ( = ?auto_19699 ?auto_19719 ) ) ( not ( = ?auto_19723 ?auto_19722 ) ) ( not ( = ?auto_19725 ?auto_19717 ) ) ( not ( = ?auto_19733 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19700 ) ) ( not ( = ?auto_19697 ?auto_19721 ) ) ( not ( = ?auto_19698 ?auto_19700 ) ) ( not ( = ?auto_19698 ?auto_19721 ) ) ( not ( = ?auto_19700 ?auto_19733 ) ) ( not ( = ?auto_19700 ?auto_19719 ) ) ( not ( = ?auto_19726 ?auto_19723 ) ) ( not ( = ?auto_19726 ?auto_19722 ) ) ( not ( = ?auto_19728 ?auto_19725 ) ) ( not ( = ?auto_19728 ?auto_19717 ) ) ( not ( = ?auto_19721 ?auto_19733 ) ) ( not ( = ?auto_19721 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19701 ) ) ( not ( = ?auto_19697 ?auto_19731 ) ) ( not ( = ?auto_19698 ?auto_19701 ) ) ( not ( = ?auto_19698 ?auto_19731 ) ) ( not ( = ?auto_19699 ?auto_19701 ) ) ( not ( = ?auto_19699 ?auto_19731 ) ) ( not ( = ?auto_19701 ?auto_19721 ) ) ( not ( = ?auto_19701 ?auto_19733 ) ) ( not ( = ?auto_19701 ?auto_19719 ) ) ( not ( = ?auto_19730 ?auto_19726 ) ) ( not ( = ?auto_19730 ?auto_19723 ) ) ( not ( = ?auto_19730 ?auto_19722 ) ) ( not ( = ?auto_19732 ?auto_19728 ) ) ( not ( = ?auto_19732 ?auto_19725 ) ) ( not ( = ?auto_19732 ?auto_19717 ) ) ( not ( = ?auto_19731 ?auto_19721 ) ) ( not ( = ?auto_19731 ?auto_19733 ) ) ( not ( = ?auto_19731 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19702 ) ) ( not ( = ?auto_19697 ?auto_19715 ) ) ( not ( = ?auto_19698 ?auto_19702 ) ) ( not ( = ?auto_19698 ?auto_19715 ) ) ( not ( = ?auto_19699 ?auto_19702 ) ) ( not ( = ?auto_19699 ?auto_19715 ) ) ( not ( = ?auto_19700 ?auto_19702 ) ) ( not ( = ?auto_19700 ?auto_19715 ) ) ( not ( = ?auto_19702 ?auto_19731 ) ) ( not ( = ?auto_19702 ?auto_19721 ) ) ( not ( = ?auto_19702 ?auto_19733 ) ) ( not ( = ?auto_19702 ?auto_19719 ) ) ( not ( = ?auto_19715 ?auto_19731 ) ) ( not ( = ?auto_19715 ?auto_19721 ) ) ( not ( = ?auto_19715 ?auto_19733 ) ) ( not ( = ?auto_19715 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19703 ) ) ( not ( = ?auto_19697 ?auto_19720 ) ) ( not ( = ?auto_19698 ?auto_19703 ) ) ( not ( = ?auto_19698 ?auto_19720 ) ) ( not ( = ?auto_19699 ?auto_19703 ) ) ( not ( = ?auto_19699 ?auto_19720 ) ) ( not ( = ?auto_19700 ?auto_19703 ) ) ( not ( = ?auto_19700 ?auto_19720 ) ) ( not ( = ?auto_19701 ?auto_19703 ) ) ( not ( = ?auto_19701 ?auto_19720 ) ) ( not ( = ?auto_19703 ?auto_19715 ) ) ( not ( = ?auto_19703 ?auto_19731 ) ) ( not ( = ?auto_19703 ?auto_19721 ) ) ( not ( = ?auto_19703 ?auto_19733 ) ) ( not ( = ?auto_19703 ?auto_19719 ) ) ( not ( = ?auto_19720 ?auto_19715 ) ) ( not ( = ?auto_19720 ?auto_19731 ) ) ( not ( = ?auto_19720 ?auto_19721 ) ) ( not ( = ?auto_19720 ?auto_19733 ) ) ( not ( = ?auto_19720 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19706 ) ) ( not ( = ?auto_19697 ?auto_19716 ) ) ( not ( = ?auto_19698 ?auto_19706 ) ) ( not ( = ?auto_19698 ?auto_19716 ) ) ( not ( = ?auto_19699 ?auto_19706 ) ) ( not ( = ?auto_19699 ?auto_19716 ) ) ( not ( = ?auto_19700 ?auto_19706 ) ) ( not ( = ?auto_19700 ?auto_19716 ) ) ( not ( = ?auto_19701 ?auto_19706 ) ) ( not ( = ?auto_19701 ?auto_19716 ) ) ( not ( = ?auto_19702 ?auto_19706 ) ) ( not ( = ?auto_19702 ?auto_19716 ) ) ( not ( = ?auto_19706 ?auto_19720 ) ) ( not ( = ?auto_19706 ?auto_19715 ) ) ( not ( = ?auto_19706 ?auto_19731 ) ) ( not ( = ?auto_19706 ?auto_19721 ) ) ( not ( = ?auto_19706 ?auto_19733 ) ) ( not ( = ?auto_19706 ?auto_19719 ) ) ( not ( = ?auto_19716 ?auto_19720 ) ) ( not ( = ?auto_19716 ?auto_19715 ) ) ( not ( = ?auto_19716 ?auto_19731 ) ) ( not ( = ?auto_19716 ?auto_19721 ) ) ( not ( = ?auto_19716 ?auto_19733 ) ) ( not ( = ?auto_19716 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19705 ) ) ( not ( = ?auto_19697 ?auto_19729 ) ) ( not ( = ?auto_19698 ?auto_19705 ) ) ( not ( = ?auto_19698 ?auto_19729 ) ) ( not ( = ?auto_19699 ?auto_19705 ) ) ( not ( = ?auto_19699 ?auto_19729 ) ) ( not ( = ?auto_19700 ?auto_19705 ) ) ( not ( = ?auto_19700 ?auto_19729 ) ) ( not ( = ?auto_19701 ?auto_19705 ) ) ( not ( = ?auto_19701 ?auto_19729 ) ) ( not ( = ?auto_19702 ?auto_19705 ) ) ( not ( = ?auto_19702 ?auto_19729 ) ) ( not ( = ?auto_19703 ?auto_19705 ) ) ( not ( = ?auto_19703 ?auto_19729 ) ) ( not ( = ?auto_19705 ?auto_19716 ) ) ( not ( = ?auto_19705 ?auto_19720 ) ) ( not ( = ?auto_19705 ?auto_19715 ) ) ( not ( = ?auto_19705 ?auto_19731 ) ) ( not ( = ?auto_19705 ?auto_19721 ) ) ( not ( = ?auto_19705 ?auto_19733 ) ) ( not ( = ?auto_19705 ?auto_19719 ) ) ( not ( = ?auto_19711 ?auto_19730 ) ) ( not ( = ?auto_19711 ?auto_19723 ) ) ( not ( = ?auto_19711 ?auto_19722 ) ) ( not ( = ?auto_19711 ?auto_19726 ) ) ( not ( = ?auto_19714 ?auto_19732 ) ) ( not ( = ?auto_19714 ?auto_19725 ) ) ( not ( = ?auto_19714 ?auto_19717 ) ) ( not ( = ?auto_19714 ?auto_19728 ) ) ( not ( = ?auto_19729 ?auto_19716 ) ) ( not ( = ?auto_19729 ?auto_19720 ) ) ( not ( = ?auto_19729 ?auto_19715 ) ) ( not ( = ?auto_19729 ?auto_19731 ) ) ( not ( = ?auto_19729 ?auto_19721 ) ) ( not ( = ?auto_19729 ?auto_19733 ) ) ( not ( = ?auto_19729 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19704 ) ) ( not ( = ?auto_19697 ?auto_19718 ) ) ( not ( = ?auto_19698 ?auto_19704 ) ) ( not ( = ?auto_19698 ?auto_19718 ) ) ( not ( = ?auto_19699 ?auto_19704 ) ) ( not ( = ?auto_19699 ?auto_19718 ) ) ( not ( = ?auto_19700 ?auto_19704 ) ) ( not ( = ?auto_19700 ?auto_19718 ) ) ( not ( = ?auto_19701 ?auto_19704 ) ) ( not ( = ?auto_19701 ?auto_19718 ) ) ( not ( = ?auto_19702 ?auto_19704 ) ) ( not ( = ?auto_19702 ?auto_19718 ) ) ( not ( = ?auto_19703 ?auto_19704 ) ) ( not ( = ?auto_19703 ?auto_19718 ) ) ( not ( = ?auto_19706 ?auto_19704 ) ) ( not ( = ?auto_19706 ?auto_19718 ) ) ( not ( = ?auto_19704 ?auto_19729 ) ) ( not ( = ?auto_19704 ?auto_19716 ) ) ( not ( = ?auto_19704 ?auto_19720 ) ) ( not ( = ?auto_19704 ?auto_19715 ) ) ( not ( = ?auto_19704 ?auto_19731 ) ) ( not ( = ?auto_19704 ?auto_19721 ) ) ( not ( = ?auto_19704 ?auto_19733 ) ) ( not ( = ?auto_19704 ?auto_19719 ) ) ( not ( = ?auto_19734 ?auto_19711 ) ) ( not ( = ?auto_19734 ?auto_19730 ) ) ( not ( = ?auto_19734 ?auto_19723 ) ) ( not ( = ?auto_19734 ?auto_19722 ) ) ( not ( = ?auto_19734 ?auto_19726 ) ) ( not ( = ?auto_19724 ?auto_19714 ) ) ( not ( = ?auto_19724 ?auto_19732 ) ) ( not ( = ?auto_19724 ?auto_19725 ) ) ( not ( = ?auto_19724 ?auto_19717 ) ) ( not ( = ?auto_19724 ?auto_19728 ) ) ( not ( = ?auto_19718 ?auto_19729 ) ) ( not ( = ?auto_19718 ?auto_19716 ) ) ( not ( = ?auto_19718 ?auto_19720 ) ) ( not ( = ?auto_19718 ?auto_19715 ) ) ( not ( = ?auto_19718 ?auto_19731 ) ) ( not ( = ?auto_19718 ?auto_19721 ) ) ( not ( = ?auto_19718 ?auto_19733 ) ) ( not ( = ?auto_19718 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19707 ) ) ( not ( = ?auto_19697 ?auto_19727 ) ) ( not ( = ?auto_19698 ?auto_19707 ) ) ( not ( = ?auto_19698 ?auto_19727 ) ) ( not ( = ?auto_19699 ?auto_19707 ) ) ( not ( = ?auto_19699 ?auto_19727 ) ) ( not ( = ?auto_19700 ?auto_19707 ) ) ( not ( = ?auto_19700 ?auto_19727 ) ) ( not ( = ?auto_19701 ?auto_19707 ) ) ( not ( = ?auto_19701 ?auto_19727 ) ) ( not ( = ?auto_19702 ?auto_19707 ) ) ( not ( = ?auto_19702 ?auto_19727 ) ) ( not ( = ?auto_19703 ?auto_19707 ) ) ( not ( = ?auto_19703 ?auto_19727 ) ) ( not ( = ?auto_19706 ?auto_19707 ) ) ( not ( = ?auto_19706 ?auto_19727 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19727 ) ) ( not ( = ?auto_19707 ?auto_19718 ) ) ( not ( = ?auto_19707 ?auto_19729 ) ) ( not ( = ?auto_19707 ?auto_19716 ) ) ( not ( = ?auto_19707 ?auto_19720 ) ) ( not ( = ?auto_19707 ?auto_19715 ) ) ( not ( = ?auto_19707 ?auto_19731 ) ) ( not ( = ?auto_19707 ?auto_19721 ) ) ( not ( = ?auto_19707 ?auto_19733 ) ) ( not ( = ?auto_19707 ?auto_19719 ) ) ( not ( = ?auto_19727 ?auto_19718 ) ) ( not ( = ?auto_19727 ?auto_19729 ) ) ( not ( = ?auto_19727 ?auto_19716 ) ) ( not ( = ?auto_19727 ?auto_19720 ) ) ( not ( = ?auto_19727 ?auto_19715 ) ) ( not ( = ?auto_19727 ?auto_19731 ) ) ( not ( = ?auto_19727 ?auto_19721 ) ) ( not ( = ?auto_19727 ?auto_19733 ) ) ( not ( = ?auto_19727 ?auto_19719 ) ) ( not ( = ?auto_19697 ?auto_19708 ) ) ( not ( = ?auto_19697 ?auto_19709 ) ) ( not ( = ?auto_19698 ?auto_19708 ) ) ( not ( = ?auto_19698 ?auto_19709 ) ) ( not ( = ?auto_19699 ?auto_19708 ) ) ( not ( = ?auto_19699 ?auto_19709 ) ) ( not ( = ?auto_19700 ?auto_19708 ) ) ( not ( = ?auto_19700 ?auto_19709 ) ) ( not ( = ?auto_19701 ?auto_19708 ) ) ( not ( = ?auto_19701 ?auto_19709 ) ) ( not ( = ?auto_19702 ?auto_19708 ) ) ( not ( = ?auto_19702 ?auto_19709 ) ) ( not ( = ?auto_19703 ?auto_19708 ) ) ( not ( = ?auto_19703 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19708 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19704 ?auto_19709 ) ) ( not ( = ?auto_19708 ?auto_19727 ) ) ( not ( = ?auto_19708 ?auto_19718 ) ) ( not ( = ?auto_19708 ?auto_19729 ) ) ( not ( = ?auto_19708 ?auto_19716 ) ) ( not ( = ?auto_19708 ?auto_19720 ) ) ( not ( = ?auto_19708 ?auto_19715 ) ) ( not ( = ?auto_19708 ?auto_19731 ) ) ( not ( = ?auto_19708 ?auto_19721 ) ) ( not ( = ?auto_19708 ?auto_19733 ) ) ( not ( = ?auto_19708 ?auto_19719 ) ) ( not ( = ?auto_19709 ?auto_19727 ) ) ( not ( = ?auto_19709 ?auto_19718 ) ) ( not ( = ?auto_19709 ?auto_19729 ) ) ( not ( = ?auto_19709 ?auto_19716 ) ) ( not ( = ?auto_19709 ?auto_19720 ) ) ( not ( = ?auto_19709 ?auto_19715 ) ) ( not ( = ?auto_19709 ?auto_19731 ) ) ( not ( = ?auto_19709 ?auto_19721 ) ) ( not ( = ?auto_19709 ?auto_19733 ) ) ( not ( = ?auto_19709 ?auto_19719 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_19697 ?auto_19698 ?auto_19699 ?auto_19700 ?auto_19701 ?auto_19702 ?auto_19703 ?auto_19706 ?auto_19705 ?auto_19704 ?auto_19707 )
      ( MAKE-1CRATE ?auto_19707 ?auto_19708 )
      ( MAKE-11CRATE-VERIFY ?auto_19697 ?auto_19698 ?auto_19699 ?auto_19700 ?auto_19701 ?auto_19702 ?auto_19703 ?auto_19706 ?auto_19705 ?auto_19704 ?auto_19707 ?auto_19708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19737 - SURFACE
      ?auto_19738 - SURFACE
    )
    :vars
    (
      ?auto_19739 - HOIST
      ?auto_19740 - PLACE
      ?auto_19742 - PLACE
      ?auto_19743 - HOIST
      ?auto_19744 - SURFACE
      ?auto_19741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19739 ?auto_19740 ) ( SURFACE-AT ?auto_19737 ?auto_19740 ) ( CLEAR ?auto_19737 ) ( IS-CRATE ?auto_19738 ) ( AVAILABLE ?auto_19739 ) ( not ( = ?auto_19742 ?auto_19740 ) ) ( HOIST-AT ?auto_19743 ?auto_19742 ) ( AVAILABLE ?auto_19743 ) ( SURFACE-AT ?auto_19738 ?auto_19742 ) ( ON ?auto_19738 ?auto_19744 ) ( CLEAR ?auto_19738 ) ( TRUCK-AT ?auto_19741 ?auto_19740 ) ( not ( = ?auto_19737 ?auto_19738 ) ) ( not ( = ?auto_19737 ?auto_19744 ) ) ( not ( = ?auto_19738 ?auto_19744 ) ) ( not ( = ?auto_19739 ?auto_19743 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19741 ?auto_19740 ?auto_19742 )
      ( !LIFT ?auto_19743 ?auto_19738 ?auto_19744 ?auto_19742 )
      ( !LOAD ?auto_19743 ?auto_19738 ?auto_19741 ?auto_19742 )
      ( !DRIVE ?auto_19741 ?auto_19742 ?auto_19740 )
      ( !UNLOAD ?auto_19739 ?auto_19738 ?auto_19741 ?auto_19740 )
      ( !DROP ?auto_19739 ?auto_19738 ?auto_19737 ?auto_19740 )
      ( MAKE-1CRATE-VERIFY ?auto_19737 ?auto_19738 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_19758 - SURFACE
      ?auto_19759 - SURFACE
      ?auto_19760 - SURFACE
      ?auto_19761 - SURFACE
      ?auto_19762 - SURFACE
      ?auto_19763 - SURFACE
      ?auto_19764 - SURFACE
      ?auto_19767 - SURFACE
      ?auto_19766 - SURFACE
      ?auto_19765 - SURFACE
      ?auto_19768 - SURFACE
      ?auto_19769 - SURFACE
      ?auto_19770 - SURFACE
    )
    :vars
    (
      ?auto_19771 - HOIST
      ?auto_19772 - PLACE
      ?auto_19774 - PLACE
      ?auto_19773 - HOIST
      ?auto_19775 - SURFACE
      ?auto_19793 - PLACE
      ?auto_19778 - HOIST
      ?auto_19787 - SURFACE
      ?auto_19790 - PLACE
      ?auto_19782 - HOIST
      ?auto_19786 - SURFACE
      ?auto_19780 - PLACE
      ?auto_19789 - HOIST
      ?auto_19796 - SURFACE
      ?auto_19792 - SURFACE
      ?auto_19781 - SURFACE
      ?auto_19777 - PLACE
      ?auto_19788 - HOIST
      ?auto_19779 - SURFACE
      ?auto_19785 - PLACE
      ?auto_19794 - HOIST
      ?auto_19795 - SURFACE
      ?auto_19783 - SURFACE
      ?auto_19784 - SURFACE
      ?auto_19797 - SURFACE
      ?auto_19791 - SURFACE
      ?auto_19776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19771 ?auto_19772 ) ( IS-CRATE ?auto_19770 ) ( not ( = ?auto_19774 ?auto_19772 ) ) ( HOIST-AT ?auto_19773 ?auto_19774 ) ( SURFACE-AT ?auto_19770 ?auto_19774 ) ( ON ?auto_19770 ?auto_19775 ) ( CLEAR ?auto_19770 ) ( not ( = ?auto_19769 ?auto_19770 ) ) ( not ( = ?auto_19769 ?auto_19775 ) ) ( not ( = ?auto_19770 ?auto_19775 ) ) ( not ( = ?auto_19771 ?auto_19773 ) ) ( IS-CRATE ?auto_19769 ) ( not ( = ?auto_19793 ?auto_19772 ) ) ( HOIST-AT ?auto_19778 ?auto_19793 ) ( SURFACE-AT ?auto_19769 ?auto_19793 ) ( ON ?auto_19769 ?auto_19787 ) ( CLEAR ?auto_19769 ) ( not ( = ?auto_19768 ?auto_19769 ) ) ( not ( = ?auto_19768 ?auto_19787 ) ) ( not ( = ?auto_19769 ?auto_19787 ) ) ( not ( = ?auto_19771 ?auto_19778 ) ) ( IS-CRATE ?auto_19768 ) ( not ( = ?auto_19790 ?auto_19772 ) ) ( HOIST-AT ?auto_19782 ?auto_19790 ) ( SURFACE-AT ?auto_19768 ?auto_19790 ) ( ON ?auto_19768 ?auto_19786 ) ( CLEAR ?auto_19768 ) ( not ( = ?auto_19765 ?auto_19768 ) ) ( not ( = ?auto_19765 ?auto_19786 ) ) ( not ( = ?auto_19768 ?auto_19786 ) ) ( not ( = ?auto_19771 ?auto_19782 ) ) ( IS-CRATE ?auto_19765 ) ( not ( = ?auto_19780 ?auto_19772 ) ) ( HOIST-AT ?auto_19789 ?auto_19780 ) ( AVAILABLE ?auto_19789 ) ( SURFACE-AT ?auto_19765 ?auto_19780 ) ( ON ?auto_19765 ?auto_19796 ) ( CLEAR ?auto_19765 ) ( not ( = ?auto_19766 ?auto_19765 ) ) ( not ( = ?auto_19766 ?auto_19796 ) ) ( not ( = ?auto_19765 ?auto_19796 ) ) ( not ( = ?auto_19771 ?auto_19789 ) ) ( IS-CRATE ?auto_19766 ) ( AVAILABLE ?auto_19778 ) ( SURFACE-AT ?auto_19766 ?auto_19793 ) ( ON ?auto_19766 ?auto_19792 ) ( CLEAR ?auto_19766 ) ( not ( = ?auto_19767 ?auto_19766 ) ) ( not ( = ?auto_19767 ?auto_19792 ) ) ( not ( = ?auto_19766 ?auto_19792 ) ) ( IS-CRATE ?auto_19767 ) ( SURFACE-AT ?auto_19767 ?auto_19774 ) ( ON ?auto_19767 ?auto_19781 ) ( CLEAR ?auto_19767 ) ( not ( = ?auto_19764 ?auto_19767 ) ) ( not ( = ?auto_19764 ?auto_19781 ) ) ( not ( = ?auto_19767 ?auto_19781 ) ) ( IS-CRATE ?auto_19764 ) ( not ( = ?auto_19777 ?auto_19772 ) ) ( HOIST-AT ?auto_19788 ?auto_19777 ) ( SURFACE-AT ?auto_19764 ?auto_19777 ) ( ON ?auto_19764 ?auto_19779 ) ( CLEAR ?auto_19764 ) ( not ( = ?auto_19763 ?auto_19764 ) ) ( not ( = ?auto_19763 ?auto_19779 ) ) ( not ( = ?auto_19764 ?auto_19779 ) ) ( not ( = ?auto_19771 ?auto_19788 ) ) ( IS-CRATE ?auto_19763 ) ( not ( = ?auto_19785 ?auto_19772 ) ) ( HOIST-AT ?auto_19794 ?auto_19785 ) ( SURFACE-AT ?auto_19763 ?auto_19785 ) ( ON ?auto_19763 ?auto_19795 ) ( CLEAR ?auto_19763 ) ( not ( = ?auto_19762 ?auto_19763 ) ) ( not ( = ?auto_19762 ?auto_19795 ) ) ( not ( = ?auto_19763 ?auto_19795 ) ) ( not ( = ?auto_19771 ?auto_19794 ) ) ( IS-CRATE ?auto_19762 ) ( AVAILABLE ?auto_19773 ) ( SURFACE-AT ?auto_19762 ?auto_19774 ) ( ON ?auto_19762 ?auto_19783 ) ( CLEAR ?auto_19762 ) ( not ( = ?auto_19761 ?auto_19762 ) ) ( not ( = ?auto_19761 ?auto_19783 ) ) ( not ( = ?auto_19762 ?auto_19783 ) ) ( IS-CRATE ?auto_19761 ) ( AVAILABLE ?auto_19782 ) ( SURFACE-AT ?auto_19761 ?auto_19790 ) ( ON ?auto_19761 ?auto_19784 ) ( CLEAR ?auto_19761 ) ( not ( = ?auto_19760 ?auto_19761 ) ) ( not ( = ?auto_19760 ?auto_19784 ) ) ( not ( = ?auto_19761 ?auto_19784 ) ) ( IS-CRATE ?auto_19760 ) ( AVAILABLE ?auto_19788 ) ( SURFACE-AT ?auto_19760 ?auto_19777 ) ( ON ?auto_19760 ?auto_19797 ) ( CLEAR ?auto_19760 ) ( not ( = ?auto_19759 ?auto_19760 ) ) ( not ( = ?auto_19759 ?auto_19797 ) ) ( not ( = ?auto_19760 ?auto_19797 ) ) ( SURFACE-AT ?auto_19758 ?auto_19772 ) ( CLEAR ?auto_19758 ) ( IS-CRATE ?auto_19759 ) ( AVAILABLE ?auto_19771 ) ( AVAILABLE ?auto_19794 ) ( SURFACE-AT ?auto_19759 ?auto_19785 ) ( ON ?auto_19759 ?auto_19791 ) ( CLEAR ?auto_19759 ) ( TRUCK-AT ?auto_19776 ?auto_19772 ) ( not ( = ?auto_19758 ?auto_19759 ) ) ( not ( = ?auto_19758 ?auto_19791 ) ) ( not ( = ?auto_19759 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19760 ) ) ( not ( = ?auto_19758 ?auto_19797 ) ) ( not ( = ?auto_19760 ?auto_19791 ) ) ( not ( = ?auto_19777 ?auto_19785 ) ) ( not ( = ?auto_19788 ?auto_19794 ) ) ( not ( = ?auto_19797 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19761 ) ) ( not ( = ?auto_19758 ?auto_19784 ) ) ( not ( = ?auto_19759 ?auto_19761 ) ) ( not ( = ?auto_19759 ?auto_19784 ) ) ( not ( = ?auto_19761 ?auto_19797 ) ) ( not ( = ?auto_19761 ?auto_19791 ) ) ( not ( = ?auto_19790 ?auto_19777 ) ) ( not ( = ?auto_19790 ?auto_19785 ) ) ( not ( = ?auto_19782 ?auto_19788 ) ) ( not ( = ?auto_19782 ?auto_19794 ) ) ( not ( = ?auto_19784 ?auto_19797 ) ) ( not ( = ?auto_19784 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19762 ) ) ( not ( = ?auto_19758 ?auto_19783 ) ) ( not ( = ?auto_19759 ?auto_19762 ) ) ( not ( = ?auto_19759 ?auto_19783 ) ) ( not ( = ?auto_19760 ?auto_19762 ) ) ( not ( = ?auto_19760 ?auto_19783 ) ) ( not ( = ?auto_19762 ?auto_19784 ) ) ( not ( = ?auto_19762 ?auto_19797 ) ) ( not ( = ?auto_19762 ?auto_19791 ) ) ( not ( = ?auto_19774 ?auto_19790 ) ) ( not ( = ?auto_19774 ?auto_19777 ) ) ( not ( = ?auto_19774 ?auto_19785 ) ) ( not ( = ?auto_19773 ?auto_19782 ) ) ( not ( = ?auto_19773 ?auto_19788 ) ) ( not ( = ?auto_19773 ?auto_19794 ) ) ( not ( = ?auto_19783 ?auto_19784 ) ) ( not ( = ?auto_19783 ?auto_19797 ) ) ( not ( = ?auto_19783 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19763 ) ) ( not ( = ?auto_19758 ?auto_19795 ) ) ( not ( = ?auto_19759 ?auto_19763 ) ) ( not ( = ?auto_19759 ?auto_19795 ) ) ( not ( = ?auto_19760 ?auto_19763 ) ) ( not ( = ?auto_19760 ?auto_19795 ) ) ( not ( = ?auto_19761 ?auto_19763 ) ) ( not ( = ?auto_19761 ?auto_19795 ) ) ( not ( = ?auto_19763 ?auto_19783 ) ) ( not ( = ?auto_19763 ?auto_19784 ) ) ( not ( = ?auto_19763 ?auto_19797 ) ) ( not ( = ?auto_19763 ?auto_19791 ) ) ( not ( = ?auto_19795 ?auto_19783 ) ) ( not ( = ?auto_19795 ?auto_19784 ) ) ( not ( = ?auto_19795 ?auto_19797 ) ) ( not ( = ?auto_19795 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19764 ) ) ( not ( = ?auto_19758 ?auto_19779 ) ) ( not ( = ?auto_19759 ?auto_19764 ) ) ( not ( = ?auto_19759 ?auto_19779 ) ) ( not ( = ?auto_19760 ?auto_19764 ) ) ( not ( = ?auto_19760 ?auto_19779 ) ) ( not ( = ?auto_19761 ?auto_19764 ) ) ( not ( = ?auto_19761 ?auto_19779 ) ) ( not ( = ?auto_19762 ?auto_19764 ) ) ( not ( = ?auto_19762 ?auto_19779 ) ) ( not ( = ?auto_19764 ?auto_19795 ) ) ( not ( = ?auto_19764 ?auto_19783 ) ) ( not ( = ?auto_19764 ?auto_19784 ) ) ( not ( = ?auto_19764 ?auto_19797 ) ) ( not ( = ?auto_19764 ?auto_19791 ) ) ( not ( = ?auto_19779 ?auto_19795 ) ) ( not ( = ?auto_19779 ?auto_19783 ) ) ( not ( = ?auto_19779 ?auto_19784 ) ) ( not ( = ?auto_19779 ?auto_19797 ) ) ( not ( = ?auto_19779 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19767 ) ) ( not ( = ?auto_19758 ?auto_19781 ) ) ( not ( = ?auto_19759 ?auto_19767 ) ) ( not ( = ?auto_19759 ?auto_19781 ) ) ( not ( = ?auto_19760 ?auto_19767 ) ) ( not ( = ?auto_19760 ?auto_19781 ) ) ( not ( = ?auto_19761 ?auto_19767 ) ) ( not ( = ?auto_19761 ?auto_19781 ) ) ( not ( = ?auto_19762 ?auto_19767 ) ) ( not ( = ?auto_19762 ?auto_19781 ) ) ( not ( = ?auto_19763 ?auto_19767 ) ) ( not ( = ?auto_19763 ?auto_19781 ) ) ( not ( = ?auto_19767 ?auto_19779 ) ) ( not ( = ?auto_19767 ?auto_19795 ) ) ( not ( = ?auto_19767 ?auto_19783 ) ) ( not ( = ?auto_19767 ?auto_19784 ) ) ( not ( = ?auto_19767 ?auto_19797 ) ) ( not ( = ?auto_19767 ?auto_19791 ) ) ( not ( = ?auto_19781 ?auto_19779 ) ) ( not ( = ?auto_19781 ?auto_19795 ) ) ( not ( = ?auto_19781 ?auto_19783 ) ) ( not ( = ?auto_19781 ?auto_19784 ) ) ( not ( = ?auto_19781 ?auto_19797 ) ) ( not ( = ?auto_19781 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19766 ) ) ( not ( = ?auto_19758 ?auto_19792 ) ) ( not ( = ?auto_19759 ?auto_19766 ) ) ( not ( = ?auto_19759 ?auto_19792 ) ) ( not ( = ?auto_19760 ?auto_19766 ) ) ( not ( = ?auto_19760 ?auto_19792 ) ) ( not ( = ?auto_19761 ?auto_19766 ) ) ( not ( = ?auto_19761 ?auto_19792 ) ) ( not ( = ?auto_19762 ?auto_19766 ) ) ( not ( = ?auto_19762 ?auto_19792 ) ) ( not ( = ?auto_19763 ?auto_19766 ) ) ( not ( = ?auto_19763 ?auto_19792 ) ) ( not ( = ?auto_19764 ?auto_19766 ) ) ( not ( = ?auto_19764 ?auto_19792 ) ) ( not ( = ?auto_19766 ?auto_19781 ) ) ( not ( = ?auto_19766 ?auto_19779 ) ) ( not ( = ?auto_19766 ?auto_19795 ) ) ( not ( = ?auto_19766 ?auto_19783 ) ) ( not ( = ?auto_19766 ?auto_19784 ) ) ( not ( = ?auto_19766 ?auto_19797 ) ) ( not ( = ?auto_19766 ?auto_19791 ) ) ( not ( = ?auto_19793 ?auto_19774 ) ) ( not ( = ?auto_19793 ?auto_19777 ) ) ( not ( = ?auto_19793 ?auto_19785 ) ) ( not ( = ?auto_19793 ?auto_19790 ) ) ( not ( = ?auto_19778 ?auto_19773 ) ) ( not ( = ?auto_19778 ?auto_19788 ) ) ( not ( = ?auto_19778 ?auto_19794 ) ) ( not ( = ?auto_19778 ?auto_19782 ) ) ( not ( = ?auto_19792 ?auto_19781 ) ) ( not ( = ?auto_19792 ?auto_19779 ) ) ( not ( = ?auto_19792 ?auto_19795 ) ) ( not ( = ?auto_19792 ?auto_19783 ) ) ( not ( = ?auto_19792 ?auto_19784 ) ) ( not ( = ?auto_19792 ?auto_19797 ) ) ( not ( = ?auto_19792 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19765 ) ) ( not ( = ?auto_19758 ?auto_19796 ) ) ( not ( = ?auto_19759 ?auto_19765 ) ) ( not ( = ?auto_19759 ?auto_19796 ) ) ( not ( = ?auto_19760 ?auto_19765 ) ) ( not ( = ?auto_19760 ?auto_19796 ) ) ( not ( = ?auto_19761 ?auto_19765 ) ) ( not ( = ?auto_19761 ?auto_19796 ) ) ( not ( = ?auto_19762 ?auto_19765 ) ) ( not ( = ?auto_19762 ?auto_19796 ) ) ( not ( = ?auto_19763 ?auto_19765 ) ) ( not ( = ?auto_19763 ?auto_19796 ) ) ( not ( = ?auto_19764 ?auto_19765 ) ) ( not ( = ?auto_19764 ?auto_19796 ) ) ( not ( = ?auto_19767 ?auto_19765 ) ) ( not ( = ?auto_19767 ?auto_19796 ) ) ( not ( = ?auto_19765 ?auto_19792 ) ) ( not ( = ?auto_19765 ?auto_19781 ) ) ( not ( = ?auto_19765 ?auto_19779 ) ) ( not ( = ?auto_19765 ?auto_19795 ) ) ( not ( = ?auto_19765 ?auto_19783 ) ) ( not ( = ?auto_19765 ?auto_19784 ) ) ( not ( = ?auto_19765 ?auto_19797 ) ) ( not ( = ?auto_19765 ?auto_19791 ) ) ( not ( = ?auto_19780 ?auto_19793 ) ) ( not ( = ?auto_19780 ?auto_19774 ) ) ( not ( = ?auto_19780 ?auto_19777 ) ) ( not ( = ?auto_19780 ?auto_19785 ) ) ( not ( = ?auto_19780 ?auto_19790 ) ) ( not ( = ?auto_19789 ?auto_19778 ) ) ( not ( = ?auto_19789 ?auto_19773 ) ) ( not ( = ?auto_19789 ?auto_19788 ) ) ( not ( = ?auto_19789 ?auto_19794 ) ) ( not ( = ?auto_19789 ?auto_19782 ) ) ( not ( = ?auto_19796 ?auto_19792 ) ) ( not ( = ?auto_19796 ?auto_19781 ) ) ( not ( = ?auto_19796 ?auto_19779 ) ) ( not ( = ?auto_19796 ?auto_19795 ) ) ( not ( = ?auto_19796 ?auto_19783 ) ) ( not ( = ?auto_19796 ?auto_19784 ) ) ( not ( = ?auto_19796 ?auto_19797 ) ) ( not ( = ?auto_19796 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19768 ) ) ( not ( = ?auto_19758 ?auto_19786 ) ) ( not ( = ?auto_19759 ?auto_19768 ) ) ( not ( = ?auto_19759 ?auto_19786 ) ) ( not ( = ?auto_19760 ?auto_19768 ) ) ( not ( = ?auto_19760 ?auto_19786 ) ) ( not ( = ?auto_19761 ?auto_19768 ) ) ( not ( = ?auto_19761 ?auto_19786 ) ) ( not ( = ?auto_19762 ?auto_19768 ) ) ( not ( = ?auto_19762 ?auto_19786 ) ) ( not ( = ?auto_19763 ?auto_19768 ) ) ( not ( = ?auto_19763 ?auto_19786 ) ) ( not ( = ?auto_19764 ?auto_19768 ) ) ( not ( = ?auto_19764 ?auto_19786 ) ) ( not ( = ?auto_19767 ?auto_19768 ) ) ( not ( = ?auto_19767 ?auto_19786 ) ) ( not ( = ?auto_19766 ?auto_19768 ) ) ( not ( = ?auto_19766 ?auto_19786 ) ) ( not ( = ?auto_19768 ?auto_19796 ) ) ( not ( = ?auto_19768 ?auto_19792 ) ) ( not ( = ?auto_19768 ?auto_19781 ) ) ( not ( = ?auto_19768 ?auto_19779 ) ) ( not ( = ?auto_19768 ?auto_19795 ) ) ( not ( = ?auto_19768 ?auto_19783 ) ) ( not ( = ?auto_19768 ?auto_19784 ) ) ( not ( = ?auto_19768 ?auto_19797 ) ) ( not ( = ?auto_19768 ?auto_19791 ) ) ( not ( = ?auto_19786 ?auto_19796 ) ) ( not ( = ?auto_19786 ?auto_19792 ) ) ( not ( = ?auto_19786 ?auto_19781 ) ) ( not ( = ?auto_19786 ?auto_19779 ) ) ( not ( = ?auto_19786 ?auto_19795 ) ) ( not ( = ?auto_19786 ?auto_19783 ) ) ( not ( = ?auto_19786 ?auto_19784 ) ) ( not ( = ?auto_19786 ?auto_19797 ) ) ( not ( = ?auto_19786 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19769 ) ) ( not ( = ?auto_19758 ?auto_19787 ) ) ( not ( = ?auto_19759 ?auto_19769 ) ) ( not ( = ?auto_19759 ?auto_19787 ) ) ( not ( = ?auto_19760 ?auto_19769 ) ) ( not ( = ?auto_19760 ?auto_19787 ) ) ( not ( = ?auto_19761 ?auto_19769 ) ) ( not ( = ?auto_19761 ?auto_19787 ) ) ( not ( = ?auto_19762 ?auto_19769 ) ) ( not ( = ?auto_19762 ?auto_19787 ) ) ( not ( = ?auto_19763 ?auto_19769 ) ) ( not ( = ?auto_19763 ?auto_19787 ) ) ( not ( = ?auto_19764 ?auto_19769 ) ) ( not ( = ?auto_19764 ?auto_19787 ) ) ( not ( = ?auto_19767 ?auto_19769 ) ) ( not ( = ?auto_19767 ?auto_19787 ) ) ( not ( = ?auto_19766 ?auto_19769 ) ) ( not ( = ?auto_19766 ?auto_19787 ) ) ( not ( = ?auto_19765 ?auto_19769 ) ) ( not ( = ?auto_19765 ?auto_19787 ) ) ( not ( = ?auto_19769 ?auto_19786 ) ) ( not ( = ?auto_19769 ?auto_19796 ) ) ( not ( = ?auto_19769 ?auto_19792 ) ) ( not ( = ?auto_19769 ?auto_19781 ) ) ( not ( = ?auto_19769 ?auto_19779 ) ) ( not ( = ?auto_19769 ?auto_19795 ) ) ( not ( = ?auto_19769 ?auto_19783 ) ) ( not ( = ?auto_19769 ?auto_19784 ) ) ( not ( = ?auto_19769 ?auto_19797 ) ) ( not ( = ?auto_19769 ?auto_19791 ) ) ( not ( = ?auto_19787 ?auto_19786 ) ) ( not ( = ?auto_19787 ?auto_19796 ) ) ( not ( = ?auto_19787 ?auto_19792 ) ) ( not ( = ?auto_19787 ?auto_19781 ) ) ( not ( = ?auto_19787 ?auto_19779 ) ) ( not ( = ?auto_19787 ?auto_19795 ) ) ( not ( = ?auto_19787 ?auto_19783 ) ) ( not ( = ?auto_19787 ?auto_19784 ) ) ( not ( = ?auto_19787 ?auto_19797 ) ) ( not ( = ?auto_19787 ?auto_19791 ) ) ( not ( = ?auto_19758 ?auto_19770 ) ) ( not ( = ?auto_19758 ?auto_19775 ) ) ( not ( = ?auto_19759 ?auto_19770 ) ) ( not ( = ?auto_19759 ?auto_19775 ) ) ( not ( = ?auto_19760 ?auto_19770 ) ) ( not ( = ?auto_19760 ?auto_19775 ) ) ( not ( = ?auto_19761 ?auto_19770 ) ) ( not ( = ?auto_19761 ?auto_19775 ) ) ( not ( = ?auto_19762 ?auto_19770 ) ) ( not ( = ?auto_19762 ?auto_19775 ) ) ( not ( = ?auto_19763 ?auto_19770 ) ) ( not ( = ?auto_19763 ?auto_19775 ) ) ( not ( = ?auto_19764 ?auto_19770 ) ) ( not ( = ?auto_19764 ?auto_19775 ) ) ( not ( = ?auto_19767 ?auto_19770 ) ) ( not ( = ?auto_19767 ?auto_19775 ) ) ( not ( = ?auto_19766 ?auto_19770 ) ) ( not ( = ?auto_19766 ?auto_19775 ) ) ( not ( = ?auto_19765 ?auto_19770 ) ) ( not ( = ?auto_19765 ?auto_19775 ) ) ( not ( = ?auto_19768 ?auto_19770 ) ) ( not ( = ?auto_19768 ?auto_19775 ) ) ( not ( = ?auto_19770 ?auto_19787 ) ) ( not ( = ?auto_19770 ?auto_19786 ) ) ( not ( = ?auto_19770 ?auto_19796 ) ) ( not ( = ?auto_19770 ?auto_19792 ) ) ( not ( = ?auto_19770 ?auto_19781 ) ) ( not ( = ?auto_19770 ?auto_19779 ) ) ( not ( = ?auto_19770 ?auto_19795 ) ) ( not ( = ?auto_19770 ?auto_19783 ) ) ( not ( = ?auto_19770 ?auto_19784 ) ) ( not ( = ?auto_19770 ?auto_19797 ) ) ( not ( = ?auto_19770 ?auto_19791 ) ) ( not ( = ?auto_19775 ?auto_19787 ) ) ( not ( = ?auto_19775 ?auto_19786 ) ) ( not ( = ?auto_19775 ?auto_19796 ) ) ( not ( = ?auto_19775 ?auto_19792 ) ) ( not ( = ?auto_19775 ?auto_19781 ) ) ( not ( = ?auto_19775 ?auto_19779 ) ) ( not ( = ?auto_19775 ?auto_19795 ) ) ( not ( = ?auto_19775 ?auto_19783 ) ) ( not ( = ?auto_19775 ?auto_19784 ) ) ( not ( = ?auto_19775 ?auto_19797 ) ) ( not ( = ?auto_19775 ?auto_19791 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_19758 ?auto_19759 ?auto_19760 ?auto_19761 ?auto_19762 ?auto_19763 ?auto_19764 ?auto_19767 ?auto_19766 ?auto_19765 ?auto_19768 ?auto_19769 )
      ( MAKE-1CRATE ?auto_19769 ?auto_19770 )
      ( MAKE-12CRATE-VERIFY ?auto_19758 ?auto_19759 ?auto_19760 ?auto_19761 ?auto_19762 ?auto_19763 ?auto_19764 ?auto_19767 ?auto_19766 ?auto_19765 ?auto_19768 ?auto_19769 ?auto_19770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19800 - SURFACE
      ?auto_19801 - SURFACE
    )
    :vars
    (
      ?auto_19802 - HOIST
      ?auto_19803 - PLACE
      ?auto_19805 - PLACE
      ?auto_19806 - HOIST
      ?auto_19807 - SURFACE
      ?auto_19804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19802 ?auto_19803 ) ( SURFACE-AT ?auto_19800 ?auto_19803 ) ( CLEAR ?auto_19800 ) ( IS-CRATE ?auto_19801 ) ( AVAILABLE ?auto_19802 ) ( not ( = ?auto_19805 ?auto_19803 ) ) ( HOIST-AT ?auto_19806 ?auto_19805 ) ( AVAILABLE ?auto_19806 ) ( SURFACE-AT ?auto_19801 ?auto_19805 ) ( ON ?auto_19801 ?auto_19807 ) ( CLEAR ?auto_19801 ) ( TRUCK-AT ?auto_19804 ?auto_19803 ) ( not ( = ?auto_19800 ?auto_19801 ) ) ( not ( = ?auto_19800 ?auto_19807 ) ) ( not ( = ?auto_19801 ?auto_19807 ) ) ( not ( = ?auto_19802 ?auto_19806 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19804 ?auto_19803 ?auto_19805 )
      ( !LIFT ?auto_19806 ?auto_19801 ?auto_19807 ?auto_19805 )
      ( !LOAD ?auto_19806 ?auto_19801 ?auto_19804 ?auto_19805 )
      ( !DRIVE ?auto_19804 ?auto_19805 ?auto_19803 )
      ( !UNLOAD ?auto_19802 ?auto_19801 ?auto_19804 ?auto_19803 )
      ( !DROP ?auto_19802 ?auto_19801 ?auto_19800 ?auto_19803 )
      ( MAKE-1CRATE-VERIFY ?auto_19800 ?auto_19801 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_19822 - SURFACE
      ?auto_19823 - SURFACE
      ?auto_19824 - SURFACE
      ?auto_19825 - SURFACE
      ?auto_19826 - SURFACE
      ?auto_19827 - SURFACE
      ?auto_19828 - SURFACE
      ?auto_19831 - SURFACE
      ?auto_19830 - SURFACE
      ?auto_19829 - SURFACE
      ?auto_19832 - SURFACE
      ?auto_19833 - SURFACE
      ?auto_19834 - SURFACE
      ?auto_19835 - SURFACE
    )
    :vars
    (
      ?auto_19839 - HOIST
      ?auto_19837 - PLACE
      ?auto_19840 - PLACE
      ?auto_19838 - HOIST
      ?auto_19836 - SURFACE
      ?auto_19843 - SURFACE
      ?auto_19844 - PLACE
      ?auto_19860 - HOIST
      ?auto_19863 - SURFACE
      ?auto_19850 - PLACE
      ?auto_19853 - HOIST
      ?auto_19854 - SURFACE
      ?auto_19851 - PLACE
      ?auto_19846 - HOIST
      ?auto_19849 - SURFACE
      ?auto_19859 - SURFACE
      ?auto_19855 - SURFACE
      ?auto_19862 - PLACE
      ?auto_19856 - HOIST
      ?auto_19852 - SURFACE
      ?auto_19858 - PLACE
      ?auto_19847 - HOIST
      ?auto_19842 - SURFACE
      ?auto_19861 - SURFACE
      ?auto_19845 - SURFACE
      ?auto_19857 - SURFACE
      ?auto_19848 - SURFACE
      ?auto_19841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19839 ?auto_19837 ) ( IS-CRATE ?auto_19835 ) ( not ( = ?auto_19840 ?auto_19837 ) ) ( HOIST-AT ?auto_19838 ?auto_19840 ) ( SURFACE-AT ?auto_19835 ?auto_19840 ) ( ON ?auto_19835 ?auto_19836 ) ( CLEAR ?auto_19835 ) ( not ( = ?auto_19834 ?auto_19835 ) ) ( not ( = ?auto_19834 ?auto_19836 ) ) ( not ( = ?auto_19835 ?auto_19836 ) ) ( not ( = ?auto_19839 ?auto_19838 ) ) ( IS-CRATE ?auto_19834 ) ( SURFACE-AT ?auto_19834 ?auto_19840 ) ( ON ?auto_19834 ?auto_19843 ) ( CLEAR ?auto_19834 ) ( not ( = ?auto_19833 ?auto_19834 ) ) ( not ( = ?auto_19833 ?auto_19843 ) ) ( not ( = ?auto_19834 ?auto_19843 ) ) ( IS-CRATE ?auto_19833 ) ( not ( = ?auto_19844 ?auto_19837 ) ) ( HOIST-AT ?auto_19860 ?auto_19844 ) ( SURFACE-AT ?auto_19833 ?auto_19844 ) ( ON ?auto_19833 ?auto_19863 ) ( CLEAR ?auto_19833 ) ( not ( = ?auto_19832 ?auto_19833 ) ) ( not ( = ?auto_19832 ?auto_19863 ) ) ( not ( = ?auto_19833 ?auto_19863 ) ) ( not ( = ?auto_19839 ?auto_19860 ) ) ( IS-CRATE ?auto_19832 ) ( not ( = ?auto_19850 ?auto_19837 ) ) ( HOIST-AT ?auto_19853 ?auto_19850 ) ( SURFACE-AT ?auto_19832 ?auto_19850 ) ( ON ?auto_19832 ?auto_19854 ) ( CLEAR ?auto_19832 ) ( not ( = ?auto_19829 ?auto_19832 ) ) ( not ( = ?auto_19829 ?auto_19854 ) ) ( not ( = ?auto_19832 ?auto_19854 ) ) ( not ( = ?auto_19839 ?auto_19853 ) ) ( IS-CRATE ?auto_19829 ) ( not ( = ?auto_19851 ?auto_19837 ) ) ( HOIST-AT ?auto_19846 ?auto_19851 ) ( AVAILABLE ?auto_19846 ) ( SURFACE-AT ?auto_19829 ?auto_19851 ) ( ON ?auto_19829 ?auto_19849 ) ( CLEAR ?auto_19829 ) ( not ( = ?auto_19830 ?auto_19829 ) ) ( not ( = ?auto_19830 ?auto_19849 ) ) ( not ( = ?auto_19829 ?auto_19849 ) ) ( not ( = ?auto_19839 ?auto_19846 ) ) ( IS-CRATE ?auto_19830 ) ( AVAILABLE ?auto_19860 ) ( SURFACE-AT ?auto_19830 ?auto_19844 ) ( ON ?auto_19830 ?auto_19859 ) ( CLEAR ?auto_19830 ) ( not ( = ?auto_19831 ?auto_19830 ) ) ( not ( = ?auto_19831 ?auto_19859 ) ) ( not ( = ?auto_19830 ?auto_19859 ) ) ( IS-CRATE ?auto_19831 ) ( SURFACE-AT ?auto_19831 ?auto_19840 ) ( ON ?auto_19831 ?auto_19855 ) ( CLEAR ?auto_19831 ) ( not ( = ?auto_19828 ?auto_19831 ) ) ( not ( = ?auto_19828 ?auto_19855 ) ) ( not ( = ?auto_19831 ?auto_19855 ) ) ( IS-CRATE ?auto_19828 ) ( not ( = ?auto_19862 ?auto_19837 ) ) ( HOIST-AT ?auto_19856 ?auto_19862 ) ( SURFACE-AT ?auto_19828 ?auto_19862 ) ( ON ?auto_19828 ?auto_19852 ) ( CLEAR ?auto_19828 ) ( not ( = ?auto_19827 ?auto_19828 ) ) ( not ( = ?auto_19827 ?auto_19852 ) ) ( not ( = ?auto_19828 ?auto_19852 ) ) ( not ( = ?auto_19839 ?auto_19856 ) ) ( IS-CRATE ?auto_19827 ) ( not ( = ?auto_19858 ?auto_19837 ) ) ( HOIST-AT ?auto_19847 ?auto_19858 ) ( SURFACE-AT ?auto_19827 ?auto_19858 ) ( ON ?auto_19827 ?auto_19842 ) ( CLEAR ?auto_19827 ) ( not ( = ?auto_19826 ?auto_19827 ) ) ( not ( = ?auto_19826 ?auto_19842 ) ) ( not ( = ?auto_19827 ?auto_19842 ) ) ( not ( = ?auto_19839 ?auto_19847 ) ) ( IS-CRATE ?auto_19826 ) ( AVAILABLE ?auto_19838 ) ( SURFACE-AT ?auto_19826 ?auto_19840 ) ( ON ?auto_19826 ?auto_19861 ) ( CLEAR ?auto_19826 ) ( not ( = ?auto_19825 ?auto_19826 ) ) ( not ( = ?auto_19825 ?auto_19861 ) ) ( not ( = ?auto_19826 ?auto_19861 ) ) ( IS-CRATE ?auto_19825 ) ( AVAILABLE ?auto_19853 ) ( SURFACE-AT ?auto_19825 ?auto_19850 ) ( ON ?auto_19825 ?auto_19845 ) ( CLEAR ?auto_19825 ) ( not ( = ?auto_19824 ?auto_19825 ) ) ( not ( = ?auto_19824 ?auto_19845 ) ) ( not ( = ?auto_19825 ?auto_19845 ) ) ( IS-CRATE ?auto_19824 ) ( AVAILABLE ?auto_19856 ) ( SURFACE-AT ?auto_19824 ?auto_19862 ) ( ON ?auto_19824 ?auto_19857 ) ( CLEAR ?auto_19824 ) ( not ( = ?auto_19823 ?auto_19824 ) ) ( not ( = ?auto_19823 ?auto_19857 ) ) ( not ( = ?auto_19824 ?auto_19857 ) ) ( SURFACE-AT ?auto_19822 ?auto_19837 ) ( CLEAR ?auto_19822 ) ( IS-CRATE ?auto_19823 ) ( AVAILABLE ?auto_19839 ) ( AVAILABLE ?auto_19847 ) ( SURFACE-AT ?auto_19823 ?auto_19858 ) ( ON ?auto_19823 ?auto_19848 ) ( CLEAR ?auto_19823 ) ( TRUCK-AT ?auto_19841 ?auto_19837 ) ( not ( = ?auto_19822 ?auto_19823 ) ) ( not ( = ?auto_19822 ?auto_19848 ) ) ( not ( = ?auto_19823 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19824 ) ) ( not ( = ?auto_19822 ?auto_19857 ) ) ( not ( = ?auto_19824 ?auto_19848 ) ) ( not ( = ?auto_19862 ?auto_19858 ) ) ( not ( = ?auto_19856 ?auto_19847 ) ) ( not ( = ?auto_19857 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19825 ) ) ( not ( = ?auto_19822 ?auto_19845 ) ) ( not ( = ?auto_19823 ?auto_19825 ) ) ( not ( = ?auto_19823 ?auto_19845 ) ) ( not ( = ?auto_19825 ?auto_19857 ) ) ( not ( = ?auto_19825 ?auto_19848 ) ) ( not ( = ?auto_19850 ?auto_19862 ) ) ( not ( = ?auto_19850 ?auto_19858 ) ) ( not ( = ?auto_19853 ?auto_19856 ) ) ( not ( = ?auto_19853 ?auto_19847 ) ) ( not ( = ?auto_19845 ?auto_19857 ) ) ( not ( = ?auto_19845 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19826 ) ) ( not ( = ?auto_19822 ?auto_19861 ) ) ( not ( = ?auto_19823 ?auto_19826 ) ) ( not ( = ?auto_19823 ?auto_19861 ) ) ( not ( = ?auto_19824 ?auto_19826 ) ) ( not ( = ?auto_19824 ?auto_19861 ) ) ( not ( = ?auto_19826 ?auto_19845 ) ) ( not ( = ?auto_19826 ?auto_19857 ) ) ( not ( = ?auto_19826 ?auto_19848 ) ) ( not ( = ?auto_19840 ?auto_19850 ) ) ( not ( = ?auto_19840 ?auto_19862 ) ) ( not ( = ?auto_19840 ?auto_19858 ) ) ( not ( = ?auto_19838 ?auto_19853 ) ) ( not ( = ?auto_19838 ?auto_19856 ) ) ( not ( = ?auto_19838 ?auto_19847 ) ) ( not ( = ?auto_19861 ?auto_19845 ) ) ( not ( = ?auto_19861 ?auto_19857 ) ) ( not ( = ?auto_19861 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19827 ) ) ( not ( = ?auto_19822 ?auto_19842 ) ) ( not ( = ?auto_19823 ?auto_19827 ) ) ( not ( = ?auto_19823 ?auto_19842 ) ) ( not ( = ?auto_19824 ?auto_19827 ) ) ( not ( = ?auto_19824 ?auto_19842 ) ) ( not ( = ?auto_19825 ?auto_19827 ) ) ( not ( = ?auto_19825 ?auto_19842 ) ) ( not ( = ?auto_19827 ?auto_19861 ) ) ( not ( = ?auto_19827 ?auto_19845 ) ) ( not ( = ?auto_19827 ?auto_19857 ) ) ( not ( = ?auto_19827 ?auto_19848 ) ) ( not ( = ?auto_19842 ?auto_19861 ) ) ( not ( = ?auto_19842 ?auto_19845 ) ) ( not ( = ?auto_19842 ?auto_19857 ) ) ( not ( = ?auto_19842 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19828 ) ) ( not ( = ?auto_19822 ?auto_19852 ) ) ( not ( = ?auto_19823 ?auto_19828 ) ) ( not ( = ?auto_19823 ?auto_19852 ) ) ( not ( = ?auto_19824 ?auto_19828 ) ) ( not ( = ?auto_19824 ?auto_19852 ) ) ( not ( = ?auto_19825 ?auto_19828 ) ) ( not ( = ?auto_19825 ?auto_19852 ) ) ( not ( = ?auto_19826 ?auto_19828 ) ) ( not ( = ?auto_19826 ?auto_19852 ) ) ( not ( = ?auto_19828 ?auto_19842 ) ) ( not ( = ?auto_19828 ?auto_19861 ) ) ( not ( = ?auto_19828 ?auto_19845 ) ) ( not ( = ?auto_19828 ?auto_19857 ) ) ( not ( = ?auto_19828 ?auto_19848 ) ) ( not ( = ?auto_19852 ?auto_19842 ) ) ( not ( = ?auto_19852 ?auto_19861 ) ) ( not ( = ?auto_19852 ?auto_19845 ) ) ( not ( = ?auto_19852 ?auto_19857 ) ) ( not ( = ?auto_19852 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19831 ) ) ( not ( = ?auto_19822 ?auto_19855 ) ) ( not ( = ?auto_19823 ?auto_19831 ) ) ( not ( = ?auto_19823 ?auto_19855 ) ) ( not ( = ?auto_19824 ?auto_19831 ) ) ( not ( = ?auto_19824 ?auto_19855 ) ) ( not ( = ?auto_19825 ?auto_19831 ) ) ( not ( = ?auto_19825 ?auto_19855 ) ) ( not ( = ?auto_19826 ?auto_19831 ) ) ( not ( = ?auto_19826 ?auto_19855 ) ) ( not ( = ?auto_19827 ?auto_19831 ) ) ( not ( = ?auto_19827 ?auto_19855 ) ) ( not ( = ?auto_19831 ?auto_19852 ) ) ( not ( = ?auto_19831 ?auto_19842 ) ) ( not ( = ?auto_19831 ?auto_19861 ) ) ( not ( = ?auto_19831 ?auto_19845 ) ) ( not ( = ?auto_19831 ?auto_19857 ) ) ( not ( = ?auto_19831 ?auto_19848 ) ) ( not ( = ?auto_19855 ?auto_19852 ) ) ( not ( = ?auto_19855 ?auto_19842 ) ) ( not ( = ?auto_19855 ?auto_19861 ) ) ( not ( = ?auto_19855 ?auto_19845 ) ) ( not ( = ?auto_19855 ?auto_19857 ) ) ( not ( = ?auto_19855 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19830 ) ) ( not ( = ?auto_19822 ?auto_19859 ) ) ( not ( = ?auto_19823 ?auto_19830 ) ) ( not ( = ?auto_19823 ?auto_19859 ) ) ( not ( = ?auto_19824 ?auto_19830 ) ) ( not ( = ?auto_19824 ?auto_19859 ) ) ( not ( = ?auto_19825 ?auto_19830 ) ) ( not ( = ?auto_19825 ?auto_19859 ) ) ( not ( = ?auto_19826 ?auto_19830 ) ) ( not ( = ?auto_19826 ?auto_19859 ) ) ( not ( = ?auto_19827 ?auto_19830 ) ) ( not ( = ?auto_19827 ?auto_19859 ) ) ( not ( = ?auto_19828 ?auto_19830 ) ) ( not ( = ?auto_19828 ?auto_19859 ) ) ( not ( = ?auto_19830 ?auto_19855 ) ) ( not ( = ?auto_19830 ?auto_19852 ) ) ( not ( = ?auto_19830 ?auto_19842 ) ) ( not ( = ?auto_19830 ?auto_19861 ) ) ( not ( = ?auto_19830 ?auto_19845 ) ) ( not ( = ?auto_19830 ?auto_19857 ) ) ( not ( = ?auto_19830 ?auto_19848 ) ) ( not ( = ?auto_19844 ?auto_19840 ) ) ( not ( = ?auto_19844 ?auto_19862 ) ) ( not ( = ?auto_19844 ?auto_19858 ) ) ( not ( = ?auto_19844 ?auto_19850 ) ) ( not ( = ?auto_19860 ?auto_19838 ) ) ( not ( = ?auto_19860 ?auto_19856 ) ) ( not ( = ?auto_19860 ?auto_19847 ) ) ( not ( = ?auto_19860 ?auto_19853 ) ) ( not ( = ?auto_19859 ?auto_19855 ) ) ( not ( = ?auto_19859 ?auto_19852 ) ) ( not ( = ?auto_19859 ?auto_19842 ) ) ( not ( = ?auto_19859 ?auto_19861 ) ) ( not ( = ?auto_19859 ?auto_19845 ) ) ( not ( = ?auto_19859 ?auto_19857 ) ) ( not ( = ?auto_19859 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19829 ) ) ( not ( = ?auto_19822 ?auto_19849 ) ) ( not ( = ?auto_19823 ?auto_19829 ) ) ( not ( = ?auto_19823 ?auto_19849 ) ) ( not ( = ?auto_19824 ?auto_19829 ) ) ( not ( = ?auto_19824 ?auto_19849 ) ) ( not ( = ?auto_19825 ?auto_19829 ) ) ( not ( = ?auto_19825 ?auto_19849 ) ) ( not ( = ?auto_19826 ?auto_19829 ) ) ( not ( = ?auto_19826 ?auto_19849 ) ) ( not ( = ?auto_19827 ?auto_19829 ) ) ( not ( = ?auto_19827 ?auto_19849 ) ) ( not ( = ?auto_19828 ?auto_19829 ) ) ( not ( = ?auto_19828 ?auto_19849 ) ) ( not ( = ?auto_19831 ?auto_19829 ) ) ( not ( = ?auto_19831 ?auto_19849 ) ) ( not ( = ?auto_19829 ?auto_19859 ) ) ( not ( = ?auto_19829 ?auto_19855 ) ) ( not ( = ?auto_19829 ?auto_19852 ) ) ( not ( = ?auto_19829 ?auto_19842 ) ) ( not ( = ?auto_19829 ?auto_19861 ) ) ( not ( = ?auto_19829 ?auto_19845 ) ) ( not ( = ?auto_19829 ?auto_19857 ) ) ( not ( = ?auto_19829 ?auto_19848 ) ) ( not ( = ?auto_19851 ?auto_19844 ) ) ( not ( = ?auto_19851 ?auto_19840 ) ) ( not ( = ?auto_19851 ?auto_19862 ) ) ( not ( = ?auto_19851 ?auto_19858 ) ) ( not ( = ?auto_19851 ?auto_19850 ) ) ( not ( = ?auto_19846 ?auto_19860 ) ) ( not ( = ?auto_19846 ?auto_19838 ) ) ( not ( = ?auto_19846 ?auto_19856 ) ) ( not ( = ?auto_19846 ?auto_19847 ) ) ( not ( = ?auto_19846 ?auto_19853 ) ) ( not ( = ?auto_19849 ?auto_19859 ) ) ( not ( = ?auto_19849 ?auto_19855 ) ) ( not ( = ?auto_19849 ?auto_19852 ) ) ( not ( = ?auto_19849 ?auto_19842 ) ) ( not ( = ?auto_19849 ?auto_19861 ) ) ( not ( = ?auto_19849 ?auto_19845 ) ) ( not ( = ?auto_19849 ?auto_19857 ) ) ( not ( = ?auto_19849 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19832 ) ) ( not ( = ?auto_19822 ?auto_19854 ) ) ( not ( = ?auto_19823 ?auto_19832 ) ) ( not ( = ?auto_19823 ?auto_19854 ) ) ( not ( = ?auto_19824 ?auto_19832 ) ) ( not ( = ?auto_19824 ?auto_19854 ) ) ( not ( = ?auto_19825 ?auto_19832 ) ) ( not ( = ?auto_19825 ?auto_19854 ) ) ( not ( = ?auto_19826 ?auto_19832 ) ) ( not ( = ?auto_19826 ?auto_19854 ) ) ( not ( = ?auto_19827 ?auto_19832 ) ) ( not ( = ?auto_19827 ?auto_19854 ) ) ( not ( = ?auto_19828 ?auto_19832 ) ) ( not ( = ?auto_19828 ?auto_19854 ) ) ( not ( = ?auto_19831 ?auto_19832 ) ) ( not ( = ?auto_19831 ?auto_19854 ) ) ( not ( = ?auto_19830 ?auto_19832 ) ) ( not ( = ?auto_19830 ?auto_19854 ) ) ( not ( = ?auto_19832 ?auto_19849 ) ) ( not ( = ?auto_19832 ?auto_19859 ) ) ( not ( = ?auto_19832 ?auto_19855 ) ) ( not ( = ?auto_19832 ?auto_19852 ) ) ( not ( = ?auto_19832 ?auto_19842 ) ) ( not ( = ?auto_19832 ?auto_19861 ) ) ( not ( = ?auto_19832 ?auto_19845 ) ) ( not ( = ?auto_19832 ?auto_19857 ) ) ( not ( = ?auto_19832 ?auto_19848 ) ) ( not ( = ?auto_19854 ?auto_19849 ) ) ( not ( = ?auto_19854 ?auto_19859 ) ) ( not ( = ?auto_19854 ?auto_19855 ) ) ( not ( = ?auto_19854 ?auto_19852 ) ) ( not ( = ?auto_19854 ?auto_19842 ) ) ( not ( = ?auto_19854 ?auto_19861 ) ) ( not ( = ?auto_19854 ?auto_19845 ) ) ( not ( = ?auto_19854 ?auto_19857 ) ) ( not ( = ?auto_19854 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19833 ) ) ( not ( = ?auto_19822 ?auto_19863 ) ) ( not ( = ?auto_19823 ?auto_19833 ) ) ( not ( = ?auto_19823 ?auto_19863 ) ) ( not ( = ?auto_19824 ?auto_19833 ) ) ( not ( = ?auto_19824 ?auto_19863 ) ) ( not ( = ?auto_19825 ?auto_19833 ) ) ( not ( = ?auto_19825 ?auto_19863 ) ) ( not ( = ?auto_19826 ?auto_19833 ) ) ( not ( = ?auto_19826 ?auto_19863 ) ) ( not ( = ?auto_19827 ?auto_19833 ) ) ( not ( = ?auto_19827 ?auto_19863 ) ) ( not ( = ?auto_19828 ?auto_19833 ) ) ( not ( = ?auto_19828 ?auto_19863 ) ) ( not ( = ?auto_19831 ?auto_19833 ) ) ( not ( = ?auto_19831 ?auto_19863 ) ) ( not ( = ?auto_19830 ?auto_19833 ) ) ( not ( = ?auto_19830 ?auto_19863 ) ) ( not ( = ?auto_19829 ?auto_19833 ) ) ( not ( = ?auto_19829 ?auto_19863 ) ) ( not ( = ?auto_19833 ?auto_19854 ) ) ( not ( = ?auto_19833 ?auto_19849 ) ) ( not ( = ?auto_19833 ?auto_19859 ) ) ( not ( = ?auto_19833 ?auto_19855 ) ) ( not ( = ?auto_19833 ?auto_19852 ) ) ( not ( = ?auto_19833 ?auto_19842 ) ) ( not ( = ?auto_19833 ?auto_19861 ) ) ( not ( = ?auto_19833 ?auto_19845 ) ) ( not ( = ?auto_19833 ?auto_19857 ) ) ( not ( = ?auto_19833 ?auto_19848 ) ) ( not ( = ?auto_19863 ?auto_19854 ) ) ( not ( = ?auto_19863 ?auto_19849 ) ) ( not ( = ?auto_19863 ?auto_19859 ) ) ( not ( = ?auto_19863 ?auto_19855 ) ) ( not ( = ?auto_19863 ?auto_19852 ) ) ( not ( = ?auto_19863 ?auto_19842 ) ) ( not ( = ?auto_19863 ?auto_19861 ) ) ( not ( = ?auto_19863 ?auto_19845 ) ) ( not ( = ?auto_19863 ?auto_19857 ) ) ( not ( = ?auto_19863 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19834 ) ) ( not ( = ?auto_19822 ?auto_19843 ) ) ( not ( = ?auto_19823 ?auto_19834 ) ) ( not ( = ?auto_19823 ?auto_19843 ) ) ( not ( = ?auto_19824 ?auto_19834 ) ) ( not ( = ?auto_19824 ?auto_19843 ) ) ( not ( = ?auto_19825 ?auto_19834 ) ) ( not ( = ?auto_19825 ?auto_19843 ) ) ( not ( = ?auto_19826 ?auto_19834 ) ) ( not ( = ?auto_19826 ?auto_19843 ) ) ( not ( = ?auto_19827 ?auto_19834 ) ) ( not ( = ?auto_19827 ?auto_19843 ) ) ( not ( = ?auto_19828 ?auto_19834 ) ) ( not ( = ?auto_19828 ?auto_19843 ) ) ( not ( = ?auto_19831 ?auto_19834 ) ) ( not ( = ?auto_19831 ?auto_19843 ) ) ( not ( = ?auto_19830 ?auto_19834 ) ) ( not ( = ?auto_19830 ?auto_19843 ) ) ( not ( = ?auto_19829 ?auto_19834 ) ) ( not ( = ?auto_19829 ?auto_19843 ) ) ( not ( = ?auto_19832 ?auto_19834 ) ) ( not ( = ?auto_19832 ?auto_19843 ) ) ( not ( = ?auto_19834 ?auto_19863 ) ) ( not ( = ?auto_19834 ?auto_19854 ) ) ( not ( = ?auto_19834 ?auto_19849 ) ) ( not ( = ?auto_19834 ?auto_19859 ) ) ( not ( = ?auto_19834 ?auto_19855 ) ) ( not ( = ?auto_19834 ?auto_19852 ) ) ( not ( = ?auto_19834 ?auto_19842 ) ) ( not ( = ?auto_19834 ?auto_19861 ) ) ( not ( = ?auto_19834 ?auto_19845 ) ) ( not ( = ?auto_19834 ?auto_19857 ) ) ( not ( = ?auto_19834 ?auto_19848 ) ) ( not ( = ?auto_19843 ?auto_19863 ) ) ( not ( = ?auto_19843 ?auto_19854 ) ) ( not ( = ?auto_19843 ?auto_19849 ) ) ( not ( = ?auto_19843 ?auto_19859 ) ) ( not ( = ?auto_19843 ?auto_19855 ) ) ( not ( = ?auto_19843 ?auto_19852 ) ) ( not ( = ?auto_19843 ?auto_19842 ) ) ( not ( = ?auto_19843 ?auto_19861 ) ) ( not ( = ?auto_19843 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19857 ) ) ( not ( = ?auto_19843 ?auto_19848 ) ) ( not ( = ?auto_19822 ?auto_19835 ) ) ( not ( = ?auto_19822 ?auto_19836 ) ) ( not ( = ?auto_19823 ?auto_19835 ) ) ( not ( = ?auto_19823 ?auto_19836 ) ) ( not ( = ?auto_19824 ?auto_19835 ) ) ( not ( = ?auto_19824 ?auto_19836 ) ) ( not ( = ?auto_19825 ?auto_19835 ) ) ( not ( = ?auto_19825 ?auto_19836 ) ) ( not ( = ?auto_19826 ?auto_19835 ) ) ( not ( = ?auto_19826 ?auto_19836 ) ) ( not ( = ?auto_19827 ?auto_19835 ) ) ( not ( = ?auto_19827 ?auto_19836 ) ) ( not ( = ?auto_19828 ?auto_19835 ) ) ( not ( = ?auto_19828 ?auto_19836 ) ) ( not ( = ?auto_19831 ?auto_19835 ) ) ( not ( = ?auto_19831 ?auto_19836 ) ) ( not ( = ?auto_19830 ?auto_19835 ) ) ( not ( = ?auto_19830 ?auto_19836 ) ) ( not ( = ?auto_19829 ?auto_19835 ) ) ( not ( = ?auto_19829 ?auto_19836 ) ) ( not ( = ?auto_19832 ?auto_19835 ) ) ( not ( = ?auto_19832 ?auto_19836 ) ) ( not ( = ?auto_19833 ?auto_19835 ) ) ( not ( = ?auto_19833 ?auto_19836 ) ) ( not ( = ?auto_19835 ?auto_19843 ) ) ( not ( = ?auto_19835 ?auto_19863 ) ) ( not ( = ?auto_19835 ?auto_19854 ) ) ( not ( = ?auto_19835 ?auto_19849 ) ) ( not ( = ?auto_19835 ?auto_19859 ) ) ( not ( = ?auto_19835 ?auto_19855 ) ) ( not ( = ?auto_19835 ?auto_19852 ) ) ( not ( = ?auto_19835 ?auto_19842 ) ) ( not ( = ?auto_19835 ?auto_19861 ) ) ( not ( = ?auto_19835 ?auto_19845 ) ) ( not ( = ?auto_19835 ?auto_19857 ) ) ( not ( = ?auto_19835 ?auto_19848 ) ) ( not ( = ?auto_19836 ?auto_19843 ) ) ( not ( = ?auto_19836 ?auto_19863 ) ) ( not ( = ?auto_19836 ?auto_19854 ) ) ( not ( = ?auto_19836 ?auto_19849 ) ) ( not ( = ?auto_19836 ?auto_19859 ) ) ( not ( = ?auto_19836 ?auto_19855 ) ) ( not ( = ?auto_19836 ?auto_19852 ) ) ( not ( = ?auto_19836 ?auto_19842 ) ) ( not ( = ?auto_19836 ?auto_19861 ) ) ( not ( = ?auto_19836 ?auto_19845 ) ) ( not ( = ?auto_19836 ?auto_19857 ) ) ( not ( = ?auto_19836 ?auto_19848 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19822 ?auto_19823 ?auto_19824 ?auto_19825 ?auto_19826 ?auto_19827 ?auto_19828 ?auto_19831 ?auto_19830 ?auto_19829 ?auto_19832 ?auto_19833 ?auto_19834 )
      ( MAKE-1CRATE ?auto_19834 ?auto_19835 )
      ( MAKE-13CRATE-VERIFY ?auto_19822 ?auto_19823 ?auto_19824 ?auto_19825 ?auto_19826 ?auto_19827 ?auto_19828 ?auto_19831 ?auto_19830 ?auto_19829 ?auto_19832 ?auto_19833 ?auto_19834 ?auto_19835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19866 - SURFACE
      ?auto_19867 - SURFACE
    )
    :vars
    (
      ?auto_19868 - HOIST
      ?auto_19869 - PLACE
      ?auto_19871 - PLACE
      ?auto_19872 - HOIST
      ?auto_19873 - SURFACE
      ?auto_19870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19868 ?auto_19869 ) ( SURFACE-AT ?auto_19866 ?auto_19869 ) ( CLEAR ?auto_19866 ) ( IS-CRATE ?auto_19867 ) ( AVAILABLE ?auto_19868 ) ( not ( = ?auto_19871 ?auto_19869 ) ) ( HOIST-AT ?auto_19872 ?auto_19871 ) ( AVAILABLE ?auto_19872 ) ( SURFACE-AT ?auto_19867 ?auto_19871 ) ( ON ?auto_19867 ?auto_19873 ) ( CLEAR ?auto_19867 ) ( TRUCK-AT ?auto_19870 ?auto_19869 ) ( not ( = ?auto_19866 ?auto_19867 ) ) ( not ( = ?auto_19866 ?auto_19873 ) ) ( not ( = ?auto_19867 ?auto_19873 ) ) ( not ( = ?auto_19868 ?auto_19872 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19870 ?auto_19869 ?auto_19871 )
      ( !LIFT ?auto_19872 ?auto_19867 ?auto_19873 ?auto_19871 )
      ( !LOAD ?auto_19872 ?auto_19867 ?auto_19870 ?auto_19871 )
      ( !DRIVE ?auto_19870 ?auto_19871 ?auto_19869 )
      ( !UNLOAD ?auto_19868 ?auto_19867 ?auto_19870 ?auto_19869 )
      ( !DROP ?auto_19868 ?auto_19867 ?auto_19866 ?auto_19869 )
      ( MAKE-1CRATE-VERIFY ?auto_19866 ?auto_19867 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_19889 - SURFACE
      ?auto_19890 - SURFACE
      ?auto_19891 - SURFACE
      ?auto_19892 - SURFACE
      ?auto_19893 - SURFACE
      ?auto_19894 - SURFACE
      ?auto_19895 - SURFACE
      ?auto_19898 - SURFACE
      ?auto_19897 - SURFACE
      ?auto_19896 - SURFACE
      ?auto_19899 - SURFACE
      ?auto_19900 - SURFACE
      ?auto_19901 - SURFACE
      ?auto_19902 - SURFACE
      ?auto_19903 - SURFACE
    )
    :vars
    (
      ?auto_19905 - HOIST
      ?auto_19908 - PLACE
      ?auto_19909 - PLACE
      ?auto_19907 - HOIST
      ?auto_19904 - SURFACE
      ?auto_19918 - PLACE
      ?auto_19924 - HOIST
      ?auto_19926 - SURFACE
      ?auto_19920 - SURFACE
      ?auto_19910 - PLACE
      ?auto_19915 - HOIST
      ?auto_19928 - SURFACE
      ?auto_19913 - PLACE
      ?auto_19911 - HOIST
      ?auto_19931 - SURFACE
      ?auto_19922 - SURFACE
      ?auto_19919 - SURFACE
      ?auto_19912 - SURFACE
      ?auto_19914 - PLACE
      ?auto_19916 - HOIST
      ?auto_19932 - SURFACE
      ?auto_19929 - PLACE
      ?auto_19917 - HOIST
      ?auto_19925 - SURFACE
      ?auto_19923 - SURFACE
      ?auto_19921 - SURFACE
      ?auto_19930 - SURFACE
      ?auto_19927 - SURFACE
      ?auto_19906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19905 ?auto_19908 ) ( IS-CRATE ?auto_19903 ) ( not ( = ?auto_19909 ?auto_19908 ) ) ( HOIST-AT ?auto_19907 ?auto_19909 ) ( SURFACE-AT ?auto_19903 ?auto_19909 ) ( ON ?auto_19903 ?auto_19904 ) ( CLEAR ?auto_19903 ) ( not ( = ?auto_19902 ?auto_19903 ) ) ( not ( = ?auto_19902 ?auto_19904 ) ) ( not ( = ?auto_19903 ?auto_19904 ) ) ( not ( = ?auto_19905 ?auto_19907 ) ) ( IS-CRATE ?auto_19902 ) ( not ( = ?auto_19918 ?auto_19908 ) ) ( HOIST-AT ?auto_19924 ?auto_19918 ) ( SURFACE-AT ?auto_19902 ?auto_19918 ) ( ON ?auto_19902 ?auto_19926 ) ( CLEAR ?auto_19902 ) ( not ( = ?auto_19901 ?auto_19902 ) ) ( not ( = ?auto_19901 ?auto_19926 ) ) ( not ( = ?auto_19902 ?auto_19926 ) ) ( not ( = ?auto_19905 ?auto_19924 ) ) ( IS-CRATE ?auto_19901 ) ( SURFACE-AT ?auto_19901 ?auto_19918 ) ( ON ?auto_19901 ?auto_19920 ) ( CLEAR ?auto_19901 ) ( not ( = ?auto_19900 ?auto_19901 ) ) ( not ( = ?auto_19900 ?auto_19920 ) ) ( not ( = ?auto_19901 ?auto_19920 ) ) ( IS-CRATE ?auto_19900 ) ( not ( = ?auto_19910 ?auto_19908 ) ) ( HOIST-AT ?auto_19915 ?auto_19910 ) ( SURFACE-AT ?auto_19900 ?auto_19910 ) ( ON ?auto_19900 ?auto_19928 ) ( CLEAR ?auto_19900 ) ( not ( = ?auto_19899 ?auto_19900 ) ) ( not ( = ?auto_19899 ?auto_19928 ) ) ( not ( = ?auto_19900 ?auto_19928 ) ) ( not ( = ?auto_19905 ?auto_19915 ) ) ( IS-CRATE ?auto_19899 ) ( not ( = ?auto_19913 ?auto_19908 ) ) ( HOIST-AT ?auto_19911 ?auto_19913 ) ( SURFACE-AT ?auto_19899 ?auto_19913 ) ( ON ?auto_19899 ?auto_19931 ) ( CLEAR ?auto_19899 ) ( not ( = ?auto_19896 ?auto_19899 ) ) ( not ( = ?auto_19896 ?auto_19931 ) ) ( not ( = ?auto_19899 ?auto_19931 ) ) ( not ( = ?auto_19905 ?auto_19911 ) ) ( IS-CRATE ?auto_19896 ) ( AVAILABLE ?auto_19907 ) ( SURFACE-AT ?auto_19896 ?auto_19909 ) ( ON ?auto_19896 ?auto_19922 ) ( CLEAR ?auto_19896 ) ( not ( = ?auto_19897 ?auto_19896 ) ) ( not ( = ?auto_19897 ?auto_19922 ) ) ( not ( = ?auto_19896 ?auto_19922 ) ) ( IS-CRATE ?auto_19897 ) ( AVAILABLE ?auto_19915 ) ( SURFACE-AT ?auto_19897 ?auto_19910 ) ( ON ?auto_19897 ?auto_19919 ) ( CLEAR ?auto_19897 ) ( not ( = ?auto_19898 ?auto_19897 ) ) ( not ( = ?auto_19898 ?auto_19919 ) ) ( not ( = ?auto_19897 ?auto_19919 ) ) ( IS-CRATE ?auto_19898 ) ( SURFACE-AT ?auto_19898 ?auto_19918 ) ( ON ?auto_19898 ?auto_19912 ) ( CLEAR ?auto_19898 ) ( not ( = ?auto_19895 ?auto_19898 ) ) ( not ( = ?auto_19895 ?auto_19912 ) ) ( not ( = ?auto_19898 ?auto_19912 ) ) ( IS-CRATE ?auto_19895 ) ( not ( = ?auto_19914 ?auto_19908 ) ) ( HOIST-AT ?auto_19916 ?auto_19914 ) ( SURFACE-AT ?auto_19895 ?auto_19914 ) ( ON ?auto_19895 ?auto_19932 ) ( CLEAR ?auto_19895 ) ( not ( = ?auto_19894 ?auto_19895 ) ) ( not ( = ?auto_19894 ?auto_19932 ) ) ( not ( = ?auto_19895 ?auto_19932 ) ) ( not ( = ?auto_19905 ?auto_19916 ) ) ( IS-CRATE ?auto_19894 ) ( not ( = ?auto_19929 ?auto_19908 ) ) ( HOIST-AT ?auto_19917 ?auto_19929 ) ( SURFACE-AT ?auto_19894 ?auto_19929 ) ( ON ?auto_19894 ?auto_19925 ) ( CLEAR ?auto_19894 ) ( not ( = ?auto_19893 ?auto_19894 ) ) ( not ( = ?auto_19893 ?auto_19925 ) ) ( not ( = ?auto_19894 ?auto_19925 ) ) ( not ( = ?auto_19905 ?auto_19917 ) ) ( IS-CRATE ?auto_19893 ) ( AVAILABLE ?auto_19924 ) ( SURFACE-AT ?auto_19893 ?auto_19918 ) ( ON ?auto_19893 ?auto_19923 ) ( CLEAR ?auto_19893 ) ( not ( = ?auto_19892 ?auto_19893 ) ) ( not ( = ?auto_19892 ?auto_19923 ) ) ( not ( = ?auto_19893 ?auto_19923 ) ) ( IS-CRATE ?auto_19892 ) ( AVAILABLE ?auto_19911 ) ( SURFACE-AT ?auto_19892 ?auto_19913 ) ( ON ?auto_19892 ?auto_19921 ) ( CLEAR ?auto_19892 ) ( not ( = ?auto_19891 ?auto_19892 ) ) ( not ( = ?auto_19891 ?auto_19921 ) ) ( not ( = ?auto_19892 ?auto_19921 ) ) ( IS-CRATE ?auto_19891 ) ( AVAILABLE ?auto_19916 ) ( SURFACE-AT ?auto_19891 ?auto_19914 ) ( ON ?auto_19891 ?auto_19930 ) ( CLEAR ?auto_19891 ) ( not ( = ?auto_19890 ?auto_19891 ) ) ( not ( = ?auto_19890 ?auto_19930 ) ) ( not ( = ?auto_19891 ?auto_19930 ) ) ( SURFACE-AT ?auto_19889 ?auto_19908 ) ( CLEAR ?auto_19889 ) ( IS-CRATE ?auto_19890 ) ( AVAILABLE ?auto_19905 ) ( AVAILABLE ?auto_19917 ) ( SURFACE-AT ?auto_19890 ?auto_19929 ) ( ON ?auto_19890 ?auto_19927 ) ( CLEAR ?auto_19890 ) ( TRUCK-AT ?auto_19906 ?auto_19908 ) ( not ( = ?auto_19889 ?auto_19890 ) ) ( not ( = ?auto_19889 ?auto_19927 ) ) ( not ( = ?auto_19890 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19891 ) ) ( not ( = ?auto_19889 ?auto_19930 ) ) ( not ( = ?auto_19891 ?auto_19927 ) ) ( not ( = ?auto_19914 ?auto_19929 ) ) ( not ( = ?auto_19916 ?auto_19917 ) ) ( not ( = ?auto_19930 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19892 ) ) ( not ( = ?auto_19889 ?auto_19921 ) ) ( not ( = ?auto_19890 ?auto_19892 ) ) ( not ( = ?auto_19890 ?auto_19921 ) ) ( not ( = ?auto_19892 ?auto_19930 ) ) ( not ( = ?auto_19892 ?auto_19927 ) ) ( not ( = ?auto_19913 ?auto_19914 ) ) ( not ( = ?auto_19913 ?auto_19929 ) ) ( not ( = ?auto_19911 ?auto_19916 ) ) ( not ( = ?auto_19911 ?auto_19917 ) ) ( not ( = ?auto_19921 ?auto_19930 ) ) ( not ( = ?auto_19921 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19893 ) ) ( not ( = ?auto_19889 ?auto_19923 ) ) ( not ( = ?auto_19890 ?auto_19893 ) ) ( not ( = ?auto_19890 ?auto_19923 ) ) ( not ( = ?auto_19891 ?auto_19893 ) ) ( not ( = ?auto_19891 ?auto_19923 ) ) ( not ( = ?auto_19893 ?auto_19921 ) ) ( not ( = ?auto_19893 ?auto_19930 ) ) ( not ( = ?auto_19893 ?auto_19927 ) ) ( not ( = ?auto_19918 ?auto_19913 ) ) ( not ( = ?auto_19918 ?auto_19914 ) ) ( not ( = ?auto_19918 ?auto_19929 ) ) ( not ( = ?auto_19924 ?auto_19911 ) ) ( not ( = ?auto_19924 ?auto_19916 ) ) ( not ( = ?auto_19924 ?auto_19917 ) ) ( not ( = ?auto_19923 ?auto_19921 ) ) ( not ( = ?auto_19923 ?auto_19930 ) ) ( not ( = ?auto_19923 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19894 ) ) ( not ( = ?auto_19889 ?auto_19925 ) ) ( not ( = ?auto_19890 ?auto_19894 ) ) ( not ( = ?auto_19890 ?auto_19925 ) ) ( not ( = ?auto_19891 ?auto_19894 ) ) ( not ( = ?auto_19891 ?auto_19925 ) ) ( not ( = ?auto_19892 ?auto_19894 ) ) ( not ( = ?auto_19892 ?auto_19925 ) ) ( not ( = ?auto_19894 ?auto_19923 ) ) ( not ( = ?auto_19894 ?auto_19921 ) ) ( not ( = ?auto_19894 ?auto_19930 ) ) ( not ( = ?auto_19894 ?auto_19927 ) ) ( not ( = ?auto_19925 ?auto_19923 ) ) ( not ( = ?auto_19925 ?auto_19921 ) ) ( not ( = ?auto_19925 ?auto_19930 ) ) ( not ( = ?auto_19925 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19895 ) ) ( not ( = ?auto_19889 ?auto_19932 ) ) ( not ( = ?auto_19890 ?auto_19895 ) ) ( not ( = ?auto_19890 ?auto_19932 ) ) ( not ( = ?auto_19891 ?auto_19895 ) ) ( not ( = ?auto_19891 ?auto_19932 ) ) ( not ( = ?auto_19892 ?auto_19895 ) ) ( not ( = ?auto_19892 ?auto_19932 ) ) ( not ( = ?auto_19893 ?auto_19895 ) ) ( not ( = ?auto_19893 ?auto_19932 ) ) ( not ( = ?auto_19895 ?auto_19925 ) ) ( not ( = ?auto_19895 ?auto_19923 ) ) ( not ( = ?auto_19895 ?auto_19921 ) ) ( not ( = ?auto_19895 ?auto_19930 ) ) ( not ( = ?auto_19895 ?auto_19927 ) ) ( not ( = ?auto_19932 ?auto_19925 ) ) ( not ( = ?auto_19932 ?auto_19923 ) ) ( not ( = ?auto_19932 ?auto_19921 ) ) ( not ( = ?auto_19932 ?auto_19930 ) ) ( not ( = ?auto_19932 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19898 ) ) ( not ( = ?auto_19889 ?auto_19912 ) ) ( not ( = ?auto_19890 ?auto_19898 ) ) ( not ( = ?auto_19890 ?auto_19912 ) ) ( not ( = ?auto_19891 ?auto_19898 ) ) ( not ( = ?auto_19891 ?auto_19912 ) ) ( not ( = ?auto_19892 ?auto_19898 ) ) ( not ( = ?auto_19892 ?auto_19912 ) ) ( not ( = ?auto_19893 ?auto_19898 ) ) ( not ( = ?auto_19893 ?auto_19912 ) ) ( not ( = ?auto_19894 ?auto_19898 ) ) ( not ( = ?auto_19894 ?auto_19912 ) ) ( not ( = ?auto_19898 ?auto_19932 ) ) ( not ( = ?auto_19898 ?auto_19925 ) ) ( not ( = ?auto_19898 ?auto_19923 ) ) ( not ( = ?auto_19898 ?auto_19921 ) ) ( not ( = ?auto_19898 ?auto_19930 ) ) ( not ( = ?auto_19898 ?auto_19927 ) ) ( not ( = ?auto_19912 ?auto_19932 ) ) ( not ( = ?auto_19912 ?auto_19925 ) ) ( not ( = ?auto_19912 ?auto_19923 ) ) ( not ( = ?auto_19912 ?auto_19921 ) ) ( not ( = ?auto_19912 ?auto_19930 ) ) ( not ( = ?auto_19912 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19897 ) ) ( not ( = ?auto_19889 ?auto_19919 ) ) ( not ( = ?auto_19890 ?auto_19897 ) ) ( not ( = ?auto_19890 ?auto_19919 ) ) ( not ( = ?auto_19891 ?auto_19897 ) ) ( not ( = ?auto_19891 ?auto_19919 ) ) ( not ( = ?auto_19892 ?auto_19897 ) ) ( not ( = ?auto_19892 ?auto_19919 ) ) ( not ( = ?auto_19893 ?auto_19897 ) ) ( not ( = ?auto_19893 ?auto_19919 ) ) ( not ( = ?auto_19894 ?auto_19897 ) ) ( not ( = ?auto_19894 ?auto_19919 ) ) ( not ( = ?auto_19895 ?auto_19897 ) ) ( not ( = ?auto_19895 ?auto_19919 ) ) ( not ( = ?auto_19897 ?auto_19912 ) ) ( not ( = ?auto_19897 ?auto_19932 ) ) ( not ( = ?auto_19897 ?auto_19925 ) ) ( not ( = ?auto_19897 ?auto_19923 ) ) ( not ( = ?auto_19897 ?auto_19921 ) ) ( not ( = ?auto_19897 ?auto_19930 ) ) ( not ( = ?auto_19897 ?auto_19927 ) ) ( not ( = ?auto_19910 ?auto_19918 ) ) ( not ( = ?auto_19910 ?auto_19914 ) ) ( not ( = ?auto_19910 ?auto_19929 ) ) ( not ( = ?auto_19910 ?auto_19913 ) ) ( not ( = ?auto_19915 ?auto_19924 ) ) ( not ( = ?auto_19915 ?auto_19916 ) ) ( not ( = ?auto_19915 ?auto_19917 ) ) ( not ( = ?auto_19915 ?auto_19911 ) ) ( not ( = ?auto_19919 ?auto_19912 ) ) ( not ( = ?auto_19919 ?auto_19932 ) ) ( not ( = ?auto_19919 ?auto_19925 ) ) ( not ( = ?auto_19919 ?auto_19923 ) ) ( not ( = ?auto_19919 ?auto_19921 ) ) ( not ( = ?auto_19919 ?auto_19930 ) ) ( not ( = ?auto_19919 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19896 ) ) ( not ( = ?auto_19889 ?auto_19922 ) ) ( not ( = ?auto_19890 ?auto_19896 ) ) ( not ( = ?auto_19890 ?auto_19922 ) ) ( not ( = ?auto_19891 ?auto_19896 ) ) ( not ( = ?auto_19891 ?auto_19922 ) ) ( not ( = ?auto_19892 ?auto_19896 ) ) ( not ( = ?auto_19892 ?auto_19922 ) ) ( not ( = ?auto_19893 ?auto_19896 ) ) ( not ( = ?auto_19893 ?auto_19922 ) ) ( not ( = ?auto_19894 ?auto_19896 ) ) ( not ( = ?auto_19894 ?auto_19922 ) ) ( not ( = ?auto_19895 ?auto_19896 ) ) ( not ( = ?auto_19895 ?auto_19922 ) ) ( not ( = ?auto_19898 ?auto_19896 ) ) ( not ( = ?auto_19898 ?auto_19922 ) ) ( not ( = ?auto_19896 ?auto_19919 ) ) ( not ( = ?auto_19896 ?auto_19912 ) ) ( not ( = ?auto_19896 ?auto_19932 ) ) ( not ( = ?auto_19896 ?auto_19925 ) ) ( not ( = ?auto_19896 ?auto_19923 ) ) ( not ( = ?auto_19896 ?auto_19921 ) ) ( not ( = ?auto_19896 ?auto_19930 ) ) ( not ( = ?auto_19896 ?auto_19927 ) ) ( not ( = ?auto_19909 ?auto_19910 ) ) ( not ( = ?auto_19909 ?auto_19918 ) ) ( not ( = ?auto_19909 ?auto_19914 ) ) ( not ( = ?auto_19909 ?auto_19929 ) ) ( not ( = ?auto_19909 ?auto_19913 ) ) ( not ( = ?auto_19907 ?auto_19915 ) ) ( not ( = ?auto_19907 ?auto_19924 ) ) ( not ( = ?auto_19907 ?auto_19916 ) ) ( not ( = ?auto_19907 ?auto_19917 ) ) ( not ( = ?auto_19907 ?auto_19911 ) ) ( not ( = ?auto_19922 ?auto_19919 ) ) ( not ( = ?auto_19922 ?auto_19912 ) ) ( not ( = ?auto_19922 ?auto_19932 ) ) ( not ( = ?auto_19922 ?auto_19925 ) ) ( not ( = ?auto_19922 ?auto_19923 ) ) ( not ( = ?auto_19922 ?auto_19921 ) ) ( not ( = ?auto_19922 ?auto_19930 ) ) ( not ( = ?auto_19922 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19899 ) ) ( not ( = ?auto_19889 ?auto_19931 ) ) ( not ( = ?auto_19890 ?auto_19899 ) ) ( not ( = ?auto_19890 ?auto_19931 ) ) ( not ( = ?auto_19891 ?auto_19899 ) ) ( not ( = ?auto_19891 ?auto_19931 ) ) ( not ( = ?auto_19892 ?auto_19899 ) ) ( not ( = ?auto_19892 ?auto_19931 ) ) ( not ( = ?auto_19893 ?auto_19899 ) ) ( not ( = ?auto_19893 ?auto_19931 ) ) ( not ( = ?auto_19894 ?auto_19899 ) ) ( not ( = ?auto_19894 ?auto_19931 ) ) ( not ( = ?auto_19895 ?auto_19899 ) ) ( not ( = ?auto_19895 ?auto_19931 ) ) ( not ( = ?auto_19898 ?auto_19899 ) ) ( not ( = ?auto_19898 ?auto_19931 ) ) ( not ( = ?auto_19897 ?auto_19899 ) ) ( not ( = ?auto_19897 ?auto_19931 ) ) ( not ( = ?auto_19899 ?auto_19922 ) ) ( not ( = ?auto_19899 ?auto_19919 ) ) ( not ( = ?auto_19899 ?auto_19912 ) ) ( not ( = ?auto_19899 ?auto_19932 ) ) ( not ( = ?auto_19899 ?auto_19925 ) ) ( not ( = ?auto_19899 ?auto_19923 ) ) ( not ( = ?auto_19899 ?auto_19921 ) ) ( not ( = ?auto_19899 ?auto_19930 ) ) ( not ( = ?auto_19899 ?auto_19927 ) ) ( not ( = ?auto_19931 ?auto_19922 ) ) ( not ( = ?auto_19931 ?auto_19919 ) ) ( not ( = ?auto_19931 ?auto_19912 ) ) ( not ( = ?auto_19931 ?auto_19932 ) ) ( not ( = ?auto_19931 ?auto_19925 ) ) ( not ( = ?auto_19931 ?auto_19923 ) ) ( not ( = ?auto_19931 ?auto_19921 ) ) ( not ( = ?auto_19931 ?auto_19930 ) ) ( not ( = ?auto_19931 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19900 ) ) ( not ( = ?auto_19889 ?auto_19928 ) ) ( not ( = ?auto_19890 ?auto_19900 ) ) ( not ( = ?auto_19890 ?auto_19928 ) ) ( not ( = ?auto_19891 ?auto_19900 ) ) ( not ( = ?auto_19891 ?auto_19928 ) ) ( not ( = ?auto_19892 ?auto_19900 ) ) ( not ( = ?auto_19892 ?auto_19928 ) ) ( not ( = ?auto_19893 ?auto_19900 ) ) ( not ( = ?auto_19893 ?auto_19928 ) ) ( not ( = ?auto_19894 ?auto_19900 ) ) ( not ( = ?auto_19894 ?auto_19928 ) ) ( not ( = ?auto_19895 ?auto_19900 ) ) ( not ( = ?auto_19895 ?auto_19928 ) ) ( not ( = ?auto_19898 ?auto_19900 ) ) ( not ( = ?auto_19898 ?auto_19928 ) ) ( not ( = ?auto_19897 ?auto_19900 ) ) ( not ( = ?auto_19897 ?auto_19928 ) ) ( not ( = ?auto_19896 ?auto_19900 ) ) ( not ( = ?auto_19896 ?auto_19928 ) ) ( not ( = ?auto_19900 ?auto_19931 ) ) ( not ( = ?auto_19900 ?auto_19922 ) ) ( not ( = ?auto_19900 ?auto_19919 ) ) ( not ( = ?auto_19900 ?auto_19912 ) ) ( not ( = ?auto_19900 ?auto_19932 ) ) ( not ( = ?auto_19900 ?auto_19925 ) ) ( not ( = ?auto_19900 ?auto_19923 ) ) ( not ( = ?auto_19900 ?auto_19921 ) ) ( not ( = ?auto_19900 ?auto_19930 ) ) ( not ( = ?auto_19900 ?auto_19927 ) ) ( not ( = ?auto_19928 ?auto_19931 ) ) ( not ( = ?auto_19928 ?auto_19922 ) ) ( not ( = ?auto_19928 ?auto_19919 ) ) ( not ( = ?auto_19928 ?auto_19912 ) ) ( not ( = ?auto_19928 ?auto_19932 ) ) ( not ( = ?auto_19928 ?auto_19925 ) ) ( not ( = ?auto_19928 ?auto_19923 ) ) ( not ( = ?auto_19928 ?auto_19921 ) ) ( not ( = ?auto_19928 ?auto_19930 ) ) ( not ( = ?auto_19928 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19901 ) ) ( not ( = ?auto_19889 ?auto_19920 ) ) ( not ( = ?auto_19890 ?auto_19901 ) ) ( not ( = ?auto_19890 ?auto_19920 ) ) ( not ( = ?auto_19891 ?auto_19901 ) ) ( not ( = ?auto_19891 ?auto_19920 ) ) ( not ( = ?auto_19892 ?auto_19901 ) ) ( not ( = ?auto_19892 ?auto_19920 ) ) ( not ( = ?auto_19893 ?auto_19901 ) ) ( not ( = ?auto_19893 ?auto_19920 ) ) ( not ( = ?auto_19894 ?auto_19901 ) ) ( not ( = ?auto_19894 ?auto_19920 ) ) ( not ( = ?auto_19895 ?auto_19901 ) ) ( not ( = ?auto_19895 ?auto_19920 ) ) ( not ( = ?auto_19898 ?auto_19901 ) ) ( not ( = ?auto_19898 ?auto_19920 ) ) ( not ( = ?auto_19897 ?auto_19901 ) ) ( not ( = ?auto_19897 ?auto_19920 ) ) ( not ( = ?auto_19896 ?auto_19901 ) ) ( not ( = ?auto_19896 ?auto_19920 ) ) ( not ( = ?auto_19899 ?auto_19901 ) ) ( not ( = ?auto_19899 ?auto_19920 ) ) ( not ( = ?auto_19901 ?auto_19928 ) ) ( not ( = ?auto_19901 ?auto_19931 ) ) ( not ( = ?auto_19901 ?auto_19922 ) ) ( not ( = ?auto_19901 ?auto_19919 ) ) ( not ( = ?auto_19901 ?auto_19912 ) ) ( not ( = ?auto_19901 ?auto_19932 ) ) ( not ( = ?auto_19901 ?auto_19925 ) ) ( not ( = ?auto_19901 ?auto_19923 ) ) ( not ( = ?auto_19901 ?auto_19921 ) ) ( not ( = ?auto_19901 ?auto_19930 ) ) ( not ( = ?auto_19901 ?auto_19927 ) ) ( not ( = ?auto_19920 ?auto_19928 ) ) ( not ( = ?auto_19920 ?auto_19931 ) ) ( not ( = ?auto_19920 ?auto_19922 ) ) ( not ( = ?auto_19920 ?auto_19919 ) ) ( not ( = ?auto_19920 ?auto_19912 ) ) ( not ( = ?auto_19920 ?auto_19932 ) ) ( not ( = ?auto_19920 ?auto_19925 ) ) ( not ( = ?auto_19920 ?auto_19923 ) ) ( not ( = ?auto_19920 ?auto_19921 ) ) ( not ( = ?auto_19920 ?auto_19930 ) ) ( not ( = ?auto_19920 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19902 ) ) ( not ( = ?auto_19889 ?auto_19926 ) ) ( not ( = ?auto_19890 ?auto_19902 ) ) ( not ( = ?auto_19890 ?auto_19926 ) ) ( not ( = ?auto_19891 ?auto_19902 ) ) ( not ( = ?auto_19891 ?auto_19926 ) ) ( not ( = ?auto_19892 ?auto_19902 ) ) ( not ( = ?auto_19892 ?auto_19926 ) ) ( not ( = ?auto_19893 ?auto_19902 ) ) ( not ( = ?auto_19893 ?auto_19926 ) ) ( not ( = ?auto_19894 ?auto_19902 ) ) ( not ( = ?auto_19894 ?auto_19926 ) ) ( not ( = ?auto_19895 ?auto_19902 ) ) ( not ( = ?auto_19895 ?auto_19926 ) ) ( not ( = ?auto_19898 ?auto_19902 ) ) ( not ( = ?auto_19898 ?auto_19926 ) ) ( not ( = ?auto_19897 ?auto_19902 ) ) ( not ( = ?auto_19897 ?auto_19926 ) ) ( not ( = ?auto_19896 ?auto_19902 ) ) ( not ( = ?auto_19896 ?auto_19926 ) ) ( not ( = ?auto_19899 ?auto_19902 ) ) ( not ( = ?auto_19899 ?auto_19926 ) ) ( not ( = ?auto_19900 ?auto_19902 ) ) ( not ( = ?auto_19900 ?auto_19926 ) ) ( not ( = ?auto_19902 ?auto_19920 ) ) ( not ( = ?auto_19902 ?auto_19928 ) ) ( not ( = ?auto_19902 ?auto_19931 ) ) ( not ( = ?auto_19902 ?auto_19922 ) ) ( not ( = ?auto_19902 ?auto_19919 ) ) ( not ( = ?auto_19902 ?auto_19912 ) ) ( not ( = ?auto_19902 ?auto_19932 ) ) ( not ( = ?auto_19902 ?auto_19925 ) ) ( not ( = ?auto_19902 ?auto_19923 ) ) ( not ( = ?auto_19902 ?auto_19921 ) ) ( not ( = ?auto_19902 ?auto_19930 ) ) ( not ( = ?auto_19902 ?auto_19927 ) ) ( not ( = ?auto_19926 ?auto_19920 ) ) ( not ( = ?auto_19926 ?auto_19928 ) ) ( not ( = ?auto_19926 ?auto_19931 ) ) ( not ( = ?auto_19926 ?auto_19922 ) ) ( not ( = ?auto_19926 ?auto_19919 ) ) ( not ( = ?auto_19926 ?auto_19912 ) ) ( not ( = ?auto_19926 ?auto_19932 ) ) ( not ( = ?auto_19926 ?auto_19925 ) ) ( not ( = ?auto_19926 ?auto_19923 ) ) ( not ( = ?auto_19926 ?auto_19921 ) ) ( not ( = ?auto_19926 ?auto_19930 ) ) ( not ( = ?auto_19926 ?auto_19927 ) ) ( not ( = ?auto_19889 ?auto_19903 ) ) ( not ( = ?auto_19889 ?auto_19904 ) ) ( not ( = ?auto_19890 ?auto_19903 ) ) ( not ( = ?auto_19890 ?auto_19904 ) ) ( not ( = ?auto_19891 ?auto_19903 ) ) ( not ( = ?auto_19891 ?auto_19904 ) ) ( not ( = ?auto_19892 ?auto_19903 ) ) ( not ( = ?auto_19892 ?auto_19904 ) ) ( not ( = ?auto_19893 ?auto_19903 ) ) ( not ( = ?auto_19893 ?auto_19904 ) ) ( not ( = ?auto_19894 ?auto_19903 ) ) ( not ( = ?auto_19894 ?auto_19904 ) ) ( not ( = ?auto_19895 ?auto_19903 ) ) ( not ( = ?auto_19895 ?auto_19904 ) ) ( not ( = ?auto_19898 ?auto_19903 ) ) ( not ( = ?auto_19898 ?auto_19904 ) ) ( not ( = ?auto_19897 ?auto_19903 ) ) ( not ( = ?auto_19897 ?auto_19904 ) ) ( not ( = ?auto_19896 ?auto_19903 ) ) ( not ( = ?auto_19896 ?auto_19904 ) ) ( not ( = ?auto_19899 ?auto_19903 ) ) ( not ( = ?auto_19899 ?auto_19904 ) ) ( not ( = ?auto_19900 ?auto_19903 ) ) ( not ( = ?auto_19900 ?auto_19904 ) ) ( not ( = ?auto_19901 ?auto_19903 ) ) ( not ( = ?auto_19901 ?auto_19904 ) ) ( not ( = ?auto_19903 ?auto_19926 ) ) ( not ( = ?auto_19903 ?auto_19920 ) ) ( not ( = ?auto_19903 ?auto_19928 ) ) ( not ( = ?auto_19903 ?auto_19931 ) ) ( not ( = ?auto_19903 ?auto_19922 ) ) ( not ( = ?auto_19903 ?auto_19919 ) ) ( not ( = ?auto_19903 ?auto_19912 ) ) ( not ( = ?auto_19903 ?auto_19932 ) ) ( not ( = ?auto_19903 ?auto_19925 ) ) ( not ( = ?auto_19903 ?auto_19923 ) ) ( not ( = ?auto_19903 ?auto_19921 ) ) ( not ( = ?auto_19903 ?auto_19930 ) ) ( not ( = ?auto_19903 ?auto_19927 ) ) ( not ( = ?auto_19904 ?auto_19926 ) ) ( not ( = ?auto_19904 ?auto_19920 ) ) ( not ( = ?auto_19904 ?auto_19928 ) ) ( not ( = ?auto_19904 ?auto_19931 ) ) ( not ( = ?auto_19904 ?auto_19922 ) ) ( not ( = ?auto_19904 ?auto_19919 ) ) ( not ( = ?auto_19904 ?auto_19912 ) ) ( not ( = ?auto_19904 ?auto_19932 ) ) ( not ( = ?auto_19904 ?auto_19925 ) ) ( not ( = ?auto_19904 ?auto_19923 ) ) ( not ( = ?auto_19904 ?auto_19921 ) ) ( not ( = ?auto_19904 ?auto_19930 ) ) ( not ( = ?auto_19904 ?auto_19927 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19889 ?auto_19890 ?auto_19891 ?auto_19892 ?auto_19893 ?auto_19894 ?auto_19895 ?auto_19898 ?auto_19897 ?auto_19896 ?auto_19899 ?auto_19900 ?auto_19901 ?auto_19902 )
      ( MAKE-1CRATE ?auto_19902 ?auto_19903 )
      ( MAKE-14CRATE-VERIFY ?auto_19889 ?auto_19890 ?auto_19891 ?auto_19892 ?auto_19893 ?auto_19894 ?auto_19895 ?auto_19898 ?auto_19897 ?auto_19896 ?auto_19899 ?auto_19900 ?auto_19901 ?auto_19902 ?auto_19903 ) )
  )

)

