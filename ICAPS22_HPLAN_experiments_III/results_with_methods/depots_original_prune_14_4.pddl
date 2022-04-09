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
      ?auto_1511280 - SURFACE
      ?auto_1511281 - SURFACE
    )
    :vars
    (
      ?auto_1511282 - HOIST
      ?auto_1511283 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511282 ?auto_1511283 ) ( SURFACE-AT ?auto_1511280 ?auto_1511283 ) ( CLEAR ?auto_1511280 ) ( LIFTING ?auto_1511282 ?auto_1511281 ) ( IS-CRATE ?auto_1511281 ) ( not ( = ?auto_1511280 ?auto_1511281 ) ) )
    :subtasks
    ( ( !DROP ?auto_1511282 ?auto_1511281 ?auto_1511280 ?auto_1511283 )
      ( MAKE-1CRATE-VERIFY ?auto_1511280 ?auto_1511281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511284 - SURFACE
      ?auto_1511285 - SURFACE
    )
    :vars
    (
      ?auto_1511287 - HOIST
      ?auto_1511286 - PLACE
      ?auto_1511288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511287 ?auto_1511286 ) ( SURFACE-AT ?auto_1511284 ?auto_1511286 ) ( CLEAR ?auto_1511284 ) ( IS-CRATE ?auto_1511285 ) ( not ( = ?auto_1511284 ?auto_1511285 ) ) ( TRUCK-AT ?auto_1511288 ?auto_1511286 ) ( AVAILABLE ?auto_1511287 ) ( IN ?auto_1511285 ?auto_1511288 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1511287 ?auto_1511285 ?auto_1511288 ?auto_1511286 )
      ( MAKE-1CRATE ?auto_1511284 ?auto_1511285 )
      ( MAKE-1CRATE-VERIFY ?auto_1511284 ?auto_1511285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511289 - SURFACE
      ?auto_1511290 - SURFACE
    )
    :vars
    (
      ?auto_1511291 - HOIST
      ?auto_1511293 - PLACE
      ?auto_1511292 - TRUCK
      ?auto_1511294 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511291 ?auto_1511293 ) ( SURFACE-AT ?auto_1511289 ?auto_1511293 ) ( CLEAR ?auto_1511289 ) ( IS-CRATE ?auto_1511290 ) ( not ( = ?auto_1511289 ?auto_1511290 ) ) ( AVAILABLE ?auto_1511291 ) ( IN ?auto_1511290 ?auto_1511292 ) ( TRUCK-AT ?auto_1511292 ?auto_1511294 ) ( not ( = ?auto_1511294 ?auto_1511293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1511292 ?auto_1511294 ?auto_1511293 )
      ( MAKE-1CRATE ?auto_1511289 ?auto_1511290 )
      ( MAKE-1CRATE-VERIFY ?auto_1511289 ?auto_1511290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511295 - SURFACE
      ?auto_1511296 - SURFACE
    )
    :vars
    (
      ?auto_1511299 - HOIST
      ?auto_1511300 - PLACE
      ?auto_1511297 - TRUCK
      ?auto_1511298 - PLACE
      ?auto_1511301 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511299 ?auto_1511300 ) ( SURFACE-AT ?auto_1511295 ?auto_1511300 ) ( CLEAR ?auto_1511295 ) ( IS-CRATE ?auto_1511296 ) ( not ( = ?auto_1511295 ?auto_1511296 ) ) ( AVAILABLE ?auto_1511299 ) ( TRUCK-AT ?auto_1511297 ?auto_1511298 ) ( not ( = ?auto_1511298 ?auto_1511300 ) ) ( HOIST-AT ?auto_1511301 ?auto_1511298 ) ( LIFTING ?auto_1511301 ?auto_1511296 ) ( not ( = ?auto_1511299 ?auto_1511301 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1511301 ?auto_1511296 ?auto_1511297 ?auto_1511298 )
      ( MAKE-1CRATE ?auto_1511295 ?auto_1511296 )
      ( MAKE-1CRATE-VERIFY ?auto_1511295 ?auto_1511296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511302 - SURFACE
      ?auto_1511303 - SURFACE
    )
    :vars
    (
      ?auto_1511304 - HOIST
      ?auto_1511308 - PLACE
      ?auto_1511305 - TRUCK
      ?auto_1511307 - PLACE
      ?auto_1511306 - HOIST
      ?auto_1511309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511304 ?auto_1511308 ) ( SURFACE-AT ?auto_1511302 ?auto_1511308 ) ( CLEAR ?auto_1511302 ) ( IS-CRATE ?auto_1511303 ) ( not ( = ?auto_1511302 ?auto_1511303 ) ) ( AVAILABLE ?auto_1511304 ) ( TRUCK-AT ?auto_1511305 ?auto_1511307 ) ( not ( = ?auto_1511307 ?auto_1511308 ) ) ( HOIST-AT ?auto_1511306 ?auto_1511307 ) ( not ( = ?auto_1511304 ?auto_1511306 ) ) ( AVAILABLE ?auto_1511306 ) ( SURFACE-AT ?auto_1511303 ?auto_1511307 ) ( ON ?auto_1511303 ?auto_1511309 ) ( CLEAR ?auto_1511303 ) ( not ( = ?auto_1511302 ?auto_1511309 ) ) ( not ( = ?auto_1511303 ?auto_1511309 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1511306 ?auto_1511303 ?auto_1511309 ?auto_1511307 )
      ( MAKE-1CRATE ?auto_1511302 ?auto_1511303 )
      ( MAKE-1CRATE-VERIFY ?auto_1511302 ?auto_1511303 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511310 - SURFACE
      ?auto_1511311 - SURFACE
    )
    :vars
    (
      ?auto_1511316 - HOIST
      ?auto_1511317 - PLACE
      ?auto_1511314 - PLACE
      ?auto_1511315 - HOIST
      ?auto_1511312 - SURFACE
      ?auto_1511313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511316 ?auto_1511317 ) ( SURFACE-AT ?auto_1511310 ?auto_1511317 ) ( CLEAR ?auto_1511310 ) ( IS-CRATE ?auto_1511311 ) ( not ( = ?auto_1511310 ?auto_1511311 ) ) ( AVAILABLE ?auto_1511316 ) ( not ( = ?auto_1511314 ?auto_1511317 ) ) ( HOIST-AT ?auto_1511315 ?auto_1511314 ) ( not ( = ?auto_1511316 ?auto_1511315 ) ) ( AVAILABLE ?auto_1511315 ) ( SURFACE-AT ?auto_1511311 ?auto_1511314 ) ( ON ?auto_1511311 ?auto_1511312 ) ( CLEAR ?auto_1511311 ) ( not ( = ?auto_1511310 ?auto_1511312 ) ) ( not ( = ?auto_1511311 ?auto_1511312 ) ) ( TRUCK-AT ?auto_1511313 ?auto_1511317 ) )
    :subtasks
    ( ( !DRIVE ?auto_1511313 ?auto_1511317 ?auto_1511314 )
      ( MAKE-1CRATE ?auto_1511310 ?auto_1511311 )
      ( MAKE-1CRATE-VERIFY ?auto_1511310 ?auto_1511311 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511327 - SURFACE
      ?auto_1511328 - SURFACE
      ?auto_1511329 - SURFACE
    )
    :vars
    (
      ?auto_1511331 - HOIST
      ?auto_1511330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511331 ?auto_1511330 ) ( SURFACE-AT ?auto_1511328 ?auto_1511330 ) ( CLEAR ?auto_1511328 ) ( LIFTING ?auto_1511331 ?auto_1511329 ) ( IS-CRATE ?auto_1511329 ) ( not ( = ?auto_1511328 ?auto_1511329 ) ) ( ON ?auto_1511328 ?auto_1511327 ) ( not ( = ?auto_1511327 ?auto_1511328 ) ) ( not ( = ?auto_1511327 ?auto_1511329 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511328 ?auto_1511329 )
      ( MAKE-2CRATE-VERIFY ?auto_1511327 ?auto_1511328 ?auto_1511329 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511337 - SURFACE
      ?auto_1511338 - SURFACE
      ?auto_1511339 - SURFACE
    )
    :vars
    (
      ?auto_1511340 - HOIST
      ?auto_1511342 - PLACE
      ?auto_1511341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511340 ?auto_1511342 ) ( SURFACE-AT ?auto_1511338 ?auto_1511342 ) ( CLEAR ?auto_1511338 ) ( IS-CRATE ?auto_1511339 ) ( not ( = ?auto_1511338 ?auto_1511339 ) ) ( TRUCK-AT ?auto_1511341 ?auto_1511342 ) ( AVAILABLE ?auto_1511340 ) ( IN ?auto_1511339 ?auto_1511341 ) ( ON ?auto_1511338 ?auto_1511337 ) ( not ( = ?auto_1511337 ?auto_1511338 ) ) ( not ( = ?auto_1511337 ?auto_1511339 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511338 ?auto_1511339 )
      ( MAKE-2CRATE-VERIFY ?auto_1511337 ?auto_1511338 ?auto_1511339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511343 - SURFACE
      ?auto_1511344 - SURFACE
    )
    :vars
    (
      ?auto_1511347 - HOIST
      ?auto_1511346 - PLACE
      ?auto_1511348 - TRUCK
      ?auto_1511345 - SURFACE
      ?auto_1511349 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511347 ?auto_1511346 ) ( SURFACE-AT ?auto_1511343 ?auto_1511346 ) ( CLEAR ?auto_1511343 ) ( IS-CRATE ?auto_1511344 ) ( not ( = ?auto_1511343 ?auto_1511344 ) ) ( AVAILABLE ?auto_1511347 ) ( IN ?auto_1511344 ?auto_1511348 ) ( ON ?auto_1511343 ?auto_1511345 ) ( not ( = ?auto_1511345 ?auto_1511343 ) ) ( not ( = ?auto_1511345 ?auto_1511344 ) ) ( TRUCK-AT ?auto_1511348 ?auto_1511349 ) ( not ( = ?auto_1511349 ?auto_1511346 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1511348 ?auto_1511349 ?auto_1511346 )
      ( MAKE-2CRATE ?auto_1511345 ?auto_1511343 ?auto_1511344 )
      ( MAKE-1CRATE-VERIFY ?auto_1511343 ?auto_1511344 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511350 - SURFACE
      ?auto_1511351 - SURFACE
      ?auto_1511352 - SURFACE
    )
    :vars
    (
      ?auto_1511353 - HOIST
      ?auto_1511356 - PLACE
      ?auto_1511355 - TRUCK
      ?auto_1511354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511353 ?auto_1511356 ) ( SURFACE-AT ?auto_1511351 ?auto_1511356 ) ( CLEAR ?auto_1511351 ) ( IS-CRATE ?auto_1511352 ) ( not ( = ?auto_1511351 ?auto_1511352 ) ) ( AVAILABLE ?auto_1511353 ) ( IN ?auto_1511352 ?auto_1511355 ) ( ON ?auto_1511351 ?auto_1511350 ) ( not ( = ?auto_1511350 ?auto_1511351 ) ) ( not ( = ?auto_1511350 ?auto_1511352 ) ) ( TRUCK-AT ?auto_1511355 ?auto_1511354 ) ( not ( = ?auto_1511354 ?auto_1511356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511351 ?auto_1511352 )
      ( MAKE-2CRATE-VERIFY ?auto_1511350 ?auto_1511351 ?auto_1511352 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511357 - SURFACE
      ?auto_1511358 - SURFACE
    )
    :vars
    (
      ?auto_1511363 - HOIST
      ?auto_1511360 - PLACE
      ?auto_1511362 - SURFACE
      ?auto_1511361 - TRUCK
      ?auto_1511359 - PLACE
      ?auto_1511364 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511363 ?auto_1511360 ) ( SURFACE-AT ?auto_1511357 ?auto_1511360 ) ( CLEAR ?auto_1511357 ) ( IS-CRATE ?auto_1511358 ) ( not ( = ?auto_1511357 ?auto_1511358 ) ) ( AVAILABLE ?auto_1511363 ) ( ON ?auto_1511357 ?auto_1511362 ) ( not ( = ?auto_1511362 ?auto_1511357 ) ) ( not ( = ?auto_1511362 ?auto_1511358 ) ) ( TRUCK-AT ?auto_1511361 ?auto_1511359 ) ( not ( = ?auto_1511359 ?auto_1511360 ) ) ( HOIST-AT ?auto_1511364 ?auto_1511359 ) ( LIFTING ?auto_1511364 ?auto_1511358 ) ( not ( = ?auto_1511363 ?auto_1511364 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1511364 ?auto_1511358 ?auto_1511361 ?auto_1511359 )
      ( MAKE-2CRATE ?auto_1511362 ?auto_1511357 ?auto_1511358 )
      ( MAKE-1CRATE-VERIFY ?auto_1511357 ?auto_1511358 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511365 - SURFACE
      ?auto_1511366 - SURFACE
      ?auto_1511367 - SURFACE
    )
    :vars
    (
      ?auto_1511372 - HOIST
      ?auto_1511371 - PLACE
      ?auto_1511370 - TRUCK
      ?auto_1511368 - PLACE
      ?auto_1511369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511372 ?auto_1511371 ) ( SURFACE-AT ?auto_1511366 ?auto_1511371 ) ( CLEAR ?auto_1511366 ) ( IS-CRATE ?auto_1511367 ) ( not ( = ?auto_1511366 ?auto_1511367 ) ) ( AVAILABLE ?auto_1511372 ) ( ON ?auto_1511366 ?auto_1511365 ) ( not ( = ?auto_1511365 ?auto_1511366 ) ) ( not ( = ?auto_1511365 ?auto_1511367 ) ) ( TRUCK-AT ?auto_1511370 ?auto_1511368 ) ( not ( = ?auto_1511368 ?auto_1511371 ) ) ( HOIST-AT ?auto_1511369 ?auto_1511368 ) ( LIFTING ?auto_1511369 ?auto_1511367 ) ( not ( = ?auto_1511372 ?auto_1511369 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511366 ?auto_1511367 )
      ( MAKE-2CRATE-VERIFY ?auto_1511365 ?auto_1511366 ?auto_1511367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511373 - SURFACE
      ?auto_1511374 - SURFACE
    )
    :vars
    (
      ?auto_1511380 - HOIST
      ?auto_1511378 - PLACE
      ?auto_1511376 - SURFACE
      ?auto_1511377 - TRUCK
      ?auto_1511375 - PLACE
      ?auto_1511379 - HOIST
      ?auto_1511381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511380 ?auto_1511378 ) ( SURFACE-AT ?auto_1511373 ?auto_1511378 ) ( CLEAR ?auto_1511373 ) ( IS-CRATE ?auto_1511374 ) ( not ( = ?auto_1511373 ?auto_1511374 ) ) ( AVAILABLE ?auto_1511380 ) ( ON ?auto_1511373 ?auto_1511376 ) ( not ( = ?auto_1511376 ?auto_1511373 ) ) ( not ( = ?auto_1511376 ?auto_1511374 ) ) ( TRUCK-AT ?auto_1511377 ?auto_1511375 ) ( not ( = ?auto_1511375 ?auto_1511378 ) ) ( HOIST-AT ?auto_1511379 ?auto_1511375 ) ( not ( = ?auto_1511380 ?auto_1511379 ) ) ( AVAILABLE ?auto_1511379 ) ( SURFACE-AT ?auto_1511374 ?auto_1511375 ) ( ON ?auto_1511374 ?auto_1511381 ) ( CLEAR ?auto_1511374 ) ( not ( = ?auto_1511373 ?auto_1511381 ) ) ( not ( = ?auto_1511374 ?auto_1511381 ) ) ( not ( = ?auto_1511376 ?auto_1511381 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1511379 ?auto_1511374 ?auto_1511381 ?auto_1511375 )
      ( MAKE-2CRATE ?auto_1511376 ?auto_1511373 ?auto_1511374 )
      ( MAKE-1CRATE-VERIFY ?auto_1511373 ?auto_1511374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511382 - SURFACE
      ?auto_1511383 - SURFACE
      ?auto_1511384 - SURFACE
    )
    :vars
    (
      ?auto_1511387 - HOIST
      ?auto_1511390 - PLACE
      ?auto_1511389 - TRUCK
      ?auto_1511385 - PLACE
      ?auto_1511386 - HOIST
      ?auto_1511388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511387 ?auto_1511390 ) ( SURFACE-AT ?auto_1511383 ?auto_1511390 ) ( CLEAR ?auto_1511383 ) ( IS-CRATE ?auto_1511384 ) ( not ( = ?auto_1511383 ?auto_1511384 ) ) ( AVAILABLE ?auto_1511387 ) ( ON ?auto_1511383 ?auto_1511382 ) ( not ( = ?auto_1511382 ?auto_1511383 ) ) ( not ( = ?auto_1511382 ?auto_1511384 ) ) ( TRUCK-AT ?auto_1511389 ?auto_1511385 ) ( not ( = ?auto_1511385 ?auto_1511390 ) ) ( HOIST-AT ?auto_1511386 ?auto_1511385 ) ( not ( = ?auto_1511387 ?auto_1511386 ) ) ( AVAILABLE ?auto_1511386 ) ( SURFACE-AT ?auto_1511384 ?auto_1511385 ) ( ON ?auto_1511384 ?auto_1511388 ) ( CLEAR ?auto_1511384 ) ( not ( = ?auto_1511383 ?auto_1511388 ) ) ( not ( = ?auto_1511384 ?auto_1511388 ) ) ( not ( = ?auto_1511382 ?auto_1511388 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511383 ?auto_1511384 )
      ( MAKE-2CRATE-VERIFY ?auto_1511382 ?auto_1511383 ?auto_1511384 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511391 - SURFACE
      ?auto_1511392 - SURFACE
    )
    :vars
    (
      ?auto_1511398 - HOIST
      ?auto_1511394 - PLACE
      ?auto_1511396 - SURFACE
      ?auto_1511399 - PLACE
      ?auto_1511393 - HOIST
      ?auto_1511397 - SURFACE
      ?auto_1511395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511398 ?auto_1511394 ) ( SURFACE-AT ?auto_1511391 ?auto_1511394 ) ( CLEAR ?auto_1511391 ) ( IS-CRATE ?auto_1511392 ) ( not ( = ?auto_1511391 ?auto_1511392 ) ) ( AVAILABLE ?auto_1511398 ) ( ON ?auto_1511391 ?auto_1511396 ) ( not ( = ?auto_1511396 ?auto_1511391 ) ) ( not ( = ?auto_1511396 ?auto_1511392 ) ) ( not ( = ?auto_1511399 ?auto_1511394 ) ) ( HOIST-AT ?auto_1511393 ?auto_1511399 ) ( not ( = ?auto_1511398 ?auto_1511393 ) ) ( AVAILABLE ?auto_1511393 ) ( SURFACE-AT ?auto_1511392 ?auto_1511399 ) ( ON ?auto_1511392 ?auto_1511397 ) ( CLEAR ?auto_1511392 ) ( not ( = ?auto_1511391 ?auto_1511397 ) ) ( not ( = ?auto_1511392 ?auto_1511397 ) ) ( not ( = ?auto_1511396 ?auto_1511397 ) ) ( TRUCK-AT ?auto_1511395 ?auto_1511394 ) )
    :subtasks
    ( ( !DRIVE ?auto_1511395 ?auto_1511394 ?auto_1511399 )
      ( MAKE-2CRATE ?auto_1511396 ?auto_1511391 ?auto_1511392 )
      ( MAKE-1CRATE-VERIFY ?auto_1511391 ?auto_1511392 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511400 - SURFACE
      ?auto_1511401 - SURFACE
      ?auto_1511402 - SURFACE
    )
    :vars
    (
      ?auto_1511406 - HOIST
      ?auto_1511405 - PLACE
      ?auto_1511408 - PLACE
      ?auto_1511404 - HOIST
      ?auto_1511407 - SURFACE
      ?auto_1511403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511406 ?auto_1511405 ) ( SURFACE-AT ?auto_1511401 ?auto_1511405 ) ( CLEAR ?auto_1511401 ) ( IS-CRATE ?auto_1511402 ) ( not ( = ?auto_1511401 ?auto_1511402 ) ) ( AVAILABLE ?auto_1511406 ) ( ON ?auto_1511401 ?auto_1511400 ) ( not ( = ?auto_1511400 ?auto_1511401 ) ) ( not ( = ?auto_1511400 ?auto_1511402 ) ) ( not ( = ?auto_1511408 ?auto_1511405 ) ) ( HOIST-AT ?auto_1511404 ?auto_1511408 ) ( not ( = ?auto_1511406 ?auto_1511404 ) ) ( AVAILABLE ?auto_1511404 ) ( SURFACE-AT ?auto_1511402 ?auto_1511408 ) ( ON ?auto_1511402 ?auto_1511407 ) ( CLEAR ?auto_1511402 ) ( not ( = ?auto_1511401 ?auto_1511407 ) ) ( not ( = ?auto_1511402 ?auto_1511407 ) ) ( not ( = ?auto_1511400 ?auto_1511407 ) ) ( TRUCK-AT ?auto_1511403 ?auto_1511405 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511401 ?auto_1511402 )
      ( MAKE-2CRATE-VERIFY ?auto_1511400 ?auto_1511401 ?auto_1511402 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511409 - SURFACE
      ?auto_1511410 - SURFACE
    )
    :vars
    (
      ?auto_1511415 - HOIST
      ?auto_1511414 - PLACE
      ?auto_1511411 - SURFACE
      ?auto_1511413 - PLACE
      ?auto_1511416 - HOIST
      ?auto_1511412 - SURFACE
      ?auto_1511417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511415 ?auto_1511414 ) ( IS-CRATE ?auto_1511410 ) ( not ( = ?auto_1511409 ?auto_1511410 ) ) ( not ( = ?auto_1511411 ?auto_1511409 ) ) ( not ( = ?auto_1511411 ?auto_1511410 ) ) ( not ( = ?auto_1511413 ?auto_1511414 ) ) ( HOIST-AT ?auto_1511416 ?auto_1511413 ) ( not ( = ?auto_1511415 ?auto_1511416 ) ) ( AVAILABLE ?auto_1511416 ) ( SURFACE-AT ?auto_1511410 ?auto_1511413 ) ( ON ?auto_1511410 ?auto_1511412 ) ( CLEAR ?auto_1511410 ) ( not ( = ?auto_1511409 ?auto_1511412 ) ) ( not ( = ?auto_1511410 ?auto_1511412 ) ) ( not ( = ?auto_1511411 ?auto_1511412 ) ) ( TRUCK-AT ?auto_1511417 ?auto_1511414 ) ( SURFACE-AT ?auto_1511411 ?auto_1511414 ) ( CLEAR ?auto_1511411 ) ( LIFTING ?auto_1511415 ?auto_1511409 ) ( IS-CRATE ?auto_1511409 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511411 ?auto_1511409 )
      ( MAKE-2CRATE ?auto_1511411 ?auto_1511409 ?auto_1511410 )
      ( MAKE-1CRATE-VERIFY ?auto_1511409 ?auto_1511410 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511418 - SURFACE
      ?auto_1511419 - SURFACE
      ?auto_1511420 - SURFACE
    )
    :vars
    (
      ?auto_1511421 - HOIST
      ?auto_1511424 - PLACE
      ?auto_1511422 - PLACE
      ?auto_1511425 - HOIST
      ?auto_1511426 - SURFACE
      ?auto_1511423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511421 ?auto_1511424 ) ( IS-CRATE ?auto_1511420 ) ( not ( = ?auto_1511419 ?auto_1511420 ) ) ( not ( = ?auto_1511418 ?auto_1511419 ) ) ( not ( = ?auto_1511418 ?auto_1511420 ) ) ( not ( = ?auto_1511422 ?auto_1511424 ) ) ( HOIST-AT ?auto_1511425 ?auto_1511422 ) ( not ( = ?auto_1511421 ?auto_1511425 ) ) ( AVAILABLE ?auto_1511425 ) ( SURFACE-AT ?auto_1511420 ?auto_1511422 ) ( ON ?auto_1511420 ?auto_1511426 ) ( CLEAR ?auto_1511420 ) ( not ( = ?auto_1511419 ?auto_1511426 ) ) ( not ( = ?auto_1511420 ?auto_1511426 ) ) ( not ( = ?auto_1511418 ?auto_1511426 ) ) ( TRUCK-AT ?auto_1511423 ?auto_1511424 ) ( SURFACE-AT ?auto_1511418 ?auto_1511424 ) ( CLEAR ?auto_1511418 ) ( LIFTING ?auto_1511421 ?auto_1511419 ) ( IS-CRATE ?auto_1511419 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511419 ?auto_1511420 )
      ( MAKE-2CRATE-VERIFY ?auto_1511418 ?auto_1511419 ?auto_1511420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511427 - SURFACE
      ?auto_1511428 - SURFACE
    )
    :vars
    (
      ?auto_1511435 - HOIST
      ?auto_1511434 - PLACE
      ?auto_1511432 - SURFACE
      ?auto_1511431 - PLACE
      ?auto_1511430 - HOIST
      ?auto_1511433 - SURFACE
      ?auto_1511429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511435 ?auto_1511434 ) ( IS-CRATE ?auto_1511428 ) ( not ( = ?auto_1511427 ?auto_1511428 ) ) ( not ( = ?auto_1511432 ?auto_1511427 ) ) ( not ( = ?auto_1511432 ?auto_1511428 ) ) ( not ( = ?auto_1511431 ?auto_1511434 ) ) ( HOIST-AT ?auto_1511430 ?auto_1511431 ) ( not ( = ?auto_1511435 ?auto_1511430 ) ) ( AVAILABLE ?auto_1511430 ) ( SURFACE-AT ?auto_1511428 ?auto_1511431 ) ( ON ?auto_1511428 ?auto_1511433 ) ( CLEAR ?auto_1511428 ) ( not ( = ?auto_1511427 ?auto_1511433 ) ) ( not ( = ?auto_1511428 ?auto_1511433 ) ) ( not ( = ?auto_1511432 ?auto_1511433 ) ) ( TRUCK-AT ?auto_1511429 ?auto_1511434 ) ( SURFACE-AT ?auto_1511432 ?auto_1511434 ) ( CLEAR ?auto_1511432 ) ( IS-CRATE ?auto_1511427 ) ( AVAILABLE ?auto_1511435 ) ( IN ?auto_1511427 ?auto_1511429 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1511435 ?auto_1511427 ?auto_1511429 ?auto_1511434 )
      ( MAKE-2CRATE ?auto_1511432 ?auto_1511427 ?auto_1511428 )
      ( MAKE-1CRATE-VERIFY ?auto_1511427 ?auto_1511428 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1511436 - SURFACE
      ?auto_1511437 - SURFACE
      ?auto_1511438 - SURFACE
    )
    :vars
    (
      ?auto_1511439 - HOIST
      ?auto_1511443 - PLACE
      ?auto_1511444 - PLACE
      ?auto_1511441 - HOIST
      ?auto_1511442 - SURFACE
      ?auto_1511440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511439 ?auto_1511443 ) ( IS-CRATE ?auto_1511438 ) ( not ( = ?auto_1511437 ?auto_1511438 ) ) ( not ( = ?auto_1511436 ?auto_1511437 ) ) ( not ( = ?auto_1511436 ?auto_1511438 ) ) ( not ( = ?auto_1511444 ?auto_1511443 ) ) ( HOIST-AT ?auto_1511441 ?auto_1511444 ) ( not ( = ?auto_1511439 ?auto_1511441 ) ) ( AVAILABLE ?auto_1511441 ) ( SURFACE-AT ?auto_1511438 ?auto_1511444 ) ( ON ?auto_1511438 ?auto_1511442 ) ( CLEAR ?auto_1511438 ) ( not ( = ?auto_1511437 ?auto_1511442 ) ) ( not ( = ?auto_1511438 ?auto_1511442 ) ) ( not ( = ?auto_1511436 ?auto_1511442 ) ) ( TRUCK-AT ?auto_1511440 ?auto_1511443 ) ( SURFACE-AT ?auto_1511436 ?auto_1511443 ) ( CLEAR ?auto_1511436 ) ( IS-CRATE ?auto_1511437 ) ( AVAILABLE ?auto_1511439 ) ( IN ?auto_1511437 ?auto_1511440 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511437 ?auto_1511438 )
      ( MAKE-2CRATE-VERIFY ?auto_1511436 ?auto_1511437 ?auto_1511438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1511481 - SURFACE
      ?auto_1511482 - SURFACE
    )
    :vars
    (
      ?auto_1511485 - HOIST
      ?auto_1511483 - PLACE
      ?auto_1511486 - SURFACE
      ?auto_1511489 - PLACE
      ?auto_1511487 - HOIST
      ?auto_1511488 - SURFACE
      ?auto_1511484 - TRUCK
      ?auto_1511490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511485 ?auto_1511483 ) ( SURFACE-AT ?auto_1511481 ?auto_1511483 ) ( CLEAR ?auto_1511481 ) ( IS-CRATE ?auto_1511482 ) ( not ( = ?auto_1511481 ?auto_1511482 ) ) ( AVAILABLE ?auto_1511485 ) ( ON ?auto_1511481 ?auto_1511486 ) ( not ( = ?auto_1511486 ?auto_1511481 ) ) ( not ( = ?auto_1511486 ?auto_1511482 ) ) ( not ( = ?auto_1511489 ?auto_1511483 ) ) ( HOIST-AT ?auto_1511487 ?auto_1511489 ) ( not ( = ?auto_1511485 ?auto_1511487 ) ) ( AVAILABLE ?auto_1511487 ) ( SURFACE-AT ?auto_1511482 ?auto_1511489 ) ( ON ?auto_1511482 ?auto_1511488 ) ( CLEAR ?auto_1511482 ) ( not ( = ?auto_1511481 ?auto_1511488 ) ) ( not ( = ?auto_1511482 ?auto_1511488 ) ) ( not ( = ?auto_1511486 ?auto_1511488 ) ) ( TRUCK-AT ?auto_1511484 ?auto_1511490 ) ( not ( = ?auto_1511490 ?auto_1511483 ) ) ( not ( = ?auto_1511489 ?auto_1511490 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1511484 ?auto_1511490 ?auto_1511483 )
      ( MAKE-1CRATE ?auto_1511481 ?auto_1511482 )
      ( MAKE-1CRATE-VERIFY ?auto_1511481 ?auto_1511482 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511520 - SURFACE
      ?auto_1511521 - SURFACE
      ?auto_1511522 - SURFACE
      ?auto_1511523 - SURFACE
    )
    :vars
    (
      ?auto_1511525 - HOIST
      ?auto_1511524 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511525 ?auto_1511524 ) ( SURFACE-AT ?auto_1511522 ?auto_1511524 ) ( CLEAR ?auto_1511522 ) ( LIFTING ?auto_1511525 ?auto_1511523 ) ( IS-CRATE ?auto_1511523 ) ( not ( = ?auto_1511522 ?auto_1511523 ) ) ( ON ?auto_1511521 ?auto_1511520 ) ( ON ?auto_1511522 ?auto_1511521 ) ( not ( = ?auto_1511520 ?auto_1511521 ) ) ( not ( = ?auto_1511520 ?auto_1511522 ) ) ( not ( = ?auto_1511520 ?auto_1511523 ) ) ( not ( = ?auto_1511521 ?auto_1511522 ) ) ( not ( = ?auto_1511521 ?auto_1511523 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511522 ?auto_1511523 )
      ( MAKE-3CRATE-VERIFY ?auto_1511520 ?auto_1511521 ?auto_1511522 ?auto_1511523 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511537 - SURFACE
      ?auto_1511538 - SURFACE
      ?auto_1511539 - SURFACE
      ?auto_1511540 - SURFACE
    )
    :vars
    (
      ?auto_1511541 - HOIST
      ?auto_1511543 - PLACE
      ?auto_1511542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511541 ?auto_1511543 ) ( SURFACE-AT ?auto_1511539 ?auto_1511543 ) ( CLEAR ?auto_1511539 ) ( IS-CRATE ?auto_1511540 ) ( not ( = ?auto_1511539 ?auto_1511540 ) ) ( TRUCK-AT ?auto_1511542 ?auto_1511543 ) ( AVAILABLE ?auto_1511541 ) ( IN ?auto_1511540 ?auto_1511542 ) ( ON ?auto_1511539 ?auto_1511538 ) ( not ( = ?auto_1511538 ?auto_1511539 ) ) ( not ( = ?auto_1511538 ?auto_1511540 ) ) ( ON ?auto_1511538 ?auto_1511537 ) ( not ( = ?auto_1511537 ?auto_1511538 ) ) ( not ( = ?auto_1511537 ?auto_1511539 ) ) ( not ( = ?auto_1511537 ?auto_1511540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1511538 ?auto_1511539 ?auto_1511540 )
      ( MAKE-3CRATE-VERIFY ?auto_1511537 ?auto_1511538 ?auto_1511539 ?auto_1511540 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511558 - SURFACE
      ?auto_1511559 - SURFACE
      ?auto_1511560 - SURFACE
      ?auto_1511561 - SURFACE
    )
    :vars
    (
      ?auto_1511565 - HOIST
      ?auto_1511564 - PLACE
      ?auto_1511563 - TRUCK
      ?auto_1511562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511565 ?auto_1511564 ) ( SURFACE-AT ?auto_1511560 ?auto_1511564 ) ( CLEAR ?auto_1511560 ) ( IS-CRATE ?auto_1511561 ) ( not ( = ?auto_1511560 ?auto_1511561 ) ) ( AVAILABLE ?auto_1511565 ) ( IN ?auto_1511561 ?auto_1511563 ) ( ON ?auto_1511560 ?auto_1511559 ) ( not ( = ?auto_1511559 ?auto_1511560 ) ) ( not ( = ?auto_1511559 ?auto_1511561 ) ) ( TRUCK-AT ?auto_1511563 ?auto_1511562 ) ( not ( = ?auto_1511562 ?auto_1511564 ) ) ( ON ?auto_1511559 ?auto_1511558 ) ( not ( = ?auto_1511558 ?auto_1511559 ) ) ( not ( = ?auto_1511558 ?auto_1511560 ) ) ( not ( = ?auto_1511558 ?auto_1511561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1511559 ?auto_1511560 ?auto_1511561 )
      ( MAKE-3CRATE-VERIFY ?auto_1511558 ?auto_1511559 ?auto_1511560 ?auto_1511561 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511582 - SURFACE
      ?auto_1511583 - SURFACE
      ?auto_1511584 - SURFACE
      ?auto_1511585 - SURFACE
    )
    :vars
    (
      ?auto_1511586 - HOIST
      ?auto_1511587 - PLACE
      ?auto_1511588 - TRUCK
      ?auto_1511589 - PLACE
      ?auto_1511590 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511586 ?auto_1511587 ) ( SURFACE-AT ?auto_1511584 ?auto_1511587 ) ( CLEAR ?auto_1511584 ) ( IS-CRATE ?auto_1511585 ) ( not ( = ?auto_1511584 ?auto_1511585 ) ) ( AVAILABLE ?auto_1511586 ) ( ON ?auto_1511584 ?auto_1511583 ) ( not ( = ?auto_1511583 ?auto_1511584 ) ) ( not ( = ?auto_1511583 ?auto_1511585 ) ) ( TRUCK-AT ?auto_1511588 ?auto_1511589 ) ( not ( = ?auto_1511589 ?auto_1511587 ) ) ( HOIST-AT ?auto_1511590 ?auto_1511589 ) ( LIFTING ?auto_1511590 ?auto_1511585 ) ( not ( = ?auto_1511586 ?auto_1511590 ) ) ( ON ?auto_1511583 ?auto_1511582 ) ( not ( = ?auto_1511582 ?auto_1511583 ) ) ( not ( = ?auto_1511582 ?auto_1511584 ) ) ( not ( = ?auto_1511582 ?auto_1511585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1511583 ?auto_1511584 ?auto_1511585 )
      ( MAKE-3CRATE-VERIFY ?auto_1511582 ?auto_1511583 ?auto_1511584 ?auto_1511585 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511609 - SURFACE
      ?auto_1511610 - SURFACE
      ?auto_1511611 - SURFACE
      ?auto_1511612 - SURFACE
    )
    :vars
    (
      ?auto_1511617 - HOIST
      ?auto_1511614 - PLACE
      ?auto_1511616 - TRUCK
      ?auto_1511618 - PLACE
      ?auto_1511615 - HOIST
      ?auto_1511613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511617 ?auto_1511614 ) ( SURFACE-AT ?auto_1511611 ?auto_1511614 ) ( CLEAR ?auto_1511611 ) ( IS-CRATE ?auto_1511612 ) ( not ( = ?auto_1511611 ?auto_1511612 ) ) ( AVAILABLE ?auto_1511617 ) ( ON ?auto_1511611 ?auto_1511610 ) ( not ( = ?auto_1511610 ?auto_1511611 ) ) ( not ( = ?auto_1511610 ?auto_1511612 ) ) ( TRUCK-AT ?auto_1511616 ?auto_1511618 ) ( not ( = ?auto_1511618 ?auto_1511614 ) ) ( HOIST-AT ?auto_1511615 ?auto_1511618 ) ( not ( = ?auto_1511617 ?auto_1511615 ) ) ( AVAILABLE ?auto_1511615 ) ( SURFACE-AT ?auto_1511612 ?auto_1511618 ) ( ON ?auto_1511612 ?auto_1511613 ) ( CLEAR ?auto_1511612 ) ( not ( = ?auto_1511611 ?auto_1511613 ) ) ( not ( = ?auto_1511612 ?auto_1511613 ) ) ( not ( = ?auto_1511610 ?auto_1511613 ) ) ( ON ?auto_1511610 ?auto_1511609 ) ( not ( = ?auto_1511609 ?auto_1511610 ) ) ( not ( = ?auto_1511609 ?auto_1511611 ) ) ( not ( = ?auto_1511609 ?auto_1511612 ) ) ( not ( = ?auto_1511609 ?auto_1511613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1511610 ?auto_1511611 ?auto_1511612 )
      ( MAKE-3CRATE-VERIFY ?auto_1511609 ?auto_1511610 ?auto_1511611 ?auto_1511612 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511637 - SURFACE
      ?auto_1511638 - SURFACE
      ?auto_1511639 - SURFACE
      ?auto_1511640 - SURFACE
    )
    :vars
    (
      ?auto_1511643 - HOIST
      ?auto_1511645 - PLACE
      ?auto_1511641 - PLACE
      ?auto_1511644 - HOIST
      ?auto_1511646 - SURFACE
      ?auto_1511642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511643 ?auto_1511645 ) ( SURFACE-AT ?auto_1511639 ?auto_1511645 ) ( CLEAR ?auto_1511639 ) ( IS-CRATE ?auto_1511640 ) ( not ( = ?auto_1511639 ?auto_1511640 ) ) ( AVAILABLE ?auto_1511643 ) ( ON ?auto_1511639 ?auto_1511638 ) ( not ( = ?auto_1511638 ?auto_1511639 ) ) ( not ( = ?auto_1511638 ?auto_1511640 ) ) ( not ( = ?auto_1511641 ?auto_1511645 ) ) ( HOIST-AT ?auto_1511644 ?auto_1511641 ) ( not ( = ?auto_1511643 ?auto_1511644 ) ) ( AVAILABLE ?auto_1511644 ) ( SURFACE-AT ?auto_1511640 ?auto_1511641 ) ( ON ?auto_1511640 ?auto_1511646 ) ( CLEAR ?auto_1511640 ) ( not ( = ?auto_1511639 ?auto_1511646 ) ) ( not ( = ?auto_1511640 ?auto_1511646 ) ) ( not ( = ?auto_1511638 ?auto_1511646 ) ) ( TRUCK-AT ?auto_1511642 ?auto_1511645 ) ( ON ?auto_1511638 ?auto_1511637 ) ( not ( = ?auto_1511637 ?auto_1511638 ) ) ( not ( = ?auto_1511637 ?auto_1511639 ) ) ( not ( = ?auto_1511637 ?auto_1511640 ) ) ( not ( = ?auto_1511637 ?auto_1511646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1511638 ?auto_1511639 ?auto_1511640 )
      ( MAKE-3CRATE-VERIFY ?auto_1511637 ?auto_1511638 ?auto_1511639 ?auto_1511640 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511665 - SURFACE
      ?auto_1511666 - SURFACE
      ?auto_1511667 - SURFACE
      ?auto_1511668 - SURFACE
    )
    :vars
    (
      ?auto_1511674 - HOIST
      ?auto_1511673 - PLACE
      ?auto_1511672 - PLACE
      ?auto_1511669 - HOIST
      ?auto_1511670 - SURFACE
      ?auto_1511671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511674 ?auto_1511673 ) ( IS-CRATE ?auto_1511668 ) ( not ( = ?auto_1511667 ?auto_1511668 ) ) ( not ( = ?auto_1511666 ?auto_1511667 ) ) ( not ( = ?auto_1511666 ?auto_1511668 ) ) ( not ( = ?auto_1511672 ?auto_1511673 ) ) ( HOIST-AT ?auto_1511669 ?auto_1511672 ) ( not ( = ?auto_1511674 ?auto_1511669 ) ) ( AVAILABLE ?auto_1511669 ) ( SURFACE-AT ?auto_1511668 ?auto_1511672 ) ( ON ?auto_1511668 ?auto_1511670 ) ( CLEAR ?auto_1511668 ) ( not ( = ?auto_1511667 ?auto_1511670 ) ) ( not ( = ?auto_1511668 ?auto_1511670 ) ) ( not ( = ?auto_1511666 ?auto_1511670 ) ) ( TRUCK-AT ?auto_1511671 ?auto_1511673 ) ( SURFACE-AT ?auto_1511666 ?auto_1511673 ) ( CLEAR ?auto_1511666 ) ( LIFTING ?auto_1511674 ?auto_1511667 ) ( IS-CRATE ?auto_1511667 ) ( ON ?auto_1511666 ?auto_1511665 ) ( not ( = ?auto_1511665 ?auto_1511666 ) ) ( not ( = ?auto_1511665 ?auto_1511667 ) ) ( not ( = ?auto_1511665 ?auto_1511668 ) ) ( not ( = ?auto_1511665 ?auto_1511670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1511666 ?auto_1511667 ?auto_1511668 )
      ( MAKE-3CRATE-VERIFY ?auto_1511665 ?auto_1511666 ?auto_1511667 ?auto_1511668 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1511693 - SURFACE
      ?auto_1511694 - SURFACE
      ?auto_1511695 - SURFACE
      ?auto_1511696 - SURFACE
    )
    :vars
    (
      ?auto_1511700 - HOIST
      ?auto_1511701 - PLACE
      ?auto_1511702 - PLACE
      ?auto_1511697 - HOIST
      ?auto_1511698 - SURFACE
      ?auto_1511699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511700 ?auto_1511701 ) ( IS-CRATE ?auto_1511696 ) ( not ( = ?auto_1511695 ?auto_1511696 ) ) ( not ( = ?auto_1511694 ?auto_1511695 ) ) ( not ( = ?auto_1511694 ?auto_1511696 ) ) ( not ( = ?auto_1511702 ?auto_1511701 ) ) ( HOIST-AT ?auto_1511697 ?auto_1511702 ) ( not ( = ?auto_1511700 ?auto_1511697 ) ) ( AVAILABLE ?auto_1511697 ) ( SURFACE-AT ?auto_1511696 ?auto_1511702 ) ( ON ?auto_1511696 ?auto_1511698 ) ( CLEAR ?auto_1511696 ) ( not ( = ?auto_1511695 ?auto_1511698 ) ) ( not ( = ?auto_1511696 ?auto_1511698 ) ) ( not ( = ?auto_1511694 ?auto_1511698 ) ) ( TRUCK-AT ?auto_1511699 ?auto_1511701 ) ( SURFACE-AT ?auto_1511694 ?auto_1511701 ) ( CLEAR ?auto_1511694 ) ( IS-CRATE ?auto_1511695 ) ( AVAILABLE ?auto_1511700 ) ( IN ?auto_1511695 ?auto_1511699 ) ( ON ?auto_1511694 ?auto_1511693 ) ( not ( = ?auto_1511693 ?auto_1511694 ) ) ( not ( = ?auto_1511693 ?auto_1511695 ) ) ( not ( = ?auto_1511693 ?auto_1511696 ) ) ( not ( = ?auto_1511693 ?auto_1511698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1511694 ?auto_1511695 ?auto_1511696 )
      ( MAKE-3CRATE-VERIFY ?auto_1511693 ?auto_1511694 ?auto_1511695 ?auto_1511696 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1511984 - SURFACE
      ?auto_1511985 - SURFACE
      ?auto_1511986 - SURFACE
      ?auto_1511988 - SURFACE
      ?auto_1511987 - SURFACE
    )
    :vars
    (
      ?auto_1511990 - HOIST
      ?auto_1511989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1511990 ?auto_1511989 ) ( SURFACE-AT ?auto_1511988 ?auto_1511989 ) ( CLEAR ?auto_1511988 ) ( LIFTING ?auto_1511990 ?auto_1511987 ) ( IS-CRATE ?auto_1511987 ) ( not ( = ?auto_1511988 ?auto_1511987 ) ) ( ON ?auto_1511985 ?auto_1511984 ) ( ON ?auto_1511986 ?auto_1511985 ) ( ON ?auto_1511988 ?auto_1511986 ) ( not ( = ?auto_1511984 ?auto_1511985 ) ) ( not ( = ?auto_1511984 ?auto_1511986 ) ) ( not ( = ?auto_1511984 ?auto_1511988 ) ) ( not ( = ?auto_1511984 ?auto_1511987 ) ) ( not ( = ?auto_1511985 ?auto_1511986 ) ) ( not ( = ?auto_1511985 ?auto_1511988 ) ) ( not ( = ?auto_1511985 ?auto_1511987 ) ) ( not ( = ?auto_1511986 ?auto_1511988 ) ) ( not ( = ?auto_1511986 ?auto_1511987 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1511988 ?auto_1511987 )
      ( MAKE-4CRATE-VERIFY ?auto_1511984 ?auto_1511985 ?auto_1511986 ?auto_1511988 ?auto_1511987 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512009 - SURFACE
      ?auto_1512010 - SURFACE
      ?auto_1512011 - SURFACE
      ?auto_1512013 - SURFACE
      ?auto_1512012 - SURFACE
    )
    :vars
    (
      ?auto_1512014 - HOIST
      ?auto_1512015 - PLACE
      ?auto_1512016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512014 ?auto_1512015 ) ( SURFACE-AT ?auto_1512013 ?auto_1512015 ) ( CLEAR ?auto_1512013 ) ( IS-CRATE ?auto_1512012 ) ( not ( = ?auto_1512013 ?auto_1512012 ) ) ( TRUCK-AT ?auto_1512016 ?auto_1512015 ) ( AVAILABLE ?auto_1512014 ) ( IN ?auto_1512012 ?auto_1512016 ) ( ON ?auto_1512013 ?auto_1512011 ) ( not ( = ?auto_1512011 ?auto_1512013 ) ) ( not ( = ?auto_1512011 ?auto_1512012 ) ) ( ON ?auto_1512010 ?auto_1512009 ) ( ON ?auto_1512011 ?auto_1512010 ) ( not ( = ?auto_1512009 ?auto_1512010 ) ) ( not ( = ?auto_1512009 ?auto_1512011 ) ) ( not ( = ?auto_1512009 ?auto_1512013 ) ) ( not ( = ?auto_1512009 ?auto_1512012 ) ) ( not ( = ?auto_1512010 ?auto_1512011 ) ) ( not ( = ?auto_1512010 ?auto_1512013 ) ) ( not ( = ?auto_1512010 ?auto_1512012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512011 ?auto_1512013 ?auto_1512012 )
      ( MAKE-4CRATE-VERIFY ?auto_1512009 ?auto_1512010 ?auto_1512011 ?auto_1512013 ?auto_1512012 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512039 - SURFACE
      ?auto_1512040 - SURFACE
      ?auto_1512041 - SURFACE
      ?auto_1512043 - SURFACE
      ?auto_1512042 - SURFACE
    )
    :vars
    (
      ?auto_1512047 - HOIST
      ?auto_1512046 - PLACE
      ?auto_1512044 - TRUCK
      ?auto_1512045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512047 ?auto_1512046 ) ( SURFACE-AT ?auto_1512043 ?auto_1512046 ) ( CLEAR ?auto_1512043 ) ( IS-CRATE ?auto_1512042 ) ( not ( = ?auto_1512043 ?auto_1512042 ) ) ( AVAILABLE ?auto_1512047 ) ( IN ?auto_1512042 ?auto_1512044 ) ( ON ?auto_1512043 ?auto_1512041 ) ( not ( = ?auto_1512041 ?auto_1512043 ) ) ( not ( = ?auto_1512041 ?auto_1512042 ) ) ( TRUCK-AT ?auto_1512044 ?auto_1512045 ) ( not ( = ?auto_1512045 ?auto_1512046 ) ) ( ON ?auto_1512040 ?auto_1512039 ) ( ON ?auto_1512041 ?auto_1512040 ) ( not ( = ?auto_1512039 ?auto_1512040 ) ) ( not ( = ?auto_1512039 ?auto_1512041 ) ) ( not ( = ?auto_1512039 ?auto_1512043 ) ) ( not ( = ?auto_1512039 ?auto_1512042 ) ) ( not ( = ?auto_1512040 ?auto_1512041 ) ) ( not ( = ?auto_1512040 ?auto_1512043 ) ) ( not ( = ?auto_1512040 ?auto_1512042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512041 ?auto_1512043 ?auto_1512042 )
      ( MAKE-4CRATE-VERIFY ?auto_1512039 ?auto_1512040 ?auto_1512041 ?auto_1512043 ?auto_1512042 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512073 - SURFACE
      ?auto_1512074 - SURFACE
      ?auto_1512075 - SURFACE
      ?auto_1512077 - SURFACE
      ?auto_1512076 - SURFACE
    )
    :vars
    (
      ?auto_1512079 - HOIST
      ?auto_1512078 - PLACE
      ?auto_1512082 - TRUCK
      ?auto_1512081 - PLACE
      ?auto_1512080 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512079 ?auto_1512078 ) ( SURFACE-AT ?auto_1512077 ?auto_1512078 ) ( CLEAR ?auto_1512077 ) ( IS-CRATE ?auto_1512076 ) ( not ( = ?auto_1512077 ?auto_1512076 ) ) ( AVAILABLE ?auto_1512079 ) ( ON ?auto_1512077 ?auto_1512075 ) ( not ( = ?auto_1512075 ?auto_1512077 ) ) ( not ( = ?auto_1512075 ?auto_1512076 ) ) ( TRUCK-AT ?auto_1512082 ?auto_1512081 ) ( not ( = ?auto_1512081 ?auto_1512078 ) ) ( HOIST-AT ?auto_1512080 ?auto_1512081 ) ( LIFTING ?auto_1512080 ?auto_1512076 ) ( not ( = ?auto_1512079 ?auto_1512080 ) ) ( ON ?auto_1512074 ?auto_1512073 ) ( ON ?auto_1512075 ?auto_1512074 ) ( not ( = ?auto_1512073 ?auto_1512074 ) ) ( not ( = ?auto_1512073 ?auto_1512075 ) ) ( not ( = ?auto_1512073 ?auto_1512077 ) ) ( not ( = ?auto_1512073 ?auto_1512076 ) ) ( not ( = ?auto_1512074 ?auto_1512075 ) ) ( not ( = ?auto_1512074 ?auto_1512077 ) ) ( not ( = ?auto_1512074 ?auto_1512076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512075 ?auto_1512077 ?auto_1512076 )
      ( MAKE-4CRATE-VERIFY ?auto_1512073 ?auto_1512074 ?auto_1512075 ?auto_1512077 ?auto_1512076 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512111 - SURFACE
      ?auto_1512112 - SURFACE
      ?auto_1512113 - SURFACE
      ?auto_1512115 - SURFACE
      ?auto_1512114 - SURFACE
    )
    :vars
    (
      ?auto_1512117 - HOIST
      ?auto_1512118 - PLACE
      ?auto_1512119 - TRUCK
      ?auto_1512120 - PLACE
      ?auto_1512116 - HOIST
      ?auto_1512121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512117 ?auto_1512118 ) ( SURFACE-AT ?auto_1512115 ?auto_1512118 ) ( CLEAR ?auto_1512115 ) ( IS-CRATE ?auto_1512114 ) ( not ( = ?auto_1512115 ?auto_1512114 ) ) ( AVAILABLE ?auto_1512117 ) ( ON ?auto_1512115 ?auto_1512113 ) ( not ( = ?auto_1512113 ?auto_1512115 ) ) ( not ( = ?auto_1512113 ?auto_1512114 ) ) ( TRUCK-AT ?auto_1512119 ?auto_1512120 ) ( not ( = ?auto_1512120 ?auto_1512118 ) ) ( HOIST-AT ?auto_1512116 ?auto_1512120 ) ( not ( = ?auto_1512117 ?auto_1512116 ) ) ( AVAILABLE ?auto_1512116 ) ( SURFACE-AT ?auto_1512114 ?auto_1512120 ) ( ON ?auto_1512114 ?auto_1512121 ) ( CLEAR ?auto_1512114 ) ( not ( = ?auto_1512115 ?auto_1512121 ) ) ( not ( = ?auto_1512114 ?auto_1512121 ) ) ( not ( = ?auto_1512113 ?auto_1512121 ) ) ( ON ?auto_1512112 ?auto_1512111 ) ( ON ?auto_1512113 ?auto_1512112 ) ( not ( = ?auto_1512111 ?auto_1512112 ) ) ( not ( = ?auto_1512111 ?auto_1512113 ) ) ( not ( = ?auto_1512111 ?auto_1512115 ) ) ( not ( = ?auto_1512111 ?auto_1512114 ) ) ( not ( = ?auto_1512111 ?auto_1512121 ) ) ( not ( = ?auto_1512112 ?auto_1512113 ) ) ( not ( = ?auto_1512112 ?auto_1512115 ) ) ( not ( = ?auto_1512112 ?auto_1512114 ) ) ( not ( = ?auto_1512112 ?auto_1512121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512113 ?auto_1512115 ?auto_1512114 )
      ( MAKE-4CRATE-VERIFY ?auto_1512111 ?auto_1512112 ?auto_1512113 ?auto_1512115 ?auto_1512114 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512150 - SURFACE
      ?auto_1512151 - SURFACE
      ?auto_1512152 - SURFACE
      ?auto_1512154 - SURFACE
      ?auto_1512153 - SURFACE
    )
    :vars
    (
      ?auto_1512156 - HOIST
      ?auto_1512155 - PLACE
      ?auto_1512160 - PLACE
      ?auto_1512158 - HOIST
      ?auto_1512159 - SURFACE
      ?auto_1512157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512156 ?auto_1512155 ) ( SURFACE-AT ?auto_1512154 ?auto_1512155 ) ( CLEAR ?auto_1512154 ) ( IS-CRATE ?auto_1512153 ) ( not ( = ?auto_1512154 ?auto_1512153 ) ) ( AVAILABLE ?auto_1512156 ) ( ON ?auto_1512154 ?auto_1512152 ) ( not ( = ?auto_1512152 ?auto_1512154 ) ) ( not ( = ?auto_1512152 ?auto_1512153 ) ) ( not ( = ?auto_1512160 ?auto_1512155 ) ) ( HOIST-AT ?auto_1512158 ?auto_1512160 ) ( not ( = ?auto_1512156 ?auto_1512158 ) ) ( AVAILABLE ?auto_1512158 ) ( SURFACE-AT ?auto_1512153 ?auto_1512160 ) ( ON ?auto_1512153 ?auto_1512159 ) ( CLEAR ?auto_1512153 ) ( not ( = ?auto_1512154 ?auto_1512159 ) ) ( not ( = ?auto_1512153 ?auto_1512159 ) ) ( not ( = ?auto_1512152 ?auto_1512159 ) ) ( TRUCK-AT ?auto_1512157 ?auto_1512155 ) ( ON ?auto_1512151 ?auto_1512150 ) ( ON ?auto_1512152 ?auto_1512151 ) ( not ( = ?auto_1512150 ?auto_1512151 ) ) ( not ( = ?auto_1512150 ?auto_1512152 ) ) ( not ( = ?auto_1512150 ?auto_1512154 ) ) ( not ( = ?auto_1512150 ?auto_1512153 ) ) ( not ( = ?auto_1512150 ?auto_1512159 ) ) ( not ( = ?auto_1512151 ?auto_1512152 ) ) ( not ( = ?auto_1512151 ?auto_1512154 ) ) ( not ( = ?auto_1512151 ?auto_1512153 ) ) ( not ( = ?auto_1512151 ?auto_1512159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512152 ?auto_1512154 ?auto_1512153 )
      ( MAKE-4CRATE-VERIFY ?auto_1512150 ?auto_1512151 ?auto_1512152 ?auto_1512154 ?auto_1512153 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512189 - SURFACE
      ?auto_1512190 - SURFACE
      ?auto_1512191 - SURFACE
      ?auto_1512193 - SURFACE
      ?auto_1512192 - SURFACE
    )
    :vars
    (
      ?auto_1512194 - HOIST
      ?auto_1512198 - PLACE
      ?auto_1512195 - PLACE
      ?auto_1512197 - HOIST
      ?auto_1512199 - SURFACE
      ?auto_1512196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512194 ?auto_1512198 ) ( IS-CRATE ?auto_1512192 ) ( not ( = ?auto_1512193 ?auto_1512192 ) ) ( not ( = ?auto_1512191 ?auto_1512193 ) ) ( not ( = ?auto_1512191 ?auto_1512192 ) ) ( not ( = ?auto_1512195 ?auto_1512198 ) ) ( HOIST-AT ?auto_1512197 ?auto_1512195 ) ( not ( = ?auto_1512194 ?auto_1512197 ) ) ( AVAILABLE ?auto_1512197 ) ( SURFACE-AT ?auto_1512192 ?auto_1512195 ) ( ON ?auto_1512192 ?auto_1512199 ) ( CLEAR ?auto_1512192 ) ( not ( = ?auto_1512193 ?auto_1512199 ) ) ( not ( = ?auto_1512192 ?auto_1512199 ) ) ( not ( = ?auto_1512191 ?auto_1512199 ) ) ( TRUCK-AT ?auto_1512196 ?auto_1512198 ) ( SURFACE-AT ?auto_1512191 ?auto_1512198 ) ( CLEAR ?auto_1512191 ) ( LIFTING ?auto_1512194 ?auto_1512193 ) ( IS-CRATE ?auto_1512193 ) ( ON ?auto_1512190 ?auto_1512189 ) ( ON ?auto_1512191 ?auto_1512190 ) ( not ( = ?auto_1512189 ?auto_1512190 ) ) ( not ( = ?auto_1512189 ?auto_1512191 ) ) ( not ( = ?auto_1512189 ?auto_1512193 ) ) ( not ( = ?auto_1512189 ?auto_1512192 ) ) ( not ( = ?auto_1512189 ?auto_1512199 ) ) ( not ( = ?auto_1512190 ?auto_1512191 ) ) ( not ( = ?auto_1512190 ?auto_1512193 ) ) ( not ( = ?auto_1512190 ?auto_1512192 ) ) ( not ( = ?auto_1512190 ?auto_1512199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512191 ?auto_1512193 ?auto_1512192 )
      ( MAKE-4CRATE-VERIFY ?auto_1512189 ?auto_1512190 ?auto_1512191 ?auto_1512193 ?auto_1512192 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1512228 - SURFACE
      ?auto_1512229 - SURFACE
      ?auto_1512230 - SURFACE
      ?auto_1512232 - SURFACE
      ?auto_1512231 - SURFACE
    )
    :vars
    (
      ?auto_1512236 - HOIST
      ?auto_1512238 - PLACE
      ?auto_1512233 - PLACE
      ?auto_1512235 - HOIST
      ?auto_1512234 - SURFACE
      ?auto_1512237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512236 ?auto_1512238 ) ( IS-CRATE ?auto_1512231 ) ( not ( = ?auto_1512232 ?auto_1512231 ) ) ( not ( = ?auto_1512230 ?auto_1512232 ) ) ( not ( = ?auto_1512230 ?auto_1512231 ) ) ( not ( = ?auto_1512233 ?auto_1512238 ) ) ( HOIST-AT ?auto_1512235 ?auto_1512233 ) ( not ( = ?auto_1512236 ?auto_1512235 ) ) ( AVAILABLE ?auto_1512235 ) ( SURFACE-AT ?auto_1512231 ?auto_1512233 ) ( ON ?auto_1512231 ?auto_1512234 ) ( CLEAR ?auto_1512231 ) ( not ( = ?auto_1512232 ?auto_1512234 ) ) ( not ( = ?auto_1512231 ?auto_1512234 ) ) ( not ( = ?auto_1512230 ?auto_1512234 ) ) ( TRUCK-AT ?auto_1512237 ?auto_1512238 ) ( SURFACE-AT ?auto_1512230 ?auto_1512238 ) ( CLEAR ?auto_1512230 ) ( IS-CRATE ?auto_1512232 ) ( AVAILABLE ?auto_1512236 ) ( IN ?auto_1512232 ?auto_1512237 ) ( ON ?auto_1512229 ?auto_1512228 ) ( ON ?auto_1512230 ?auto_1512229 ) ( not ( = ?auto_1512228 ?auto_1512229 ) ) ( not ( = ?auto_1512228 ?auto_1512230 ) ) ( not ( = ?auto_1512228 ?auto_1512232 ) ) ( not ( = ?auto_1512228 ?auto_1512231 ) ) ( not ( = ?auto_1512228 ?auto_1512234 ) ) ( not ( = ?auto_1512229 ?auto_1512230 ) ) ( not ( = ?auto_1512229 ?auto_1512232 ) ) ( not ( = ?auto_1512229 ?auto_1512231 ) ) ( not ( = ?auto_1512229 ?auto_1512234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512230 ?auto_1512232 ?auto_1512231 )
      ( MAKE-4CRATE-VERIFY ?auto_1512228 ?auto_1512229 ?auto_1512230 ?auto_1512232 ?auto_1512231 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1512888 - SURFACE
      ?auto_1512889 - SURFACE
      ?auto_1512890 - SURFACE
      ?auto_1512892 - SURFACE
      ?auto_1512891 - SURFACE
      ?auto_1512893 - SURFACE
    )
    :vars
    (
      ?auto_1512895 - HOIST
      ?auto_1512894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512895 ?auto_1512894 ) ( SURFACE-AT ?auto_1512891 ?auto_1512894 ) ( CLEAR ?auto_1512891 ) ( LIFTING ?auto_1512895 ?auto_1512893 ) ( IS-CRATE ?auto_1512893 ) ( not ( = ?auto_1512891 ?auto_1512893 ) ) ( ON ?auto_1512889 ?auto_1512888 ) ( ON ?auto_1512890 ?auto_1512889 ) ( ON ?auto_1512892 ?auto_1512890 ) ( ON ?auto_1512891 ?auto_1512892 ) ( not ( = ?auto_1512888 ?auto_1512889 ) ) ( not ( = ?auto_1512888 ?auto_1512890 ) ) ( not ( = ?auto_1512888 ?auto_1512892 ) ) ( not ( = ?auto_1512888 ?auto_1512891 ) ) ( not ( = ?auto_1512888 ?auto_1512893 ) ) ( not ( = ?auto_1512889 ?auto_1512890 ) ) ( not ( = ?auto_1512889 ?auto_1512892 ) ) ( not ( = ?auto_1512889 ?auto_1512891 ) ) ( not ( = ?auto_1512889 ?auto_1512893 ) ) ( not ( = ?auto_1512890 ?auto_1512892 ) ) ( not ( = ?auto_1512890 ?auto_1512891 ) ) ( not ( = ?auto_1512890 ?auto_1512893 ) ) ( not ( = ?auto_1512892 ?auto_1512891 ) ) ( not ( = ?auto_1512892 ?auto_1512893 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512891 ?auto_1512893 )
      ( MAKE-5CRATE-VERIFY ?auto_1512888 ?auto_1512889 ?auto_1512890 ?auto_1512892 ?auto_1512891 ?auto_1512893 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1512922 - SURFACE
      ?auto_1512923 - SURFACE
      ?auto_1512924 - SURFACE
      ?auto_1512926 - SURFACE
      ?auto_1512925 - SURFACE
      ?auto_1512927 - SURFACE
    )
    :vars
    (
      ?auto_1512930 - HOIST
      ?auto_1512929 - PLACE
      ?auto_1512928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512930 ?auto_1512929 ) ( SURFACE-AT ?auto_1512925 ?auto_1512929 ) ( CLEAR ?auto_1512925 ) ( IS-CRATE ?auto_1512927 ) ( not ( = ?auto_1512925 ?auto_1512927 ) ) ( TRUCK-AT ?auto_1512928 ?auto_1512929 ) ( AVAILABLE ?auto_1512930 ) ( IN ?auto_1512927 ?auto_1512928 ) ( ON ?auto_1512925 ?auto_1512926 ) ( not ( = ?auto_1512926 ?auto_1512925 ) ) ( not ( = ?auto_1512926 ?auto_1512927 ) ) ( ON ?auto_1512923 ?auto_1512922 ) ( ON ?auto_1512924 ?auto_1512923 ) ( ON ?auto_1512926 ?auto_1512924 ) ( not ( = ?auto_1512922 ?auto_1512923 ) ) ( not ( = ?auto_1512922 ?auto_1512924 ) ) ( not ( = ?auto_1512922 ?auto_1512926 ) ) ( not ( = ?auto_1512922 ?auto_1512925 ) ) ( not ( = ?auto_1512922 ?auto_1512927 ) ) ( not ( = ?auto_1512923 ?auto_1512924 ) ) ( not ( = ?auto_1512923 ?auto_1512926 ) ) ( not ( = ?auto_1512923 ?auto_1512925 ) ) ( not ( = ?auto_1512923 ?auto_1512927 ) ) ( not ( = ?auto_1512924 ?auto_1512926 ) ) ( not ( = ?auto_1512924 ?auto_1512925 ) ) ( not ( = ?auto_1512924 ?auto_1512927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512926 ?auto_1512925 ?auto_1512927 )
      ( MAKE-5CRATE-VERIFY ?auto_1512922 ?auto_1512923 ?auto_1512924 ?auto_1512926 ?auto_1512925 ?auto_1512927 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1512962 - SURFACE
      ?auto_1512963 - SURFACE
      ?auto_1512964 - SURFACE
      ?auto_1512966 - SURFACE
      ?auto_1512965 - SURFACE
      ?auto_1512967 - SURFACE
    )
    :vars
    (
      ?auto_1512970 - HOIST
      ?auto_1512969 - PLACE
      ?auto_1512968 - TRUCK
      ?auto_1512971 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512970 ?auto_1512969 ) ( SURFACE-AT ?auto_1512965 ?auto_1512969 ) ( CLEAR ?auto_1512965 ) ( IS-CRATE ?auto_1512967 ) ( not ( = ?auto_1512965 ?auto_1512967 ) ) ( AVAILABLE ?auto_1512970 ) ( IN ?auto_1512967 ?auto_1512968 ) ( ON ?auto_1512965 ?auto_1512966 ) ( not ( = ?auto_1512966 ?auto_1512965 ) ) ( not ( = ?auto_1512966 ?auto_1512967 ) ) ( TRUCK-AT ?auto_1512968 ?auto_1512971 ) ( not ( = ?auto_1512971 ?auto_1512969 ) ) ( ON ?auto_1512963 ?auto_1512962 ) ( ON ?auto_1512964 ?auto_1512963 ) ( ON ?auto_1512966 ?auto_1512964 ) ( not ( = ?auto_1512962 ?auto_1512963 ) ) ( not ( = ?auto_1512962 ?auto_1512964 ) ) ( not ( = ?auto_1512962 ?auto_1512966 ) ) ( not ( = ?auto_1512962 ?auto_1512965 ) ) ( not ( = ?auto_1512962 ?auto_1512967 ) ) ( not ( = ?auto_1512963 ?auto_1512964 ) ) ( not ( = ?auto_1512963 ?auto_1512966 ) ) ( not ( = ?auto_1512963 ?auto_1512965 ) ) ( not ( = ?auto_1512963 ?auto_1512967 ) ) ( not ( = ?auto_1512964 ?auto_1512966 ) ) ( not ( = ?auto_1512964 ?auto_1512965 ) ) ( not ( = ?auto_1512964 ?auto_1512967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1512966 ?auto_1512965 ?auto_1512967 )
      ( MAKE-5CRATE-VERIFY ?auto_1512962 ?auto_1512963 ?auto_1512964 ?auto_1512966 ?auto_1512965 ?auto_1512967 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513007 - SURFACE
      ?auto_1513008 - SURFACE
      ?auto_1513009 - SURFACE
      ?auto_1513011 - SURFACE
      ?auto_1513010 - SURFACE
      ?auto_1513012 - SURFACE
    )
    :vars
    (
      ?auto_1513013 - HOIST
      ?auto_1513016 - PLACE
      ?auto_1513014 - TRUCK
      ?auto_1513017 - PLACE
      ?auto_1513015 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513013 ?auto_1513016 ) ( SURFACE-AT ?auto_1513010 ?auto_1513016 ) ( CLEAR ?auto_1513010 ) ( IS-CRATE ?auto_1513012 ) ( not ( = ?auto_1513010 ?auto_1513012 ) ) ( AVAILABLE ?auto_1513013 ) ( ON ?auto_1513010 ?auto_1513011 ) ( not ( = ?auto_1513011 ?auto_1513010 ) ) ( not ( = ?auto_1513011 ?auto_1513012 ) ) ( TRUCK-AT ?auto_1513014 ?auto_1513017 ) ( not ( = ?auto_1513017 ?auto_1513016 ) ) ( HOIST-AT ?auto_1513015 ?auto_1513017 ) ( LIFTING ?auto_1513015 ?auto_1513012 ) ( not ( = ?auto_1513013 ?auto_1513015 ) ) ( ON ?auto_1513008 ?auto_1513007 ) ( ON ?auto_1513009 ?auto_1513008 ) ( ON ?auto_1513011 ?auto_1513009 ) ( not ( = ?auto_1513007 ?auto_1513008 ) ) ( not ( = ?auto_1513007 ?auto_1513009 ) ) ( not ( = ?auto_1513007 ?auto_1513011 ) ) ( not ( = ?auto_1513007 ?auto_1513010 ) ) ( not ( = ?auto_1513007 ?auto_1513012 ) ) ( not ( = ?auto_1513008 ?auto_1513009 ) ) ( not ( = ?auto_1513008 ?auto_1513011 ) ) ( not ( = ?auto_1513008 ?auto_1513010 ) ) ( not ( = ?auto_1513008 ?auto_1513012 ) ) ( not ( = ?auto_1513009 ?auto_1513011 ) ) ( not ( = ?auto_1513009 ?auto_1513010 ) ) ( not ( = ?auto_1513009 ?auto_1513012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513011 ?auto_1513010 ?auto_1513012 )
      ( MAKE-5CRATE-VERIFY ?auto_1513007 ?auto_1513008 ?auto_1513009 ?auto_1513011 ?auto_1513010 ?auto_1513012 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513057 - SURFACE
      ?auto_1513058 - SURFACE
      ?auto_1513059 - SURFACE
      ?auto_1513061 - SURFACE
      ?auto_1513060 - SURFACE
      ?auto_1513062 - SURFACE
    )
    :vars
    (
      ?auto_1513066 - HOIST
      ?auto_1513065 - PLACE
      ?auto_1513063 - TRUCK
      ?auto_1513064 - PLACE
      ?auto_1513068 - HOIST
      ?auto_1513067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513066 ?auto_1513065 ) ( SURFACE-AT ?auto_1513060 ?auto_1513065 ) ( CLEAR ?auto_1513060 ) ( IS-CRATE ?auto_1513062 ) ( not ( = ?auto_1513060 ?auto_1513062 ) ) ( AVAILABLE ?auto_1513066 ) ( ON ?auto_1513060 ?auto_1513061 ) ( not ( = ?auto_1513061 ?auto_1513060 ) ) ( not ( = ?auto_1513061 ?auto_1513062 ) ) ( TRUCK-AT ?auto_1513063 ?auto_1513064 ) ( not ( = ?auto_1513064 ?auto_1513065 ) ) ( HOIST-AT ?auto_1513068 ?auto_1513064 ) ( not ( = ?auto_1513066 ?auto_1513068 ) ) ( AVAILABLE ?auto_1513068 ) ( SURFACE-AT ?auto_1513062 ?auto_1513064 ) ( ON ?auto_1513062 ?auto_1513067 ) ( CLEAR ?auto_1513062 ) ( not ( = ?auto_1513060 ?auto_1513067 ) ) ( not ( = ?auto_1513062 ?auto_1513067 ) ) ( not ( = ?auto_1513061 ?auto_1513067 ) ) ( ON ?auto_1513058 ?auto_1513057 ) ( ON ?auto_1513059 ?auto_1513058 ) ( ON ?auto_1513061 ?auto_1513059 ) ( not ( = ?auto_1513057 ?auto_1513058 ) ) ( not ( = ?auto_1513057 ?auto_1513059 ) ) ( not ( = ?auto_1513057 ?auto_1513061 ) ) ( not ( = ?auto_1513057 ?auto_1513060 ) ) ( not ( = ?auto_1513057 ?auto_1513062 ) ) ( not ( = ?auto_1513057 ?auto_1513067 ) ) ( not ( = ?auto_1513058 ?auto_1513059 ) ) ( not ( = ?auto_1513058 ?auto_1513061 ) ) ( not ( = ?auto_1513058 ?auto_1513060 ) ) ( not ( = ?auto_1513058 ?auto_1513062 ) ) ( not ( = ?auto_1513058 ?auto_1513067 ) ) ( not ( = ?auto_1513059 ?auto_1513061 ) ) ( not ( = ?auto_1513059 ?auto_1513060 ) ) ( not ( = ?auto_1513059 ?auto_1513062 ) ) ( not ( = ?auto_1513059 ?auto_1513067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513061 ?auto_1513060 ?auto_1513062 )
      ( MAKE-5CRATE-VERIFY ?auto_1513057 ?auto_1513058 ?auto_1513059 ?auto_1513061 ?auto_1513060 ?auto_1513062 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513108 - SURFACE
      ?auto_1513109 - SURFACE
      ?auto_1513110 - SURFACE
      ?auto_1513112 - SURFACE
      ?auto_1513111 - SURFACE
      ?auto_1513113 - SURFACE
    )
    :vars
    (
      ?auto_1513115 - HOIST
      ?auto_1513116 - PLACE
      ?auto_1513117 - PLACE
      ?auto_1513114 - HOIST
      ?auto_1513119 - SURFACE
      ?auto_1513118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513115 ?auto_1513116 ) ( SURFACE-AT ?auto_1513111 ?auto_1513116 ) ( CLEAR ?auto_1513111 ) ( IS-CRATE ?auto_1513113 ) ( not ( = ?auto_1513111 ?auto_1513113 ) ) ( AVAILABLE ?auto_1513115 ) ( ON ?auto_1513111 ?auto_1513112 ) ( not ( = ?auto_1513112 ?auto_1513111 ) ) ( not ( = ?auto_1513112 ?auto_1513113 ) ) ( not ( = ?auto_1513117 ?auto_1513116 ) ) ( HOIST-AT ?auto_1513114 ?auto_1513117 ) ( not ( = ?auto_1513115 ?auto_1513114 ) ) ( AVAILABLE ?auto_1513114 ) ( SURFACE-AT ?auto_1513113 ?auto_1513117 ) ( ON ?auto_1513113 ?auto_1513119 ) ( CLEAR ?auto_1513113 ) ( not ( = ?auto_1513111 ?auto_1513119 ) ) ( not ( = ?auto_1513113 ?auto_1513119 ) ) ( not ( = ?auto_1513112 ?auto_1513119 ) ) ( TRUCK-AT ?auto_1513118 ?auto_1513116 ) ( ON ?auto_1513109 ?auto_1513108 ) ( ON ?auto_1513110 ?auto_1513109 ) ( ON ?auto_1513112 ?auto_1513110 ) ( not ( = ?auto_1513108 ?auto_1513109 ) ) ( not ( = ?auto_1513108 ?auto_1513110 ) ) ( not ( = ?auto_1513108 ?auto_1513112 ) ) ( not ( = ?auto_1513108 ?auto_1513111 ) ) ( not ( = ?auto_1513108 ?auto_1513113 ) ) ( not ( = ?auto_1513108 ?auto_1513119 ) ) ( not ( = ?auto_1513109 ?auto_1513110 ) ) ( not ( = ?auto_1513109 ?auto_1513112 ) ) ( not ( = ?auto_1513109 ?auto_1513111 ) ) ( not ( = ?auto_1513109 ?auto_1513113 ) ) ( not ( = ?auto_1513109 ?auto_1513119 ) ) ( not ( = ?auto_1513110 ?auto_1513112 ) ) ( not ( = ?auto_1513110 ?auto_1513111 ) ) ( not ( = ?auto_1513110 ?auto_1513113 ) ) ( not ( = ?auto_1513110 ?auto_1513119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513112 ?auto_1513111 ?auto_1513113 )
      ( MAKE-5CRATE-VERIFY ?auto_1513108 ?auto_1513109 ?auto_1513110 ?auto_1513112 ?auto_1513111 ?auto_1513113 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513159 - SURFACE
      ?auto_1513160 - SURFACE
      ?auto_1513161 - SURFACE
      ?auto_1513163 - SURFACE
      ?auto_1513162 - SURFACE
      ?auto_1513164 - SURFACE
    )
    :vars
    (
      ?auto_1513168 - HOIST
      ?auto_1513165 - PLACE
      ?auto_1513170 - PLACE
      ?auto_1513169 - HOIST
      ?auto_1513166 - SURFACE
      ?auto_1513167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513168 ?auto_1513165 ) ( IS-CRATE ?auto_1513164 ) ( not ( = ?auto_1513162 ?auto_1513164 ) ) ( not ( = ?auto_1513163 ?auto_1513162 ) ) ( not ( = ?auto_1513163 ?auto_1513164 ) ) ( not ( = ?auto_1513170 ?auto_1513165 ) ) ( HOIST-AT ?auto_1513169 ?auto_1513170 ) ( not ( = ?auto_1513168 ?auto_1513169 ) ) ( AVAILABLE ?auto_1513169 ) ( SURFACE-AT ?auto_1513164 ?auto_1513170 ) ( ON ?auto_1513164 ?auto_1513166 ) ( CLEAR ?auto_1513164 ) ( not ( = ?auto_1513162 ?auto_1513166 ) ) ( not ( = ?auto_1513164 ?auto_1513166 ) ) ( not ( = ?auto_1513163 ?auto_1513166 ) ) ( TRUCK-AT ?auto_1513167 ?auto_1513165 ) ( SURFACE-AT ?auto_1513163 ?auto_1513165 ) ( CLEAR ?auto_1513163 ) ( LIFTING ?auto_1513168 ?auto_1513162 ) ( IS-CRATE ?auto_1513162 ) ( ON ?auto_1513160 ?auto_1513159 ) ( ON ?auto_1513161 ?auto_1513160 ) ( ON ?auto_1513163 ?auto_1513161 ) ( not ( = ?auto_1513159 ?auto_1513160 ) ) ( not ( = ?auto_1513159 ?auto_1513161 ) ) ( not ( = ?auto_1513159 ?auto_1513163 ) ) ( not ( = ?auto_1513159 ?auto_1513162 ) ) ( not ( = ?auto_1513159 ?auto_1513164 ) ) ( not ( = ?auto_1513159 ?auto_1513166 ) ) ( not ( = ?auto_1513160 ?auto_1513161 ) ) ( not ( = ?auto_1513160 ?auto_1513163 ) ) ( not ( = ?auto_1513160 ?auto_1513162 ) ) ( not ( = ?auto_1513160 ?auto_1513164 ) ) ( not ( = ?auto_1513160 ?auto_1513166 ) ) ( not ( = ?auto_1513161 ?auto_1513163 ) ) ( not ( = ?auto_1513161 ?auto_1513162 ) ) ( not ( = ?auto_1513161 ?auto_1513164 ) ) ( not ( = ?auto_1513161 ?auto_1513166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513163 ?auto_1513162 ?auto_1513164 )
      ( MAKE-5CRATE-VERIFY ?auto_1513159 ?auto_1513160 ?auto_1513161 ?auto_1513163 ?auto_1513162 ?auto_1513164 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1513210 - SURFACE
      ?auto_1513211 - SURFACE
      ?auto_1513212 - SURFACE
      ?auto_1513214 - SURFACE
      ?auto_1513213 - SURFACE
      ?auto_1513215 - SURFACE
    )
    :vars
    (
      ?auto_1513221 - HOIST
      ?auto_1513220 - PLACE
      ?auto_1513216 - PLACE
      ?auto_1513218 - HOIST
      ?auto_1513217 - SURFACE
      ?auto_1513219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513221 ?auto_1513220 ) ( IS-CRATE ?auto_1513215 ) ( not ( = ?auto_1513213 ?auto_1513215 ) ) ( not ( = ?auto_1513214 ?auto_1513213 ) ) ( not ( = ?auto_1513214 ?auto_1513215 ) ) ( not ( = ?auto_1513216 ?auto_1513220 ) ) ( HOIST-AT ?auto_1513218 ?auto_1513216 ) ( not ( = ?auto_1513221 ?auto_1513218 ) ) ( AVAILABLE ?auto_1513218 ) ( SURFACE-AT ?auto_1513215 ?auto_1513216 ) ( ON ?auto_1513215 ?auto_1513217 ) ( CLEAR ?auto_1513215 ) ( not ( = ?auto_1513213 ?auto_1513217 ) ) ( not ( = ?auto_1513215 ?auto_1513217 ) ) ( not ( = ?auto_1513214 ?auto_1513217 ) ) ( TRUCK-AT ?auto_1513219 ?auto_1513220 ) ( SURFACE-AT ?auto_1513214 ?auto_1513220 ) ( CLEAR ?auto_1513214 ) ( IS-CRATE ?auto_1513213 ) ( AVAILABLE ?auto_1513221 ) ( IN ?auto_1513213 ?auto_1513219 ) ( ON ?auto_1513211 ?auto_1513210 ) ( ON ?auto_1513212 ?auto_1513211 ) ( ON ?auto_1513214 ?auto_1513212 ) ( not ( = ?auto_1513210 ?auto_1513211 ) ) ( not ( = ?auto_1513210 ?auto_1513212 ) ) ( not ( = ?auto_1513210 ?auto_1513214 ) ) ( not ( = ?auto_1513210 ?auto_1513213 ) ) ( not ( = ?auto_1513210 ?auto_1513215 ) ) ( not ( = ?auto_1513210 ?auto_1513217 ) ) ( not ( = ?auto_1513211 ?auto_1513212 ) ) ( not ( = ?auto_1513211 ?auto_1513214 ) ) ( not ( = ?auto_1513211 ?auto_1513213 ) ) ( not ( = ?auto_1513211 ?auto_1513215 ) ) ( not ( = ?auto_1513211 ?auto_1513217 ) ) ( not ( = ?auto_1513212 ?auto_1513214 ) ) ( not ( = ?auto_1513212 ?auto_1513213 ) ) ( not ( = ?auto_1513212 ?auto_1513215 ) ) ( not ( = ?auto_1513212 ?auto_1513217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513214 ?auto_1513213 ?auto_1513215 )
      ( MAKE-5CRATE-VERIFY ?auto_1513210 ?auto_1513211 ?auto_1513212 ?auto_1513214 ?auto_1513213 ?auto_1513215 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514419 - SURFACE
      ?auto_1514420 - SURFACE
      ?auto_1514421 - SURFACE
      ?auto_1514423 - SURFACE
      ?auto_1514422 - SURFACE
      ?auto_1514424 - SURFACE
      ?auto_1514425 - SURFACE
    )
    :vars
    (
      ?auto_1514427 - HOIST
      ?auto_1514426 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514427 ?auto_1514426 ) ( SURFACE-AT ?auto_1514424 ?auto_1514426 ) ( CLEAR ?auto_1514424 ) ( LIFTING ?auto_1514427 ?auto_1514425 ) ( IS-CRATE ?auto_1514425 ) ( not ( = ?auto_1514424 ?auto_1514425 ) ) ( ON ?auto_1514420 ?auto_1514419 ) ( ON ?auto_1514421 ?auto_1514420 ) ( ON ?auto_1514423 ?auto_1514421 ) ( ON ?auto_1514422 ?auto_1514423 ) ( ON ?auto_1514424 ?auto_1514422 ) ( not ( = ?auto_1514419 ?auto_1514420 ) ) ( not ( = ?auto_1514419 ?auto_1514421 ) ) ( not ( = ?auto_1514419 ?auto_1514423 ) ) ( not ( = ?auto_1514419 ?auto_1514422 ) ) ( not ( = ?auto_1514419 ?auto_1514424 ) ) ( not ( = ?auto_1514419 ?auto_1514425 ) ) ( not ( = ?auto_1514420 ?auto_1514421 ) ) ( not ( = ?auto_1514420 ?auto_1514423 ) ) ( not ( = ?auto_1514420 ?auto_1514422 ) ) ( not ( = ?auto_1514420 ?auto_1514424 ) ) ( not ( = ?auto_1514420 ?auto_1514425 ) ) ( not ( = ?auto_1514421 ?auto_1514423 ) ) ( not ( = ?auto_1514421 ?auto_1514422 ) ) ( not ( = ?auto_1514421 ?auto_1514424 ) ) ( not ( = ?auto_1514421 ?auto_1514425 ) ) ( not ( = ?auto_1514423 ?auto_1514422 ) ) ( not ( = ?auto_1514423 ?auto_1514424 ) ) ( not ( = ?auto_1514423 ?auto_1514425 ) ) ( not ( = ?auto_1514422 ?auto_1514424 ) ) ( not ( = ?auto_1514422 ?auto_1514425 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1514424 ?auto_1514425 )
      ( MAKE-6CRATE-VERIFY ?auto_1514419 ?auto_1514420 ?auto_1514421 ?auto_1514423 ?auto_1514422 ?auto_1514424 ?auto_1514425 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514463 - SURFACE
      ?auto_1514464 - SURFACE
      ?auto_1514465 - SURFACE
      ?auto_1514467 - SURFACE
      ?auto_1514466 - SURFACE
      ?auto_1514468 - SURFACE
      ?auto_1514469 - SURFACE
    )
    :vars
    (
      ?auto_1514470 - HOIST
      ?auto_1514472 - PLACE
      ?auto_1514471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514470 ?auto_1514472 ) ( SURFACE-AT ?auto_1514468 ?auto_1514472 ) ( CLEAR ?auto_1514468 ) ( IS-CRATE ?auto_1514469 ) ( not ( = ?auto_1514468 ?auto_1514469 ) ) ( TRUCK-AT ?auto_1514471 ?auto_1514472 ) ( AVAILABLE ?auto_1514470 ) ( IN ?auto_1514469 ?auto_1514471 ) ( ON ?auto_1514468 ?auto_1514466 ) ( not ( = ?auto_1514466 ?auto_1514468 ) ) ( not ( = ?auto_1514466 ?auto_1514469 ) ) ( ON ?auto_1514464 ?auto_1514463 ) ( ON ?auto_1514465 ?auto_1514464 ) ( ON ?auto_1514467 ?auto_1514465 ) ( ON ?auto_1514466 ?auto_1514467 ) ( not ( = ?auto_1514463 ?auto_1514464 ) ) ( not ( = ?auto_1514463 ?auto_1514465 ) ) ( not ( = ?auto_1514463 ?auto_1514467 ) ) ( not ( = ?auto_1514463 ?auto_1514466 ) ) ( not ( = ?auto_1514463 ?auto_1514468 ) ) ( not ( = ?auto_1514463 ?auto_1514469 ) ) ( not ( = ?auto_1514464 ?auto_1514465 ) ) ( not ( = ?auto_1514464 ?auto_1514467 ) ) ( not ( = ?auto_1514464 ?auto_1514466 ) ) ( not ( = ?auto_1514464 ?auto_1514468 ) ) ( not ( = ?auto_1514464 ?auto_1514469 ) ) ( not ( = ?auto_1514465 ?auto_1514467 ) ) ( not ( = ?auto_1514465 ?auto_1514466 ) ) ( not ( = ?auto_1514465 ?auto_1514468 ) ) ( not ( = ?auto_1514465 ?auto_1514469 ) ) ( not ( = ?auto_1514467 ?auto_1514466 ) ) ( not ( = ?auto_1514467 ?auto_1514468 ) ) ( not ( = ?auto_1514467 ?auto_1514469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514466 ?auto_1514468 ?auto_1514469 )
      ( MAKE-6CRATE-VERIFY ?auto_1514463 ?auto_1514464 ?auto_1514465 ?auto_1514467 ?auto_1514466 ?auto_1514468 ?auto_1514469 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514514 - SURFACE
      ?auto_1514515 - SURFACE
      ?auto_1514516 - SURFACE
      ?auto_1514518 - SURFACE
      ?auto_1514517 - SURFACE
      ?auto_1514519 - SURFACE
      ?auto_1514520 - SURFACE
    )
    :vars
    (
      ?auto_1514522 - HOIST
      ?auto_1514523 - PLACE
      ?auto_1514524 - TRUCK
      ?auto_1514521 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514522 ?auto_1514523 ) ( SURFACE-AT ?auto_1514519 ?auto_1514523 ) ( CLEAR ?auto_1514519 ) ( IS-CRATE ?auto_1514520 ) ( not ( = ?auto_1514519 ?auto_1514520 ) ) ( AVAILABLE ?auto_1514522 ) ( IN ?auto_1514520 ?auto_1514524 ) ( ON ?auto_1514519 ?auto_1514517 ) ( not ( = ?auto_1514517 ?auto_1514519 ) ) ( not ( = ?auto_1514517 ?auto_1514520 ) ) ( TRUCK-AT ?auto_1514524 ?auto_1514521 ) ( not ( = ?auto_1514521 ?auto_1514523 ) ) ( ON ?auto_1514515 ?auto_1514514 ) ( ON ?auto_1514516 ?auto_1514515 ) ( ON ?auto_1514518 ?auto_1514516 ) ( ON ?auto_1514517 ?auto_1514518 ) ( not ( = ?auto_1514514 ?auto_1514515 ) ) ( not ( = ?auto_1514514 ?auto_1514516 ) ) ( not ( = ?auto_1514514 ?auto_1514518 ) ) ( not ( = ?auto_1514514 ?auto_1514517 ) ) ( not ( = ?auto_1514514 ?auto_1514519 ) ) ( not ( = ?auto_1514514 ?auto_1514520 ) ) ( not ( = ?auto_1514515 ?auto_1514516 ) ) ( not ( = ?auto_1514515 ?auto_1514518 ) ) ( not ( = ?auto_1514515 ?auto_1514517 ) ) ( not ( = ?auto_1514515 ?auto_1514519 ) ) ( not ( = ?auto_1514515 ?auto_1514520 ) ) ( not ( = ?auto_1514516 ?auto_1514518 ) ) ( not ( = ?auto_1514516 ?auto_1514517 ) ) ( not ( = ?auto_1514516 ?auto_1514519 ) ) ( not ( = ?auto_1514516 ?auto_1514520 ) ) ( not ( = ?auto_1514518 ?auto_1514517 ) ) ( not ( = ?auto_1514518 ?auto_1514519 ) ) ( not ( = ?auto_1514518 ?auto_1514520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514517 ?auto_1514519 ?auto_1514520 )
      ( MAKE-6CRATE-VERIFY ?auto_1514514 ?auto_1514515 ?auto_1514516 ?auto_1514518 ?auto_1514517 ?auto_1514519 ?auto_1514520 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514571 - SURFACE
      ?auto_1514572 - SURFACE
      ?auto_1514573 - SURFACE
      ?auto_1514575 - SURFACE
      ?auto_1514574 - SURFACE
      ?auto_1514576 - SURFACE
      ?auto_1514577 - SURFACE
    )
    :vars
    (
      ?auto_1514582 - HOIST
      ?auto_1514581 - PLACE
      ?auto_1514578 - TRUCK
      ?auto_1514579 - PLACE
      ?auto_1514580 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514582 ?auto_1514581 ) ( SURFACE-AT ?auto_1514576 ?auto_1514581 ) ( CLEAR ?auto_1514576 ) ( IS-CRATE ?auto_1514577 ) ( not ( = ?auto_1514576 ?auto_1514577 ) ) ( AVAILABLE ?auto_1514582 ) ( ON ?auto_1514576 ?auto_1514574 ) ( not ( = ?auto_1514574 ?auto_1514576 ) ) ( not ( = ?auto_1514574 ?auto_1514577 ) ) ( TRUCK-AT ?auto_1514578 ?auto_1514579 ) ( not ( = ?auto_1514579 ?auto_1514581 ) ) ( HOIST-AT ?auto_1514580 ?auto_1514579 ) ( LIFTING ?auto_1514580 ?auto_1514577 ) ( not ( = ?auto_1514582 ?auto_1514580 ) ) ( ON ?auto_1514572 ?auto_1514571 ) ( ON ?auto_1514573 ?auto_1514572 ) ( ON ?auto_1514575 ?auto_1514573 ) ( ON ?auto_1514574 ?auto_1514575 ) ( not ( = ?auto_1514571 ?auto_1514572 ) ) ( not ( = ?auto_1514571 ?auto_1514573 ) ) ( not ( = ?auto_1514571 ?auto_1514575 ) ) ( not ( = ?auto_1514571 ?auto_1514574 ) ) ( not ( = ?auto_1514571 ?auto_1514576 ) ) ( not ( = ?auto_1514571 ?auto_1514577 ) ) ( not ( = ?auto_1514572 ?auto_1514573 ) ) ( not ( = ?auto_1514572 ?auto_1514575 ) ) ( not ( = ?auto_1514572 ?auto_1514574 ) ) ( not ( = ?auto_1514572 ?auto_1514576 ) ) ( not ( = ?auto_1514572 ?auto_1514577 ) ) ( not ( = ?auto_1514573 ?auto_1514575 ) ) ( not ( = ?auto_1514573 ?auto_1514574 ) ) ( not ( = ?auto_1514573 ?auto_1514576 ) ) ( not ( = ?auto_1514573 ?auto_1514577 ) ) ( not ( = ?auto_1514575 ?auto_1514574 ) ) ( not ( = ?auto_1514575 ?auto_1514576 ) ) ( not ( = ?auto_1514575 ?auto_1514577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514574 ?auto_1514576 ?auto_1514577 )
      ( MAKE-6CRATE-VERIFY ?auto_1514571 ?auto_1514572 ?auto_1514573 ?auto_1514575 ?auto_1514574 ?auto_1514576 ?auto_1514577 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514634 - SURFACE
      ?auto_1514635 - SURFACE
      ?auto_1514636 - SURFACE
      ?auto_1514638 - SURFACE
      ?auto_1514637 - SURFACE
      ?auto_1514639 - SURFACE
      ?auto_1514640 - SURFACE
    )
    :vars
    (
      ?auto_1514646 - HOIST
      ?auto_1514642 - PLACE
      ?auto_1514645 - TRUCK
      ?auto_1514643 - PLACE
      ?auto_1514644 - HOIST
      ?auto_1514641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514646 ?auto_1514642 ) ( SURFACE-AT ?auto_1514639 ?auto_1514642 ) ( CLEAR ?auto_1514639 ) ( IS-CRATE ?auto_1514640 ) ( not ( = ?auto_1514639 ?auto_1514640 ) ) ( AVAILABLE ?auto_1514646 ) ( ON ?auto_1514639 ?auto_1514637 ) ( not ( = ?auto_1514637 ?auto_1514639 ) ) ( not ( = ?auto_1514637 ?auto_1514640 ) ) ( TRUCK-AT ?auto_1514645 ?auto_1514643 ) ( not ( = ?auto_1514643 ?auto_1514642 ) ) ( HOIST-AT ?auto_1514644 ?auto_1514643 ) ( not ( = ?auto_1514646 ?auto_1514644 ) ) ( AVAILABLE ?auto_1514644 ) ( SURFACE-AT ?auto_1514640 ?auto_1514643 ) ( ON ?auto_1514640 ?auto_1514641 ) ( CLEAR ?auto_1514640 ) ( not ( = ?auto_1514639 ?auto_1514641 ) ) ( not ( = ?auto_1514640 ?auto_1514641 ) ) ( not ( = ?auto_1514637 ?auto_1514641 ) ) ( ON ?auto_1514635 ?auto_1514634 ) ( ON ?auto_1514636 ?auto_1514635 ) ( ON ?auto_1514638 ?auto_1514636 ) ( ON ?auto_1514637 ?auto_1514638 ) ( not ( = ?auto_1514634 ?auto_1514635 ) ) ( not ( = ?auto_1514634 ?auto_1514636 ) ) ( not ( = ?auto_1514634 ?auto_1514638 ) ) ( not ( = ?auto_1514634 ?auto_1514637 ) ) ( not ( = ?auto_1514634 ?auto_1514639 ) ) ( not ( = ?auto_1514634 ?auto_1514640 ) ) ( not ( = ?auto_1514634 ?auto_1514641 ) ) ( not ( = ?auto_1514635 ?auto_1514636 ) ) ( not ( = ?auto_1514635 ?auto_1514638 ) ) ( not ( = ?auto_1514635 ?auto_1514637 ) ) ( not ( = ?auto_1514635 ?auto_1514639 ) ) ( not ( = ?auto_1514635 ?auto_1514640 ) ) ( not ( = ?auto_1514635 ?auto_1514641 ) ) ( not ( = ?auto_1514636 ?auto_1514638 ) ) ( not ( = ?auto_1514636 ?auto_1514637 ) ) ( not ( = ?auto_1514636 ?auto_1514639 ) ) ( not ( = ?auto_1514636 ?auto_1514640 ) ) ( not ( = ?auto_1514636 ?auto_1514641 ) ) ( not ( = ?auto_1514638 ?auto_1514637 ) ) ( not ( = ?auto_1514638 ?auto_1514639 ) ) ( not ( = ?auto_1514638 ?auto_1514640 ) ) ( not ( = ?auto_1514638 ?auto_1514641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514637 ?auto_1514639 ?auto_1514640 )
      ( MAKE-6CRATE-VERIFY ?auto_1514634 ?auto_1514635 ?auto_1514636 ?auto_1514638 ?auto_1514637 ?auto_1514639 ?auto_1514640 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514698 - SURFACE
      ?auto_1514699 - SURFACE
      ?auto_1514700 - SURFACE
      ?auto_1514702 - SURFACE
      ?auto_1514701 - SURFACE
      ?auto_1514703 - SURFACE
      ?auto_1514704 - SURFACE
    )
    :vars
    (
      ?auto_1514710 - HOIST
      ?auto_1514707 - PLACE
      ?auto_1514705 - PLACE
      ?auto_1514706 - HOIST
      ?auto_1514708 - SURFACE
      ?auto_1514709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514710 ?auto_1514707 ) ( SURFACE-AT ?auto_1514703 ?auto_1514707 ) ( CLEAR ?auto_1514703 ) ( IS-CRATE ?auto_1514704 ) ( not ( = ?auto_1514703 ?auto_1514704 ) ) ( AVAILABLE ?auto_1514710 ) ( ON ?auto_1514703 ?auto_1514701 ) ( not ( = ?auto_1514701 ?auto_1514703 ) ) ( not ( = ?auto_1514701 ?auto_1514704 ) ) ( not ( = ?auto_1514705 ?auto_1514707 ) ) ( HOIST-AT ?auto_1514706 ?auto_1514705 ) ( not ( = ?auto_1514710 ?auto_1514706 ) ) ( AVAILABLE ?auto_1514706 ) ( SURFACE-AT ?auto_1514704 ?auto_1514705 ) ( ON ?auto_1514704 ?auto_1514708 ) ( CLEAR ?auto_1514704 ) ( not ( = ?auto_1514703 ?auto_1514708 ) ) ( not ( = ?auto_1514704 ?auto_1514708 ) ) ( not ( = ?auto_1514701 ?auto_1514708 ) ) ( TRUCK-AT ?auto_1514709 ?auto_1514707 ) ( ON ?auto_1514699 ?auto_1514698 ) ( ON ?auto_1514700 ?auto_1514699 ) ( ON ?auto_1514702 ?auto_1514700 ) ( ON ?auto_1514701 ?auto_1514702 ) ( not ( = ?auto_1514698 ?auto_1514699 ) ) ( not ( = ?auto_1514698 ?auto_1514700 ) ) ( not ( = ?auto_1514698 ?auto_1514702 ) ) ( not ( = ?auto_1514698 ?auto_1514701 ) ) ( not ( = ?auto_1514698 ?auto_1514703 ) ) ( not ( = ?auto_1514698 ?auto_1514704 ) ) ( not ( = ?auto_1514698 ?auto_1514708 ) ) ( not ( = ?auto_1514699 ?auto_1514700 ) ) ( not ( = ?auto_1514699 ?auto_1514702 ) ) ( not ( = ?auto_1514699 ?auto_1514701 ) ) ( not ( = ?auto_1514699 ?auto_1514703 ) ) ( not ( = ?auto_1514699 ?auto_1514704 ) ) ( not ( = ?auto_1514699 ?auto_1514708 ) ) ( not ( = ?auto_1514700 ?auto_1514702 ) ) ( not ( = ?auto_1514700 ?auto_1514701 ) ) ( not ( = ?auto_1514700 ?auto_1514703 ) ) ( not ( = ?auto_1514700 ?auto_1514704 ) ) ( not ( = ?auto_1514700 ?auto_1514708 ) ) ( not ( = ?auto_1514702 ?auto_1514701 ) ) ( not ( = ?auto_1514702 ?auto_1514703 ) ) ( not ( = ?auto_1514702 ?auto_1514704 ) ) ( not ( = ?auto_1514702 ?auto_1514708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514701 ?auto_1514703 ?auto_1514704 )
      ( MAKE-6CRATE-VERIFY ?auto_1514698 ?auto_1514699 ?auto_1514700 ?auto_1514702 ?auto_1514701 ?auto_1514703 ?auto_1514704 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514762 - SURFACE
      ?auto_1514763 - SURFACE
      ?auto_1514764 - SURFACE
      ?auto_1514766 - SURFACE
      ?auto_1514765 - SURFACE
      ?auto_1514767 - SURFACE
      ?auto_1514768 - SURFACE
    )
    :vars
    (
      ?auto_1514771 - HOIST
      ?auto_1514770 - PLACE
      ?auto_1514774 - PLACE
      ?auto_1514769 - HOIST
      ?auto_1514772 - SURFACE
      ?auto_1514773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514771 ?auto_1514770 ) ( IS-CRATE ?auto_1514768 ) ( not ( = ?auto_1514767 ?auto_1514768 ) ) ( not ( = ?auto_1514765 ?auto_1514767 ) ) ( not ( = ?auto_1514765 ?auto_1514768 ) ) ( not ( = ?auto_1514774 ?auto_1514770 ) ) ( HOIST-AT ?auto_1514769 ?auto_1514774 ) ( not ( = ?auto_1514771 ?auto_1514769 ) ) ( AVAILABLE ?auto_1514769 ) ( SURFACE-AT ?auto_1514768 ?auto_1514774 ) ( ON ?auto_1514768 ?auto_1514772 ) ( CLEAR ?auto_1514768 ) ( not ( = ?auto_1514767 ?auto_1514772 ) ) ( not ( = ?auto_1514768 ?auto_1514772 ) ) ( not ( = ?auto_1514765 ?auto_1514772 ) ) ( TRUCK-AT ?auto_1514773 ?auto_1514770 ) ( SURFACE-AT ?auto_1514765 ?auto_1514770 ) ( CLEAR ?auto_1514765 ) ( LIFTING ?auto_1514771 ?auto_1514767 ) ( IS-CRATE ?auto_1514767 ) ( ON ?auto_1514763 ?auto_1514762 ) ( ON ?auto_1514764 ?auto_1514763 ) ( ON ?auto_1514766 ?auto_1514764 ) ( ON ?auto_1514765 ?auto_1514766 ) ( not ( = ?auto_1514762 ?auto_1514763 ) ) ( not ( = ?auto_1514762 ?auto_1514764 ) ) ( not ( = ?auto_1514762 ?auto_1514766 ) ) ( not ( = ?auto_1514762 ?auto_1514765 ) ) ( not ( = ?auto_1514762 ?auto_1514767 ) ) ( not ( = ?auto_1514762 ?auto_1514768 ) ) ( not ( = ?auto_1514762 ?auto_1514772 ) ) ( not ( = ?auto_1514763 ?auto_1514764 ) ) ( not ( = ?auto_1514763 ?auto_1514766 ) ) ( not ( = ?auto_1514763 ?auto_1514765 ) ) ( not ( = ?auto_1514763 ?auto_1514767 ) ) ( not ( = ?auto_1514763 ?auto_1514768 ) ) ( not ( = ?auto_1514763 ?auto_1514772 ) ) ( not ( = ?auto_1514764 ?auto_1514766 ) ) ( not ( = ?auto_1514764 ?auto_1514765 ) ) ( not ( = ?auto_1514764 ?auto_1514767 ) ) ( not ( = ?auto_1514764 ?auto_1514768 ) ) ( not ( = ?auto_1514764 ?auto_1514772 ) ) ( not ( = ?auto_1514766 ?auto_1514765 ) ) ( not ( = ?auto_1514766 ?auto_1514767 ) ) ( not ( = ?auto_1514766 ?auto_1514768 ) ) ( not ( = ?auto_1514766 ?auto_1514772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514765 ?auto_1514767 ?auto_1514768 )
      ( MAKE-6CRATE-VERIFY ?auto_1514762 ?auto_1514763 ?auto_1514764 ?auto_1514766 ?auto_1514765 ?auto_1514767 ?auto_1514768 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1514826 - SURFACE
      ?auto_1514827 - SURFACE
      ?auto_1514828 - SURFACE
      ?auto_1514830 - SURFACE
      ?auto_1514829 - SURFACE
      ?auto_1514831 - SURFACE
      ?auto_1514832 - SURFACE
    )
    :vars
    (
      ?auto_1514833 - HOIST
      ?auto_1514836 - PLACE
      ?auto_1514837 - PLACE
      ?auto_1514834 - HOIST
      ?auto_1514838 - SURFACE
      ?auto_1514835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514833 ?auto_1514836 ) ( IS-CRATE ?auto_1514832 ) ( not ( = ?auto_1514831 ?auto_1514832 ) ) ( not ( = ?auto_1514829 ?auto_1514831 ) ) ( not ( = ?auto_1514829 ?auto_1514832 ) ) ( not ( = ?auto_1514837 ?auto_1514836 ) ) ( HOIST-AT ?auto_1514834 ?auto_1514837 ) ( not ( = ?auto_1514833 ?auto_1514834 ) ) ( AVAILABLE ?auto_1514834 ) ( SURFACE-AT ?auto_1514832 ?auto_1514837 ) ( ON ?auto_1514832 ?auto_1514838 ) ( CLEAR ?auto_1514832 ) ( not ( = ?auto_1514831 ?auto_1514838 ) ) ( not ( = ?auto_1514832 ?auto_1514838 ) ) ( not ( = ?auto_1514829 ?auto_1514838 ) ) ( TRUCK-AT ?auto_1514835 ?auto_1514836 ) ( SURFACE-AT ?auto_1514829 ?auto_1514836 ) ( CLEAR ?auto_1514829 ) ( IS-CRATE ?auto_1514831 ) ( AVAILABLE ?auto_1514833 ) ( IN ?auto_1514831 ?auto_1514835 ) ( ON ?auto_1514827 ?auto_1514826 ) ( ON ?auto_1514828 ?auto_1514827 ) ( ON ?auto_1514830 ?auto_1514828 ) ( ON ?auto_1514829 ?auto_1514830 ) ( not ( = ?auto_1514826 ?auto_1514827 ) ) ( not ( = ?auto_1514826 ?auto_1514828 ) ) ( not ( = ?auto_1514826 ?auto_1514830 ) ) ( not ( = ?auto_1514826 ?auto_1514829 ) ) ( not ( = ?auto_1514826 ?auto_1514831 ) ) ( not ( = ?auto_1514826 ?auto_1514832 ) ) ( not ( = ?auto_1514826 ?auto_1514838 ) ) ( not ( = ?auto_1514827 ?auto_1514828 ) ) ( not ( = ?auto_1514827 ?auto_1514830 ) ) ( not ( = ?auto_1514827 ?auto_1514829 ) ) ( not ( = ?auto_1514827 ?auto_1514831 ) ) ( not ( = ?auto_1514827 ?auto_1514832 ) ) ( not ( = ?auto_1514827 ?auto_1514838 ) ) ( not ( = ?auto_1514828 ?auto_1514830 ) ) ( not ( = ?auto_1514828 ?auto_1514829 ) ) ( not ( = ?auto_1514828 ?auto_1514831 ) ) ( not ( = ?auto_1514828 ?auto_1514832 ) ) ( not ( = ?auto_1514828 ?auto_1514838 ) ) ( not ( = ?auto_1514830 ?auto_1514829 ) ) ( not ( = ?auto_1514830 ?auto_1514831 ) ) ( not ( = ?auto_1514830 ?auto_1514832 ) ) ( not ( = ?auto_1514830 ?auto_1514838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514829 ?auto_1514831 ?auto_1514832 )
      ( MAKE-6CRATE-VERIFY ?auto_1514826 ?auto_1514827 ?auto_1514828 ?auto_1514830 ?auto_1514829 ?auto_1514831 ?auto_1514832 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1516782 - SURFACE
      ?auto_1516783 - SURFACE
      ?auto_1516784 - SURFACE
      ?auto_1516786 - SURFACE
      ?auto_1516785 - SURFACE
      ?auto_1516787 - SURFACE
      ?auto_1516788 - SURFACE
      ?auto_1516789 - SURFACE
    )
    :vars
    (
      ?auto_1516791 - HOIST
      ?auto_1516790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516791 ?auto_1516790 ) ( SURFACE-AT ?auto_1516788 ?auto_1516790 ) ( CLEAR ?auto_1516788 ) ( LIFTING ?auto_1516791 ?auto_1516789 ) ( IS-CRATE ?auto_1516789 ) ( not ( = ?auto_1516788 ?auto_1516789 ) ) ( ON ?auto_1516783 ?auto_1516782 ) ( ON ?auto_1516784 ?auto_1516783 ) ( ON ?auto_1516786 ?auto_1516784 ) ( ON ?auto_1516785 ?auto_1516786 ) ( ON ?auto_1516787 ?auto_1516785 ) ( ON ?auto_1516788 ?auto_1516787 ) ( not ( = ?auto_1516782 ?auto_1516783 ) ) ( not ( = ?auto_1516782 ?auto_1516784 ) ) ( not ( = ?auto_1516782 ?auto_1516786 ) ) ( not ( = ?auto_1516782 ?auto_1516785 ) ) ( not ( = ?auto_1516782 ?auto_1516787 ) ) ( not ( = ?auto_1516782 ?auto_1516788 ) ) ( not ( = ?auto_1516782 ?auto_1516789 ) ) ( not ( = ?auto_1516783 ?auto_1516784 ) ) ( not ( = ?auto_1516783 ?auto_1516786 ) ) ( not ( = ?auto_1516783 ?auto_1516785 ) ) ( not ( = ?auto_1516783 ?auto_1516787 ) ) ( not ( = ?auto_1516783 ?auto_1516788 ) ) ( not ( = ?auto_1516783 ?auto_1516789 ) ) ( not ( = ?auto_1516784 ?auto_1516786 ) ) ( not ( = ?auto_1516784 ?auto_1516785 ) ) ( not ( = ?auto_1516784 ?auto_1516787 ) ) ( not ( = ?auto_1516784 ?auto_1516788 ) ) ( not ( = ?auto_1516784 ?auto_1516789 ) ) ( not ( = ?auto_1516786 ?auto_1516785 ) ) ( not ( = ?auto_1516786 ?auto_1516787 ) ) ( not ( = ?auto_1516786 ?auto_1516788 ) ) ( not ( = ?auto_1516786 ?auto_1516789 ) ) ( not ( = ?auto_1516785 ?auto_1516787 ) ) ( not ( = ?auto_1516785 ?auto_1516788 ) ) ( not ( = ?auto_1516785 ?auto_1516789 ) ) ( not ( = ?auto_1516787 ?auto_1516788 ) ) ( not ( = ?auto_1516787 ?auto_1516789 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1516788 ?auto_1516789 )
      ( MAKE-7CRATE-VERIFY ?auto_1516782 ?auto_1516783 ?auto_1516784 ?auto_1516786 ?auto_1516785 ?auto_1516787 ?auto_1516788 ?auto_1516789 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1516837 - SURFACE
      ?auto_1516838 - SURFACE
      ?auto_1516839 - SURFACE
      ?auto_1516841 - SURFACE
      ?auto_1516840 - SURFACE
      ?auto_1516842 - SURFACE
      ?auto_1516843 - SURFACE
      ?auto_1516844 - SURFACE
    )
    :vars
    (
      ?auto_1516847 - HOIST
      ?auto_1516846 - PLACE
      ?auto_1516845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516847 ?auto_1516846 ) ( SURFACE-AT ?auto_1516843 ?auto_1516846 ) ( CLEAR ?auto_1516843 ) ( IS-CRATE ?auto_1516844 ) ( not ( = ?auto_1516843 ?auto_1516844 ) ) ( TRUCK-AT ?auto_1516845 ?auto_1516846 ) ( AVAILABLE ?auto_1516847 ) ( IN ?auto_1516844 ?auto_1516845 ) ( ON ?auto_1516843 ?auto_1516842 ) ( not ( = ?auto_1516842 ?auto_1516843 ) ) ( not ( = ?auto_1516842 ?auto_1516844 ) ) ( ON ?auto_1516838 ?auto_1516837 ) ( ON ?auto_1516839 ?auto_1516838 ) ( ON ?auto_1516841 ?auto_1516839 ) ( ON ?auto_1516840 ?auto_1516841 ) ( ON ?auto_1516842 ?auto_1516840 ) ( not ( = ?auto_1516837 ?auto_1516838 ) ) ( not ( = ?auto_1516837 ?auto_1516839 ) ) ( not ( = ?auto_1516837 ?auto_1516841 ) ) ( not ( = ?auto_1516837 ?auto_1516840 ) ) ( not ( = ?auto_1516837 ?auto_1516842 ) ) ( not ( = ?auto_1516837 ?auto_1516843 ) ) ( not ( = ?auto_1516837 ?auto_1516844 ) ) ( not ( = ?auto_1516838 ?auto_1516839 ) ) ( not ( = ?auto_1516838 ?auto_1516841 ) ) ( not ( = ?auto_1516838 ?auto_1516840 ) ) ( not ( = ?auto_1516838 ?auto_1516842 ) ) ( not ( = ?auto_1516838 ?auto_1516843 ) ) ( not ( = ?auto_1516838 ?auto_1516844 ) ) ( not ( = ?auto_1516839 ?auto_1516841 ) ) ( not ( = ?auto_1516839 ?auto_1516840 ) ) ( not ( = ?auto_1516839 ?auto_1516842 ) ) ( not ( = ?auto_1516839 ?auto_1516843 ) ) ( not ( = ?auto_1516839 ?auto_1516844 ) ) ( not ( = ?auto_1516841 ?auto_1516840 ) ) ( not ( = ?auto_1516841 ?auto_1516842 ) ) ( not ( = ?auto_1516841 ?auto_1516843 ) ) ( not ( = ?auto_1516841 ?auto_1516844 ) ) ( not ( = ?auto_1516840 ?auto_1516842 ) ) ( not ( = ?auto_1516840 ?auto_1516843 ) ) ( not ( = ?auto_1516840 ?auto_1516844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516842 ?auto_1516843 ?auto_1516844 )
      ( MAKE-7CRATE-VERIFY ?auto_1516837 ?auto_1516838 ?auto_1516839 ?auto_1516841 ?auto_1516840 ?auto_1516842 ?auto_1516843 ?auto_1516844 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1516900 - SURFACE
      ?auto_1516901 - SURFACE
      ?auto_1516902 - SURFACE
      ?auto_1516904 - SURFACE
      ?auto_1516903 - SURFACE
      ?auto_1516905 - SURFACE
      ?auto_1516906 - SURFACE
      ?auto_1516907 - SURFACE
    )
    :vars
    (
      ?auto_1516911 - HOIST
      ?auto_1516909 - PLACE
      ?auto_1516908 - TRUCK
      ?auto_1516910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516911 ?auto_1516909 ) ( SURFACE-AT ?auto_1516906 ?auto_1516909 ) ( CLEAR ?auto_1516906 ) ( IS-CRATE ?auto_1516907 ) ( not ( = ?auto_1516906 ?auto_1516907 ) ) ( AVAILABLE ?auto_1516911 ) ( IN ?auto_1516907 ?auto_1516908 ) ( ON ?auto_1516906 ?auto_1516905 ) ( not ( = ?auto_1516905 ?auto_1516906 ) ) ( not ( = ?auto_1516905 ?auto_1516907 ) ) ( TRUCK-AT ?auto_1516908 ?auto_1516910 ) ( not ( = ?auto_1516910 ?auto_1516909 ) ) ( ON ?auto_1516901 ?auto_1516900 ) ( ON ?auto_1516902 ?auto_1516901 ) ( ON ?auto_1516904 ?auto_1516902 ) ( ON ?auto_1516903 ?auto_1516904 ) ( ON ?auto_1516905 ?auto_1516903 ) ( not ( = ?auto_1516900 ?auto_1516901 ) ) ( not ( = ?auto_1516900 ?auto_1516902 ) ) ( not ( = ?auto_1516900 ?auto_1516904 ) ) ( not ( = ?auto_1516900 ?auto_1516903 ) ) ( not ( = ?auto_1516900 ?auto_1516905 ) ) ( not ( = ?auto_1516900 ?auto_1516906 ) ) ( not ( = ?auto_1516900 ?auto_1516907 ) ) ( not ( = ?auto_1516901 ?auto_1516902 ) ) ( not ( = ?auto_1516901 ?auto_1516904 ) ) ( not ( = ?auto_1516901 ?auto_1516903 ) ) ( not ( = ?auto_1516901 ?auto_1516905 ) ) ( not ( = ?auto_1516901 ?auto_1516906 ) ) ( not ( = ?auto_1516901 ?auto_1516907 ) ) ( not ( = ?auto_1516902 ?auto_1516904 ) ) ( not ( = ?auto_1516902 ?auto_1516903 ) ) ( not ( = ?auto_1516902 ?auto_1516905 ) ) ( not ( = ?auto_1516902 ?auto_1516906 ) ) ( not ( = ?auto_1516902 ?auto_1516907 ) ) ( not ( = ?auto_1516904 ?auto_1516903 ) ) ( not ( = ?auto_1516904 ?auto_1516905 ) ) ( not ( = ?auto_1516904 ?auto_1516906 ) ) ( not ( = ?auto_1516904 ?auto_1516907 ) ) ( not ( = ?auto_1516903 ?auto_1516905 ) ) ( not ( = ?auto_1516903 ?auto_1516906 ) ) ( not ( = ?auto_1516903 ?auto_1516907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516905 ?auto_1516906 ?auto_1516907 )
      ( MAKE-7CRATE-VERIFY ?auto_1516900 ?auto_1516901 ?auto_1516902 ?auto_1516904 ?auto_1516903 ?auto_1516905 ?auto_1516906 ?auto_1516907 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1516970 - SURFACE
      ?auto_1516971 - SURFACE
      ?auto_1516972 - SURFACE
      ?auto_1516974 - SURFACE
      ?auto_1516973 - SURFACE
      ?auto_1516975 - SURFACE
      ?auto_1516976 - SURFACE
      ?auto_1516977 - SURFACE
    )
    :vars
    (
      ?auto_1516982 - HOIST
      ?auto_1516979 - PLACE
      ?auto_1516980 - TRUCK
      ?auto_1516978 - PLACE
      ?auto_1516981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516982 ?auto_1516979 ) ( SURFACE-AT ?auto_1516976 ?auto_1516979 ) ( CLEAR ?auto_1516976 ) ( IS-CRATE ?auto_1516977 ) ( not ( = ?auto_1516976 ?auto_1516977 ) ) ( AVAILABLE ?auto_1516982 ) ( ON ?auto_1516976 ?auto_1516975 ) ( not ( = ?auto_1516975 ?auto_1516976 ) ) ( not ( = ?auto_1516975 ?auto_1516977 ) ) ( TRUCK-AT ?auto_1516980 ?auto_1516978 ) ( not ( = ?auto_1516978 ?auto_1516979 ) ) ( HOIST-AT ?auto_1516981 ?auto_1516978 ) ( LIFTING ?auto_1516981 ?auto_1516977 ) ( not ( = ?auto_1516982 ?auto_1516981 ) ) ( ON ?auto_1516971 ?auto_1516970 ) ( ON ?auto_1516972 ?auto_1516971 ) ( ON ?auto_1516974 ?auto_1516972 ) ( ON ?auto_1516973 ?auto_1516974 ) ( ON ?auto_1516975 ?auto_1516973 ) ( not ( = ?auto_1516970 ?auto_1516971 ) ) ( not ( = ?auto_1516970 ?auto_1516972 ) ) ( not ( = ?auto_1516970 ?auto_1516974 ) ) ( not ( = ?auto_1516970 ?auto_1516973 ) ) ( not ( = ?auto_1516970 ?auto_1516975 ) ) ( not ( = ?auto_1516970 ?auto_1516976 ) ) ( not ( = ?auto_1516970 ?auto_1516977 ) ) ( not ( = ?auto_1516971 ?auto_1516972 ) ) ( not ( = ?auto_1516971 ?auto_1516974 ) ) ( not ( = ?auto_1516971 ?auto_1516973 ) ) ( not ( = ?auto_1516971 ?auto_1516975 ) ) ( not ( = ?auto_1516971 ?auto_1516976 ) ) ( not ( = ?auto_1516971 ?auto_1516977 ) ) ( not ( = ?auto_1516972 ?auto_1516974 ) ) ( not ( = ?auto_1516972 ?auto_1516973 ) ) ( not ( = ?auto_1516972 ?auto_1516975 ) ) ( not ( = ?auto_1516972 ?auto_1516976 ) ) ( not ( = ?auto_1516972 ?auto_1516977 ) ) ( not ( = ?auto_1516974 ?auto_1516973 ) ) ( not ( = ?auto_1516974 ?auto_1516975 ) ) ( not ( = ?auto_1516974 ?auto_1516976 ) ) ( not ( = ?auto_1516974 ?auto_1516977 ) ) ( not ( = ?auto_1516973 ?auto_1516975 ) ) ( not ( = ?auto_1516973 ?auto_1516976 ) ) ( not ( = ?auto_1516973 ?auto_1516977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516975 ?auto_1516976 ?auto_1516977 )
      ( MAKE-7CRATE-VERIFY ?auto_1516970 ?auto_1516971 ?auto_1516972 ?auto_1516974 ?auto_1516973 ?auto_1516975 ?auto_1516976 ?auto_1516977 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517047 - SURFACE
      ?auto_1517048 - SURFACE
      ?auto_1517049 - SURFACE
      ?auto_1517051 - SURFACE
      ?auto_1517050 - SURFACE
      ?auto_1517052 - SURFACE
      ?auto_1517053 - SURFACE
      ?auto_1517054 - SURFACE
    )
    :vars
    (
      ?auto_1517056 - HOIST
      ?auto_1517057 - PLACE
      ?auto_1517055 - TRUCK
      ?auto_1517060 - PLACE
      ?auto_1517059 - HOIST
      ?auto_1517058 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517056 ?auto_1517057 ) ( SURFACE-AT ?auto_1517053 ?auto_1517057 ) ( CLEAR ?auto_1517053 ) ( IS-CRATE ?auto_1517054 ) ( not ( = ?auto_1517053 ?auto_1517054 ) ) ( AVAILABLE ?auto_1517056 ) ( ON ?auto_1517053 ?auto_1517052 ) ( not ( = ?auto_1517052 ?auto_1517053 ) ) ( not ( = ?auto_1517052 ?auto_1517054 ) ) ( TRUCK-AT ?auto_1517055 ?auto_1517060 ) ( not ( = ?auto_1517060 ?auto_1517057 ) ) ( HOIST-AT ?auto_1517059 ?auto_1517060 ) ( not ( = ?auto_1517056 ?auto_1517059 ) ) ( AVAILABLE ?auto_1517059 ) ( SURFACE-AT ?auto_1517054 ?auto_1517060 ) ( ON ?auto_1517054 ?auto_1517058 ) ( CLEAR ?auto_1517054 ) ( not ( = ?auto_1517053 ?auto_1517058 ) ) ( not ( = ?auto_1517054 ?auto_1517058 ) ) ( not ( = ?auto_1517052 ?auto_1517058 ) ) ( ON ?auto_1517048 ?auto_1517047 ) ( ON ?auto_1517049 ?auto_1517048 ) ( ON ?auto_1517051 ?auto_1517049 ) ( ON ?auto_1517050 ?auto_1517051 ) ( ON ?auto_1517052 ?auto_1517050 ) ( not ( = ?auto_1517047 ?auto_1517048 ) ) ( not ( = ?auto_1517047 ?auto_1517049 ) ) ( not ( = ?auto_1517047 ?auto_1517051 ) ) ( not ( = ?auto_1517047 ?auto_1517050 ) ) ( not ( = ?auto_1517047 ?auto_1517052 ) ) ( not ( = ?auto_1517047 ?auto_1517053 ) ) ( not ( = ?auto_1517047 ?auto_1517054 ) ) ( not ( = ?auto_1517047 ?auto_1517058 ) ) ( not ( = ?auto_1517048 ?auto_1517049 ) ) ( not ( = ?auto_1517048 ?auto_1517051 ) ) ( not ( = ?auto_1517048 ?auto_1517050 ) ) ( not ( = ?auto_1517048 ?auto_1517052 ) ) ( not ( = ?auto_1517048 ?auto_1517053 ) ) ( not ( = ?auto_1517048 ?auto_1517054 ) ) ( not ( = ?auto_1517048 ?auto_1517058 ) ) ( not ( = ?auto_1517049 ?auto_1517051 ) ) ( not ( = ?auto_1517049 ?auto_1517050 ) ) ( not ( = ?auto_1517049 ?auto_1517052 ) ) ( not ( = ?auto_1517049 ?auto_1517053 ) ) ( not ( = ?auto_1517049 ?auto_1517054 ) ) ( not ( = ?auto_1517049 ?auto_1517058 ) ) ( not ( = ?auto_1517051 ?auto_1517050 ) ) ( not ( = ?auto_1517051 ?auto_1517052 ) ) ( not ( = ?auto_1517051 ?auto_1517053 ) ) ( not ( = ?auto_1517051 ?auto_1517054 ) ) ( not ( = ?auto_1517051 ?auto_1517058 ) ) ( not ( = ?auto_1517050 ?auto_1517052 ) ) ( not ( = ?auto_1517050 ?auto_1517053 ) ) ( not ( = ?auto_1517050 ?auto_1517054 ) ) ( not ( = ?auto_1517050 ?auto_1517058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517052 ?auto_1517053 ?auto_1517054 )
      ( MAKE-7CRATE-VERIFY ?auto_1517047 ?auto_1517048 ?auto_1517049 ?auto_1517051 ?auto_1517050 ?auto_1517052 ?auto_1517053 ?auto_1517054 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517125 - SURFACE
      ?auto_1517126 - SURFACE
      ?auto_1517127 - SURFACE
      ?auto_1517129 - SURFACE
      ?auto_1517128 - SURFACE
      ?auto_1517130 - SURFACE
      ?auto_1517131 - SURFACE
      ?auto_1517132 - SURFACE
    )
    :vars
    (
      ?auto_1517136 - HOIST
      ?auto_1517137 - PLACE
      ?auto_1517134 - PLACE
      ?auto_1517138 - HOIST
      ?auto_1517133 - SURFACE
      ?auto_1517135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517136 ?auto_1517137 ) ( SURFACE-AT ?auto_1517131 ?auto_1517137 ) ( CLEAR ?auto_1517131 ) ( IS-CRATE ?auto_1517132 ) ( not ( = ?auto_1517131 ?auto_1517132 ) ) ( AVAILABLE ?auto_1517136 ) ( ON ?auto_1517131 ?auto_1517130 ) ( not ( = ?auto_1517130 ?auto_1517131 ) ) ( not ( = ?auto_1517130 ?auto_1517132 ) ) ( not ( = ?auto_1517134 ?auto_1517137 ) ) ( HOIST-AT ?auto_1517138 ?auto_1517134 ) ( not ( = ?auto_1517136 ?auto_1517138 ) ) ( AVAILABLE ?auto_1517138 ) ( SURFACE-AT ?auto_1517132 ?auto_1517134 ) ( ON ?auto_1517132 ?auto_1517133 ) ( CLEAR ?auto_1517132 ) ( not ( = ?auto_1517131 ?auto_1517133 ) ) ( not ( = ?auto_1517132 ?auto_1517133 ) ) ( not ( = ?auto_1517130 ?auto_1517133 ) ) ( TRUCK-AT ?auto_1517135 ?auto_1517137 ) ( ON ?auto_1517126 ?auto_1517125 ) ( ON ?auto_1517127 ?auto_1517126 ) ( ON ?auto_1517129 ?auto_1517127 ) ( ON ?auto_1517128 ?auto_1517129 ) ( ON ?auto_1517130 ?auto_1517128 ) ( not ( = ?auto_1517125 ?auto_1517126 ) ) ( not ( = ?auto_1517125 ?auto_1517127 ) ) ( not ( = ?auto_1517125 ?auto_1517129 ) ) ( not ( = ?auto_1517125 ?auto_1517128 ) ) ( not ( = ?auto_1517125 ?auto_1517130 ) ) ( not ( = ?auto_1517125 ?auto_1517131 ) ) ( not ( = ?auto_1517125 ?auto_1517132 ) ) ( not ( = ?auto_1517125 ?auto_1517133 ) ) ( not ( = ?auto_1517126 ?auto_1517127 ) ) ( not ( = ?auto_1517126 ?auto_1517129 ) ) ( not ( = ?auto_1517126 ?auto_1517128 ) ) ( not ( = ?auto_1517126 ?auto_1517130 ) ) ( not ( = ?auto_1517126 ?auto_1517131 ) ) ( not ( = ?auto_1517126 ?auto_1517132 ) ) ( not ( = ?auto_1517126 ?auto_1517133 ) ) ( not ( = ?auto_1517127 ?auto_1517129 ) ) ( not ( = ?auto_1517127 ?auto_1517128 ) ) ( not ( = ?auto_1517127 ?auto_1517130 ) ) ( not ( = ?auto_1517127 ?auto_1517131 ) ) ( not ( = ?auto_1517127 ?auto_1517132 ) ) ( not ( = ?auto_1517127 ?auto_1517133 ) ) ( not ( = ?auto_1517129 ?auto_1517128 ) ) ( not ( = ?auto_1517129 ?auto_1517130 ) ) ( not ( = ?auto_1517129 ?auto_1517131 ) ) ( not ( = ?auto_1517129 ?auto_1517132 ) ) ( not ( = ?auto_1517129 ?auto_1517133 ) ) ( not ( = ?auto_1517128 ?auto_1517130 ) ) ( not ( = ?auto_1517128 ?auto_1517131 ) ) ( not ( = ?auto_1517128 ?auto_1517132 ) ) ( not ( = ?auto_1517128 ?auto_1517133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517130 ?auto_1517131 ?auto_1517132 )
      ( MAKE-7CRATE-VERIFY ?auto_1517125 ?auto_1517126 ?auto_1517127 ?auto_1517129 ?auto_1517128 ?auto_1517130 ?auto_1517131 ?auto_1517132 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517203 - SURFACE
      ?auto_1517204 - SURFACE
      ?auto_1517205 - SURFACE
      ?auto_1517207 - SURFACE
      ?auto_1517206 - SURFACE
      ?auto_1517208 - SURFACE
      ?auto_1517209 - SURFACE
      ?auto_1517210 - SURFACE
    )
    :vars
    (
      ?auto_1517212 - HOIST
      ?auto_1517214 - PLACE
      ?auto_1517216 - PLACE
      ?auto_1517211 - HOIST
      ?auto_1517215 - SURFACE
      ?auto_1517213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517212 ?auto_1517214 ) ( IS-CRATE ?auto_1517210 ) ( not ( = ?auto_1517209 ?auto_1517210 ) ) ( not ( = ?auto_1517208 ?auto_1517209 ) ) ( not ( = ?auto_1517208 ?auto_1517210 ) ) ( not ( = ?auto_1517216 ?auto_1517214 ) ) ( HOIST-AT ?auto_1517211 ?auto_1517216 ) ( not ( = ?auto_1517212 ?auto_1517211 ) ) ( AVAILABLE ?auto_1517211 ) ( SURFACE-AT ?auto_1517210 ?auto_1517216 ) ( ON ?auto_1517210 ?auto_1517215 ) ( CLEAR ?auto_1517210 ) ( not ( = ?auto_1517209 ?auto_1517215 ) ) ( not ( = ?auto_1517210 ?auto_1517215 ) ) ( not ( = ?auto_1517208 ?auto_1517215 ) ) ( TRUCK-AT ?auto_1517213 ?auto_1517214 ) ( SURFACE-AT ?auto_1517208 ?auto_1517214 ) ( CLEAR ?auto_1517208 ) ( LIFTING ?auto_1517212 ?auto_1517209 ) ( IS-CRATE ?auto_1517209 ) ( ON ?auto_1517204 ?auto_1517203 ) ( ON ?auto_1517205 ?auto_1517204 ) ( ON ?auto_1517207 ?auto_1517205 ) ( ON ?auto_1517206 ?auto_1517207 ) ( ON ?auto_1517208 ?auto_1517206 ) ( not ( = ?auto_1517203 ?auto_1517204 ) ) ( not ( = ?auto_1517203 ?auto_1517205 ) ) ( not ( = ?auto_1517203 ?auto_1517207 ) ) ( not ( = ?auto_1517203 ?auto_1517206 ) ) ( not ( = ?auto_1517203 ?auto_1517208 ) ) ( not ( = ?auto_1517203 ?auto_1517209 ) ) ( not ( = ?auto_1517203 ?auto_1517210 ) ) ( not ( = ?auto_1517203 ?auto_1517215 ) ) ( not ( = ?auto_1517204 ?auto_1517205 ) ) ( not ( = ?auto_1517204 ?auto_1517207 ) ) ( not ( = ?auto_1517204 ?auto_1517206 ) ) ( not ( = ?auto_1517204 ?auto_1517208 ) ) ( not ( = ?auto_1517204 ?auto_1517209 ) ) ( not ( = ?auto_1517204 ?auto_1517210 ) ) ( not ( = ?auto_1517204 ?auto_1517215 ) ) ( not ( = ?auto_1517205 ?auto_1517207 ) ) ( not ( = ?auto_1517205 ?auto_1517206 ) ) ( not ( = ?auto_1517205 ?auto_1517208 ) ) ( not ( = ?auto_1517205 ?auto_1517209 ) ) ( not ( = ?auto_1517205 ?auto_1517210 ) ) ( not ( = ?auto_1517205 ?auto_1517215 ) ) ( not ( = ?auto_1517207 ?auto_1517206 ) ) ( not ( = ?auto_1517207 ?auto_1517208 ) ) ( not ( = ?auto_1517207 ?auto_1517209 ) ) ( not ( = ?auto_1517207 ?auto_1517210 ) ) ( not ( = ?auto_1517207 ?auto_1517215 ) ) ( not ( = ?auto_1517206 ?auto_1517208 ) ) ( not ( = ?auto_1517206 ?auto_1517209 ) ) ( not ( = ?auto_1517206 ?auto_1517210 ) ) ( not ( = ?auto_1517206 ?auto_1517215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517208 ?auto_1517209 ?auto_1517210 )
      ( MAKE-7CRATE-VERIFY ?auto_1517203 ?auto_1517204 ?auto_1517205 ?auto_1517207 ?auto_1517206 ?auto_1517208 ?auto_1517209 ?auto_1517210 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1517281 - SURFACE
      ?auto_1517282 - SURFACE
      ?auto_1517283 - SURFACE
      ?auto_1517285 - SURFACE
      ?auto_1517284 - SURFACE
      ?auto_1517286 - SURFACE
      ?auto_1517287 - SURFACE
      ?auto_1517288 - SURFACE
    )
    :vars
    (
      ?auto_1517291 - HOIST
      ?auto_1517294 - PLACE
      ?auto_1517289 - PLACE
      ?auto_1517292 - HOIST
      ?auto_1517290 - SURFACE
      ?auto_1517293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517291 ?auto_1517294 ) ( IS-CRATE ?auto_1517288 ) ( not ( = ?auto_1517287 ?auto_1517288 ) ) ( not ( = ?auto_1517286 ?auto_1517287 ) ) ( not ( = ?auto_1517286 ?auto_1517288 ) ) ( not ( = ?auto_1517289 ?auto_1517294 ) ) ( HOIST-AT ?auto_1517292 ?auto_1517289 ) ( not ( = ?auto_1517291 ?auto_1517292 ) ) ( AVAILABLE ?auto_1517292 ) ( SURFACE-AT ?auto_1517288 ?auto_1517289 ) ( ON ?auto_1517288 ?auto_1517290 ) ( CLEAR ?auto_1517288 ) ( not ( = ?auto_1517287 ?auto_1517290 ) ) ( not ( = ?auto_1517288 ?auto_1517290 ) ) ( not ( = ?auto_1517286 ?auto_1517290 ) ) ( TRUCK-AT ?auto_1517293 ?auto_1517294 ) ( SURFACE-AT ?auto_1517286 ?auto_1517294 ) ( CLEAR ?auto_1517286 ) ( IS-CRATE ?auto_1517287 ) ( AVAILABLE ?auto_1517291 ) ( IN ?auto_1517287 ?auto_1517293 ) ( ON ?auto_1517282 ?auto_1517281 ) ( ON ?auto_1517283 ?auto_1517282 ) ( ON ?auto_1517285 ?auto_1517283 ) ( ON ?auto_1517284 ?auto_1517285 ) ( ON ?auto_1517286 ?auto_1517284 ) ( not ( = ?auto_1517281 ?auto_1517282 ) ) ( not ( = ?auto_1517281 ?auto_1517283 ) ) ( not ( = ?auto_1517281 ?auto_1517285 ) ) ( not ( = ?auto_1517281 ?auto_1517284 ) ) ( not ( = ?auto_1517281 ?auto_1517286 ) ) ( not ( = ?auto_1517281 ?auto_1517287 ) ) ( not ( = ?auto_1517281 ?auto_1517288 ) ) ( not ( = ?auto_1517281 ?auto_1517290 ) ) ( not ( = ?auto_1517282 ?auto_1517283 ) ) ( not ( = ?auto_1517282 ?auto_1517285 ) ) ( not ( = ?auto_1517282 ?auto_1517284 ) ) ( not ( = ?auto_1517282 ?auto_1517286 ) ) ( not ( = ?auto_1517282 ?auto_1517287 ) ) ( not ( = ?auto_1517282 ?auto_1517288 ) ) ( not ( = ?auto_1517282 ?auto_1517290 ) ) ( not ( = ?auto_1517283 ?auto_1517285 ) ) ( not ( = ?auto_1517283 ?auto_1517284 ) ) ( not ( = ?auto_1517283 ?auto_1517286 ) ) ( not ( = ?auto_1517283 ?auto_1517287 ) ) ( not ( = ?auto_1517283 ?auto_1517288 ) ) ( not ( = ?auto_1517283 ?auto_1517290 ) ) ( not ( = ?auto_1517285 ?auto_1517284 ) ) ( not ( = ?auto_1517285 ?auto_1517286 ) ) ( not ( = ?auto_1517285 ?auto_1517287 ) ) ( not ( = ?auto_1517285 ?auto_1517288 ) ) ( not ( = ?auto_1517285 ?auto_1517290 ) ) ( not ( = ?auto_1517284 ?auto_1517286 ) ) ( not ( = ?auto_1517284 ?auto_1517287 ) ) ( not ( = ?auto_1517284 ?auto_1517288 ) ) ( not ( = ?auto_1517284 ?auto_1517290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1517286 ?auto_1517287 ?auto_1517288 )
      ( MAKE-7CRATE-VERIFY ?auto_1517281 ?auto_1517282 ?auto_1517283 ?auto_1517285 ?auto_1517284 ?auto_1517286 ?auto_1517287 ?auto_1517288 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520200 - SURFACE
      ?auto_1520201 - SURFACE
      ?auto_1520202 - SURFACE
      ?auto_1520204 - SURFACE
      ?auto_1520203 - SURFACE
      ?auto_1520205 - SURFACE
      ?auto_1520206 - SURFACE
      ?auto_1520207 - SURFACE
      ?auto_1520208 - SURFACE
    )
    :vars
    (
      ?auto_1520210 - HOIST
      ?auto_1520209 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520210 ?auto_1520209 ) ( SURFACE-AT ?auto_1520207 ?auto_1520209 ) ( CLEAR ?auto_1520207 ) ( LIFTING ?auto_1520210 ?auto_1520208 ) ( IS-CRATE ?auto_1520208 ) ( not ( = ?auto_1520207 ?auto_1520208 ) ) ( ON ?auto_1520201 ?auto_1520200 ) ( ON ?auto_1520202 ?auto_1520201 ) ( ON ?auto_1520204 ?auto_1520202 ) ( ON ?auto_1520203 ?auto_1520204 ) ( ON ?auto_1520205 ?auto_1520203 ) ( ON ?auto_1520206 ?auto_1520205 ) ( ON ?auto_1520207 ?auto_1520206 ) ( not ( = ?auto_1520200 ?auto_1520201 ) ) ( not ( = ?auto_1520200 ?auto_1520202 ) ) ( not ( = ?auto_1520200 ?auto_1520204 ) ) ( not ( = ?auto_1520200 ?auto_1520203 ) ) ( not ( = ?auto_1520200 ?auto_1520205 ) ) ( not ( = ?auto_1520200 ?auto_1520206 ) ) ( not ( = ?auto_1520200 ?auto_1520207 ) ) ( not ( = ?auto_1520200 ?auto_1520208 ) ) ( not ( = ?auto_1520201 ?auto_1520202 ) ) ( not ( = ?auto_1520201 ?auto_1520204 ) ) ( not ( = ?auto_1520201 ?auto_1520203 ) ) ( not ( = ?auto_1520201 ?auto_1520205 ) ) ( not ( = ?auto_1520201 ?auto_1520206 ) ) ( not ( = ?auto_1520201 ?auto_1520207 ) ) ( not ( = ?auto_1520201 ?auto_1520208 ) ) ( not ( = ?auto_1520202 ?auto_1520204 ) ) ( not ( = ?auto_1520202 ?auto_1520203 ) ) ( not ( = ?auto_1520202 ?auto_1520205 ) ) ( not ( = ?auto_1520202 ?auto_1520206 ) ) ( not ( = ?auto_1520202 ?auto_1520207 ) ) ( not ( = ?auto_1520202 ?auto_1520208 ) ) ( not ( = ?auto_1520204 ?auto_1520203 ) ) ( not ( = ?auto_1520204 ?auto_1520205 ) ) ( not ( = ?auto_1520204 ?auto_1520206 ) ) ( not ( = ?auto_1520204 ?auto_1520207 ) ) ( not ( = ?auto_1520204 ?auto_1520208 ) ) ( not ( = ?auto_1520203 ?auto_1520205 ) ) ( not ( = ?auto_1520203 ?auto_1520206 ) ) ( not ( = ?auto_1520203 ?auto_1520207 ) ) ( not ( = ?auto_1520203 ?auto_1520208 ) ) ( not ( = ?auto_1520205 ?auto_1520206 ) ) ( not ( = ?auto_1520205 ?auto_1520207 ) ) ( not ( = ?auto_1520205 ?auto_1520208 ) ) ( not ( = ?auto_1520206 ?auto_1520207 ) ) ( not ( = ?auto_1520206 ?auto_1520208 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1520207 ?auto_1520208 )
      ( MAKE-8CRATE-VERIFY ?auto_1520200 ?auto_1520201 ?auto_1520202 ?auto_1520204 ?auto_1520203 ?auto_1520205 ?auto_1520206 ?auto_1520207 ?auto_1520208 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520267 - SURFACE
      ?auto_1520268 - SURFACE
      ?auto_1520269 - SURFACE
      ?auto_1520271 - SURFACE
      ?auto_1520270 - SURFACE
      ?auto_1520272 - SURFACE
      ?auto_1520273 - SURFACE
      ?auto_1520274 - SURFACE
      ?auto_1520275 - SURFACE
    )
    :vars
    (
      ?auto_1520276 - HOIST
      ?auto_1520277 - PLACE
      ?auto_1520278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520276 ?auto_1520277 ) ( SURFACE-AT ?auto_1520274 ?auto_1520277 ) ( CLEAR ?auto_1520274 ) ( IS-CRATE ?auto_1520275 ) ( not ( = ?auto_1520274 ?auto_1520275 ) ) ( TRUCK-AT ?auto_1520278 ?auto_1520277 ) ( AVAILABLE ?auto_1520276 ) ( IN ?auto_1520275 ?auto_1520278 ) ( ON ?auto_1520274 ?auto_1520273 ) ( not ( = ?auto_1520273 ?auto_1520274 ) ) ( not ( = ?auto_1520273 ?auto_1520275 ) ) ( ON ?auto_1520268 ?auto_1520267 ) ( ON ?auto_1520269 ?auto_1520268 ) ( ON ?auto_1520271 ?auto_1520269 ) ( ON ?auto_1520270 ?auto_1520271 ) ( ON ?auto_1520272 ?auto_1520270 ) ( ON ?auto_1520273 ?auto_1520272 ) ( not ( = ?auto_1520267 ?auto_1520268 ) ) ( not ( = ?auto_1520267 ?auto_1520269 ) ) ( not ( = ?auto_1520267 ?auto_1520271 ) ) ( not ( = ?auto_1520267 ?auto_1520270 ) ) ( not ( = ?auto_1520267 ?auto_1520272 ) ) ( not ( = ?auto_1520267 ?auto_1520273 ) ) ( not ( = ?auto_1520267 ?auto_1520274 ) ) ( not ( = ?auto_1520267 ?auto_1520275 ) ) ( not ( = ?auto_1520268 ?auto_1520269 ) ) ( not ( = ?auto_1520268 ?auto_1520271 ) ) ( not ( = ?auto_1520268 ?auto_1520270 ) ) ( not ( = ?auto_1520268 ?auto_1520272 ) ) ( not ( = ?auto_1520268 ?auto_1520273 ) ) ( not ( = ?auto_1520268 ?auto_1520274 ) ) ( not ( = ?auto_1520268 ?auto_1520275 ) ) ( not ( = ?auto_1520269 ?auto_1520271 ) ) ( not ( = ?auto_1520269 ?auto_1520270 ) ) ( not ( = ?auto_1520269 ?auto_1520272 ) ) ( not ( = ?auto_1520269 ?auto_1520273 ) ) ( not ( = ?auto_1520269 ?auto_1520274 ) ) ( not ( = ?auto_1520269 ?auto_1520275 ) ) ( not ( = ?auto_1520271 ?auto_1520270 ) ) ( not ( = ?auto_1520271 ?auto_1520272 ) ) ( not ( = ?auto_1520271 ?auto_1520273 ) ) ( not ( = ?auto_1520271 ?auto_1520274 ) ) ( not ( = ?auto_1520271 ?auto_1520275 ) ) ( not ( = ?auto_1520270 ?auto_1520272 ) ) ( not ( = ?auto_1520270 ?auto_1520273 ) ) ( not ( = ?auto_1520270 ?auto_1520274 ) ) ( not ( = ?auto_1520270 ?auto_1520275 ) ) ( not ( = ?auto_1520272 ?auto_1520273 ) ) ( not ( = ?auto_1520272 ?auto_1520274 ) ) ( not ( = ?auto_1520272 ?auto_1520275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520273 ?auto_1520274 ?auto_1520275 )
      ( MAKE-8CRATE-VERIFY ?auto_1520267 ?auto_1520268 ?auto_1520269 ?auto_1520271 ?auto_1520270 ?auto_1520272 ?auto_1520273 ?auto_1520274 ?auto_1520275 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520343 - SURFACE
      ?auto_1520344 - SURFACE
      ?auto_1520345 - SURFACE
      ?auto_1520347 - SURFACE
      ?auto_1520346 - SURFACE
      ?auto_1520348 - SURFACE
      ?auto_1520349 - SURFACE
      ?auto_1520350 - SURFACE
      ?auto_1520351 - SURFACE
    )
    :vars
    (
      ?auto_1520355 - HOIST
      ?auto_1520354 - PLACE
      ?auto_1520352 - TRUCK
      ?auto_1520353 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520355 ?auto_1520354 ) ( SURFACE-AT ?auto_1520350 ?auto_1520354 ) ( CLEAR ?auto_1520350 ) ( IS-CRATE ?auto_1520351 ) ( not ( = ?auto_1520350 ?auto_1520351 ) ) ( AVAILABLE ?auto_1520355 ) ( IN ?auto_1520351 ?auto_1520352 ) ( ON ?auto_1520350 ?auto_1520349 ) ( not ( = ?auto_1520349 ?auto_1520350 ) ) ( not ( = ?auto_1520349 ?auto_1520351 ) ) ( TRUCK-AT ?auto_1520352 ?auto_1520353 ) ( not ( = ?auto_1520353 ?auto_1520354 ) ) ( ON ?auto_1520344 ?auto_1520343 ) ( ON ?auto_1520345 ?auto_1520344 ) ( ON ?auto_1520347 ?auto_1520345 ) ( ON ?auto_1520346 ?auto_1520347 ) ( ON ?auto_1520348 ?auto_1520346 ) ( ON ?auto_1520349 ?auto_1520348 ) ( not ( = ?auto_1520343 ?auto_1520344 ) ) ( not ( = ?auto_1520343 ?auto_1520345 ) ) ( not ( = ?auto_1520343 ?auto_1520347 ) ) ( not ( = ?auto_1520343 ?auto_1520346 ) ) ( not ( = ?auto_1520343 ?auto_1520348 ) ) ( not ( = ?auto_1520343 ?auto_1520349 ) ) ( not ( = ?auto_1520343 ?auto_1520350 ) ) ( not ( = ?auto_1520343 ?auto_1520351 ) ) ( not ( = ?auto_1520344 ?auto_1520345 ) ) ( not ( = ?auto_1520344 ?auto_1520347 ) ) ( not ( = ?auto_1520344 ?auto_1520346 ) ) ( not ( = ?auto_1520344 ?auto_1520348 ) ) ( not ( = ?auto_1520344 ?auto_1520349 ) ) ( not ( = ?auto_1520344 ?auto_1520350 ) ) ( not ( = ?auto_1520344 ?auto_1520351 ) ) ( not ( = ?auto_1520345 ?auto_1520347 ) ) ( not ( = ?auto_1520345 ?auto_1520346 ) ) ( not ( = ?auto_1520345 ?auto_1520348 ) ) ( not ( = ?auto_1520345 ?auto_1520349 ) ) ( not ( = ?auto_1520345 ?auto_1520350 ) ) ( not ( = ?auto_1520345 ?auto_1520351 ) ) ( not ( = ?auto_1520347 ?auto_1520346 ) ) ( not ( = ?auto_1520347 ?auto_1520348 ) ) ( not ( = ?auto_1520347 ?auto_1520349 ) ) ( not ( = ?auto_1520347 ?auto_1520350 ) ) ( not ( = ?auto_1520347 ?auto_1520351 ) ) ( not ( = ?auto_1520346 ?auto_1520348 ) ) ( not ( = ?auto_1520346 ?auto_1520349 ) ) ( not ( = ?auto_1520346 ?auto_1520350 ) ) ( not ( = ?auto_1520346 ?auto_1520351 ) ) ( not ( = ?auto_1520348 ?auto_1520349 ) ) ( not ( = ?auto_1520348 ?auto_1520350 ) ) ( not ( = ?auto_1520348 ?auto_1520351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520349 ?auto_1520350 ?auto_1520351 )
      ( MAKE-8CRATE-VERIFY ?auto_1520343 ?auto_1520344 ?auto_1520345 ?auto_1520347 ?auto_1520346 ?auto_1520348 ?auto_1520349 ?auto_1520350 ?auto_1520351 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520427 - SURFACE
      ?auto_1520428 - SURFACE
      ?auto_1520429 - SURFACE
      ?auto_1520431 - SURFACE
      ?auto_1520430 - SURFACE
      ?auto_1520432 - SURFACE
      ?auto_1520433 - SURFACE
      ?auto_1520434 - SURFACE
      ?auto_1520435 - SURFACE
    )
    :vars
    (
      ?auto_1520437 - HOIST
      ?auto_1520439 - PLACE
      ?auto_1520436 - TRUCK
      ?auto_1520440 - PLACE
      ?auto_1520438 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520437 ?auto_1520439 ) ( SURFACE-AT ?auto_1520434 ?auto_1520439 ) ( CLEAR ?auto_1520434 ) ( IS-CRATE ?auto_1520435 ) ( not ( = ?auto_1520434 ?auto_1520435 ) ) ( AVAILABLE ?auto_1520437 ) ( ON ?auto_1520434 ?auto_1520433 ) ( not ( = ?auto_1520433 ?auto_1520434 ) ) ( not ( = ?auto_1520433 ?auto_1520435 ) ) ( TRUCK-AT ?auto_1520436 ?auto_1520440 ) ( not ( = ?auto_1520440 ?auto_1520439 ) ) ( HOIST-AT ?auto_1520438 ?auto_1520440 ) ( LIFTING ?auto_1520438 ?auto_1520435 ) ( not ( = ?auto_1520437 ?auto_1520438 ) ) ( ON ?auto_1520428 ?auto_1520427 ) ( ON ?auto_1520429 ?auto_1520428 ) ( ON ?auto_1520431 ?auto_1520429 ) ( ON ?auto_1520430 ?auto_1520431 ) ( ON ?auto_1520432 ?auto_1520430 ) ( ON ?auto_1520433 ?auto_1520432 ) ( not ( = ?auto_1520427 ?auto_1520428 ) ) ( not ( = ?auto_1520427 ?auto_1520429 ) ) ( not ( = ?auto_1520427 ?auto_1520431 ) ) ( not ( = ?auto_1520427 ?auto_1520430 ) ) ( not ( = ?auto_1520427 ?auto_1520432 ) ) ( not ( = ?auto_1520427 ?auto_1520433 ) ) ( not ( = ?auto_1520427 ?auto_1520434 ) ) ( not ( = ?auto_1520427 ?auto_1520435 ) ) ( not ( = ?auto_1520428 ?auto_1520429 ) ) ( not ( = ?auto_1520428 ?auto_1520431 ) ) ( not ( = ?auto_1520428 ?auto_1520430 ) ) ( not ( = ?auto_1520428 ?auto_1520432 ) ) ( not ( = ?auto_1520428 ?auto_1520433 ) ) ( not ( = ?auto_1520428 ?auto_1520434 ) ) ( not ( = ?auto_1520428 ?auto_1520435 ) ) ( not ( = ?auto_1520429 ?auto_1520431 ) ) ( not ( = ?auto_1520429 ?auto_1520430 ) ) ( not ( = ?auto_1520429 ?auto_1520432 ) ) ( not ( = ?auto_1520429 ?auto_1520433 ) ) ( not ( = ?auto_1520429 ?auto_1520434 ) ) ( not ( = ?auto_1520429 ?auto_1520435 ) ) ( not ( = ?auto_1520431 ?auto_1520430 ) ) ( not ( = ?auto_1520431 ?auto_1520432 ) ) ( not ( = ?auto_1520431 ?auto_1520433 ) ) ( not ( = ?auto_1520431 ?auto_1520434 ) ) ( not ( = ?auto_1520431 ?auto_1520435 ) ) ( not ( = ?auto_1520430 ?auto_1520432 ) ) ( not ( = ?auto_1520430 ?auto_1520433 ) ) ( not ( = ?auto_1520430 ?auto_1520434 ) ) ( not ( = ?auto_1520430 ?auto_1520435 ) ) ( not ( = ?auto_1520432 ?auto_1520433 ) ) ( not ( = ?auto_1520432 ?auto_1520434 ) ) ( not ( = ?auto_1520432 ?auto_1520435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520433 ?auto_1520434 ?auto_1520435 )
      ( MAKE-8CRATE-VERIFY ?auto_1520427 ?auto_1520428 ?auto_1520429 ?auto_1520431 ?auto_1520430 ?auto_1520432 ?auto_1520433 ?auto_1520434 ?auto_1520435 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520519 - SURFACE
      ?auto_1520520 - SURFACE
      ?auto_1520521 - SURFACE
      ?auto_1520523 - SURFACE
      ?auto_1520522 - SURFACE
      ?auto_1520524 - SURFACE
      ?auto_1520525 - SURFACE
      ?auto_1520526 - SURFACE
      ?auto_1520527 - SURFACE
    )
    :vars
    (
      ?auto_1520529 - HOIST
      ?auto_1520532 - PLACE
      ?auto_1520530 - TRUCK
      ?auto_1520533 - PLACE
      ?auto_1520528 - HOIST
      ?auto_1520531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520529 ?auto_1520532 ) ( SURFACE-AT ?auto_1520526 ?auto_1520532 ) ( CLEAR ?auto_1520526 ) ( IS-CRATE ?auto_1520527 ) ( not ( = ?auto_1520526 ?auto_1520527 ) ) ( AVAILABLE ?auto_1520529 ) ( ON ?auto_1520526 ?auto_1520525 ) ( not ( = ?auto_1520525 ?auto_1520526 ) ) ( not ( = ?auto_1520525 ?auto_1520527 ) ) ( TRUCK-AT ?auto_1520530 ?auto_1520533 ) ( not ( = ?auto_1520533 ?auto_1520532 ) ) ( HOIST-AT ?auto_1520528 ?auto_1520533 ) ( not ( = ?auto_1520529 ?auto_1520528 ) ) ( AVAILABLE ?auto_1520528 ) ( SURFACE-AT ?auto_1520527 ?auto_1520533 ) ( ON ?auto_1520527 ?auto_1520531 ) ( CLEAR ?auto_1520527 ) ( not ( = ?auto_1520526 ?auto_1520531 ) ) ( not ( = ?auto_1520527 ?auto_1520531 ) ) ( not ( = ?auto_1520525 ?auto_1520531 ) ) ( ON ?auto_1520520 ?auto_1520519 ) ( ON ?auto_1520521 ?auto_1520520 ) ( ON ?auto_1520523 ?auto_1520521 ) ( ON ?auto_1520522 ?auto_1520523 ) ( ON ?auto_1520524 ?auto_1520522 ) ( ON ?auto_1520525 ?auto_1520524 ) ( not ( = ?auto_1520519 ?auto_1520520 ) ) ( not ( = ?auto_1520519 ?auto_1520521 ) ) ( not ( = ?auto_1520519 ?auto_1520523 ) ) ( not ( = ?auto_1520519 ?auto_1520522 ) ) ( not ( = ?auto_1520519 ?auto_1520524 ) ) ( not ( = ?auto_1520519 ?auto_1520525 ) ) ( not ( = ?auto_1520519 ?auto_1520526 ) ) ( not ( = ?auto_1520519 ?auto_1520527 ) ) ( not ( = ?auto_1520519 ?auto_1520531 ) ) ( not ( = ?auto_1520520 ?auto_1520521 ) ) ( not ( = ?auto_1520520 ?auto_1520523 ) ) ( not ( = ?auto_1520520 ?auto_1520522 ) ) ( not ( = ?auto_1520520 ?auto_1520524 ) ) ( not ( = ?auto_1520520 ?auto_1520525 ) ) ( not ( = ?auto_1520520 ?auto_1520526 ) ) ( not ( = ?auto_1520520 ?auto_1520527 ) ) ( not ( = ?auto_1520520 ?auto_1520531 ) ) ( not ( = ?auto_1520521 ?auto_1520523 ) ) ( not ( = ?auto_1520521 ?auto_1520522 ) ) ( not ( = ?auto_1520521 ?auto_1520524 ) ) ( not ( = ?auto_1520521 ?auto_1520525 ) ) ( not ( = ?auto_1520521 ?auto_1520526 ) ) ( not ( = ?auto_1520521 ?auto_1520527 ) ) ( not ( = ?auto_1520521 ?auto_1520531 ) ) ( not ( = ?auto_1520523 ?auto_1520522 ) ) ( not ( = ?auto_1520523 ?auto_1520524 ) ) ( not ( = ?auto_1520523 ?auto_1520525 ) ) ( not ( = ?auto_1520523 ?auto_1520526 ) ) ( not ( = ?auto_1520523 ?auto_1520527 ) ) ( not ( = ?auto_1520523 ?auto_1520531 ) ) ( not ( = ?auto_1520522 ?auto_1520524 ) ) ( not ( = ?auto_1520522 ?auto_1520525 ) ) ( not ( = ?auto_1520522 ?auto_1520526 ) ) ( not ( = ?auto_1520522 ?auto_1520527 ) ) ( not ( = ?auto_1520522 ?auto_1520531 ) ) ( not ( = ?auto_1520524 ?auto_1520525 ) ) ( not ( = ?auto_1520524 ?auto_1520526 ) ) ( not ( = ?auto_1520524 ?auto_1520527 ) ) ( not ( = ?auto_1520524 ?auto_1520531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520525 ?auto_1520526 ?auto_1520527 )
      ( MAKE-8CRATE-VERIFY ?auto_1520519 ?auto_1520520 ?auto_1520521 ?auto_1520523 ?auto_1520522 ?auto_1520524 ?auto_1520525 ?auto_1520526 ?auto_1520527 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520612 - SURFACE
      ?auto_1520613 - SURFACE
      ?auto_1520614 - SURFACE
      ?auto_1520616 - SURFACE
      ?auto_1520615 - SURFACE
      ?auto_1520617 - SURFACE
      ?auto_1520618 - SURFACE
      ?auto_1520619 - SURFACE
      ?auto_1520620 - SURFACE
    )
    :vars
    (
      ?auto_1520625 - HOIST
      ?auto_1520624 - PLACE
      ?auto_1520622 - PLACE
      ?auto_1520623 - HOIST
      ?auto_1520621 - SURFACE
      ?auto_1520626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520625 ?auto_1520624 ) ( SURFACE-AT ?auto_1520619 ?auto_1520624 ) ( CLEAR ?auto_1520619 ) ( IS-CRATE ?auto_1520620 ) ( not ( = ?auto_1520619 ?auto_1520620 ) ) ( AVAILABLE ?auto_1520625 ) ( ON ?auto_1520619 ?auto_1520618 ) ( not ( = ?auto_1520618 ?auto_1520619 ) ) ( not ( = ?auto_1520618 ?auto_1520620 ) ) ( not ( = ?auto_1520622 ?auto_1520624 ) ) ( HOIST-AT ?auto_1520623 ?auto_1520622 ) ( not ( = ?auto_1520625 ?auto_1520623 ) ) ( AVAILABLE ?auto_1520623 ) ( SURFACE-AT ?auto_1520620 ?auto_1520622 ) ( ON ?auto_1520620 ?auto_1520621 ) ( CLEAR ?auto_1520620 ) ( not ( = ?auto_1520619 ?auto_1520621 ) ) ( not ( = ?auto_1520620 ?auto_1520621 ) ) ( not ( = ?auto_1520618 ?auto_1520621 ) ) ( TRUCK-AT ?auto_1520626 ?auto_1520624 ) ( ON ?auto_1520613 ?auto_1520612 ) ( ON ?auto_1520614 ?auto_1520613 ) ( ON ?auto_1520616 ?auto_1520614 ) ( ON ?auto_1520615 ?auto_1520616 ) ( ON ?auto_1520617 ?auto_1520615 ) ( ON ?auto_1520618 ?auto_1520617 ) ( not ( = ?auto_1520612 ?auto_1520613 ) ) ( not ( = ?auto_1520612 ?auto_1520614 ) ) ( not ( = ?auto_1520612 ?auto_1520616 ) ) ( not ( = ?auto_1520612 ?auto_1520615 ) ) ( not ( = ?auto_1520612 ?auto_1520617 ) ) ( not ( = ?auto_1520612 ?auto_1520618 ) ) ( not ( = ?auto_1520612 ?auto_1520619 ) ) ( not ( = ?auto_1520612 ?auto_1520620 ) ) ( not ( = ?auto_1520612 ?auto_1520621 ) ) ( not ( = ?auto_1520613 ?auto_1520614 ) ) ( not ( = ?auto_1520613 ?auto_1520616 ) ) ( not ( = ?auto_1520613 ?auto_1520615 ) ) ( not ( = ?auto_1520613 ?auto_1520617 ) ) ( not ( = ?auto_1520613 ?auto_1520618 ) ) ( not ( = ?auto_1520613 ?auto_1520619 ) ) ( not ( = ?auto_1520613 ?auto_1520620 ) ) ( not ( = ?auto_1520613 ?auto_1520621 ) ) ( not ( = ?auto_1520614 ?auto_1520616 ) ) ( not ( = ?auto_1520614 ?auto_1520615 ) ) ( not ( = ?auto_1520614 ?auto_1520617 ) ) ( not ( = ?auto_1520614 ?auto_1520618 ) ) ( not ( = ?auto_1520614 ?auto_1520619 ) ) ( not ( = ?auto_1520614 ?auto_1520620 ) ) ( not ( = ?auto_1520614 ?auto_1520621 ) ) ( not ( = ?auto_1520616 ?auto_1520615 ) ) ( not ( = ?auto_1520616 ?auto_1520617 ) ) ( not ( = ?auto_1520616 ?auto_1520618 ) ) ( not ( = ?auto_1520616 ?auto_1520619 ) ) ( not ( = ?auto_1520616 ?auto_1520620 ) ) ( not ( = ?auto_1520616 ?auto_1520621 ) ) ( not ( = ?auto_1520615 ?auto_1520617 ) ) ( not ( = ?auto_1520615 ?auto_1520618 ) ) ( not ( = ?auto_1520615 ?auto_1520619 ) ) ( not ( = ?auto_1520615 ?auto_1520620 ) ) ( not ( = ?auto_1520615 ?auto_1520621 ) ) ( not ( = ?auto_1520617 ?auto_1520618 ) ) ( not ( = ?auto_1520617 ?auto_1520619 ) ) ( not ( = ?auto_1520617 ?auto_1520620 ) ) ( not ( = ?auto_1520617 ?auto_1520621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520618 ?auto_1520619 ?auto_1520620 )
      ( MAKE-8CRATE-VERIFY ?auto_1520612 ?auto_1520613 ?auto_1520614 ?auto_1520616 ?auto_1520615 ?auto_1520617 ?auto_1520618 ?auto_1520619 ?auto_1520620 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520705 - SURFACE
      ?auto_1520706 - SURFACE
      ?auto_1520707 - SURFACE
      ?auto_1520709 - SURFACE
      ?auto_1520708 - SURFACE
      ?auto_1520710 - SURFACE
      ?auto_1520711 - SURFACE
      ?auto_1520712 - SURFACE
      ?auto_1520713 - SURFACE
    )
    :vars
    (
      ?auto_1520719 - HOIST
      ?auto_1520718 - PLACE
      ?auto_1520716 - PLACE
      ?auto_1520714 - HOIST
      ?auto_1520717 - SURFACE
      ?auto_1520715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520719 ?auto_1520718 ) ( IS-CRATE ?auto_1520713 ) ( not ( = ?auto_1520712 ?auto_1520713 ) ) ( not ( = ?auto_1520711 ?auto_1520712 ) ) ( not ( = ?auto_1520711 ?auto_1520713 ) ) ( not ( = ?auto_1520716 ?auto_1520718 ) ) ( HOIST-AT ?auto_1520714 ?auto_1520716 ) ( not ( = ?auto_1520719 ?auto_1520714 ) ) ( AVAILABLE ?auto_1520714 ) ( SURFACE-AT ?auto_1520713 ?auto_1520716 ) ( ON ?auto_1520713 ?auto_1520717 ) ( CLEAR ?auto_1520713 ) ( not ( = ?auto_1520712 ?auto_1520717 ) ) ( not ( = ?auto_1520713 ?auto_1520717 ) ) ( not ( = ?auto_1520711 ?auto_1520717 ) ) ( TRUCK-AT ?auto_1520715 ?auto_1520718 ) ( SURFACE-AT ?auto_1520711 ?auto_1520718 ) ( CLEAR ?auto_1520711 ) ( LIFTING ?auto_1520719 ?auto_1520712 ) ( IS-CRATE ?auto_1520712 ) ( ON ?auto_1520706 ?auto_1520705 ) ( ON ?auto_1520707 ?auto_1520706 ) ( ON ?auto_1520709 ?auto_1520707 ) ( ON ?auto_1520708 ?auto_1520709 ) ( ON ?auto_1520710 ?auto_1520708 ) ( ON ?auto_1520711 ?auto_1520710 ) ( not ( = ?auto_1520705 ?auto_1520706 ) ) ( not ( = ?auto_1520705 ?auto_1520707 ) ) ( not ( = ?auto_1520705 ?auto_1520709 ) ) ( not ( = ?auto_1520705 ?auto_1520708 ) ) ( not ( = ?auto_1520705 ?auto_1520710 ) ) ( not ( = ?auto_1520705 ?auto_1520711 ) ) ( not ( = ?auto_1520705 ?auto_1520712 ) ) ( not ( = ?auto_1520705 ?auto_1520713 ) ) ( not ( = ?auto_1520705 ?auto_1520717 ) ) ( not ( = ?auto_1520706 ?auto_1520707 ) ) ( not ( = ?auto_1520706 ?auto_1520709 ) ) ( not ( = ?auto_1520706 ?auto_1520708 ) ) ( not ( = ?auto_1520706 ?auto_1520710 ) ) ( not ( = ?auto_1520706 ?auto_1520711 ) ) ( not ( = ?auto_1520706 ?auto_1520712 ) ) ( not ( = ?auto_1520706 ?auto_1520713 ) ) ( not ( = ?auto_1520706 ?auto_1520717 ) ) ( not ( = ?auto_1520707 ?auto_1520709 ) ) ( not ( = ?auto_1520707 ?auto_1520708 ) ) ( not ( = ?auto_1520707 ?auto_1520710 ) ) ( not ( = ?auto_1520707 ?auto_1520711 ) ) ( not ( = ?auto_1520707 ?auto_1520712 ) ) ( not ( = ?auto_1520707 ?auto_1520713 ) ) ( not ( = ?auto_1520707 ?auto_1520717 ) ) ( not ( = ?auto_1520709 ?auto_1520708 ) ) ( not ( = ?auto_1520709 ?auto_1520710 ) ) ( not ( = ?auto_1520709 ?auto_1520711 ) ) ( not ( = ?auto_1520709 ?auto_1520712 ) ) ( not ( = ?auto_1520709 ?auto_1520713 ) ) ( not ( = ?auto_1520709 ?auto_1520717 ) ) ( not ( = ?auto_1520708 ?auto_1520710 ) ) ( not ( = ?auto_1520708 ?auto_1520711 ) ) ( not ( = ?auto_1520708 ?auto_1520712 ) ) ( not ( = ?auto_1520708 ?auto_1520713 ) ) ( not ( = ?auto_1520708 ?auto_1520717 ) ) ( not ( = ?auto_1520710 ?auto_1520711 ) ) ( not ( = ?auto_1520710 ?auto_1520712 ) ) ( not ( = ?auto_1520710 ?auto_1520713 ) ) ( not ( = ?auto_1520710 ?auto_1520717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520711 ?auto_1520712 ?auto_1520713 )
      ( MAKE-8CRATE-VERIFY ?auto_1520705 ?auto_1520706 ?auto_1520707 ?auto_1520709 ?auto_1520708 ?auto_1520710 ?auto_1520711 ?auto_1520712 ?auto_1520713 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1520798 - SURFACE
      ?auto_1520799 - SURFACE
      ?auto_1520800 - SURFACE
      ?auto_1520802 - SURFACE
      ?auto_1520801 - SURFACE
      ?auto_1520803 - SURFACE
      ?auto_1520804 - SURFACE
      ?auto_1520805 - SURFACE
      ?auto_1520806 - SURFACE
    )
    :vars
    (
      ?auto_1520809 - HOIST
      ?auto_1520810 - PLACE
      ?auto_1520812 - PLACE
      ?auto_1520808 - HOIST
      ?auto_1520807 - SURFACE
      ?auto_1520811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1520809 ?auto_1520810 ) ( IS-CRATE ?auto_1520806 ) ( not ( = ?auto_1520805 ?auto_1520806 ) ) ( not ( = ?auto_1520804 ?auto_1520805 ) ) ( not ( = ?auto_1520804 ?auto_1520806 ) ) ( not ( = ?auto_1520812 ?auto_1520810 ) ) ( HOIST-AT ?auto_1520808 ?auto_1520812 ) ( not ( = ?auto_1520809 ?auto_1520808 ) ) ( AVAILABLE ?auto_1520808 ) ( SURFACE-AT ?auto_1520806 ?auto_1520812 ) ( ON ?auto_1520806 ?auto_1520807 ) ( CLEAR ?auto_1520806 ) ( not ( = ?auto_1520805 ?auto_1520807 ) ) ( not ( = ?auto_1520806 ?auto_1520807 ) ) ( not ( = ?auto_1520804 ?auto_1520807 ) ) ( TRUCK-AT ?auto_1520811 ?auto_1520810 ) ( SURFACE-AT ?auto_1520804 ?auto_1520810 ) ( CLEAR ?auto_1520804 ) ( IS-CRATE ?auto_1520805 ) ( AVAILABLE ?auto_1520809 ) ( IN ?auto_1520805 ?auto_1520811 ) ( ON ?auto_1520799 ?auto_1520798 ) ( ON ?auto_1520800 ?auto_1520799 ) ( ON ?auto_1520802 ?auto_1520800 ) ( ON ?auto_1520801 ?auto_1520802 ) ( ON ?auto_1520803 ?auto_1520801 ) ( ON ?auto_1520804 ?auto_1520803 ) ( not ( = ?auto_1520798 ?auto_1520799 ) ) ( not ( = ?auto_1520798 ?auto_1520800 ) ) ( not ( = ?auto_1520798 ?auto_1520802 ) ) ( not ( = ?auto_1520798 ?auto_1520801 ) ) ( not ( = ?auto_1520798 ?auto_1520803 ) ) ( not ( = ?auto_1520798 ?auto_1520804 ) ) ( not ( = ?auto_1520798 ?auto_1520805 ) ) ( not ( = ?auto_1520798 ?auto_1520806 ) ) ( not ( = ?auto_1520798 ?auto_1520807 ) ) ( not ( = ?auto_1520799 ?auto_1520800 ) ) ( not ( = ?auto_1520799 ?auto_1520802 ) ) ( not ( = ?auto_1520799 ?auto_1520801 ) ) ( not ( = ?auto_1520799 ?auto_1520803 ) ) ( not ( = ?auto_1520799 ?auto_1520804 ) ) ( not ( = ?auto_1520799 ?auto_1520805 ) ) ( not ( = ?auto_1520799 ?auto_1520806 ) ) ( not ( = ?auto_1520799 ?auto_1520807 ) ) ( not ( = ?auto_1520800 ?auto_1520802 ) ) ( not ( = ?auto_1520800 ?auto_1520801 ) ) ( not ( = ?auto_1520800 ?auto_1520803 ) ) ( not ( = ?auto_1520800 ?auto_1520804 ) ) ( not ( = ?auto_1520800 ?auto_1520805 ) ) ( not ( = ?auto_1520800 ?auto_1520806 ) ) ( not ( = ?auto_1520800 ?auto_1520807 ) ) ( not ( = ?auto_1520802 ?auto_1520801 ) ) ( not ( = ?auto_1520802 ?auto_1520803 ) ) ( not ( = ?auto_1520802 ?auto_1520804 ) ) ( not ( = ?auto_1520802 ?auto_1520805 ) ) ( not ( = ?auto_1520802 ?auto_1520806 ) ) ( not ( = ?auto_1520802 ?auto_1520807 ) ) ( not ( = ?auto_1520801 ?auto_1520803 ) ) ( not ( = ?auto_1520801 ?auto_1520804 ) ) ( not ( = ?auto_1520801 ?auto_1520805 ) ) ( not ( = ?auto_1520801 ?auto_1520806 ) ) ( not ( = ?auto_1520801 ?auto_1520807 ) ) ( not ( = ?auto_1520803 ?auto_1520804 ) ) ( not ( = ?auto_1520803 ?auto_1520805 ) ) ( not ( = ?auto_1520803 ?auto_1520806 ) ) ( not ( = ?auto_1520803 ?auto_1520807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1520804 ?auto_1520805 ?auto_1520806 )
      ( MAKE-8CRATE-VERIFY ?auto_1520798 ?auto_1520799 ?auto_1520800 ?auto_1520802 ?auto_1520801 ?auto_1520803 ?auto_1520804 ?auto_1520805 ?auto_1520806 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1524914 - SURFACE
      ?auto_1524915 - SURFACE
      ?auto_1524916 - SURFACE
      ?auto_1524918 - SURFACE
      ?auto_1524917 - SURFACE
      ?auto_1524919 - SURFACE
      ?auto_1524920 - SURFACE
      ?auto_1524921 - SURFACE
      ?auto_1524922 - SURFACE
      ?auto_1524923 - SURFACE
    )
    :vars
    (
      ?auto_1524924 - HOIST
      ?auto_1524925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1524924 ?auto_1524925 ) ( SURFACE-AT ?auto_1524922 ?auto_1524925 ) ( CLEAR ?auto_1524922 ) ( LIFTING ?auto_1524924 ?auto_1524923 ) ( IS-CRATE ?auto_1524923 ) ( not ( = ?auto_1524922 ?auto_1524923 ) ) ( ON ?auto_1524915 ?auto_1524914 ) ( ON ?auto_1524916 ?auto_1524915 ) ( ON ?auto_1524918 ?auto_1524916 ) ( ON ?auto_1524917 ?auto_1524918 ) ( ON ?auto_1524919 ?auto_1524917 ) ( ON ?auto_1524920 ?auto_1524919 ) ( ON ?auto_1524921 ?auto_1524920 ) ( ON ?auto_1524922 ?auto_1524921 ) ( not ( = ?auto_1524914 ?auto_1524915 ) ) ( not ( = ?auto_1524914 ?auto_1524916 ) ) ( not ( = ?auto_1524914 ?auto_1524918 ) ) ( not ( = ?auto_1524914 ?auto_1524917 ) ) ( not ( = ?auto_1524914 ?auto_1524919 ) ) ( not ( = ?auto_1524914 ?auto_1524920 ) ) ( not ( = ?auto_1524914 ?auto_1524921 ) ) ( not ( = ?auto_1524914 ?auto_1524922 ) ) ( not ( = ?auto_1524914 ?auto_1524923 ) ) ( not ( = ?auto_1524915 ?auto_1524916 ) ) ( not ( = ?auto_1524915 ?auto_1524918 ) ) ( not ( = ?auto_1524915 ?auto_1524917 ) ) ( not ( = ?auto_1524915 ?auto_1524919 ) ) ( not ( = ?auto_1524915 ?auto_1524920 ) ) ( not ( = ?auto_1524915 ?auto_1524921 ) ) ( not ( = ?auto_1524915 ?auto_1524922 ) ) ( not ( = ?auto_1524915 ?auto_1524923 ) ) ( not ( = ?auto_1524916 ?auto_1524918 ) ) ( not ( = ?auto_1524916 ?auto_1524917 ) ) ( not ( = ?auto_1524916 ?auto_1524919 ) ) ( not ( = ?auto_1524916 ?auto_1524920 ) ) ( not ( = ?auto_1524916 ?auto_1524921 ) ) ( not ( = ?auto_1524916 ?auto_1524922 ) ) ( not ( = ?auto_1524916 ?auto_1524923 ) ) ( not ( = ?auto_1524918 ?auto_1524917 ) ) ( not ( = ?auto_1524918 ?auto_1524919 ) ) ( not ( = ?auto_1524918 ?auto_1524920 ) ) ( not ( = ?auto_1524918 ?auto_1524921 ) ) ( not ( = ?auto_1524918 ?auto_1524922 ) ) ( not ( = ?auto_1524918 ?auto_1524923 ) ) ( not ( = ?auto_1524917 ?auto_1524919 ) ) ( not ( = ?auto_1524917 ?auto_1524920 ) ) ( not ( = ?auto_1524917 ?auto_1524921 ) ) ( not ( = ?auto_1524917 ?auto_1524922 ) ) ( not ( = ?auto_1524917 ?auto_1524923 ) ) ( not ( = ?auto_1524919 ?auto_1524920 ) ) ( not ( = ?auto_1524919 ?auto_1524921 ) ) ( not ( = ?auto_1524919 ?auto_1524922 ) ) ( not ( = ?auto_1524919 ?auto_1524923 ) ) ( not ( = ?auto_1524920 ?auto_1524921 ) ) ( not ( = ?auto_1524920 ?auto_1524922 ) ) ( not ( = ?auto_1524920 ?auto_1524923 ) ) ( not ( = ?auto_1524921 ?auto_1524922 ) ) ( not ( = ?auto_1524921 ?auto_1524923 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1524922 ?auto_1524923 )
      ( MAKE-9CRATE-VERIFY ?auto_1524914 ?auto_1524915 ?auto_1524916 ?auto_1524918 ?auto_1524917 ?auto_1524919 ?auto_1524920 ?auto_1524921 ?auto_1524922 ?auto_1524923 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1524994 - SURFACE
      ?auto_1524995 - SURFACE
      ?auto_1524996 - SURFACE
      ?auto_1524998 - SURFACE
      ?auto_1524997 - SURFACE
      ?auto_1524999 - SURFACE
      ?auto_1525000 - SURFACE
      ?auto_1525001 - SURFACE
      ?auto_1525002 - SURFACE
      ?auto_1525003 - SURFACE
    )
    :vars
    (
      ?auto_1525004 - HOIST
      ?auto_1525006 - PLACE
      ?auto_1525005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525004 ?auto_1525006 ) ( SURFACE-AT ?auto_1525002 ?auto_1525006 ) ( CLEAR ?auto_1525002 ) ( IS-CRATE ?auto_1525003 ) ( not ( = ?auto_1525002 ?auto_1525003 ) ) ( TRUCK-AT ?auto_1525005 ?auto_1525006 ) ( AVAILABLE ?auto_1525004 ) ( IN ?auto_1525003 ?auto_1525005 ) ( ON ?auto_1525002 ?auto_1525001 ) ( not ( = ?auto_1525001 ?auto_1525002 ) ) ( not ( = ?auto_1525001 ?auto_1525003 ) ) ( ON ?auto_1524995 ?auto_1524994 ) ( ON ?auto_1524996 ?auto_1524995 ) ( ON ?auto_1524998 ?auto_1524996 ) ( ON ?auto_1524997 ?auto_1524998 ) ( ON ?auto_1524999 ?auto_1524997 ) ( ON ?auto_1525000 ?auto_1524999 ) ( ON ?auto_1525001 ?auto_1525000 ) ( not ( = ?auto_1524994 ?auto_1524995 ) ) ( not ( = ?auto_1524994 ?auto_1524996 ) ) ( not ( = ?auto_1524994 ?auto_1524998 ) ) ( not ( = ?auto_1524994 ?auto_1524997 ) ) ( not ( = ?auto_1524994 ?auto_1524999 ) ) ( not ( = ?auto_1524994 ?auto_1525000 ) ) ( not ( = ?auto_1524994 ?auto_1525001 ) ) ( not ( = ?auto_1524994 ?auto_1525002 ) ) ( not ( = ?auto_1524994 ?auto_1525003 ) ) ( not ( = ?auto_1524995 ?auto_1524996 ) ) ( not ( = ?auto_1524995 ?auto_1524998 ) ) ( not ( = ?auto_1524995 ?auto_1524997 ) ) ( not ( = ?auto_1524995 ?auto_1524999 ) ) ( not ( = ?auto_1524995 ?auto_1525000 ) ) ( not ( = ?auto_1524995 ?auto_1525001 ) ) ( not ( = ?auto_1524995 ?auto_1525002 ) ) ( not ( = ?auto_1524995 ?auto_1525003 ) ) ( not ( = ?auto_1524996 ?auto_1524998 ) ) ( not ( = ?auto_1524996 ?auto_1524997 ) ) ( not ( = ?auto_1524996 ?auto_1524999 ) ) ( not ( = ?auto_1524996 ?auto_1525000 ) ) ( not ( = ?auto_1524996 ?auto_1525001 ) ) ( not ( = ?auto_1524996 ?auto_1525002 ) ) ( not ( = ?auto_1524996 ?auto_1525003 ) ) ( not ( = ?auto_1524998 ?auto_1524997 ) ) ( not ( = ?auto_1524998 ?auto_1524999 ) ) ( not ( = ?auto_1524998 ?auto_1525000 ) ) ( not ( = ?auto_1524998 ?auto_1525001 ) ) ( not ( = ?auto_1524998 ?auto_1525002 ) ) ( not ( = ?auto_1524998 ?auto_1525003 ) ) ( not ( = ?auto_1524997 ?auto_1524999 ) ) ( not ( = ?auto_1524997 ?auto_1525000 ) ) ( not ( = ?auto_1524997 ?auto_1525001 ) ) ( not ( = ?auto_1524997 ?auto_1525002 ) ) ( not ( = ?auto_1524997 ?auto_1525003 ) ) ( not ( = ?auto_1524999 ?auto_1525000 ) ) ( not ( = ?auto_1524999 ?auto_1525001 ) ) ( not ( = ?auto_1524999 ?auto_1525002 ) ) ( not ( = ?auto_1524999 ?auto_1525003 ) ) ( not ( = ?auto_1525000 ?auto_1525001 ) ) ( not ( = ?auto_1525000 ?auto_1525002 ) ) ( not ( = ?auto_1525000 ?auto_1525003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525001 ?auto_1525002 ?auto_1525003 )
      ( MAKE-9CRATE-VERIFY ?auto_1524994 ?auto_1524995 ?auto_1524996 ?auto_1524998 ?auto_1524997 ?auto_1524999 ?auto_1525000 ?auto_1525001 ?auto_1525002 ?auto_1525003 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525084 - SURFACE
      ?auto_1525085 - SURFACE
      ?auto_1525086 - SURFACE
      ?auto_1525088 - SURFACE
      ?auto_1525087 - SURFACE
      ?auto_1525089 - SURFACE
      ?auto_1525090 - SURFACE
      ?auto_1525091 - SURFACE
      ?auto_1525092 - SURFACE
      ?auto_1525093 - SURFACE
    )
    :vars
    (
      ?auto_1525095 - HOIST
      ?auto_1525094 - PLACE
      ?auto_1525097 - TRUCK
      ?auto_1525096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525095 ?auto_1525094 ) ( SURFACE-AT ?auto_1525092 ?auto_1525094 ) ( CLEAR ?auto_1525092 ) ( IS-CRATE ?auto_1525093 ) ( not ( = ?auto_1525092 ?auto_1525093 ) ) ( AVAILABLE ?auto_1525095 ) ( IN ?auto_1525093 ?auto_1525097 ) ( ON ?auto_1525092 ?auto_1525091 ) ( not ( = ?auto_1525091 ?auto_1525092 ) ) ( not ( = ?auto_1525091 ?auto_1525093 ) ) ( TRUCK-AT ?auto_1525097 ?auto_1525096 ) ( not ( = ?auto_1525096 ?auto_1525094 ) ) ( ON ?auto_1525085 ?auto_1525084 ) ( ON ?auto_1525086 ?auto_1525085 ) ( ON ?auto_1525088 ?auto_1525086 ) ( ON ?auto_1525087 ?auto_1525088 ) ( ON ?auto_1525089 ?auto_1525087 ) ( ON ?auto_1525090 ?auto_1525089 ) ( ON ?auto_1525091 ?auto_1525090 ) ( not ( = ?auto_1525084 ?auto_1525085 ) ) ( not ( = ?auto_1525084 ?auto_1525086 ) ) ( not ( = ?auto_1525084 ?auto_1525088 ) ) ( not ( = ?auto_1525084 ?auto_1525087 ) ) ( not ( = ?auto_1525084 ?auto_1525089 ) ) ( not ( = ?auto_1525084 ?auto_1525090 ) ) ( not ( = ?auto_1525084 ?auto_1525091 ) ) ( not ( = ?auto_1525084 ?auto_1525092 ) ) ( not ( = ?auto_1525084 ?auto_1525093 ) ) ( not ( = ?auto_1525085 ?auto_1525086 ) ) ( not ( = ?auto_1525085 ?auto_1525088 ) ) ( not ( = ?auto_1525085 ?auto_1525087 ) ) ( not ( = ?auto_1525085 ?auto_1525089 ) ) ( not ( = ?auto_1525085 ?auto_1525090 ) ) ( not ( = ?auto_1525085 ?auto_1525091 ) ) ( not ( = ?auto_1525085 ?auto_1525092 ) ) ( not ( = ?auto_1525085 ?auto_1525093 ) ) ( not ( = ?auto_1525086 ?auto_1525088 ) ) ( not ( = ?auto_1525086 ?auto_1525087 ) ) ( not ( = ?auto_1525086 ?auto_1525089 ) ) ( not ( = ?auto_1525086 ?auto_1525090 ) ) ( not ( = ?auto_1525086 ?auto_1525091 ) ) ( not ( = ?auto_1525086 ?auto_1525092 ) ) ( not ( = ?auto_1525086 ?auto_1525093 ) ) ( not ( = ?auto_1525088 ?auto_1525087 ) ) ( not ( = ?auto_1525088 ?auto_1525089 ) ) ( not ( = ?auto_1525088 ?auto_1525090 ) ) ( not ( = ?auto_1525088 ?auto_1525091 ) ) ( not ( = ?auto_1525088 ?auto_1525092 ) ) ( not ( = ?auto_1525088 ?auto_1525093 ) ) ( not ( = ?auto_1525087 ?auto_1525089 ) ) ( not ( = ?auto_1525087 ?auto_1525090 ) ) ( not ( = ?auto_1525087 ?auto_1525091 ) ) ( not ( = ?auto_1525087 ?auto_1525092 ) ) ( not ( = ?auto_1525087 ?auto_1525093 ) ) ( not ( = ?auto_1525089 ?auto_1525090 ) ) ( not ( = ?auto_1525089 ?auto_1525091 ) ) ( not ( = ?auto_1525089 ?auto_1525092 ) ) ( not ( = ?auto_1525089 ?auto_1525093 ) ) ( not ( = ?auto_1525090 ?auto_1525091 ) ) ( not ( = ?auto_1525090 ?auto_1525092 ) ) ( not ( = ?auto_1525090 ?auto_1525093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525091 ?auto_1525092 ?auto_1525093 )
      ( MAKE-9CRATE-VERIFY ?auto_1525084 ?auto_1525085 ?auto_1525086 ?auto_1525088 ?auto_1525087 ?auto_1525089 ?auto_1525090 ?auto_1525091 ?auto_1525092 ?auto_1525093 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525183 - SURFACE
      ?auto_1525184 - SURFACE
      ?auto_1525185 - SURFACE
      ?auto_1525187 - SURFACE
      ?auto_1525186 - SURFACE
      ?auto_1525188 - SURFACE
      ?auto_1525189 - SURFACE
      ?auto_1525190 - SURFACE
      ?auto_1525191 - SURFACE
      ?auto_1525192 - SURFACE
    )
    :vars
    (
      ?auto_1525195 - HOIST
      ?auto_1525196 - PLACE
      ?auto_1525194 - TRUCK
      ?auto_1525193 - PLACE
      ?auto_1525197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525195 ?auto_1525196 ) ( SURFACE-AT ?auto_1525191 ?auto_1525196 ) ( CLEAR ?auto_1525191 ) ( IS-CRATE ?auto_1525192 ) ( not ( = ?auto_1525191 ?auto_1525192 ) ) ( AVAILABLE ?auto_1525195 ) ( ON ?auto_1525191 ?auto_1525190 ) ( not ( = ?auto_1525190 ?auto_1525191 ) ) ( not ( = ?auto_1525190 ?auto_1525192 ) ) ( TRUCK-AT ?auto_1525194 ?auto_1525193 ) ( not ( = ?auto_1525193 ?auto_1525196 ) ) ( HOIST-AT ?auto_1525197 ?auto_1525193 ) ( LIFTING ?auto_1525197 ?auto_1525192 ) ( not ( = ?auto_1525195 ?auto_1525197 ) ) ( ON ?auto_1525184 ?auto_1525183 ) ( ON ?auto_1525185 ?auto_1525184 ) ( ON ?auto_1525187 ?auto_1525185 ) ( ON ?auto_1525186 ?auto_1525187 ) ( ON ?auto_1525188 ?auto_1525186 ) ( ON ?auto_1525189 ?auto_1525188 ) ( ON ?auto_1525190 ?auto_1525189 ) ( not ( = ?auto_1525183 ?auto_1525184 ) ) ( not ( = ?auto_1525183 ?auto_1525185 ) ) ( not ( = ?auto_1525183 ?auto_1525187 ) ) ( not ( = ?auto_1525183 ?auto_1525186 ) ) ( not ( = ?auto_1525183 ?auto_1525188 ) ) ( not ( = ?auto_1525183 ?auto_1525189 ) ) ( not ( = ?auto_1525183 ?auto_1525190 ) ) ( not ( = ?auto_1525183 ?auto_1525191 ) ) ( not ( = ?auto_1525183 ?auto_1525192 ) ) ( not ( = ?auto_1525184 ?auto_1525185 ) ) ( not ( = ?auto_1525184 ?auto_1525187 ) ) ( not ( = ?auto_1525184 ?auto_1525186 ) ) ( not ( = ?auto_1525184 ?auto_1525188 ) ) ( not ( = ?auto_1525184 ?auto_1525189 ) ) ( not ( = ?auto_1525184 ?auto_1525190 ) ) ( not ( = ?auto_1525184 ?auto_1525191 ) ) ( not ( = ?auto_1525184 ?auto_1525192 ) ) ( not ( = ?auto_1525185 ?auto_1525187 ) ) ( not ( = ?auto_1525185 ?auto_1525186 ) ) ( not ( = ?auto_1525185 ?auto_1525188 ) ) ( not ( = ?auto_1525185 ?auto_1525189 ) ) ( not ( = ?auto_1525185 ?auto_1525190 ) ) ( not ( = ?auto_1525185 ?auto_1525191 ) ) ( not ( = ?auto_1525185 ?auto_1525192 ) ) ( not ( = ?auto_1525187 ?auto_1525186 ) ) ( not ( = ?auto_1525187 ?auto_1525188 ) ) ( not ( = ?auto_1525187 ?auto_1525189 ) ) ( not ( = ?auto_1525187 ?auto_1525190 ) ) ( not ( = ?auto_1525187 ?auto_1525191 ) ) ( not ( = ?auto_1525187 ?auto_1525192 ) ) ( not ( = ?auto_1525186 ?auto_1525188 ) ) ( not ( = ?auto_1525186 ?auto_1525189 ) ) ( not ( = ?auto_1525186 ?auto_1525190 ) ) ( not ( = ?auto_1525186 ?auto_1525191 ) ) ( not ( = ?auto_1525186 ?auto_1525192 ) ) ( not ( = ?auto_1525188 ?auto_1525189 ) ) ( not ( = ?auto_1525188 ?auto_1525190 ) ) ( not ( = ?auto_1525188 ?auto_1525191 ) ) ( not ( = ?auto_1525188 ?auto_1525192 ) ) ( not ( = ?auto_1525189 ?auto_1525190 ) ) ( not ( = ?auto_1525189 ?auto_1525191 ) ) ( not ( = ?auto_1525189 ?auto_1525192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525190 ?auto_1525191 ?auto_1525192 )
      ( MAKE-9CRATE-VERIFY ?auto_1525183 ?auto_1525184 ?auto_1525185 ?auto_1525187 ?auto_1525186 ?auto_1525188 ?auto_1525189 ?auto_1525190 ?auto_1525191 ?auto_1525192 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525291 - SURFACE
      ?auto_1525292 - SURFACE
      ?auto_1525293 - SURFACE
      ?auto_1525295 - SURFACE
      ?auto_1525294 - SURFACE
      ?auto_1525296 - SURFACE
      ?auto_1525297 - SURFACE
      ?auto_1525298 - SURFACE
      ?auto_1525299 - SURFACE
      ?auto_1525300 - SURFACE
    )
    :vars
    (
      ?auto_1525301 - HOIST
      ?auto_1525305 - PLACE
      ?auto_1525303 - TRUCK
      ?auto_1525302 - PLACE
      ?auto_1525306 - HOIST
      ?auto_1525304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525301 ?auto_1525305 ) ( SURFACE-AT ?auto_1525299 ?auto_1525305 ) ( CLEAR ?auto_1525299 ) ( IS-CRATE ?auto_1525300 ) ( not ( = ?auto_1525299 ?auto_1525300 ) ) ( AVAILABLE ?auto_1525301 ) ( ON ?auto_1525299 ?auto_1525298 ) ( not ( = ?auto_1525298 ?auto_1525299 ) ) ( not ( = ?auto_1525298 ?auto_1525300 ) ) ( TRUCK-AT ?auto_1525303 ?auto_1525302 ) ( not ( = ?auto_1525302 ?auto_1525305 ) ) ( HOIST-AT ?auto_1525306 ?auto_1525302 ) ( not ( = ?auto_1525301 ?auto_1525306 ) ) ( AVAILABLE ?auto_1525306 ) ( SURFACE-AT ?auto_1525300 ?auto_1525302 ) ( ON ?auto_1525300 ?auto_1525304 ) ( CLEAR ?auto_1525300 ) ( not ( = ?auto_1525299 ?auto_1525304 ) ) ( not ( = ?auto_1525300 ?auto_1525304 ) ) ( not ( = ?auto_1525298 ?auto_1525304 ) ) ( ON ?auto_1525292 ?auto_1525291 ) ( ON ?auto_1525293 ?auto_1525292 ) ( ON ?auto_1525295 ?auto_1525293 ) ( ON ?auto_1525294 ?auto_1525295 ) ( ON ?auto_1525296 ?auto_1525294 ) ( ON ?auto_1525297 ?auto_1525296 ) ( ON ?auto_1525298 ?auto_1525297 ) ( not ( = ?auto_1525291 ?auto_1525292 ) ) ( not ( = ?auto_1525291 ?auto_1525293 ) ) ( not ( = ?auto_1525291 ?auto_1525295 ) ) ( not ( = ?auto_1525291 ?auto_1525294 ) ) ( not ( = ?auto_1525291 ?auto_1525296 ) ) ( not ( = ?auto_1525291 ?auto_1525297 ) ) ( not ( = ?auto_1525291 ?auto_1525298 ) ) ( not ( = ?auto_1525291 ?auto_1525299 ) ) ( not ( = ?auto_1525291 ?auto_1525300 ) ) ( not ( = ?auto_1525291 ?auto_1525304 ) ) ( not ( = ?auto_1525292 ?auto_1525293 ) ) ( not ( = ?auto_1525292 ?auto_1525295 ) ) ( not ( = ?auto_1525292 ?auto_1525294 ) ) ( not ( = ?auto_1525292 ?auto_1525296 ) ) ( not ( = ?auto_1525292 ?auto_1525297 ) ) ( not ( = ?auto_1525292 ?auto_1525298 ) ) ( not ( = ?auto_1525292 ?auto_1525299 ) ) ( not ( = ?auto_1525292 ?auto_1525300 ) ) ( not ( = ?auto_1525292 ?auto_1525304 ) ) ( not ( = ?auto_1525293 ?auto_1525295 ) ) ( not ( = ?auto_1525293 ?auto_1525294 ) ) ( not ( = ?auto_1525293 ?auto_1525296 ) ) ( not ( = ?auto_1525293 ?auto_1525297 ) ) ( not ( = ?auto_1525293 ?auto_1525298 ) ) ( not ( = ?auto_1525293 ?auto_1525299 ) ) ( not ( = ?auto_1525293 ?auto_1525300 ) ) ( not ( = ?auto_1525293 ?auto_1525304 ) ) ( not ( = ?auto_1525295 ?auto_1525294 ) ) ( not ( = ?auto_1525295 ?auto_1525296 ) ) ( not ( = ?auto_1525295 ?auto_1525297 ) ) ( not ( = ?auto_1525295 ?auto_1525298 ) ) ( not ( = ?auto_1525295 ?auto_1525299 ) ) ( not ( = ?auto_1525295 ?auto_1525300 ) ) ( not ( = ?auto_1525295 ?auto_1525304 ) ) ( not ( = ?auto_1525294 ?auto_1525296 ) ) ( not ( = ?auto_1525294 ?auto_1525297 ) ) ( not ( = ?auto_1525294 ?auto_1525298 ) ) ( not ( = ?auto_1525294 ?auto_1525299 ) ) ( not ( = ?auto_1525294 ?auto_1525300 ) ) ( not ( = ?auto_1525294 ?auto_1525304 ) ) ( not ( = ?auto_1525296 ?auto_1525297 ) ) ( not ( = ?auto_1525296 ?auto_1525298 ) ) ( not ( = ?auto_1525296 ?auto_1525299 ) ) ( not ( = ?auto_1525296 ?auto_1525300 ) ) ( not ( = ?auto_1525296 ?auto_1525304 ) ) ( not ( = ?auto_1525297 ?auto_1525298 ) ) ( not ( = ?auto_1525297 ?auto_1525299 ) ) ( not ( = ?auto_1525297 ?auto_1525300 ) ) ( not ( = ?auto_1525297 ?auto_1525304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525298 ?auto_1525299 ?auto_1525300 )
      ( MAKE-9CRATE-VERIFY ?auto_1525291 ?auto_1525292 ?auto_1525293 ?auto_1525295 ?auto_1525294 ?auto_1525296 ?auto_1525297 ?auto_1525298 ?auto_1525299 ?auto_1525300 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525400 - SURFACE
      ?auto_1525401 - SURFACE
      ?auto_1525402 - SURFACE
      ?auto_1525404 - SURFACE
      ?auto_1525403 - SURFACE
      ?auto_1525405 - SURFACE
      ?auto_1525406 - SURFACE
      ?auto_1525407 - SURFACE
      ?auto_1525408 - SURFACE
      ?auto_1525409 - SURFACE
    )
    :vars
    (
      ?auto_1525415 - HOIST
      ?auto_1525413 - PLACE
      ?auto_1525410 - PLACE
      ?auto_1525414 - HOIST
      ?auto_1525412 - SURFACE
      ?auto_1525411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525415 ?auto_1525413 ) ( SURFACE-AT ?auto_1525408 ?auto_1525413 ) ( CLEAR ?auto_1525408 ) ( IS-CRATE ?auto_1525409 ) ( not ( = ?auto_1525408 ?auto_1525409 ) ) ( AVAILABLE ?auto_1525415 ) ( ON ?auto_1525408 ?auto_1525407 ) ( not ( = ?auto_1525407 ?auto_1525408 ) ) ( not ( = ?auto_1525407 ?auto_1525409 ) ) ( not ( = ?auto_1525410 ?auto_1525413 ) ) ( HOIST-AT ?auto_1525414 ?auto_1525410 ) ( not ( = ?auto_1525415 ?auto_1525414 ) ) ( AVAILABLE ?auto_1525414 ) ( SURFACE-AT ?auto_1525409 ?auto_1525410 ) ( ON ?auto_1525409 ?auto_1525412 ) ( CLEAR ?auto_1525409 ) ( not ( = ?auto_1525408 ?auto_1525412 ) ) ( not ( = ?auto_1525409 ?auto_1525412 ) ) ( not ( = ?auto_1525407 ?auto_1525412 ) ) ( TRUCK-AT ?auto_1525411 ?auto_1525413 ) ( ON ?auto_1525401 ?auto_1525400 ) ( ON ?auto_1525402 ?auto_1525401 ) ( ON ?auto_1525404 ?auto_1525402 ) ( ON ?auto_1525403 ?auto_1525404 ) ( ON ?auto_1525405 ?auto_1525403 ) ( ON ?auto_1525406 ?auto_1525405 ) ( ON ?auto_1525407 ?auto_1525406 ) ( not ( = ?auto_1525400 ?auto_1525401 ) ) ( not ( = ?auto_1525400 ?auto_1525402 ) ) ( not ( = ?auto_1525400 ?auto_1525404 ) ) ( not ( = ?auto_1525400 ?auto_1525403 ) ) ( not ( = ?auto_1525400 ?auto_1525405 ) ) ( not ( = ?auto_1525400 ?auto_1525406 ) ) ( not ( = ?auto_1525400 ?auto_1525407 ) ) ( not ( = ?auto_1525400 ?auto_1525408 ) ) ( not ( = ?auto_1525400 ?auto_1525409 ) ) ( not ( = ?auto_1525400 ?auto_1525412 ) ) ( not ( = ?auto_1525401 ?auto_1525402 ) ) ( not ( = ?auto_1525401 ?auto_1525404 ) ) ( not ( = ?auto_1525401 ?auto_1525403 ) ) ( not ( = ?auto_1525401 ?auto_1525405 ) ) ( not ( = ?auto_1525401 ?auto_1525406 ) ) ( not ( = ?auto_1525401 ?auto_1525407 ) ) ( not ( = ?auto_1525401 ?auto_1525408 ) ) ( not ( = ?auto_1525401 ?auto_1525409 ) ) ( not ( = ?auto_1525401 ?auto_1525412 ) ) ( not ( = ?auto_1525402 ?auto_1525404 ) ) ( not ( = ?auto_1525402 ?auto_1525403 ) ) ( not ( = ?auto_1525402 ?auto_1525405 ) ) ( not ( = ?auto_1525402 ?auto_1525406 ) ) ( not ( = ?auto_1525402 ?auto_1525407 ) ) ( not ( = ?auto_1525402 ?auto_1525408 ) ) ( not ( = ?auto_1525402 ?auto_1525409 ) ) ( not ( = ?auto_1525402 ?auto_1525412 ) ) ( not ( = ?auto_1525404 ?auto_1525403 ) ) ( not ( = ?auto_1525404 ?auto_1525405 ) ) ( not ( = ?auto_1525404 ?auto_1525406 ) ) ( not ( = ?auto_1525404 ?auto_1525407 ) ) ( not ( = ?auto_1525404 ?auto_1525408 ) ) ( not ( = ?auto_1525404 ?auto_1525409 ) ) ( not ( = ?auto_1525404 ?auto_1525412 ) ) ( not ( = ?auto_1525403 ?auto_1525405 ) ) ( not ( = ?auto_1525403 ?auto_1525406 ) ) ( not ( = ?auto_1525403 ?auto_1525407 ) ) ( not ( = ?auto_1525403 ?auto_1525408 ) ) ( not ( = ?auto_1525403 ?auto_1525409 ) ) ( not ( = ?auto_1525403 ?auto_1525412 ) ) ( not ( = ?auto_1525405 ?auto_1525406 ) ) ( not ( = ?auto_1525405 ?auto_1525407 ) ) ( not ( = ?auto_1525405 ?auto_1525408 ) ) ( not ( = ?auto_1525405 ?auto_1525409 ) ) ( not ( = ?auto_1525405 ?auto_1525412 ) ) ( not ( = ?auto_1525406 ?auto_1525407 ) ) ( not ( = ?auto_1525406 ?auto_1525408 ) ) ( not ( = ?auto_1525406 ?auto_1525409 ) ) ( not ( = ?auto_1525406 ?auto_1525412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525407 ?auto_1525408 ?auto_1525409 )
      ( MAKE-9CRATE-VERIFY ?auto_1525400 ?auto_1525401 ?auto_1525402 ?auto_1525404 ?auto_1525403 ?auto_1525405 ?auto_1525406 ?auto_1525407 ?auto_1525408 ?auto_1525409 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525509 - SURFACE
      ?auto_1525510 - SURFACE
      ?auto_1525511 - SURFACE
      ?auto_1525513 - SURFACE
      ?auto_1525512 - SURFACE
      ?auto_1525514 - SURFACE
      ?auto_1525515 - SURFACE
      ?auto_1525516 - SURFACE
      ?auto_1525517 - SURFACE
      ?auto_1525518 - SURFACE
    )
    :vars
    (
      ?auto_1525520 - HOIST
      ?auto_1525524 - PLACE
      ?auto_1525522 - PLACE
      ?auto_1525523 - HOIST
      ?auto_1525519 - SURFACE
      ?auto_1525521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525520 ?auto_1525524 ) ( IS-CRATE ?auto_1525518 ) ( not ( = ?auto_1525517 ?auto_1525518 ) ) ( not ( = ?auto_1525516 ?auto_1525517 ) ) ( not ( = ?auto_1525516 ?auto_1525518 ) ) ( not ( = ?auto_1525522 ?auto_1525524 ) ) ( HOIST-AT ?auto_1525523 ?auto_1525522 ) ( not ( = ?auto_1525520 ?auto_1525523 ) ) ( AVAILABLE ?auto_1525523 ) ( SURFACE-AT ?auto_1525518 ?auto_1525522 ) ( ON ?auto_1525518 ?auto_1525519 ) ( CLEAR ?auto_1525518 ) ( not ( = ?auto_1525517 ?auto_1525519 ) ) ( not ( = ?auto_1525518 ?auto_1525519 ) ) ( not ( = ?auto_1525516 ?auto_1525519 ) ) ( TRUCK-AT ?auto_1525521 ?auto_1525524 ) ( SURFACE-AT ?auto_1525516 ?auto_1525524 ) ( CLEAR ?auto_1525516 ) ( LIFTING ?auto_1525520 ?auto_1525517 ) ( IS-CRATE ?auto_1525517 ) ( ON ?auto_1525510 ?auto_1525509 ) ( ON ?auto_1525511 ?auto_1525510 ) ( ON ?auto_1525513 ?auto_1525511 ) ( ON ?auto_1525512 ?auto_1525513 ) ( ON ?auto_1525514 ?auto_1525512 ) ( ON ?auto_1525515 ?auto_1525514 ) ( ON ?auto_1525516 ?auto_1525515 ) ( not ( = ?auto_1525509 ?auto_1525510 ) ) ( not ( = ?auto_1525509 ?auto_1525511 ) ) ( not ( = ?auto_1525509 ?auto_1525513 ) ) ( not ( = ?auto_1525509 ?auto_1525512 ) ) ( not ( = ?auto_1525509 ?auto_1525514 ) ) ( not ( = ?auto_1525509 ?auto_1525515 ) ) ( not ( = ?auto_1525509 ?auto_1525516 ) ) ( not ( = ?auto_1525509 ?auto_1525517 ) ) ( not ( = ?auto_1525509 ?auto_1525518 ) ) ( not ( = ?auto_1525509 ?auto_1525519 ) ) ( not ( = ?auto_1525510 ?auto_1525511 ) ) ( not ( = ?auto_1525510 ?auto_1525513 ) ) ( not ( = ?auto_1525510 ?auto_1525512 ) ) ( not ( = ?auto_1525510 ?auto_1525514 ) ) ( not ( = ?auto_1525510 ?auto_1525515 ) ) ( not ( = ?auto_1525510 ?auto_1525516 ) ) ( not ( = ?auto_1525510 ?auto_1525517 ) ) ( not ( = ?auto_1525510 ?auto_1525518 ) ) ( not ( = ?auto_1525510 ?auto_1525519 ) ) ( not ( = ?auto_1525511 ?auto_1525513 ) ) ( not ( = ?auto_1525511 ?auto_1525512 ) ) ( not ( = ?auto_1525511 ?auto_1525514 ) ) ( not ( = ?auto_1525511 ?auto_1525515 ) ) ( not ( = ?auto_1525511 ?auto_1525516 ) ) ( not ( = ?auto_1525511 ?auto_1525517 ) ) ( not ( = ?auto_1525511 ?auto_1525518 ) ) ( not ( = ?auto_1525511 ?auto_1525519 ) ) ( not ( = ?auto_1525513 ?auto_1525512 ) ) ( not ( = ?auto_1525513 ?auto_1525514 ) ) ( not ( = ?auto_1525513 ?auto_1525515 ) ) ( not ( = ?auto_1525513 ?auto_1525516 ) ) ( not ( = ?auto_1525513 ?auto_1525517 ) ) ( not ( = ?auto_1525513 ?auto_1525518 ) ) ( not ( = ?auto_1525513 ?auto_1525519 ) ) ( not ( = ?auto_1525512 ?auto_1525514 ) ) ( not ( = ?auto_1525512 ?auto_1525515 ) ) ( not ( = ?auto_1525512 ?auto_1525516 ) ) ( not ( = ?auto_1525512 ?auto_1525517 ) ) ( not ( = ?auto_1525512 ?auto_1525518 ) ) ( not ( = ?auto_1525512 ?auto_1525519 ) ) ( not ( = ?auto_1525514 ?auto_1525515 ) ) ( not ( = ?auto_1525514 ?auto_1525516 ) ) ( not ( = ?auto_1525514 ?auto_1525517 ) ) ( not ( = ?auto_1525514 ?auto_1525518 ) ) ( not ( = ?auto_1525514 ?auto_1525519 ) ) ( not ( = ?auto_1525515 ?auto_1525516 ) ) ( not ( = ?auto_1525515 ?auto_1525517 ) ) ( not ( = ?auto_1525515 ?auto_1525518 ) ) ( not ( = ?auto_1525515 ?auto_1525519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525516 ?auto_1525517 ?auto_1525518 )
      ( MAKE-9CRATE-VERIFY ?auto_1525509 ?auto_1525510 ?auto_1525511 ?auto_1525513 ?auto_1525512 ?auto_1525514 ?auto_1525515 ?auto_1525516 ?auto_1525517 ?auto_1525518 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525618 - SURFACE
      ?auto_1525619 - SURFACE
      ?auto_1525620 - SURFACE
      ?auto_1525622 - SURFACE
      ?auto_1525621 - SURFACE
      ?auto_1525623 - SURFACE
      ?auto_1525624 - SURFACE
      ?auto_1525625 - SURFACE
      ?auto_1525626 - SURFACE
      ?auto_1525627 - SURFACE
    )
    :vars
    (
      ?auto_1525630 - HOIST
      ?auto_1525629 - PLACE
      ?auto_1525632 - PLACE
      ?auto_1525631 - HOIST
      ?auto_1525628 - SURFACE
      ?auto_1525633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525630 ?auto_1525629 ) ( IS-CRATE ?auto_1525627 ) ( not ( = ?auto_1525626 ?auto_1525627 ) ) ( not ( = ?auto_1525625 ?auto_1525626 ) ) ( not ( = ?auto_1525625 ?auto_1525627 ) ) ( not ( = ?auto_1525632 ?auto_1525629 ) ) ( HOIST-AT ?auto_1525631 ?auto_1525632 ) ( not ( = ?auto_1525630 ?auto_1525631 ) ) ( AVAILABLE ?auto_1525631 ) ( SURFACE-AT ?auto_1525627 ?auto_1525632 ) ( ON ?auto_1525627 ?auto_1525628 ) ( CLEAR ?auto_1525627 ) ( not ( = ?auto_1525626 ?auto_1525628 ) ) ( not ( = ?auto_1525627 ?auto_1525628 ) ) ( not ( = ?auto_1525625 ?auto_1525628 ) ) ( TRUCK-AT ?auto_1525633 ?auto_1525629 ) ( SURFACE-AT ?auto_1525625 ?auto_1525629 ) ( CLEAR ?auto_1525625 ) ( IS-CRATE ?auto_1525626 ) ( AVAILABLE ?auto_1525630 ) ( IN ?auto_1525626 ?auto_1525633 ) ( ON ?auto_1525619 ?auto_1525618 ) ( ON ?auto_1525620 ?auto_1525619 ) ( ON ?auto_1525622 ?auto_1525620 ) ( ON ?auto_1525621 ?auto_1525622 ) ( ON ?auto_1525623 ?auto_1525621 ) ( ON ?auto_1525624 ?auto_1525623 ) ( ON ?auto_1525625 ?auto_1525624 ) ( not ( = ?auto_1525618 ?auto_1525619 ) ) ( not ( = ?auto_1525618 ?auto_1525620 ) ) ( not ( = ?auto_1525618 ?auto_1525622 ) ) ( not ( = ?auto_1525618 ?auto_1525621 ) ) ( not ( = ?auto_1525618 ?auto_1525623 ) ) ( not ( = ?auto_1525618 ?auto_1525624 ) ) ( not ( = ?auto_1525618 ?auto_1525625 ) ) ( not ( = ?auto_1525618 ?auto_1525626 ) ) ( not ( = ?auto_1525618 ?auto_1525627 ) ) ( not ( = ?auto_1525618 ?auto_1525628 ) ) ( not ( = ?auto_1525619 ?auto_1525620 ) ) ( not ( = ?auto_1525619 ?auto_1525622 ) ) ( not ( = ?auto_1525619 ?auto_1525621 ) ) ( not ( = ?auto_1525619 ?auto_1525623 ) ) ( not ( = ?auto_1525619 ?auto_1525624 ) ) ( not ( = ?auto_1525619 ?auto_1525625 ) ) ( not ( = ?auto_1525619 ?auto_1525626 ) ) ( not ( = ?auto_1525619 ?auto_1525627 ) ) ( not ( = ?auto_1525619 ?auto_1525628 ) ) ( not ( = ?auto_1525620 ?auto_1525622 ) ) ( not ( = ?auto_1525620 ?auto_1525621 ) ) ( not ( = ?auto_1525620 ?auto_1525623 ) ) ( not ( = ?auto_1525620 ?auto_1525624 ) ) ( not ( = ?auto_1525620 ?auto_1525625 ) ) ( not ( = ?auto_1525620 ?auto_1525626 ) ) ( not ( = ?auto_1525620 ?auto_1525627 ) ) ( not ( = ?auto_1525620 ?auto_1525628 ) ) ( not ( = ?auto_1525622 ?auto_1525621 ) ) ( not ( = ?auto_1525622 ?auto_1525623 ) ) ( not ( = ?auto_1525622 ?auto_1525624 ) ) ( not ( = ?auto_1525622 ?auto_1525625 ) ) ( not ( = ?auto_1525622 ?auto_1525626 ) ) ( not ( = ?auto_1525622 ?auto_1525627 ) ) ( not ( = ?auto_1525622 ?auto_1525628 ) ) ( not ( = ?auto_1525621 ?auto_1525623 ) ) ( not ( = ?auto_1525621 ?auto_1525624 ) ) ( not ( = ?auto_1525621 ?auto_1525625 ) ) ( not ( = ?auto_1525621 ?auto_1525626 ) ) ( not ( = ?auto_1525621 ?auto_1525627 ) ) ( not ( = ?auto_1525621 ?auto_1525628 ) ) ( not ( = ?auto_1525623 ?auto_1525624 ) ) ( not ( = ?auto_1525623 ?auto_1525625 ) ) ( not ( = ?auto_1525623 ?auto_1525626 ) ) ( not ( = ?auto_1525623 ?auto_1525627 ) ) ( not ( = ?auto_1525623 ?auto_1525628 ) ) ( not ( = ?auto_1525624 ?auto_1525625 ) ) ( not ( = ?auto_1525624 ?auto_1525626 ) ) ( not ( = ?auto_1525624 ?auto_1525627 ) ) ( not ( = ?auto_1525624 ?auto_1525628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525625 ?auto_1525626 ?auto_1525627 )
      ( MAKE-9CRATE-VERIFY ?auto_1525618 ?auto_1525619 ?auto_1525620 ?auto_1525622 ?auto_1525621 ?auto_1525623 ?auto_1525624 ?auto_1525625 ?auto_1525626 ?auto_1525627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1525634 - SURFACE
      ?auto_1525635 - SURFACE
    )
    :vars
    (
      ?auto_1525638 - HOIST
      ?auto_1525637 - PLACE
      ?auto_1525641 - SURFACE
      ?auto_1525640 - PLACE
      ?auto_1525639 - HOIST
      ?auto_1525636 - SURFACE
      ?auto_1525642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525638 ?auto_1525637 ) ( IS-CRATE ?auto_1525635 ) ( not ( = ?auto_1525634 ?auto_1525635 ) ) ( not ( = ?auto_1525641 ?auto_1525634 ) ) ( not ( = ?auto_1525641 ?auto_1525635 ) ) ( not ( = ?auto_1525640 ?auto_1525637 ) ) ( HOIST-AT ?auto_1525639 ?auto_1525640 ) ( not ( = ?auto_1525638 ?auto_1525639 ) ) ( AVAILABLE ?auto_1525639 ) ( SURFACE-AT ?auto_1525635 ?auto_1525640 ) ( ON ?auto_1525635 ?auto_1525636 ) ( CLEAR ?auto_1525635 ) ( not ( = ?auto_1525634 ?auto_1525636 ) ) ( not ( = ?auto_1525635 ?auto_1525636 ) ) ( not ( = ?auto_1525641 ?auto_1525636 ) ) ( SURFACE-AT ?auto_1525641 ?auto_1525637 ) ( CLEAR ?auto_1525641 ) ( IS-CRATE ?auto_1525634 ) ( AVAILABLE ?auto_1525638 ) ( IN ?auto_1525634 ?auto_1525642 ) ( TRUCK-AT ?auto_1525642 ?auto_1525640 ) )
    :subtasks
    ( ( !DRIVE ?auto_1525642 ?auto_1525640 ?auto_1525637 )
      ( MAKE-2CRATE ?auto_1525641 ?auto_1525634 ?auto_1525635 )
      ( MAKE-1CRATE-VERIFY ?auto_1525634 ?auto_1525635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1525643 - SURFACE
      ?auto_1525644 - SURFACE
      ?auto_1525645 - SURFACE
    )
    :vars
    (
      ?auto_1525649 - HOIST
      ?auto_1525647 - PLACE
      ?auto_1525646 - PLACE
      ?auto_1525648 - HOIST
      ?auto_1525650 - SURFACE
      ?auto_1525651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525649 ?auto_1525647 ) ( IS-CRATE ?auto_1525645 ) ( not ( = ?auto_1525644 ?auto_1525645 ) ) ( not ( = ?auto_1525643 ?auto_1525644 ) ) ( not ( = ?auto_1525643 ?auto_1525645 ) ) ( not ( = ?auto_1525646 ?auto_1525647 ) ) ( HOIST-AT ?auto_1525648 ?auto_1525646 ) ( not ( = ?auto_1525649 ?auto_1525648 ) ) ( AVAILABLE ?auto_1525648 ) ( SURFACE-AT ?auto_1525645 ?auto_1525646 ) ( ON ?auto_1525645 ?auto_1525650 ) ( CLEAR ?auto_1525645 ) ( not ( = ?auto_1525644 ?auto_1525650 ) ) ( not ( = ?auto_1525645 ?auto_1525650 ) ) ( not ( = ?auto_1525643 ?auto_1525650 ) ) ( SURFACE-AT ?auto_1525643 ?auto_1525647 ) ( CLEAR ?auto_1525643 ) ( IS-CRATE ?auto_1525644 ) ( AVAILABLE ?auto_1525649 ) ( IN ?auto_1525644 ?auto_1525651 ) ( TRUCK-AT ?auto_1525651 ?auto_1525646 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1525644 ?auto_1525645 )
      ( MAKE-2CRATE-VERIFY ?auto_1525643 ?auto_1525644 ?auto_1525645 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1525652 - SURFACE
      ?auto_1525653 - SURFACE
      ?auto_1525654 - SURFACE
      ?auto_1525655 - SURFACE
    )
    :vars
    (
      ?auto_1525660 - HOIST
      ?auto_1525657 - PLACE
      ?auto_1525656 - PLACE
      ?auto_1525658 - HOIST
      ?auto_1525661 - SURFACE
      ?auto_1525659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525660 ?auto_1525657 ) ( IS-CRATE ?auto_1525655 ) ( not ( = ?auto_1525654 ?auto_1525655 ) ) ( not ( = ?auto_1525653 ?auto_1525654 ) ) ( not ( = ?auto_1525653 ?auto_1525655 ) ) ( not ( = ?auto_1525656 ?auto_1525657 ) ) ( HOIST-AT ?auto_1525658 ?auto_1525656 ) ( not ( = ?auto_1525660 ?auto_1525658 ) ) ( AVAILABLE ?auto_1525658 ) ( SURFACE-AT ?auto_1525655 ?auto_1525656 ) ( ON ?auto_1525655 ?auto_1525661 ) ( CLEAR ?auto_1525655 ) ( not ( = ?auto_1525654 ?auto_1525661 ) ) ( not ( = ?auto_1525655 ?auto_1525661 ) ) ( not ( = ?auto_1525653 ?auto_1525661 ) ) ( SURFACE-AT ?auto_1525653 ?auto_1525657 ) ( CLEAR ?auto_1525653 ) ( IS-CRATE ?auto_1525654 ) ( AVAILABLE ?auto_1525660 ) ( IN ?auto_1525654 ?auto_1525659 ) ( TRUCK-AT ?auto_1525659 ?auto_1525656 ) ( ON ?auto_1525653 ?auto_1525652 ) ( not ( = ?auto_1525652 ?auto_1525653 ) ) ( not ( = ?auto_1525652 ?auto_1525654 ) ) ( not ( = ?auto_1525652 ?auto_1525655 ) ) ( not ( = ?auto_1525652 ?auto_1525661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525653 ?auto_1525654 ?auto_1525655 )
      ( MAKE-3CRATE-VERIFY ?auto_1525652 ?auto_1525653 ?auto_1525654 ?auto_1525655 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1525662 - SURFACE
      ?auto_1525663 - SURFACE
      ?auto_1525664 - SURFACE
      ?auto_1525666 - SURFACE
      ?auto_1525665 - SURFACE
    )
    :vars
    (
      ?auto_1525671 - HOIST
      ?auto_1525668 - PLACE
      ?auto_1525667 - PLACE
      ?auto_1525669 - HOIST
      ?auto_1525672 - SURFACE
      ?auto_1525670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525671 ?auto_1525668 ) ( IS-CRATE ?auto_1525665 ) ( not ( = ?auto_1525666 ?auto_1525665 ) ) ( not ( = ?auto_1525664 ?auto_1525666 ) ) ( not ( = ?auto_1525664 ?auto_1525665 ) ) ( not ( = ?auto_1525667 ?auto_1525668 ) ) ( HOIST-AT ?auto_1525669 ?auto_1525667 ) ( not ( = ?auto_1525671 ?auto_1525669 ) ) ( AVAILABLE ?auto_1525669 ) ( SURFACE-AT ?auto_1525665 ?auto_1525667 ) ( ON ?auto_1525665 ?auto_1525672 ) ( CLEAR ?auto_1525665 ) ( not ( = ?auto_1525666 ?auto_1525672 ) ) ( not ( = ?auto_1525665 ?auto_1525672 ) ) ( not ( = ?auto_1525664 ?auto_1525672 ) ) ( SURFACE-AT ?auto_1525664 ?auto_1525668 ) ( CLEAR ?auto_1525664 ) ( IS-CRATE ?auto_1525666 ) ( AVAILABLE ?auto_1525671 ) ( IN ?auto_1525666 ?auto_1525670 ) ( TRUCK-AT ?auto_1525670 ?auto_1525667 ) ( ON ?auto_1525663 ?auto_1525662 ) ( ON ?auto_1525664 ?auto_1525663 ) ( not ( = ?auto_1525662 ?auto_1525663 ) ) ( not ( = ?auto_1525662 ?auto_1525664 ) ) ( not ( = ?auto_1525662 ?auto_1525666 ) ) ( not ( = ?auto_1525662 ?auto_1525665 ) ) ( not ( = ?auto_1525662 ?auto_1525672 ) ) ( not ( = ?auto_1525663 ?auto_1525664 ) ) ( not ( = ?auto_1525663 ?auto_1525666 ) ) ( not ( = ?auto_1525663 ?auto_1525665 ) ) ( not ( = ?auto_1525663 ?auto_1525672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525664 ?auto_1525666 ?auto_1525665 )
      ( MAKE-4CRATE-VERIFY ?auto_1525662 ?auto_1525663 ?auto_1525664 ?auto_1525666 ?auto_1525665 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1525673 - SURFACE
      ?auto_1525674 - SURFACE
      ?auto_1525675 - SURFACE
      ?auto_1525677 - SURFACE
      ?auto_1525676 - SURFACE
      ?auto_1525678 - SURFACE
    )
    :vars
    (
      ?auto_1525683 - HOIST
      ?auto_1525680 - PLACE
      ?auto_1525679 - PLACE
      ?auto_1525681 - HOIST
      ?auto_1525684 - SURFACE
      ?auto_1525682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525683 ?auto_1525680 ) ( IS-CRATE ?auto_1525678 ) ( not ( = ?auto_1525676 ?auto_1525678 ) ) ( not ( = ?auto_1525677 ?auto_1525676 ) ) ( not ( = ?auto_1525677 ?auto_1525678 ) ) ( not ( = ?auto_1525679 ?auto_1525680 ) ) ( HOIST-AT ?auto_1525681 ?auto_1525679 ) ( not ( = ?auto_1525683 ?auto_1525681 ) ) ( AVAILABLE ?auto_1525681 ) ( SURFACE-AT ?auto_1525678 ?auto_1525679 ) ( ON ?auto_1525678 ?auto_1525684 ) ( CLEAR ?auto_1525678 ) ( not ( = ?auto_1525676 ?auto_1525684 ) ) ( not ( = ?auto_1525678 ?auto_1525684 ) ) ( not ( = ?auto_1525677 ?auto_1525684 ) ) ( SURFACE-AT ?auto_1525677 ?auto_1525680 ) ( CLEAR ?auto_1525677 ) ( IS-CRATE ?auto_1525676 ) ( AVAILABLE ?auto_1525683 ) ( IN ?auto_1525676 ?auto_1525682 ) ( TRUCK-AT ?auto_1525682 ?auto_1525679 ) ( ON ?auto_1525674 ?auto_1525673 ) ( ON ?auto_1525675 ?auto_1525674 ) ( ON ?auto_1525677 ?auto_1525675 ) ( not ( = ?auto_1525673 ?auto_1525674 ) ) ( not ( = ?auto_1525673 ?auto_1525675 ) ) ( not ( = ?auto_1525673 ?auto_1525677 ) ) ( not ( = ?auto_1525673 ?auto_1525676 ) ) ( not ( = ?auto_1525673 ?auto_1525678 ) ) ( not ( = ?auto_1525673 ?auto_1525684 ) ) ( not ( = ?auto_1525674 ?auto_1525675 ) ) ( not ( = ?auto_1525674 ?auto_1525677 ) ) ( not ( = ?auto_1525674 ?auto_1525676 ) ) ( not ( = ?auto_1525674 ?auto_1525678 ) ) ( not ( = ?auto_1525674 ?auto_1525684 ) ) ( not ( = ?auto_1525675 ?auto_1525677 ) ) ( not ( = ?auto_1525675 ?auto_1525676 ) ) ( not ( = ?auto_1525675 ?auto_1525678 ) ) ( not ( = ?auto_1525675 ?auto_1525684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525677 ?auto_1525676 ?auto_1525678 )
      ( MAKE-5CRATE-VERIFY ?auto_1525673 ?auto_1525674 ?auto_1525675 ?auto_1525677 ?auto_1525676 ?auto_1525678 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1525685 - SURFACE
      ?auto_1525686 - SURFACE
      ?auto_1525687 - SURFACE
      ?auto_1525689 - SURFACE
      ?auto_1525688 - SURFACE
      ?auto_1525690 - SURFACE
      ?auto_1525691 - SURFACE
    )
    :vars
    (
      ?auto_1525696 - HOIST
      ?auto_1525693 - PLACE
      ?auto_1525692 - PLACE
      ?auto_1525694 - HOIST
      ?auto_1525697 - SURFACE
      ?auto_1525695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525696 ?auto_1525693 ) ( IS-CRATE ?auto_1525691 ) ( not ( = ?auto_1525690 ?auto_1525691 ) ) ( not ( = ?auto_1525688 ?auto_1525690 ) ) ( not ( = ?auto_1525688 ?auto_1525691 ) ) ( not ( = ?auto_1525692 ?auto_1525693 ) ) ( HOIST-AT ?auto_1525694 ?auto_1525692 ) ( not ( = ?auto_1525696 ?auto_1525694 ) ) ( AVAILABLE ?auto_1525694 ) ( SURFACE-AT ?auto_1525691 ?auto_1525692 ) ( ON ?auto_1525691 ?auto_1525697 ) ( CLEAR ?auto_1525691 ) ( not ( = ?auto_1525690 ?auto_1525697 ) ) ( not ( = ?auto_1525691 ?auto_1525697 ) ) ( not ( = ?auto_1525688 ?auto_1525697 ) ) ( SURFACE-AT ?auto_1525688 ?auto_1525693 ) ( CLEAR ?auto_1525688 ) ( IS-CRATE ?auto_1525690 ) ( AVAILABLE ?auto_1525696 ) ( IN ?auto_1525690 ?auto_1525695 ) ( TRUCK-AT ?auto_1525695 ?auto_1525692 ) ( ON ?auto_1525686 ?auto_1525685 ) ( ON ?auto_1525687 ?auto_1525686 ) ( ON ?auto_1525689 ?auto_1525687 ) ( ON ?auto_1525688 ?auto_1525689 ) ( not ( = ?auto_1525685 ?auto_1525686 ) ) ( not ( = ?auto_1525685 ?auto_1525687 ) ) ( not ( = ?auto_1525685 ?auto_1525689 ) ) ( not ( = ?auto_1525685 ?auto_1525688 ) ) ( not ( = ?auto_1525685 ?auto_1525690 ) ) ( not ( = ?auto_1525685 ?auto_1525691 ) ) ( not ( = ?auto_1525685 ?auto_1525697 ) ) ( not ( = ?auto_1525686 ?auto_1525687 ) ) ( not ( = ?auto_1525686 ?auto_1525689 ) ) ( not ( = ?auto_1525686 ?auto_1525688 ) ) ( not ( = ?auto_1525686 ?auto_1525690 ) ) ( not ( = ?auto_1525686 ?auto_1525691 ) ) ( not ( = ?auto_1525686 ?auto_1525697 ) ) ( not ( = ?auto_1525687 ?auto_1525689 ) ) ( not ( = ?auto_1525687 ?auto_1525688 ) ) ( not ( = ?auto_1525687 ?auto_1525690 ) ) ( not ( = ?auto_1525687 ?auto_1525691 ) ) ( not ( = ?auto_1525687 ?auto_1525697 ) ) ( not ( = ?auto_1525689 ?auto_1525688 ) ) ( not ( = ?auto_1525689 ?auto_1525690 ) ) ( not ( = ?auto_1525689 ?auto_1525691 ) ) ( not ( = ?auto_1525689 ?auto_1525697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525688 ?auto_1525690 ?auto_1525691 )
      ( MAKE-6CRATE-VERIFY ?auto_1525685 ?auto_1525686 ?auto_1525687 ?auto_1525689 ?auto_1525688 ?auto_1525690 ?auto_1525691 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1525698 - SURFACE
      ?auto_1525699 - SURFACE
      ?auto_1525700 - SURFACE
      ?auto_1525702 - SURFACE
      ?auto_1525701 - SURFACE
      ?auto_1525703 - SURFACE
      ?auto_1525704 - SURFACE
      ?auto_1525705 - SURFACE
    )
    :vars
    (
      ?auto_1525710 - HOIST
      ?auto_1525707 - PLACE
      ?auto_1525706 - PLACE
      ?auto_1525708 - HOIST
      ?auto_1525711 - SURFACE
      ?auto_1525709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525710 ?auto_1525707 ) ( IS-CRATE ?auto_1525705 ) ( not ( = ?auto_1525704 ?auto_1525705 ) ) ( not ( = ?auto_1525703 ?auto_1525704 ) ) ( not ( = ?auto_1525703 ?auto_1525705 ) ) ( not ( = ?auto_1525706 ?auto_1525707 ) ) ( HOIST-AT ?auto_1525708 ?auto_1525706 ) ( not ( = ?auto_1525710 ?auto_1525708 ) ) ( AVAILABLE ?auto_1525708 ) ( SURFACE-AT ?auto_1525705 ?auto_1525706 ) ( ON ?auto_1525705 ?auto_1525711 ) ( CLEAR ?auto_1525705 ) ( not ( = ?auto_1525704 ?auto_1525711 ) ) ( not ( = ?auto_1525705 ?auto_1525711 ) ) ( not ( = ?auto_1525703 ?auto_1525711 ) ) ( SURFACE-AT ?auto_1525703 ?auto_1525707 ) ( CLEAR ?auto_1525703 ) ( IS-CRATE ?auto_1525704 ) ( AVAILABLE ?auto_1525710 ) ( IN ?auto_1525704 ?auto_1525709 ) ( TRUCK-AT ?auto_1525709 ?auto_1525706 ) ( ON ?auto_1525699 ?auto_1525698 ) ( ON ?auto_1525700 ?auto_1525699 ) ( ON ?auto_1525702 ?auto_1525700 ) ( ON ?auto_1525701 ?auto_1525702 ) ( ON ?auto_1525703 ?auto_1525701 ) ( not ( = ?auto_1525698 ?auto_1525699 ) ) ( not ( = ?auto_1525698 ?auto_1525700 ) ) ( not ( = ?auto_1525698 ?auto_1525702 ) ) ( not ( = ?auto_1525698 ?auto_1525701 ) ) ( not ( = ?auto_1525698 ?auto_1525703 ) ) ( not ( = ?auto_1525698 ?auto_1525704 ) ) ( not ( = ?auto_1525698 ?auto_1525705 ) ) ( not ( = ?auto_1525698 ?auto_1525711 ) ) ( not ( = ?auto_1525699 ?auto_1525700 ) ) ( not ( = ?auto_1525699 ?auto_1525702 ) ) ( not ( = ?auto_1525699 ?auto_1525701 ) ) ( not ( = ?auto_1525699 ?auto_1525703 ) ) ( not ( = ?auto_1525699 ?auto_1525704 ) ) ( not ( = ?auto_1525699 ?auto_1525705 ) ) ( not ( = ?auto_1525699 ?auto_1525711 ) ) ( not ( = ?auto_1525700 ?auto_1525702 ) ) ( not ( = ?auto_1525700 ?auto_1525701 ) ) ( not ( = ?auto_1525700 ?auto_1525703 ) ) ( not ( = ?auto_1525700 ?auto_1525704 ) ) ( not ( = ?auto_1525700 ?auto_1525705 ) ) ( not ( = ?auto_1525700 ?auto_1525711 ) ) ( not ( = ?auto_1525702 ?auto_1525701 ) ) ( not ( = ?auto_1525702 ?auto_1525703 ) ) ( not ( = ?auto_1525702 ?auto_1525704 ) ) ( not ( = ?auto_1525702 ?auto_1525705 ) ) ( not ( = ?auto_1525702 ?auto_1525711 ) ) ( not ( = ?auto_1525701 ?auto_1525703 ) ) ( not ( = ?auto_1525701 ?auto_1525704 ) ) ( not ( = ?auto_1525701 ?auto_1525705 ) ) ( not ( = ?auto_1525701 ?auto_1525711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525703 ?auto_1525704 ?auto_1525705 )
      ( MAKE-7CRATE-VERIFY ?auto_1525698 ?auto_1525699 ?auto_1525700 ?auto_1525702 ?auto_1525701 ?auto_1525703 ?auto_1525704 ?auto_1525705 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1525712 - SURFACE
      ?auto_1525713 - SURFACE
      ?auto_1525714 - SURFACE
      ?auto_1525716 - SURFACE
      ?auto_1525715 - SURFACE
      ?auto_1525717 - SURFACE
      ?auto_1525718 - SURFACE
      ?auto_1525719 - SURFACE
      ?auto_1525720 - SURFACE
    )
    :vars
    (
      ?auto_1525725 - HOIST
      ?auto_1525722 - PLACE
      ?auto_1525721 - PLACE
      ?auto_1525723 - HOIST
      ?auto_1525726 - SURFACE
      ?auto_1525724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525725 ?auto_1525722 ) ( IS-CRATE ?auto_1525720 ) ( not ( = ?auto_1525719 ?auto_1525720 ) ) ( not ( = ?auto_1525718 ?auto_1525719 ) ) ( not ( = ?auto_1525718 ?auto_1525720 ) ) ( not ( = ?auto_1525721 ?auto_1525722 ) ) ( HOIST-AT ?auto_1525723 ?auto_1525721 ) ( not ( = ?auto_1525725 ?auto_1525723 ) ) ( AVAILABLE ?auto_1525723 ) ( SURFACE-AT ?auto_1525720 ?auto_1525721 ) ( ON ?auto_1525720 ?auto_1525726 ) ( CLEAR ?auto_1525720 ) ( not ( = ?auto_1525719 ?auto_1525726 ) ) ( not ( = ?auto_1525720 ?auto_1525726 ) ) ( not ( = ?auto_1525718 ?auto_1525726 ) ) ( SURFACE-AT ?auto_1525718 ?auto_1525722 ) ( CLEAR ?auto_1525718 ) ( IS-CRATE ?auto_1525719 ) ( AVAILABLE ?auto_1525725 ) ( IN ?auto_1525719 ?auto_1525724 ) ( TRUCK-AT ?auto_1525724 ?auto_1525721 ) ( ON ?auto_1525713 ?auto_1525712 ) ( ON ?auto_1525714 ?auto_1525713 ) ( ON ?auto_1525716 ?auto_1525714 ) ( ON ?auto_1525715 ?auto_1525716 ) ( ON ?auto_1525717 ?auto_1525715 ) ( ON ?auto_1525718 ?auto_1525717 ) ( not ( = ?auto_1525712 ?auto_1525713 ) ) ( not ( = ?auto_1525712 ?auto_1525714 ) ) ( not ( = ?auto_1525712 ?auto_1525716 ) ) ( not ( = ?auto_1525712 ?auto_1525715 ) ) ( not ( = ?auto_1525712 ?auto_1525717 ) ) ( not ( = ?auto_1525712 ?auto_1525718 ) ) ( not ( = ?auto_1525712 ?auto_1525719 ) ) ( not ( = ?auto_1525712 ?auto_1525720 ) ) ( not ( = ?auto_1525712 ?auto_1525726 ) ) ( not ( = ?auto_1525713 ?auto_1525714 ) ) ( not ( = ?auto_1525713 ?auto_1525716 ) ) ( not ( = ?auto_1525713 ?auto_1525715 ) ) ( not ( = ?auto_1525713 ?auto_1525717 ) ) ( not ( = ?auto_1525713 ?auto_1525718 ) ) ( not ( = ?auto_1525713 ?auto_1525719 ) ) ( not ( = ?auto_1525713 ?auto_1525720 ) ) ( not ( = ?auto_1525713 ?auto_1525726 ) ) ( not ( = ?auto_1525714 ?auto_1525716 ) ) ( not ( = ?auto_1525714 ?auto_1525715 ) ) ( not ( = ?auto_1525714 ?auto_1525717 ) ) ( not ( = ?auto_1525714 ?auto_1525718 ) ) ( not ( = ?auto_1525714 ?auto_1525719 ) ) ( not ( = ?auto_1525714 ?auto_1525720 ) ) ( not ( = ?auto_1525714 ?auto_1525726 ) ) ( not ( = ?auto_1525716 ?auto_1525715 ) ) ( not ( = ?auto_1525716 ?auto_1525717 ) ) ( not ( = ?auto_1525716 ?auto_1525718 ) ) ( not ( = ?auto_1525716 ?auto_1525719 ) ) ( not ( = ?auto_1525716 ?auto_1525720 ) ) ( not ( = ?auto_1525716 ?auto_1525726 ) ) ( not ( = ?auto_1525715 ?auto_1525717 ) ) ( not ( = ?auto_1525715 ?auto_1525718 ) ) ( not ( = ?auto_1525715 ?auto_1525719 ) ) ( not ( = ?auto_1525715 ?auto_1525720 ) ) ( not ( = ?auto_1525715 ?auto_1525726 ) ) ( not ( = ?auto_1525717 ?auto_1525718 ) ) ( not ( = ?auto_1525717 ?auto_1525719 ) ) ( not ( = ?auto_1525717 ?auto_1525720 ) ) ( not ( = ?auto_1525717 ?auto_1525726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525718 ?auto_1525719 ?auto_1525720 )
      ( MAKE-8CRATE-VERIFY ?auto_1525712 ?auto_1525713 ?auto_1525714 ?auto_1525716 ?auto_1525715 ?auto_1525717 ?auto_1525718 ?auto_1525719 ?auto_1525720 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525727 - SURFACE
      ?auto_1525728 - SURFACE
      ?auto_1525729 - SURFACE
      ?auto_1525731 - SURFACE
      ?auto_1525730 - SURFACE
      ?auto_1525732 - SURFACE
      ?auto_1525733 - SURFACE
      ?auto_1525734 - SURFACE
      ?auto_1525735 - SURFACE
      ?auto_1525736 - SURFACE
    )
    :vars
    (
      ?auto_1525741 - HOIST
      ?auto_1525738 - PLACE
      ?auto_1525737 - PLACE
      ?auto_1525739 - HOIST
      ?auto_1525742 - SURFACE
      ?auto_1525740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525741 ?auto_1525738 ) ( IS-CRATE ?auto_1525736 ) ( not ( = ?auto_1525735 ?auto_1525736 ) ) ( not ( = ?auto_1525734 ?auto_1525735 ) ) ( not ( = ?auto_1525734 ?auto_1525736 ) ) ( not ( = ?auto_1525737 ?auto_1525738 ) ) ( HOIST-AT ?auto_1525739 ?auto_1525737 ) ( not ( = ?auto_1525741 ?auto_1525739 ) ) ( AVAILABLE ?auto_1525739 ) ( SURFACE-AT ?auto_1525736 ?auto_1525737 ) ( ON ?auto_1525736 ?auto_1525742 ) ( CLEAR ?auto_1525736 ) ( not ( = ?auto_1525735 ?auto_1525742 ) ) ( not ( = ?auto_1525736 ?auto_1525742 ) ) ( not ( = ?auto_1525734 ?auto_1525742 ) ) ( SURFACE-AT ?auto_1525734 ?auto_1525738 ) ( CLEAR ?auto_1525734 ) ( IS-CRATE ?auto_1525735 ) ( AVAILABLE ?auto_1525741 ) ( IN ?auto_1525735 ?auto_1525740 ) ( TRUCK-AT ?auto_1525740 ?auto_1525737 ) ( ON ?auto_1525728 ?auto_1525727 ) ( ON ?auto_1525729 ?auto_1525728 ) ( ON ?auto_1525731 ?auto_1525729 ) ( ON ?auto_1525730 ?auto_1525731 ) ( ON ?auto_1525732 ?auto_1525730 ) ( ON ?auto_1525733 ?auto_1525732 ) ( ON ?auto_1525734 ?auto_1525733 ) ( not ( = ?auto_1525727 ?auto_1525728 ) ) ( not ( = ?auto_1525727 ?auto_1525729 ) ) ( not ( = ?auto_1525727 ?auto_1525731 ) ) ( not ( = ?auto_1525727 ?auto_1525730 ) ) ( not ( = ?auto_1525727 ?auto_1525732 ) ) ( not ( = ?auto_1525727 ?auto_1525733 ) ) ( not ( = ?auto_1525727 ?auto_1525734 ) ) ( not ( = ?auto_1525727 ?auto_1525735 ) ) ( not ( = ?auto_1525727 ?auto_1525736 ) ) ( not ( = ?auto_1525727 ?auto_1525742 ) ) ( not ( = ?auto_1525728 ?auto_1525729 ) ) ( not ( = ?auto_1525728 ?auto_1525731 ) ) ( not ( = ?auto_1525728 ?auto_1525730 ) ) ( not ( = ?auto_1525728 ?auto_1525732 ) ) ( not ( = ?auto_1525728 ?auto_1525733 ) ) ( not ( = ?auto_1525728 ?auto_1525734 ) ) ( not ( = ?auto_1525728 ?auto_1525735 ) ) ( not ( = ?auto_1525728 ?auto_1525736 ) ) ( not ( = ?auto_1525728 ?auto_1525742 ) ) ( not ( = ?auto_1525729 ?auto_1525731 ) ) ( not ( = ?auto_1525729 ?auto_1525730 ) ) ( not ( = ?auto_1525729 ?auto_1525732 ) ) ( not ( = ?auto_1525729 ?auto_1525733 ) ) ( not ( = ?auto_1525729 ?auto_1525734 ) ) ( not ( = ?auto_1525729 ?auto_1525735 ) ) ( not ( = ?auto_1525729 ?auto_1525736 ) ) ( not ( = ?auto_1525729 ?auto_1525742 ) ) ( not ( = ?auto_1525731 ?auto_1525730 ) ) ( not ( = ?auto_1525731 ?auto_1525732 ) ) ( not ( = ?auto_1525731 ?auto_1525733 ) ) ( not ( = ?auto_1525731 ?auto_1525734 ) ) ( not ( = ?auto_1525731 ?auto_1525735 ) ) ( not ( = ?auto_1525731 ?auto_1525736 ) ) ( not ( = ?auto_1525731 ?auto_1525742 ) ) ( not ( = ?auto_1525730 ?auto_1525732 ) ) ( not ( = ?auto_1525730 ?auto_1525733 ) ) ( not ( = ?auto_1525730 ?auto_1525734 ) ) ( not ( = ?auto_1525730 ?auto_1525735 ) ) ( not ( = ?auto_1525730 ?auto_1525736 ) ) ( not ( = ?auto_1525730 ?auto_1525742 ) ) ( not ( = ?auto_1525732 ?auto_1525733 ) ) ( not ( = ?auto_1525732 ?auto_1525734 ) ) ( not ( = ?auto_1525732 ?auto_1525735 ) ) ( not ( = ?auto_1525732 ?auto_1525736 ) ) ( not ( = ?auto_1525732 ?auto_1525742 ) ) ( not ( = ?auto_1525733 ?auto_1525734 ) ) ( not ( = ?auto_1525733 ?auto_1525735 ) ) ( not ( = ?auto_1525733 ?auto_1525736 ) ) ( not ( = ?auto_1525733 ?auto_1525742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525734 ?auto_1525735 ?auto_1525736 )
      ( MAKE-9CRATE-VERIFY ?auto_1525727 ?auto_1525728 ?auto_1525729 ?auto_1525731 ?auto_1525730 ?auto_1525732 ?auto_1525733 ?auto_1525734 ?auto_1525735 ?auto_1525736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1525743 - SURFACE
      ?auto_1525744 - SURFACE
    )
    :vars
    (
      ?auto_1525750 - HOIST
      ?auto_1525746 - PLACE
      ?auto_1525747 - SURFACE
      ?auto_1525745 - PLACE
      ?auto_1525748 - HOIST
      ?auto_1525751 - SURFACE
      ?auto_1525749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525750 ?auto_1525746 ) ( IS-CRATE ?auto_1525744 ) ( not ( = ?auto_1525743 ?auto_1525744 ) ) ( not ( = ?auto_1525747 ?auto_1525743 ) ) ( not ( = ?auto_1525747 ?auto_1525744 ) ) ( not ( = ?auto_1525745 ?auto_1525746 ) ) ( HOIST-AT ?auto_1525748 ?auto_1525745 ) ( not ( = ?auto_1525750 ?auto_1525748 ) ) ( SURFACE-AT ?auto_1525744 ?auto_1525745 ) ( ON ?auto_1525744 ?auto_1525751 ) ( CLEAR ?auto_1525744 ) ( not ( = ?auto_1525743 ?auto_1525751 ) ) ( not ( = ?auto_1525744 ?auto_1525751 ) ) ( not ( = ?auto_1525747 ?auto_1525751 ) ) ( SURFACE-AT ?auto_1525747 ?auto_1525746 ) ( CLEAR ?auto_1525747 ) ( IS-CRATE ?auto_1525743 ) ( AVAILABLE ?auto_1525750 ) ( TRUCK-AT ?auto_1525749 ?auto_1525745 ) ( LIFTING ?auto_1525748 ?auto_1525743 ) )
    :subtasks
    ( ( !LOAD ?auto_1525748 ?auto_1525743 ?auto_1525749 ?auto_1525745 )
      ( MAKE-2CRATE ?auto_1525747 ?auto_1525743 ?auto_1525744 )
      ( MAKE-1CRATE-VERIFY ?auto_1525743 ?auto_1525744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1525752 - SURFACE
      ?auto_1525753 - SURFACE
      ?auto_1525754 - SURFACE
    )
    :vars
    (
      ?auto_1525755 - HOIST
      ?auto_1525759 - PLACE
      ?auto_1525756 - PLACE
      ?auto_1525760 - HOIST
      ?auto_1525757 - SURFACE
      ?auto_1525758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525755 ?auto_1525759 ) ( IS-CRATE ?auto_1525754 ) ( not ( = ?auto_1525753 ?auto_1525754 ) ) ( not ( = ?auto_1525752 ?auto_1525753 ) ) ( not ( = ?auto_1525752 ?auto_1525754 ) ) ( not ( = ?auto_1525756 ?auto_1525759 ) ) ( HOIST-AT ?auto_1525760 ?auto_1525756 ) ( not ( = ?auto_1525755 ?auto_1525760 ) ) ( SURFACE-AT ?auto_1525754 ?auto_1525756 ) ( ON ?auto_1525754 ?auto_1525757 ) ( CLEAR ?auto_1525754 ) ( not ( = ?auto_1525753 ?auto_1525757 ) ) ( not ( = ?auto_1525754 ?auto_1525757 ) ) ( not ( = ?auto_1525752 ?auto_1525757 ) ) ( SURFACE-AT ?auto_1525752 ?auto_1525759 ) ( CLEAR ?auto_1525752 ) ( IS-CRATE ?auto_1525753 ) ( AVAILABLE ?auto_1525755 ) ( TRUCK-AT ?auto_1525758 ?auto_1525756 ) ( LIFTING ?auto_1525760 ?auto_1525753 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1525753 ?auto_1525754 )
      ( MAKE-2CRATE-VERIFY ?auto_1525752 ?auto_1525753 ?auto_1525754 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1525761 - SURFACE
      ?auto_1525762 - SURFACE
      ?auto_1525763 - SURFACE
      ?auto_1525764 - SURFACE
    )
    :vars
    (
      ?auto_1525766 - HOIST
      ?auto_1525769 - PLACE
      ?auto_1525768 - PLACE
      ?auto_1525770 - HOIST
      ?auto_1525767 - SURFACE
      ?auto_1525765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525766 ?auto_1525769 ) ( IS-CRATE ?auto_1525764 ) ( not ( = ?auto_1525763 ?auto_1525764 ) ) ( not ( = ?auto_1525762 ?auto_1525763 ) ) ( not ( = ?auto_1525762 ?auto_1525764 ) ) ( not ( = ?auto_1525768 ?auto_1525769 ) ) ( HOIST-AT ?auto_1525770 ?auto_1525768 ) ( not ( = ?auto_1525766 ?auto_1525770 ) ) ( SURFACE-AT ?auto_1525764 ?auto_1525768 ) ( ON ?auto_1525764 ?auto_1525767 ) ( CLEAR ?auto_1525764 ) ( not ( = ?auto_1525763 ?auto_1525767 ) ) ( not ( = ?auto_1525764 ?auto_1525767 ) ) ( not ( = ?auto_1525762 ?auto_1525767 ) ) ( SURFACE-AT ?auto_1525762 ?auto_1525769 ) ( CLEAR ?auto_1525762 ) ( IS-CRATE ?auto_1525763 ) ( AVAILABLE ?auto_1525766 ) ( TRUCK-AT ?auto_1525765 ?auto_1525768 ) ( LIFTING ?auto_1525770 ?auto_1525763 ) ( ON ?auto_1525762 ?auto_1525761 ) ( not ( = ?auto_1525761 ?auto_1525762 ) ) ( not ( = ?auto_1525761 ?auto_1525763 ) ) ( not ( = ?auto_1525761 ?auto_1525764 ) ) ( not ( = ?auto_1525761 ?auto_1525767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525762 ?auto_1525763 ?auto_1525764 )
      ( MAKE-3CRATE-VERIFY ?auto_1525761 ?auto_1525762 ?auto_1525763 ?auto_1525764 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1525771 - SURFACE
      ?auto_1525772 - SURFACE
      ?auto_1525773 - SURFACE
      ?auto_1525775 - SURFACE
      ?auto_1525774 - SURFACE
    )
    :vars
    (
      ?auto_1525777 - HOIST
      ?auto_1525780 - PLACE
      ?auto_1525779 - PLACE
      ?auto_1525781 - HOIST
      ?auto_1525778 - SURFACE
      ?auto_1525776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525777 ?auto_1525780 ) ( IS-CRATE ?auto_1525774 ) ( not ( = ?auto_1525775 ?auto_1525774 ) ) ( not ( = ?auto_1525773 ?auto_1525775 ) ) ( not ( = ?auto_1525773 ?auto_1525774 ) ) ( not ( = ?auto_1525779 ?auto_1525780 ) ) ( HOIST-AT ?auto_1525781 ?auto_1525779 ) ( not ( = ?auto_1525777 ?auto_1525781 ) ) ( SURFACE-AT ?auto_1525774 ?auto_1525779 ) ( ON ?auto_1525774 ?auto_1525778 ) ( CLEAR ?auto_1525774 ) ( not ( = ?auto_1525775 ?auto_1525778 ) ) ( not ( = ?auto_1525774 ?auto_1525778 ) ) ( not ( = ?auto_1525773 ?auto_1525778 ) ) ( SURFACE-AT ?auto_1525773 ?auto_1525780 ) ( CLEAR ?auto_1525773 ) ( IS-CRATE ?auto_1525775 ) ( AVAILABLE ?auto_1525777 ) ( TRUCK-AT ?auto_1525776 ?auto_1525779 ) ( LIFTING ?auto_1525781 ?auto_1525775 ) ( ON ?auto_1525772 ?auto_1525771 ) ( ON ?auto_1525773 ?auto_1525772 ) ( not ( = ?auto_1525771 ?auto_1525772 ) ) ( not ( = ?auto_1525771 ?auto_1525773 ) ) ( not ( = ?auto_1525771 ?auto_1525775 ) ) ( not ( = ?auto_1525771 ?auto_1525774 ) ) ( not ( = ?auto_1525771 ?auto_1525778 ) ) ( not ( = ?auto_1525772 ?auto_1525773 ) ) ( not ( = ?auto_1525772 ?auto_1525775 ) ) ( not ( = ?auto_1525772 ?auto_1525774 ) ) ( not ( = ?auto_1525772 ?auto_1525778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525773 ?auto_1525775 ?auto_1525774 )
      ( MAKE-4CRATE-VERIFY ?auto_1525771 ?auto_1525772 ?auto_1525773 ?auto_1525775 ?auto_1525774 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1525782 - SURFACE
      ?auto_1525783 - SURFACE
      ?auto_1525784 - SURFACE
      ?auto_1525786 - SURFACE
      ?auto_1525785 - SURFACE
      ?auto_1525787 - SURFACE
    )
    :vars
    (
      ?auto_1525789 - HOIST
      ?auto_1525792 - PLACE
      ?auto_1525791 - PLACE
      ?auto_1525793 - HOIST
      ?auto_1525790 - SURFACE
      ?auto_1525788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525789 ?auto_1525792 ) ( IS-CRATE ?auto_1525787 ) ( not ( = ?auto_1525785 ?auto_1525787 ) ) ( not ( = ?auto_1525786 ?auto_1525785 ) ) ( not ( = ?auto_1525786 ?auto_1525787 ) ) ( not ( = ?auto_1525791 ?auto_1525792 ) ) ( HOIST-AT ?auto_1525793 ?auto_1525791 ) ( not ( = ?auto_1525789 ?auto_1525793 ) ) ( SURFACE-AT ?auto_1525787 ?auto_1525791 ) ( ON ?auto_1525787 ?auto_1525790 ) ( CLEAR ?auto_1525787 ) ( not ( = ?auto_1525785 ?auto_1525790 ) ) ( not ( = ?auto_1525787 ?auto_1525790 ) ) ( not ( = ?auto_1525786 ?auto_1525790 ) ) ( SURFACE-AT ?auto_1525786 ?auto_1525792 ) ( CLEAR ?auto_1525786 ) ( IS-CRATE ?auto_1525785 ) ( AVAILABLE ?auto_1525789 ) ( TRUCK-AT ?auto_1525788 ?auto_1525791 ) ( LIFTING ?auto_1525793 ?auto_1525785 ) ( ON ?auto_1525783 ?auto_1525782 ) ( ON ?auto_1525784 ?auto_1525783 ) ( ON ?auto_1525786 ?auto_1525784 ) ( not ( = ?auto_1525782 ?auto_1525783 ) ) ( not ( = ?auto_1525782 ?auto_1525784 ) ) ( not ( = ?auto_1525782 ?auto_1525786 ) ) ( not ( = ?auto_1525782 ?auto_1525785 ) ) ( not ( = ?auto_1525782 ?auto_1525787 ) ) ( not ( = ?auto_1525782 ?auto_1525790 ) ) ( not ( = ?auto_1525783 ?auto_1525784 ) ) ( not ( = ?auto_1525783 ?auto_1525786 ) ) ( not ( = ?auto_1525783 ?auto_1525785 ) ) ( not ( = ?auto_1525783 ?auto_1525787 ) ) ( not ( = ?auto_1525783 ?auto_1525790 ) ) ( not ( = ?auto_1525784 ?auto_1525786 ) ) ( not ( = ?auto_1525784 ?auto_1525785 ) ) ( not ( = ?auto_1525784 ?auto_1525787 ) ) ( not ( = ?auto_1525784 ?auto_1525790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525786 ?auto_1525785 ?auto_1525787 )
      ( MAKE-5CRATE-VERIFY ?auto_1525782 ?auto_1525783 ?auto_1525784 ?auto_1525786 ?auto_1525785 ?auto_1525787 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1525794 - SURFACE
      ?auto_1525795 - SURFACE
      ?auto_1525796 - SURFACE
      ?auto_1525798 - SURFACE
      ?auto_1525797 - SURFACE
      ?auto_1525799 - SURFACE
      ?auto_1525800 - SURFACE
    )
    :vars
    (
      ?auto_1525802 - HOIST
      ?auto_1525805 - PLACE
      ?auto_1525804 - PLACE
      ?auto_1525806 - HOIST
      ?auto_1525803 - SURFACE
      ?auto_1525801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525802 ?auto_1525805 ) ( IS-CRATE ?auto_1525800 ) ( not ( = ?auto_1525799 ?auto_1525800 ) ) ( not ( = ?auto_1525797 ?auto_1525799 ) ) ( not ( = ?auto_1525797 ?auto_1525800 ) ) ( not ( = ?auto_1525804 ?auto_1525805 ) ) ( HOIST-AT ?auto_1525806 ?auto_1525804 ) ( not ( = ?auto_1525802 ?auto_1525806 ) ) ( SURFACE-AT ?auto_1525800 ?auto_1525804 ) ( ON ?auto_1525800 ?auto_1525803 ) ( CLEAR ?auto_1525800 ) ( not ( = ?auto_1525799 ?auto_1525803 ) ) ( not ( = ?auto_1525800 ?auto_1525803 ) ) ( not ( = ?auto_1525797 ?auto_1525803 ) ) ( SURFACE-AT ?auto_1525797 ?auto_1525805 ) ( CLEAR ?auto_1525797 ) ( IS-CRATE ?auto_1525799 ) ( AVAILABLE ?auto_1525802 ) ( TRUCK-AT ?auto_1525801 ?auto_1525804 ) ( LIFTING ?auto_1525806 ?auto_1525799 ) ( ON ?auto_1525795 ?auto_1525794 ) ( ON ?auto_1525796 ?auto_1525795 ) ( ON ?auto_1525798 ?auto_1525796 ) ( ON ?auto_1525797 ?auto_1525798 ) ( not ( = ?auto_1525794 ?auto_1525795 ) ) ( not ( = ?auto_1525794 ?auto_1525796 ) ) ( not ( = ?auto_1525794 ?auto_1525798 ) ) ( not ( = ?auto_1525794 ?auto_1525797 ) ) ( not ( = ?auto_1525794 ?auto_1525799 ) ) ( not ( = ?auto_1525794 ?auto_1525800 ) ) ( not ( = ?auto_1525794 ?auto_1525803 ) ) ( not ( = ?auto_1525795 ?auto_1525796 ) ) ( not ( = ?auto_1525795 ?auto_1525798 ) ) ( not ( = ?auto_1525795 ?auto_1525797 ) ) ( not ( = ?auto_1525795 ?auto_1525799 ) ) ( not ( = ?auto_1525795 ?auto_1525800 ) ) ( not ( = ?auto_1525795 ?auto_1525803 ) ) ( not ( = ?auto_1525796 ?auto_1525798 ) ) ( not ( = ?auto_1525796 ?auto_1525797 ) ) ( not ( = ?auto_1525796 ?auto_1525799 ) ) ( not ( = ?auto_1525796 ?auto_1525800 ) ) ( not ( = ?auto_1525796 ?auto_1525803 ) ) ( not ( = ?auto_1525798 ?auto_1525797 ) ) ( not ( = ?auto_1525798 ?auto_1525799 ) ) ( not ( = ?auto_1525798 ?auto_1525800 ) ) ( not ( = ?auto_1525798 ?auto_1525803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525797 ?auto_1525799 ?auto_1525800 )
      ( MAKE-6CRATE-VERIFY ?auto_1525794 ?auto_1525795 ?auto_1525796 ?auto_1525798 ?auto_1525797 ?auto_1525799 ?auto_1525800 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1525807 - SURFACE
      ?auto_1525808 - SURFACE
      ?auto_1525809 - SURFACE
      ?auto_1525811 - SURFACE
      ?auto_1525810 - SURFACE
      ?auto_1525812 - SURFACE
      ?auto_1525813 - SURFACE
      ?auto_1525814 - SURFACE
    )
    :vars
    (
      ?auto_1525816 - HOIST
      ?auto_1525819 - PLACE
      ?auto_1525818 - PLACE
      ?auto_1525820 - HOIST
      ?auto_1525817 - SURFACE
      ?auto_1525815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525816 ?auto_1525819 ) ( IS-CRATE ?auto_1525814 ) ( not ( = ?auto_1525813 ?auto_1525814 ) ) ( not ( = ?auto_1525812 ?auto_1525813 ) ) ( not ( = ?auto_1525812 ?auto_1525814 ) ) ( not ( = ?auto_1525818 ?auto_1525819 ) ) ( HOIST-AT ?auto_1525820 ?auto_1525818 ) ( not ( = ?auto_1525816 ?auto_1525820 ) ) ( SURFACE-AT ?auto_1525814 ?auto_1525818 ) ( ON ?auto_1525814 ?auto_1525817 ) ( CLEAR ?auto_1525814 ) ( not ( = ?auto_1525813 ?auto_1525817 ) ) ( not ( = ?auto_1525814 ?auto_1525817 ) ) ( not ( = ?auto_1525812 ?auto_1525817 ) ) ( SURFACE-AT ?auto_1525812 ?auto_1525819 ) ( CLEAR ?auto_1525812 ) ( IS-CRATE ?auto_1525813 ) ( AVAILABLE ?auto_1525816 ) ( TRUCK-AT ?auto_1525815 ?auto_1525818 ) ( LIFTING ?auto_1525820 ?auto_1525813 ) ( ON ?auto_1525808 ?auto_1525807 ) ( ON ?auto_1525809 ?auto_1525808 ) ( ON ?auto_1525811 ?auto_1525809 ) ( ON ?auto_1525810 ?auto_1525811 ) ( ON ?auto_1525812 ?auto_1525810 ) ( not ( = ?auto_1525807 ?auto_1525808 ) ) ( not ( = ?auto_1525807 ?auto_1525809 ) ) ( not ( = ?auto_1525807 ?auto_1525811 ) ) ( not ( = ?auto_1525807 ?auto_1525810 ) ) ( not ( = ?auto_1525807 ?auto_1525812 ) ) ( not ( = ?auto_1525807 ?auto_1525813 ) ) ( not ( = ?auto_1525807 ?auto_1525814 ) ) ( not ( = ?auto_1525807 ?auto_1525817 ) ) ( not ( = ?auto_1525808 ?auto_1525809 ) ) ( not ( = ?auto_1525808 ?auto_1525811 ) ) ( not ( = ?auto_1525808 ?auto_1525810 ) ) ( not ( = ?auto_1525808 ?auto_1525812 ) ) ( not ( = ?auto_1525808 ?auto_1525813 ) ) ( not ( = ?auto_1525808 ?auto_1525814 ) ) ( not ( = ?auto_1525808 ?auto_1525817 ) ) ( not ( = ?auto_1525809 ?auto_1525811 ) ) ( not ( = ?auto_1525809 ?auto_1525810 ) ) ( not ( = ?auto_1525809 ?auto_1525812 ) ) ( not ( = ?auto_1525809 ?auto_1525813 ) ) ( not ( = ?auto_1525809 ?auto_1525814 ) ) ( not ( = ?auto_1525809 ?auto_1525817 ) ) ( not ( = ?auto_1525811 ?auto_1525810 ) ) ( not ( = ?auto_1525811 ?auto_1525812 ) ) ( not ( = ?auto_1525811 ?auto_1525813 ) ) ( not ( = ?auto_1525811 ?auto_1525814 ) ) ( not ( = ?auto_1525811 ?auto_1525817 ) ) ( not ( = ?auto_1525810 ?auto_1525812 ) ) ( not ( = ?auto_1525810 ?auto_1525813 ) ) ( not ( = ?auto_1525810 ?auto_1525814 ) ) ( not ( = ?auto_1525810 ?auto_1525817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525812 ?auto_1525813 ?auto_1525814 )
      ( MAKE-7CRATE-VERIFY ?auto_1525807 ?auto_1525808 ?auto_1525809 ?auto_1525811 ?auto_1525810 ?auto_1525812 ?auto_1525813 ?auto_1525814 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1525821 - SURFACE
      ?auto_1525822 - SURFACE
      ?auto_1525823 - SURFACE
      ?auto_1525825 - SURFACE
      ?auto_1525824 - SURFACE
      ?auto_1525826 - SURFACE
      ?auto_1525827 - SURFACE
      ?auto_1525828 - SURFACE
      ?auto_1525829 - SURFACE
    )
    :vars
    (
      ?auto_1525831 - HOIST
      ?auto_1525834 - PLACE
      ?auto_1525833 - PLACE
      ?auto_1525835 - HOIST
      ?auto_1525832 - SURFACE
      ?auto_1525830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525831 ?auto_1525834 ) ( IS-CRATE ?auto_1525829 ) ( not ( = ?auto_1525828 ?auto_1525829 ) ) ( not ( = ?auto_1525827 ?auto_1525828 ) ) ( not ( = ?auto_1525827 ?auto_1525829 ) ) ( not ( = ?auto_1525833 ?auto_1525834 ) ) ( HOIST-AT ?auto_1525835 ?auto_1525833 ) ( not ( = ?auto_1525831 ?auto_1525835 ) ) ( SURFACE-AT ?auto_1525829 ?auto_1525833 ) ( ON ?auto_1525829 ?auto_1525832 ) ( CLEAR ?auto_1525829 ) ( not ( = ?auto_1525828 ?auto_1525832 ) ) ( not ( = ?auto_1525829 ?auto_1525832 ) ) ( not ( = ?auto_1525827 ?auto_1525832 ) ) ( SURFACE-AT ?auto_1525827 ?auto_1525834 ) ( CLEAR ?auto_1525827 ) ( IS-CRATE ?auto_1525828 ) ( AVAILABLE ?auto_1525831 ) ( TRUCK-AT ?auto_1525830 ?auto_1525833 ) ( LIFTING ?auto_1525835 ?auto_1525828 ) ( ON ?auto_1525822 ?auto_1525821 ) ( ON ?auto_1525823 ?auto_1525822 ) ( ON ?auto_1525825 ?auto_1525823 ) ( ON ?auto_1525824 ?auto_1525825 ) ( ON ?auto_1525826 ?auto_1525824 ) ( ON ?auto_1525827 ?auto_1525826 ) ( not ( = ?auto_1525821 ?auto_1525822 ) ) ( not ( = ?auto_1525821 ?auto_1525823 ) ) ( not ( = ?auto_1525821 ?auto_1525825 ) ) ( not ( = ?auto_1525821 ?auto_1525824 ) ) ( not ( = ?auto_1525821 ?auto_1525826 ) ) ( not ( = ?auto_1525821 ?auto_1525827 ) ) ( not ( = ?auto_1525821 ?auto_1525828 ) ) ( not ( = ?auto_1525821 ?auto_1525829 ) ) ( not ( = ?auto_1525821 ?auto_1525832 ) ) ( not ( = ?auto_1525822 ?auto_1525823 ) ) ( not ( = ?auto_1525822 ?auto_1525825 ) ) ( not ( = ?auto_1525822 ?auto_1525824 ) ) ( not ( = ?auto_1525822 ?auto_1525826 ) ) ( not ( = ?auto_1525822 ?auto_1525827 ) ) ( not ( = ?auto_1525822 ?auto_1525828 ) ) ( not ( = ?auto_1525822 ?auto_1525829 ) ) ( not ( = ?auto_1525822 ?auto_1525832 ) ) ( not ( = ?auto_1525823 ?auto_1525825 ) ) ( not ( = ?auto_1525823 ?auto_1525824 ) ) ( not ( = ?auto_1525823 ?auto_1525826 ) ) ( not ( = ?auto_1525823 ?auto_1525827 ) ) ( not ( = ?auto_1525823 ?auto_1525828 ) ) ( not ( = ?auto_1525823 ?auto_1525829 ) ) ( not ( = ?auto_1525823 ?auto_1525832 ) ) ( not ( = ?auto_1525825 ?auto_1525824 ) ) ( not ( = ?auto_1525825 ?auto_1525826 ) ) ( not ( = ?auto_1525825 ?auto_1525827 ) ) ( not ( = ?auto_1525825 ?auto_1525828 ) ) ( not ( = ?auto_1525825 ?auto_1525829 ) ) ( not ( = ?auto_1525825 ?auto_1525832 ) ) ( not ( = ?auto_1525824 ?auto_1525826 ) ) ( not ( = ?auto_1525824 ?auto_1525827 ) ) ( not ( = ?auto_1525824 ?auto_1525828 ) ) ( not ( = ?auto_1525824 ?auto_1525829 ) ) ( not ( = ?auto_1525824 ?auto_1525832 ) ) ( not ( = ?auto_1525826 ?auto_1525827 ) ) ( not ( = ?auto_1525826 ?auto_1525828 ) ) ( not ( = ?auto_1525826 ?auto_1525829 ) ) ( not ( = ?auto_1525826 ?auto_1525832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525827 ?auto_1525828 ?auto_1525829 )
      ( MAKE-8CRATE-VERIFY ?auto_1525821 ?auto_1525822 ?auto_1525823 ?auto_1525825 ?auto_1525824 ?auto_1525826 ?auto_1525827 ?auto_1525828 ?auto_1525829 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525836 - SURFACE
      ?auto_1525837 - SURFACE
      ?auto_1525838 - SURFACE
      ?auto_1525840 - SURFACE
      ?auto_1525839 - SURFACE
      ?auto_1525841 - SURFACE
      ?auto_1525842 - SURFACE
      ?auto_1525843 - SURFACE
      ?auto_1525844 - SURFACE
      ?auto_1525845 - SURFACE
    )
    :vars
    (
      ?auto_1525847 - HOIST
      ?auto_1525850 - PLACE
      ?auto_1525849 - PLACE
      ?auto_1525851 - HOIST
      ?auto_1525848 - SURFACE
      ?auto_1525846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525847 ?auto_1525850 ) ( IS-CRATE ?auto_1525845 ) ( not ( = ?auto_1525844 ?auto_1525845 ) ) ( not ( = ?auto_1525843 ?auto_1525844 ) ) ( not ( = ?auto_1525843 ?auto_1525845 ) ) ( not ( = ?auto_1525849 ?auto_1525850 ) ) ( HOIST-AT ?auto_1525851 ?auto_1525849 ) ( not ( = ?auto_1525847 ?auto_1525851 ) ) ( SURFACE-AT ?auto_1525845 ?auto_1525849 ) ( ON ?auto_1525845 ?auto_1525848 ) ( CLEAR ?auto_1525845 ) ( not ( = ?auto_1525844 ?auto_1525848 ) ) ( not ( = ?auto_1525845 ?auto_1525848 ) ) ( not ( = ?auto_1525843 ?auto_1525848 ) ) ( SURFACE-AT ?auto_1525843 ?auto_1525850 ) ( CLEAR ?auto_1525843 ) ( IS-CRATE ?auto_1525844 ) ( AVAILABLE ?auto_1525847 ) ( TRUCK-AT ?auto_1525846 ?auto_1525849 ) ( LIFTING ?auto_1525851 ?auto_1525844 ) ( ON ?auto_1525837 ?auto_1525836 ) ( ON ?auto_1525838 ?auto_1525837 ) ( ON ?auto_1525840 ?auto_1525838 ) ( ON ?auto_1525839 ?auto_1525840 ) ( ON ?auto_1525841 ?auto_1525839 ) ( ON ?auto_1525842 ?auto_1525841 ) ( ON ?auto_1525843 ?auto_1525842 ) ( not ( = ?auto_1525836 ?auto_1525837 ) ) ( not ( = ?auto_1525836 ?auto_1525838 ) ) ( not ( = ?auto_1525836 ?auto_1525840 ) ) ( not ( = ?auto_1525836 ?auto_1525839 ) ) ( not ( = ?auto_1525836 ?auto_1525841 ) ) ( not ( = ?auto_1525836 ?auto_1525842 ) ) ( not ( = ?auto_1525836 ?auto_1525843 ) ) ( not ( = ?auto_1525836 ?auto_1525844 ) ) ( not ( = ?auto_1525836 ?auto_1525845 ) ) ( not ( = ?auto_1525836 ?auto_1525848 ) ) ( not ( = ?auto_1525837 ?auto_1525838 ) ) ( not ( = ?auto_1525837 ?auto_1525840 ) ) ( not ( = ?auto_1525837 ?auto_1525839 ) ) ( not ( = ?auto_1525837 ?auto_1525841 ) ) ( not ( = ?auto_1525837 ?auto_1525842 ) ) ( not ( = ?auto_1525837 ?auto_1525843 ) ) ( not ( = ?auto_1525837 ?auto_1525844 ) ) ( not ( = ?auto_1525837 ?auto_1525845 ) ) ( not ( = ?auto_1525837 ?auto_1525848 ) ) ( not ( = ?auto_1525838 ?auto_1525840 ) ) ( not ( = ?auto_1525838 ?auto_1525839 ) ) ( not ( = ?auto_1525838 ?auto_1525841 ) ) ( not ( = ?auto_1525838 ?auto_1525842 ) ) ( not ( = ?auto_1525838 ?auto_1525843 ) ) ( not ( = ?auto_1525838 ?auto_1525844 ) ) ( not ( = ?auto_1525838 ?auto_1525845 ) ) ( not ( = ?auto_1525838 ?auto_1525848 ) ) ( not ( = ?auto_1525840 ?auto_1525839 ) ) ( not ( = ?auto_1525840 ?auto_1525841 ) ) ( not ( = ?auto_1525840 ?auto_1525842 ) ) ( not ( = ?auto_1525840 ?auto_1525843 ) ) ( not ( = ?auto_1525840 ?auto_1525844 ) ) ( not ( = ?auto_1525840 ?auto_1525845 ) ) ( not ( = ?auto_1525840 ?auto_1525848 ) ) ( not ( = ?auto_1525839 ?auto_1525841 ) ) ( not ( = ?auto_1525839 ?auto_1525842 ) ) ( not ( = ?auto_1525839 ?auto_1525843 ) ) ( not ( = ?auto_1525839 ?auto_1525844 ) ) ( not ( = ?auto_1525839 ?auto_1525845 ) ) ( not ( = ?auto_1525839 ?auto_1525848 ) ) ( not ( = ?auto_1525841 ?auto_1525842 ) ) ( not ( = ?auto_1525841 ?auto_1525843 ) ) ( not ( = ?auto_1525841 ?auto_1525844 ) ) ( not ( = ?auto_1525841 ?auto_1525845 ) ) ( not ( = ?auto_1525841 ?auto_1525848 ) ) ( not ( = ?auto_1525842 ?auto_1525843 ) ) ( not ( = ?auto_1525842 ?auto_1525844 ) ) ( not ( = ?auto_1525842 ?auto_1525845 ) ) ( not ( = ?auto_1525842 ?auto_1525848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525843 ?auto_1525844 ?auto_1525845 )
      ( MAKE-9CRATE-VERIFY ?auto_1525836 ?auto_1525837 ?auto_1525838 ?auto_1525840 ?auto_1525839 ?auto_1525841 ?auto_1525842 ?auto_1525843 ?auto_1525844 ?auto_1525845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1525852 - SURFACE
      ?auto_1525853 - SURFACE
    )
    :vars
    (
      ?auto_1525855 - HOIST
      ?auto_1525859 - PLACE
      ?auto_1525858 - SURFACE
      ?auto_1525857 - PLACE
      ?auto_1525860 - HOIST
      ?auto_1525856 - SURFACE
      ?auto_1525854 - TRUCK
      ?auto_1525861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525855 ?auto_1525859 ) ( IS-CRATE ?auto_1525853 ) ( not ( = ?auto_1525852 ?auto_1525853 ) ) ( not ( = ?auto_1525858 ?auto_1525852 ) ) ( not ( = ?auto_1525858 ?auto_1525853 ) ) ( not ( = ?auto_1525857 ?auto_1525859 ) ) ( HOIST-AT ?auto_1525860 ?auto_1525857 ) ( not ( = ?auto_1525855 ?auto_1525860 ) ) ( SURFACE-AT ?auto_1525853 ?auto_1525857 ) ( ON ?auto_1525853 ?auto_1525856 ) ( CLEAR ?auto_1525853 ) ( not ( = ?auto_1525852 ?auto_1525856 ) ) ( not ( = ?auto_1525853 ?auto_1525856 ) ) ( not ( = ?auto_1525858 ?auto_1525856 ) ) ( SURFACE-AT ?auto_1525858 ?auto_1525859 ) ( CLEAR ?auto_1525858 ) ( IS-CRATE ?auto_1525852 ) ( AVAILABLE ?auto_1525855 ) ( TRUCK-AT ?auto_1525854 ?auto_1525857 ) ( AVAILABLE ?auto_1525860 ) ( SURFACE-AT ?auto_1525852 ?auto_1525857 ) ( ON ?auto_1525852 ?auto_1525861 ) ( CLEAR ?auto_1525852 ) ( not ( = ?auto_1525852 ?auto_1525861 ) ) ( not ( = ?auto_1525853 ?auto_1525861 ) ) ( not ( = ?auto_1525858 ?auto_1525861 ) ) ( not ( = ?auto_1525856 ?auto_1525861 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1525860 ?auto_1525852 ?auto_1525861 ?auto_1525857 )
      ( MAKE-2CRATE ?auto_1525858 ?auto_1525852 ?auto_1525853 )
      ( MAKE-1CRATE-VERIFY ?auto_1525852 ?auto_1525853 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1525862 - SURFACE
      ?auto_1525863 - SURFACE
      ?auto_1525864 - SURFACE
    )
    :vars
    (
      ?auto_1525867 - HOIST
      ?auto_1525871 - PLACE
      ?auto_1525870 - PLACE
      ?auto_1525866 - HOIST
      ?auto_1525868 - SURFACE
      ?auto_1525865 - TRUCK
      ?auto_1525869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525867 ?auto_1525871 ) ( IS-CRATE ?auto_1525864 ) ( not ( = ?auto_1525863 ?auto_1525864 ) ) ( not ( = ?auto_1525862 ?auto_1525863 ) ) ( not ( = ?auto_1525862 ?auto_1525864 ) ) ( not ( = ?auto_1525870 ?auto_1525871 ) ) ( HOIST-AT ?auto_1525866 ?auto_1525870 ) ( not ( = ?auto_1525867 ?auto_1525866 ) ) ( SURFACE-AT ?auto_1525864 ?auto_1525870 ) ( ON ?auto_1525864 ?auto_1525868 ) ( CLEAR ?auto_1525864 ) ( not ( = ?auto_1525863 ?auto_1525868 ) ) ( not ( = ?auto_1525864 ?auto_1525868 ) ) ( not ( = ?auto_1525862 ?auto_1525868 ) ) ( SURFACE-AT ?auto_1525862 ?auto_1525871 ) ( CLEAR ?auto_1525862 ) ( IS-CRATE ?auto_1525863 ) ( AVAILABLE ?auto_1525867 ) ( TRUCK-AT ?auto_1525865 ?auto_1525870 ) ( AVAILABLE ?auto_1525866 ) ( SURFACE-AT ?auto_1525863 ?auto_1525870 ) ( ON ?auto_1525863 ?auto_1525869 ) ( CLEAR ?auto_1525863 ) ( not ( = ?auto_1525863 ?auto_1525869 ) ) ( not ( = ?auto_1525864 ?auto_1525869 ) ) ( not ( = ?auto_1525862 ?auto_1525869 ) ) ( not ( = ?auto_1525868 ?auto_1525869 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1525863 ?auto_1525864 )
      ( MAKE-2CRATE-VERIFY ?auto_1525862 ?auto_1525863 ?auto_1525864 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1525872 - SURFACE
      ?auto_1525873 - SURFACE
      ?auto_1525874 - SURFACE
      ?auto_1525875 - SURFACE
    )
    :vars
    (
      ?auto_1525882 - HOIST
      ?auto_1525880 - PLACE
      ?auto_1525878 - PLACE
      ?auto_1525877 - HOIST
      ?auto_1525876 - SURFACE
      ?auto_1525879 - TRUCK
      ?auto_1525881 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525882 ?auto_1525880 ) ( IS-CRATE ?auto_1525875 ) ( not ( = ?auto_1525874 ?auto_1525875 ) ) ( not ( = ?auto_1525873 ?auto_1525874 ) ) ( not ( = ?auto_1525873 ?auto_1525875 ) ) ( not ( = ?auto_1525878 ?auto_1525880 ) ) ( HOIST-AT ?auto_1525877 ?auto_1525878 ) ( not ( = ?auto_1525882 ?auto_1525877 ) ) ( SURFACE-AT ?auto_1525875 ?auto_1525878 ) ( ON ?auto_1525875 ?auto_1525876 ) ( CLEAR ?auto_1525875 ) ( not ( = ?auto_1525874 ?auto_1525876 ) ) ( not ( = ?auto_1525875 ?auto_1525876 ) ) ( not ( = ?auto_1525873 ?auto_1525876 ) ) ( SURFACE-AT ?auto_1525873 ?auto_1525880 ) ( CLEAR ?auto_1525873 ) ( IS-CRATE ?auto_1525874 ) ( AVAILABLE ?auto_1525882 ) ( TRUCK-AT ?auto_1525879 ?auto_1525878 ) ( AVAILABLE ?auto_1525877 ) ( SURFACE-AT ?auto_1525874 ?auto_1525878 ) ( ON ?auto_1525874 ?auto_1525881 ) ( CLEAR ?auto_1525874 ) ( not ( = ?auto_1525874 ?auto_1525881 ) ) ( not ( = ?auto_1525875 ?auto_1525881 ) ) ( not ( = ?auto_1525873 ?auto_1525881 ) ) ( not ( = ?auto_1525876 ?auto_1525881 ) ) ( ON ?auto_1525873 ?auto_1525872 ) ( not ( = ?auto_1525872 ?auto_1525873 ) ) ( not ( = ?auto_1525872 ?auto_1525874 ) ) ( not ( = ?auto_1525872 ?auto_1525875 ) ) ( not ( = ?auto_1525872 ?auto_1525876 ) ) ( not ( = ?auto_1525872 ?auto_1525881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525873 ?auto_1525874 ?auto_1525875 )
      ( MAKE-3CRATE-VERIFY ?auto_1525872 ?auto_1525873 ?auto_1525874 ?auto_1525875 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1525883 - SURFACE
      ?auto_1525884 - SURFACE
      ?auto_1525885 - SURFACE
      ?auto_1525887 - SURFACE
      ?auto_1525886 - SURFACE
    )
    :vars
    (
      ?auto_1525894 - HOIST
      ?auto_1525892 - PLACE
      ?auto_1525890 - PLACE
      ?auto_1525889 - HOIST
      ?auto_1525888 - SURFACE
      ?auto_1525891 - TRUCK
      ?auto_1525893 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525894 ?auto_1525892 ) ( IS-CRATE ?auto_1525886 ) ( not ( = ?auto_1525887 ?auto_1525886 ) ) ( not ( = ?auto_1525885 ?auto_1525887 ) ) ( not ( = ?auto_1525885 ?auto_1525886 ) ) ( not ( = ?auto_1525890 ?auto_1525892 ) ) ( HOIST-AT ?auto_1525889 ?auto_1525890 ) ( not ( = ?auto_1525894 ?auto_1525889 ) ) ( SURFACE-AT ?auto_1525886 ?auto_1525890 ) ( ON ?auto_1525886 ?auto_1525888 ) ( CLEAR ?auto_1525886 ) ( not ( = ?auto_1525887 ?auto_1525888 ) ) ( not ( = ?auto_1525886 ?auto_1525888 ) ) ( not ( = ?auto_1525885 ?auto_1525888 ) ) ( SURFACE-AT ?auto_1525885 ?auto_1525892 ) ( CLEAR ?auto_1525885 ) ( IS-CRATE ?auto_1525887 ) ( AVAILABLE ?auto_1525894 ) ( TRUCK-AT ?auto_1525891 ?auto_1525890 ) ( AVAILABLE ?auto_1525889 ) ( SURFACE-AT ?auto_1525887 ?auto_1525890 ) ( ON ?auto_1525887 ?auto_1525893 ) ( CLEAR ?auto_1525887 ) ( not ( = ?auto_1525887 ?auto_1525893 ) ) ( not ( = ?auto_1525886 ?auto_1525893 ) ) ( not ( = ?auto_1525885 ?auto_1525893 ) ) ( not ( = ?auto_1525888 ?auto_1525893 ) ) ( ON ?auto_1525884 ?auto_1525883 ) ( ON ?auto_1525885 ?auto_1525884 ) ( not ( = ?auto_1525883 ?auto_1525884 ) ) ( not ( = ?auto_1525883 ?auto_1525885 ) ) ( not ( = ?auto_1525883 ?auto_1525887 ) ) ( not ( = ?auto_1525883 ?auto_1525886 ) ) ( not ( = ?auto_1525883 ?auto_1525888 ) ) ( not ( = ?auto_1525883 ?auto_1525893 ) ) ( not ( = ?auto_1525884 ?auto_1525885 ) ) ( not ( = ?auto_1525884 ?auto_1525887 ) ) ( not ( = ?auto_1525884 ?auto_1525886 ) ) ( not ( = ?auto_1525884 ?auto_1525888 ) ) ( not ( = ?auto_1525884 ?auto_1525893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525885 ?auto_1525887 ?auto_1525886 )
      ( MAKE-4CRATE-VERIFY ?auto_1525883 ?auto_1525884 ?auto_1525885 ?auto_1525887 ?auto_1525886 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1525895 - SURFACE
      ?auto_1525896 - SURFACE
      ?auto_1525897 - SURFACE
      ?auto_1525899 - SURFACE
      ?auto_1525898 - SURFACE
      ?auto_1525900 - SURFACE
    )
    :vars
    (
      ?auto_1525907 - HOIST
      ?auto_1525905 - PLACE
      ?auto_1525903 - PLACE
      ?auto_1525902 - HOIST
      ?auto_1525901 - SURFACE
      ?auto_1525904 - TRUCK
      ?auto_1525906 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525907 ?auto_1525905 ) ( IS-CRATE ?auto_1525900 ) ( not ( = ?auto_1525898 ?auto_1525900 ) ) ( not ( = ?auto_1525899 ?auto_1525898 ) ) ( not ( = ?auto_1525899 ?auto_1525900 ) ) ( not ( = ?auto_1525903 ?auto_1525905 ) ) ( HOIST-AT ?auto_1525902 ?auto_1525903 ) ( not ( = ?auto_1525907 ?auto_1525902 ) ) ( SURFACE-AT ?auto_1525900 ?auto_1525903 ) ( ON ?auto_1525900 ?auto_1525901 ) ( CLEAR ?auto_1525900 ) ( not ( = ?auto_1525898 ?auto_1525901 ) ) ( not ( = ?auto_1525900 ?auto_1525901 ) ) ( not ( = ?auto_1525899 ?auto_1525901 ) ) ( SURFACE-AT ?auto_1525899 ?auto_1525905 ) ( CLEAR ?auto_1525899 ) ( IS-CRATE ?auto_1525898 ) ( AVAILABLE ?auto_1525907 ) ( TRUCK-AT ?auto_1525904 ?auto_1525903 ) ( AVAILABLE ?auto_1525902 ) ( SURFACE-AT ?auto_1525898 ?auto_1525903 ) ( ON ?auto_1525898 ?auto_1525906 ) ( CLEAR ?auto_1525898 ) ( not ( = ?auto_1525898 ?auto_1525906 ) ) ( not ( = ?auto_1525900 ?auto_1525906 ) ) ( not ( = ?auto_1525899 ?auto_1525906 ) ) ( not ( = ?auto_1525901 ?auto_1525906 ) ) ( ON ?auto_1525896 ?auto_1525895 ) ( ON ?auto_1525897 ?auto_1525896 ) ( ON ?auto_1525899 ?auto_1525897 ) ( not ( = ?auto_1525895 ?auto_1525896 ) ) ( not ( = ?auto_1525895 ?auto_1525897 ) ) ( not ( = ?auto_1525895 ?auto_1525899 ) ) ( not ( = ?auto_1525895 ?auto_1525898 ) ) ( not ( = ?auto_1525895 ?auto_1525900 ) ) ( not ( = ?auto_1525895 ?auto_1525901 ) ) ( not ( = ?auto_1525895 ?auto_1525906 ) ) ( not ( = ?auto_1525896 ?auto_1525897 ) ) ( not ( = ?auto_1525896 ?auto_1525899 ) ) ( not ( = ?auto_1525896 ?auto_1525898 ) ) ( not ( = ?auto_1525896 ?auto_1525900 ) ) ( not ( = ?auto_1525896 ?auto_1525901 ) ) ( not ( = ?auto_1525896 ?auto_1525906 ) ) ( not ( = ?auto_1525897 ?auto_1525899 ) ) ( not ( = ?auto_1525897 ?auto_1525898 ) ) ( not ( = ?auto_1525897 ?auto_1525900 ) ) ( not ( = ?auto_1525897 ?auto_1525901 ) ) ( not ( = ?auto_1525897 ?auto_1525906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525899 ?auto_1525898 ?auto_1525900 )
      ( MAKE-5CRATE-VERIFY ?auto_1525895 ?auto_1525896 ?auto_1525897 ?auto_1525899 ?auto_1525898 ?auto_1525900 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1525908 - SURFACE
      ?auto_1525909 - SURFACE
      ?auto_1525910 - SURFACE
      ?auto_1525912 - SURFACE
      ?auto_1525911 - SURFACE
      ?auto_1525913 - SURFACE
      ?auto_1525914 - SURFACE
    )
    :vars
    (
      ?auto_1525921 - HOIST
      ?auto_1525919 - PLACE
      ?auto_1525917 - PLACE
      ?auto_1525916 - HOIST
      ?auto_1525915 - SURFACE
      ?auto_1525918 - TRUCK
      ?auto_1525920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525921 ?auto_1525919 ) ( IS-CRATE ?auto_1525914 ) ( not ( = ?auto_1525913 ?auto_1525914 ) ) ( not ( = ?auto_1525911 ?auto_1525913 ) ) ( not ( = ?auto_1525911 ?auto_1525914 ) ) ( not ( = ?auto_1525917 ?auto_1525919 ) ) ( HOIST-AT ?auto_1525916 ?auto_1525917 ) ( not ( = ?auto_1525921 ?auto_1525916 ) ) ( SURFACE-AT ?auto_1525914 ?auto_1525917 ) ( ON ?auto_1525914 ?auto_1525915 ) ( CLEAR ?auto_1525914 ) ( not ( = ?auto_1525913 ?auto_1525915 ) ) ( not ( = ?auto_1525914 ?auto_1525915 ) ) ( not ( = ?auto_1525911 ?auto_1525915 ) ) ( SURFACE-AT ?auto_1525911 ?auto_1525919 ) ( CLEAR ?auto_1525911 ) ( IS-CRATE ?auto_1525913 ) ( AVAILABLE ?auto_1525921 ) ( TRUCK-AT ?auto_1525918 ?auto_1525917 ) ( AVAILABLE ?auto_1525916 ) ( SURFACE-AT ?auto_1525913 ?auto_1525917 ) ( ON ?auto_1525913 ?auto_1525920 ) ( CLEAR ?auto_1525913 ) ( not ( = ?auto_1525913 ?auto_1525920 ) ) ( not ( = ?auto_1525914 ?auto_1525920 ) ) ( not ( = ?auto_1525911 ?auto_1525920 ) ) ( not ( = ?auto_1525915 ?auto_1525920 ) ) ( ON ?auto_1525909 ?auto_1525908 ) ( ON ?auto_1525910 ?auto_1525909 ) ( ON ?auto_1525912 ?auto_1525910 ) ( ON ?auto_1525911 ?auto_1525912 ) ( not ( = ?auto_1525908 ?auto_1525909 ) ) ( not ( = ?auto_1525908 ?auto_1525910 ) ) ( not ( = ?auto_1525908 ?auto_1525912 ) ) ( not ( = ?auto_1525908 ?auto_1525911 ) ) ( not ( = ?auto_1525908 ?auto_1525913 ) ) ( not ( = ?auto_1525908 ?auto_1525914 ) ) ( not ( = ?auto_1525908 ?auto_1525915 ) ) ( not ( = ?auto_1525908 ?auto_1525920 ) ) ( not ( = ?auto_1525909 ?auto_1525910 ) ) ( not ( = ?auto_1525909 ?auto_1525912 ) ) ( not ( = ?auto_1525909 ?auto_1525911 ) ) ( not ( = ?auto_1525909 ?auto_1525913 ) ) ( not ( = ?auto_1525909 ?auto_1525914 ) ) ( not ( = ?auto_1525909 ?auto_1525915 ) ) ( not ( = ?auto_1525909 ?auto_1525920 ) ) ( not ( = ?auto_1525910 ?auto_1525912 ) ) ( not ( = ?auto_1525910 ?auto_1525911 ) ) ( not ( = ?auto_1525910 ?auto_1525913 ) ) ( not ( = ?auto_1525910 ?auto_1525914 ) ) ( not ( = ?auto_1525910 ?auto_1525915 ) ) ( not ( = ?auto_1525910 ?auto_1525920 ) ) ( not ( = ?auto_1525912 ?auto_1525911 ) ) ( not ( = ?auto_1525912 ?auto_1525913 ) ) ( not ( = ?auto_1525912 ?auto_1525914 ) ) ( not ( = ?auto_1525912 ?auto_1525915 ) ) ( not ( = ?auto_1525912 ?auto_1525920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525911 ?auto_1525913 ?auto_1525914 )
      ( MAKE-6CRATE-VERIFY ?auto_1525908 ?auto_1525909 ?auto_1525910 ?auto_1525912 ?auto_1525911 ?auto_1525913 ?auto_1525914 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1525922 - SURFACE
      ?auto_1525923 - SURFACE
      ?auto_1525924 - SURFACE
      ?auto_1525926 - SURFACE
      ?auto_1525925 - SURFACE
      ?auto_1525927 - SURFACE
      ?auto_1525928 - SURFACE
      ?auto_1525929 - SURFACE
    )
    :vars
    (
      ?auto_1525936 - HOIST
      ?auto_1525934 - PLACE
      ?auto_1525932 - PLACE
      ?auto_1525931 - HOIST
      ?auto_1525930 - SURFACE
      ?auto_1525933 - TRUCK
      ?auto_1525935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525936 ?auto_1525934 ) ( IS-CRATE ?auto_1525929 ) ( not ( = ?auto_1525928 ?auto_1525929 ) ) ( not ( = ?auto_1525927 ?auto_1525928 ) ) ( not ( = ?auto_1525927 ?auto_1525929 ) ) ( not ( = ?auto_1525932 ?auto_1525934 ) ) ( HOIST-AT ?auto_1525931 ?auto_1525932 ) ( not ( = ?auto_1525936 ?auto_1525931 ) ) ( SURFACE-AT ?auto_1525929 ?auto_1525932 ) ( ON ?auto_1525929 ?auto_1525930 ) ( CLEAR ?auto_1525929 ) ( not ( = ?auto_1525928 ?auto_1525930 ) ) ( not ( = ?auto_1525929 ?auto_1525930 ) ) ( not ( = ?auto_1525927 ?auto_1525930 ) ) ( SURFACE-AT ?auto_1525927 ?auto_1525934 ) ( CLEAR ?auto_1525927 ) ( IS-CRATE ?auto_1525928 ) ( AVAILABLE ?auto_1525936 ) ( TRUCK-AT ?auto_1525933 ?auto_1525932 ) ( AVAILABLE ?auto_1525931 ) ( SURFACE-AT ?auto_1525928 ?auto_1525932 ) ( ON ?auto_1525928 ?auto_1525935 ) ( CLEAR ?auto_1525928 ) ( not ( = ?auto_1525928 ?auto_1525935 ) ) ( not ( = ?auto_1525929 ?auto_1525935 ) ) ( not ( = ?auto_1525927 ?auto_1525935 ) ) ( not ( = ?auto_1525930 ?auto_1525935 ) ) ( ON ?auto_1525923 ?auto_1525922 ) ( ON ?auto_1525924 ?auto_1525923 ) ( ON ?auto_1525926 ?auto_1525924 ) ( ON ?auto_1525925 ?auto_1525926 ) ( ON ?auto_1525927 ?auto_1525925 ) ( not ( = ?auto_1525922 ?auto_1525923 ) ) ( not ( = ?auto_1525922 ?auto_1525924 ) ) ( not ( = ?auto_1525922 ?auto_1525926 ) ) ( not ( = ?auto_1525922 ?auto_1525925 ) ) ( not ( = ?auto_1525922 ?auto_1525927 ) ) ( not ( = ?auto_1525922 ?auto_1525928 ) ) ( not ( = ?auto_1525922 ?auto_1525929 ) ) ( not ( = ?auto_1525922 ?auto_1525930 ) ) ( not ( = ?auto_1525922 ?auto_1525935 ) ) ( not ( = ?auto_1525923 ?auto_1525924 ) ) ( not ( = ?auto_1525923 ?auto_1525926 ) ) ( not ( = ?auto_1525923 ?auto_1525925 ) ) ( not ( = ?auto_1525923 ?auto_1525927 ) ) ( not ( = ?auto_1525923 ?auto_1525928 ) ) ( not ( = ?auto_1525923 ?auto_1525929 ) ) ( not ( = ?auto_1525923 ?auto_1525930 ) ) ( not ( = ?auto_1525923 ?auto_1525935 ) ) ( not ( = ?auto_1525924 ?auto_1525926 ) ) ( not ( = ?auto_1525924 ?auto_1525925 ) ) ( not ( = ?auto_1525924 ?auto_1525927 ) ) ( not ( = ?auto_1525924 ?auto_1525928 ) ) ( not ( = ?auto_1525924 ?auto_1525929 ) ) ( not ( = ?auto_1525924 ?auto_1525930 ) ) ( not ( = ?auto_1525924 ?auto_1525935 ) ) ( not ( = ?auto_1525926 ?auto_1525925 ) ) ( not ( = ?auto_1525926 ?auto_1525927 ) ) ( not ( = ?auto_1525926 ?auto_1525928 ) ) ( not ( = ?auto_1525926 ?auto_1525929 ) ) ( not ( = ?auto_1525926 ?auto_1525930 ) ) ( not ( = ?auto_1525926 ?auto_1525935 ) ) ( not ( = ?auto_1525925 ?auto_1525927 ) ) ( not ( = ?auto_1525925 ?auto_1525928 ) ) ( not ( = ?auto_1525925 ?auto_1525929 ) ) ( not ( = ?auto_1525925 ?auto_1525930 ) ) ( not ( = ?auto_1525925 ?auto_1525935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525927 ?auto_1525928 ?auto_1525929 )
      ( MAKE-7CRATE-VERIFY ?auto_1525922 ?auto_1525923 ?auto_1525924 ?auto_1525926 ?auto_1525925 ?auto_1525927 ?auto_1525928 ?auto_1525929 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1525937 - SURFACE
      ?auto_1525938 - SURFACE
      ?auto_1525939 - SURFACE
      ?auto_1525941 - SURFACE
      ?auto_1525940 - SURFACE
      ?auto_1525942 - SURFACE
      ?auto_1525943 - SURFACE
      ?auto_1525944 - SURFACE
      ?auto_1525945 - SURFACE
    )
    :vars
    (
      ?auto_1525952 - HOIST
      ?auto_1525950 - PLACE
      ?auto_1525948 - PLACE
      ?auto_1525947 - HOIST
      ?auto_1525946 - SURFACE
      ?auto_1525949 - TRUCK
      ?auto_1525951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525952 ?auto_1525950 ) ( IS-CRATE ?auto_1525945 ) ( not ( = ?auto_1525944 ?auto_1525945 ) ) ( not ( = ?auto_1525943 ?auto_1525944 ) ) ( not ( = ?auto_1525943 ?auto_1525945 ) ) ( not ( = ?auto_1525948 ?auto_1525950 ) ) ( HOIST-AT ?auto_1525947 ?auto_1525948 ) ( not ( = ?auto_1525952 ?auto_1525947 ) ) ( SURFACE-AT ?auto_1525945 ?auto_1525948 ) ( ON ?auto_1525945 ?auto_1525946 ) ( CLEAR ?auto_1525945 ) ( not ( = ?auto_1525944 ?auto_1525946 ) ) ( not ( = ?auto_1525945 ?auto_1525946 ) ) ( not ( = ?auto_1525943 ?auto_1525946 ) ) ( SURFACE-AT ?auto_1525943 ?auto_1525950 ) ( CLEAR ?auto_1525943 ) ( IS-CRATE ?auto_1525944 ) ( AVAILABLE ?auto_1525952 ) ( TRUCK-AT ?auto_1525949 ?auto_1525948 ) ( AVAILABLE ?auto_1525947 ) ( SURFACE-AT ?auto_1525944 ?auto_1525948 ) ( ON ?auto_1525944 ?auto_1525951 ) ( CLEAR ?auto_1525944 ) ( not ( = ?auto_1525944 ?auto_1525951 ) ) ( not ( = ?auto_1525945 ?auto_1525951 ) ) ( not ( = ?auto_1525943 ?auto_1525951 ) ) ( not ( = ?auto_1525946 ?auto_1525951 ) ) ( ON ?auto_1525938 ?auto_1525937 ) ( ON ?auto_1525939 ?auto_1525938 ) ( ON ?auto_1525941 ?auto_1525939 ) ( ON ?auto_1525940 ?auto_1525941 ) ( ON ?auto_1525942 ?auto_1525940 ) ( ON ?auto_1525943 ?auto_1525942 ) ( not ( = ?auto_1525937 ?auto_1525938 ) ) ( not ( = ?auto_1525937 ?auto_1525939 ) ) ( not ( = ?auto_1525937 ?auto_1525941 ) ) ( not ( = ?auto_1525937 ?auto_1525940 ) ) ( not ( = ?auto_1525937 ?auto_1525942 ) ) ( not ( = ?auto_1525937 ?auto_1525943 ) ) ( not ( = ?auto_1525937 ?auto_1525944 ) ) ( not ( = ?auto_1525937 ?auto_1525945 ) ) ( not ( = ?auto_1525937 ?auto_1525946 ) ) ( not ( = ?auto_1525937 ?auto_1525951 ) ) ( not ( = ?auto_1525938 ?auto_1525939 ) ) ( not ( = ?auto_1525938 ?auto_1525941 ) ) ( not ( = ?auto_1525938 ?auto_1525940 ) ) ( not ( = ?auto_1525938 ?auto_1525942 ) ) ( not ( = ?auto_1525938 ?auto_1525943 ) ) ( not ( = ?auto_1525938 ?auto_1525944 ) ) ( not ( = ?auto_1525938 ?auto_1525945 ) ) ( not ( = ?auto_1525938 ?auto_1525946 ) ) ( not ( = ?auto_1525938 ?auto_1525951 ) ) ( not ( = ?auto_1525939 ?auto_1525941 ) ) ( not ( = ?auto_1525939 ?auto_1525940 ) ) ( not ( = ?auto_1525939 ?auto_1525942 ) ) ( not ( = ?auto_1525939 ?auto_1525943 ) ) ( not ( = ?auto_1525939 ?auto_1525944 ) ) ( not ( = ?auto_1525939 ?auto_1525945 ) ) ( not ( = ?auto_1525939 ?auto_1525946 ) ) ( not ( = ?auto_1525939 ?auto_1525951 ) ) ( not ( = ?auto_1525941 ?auto_1525940 ) ) ( not ( = ?auto_1525941 ?auto_1525942 ) ) ( not ( = ?auto_1525941 ?auto_1525943 ) ) ( not ( = ?auto_1525941 ?auto_1525944 ) ) ( not ( = ?auto_1525941 ?auto_1525945 ) ) ( not ( = ?auto_1525941 ?auto_1525946 ) ) ( not ( = ?auto_1525941 ?auto_1525951 ) ) ( not ( = ?auto_1525940 ?auto_1525942 ) ) ( not ( = ?auto_1525940 ?auto_1525943 ) ) ( not ( = ?auto_1525940 ?auto_1525944 ) ) ( not ( = ?auto_1525940 ?auto_1525945 ) ) ( not ( = ?auto_1525940 ?auto_1525946 ) ) ( not ( = ?auto_1525940 ?auto_1525951 ) ) ( not ( = ?auto_1525942 ?auto_1525943 ) ) ( not ( = ?auto_1525942 ?auto_1525944 ) ) ( not ( = ?auto_1525942 ?auto_1525945 ) ) ( not ( = ?auto_1525942 ?auto_1525946 ) ) ( not ( = ?auto_1525942 ?auto_1525951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525943 ?auto_1525944 ?auto_1525945 )
      ( MAKE-8CRATE-VERIFY ?auto_1525937 ?auto_1525938 ?auto_1525939 ?auto_1525941 ?auto_1525940 ?auto_1525942 ?auto_1525943 ?auto_1525944 ?auto_1525945 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1525953 - SURFACE
      ?auto_1525954 - SURFACE
      ?auto_1525955 - SURFACE
      ?auto_1525957 - SURFACE
      ?auto_1525956 - SURFACE
      ?auto_1525958 - SURFACE
      ?auto_1525959 - SURFACE
      ?auto_1525960 - SURFACE
      ?auto_1525961 - SURFACE
      ?auto_1525962 - SURFACE
    )
    :vars
    (
      ?auto_1525969 - HOIST
      ?auto_1525967 - PLACE
      ?auto_1525965 - PLACE
      ?auto_1525964 - HOIST
      ?auto_1525963 - SURFACE
      ?auto_1525966 - TRUCK
      ?auto_1525968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525969 ?auto_1525967 ) ( IS-CRATE ?auto_1525962 ) ( not ( = ?auto_1525961 ?auto_1525962 ) ) ( not ( = ?auto_1525960 ?auto_1525961 ) ) ( not ( = ?auto_1525960 ?auto_1525962 ) ) ( not ( = ?auto_1525965 ?auto_1525967 ) ) ( HOIST-AT ?auto_1525964 ?auto_1525965 ) ( not ( = ?auto_1525969 ?auto_1525964 ) ) ( SURFACE-AT ?auto_1525962 ?auto_1525965 ) ( ON ?auto_1525962 ?auto_1525963 ) ( CLEAR ?auto_1525962 ) ( not ( = ?auto_1525961 ?auto_1525963 ) ) ( not ( = ?auto_1525962 ?auto_1525963 ) ) ( not ( = ?auto_1525960 ?auto_1525963 ) ) ( SURFACE-AT ?auto_1525960 ?auto_1525967 ) ( CLEAR ?auto_1525960 ) ( IS-CRATE ?auto_1525961 ) ( AVAILABLE ?auto_1525969 ) ( TRUCK-AT ?auto_1525966 ?auto_1525965 ) ( AVAILABLE ?auto_1525964 ) ( SURFACE-AT ?auto_1525961 ?auto_1525965 ) ( ON ?auto_1525961 ?auto_1525968 ) ( CLEAR ?auto_1525961 ) ( not ( = ?auto_1525961 ?auto_1525968 ) ) ( not ( = ?auto_1525962 ?auto_1525968 ) ) ( not ( = ?auto_1525960 ?auto_1525968 ) ) ( not ( = ?auto_1525963 ?auto_1525968 ) ) ( ON ?auto_1525954 ?auto_1525953 ) ( ON ?auto_1525955 ?auto_1525954 ) ( ON ?auto_1525957 ?auto_1525955 ) ( ON ?auto_1525956 ?auto_1525957 ) ( ON ?auto_1525958 ?auto_1525956 ) ( ON ?auto_1525959 ?auto_1525958 ) ( ON ?auto_1525960 ?auto_1525959 ) ( not ( = ?auto_1525953 ?auto_1525954 ) ) ( not ( = ?auto_1525953 ?auto_1525955 ) ) ( not ( = ?auto_1525953 ?auto_1525957 ) ) ( not ( = ?auto_1525953 ?auto_1525956 ) ) ( not ( = ?auto_1525953 ?auto_1525958 ) ) ( not ( = ?auto_1525953 ?auto_1525959 ) ) ( not ( = ?auto_1525953 ?auto_1525960 ) ) ( not ( = ?auto_1525953 ?auto_1525961 ) ) ( not ( = ?auto_1525953 ?auto_1525962 ) ) ( not ( = ?auto_1525953 ?auto_1525963 ) ) ( not ( = ?auto_1525953 ?auto_1525968 ) ) ( not ( = ?auto_1525954 ?auto_1525955 ) ) ( not ( = ?auto_1525954 ?auto_1525957 ) ) ( not ( = ?auto_1525954 ?auto_1525956 ) ) ( not ( = ?auto_1525954 ?auto_1525958 ) ) ( not ( = ?auto_1525954 ?auto_1525959 ) ) ( not ( = ?auto_1525954 ?auto_1525960 ) ) ( not ( = ?auto_1525954 ?auto_1525961 ) ) ( not ( = ?auto_1525954 ?auto_1525962 ) ) ( not ( = ?auto_1525954 ?auto_1525963 ) ) ( not ( = ?auto_1525954 ?auto_1525968 ) ) ( not ( = ?auto_1525955 ?auto_1525957 ) ) ( not ( = ?auto_1525955 ?auto_1525956 ) ) ( not ( = ?auto_1525955 ?auto_1525958 ) ) ( not ( = ?auto_1525955 ?auto_1525959 ) ) ( not ( = ?auto_1525955 ?auto_1525960 ) ) ( not ( = ?auto_1525955 ?auto_1525961 ) ) ( not ( = ?auto_1525955 ?auto_1525962 ) ) ( not ( = ?auto_1525955 ?auto_1525963 ) ) ( not ( = ?auto_1525955 ?auto_1525968 ) ) ( not ( = ?auto_1525957 ?auto_1525956 ) ) ( not ( = ?auto_1525957 ?auto_1525958 ) ) ( not ( = ?auto_1525957 ?auto_1525959 ) ) ( not ( = ?auto_1525957 ?auto_1525960 ) ) ( not ( = ?auto_1525957 ?auto_1525961 ) ) ( not ( = ?auto_1525957 ?auto_1525962 ) ) ( not ( = ?auto_1525957 ?auto_1525963 ) ) ( not ( = ?auto_1525957 ?auto_1525968 ) ) ( not ( = ?auto_1525956 ?auto_1525958 ) ) ( not ( = ?auto_1525956 ?auto_1525959 ) ) ( not ( = ?auto_1525956 ?auto_1525960 ) ) ( not ( = ?auto_1525956 ?auto_1525961 ) ) ( not ( = ?auto_1525956 ?auto_1525962 ) ) ( not ( = ?auto_1525956 ?auto_1525963 ) ) ( not ( = ?auto_1525956 ?auto_1525968 ) ) ( not ( = ?auto_1525958 ?auto_1525959 ) ) ( not ( = ?auto_1525958 ?auto_1525960 ) ) ( not ( = ?auto_1525958 ?auto_1525961 ) ) ( not ( = ?auto_1525958 ?auto_1525962 ) ) ( not ( = ?auto_1525958 ?auto_1525963 ) ) ( not ( = ?auto_1525958 ?auto_1525968 ) ) ( not ( = ?auto_1525959 ?auto_1525960 ) ) ( not ( = ?auto_1525959 ?auto_1525961 ) ) ( not ( = ?auto_1525959 ?auto_1525962 ) ) ( not ( = ?auto_1525959 ?auto_1525963 ) ) ( not ( = ?auto_1525959 ?auto_1525968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525960 ?auto_1525961 ?auto_1525962 )
      ( MAKE-9CRATE-VERIFY ?auto_1525953 ?auto_1525954 ?auto_1525955 ?auto_1525957 ?auto_1525956 ?auto_1525958 ?auto_1525959 ?auto_1525960 ?auto_1525961 ?auto_1525962 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1525970 - SURFACE
      ?auto_1525971 - SURFACE
    )
    :vars
    (
      ?auto_1525979 - HOIST
      ?auto_1525977 - PLACE
      ?auto_1525973 - SURFACE
      ?auto_1525975 - PLACE
      ?auto_1525974 - HOIST
      ?auto_1525972 - SURFACE
      ?auto_1525978 - SURFACE
      ?auto_1525976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525979 ?auto_1525977 ) ( IS-CRATE ?auto_1525971 ) ( not ( = ?auto_1525970 ?auto_1525971 ) ) ( not ( = ?auto_1525973 ?auto_1525970 ) ) ( not ( = ?auto_1525973 ?auto_1525971 ) ) ( not ( = ?auto_1525975 ?auto_1525977 ) ) ( HOIST-AT ?auto_1525974 ?auto_1525975 ) ( not ( = ?auto_1525979 ?auto_1525974 ) ) ( SURFACE-AT ?auto_1525971 ?auto_1525975 ) ( ON ?auto_1525971 ?auto_1525972 ) ( CLEAR ?auto_1525971 ) ( not ( = ?auto_1525970 ?auto_1525972 ) ) ( not ( = ?auto_1525971 ?auto_1525972 ) ) ( not ( = ?auto_1525973 ?auto_1525972 ) ) ( SURFACE-AT ?auto_1525973 ?auto_1525977 ) ( CLEAR ?auto_1525973 ) ( IS-CRATE ?auto_1525970 ) ( AVAILABLE ?auto_1525979 ) ( AVAILABLE ?auto_1525974 ) ( SURFACE-AT ?auto_1525970 ?auto_1525975 ) ( ON ?auto_1525970 ?auto_1525978 ) ( CLEAR ?auto_1525970 ) ( not ( = ?auto_1525970 ?auto_1525978 ) ) ( not ( = ?auto_1525971 ?auto_1525978 ) ) ( not ( = ?auto_1525973 ?auto_1525978 ) ) ( not ( = ?auto_1525972 ?auto_1525978 ) ) ( TRUCK-AT ?auto_1525976 ?auto_1525977 ) )
    :subtasks
    ( ( !DRIVE ?auto_1525976 ?auto_1525977 ?auto_1525975 )
      ( MAKE-2CRATE ?auto_1525973 ?auto_1525970 ?auto_1525971 )
      ( MAKE-1CRATE-VERIFY ?auto_1525970 ?auto_1525971 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1525980 - SURFACE
      ?auto_1525981 - SURFACE
      ?auto_1525982 - SURFACE
    )
    :vars
    (
      ?auto_1525987 - HOIST
      ?auto_1525989 - PLACE
      ?auto_1525983 - PLACE
      ?auto_1525988 - HOIST
      ?auto_1525985 - SURFACE
      ?auto_1525986 - SURFACE
      ?auto_1525984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525987 ?auto_1525989 ) ( IS-CRATE ?auto_1525982 ) ( not ( = ?auto_1525981 ?auto_1525982 ) ) ( not ( = ?auto_1525980 ?auto_1525981 ) ) ( not ( = ?auto_1525980 ?auto_1525982 ) ) ( not ( = ?auto_1525983 ?auto_1525989 ) ) ( HOIST-AT ?auto_1525988 ?auto_1525983 ) ( not ( = ?auto_1525987 ?auto_1525988 ) ) ( SURFACE-AT ?auto_1525982 ?auto_1525983 ) ( ON ?auto_1525982 ?auto_1525985 ) ( CLEAR ?auto_1525982 ) ( not ( = ?auto_1525981 ?auto_1525985 ) ) ( not ( = ?auto_1525982 ?auto_1525985 ) ) ( not ( = ?auto_1525980 ?auto_1525985 ) ) ( SURFACE-AT ?auto_1525980 ?auto_1525989 ) ( CLEAR ?auto_1525980 ) ( IS-CRATE ?auto_1525981 ) ( AVAILABLE ?auto_1525987 ) ( AVAILABLE ?auto_1525988 ) ( SURFACE-AT ?auto_1525981 ?auto_1525983 ) ( ON ?auto_1525981 ?auto_1525986 ) ( CLEAR ?auto_1525981 ) ( not ( = ?auto_1525981 ?auto_1525986 ) ) ( not ( = ?auto_1525982 ?auto_1525986 ) ) ( not ( = ?auto_1525980 ?auto_1525986 ) ) ( not ( = ?auto_1525985 ?auto_1525986 ) ) ( TRUCK-AT ?auto_1525984 ?auto_1525989 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1525981 ?auto_1525982 )
      ( MAKE-2CRATE-VERIFY ?auto_1525980 ?auto_1525981 ?auto_1525982 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1525990 - SURFACE
      ?auto_1525991 - SURFACE
      ?auto_1525992 - SURFACE
      ?auto_1525993 - SURFACE
    )
    :vars
    (
      ?auto_1525999 - HOIST
      ?auto_1525994 - PLACE
      ?auto_1525998 - PLACE
      ?auto_1526000 - HOIST
      ?auto_1525997 - SURFACE
      ?auto_1525995 - SURFACE
      ?auto_1525996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525999 ?auto_1525994 ) ( IS-CRATE ?auto_1525993 ) ( not ( = ?auto_1525992 ?auto_1525993 ) ) ( not ( = ?auto_1525991 ?auto_1525992 ) ) ( not ( = ?auto_1525991 ?auto_1525993 ) ) ( not ( = ?auto_1525998 ?auto_1525994 ) ) ( HOIST-AT ?auto_1526000 ?auto_1525998 ) ( not ( = ?auto_1525999 ?auto_1526000 ) ) ( SURFACE-AT ?auto_1525993 ?auto_1525998 ) ( ON ?auto_1525993 ?auto_1525997 ) ( CLEAR ?auto_1525993 ) ( not ( = ?auto_1525992 ?auto_1525997 ) ) ( not ( = ?auto_1525993 ?auto_1525997 ) ) ( not ( = ?auto_1525991 ?auto_1525997 ) ) ( SURFACE-AT ?auto_1525991 ?auto_1525994 ) ( CLEAR ?auto_1525991 ) ( IS-CRATE ?auto_1525992 ) ( AVAILABLE ?auto_1525999 ) ( AVAILABLE ?auto_1526000 ) ( SURFACE-AT ?auto_1525992 ?auto_1525998 ) ( ON ?auto_1525992 ?auto_1525995 ) ( CLEAR ?auto_1525992 ) ( not ( = ?auto_1525992 ?auto_1525995 ) ) ( not ( = ?auto_1525993 ?auto_1525995 ) ) ( not ( = ?auto_1525991 ?auto_1525995 ) ) ( not ( = ?auto_1525997 ?auto_1525995 ) ) ( TRUCK-AT ?auto_1525996 ?auto_1525994 ) ( ON ?auto_1525991 ?auto_1525990 ) ( not ( = ?auto_1525990 ?auto_1525991 ) ) ( not ( = ?auto_1525990 ?auto_1525992 ) ) ( not ( = ?auto_1525990 ?auto_1525993 ) ) ( not ( = ?auto_1525990 ?auto_1525997 ) ) ( not ( = ?auto_1525990 ?auto_1525995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1525991 ?auto_1525992 ?auto_1525993 )
      ( MAKE-3CRATE-VERIFY ?auto_1525990 ?auto_1525991 ?auto_1525992 ?auto_1525993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1526001 - SURFACE
      ?auto_1526002 - SURFACE
      ?auto_1526003 - SURFACE
      ?auto_1526005 - SURFACE
      ?auto_1526004 - SURFACE
    )
    :vars
    (
      ?auto_1526011 - HOIST
      ?auto_1526006 - PLACE
      ?auto_1526010 - PLACE
      ?auto_1526012 - HOIST
      ?auto_1526009 - SURFACE
      ?auto_1526007 - SURFACE
      ?auto_1526008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526011 ?auto_1526006 ) ( IS-CRATE ?auto_1526004 ) ( not ( = ?auto_1526005 ?auto_1526004 ) ) ( not ( = ?auto_1526003 ?auto_1526005 ) ) ( not ( = ?auto_1526003 ?auto_1526004 ) ) ( not ( = ?auto_1526010 ?auto_1526006 ) ) ( HOIST-AT ?auto_1526012 ?auto_1526010 ) ( not ( = ?auto_1526011 ?auto_1526012 ) ) ( SURFACE-AT ?auto_1526004 ?auto_1526010 ) ( ON ?auto_1526004 ?auto_1526009 ) ( CLEAR ?auto_1526004 ) ( not ( = ?auto_1526005 ?auto_1526009 ) ) ( not ( = ?auto_1526004 ?auto_1526009 ) ) ( not ( = ?auto_1526003 ?auto_1526009 ) ) ( SURFACE-AT ?auto_1526003 ?auto_1526006 ) ( CLEAR ?auto_1526003 ) ( IS-CRATE ?auto_1526005 ) ( AVAILABLE ?auto_1526011 ) ( AVAILABLE ?auto_1526012 ) ( SURFACE-AT ?auto_1526005 ?auto_1526010 ) ( ON ?auto_1526005 ?auto_1526007 ) ( CLEAR ?auto_1526005 ) ( not ( = ?auto_1526005 ?auto_1526007 ) ) ( not ( = ?auto_1526004 ?auto_1526007 ) ) ( not ( = ?auto_1526003 ?auto_1526007 ) ) ( not ( = ?auto_1526009 ?auto_1526007 ) ) ( TRUCK-AT ?auto_1526008 ?auto_1526006 ) ( ON ?auto_1526002 ?auto_1526001 ) ( ON ?auto_1526003 ?auto_1526002 ) ( not ( = ?auto_1526001 ?auto_1526002 ) ) ( not ( = ?auto_1526001 ?auto_1526003 ) ) ( not ( = ?auto_1526001 ?auto_1526005 ) ) ( not ( = ?auto_1526001 ?auto_1526004 ) ) ( not ( = ?auto_1526001 ?auto_1526009 ) ) ( not ( = ?auto_1526001 ?auto_1526007 ) ) ( not ( = ?auto_1526002 ?auto_1526003 ) ) ( not ( = ?auto_1526002 ?auto_1526005 ) ) ( not ( = ?auto_1526002 ?auto_1526004 ) ) ( not ( = ?auto_1526002 ?auto_1526009 ) ) ( not ( = ?auto_1526002 ?auto_1526007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526003 ?auto_1526005 ?auto_1526004 )
      ( MAKE-4CRATE-VERIFY ?auto_1526001 ?auto_1526002 ?auto_1526003 ?auto_1526005 ?auto_1526004 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1526013 - SURFACE
      ?auto_1526014 - SURFACE
      ?auto_1526015 - SURFACE
      ?auto_1526017 - SURFACE
      ?auto_1526016 - SURFACE
      ?auto_1526018 - SURFACE
    )
    :vars
    (
      ?auto_1526024 - HOIST
      ?auto_1526019 - PLACE
      ?auto_1526023 - PLACE
      ?auto_1526025 - HOIST
      ?auto_1526022 - SURFACE
      ?auto_1526020 - SURFACE
      ?auto_1526021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526024 ?auto_1526019 ) ( IS-CRATE ?auto_1526018 ) ( not ( = ?auto_1526016 ?auto_1526018 ) ) ( not ( = ?auto_1526017 ?auto_1526016 ) ) ( not ( = ?auto_1526017 ?auto_1526018 ) ) ( not ( = ?auto_1526023 ?auto_1526019 ) ) ( HOIST-AT ?auto_1526025 ?auto_1526023 ) ( not ( = ?auto_1526024 ?auto_1526025 ) ) ( SURFACE-AT ?auto_1526018 ?auto_1526023 ) ( ON ?auto_1526018 ?auto_1526022 ) ( CLEAR ?auto_1526018 ) ( not ( = ?auto_1526016 ?auto_1526022 ) ) ( not ( = ?auto_1526018 ?auto_1526022 ) ) ( not ( = ?auto_1526017 ?auto_1526022 ) ) ( SURFACE-AT ?auto_1526017 ?auto_1526019 ) ( CLEAR ?auto_1526017 ) ( IS-CRATE ?auto_1526016 ) ( AVAILABLE ?auto_1526024 ) ( AVAILABLE ?auto_1526025 ) ( SURFACE-AT ?auto_1526016 ?auto_1526023 ) ( ON ?auto_1526016 ?auto_1526020 ) ( CLEAR ?auto_1526016 ) ( not ( = ?auto_1526016 ?auto_1526020 ) ) ( not ( = ?auto_1526018 ?auto_1526020 ) ) ( not ( = ?auto_1526017 ?auto_1526020 ) ) ( not ( = ?auto_1526022 ?auto_1526020 ) ) ( TRUCK-AT ?auto_1526021 ?auto_1526019 ) ( ON ?auto_1526014 ?auto_1526013 ) ( ON ?auto_1526015 ?auto_1526014 ) ( ON ?auto_1526017 ?auto_1526015 ) ( not ( = ?auto_1526013 ?auto_1526014 ) ) ( not ( = ?auto_1526013 ?auto_1526015 ) ) ( not ( = ?auto_1526013 ?auto_1526017 ) ) ( not ( = ?auto_1526013 ?auto_1526016 ) ) ( not ( = ?auto_1526013 ?auto_1526018 ) ) ( not ( = ?auto_1526013 ?auto_1526022 ) ) ( not ( = ?auto_1526013 ?auto_1526020 ) ) ( not ( = ?auto_1526014 ?auto_1526015 ) ) ( not ( = ?auto_1526014 ?auto_1526017 ) ) ( not ( = ?auto_1526014 ?auto_1526016 ) ) ( not ( = ?auto_1526014 ?auto_1526018 ) ) ( not ( = ?auto_1526014 ?auto_1526022 ) ) ( not ( = ?auto_1526014 ?auto_1526020 ) ) ( not ( = ?auto_1526015 ?auto_1526017 ) ) ( not ( = ?auto_1526015 ?auto_1526016 ) ) ( not ( = ?auto_1526015 ?auto_1526018 ) ) ( not ( = ?auto_1526015 ?auto_1526022 ) ) ( not ( = ?auto_1526015 ?auto_1526020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526017 ?auto_1526016 ?auto_1526018 )
      ( MAKE-5CRATE-VERIFY ?auto_1526013 ?auto_1526014 ?auto_1526015 ?auto_1526017 ?auto_1526016 ?auto_1526018 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1526026 - SURFACE
      ?auto_1526027 - SURFACE
      ?auto_1526028 - SURFACE
      ?auto_1526030 - SURFACE
      ?auto_1526029 - SURFACE
      ?auto_1526031 - SURFACE
      ?auto_1526032 - SURFACE
    )
    :vars
    (
      ?auto_1526038 - HOIST
      ?auto_1526033 - PLACE
      ?auto_1526037 - PLACE
      ?auto_1526039 - HOIST
      ?auto_1526036 - SURFACE
      ?auto_1526034 - SURFACE
      ?auto_1526035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526038 ?auto_1526033 ) ( IS-CRATE ?auto_1526032 ) ( not ( = ?auto_1526031 ?auto_1526032 ) ) ( not ( = ?auto_1526029 ?auto_1526031 ) ) ( not ( = ?auto_1526029 ?auto_1526032 ) ) ( not ( = ?auto_1526037 ?auto_1526033 ) ) ( HOIST-AT ?auto_1526039 ?auto_1526037 ) ( not ( = ?auto_1526038 ?auto_1526039 ) ) ( SURFACE-AT ?auto_1526032 ?auto_1526037 ) ( ON ?auto_1526032 ?auto_1526036 ) ( CLEAR ?auto_1526032 ) ( not ( = ?auto_1526031 ?auto_1526036 ) ) ( not ( = ?auto_1526032 ?auto_1526036 ) ) ( not ( = ?auto_1526029 ?auto_1526036 ) ) ( SURFACE-AT ?auto_1526029 ?auto_1526033 ) ( CLEAR ?auto_1526029 ) ( IS-CRATE ?auto_1526031 ) ( AVAILABLE ?auto_1526038 ) ( AVAILABLE ?auto_1526039 ) ( SURFACE-AT ?auto_1526031 ?auto_1526037 ) ( ON ?auto_1526031 ?auto_1526034 ) ( CLEAR ?auto_1526031 ) ( not ( = ?auto_1526031 ?auto_1526034 ) ) ( not ( = ?auto_1526032 ?auto_1526034 ) ) ( not ( = ?auto_1526029 ?auto_1526034 ) ) ( not ( = ?auto_1526036 ?auto_1526034 ) ) ( TRUCK-AT ?auto_1526035 ?auto_1526033 ) ( ON ?auto_1526027 ?auto_1526026 ) ( ON ?auto_1526028 ?auto_1526027 ) ( ON ?auto_1526030 ?auto_1526028 ) ( ON ?auto_1526029 ?auto_1526030 ) ( not ( = ?auto_1526026 ?auto_1526027 ) ) ( not ( = ?auto_1526026 ?auto_1526028 ) ) ( not ( = ?auto_1526026 ?auto_1526030 ) ) ( not ( = ?auto_1526026 ?auto_1526029 ) ) ( not ( = ?auto_1526026 ?auto_1526031 ) ) ( not ( = ?auto_1526026 ?auto_1526032 ) ) ( not ( = ?auto_1526026 ?auto_1526036 ) ) ( not ( = ?auto_1526026 ?auto_1526034 ) ) ( not ( = ?auto_1526027 ?auto_1526028 ) ) ( not ( = ?auto_1526027 ?auto_1526030 ) ) ( not ( = ?auto_1526027 ?auto_1526029 ) ) ( not ( = ?auto_1526027 ?auto_1526031 ) ) ( not ( = ?auto_1526027 ?auto_1526032 ) ) ( not ( = ?auto_1526027 ?auto_1526036 ) ) ( not ( = ?auto_1526027 ?auto_1526034 ) ) ( not ( = ?auto_1526028 ?auto_1526030 ) ) ( not ( = ?auto_1526028 ?auto_1526029 ) ) ( not ( = ?auto_1526028 ?auto_1526031 ) ) ( not ( = ?auto_1526028 ?auto_1526032 ) ) ( not ( = ?auto_1526028 ?auto_1526036 ) ) ( not ( = ?auto_1526028 ?auto_1526034 ) ) ( not ( = ?auto_1526030 ?auto_1526029 ) ) ( not ( = ?auto_1526030 ?auto_1526031 ) ) ( not ( = ?auto_1526030 ?auto_1526032 ) ) ( not ( = ?auto_1526030 ?auto_1526036 ) ) ( not ( = ?auto_1526030 ?auto_1526034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526029 ?auto_1526031 ?auto_1526032 )
      ( MAKE-6CRATE-VERIFY ?auto_1526026 ?auto_1526027 ?auto_1526028 ?auto_1526030 ?auto_1526029 ?auto_1526031 ?auto_1526032 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1526040 - SURFACE
      ?auto_1526041 - SURFACE
      ?auto_1526042 - SURFACE
      ?auto_1526044 - SURFACE
      ?auto_1526043 - SURFACE
      ?auto_1526045 - SURFACE
      ?auto_1526046 - SURFACE
      ?auto_1526047 - SURFACE
    )
    :vars
    (
      ?auto_1526053 - HOIST
      ?auto_1526048 - PLACE
      ?auto_1526052 - PLACE
      ?auto_1526054 - HOIST
      ?auto_1526051 - SURFACE
      ?auto_1526049 - SURFACE
      ?auto_1526050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526053 ?auto_1526048 ) ( IS-CRATE ?auto_1526047 ) ( not ( = ?auto_1526046 ?auto_1526047 ) ) ( not ( = ?auto_1526045 ?auto_1526046 ) ) ( not ( = ?auto_1526045 ?auto_1526047 ) ) ( not ( = ?auto_1526052 ?auto_1526048 ) ) ( HOIST-AT ?auto_1526054 ?auto_1526052 ) ( not ( = ?auto_1526053 ?auto_1526054 ) ) ( SURFACE-AT ?auto_1526047 ?auto_1526052 ) ( ON ?auto_1526047 ?auto_1526051 ) ( CLEAR ?auto_1526047 ) ( not ( = ?auto_1526046 ?auto_1526051 ) ) ( not ( = ?auto_1526047 ?auto_1526051 ) ) ( not ( = ?auto_1526045 ?auto_1526051 ) ) ( SURFACE-AT ?auto_1526045 ?auto_1526048 ) ( CLEAR ?auto_1526045 ) ( IS-CRATE ?auto_1526046 ) ( AVAILABLE ?auto_1526053 ) ( AVAILABLE ?auto_1526054 ) ( SURFACE-AT ?auto_1526046 ?auto_1526052 ) ( ON ?auto_1526046 ?auto_1526049 ) ( CLEAR ?auto_1526046 ) ( not ( = ?auto_1526046 ?auto_1526049 ) ) ( not ( = ?auto_1526047 ?auto_1526049 ) ) ( not ( = ?auto_1526045 ?auto_1526049 ) ) ( not ( = ?auto_1526051 ?auto_1526049 ) ) ( TRUCK-AT ?auto_1526050 ?auto_1526048 ) ( ON ?auto_1526041 ?auto_1526040 ) ( ON ?auto_1526042 ?auto_1526041 ) ( ON ?auto_1526044 ?auto_1526042 ) ( ON ?auto_1526043 ?auto_1526044 ) ( ON ?auto_1526045 ?auto_1526043 ) ( not ( = ?auto_1526040 ?auto_1526041 ) ) ( not ( = ?auto_1526040 ?auto_1526042 ) ) ( not ( = ?auto_1526040 ?auto_1526044 ) ) ( not ( = ?auto_1526040 ?auto_1526043 ) ) ( not ( = ?auto_1526040 ?auto_1526045 ) ) ( not ( = ?auto_1526040 ?auto_1526046 ) ) ( not ( = ?auto_1526040 ?auto_1526047 ) ) ( not ( = ?auto_1526040 ?auto_1526051 ) ) ( not ( = ?auto_1526040 ?auto_1526049 ) ) ( not ( = ?auto_1526041 ?auto_1526042 ) ) ( not ( = ?auto_1526041 ?auto_1526044 ) ) ( not ( = ?auto_1526041 ?auto_1526043 ) ) ( not ( = ?auto_1526041 ?auto_1526045 ) ) ( not ( = ?auto_1526041 ?auto_1526046 ) ) ( not ( = ?auto_1526041 ?auto_1526047 ) ) ( not ( = ?auto_1526041 ?auto_1526051 ) ) ( not ( = ?auto_1526041 ?auto_1526049 ) ) ( not ( = ?auto_1526042 ?auto_1526044 ) ) ( not ( = ?auto_1526042 ?auto_1526043 ) ) ( not ( = ?auto_1526042 ?auto_1526045 ) ) ( not ( = ?auto_1526042 ?auto_1526046 ) ) ( not ( = ?auto_1526042 ?auto_1526047 ) ) ( not ( = ?auto_1526042 ?auto_1526051 ) ) ( not ( = ?auto_1526042 ?auto_1526049 ) ) ( not ( = ?auto_1526044 ?auto_1526043 ) ) ( not ( = ?auto_1526044 ?auto_1526045 ) ) ( not ( = ?auto_1526044 ?auto_1526046 ) ) ( not ( = ?auto_1526044 ?auto_1526047 ) ) ( not ( = ?auto_1526044 ?auto_1526051 ) ) ( not ( = ?auto_1526044 ?auto_1526049 ) ) ( not ( = ?auto_1526043 ?auto_1526045 ) ) ( not ( = ?auto_1526043 ?auto_1526046 ) ) ( not ( = ?auto_1526043 ?auto_1526047 ) ) ( not ( = ?auto_1526043 ?auto_1526051 ) ) ( not ( = ?auto_1526043 ?auto_1526049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526045 ?auto_1526046 ?auto_1526047 )
      ( MAKE-7CRATE-VERIFY ?auto_1526040 ?auto_1526041 ?auto_1526042 ?auto_1526044 ?auto_1526043 ?auto_1526045 ?auto_1526046 ?auto_1526047 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1526055 - SURFACE
      ?auto_1526056 - SURFACE
      ?auto_1526057 - SURFACE
      ?auto_1526059 - SURFACE
      ?auto_1526058 - SURFACE
      ?auto_1526060 - SURFACE
      ?auto_1526061 - SURFACE
      ?auto_1526062 - SURFACE
      ?auto_1526063 - SURFACE
    )
    :vars
    (
      ?auto_1526069 - HOIST
      ?auto_1526064 - PLACE
      ?auto_1526068 - PLACE
      ?auto_1526070 - HOIST
      ?auto_1526067 - SURFACE
      ?auto_1526065 - SURFACE
      ?auto_1526066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526069 ?auto_1526064 ) ( IS-CRATE ?auto_1526063 ) ( not ( = ?auto_1526062 ?auto_1526063 ) ) ( not ( = ?auto_1526061 ?auto_1526062 ) ) ( not ( = ?auto_1526061 ?auto_1526063 ) ) ( not ( = ?auto_1526068 ?auto_1526064 ) ) ( HOIST-AT ?auto_1526070 ?auto_1526068 ) ( not ( = ?auto_1526069 ?auto_1526070 ) ) ( SURFACE-AT ?auto_1526063 ?auto_1526068 ) ( ON ?auto_1526063 ?auto_1526067 ) ( CLEAR ?auto_1526063 ) ( not ( = ?auto_1526062 ?auto_1526067 ) ) ( not ( = ?auto_1526063 ?auto_1526067 ) ) ( not ( = ?auto_1526061 ?auto_1526067 ) ) ( SURFACE-AT ?auto_1526061 ?auto_1526064 ) ( CLEAR ?auto_1526061 ) ( IS-CRATE ?auto_1526062 ) ( AVAILABLE ?auto_1526069 ) ( AVAILABLE ?auto_1526070 ) ( SURFACE-AT ?auto_1526062 ?auto_1526068 ) ( ON ?auto_1526062 ?auto_1526065 ) ( CLEAR ?auto_1526062 ) ( not ( = ?auto_1526062 ?auto_1526065 ) ) ( not ( = ?auto_1526063 ?auto_1526065 ) ) ( not ( = ?auto_1526061 ?auto_1526065 ) ) ( not ( = ?auto_1526067 ?auto_1526065 ) ) ( TRUCK-AT ?auto_1526066 ?auto_1526064 ) ( ON ?auto_1526056 ?auto_1526055 ) ( ON ?auto_1526057 ?auto_1526056 ) ( ON ?auto_1526059 ?auto_1526057 ) ( ON ?auto_1526058 ?auto_1526059 ) ( ON ?auto_1526060 ?auto_1526058 ) ( ON ?auto_1526061 ?auto_1526060 ) ( not ( = ?auto_1526055 ?auto_1526056 ) ) ( not ( = ?auto_1526055 ?auto_1526057 ) ) ( not ( = ?auto_1526055 ?auto_1526059 ) ) ( not ( = ?auto_1526055 ?auto_1526058 ) ) ( not ( = ?auto_1526055 ?auto_1526060 ) ) ( not ( = ?auto_1526055 ?auto_1526061 ) ) ( not ( = ?auto_1526055 ?auto_1526062 ) ) ( not ( = ?auto_1526055 ?auto_1526063 ) ) ( not ( = ?auto_1526055 ?auto_1526067 ) ) ( not ( = ?auto_1526055 ?auto_1526065 ) ) ( not ( = ?auto_1526056 ?auto_1526057 ) ) ( not ( = ?auto_1526056 ?auto_1526059 ) ) ( not ( = ?auto_1526056 ?auto_1526058 ) ) ( not ( = ?auto_1526056 ?auto_1526060 ) ) ( not ( = ?auto_1526056 ?auto_1526061 ) ) ( not ( = ?auto_1526056 ?auto_1526062 ) ) ( not ( = ?auto_1526056 ?auto_1526063 ) ) ( not ( = ?auto_1526056 ?auto_1526067 ) ) ( not ( = ?auto_1526056 ?auto_1526065 ) ) ( not ( = ?auto_1526057 ?auto_1526059 ) ) ( not ( = ?auto_1526057 ?auto_1526058 ) ) ( not ( = ?auto_1526057 ?auto_1526060 ) ) ( not ( = ?auto_1526057 ?auto_1526061 ) ) ( not ( = ?auto_1526057 ?auto_1526062 ) ) ( not ( = ?auto_1526057 ?auto_1526063 ) ) ( not ( = ?auto_1526057 ?auto_1526067 ) ) ( not ( = ?auto_1526057 ?auto_1526065 ) ) ( not ( = ?auto_1526059 ?auto_1526058 ) ) ( not ( = ?auto_1526059 ?auto_1526060 ) ) ( not ( = ?auto_1526059 ?auto_1526061 ) ) ( not ( = ?auto_1526059 ?auto_1526062 ) ) ( not ( = ?auto_1526059 ?auto_1526063 ) ) ( not ( = ?auto_1526059 ?auto_1526067 ) ) ( not ( = ?auto_1526059 ?auto_1526065 ) ) ( not ( = ?auto_1526058 ?auto_1526060 ) ) ( not ( = ?auto_1526058 ?auto_1526061 ) ) ( not ( = ?auto_1526058 ?auto_1526062 ) ) ( not ( = ?auto_1526058 ?auto_1526063 ) ) ( not ( = ?auto_1526058 ?auto_1526067 ) ) ( not ( = ?auto_1526058 ?auto_1526065 ) ) ( not ( = ?auto_1526060 ?auto_1526061 ) ) ( not ( = ?auto_1526060 ?auto_1526062 ) ) ( not ( = ?auto_1526060 ?auto_1526063 ) ) ( not ( = ?auto_1526060 ?auto_1526067 ) ) ( not ( = ?auto_1526060 ?auto_1526065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526061 ?auto_1526062 ?auto_1526063 )
      ( MAKE-8CRATE-VERIFY ?auto_1526055 ?auto_1526056 ?auto_1526057 ?auto_1526059 ?auto_1526058 ?auto_1526060 ?auto_1526061 ?auto_1526062 ?auto_1526063 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526071 - SURFACE
      ?auto_1526072 - SURFACE
      ?auto_1526073 - SURFACE
      ?auto_1526075 - SURFACE
      ?auto_1526074 - SURFACE
      ?auto_1526076 - SURFACE
      ?auto_1526077 - SURFACE
      ?auto_1526078 - SURFACE
      ?auto_1526079 - SURFACE
      ?auto_1526080 - SURFACE
    )
    :vars
    (
      ?auto_1526086 - HOIST
      ?auto_1526081 - PLACE
      ?auto_1526085 - PLACE
      ?auto_1526087 - HOIST
      ?auto_1526084 - SURFACE
      ?auto_1526082 - SURFACE
      ?auto_1526083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526086 ?auto_1526081 ) ( IS-CRATE ?auto_1526080 ) ( not ( = ?auto_1526079 ?auto_1526080 ) ) ( not ( = ?auto_1526078 ?auto_1526079 ) ) ( not ( = ?auto_1526078 ?auto_1526080 ) ) ( not ( = ?auto_1526085 ?auto_1526081 ) ) ( HOIST-AT ?auto_1526087 ?auto_1526085 ) ( not ( = ?auto_1526086 ?auto_1526087 ) ) ( SURFACE-AT ?auto_1526080 ?auto_1526085 ) ( ON ?auto_1526080 ?auto_1526084 ) ( CLEAR ?auto_1526080 ) ( not ( = ?auto_1526079 ?auto_1526084 ) ) ( not ( = ?auto_1526080 ?auto_1526084 ) ) ( not ( = ?auto_1526078 ?auto_1526084 ) ) ( SURFACE-AT ?auto_1526078 ?auto_1526081 ) ( CLEAR ?auto_1526078 ) ( IS-CRATE ?auto_1526079 ) ( AVAILABLE ?auto_1526086 ) ( AVAILABLE ?auto_1526087 ) ( SURFACE-AT ?auto_1526079 ?auto_1526085 ) ( ON ?auto_1526079 ?auto_1526082 ) ( CLEAR ?auto_1526079 ) ( not ( = ?auto_1526079 ?auto_1526082 ) ) ( not ( = ?auto_1526080 ?auto_1526082 ) ) ( not ( = ?auto_1526078 ?auto_1526082 ) ) ( not ( = ?auto_1526084 ?auto_1526082 ) ) ( TRUCK-AT ?auto_1526083 ?auto_1526081 ) ( ON ?auto_1526072 ?auto_1526071 ) ( ON ?auto_1526073 ?auto_1526072 ) ( ON ?auto_1526075 ?auto_1526073 ) ( ON ?auto_1526074 ?auto_1526075 ) ( ON ?auto_1526076 ?auto_1526074 ) ( ON ?auto_1526077 ?auto_1526076 ) ( ON ?auto_1526078 ?auto_1526077 ) ( not ( = ?auto_1526071 ?auto_1526072 ) ) ( not ( = ?auto_1526071 ?auto_1526073 ) ) ( not ( = ?auto_1526071 ?auto_1526075 ) ) ( not ( = ?auto_1526071 ?auto_1526074 ) ) ( not ( = ?auto_1526071 ?auto_1526076 ) ) ( not ( = ?auto_1526071 ?auto_1526077 ) ) ( not ( = ?auto_1526071 ?auto_1526078 ) ) ( not ( = ?auto_1526071 ?auto_1526079 ) ) ( not ( = ?auto_1526071 ?auto_1526080 ) ) ( not ( = ?auto_1526071 ?auto_1526084 ) ) ( not ( = ?auto_1526071 ?auto_1526082 ) ) ( not ( = ?auto_1526072 ?auto_1526073 ) ) ( not ( = ?auto_1526072 ?auto_1526075 ) ) ( not ( = ?auto_1526072 ?auto_1526074 ) ) ( not ( = ?auto_1526072 ?auto_1526076 ) ) ( not ( = ?auto_1526072 ?auto_1526077 ) ) ( not ( = ?auto_1526072 ?auto_1526078 ) ) ( not ( = ?auto_1526072 ?auto_1526079 ) ) ( not ( = ?auto_1526072 ?auto_1526080 ) ) ( not ( = ?auto_1526072 ?auto_1526084 ) ) ( not ( = ?auto_1526072 ?auto_1526082 ) ) ( not ( = ?auto_1526073 ?auto_1526075 ) ) ( not ( = ?auto_1526073 ?auto_1526074 ) ) ( not ( = ?auto_1526073 ?auto_1526076 ) ) ( not ( = ?auto_1526073 ?auto_1526077 ) ) ( not ( = ?auto_1526073 ?auto_1526078 ) ) ( not ( = ?auto_1526073 ?auto_1526079 ) ) ( not ( = ?auto_1526073 ?auto_1526080 ) ) ( not ( = ?auto_1526073 ?auto_1526084 ) ) ( not ( = ?auto_1526073 ?auto_1526082 ) ) ( not ( = ?auto_1526075 ?auto_1526074 ) ) ( not ( = ?auto_1526075 ?auto_1526076 ) ) ( not ( = ?auto_1526075 ?auto_1526077 ) ) ( not ( = ?auto_1526075 ?auto_1526078 ) ) ( not ( = ?auto_1526075 ?auto_1526079 ) ) ( not ( = ?auto_1526075 ?auto_1526080 ) ) ( not ( = ?auto_1526075 ?auto_1526084 ) ) ( not ( = ?auto_1526075 ?auto_1526082 ) ) ( not ( = ?auto_1526074 ?auto_1526076 ) ) ( not ( = ?auto_1526074 ?auto_1526077 ) ) ( not ( = ?auto_1526074 ?auto_1526078 ) ) ( not ( = ?auto_1526074 ?auto_1526079 ) ) ( not ( = ?auto_1526074 ?auto_1526080 ) ) ( not ( = ?auto_1526074 ?auto_1526084 ) ) ( not ( = ?auto_1526074 ?auto_1526082 ) ) ( not ( = ?auto_1526076 ?auto_1526077 ) ) ( not ( = ?auto_1526076 ?auto_1526078 ) ) ( not ( = ?auto_1526076 ?auto_1526079 ) ) ( not ( = ?auto_1526076 ?auto_1526080 ) ) ( not ( = ?auto_1526076 ?auto_1526084 ) ) ( not ( = ?auto_1526076 ?auto_1526082 ) ) ( not ( = ?auto_1526077 ?auto_1526078 ) ) ( not ( = ?auto_1526077 ?auto_1526079 ) ) ( not ( = ?auto_1526077 ?auto_1526080 ) ) ( not ( = ?auto_1526077 ?auto_1526084 ) ) ( not ( = ?auto_1526077 ?auto_1526082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526078 ?auto_1526079 ?auto_1526080 )
      ( MAKE-9CRATE-VERIFY ?auto_1526071 ?auto_1526072 ?auto_1526073 ?auto_1526075 ?auto_1526074 ?auto_1526076 ?auto_1526077 ?auto_1526078 ?auto_1526079 ?auto_1526080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1526088 - SURFACE
      ?auto_1526089 - SURFACE
    )
    :vars
    (
      ?auto_1526096 - HOIST
      ?auto_1526090 - PLACE
      ?auto_1526095 - SURFACE
      ?auto_1526094 - PLACE
      ?auto_1526097 - HOIST
      ?auto_1526093 - SURFACE
      ?auto_1526091 - SURFACE
      ?auto_1526092 - TRUCK
      ?auto_1526098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526096 ?auto_1526090 ) ( IS-CRATE ?auto_1526089 ) ( not ( = ?auto_1526088 ?auto_1526089 ) ) ( not ( = ?auto_1526095 ?auto_1526088 ) ) ( not ( = ?auto_1526095 ?auto_1526089 ) ) ( not ( = ?auto_1526094 ?auto_1526090 ) ) ( HOIST-AT ?auto_1526097 ?auto_1526094 ) ( not ( = ?auto_1526096 ?auto_1526097 ) ) ( SURFACE-AT ?auto_1526089 ?auto_1526094 ) ( ON ?auto_1526089 ?auto_1526093 ) ( CLEAR ?auto_1526089 ) ( not ( = ?auto_1526088 ?auto_1526093 ) ) ( not ( = ?auto_1526089 ?auto_1526093 ) ) ( not ( = ?auto_1526095 ?auto_1526093 ) ) ( IS-CRATE ?auto_1526088 ) ( AVAILABLE ?auto_1526097 ) ( SURFACE-AT ?auto_1526088 ?auto_1526094 ) ( ON ?auto_1526088 ?auto_1526091 ) ( CLEAR ?auto_1526088 ) ( not ( = ?auto_1526088 ?auto_1526091 ) ) ( not ( = ?auto_1526089 ?auto_1526091 ) ) ( not ( = ?auto_1526095 ?auto_1526091 ) ) ( not ( = ?auto_1526093 ?auto_1526091 ) ) ( TRUCK-AT ?auto_1526092 ?auto_1526090 ) ( SURFACE-AT ?auto_1526098 ?auto_1526090 ) ( CLEAR ?auto_1526098 ) ( LIFTING ?auto_1526096 ?auto_1526095 ) ( IS-CRATE ?auto_1526095 ) ( not ( = ?auto_1526098 ?auto_1526095 ) ) ( not ( = ?auto_1526088 ?auto_1526098 ) ) ( not ( = ?auto_1526089 ?auto_1526098 ) ) ( not ( = ?auto_1526093 ?auto_1526098 ) ) ( not ( = ?auto_1526091 ?auto_1526098 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1526098 ?auto_1526095 )
      ( MAKE-2CRATE ?auto_1526095 ?auto_1526088 ?auto_1526089 )
      ( MAKE-1CRATE-VERIFY ?auto_1526088 ?auto_1526089 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1526099 - SURFACE
      ?auto_1526100 - SURFACE
      ?auto_1526101 - SURFACE
    )
    :vars
    (
      ?auto_1526108 - HOIST
      ?auto_1526102 - PLACE
      ?auto_1526103 - PLACE
      ?auto_1526107 - HOIST
      ?auto_1526105 - SURFACE
      ?auto_1526106 - SURFACE
      ?auto_1526104 - TRUCK
      ?auto_1526109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526108 ?auto_1526102 ) ( IS-CRATE ?auto_1526101 ) ( not ( = ?auto_1526100 ?auto_1526101 ) ) ( not ( = ?auto_1526099 ?auto_1526100 ) ) ( not ( = ?auto_1526099 ?auto_1526101 ) ) ( not ( = ?auto_1526103 ?auto_1526102 ) ) ( HOIST-AT ?auto_1526107 ?auto_1526103 ) ( not ( = ?auto_1526108 ?auto_1526107 ) ) ( SURFACE-AT ?auto_1526101 ?auto_1526103 ) ( ON ?auto_1526101 ?auto_1526105 ) ( CLEAR ?auto_1526101 ) ( not ( = ?auto_1526100 ?auto_1526105 ) ) ( not ( = ?auto_1526101 ?auto_1526105 ) ) ( not ( = ?auto_1526099 ?auto_1526105 ) ) ( IS-CRATE ?auto_1526100 ) ( AVAILABLE ?auto_1526107 ) ( SURFACE-AT ?auto_1526100 ?auto_1526103 ) ( ON ?auto_1526100 ?auto_1526106 ) ( CLEAR ?auto_1526100 ) ( not ( = ?auto_1526100 ?auto_1526106 ) ) ( not ( = ?auto_1526101 ?auto_1526106 ) ) ( not ( = ?auto_1526099 ?auto_1526106 ) ) ( not ( = ?auto_1526105 ?auto_1526106 ) ) ( TRUCK-AT ?auto_1526104 ?auto_1526102 ) ( SURFACE-AT ?auto_1526109 ?auto_1526102 ) ( CLEAR ?auto_1526109 ) ( LIFTING ?auto_1526108 ?auto_1526099 ) ( IS-CRATE ?auto_1526099 ) ( not ( = ?auto_1526109 ?auto_1526099 ) ) ( not ( = ?auto_1526100 ?auto_1526109 ) ) ( not ( = ?auto_1526101 ?auto_1526109 ) ) ( not ( = ?auto_1526105 ?auto_1526109 ) ) ( not ( = ?auto_1526106 ?auto_1526109 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1526100 ?auto_1526101 )
      ( MAKE-2CRATE-VERIFY ?auto_1526099 ?auto_1526100 ?auto_1526101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1526110 - SURFACE
      ?auto_1526111 - SURFACE
      ?auto_1526112 - SURFACE
      ?auto_1526113 - SURFACE
    )
    :vars
    (
      ?auto_1526115 - HOIST
      ?auto_1526114 - PLACE
      ?auto_1526117 - PLACE
      ?auto_1526119 - HOIST
      ?auto_1526120 - SURFACE
      ?auto_1526118 - SURFACE
      ?auto_1526116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526115 ?auto_1526114 ) ( IS-CRATE ?auto_1526113 ) ( not ( = ?auto_1526112 ?auto_1526113 ) ) ( not ( = ?auto_1526111 ?auto_1526112 ) ) ( not ( = ?auto_1526111 ?auto_1526113 ) ) ( not ( = ?auto_1526117 ?auto_1526114 ) ) ( HOIST-AT ?auto_1526119 ?auto_1526117 ) ( not ( = ?auto_1526115 ?auto_1526119 ) ) ( SURFACE-AT ?auto_1526113 ?auto_1526117 ) ( ON ?auto_1526113 ?auto_1526120 ) ( CLEAR ?auto_1526113 ) ( not ( = ?auto_1526112 ?auto_1526120 ) ) ( not ( = ?auto_1526113 ?auto_1526120 ) ) ( not ( = ?auto_1526111 ?auto_1526120 ) ) ( IS-CRATE ?auto_1526112 ) ( AVAILABLE ?auto_1526119 ) ( SURFACE-AT ?auto_1526112 ?auto_1526117 ) ( ON ?auto_1526112 ?auto_1526118 ) ( CLEAR ?auto_1526112 ) ( not ( = ?auto_1526112 ?auto_1526118 ) ) ( not ( = ?auto_1526113 ?auto_1526118 ) ) ( not ( = ?auto_1526111 ?auto_1526118 ) ) ( not ( = ?auto_1526120 ?auto_1526118 ) ) ( TRUCK-AT ?auto_1526116 ?auto_1526114 ) ( SURFACE-AT ?auto_1526110 ?auto_1526114 ) ( CLEAR ?auto_1526110 ) ( LIFTING ?auto_1526115 ?auto_1526111 ) ( IS-CRATE ?auto_1526111 ) ( not ( = ?auto_1526110 ?auto_1526111 ) ) ( not ( = ?auto_1526112 ?auto_1526110 ) ) ( not ( = ?auto_1526113 ?auto_1526110 ) ) ( not ( = ?auto_1526120 ?auto_1526110 ) ) ( not ( = ?auto_1526118 ?auto_1526110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526111 ?auto_1526112 ?auto_1526113 )
      ( MAKE-3CRATE-VERIFY ?auto_1526110 ?auto_1526111 ?auto_1526112 ?auto_1526113 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1526121 - SURFACE
      ?auto_1526122 - SURFACE
      ?auto_1526123 - SURFACE
      ?auto_1526125 - SURFACE
      ?auto_1526124 - SURFACE
    )
    :vars
    (
      ?auto_1526127 - HOIST
      ?auto_1526126 - PLACE
      ?auto_1526129 - PLACE
      ?auto_1526131 - HOIST
      ?auto_1526132 - SURFACE
      ?auto_1526130 - SURFACE
      ?auto_1526128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526127 ?auto_1526126 ) ( IS-CRATE ?auto_1526124 ) ( not ( = ?auto_1526125 ?auto_1526124 ) ) ( not ( = ?auto_1526123 ?auto_1526125 ) ) ( not ( = ?auto_1526123 ?auto_1526124 ) ) ( not ( = ?auto_1526129 ?auto_1526126 ) ) ( HOIST-AT ?auto_1526131 ?auto_1526129 ) ( not ( = ?auto_1526127 ?auto_1526131 ) ) ( SURFACE-AT ?auto_1526124 ?auto_1526129 ) ( ON ?auto_1526124 ?auto_1526132 ) ( CLEAR ?auto_1526124 ) ( not ( = ?auto_1526125 ?auto_1526132 ) ) ( not ( = ?auto_1526124 ?auto_1526132 ) ) ( not ( = ?auto_1526123 ?auto_1526132 ) ) ( IS-CRATE ?auto_1526125 ) ( AVAILABLE ?auto_1526131 ) ( SURFACE-AT ?auto_1526125 ?auto_1526129 ) ( ON ?auto_1526125 ?auto_1526130 ) ( CLEAR ?auto_1526125 ) ( not ( = ?auto_1526125 ?auto_1526130 ) ) ( not ( = ?auto_1526124 ?auto_1526130 ) ) ( not ( = ?auto_1526123 ?auto_1526130 ) ) ( not ( = ?auto_1526132 ?auto_1526130 ) ) ( TRUCK-AT ?auto_1526128 ?auto_1526126 ) ( SURFACE-AT ?auto_1526122 ?auto_1526126 ) ( CLEAR ?auto_1526122 ) ( LIFTING ?auto_1526127 ?auto_1526123 ) ( IS-CRATE ?auto_1526123 ) ( not ( = ?auto_1526122 ?auto_1526123 ) ) ( not ( = ?auto_1526125 ?auto_1526122 ) ) ( not ( = ?auto_1526124 ?auto_1526122 ) ) ( not ( = ?auto_1526132 ?auto_1526122 ) ) ( not ( = ?auto_1526130 ?auto_1526122 ) ) ( ON ?auto_1526122 ?auto_1526121 ) ( not ( = ?auto_1526121 ?auto_1526122 ) ) ( not ( = ?auto_1526121 ?auto_1526123 ) ) ( not ( = ?auto_1526121 ?auto_1526125 ) ) ( not ( = ?auto_1526121 ?auto_1526124 ) ) ( not ( = ?auto_1526121 ?auto_1526132 ) ) ( not ( = ?auto_1526121 ?auto_1526130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526123 ?auto_1526125 ?auto_1526124 )
      ( MAKE-4CRATE-VERIFY ?auto_1526121 ?auto_1526122 ?auto_1526123 ?auto_1526125 ?auto_1526124 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1526133 - SURFACE
      ?auto_1526134 - SURFACE
      ?auto_1526135 - SURFACE
      ?auto_1526137 - SURFACE
      ?auto_1526136 - SURFACE
      ?auto_1526138 - SURFACE
    )
    :vars
    (
      ?auto_1526140 - HOIST
      ?auto_1526139 - PLACE
      ?auto_1526142 - PLACE
      ?auto_1526144 - HOIST
      ?auto_1526145 - SURFACE
      ?auto_1526143 - SURFACE
      ?auto_1526141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526140 ?auto_1526139 ) ( IS-CRATE ?auto_1526138 ) ( not ( = ?auto_1526136 ?auto_1526138 ) ) ( not ( = ?auto_1526137 ?auto_1526136 ) ) ( not ( = ?auto_1526137 ?auto_1526138 ) ) ( not ( = ?auto_1526142 ?auto_1526139 ) ) ( HOIST-AT ?auto_1526144 ?auto_1526142 ) ( not ( = ?auto_1526140 ?auto_1526144 ) ) ( SURFACE-AT ?auto_1526138 ?auto_1526142 ) ( ON ?auto_1526138 ?auto_1526145 ) ( CLEAR ?auto_1526138 ) ( not ( = ?auto_1526136 ?auto_1526145 ) ) ( not ( = ?auto_1526138 ?auto_1526145 ) ) ( not ( = ?auto_1526137 ?auto_1526145 ) ) ( IS-CRATE ?auto_1526136 ) ( AVAILABLE ?auto_1526144 ) ( SURFACE-AT ?auto_1526136 ?auto_1526142 ) ( ON ?auto_1526136 ?auto_1526143 ) ( CLEAR ?auto_1526136 ) ( not ( = ?auto_1526136 ?auto_1526143 ) ) ( not ( = ?auto_1526138 ?auto_1526143 ) ) ( not ( = ?auto_1526137 ?auto_1526143 ) ) ( not ( = ?auto_1526145 ?auto_1526143 ) ) ( TRUCK-AT ?auto_1526141 ?auto_1526139 ) ( SURFACE-AT ?auto_1526135 ?auto_1526139 ) ( CLEAR ?auto_1526135 ) ( LIFTING ?auto_1526140 ?auto_1526137 ) ( IS-CRATE ?auto_1526137 ) ( not ( = ?auto_1526135 ?auto_1526137 ) ) ( not ( = ?auto_1526136 ?auto_1526135 ) ) ( not ( = ?auto_1526138 ?auto_1526135 ) ) ( not ( = ?auto_1526145 ?auto_1526135 ) ) ( not ( = ?auto_1526143 ?auto_1526135 ) ) ( ON ?auto_1526134 ?auto_1526133 ) ( ON ?auto_1526135 ?auto_1526134 ) ( not ( = ?auto_1526133 ?auto_1526134 ) ) ( not ( = ?auto_1526133 ?auto_1526135 ) ) ( not ( = ?auto_1526133 ?auto_1526137 ) ) ( not ( = ?auto_1526133 ?auto_1526136 ) ) ( not ( = ?auto_1526133 ?auto_1526138 ) ) ( not ( = ?auto_1526133 ?auto_1526145 ) ) ( not ( = ?auto_1526133 ?auto_1526143 ) ) ( not ( = ?auto_1526134 ?auto_1526135 ) ) ( not ( = ?auto_1526134 ?auto_1526137 ) ) ( not ( = ?auto_1526134 ?auto_1526136 ) ) ( not ( = ?auto_1526134 ?auto_1526138 ) ) ( not ( = ?auto_1526134 ?auto_1526145 ) ) ( not ( = ?auto_1526134 ?auto_1526143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526137 ?auto_1526136 ?auto_1526138 )
      ( MAKE-5CRATE-VERIFY ?auto_1526133 ?auto_1526134 ?auto_1526135 ?auto_1526137 ?auto_1526136 ?auto_1526138 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1526146 - SURFACE
      ?auto_1526147 - SURFACE
      ?auto_1526148 - SURFACE
      ?auto_1526150 - SURFACE
      ?auto_1526149 - SURFACE
      ?auto_1526151 - SURFACE
      ?auto_1526152 - SURFACE
    )
    :vars
    (
      ?auto_1526154 - HOIST
      ?auto_1526153 - PLACE
      ?auto_1526156 - PLACE
      ?auto_1526158 - HOIST
      ?auto_1526159 - SURFACE
      ?auto_1526157 - SURFACE
      ?auto_1526155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526154 ?auto_1526153 ) ( IS-CRATE ?auto_1526152 ) ( not ( = ?auto_1526151 ?auto_1526152 ) ) ( not ( = ?auto_1526149 ?auto_1526151 ) ) ( not ( = ?auto_1526149 ?auto_1526152 ) ) ( not ( = ?auto_1526156 ?auto_1526153 ) ) ( HOIST-AT ?auto_1526158 ?auto_1526156 ) ( not ( = ?auto_1526154 ?auto_1526158 ) ) ( SURFACE-AT ?auto_1526152 ?auto_1526156 ) ( ON ?auto_1526152 ?auto_1526159 ) ( CLEAR ?auto_1526152 ) ( not ( = ?auto_1526151 ?auto_1526159 ) ) ( not ( = ?auto_1526152 ?auto_1526159 ) ) ( not ( = ?auto_1526149 ?auto_1526159 ) ) ( IS-CRATE ?auto_1526151 ) ( AVAILABLE ?auto_1526158 ) ( SURFACE-AT ?auto_1526151 ?auto_1526156 ) ( ON ?auto_1526151 ?auto_1526157 ) ( CLEAR ?auto_1526151 ) ( not ( = ?auto_1526151 ?auto_1526157 ) ) ( not ( = ?auto_1526152 ?auto_1526157 ) ) ( not ( = ?auto_1526149 ?auto_1526157 ) ) ( not ( = ?auto_1526159 ?auto_1526157 ) ) ( TRUCK-AT ?auto_1526155 ?auto_1526153 ) ( SURFACE-AT ?auto_1526150 ?auto_1526153 ) ( CLEAR ?auto_1526150 ) ( LIFTING ?auto_1526154 ?auto_1526149 ) ( IS-CRATE ?auto_1526149 ) ( not ( = ?auto_1526150 ?auto_1526149 ) ) ( not ( = ?auto_1526151 ?auto_1526150 ) ) ( not ( = ?auto_1526152 ?auto_1526150 ) ) ( not ( = ?auto_1526159 ?auto_1526150 ) ) ( not ( = ?auto_1526157 ?auto_1526150 ) ) ( ON ?auto_1526147 ?auto_1526146 ) ( ON ?auto_1526148 ?auto_1526147 ) ( ON ?auto_1526150 ?auto_1526148 ) ( not ( = ?auto_1526146 ?auto_1526147 ) ) ( not ( = ?auto_1526146 ?auto_1526148 ) ) ( not ( = ?auto_1526146 ?auto_1526150 ) ) ( not ( = ?auto_1526146 ?auto_1526149 ) ) ( not ( = ?auto_1526146 ?auto_1526151 ) ) ( not ( = ?auto_1526146 ?auto_1526152 ) ) ( not ( = ?auto_1526146 ?auto_1526159 ) ) ( not ( = ?auto_1526146 ?auto_1526157 ) ) ( not ( = ?auto_1526147 ?auto_1526148 ) ) ( not ( = ?auto_1526147 ?auto_1526150 ) ) ( not ( = ?auto_1526147 ?auto_1526149 ) ) ( not ( = ?auto_1526147 ?auto_1526151 ) ) ( not ( = ?auto_1526147 ?auto_1526152 ) ) ( not ( = ?auto_1526147 ?auto_1526159 ) ) ( not ( = ?auto_1526147 ?auto_1526157 ) ) ( not ( = ?auto_1526148 ?auto_1526150 ) ) ( not ( = ?auto_1526148 ?auto_1526149 ) ) ( not ( = ?auto_1526148 ?auto_1526151 ) ) ( not ( = ?auto_1526148 ?auto_1526152 ) ) ( not ( = ?auto_1526148 ?auto_1526159 ) ) ( not ( = ?auto_1526148 ?auto_1526157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526149 ?auto_1526151 ?auto_1526152 )
      ( MAKE-6CRATE-VERIFY ?auto_1526146 ?auto_1526147 ?auto_1526148 ?auto_1526150 ?auto_1526149 ?auto_1526151 ?auto_1526152 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1526160 - SURFACE
      ?auto_1526161 - SURFACE
      ?auto_1526162 - SURFACE
      ?auto_1526164 - SURFACE
      ?auto_1526163 - SURFACE
      ?auto_1526165 - SURFACE
      ?auto_1526166 - SURFACE
      ?auto_1526167 - SURFACE
    )
    :vars
    (
      ?auto_1526169 - HOIST
      ?auto_1526168 - PLACE
      ?auto_1526171 - PLACE
      ?auto_1526173 - HOIST
      ?auto_1526174 - SURFACE
      ?auto_1526172 - SURFACE
      ?auto_1526170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526169 ?auto_1526168 ) ( IS-CRATE ?auto_1526167 ) ( not ( = ?auto_1526166 ?auto_1526167 ) ) ( not ( = ?auto_1526165 ?auto_1526166 ) ) ( not ( = ?auto_1526165 ?auto_1526167 ) ) ( not ( = ?auto_1526171 ?auto_1526168 ) ) ( HOIST-AT ?auto_1526173 ?auto_1526171 ) ( not ( = ?auto_1526169 ?auto_1526173 ) ) ( SURFACE-AT ?auto_1526167 ?auto_1526171 ) ( ON ?auto_1526167 ?auto_1526174 ) ( CLEAR ?auto_1526167 ) ( not ( = ?auto_1526166 ?auto_1526174 ) ) ( not ( = ?auto_1526167 ?auto_1526174 ) ) ( not ( = ?auto_1526165 ?auto_1526174 ) ) ( IS-CRATE ?auto_1526166 ) ( AVAILABLE ?auto_1526173 ) ( SURFACE-AT ?auto_1526166 ?auto_1526171 ) ( ON ?auto_1526166 ?auto_1526172 ) ( CLEAR ?auto_1526166 ) ( not ( = ?auto_1526166 ?auto_1526172 ) ) ( not ( = ?auto_1526167 ?auto_1526172 ) ) ( not ( = ?auto_1526165 ?auto_1526172 ) ) ( not ( = ?auto_1526174 ?auto_1526172 ) ) ( TRUCK-AT ?auto_1526170 ?auto_1526168 ) ( SURFACE-AT ?auto_1526163 ?auto_1526168 ) ( CLEAR ?auto_1526163 ) ( LIFTING ?auto_1526169 ?auto_1526165 ) ( IS-CRATE ?auto_1526165 ) ( not ( = ?auto_1526163 ?auto_1526165 ) ) ( not ( = ?auto_1526166 ?auto_1526163 ) ) ( not ( = ?auto_1526167 ?auto_1526163 ) ) ( not ( = ?auto_1526174 ?auto_1526163 ) ) ( not ( = ?auto_1526172 ?auto_1526163 ) ) ( ON ?auto_1526161 ?auto_1526160 ) ( ON ?auto_1526162 ?auto_1526161 ) ( ON ?auto_1526164 ?auto_1526162 ) ( ON ?auto_1526163 ?auto_1526164 ) ( not ( = ?auto_1526160 ?auto_1526161 ) ) ( not ( = ?auto_1526160 ?auto_1526162 ) ) ( not ( = ?auto_1526160 ?auto_1526164 ) ) ( not ( = ?auto_1526160 ?auto_1526163 ) ) ( not ( = ?auto_1526160 ?auto_1526165 ) ) ( not ( = ?auto_1526160 ?auto_1526166 ) ) ( not ( = ?auto_1526160 ?auto_1526167 ) ) ( not ( = ?auto_1526160 ?auto_1526174 ) ) ( not ( = ?auto_1526160 ?auto_1526172 ) ) ( not ( = ?auto_1526161 ?auto_1526162 ) ) ( not ( = ?auto_1526161 ?auto_1526164 ) ) ( not ( = ?auto_1526161 ?auto_1526163 ) ) ( not ( = ?auto_1526161 ?auto_1526165 ) ) ( not ( = ?auto_1526161 ?auto_1526166 ) ) ( not ( = ?auto_1526161 ?auto_1526167 ) ) ( not ( = ?auto_1526161 ?auto_1526174 ) ) ( not ( = ?auto_1526161 ?auto_1526172 ) ) ( not ( = ?auto_1526162 ?auto_1526164 ) ) ( not ( = ?auto_1526162 ?auto_1526163 ) ) ( not ( = ?auto_1526162 ?auto_1526165 ) ) ( not ( = ?auto_1526162 ?auto_1526166 ) ) ( not ( = ?auto_1526162 ?auto_1526167 ) ) ( not ( = ?auto_1526162 ?auto_1526174 ) ) ( not ( = ?auto_1526162 ?auto_1526172 ) ) ( not ( = ?auto_1526164 ?auto_1526163 ) ) ( not ( = ?auto_1526164 ?auto_1526165 ) ) ( not ( = ?auto_1526164 ?auto_1526166 ) ) ( not ( = ?auto_1526164 ?auto_1526167 ) ) ( not ( = ?auto_1526164 ?auto_1526174 ) ) ( not ( = ?auto_1526164 ?auto_1526172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526165 ?auto_1526166 ?auto_1526167 )
      ( MAKE-7CRATE-VERIFY ?auto_1526160 ?auto_1526161 ?auto_1526162 ?auto_1526164 ?auto_1526163 ?auto_1526165 ?auto_1526166 ?auto_1526167 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1526175 - SURFACE
      ?auto_1526176 - SURFACE
      ?auto_1526177 - SURFACE
      ?auto_1526179 - SURFACE
      ?auto_1526178 - SURFACE
      ?auto_1526180 - SURFACE
      ?auto_1526181 - SURFACE
      ?auto_1526182 - SURFACE
      ?auto_1526183 - SURFACE
    )
    :vars
    (
      ?auto_1526185 - HOIST
      ?auto_1526184 - PLACE
      ?auto_1526187 - PLACE
      ?auto_1526189 - HOIST
      ?auto_1526190 - SURFACE
      ?auto_1526188 - SURFACE
      ?auto_1526186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526185 ?auto_1526184 ) ( IS-CRATE ?auto_1526183 ) ( not ( = ?auto_1526182 ?auto_1526183 ) ) ( not ( = ?auto_1526181 ?auto_1526182 ) ) ( not ( = ?auto_1526181 ?auto_1526183 ) ) ( not ( = ?auto_1526187 ?auto_1526184 ) ) ( HOIST-AT ?auto_1526189 ?auto_1526187 ) ( not ( = ?auto_1526185 ?auto_1526189 ) ) ( SURFACE-AT ?auto_1526183 ?auto_1526187 ) ( ON ?auto_1526183 ?auto_1526190 ) ( CLEAR ?auto_1526183 ) ( not ( = ?auto_1526182 ?auto_1526190 ) ) ( not ( = ?auto_1526183 ?auto_1526190 ) ) ( not ( = ?auto_1526181 ?auto_1526190 ) ) ( IS-CRATE ?auto_1526182 ) ( AVAILABLE ?auto_1526189 ) ( SURFACE-AT ?auto_1526182 ?auto_1526187 ) ( ON ?auto_1526182 ?auto_1526188 ) ( CLEAR ?auto_1526182 ) ( not ( = ?auto_1526182 ?auto_1526188 ) ) ( not ( = ?auto_1526183 ?auto_1526188 ) ) ( not ( = ?auto_1526181 ?auto_1526188 ) ) ( not ( = ?auto_1526190 ?auto_1526188 ) ) ( TRUCK-AT ?auto_1526186 ?auto_1526184 ) ( SURFACE-AT ?auto_1526180 ?auto_1526184 ) ( CLEAR ?auto_1526180 ) ( LIFTING ?auto_1526185 ?auto_1526181 ) ( IS-CRATE ?auto_1526181 ) ( not ( = ?auto_1526180 ?auto_1526181 ) ) ( not ( = ?auto_1526182 ?auto_1526180 ) ) ( not ( = ?auto_1526183 ?auto_1526180 ) ) ( not ( = ?auto_1526190 ?auto_1526180 ) ) ( not ( = ?auto_1526188 ?auto_1526180 ) ) ( ON ?auto_1526176 ?auto_1526175 ) ( ON ?auto_1526177 ?auto_1526176 ) ( ON ?auto_1526179 ?auto_1526177 ) ( ON ?auto_1526178 ?auto_1526179 ) ( ON ?auto_1526180 ?auto_1526178 ) ( not ( = ?auto_1526175 ?auto_1526176 ) ) ( not ( = ?auto_1526175 ?auto_1526177 ) ) ( not ( = ?auto_1526175 ?auto_1526179 ) ) ( not ( = ?auto_1526175 ?auto_1526178 ) ) ( not ( = ?auto_1526175 ?auto_1526180 ) ) ( not ( = ?auto_1526175 ?auto_1526181 ) ) ( not ( = ?auto_1526175 ?auto_1526182 ) ) ( not ( = ?auto_1526175 ?auto_1526183 ) ) ( not ( = ?auto_1526175 ?auto_1526190 ) ) ( not ( = ?auto_1526175 ?auto_1526188 ) ) ( not ( = ?auto_1526176 ?auto_1526177 ) ) ( not ( = ?auto_1526176 ?auto_1526179 ) ) ( not ( = ?auto_1526176 ?auto_1526178 ) ) ( not ( = ?auto_1526176 ?auto_1526180 ) ) ( not ( = ?auto_1526176 ?auto_1526181 ) ) ( not ( = ?auto_1526176 ?auto_1526182 ) ) ( not ( = ?auto_1526176 ?auto_1526183 ) ) ( not ( = ?auto_1526176 ?auto_1526190 ) ) ( not ( = ?auto_1526176 ?auto_1526188 ) ) ( not ( = ?auto_1526177 ?auto_1526179 ) ) ( not ( = ?auto_1526177 ?auto_1526178 ) ) ( not ( = ?auto_1526177 ?auto_1526180 ) ) ( not ( = ?auto_1526177 ?auto_1526181 ) ) ( not ( = ?auto_1526177 ?auto_1526182 ) ) ( not ( = ?auto_1526177 ?auto_1526183 ) ) ( not ( = ?auto_1526177 ?auto_1526190 ) ) ( not ( = ?auto_1526177 ?auto_1526188 ) ) ( not ( = ?auto_1526179 ?auto_1526178 ) ) ( not ( = ?auto_1526179 ?auto_1526180 ) ) ( not ( = ?auto_1526179 ?auto_1526181 ) ) ( not ( = ?auto_1526179 ?auto_1526182 ) ) ( not ( = ?auto_1526179 ?auto_1526183 ) ) ( not ( = ?auto_1526179 ?auto_1526190 ) ) ( not ( = ?auto_1526179 ?auto_1526188 ) ) ( not ( = ?auto_1526178 ?auto_1526180 ) ) ( not ( = ?auto_1526178 ?auto_1526181 ) ) ( not ( = ?auto_1526178 ?auto_1526182 ) ) ( not ( = ?auto_1526178 ?auto_1526183 ) ) ( not ( = ?auto_1526178 ?auto_1526190 ) ) ( not ( = ?auto_1526178 ?auto_1526188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526181 ?auto_1526182 ?auto_1526183 )
      ( MAKE-8CRATE-VERIFY ?auto_1526175 ?auto_1526176 ?auto_1526177 ?auto_1526179 ?auto_1526178 ?auto_1526180 ?auto_1526181 ?auto_1526182 ?auto_1526183 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526191 - SURFACE
      ?auto_1526192 - SURFACE
      ?auto_1526193 - SURFACE
      ?auto_1526195 - SURFACE
      ?auto_1526194 - SURFACE
      ?auto_1526196 - SURFACE
      ?auto_1526197 - SURFACE
      ?auto_1526198 - SURFACE
      ?auto_1526199 - SURFACE
      ?auto_1526200 - SURFACE
    )
    :vars
    (
      ?auto_1526202 - HOIST
      ?auto_1526201 - PLACE
      ?auto_1526204 - PLACE
      ?auto_1526206 - HOIST
      ?auto_1526207 - SURFACE
      ?auto_1526205 - SURFACE
      ?auto_1526203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526202 ?auto_1526201 ) ( IS-CRATE ?auto_1526200 ) ( not ( = ?auto_1526199 ?auto_1526200 ) ) ( not ( = ?auto_1526198 ?auto_1526199 ) ) ( not ( = ?auto_1526198 ?auto_1526200 ) ) ( not ( = ?auto_1526204 ?auto_1526201 ) ) ( HOIST-AT ?auto_1526206 ?auto_1526204 ) ( not ( = ?auto_1526202 ?auto_1526206 ) ) ( SURFACE-AT ?auto_1526200 ?auto_1526204 ) ( ON ?auto_1526200 ?auto_1526207 ) ( CLEAR ?auto_1526200 ) ( not ( = ?auto_1526199 ?auto_1526207 ) ) ( not ( = ?auto_1526200 ?auto_1526207 ) ) ( not ( = ?auto_1526198 ?auto_1526207 ) ) ( IS-CRATE ?auto_1526199 ) ( AVAILABLE ?auto_1526206 ) ( SURFACE-AT ?auto_1526199 ?auto_1526204 ) ( ON ?auto_1526199 ?auto_1526205 ) ( CLEAR ?auto_1526199 ) ( not ( = ?auto_1526199 ?auto_1526205 ) ) ( not ( = ?auto_1526200 ?auto_1526205 ) ) ( not ( = ?auto_1526198 ?auto_1526205 ) ) ( not ( = ?auto_1526207 ?auto_1526205 ) ) ( TRUCK-AT ?auto_1526203 ?auto_1526201 ) ( SURFACE-AT ?auto_1526197 ?auto_1526201 ) ( CLEAR ?auto_1526197 ) ( LIFTING ?auto_1526202 ?auto_1526198 ) ( IS-CRATE ?auto_1526198 ) ( not ( = ?auto_1526197 ?auto_1526198 ) ) ( not ( = ?auto_1526199 ?auto_1526197 ) ) ( not ( = ?auto_1526200 ?auto_1526197 ) ) ( not ( = ?auto_1526207 ?auto_1526197 ) ) ( not ( = ?auto_1526205 ?auto_1526197 ) ) ( ON ?auto_1526192 ?auto_1526191 ) ( ON ?auto_1526193 ?auto_1526192 ) ( ON ?auto_1526195 ?auto_1526193 ) ( ON ?auto_1526194 ?auto_1526195 ) ( ON ?auto_1526196 ?auto_1526194 ) ( ON ?auto_1526197 ?auto_1526196 ) ( not ( = ?auto_1526191 ?auto_1526192 ) ) ( not ( = ?auto_1526191 ?auto_1526193 ) ) ( not ( = ?auto_1526191 ?auto_1526195 ) ) ( not ( = ?auto_1526191 ?auto_1526194 ) ) ( not ( = ?auto_1526191 ?auto_1526196 ) ) ( not ( = ?auto_1526191 ?auto_1526197 ) ) ( not ( = ?auto_1526191 ?auto_1526198 ) ) ( not ( = ?auto_1526191 ?auto_1526199 ) ) ( not ( = ?auto_1526191 ?auto_1526200 ) ) ( not ( = ?auto_1526191 ?auto_1526207 ) ) ( not ( = ?auto_1526191 ?auto_1526205 ) ) ( not ( = ?auto_1526192 ?auto_1526193 ) ) ( not ( = ?auto_1526192 ?auto_1526195 ) ) ( not ( = ?auto_1526192 ?auto_1526194 ) ) ( not ( = ?auto_1526192 ?auto_1526196 ) ) ( not ( = ?auto_1526192 ?auto_1526197 ) ) ( not ( = ?auto_1526192 ?auto_1526198 ) ) ( not ( = ?auto_1526192 ?auto_1526199 ) ) ( not ( = ?auto_1526192 ?auto_1526200 ) ) ( not ( = ?auto_1526192 ?auto_1526207 ) ) ( not ( = ?auto_1526192 ?auto_1526205 ) ) ( not ( = ?auto_1526193 ?auto_1526195 ) ) ( not ( = ?auto_1526193 ?auto_1526194 ) ) ( not ( = ?auto_1526193 ?auto_1526196 ) ) ( not ( = ?auto_1526193 ?auto_1526197 ) ) ( not ( = ?auto_1526193 ?auto_1526198 ) ) ( not ( = ?auto_1526193 ?auto_1526199 ) ) ( not ( = ?auto_1526193 ?auto_1526200 ) ) ( not ( = ?auto_1526193 ?auto_1526207 ) ) ( not ( = ?auto_1526193 ?auto_1526205 ) ) ( not ( = ?auto_1526195 ?auto_1526194 ) ) ( not ( = ?auto_1526195 ?auto_1526196 ) ) ( not ( = ?auto_1526195 ?auto_1526197 ) ) ( not ( = ?auto_1526195 ?auto_1526198 ) ) ( not ( = ?auto_1526195 ?auto_1526199 ) ) ( not ( = ?auto_1526195 ?auto_1526200 ) ) ( not ( = ?auto_1526195 ?auto_1526207 ) ) ( not ( = ?auto_1526195 ?auto_1526205 ) ) ( not ( = ?auto_1526194 ?auto_1526196 ) ) ( not ( = ?auto_1526194 ?auto_1526197 ) ) ( not ( = ?auto_1526194 ?auto_1526198 ) ) ( not ( = ?auto_1526194 ?auto_1526199 ) ) ( not ( = ?auto_1526194 ?auto_1526200 ) ) ( not ( = ?auto_1526194 ?auto_1526207 ) ) ( not ( = ?auto_1526194 ?auto_1526205 ) ) ( not ( = ?auto_1526196 ?auto_1526197 ) ) ( not ( = ?auto_1526196 ?auto_1526198 ) ) ( not ( = ?auto_1526196 ?auto_1526199 ) ) ( not ( = ?auto_1526196 ?auto_1526200 ) ) ( not ( = ?auto_1526196 ?auto_1526207 ) ) ( not ( = ?auto_1526196 ?auto_1526205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526198 ?auto_1526199 ?auto_1526200 )
      ( MAKE-9CRATE-VERIFY ?auto_1526191 ?auto_1526192 ?auto_1526193 ?auto_1526195 ?auto_1526194 ?auto_1526196 ?auto_1526197 ?auto_1526198 ?auto_1526199 ?auto_1526200 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531098 - SURFACE
      ?auto_1531099 - SURFACE
      ?auto_1531100 - SURFACE
      ?auto_1531102 - SURFACE
      ?auto_1531101 - SURFACE
      ?auto_1531103 - SURFACE
      ?auto_1531104 - SURFACE
      ?auto_1531105 - SURFACE
      ?auto_1531106 - SURFACE
      ?auto_1531107 - SURFACE
      ?auto_1531108 - SURFACE
    )
    :vars
    (
      ?auto_1531110 - HOIST
      ?auto_1531109 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531110 ?auto_1531109 ) ( SURFACE-AT ?auto_1531107 ?auto_1531109 ) ( CLEAR ?auto_1531107 ) ( LIFTING ?auto_1531110 ?auto_1531108 ) ( IS-CRATE ?auto_1531108 ) ( not ( = ?auto_1531107 ?auto_1531108 ) ) ( ON ?auto_1531099 ?auto_1531098 ) ( ON ?auto_1531100 ?auto_1531099 ) ( ON ?auto_1531102 ?auto_1531100 ) ( ON ?auto_1531101 ?auto_1531102 ) ( ON ?auto_1531103 ?auto_1531101 ) ( ON ?auto_1531104 ?auto_1531103 ) ( ON ?auto_1531105 ?auto_1531104 ) ( ON ?auto_1531106 ?auto_1531105 ) ( ON ?auto_1531107 ?auto_1531106 ) ( not ( = ?auto_1531098 ?auto_1531099 ) ) ( not ( = ?auto_1531098 ?auto_1531100 ) ) ( not ( = ?auto_1531098 ?auto_1531102 ) ) ( not ( = ?auto_1531098 ?auto_1531101 ) ) ( not ( = ?auto_1531098 ?auto_1531103 ) ) ( not ( = ?auto_1531098 ?auto_1531104 ) ) ( not ( = ?auto_1531098 ?auto_1531105 ) ) ( not ( = ?auto_1531098 ?auto_1531106 ) ) ( not ( = ?auto_1531098 ?auto_1531107 ) ) ( not ( = ?auto_1531098 ?auto_1531108 ) ) ( not ( = ?auto_1531099 ?auto_1531100 ) ) ( not ( = ?auto_1531099 ?auto_1531102 ) ) ( not ( = ?auto_1531099 ?auto_1531101 ) ) ( not ( = ?auto_1531099 ?auto_1531103 ) ) ( not ( = ?auto_1531099 ?auto_1531104 ) ) ( not ( = ?auto_1531099 ?auto_1531105 ) ) ( not ( = ?auto_1531099 ?auto_1531106 ) ) ( not ( = ?auto_1531099 ?auto_1531107 ) ) ( not ( = ?auto_1531099 ?auto_1531108 ) ) ( not ( = ?auto_1531100 ?auto_1531102 ) ) ( not ( = ?auto_1531100 ?auto_1531101 ) ) ( not ( = ?auto_1531100 ?auto_1531103 ) ) ( not ( = ?auto_1531100 ?auto_1531104 ) ) ( not ( = ?auto_1531100 ?auto_1531105 ) ) ( not ( = ?auto_1531100 ?auto_1531106 ) ) ( not ( = ?auto_1531100 ?auto_1531107 ) ) ( not ( = ?auto_1531100 ?auto_1531108 ) ) ( not ( = ?auto_1531102 ?auto_1531101 ) ) ( not ( = ?auto_1531102 ?auto_1531103 ) ) ( not ( = ?auto_1531102 ?auto_1531104 ) ) ( not ( = ?auto_1531102 ?auto_1531105 ) ) ( not ( = ?auto_1531102 ?auto_1531106 ) ) ( not ( = ?auto_1531102 ?auto_1531107 ) ) ( not ( = ?auto_1531102 ?auto_1531108 ) ) ( not ( = ?auto_1531101 ?auto_1531103 ) ) ( not ( = ?auto_1531101 ?auto_1531104 ) ) ( not ( = ?auto_1531101 ?auto_1531105 ) ) ( not ( = ?auto_1531101 ?auto_1531106 ) ) ( not ( = ?auto_1531101 ?auto_1531107 ) ) ( not ( = ?auto_1531101 ?auto_1531108 ) ) ( not ( = ?auto_1531103 ?auto_1531104 ) ) ( not ( = ?auto_1531103 ?auto_1531105 ) ) ( not ( = ?auto_1531103 ?auto_1531106 ) ) ( not ( = ?auto_1531103 ?auto_1531107 ) ) ( not ( = ?auto_1531103 ?auto_1531108 ) ) ( not ( = ?auto_1531104 ?auto_1531105 ) ) ( not ( = ?auto_1531104 ?auto_1531106 ) ) ( not ( = ?auto_1531104 ?auto_1531107 ) ) ( not ( = ?auto_1531104 ?auto_1531108 ) ) ( not ( = ?auto_1531105 ?auto_1531106 ) ) ( not ( = ?auto_1531105 ?auto_1531107 ) ) ( not ( = ?auto_1531105 ?auto_1531108 ) ) ( not ( = ?auto_1531106 ?auto_1531107 ) ) ( not ( = ?auto_1531106 ?auto_1531108 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1531107 ?auto_1531108 )
      ( MAKE-10CRATE-VERIFY ?auto_1531098 ?auto_1531099 ?auto_1531100 ?auto_1531102 ?auto_1531101 ?auto_1531103 ?auto_1531104 ?auto_1531105 ?auto_1531106 ?auto_1531107 ?auto_1531108 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531192 - SURFACE
      ?auto_1531193 - SURFACE
      ?auto_1531194 - SURFACE
      ?auto_1531196 - SURFACE
      ?auto_1531195 - SURFACE
      ?auto_1531197 - SURFACE
      ?auto_1531198 - SURFACE
      ?auto_1531199 - SURFACE
      ?auto_1531200 - SURFACE
      ?auto_1531201 - SURFACE
      ?auto_1531202 - SURFACE
    )
    :vars
    (
      ?auto_1531205 - HOIST
      ?auto_1531204 - PLACE
      ?auto_1531203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531205 ?auto_1531204 ) ( SURFACE-AT ?auto_1531201 ?auto_1531204 ) ( CLEAR ?auto_1531201 ) ( IS-CRATE ?auto_1531202 ) ( not ( = ?auto_1531201 ?auto_1531202 ) ) ( TRUCK-AT ?auto_1531203 ?auto_1531204 ) ( AVAILABLE ?auto_1531205 ) ( IN ?auto_1531202 ?auto_1531203 ) ( ON ?auto_1531201 ?auto_1531200 ) ( not ( = ?auto_1531200 ?auto_1531201 ) ) ( not ( = ?auto_1531200 ?auto_1531202 ) ) ( ON ?auto_1531193 ?auto_1531192 ) ( ON ?auto_1531194 ?auto_1531193 ) ( ON ?auto_1531196 ?auto_1531194 ) ( ON ?auto_1531195 ?auto_1531196 ) ( ON ?auto_1531197 ?auto_1531195 ) ( ON ?auto_1531198 ?auto_1531197 ) ( ON ?auto_1531199 ?auto_1531198 ) ( ON ?auto_1531200 ?auto_1531199 ) ( not ( = ?auto_1531192 ?auto_1531193 ) ) ( not ( = ?auto_1531192 ?auto_1531194 ) ) ( not ( = ?auto_1531192 ?auto_1531196 ) ) ( not ( = ?auto_1531192 ?auto_1531195 ) ) ( not ( = ?auto_1531192 ?auto_1531197 ) ) ( not ( = ?auto_1531192 ?auto_1531198 ) ) ( not ( = ?auto_1531192 ?auto_1531199 ) ) ( not ( = ?auto_1531192 ?auto_1531200 ) ) ( not ( = ?auto_1531192 ?auto_1531201 ) ) ( not ( = ?auto_1531192 ?auto_1531202 ) ) ( not ( = ?auto_1531193 ?auto_1531194 ) ) ( not ( = ?auto_1531193 ?auto_1531196 ) ) ( not ( = ?auto_1531193 ?auto_1531195 ) ) ( not ( = ?auto_1531193 ?auto_1531197 ) ) ( not ( = ?auto_1531193 ?auto_1531198 ) ) ( not ( = ?auto_1531193 ?auto_1531199 ) ) ( not ( = ?auto_1531193 ?auto_1531200 ) ) ( not ( = ?auto_1531193 ?auto_1531201 ) ) ( not ( = ?auto_1531193 ?auto_1531202 ) ) ( not ( = ?auto_1531194 ?auto_1531196 ) ) ( not ( = ?auto_1531194 ?auto_1531195 ) ) ( not ( = ?auto_1531194 ?auto_1531197 ) ) ( not ( = ?auto_1531194 ?auto_1531198 ) ) ( not ( = ?auto_1531194 ?auto_1531199 ) ) ( not ( = ?auto_1531194 ?auto_1531200 ) ) ( not ( = ?auto_1531194 ?auto_1531201 ) ) ( not ( = ?auto_1531194 ?auto_1531202 ) ) ( not ( = ?auto_1531196 ?auto_1531195 ) ) ( not ( = ?auto_1531196 ?auto_1531197 ) ) ( not ( = ?auto_1531196 ?auto_1531198 ) ) ( not ( = ?auto_1531196 ?auto_1531199 ) ) ( not ( = ?auto_1531196 ?auto_1531200 ) ) ( not ( = ?auto_1531196 ?auto_1531201 ) ) ( not ( = ?auto_1531196 ?auto_1531202 ) ) ( not ( = ?auto_1531195 ?auto_1531197 ) ) ( not ( = ?auto_1531195 ?auto_1531198 ) ) ( not ( = ?auto_1531195 ?auto_1531199 ) ) ( not ( = ?auto_1531195 ?auto_1531200 ) ) ( not ( = ?auto_1531195 ?auto_1531201 ) ) ( not ( = ?auto_1531195 ?auto_1531202 ) ) ( not ( = ?auto_1531197 ?auto_1531198 ) ) ( not ( = ?auto_1531197 ?auto_1531199 ) ) ( not ( = ?auto_1531197 ?auto_1531200 ) ) ( not ( = ?auto_1531197 ?auto_1531201 ) ) ( not ( = ?auto_1531197 ?auto_1531202 ) ) ( not ( = ?auto_1531198 ?auto_1531199 ) ) ( not ( = ?auto_1531198 ?auto_1531200 ) ) ( not ( = ?auto_1531198 ?auto_1531201 ) ) ( not ( = ?auto_1531198 ?auto_1531202 ) ) ( not ( = ?auto_1531199 ?auto_1531200 ) ) ( not ( = ?auto_1531199 ?auto_1531201 ) ) ( not ( = ?auto_1531199 ?auto_1531202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531200 ?auto_1531201 ?auto_1531202 )
      ( MAKE-10CRATE-VERIFY ?auto_1531192 ?auto_1531193 ?auto_1531194 ?auto_1531196 ?auto_1531195 ?auto_1531197 ?auto_1531198 ?auto_1531199 ?auto_1531200 ?auto_1531201 ?auto_1531202 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531297 - SURFACE
      ?auto_1531298 - SURFACE
      ?auto_1531299 - SURFACE
      ?auto_1531301 - SURFACE
      ?auto_1531300 - SURFACE
      ?auto_1531302 - SURFACE
      ?auto_1531303 - SURFACE
      ?auto_1531304 - SURFACE
      ?auto_1531305 - SURFACE
      ?auto_1531306 - SURFACE
      ?auto_1531307 - SURFACE
    )
    :vars
    (
      ?auto_1531310 - HOIST
      ?auto_1531308 - PLACE
      ?auto_1531311 - TRUCK
      ?auto_1531309 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531310 ?auto_1531308 ) ( SURFACE-AT ?auto_1531306 ?auto_1531308 ) ( CLEAR ?auto_1531306 ) ( IS-CRATE ?auto_1531307 ) ( not ( = ?auto_1531306 ?auto_1531307 ) ) ( AVAILABLE ?auto_1531310 ) ( IN ?auto_1531307 ?auto_1531311 ) ( ON ?auto_1531306 ?auto_1531305 ) ( not ( = ?auto_1531305 ?auto_1531306 ) ) ( not ( = ?auto_1531305 ?auto_1531307 ) ) ( TRUCK-AT ?auto_1531311 ?auto_1531309 ) ( not ( = ?auto_1531309 ?auto_1531308 ) ) ( ON ?auto_1531298 ?auto_1531297 ) ( ON ?auto_1531299 ?auto_1531298 ) ( ON ?auto_1531301 ?auto_1531299 ) ( ON ?auto_1531300 ?auto_1531301 ) ( ON ?auto_1531302 ?auto_1531300 ) ( ON ?auto_1531303 ?auto_1531302 ) ( ON ?auto_1531304 ?auto_1531303 ) ( ON ?auto_1531305 ?auto_1531304 ) ( not ( = ?auto_1531297 ?auto_1531298 ) ) ( not ( = ?auto_1531297 ?auto_1531299 ) ) ( not ( = ?auto_1531297 ?auto_1531301 ) ) ( not ( = ?auto_1531297 ?auto_1531300 ) ) ( not ( = ?auto_1531297 ?auto_1531302 ) ) ( not ( = ?auto_1531297 ?auto_1531303 ) ) ( not ( = ?auto_1531297 ?auto_1531304 ) ) ( not ( = ?auto_1531297 ?auto_1531305 ) ) ( not ( = ?auto_1531297 ?auto_1531306 ) ) ( not ( = ?auto_1531297 ?auto_1531307 ) ) ( not ( = ?auto_1531298 ?auto_1531299 ) ) ( not ( = ?auto_1531298 ?auto_1531301 ) ) ( not ( = ?auto_1531298 ?auto_1531300 ) ) ( not ( = ?auto_1531298 ?auto_1531302 ) ) ( not ( = ?auto_1531298 ?auto_1531303 ) ) ( not ( = ?auto_1531298 ?auto_1531304 ) ) ( not ( = ?auto_1531298 ?auto_1531305 ) ) ( not ( = ?auto_1531298 ?auto_1531306 ) ) ( not ( = ?auto_1531298 ?auto_1531307 ) ) ( not ( = ?auto_1531299 ?auto_1531301 ) ) ( not ( = ?auto_1531299 ?auto_1531300 ) ) ( not ( = ?auto_1531299 ?auto_1531302 ) ) ( not ( = ?auto_1531299 ?auto_1531303 ) ) ( not ( = ?auto_1531299 ?auto_1531304 ) ) ( not ( = ?auto_1531299 ?auto_1531305 ) ) ( not ( = ?auto_1531299 ?auto_1531306 ) ) ( not ( = ?auto_1531299 ?auto_1531307 ) ) ( not ( = ?auto_1531301 ?auto_1531300 ) ) ( not ( = ?auto_1531301 ?auto_1531302 ) ) ( not ( = ?auto_1531301 ?auto_1531303 ) ) ( not ( = ?auto_1531301 ?auto_1531304 ) ) ( not ( = ?auto_1531301 ?auto_1531305 ) ) ( not ( = ?auto_1531301 ?auto_1531306 ) ) ( not ( = ?auto_1531301 ?auto_1531307 ) ) ( not ( = ?auto_1531300 ?auto_1531302 ) ) ( not ( = ?auto_1531300 ?auto_1531303 ) ) ( not ( = ?auto_1531300 ?auto_1531304 ) ) ( not ( = ?auto_1531300 ?auto_1531305 ) ) ( not ( = ?auto_1531300 ?auto_1531306 ) ) ( not ( = ?auto_1531300 ?auto_1531307 ) ) ( not ( = ?auto_1531302 ?auto_1531303 ) ) ( not ( = ?auto_1531302 ?auto_1531304 ) ) ( not ( = ?auto_1531302 ?auto_1531305 ) ) ( not ( = ?auto_1531302 ?auto_1531306 ) ) ( not ( = ?auto_1531302 ?auto_1531307 ) ) ( not ( = ?auto_1531303 ?auto_1531304 ) ) ( not ( = ?auto_1531303 ?auto_1531305 ) ) ( not ( = ?auto_1531303 ?auto_1531306 ) ) ( not ( = ?auto_1531303 ?auto_1531307 ) ) ( not ( = ?auto_1531304 ?auto_1531305 ) ) ( not ( = ?auto_1531304 ?auto_1531306 ) ) ( not ( = ?auto_1531304 ?auto_1531307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531305 ?auto_1531306 ?auto_1531307 )
      ( MAKE-10CRATE-VERIFY ?auto_1531297 ?auto_1531298 ?auto_1531299 ?auto_1531301 ?auto_1531300 ?auto_1531302 ?auto_1531303 ?auto_1531304 ?auto_1531305 ?auto_1531306 ?auto_1531307 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531412 - SURFACE
      ?auto_1531413 - SURFACE
      ?auto_1531414 - SURFACE
      ?auto_1531416 - SURFACE
      ?auto_1531415 - SURFACE
      ?auto_1531417 - SURFACE
      ?auto_1531418 - SURFACE
      ?auto_1531419 - SURFACE
      ?auto_1531420 - SURFACE
      ?auto_1531421 - SURFACE
      ?auto_1531422 - SURFACE
    )
    :vars
    (
      ?auto_1531424 - HOIST
      ?auto_1531423 - PLACE
      ?auto_1531427 - TRUCK
      ?auto_1531426 - PLACE
      ?auto_1531425 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531424 ?auto_1531423 ) ( SURFACE-AT ?auto_1531421 ?auto_1531423 ) ( CLEAR ?auto_1531421 ) ( IS-CRATE ?auto_1531422 ) ( not ( = ?auto_1531421 ?auto_1531422 ) ) ( AVAILABLE ?auto_1531424 ) ( ON ?auto_1531421 ?auto_1531420 ) ( not ( = ?auto_1531420 ?auto_1531421 ) ) ( not ( = ?auto_1531420 ?auto_1531422 ) ) ( TRUCK-AT ?auto_1531427 ?auto_1531426 ) ( not ( = ?auto_1531426 ?auto_1531423 ) ) ( HOIST-AT ?auto_1531425 ?auto_1531426 ) ( LIFTING ?auto_1531425 ?auto_1531422 ) ( not ( = ?auto_1531424 ?auto_1531425 ) ) ( ON ?auto_1531413 ?auto_1531412 ) ( ON ?auto_1531414 ?auto_1531413 ) ( ON ?auto_1531416 ?auto_1531414 ) ( ON ?auto_1531415 ?auto_1531416 ) ( ON ?auto_1531417 ?auto_1531415 ) ( ON ?auto_1531418 ?auto_1531417 ) ( ON ?auto_1531419 ?auto_1531418 ) ( ON ?auto_1531420 ?auto_1531419 ) ( not ( = ?auto_1531412 ?auto_1531413 ) ) ( not ( = ?auto_1531412 ?auto_1531414 ) ) ( not ( = ?auto_1531412 ?auto_1531416 ) ) ( not ( = ?auto_1531412 ?auto_1531415 ) ) ( not ( = ?auto_1531412 ?auto_1531417 ) ) ( not ( = ?auto_1531412 ?auto_1531418 ) ) ( not ( = ?auto_1531412 ?auto_1531419 ) ) ( not ( = ?auto_1531412 ?auto_1531420 ) ) ( not ( = ?auto_1531412 ?auto_1531421 ) ) ( not ( = ?auto_1531412 ?auto_1531422 ) ) ( not ( = ?auto_1531413 ?auto_1531414 ) ) ( not ( = ?auto_1531413 ?auto_1531416 ) ) ( not ( = ?auto_1531413 ?auto_1531415 ) ) ( not ( = ?auto_1531413 ?auto_1531417 ) ) ( not ( = ?auto_1531413 ?auto_1531418 ) ) ( not ( = ?auto_1531413 ?auto_1531419 ) ) ( not ( = ?auto_1531413 ?auto_1531420 ) ) ( not ( = ?auto_1531413 ?auto_1531421 ) ) ( not ( = ?auto_1531413 ?auto_1531422 ) ) ( not ( = ?auto_1531414 ?auto_1531416 ) ) ( not ( = ?auto_1531414 ?auto_1531415 ) ) ( not ( = ?auto_1531414 ?auto_1531417 ) ) ( not ( = ?auto_1531414 ?auto_1531418 ) ) ( not ( = ?auto_1531414 ?auto_1531419 ) ) ( not ( = ?auto_1531414 ?auto_1531420 ) ) ( not ( = ?auto_1531414 ?auto_1531421 ) ) ( not ( = ?auto_1531414 ?auto_1531422 ) ) ( not ( = ?auto_1531416 ?auto_1531415 ) ) ( not ( = ?auto_1531416 ?auto_1531417 ) ) ( not ( = ?auto_1531416 ?auto_1531418 ) ) ( not ( = ?auto_1531416 ?auto_1531419 ) ) ( not ( = ?auto_1531416 ?auto_1531420 ) ) ( not ( = ?auto_1531416 ?auto_1531421 ) ) ( not ( = ?auto_1531416 ?auto_1531422 ) ) ( not ( = ?auto_1531415 ?auto_1531417 ) ) ( not ( = ?auto_1531415 ?auto_1531418 ) ) ( not ( = ?auto_1531415 ?auto_1531419 ) ) ( not ( = ?auto_1531415 ?auto_1531420 ) ) ( not ( = ?auto_1531415 ?auto_1531421 ) ) ( not ( = ?auto_1531415 ?auto_1531422 ) ) ( not ( = ?auto_1531417 ?auto_1531418 ) ) ( not ( = ?auto_1531417 ?auto_1531419 ) ) ( not ( = ?auto_1531417 ?auto_1531420 ) ) ( not ( = ?auto_1531417 ?auto_1531421 ) ) ( not ( = ?auto_1531417 ?auto_1531422 ) ) ( not ( = ?auto_1531418 ?auto_1531419 ) ) ( not ( = ?auto_1531418 ?auto_1531420 ) ) ( not ( = ?auto_1531418 ?auto_1531421 ) ) ( not ( = ?auto_1531418 ?auto_1531422 ) ) ( not ( = ?auto_1531419 ?auto_1531420 ) ) ( not ( = ?auto_1531419 ?auto_1531421 ) ) ( not ( = ?auto_1531419 ?auto_1531422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531420 ?auto_1531421 ?auto_1531422 )
      ( MAKE-10CRATE-VERIFY ?auto_1531412 ?auto_1531413 ?auto_1531414 ?auto_1531416 ?auto_1531415 ?auto_1531417 ?auto_1531418 ?auto_1531419 ?auto_1531420 ?auto_1531421 ?auto_1531422 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531537 - SURFACE
      ?auto_1531538 - SURFACE
      ?auto_1531539 - SURFACE
      ?auto_1531541 - SURFACE
      ?auto_1531540 - SURFACE
      ?auto_1531542 - SURFACE
      ?auto_1531543 - SURFACE
      ?auto_1531544 - SURFACE
      ?auto_1531545 - SURFACE
      ?auto_1531546 - SURFACE
      ?auto_1531547 - SURFACE
    )
    :vars
    (
      ?auto_1531551 - HOIST
      ?auto_1531550 - PLACE
      ?auto_1531548 - TRUCK
      ?auto_1531552 - PLACE
      ?auto_1531553 - HOIST
      ?auto_1531549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531551 ?auto_1531550 ) ( SURFACE-AT ?auto_1531546 ?auto_1531550 ) ( CLEAR ?auto_1531546 ) ( IS-CRATE ?auto_1531547 ) ( not ( = ?auto_1531546 ?auto_1531547 ) ) ( AVAILABLE ?auto_1531551 ) ( ON ?auto_1531546 ?auto_1531545 ) ( not ( = ?auto_1531545 ?auto_1531546 ) ) ( not ( = ?auto_1531545 ?auto_1531547 ) ) ( TRUCK-AT ?auto_1531548 ?auto_1531552 ) ( not ( = ?auto_1531552 ?auto_1531550 ) ) ( HOIST-AT ?auto_1531553 ?auto_1531552 ) ( not ( = ?auto_1531551 ?auto_1531553 ) ) ( AVAILABLE ?auto_1531553 ) ( SURFACE-AT ?auto_1531547 ?auto_1531552 ) ( ON ?auto_1531547 ?auto_1531549 ) ( CLEAR ?auto_1531547 ) ( not ( = ?auto_1531546 ?auto_1531549 ) ) ( not ( = ?auto_1531547 ?auto_1531549 ) ) ( not ( = ?auto_1531545 ?auto_1531549 ) ) ( ON ?auto_1531538 ?auto_1531537 ) ( ON ?auto_1531539 ?auto_1531538 ) ( ON ?auto_1531541 ?auto_1531539 ) ( ON ?auto_1531540 ?auto_1531541 ) ( ON ?auto_1531542 ?auto_1531540 ) ( ON ?auto_1531543 ?auto_1531542 ) ( ON ?auto_1531544 ?auto_1531543 ) ( ON ?auto_1531545 ?auto_1531544 ) ( not ( = ?auto_1531537 ?auto_1531538 ) ) ( not ( = ?auto_1531537 ?auto_1531539 ) ) ( not ( = ?auto_1531537 ?auto_1531541 ) ) ( not ( = ?auto_1531537 ?auto_1531540 ) ) ( not ( = ?auto_1531537 ?auto_1531542 ) ) ( not ( = ?auto_1531537 ?auto_1531543 ) ) ( not ( = ?auto_1531537 ?auto_1531544 ) ) ( not ( = ?auto_1531537 ?auto_1531545 ) ) ( not ( = ?auto_1531537 ?auto_1531546 ) ) ( not ( = ?auto_1531537 ?auto_1531547 ) ) ( not ( = ?auto_1531537 ?auto_1531549 ) ) ( not ( = ?auto_1531538 ?auto_1531539 ) ) ( not ( = ?auto_1531538 ?auto_1531541 ) ) ( not ( = ?auto_1531538 ?auto_1531540 ) ) ( not ( = ?auto_1531538 ?auto_1531542 ) ) ( not ( = ?auto_1531538 ?auto_1531543 ) ) ( not ( = ?auto_1531538 ?auto_1531544 ) ) ( not ( = ?auto_1531538 ?auto_1531545 ) ) ( not ( = ?auto_1531538 ?auto_1531546 ) ) ( not ( = ?auto_1531538 ?auto_1531547 ) ) ( not ( = ?auto_1531538 ?auto_1531549 ) ) ( not ( = ?auto_1531539 ?auto_1531541 ) ) ( not ( = ?auto_1531539 ?auto_1531540 ) ) ( not ( = ?auto_1531539 ?auto_1531542 ) ) ( not ( = ?auto_1531539 ?auto_1531543 ) ) ( not ( = ?auto_1531539 ?auto_1531544 ) ) ( not ( = ?auto_1531539 ?auto_1531545 ) ) ( not ( = ?auto_1531539 ?auto_1531546 ) ) ( not ( = ?auto_1531539 ?auto_1531547 ) ) ( not ( = ?auto_1531539 ?auto_1531549 ) ) ( not ( = ?auto_1531541 ?auto_1531540 ) ) ( not ( = ?auto_1531541 ?auto_1531542 ) ) ( not ( = ?auto_1531541 ?auto_1531543 ) ) ( not ( = ?auto_1531541 ?auto_1531544 ) ) ( not ( = ?auto_1531541 ?auto_1531545 ) ) ( not ( = ?auto_1531541 ?auto_1531546 ) ) ( not ( = ?auto_1531541 ?auto_1531547 ) ) ( not ( = ?auto_1531541 ?auto_1531549 ) ) ( not ( = ?auto_1531540 ?auto_1531542 ) ) ( not ( = ?auto_1531540 ?auto_1531543 ) ) ( not ( = ?auto_1531540 ?auto_1531544 ) ) ( not ( = ?auto_1531540 ?auto_1531545 ) ) ( not ( = ?auto_1531540 ?auto_1531546 ) ) ( not ( = ?auto_1531540 ?auto_1531547 ) ) ( not ( = ?auto_1531540 ?auto_1531549 ) ) ( not ( = ?auto_1531542 ?auto_1531543 ) ) ( not ( = ?auto_1531542 ?auto_1531544 ) ) ( not ( = ?auto_1531542 ?auto_1531545 ) ) ( not ( = ?auto_1531542 ?auto_1531546 ) ) ( not ( = ?auto_1531542 ?auto_1531547 ) ) ( not ( = ?auto_1531542 ?auto_1531549 ) ) ( not ( = ?auto_1531543 ?auto_1531544 ) ) ( not ( = ?auto_1531543 ?auto_1531545 ) ) ( not ( = ?auto_1531543 ?auto_1531546 ) ) ( not ( = ?auto_1531543 ?auto_1531547 ) ) ( not ( = ?auto_1531543 ?auto_1531549 ) ) ( not ( = ?auto_1531544 ?auto_1531545 ) ) ( not ( = ?auto_1531544 ?auto_1531546 ) ) ( not ( = ?auto_1531544 ?auto_1531547 ) ) ( not ( = ?auto_1531544 ?auto_1531549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531545 ?auto_1531546 ?auto_1531547 )
      ( MAKE-10CRATE-VERIFY ?auto_1531537 ?auto_1531538 ?auto_1531539 ?auto_1531541 ?auto_1531540 ?auto_1531542 ?auto_1531543 ?auto_1531544 ?auto_1531545 ?auto_1531546 ?auto_1531547 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531663 - SURFACE
      ?auto_1531664 - SURFACE
      ?auto_1531665 - SURFACE
      ?auto_1531667 - SURFACE
      ?auto_1531666 - SURFACE
      ?auto_1531668 - SURFACE
      ?auto_1531669 - SURFACE
      ?auto_1531670 - SURFACE
      ?auto_1531671 - SURFACE
      ?auto_1531672 - SURFACE
      ?auto_1531673 - SURFACE
    )
    :vars
    (
      ?auto_1531676 - HOIST
      ?auto_1531675 - PLACE
      ?auto_1531679 - PLACE
      ?auto_1531677 - HOIST
      ?auto_1531674 - SURFACE
      ?auto_1531678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531676 ?auto_1531675 ) ( SURFACE-AT ?auto_1531672 ?auto_1531675 ) ( CLEAR ?auto_1531672 ) ( IS-CRATE ?auto_1531673 ) ( not ( = ?auto_1531672 ?auto_1531673 ) ) ( AVAILABLE ?auto_1531676 ) ( ON ?auto_1531672 ?auto_1531671 ) ( not ( = ?auto_1531671 ?auto_1531672 ) ) ( not ( = ?auto_1531671 ?auto_1531673 ) ) ( not ( = ?auto_1531679 ?auto_1531675 ) ) ( HOIST-AT ?auto_1531677 ?auto_1531679 ) ( not ( = ?auto_1531676 ?auto_1531677 ) ) ( AVAILABLE ?auto_1531677 ) ( SURFACE-AT ?auto_1531673 ?auto_1531679 ) ( ON ?auto_1531673 ?auto_1531674 ) ( CLEAR ?auto_1531673 ) ( not ( = ?auto_1531672 ?auto_1531674 ) ) ( not ( = ?auto_1531673 ?auto_1531674 ) ) ( not ( = ?auto_1531671 ?auto_1531674 ) ) ( TRUCK-AT ?auto_1531678 ?auto_1531675 ) ( ON ?auto_1531664 ?auto_1531663 ) ( ON ?auto_1531665 ?auto_1531664 ) ( ON ?auto_1531667 ?auto_1531665 ) ( ON ?auto_1531666 ?auto_1531667 ) ( ON ?auto_1531668 ?auto_1531666 ) ( ON ?auto_1531669 ?auto_1531668 ) ( ON ?auto_1531670 ?auto_1531669 ) ( ON ?auto_1531671 ?auto_1531670 ) ( not ( = ?auto_1531663 ?auto_1531664 ) ) ( not ( = ?auto_1531663 ?auto_1531665 ) ) ( not ( = ?auto_1531663 ?auto_1531667 ) ) ( not ( = ?auto_1531663 ?auto_1531666 ) ) ( not ( = ?auto_1531663 ?auto_1531668 ) ) ( not ( = ?auto_1531663 ?auto_1531669 ) ) ( not ( = ?auto_1531663 ?auto_1531670 ) ) ( not ( = ?auto_1531663 ?auto_1531671 ) ) ( not ( = ?auto_1531663 ?auto_1531672 ) ) ( not ( = ?auto_1531663 ?auto_1531673 ) ) ( not ( = ?auto_1531663 ?auto_1531674 ) ) ( not ( = ?auto_1531664 ?auto_1531665 ) ) ( not ( = ?auto_1531664 ?auto_1531667 ) ) ( not ( = ?auto_1531664 ?auto_1531666 ) ) ( not ( = ?auto_1531664 ?auto_1531668 ) ) ( not ( = ?auto_1531664 ?auto_1531669 ) ) ( not ( = ?auto_1531664 ?auto_1531670 ) ) ( not ( = ?auto_1531664 ?auto_1531671 ) ) ( not ( = ?auto_1531664 ?auto_1531672 ) ) ( not ( = ?auto_1531664 ?auto_1531673 ) ) ( not ( = ?auto_1531664 ?auto_1531674 ) ) ( not ( = ?auto_1531665 ?auto_1531667 ) ) ( not ( = ?auto_1531665 ?auto_1531666 ) ) ( not ( = ?auto_1531665 ?auto_1531668 ) ) ( not ( = ?auto_1531665 ?auto_1531669 ) ) ( not ( = ?auto_1531665 ?auto_1531670 ) ) ( not ( = ?auto_1531665 ?auto_1531671 ) ) ( not ( = ?auto_1531665 ?auto_1531672 ) ) ( not ( = ?auto_1531665 ?auto_1531673 ) ) ( not ( = ?auto_1531665 ?auto_1531674 ) ) ( not ( = ?auto_1531667 ?auto_1531666 ) ) ( not ( = ?auto_1531667 ?auto_1531668 ) ) ( not ( = ?auto_1531667 ?auto_1531669 ) ) ( not ( = ?auto_1531667 ?auto_1531670 ) ) ( not ( = ?auto_1531667 ?auto_1531671 ) ) ( not ( = ?auto_1531667 ?auto_1531672 ) ) ( not ( = ?auto_1531667 ?auto_1531673 ) ) ( not ( = ?auto_1531667 ?auto_1531674 ) ) ( not ( = ?auto_1531666 ?auto_1531668 ) ) ( not ( = ?auto_1531666 ?auto_1531669 ) ) ( not ( = ?auto_1531666 ?auto_1531670 ) ) ( not ( = ?auto_1531666 ?auto_1531671 ) ) ( not ( = ?auto_1531666 ?auto_1531672 ) ) ( not ( = ?auto_1531666 ?auto_1531673 ) ) ( not ( = ?auto_1531666 ?auto_1531674 ) ) ( not ( = ?auto_1531668 ?auto_1531669 ) ) ( not ( = ?auto_1531668 ?auto_1531670 ) ) ( not ( = ?auto_1531668 ?auto_1531671 ) ) ( not ( = ?auto_1531668 ?auto_1531672 ) ) ( not ( = ?auto_1531668 ?auto_1531673 ) ) ( not ( = ?auto_1531668 ?auto_1531674 ) ) ( not ( = ?auto_1531669 ?auto_1531670 ) ) ( not ( = ?auto_1531669 ?auto_1531671 ) ) ( not ( = ?auto_1531669 ?auto_1531672 ) ) ( not ( = ?auto_1531669 ?auto_1531673 ) ) ( not ( = ?auto_1531669 ?auto_1531674 ) ) ( not ( = ?auto_1531670 ?auto_1531671 ) ) ( not ( = ?auto_1531670 ?auto_1531672 ) ) ( not ( = ?auto_1531670 ?auto_1531673 ) ) ( not ( = ?auto_1531670 ?auto_1531674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531671 ?auto_1531672 ?auto_1531673 )
      ( MAKE-10CRATE-VERIFY ?auto_1531663 ?auto_1531664 ?auto_1531665 ?auto_1531667 ?auto_1531666 ?auto_1531668 ?auto_1531669 ?auto_1531670 ?auto_1531671 ?auto_1531672 ?auto_1531673 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531789 - SURFACE
      ?auto_1531790 - SURFACE
      ?auto_1531791 - SURFACE
      ?auto_1531793 - SURFACE
      ?auto_1531792 - SURFACE
      ?auto_1531794 - SURFACE
      ?auto_1531795 - SURFACE
      ?auto_1531796 - SURFACE
      ?auto_1531797 - SURFACE
      ?auto_1531798 - SURFACE
      ?auto_1531799 - SURFACE
    )
    :vars
    (
      ?auto_1531804 - HOIST
      ?auto_1531800 - PLACE
      ?auto_1531805 - PLACE
      ?auto_1531801 - HOIST
      ?auto_1531803 - SURFACE
      ?auto_1531802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531804 ?auto_1531800 ) ( IS-CRATE ?auto_1531799 ) ( not ( = ?auto_1531798 ?auto_1531799 ) ) ( not ( = ?auto_1531797 ?auto_1531798 ) ) ( not ( = ?auto_1531797 ?auto_1531799 ) ) ( not ( = ?auto_1531805 ?auto_1531800 ) ) ( HOIST-AT ?auto_1531801 ?auto_1531805 ) ( not ( = ?auto_1531804 ?auto_1531801 ) ) ( AVAILABLE ?auto_1531801 ) ( SURFACE-AT ?auto_1531799 ?auto_1531805 ) ( ON ?auto_1531799 ?auto_1531803 ) ( CLEAR ?auto_1531799 ) ( not ( = ?auto_1531798 ?auto_1531803 ) ) ( not ( = ?auto_1531799 ?auto_1531803 ) ) ( not ( = ?auto_1531797 ?auto_1531803 ) ) ( TRUCK-AT ?auto_1531802 ?auto_1531800 ) ( SURFACE-AT ?auto_1531797 ?auto_1531800 ) ( CLEAR ?auto_1531797 ) ( LIFTING ?auto_1531804 ?auto_1531798 ) ( IS-CRATE ?auto_1531798 ) ( ON ?auto_1531790 ?auto_1531789 ) ( ON ?auto_1531791 ?auto_1531790 ) ( ON ?auto_1531793 ?auto_1531791 ) ( ON ?auto_1531792 ?auto_1531793 ) ( ON ?auto_1531794 ?auto_1531792 ) ( ON ?auto_1531795 ?auto_1531794 ) ( ON ?auto_1531796 ?auto_1531795 ) ( ON ?auto_1531797 ?auto_1531796 ) ( not ( = ?auto_1531789 ?auto_1531790 ) ) ( not ( = ?auto_1531789 ?auto_1531791 ) ) ( not ( = ?auto_1531789 ?auto_1531793 ) ) ( not ( = ?auto_1531789 ?auto_1531792 ) ) ( not ( = ?auto_1531789 ?auto_1531794 ) ) ( not ( = ?auto_1531789 ?auto_1531795 ) ) ( not ( = ?auto_1531789 ?auto_1531796 ) ) ( not ( = ?auto_1531789 ?auto_1531797 ) ) ( not ( = ?auto_1531789 ?auto_1531798 ) ) ( not ( = ?auto_1531789 ?auto_1531799 ) ) ( not ( = ?auto_1531789 ?auto_1531803 ) ) ( not ( = ?auto_1531790 ?auto_1531791 ) ) ( not ( = ?auto_1531790 ?auto_1531793 ) ) ( not ( = ?auto_1531790 ?auto_1531792 ) ) ( not ( = ?auto_1531790 ?auto_1531794 ) ) ( not ( = ?auto_1531790 ?auto_1531795 ) ) ( not ( = ?auto_1531790 ?auto_1531796 ) ) ( not ( = ?auto_1531790 ?auto_1531797 ) ) ( not ( = ?auto_1531790 ?auto_1531798 ) ) ( not ( = ?auto_1531790 ?auto_1531799 ) ) ( not ( = ?auto_1531790 ?auto_1531803 ) ) ( not ( = ?auto_1531791 ?auto_1531793 ) ) ( not ( = ?auto_1531791 ?auto_1531792 ) ) ( not ( = ?auto_1531791 ?auto_1531794 ) ) ( not ( = ?auto_1531791 ?auto_1531795 ) ) ( not ( = ?auto_1531791 ?auto_1531796 ) ) ( not ( = ?auto_1531791 ?auto_1531797 ) ) ( not ( = ?auto_1531791 ?auto_1531798 ) ) ( not ( = ?auto_1531791 ?auto_1531799 ) ) ( not ( = ?auto_1531791 ?auto_1531803 ) ) ( not ( = ?auto_1531793 ?auto_1531792 ) ) ( not ( = ?auto_1531793 ?auto_1531794 ) ) ( not ( = ?auto_1531793 ?auto_1531795 ) ) ( not ( = ?auto_1531793 ?auto_1531796 ) ) ( not ( = ?auto_1531793 ?auto_1531797 ) ) ( not ( = ?auto_1531793 ?auto_1531798 ) ) ( not ( = ?auto_1531793 ?auto_1531799 ) ) ( not ( = ?auto_1531793 ?auto_1531803 ) ) ( not ( = ?auto_1531792 ?auto_1531794 ) ) ( not ( = ?auto_1531792 ?auto_1531795 ) ) ( not ( = ?auto_1531792 ?auto_1531796 ) ) ( not ( = ?auto_1531792 ?auto_1531797 ) ) ( not ( = ?auto_1531792 ?auto_1531798 ) ) ( not ( = ?auto_1531792 ?auto_1531799 ) ) ( not ( = ?auto_1531792 ?auto_1531803 ) ) ( not ( = ?auto_1531794 ?auto_1531795 ) ) ( not ( = ?auto_1531794 ?auto_1531796 ) ) ( not ( = ?auto_1531794 ?auto_1531797 ) ) ( not ( = ?auto_1531794 ?auto_1531798 ) ) ( not ( = ?auto_1531794 ?auto_1531799 ) ) ( not ( = ?auto_1531794 ?auto_1531803 ) ) ( not ( = ?auto_1531795 ?auto_1531796 ) ) ( not ( = ?auto_1531795 ?auto_1531797 ) ) ( not ( = ?auto_1531795 ?auto_1531798 ) ) ( not ( = ?auto_1531795 ?auto_1531799 ) ) ( not ( = ?auto_1531795 ?auto_1531803 ) ) ( not ( = ?auto_1531796 ?auto_1531797 ) ) ( not ( = ?auto_1531796 ?auto_1531798 ) ) ( not ( = ?auto_1531796 ?auto_1531799 ) ) ( not ( = ?auto_1531796 ?auto_1531803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531797 ?auto_1531798 ?auto_1531799 )
      ( MAKE-10CRATE-VERIFY ?auto_1531789 ?auto_1531790 ?auto_1531791 ?auto_1531793 ?auto_1531792 ?auto_1531794 ?auto_1531795 ?auto_1531796 ?auto_1531797 ?auto_1531798 ?auto_1531799 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1531915 - SURFACE
      ?auto_1531916 - SURFACE
      ?auto_1531917 - SURFACE
      ?auto_1531919 - SURFACE
      ?auto_1531918 - SURFACE
      ?auto_1531920 - SURFACE
      ?auto_1531921 - SURFACE
      ?auto_1531922 - SURFACE
      ?auto_1531923 - SURFACE
      ?auto_1531924 - SURFACE
      ?auto_1531925 - SURFACE
    )
    :vars
    (
      ?auto_1531927 - HOIST
      ?auto_1531928 - PLACE
      ?auto_1531930 - PLACE
      ?auto_1531931 - HOIST
      ?auto_1531929 - SURFACE
      ?auto_1531926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531927 ?auto_1531928 ) ( IS-CRATE ?auto_1531925 ) ( not ( = ?auto_1531924 ?auto_1531925 ) ) ( not ( = ?auto_1531923 ?auto_1531924 ) ) ( not ( = ?auto_1531923 ?auto_1531925 ) ) ( not ( = ?auto_1531930 ?auto_1531928 ) ) ( HOIST-AT ?auto_1531931 ?auto_1531930 ) ( not ( = ?auto_1531927 ?auto_1531931 ) ) ( AVAILABLE ?auto_1531931 ) ( SURFACE-AT ?auto_1531925 ?auto_1531930 ) ( ON ?auto_1531925 ?auto_1531929 ) ( CLEAR ?auto_1531925 ) ( not ( = ?auto_1531924 ?auto_1531929 ) ) ( not ( = ?auto_1531925 ?auto_1531929 ) ) ( not ( = ?auto_1531923 ?auto_1531929 ) ) ( TRUCK-AT ?auto_1531926 ?auto_1531928 ) ( SURFACE-AT ?auto_1531923 ?auto_1531928 ) ( CLEAR ?auto_1531923 ) ( IS-CRATE ?auto_1531924 ) ( AVAILABLE ?auto_1531927 ) ( IN ?auto_1531924 ?auto_1531926 ) ( ON ?auto_1531916 ?auto_1531915 ) ( ON ?auto_1531917 ?auto_1531916 ) ( ON ?auto_1531919 ?auto_1531917 ) ( ON ?auto_1531918 ?auto_1531919 ) ( ON ?auto_1531920 ?auto_1531918 ) ( ON ?auto_1531921 ?auto_1531920 ) ( ON ?auto_1531922 ?auto_1531921 ) ( ON ?auto_1531923 ?auto_1531922 ) ( not ( = ?auto_1531915 ?auto_1531916 ) ) ( not ( = ?auto_1531915 ?auto_1531917 ) ) ( not ( = ?auto_1531915 ?auto_1531919 ) ) ( not ( = ?auto_1531915 ?auto_1531918 ) ) ( not ( = ?auto_1531915 ?auto_1531920 ) ) ( not ( = ?auto_1531915 ?auto_1531921 ) ) ( not ( = ?auto_1531915 ?auto_1531922 ) ) ( not ( = ?auto_1531915 ?auto_1531923 ) ) ( not ( = ?auto_1531915 ?auto_1531924 ) ) ( not ( = ?auto_1531915 ?auto_1531925 ) ) ( not ( = ?auto_1531915 ?auto_1531929 ) ) ( not ( = ?auto_1531916 ?auto_1531917 ) ) ( not ( = ?auto_1531916 ?auto_1531919 ) ) ( not ( = ?auto_1531916 ?auto_1531918 ) ) ( not ( = ?auto_1531916 ?auto_1531920 ) ) ( not ( = ?auto_1531916 ?auto_1531921 ) ) ( not ( = ?auto_1531916 ?auto_1531922 ) ) ( not ( = ?auto_1531916 ?auto_1531923 ) ) ( not ( = ?auto_1531916 ?auto_1531924 ) ) ( not ( = ?auto_1531916 ?auto_1531925 ) ) ( not ( = ?auto_1531916 ?auto_1531929 ) ) ( not ( = ?auto_1531917 ?auto_1531919 ) ) ( not ( = ?auto_1531917 ?auto_1531918 ) ) ( not ( = ?auto_1531917 ?auto_1531920 ) ) ( not ( = ?auto_1531917 ?auto_1531921 ) ) ( not ( = ?auto_1531917 ?auto_1531922 ) ) ( not ( = ?auto_1531917 ?auto_1531923 ) ) ( not ( = ?auto_1531917 ?auto_1531924 ) ) ( not ( = ?auto_1531917 ?auto_1531925 ) ) ( not ( = ?auto_1531917 ?auto_1531929 ) ) ( not ( = ?auto_1531919 ?auto_1531918 ) ) ( not ( = ?auto_1531919 ?auto_1531920 ) ) ( not ( = ?auto_1531919 ?auto_1531921 ) ) ( not ( = ?auto_1531919 ?auto_1531922 ) ) ( not ( = ?auto_1531919 ?auto_1531923 ) ) ( not ( = ?auto_1531919 ?auto_1531924 ) ) ( not ( = ?auto_1531919 ?auto_1531925 ) ) ( not ( = ?auto_1531919 ?auto_1531929 ) ) ( not ( = ?auto_1531918 ?auto_1531920 ) ) ( not ( = ?auto_1531918 ?auto_1531921 ) ) ( not ( = ?auto_1531918 ?auto_1531922 ) ) ( not ( = ?auto_1531918 ?auto_1531923 ) ) ( not ( = ?auto_1531918 ?auto_1531924 ) ) ( not ( = ?auto_1531918 ?auto_1531925 ) ) ( not ( = ?auto_1531918 ?auto_1531929 ) ) ( not ( = ?auto_1531920 ?auto_1531921 ) ) ( not ( = ?auto_1531920 ?auto_1531922 ) ) ( not ( = ?auto_1531920 ?auto_1531923 ) ) ( not ( = ?auto_1531920 ?auto_1531924 ) ) ( not ( = ?auto_1531920 ?auto_1531925 ) ) ( not ( = ?auto_1531920 ?auto_1531929 ) ) ( not ( = ?auto_1531921 ?auto_1531922 ) ) ( not ( = ?auto_1531921 ?auto_1531923 ) ) ( not ( = ?auto_1531921 ?auto_1531924 ) ) ( not ( = ?auto_1531921 ?auto_1531925 ) ) ( not ( = ?auto_1531921 ?auto_1531929 ) ) ( not ( = ?auto_1531922 ?auto_1531923 ) ) ( not ( = ?auto_1531922 ?auto_1531924 ) ) ( not ( = ?auto_1531922 ?auto_1531925 ) ) ( not ( = ?auto_1531922 ?auto_1531929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1531923 ?auto_1531924 ?auto_1531925 )
      ( MAKE-10CRATE-VERIFY ?auto_1531915 ?auto_1531916 ?auto_1531917 ?auto_1531919 ?auto_1531918 ?auto_1531920 ?auto_1531921 ?auto_1531922 ?auto_1531923 ?auto_1531924 ?auto_1531925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1532863 - SURFACE
      ?auto_1532864 - SURFACE
    )
    :vars
    (
      ?auto_1532869 - HOIST
      ?auto_1532866 - PLACE
      ?auto_1532871 - SURFACE
      ?auto_1532868 - PLACE
      ?auto_1532865 - HOIST
      ?auto_1532867 - SURFACE
      ?auto_1532870 - TRUCK
      ?auto_1532872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532869 ?auto_1532866 ) ( SURFACE-AT ?auto_1532863 ?auto_1532866 ) ( CLEAR ?auto_1532863 ) ( IS-CRATE ?auto_1532864 ) ( not ( = ?auto_1532863 ?auto_1532864 ) ) ( ON ?auto_1532863 ?auto_1532871 ) ( not ( = ?auto_1532871 ?auto_1532863 ) ) ( not ( = ?auto_1532871 ?auto_1532864 ) ) ( not ( = ?auto_1532868 ?auto_1532866 ) ) ( HOIST-AT ?auto_1532865 ?auto_1532868 ) ( not ( = ?auto_1532869 ?auto_1532865 ) ) ( AVAILABLE ?auto_1532865 ) ( SURFACE-AT ?auto_1532864 ?auto_1532868 ) ( ON ?auto_1532864 ?auto_1532867 ) ( CLEAR ?auto_1532864 ) ( not ( = ?auto_1532863 ?auto_1532867 ) ) ( not ( = ?auto_1532864 ?auto_1532867 ) ) ( not ( = ?auto_1532871 ?auto_1532867 ) ) ( TRUCK-AT ?auto_1532870 ?auto_1532866 ) ( LIFTING ?auto_1532869 ?auto_1532872 ) ( IS-CRATE ?auto_1532872 ) ( not ( = ?auto_1532863 ?auto_1532872 ) ) ( not ( = ?auto_1532864 ?auto_1532872 ) ) ( not ( = ?auto_1532871 ?auto_1532872 ) ) ( not ( = ?auto_1532867 ?auto_1532872 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1532869 ?auto_1532872 ?auto_1532870 ?auto_1532866 )
      ( MAKE-1CRATE ?auto_1532863 ?auto_1532864 )
      ( MAKE-1CRATE-VERIFY ?auto_1532863 ?auto_1532864 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539180 - SURFACE
      ?auto_1539181 - SURFACE
      ?auto_1539182 - SURFACE
      ?auto_1539184 - SURFACE
      ?auto_1539183 - SURFACE
      ?auto_1539185 - SURFACE
      ?auto_1539186 - SURFACE
      ?auto_1539187 - SURFACE
      ?auto_1539188 - SURFACE
      ?auto_1539189 - SURFACE
      ?auto_1539190 - SURFACE
      ?auto_1539191 - SURFACE
    )
    :vars
    (
      ?auto_1539192 - HOIST
      ?auto_1539193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539192 ?auto_1539193 ) ( SURFACE-AT ?auto_1539190 ?auto_1539193 ) ( CLEAR ?auto_1539190 ) ( LIFTING ?auto_1539192 ?auto_1539191 ) ( IS-CRATE ?auto_1539191 ) ( not ( = ?auto_1539190 ?auto_1539191 ) ) ( ON ?auto_1539181 ?auto_1539180 ) ( ON ?auto_1539182 ?auto_1539181 ) ( ON ?auto_1539184 ?auto_1539182 ) ( ON ?auto_1539183 ?auto_1539184 ) ( ON ?auto_1539185 ?auto_1539183 ) ( ON ?auto_1539186 ?auto_1539185 ) ( ON ?auto_1539187 ?auto_1539186 ) ( ON ?auto_1539188 ?auto_1539187 ) ( ON ?auto_1539189 ?auto_1539188 ) ( ON ?auto_1539190 ?auto_1539189 ) ( not ( = ?auto_1539180 ?auto_1539181 ) ) ( not ( = ?auto_1539180 ?auto_1539182 ) ) ( not ( = ?auto_1539180 ?auto_1539184 ) ) ( not ( = ?auto_1539180 ?auto_1539183 ) ) ( not ( = ?auto_1539180 ?auto_1539185 ) ) ( not ( = ?auto_1539180 ?auto_1539186 ) ) ( not ( = ?auto_1539180 ?auto_1539187 ) ) ( not ( = ?auto_1539180 ?auto_1539188 ) ) ( not ( = ?auto_1539180 ?auto_1539189 ) ) ( not ( = ?auto_1539180 ?auto_1539190 ) ) ( not ( = ?auto_1539180 ?auto_1539191 ) ) ( not ( = ?auto_1539181 ?auto_1539182 ) ) ( not ( = ?auto_1539181 ?auto_1539184 ) ) ( not ( = ?auto_1539181 ?auto_1539183 ) ) ( not ( = ?auto_1539181 ?auto_1539185 ) ) ( not ( = ?auto_1539181 ?auto_1539186 ) ) ( not ( = ?auto_1539181 ?auto_1539187 ) ) ( not ( = ?auto_1539181 ?auto_1539188 ) ) ( not ( = ?auto_1539181 ?auto_1539189 ) ) ( not ( = ?auto_1539181 ?auto_1539190 ) ) ( not ( = ?auto_1539181 ?auto_1539191 ) ) ( not ( = ?auto_1539182 ?auto_1539184 ) ) ( not ( = ?auto_1539182 ?auto_1539183 ) ) ( not ( = ?auto_1539182 ?auto_1539185 ) ) ( not ( = ?auto_1539182 ?auto_1539186 ) ) ( not ( = ?auto_1539182 ?auto_1539187 ) ) ( not ( = ?auto_1539182 ?auto_1539188 ) ) ( not ( = ?auto_1539182 ?auto_1539189 ) ) ( not ( = ?auto_1539182 ?auto_1539190 ) ) ( not ( = ?auto_1539182 ?auto_1539191 ) ) ( not ( = ?auto_1539184 ?auto_1539183 ) ) ( not ( = ?auto_1539184 ?auto_1539185 ) ) ( not ( = ?auto_1539184 ?auto_1539186 ) ) ( not ( = ?auto_1539184 ?auto_1539187 ) ) ( not ( = ?auto_1539184 ?auto_1539188 ) ) ( not ( = ?auto_1539184 ?auto_1539189 ) ) ( not ( = ?auto_1539184 ?auto_1539190 ) ) ( not ( = ?auto_1539184 ?auto_1539191 ) ) ( not ( = ?auto_1539183 ?auto_1539185 ) ) ( not ( = ?auto_1539183 ?auto_1539186 ) ) ( not ( = ?auto_1539183 ?auto_1539187 ) ) ( not ( = ?auto_1539183 ?auto_1539188 ) ) ( not ( = ?auto_1539183 ?auto_1539189 ) ) ( not ( = ?auto_1539183 ?auto_1539190 ) ) ( not ( = ?auto_1539183 ?auto_1539191 ) ) ( not ( = ?auto_1539185 ?auto_1539186 ) ) ( not ( = ?auto_1539185 ?auto_1539187 ) ) ( not ( = ?auto_1539185 ?auto_1539188 ) ) ( not ( = ?auto_1539185 ?auto_1539189 ) ) ( not ( = ?auto_1539185 ?auto_1539190 ) ) ( not ( = ?auto_1539185 ?auto_1539191 ) ) ( not ( = ?auto_1539186 ?auto_1539187 ) ) ( not ( = ?auto_1539186 ?auto_1539188 ) ) ( not ( = ?auto_1539186 ?auto_1539189 ) ) ( not ( = ?auto_1539186 ?auto_1539190 ) ) ( not ( = ?auto_1539186 ?auto_1539191 ) ) ( not ( = ?auto_1539187 ?auto_1539188 ) ) ( not ( = ?auto_1539187 ?auto_1539189 ) ) ( not ( = ?auto_1539187 ?auto_1539190 ) ) ( not ( = ?auto_1539187 ?auto_1539191 ) ) ( not ( = ?auto_1539188 ?auto_1539189 ) ) ( not ( = ?auto_1539188 ?auto_1539190 ) ) ( not ( = ?auto_1539188 ?auto_1539191 ) ) ( not ( = ?auto_1539189 ?auto_1539190 ) ) ( not ( = ?auto_1539189 ?auto_1539191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1539190 ?auto_1539191 )
      ( MAKE-11CRATE-VERIFY ?auto_1539180 ?auto_1539181 ?auto_1539182 ?auto_1539184 ?auto_1539183 ?auto_1539185 ?auto_1539186 ?auto_1539187 ?auto_1539188 ?auto_1539189 ?auto_1539190 ?auto_1539191 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539289 - SURFACE
      ?auto_1539290 - SURFACE
      ?auto_1539291 - SURFACE
      ?auto_1539293 - SURFACE
      ?auto_1539292 - SURFACE
      ?auto_1539294 - SURFACE
      ?auto_1539295 - SURFACE
      ?auto_1539296 - SURFACE
      ?auto_1539297 - SURFACE
      ?auto_1539298 - SURFACE
      ?auto_1539299 - SURFACE
      ?auto_1539300 - SURFACE
    )
    :vars
    (
      ?auto_1539302 - HOIST
      ?auto_1539301 - PLACE
      ?auto_1539303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539302 ?auto_1539301 ) ( SURFACE-AT ?auto_1539299 ?auto_1539301 ) ( CLEAR ?auto_1539299 ) ( IS-CRATE ?auto_1539300 ) ( not ( = ?auto_1539299 ?auto_1539300 ) ) ( TRUCK-AT ?auto_1539303 ?auto_1539301 ) ( AVAILABLE ?auto_1539302 ) ( IN ?auto_1539300 ?auto_1539303 ) ( ON ?auto_1539299 ?auto_1539298 ) ( not ( = ?auto_1539298 ?auto_1539299 ) ) ( not ( = ?auto_1539298 ?auto_1539300 ) ) ( ON ?auto_1539290 ?auto_1539289 ) ( ON ?auto_1539291 ?auto_1539290 ) ( ON ?auto_1539293 ?auto_1539291 ) ( ON ?auto_1539292 ?auto_1539293 ) ( ON ?auto_1539294 ?auto_1539292 ) ( ON ?auto_1539295 ?auto_1539294 ) ( ON ?auto_1539296 ?auto_1539295 ) ( ON ?auto_1539297 ?auto_1539296 ) ( ON ?auto_1539298 ?auto_1539297 ) ( not ( = ?auto_1539289 ?auto_1539290 ) ) ( not ( = ?auto_1539289 ?auto_1539291 ) ) ( not ( = ?auto_1539289 ?auto_1539293 ) ) ( not ( = ?auto_1539289 ?auto_1539292 ) ) ( not ( = ?auto_1539289 ?auto_1539294 ) ) ( not ( = ?auto_1539289 ?auto_1539295 ) ) ( not ( = ?auto_1539289 ?auto_1539296 ) ) ( not ( = ?auto_1539289 ?auto_1539297 ) ) ( not ( = ?auto_1539289 ?auto_1539298 ) ) ( not ( = ?auto_1539289 ?auto_1539299 ) ) ( not ( = ?auto_1539289 ?auto_1539300 ) ) ( not ( = ?auto_1539290 ?auto_1539291 ) ) ( not ( = ?auto_1539290 ?auto_1539293 ) ) ( not ( = ?auto_1539290 ?auto_1539292 ) ) ( not ( = ?auto_1539290 ?auto_1539294 ) ) ( not ( = ?auto_1539290 ?auto_1539295 ) ) ( not ( = ?auto_1539290 ?auto_1539296 ) ) ( not ( = ?auto_1539290 ?auto_1539297 ) ) ( not ( = ?auto_1539290 ?auto_1539298 ) ) ( not ( = ?auto_1539290 ?auto_1539299 ) ) ( not ( = ?auto_1539290 ?auto_1539300 ) ) ( not ( = ?auto_1539291 ?auto_1539293 ) ) ( not ( = ?auto_1539291 ?auto_1539292 ) ) ( not ( = ?auto_1539291 ?auto_1539294 ) ) ( not ( = ?auto_1539291 ?auto_1539295 ) ) ( not ( = ?auto_1539291 ?auto_1539296 ) ) ( not ( = ?auto_1539291 ?auto_1539297 ) ) ( not ( = ?auto_1539291 ?auto_1539298 ) ) ( not ( = ?auto_1539291 ?auto_1539299 ) ) ( not ( = ?auto_1539291 ?auto_1539300 ) ) ( not ( = ?auto_1539293 ?auto_1539292 ) ) ( not ( = ?auto_1539293 ?auto_1539294 ) ) ( not ( = ?auto_1539293 ?auto_1539295 ) ) ( not ( = ?auto_1539293 ?auto_1539296 ) ) ( not ( = ?auto_1539293 ?auto_1539297 ) ) ( not ( = ?auto_1539293 ?auto_1539298 ) ) ( not ( = ?auto_1539293 ?auto_1539299 ) ) ( not ( = ?auto_1539293 ?auto_1539300 ) ) ( not ( = ?auto_1539292 ?auto_1539294 ) ) ( not ( = ?auto_1539292 ?auto_1539295 ) ) ( not ( = ?auto_1539292 ?auto_1539296 ) ) ( not ( = ?auto_1539292 ?auto_1539297 ) ) ( not ( = ?auto_1539292 ?auto_1539298 ) ) ( not ( = ?auto_1539292 ?auto_1539299 ) ) ( not ( = ?auto_1539292 ?auto_1539300 ) ) ( not ( = ?auto_1539294 ?auto_1539295 ) ) ( not ( = ?auto_1539294 ?auto_1539296 ) ) ( not ( = ?auto_1539294 ?auto_1539297 ) ) ( not ( = ?auto_1539294 ?auto_1539298 ) ) ( not ( = ?auto_1539294 ?auto_1539299 ) ) ( not ( = ?auto_1539294 ?auto_1539300 ) ) ( not ( = ?auto_1539295 ?auto_1539296 ) ) ( not ( = ?auto_1539295 ?auto_1539297 ) ) ( not ( = ?auto_1539295 ?auto_1539298 ) ) ( not ( = ?auto_1539295 ?auto_1539299 ) ) ( not ( = ?auto_1539295 ?auto_1539300 ) ) ( not ( = ?auto_1539296 ?auto_1539297 ) ) ( not ( = ?auto_1539296 ?auto_1539298 ) ) ( not ( = ?auto_1539296 ?auto_1539299 ) ) ( not ( = ?auto_1539296 ?auto_1539300 ) ) ( not ( = ?auto_1539297 ?auto_1539298 ) ) ( not ( = ?auto_1539297 ?auto_1539299 ) ) ( not ( = ?auto_1539297 ?auto_1539300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539298 ?auto_1539299 ?auto_1539300 )
      ( MAKE-11CRATE-VERIFY ?auto_1539289 ?auto_1539290 ?auto_1539291 ?auto_1539293 ?auto_1539292 ?auto_1539294 ?auto_1539295 ?auto_1539296 ?auto_1539297 ?auto_1539298 ?auto_1539299 ?auto_1539300 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539410 - SURFACE
      ?auto_1539411 - SURFACE
      ?auto_1539412 - SURFACE
      ?auto_1539414 - SURFACE
      ?auto_1539413 - SURFACE
      ?auto_1539415 - SURFACE
      ?auto_1539416 - SURFACE
      ?auto_1539417 - SURFACE
      ?auto_1539418 - SURFACE
      ?auto_1539419 - SURFACE
      ?auto_1539420 - SURFACE
      ?auto_1539421 - SURFACE
    )
    :vars
    (
      ?auto_1539422 - HOIST
      ?auto_1539425 - PLACE
      ?auto_1539424 - TRUCK
      ?auto_1539423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539422 ?auto_1539425 ) ( SURFACE-AT ?auto_1539420 ?auto_1539425 ) ( CLEAR ?auto_1539420 ) ( IS-CRATE ?auto_1539421 ) ( not ( = ?auto_1539420 ?auto_1539421 ) ) ( AVAILABLE ?auto_1539422 ) ( IN ?auto_1539421 ?auto_1539424 ) ( ON ?auto_1539420 ?auto_1539419 ) ( not ( = ?auto_1539419 ?auto_1539420 ) ) ( not ( = ?auto_1539419 ?auto_1539421 ) ) ( TRUCK-AT ?auto_1539424 ?auto_1539423 ) ( not ( = ?auto_1539423 ?auto_1539425 ) ) ( ON ?auto_1539411 ?auto_1539410 ) ( ON ?auto_1539412 ?auto_1539411 ) ( ON ?auto_1539414 ?auto_1539412 ) ( ON ?auto_1539413 ?auto_1539414 ) ( ON ?auto_1539415 ?auto_1539413 ) ( ON ?auto_1539416 ?auto_1539415 ) ( ON ?auto_1539417 ?auto_1539416 ) ( ON ?auto_1539418 ?auto_1539417 ) ( ON ?auto_1539419 ?auto_1539418 ) ( not ( = ?auto_1539410 ?auto_1539411 ) ) ( not ( = ?auto_1539410 ?auto_1539412 ) ) ( not ( = ?auto_1539410 ?auto_1539414 ) ) ( not ( = ?auto_1539410 ?auto_1539413 ) ) ( not ( = ?auto_1539410 ?auto_1539415 ) ) ( not ( = ?auto_1539410 ?auto_1539416 ) ) ( not ( = ?auto_1539410 ?auto_1539417 ) ) ( not ( = ?auto_1539410 ?auto_1539418 ) ) ( not ( = ?auto_1539410 ?auto_1539419 ) ) ( not ( = ?auto_1539410 ?auto_1539420 ) ) ( not ( = ?auto_1539410 ?auto_1539421 ) ) ( not ( = ?auto_1539411 ?auto_1539412 ) ) ( not ( = ?auto_1539411 ?auto_1539414 ) ) ( not ( = ?auto_1539411 ?auto_1539413 ) ) ( not ( = ?auto_1539411 ?auto_1539415 ) ) ( not ( = ?auto_1539411 ?auto_1539416 ) ) ( not ( = ?auto_1539411 ?auto_1539417 ) ) ( not ( = ?auto_1539411 ?auto_1539418 ) ) ( not ( = ?auto_1539411 ?auto_1539419 ) ) ( not ( = ?auto_1539411 ?auto_1539420 ) ) ( not ( = ?auto_1539411 ?auto_1539421 ) ) ( not ( = ?auto_1539412 ?auto_1539414 ) ) ( not ( = ?auto_1539412 ?auto_1539413 ) ) ( not ( = ?auto_1539412 ?auto_1539415 ) ) ( not ( = ?auto_1539412 ?auto_1539416 ) ) ( not ( = ?auto_1539412 ?auto_1539417 ) ) ( not ( = ?auto_1539412 ?auto_1539418 ) ) ( not ( = ?auto_1539412 ?auto_1539419 ) ) ( not ( = ?auto_1539412 ?auto_1539420 ) ) ( not ( = ?auto_1539412 ?auto_1539421 ) ) ( not ( = ?auto_1539414 ?auto_1539413 ) ) ( not ( = ?auto_1539414 ?auto_1539415 ) ) ( not ( = ?auto_1539414 ?auto_1539416 ) ) ( not ( = ?auto_1539414 ?auto_1539417 ) ) ( not ( = ?auto_1539414 ?auto_1539418 ) ) ( not ( = ?auto_1539414 ?auto_1539419 ) ) ( not ( = ?auto_1539414 ?auto_1539420 ) ) ( not ( = ?auto_1539414 ?auto_1539421 ) ) ( not ( = ?auto_1539413 ?auto_1539415 ) ) ( not ( = ?auto_1539413 ?auto_1539416 ) ) ( not ( = ?auto_1539413 ?auto_1539417 ) ) ( not ( = ?auto_1539413 ?auto_1539418 ) ) ( not ( = ?auto_1539413 ?auto_1539419 ) ) ( not ( = ?auto_1539413 ?auto_1539420 ) ) ( not ( = ?auto_1539413 ?auto_1539421 ) ) ( not ( = ?auto_1539415 ?auto_1539416 ) ) ( not ( = ?auto_1539415 ?auto_1539417 ) ) ( not ( = ?auto_1539415 ?auto_1539418 ) ) ( not ( = ?auto_1539415 ?auto_1539419 ) ) ( not ( = ?auto_1539415 ?auto_1539420 ) ) ( not ( = ?auto_1539415 ?auto_1539421 ) ) ( not ( = ?auto_1539416 ?auto_1539417 ) ) ( not ( = ?auto_1539416 ?auto_1539418 ) ) ( not ( = ?auto_1539416 ?auto_1539419 ) ) ( not ( = ?auto_1539416 ?auto_1539420 ) ) ( not ( = ?auto_1539416 ?auto_1539421 ) ) ( not ( = ?auto_1539417 ?auto_1539418 ) ) ( not ( = ?auto_1539417 ?auto_1539419 ) ) ( not ( = ?auto_1539417 ?auto_1539420 ) ) ( not ( = ?auto_1539417 ?auto_1539421 ) ) ( not ( = ?auto_1539418 ?auto_1539419 ) ) ( not ( = ?auto_1539418 ?auto_1539420 ) ) ( not ( = ?auto_1539418 ?auto_1539421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539419 ?auto_1539420 ?auto_1539421 )
      ( MAKE-11CRATE-VERIFY ?auto_1539410 ?auto_1539411 ?auto_1539412 ?auto_1539414 ?auto_1539413 ?auto_1539415 ?auto_1539416 ?auto_1539417 ?auto_1539418 ?auto_1539419 ?auto_1539420 ?auto_1539421 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539542 - SURFACE
      ?auto_1539543 - SURFACE
      ?auto_1539544 - SURFACE
      ?auto_1539546 - SURFACE
      ?auto_1539545 - SURFACE
      ?auto_1539547 - SURFACE
      ?auto_1539548 - SURFACE
      ?auto_1539549 - SURFACE
      ?auto_1539550 - SURFACE
      ?auto_1539551 - SURFACE
      ?auto_1539552 - SURFACE
      ?auto_1539553 - SURFACE
    )
    :vars
    (
      ?auto_1539555 - HOIST
      ?auto_1539556 - PLACE
      ?auto_1539554 - TRUCK
      ?auto_1539558 - PLACE
      ?auto_1539557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539555 ?auto_1539556 ) ( SURFACE-AT ?auto_1539552 ?auto_1539556 ) ( CLEAR ?auto_1539552 ) ( IS-CRATE ?auto_1539553 ) ( not ( = ?auto_1539552 ?auto_1539553 ) ) ( AVAILABLE ?auto_1539555 ) ( ON ?auto_1539552 ?auto_1539551 ) ( not ( = ?auto_1539551 ?auto_1539552 ) ) ( not ( = ?auto_1539551 ?auto_1539553 ) ) ( TRUCK-AT ?auto_1539554 ?auto_1539558 ) ( not ( = ?auto_1539558 ?auto_1539556 ) ) ( HOIST-AT ?auto_1539557 ?auto_1539558 ) ( LIFTING ?auto_1539557 ?auto_1539553 ) ( not ( = ?auto_1539555 ?auto_1539557 ) ) ( ON ?auto_1539543 ?auto_1539542 ) ( ON ?auto_1539544 ?auto_1539543 ) ( ON ?auto_1539546 ?auto_1539544 ) ( ON ?auto_1539545 ?auto_1539546 ) ( ON ?auto_1539547 ?auto_1539545 ) ( ON ?auto_1539548 ?auto_1539547 ) ( ON ?auto_1539549 ?auto_1539548 ) ( ON ?auto_1539550 ?auto_1539549 ) ( ON ?auto_1539551 ?auto_1539550 ) ( not ( = ?auto_1539542 ?auto_1539543 ) ) ( not ( = ?auto_1539542 ?auto_1539544 ) ) ( not ( = ?auto_1539542 ?auto_1539546 ) ) ( not ( = ?auto_1539542 ?auto_1539545 ) ) ( not ( = ?auto_1539542 ?auto_1539547 ) ) ( not ( = ?auto_1539542 ?auto_1539548 ) ) ( not ( = ?auto_1539542 ?auto_1539549 ) ) ( not ( = ?auto_1539542 ?auto_1539550 ) ) ( not ( = ?auto_1539542 ?auto_1539551 ) ) ( not ( = ?auto_1539542 ?auto_1539552 ) ) ( not ( = ?auto_1539542 ?auto_1539553 ) ) ( not ( = ?auto_1539543 ?auto_1539544 ) ) ( not ( = ?auto_1539543 ?auto_1539546 ) ) ( not ( = ?auto_1539543 ?auto_1539545 ) ) ( not ( = ?auto_1539543 ?auto_1539547 ) ) ( not ( = ?auto_1539543 ?auto_1539548 ) ) ( not ( = ?auto_1539543 ?auto_1539549 ) ) ( not ( = ?auto_1539543 ?auto_1539550 ) ) ( not ( = ?auto_1539543 ?auto_1539551 ) ) ( not ( = ?auto_1539543 ?auto_1539552 ) ) ( not ( = ?auto_1539543 ?auto_1539553 ) ) ( not ( = ?auto_1539544 ?auto_1539546 ) ) ( not ( = ?auto_1539544 ?auto_1539545 ) ) ( not ( = ?auto_1539544 ?auto_1539547 ) ) ( not ( = ?auto_1539544 ?auto_1539548 ) ) ( not ( = ?auto_1539544 ?auto_1539549 ) ) ( not ( = ?auto_1539544 ?auto_1539550 ) ) ( not ( = ?auto_1539544 ?auto_1539551 ) ) ( not ( = ?auto_1539544 ?auto_1539552 ) ) ( not ( = ?auto_1539544 ?auto_1539553 ) ) ( not ( = ?auto_1539546 ?auto_1539545 ) ) ( not ( = ?auto_1539546 ?auto_1539547 ) ) ( not ( = ?auto_1539546 ?auto_1539548 ) ) ( not ( = ?auto_1539546 ?auto_1539549 ) ) ( not ( = ?auto_1539546 ?auto_1539550 ) ) ( not ( = ?auto_1539546 ?auto_1539551 ) ) ( not ( = ?auto_1539546 ?auto_1539552 ) ) ( not ( = ?auto_1539546 ?auto_1539553 ) ) ( not ( = ?auto_1539545 ?auto_1539547 ) ) ( not ( = ?auto_1539545 ?auto_1539548 ) ) ( not ( = ?auto_1539545 ?auto_1539549 ) ) ( not ( = ?auto_1539545 ?auto_1539550 ) ) ( not ( = ?auto_1539545 ?auto_1539551 ) ) ( not ( = ?auto_1539545 ?auto_1539552 ) ) ( not ( = ?auto_1539545 ?auto_1539553 ) ) ( not ( = ?auto_1539547 ?auto_1539548 ) ) ( not ( = ?auto_1539547 ?auto_1539549 ) ) ( not ( = ?auto_1539547 ?auto_1539550 ) ) ( not ( = ?auto_1539547 ?auto_1539551 ) ) ( not ( = ?auto_1539547 ?auto_1539552 ) ) ( not ( = ?auto_1539547 ?auto_1539553 ) ) ( not ( = ?auto_1539548 ?auto_1539549 ) ) ( not ( = ?auto_1539548 ?auto_1539550 ) ) ( not ( = ?auto_1539548 ?auto_1539551 ) ) ( not ( = ?auto_1539548 ?auto_1539552 ) ) ( not ( = ?auto_1539548 ?auto_1539553 ) ) ( not ( = ?auto_1539549 ?auto_1539550 ) ) ( not ( = ?auto_1539549 ?auto_1539551 ) ) ( not ( = ?auto_1539549 ?auto_1539552 ) ) ( not ( = ?auto_1539549 ?auto_1539553 ) ) ( not ( = ?auto_1539550 ?auto_1539551 ) ) ( not ( = ?auto_1539550 ?auto_1539552 ) ) ( not ( = ?auto_1539550 ?auto_1539553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539551 ?auto_1539552 ?auto_1539553 )
      ( MAKE-11CRATE-VERIFY ?auto_1539542 ?auto_1539543 ?auto_1539544 ?auto_1539546 ?auto_1539545 ?auto_1539547 ?auto_1539548 ?auto_1539549 ?auto_1539550 ?auto_1539551 ?auto_1539552 ?auto_1539553 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539685 - SURFACE
      ?auto_1539686 - SURFACE
      ?auto_1539687 - SURFACE
      ?auto_1539689 - SURFACE
      ?auto_1539688 - SURFACE
      ?auto_1539690 - SURFACE
      ?auto_1539691 - SURFACE
      ?auto_1539692 - SURFACE
      ?auto_1539693 - SURFACE
      ?auto_1539694 - SURFACE
      ?auto_1539695 - SURFACE
      ?auto_1539696 - SURFACE
    )
    :vars
    (
      ?auto_1539697 - HOIST
      ?auto_1539699 - PLACE
      ?auto_1539700 - TRUCK
      ?auto_1539698 - PLACE
      ?auto_1539701 - HOIST
      ?auto_1539702 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539697 ?auto_1539699 ) ( SURFACE-AT ?auto_1539695 ?auto_1539699 ) ( CLEAR ?auto_1539695 ) ( IS-CRATE ?auto_1539696 ) ( not ( = ?auto_1539695 ?auto_1539696 ) ) ( AVAILABLE ?auto_1539697 ) ( ON ?auto_1539695 ?auto_1539694 ) ( not ( = ?auto_1539694 ?auto_1539695 ) ) ( not ( = ?auto_1539694 ?auto_1539696 ) ) ( TRUCK-AT ?auto_1539700 ?auto_1539698 ) ( not ( = ?auto_1539698 ?auto_1539699 ) ) ( HOIST-AT ?auto_1539701 ?auto_1539698 ) ( not ( = ?auto_1539697 ?auto_1539701 ) ) ( AVAILABLE ?auto_1539701 ) ( SURFACE-AT ?auto_1539696 ?auto_1539698 ) ( ON ?auto_1539696 ?auto_1539702 ) ( CLEAR ?auto_1539696 ) ( not ( = ?auto_1539695 ?auto_1539702 ) ) ( not ( = ?auto_1539696 ?auto_1539702 ) ) ( not ( = ?auto_1539694 ?auto_1539702 ) ) ( ON ?auto_1539686 ?auto_1539685 ) ( ON ?auto_1539687 ?auto_1539686 ) ( ON ?auto_1539689 ?auto_1539687 ) ( ON ?auto_1539688 ?auto_1539689 ) ( ON ?auto_1539690 ?auto_1539688 ) ( ON ?auto_1539691 ?auto_1539690 ) ( ON ?auto_1539692 ?auto_1539691 ) ( ON ?auto_1539693 ?auto_1539692 ) ( ON ?auto_1539694 ?auto_1539693 ) ( not ( = ?auto_1539685 ?auto_1539686 ) ) ( not ( = ?auto_1539685 ?auto_1539687 ) ) ( not ( = ?auto_1539685 ?auto_1539689 ) ) ( not ( = ?auto_1539685 ?auto_1539688 ) ) ( not ( = ?auto_1539685 ?auto_1539690 ) ) ( not ( = ?auto_1539685 ?auto_1539691 ) ) ( not ( = ?auto_1539685 ?auto_1539692 ) ) ( not ( = ?auto_1539685 ?auto_1539693 ) ) ( not ( = ?auto_1539685 ?auto_1539694 ) ) ( not ( = ?auto_1539685 ?auto_1539695 ) ) ( not ( = ?auto_1539685 ?auto_1539696 ) ) ( not ( = ?auto_1539685 ?auto_1539702 ) ) ( not ( = ?auto_1539686 ?auto_1539687 ) ) ( not ( = ?auto_1539686 ?auto_1539689 ) ) ( not ( = ?auto_1539686 ?auto_1539688 ) ) ( not ( = ?auto_1539686 ?auto_1539690 ) ) ( not ( = ?auto_1539686 ?auto_1539691 ) ) ( not ( = ?auto_1539686 ?auto_1539692 ) ) ( not ( = ?auto_1539686 ?auto_1539693 ) ) ( not ( = ?auto_1539686 ?auto_1539694 ) ) ( not ( = ?auto_1539686 ?auto_1539695 ) ) ( not ( = ?auto_1539686 ?auto_1539696 ) ) ( not ( = ?auto_1539686 ?auto_1539702 ) ) ( not ( = ?auto_1539687 ?auto_1539689 ) ) ( not ( = ?auto_1539687 ?auto_1539688 ) ) ( not ( = ?auto_1539687 ?auto_1539690 ) ) ( not ( = ?auto_1539687 ?auto_1539691 ) ) ( not ( = ?auto_1539687 ?auto_1539692 ) ) ( not ( = ?auto_1539687 ?auto_1539693 ) ) ( not ( = ?auto_1539687 ?auto_1539694 ) ) ( not ( = ?auto_1539687 ?auto_1539695 ) ) ( not ( = ?auto_1539687 ?auto_1539696 ) ) ( not ( = ?auto_1539687 ?auto_1539702 ) ) ( not ( = ?auto_1539689 ?auto_1539688 ) ) ( not ( = ?auto_1539689 ?auto_1539690 ) ) ( not ( = ?auto_1539689 ?auto_1539691 ) ) ( not ( = ?auto_1539689 ?auto_1539692 ) ) ( not ( = ?auto_1539689 ?auto_1539693 ) ) ( not ( = ?auto_1539689 ?auto_1539694 ) ) ( not ( = ?auto_1539689 ?auto_1539695 ) ) ( not ( = ?auto_1539689 ?auto_1539696 ) ) ( not ( = ?auto_1539689 ?auto_1539702 ) ) ( not ( = ?auto_1539688 ?auto_1539690 ) ) ( not ( = ?auto_1539688 ?auto_1539691 ) ) ( not ( = ?auto_1539688 ?auto_1539692 ) ) ( not ( = ?auto_1539688 ?auto_1539693 ) ) ( not ( = ?auto_1539688 ?auto_1539694 ) ) ( not ( = ?auto_1539688 ?auto_1539695 ) ) ( not ( = ?auto_1539688 ?auto_1539696 ) ) ( not ( = ?auto_1539688 ?auto_1539702 ) ) ( not ( = ?auto_1539690 ?auto_1539691 ) ) ( not ( = ?auto_1539690 ?auto_1539692 ) ) ( not ( = ?auto_1539690 ?auto_1539693 ) ) ( not ( = ?auto_1539690 ?auto_1539694 ) ) ( not ( = ?auto_1539690 ?auto_1539695 ) ) ( not ( = ?auto_1539690 ?auto_1539696 ) ) ( not ( = ?auto_1539690 ?auto_1539702 ) ) ( not ( = ?auto_1539691 ?auto_1539692 ) ) ( not ( = ?auto_1539691 ?auto_1539693 ) ) ( not ( = ?auto_1539691 ?auto_1539694 ) ) ( not ( = ?auto_1539691 ?auto_1539695 ) ) ( not ( = ?auto_1539691 ?auto_1539696 ) ) ( not ( = ?auto_1539691 ?auto_1539702 ) ) ( not ( = ?auto_1539692 ?auto_1539693 ) ) ( not ( = ?auto_1539692 ?auto_1539694 ) ) ( not ( = ?auto_1539692 ?auto_1539695 ) ) ( not ( = ?auto_1539692 ?auto_1539696 ) ) ( not ( = ?auto_1539692 ?auto_1539702 ) ) ( not ( = ?auto_1539693 ?auto_1539694 ) ) ( not ( = ?auto_1539693 ?auto_1539695 ) ) ( not ( = ?auto_1539693 ?auto_1539696 ) ) ( not ( = ?auto_1539693 ?auto_1539702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539694 ?auto_1539695 ?auto_1539696 )
      ( MAKE-11CRATE-VERIFY ?auto_1539685 ?auto_1539686 ?auto_1539687 ?auto_1539689 ?auto_1539688 ?auto_1539690 ?auto_1539691 ?auto_1539692 ?auto_1539693 ?auto_1539694 ?auto_1539695 ?auto_1539696 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539829 - SURFACE
      ?auto_1539830 - SURFACE
      ?auto_1539831 - SURFACE
      ?auto_1539833 - SURFACE
      ?auto_1539832 - SURFACE
      ?auto_1539834 - SURFACE
      ?auto_1539835 - SURFACE
      ?auto_1539836 - SURFACE
      ?auto_1539837 - SURFACE
      ?auto_1539838 - SURFACE
      ?auto_1539839 - SURFACE
      ?auto_1539840 - SURFACE
    )
    :vars
    (
      ?auto_1539845 - HOIST
      ?auto_1539846 - PLACE
      ?auto_1539842 - PLACE
      ?auto_1539841 - HOIST
      ?auto_1539843 - SURFACE
      ?auto_1539844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539845 ?auto_1539846 ) ( SURFACE-AT ?auto_1539839 ?auto_1539846 ) ( CLEAR ?auto_1539839 ) ( IS-CRATE ?auto_1539840 ) ( not ( = ?auto_1539839 ?auto_1539840 ) ) ( AVAILABLE ?auto_1539845 ) ( ON ?auto_1539839 ?auto_1539838 ) ( not ( = ?auto_1539838 ?auto_1539839 ) ) ( not ( = ?auto_1539838 ?auto_1539840 ) ) ( not ( = ?auto_1539842 ?auto_1539846 ) ) ( HOIST-AT ?auto_1539841 ?auto_1539842 ) ( not ( = ?auto_1539845 ?auto_1539841 ) ) ( AVAILABLE ?auto_1539841 ) ( SURFACE-AT ?auto_1539840 ?auto_1539842 ) ( ON ?auto_1539840 ?auto_1539843 ) ( CLEAR ?auto_1539840 ) ( not ( = ?auto_1539839 ?auto_1539843 ) ) ( not ( = ?auto_1539840 ?auto_1539843 ) ) ( not ( = ?auto_1539838 ?auto_1539843 ) ) ( TRUCK-AT ?auto_1539844 ?auto_1539846 ) ( ON ?auto_1539830 ?auto_1539829 ) ( ON ?auto_1539831 ?auto_1539830 ) ( ON ?auto_1539833 ?auto_1539831 ) ( ON ?auto_1539832 ?auto_1539833 ) ( ON ?auto_1539834 ?auto_1539832 ) ( ON ?auto_1539835 ?auto_1539834 ) ( ON ?auto_1539836 ?auto_1539835 ) ( ON ?auto_1539837 ?auto_1539836 ) ( ON ?auto_1539838 ?auto_1539837 ) ( not ( = ?auto_1539829 ?auto_1539830 ) ) ( not ( = ?auto_1539829 ?auto_1539831 ) ) ( not ( = ?auto_1539829 ?auto_1539833 ) ) ( not ( = ?auto_1539829 ?auto_1539832 ) ) ( not ( = ?auto_1539829 ?auto_1539834 ) ) ( not ( = ?auto_1539829 ?auto_1539835 ) ) ( not ( = ?auto_1539829 ?auto_1539836 ) ) ( not ( = ?auto_1539829 ?auto_1539837 ) ) ( not ( = ?auto_1539829 ?auto_1539838 ) ) ( not ( = ?auto_1539829 ?auto_1539839 ) ) ( not ( = ?auto_1539829 ?auto_1539840 ) ) ( not ( = ?auto_1539829 ?auto_1539843 ) ) ( not ( = ?auto_1539830 ?auto_1539831 ) ) ( not ( = ?auto_1539830 ?auto_1539833 ) ) ( not ( = ?auto_1539830 ?auto_1539832 ) ) ( not ( = ?auto_1539830 ?auto_1539834 ) ) ( not ( = ?auto_1539830 ?auto_1539835 ) ) ( not ( = ?auto_1539830 ?auto_1539836 ) ) ( not ( = ?auto_1539830 ?auto_1539837 ) ) ( not ( = ?auto_1539830 ?auto_1539838 ) ) ( not ( = ?auto_1539830 ?auto_1539839 ) ) ( not ( = ?auto_1539830 ?auto_1539840 ) ) ( not ( = ?auto_1539830 ?auto_1539843 ) ) ( not ( = ?auto_1539831 ?auto_1539833 ) ) ( not ( = ?auto_1539831 ?auto_1539832 ) ) ( not ( = ?auto_1539831 ?auto_1539834 ) ) ( not ( = ?auto_1539831 ?auto_1539835 ) ) ( not ( = ?auto_1539831 ?auto_1539836 ) ) ( not ( = ?auto_1539831 ?auto_1539837 ) ) ( not ( = ?auto_1539831 ?auto_1539838 ) ) ( not ( = ?auto_1539831 ?auto_1539839 ) ) ( not ( = ?auto_1539831 ?auto_1539840 ) ) ( not ( = ?auto_1539831 ?auto_1539843 ) ) ( not ( = ?auto_1539833 ?auto_1539832 ) ) ( not ( = ?auto_1539833 ?auto_1539834 ) ) ( not ( = ?auto_1539833 ?auto_1539835 ) ) ( not ( = ?auto_1539833 ?auto_1539836 ) ) ( not ( = ?auto_1539833 ?auto_1539837 ) ) ( not ( = ?auto_1539833 ?auto_1539838 ) ) ( not ( = ?auto_1539833 ?auto_1539839 ) ) ( not ( = ?auto_1539833 ?auto_1539840 ) ) ( not ( = ?auto_1539833 ?auto_1539843 ) ) ( not ( = ?auto_1539832 ?auto_1539834 ) ) ( not ( = ?auto_1539832 ?auto_1539835 ) ) ( not ( = ?auto_1539832 ?auto_1539836 ) ) ( not ( = ?auto_1539832 ?auto_1539837 ) ) ( not ( = ?auto_1539832 ?auto_1539838 ) ) ( not ( = ?auto_1539832 ?auto_1539839 ) ) ( not ( = ?auto_1539832 ?auto_1539840 ) ) ( not ( = ?auto_1539832 ?auto_1539843 ) ) ( not ( = ?auto_1539834 ?auto_1539835 ) ) ( not ( = ?auto_1539834 ?auto_1539836 ) ) ( not ( = ?auto_1539834 ?auto_1539837 ) ) ( not ( = ?auto_1539834 ?auto_1539838 ) ) ( not ( = ?auto_1539834 ?auto_1539839 ) ) ( not ( = ?auto_1539834 ?auto_1539840 ) ) ( not ( = ?auto_1539834 ?auto_1539843 ) ) ( not ( = ?auto_1539835 ?auto_1539836 ) ) ( not ( = ?auto_1539835 ?auto_1539837 ) ) ( not ( = ?auto_1539835 ?auto_1539838 ) ) ( not ( = ?auto_1539835 ?auto_1539839 ) ) ( not ( = ?auto_1539835 ?auto_1539840 ) ) ( not ( = ?auto_1539835 ?auto_1539843 ) ) ( not ( = ?auto_1539836 ?auto_1539837 ) ) ( not ( = ?auto_1539836 ?auto_1539838 ) ) ( not ( = ?auto_1539836 ?auto_1539839 ) ) ( not ( = ?auto_1539836 ?auto_1539840 ) ) ( not ( = ?auto_1539836 ?auto_1539843 ) ) ( not ( = ?auto_1539837 ?auto_1539838 ) ) ( not ( = ?auto_1539837 ?auto_1539839 ) ) ( not ( = ?auto_1539837 ?auto_1539840 ) ) ( not ( = ?auto_1539837 ?auto_1539843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539838 ?auto_1539839 ?auto_1539840 )
      ( MAKE-11CRATE-VERIFY ?auto_1539829 ?auto_1539830 ?auto_1539831 ?auto_1539833 ?auto_1539832 ?auto_1539834 ?auto_1539835 ?auto_1539836 ?auto_1539837 ?auto_1539838 ?auto_1539839 ?auto_1539840 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1539973 - SURFACE
      ?auto_1539974 - SURFACE
      ?auto_1539975 - SURFACE
      ?auto_1539977 - SURFACE
      ?auto_1539976 - SURFACE
      ?auto_1539978 - SURFACE
      ?auto_1539979 - SURFACE
      ?auto_1539980 - SURFACE
      ?auto_1539981 - SURFACE
      ?auto_1539982 - SURFACE
      ?auto_1539983 - SURFACE
      ?auto_1539984 - SURFACE
    )
    :vars
    (
      ?auto_1539987 - HOIST
      ?auto_1539986 - PLACE
      ?auto_1539985 - PLACE
      ?auto_1539989 - HOIST
      ?auto_1539988 - SURFACE
      ?auto_1539990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539987 ?auto_1539986 ) ( IS-CRATE ?auto_1539984 ) ( not ( = ?auto_1539983 ?auto_1539984 ) ) ( not ( = ?auto_1539982 ?auto_1539983 ) ) ( not ( = ?auto_1539982 ?auto_1539984 ) ) ( not ( = ?auto_1539985 ?auto_1539986 ) ) ( HOIST-AT ?auto_1539989 ?auto_1539985 ) ( not ( = ?auto_1539987 ?auto_1539989 ) ) ( AVAILABLE ?auto_1539989 ) ( SURFACE-AT ?auto_1539984 ?auto_1539985 ) ( ON ?auto_1539984 ?auto_1539988 ) ( CLEAR ?auto_1539984 ) ( not ( = ?auto_1539983 ?auto_1539988 ) ) ( not ( = ?auto_1539984 ?auto_1539988 ) ) ( not ( = ?auto_1539982 ?auto_1539988 ) ) ( TRUCK-AT ?auto_1539990 ?auto_1539986 ) ( SURFACE-AT ?auto_1539982 ?auto_1539986 ) ( CLEAR ?auto_1539982 ) ( LIFTING ?auto_1539987 ?auto_1539983 ) ( IS-CRATE ?auto_1539983 ) ( ON ?auto_1539974 ?auto_1539973 ) ( ON ?auto_1539975 ?auto_1539974 ) ( ON ?auto_1539977 ?auto_1539975 ) ( ON ?auto_1539976 ?auto_1539977 ) ( ON ?auto_1539978 ?auto_1539976 ) ( ON ?auto_1539979 ?auto_1539978 ) ( ON ?auto_1539980 ?auto_1539979 ) ( ON ?auto_1539981 ?auto_1539980 ) ( ON ?auto_1539982 ?auto_1539981 ) ( not ( = ?auto_1539973 ?auto_1539974 ) ) ( not ( = ?auto_1539973 ?auto_1539975 ) ) ( not ( = ?auto_1539973 ?auto_1539977 ) ) ( not ( = ?auto_1539973 ?auto_1539976 ) ) ( not ( = ?auto_1539973 ?auto_1539978 ) ) ( not ( = ?auto_1539973 ?auto_1539979 ) ) ( not ( = ?auto_1539973 ?auto_1539980 ) ) ( not ( = ?auto_1539973 ?auto_1539981 ) ) ( not ( = ?auto_1539973 ?auto_1539982 ) ) ( not ( = ?auto_1539973 ?auto_1539983 ) ) ( not ( = ?auto_1539973 ?auto_1539984 ) ) ( not ( = ?auto_1539973 ?auto_1539988 ) ) ( not ( = ?auto_1539974 ?auto_1539975 ) ) ( not ( = ?auto_1539974 ?auto_1539977 ) ) ( not ( = ?auto_1539974 ?auto_1539976 ) ) ( not ( = ?auto_1539974 ?auto_1539978 ) ) ( not ( = ?auto_1539974 ?auto_1539979 ) ) ( not ( = ?auto_1539974 ?auto_1539980 ) ) ( not ( = ?auto_1539974 ?auto_1539981 ) ) ( not ( = ?auto_1539974 ?auto_1539982 ) ) ( not ( = ?auto_1539974 ?auto_1539983 ) ) ( not ( = ?auto_1539974 ?auto_1539984 ) ) ( not ( = ?auto_1539974 ?auto_1539988 ) ) ( not ( = ?auto_1539975 ?auto_1539977 ) ) ( not ( = ?auto_1539975 ?auto_1539976 ) ) ( not ( = ?auto_1539975 ?auto_1539978 ) ) ( not ( = ?auto_1539975 ?auto_1539979 ) ) ( not ( = ?auto_1539975 ?auto_1539980 ) ) ( not ( = ?auto_1539975 ?auto_1539981 ) ) ( not ( = ?auto_1539975 ?auto_1539982 ) ) ( not ( = ?auto_1539975 ?auto_1539983 ) ) ( not ( = ?auto_1539975 ?auto_1539984 ) ) ( not ( = ?auto_1539975 ?auto_1539988 ) ) ( not ( = ?auto_1539977 ?auto_1539976 ) ) ( not ( = ?auto_1539977 ?auto_1539978 ) ) ( not ( = ?auto_1539977 ?auto_1539979 ) ) ( not ( = ?auto_1539977 ?auto_1539980 ) ) ( not ( = ?auto_1539977 ?auto_1539981 ) ) ( not ( = ?auto_1539977 ?auto_1539982 ) ) ( not ( = ?auto_1539977 ?auto_1539983 ) ) ( not ( = ?auto_1539977 ?auto_1539984 ) ) ( not ( = ?auto_1539977 ?auto_1539988 ) ) ( not ( = ?auto_1539976 ?auto_1539978 ) ) ( not ( = ?auto_1539976 ?auto_1539979 ) ) ( not ( = ?auto_1539976 ?auto_1539980 ) ) ( not ( = ?auto_1539976 ?auto_1539981 ) ) ( not ( = ?auto_1539976 ?auto_1539982 ) ) ( not ( = ?auto_1539976 ?auto_1539983 ) ) ( not ( = ?auto_1539976 ?auto_1539984 ) ) ( not ( = ?auto_1539976 ?auto_1539988 ) ) ( not ( = ?auto_1539978 ?auto_1539979 ) ) ( not ( = ?auto_1539978 ?auto_1539980 ) ) ( not ( = ?auto_1539978 ?auto_1539981 ) ) ( not ( = ?auto_1539978 ?auto_1539982 ) ) ( not ( = ?auto_1539978 ?auto_1539983 ) ) ( not ( = ?auto_1539978 ?auto_1539984 ) ) ( not ( = ?auto_1539978 ?auto_1539988 ) ) ( not ( = ?auto_1539979 ?auto_1539980 ) ) ( not ( = ?auto_1539979 ?auto_1539981 ) ) ( not ( = ?auto_1539979 ?auto_1539982 ) ) ( not ( = ?auto_1539979 ?auto_1539983 ) ) ( not ( = ?auto_1539979 ?auto_1539984 ) ) ( not ( = ?auto_1539979 ?auto_1539988 ) ) ( not ( = ?auto_1539980 ?auto_1539981 ) ) ( not ( = ?auto_1539980 ?auto_1539982 ) ) ( not ( = ?auto_1539980 ?auto_1539983 ) ) ( not ( = ?auto_1539980 ?auto_1539984 ) ) ( not ( = ?auto_1539980 ?auto_1539988 ) ) ( not ( = ?auto_1539981 ?auto_1539982 ) ) ( not ( = ?auto_1539981 ?auto_1539983 ) ) ( not ( = ?auto_1539981 ?auto_1539984 ) ) ( not ( = ?auto_1539981 ?auto_1539988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1539982 ?auto_1539983 ?auto_1539984 )
      ( MAKE-11CRATE-VERIFY ?auto_1539973 ?auto_1539974 ?auto_1539975 ?auto_1539977 ?auto_1539976 ?auto_1539978 ?auto_1539979 ?auto_1539980 ?auto_1539981 ?auto_1539982 ?auto_1539983 ?auto_1539984 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540117 - SURFACE
      ?auto_1540118 - SURFACE
      ?auto_1540119 - SURFACE
      ?auto_1540121 - SURFACE
      ?auto_1540120 - SURFACE
      ?auto_1540122 - SURFACE
      ?auto_1540123 - SURFACE
      ?auto_1540124 - SURFACE
      ?auto_1540125 - SURFACE
      ?auto_1540126 - SURFACE
      ?auto_1540127 - SURFACE
      ?auto_1540128 - SURFACE
    )
    :vars
    (
      ?auto_1540132 - HOIST
      ?auto_1540129 - PLACE
      ?auto_1540133 - PLACE
      ?auto_1540131 - HOIST
      ?auto_1540134 - SURFACE
      ?auto_1540130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540132 ?auto_1540129 ) ( IS-CRATE ?auto_1540128 ) ( not ( = ?auto_1540127 ?auto_1540128 ) ) ( not ( = ?auto_1540126 ?auto_1540127 ) ) ( not ( = ?auto_1540126 ?auto_1540128 ) ) ( not ( = ?auto_1540133 ?auto_1540129 ) ) ( HOIST-AT ?auto_1540131 ?auto_1540133 ) ( not ( = ?auto_1540132 ?auto_1540131 ) ) ( AVAILABLE ?auto_1540131 ) ( SURFACE-AT ?auto_1540128 ?auto_1540133 ) ( ON ?auto_1540128 ?auto_1540134 ) ( CLEAR ?auto_1540128 ) ( not ( = ?auto_1540127 ?auto_1540134 ) ) ( not ( = ?auto_1540128 ?auto_1540134 ) ) ( not ( = ?auto_1540126 ?auto_1540134 ) ) ( TRUCK-AT ?auto_1540130 ?auto_1540129 ) ( SURFACE-AT ?auto_1540126 ?auto_1540129 ) ( CLEAR ?auto_1540126 ) ( IS-CRATE ?auto_1540127 ) ( AVAILABLE ?auto_1540132 ) ( IN ?auto_1540127 ?auto_1540130 ) ( ON ?auto_1540118 ?auto_1540117 ) ( ON ?auto_1540119 ?auto_1540118 ) ( ON ?auto_1540121 ?auto_1540119 ) ( ON ?auto_1540120 ?auto_1540121 ) ( ON ?auto_1540122 ?auto_1540120 ) ( ON ?auto_1540123 ?auto_1540122 ) ( ON ?auto_1540124 ?auto_1540123 ) ( ON ?auto_1540125 ?auto_1540124 ) ( ON ?auto_1540126 ?auto_1540125 ) ( not ( = ?auto_1540117 ?auto_1540118 ) ) ( not ( = ?auto_1540117 ?auto_1540119 ) ) ( not ( = ?auto_1540117 ?auto_1540121 ) ) ( not ( = ?auto_1540117 ?auto_1540120 ) ) ( not ( = ?auto_1540117 ?auto_1540122 ) ) ( not ( = ?auto_1540117 ?auto_1540123 ) ) ( not ( = ?auto_1540117 ?auto_1540124 ) ) ( not ( = ?auto_1540117 ?auto_1540125 ) ) ( not ( = ?auto_1540117 ?auto_1540126 ) ) ( not ( = ?auto_1540117 ?auto_1540127 ) ) ( not ( = ?auto_1540117 ?auto_1540128 ) ) ( not ( = ?auto_1540117 ?auto_1540134 ) ) ( not ( = ?auto_1540118 ?auto_1540119 ) ) ( not ( = ?auto_1540118 ?auto_1540121 ) ) ( not ( = ?auto_1540118 ?auto_1540120 ) ) ( not ( = ?auto_1540118 ?auto_1540122 ) ) ( not ( = ?auto_1540118 ?auto_1540123 ) ) ( not ( = ?auto_1540118 ?auto_1540124 ) ) ( not ( = ?auto_1540118 ?auto_1540125 ) ) ( not ( = ?auto_1540118 ?auto_1540126 ) ) ( not ( = ?auto_1540118 ?auto_1540127 ) ) ( not ( = ?auto_1540118 ?auto_1540128 ) ) ( not ( = ?auto_1540118 ?auto_1540134 ) ) ( not ( = ?auto_1540119 ?auto_1540121 ) ) ( not ( = ?auto_1540119 ?auto_1540120 ) ) ( not ( = ?auto_1540119 ?auto_1540122 ) ) ( not ( = ?auto_1540119 ?auto_1540123 ) ) ( not ( = ?auto_1540119 ?auto_1540124 ) ) ( not ( = ?auto_1540119 ?auto_1540125 ) ) ( not ( = ?auto_1540119 ?auto_1540126 ) ) ( not ( = ?auto_1540119 ?auto_1540127 ) ) ( not ( = ?auto_1540119 ?auto_1540128 ) ) ( not ( = ?auto_1540119 ?auto_1540134 ) ) ( not ( = ?auto_1540121 ?auto_1540120 ) ) ( not ( = ?auto_1540121 ?auto_1540122 ) ) ( not ( = ?auto_1540121 ?auto_1540123 ) ) ( not ( = ?auto_1540121 ?auto_1540124 ) ) ( not ( = ?auto_1540121 ?auto_1540125 ) ) ( not ( = ?auto_1540121 ?auto_1540126 ) ) ( not ( = ?auto_1540121 ?auto_1540127 ) ) ( not ( = ?auto_1540121 ?auto_1540128 ) ) ( not ( = ?auto_1540121 ?auto_1540134 ) ) ( not ( = ?auto_1540120 ?auto_1540122 ) ) ( not ( = ?auto_1540120 ?auto_1540123 ) ) ( not ( = ?auto_1540120 ?auto_1540124 ) ) ( not ( = ?auto_1540120 ?auto_1540125 ) ) ( not ( = ?auto_1540120 ?auto_1540126 ) ) ( not ( = ?auto_1540120 ?auto_1540127 ) ) ( not ( = ?auto_1540120 ?auto_1540128 ) ) ( not ( = ?auto_1540120 ?auto_1540134 ) ) ( not ( = ?auto_1540122 ?auto_1540123 ) ) ( not ( = ?auto_1540122 ?auto_1540124 ) ) ( not ( = ?auto_1540122 ?auto_1540125 ) ) ( not ( = ?auto_1540122 ?auto_1540126 ) ) ( not ( = ?auto_1540122 ?auto_1540127 ) ) ( not ( = ?auto_1540122 ?auto_1540128 ) ) ( not ( = ?auto_1540122 ?auto_1540134 ) ) ( not ( = ?auto_1540123 ?auto_1540124 ) ) ( not ( = ?auto_1540123 ?auto_1540125 ) ) ( not ( = ?auto_1540123 ?auto_1540126 ) ) ( not ( = ?auto_1540123 ?auto_1540127 ) ) ( not ( = ?auto_1540123 ?auto_1540128 ) ) ( not ( = ?auto_1540123 ?auto_1540134 ) ) ( not ( = ?auto_1540124 ?auto_1540125 ) ) ( not ( = ?auto_1540124 ?auto_1540126 ) ) ( not ( = ?auto_1540124 ?auto_1540127 ) ) ( not ( = ?auto_1540124 ?auto_1540128 ) ) ( not ( = ?auto_1540124 ?auto_1540134 ) ) ( not ( = ?auto_1540125 ?auto_1540126 ) ) ( not ( = ?auto_1540125 ?auto_1540127 ) ) ( not ( = ?auto_1540125 ?auto_1540128 ) ) ( not ( = ?auto_1540125 ?auto_1540134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540126 ?auto_1540127 ?auto_1540128 )
      ( MAKE-11CRATE-VERIFY ?auto_1540117 ?auto_1540118 ?auto_1540119 ?auto_1540121 ?auto_1540120 ?auto_1540122 ?auto_1540123 ?auto_1540124 ?auto_1540125 ?auto_1540126 ?auto_1540127 ?auto_1540128 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1549408 - SURFACE
      ?auto_1549409 - SURFACE
      ?auto_1549410 - SURFACE
      ?auto_1549412 - SURFACE
      ?auto_1549411 - SURFACE
      ?auto_1549413 - SURFACE
      ?auto_1549414 - SURFACE
      ?auto_1549415 - SURFACE
      ?auto_1549416 - SURFACE
      ?auto_1549417 - SURFACE
      ?auto_1549418 - SURFACE
      ?auto_1549419 - SURFACE
      ?auto_1549420 - SURFACE
    )
    :vars
    (
      ?auto_1549422 - HOIST
      ?auto_1549421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1549422 ?auto_1549421 ) ( SURFACE-AT ?auto_1549419 ?auto_1549421 ) ( CLEAR ?auto_1549419 ) ( LIFTING ?auto_1549422 ?auto_1549420 ) ( IS-CRATE ?auto_1549420 ) ( not ( = ?auto_1549419 ?auto_1549420 ) ) ( ON ?auto_1549409 ?auto_1549408 ) ( ON ?auto_1549410 ?auto_1549409 ) ( ON ?auto_1549412 ?auto_1549410 ) ( ON ?auto_1549411 ?auto_1549412 ) ( ON ?auto_1549413 ?auto_1549411 ) ( ON ?auto_1549414 ?auto_1549413 ) ( ON ?auto_1549415 ?auto_1549414 ) ( ON ?auto_1549416 ?auto_1549415 ) ( ON ?auto_1549417 ?auto_1549416 ) ( ON ?auto_1549418 ?auto_1549417 ) ( ON ?auto_1549419 ?auto_1549418 ) ( not ( = ?auto_1549408 ?auto_1549409 ) ) ( not ( = ?auto_1549408 ?auto_1549410 ) ) ( not ( = ?auto_1549408 ?auto_1549412 ) ) ( not ( = ?auto_1549408 ?auto_1549411 ) ) ( not ( = ?auto_1549408 ?auto_1549413 ) ) ( not ( = ?auto_1549408 ?auto_1549414 ) ) ( not ( = ?auto_1549408 ?auto_1549415 ) ) ( not ( = ?auto_1549408 ?auto_1549416 ) ) ( not ( = ?auto_1549408 ?auto_1549417 ) ) ( not ( = ?auto_1549408 ?auto_1549418 ) ) ( not ( = ?auto_1549408 ?auto_1549419 ) ) ( not ( = ?auto_1549408 ?auto_1549420 ) ) ( not ( = ?auto_1549409 ?auto_1549410 ) ) ( not ( = ?auto_1549409 ?auto_1549412 ) ) ( not ( = ?auto_1549409 ?auto_1549411 ) ) ( not ( = ?auto_1549409 ?auto_1549413 ) ) ( not ( = ?auto_1549409 ?auto_1549414 ) ) ( not ( = ?auto_1549409 ?auto_1549415 ) ) ( not ( = ?auto_1549409 ?auto_1549416 ) ) ( not ( = ?auto_1549409 ?auto_1549417 ) ) ( not ( = ?auto_1549409 ?auto_1549418 ) ) ( not ( = ?auto_1549409 ?auto_1549419 ) ) ( not ( = ?auto_1549409 ?auto_1549420 ) ) ( not ( = ?auto_1549410 ?auto_1549412 ) ) ( not ( = ?auto_1549410 ?auto_1549411 ) ) ( not ( = ?auto_1549410 ?auto_1549413 ) ) ( not ( = ?auto_1549410 ?auto_1549414 ) ) ( not ( = ?auto_1549410 ?auto_1549415 ) ) ( not ( = ?auto_1549410 ?auto_1549416 ) ) ( not ( = ?auto_1549410 ?auto_1549417 ) ) ( not ( = ?auto_1549410 ?auto_1549418 ) ) ( not ( = ?auto_1549410 ?auto_1549419 ) ) ( not ( = ?auto_1549410 ?auto_1549420 ) ) ( not ( = ?auto_1549412 ?auto_1549411 ) ) ( not ( = ?auto_1549412 ?auto_1549413 ) ) ( not ( = ?auto_1549412 ?auto_1549414 ) ) ( not ( = ?auto_1549412 ?auto_1549415 ) ) ( not ( = ?auto_1549412 ?auto_1549416 ) ) ( not ( = ?auto_1549412 ?auto_1549417 ) ) ( not ( = ?auto_1549412 ?auto_1549418 ) ) ( not ( = ?auto_1549412 ?auto_1549419 ) ) ( not ( = ?auto_1549412 ?auto_1549420 ) ) ( not ( = ?auto_1549411 ?auto_1549413 ) ) ( not ( = ?auto_1549411 ?auto_1549414 ) ) ( not ( = ?auto_1549411 ?auto_1549415 ) ) ( not ( = ?auto_1549411 ?auto_1549416 ) ) ( not ( = ?auto_1549411 ?auto_1549417 ) ) ( not ( = ?auto_1549411 ?auto_1549418 ) ) ( not ( = ?auto_1549411 ?auto_1549419 ) ) ( not ( = ?auto_1549411 ?auto_1549420 ) ) ( not ( = ?auto_1549413 ?auto_1549414 ) ) ( not ( = ?auto_1549413 ?auto_1549415 ) ) ( not ( = ?auto_1549413 ?auto_1549416 ) ) ( not ( = ?auto_1549413 ?auto_1549417 ) ) ( not ( = ?auto_1549413 ?auto_1549418 ) ) ( not ( = ?auto_1549413 ?auto_1549419 ) ) ( not ( = ?auto_1549413 ?auto_1549420 ) ) ( not ( = ?auto_1549414 ?auto_1549415 ) ) ( not ( = ?auto_1549414 ?auto_1549416 ) ) ( not ( = ?auto_1549414 ?auto_1549417 ) ) ( not ( = ?auto_1549414 ?auto_1549418 ) ) ( not ( = ?auto_1549414 ?auto_1549419 ) ) ( not ( = ?auto_1549414 ?auto_1549420 ) ) ( not ( = ?auto_1549415 ?auto_1549416 ) ) ( not ( = ?auto_1549415 ?auto_1549417 ) ) ( not ( = ?auto_1549415 ?auto_1549418 ) ) ( not ( = ?auto_1549415 ?auto_1549419 ) ) ( not ( = ?auto_1549415 ?auto_1549420 ) ) ( not ( = ?auto_1549416 ?auto_1549417 ) ) ( not ( = ?auto_1549416 ?auto_1549418 ) ) ( not ( = ?auto_1549416 ?auto_1549419 ) ) ( not ( = ?auto_1549416 ?auto_1549420 ) ) ( not ( = ?auto_1549417 ?auto_1549418 ) ) ( not ( = ?auto_1549417 ?auto_1549419 ) ) ( not ( = ?auto_1549417 ?auto_1549420 ) ) ( not ( = ?auto_1549418 ?auto_1549419 ) ) ( not ( = ?auto_1549418 ?auto_1549420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1549419 ?auto_1549420 )
      ( MAKE-12CRATE-VERIFY ?auto_1549408 ?auto_1549409 ?auto_1549410 ?auto_1549412 ?auto_1549411 ?auto_1549413 ?auto_1549414 ?auto_1549415 ?auto_1549416 ?auto_1549417 ?auto_1549418 ?auto_1549419 ?auto_1549420 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1549533 - SURFACE
      ?auto_1549534 - SURFACE
      ?auto_1549535 - SURFACE
      ?auto_1549537 - SURFACE
      ?auto_1549536 - SURFACE
      ?auto_1549538 - SURFACE
      ?auto_1549539 - SURFACE
      ?auto_1549540 - SURFACE
      ?auto_1549541 - SURFACE
      ?auto_1549542 - SURFACE
      ?auto_1549543 - SURFACE
      ?auto_1549544 - SURFACE
      ?auto_1549545 - SURFACE
    )
    :vars
    (
      ?auto_1549546 - HOIST
      ?auto_1549547 - PLACE
      ?auto_1549548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1549546 ?auto_1549547 ) ( SURFACE-AT ?auto_1549544 ?auto_1549547 ) ( CLEAR ?auto_1549544 ) ( IS-CRATE ?auto_1549545 ) ( not ( = ?auto_1549544 ?auto_1549545 ) ) ( TRUCK-AT ?auto_1549548 ?auto_1549547 ) ( AVAILABLE ?auto_1549546 ) ( IN ?auto_1549545 ?auto_1549548 ) ( ON ?auto_1549544 ?auto_1549543 ) ( not ( = ?auto_1549543 ?auto_1549544 ) ) ( not ( = ?auto_1549543 ?auto_1549545 ) ) ( ON ?auto_1549534 ?auto_1549533 ) ( ON ?auto_1549535 ?auto_1549534 ) ( ON ?auto_1549537 ?auto_1549535 ) ( ON ?auto_1549536 ?auto_1549537 ) ( ON ?auto_1549538 ?auto_1549536 ) ( ON ?auto_1549539 ?auto_1549538 ) ( ON ?auto_1549540 ?auto_1549539 ) ( ON ?auto_1549541 ?auto_1549540 ) ( ON ?auto_1549542 ?auto_1549541 ) ( ON ?auto_1549543 ?auto_1549542 ) ( not ( = ?auto_1549533 ?auto_1549534 ) ) ( not ( = ?auto_1549533 ?auto_1549535 ) ) ( not ( = ?auto_1549533 ?auto_1549537 ) ) ( not ( = ?auto_1549533 ?auto_1549536 ) ) ( not ( = ?auto_1549533 ?auto_1549538 ) ) ( not ( = ?auto_1549533 ?auto_1549539 ) ) ( not ( = ?auto_1549533 ?auto_1549540 ) ) ( not ( = ?auto_1549533 ?auto_1549541 ) ) ( not ( = ?auto_1549533 ?auto_1549542 ) ) ( not ( = ?auto_1549533 ?auto_1549543 ) ) ( not ( = ?auto_1549533 ?auto_1549544 ) ) ( not ( = ?auto_1549533 ?auto_1549545 ) ) ( not ( = ?auto_1549534 ?auto_1549535 ) ) ( not ( = ?auto_1549534 ?auto_1549537 ) ) ( not ( = ?auto_1549534 ?auto_1549536 ) ) ( not ( = ?auto_1549534 ?auto_1549538 ) ) ( not ( = ?auto_1549534 ?auto_1549539 ) ) ( not ( = ?auto_1549534 ?auto_1549540 ) ) ( not ( = ?auto_1549534 ?auto_1549541 ) ) ( not ( = ?auto_1549534 ?auto_1549542 ) ) ( not ( = ?auto_1549534 ?auto_1549543 ) ) ( not ( = ?auto_1549534 ?auto_1549544 ) ) ( not ( = ?auto_1549534 ?auto_1549545 ) ) ( not ( = ?auto_1549535 ?auto_1549537 ) ) ( not ( = ?auto_1549535 ?auto_1549536 ) ) ( not ( = ?auto_1549535 ?auto_1549538 ) ) ( not ( = ?auto_1549535 ?auto_1549539 ) ) ( not ( = ?auto_1549535 ?auto_1549540 ) ) ( not ( = ?auto_1549535 ?auto_1549541 ) ) ( not ( = ?auto_1549535 ?auto_1549542 ) ) ( not ( = ?auto_1549535 ?auto_1549543 ) ) ( not ( = ?auto_1549535 ?auto_1549544 ) ) ( not ( = ?auto_1549535 ?auto_1549545 ) ) ( not ( = ?auto_1549537 ?auto_1549536 ) ) ( not ( = ?auto_1549537 ?auto_1549538 ) ) ( not ( = ?auto_1549537 ?auto_1549539 ) ) ( not ( = ?auto_1549537 ?auto_1549540 ) ) ( not ( = ?auto_1549537 ?auto_1549541 ) ) ( not ( = ?auto_1549537 ?auto_1549542 ) ) ( not ( = ?auto_1549537 ?auto_1549543 ) ) ( not ( = ?auto_1549537 ?auto_1549544 ) ) ( not ( = ?auto_1549537 ?auto_1549545 ) ) ( not ( = ?auto_1549536 ?auto_1549538 ) ) ( not ( = ?auto_1549536 ?auto_1549539 ) ) ( not ( = ?auto_1549536 ?auto_1549540 ) ) ( not ( = ?auto_1549536 ?auto_1549541 ) ) ( not ( = ?auto_1549536 ?auto_1549542 ) ) ( not ( = ?auto_1549536 ?auto_1549543 ) ) ( not ( = ?auto_1549536 ?auto_1549544 ) ) ( not ( = ?auto_1549536 ?auto_1549545 ) ) ( not ( = ?auto_1549538 ?auto_1549539 ) ) ( not ( = ?auto_1549538 ?auto_1549540 ) ) ( not ( = ?auto_1549538 ?auto_1549541 ) ) ( not ( = ?auto_1549538 ?auto_1549542 ) ) ( not ( = ?auto_1549538 ?auto_1549543 ) ) ( not ( = ?auto_1549538 ?auto_1549544 ) ) ( not ( = ?auto_1549538 ?auto_1549545 ) ) ( not ( = ?auto_1549539 ?auto_1549540 ) ) ( not ( = ?auto_1549539 ?auto_1549541 ) ) ( not ( = ?auto_1549539 ?auto_1549542 ) ) ( not ( = ?auto_1549539 ?auto_1549543 ) ) ( not ( = ?auto_1549539 ?auto_1549544 ) ) ( not ( = ?auto_1549539 ?auto_1549545 ) ) ( not ( = ?auto_1549540 ?auto_1549541 ) ) ( not ( = ?auto_1549540 ?auto_1549542 ) ) ( not ( = ?auto_1549540 ?auto_1549543 ) ) ( not ( = ?auto_1549540 ?auto_1549544 ) ) ( not ( = ?auto_1549540 ?auto_1549545 ) ) ( not ( = ?auto_1549541 ?auto_1549542 ) ) ( not ( = ?auto_1549541 ?auto_1549543 ) ) ( not ( = ?auto_1549541 ?auto_1549544 ) ) ( not ( = ?auto_1549541 ?auto_1549545 ) ) ( not ( = ?auto_1549542 ?auto_1549543 ) ) ( not ( = ?auto_1549542 ?auto_1549544 ) ) ( not ( = ?auto_1549542 ?auto_1549545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1549543 ?auto_1549544 ?auto_1549545 )
      ( MAKE-12CRATE-VERIFY ?auto_1549533 ?auto_1549534 ?auto_1549535 ?auto_1549537 ?auto_1549536 ?auto_1549538 ?auto_1549539 ?auto_1549540 ?auto_1549541 ?auto_1549542 ?auto_1549543 ?auto_1549544 ?auto_1549545 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1549671 - SURFACE
      ?auto_1549672 - SURFACE
      ?auto_1549673 - SURFACE
      ?auto_1549675 - SURFACE
      ?auto_1549674 - SURFACE
      ?auto_1549676 - SURFACE
      ?auto_1549677 - SURFACE
      ?auto_1549678 - SURFACE
      ?auto_1549679 - SURFACE
      ?auto_1549680 - SURFACE
      ?auto_1549681 - SURFACE
      ?auto_1549682 - SURFACE
      ?auto_1549683 - SURFACE
    )
    :vars
    (
      ?auto_1549687 - HOIST
      ?auto_1549684 - PLACE
      ?auto_1549685 - TRUCK
      ?auto_1549686 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1549687 ?auto_1549684 ) ( SURFACE-AT ?auto_1549682 ?auto_1549684 ) ( CLEAR ?auto_1549682 ) ( IS-CRATE ?auto_1549683 ) ( not ( = ?auto_1549682 ?auto_1549683 ) ) ( AVAILABLE ?auto_1549687 ) ( IN ?auto_1549683 ?auto_1549685 ) ( ON ?auto_1549682 ?auto_1549681 ) ( not ( = ?auto_1549681 ?auto_1549682 ) ) ( not ( = ?auto_1549681 ?auto_1549683 ) ) ( TRUCK-AT ?auto_1549685 ?auto_1549686 ) ( not ( = ?auto_1549686 ?auto_1549684 ) ) ( ON ?auto_1549672 ?auto_1549671 ) ( ON ?auto_1549673 ?auto_1549672 ) ( ON ?auto_1549675 ?auto_1549673 ) ( ON ?auto_1549674 ?auto_1549675 ) ( ON ?auto_1549676 ?auto_1549674 ) ( ON ?auto_1549677 ?auto_1549676 ) ( ON ?auto_1549678 ?auto_1549677 ) ( ON ?auto_1549679 ?auto_1549678 ) ( ON ?auto_1549680 ?auto_1549679 ) ( ON ?auto_1549681 ?auto_1549680 ) ( not ( = ?auto_1549671 ?auto_1549672 ) ) ( not ( = ?auto_1549671 ?auto_1549673 ) ) ( not ( = ?auto_1549671 ?auto_1549675 ) ) ( not ( = ?auto_1549671 ?auto_1549674 ) ) ( not ( = ?auto_1549671 ?auto_1549676 ) ) ( not ( = ?auto_1549671 ?auto_1549677 ) ) ( not ( = ?auto_1549671 ?auto_1549678 ) ) ( not ( = ?auto_1549671 ?auto_1549679 ) ) ( not ( = ?auto_1549671 ?auto_1549680 ) ) ( not ( = ?auto_1549671 ?auto_1549681 ) ) ( not ( = ?auto_1549671 ?auto_1549682 ) ) ( not ( = ?auto_1549671 ?auto_1549683 ) ) ( not ( = ?auto_1549672 ?auto_1549673 ) ) ( not ( = ?auto_1549672 ?auto_1549675 ) ) ( not ( = ?auto_1549672 ?auto_1549674 ) ) ( not ( = ?auto_1549672 ?auto_1549676 ) ) ( not ( = ?auto_1549672 ?auto_1549677 ) ) ( not ( = ?auto_1549672 ?auto_1549678 ) ) ( not ( = ?auto_1549672 ?auto_1549679 ) ) ( not ( = ?auto_1549672 ?auto_1549680 ) ) ( not ( = ?auto_1549672 ?auto_1549681 ) ) ( not ( = ?auto_1549672 ?auto_1549682 ) ) ( not ( = ?auto_1549672 ?auto_1549683 ) ) ( not ( = ?auto_1549673 ?auto_1549675 ) ) ( not ( = ?auto_1549673 ?auto_1549674 ) ) ( not ( = ?auto_1549673 ?auto_1549676 ) ) ( not ( = ?auto_1549673 ?auto_1549677 ) ) ( not ( = ?auto_1549673 ?auto_1549678 ) ) ( not ( = ?auto_1549673 ?auto_1549679 ) ) ( not ( = ?auto_1549673 ?auto_1549680 ) ) ( not ( = ?auto_1549673 ?auto_1549681 ) ) ( not ( = ?auto_1549673 ?auto_1549682 ) ) ( not ( = ?auto_1549673 ?auto_1549683 ) ) ( not ( = ?auto_1549675 ?auto_1549674 ) ) ( not ( = ?auto_1549675 ?auto_1549676 ) ) ( not ( = ?auto_1549675 ?auto_1549677 ) ) ( not ( = ?auto_1549675 ?auto_1549678 ) ) ( not ( = ?auto_1549675 ?auto_1549679 ) ) ( not ( = ?auto_1549675 ?auto_1549680 ) ) ( not ( = ?auto_1549675 ?auto_1549681 ) ) ( not ( = ?auto_1549675 ?auto_1549682 ) ) ( not ( = ?auto_1549675 ?auto_1549683 ) ) ( not ( = ?auto_1549674 ?auto_1549676 ) ) ( not ( = ?auto_1549674 ?auto_1549677 ) ) ( not ( = ?auto_1549674 ?auto_1549678 ) ) ( not ( = ?auto_1549674 ?auto_1549679 ) ) ( not ( = ?auto_1549674 ?auto_1549680 ) ) ( not ( = ?auto_1549674 ?auto_1549681 ) ) ( not ( = ?auto_1549674 ?auto_1549682 ) ) ( not ( = ?auto_1549674 ?auto_1549683 ) ) ( not ( = ?auto_1549676 ?auto_1549677 ) ) ( not ( = ?auto_1549676 ?auto_1549678 ) ) ( not ( = ?auto_1549676 ?auto_1549679 ) ) ( not ( = ?auto_1549676 ?auto_1549680 ) ) ( not ( = ?auto_1549676 ?auto_1549681 ) ) ( not ( = ?auto_1549676 ?auto_1549682 ) ) ( not ( = ?auto_1549676 ?auto_1549683 ) ) ( not ( = ?auto_1549677 ?auto_1549678 ) ) ( not ( = ?auto_1549677 ?auto_1549679 ) ) ( not ( = ?auto_1549677 ?auto_1549680 ) ) ( not ( = ?auto_1549677 ?auto_1549681 ) ) ( not ( = ?auto_1549677 ?auto_1549682 ) ) ( not ( = ?auto_1549677 ?auto_1549683 ) ) ( not ( = ?auto_1549678 ?auto_1549679 ) ) ( not ( = ?auto_1549678 ?auto_1549680 ) ) ( not ( = ?auto_1549678 ?auto_1549681 ) ) ( not ( = ?auto_1549678 ?auto_1549682 ) ) ( not ( = ?auto_1549678 ?auto_1549683 ) ) ( not ( = ?auto_1549679 ?auto_1549680 ) ) ( not ( = ?auto_1549679 ?auto_1549681 ) ) ( not ( = ?auto_1549679 ?auto_1549682 ) ) ( not ( = ?auto_1549679 ?auto_1549683 ) ) ( not ( = ?auto_1549680 ?auto_1549681 ) ) ( not ( = ?auto_1549680 ?auto_1549682 ) ) ( not ( = ?auto_1549680 ?auto_1549683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1549681 ?auto_1549682 ?auto_1549683 )
      ( MAKE-12CRATE-VERIFY ?auto_1549671 ?auto_1549672 ?auto_1549673 ?auto_1549675 ?auto_1549674 ?auto_1549676 ?auto_1549677 ?auto_1549678 ?auto_1549679 ?auto_1549680 ?auto_1549681 ?auto_1549682 ?auto_1549683 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1549821 - SURFACE
      ?auto_1549822 - SURFACE
      ?auto_1549823 - SURFACE
      ?auto_1549825 - SURFACE
      ?auto_1549824 - SURFACE
      ?auto_1549826 - SURFACE
      ?auto_1549827 - SURFACE
      ?auto_1549828 - SURFACE
      ?auto_1549829 - SURFACE
      ?auto_1549830 - SURFACE
      ?auto_1549831 - SURFACE
      ?auto_1549832 - SURFACE
      ?auto_1549833 - SURFACE
    )
    :vars
    (
      ?auto_1549834 - HOIST
      ?auto_1549837 - PLACE
      ?auto_1549838 - TRUCK
      ?auto_1549836 - PLACE
      ?auto_1549835 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1549834 ?auto_1549837 ) ( SURFACE-AT ?auto_1549832 ?auto_1549837 ) ( CLEAR ?auto_1549832 ) ( IS-CRATE ?auto_1549833 ) ( not ( = ?auto_1549832 ?auto_1549833 ) ) ( AVAILABLE ?auto_1549834 ) ( ON ?auto_1549832 ?auto_1549831 ) ( not ( = ?auto_1549831 ?auto_1549832 ) ) ( not ( = ?auto_1549831 ?auto_1549833 ) ) ( TRUCK-AT ?auto_1549838 ?auto_1549836 ) ( not ( = ?auto_1549836 ?auto_1549837 ) ) ( HOIST-AT ?auto_1549835 ?auto_1549836 ) ( LIFTING ?auto_1549835 ?auto_1549833 ) ( not ( = ?auto_1549834 ?auto_1549835 ) ) ( ON ?auto_1549822 ?auto_1549821 ) ( ON ?auto_1549823 ?auto_1549822 ) ( ON ?auto_1549825 ?auto_1549823 ) ( ON ?auto_1549824 ?auto_1549825 ) ( ON ?auto_1549826 ?auto_1549824 ) ( ON ?auto_1549827 ?auto_1549826 ) ( ON ?auto_1549828 ?auto_1549827 ) ( ON ?auto_1549829 ?auto_1549828 ) ( ON ?auto_1549830 ?auto_1549829 ) ( ON ?auto_1549831 ?auto_1549830 ) ( not ( = ?auto_1549821 ?auto_1549822 ) ) ( not ( = ?auto_1549821 ?auto_1549823 ) ) ( not ( = ?auto_1549821 ?auto_1549825 ) ) ( not ( = ?auto_1549821 ?auto_1549824 ) ) ( not ( = ?auto_1549821 ?auto_1549826 ) ) ( not ( = ?auto_1549821 ?auto_1549827 ) ) ( not ( = ?auto_1549821 ?auto_1549828 ) ) ( not ( = ?auto_1549821 ?auto_1549829 ) ) ( not ( = ?auto_1549821 ?auto_1549830 ) ) ( not ( = ?auto_1549821 ?auto_1549831 ) ) ( not ( = ?auto_1549821 ?auto_1549832 ) ) ( not ( = ?auto_1549821 ?auto_1549833 ) ) ( not ( = ?auto_1549822 ?auto_1549823 ) ) ( not ( = ?auto_1549822 ?auto_1549825 ) ) ( not ( = ?auto_1549822 ?auto_1549824 ) ) ( not ( = ?auto_1549822 ?auto_1549826 ) ) ( not ( = ?auto_1549822 ?auto_1549827 ) ) ( not ( = ?auto_1549822 ?auto_1549828 ) ) ( not ( = ?auto_1549822 ?auto_1549829 ) ) ( not ( = ?auto_1549822 ?auto_1549830 ) ) ( not ( = ?auto_1549822 ?auto_1549831 ) ) ( not ( = ?auto_1549822 ?auto_1549832 ) ) ( not ( = ?auto_1549822 ?auto_1549833 ) ) ( not ( = ?auto_1549823 ?auto_1549825 ) ) ( not ( = ?auto_1549823 ?auto_1549824 ) ) ( not ( = ?auto_1549823 ?auto_1549826 ) ) ( not ( = ?auto_1549823 ?auto_1549827 ) ) ( not ( = ?auto_1549823 ?auto_1549828 ) ) ( not ( = ?auto_1549823 ?auto_1549829 ) ) ( not ( = ?auto_1549823 ?auto_1549830 ) ) ( not ( = ?auto_1549823 ?auto_1549831 ) ) ( not ( = ?auto_1549823 ?auto_1549832 ) ) ( not ( = ?auto_1549823 ?auto_1549833 ) ) ( not ( = ?auto_1549825 ?auto_1549824 ) ) ( not ( = ?auto_1549825 ?auto_1549826 ) ) ( not ( = ?auto_1549825 ?auto_1549827 ) ) ( not ( = ?auto_1549825 ?auto_1549828 ) ) ( not ( = ?auto_1549825 ?auto_1549829 ) ) ( not ( = ?auto_1549825 ?auto_1549830 ) ) ( not ( = ?auto_1549825 ?auto_1549831 ) ) ( not ( = ?auto_1549825 ?auto_1549832 ) ) ( not ( = ?auto_1549825 ?auto_1549833 ) ) ( not ( = ?auto_1549824 ?auto_1549826 ) ) ( not ( = ?auto_1549824 ?auto_1549827 ) ) ( not ( = ?auto_1549824 ?auto_1549828 ) ) ( not ( = ?auto_1549824 ?auto_1549829 ) ) ( not ( = ?auto_1549824 ?auto_1549830 ) ) ( not ( = ?auto_1549824 ?auto_1549831 ) ) ( not ( = ?auto_1549824 ?auto_1549832 ) ) ( not ( = ?auto_1549824 ?auto_1549833 ) ) ( not ( = ?auto_1549826 ?auto_1549827 ) ) ( not ( = ?auto_1549826 ?auto_1549828 ) ) ( not ( = ?auto_1549826 ?auto_1549829 ) ) ( not ( = ?auto_1549826 ?auto_1549830 ) ) ( not ( = ?auto_1549826 ?auto_1549831 ) ) ( not ( = ?auto_1549826 ?auto_1549832 ) ) ( not ( = ?auto_1549826 ?auto_1549833 ) ) ( not ( = ?auto_1549827 ?auto_1549828 ) ) ( not ( = ?auto_1549827 ?auto_1549829 ) ) ( not ( = ?auto_1549827 ?auto_1549830 ) ) ( not ( = ?auto_1549827 ?auto_1549831 ) ) ( not ( = ?auto_1549827 ?auto_1549832 ) ) ( not ( = ?auto_1549827 ?auto_1549833 ) ) ( not ( = ?auto_1549828 ?auto_1549829 ) ) ( not ( = ?auto_1549828 ?auto_1549830 ) ) ( not ( = ?auto_1549828 ?auto_1549831 ) ) ( not ( = ?auto_1549828 ?auto_1549832 ) ) ( not ( = ?auto_1549828 ?auto_1549833 ) ) ( not ( = ?auto_1549829 ?auto_1549830 ) ) ( not ( = ?auto_1549829 ?auto_1549831 ) ) ( not ( = ?auto_1549829 ?auto_1549832 ) ) ( not ( = ?auto_1549829 ?auto_1549833 ) ) ( not ( = ?auto_1549830 ?auto_1549831 ) ) ( not ( = ?auto_1549830 ?auto_1549832 ) ) ( not ( = ?auto_1549830 ?auto_1549833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1549831 ?auto_1549832 ?auto_1549833 )
      ( MAKE-12CRATE-VERIFY ?auto_1549821 ?auto_1549822 ?auto_1549823 ?auto_1549825 ?auto_1549824 ?auto_1549826 ?auto_1549827 ?auto_1549828 ?auto_1549829 ?auto_1549830 ?auto_1549831 ?auto_1549832 ?auto_1549833 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1549983 - SURFACE
      ?auto_1549984 - SURFACE
      ?auto_1549985 - SURFACE
      ?auto_1549987 - SURFACE
      ?auto_1549986 - SURFACE
      ?auto_1549988 - SURFACE
      ?auto_1549989 - SURFACE
      ?auto_1549990 - SURFACE
      ?auto_1549991 - SURFACE
      ?auto_1549992 - SURFACE
      ?auto_1549993 - SURFACE
      ?auto_1549994 - SURFACE
      ?auto_1549995 - SURFACE
    )
    :vars
    (
      ?auto_1549996 - HOIST
      ?auto_1549997 - PLACE
      ?auto_1549998 - TRUCK
      ?auto_1550000 - PLACE
      ?auto_1550001 - HOIST
      ?auto_1549999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1549996 ?auto_1549997 ) ( SURFACE-AT ?auto_1549994 ?auto_1549997 ) ( CLEAR ?auto_1549994 ) ( IS-CRATE ?auto_1549995 ) ( not ( = ?auto_1549994 ?auto_1549995 ) ) ( AVAILABLE ?auto_1549996 ) ( ON ?auto_1549994 ?auto_1549993 ) ( not ( = ?auto_1549993 ?auto_1549994 ) ) ( not ( = ?auto_1549993 ?auto_1549995 ) ) ( TRUCK-AT ?auto_1549998 ?auto_1550000 ) ( not ( = ?auto_1550000 ?auto_1549997 ) ) ( HOIST-AT ?auto_1550001 ?auto_1550000 ) ( not ( = ?auto_1549996 ?auto_1550001 ) ) ( AVAILABLE ?auto_1550001 ) ( SURFACE-AT ?auto_1549995 ?auto_1550000 ) ( ON ?auto_1549995 ?auto_1549999 ) ( CLEAR ?auto_1549995 ) ( not ( = ?auto_1549994 ?auto_1549999 ) ) ( not ( = ?auto_1549995 ?auto_1549999 ) ) ( not ( = ?auto_1549993 ?auto_1549999 ) ) ( ON ?auto_1549984 ?auto_1549983 ) ( ON ?auto_1549985 ?auto_1549984 ) ( ON ?auto_1549987 ?auto_1549985 ) ( ON ?auto_1549986 ?auto_1549987 ) ( ON ?auto_1549988 ?auto_1549986 ) ( ON ?auto_1549989 ?auto_1549988 ) ( ON ?auto_1549990 ?auto_1549989 ) ( ON ?auto_1549991 ?auto_1549990 ) ( ON ?auto_1549992 ?auto_1549991 ) ( ON ?auto_1549993 ?auto_1549992 ) ( not ( = ?auto_1549983 ?auto_1549984 ) ) ( not ( = ?auto_1549983 ?auto_1549985 ) ) ( not ( = ?auto_1549983 ?auto_1549987 ) ) ( not ( = ?auto_1549983 ?auto_1549986 ) ) ( not ( = ?auto_1549983 ?auto_1549988 ) ) ( not ( = ?auto_1549983 ?auto_1549989 ) ) ( not ( = ?auto_1549983 ?auto_1549990 ) ) ( not ( = ?auto_1549983 ?auto_1549991 ) ) ( not ( = ?auto_1549983 ?auto_1549992 ) ) ( not ( = ?auto_1549983 ?auto_1549993 ) ) ( not ( = ?auto_1549983 ?auto_1549994 ) ) ( not ( = ?auto_1549983 ?auto_1549995 ) ) ( not ( = ?auto_1549983 ?auto_1549999 ) ) ( not ( = ?auto_1549984 ?auto_1549985 ) ) ( not ( = ?auto_1549984 ?auto_1549987 ) ) ( not ( = ?auto_1549984 ?auto_1549986 ) ) ( not ( = ?auto_1549984 ?auto_1549988 ) ) ( not ( = ?auto_1549984 ?auto_1549989 ) ) ( not ( = ?auto_1549984 ?auto_1549990 ) ) ( not ( = ?auto_1549984 ?auto_1549991 ) ) ( not ( = ?auto_1549984 ?auto_1549992 ) ) ( not ( = ?auto_1549984 ?auto_1549993 ) ) ( not ( = ?auto_1549984 ?auto_1549994 ) ) ( not ( = ?auto_1549984 ?auto_1549995 ) ) ( not ( = ?auto_1549984 ?auto_1549999 ) ) ( not ( = ?auto_1549985 ?auto_1549987 ) ) ( not ( = ?auto_1549985 ?auto_1549986 ) ) ( not ( = ?auto_1549985 ?auto_1549988 ) ) ( not ( = ?auto_1549985 ?auto_1549989 ) ) ( not ( = ?auto_1549985 ?auto_1549990 ) ) ( not ( = ?auto_1549985 ?auto_1549991 ) ) ( not ( = ?auto_1549985 ?auto_1549992 ) ) ( not ( = ?auto_1549985 ?auto_1549993 ) ) ( not ( = ?auto_1549985 ?auto_1549994 ) ) ( not ( = ?auto_1549985 ?auto_1549995 ) ) ( not ( = ?auto_1549985 ?auto_1549999 ) ) ( not ( = ?auto_1549987 ?auto_1549986 ) ) ( not ( = ?auto_1549987 ?auto_1549988 ) ) ( not ( = ?auto_1549987 ?auto_1549989 ) ) ( not ( = ?auto_1549987 ?auto_1549990 ) ) ( not ( = ?auto_1549987 ?auto_1549991 ) ) ( not ( = ?auto_1549987 ?auto_1549992 ) ) ( not ( = ?auto_1549987 ?auto_1549993 ) ) ( not ( = ?auto_1549987 ?auto_1549994 ) ) ( not ( = ?auto_1549987 ?auto_1549995 ) ) ( not ( = ?auto_1549987 ?auto_1549999 ) ) ( not ( = ?auto_1549986 ?auto_1549988 ) ) ( not ( = ?auto_1549986 ?auto_1549989 ) ) ( not ( = ?auto_1549986 ?auto_1549990 ) ) ( not ( = ?auto_1549986 ?auto_1549991 ) ) ( not ( = ?auto_1549986 ?auto_1549992 ) ) ( not ( = ?auto_1549986 ?auto_1549993 ) ) ( not ( = ?auto_1549986 ?auto_1549994 ) ) ( not ( = ?auto_1549986 ?auto_1549995 ) ) ( not ( = ?auto_1549986 ?auto_1549999 ) ) ( not ( = ?auto_1549988 ?auto_1549989 ) ) ( not ( = ?auto_1549988 ?auto_1549990 ) ) ( not ( = ?auto_1549988 ?auto_1549991 ) ) ( not ( = ?auto_1549988 ?auto_1549992 ) ) ( not ( = ?auto_1549988 ?auto_1549993 ) ) ( not ( = ?auto_1549988 ?auto_1549994 ) ) ( not ( = ?auto_1549988 ?auto_1549995 ) ) ( not ( = ?auto_1549988 ?auto_1549999 ) ) ( not ( = ?auto_1549989 ?auto_1549990 ) ) ( not ( = ?auto_1549989 ?auto_1549991 ) ) ( not ( = ?auto_1549989 ?auto_1549992 ) ) ( not ( = ?auto_1549989 ?auto_1549993 ) ) ( not ( = ?auto_1549989 ?auto_1549994 ) ) ( not ( = ?auto_1549989 ?auto_1549995 ) ) ( not ( = ?auto_1549989 ?auto_1549999 ) ) ( not ( = ?auto_1549990 ?auto_1549991 ) ) ( not ( = ?auto_1549990 ?auto_1549992 ) ) ( not ( = ?auto_1549990 ?auto_1549993 ) ) ( not ( = ?auto_1549990 ?auto_1549994 ) ) ( not ( = ?auto_1549990 ?auto_1549995 ) ) ( not ( = ?auto_1549990 ?auto_1549999 ) ) ( not ( = ?auto_1549991 ?auto_1549992 ) ) ( not ( = ?auto_1549991 ?auto_1549993 ) ) ( not ( = ?auto_1549991 ?auto_1549994 ) ) ( not ( = ?auto_1549991 ?auto_1549995 ) ) ( not ( = ?auto_1549991 ?auto_1549999 ) ) ( not ( = ?auto_1549992 ?auto_1549993 ) ) ( not ( = ?auto_1549992 ?auto_1549994 ) ) ( not ( = ?auto_1549992 ?auto_1549995 ) ) ( not ( = ?auto_1549992 ?auto_1549999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1549993 ?auto_1549994 ?auto_1549995 )
      ( MAKE-12CRATE-VERIFY ?auto_1549983 ?auto_1549984 ?auto_1549985 ?auto_1549987 ?auto_1549986 ?auto_1549988 ?auto_1549989 ?auto_1549990 ?auto_1549991 ?auto_1549992 ?auto_1549993 ?auto_1549994 ?auto_1549995 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550146 - SURFACE
      ?auto_1550147 - SURFACE
      ?auto_1550148 - SURFACE
      ?auto_1550150 - SURFACE
      ?auto_1550149 - SURFACE
      ?auto_1550151 - SURFACE
      ?auto_1550152 - SURFACE
      ?auto_1550153 - SURFACE
      ?auto_1550154 - SURFACE
      ?auto_1550155 - SURFACE
      ?auto_1550156 - SURFACE
      ?auto_1550157 - SURFACE
      ?auto_1550158 - SURFACE
    )
    :vars
    (
      ?auto_1550159 - HOIST
      ?auto_1550162 - PLACE
      ?auto_1550161 - PLACE
      ?auto_1550160 - HOIST
      ?auto_1550164 - SURFACE
      ?auto_1550163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550159 ?auto_1550162 ) ( SURFACE-AT ?auto_1550157 ?auto_1550162 ) ( CLEAR ?auto_1550157 ) ( IS-CRATE ?auto_1550158 ) ( not ( = ?auto_1550157 ?auto_1550158 ) ) ( AVAILABLE ?auto_1550159 ) ( ON ?auto_1550157 ?auto_1550156 ) ( not ( = ?auto_1550156 ?auto_1550157 ) ) ( not ( = ?auto_1550156 ?auto_1550158 ) ) ( not ( = ?auto_1550161 ?auto_1550162 ) ) ( HOIST-AT ?auto_1550160 ?auto_1550161 ) ( not ( = ?auto_1550159 ?auto_1550160 ) ) ( AVAILABLE ?auto_1550160 ) ( SURFACE-AT ?auto_1550158 ?auto_1550161 ) ( ON ?auto_1550158 ?auto_1550164 ) ( CLEAR ?auto_1550158 ) ( not ( = ?auto_1550157 ?auto_1550164 ) ) ( not ( = ?auto_1550158 ?auto_1550164 ) ) ( not ( = ?auto_1550156 ?auto_1550164 ) ) ( TRUCK-AT ?auto_1550163 ?auto_1550162 ) ( ON ?auto_1550147 ?auto_1550146 ) ( ON ?auto_1550148 ?auto_1550147 ) ( ON ?auto_1550150 ?auto_1550148 ) ( ON ?auto_1550149 ?auto_1550150 ) ( ON ?auto_1550151 ?auto_1550149 ) ( ON ?auto_1550152 ?auto_1550151 ) ( ON ?auto_1550153 ?auto_1550152 ) ( ON ?auto_1550154 ?auto_1550153 ) ( ON ?auto_1550155 ?auto_1550154 ) ( ON ?auto_1550156 ?auto_1550155 ) ( not ( = ?auto_1550146 ?auto_1550147 ) ) ( not ( = ?auto_1550146 ?auto_1550148 ) ) ( not ( = ?auto_1550146 ?auto_1550150 ) ) ( not ( = ?auto_1550146 ?auto_1550149 ) ) ( not ( = ?auto_1550146 ?auto_1550151 ) ) ( not ( = ?auto_1550146 ?auto_1550152 ) ) ( not ( = ?auto_1550146 ?auto_1550153 ) ) ( not ( = ?auto_1550146 ?auto_1550154 ) ) ( not ( = ?auto_1550146 ?auto_1550155 ) ) ( not ( = ?auto_1550146 ?auto_1550156 ) ) ( not ( = ?auto_1550146 ?auto_1550157 ) ) ( not ( = ?auto_1550146 ?auto_1550158 ) ) ( not ( = ?auto_1550146 ?auto_1550164 ) ) ( not ( = ?auto_1550147 ?auto_1550148 ) ) ( not ( = ?auto_1550147 ?auto_1550150 ) ) ( not ( = ?auto_1550147 ?auto_1550149 ) ) ( not ( = ?auto_1550147 ?auto_1550151 ) ) ( not ( = ?auto_1550147 ?auto_1550152 ) ) ( not ( = ?auto_1550147 ?auto_1550153 ) ) ( not ( = ?auto_1550147 ?auto_1550154 ) ) ( not ( = ?auto_1550147 ?auto_1550155 ) ) ( not ( = ?auto_1550147 ?auto_1550156 ) ) ( not ( = ?auto_1550147 ?auto_1550157 ) ) ( not ( = ?auto_1550147 ?auto_1550158 ) ) ( not ( = ?auto_1550147 ?auto_1550164 ) ) ( not ( = ?auto_1550148 ?auto_1550150 ) ) ( not ( = ?auto_1550148 ?auto_1550149 ) ) ( not ( = ?auto_1550148 ?auto_1550151 ) ) ( not ( = ?auto_1550148 ?auto_1550152 ) ) ( not ( = ?auto_1550148 ?auto_1550153 ) ) ( not ( = ?auto_1550148 ?auto_1550154 ) ) ( not ( = ?auto_1550148 ?auto_1550155 ) ) ( not ( = ?auto_1550148 ?auto_1550156 ) ) ( not ( = ?auto_1550148 ?auto_1550157 ) ) ( not ( = ?auto_1550148 ?auto_1550158 ) ) ( not ( = ?auto_1550148 ?auto_1550164 ) ) ( not ( = ?auto_1550150 ?auto_1550149 ) ) ( not ( = ?auto_1550150 ?auto_1550151 ) ) ( not ( = ?auto_1550150 ?auto_1550152 ) ) ( not ( = ?auto_1550150 ?auto_1550153 ) ) ( not ( = ?auto_1550150 ?auto_1550154 ) ) ( not ( = ?auto_1550150 ?auto_1550155 ) ) ( not ( = ?auto_1550150 ?auto_1550156 ) ) ( not ( = ?auto_1550150 ?auto_1550157 ) ) ( not ( = ?auto_1550150 ?auto_1550158 ) ) ( not ( = ?auto_1550150 ?auto_1550164 ) ) ( not ( = ?auto_1550149 ?auto_1550151 ) ) ( not ( = ?auto_1550149 ?auto_1550152 ) ) ( not ( = ?auto_1550149 ?auto_1550153 ) ) ( not ( = ?auto_1550149 ?auto_1550154 ) ) ( not ( = ?auto_1550149 ?auto_1550155 ) ) ( not ( = ?auto_1550149 ?auto_1550156 ) ) ( not ( = ?auto_1550149 ?auto_1550157 ) ) ( not ( = ?auto_1550149 ?auto_1550158 ) ) ( not ( = ?auto_1550149 ?auto_1550164 ) ) ( not ( = ?auto_1550151 ?auto_1550152 ) ) ( not ( = ?auto_1550151 ?auto_1550153 ) ) ( not ( = ?auto_1550151 ?auto_1550154 ) ) ( not ( = ?auto_1550151 ?auto_1550155 ) ) ( not ( = ?auto_1550151 ?auto_1550156 ) ) ( not ( = ?auto_1550151 ?auto_1550157 ) ) ( not ( = ?auto_1550151 ?auto_1550158 ) ) ( not ( = ?auto_1550151 ?auto_1550164 ) ) ( not ( = ?auto_1550152 ?auto_1550153 ) ) ( not ( = ?auto_1550152 ?auto_1550154 ) ) ( not ( = ?auto_1550152 ?auto_1550155 ) ) ( not ( = ?auto_1550152 ?auto_1550156 ) ) ( not ( = ?auto_1550152 ?auto_1550157 ) ) ( not ( = ?auto_1550152 ?auto_1550158 ) ) ( not ( = ?auto_1550152 ?auto_1550164 ) ) ( not ( = ?auto_1550153 ?auto_1550154 ) ) ( not ( = ?auto_1550153 ?auto_1550155 ) ) ( not ( = ?auto_1550153 ?auto_1550156 ) ) ( not ( = ?auto_1550153 ?auto_1550157 ) ) ( not ( = ?auto_1550153 ?auto_1550158 ) ) ( not ( = ?auto_1550153 ?auto_1550164 ) ) ( not ( = ?auto_1550154 ?auto_1550155 ) ) ( not ( = ?auto_1550154 ?auto_1550156 ) ) ( not ( = ?auto_1550154 ?auto_1550157 ) ) ( not ( = ?auto_1550154 ?auto_1550158 ) ) ( not ( = ?auto_1550154 ?auto_1550164 ) ) ( not ( = ?auto_1550155 ?auto_1550156 ) ) ( not ( = ?auto_1550155 ?auto_1550157 ) ) ( not ( = ?auto_1550155 ?auto_1550158 ) ) ( not ( = ?auto_1550155 ?auto_1550164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550156 ?auto_1550157 ?auto_1550158 )
      ( MAKE-12CRATE-VERIFY ?auto_1550146 ?auto_1550147 ?auto_1550148 ?auto_1550150 ?auto_1550149 ?auto_1550151 ?auto_1550152 ?auto_1550153 ?auto_1550154 ?auto_1550155 ?auto_1550156 ?auto_1550157 ?auto_1550158 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550309 - SURFACE
      ?auto_1550310 - SURFACE
      ?auto_1550311 - SURFACE
      ?auto_1550313 - SURFACE
      ?auto_1550312 - SURFACE
      ?auto_1550314 - SURFACE
      ?auto_1550315 - SURFACE
      ?auto_1550316 - SURFACE
      ?auto_1550317 - SURFACE
      ?auto_1550318 - SURFACE
      ?auto_1550319 - SURFACE
      ?auto_1550320 - SURFACE
      ?auto_1550321 - SURFACE
    )
    :vars
    (
      ?auto_1550322 - HOIST
      ?auto_1550327 - PLACE
      ?auto_1550325 - PLACE
      ?auto_1550323 - HOIST
      ?auto_1550324 - SURFACE
      ?auto_1550326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550322 ?auto_1550327 ) ( IS-CRATE ?auto_1550321 ) ( not ( = ?auto_1550320 ?auto_1550321 ) ) ( not ( = ?auto_1550319 ?auto_1550320 ) ) ( not ( = ?auto_1550319 ?auto_1550321 ) ) ( not ( = ?auto_1550325 ?auto_1550327 ) ) ( HOIST-AT ?auto_1550323 ?auto_1550325 ) ( not ( = ?auto_1550322 ?auto_1550323 ) ) ( AVAILABLE ?auto_1550323 ) ( SURFACE-AT ?auto_1550321 ?auto_1550325 ) ( ON ?auto_1550321 ?auto_1550324 ) ( CLEAR ?auto_1550321 ) ( not ( = ?auto_1550320 ?auto_1550324 ) ) ( not ( = ?auto_1550321 ?auto_1550324 ) ) ( not ( = ?auto_1550319 ?auto_1550324 ) ) ( TRUCK-AT ?auto_1550326 ?auto_1550327 ) ( SURFACE-AT ?auto_1550319 ?auto_1550327 ) ( CLEAR ?auto_1550319 ) ( LIFTING ?auto_1550322 ?auto_1550320 ) ( IS-CRATE ?auto_1550320 ) ( ON ?auto_1550310 ?auto_1550309 ) ( ON ?auto_1550311 ?auto_1550310 ) ( ON ?auto_1550313 ?auto_1550311 ) ( ON ?auto_1550312 ?auto_1550313 ) ( ON ?auto_1550314 ?auto_1550312 ) ( ON ?auto_1550315 ?auto_1550314 ) ( ON ?auto_1550316 ?auto_1550315 ) ( ON ?auto_1550317 ?auto_1550316 ) ( ON ?auto_1550318 ?auto_1550317 ) ( ON ?auto_1550319 ?auto_1550318 ) ( not ( = ?auto_1550309 ?auto_1550310 ) ) ( not ( = ?auto_1550309 ?auto_1550311 ) ) ( not ( = ?auto_1550309 ?auto_1550313 ) ) ( not ( = ?auto_1550309 ?auto_1550312 ) ) ( not ( = ?auto_1550309 ?auto_1550314 ) ) ( not ( = ?auto_1550309 ?auto_1550315 ) ) ( not ( = ?auto_1550309 ?auto_1550316 ) ) ( not ( = ?auto_1550309 ?auto_1550317 ) ) ( not ( = ?auto_1550309 ?auto_1550318 ) ) ( not ( = ?auto_1550309 ?auto_1550319 ) ) ( not ( = ?auto_1550309 ?auto_1550320 ) ) ( not ( = ?auto_1550309 ?auto_1550321 ) ) ( not ( = ?auto_1550309 ?auto_1550324 ) ) ( not ( = ?auto_1550310 ?auto_1550311 ) ) ( not ( = ?auto_1550310 ?auto_1550313 ) ) ( not ( = ?auto_1550310 ?auto_1550312 ) ) ( not ( = ?auto_1550310 ?auto_1550314 ) ) ( not ( = ?auto_1550310 ?auto_1550315 ) ) ( not ( = ?auto_1550310 ?auto_1550316 ) ) ( not ( = ?auto_1550310 ?auto_1550317 ) ) ( not ( = ?auto_1550310 ?auto_1550318 ) ) ( not ( = ?auto_1550310 ?auto_1550319 ) ) ( not ( = ?auto_1550310 ?auto_1550320 ) ) ( not ( = ?auto_1550310 ?auto_1550321 ) ) ( not ( = ?auto_1550310 ?auto_1550324 ) ) ( not ( = ?auto_1550311 ?auto_1550313 ) ) ( not ( = ?auto_1550311 ?auto_1550312 ) ) ( not ( = ?auto_1550311 ?auto_1550314 ) ) ( not ( = ?auto_1550311 ?auto_1550315 ) ) ( not ( = ?auto_1550311 ?auto_1550316 ) ) ( not ( = ?auto_1550311 ?auto_1550317 ) ) ( not ( = ?auto_1550311 ?auto_1550318 ) ) ( not ( = ?auto_1550311 ?auto_1550319 ) ) ( not ( = ?auto_1550311 ?auto_1550320 ) ) ( not ( = ?auto_1550311 ?auto_1550321 ) ) ( not ( = ?auto_1550311 ?auto_1550324 ) ) ( not ( = ?auto_1550313 ?auto_1550312 ) ) ( not ( = ?auto_1550313 ?auto_1550314 ) ) ( not ( = ?auto_1550313 ?auto_1550315 ) ) ( not ( = ?auto_1550313 ?auto_1550316 ) ) ( not ( = ?auto_1550313 ?auto_1550317 ) ) ( not ( = ?auto_1550313 ?auto_1550318 ) ) ( not ( = ?auto_1550313 ?auto_1550319 ) ) ( not ( = ?auto_1550313 ?auto_1550320 ) ) ( not ( = ?auto_1550313 ?auto_1550321 ) ) ( not ( = ?auto_1550313 ?auto_1550324 ) ) ( not ( = ?auto_1550312 ?auto_1550314 ) ) ( not ( = ?auto_1550312 ?auto_1550315 ) ) ( not ( = ?auto_1550312 ?auto_1550316 ) ) ( not ( = ?auto_1550312 ?auto_1550317 ) ) ( not ( = ?auto_1550312 ?auto_1550318 ) ) ( not ( = ?auto_1550312 ?auto_1550319 ) ) ( not ( = ?auto_1550312 ?auto_1550320 ) ) ( not ( = ?auto_1550312 ?auto_1550321 ) ) ( not ( = ?auto_1550312 ?auto_1550324 ) ) ( not ( = ?auto_1550314 ?auto_1550315 ) ) ( not ( = ?auto_1550314 ?auto_1550316 ) ) ( not ( = ?auto_1550314 ?auto_1550317 ) ) ( not ( = ?auto_1550314 ?auto_1550318 ) ) ( not ( = ?auto_1550314 ?auto_1550319 ) ) ( not ( = ?auto_1550314 ?auto_1550320 ) ) ( not ( = ?auto_1550314 ?auto_1550321 ) ) ( not ( = ?auto_1550314 ?auto_1550324 ) ) ( not ( = ?auto_1550315 ?auto_1550316 ) ) ( not ( = ?auto_1550315 ?auto_1550317 ) ) ( not ( = ?auto_1550315 ?auto_1550318 ) ) ( not ( = ?auto_1550315 ?auto_1550319 ) ) ( not ( = ?auto_1550315 ?auto_1550320 ) ) ( not ( = ?auto_1550315 ?auto_1550321 ) ) ( not ( = ?auto_1550315 ?auto_1550324 ) ) ( not ( = ?auto_1550316 ?auto_1550317 ) ) ( not ( = ?auto_1550316 ?auto_1550318 ) ) ( not ( = ?auto_1550316 ?auto_1550319 ) ) ( not ( = ?auto_1550316 ?auto_1550320 ) ) ( not ( = ?auto_1550316 ?auto_1550321 ) ) ( not ( = ?auto_1550316 ?auto_1550324 ) ) ( not ( = ?auto_1550317 ?auto_1550318 ) ) ( not ( = ?auto_1550317 ?auto_1550319 ) ) ( not ( = ?auto_1550317 ?auto_1550320 ) ) ( not ( = ?auto_1550317 ?auto_1550321 ) ) ( not ( = ?auto_1550317 ?auto_1550324 ) ) ( not ( = ?auto_1550318 ?auto_1550319 ) ) ( not ( = ?auto_1550318 ?auto_1550320 ) ) ( not ( = ?auto_1550318 ?auto_1550321 ) ) ( not ( = ?auto_1550318 ?auto_1550324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550319 ?auto_1550320 ?auto_1550321 )
      ( MAKE-12CRATE-VERIFY ?auto_1550309 ?auto_1550310 ?auto_1550311 ?auto_1550313 ?auto_1550312 ?auto_1550314 ?auto_1550315 ?auto_1550316 ?auto_1550317 ?auto_1550318 ?auto_1550319 ?auto_1550320 ?auto_1550321 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550472 - SURFACE
      ?auto_1550473 - SURFACE
      ?auto_1550474 - SURFACE
      ?auto_1550476 - SURFACE
      ?auto_1550475 - SURFACE
      ?auto_1550477 - SURFACE
      ?auto_1550478 - SURFACE
      ?auto_1550479 - SURFACE
      ?auto_1550480 - SURFACE
      ?auto_1550481 - SURFACE
      ?auto_1550482 - SURFACE
      ?auto_1550483 - SURFACE
      ?auto_1550484 - SURFACE
    )
    :vars
    (
      ?auto_1550486 - HOIST
      ?auto_1550488 - PLACE
      ?auto_1550489 - PLACE
      ?auto_1550485 - HOIST
      ?auto_1550490 - SURFACE
      ?auto_1550487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550486 ?auto_1550488 ) ( IS-CRATE ?auto_1550484 ) ( not ( = ?auto_1550483 ?auto_1550484 ) ) ( not ( = ?auto_1550482 ?auto_1550483 ) ) ( not ( = ?auto_1550482 ?auto_1550484 ) ) ( not ( = ?auto_1550489 ?auto_1550488 ) ) ( HOIST-AT ?auto_1550485 ?auto_1550489 ) ( not ( = ?auto_1550486 ?auto_1550485 ) ) ( AVAILABLE ?auto_1550485 ) ( SURFACE-AT ?auto_1550484 ?auto_1550489 ) ( ON ?auto_1550484 ?auto_1550490 ) ( CLEAR ?auto_1550484 ) ( not ( = ?auto_1550483 ?auto_1550490 ) ) ( not ( = ?auto_1550484 ?auto_1550490 ) ) ( not ( = ?auto_1550482 ?auto_1550490 ) ) ( TRUCK-AT ?auto_1550487 ?auto_1550488 ) ( SURFACE-AT ?auto_1550482 ?auto_1550488 ) ( CLEAR ?auto_1550482 ) ( IS-CRATE ?auto_1550483 ) ( AVAILABLE ?auto_1550486 ) ( IN ?auto_1550483 ?auto_1550487 ) ( ON ?auto_1550473 ?auto_1550472 ) ( ON ?auto_1550474 ?auto_1550473 ) ( ON ?auto_1550476 ?auto_1550474 ) ( ON ?auto_1550475 ?auto_1550476 ) ( ON ?auto_1550477 ?auto_1550475 ) ( ON ?auto_1550478 ?auto_1550477 ) ( ON ?auto_1550479 ?auto_1550478 ) ( ON ?auto_1550480 ?auto_1550479 ) ( ON ?auto_1550481 ?auto_1550480 ) ( ON ?auto_1550482 ?auto_1550481 ) ( not ( = ?auto_1550472 ?auto_1550473 ) ) ( not ( = ?auto_1550472 ?auto_1550474 ) ) ( not ( = ?auto_1550472 ?auto_1550476 ) ) ( not ( = ?auto_1550472 ?auto_1550475 ) ) ( not ( = ?auto_1550472 ?auto_1550477 ) ) ( not ( = ?auto_1550472 ?auto_1550478 ) ) ( not ( = ?auto_1550472 ?auto_1550479 ) ) ( not ( = ?auto_1550472 ?auto_1550480 ) ) ( not ( = ?auto_1550472 ?auto_1550481 ) ) ( not ( = ?auto_1550472 ?auto_1550482 ) ) ( not ( = ?auto_1550472 ?auto_1550483 ) ) ( not ( = ?auto_1550472 ?auto_1550484 ) ) ( not ( = ?auto_1550472 ?auto_1550490 ) ) ( not ( = ?auto_1550473 ?auto_1550474 ) ) ( not ( = ?auto_1550473 ?auto_1550476 ) ) ( not ( = ?auto_1550473 ?auto_1550475 ) ) ( not ( = ?auto_1550473 ?auto_1550477 ) ) ( not ( = ?auto_1550473 ?auto_1550478 ) ) ( not ( = ?auto_1550473 ?auto_1550479 ) ) ( not ( = ?auto_1550473 ?auto_1550480 ) ) ( not ( = ?auto_1550473 ?auto_1550481 ) ) ( not ( = ?auto_1550473 ?auto_1550482 ) ) ( not ( = ?auto_1550473 ?auto_1550483 ) ) ( not ( = ?auto_1550473 ?auto_1550484 ) ) ( not ( = ?auto_1550473 ?auto_1550490 ) ) ( not ( = ?auto_1550474 ?auto_1550476 ) ) ( not ( = ?auto_1550474 ?auto_1550475 ) ) ( not ( = ?auto_1550474 ?auto_1550477 ) ) ( not ( = ?auto_1550474 ?auto_1550478 ) ) ( not ( = ?auto_1550474 ?auto_1550479 ) ) ( not ( = ?auto_1550474 ?auto_1550480 ) ) ( not ( = ?auto_1550474 ?auto_1550481 ) ) ( not ( = ?auto_1550474 ?auto_1550482 ) ) ( not ( = ?auto_1550474 ?auto_1550483 ) ) ( not ( = ?auto_1550474 ?auto_1550484 ) ) ( not ( = ?auto_1550474 ?auto_1550490 ) ) ( not ( = ?auto_1550476 ?auto_1550475 ) ) ( not ( = ?auto_1550476 ?auto_1550477 ) ) ( not ( = ?auto_1550476 ?auto_1550478 ) ) ( not ( = ?auto_1550476 ?auto_1550479 ) ) ( not ( = ?auto_1550476 ?auto_1550480 ) ) ( not ( = ?auto_1550476 ?auto_1550481 ) ) ( not ( = ?auto_1550476 ?auto_1550482 ) ) ( not ( = ?auto_1550476 ?auto_1550483 ) ) ( not ( = ?auto_1550476 ?auto_1550484 ) ) ( not ( = ?auto_1550476 ?auto_1550490 ) ) ( not ( = ?auto_1550475 ?auto_1550477 ) ) ( not ( = ?auto_1550475 ?auto_1550478 ) ) ( not ( = ?auto_1550475 ?auto_1550479 ) ) ( not ( = ?auto_1550475 ?auto_1550480 ) ) ( not ( = ?auto_1550475 ?auto_1550481 ) ) ( not ( = ?auto_1550475 ?auto_1550482 ) ) ( not ( = ?auto_1550475 ?auto_1550483 ) ) ( not ( = ?auto_1550475 ?auto_1550484 ) ) ( not ( = ?auto_1550475 ?auto_1550490 ) ) ( not ( = ?auto_1550477 ?auto_1550478 ) ) ( not ( = ?auto_1550477 ?auto_1550479 ) ) ( not ( = ?auto_1550477 ?auto_1550480 ) ) ( not ( = ?auto_1550477 ?auto_1550481 ) ) ( not ( = ?auto_1550477 ?auto_1550482 ) ) ( not ( = ?auto_1550477 ?auto_1550483 ) ) ( not ( = ?auto_1550477 ?auto_1550484 ) ) ( not ( = ?auto_1550477 ?auto_1550490 ) ) ( not ( = ?auto_1550478 ?auto_1550479 ) ) ( not ( = ?auto_1550478 ?auto_1550480 ) ) ( not ( = ?auto_1550478 ?auto_1550481 ) ) ( not ( = ?auto_1550478 ?auto_1550482 ) ) ( not ( = ?auto_1550478 ?auto_1550483 ) ) ( not ( = ?auto_1550478 ?auto_1550484 ) ) ( not ( = ?auto_1550478 ?auto_1550490 ) ) ( not ( = ?auto_1550479 ?auto_1550480 ) ) ( not ( = ?auto_1550479 ?auto_1550481 ) ) ( not ( = ?auto_1550479 ?auto_1550482 ) ) ( not ( = ?auto_1550479 ?auto_1550483 ) ) ( not ( = ?auto_1550479 ?auto_1550484 ) ) ( not ( = ?auto_1550479 ?auto_1550490 ) ) ( not ( = ?auto_1550480 ?auto_1550481 ) ) ( not ( = ?auto_1550480 ?auto_1550482 ) ) ( not ( = ?auto_1550480 ?auto_1550483 ) ) ( not ( = ?auto_1550480 ?auto_1550484 ) ) ( not ( = ?auto_1550480 ?auto_1550490 ) ) ( not ( = ?auto_1550481 ?auto_1550482 ) ) ( not ( = ?auto_1550481 ?auto_1550483 ) ) ( not ( = ?auto_1550481 ?auto_1550484 ) ) ( not ( = ?auto_1550481 ?auto_1550490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550482 ?auto_1550483 ?auto_1550484 )
      ( MAKE-12CRATE-VERIFY ?auto_1550472 ?auto_1550473 ?auto_1550474 ?auto_1550476 ?auto_1550475 ?auto_1550477 ?auto_1550478 ?auto_1550479 ?auto_1550480 ?auto_1550481 ?auto_1550482 ?auto_1550483 ?auto_1550484 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562076 - SURFACE
      ?auto_1562077 - SURFACE
      ?auto_1562078 - SURFACE
      ?auto_1562080 - SURFACE
      ?auto_1562079 - SURFACE
      ?auto_1562081 - SURFACE
      ?auto_1562082 - SURFACE
      ?auto_1562083 - SURFACE
      ?auto_1562084 - SURFACE
      ?auto_1562085 - SURFACE
      ?auto_1562086 - SURFACE
      ?auto_1562087 - SURFACE
      ?auto_1562088 - SURFACE
      ?auto_1562089 - SURFACE
    )
    :vars
    (
      ?auto_1562091 - HOIST
      ?auto_1562090 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562091 ?auto_1562090 ) ( SURFACE-AT ?auto_1562088 ?auto_1562090 ) ( CLEAR ?auto_1562088 ) ( LIFTING ?auto_1562091 ?auto_1562089 ) ( IS-CRATE ?auto_1562089 ) ( not ( = ?auto_1562088 ?auto_1562089 ) ) ( ON ?auto_1562077 ?auto_1562076 ) ( ON ?auto_1562078 ?auto_1562077 ) ( ON ?auto_1562080 ?auto_1562078 ) ( ON ?auto_1562079 ?auto_1562080 ) ( ON ?auto_1562081 ?auto_1562079 ) ( ON ?auto_1562082 ?auto_1562081 ) ( ON ?auto_1562083 ?auto_1562082 ) ( ON ?auto_1562084 ?auto_1562083 ) ( ON ?auto_1562085 ?auto_1562084 ) ( ON ?auto_1562086 ?auto_1562085 ) ( ON ?auto_1562087 ?auto_1562086 ) ( ON ?auto_1562088 ?auto_1562087 ) ( not ( = ?auto_1562076 ?auto_1562077 ) ) ( not ( = ?auto_1562076 ?auto_1562078 ) ) ( not ( = ?auto_1562076 ?auto_1562080 ) ) ( not ( = ?auto_1562076 ?auto_1562079 ) ) ( not ( = ?auto_1562076 ?auto_1562081 ) ) ( not ( = ?auto_1562076 ?auto_1562082 ) ) ( not ( = ?auto_1562076 ?auto_1562083 ) ) ( not ( = ?auto_1562076 ?auto_1562084 ) ) ( not ( = ?auto_1562076 ?auto_1562085 ) ) ( not ( = ?auto_1562076 ?auto_1562086 ) ) ( not ( = ?auto_1562076 ?auto_1562087 ) ) ( not ( = ?auto_1562076 ?auto_1562088 ) ) ( not ( = ?auto_1562076 ?auto_1562089 ) ) ( not ( = ?auto_1562077 ?auto_1562078 ) ) ( not ( = ?auto_1562077 ?auto_1562080 ) ) ( not ( = ?auto_1562077 ?auto_1562079 ) ) ( not ( = ?auto_1562077 ?auto_1562081 ) ) ( not ( = ?auto_1562077 ?auto_1562082 ) ) ( not ( = ?auto_1562077 ?auto_1562083 ) ) ( not ( = ?auto_1562077 ?auto_1562084 ) ) ( not ( = ?auto_1562077 ?auto_1562085 ) ) ( not ( = ?auto_1562077 ?auto_1562086 ) ) ( not ( = ?auto_1562077 ?auto_1562087 ) ) ( not ( = ?auto_1562077 ?auto_1562088 ) ) ( not ( = ?auto_1562077 ?auto_1562089 ) ) ( not ( = ?auto_1562078 ?auto_1562080 ) ) ( not ( = ?auto_1562078 ?auto_1562079 ) ) ( not ( = ?auto_1562078 ?auto_1562081 ) ) ( not ( = ?auto_1562078 ?auto_1562082 ) ) ( not ( = ?auto_1562078 ?auto_1562083 ) ) ( not ( = ?auto_1562078 ?auto_1562084 ) ) ( not ( = ?auto_1562078 ?auto_1562085 ) ) ( not ( = ?auto_1562078 ?auto_1562086 ) ) ( not ( = ?auto_1562078 ?auto_1562087 ) ) ( not ( = ?auto_1562078 ?auto_1562088 ) ) ( not ( = ?auto_1562078 ?auto_1562089 ) ) ( not ( = ?auto_1562080 ?auto_1562079 ) ) ( not ( = ?auto_1562080 ?auto_1562081 ) ) ( not ( = ?auto_1562080 ?auto_1562082 ) ) ( not ( = ?auto_1562080 ?auto_1562083 ) ) ( not ( = ?auto_1562080 ?auto_1562084 ) ) ( not ( = ?auto_1562080 ?auto_1562085 ) ) ( not ( = ?auto_1562080 ?auto_1562086 ) ) ( not ( = ?auto_1562080 ?auto_1562087 ) ) ( not ( = ?auto_1562080 ?auto_1562088 ) ) ( not ( = ?auto_1562080 ?auto_1562089 ) ) ( not ( = ?auto_1562079 ?auto_1562081 ) ) ( not ( = ?auto_1562079 ?auto_1562082 ) ) ( not ( = ?auto_1562079 ?auto_1562083 ) ) ( not ( = ?auto_1562079 ?auto_1562084 ) ) ( not ( = ?auto_1562079 ?auto_1562085 ) ) ( not ( = ?auto_1562079 ?auto_1562086 ) ) ( not ( = ?auto_1562079 ?auto_1562087 ) ) ( not ( = ?auto_1562079 ?auto_1562088 ) ) ( not ( = ?auto_1562079 ?auto_1562089 ) ) ( not ( = ?auto_1562081 ?auto_1562082 ) ) ( not ( = ?auto_1562081 ?auto_1562083 ) ) ( not ( = ?auto_1562081 ?auto_1562084 ) ) ( not ( = ?auto_1562081 ?auto_1562085 ) ) ( not ( = ?auto_1562081 ?auto_1562086 ) ) ( not ( = ?auto_1562081 ?auto_1562087 ) ) ( not ( = ?auto_1562081 ?auto_1562088 ) ) ( not ( = ?auto_1562081 ?auto_1562089 ) ) ( not ( = ?auto_1562082 ?auto_1562083 ) ) ( not ( = ?auto_1562082 ?auto_1562084 ) ) ( not ( = ?auto_1562082 ?auto_1562085 ) ) ( not ( = ?auto_1562082 ?auto_1562086 ) ) ( not ( = ?auto_1562082 ?auto_1562087 ) ) ( not ( = ?auto_1562082 ?auto_1562088 ) ) ( not ( = ?auto_1562082 ?auto_1562089 ) ) ( not ( = ?auto_1562083 ?auto_1562084 ) ) ( not ( = ?auto_1562083 ?auto_1562085 ) ) ( not ( = ?auto_1562083 ?auto_1562086 ) ) ( not ( = ?auto_1562083 ?auto_1562087 ) ) ( not ( = ?auto_1562083 ?auto_1562088 ) ) ( not ( = ?auto_1562083 ?auto_1562089 ) ) ( not ( = ?auto_1562084 ?auto_1562085 ) ) ( not ( = ?auto_1562084 ?auto_1562086 ) ) ( not ( = ?auto_1562084 ?auto_1562087 ) ) ( not ( = ?auto_1562084 ?auto_1562088 ) ) ( not ( = ?auto_1562084 ?auto_1562089 ) ) ( not ( = ?auto_1562085 ?auto_1562086 ) ) ( not ( = ?auto_1562085 ?auto_1562087 ) ) ( not ( = ?auto_1562085 ?auto_1562088 ) ) ( not ( = ?auto_1562085 ?auto_1562089 ) ) ( not ( = ?auto_1562086 ?auto_1562087 ) ) ( not ( = ?auto_1562086 ?auto_1562088 ) ) ( not ( = ?auto_1562086 ?auto_1562089 ) ) ( not ( = ?auto_1562087 ?auto_1562088 ) ) ( not ( = ?auto_1562087 ?auto_1562089 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1562088 ?auto_1562089 )
      ( MAKE-13CRATE-VERIFY ?auto_1562076 ?auto_1562077 ?auto_1562078 ?auto_1562080 ?auto_1562079 ?auto_1562081 ?auto_1562082 ?auto_1562083 ?auto_1562084 ?auto_1562085 ?auto_1562086 ?auto_1562087 ?auto_1562088 ?auto_1562089 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562218 - SURFACE
      ?auto_1562219 - SURFACE
      ?auto_1562220 - SURFACE
      ?auto_1562222 - SURFACE
      ?auto_1562221 - SURFACE
      ?auto_1562223 - SURFACE
      ?auto_1562224 - SURFACE
      ?auto_1562225 - SURFACE
      ?auto_1562226 - SURFACE
      ?auto_1562227 - SURFACE
      ?auto_1562228 - SURFACE
      ?auto_1562229 - SURFACE
      ?auto_1562230 - SURFACE
      ?auto_1562231 - SURFACE
    )
    :vars
    (
      ?auto_1562234 - HOIST
      ?auto_1562232 - PLACE
      ?auto_1562233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562234 ?auto_1562232 ) ( SURFACE-AT ?auto_1562230 ?auto_1562232 ) ( CLEAR ?auto_1562230 ) ( IS-CRATE ?auto_1562231 ) ( not ( = ?auto_1562230 ?auto_1562231 ) ) ( TRUCK-AT ?auto_1562233 ?auto_1562232 ) ( AVAILABLE ?auto_1562234 ) ( IN ?auto_1562231 ?auto_1562233 ) ( ON ?auto_1562230 ?auto_1562229 ) ( not ( = ?auto_1562229 ?auto_1562230 ) ) ( not ( = ?auto_1562229 ?auto_1562231 ) ) ( ON ?auto_1562219 ?auto_1562218 ) ( ON ?auto_1562220 ?auto_1562219 ) ( ON ?auto_1562222 ?auto_1562220 ) ( ON ?auto_1562221 ?auto_1562222 ) ( ON ?auto_1562223 ?auto_1562221 ) ( ON ?auto_1562224 ?auto_1562223 ) ( ON ?auto_1562225 ?auto_1562224 ) ( ON ?auto_1562226 ?auto_1562225 ) ( ON ?auto_1562227 ?auto_1562226 ) ( ON ?auto_1562228 ?auto_1562227 ) ( ON ?auto_1562229 ?auto_1562228 ) ( not ( = ?auto_1562218 ?auto_1562219 ) ) ( not ( = ?auto_1562218 ?auto_1562220 ) ) ( not ( = ?auto_1562218 ?auto_1562222 ) ) ( not ( = ?auto_1562218 ?auto_1562221 ) ) ( not ( = ?auto_1562218 ?auto_1562223 ) ) ( not ( = ?auto_1562218 ?auto_1562224 ) ) ( not ( = ?auto_1562218 ?auto_1562225 ) ) ( not ( = ?auto_1562218 ?auto_1562226 ) ) ( not ( = ?auto_1562218 ?auto_1562227 ) ) ( not ( = ?auto_1562218 ?auto_1562228 ) ) ( not ( = ?auto_1562218 ?auto_1562229 ) ) ( not ( = ?auto_1562218 ?auto_1562230 ) ) ( not ( = ?auto_1562218 ?auto_1562231 ) ) ( not ( = ?auto_1562219 ?auto_1562220 ) ) ( not ( = ?auto_1562219 ?auto_1562222 ) ) ( not ( = ?auto_1562219 ?auto_1562221 ) ) ( not ( = ?auto_1562219 ?auto_1562223 ) ) ( not ( = ?auto_1562219 ?auto_1562224 ) ) ( not ( = ?auto_1562219 ?auto_1562225 ) ) ( not ( = ?auto_1562219 ?auto_1562226 ) ) ( not ( = ?auto_1562219 ?auto_1562227 ) ) ( not ( = ?auto_1562219 ?auto_1562228 ) ) ( not ( = ?auto_1562219 ?auto_1562229 ) ) ( not ( = ?auto_1562219 ?auto_1562230 ) ) ( not ( = ?auto_1562219 ?auto_1562231 ) ) ( not ( = ?auto_1562220 ?auto_1562222 ) ) ( not ( = ?auto_1562220 ?auto_1562221 ) ) ( not ( = ?auto_1562220 ?auto_1562223 ) ) ( not ( = ?auto_1562220 ?auto_1562224 ) ) ( not ( = ?auto_1562220 ?auto_1562225 ) ) ( not ( = ?auto_1562220 ?auto_1562226 ) ) ( not ( = ?auto_1562220 ?auto_1562227 ) ) ( not ( = ?auto_1562220 ?auto_1562228 ) ) ( not ( = ?auto_1562220 ?auto_1562229 ) ) ( not ( = ?auto_1562220 ?auto_1562230 ) ) ( not ( = ?auto_1562220 ?auto_1562231 ) ) ( not ( = ?auto_1562222 ?auto_1562221 ) ) ( not ( = ?auto_1562222 ?auto_1562223 ) ) ( not ( = ?auto_1562222 ?auto_1562224 ) ) ( not ( = ?auto_1562222 ?auto_1562225 ) ) ( not ( = ?auto_1562222 ?auto_1562226 ) ) ( not ( = ?auto_1562222 ?auto_1562227 ) ) ( not ( = ?auto_1562222 ?auto_1562228 ) ) ( not ( = ?auto_1562222 ?auto_1562229 ) ) ( not ( = ?auto_1562222 ?auto_1562230 ) ) ( not ( = ?auto_1562222 ?auto_1562231 ) ) ( not ( = ?auto_1562221 ?auto_1562223 ) ) ( not ( = ?auto_1562221 ?auto_1562224 ) ) ( not ( = ?auto_1562221 ?auto_1562225 ) ) ( not ( = ?auto_1562221 ?auto_1562226 ) ) ( not ( = ?auto_1562221 ?auto_1562227 ) ) ( not ( = ?auto_1562221 ?auto_1562228 ) ) ( not ( = ?auto_1562221 ?auto_1562229 ) ) ( not ( = ?auto_1562221 ?auto_1562230 ) ) ( not ( = ?auto_1562221 ?auto_1562231 ) ) ( not ( = ?auto_1562223 ?auto_1562224 ) ) ( not ( = ?auto_1562223 ?auto_1562225 ) ) ( not ( = ?auto_1562223 ?auto_1562226 ) ) ( not ( = ?auto_1562223 ?auto_1562227 ) ) ( not ( = ?auto_1562223 ?auto_1562228 ) ) ( not ( = ?auto_1562223 ?auto_1562229 ) ) ( not ( = ?auto_1562223 ?auto_1562230 ) ) ( not ( = ?auto_1562223 ?auto_1562231 ) ) ( not ( = ?auto_1562224 ?auto_1562225 ) ) ( not ( = ?auto_1562224 ?auto_1562226 ) ) ( not ( = ?auto_1562224 ?auto_1562227 ) ) ( not ( = ?auto_1562224 ?auto_1562228 ) ) ( not ( = ?auto_1562224 ?auto_1562229 ) ) ( not ( = ?auto_1562224 ?auto_1562230 ) ) ( not ( = ?auto_1562224 ?auto_1562231 ) ) ( not ( = ?auto_1562225 ?auto_1562226 ) ) ( not ( = ?auto_1562225 ?auto_1562227 ) ) ( not ( = ?auto_1562225 ?auto_1562228 ) ) ( not ( = ?auto_1562225 ?auto_1562229 ) ) ( not ( = ?auto_1562225 ?auto_1562230 ) ) ( not ( = ?auto_1562225 ?auto_1562231 ) ) ( not ( = ?auto_1562226 ?auto_1562227 ) ) ( not ( = ?auto_1562226 ?auto_1562228 ) ) ( not ( = ?auto_1562226 ?auto_1562229 ) ) ( not ( = ?auto_1562226 ?auto_1562230 ) ) ( not ( = ?auto_1562226 ?auto_1562231 ) ) ( not ( = ?auto_1562227 ?auto_1562228 ) ) ( not ( = ?auto_1562227 ?auto_1562229 ) ) ( not ( = ?auto_1562227 ?auto_1562230 ) ) ( not ( = ?auto_1562227 ?auto_1562231 ) ) ( not ( = ?auto_1562228 ?auto_1562229 ) ) ( not ( = ?auto_1562228 ?auto_1562230 ) ) ( not ( = ?auto_1562228 ?auto_1562231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1562229 ?auto_1562230 ?auto_1562231 )
      ( MAKE-13CRATE-VERIFY ?auto_1562218 ?auto_1562219 ?auto_1562220 ?auto_1562222 ?auto_1562221 ?auto_1562223 ?auto_1562224 ?auto_1562225 ?auto_1562226 ?auto_1562227 ?auto_1562228 ?auto_1562229 ?auto_1562230 ?auto_1562231 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562374 - SURFACE
      ?auto_1562375 - SURFACE
      ?auto_1562376 - SURFACE
      ?auto_1562378 - SURFACE
      ?auto_1562377 - SURFACE
      ?auto_1562379 - SURFACE
      ?auto_1562380 - SURFACE
      ?auto_1562381 - SURFACE
      ?auto_1562382 - SURFACE
      ?auto_1562383 - SURFACE
      ?auto_1562384 - SURFACE
      ?auto_1562385 - SURFACE
      ?auto_1562386 - SURFACE
      ?auto_1562387 - SURFACE
    )
    :vars
    (
      ?auto_1562389 - HOIST
      ?auto_1562388 - PLACE
      ?auto_1562391 - TRUCK
      ?auto_1562390 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562389 ?auto_1562388 ) ( SURFACE-AT ?auto_1562386 ?auto_1562388 ) ( CLEAR ?auto_1562386 ) ( IS-CRATE ?auto_1562387 ) ( not ( = ?auto_1562386 ?auto_1562387 ) ) ( AVAILABLE ?auto_1562389 ) ( IN ?auto_1562387 ?auto_1562391 ) ( ON ?auto_1562386 ?auto_1562385 ) ( not ( = ?auto_1562385 ?auto_1562386 ) ) ( not ( = ?auto_1562385 ?auto_1562387 ) ) ( TRUCK-AT ?auto_1562391 ?auto_1562390 ) ( not ( = ?auto_1562390 ?auto_1562388 ) ) ( ON ?auto_1562375 ?auto_1562374 ) ( ON ?auto_1562376 ?auto_1562375 ) ( ON ?auto_1562378 ?auto_1562376 ) ( ON ?auto_1562377 ?auto_1562378 ) ( ON ?auto_1562379 ?auto_1562377 ) ( ON ?auto_1562380 ?auto_1562379 ) ( ON ?auto_1562381 ?auto_1562380 ) ( ON ?auto_1562382 ?auto_1562381 ) ( ON ?auto_1562383 ?auto_1562382 ) ( ON ?auto_1562384 ?auto_1562383 ) ( ON ?auto_1562385 ?auto_1562384 ) ( not ( = ?auto_1562374 ?auto_1562375 ) ) ( not ( = ?auto_1562374 ?auto_1562376 ) ) ( not ( = ?auto_1562374 ?auto_1562378 ) ) ( not ( = ?auto_1562374 ?auto_1562377 ) ) ( not ( = ?auto_1562374 ?auto_1562379 ) ) ( not ( = ?auto_1562374 ?auto_1562380 ) ) ( not ( = ?auto_1562374 ?auto_1562381 ) ) ( not ( = ?auto_1562374 ?auto_1562382 ) ) ( not ( = ?auto_1562374 ?auto_1562383 ) ) ( not ( = ?auto_1562374 ?auto_1562384 ) ) ( not ( = ?auto_1562374 ?auto_1562385 ) ) ( not ( = ?auto_1562374 ?auto_1562386 ) ) ( not ( = ?auto_1562374 ?auto_1562387 ) ) ( not ( = ?auto_1562375 ?auto_1562376 ) ) ( not ( = ?auto_1562375 ?auto_1562378 ) ) ( not ( = ?auto_1562375 ?auto_1562377 ) ) ( not ( = ?auto_1562375 ?auto_1562379 ) ) ( not ( = ?auto_1562375 ?auto_1562380 ) ) ( not ( = ?auto_1562375 ?auto_1562381 ) ) ( not ( = ?auto_1562375 ?auto_1562382 ) ) ( not ( = ?auto_1562375 ?auto_1562383 ) ) ( not ( = ?auto_1562375 ?auto_1562384 ) ) ( not ( = ?auto_1562375 ?auto_1562385 ) ) ( not ( = ?auto_1562375 ?auto_1562386 ) ) ( not ( = ?auto_1562375 ?auto_1562387 ) ) ( not ( = ?auto_1562376 ?auto_1562378 ) ) ( not ( = ?auto_1562376 ?auto_1562377 ) ) ( not ( = ?auto_1562376 ?auto_1562379 ) ) ( not ( = ?auto_1562376 ?auto_1562380 ) ) ( not ( = ?auto_1562376 ?auto_1562381 ) ) ( not ( = ?auto_1562376 ?auto_1562382 ) ) ( not ( = ?auto_1562376 ?auto_1562383 ) ) ( not ( = ?auto_1562376 ?auto_1562384 ) ) ( not ( = ?auto_1562376 ?auto_1562385 ) ) ( not ( = ?auto_1562376 ?auto_1562386 ) ) ( not ( = ?auto_1562376 ?auto_1562387 ) ) ( not ( = ?auto_1562378 ?auto_1562377 ) ) ( not ( = ?auto_1562378 ?auto_1562379 ) ) ( not ( = ?auto_1562378 ?auto_1562380 ) ) ( not ( = ?auto_1562378 ?auto_1562381 ) ) ( not ( = ?auto_1562378 ?auto_1562382 ) ) ( not ( = ?auto_1562378 ?auto_1562383 ) ) ( not ( = ?auto_1562378 ?auto_1562384 ) ) ( not ( = ?auto_1562378 ?auto_1562385 ) ) ( not ( = ?auto_1562378 ?auto_1562386 ) ) ( not ( = ?auto_1562378 ?auto_1562387 ) ) ( not ( = ?auto_1562377 ?auto_1562379 ) ) ( not ( = ?auto_1562377 ?auto_1562380 ) ) ( not ( = ?auto_1562377 ?auto_1562381 ) ) ( not ( = ?auto_1562377 ?auto_1562382 ) ) ( not ( = ?auto_1562377 ?auto_1562383 ) ) ( not ( = ?auto_1562377 ?auto_1562384 ) ) ( not ( = ?auto_1562377 ?auto_1562385 ) ) ( not ( = ?auto_1562377 ?auto_1562386 ) ) ( not ( = ?auto_1562377 ?auto_1562387 ) ) ( not ( = ?auto_1562379 ?auto_1562380 ) ) ( not ( = ?auto_1562379 ?auto_1562381 ) ) ( not ( = ?auto_1562379 ?auto_1562382 ) ) ( not ( = ?auto_1562379 ?auto_1562383 ) ) ( not ( = ?auto_1562379 ?auto_1562384 ) ) ( not ( = ?auto_1562379 ?auto_1562385 ) ) ( not ( = ?auto_1562379 ?auto_1562386 ) ) ( not ( = ?auto_1562379 ?auto_1562387 ) ) ( not ( = ?auto_1562380 ?auto_1562381 ) ) ( not ( = ?auto_1562380 ?auto_1562382 ) ) ( not ( = ?auto_1562380 ?auto_1562383 ) ) ( not ( = ?auto_1562380 ?auto_1562384 ) ) ( not ( = ?auto_1562380 ?auto_1562385 ) ) ( not ( = ?auto_1562380 ?auto_1562386 ) ) ( not ( = ?auto_1562380 ?auto_1562387 ) ) ( not ( = ?auto_1562381 ?auto_1562382 ) ) ( not ( = ?auto_1562381 ?auto_1562383 ) ) ( not ( = ?auto_1562381 ?auto_1562384 ) ) ( not ( = ?auto_1562381 ?auto_1562385 ) ) ( not ( = ?auto_1562381 ?auto_1562386 ) ) ( not ( = ?auto_1562381 ?auto_1562387 ) ) ( not ( = ?auto_1562382 ?auto_1562383 ) ) ( not ( = ?auto_1562382 ?auto_1562384 ) ) ( not ( = ?auto_1562382 ?auto_1562385 ) ) ( not ( = ?auto_1562382 ?auto_1562386 ) ) ( not ( = ?auto_1562382 ?auto_1562387 ) ) ( not ( = ?auto_1562383 ?auto_1562384 ) ) ( not ( = ?auto_1562383 ?auto_1562385 ) ) ( not ( = ?auto_1562383 ?auto_1562386 ) ) ( not ( = ?auto_1562383 ?auto_1562387 ) ) ( not ( = ?auto_1562384 ?auto_1562385 ) ) ( not ( = ?auto_1562384 ?auto_1562386 ) ) ( not ( = ?auto_1562384 ?auto_1562387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1562385 ?auto_1562386 ?auto_1562387 )
      ( MAKE-13CRATE-VERIFY ?auto_1562374 ?auto_1562375 ?auto_1562376 ?auto_1562378 ?auto_1562377 ?auto_1562379 ?auto_1562380 ?auto_1562381 ?auto_1562382 ?auto_1562383 ?auto_1562384 ?auto_1562385 ?auto_1562386 ?auto_1562387 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562543 - SURFACE
      ?auto_1562544 - SURFACE
      ?auto_1562545 - SURFACE
      ?auto_1562547 - SURFACE
      ?auto_1562546 - SURFACE
      ?auto_1562548 - SURFACE
      ?auto_1562549 - SURFACE
      ?auto_1562550 - SURFACE
      ?auto_1562551 - SURFACE
      ?auto_1562552 - SURFACE
      ?auto_1562553 - SURFACE
      ?auto_1562554 - SURFACE
      ?auto_1562555 - SURFACE
      ?auto_1562556 - SURFACE
    )
    :vars
    (
      ?auto_1562561 - HOIST
      ?auto_1562560 - PLACE
      ?auto_1562557 - TRUCK
      ?auto_1562558 - PLACE
      ?auto_1562559 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562561 ?auto_1562560 ) ( SURFACE-AT ?auto_1562555 ?auto_1562560 ) ( CLEAR ?auto_1562555 ) ( IS-CRATE ?auto_1562556 ) ( not ( = ?auto_1562555 ?auto_1562556 ) ) ( AVAILABLE ?auto_1562561 ) ( ON ?auto_1562555 ?auto_1562554 ) ( not ( = ?auto_1562554 ?auto_1562555 ) ) ( not ( = ?auto_1562554 ?auto_1562556 ) ) ( TRUCK-AT ?auto_1562557 ?auto_1562558 ) ( not ( = ?auto_1562558 ?auto_1562560 ) ) ( HOIST-AT ?auto_1562559 ?auto_1562558 ) ( LIFTING ?auto_1562559 ?auto_1562556 ) ( not ( = ?auto_1562561 ?auto_1562559 ) ) ( ON ?auto_1562544 ?auto_1562543 ) ( ON ?auto_1562545 ?auto_1562544 ) ( ON ?auto_1562547 ?auto_1562545 ) ( ON ?auto_1562546 ?auto_1562547 ) ( ON ?auto_1562548 ?auto_1562546 ) ( ON ?auto_1562549 ?auto_1562548 ) ( ON ?auto_1562550 ?auto_1562549 ) ( ON ?auto_1562551 ?auto_1562550 ) ( ON ?auto_1562552 ?auto_1562551 ) ( ON ?auto_1562553 ?auto_1562552 ) ( ON ?auto_1562554 ?auto_1562553 ) ( not ( = ?auto_1562543 ?auto_1562544 ) ) ( not ( = ?auto_1562543 ?auto_1562545 ) ) ( not ( = ?auto_1562543 ?auto_1562547 ) ) ( not ( = ?auto_1562543 ?auto_1562546 ) ) ( not ( = ?auto_1562543 ?auto_1562548 ) ) ( not ( = ?auto_1562543 ?auto_1562549 ) ) ( not ( = ?auto_1562543 ?auto_1562550 ) ) ( not ( = ?auto_1562543 ?auto_1562551 ) ) ( not ( = ?auto_1562543 ?auto_1562552 ) ) ( not ( = ?auto_1562543 ?auto_1562553 ) ) ( not ( = ?auto_1562543 ?auto_1562554 ) ) ( not ( = ?auto_1562543 ?auto_1562555 ) ) ( not ( = ?auto_1562543 ?auto_1562556 ) ) ( not ( = ?auto_1562544 ?auto_1562545 ) ) ( not ( = ?auto_1562544 ?auto_1562547 ) ) ( not ( = ?auto_1562544 ?auto_1562546 ) ) ( not ( = ?auto_1562544 ?auto_1562548 ) ) ( not ( = ?auto_1562544 ?auto_1562549 ) ) ( not ( = ?auto_1562544 ?auto_1562550 ) ) ( not ( = ?auto_1562544 ?auto_1562551 ) ) ( not ( = ?auto_1562544 ?auto_1562552 ) ) ( not ( = ?auto_1562544 ?auto_1562553 ) ) ( not ( = ?auto_1562544 ?auto_1562554 ) ) ( not ( = ?auto_1562544 ?auto_1562555 ) ) ( not ( = ?auto_1562544 ?auto_1562556 ) ) ( not ( = ?auto_1562545 ?auto_1562547 ) ) ( not ( = ?auto_1562545 ?auto_1562546 ) ) ( not ( = ?auto_1562545 ?auto_1562548 ) ) ( not ( = ?auto_1562545 ?auto_1562549 ) ) ( not ( = ?auto_1562545 ?auto_1562550 ) ) ( not ( = ?auto_1562545 ?auto_1562551 ) ) ( not ( = ?auto_1562545 ?auto_1562552 ) ) ( not ( = ?auto_1562545 ?auto_1562553 ) ) ( not ( = ?auto_1562545 ?auto_1562554 ) ) ( not ( = ?auto_1562545 ?auto_1562555 ) ) ( not ( = ?auto_1562545 ?auto_1562556 ) ) ( not ( = ?auto_1562547 ?auto_1562546 ) ) ( not ( = ?auto_1562547 ?auto_1562548 ) ) ( not ( = ?auto_1562547 ?auto_1562549 ) ) ( not ( = ?auto_1562547 ?auto_1562550 ) ) ( not ( = ?auto_1562547 ?auto_1562551 ) ) ( not ( = ?auto_1562547 ?auto_1562552 ) ) ( not ( = ?auto_1562547 ?auto_1562553 ) ) ( not ( = ?auto_1562547 ?auto_1562554 ) ) ( not ( = ?auto_1562547 ?auto_1562555 ) ) ( not ( = ?auto_1562547 ?auto_1562556 ) ) ( not ( = ?auto_1562546 ?auto_1562548 ) ) ( not ( = ?auto_1562546 ?auto_1562549 ) ) ( not ( = ?auto_1562546 ?auto_1562550 ) ) ( not ( = ?auto_1562546 ?auto_1562551 ) ) ( not ( = ?auto_1562546 ?auto_1562552 ) ) ( not ( = ?auto_1562546 ?auto_1562553 ) ) ( not ( = ?auto_1562546 ?auto_1562554 ) ) ( not ( = ?auto_1562546 ?auto_1562555 ) ) ( not ( = ?auto_1562546 ?auto_1562556 ) ) ( not ( = ?auto_1562548 ?auto_1562549 ) ) ( not ( = ?auto_1562548 ?auto_1562550 ) ) ( not ( = ?auto_1562548 ?auto_1562551 ) ) ( not ( = ?auto_1562548 ?auto_1562552 ) ) ( not ( = ?auto_1562548 ?auto_1562553 ) ) ( not ( = ?auto_1562548 ?auto_1562554 ) ) ( not ( = ?auto_1562548 ?auto_1562555 ) ) ( not ( = ?auto_1562548 ?auto_1562556 ) ) ( not ( = ?auto_1562549 ?auto_1562550 ) ) ( not ( = ?auto_1562549 ?auto_1562551 ) ) ( not ( = ?auto_1562549 ?auto_1562552 ) ) ( not ( = ?auto_1562549 ?auto_1562553 ) ) ( not ( = ?auto_1562549 ?auto_1562554 ) ) ( not ( = ?auto_1562549 ?auto_1562555 ) ) ( not ( = ?auto_1562549 ?auto_1562556 ) ) ( not ( = ?auto_1562550 ?auto_1562551 ) ) ( not ( = ?auto_1562550 ?auto_1562552 ) ) ( not ( = ?auto_1562550 ?auto_1562553 ) ) ( not ( = ?auto_1562550 ?auto_1562554 ) ) ( not ( = ?auto_1562550 ?auto_1562555 ) ) ( not ( = ?auto_1562550 ?auto_1562556 ) ) ( not ( = ?auto_1562551 ?auto_1562552 ) ) ( not ( = ?auto_1562551 ?auto_1562553 ) ) ( not ( = ?auto_1562551 ?auto_1562554 ) ) ( not ( = ?auto_1562551 ?auto_1562555 ) ) ( not ( = ?auto_1562551 ?auto_1562556 ) ) ( not ( = ?auto_1562552 ?auto_1562553 ) ) ( not ( = ?auto_1562552 ?auto_1562554 ) ) ( not ( = ?auto_1562552 ?auto_1562555 ) ) ( not ( = ?auto_1562552 ?auto_1562556 ) ) ( not ( = ?auto_1562553 ?auto_1562554 ) ) ( not ( = ?auto_1562553 ?auto_1562555 ) ) ( not ( = ?auto_1562553 ?auto_1562556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1562554 ?auto_1562555 ?auto_1562556 )
      ( MAKE-13CRATE-VERIFY ?auto_1562543 ?auto_1562544 ?auto_1562545 ?auto_1562547 ?auto_1562546 ?auto_1562548 ?auto_1562549 ?auto_1562550 ?auto_1562551 ?auto_1562552 ?auto_1562553 ?auto_1562554 ?auto_1562555 ?auto_1562556 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562725 - SURFACE
      ?auto_1562726 - SURFACE
      ?auto_1562727 - SURFACE
      ?auto_1562729 - SURFACE
      ?auto_1562728 - SURFACE
      ?auto_1562730 - SURFACE
      ?auto_1562731 - SURFACE
      ?auto_1562732 - SURFACE
      ?auto_1562733 - SURFACE
      ?auto_1562734 - SURFACE
      ?auto_1562735 - SURFACE
      ?auto_1562736 - SURFACE
      ?auto_1562737 - SURFACE
      ?auto_1562738 - SURFACE
    )
    :vars
    (
      ?auto_1562744 - HOIST
      ?auto_1562739 - PLACE
      ?auto_1562740 - TRUCK
      ?auto_1562743 - PLACE
      ?auto_1562742 - HOIST
      ?auto_1562741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562744 ?auto_1562739 ) ( SURFACE-AT ?auto_1562737 ?auto_1562739 ) ( CLEAR ?auto_1562737 ) ( IS-CRATE ?auto_1562738 ) ( not ( = ?auto_1562737 ?auto_1562738 ) ) ( AVAILABLE ?auto_1562744 ) ( ON ?auto_1562737 ?auto_1562736 ) ( not ( = ?auto_1562736 ?auto_1562737 ) ) ( not ( = ?auto_1562736 ?auto_1562738 ) ) ( TRUCK-AT ?auto_1562740 ?auto_1562743 ) ( not ( = ?auto_1562743 ?auto_1562739 ) ) ( HOIST-AT ?auto_1562742 ?auto_1562743 ) ( not ( = ?auto_1562744 ?auto_1562742 ) ) ( AVAILABLE ?auto_1562742 ) ( SURFACE-AT ?auto_1562738 ?auto_1562743 ) ( ON ?auto_1562738 ?auto_1562741 ) ( CLEAR ?auto_1562738 ) ( not ( = ?auto_1562737 ?auto_1562741 ) ) ( not ( = ?auto_1562738 ?auto_1562741 ) ) ( not ( = ?auto_1562736 ?auto_1562741 ) ) ( ON ?auto_1562726 ?auto_1562725 ) ( ON ?auto_1562727 ?auto_1562726 ) ( ON ?auto_1562729 ?auto_1562727 ) ( ON ?auto_1562728 ?auto_1562729 ) ( ON ?auto_1562730 ?auto_1562728 ) ( ON ?auto_1562731 ?auto_1562730 ) ( ON ?auto_1562732 ?auto_1562731 ) ( ON ?auto_1562733 ?auto_1562732 ) ( ON ?auto_1562734 ?auto_1562733 ) ( ON ?auto_1562735 ?auto_1562734 ) ( ON ?auto_1562736 ?auto_1562735 ) ( not ( = ?auto_1562725 ?auto_1562726 ) ) ( not ( = ?auto_1562725 ?auto_1562727 ) ) ( not ( = ?auto_1562725 ?auto_1562729 ) ) ( not ( = ?auto_1562725 ?auto_1562728 ) ) ( not ( = ?auto_1562725 ?auto_1562730 ) ) ( not ( = ?auto_1562725 ?auto_1562731 ) ) ( not ( = ?auto_1562725 ?auto_1562732 ) ) ( not ( = ?auto_1562725 ?auto_1562733 ) ) ( not ( = ?auto_1562725 ?auto_1562734 ) ) ( not ( = ?auto_1562725 ?auto_1562735 ) ) ( not ( = ?auto_1562725 ?auto_1562736 ) ) ( not ( = ?auto_1562725 ?auto_1562737 ) ) ( not ( = ?auto_1562725 ?auto_1562738 ) ) ( not ( = ?auto_1562725 ?auto_1562741 ) ) ( not ( = ?auto_1562726 ?auto_1562727 ) ) ( not ( = ?auto_1562726 ?auto_1562729 ) ) ( not ( = ?auto_1562726 ?auto_1562728 ) ) ( not ( = ?auto_1562726 ?auto_1562730 ) ) ( not ( = ?auto_1562726 ?auto_1562731 ) ) ( not ( = ?auto_1562726 ?auto_1562732 ) ) ( not ( = ?auto_1562726 ?auto_1562733 ) ) ( not ( = ?auto_1562726 ?auto_1562734 ) ) ( not ( = ?auto_1562726 ?auto_1562735 ) ) ( not ( = ?auto_1562726 ?auto_1562736 ) ) ( not ( = ?auto_1562726 ?auto_1562737 ) ) ( not ( = ?auto_1562726 ?auto_1562738 ) ) ( not ( = ?auto_1562726 ?auto_1562741 ) ) ( not ( = ?auto_1562727 ?auto_1562729 ) ) ( not ( = ?auto_1562727 ?auto_1562728 ) ) ( not ( = ?auto_1562727 ?auto_1562730 ) ) ( not ( = ?auto_1562727 ?auto_1562731 ) ) ( not ( = ?auto_1562727 ?auto_1562732 ) ) ( not ( = ?auto_1562727 ?auto_1562733 ) ) ( not ( = ?auto_1562727 ?auto_1562734 ) ) ( not ( = ?auto_1562727 ?auto_1562735 ) ) ( not ( = ?auto_1562727 ?auto_1562736 ) ) ( not ( = ?auto_1562727 ?auto_1562737 ) ) ( not ( = ?auto_1562727 ?auto_1562738 ) ) ( not ( = ?auto_1562727 ?auto_1562741 ) ) ( not ( = ?auto_1562729 ?auto_1562728 ) ) ( not ( = ?auto_1562729 ?auto_1562730 ) ) ( not ( = ?auto_1562729 ?auto_1562731 ) ) ( not ( = ?auto_1562729 ?auto_1562732 ) ) ( not ( = ?auto_1562729 ?auto_1562733 ) ) ( not ( = ?auto_1562729 ?auto_1562734 ) ) ( not ( = ?auto_1562729 ?auto_1562735 ) ) ( not ( = ?auto_1562729 ?auto_1562736 ) ) ( not ( = ?auto_1562729 ?auto_1562737 ) ) ( not ( = ?auto_1562729 ?auto_1562738 ) ) ( not ( = ?auto_1562729 ?auto_1562741 ) ) ( not ( = ?auto_1562728 ?auto_1562730 ) ) ( not ( = ?auto_1562728 ?auto_1562731 ) ) ( not ( = ?auto_1562728 ?auto_1562732 ) ) ( not ( = ?auto_1562728 ?auto_1562733 ) ) ( not ( = ?auto_1562728 ?auto_1562734 ) ) ( not ( = ?auto_1562728 ?auto_1562735 ) ) ( not ( = ?auto_1562728 ?auto_1562736 ) ) ( not ( = ?auto_1562728 ?auto_1562737 ) ) ( not ( = ?auto_1562728 ?auto_1562738 ) ) ( not ( = ?auto_1562728 ?auto_1562741 ) ) ( not ( = ?auto_1562730 ?auto_1562731 ) ) ( not ( = ?auto_1562730 ?auto_1562732 ) ) ( not ( = ?auto_1562730 ?auto_1562733 ) ) ( not ( = ?auto_1562730 ?auto_1562734 ) ) ( not ( = ?auto_1562730 ?auto_1562735 ) ) ( not ( = ?auto_1562730 ?auto_1562736 ) ) ( not ( = ?auto_1562730 ?auto_1562737 ) ) ( not ( = ?auto_1562730 ?auto_1562738 ) ) ( not ( = ?auto_1562730 ?auto_1562741 ) ) ( not ( = ?auto_1562731 ?auto_1562732 ) ) ( not ( = ?auto_1562731 ?auto_1562733 ) ) ( not ( = ?auto_1562731 ?auto_1562734 ) ) ( not ( = ?auto_1562731 ?auto_1562735 ) ) ( not ( = ?auto_1562731 ?auto_1562736 ) ) ( not ( = ?auto_1562731 ?auto_1562737 ) ) ( not ( = ?auto_1562731 ?auto_1562738 ) ) ( not ( = ?auto_1562731 ?auto_1562741 ) ) ( not ( = ?auto_1562732 ?auto_1562733 ) ) ( not ( = ?auto_1562732 ?auto_1562734 ) ) ( not ( = ?auto_1562732 ?auto_1562735 ) ) ( not ( = ?auto_1562732 ?auto_1562736 ) ) ( not ( = ?auto_1562732 ?auto_1562737 ) ) ( not ( = ?auto_1562732 ?auto_1562738 ) ) ( not ( = ?auto_1562732 ?auto_1562741 ) ) ( not ( = ?auto_1562733 ?auto_1562734 ) ) ( not ( = ?auto_1562733 ?auto_1562735 ) ) ( not ( = ?auto_1562733 ?auto_1562736 ) ) ( not ( = ?auto_1562733 ?auto_1562737 ) ) ( not ( = ?auto_1562733 ?auto_1562738 ) ) ( not ( = ?auto_1562733 ?auto_1562741 ) ) ( not ( = ?auto_1562734 ?auto_1562735 ) ) ( not ( = ?auto_1562734 ?auto_1562736 ) ) ( not ( = ?auto_1562734 ?auto_1562737 ) ) ( not ( = ?auto_1562734 ?auto_1562738 ) ) ( not ( = ?auto_1562734 ?auto_1562741 ) ) ( not ( = ?auto_1562735 ?auto_1562736 ) ) ( not ( = ?auto_1562735 ?auto_1562737 ) ) ( not ( = ?auto_1562735 ?auto_1562738 ) ) ( not ( = ?auto_1562735 ?auto_1562741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1562736 ?auto_1562737 ?auto_1562738 )
      ( MAKE-13CRATE-VERIFY ?auto_1562725 ?auto_1562726 ?auto_1562727 ?auto_1562729 ?auto_1562728 ?auto_1562730 ?auto_1562731 ?auto_1562732 ?auto_1562733 ?auto_1562734 ?auto_1562735 ?auto_1562736 ?auto_1562737 ?auto_1562738 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1562908 - SURFACE
      ?auto_1562909 - SURFACE
      ?auto_1562910 - SURFACE
      ?auto_1562912 - SURFACE
      ?auto_1562911 - SURFACE
      ?auto_1562913 - SURFACE
      ?auto_1562914 - SURFACE
      ?auto_1562915 - SURFACE
      ?auto_1562916 - SURFACE
      ?auto_1562917 - SURFACE
      ?auto_1562918 - SURFACE
      ?auto_1562919 - SURFACE
      ?auto_1562920 - SURFACE
      ?auto_1562921 - SURFACE
    )
    :vars
    (
      ?auto_1562924 - HOIST
      ?auto_1562922 - PLACE
      ?auto_1562923 - PLACE
      ?auto_1562927 - HOIST
      ?auto_1562926 - SURFACE
      ?auto_1562925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562924 ?auto_1562922 ) ( SURFACE-AT ?auto_1562920 ?auto_1562922 ) ( CLEAR ?auto_1562920 ) ( IS-CRATE ?auto_1562921 ) ( not ( = ?auto_1562920 ?auto_1562921 ) ) ( AVAILABLE ?auto_1562924 ) ( ON ?auto_1562920 ?auto_1562919 ) ( not ( = ?auto_1562919 ?auto_1562920 ) ) ( not ( = ?auto_1562919 ?auto_1562921 ) ) ( not ( = ?auto_1562923 ?auto_1562922 ) ) ( HOIST-AT ?auto_1562927 ?auto_1562923 ) ( not ( = ?auto_1562924 ?auto_1562927 ) ) ( AVAILABLE ?auto_1562927 ) ( SURFACE-AT ?auto_1562921 ?auto_1562923 ) ( ON ?auto_1562921 ?auto_1562926 ) ( CLEAR ?auto_1562921 ) ( not ( = ?auto_1562920 ?auto_1562926 ) ) ( not ( = ?auto_1562921 ?auto_1562926 ) ) ( not ( = ?auto_1562919 ?auto_1562926 ) ) ( TRUCK-AT ?auto_1562925 ?auto_1562922 ) ( ON ?auto_1562909 ?auto_1562908 ) ( ON ?auto_1562910 ?auto_1562909 ) ( ON ?auto_1562912 ?auto_1562910 ) ( ON ?auto_1562911 ?auto_1562912 ) ( ON ?auto_1562913 ?auto_1562911 ) ( ON ?auto_1562914 ?auto_1562913 ) ( ON ?auto_1562915 ?auto_1562914 ) ( ON ?auto_1562916 ?auto_1562915 ) ( ON ?auto_1562917 ?auto_1562916 ) ( ON ?auto_1562918 ?auto_1562917 ) ( ON ?auto_1562919 ?auto_1562918 ) ( not ( = ?auto_1562908 ?auto_1562909 ) ) ( not ( = ?auto_1562908 ?auto_1562910 ) ) ( not ( = ?auto_1562908 ?auto_1562912 ) ) ( not ( = ?auto_1562908 ?auto_1562911 ) ) ( not ( = ?auto_1562908 ?auto_1562913 ) ) ( not ( = ?auto_1562908 ?auto_1562914 ) ) ( not ( = ?auto_1562908 ?auto_1562915 ) ) ( not ( = ?auto_1562908 ?auto_1562916 ) ) ( not ( = ?auto_1562908 ?auto_1562917 ) ) ( not ( = ?auto_1562908 ?auto_1562918 ) ) ( not ( = ?auto_1562908 ?auto_1562919 ) ) ( not ( = ?auto_1562908 ?auto_1562920 ) ) ( not ( = ?auto_1562908 ?auto_1562921 ) ) ( not ( = ?auto_1562908 ?auto_1562926 ) ) ( not ( = ?auto_1562909 ?auto_1562910 ) ) ( not ( = ?auto_1562909 ?auto_1562912 ) ) ( not ( = ?auto_1562909 ?auto_1562911 ) ) ( not ( = ?auto_1562909 ?auto_1562913 ) ) ( not ( = ?auto_1562909 ?auto_1562914 ) ) ( not ( = ?auto_1562909 ?auto_1562915 ) ) ( not ( = ?auto_1562909 ?auto_1562916 ) ) ( not ( = ?auto_1562909 ?auto_1562917 ) ) ( not ( = ?auto_1562909 ?auto_1562918 ) ) ( not ( = ?auto_1562909 ?auto_1562919 ) ) ( not ( = ?auto_1562909 ?auto_1562920 ) ) ( not ( = ?auto_1562909 ?auto_1562921 ) ) ( not ( = ?auto_1562909 ?auto_1562926 ) ) ( not ( = ?auto_1562910 ?auto_1562912 ) ) ( not ( = ?auto_1562910 ?auto_1562911 ) ) ( not ( = ?auto_1562910 ?auto_1562913 ) ) ( not ( = ?auto_1562910 ?auto_1562914 ) ) ( not ( = ?auto_1562910 ?auto_1562915 ) ) ( not ( = ?auto_1562910 ?auto_1562916 ) ) ( not ( = ?auto_1562910 ?auto_1562917 ) ) ( not ( = ?auto_1562910 ?auto_1562918 ) ) ( not ( = ?auto_1562910 ?auto_1562919 ) ) ( not ( = ?auto_1562910 ?auto_1562920 ) ) ( not ( = ?auto_1562910 ?auto_1562921 ) ) ( not ( = ?auto_1562910 ?auto_1562926 ) ) ( not ( = ?auto_1562912 ?auto_1562911 ) ) ( not ( = ?auto_1562912 ?auto_1562913 ) ) ( not ( = ?auto_1562912 ?auto_1562914 ) ) ( not ( = ?auto_1562912 ?auto_1562915 ) ) ( not ( = ?auto_1562912 ?auto_1562916 ) ) ( not ( = ?auto_1562912 ?auto_1562917 ) ) ( not ( = ?auto_1562912 ?auto_1562918 ) ) ( not ( = ?auto_1562912 ?auto_1562919 ) ) ( not ( = ?auto_1562912 ?auto_1562920 ) ) ( not ( = ?auto_1562912 ?auto_1562921 ) ) ( not ( = ?auto_1562912 ?auto_1562926 ) ) ( not ( = ?auto_1562911 ?auto_1562913 ) ) ( not ( = ?auto_1562911 ?auto_1562914 ) ) ( not ( = ?auto_1562911 ?auto_1562915 ) ) ( not ( = ?auto_1562911 ?auto_1562916 ) ) ( not ( = ?auto_1562911 ?auto_1562917 ) ) ( not ( = ?auto_1562911 ?auto_1562918 ) ) ( not ( = ?auto_1562911 ?auto_1562919 ) ) ( not ( = ?auto_1562911 ?auto_1562920 ) ) ( not ( = ?auto_1562911 ?auto_1562921 ) ) ( not ( = ?auto_1562911 ?auto_1562926 ) ) ( not ( = ?auto_1562913 ?auto_1562914 ) ) ( not ( = ?auto_1562913 ?auto_1562915 ) ) ( not ( = ?auto_1562913 ?auto_1562916 ) ) ( not ( = ?auto_1562913 ?auto_1562917 ) ) ( not ( = ?auto_1562913 ?auto_1562918 ) ) ( not ( = ?auto_1562913 ?auto_1562919 ) ) ( not ( = ?auto_1562913 ?auto_1562920 ) ) ( not ( = ?auto_1562913 ?auto_1562921 ) ) ( not ( = ?auto_1562913 ?auto_1562926 ) ) ( not ( = ?auto_1562914 ?auto_1562915 ) ) ( not ( = ?auto_1562914 ?auto_1562916 ) ) ( not ( = ?auto_1562914 ?auto_1562917 ) ) ( not ( = ?auto_1562914 ?auto_1562918 ) ) ( not ( = ?auto_1562914 ?auto_1562919 ) ) ( not ( = ?auto_1562914 ?auto_1562920 ) ) ( not ( = ?auto_1562914 ?auto_1562921 ) ) ( not ( = ?auto_1562914 ?auto_1562926 ) ) ( not ( = ?auto_1562915 ?auto_1562916 ) ) ( not ( = ?auto_1562915 ?auto_1562917 ) ) ( not ( = ?auto_1562915 ?auto_1562918 ) ) ( not ( = ?auto_1562915 ?auto_1562919 ) ) ( not ( = ?auto_1562915 ?auto_1562920 ) ) ( not ( = ?auto_1562915 ?auto_1562921 ) ) ( not ( = ?auto_1562915 ?auto_1562926 ) ) ( not ( = ?auto_1562916 ?auto_1562917 ) ) ( not ( = ?auto_1562916 ?auto_1562918 ) ) ( not ( = ?auto_1562916 ?auto_1562919 ) ) ( not ( = ?auto_1562916 ?auto_1562920 ) ) ( not ( = ?auto_1562916 ?auto_1562921 ) ) ( not ( = ?auto_1562916 ?auto_1562926 ) ) ( not ( = ?auto_1562917 ?auto_1562918 ) ) ( not ( = ?auto_1562917 ?auto_1562919 ) ) ( not ( = ?auto_1562917 ?auto_1562920 ) ) ( not ( = ?auto_1562917 ?auto_1562921 ) ) ( not ( = ?auto_1562917 ?auto_1562926 ) ) ( not ( = ?auto_1562918 ?auto_1562919 ) ) ( not ( = ?auto_1562918 ?auto_1562920 ) ) ( not ( = ?auto_1562918 ?auto_1562921 ) ) ( not ( = ?auto_1562918 ?auto_1562926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1562919 ?auto_1562920 ?auto_1562921 )
      ( MAKE-13CRATE-VERIFY ?auto_1562908 ?auto_1562909 ?auto_1562910 ?auto_1562912 ?auto_1562911 ?auto_1562913 ?auto_1562914 ?auto_1562915 ?auto_1562916 ?auto_1562917 ?auto_1562918 ?auto_1562919 ?auto_1562920 ?auto_1562921 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563091 - SURFACE
      ?auto_1563092 - SURFACE
      ?auto_1563093 - SURFACE
      ?auto_1563095 - SURFACE
      ?auto_1563094 - SURFACE
      ?auto_1563096 - SURFACE
      ?auto_1563097 - SURFACE
      ?auto_1563098 - SURFACE
      ?auto_1563099 - SURFACE
      ?auto_1563100 - SURFACE
      ?auto_1563101 - SURFACE
      ?auto_1563102 - SURFACE
      ?auto_1563103 - SURFACE
      ?auto_1563104 - SURFACE
    )
    :vars
    (
      ?auto_1563109 - HOIST
      ?auto_1563107 - PLACE
      ?auto_1563105 - PLACE
      ?auto_1563108 - HOIST
      ?auto_1563110 - SURFACE
      ?auto_1563106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563109 ?auto_1563107 ) ( IS-CRATE ?auto_1563104 ) ( not ( = ?auto_1563103 ?auto_1563104 ) ) ( not ( = ?auto_1563102 ?auto_1563103 ) ) ( not ( = ?auto_1563102 ?auto_1563104 ) ) ( not ( = ?auto_1563105 ?auto_1563107 ) ) ( HOIST-AT ?auto_1563108 ?auto_1563105 ) ( not ( = ?auto_1563109 ?auto_1563108 ) ) ( AVAILABLE ?auto_1563108 ) ( SURFACE-AT ?auto_1563104 ?auto_1563105 ) ( ON ?auto_1563104 ?auto_1563110 ) ( CLEAR ?auto_1563104 ) ( not ( = ?auto_1563103 ?auto_1563110 ) ) ( not ( = ?auto_1563104 ?auto_1563110 ) ) ( not ( = ?auto_1563102 ?auto_1563110 ) ) ( TRUCK-AT ?auto_1563106 ?auto_1563107 ) ( SURFACE-AT ?auto_1563102 ?auto_1563107 ) ( CLEAR ?auto_1563102 ) ( LIFTING ?auto_1563109 ?auto_1563103 ) ( IS-CRATE ?auto_1563103 ) ( ON ?auto_1563092 ?auto_1563091 ) ( ON ?auto_1563093 ?auto_1563092 ) ( ON ?auto_1563095 ?auto_1563093 ) ( ON ?auto_1563094 ?auto_1563095 ) ( ON ?auto_1563096 ?auto_1563094 ) ( ON ?auto_1563097 ?auto_1563096 ) ( ON ?auto_1563098 ?auto_1563097 ) ( ON ?auto_1563099 ?auto_1563098 ) ( ON ?auto_1563100 ?auto_1563099 ) ( ON ?auto_1563101 ?auto_1563100 ) ( ON ?auto_1563102 ?auto_1563101 ) ( not ( = ?auto_1563091 ?auto_1563092 ) ) ( not ( = ?auto_1563091 ?auto_1563093 ) ) ( not ( = ?auto_1563091 ?auto_1563095 ) ) ( not ( = ?auto_1563091 ?auto_1563094 ) ) ( not ( = ?auto_1563091 ?auto_1563096 ) ) ( not ( = ?auto_1563091 ?auto_1563097 ) ) ( not ( = ?auto_1563091 ?auto_1563098 ) ) ( not ( = ?auto_1563091 ?auto_1563099 ) ) ( not ( = ?auto_1563091 ?auto_1563100 ) ) ( not ( = ?auto_1563091 ?auto_1563101 ) ) ( not ( = ?auto_1563091 ?auto_1563102 ) ) ( not ( = ?auto_1563091 ?auto_1563103 ) ) ( not ( = ?auto_1563091 ?auto_1563104 ) ) ( not ( = ?auto_1563091 ?auto_1563110 ) ) ( not ( = ?auto_1563092 ?auto_1563093 ) ) ( not ( = ?auto_1563092 ?auto_1563095 ) ) ( not ( = ?auto_1563092 ?auto_1563094 ) ) ( not ( = ?auto_1563092 ?auto_1563096 ) ) ( not ( = ?auto_1563092 ?auto_1563097 ) ) ( not ( = ?auto_1563092 ?auto_1563098 ) ) ( not ( = ?auto_1563092 ?auto_1563099 ) ) ( not ( = ?auto_1563092 ?auto_1563100 ) ) ( not ( = ?auto_1563092 ?auto_1563101 ) ) ( not ( = ?auto_1563092 ?auto_1563102 ) ) ( not ( = ?auto_1563092 ?auto_1563103 ) ) ( not ( = ?auto_1563092 ?auto_1563104 ) ) ( not ( = ?auto_1563092 ?auto_1563110 ) ) ( not ( = ?auto_1563093 ?auto_1563095 ) ) ( not ( = ?auto_1563093 ?auto_1563094 ) ) ( not ( = ?auto_1563093 ?auto_1563096 ) ) ( not ( = ?auto_1563093 ?auto_1563097 ) ) ( not ( = ?auto_1563093 ?auto_1563098 ) ) ( not ( = ?auto_1563093 ?auto_1563099 ) ) ( not ( = ?auto_1563093 ?auto_1563100 ) ) ( not ( = ?auto_1563093 ?auto_1563101 ) ) ( not ( = ?auto_1563093 ?auto_1563102 ) ) ( not ( = ?auto_1563093 ?auto_1563103 ) ) ( not ( = ?auto_1563093 ?auto_1563104 ) ) ( not ( = ?auto_1563093 ?auto_1563110 ) ) ( not ( = ?auto_1563095 ?auto_1563094 ) ) ( not ( = ?auto_1563095 ?auto_1563096 ) ) ( not ( = ?auto_1563095 ?auto_1563097 ) ) ( not ( = ?auto_1563095 ?auto_1563098 ) ) ( not ( = ?auto_1563095 ?auto_1563099 ) ) ( not ( = ?auto_1563095 ?auto_1563100 ) ) ( not ( = ?auto_1563095 ?auto_1563101 ) ) ( not ( = ?auto_1563095 ?auto_1563102 ) ) ( not ( = ?auto_1563095 ?auto_1563103 ) ) ( not ( = ?auto_1563095 ?auto_1563104 ) ) ( not ( = ?auto_1563095 ?auto_1563110 ) ) ( not ( = ?auto_1563094 ?auto_1563096 ) ) ( not ( = ?auto_1563094 ?auto_1563097 ) ) ( not ( = ?auto_1563094 ?auto_1563098 ) ) ( not ( = ?auto_1563094 ?auto_1563099 ) ) ( not ( = ?auto_1563094 ?auto_1563100 ) ) ( not ( = ?auto_1563094 ?auto_1563101 ) ) ( not ( = ?auto_1563094 ?auto_1563102 ) ) ( not ( = ?auto_1563094 ?auto_1563103 ) ) ( not ( = ?auto_1563094 ?auto_1563104 ) ) ( not ( = ?auto_1563094 ?auto_1563110 ) ) ( not ( = ?auto_1563096 ?auto_1563097 ) ) ( not ( = ?auto_1563096 ?auto_1563098 ) ) ( not ( = ?auto_1563096 ?auto_1563099 ) ) ( not ( = ?auto_1563096 ?auto_1563100 ) ) ( not ( = ?auto_1563096 ?auto_1563101 ) ) ( not ( = ?auto_1563096 ?auto_1563102 ) ) ( not ( = ?auto_1563096 ?auto_1563103 ) ) ( not ( = ?auto_1563096 ?auto_1563104 ) ) ( not ( = ?auto_1563096 ?auto_1563110 ) ) ( not ( = ?auto_1563097 ?auto_1563098 ) ) ( not ( = ?auto_1563097 ?auto_1563099 ) ) ( not ( = ?auto_1563097 ?auto_1563100 ) ) ( not ( = ?auto_1563097 ?auto_1563101 ) ) ( not ( = ?auto_1563097 ?auto_1563102 ) ) ( not ( = ?auto_1563097 ?auto_1563103 ) ) ( not ( = ?auto_1563097 ?auto_1563104 ) ) ( not ( = ?auto_1563097 ?auto_1563110 ) ) ( not ( = ?auto_1563098 ?auto_1563099 ) ) ( not ( = ?auto_1563098 ?auto_1563100 ) ) ( not ( = ?auto_1563098 ?auto_1563101 ) ) ( not ( = ?auto_1563098 ?auto_1563102 ) ) ( not ( = ?auto_1563098 ?auto_1563103 ) ) ( not ( = ?auto_1563098 ?auto_1563104 ) ) ( not ( = ?auto_1563098 ?auto_1563110 ) ) ( not ( = ?auto_1563099 ?auto_1563100 ) ) ( not ( = ?auto_1563099 ?auto_1563101 ) ) ( not ( = ?auto_1563099 ?auto_1563102 ) ) ( not ( = ?auto_1563099 ?auto_1563103 ) ) ( not ( = ?auto_1563099 ?auto_1563104 ) ) ( not ( = ?auto_1563099 ?auto_1563110 ) ) ( not ( = ?auto_1563100 ?auto_1563101 ) ) ( not ( = ?auto_1563100 ?auto_1563102 ) ) ( not ( = ?auto_1563100 ?auto_1563103 ) ) ( not ( = ?auto_1563100 ?auto_1563104 ) ) ( not ( = ?auto_1563100 ?auto_1563110 ) ) ( not ( = ?auto_1563101 ?auto_1563102 ) ) ( not ( = ?auto_1563101 ?auto_1563103 ) ) ( not ( = ?auto_1563101 ?auto_1563104 ) ) ( not ( = ?auto_1563101 ?auto_1563110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563102 ?auto_1563103 ?auto_1563104 )
      ( MAKE-13CRATE-VERIFY ?auto_1563091 ?auto_1563092 ?auto_1563093 ?auto_1563095 ?auto_1563094 ?auto_1563096 ?auto_1563097 ?auto_1563098 ?auto_1563099 ?auto_1563100 ?auto_1563101 ?auto_1563102 ?auto_1563103 ?auto_1563104 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563274 - SURFACE
      ?auto_1563275 - SURFACE
      ?auto_1563276 - SURFACE
      ?auto_1563278 - SURFACE
      ?auto_1563277 - SURFACE
      ?auto_1563279 - SURFACE
      ?auto_1563280 - SURFACE
      ?auto_1563281 - SURFACE
      ?auto_1563282 - SURFACE
      ?auto_1563283 - SURFACE
      ?auto_1563284 - SURFACE
      ?auto_1563285 - SURFACE
      ?auto_1563286 - SURFACE
      ?auto_1563287 - SURFACE
    )
    :vars
    (
      ?auto_1563288 - HOIST
      ?auto_1563289 - PLACE
      ?auto_1563290 - PLACE
      ?auto_1563291 - HOIST
      ?auto_1563292 - SURFACE
      ?auto_1563293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563288 ?auto_1563289 ) ( IS-CRATE ?auto_1563287 ) ( not ( = ?auto_1563286 ?auto_1563287 ) ) ( not ( = ?auto_1563285 ?auto_1563286 ) ) ( not ( = ?auto_1563285 ?auto_1563287 ) ) ( not ( = ?auto_1563290 ?auto_1563289 ) ) ( HOIST-AT ?auto_1563291 ?auto_1563290 ) ( not ( = ?auto_1563288 ?auto_1563291 ) ) ( AVAILABLE ?auto_1563291 ) ( SURFACE-AT ?auto_1563287 ?auto_1563290 ) ( ON ?auto_1563287 ?auto_1563292 ) ( CLEAR ?auto_1563287 ) ( not ( = ?auto_1563286 ?auto_1563292 ) ) ( not ( = ?auto_1563287 ?auto_1563292 ) ) ( not ( = ?auto_1563285 ?auto_1563292 ) ) ( TRUCK-AT ?auto_1563293 ?auto_1563289 ) ( SURFACE-AT ?auto_1563285 ?auto_1563289 ) ( CLEAR ?auto_1563285 ) ( IS-CRATE ?auto_1563286 ) ( AVAILABLE ?auto_1563288 ) ( IN ?auto_1563286 ?auto_1563293 ) ( ON ?auto_1563275 ?auto_1563274 ) ( ON ?auto_1563276 ?auto_1563275 ) ( ON ?auto_1563278 ?auto_1563276 ) ( ON ?auto_1563277 ?auto_1563278 ) ( ON ?auto_1563279 ?auto_1563277 ) ( ON ?auto_1563280 ?auto_1563279 ) ( ON ?auto_1563281 ?auto_1563280 ) ( ON ?auto_1563282 ?auto_1563281 ) ( ON ?auto_1563283 ?auto_1563282 ) ( ON ?auto_1563284 ?auto_1563283 ) ( ON ?auto_1563285 ?auto_1563284 ) ( not ( = ?auto_1563274 ?auto_1563275 ) ) ( not ( = ?auto_1563274 ?auto_1563276 ) ) ( not ( = ?auto_1563274 ?auto_1563278 ) ) ( not ( = ?auto_1563274 ?auto_1563277 ) ) ( not ( = ?auto_1563274 ?auto_1563279 ) ) ( not ( = ?auto_1563274 ?auto_1563280 ) ) ( not ( = ?auto_1563274 ?auto_1563281 ) ) ( not ( = ?auto_1563274 ?auto_1563282 ) ) ( not ( = ?auto_1563274 ?auto_1563283 ) ) ( not ( = ?auto_1563274 ?auto_1563284 ) ) ( not ( = ?auto_1563274 ?auto_1563285 ) ) ( not ( = ?auto_1563274 ?auto_1563286 ) ) ( not ( = ?auto_1563274 ?auto_1563287 ) ) ( not ( = ?auto_1563274 ?auto_1563292 ) ) ( not ( = ?auto_1563275 ?auto_1563276 ) ) ( not ( = ?auto_1563275 ?auto_1563278 ) ) ( not ( = ?auto_1563275 ?auto_1563277 ) ) ( not ( = ?auto_1563275 ?auto_1563279 ) ) ( not ( = ?auto_1563275 ?auto_1563280 ) ) ( not ( = ?auto_1563275 ?auto_1563281 ) ) ( not ( = ?auto_1563275 ?auto_1563282 ) ) ( not ( = ?auto_1563275 ?auto_1563283 ) ) ( not ( = ?auto_1563275 ?auto_1563284 ) ) ( not ( = ?auto_1563275 ?auto_1563285 ) ) ( not ( = ?auto_1563275 ?auto_1563286 ) ) ( not ( = ?auto_1563275 ?auto_1563287 ) ) ( not ( = ?auto_1563275 ?auto_1563292 ) ) ( not ( = ?auto_1563276 ?auto_1563278 ) ) ( not ( = ?auto_1563276 ?auto_1563277 ) ) ( not ( = ?auto_1563276 ?auto_1563279 ) ) ( not ( = ?auto_1563276 ?auto_1563280 ) ) ( not ( = ?auto_1563276 ?auto_1563281 ) ) ( not ( = ?auto_1563276 ?auto_1563282 ) ) ( not ( = ?auto_1563276 ?auto_1563283 ) ) ( not ( = ?auto_1563276 ?auto_1563284 ) ) ( not ( = ?auto_1563276 ?auto_1563285 ) ) ( not ( = ?auto_1563276 ?auto_1563286 ) ) ( not ( = ?auto_1563276 ?auto_1563287 ) ) ( not ( = ?auto_1563276 ?auto_1563292 ) ) ( not ( = ?auto_1563278 ?auto_1563277 ) ) ( not ( = ?auto_1563278 ?auto_1563279 ) ) ( not ( = ?auto_1563278 ?auto_1563280 ) ) ( not ( = ?auto_1563278 ?auto_1563281 ) ) ( not ( = ?auto_1563278 ?auto_1563282 ) ) ( not ( = ?auto_1563278 ?auto_1563283 ) ) ( not ( = ?auto_1563278 ?auto_1563284 ) ) ( not ( = ?auto_1563278 ?auto_1563285 ) ) ( not ( = ?auto_1563278 ?auto_1563286 ) ) ( not ( = ?auto_1563278 ?auto_1563287 ) ) ( not ( = ?auto_1563278 ?auto_1563292 ) ) ( not ( = ?auto_1563277 ?auto_1563279 ) ) ( not ( = ?auto_1563277 ?auto_1563280 ) ) ( not ( = ?auto_1563277 ?auto_1563281 ) ) ( not ( = ?auto_1563277 ?auto_1563282 ) ) ( not ( = ?auto_1563277 ?auto_1563283 ) ) ( not ( = ?auto_1563277 ?auto_1563284 ) ) ( not ( = ?auto_1563277 ?auto_1563285 ) ) ( not ( = ?auto_1563277 ?auto_1563286 ) ) ( not ( = ?auto_1563277 ?auto_1563287 ) ) ( not ( = ?auto_1563277 ?auto_1563292 ) ) ( not ( = ?auto_1563279 ?auto_1563280 ) ) ( not ( = ?auto_1563279 ?auto_1563281 ) ) ( not ( = ?auto_1563279 ?auto_1563282 ) ) ( not ( = ?auto_1563279 ?auto_1563283 ) ) ( not ( = ?auto_1563279 ?auto_1563284 ) ) ( not ( = ?auto_1563279 ?auto_1563285 ) ) ( not ( = ?auto_1563279 ?auto_1563286 ) ) ( not ( = ?auto_1563279 ?auto_1563287 ) ) ( not ( = ?auto_1563279 ?auto_1563292 ) ) ( not ( = ?auto_1563280 ?auto_1563281 ) ) ( not ( = ?auto_1563280 ?auto_1563282 ) ) ( not ( = ?auto_1563280 ?auto_1563283 ) ) ( not ( = ?auto_1563280 ?auto_1563284 ) ) ( not ( = ?auto_1563280 ?auto_1563285 ) ) ( not ( = ?auto_1563280 ?auto_1563286 ) ) ( not ( = ?auto_1563280 ?auto_1563287 ) ) ( not ( = ?auto_1563280 ?auto_1563292 ) ) ( not ( = ?auto_1563281 ?auto_1563282 ) ) ( not ( = ?auto_1563281 ?auto_1563283 ) ) ( not ( = ?auto_1563281 ?auto_1563284 ) ) ( not ( = ?auto_1563281 ?auto_1563285 ) ) ( not ( = ?auto_1563281 ?auto_1563286 ) ) ( not ( = ?auto_1563281 ?auto_1563287 ) ) ( not ( = ?auto_1563281 ?auto_1563292 ) ) ( not ( = ?auto_1563282 ?auto_1563283 ) ) ( not ( = ?auto_1563282 ?auto_1563284 ) ) ( not ( = ?auto_1563282 ?auto_1563285 ) ) ( not ( = ?auto_1563282 ?auto_1563286 ) ) ( not ( = ?auto_1563282 ?auto_1563287 ) ) ( not ( = ?auto_1563282 ?auto_1563292 ) ) ( not ( = ?auto_1563283 ?auto_1563284 ) ) ( not ( = ?auto_1563283 ?auto_1563285 ) ) ( not ( = ?auto_1563283 ?auto_1563286 ) ) ( not ( = ?auto_1563283 ?auto_1563287 ) ) ( not ( = ?auto_1563283 ?auto_1563292 ) ) ( not ( = ?auto_1563284 ?auto_1563285 ) ) ( not ( = ?auto_1563284 ?auto_1563286 ) ) ( not ( = ?auto_1563284 ?auto_1563287 ) ) ( not ( = ?auto_1563284 ?auto_1563292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563285 ?auto_1563286 ?auto_1563287 )
      ( MAKE-13CRATE-VERIFY ?auto_1563274 ?auto_1563275 ?auto_1563276 ?auto_1563278 ?auto_1563277 ?auto_1563279 ?auto_1563280 ?auto_1563281 ?auto_1563282 ?auto_1563283 ?auto_1563284 ?auto_1563285 ?auto_1563286 ?auto_1563287 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1567054 - SURFACE
      ?auto_1567055 - SURFACE
    )
    :vars
    (
      ?auto_1567057 - HOIST
      ?auto_1567061 - PLACE
      ?auto_1567062 - SURFACE
      ?auto_1567060 - TRUCK
      ?auto_1567056 - PLACE
      ?auto_1567058 - HOIST
      ?auto_1567059 - SURFACE
      ?auto_1567063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1567057 ?auto_1567061 ) ( SURFACE-AT ?auto_1567054 ?auto_1567061 ) ( CLEAR ?auto_1567054 ) ( IS-CRATE ?auto_1567055 ) ( not ( = ?auto_1567054 ?auto_1567055 ) ) ( AVAILABLE ?auto_1567057 ) ( ON ?auto_1567054 ?auto_1567062 ) ( not ( = ?auto_1567062 ?auto_1567054 ) ) ( not ( = ?auto_1567062 ?auto_1567055 ) ) ( TRUCK-AT ?auto_1567060 ?auto_1567056 ) ( not ( = ?auto_1567056 ?auto_1567061 ) ) ( HOIST-AT ?auto_1567058 ?auto_1567056 ) ( not ( = ?auto_1567057 ?auto_1567058 ) ) ( SURFACE-AT ?auto_1567055 ?auto_1567056 ) ( ON ?auto_1567055 ?auto_1567059 ) ( CLEAR ?auto_1567055 ) ( not ( = ?auto_1567054 ?auto_1567059 ) ) ( not ( = ?auto_1567055 ?auto_1567059 ) ) ( not ( = ?auto_1567062 ?auto_1567059 ) ) ( LIFTING ?auto_1567058 ?auto_1567063 ) ( IS-CRATE ?auto_1567063 ) ( not ( = ?auto_1567054 ?auto_1567063 ) ) ( not ( = ?auto_1567055 ?auto_1567063 ) ) ( not ( = ?auto_1567062 ?auto_1567063 ) ) ( not ( = ?auto_1567059 ?auto_1567063 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1567058 ?auto_1567063 ?auto_1567060 ?auto_1567056 )
      ( MAKE-1CRATE ?auto_1567054 ?auto_1567055 )
      ( MAKE-1CRATE-VERIFY ?auto_1567054 ?auto_1567055 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1577456 - SURFACE
      ?auto_1577457 - SURFACE
      ?auto_1577458 - SURFACE
      ?auto_1577460 - SURFACE
      ?auto_1577459 - SURFACE
      ?auto_1577461 - SURFACE
      ?auto_1577462 - SURFACE
      ?auto_1577463 - SURFACE
      ?auto_1577464 - SURFACE
      ?auto_1577465 - SURFACE
      ?auto_1577466 - SURFACE
      ?auto_1577467 - SURFACE
      ?auto_1577468 - SURFACE
      ?auto_1577469 - SURFACE
      ?auto_1577470 - SURFACE
    )
    :vars
    (
      ?auto_1577471 - HOIST
      ?auto_1577472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1577471 ?auto_1577472 ) ( SURFACE-AT ?auto_1577469 ?auto_1577472 ) ( CLEAR ?auto_1577469 ) ( LIFTING ?auto_1577471 ?auto_1577470 ) ( IS-CRATE ?auto_1577470 ) ( not ( = ?auto_1577469 ?auto_1577470 ) ) ( ON ?auto_1577457 ?auto_1577456 ) ( ON ?auto_1577458 ?auto_1577457 ) ( ON ?auto_1577460 ?auto_1577458 ) ( ON ?auto_1577459 ?auto_1577460 ) ( ON ?auto_1577461 ?auto_1577459 ) ( ON ?auto_1577462 ?auto_1577461 ) ( ON ?auto_1577463 ?auto_1577462 ) ( ON ?auto_1577464 ?auto_1577463 ) ( ON ?auto_1577465 ?auto_1577464 ) ( ON ?auto_1577466 ?auto_1577465 ) ( ON ?auto_1577467 ?auto_1577466 ) ( ON ?auto_1577468 ?auto_1577467 ) ( ON ?auto_1577469 ?auto_1577468 ) ( not ( = ?auto_1577456 ?auto_1577457 ) ) ( not ( = ?auto_1577456 ?auto_1577458 ) ) ( not ( = ?auto_1577456 ?auto_1577460 ) ) ( not ( = ?auto_1577456 ?auto_1577459 ) ) ( not ( = ?auto_1577456 ?auto_1577461 ) ) ( not ( = ?auto_1577456 ?auto_1577462 ) ) ( not ( = ?auto_1577456 ?auto_1577463 ) ) ( not ( = ?auto_1577456 ?auto_1577464 ) ) ( not ( = ?auto_1577456 ?auto_1577465 ) ) ( not ( = ?auto_1577456 ?auto_1577466 ) ) ( not ( = ?auto_1577456 ?auto_1577467 ) ) ( not ( = ?auto_1577456 ?auto_1577468 ) ) ( not ( = ?auto_1577456 ?auto_1577469 ) ) ( not ( = ?auto_1577456 ?auto_1577470 ) ) ( not ( = ?auto_1577457 ?auto_1577458 ) ) ( not ( = ?auto_1577457 ?auto_1577460 ) ) ( not ( = ?auto_1577457 ?auto_1577459 ) ) ( not ( = ?auto_1577457 ?auto_1577461 ) ) ( not ( = ?auto_1577457 ?auto_1577462 ) ) ( not ( = ?auto_1577457 ?auto_1577463 ) ) ( not ( = ?auto_1577457 ?auto_1577464 ) ) ( not ( = ?auto_1577457 ?auto_1577465 ) ) ( not ( = ?auto_1577457 ?auto_1577466 ) ) ( not ( = ?auto_1577457 ?auto_1577467 ) ) ( not ( = ?auto_1577457 ?auto_1577468 ) ) ( not ( = ?auto_1577457 ?auto_1577469 ) ) ( not ( = ?auto_1577457 ?auto_1577470 ) ) ( not ( = ?auto_1577458 ?auto_1577460 ) ) ( not ( = ?auto_1577458 ?auto_1577459 ) ) ( not ( = ?auto_1577458 ?auto_1577461 ) ) ( not ( = ?auto_1577458 ?auto_1577462 ) ) ( not ( = ?auto_1577458 ?auto_1577463 ) ) ( not ( = ?auto_1577458 ?auto_1577464 ) ) ( not ( = ?auto_1577458 ?auto_1577465 ) ) ( not ( = ?auto_1577458 ?auto_1577466 ) ) ( not ( = ?auto_1577458 ?auto_1577467 ) ) ( not ( = ?auto_1577458 ?auto_1577468 ) ) ( not ( = ?auto_1577458 ?auto_1577469 ) ) ( not ( = ?auto_1577458 ?auto_1577470 ) ) ( not ( = ?auto_1577460 ?auto_1577459 ) ) ( not ( = ?auto_1577460 ?auto_1577461 ) ) ( not ( = ?auto_1577460 ?auto_1577462 ) ) ( not ( = ?auto_1577460 ?auto_1577463 ) ) ( not ( = ?auto_1577460 ?auto_1577464 ) ) ( not ( = ?auto_1577460 ?auto_1577465 ) ) ( not ( = ?auto_1577460 ?auto_1577466 ) ) ( not ( = ?auto_1577460 ?auto_1577467 ) ) ( not ( = ?auto_1577460 ?auto_1577468 ) ) ( not ( = ?auto_1577460 ?auto_1577469 ) ) ( not ( = ?auto_1577460 ?auto_1577470 ) ) ( not ( = ?auto_1577459 ?auto_1577461 ) ) ( not ( = ?auto_1577459 ?auto_1577462 ) ) ( not ( = ?auto_1577459 ?auto_1577463 ) ) ( not ( = ?auto_1577459 ?auto_1577464 ) ) ( not ( = ?auto_1577459 ?auto_1577465 ) ) ( not ( = ?auto_1577459 ?auto_1577466 ) ) ( not ( = ?auto_1577459 ?auto_1577467 ) ) ( not ( = ?auto_1577459 ?auto_1577468 ) ) ( not ( = ?auto_1577459 ?auto_1577469 ) ) ( not ( = ?auto_1577459 ?auto_1577470 ) ) ( not ( = ?auto_1577461 ?auto_1577462 ) ) ( not ( = ?auto_1577461 ?auto_1577463 ) ) ( not ( = ?auto_1577461 ?auto_1577464 ) ) ( not ( = ?auto_1577461 ?auto_1577465 ) ) ( not ( = ?auto_1577461 ?auto_1577466 ) ) ( not ( = ?auto_1577461 ?auto_1577467 ) ) ( not ( = ?auto_1577461 ?auto_1577468 ) ) ( not ( = ?auto_1577461 ?auto_1577469 ) ) ( not ( = ?auto_1577461 ?auto_1577470 ) ) ( not ( = ?auto_1577462 ?auto_1577463 ) ) ( not ( = ?auto_1577462 ?auto_1577464 ) ) ( not ( = ?auto_1577462 ?auto_1577465 ) ) ( not ( = ?auto_1577462 ?auto_1577466 ) ) ( not ( = ?auto_1577462 ?auto_1577467 ) ) ( not ( = ?auto_1577462 ?auto_1577468 ) ) ( not ( = ?auto_1577462 ?auto_1577469 ) ) ( not ( = ?auto_1577462 ?auto_1577470 ) ) ( not ( = ?auto_1577463 ?auto_1577464 ) ) ( not ( = ?auto_1577463 ?auto_1577465 ) ) ( not ( = ?auto_1577463 ?auto_1577466 ) ) ( not ( = ?auto_1577463 ?auto_1577467 ) ) ( not ( = ?auto_1577463 ?auto_1577468 ) ) ( not ( = ?auto_1577463 ?auto_1577469 ) ) ( not ( = ?auto_1577463 ?auto_1577470 ) ) ( not ( = ?auto_1577464 ?auto_1577465 ) ) ( not ( = ?auto_1577464 ?auto_1577466 ) ) ( not ( = ?auto_1577464 ?auto_1577467 ) ) ( not ( = ?auto_1577464 ?auto_1577468 ) ) ( not ( = ?auto_1577464 ?auto_1577469 ) ) ( not ( = ?auto_1577464 ?auto_1577470 ) ) ( not ( = ?auto_1577465 ?auto_1577466 ) ) ( not ( = ?auto_1577465 ?auto_1577467 ) ) ( not ( = ?auto_1577465 ?auto_1577468 ) ) ( not ( = ?auto_1577465 ?auto_1577469 ) ) ( not ( = ?auto_1577465 ?auto_1577470 ) ) ( not ( = ?auto_1577466 ?auto_1577467 ) ) ( not ( = ?auto_1577466 ?auto_1577468 ) ) ( not ( = ?auto_1577466 ?auto_1577469 ) ) ( not ( = ?auto_1577466 ?auto_1577470 ) ) ( not ( = ?auto_1577467 ?auto_1577468 ) ) ( not ( = ?auto_1577467 ?auto_1577469 ) ) ( not ( = ?auto_1577467 ?auto_1577470 ) ) ( not ( = ?auto_1577468 ?auto_1577469 ) ) ( not ( = ?auto_1577468 ?auto_1577470 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1577469 ?auto_1577470 )
      ( MAKE-14CRATE-VERIFY ?auto_1577456 ?auto_1577457 ?auto_1577458 ?auto_1577460 ?auto_1577459 ?auto_1577461 ?auto_1577462 ?auto_1577463 ?auto_1577464 ?auto_1577465 ?auto_1577466 ?auto_1577467 ?auto_1577468 ?auto_1577469 ?auto_1577470 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1577616 - SURFACE
      ?auto_1577617 - SURFACE
      ?auto_1577618 - SURFACE
      ?auto_1577620 - SURFACE
      ?auto_1577619 - SURFACE
      ?auto_1577621 - SURFACE
      ?auto_1577622 - SURFACE
      ?auto_1577623 - SURFACE
      ?auto_1577624 - SURFACE
      ?auto_1577625 - SURFACE
      ?auto_1577626 - SURFACE
      ?auto_1577627 - SURFACE
      ?auto_1577628 - SURFACE
      ?auto_1577629 - SURFACE
      ?auto_1577630 - SURFACE
    )
    :vars
    (
      ?auto_1577632 - HOIST
      ?auto_1577631 - PLACE
      ?auto_1577633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1577632 ?auto_1577631 ) ( SURFACE-AT ?auto_1577629 ?auto_1577631 ) ( CLEAR ?auto_1577629 ) ( IS-CRATE ?auto_1577630 ) ( not ( = ?auto_1577629 ?auto_1577630 ) ) ( TRUCK-AT ?auto_1577633 ?auto_1577631 ) ( AVAILABLE ?auto_1577632 ) ( IN ?auto_1577630 ?auto_1577633 ) ( ON ?auto_1577629 ?auto_1577628 ) ( not ( = ?auto_1577628 ?auto_1577629 ) ) ( not ( = ?auto_1577628 ?auto_1577630 ) ) ( ON ?auto_1577617 ?auto_1577616 ) ( ON ?auto_1577618 ?auto_1577617 ) ( ON ?auto_1577620 ?auto_1577618 ) ( ON ?auto_1577619 ?auto_1577620 ) ( ON ?auto_1577621 ?auto_1577619 ) ( ON ?auto_1577622 ?auto_1577621 ) ( ON ?auto_1577623 ?auto_1577622 ) ( ON ?auto_1577624 ?auto_1577623 ) ( ON ?auto_1577625 ?auto_1577624 ) ( ON ?auto_1577626 ?auto_1577625 ) ( ON ?auto_1577627 ?auto_1577626 ) ( ON ?auto_1577628 ?auto_1577627 ) ( not ( = ?auto_1577616 ?auto_1577617 ) ) ( not ( = ?auto_1577616 ?auto_1577618 ) ) ( not ( = ?auto_1577616 ?auto_1577620 ) ) ( not ( = ?auto_1577616 ?auto_1577619 ) ) ( not ( = ?auto_1577616 ?auto_1577621 ) ) ( not ( = ?auto_1577616 ?auto_1577622 ) ) ( not ( = ?auto_1577616 ?auto_1577623 ) ) ( not ( = ?auto_1577616 ?auto_1577624 ) ) ( not ( = ?auto_1577616 ?auto_1577625 ) ) ( not ( = ?auto_1577616 ?auto_1577626 ) ) ( not ( = ?auto_1577616 ?auto_1577627 ) ) ( not ( = ?auto_1577616 ?auto_1577628 ) ) ( not ( = ?auto_1577616 ?auto_1577629 ) ) ( not ( = ?auto_1577616 ?auto_1577630 ) ) ( not ( = ?auto_1577617 ?auto_1577618 ) ) ( not ( = ?auto_1577617 ?auto_1577620 ) ) ( not ( = ?auto_1577617 ?auto_1577619 ) ) ( not ( = ?auto_1577617 ?auto_1577621 ) ) ( not ( = ?auto_1577617 ?auto_1577622 ) ) ( not ( = ?auto_1577617 ?auto_1577623 ) ) ( not ( = ?auto_1577617 ?auto_1577624 ) ) ( not ( = ?auto_1577617 ?auto_1577625 ) ) ( not ( = ?auto_1577617 ?auto_1577626 ) ) ( not ( = ?auto_1577617 ?auto_1577627 ) ) ( not ( = ?auto_1577617 ?auto_1577628 ) ) ( not ( = ?auto_1577617 ?auto_1577629 ) ) ( not ( = ?auto_1577617 ?auto_1577630 ) ) ( not ( = ?auto_1577618 ?auto_1577620 ) ) ( not ( = ?auto_1577618 ?auto_1577619 ) ) ( not ( = ?auto_1577618 ?auto_1577621 ) ) ( not ( = ?auto_1577618 ?auto_1577622 ) ) ( not ( = ?auto_1577618 ?auto_1577623 ) ) ( not ( = ?auto_1577618 ?auto_1577624 ) ) ( not ( = ?auto_1577618 ?auto_1577625 ) ) ( not ( = ?auto_1577618 ?auto_1577626 ) ) ( not ( = ?auto_1577618 ?auto_1577627 ) ) ( not ( = ?auto_1577618 ?auto_1577628 ) ) ( not ( = ?auto_1577618 ?auto_1577629 ) ) ( not ( = ?auto_1577618 ?auto_1577630 ) ) ( not ( = ?auto_1577620 ?auto_1577619 ) ) ( not ( = ?auto_1577620 ?auto_1577621 ) ) ( not ( = ?auto_1577620 ?auto_1577622 ) ) ( not ( = ?auto_1577620 ?auto_1577623 ) ) ( not ( = ?auto_1577620 ?auto_1577624 ) ) ( not ( = ?auto_1577620 ?auto_1577625 ) ) ( not ( = ?auto_1577620 ?auto_1577626 ) ) ( not ( = ?auto_1577620 ?auto_1577627 ) ) ( not ( = ?auto_1577620 ?auto_1577628 ) ) ( not ( = ?auto_1577620 ?auto_1577629 ) ) ( not ( = ?auto_1577620 ?auto_1577630 ) ) ( not ( = ?auto_1577619 ?auto_1577621 ) ) ( not ( = ?auto_1577619 ?auto_1577622 ) ) ( not ( = ?auto_1577619 ?auto_1577623 ) ) ( not ( = ?auto_1577619 ?auto_1577624 ) ) ( not ( = ?auto_1577619 ?auto_1577625 ) ) ( not ( = ?auto_1577619 ?auto_1577626 ) ) ( not ( = ?auto_1577619 ?auto_1577627 ) ) ( not ( = ?auto_1577619 ?auto_1577628 ) ) ( not ( = ?auto_1577619 ?auto_1577629 ) ) ( not ( = ?auto_1577619 ?auto_1577630 ) ) ( not ( = ?auto_1577621 ?auto_1577622 ) ) ( not ( = ?auto_1577621 ?auto_1577623 ) ) ( not ( = ?auto_1577621 ?auto_1577624 ) ) ( not ( = ?auto_1577621 ?auto_1577625 ) ) ( not ( = ?auto_1577621 ?auto_1577626 ) ) ( not ( = ?auto_1577621 ?auto_1577627 ) ) ( not ( = ?auto_1577621 ?auto_1577628 ) ) ( not ( = ?auto_1577621 ?auto_1577629 ) ) ( not ( = ?auto_1577621 ?auto_1577630 ) ) ( not ( = ?auto_1577622 ?auto_1577623 ) ) ( not ( = ?auto_1577622 ?auto_1577624 ) ) ( not ( = ?auto_1577622 ?auto_1577625 ) ) ( not ( = ?auto_1577622 ?auto_1577626 ) ) ( not ( = ?auto_1577622 ?auto_1577627 ) ) ( not ( = ?auto_1577622 ?auto_1577628 ) ) ( not ( = ?auto_1577622 ?auto_1577629 ) ) ( not ( = ?auto_1577622 ?auto_1577630 ) ) ( not ( = ?auto_1577623 ?auto_1577624 ) ) ( not ( = ?auto_1577623 ?auto_1577625 ) ) ( not ( = ?auto_1577623 ?auto_1577626 ) ) ( not ( = ?auto_1577623 ?auto_1577627 ) ) ( not ( = ?auto_1577623 ?auto_1577628 ) ) ( not ( = ?auto_1577623 ?auto_1577629 ) ) ( not ( = ?auto_1577623 ?auto_1577630 ) ) ( not ( = ?auto_1577624 ?auto_1577625 ) ) ( not ( = ?auto_1577624 ?auto_1577626 ) ) ( not ( = ?auto_1577624 ?auto_1577627 ) ) ( not ( = ?auto_1577624 ?auto_1577628 ) ) ( not ( = ?auto_1577624 ?auto_1577629 ) ) ( not ( = ?auto_1577624 ?auto_1577630 ) ) ( not ( = ?auto_1577625 ?auto_1577626 ) ) ( not ( = ?auto_1577625 ?auto_1577627 ) ) ( not ( = ?auto_1577625 ?auto_1577628 ) ) ( not ( = ?auto_1577625 ?auto_1577629 ) ) ( not ( = ?auto_1577625 ?auto_1577630 ) ) ( not ( = ?auto_1577626 ?auto_1577627 ) ) ( not ( = ?auto_1577626 ?auto_1577628 ) ) ( not ( = ?auto_1577626 ?auto_1577629 ) ) ( not ( = ?auto_1577626 ?auto_1577630 ) ) ( not ( = ?auto_1577627 ?auto_1577628 ) ) ( not ( = ?auto_1577627 ?auto_1577629 ) ) ( not ( = ?auto_1577627 ?auto_1577630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1577628 ?auto_1577629 ?auto_1577630 )
      ( MAKE-14CRATE-VERIFY ?auto_1577616 ?auto_1577617 ?auto_1577618 ?auto_1577620 ?auto_1577619 ?auto_1577621 ?auto_1577622 ?auto_1577623 ?auto_1577624 ?auto_1577625 ?auto_1577626 ?auto_1577627 ?auto_1577628 ?auto_1577629 ?auto_1577630 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1577791 - SURFACE
      ?auto_1577792 - SURFACE
      ?auto_1577793 - SURFACE
      ?auto_1577795 - SURFACE
      ?auto_1577794 - SURFACE
      ?auto_1577796 - SURFACE
      ?auto_1577797 - SURFACE
      ?auto_1577798 - SURFACE
      ?auto_1577799 - SURFACE
      ?auto_1577800 - SURFACE
      ?auto_1577801 - SURFACE
      ?auto_1577802 - SURFACE
      ?auto_1577803 - SURFACE
      ?auto_1577804 - SURFACE
      ?auto_1577805 - SURFACE
    )
    :vars
    (
      ?auto_1577807 - HOIST
      ?auto_1577806 - PLACE
      ?auto_1577809 - TRUCK
      ?auto_1577808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1577807 ?auto_1577806 ) ( SURFACE-AT ?auto_1577804 ?auto_1577806 ) ( CLEAR ?auto_1577804 ) ( IS-CRATE ?auto_1577805 ) ( not ( = ?auto_1577804 ?auto_1577805 ) ) ( AVAILABLE ?auto_1577807 ) ( IN ?auto_1577805 ?auto_1577809 ) ( ON ?auto_1577804 ?auto_1577803 ) ( not ( = ?auto_1577803 ?auto_1577804 ) ) ( not ( = ?auto_1577803 ?auto_1577805 ) ) ( TRUCK-AT ?auto_1577809 ?auto_1577808 ) ( not ( = ?auto_1577808 ?auto_1577806 ) ) ( ON ?auto_1577792 ?auto_1577791 ) ( ON ?auto_1577793 ?auto_1577792 ) ( ON ?auto_1577795 ?auto_1577793 ) ( ON ?auto_1577794 ?auto_1577795 ) ( ON ?auto_1577796 ?auto_1577794 ) ( ON ?auto_1577797 ?auto_1577796 ) ( ON ?auto_1577798 ?auto_1577797 ) ( ON ?auto_1577799 ?auto_1577798 ) ( ON ?auto_1577800 ?auto_1577799 ) ( ON ?auto_1577801 ?auto_1577800 ) ( ON ?auto_1577802 ?auto_1577801 ) ( ON ?auto_1577803 ?auto_1577802 ) ( not ( = ?auto_1577791 ?auto_1577792 ) ) ( not ( = ?auto_1577791 ?auto_1577793 ) ) ( not ( = ?auto_1577791 ?auto_1577795 ) ) ( not ( = ?auto_1577791 ?auto_1577794 ) ) ( not ( = ?auto_1577791 ?auto_1577796 ) ) ( not ( = ?auto_1577791 ?auto_1577797 ) ) ( not ( = ?auto_1577791 ?auto_1577798 ) ) ( not ( = ?auto_1577791 ?auto_1577799 ) ) ( not ( = ?auto_1577791 ?auto_1577800 ) ) ( not ( = ?auto_1577791 ?auto_1577801 ) ) ( not ( = ?auto_1577791 ?auto_1577802 ) ) ( not ( = ?auto_1577791 ?auto_1577803 ) ) ( not ( = ?auto_1577791 ?auto_1577804 ) ) ( not ( = ?auto_1577791 ?auto_1577805 ) ) ( not ( = ?auto_1577792 ?auto_1577793 ) ) ( not ( = ?auto_1577792 ?auto_1577795 ) ) ( not ( = ?auto_1577792 ?auto_1577794 ) ) ( not ( = ?auto_1577792 ?auto_1577796 ) ) ( not ( = ?auto_1577792 ?auto_1577797 ) ) ( not ( = ?auto_1577792 ?auto_1577798 ) ) ( not ( = ?auto_1577792 ?auto_1577799 ) ) ( not ( = ?auto_1577792 ?auto_1577800 ) ) ( not ( = ?auto_1577792 ?auto_1577801 ) ) ( not ( = ?auto_1577792 ?auto_1577802 ) ) ( not ( = ?auto_1577792 ?auto_1577803 ) ) ( not ( = ?auto_1577792 ?auto_1577804 ) ) ( not ( = ?auto_1577792 ?auto_1577805 ) ) ( not ( = ?auto_1577793 ?auto_1577795 ) ) ( not ( = ?auto_1577793 ?auto_1577794 ) ) ( not ( = ?auto_1577793 ?auto_1577796 ) ) ( not ( = ?auto_1577793 ?auto_1577797 ) ) ( not ( = ?auto_1577793 ?auto_1577798 ) ) ( not ( = ?auto_1577793 ?auto_1577799 ) ) ( not ( = ?auto_1577793 ?auto_1577800 ) ) ( not ( = ?auto_1577793 ?auto_1577801 ) ) ( not ( = ?auto_1577793 ?auto_1577802 ) ) ( not ( = ?auto_1577793 ?auto_1577803 ) ) ( not ( = ?auto_1577793 ?auto_1577804 ) ) ( not ( = ?auto_1577793 ?auto_1577805 ) ) ( not ( = ?auto_1577795 ?auto_1577794 ) ) ( not ( = ?auto_1577795 ?auto_1577796 ) ) ( not ( = ?auto_1577795 ?auto_1577797 ) ) ( not ( = ?auto_1577795 ?auto_1577798 ) ) ( not ( = ?auto_1577795 ?auto_1577799 ) ) ( not ( = ?auto_1577795 ?auto_1577800 ) ) ( not ( = ?auto_1577795 ?auto_1577801 ) ) ( not ( = ?auto_1577795 ?auto_1577802 ) ) ( not ( = ?auto_1577795 ?auto_1577803 ) ) ( not ( = ?auto_1577795 ?auto_1577804 ) ) ( not ( = ?auto_1577795 ?auto_1577805 ) ) ( not ( = ?auto_1577794 ?auto_1577796 ) ) ( not ( = ?auto_1577794 ?auto_1577797 ) ) ( not ( = ?auto_1577794 ?auto_1577798 ) ) ( not ( = ?auto_1577794 ?auto_1577799 ) ) ( not ( = ?auto_1577794 ?auto_1577800 ) ) ( not ( = ?auto_1577794 ?auto_1577801 ) ) ( not ( = ?auto_1577794 ?auto_1577802 ) ) ( not ( = ?auto_1577794 ?auto_1577803 ) ) ( not ( = ?auto_1577794 ?auto_1577804 ) ) ( not ( = ?auto_1577794 ?auto_1577805 ) ) ( not ( = ?auto_1577796 ?auto_1577797 ) ) ( not ( = ?auto_1577796 ?auto_1577798 ) ) ( not ( = ?auto_1577796 ?auto_1577799 ) ) ( not ( = ?auto_1577796 ?auto_1577800 ) ) ( not ( = ?auto_1577796 ?auto_1577801 ) ) ( not ( = ?auto_1577796 ?auto_1577802 ) ) ( not ( = ?auto_1577796 ?auto_1577803 ) ) ( not ( = ?auto_1577796 ?auto_1577804 ) ) ( not ( = ?auto_1577796 ?auto_1577805 ) ) ( not ( = ?auto_1577797 ?auto_1577798 ) ) ( not ( = ?auto_1577797 ?auto_1577799 ) ) ( not ( = ?auto_1577797 ?auto_1577800 ) ) ( not ( = ?auto_1577797 ?auto_1577801 ) ) ( not ( = ?auto_1577797 ?auto_1577802 ) ) ( not ( = ?auto_1577797 ?auto_1577803 ) ) ( not ( = ?auto_1577797 ?auto_1577804 ) ) ( not ( = ?auto_1577797 ?auto_1577805 ) ) ( not ( = ?auto_1577798 ?auto_1577799 ) ) ( not ( = ?auto_1577798 ?auto_1577800 ) ) ( not ( = ?auto_1577798 ?auto_1577801 ) ) ( not ( = ?auto_1577798 ?auto_1577802 ) ) ( not ( = ?auto_1577798 ?auto_1577803 ) ) ( not ( = ?auto_1577798 ?auto_1577804 ) ) ( not ( = ?auto_1577798 ?auto_1577805 ) ) ( not ( = ?auto_1577799 ?auto_1577800 ) ) ( not ( = ?auto_1577799 ?auto_1577801 ) ) ( not ( = ?auto_1577799 ?auto_1577802 ) ) ( not ( = ?auto_1577799 ?auto_1577803 ) ) ( not ( = ?auto_1577799 ?auto_1577804 ) ) ( not ( = ?auto_1577799 ?auto_1577805 ) ) ( not ( = ?auto_1577800 ?auto_1577801 ) ) ( not ( = ?auto_1577800 ?auto_1577802 ) ) ( not ( = ?auto_1577800 ?auto_1577803 ) ) ( not ( = ?auto_1577800 ?auto_1577804 ) ) ( not ( = ?auto_1577800 ?auto_1577805 ) ) ( not ( = ?auto_1577801 ?auto_1577802 ) ) ( not ( = ?auto_1577801 ?auto_1577803 ) ) ( not ( = ?auto_1577801 ?auto_1577804 ) ) ( not ( = ?auto_1577801 ?auto_1577805 ) ) ( not ( = ?auto_1577802 ?auto_1577803 ) ) ( not ( = ?auto_1577802 ?auto_1577804 ) ) ( not ( = ?auto_1577802 ?auto_1577805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1577803 ?auto_1577804 ?auto_1577805 )
      ( MAKE-14CRATE-VERIFY ?auto_1577791 ?auto_1577792 ?auto_1577793 ?auto_1577795 ?auto_1577794 ?auto_1577796 ?auto_1577797 ?auto_1577798 ?auto_1577799 ?auto_1577800 ?auto_1577801 ?auto_1577802 ?auto_1577803 ?auto_1577804 ?auto_1577805 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1577980 - SURFACE
      ?auto_1577981 - SURFACE
      ?auto_1577982 - SURFACE
      ?auto_1577984 - SURFACE
      ?auto_1577983 - SURFACE
      ?auto_1577985 - SURFACE
      ?auto_1577986 - SURFACE
      ?auto_1577987 - SURFACE
      ?auto_1577988 - SURFACE
      ?auto_1577989 - SURFACE
      ?auto_1577990 - SURFACE
      ?auto_1577991 - SURFACE
      ?auto_1577992 - SURFACE
      ?auto_1577993 - SURFACE
      ?auto_1577994 - SURFACE
    )
    :vars
    (
      ?auto_1577999 - HOIST
      ?auto_1577998 - PLACE
      ?auto_1577996 - TRUCK
      ?auto_1577995 - PLACE
      ?auto_1577997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1577999 ?auto_1577998 ) ( SURFACE-AT ?auto_1577993 ?auto_1577998 ) ( CLEAR ?auto_1577993 ) ( IS-CRATE ?auto_1577994 ) ( not ( = ?auto_1577993 ?auto_1577994 ) ) ( AVAILABLE ?auto_1577999 ) ( ON ?auto_1577993 ?auto_1577992 ) ( not ( = ?auto_1577992 ?auto_1577993 ) ) ( not ( = ?auto_1577992 ?auto_1577994 ) ) ( TRUCK-AT ?auto_1577996 ?auto_1577995 ) ( not ( = ?auto_1577995 ?auto_1577998 ) ) ( HOIST-AT ?auto_1577997 ?auto_1577995 ) ( LIFTING ?auto_1577997 ?auto_1577994 ) ( not ( = ?auto_1577999 ?auto_1577997 ) ) ( ON ?auto_1577981 ?auto_1577980 ) ( ON ?auto_1577982 ?auto_1577981 ) ( ON ?auto_1577984 ?auto_1577982 ) ( ON ?auto_1577983 ?auto_1577984 ) ( ON ?auto_1577985 ?auto_1577983 ) ( ON ?auto_1577986 ?auto_1577985 ) ( ON ?auto_1577987 ?auto_1577986 ) ( ON ?auto_1577988 ?auto_1577987 ) ( ON ?auto_1577989 ?auto_1577988 ) ( ON ?auto_1577990 ?auto_1577989 ) ( ON ?auto_1577991 ?auto_1577990 ) ( ON ?auto_1577992 ?auto_1577991 ) ( not ( = ?auto_1577980 ?auto_1577981 ) ) ( not ( = ?auto_1577980 ?auto_1577982 ) ) ( not ( = ?auto_1577980 ?auto_1577984 ) ) ( not ( = ?auto_1577980 ?auto_1577983 ) ) ( not ( = ?auto_1577980 ?auto_1577985 ) ) ( not ( = ?auto_1577980 ?auto_1577986 ) ) ( not ( = ?auto_1577980 ?auto_1577987 ) ) ( not ( = ?auto_1577980 ?auto_1577988 ) ) ( not ( = ?auto_1577980 ?auto_1577989 ) ) ( not ( = ?auto_1577980 ?auto_1577990 ) ) ( not ( = ?auto_1577980 ?auto_1577991 ) ) ( not ( = ?auto_1577980 ?auto_1577992 ) ) ( not ( = ?auto_1577980 ?auto_1577993 ) ) ( not ( = ?auto_1577980 ?auto_1577994 ) ) ( not ( = ?auto_1577981 ?auto_1577982 ) ) ( not ( = ?auto_1577981 ?auto_1577984 ) ) ( not ( = ?auto_1577981 ?auto_1577983 ) ) ( not ( = ?auto_1577981 ?auto_1577985 ) ) ( not ( = ?auto_1577981 ?auto_1577986 ) ) ( not ( = ?auto_1577981 ?auto_1577987 ) ) ( not ( = ?auto_1577981 ?auto_1577988 ) ) ( not ( = ?auto_1577981 ?auto_1577989 ) ) ( not ( = ?auto_1577981 ?auto_1577990 ) ) ( not ( = ?auto_1577981 ?auto_1577991 ) ) ( not ( = ?auto_1577981 ?auto_1577992 ) ) ( not ( = ?auto_1577981 ?auto_1577993 ) ) ( not ( = ?auto_1577981 ?auto_1577994 ) ) ( not ( = ?auto_1577982 ?auto_1577984 ) ) ( not ( = ?auto_1577982 ?auto_1577983 ) ) ( not ( = ?auto_1577982 ?auto_1577985 ) ) ( not ( = ?auto_1577982 ?auto_1577986 ) ) ( not ( = ?auto_1577982 ?auto_1577987 ) ) ( not ( = ?auto_1577982 ?auto_1577988 ) ) ( not ( = ?auto_1577982 ?auto_1577989 ) ) ( not ( = ?auto_1577982 ?auto_1577990 ) ) ( not ( = ?auto_1577982 ?auto_1577991 ) ) ( not ( = ?auto_1577982 ?auto_1577992 ) ) ( not ( = ?auto_1577982 ?auto_1577993 ) ) ( not ( = ?auto_1577982 ?auto_1577994 ) ) ( not ( = ?auto_1577984 ?auto_1577983 ) ) ( not ( = ?auto_1577984 ?auto_1577985 ) ) ( not ( = ?auto_1577984 ?auto_1577986 ) ) ( not ( = ?auto_1577984 ?auto_1577987 ) ) ( not ( = ?auto_1577984 ?auto_1577988 ) ) ( not ( = ?auto_1577984 ?auto_1577989 ) ) ( not ( = ?auto_1577984 ?auto_1577990 ) ) ( not ( = ?auto_1577984 ?auto_1577991 ) ) ( not ( = ?auto_1577984 ?auto_1577992 ) ) ( not ( = ?auto_1577984 ?auto_1577993 ) ) ( not ( = ?auto_1577984 ?auto_1577994 ) ) ( not ( = ?auto_1577983 ?auto_1577985 ) ) ( not ( = ?auto_1577983 ?auto_1577986 ) ) ( not ( = ?auto_1577983 ?auto_1577987 ) ) ( not ( = ?auto_1577983 ?auto_1577988 ) ) ( not ( = ?auto_1577983 ?auto_1577989 ) ) ( not ( = ?auto_1577983 ?auto_1577990 ) ) ( not ( = ?auto_1577983 ?auto_1577991 ) ) ( not ( = ?auto_1577983 ?auto_1577992 ) ) ( not ( = ?auto_1577983 ?auto_1577993 ) ) ( not ( = ?auto_1577983 ?auto_1577994 ) ) ( not ( = ?auto_1577985 ?auto_1577986 ) ) ( not ( = ?auto_1577985 ?auto_1577987 ) ) ( not ( = ?auto_1577985 ?auto_1577988 ) ) ( not ( = ?auto_1577985 ?auto_1577989 ) ) ( not ( = ?auto_1577985 ?auto_1577990 ) ) ( not ( = ?auto_1577985 ?auto_1577991 ) ) ( not ( = ?auto_1577985 ?auto_1577992 ) ) ( not ( = ?auto_1577985 ?auto_1577993 ) ) ( not ( = ?auto_1577985 ?auto_1577994 ) ) ( not ( = ?auto_1577986 ?auto_1577987 ) ) ( not ( = ?auto_1577986 ?auto_1577988 ) ) ( not ( = ?auto_1577986 ?auto_1577989 ) ) ( not ( = ?auto_1577986 ?auto_1577990 ) ) ( not ( = ?auto_1577986 ?auto_1577991 ) ) ( not ( = ?auto_1577986 ?auto_1577992 ) ) ( not ( = ?auto_1577986 ?auto_1577993 ) ) ( not ( = ?auto_1577986 ?auto_1577994 ) ) ( not ( = ?auto_1577987 ?auto_1577988 ) ) ( not ( = ?auto_1577987 ?auto_1577989 ) ) ( not ( = ?auto_1577987 ?auto_1577990 ) ) ( not ( = ?auto_1577987 ?auto_1577991 ) ) ( not ( = ?auto_1577987 ?auto_1577992 ) ) ( not ( = ?auto_1577987 ?auto_1577993 ) ) ( not ( = ?auto_1577987 ?auto_1577994 ) ) ( not ( = ?auto_1577988 ?auto_1577989 ) ) ( not ( = ?auto_1577988 ?auto_1577990 ) ) ( not ( = ?auto_1577988 ?auto_1577991 ) ) ( not ( = ?auto_1577988 ?auto_1577992 ) ) ( not ( = ?auto_1577988 ?auto_1577993 ) ) ( not ( = ?auto_1577988 ?auto_1577994 ) ) ( not ( = ?auto_1577989 ?auto_1577990 ) ) ( not ( = ?auto_1577989 ?auto_1577991 ) ) ( not ( = ?auto_1577989 ?auto_1577992 ) ) ( not ( = ?auto_1577989 ?auto_1577993 ) ) ( not ( = ?auto_1577989 ?auto_1577994 ) ) ( not ( = ?auto_1577990 ?auto_1577991 ) ) ( not ( = ?auto_1577990 ?auto_1577992 ) ) ( not ( = ?auto_1577990 ?auto_1577993 ) ) ( not ( = ?auto_1577990 ?auto_1577994 ) ) ( not ( = ?auto_1577991 ?auto_1577992 ) ) ( not ( = ?auto_1577991 ?auto_1577993 ) ) ( not ( = ?auto_1577991 ?auto_1577994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1577992 ?auto_1577993 ?auto_1577994 )
      ( MAKE-14CRATE-VERIFY ?auto_1577980 ?auto_1577981 ?auto_1577982 ?auto_1577984 ?auto_1577983 ?auto_1577985 ?auto_1577986 ?auto_1577987 ?auto_1577988 ?auto_1577989 ?auto_1577990 ?auto_1577991 ?auto_1577992 ?auto_1577993 ?auto_1577994 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578183 - SURFACE
      ?auto_1578184 - SURFACE
      ?auto_1578185 - SURFACE
      ?auto_1578187 - SURFACE
      ?auto_1578186 - SURFACE
      ?auto_1578188 - SURFACE
      ?auto_1578189 - SURFACE
      ?auto_1578190 - SURFACE
      ?auto_1578191 - SURFACE
      ?auto_1578192 - SURFACE
      ?auto_1578193 - SURFACE
      ?auto_1578194 - SURFACE
      ?auto_1578195 - SURFACE
      ?auto_1578196 - SURFACE
      ?auto_1578197 - SURFACE
    )
    :vars
    (
      ?auto_1578203 - HOIST
      ?auto_1578199 - PLACE
      ?auto_1578202 - TRUCK
      ?auto_1578201 - PLACE
      ?auto_1578198 - HOIST
      ?auto_1578200 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578203 ?auto_1578199 ) ( SURFACE-AT ?auto_1578196 ?auto_1578199 ) ( CLEAR ?auto_1578196 ) ( IS-CRATE ?auto_1578197 ) ( not ( = ?auto_1578196 ?auto_1578197 ) ) ( AVAILABLE ?auto_1578203 ) ( ON ?auto_1578196 ?auto_1578195 ) ( not ( = ?auto_1578195 ?auto_1578196 ) ) ( not ( = ?auto_1578195 ?auto_1578197 ) ) ( TRUCK-AT ?auto_1578202 ?auto_1578201 ) ( not ( = ?auto_1578201 ?auto_1578199 ) ) ( HOIST-AT ?auto_1578198 ?auto_1578201 ) ( not ( = ?auto_1578203 ?auto_1578198 ) ) ( AVAILABLE ?auto_1578198 ) ( SURFACE-AT ?auto_1578197 ?auto_1578201 ) ( ON ?auto_1578197 ?auto_1578200 ) ( CLEAR ?auto_1578197 ) ( not ( = ?auto_1578196 ?auto_1578200 ) ) ( not ( = ?auto_1578197 ?auto_1578200 ) ) ( not ( = ?auto_1578195 ?auto_1578200 ) ) ( ON ?auto_1578184 ?auto_1578183 ) ( ON ?auto_1578185 ?auto_1578184 ) ( ON ?auto_1578187 ?auto_1578185 ) ( ON ?auto_1578186 ?auto_1578187 ) ( ON ?auto_1578188 ?auto_1578186 ) ( ON ?auto_1578189 ?auto_1578188 ) ( ON ?auto_1578190 ?auto_1578189 ) ( ON ?auto_1578191 ?auto_1578190 ) ( ON ?auto_1578192 ?auto_1578191 ) ( ON ?auto_1578193 ?auto_1578192 ) ( ON ?auto_1578194 ?auto_1578193 ) ( ON ?auto_1578195 ?auto_1578194 ) ( not ( = ?auto_1578183 ?auto_1578184 ) ) ( not ( = ?auto_1578183 ?auto_1578185 ) ) ( not ( = ?auto_1578183 ?auto_1578187 ) ) ( not ( = ?auto_1578183 ?auto_1578186 ) ) ( not ( = ?auto_1578183 ?auto_1578188 ) ) ( not ( = ?auto_1578183 ?auto_1578189 ) ) ( not ( = ?auto_1578183 ?auto_1578190 ) ) ( not ( = ?auto_1578183 ?auto_1578191 ) ) ( not ( = ?auto_1578183 ?auto_1578192 ) ) ( not ( = ?auto_1578183 ?auto_1578193 ) ) ( not ( = ?auto_1578183 ?auto_1578194 ) ) ( not ( = ?auto_1578183 ?auto_1578195 ) ) ( not ( = ?auto_1578183 ?auto_1578196 ) ) ( not ( = ?auto_1578183 ?auto_1578197 ) ) ( not ( = ?auto_1578183 ?auto_1578200 ) ) ( not ( = ?auto_1578184 ?auto_1578185 ) ) ( not ( = ?auto_1578184 ?auto_1578187 ) ) ( not ( = ?auto_1578184 ?auto_1578186 ) ) ( not ( = ?auto_1578184 ?auto_1578188 ) ) ( not ( = ?auto_1578184 ?auto_1578189 ) ) ( not ( = ?auto_1578184 ?auto_1578190 ) ) ( not ( = ?auto_1578184 ?auto_1578191 ) ) ( not ( = ?auto_1578184 ?auto_1578192 ) ) ( not ( = ?auto_1578184 ?auto_1578193 ) ) ( not ( = ?auto_1578184 ?auto_1578194 ) ) ( not ( = ?auto_1578184 ?auto_1578195 ) ) ( not ( = ?auto_1578184 ?auto_1578196 ) ) ( not ( = ?auto_1578184 ?auto_1578197 ) ) ( not ( = ?auto_1578184 ?auto_1578200 ) ) ( not ( = ?auto_1578185 ?auto_1578187 ) ) ( not ( = ?auto_1578185 ?auto_1578186 ) ) ( not ( = ?auto_1578185 ?auto_1578188 ) ) ( not ( = ?auto_1578185 ?auto_1578189 ) ) ( not ( = ?auto_1578185 ?auto_1578190 ) ) ( not ( = ?auto_1578185 ?auto_1578191 ) ) ( not ( = ?auto_1578185 ?auto_1578192 ) ) ( not ( = ?auto_1578185 ?auto_1578193 ) ) ( not ( = ?auto_1578185 ?auto_1578194 ) ) ( not ( = ?auto_1578185 ?auto_1578195 ) ) ( not ( = ?auto_1578185 ?auto_1578196 ) ) ( not ( = ?auto_1578185 ?auto_1578197 ) ) ( not ( = ?auto_1578185 ?auto_1578200 ) ) ( not ( = ?auto_1578187 ?auto_1578186 ) ) ( not ( = ?auto_1578187 ?auto_1578188 ) ) ( not ( = ?auto_1578187 ?auto_1578189 ) ) ( not ( = ?auto_1578187 ?auto_1578190 ) ) ( not ( = ?auto_1578187 ?auto_1578191 ) ) ( not ( = ?auto_1578187 ?auto_1578192 ) ) ( not ( = ?auto_1578187 ?auto_1578193 ) ) ( not ( = ?auto_1578187 ?auto_1578194 ) ) ( not ( = ?auto_1578187 ?auto_1578195 ) ) ( not ( = ?auto_1578187 ?auto_1578196 ) ) ( not ( = ?auto_1578187 ?auto_1578197 ) ) ( not ( = ?auto_1578187 ?auto_1578200 ) ) ( not ( = ?auto_1578186 ?auto_1578188 ) ) ( not ( = ?auto_1578186 ?auto_1578189 ) ) ( not ( = ?auto_1578186 ?auto_1578190 ) ) ( not ( = ?auto_1578186 ?auto_1578191 ) ) ( not ( = ?auto_1578186 ?auto_1578192 ) ) ( not ( = ?auto_1578186 ?auto_1578193 ) ) ( not ( = ?auto_1578186 ?auto_1578194 ) ) ( not ( = ?auto_1578186 ?auto_1578195 ) ) ( not ( = ?auto_1578186 ?auto_1578196 ) ) ( not ( = ?auto_1578186 ?auto_1578197 ) ) ( not ( = ?auto_1578186 ?auto_1578200 ) ) ( not ( = ?auto_1578188 ?auto_1578189 ) ) ( not ( = ?auto_1578188 ?auto_1578190 ) ) ( not ( = ?auto_1578188 ?auto_1578191 ) ) ( not ( = ?auto_1578188 ?auto_1578192 ) ) ( not ( = ?auto_1578188 ?auto_1578193 ) ) ( not ( = ?auto_1578188 ?auto_1578194 ) ) ( not ( = ?auto_1578188 ?auto_1578195 ) ) ( not ( = ?auto_1578188 ?auto_1578196 ) ) ( not ( = ?auto_1578188 ?auto_1578197 ) ) ( not ( = ?auto_1578188 ?auto_1578200 ) ) ( not ( = ?auto_1578189 ?auto_1578190 ) ) ( not ( = ?auto_1578189 ?auto_1578191 ) ) ( not ( = ?auto_1578189 ?auto_1578192 ) ) ( not ( = ?auto_1578189 ?auto_1578193 ) ) ( not ( = ?auto_1578189 ?auto_1578194 ) ) ( not ( = ?auto_1578189 ?auto_1578195 ) ) ( not ( = ?auto_1578189 ?auto_1578196 ) ) ( not ( = ?auto_1578189 ?auto_1578197 ) ) ( not ( = ?auto_1578189 ?auto_1578200 ) ) ( not ( = ?auto_1578190 ?auto_1578191 ) ) ( not ( = ?auto_1578190 ?auto_1578192 ) ) ( not ( = ?auto_1578190 ?auto_1578193 ) ) ( not ( = ?auto_1578190 ?auto_1578194 ) ) ( not ( = ?auto_1578190 ?auto_1578195 ) ) ( not ( = ?auto_1578190 ?auto_1578196 ) ) ( not ( = ?auto_1578190 ?auto_1578197 ) ) ( not ( = ?auto_1578190 ?auto_1578200 ) ) ( not ( = ?auto_1578191 ?auto_1578192 ) ) ( not ( = ?auto_1578191 ?auto_1578193 ) ) ( not ( = ?auto_1578191 ?auto_1578194 ) ) ( not ( = ?auto_1578191 ?auto_1578195 ) ) ( not ( = ?auto_1578191 ?auto_1578196 ) ) ( not ( = ?auto_1578191 ?auto_1578197 ) ) ( not ( = ?auto_1578191 ?auto_1578200 ) ) ( not ( = ?auto_1578192 ?auto_1578193 ) ) ( not ( = ?auto_1578192 ?auto_1578194 ) ) ( not ( = ?auto_1578192 ?auto_1578195 ) ) ( not ( = ?auto_1578192 ?auto_1578196 ) ) ( not ( = ?auto_1578192 ?auto_1578197 ) ) ( not ( = ?auto_1578192 ?auto_1578200 ) ) ( not ( = ?auto_1578193 ?auto_1578194 ) ) ( not ( = ?auto_1578193 ?auto_1578195 ) ) ( not ( = ?auto_1578193 ?auto_1578196 ) ) ( not ( = ?auto_1578193 ?auto_1578197 ) ) ( not ( = ?auto_1578193 ?auto_1578200 ) ) ( not ( = ?auto_1578194 ?auto_1578195 ) ) ( not ( = ?auto_1578194 ?auto_1578196 ) ) ( not ( = ?auto_1578194 ?auto_1578197 ) ) ( not ( = ?auto_1578194 ?auto_1578200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578195 ?auto_1578196 ?auto_1578197 )
      ( MAKE-14CRATE-VERIFY ?auto_1578183 ?auto_1578184 ?auto_1578185 ?auto_1578187 ?auto_1578186 ?auto_1578188 ?auto_1578189 ?auto_1578190 ?auto_1578191 ?auto_1578192 ?auto_1578193 ?auto_1578194 ?auto_1578195 ?auto_1578196 ?auto_1578197 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578387 - SURFACE
      ?auto_1578388 - SURFACE
      ?auto_1578389 - SURFACE
      ?auto_1578391 - SURFACE
      ?auto_1578390 - SURFACE
      ?auto_1578392 - SURFACE
      ?auto_1578393 - SURFACE
      ?auto_1578394 - SURFACE
      ?auto_1578395 - SURFACE
      ?auto_1578396 - SURFACE
      ?auto_1578397 - SURFACE
      ?auto_1578398 - SURFACE
      ?auto_1578399 - SURFACE
      ?auto_1578400 - SURFACE
      ?auto_1578401 - SURFACE
    )
    :vars
    (
      ?auto_1578405 - HOIST
      ?auto_1578406 - PLACE
      ?auto_1578402 - PLACE
      ?auto_1578403 - HOIST
      ?auto_1578407 - SURFACE
      ?auto_1578404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578405 ?auto_1578406 ) ( SURFACE-AT ?auto_1578400 ?auto_1578406 ) ( CLEAR ?auto_1578400 ) ( IS-CRATE ?auto_1578401 ) ( not ( = ?auto_1578400 ?auto_1578401 ) ) ( AVAILABLE ?auto_1578405 ) ( ON ?auto_1578400 ?auto_1578399 ) ( not ( = ?auto_1578399 ?auto_1578400 ) ) ( not ( = ?auto_1578399 ?auto_1578401 ) ) ( not ( = ?auto_1578402 ?auto_1578406 ) ) ( HOIST-AT ?auto_1578403 ?auto_1578402 ) ( not ( = ?auto_1578405 ?auto_1578403 ) ) ( AVAILABLE ?auto_1578403 ) ( SURFACE-AT ?auto_1578401 ?auto_1578402 ) ( ON ?auto_1578401 ?auto_1578407 ) ( CLEAR ?auto_1578401 ) ( not ( = ?auto_1578400 ?auto_1578407 ) ) ( not ( = ?auto_1578401 ?auto_1578407 ) ) ( not ( = ?auto_1578399 ?auto_1578407 ) ) ( TRUCK-AT ?auto_1578404 ?auto_1578406 ) ( ON ?auto_1578388 ?auto_1578387 ) ( ON ?auto_1578389 ?auto_1578388 ) ( ON ?auto_1578391 ?auto_1578389 ) ( ON ?auto_1578390 ?auto_1578391 ) ( ON ?auto_1578392 ?auto_1578390 ) ( ON ?auto_1578393 ?auto_1578392 ) ( ON ?auto_1578394 ?auto_1578393 ) ( ON ?auto_1578395 ?auto_1578394 ) ( ON ?auto_1578396 ?auto_1578395 ) ( ON ?auto_1578397 ?auto_1578396 ) ( ON ?auto_1578398 ?auto_1578397 ) ( ON ?auto_1578399 ?auto_1578398 ) ( not ( = ?auto_1578387 ?auto_1578388 ) ) ( not ( = ?auto_1578387 ?auto_1578389 ) ) ( not ( = ?auto_1578387 ?auto_1578391 ) ) ( not ( = ?auto_1578387 ?auto_1578390 ) ) ( not ( = ?auto_1578387 ?auto_1578392 ) ) ( not ( = ?auto_1578387 ?auto_1578393 ) ) ( not ( = ?auto_1578387 ?auto_1578394 ) ) ( not ( = ?auto_1578387 ?auto_1578395 ) ) ( not ( = ?auto_1578387 ?auto_1578396 ) ) ( not ( = ?auto_1578387 ?auto_1578397 ) ) ( not ( = ?auto_1578387 ?auto_1578398 ) ) ( not ( = ?auto_1578387 ?auto_1578399 ) ) ( not ( = ?auto_1578387 ?auto_1578400 ) ) ( not ( = ?auto_1578387 ?auto_1578401 ) ) ( not ( = ?auto_1578387 ?auto_1578407 ) ) ( not ( = ?auto_1578388 ?auto_1578389 ) ) ( not ( = ?auto_1578388 ?auto_1578391 ) ) ( not ( = ?auto_1578388 ?auto_1578390 ) ) ( not ( = ?auto_1578388 ?auto_1578392 ) ) ( not ( = ?auto_1578388 ?auto_1578393 ) ) ( not ( = ?auto_1578388 ?auto_1578394 ) ) ( not ( = ?auto_1578388 ?auto_1578395 ) ) ( not ( = ?auto_1578388 ?auto_1578396 ) ) ( not ( = ?auto_1578388 ?auto_1578397 ) ) ( not ( = ?auto_1578388 ?auto_1578398 ) ) ( not ( = ?auto_1578388 ?auto_1578399 ) ) ( not ( = ?auto_1578388 ?auto_1578400 ) ) ( not ( = ?auto_1578388 ?auto_1578401 ) ) ( not ( = ?auto_1578388 ?auto_1578407 ) ) ( not ( = ?auto_1578389 ?auto_1578391 ) ) ( not ( = ?auto_1578389 ?auto_1578390 ) ) ( not ( = ?auto_1578389 ?auto_1578392 ) ) ( not ( = ?auto_1578389 ?auto_1578393 ) ) ( not ( = ?auto_1578389 ?auto_1578394 ) ) ( not ( = ?auto_1578389 ?auto_1578395 ) ) ( not ( = ?auto_1578389 ?auto_1578396 ) ) ( not ( = ?auto_1578389 ?auto_1578397 ) ) ( not ( = ?auto_1578389 ?auto_1578398 ) ) ( not ( = ?auto_1578389 ?auto_1578399 ) ) ( not ( = ?auto_1578389 ?auto_1578400 ) ) ( not ( = ?auto_1578389 ?auto_1578401 ) ) ( not ( = ?auto_1578389 ?auto_1578407 ) ) ( not ( = ?auto_1578391 ?auto_1578390 ) ) ( not ( = ?auto_1578391 ?auto_1578392 ) ) ( not ( = ?auto_1578391 ?auto_1578393 ) ) ( not ( = ?auto_1578391 ?auto_1578394 ) ) ( not ( = ?auto_1578391 ?auto_1578395 ) ) ( not ( = ?auto_1578391 ?auto_1578396 ) ) ( not ( = ?auto_1578391 ?auto_1578397 ) ) ( not ( = ?auto_1578391 ?auto_1578398 ) ) ( not ( = ?auto_1578391 ?auto_1578399 ) ) ( not ( = ?auto_1578391 ?auto_1578400 ) ) ( not ( = ?auto_1578391 ?auto_1578401 ) ) ( not ( = ?auto_1578391 ?auto_1578407 ) ) ( not ( = ?auto_1578390 ?auto_1578392 ) ) ( not ( = ?auto_1578390 ?auto_1578393 ) ) ( not ( = ?auto_1578390 ?auto_1578394 ) ) ( not ( = ?auto_1578390 ?auto_1578395 ) ) ( not ( = ?auto_1578390 ?auto_1578396 ) ) ( not ( = ?auto_1578390 ?auto_1578397 ) ) ( not ( = ?auto_1578390 ?auto_1578398 ) ) ( not ( = ?auto_1578390 ?auto_1578399 ) ) ( not ( = ?auto_1578390 ?auto_1578400 ) ) ( not ( = ?auto_1578390 ?auto_1578401 ) ) ( not ( = ?auto_1578390 ?auto_1578407 ) ) ( not ( = ?auto_1578392 ?auto_1578393 ) ) ( not ( = ?auto_1578392 ?auto_1578394 ) ) ( not ( = ?auto_1578392 ?auto_1578395 ) ) ( not ( = ?auto_1578392 ?auto_1578396 ) ) ( not ( = ?auto_1578392 ?auto_1578397 ) ) ( not ( = ?auto_1578392 ?auto_1578398 ) ) ( not ( = ?auto_1578392 ?auto_1578399 ) ) ( not ( = ?auto_1578392 ?auto_1578400 ) ) ( not ( = ?auto_1578392 ?auto_1578401 ) ) ( not ( = ?auto_1578392 ?auto_1578407 ) ) ( not ( = ?auto_1578393 ?auto_1578394 ) ) ( not ( = ?auto_1578393 ?auto_1578395 ) ) ( not ( = ?auto_1578393 ?auto_1578396 ) ) ( not ( = ?auto_1578393 ?auto_1578397 ) ) ( not ( = ?auto_1578393 ?auto_1578398 ) ) ( not ( = ?auto_1578393 ?auto_1578399 ) ) ( not ( = ?auto_1578393 ?auto_1578400 ) ) ( not ( = ?auto_1578393 ?auto_1578401 ) ) ( not ( = ?auto_1578393 ?auto_1578407 ) ) ( not ( = ?auto_1578394 ?auto_1578395 ) ) ( not ( = ?auto_1578394 ?auto_1578396 ) ) ( not ( = ?auto_1578394 ?auto_1578397 ) ) ( not ( = ?auto_1578394 ?auto_1578398 ) ) ( not ( = ?auto_1578394 ?auto_1578399 ) ) ( not ( = ?auto_1578394 ?auto_1578400 ) ) ( not ( = ?auto_1578394 ?auto_1578401 ) ) ( not ( = ?auto_1578394 ?auto_1578407 ) ) ( not ( = ?auto_1578395 ?auto_1578396 ) ) ( not ( = ?auto_1578395 ?auto_1578397 ) ) ( not ( = ?auto_1578395 ?auto_1578398 ) ) ( not ( = ?auto_1578395 ?auto_1578399 ) ) ( not ( = ?auto_1578395 ?auto_1578400 ) ) ( not ( = ?auto_1578395 ?auto_1578401 ) ) ( not ( = ?auto_1578395 ?auto_1578407 ) ) ( not ( = ?auto_1578396 ?auto_1578397 ) ) ( not ( = ?auto_1578396 ?auto_1578398 ) ) ( not ( = ?auto_1578396 ?auto_1578399 ) ) ( not ( = ?auto_1578396 ?auto_1578400 ) ) ( not ( = ?auto_1578396 ?auto_1578401 ) ) ( not ( = ?auto_1578396 ?auto_1578407 ) ) ( not ( = ?auto_1578397 ?auto_1578398 ) ) ( not ( = ?auto_1578397 ?auto_1578399 ) ) ( not ( = ?auto_1578397 ?auto_1578400 ) ) ( not ( = ?auto_1578397 ?auto_1578401 ) ) ( not ( = ?auto_1578397 ?auto_1578407 ) ) ( not ( = ?auto_1578398 ?auto_1578399 ) ) ( not ( = ?auto_1578398 ?auto_1578400 ) ) ( not ( = ?auto_1578398 ?auto_1578401 ) ) ( not ( = ?auto_1578398 ?auto_1578407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578399 ?auto_1578400 ?auto_1578401 )
      ( MAKE-14CRATE-VERIFY ?auto_1578387 ?auto_1578388 ?auto_1578389 ?auto_1578391 ?auto_1578390 ?auto_1578392 ?auto_1578393 ?auto_1578394 ?auto_1578395 ?auto_1578396 ?auto_1578397 ?auto_1578398 ?auto_1578399 ?auto_1578400 ?auto_1578401 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578591 - SURFACE
      ?auto_1578592 - SURFACE
      ?auto_1578593 - SURFACE
      ?auto_1578595 - SURFACE
      ?auto_1578594 - SURFACE
      ?auto_1578596 - SURFACE
      ?auto_1578597 - SURFACE
      ?auto_1578598 - SURFACE
      ?auto_1578599 - SURFACE
      ?auto_1578600 - SURFACE
      ?auto_1578601 - SURFACE
      ?auto_1578602 - SURFACE
      ?auto_1578603 - SURFACE
      ?auto_1578604 - SURFACE
      ?auto_1578605 - SURFACE
    )
    :vars
    (
      ?auto_1578610 - HOIST
      ?auto_1578609 - PLACE
      ?auto_1578611 - PLACE
      ?auto_1578608 - HOIST
      ?auto_1578607 - SURFACE
      ?auto_1578606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578610 ?auto_1578609 ) ( IS-CRATE ?auto_1578605 ) ( not ( = ?auto_1578604 ?auto_1578605 ) ) ( not ( = ?auto_1578603 ?auto_1578604 ) ) ( not ( = ?auto_1578603 ?auto_1578605 ) ) ( not ( = ?auto_1578611 ?auto_1578609 ) ) ( HOIST-AT ?auto_1578608 ?auto_1578611 ) ( not ( = ?auto_1578610 ?auto_1578608 ) ) ( AVAILABLE ?auto_1578608 ) ( SURFACE-AT ?auto_1578605 ?auto_1578611 ) ( ON ?auto_1578605 ?auto_1578607 ) ( CLEAR ?auto_1578605 ) ( not ( = ?auto_1578604 ?auto_1578607 ) ) ( not ( = ?auto_1578605 ?auto_1578607 ) ) ( not ( = ?auto_1578603 ?auto_1578607 ) ) ( TRUCK-AT ?auto_1578606 ?auto_1578609 ) ( SURFACE-AT ?auto_1578603 ?auto_1578609 ) ( CLEAR ?auto_1578603 ) ( LIFTING ?auto_1578610 ?auto_1578604 ) ( IS-CRATE ?auto_1578604 ) ( ON ?auto_1578592 ?auto_1578591 ) ( ON ?auto_1578593 ?auto_1578592 ) ( ON ?auto_1578595 ?auto_1578593 ) ( ON ?auto_1578594 ?auto_1578595 ) ( ON ?auto_1578596 ?auto_1578594 ) ( ON ?auto_1578597 ?auto_1578596 ) ( ON ?auto_1578598 ?auto_1578597 ) ( ON ?auto_1578599 ?auto_1578598 ) ( ON ?auto_1578600 ?auto_1578599 ) ( ON ?auto_1578601 ?auto_1578600 ) ( ON ?auto_1578602 ?auto_1578601 ) ( ON ?auto_1578603 ?auto_1578602 ) ( not ( = ?auto_1578591 ?auto_1578592 ) ) ( not ( = ?auto_1578591 ?auto_1578593 ) ) ( not ( = ?auto_1578591 ?auto_1578595 ) ) ( not ( = ?auto_1578591 ?auto_1578594 ) ) ( not ( = ?auto_1578591 ?auto_1578596 ) ) ( not ( = ?auto_1578591 ?auto_1578597 ) ) ( not ( = ?auto_1578591 ?auto_1578598 ) ) ( not ( = ?auto_1578591 ?auto_1578599 ) ) ( not ( = ?auto_1578591 ?auto_1578600 ) ) ( not ( = ?auto_1578591 ?auto_1578601 ) ) ( not ( = ?auto_1578591 ?auto_1578602 ) ) ( not ( = ?auto_1578591 ?auto_1578603 ) ) ( not ( = ?auto_1578591 ?auto_1578604 ) ) ( not ( = ?auto_1578591 ?auto_1578605 ) ) ( not ( = ?auto_1578591 ?auto_1578607 ) ) ( not ( = ?auto_1578592 ?auto_1578593 ) ) ( not ( = ?auto_1578592 ?auto_1578595 ) ) ( not ( = ?auto_1578592 ?auto_1578594 ) ) ( not ( = ?auto_1578592 ?auto_1578596 ) ) ( not ( = ?auto_1578592 ?auto_1578597 ) ) ( not ( = ?auto_1578592 ?auto_1578598 ) ) ( not ( = ?auto_1578592 ?auto_1578599 ) ) ( not ( = ?auto_1578592 ?auto_1578600 ) ) ( not ( = ?auto_1578592 ?auto_1578601 ) ) ( not ( = ?auto_1578592 ?auto_1578602 ) ) ( not ( = ?auto_1578592 ?auto_1578603 ) ) ( not ( = ?auto_1578592 ?auto_1578604 ) ) ( not ( = ?auto_1578592 ?auto_1578605 ) ) ( not ( = ?auto_1578592 ?auto_1578607 ) ) ( not ( = ?auto_1578593 ?auto_1578595 ) ) ( not ( = ?auto_1578593 ?auto_1578594 ) ) ( not ( = ?auto_1578593 ?auto_1578596 ) ) ( not ( = ?auto_1578593 ?auto_1578597 ) ) ( not ( = ?auto_1578593 ?auto_1578598 ) ) ( not ( = ?auto_1578593 ?auto_1578599 ) ) ( not ( = ?auto_1578593 ?auto_1578600 ) ) ( not ( = ?auto_1578593 ?auto_1578601 ) ) ( not ( = ?auto_1578593 ?auto_1578602 ) ) ( not ( = ?auto_1578593 ?auto_1578603 ) ) ( not ( = ?auto_1578593 ?auto_1578604 ) ) ( not ( = ?auto_1578593 ?auto_1578605 ) ) ( not ( = ?auto_1578593 ?auto_1578607 ) ) ( not ( = ?auto_1578595 ?auto_1578594 ) ) ( not ( = ?auto_1578595 ?auto_1578596 ) ) ( not ( = ?auto_1578595 ?auto_1578597 ) ) ( not ( = ?auto_1578595 ?auto_1578598 ) ) ( not ( = ?auto_1578595 ?auto_1578599 ) ) ( not ( = ?auto_1578595 ?auto_1578600 ) ) ( not ( = ?auto_1578595 ?auto_1578601 ) ) ( not ( = ?auto_1578595 ?auto_1578602 ) ) ( not ( = ?auto_1578595 ?auto_1578603 ) ) ( not ( = ?auto_1578595 ?auto_1578604 ) ) ( not ( = ?auto_1578595 ?auto_1578605 ) ) ( not ( = ?auto_1578595 ?auto_1578607 ) ) ( not ( = ?auto_1578594 ?auto_1578596 ) ) ( not ( = ?auto_1578594 ?auto_1578597 ) ) ( not ( = ?auto_1578594 ?auto_1578598 ) ) ( not ( = ?auto_1578594 ?auto_1578599 ) ) ( not ( = ?auto_1578594 ?auto_1578600 ) ) ( not ( = ?auto_1578594 ?auto_1578601 ) ) ( not ( = ?auto_1578594 ?auto_1578602 ) ) ( not ( = ?auto_1578594 ?auto_1578603 ) ) ( not ( = ?auto_1578594 ?auto_1578604 ) ) ( not ( = ?auto_1578594 ?auto_1578605 ) ) ( not ( = ?auto_1578594 ?auto_1578607 ) ) ( not ( = ?auto_1578596 ?auto_1578597 ) ) ( not ( = ?auto_1578596 ?auto_1578598 ) ) ( not ( = ?auto_1578596 ?auto_1578599 ) ) ( not ( = ?auto_1578596 ?auto_1578600 ) ) ( not ( = ?auto_1578596 ?auto_1578601 ) ) ( not ( = ?auto_1578596 ?auto_1578602 ) ) ( not ( = ?auto_1578596 ?auto_1578603 ) ) ( not ( = ?auto_1578596 ?auto_1578604 ) ) ( not ( = ?auto_1578596 ?auto_1578605 ) ) ( not ( = ?auto_1578596 ?auto_1578607 ) ) ( not ( = ?auto_1578597 ?auto_1578598 ) ) ( not ( = ?auto_1578597 ?auto_1578599 ) ) ( not ( = ?auto_1578597 ?auto_1578600 ) ) ( not ( = ?auto_1578597 ?auto_1578601 ) ) ( not ( = ?auto_1578597 ?auto_1578602 ) ) ( not ( = ?auto_1578597 ?auto_1578603 ) ) ( not ( = ?auto_1578597 ?auto_1578604 ) ) ( not ( = ?auto_1578597 ?auto_1578605 ) ) ( not ( = ?auto_1578597 ?auto_1578607 ) ) ( not ( = ?auto_1578598 ?auto_1578599 ) ) ( not ( = ?auto_1578598 ?auto_1578600 ) ) ( not ( = ?auto_1578598 ?auto_1578601 ) ) ( not ( = ?auto_1578598 ?auto_1578602 ) ) ( not ( = ?auto_1578598 ?auto_1578603 ) ) ( not ( = ?auto_1578598 ?auto_1578604 ) ) ( not ( = ?auto_1578598 ?auto_1578605 ) ) ( not ( = ?auto_1578598 ?auto_1578607 ) ) ( not ( = ?auto_1578599 ?auto_1578600 ) ) ( not ( = ?auto_1578599 ?auto_1578601 ) ) ( not ( = ?auto_1578599 ?auto_1578602 ) ) ( not ( = ?auto_1578599 ?auto_1578603 ) ) ( not ( = ?auto_1578599 ?auto_1578604 ) ) ( not ( = ?auto_1578599 ?auto_1578605 ) ) ( not ( = ?auto_1578599 ?auto_1578607 ) ) ( not ( = ?auto_1578600 ?auto_1578601 ) ) ( not ( = ?auto_1578600 ?auto_1578602 ) ) ( not ( = ?auto_1578600 ?auto_1578603 ) ) ( not ( = ?auto_1578600 ?auto_1578604 ) ) ( not ( = ?auto_1578600 ?auto_1578605 ) ) ( not ( = ?auto_1578600 ?auto_1578607 ) ) ( not ( = ?auto_1578601 ?auto_1578602 ) ) ( not ( = ?auto_1578601 ?auto_1578603 ) ) ( not ( = ?auto_1578601 ?auto_1578604 ) ) ( not ( = ?auto_1578601 ?auto_1578605 ) ) ( not ( = ?auto_1578601 ?auto_1578607 ) ) ( not ( = ?auto_1578602 ?auto_1578603 ) ) ( not ( = ?auto_1578602 ?auto_1578604 ) ) ( not ( = ?auto_1578602 ?auto_1578605 ) ) ( not ( = ?auto_1578602 ?auto_1578607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578603 ?auto_1578604 ?auto_1578605 )
      ( MAKE-14CRATE-VERIFY ?auto_1578591 ?auto_1578592 ?auto_1578593 ?auto_1578595 ?auto_1578594 ?auto_1578596 ?auto_1578597 ?auto_1578598 ?auto_1578599 ?auto_1578600 ?auto_1578601 ?auto_1578602 ?auto_1578603 ?auto_1578604 ?auto_1578605 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578795 - SURFACE
      ?auto_1578796 - SURFACE
      ?auto_1578797 - SURFACE
      ?auto_1578799 - SURFACE
      ?auto_1578798 - SURFACE
      ?auto_1578800 - SURFACE
      ?auto_1578801 - SURFACE
      ?auto_1578802 - SURFACE
      ?auto_1578803 - SURFACE
      ?auto_1578804 - SURFACE
      ?auto_1578805 - SURFACE
      ?auto_1578806 - SURFACE
      ?auto_1578807 - SURFACE
      ?auto_1578808 - SURFACE
      ?auto_1578809 - SURFACE
    )
    :vars
    (
      ?auto_1578814 - HOIST
      ?auto_1578815 - PLACE
      ?auto_1578813 - PLACE
      ?auto_1578811 - HOIST
      ?auto_1578812 - SURFACE
      ?auto_1578810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578814 ?auto_1578815 ) ( IS-CRATE ?auto_1578809 ) ( not ( = ?auto_1578808 ?auto_1578809 ) ) ( not ( = ?auto_1578807 ?auto_1578808 ) ) ( not ( = ?auto_1578807 ?auto_1578809 ) ) ( not ( = ?auto_1578813 ?auto_1578815 ) ) ( HOIST-AT ?auto_1578811 ?auto_1578813 ) ( not ( = ?auto_1578814 ?auto_1578811 ) ) ( AVAILABLE ?auto_1578811 ) ( SURFACE-AT ?auto_1578809 ?auto_1578813 ) ( ON ?auto_1578809 ?auto_1578812 ) ( CLEAR ?auto_1578809 ) ( not ( = ?auto_1578808 ?auto_1578812 ) ) ( not ( = ?auto_1578809 ?auto_1578812 ) ) ( not ( = ?auto_1578807 ?auto_1578812 ) ) ( TRUCK-AT ?auto_1578810 ?auto_1578815 ) ( SURFACE-AT ?auto_1578807 ?auto_1578815 ) ( CLEAR ?auto_1578807 ) ( IS-CRATE ?auto_1578808 ) ( AVAILABLE ?auto_1578814 ) ( IN ?auto_1578808 ?auto_1578810 ) ( ON ?auto_1578796 ?auto_1578795 ) ( ON ?auto_1578797 ?auto_1578796 ) ( ON ?auto_1578799 ?auto_1578797 ) ( ON ?auto_1578798 ?auto_1578799 ) ( ON ?auto_1578800 ?auto_1578798 ) ( ON ?auto_1578801 ?auto_1578800 ) ( ON ?auto_1578802 ?auto_1578801 ) ( ON ?auto_1578803 ?auto_1578802 ) ( ON ?auto_1578804 ?auto_1578803 ) ( ON ?auto_1578805 ?auto_1578804 ) ( ON ?auto_1578806 ?auto_1578805 ) ( ON ?auto_1578807 ?auto_1578806 ) ( not ( = ?auto_1578795 ?auto_1578796 ) ) ( not ( = ?auto_1578795 ?auto_1578797 ) ) ( not ( = ?auto_1578795 ?auto_1578799 ) ) ( not ( = ?auto_1578795 ?auto_1578798 ) ) ( not ( = ?auto_1578795 ?auto_1578800 ) ) ( not ( = ?auto_1578795 ?auto_1578801 ) ) ( not ( = ?auto_1578795 ?auto_1578802 ) ) ( not ( = ?auto_1578795 ?auto_1578803 ) ) ( not ( = ?auto_1578795 ?auto_1578804 ) ) ( not ( = ?auto_1578795 ?auto_1578805 ) ) ( not ( = ?auto_1578795 ?auto_1578806 ) ) ( not ( = ?auto_1578795 ?auto_1578807 ) ) ( not ( = ?auto_1578795 ?auto_1578808 ) ) ( not ( = ?auto_1578795 ?auto_1578809 ) ) ( not ( = ?auto_1578795 ?auto_1578812 ) ) ( not ( = ?auto_1578796 ?auto_1578797 ) ) ( not ( = ?auto_1578796 ?auto_1578799 ) ) ( not ( = ?auto_1578796 ?auto_1578798 ) ) ( not ( = ?auto_1578796 ?auto_1578800 ) ) ( not ( = ?auto_1578796 ?auto_1578801 ) ) ( not ( = ?auto_1578796 ?auto_1578802 ) ) ( not ( = ?auto_1578796 ?auto_1578803 ) ) ( not ( = ?auto_1578796 ?auto_1578804 ) ) ( not ( = ?auto_1578796 ?auto_1578805 ) ) ( not ( = ?auto_1578796 ?auto_1578806 ) ) ( not ( = ?auto_1578796 ?auto_1578807 ) ) ( not ( = ?auto_1578796 ?auto_1578808 ) ) ( not ( = ?auto_1578796 ?auto_1578809 ) ) ( not ( = ?auto_1578796 ?auto_1578812 ) ) ( not ( = ?auto_1578797 ?auto_1578799 ) ) ( not ( = ?auto_1578797 ?auto_1578798 ) ) ( not ( = ?auto_1578797 ?auto_1578800 ) ) ( not ( = ?auto_1578797 ?auto_1578801 ) ) ( not ( = ?auto_1578797 ?auto_1578802 ) ) ( not ( = ?auto_1578797 ?auto_1578803 ) ) ( not ( = ?auto_1578797 ?auto_1578804 ) ) ( not ( = ?auto_1578797 ?auto_1578805 ) ) ( not ( = ?auto_1578797 ?auto_1578806 ) ) ( not ( = ?auto_1578797 ?auto_1578807 ) ) ( not ( = ?auto_1578797 ?auto_1578808 ) ) ( not ( = ?auto_1578797 ?auto_1578809 ) ) ( not ( = ?auto_1578797 ?auto_1578812 ) ) ( not ( = ?auto_1578799 ?auto_1578798 ) ) ( not ( = ?auto_1578799 ?auto_1578800 ) ) ( not ( = ?auto_1578799 ?auto_1578801 ) ) ( not ( = ?auto_1578799 ?auto_1578802 ) ) ( not ( = ?auto_1578799 ?auto_1578803 ) ) ( not ( = ?auto_1578799 ?auto_1578804 ) ) ( not ( = ?auto_1578799 ?auto_1578805 ) ) ( not ( = ?auto_1578799 ?auto_1578806 ) ) ( not ( = ?auto_1578799 ?auto_1578807 ) ) ( not ( = ?auto_1578799 ?auto_1578808 ) ) ( not ( = ?auto_1578799 ?auto_1578809 ) ) ( not ( = ?auto_1578799 ?auto_1578812 ) ) ( not ( = ?auto_1578798 ?auto_1578800 ) ) ( not ( = ?auto_1578798 ?auto_1578801 ) ) ( not ( = ?auto_1578798 ?auto_1578802 ) ) ( not ( = ?auto_1578798 ?auto_1578803 ) ) ( not ( = ?auto_1578798 ?auto_1578804 ) ) ( not ( = ?auto_1578798 ?auto_1578805 ) ) ( not ( = ?auto_1578798 ?auto_1578806 ) ) ( not ( = ?auto_1578798 ?auto_1578807 ) ) ( not ( = ?auto_1578798 ?auto_1578808 ) ) ( not ( = ?auto_1578798 ?auto_1578809 ) ) ( not ( = ?auto_1578798 ?auto_1578812 ) ) ( not ( = ?auto_1578800 ?auto_1578801 ) ) ( not ( = ?auto_1578800 ?auto_1578802 ) ) ( not ( = ?auto_1578800 ?auto_1578803 ) ) ( not ( = ?auto_1578800 ?auto_1578804 ) ) ( not ( = ?auto_1578800 ?auto_1578805 ) ) ( not ( = ?auto_1578800 ?auto_1578806 ) ) ( not ( = ?auto_1578800 ?auto_1578807 ) ) ( not ( = ?auto_1578800 ?auto_1578808 ) ) ( not ( = ?auto_1578800 ?auto_1578809 ) ) ( not ( = ?auto_1578800 ?auto_1578812 ) ) ( not ( = ?auto_1578801 ?auto_1578802 ) ) ( not ( = ?auto_1578801 ?auto_1578803 ) ) ( not ( = ?auto_1578801 ?auto_1578804 ) ) ( not ( = ?auto_1578801 ?auto_1578805 ) ) ( not ( = ?auto_1578801 ?auto_1578806 ) ) ( not ( = ?auto_1578801 ?auto_1578807 ) ) ( not ( = ?auto_1578801 ?auto_1578808 ) ) ( not ( = ?auto_1578801 ?auto_1578809 ) ) ( not ( = ?auto_1578801 ?auto_1578812 ) ) ( not ( = ?auto_1578802 ?auto_1578803 ) ) ( not ( = ?auto_1578802 ?auto_1578804 ) ) ( not ( = ?auto_1578802 ?auto_1578805 ) ) ( not ( = ?auto_1578802 ?auto_1578806 ) ) ( not ( = ?auto_1578802 ?auto_1578807 ) ) ( not ( = ?auto_1578802 ?auto_1578808 ) ) ( not ( = ?auto_1578802 ?auto_1578809 ) ) ( not ( = ?auto_1578802 ?auto_1578812 ) ) ( not ( = ?auto_1578803 ?auto_1578804 ) ) ( not ( = ?auto_1578803 ?auto_1578805 ) ) ( not ( = ?auto_1578803 ?auto_1578806 ) ) ( not ( = ?auto_1578803 ?auto_1578807 ) ) ( not ( = ?auto_1578803 ?auto_1578808 ) ) ( not ( = ?auto_1578803 ?auto_1578809 ) ) ( not ( = ?auto_1578803 ?auto_1578812 ) ) ( not ( = ?auto_1578804 ?auto_1578805 ) ) ( not ( = ?auto_1578804 ?auto_1578806 ) ) ( not ( = ?auto_1578804 ?auto_1578807 ) ) ( not ( = ?auto_1578804 ?auto_1578808 ) ) ( not ( = ?auto_1578804 ?auto_1578809 ) ) ( not ( = ?auto_1578804 ?auto_1578812 ) ) ( not ( = ?auto_1578805 ?auto_1578806 ) ) ( not ( = ?auto_1578805 ?auto_1578807 ) ) ( not ( = ?auto_1578805 ?auto_1578808 ) ) ( not ( = ?auto_1578805 ?auto_1578809 ) ) ( not ( = ?auto_1578805 ?auto_1578812 ) ) ( not ( = ?auto_1578806 ?auto_1578807 ) ) ( not ( = ?auto_1578806 ?auto_1578808 ) ) ( not ( = ?auto_1578806 ?auto_1578809 ) ) ( not ( = ?auto_1578806 ?auto_1578812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578807 ?auto_1578808 ?auto_1578809 )
      ( MAKE-14CRATE-VERIFY ?auto_1578795 ?auto_1578796 ?auto_1578797 ?auto_1578799 ?auto_1578798 ?auto_1578800 ?auto_1578801 ?auto_1578802 ?auto_1578803 ?auto_1578804 ?auto_1578805 ?auto_1578806 ?auto_1578807 ?auto_1578808 ?auto_1578809 ) )
  )

)

