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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15268 - SURFACE
      ?auto_15269 - SURFACE
    )
    :vars
    (
      ?auto_15270 - HOIST
      ?auto_15271 - PLACE
      ?auto_15273 - PLACE
      ?auto_15274 - HOIST
      ?auto_15275 - SURFACE
      ?auto_15272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15270 ?auto_15271 ) ( SURFACE-AT ?auto_15268 ?auto_15271 ) ( CLEAR ?auto_15268 ) ( IS-CRATE ?auto_15269 ) ( AVAILABLE ?auto_15270 ) ( not ( = ?auto_15273 ?auto_15271 ) ) ( HOIST-AT ?auto_15274 ?auto_15273 ) ( AVAILABLE ?auto_15274 ) ( SURFACE-AT ?auto_15269 ?auto_15273 ) ( ON ?auto_15269 ?auto_15275 ) ( CLEAR ?auto_15269 ) ( TRUCK-AT ?auto_15272 ?auto_15271 ) ( not ( = ?auto_15268 ?auto_15269 ) ) ( not ( = ?auto_15268 ?auto_15275 ) ) ( not ( = ?auto_15269 ?auto_15275 ) ) ( not ( = ?auto_15270 ?auto_15274 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15272 ?auto_15271 ?auto_15273 )
      ( !LIFT ?auto_15274 ?auto_15269 ?auto_15275 ?auto_15273 )
      ( !LOAD ?auto_15274 ?auto_15269 ?auto_15272 ?auto_15273 )
      ( !DRIVE ?auto_15272 ?auto_15273 ?auto_15271 )
      ( !UNLOAD ?auto_15270 ?auto_15269 ?auto_15272 ?auto_15271 )
      ( !DROP ?auto_15270 ?auto_15269 ?auto_15268 ?auto_15271 )
      ( MAKE-1CRATE-VERIFY ?auto_15268 ?auto_15269 ) )
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
      ?auto_15285 - HOIST
      ?auto_15282 - PLACE
      ?auto_15283 - PLACE
      ?auto_15284 - HOIST
      ?auto_15287 - SURFACE
      ?auto_15290 - PLACE
      ?auto_15288 - HOIST
      ?auto_15289 - SURFACE
      ?auto_15286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15285 ?auto_15282 ) ( IS-CRATE ?auto_15281 ) ( not ( = ?auto_15283 ?auto_15282 ) ) ( HOIST-AT ?auto_15284 ?auto_15283 ) ( AVAILABLE ?auto_15284 ) ( SURFACE-AT ?auto_15281 ?auto_15283 ) ( ON ?auto_15281 ?auto_15287 ) ( CLEAR ?auto_15281 ) ( not ( = ?auto_15280 ?auto_15281 ) ) ( not ( = ?auto_15280 ?auto_15287 ) ) ( not ( = ?auto_15281 ?auto_15287 ) ) ( not ( = ?auto_15285 ?auto_15284 ) ) ( SURFACE-AT ?auto_15279 ?auto_15282 ) ( CLEAR ?auto_15279 ) ( IS-CRATE ?auto_15280 ) ( AVAILABLE ?auto_15285 ) ( not ( = ?auto_15290 ?auto_15282 ) ) ( HOIST-AT ?auto_15288 ?auto_15290 ) ( AVAILABLE ?auto_15288 ) ( SURFACE-AT ?auto_15280 ?auto_15290 ) ( ON ?auto_15280 ?auto_15289 ) ( CLEAR ?auto_15280 ) ( TRUCK-AT ?auto_15286 ?auto_15282 ) ( not ( = ?auto_15279 ?auto_15280 ) ) ( not ( = ?auto_15279 ?auto_15289 ) ) ( not ( = ?auto_15280 ?auto_15289 ) ) ( not ( = ?auto_15285 ?auto_15288 ) ) ( not ( = ?auto_15279 ?auto_15281 ) ) ( not ( = ?auto_15279 ?auto_15287 ) ) ( not ( = ?auto_15281 ?auto_15289 ) ) ( not ( = ?auto_15283 ?auto_15290 ) ) ( not ( = ?auto_15284 ?auto_15288 ) ) ( not ( = ?auto_15287 ?auto_15289 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15279 ?auto_15280 )
      ( MAKE-1CRATE ?auto_15280 ?auto_15281 )
      ( MAKE-2CRATE-VERIFY ?auto_15279 ?auto_15280 ?auto_15281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15293 - SURFACE
      ?auto_15294 - SURFACE
    )
    :vars
    (
      ?auto_15295 - HOIST
      ?auto_15296 - PLACE
      ?auto_15298 - PLACE
      ?auto_15299 - HOIST
      ?auto_15300 - SURFACE
      ?auto_15297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15295 ?auto_15296 ) ( SURFACE-AT ?auto_15293 ?auto_15296 ) ( CLEAR ?auto_15293 ) ( IS-CRATE ?auto_15294 ) ( AVAILABLE ?auto_15295 ) ( not ( = ?auto_15298 ?auto_15296 ) ) ( HOIST-AT ?auto_15299 ?auto_15298 ) ( AVAILABLE ?auto_15299 ) ( SURFACE-AT ?auto_15294 ?auto_15298 ) ( ON ?auto_15294 ?auto_15300 ) ( CLEAR ?auto_15294 ) ( TRUCK-AT ?auto_15297 ?auto_15296 ) ( not ( = ?auto_15293 ?auto_15294 ) ) ( not ( = ?auto_15293 ?auto_15300 ) ) ( not ( = ?auto_15294 ?auto_15300 ) ) ( not ( = ?auto_15295 ?auto_15299 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15297 ?auto_15296 ?auto_15298 )
      ( !LIFT ?auto_15299 ?auto_15294 ?auto_15300 ?auto_15298 )
      ( !LOAD ?auto_15299 ?auto_15294 ?auto_15297 ?auto_15298 )
      ( !DRIVE ?auto_15297 ?auto_15298 ?auto_15296 )
      ( !UNLOAD ?auto_15295 ?auto_15294 ?auto_15297 ?auto_15296 )
      ( !DROP ?auto_15295 ?auto_15294 ?auto_15293 ?auto_15296 )
      ( MAKE-1CRATE-VERIFY ?auto_15293 ?auto_15294 ) )
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
      ?auto_15314 - HOIST
      ?auto_15310 - PLACE
      ?auto_15309 - PLACE
      ?auto_15311 - HOIST
      ?auto_15312 - SURFACE
      ?auto_15320 - PLACE
      ?auto_15319 - HOIST
      ?auto_15318 - SURFACE
      ?auto_15317 - PLACE
      ?auto_15316 - HOIST
      ?auto_15315 - SURFACE
      ?auto_15313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15314 ?auto_15310 ) ( IS-CRATE ?auto_15308 ) ( not ( = ?auto_15309 ?auto_15310 ) ) ( HOIST-AT ?auto_15311 ?auto_15309 ) ( AVAILABLE ?auto_15311 ) ( SURFACE-AT ?auto_15308 ?auto_15309 ) ( ON ?auto_15308 ?auto_15312 ) ( CLEAR ?auto_15308 ) ( not ( = ?auto_15307 ?auto_15308 ) ) ( not ( = ?auto_15307 ?auto_15312 ) ) ( not ( = ?auto_15308 ?auto_15312 ) ) ( not ( = ?auto_15314 ?auto_15311 ) ) ( IS-CRATE ?auto_15307 ) ( not ( = ?auto_15320 ?auto_15310 ) ) ( HOIST-AT ?auto_15319 ?auto_15320 ) ( AVAILABLE ?auto_15319 ) ( SURFACE-AT ?auto_15307 ?auto_15320 ) ( ON ?auto_15307 ?auto_15318 ) ( CLEAR ?auto_15307 ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15318 ) ) ( not ( = ?auto_15307 ?auto_15318 ) ) ( not ( = ?auto_15314 ?auto_15319 ) ) ( SURFACE-AT ?auto_15305 ?auto_15310 ) ( CLEAR ?auto_15305 ) ( IS-CRATE ?auto_15306 ) ( AVAILABLE ?auto_15314 ) ( not ( = ?auto_15317 ?auto_15310 ) ) ( HOIST-AT ?auto_15316 ?auto_15317 ) ( AVAILABLE ?auto_15316 ) ( SURFACE-AT ?auto_15306 ?auto_15317 ) ( ON ?auto_15306 ?auto_15315 ) ( CLEAR ?auto_15306 ) ( TRUCK-AT ?auto_15313 ?auto_15310 ) ( not ( = ?auto_15305 ?auto_15306 ) ) ( not ( = ?auto_15305 ?auto_15315 ) ) ( not ( = ?auto_15306 ?auto_15315 ) ) ( not ( = ?auto_15314 ?auto_15316 ) ) ( not ( = ?auto_15305 ?auto_15307 ) ) ( not ( = ?auto_15305 ?auto_15318 ) ) ( not ( = ?auto_15307 ?auto_15315 ) ) ( not ( = ?auto_15320 ?auto_15317 ) ) ( not ( = ?auto_15319 ?auto_15316 ) ) ( not ( = ?auto_15318 ?auto_15315 ) ) ( not ( = ?auto_15305 ?auto_15308 ) ) ( not ( = ?auto_15305 ?auto_15312 ) ) ( not ( = ?auto_15306 ?auto_15308 ) ) ( not ( = ?auto_15306 ?auto_15312 ) ) ( not ( = ?auto_15308 ?auto_15318 ) ) ( not ( = ?auto_15308 ?auto_15315 ) ) ( not ( = ?auto_15309 ?auto_15320 ) ) ( not ( = ?auto_15309 ?auto_15317 ) ) ( not ( = ?auto_15311 ?auto_15319 ) ) ( not ( = ?auto_15311 ?auto_15316 ) ) ( not ( = ?auto_15312 ?auto_15318 ) ) ( not ( = ?auto_15312 ?auto_15315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15305 ?auto_15306 ?auto_15307 )
      ( MAKE-1CRATE ?auto_15307 ?auto_15308 )
      ( MAKE-3CRATE-VERIFY ?auto_15305 ?auto_15306 ?auto_15307 ?auto_15308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15323 - SURFACE
      ?auto_15324 - SURFACE
    )
    :vars
    (
      ?auto_15325 - HOIST
      ?auto_15326 - PLACE
      ?auto_15328 - PLACE
      ?auto_15329 - HOIST
      ?auto_15330 - SURFACE
      ?auto_15327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15325 ?auto_15326 ) ( SURFACE-AT ?auto_15323 ?auto_15326 ) ( CLEAR ?auto_15323 ) ( IS-CRATE ?auto_15324 ) ( AVAILABLE ?auto_15325 ) ( not ( = ?auto_15328 ?auto_15326 ) ) ( HOIST-AT ?auto_15329 ?auto_15328 ) ( AVAILABLE ?auto_15329 ) ( SURFACE-AT ?auto_15324 ?auto_15328 ) ( ON ?auto_15324 ?auto_15330 ) ( CLEAR ?auto_15324 ) ( TRUCK-AT ?auto_15327 ?auto_15326 ) ( not ( = ?auto_15323 ?auto_15324 ) ) ( not ( = ?auto_15323 ?auto_15330 ) ) ( not ( = ?auto_15324 ?auto_15330 ) ) ( not ( = ?auto_15325 ?auto_15329 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15327 ?auto_15326 ?auto_15328 )
      ( !LIFT ?auto_15329 ?auto_15324 ?auto_15330 ?auto_15328 )
      ( !LOAD ?auto_15329 ?auto_15324 ?auto_15327 ?auto_15328 )
      ( !DRIVE ?auto_15327 ?auto_15328 ?auto_15326 )
      ( !UNLOAD ?auto_15325 ?auto_15324 ?auto_15327 ?auto_15326 )
      ( !DROP ?auto_15325 ?auto_15324 ?auto_15323 ?auto_15326 )
      ( MAKE-1CRATE-VERIFY ?auto_15323 ?auto_15324 ) )
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
      ?auto_15341 - HOIST
      ?auto_15343 - PLACE
      ?auto_15346 - PLACE
      ?auto_15344 - HOIST
      ?auto_15342 - SURFACE
      ?auto_15353 - PLACE
      ?auto_15355 - HOIST
      ?auto_15351 - SURFACE
      ?auto_15350 - PLACE
      ?auto_15349 - HOIST
      ?auto_15352 - SURFACE
      ?auto_15348 - PLACE
      ?auto_15347 - HOIST
      ?auto_15354 - SURFACE
      ?auto_15345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15341 ?auto_15343 ) ( IS-CRATE ?auto_15340 ) ( not ( = ?auto_15346 ?auto_15343 ) ) ( HOIST-AT ?auto_15344 ?auto_15346 ) ( AVAILABLE ?auto_15344 ) ( SURFACE-AT ?auto_15340 ?auto_15346 ) ( ON ?auto_15340 ?auto_15342 ) ( CLEAR ?auto_15340 ) ( not ( = ?auto_15339 ?auto_15340 ) ) ( not ( = ?auto_15339 ?auto_15342 ) ) ( not ( = ?auto_15340 ?auto_15342 ) ) ( not ( = ?auto_15341 ?auto_15344 ) ) ( IS-CRATE ?auto_15339 ) ( not ( = ?auto_15353 ?auto_15343 ) ) ( HOIST-AT ?auto_15355 ?auto_15353 ) ( AVAILABLE ?auto_15355 ) ( SURFACE-AT ?auto_15339 ?auto_15353 ) ( ON ?auto_15339 ?auto_15351 ) ( CLEAR ?auto_15339 ) ( not ( = ?auto_15338 ?auto_15339 ) ) ( not ( = ?auto_15338 ?auto_15351 ) ) ( not ( = ?auto_15339 ?auto_15351 ) ) ( not ( = ?auto_15341 ?auto_15355 ) ) ( IS-CRATE ?auto_15338 ) ( not ( = ?auto_15350 ?auto_15343 ) ) ( HOIST-AT ?auto_15349 ?auto_15350 ) ( AVAILABLE ?auto_15349 ) ( SURFACE-AT ?auto_15338 ?auto_15350 ) ( ON ?auto_15338 ?auto_15352 ) ( CLEAR ?auto_15338 ) ( not ( = ?auto_15337 ?auto_15338 ) ) ( not ( = ?auto_15337 ?auto_15352 ) ) ( not ( = ?auto_15338 ?auto_15352 ) ) ( not ( = ?auto_15341 ?auto_15349 ) ) ( SURFACE-AT ?auto_15336 ?auto_15343 ) ( CLEAR ?auto_15336 ) ( IS-CRATE ?auto_15337 ) ( AVAILABLE ?auto_15341 ) ( not ( = ?auto_15348 ?auto_15343 ) ) ( HOIST-AT ?auto_15347 ?auto_15348 ) ( AVAILABLE ?auto_15347 ) ( SURFACE-AT ?auto_15337 ?auto_15348 ) ( ON ?auto_15337 ?auto_15354 ) ( CLEAR ?auto_15337 ) ( TRUCK-AT ?auto_15345 ?auto_15343 ) ( not ( = ?auto_15336 ?auto_15337 ) ) ( not ( = ?auto_15336 ?auto_15354 ) ) ( not ( = ?auto_15337 ?auto_15354 ) ) ( not ( = ?auto_15341 ?auto_15347 ) ) ( not ( = ?auto_15336 ?auto_15338 ) ) ( not ( = ?auto_15336 ?auto_15352 ) ) ( not ( = ?auto_15338 ?auto_15354 ) ) ( not ( = ?auto_15350 ?auto_15348 ) ) ( not ( = ?auto_15349 ?auto_15347 ) ) ( not ( = ?auto_15352 ?auto_15354 ) ) ( not ( = ?auto_15336 ?auto_15339 ) ) ( not ( = ?auto_15336 ?auto_15351 ) ) ( not ( = ?auto_15337 ?auto_15339 ) ) ( not ( = ?auto_15337 ?auto_15351 ) ) ( not ( = ?auto_15339 ?auto_15352 ) ) ( not ( = ?auto_15339 ?auto_15354 ) ) ( not ( = ?auto_15353 ?auto_15350 ) ) ( not ( = ?auto_15353 ?auto_15348 ) ) ( not ( = ?auto_15355 ?auto_15349 ) ) ( not ( = ?auto_15355 ?auto_15347 ) ) ( not ( = ?auto_15351 ?auto_15352 ) ) ( not ( = ?auto_15351 ?auto_15354 ) ) ( not ( = ?auto_15336 ?auto_15340 ) ) ( not ( = ?auto_15336 ?auto_15342 ) ) ( not ( = ?auto_15337 ?auto_15340 ) ) ( not ( = ?auto_15337 ?auto_15342 ) ) ( not ( = ?auto_15338 ?auto_15340 ) ) ( not ( = ?auto_15338 ?auto_15342 ) ) ( not ( = ?auto_15340 ?auto_15351 ) ) ( not ( = ?auto_15340 ?auto_15352 ) ) ( not ( = ?auto_15340 ?auto_15354 ) ) ( not ( = ?auto_15346 ?auto_15353 ) ) ( not ( = ?auto_15346 ?auto_15350 ) ) ( not ( = ?auto_15346 ?auto_15348 ) ) ( not ( = ?auto_15344 ?auto_15355 ) ) ( not ( = ?auto_15344 ?auto_15349 ) ) ( not ( = ?auto_15344 ?auto_15347 ) ) ( not ( = ?auto_15342 ?auto_15351 ) ) ( not ( = ?auto_15342 ?auto_15352 ) ) ( not ( = ?auto_15342 ?auto_15354 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15336 ?auto_15337 ?auto_15338 ?auto_15339 )
      ( MAKE-1CRATE ?auto_15339 ?auto_15340 )
      ( MAKE-4CRATE-VERIFY ?auto_15336 ?auto_15337 ?auto_15338 ?auto_15339 ?auto_15340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15358 - SURFACE
      ?auto_15359 - SURFACE
    )
    :vars
    (
      ?auto_15360 - HOIST
      ?auto_15361 - PLACE
      ?auto_15363 - PLACE
      ?auto_15364 - HOIST
      ?auto_15365 - SURFACE
      ?auto_15362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15360 ?auto_15361 ) ( SURFACE-AT ?auto_15358 ?auto_15361 ) ( CLEAR ?auto_15358 ) ( IS-CRATE ?auto_15359 ) ( AVAILABLE ?auto_15360 ) ( not ( = ?auto_15363 ?auto_15361 ) ) ( HOIST-AT ?auto_15364 ?auto_15363 ) ( AVAILABLE ?auto_15364 ) ( SURFACE-AT ?auto_15359 ?auto_15363 ) ( ON ?auto_15359 ?auto_15365 ) ( CLEAR ?auto_15359 ) ( TRUCK-AT ?auto_15362 ?auto_15361 ) ( not ( = ?auto_15358 ?auto_15359 ) ) ( not ( = ?auto_15358 ?auto_15365 ) ) ( not ( = ?auto_15359 ?auto_15365 ) ) ( not ( = ?auto_15360 ?auto_15364 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15362 ?auto_15361 ?auto_15363 )
      ( !LIFT ?auto_15364 ?auto_15359 ?auto_15365 ?auto_15363 )
      ( !LOAD ?auto_15364 ?auto_15359 ?auto_15362 ?auto_15363 )
      ( !DRIVE ?auto_15362 ?auto_15363 ?auto_15361 )
      ( !UNLOAD ?auto_15360 ?auto_15359 ?auto_15362 ?auto_15361 )
      ( !DROP ?auto_15360 ?auto_15359 ?auto_15358 ?auto_15361 )
      ( MAKE-1CRATE-VERIFY ?auto_15358 ?auto_15359 ) )
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
      ?auto_15383 - PLACE
      ?auto_15380 - PLACE
      ?auto_15378 - HOIST
      ?auto_15382 - SURFACE
      ?auto_15388 - PLACE
      ?auto_15394 - HOIST
      ?auto_15384 - SURFACE
      ?auto_15390 - PLACE
      ?auto_15393 - HOIST
      ?auto_15392 - SURFACE
      ?auto_15389 - PLACE
      ?auto_15387 - HOIST
      ?auto_15391 - SURFACE
      ?auto_15395 - PLACE
      ?auto_15385 - HOIST
      ?auto_15386 - SURFACE
      ?auto_15381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15379 ?auto_15383 ) ( IS-CRATE ?auto_15377 ) ( not ( = ?auto_15380 ?auto_15383 ) ) ( HOIST-AT ?auto_15378 ?auto_15380 ) ( AVAILABLE ?auto_15378 ) ( SURFACE-AT ?auto_15377 ?auto_15380 ) ( ON ?auto_15377 ?auto_15382 ) ( CLEAR ?auto_15377 ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15382 ) ) ( not ( = ?auto_15377 ?auto_15382 ) ) ( not ( = ?auto_15379 ?auto_15378 ) ) ( IS-CRATE ?auto_15376 ) ( not ( = ?auto_15388 ?auto_15383 ) ) ( HOIST-AT ?auto_15394 ?auto_15388 ) ( AVAILABLE ?auto_15394 ) ( SURFACE-AT ?auto_15376 ?auto_15388 ) ( ON ?auto_15376 ?auto_15384 ) ( CLEAR ?auto_15376 ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15384 ) ) ( not ( = ?auto_15376 ?auto_15384 ) ) ( not ( = ?auto_15379 ?auto_15394 ) ) ( IS-CRATE ?auto_15375 ) ( not ( = ?auto_15390 ?auto_15383 ) ) ( HOIST-AT ?auto_15393 ?auto_15390 ) ( AVAILABLE ?auto_15393 ) ( SURFACE-AT ?auto_15375 ?auto_15390 ) ( ON ?auto_15375 ?auto_15392 ) ( CLEAR ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15392 ) ) ( not ( = ?auto_15375 ?auto_15392 ) ) ( not ( = ?auto_15379 ?auto_15393 ) ) ( IS-CRATE ?auto_15374 ) ( not ( = ?auto_15389 ?auto_15383 ) ) ( HOIST-AT ?auto_15387 ?auto_15389 ) ( AVAILABLE ?auto_15387 ) ( SURFACE-AT ?auto_15374 ?auto_15389 ) ( ON ?auto_15374 ?auto_15391 ) ( CLEAR ?auto_15374 ) ( not ( = ?auto_15373 ?auto_15374 ) ) ( not ( = ?auto_15373 ?auto_15391 ) ) ( not ( = ?auto_15374 ?auto_15391 ) ) ( not ( = ?auto_15379 ?auto_15387 ) ) ( SURFACE-AT ?auto_15372 ?auto_15383 ) ( CLEAR ?auto_15372 ) ( IS-CRATE ?auto_15373 ) ( AVAILABLE ?auto_15379 ) ( not ( = ?auto_15395 ?auto_15383 ) ) ( HOIST-AT ?auto_15385 ?auto_15395 ) ( AVAILABLE ?auto_15385 ) ( SURFACE-AT ?auto_15373 ?auto_15395 ) ( ON ?auto_15373 ?auto_15386 ) ( CLEAR ?auto_15373 ) ( TRUCK-AT ?auto_15381 ?auto_15383 ) ( not ( = ?auto_15372 ?auto_15373 ) ) ( not ( = ?auto_15372 ?auto_15386 ) ) ( not ( = ?auto_15373 ?auto_15386 ) ) ( not ( = ?auto_15379 ?auto_15385 ) ) ( not ( = ?auto_15372 ?auto_15374 ) ) ( not ( = ?auto_15372 ?auto_15391 ) ) ( not ( = ?auto_15374 ?auto_15386 ) ) ( not ( = ?auto_15389 ?auto_15395 ) ) ( not ( = ?auto_15387 ?auto_15385 ) ) ( not ( = ?auto_15391 ?auto_15386 ) ) ( not ( = ?auto_15372 ?auto_15375 ) ) ( not ( = ?auto_15372 ?auto_15392 ) ) ( not ( = ?auto_15373 ?auto_15375 ) ) ( not ( = ?auto_15373 ?auto_15392 ) ) ( not ( = ?auto_15375 ?auto_15391 ) ) ( not ( = ?auto_15375 ?auto_15386 ) ) ( not ( = ?auto_15390 ?auto_15389 ) ) ( not ( = ?auto_15390 ?auto_15395 ) ) ( not ( = ?auto_15393 ?auto_15387 ) ) ( not ( = ?auto_15393 ?auto_15385 ) ) ( not ( = ?auto_15392 ?auto_15391 ) ) ( not ( = ?auto_15392 ?auto_15386 ) ) ( not ( = ?auto_15372 ?auto_15376 ) ) ( not ( = ?auto_15372 ?auto_15384 ) ) ( not ( = ?auto_15373 ?auto_15376 ) ) ( not ( = ?auto_15373 ?auto_15384 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15384 ) ) ( not ( = ?auto_15376 ?auto_15392 ) ) ( not ( = ?auto_15376 ?auto_15391 ) ) ( not ( = ?auto_15376 ?auto_15386 ) ) ( not ( = ?auto_15388 ?auto_15390 ) ) ( not ( = ?auto_15388 ?auto_15389 ) ) ( not ( = ?auto_15388 ?auto_15395 ) ) ( not ( = ?auto_15394 ?auto_15393 ) ) ( not ( = ?auto_15394 ?auto_15387 ) ) ( not ( = ?auto_15394 ?auto_15385 ) ) ( not ( = ?auto_15384 ?auto_15392 ) ) ( not ( = ?auto_15384 ?auto_15391 ) ) ( not ( = ?auto_15384 ?auto_15386 ) ) ( not ( = ?auto_15372 ?auto_15377 ) ) ( not ( = ?auto_15372 ?auto_15382 ) ) ( not ( = ?auto_15373 ?auto_15377 ) ) ( not ( = ?auto_15373 ?auto_15382 ) ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( not ( = ?auto_15374 ?auto_15382 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15382 ) ) ( not ( = ?auto_15377 ?auto_15384 ) ) ( not ( = ?auto_15377 ?auto_15392 ) ) ( not ( = ?auto_15377 ?auto_15391 ) ) ( not ( = ?auto_15377 ?auto_15386 ) ) ( not ( = ?auto_15380 ?auto_15388 ) ) ( not ( = ?auto_15380 ?auto_15390 ) ) ( not ( = ?auto_15380 ?auto_15389 ) ) ( not ( = ?auto_15380 ?auto_15395 ) ) ( not ( = ?auto_15378 ?auto_15394 ) ) ( not ( = ?auto_15378 ?auto_15393 ) ) ( not ( = ?auto_15378 ?auto_15387 ) ) ( not ( = ?auto_15378 ?auto_15385 ) ) ( not ( = ?auto_15382 ?auto_15384 ) ) ( not ( = ?auto_15382 ?auto_15392 ) ) ( not ( = ?auto_15382 ?auto_15391 ) ) ( not ( = ?auto_15382 ?auto_15386 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 )
      ( MAKE-1CRATE ?auto_15376 ?auto_15377 )
      ( MAKE-5CRATE-VERIFY ?auto_15372 ?auto_15373 ?auto_15374 ?auto_15375 ?auto_15376 ?auto_15377 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15398 - SURFACE
      ?auto_15399 - SURFACE
    )
    :vars
    (
      ?auto_15400 - HOIST
      ?auto_15401 - PLACE
      ?auto_15403 - PLACE
      ?auto_15404 - HOIST
      ?auto_15405 - SURFACE
      ?auto_15402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15400 ?auto_15401 ) ( SURFACE-AT ?auto_15398 ?auto_15401 ) ( CLEAR ?auto_15398 ) ( IS-CRATE ?auto_15399 ) ( AVAILABLE ?auto_15400 ) ( not ( = ?auto_15403 ?auto_15401 ) ) ( HOIST-AT ?auto_15404 ?auto_15403 ) ( AVAILABLE ?auto_15404 ) ( SURFACE-AT ?auto_15399 ?auto_15403 ) ( ON ?auto_15399 ?auto_15405 ) ( CLEAR ?auto_15399 ) ( TRUCK-AT ?auto_15402 ?auto_15401 ) ( not ( = ?auto_15398 ?auto_15399 ) ) ( not ( = ?auto_15398 ?auto_15405 ) ) ( not ( = ?auto_15399 ?auto_15405 ) ) ( not ( = ?auto_15400 ?auto_15404 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15402 ?auto_15401 ?auto_15403 )
      ( !LIFT ?auto_15404 ?auto_15399 ?auto_15405 ?auto_15403 )
      ( !LOAD ?auto_15404 ?auto_15399 ?auto_15402 ?auto_15403 )
      ( !DRIVE ?auto_15402 ?auto_15403 ?auto_15401 )
      ( !UNLOAD ?auto_15400 ?auto_15399 ?auto_15402 ?auto_15401 )
      ( !DROP ?auto_15400 ?auto_15399 ?auto_15398 ?auto_15401 )
      ( MAKE-1CRATE-VERIFY ?auto_15398 ?auto_15399 ) )
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
      ?auto_15423 - HOIST
      ?auto_15421 - PLACE
      ?auto_15425 - PLACE
      ?auto_15420 - HOIST
      ?auto_15424 - SURFACE
      ?auto_15434 - PLACE
      ?auto_15430 - HOIST
      ?auto_15426 - SURFACE
      ?auto_15440 - PLACE
      ?auto_15431 - HOIST
      ?auto_15432 - SURFACE
      ?auto_15438 - PLACE
      ?auto_15433 - HOIST
      ?auto_15429 - SURFACE
      ?auto_15439 - PLACE
      ?auto_15428 - HOIST
      ?auto_15437 - SURFACE
      ?auto_15436 - PLACE
      ?auto_15427 - HOIST
      ?auto_15435 - SURFACE
      ?auto_15422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15423 ?auto_15421 ) ( IS-CRATE ?auto_15419 ) ( not ( = ?auto_15425 ?auto_15421 ) ) ( HOIST-AT ?auto_15420 ?auto_15425 ) ( AVAILABLE ?auto_15420 ) ( SURFACE-AT ?auto_15419 ?auto_15425 ) ( ON ?auto_15419 ?auto_15424 ) ( CLEAR ?auto_15419 ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15424 ) ) ( not ( = ?auto_15419 ?auto_15424 ) ) ( not ( = ?auto_15423 ?auto_15420 ) ) ( IS-CRATE ?auto_15418 ) ( not ( = ?auto_15434 ?auto_15421 ) ) ( HOIST-AT ?auto_15430 ?auto_15434 ) ( AVAILABLE ?auto_15430 ) ( SURFACE-AT ?auto_15418 ?auto_15434 ) ( ON ?auto_15418 ?auto_15426 ) ( CLEAR ?auto_15418 ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15426 ) ) ( not ( = ?auto_15418 ?auto_15426 ) ) ( not ( = ?auto_15423 ?auto_15430 ) ) ( IS-CRATE ?auto_15417 ) ( not ( = ?auto_15440 ?auto_15421 ) ) ( HOIST-AT ?auto_15431 ?auto_15440 ) ( AVAILABLE ?auto_15431 ) ( SURFACE-AT ?auto_15417 ?auto_15440 ) ( ON ?auto_15417 ?auto_15432 ) ( CLEAR ?auto_15417 ) ( not ( = ?auto_15416 ?auto_15417 ) ) ( not ( = ?auto_15416 ?auto_15432 ) ) ( not ( = ?auto_15417 ?auto_15432 ) ) ( not ( = ?auto_15423 ?auto_15431 ) ) ( IS-CRATE ?auto_15416 ) ( not ( = ?auto_15438 ?auto_15421 ) ) ( HOIST-AT ?auto_15433 ?auto_15438 ) ( AVAILABLE ?auto_15433 ) ( SURFACE-AT ?auto_15416 ?auto_15438 ) ( ON ?auto_15416 ?auto_15429 ) ( CLEAR ?auto_15416 ) ( not ( = ?auto_15415 ?auto_15416 ) ) ( not ( = ?auto_15415 ?auto_15429 ) ) ( not ( = ?auto_15416 ?auto_15429 ) ) ( not ( = ?auto_15423 ?auto_15433 ) ) ( IS-CRATE ?auto_15415 ) ( not ( = ?auto_15439 ?auto_15421 ) ) ( HOIST-AT ?auto_15428 ?auto_15439 ) ( AVAILABLE ?auto_15428 ) ( SURFACE-AT ?auto_15415 ?auto_15439 ) ( ON ?auto_15415 ?auto_15437 ) ( CLEAR ?auto_15415 ) ( not ( = ?auto_15414 ?auto_15415 ) ) ( not ( = ?auto_15414 ?auto_15437 ) ) ( not ( = ?auto_15415 ?auto_15437 ) ) ( not ( = ?auto_15423 ?auto_15428 ) ) ( SURFACE-AT ?auto_15413 ?auto_15421 ) ( CLEAR ?auto_15413 ) ( IS-CRATE ?auto_15414 ) ( AVAILABLE ?auto_15423 ) ( not ( = ?auto_15436 ?auto_15421 ) ) ( HOIST-AT ?auto_15427 ?auto_15436 ) ( AVAILABLE ?auto_15427 ) ( SURFACE-AT ?auto_15414 ?auto_15436 ) ( ON ?auto_15414 ?auto_15435 ) ( CLEAR ?auto_15414 ) ( TRUCK-AT ?auto_15422 ?auto_15421 ) ( not ( = ?auto_15413 ?auto_15414 ) ) ( not ( = ?auto_15413 ?auto_15435 ) ) ( not ( = ?auto_15414 ?auto_15435 ) ) ( not ( = ?auto_15423 ?auto_15427 ) ) ( not ( = ?auto_15413 ?auto_15415 ) ) ( not ( = ?auto_15413 ?auto_15437 ) ) ( not ( = ?auto_15415 ?auto_15435 ) ) ( not ( = ?auto_15439 ?auto_15436 ) ) ( not ( = ?auto_15428 ?auto_15427 ) ) ( not ( = ?auto_15437 ?auto_15435 ) ) ( not ( = ?auto_15413 ?auto_15416 ) ) ( not ( = ?auto_15413 ?auto_15429 ) ) ( not ( = ?auto_15414 ?auto_15416 ) ) ( not ( = ?auto_15414 ?auto_15429 ) ) ( not ( = ?auto_15416 ?auto_15437 ) ) ( not ( = ?auto_15416 ?auto_15435 ) ) ( not ( = ?auto_15438 ?auto_15439 ) ) ( not ( = ?auto_15438 ?auto_15436 ) ) ( not ( = ?auto_15433 ?auto_15428 ) ) ( not ( = ?auto_15433 ?auto_15427 ) ) ( not ( = ?auto_15429 ?auto_15437 ) ) ( not ( = ?auto_15429 ?auto_15435 ) ) ( not ( = ?auto_15413 ?auto_15417 ) ) ( not ( = ?auto_15413 ?auto_15432 ) ) ( not ( = ?auto_15414 ?auto_15417 ) ) ( not ( = ?auto_15414 ?auto_15432 ) ) ( not ( = ?auto_15415 ?auto_15417 ) ) ( not ( = ?auto_15415 ?auto_15432 ) ) ( not ( = ?auto_15417 ?auto_15429 ) ) ( not ( = ?auto_15417 ?auto_15437 ) ) ( not ( = ?auto_15417 ?auto_15435 ) ) ( not ( = ?auto_15440 ?auto_15438 ) ) ( not ( = ?auto_15440 ?auto_15439 ) ) ( not ( = ?auto_15440 ?auto_15436 ) ) ( not ( = ?auto_15431 ?auto_15433 ) ) ( not ( = ?auto_15431 ?auto_15428 ) ) ( not ( = ?auto_15431 ?auto_15427 ) ) ( not ( = ?auto_15432 ?auto_15429 ) ) ( not ( = ?auto_15432 ?auto_15437 ) ) ( not ( = ?auto_15432 ?auto_15435 ) ) ( not ( = ?auto_15413 ?auto_15418 ) ) ( not ( = ?auto_15413 ?auto_15426 ) ) ( not ( = ?auto_15414 ?auto_15418 ) ) ( not ( = ?auto_15414 ?auto_15426 ) ) ( not ( = ?auto_15415 ?auto_15418 ) ) ( not ( = ?auto_15415 ?auto_15426 ) ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( not ( = ?auto_15416 ?auto_15426 ) ) ( not ( = ?auto_15418 ?auto_15432 ) ) ( not ( = ?auto_15418 ?auto_15429 ) ) ( not ( = ?auto_15418 ?auto_15437 ) ) ( not ( = ?auto_15418 ?auto_15435 ) ) ( not ( = ?auto_15434 ?auto_15440 ) ) ( not ( = ?auto_15434 ?auto_15438 ) ) ( not ( = ?auto_15434 ?auto_15439 ) ) ( not ( = ?auto_15434 ?auto_15436 ) ) ( not ( = ?auto_15430 ?auto_15431 ) ) ( not ( = ?auto_15430 ?auto_15433 ) ) ( not ( = ?auto_15430 ?auto_15428 ) ) ( not ( = ?auto_15430 ?auto_15427 ) ) ( not ( = ?auto_15426 ?auto_15432 ) ) ( not ( = ?auto_15426 ?auto_15429 ) ) ( not ( = ?auto_15426 ?auto_15437 ) ) ( not ( = ?auto_15426 ?auto_15435 ) ) ( not ( = ?auto_15413 ?auto_15419 ) ) ( not ( = ?auto_15413 ?auto_15424 ) ) ( not ( = ?auto_15414 ?auto_15419 ) ) ( not ( = ?auto_15414 ?auto_15424 ) ) ( not ( = ?auto_15415 ?auto_15419 ) ) ( not ( = ?auto_15415 ?auto_15424 ) ) ( not ( = ?auto_15416 ?auto_15419 ) ) ( not ( = ?auto_15416 ?auto_15424 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15417 ?auto_15424 ) ) ( not ( = ?auto_15419 ?auto_15426 ) ) ( not ( = ?auto_15419 ?auto_15432 ) ) ( not ( = ?auto_15419 ?auto_15429 ) ) ( not ( = ?auto_15419 ?auto_15437 ) ) ( not ( = ?auto_15419 ?auto_15435 ) ) ( not ( = ?auto_15425 ?auto_15434 ) ) ( not ( = ?auto_15425 ?auto_15440 ) ) ( not ( = ?auto_15425 ?auto_15438 ) ) ( not ( = ?auto_15425 ?auto_15439 ) ) ( not ( = ?auto_15425 ?auto_15436 ) ) ( not ( = ?auto_15420 ?auto_15430 ) ) ( not ( = ?auto_15420 ?auto_15431 ) ) ( not ( = ?auto_15420 ?auto_15433 ) ) ( not ( = ?auto_15420 ?auto_15428 ) ) ( not ( = ?auto_15420 ?auto_15427 ) ) ( not ( = ?auto_15424 ?auto_15426 ) ) ( not ( = ?auto_15424 ?auto_15432 ) ) ( not ( = ?auto_15424 ?auto_15429 ) ) ( not ( = ?auto_15424 ?auto_15437 ) ) ( not ( = ?auto_15424 ?auto_15435 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15413 ?auto_15414 ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 )
      ( MAKE-1CRATE ?auto_15418 ?auto_15419 )
      ( MAKE-6CRATE-VERIFY ?auto_15413 ?auto_15414 ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 ?auto_15419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15443 - SURFACE
      ?auto_15444 - SURFACE
    )
    :vars
    (
      ?auto_15445 - HOIST
      ?auto_15446 - PLACE
      ?auto_15448 - PLACE
      ?auto_15449 - HOIST
      ?auto_15450 - SURFACE
      ?auto_15447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15445 ?auto_15446 ) ( SURFACE-AT ?auto_15443 ?auto_15446 ) ( CLEAR ?auto_15443 ) ( IS-CRATE ?auto_15444 ) ( AVAILABLE ?auto_15445 ) ( not ( = ?auto_15448 ?auto_15446 ) ) ( HOIST-AT ?auto_15449 ?auto_15448 ) ( AVAILABLE ?auto_15449 ) ( SURFACE-AT ?auto_15444 ?auto_15448 ) ( ON ?auto_15444 ?auto_15450 ) ( CLEAR ?auto_15444 ) ( TRUCK-AT ?auto_15447 ?auto_15446 ) ( not ( = ?auto_15443 ?auto_15444 ) ) ( not ( = ?auto_15443 ?auto_15450 ) ) ( not ( = ?auto_15444 ?auto_15450 ) ) ( not ( = ?auto_15445 ?auto_15449 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15447 ?auto_15446 ?auto_15448 )
      ( !LIFT ?auto_15449 ?auto_15444 ?auto_15450 ?auto_15448 )
      ( !LOAD ?auto_15449 ?auto_15444 ?auto_15447 ?auto_15448 )
      ( !DRIVE ?auto_15447 ?auto_15448 ?auto_15446 )
      ( !UNLOAD ?auto_15445 ?auto_15444 ?auto_15447 ?auto_15446 )
      ( !DROP ?auto_15445 ?auto_15444 ?auto_15443 ?auto_15446 )
      ( MAKE-1CRATE-VERIFY ?auto_15443 ?auto_15444 ) )
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
      ?auto_15471 - HOIST
      ?auto_15472 - PLACE
      ?auto_15468 - PLACE
      ?auto_15467 - HOIST
      ?auto_15469 - SURFACE
      ?auto_15486 - PLACE
      ?auto_15489 - HOIST
      ?auto_15490 - SURFACE
      ?auto_15478 - PLACE
      ?auto_15487 - HOIST
      ?auto_15476 - SURFACE
      ?auto_15475 - PLACE
      ?auto_15488 - HOIST
      ?auto_15485 - SURFACE
      ?auto_15482 - PLACE
      ?auto_15484 - HOIST
      ?auto_15474 - SURFACE
      ?auto_15483 - PLACE
      ?auto_15477 - HOIST
      ?auto_15481 - SURFACE
      ?auto_15479 - PLACE
      ?auto_15473 - HOIST
      ?auto_15480 - SURFACE
      ?auto_15470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15471 ?auto_15472 ) ( IS-CRATE ?auto_15466 ) ( not ( = ?auto_15468 ?auto_15472 ) ) ( HOIST-AT ?auto_15467 ?auto_15468 ) ( AVAILABLE ?auto_15467 ) ( SURFACE-AT ?auto_15466 ?auto_15468 ) ( ON ?auto_15466 ?auto_15469 ) ( CLEAR ?auto_15466 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15465 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( not ( = ?auto_15471 ?auto_15467 ) ) ( IS-CRATE ?auto_15465 ) ( not ( = ?auto_15486 ?auto_15472 ) ) ( HOIST-AT ?auto_15489 ?auto_15486 ) ( AVAILABLE ?auto_15489 ) ( SURFACE-AT ?auto_15465 ?auto_15486 ) ( ON ?auto_15465 ?auto_15490 ) ( CLEAR ?auto_15465 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15464 ?auto_15490 ) ) ( not ( = ?auto_15465 ?auto_15490 ) ) ( not ( = ?auto_15471 ?auto_15489 ) ) ( IS-CRATE ?auto_15464 ) ( not ( = ?auto_15478 ?auto_15472 ) ) ( HOIST-AT ?auto_15487 ?auto_15478 ) ( AVAILABLE ?auto_15487 ) ( SURFACE-AT ?auto_15464 ?auto_15478 ) ( ON ?auto_15464 ?auto_15476 ) ( CLEAR ?auto_15464 ) ( not ( = ?auto_15463 ?auto_15464 ) ) ( not ( = ?auto_15463 ?auto_15476 ) ) ( not ( = ?auto_15464 ?auto_15476 ) ) ( not ( = ?auto_15471 ?auto_15487 ) ) ( IS-CRATE ?auto_15463 ) ( not ( = ?auto_15475 ?auto_15472 ) ) ( HOIST-AT ?auto_15488 ?auto_15475 ) ( AVAILABLE ?auto_15488 ) ( SURFACE-AT ?auto_15463 ?auto_15475 ) ( ON ?auto_15463 ?auto_15485 ) ( CLEAR ?auto_15463 ) ( not ( = ?auto_15462 ?auto_15463 ) ) ( not ( = ?auto_15462 ?auto_15485 ) ) ( not ( = ?auto_15463 ?auto_15485 ) ) ( not ( = ?auto_15471 ?auto_15488 ) ) ( IS-CRATE ?auto_15462 ) ( not ( = ?auto_15482 ?auto_15472 ) ) ( HOIST-AT ?auto_15484 ?auto_15482 ) ( AVAILABLE ?auto_15484 ) ( SURFACE-AT ?auto_15462 ?auto_15482 ) ( ON ?auto_15462 ?auto_15474 ) ( CLEAR ?auto_15462 ) ( not ( = ?auto_15461 ?auto_15462 ) ) ( not ( = ?auto_15461 ?auto_15474 ) ) ( not ( = ?auto_15462 ?auto_15474 ) ) ( not ( = ?auto_15471 ?auto_15484 ) ) ( IS-CRATE ?auto_15461 ) ( not ( = ?auto_15483 ?auto_15472 ) ) ( HOIST-AT ?auto_15477 ?auto_15483 ) ( AVAILABLE ?auto_15477 ) ( SURFACE-AT ?auto_15461 ?auto_15483 ) ( ON ?auto_15461 ?auto_15481 ) ( CLEAR ?auto_15461 ) ( not ( = ?auto_15460 ?auto_15461 ) ) ( not ( = ?auto_15460 ?auto_15481 ) ) ( not ( = ?auto_15461 ?auto_15481 ) ) ( not ( = ?auto_15471 ?auto_15477 ) ) ( SURFACE-AT ?auto_15459 ?auto_15472 ) ( CLEAR ?auto_15459 ) ( IS-CRATE ?auto_15460 ) ( AVAILABLE ?auto_15471 ) ( not ( = ?auto_15479 ?auto_15472 ) ) ( HOIST-AT ?auto_15473 ?auto_15479 ) ( AVAILABLE ?auto_15473 ) ( SURFACE-AT ?auto_15460 ?auto_15479 ) ( ON ?auto_15460 ?auto_15480 ) ( CLEAR ?auto_15460 ) ( TRUCK-AT ?auto_15470 ?auto_15472 ) ( not ( = ?auto_15459 ?auto_15460 ) ) ( not ( = ?auto_15459 ?auto_15480 ) ) ( not ( = ?auto_15460 ?auto_15480 ) ) ( not ( = ?auto_15471 ?auto_15473 ) ) ( not ( = ?auto_15459 ?auto_15461 ) ) ( not ( = ?auto_15459 ?auto_15481 ) ) ( not ( = ?auto_15461 ?auto_15480 ) ) ( not ( = ?auto_15483 ?auto_15479 ) ) ( not ( = ?auto_15477 ?auto_15473 ) ) ( not ( = ?auto_15481 ?auto_15480 ) ) ( not ( = ?auto_15459 ?auto_15462 ) ) ( not ( = ?auto_15459 ?auto_15474 ) ) ( not ( = ?auto_15460 ?auto_15462 ) ) ( not ( = ?auto_15460 ?auto_15474 ) ) ( not ( = ?auto_15462 ?auto_15481 ) ) ( not ( = ?auto_15462 ?auto_15480 ) ) ( not ( = ?auto_15482 ?auto_15483 ) ) ( not ( = ?auto_15482 ?auto_15479 ) ) ( not ( = ?auto_15484 ?auto_15477 ) ) ( not ( = ?auto_15484 ?auto_15473 ) ) ( not ( = ?auto_15474 ?auto_15481 ) ) ( not ( = ?auto_15474 ?auto_15480 ) ) ( not ( = ?auto_15459 ?auto_15463 ) ) ( not ( = ?auto_15459 ?auto_15485 ) ) ( not ( = ?auto_15460 ?auto_15463 ) ) ( not ( = ?auto_15460 ?auto_15485 ) ) ( not ( = ?auto_15461 ?auto_15463 ) ) ( not ( = ?auto_15461 ?auto_15485 ) ) ( not ( = ?auto_15463 ?auto_15474 ) ) ( not ( = ?auto_15463 ?auto_15481 ) ) ( not ( = ?auto_15463 ?auto_15480 ) ) ( not ( = ?auto_15475 ?auto_15482 ) ) ( not ( = ?auto_15475 ?auto_15483 ) ) ( not ( = ?auto_15475 ?auto_15479 ) ) ( not ( = ?auto_15488 ?auto_15484 ) ) ( not ( = ?auto_15488 ?auto_15477 ) ) ( not ( = ?auto_15488 ?auto_15473 ) ) ( not ( = ?auto_15485 ?auto_15474 ) ) ( not ( = ?auto_15485 ?auto_15481 ) ) ( not ( = ?auto_15485 ?auto_15480 ) ) ( not ( = ?auto_15459 ?auto_15464 ) ) ( not ( = ?auto_15459 ?auto_15476 ) ) ( not ( = ?auto_15460 ?auto_15464 ) ) ( not ( = ?auto_15460 ?auto_15476 ) ) ( not ( = ?auto_15461 ?auto_15464 ) ) ( not ( = ?auto_15461 ?auto_15476 ) ) ( not ( = ?auto_15462 ?auto_15464 ) ) ( not ( = ?auto_15462 ?auto_15476 ) ) ( not ( = ?auto_15464 ?auto_15485 ) ) ( not ( = ?auto_15464 ?auto_15474 ) ) ( not ( = ?auto_15464 ?auto_15481 ) ) ( not ( = ?auto_15464 ?auto_15480 ) ) ( not ( = ?auto_15478 ?auto_15475 ) ) ( not ( = ?auto_15478 ?auto_15482 ) ) ( not ( = ?auto_15478 ?auto_15483 ) ) ( not ( = ?auto_15478 ?auto_15479 ) ) ( not ( = ?auto_15487 ?auto_15488 ) ) ( not ( = ?auto_15487 ?auto_15484 ) ) ( not ( = ?auto_15487 ?auto_15477 ) ) ( not ( = ?auto_15487 ?auto_15473 ) ) ( not ( = ?auto_15476 ?auto_15485 ) ) ( not ( = ?auto_15476 ?auto_15474 ) ) ( not ( = ?auto_15476 ?auto_15481 ) ) ( not ( = ?auto_15476 ?auto_15480 ) ) ( not ( = ?auto_15459 ?auto_15465 ) ) ( not ( = ?auto_15459 ?auto_15490 ) ) ( not ( = ?auto_15460 ?auto_15465 ) ) ( not ( = ?auto_15460 ?auto_15490 ) ) ( not ( = ?auto_15461 ?auto_15465 ) ) ( not ( = ?auto_15461 ?auto_15490 ) ) ( not ( = ?auto_15462 ?auto_15465 ) ) ( not ( = ?auto_15462 ?auto_15490 ) ) ( not ( = ?auto_15463 ?auto_15465 ) ) ( not ( = ?auto_15463 ?auto_15490 ) ) ( not ( = ?auto_15465 ?auto_15476 ) ) ( not ( = ?auto_15465 ?auto_15485 ) ) ( not ( = ?auto_15465 ?auto_15474 ) ) ( not ( = ?auto_15465 ?auto_15481 ) ) ( not ( = ?auto_15465 ?auto_15480 ) ) ( not ( = ?auto_15486 ?auto_15478 ) ) ( not ( = ?auto_15486 ?auto_15475 ) ) ( not ( = ?auto_15486 ?auto_15482 ) ) ( not ( = ?auto_15486 ?auto_15483 ) ) ( not ( = ?auto_15486 ?auto_15479 ) ) ( not ( = ?auto_15489 ?auto_15487 ) ) ( not ( = ?auto_15489 ?auto_15488 ) ) ( not ( = ?auto_15489 ?auto_15484 ) ) ( not ( = ?auto_15489 ?auto_15477 ) ) ( not ( = ?auto_15489 ?auto_15473 ) ) ( not ( = ?auto_15490 ?auto_15476 ) ) ( not ( = ?auto_15490 ?auto_15485 ) ) ( not ( = ?auto_15490 ?auto_15474 ) ) ( not ( = ?auto_15490 ?auto_15481 ) ) ( not ( = ?auto_15490 ?auto_15480 ) ) ( not ( = ?auto_15459 ?auto_15466 ) ) ( not ( = ?auto_15459 ?auto_15469 ) ) ( not ( = ?auto_15460 ?auto_15466 ) ) ( not ( = ?auto_15460 ?auto_15469 ) ) ( not ( = ?auto_15461 ?auto_15466 ) ) ( not ( = ?auto_15461 ?auto_15469 ) ) ( not ( = ?auto_15462 ?auto_15466 ) ) ( not ( = ?auto_15462 ?auto_15469 ) ) ( not ( = ?auto_15463 ?auto_15466 ) ) ( not ( = ?auto_15463 ?auto_15469 ) ) ( not ( = ?auto_15464 ?auto_15466 ) ) ( not ( = ?auto_15464 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15490 ) ) ( not ( = ?auto_15466 ?auto_15476 ) ) ( not ( = ?auto_15466 ?auto_15485 ) ) ( not ( = ?auto_15466 ?auto_15474 ) ) ( not ( = ?auto_15466 ?auto_15481 ) ) ( not ( = ?auto_15466 ?auto_15480 ) ) ( not ( = ?auto_15468 ?auto_15486 ) ) ( not ( = ?auto_15468 ?auto_15478 ) ) ( not ( = ?auto_15468 ?auto_15475 ) ) ( not ( = ?auto_15468 ?auto_15482 ) ) ( not ( = ?auto_15468 ?auto_15483 ) ) ( not ( = ?auto_15468 ?auto_15479 ) ) ( not ( = ?auto_15467 ?auto_15489 ) ) ( not ( = ?auto_15467 ?auto_15487 ) ) ( not ( = ?auto_15467 ?auto_15488 ) ) ( not ( = ?auto_15467 ?auto_15484 ) ) ( not ( = ?auto_15467 ?auto_15477 ) ) ( not ( = ?auto_15467 ?auto_15473 ) ) ( not ( = ?auto_15469 ?auto_15490 ) ) ( not ( = ?auto_15469 ?auto_15476 ) ) ( not ( = ?auto_15469 ?auto_15485 ) ) ( not ( = ?auto_15469 ?auto_15474 ) ) ( not ( = ?auto_15469 ?auto_15481 ) ) ( not ( = ?auto_15469 ?auto_15480 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15462 ?auto_15463 ?auto_15464 ?auto_15465 )
      ( MAKE-1CRATE ?auto_15465 ?auto_15466 )
      ( MAKE-7CRATE-VERIFY ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15462 ?auto_15463 ?auto_15464 ?auto_15465 ?auto_15466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15493 - SURFACE
      ?auto_15494 - SURFACE
    )
    :vars
    (
      ?auto_15495 - HOIST
      ?auto_15496 - PLACE
      ?auto_15498 - PLACE
      ?auto_15499 - HOIST
      ?auto_15500 - SURFACE
      ?auto_15497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15495 ?auto_15496 ) ( SURFACE-AT ?auto_15493 ?auto_15496 ) ( CLEAR ?auto_15493 ) ( IS-CRATE ?auto_15494 ) ( AVAILABLE ?auto_15495 ) ( not ( = ?auto_15498 ?auto_15496 ) ) ( HOIST-AT ?auto_15499 ?auto_15498 ) ( AVAILABLE ?auto_15499 ) ( SURFACE-AT ?auto_15494 ?auto_15498 ) ( ON ?auto_15494 ?auto_15500 ) ( CLEAR ?auto_15494 ) ( TRUCK-AT ?auto_15497 ?auto_15496 ) ( not ( = ?auto_15493 ?auto_15494 ) ) ( not ( = ?auto_15493 ?auto_15500 ) ) ( not ( = ?auto_15494 ?auto_15500 ) ) ( not ( = ?auto_15495 ?auto_15499 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15497 ?auto_15496 ?auto_15498 )
      ( !LIFT ?auto_15499 ?auto_15494 ?auto_15500 ?auto_15498 )
      ( !LOAD ?auto_15499 ?auto_15494 ?auto_15497 ?auto_15498 )
      ( !DRIVE ?auto_15497 ?auto_15498 ?auto_15496 )
      ( !UNLOAD ?auto_15495 ?auto_15494 ?auto_15497 ?auto_15496 )
      ( !DROP ?auto_15495 ?auto_15494 ?auto_15493 ?auto_15496 )
      ( MAKE-1CRATE-VERIFY ?auto_15493 ?auto_15494 ) )
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
      ?auto_15518 - SURFACE
      ?auto_15517 - SURFACE
    )
    :vars
    (
      ?auto_15523 - HOIST
      ?auto_15521 - PLACE
      ?auto_15520 - PLACE
      ?auto_15519 - HOIST
      ?auto_15522 - SURFACE
      ?auto_15542 - SURFACE
      ?auto_15537 - PLACE
      ?auto_15530 - HOIST
      ?auto_15529 - SURFACE
      ?auto_15540 - PLACE
      ?auto_15527 - HOIST
      ?auto_15526 - SURFACE
      ?auto_15543 - PLACE
      ?auto_15531 - HOIST
      ?auto_15536 - SURFACE
      ?auto_15534 - PLACE
      ?auto_15535 - HOIST
      ?auto_15525 - SURFACE
      ?auto_15533 - PLACE
      ?auto_15541 - HOIST
      ?auto_15532 - SURFACE
      ?auto_15539 - PLACE
      ?auto_15528 - HOIST
      ?auto_15538 - SURFACE
      ?auto_15524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15523 ?auto_15521 ) ( IS-CRATE ?auto_15517 ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( HOIST-AT ?auto_15519 ?auto_15520 ) ( SURFACE-AT ?auto_15517 ?auto_15520 ) ( ON ?auto_15517 ?auto_15522 ) ( CLEAR ?auto_15517 ) ( not ( = ?auto_15518 ?auto_15517 ) ) ( not ( = ?auto_15518 ?auto_15522 ) ) ( not ( = ?auto_15517 ?auto_15522 ) ) ( not ( = ?auto_15523 ?auto_15519 ) ) ( IS-CRATE ?auto_15518 ) ( AVAILABLE ?auto_15519 ) ( SURFACE-AT ?auto_15518 ?auto_15520 ) ( ON ?auto_15518 ?auto_15542 ) ( CLEAR ?auto_15518 ) ( not ( = ?auto_15516 ?auto_15518 ) ) ( not ( = ?auto_15516 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15542 ) ) ( IS-CRATE ?auto_15516 ) ( not ( = ?auto_15537 ?auto_15521 ) ) ( HOIST-AT ?auto_15530 ?auto_15537 ) ( AVAILABLE ?auto_15530 ) ( SURFACE-AT ?auto_15516 ?auto_15537 ) ( ON ?auto_15516 ?auto_15529 ) ( CLEAR ?auto_15516 ) ( not ( = ?auto_15515 ?auto_15516 ) ) ( not ( = ?auto_15515 ?auto_15529 ) ) ( not ( = ?auto_15516 ?auto_15529 ) ) ( not ( = ?auto_15523 ?auto_15530 ) ) ( IS-CRATE ?auto_15515 ) ( not ( = ?auto_15540 ?auto_15521 ) ) ( HOIST-AT ?auto_15527 ?auto_15540 ) ( AVAILABLE ?auto_15527 ) ( SURFACE-AT ?auto_15515 ?auto_15540 ) ( ON ?auto_15515 ?auto_15526 ) ( CLEAR ?auto_15515 ) ( not ( = ?auto_15514 ?auto_15515 ) ) ( not ( = ?auto_15514 ?auto_15526 ) ) ( not ( = ?auto_15515 ?auto_15526 ) ) ( not ( = ?auto_15523 ?auto_15527 ) ) ( IS-CRATE ?auto_15514 ) ( not ( = ?auto_15543 ?auto_15521 ) ) ( HOIST-AT ?auto_15531 ?auto_15543 ) ( AVAILABLE ?auto_15531 ) ( SURFACE-AT ?auto_15514 ?auto_15543 ) ( ON ?auto_15514 ?auto_15536 ) ( CLEAR ?auto_15514 ) ( not ( = ?auto_15513 ?auto_15514 ) ) ( not ( = ?auto_15513 ?auto_15536 ) ) ( not ( = ?auto_15514 ?auto_15536 ) ) ( not ( = ?auto_15523 ?auto_15531 ) ) ( IS-CRATE ?auto_15513 ) ( not ( = ?auto_15534 ?auto_15521 ) ) ( HOIST-AT ?auto_15535 ?auto_15534 ) ( AVAILABLE ?auto_15535 ) ( SURFACE-AT ?auto_15513 ?auto_15534 ) ( ON ?auto_15513 ?auto_15525 ) ( CLEAR ?auto_15513 ) ( not ( = ?auto_15512 ?auto_15513 ) ) ( not ( = ?auto_15512 ?auto_15525 ) ) ( not ( = ?auto_15513 ?auto_15525 ) ) ( not ( = ?auto_15523 ?auto_15535 ) ) ( IS-CRATE ?auto_15512 ) ( not ( = ?auto_15533 ?auto_15521 ) ) ( HOIST-AT ?auto_15541 ?auto_15533 ) ( AVAILABLE ?auto_15541 ) ( SURFACE-AT ?auto_15512 ?auto_15533 ) ( ON ?auto_15512 ?auto_15532 ) ( CLEAR ?auto_15512 ) ( not ( = ?auto_15511 ?auto_15512 ) ) ( not ( = ?auto_15511 ?auto_15532 ) ) ( not ( = ?auto_15512 ?auto_15532 ) ) ( not ( = ?auto_15523 ?auto_15541 ) ) ( SURFACE-AT ?auto_15510 ?auto_15521 ) ( CLEAR ?auto_15510 ) ( IS-CRATE ?auto_15511 ) ( AVAILABLE ?auto_15523 ) ( not ( = ?auto_15539 ?auto_15521 ) ) ( HOIST-AT ?auto_15528 ?auto_15539 ) ( AVAILABLE ?auto_15528 ) ( SURFACE-AT ?auto_15511 ?auto_15539 ) ( ON ?auto_15511 ?auto_15538 ) ( CLEAR ?auto_15511 ) ( TRUCK-AT ?auto_15524 ?auto_15521 ) ( not ( = ?auto_15510 ?auto_15511 ) ) ( not ( = ?auto_15510 ?auto_15538 ) ) ( not ( = ?auto_15511 ?auto_15538 ) ) ( not ( = ?auto_15523 ?auto_15528 ) ) ( not ( = ?auto_15510 ?auto_15512 ) ) ( not ( = ?auto_15510 ?auto_15532 ) ) ( not ( = ?auto_15512 ?auto_15538 ) ) ( not ( = ?auto_15533 ?auto_15539 ) ) ( not ( = ?auto_15541 ?auto_15528 ) ) ( not ( = ?auto_15532 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15513 ) ) ( not ( = ?auto_15510 ?auto_15525 ) ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( not ( = ?auto_15511 ?auto_15525 ) ) ( not ( = ?auto_15513 ?auto_15532 ) ) ( not ( = ?auto_15513 ?auto_15538 ) ) ( not ( = ?auto_15534 ?auto_15533 ) ) ( not ( = ?auto_15534 ?auto_15539 ) ) ( not ( = ?auto_15535 ?auto_15541 ) ) ( not ( = ?auto_15535 ?auto_15528 ) ) ( not ( = ?auto_15525 ?auto_15532 ) ) ( not ( = ?auto_15525 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15514 ) ) ( not ( = ?auto_15510 ?auto_15536 ) ) ( not ( = ?auto_15511 ?auto_15514 ) ) ( not ( = ?auto_15511 ?auto_15536 ) ) ( not ( = ?auto_15512 ?auto_15514 ) ) ( not ( = ?auto_15512 ?auto_15536 ) ) ( not ( = ?auto_15514 ?auto_15525 ) ) ( not ( = ?auto_15514 ?auto_15532 ) ) ( not ( = ?auto_15514 ?auto_15538 ) ) ( not ( = ?auto_15543 ?auto_15534 ) ) ( not ( = ?auto_15543 ?auto_15533 ) ) ( not ( = ?auto_15543 ?auto_15539 ) ) ( not ( = ?auto_15531 ?auto_15535 ) ) ( not ( = ?auto_15531 ?auto_15541 ) ) ( not ( = ?auto_15531 ?auto_15528 ) ) ( not ( = ?auto_15536 ?auto_15525 ) ) ( not ( = ?auto_15536 ?auto_15532 ) ) ( not ( = ?auto_15536 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15515 ) ) ( not ( = ?auto_15510 ?auto_15526 ) ) ( not ( = ?auto_15511 ?auto_15515 ) ) ( not ( = ?auto_15511 ?auto_15526 ) ) ( not ( = ?auto_15512 ?auto_15515 ) ) ( not ( = ?auto_15512 ?auto_15526 ) ) ( not ( = ?auto_15513 ?auto_15515 ) ) ( not ( = ?auto_15513 ?auto_15526 ) ) ( not ( = ?auto_15515 ?auto_15536 ) ) ( not ( = ?auto_15515 ?auto_15525 ) ) ( not ( = ?auto_15515 ?auto_15532 ) ) ( not ( = ?auto_15515 ?auto_15538 ) ) ( not ( = ?auto_15540 ?auto_15543 ) ) ( not ( = ?auto_15540 ?auto_15534 ) ) ( not ( = ?auto_15540 ?auto_15533 ) ) ( not ( = ?auto_15540 ?auto_15539 ) ) ( not ( = ?auto_15527 ?auto_15531 ) ) ( not ( = ?auto_15527 ?auto_15535 ) ) ( not ( = ?auto_15527 ?auto_15541 ) ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( not ( = ?auto_15526 ?auto_15536 ) ) ( not ( = ?auto_15526 ?auto_15525 ) ) ( not ( = ?auto_15526 ?auto_15532 ) ) ( not ( = ?auto_15526 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15516 ) ) ( not ( = ?auto_15510 ?auto_15529 ) ) ( not ( = ?auto_15511 ?auto_15516 ) ) ( not ( = ?auto_15511 ?auto_15529 ) ) ( not ( = ?auto_15512 ?auto_15516 ) ) ( not ( = ?auto_15512 ?auto_15529 ) ) ( not ( = ?auto_15513 ?auto_15516 ) ) ( not ( = ?auto_15513 ?auto_15529 ) ) ( not ( = ?auto_15514 ?auto_15516 ) ) ( not ( = ?auto_15514 ?auto_15529 ) ) ( not ( = ?auto_15516 ?auto_15526 ) ) ( not ( = ?auto_15516 ?auto_15536 ) ) ( not ( = ?auto_15516 ?auto_15525 ) ) ( not ( = ?auto_15516 ?auto_15532 ) ) ( not ( = ?auto_15516 ?auto_15538 ) ) ( not ( = ?auto_15537 ?auto_15540 ) ) ( not ( = ?auto_15537 ?auto_15543 ) ) ( not ( = ?auto_15537 ?auto_15534 ) ) ( not ( = ?auto_15537 ?auto_15533 ) ) ( not ( = ?auto_15537 ?auto_15539 ) ) ( not ( = ?auto_15530 ?auto_15527 ) ) ( not ( = ?auto_15530 ?auto_15531 ) ) ( not ( = ?auto_15530 ?auto_15535 ) ) ( not ( = ?auto_15530 ?auto_15541 ) ) ( not ( = ?auto_15530 ?auto_15528 ) ) ( not ( = ?auto_15529 ?auto_15526 ) ) ( not ( = ?auto_15529 ?auto_15536 ) ) ( not ( = ?auto_15529 ?auto_15525 ) ) ( not ( = ?auto_15529 ?auto_15532 ) ) ( not ( = ?auto_15529 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15518 ) ) ( not ( = ?auto_15510 ?auto_15542 ) ) ( not ( = ?auto_15511 ?auto_15518 ) ) ( not ( = ?auto_15511 ?auto_15542 ) ) ( not ( = ?auto_15512 ?auto_15518 ) ) ( not ( = ?auto_15512 ?auto_15542 ) ) ( not ( = ?auto_15513 ?auto_15518 ) ) ( not ( = ?auto_15513 ?auto_15542 ) ) ( not ( = ?auto_15514 ?auto_15518 ) ) ( not ( = ?auto_15514 ?auto_15542 ) ) ( not ( = ?auto_15515 ?auto_15518 ) ) ( not ( = ?auto_15515 ?auto_15542 ) ) ( not ( = ?auto_15518 ?auto_15529 ) ) ( not ( = ?auto_15518 ?auto_15526 ) ) ( not ( = ?auto_15518 ?auto_15536 ) ) ( not ( = ?auto_15518 ?auto_15525 ) ) ( not ( = ?auto_15518 ?auto_15532 ) ) ( not ( = ?auto_15518 ?auto_15538 ) ) ( not ( = ?auto_15520 ?auto_15537 ) ) ( not ( = ?auto_15520 ?auto_15540 ) ) ( not ( = ?auto_15520 ?auto_15543 ) ) ( not ( = ?auto_15520 ?auto_15534 ) ) ( not ( = ?auto_15520 ?auto_15533 ) ) ( not ( = ?auto_15520 ?auto_15539 ) ) ( not ( = ?auto_15519 ?auto_15530 ) ) ( not ( = ?auto_15519 ?auto_15527 ) ) ( not ( = ?auto_15519 ?auto_15531 ) ) ( not ( = ?auto_15519 ?auto_15535 ) ) ( not ( = ?auto_15519 ?auto_15541 ) ) ( not ( = ?auto_15519 ?auto_15528 ) ) ( not ( = ?auto_15542 ?auto_15529 ) ) ( not ( = ?auto_15542 ?auto_15526 ) ) ( not ( = ?auto_15542 ?auto_15536 ) ) ( not ( = ?auto_15542 ?auto_15525 ) ) ( not ( = ?auto_15542 ?auto_15532 ) ) ( not ( = ?auto_15542 ?auto_15538 ) ) ( not ( = ?auto_15510 ?auto_15517 ) ) ( not ( = ?auto_15510 ?auto_15522 ) ) ( not ( = ?auto_15511 ?auto_15517 ) ) ( not ( = ?auto_15511 ?auto_15522 ) ) ( not ( = ?auto_15512 ?auto_15517 ) ) ( not ( = ?auto_15512 ?auto_15522 ) ) ( not ( = ?auto_15513 ?auto_15517 ) ) ( not ( = ?auto_15513 ?auto_15522 ) ) ( not ( = ?auto_15514 ?auto_15517 ) ) ( not ( = ?auto_15514 ?auto_15522 ) ) ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15515 ?auto_15522 ) ) ( not ( = ?auto_15516 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15522 ) ) ( not ( = ?auto_15517 ?auto_15542 ) ) ( not ( = ?auto_15517 ?auto_15529 ) ) ( not ( = ?auto_15517 ?auto_15526 ) ) ( not ( = ?auto_15517 ?auto_15536 ) ) ( not ( = ?auto_15517 ?auto_15525 ) ) ( not ( = ?auto_15517 ?auto_15532 ) ) ( not ( = ?auto_15517 ?auto_15538 ) ) ( not ( = ?auto_15522 ?auto_15542 ) ) ( not ( = ?auto_15522 ?auto_15529 ) ) ( not ( = ?auto_15522 ?auto_15526 ) ) ( not ( = ?auto_15522 ?auto_15536 ) ) ( not ( = ?auto_15522 ?auto_15525 ) ) ( not ( = ?auto_15522 ?auto_15532 ) ) ( not ( = ?auto_15522 ?auto_15538 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_15510 ?auto_15511 ?auto_15512 ?auto_15513 ?auto_15514 ?auto_15515 ?auto_15516 ?auto_15518 )
      ( MAKE-1CRATE ?auto_15518 ?auto_15517 )
      ( MAKE-8CRATE-VERIFY ?auto_15510 ?auto_15511 ?auto_15512 ?auto_15513 ?auto_15514 ?auto_15515 ?auto_15516 ?auto_15518 ?auto_15517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15546 - SURFACE
      ?auto_15547 - SURFACE
    )
    :vars
    (
      ?auto_15548 - HOIST
      ?auto_15549 - PLACE
      ?auto_15551 - PLACE
      ?auto_15552 - HOIST
      ?auto_15553 - SURFACE
      ?auto_15550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15548 ?auto_15549 ) ( SURFACE-AT ?auto_15546 ?auto_15549 ) ( CLEAR ?auto_15546 ) ( IS-CRATE ?auto_15547 ) ( AVAILABLE ?auto_15548 ) ( not ( = ?auto_15551 ?auto_15549 ) ) ( HOIST-AT ?auto_15552 ?auto_15551 ) ( AVAILABLE ?auto_15552 ) ( SURFACE-AT ?auto_15547 ?auto_15551 ) ( ON ?auto_15547 ?auto_15553 ) ( CLEAR ?auto_15547 ) ( TRUCK-AT ?auto_15550 ?auto_15549 ) ( not ( = ?auto_15546 ?auto_15547 ) ) ( not ( = ?auto_15546 ?auto_15553 ) ) ( not ( = ?auto_15547 ?auto_15553 ) ) ( not ( = ?auto_15548 ?auto_15552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15550 ?auto_15549 ?auto_15551 )
      ( !LIFT ?auto_15552 ?auto_15547 ?auto_15553 ?auto_15551 )
      ( !LOAD ?auto_15552 ?auto_15547 ?auto_15550 ?auto_15551 )
      ( !DRIVE ?auto_15550 ?auto_15551 ?auto_15549 )
      ( !UNLOAD ?auto_15548 ?auto_15547 ?auto_15550 ?auto_15549 )
      ( !DROP ?auto_15548 ?auto_15547 ?auto_15546 ?auto_15549 )
      ( MAKE-1CRATE-VERIFY ?auto_15546 ?auto_15547 ) )
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
      ?auto_15573 - SURFACE
      ?auto_15572 - SURFACE
      ?auto_15571 - SURFACE
    )
    :vars
    (
      ?auto_15579 - HOIST
      ?auto_15576 - PLACE
      ?auto_15577 - PLACE
      ?auto_15575 - HOIST
      ?auto_15574 - SURFACE
      ?auto_15600 - PLACE
      ?auto_15599 - HOIST
      ?auto_15588 - SURFACE
      ?auto_15591 - SURFACE
      ?auto_15581 - PLACE
      ?auto_15585 - HOIST
      ?auto_15586 - SURFACE
      ?auto_15595 - PLACE
      ?auto_15590 - HOIST
      ?auto_15589 - SURFACE
      ?auto_15594 - PLACE
      ?auto_15584 - HOIST
      ?auto_15580 - SURFACE
      ?auto_15598 - PLACE
      ?auto_15597 - HOIST
      ?auto_15592 - SURFACE
      ?auto_15596 - PLACE
      ?auto_15593 - HOIST
      ?auto_15583 - SURFACE
      ?auto_15587 - PLACE
      ?auto_15601 - HOIST
      ?auto_15582 - SURFACE
      ?auto_15578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15579 ?auto_15576 ) ( IS-CRATE ?auto_15571 ) ( not ( = ?auto_15577 ?auto_15576 ) ) ( HOIST-AT ?auto_15575 ?auto_15577 ) ( AVAILABLE ?auto_15575 ) ( SURFACE-AT ?auto_15571 ?auto_15577 ) ( ON ?auto_15571 ?auto_15574 ) ( CLEAR ?auto_15571 ) ( not ( = ?auto_15572 ?auto_15571 ) ) ( not ( = ?auto_15572 ?auto_15574 ) ) ( not ( = ?auto_15571 ?auto_15574 ) ) ( not ( = ?auto_15579 ?auto_15575 ) ) ( IS-CRATE ?auto_15572 ) ( not ( = ?auto_15600 ?auto_15576 ) ) ( HOIST-AT ?auto_15599 ?auto_15600 ) ( SURFACE-AT ?auto_15572 ?auto_15600 ) ( ON ?auto_15572 ?auto_15588 ) ( CLEAR ?auto_15572 ) ( not ( = ?auto_15573 ?auto_15572 ) ) ( not ( = ?auto_15573 ?auto_15588 ) ) ( not ( = ?auto_15572 ?auto_15588 ) ) ( not ( = ?auto_15579 ?auto_15599 ) ) ( IS-CRATE ?auto_15573 ) ( AVAILABLE ?auto_15599 ) ( SURFACE-AT ?auto_15573 ?auto_15600 ) ( ON ?auto_15573 ?auto_15591 ) ( CLEAR ?auto_15573 ) ( not ( = ?auto_15570 ?auto_15573 ) ) ( not ( = ?auto_15570 ?auto_15591 ) ) ( not ( = ?auto_15573 ?auto_15591 ) ) ( IS-CRATE ?auto_15570 ) ( not ( = ?auto_15581 ?auto_15576 ) ) ( HOIST-AT ?auto_15585 ?auto_15581 ) ( AVAILABLE ?auto_15585 ) ( SURFACE-AT ?auto_15570 ?auto_15581 ) ( ON ?auto_15570 ?auto_15586 ) ( CLEAR ?auto_15570 ) ( not ( = ?auto_15569 ?auto_15570 ) ) ( not ( = ?auto_15569 ?auto_15586 ) ) ( not ( = ?auto_15570 ?auto_15586 ) ) ( not ( = ?auto_15579 ?auto_15585 ) ) ( IS-CRATE ?auto_15569 ) ( not ( = ?auto_15595 ?auto_15576 ) ) ( HOIST-AT ?auto_15590 ?auto_15595 ) ( AVAILABLE ?auto_15590 ) ( SURFACE-AT ?auto_15569 ?auto_15595 ) ( ON ?auto_15569 ?auto_15589 ) ( CLEAR ?auto_15569 ) ( not ( = ?auto_15568 ?auto_15569 ) ) ( not ( = ?auto_15568 ?auto_15589 ) ) ( not ( = ?auto_15569 ?auto_15589 ) ) ( not ( = ?auto_15579 ?auto_15590 ) ) ( IS-CRATE ?auto_15568 ) ( not ( = ?auto_15594 ?auto_15576 ) ) ( HOIST-AT ?auto_15584 ?auto_15594 ) ( AVAILABLE ?auto_15584 ) ( SURFACE-AT ?auto_15568 ?auto_15594 ) ( ON ?auto_15568 ?auto_15580 ) ( CLEAR ?auto_15568 ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15580 ) ) ( not ( = ?auto_15568 ?auto_15580 ) ) ( not ( = ?auto_15579 ?auto_15584 ) ) ( IS-CRATE ?auto_15567 ) ( not ( = ?auto_15598 ?auto_15576 ) ) ( HOIST-AT ?auto_15597 ?auto_15598 ) ( AVAILABLE ?auto_15597 ) ( SURFACE-AT ?auto_15567 ?auto_15598 ) ( ON ?auto_15567 ?auto_15592 ) ( CLEAR ?auto_15567 ) ( not ( = ?auto_15566 ?auto_15567 ) ) ( not ( = ?auto_15566 ?auto_15592 ) ) ( not ( = ?auto_15567 ?auto_15592 ) ) ( not ( = ?auto_15579 ?auto_15597 ) ) ( IS-CRATE ?auto_15566 ) ( not ( = ?auto_15596 ?auto_15576 ) ) ( HOIST-AT ?auto_15593 ?auto_15596 ) ( AVAILABLE ?auto_15593 ) ( SURFACE-AT ?auto_15566 ?auto_15596 ) ( ON ?auto_15566 ?auto_15583 ) ( CLEAR ?auto_15566 ) ( not ( = ?auto_15565 ?auto_15566 ) ) ( not ( = ?auto_15565 ?auto_15583 ) ) ( not ( = ?auto_15566 ?auto_15583 ) ) ( not ( = ?auto_15579 ?auto_15593 ) ) ( SURFACE-AT ?auto_15564 ?auto_15576 ) ( CLEAR ?auto_15564 ) ( IS-CRATE ?auto_15565 ) ( AVAILABLE ?auto_15579 ) ( not ( = ?auto_15587 ?auto_15576 ) ) ( HOIST-AT ?auto_15601 ?auto_15587 ) ( AVAILABLE ?auto_15601 ) ( SURFACE-AT ?auto_15565 ?auto_15587 ) ( ON ?auto_15565 ?auto_15582 ) ( CLEAR ?auto_15565 ) ( TRUCK-AT ?auto_15578 ?auto_15576 ) ( not ( = ?auto_15564 ?auto_15565 ) ) ( not ( = ?auto_15564 ?auto_15582 ) ) ( not ( = ?auto_15565 ?auto_15582 ) ) ( not ( = ?auto_15579 ?auto_15601 ) ) ( not ( = ?auto_15564 ?auto_15566 ) ) ( not ( = ?auto_15564 ?auto_15583 ) ) ( not ( = ?auto_15566 ?auto_15582 ) ) ( not ( = ?auto_15596 ?auto_15587 ) ) ( not ( = ?auto_15593 ?auto_15601 ) ) ( not ( = ?auto_15583 ?auto_15582 ) ) ( not ( = ?auto_15564 ?auto_15567 ) ) ( not ( = ?auto_15564 ?auto_15592 ) ) ( not ( = ?auto_15565 ?auto_15567 ) ) ( not ( = ?auto_15565 ?auto_15592 ) ) ( not ( = ?auto_15567 ?auto_15583 ) ) ( not ( = ?auto_15567 ?auto_15582 ) ) ( not ( = ?auto_15598 ?auto_15596 ) ) ( not ( = ?auto_15598 ?auto_15587 ) ) ( not ( = ?auto_15597 ?auto_15593 ) ) ( not ( = ?auto_15597 ?auto_15601 ) ) ( not ( = ?auto_15592 ?auto_15583 ) ) ( not ( = ?auto_15592 ?auto_15582 ) ) ( not ( = ?auto_15564 ?auto_15568 ) ) ( not ( = ?auto_15564 ?auto_15580 ) ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15565 ?auto_15580 ) ) ( not ( = ?auto_15566 ?auto_15568 ) ) ( not ( = ?auto_15566 ?auto_15580 ) ) ( not ( = ?auto_15568 ?auto_15592 ) ) ( not ( = ?auto_15568 ?auto_15583 ) ) ( not ( = ?auto_15568 ?auto_15582 ) ) ( not ( = ?auto_15594 ?auto_15598 ) ) ( not ( = ?auto_15594 ?auto_15596 ) ) ( not ( = ?auto_15594 ?auto_15587 ) ) ( not ( = ?auto_15584 ?auto_15597 ) ) ( not ( = ?auto_15584 ?auto_15593 ) ) ( not ( = ?auto_15584 ?auto_15601 ) ) ( not ( = ?auto_15580 ?auto_15592 ) ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15564 ?auto_15569 ) ) ( not ( = ?auto_15564 ?auto_15589 ) ) ( not ( = ?auto_15565 ?auto_15569 ) ) ( not ( = ?auto_15565 ?auto_15589 ) ) ( not ( = ?auto_15566 ?auto_15569 ) ) ( not ( = ?auto_15566 ?auto_15589 ) ) ( not ( = ?auto_15567 ?auto_15569 ) ) ( not ( = ?auto_15567 ?auto_15589 ) ) ( not ( = ?auto_15569 ?auto_15580 ) ) ( not ( = ?auto_15569 ?auto_15592 ) ) ( not ( = ?auto_15569 ?auto_15583 ) ) ( not ( = ?auto_15569 ?auto_15582 ) ) ( not ( = ?auto_15595 ?auto_15594 ) ) ( not ( = ?auto_15595 ?auto_15598 ) ) ( not ( = ?auto_15595 ?auto_15596 ) ) ( not ( = ?auto_15595 ?auto_15587 ) ) ( not ( = ?auto_15590 ?auto_15584 ) ) ( not ( = ?auto_15590 ?auto_15597 ) ) ( not ( = ?auto_15590 ?auto_15593 ) ) ( not ( = ?auto_15590 ?auto_15601 ) ) ( not ( = ?auto_15589 ?auto_15580 ) ) ( not ( = ?auto_15589 ?auto_15592 ) ) ( not ( = ?auto_15589 ?auto_15583 ) ) ( not ( = ?auto_15589 ?auto_15582 ) ) ( not ( = ?auto_15564 ?auto_15570 ) ) ( not ( = ?auto_15564 ?auto_15586 ) ) ( not ( = ?auto_15565 ?auto_15570 ) ) ( not ( = ?auto_15565 ?auto_15586 ) ) ( not ( = ?auto_15566 ?auto_15570 ) ) ( not ( = ?auto_15566 ?auto_15586 ) ) ( not ( = ?auto_15567 ?auto_15570 ) ) ( not ( = ?auto_15567 ?auto_15586 ) ) ( not ( = ?auto_15568 ?auto_15570 ) ) ( not ( = ?auto_15568 ?auto_15586 ) ) ( not ( = ?auto_15570 ?auto_15589 ) ) ( not ( = ?auto_15570 ?auto_15580 ) ) ( not ( = ?auto_15570 ?auto_15592 ) ) ( not ( = ?auto_15570 ?auto_15583 ) ) ( not ( = ?auto_15570 ?auto_15582 ) ) ( not ( = ?auto_15581 ?auto_15595 ) ) ( not ( = ?auto_15581 ?auto_15594 ) ) ( not ( = ?auto_15581 ?auto_15598 ) ) ( not ( = ?auto_15581 ?auto_15596 ) ) ( not ( = ?auto_15581 ?auto_15587 ) ) ( not ( = ?auto_15585 ?auto_15590 ) ) ( not ( = ?auto_15585 ?auto_15584 ) ) ( not ( = ?auto_15585 ?auto_15597 ) ) ( not ( = ?auto_15585 ?auto_15593 ) ) ( not ( = ?auto_15585 ?auto_15601 ) ) ( not ( = ?auto_15586 ?auto_15589 ) ) ( not ( = ?auto_15586 ?auto_15580 ) ) ( not ( = ?auto_15586 ?auto_15592 ) ) ( not ( = ?auto_15586 ?auto_15583 ) ) ( not ( = ?auto_15586 ?auto_15582 ) ) ( not ( = ?auto_15564 ?auto_15573 ) ) ( not ( = ?auto_15564 ?auto_15591 ) ) ( not ( = ?auto_15565 ?auto_15573 ) ) ( not ( = ?auto_15565 ?auto_15591 ) ) ( not ( = ?auto_15566 ?auto_15573 ) ) ( not ( = ?auto_15566 ?auto_15591 ) ) ( not ( = ?auto_15567 ?auto_15573 ) ) ( not ( = ?auto_15567 ?auto_15591 ) ) ( not ( = ?auto_15568 ?auto_15573 ) ) ( not ( = ?auto_15568 ?auto_15591 ) ) ( not ( = ?auto_15569 ?auto_15573 ) ) ( not ( = ?auto_15569 ?auto_15591 ) ) ( not ( = ?auto_15573 ?auto_15586 ) ) ( not ( = ?auto_15573 ?auto_15589 ) ) ( not ( = ?auto_15573 ?auto_15580 ) ) ( not ( = ?auto_15573 ?auto_15592 ) ) ( not ( = ?auto_15573 ?auto_15583 ) ) ( not ( = ?auto_15573 ?auto_15582 ) ) ( not ( = ?auto_15600 ?auto_15581 ) ) ( not ( = ?auto_15600 ?auto_15595 ) ) ( not ( = ?auto_15600 ?auto_15594 ) ) ( not ( = ?auto_15600 ?auto_15598 ) ) ( not ( = ?auto_15600 ?auto_15596 ) ) ( not ( = ?auto_15600 ?auto_15587 ) ) ( not ( = ?auto_15599 ?auto_15585 ) ) ( not ( = ?auto_15599 ?auto_15590 ) ) ( not ( = ?auto_15599 ?auto_15584 ) ) ( not ( = ?auto_15599 ?auto_15597 ) ) ( not ( = ?auto_15599 ?auto_15593 ) ) ( not ( = ?auto_15599 ?auto_15601 ) ) ( not ( = ?auto_15591 ?auto_15586 ) ) ( not ( = ?auto_15591 ?auto_15589 ) ) ( not ( = ?auto_15591 ?auto_15580 ) ) ( not ( = ?auto_15591 ?auto_15592 ) ) ( not ( = ?auto_15591 ?auto_15583 ) ) ( not ( = ?auto_15591 ?auto_15582 ) ) ( not ( = ?auto_15564 ?auto_15572 ) ) ( not ( = ?auto_15564 ?auto_15588 ) ) ( not ( = ?auto_15565 ?auto_15572 ) ) ( not ( = ?auto_15565 ?auto_15588 ) ) ( not ( = ?auto_15566 ?auto_15572 ) ) ( not ( = ?auto_15566 ?auto_15588 ) ) ( not ( = ?auto_15567 ?auto_15572 ) ) ( not ( = ?auto_15567 ?auto_15588 ) ) ( not ( = ?auto_15568 ?auto_15572 ) ) ( not ( = ?auto_15568 ?auto_15588 ) ) ( not ( = ?auto_15569 ?auto_15572 ) ) ( not ( = ?auto_15569 ?auto_15588 ) ) ( not ( = ?auto_15570 ?auto_15572 ) ) ( not ( = ?auto_15570 ?auto_15588 ) ) ( not ( = ?auto_15572 ?auto_15591 ) ) ( not ( = ?auto_15572 ?auto_15586 ) ) ( not ( = ?auto_15572 ?auto_15589 ) ) ( not ( = ?auto_15572 ?auto_15580 ) ) ( not ( = ?auto_15572 ?auto_15592 ) ) ( not ( = ?auto_15572 ?auto_15583 ) ) ( not ( = ?auto_15572 ?auto_15582 ) ) ( not ( = ?auto_15588 ?auto_15591 ) ) ( not ( = ?auto_15588 ?auto_15586 ) ) ( not ( = ?auto_15588 ?auto_15589 ) ) ( not ( = ?auto_15588 ?auto_15580 ) ) ( not ( = ?auto_15588 ?auto_15592 ) ) ( not ( = ?auto_15588 ?auto_15583 ) ) ( not ( = ?auto_15588 ?auto_15582 ) ) ( not ( = ?auto_15564 ?auto_15571 ) ) ( not ( = ?auto_15564 ?auto_15574 ) ) ( not ( = ?auto_15565 ?auto_15571 ) ) ( not ( = ?auto_15565 ?auto_15574 ) ) ( not ( = ?auto_15566 ?auto_15571 ) ) ( not ( = ?auto_15566 ?auto_15574 ) ) ( not ( = ?auto_15567 ?auto_15571 ) ) ( not ( = ?auto_15567 ?auto_15574 ) ) ( not ( = ?auto_15568 ?auto_15571 ) ) ( not ( = ?auto_15568 ?auto_15574 ) ) ( not ( = ?auto_15569 ?auto_15571 ) ) ( not ( = ?auto_15569 ?auto_15574 ) ) ( not ( = ?auto_15570 ?auto_15571 ) ) ( not ( = ?auto_15570 ?auto_15574 ) ) ( not ( = ?auto_15573 ?auto_15571 ) ) ( not ( = ?auto_15573 ?auto_15574 ) ) ( not ( = ?auto_15571 ?auto_15588 ) ) ( not ( = ?auto_15571 ?auto_15591 ) ) ( not ( = ?auto_15571 ?auto_15586 ) ) ( not ( = ?auto_15571 ?auto_15589 ) ) ( not ( = ?auto_15571 ?auto_15580 ) ) ( not ( = ?auto_15571 ?auto_15592 ) ) ( not ( = ?auto_15571 ?auto_15583 ) ) ( not ( = ?auto_15571 ?auto_15582 ) ) ( not ( = ?auto_15577 ?auto_15600 ) ) ( not ( = ?auto_15577 ?auto_15581 ) ) ( not ( = ?auto_15577 ?auto_15595 ) ) ( not ( = ?auto_15577 ?auto_15594 ) ) ( not ( = ?auto_15577 ?auto_15598 ) ) ( not ( = ?auto_15577 ?auto_15596 ) ) ( not ( = ?auto_15577 ?auto_15587 ) ) ( not ( = ?auto_15575 ?auto_15599 ) ) ( not ( = ?auto_15575 ?auto_15585 ) ) ( not ( = ?auto_15575 ?auto_15590 ) ) ( not ( = ?auto_15575 ?auto_15584 ) ) ( not ( = ?auto_15575 ?auto_15597 ) ) ( not ( = ?auto_15575 ?auto_15593 ) ) ( not ( = ?auto_15575 ?auto_15601 ) ) ( not ( = ?auto_15574 ?auto_15588 ) ) ( not ( = ?auto_15574 ?auto_15591 ) ) ( not ( = ?auto_15574 ?auto_15586 ) ) ( not ( = ?auto_15574 ?auto_15589 ) ) ( not ( = ?auto_15574 ?auto_15580 ) ) ( not ( = ?auto_15574 ?auto_15592 ) ) ( not ( = ?auto_15574 ?auto_15583 ) ) ( not ( = ?auto_15574 ?auto_15582 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_15564 ?auto_15565 ?auto_15566 ?auto_15567 ?auto_15568 ?auto_15569 ?auto_15570 ?auto_15573 ?auto_15572 )
      ( MAKE-1CRATE ?auto_15572 ?auto_15571 )
      ( MAKE-9CRATE-VERIFY ?auto_15564 ?auto_15565 ?auto_15566 ?auto_15567 ?auto_15568 ?auto_15569 ?auto_15570 ?auto_15573 ?auto_15572 ?auto_15571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15604 - SURFACE
      ?auto_15605 - SURFACE
    )
    :vars
    (
      ?auto_15606 - HOIST
      ?auto_15607 - PLACE
      ?auto_15609 - PLACE
      ?auto_15610 - HOIST
      ?auto_15611 - SURFACE
      ?auto_15608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15606 ?auto_15607 ) ( SURFACE-AT ?auto_15604 ?auto_15607 ) ( CLEAR ?auto_15604 ) ( IS-CRATE ?auto_15605 ) ( AVAILABLE ?auto_15606 ) ( not ( = ?auto_15609 ?auto_15607 ) ) ( HOIST-AT ?auto_15610 ?auto_15609 ) ( AVAILABLE ?auto_15610 ) ( SURFACE-AT ?auto_15605 ?auto_15609 ) ( ON ?auto_15605 ?auto_15611 ) ( CLEAR ?auto_15605 ) ( TRUCK-AT ?auto_15608 ?auto_15607 ) ( not ( = ?auto_15604 ?auto_15605 ) ) ( not ( = ?auto_15604 ?auto_15611 ) ) ( not ( = ?auto_15605 ?auto_15611 ) ) ( not ( = ?auto_15606 ?auto_15610 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15608 ?auto_15607 ?auto_15609 )
      ( !LIFT ?auto_15610 ?auto_15605 ?auto_15611 ?auto_15609 )
      ( !LOAD ?auto_15610 ?auto_15605 ?auto_15608 ?auto_15609 )
      ( !DRIVE ?auto_15608 ?auto_15609 ?auto_15607 )
      ( !UNLOAD ?auto_15606 ?auto_15605 ?auto_15608 ?auto_15607 )
      ( !DROP ?auto_15606 ?auto_15605 ?auto_15604 ?auto_15607 )
      ( MAKE-1CRATE-VERIFY ?auto_15604 ?auto_15605 ) )
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
      ?auto_15632 - SURFACE
      ?auto_15631 - SURFACE
      ?auto_15630 - SURFACE
      ?auto_15633 - SURFACE
    )
    :vars
    (
      ?auto_15639 - HOIST
      ?auto_15636 - PLACE
      ?auto_15635 - PLACE
      ?auto_15634 - HOIST
      ?auto_15637 - SURFACE
      ?auto_15661 - PLACE
      ?auto_15644 - HOIST
      ?auto_15664 - SURFACE
      ?auto_15645 - PLACE
      ?auto_15652 - HOIST
      ?auto_15646 - SURFACE
      ?auto_15640 - SURFACE
      ?auto_15642 - PLACE
      ?auto_15659 - HOIST
      ?auto_15658 - SURFACE
      ?auto_15656 - PLACE
      ?auto_15655 - HOIST
      ?auto_15647 - SURFACE
      ?auto_15650 - PLACE
      ?auto_15660 - HOIST
      ?auto_15643 - SURFACE
      ?auto_15641 - PLACE
      ?auto_15651 - HOIST
      ?auto_15648 - SURFACE
      ?auto_15653 - PLACE
      ?auto_15649 - HOIST
      ?auto_15662 - SURFACE
      ?auto_15657 - PLACE
      ?auto_15663 - HOIST
      ?auto_15654 - SURFACE
      ?auto_15638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15639 ?auto_15636 ) ( IS-CRATE ?auto_15633 ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( HOIST-AT ?auto_15634 ?auto_15635 ) ( AVAILABLE ?auto_15634 ) ( SURFACE-AT ?auto_15633 ?auto_15635 ) ( ON ?auto_15633 ?auto_15637 ) ( CLEAR ?auto_15633 ) ( not ( = ?auto_15630 ?auto_15633 ) ) ( not ( = ?auto_15630 ?auto_15637 ) ) ( not ( = ?auto_15633 ?auto_15637 ) ) ( not ( = ?auto_15639 ?auto_15634 ) ) ( IS-CRATE ?auto_15630 ) ( not ( = ?auto_15661 ?auto_15636 ) ) ( HOIST-AT ?auto_15644 ?auto_15661 ) ( AVAILABLE ?auto_15644 ) ( SURFACE-AT ?auto_15630 ?auto_15661 ) ( ON ?auto_15630 ?auto_15664 ) ( CLEAR ?auto_15630 ) ( not ( = ?auto_15631 ?auto_15630 ) ) ( not ( = ?auto_15631 ?auto_15664 ) ) ( not ( = ?auto_15630 ?auto_15664 ) ) ( not ( = ?auto_15639 ?auto_15644 ) ) ( IS-CRATE ?auto_15631 ) ( not ( = ?auto_15645 ?auto_15636 ) ) ( HOIST-AT ?auto_15652 ?auto_15645 ) ( SURFACE-AT ?auto_15631 ?auto_15645 ) ( ON ?auto_15631 ?auto_15646 ) ( CLEAR ?auto_15631 ) ( not ( = ?auto_15632 ?auto_15631 ) ) ( not ( = ?auto_15632 ?auto_15646 ) ) ( not ( = ?auto_15631 ?auto_15646 ) ) ( not ( = ?auto_15639 ?auto_15652 ) ) ( IS-CRATE ?auto_15632 ) ( AVAILABLE ?auto_15652 ) ( SURFACE-AT ?auto_15632 ?auto_15645 ) ( ON ?auto_15632 ?auto_15640 ) ( CLEAR ?auto_15632 ) ( not ( = ?auto_15629 ?auto_15632 ) ) ( not ( = ?auto_15629 ?auto_15640 ) ) ( not ( = ?auto_15632 ?auto_15640 ) ) ( IS-CRATE ?auto_15629 ) ( not ( = ?auto_15642 ?auto_15636 ) ) ( HOIST-AT ?auto_15659 ?auto_15642 ) ( AVAILABLE ?auto_15659 ) ( SURFACE-AT ?auto_15629 ?auto_15642 ) ( ON ?auto_15629 ?auto_15658 ) ( CLEAR ?auto_15629 ) ( not ( = ?auto_15628 ?auto_15629 ) ) ( not ( = ?auto_15628 ?auto_15658 ) ) ( not ( = ?auto_15629 ?auto_15658 ) ) ( not ( = ?auto_15639 ?auto_15659 ) ) ( IS-CRATE ?auto_15628 ) ( not ( = ?auto_15656 ?auto_15636 ) ) ( HOIST-AT ?auto_15655 ?auto_15656 ) ( AVAILABLE ?auto_15655 ) ( SURFACE-AT ?auto_15628 ?auto_15656 ) ( ON ?auto_15628 ?auto_15647 ) ( CLEAR ?auto_15628 ) ( not ( = ?auto_15627 ?auto_15628 ) ) ( not ( = ?auto_15627 ?auto_15647 ) ) ( not ( = ?auto_15628 ?auto_15647 ) ) ( not ( = ?auto_15639 ?auto_15655 ) ) ( IS-CRATE ?auto_15627 ) ( not ( = ?auto_15650 ?auto_15636 ) ) ( HOIST-AT ?auto_15660 ?auto_15650 ) ( AVAILABLE ?auto_15660 ) ( SURFACE-AT ?auto_15627 ?auto_15650 ) ( ON ?auto_15627 ?auto_15643 ) ( CLEAR ?auto_15627 ) ( not ( = ?auto_15626 ?auto_15627 ) ) ( not ( = ?auto_15626 ?auto_15643 ) ) ( not ( = ?auto_15627 ?auto_15643 ) ) ( not ( = ?auto_15639 ?auto_15660 ) ) ( IS-CRATE ?auto_15626 ) ( not ( = ?auto_15641 ?auto_15636 ) ) ( HOIST-AT ?auto_15651 ?auto_15641 ) ( AVAILABLE ?auto_15651 ) ( SURFACE-AT ?auto_15626 ?auto_15641 ) ( ON ?auto_15626 ?auto_15648 ) ( CLEAR ?auto_15626 ) ( not ( = ?auto_15625 ?auto_15626 ) ) ( not ( = ?auto_15625 ?auto_15648 ) ) ( not ( = ?auto_15626 ?auto_15648 ) ) ( not ( = ?auto_15639 ?auto_15651 ) ) ( IS-CRATE ?auto_15625 ) ( not ( = ?auto_15653 ?auto_15636 ) ) ( HOIST-AT ?auto_15649 ?auto_15653 ) ( AVAILABLE ?auto_15649 ) ( SURFACE-AT ?auto_15625 ?auto_15653 ) ( ON ?auto_15625 ?auto_15662 ) ( CLEAR ?auto_15625 ) ( not ( = ?auto_15624 ?auto_15625 ) ) ( not ( = ?auto_15624 ?auto_15662 ) ) ( not ( = ?auto_15625 ?auto_15662 ) ) ( not ( = ?auto_15639 ?auto_15649 ) ) ( SURFACE-AT ?auto_15623 ?auto_15636 ) ( CLEAR ?auto_15623 ) ( IS-CRATE ?auto_15624 ) ( AVAILABLE ?auto_15639 ) ( not ( = ?auto_15657 ?auto_15636 ) ) ( HOIST-AT ?auto_15663 ?auto_15657 ) ( AVAILABLE ?auto_15663 ) ( SURFACE-AT ?auto_15624 ?auto_15657 ) ( ON ?auto_15624 ?auto_15654 ) ( CLEAR ?auto_15624 ) ( TRUCK-AT ?auto_15638 ?auto_15636 ) ( not ( = ?auto_15623 ?auto_15624 ) ) ( not ( = ?auto_15623 ?auto_15654 ) ) ( not ( = ?auto_15624 ?auto_15654 ) ) ( not ( = ?auto_15639 ?auto_15663 ) ) ( not ( = ?auto_15623 ?auto_15625 ) ) ( not ( = ?auto_15623 ?auto_15662 ) ) ( not ( = ?auto_15625 ?auto_15654 ) ) ( not ( = ?auto_15653 ?auto_15657 ) ) ( not ( = ?auto_15649 ?auto_15663 ) ) ( not ( = ?auto_15662 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15626 ) ) ( not ( = ?auto_15623 ?auto_15648 ) ) ( not ( = ?auto_15624 ?auto_15626 ) ) ( not ( = ?auto_15624 ?auto_15648 ) ) ( not ( = ?auto_15626 ?auto_15662 ) ) ( not ( = ?auto_15626 ?auto_15654 ) ) ( not ( = ?auto_15641 ?auto_15653 ) ) ( not ( = ?auto_15641 ?auto_15657 ) ) ( not ( = ?auto_15651 ?auto_15649 ) ) ( not ( = ?auto_15651 ?auto_15663 ) ) ( not ( = ?auto_15648 ?auto_15662 ) ) ( not ( = ?auto_15648 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15627 ) ) ( not ( = ?auto_15623 ?auto_15643 ) ) ( not ( = ?auto_15624 ?auto_15627 ) ) ( not ( = ?auto_15624 ?auto_15643 ) ) ( not ( = ?auto_15625 ?auto_15627 ) ) ( not ( = ?auto_15625 ?auto_15643 ) ) ( not ( = ?auto_15627 ?auto_15648 ) ) ( not ( = ?auto_15627 ?auto_15662 ) ) ( not ( = ?auto_15627 ?auto_15654 ) ) ( not ( = ?auto_15650 ?auto_15641 ) ) ( not ( = ?auto_15650 ?auto_15653 ) ) ( not ( = ?auto_15650 ?auto_15657 ) ) ( not ( = ?auto_15660 ?auto_15651 ) ) ( not ( = ?auto_15660 ?auto_15649 ) ) ( not ( = ?auto_15660 ?auto_15663 ) ) ( not ( = ?auto_15643 ?auto_15648 ) ) ( not ( = ?auto_15643 ?auto_15662 ) ) ( not ( = ?auto_15643 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15628 ) ) ( not ( = ?auto_15623 ?auto_15647 ) ) ( not ( = ?auto_15624 ?auto_15628 ) ) ( not ( = ?auto_15624 ?auto_15647 ) ) ( not ( = ?auto_15625 ?auto_15628 ) ) ( not ( = ?auto_15625 ?auto_15647 ) ) ( not ( = ?auto_15626 ?auto_15628 ) ) ( not ( = ?auto_15626 ?auto_15647 ) ) ( not ( = ?auto_15628 ?auto_15643 ) ) ( not ( = ?auto_15628 ?auto_15648 ) ) ( not ( = ?auto_15628 ?auto_15662 ) ) ( not ( = ?auto_15628 ?auto_15654 ) ) ( not ( = ?auto_15656 ?auto_15650 ) ) ( not ( = ?auto_15656 ?auto_15641 ) ) ( not ( = ?auto_15656 ?auto_15653 ) ) ( not ( = ?auto_15656 ?auto_15657 ) ) ( not ( = ?auto_15655 ?auto_15660 ) ) ( not ( = ?auto_15655 ?auto_15651 ) ) ( not ( = ?auto_15655 ?auto_15649 ) ) ( not ( = ?auto_15655 ?auto_15663 ) ) ( not ( = ?auto_15647 ?auto_15643 ) ) ( not ( = ?auto_15647 ?auto_15648 ) ) ( not ( = ?auto_15647 ?auto_15662 ) ) ( not ( = ?auto_15647 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15629 ) ) ( not ( = ?auto_15623 ?auto_15658 ) ) ( not ( = ?auto_15624 ?auto_15629 ) ) ( not ( = ?auto_15624 ?auto_15658 ) ) ( not ( = ?auto_15625 ?auto_15629 ) ) ( not ( = ?auto_15625 ?auto_15658 ) ) ( not ( = ?auto_15626 ?auto_15629 ) ) ( not ( = ?auto_15626 ?auto_15658 ) ) ( not ( = ?auto_15627 ?auto_15629 ) ) ( not ( = ?auto_15627 ?auto_15658 ) ) ( not ( = ?auto_15629 ?auto_15647 ) ) ( not ( = ?auto_15629 ?auto_15643 ) ) ( not ( = ?auto_15629 ?auto_15648 ) ) ( not ( = ?auto_15629 ?auto_15662 ) ) ( not ( = ?auto_15629 ?auto_15654 ) ) ( not ( = ?auto_15642 ?auto_15656 ) ) ( not ( = ?auto_15642 ?auto_15650 ) ) ( not ( = ?auto_15642 ?auto_15641 ) ) ( not ( = ?auto_15642 ?auto_15653 ) ) ( not ( = ?auto_15642 ?auto_15657 ) ) ( not ( = ?auto_15659 ?auto_15655 ) ) ( not ( = ?auto_15659 ?auto_15660 ) ) ( not ( = ?auto_15659 ?auto_15651 ) ) ( not ( = ?auto_15659 ?auto_15649 ) ) ( not ( = ?auto_15659 ?auto_15663 ) ) ( not ( = ?auto_15658 ?auto_15647 ) ) ( not ( = ?auto_15658 ?auto_15643 ) ) ( not ( = ?auto_15658 ?auto_15648 ) ) ( not ( = ?auto_15658 ?auto_15662 ) ) ( not ( = ?auto_15658 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15632 ) ) ( not ( = ?auto_15623 ?auto_15640 ) ) ( not ( = ?auto_15624 ?auto_15632 ) ) ( not ( = ?auto_15624 ?auto_15640 ) ) ( not ( = ?auto_15625 ?auto_15632 ) ) ( not ( = ?auto_15625 ?auto_15640 ) ) ( not ( = ?auto_15626 ?auto_15632 ) ) ( not ( = ?auto_15626 ?auto_15640 ) ) ( not ( = ?auto_15627 ?auto_15632 ) ) ( not ( = ?auto_15627 ?auto_15640 ) ) ( not ( = ?auto_15628 ?auto_15632 ) ) ( not ( = ?auto_15628 ?auto_15640 ) ) ( not ( = ?auto_15632 ?auto_15658 ) ) ( not ( = ?auto_15632 ?auto_15647 ) ) ( not ( = ?auto_15632 ?auto_15643 ) ) ( not ( = ?auto_15632 ?auto_15648 ) ) ( not ( = ?auto_15632 ?auto_15662 ) ) ( not ( = ?auto_15632 ?auto_15654 ) ) ( not ( = ?auto_15645 ?auto_15642 ) ) ( not ( = ?auto_15645 ?auto_15656 ) ) ( not ( = ?auto_15645 ?auto_15650 ) ) ( not ( = ?auto_15645 ?auto_15641 ) ) ( not ( = ?auto_15645 ?auto_15653 ) ) ( not ( = ?auto_15645 ?auto_15657 ) ) ( not ( = ?auto_15652 ?auto_15659 ) ) ( not ( = ?auto_15652 ?auto_15655 ) ) ( not ( = ?auto_15652 ?auto_15660 ) ) ( not ( = ?auto_15652 ?auto_15651 ) ) ( not ( = ?auto_15652 ?auto_15649 ) ) ( not ( = ?auto_15652 ?auto_15663 ) ) ( not ( = ?auto_15640 ?auto_15658 ) ) ( not ( = ?auto_15640 ?auto_15647 ) ) ( not ( = ?auto_15640 ?auto_15643 ) ) ( not ( = ?auto_15640 ?auto_15648 ) ) ( not ( = ?auto_15640 ?auto_15662 ) ) ( not ( = ?auto_15640 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15631 ) ) ( not ( = ?auto_15623 ?auto_15646 ) ) ( not ( = ?auto_15624 ?auto_15631 ) ) ( not ( = ?auto_15624 ?auto_15646 ) ) ( not ( = ?auto_15625 ?auto_15631 ) ) ( not ( = ?auto_15625 ?auto_15646 ) ) ( not ( = ?auto_15626 ?auto_15631 ) ) ( not ( = ?auto_15626 ?auto_15646 ) ) ( not ( = ?auto_15627 ?auto_15631 ) ) ( not ( = ?auto_15627 ?auto_15646 ) ) ( not ( = ?auto_15628 ?auto_15631 ) ) ( not ( = ?auto_15628 ?auto_15646 ) ) ( not ( = ?auto_15629 ?auto_15631 ) ) ( not ( = ?auto_15629 ?auto_15646 ) ) ( not ( = ?auto_15631 ?auto_15640 ) ) ( not ( = ?auto_15631 ?auto_15658 ) ) ( not ( = ?auto_15631 ?auto_15647 ) ) ( not ( = ?auto_15631 ?auto_15643 ) ) ( not ( = ?auto_15631 ?auto_15648 ) ) ( not ( = ?auto_15631 ?auto_15662 ) ) ( not ( = ?auto_15631 ?auto_15654 ) ) ( not ( = ?auto_15646 ?auto_15640 ) ) ( not ( = ?auto_15646 ?auto_15658 ) ) ( not ( = ?auto_15646 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15643 ) ) ( not ( = ?auto_15646 ?auto_15648 ) ) ( not ( = ?auto_15646 ?auto_15662 ) ) ( not ( = ?auto_15646 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15630 ) ) ( not ( = ?auto_15623 ?auto_15664 ) ) ( not ( = ?auto_15624 ?auto_15630 ) ) ( not ( = ?auto_15624 ?auto_15664 ) ) ( not ( = ?auto_15625 ?auto_15630 ) ) ( not ( = ?auto_15625 ?auto_15664 ) ) ( not ( = ?auto_15626 ?auto_15630 ) ) ( not ( = ?auto_15626 ?auto_15664 ) ) ( not ( = ?auto_15627 ?auto_15630 ) ) ( not ( = ?auto_15627 ?auto_15664 ) ) ( not ( = ?auto_15628 ?auto_15630 ) ) ( not ( = ?auto_15628 ?auto_15664 ) ) ( not ( = ?auto_15629 ?auto_15630 ) ) ( not ( = ?auto_15629 ?auto_15664 ) ) ( not ( = ?auto_15632 ?auto_15630 ) ) ( not ( = ?auto_15632 ?auto_15664 ) ) ( not ( = ?auto_15630 ?auto_15646 ) ) ( not ( = ?auto_15630 ?auto_15640 ) ) ( not ( = ?auto_15630 ?auto_15658 ) ) ( not ( = ?auto_15630 ?auto_15647 ) ) ( not ( = ?auto_15630 ?auto_15643 ) ) ( not ( = ?auto_15630 ?auto_15648 ) ) ( not ( = ?auto_15630 ?auto_15662 ) ) ( not ( = ?auto_15630 ?auto_15654 ) ) ( not ( = ?auto_15661 ?auto_15645 ) ) ( not ( = ?auto_15661 ?auto_15642 ) ) ( not ( = ?auto_15661 ?auto_15656 ) ) ( not ( = ?auto_15661 ?auto_15650 ) ) ( not ( = ?auto_15661 ?auto_15641 ) ) ( not ( = ?auto_15661 ?auto_15653 ) ) ( not ( = ?auto_15661 ?auto_15657 ) ) ( not ( = ?auto_15644 ?auto_15652 ) ) ( not ( = ?auto_15644 ?auto_15659 ) ) ( not ( = ?auto_15644 ?auto_15655 ) ) ( not ( = ?auto_15644 ?auto_15660 ) ) ( not ( = ?auto_15644 ?auto_15651 ) ) ( not ( = ?auto_15644 ?auto_15649 ) ) ( not ( = ?auto_15644 ?auto_15663 ) ) ( not ( = ?auto_15664 ?auto_15646 ) ) ( not ( = ?auto_15664 ?auto_15640 ) ) ( not ( = ?auto_15664 ?auto_15658 ) ) ( not ( = ?auto_15664 ?auto_15647 ) ) ( not ( = ?auto_15664 ?auto_15643 ) ) ( not ( = ?auto_15664 ?auto_15648 ) ) ( not ( = ?auto_15664 ?auto_15662 ) ) ( not ( = ?auto_15664 ?auto_15654 ) ) ( not ( = ?auto_15623 ?auto_15633 ) ) ( not ( = ?auto_15623 ?auto_15637 ) ) ( not ( = ?auto_15624 ?auto_15633 ) ) ( not ( = ?auto_15624 ?auto_15637 ) ) ( not ( = ?auto_15625 ?auto_15633 ) ) ( not ( = ?auto_15625 ?auto_15637 ) ) ( not ( = ?auto_15626 ?auto_15633 ) ) ( not ( = ?auto_15626 ?auto_15637 ) ) ( not ( = ?auto_15627 ?auto_15633 ) ) ( not ( = ?auto_15627 ?auto_15637 ) ) ( not ( = ?auto_15628 ?auto_15633 ) ) ( not ( = ?auto_15628 ?auto_15637 ) ) ( not ( = ?auto_15629 ?auto_15633 ) ) ( not ( = ?auto_15629 ?auto_15637 ) ) ( not ( = ?auto_15632 ?auto_15633 ) ) ( not ( = ?auto_15632 ?auto_15637 ) ) ( not ( = ?auto_15631 ?auto_15633 ) ) ( not ( = ?auto_15631 ?auto_15637 ) ) ( not ( = ?auto_15633 ?auto_15664 ) ) ( not ( = ?auto_15633 ?auto_15646 ) ) ( not ( = ?auto_15633 ?auto_15640 ) ) ( not ( = ?auto_15633 ?auto_15658 ) ) ( not ( = ?auto_15633 ?auto_15647 ) ) ( not ( = ?auto_15633 ?auto_15643 ) ) ( not ( = ?auto_15633 ?auto_15648 ) ) ( not ( = ?auto_15633 ?auto_15662 ) ) ( not ( = ?auto_15633 ?auto_15654 ) ) ( not ( = ?auto_15635 ?auto_15661 ) ) ( not ( = ?auto_15635 ?auto_15645 ) ) ( not ( = ?auto_15635 ?auto_15642 ) ) ( not ( = ?auto_15635 ?auto_15656 ) ) ( not ( = ?auto_15635 ?auto_15650 ) ) ( not ( = ?auto_15635 ?auto_15641 ) ) ( not ( = ?auto_15635 ?auto_15653 ) ) ( not ( = ?auto_15635 ?auto_15657 ) ) ( not ( = ?auto_15634 ?auto_15644 ) ) ( not ( = ?auto_15634 ?auto_15652 ) ) ( not ( = ?auto_15634 ?auto_15659 ) ) ( not ( = ?auto_15634 ?auto_15655 ) ) ( not ( = ?auto_15634 ?auto_15660 ) ) ( not ( = ?auto_15634 ?auto_15651 ) ) ( not ( = ?auto_15634 ?auto_15649 ) ) ( not ( = ?auto_15634 ?auto_15663 ) ) ( not ( = ?auto_15637 ?auto_15664 ) ) ( not ( = ?auto_15637 ?auto_15646 ) ) ( not ( = ?auto_15637 ?auto_15640 ) ) ( not ( = ?auto_15637 ?auto_15658 ) ) ( not ( = ?auto_15637 ?auto_15647 ) ) ( not ( = ?auto_15637 ?auto_15643 ) ) ( not ( = ?auto_15637 ?auto_15648 ) ) ( not ( = ?auto_15637 ?auto_15662 ) ) ( not ( = ?auto_15637 ?auto_15654 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15623 ?auto_15624 ?auto_15625 ?auto_15626 ?auto_15627 ?auto_15628 ?auto_15629 ?auto_15632 ?auto_15631 ?auto_15630 )
      ( MAKE-1CRATE ?auto_15630 ?auto_15633 )
      ( MAKE-10CRATE-VERIFY ?auto_15623 ?auto_15624 ?auto_15625 ?auto_15626 ?auto_15627 ?auto_15628 ?auto_15629 ?auto_15632 ?auto_15631 ?auto_15630 ?auto_15633 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15667 - SURFACE
      ?auto_15668 - SURFACE
    )
    :vars
    (
      ?auto_15669 - HOIST
      ?auto_15670 - PLACE
      ?auto_15672 - PLACE
      ?auto_15673 - HOIST
      ?auto_15674 - SURFACE
      ?auto_15671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15669 ?auto_15670 ) ( SURFACE-AT ?auto_15667 ?auto_15670 ) ( CLEAR ?auto_15667 ) ( IS-CRATE ?auto_15668 ) ( AVAILABLE ?auto_15669 ) ( not ( = ?auto_15672 ?auto_15670 ) ) ( HOIST-AT ?auto_15673 ?auto_15672 ) ( AVAILABLE ?auto_15673 ) ( SURFACE-AT ?auto_15668 ?auto_15672 ) ( ON ?auto_15668 ?auto_15674 ) ( CLEAR ?auto_15668 ) ( TRUCK-AT ?auto_15671 ?auto_15670 ) ( not ( = ?auto_15667 ?auto_15668 ) ) ( not ( = ?auto_15667 ?auto_15674 ) ) ( not ( = ?auto_15668 ?auto_15674 ) ) ( not ( = ?auto_15669 ?auto_15673 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15671 ?auto_15670 ?auto_15672 )
      ( !LIFT ?auto_15673 ?auto_15668 ?auto_15674 ?auto_15672 )
      ( !LOAD ?auto_15673 ?auto_15668 ?auto_15671 ?auto_15672 )
      ( !DRIVE ?auto_15671 ?auto_15672 ?auto_15670 )
      ( !UNLOAD ?auto_15669 ?auto_15668 ?auto_15671 ?auto_15670 )
      ( !DROP ?auto_15669 ?auto_15668 ?auto_15667 ?auto_15670 )
      ( MAKE-1CRATE-VERIFY ?auto_15667 ?auto_15668 ) )
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
      ?auto_15696 - SURFACE
      ?auto_15695 - SURFACE
      ?auto_15694 - SURFACE
      ?auto_15697 - SURFACE
      ?auto_15698 - SURFACE
    )
    :vars
    (
      ?auto_15701 - HOIST
      ?auto_15702 - PLACE
      ?auto_15700 - PLACE
      ?auto_15704 - HOIST
      ?auto_15699 - SURFACE
      ?auto_15728 - PLACE
      ?auto_15725 - HOIST
      ?auto_15710 - SURFACE
      ?auto_15720 - PLACE
      ?auto_15706 - HOIST
      ?auto_15723 - SURFACE
      ?auto_15714 - PLACE
      ?auto_15713 - HOIST
      ?auto_15717 - SURFACE
      ?auto_15715 - SURFACE
      ?auto_15730 - PLACE
      ?auto_15721 - HOIST
      ?auto_15729 - SURFACE
      ?auto_15731 - PLACE
      ?auto_15709 - HOIST
      ?auto_15718 - SURFACE
      ?auto_15711 - PLACE
      ?auto_15719 - HOIST
      ?auto_15716 - SURFACE
      ?auto_15708 - PLACE
      ?auto_15705 - HOIST
      ?auto_15722 - SURFACE
      ?auto_15732 - PLACE
      ?auto_15712 - HOIST
      ?auto_15727 - SURFACE
      ?auto_15707 - PLACE
      ?auto_15726 - HOIST
      ?auto_15724 - SURFACE
      ?auto_15703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15701 ?auto_15702 ) ( IS-CRATE ?auto_15698 ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( HOIST-AT ?auto_15704 ?auto_15700 ) ( AVAILABLE ?auto_15704 ) ( SURFACE-AT ?auto_15698 ?auto_15700 ) ( ON ?auto_15698 ?auto_15699 ) ( CLEAR ?auto_15698 ) ( not ( = ?auto_15697 ?auto_15698 ) ) ( not ( = ?auto_15697 ?auto_15699 ) ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( IS-CRATE ?auto_15697 ) ( not ( = ?auto_15728 ?auto_15702 ) ) ( HOIST-AT ?auto_15725 ?auto_15728 ) ( AVAILABLE ?auto_15725 ) ( SURFACE-AT ?auto_15697 ?auto_15728 ) ( ON ?auto_15697 ?auto_15710 ) ( CLEAR ?auto_15697 ) ( not ( = ?auto_15694 ?auto_15697 ) ) ( not ( = ?auto_15694 ?auto_15710 ) ) ( not ( = ?auto_15697 ?auto_15710 ) ) ( not ( = ?auto_15701 ?auto_15725 ) ) ( IS-CRATE ?auto_15694 ) ( not ( = ?auto_15720 ?auto_15702 ) ) ( HOIST-AT ?auto_15706 ?auto_15720 ) ( AVAILABLE ?auto_15706 ) ( SURFACE-AT ?auto_15694 ?auto_15720 ) ( ON ?auto_15694 ?auto_15723 ) ( CLEAR ?auto_15694 ) ( not ( = ?auto_15695 ?auto_15694 ) ) ( not ( = ?auto_15695 ?auto_15723 ) ) ( not ( = ?auto_15694 ?auto_15723 ) ) ( not ( = ?auto_15701 ?auto_15706 ) ) ( IS-CRATE ?auto_15695 ) ( not ( = ?auto_15714 ?auto_15702 ) ) ( HOIST-AT ?auto_15713 ?auto_15714 ) ( SURFACE-AT ?auto_15695 ?auto_15714 ) ( ON ?auto_15695 ?auto_15717 ) ( CLEAR ?auto_15695 ) ( not ( = ?auto_15696 ?auto_15695 ) ) ( not ( = ?auto_15696 ?auto_15717 ) ) ( not ( = ?auto_15695 ?auto_15717 ) ) ( not ( = ?auto_15701 ?auto_15713 ) ) ( IS-CRATE ?auto_15696 ) ( AVAILABLE ?auto_15713 ) ( SURFACE-AT ?auto_15696 ?auto_15714 ) ( ON ?auto_15696 ?auto_15715 ) ( CLEAR ?auto_15696 ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15693 ?auto_15715 ) ) ( not ( = ?auto_15696 ?auto_15715 ) ) ( IS-CRATE ?auto_15693 ) ( not ( = ?auto_15730 ?auto_15702 ) ) ( HOIST-AT ?auto_15721 ?auto_15730 ) ( AVAILABLE ?auto_15721 ) ( SURFACE-AT ?auto_15693 ?auto_15730 ) ( ON ?auto_15693 ?auto_15729 ) ( CLEAR ?auto_15693 ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( not ( = ?auto_15692 ?auto_15729 ) ) ( not ( = ?auto_15693 ?auto_15729 ) ) ( not ( = ?auto_15701 ?auto_15721 ) ) ( IS-CRATE ?auto_15692 ) ( not ( = ?auto_15731 ?auto_15702 ) ) ( HOIST-AT ?auto_15709 ?auto_15731 ) ( AVAILABLE ?auto_15709 ) ( SURFACE-AT ?auto_15692 ?auto_15731 ) ( ON ?auto_15692 ?auto_15718 ) ( CLEAR ?auto_15692 ) ( not ( = ?auto_15691 ?auto_15692 ) ) ( not ( = ?auto_15691 ?auto_15718 ) ) ( not ( = ?auto_15692 ?auto_15718 ) ) ( not ( = ?auto_15701 ?auto_15709 ) ) ( IS-CRATE ?auto_15691 ) ( not ( = ?auto_15711 ?auto_15702 ) ) ( HOIST-AT ?auto_15719 ?auto_15711 ) ( AVAILABLE ?auto_15719 ) ( SURFACE-AT ?auto_15691 ?auto_15711 ) ( ON ?auto_15691 ?auto_15716 ) ( CLEAR ?auto_15691 ) ( not ( = ?auto_15690 ?auto_15691 ) ) ( not ( = ?auto_15690 ?auto_15716 ) ) ( not ( = ?auto_15691 ?auto_15716 ) ) ( not ( = ?auto_15701 ?auto_15719 ) ) ( IS-CRATE ?auto_15690 ) ( not ( = ?auto_15708 ?auto_15702 ) ) ( HOIST-AT ?auto_15705 ?auto_15708 ) ( AVAILABLE ?auto_15705 ) ( SURFACE-AT ?auto_15690 ?auto_15708 ) ( ON ?auto_15690 ?auto_15722 ) ( CLEAR ?auto_15690 ) ( not ( = ?auto_15689 ?auto_15690 ) ) ( not ( = ?auto_15689 ?auto_15722 ) ) ( not ( = ?auto_15690 ?auto_15722 ) ) ( not ( = ?auto_15701 ?auto_15705 ) ) ( IS-CRATE ?auto_15689 ) ( not ( = ?auto_15732 ?auto_15702 ) ) ( HOIST-AT ?auto_15712 ?auto_15732 ) ( AVAILABLE ?auto_15712 ) ( SURFACE-AT ?auto_15689 ?auto_15732 ) ( ON ?auto_15689 ?auto_15727 ) ( CLEAR ?auto_15689 ) ( not ( = ?auto_15688 ?auto_15689 ) ) ( not ( = ?auto_15688 ?auto_15727 ) ) ( not ( = ?auto_15689 ?auto_15727 ) ) ( not ( = ?auto_15701 ?auto_15712 ) ) ( SURFACE-AT ?auto_15687 ?auto_15702 ) ( CLEAR ?auto_15687 ) ( IS-CRATE ?auto_15688 ) ( AVAILABLE ?auto_15701 ) ( not ( = ?auto_15707 ?auto_15702 ) ) ( HOIST-AT ?auto_15726 ?auto_15707 ) ( AVAILABLE ?auto_15726 ) ( SURFACE-AT ?auto_15688 ?auto_15707 ) ( ON ?auto_15688 ?auto_15724 ) ( CLEAR ?auto_15688 ) ( TRUCK-AT ?auto_15703 ?auto_15702 ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15724 ) ) ( not ( = ?auto_15688 ?auto_15724 ) ) ( not ( = ?auto_15701 ?auto_15726 ) ) ( not ( = ?auto_15687 ?auto_15689 ) ) ( not ( = ?auto_15687 ?auto_15727 ) ) ( not ( = ?auto_15689 ?auto_15724 ) ) ( not ( = ?auto_15732 ?auto_15707 ) ) ( not ( = ?auto_15712 ?auto_15726 ) ) ( not ( = ?auto_15727 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15690 ) ) ( not ( = ?auto_15687 ?auto_15722 ) ) ( not ( = ?auto_15688 ?auto_15690 ) ) ( not ( = ?auto_15688 ?auto_15722 ) ) ( not ( = ?auto_15690 ?auto_15727 ) ) ( not ( = ?auto_15690 ?auto_15724 ) ) ( not ( = ?auto_15708 ?auto_15732 ) ) ( not ( = ?auto_15708 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15712 ) ) ( not ( = ?auto_15705 ?auto_15726 ) ) ( not ( = ?auto_15722 ?auto_15727 ) ) ( not ( = ?auto_15722 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15691 ) ) ( not ( = ?auto_15687 ?auto_15716 ) ) ( not ( = ?auto_15688 ?auto_15691 ) ) ( not ( = ?auto_15688 ?auto_15716 ) ) ( not ( = ?auto_15689 ?auto_15691 ) ) ( not ( = ?auto_15689 ?auto_15716 ) ) ( not ( = ?auto_15691 ?auto_15722 ) ) ( not ( = ?auto_15691 ?auto_15727 ) ) ( not ( = ?auto_15691 ?auto_15724 ) ) ( not ( = ?auto_15711 ?auto_15708 ) ) ( not ( = ?auto_15711 ?auto_15732 ) ) ( not ( = ?auto_15711 ?auto_15707 ) ) ( not ( = ?auto_15719 ?auto_15705 ) ) ( not ( = ?auto_15719 ?auto_15712 ) ) ( not ( = ?auto_15719 ?auto_15726 ) ) ( not ( = ?auto_15716 ?auto_15722 ) ) ( not ( = ?auto_15716 ?auto_15727 ) ) ( not ( = ?auto_15716 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15692 ) ) ( not ( = ?auto_15687 ?auto_15718 ) ) ( not ( = ?auto_15688 ?auto_15692 ) ) ( not ( = ?auto_15688 ?auto_15718 ) ) ( not ( = ?auto_15689 ?auto_15692 ) ) ( not ( = ?auto_15689 ?auto_15718 ) ) ( not ( = ?auto_15690 ?auto_15692 ) ) ( not ( = ?auto_15690 ?auto_15718 ) ) ( not ( = ?auto_15692 ?auto_15716 ) ) ( not ( = ?auto_15692 ?auto_15722 ) ) ( not ( = ?auto_15692 ?auto_15727 ) ) ( not ( = ?auto_15692 ?auto_15724 ) ) ( not ( = ?auto_15731 ?auto_15711 ) ) ( not ( = ?auto_15731 ?auto_15708 ) ) ( not ( = ?auto_15731 ?auto_15732 ) ) ( not ( = ?auto_15731 ?auto_15707 ) ) ( not ( = ?auto_15709 ?auto_15719 ) ) ( not ( = ?auto_15709 ?auto_15705 ) ) ( not ( = ?auto_15709 ?auto_15712 ) ) ( not ( = ?auto_15709 ?auto_15726 ) ) ( not ( = ?auto_15718 ?auto_15716 ) ) ( not ( = ?auto_15718 ?auto_15722 ) ) ( not ( = ?auto_15718 ?auto_15727 ) ) ( not ( = ?auto_15718 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15693 ) ) ( not ( = ?auto_15687 ?auto_15729 ) ) ( not ( = ?auto_15688 ?auto_15693 ) ) ( not ( = ?auto_15688 ?auto_15729 ) ) ( not ( = ?auto_15689 ?auto_15693 ) ) ( not ( = ?auto_15689 ?auto_15729 ) ) ( not ( = ?auto_15690 ?auto_15693 ) ) ( not ( = ?auto_15690 ?auto_15729 ) ) ( not ( = ?auto_15691 ?auto_15693 ) ) ( not ( = ?auto_15691 ?auto_15729 ) ) ( not ( = ?auto_15693 ?auto_15718 ) ) ( not ( = ?auto_15693 ?auto_15716 ) ) ( not ( = ?auto_15693 ?auto_15722 ) ) ( not ( = ?auto_15693 ?auto_15727 ) ) ( not ( = ?auto_15693 ?auto_15724 ) ) ( not ( = ?auto_15730 ?auto_15731 ) ) ( not ( = ?auto_15730 ?auto_15711 ) ) ( not ( = ?auto_15730 ?auto_15708 ) ) ( not ( = ?auto_15730 ?auto_15732 ) ) ( not ( = ?auto_15730 ?auto_15707 ) ) ( not ( = ?auto_15721 ?auto_15709 ) ) ( not ( = ?auto_15721 ?auto_15719 ) ) ( not ( = ?auto_15721 ?auto_15705 ) ) ( not ( = ?auto_15721 ?auto_15712 ) ) ( not ( = ?auto_15721 ?auto_15726 ) ) ( not ( = ?auto_15729 ?auto_15718 ) ) ( not ( = ?auto_15729 ?auto_15716 ) ) ( not ( = ?auto_15729 ?auto_15722 ) ) ( not ( = ?auto_15729 ?auto_15727 ) ) ( not ( = ?auto_15729 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15696 ) ) ( not ( = ?auto_15687 ?auto_15715 ) ) ( not ( = ?auto_15688 ?auto_15696 ) ) ( not ( = ?auto_15688 ?auto_15715 ) ) ( not ( = ?auto_15689 ?auto_15696 ) ) ( not ( = ?auto_15689 ?auto_15715 ) ) ( not ( = ?auto_15690 ?auto_15696 ) ) ( not ( = ?auto_15690 ?auto_15715 ) ) ( not ( = ?auto_15691 ?auto_15696 ) ) ( not ( = ?auto_15691 ?auto_15715 ) ) ( not ( = ?auto_15692 ?auto_15696 ) ) ( not ( = ?auto_15692 ?auto_15715 ) ) ( not ( = ?auto_15696 ?auto_15729 ) ) ( not ( = ?auto_15696 ?auto_15718 ) ) ( not ( = ?auto_15696 ?auto_15716 ) ) ( not ( = ?auto_15696 ?auto_15722 ) ) ( not ( = ?auto_15696 ?auto_15727 ) ) ( not ( = ?auto_15696 ?auto_15724 ) ) ( not ( = ?auto_15714 ?auto_15730 ) ) ( not ( = ?auto_15714 ?auto_15731 ) ) ( not ( = ?auto_15714 ?auto_15711 ) ) ( not ( = ?auto_15714 ?auto_15708 ) ) ( not ( = ?auto_15714 ?auto_15732 ) ) ( not ( = ?auto_15714 ?auto_15707 ) ) ( not ( = ?auto_15713 ?auto_15721 ) ) ( not ( = ?auto_15713 ?auto_15709 ) ) ( not ( = ?auto_15713 ?auto_15719 ) ) ( not ( = ?auto_15713 ?auto_15705 ) ) ( not ( = ?auto_15713 ?auto_15712 ) ) ( not ( = ?auto_15713 ?auto_15726 ) ) ( not ( = ?auto_15715 ?auto_15729 ) ) ( not ( = ?auto_15715 ?auto_15718 ) ) ( not ( = ?auto_15715 ?auto_15716 ) ) ( not ( = ?auto_15715 ?auto_15722 ) ) ( not ( = ?auto_15715 ?auto_15727 ) ) ( not ( = ?auto_15715 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15695 ) ) ( not ( = ?auto_15687 ?auto_15717 ) ) ( not ( = ?auto_15688 ?auto_15695 ) ) ( not ( = ?auto_15688 ?auto_15717 ) ) ( not ( = ?auto_15689 ?auto_15695 ) ) ( not ( = ?auto_15689 ?auto_15717 ) ) ( not ( = ?auto_15690 ?auto_15695 ) ) ( not ( = ?auto_15690 ?auto_15717 ) ) ( not ( = ?auto_15691 ?auto_15695 ) ) ( not ( = ?auto_15691 ?auto_15717 ) ) ( not ( = ?auto_15692 ?auto_15695 ) ) ( not ( = ?auto_15692 ?auto_15717 ) ) ( not ( = ?auto_15693 ?auto_15695 ) ) ( not ( = ?auto_15693 ?auto_15717 ) ) ( not ( = ?auto_15695 ?auto_15715 ) ) ( not ( = ?auto_15695 ?auto_15729 ) ) ( not ( = ?auto_15695 ?auto_15718 ) ) ( not ( = ?auto_15695 ?auto_15716 ) ) ( not ( = ?auto_15695 ?auto_15722 ) ) ( not ( = ?auto_15695 ?auto_15727 ) ) ( not ( = ?auto_15695 ?auto_15724 ) ) ( not ( = ?auto_15717 ?auto_15715 ) ) ( not ( = ?auto_15717 ?auto_15729 ) ) ( not ( = ?auto_15717 ?auto_15718 ) ) ( not ( = ?auto_15717 ?auto_15716 ) ) ( not ( = ?auto_15717 ?auto_15722 ) ) ( not ( = ?auto_15717 ?auto_15727 ) ) ( not ( = ?auto_15717 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15694 ) ) ( not ( = ?auto_15687 ?auto_15723 ) ) ( not ( = ?auto_15688 ?auto_15694 ) ) ( not ( = ?auto_15688 ?auto_15723 ) ) ( not ( = ?auto_15689 ?auto_15694 ) ) ( not ( = ?auto_15689 ?auto_15723 ) ) ( not ( = ?auto_15690 ?auto_15694 ) ) ( not ( = ?auto_15690 ?auto_15723 ) ) ( not ( = ?auto_15691 ?auto_15694 ) ) ( not ( = ?auto_15691 ?auto_15723 ) ) ( not ( = ?auto_15692 ?auto_15694 ) ) ( not ( = ?auto_15692 ?auto_15723 ) ) ( not ( = ?auto_15693 ?auto_15694 ) ) ( not ( = ?auto_15693 ?auto_15723 ) ) ( not ( = ?auto_15696 ?auto_15694 ) ) ( not ( = ?auto_15696 ?auto_15723 ) ) ( not ( = ?auto_15694 ?auto_15717 ) ) ( not ( = ?auto_15694 ?auto_15715 ) ) ( not ( = ?auto_15694 ?auto_15729 ) ) ( not ( = ?auto_15694 ?auto_15718 ) ) ( not ( = ?auto_15694 ?auto_15716 ) ) ( not ( = ?auto_15694 ?auto_15722 ) ) ( not ( = ?auto_15694 ?auto_15727 ) ) ( not ( = ?auto_15694 ?auto_15724 ) ) ( not ( = ?auto_15720 ?auto_15714 ) ) ( not ( = ?auto_15720 ?auto_15730 ) ) ( not ( = ?auto_15720 ?auto_15731 ) ) ( not ( = ?auto_15720 ?auto_15711 ) ) ( not ( = ?auto_15720 ?auto_15708 ) ) ( not ( = ?auto_15720 ?auto_15732 ) ) ( not ( = ?auto_15720 ?auto_15707 ) ) ( not ( = ?auto_15706 ?auto_15713 ) ) ( not ( = ?auto_15706 ?auto_15721 ) ) ( not ( = ?auto_15706 ?auto_15709 ) ) ( not ( = ?auto_15706 ?auto_15719 ) ) ( not ( = ?auto_15706 ?auto_15705 ) ) ( not ( = ?auto_15706 ?auto_15712 ) ) ( not ( = ?auto_15706 ?auto_15726 ) ) ( not ( = ?auto_15723 ?auto_15717 ) ) ( not ( = ?auto_15723 ?auto_15715 ) ) ( not ( = ?auto_15723 ?auto_15729 ) ) ( not ( = ?auto_15723 ?auto_15718 ) ) ( not ( = ?auto_15723 ?auto_15716 ) ) ( not ( = ?auto_15723 ?auto_15722 ) ) ( not ( = ?auto_15723 ?auto_15727 ) ) ( not ( = ?auto_15723 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15697 ) ) ( not ( = ?auto_15687 ?auto_15710 ) ) ( not ( = ?auto_15688 ?auto_15697 ) ) ( not ( = ?auto_15688 ?auto_15710 ) ) ( not ( = ?auto_15689 ?auto_15697 ) ) ( not ( = ?auto_15689 ?auto_15710 ) ) ( not ( = ?auto_15690 ?auto_15697 ) ) ( not ( = ?auto_15690 ?auto_15710 ) ) ( not ( = ?auto_15691 ?auto_15697 ) ) ( not ( = ?auto_15691 ?auto_15710 ) ) ( not ( = ?auto_15692 ?auto_15697 ) ) ( not ( = ?auto_15692 ?auto_15710 ) ) ( not ( = ?auto_15693 ?auto_15697 ) ) ( not ( = ?auto_15693 ?auto_15710 ) ) ( not ( = ?auto_15696 ?auto_15697 ) ) ( not ( = ?auto_15696 ?auto_15710 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15695 ?auto_15710 ) ) ( not ( = ?auto_15697 ?auto_15723 ) ) ( not ( = ?auto_15697 ?auto_15717 ) ) ( not ( = ?auto_15697 ?auto_15715 ) ) ( not ( = ?auto_15697 ?auto_15729 ) ) ( not ( = ?auto_15697 ?auto_15718 ) ) ( not ( = ?auto_15697 ?auto_15716 ) ) ( not ( = ?auto_15697 ?auto_15722 ) ) ( not ( = ?auto_15697 ?auto_15727 ) ) ( not ( = ?auto_15697 ?auto_15724 ) ) ( not ( = ?auto_15728 ?auto_15720 ) ) ( not ( = ?auto_15728 ?auto_15714 ) ) ( not ( = ?auto_15728 ?auto_15730 ) ) ( not ( = ?auto_15728 ?auto_15731 ) ) ( not ( = ?auto_15728 ?auto_15711 ) ) ( not ( = ?auto_15728 ?auto_15708 ) ) ( not ( = ?auto_15728 ?auto_15732 ) ) ( not ( = ?auto_15728 ?auto_15707 ) ) ( not ( = ?auto_15725 ?auto_15706 ) ) ( not ( = ?auto_15725 ?auto_15713 ) ) ( not ( = ?auto_15725 ?auto_15721 ) ) ( not ( = ?auto_15725 ?auto_15709 ) ) ( not ( = ?auto_15725 ?auto_15719 ) ) ( not ( = ?auto_15725 ?auto_15705 ) ) ( not ( = ?auto_15725 ?auto_15712 ) ) ( not ( = ?auto_15725 ?auto_15726 ) ) ( not ( = ?auto_15710 ?auto_15723 ) ) ( not ( = ?auto_15710 ?auto_15717 ) ) ( not ( = ?auto_15710 ?auto_15715 ) ) ( not ( = ?auto_15710 ?auto_15729 ) ) ( not ( = ?auto_15710 ?auto_15718 ) ) ( not ( = ?auto_15710 ?auto_15716 ) ) ( not ( = ?auto_15710 ?auto_15722 ) ) ( not ( = ?auto_15710 ?auto_15727 ) ) ( not ( = ?auto_15710 ?auto_15724 ) ) ( not ( = ?auto_15687 ?auto_15698 ) ) ( not ( = ?auto_15687 ?auto_15699 ) ) ( not ( = ?auto_15688 ?auto_15698 ) ) ( not ( = ?auto_15688 ?auto_15699 ) ) ( not ( = ?auto_15689 ?auto_15698 ) ) ( not ( = ?auto_15689 ?auto_15699 ) ) ( not ( = ?auto_15690 ?auto_15698 ) ) ( not ( = ?auto_15690 ?auto_15699 ) ) ( not ( = ?auto_15691 ?auto_15698 ) ) ( not ( = ?auto_15691 ?auto_15699 ) ) ( not ( = ?auto_15692 ?auto_15698 ) ) ( not ( = ?auto_15692 ?auto_15699 ) ) ( not ( = ?auto_15693 ?auto_15698 ) ) ( not ( = ?auto_15693 ?auto_15699 ) ) ( not ( = ?auto_15696 ?auto_15698 ) ) ( not ( = ?auto_15696 ?auto_15699 ) ) ( not ( = ?auto_15695 ?auto_15698 ) ) ( not ( = ?auto_15695 ?auto_15699 ) ) ( not ( = ?auto_15694 ?auto_15698 ) ) ( not ( = ?auto_15694 ?auto_15699 ) ) ( not ( = ?auto_15698 ?auto_15710 ) ) ( not ( = ?auto_15698 ?auto_15723 ) ) ( not ( = ?auto_15698 ?auto_15717 ) ) ( not ( = ?auto_15698 ?auto_15715 ) ) ( not ( = ?auto_15698 ?auto_15729 ) ) ( not ( = ?auto_15698 ?auto_15718 ) ) ( not ( = ?auto_15698 ?auto_15716 ) ) ( not ( = ?auto_15698 ?auto_15722 ) ) ( not ( = ?auto_15698 ?auto_15727 ) ) ( not ( = ?auto_15698 ?auto_15724 ) ) ( not ( = ?auto_15700 ?auto_15728 ) ) ( not ( = ?auto_15700 ?auto_15720 ) ) ( not ( = ?auto_15700 ?auto_15714 ) ) ( not ( = ?auto_15700 ?auto_15730 ) ) ( not ( = ?auto_15700 ?auto_15731 ) ) ( not ( = ?auto_15700 ?auto_15711 ) ) ( not ( = ?auto_15700 ?auto_15708 ) ) ( not ( = ?auto_15700 ?auto_15732 ) ) ( not ( = ?auto_15700 ?auto_15707 ) ) ( not ( = ?auto_15704 ?auto_15725 ) ) ( not ( = ?auto_15704 ?auto_15706 ) ) ( not ( = ?auto_15704 ?auto_15713 ) ) ( not ( = ?auto_15704 ?auto_15721 ) ) ( not ( = ?auto_15704 ?auto_15709 ) ) ( not ( = ?auto_15704 ?auto_15719 ) ) ( not ( = ?auto_15704 ?auto_15705 ) ) ( not ( = ?auto_15704 ?auto_15712 ) ) ( not ( = ?auto_15704 ?auto_15726 ) ) ( not ( = ?auto_15699 ?auto_15710 ) ) ( not ( = ?auto_15699 ?auto_15723 ) ) ( not ( = ?auto_15699 ?auto_15717 ) ) ( not ( = ?auto_15699 ?auto_15715 ) ) ( not ( = ?auto_15699 ?auto_15729 ) ) ( not ( = ?auto_15699 ?auto_15718 ) ) ( not ( = ?auto_15699 ?auto_15716 ) ) ( not ( = ?auto_15699 ?auto_15722 ) ) ( not ( = ?auto_15699 ?auto_15727 ) ) ( not ( = ?auto_15699 ?auto_15724 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15687 ?auto_15688 ?auto_15689 ?auto_15690 ?auto_15691 ?auto_15692 ?auto_15693 ?auto_15696 ?auto_15695 ?auto_15694 ?auto_15697 )
      ( MAKE-1CRATE ?auto_15697 ?auto_15698 )
      ( MAKE-11CRATE-VERIFY ?auto_15687 ?auto_15688 ?auto_15689 ?auto_15690 ?auto_15691 ?auto_15692 ?auto_15693 ?auto_15696 ?auto_15695 ?auto_15694 ?auto_15697 ?auto_15698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15735 - SURFACE
      ?auto_15736 - SURFACE
    )
    :vars
    (
      ?auto_15737 - HOIST
      ?auto_15738 - PLACE
      ?auto_15740 - PLACE
      ?auto_15741 - HOIST
      ?auto_15742 - SURFACE
      ?auto_15739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15737 ?auto_15738 ) ( SURFACE-AT ?auto_15735 ?auto_15738 ) ( CLEAR ?auto_15735 ) ( IS-CRATE ?auto_15736 ) ( AVAILABLE ?auto_15737 ) ( not ( = ?auto_15740 ?auto_15738 ) ) ( HOIST-AT ?auto_15741 ?auto_15740 ) ( AVAILABLE ?auto_15741 ) ( SURFACE-AT ?auto_15736 ?auto_15740 ) ( ON ?auto_15736 ?auto_15742 ) ( CLEAR ?auto_15736 ) ( TRUCK-AT ?auto_15739 ?auto_15738 ) ( not ( = ?auto_15735 ?auto_15736 ) ) ( not ( = ?auto_15735 ?auto_15742 ) ) ( not ( = ?auto_15736 ?auto_15742 ) ) ( not ( = ?auto_15737 ?auto_15741 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15739 ?auto_15738 ?auto_15740 )
      ( !LIFT ?auto_15741 ?auto_15736 ?auto_15742 ?auto_15740 )
      ( !LOAD ?auto_15741 ?auto_15736 ?auto_15739 ?auto_15740 )
      ( !DRIVE ?auto_15739 ?auto_15740 ?auto_15738 )
      ( !UNLOAD ?auto_15737 ?auto_15736 ?auto_15739 ?auto_15738 )
      ( !DROP ?auto_15737 ?auto_15736 ?auto_15735 ?auto_15738 )
      ( MAKE-1CRATE-VERIFY ?auto_15735 ?auto_15736 ) )
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
      ?auto_15765 - SURFACE
      ?auto_15764 - SURFACE
      ?auto_15763 - SURFACE
      ?auto_15766 - SURFACE
      ?auto_15767 - SURFACE
      ?auto_15768 - SURFACE
    )
    :vars
    (
      ?auto_15770 - HOIST
      ?auto_15773 - PLACE
      ?auto_15769 - PLACE
      ?auto_15774 - HOIST
      ?auto_15771 - SURFACE
      ?auto_15797 - PLACE
      ?auto_15776 - HOIST
      ?auto_15800 - SURFACE
      ?auto_15792 - PLACE
      ?auto_15799 - HOIST
      ?auto_15778 - SURFACE
      ?auto_15805 - PLACE
      ?auto_15781 - HOIST
      ?auto_15782 - SURFACE
      ?auto_15801 - PLACE
      ?auto_15784 - HOIST
      ?auto_15788 - SURFACE
      ?auto_15798 - SURFACE
      ?auto_15787 - PLACE
      ?auto_15794 - HOIST
      ?auto_15791 - SURFACE
      ?auto_15783 - PLACE
      ?auto_15803 - HOIST
      ?auto_15804 - SURFACE
      ?auto_15785 - PLACE
      ?auto_15790 - HOIST
      ?auto_15796 - SURFACE
      ?auto_15777 - PLACE
      ?auto_15775 - HOIST
      ?auto_15786 - SURFACE
      ?auto_15779 - PLACE
      ?auto_15789 - HOIST
      ?auto_15780 - SURFACE
      ?auto_15793 - PLACE
      ?auto_15795 - HOIST
      ?auto_15802 - SURFACE
      ?auto_15772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15770 ?auto_15773 ) ( IS-CRATE ?auto_15768 ) ( not ( = ?auto_15769 ?auto_15773 ) ) ( HOIST-AT ?auto_15774 ?auto_15769 ) ( AVAILABLE ?auto_15774 ) ( SURFACE-AT ?auto_15768 ?auto_15769 ) ( ON ?auto_15768 ?auto_15771 ) ( CLEAR ?auto_15768 ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15774 ) ) ( IS-CRATE ?auto_15767 ) ( not ( = ?auto_15797 ?auto_15773 ) ) ( HOIST-AT ?auto_15776 ?auto_15797 ) ( AVAILABLE ?auto_15776 ) ( SURFACE-AT ?auto_15767 ?auto_15797 ) ( ON ?auto_15767 ?auto_15800 ) ( CLEAR ?auto_15767 ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( not ( = ?auto_15766 ?auto_15800 ) ) ( not ( = ?auto_15767 ?auto_15800 ) ) ( not ( = ?auto_15770 ?auto_15776 ) ) ( IS-CRATE ?auto_15766 ) ( not ( = ?auto_15792 ?auto_15773 ) ) ( HOIST-AT ?auto_15799 ?auto_15792 ) ( AVAILABLE ?auto_15799 ) ( SURFACE-AT ?auto_15766 ?auto_15792 ) ( ON ?auto_15766 ?auto_15778 ) ( CLEAR ?auto_15766 ) ( not ( = ?auto_15763 ?auto_15766 ) ) ( not ( = ?auto_15763 ?auto_15778 ) ) ( not ( = ?auto_15766 ?auto_15778 ) ) ( not ( = ?auto_15770 ?auto_15799 ) ) ( IS-CRATE ?auto_15763 ) ( not ( = ?auto_15805 ?auto_15773 ) ) ( HOIST-AT ?auto_15781 ?auto_15805 ) ( AVAILABLE ?auto_15781 ) ( SURFACE-AT ?auto_15763 ?auto_15805 ) ( ON ?auto_15763 ?auto_15782 ) ( CLEAR ?auto_15763 ) ( not ( = ?auto_15764 ?auto_15763 ) ) ( not ( = ?auto_15764 ?auto_15782 ) ) ( not ( = ?auto_15763 ?auto_15782 ) ) ( not ( = ?auto_15770 ?auto_15781 ) ) ( IS-CRATE ?auto_15764 ) ( not ( = ?auto_15801 ?auto_15773 ) ) ( HOIST-AT ?auto_15784 ?auto_15801 ) ( SURFACE-AT ?auto_15764 ?auto_15801 ) ( ON ?auto_15764 ?auto_15788 ) ( CLEAR ?auto_15764 ) ( not ( = ?auto_15765 ?auto_15764 ) ) ( not ( = ?auto_15765 ?auto_15788 ) ) ( not ( = ?auto_15764 ?auto_15788 ) ) ( not ( = ?auto_15770 ?auto_15784 ) ) ( IS-CRATE ?auto_15765 ) ( AVAILABLE ?auto_15784 ) ( SURFACE-AT ?auto_15765 ?auto_15801 ) ( ON ?auto_15765 ?auto_15798 ) ( CLEAR ?auto_15765 ) ( not ( = ?auto_15762 ?auto_15765 ) ) ( not ( = ?auto_15762 ?auto_15798 ) ) ( not ( = ?auto_15765 ?auto_15798 ) ) ( IS-CRATE ?auto_15762 ) ( not ( = ?auto_15787 ?auto_15773 ) ) ( HOIST-AT ?auto_15794 ?auto_15787 ) ( AVAILABLE ?auto_15794 ) ( SURFACE-AT ?auto_15762 ?auto_15787 ) ( ON ?auto_15762 ?auto_15791 ) ( CLEAR ?auto_15762 ) ( not ( = ?auto_15761 ?auto_15762 ) ) ( not ( = ?auto_15761 ?auto_15791 ) ) ( not ( = ?auto_15762 ?auto_15791 ) ) ( not ( = ?auto_15770 ?auto_15794 ) ) ( IS-CRATE ?auto_15761 ) ( not ( = ?auto_15783 ?auto_15773 ) ) ( HOIST-AT ?auto_15803 ?auto_15783 ) ( AVAILABLE ?auto_15803 ) ( SURFACE-AT ?auto_15761 ?auto_15783 ) ( ON ?auto_15761 ?auto_15804 ) ( CLEAR ?auto_15761 ) ( not ( = ?auto_15760 ?auto_15761 ) ) ( not ( = ?auto_15760 ?auto_15804 ) ) ( not ( = ?auto_15761 ?auto_15804 ) ) ( not ( = ?auto_15770 ?auto_15803 ) ) ( IS-CRATE ?auto_15760 ) ( not ( = ?auto_15785 ?auto_15773 ) ) ( HOIST-AT ?auto_15790 ?auto_15785 ) ( AVAILABLE ?auto_15790 ) ( SURFACE-AT ?auto_15760 ?auto_15785 ) ( ON ?auto_15760 ?auto_15796 ) ( CLEAR ?auto_15760 ) ( not ( = ?auto_15759 ?auto_15760 ) ) ( not ( = ?auto_15759 ?auto_15796 ) ) ( not ( = ?auto_15760 ?auto_15796 ) ) ( not ( = ?auto_15770 ?auto_15790 ) ) ( IS-CRATE ?auto_15759 ) ( not ( = ?auto_15777 ?auto_15773 ) ) ( HOIST-AT ?auto_15775 ?auto_15777 ) ( AVAILABLE ?auto_15775 ) ( SURFACE-AT ?auto_15759 ?auto_15777 ) ( ON ?auto_15759 ?auto_15786 ) ( CLEAR ?auto_15759 ) ( not ( = ?auto_15758 ?auto_15759 ) ) ( not ( = ?auto_15758 ?auto_15786 ) ) ( not ( = ?auto_15759 ?auto_15786 ) ) ( not ( = ?auto_15770 ?auto_15775 ) ) ( IS-CRATE ?auto_15758 ) ( not ( = ?auto_15779 ?auto_15773 ) ) ( HOIST-AT ?auto_15789 ?auto_15779 ) ( AVAILABLE ?auto_15789 ) ( SURFACE-AT ?auto_15758 ?auto_15779 ) ( ON ?auto_15758 ?auto_15780 ) ( CLEAR ?auto_15758 ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15780 ) ) ( not ( = ?auto_15758 ?auto_15780 ) ) ( not ( = ?auto_15770 ?auto_15789 ) ) ( SURFACE-AT ?auto_15756 ?auto_15773 ) ( CLEAR ?auto_15756 ) ( IS-CRATE ?auto_15757 ) ( AVAILABLE ?auto_15770 ) ( not ( = ?auto_15793 ?auto_15773 ) ) ( HOIST-AT ?auto_15795 ?auto_15793 ) ( AVAILABLE ?auto_15795 ) ( SURFACE-AT ?auto_15757 ?auto_15793 ) ( ON ?auto_15757 ?auto_15802 ) ( CLEAR ?auto_15757 ) ( TRUCK-AT ?auto_15772 ?auto_15773 ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( not ( = ?auto_15756 ?auto_15802 ) ) ( not ( = ?auto_15757 ?auto_15802 ) ) ( not ( = ?auto_15770 ?auto_15795 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15780 ) ) ( not ( = ?auto_15758 ?auto_15802 ) ) ( not ( = ?auto_15779 ?auto_15793 ) ) ( not ( = ?auto_15789 ?auto_15795 ) ) ( not ( = ?auto_15780 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15759 ) ) ( not ( = ?auto_15756 ?auto_15786 ) ) ( not ( = ?auto_15757 ?auto_15759 ) ) ( not ( = ?auto_15757 ?auto_15786 ) ) ( not ( = ?auto_15759 ?auto_15780 ) ) ( not ( = ?auto_15759 ?auto_15802 ) ) ( not ( = ?auto_15777 ?auto_15779 ) ) ( not ( = ?auto_15777 ?auto_15793 ) ) ( not ( = ?auto_15775 ?auto_15789 ) ) ( not ( = ?auto_15775 ?auto_15795 ) ) ( not ( = ?auto_15786 ?auto_15780 ) ) ( not ( = ?auto_15786 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15760 ) ) ( not ( = ?auto_15756 ?auto_15796 ) ) ( not ( = ?auto_15757 ?auto_15760 ) ) ( not ( = ?auto_15757 ?auto_15796 ) ) ( not ( = ?auto_15758 ?auto_15760 ) ) ( not ( = ?auto_15758 ?auto_15796 ) ) ( not ( = ?auto_15760 ?auto_15786 ) ) ( not ( = ?auto_15760 ?auto_15780 ) ) ( not ( = ?auto_15760 ?auto_15802 ) ) ( not ( = ?auto_15785 ?auto_15777 ) ) ( not ( = ?auto_15785 ?auto_15779 ) ) ( not ( = ?auto_15785 ?auto_15793 ) ) ( not ( = ?auto_15790 ?auto_15775 ) ) ( not ( = ?auto_15790 ?auto_15789 ) ) ( not ( = ?auto_15790 ?auto_15795 ) ) ( not ( = ?auto_15796 ?auto_15786 ) ) ( not ( = ?auto_15796 ?auto_15780 ) ) ( not ( = ?auto_15796 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15761 ) ) ( not ( = ?auto_15756 ?auto_15804 ) ) ( not ( = ?auto_15757 ?auto_15761 ) ) ( not ( = ?auto_15757 ?auto_15804 ) ) ( not ( = ?auto_15758 ?auto_15761 ) ) ( not ( = ?auto_15758 ?auto_15804 ) ) ( not ( = ?auto_15759 ?auto_15761 ) ) ( not ( = ?auto_15759 ?auto_15804 ) ) ( not ( = ?auto_15761 ?auto_15796 ) ) ( not ( = ?auto_15761 ?auto_15786 ) ) ( not ( = ?auto_15761 ?auto_15780 ) ) ( not ( = ?auto_15761 ?auto_15802 ) ) ( not ( = ?auto_15783 ?auto_15785 ) ) ( not ( = ?auto_15783 ?auto_15777 ) ) ( not ( = ?auto_15783 ?auto_15779 ) ) ( not ( = ?auto_15783 ?auto_15793 ) ) ( not ( = ?auto_15803 ?auto_15790 ) ) ( not ( = ?auto_15803 ?auto_15775 ) ) ( not ( = ?auto_15803 ?auto_15789 ) ) ( not ( = ?auto_15803 ?auto_15795 ) ) ( not ( = ?auto_15804 ?auto_15796 ) ) ( not ( = ?auto_15804 ?auto_15786 ) ) ( not ( = ?auto_15804 ?auto_15780 ) ) ( not ( = ?auto_15804 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15762 ) ) ( not ( = ?auto_15756 ?auto_15791 ) ) ( not ( = ?auto_15757 ?auto_15762 ) ) ( not ( = ?auto_15757 ?auto_15791 ) ) ( not ( = ?auto_15758 ?auto_15762 ) ) ( not ( = ?auto_15758 ?auto_15791 ) ) ( not ( = ?auto_15759 ?auto_15762 ) ) ( not ( = ?auto_15759 ?auto_15791 ) ) ( not ( = ?auto_15760 ?auto_15762 ) ) ( not ( = ?auto_15760 ?auto_15791 ) ) ( not ( = ?auto_15762 ?auto_15804 ) ) ( not ( = ?auto_15762 ?auto_15796 ) ) ( not ( = ?auto_15762 ?auto_15786 ) ) ( not ( = ?auto_15762 ?auto_15780 ) ) ( not ( = ?auto_15762 ?auto_15802 ) ) ( not ( = ?auto_15787 ?auto_15783 ) ) ( not ( = ?auto_15787 ?auto_15785 ) ) ( not ( = ?auto_15787 ?auto_15777 ) ) ( not ( = ?auto_15787 ?auto_15779 ) ) ( not ( = ?auto_15787 ?auto_15793 ) ) ( not ( = ?auto_15794 ?auto_15803 ) ) ( not ( = ?auto_15794 ?auto_15790 ) ) ( not ( = ?auto_15794 ?auto_15775 ) ) ( not ( = ?auto_15794 ?auto_15789 ) ) ( not ( = ?auto_15794 ?auto_15795 ) ) ( not ( = ?auto_15791 ?auto_15804 ) ) ( not ( = ?auto_15791 ?auto_15796 ) ) ( not ( = ?auto_15791 ?auto_15786 ) ) ( not ( = ?auto_15791 ?auto_15780 ) ) ( not ( = ?auto_15791 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15765 ) ) ( not ( = ?auto_15756 ?auto_15798 ) ) ( not ( = ?auto_15757 ?auto_15765 ) ) ( not ( = ?auto_15757 ?auto_15798 ) ) ( not ( = ?auto_15758 ?auto_15765 ) ) ( not ( = ?auto_15758 ?auto_15798 ) ) ( not ( = ?auto_15759 ?auto_15765 ) ) ( not ( = ?auto_15759 ?auto_15798 ) ) ( not ( = ?auto_15760 ?auto_15765 ) ) ( not ( = ?auto_15760 ?auto_15798 ) ) ( not ( = ?auto_15761 ?auto_15765 ) ) ( not ( = ?auto_15761 ?auto_15798 ) ) ( not ( = ?auto_15765 ?auto_15791 ) ) ( not ( = ?auto_15765 ?auto_15804 ) ) ( not ( = ?auto_15765 ?auto_15796 ) ) ( not ( = ?auto_15765 ?auto_15786 ) ) ( not ( = ?auto_15765 ?auto_15780 ) ) ( not ( = ?auto_15765 ?auto_15802 ) ) ( not ( = ?auto_15801 ?auto_15787 ) ) ( not ( = ?auto_15801 ?auto_15783 ) ) ( not ( = ?auto_15801 ?auto_15785 ) ) ( not ( = ?auto_15801 ?auto_15777 ) ) ( not ( = ?auto_15801 ?auto_15779 ) ) ( not ( = ?auto_15801 ?auto_15793 ) ) ( not ( = ?auto_15784 ?auto_15794 ) ) ( not ( = ?auto_15784 ?auto_15803 ) ) ( not ( = ?auto_15784 ?auto_15790 ) ) ( not ( = ?auto_15784 ?auto_15775 ) ) ( not ( = ?auto_15784 ?auto_15789 ) ) ( not ( = ?auto_15784 ?auto_15795 ) ) ( not ( = ?auto_15798 ?auto_15791 ) ) ( not ( = ?auto_15798 ?auto_15804 ) ) ( not ( = ?auto_15798 ?auto_15796 ) ) ( not ( = ?auto_15798 ?auto_15786 ) ) ( not ( = ?auto_15798 ?auto_15780 ) ) ( not ( = ?auto_15798 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15764 ) ) ( not ( = ?auto_15756 ?auto_15788 ) ) ( not ( = ?auto_15757 ?auto_15764 ) ) ( not ( = ?auto_15757 ?auto_15788 ) ) ( not ( = ?auto_15758 ?auto_15764 ) ) ( not ( = ?auto_15758 ?auto_15788 ) ) ( not ( = ?auto_15759 ?auto_15764 ) ) ( not ( = ?auto_15759 ?auto_15788 ) ) ( not ( = ?auto_15760 ?auto_15764 ) ) ( not ( = ?auto_15760 ?auto_15788 ) ) ( not ( = ?auto_15761 ?auto_15764 ) ) ( not ( = ?auto_15761 ?auto_15788 ) ) ( not ( = ?auto_15762 ?auto_15764 ) ) ( not ( = ?auto_15762 ?auto_15788 ) ) ( not ( = ?auto_15764 ?auto_15798 ) ) ( not ( = ?auto_15764 ?auto_15791 ) ) ( not ( = ?auto_15764 ?auto_15804 ) ) ( not ( = ?auto_15764 ?auto_15796 ) ) ( not ( = ?auto_15764 ?auto_15786 ) ) ( not ( = ?auto_15764 ?auto_15780 ) ) ( not ( = ?auto_15764 ?auto_15802 ) ) ( not ( = ?auto_15788 ?auto_15798 ) ) ( not ( = ?auto_15788 ?auto_15791 ) ) ( not ( = ?auto_15788 ?auto_15804 ) ) ( not ( = ?auto_15788 ?auto_15796 ) ) ( not ( = ?auto_15788 ?auto_15786 ) ) ( not ( = ?auto_15788 ?auto_15780 ) ) ( not ( = ?auto_15788 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15763 ) ) ( not ( = ?auto_15756 ?auto_15782 ) ) ( not ( = ?auto_15757 ?auto_15763 ) ) ( not ( = ?auto_15757 ?auto_15782 ) ) ( not ( = ?auto_15758 ?auto_15763 ) ) ( not ( = ?auto_15758 ?auto_15782 ) ) ( not ( = ?auto_15759 ?auto_15763 ) ) ( not ( = ?auto_15759 ?auto_15782 ) ) ( not ( = ?auto_15760 ?auto_15763 ) ) ( not ( = ?auto_15760 ?auto_15782 ) ) ( not ( = ?auto_15761 ?auto_15763 ) ) ( not ( = ?auto_15761 ?auto_15782 ) ) ( not ( = ?auto_15762 ?auto_15763 ) ) ( not ( = ?auto_15762 ?auto_15782 ) ) ( not ( = ?auto_15765 ?auto_15763 ) ) ( not ( = ?auto_15765 ?auto_15782 ) ) ( not ( = ?auto_15763 ?auto_15788 ) ) ( not ( = ?auto_15763 ?auto_15798 ) ) ( not ( = ?auto_15763 ?auto_15791 ) ) ( not ( = ?auto_15763 ?auto_15804 ) ) ( not ( = ?auto_15763 ?auto_15796 ) ) ( not ( = ?auto_15763 ?auto_15786 ) ) ( not ( = ?auto_15763 ?auto_15780 ) ) ( not ( = ?auto_15763 ?auto_15802 ) ) ( not ( = ?auto_15805 ?auto_15801 ) ) ( not ( = ?auto_15805 ?auto_15787 ) ) ( not ( = ?auto_15805 ?auto_15783 ) ) ( not ( = ?auto_15805 ?auto_15785 ) ) ( not ( = ?auto_15805 ?auto_15777 ) ) ( not ( = ?auto_15805 ?auto_15779 ) ) ( not ( = ?auto_15805 ?auto_15793 ) ) ( not ( = ?auto_15781 ?auto_15784 ) ) ( not ( = ?auto_15781 ?auto_15794 ) ) ( not ( = ?auto_15781 ?auto_15803 ) ) ( not ( = ?auto_15781 ?auto_15790 ) ) ( not ( = ?auto_15781 ?auto_15775 ) ) ( not ( = ?auto_15781 ?auto_15789 ) ) ( not ( = ?auto_15781 ?auto_15795 ) ) ( not ( = ?auto_15782 ?auto_15788 ) ) ( not ( = ?auto_15782 ?auto_15798 ) ) ( not ( = ?auto_15782 ?auto_15791 ) ) ( not ( = ?auto_15782 ?auto_15804 ) ) ( not ( = ?auto_15782 ?auto_15796 ) ) ( not ( = ?auto_15782 ?auto_15786 ) ) ( not ( = ?auto_15782 ?auto_15780 ) ) ( not ( = ?auto_15782 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15766 ) ) ( not ( = ?auto_15756 ?auto_15778 ) ) ( not ( = ?auto_15757 ?auto_15766 ) ) ( not ( = ?auto_15757 ?auto_15778 ) ) ( not ( = ?auto_15758 ?auto_15766 ) ) ( not ( = ?auto_15758 ?auto_15778 ) ) ( not ( = ?auto_15759 ?auto_15766 ) ) ( not ( = ?auto_15759 ?auto_15778 ) ) ( not ( = ?auto_15760 ?auto_15766 ) ) ( not ( = ?auto_15760 ?auto_15778 ) ) ( not ( = ?auto_15761 ?auto_15766 ) ) ( not ( = ?auto_15761 ?auto_15778 ) ) ( not ( = ?auto_15762 ?auto_15766 ) ) ( not ( = ?auto_15762 ?auto_15778 ) ) ( not ( = ?auto_15765 ?auto_15766 ) ) ( not ( = ?auto_15765 ?auto_15778 ) ) ( not ( = ?auto_15764 ?auto_15766 ) ) ( not ( = ?auto_15764 ?auto_15778 ) ) ( not ( = ?auto_15766 ?auto_15782 ) ) ( not ( = ?auto_15766 ?auto_15788 ) ) ( not ( = ?auto_15766 ?auto_15798 ) ) ( not ( = ?auto_15766 ?auto_15791 ) ) ( not ( = ?auto_15766 ?auto_15804 ) ) ( not ( = ?auto_15766 ?auto_15796 ) ) ( not ( = ?auto_15766 ?auto_15786 ) ) ( not ( = ?auto_15766 ?auto_15780 ) ) ( not ( = ?auto_15766 ?auto_15802 ) ) ( not ( = ?auto_15792 ?auto_15805 ) ) ( not ( = ?auto_15792 ?auto_15801 ) ) ( not ( = ?auto_15792 ?auto_15787 ) ) ( not ( = ?auto_15792 ?auto_15783 ) ) ( not ( = ?auto_15792 ?auto_15785 ) ) ( not ( = ?auto_15792 ?auto_15777 ) ) ( not ( = ?auto_15792 ?auto_15779 ) ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( not ( = ?auto_15799 ?auto_15781 ) ) ( not ( = ?auto_15799 ?auto_15784 ) ) ( not ( = ?auto_15799 ?auto_15794 ) ) ( not ( = ?auto_15799 ?auto_15803 ) ) ( not ( = ?auto_15799 ?auto_15790 ) ) ( not ( = ?auto_15799 ?auto_15775 ) ) ( not ( = ?auto_15799 ?auto_15789 ) ) ( not ( = ?auto_15799 ?auto_15795 ) ) ( not ( = ?auto_15778 ?auto_15782 ) ) ( not ( = ?auto_15778 ?auto_15788 ) ) ( not ( = ?auto_15778 ?auto_15798 ) ) ( not ( = ?auto_15778 ?auto_15791 ) ) ( not ( = ?auto_15778 ?auto_15804 ) ) ( not ( = ?auto_15778 ?auto_15796 ) ) ( not ( = ?auto_15778 ?auto_15786 ) ) ( not ( = ?auto_15778 ?auto_15780 ) ) ( not ( = ?auto_15778 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15767 ) ) ( not ( = ?auto_15756 ?auto_15800 ) ) ( not ( = ?auto_15757 ?auto_15767 ) ) ( not ( = ?auto_15757 ?auto_15800 ) ) ( not ( = ?auto_15758 ?auto_15767 ) ) ( not ( = ?auto_15758 ?auto_15800 ) ) ( not ( = ?auto_15759 ?auto_15767 ) ) ( not ( = ?auto_15759 ?auto_15800 ) ) ( not ( = ?auto_15760 ?auto_15767 ) ) ( not ( = ?auto_15760 ?auto_15800 ) ) ( not ( = ?auto_15761 ?auto_15767 ) ) ( not ( = ?auto_15761 ?auto_15800 ) ) ( not ( = ?auto_15762 ?auto_15767 ) ) ( not ( = ?auto_15762 ?auto_15800 ) ) ( not ( = ?auto_15765 ?auto_15767 ) ) ( not ( = ?auto_15765 ?auto_15800 ) ) ( not ( = ?auto_15764 ?auto_15767 ) ) ( not ( = ?auto_15764 ?auto_15800 ) ) ( not ( = ?auto_15763 ?auto_15767 ) ) ( not ( = ?auto_15763 ?auto_15800 ) ) ( not ( = ?auto_15767 ?auto_15778 ) ) ( not ( = ?auto_15767 ?auto_15782 ) ) ( not ( = ?auto_15767 ?auto_15788 ) ) ( not ( = ?auto_15767 ?auto_15798 ) ) ( not ( = ?auto_15767 ?auto_15791 ) ) ( not ( = ?auto_15767 ?auto_15804 ) ) ( not ( = ?auto_15767 ?auto_15796 ) ) ( not ( = ?auto_15767 ?auto_15786 ) ) ( not ( = ?auto_15767 ?auto_15780 ) ) ( not ( = ?auto_15767 ?auto_15802 ) ) ( not ( = ?auto_15797 ?auto_15792 ) ) ( not ( = ?auto_15797 ?auto_15805 ) ) ( not ( = ?auto_15797 ?auto_15801 ) ) ( not ( = ?auto_15797 ?auto_15787 ) ) ( not ( = ?auto_15797 ?auto_15783 ) ) ( not ( = ?auto_15797 ?auto_15785 ) ) ( not ( = ?auto_15797 ?auto_15777 ) ) ( not ( = ?auto_15797 ?auto_15779 ) ) ( not ( = ?auto_15797 ?auto_15793 ) ) ( not ( = ?auto_15776 ?auto_15799 ) ) ( not ( = ?auto_15776 ?auto_15781 ) ) ( not ( = ?auto_15776 ?auto_15784 ) ) ( not ( = ?auto_15776 ?auto_15794 ) ) ( not ( = ?auto_15776 ?auto_15803 ) ) ( not ( = ?auto_15776 ?auto_15790 ) ) ( not ( = ?auto_15776 ?auto_15775 ) ) ( not ( = ?auto_15776 ?auto_15789 ) ) ( not ( = ?auto_15776 ?auto_15795 ) ) ( not ( = ?auto_15800 ?auto_15778 ) ) ( not ( = ?auto_15800 ?auto_15782 ) ) ( not ( = ?auto_15800 ?auto_15788 ) ) ( not ( = ?auto_15800 ?auto_15798 ) ) ( not ( = ?auto_15800 ?auto_15791 ) ) ( not ( = ?auto_15800 ?auto_15804 ) ) ( not ( = ?auto_15800 ?auto_15796 ) ) ( not ( = ?auto_15800 ?auto_15786 ) ) ( not ( = ?auto_15800 ?auto_15780 ) ) ( not ( = ?auto_15800 ?auto_15802 ) ) ( not ( = ?auto_15756 ?auto_15768 ) ) ( not ( = ?auto_15756 ?auto_15771 ) ) ( not ( = ?auto_15757 ?auto_15768 ) ) ( not ( = ?auto_15757 ?auto_15771 ) ) ( not ( = ?auto_15758 ?auto_15768 ) ) ( not ( = ?auto_15758 ?auto_15771 ) ) ( not ( = ?auto_15759 ?auto_15768 ) ) ( not ( = ?auto_15759 ?auto_15771 ) ) ( not ( = ?auto_15760 ?auto_15768 ) ) ( not ( = ?auto_15760 ?auto_15771 ) ) ( not ( = ?auto_15761 ?auto_15768 ) ) ( not ( = ?auto_15761 ?auto_15771 ) ) ( not ( = ?auto_15762 ?auto_15768 ) ) ( not ( = ?auto_15762 ?auto_15771 ) ) ( not ( = ?auto_15765 ?auto_15768 ) ) ( not ( = ?auto_15765 ?auto_15771 ) ) ( not ( = ?auto_15764 ?auto_15768 ) ) ( not ( = ?auto_15764 ?auto_15771 ) ) ( not ( = ?auto_15763 ?auto_15768 ) ) ( not ( = ?auto_15763 ?auto_15771 ) ) ( not ( = ?auto_15766 ?auto_15768 ) ) ( not ( = ?auto_15766 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15800 ) ) ( not ( = ?auto_15768 ?auto_15778 ) ) ( not ( = ?auto_15768 ?auto_15782 ) ) ( not ( = ?auto_15768 ?auto_15788 ) ) ( not ( = ?auto_15768 ?auto_15798 ) ) ( not ( = ?auto_15768 ?auto_15791 ) ) ( not ( = ?auto_15768 ?auto_15804 ) ) ( not ( = ?auto_15768 ?auto_15796 ) ) ( not ( = ?auto_15768 ?auto_15786 ) ) ( not ( = ?auto_15768 ?auto_15780 ) ) ( not ( = ?auto_15768 ?auto_15802 ) ) ( not ( = ?auto_15769 ?auto_15797 ) ) ( not ( = ?auto_15769 ?auto_15792 ) ) ( not ( = ?auto_15769 ?auto_15805 ) ) ( not ( = ?auto_15769 ?auto_15801 ) ) ( not ( = ?auto_15769 ?auto_15787 ) ) ( not ( = ?auto_15769 ?auto_15783 ) ) ( not ( = ?auto_15769 ?auto_15785 ) ) ( not ( = ?auto_15769 ?auto_15777 ) ) ( not ( = ?auto_15769 ?auto_15779 ) ) ( not ( = ?auto_15769 ?auto_15793 ) ) ( not ( = ?auto_15774 ?auto_15776 ) ) ( not ( = ?auto_15774 ?auto_15799 ) ) ( not ( = ?auto_15774 ?auto_15781 ) ) ( not ( = ?auto_15774 ?auto_15784 ) ) ( not ( = ?auto_15774 ?auto_15794 ) ) ( not ( = ?auto_15774 ?auto_15803 ) ) ( not ( = ?auto_15774 ?auto_15790 ) ) ( not ( = ?auto_15774 ?auto_15775 ) ) ( not ( = ?auto_15774 ?auto_15789 ) ) ( not ( = ?auto_15774 ?auto_15795 ) ) ( not ( = ?auto_15771 ?auto_15800 ) ) ( not ( = ?auto_15771 ?auto_15778 ) ) ( not ( = ?auto_15771 ?auto_15782 ) ) ( not ( = ?auto_15771 ?auto_15788 ) ) ( not ( = ?auto_15771 ?auto_15798 ) ) ( not ( = ?auto_15771 ?auto_15791 ) ) ( not ( = ?auto_15771 ?auto_15804 ) ) ( not ( = ?auto_15771 ?auto_15796 ) ) ( not ( = ?auto_15771 ?auto_15786 ) ) ( not ( = ?auto_15771 ?auto_15780 ) ) ( not ( = ?auto_15771 ?auto_15802 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15756 ?auto_15757 ?auto_15758 ?auto_15759 ?auto_15760 ?auto_15761 ?auto_15762 ?auto_15765 ?auto_15764 ?auto_15763 ?auto_15766 ?auto_15767 )
      ( MAKE-1CRATE ?auto_15767 ?auto_15768 )
      ( MAKE-12CRATE-VERIFY ?auto_15756 ?auto_15757 ?auto_15758 ?auto_15759 ?auto_15760 ?auto_15761 ?auto_15762 ?auto_15765 ?auto_15764 ?auto_15763 ?auto_15766 ?auto_15767 ?auto_15768 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15808 - SURFACE
      ?auto_15809 - SURFACE
    )
    :vars
    (
      ?auto_15810 - HOIST
      ?auto_15811 - PLACE
      ?auto_15813 - PLACE
      ?auto_15814 - HOIST
      ?auto_15815 - SURFACE
      ?auto_15812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15810 ?auto_15811 ) ( SURFACE-AT ?auto_15808 ?auto_15811 ) ( CLEAR ?auto_15808 ) ( IS-CRATE ?auto_15809 ) ( AVAILABLE ?auto_15810 ) ( not ( = ?auto_15813 ?auto_15811 ) ) ( HOIST-AT ?auto_15814 ?auto_15813 ) ( AVAILABLE ?auto_15814 ) ( SURFACE-AT ?auto_15809 ?auto_15813 ) ( ON ?auto_15809 ?auto_15815 ) ( CLEAR ?auto_15809 ) ( TRUCK-AT ?auto_15812 ?auto_15811 ) ( not ( = ?auto_15808 ?auto_15809 ) ) ( not ( = ?auto_15808 ?auto_15815 ) ) ( not ( = ?auto_15809 ?auto_15815 ) ) ( not ( = ?auto_15810 ?auto_15814 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15812 ?auto_15811 ?auto_15813 )
      ( !LIFT ?auto_15814 ?auto_15809 ?auto_15815 ?auto_15813 )
      ( !LOAD ?auto_15814 ?auto_15809 ?auto_15812 ?auto_15813 )
      ( !DRIVE ?auto_15812 ?auto_15813 ?auto_15811 )
      ( !UNLOAD ?auto_15810 ?auto_15809 ?auto_15812 ?auto_15811 )
      ( !DROP ?auto_15810 ?auto_15809 ?auto_15808 ?auto_15811 )
      ( MAKE-1CRATE-VERIFY ?auto_15808 ?auto_15809 ) )
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
      ?auto_15839 - SURFACE
      ?auto_15838 - SURFACE
      ?auto_15837 - SURFACE
      ?auto_15840 - SURFACE
      ?auto_15841 - SURFACE
      ?auto_15842 - SURFACE
      ?auto_15843 - SURFACE
    )
    :vars
    (
      ?auto_15845 - HOIST
      ?auto_15849 - PLACE
      ?auto_15844 - PLACE
      ?auto_15847 - HOIST
      ?auto_15846 - SURFACE
      ?auto_15854 - PLACE
      ?auto_15856 - HOIST
      ?auto_15865 - SURFACE
      ?auto_15879 - PLACE
      ?auto_15872 - HOIST
      ?auto_15880 - SURFACE
      ?auto_15858 - PLACE
      ?auto_15864 - HOIST
      ?auto_15868 - SURFACE
      ?auto_15851 - PLACE
      ?auto_15874 - HOIST
      ?auto_15862 - SURFACE
      ?auto_15861 - PLACE
      ?auto_15870 - HOIST
      ?auto_15866 - SURFACE
      ?auto_15881 - SURFACE
      ?auto_15853 - PLACE
      ?auto_15860 - HOIST
      ?auto_15863 - SURFACE
      ?auto_15873 - PLACE
      ?auto_15877 - HOIST
      ?auto_15850 - SURFACE
      ?auto_15855 - PLACE
      ?auto_15876 - HOIST
      ?auto_15871 - SURFACE
      ?auto_15869 - PLACE
      ?auto_15857 - HOIST
      ?auto_15878 - SURFACE
      ?auto_15852 - PLACE
      ?auto_15859 - HOIST
      ?auto_15867 - SURFACE
      ?auto_15875 - SURFACE
      ?auto_15848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15845 ?auto_15849 ) ( IS-CRATE ?auto_15843 ) ( not ( = ?auto_15844 ?auto_15849 ) ) ( HOIST-AT ?auto_15847 ?auto_15844 ) ( SURFACE-AT ?auto_15843 ?auto_15844 ) ( ON ?auto_15843 ?auto_15846 ) ( CLEAR ?auto_15843 ) ( not ( = ?auto_15842 ?auto_15843 ) ) ( not ( = ?auto_15842 ?auto_15846 ) ) ( not ( = ?auto_15843 ?auto_15846 ) ) ( not ( = ?auto_15845 ?auto_15847 ) ) ( IS-CRATE ?auto_15842 ) ( not ( = ?auto_15854 ?auto_15849 ) ) ( HOIST-AT ?auto_15856 ?auto_15854 ) ( AVAILABLE ?auto_15856 ) ( SURFACE-AT ?auto_15842 ?auto_15854 ) ( ON ?auto_15842 ?auto_15865 ) ( CLEAR ?auto_15842 ) ( not ( = ?auto_15841 ?auto_15842 ) ) ( not ( = ?auto_15841 ?auto_15865 ) ) ( not ( = ?auto_15842 ?auto_15865 ) ) ( not ( = ?auto_15845 ?auto_15856 ) ) ( IS-CRATE ?auto_15841 ) ( not ( = ?auto_15879 ?auto_15849 ) ) ( HOIST-AT ?auto_15872 ?auto_15879 ) ( AVAILABLE ?auto_15872 ) ( SURFACE-AT ?auto_15841 ?auto_15879 ) ( ON ?auto_15841 ?auto_15880 ) ( CLEAR ?auto_15841 ) ( not ( = ?auto_15840 ?auto_15841 ) ) ( not ( = ?auto_15840 ?auto_15880 ) ) ( not ( = ?auto_15841 ?auto_15880 ) ) ( not ( = ?auto_15845 ?auto_15872 ) ) ( IS-CRATE ?auto_15840 ) ( not ( = ?auto_15858 ?auto_15849 ) ) ( HOIST-AT ?auto_15864 ?auto_15858 ) ( AVAILABLE ?auto_15864 ) ( SURFACE-AT ?auto_15840 ?auto_15858 ) ( ON ?auto_15840 ?auto_15868 ) ( CLEAR ?auto_15840 ) ( not ( = ?auto_15837 ?auto_15840 ) ) ( not ( = ?auto_15837 ?auto_15868 ) ) ( not ( = ?auto_15840 ?auto_15868 ) ) ( not ( = ?auto_15845 ?auto_15864 ) ) ( IS-CRATE ?auto_15837 ) ( not ( = ?auto_15851 ?auto_15849 ) ) ( HOIST-AT ?auto_15874 ?auto_15851 ) ( AVAILABLE ?auto_15874 ) ( SURFACE-AT ?auto_15837 ?auto_15851 ) ( ON ?auto_15837 ?auto_15862 ) ( CLEAR ?auto_15837 ) ( not ( = ?auto_15838 ?auto_15837 ) ) ( not ( = ?auto_15838 ?auto_15862 ) ) ( not ( = ?auto_15837 ?auto_15862 ) ) ( not ( = ?auto_15845 ?auto_15874 ) ) ( IS-CRATE ?auto_15838 ) ( not ( = ?auto_15861 ?auto_15849 ) ) ( HOIST-AT ?auto_15870 ?auto_15861 ) ( SURFACE-AT ?auto_15838 ?auto_15861 ) ( ON ?auto_15838 ?auto_15866 ) ( CLEAR ?auto_15838 ) ( not ( = ?auto_15839 ?auto_15838 ) ) ( not ( = ?auto_15839 ?auto_15866 ) ) ( not ( = ?auto_15838 ?auto_15866 ) ) ( not ( = ?auto_15845 ?auto_15870 ) ) ( IS-CRATE ?auto_15839 ) ( AVAILABLE ?auto_15870 ) ( SURFACE-AT ?auto_15839 ?auto_15861 ) ( ON ?auto_15839 ?auto_15881 ) ( CLEAR ?auto_15839 ) ( not ( = ?auto_15836 ?auto_15839 ) ) ( not ( = ?auto_15836 ?auto_15881 ) ) ( not ( = ?auto_15839 ?auto_15881 ) ) ( IS-CRATE ?auto_15836 ) ( not ( = ?auto_15853 ?auto_15849 ) ) ( HOIST-AT ?auto_15860 ?auto_15853 ) ( AVAILABLE ?auto_15860 ) ( SURFACE-AT ?auto_15836 ?auto_15853 ) ( ON ?auto_15836 ?auto_15863 ) ( CLEAR ?auto_15836 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( not ( = ?auto_15835 ?auto_15863 ) ) ( not ( = ?auto_15836 ?auto_15863 ) ) ( not ( = ?auto_15845 ?auto_15860 ) ) ( IS-CRATE ?auto_15835 ) ( not ( = ?auto_15873 ?auto_15849 ) ) ( HOIST-AT ?auto_15877 ?auto_15873 ) ( AVAILABLE ?auto_15877 ) ( SURFACE-AT ?auto_15835 ?auto_15873 ) ( ON ?auto_15835 ?auto_15850 ) ( CLEAR ?auto_15835 ) ( not ( = ?auto_15834 ?auto_15835 ) ) ( not ( = ?auto_15834 ?auto_15850 ) ) ( not ( = ?auto_15835 ?auto_15850 ) ) ( not ( = ?auto_15845 ?auto_15877 ) ) ( IS-CRATE ?auto_15834 ) ( not ( = ?auto_15855 ?auto_15849 ) ) ( HOIST-AT ?auto_15876 ?auto_15855 ) ( AVAILABLE ?auto_15876 ) ( SURFACE-AT ?auto_15834 ?auto_15855 ) ( ON ?auto_15834 ?auto_15871 ) ( CLEAR ?auto_15834 ) ( not ( = ?auto_15833 ?auto_15834 ) ) ( not ( = ?auto_15833 ?auto_15871 ) ) ( not ( = ?auto_15834 ?auto_15871 ) ) ( not ( = ?auto_15845 ?auto_15876 ) ) ( IS-CRATE ?auto_15833 ) ( not ( = ?auto_15869 ?auto_15849 ) ) ( HOIST-AT ?auto_15857 ?auto_15869 ) ( AVAILABLE ?auto_15857 ) ( SURFACE-AT ?auto_15833 ?auto_15869 ) ( ON ?auto_15833 ?auto_15878 ) ( CLEAR ?auto_15833 ) ( not ( = ?auto_15832 ?auto_15833 ) ) ( not ( = ?auto_15832 ?auto_15878 ) ) ( not ( = ?auto_15833 ?auto_15878 ) ) ( not ( = ?auto_15845 ?auto_15857 ) ) ( IS-CRATE ?auto_15832 ) ( not ( = ?auto_15852 ?auto_15849 ) ) ( HOIST-AT ?auto_15859 ?auto_15852 ) ( AVAILABLE ?auto_15859 ) ( SURFACE-AT ?auto_15832 ?auto_15852 ) ( ON ?auto_15832 ?auto_15867 ) ( CLEAR ?auto_15832 ) ( not ( = ?auto_15831 ?auto_15832 ) ) ( not ( = ?auto_15831 ?auto_15867 ) ) ( not ( = ?auto_15832 ?auto_15867 ) ) ( not ( = ?auto_15845 ?auto_15859 ) ) ( SURFACE-AT ?auto_15830 ?auto_15849 ) ( CLEAR ?auto_15830 ) ( IS-CRATE ?auto_15831 ) ( AVAILABLE ?auto_15845 ) ( AVAILABLE ?auto_15847 ) ( SURFACE-AT ?auto_15831 ?auto_15844 ) ( ON ?auto_15831 ?auto_15875 ) ( CLEAR ?auto_15831 ) ( TRUCK-AT ?auto_15848 ?auto_15849 ) ( not ( = ?auto_15830 ?auto_15831 ) ) ( not ( = ?auto_15830 ?auto_15875 ) ) ( not ( = ?auto_15831 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15832 ) ) ( not ( = ?auto_15830 ?auto_15867 ) ) ( not ( = ?auto_15832 ?auto_15875 ) ) ( not ( = ?auto_15852 ?auto_15844 ) ) ( not ( = ?auto_15859 ?auto_15847 ) ) ( not ( = ?auto_15867 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15833 ) ) ( not ( = ?auto_15830 ?auto_15878 ) ) ( not ( = ?auto_15831 ?auto_15833 ) ) ( not ( = ?auto_15831 ?auto_15878 ) ) ( not ( = ?auto_15833 ?auto_15867 ) ) ( not ( = ?auto_15833 ?auto_15875 ) ) ( not ( = ?auto_15869 ?auto_15852 ) ) ( not ( = ?auto_15869 ?auto_15844 ) ) ( not ( = ?auto_15857 ?auto_15859 ) ) ( not ( = ?auto_15857 ?auto_15847 ) ) ( not ( = ?auto_15878 ?auto_15867 ) ) ( not ( = ?auto_15878 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15834 ) ) ( not ( = ?auto_15830 ?auto_15871 ) ) ( not ( = ?auto_15831 ?auto_15834 ) ) ( not ( = ?auto_15831 ?auto_15871 ) ) ( not ( = ?auto_15832 ?auto_15834 ) ) ( not ( = ?auto_15832 ?auto_15871 ) ) ( not ( = ?auto_15834 ?auto_15878 ) ) ( not ( = ?auto_15834 ?auto_15867 ) ) ( not ( = ?auto_15834 ?auto_15875 ) ) ( not ( = ?auto_15855 ?auto_15869 ) ) ( not ( = ?auto_15855 ?auto_15852 ) ) ( not ( = ?auto_15855 ?auto_15844 ) ) ( not ( = ?auto_15876 ?auto_15857 ) ) ( not ( = ?auto_15876 ?auto_15859 ) ) ( not ( = ?auto_15876 ?auto_15847 ) ) ( not ( = ?auto_15871 ?auto_15878 ) ) ( not ( = ?auto_15871 ?auto_15867 ) ) ( not ( = ?auto_15871 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15835 ) ) ( not ( = ?auto_15830 ?auto_15850 ) ) ( not ( = ?auto_15831 ?auto_15835 ) ) ( not ( = ?auto_15831 ?auto_15850 ) ) ( not ( = ?auto_15832 ?auto_15835 ) ) ( not ( = ?auto_15832 ?auto_15850 ) ) ( not ( = ?auto_15833 ?auto_15835 ) ) ( not ( = ?auto_15833 ?auto_15850 ) ) ( not ( = ?auto_15835 ?auto_15871 ) ) ( not ( = ?auto_15835 ?auto_15878 ) ) ( not ( = ?auto_15835 ?auto_15867 ) ) ( not ( = ?auto_15835 ?auto_15875 ) ) ( not ( = ?auto_15873 ?auto_15855 ) ) ( not ( = ?auto_15873 ?auto_15869 ) ) ( not ( = ?auto_15873 ?auto_15852 ) ) ( not ( = ?auto_15873 ?auto_15844 ) ) ( not ( = ?auto_15877 ?auto_15876 ) ) ( not ( = ?auto_15877 ?auto_15857 ) ) ( not ( = ?auto_15877 ?auto_15859 ) ) ( not ( = ?auto_15877 ?auto_15847 ) ) ( not ( = ?auto_15850 ?auto_15871 ) ) ( not ( = ?auto_15850 ?auto_15878 ) ) ( not ( = ?auto_15850 ?auto_15867 ) ) ( not ( = ?auto_15850 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15836 ) ) ( not ( = ?auto_15830 ?auto_15863 ) ) ( not ( = ?auto_15831 ?auto_15836 ) ) ( not ( = ?auto_15831 ?auto_15863 ) ) ( not ( = ?auto_15832 ?auto_15836 ) ) ( not ( = ?auto_15832 ?auto_15863 ) ) ( not ( = ?auto_15833 ?auto_15836 ) ) ( not ( = ?auto_15833 ?auto_15863 ) ) ( not ( = ?auto_15834 ?auto_15836 ) ) ( not ( = ?auto_15834 ?auto_15863 ) ) ( not ( = ?auto_15836 ?auto_15850 ) ) ( not ( = ?auto_15836 ?auto_15871 ) ) ( not ( = ?auto_15836 ?auto_15878 ) ) ( not ( = ?auto_15836 ?auto_15867 ) ) ( not ( = ?auto_15836 ?auto_15875 ) ) ( not ( = ?auto_15853 ?auto_15873 ) ) ( not ( = ?auto_15853 ?auto_15855 ) ) ( not ( = ?auto_15853 ?auto_15869 ) ) ( not ( = ?auto_15853 ?auto_15852 ) ) ( not ( = ?auto_15853 ?auto_15844 ) ) ( not ( = ?auto_15860 ?auto_15877 ) ) ( not ( = ?auto_15860 ?auto_15876 ) ) ( not ( = ?auto_15860 ?auto_15857 ) ) ( not ( = ?auto_15860 ?auto_15859 ) ) ( not ( = ?auto_15860 ?auto_15847 ) ) ( not ( = ?auto_15863 ?auto_15850 ) ) ( not ( = ?auto_15863 ?auto_15871 ) ) ( not ( = ?auto_15863 ?auto_15878 ) ) ( not ( = ?auto_15863 ?auto_15867 ) ) ( not ( = ?auto_15863 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15839 ) ) ( not ( = ?auto_15830 ?auto_15881 ) ) ( not ( = ?auto_15831 ?auto_15839 ) ) ( not ( = ?auto_15831 ?auto_15881 ) ) ( not ( = ?auto_15832 ?auto_15839 ) ) ( not ( = ?auto_15832 ?auto_15881 ) ) ( not ( = ?auto_15833 ?auto_15839 ) ) ( not ( = ?auto_15833 ?auto_15881 ) ) ( not ( = ?auto_15834 ?auto_15839 ) ) ( not ( = ?auto_15834 ?auto_15881 ) ) ( not ( = ?auto_15835 ?auto_15839 ) ) ( not ( = ?auto_15835 ?auto_15881 ) ) ( not ( = ?auto_15839 ?auto_15863 ) ) ( not ( = ?auto_15839 ?auto_15850 ) ) ( not ( = ?auto_15839 ?auto_15871 ) ) ( not ( = ?auto_15839 ?auto_15878 ) ) ( not ( = ?auto_15839 ?auto_15867 ) ) ( not ( = ?auto_15839 ?auto_15875 ) ) ( not ( = ?auto_15861 ?auto_15853 ) ) ( not ( = ?auto_15861 ?auto_15873 ) ) ( not ( = ?auto_15861 ?auto_15855 ) ) ( not ( = ?auto_15861 ?auto_15869 ) ) ( not ( = ?auto_15861 ?auto_15852 ) ) ( not ( = ?auto_15861 ?auto_15844 ) ) ( not ( = ?auto_15870 ?auto_15860 ) ) ( not ( = ?auto_15870 ?auto_15877 ) ) ( not ( = ?auto_15870 ?auto_15876 ) ) ( not ( = ?auto_15870 ?auto_15857 ) ) ( not ( = ?auto_15870 ?auto_15859 ) ) ( not ( = ?auto_15870 ?auto_15847 ) ) ( not ( = ?auto_15881 ?auto_15863 ) ) ( not ( = ?auto_15881 ?auto_15850 ) ) ( not ( = ?auto_15881 ?auto_15871 ) ) ( not ( = ?auto_15881 ?auto_15878 ) ) ( not ( = ?auto_15881 ?auto_15867 ) ) ( not ( = ?auto_15881 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15838 ) ) ( not ( = ?auto_15830 ?auto_15866 ) ) ( not ( = ?auto_15831 ?auto_15838 ) ) ( not ( = ?auto_15831 ?auto_15866 ) ) ( not ( = ?auto_15832 ?auto_15838 ) ) ( not ( = ?auto_15832 ?auto_15866 ) ) ( not ( = ?auto_15833 ?auto_15838 ) ) ( not ( = ?auto_15833 ?auto_15866 ) ) ( not ( = ?auto_15834 ?auto_15838 ) ) ( not ( = ?auto_15834 ?auto_15866 ) ) ( not ( = ?auto_15835 ?auto_15838 ) ) ( not ( = ?auto_15835 ?auto_15866 ) ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( not ( = ?auto_15836 ?auto_15866 ) ) ( not ( = ?auto_15838 ?auto_15881 ) ) ( not ( = ?auto_15838 ?auto_15863 ) ) ( not ( = ?auto_15838 ?auto_15850 ) ) ( not ( = ?auto_15838 ?auto_15871 ) ) ( not ( = ?auto_15838 ?auto_15878 ) ) ( not ( = ?auto_15838 ?auto_15867 ) ) ( not ( = ?auto_15838 ?auto_15875 ) ) ( not ( = ?auto_15866 ?auto_15881 ) ) ( not ( = ?auto_15866 ?auto_15863 ) ) ( not ( = ?auto_15866 ?auto_15850 ) ) ( not ( = ?auto_15866 ?auto_15871 ) ) ( not ( = ?auto_15866 ?auto_15878 ) ) ( not ( = ?auto_15866 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15837 ) ) ( not ( = ?auto_15830 ?auto_15862 ) ) ( not ( = ?auto_15831 ?auto_15837 ) ) ( not ( = ?auto_15831 ?auto_15862 ) ) ( not ( = ?auto_15832 ?auto_15837 ) ) ( not ( = ?auto_15832 ?auto_15862 ) ) ( not ( = ?auto_15833 ?auto_15837 ) ) ( not ( = ?auto_15833 ?auto_15862 ) ) ( not ( = ?auto_15834 ?auto_15837 ) ) ( not ( = ?auto_15834 ?auto_15862 ) ) ( not ( = ?auto_15835 ?auto_15837 ) ) ( not ( = ?auto_15835 ?auto_15862 ) ) ( not ( = ?auto_15836 ?auto_15837 ) ) ( not ( = ?auto_15836 ?auto_15862 ) ) ( not ( = ?auto_15839 ?auto_15837 ) ) ( not ( = ?auto_15839 ?auto_15862 ) ) ( not ( = ?auto_15837 ?auto_15866 ) ) ( not ( = ?auto_15837 ?auto_15881 ) ) ( not ( = ?auto_15837 ?auto_15863 ) ) ( not ( = ?auto_15837 ?auto_15850 ) ) ( not ( = ?auto_15837 ?auto_15871 ) ) ( not ( = ?auto_15837 ?auto_15878 ) ) ( not ( = ?auto_15837 ?auto_15867 ) ) ( not ( = ?auto_15837 ?auto_15875 ) ) ( not ( = ?auto_15851 ?auto_15861 ) ) ( not ( = ?auto_15851 ?auto_15853 ) ) ( not ( = ?auto_15851 ?auto_15873 ) ) ( not ( = ?auto_15851 ?auto_15855 ) ) ( not ( = ?auto_15851 ?auto_15869 ) ) ( not ( = ?auto_15851 ?auto_15852 ) ) ( not ( = ?auto_15851 ?auto_15844 ) ) ( not ( = ?auto_15874 ?auto_15870 ) ) ( not ( = ?auto_15874 ?auto_15860 ) ) ( not ( = ?auto_15874 ?auto_15877 ) ) ( not ( = ?auto_15874 ?auto_15876 ) ) ( not ( = ?auto_15874 ?auto_15857 ) ) ( not ( = ?auto_15874 ?auto_15859 ) ) ( not ( = ?auto_15874 ?auto_15847 ) ) ( not ( = ?auto_15862 ?auto_15866 ) ) ( not ( = ?auto_15862 ?auto_15881 ) ) ( not ( = ?auto_15862 ?auto_15863 ) ) ( not ( = ?auto_15862 ?auto_15850 ) ) ( not ( = ?auto_15862 ?auto_15871 ) ) ( not ( = ?auto_15862 ?auto_15878 ) ) ( not ( = ?auto_15862 ?auto_15867 ) ) ( not ( = ?auto_15862 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15840 ) ) ( not ( = ?auto_15830 ?auto_15868 ) ) ( not ( = ?auto_15831 ?auto_15840 ) ) ( not ( = ?auto_15831 ?auto_15868 ) ) ( not ( = ?auto_15832 ?auto_15840 ) ) ( not ( = ?auto_15832 ?auto_15868 ) ) ( not ( = ?auto_15833 ?auto_15840 ) ) ( not ( = ?auto_15833 ?auto_15868 ) ) ( not ( = ?auto_15834 ?auto_15840 ) ) ( not ( = ?auto_15834 ?auto_15868 ) ) ( not ( = ?auto_15835 ?auto_15840 ) ) ( not ( = ?auto_15835 ?auto_15868 ) ) ( not ( = ?auto_15836 ?auto_15840 ) ) ( not ( = ?auto_15836 ?auto_15868 ) ) ( not ( = ?auto_15839 ?auto_15840 ) ) ( not ( = ?auto_15839 ?auto_15868 ) ) ( not ( = ?auto_15838 ?auto_15840 ) ) ( not ( = ?auto_15838 ?auto_15868 ) ) ( not ( = ?auto_15840 ?auto_15862 ) ) ( not ( = ?auto_15840 ?auto_15866 ) ) ( not ( = ?auto_15840 ?auto_15881 ) ) ( not ( = ?auto_15840 ?auto_15863 ) ) ( not ( = ?auto_15840 ?auto_15850 ) ) ( not ( = ?auto_15840 ?auto_15871 ) ) ( not ( = ?auto_15840 ?auto_15878 ) ) ( not ( = ?auto_15840 ?auto_15867 ) ) ( not ( = ?auto_15840 ?auto_15875 ) ) ( not ( = ?auto_15858 ?auto_15851 ) ) ( not ( = ?auto_15858 ?auto_15861 ) ) ( not ( = ?auto_15858 ?auto_15853 ) ) ( not ( = ?auto_15858 ?auto_15873 ) ) ( not ( = ?auto_15858 ?auto_15855 ) ) ( not ( = ?auto_15858 ?auto_15869 ) ) ( not ( = ?auto_15858 ?auto_15852 ) ) ( not ( = ?auto_15858 ?auto_15844 ) ) ( not ( = ?auto_15864 ?auto_15874 ) ) ( not ( = ?auto_15864 ?auto_15870 ) ) ( not ( = ?auto_15864 ?auto_15860 ) ) ( not ( = ?auto_15864 ?auto_15877 ) ) ( not ( = ?auto_15864 ?auto_15876 ) ) ( not ( = ?auto_15864 ?auto_15857 ) ) ( not ( = ?auto_15864 ?auto_15859 ) ) ( not ( = ?auto_15864 ?auto_15847 ) ) ( not ( = ?auto_15868 ?auto_15862 ) ) ( not ( = ?auto_15868 ?auto_15866 ) ) ( not ( = ?auto_15868 ?auto_15881 ) ) ( not ( = ?auto_15868 ?auto_15863 ) ) ( not ( = ?auto_15868 ?auto_15850 ) ) ( not ( = ?auto_15868 ?auto_15871 ) ) ( not ( = ?auto_15868 ?auto_15878 ) ) ( not ( = ?auto_15868 ?auto_15867 ) ) ( not ( = ?auto_15868 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15841 ) ) ( not ( = ?auto_15830 ?auto_15880 ) ) ( not ( = ?auto_15831 ?auto_15841 ) ) ( not ( = ?auto_15831 ?auto_15880 ) ) ( not ( = ?auto_15832 ?auto_15841 ) ) ( not ( = ?auto_15832 ?auto_15880 ) ) ( not ( = ?auto_15833 ?auto_15841 ) ) ( not ( = ?auto_15833 ?auto_15880 ) ) ( not ( = ?auto_15834 ?auto_15841 ) ) ( not ( = ?auto_15834 ?auto_15880 ) ) ( not ( = ?auto_15835 ?auto_15841 ) ) ( not ( = ?auto_15835 ?auto_15880 ) ) ( not ( = ?auto_15836 ?auto_15841 ) ) ( not ( = ?auto_15836 ?auto_15880 ) ) ( not ( = ?auto_15839 ?auto_15841 ) ) ( not ( = ?auto_15839 ?auto_15880 ) ) ( not ( = ?auto_15838 ?auto_15841 ) ) ( not ( = ?auto_15838 ?auto_15880 ) ) ( not ( = ?auto_15837 ?auto_15841 ) ) ( not ( = ?auto_15837 ?auto_15880 ) ) ( not ( = ?auto_15841 ?auto_15868 ) ) ( not ( = ?auto_15841 ?auto_15862 ) ) ( not ( = ?auto_15841 ?auto_15866 ) ) ( not ( = ?auto_15841 ?auto_15881 ) ) ( not ( = ?auto_15841 ?auto_15863 ) ) ( not ( = ?auto_15841 ?auto_15850 ) ) ( not ( = ?auto_15841 ?auto_15871 ) ) ( not ( = ?auto_15841 ?auto_15878 ) ) ( not ( = ?auto_15841 ?auto_15867 ) ) ( not ( = ?auto_15841 ?auto_15875 ) ) ( not ( = ?auto_15879 ?auto_15858 ) ) ( not ( = ?auto_15879 ?auto_15851 ) ) ( not ( = ?auto_15879 ?auto_15861 ) ) ( not ( = ?auto_15879 ?auto_15853 ) ) ( not ( = ?auto_15879 ?auto_15873 ) ) ( not ( = ?auto_15879 ?auto_15855 ) ) ( not ( = ?auto_15879 ?auto_15869 ) ) ( not ( = ?auto_15879 ?auto_15852 ) ) ( not ( = ?auto_15879 ?auto_15844 ) ) ( not ( = ?auto_15872 ?auto_15864 ) ) ( not ( = ?auto_15872 ?auto_15874 ) ) ( not ( = ?auto_15872 ?auto_15870 ) ) ( not ( = ?auto_15872 ?auto_15860 ) ) ( not ( = ?auto_15872 ?auto_15877 ) ) ( not ( = ?auto_15872 ?auto_15876 ) ) ( not ( = ?auto_15872 ?auto_15857 ) ) ( not ( = ?auto_15872 ?auto_15859 ) ) ( not ( = ?auto_15872 ?auto_15847 ) ) ( not ( = ?auto_15880 ?auto_15868 ) ) ( not ( = ?auto_15880 ?auto_15862 ) ) ( not ( = ?auto_15880 ?auto_15866 ) ) ( not ( = ?auto_15880 ?auto_15881 ) ) ( not ( = ?auto_15880 ?auto_15863 ) ) ( not ( = ?auto_15880 ?auto_15850 ) ) ( not ( = ?auto_15880 ?auto_15871 ) ) ( not ( = ?auto_15880 ?auto_15878 ) ) ( not ( = ?auto_15880 ?auto_15867 ) ) ( not ( = ?auto_15880 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15842 ) ) ( not ( = ?auto_15830 ?auto_15865 ) ) ( not ( = ?auto_15831 ?auto_15842 ) ) ( not ( = ?auto_15831 ?auto_15865 ) ) ( not ( = ?auto_15832 ?auto_15842 ) ) ( not ( = ?auto_15832 ?auto_15865 ) ) ( not ( = ?auto_15833 ?auto_15842 ) ) ( not ( = ?auto_15833 ?auto_15865 ) ) ( not ( = ?auto_15834 ?auto_15842 ) ) ( not ( = ?auto_15834 ?auto_15865 ) ) ( not ( = ?auto_15835 ?auto_15842 ) ) ( not ( = ?auto_15835 ?auto_15865 ) ) ( not ( = ?auto_15836 ?auto_15842 ) ) ( not ( = ?auto_15836 ?auto_15865 ) ) ( not ( = ?auto_15839 ?auto_15842 ) ) ( not ( = ?auto_15839 ?auto_15865 ) ) ( not ( = ?auto_15838 ?auto_15842 ) ) ( not ( = ?auto_15838 ?auto_15865 ) ) ( not ( = ?auto_15837 ?auto_15842 ) ) ( not ( = ?auto_15837 ?auto_15865 ) ) ( not ( = ?auto_15840 ?auto_15842 ) ) ( not ( = ?auto_15840 ?auto_15865 ) ) ( not ( = ?auto_15842 ?auto_15880 ) ) ( not ( = ?auto_15842 ?auto_15868 ) ) ( not ( = ?auto_15842 ?auto_15862 ) ) ( not ( = ?auto_15842 ?auto_15866 ) ) ( not ( = ?auto_15842 ?auto_15881 ) ) ( not ( = ?auto_15842 ?auto_15863 ) ) ( not ( = ?auto_15842 ?auto_15850 ) ) ( not ( = ?auto_15842 ?auto_15871 ) ) ( not ( = ?auto_15842 ?auto_15878 ) ) ( not ( = ?auto_15842 ?auto_15867 ) ) ( not ( = ?auto_15842 ?auto_15875 ) ) ( not ( = ?auto_15854 ?auto_15879 ) ) ( not ( = ?auto_15854 ?auto_15858 ) ) ( not ( = ?auto_15854 ?auto_15851 ) ) ( not ( = ?auto_15854 ?auto_15861 ) ) ( not ( = ?auto_15854 ?auto_15853 ) ) ( not ( = ?auto_15854 ?auto_15873 ) ) ( not ( = ?auto_15854 ?auto_15855 ) ) ( not ( = ?auto_15854 ?auto_15869 ) ) ( not ( = ?auto_15854 ?auto_15852 ) ) ( not ( = ?auto_15854 ?auto_15844 ) ) ( not ( = ?auto_15856 ?auto_15872 ) ) ( not ( = ?auto_15856 ?auto_15864 ) ) ( not ( = ?auto_15856 ?auto_15874 ) ) ( not ( = ?auto_15856 ?auto_15870 ) ) ( not ( = ?auto_15856 ?auto_15860 ) ) ( not ( = ?auto_15856 ?auto_15877 ) ) ( not ( = ?auto_15856 ?auto_15876 ) ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( not ( = ?auto_15856 ?auto_15859 ) ) ( not ( = ?auto_15856 ?auto_15847 ) ) ( not ( = ?auto_15865 ?auto_15880 ) ) ( not ( = ?auto_15865 ?auto_15868 ) ) ( not ( = ?auto_15865 ?auto_15862 ) ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15865 ?auto_15881 ) ) ( not ( = ?auto_15865 ?auto_15863 ) ) ( not ( = ?auto_15865 ?auto_15850 ) ) ( not ( = ?auto_15865 ?auto_15871 ) ) ( not ( = ?auto_15865 ?auto_15878 ) ) ( not ( = ?auto_15865 ?auto_15867 ) ) ( not ( = ?auto_15865 ?auto_15875 ) ) ( not ( = ?auto_15830 ?auto_15843 ) ) ( not ( = ?auto_15830 ?auto_15846 ) ) ( not ( = ?auto_15831 ?auto_15843 ) ) ( not ( = ?auto_15831 ?auto_15846 ) ) ( not ( = ?auto_15832 ?auto_15843 ) ) ( not ( = ?auto_15832 ?auto_15846 ) ) ( not ( = ?auto_15833 ?auto_15843 ) ) ( not ( = ?auto_15833 ?auto_15846 ) ) ( not ( = ?auto_15834 ?auto_15843 ) ) ( not ( = ?auto_15834 ?auto_15846 ) ) ( not ( = ?auto_15835 ?auto_15843 ) ) ( not ( = ?auto_15835 ?auto_15846 ) ) ( not ( = ?auto_15836 ?auto_15843 ) ) ( not ( = ?auto_15836 ?auto_15846 ) ) ( not ( = ?auto_15839 ?auto_15843 ) ) ( not ( = ?auto_15839 ?auto_15846 ) ) ( not ( = ?auto_15838 ?auto_15843 ) ) ( not ( = ?auto_15838 ?auto_15846 ) ) ( not ( = ?auto_15837 ?auto_15843 ) ) ( not ( = ?auto_15837 ?auto_15846 ) ) ( not ( = ?auto_15840 ?auto_15843 ) ) ( not ( = ?auto_15840 ?auto_15846 ) ) ( not ( = ?auto_15841 ?auto_15843 ) ) ( not ( = ?auto_15841 ?auto_15846 ) ) ( not ( = ?auto_15843 ?auto_15865 ) ) ( not ( = ?auto_15843 ?auto_15880 ) ) ( not ( = ?auto_15843 ?auto_15868 ) ) ( not ( = ?auto_15843 ?auto_15862 ) ) ( not ( = ?auto_15843 ?auto_15866 ) ) ( not ( = ?auto_15843 ?auto_15881 ) ) ( not ( = ?auto_15843 ?auto_15863 ) ) ( not ( = ?auto_15843 ?auto_15850 ) ) ( not ( = ?auto_15843 ?auto_15871 ) ) ( not ( = ?auto_15843 ?auto_15878 ) ) ( not ( = ?auto_15843 ?auto_15867 ) ) ( not ( = ?auto_15843 ?auto_15875 ) ) ( not ( = ?auto_15846 ?auto_15865 ) ) ( not ( = ?auto_15846 ?auto_15880 ) ) ( not ( = ?auto_15846 ?auto_15868 ) ) ( not ( = ?auto_15846 ?auto_15862 ) ) ( not ( = ?auto_15846 ?auto_15866 ) ) ( not ( = ?auto_15846 ?auto_15881 ) ) ( not ( = ?auto_15846 ?auto_15863 ) ) ( not ( = ?auto_15846 ?auto_15850 ) ) ( not ( = ?auto_15846 ?auto_15871 ) ) ( not ( = ?auto_15846 ?auto_15878 ) ) ( not ( = ?auto_15846 ?auto_15867 ) ) ( not ( = ?auto_15846 ?auto_15875 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15830 ?auto_15831 ?auto_15832 ?auto_15833 ?auto_15834 ?auto_15835 ?auto_15836 ?auto_15839 ?auto_15838 ?auto_15837 ?auto_15840 ?auto_15841 ?auto_15842 )
      ( MAKE-1CRATE ?auto_15842 ?auto_15843 )
      ( MAKE-13CRATE-VERIFY ?auto_15830 ?auto_15831 ?auto_15832 ?auto_15833 ?auto_15834 ?auto_15835 ?auto_15836 ?auto_15839 ?auto_15838 ?auto_15837 ?auto_15840 ?auto_15841 ?auto_15842 ?auto_15843 ) )
  )

)

