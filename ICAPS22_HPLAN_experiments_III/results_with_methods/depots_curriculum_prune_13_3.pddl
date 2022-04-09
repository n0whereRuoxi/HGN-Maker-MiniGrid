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
      ?auto_15258 - SURFACE
      ?auto_15259 - SURFACE
    )
    :vars
    (
      ?auto_15260 - HOIST
      ?auto_15261 - PLACE
      ?auto_15263 - PLACE
      ?auto_15264 - HOIST
      ?auto_15265 - SURFACE
      ?auto_15262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15260 ?auto_15261 ) ( SURFACE-AT ?auto_15258 ?auto_15261 ) ( CLEAR ?auto_15258 ) ( IS-CRATE ?auto_15259 ) ( AVAILABLE ?auto_15260 ) ( not ( = ?auto_15263 ?auto_15261 ) ) ( HOIST-AT ?auto_15264 ?auto_15263 ) ( AVAILABLE ?auto_15264 ) ( SURFACE-AT ?auto_15259 ?auto_15263 ) ( ON ?auto_15259 ?auto_15265 ) ( CLEAR ?auto_15259 ) ( TRUCK-AT ?auto_15262 ?auto_15261 ) ( not ( = ?auto_15258 ?auto_15259 ) ) ( not ( = ?auto_15258 ?auto_15265 ) ) ( not ( = ?auto_15259 ?auto_15265 ) ) ( not ( = ?auto_15260 ?auto_15264 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15262 ?auto_15261 ?auto_15263 )
      ( !LIFT ?auto_15264 ?auto_15259 ?auto_15265 ?auto_15263 )
      ( !LOAD ?auto_15264 ?auto_15259 ?auto_15262 ?auto_15263 )
      ( !DRIVE ?auto_15262 ?auto_15263 ?auto_15261 )
      ( !UNLOAD ?auto_15260 ?auto_15259 ?auto_15262 ?auto_15261 )
      ( !DROP ?auto_15260 ?auto_15259 ?auto_15258 ?auto_15261 )
      ( MAKE-1CRATE-VERIFY ?auto_15258 ?auto_15259 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15279 - SURFACE
      ?auto_15280 - SURFACE
      ?auto_15281 - SURFACE
    )
    :vars
    (
      ?auto_15284 - HOIST
      ?auto_15285 - PLACE
      ?auto_15282 - PLACE
      ?auto_15283 - HOIST
      ?auto_15286 - SURFACE
      ?auto_15290 - PLACE
      ?auto_15288 - HOIST
      ?auto_15289 - SURFACE
      ?auto_15287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15284 ?auto_15285 ) ( IS-CRATE ?auto_15281 ) ( not ( = ?auto_15282 ?auto_15285 ) ) ( HOIST-AT ?auto_15283 ?auto_15282 ) ( AVAILABLE ?auto_15283 ) ( SURFACE-AT ?auto_15281 ?auto_15282 ) ( ON ?auto_15281 ?auto_15286 ) ( CLEAR ?auto_15281 ) ( not ( = ?auto_15280 ?auto_15281 ) ) ( not ( = ?auto_15280 ?auto_15286 ) ) ( not ( = ?auto_15281 ?auto_15286 ) ) ( not ( = ?auto_15284 ?auto_15283 ) ) ( SURFACE-AT ?auto_15279 ?auto_15285 ) ( CLEAR ?auto_15279 ) ( IS-CRATE ?auto_15280 ) ( AVAILABLE ?auto_15284 ) ( not ( = ?auto_15290 ?auto_15285 ) ) ( HOIST-AT ?auto_15288 ?auto_15290 ) ( AVAILABLE ?auto_15288 ) ( SURFACE-AT ?auto_15280 ?auto_15290 ) ( ON ?auto_15280 ?auto_15289 ) ( CLEAR ?auto_15280 ) ( TRUCK-AT ?auto_15287 ?auto_15285 ) ( not ( = ?auto_15279 ?auto_15280 ) ) ( not ( = ?auto_15279 ?auto_15289 ) ) ( not ( = ?auto_15280 ?auto_15289 ) ) ( not ( = ?auto_15284 ?auto_15288 ) ) ( not ( = ?auto_15279 ?auto_15281 ) ) ( not ( = ?auto_15279 ?auto_15286 ) ) ( not ( = ?auto_15281 ?auto_15289 ) ) ( not ( = ?auto_15282 ?auto_15290 ) ) ( not ( = ?auto_15283 ?auto_15288 ) ) ( not ( = ?auto_15286 ?auto_15289 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15279 ?auto_15280 )
      ( MAKE-1CRATE ?auto_15280 ?auto_15281 )
      ( MAKE-2CRATE-VERIFY ?auto_15279 ?auto_15280 ?auto_15281 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15305 - SURFACE
      ?auto_15306 - SURFACE
      ?auto_15307 - SURFACE
      ?auto_15308 - SURFACE
    )
    :vars
    (
      ?auto_15310 - HOIST
      ?auto_15311 - PLACE
      ?auto_15309 - PLACE
      ?auto_15312 - HOIST
      ?auto_15313 - SURFACE
      ?auto_15316 - PLACE
      ?auto_15315 - HOIST
      ?auto_15320 - SURFACE
      ?auto_15317 - PLACE
      ?auto_15319 - HOIST
      ?auto_15318 - SURFACE
      ?auto_15314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15310 ?auto_15311 ) ( IS-CRATE ?auto_15308 ) ( not ( = ?auto_15309 ?auto_15311 ) ) ( HOIST-AT ?auto_15312 ?auto_15309 ) ( AVAILABLE ?auto_15312 ) ( SURFACE-AT ?auto_15308 ?auto_15309 ) ( ON ?auto_15308 ?auto_15313 ) ( CLEAR ?auto_15308 ) ( not ( = ?auto_15307 ?auto_15308 ) ) ( not ( = ?auto_15307 ?auto_15313 ) ) ( not ( = ?auto_15308 ?auto_15313 ) ) ( not ( = ?auto_15310 ?auto_15312 ) ) ( IS-CRATE ?auto_15307 ) ( not ( = ?auto_15316 ?auto_15311 ) ) ( HOIST-AT ?auto_15315 ?auto_15316 ) ( AVAILABLE ?auto_15315 ) ( SURFACE-AT ?auto_15307 ?auto_15316 ) ( ON ?auto_15307 ?auto_15320 ) ( CLEAR ?auto_15307 ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15320 ) ) ( not ( = ?auto_15307 ?auto_15320 ) ) ( not ( = ?auto_15310 ?auto_15315 ) ) ( SURFACE-AT ?auto_15305 ?auto_15311 ) ( CLEAR ?auto_15305 ) ( IS-CRATE ?auto_15306 ) ( AVAILABLE ?auto_15310 ) ( not ( = ?auto_15317 ?auto_15311 ) ) ( HOIST-AT ?auto_15319 ?auto_15317 ) ( AVAILABLE ?auto_15319 ) ( SURFACE-AT ?auto_15306 ?auto_15317 ) ( ON ?auto_15306 ?auto_15318 ) ( CLEAR ?auto_15306 ) ( TRUCK-AT ?auto_15314 ?auto_15311 ) ( not ( = ?auto_15305 ?auto_15306 ) ) ( not ( = ?auto_15305 ?auto_15318 ) ) ( not ( = ?auto_15306 ?auto_15318 ) ) ( not ( = ?auto_15310 ?auto_15319 ) ) ( not ( = ?auto_15305 ?auto_15307 ) ) ( not ( = ?auto_15305 ?auto_15320 ) ) ( not ( = ?auto_15307 ?auto_15318 ) ) ( not ( = ?auto_15316 ?auto_15317 ) ) ( not ( = ?auto_15315 ?auto_15319 ) ) ( not ( = ?auto_15320 ?auto_15318 ) ) ( not ( = ?auto_15305 ?auto_15308 ) ) ( not ( = ?auto_15305 ?auto_15313 ) ) ( not ( = ?auto_15306 ?auto_15308 ) ) ( not ( = ?auto_15306 ?auto_15313 ) ) ( not ( = ?auto_15308 ?auto_15320 ) ) ( not ( = ?auto_15308 ?auto_15318 ) ) ( not ( = ?auto_15309 ?auto_15316 ) ) ( not ( = ?auto_15309 ?auto_15317 ) ) ( not ( = ?auto_15312 ?auto_15315 ) ) ( not ( = ?auto_15312 ?auto_15319 ) ) ( not ( = ?auto_15313 ?auto_15320 ) ) ( not ( = ?auto_15313 ?auto_15318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15305 ?auto_15306 ?auto_15307 )
      ( MAKE-1CRATE ?auto_15307 ?auto_15308 )
      ( MAKE-3CRATE-VERIFY ?auto_15305 ?auto_15306 ?auto_15307 ?auto_15308 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15336 - SURFACE
      ?auto_15337 - SURFACE
      ?auto_15338 - SURFACE
      ?auto_15339 - SURFACE
      ?auto_15340 - SURFACE
    )
    :vars
    (
      ?auto_15345 - HOIST
      ?auto_15341 - PLACE
      ?auto_15343 - PLACE
      ?auto_15342 - HOIST
      ?auto_15346 - SURFACE
      ?auto_15355 - PLACE
      ?auto_15351 - HOIST
      ?auto_15350 - SURFACE
      ?auto_15348 - PLACE
      ?auto_15353 - HOIST
      ?auto_15354 - SURFACE
      ?auto_15349 - PLACE
      ?auto_15347 - HOIST
      ?auto_15352 - SURFACE
      ?auto_15344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15345 ?auto_15341 ) ( IS-CRATE ?auto_15340 ) ( not ( = ?auto_15343 ?auto_15341 ) ) ( HOIST-AT ?auto_15342 ?auto_15343 ) ( AVAILABLE ?auto_15342 ) ( SURFACE-AT ?auto_15340 ?auto_15343 ) ( ON ?auto_15340 ?auto_15346 ) ( CLEAR ?auto_15340 ) ( not ( = ?auto_15339 ?auto_15340 ) ) ( not ( = ?auto_15339 ?auto_15346 ) ) ( not ( = ?auto_15340 ?auto_15346 ) ) ( not ( = ?auto_15345 ?auto_15342 ) ) ( IS-CRATE ?auto_15339 ) ( not ( = ?auto_15355 ?auto_15341 ) ) ( HOIST-AT ?auto_15351 ?auto_15355 ) ( AVAILABLE ?auto_15351 ) ( SURFACE-AT ?auto_15339 ?auto_15355 ) ( ON ?auto_15339 ?auto_15350 ) ( CLEAR ?auto_15339 ) ( not ( = ?auto_15338 ?auto_15339 ) ) ( not ( = ?auto_15338 ?auto_15350 ) ) ( not ( = ?auto_15339 ?auto_15350 ) ) ( not ( = ?auto_15345 ?auto_15351 ) ) ( IS-CRATE ?auto_15338 ) ( not ( = ?auto_15348 ?auto_15341 ) ) ( HOIST-AT ?auto_15353 ?auto_15348 ) ( AVAILABLE ?auto_15353 ) ( SURFACE-AT ?auto_15338 ?auto_15348 ) ( ON ?auto_15338 ?auto_15354 ) ( CLEAR ?auto_15338 ) ( not ( = ?auto_15337 ?auto_15338 ) ) ( not ( = ?auto_15337 ?auto_15354 ) ) ( not ( = ?auto_15338 ?auto_15354 ) ) ( not ( = ?auto_15345 ?auto_15353 ) ) ( SURFACE-AT ?auto_15336 ?auto_15341 ) ( CLEAR ?auto_15336 ) ( IS-CRATE ?auto_15337 ) ( AVAILABLE ?auto_15345 ) ( not ( = ?auto_15349 ?auto_15341 ) ) ( HOIST-AT ?auto_15347 ?auto_15349 ) ( AVAILABLE ?auto_15347 ) ( SURFACE-AT ?auto_15337 ?auto_15349 ) ( ON ?auto_15337 ?auto_15352 ) ( CLEAR ?auto_15337 ) ( TRUCK-AT ?auto_15344 ?auto_15341 ) ( not ( = ?auto_15336 ?auto_15337 ) ) ( not ( = ?auto_15336 ?auto_15352 ) ) ( not ( = ?auto_15337 ?auto_15352 ) ) ( not ( = ?auto_15345 ?auto_15347 ) ) ( not ( = ?auto_15336 ?auto_15338 ) ) ( not ( = ?auto_15336 ?auto_15354 ) ) ( not ( = ?auto_15338 ?auto_15352 ) ) ( not ( = ?auto_15348 ?auto_15349 ) ) ( not ( = ?auto_15353 ?auto_15347 ) ) ( not ( = ?auto_15354 ?auto_15352 ) ) ( not ( = ?auto_15336 ?auto_15339 ) ) ( not ( = ?auto_15336 ?auto_15350 ) ) ( not ( = ?auto_15337 ?auto_15339 ) ) ( not ( = ?auto_15337 ?auto_15350 ) ) ( not ( = ?auto_15339 ?auto_15354 ) ) ( not ( = ?auto_15339 ?auto_15352 ) ) ( not ( = ?auto_15355 ?auto_15348 ) ) ( not ( = ?auto_15355 ?auto_15349 ) ) ( not ( = ?auto_15351 ?auto_15353 ) ) ( not ( = ?auto_15351 ?auto_15347 ) ) ( not ( = ?auto_15350 ?auto_15354 ) ) ( not ( = ?auto_15350 ?auto_15352 ) ) ( not ( = ?auto_15336 ?auto_15340 ) ) ( not ( = ?auto_15336 ?auto_15346 ) ) ( not ( = ?auto_15337 ?auto_15340 ) ) ( not ( = ?auto_15337 ?auto_15346 ) ) ( not ( = ?auto_15338 ?auto_15340 ) ) ( not ( = ?auto_15338 ?auto_15346 ) ) ( not ( = ?auto_15340 ?auto_15350 ) ) ( not ( = ?auto_15340 ?auto_15354 ) ) ( not ( = ?auto_15340 ?auto_15352 ) ) ( not ( = ?auto_15343 ?auto_15355 ) ) ( not ( = ?auto_15343 ?auto_15348 ) ) ( not ( = ?auto_15343 ?auto_15349 ) ) ( not ( = ?auto_15342 ?auto_15351 ) ) ( not ( = ?auto_15342 ?auto_15353 ) ) ( not ( = ?auto_15342 ?auto_15347 ) ) ( not ( = ?auto_15346 ?auto_15350 ) ) ( not ( = ?auto_15346 ?auto_15354 ) ) ( not ( = ?auto_15346 ?auto_15352 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15336 ?auto_15337 ?auto_15338 ?auto_15339 )
      ( MAKE-1CRATE ?auto_15339 ?auto_15340 )
      ( MAKE-4CRATE-VERIFY ?auto_15336 ?auto_15337 ?auto_15338 ?auto_15339 ?auto_15340 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_15372 - SURFACE
      ?auto_15373 - SURFACE
      ?auto_15374 - SURFACE
      ?auto_15375 - SURFACE
      ?auto_15376 - SURFACE
      ?auto_15377 - SURFACE
    )
    :vars
    (
      ?auto_15379 - HOIST
      ?auto_15378 - PLACE
      ?auto_15382 - PLACE
      ?auto_15380 - HOIST
      ?auto_15383 - SURFACE
      ?auto_15392 - PLACE
      ?auto_15390 - HOIST
      ?auto_15388 - SURFACE
      ?auto_15395 - PLACE
      ?auto_15394 - HOIST
      ?auto_15384 - SURFACE
      ?auto_15387 - PLACE
      ?auto_15393 - HOIST
      ?auto_15385 - SURFACE
      ?auto_15386 - PLACE
      ?auto_15391 - HOIST
      ?auto_15389 - SURFACE
      ?auto_15381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15379 ?auto_15378 ) ( IS-CRATE ?auto_15377 ) ( not ( = ?auto_15382 ?auto_15378 ) ) ( HOIST-AT ?auto_15380 ?auto_15382 ) ( AVAILABLE ?auto_15380 ) ( SURFACE-AT ?auto_15377 ?auto_15382 ) ( ON ?auto_15377 ?auto_15383 ) ( CLEAR ?auto_15377 ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15383 ) ) ( not ( = ?auto_15377 ?auto_15383 ) ) ( not ( = ?auto_15379 ?auto_15380 ) ) ( IS-CRATE ?auto_15376 ) ( not ( = ?auto_15392 ?auto_15378 ) ) ( HOIST-AT ?auto_15390 ?auto_15392 ) ( AVAILABLE ?auto_15390 ) ( SURFACE-AT ?auto_15376 ?auto_15392 ) ( ON ?auto_15376 ?auto_15388 ) ( CLEAR ?auto_15376 ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15388 ) ) ( not ( = ?auto_15376 ?auto_15388 ) ) ( not ( = ?auto_15379 ?auto_15390 ) ) ( IS-CRATE ?auto_15375 ) ( not ( = ?auto_15395 ?auto_15378 ) ) ( HOIST-AT ?auto_15394 ?auto_15395 ) ( AVAILABLE ?auto_15394 ) ( SURFACE-AT ?auto_15375 ?auto_15395 ) ( ON ?auto_15375 ?auto_15384 ) ( CLEAR ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15384 ) ) ( not ( = ?auto_15375 ?auto_15384 ) ) ( not ( = ?auto_15379 ?auto_15394 ) ) ( IS-CRATE ?auto_15374 ) ( not ( = ?auto_15387 ?auto_15378 ) ) ( HOIST-AT ?auto_15393 ?auto_15387 ) ( AVAILABLE ?auto_15393 ) ( SURFACE-AT ?auto_15374 ?auto_15387 ) ( ON ?auto_15374 ?auto_15385 ) ( CLEAR ?auto_15374 ) ( not ( = ?auto_15373 ?auto_15374 ) ) ( not ( = ?auto_15373 ?auto_15385 ) ) ( not ( = ?auto_15374 ?auto_15385 ) ) ( not ( = ?auto_15379 ?auto_15393 ) ) ( SURFACE-AT ?auto_15372 ?auto_15378 ) ( CLEAR ?auto_15372 ) ( IS-CRATE ?auto_15373 ) ( AVAILABLE ?auto_15379 ) ( not ( = ?auto_15386 ?auto_15378 ) ) ( HOIST-AT ?auto_15391 ?auto_15386 ) ( AVAILABLE ?auto_15391 ) ( SURFACE-AT ?auto_15373 ?auto_15386 ) ( ON ?auto_15373 ?auto_15389 ) ( CLEAR ?auto_15373 ) ( TRUCK-AT ?auto_15381 ?auto_15378 ) ( not ( = ?auto_15372 ?auto_15373 ) ) ( not ( = ?auto_15372 ?auto_15389 ) ) ( not ( = ?auto_15373 ?auto_15389 ) ) ( not ( = ?auto_15379 ?auto_15391 ) ) ( not ( = ?auto_15372 ?auto_15374 ) ) ( not ( = ?auto_15372 ?auto_15385 ) ) ( not ( = ?auto_15374 ?auto_15389 ) ) ( not ( = ?auto_15387 ?auto_15386 ) ) ( not ( = ?auto_15393 ?auto_15391 ) ) ( not ( = ?auto_15385 ?auto_15389 ) ) ( not ( = ?auto_15372 ?auto_15375 ) ) ( not ( = ?auto_15372 ?auto_15384 ) ) ( not ( = ?auto_15373 ?auto_15375 ) ) ( not ( = ?auto_15373 ?auto_15384 ) ) ( not ( = ?auto_15375 ?auto_15385 ) ) ( not ( = ?auto_15375 ?auto_15389 ) ) ( not ( = ?auto_15395 ?auto_15387 ) ) ( not ( = ?auto_15395 ?auto_15386 ) ) ( not ( = ?auto_15394 ?auto_15393 ) ) ( not ( = ?auto_15394 ?auto_15391 ) ) ( not ( = ?auto_15384 ?auto_15385 ) ) ( not ( = ?auto_15384 ?auto_15389 ) ) ( not ( = ?auto_15372 ?auto_15376 ) ) ( not ( = ?auto_15372 ?auto_15388 ) ) ( not ( = ?auto_15373 ?auto_15376 ) ) ( not ( = ?auto_15373 ?auto_15388 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15388 ) ) ( not ( = ?auto_15376 ?auto_15384 ) ) ( not ( = ?auto_15376 ?auto_15385 ) ) ( not ( = ?auto_15376 ?auto_15389 ) ) ( not ( = ?auto_15392 ?auto_15395 ) ) ( not ( = ?auto_15392 ?auto_15387 ) ) ( not ( = ?auto_15392 ?auto_15386 ) ) ( not ( = ?auto_15390 ?auto_15394 ) ) ( not ( = ?auto_15390 ?auto_15393 ) ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15388 ?auto_15384 ) ) ( not ( = ?auto_15388 ?auto_15385 ) ) ( not ( = ?auto_15388 ?auto_15389 ) ) ( not ( = ?auto_15372 ?auto_15377 ) ) ( not ( = ?auto_15372 ?auto_15383 ) ) ( not ( = ?auto_15373 ?auto_15377 ) ) ( not ( = ?auto_15373 ?auto_15383 ) ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( not ( = ?auto_15374 ?auto_15383 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15383 ) ) ( not ( = ?auto_15377 ?auto_15388 ) ) ( not ( = ?auto_15377 ?auto_15384 ) ) ( not ( = ?auto_15377 ?auto_15385 ) ) ( not ( = ?auto_15377 ?auto_15389 ) ) ( not ( = ?auto_15382 ?auto_15392 ) ) ( not ( = ?auto_15382 ?auto_15395 ) ) ( not ( = ?auto_15382 ?auto_15387 ) ) ( not ( = ?auto_15382 ?auto_15386 ) ) ( not ( = ?auto_15380 ?auto_15390 ) ) ( not ( = ?auto_15380 ?auto_15394 ) ) ( not ( = ?auto_15380 ?auto_15393 ) ) ( not ( = ?auto_15380 ?auto_15391 ) ) ( not ( = ?auto_15383 ?auto_15388 ) ) ( not ( = ?auto_15383 ?auto_15384 ) ) ( not ( = ?auto_15383 ?auto_15385 ) ) ( not ( = ?auto_15383 ?auto_15389 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 )
      ( MAKE-1CRATE ?auto_15376 ?auto_15377 )
      ( MAKE-5CRATE-VERIFY ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 ?auto_15377 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_15413 - SURFACE
      ?auto_15414 - SURFACE
      ?auto_15415 - SURFACE
      ?auto_15416 - SURFACE
      ?auto_15417 - SURFACE
      ?auto_15418 - SURFACE
      ?auto_15419 - SURFACE
    )
    :vars
    (
      ?auto_15424 - HOIST
      ?auto_15421 - PLACE
      ?auto_15420 - PLACE
      ?auto_15423 - HOIST
      ?auto_15422 - SURFACE
      ?auto_15434 - PLACE
      ?auto_15440 - HOIST
      ?auto_15439 - SURFACE
      ?auto_15436 - PLACE
      ?auto_15429 - HOIST
      ?auto_15431 - SURFACE
      ?auto_15438 - PLACE
      ?auto_15432 - HOIST
      ?auto_15433 - SURFACE
      ?auto_15437 - PLACE
      ?auto_15435 - HOIST
      ?auto_15427 - SURFACE
      ?auto_15426 - PLACE
      ?auto_15428 - HOIST
      ?auto_15430 - SURFACE
      ?auto_15425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15424 ?auto_15421 ) ( IS-CRATE ?auto_15419 ) ( not ( = ?auto_15420 ?auto_15421 ) ) ( HOIST-AT ?auto_15423 ?auto_15420 ) ( AVAILABLE ?auto_15423 ) ( SURFACE-AT ?auto_15419 ?auto_15420 ) ( ON ?auto_15419 ?auto_15422 ) ( CLEAR ?auto_15419 ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15422 ) ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( not ( = ?auto_15424 ?auto_15423 ) ) ( IS-CRATE ?auto_15418 ) ( not ( = ?auto_15434 ?auto_15421 ) ) ( HOIST-AT ?auto_15440 ?auto_15434 ) ( AVAILABLE ?auto_15440 ) ( SURFACE-AT ?auto_15418 ?auto_15434 ) ( ON ?auto_15418 ?auto_15439 ) ( CLEAR ?auto_15418 ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15439 ) ) ( not ( = ?auto_15418 ?auto_15439 ) ) ( not ( = ?auto_15424 ?auto_15440 ) ) ( IS-CRATE ?auto_15417 ) ( not ( = ?auto_15436 ?auto_15421 ) ) ( HOIST-AT ?auto_15429 ?auto_15436 ) ( AVAILABLE ?auto_15429 ) ( SURFACE-AT ?auto_15417 ?auto_15436 ) ( ON ?auto_15417 ?auto_15431 ) ( CLEAR ?auto_15417 ) ( not ( = ?auto_15416 ?auto_15417 ) ) ( not ( = ?auto_15416 ?auto_15431 ) ) ( not ( = ?auto_15417 ?auto_15431 ) ) ( not ( = ?auto_15424 ?auto_15429 ) ) ( IS-CRATE ?auto_15416 ) ( not ( = ?auto_15438 ?auto_15421 ) ) ( HOIST-AT ?auto_15432 ?auto_15438 ) ( AVAILABLE ?auto_15432 ) ( SURFACE-AT ?auto_15416 ?auto_15438 ) ( ON ?auto_15416 ?auto_15433 ) ( CLEAR ?auto_15416 ) ( not ( = ?auto_15415 ?auto_15416 ) ) ( not ( = ?auto_15415 ?auto_15433 ) ) ( not ( = ?auto_15416 ?auto_15433 ) ) ( not ( = ?auto_15424 ?auto_15432 ) ) ( IS-CRATE ?auto_15415 ) ( not ( = ?auto_15437 ?auto_15421 ) ) ( HOIST-AT ?auto_15435 ?auto_15437 ) ( AVAILABLE ?auto_15435 ) ( SURFACE-AT ?auto_15415 ?auto_15437 ) ( ON ?auto_15415 ?auto_15427 ) ( CLEAR ?auto_15415 ) ( not ( = ?auto_15414 ?auto_15415 ) ) ( not ( = ?auto_15414 ?auto_15427 ) ) ( not ( = ?auto_15415 ?auto_15427 ) ) ( not ( = ?auto_15424 ?auto_15435 ) ) ( SURFACE-AT ?auto_15413 ?auto_15421 ) ( CLEAR ?auto_15413 ) ( IS-CRATE ?auto_15414 ) ( AVAILABLE ?auto_15424 ) ( not ( = ?auto_15426 ?auto_15421 ) ) ( HOIST-AT ?auto_15428 ?auto_15426 ) ( AVAILABLE ?auto_15428 ) ( SURFACE-AT ?auto_15414 ?auto_15426 ) ( ON ?auto_15414 ?auto_15430 ) ( CLEAR ?auto_15414 ) ( TRUCK-AT ?auto_15425 ?auto_15421 ) ( not ( = ?auto_15413 ?auto_15414 ) ) ( not ( = ?auto_15413 ?auto_15430 ) ) ( not ( = ?auto_15414 ?auto_15430 ) ) ( not ( = ?auto_15424 ?auto_15428 ) ) ( not ( = ?auto_15413 ?auto_15415 ) ) ( not ( = ?auto_15413 ?auto_15427 ) ) ( not ( = ?auto_15415 ?auto_15430 ) ) ( not ( = ?auto_15437 ?auto_15426 ) ) ( not ( = ?auto_15435 ?auto_15428 ) ) ( not ( = ?auto_15427 ?auto_15430 ) ) ( not ( = ?auto_15413 ?auto_15416 ) ) ( not ( = ?auto_15413 ?auto_15433 ) ) ( not ( = ?auto_15414 ?auto_15416 ) ) ( not ( = ?auto_15414 ?auto_15433 ) ) ( not ( = ?auto_15416 ?auto_15427 ) ) ( not ( = ?auto_15416 ?auto_15430 ) ) ( not ( = ?auto_15438 ?auto_15437 ) ) ( not ( = ?auto_15438 ?auto_15426 ) ) ( not ( = ?auto_15432 ?auto_15435 ) ) ( not ( = ?auto_15432 ?auto_15428 ) ) ( not ( = ?auto_15433 ?auto_15427 ) ) ( not ( = ?auto_15433 ?auto_15430 ) ) ( not ( = ?auto_15413 ?auto_15417 ) ) ( not ( = ?auto_15413 ?auto_15431 ) ) ( not ( = ?auto_15414 ?auto_15417 ) ) ( not ( = ?auto_15414 ?auto_15431 ) ) ( not ( = ?auto_15415 ?auto_15417 ) ) ( not ( = ?auto_15415 ?auto_15431 ) ) ( not ( = ?auto_15417 ?auto_15433 ) ) ( not ( = ?auto_15417 ?auto_15427 ) ) ( not ( = ?auto_15417 ?auto_15430 ) ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( not ( = ?auto_15436 ?auto_15437 ) ) ( not ( = ?auto_15436 ?auto_15426 ) ) ( not ( = ?auto_15429 ?auto_15432 ) ) ( not ( = ?auto_15429 ?auto_15435 ) ) ( not ( = ?auto_15429 ?auto_15428 ) ) ( not ( = ?auto_15431 ?auto_15433 ) ) ( not ( = ?auto_15431 ?auto_15427 ) ) ( not ( = ?auto_15431 ?auto_15430 ) ) ( not ( = ?auto_15413 ?auto_15418 ) ) ( not ( = ?auto_15413 ?auto_15439 ) ) ( not ( = ?auto_15414 ?auto_15418 ) ) ( not ( = ?auto_15414 ?auto_15439 ) ) ( not ( = ?auto_15415 ?auto_15418 ) ) ( not ( = ?auto_15415 ?auto_15439 ) ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( not ( = ?auto_15416 ?auto_15439 ) ) ( not ( = ?auto_15418 ?auto_15431 ) ) ( not ( = ?auto_15418 ?auto_15433 ) ) ( not ( = ?auto_15418 ?auto_15427 ) ) ( not ( = ?auto_15418 ?auto_15430 ) ) ( not ( = ?auto_15434 ?auto_15436 ) ) ( not ( = ?auto_15434 ?auto_15438 ) ) ( not ( = ?auto_15434 ?auto_15437 ) ) ( not ( = ?auto_15434 ?auto_15426 ) ) ( not ( = ?auto_15440 ?auto_15429 ) ) ( not ( = ?auto_15440 ?auto_15432 ) ) ( not ( = ?auto_15440 ?auto_15435 ) ) ( not ( = ?auto_15440 ?auto_15428 ) ) ( not ( = ?auto_15439 ?auto_15431 ) ) ( not ( = ?auto_15439 ?auto_15433 ) ) ( not ( = ?auto_15439 ?auto_15427 ) ) ( not ( = ?auto_15439 ?auto_15430 ) ) ( not ( = ?auto_15413 ?auto_15419 ) ) ( not ( = ?auto_15413 ?auto_15422 ) ) ( not ( = ?auto_15414 ?auto_15419 ) ) ( not ( = ?auto_15414 ?auto_15422 ) ) ( not ( = ?auto_15415 ?auto_15419 ) ) ( not ( = ?auto_15415 ?auto_15422 ) ) ( not ( = ?auto_15416 ?auto_15419 ) ) ( not ( = ?auto_15416 ?auto_15422 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15417 ?auto_15422 ) ) ( not ( = ?auto_15419 ?auto_15439 ) ) ( not ( = ?auto_15419 ?auto_15431 ) ) ( not ( = ?auto_15419 ?auto_15433 ) ) ( not ( = ?auto_15419 ?auto_15427 ) ) ( not ( = ?auto_15419 ?auto_15430 ) ) ( not ( = ?auto_15420 ?auto_15434 ) ) ( not ( = ?auto_15420 ?auto_15436 ) ) ( not ( = ?auto_15420 ?auto_15438 ) ) ( not ( = ?auto_15420 ?auto_15437 ) ) ( not ( = ?auto_15420 ?auto_15426 ) ) ( not ( = ?auto_15423 ?auto_15440 ) ) ( not ( = ?auto_15423 ?auto_15429 ) ) ( not ( = ?auto_15423 ?auto_15432 ) ) ( not ( = ?auto_15423 ?auto_15435 ) ) ( not ( = ?auto_15423 ?auto_15428 ) ) ( not ( = ?auto_15422 ?auto_15439 ) ) ( not ( = ?auto_15422 ?auto_15431 ) ) ( not ( = ?auto_15422 ?auto_15433 ) ) ( not ( = ?auto_15422 ?auto_15427 ) ) ( not ( = ?auto_15422 ?auto_15430 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15413 ?auto_15414 ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 )
      ( MAKE-1CRATE ?auto_15418 ?auto_15419 )
      ( MAKE-6CRATE-VERIFY ?auto_15413 ?auto_15414 ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 ?auto_15419 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_15459 - SURFACE
      ?auto_15460 - SURFACE
      ?auto_15461 - SURFACE
      ?auto_15462 - SURFACE
      ?auto_15463 - SURFACE
      ?auto_15464 - SURFACE
      ?auto_15465 - SURFACE
      ?auto_15466 - SURFACE
    )
    :vars
    (
      ?auto_15472 - HOIST
      ?auto_15470 - PLACE
      ?auto_15467 - PLACE
      ?auto_15469 - HOIST
      ?auto_15471 - SURFACE
      ?auto_15480 - PLACE
      ?auto_15483 - HOIST
      ?auto_15484 - SURFACE
      ?auto_15482 - PLACE
      ?auto_15479 - HOIST
      ?auto_15474 - SURFACE
      ?auto_15490 - PLACE
      ?auto_15476 - HOIST
      ?auto_15485 - SURFACE
      ?auto_15487 - PLACE
      ?auto_15475 - HOIST
      ?auto_15473 - SURFACE
      ?auto_15488 - PLACE
      ?auto_15489 - HOIST
      ?auto_15477 - SURFACE
      ?auto_15481 - PLACE
      ?auto_15478 - HOIST
      ?auto_15486 - SURFACE
      ?auto_15468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15472 ?auto_15470 ) ( IS-CRATE ?auto_15466 ) ( not ( = ?auto_15467 ?auto_15470 ) ) ( HOIST-AT ?auto_15469 ?auto_15467 ) ( AVAILABLE ?auto_15469 ) ( SURFACE-AT ?auto_15466 ?auto_15467 ) ( ON ?auto_15466 ?auto_15471 ) ( CLEAR ?auto_15466 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15465 ?auto_15471 ) ) ( not ( = ?auto_15466 ?auto_15471 ) ) ( not ( = ?auto_15472 ?auto_15469 ) ) ( IS-CRATE ?auto_15465 ) ( not ( = ?auto_15480 ?auto_15470 ) ) ( HOIST-AT ?auto_15483 ?auto_15480 ) ( AVAILABLE ?auto_15483 ) ( SURFACE-AT ?auto_15465 ?auto_15480 ) ( ON ?auto_15465 ?auto_15484 ) ( CLEAR ?auto_15465 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15464 ?auto_15484 ) ) ( not ( = ?auto_15465 ?auto_15484 ) ) ( not ( = ?auto_15472 ?auto_15483 ) ) ( IS-CRATE ?auto_15464 ) ( not ( = ?auto_15482 ?auto_15470 ) ) ( HOIST-AT ?auto_15479 ?auto_15482 ) ( AVAILABLE ?auto_15479 ) ( SURFACE-AT ?auto_15464 ?auto_15482 ) ( ON ?auto_15464 ?auto_15474 ) ( CLEAR ?auto_15464 ) ( not ( = ?auto_15463 ?auto_15464 ) ) ( not ( = ?auto_15463 ?auto_15474 ) ) ( not ( = ?auto_15464 ?auto_15474 ) ) ( not ( = ?auto_15472 ?auto_15479 ) ) ( IS-CRATE ?auto_15463 ) ( not ( = ?auto_15490 ?auto_15470 ) ) ( HOIST-AT ?auto_15476 ?auto_15490 ) ( AVAILABLE ?auto_15476 ) ( SURFACE-AT ?auto_15463 ?auto_15490 ) ( ON ?auto_15463 ?auto_15485 ) ( CLEAR ?auto_15463 ) ( not ( = ?auto_15462 ?auto_15463 ) ) ( not ( = ?auto_15462 ?auto_15485 ) ) ( not ( = ?auto_15463 ?auto_15485 ) ) ( not ( = ?auto_15472 ?auto_15476 ) ) ( IS-CRATE ?auto_15462 ) ( not ( = ?auto_15487 ?auto_15470 ) ) ( HOIST-AT ?auto_15475 ?auto_15487 ) ( AVAILABLE ?auto_15475 ) ( SURFACE-AT ?auto_15462 ?auto_15487 ) ( ON ?auto_15462 ?auto_15473 ) ( CLEAR ?auto_15462 ) ( not ( = ?auto_15461 ?auto_15462 ) ) ( not ( = ?auto_15461 ?auto_15473 ) ) ( not ( = ?auto_15462 ?auto_15473 ) ) ( not ( = ?auto_15472 ?auto_15475 ) ) ( IS-CRATE ?auto_15461 ) ( not ( = ?auto_15488 ?auto_15470 ) ) ( HOIST-AT ?auto_15489 ?auto_15488 ) ( AVAILABLE ?auto_15489 ) ( SURFACE-AT ?auto_15461 ?auto_15488 ) ( ON ?auto_15461 ?auto_15477 ) ( CLEAR ?auto_15461 ) ( not ( = ?auto_15460 ?auto_15461 ) ) ( not ( = ?auto_15460 ?auto_15477 ) ) ( not ( = ?auto_15461 ?auto_15477 ) ) ( not ( = ?auto_15472 ?auto_15489 ) ) ( SURFACE-AT ?auto_15459 ?auto_15470 ) ( CLEAR ?auto_15459 ) ( IS-CRATE ?auto_15460 ) ( AVAILABLE ?auto_15472 ) ( not ( = ?auto_15481 ?auto_15470 ) ) ( HOIST-AT ?auto_15478 ?auto_15481 ) ( AVAILABLE ?auto_15478 ) ( SURFACE-AT ?auto_15460 ?auto_15481 ) ( ON ?auto_15460 ?auto_15486 ) ( CLEAR ?auto_15460 ) ( TRUCK-AT ?auto_15468 ?auto_15470 ) ( not ( = ?auto_15459 ?auto_15460 ) ) ( not ( = ?auto_15459 ?auto_15486 ) ) ( not ( = ?auto_15460 ?auto_15486 ) ) ( not ( = ?auto_15472 ?auto_15478 ) ) ( not ( = ?auto_15459 ?auto_15461 ) ) ( not ( = ?auto_15459 ?auto_15477 ) ) ( not ( = ?auto_15461 ?auto_15486 ) ) ( not ( = ?auto_15488 ?auto_15481 ) ) ( not ( = ?auto_15489 ?auto_15478 ) ) ( not ( = ?auto_15477 ?auto_15486 ) ) ( not ( = ?auto_15459 ?auto_15462 ) ) ( not ( = ?auto_15459 ?auto_15473 ) ) ( not ( = ?auto_15460 ?auto_15462 ) ) ( not ( = ?auto_15460 ?auto_15473 ) ) ( not ( = ?auto_15462 ?auto_15477 ) ) ( not ( = ?auto_15462 ?auto_15486 ) ) ( not ( = ?auto_15487 ?auto_15488 ) ) ( not ( = ?auto_15487 ?auto_15481 ) ) ( not ( = ?auto_15475 ?auto_15489 ) ) ( not ( = ?auto_15475 ?auto_15478 ) ) ( not ( = ?auto_15473 ?auto_15477 ) ) ( not ( = ?auto_15473 ?auto_15486 ) ) ( not ( = ?auto_15459 ?auto_15463 ) ) ( not ( = ?auto_15459 ?auto_15485 ) ) ( not ( = ?auto_15460 ?auto_15463 ) ) ( not ( = ?auto_15460 ?auto_15485 ) ) ( not ( = ?auto_15461 ?auto_15463 ) ) ( not ( = ?auto_15461 ?auto_15485 ) ) ( not ( = ?auto_15463 ?auto_15473 ) ) ( not ( = ?auto_15463 ?auto_15477 ) ) ( not ( = ?auto_15463 ?auto_15486 ) ) ( not ( = ?auto_15490 ?auto_15487 ) ) ( not ( = ?auto_15490 ?auto_15488 ) ) ( not ( = ?auto_15490 ?auto_15481 ) ) ( not ( = ?auto_15476 ?auto_15475 ) ) ( not ( = ?auto_15476 ?auto_15489 ) ) ( not ( = ?auto_15476 ?auto_15478 ) ) ( not ( = ?auto_15485 ?auto_15473 ) ) ( not ( = ?auto_15485 ?auto_15477 ) ) ( not ( = ?auto_15485 ?auto_15486 ) ) ( not ( = ?auto_15459 ?auto_15464 ) ) ( not ( = ?auto_15459 ?auto_15474 ) ) ( not ( = ?auto_15460 ?auto_15464 ) ) ( not ( = ?auto_15460 ?auto_15474 ) ) ( not ( = ?auto_15461 ?auto_15464 ) ) ( not ( = ?auto_15461 ?auto_15474 ) ) ( not ( = ?auto_15462 ?auto_15464 ) ) ( not ( = ?auto_15462 ?auto_15474 ) ) ( not ( = ?auto_15464 ?auto_15485 ) ) ( not ( = ?auto_15464 ?auto_15473 ) ) ( not ( = ?auto_15464 ?auto_15477 ) ) ( not ( = ?auto_15464 ?auto_15486 ) ) ( not ( = ?auto_15482 ?auto_15490 ) ) ( not ( = ?auto_15482 ?auto_15487 ) ) ( not ( = ?auto_15482 ?auto_15488 ) ) ( not ( = ?auto_15482 ?auto_15481 ) ) ( not ( = ?auto_15479 ?auto_15476 ) ) ( not ( = ?auto_15479 ?auto_15475 ) ) ( not ( = ?auto_15479 ?auto_15489 ) ) ( not ( = ?auto_15479 ?auto_15478 ) ) ( not ( = ?auto_15474 ?auto_15485 ) ) ( not ( = ?auto_15474 ?auto_15473 ) ) ( not ( = ?auto_15474 ?auto_15477 ) ) ( not ( = ?auto_15474 ?auto_15486 ) ) ( not ( = ?auto_15459 ?auto_15465 ) ) ( not ( = ?auto_15459 ?auto_15484 ) ) ( not ( = ?auto_15460 ?auto_15465 ) ) ( not ( = ?auto_15460 ?auto_15484 ) ) ( not ( = ?auto_15461 ?auto_15465 ) ) ( not ( = ?auto_15461 ?auto_15484 ) ) ( not ( = ?auto_15462 ?auto_15465 ) ) ( not ( = ?auto_15462 ?auto_15484 ) ) ( not ( = ?auto_15463 ?auto_15465 ) ) ( not ( = ?auto_15463 ?auto_15484 ) ) ( not ( = ?auto_15465 ?auto_15474 ) ) ( not ( = ?auto_15465 ?auto_15485 ) ) ( not ( = ?auto_15465 ?auto_15473 ) ) ( not ( = ?auto_15465 ?auto_15477 ) ) ( not ( = ?auto_15465 ?auto_15486 ) ) ( not ( = ?auto_15480 ?auto_15482 ) ) ( not ( = ?auto_15480 ?auto_15490 ) ) ( not ( = ?auto_15480 ?auto_15487 ) ) ( not ( = ?auto_15480 ?auto_15488 ) ) ( not ( = ?auto_15480 ?auto_15481 ) ) ( not ( = ?auto_15483 ?auto_15479 ) ) ( not ( = ?auto_15483 ?auto_15476 ) ) ( not ( = ?auto_15483 ?auto_15475 ) ) ( not ( = ?auto_15483 ?auto_15489 ) ) ( not ( = ?auto_15483 ?auto_15478 ) ) ( not ( = ?auto_15484 ?auto_15474 ) ) ( not ( = ?auto_15484 ?auto_15485 ) ) ( not ( = ?auto_15484 ?auto_15473 ) ) ( not ( = ?auto_15484 ?auto_15477 ) ) ( not ( = ?auto_15484 ?auto_15486 ) ) ( not ( = ?auto_15459 ?auto_15466 ) ) ( not ( = ?auto_15459 ?auto_15471 ) ) ( not ( = ?auto_15460 ?auto_15466 ) ) ( not ( = ?auto_15460 ?auto_15471 ) ) ( not ( = ?auto_15461 ?auto_15466 ) ) ( not ( = ?auto_15461 ?auto_15471 ) ) ( not ( = ?auto_15462 ?auto_15466 ) ) ( not ( = ?auto_15462 ?auto_15471 ) ) ( not ( = ?auto_15463 ?auto_15466 ) ) ( not ( = ?auto_15463 ?auto_15471 ) ) ( not ( = ?auto_15464 ?auto_15466 ) ) ( not ( = ?auto_15464 ?auto_15471 ) ) ( not ( = ?auto_15466 ?auto_15484 ) ) ( not ( = ?auto_15466 ?auto_15474 ) ) ( not ( = ?auto_15466 ?auto_15485 ) ) ( not ( = ?auto_15466 ?auto_15473 ) ) ( not ( = ?auto_15466 ?auto_15477 ) ) ( not ( = ?auto_15466 ?auto_15486 ) ) ( not ( = ?auto_15467 ?auto_15480 ) ) ( not ( = ?auto_15467 ?auto_15482 ) ) ( not ( = ?auto_15467 ?auto_15490 ) ) ( not ( = ?auto_15467 ?auto_15487 ) ) ( not ( = ?auto_15467 ?auto_15488 ) ) ( not ( = ?auto_15467 ?auto_15481 ) ) ( not ( = ?auto_15469 ?auto_15483 ) ) ( not ( = ?auto_15469 ?auto_15479 ) ) ( not ( = ?auto_15469 ?auto_15476 ) ) ( not ( = ?auto_15469 ?auto_15475 ) ) ( not ( = ?auto_15469 ?auto_15489 ) ) ( not ( = ?auto_15469 ?auto_15478 ) ) ( not ( = ?auto_15471 ?auto_15484 ) ) ( not ( = ?auto_15471 ?auto_15474 ) ) ( not ( = ?auto_15471 ?auto_15485 ) ) ( not ( = ?auto_15471 ?auto_15473 ) ) ( not ( = ?auto_15471 ?auto_15477 ) ) ( not ( = ?auto_15471 ?auto_15486 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15462 ?auto_15463 ?auto_15464 ?auto_15465 )
      ( MAKE-1CRATE ?auto_15465 ?auto_15466 )
      ( MAKE-7CRATE-VERIFY ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15462 ?auto_15463 ?auto_15464 ?auto_15465 ?auto_15466 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_15510 - SURFACE
      ?auto_15511 - SURFACE
      ?auto_15512 - SURFACE
      ?auto_15513 - SURFACE
      ?auto_15514 - SURFACE
      ?auto_15515 - SURFACE
      ?auto_15516 - SURFACE
      ?auto_15517 - SURFACE
      ?auto_15518 - SURFACE
    )
    :vars
    (
      ?auto_15524 - HOIST
      ?auto_15520 - PLACE
      ?auto_15521 - PLACE
      ?auto_15522 - HOIST
      ?auto_15519 - SURFACE
      ?auto_15531 - SURFACE
      ?auto_15539 - PLACE
      ?auto_15534 - HOIST
      ?auto_15536 - SURFACE
      ?auto_15535 - PLACE
      ?auto_15540 - HOIST
      ?auto_15542 - SURFACE
      ?auto_15525 - PLACE
      ?auto_15543 - HOIST
      ?auto_15537 - SURFACE
      ?auto_15530 - PLACE
      ?auto_15541 - HOIST
      ?auto_15527 - SURFACE
      ?auto_15532 - PLACE
      ?auto_15526 - HOIST
      ?auto_15529 - SURFACE
      ?auto_15533 - PLACE
      ?auto_15528 - HOIST
      ?auto_15538 - SURFACE
      ?auto_15523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15524 ?auto_15520 ) ( IS-CRATE ?auto_15518 ) ( not ( = ?auto_15521 ?auto_15520 ) ) ( HOIST-AT ?auto_15522 ?auto_15521 ) ( SURFACE-AT ?auto_15518 ?auto_15521 ) ( ON ?auto_15518 ?auto_15519 ) ( CLEAR ?auto_15518 ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( not ( = ?auto_15517 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( not ( = ?auto_15524 ?auto_15522 ) ) ( IS-CRATE ?auto_15517 ) ( AVAILABLE ?auto_15522 ) ( SURFACE-AT ?auto_15517 ?auto_15521 ) ( ON ?auto_15517 ?auto_15531 ) ( CLEAR ?auto_15517 ) ( not ( = ?auto_15516 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15531 ) ) ( not ( = ?auto_15517 ?auto_15531 ) ) ( IS-CRATE ?auto_15516 ) ( not ( = ?auto_15539 ?auto_15520 ) ) ( HOIST-AT ?auto_15534 ?auto_15539 ) ( AVAILABLE ?auto_15534 ) ( SURFACE-AT ?auto_15516 ?auto_15539 ) ( ON ?auto_15516 ?auto_15536 ) ( CLEAR ?auto_15516 ) ( not ( = ?auto_15515 ?auto_15516 ) ) ( not ( = ?auto_15515 ?auto_15536 ) ) ( not ( = ?auto_15516 ?auto_15536 ) ) ( not ( = ?auto_15524 ?auto_15534 ) ) ( IS-CRATE ?auto_15515 ) ( not ( = ?auto_15535 ?auto_15520 ) ) ( HOIST-AT ?auto_15540 ?auto_15535 ) ( AVAILABLE ?auto_15540 ) ( SURFACE-AT ?auto_15515 ?auto_15535 ) ( ON ?auto_15515 ?auto_15542 ) ( CLEAR ?auto_15515 ) ( not ( = ?auto_15514 ?auto_15515 ) ) ( not ( = ?auto_15514 ?auto_15542 ) ) ( not ( = ?auto_15515 ?auto_15542 ) ) ( not ( = ?auto_15524 ?auto_15540 ) ) ( IS-CRATE ?auto_15514 ) ( not ( = ?auto_15525 ?auto_15520 ) ) ( HOIST-AT ?auto_15543 ?auto_15525 ) ( AVAILABLE ?auto_15543 ) ( SURFACE-AT ?auto_15514 ?auto_15525 ) ( ON ?auto_15514 ?auto_15537 ) ( CLEAR ?auto_15514 ) ( not ( = ?auto_15513 ?auto_15514 ) ) ( not ( = ?auto_15513 ?auto_15537 ) ) ( not ( = ?auto_15514 ?auto_15537 ) ) ( not ( = ?auto_15524 ?auto_15543 ) ) ( IS-CRATE ?auto_15513 ) ( not ( = ?auto_15530 ?auto_15520 ) ) ( HOIST-AT ?auto_15541 ?auto_15530 ) ( AVAILABLE ?auto_15541 ) ( SURFACE-AT ?auto_15513 ?auto_15530 ) ( ON ?auto_15513 ?auto_15527 ) ( CLEAR ?auto_15513 ) ( not ( = ?auto_15512 ?auto_15513 ) ) ( not ( = ?auto_15512 ?auto_15527 ) ) ( not ( = ?auto_15513 ?auto_15527 ) ) ( not ( = ?auto_15524 ?auto_15541 ) ) ( IS-CRATE ?auto_15512 ) ( not ( = ?auto_15532 ?auto_15520 ) ) ( HOIST-AT ?auto_15526 ?auto_15532 ) ( AVAILABLE ?auto_15526 ) ( SURFACE-AT ?auto_15512 ?auto_15532 ) ( ON ?auto_15512 ?auto_15529 ) ( CLEAR ?auto_15512 ) ( not ( = ?auto_15511 ?auto_15512 ) ) ( not ( = ?auto_15511 ?auto_15529 ) ) ( not ( = ?auto_15512 ?auto_15529 ) ) ( not ( = ?auto_15524 ?auto_15526 ) ) ( SURFACE-AT ?auto_15510 ?auto_15520 ) ( CLEAR ?auto_15510 ) ( IS-CRATE ?auto_15511 ) ( AVAILABLE ?auto_15524 ) ( not ( = ?auto_15533 ?auto_15520 ) ) ( HOIST-AT ?auto_15528 ?auto_15533 ) ( AVAILABLE ?auto_15528 ) ( SURFACE-AT ?auto_15511 ?auto_15533 ) ( ON ?auto_15511 ?auto_15538 ) ( CLEAR ?auto_15511 ) ( TRUCK-AT ?auto_15523 ?auto_15520 ) ( not ( = ?auto_15510 ?auto_15511 ) ) ( not ( = ?auto_15510 ?auto_15538 ) ) ( not ( = ?auto_15511 ?auto_15538 ) ) ( not ( = ?auto_15524 ?auto_15528 ) ) ( not ( = ?auto_15510 ?auto_15512 ) ) ( not ( = ?auto_15510 ?auto_15529 ) ) ( not ( = ?auto_15512 ?auto_15538 ) ) ( not ( = ?auto_15532 ?auto_15533 ) ) ( not ( = ?auto_15526 ?auto_15528 ) ) ( not ( = ?auto_15529 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15513 ) ) ( not ( = ?auto_15510 ?auto_15527 ) ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( not ( = ?auto_15511 ?auto_15527 ) ) ( not ( = ?auto_15513 ?auto_15529 ) ) ( not ( = ?auto_15513 ?auto_15538 ) ) ( not ( = ?auto_15530 ?auto_15532 ) ) ( not ( = ?auto_15530 ?auto_15533 ) ) ( not ( = ?auto_15541 ?auto_15526 ) ) ( not ( = ?auto_15541 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15529 ) ) ( not ( = ?auto_15527 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15514 ) ) ( not ( = ?auto_15510 ?auto_15537 ) ) ( not ( = ?auto_15511 ?auto_15514 ) ) ( not ( = ?auto_15511 ?auto_15537 ) ) ( not ( = ?auto_15512 ?auto_15514 ) ) ( not ( = ?auto_15512 ?auto_15537 ) ) ( not ( = ?auto_15514 ?auto_15527 ) ) ( not ( = ?auto_15514 ?auto_15529 ) ) ( not ( = ?auto_15514 ?auto_15538 ) ) ( not ( = ?auto_15525 ?auto_15530 ) ) ( not ( = ?auto_15525 ?auto_15532 ) ) ( not ( = ?auto_15525 ?auto_15533 ) ) ( not ( = ?auto_15543 ?auto_15541 ) ) ( not ( = ?auto_15543 ?auto_15526 ) ) ( not ( = ?auto_15543 ?auto_15528 ) ) ( not ( = ?auto_15537 ?auto_15527 ) ) ( not ( = ?auto_15537 ?auto_15529 ) ) ( not ( = ?auto_15537 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15515 ) ) ( not ( = ?auto_15510 ?auto_15542 ) ) ( not ( = ?auto_15511 ?auto_15515 ) ) ( not ( = ?auto_15511 ?auto_15542 ) ) ( not ( = ?auto_15512 ?auto_15515 ) ) ( not ( = ?auto_15512 ?auto_15542 ) ) ( not ( = ?auto_15513 ?auto_15515 ) ) ( not ( = ?auto_15513 ?auto_15542 ) ) ( not ( = ?auto_15515 ?auto_15537 ) ) ( not ( = ?auto_15515 ?auto_15527 ) ) ( not ( = ?auto_15515 ?auto_15529 ) ) ( not ( = ?auto_15515 ?auto_15538 ) ) ( not ( = ?auto_15535 ?auto_15525 ) ) ( not ( = ?auto_15535 ?auto_15530 ) ) ( not ( = ?auto_15535 ?auto_15532 ) ) ( not ( = ?auto_15535 ?auto_15533 ) ) ( not ( = ?auto_15540 ?auto_15543 ) ) ( not ( = ?auto_15540 ?auto_15541 ) ) ( not ( = ?auto_15540 ?auto_15526 ) ) ( not ( = ?auto_15540 ?auto_15528 ) ) ( not ( = ?auto_15542 ?auto_15537 ) ) ( not ( = ?auto_15542 ?auto_15527 ) ) ( not ( = ?auto_15542 ?auto_15529 ) ) ( not ( = ?auto_15542 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15516 ) ) ( not ( = ?auto_15510 ?auto_15536 ) ) ( not ( = ?auto_15511 ?auto_15516 ) ) ( not ( = ?auto_15511 ?auto_15536 ) ) ( not ( = ?auto_15512 ?auto_15516 ) ) ( not ( = ?auto_15512 ?auto_15536 ) ) ( not ( = ?auto_15513 ?auto_15516 ) ) ( not ( = ?auto_15513 ?auto_15536 ) ) ( not ( = ?auto_15514 ?auto_15516 ) ) ( not ( = ?auto_15514 ?auto_15536 ) ) ( not ( = ?auto_15516 ?auto_15542 ) ) ( not ( = ?auto_15516 ?auto_15537 ) ) ( not ( = ?auto_15516 ?auto_15527 ) ) ( not ( = ?auto_15516 ?auto_15529 ) ) ( not ( = ?auto_15516 ?auto_15538 ) ) ( not ( = ?auto_15539 ?auto_15535 ) ) ( not ( = ?auto_15539 ?auto_15525 ) ) ( not ( = ?auto_15539 ?auto_15530 ) ) ( not ( = ?auto_15539 ?auto_15532 ) ) ( not ( = ?auto_15539 ?auto_15533 ) ) ( not ( = ?auto_15534 ?auto_15540 ) ) ( not ( = ?auto_15534 ?auto_15543 ) ) ( not ( = ?auto_15534 ?auto_15541 ) ) ( not ( = ?auto_15534 ?auto_15526 ) ) ( not ( = ?auto_15534 ?auto_15528 ) ) ( not ( = ?auto_15536 ?auto_15542 ) ) ( not ( = ?auto_15536 ?auto_15537 ) ) ( not ( = ?auto_15536 ?auto_15527 ) ) ( not ( = ?auto_15536 ?auto_15529 ) ) ( not ( = ?auto_15536 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15517 ) ) ( not ( = ?auto_15510 ?auto_15531 ) ) ( not ( = ?auto_15511 ?auto_15517 ) ) ( not ( = ?auto_15511 ?auto_15531 ) ) ( not ( = ?auto_15512 ?auto_15517 ) ) ( not ( = ?auto_15512 ?auto_15531 ) ) ( not ( = ?auto_15513 ?auto_15517 ) ) ( not ( = ?auto_15513 ?auto_15531 ) ) ( not ( = ?auto_15514 ?auto_15517 ) ) ( not ( = ?auto_15514 ?auto_15531 ) ) ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15515 ?auto_15531 ) ) ( not ( = ?auto_15517 ?auto_15536 ) ) ( not ( = ?auto_15517 ?auto_15542 ) ) ( not ( = ?auto_15517 ?auto_15537 ) ) ( not ( = ?auto_15517 ?auto_15527 ) ) ( not ( = ?auto_15517 ?auto_15529 ) ) ( not ( = ?auto_15517 ?auto_15538 ) ) ( not ( = ?auto_15521 ?auto_15539 ) ) ( not ( = ?auto_15521 ?auto_15535 ) ) ( not ( = ?auto_15521 ?auto_15525 ) ) ( not ( = ?auto_15521 ?auto_15530 ) ) ( not ( = ?auto_15521 ?auto_15532 ) ) ( not ( = ?auto_15521 ?auto_15533 ) ) ( not ( = ?auto_15522 ?auto_15534 ) ) ( not ( = ?auto_15522 ?auto_15540 ) ) ( not ( = ?auto_15522 ?auto_15543 ) ) ( not ( = ?auto_15522 ?auto_15541 ) ) ( not ( = ?auto_15522 ?auto_15526 ) ) ( not ( = ?auto_15522 ?auto_15528 ) ) ( not ( = ?auto_15531 ?auto_15536 ) ) ( not ( = ?auto_15531 ?auto_15542 ) ) ( not ( = ?auto_15531 ?auto_15537 ) ) ( not ( = ?auto_15531 ?auto_15527 ) ) ( not ( = ?auto_15531 ?auto_15529 ) ) ( not ( = ?auto_15531 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15518 ) ) ( not ( = ?auto_15510 ?auto_15519 ) ) ( not ( = ?auto_15511 ?auto_15518 ) ) ( not ( = ?auto_15511 ?auto_15519 ) ) ( not ( = ?auto_15512 ?auto_15518 ) ) ( not ( = ?auto_15512 ?auto_15519 ) ) ( not ( = ?auto_15513 ?auto_15518 ) ) ( not ( = ?auto_15513 ?auto_15519 ) ) ( not ( = ?auto_15514 ?auto_15518 ) ) ( not ( = ?auto_15514 ?auto_15519 ) ) ( not ( = ?auto_15515 ?auto_15518 ) ) ( not ( = ?auto_15515 ?auto_15519 ) ) ( not ( = ?auto_15516 ?auto_15518 ) ) ( not ( = ?auto_15516 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15531 ) ) ( not ( = ?auto_15518 ?auto_15536 ) ) ( not ( = ?auto_15518 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15537 ) ) ( not ( = ?auto_15518 ?auto_15527 ) ) ( not ( = ?auto_15518 ?auto_15529 ) ) ( not ( = ?auto_15518 ?auto_15538 ) ) ( not ( = ?auto_15519 ?auto_15531 ) ) ( not ( = ?auto_15519 ?auto_15536 ) ) ( not ( = ?auto_15519 ?auto_15542 ) ) ( not ( = ?auto_15519 ?auto_15537 ) ) ( not ( = ?auto_15519 ?auto_15527 ) ) ( not ( = ?auto_15519 ?auto_15529 ) ) ( not ( = ?auto_15519 ?auto_15538 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_15510 ?auto_15511 ?auto_15512 ?auto_15513 ?auto_15514 ?auto_15515 ?auto_15516 ?auto_15517 )
      ( MAKE-1CRATE ?auto_15517 ?auto_15518 )
      ( MAKE-8CRATE-VERIFY ?auto_15510 ?auto_15511 ?auto_15512 ?auto_15513 ?auto_15514 ?auto_15515 ?auto_15516 ?auto_15517 ?auto_15518 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_15564 - SURFACE
      ?auto_15565 - SURFACE
      ?auto_15566 - SURFACE
      ?auto_15567 - SURFACE
      ?auto_15568 - SURFACE
      ?auto_15569 - SURFACE
      ?auto_15570 - SURFACE
      ?auto_15571 - SURFACE
      ?auto_15572 - SURFACE
      ?auto_15573 - SURFACE
    )
    :vars
    (
      ?auto_15577 - HOIST
      ?auto_15575 - PLACE
      ?auto_15574 - PLACE
      ?auto_15579 - HOIST
      ?auto_15578 - SURFACE
      ?auto_15588 - PLACE
      ?auto_15591 - HOIST
      ?auto_15584 - SURFACE
      ?auto_15596 - SURFACE
      ?auto_15580 - PLACE
      ?auto_15581 - HOIST
      ?auto_15592 - SURFACE
      ?auto_15582 - PLACE
      ?auto_15601 - HOIST
      ?auto_15585 - SURFACE
      ?auto_15586 - PLACE
      ?auto_15590 - HOIST
      ?auto_15593 - SURFACE
      ?auto_15597 - PLACE
      ?auto_15600 - HOIST
      ?auto_15587 - SURFACE
      ?auto_15595 - PLACE
      ?auto_15589 - HOIST
      ?auto_15598 - SURFACE
      ?auto_15583 - PLACE
      ?auto_15599 - HOIST
      ?auto_15594 - SURFACE
      ?auto_15576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15577 ?auto_15575 ) ( IS-CRATE ?auto_15573 ) ( not ( = ?auto_15574 ?auto_15575 ) ) ( HOIST-AT ?auto_15579 ?auto_15574 ) ( AVAILABLE ?auto_15579 ) ( SURFACE-AT ?auto_15573 ?auto_15574 ) ( ON ?auto_15573 ?auto_15578 ) ( CLEAR ?auto_15573 ) ( not ( = ?auto_15572 ?auto_15573 ) ) ( not ( = ?auto_15572 ?auto_15578 ) ) ( not ( = ?auto_15573 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15579 ) ) ( IS-CRATE ?auto_15572 ) ( not ( = ?auto_15588 ?auto_15575 ) ) ( HOIST-AT ?auto_15591 ?auto_15588 ) ( SURFACE-AT ?auto_15572 ?auto_15588 ) ( ON ?auto_15572 ?auto_15584 ) ( CLEAR ?auto_15572 ) ( not ( = ?auto_15571 ?auto_15572 ) ) ( not ( = ?auto_15571 ?auto_15584 ) ) ( not ( = ?auto_15572 ?auto_15584 ) ) ( not ( = ?auto_15577 ?auto_15591 ) ) ( IS-CRATE ?auto_15571 ) ( AVAILABLE ?auto_15591 ) ( SURFACE-AT ?auto_15571 ?auto_15588 ) ( ON ?auto_15571 ?auto_15596 ) ( CLEAR ?auto_15571 ) ( not ( = ?auto_15570 ?auto_15571 ) ) ( not ( = ?auto_15570 ?auto_15596 ) ) ( not ( = ?auto_15571 ?auto_15596 ) ) ( IS-CRATE ?auto_15570 ) ( not ( = ?auto_15580 ?auto_15575 ) ) ( HOIST-AT ?auto_15581 ?auto_15580 ) ( AVAILABLE ?auto_15581 ) ( SURFACE-AT ?auto_15570 ?auto_15580 ) ( ON ?auto_15570 ?auto_15592 ) ( CLEAR ?auto_15570 ) ( not ( = ?auto_15569 ?auto_15570 ) ) ( not ( = ?auto_15569 ?auto_15592 ) ) ( not ( = ?auto_15570 ?auto_15592 ) ) ( not ( = ?auto_15577 ?auto_15581 ) ) ( IS-CRATE ?auto_15569 ) ( not ( = ?auto_15582 ?auto_15575 ) ) ( HOIST-AT ?auto_15601 ?auto_15582 ) ( AVAILABLE ?auto_15601 ) ( SURFACE-AT ?auto_15569 ?auto_15582 ) ( ON ?auto_15569 ?auto_15585 ) ( CLEAR ?auto_15569 ) ( not ( = ?auto_15568 ?auto_15569 ) ) ( not ( = ?auto_15568 ?auto_15585 ) ) ( not ( = ?auto_15569 ?auto_15585 ) ) ( not ( = ?auto_15577 ?auto_15601 ) ) ( IS-CRATE ?auto_15568 ) ( not ( = ?auto_15586 ?auto_15575 ) ) ( HOIST-AT ?auto_15590 ?auto_15586 ) ( AVAILABLE ?auto_15590 ) ( SURFACE-AT ?auto_15568 ?auto_15586 ) ( ON ?auto_15568 ?auto_15593 ) ( CLEAR ?auto_15568 ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15593 ) ) ( not ( = ?auto_15568 ?auto_15593 ) ) ( not ( = ?auto_15577 ?auto_15590 ) ) ( IS-CRATE ?auto_15567 ) ( not ( = ?auto_15597 ?auto_15575 ) ) ( HOIST-AT ?auto_15600 ?auto_15597 ) ( AVAILABLE ?auto_15600 ) ( SURFACE-AT ?auto_15567 ?auto_15597 ) ( ON ?auto_15567 ?auto_15587 ) ( CLEAR ?auto_15567 ) ( not ( = ?auto_15566 ?auto_15567 ) ) ( not ( = ?auto_15566 ?auto_15587 ) ) ( not ( = ?auto_15567 ?auto_15587 ) ) ( not ( = ?auto_15577 ?auto_15600 ) ) ( IS-CRATE ?auto_15566 ) ( not ( = ?auto_15595 ?auto_15575 ) ) ( HOIST-AT ?auto_15589 ?auto_15595 ) ( AVAILABLE ?auto_15589 ) ( SURFACE-AT ?auto_15566 ?auto_15595 ) ( ON ?auto_15566 ?auto_15598 ) ( CLEAR ?auto_15566 ) ( not ( = ?auto_15565 ?auto_15566 ) ) ( not ( = ?auto_15565 ?auto_15598 ) ) ( not ( = ?auto_15566 ?auto_15598 ) ) ( not ( = ?auto_15577 ?auto_15589 ) ) ( SURFACE-AT ?auto_15564 ?auto_15575 ) ( CLEAR ?auto_15564 ) ( IS-CRATE ?auto_15565 ) ( AVAILABLE ?auto_15577 ) ( not ( = ?auto_15583 ?auto_15575 ) ) ( HOIST-AT ?auto_15599 ?auto_15583 ) ( AVAILABLE ?auto_15599 ) ( SURFACE-AT ?auto_15565 ?auto_15583 ) ( ON ?auto_15565 ?auto_15594 ) ( CLEAR ?auto_15565 ) ( TRUCK-AT ?auto_15576 ?auto_15575 ) ( not ( = ?auto_15564 ?auto_15565 ) ) ( not ( = ?auto_15564 ?auto_15594 ) ) ( not ( = ?auto_15565 ?auto_15594 ) ) ( not ( = ?auto_15577 ?auto_15599 ) ) ( not ( = ?auto_15564 ?auto_15566 ) ) ( not ( = ?auto_15564 ?auto_15598 ) ) ( not ( = ?auto_15566 ?auto_15594 ) ) ( not ( = ?auto_15595 ?auto_15583 ) ) ( not ( = ?auto_15589 ?auto_15599 ) ) ( not ( = ?auto_15598 ?auto_15594 ) ) ( not ( = ?auto_15564 ?auto_15567 ) ) ( not ( = ?auto_15564 ?auto_15587 ) ) ( not ( = ?auto_15565 ?auto_15567 ) ) ( not ( = ?auto_15565 ?auto_15587 ) ) ( not ( = ?auto_15567 ?auto_15598 ) ) ( not ( = ?auto_15567 ?auto_15594 ) ) ( not ( = ?auto_15597 ?auto_15595 ) ) ( not ( = ?auto_15597 ?auto_15583 ) ) ( not ( = ?auto_15600 ?auto_15589 ) ) ( not ( = ?auto_15600 ?auto_15599 ) ) ( not ( = ?auto_15587 ?auto_15598 ) ) ( not ( = ?auto_15587 ?auto_15594 ) ) ( not ( = ?auto_15564 ?auto_15568 ) ) ( not ( = ?auto_15564 ?auto_15593 ) ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15565 ?auto_15593 ) ) ( not ( = ?auto_15566 ?auto_15568 ) ) ( not ( = ?auto_15566 ?auto_15593 ) ) ( not ( = ?auto_15568 ?auto_15587 ) ) ( not ( = ?auto_15568 ?auto_15598 ) ) ( not ( = ?auto_15568 ?auto_15594 ) ) ( not ( = ?auto_15586 ?auto_15597 ) ) ( not ( = ?auto_15586 ?auto_15595 ) ) ( not ( = ?auto_15586 ?auto_15583 ) ) ( not ( = ?auto_15590 ?auto_15600 ) ) ( not ( = ?auto_15590 ?auto_15589 ) ) ( not ( = ?auto_15590 ?auto_15599 ) ) ( not ( = ?auto_15593 ?auto_15587 ) ) ( not ( = ?auto_15593 ?auto_15598 ) ) ( not ( = ?auto_15593 ?auto_15594 ) ) ( not ( = ?auto_15564 ?auto_15569 ) ) ( not ( = ?auto_15564 ?auto_15585 ) ) ( not ( = ?auto_15565 ?auto_15569 ) ) ( not ( = ?auto_15565 ?auto_15585 ) ) ( not ( = ?auto_15566 ?auto_15569 ) ) ( not ( = ?auto_15566 ?auto_15585 ) ) ( not ( = ?auto_15567 ?auto_15569 ) ) ( not ( = ?auto_15567 ?auto_15585 ) ) ( not ( = ?auto_15569 ?auto_15593 ) ) ( not ( = ?auto_15569 ?auto_15587 ) ) ( not ( = ?auto_15569 ?auto_15598 ) ) ( not ( = ?auto_15569 ?auto_15594 ) ) ( not ( = ?auto_15582 ?auto_15586 ) ) ( not ( = ?auto_15582 ?auto_15597 ) ) ( not ( = ?auto_15582 ?auto_15595 ) ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15601 ?auto_15590 ) ) ( not ( = ?auto_15601 ?auto_15600 ) ) ( not ( = ?auto_15601 ?auto_15589 ) ) ( not ( = ?auto_15601 ?auto_15599 ) ) ( not ( = ?auto_15585 ?auto_15593 ) ) ( not ( = ?auto_15585 ?auto_15587 ) ) ( not ( = ?auto_15585 ?auto_15598 ) ) ( not ( = ?auto_15585 ?auto_15594 ) ) ( not ( = ?auto_15564 ?auto_15570 ) ) ( not ( = ?auto_15564 ?auto_15592 ) ) ( not ( = ?auto_15565 ?auto_15570 ) ) ( not ( = ?auto_15565 ?auto_15592 ) ) ( not ( = ?auto_15566 ?auto_15570 ) ) ( not ( = ?auto_15566 ?auto_15592 ) ) ( not ( = ?auto_15567 ?auto_15570 ) ) ( not ( = ?auto_15567 ?auto_15592 ) ) ( not ( = ?auto_15568 ?auto_15570 ) ) ( not ( = ?auto_15568 ?auto_15592 ) ) ( not ( = ?auto_15570 ?auto_15585 ) ) ( not ( = ?auto_15570 ?auto_15593 ) ) ( not ( = ?auto_15570 ?auto_15587 ) ) ( not ( = ?auto_15570 ?auto_15598 ) ) ( not ( = ?auto_15570 ?auto_15594 ) ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15580 ?auto_15586 ) ) ( not ( = ?auto_15580 ?auto_15597 ) ) ( not ( = ?auto_15580 ?auto_15595 ) ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15581 ?auto_15601 ) ) ( not ( = ?auto_15581 ?auto_15590 ) ) ( not ( = ?auto_15581 ?auto_15600 ) ) ( not ( = ?auto_15581 ?auto_15589 ) ) ( not ( = ?auto_15581 ?auto_15599 ) ) ( not ( = ?auto_15592 ?auto_15585 ) ) ( not ( = ?auto_15592 ?auto_15593 ) ) ( not ( = ?auto_15592 ?auto_15587 ) ) ( not ( = ?auto_15592 ?auto_15598 ) ) ( not ( = ?auto_15592 ?auto_15594 ) ) ( not ( = ?auto_15564 ?auto_15571 ) ) ( not ( = ?auto_15564 ?auto_15596 ) ) ( not ( = ?auto_15565 ?auto_15571 ) ) ( not ( = ?auto_15565 ?auto_15596 ) ) ( not ( = ?auto_15566 ?auto_15571 ) ) ( not ( = ?auto_15566 ?auto_15596 ) ) ( not ( = ?auto_15567 ?auto_15571 ) ) ( not ( = ?auto_15567 ?auto_15596 ) ) ( not ( = ?auto_15568 ?auto_15571 ) ) ( not ( = ?auto_15568 ?auto_15596 ) ) ( not ( = ?auto_15569 ?auto_15571 ) ) ( not ( = ?auto_15569 ?auto_15596 ) ) ( not ( = ?auto_15571 ?auto_15592 ) ) ( not ( = ?auto_15571 ?auto_15585 ) ) ( not ( = ?auto_15571 ?auto_15593 ) ) ( not ( = ?auto_15571 ?auto_15587 ) ) ( not ( = ?auto_15571 ?auto_15598 ) ) ( not ( = ?auto_15571 ?auto_15594 ) ) ( not ( = ?auto_15588 ?auto_15580 ) ) ( not ( = ?auto_15588 ?auto_15582 ) ) ( not ( = ?auto_15588 ?auto_15586 ) ) ( not ( = ?auto_15588 ?auto_15597 ) ) ( not ( = ?auto_15588 ?auto_15595 ) ) ( not ( = ?auto_15588 ?auto_15583 ) ) ( not ( = ?auto_15591 ?auto_15581 ) ) ( not ( = ?auto_15591 ?auto_15601 ) ) ( not ( = ?auto_15591 ?auto_15590 ) ) ( not ( = ?auto_15591 ?auto_15600 ) ) ( not ( = ?auto_15591 ?auto_15589 ) ) ( not ( = ?auto_15591 ?auto_15599 ) ) ( not ( = ?auto_15596 ?auto_15592 ) ) ( not ( = ?auto_15596 ?auto_15585 ) ) ( not ( = ?auto_15596 ?auto_15593 ) ) ( not ( = ?auto_15596 ?auto_15587 ) ) ( not ( = ?auto_15596 ?auto_15598 ) ) ( not ( = ?auto_15596 ?auto_15594 ) ) ( not ( = ?auto_15564 ?auto_15572 ) ) ( not ( = ?auto_15564 ?auto_15584 ) ) ( not ( = ?auto_15565 ?auto_15572 ) ) ( not ( = ?auto_15565 ?auto_15584 ) ) ( not ( = ?auto_15566 ?auto_15572 ) ) ( not ( = ?auto_15566 ?auto_15584 ) ) ( not ( = ?auto_15567 ?auto_15572 ) ) ( not ( = ?auto_15567 ?auto_15584 ) ) ( not ( = ?auto_15568 ?auto_15572 ) ) ( not ( = ?auto_15568 ?auto_15584 ) ) ( not ( = ?auto_15569 ?auto_15572 ) ) ( not ( = ?auto_15569 ?auto_15584 ) ) ( not ( = ?auto_15570 ?auto_15572 ) ) ( not ( = ?auto_15570 ?auto_15584 ) ) ( not ( = ?auto_15572 ?auto_15596 ) ) ( not ( = ?auto_15572 ?auto_15592 ) ) ( not ( = ?auto_15572 ?auto_15585 ) ) ( not ( = ?auto_15572 ?auto_15593 ) ) ( not ( = ?auto_15572 ?auto_15587 ) ) ( not ( = ?auto_15572 ?auto_15598 ) ) ( not ( = ?auto_15572 ?auto_15594 ) ) ( not ( = ?auto_15584 ?auto_15596 ) ) ( not ( = ?auto_15584 ?auto_15592 ) ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15593 ) ) ( not ( = ?auto_15584 ?auto_15587 ) ) ( not ( = ?auto_15584 ?auto_15598 ) ) ( not ( = ?auto_15584 ?auto_15594 ) ) ( not ( = ?auto_15564 ?auto_15573 ) ) ( not ( = ?auto_15564 ?auto_15578 ) ) ( not ( = ?auto_15565 ?auto_15573 ) ) ( not ( = ?auto_15565 ?auto_15578 ) ) ( not ( = ?auto_15566 ?auto_15573 ) ) ( not ( = ?auto_15566 ?auto_15578 ) ) ( not ( = ?auto_15567 ?auto_15573 ) ) ( not ( = ?auto_15567 ?auto_15578 ) ) ( not ( = ?auto_15568 ?auto_15573 ) ) ( not ( = ?auto_15568 ?auto_15578 ) ) ( not ( = ?auto_15569 ?auto_15573 ) ) ( not ( = ?auto_15569 ?auto_15578 ) ) ( not ( = ?auto_15570 ?auto_15573 ) ) ( not ( = ?auto_15570 ?auto_15578 ) ) ( not ( = ?auto_15571 ?auto_15573 ) ) ( not ( = ?auto_15571 ?auto_15578 ) ) ( not ( = ?auto_15573 ?auto_15584 ) ) ( not ( = ?auto_15573 ?auto_15596 ) ) ( not ( = ?auto_15573 ?auto_15592 ) ) ( not ( = ?auto_15573 ?auto_15585 ) ) ( not ( = ?auto_15573 ?auto_15593 ) ) ( not ( = ?auto_15573 ?auto_15587 ) ) ( not ( = ?auto_15573 ?auto_15598 ) ) ( not ( = ?auto_15573 ?auto_15594 ) ) ( not ( = ?auto_15574 ?auto_15588 ) ) ( not ( = ?auto_15574 ?auto_15580 ) ) ( not ( = ?auto_15574 ?auto_15582 ) ) ( not ( = ?auto_15574 ?auto_15586 ) ) ( not ( = ?auto_15574 ?auto_15597 ) ) ( not ( = ?auto_15574 ?auto_15595 ) ) ( not ( = ?auto_15574 ?auto_15583 ) ) ( not ( = ?auto_15579 ?auto_15591 ) ) ( not ( = ?auto_15579 ?auto_15581 ) ) ( not ( = ?auto_15579 ?auto_15601 ) ) ( not ( = ?auto_15579 ?auto_15590 ) ) ( not ( = ?auto_15579 ?auto_15600 ) ) ( not ( = ?auto_15579 ?auto_15589 ) ) ( not ( = ?auto_15579 ?auto_15599 ) ) ( not ( = ?auto_15578 ?auto_15584 ) ) ( not ( = ?auto_15578 ?auto_15596 ) ) ( not ( = ?auto_15578 ?auto_15592 ) ) ( not ( = ?auto_15578 ?auto_15585 ) ) ( not ( = ?auto_15578 ?auto_15593 ) ) ( not ( = ?auto_15578 ?auto_15587 ) ) ( not ( = ?auto_15578 ?auto_15598 ) ) ( not ( = ?auto_15578 ?auto_15594 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_15564 ?auto_15565 ?auto_15566 ?auto_15567 ?auto_15568 ?auto_15569 ?auto_15570 ?auto_15571 ?auto_15572 )
      ( MAKE-1CRATE ?auto_15572 ?auto_15573 )
      ( MAKE-9CRATE-VERIFY ?auto_15564 ?auto_15565 ?auto_15566 ?auto_15567 ?auto_15568 ?auto_15569 ?auto_15570 ?auto_15571 ?auto_15572 ?auto_15573 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_15623 - SURFACE
      ?auto_15624 - SURFACE
      ?auto_15625 - SURFACE
      ?auto_15626 - SURFACE
      ?auto_15627 - SURFACE
      ?auto_15628 - SURFACE
      ?auto_15629 - SURFACE
      ?auto_15630 - SURFACE
      ?auto_15631 - SURFACE
      ?auto_15632 - SURFACE
      ?auto_15633 - SURFACE
    )
    :vars
    (
      ?auto_15636 - HOIST
      ?auto_15634 - PLACE
      ?auto_15639 - PLACE
      ?auto_15635 - HOIST
      ?auto_15637 - SURFACE
      ?auto_15664 - PLACE
      ?auto_15659 - HOIST
      ?auto_15658 - SURFACE
      ?auto_15662 - PLACE
      ?auto_15657 - HOIST
      ?auto_15654 - SURFACE
      ?auto_15656 - SURFACE
      ?auto_15660 - PLACE
      ?auto_15650 - HOIST
      ?auto_15655 - SURFACE
      ?auto_15646 - PLACE
      ?auto_15663 - HOIST
      ?auto_15653 - SURFACE
      ?auto_15652 - PLACE
      ?auto_15645 - HOIST
      ?auto_15644 - SURFACE
      ?auto_15661 - PLACE
      ?auto_15641 - HOIST
      ?auto_15651 - SURFACE
      ?auto_15649 - PLACE
      ?auto_15643 - HOIST
      ?auto_15642 - SURFACE
      ?auto_15640 - PLACE
      ?auto_15648 - HOIST
      ?auto_15647 - SURFACE
      ?auto_15638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15636 ?auto_15634 ) ( IS-CRATE ?auto_15633 ) ( not ( = ?auto_15639 ?auto_15634 ) ) ( HOIST-AT ?auto_15635 ?auto_15639 ) ( AVAILABLE ?auto_15635 ) ( SURFACE-AT ?auto_15633 ?auto_15639 ) ( ON ?auto_15633 ?auto_15637 ) ( CLEAR ?auto_15633 ) ( not ( = ?auto_15632 ?auto_15633 ) ) ( not ( = ?auto_15632 ?auto_15637 ) ) ( not ( = ?auto_15633 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15635 ) ) ( IS-CRATE ?auto_15632 ) ( not ( = ?auto_15664 ?auto_15634 ) ) ( HOIST-AT ?auto_15659 ?auto_15664 ) ( AVAILABLE ?auto_15659 ) ( SURFACE-AT ?auto_15632 ?auto_15664 ) ( ON ?auto_15632 ?auto_15658 ) ( CLEAR ?auto_15632 ) ( not ( = ?auto_15631 ?auto_15632 ) ) ( not ( = ?auto_15631 ?auto_15658 ) ) ( not ( = ?auto_15632 ?auto_15658 ) ) ( not ( = ?auto_15636 ?auto_15659 ) ) ( IS-CRATE ?auto_15631 ) ( not ( = ?auto_15662 ?auto_15634 ) ) ( HOIST-AT ?auto_15657 ?auto_15662 ) ( SURFACE-AT ?auto_15631 ?auto_15662 ) ( ON ?auto_15631 ?auto_15654 ) ( CLEAR ?auto_15631 ) ( not ( = ?auto_15630 ?auto_15631 ) ) ( not ( = ?auto_15630 ?auto_15654 ) ) ( not ( = ?auto_15631 ?auto_15654 ) ) ( not ( = ?auto_15636 ?auto_15657 ) ) ( IS-CRATE ?auto_15630 ) ( AVAILABLE ?auto_15657 ) ( SURFACE-AT ?auto_15630 ?auto_15662 ) ( ON ?auto_15630 ?auto_15656 ) ( CLEAR ?auto_15630 ) ( not ( = ?auto_15629 ?auto_15630 ) ) ( not ( = ?auto_15629 ?auto_15656 ) ) ( not ( = ?auto_15630 ?auto_15656 ) ) ( IS-CRATE ?auto_15629 ) ( not ( = ?auto_15660 ?auto_15634 ) ) ( HOIST-AT ?auto_15650 ?auto_15660 ) ( AVAILABLE ?auto_15650 ) ( SURFACE-AT ?auto_15629 ?auto_15660 ) ( ON ?auto_15629 ?auto_15655 ) ( CLEAR ?auto_15629 ) ( not ( = ?auto_15628 ?auto_15629 ) ) ( not ( = ?auto_15628 ?auto_15655 ) ) ( not ( = ?auto_15629 ?auto_15655 ) ) ( not ( = ?auto_15636 ?auto_15650 ) ) ( IS-CRATE ?auto_15628 ) ( not ( = ?auto_15646 ?auto_15634 ) ) ( HOIST-AT ?auto_15663 ?auto_15646 ) ( AVAILABLE ?auto_15663 ) ( SURFACE-AT ?auto_15628 ?auto_15646 ) ( ON ?auto_15628 ?auto_15653 ) ( CLEAR ?auto_15628 ) ( not ( = ?auto_15627 ?auto_15628 ) ) ( not ( = ?auto_15627 ?auto_15653 ) ) ( not ( = ?auto_15628 ?auto_15653 ) ) ( not ( = ?auto_15636 ?auto_15663 ) ) ( IS-CRATE ?auto_15627 ) ( not ( = ?auto_15652 ?auto_15634 ) ) ( HOIST-AT ?auto_15645 ?auto_15652 ) ( AVAILABLE ?auto_15645 ) ( SURFACE-AT ?auto_15627 ?auto_15652 ) ( ON ?auto_15627 ?auto_15644 ) ( CLEAR ?auto_15627 ) ( not ( = ?auto_15626 ?auto_15627 ) ) ( not ( = ?auto_15626 ?auto_15644 ) ) ( not ( = ?auto_15627 ?auto_15644 ) ) ( not ( = ?auto_15636 ?auto_15645 ) ) ( IS-CRATE ?auto_15626 ) ( not ( = ?auto_15661 ?auto_15634 ) ) ( HOIST-AT ?auto_15641 ?auto_15661 ) ( AVAILABLE ?auto_15641 ) ( SURFACE-AT ?auto_15626 ?auto_15661 ) ( ON ?auto_15626 ?auto_15651 ) ( CLEAR ?auto_15626 ) ( not ( = ?auto_15625 ?auto_15626 ) ) ( not ( = ?auto_15625 ?auto_15651 ) ) ( not ( = ?auto_15626 ?auto_15651 ) ) ( not ( = ?auto_15636 ?auto_15641 ) ) ( IS-CRATE ?auto_15625 ) ( not ( = ?auto_15649 ?auto_15634 ) ) ( HOIST-AT ?auto_15643 ?auto_15649 ) ( AVAILABLE ?auto_15643 ) ( SURFACE-AT ?auto_15625 ?auto_15649 ) ( ON ?auto_15625 ?auto_15642 ) ( CLEAR ?auto_15625 ) ( not ( = ?auto_15624 ?auto_15625 ) ) ( not ( = ?auto_15624 ?auto_15642 ) ) ( not ( = ?auto_15625 ?auto_15642 ) ) ( not ( = ?auto_15636 ?auto_15643 ) ) ( SURFACE-AT ?auto_15623 ?auto_15634 ) ( CLEAR ?auto_15623 ) ( IS-CRATE ?auto_15624 ) ( AVAILABLE ?auto_15636 ) ( not ( = ?auto_15640 ?auto_15634 ) ) ( HOIST-AT ?auto_15648 ?auto_15640 ) ( AVAILABLE ?auto_15648 ) ( SURFACE-AT ?auto_15624 ?auto_15640 ) ( ON ?auto_15624 ?auto_15647 ) ( CLEAR ?auto_15624 ) ( TRUCK-AT ?auto_15638 ?auto_15634 ) ( not ( = ?auto_15623 ?auto_15624 ) ) ( not ( = ?auto_15623 ?auto_15647 ) ) ( not ( = ?auto_15624 ?auto_15647 ) ) ( not ( = ?auto_15636 ?auto_15648 ) ) ( not ( = ?auto_15623 ?auto_15625 ) ) ( not ( = ?auto_15623 ?auto_15642 ) ) ( not ( = ?auto_15625 ?auto_15647 ) ) ( not ( = ?auto_15649 ?auto_15640 ) ) ( not ( = ?auto_15643 ?auto_15648 ) ) ( not ( = ?auto_15642 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15626 ) ) ( not ( = ?auto_15623 ?auto_15651 ) ) ( not ( = ?auto_15624 ?auto_15626 ) ) ( not ( = ?auto_15624 ?auto_15651 ) ) ( not ( = ?auto_15626 ?auto_15642 ) ) ( not ( = ?auto_15626 ?auto_15647 ) ) ( not ( = ?auto_15661 ?auto_15649 ) ) ( not ( = ?auto_15661 ?auto_15640 ) ) ( not ( = ?auto_15641 ?auto_15643 ) ) ( not ( = ?auto_15641 ?auto_15648 ) ) ( not ( = ?auto_15651 ?auto_15642 ) ) ( not ( = ?auto_15651 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15627 ) ) ( not ( = ?auto_15623 ?auto_15644 ) ) ( not ( = ?auto_15624 ?auto_15627 ) ) ( not ( = ?auto_15624 ?auto_15644 ) ) ( not ( = ?auto_15625 ?auto_15627 ) ) ( not ( = ?auto_15625 ?auto_15644 ) ) ( not ( = ?auto_15627 ?auto_15651 ) ) ( not ( = ?auto_15627 ?auto_15642 ) ) ( not ( = ?auto_15627 ?auto_15647 ) ) ( not ( = ?auto_15652 ?auto_15661 ) ) ( not ( = ?auto_15652 ?auto_15649 ) ) ( not ( = ?auto_15652 ?auto_15640 ) ) ( not ( = ?auto_15645 ?auto_15641 ) ) ( not ( = ?auto_15645 ?auto_15643 ) ) ( not ( = ?auto_15645 ?auto_15648 ) ) ( not ( = ?auto_15644 ?auto_15651 ) ) ( not ( = ?auto_15644 ?auto_15642 ) ) ( not ( = ?auto_15644 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15628 ) ) ( not ( = ?auto_15623 ?auto_15653 ) ) ( not ( = ?auto_15624 ?auto_15628 ) ) ( not ( = ?auto_15624 ?auto_15653 ) ) ( not ( = ?auto_15625 ?auto_15628 ) ) ( not ( = ?auto_15625 ?auto_15653 ) ) ( not ( = ?auto_15626 ?auto_15628 ) ) ( not ( = ?auto_15626 ?auto_15653 ) ) ( not ( = ?auto_15628 ?auto_15644 ) ) ( not ( = ?auto_15628 ?auto_15651 ) ) ( not ( = ?auto_15628 ?auto_15642 ) ) ( not ( = ?auto_15628 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15652 ) ) ( not ( = ?auto_15646 ?auto_15661 ) ) ( not ( = ?auto_15646 ?auto_15649 ) ) ( not ( = ?auto_15646 ?auto_15640 ) ) ( not ( = ?auto_15663 ?auto_15645 ) ) ( not ( = ?auto_15663 ?auto_15641 ) ) ( not ( = ?auto_15663 ?auto_15643 ) ) ( not ( = ?auto_15663 ?auto_15648 ) ) ( not ( = ?auto_15653 ?auto_15644 ) ) ( not ( = ?auto_15653 ?auto_15651 ) ) ( not ( = ?auto_15653 ?auto_15642 ) ) ( not ( = ?auto_15653 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15629 ) ) ( not ( = ?auto_15623 ?auto_15655 ) ) ( not ( = ?auto_15624 ?auto_15629 ) ) ( not ( = ?auto_15624 ?auto_15655 ) ) ( not ( = ?auto_15625 ?auto_15629 ) ) ( not ( = ?auto_15625 ?auto_15655 ) ) ( not ( = ?auto_15626 ?auto_15629 ) ) ( not ( = ?auto_15626 ?auto_15655 ) ) ( not ( = ?auto_15627 ?auto_15629 ) ) ( not ( = ?auto_15627 ?auto_15655 ) ) ( not ( = ?auto_15629 ?auto_15653 ) ) ( not ( = ?auto_15629 ?auto_15644 ) ) ( not ( = ?auto_15629 ?auto_15651 ) ) ( not ( = ?auto_15629 ?auto_15642 ) ) ( not ( = ?auto_15629 ?auto_15647 ) ) ( not ( = ?auto_15660 ?auto_15646 ) ) ( not ( = ?auto_15660 ?auto_15652 ) ) ( not ( = ?auto_15660 ?auto_15661 ) ) ( not ( = ?auto_15660 ?auto_15649 ) ) ( not ( = ?auto_15660 ?auto_15640 ) ) ( not ( = ?auto_15650 ?auto_15663 ) ) ( not ( = ?auto_15650 ?auto_15645 ) ) ( not ( = ?auto_15650 ?auto_15641 ) ) ( not ( = ?auto_15650 ?auto_15643 ) ) ( not ( = ?auto_15650 ?auto_15648 ) ) ( not ( = ?auto_15655 ?auto_15653 ) ) ( not ( = ?auto_15655 ?auto_15644 ) ) ( not ( = ?auto_15655 ?auto_15651 ) ) ( not ( = ?auto_15655 ?auto_15642 ) ) ( not ( = ?auto_15655 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15630 ) ) ( not ( = ?auto_15623 ?auto_15656 ) ) ( not ( = ?auto_15624 ?auto_15630 ) ) ( not ( = ?auto_15624 ?auto_15656 ) ) ( not ( = ?auto_15625 ?auto_15630 ) ) ( not ( = ?auto_15625 ?auto_15656 ) ) ( not ( = ?auto_15626 ?auto_15630 ) ) ( not ( = ?auto_15626 ?auto_15656 ) ) ( not ( = ?auto_15627 ?auto_15630 ) ) ( not ( = ?auto_15627 ?auto_15656 ) ) ( not ( = ?auto_15628 ?auto_15630 ) ) ( not ( = ?auto_15628 ?auto_15656 ) ) ( not ( = ?auto_15630 ?auto_15655 ) ) ( not ( = ?auto_15630 ?auto_15653 ) ) ( not ( = ?auto_15630 ?auto_15644 ) ) ( not ( = ?auto_15630 ?auto_15651 ) ) ( not ( = ?auto_15630 ?auto_15642 ) ) ( not ( = ?auto_15630 ?auto_15647 ) ) ( not ( = ?auto_15662 ?auto_15660 ) ) ( not ( = ?auto_15662 ?auto_15646 ) ) ( not ( = ?auto_15662 ?auto_15652 ) ) ( not ( = ?auto_15662 ?auto_15661 ) ) ( not ( = ?auto_15662 ?auto_15649 ) ) ( not ( = ?auto_15662 ?auto_15640 ) ) ( not ( = ?auto_15657 ?auto_15650 ) ) ( not ( = ?auto_15657 ?auto_15663 ) ) ( not ( = ?auto_15657 ?auto_15645 ) ) ( not ( = ?auto_15657 ?auto_15641 ) ) ( not ( = ?auto_15657 ?auto_15643 ) ) ( not ( = ?auto_15657 ?auto_15648 ) ) ( not ( = ?auto_15656 ?auto_15655 ) ) ( not ( = ?auto_15656 ?auto_15653 ) ) ( not ( = ?auto_15656 ?auto_15644 ) ) ( not ( = ?auto_15656 ?auto_15651 ) ) ( not ( = ?auto_15656 ?auto_15642 ) ) ( not ( = ?auto_15656 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15631 ) ) ( not ( = ?auto_15623 ?auto_15654 ) ) ( not ( = ?auto_15624 ?auto_15631 ) ) ( not ( = ?auto_15624 ?auto_15654 ) ) ( not ( = ?auto_15625 ?auto_15631 ) ) ( not ( = ?auto_15625 ?auto_15654 ) ) ( not ( = ?auto_15626 ?auto_15631 ) ) ( not ( = ?auto_15626 ?auto_15654 ) ) ( not ( = ?auto_15627 ?auto_15631 ) ) ( not ( = ?auto_15627 ?auto_15654 ) ) ( not ( = ?auto_15628 ?auto_15631 ) ) ( not ( = ?auto_15628 ?auto_15654 ) ) ( not ( = ?auto_15629 ?auto_15631 ) ) ( not ( = ?auto_15629 ?auto_15654 ) ) ( not ( = ?auto_15631 ?auto_15656 ) ) ( not ( = ?auto_15631 ?auto_15655 ) ) ( not ( = ?auto_15631 ?auto_15653 ) ) ( not ( = ?auto_15631 ?auto_15644 ) ) ( not ( = ?auto_15631 ?auto_15651 ) ) ( not ( = ?auto_15631 ?auto_15642 ) ) ( not ( = ?auto_15631 ?auto_15647 ) ) ( not ( = ?auto_15654 ?auto_15656 ) ) ( not ( = ?auto_15654 ?auto_15655 ) ) ( not ( = ?auto_15654 ?auto_15653 ) ) ( not ( = ?auto_15654 ?auto_15644 ) ) ( not ( = ?auto_15654 ?auto_15651 ) ) ( not ( = ?auto_15654 ?auto_15642 ) ) ( not ( = ?auto_15654 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15632 ) ) ( not ( = ?auto_15623 ?auto_15658 ) ) ( not ( = ?auto_15624 ?auto_15632 ) ) ( not ( = ?auto_15624 ?auto_15658 ) ) ( not ( = ?auto_15625 ?auto_15632 ) ) ( not ( = ?auto_15625 ?auto_15658 ) ) ( not ( = ?auto_15626 ?auto_15632 ) ) ( not ( = ?auto_15626 ?auto_15658 ) ) ( not ( = ?auto_15627 ?auto_15632 ) ) ( not ( = ?auto_15627 ?auto_15658 ) ) ( not ( = ?auto_15628 ?auto_15632 ) ) ( not ( = ?auto_15628 ?auto_15658 ) ) ( not ( = ?auto_15629 ?auto_15632 ) ) ( not ( = ?auto_15629 ?auto_15658 ) ) ( not ( = ?auto_15630 ?auto_15632 ) ) ( not ( = ?auto_15630 ?auto_15658 ) ) ( not ( = ?auto_15632 ?auto_15654 ) ) ( not ( = ?auto_15632 ?auto_15656 ) ) ( not ( = ?auto_15632 ?auto_15655 ) ) ( not ( = ?auto_15632 ?auto_15653 ) ) ( not ( = ?auto_15632 ?auto_15644 ) ) ( not ( = ?auto_15632 ?auto_15651 ) ) ( not ( = ?auto_15632 ?auto_15642 ) ) ( not ( = ?auto_15632 ?auto_15647 ) ) ( not ( = ?auto_15664 ?auto_15662 ) ) ( not ( = ?auto_15664 ?auto_15660 ) ) ( not ( = ?auto_15664 ?auto_15646 ) ) ( not ( = ?auto_15664 ?auto_15652 ) ) ( not ( = ?auto_15664 ?auto_15661 ) ) ( not ( = ?auto_15664 ?auto_15649 ) ) ( not ( = ?auto_15664 ?auto_15640 ) ) ( not ( = ?auto_15659 ?auto_15657 ) ) ( not ( = ?auto_15659 ?auto_15650 ) ) ( not ( = ?auto_15659 ?auto_15663 ) ) ( not ( = ?auto_15659 ?auto_15645 ) ) ( not ( = ?auto_15659 ?auto_15641 ) ) ( not ( = ?auto_15659 ?auto_15643 ) ) ( not ( = ?auto_15659 ?auto_15648 ) ) ( not ( = ?auto_15658 ?auto_15654 ) ) ( not ( = ?auto_15658 ?auto_15656 ) ) ( not ( = ?auto_15658 ?auto_15655 ) ) ( not ( = ?auto_15658 ?auto_15653 ) ) ( not ( = ?auto_15658 ?auto_15644 ) ) ( not ( = ?auto_15658 ?auto_15651 ) ) ( not ( = ?auto_15658 ?auto_15642 ) ) ( not ( = ?auto_15658 ?auto_15647 ) ) ( not ( = ?auto_15623 ?auto_15633 ) ) ( not ( = ?auto_15623 ?auto_15637 ) ) ( not ( = ?auto_15624 ?auto_15633 ) ) ( not ( = ?auto_15624 ?auto_15637 ) ) ( not ( = ?auto_15625 ?auto_15633 ) ) ( not ( = ?auto_15625 ?auto_15637 ) ) ( not ( = ?auto_15626 ?auto_15633 ) ) ( not ( = ?auto_15626 ?auto_15637 ) ) ( not ( = ?auto_15627 ?auto_15633 ) ) ( not ( = ?auto_15627 ?auto_15637 ) ) ( not ( = ?auto_15628 ?auto_15633 ) ) ( not ( = ?auto_15628 ?auto_15637 ) ) ( not ( = ?auto_15629 ?auto_15633 ) ) ( not ( = ?auto_15629 ?auto_15637 ) ) ( not ( = ?auto_15630 ?auto_15633 ) ) ( not ( = ?auto_15630 ?auto_15637 ) ) ( not ( = ?auto_15631 ?auto_15633 ) ) ( not ( = ?auto_15631 ?auto_15637 ) ) ( not ( = ?auto_15633 ?auto_15658 ) ) ( not ( = ?auto_15633 ?auto_15654 ) ) ( not ( = ?auto_15633 ?auto_15656 ) ) ( not ( = ?auto_15633 ?auto_15655 ) ) ( not ( = ?auto_15633 ?auto_15653 ) ) ( not ( = ?auto_15633 ?auto_15644 ) ) ( not ( = ?auto_15633 ?auto_15651 ) ) ( not ( = ?auto_15633 ?auto_15642 ) ) ( not ( = ?auto_15633 ?auto_15647 ) ) ( not ( = ?auto_15639 ?auto_15664 ) ) ( not ( = ?auto_15639 ?auto_15662 ) ) ( not ( = ?auto_15639 ?auto_15660 ) ) ( not ( = ?auto_15639 ?auto_15646 ) ) ( not ( = ?auto_15639 ?auto_15652 ) ) ( not ( = ?auto_15639 ?auto_15661 ) ) ( not ( = ?auto_15639 ?auto_15649 ) ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15635 ?auto_15659 ) ) ( not ( = ?auto_15635 ?auto_15657 ) ) ( not ( = ?auto_15635 ?auto_15650 ) ) ( not ( = ?auto_15635 ?auto_15663 ) ) ( not ( = ?auto_15635 ?auto_15645 ) ) ( not ( = ?auto_15635 ?auto_15641 ) ) ( not ( = ?auto_15635 ?auto_15643 ) ) ( not ( = ?auto_15635 ?auto_15648 ) ) ( not ( = ?auto_15637 ?auto_15658 ) ) ( not ( = ?auto_15637 ?auto_15654 ) ) ( not ( = ?auto_15637 ?auto_15656 ) ) ( not ( = ?auto_15637 ?auto_15655 ) ) ( not ( = ?auto_15637 ?auto_15653 ) ) ( not ( = ?auto_15637 ?auto_15644 ) ) ( not ( = ?auto_15637 ?auto_15651 ) ) ( not ( = ?auto_15637 ?auto_15642 ) ) ( not ( = ?auto_15637 ?auto_15647 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15623 ?auto_15624 ?auto_15625 ?auto_15626 ?auto_15627 ?auto_15628 ?auto_15629 ?auto_15630 ?auto_15631 ?auto_15632 )
      ( MAKE-1CRATE ?auto_15632 ?auto_15633 )
      ( MAKE-10CRATE-VERIFY ?auto_15623 ?auto_15624 ?auto_15625 ?auto_15626 ?auto_15627 ?auto_15628 ?auto_15629 ?auto_15630 ?auto_15631 ?auto_15632 ?auto_15633 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15687 - SURFACE
      ?auto_15688 - SURFACE
      ?auto_15689 - SURFACE
      ?auto_15690 - SURFACE
      ?auto_15691 - SURFACE
      ?auto_15692 - SURFACE
      ?auto_15693 - SURFACE
      ?auto_15694 - SURFACE
      ?auto_15695 - SURFACE
      ?auto_15696 - SURFACE
      ?auto_15697 - SURFACE
      ?auto_15698 - SURFACE
    )
    :vars
    (
      ?auto_15701 - HOIST
      ?auto_15700 - PLACE
      ?auto_15702 - PLACE
      ?auto_15699 - HOIST
      ?auto_15703 - SURFACE
      ?auto_15732 - PLACE
      ?auto_15727 - HOIST
      ?auto_15725 - SURFACE
      ?auto_15712 - PLACE
      ?auto_15717 - HOIST
      ?auto_15731 - SURFACE
      ?auto_15708 - PLACE
      ?auto_15718 - HOIST
      ?auto_15711 - SURFACE
      ?auto_15729 - SURFACE
      ?auto_15715 - PLACE
      ?auto_15713 - HOIST
      ?auto_15720 - SURFACE
      ?auto_15726 - PLACE
      ?auto_15706 - HOIST
      ?auto_15705 - SURFACE
      ?auto_15714 - PLACE
      ?auto_15722 - HOIST
      ?auto_15719 - SURFACE
      ?auto_15723 - PLACE
      ?auto_15721 - HOIST
      ?auto_15730 - SURFACE
      ?auto_15707 - PLACE
      ?auto_15709 - HOIST
      ?auto_15728 - SURFACE
      ?auto_15710 - PLACE
      ?auto_15724 - HOIST
      ?auto_15716 - SURFACE
      ?auto_15704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15701 ?auto_15700 ) ( IS-CRATE ?auto_15698 ) ( not ( = ?auto_15702 ?auto_15700 ) ) ( HOIST-AT ?auto_15699 ?auto_15702 ) ( AVAILABLE ?auto_15699 ) ( SURFACE-AT ?auto_15698 ?auto_15702 ) ( ON ?auto_15698 ?auto_15703 ) ( CLEAR ?auto_15698 ) ( not ( = ?auto_15697 ?auto_15698 ) ) ( not ( = ?auto_15697 ?auto_15703 ) ) ( not ( = ?auto_15698 ?auto_15703 ) ) ( not ( = ?auto_15701 ?auto_15699 ) ) ( IS-CRATE ?auto_15697 ) ( not ( = ?auto_15732 ?auto_15700 ) ) ( HOIST-AT ?auto_15727 ?auto_15732 ) ( AVAILABLE ?auto_15727 ) ( SURFACE-AT ?auto_15697 ?auto_15732 ) ( ON ?auto_15697 ?auto_15725 ) ( CLEAR ?auto_15697 ) ( not ( = ?auto_15696 ?auto_15697 ) ) ( not ( = ?auto_15696 ?auto_15725 ) ) ( not ( = ?auto_15697 ?auto_15725 ) ) ( not ( = ?auto_15701 ?auto_15727 ) ) ( IS-CRATE ?auto_15696 ) ( not ( = ?auto_15712 ?auto_15700 ) ) ( HOIST-AT ?auto_15717 ?auto_15712 ) ( AVAILABLE ?auto_15717 ) ( SURFACE-AT ?auto_15696 ?auto_15712 ) ( ON ?auto_15696 ?auto_15731 ) ( CLEAR ?auto_15696 ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15731 ) ) ( not ( = ?auto_15696 ?auto_15731 ) ) ( not ( = ?auto_15701 ?auto_15717 ) ) ( IS-CRATE ?auto_15695 ) ( not ( = ?auto_15708 ?auto_15700 ) ) ( HOIST-AT ?auto_15718 ?auto_15708 ) ( SURFACE-AT ?auto_15695 ?auto_15708 ) ( ON ?auto_15695 ?auto_15711 ) ( CLEAR ?auto_15695 ) ( not ( = ?auto_15694 ?auto_15695 ) ) ( not ( = ?auto_15694 ?auto_15711 ) ) ( not ( = ?auto_15695 ?auto_15711 ) ) ( not ( = ?auto_15701 ?auto_15718 ) ) ( IS-CRATE ?auto_15694 ) ( AVAILABLE ?auto_15718 ) ( SURFACE-AT ?auto_15694 ?auto_15708 ) ( ON ?auto_15694 ?auto_15729 ) ( CLEAR ?auto_15694 ) ( not ( = ?auto_15693 ?auto_15694 ) ) ( not ( = ?auto_15693 ?auto_15729 ) ) ( not ( = ?auto_15694 ?auto_15729 ) ) ( IS-CRATE ?auto_15693 ) ( not ( = ?auto_15715 ?auto_15700 ) ) ( HOIST-AT ?auto_15713 ?auto_15715 ) ( AVAILABLE ?auto_15713 ) ( SURFACE-AT ?auto_15693 ?auto_15715 ) ( ON ?auto_15693 ?auto_15720 ) ( CLEAR ?auto_15693 ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( not ( = ?auto_15692 ?auto_15720 ) ) ( not ( = ?auto_15693 ?auto_15720 ) ) ( not ( = ?auto_15701 ?auto_15713 ) ) ( IS-CRATE ?auto_15692 ) ( not ( = ?auto_15726 ?auto_15700 ) ) ( HOIST-AT ?auto_15706 ?auto_15726 ) ( AVAILABLE ?auto_15706 ) ( SURFACE-AT ?auto_15692 ?auto_15726 ) ( ON ?auto_15692 ?auto_15705 ) ( CLEAR ?auto_15692 ) ( not ( = ?auto_15691 ?auto_15692 ) ) ( not ( = ?auto_15691 ?auto_15705 ) ) ( not ( = ?auto_15692 ?auto_15705 ) ) ( not ( = ?auto_15701 ?auto_15706 ) ) ( IS-CRATE ?auto_15691 ) ( not ( = ?auto_15714 ?auto_15700 ) ) ( HOIST-AT ?auto_15722 ?auto_15714 ) ( AVAILABLE ?auto_15722 ) ( SURFACE-AT ?auto_15691 ?auto_15714 ) ( ON ?auto_15691 ?auto_15719 ) ( CLEAR ?auto_15691 ) ( not ( = ?auto_15690 ?auto_15691 ) ) ( not ( = ?auto_15690 ?auto_15719 ) ) ( not ( = ?auto_15691 ?auto_15719 ) ) ( not ( = ?auto_15701 ?auto_15722 ) ) ( IS-CRATE ?auto_15690 ) ( not ( = ?auto_15723 ?auto_15700 ) ) ( HOIST-AT ?auto_15721 ?auto_15723 ) ( AVAILABLE ?auto_15721 ) ( SURFACE-AT ?auto_15690 ?auto_15723 ) ( ON ?auto_15690 ?auto_15730 ) ( CLEAR ?auto_15690 ) ( not ( = ?auto_15689 ?auto_15690 ) ) ( not ( = ?auto_15689 ?auto_15730 ) ) ( not ( = ?auto_15690 ?auto_15730 ) ) ( not ( = ?auto_15701 ?auto_15721 ) ) ( IS-CRATE ?auto_15689 ) ( not ( = ?auto_15707 ?auto_15700 ) ) ( HOIST-AT ?auto_15709 ?auto_15707 ) ( AVAILABLE ?auto_15709 ) ( SURFACE-AT ?auto_15689 ?auto_15707 ) ( ON ?auto_15689 ?auto_15728 ) ( CLEAR ?auto_15689 ) ( not ( = ?auto_15688 ?auto_15689 ) ) ( not ( = ?auto_15688 ?auto_15728 ) ) ( not ( = ?auto_15689 ?auto_15728 ) ) ( not ( = ?auto_15701 ?auto_15709 ) ) ( SURFACE-AT ?auto_15687 ?auto_15700 ) ( CLEAR ?auto_15687 ) ( IS-CRATE ?auto_15688 ) ( AVAILABLE ?auto_15701 ) ( not ( = ?auto_15710 ?auto_15700 ) ) ( HOIST-AT ?auto_15724 ?auto_15710 ) ( AVAILABLE ?auto_15724 ) ( SURFACE-AT ?auto_15688 ?auto_15710 ) ( ON ?auto_15688 ?auto_15716 ) ( CLEAR ?auto_15688 ) ( TRUCK-AT ?auto_15704 ?auto_15700 ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15716 ) ) ( not ( = ?auto_15688 ?auto_15716 ) ) ( not ( = ?auto_15701 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15689 ) ) ( not ( = ?auto_15687 ?auto_15728 ) ) ( not ( = ?auto_15689 ?auto_15716 ) ) ( not ( = ?auto_15707 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15724 ) ) ( not ( = ?auto_15728 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15690 ) ) ( not ( = ?auto_15687 ?auto_15730 ) ) ( not ( = ?auto_15688 ?auto_15690 ) ) ( not ( = ?auto_15688 ?auto_15730 ) ) ( not ( = ?auto_15690 ?auto_15728 ) ) ( not ( = ?auto_15690 ?auto_15716 ) ) ( not ( = ?auto_15723 ?auto_15707 ) ) ( not ( = ?auto_15723 ?auto_15710 ) ) ( not ( = ?auto_15721 ?auto_15709 ) ) ( not ( = ?auto_15721 ?auto_15724 ) ) ( not ( = ?auto_15730 ?auto_15728 ) ) ( not ( = ?auto_15730 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15691 ) ) ( not ( = ?auto_15687 ?auto_15719 ) ) ( not ( = ?auto_15688 ?auto_15691 ) ) ( not ( = ?auto_15688 ?auto_15719 ) ) ( not ( = ?auto_15689 ?auto_15691 ) ) ( not ( = ?auto_15689 ?auto_15719 ) ) ( not ( = ?auto_15691 ?auto_15730 ) ) ( not ( = ?auto_15691 ?auto_15728 ) ) ( not ( = ?auto_15691 ?auto_15716 ) ) ( not ( = ?auto_15714 ?auto_15723 ) ) ( not ( = ?auto_15714 ?auto_15707 ) ) ( not ( = ?auto_15714 ?auto_15710 ) ) ( not ( = ?auto_15722 ?auto_15721 ) ) ( not ( = ?auto_15722 ?auto_15709 ) ) ( not ( = ?auto_15722 ?auto_15724 ) ) ( not ( = ?auto_15719 ?auto_15730 ) ) ( not ( = ?auto_15719 ?auto_15728 ) ) ( not ( = ?auto_15719 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15692 ) ) ( not ( = ?auto_15687 ?auto_15705 ) ) ( not ( = ?auto_15688 ?auto_15692 ) ) ( not ( = ?auto_15688 ?auto_15705 ) ) ( not ( = ?auto_15689 ?auto_15692 ) ) ( not ( = ?auto_15689 ?auto_15705 ) ) ( not ( = ?auto_15690 ?auto_15692 ) ) ( not ( = ?auto_15690 ?auto_15705 ) ) ( not ( = ?auto_15692 ?auto_15719 ) ) ( not ( = ?auto_15692 ?auto_15730 ) ) ( not ( = ?auto_15692 ?auto_15728 ) ) ( not ( = ?auto_15692 ?auto_15716 ) ) ( not ( = ?auto_15726 ?auto_15714 ) ) ( not ( = ?auto_15726 ?auto_15723 ) ) ( not ( = ?auto_15726 ?auto_15707 ) ) ( not ( = ?auto_15726 ?auto_15710 ) ) ( not ( = ?auto_15706 ?auto_15722 ) ) ( not ( = ?auto_15706 ?auto_15721 ) ) ( not ( = ?auto_15706 ?auto_15709 ) ) ( not ( = ?auto_15706 ?auto_15724 ) ) ( not ( = ?auto_15705 ?auto_15719 ) ) ( not ( = ?auto_15705 ?auto_15730 ) ) ( not ( = ?auto_15705 ?auto_15728 ) ) ( not ( = ?auto_15705 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15693 ) ) ( not ( = ?auto_15687 ?auto_15720 ) ) ( not ( = ?auto_15688 ?auto_15693 ) ) ( not ( = ?auto_15688 ?auto_15720 ) ) ( not ( = ?auto_15689 ?auto_15693 ) ) ( not ( = ?auto_15689 ?auto_15720 ) ) ( not ( = ?auto_15690 ?auto_15693 ) ) ( not ( = ?auto_15690 ?auto_15720 ) ) ( not ( = ?auto_15691 ?auto_15693 ) ) ( not ( = ?auto_15691 ?auto_15720 ) ) ( not ( = ?auto_15693 ?auto_15705 ) ) ( not ( = ?auto_15693 ?auto_15719 ) ) ( not ( = ?auto_15693 ?auto_15730 ) ) ( not ( = ?auto_15693 ?auto_15728 ) ) ( not ( = ?auto_15693 ?auto_15716 ) ) ( not ( = ?auto_15715 ?auto_15726 ) ) ( not ( = ?auto_15715 ?auto_15714 ) ) ( not ( = ?auto_15715 ?auto_15723 ) ) ( not ( = ?auto_15715 ?auto_15707 ) ) ( not ( = ?auto_15715 ?auto_15710 ) ) ( not ( = ?auto_15713 ?auto_15706 ) ) ( not ( = ?auto_15713 ?auto_15722 ) ) ( not ( = ?auto_15713 ?auto_15721 ) ) ( not ( = ?auto_15713 ?auto_15709 ) ) ( not ( = ?auto_15713 ?auto_15724 ) ) ( not ( = ?auto_15720 ?auto_15705 ) ) ( not ( = ?auto_15720 ?auto_15719 ) ) ( not ( = ?auto_15720 ?auto_15730 ) ) ( not ( = ?auto_15720 ?auto_15728 ) ) ( not ( = ?auto_15720 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15694 ) ) ( not ( = ?auto_15687 ?auto_15729 ) ) ( not ( = ?auto_15688 ?auto_15694 ) ) ( not ( = ?auto_15688 ?auto_15729 ) ) ( not ( = ?auto_15689 ?auto_15694 ) ) ( not ( = ?auto_15689 ?auto_15729 ) ) ( not ( = ?auto_15690 ?auto_15694 ) ) ( not ( = ?auto_15690 ?auto_15729 ) ) ( not ( = ?auto_15691 ?auto_15694 ) ) ( not ( = ?auto_15691 ?auto_15729 ) ) ( not ( = ?auto_15692 ?auto_15694 ) ) ( not ( = ?auto_15692 ?auto_15729 ) ) ( not ( = ?auto_15694 ?auto_15720 ) ) ( not ( = ?auto_15694 ?auto_15705 ) ) ( not ( = ?auto_15694 ?auto_15719 ) ) ( not ( = ?auto_15694 ?auto_15730 ) ) ( not ( = ?auto_15694 ?auto_15728 ) ) ( not ( = ?auto_15694 ?auto_15716 ) ) ( not ( = ?auto_15708 ?auto_15715 ) ) ( not ( = ?auto_15708 ?auto_15726 ) ) ( not ( = ?auto_15708 ?auto_15714 ) ) ( not ( = ?auto_15708 ?auto_15723 ) ) ( not ( = ?auto_15708 ?auto_15707 ) ) ( not ( = ?auto_15708 ?auto_15710 ) ) ( not ( = ?auto_15718 ?auto_15713 ) ) ( not ( = ?auto_15718 ?auto_15706 ) ) ( not ( = ?auto_15718 ?auto_15722 ) ) ( not ( = ?auto_15718 ?auto_15721 ) ) ( not ( = ?auto_15718 ?auto_15709 ) ) ( not ( = ?auto_15718 ?auto_15724 ) ) ( not ( = ?auto_15729 ?auto_15720 ) ) ( not ( = ?auto_15729 ?auto_15705 ) ) ( not ( = ?auto_15729 ?auto_15719 ) ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( not ( = ?auto_15729 ?auto_15728 ) ) ( not ( = ?auto_15729 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15695 ) ) ( not ( = ?auto_15687 ?auto_15711 ) ) ( not ( = ?auto_15688 ?auto_15695 ) ) ( not ( = ?auto_15688 ?auto_15711 ) ) ( not ( = ?auto_15689 ?auto_15695 ) ) ( not ( = ?auto_15689 ?auto_15711 ) ) ( not ( = ?auto_15690 ?auto_15695 ) ) ( not ( = ?auto_15690 ?auto_15711 ) ) ( not ( = ?auto_15691 ?auto_15695 ) ) ( not ( = ?auto_15691 ?auto_15711 ) ) ( not ( = ?auto_15692 ?auto_15695 ) ) ( not ( = ?auto_15692 ?auto_15711 ) ) ( not ( = ?auto_15693 ?auto_15695 ) ) ( not ( = ?auto_15693 ?auto_15711 ) ) ( not ( = ?auto_15695 ?auto_15729 ) ) ( not ( = ?auto_15695 ?auto_15720 ) ) ( not ( = ?auto_15695 ?auto_15705 ) ) ( not ( = ?auto_15695 ?auto_15719 ) ) ( not ( = ?auto_15695 ?auto_15730 ) ) ( not ( = ?auto_15695 ?auto_15728 ) ) ( not ( = ?auto_15695 ?auto_15716 ) ) ( not ( = ?auto_15711 ?auto_15729 ) ) ( not ( = ?auto_15711 ?auto_15720 ) ) ( not ( = ?auto_15711 ?auto_15705 ) ) ( not ( = ?auto_15711 ?auto_15719 ) ) ( not ( = ?auto_15711 ?auto_15730 ) ) ( not ( = ?auto_15711 ?auto_15728 ) ) ( not ( = ?auto_15711 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15696 ) ) ( not ( = ?auto_15687 ?auto_15731 ) ) ( not ( = ?auto_15688 ?auto_15696 ) ) ( not ( = ?auto_15688 ?auto_15731 ) ) ( not ( = ?auto_15689 ?auto_15696 ) ) ( not ( = ?auto_15689 ?auto_15731 ) ) ( not ( = ?auto_15690 ?auto_15696 ) ) ( not ( = ?auto_15690 ?auto_15731 ) ) ( not ( = ?auto_15691 ?auto_15696 ) ) ( not ( = ?auto_15691 ?auto_15731 ) ) ( not ( = ?auto_15692 ?auto_15696 ) ) ( not ( = ?auto_15692 ?auto_15731 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15693 ?auto_15731 ) ) ( not ( = ?auto_15694 ?auto_15696 ) ) ( not ( = ?auto_15694 ?auto_15731 ) ) ( not ( = ?auto_15696 ?auto_15711 ) ) ( not ( = ?auto_15696 ?auto_15729 ) ) ( not ( = ?auto_15696 ?auto_15720 ) ) ( not ( = ?auto_15696 ?auto_15705 ) ) ( not ( = ?auto_15696 ?auto_15719 ) ) ( not ( = ?auto_15696 ?auto_15730 ) ) ( not ( = ?auto_15696 ?auto_15728 ) ) ( not ( = ?auto_15696 ?auto_15716 ) ) ( not ( = ?auto_15712 ?auto_15708 ) ) ( not ( = ?auto_15712 ?auto_15715 ) ) ( not ( = ?auto_15712 ?auto_15726 ) ) ( not ( = ?auto_15712 ?auto_15714 ) ) ( not ( = ?auto_15712 ?auto_15723 ) ) ( not ( = ?auto_15712 ?auto_15707 ) ) ( not ( = ?auto_15712 ?auto_15710 ) ) ( not ( = ?auto_15717 ?auto_15718 ) ) ( not ( = ?auto_15717 ?auto_15713 ) ) ( not ( = ?auto_15717 ?auto_15706 ) ) ( not ( = ?auto_15717 ?auto_15722 ) ) ( not ( = ?auto_15717 ?auto_15721 ) ) ( not ( = ?auto_15717 ?auto_15709 ) ) ( not ( = ?auto_15717 ?auto_15724 ) ) ( not ( = ?auto_15731 ?auto_15711 ) ) ( not ( = ?auto_15731 ?auto_15729 ) ) ( not ( = ?auto_15731 ?auto_15720 ) ) ( not ( = ?auto_15731 ?auto_15705 ) ) ( not ( = ?auto_15731 ?auto_15719 ) ) ( not ( = ?auto_15731 ?auto_15730 ) ) ( not ( = ?auto_15731 ?auto_15728 ) ) ( not ( = ?auto_15731 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15697 ) ) ( not ( = ?auto_15687 ?auto_15725 ) ) ( not ( = ?auto_15688 ?auto_15697 ) ) ( not ( = ?auto_15688 ?auto_15725 ) ) ( not ( = ?auto_15689 ?auto_15697 ) ) ( not ( = ?auto_15689 ?auto_15725 ) ) ( not ( = ?auto_15690 ?auto_15697 ) ) ( not ( = ?auto_15690 ?auto_15725 ) ) ( not ( = ?auto_15691 ?auto_15697 ) ) ( not ( = ?auto_15691 ?auto_15725 ) ) ( not ( = ?auto_15692 ?auto_15697 ) ) ( not ( = ?auto_15692 ?auto_15725 ) ) ( not ( = ?auto_15693 ?auto_15697 ) ) ( not ( = ?auto_15693 ?auto_15725 ) ) ( not ( = ?auto_15694 ?auto_15697 ) ) ( not ( = ?auto_15694 ?auto_15725 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15695 ?auto_15725 ) ) ( not ( = ?auto_15697 ?auto_15731 ) ) ( not ( = ?auto_15697 ?auto_15711 ) ) ( not ( = ?auto_15697 ?auto_15729 ) ) ( not ( = ?auto_15697 ?auto_15720 ) ) ( not ( = ?auto_15697 ?auto_15705 ) ) ( not ( = ?auto_15697 ?auto_15719 ) ) ( not ( = ?auto_15697 ?auto_15730 ) ) ( not ( = ?auto_15697 ?auto_15728 ) ) ( not ( = ?auto_15697 ?auto_15716 ) ) ( not ( = ?auto_15732 ?auto_15712 ) ) ( not ( = ?auto_15732 ?auto_15708 ) ) ( not ( = ?auto_15732 ?auto_15715 ) ) ( not ( = ?auto_15732 ?auto_15726 ) ) ( not ( = ?auto_15732 ?auto_15714 ) ) ( not ( = ?auto_15732 ?auto_15723 ) ) ( not ( = ?auto_15732 ?auto_15707 ) ) ( not ( = ?auto_15732 ?auto_15710 ) ) ( not ( = ?auto_15727 ?auto_15717 ) ) ( not ( = ?auto_15727 ?auto_15718 ) ) ( not ( = ?auto_15727 ?auto_15713 ) ) ( not ( = ?auto_15727 ?auto_15706 ) ) ( not ( = ?auto_15727 ?auto_15722 ) ) ( not ( = ?auto_15727 ?auto_15721 ) ) ( not ( = ?auto_15727 ?auto_15709 ) ) ( not ( = ?auto_15727 ?auto_15724 ) ) ( not ( = ?auto_15725 ?auto_15731 ) ) ( not ( = ?auto_15725 ?auto_15711 ) ) ( not ( = ?auto_15725 ?auto_15729 ) ) ( not ( = ?auto_15725 ?auto_15720 ) ) ( not ( = ?auto_15725 ?auto_15705 ) ) ( not ( = ?auto_15725 ?auto_15719 ) ) ( not ( = ?auto_15725 ?auto_15730 ) ) ( not ( = ?auto_15725 ?auto_15728 ) ) ( not ( = ?auto_15725 ?auto_15716 ) ) ( not ( = ?auto_15687 ?auto_15698 ) ) ( not ( = ?auto_15687 ?auto_15703 ) ) ( not ( = ?auto_15688 ?auto_15698 ) ) ( not ( = ?auto_15688 ?auto_15703 ) ) ( not ( = ?auto_15689 ?auto_15698 ) ) ( not ( = ?auto_15689 ?auto_15703 ) ) ( not ( = ?auto_15690 ?auto_15698 ) ) ( not ( = ?auto_15690 ?auto_15703 ) ) ( not ( = ?auto_15691 ?auto_15698 ) ) ( not ( = ?auto_15691 ?auto_15703 ) ) ( not ( = ?auto_15692 ?auto_15698 ) ) ( not ( = ?auto_15692 ?auto_15703 ) ) ( not ( = ?auto_15693 ?auto_15698 ) ) ( not ( = ?auto_15693 ?auto_15703 ) ) ( not ( = ?auto_15694 ?auto_15698 ) ) ( not ( = ?auto_15694 ?auto_15703 ) ) ( not ( = ?auto_15695 ?auto_15698 ) ) ( not ( = ?auto_15695 ?auto_15703 ) ) ( not ( = ?auto_15696 ?auto_15698 ) ) ( not ( = ?auto_15696 ?auto_15703 ) ) ( not ( = ?auto_15698 ?auto_15725 ) ) ( not ( = ?auto_15698 ?auto_15731 ) ) ( not ( = ?auto_15698 ?auto_15711 ) ) ( not ( = ?auto_15698 ?auto_15729 ) ) ( not ( = ?auto_15698 ?auto_15720 ) ) ( not ( = ?auto_15698 ?auto_15705 ) ) ( not ( = ?auto_15698 ?auto_15719 ) ) ( not ( = ?auto_15698 ?auto_15730 ) ) ( not ( = ?auto_15698 ?auto_15728 ) ) ( not ( = ?auto_15698 ?auto_15716 ) ) ( not ( = ?auto_15702 ?auto_15732 ) ) ( not ( = ?auto_15702 ?auto_15712 ) ) ( not ( = ?auto_15702 ?auto_15708 ) ) ( not ( = ?auto_15702 ?auto_15715 ) ) ( not ( = ?auto_15702 ?auto_15726 ) ) ( not ( = ?auto_15702 ?auto_15714 ) ) ( not ( = ?auto_15702 ?auto_15723 ) ) ( not ( = ?auto_15702 ?auto_15707 ) ) ( not ( = ?auto_15702 ?auto_15710 ) ) ( not ( = ?auto_15699 ?auto_15727 ) ) ( not ( = ?auto_15699 ?auto_15717 ) ) ( not ( = ?auto_15699 ?auto_15718 ) ) ( not ( = ?auto_15699 ?auto_15713 ) ) ( not ( = ?auto_15699 ?auto_15706 ) ) ( not ( = ?auto_15699 ?auto_15722 ) ) ( not ( = ?auto_15699 ?auto_15721 ) ) ( not ( = ?auto_15699 ?auto_15709 ) ) ( not ( = ?auto_15699 ?auto_15724 ) ) ( not ( = ?auto_15703 ?auto_15725 ) ) ( not ( = ?auto_15703 ?auto_15731 ) ) ( not ( = ?auto_15703 ?auto_15711 ) ) ( not ( = ?auto_15703 ?auto_15729 ) ) ( not ( = ?auto_15703 ?auto_15720 ) ) ( not ( = ?auto_15703 ?auto_15705 ) ) ( not ( = ?auto_15703 ?auto_15719 ) ) ( not ( = ?auto_15703 ?auto_15730 ) ) ( not ( = ?auto_15703 ?auto_15728 ) ) ( not ( = ?auto_15703 ?auto_15716 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15687 ?auto_15688 ?auto_15689 ?auto_15690 ?auto_15691 ?auto_15692 ?auto_15693 ?auto_15694 ?auto_15695 ?auto_15696 ?auto_15697 )
      ( MAKE-1CRATE ?auto_15697 ?auto_15698 )
      ( MAKE-11CRATE-VERIFY ?auto_15687 ?auto_15688 ?auto_15689 ?auto_15690 ?auto_15691 ?auto_15692 ?auto_15693 ?auto_15694 ?auto_15695 ?auto_15696 ?auto_15697 ?auto_15698 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15756 - SURFACE
      ?auto_15757 - SURFACE
      ?auto_15758 - SURFACE
      ?auto_15759 - SURFACE
      ?auto_15760 - SURFACE
      ?auto_15761 - SURFACE
      ?auto_15762 - SURFACE
      ?auto_15763 - SURFACE
      ?auto_15764 - SURFACE
      ?auto_15765 - SURFACE
      ?auto_15766 - SURFACE
      ?auto_15767 - SURFACE
      ?auto_15768 - SURFACE
    )
    :vars
    (
      ?auto_15773 - HOIST
      ?auto_15770 - PLACE
      ?auto_15769 - PLACE
      ?auto_15774 - HOIST
      ?auto_15771 - SURFACE
      ?auto_15802 - PLACE
      ?auto_15800 - HOIST
      ?auto_15798 - SURFACE
      ?auto_15783 - PLACE
      ?auto_15782 - HOIST
      ?auto_15786 - SURFACE
      ?auto_15792 - PLACE
      ?auto_15793 - HOIST
      ?auto_15775 - SURFACE
      ?auto_15803 - PLACE
      ?auto_15796 - HOIST
      ?auto_15788 - SURFACE
      ?auto_15778 - SURFACE
      ?auto_15787 - PLACE
      ?auto_15805 - HOIST
      ?auto_15781 - SURFACE
      ?auto_15801 - PLACE
      ?auto_15799 - HOIST
      ?auto_15804 - SURFACE
      ?auto_15785 - PLACE
      ?auto_15780 - HOIST
      ?auto_15794 - SURFACE
      ?auto_15790 - PLACE
      ?auto_15779 - HOIST
      ?auto_15789 - SURFACE
      ?auto_15777 - PLACE
      ?auto_15795 - HOIST
      ?auto_15797 - SURFACE
      ?auto_15784 - PLACE
      ?auto_15791 - HOIST
      ?auto_15776 - SURFACE
      ?auto_15772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15773 ?auto_15770 ) ( IS-CRATE ?auto_15768 ) ( not ( = ?auto_15769 ?auto_15770 ) ) ( HOIST-AT ?auto_15774 ?auto_15769 ) ( AVAILABLE ?auto_15774 ) ( SURFACE-AT ?auto_15768 ?auto_15769 ) ( ON ?auto_15768 ?auto_15771 ) ( CLEAR ?auto_15768 ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15771 ) ) ( not ( = ?auto_15773 ?auto_15774 ) ) ( IS-CRATE ?auto_15767 ) ( not ( = ?auto_15802 ?auto_15770 ) ) ( HOIST-AT ?auto_15800 ?auto_15802 ) ( AVAILABLE ?auto_15800 ) ( SURFACE-AT ?auto_15767 ?auto_15802 ) ( ON ?auto_15767 ?auto_15798 ) ( CLEAR ?auto_15767 ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( not ( = ?auto_15766 ?auto_15798 ) ) ( not ( = ?auto_15767 ?auto_15798 ) ) ( not ( = ?auto_15773 ?auto_15800 ) ) ( IS-CRATE ?auto_15766 ) ( not ( = ?auto_15783 ?auto_15770 ) ) ( HOIST-AT ?auto_15782 ?auto_15783 ) ( AVAILABLE ?auto_15782 ) ( SURFACE-AT ?auto_15766 ?auto_15783 ) ( ON ?auto_15766 ?auto_15786 ) ( CLEAR ?auto_15766 ) ( not ( = ?auto_15765 ?auto_15766 ) ) ( not ( = ?auto_15765 ?auto_15786 ) ) ( not ( = ?auto_15766 ?auto_15786 ) ) ( not ( = ?auto_15773 ?auto_15782 ) ) ( IS-CRATE ?auto_15765 ) ( not ( = ?auto_15792 ?auto_15770 ) ) ( HOIST-AT ?auto_15793 ?auto_15792 ) ( AVAILABLE ?auto_15793 ) ( SURFACE-AT ?auto_15765 ?auto_15792 ) ( ON ?auto_15765 ?auto_15775 ) ( CLEAR ?auto_15765 ) ( not ( = ?auto_15764 ?auto_15765 ) ) ( not ( = ?auto_15764 ?auto_15775 ) ) ( not ( = ?auto_15765 ?auto_15775 ) ) ( not ( = ?auto_15773 ?auto_15793 ) ) ( IS-CRATE ?auto_15764 ) ( not ( = ?auto_15803 ?auto_15770 ) ) ( HOIST-AT ?auto_15796 ?auto_15803 ) ( SURFACE-AT ?auto_15764 ?auto_15803 ) ( ON ?auto_15764 ?auto_15788 ) ( CLEAR ?auto_15764 ) ( not ( = ?auto_15763 ?auto_15764 ) ) ( not ( = ?auto_15763 ?auto_15788 ) ) ( not ( = ?auto_15764 ?auto_15788 ) ) ( not ( = ?auto_15773 ?auto_15796 ) ) ( IS-CRATE ?auto_15763 ) ( AVAILABLE ?auto_15796 ) ( SURFACE-AT ?auto_15763 ?auto_15803 ) ( ON ?auto_15763 ?auto_15778 ) ( CLEAR ?auto_15763 ) ( not ( = ?auto_15762 ?auto_15763 ) ) ( not ( = ?auto_15762 ?auto_15778 ) ) ( not ( = ?auto_15763 ?auto_15778 ) ) ( IS-CRATE ?auto_15762 ) ( not ( = ?auto_15787 ?auto_15770 ) ) ( HOIST-AT ?auto_15805 ?auto_15787 ) ( AVAILABLE ?auto_15805 ) ( SURFACE-AT ?auto_15762 ?auto_15787 ) ( ON ?auto_15762 ?auto_15781 ) ( CLEAR ?auto_15762 ) ( not ( = ?auto_15761 ?auto_15762 ) ) ( not ( = ?auto_15761 ?auto_15781 ) ) ( not ( = ?auto_15762 ?auto_15781 ) ) ( not ( = ?auto_15773 ?auto_15805 ) ) ( IS-CRATE ?auto_15761 ) ( not ( = ?auto_15801 ?auto_15770 ) ) ( HOIST-AT ?auto_15799 ?auto_15801 ) ( AVAILABLE ?auto_15799 ) ( SURFACE-AT ?auto_15761 ?auto_15801 ) ( ON ?auto_15761 ?auto_15804 ) ( CLEAR ?auto_15761 ) ( not ( = ?auto_15760 ?auto_15761 ) ) ( not ( = ?auto_15760 ?auto_15804 ) ) ( not ( = ?auto_15761 ?auto_15804 ) ) ( not ( = ?auto_15773 ?auto_15799 ) ) ( IS-CRATE ?auto_15760 ) ( not ( = ?auto_15785 ?auto_15770 ) ) ( HOIST-AT ?auto_15780 ?auto_15785 ) ( AVAILABLE ?auto_15780 ) ( SURFACE-AT ?auto_15760 ?auto_15785 ) ( ON ?auto_15760 ?auto_15794 ) ( CLEAR ?auto_15760 ) ( not ( = ?auto_15759 ?auto_15760 ) ) ( not ( = ?auto_15759 ?auto_15794 ) ) ( not ( = ?auto_15760 ?auto_15794 ) ) ( not ( = ?auto_15773 ?auto_15780 ) ) ( IS-CRATE ?auto_15759 ) ( not ( = ?auto_15790 ?auto_15770 ) ) ( HOIST-AT ?auto_15779 ?auto_15790 ) ( AVAILABLE ?auto_15779 ) ( SURFACE-AT ?auto_15759 ?auto_15790 ) ( ON ?auto_15759 ?auto_15789 ) ( CLEAR ?auto_15759 ) ( not ( = ?auto_15758 ?auto_15759 ) ) ( not ( = ?auto_15758 ?auto_15789 ) ) ( not ( = ?auto_15759 ?auto_15789 ) ) ( not ( = ?auto_15773 ?auto_15779 ) ) ( IS-CRATE ?auto_15758 ) ( not ( = ?auto_15777 ?auto_15770 ) ) ( HOIST-AT ?auto_15795 ?auto_15777 ) ( AVAILABLE ?auto_15795 ) ( SURFACE-AT ?auto_15758 ?auto_15777 ) ( ON ?auto_15758 ?auto_15797 ) ( CLEAR ?auto_15758 ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15797 ) ) ( not ( = ?auto_15758 ?auto_15797 ) ) ( not ( = ?auto_15773 ?auto_15795 ) ) ( SURFACE-AT ?auto_15756 ?auto_15770 ) ( CLEAR ?auto_15756 ) ( IS-CRATE ?auto_15757 ) ( AVAILABLE ?auto_15773 ) ( not ( = ?auto_15784 ?auto_15770 ) ) ( HOIST-AT ?auto_15791 ?auto_15784 ) ( AVAILABLE ?auto_15791 ) ( SURFACE-AT ?auto_15757 ?auto_15784 ) ( ON ?auto_15757 ?auto_15776 ) ( CLEAR ?auto_15757 ) ( TRUCK-AT ?auto_15772 ?auto_15770 ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( not ( = ?auto_15756 ?auto_15776 ) ) ( not ( = ?auto_15757 ?auto_15776 ) ) ( not ( = ?auto_15773 ?auto_15791 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15797 ) ) ( not ( = ?auto_15758 ?auto_15776 ) ) ( not ( = ?auto_15777 ?auto_15784 ) ) ( not ( = ?auto_15795 ?auto_15791 ) ) ( not ( = ?auto_15797 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15759 ) ) ( not ( = ?auto_15756 ?auto_15789 ) ) ( not ( = ?auto_15757 ?auto_15759 ) ) ( not ( = ?auto_15757 ?auto_15789 ) ) ( not ( = ?auto_15759 ?auto_15797 ) ) ( not ( = ?auto_15759 ?auto_15776 ) ) ( not ( = ?auto_15790 ?auto_15777 ) ) ( not ( = ?auto_15790 ?auto_15784 ) ) ( not ( = ?auto_15779 ?auto_15795 ) ) ( not ( = ?auto_15779 ?auto_15791 ) ) ( not ( = ?auto_15789 ?auto_15797 ) ) ( not ( = ?auto_15789 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15760 ) ) ( not ( = ?auto_15756 ?auto_15794 ) ) ( not ( = ?auto_15757 ?auto_15760 ) ) ( not ( = ?auto_15757 ?auto_15794 ) ) ( not ( = ?auto_15758 ?auto_15760 ) ) ( not ( = ?auto_15758 ?auto_15794 ) ) ( not ( = ?auto_15760 ?auto_15789 ) ) ( not ( = ?auto_15760 ?auto_15797 ) ) ( not ( = ?auto_15760 ?auto_15776 ) ) ( not ( = ?auto_15785 ?auto_15790 ) ) ( not ( = ?auto_15785 ?auto_15777 ) ) ( not ( = ?auto_15785 ?auto_15784 ) ) ( not ( = ?auto_15780 ?auto_15779 ) ) ( not ( = ?auto_15780 ?auto_15795 ) ) ( not ( = ?auto_15780 ?auto_15791 ) ) ( not ( = ?auto_15794 ?auto_15789 ) ) ( not ( = ?auto_15794 ?auto_15797 ) ) ( not ( = ?auto_15794 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15761 ) ) ( not ( = ?auto_15756 ?auto_15804 ) ) ( not ( = ?auto_15757 ?auto_15761 ) ) ( not ( = ?auto_15757 ?auto_15804 ) ) ( not ( = ?auto_15758 ?auto_15761 ) ) ( not ( = ?auto_15758 ?auto_15804 ) ) ( not ( = ?auto_15759 ?auto_15761 ) ) ( not ( = ?auto_15759 ?auto_15804 ) ) ( not ( = ?auto_15761 ?auto_15794 ) ) ( not ( = ?auto_15761 ?auto_15789 ) ) ( not ( = ?auto_15761 ?auto_15797 ) ) ( not ( = ?auto_15761 ?auto_15776 ) ) ( not ( = ?auto_15801 ?auto_15785 ) ) ( not ( = ?auto_15801 ?auto_15790 ) ) ( not ( = ?auto_15801 ?auto_15777 ) ) ( not ( = ?auto_15801 ?auto_15784 ) ) ( not ( = ?auto_15799 ?auto_15780 ) ) ( not ( = ?auto_15799 ?auto_15779 ) ) ( not ( = ?auto_15799 ?auto_15795 ) ) ( not ( = ?auto_15799 ?auto_15791 ) ) ( not ( = ?auto_15804 ?auto_15794 ) ) ( not ( = ?auto_15804 ?auto_15789 ) ) ( not ( = ?auto_15804 ?auto_15797 ) ) ( not ( = ?auto_15804 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15762 ) ) ( not ( = ?auto_15756 ?auto_15781 ) ) ( not ( = ?auto_15757 ?auto_15762 ) ) ( not ( = ?auto_15757 ?auto_15781 ) ) ( not ( = ?auto_15758 ?auto_15762 ) ) ( not ( = ?auto_15758 ?auto_15781 ) ) ( not ( = ?auto_15759 ?auto_15762 ) ) ( not ( = ?auto_15759 ?auto_15781 ) ) ( not ( = ?auto_15760 ?auto_15762 ) ) ( not ( = ?auto_15760 ?auto_15781 ) ) ( not ( = ?auto_15762 ?auto_15804 ) ) ( not ( = ?auto_15762 ?auto_15794 ) ) ( not ( = ?auto_15762 ?auto_15789 ) ) ( not ( = ?auto_15762 ?auto_15797 ) ) ( not ( = ?auto_15762 ?auto_15776 ) ) ( not ( = ?auto_15787 ?auto_15801 ) ) ( not ( = ?auto_15787 ?auto_15785 ) ) ( not ( = ?auto_15787 ?auto_15790 ) ) ( not ( = ?auto_15787 ?auto_15777 ) ) ( not ( = ?auto_15787 ?auto_15784 ) ) ( not ( = ?auto_15805 ?auto_15799 ) ) ( not ( = ?auto_15805 ?auto_15780 ) ) ( not ( = ?auto_15805 ?auto_15779 ) ) ( not ( = ?auto_15805 ?auto_15795 ) ) ( not ( = ?auto_15805 ?auto_15791 ) ) ( not ( = ?auto_15781 ?auto_15804 ) ) ( not ( = ?auto_15781 ?auto_15794 ) ) ( not ( = ?auto_15781 ?auto_15789 ) ) ( not ( = ?auto_15781 ?auto_15797 ) ) ( not ( = ?auto_15781 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15763 ) ) ( not ( = ?auto_15756 ?auto_15778 ) ) ( not ( = ?auto_15757 ?auto_15763 ) ) ( not ( = ?auto_15757 ?auto_15778 ) ) ( not ( = ?auto_15758 ?auto_15763 ) ) ( not ( = ?auto_15758 ?auto_15778 ) ) ( not ( = ?auto_15759 ?auto_15763 ) ) ( not ( = ?auto_15759 ?auto_15778 ) ) ( not ( = ?auto_15760 ?auto_15763 ) ) ( not ( = ?auto_15760 ?auto_15778 ) ) ( not ( = ?auto_15761 ?auto_15763 ) ) ( not ( = ?auto_15761 ?auto_15778 ) ) ( not ( = ?auto_15763 ?auto_15781 ) ) ( not ( = ?auto_15763 ?auto_15804 ) ) ( not ( = ?auto_15763 ?auto_15794 ) ) ( not ( = ?auto_15763 ?auto_15789 ) ) ( not ( = ?auto_15763 ?auto_15797 ) ) ( not ( = ?auto_15763 ?auto_15776 ) ) ( not ( = ?auto_15803 ?auto_15787 ) ) ( not ( = ?auto_15803 ?auto_15801 ) ) ( not ( = ?auto_15803 ?auto_15785 ) ) ( not ( = ?auto_15803 ?auto_15790 ) ) ( not ( = ?auto_15803 ?auto_15777 ) ) ( not ( = ?auto_15803 ?auto_15784 ) ) ( not ( = ?auto_15796 ?auto_15805 ) ) ( not ( = ?auto_15796 ?auto_15799 ) ) ( not ( = ?auto_15796 ?auto_15780 ) ) ( not ( = ?auto_15796 ?auto_15779 ) ) ( not ( = ?auto_15796 ?auto_15795 ) ) ( not ( = ?auto_15796 ?auto_15791 ) ) ( not ( = ?auto_15778 ?auto_15781 ) ) ( not ( = ?auto_15778 ?auto_15804 ) ) ( not ( = ?auto_15778 ?auto_15794 ) ) ( not ( = ?auto_15778 ?auto_15789 ) ) ( not ( = ?auto_15778 ?auto_15797 ) ) ( not ( = ?auto_15778 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15764 ) ) ( not ( = ?auto_15756 ?auto_15788 ) ) ( not ( = ?auto_15757 ?auto_15764 ) ) ( not ( = ?auto_15757 ?auto_15788 ) ) ( not ( = ?auto_15758 ?auto_15764 ) ) ( not ( = ?auto_15758 ?auto_15788 ) ) ( not ( = ?auto_15759 ?auto_15764 ) ) ( not ( = ?auto_15759 ?auto_15788 ) ) ( not ( = ?auto_15760 ?auto_15764 ) ) ( not ( = ?auto_15760 ?auto_15788 ) ) ( not ( = ?auto_15761 ?auto_15764 ) ) ( not ( = ?auto_15761 ?auto_15788 ) ) ( not ( = ?auto_15762 ?auto_15764 ) ) ( not ( = ?auto_15762 ?auto_15788 ) ) ( not ( = ?auto_15764 ?auto_15778 ) ) ( not ( = ?auto_15764 ?auto_15781 ) ) ( not ( = ?auto_15764 ?auto_15804 ) ) ( not ( = ?auto_15764 ?auto_15794 ) ) ( not ( = ?auto_15764 ?auto_15789 ) ) ( not ( = ?auto_15764 ?auto_15797 ) ) ( not ( = ?auto_15764 ?auto_15776 ) ) ( not ( = ?auto_15788 ?auto_15778 ) ) ( not ( = ?auto_15788 ?auto_15781 ) ) ( not ( = ?auto_15788 ?auto_15804 ) ) ( not ( = ?auto_15788 ?auto_15794 ) ) ( not ( = ?auto_15788 ?auto_15789 ) ) ( not ( = ?auto_15788 ?auto_15797 ) ) ( not ( = ?auto_15788 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15765 ) ) ( not ( = ?auto_15756 ?auto_15775 ) ) ( not ( = ?auto_15757 ?auto_15765 ) ) ( not ( = ?auto_15757 ?auto_15775 ) ) ( not ( = ?auto_15758 ?auto_15765 ) ) ( not ( = ?auto_15758 ?auto_15775 ) ) ( not ( = ?auto_15759 ?auto_15765 ) ) ( not ( = ?auto_15759 ?auto_15775 ) ) ( not ( = ?auto_15760 ?auto_15765 ) ) ( not ( = ?auto_15760 ?auto_15775 ) ) ( not ( = ?auto_15761 ?auto_15765 ) ) ( not ( = ?auto_15761 ?auto_15775 ) ) ( not ( = ?auto_15762 ?auto_15765 ) ) ( not ( = ?auto_15762 ?auto_15775 ) ) ( not ( = ?auto_15763 ?auto_15765 ) ) ( not ( = ?auto_15763 ?auto_15775 ) ) ( not ( = ?auto_15765 ?auto_15788 ) ) ( not ( = ?auto_15765 ?auto_15778 ) ) ( not ( = ?auto_15765 ?auto_15781 ) ) ( not ( = ?auto_15765 ?auto_15804 ) ) ( not ( = ?auto_15765 ?auto_15794 ) ) ( not ( = ?auto_15765 ?auto_15789 ) ) ( not ( = ?auto_15765 ?auto_15797 ) ) ( not ( = ?auto_15765 ?auto_15776 ) ) ( not ( = ?auto_15792 ?auto_15803 ) ) ( not ( = ?auto_15792 ?auto_15787 ) ) ( not ( = ?auto_15792 ?auto_15801 ) ) ( not ( = ?auto_15792 ?auto_15785 ) ) ( not ( = ?auto_15792 ?auto_15790 ) ) ( not ( = ?auto_15792 ?auto_15777 ) ) ( not ( = ?auto_15792 ?auto_15784 ) ) ( not ( = ?auto_15793 ?auto_15796 ) ) ( not ( = ?auto_15793 ?auto_15805 ) ) ( not ( = ?auto_15793 ?auto_15799 ) ) ( not ( = ?auto_15793 ?auto_15780 ) ) ( not ( = ?auto_15793 ?auto_15779 ) ) ( not ( = ?auto_15793 ?auto_15795 ) ) ( not ( = ?auto_15793 ?auto_15791 ) ) ( not ( = ?auto_15775 ?auto_15788 ) ) ( not ( = ?auto_15775 ?auto_15778 ) ) ( not ( = ?auto_15775 ?auto_15781 ) ) ( not ( = ?auto_15775 ?auto_15804 ) ) ( not ( = ?auto_15775 ?auto_15794 ) ) ( not ( = ?auto_15775 ?auto_15789 ) ) ( not ( = ?auto_15775 ?auto_15797 ) ) ( not ( = ?auto_15775 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15766 ) ) ( not ( = ?auto_15756 ?auto_15786 ) ) ( not ( = ?auto_15757 ?auto_15766 ) ) ( not ( = ?auto_15757 ?auto_15786 ) ) ( not ( = ?auto_15758 ?auto_15766 ) ) ( not ( = ?auto_15758 ?auto_15786 ) ) ( not ( = ?auto_15759 ?auto_15766 ) ) ( not ( = ?auto_15759 ?auto_15786 ) ) ( not ( = ?auto_15760 ?auto_15766 ) ) ( not ( = ?auto_15760 ?auto_15786 ) ) ( not ( = ?auto_15761 ?auto_15766 ) ) ( not ( = ?auto_15761 ?auto_15786 ) ) ( not ( = ?auto_15762 ?auto_15766 ) ) ( not ( = ?auto_15762 ?auto_15786 ) ) ( not ( = ?auto_15763 ?auto_15766 ) ) ( not ( = ?auto_15763 ?auto_15786 ) ) ( not ( = ?auto_15764 ?auto_15766 ) ) ( not ( = ?auto_15764 ?auto_15786 ) ) ( not ( = ?auto_15766 ?auto_15775 ) ) ( not ( = ?auto_15766 ?auto_15788 ) ) ( not ( = ?auto_15766 ?auto_15778 ) ) ( not ( = ?auto_15766 ?auto_15781 ) ) ( not ( = ?auto_15766 ?auto_15804 ) ) ( not ( = ?auto_15766 ?auto_15794 ) ) ( not ( = ?auto_15766 ?auto_15789 ) ) ( not ( = ?auto_15766 ?auto_15797 ) ) ( not ( = ?auto_15766 ?auto_15776 ) ) ( not ( = ?auto_15783 ?auto_15792 ) ) ( not ( = ?auto_15783 ?auto_15803 ) ) ( not ( = ?auto_15783 ?auto_15787 ) ) ( not ( = ?auto_15783 ?auto_15801 ) ) ( not ( = ?auto_15783 ?auto_15785 ) ) ( not ( = ?auto_15783 ?auto_15790 ) ) ( not ( = ?auto_15783 ?auto_15777 ) ) ( not ( = ?auto_15783 ?auto_15784 ) ) ( not ( = ?auto_15782 ?auto_15793 ) ) ( not ( = ?auto_15782 ?auto_15796 ) ) ( not ( = ?auto_15782 ?auto_15805 ) ) ( not ( = ?auto_15782 ?auto_15799 ) ) ( not ( = ?auto_15782 ?auto_15780 ) ) ( not ( = ?auto_15782 ?auto_15779 ) ) ( not ( = ?auto_15782 ?auto_15795 ) ) ( not ( = ?auto_15782 ?auto_15791 ) ) ( not ( = ?auto_15786 ?auto_15775 ) ) ( not ( = ?auto_15786 ?auto_15788 ) ) ( not ( = ?auto_15786 ?auto_15778 ) ) ( not ( = ?auto_15786 ?auto_15781 ) ) ( not ( = ?auto_15786 ?auto_15804 ) ) ( not ( = ?auto_15786 ?auto_15794 ) ) ( not ( = ?auto_15786 ?auto_15789 ) ) ( not ( = ?auto_15786 ?auto_15797 ) ) ( not ( = ?auto_15786 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15767 ) ) ( not ( = ?auto_15756 ?auto_15798 ) ) ( not ( = ?auto_15757 ?auto_15767 ) ) ( not ( = ?auto_15757 ?auto_15798 ) ) ( not ( = ?auto_15758 ?auto_15767 ) ) ( not ( = ?auto_15758 ?auto_15798 ) ) ( not ( = ?auto_15759 ?auto_15767 ) ) ( not ( = ?auto_15759 ?auto_15798 ) ) ( not ( = ?auto_15760 ?auto_15767 ) ) ( not ( = ?auto_15760 ?auto_15798 ) ) ( not ( = ?auto_15761 ?auto_15767 ) ) ( not ( = ?auto_15761 ?auto_15798 ) ) ( not ( = ?auto_15762 ?auto_15767 ) ) ( not ( = ?auto_15762 ?auto_15798 ) ) ( not ( = ?auto_15763 ?auto_15767 ) ) ( not ( = ?auto_15763 ?auto_15798 ) ) ( not ( = ?auto_15764 ?auto_15767 ) ) ( not ( = ?auto_15764 ?auto_15798 ) ) ( not ( = ?auto_15765 ?auto_15767 ) ) ( not ( = ?auto_15765 ?auto_15798 ) ) ( not ( = ?auto_15767 ?auto_15786 ) ) ( not ( = ?auto_15767 ?auto_15775 ) ) ( not ( = ?auto_15767 ?auto_15788 ) ) ( not ( = ?auto_15767 ?auto_15778 ) ) ( not ( = ?auto_15767 ?auto_15781 ) ) ( not ( = ?auto_15767 ?auto_15804 ) ) ( not ( = ?auto_15767 ?auto_15794 ) ) ( not ( = ?auto_15767 ?auto_15789 ) ) ( not ( = ?auto_15767 ?auto_15797 ) ) ( not ( = ?auto_15767 ?auto_15776 ) ) ( not ( = ?auto_15802 ?auto_15783 ) ) ( not ( = ?auto_15802 ?auto_15792 ) ) ( not ( = ?auto_15802 ?auto_15803 ) ) ( not ( = ?auto_15802 ?auto_15787 ) ) ( not ( = ?auto_15802 ?auto_15801 ) ) ( not ( = ?auto_15802 ?auto_15785 ) ) ( not ( = ?auto_15802 ?auto_15790 ) ) ( not ( = ?auto_15802 ?auto_15777 ) ) ( not ( = ?auto_15802 ?auto_15784 ) ) ( not ( = ?auto_15800 ?auto_15782 ) ) ( not ( = ?auto_15800 ?auto_15793 ) ) ( not ( = ?auto_15800 ?auto_15796 ) ) ( not ( = ?auto_15800 ?auto_15805 ) ) ( not ( = ?auto_15800 ?auto_15799 ) ) ( not ( = ?auto_15800 ?auto_15780 ) ) ( not ( = ?auto_15800 ?auto_15779 ) ) ( not ( = ?auto_15800 ?auto_15795 ) ) ( not ( = ?auto_15800 ?auto_15791 ) ) ( not ( = ?auto_15798 ?auto_15786 ) ) ( not ( = ?auto_15798 ?auto_15775 ) ) ( not ( = ?auto_15798 ?auto_15788 ) ) ( not ( = ?auto_15798 ?auto_15778 ) ) ( not ( = ?auto_15798 ?auto_15781 ) ) ( not ( = ?auto_15798 ?auto_15804 ) ) ( not ( = ?auto_15798 ?auto_15794 ) ) ( not ( = ?auto_15798 ?auto_15789 ) ) ( not ( = ?auto_15798 ?auto_15797 ) ) ( not ( = ?auto_15798 ?auto_15776 ) ) ( not ( = ?auto_15756 ?auto_15768 ) ) ( not ( = ?auto_15756 ?auto_15771 ) ) ( not ( = ?auto_15757 ?auto_15768 ) ) ( not ( = ?auto_15757 ?auto_15771 ) ) ( not ( = ?auto_15758 ?auto_15768 ) ) ( not ( = ?auto_15758 ?auto_15771 ) ) ( not ( = ?auto_15759 ?auto_15768 ) ) ( not ( = ?auto_15759 ?auto_15771 ) ) ( not ( = ?auto_15760 ?auto_15768 ) ) ( not ( = ?auto_15760 ?auto_15771 ) ) ( not ( = ?auto_15761 ?auto_15768 ) ) ( not ( = ?auto_15761 ?auto_15771 ) ) ( not ( = ?auto_15762 ?auto_15768 ) ) ( not ( = ?auto_15762 ?auto_15771 ) ) ( not ( = ?auto_15763 ?auto_15768 ) ) ( not ( = ?auto_15763 ?auto_15771 ) ) ( not ( = ?auto_15764 ?auto_15768 ) ) ( not ( = ?auto_15764 ?auto_15771 ) ) ( not ( = ?auto_15765 ?auto_15768 ) ) ( not ( = ?auto_15765 ?auto_15771 ) ) ( not ( = ?auto_15766 ?auto_15768 ) ) ( not ( = ?auto_15766 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15798 ) ) ( not ( = ?auto_15768 ?auto_15786 ) ) ( not ( = ?auto_15768 ?auto_15775 ) ) ( not ( = ?auto_15768 ?auto_15788 ) ) ( not ( = ?auto_15768 ?auto_15778 ) ) ( not ( = ?auto_15768 ?auto_15781 ) ) ( not ( = ?auto_15768 ?auto_15804 ) ) ( not ( = ?auto_15768 ?auto_15794 ) ) ( not ( = ?auto_15768 ?auto_15789 ) ) ( not ( = ?auto_15768 ?auto_15797 ) ) ( not ( = ?auto_15768 ?auto_15776 ) ) ( not ( = ?auto_15769 ?auto_15802 ) ) ( not ( = ?auto_15769 ?auto_15783 ) ) ( not ( = ?auto_15769 ?auto_15792 ) ) ( not ( = ?auto_15769 ?auto_15803 ) ) ( not ( = ?auto_15769 ?auto_15787 ) ) ( not ( = ?auto_15769 ?auto_15801 ) ) ( not ( = ?auto_15769 ?auto_15785 ) ) ( not ( = ?auto_15769 ?auto_15790 ) ) ( not ( = ?auto_15769 ?auto_15777 ) ) ( not ( = ?auto_15769 ?auto_15784 ) ) ( not ( = ?auto_15774 ?auto_15800 ) ) ( not ( = ?auto_15774 ?auto_15782 ) ) ( not ( = ?auto_15774 ?auto_15793 ) ) ( not ( = ?auto_15774 ?auto_15796 ) ) ( not ( = ?auto_15774 ?auto_15805 ) ) ( not ( = ?auto_15774 ?auto_15799 ) ) ( not ( = ?auto_15774 ?auto_15780 ) ) ( not ( = ?auto_15774 ?auto_15779 ) ) ( not ( = ?auto_15774 ?auto_15795 ) ) ( not ( = ?auto_15774 ?auto_15791 ) ) ( not ( = ?auto_15771 ?auto_15798 ) ) ( not ( = ?auto_15771 ?auto_15786 ) ) ( not ( = ?auto_15771 ?auto_15775 ) ) ( not ( = ?auto_15771 ?auto_15788 ) ) ( not ( = ?auto_15771 ?auto_15778 ) ) ( not ( = ?auto_15771 ?auto_15781 ) ) ( not ( = ?auto_15771 ?auto_15804 ) ) ( not ( = ?auto_15771 ?auto_15794 ) ) ( not ( = ?auto_15771 ?auto_15789 ) ) ( not ( = ?auto_15771 ?auto_15797 ) ) ( not ( = ?auto_15771 ?auto_15776 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15756 ?auto_15757 ?auto_15758 ?auto_15759 ?auto_15760 ?auto_15761 ?auto_15762 ?auto_15763 ?auto_15764 ?auto_15765 ?auto_15766 ?auto_15767 )
      ( MAKE-1CRATE ?auto_15767 ?auto_15768 )
      ( MAKE-12CRATE-VERIFY ?auto_15756 ?auto_15757 ?auto_15758 ?auto_15759 ?auto_15760 ?auto_15761 ?auto_15762 ?auto_15763 ?auto_15764 ?auto_15765 ?auto_15766 ?auto_15767 ?auto_15768 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15830 - SURFACE
      ?auto_15831 - SURFACE
      ?auto_15832 - SURFACE
      ?auto_15833 - SURFACE
      ?auto_15834 - SURFACE
      ?auto_15835 - SURFACE
      ?auto_15836 - SURFACE
      ?auto_15837 - SURFACE
      ?auto_15838 - SURFACE
      ?auto_15839 - SURFACE
      ?auto_15840 - SURFACE
      ?auto_15841 - SURFACE
      ?auto_15842 - SURFACE
      ?auto_15843 - SURFACE
    )
    :vars
    (
      ?auto_15845 - HOIST
      ?auto_15847 - PLACE
      ?auto_15844 - PLACE
      ?auto_15846 - HOIST
      ?auto_15848 - SURFACE
      ?auto_15851 - PLACE
      ?auto_15879 - HOIST
      ?auto_15850 - SURFACE
      ?auto_15881 - PLACE
      ?auto_15875 - HOIST
      ?auto_15852 - SURFACE
      ?auto_15862 - PLACE
      ?auto_15853 - HOIST
      ?auto_15857 - SURFACE
      ?auto_15867 - PLACE
      ?auto_15866 - HOIST
      ?auto_15855 - SURFACE
      ?auto_15860 - PLACE
      ?auto_15876 - HOIST
      ?auto_15873 - SURFACE
      ?auto_15870 - SURFACE
      ?auto_15865 - PLACE
      ?auto_15859 - HOIST
      ?auto_15880 - SURFACE
      ?auto_15874 - PLACE
      ?auto_15878 - HOIST
      ?auto_15858 - SURFACE
      ?auto_15877 - PLACE
      ?auto_15872 - HOIST
      ?auto_15854 - SURFACE
      ?auto_15863 - PLACE
      ?auto_15856 - HOIST
      ?auto_15869 - SURFACE
      ?auto_15871 - PLACE
      ?auto_15861 - HOIST
      ?auto_15868 - SURFACE
      ?auto_15864 - SURFACE
      ?auto_15849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15845 ?auto_15847 ) ( IS-CRATE ?auto_15843 ) ( not ( = ?auto_15844 ?auto_15847 ) ) ( HOIST-AT ?auto_15846 ?auto_15844 ) ( SURFACE-AT ?auto_15843 ?auto_15844 ) ( ON ?auto_15843 ?auto_15848 ) ( CLEAR ?auto_15843 ) ( not ( = ?auto_15842 ?auto_15843 ) ) ( not ( = ?auto_15842 ?auto_15848 ) ) ( not ( = ?auto_15843 ?auto_15848 ) ) ( not ( = ?auto_15845 ?auto_15846 ) ) ( IS-CRATE ?auto_15842 ) ( not ( = ?auto_15851 ?auto_15847 ) ) ( HOIST-AT ?auto_15879 ?auto_15851 ) ( AVAILABLE ?auto_15879 ) ( SURFACE-AT ?auto_15842 ?auto_15851 ) ( ON ?auto_15842 ?auto_15850 ) ( CLEAR ?auto_15842 ) ( not ( = ?auto_15841 ?auto_15842 ) ) ( not ( = ?auto_15841 ?auto_15850 ) ) ( not ( = ?auto_15842 ?auto_15850 ) ) ( not ( = ?auto_15845 ?auto_15879 ) ) ( IS-CRATE ?auto_15841 ) ( not ( = ?auto_15881 ?auto_15847 ) ) ( HOIST-AT ?auto_15875 ?auto_15881 ) ( AVAILABLE ?auto_15875 ) ( SURFACE-AT ?auto_15841 ?auto_15881 ) ( ON ?auto_15841 ?auto_15852 ) ( CLEAR ?auto_15841 ) ( not ( = ?auto_15840 ?auto_15841 ) ) ( not ( = ?auto_15840 ?auto_15852 ) ) ( not ( = ?auto_15841 ?auto_15852 ) ) ( not ( = ?auto_15845 ?auto_15875 ) ) ( IS-CRATE ?auto_15840 ) ( not ( = ?auto_15862 ?auto_15847 ) ) ( HOIST-AT ?auto_15853 ?auto_15862 ) ( AVAILABLE ?auto_15853 ) ( SURFACE-AT ?auto_15840 ?auto_15862 ) ( ON ?auto_15840 ?auto_15857 ) ( CLEAR ?auto_15840 ) ( not ( = ?auto_15839 ?auto_15840 ) ) ( not ( = ?auto_15839 ?auto_15857 ) ) ( not ( = ?auto_15840 ?auto_15857 ) ) ( not ( = ?auto_15845 ?auto_15853 ) ) ( IS-CRATE ?auto_15839 ) ( not ( = ?auto_15867 ?auto_15847 ) ) ( HOIST-AT ?auto_15866 ?auto_15867 ) ( AVAILABLE ?auto_15866 ) ( SURFACE-AT ?auto_15839 ?auto_15867 ) ( ON ?auto_15839 ?auto_15855 ) ( CLEAR ?auto_15839 ) ( not ( = ?auto_15838 ?auto_15839 ) ) ( not ( = ?auto_15838 ?auto_15855 ) ) ( not ( = ?auto_15839 ?auto_15855 ) ) ( not ( = ?auto_15845 ?auto_15866 ) ) ( IS-CRATE ?auto_15838 ) ( not ( = ?auto_15860 ?auto_15847 ) ) ( HOIST-AT ?auto_15876 ?auto_15860 ) ( SURFACE-AT ?auto_15838 ?auto_15860 ) ( ON ?auto_15838 ?auto_15873 ) ( CLEAR ?auto_15838 ) ( not ( = ?auto_15837 ?auto_15838 ) ) ( not ( = ?auto_15837 ?auto_15873 ) ) ( not ( = ?auto_15838 ?auto_15873 ) ) ( not ( = ?auto_15845 ?auto_15876 ) ) ( IS-CRATE ?auto_15837 ) ( AVAILABLE ?auto_15876 ) ( SURFACE-AT ?auto_15837 ?auto_15860 ) ( ON ?auto_15837 ?auto_15870 ) ( CLEAR ?auto_15837 ) ( not ( = ?auto_15836 ?auto_15837 ) ) ( not ( = ?auto_15836 ?auto_15870 ) ) ( not ( = ?auto_15837 ?auto_15870 ) ) ( IS-CRATE ?auto_15836 ) ( not ( = ?auto_15865 ?auto_15847 ) ) ( HOIST-AT ?auto_15859 ?auto_15865 ) ( AVAILABLE ?auto_15859 ) ( SURFACE-AT ?auto_15836 ?auto_15865 ) ( ON ?auto_15836 ?auto_15880 ) ( CLEAR ?auto_15836 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( not ( = ?auto_15835 ?auto_15880 ) ) ( not ( = ?auto_15836 ?auto_15880 ) ) ( not ( = ?auto_15845 ?auto_15859 ) ) ( IS-CRATE ?auto_15835 ) ( not ( = ?auto_15874 ?auto_15847 ) ) ( HOIST-AT ?auto_15878 ?auto_15874 ) ( AVAILABLE ?auto_15878 ) ( SURFACE-AT ?auto_15835 ?auto_15874 ) ( ON ?auto_15835 ?auto_15858 ) ( CLEAR ?auto_15835 ) ( not ( = ?auto_15834 ?auto_15835 ) ) ( not ( = ?auto_15834 ?auto_15858 ) ) ( not ( = ?auto_15835 ?auto_15858 ) ) ( not ( = ?auto_15845 ?auto_15878 ) ) ( IS-CRATE ?auto_15834 ) ( not ( = ?auto_15877 ?auto_15847 ) ) ( HOIST-AT ?auto_15872 ?auto_15877 ) ( AVAILABLE ?auto_15872 ) ( SURFACE-AT ?auto_15834 ?auto_15877 ) ( ON ?auto_15834 ?auto_15854 ) ( CLEAR ?auto_15834 ) ( not ( = ?auto_15833 ?auto_15834 ) ) ( not ( = ?auto_15833 ?auto_15854 ) ) ( not ( = ?auto_15834 ?auto_15854 ) ) ( not ( = ?auto_15845 ?auto_15872 ) ) ( IS-CRATE ?auto_15833 ) ( not ( = ?auto_15863 ?auto_15847 ) ) ( HOIST-AT ?auto_15856 ?auto_15863 ) ( AVAILABLE ?auto_15856 ) ( SURFACE-AT ?auto_15833 ?auto_15863 ) ( ON ?auto_15833 ?auto_15869 ) ( CLEAR ?auto_15833 ) ( not ( = ?auto_15832 ?auto_15833 ) ) ( not ( = ?auto_15832 ?auto_15869 ) ) ( not ( = ?auto_15833 ?auto_15869 ) ) ( not ( = ?auto_15845 ?auto_15856 ) ) ( IS-CRATE ?auto_15832 ) ( not ( = ?auto_15871 ?auto_15847 ) ) ( HOIST-AT ?auto_15861 ?auto_15871 ) ( AVAILABLE ?auto_15861 ) ( SURFACE-AT ?auto_15832 ?auto_15871 ) ( ON ?auto_15832 ?auto_15868 ) ( CLEAR ?auto_15832 ) ( not ( = ?auto_15831 ?auto_15832 ) ) ( not ( = ?auto_15831 ?auto_15868 ) ) ( not ( = ?auto_15832 ?auto_15868 ) ) ( not ( = ?auto_15845 ?auto_15861 ) ) ( SURFACE-AT ?auto_15830 ?auto_15847 ) ( CLEAR ?auto_15830 ) ( IS-CRATE ?auto_15831 ) ( AVAILABLE ?auto_15845 ) ( AVAILABLE ?auto_15846 ) ( SURFACE-AT ?auto_15831 ?auto_15844 ) ( ON ?auto_15831 ?auto_15864 ) ( CLEAR ?auto_15831 ) ( TRUCK-AT ?auto_15849 ?auto_15847 ) ( not ( = ?auto_15830 ?auto_15831 ) ) ( not ( = ?auto_15830 ?auto_15864 ) ) ( not ( = ?auto_15831 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15832 ) ) ( not ( = ?auto_15830 ?auto_15868 ) ) ( not ( = ?auto_15832 ?auto_15864 ) ) ( not ( = ?auto_15871 ?auto_15844 ) ) ( not ( = ?auto_15861 ?auto_15846 ) ) ( not ( = ?auto_15868 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15833 ) ) ( not ( = ?auto_15830 ?auto_15869 ) ) ( not ( = ?auto_15831 ?auto_15833 ) ) ( not ( = ?auto_15831 ?auto_15869 ) ) ( not ( = ?auto_15833 ?auto_15868 ) ) ( not ( = ?auto_15833 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15871 ) ) ( not ( = ?auto_15863 ?auto_15844 ) ) ( not ( = ?auto_15856 ?auto_15861 ) ) ( not ( = ?auto_15856 ?auto_15846 ) ) ( not ( = ?auto_15869 ?auto_15868 ) ) ( not ( = ?auto_15869 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15834 ) ) ( not ( = ?auto_15830 ?auto_15854 ) ) ( not ( = ?auto_15831 ?auto_15834 ) ) ( not ( = ?auto_15831 ?auto_15854 ) ) ( not ( = ?auto_15832 ?auto_15834 ) ) ( not ( = ?auto_15832 ?auto_15854 ) ) ( not ( = ?auto_15834 ?auto_15869 ) ) ( not ( = ?auto_15834 ?auto_15868 ) ) ( not ( = ?auto_15834 ?auto_15864 ) ) ( not ( = ?auto_15877 ?auto_15863 ) ) ( not ( = ?auto_15877 ?auto_15871 ) ) ( not ( = ?auto_15877 ?auto_15844 ) ) ( not ( = ?auto_15872 ?auto_15856 ) ) ( not ( = ?auto_15872 ?auto_15861 ) ) ( not ( = ?auto_15872 ?auto_15846 ) ) ( not ( = ?auto_15854 ?auto_15869 ) ) ( not ( = ?auto_15854 ?auto_15868 ) ) ( not ( = ?auto_15854 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15835 ) ) ( not ( = ?auto_15830 ?auto_15858 ) ) ( not ( = ?auto_15831 ?auto_15835 ) ) ( not ( = ?auto_15831 ?auto_15858 ) ) ( not ( = ?auto_15832 ?auto_15835 ) ) ( not ( = ?auto_15832 ?auto_15858 ) ) ( not ( = ?auto_15833 ?auto_15835 ) ) ( not ( = ?auto_15833 ?auto_15858 ) ) ( not ( = ?auto_15835 ?auto_15854 ) ) ( not ( = ?auto_15835 ?auto_15869 ) ) ( not ( = ?auto_15835 ?auto_15868 ) ) ( not ( = ?auto_15835 ?auto_15864 ) ) ( not ( = ?auto_15874 ?auto_15877 ) ) ( not ( = ?auto_15874 ?auto_15863 ) ) ( not ( = ?auto_15874 ?auto_15871 ) ) ( not ( = ?auto_15874 ?auto_15844 ) ) ( not ( = ?auto_15878 ?auto_15872 ) ) ( not ( = ?auto_15878 ?auto_15856 ) ) ( not ( = ?auto_15878 ?auto_15861 ) ) ( not ( = ?auto_15878 ?auto_15846 ) ) ( not ( = ?auto_15858 ?auto_15854 ) ) ( not ( = ?auto_15858 ?auto_15869 ) ) ( not ( = ?auto_15858 ?auto_15868 ) ) ( not ( = ?auto_15858 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15836 ) ) ( not ( = ?auto_15830 ?auto_15880 ) ) ( not ( = ?auto_15831 ?auto_15836 ) ) ( not ( = ?auto_15831 ?auto_15880 ) ) ( not ( = ?auto_15832 ?auto_15836 ) ) ( not ( = ?auto_15832 ?auto_15880 ) ) ( not ( = ?auto_15833 ?auto_15836 ) ) ( not ( = ?auto_15833 ?auto_15880 ) ) ( not ( = ?auto_15834 ?auto_15836 ) ) ( not ( = ?auto_15834 ?auto_15880 ) ) ( not ( = ?auto_15836 ?auto_15858 ) ) ( not ( = ?auto_15836 ?auto_15854 ) ) ( not ( = ?auto_15836 ?auto_15869 ) ) ( not ( = ?auto_15836 ?auto_15868 ) ) ( not ( = ?auto_15836 ?auto_15864 ) ) ( not ( = ?auto_15865 ?auto_15874 ) ) ( not ( = ?auto_15865 ?auto_15877 ) ) ( not ( = ?auto_15865 ?auto_15863 ) ) ( not ( = ?auto_15865 ?auto_15871 ) ) ( not ( = ?auto_15865 ?auto_15844 ) ) ( not ( = ?auto_15859 ?auto_15878 ) ) ( not ( = ?auto_15859 ?auto_15872 ) ) ( not ( = ?auto_15859 ?auto_15856 ) ) ( not ( = ?auto_15859 ?auto_15861 ) ) ( not ( = ?auto_15859 ?auto_15846 ) ) ( not ( = ?auto_15880 ?auto_15858 ) ) ( not ( = ?auto_15880 ?auto_15854 ) ) ( not ( = ?auto_15880 ?auto_15869 ) ) ( not ( = ?auto_15880 ?auto_15868 ) ) ( not ( = ?auto_15880 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15837 ) ) ( not ( = ?auto_15830 ?auto_15870 ) ) ( not ( = ?auto_15831 ?auto_15837 ) ) ( not ( = ?auto_15831 ?auto_15870 ) ) ( not ( = ?auto_15832 ?auto_15837 ) ) ( not ( = ?auto_15832 ?auto_15870 ) ) ( not ( = ?auto_15833 ?auto_15837 ) ) ( not ( = ?auto_15833 ?auto_15870 ) ) ( not ( = ?auto_15834 ?auto_15837 ) ) ( not ( = ?auto_15834 ?auto_15870 ) ) ( not ( = ?auto_15835 ?auto_15837 ) ) ( not ( = ?auto_15835 ?auto_15870 ) ) ( not ( = ?auto_15837 ?auto_15880 ) ) ( not ( = ?auto_15837 ?auto_15858 ) ) ( not ( = ?auto_15837 ?auto_15854 ) ) ( not ( = ?auto_15837 ?auto_15869 ) ) ( not ( = ?auto_15837 ?auto_15868 ) ) ( not ( = ?auto_15837 ?auto_15864 ) ) ( not ( = ?auto_15860 ?auto_15865 ) ) ( not ( = ?auto_15860 ?auto_15874 ) ) ( not ( = ?auto_15860 ?auto_15877 ) ) ( not ( = ?auto_15860 ?auto_15863 ) ) ( not ( = ?auto_15860 ?auto_15871 ) ) ( not ( = ?auto_15860 ?auto_15844 ) ) ( not ( = ?auto_15876 ?auto_15859 ) ) ( not ( = ?auto_15876 ?auto_15878 ) ) ( not ( = ?auto_15876 ?auto_15872 ) ) ( not ( = ?auto_15876 ?auto_15856 ) ) ( not ( = ?auto_15876 ?auto_15861 ) ) ( not ( = ?auto_15876 ?auto_15846 ) ) ( not ( = ?auto_15870 ?auto_15880 ) ) ( not ( = ?auto_15870 ?auto_15858 ) ) ( not ( = ?auto_15870 ?auto_15854 ) ) ( not ( = ?auto_15870 ?auto_15869 ) ) ( not ( = ?auto_15870 ?auto_15868 ) ) ( not ( = ?auto_15870 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15838 ) ) ( not ( = ?auto_15830 ?auto_15873 ) ) ( not ( = ?auto_15831 ?auto_15838 ) ) ( not ( = ?auto_15831 ?auto_15873 ) ) ( not ( = ?auto_15832 ?auto_15838 ) ) ( not ( = ?auto_15832 ?auto_15873 ) ) ( not ( = ?auto_15833 ?auto_15838 ) ) ( not ( = ?auto_15833 ?auto_15873 ) ) ( not ( = ?auto_15834 ?auto_15838 ) ) ( not ( = ?auto_15834 ?auto_15873 ) ) ( not ( = ?auto_15835 ?auto_15838 ) ) ( not ( = ?auto_15835 ?auto_15873 ) ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( not ( = ?auto_15836 ?auto_15873 ) ) ( not ( = ?auto_15838 ?auto_15870 ) ) ( not ( = ?auto_15838 ?auto_15880 ) ) ( not ( = ?auto_15838 ?auto_15858 ) ) ( not ( = ?auto_15838 ?auto_15854 ) ) ( not ( = ?auto_15838 ?auto_15869 ) ) ( not ( = ?auto_15838 ?auto_15868 ) ) ( not ( = ?auto_15838 ?auto_15864 ) ) ( not ( = ?auto_15873 ?auto_15870 ) ) ( not ( = ?auto_15873 ?auto_15880 ) ) ( not ( = ?auto_15873 ?auto_15858 ) ) ( not ( = ?auto_15873 ?auto_15854 ) ) ( not ( = ?auto_15873 ?auto_15869 ) ) ( not ( = ?auto_15873 ?auto_15868 ) ) ( not ( = ?auto_15873 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15839 ) ) ( not ( = ?auto_15830 ?auto_15855 ) ) ( not ( = ?auto_15831 ?auto_15839 ) ) ( not ( = ?auto_15831 ?auto_15855 ) ) ( not ( = ?auto_15832 ?auto_15839 ) ) ( not ( = ?auto_15832 ?auto_15855 ) ) ( not ( = ?auto_15833 ?auto_15839 ) ) ( not ( = ?auto_15833 ?auto_15855 ) ) ( not ( = ?auto_15834 ?auto_15839 ) ) ( not ( = ?auto_15834 ?auto_15855 ) ) ( not ( = ?auto_15835 ?auto_15839 ) ) ( not ( = ?auto_15835 ?auto_15855 ) ) ( not ( = ?auto_15836 ?auto_15839 ) ) ( not ( = ?auto_15836 ?auto_15855 ) ) ( not ( = ?auto_15837 ?auto_15839 ) ) ( not ( = ?auto_15837 ?auto_15855 ) ) ( not ( = ?auto_15839 ?auto_15873 ) ) ( not ( = ?auto_15839 ?auto_15870 ) ) ( not ( = ?auto_15839 ?auto_15880 ) ) ( not ( = ?auto_15839 ?auto_15858 ) ) ( not ( = ?auto_15839 ?auto_15854 ) ) ( not ( = ?auto_15839 ?auto_15869 ) ) ( not ( = ?auto_15839 ?auto_15868 ) ) ( not ( = ?auto_15839 ?auto_15864 ) ) ( not ( = ?auto_15867 ?auto_15860 ) ) ( not ( = ?auto_15867 ?auto_15865 ) ) ( not ( = ?auto_15867 ?auto_15874 ) ) ( not ( = ?auto_15867 ?auto_15877 ) ) ( not ( = ?auto_15867 ?auto_15863 ) ) ( not ( = ?auto_15867 ?auto_15871 ) ) ( not ( = ?auto_15867 ?auto_15844 ) ) ( not ( = ?auto_15866 ?auto_15876 ) ) ( not ( = ?auto_15866 ?auto_15859 ) ) ( not ( = ?auto_15866 ?auto_15878 ) ) ( not ( = ?auto_15866 ?auto_15872 ) ) ( not ( = ?auto_15866 ?auto_15856 ) ) ( not ( = ?auto_15866 ?auto_15861 ) ) ( not ( = ?auto_15866 ?auto_15846 ) ) ( not ( = ?auto_15855 ?auto_15873 ) ) ( not ( = ?auto_15855 ?auto_15870 ) ) ( not ( = ?auto_15855 ?auto_15880 ) ) ( not ( = ?auto_15855 ?auto_15858 ) ) ( not ( = ?auto_15855 ?auto_15854 ) ) ( not ( = ?auto_15855 ?auto_15869 ) ) ( not ( = ?auto_15855 ?auto_15868 ) ) ( not ( = ?auto_15855 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15840 ) ) ( not ( = ?auto_15830 ?auto_15857 ) ) ( not ( = ?auto_15831 ?auto_15840 ) ) ( not ( = ?auto_15831 ?auto_15857 ) ) ( not ( = ?auto_15832 ?auto_15840 ) ) ( not ( = ?auto_15832 ?auto_15857 ) ) ( not ( = ?auto_15833 ?auto_15840 ) ) ( not ( = ?auto_15833 ?auto_15857 ) ) ( not ( = ?auto_15834 ?auto_15840 ) ) ( not ( = ?auto_15834 ?auto_15857 ) ) ( not ( = ?auto_15835 ?auto_15840 ) ) ( not ( = ?auto_15835 ?auto_15857 ) ) ( not ( = ?auto_15836 ?auto_15840 ) ) ( not ( = ?auto_15836 ?auto_15857 ) ) ( not ( = ?auto_15837 ?auto_15840 ) ) ( not ( = ?auto_15837 ?auto_15857 ) ) ( not ( = ?auto_15838 ?auto_15840 ) ) ( not ( = ?auto_15838 ?auto_15857 ) ) ( not ( = ?auto_15840 ?auto_15855 ) ) ( not ( = ?auto_15840 ?auto_15873 ) ) ( not ( = ?auto_15840 ?auto_15870 ) ) ( not ( = ?auto_15840 ?auto_15880 ) ) ( not ( = ?auto_15840 ?auto_15858 ) ) ( not ( = ?auto_15840 ?auto_15854 ) ) ( not ( = ?auto_15840 ?auto_15869 ) ) ( not ( = ?auto_15840 ?auto_15868 ) ) ( not ( = ?auto_15840 ?auto_15864 ) ) ( not ( = ?auto_15862 ?auto_15867 ) ) ( not ( = ?auto_15862 ?auto_15860 ) ) ( not ( = ?auto_15862 ?auto_15865 ) ) ( not ( = ?auto_15862 ?auto_15874 ) ) ( not ( = ?auto_15862 ?auto_15877 ) ) ( not ( = ?auto_15862 ?auto_15863 ) ) ( not ( = ?auto_15862 ?auto_15871 ) ) ( not ( = ?auto_15862 ?auto_15844 ) ) ( not ( = ?auto_15853 ?auto_15866 ) ) ( not ( = ?auto_15853 ?auto_15876 ) ) ( not ( = ?auto_15853 ?auto_15859 ) ) ( not ( = ?auto_15853 ?auto_15878 ) ) ( not ( = ?auto_15853 ?auto_15872 ) ) ( not ( = ?auto_15853 ?auto_15856 ) ) ( not ( = ?auto_15853 ?auto_15861 ) ) ( not ( = ?auto_15853 ?auto_15846 ) ) ( not ( = ?auto_15857 ?auto_15855 ) ) ( not ( = ?auto_15857 ?auto_15873 ) ) ( not ( = ?auto_15857 ?auto_15870 ) ) ( not ( = ?auto_15857 ?auto_15880 ) ) ( not ( = ?auto_15857 ?auto_15858 ) ) ( not ( = ?auto_15857 ?auto_15854 ) ) ( not ( = ?auto_15857 ?auto_15869 ) ) ( not ( = ?auto_15857 ?auto_15868 ) ) ( not ( = ?auto_15857 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15841 ) ) ( not ( = ?auto_15830 ?auto_15852 ) ) ( not ( = ?auto_15831 ?auto_15841 ) ) ( not ( = ?auto_15831 ?auto_15852 ) ) ( not ( = ?auto_15832 ?auto_15841 ) ) ( not ( = ?auto_15832 ?auto_15852 ) ) ( not ( = ?auto_15833 ?auto_15841 ) ) ( not ( = ?auto_15833 ?auto_15852 ) ) ( not ( = ?auto_15834 ?auto_15841 ) ) ( not ( = ?auto_15834 ?auto_15852 ) ) ( not ( = ?auto_15835 ?auto_15841 ) ) ( not ( = ?auto_15835 ?auto_15852 ) ) ( not ( = ?auto_15836 ?auto_15841 ) ) ( not ( = ?auto_15836 ?auto_15852 ) ) ( not ( = ?auto_15837 ?auto_15841 ) ) ( not ( = ?auto_15837 ?auto_15852 ) ) ( not ( = ?auto_15838 ?auto_15841 ) ) ( not ( = ?auto_15838 ?auto_15852 ) ) ( not ( = ?auto_15839 ?auto_15841 ) ) ( not ( = ?auto_15839 ?auto_15852 ) ) ( not ( = ?auto_15841 ?auto_15857 ) ) ( not ( = ?auto_15841 ?auto_15855 ) ) ( not ( = ?auto_15841 ?auto_15873 ) ) ( not ( = ?auto_15841 ?auto_15870 ) ) ( not ( = ?auto_15841 ?auto_15880 ) ) ( not ( = ?auto_15841 ?auto_15858 ) ) ( not ( = ?auto_15841 ?auto_15854 ) ) ( not ( = ?auto_15841 ?auto_15869 ) ) ( not ( = ?auto_15841 ?auto_15868 ) ) ( not ( = ?auto_15841 ?auto_15864 ) ) ( not ( = ?auto_15881 ?auto_15862 ) ) ( not ( = ?auto_15881 ?auto_15867 ) ) ( not ( = ?auto_15881 ?auto_15860 ) ) ( not ( = ?auto_15881 ?auto_15865 ) ) ( not ( = ?auto_15881 ?auto_15874 ) ) ( not ( = ?auto_15881 ?auto_15877 ) ) ( not ( = ?auto_15881 ?auto_15863 ) ) ( not ( = ?auto_15881 ?auto_15871 ) ) ( not ( = ?auto_15881 ?auto_15844 ) ) ( not ( = ?auto_15875 ?auto_15853 ) ) ( not ( = ?auto_15875 ?auto_15866 ) ) ( not ( = ?auto_15875 ?auto_15876 ) ) ( not ( = ?auto_15875 ?auto_15859 ) ) ( not ( = ?auto_15875 ?auto_15878 ) ) ( not ( = ?auto_15875 ?auto_15872 ) ) ( not ( = ?auto_15875 ?auto_15856 ) ) ( not ( = ?auto_15875 ?auto_15861 ) ) ( not ( = ?auto_15875 ?auto_15846 ) ) ( not ( = ?auto_15852 ?auto_15857 ) ) ( not ( = ?auto_15852 ?auto_15855 ) ) ( not ( = ?auto_15852 ?auto_15873 ) ) ( not ( = ?auto_15852 ?auto_15870 ) ) ( not ( = ?auto_15852 ?auto_15880 ) ) ( not ( = ?auto_15852 ?auto_15858 ) ) ( not ( = ?auto_15852 ?auto_15854 ) ) ( not ( = ?auto_15852 ?auto_15869 ) ) ( not ( = ?auto_15852 ?auto_15868 ) ) ( not ( = ?auto_15852 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15842 ) ) ( not ( = ?auto_15830 ?auto_15850 ) ) ( not ( = ?auto_15831 ?auto_15842 ) ) ( not ( = ?auto_15831 ?auto_15850 ) ) ( not ( = ?auto_15832 ?auto_15842 ) ) ( not ( = ?auto_15832 ?auto_15850 ) ) ( not ( = ?auto_15833 ?auto_15842 ) ) ( not ( = ?auto_15833 ?auto_15850 ) ) ( not ( = ?auto_15834 ?auto_15842 ) ) ( not ( = ?auto_15834 ?auto_15850 ) ) ( not ( = ?auto_15835 ?auto_15842 ) ) ( not ( = ?auto_15835 ?auto_15850 ) ) ( not ( = ?auto_15836 ?auto_15842 ) ) ( not ( = ?auto_15836 ?auto_15850 ) ) ( not ( = ?auto_15837 ?auto_15842 ) ) ( not ( = ?auto_15837 ?auto_15850 ) ) ( not ( = ?auto_15838 ?auto_15842 ) ) ( not ( = ?auto_15838 ?auto_15850 ) ) ( not ( = ?auto_15839 ?auto_15842 ) ) ( not ( = ?auto_15839 ?auto_15850 ) ) ( not ( = ?auto_15840 ?auto_15842 ) ) ( not ( = ?auto_15840 ?auto_15850 ) ) ( not ( = ?auto_15842 ?auto_15852 ) ) ( not ( = ?auto_15842 ?auto_15857 ) ) ( not ( = ?auto_15842 ?auto_15855 ) ) ( not ( = ?auto_15842 ?auto_15873 ) ) ( not ( = ?auto_15842 ?auto_15870 ) ) ( not ( = ?auto_15842 ?auto_15880 ) ) ( not ( = ?auto_15842 ?auto_15858 ) ) ( not ( = ?auto_15842 ?auto_15854 ) ) ( not ( = ?auto_15842 ?auto_15869 ) ) ( not ( = ?auto_15842 ?auto_15868 ) ) ( not ( = ?auto_15842 ?auto_15864 ) ) ( not ( = ?auto_15851 ?auto_15881 ) ) ( not ( = ?auto_15851 ?auto_15862 ) ) ( not ( = ?auto_15851 ?auto_15867 ) ) ( not ( = ?auto_15851 ?auto_15860 ) ) ( not ( = ?auto_15851 ?auto_15865 ) ) ( not ( = ?auto_15851 ?auto_15874 ) ) ( not ( = ?auto_15851 ?auto_15877 ) ) ( not ( = ?auto_15851 ?auto_15863 ) ) ( not ( = ?auto_15851 ?auto_15871 ) ) ( not ( = ?auto_15851 ?auto_15844 ) ) ( not ( = ?auto_15879 ?auto_15875 ) ) ( not ( = ?auto_15879 ?auto_15853 ) ) ( not ( = ?auto_15879 ?auto_15866 ) ) ( not ( = ?auto_15879 ?auto_15876 ) ) ( not ( = ?auto_15879 ?auto_15859 ) ) ( not ( = ?auto_15879 ?auto_15878 ) ) ( not ( = ?auto_15879 ?auto_15872 ) ) ( not ( = ?auto_15879 ?auto_15856 ) ) ( not ( = ?auto_15879 ?auto_15861 ) ) ( not ( = ?auto_15879 ?auto_15846 ) ) ( not ( = ?auto_15850 ?auto_15852 ) ) ( not ( = ?auto_15850 ?auto_15857 ) ) ( not ( = ?auto_15850 ?auto_15855 ) ) ( not ( = ?auto_15850 ?auto_15873 ) ) ( not ( = ?auto_15850 ?auto_15870 ) ) ( not ( = ?auto_15850 ?auto_15880 ) ) ( not ( = ?auto_15850 ?auto_15858 ) ) ( not ( = ?auto_15850 ?auto_15854 ) ) ( not ( = ?auto_15850 ?auto_15869 ) ) ( not ( = ?auto_15850 ?auto_15868 ) ) ( not ( = ?auto_15850 ?auto_15864 ) ) ( not ( = ?auto_15830 ?auto_15843 ) ) ( not ( = ?auto_15830 ?auto_15848 ) ) ( not ( = ?auto_15831 ?auto_15843 ) ) ( not ( = ?auto_15831 ?auto_15848 ) ) ( not ( = ?auto_15832 ?auto_15843 ) ) ( not ( = ?auto_15832 ?auto_15848 ) ) ( not ( = ?auto_15833 ?auto_15843 ) ) ( not ( = ?auto_15833 ?auto_15848 ) ) ( not ( = ?auto_15834 ?auto_15843 ) ) ( not ( = ?auto_15834 ?auto_15848 ) ) ( not ( = ?auto_15835 ?auto_15843 ) ) ( not ( = ?auto_15835 ?auto_15848 ) ) ( not ( = ?auto_15836 ?auto_15843 ) ) ( not ( = ?auto_15836 ?auto_15848 ) ) ( not ( = ?auto_15837 ?auto_15843 ) ) ( not ( = ?auto_15837 ?auto_15848 ) ) ( not ( = ?auto_15838 ?auto_15843 ) ) ( not ( = ?auto_15838 ?auto_15848 ) ) ( not ( = ?auto_15839 ?auto_15843 ) ) ( not ( = ?auto_15839 ?auto_15848 ) ) ( not ( = ?auto_15840 ?auto_15843 ) ) ( not ( = ?auto_15840 ?auto_15848 ) ) ( not ( = ?auto_15841 ?auto_15843 ) ) ( not ( = ?auto_15841 ?auto_15848 ) ) ( not ( = ?auto_15843 ?auto_15850 ) ) ( not ( = ?auto_15843 ?auto_15852 ) ) ( not ( = ?auto_15843 ?auto_15857 ) ) ( not ( = ?auto_15843 ?auto_15855 ) ) ( not ( = ?auto_15843 ?auto_15873 ) ) ( not ( = ?auto_15843 ?auto_15870 ) ) ( not ( = ?auto_15843 ?auto_15880 ) ) ( not ( = ?auto_15843 ?auto_15858 ) ) ( not ( = ?auto_15843 ?auto_15854 ) ) ( not ( = ?auto_15843 ?auto_15869 ) ) ( not ( = ?auto_15843 ?auto_15868 ) ) ( not ( = ?auto_15843 ?auto_15864 ) ) ( not ( = ?auto_15848 ?auto_15850 ) ) ( not ( = ?auto_15848 ?auto_15852 ) ) ( not ( = ?auto_15848 ?auto_15857 ) ) ( not ( = ?auto_15848 ?auto_15855 ) ) ( not ( = ?auto_15848 ?auto_15873 ) ) ( not ( = ?auto_15848 ?auto_15870 ) ) ( not ( = ?auto_15848 ?auto_15880 ) ) ( not ( = ?auto_15848 ?auto_15858 ) ) ( not ( = ?auto_15848 ?auto_15854 ) ) ( not ( = ?auto_15848 ?auto_15869 ) ) ( not ( = ?auto_15848 ?auto_15868 ) ) ( not ( = ?auto_15848 ?auto_15864 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15830 ?auto_15831 ?auto_15832 ?auto_15833 ?auto_15834 ?auto_15835 ?auto_15836 ?auto_15837 ?auto_15838 ?auto_15839 ?auto_15840 ?auto_15841 ?auto_15842 )
      ( MAKE-1CRATE ?auto_15842 ?auto_15843 )
      ( MAKE-13CRATE-VERIFY ?auto_15830 ?auto_15831 ?auto_15832 ?auto_15833 ?auto_15834 ?auto_15835 ?auto_15836 ?auto_15837 ?auto_15838 ?auto_15839 ?auto_15840 ?auto_15841 ?auto_15842 ?auto_15843 ) )
  )

)

