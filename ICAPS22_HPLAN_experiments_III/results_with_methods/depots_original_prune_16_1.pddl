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
      ?auto_2258265 - SURFACE
      ?auto_2258266 - SURFACE
    )
    :vars
    (
      ?auto_2258267 - HOIST
      ?auto_2258268 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258267 ?auto_2258268 ) ( SURFACE-AT ?auto_2258265 ?auto_2258268 ) ( CLEAR ?auto_2258265 ) ( LIFTING ?auto_2258267 ?auto_2258266 ) ( IS-CRATE ?auto_2258266 ) ( not ( = ?auto_2258265 ?auto_2258266 ) ) )
    :subtasks
    ( ( !DROP ?auto_2258267 ?auto_2258266 ?auto_2258265 ?auto_2258268 )
      ( MAKE-1CRATE-VERIFY ?auto_2258265 ?auto_2258266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258269 - SURFACE
      ?auto_2258270 - SURFACE
    )
    :vars
    (
      ?auto_2258272 - HOIST
      ?auto_2258271 - PLACE
      ?auto_2258273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258272 ?auto_2258271 ) ( SURFACE-AT ?auto_2258269 ?auto_2258271 ) ( CLEAR ?auto_2258269 ) ( IS-CRATE ?auto_2258270 ) ( not ( = ?auto_2258269 ?auto_2258270 ) ) ( TRUCK-AT ?auto_2258273 ?auto_2258271 ) ( AVAILABLE ?auto_2258272 ) ( IN ?auto_2258270 ?auto_2258273 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2258272 ?auto_2258270 ?auto_2258273 ?auto_2258271 )
      ( MAKE-1CRATE ?auto_2258269 ?auto_2258270 )
      ( MAKE-1CRATE-VERIFY ?auto_2258269 ?auto_2258270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258274 - SURFACE
      ?auto_2258275 - SURFACE
    )
    :vars
    (
      ?auto_2258277 - HOIST
      ?auto_2258278 - PLACE
      ?auto_2258276 - TRUCK
      ?auto_2258279 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258277 ?auto_2258278 ) ( SURFACE-AT ?auto_2258274 ?auto_2258278 ) ( CLEAR ?auto_2258274 ) ( IS-CRATE ?auto_2258275 ) ( not ( = ?auto_2258274 ?auto_2258275 ) ) ( AVAILABLE ?auto_2258277 ) ( IN ?auto_2258275 ?auto_2258276 ) ( TRUCK-AT ?auto_2258276 ?auto_2258279 ) ( not ( = ?auto_2258279 ?auto_2258278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2258276 ?auto_2258279 ?auto_2258278 )
      ( MAKE-1CRATE ?auto_2258274 ?auto_2258275 )
      ( MAKE-1CRATE-VERIFY ?auto_2258274 ?auto_2258275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258280 - SURFACE
      ?auto_2258281 - SURFACE
    )
    :vars
    (
      ?auto_2258284 - HOIST
      ?auto_2258282 - PLACE
      ?auto_2258283 - TRUCK
      ?auto_2258285 - PLACE
      ?auto_2258286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258284 ?auto_2258282 ) ( SURFACE-AT ?auto_2258280 ?auto_2258282 ) ( CLEAR ?auto_2258280 ) ( IS-CRATE ?auto_2258281 ) ( not ( = ?auto_2258280 ?auto_2258281 ) ) ( AVAILABLE ?auto_2258284 ) ( TRUCK-AT ?auto_2258283 ?auto_2258285 ) ( not ( = ?auto_2258285 ?auto_2258282 ) ) ( HOIST-AT ?auto_2258286 ?auto_2258285 ) ( LIFTING ?auto_2258286 ?auto_2258281 ) ( not ( = ?auto_2258284 ?auto_2258286 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2258286 ?auto_2258281 ?auto_2258283 ?auto_2258285 )
      ( MAKE-1CRATE ?auto_2258280 ?auto_2258281 )
      ( MAKE-1CRATE-VERIFY ?auto_2258280 ?auto_2258281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258287 - SURFACE
      ?auto_2258288 - SURFACE
    )
    :vars
    (
      ?auto_2258289 - HOIST
      ?auto_2258293 - PLACE
      ?auto_2258290 - TRUCK
      ?auto_2258292 - PLACE
      ?auto_2258291 - HOIST
      ?auto_2258294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258289 ?auto_2258293 ) ( SURFACE-AT ?auto_2258287 ?auto_2258293 ) ( CLEAR ?auto_2258287 ) ( IS-CRATE ?auto_2258288 ) ( not ( = ?auto_2258287 ?auto_2258288 ) ) ( AVAILABLE ?auto_2258289 ) ( TRUCK-AT ?auto_2258290 ?auto_2258292 ) ( not ( = ?auto_2258292 ?auto_2258293 ) ) ( HOIST-AT ?auto_2258291 ?auto_2258292 ) ( not ( = ?auto_2258289 ?auto_2258291 ) ) ( AVAILABLE ?auto_2258291 ) ( SURFACE-AT ?auto_2258288 ?auto_2258292 ) ( ON ?auto_2258288 ?auto_2258294 ) ( CLEAR ?auto_2258288 ) ( not ( = ?auto_2258287 ?auto_2258294 ) ) ( not ( = ?auto_2258288 ?auto_2258294 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2258291 ?auto_2258288 ?auto_2258294 ?auto_2258292 )
      ( MAKE-1CRATE ?auto_2258287 ?auto_2258288 )
      ( MAKE-1CRATE-VERIFY ?auto_2258287 ?auto_2258288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258295 - SURFACE
      ?auto_2258296 - SURFACE
    )
    :vars
    (
      ?auto_2258301 - HOIST
      ?auto_2258302 - PLACE
      ?auto_2258299 - PLACE
      ?auto_2258298 - HOIST
      ?auto_2258300 - SURFACE
      ?auto_2258297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258301 ?auto_2258302 ) ( SURFACE-AT ?auto_2258295 ?auto_2258302 ) ( CLEAR ?auto_2258295 ) ( IS-CRATE ?auto_2258296 ) ( not ( = ?auto_2258295 ?auto_2258296 ) ) ( AVAILABLE ?auto_2258301 ) ( not ( = ?auto_2258299 ?auto_2258302 ) ) ( HOIST-AT ?auto_2258298 ?auto_2258299 ) ( not ( = ?auto_2258301 ?auto_2258298 ) ) ( AVAILABLE ?auto_2258298 ) ( SURFACE-AT ?auto_2258296 ?auto_2258299 ) ( ON ?auto_2258296 ?auto_2258300 ) ( CLEAR ?auto_2258296 ) ( not ( = ?auto_2258295 ?auto_2258300 ) ) ( not ( = ?auto_2258296 ?auto_2258300 ) ) ( TRUCK-AT ?auto_2258297 ?auto_2258302 ) )
    :subtasks
    ( ( !DRIVE ?auto_2258297 ?auto_2258302 ?auto_2258299 )
      ( MAKE-1CRATE ?auto_2258295 ?auto_2258296 )
      ( MAKE-1CRATE-VERIFY ?auto_2258295 ?auto_2258296 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258312 - SURFACE
      ?auto_2258313 - SURFACE
      ?auto_2258314 - SURFACE
    )
    :vars
    (
      ?auto_2258316 - HOIST
      ?auto_2258315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258316 ?auto_2258315 ) ( SURFACE-AT ?auto_2258313 ?auto_2258315 ) ( CLEAR ?auto_2258313 ) ( LIFTING ?auto_2258316 ?auto_2258314 ) ( IS-CRATE ?auto_2258314 ) ( not ( = ?auto_2258313 ?auto_2258314 ) ) ( ON ?auto_2258313 ?auto_2258312 ) ( not ( = ?auto_2258312 ?auto_2258313 ) ) ( not ( = ?auto_2258312 ?auto_2258314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258313 ?auto_2258314 )
      ( MAKE-2CRATE-VERIFY ?auto_2258312 ?auto_2258313 ?auto_2258314 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258322 - SURFACE
      ?auto_2258323 - SURFACE
      ?auto_2258324 - SURFACE
    )
    :vars
    (
      ?auto_2258327 - HOIST
      ?auto_2258325 - PLACE
      ?auto_2258326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258327 ?auto_2258325 ) ( SURFACE-AT ?auto_2258323 ?auto_2258325 ) ( CLEAR ?auto_2258323 ) ( IS-CRATE ?auto_2258324 ) ( not ( = ?auto_2258323 ?auto_2258324 ) ) ( TRUCK-AT ?auto_2258326 ?auto_2258325 ) ( AVAILABLE ?auto_2258327 ) ( IN ?auto_2258324 ?auto_2258326 ) ( ON ?auto_2258323 ?auto_2258322 ) ( not ( = ?auto_2258322 ?auto_2258323 ) ) ( not ( = ?auto_2258322 ?auto_2258324 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258323 ?auto_2258324 )
      ( MAKE-2CRATE-VERIFY ?auto_2258322 ?auto_2258323 ?auto_2258324 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258328 - SURFACE
      ?auto_2258329 - SURFACE
    )
    :vars
    (
      ?auto_2258331 - HOIST
      ?auto_2258330 - PLACE
      ?auto_2258333 - TRUCK
      ?auto_2258332 - SURFACE
      ?auto_2258334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258331 ?auto_2258330 ) ( SURFACE-AT ?auto_2258328 ?auto_2258330 ) ( CLEAR ?auto_2258328 ) ( IS-CRATE ?auto_2258329 ) ( not ( = ?auto_2258328 ?auto_2258329 ) ) ( AVAILABLE ?auto_2258331 ) ( IN ?auto_2258329 ?auto_2258333 ) ( ON ?auto_2258328 ?auto_2258332 ) ( not ( = ?auto_2258332 ?auto_2258328 ) ) ( not ( = ?auto_2258332 ?auto_2258329 ) ) ( TRUCK-AT ?auto_2258333 ?auto_2258334 ) ( not ( = ?auto_2258334 ?auto_2258330 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2258333 ?auto_2258334 ?auto_2258330 )
      ( MAKE-2CRATE ?auto_2258332 ?auto_2258328 ?auto_2258329 )
      ( MAKE-1CRATE-VERIFY ?auto_2258328 ?auto_2258329 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258335 - SURFACE
      ?auto_2258336 - SURFACE
      ?auto_2258337 - SURFACE
    )
    :vars
    (
      ?auto_2258339 - HOIST
      ?auto_2258338 - PLACE
      ?auto_2258340 - TRUCK
      ?auto_2258341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258339 ?auto_2258338 ) ( SURFACE-AT ?auto_2258336 ?auto_2258338 ) ( CLEAR ?auto_2258336 ) ( IS-CRATE ?auto_2258337 ) ( not ( = ?auto_2258336 ?auto_2258337 ) ) ( AVAILABLE ?auto_2258339 ) ( IN ?auto_2258337 ?auto_2258340 ) ( ON ?auto_2258336 ?auto_2258335 ) ( not ( = ?auto_2258335 ?auto_2258336 ) ) ( not ( = ?auto_2258335 ?auto_2258337 ) ) ( TRUCK-AT ?auto_2258340 ?auto_2258341 ) ( not ( = ?auto_2258341 ?auto_2258338 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258336 ?auto_2258337 )
      ( MAKE-2CRATE-VERIFY ?auto_2258335 ?auto_2258336 ?auto_2258337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258342 - SURFACE
      ?auto_2258343 - SURFACE
    )
    :vars
    (
      ?auto_2258348 - HOIST
      ?auto_2258347 - PLACE
      ?auto_2258344 - SURFACE
      ?auto_2258346 - TRUCK
      ?auto_2258345 - PLACE
      ?auto_2258349 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258348 ?auto_2258347 ) ( SURFACE-AT ?auto_2258342 ?auto_2258347 ) ( CLEAR ?auto_2258342 ) ( IS-CRATE ?auto_2258343 ) ( not ( = ?auto_2258342 ?auto_2258343 ) ) ( AVAILABLE ?auto_2258348 ) ( ON ?auto_2258342 ?auto_2258344 ) ( not ( = ?auto_2258344 ?auto_2258342 ) ) ( not ( = ?auto_2258344 ?auto_2258343 ) ) ( TRUCK-AT ?auto_2258346 ?auto_2258345 ) ( not ( = ?auto_2258345 ?auto_2258347 ) ) ( HOIST-AT ?auto_2258349 ?auto_2258345 ) ( LIFTING ?auto_2258349 ?auto_2258343 ) ( not ( = ?auto_2258348 ?auto_2258349 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2258349 ?auto_2258343 ?auto_2258346 ?auto_2258345 )
      ( MAKE-2CRATE ?auto_2258344 ?auto_2258342 ?auto_2258343 )
      ( MAKE-1CRATE-VERIFY ?auto_2258342 ?auto_2258343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258350 - SURFACE
      ?auto_2258351 - SURFACE
      ?auto_2258352 - SURFACE
    )
    :vars
    (
      ?auto_2258353 - HOIST
      ?auto_2258357 - PLACE
      ?auto_2258354 - TRUCK
      ?auto_2258355 - PLACE
      ?auto_2258356 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258353 ?auto_2258357 ) ( SURFACE-AT ?auto_2258351 ?auto_2258357 ) ( CLEAR ?auto_2258351 ) ( IS-CRATE ?auto_2258352 ) ( not ( = ?auto_2258351 ?auto_2258352 ) ) ( AVAILABLE ?auto_2258353 ) ( ON ?auto_2258351 ?auto_2258350 ) ( not ( = ?auto_2258350 ?auto_2258351 ) ) ( not ( = ?auto_2258350 ?auto_2258352 ) ) ( TRUCK-AT ?auto_2258354 ?auto_2258355 ) ( not ( = ?auto_2258355 ?auto_2258357 ) ) ( HOIST-AT ?auto_2258356 ?auto_2258355 ) ( LIFTING ?auto_2258356 ?auto_2258352 ) ( not ( = ?auto_2258353 ?auto_2258356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258351 ?auto_2258352 )
      ( MAKE-2CRATE-VERIFY ?auto_2258350 ?auto_2258351 ?auto_2258352 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258358 - SURFACE
      ?auto_2258359 - SURFACE
    )
    :vars
    (
      ?auto_2258364 - HOIST
      ?auto_2258360 - PLACE
      ?auto_2258365 - SURFACE
      ?auto_2258362 - TRUCK
      ?auto_2258363 - PLACE
      ?auto_2258361 - HOIST
      ?auto_2258366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258364 ?auto_2258360 ) ( SURFACE-AT ?auto_2258358 ?auto_2258360 ) ( CLEAR ?auto_2258358 ) ( IS-CRATE ?auto_2258359 ) ( not ( = ?auto_2258358 ?auto_2258359 ) ) ( AVAILABLE ?auto_2258364 ) ( ON ?auto_2258358 ?auto_2258365 ) ( not ( = ?auto_2258365 ?auto_2258358 ) ) ( not ( = ?auto_2258365 ?auto_2258359 ) ) ( TRUCK-AT ?auto_2258362 ?auto_2258363 ) ( not ( = ?auto_2258363 ?auto_2258360 ) ) ( HOIST-AT ?auto_2258361 ?auto_2258363 ) ( not ( = ?auto_2258364 ?auto_2258361 ) ) ( AVAILABLE ?auto_2258361 ) ( SURFACE-AT ?auto_2258359 ?auto_2258363 ) ( ON ?auto_2258359 ?auto_2258366 ) ( CLEAR ?auto_2258359 ) ( not ( = ?auto_2258358 ?auto_2258366 ) ) ( not ( = ?auto_2258359 ?auto_2258366 ) ) ( not ( = ?auto_2258365 ?auto_2258366 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2258361 ?auto_2258359 ?auto_2258366 ?auto_2258363 )
      ( MAKE-2CRATE ?auto_2258365 ?auto_2258358 ?auto_2258359 )
      ( MAKE-1CRATE-VERIFY ?auto_2258358 ?auto_2258359 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258367 - SURFACE
      ?auto_2258368 - SURFACE
      ?auto_2258369 - SURFACE
    )
    :vars
    (
      ?auto_2258372 - HOIST
      ?auto_2258370 - PLACE
      ?auto_2258371 - TRUCK
      ?auto_2258373 - PLACE
      ?auto_2258375 - HOIST
      ?auto_2258374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258372 ?auto_2258370 ) ( SURFACE-AT ?auto_2258368 ?auto_2258370 ) ( CLEAR ?auto_2258368 ) ( IS-CRATE ?auto_2258369 ) ( not ( = ?auto_2258368 ?auto_2258369 ) ) ( AVAILABLE ?auto_2258372 ) ( ON ?auto_2258368 ?auto_2258367 ) ( not ( = ?auto_2258367 ?auto_2258368 ) ) ( not ( = ?auto_2258367 ?auto_2258369 ) ) ( TRUCK-AT ?auto_2258371 ?auto_2258373 ) ( not ( = ?auto_2258373 ?auto_2258370 ) ) ( HOIST-AT ?auto_2258375 ?auto_2258373 ) ( not ( = ?auto_2258372 ?auto_2258375 ) ) ( AVAILABLE ?auto_2258375 ) ( SURFACE-AT ?auto_2258369 ?auto_2258373 ) ( ON ?auto_2258369 ?auto_2258374 ) ( CLEAR ?auto_2258369 ) ( not ( = ?auto_2258368 ?auto_2258374 ) ) ( not ( = ?auto_2258369 ?auto_2258374 ) ) ( not ( = ?auto_2258367 ?auto_2258374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258368 ?auto_2258369 )
      ( MAKE-2CRATE-VERIFY ?auto_2258367 ?auto_2258368 ?auto_2258369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258376 - SURFACE
      ?auto_2258377 - SURFACE
    )
    :vars
    (
      ?auto_2258380 - HOIST
      ?auto_2258381 - PLACE
      ?auto_2258378 - SURFACE
      ?auto_2258382 - PLACE
      ?auto_2258379 - HOIST
      ?auto_2258384 - SURFACE
      ?auto_2258383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258380 ?auto_2258381 ) ( SURFACE-AT ?auto_2258376 ?auto_2258381 ) ( CLEAR ?auto_2258376 ) ( IS-CRATE ?auto_2258377 ) ( not ( = ?auto_2258376 ?auto_2258377 ) ) ( AVAILABLE ?auto_2258380 ) ( ON ?auto_2258376 ?auto_2258378 ) ( not ( = ?auto_2258378 ?auto_2258376 ) ) ( not ( = ?auto_2258378 ?auto_2258377 ) ) ( not ( = ?auto_2258382 ?auto_2258381 ) ) ( HOIST-AT ?auto_2258379 ?auto_2258382 ) ( not ( = ?auto_2258380 ?auto_2258379 ) ) ( AVAILABLE ?auto_2258379 ) ( SURFACE-AT ?auto_2258377 ?auto_2258382 ) ( ON ?auto_2258377 ?auto_2258384 ) ( CLEAR ?auto_2258377 ) ( not ( = ?auto_2258376 ?auto_2258384 ) ) ( not ( = ?auto_2258377 ?auto_2258384 ) ) ( not ( = ?auto_2258378 ?auto_2258384 ) ) ( TRUCK-AT ?auto_2258383 ?auto_2258381 ) )
    :subtasks
    ( ( !DRIVE ?auto_2258383 ?auto_2258381 ?auto_2258382 )
      ( MAKE-2CRATE ?auto_2258378 ?auto_2258376 ?auto_2258377 )
      ( MAKE-1CRATE-VERIFY ?auto_2258376 ?auto_2258377 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258385 - SURFACE
      ?auto_2258386 - SURFACE
      ?auto_2258387 - SURFACE
    )
    :vars
    (
      ?auto_2258390 - HOIST
      ?auto_2258388 - PLACE
      ?auto_2258393 - PLACE
      ?auto_2258391 - HOIST
      ?auto_2258392 - SURFACE
      ?auto_2258389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258390 ?auto_2258388 ) ( SURFACE-AT ?auto_2258386 ?auto_2258388 ) ( CLEAR ?auto_2258386 ) ( IS-CRATE ?auto_2258387 ) ( not ( = ?auto_2258386 ?auto_2258387 ) ) ( AVAILABLE ?auto_2258390 ) ( ON ?auto_2258386 ?auto_2258385 ) ( not ( = ?auto_2258385 ?auto_2258386 ) ) ( not ( = ?auto_2258385 ?auto_2258387 ) ) ( not ( = ?auto_2258393 ?auto_2258388 ) ) ( HOIST-AT ?auto_2258391 ?auto_2258393 ) ( not ( = ?auto_2258390 ?auto_2258391 ) ) ( AVAILABLE ?auto_2258391 ) ( SURFACE-AT ?auto_2258387 ?auto_2258393 ) ( ON ?auto_2258387 ?auto_2258392 ) ( CLEAR ?auto_2258387 ) ( not ( = ?auto_2258386 ?auto_2258392 ) ) ( not ( = ?auto_2258387 ?auto_2258392 ) ) ( not ( = ?auto_2258385 ?auto_2258392 ) ) ( TRUCK-AT ?auto_2258389 ?auto_2258388 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258386 ?auto_2258387 )
      ( MAKE-2CRATE-VERIFY ?auto_2258385 ?auto_2258386 ?auto_2258387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258394 - SURFACE
      ?auto_2258395 - SURFACE
    )
    :vars
    (
      ?auto_2258399 - HOIST
      ?auto_2258398 - PLACE
      ?auto_2258400 - SURFACE
      ?auto_2258397 - PLACE
      ?auto_2258401 - HOIST
      ?auto_2258396 - SURFACE
      ?auto_2258402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258399 ?auto_2258398 ) ( IS-CRATE ?auto_2258395 ) ( not ( = ?auto_2258394 ?auto_2258395 ) ) ( not ( = ?auto_2258400 ?auto_2258394 ) ) ( not ( = ?auto_2258400 ?auto_2258395 ) ) ( not ( = ?auto_2258397 ?auto_2258398 ) ) ( HOIST-AT ?auto_2258401 ?auto_2258397 ) ( not ( = ?auto_2258399 ?auto_2258401 ) ) ( AVAILABLE ?auto_2258401 ) ( SURFACE-AT ?auto_2258395 ?auto_2258397 ) ( ON ?auto_2258395 ?auto_2258396 ) ( CLEAR ?auto_2258395 ) ( not ( = ?auto_2258394 ?auto_2258396 ) ) ( not ( = ?auto_2258395 ?auto_2258396 ) ) ( not ( = ?auto_2258400 ?auto_2258396 ) ) ( TRUCK-AT ?auto_2258402 ?auto_2258398 ) ( SURFACE-AT ?auto_2258400 ?auto_2258398 ) ( CLEAR ?auto_2258400 ) ( LIFTING ?auto_2258399 ?auto_2258394 ) ( IS-CRATE ?auto_2258394 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258400 ?auto_2258394 )
      ( MAKE-2CRATE ?auto_2258400 ?auto_2258394 ?auto_2258395 )
      ( MAKE-1CRATE-VERIFY ?auto_2258394 ?auto_2258395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258403 - SURFACE
      ?auto_2258404 - SURFACE
      ?auto_2258405 - SURFACE
    )
    :vars
    (
      ?auto_2258408 - HOIST
      ?auto_2258409 - PLACE
      ?auto_2258406 - PLACE
      ?auto_2258411 - HOIST
      ?auto_2258407 - SURFACE
      ?auto_2258410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258408 ?auto_2258409 ) ( IS-CRATE ?auto_2258405 ) ( not ( = ?auto_2258404 ?auto_2258405 ) ) ( not ( = ?auto_2258403 ?auto_2258404 ) ) ( not ( = ?auto_2258403 ?auto_2258405 ) ) ( not ( = ?auto_2258406 ?auto_2258409 ) ) ( HOIST-AT ?auto_2258411 ?auto_2258406 ) ( not ( = ?auto_2258408 ?auto_2258411 ) ) ( AVAILABLE ?auto_2258411 ) ( SURFACE-AT ?auto_2258405 ?auto_2258406 ) ( ON ?auto_2258405 ?auto_2258407 ) ( CLEAR ?auto_2258405 ) ( not ( = ?auto_2258404 ?auto_2258407 ) ) ( not ( = ?auto_2258405 ?auto_2258407 ) ) ( not ( = ?auto_2258403 ?auto_2258407 ) ) ( TRUCK-AT ?auto_2258410 ?auto_2258409 ) ( SURFACE-AT ?auto_2258403 ?auto_2258409 ) ( CLEAR ?auto_2258403 ) ( LIFTING ?auto_2258408 ?auto_2258404 ) ( IS-CRATE ?auto_2258404 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258404 ?auto_2258405 )
      ( MAKE-2CRATE-VERIFY ?auto_2258403 ?auto_2258404 ?auto_2258405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258412 - SURFACE
      ?auto_2258413 - SURFACE
    )
    :vars
    (
      ?auto_2258416 - HOIST
      ?auto_2258418 - PLACE
      ?auto_2258420 - SURFACE
      ?auto_2258414 - PLACE
      ?auto_2258419 - HOIST
      ?auto_2258417 - SURFACE
      ?auto_2258415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258416 ?auto_2258418 ) ( IS-CRATE ?auto_2258413 ) ( not ( = ?auto_2258412 ?auto_2258413 ) ) ( not ( = ?auto_2258420 ?auto_2258412 ) ) ( not ( = ?auto_2258420 ?auto_2258413 ) ) ( not ( = ?auto_2258414 ?auto_2258418 ) ) ( HOIST-AT ?auto_2258419 ?auto_2258414 ) ( not ( = ?auto_2258416 ?auto_2258419 ) ) ( AVAILABLE ?auto_2258419 ) ( SURFACE-AT ?auto_2258413 ?auto_2258414 ) ( ON ?auto_2258413 ?auto_2258417 ) ( CLEAR ?auto_2258413 ) ( not ( = ?auto_2258412 ?auto_2258417 ) ) ( not ( = ?auto_2258413 ?auto_2258417 ) ) ( not ( = ?auto_2258420 ?auto_2258417 ) ) ( TRUCK-AT ?auto_2258415 ?auto_2258418 ) ( SURFACE-AT ?auto_2258420 ?auto_2258418 ) ( CLEAR ?auto_2258420 ) ( IS-CRATE ?auto_2258412 ) ( AVAILABLE ?auto_2258416 ) ( IN ?auto_2258412 ?auto_2258415 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2258416 ?auto_2258412 ?auto_2258415 ?auto_2258418 )
      ( MAKE-2CRATE ?auto_2258420 ?auto_2258412 ?auto_2258413 )
      ( MAKE-1CRATE-VERIFY ?auto_2258412 ?auto_2258413 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2258421 - SURFACE
      ?auto_2258422 - SURFACE
      ?auto_2258423 - SURFACE
    )
    :vars
    (
      ?auto_2258424 - HOIST
      ?auto_2258427 - PLACE
      ?auto_2258426 - PLACE
      ?auto_2258428 - HOIST
      ?auto_2258429 - SURFACE
      ?auto_2258425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258424 ?auto_2258427 ) ( IS-CRATE ?auto_2258423 ) ( not ( = ?auto_2258422 ?auto_2258423 ) ) ( not ( = ?auto_2258421 ?auto_2258422 ) ) ( not ( = ?auto_2258421 ?auto_2258423 ) ) ( not ( = ?auto_2258426 ?auto_2258427 ) ) ( HOIST-AT ?auto_2258428 ?auto_2258426 ) ( not ( = ?auto_2258424 ?auto_2258428 ) ) ( AVAILABLE ?auto_2258428 ) ( SURFACE-AT ?auto_2258423 ?auto_2258426 ) ( ON ?auto_2258423 ?auto_2258429 ) ( CLEAR ?auto_2258423 ) ( not ( = ?auto_2258422 ?auto_2258429 ) ) ( not ( = ?auto_2258423 ?auto_2258429 ) ) ( not ( = ?auto_2258421 ?auto_2258429 ) ) ( TRUCK-AT ?auto_2258425 ?auto_2258427 ) ( SURFACE-AT ?auto_2258421 ?auto_2258427 ) ( CLEAR ?auto_2258421 ) ( IS-CRATE ?auto_2258422 ) ( AVAILABLE ?auto_2258424 ) ( IN ?auto_2258422 ?auto_2258425 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258422 ?auto_2258423 )
      ( MAKE-2CRATE-VERIFY ?auto_2258421 ?auto_2258422 ?auto_2258423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2258466 - SURFACE
      ?auto_2258467 - SURFACE
    )
    :vars
    (
      ?auto_2258471 - HOIST
      ?auto_2258468 - PLACE
      ?auto_2258474 - SURFACE
      ?auto_2258469 - PLACE
      ?auto_2258472 - HOIST
      ?auto_2258473 - SURFACE
      ?auto_2258470 - TRUCK
      ?auto_2258475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258471 ?auto_2258468 ) ( SURFACE-AT ?auto_2258466 ?auto_2258468 ) ( CLEAR ?auto_2258466 ) ( IS-CRATE ?auto_2258467 ) ( not ( = ?auto_2258466 ?auto_2258467 ) ) ( AVAILABLE ?auto_2258471 ) ( ON ?auto_2258466 ?auto_2258474 ) ( not ( = ?auto_2258474 ?auto_2258466 ) ) ( not ( = ?auto_2258474 ?auto_2258467 ) ) ( not ( = ?auto_2258469 ?auto_2258468 ) ) ( HOIST-AT ?auto_2258472 ?auto_2258469 ) ( not ( = ?auto_2258471 ?auto_2258472 ) ) ( AVAILABLE ?auto_2258472 ) ( SURFACE-AT ?auto_2258467 ?auto_2258469 ) ( ON ?auto_2258467 ?auto_2258473 ) ( CLEAR ?auto_2258467 ) ( not ( = ?auto_2258466 ?auto_2258473 ) ) ( not ( = ?auto_2258467 ?auto_2258473 ) ) ( not ( = ?auto_2258474 ?auto_2258473 ) ) ( TRUCK-AT ?auto_2258470 ?auto_2258475 ) ( not ( = ?auto_2258475 ?auto_2258468 ) ) ( not ( = ?auto_2258469 ?auto_2258475 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2258470 ?auto_2258475 ?auto_2258468 )
      ( MAKE-1CRATE ?auto_2258466 ?auto_2258467 )
      ( MAKE-1CRATE-VERIFY ?auto_2258466 ?auto_2258467 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258505 - SURFACE
      ?auto_2258506 - SURFACE
      ?auto_2258507 - SURFACE
      ?auto_2258508 - SURFACE
    )
    :vars
    (
      ?auto_2258509 - HOIST
      ?auto_2258510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258509 ?auto_2258510 ) ( SURFACE-AT ?auto_2258507 ?auto_2258510 ) ( CLEAR ?auto_2258507 ) ( LIFTING ?auto_2258509 ?auto_2258508 ) ( IS-CRATE ?auto_2258508 ) ( not ( = ?auto_2258507 ?auto_2258508 ) ) ( ON ?auto_2258506 ?auto_2258505 ) ( ON ?auto_2258507 ?auto_2258506 ) ( not ( = ?auto_2258505 ?auto_2258506 ) ) ( not ( = ?auto_2258505 ?auto_2258507 ) ) ( not ( = ?auto_2258505 ?auto_2258508 ) ) ( not ( = ?auto_2258506 ?auto_2258507 ) ) ( not ( = ?auto_2258506 ?auto_2258508 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258507 ?auto_2258508 )
      ( MAKE-3CRATE-VERIFY ?auto_2258505 ?auto_2258506 ?auto_2258507 ?auto_2258508 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258522 - SURFACE
      ?auto_2258523 - SURFACE
      ?auto_2258524 - SURFACE
      ?auto_2258525 - SURFACE
    )
    :vars
    (
      ?auto_2258526 - HOIST
      ?auto_2258528 - PLACE
      ?auto_2258527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258526 ?auto_2258528 ) ( SURFACE-AT ?auto_2258524 ?auto_2258528 ) ( CLEAR ?auto_2258524 ) ( IS-CRATE ?auto_2258525 ) ( not ( = ?auto_2258524 ?auto_2258525 ) ) ( TRUCK-AT ?auto_2258527 ?auto_2258528 ) ( AVAILABLE ?auto_2258526 ) ( IN ?auto_2258525 ?auto_2258527 ) ( ON ?auto_2258524 ?auto_2258523 ) ( not ( = ?auto_2258523 ?auto_2258524 ) ) ( not ( = ?auto_2258523 ?auto_2258525 ) ) ( ON ?auto_2258523 ?auto_2258522 ) ( not ( = ?auto_2258522 ?auto_2258523 ) ) ( not ( = ?auto_2258522 ?auto_2258524 ) ) ( not ( = ?auto_2258522 ?auto_2258525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258523 ?auto_2258524 ?auto_2258525 )
      ( MAKE-3CRATE-VERIFY ?auto_2258522 ?auto_2258523 ?auto_2258524 ?auto_2258525 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258543 - SURFACE
      ?auto_2258544 - SURFACE
      ?auto_2258545 - SURFACE
      ?auto_2258546 - SURFACE
    )
    :vars
    (
      ?auto_2258550 - HOIST
      ?auto_2258549 - PLACE
      ?auto_2258547 - TRUCK
      ?auto_2258548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258550 ?auto_2258549 ) ( SURFACE-AT ?auto_2258545 ?auto_2258549 ) ( CLEAR ?auto_2258545 ) ( IS-CRATE ?auto_2258546 ) ( not ( = ?auto_2258545 ?auto_2258546 ) ) ( AVAILABLE ?auto_2258550 ) ( IN ?auto_2258546 ?auto_2258547 ) ( ON ?auto_2258545 ?auto_2258544 ) ( not ( = ?auto_2258544 ?auto_2258545 ) ) ( not ( = ?auto_2258544 ?auto_2258546 ) ) ( TRUCK-AT ?auto_2258547 ?auto_2258548 ) ( not ( = ?auto_2258548 ?auto_2258549 ) ) ( ON ?auto_2258544 ?auto_2258543 ) ( not ( = ?auto_2258543 ?auto_2258544 ) ) ( not ( = ?auto_2258543 ?auto_2258545 ) ) ( not ( = ?auto_2258543 ?auto_2258546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258544 ?auto_2258545 ?auto_2258546 )
      ( MAKE-3CRATE-VERIFY ?auto_2258543 ?auto_2258544 ?auto_2258545 ?auto_2258546 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258567 - SURFACE
      ?auto_2258568 - SURFACE
      ?auto_2258569 - SURFACE
      ?auto_2258570 - SURFACE
    )
    :vars
    (
      ?auto_2258574 - HOIST
      ?auto_2258572 - PLACE
      ?auto_2258575 - TRUCK
      ?auto_2258573 - PLACE
      ?auto_2258571 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258574 ?auto_2258572 ) ( SURFACE-AT ?auto_2258569 ?auto_2258572 ) ( CLEAR ?auto_2258569 ) ( IS-CRATE ?auto_2258570 ) ( not ( = ?auto_2258569 ?auto_2258570 ) ) ( AVAILABLE ?auto_2258574 ) ( ON ?auto_2258569 ?auto_2258568 ) ( not ( = ?auto_2258568 ?auto_2258569 ) ) ( not ( = ?auto_2258568 ?auto_2258570 ) ) ( TRUCK-AT ?auto_2258575 ?auto_2258573 ) ( not ( = ?auto_2258573 ?auto_2258572 ) ) ( HOIST-AT ?auto_2258571 ?auto_2258573 ) ( LIFTING ?auto_2258571 ?auto_2258570 ) ( not ( = ?auto_2258574 ?auto_2258571 ) ) ( ON ?auto_2258568 ?auto_2258567 ) ( not ( = ?auto_2258567 ?auto_2258568 ) ) ( not ( = ?auto_2258567 ?auto_2258569 ) ) ( not ( = ?auto_2258567 ?auto_2258570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258568 ?auto_2258569 ?auto_2258570 )
      ( MAKE-3CRATE-VERIFY ?auto_2258567 ?auto_2258568 ?auto_2258569 ?auto_2258570 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258594 - SURFACE
      ?auto_2258595 - SURFACE
      ?auto_2258596 - SURFACE
      ?auto_2258597 - SURFACE
    )
    :vars
    (
      ?auto_2258602 - HOIST
      ?auto_2258598 - PLACE
      ?auto_2258599 - TRUCK
      ?auto_2258603 - PLACE
      ?auto_2258600 - HOIST
      ?auto_2258601 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258602 ?auto_2258598 ) ( SURFACE-AT ?auto_2258596 ?auto_2258598 ) ( CLEAR ?auto_2258596 ) ( IS-CRATE ?auto_2258597 ) ( not ( = ?auto_2258596 ?auto_2258597 ) ) ( AVAILABLE ?auto_2258602 ) ( ON ?auto_2258596 ?auto_2258595 ) ( not ( = ?auto_2258595 ?auto_2258596 ) ) ( not ( = ?auto_2258595 ?auto_2258597 ) ) ( TRUCK-AT ?auto_2258599 ?auto_2258603 ) ( not ( = ?auto_2258603 ?auto_2258598 ) ) ( HOIST-AT ?auto_2258600 ?auto_2258603 ) ( not ( = ?auto_2258602 ?auto_2258600 ) ) ( AVAILABLE ?auto_2258600 ) ( SURFACE-AT ?auto_2258597 ?auto_2258603 ) ( ON ?auto_2258597 ?auto_2258601 ) ( CLEAR ?auto_2258597 ) ( not ( = ?auto_2258596 ?auto_2258601 ) ) ( not ( = ?auto_2258597 ?auto_2258601 ) ) ( not ( = ?auto_2258595 ?auto_2258601 ) ) ( ON ?auto_2258595 ?auto_2258594 ) ( not ( = ?auto_2258594 ?auto_2258595 ) ) ( not ( = ?auto_2258594 ?auto_2258596 ) ) ( not ( = ?auto_2258594 ?auto_2258597 ) ) ( not ( = ?auto_2258594 ?auto_2258601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258595 ?auto_2258596 ?auto_2258597 )
      ( MAKE-3CRATE-VERIFY ?auto_2258594 ?auto_2258595 ?auto_2258596 ?auto_2258597 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258622 - SURFACE
      ?auto_2258623 - SURFACE
      ?auto_2258624 - SURFACE
      ?auto_2258625 - SURFACE
    )
    :vars
    (
      ?auto_2258630 - HOIST
      ?auto_2258627 - PLACE
      ?auto_2258626 - PLACE
      ?auto_2258629 - HOIST
      ?auto_2258631 - SURFACE
      ?auto_2258628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258630 ?auto_2258627 ) ( SURFACE-AT ?auto_2258624 ?auto_2258627 ) ( CLEAR ?auto_2258624 ) ( IS-CRATE ?auto_2258625 ) ( not ( = ?auto_2258624 ?auto_2258625 ) ) ( AVAILABLE ?auto_2258630 ) ( ON ?auto_2258624 ?auto_2258623 ) ( not ( = ?auto_2258623 ?auto_2258624 ) ) ( not ( = ?auto_2258623 ?auto_2258625 ) ) ( not ( = ?auto_2258626 ?auto_2258627 ) ) ( HOIST-AT ?auto_2258629 ?auto_2258626 ) ( not ( = ?auto_2258630 ?auto_2258629 ) ) ( AVAILABLE ?auto_2258629 ) ( SURFACE-AT ?auto_2258625 ?auto_2258626 ) ( ON ?auto_2258625 ?auto_2258631 ) ( CLEAR ?auto_2258625 ) ( not ( = ?auto_2258624 ?auto_2258631 ) ) ( not ( = ?auto_2258625 ?auto_2258631 ) ) ( not ( = ?auto_2258623 ?auto_2258631 ) ) ( TRUCK-AT ?auto_2258628 ?auto_2258627 ) ( ON ?auto_2258623 ?auto_2258622 ) ( not ( = ?auto_2258622 ?auto_2258623 ) ) ( not ( = ?auto_2258622 ?auto_2258624 ) ) ( not ( = ?auto_2258622 ?auto_2258625 ) ) ( not ( = ?auto_2258622 ?auto_2258631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258623 ?auto_2258624 ?auto_2258625 )
      ( MAKE-3CRATE-VERIFY ?auto_2258622 ?auto_2258623 ?auto_2258624 ?auto_2258625 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258650 - SURFACE
      ?auto_2258651 - SURFACE
      ?auto_2258652 - SURFACE
      ?auto_2258653 - SURFACE
    )
    :vars
    (
      ?auto_2258659 - HOIST
      ?auto_2258658 - PLACE
      ?auto_2258654 - PLACE
      ?auto_2258655 - HOIST
      ?auto_2258656 - SURFACE
      ?auto_2258657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258659 ?auto_2258658 ) ( IS-CRATE ?auto_2258653 ) ( not ( = ?auto_2258652 ?auto_2258653 ) ) ( not ( = ?auto_2258651 ?auto_2258652 ) ) ( not ( = ?auto_2258651 ?auto_2258653 ) ) ( not ( = ?auto_2258654 ?auto_2258658 ) ) ( HOIST-AT ?auto_2258655 ?auto_2258654 ) ( not ( = ?auto_2258659 ?auto_2258655 ) ) ( AVAILABLE ?auto_2258655 ) ( SURFACE-AT ?auto_2258653 ?auto_2258654 ) ( ON ?auto_2258653 ?auto_2258656 ) ( CLEAR ?auto_2258653 ) ( not ( = ?auto_2258652 ?auto_2258656 ) ) ( not ( = ?auto_2258653 ?auto_2258656 ) ) ( not ( = ?auto_2258651 ?auto_2258656 ) ) ( TRUCK-AT ?auto_2258657 ?auto_2258658 ) ( SURFACE-AT ?auto_2258651 ?auto_2258658 ) ( CLEAR ?auto_2258651 ) ( LIFTING ?auto_2258659 ?auto_2258652 ) ( IS-CRATE ?auto_2258652 ) ( ON ?auto_2258651 ?auto_2258650 ) ( not ( = ?auto_2258650 ?auto_2258651 ) ) ( not ( = ?auto_2258650 ?auto_2258652 ) ) ( not ( = ?auto_2258650 ?auto_2258653 ) ) ( not ( = ?auto_2258650 ?auto_2258656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258651 ?auto_2258652 ?auto_2258653 )
      ( MAKE-3CRATE-VERIFY ?auto_2258650 ?auto_2258651 ?auto_2258652 ?auto_2258653 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2258678 - SURFACE
      ?auto_2258679 - SURFACE
      ?auto_2258680 - SURFACE
      ?auto_2258681 - SURFACE
    )
    :vars
    (
      ?auto_2258686 - HOIST
      ?auto_2258683 - PLACE
      ?auto_2258685 - PLACE
      ?auto_2258687 - HOIST
      ?auto_2258682 - SURFACE
      ?auto_2258684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258686 ?auto_2258683 ) ( IS-CRATE ?auto_2258681 ) ( not ( = ?auto_2258680 ?auto_2258681 ) ) ( not ( = ?auto_2258679 ?auto_2258680 ) ) ( not ( = ?auto_2258679 ?auto_2258681 ) ) ( not ( = ?auto_2258685 ?auto_2258683 ) ) ( HOIST-AT ?auto_2258687 ?auto_2258685 ) ( not ( = ?auto_2258686 ?auto_2258687 ) ) ( AVAILABLE ?auto_2258687 ) ( SURFACE-AT ?auto_2258681 ?auto_2258685 ) ( ON ?auto_2258681 ?auto_2258682 ) ( CLEAR ?auto_2258681 ) ( not ( = ?auto_2258680 ?auto_2258682 ) ) ( not ( = ?auto_2258681 ?auto_2258682 ) ) ( not ( = ?auto_2258679 ?auto_2258682 ) ) ( TRUCK-AT ?auto_2258684 ?auto_2258683 ) ( SURFACE-AT ?auto_2258679 ?auto_2258683 ) ( CLEAR ?auto_2258679 ) ( IS-CRATE ?auto_2258680 ) ( AVAILABLE ?auto_2258686 ) ( IN ?auto_2258680 ?auto_2258684 ) ( ON ?auto_2258679 ?auto_2258678 ) ( not ( = ?auto_2258678 ?auto_2258679 ) ) ( not ( = ?auto_2258678 ?auto_2258680 ) ) ( not ( = ?auto_2258678 ?auto_2258681 ) ) ( not ( = ?auto_2258678 ?auto_2258682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258679 ?auto_2258680 ?auto_2258681 )
      ( MAKE-3CRATE-VERIFY ?auto_2258678 ?auto_2258679 ?auto_2258680 ?auto_2258681 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2258969 - SURFACE
      ?auto_2258970 - SURFACE
      ?auto_2258971 - SURFACE
      ?auto_2258973 - SURFACE
      ?auto_2258972 - SURFACE
    )
    :vars
    (
      ?auto_2258975 - HOIST
      ?auto_2258974 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258975 ?auto_2258974 ) ( SURFACE-AT ?auto_2258973 ?auto_2258974 ) ( CLEAR ?auto_2258973 ) ( LIFTING ?auto_2258975 ?auto_2258972 ) ( IS-CRATE ?auto_2258972 ) ( not ( = ?auto_2258973 ?auto_2258972 ) ) ( ON ?auto_2258970 ?auto_2258969 ) ( ON ?auto_2258971 ?auto_2258970 ) ( ON ?auto_2258973 ?auto_2258971 ) ( not ( = ?auto_2258969 ?auto_2258970 ) ) ( not ( = ?auto_2258969 ?auto_2258971 ) ) ( not ( = ?auto_2258969 ?auto_2258973 ) ) ( not ( = ?auto_2258969 ?auto_2258972 ) ) ( not ( = ?auto_2258970 ?auto_2258971 ) ) ( not ( = ?auto_2258970 ?auto_2258973 ) ) ( not ( = ?auto_2258970 ?auto_2258972 ) ) ( not ( = ?auto_2258971 ?auto_2258973 ) ) ( not ( = ?auto_2258971 ?auto_2258972 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2258973 ?auto_2258972 )
      ( MAKE-4CRATE-VERIFY ?auto_2258969 ?auto_2258970 ?auto_2258971 ?auto_2258973 ?auto_2258972 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2258994 - SURFACE
      ?auto_2258995 - SURFACE
      ?auto_2258996 - SURFACE
      ?auto_2258998 - SURFACE
      ?auto_2258997 - SURFACE
    )
    :vars
    (
      ?auto_2258999 - HOIST
      ?auto_2259000 - PLACE
      ?auto_2259001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2258999 ?auto_2259000 ) ( SURFACE-AT ?auto_2258998 ?auto_2259000 ) ( CLEAR ?auto_2258998 ) ( IS-CRATE ?auto_2258997 ) ( not ( = ?auto_2258998 ?auto_2258997 ) ) ( TRUCK-AT ?auto_2259001 ?auto_2259000 ) ( AVAILABLE ?auto_2258999 ) ( IN ?auto_2258997 ?auto_2259001 ) ( ON ?auto_2258998 ?auto_2258996 ) ( not ( = ?auto_2258996 ?auto_2258998 ) ) ( not ( = ?auto_2258996 ?auto_2258997 ) ) ( ON ?auto_2258995 ?auto_2258994 ) ( ON ?auto_2258996 ?auto_2258995 ) ( not ( = ?auto_2258994 ?auto_2258995 ) ) ( not ( = ?auto_2258994 ?auto_2258996 ) ) ( not ( = ?auto_2258994 ?auto_2258998 ) ) ( not ( = ?auto_2258994 ?auto_2258997 ) ) ( not ( = ?auto_2258995 ?auto_2258996 ) ) ( not ( = ?auto_2258995 ?auto_2258998 ) ) ( not ( = ?auto_2258995 ?auto_2258997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2258996 ?auto_2258998 ?auto_2258997 )
      ( MAKE-4CRATE-VERIFY ?auto_2258994 ?auto_2258995 ?auto_2258996 ?auto_2258998 ?auto_2258997 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2259024 - SURFACE
      ?auto_2259025 - SURFACE
      ?auto_2259026 - SURFACE
      ?auto_2259028 - SURFACE
      ?auto_2259027 - SURFACE
    )
    :vars
    (
      ?auto_2259029 - HOIST
      ?auto_2259030 - PLACE
      ?auto_2259031 - TRUCK
      ?auto_2259032 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259029 ?auto_2259030 ) ( SURFACE-AT ?auto_2259028 ?auto_2259030 ) ( CLEAR ?auto_2259028 ) ( IS-CRATE ?auto_2259027 ) ( not ( = ?auto_2259028 ?auto_2259027 ) ) ( AVAILABLE ?auto_2259029 ) ( IN ?auto_2259027 ?auto_2259031 ) ( ON ?auto_2259028 ?auto_2259026 ) ( not ( = ?auto_2259026 ?auto_2259028 ) ) ( not ( = ?auto_2259026 ?auto_2259027 ) ) ( TRUCK-AT ?auto_2259031 ?auto_2259032 ) ( not ( = ?auto_2259032 ?auto_2259030 ) ) ( ON ?auto_2259025 ?auto_2259024 ) ( ON ?auto_2259026 ?auto_2259025 ) ( not ( = ?auto_2259024 ?auto_2259025 ) ) ( not ( = ?auto_2259024 ?auto_2259026 ) ) ( not ( = ?auto_2259024 ?auto_2259028 ) ) ( not ( = ?auto_2259024 ?auto_2259027 ) ) ( not ( = ?auto_2259025 ?auto_2259026 ) ) ( not ( = ?auto_2259025 ?auto_2259028 ) ) ( not ( = ?auto_2259025 ?auto_2259027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259026 ?auto_2259028 ?auto_2259027 )
      ( MAKE-4CRATE-VERIFY ?auto_2259024 ?auto_2259025 ?auto_2259026 ?auto_2259028 ?auto_2259027 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2259058 - SURFACE
      ?auto_2259059 - SURFACE
      ?auto_2259060 - SURFACE
      ?auto_2259062 - SURFACE
      ?auto_2259061 - SURFACE
    )
    :vars
    (
      ?auto_2259063 - HOIST
      ?auto_2259065 - PLACE
      ?auto_2259067 - TRUCK
      ?auto_2259066 - PLACE
      ?auto_2259064 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259063 ?auto_2259065 ) ( SURFACE-AT ?auto_2259062 ?auto_2259065 ) ( CLEAR ?auto_2259062 ) ( IS-CRATE ?auto_2259061 ) ( not ( = ?auto_2259062 ?auto_2259061 ) ) ( AVAILABLE ?auto_2259063 ) ( ON ?auto_2259062 ?auto_2259060 ) ( not ( = ?auto_2259060 ?auto_2259062 ) ) ( not ( = ?auto_2259060 ?auto_2259061 ) ) ( TRUCK-AT ?auto_2259067 ?auto_2259066 ) ( not ( = ?auto_2259066 ?auto_2259065 ) ) ( HOIST-AT ?auto_2259064 ?auto_2259066 ) ( LIFTING ?auto_2259064 ?auto_2259061 ) ( not ( = ?auto_2259063 ?auto_2259064 ) ) ( ON ?auto_2259059 ?auto_2259058 ) ( ON ?auto_2259060 ?auto_2259059 ) ( not ( = ?auto_2259058 ?auto_2259059 ) ) ( not ( = ?auto_2259058 ?auto_2259060 ) ) ( not ( = ?auto_2259058 ?auto_2259062 ) ) ( not ( = ?auto_2259058 ?auto_2259061 ) ) ( not ( = ?auto_2259059 ?auto_2259060 ) ) ( not ( = ?auto_2259059 ?auto_2259062 ) ) ( not ( = ?auto_2259059 ?auto_2259061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259060 ?auto_2259062 ?auto_2259061 )
      ( MAKE-4CRATE-VERIFY ?auto_2259058 ?auto_2259059 ?auto_2259060 ?auto_2259062 ?auto_2259061 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2259096 - SURFACE
      ?auto_2259097 - SURFACE
      ?auto_2259098 - SURFACE
      ?auto_2259100 - SURFACE
      ?auto_2259099 - SURFACE
    )
    :vars
    (
      ?auto_2259101 - HOIST
      ?auto_2259104 - PLACE
      ?auto_2259105 - TRUCK
      ?auto_2259102 - PLACE
      ?auto_2259103 - HOIST
      ?auto_2259106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259101 ?auto_2259104 ) ( SURFACE-AT ?auto_2259100 ?auto_2259104 ) ( CLEAR ?auto_2259100 ) ( IS-CRATE ?auto_2259099 ) ( not ( = ?auto_2259100 ?auto_2259099 ) ) ( AVAILABLE ?auto_2259101 ) ( ON ?auto_2259100 ?auto_2259098 ) ( not ( = ?auto_2259098 ?auto_2259100 ) ) ( not ( = ?auto_2259098 ?auto_2259099 ) ) ( TRUCK-AT ?auto_2259105 ?auto_2259102 ) ( not ( = ?auto_2259102 ?auto_2259104 ) ) ( HOIST-AT ?auto_2259103 ?auto_2259102 ) ( not ( = ?auto_2259101 ?auto_2259103 ) ) ( AVAILABLE ?auto_2259103 ) ( SURFACE-AT ?auto_2259099 ?auto_2259102 ) ( ON ?auto_2259099 ?auto_2259106 ) ( CLEAR ?auto_2259099 ) ( not ( = ?auto_2259100 ?auto_2259106 ) ) ( not ( = ?auto_2259099 ?auto_2259106 ) ) ( not ( = ?auto_2259098 ?auto_2259106 ) ) ( ON ?auto_2259097 ?auto_2259096 ) ( ON ?auto_2259098 ?auto_2259097 ) ( not ( = ?auto_2259096 ?auto_2259097 ) ) ( not ( = ?auto_2259096 ?auto_2259098 ) ) ( not ( = ?auto_2259096 ?auto_2259100 ) ) ( not ( = ?auto_2259096 ?auto_2259099 ) ) ( not ( = ?auto_2259096 ?auto_2259106 ) ) ( not ( = ?auto_2259097 ?auto_2259098 ) ) ( not ( = ?auto_2259097 ?auto_2259100 ) ) ( not ( = ?auto_2259097 ?auto_2259099 ) ) ( not ( = ?auto_2259097 ?auto_2259106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259098 ?auto_2259100 ?auto_2259099 )
      ( MAKE-4CRATE-VERIFY ?auto_2259096 ?auto_2259097 ?auto_2259098 ?auto_2259100 ?auto_2259099 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2259135 - SURFACE
      ?auto_2259136 - SURFACE
      ?auto_2259137 - SURFACE
      ?auto_2259139 - SURFACE
      ?auto_2259138 - SURFACE
    )
    :vars
    (
      ?auto_2259142 - HOIST
      ?auto_2259144 - PLACE
      ?auto_2259141 - PLACE
      ?auto_2259140 - HOIST
      ?auto_2259143 - SURFACE
      ?auto_2259145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259142 ?auto_2259144 ) ( SURFACE-AT ?auto_2259139 ?auto_2259144 ) ( CLEAR ?auto_2259139 ) ( IS-CRATE ?auto_2259138 ) ( not ( = ?auto_2259139 ?auto_2259138 ) ) ( AVAILABLE ?auto_2259142 ) ( ON ?auto_2259139 ?auto_2259137 ) ( not ( = ?auto_2259137 ?auto_2259139 ) ) ( not ( = ?auto_2259137 ?auto_2259138 ) ) ( not ( = ?auto_2259141 ?auto_2259144 ) ) ( HOIST-AT ?auto_2259140 ?auto_2259141 ) ( not ( = ?auto_2259142 ?auto_2259140 ) ) ( AVAILABLE ?auto_2259140 ) ( SURFACE-AT ?auto_2259138 ?auto_2259141 ) ( ON ?auto_2259138 ?auto_2259143 ) ( CLEAR ?auto_2259138 ) ( not ( = ?auto_2259139 ?auto_2259143 ) ) ( not ( = ?auto_2259138 ?auto_2259143 ) ) ( not ( = ?auto_2259137 ?auto_2259143 ) ) ( TRUCK-AT ?auto_2259145 ?auto_2259144 ) ( ON ?auto_2259136 ?auto_2259135 ) ( ON ?auto_2259137 ?auto_2259136 ) ( not ( = ?auto_2259135 ?auto_2259136 ) ) ( not ( = ?auto_2259135 ?auto_2259137 ) ) ( not ( = ?auto_2259135 ?auto_2259139 ) ) ( not ( = ?auto_2259135 ?auto_2259138 ) ) ( not ( = ?auto_2259135 ?auto_2259143 ) ) ( not ( = ?auto_2259136 ?auto_2259137 ) ) ( not ( = ?auto_2259136 ?auto_2259139 ) ) ( not ( = ?auto_2259136 ?auto_2259138 ) ) ( not ( = ?auto_2259136 ?auto_2259143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259137 ?auto_2259139 ?auto_2259138 )
      ( MAKE-4CRATE-VERIFY ?auto_2259135 ?auto_2259136 ?auto_2259137 ?auto_2259139 ?auto_2259138 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2259174 - SURFACE
      ?auto_2259175 - SURFACE
      ?auto_2259176 - SURFACE
      ?auto_2259178 - SURFACE
      ?auto_2259177 - SURFACE
    )
    :vars
    (
      ?auto_2259180 - HOIST
      ?auto_2259184 - PLACE
      ?auto_2259179 - PLACE
      ?auto_2259181 - HOIST
      ?auto_2259182 - SURFACE
      ?auto_2259183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259180 ?auto_2259184 ) ( IS-CRATE ?auto_2259177 ) ( not ( = ?auto_2259178 ?auto_2259177 ) ) ( not ( = ?auto_2259176 ?auto_2259178 ) ) ( not ( = ?auto_2259176 ?auto_2259177 ) ) ( not ( = ?auto_2259179 ?auto_2259184 ) ) ( HOIST-AT ?auto_2259181 ?auto_2259179 ) ( not ( = ?auto_2259180 ?auto_2259181 ) ) ( AVAILABLE ?auto_2259181 ) ( SURFACE-AT ?auto_2259177 ?auto_2259179 ) ( ON ?auto_2259177 ?auto_2259182 ) ( CLEAR ?auto_2259177 ) ( not ( = ?auto_2259178 ?auto_2259182 ) ) ( not ( = ?auto_2259177 ?auto_2259182 ) ) ( not ( = ?auto_2259176 ?auto_2259182 ) ) ( TRUCK-AT ?auto_2259183 ?auto_2259184 ) ( SURFACE-AT ?auto_2259176 ?auto_2259184 ) ( CLEAR ?auto_2259176 ) ( LIFTING ?auto_2259180 ?auto_2259178 ) ( IS-CRATE ?auto_2259178 ) ( ON ?auto_2259175 ?auto_2259174 ) ( ON ?auto_2259176 ?auto_2259175 ) ( not ( = ?auto_2259174 ?auto_2259175 ) ) ( not ( = ?auto_2259174 ?auto_2259176 ) ) ( not ( = ?auto_2259174 ?auto_2259178 ) ) ( not ( = ?auto_2259174 ?auto_2259177 ) ) ( not ( = ?auto_2259174 ?auto_2259182 ) ) ( not ( = ?auto_2259175 ?auto_2259176 ) ) ( not ( = ?auto_2259175 ?auto_2259178 ) ) ( not ( = ?auto_2259175 ?auto_2259177 ) ) ( not ( = ?auto_2259175 ?auto_2259182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259176 ?auto_2259178 ?auto_2259177 )
      ( MAKE-4CRATE-VERIFY ?auto_2259174 ?auto_2259175 ?auto_2259176 ?auto_2259178 ?auto_2259177 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2259213 - SURFACE
      ?auto_2259214 - SURFACE
      ?auto_2259215 - SURFACE
      ?auto_2259217 - SURFACE
      ?auto_2259216 - SURFACE
    )
    :vars
    (
      ?auto_2259223 - HOIST
      ?auto_2259219 - PLACE
      ?auto_2259218 - PLACE
      ?auto_2259220 - HOIST
      ?auto_2259221 - SURFACE
      ?auto_2259222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259223 ?auto_2259219 ) ( IS-CRATE ?auto_2259216 ) ( not ( = ?auto_2259217 ?auto_2259216 ) ) ( not ( = ?auto_2259215 ?auto_2259217 ) ) ( not ( = ?auto_2259215 ?auto_2259216 ) ) ( not ( = ?auto_2259218 ?auto_2259219 ) ) ( HOIST-AT ?auto_2259220 ?auto_2259218 ) ( not ( = ?auto_2259223 ?auto_2259220 ) ) ( AVAILABLE ?auto_2259220 ) ( SURFACE-AT ?auto_2259216 ?auto_2259218 ) ( ON ?auto_2259216 ?auto_2259221 ) ( CLEAR ?auto_2259216 ) ( not ( = ?auto_2259217 ?auto_2259221 ) ) ( not ( = ?auto_2259216 ?auto_2259221 ) ) ( not ( = ?auto_2259215 ?auto_2259221 ) ) ( TRUCK-AT ?auto_2259222 ?auto_2259219 ) ( SURFACE-AT ?auto_2259215 ?auto_2259219 ) ( CLEAR ?auto_2259215 ) ( IS-CRATE ?auto_2259217 ) ( AVAILABLE ?auto_2259223 ) ( IN ?auto_2259217 ?auto_2259222 ) ( ON ?auto_2259214 ?auto_2259213 ) ( ON ?auto_2259215 ?auto_2259214 ) ( not ( = ?auto_2259213 ?auto_2259214 ) ) ( not ( = ?auto_2259213 ?auto_2259215 ) ) ( not ( = ?auto_2259213 ?auto_2259217 ) ) ( not ( = ?auto_2259213 ?auto_2259216 ) ) ( not ( = ?auto_2259213 ?auto_2259221 ) ) ( not ( = ?auto_2259214 ?auto_2259215 ) ) ( not ( = ?auto_2259214 ?auto_2259217 ) ) ( not ( = ?auto_2259214 ?auto_2259216 ) ) ( not ( = ?auto_2259214 ?auto_2259221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259215 ?auto_2259217 ?auto_2259216 )
      ( MAKE-4CRATE-VERIFY ?auto_2259213 ?auto_2259214 ?auto_2259215 ?auto_2259217 ?auto_2259216 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2259873 - SURFACE
      ?auto_2259874 - SURFACE
      ?auto_2259875 - SURFACE
      ?auto_2259877 - SURFACE
      ?auto_2259876 - SURFACE
      ?auto_2259878 - SURFACE
    )
    :vars
    (
      ?auto_2259879 - HOIST
      ?auto_2259880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259879 ?auto_2259880 ) ( SURFACE-AT ?auto_2259876 ?auto_2259880 ) ( CLEAR ?auto_2259876 ) ( LIFTING ?auto_2259879 ?auto_2259878 ) ( IS-CRATE ?auto_2259878 ) ( not ( = ?auto_2259876 ?auto_2259878 ) ) ( ON ?auto_2259874 ?auto_2259873 ) ( ON ?auto_2259875 ?auto_2259874 ) ( ON ?auto_2259877 ?auto_2259875 ) ( ON ?auto_2259876 ?auto_2259877 ) ( not ( = ?auto_2259873 ?auto_2259874 ) ) ( not ( = ?auto_2259873 ?auto_2259875 ) ) ( not ( = ?auto_2259873 ?auto_2259877 ) ) ( not ( = ?auto_2259873 ?auto_2259876 ) ) ( not ( = ?auto_2259873 ?auto_2259878 ) ) ( not ( = ?auto_2259874 ?auto_2259875 ) ) ( not ( = ?auto_2259874 ?auto_2259877 ) ) ( not ( = ?auto_2259874 ?auto_2259876 ) ) ( not ( = ?auto_2259874 ?auto_2259878 ) ) ( not ( = ?auto_2259875 ?auto_2259877 ) ) ( not ( = ?auto_2259875 ?auto_2259876 ) ) ( not ( = ?auto_2259875 ?auto_2259878 ) ) ( not ( = ?auto_2259877 ?auto_2259876 ) ) ( not ( = ?auto_2259877 ?auto_2259878 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2259876 ?auto_2259878 )
      ( MAKE-5CRATE-VERIFY ?auto_2259873 ?auto_2259874 ?auto_2259875 ?auto_2259877 ?auto_2259876 ?auto_2259878 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2259907 - SURFACE
      ?auto_2259908 - SURFACE
      ?auto_2259909 - SURFACE
      ?auto_2259911 - SURFACE
      ?auto_2259910 - SURFACE
      ?auto_2259912 - SURFACE
    )
    :vars
    (
      ?auto_2259915 - HOIST
      ?auto_2259913 - PLACE
      ?auto_2259914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259915 ?auto_2259913 ) ( SURFACE-AT ?auto_2259910 ?auto_2259913 ) ( CLEAR ?auto_2259910 ) ( IS-CRATE ?auto_2259912 ) ( not ( = ?auto_2259910 ?auto_2259912 ) ) ( TRUCK-AT ?auto_2259914 ?auto_2259913 ) ( AVAILABLE ?auto_2259915 ) ( IN ?auto_2259912 ?auto_2259914 ) ( ON ?auto_2259910 ?auto_2259911 ) ( not ( = ?auto_2259911 ?auto_2259910 ) ) ( not ( = ?auto_2259911 ?auto_2259912 ) ) ( ON ?auto_2259908 ?auto_2259907 ) ( ON ?auto_2259909 ?auto_2259908 ) ( ON ?auto_2259911 ?auto_2259909 ) ( not ( = ?auto_2259907 ?auto_2259908 ) ) ( not ( = ?auto_2259907 ?auto_2259909 ) ) ( not ( = ?auto_2259907 ?auto_2259911 ) ) ( not ( = ?auto_2259907 ?auto_2259910 ) ) ( not ( = ?auto_2259907 ?auto_2259912 ) ) ( not ( = ?auto_2259908 ?auto_2259909 ) ) ( not ( = ?auto_2259908 ?auto_2259911 ) ) ( not ( = ?auto_2259908 ?auto_2259910 ) ) ( not ( = ?auto_2259908 ?auto_2259912 ) ) ( not ( = ?auto_2259909 ?auto_2259911 ) ) ( not ( = ?auto_2259909 ?auto_2259910 ) ) ( not ( = ?auto_2259909 ?auto_2259912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259911 ?auto_2259910 ?auto_2259912 )
      ( MAKE-5CRATE-VERIFY ?auto_2259907 ?auto_2259908 ?auto_2259909 ?auto_2259911 ?auto_2259910 ?auto_2259912 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2259947 - SURFACE
      ?auto_2259948 - SURFACE
      ?auto_2259949 - SURFACE
      ?auto_2259951 - SURFACE
      ?auto_2259950 - SURFACE
      ?auto_2259952 - SURFACE
    )
    :vars
    (
      ?auto_2259955 - HOIST
      ?auto_2259956 - PLACE
      ?auto_2259954 - TRUCK
      ?auto_2259953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259955 ?auto_2259956 ) ( SURFACE-AT ?auto_2259950 ?auto_2259956 ) ( CLEAR ?auto_2259950 ) ( IS-CRATE ?auto_2259952 ) ( not ( = ?auto_2259950 ?auto_2259952 ) ) ( AVAILABLE ?auto_2259955 ) ( IN ?auto_2259952 ?auto_2259954 ) ( ON ?auto_2259950 ?auto_2259951 ) ( not ( = ?auto_2259951 ?auto_2259950 ) ) ( not ( = ?auto_2259951 ?auto_2259952 ) ) ( TRUCK-AT ?auto_2259954 ?auto_2259953 ) ( not ( = ?auto_2259953 ?auto_2259956 ) ) ( ON ?auto_2259948 ?auto_2259947 ) ( ON ?auto_2259949 ?auto_2259948 ) ( ON ?auto_2259951 ?auto_2259949 ) ( not ( = ?auto_2259947 ?auto_2259948 ) ) ( not ( = ?auto_2259947 ?auto_2259949 ) ) ( not ( = ?auto_2259947 ?auto_2259951 ) ) ( not ( = ?auto_2259947 ?auto_2259950 ) ) ( not ( = ?auto_2259947 ?auto_2259952 ) ) ( not ( = ?auto_2259948 ?auto_2259949 ) ) ( not ( = ?auto_2259948 ?auto_2259951 ) ) ( not ( = ?auto_2259948 ?auto_2259950 ) ) ( not ( = ?auto_2259948 ?auto_2259952 ) ) ( not ( = ?auto_2259949 ?auto_2259951 ) ) ( not ( = ?auto_2259949 ?auto_2259950 ) ) ( not ( = ?auto_2259949 ?auto_2259952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259951 ?auto_2259950 ?auto_2259952 )
      ( MAKE-5CRATE-VERIFY ?auto_2259947 ?auto_2259948 ?auto_2259949 ?auto_2259951 ?auto_2259950 ?auto_2259952 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2259992 - SURFACE
      ?auto_2259993 - SURFACE
      ?auto_2259994 - SURFACE
      ?auto_2259996 - SURFACE
      ?auto_2259995 - SURFACE
      ?auto_2259997 - SURFACE
    )
    :vars
    (
      ?auto_2260001 - HOIST
      ?auto_2259999 - PLACE
      ?auto_2259998 - TRUCK
      ?auto_2260002 - PLACE
      ?auto_2260000 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260001 ?auto_2259999 ) ( SURFACE-AT ?auto_2259995 ?auto_2259999 ) ( CLEAR ?auto_2259995 ) ( IS-CRATE ?auto_2259997 ) ( not ( = ?auto_2259995 ?auto_2259997 ) ) ( AVAILABLE ?auto_2260001 ) ( ON ?auto_2259995 ?auto_2259996 ) ( not ( = ?auto_2259996 ?auto_2259995 ) ) ( not ( = ?auto_2259996 ?auto_2259997 ) ) ( TRUCK-AT ?auto_2259998 ?auto_2260002 ) ( not ( = ?auto_2260002 ?auto_2259999 ) ) ( HOIST-AT ?auto_2260000 ?auto_2260002 ) ( LIFTING ?auto_2260000 ?auto_2259997 ) ( not ( = ?auto_2260001 ?auto_2260000 ) ) ( ON ?auto_2259993 ?auto_2259992 ) ( ON ?auto_2259994 ?auto_2259993 ) ( ON ?auto_2259996 ?auto_2259994 ) ( not ( = ?auto_2259992 ?auto_2259993 ) ) ( not ( = ?auto_2259992 ?auto_2259994 ) ) ( not ( = ?auto_2259992 ?auto_2259996 ) ) ( not ( = ?auto_2259992 ?auto_2259995 ) ) ( not ( = ?auto_2259992 ?auto_2259997 ) ) ( not ( = ?auto_2259993 ?auto_2259994 ) ) ( not ( = ?auto_2259993 ?auto_2259996 ) ) ( not ( = ?auto_2259993 ?auto_2259995 ) ) ( not ( = ?auto_2259993 ?auto_2259997 ) ) ( not ( = ?auto_2259994 ?auto_2259996 ) ) ( not ( = ?auto_2259994 ?auto_2259995 ) ) ( not ( = ?auto_2259994 ?auto_2259997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2259996 ?auto_2259995 ?auto_2259997 )
      ( MAKE-5CRATE-VERIFY ?auto_2259992 ?auto_2259993 ?auto_2259994 ?auto_2259996 ?auto_2259995 ?auto_2259997 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2260042 - SURFACE
      ?auto_2260043 - SURFACE
      ?auto_2260044 - SURFACE
      ?auto_2260046 - SURFACE
      ?auto_2260045 - SURFACE
      ?auto_2260047 - SURFACE
    )
    :vars
    (
      ?auto_2260050 - HOIST
      ?auto_2260051 - PLACE
      ?auto_2260052 - TRUCK
      ?auto_2260049 - PLACE
      ?auto_2260048 - HOIST
      ?auto_2260053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260050 ?auto_2260051 ) ( SURFACE-AT ?auto_2260045 ?auto_2260051 ) ( CLEAR ?auto_2260045 ) ( IS-CRATE ?auto_2260047 ) ( not ( = ?auto_2260045 ?auto_2260047 ) ) ( AVAILABLE ?auto_2260050 ) ( ON ?auto_2260045 ?auto_2260046 ) ( not ( = ?auto_2260046 ?auto_2260045 ) ) ( not ( = ?auto_2260046 ?auto_2260047 ) ) ( TRUCK-AT ?auto_2260052 ?auto_2260049 ) ( not ( = ?auto_2260049 ?auto_2260051 ) ) ( HOIST-AT ?auto_2260048 ?auto_2260049 ) ( not ( = ?auto_2260050 ?auto_2260048 ) ) ( AVAILABLE ?auto_2260048 ) ( SURFACE-AT ?auto_2260047 ?auto_2260049 ) ( ON ?auto_2260047 ?auto_2260053 ) ( CLEAR ?auto_2260047 ) ( not ( = ?auto_2260045 ?auto_2260053 ) ) ( not ( = ?auto_2260047 ?auto_2260053 ) ) ( not ( = ?auto_2260046 ?auto_2260053 ) ) ( ON ?auto_2260043 ?auto_2260042 ) ( ON ?auto_2260044 ?auto_2260043 ) ( ON ?auto_2260046 ?auto_2260044 ) ( not ( = ?auto_2260042 ?auto_2260043 ) ) ( not ( = ?auto_2260042 ?auto_2260044 ) ) ( not ( = ?auto_2260042 ?auto_2260046 ) ) ( not ( = ?auto_2260042 ?auto_2260045 ) ) ( not ( = ?auto_2260042 ?auto_2260047 ) ) ( not ( = ?auto_2260042 ?auto_2260053 ) ) ( not ( = ?auto_2260043 ?auto_2260044 ) ) ( not ( = ?auto_2260043 ?auto_2260046 ) ) ( not ( = ?auto_2260043 ?auto_2260045 ) ) ( not ( = ?auto_2260043 ?auto_2260047 ) ) ( not ( = ?auto_2260043 ?auto_2260053 ) ) ( not ( = ?auto_2260044 ?auto_2260046 ) ) ( not ( = ?auto_2260044 ?auto_2260045 ) ) ( not ( = ?auto_2260044 ?auto_2260047 ) ) ( not ( = ?auto_2260044 ?auto_2260053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260046 ?auto_2260045 ?auto_2260047 )
      ( MAKE-5CRATE-VERIFY ?auto_2260042 ?auto_2260043 ?auto_2260044 ?auto_2260046 ?auto_2260045 ?auto_2260047 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2260093 - SURFACE
      ?auto_2260094 - SURFACE
      ?auto_2260095 - SURFACE
      ?auto_2260097 - SURFACE
      ?auto_2260096 - SURFACE
      ?auto_2260098 - SURFACE
    )
    :vars
    (
      ?auto_2260099 - HOIST
      ?auto_2260104 - PLACE
      ?auto_2260103 - PLACE
      ?auto_2260100 - HOIST
      ?auto_2260102 - SURFACE
      ?auto_2260101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260099 ?auto_2260104 ) ( SURFACE-AT ?auto_2260096 ?auto_2260104 ) ( CLEAR ?auto_2260096 ) ( IS-CRATE ?auto_2260098 ) ( not ( = ?auto_2260096 ?auto_2260098 ) ) ( AVAILABLE ?auto_2260099 ) ( ON ?auto_2260096 ?auto_2260097 ) ( not ( = ?auto_2260097 ?auto_2260096 ) ) ( not ( = ?auto_2260097 ?auto_2260098 ) ) ( not ( = ?auto_2260103 ?auto_2260104 ) ) ( HOIST-AT ?auto_2260100 ?auto_2260103 ) ( not ( = ?auto_2260099 ?auto_2260100 ) ) ( AVAILABLE ?auto_2260100 ) ( SURFACE-AT ?auto_2260098 ?auto_2260103 ) ( ON ?auto_2260098 ?auto_2260102 ) ( CLEAR ?auto_2260098 ) ( not ( = ?auto_2260096 ?auto_2260102 ) ) ( not ( = ?auto_2260098 ?auto_2260102 ) ) ( not ( = ?auto_2260097 ?auto_2260102 ) ) ( TRUCK-AT ?auto_2260101 ?auto_2260104 ) ( ON ?auto_2260094 ?auto_2260093 ) ( ON ?auto_2260095 ?auto_2260094 ) ( ON ?auto_2260097 ?auto_2260095 ) ( not ( = ?auto_2260093 ?auto_2260094 ) ) ( not ( = ?auto_2260093 ?auto_2260095 ) ) ( not ( = ?auto_2260093 ?auto_2260097 ) ) ( not ( = ?auto_2260093 ?auto_2260096 ) ) ( not ( = ?auto_2260093 ?auto_2260098 ) ) ( not ( = ?auto_2260093 ?auto_2260102 ) ) ( not ( = ?auto_2260094 ?auto_2260095 ) ) ( not ( = ?auto_2260094 ?auto_2260097 ) ) ( not ( = ?auto_2260094 ?auto_2260096 ) ) ( not ( = ?auto_2260094 ?auto_2260098 ) ) ( not ( = ?auto_2260094 ?auto_2260102 ) ) ( not ( = ?auto_2260095 ?auto_2260097 ) ) ( not ( = ?auto_2260095 ?auto_2260096 ) ) ( not ( = ?auto_2260095 ?auto_2260098 ) ) ( not ( = ?auto_2260095 ?auto_2260102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260097 ?auto_2260096 ?auto_2260098 )
      ( MAKE-5CRATE-VERIFY ?auto_2260093 ?auto_2260094 ?auto_2260095 ?auto_2260097 ?auto_2260096 ?auto_2260098 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2260144 - SURFACE
      ?auto_2260145 - SURFACE
      ?auto_2260146 - SURFACE
      ?auto_2260148 - SURFACE
      ?auto_2260147 - SURFACE
      ?auto_2260149 - SURFACE
    )
    :vars
    (
      ?auto_2260153 - HOIST
      ?auto_2260155 - PLACE
      ?auto_2260151 - PLACE
      ?auto_2260150 - HOIST
      ?auto_2260154 - SURFACE
      ?auto_2260152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260153 ?auto_2260155 ) ( IS-CRATE ?auto_2260149 ) ( not ( = ?auto_2260147 ?auto_2260149 ) ) ( not ( = ?auto_2260148 ?auto_2260147 ) ) ( not ( = ?auto_2260148 ?auto_2260149 ) ) ( not ( = ?auto_2260151 ?auto_2260155 ) ) ( HOIST-AT ?auto_2260150 ?auto_2260151 ) ( not ( = ?auto_2260153 ?auto_2260150 ) ) ( AVAILABLE ?auto_2260150 ) ( SURFACE-AT ?auto_2260149 ?auto_2260151 ) ( ON ?auto_2260149 ?auto_2260154 ) ( CLEAR ?auto_2260149 ) ( not ( = ?auto_2260147 ?auto_2260154 ) ) ( not ( = ?auto_2260149 ?auto_2260154 ) ) ( not ( = ?auto_2260148 ?auto_2260154 ) ) ( TRUCK-AT ?auto_2260152 ?auto_2260155 ) ( SURFACE-AT ?auto_2260148 ?auto_2260155 ) ( CLEAR ?auto_2260148 ) ( LIFTING ?auto_2260153 ?auto_2260147 ) ( IS-CRATE ?auto_2260147 ) ( ON ?auto_2260145 ?auto_2260144 ) ( ON ?auto_2260146 ?auto_2260145 ) ( ON ?auto_2260148 ?auto_2260146 ) ( not ( = ?auto_2260144 ?auto_2260145 ) ) ( not ( = ?auto_2260144 ?auto_2260146 ) ) ( not ( = ?auto_2260144 ?auto_2260148 ) ) ( not ( = ?auto_2260144 ?auto_2260147 ) ) ( not ( = ?auto_2260144 ?auto_2260149 ) ) ( not ( = ?auto_2260144 ?auto_2260154 ) ) ( not ( = ?auto_2260145 ?auto_2260146 ) ) ( not ( = ?auto_2260145 ?auto_2260148 ) ) ( not ( = ?auto_2260145 ?auto_2260147 ) ) ( not ( = ?auto_2260145 ?auto_2260149 ) ) ( not ( = ?auto_2260145 ?auto_2260154 ) ) ( not ( = ?auto_2260146 ?auto_2260148 ) ) ( not ( = ?auto_2260146 ?auto_2260147 ) ) ( not ( = ?auto_2260146 ?auto_2260149 ) ) ( not ( = ?auto_2260146 ?auto_2260154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260148 ?auto_2260147 ?auto_2260149 )
      ( MAKE-5CRATE-VERIFY ?auto_2260144 ?auto_2260145 ?auto_2260146 ?auto_2260148 ?auto_2260147 ?auto_2260149 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2260195 - SURFACE
      ?auto_2260196 - SURFACE
      ?auto_2260197 - SURFACE
      ?auto_2260199 - SURFACE
      ?auto_2260198 - SURFACE
      ?auto_2260200 - SURFACE
    )
    :vars
    (
      ?auto_2260204 - HOIST
      ?auto_2260203 - PLACE
      ?auto_2260205 - PLACE
      ?auto_2260201 - HOIST
      ?auto_2260202 - SURFACE
      ?auto_2260206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260204 ?auto_2260203 ) ( IS-CRATE ?auto_2260200 ) ( not ( = ?auto_2260198 ?auto_2260200 ) ) ( not ( = ?auto_2260199 ?auto_2260198 ) ) ( not ( = ?auto_2260199 ?auto_2260200 ) ) ( not ( = ?auto_2260205 ?auto_2260203 ) ) ( HOIST-AT ?auto_2260201 ?auto_2260205 ) ( not ( = ?auto_2260204 ?auto_2260201 ) ) ( AVAILABLE ?auto_2260201 ) ( SURFACE-AT ?auto_2260200 ?auto_2260205 ) ( ON ?auto_2260200 ?auto_2260202 ) ( CLEAR ?auto_2260200 ) ( not ( = ?auto_2260198 ?auto_2260202 ) ) ( not ( = ?auto_2260200 ?auto_2260202 ) ) ( not ( = ?auto_2260199 ?auto_2260202 ) ) ( TRUCK-AT ?auto_2260206 ?auto_2260203 ) ( SURFACE-AT ?auto_2260199 ?auto_2260203 ) ( CLEAR ?auto_2260199 ) ( IS-CRATE ?auto_2260198 ) ( AVAILABLE ?auto_2260204 ) ( IN ?auto_2260198 ?auto_2260206 ) ( ON ?auto_2260196 ?auto_2260195 ) ( ON ?auto_2260197 ?auto_2260196 ) ( ON ?auto_2260199 ?auto_2260197 ) ( not ( = ?auto_2260195 ?auto_2260196 ) ) ( not ( = ?auto_2260195 ?auto_2260197 ) ) ( not ( = ?auto_2260195 ?auto_2260199 ) ) ( not ( = ?auto_2260195 ?auto_2260198 ) ) ( not ( = ?auto_2260195 ?auto_2260200 ) ) ( not ( = ?auto_2260195 ?auto_2260202 ) ) ( not ( = ?auto_2260196 ?auto_2260197 ) ) ( not ( = ?auto_2260196 ?auto_2260199 ) ) ( not ( = ?auto_2260196 ?auto_2260198 ) ) ( not ( = ?auto_2260196 ?auto_2260200 ) ) ( not ( = ?auto_2260196 ?auto_2260202 ) ) ( not ( = ?auto_2260197 ?auto_2260199 ) ) ( not ( = ?auto_2260197 ?auto_2260198 ) ) ( not ( = ?auto_2260197 ?auto_2260200 ) ) ( not ( = ?auto_2260197 ?auto_2260202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260199 ?auto_2260198 ?auto_2260200 )
      ( MAKE-5CRATE-VERIFY ?auto_2260195 ?auto_2260196 ?auto_2260197 ?auto_2260199 ?auto_2260198 ?auto_2260200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260875 - SURFACE
      ?auto_2260876 - SURFACE
    )
    :vars
    (
      ?auto_2260880 - HOIST
      ?auto_2260878 - PLACE
      ?auto_2260882 - SURFACE
      ?auto_2260881 - TRUCK
      ?auto_2260877 - PLACE
      ?auto_2260879 - HOIST
      ?auto_2260883 - SURFACE
      ?auto_2260884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260880 ?auto_2260878 ) ( SURFACE-AT ?auto_2260875 ?auto_2260878 ) ( CLEAR ?auto_2260875 ) ( IS-CRATE ?auto_2260876 ) ( not ( = ?auto_2260875 ?auto_2260876 ) ) ( AVAILABLE ?auto_2260880 ) ( ON ?auto_2260875 ?auto_2260882 ) ( not ( = ?auto_2260882 ?auto_2260875 ) ) ( not ( = ?auto_2260882 ?auto_2260876 ) ) ( TRUCK-AT ?auto_2260881 ?auto_2260877 ) ( not ( = ?auto_2260877 ?auto_2260878 ) ) ( HOIST-AT ?auto_2260879 ?auto_2260877 ) ( not ( = ?auto_2260880 ?auto_2260879 ) ) ( SURFACE-AT ?auto_2260876 ?auto_2260877 ) ( ON ?auto_2260876 ?auto_2260883 ) ( CLEAR ?auto_2260876 ) ( not ( = ?auto_2260875 ?auto_2260883 ) ) ( not ( = ?auto_2260876 ?auto_2260883 ) ) ( not ( = ?auto_2260882 ?auto_2260883 ) ) ( LIFTING ?auto_2260879 ?auto_2260884 ) ( IS-CRATE ?auto_2260884 ) ( not ( = ?auto_2260875 ?auto_2260884 ) ) ( not ( = ?auto_2260876 ?auto_2260884 ) ) ( not ( = ?auto_2260882 ?auto_2260884 ) ) ( not ( = ?auto_2260883 ?auto_2260884 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2260879 ?auto_2260884 ?auto_2260881 ?auto_2260877 )
      ( MAKE-1CRATE ?auto_2260875 ?auto_2260876 )
      ( MAKE-1CRATE-VERIFY ?auto_2260875 ?auto_2260876 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261401 - SURFACE
      ?auto_2261402 - SURFACE
      ?auto_2261403 - SURFACE
      ?auto_2261405 - SURFACE
      ?auto_2261404 - SURFACE
      ?auto_2261406 - SURFACE
      ?auto_2261407 - SURFACE
    )
    :vars
    (
      ?auto_2261408 - HOIST
      ?auto_2261409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261408 ?auto_2261409 ) ( SURFACE-AT ?auto_2261406 ?auto_2261409 ) ( CLEAR ?auto_2261406 ) ( LIFTING ?auto_2261408 ?auto_2261407 ) ( IS-CRATE ?auto_2261407 ) ( not ( = ?auto_2261406 ?auto_2261407 ) ) ( ON ?auto_2261402 ?auto_2261401 ) ( ON ?auto_2261403 ?auto_2261402 ) ( ON ?auto_2261405 ?auto_2261403 ) ( ON ?auto_2261404 ?auto_2261405 ) ( ON ?auto_2261406 ?auto_2261404 ) ( not ( = ?auto_2261401 ?auto_2261402 ) ) ( not ( = ?auto_2261401 ?auto_2261403 ) ) ( not ( = ?auto_2261401 ?auto_2261405 ) ) ( not ( = ?auto_2261401 ?auto_2261404 ) ) ( not ( = ?auto_2261401 ?auto_2261406 ) ) ( not ( = ?auto_2261401 ?auto_2261407 ) ) ( not ( = ?auto_2261402 ?auto_2261403 ) ) ( not ( = ?auto_2261402 ?auto_2261405 ) ) ( not ( = ?auto_2261402 ?auto_2261404 ) ) ( not ( = ?auto_2261402 ?auto_2261406 ) ) ( not ( = ?auto_2261402 ?auto_2261407 ) ) ( not ( = ?auto_2261403 ?auto_2261405 ) ) ( not ( = ?auto_2261403 ?auto_2261404 ) ) ( not ( = ?auto_2261403 ?auto_2261406 ) ) ( not ( = ?auto_2261403 ?auto_2261407 ) ) ( not ( = ?auto_2261405 ?auto_2261404 ) ) ( not ( = ?auto_2261405 ?auto_2261406 ) ) ( not ( = ?auto_2261405 ?auto_2261407 ) ) ( not ( = ?auto_2261404 ?auto_2261406 ) ) ( not ( = ?auto_2261404 ?auto_2261407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2261406 ?auto_2261407 )
      ( MAKE-6CRATE-VERIFY ?auto_2261401 ?auto_2261402 ?auto_2261403 ?auto_2261405 ?auto_2261404 ?auto_2261406 ?auto_2261407 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261445 - SURFACE
      ?auto_2261446 - SURFACE
      ?auto_2261447 - SURFACE
      ?auto_2261449 - SURFACE
      ?auto_2261448 - SURFACE
      ?auto_2261450 - SURFACE
      ?auto_2261451 - SURFACE
    )
    :vars
    (
      ?auto_2261453 - HOIST
      ?auto_2261452 - PLACE
      ?auto_2261454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261453 ?auto_2261452 ) ( SURFACE-AT ?auto_2261450 ?auto_2261452 ) ( CLEAR ?auto_2261450 ) ( IS-CRATE ?auto_2261451 ) ( not ( = ?auto_2261450 ?auto_2261451 ) ) ( TRUCK-AT ?auto_2261454 ?auto_2261452 ) ( AVAILABLE ?auto_2261453 ) ( IN ?auto_2261451 ?auto_2261454 ) ( ON ?auto_2261450 ?auto_2261448 ) ( not ( = ?auto_2261448 ?auto_2261450 ) ) ( not ( = ?auto_2261448 ?auto_2261451 ) ) ( ON ?auto_2261446 ?auto_2261445 ) ( ON ?auto_2261447 ?auto_2261446 ) ( ON ?auto_2261449 ?auto_2261447 ) ( ON ?auto_2261448 ?auto_2261449 ) ( not ( = ?auto_2261445 ?auto_2261446 ) ) ( not ( = ?auto_2261445 ?auto_2261447 ) ) ( not ( = ?auto_2261445 ?auto_2261449 ) ) ( not ( = ?auto_2261445 ?auto_2261448 ) ) ( not ( = ?auto_2261445 ?auto_2261450 ) ) ( not ( = ?auto_2261445 ?auto_2261451 ) ) ( not ( = ?auto_2261446 ?auto_2261447 ) ) ( not ( = ?auto_2261446 ?auto_2261449 ) ) ( not ( = ?auto_2261446 ?auto_2261448 ) ) ( not ( = ?auto_2261446 ?auto_2261450 ) ) ( not ( = ?auto_2261446 ?auto_2261451 ) ) ( not ( = ?auto_2261447 ?auto_2261449 ) ) ( not ( = ?auto_2261447 ?auto_2261448 ) ) ( not ( = ?auto_2261447 ?auto_2261450 ) ) ( not ( = ?auto_2261447 ?auto_2261451 ) ) ( not ( = ?auto_2261449 ?auto_2261448 ) ) ( not ( = ?auto_2261449 ?auto_2261450 ) ) ( not ( = ?auto_2261449 ?auto_2261451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261448 ?auto_2261450 ?auto_2261451 )
      ( MAKE-6CRATE-VERIFY ?auto_2261445 ?auto_2261446 ?auto_2261447 ?auto_2261449 ?auto_2261448 ?auto_2261450 ?auto_2261451 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261496 - SURFACE
      ?auto_2261497 - SURFACE
      ?auto_2261498 - SURFACE
      ?auto_2261500 - SURFACE
      ?auto_2261499 - SURFACE
      ?auto_2261501 - SURFACE
      ?auto_2261502 - SURFACE
    )
    :vars
    (
      ?auto_2261504 - HOIST
      ?auto_2261505 - PLACE
      ?auto_2261503 - TRUCK
      ?auto_2261506 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261504 ?auto_2261505 ) ( SURFACE-AT ?auto_2261501 ?auto_2261505 ) ( CLEAR ?auto_2261501 ) ( IS-CRATE ?auto_2261502 ) ( not ( = ?auto_2261501 ?auto_2261502 ) ) ( AVAILABLE ?auto_2261504 ) ( IN ?auto_2261502 ?auto_2261503 ) ( ON ?auto_2261501 ?auto_2261499 ) ( not ( = ?auto_2261499 ?auto_2261501 ) ) ( not ( = ?auto_2261499 ?auto_2261502 ) ) ( TRUCK-AT ?auto_2261503 ?auto_2261506 ) ( not ( = ?auto_2261506 ?auto_2261505 ) ) ( ON ?auto_2261497 ?auto_2261496 ) ( ON ?auto_2261498 ?auto_2261497 ) ( ON ?auto_2261500 ?auto_2261498 ) ( ON ?auto_2261499 ?auto_2261500 ) ( not ( = ?auto_2261496 ?auto_2261497 ) ) ( not ( = ?auto_2261496 ?auto_2261498 ) ) ( not ( = ?auto_2261496 ?auto_2261500 ) ) ( not ( = ?auto_2261496 ?auto_2261499 ) ) ( not ( = ?auto_2261496 ?auto_2261501 ) ) ( not ( = ?auto_2261496 ?auto_2261502 ) ) ( not ( = ?auto_2261497 ?auto_2261498 ) ) ( not ( = ?auto_2261497 ?auto_2261500 ) ) ( not ( = ?auto_2261497 ?auto_2261499 ) ) ( not ( = ?auto_2261497 ?auto_2261501 ) ) ( not ( = ?auto_2261497 ?auto_2261502 ) ) ( not ( = ?auto_2261498 ?auto_2261500 ) ) ( not ( = ?auto_2261498 ?auto_2261499 ) ) ( not ( = ?auto_2261498 ?auto_2261501 ) ) ( not ( = ?auto_2261498 ?auto_2261502 ) ) ( not ( = ?auto_2261500 ?auto_2261499 ) ) ( not ( = ?auto_2261500 ?auto_2261501 ) ) ( not ( = ?auto_2261500 ?auto_2261502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261499 ?auto_2261501 ?auto_2261502 )
      ( MAKE-6CRATE-VERIFY ?auto_2261496 ?auto_2261497 ?auto_2261498 ?auto_2261500 ?auto_2261499 ?auto_2261501 ?auto_2261502 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261553 - SURFACE
      ?auto_2261554 - SURFACE
      ?auto_2261555 - SURFACE
      ?auto_2261557 - SURFACE
      ?auto_2261556 - SURFACE
      ?auto_2261558 - SURFACE
      ?auto_2261559 - SURFACE
    )
    :vars
    (
      ?auto_2261560 - HOIST
      ?auto_2261564 - PLACE
      ?auto_2261563 - TRUCK
      ?auto_2261561 - PLACE
      ?auto_2261562 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261560 ?auto_2261564 ) ( SURFACE-AT ?auto_2261558 ?auto_2261564 ) ( CLEAR ?auto_2261558 ) ( IS-CRATE ?auto_2261559 ) ( not ( = ?auto_2261558 ?auto_2261559 ) ) ( AVAILABLE ?auto_2261560 ) ( ON ?auto_2261558 ?auto_2261556 ) ( not ( = ?auto_2261556 ?auto_2261558 ) ) ( not ( = ?auto_2261556 ?auto_2261559 ) ) ( TRUCK-AT ?auto_2261563 ?auto_2261561 ) ( not ( = ?auto_2261561 ?auto_2261564 ) ) ( HOIST-AT ?auto_2261562 ?auto_2261561 ) ( LIFTING ?auto_2261562 ?auto_2261559 ) ( not ( = ?auto_2261560 ?auto_2261562 ) ) ( ON ?auto_2261554 ?auto_2261553 ) ( ON ?auto_2261555 ?auto_2261554 ) ( ON ?auto_2261557 ?auto_2261555 ) ( ON ?auto_2261556 ?auto_2261557 ) ( not ( = ?auto_2261553 ?auto_2261554 ) ) ( not ( = ?auto_2261553 ?auto_2261555 ) ) ( not ( = ?auto_2261553 ?auto_2261557 ) ) ( not ( = ?auto_2261553 ?auto_2261556 ) ) ( not ( = ?auto_2261553 ?auto_2261558 ) ) ( not ( = ?auto_2261553 ?auto_2261559 ) ) ( not ( = ?auto_2261554 ?auto_2261555 ) ) ( not ( = ?auto_2261554 ?auto_2261557 ) ) ( not ( = ?auto_2261554 ?auto_2261556 ) ) ( not ( = ?auto_2261554 ?auto_2261558 ) ) ( not ( = ?auto_2261554 ?auto_2261559 ) ) ( not ( = ?auto_2261555 ?auto_2261557 ) ) ( not ( = ?auto_2261555 ?auto_2261556 ) ) ( not ( = ?auto_2261555 ?auto_2261558 ) ) ( not ( = ?auto_2261555 ?auto_2261559 ) ) ( not ( = ?auto_2261557 ?auto_2261556 ) ) ( not ( = ?auto_2261557 ?auto_2261558 ) ) ( not ( = ?auto_2261557 ?auto_2261559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261556 ?auto_2261558 ?auto_2261559 )
      ( MAKE-6CRATE-VERIFY ?auto_2261553 ?auto_2261554 ?auto_2261555 ?auto_2261557 ?auto_2261556 ?auto_2261558 ?auto_2261559 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261616 - SURFACE
      ?auto_2261617 - SURFACE
      ?auto_2261618 - SURFACE
      ?auto_2261620 - SURFACE
      ?auto_2261619 - SURFACE
      ?auto_2261621 - SURFACE
      ?auto_2261622 - SURFACE
    )
    :vars
    (
      ?auto_2261624 - HOIST
      ?auto_2261626 - PLACE
      ?auto_2261627 - TRUCK
      ?auto_2261623 - PLACE
      ?auto_2261625 - HOIST
      ?auto_2261628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261624 ?auto_2261626 ) ( SURFACE-AT ?auto_2261621 ?auto_2261626 ) ( CLEAR ?auto_2261621 ) ( IS-CRATE ?auto_2261622 ) ( not ( = ?auto_2261621 ?auto_2261622 ) ) ( AVAILABLE ?auto_2261624 ) ( ON ?auto_2261621 ?auto_2261619 ) ( not ( = ?auto_2261619 ?auto_2261621 ) ) ( not ( = ?auto_2261619 ?auto_2261622 ) ) ( TRUCK-AT ?auto_2261627 ?auto_2261623 ) ( not ( = ?auto_2261623 ?auto_2261626 ) ) ( HOIST-AT ?auto_2261625 ?auto_2261623 ) ( not ( = ?auto_2261624 ?auto_2261625 ) ) ( AVAILABLE ?auto_2261625 ) ( SURFACE-AT ?auto_2261622 ?auto_2261623 ) ( ON ?auto_2261622 ?auto_2261628 ) ( CLEAR ?auto_2261622 ) ( not ( = ?auto_2261621 ?auto_2261628 ) ) ( not ( = ?auto_2261622 ?auto_2261628 ) ) ( not ( = ?auto_2261619 ?auto_2261628 ) ) ( ON ?auto_2261617 ?auto_2261616 ) ( ON ?auto_2261618 ?auto_2261617 ) ( ON ?auto_2261620 ?auto_2261618 ) ( ON ?auto_2261619 ?auto_2261620 ) ( not ( = ?auto_2261616 ?auto_2261617 ) ) ( not ( = ?auto_2261616 ?auto_2261618 ) ) ( not ( = ?auto_2261616 ?auto_2261620 ) ) ( not ( = ?auto_2261616 ?auto_2261619 ) ) ( not ( = ?auto_2261616 ?auto_2261621 ) ) ( not ( = ?auto_2261616 ?auto_2261622 ) ) ( not ( = ?auto_2261616 ?auto_2261628 ) ) ( not ( = ?auto_2261617 ?auto_2261618 ) ) ( not ( = ?auto_2261617 ?auto_2261620 ) ) ( not ( = ?auto_2261617 ?auto_2261619 ) ) ( not ( = ?auto_2261617 ?auto_2261621 ) ) ( not ( = ?auto_2261617 ?auto_2261622 ) ) ( not ( = ?auto_2261617 ?auto_2261628 ) ) ( not ( = ?auto_2261618 ?auto_2261620 ) ) ( not ( = ?auto_2261618 ?auto_2261619 ) ) ( not ( = ?auto_2261618 ?auto_2261621 ) ) ( not ( = ?auto_2261618 ?auto_2261622 ) ) ( not ( = ?auto_2261618 ?auto_2261628 ) ) ( not ( = ?auto_2261620 ?auto_2261619 ) ) ( not ( = ?auto_2261620 ?auto_2261621 ) ) ( not ( = ?auto_2261620 ?auto_2261622 ) ) ( not ( = ?auto_2261620 ?auto_2261628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261619 ?auto_2261621 ?auto_2261622 )
      ( MAKE-6CRATE-VERIFY ?auto_2261616 ?auto_2261617 ?auto_2261618 ?auto_2261620 ?auto_2261619 ?auto_2261621 ?auto_2261622 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261680 - SURFACE
      ?auto_2261681 - SURFACE
      ?auto_2261682 - SURFACE
      ?auto_2261684 - SURFACE
      ?auto_2261683 - SURFACE
      ?auto_2261685 - SURFACE
      ?auto_2261686 - SURFACE
    )
    :vars
    (
      ?auto_2261691 - HOIST
      ?auto_2261692 - PLACE
      ?auto_2261687 - PLACE
      ?auto_2261689 - HOIST
      ?auto_2261688 - SURFACE
      ?auto_2261690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261691 ?auto_2261692 ) ( SURFACE-AT ?auto_2261685 ?auto_2261692 ) ( CLEAR ?auto_2261685 ) ( IS-CRATE ?auto_2261686 ) ( not ( = ?auto_2261685 ?auto_2261686 ) ) ( AVAILABLE ?auto_2261691 ) ( ON ?auto_2261685 ?auto_2261683 ) ( not ( = ?auto_2261683 ?auto_2261685 ) ) ( not ( = ?auto_2261683 ?auto_2261686 ) ) ( not ( = ?auto_2261687 ?auto_2261692 ) ) ( HOIST-AT ?auto_2261689 ?auto_2261687 ) ( not ( = ?auto_2261691 ?auto_2261689 ) ) ( AVAILABLE ?auto_2261689 ) ( SURFACE-AT ?auto_2261686 ?auto_2261687 ) ( ON ?auto_2261686 ?auto_2261688 ) ( CLEAR ?auto_2261686 ) ( not ( = ?auto_2261685 ?auto_2261688 ) ) ( not ( = ?auto_2261686 ?auto_2261688 ) ) ( not ( = ?auto_2261683 ?auto_2261688 ) ) ( TRUCK-AT ?auto_2261690 ?auto_2261692 ) ( ON ?auto_2261681 ?auto_2261680 ) ( ON ?auto_2261682 ?auto_2261681 ) ( ON ?auto_2261684 ?auto_2261682 ) ( ON ?auto_2261683 ?auto_2261684 ) ( not ( = ?auto_2261680 ?auto_2261681 ) ) ( not ( = ?auto_2261680 ?auto_2261682 ) ) ( not ( = ?auto_2261680 ?auto_2261684 ) ) ( not ( = ?auto_2261680 ?auto_2261683 ) ) ( not ( = ?auto_2261680 ?auto_2261685 ) ) ( not ( = ?auto_2261680 ?auto_2261686 ) ) ( not ( = ?auto_2261680 ?auto_2261688 ) ) ( not ( = ?auto_2261681 ?auto_2261682 ) ) ( not ( = ?auto_2261681 ?auto_2261684 ) ) ( not ( = ?auto_2261681 ?auto_2261683 ) ) ( not ( = ?auto_2261681 ?auto_2261685 ) ) ( not ( = ?auto_2261681 ?auto_2261686 ) ) ( not ( = ?auto_2261681 ?auto_2261688 ) ) ( not ( = ?auto_2261682 ?auto_2261684 ) ) ( not ( = ?auto_2261682 ?auto_2261683 ) ) ( not ( = ?auto_2261682 ?auto_2261685 ) ) ( not ( = ?auto_2261682 ?auto_2261686 ) ) ( not ( = ?auto_2261682 ?auto_2261688 ) ) ( not ( = ?auto_2261684 ?auto_2261683 ) ) ( not ( = ?auto_2261684 ?auto_2261685 ) ) ( not ( = ?auto_2261684 ?auto_2261686 ) ) ( not ( = ?auto_2261684 ?auto_2261688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261683 ?auto_2261685 ?auto_2261686 )
      ( MAKE-6CRATE-VERIFY ?auto_2261680 ?auto_2261681 ?auto_2261682 ?auto_2261684 ?auto_2261683 ?auto_2261685 ?auto_2261686 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261744 - SURFACE
      ?auto_2261745 - SURFACE
      ?auto_2261746 - SURFACE
      ?auto_2261748 - SURFACE
      ?auto_2261747 - SURFACE
      ?auto_2261749 - SURFACE
      ?auto_2261750 - SURFACE
    )
    :vars
    (
      ?auto_2261752 - HOIST
      ?auto_2261756 - PLACE
      ?auto_2261755 - PLACE
      ?auto_2261751 - HOIST
      ?auto_2261754 - SURFACE
      ?auto_2261753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261752 ?auto_2261756 ) ( IS-CRATE ?auto_2261750 ) ( not ( = ?auto_2261749 ?auto_2261750 ) ) ( not ( = ?auto_2261747 ?auto_2261749 ) ) ( not ( = ?auto_2261747 ?auto_2261750 ) ) ( not ( = ?auto_2261755 ?auto_2261756 ) ) ( HOIST-AT ?auto_2261751 ?auto_2261755 ) ( not ( = ?auto_2261752 ?auto_2261751 ) ) ( AVAILABLE ?auto_2261751 ) ( SURFACE-AT ?auto_2261750 ?auto_2261755 ) ( ON ?auto_2261750 ?auto_2261754 ) ( CLEAR ?auto_2261750 ) ( not ( = ?auto_2261749 ?auto_2261754 ) ) ( not ( = ?auto_2261750 ?auto_2261754 ) ) ( not ( = ?auto_2261747 ?auto_2261754 ) ) ( TRUCK-AT ?auto_2261753 ?auto_2261756 ) ( SURFACE-AT ?auto_2261747 ?auto_2261756 ) ( CLEAR ?auto_2261747 ) ( LIFTING ?auto_2261752 ?auto_2261749 ) ( IS-CRATE ?auto_2261749 ) ( ON ?auto_2261745 ?auto_2261744 ) ( ON ?auto_2261746 ?auto_2261745 ) ( ON ?auto_2261748 ?auto_2261746 ) ( ON ?auto_2261747 ?auto_2261748 ) ( not ( = ?auto_2261744 ?auto_2261745 ) ) ( not ( = ?auto_2261744 ?auto_2261746 ) ) ( not ( = ?auto_2261744 ?auto_2261748 ) ) ( not ( = ?auto_2261744 ?auto_2261747 ) ) ( not ( = ?auto_2261744 ?auto_2261749 ) ) ( not ( = ?auto_2261744 ?auto_2261750 ) ) ( not ( = ?auto_2261744 ?auto_2261754 ) ) ( not ( = ?auto_2261745 ?auto_2261746 ) ) ( not ( = ?auto_2261745 ?auto_2261748 ) ) ( not ( = ?auto_2261745 ?auto_2261747 ) ) ( not ( = ?auto_2261745 ?auto_2261749 ) ) ( not ( = ?auto_2261745 ?auto_2261750 ) ) ( not ( = ?auto_2261745 ?auto_2261754 ) ) ( not ( = ?auto_2261746 ?auto_2261748 ) ) ( not ( = ?auto_2261746 ?auto_2261747 ) ) ( not ( = ?auto_2261746 ?auto_2261749 ) ) ( not ( = ?auto_2261746 ?auto_2261750 ) ) ( not ( = ?auto_2261746 ?auto_2261754 ) ) ( not ( = ?auto_2261748 ?auto_2261747 ) ) ( not ( = ?auto_2261748 ?auto_2261749 ) ) ( not ( = ?auto_2261748 ?auto_2261750 ) ) ( not ( = ?auto_2261748 ?auto_2261754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261747 ?auto_2261749 ?auto_2261750 )
      ( MAKE-6CRATE-VERIFY ?auto_2261744 ?auto_2261745 ?auto_2261746 ?auto_2261748 ?auto_2261747 ?auto_2261749 ?auto_2261750 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2261808 - SURFACE
      ?auto_2261809 - SURFACE
      ?auto_2261810 - SURFACE
      ?auto_2261812 - SURFACE
      ?auto_2261811 - SURFACE
      ?auto_2261813 - SURFACE
      ?auto_2261814 - SURFACE
    )
    :vars
    (
      ?auto_2261816 - HOIST
      ?auto_2261819 - PLACE
      ?auto_2261815 - PLACE
      ?auto_2261818 - HOIST
      ?auto_2261817 - SURFACE
      ?auto_2261820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261816 ?auto_2261819 ) ( IS-CRATE ?auto_2261814 ) ( not ( = ?auto_2261813 ?auto_2261814 ) ) ( not ( = ?auto_2261811 ?auto_2261813 ) ) ( not ( = ?auto_2261811 ?auto_2261814 ) ) ( not ( = ?auto_2261815 ?auto_2261819 ) ) ( HOIST-AT ?auto_2261818 ?auto_2261815 ) ( not ( = ?auto_2261816 ?auto_2261818 ) ) ( AVAILABLE ?auto_2261818 ) ( SURFACE-AT ?auto_2261814 ?auto_2261815 ) ( ON ?auto_2261814 ?auto_2261817 ) ( CLEAR ?auto_2261814 ) ( not ( = ?auto_2261813 ?auto_2261817 ) ) ( not ( = ?auto_2261814 ?auto_2261817 ) ) ( not ( = ?auto_2261811 ?auto_2261817 ) ) ( TRUCK-AT ?auto_2261820 ?auto_2261819 ) ( SURFACE-AT ?auto_2261811 ?auto_2261819 ) ( CLEAR ?auto_2261811 ) ( IS-CRATE ?auto_2261813 ) ( AVAILABLE ?auto_2261816 ) ( IN ?auto_2261813 ?auto_2261820 ) ( ON ?auto_2261809 ?auto_2261808 ) ( ON ?auto_2261810 ?auto_2261809 ) ( ON ?auto_2261812 ?auto_2261810 ) ( ON ?auto_2261811 ?auto_2261812 ) ( not ( = ?auto_2261808 ?auto_2261809 ) ) ( not ( = ?auto_2261808 ?auto_2261810 ) ) ( not ( = ?auto_2261808 ?auto_2261812 ) ) ( not ( = ?auto_2261808 ?auto_2261811 ) ) ( not ( = ?auto_2261808 ?auto_2261813 ) ) ( not ( = ?auto_2261808 ?auto_2261814 ) ) ( not ( = ?auto_2261808 ?auto_2261817 ) ) ( not ( = ?auto_2261809 ?auto_2261810 ) ) ( not ( = ?auto_2261809 ?auto_2261812 ) ) ( not ( = ?auto_2261809 ?auto_2261811 ) ) ( not ( = ?auto_2261809 ?auto_2261813 ) ) ( not ( = ?auto_2261809 ?auto_2261814 ) ) ( not ( = ?auto_2261809 ?auto_2261817 ) ) ( not ( = ?auto_2261810 ?auto_2261812 ) ) ( not ( = ?auto_2261810 ?auto_2261811 ) ) ( not ( = ?auto_2261810 ?auto_2261813 ) ) ( not ( = ?auto_2261810 ?auto_2261814 ) ) ( not ( = ?auto_2261810 ?auto_2261817 ) ) ( not ( = ?auto_2261812 ?auto_2261811 ) ) ( not ( = ?auto_2261812 ?auto_2261813 ) ) ( not ( = ?auto_2261812 ?auto_2261814 ) ) ( not ( = ?auto_2261812 ?auto_2261817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261811 ?auto_2261813 ?auto_2261814 )
      ( MAKE-6CRATE-VERIFY ?auto_2261808 ?auto_2261809 ?auto_2261810 ?auto_2261812 ?auto_2261811 ?auto_2261813 ?auto_2261814 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2263082 - SURFACE
      ?auto_2263083 - SURFACE
    )
    :vars
    (
      ?auto_2263084 - HOIST
      ?auto_2263086 - PLACE
      ?auto_2263087 - SURFACE
      ?auto_2263089 - PLACE
      ?auto_2263088 - HOIST
      ?auto_2263090 - SURFACE
      ?auto_2263085 - TRUCK
      ?auto_2263091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263084 ?auto_2263086 ) ( SURFACE-AT ?auto_2263082 ?auto_2263086 ) ( CLEAR ?auto_2263082 ) ( IS-CRATE ?auto_2263083 ) ( not ( = ?auto_2263082 ?auto_2263083 ) ) ( ON ?auto_2263082 ?auto_2263087 ) ( not ( = ?auto_2263087 ?auto_2263082 ) ) ( not ( = ?auto_2263087 ?auto_2263083 ) ) ( not ( = ?auto_2263089 ?auto_2263086 ) ) ( HOIST-AT ?auto_2263088 ?auto_2263089 ) ( not ( = ?auto_2263084 ?auto_2263088 ) ) ( AVAILABLE ?auto_2263088 ) ( SURFACE-AT ?auto_2263083 ?auto_2263089 ) ( ON ?auto_2263083 ?auto_2263090 ) ( CLEAR ?auto_2263083 ) ( not ( = ?auto_2263082 ?auto_2263090 ) ) ( not ( = ?auto_2263083 ?auto_2263090 ) ) ( not ( = ?auto_2263087 ?auto_2263090 ) ) ( TRUCK-AT ?auto_2263085 ?auto_2263086 ) ( LIFTING ?auto_2263084 ?auto_2263091 ) ( IS-CRATE ?auto_2263091 ) ( not ( = ?auto_2263082 ?auto_2263091 ) ) ( not ( = ?auto_2263083 ?auto_2263091 ) ) ( not ( = ?auto_2263087 ?auto_2263091 ) ) ( not ( = ?auto_2263090 ?auto_2263091 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2263084 ?auto_2263091 ?auto_2263085 ?auto_2263086 )
      ( MAKE-1CRATE ?auto_2263082 ?auto_2263083 )
      ( MAKE-1CRATE-VERIFY ?auto_2263082 ?auto_2263083 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2263759 - SURFACE
      ?auto_2263760 - SURFACE
      ?auto_2263761 - SURFACE
      ?auto_2263763 - SURFACE
      ?auto_2263762 - SURFACE
      ?auto_2263764 - SURFACE
      ?auto_2263765 - SURFACE
      ?auto_2263766 - SURFACE
    )
    :vars
    (
      ?auto_2263767 - HOIST
      ?auto_2263768 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263767 ?auto_2263768 ) ( SURFACE-AT ?auto_2263765 ?auto_2263768 ) ( CLEAR ?auto_2263765 ) ( LIFTING ?auto_2263767 ?auto_2263766 ) ( IS-CRATE ?auto_2263766 ) ( not ( = ?auto_2263765 ?auto_2263766 ) ) ( ON ?auto_2263760 ?auto_2263759 ) ( ON ?auto_2263761 ?auto_2263760 ) ( ON ?auto_2263763 ?auto_2263761 ) ( ON ?auto_2263762 ?auto_2263763 ) ( ON ?auto_2263764 ?auto_2263762 ) ( ON ?auto_2263765 ?auto_2263764 ) ( not ( = ?auto_2263759 ?auto_2263760 ) ) ( not ( = ?auto_2263759 ?auto_2263761 ) ) ( not ( = ?auto_2263759 ?auto_2263763 ) ) ( not ( = ?auto_2263759 ?auto_2263762 ) ) ( not ( = ?auto_2263759 ?auto_2263764 ) ) ( not ( = ?auto_2263759 ?auto_2263765 ) ) ( not ( = ?auto_2263759 ?auto_2263766 ) ) ( not ( = ?auto_2263760 ?auto_2263761 ) ) ( not ( = ?auto_2263760 ?auto_2263763 ) ) ( not ( = ?auto_2263760 ?auto_2263762 ) ) ( not ( = ?auto_2263760 ?auto_2263764 ) ) ( not ( = ?auto_2263760 ?auto_2263765 ) ) ( not ( = ?auto_2263760 ?auto_2263766 ) ) ( not ( = ?auto_2263761 ?auto_2263763 ) ) ( not ( = ?auto_2263761 ?auto_2263762 ) ) ( not ( = ?auto_2263761 ?auto_2263764 ) ) ( not ( = ?auto_2263761 ?auto_2263765 ) ) ( not ( = ?auto_2263761 ?auto_2263766 ) ) ( not ( = ?auto_2263763 ?auto_2263762 ) ) ( not ( = ?auto_2263763 ?auto_2263764 ) ) ( not ( = ?auto_2263763 ?auto_2263765 ) ) ( not ( = ?auto_2263763 ?auto_2263766 ) ) ( not ( = ?auto_2263762 ?auto_2263764 ) ) ( not ( = ?auto_2263762 ?auto_2263765 ) ) ( not ( = ?auto_2263762 ?auto_2263766 ) ) ( not ( = ?auto_2263764 ?auto_2263765 ) ) ( not ( = ?auto_2263764 ?auto_2263766 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2263765 ?auto_2263766 )
      ( MAKE-7CRATE-VERIFY ?auto_2263759 ?auto_2263760 ?auto_2263761 ?auto_2263763 ?auto_2263762 ?auto_2263764 ?auto_2263765 ?auto_2263766 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2263814 - SURFACE
      ?auto_2263815 - SURFACE
      ?auto_2263816 - SURFACE
      ?auto_2263818 - SURFACE
      ?auto_2263817 - SURFACE
      ?auto_2263819 - SURFACE
      ?auto_2263820 - SURFACE
      ?auto_2263821 - SURFACE
    )
    :vars
    (
      ?auto_2263822 - HOIST
      ?auto_2263823 - PLACE
      ?auto_2263824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263822 ?auto_2263823 ) ( SURFACE-AT ?auto_2263820 ?auto_2263823 ) ( CLEAR ?auto_2263820 ) ( IS-CRATE ?auto_2263821 ) ( not ( = ?auto_2263820 ?auto_2263821 ) ) ( TRUCK-AT ?auto_2263824 ?auto_2263823 ) ( AVAILABLE ?auto_2263822 ) ( IN ?auto_2263821 ?auto_2263824 ) ( ON ?auto_2263820 ?auto_2263819 ) ( not ( = ?auto_2263819 ?auto_2263820 ) ) ( not ( = ?auto_2263819 ?auto_2263821 ) ) ( ON ?auto_2263815 ?auto_2263814 ) ( ON ?auto_2263816 ?auto_2263815 ) ( ON ?auto_2263818 ?auto_2263816 ) ( ON ?auto_2263817 ?auto_2263818 ) ( ON ?auto_2263819 ?auto_2263817 ) ( not ( = ?auto_2263814 ?auto_2263815 ) ) ( not ( = ?auto_2263814 ?auto_2263816 ) ) ( not ( = ?auto_2263814 ?auto_2263818 ) ) ( not ( = ?auto_2263814 ?auto_2263817 ) ) ( not ( = ?auto_2263814 ?auto_2263819 ) ) ( not ( = ?auto_2263814 ?auto_2263820 ) ) ( not ( = ?auto_2263814 ?auto_2263821 ) ) ( not ( = ?auto_2263815 ?auto_2263816 ) ) ( not ( = ?auto_2263815 ?auto_2263818 ) ) ( not ( = ?auto_2263815 ?auto_2263817 ) ) ( not ( = ?auto_2263815 ?auto_2263819 ) ) ( not ( = ?auto_2263815 ?auto_2263820 ) ) ( not ( = ?auto_2263815 ?auto_2263821 ) ) ( not ( = ?auto_2263816 ?auto_2263818 ) ) ( not ( = ?auto_2263816 ?auto_2263817 ) ) ( not ( = ?auto_2263816 ?auto_2263819 ) ) ( not ( = ?auto_2263816 ?auto_2263820 ) ) ( not ( = ?auto_2263816 ?auto_2263821 ) ) ( not ( = ?auto_2263818 ?auto_2263817 ) ) ( not ( = ?auto_2263818 ?auto_2263819 ) ) ( not ( = ?auto_2263818 ?auto_2263820 ) ) ( not ( = ?auto_2263818 ?auto_2263821 ) ) ( not ( = ?auto_2263817 ?auto_2263819 ) ) ( not ( = ?auto_2263817 ?auto_2263820 ) ) ( not ( = ?auto_2263817 ?auto_2263821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263819 ?auto_2263820 ?auto_2263821 )
      ( MAKE-7CRATE-VERIFY ?auto_2263814 ?auto_2263815 ?auto_2263816 ?auto_2263818 ?auto_2263817 ?auto_2263819 ?auto_2263820 ?auto_2263821 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2263877 - SURFACE
      ?auto_2263878 - SURFACE
      ?auto_2263879 - SURFACE
      ?auto_2263881 - SURFACE
      ?auto_2263880 - SURFACE
      ?auto_2263882 - SURFACE
      ?auto_2263883 - SURFACE
      ?auto_2263884 - SURFACE
    )
    :vars
    (
      ?auto_2263886 - HOIST
      ?auto_2263888 - PLACE
      ?auto_2263885 - TRUCK
      ?auto_2263887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263886 ?auto_2263888 ) ( SURFACE-AT ?auto_2263883 ?auto_2263888 ) ( CLEAR ?auto_2263883 ) ( IS-CRATE ?auto_2263884 ) ( not ( = ?auto_2263883 ?auto_2263884 ) ) ( AVAILABLE ?auto_2263886 ) ( IN ?auto_2263884 ?auto_2263885 ) ( ON ?auto_2263883 ?auto_2263882 ) ( not ( = ?auto_2263882 ?auto_2263883 ) ) ( not ( = ?auto_2263882 ?auto_2263884 ) ) ( TRUCK-AT ?auto_2263885 ?auto_2263887 ) ( not ( = ?auto_2263887 ?auto_2263888 ) ) ( ON ?auto_2263878 ?auto_2263877 ) ( ON ?auto_2263879 ?auto_2263878 ) ( ON ?auto_2263881 ?auto_2263879 ) ( ON ?auto_2263880 ?auto_2263881 ) ( ON ?auto_2263882 ?auto_2263880 ) ( not ( = ?auto_2263877 ?auto_2263878 ) ) ( not ( = ?auto_2263877 ?auto_2263879 ) ) ( not ( = ?auto_2263877 ?auto_2263881 ) ) ( not ( = ?auto_2263877 ?auto_2263880 ) ) ( not ( = ?auto_2263877 ?auto_2263882 ) ) ( not ( = ?auto_2263877 ?auto_2263883 ) ) ( not ( = ?auto_2263877 ?auto_2263884 ) ) ( not ( = ?auto_2263878 ?auto_2263879 ) ) ( not ( = ?auto_2263878 ?auto_2263881 ) ) ( not ( = ?auto_2263878 ?auto_2263880 ) ) ( not ( = ?auto_2263878 ?auto_2263882 ) ) ( not ( = ?auto_2263878 ?auto_2263883 ) ) ( not ( = ?auto_2263878 ?auto_2263884 ) ) ( not ( = ?auto_2263879 ?auto_2263881 ) ) ( not ( = ?auto_2263879 ?auto_2263880 ) ) ( not ( = ?auto_2263879 ?auto_2263882 ) ) ( not ( = ?auto_2263879 ?auto_2263883 ) ) ( not ( = ?auto_2263879 ?auto_2263884 ) ) ( not ( = ?auto_2263881 ?auto_2263880 ) ) ( not ( = ?auto_2263881 ?auto_2263882 ) ) ( not ( = ?auto_2263881 ?auto_2263883 ) ) ( not ( = ?auto_2263881 ?auto_2263884 ) ) ( not ( = ?auto_2263880 ?auto_2263882 ) ) ( not ( = ?auto_2263880 ?auto_2263883 ) ) ( not ( = ?auto_2263880 ?auto_2263884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263882 ?auto_2263883 ?auto_2263884 )
      ( MAKE-7CRATE-VERIFY ?auto_2263877 ?auto_2263878 ?auto_2263879 ?auto_2263881 ?auto_2263880 ?auto_2263882 ?auto_2263883 ?auto_2263884 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2263947 - SURFACE
      ?auto_2263948 - SURFACE
      ?auto_2263949 - SURFACE
      ?auto_2263951 - SURFACE
      ?auto_2263950 - SURFACE
      ?auto_2263952 - SURFACE
      ?auto_2263953 - SURFACE
      ?auto_2263954 - SURFACE
    )
    :vars
    (
      ?auto_2263959 - HOIST
      ?auto_2263956 - PLACE
      ?auto_2263955 - TRUCK
      ?auto_2263958 - PLACE
      ?auto_2263957 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263959 ?auto_2263956 ) ( SURFACE-AT ?auto_2263953 ?auto_2263956 ) ( CLEAR ?auto_2263953 ) ( IS-CRATE ?auto_2263954 ) ( not ( = ?auto_2263953 ?auto_2263954 ) ) ( AVAILABLE ?auto_2263959 ) ( ON ?auto_2263953 ?auto_2263952 ) ( not ( = ?auto_2263952 ?auto_2263953 ) ) ( not ( = ?auto_2263952 ?auto_2263954 ) ) ( TRUCK-AT ?auto_2263955 ?auto_2263958 ) ( not ( = ?auto_2263958 ?auto_2263956 ) ) ( HOIST-AT ?auto_2263957 ?auto_2263958 ) ( LIFTING ?auto_2263957 ?auto_2263954 ) ( not ( = ?auto_2263959 ?auto_2263957 ) ) ( ON ?auto_2263948 ?auto_2263947 ) ( ON ?auto_2263949 ?auto_2263948 ) ( ON ?auto_2263951 ?auto_2263949 ) ( ON ?auto_2263950 ?auto_2263951 ) ( ON ?auto_2263952 ?auto_2263950 ) ( not ( = ?auto_2263947 ?auto_2263948 ) ) ( not ( = ?auto_2263947 ?auto_2263949 ) ) ( not ( = ?auto_2263947 ?auto_2263951 ) ) ( not ( = ?auto_2263947 ?auto_2263950 ) ) ( not ( = ?auto_2263947 ?auto_2263952 ) ) ( not ( = ?auto_2263947 ?auto_2263953 ) ) ( not ( = ?auto_2263947 ?auto_2263954 ) ) ( not ( = ?auto_2263948 ?auto_2263949 ) ) ( not ( = ?auto_2263948 ?auto_2263951 ) ) ( not ( = ?auto_2263948 ?auto_2263950 ) ) ( not ( = ?auto_2263948 ?auto_2263952 ) ) ( not ( = ?auto_2263948 ?auto_2263953 ) ) ( not ( = ?auto_2263948 ?auto_2263954 ) ) ( not ( = ?auto_2263949 ?auto_2263951 ) ) ( not ( = ?auto_2263949 ?auto_2263950 ) ) ( not ( = ?auto_2263949 ?auto_2263952 ) ) ( not ( = ?auto_2263949 ?auto_2263953 ) ) ( not ( = ?auto_2263949 ?auto_2263954 ) ) ( not ( = ?auto_2263951 ?auto_2263950 ) ) ( not ( = ?auto_2263951 ?auto_2263952 ) ) ( not ( = ?auto_2263951 ?auto_2263953 ) ) ( not ( = ?auto_2263951 ?auto_2263954 ) ) ( not ( = ?auto_2263950 ?auto_2263952 ) ) ( not ( = ?auto_2263950 ?auto_2263953 ) ) ( not ( = ?auto_2263950 ?auto_2263954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263952 ?auto_2263953 ?auto_2263954 )
      ( MAKE-7CRATE-VERIFY ?auto_2263947 ?auto_2263948 ?auto_2263949 ?auto_2263951 ?auto_2263950 ?auto_2263952 ?auto_2263953 ?auto_2263954 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2264024 - SURFACE
      ?auto_2264025 - SURFACE
      ?auto_2264026 - SURFACE
      ?auto_2264028 - SURFACE
      ?auto_2264027 - SURFACE
      ?auto_2264029 - SURFACE
      ?auto_2264030 - SURFACE
      ?auto_2264031 - SURFACE
    )
    :vars
    (
      ?auto_2264036 - HOIST
      ?auto_2264037 - PLACE
      ?auto_2264035 - TRUCK
      ?auto_2264034 - PLACE
      ?auto_2264032 - HOIST
      ?auto_2264033 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264036 ?auto_2264037 ) ( SURFACE-AT ?auto_2264030 ?auto_2264037 ) ( CLEAR ?auto_2264030 ) ( IS-CRATE ?auto_2264031 ) ( not ( = ?auto_2264030 ?auto_2264031 ) ) ( AVAILABLE ?auto_2264036 ) ( ON ?auto_2264030 ?auto_2264029 ) ( not ( = ?auto_2264029 ?auto_2264030 ) ) ( not ( = ?auto_2264029 ?auto_2264031 ) ) ( TRUCK-AT ?auto_2264035 ?auto_2264034 ) ( not ( = ?auto_2264034 ?auto_2264037 ) ) ( HOIST-AT ?auto_2264032 ?auto_2264034 ) ( not ( = ?auto_2264036 ?auto_2264032 ) ) ( AVAILABLE ?auto_2264032 ) ( SURFACE-AT ?auto_2264031 ?auto_2264034 ) ( ON ?auto_2264031 ?auto_2264033 ) ( CLEAR ?auto_2264031 ) ( not ( = ?auto_2264030 ?auto_2264033 ) ) ( not ( = ?auto_2264031 ?auto_2264033 ) ) ( not ( = ?auto_2264029 ?auto_2264033 ) ) ( ON ?auto_2264025 ?auto_2264024 ) ( ON ?auto_2264026 ?auto_2264025 ) ( ON ?auto_2264028 ?auto_2264026 ) ( ON ?auto_2264027 ?auto_2264028 ) ( ON ?auto_2264029 ?auto_2264027 ) ( not ( = ?auto_2264024 ?auto_2264025 ) ) ( not ( = ?auto_2264024 ?auto_2264026 ) ) ( not ( = ?auto_2264024 ?auto_2264028 ) ) ( not ( = ?auto_2264024 ?auto_2264027 ) ) ( not ( = ?auto_2264024 ?auto_2264029 ) ) ( not ( = ?auto_2264024 ?auto_2264030 ) ) ( not ( = ?auto_2264024 ?auto_2264031 ) ) ( not ( = ?auto_2264024 ?auto_2264033 ) ) ( not ( = ?auto_2264025 ?auto_2264026 ) ) ( not ( = ?auto_2264025 ?auto_2264028 ) ) ( not ( = ?auto_2264025 ?auto_2264027 ) ) ( not ( = ?auto_2264025 ?auto_2264029 ) ) ( not ( = ?auto_2264025 ?auto_2264030 ) ) ( not ( = ?auto_2264025 ?auto_2264031 ) ) ( not ( = ?auto_2264025 ?auto_2264033 ) ) ( not ( = ?auto_2264026 ?auto_2264028 ) ) ( not ( = ?auto_2264026 ?auto_2264027 ) ) ( not ( = ?auto_2264026 ?auto_2264029 ) ) ( not ( = ?auto_2264026 ?auto_2264030 ) ) ( not ( = ?auto_2264026 ?auto_2264031 ) ) ( not ( = ?auto_2264026 ?auto_2264033 ) ) ( not ( = ?auto_2264028 ?auto_2264027 ) ) ( not ( = ?auto_2264028 ?auto_2264029 ) ) ( not ( = ?auto_2264028 ?auto_2264030 ) ) ( not ( = ?auto_2264028 ?auto_2264031 ) ) ( not ( = ?auto_2264028 ?auto_2264033 ) ) ( not ( = ?auto_2264027 ?auto_2264029 ) ) ( not ( = ?auto_2264027 ?auto_2264030 ) ) ( not ( = ?auto_2264027 ?auto_2264031 ) ) ( not ( = ?auto_2264027 ?auto_2264033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264029 ?auto_2264030 ?auto_2264031 )
      ( MAKE-7CRATE-VERIFY ?auto_2264024 ?auto_2264025 ?auto_2264026 ?auto_2264028 ?auto_2264027 ?auto_2264029 ?auto_2264030 ?auto_2264031 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2264102 - SURFACE
      ?auto_2264103 - SURFACE
      ?auto_2264104 - SURFACE
      ?auto_2264106 - SURFACE
      ?auto_2264105 - SURFACE
      ?auto_2264107 - SURFACE
      ?auto_2264108 - SURFACE
      ?auto_2264109 - SURFACE
    )
    :vars
    (
      ?auto_2264114 - HOIST
      ?auto_2264110 - PLACE
      ?auto_2264112 - PLACE
      ?auto_2264111 - HOIST
      ?auto_2264113 - SURFACE
      ?auto_2264115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264114 ?auto_2264110 ) ( SURFACE-AT ?auto_2264108 ?auto_2264110 ) ( CLEAR ?auto_2264108 ) ( IS-CRATE ?auto_2264109 ) ( not ( = ?auto_2264108 ?auto_2264109 ) ) ( AVAILABLE ?auto_2264114 ) ( ON ?auto_2264108 ?auto_2264107 ) ( not ( = ?auto_2264107 ?auto_2264108 ) ) ( not ( = ?auto_2264107 ?auto_2264109 ) ) ( not ( = ?auto_2264112 ?auto_2264110 ) ) ( HOIST-AT ?auto_2264111 ?auto_2264112 ) ( not ( = ?auto_2264114 ?auto_2264111 ) ) ( AVAILABLE ?auto_2264111 ) ( SURFACE-AT ?auto_2264109 ?auto_2264112 ) ( ON ?auto_2264109 ?auto_2264113 ) ( CLEAR ?auto_2264109 ) ( not ( = ?auto_2264108 ?auto_2264113 ) ) ( not ( = ?auto_2264109 ?auto_2264113 ) ) ( not ( = ?auto_2264107 ?auto_2264113 ) ) ( TRUCK-AT ?auto_2264115 ?auto_2264110 ) ( ON ?auto_2264103 ?auto_2264102 ) ( ON ?auto_2264104 ?auto_2264103 ) ( ON ?auto_2264106 ?auto_2264104 ) ( ON ?auto_2264105 ?auto_2264106 ) ( ON ?auto_2264107 ?auto_2264105 ) ( not ( = ?auto_2264102 ?auto_2264103 ) ) ( not ( = ?auto_2264102 ?auto_2264104 ) ) ( not ( = ?auto_2264102 ?auto_2264106 ) ) ( not ( = ?auto_2264102 ?auto_2264105 ) ) ( not ( = ?auto_2264102 ?auto_2264107 ) ) ( not ( = ?auto_2264102 ?auto_2264108 ) ) ( not ( = ?auto_2264102 ?auto_2264109 ) ) ( not ( = ?auto_2264102 ?auto_2264113 ) ) ( not ( = ?auto_2264103 ?auto_2264104 ) ) ( not ( = ?auto_2264103 ?auto_2264106 ) ) ( not ( = ?auto_2264103 ?auto_2264105 ) ) ( not ( = ?auto_2264103 ?auto_2264107 ) ) ( not ( = ?auto_2264103 ?auto_2264108 ) ) ( not ( = ?auto_2264103 ?auto_2264109 ) ) ( not ( = ?auto_2264103 ?auto_2264113 ) ) ( not ( = ?auto_2264104 ?auto_2264106 ) ) ( not ( = ?auto_2264104 ?auto_2264105 ) ) ( not ( = ?auto_2264104 ?auto_2264107 ) ) ( not ( = ?auto_2264104 ?auto_2264108 ) ) ( not ( = ?auto_2264104 ?auto_2264109 ) ) ( not ( = ?auto_2264104 ?auto_2264113 ) ) ( not ( = ?auto_2264106 ?auto_2264105 ) ) ( not ( = ?auto_2264106 ?auto_2264107 ) ) ( not ( = ?auto_2264106 ?auto_2264108 ) ) ( not ( = ?auto_2264106 ?auto_2264109 ) ) ( not ( = ?auto_2264106 ?auto_2264113 ) ) ( not ( = ?auto_2264105 ?auto_2264107 ) ) ( not ( = ?auto_2264105 ?auto_2264108 ) ) ( not ( = ?auto_2264105 ?auto_2264109 ) ) ( not ( = ?auto_2264105 ?auto_2264113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264107 ?auto_2264108 ?auto_2264109 )
      ( MAKE-7CRATE-VERIFY ?auto_2264102 ?auto_2264103 ?auto_2264104 ?auto_2264106 ?auto_2264105 ?auto_2264107 ?auto_2264108 ?auto_2264109 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2264180 - SURFACE
      ?auto_2264181 - SURFACE
      ?auto_2264182 - SURFACE
      ?auto_2264184 - SURFACE
      ?auto_2264183 - SURFACE
      ?auto_2264185 - SURFACE
      ?auto_2264186 - SURFACE
      ?auto_2264187 - SURFACE
    )
    :vars
    (
      ?auto_2264190 - HOIST
      ?auto_2264188 - PLACE
      ?auto_2264192 - PLACE
      ?auto_2264189 - HOIST
      ?auto_2264193 - SURFACE
      ?auto_2264191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264190 ?auto_2264188 ) ( IS-CRATE ?auto_2264187 ) ( not ( = ?auto_2264186 ?auto_2264187 ) ) ( not ( = ?auto_2264185 ?auto_2264186 ) ) ( not ( = ?auto_2264185 ?auto_2264187 ) ) ( not ( = ?auto_2264192 ?auto_2264188 ) ) ( HOIST-AT ?auto_2264189 ?auto_2264192 ) ( not ( = ?auto_2264190 ?auto_2264189 ) ) ( AVAILABLE ?auto_2264189 ) ( SURFACE-AT ?auto_2264187 ?auto_2264192 ) ( ON ?auto_2264187 ?auto_2264193 ) ( CLEAR ?auto_2264187 ) ( not ( = ?auto_2264186 ?auto_2264193 ) ) ( not ( = ?auto_2264187 ?auto_2264193 ) ) ( not ( = ?auto_2264185 ?auto_2264193 ) ) ( TRUCK-AT ?auto_2264191 ?auto_2264188 ) ( SURFACE-AT ?auto_2264185 ?auto_2264188 ) ( CLEAR ?auto_2264185 ) ( LIFTING ?auto_2264190 ?auto_2264186 ) ( IS-CRATE ?auto_2264186 ) ( ON ?auto_2264181 ?auto_2264180 ) ( ON ?auto_2264182 ?auto_2264181 ) ( ON ?auto_2264184 ?auto_2264182 ) ( ON ?auto_2264183 ?auto_2264184 ) ( ON ?auto_2264185 ?auto_2264183 ) ( not ( = ?auto_2264180 ?auto_2264181 ) ) ( not ( = ?auto_2264180 ?auto_2264182 ) ) ( not ( = ?auto_2264180 ?auto_2264184 ) ) ( not ( = ?auto_2264180 ?auto_2264183 ) ) ( not ( = ?auto_2264180 ?auto_2264185 ) ) ( not ( = ?auto_2264180 ?auto_2264186 ) ) ( not ( = ?auto_2264180 ?auto_2264187 ) ) ( not ( = ?auto_2264180 ?auto_2264193 ) ) ( not ( = ?auto_2264181 ?auto_2264182 ) ) ( not ( = ?auto_2264181 ?auto_2264184 ) ) ( not ( = ?auto_2264181 ?auto_2264183 ) ) ( not ( = ?auto_2264181 ?auto_2264185 ) ) ( not ( = ?auto_2264181 ?auto_2264186 ) ) ( not ( = ?auto_2264181 ?auto_2264187 ) ) ( not ( = ?auto_2264181 ?auto_2264193 ) ) ( not ( = ?auto_2264182 ?auto_2264184 ) ) ( not ( = ?auto_2264182 ?auto_2264183 ) ) ( not ( = ?auto_2264182 ?auto_2264185 ) ) ( not ( = ?auto_2264182 ?auto_2264186 ) ) ( not ( = ?auto_2264182 ?auto_2264187 ) ) ( not ( = ?auto_2264182 ?auto_2264193 ) ) ( not ( = ?auto_2264184 ?auto_2264183 ) ) ( not ( = ?auto_2264184 ?auto_2264185 ) ) ( not ( = ?auto_2264184 ?auto_2264186 ) ) ( not ( = ?auto_2264184 ?auto_2264187 ) ) ( not ( = ?auto_2264184 ?auto_2264193 ) ) ( not ( = ?auto_2264183 ?auto_2264185 ) ) ( not ( = ?auto_2264183 ?auto_2264186 ) ) ( not ( = ?auto_2264183 ?auto_2264187 ) ) ( not ( = ?auto_2264183 ?auto_2264193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264185 ?auto_2264186 ?auto_2264187 )
      ( MAKE-7CRATE-VERIFY ?auto_2264180 ?auto_2264181 ?auto_2264182 ?auto_2264184 ?auto_2264183 ?auto_2264185 ?auto_2264186 ?auto_2264187 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2264258 - SURFACE
      ?auto_2264259 - SURFACE
      ?auto_2264260 - SURFACE
      ?auto_2264262 - SURFACE
      ?auto_2264261 - SURFACE
      ?auto_2264263 - SURFACE
      ?auto_2264264 - SURFACE
      ?auto_2264265 - SURFACE
    )
    :vars
    (
      ?auto_2264269 - HOIST
      ?auto_2264266 - PLACE
      ?auto_2264267 - PLACE
      ?auto_2264270 - HOIST
      ?auto_2264268 - SURFACE
      ?auto_2264271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264269 ?auto_2264266 ) ( IS-CRATE ?auto_2264265 ) ( not ( = ?auto_2264264 ?auto_2264265 ) ) ( not ( = ?auto_2264263 ?auto_2264264 ) ) ( not ( = ?auto_2264263 ?auto_2264265 ) ) ( not ( = ?auto_2264267 ?auto_2264266 ) ) ( HOIST-AT ?auto_2264270 ?auto_2264267 ) ( not ( = ?auto_2264269 ?auto_2264270 ) ) ( AVAILABLE ?auto_2264270 ) ( SURFACE-AT ?auto_2264265 ?auto_2264267 ) ( ON ?auto_2264265 ?auto_2264268 ) ( CLEAR ?auto_2264265 ) ( not ( = ?auto_2264264 ?auto_2264268 ) ) ( not ( = ?auto_2264265 ?auto_2264268 ) ) ( not ( = ?auto_2264263 ?auto_2264268 ) ) ( TRUCK-AT ?auto_2264271 ?auto_2264266 ) ( SURFACE-AT ?auto_2264263 ?auto_2264266 ) ( CLEAR ?auto_2264263 ) ( IS-CRATE ?auto_2264264 ) ( AVAILABLE ?auto_2264269 ) ( IN ?auto_2264264 ?auto_2264271 ) ( ON ?auto_2264259 ?auto_2264258 ) ( ON ?auto_2264260 ?auto_2264259 ) ( ON ?auto_2264262 ?auto_2264260 ) ( ON ?auto_2264261 ?auto_2264262 ) ( ON ?auto_2264263 ?auto_2264261 ) ( not ( = ?auto_2264258 ?auto_2264259 ) ) ( not ( = ?auto_2264258 ?auto_2264260 ) ) ( not ( = ?auto_2264258 ?auto_2264262 ) ) ( not ( = ?auto_2264258 ?auto_2264261 ) ) ( not ( = ?auto_2264258 ?auto_2264263 ) ) ( not ( = ?auto_2264258 ?auto_2264264 ) ) ( not ( = ?auto_2264258 ?auto_2264265 ) ) ( not ( = ?auto_2264258 ?auto_2264268 ) ) ( not ( = ?auto_2264259 ?auto_2264260 ) ) ( not ( = ?auto_2264259 ?auto_2264262 ) ) ( not ( = ?auto_2264259 ?auto_2264261 ) ) ( not ( = ?auto_2264259 ?auto_2264263 ) ) ( not ( = ?auto_2264259 ?auto_2264264 ) ) ( not ( = ?auto_2264259 ?auto_2264265 ) ) ( not ( = ?auto_2264259 ?auto_2264268 ) ) ( not ( = ?auto_2264260 ?auto_2264262 ) ) ( not ( = ?auto_2264260 ?auto_2264261 ) ) ( not ( = ?auto_2264260 ?auto_2264263 ) ) ( not ( = ?auto_2264260 ?auto_2264264 ) ) ( not ( = ?auto_2264260 ?auto_2264265 ) ) ( not ( = ?auto_2264260 ?auto_2264268 ) ) ( not ( = ?auto_2264262 ?auto_2264261 ) ) ( not ( = ?auto_2264262 ?auto_2264263 ) ) ( not ( = ?auto_2264262 ?auto_2264264 ) ) ( not ( = ?auto_2264262 ?auto_2264265 ) ) ( not ( = ?auto_2264262 ?auto_2264268 ) ) ( not ( = ?auto_2264261 ?auto_2264263 ) ) ( not ( = ?auto_2264261 ?auto_2264264 ) ) ( not ( = ?auto_2264261 ?auto_2264265 ) ) ( not ( = ?auto_2264261 ?auto_2264268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264263 ?auto_2264264 ?auto_2264265 )
      ( MAKE-7CRATE-VERIFY ?auto_2264258 ?auto_2264259 ?auto_2264260 ?auto_2264262 ?auto_2264261 ?auto_2264263 ?auto_2264264 ?auto_2264265 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267177 - SURFACE
      ?auto_2267178 - SURFACE
      ?auto_2267179 - SURFACE
      ?auto_2267181 - SURFACE
      ?auto_2267180 - SURFACE
      ?auto_2267182 - SURFACE
      ?auto_2267183 - SURFACE
      ?auto_2267184 - SURFACE
      ?auto_2267185 - SURFACE
    )
    :vars
    (
      ?auto_2267187 - HOIST
      ?auto_2267186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267187 ?auto_2267186 ) ( SURFACE-AT ?auto_2267184 ?auto_2267186 ) ( CLEAR ?auto_2267184 ) ( LIFTING ?auto_2267187 ?auto_2267185 ) ( IS-CRATE ?auto_2267185 ) ( not ( = ?auto_2267184 ?auto_2267185 ) ) ( ON ?auto_2267178 ?auto_2267177 ) ( ON ?auto_2267179 ?auto_2267178 ) ( ON ?auto_2267181 ?auto_2267179 ) ( ON ?auto_2267180 ?auto_2267181 ) ( ON ?auto_2267182 ?auto_2267180 ) ( ON ?auto_2267183 ?auto_2267182 ) ( ON ?auto_2267184 ?auto_2267183 ) ( not ( = ?auto_2267177 ?auto_2267178 ) ) ( not ( = ?auto_2267177 ?auto_2267179 ) ) ( not ( = ?auto_2267177 ?auto_2267181 ) ) ( not ( = ?auto_2267177 ?auto_2267180 ) ) ( not ( = ?auto_2267177 ?auto_2267182 ) ) ( not ( = ?auto_2267177 ?auto_2267183 ) ) ( not ( = ?auto_2267177 ?auto_2267184 ) ) ( not ( = ?auto_2267177 ?auto_2267185 ) ) ( not ( = ?auto_2267178 ?auto_2267179 ) ) ( not ( = ?auto_2267178 ?auto_2267181 ) ) ( not ( = ?auto_2267178 ?auto_2267180 ) ) ( not ( = ?auto_2267178 ?auto_2267182 ) ) ( not ( = ?auto_2267178 ?auto_2267183 ) ) ( not ( = ?auto_2267178 ?auto_2267184 ) ) ( not ( = ?auto_2267178 ?auto_2267185 ) ) ( not ( = ?auto_2267179 ?auto_2267181 ) ) ( not ( = ?auto_2267179 ?auto_2267180 ) ) ( not ( = ?auto_2267179 ?auto_2267182 ) ) ( not ( = ?auto_2267179 ?auto_2267183 ) ) ( not ( = ?auto_2267179 ?auto_2267184 ) ) ( not ( = ?auto_2267179 ?auto_2267185 ) ) ( not ( = ?auto_2267181 ?auto_2267180 ) ) ( not ( = ?auto_2267181 ?auto_2267182 ) ) ( not ( = ?auto_2267181 ?auto_2267183 ) ) ( not ( = ?auto_2267181 ?auto_2267184 ) ) ( not ( = ?auto_2267181 ?auto_2267185 ) ) ( not ( = ?auto_2267180 ?auto_2267182 ) ) ( not ( = ?auto_2267180 ?auto_2267183 ) ) ( not ( = ?auto_2267180 ?auto_2267184 ) ) ( not ( = ?auto_2267180 ?auto_2267185 ) ) ( not ( = ?auto_2267182 ?auto_2267183 ) ) ( not ( = ?auto_2267182 ?auto_2267184 ) ) ( not ( = ?auto_2267182 ?auto_2267185 ) ) ( not ( = ?auto_2267183 ?auto_2267184 ) ) ( not ( = ?auto_2267183 ?auto_2267185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2267184 ?auto_2267185 )
      ( MAKE-8CRATE-VERIFY ?auto_2267177 ?auto_2267178 ?auto_2267179 ?auto_2267181 ?auto_2267180 ?auto_2267182 ?auto_2267183 ?auto_2267184 ?auto_2267185 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267244 - SURFACE
      ?auto_2267245 - SURFACE
      ?auto_2267246 - SURFACE
      ?auto_2267248 - SURFACE
      ?auto_2267247 - SURFACE
      ?auto_2267249 - SURFACE
      ?auto_2267250 - SURFACE
      ?auto_2267251 - SURFACE
      ?auto_2267252 - SURFACE
    )
    :vars
    (
      ?auto_2267253 - HOIST
      ?auto_2267254 - PLACE
      ?auto_2267255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267253 ?auto_2267254 ) ( SURFACE-AT ?auto_2267251 ?auto_2267254 ) ( CLEAR ?auto_2267251 ) ( IS-CRATE ?auto_2267252 ) ( not ( = ?auto_2267251 ?auto_2267252 ) ) ( TRUCK-AT ?auto_2267255 ?auto_2267254 ) ( AVAILABLE ?auto_2267253 ) ( IN ?auto_2267252 ?auto_2267255 ) ( ON ?auto_2267251 ?auto_2267250 ) ( not ( = ?auto_2267250 ?auto_2267251 ) ) ( not ( = ?auto_2267250 ?auto_2267252 ) ) ( ON ?auto_2267245 ?auto_2267244 ) ( ON ?auto_2267246 ?auto_2267245 ) ( ON ?auto_2267248 ?auto_2267246 ) ( ON ?auto_2267247 ?auto_2267248 ) ( ON ?auto_2267249 ?auto_2267247 ) ( ON ?auto_2267250 ?auto_2267249 ) ( not ( = ?auto_2267244 ?auto_2267245 ) ) ( not ( = ?auto_2267244 ?auto_2267246 ) ) ( not ( = ?auto_2267244 ?auto_2267248 ) ) ( not ( = ?auto_2267244 ?auto_2267247 ) ) ( not ( = ?auto_2267244 ?auto_2267249 ) ) ( not ( = ?auto_2267244 ?auto_2267250 ) ) ( not ( = ?auto_2267244 ?auto_2267251 ) ) ( not ( = ?auto_2267244 ?auto_2267252 ) ) ( not ( = ?auto_2267245 ?auto_2267246 ) ) ( not ( = ?auto_2267245 ?auto_2267248 ) ) ( not ( = ?auto_2267245 ?auto_2267247 ) ) ( not ( = ?auto_2267245 ?auto_2267249 ) ) ( not ( = ?auto_2267245 ?auto_2267250 ) ) ( not ( = ?auto_2267245 ?auto_2267251 ) ) ( not ( = ?auto_2267245 ?auto_2267252 ) ) ( not ( = ?auto_2267246 ?auto_2267248 ) ) ( not ( = ?auto_2267246 ?auto_2267247 ) ) ( not ( = ?auto_2267246 ?auto_2267249 ) ) ( not ( = ?auto_2267246 ?auto_2267250 ) ) ( not ( = ?auto_2267246 ?auto_2267251 ) ) ( not ( = ?auto_2267246 ?auto_2267252 ) ) ( not ( = ?auto_2267248 ?auto_2267247 ) ) ( not ( = ?auto_2267248 ?auto_2267249 ) ) ( not ( = ?auto_2267248 ?auto_2267250 ) ) ( not ( = ?auto_2267248 ?auto_2267251 ) ) ( not ( = ?auto_2267248 ?auto_2267252 ) ) ( not ( = ?auto_2267247 ?auto_2267249 ) ) ( not ( = ?auto_2267247 ?auto_2267250 ) ) ( not ( = ?auto_2267247 ?auto_2267251 ) ) ( not ( = ?auto_2267247 ?auto_2267252 ) ) ( not ( = ?auto_2267249 ?auto_2267250 ) ) ( not ( = ?auto_2267249 ?auto_2267251 ) ) ( not ( = ?auto_2267249 ?auto_2267252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2267250 ?auto_2267251 ?auto_2267252 )
      ( MAKE-8CRATE-VERIFY ?auto_2267244 ?auto_2267245 ?auto_2267246 ?auto_2267248 ?auto_2267247 ?auto_2267249 ?auto_2267250 ?auto_2267251 ?auto_2267252 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267320 - SURFACE
      ?auto_2267321 - SURFACE
      ?auto_2267322 - SURFACE
      ?auto_2267324 - SURFACE
      ?auto_2267323 - SURFACE
      ?auto_2267325 - SURFACE
      ?auto_2267326 - SURFACE
      ?auto_2267327 - SURFACE
      ?auto_2267328 - SURFACE
    )
    :vars
    (
      ?auto_2267332 - HOIST
      ?auto_2267330 - PLACE
      ?auto_2267329 - TRUCK
      ?auto_2267331 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267332 ?auto_2267330 ) ( SURFACE-AT ?auto_2267327 ?auto_2267330 ) ( CLEAR ?auto_2267327 ) ( IS-CRATE ?auto_2267328 ) ( not ( = ?auto_2267327 ?auto_2267328 ) ) ( AVAILABLE ?auto_2267332 ) ( IN ?auto_2267328 ?auto_2267329 ) ( ON ?auto_2267327 ?auto_2267326 ) ( not ( = ?auto_2267326 ?auto_2267327 ) ) ( not ( = ?auto_2267326 ?auto_2267328 ) ) ( TRUCK-AT ?auto_2267329 ?auto_2267331 ) ( not ( = ?auto_2267331 ?auto_2267330 ) ) ( ON ?auto_2267321 ?auto_2267320 ) ( ON ?auto_2267322 ?auto_2267321 ) ( ON ?auto_2267324 ?auto_2267322 ) ( ON ?auto_2267323 ?auto_2267324 ) ( ON ?auto_2267325 ?auto_2267323 ) ( ON ?auto_2267326 ?auto_2267325 ) ( not ( = ?auto_2267320 ?auto_2267321 ) ) ( not ( = ?auto_2267320 ?auto_2267322 ) ) ( not ( = ?auto_2267320 ?auto_2267324 ) ) ( not ( = ?auto_2267320 ?auto_2267323 ) ) ( not ( = ?auto_2267320 ?auto_2267325 ) ) ( not ( = ?auto_2267320 ?auto_2267326 ) ) ( not ( = ?auto_2267320 ?auto_2267327 ) ) ( not ( = ?auto_2267320 ?auto_2267328 ) ) ( not ( = ?auto_2267321 ?auto_2267322 ) ) ( not ( = ?auto_2267321 ?auto_2267324 ) ) ( not ( = ?auto_2267321 ?auto_2267323 ) ) ( not ( = ?auto_2267321 ?auto_2267325 ) ) ( not ( = ?auto_2267321 ?auto_2267326 ) ) ( not ( = ?auto_2267321 ?auto_2267327 ) ) ( not ( = ?auto_2267321 ?auto_2267328 ) ) ( not ( = ?auto_2267322 ?auto_2267324 ) ) ( not ( = ?auto_2267322 ?auto_2267323 ) ) ( not ( = ?auto_2267322 ?auto_2267325 ) ) ( not ( = ?auto_2267322 ?auto_2267326 ) ) ( not ( = ?auto_2267322 ?auto_2267327 ) ) ( not ( = ?auto_2267322 ?auto_2267328 ) ) ( not ( = ?auto_2267324 ?auto_2267323 ) ) ( not ( = ?auto_2267324 ?auto_2267325 ) ) ( not ( = ?auto_2267324 ?auto_2267326 ) ) ( not ( = ?auto_2267324 ?auto_2267327 ) ) ( not ( = ?auto_2267324 ?auto_2267328 ) ) ( not ( = ?auto_2267323 ?auto_2267325 ) ) ( not ( = ?auto_2267323 ?auto_2267326 ) ) ( not ( = ?auto_2267323 ?auto_2267327 ) ) ( not ( = ?auto_2267323 ?auto_2267328 ) ) ( not ( = ?auto_2267325 ?auto_2267326 ) ) ( not ( = ?auto_2267325 ?auto_2267327 ) ) ( not ( = ?auto_2267325 ?auto_2267328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2267326 ?auto_2267327 ?auto_2267328 )
      ( MAKE-8CRATE-VERIFY ?auto_2267320 ?auto_2267321 ?auto_2267322 ?auto_2267324 ?auto_2267323 ?auto_2267325 ?auto_2267326 ?auto_2267327 ?auto_2267328 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267404 - SURFACE
      ?auto_2267405 - SURFACE
      ?auto_2267406 - SURFACE
      ?auto_2267408 - SURFACE
      ?auto_2267407 - SURFACE
      ?auto_2267409 - SURFACE
      ?auto_2267410 - SURFACE
      ?auto_2267411 - SURFACE
      ?auto_2267412 - SURFACE
    )
    :vars
    (
      ?auto_2267417 - HOIST
      ?auto_2267415 - PLACE
      ?auto_2267416 - TRUCK
      ?auto_2267414 - PLACE
      ?auto_2267413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267417 ?auto_2267415 ) ( SURFACE-AT ?auto_2267411 ?auto_2267415 ) ( CLEAR ?auto_2267411 ) ( IS-CRATE ?auto_2267412 ) ( not ( = ?auto_2267411 ?auto_2267412 ) ) ( AVAILABLE ?auto_2267417 ) ( ON ?auto_2267411 ?auto_2267410 ) ( not ( = ?auto_2267410 ?auto_2267411 ) ) ( not ( = ?auto_2267410 ?auto_2267412 ) ) ( TRUCK-AT ?auto_2267416 ?auto_2267414 ) ( not ( = ?auto_2267414 ?auto_2267415 ) ) ( HOIST-AT ?auto_2267413 ?auto_2267414 ) ( LIFTING ?auto_2267413 ?auto_2267412 ) ( not ( = ?auto_2267417 ?auto_2267413 ) ) ( ON ?auto_2267405 ?auto_2267404 ) ( ON ?auto_2267406 ?auto_2267405 ) ( ON ?auto_2267408 ?auto_2267406 ) ( ON ?auto_2267407 ?auto_2267408 ) ( ON ?auto_2267409 ?auto_2267407 ) ( ON ?auto_2267410 ?auto_2267409 ) ( not ( = ?auto_2267404 ?auto_2267405 ) ) ( not ( = ?auto_2267404 ?auto_2267406 ) ) ( not ( = ?auto_2267404 ?auto_2267408 ) ) ( not ( = ?auto_2267404 ?auto_2267407 ) ) ( not ( = ?auto_2267404 ?auto_2267409 ) ) ( not ( = ?auto_2267404 ?auto_2267410 ) ) ( not ( = ?auto_2267404 ?auto_2267411 ) ) ( not ( = ?auto_2267404 ?auto_2267412 ) ) ( not ( = ?auto_2267405 ?auto_2267406 ) ) ( not ( = ?auto_2267405 ?auto_2267408 ) ) ( not ( = ?auto_2267405 ?auto_2267407 ) ) ( not ( = ?auto_2267405 ?auto_2267409 ) ) ( not ( = ?auto_2267405 ?auto_2267410 ) ) ( not ( = ?auto_2267405 ?auto_2267411 ) ) ( not ( = ?auto_2267405 ?auto_2267412 ) ) ( not ( = ?auto_2267406 ?auto_2267408 ) ) ( not ( = ?auto_2267406 ?auto_2267407 ) ) ( not ( = ?auto_2267406 ?auto_2267409 ) ) ( not ( = ?auto_2267406 ?auto_2267410 ) ) ( not ( = ?auto_2267406 ?auto_2267411 ) ) ( not ( = ?auto_2267406 ?auto_2267412 ) ) ( not ( = ?auto_2267408 ?auto_2267407 ) ) ( not ( = ?auto_2267408 ?auto_2267409 ) ) ( not ( = ?auto_2267408 ?auto_2267410 ) ) ( not ( = ?auto_2267408 ?auto_2267411 ) ) ( not ( = ?auto_2267408 ?auto_2267412 ) ) ( not ( = ?auto_2267407 ?auto_2267409 ) ) ( not ( = ?auto_2267407 ?auto_2267410 ) ) ( not ( = ?auto_2267407 ?auto_2267411 ) ) ( not ( = ?auto_2267407 ?auto_2267412 ) ) ( not ( = ?auto_2267409 ?auto_2267410 ) ) ( not ( = ?auto_2267409 ?auto_2267411 ) ) ( not ( = ?auto_2267409 ?auto_2267412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2267410 ?auto_2267411 ?auto_2267412 )
      ( MAKE-8CRATE-VERIFY ?auto_2267404 ?auto_2267405 ?auto_2267406 ?auto_2267408 ?auto_2267407 ?auto_2267409 ?auto_2267410 ?auto_2267411 ?auto_2267412 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267496 - SURFACE
      ?auto_2267497 - SURFACE
      ?auto_2267498 - SURFACE
      ?auto_2267500 - SURFACE
      ?auto_2267499 - SURFACE
      ?auto_2267501 - SURFACE
      ?auto_2267502 - SURFACE
      ?auto_2267503 - SURFACE
      ?auto_2267504 - SURFACE
    )
    :vars
    (
      ?auto_2267505 - HOIST
      ?auto_2267509 - PLACE
      ?auto_2267507 - TRUCK
      ?auto_2267508 - PLACE
      ?auto_2267506 - HOIST
      ?auto_2267510 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267505 ?auto_2267509 ) ( SURFACE-AT ?auto_2267503 ?auto_2267509 ) ( CLEAR ?auto_2267503 ) ( IS-CRATE ?auto_2267504 ) ( not ( = ?auto_2267503 ?auto_2267504 ) ) ( AVAILABLE ?auto_2267505 ) ( ON ?auto_2267503 ?auto_2267502 ) ( not ( = ?auto_2267502 ?auto_2267503 ) ) ( not ( = ?auto_2267502 ?auto_2267504 ) ) ( TRUCK-AT ?auto_2267507 ?auto_2267508 ) ( not ( = ?auto_2267508 ?auto_2267509 ) ) ( HOIST-AT ?auto_2267506 ?auto_2267508 ) ( not ( = ?auto_2267505 ?auto_2267506 ) ) ( AVAILABLE ?auto_2267506 ) ( SURFACE-AT ?auto_2267504 ?auto_2267508 ) ( ON ?auto_2267504 ?auto_2267510 ) ( CLEAR ?auto_2267504 ) ( not ( = ?auto_2267503 ?auto_2267510 ) ) ( not ( = ?auto_2267504 ?auto_2267510 ) ) ( not ( = ?auto_2267502 ?auto_2267510 ) ) ( ON ?auto_2267497 ?auto_2267496 ) ( ON ?auto_2267498 ?auto_2267497 ) ( ON ?auto_2267500 ?auto_2267498 ) ( ON ?auto_2267499 ?auto_2267500 ) ( ON ?auto_2267501 ?auto_2267499 ) ( ON ?auto_2267502 ?auto_2267501 ) ( not ( = ?auto_2267496 ?auto_2267497 ) ) ( not ( = ?auto_2267496 ?auto_2267498 ) ) ( not ( = ?auto_2267496 ?auto_2267500 ) ) ( not ( = ?auto_2267496 ?auto_2267499 ) ) ( not ( = ?auto_2267496 ?auto_2267501 ) ) ( not ( = ?auto_2267496 ?auto_2267502 ) ) ( not ( = ?auto_2267496 ?auto_2267503 ) ) ( not ( = ?auto_2267496 ?auto_2267504 ) ) ( not ( = ?auto_2267496 ?auto_2267510 ) ) ( not ( = ?auto_2267497 ?auto_2267498 ) ) ( not ( = ?auto_2267497 ?auto_2267500 ) ) ( not ( = ?auto_2267497 ?auto_2267499 ) ) ( not ( = ?auto_2267497 ?auto_2267501 ) ) ( not ( = ?auto_2267497 ?auto_2267502 ) ) ( not ( = ?auto_2267497 ?auto_2267503 ) ) ( not ( = ?auto_2267497 ?auto_2267504 ) ) ( not ( = ?auto_2267497 ?auto_2267510 ) ) ( not ( = ?auto_2267498 ?auto_2267500 ) ) ( not ( = ?auto_2267498 ?auto_2267499 ) ) ( not ( = ?auto_2267498 ?auto_2267501 ) ) ( not ( = ?auto_2267498 ?auto_2267502 ) ) ( not ( = ?auto_2267498 ?auto_2267503 ) ) ( not ( = ?auto_2267498 ?auto_2267504 ) ) ( not ( = ?auto_2267498 ?auto_2267510 ) ) ( not ( = ?auto_2267500 ?auto_2267499 ) ) ( not ( = ?auto_2267500 ?auto_2267501 ) ) ( not ( = ?auto_2267500 ?auto_2267502 ) ) ( not ( = ?auto_2267500 ?auto_2267503 ) ) ( not ( = ?auto_2267500 ?auto_2267504 ) ) ( not ( = ?auto_2267500 ?auto_2267510 ) ) ( not ( = ?auto_2267499 ?auto_2267501 ) ) ( not ( = ?auto_2267499 ?auto_2267502 ) ) ( not ( = ?auto_2267499 ?auto_2267503 ) ) ( not ( = ?auto_2267499 ?auto_2267504 ) ) ( not ( = ?auto_2267499 ?auto_2267510 ) ) ( not ( = ?auto_2267501 ?auto_2267502 ) ) ( not ( = ?auto_2267501 ?auto_2267503 ) ) ( not ( = ?auto_2267501 ?auto_2267504 ) ) ( not ( = ?auto_2267501 ?auto_2267510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2267502 ?auto_2267503 ?auto_2267504 )
      ( MAKE-8CRATE-VERIFY ?auto_2267496 ?auto_2267497 ?auto_2267498 ?auto_2267500 ?auto_2267499 ?auto_2267501 ?auto_2267502 ?auto_2267503 ?auto_2267504 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267589 - SURFACE
      ?auto_2267590 - SURFACE
      ?auto_2267591 - SURFACE
      ?auto_2267593 - SURFACE
      ?auto_2267592 - SURFACE
      ?auto_2267594 - SURFACE
      ?auto_2267595 - SURFACE
      ?auto_2267596 - SURFACE
      ?auto_2267597 - SURFACE
    )
    :vars
    (
      ?auto_2267598 - HOIST
      ?auto_2267599 - PLACE
      ?auto_2267601 - PLACE
      ?auto_2267600 - HOIST
      ?auto_2267602 - SURFACE
      ?auto_2267603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267598 ?auto_2267599 ) ( SURFACE-AT ?auto_2267596 ?auto_2267599 ) ( CLEAR ?auto_2267596 ) ( IS-CRATE ?auto_2267597 ) ( not ( = ?auto_2267596 ?auto_2267597 ) ) ( AVAILABLE ?auto_2267598 ) ( ON ?auto_2267596 ?auto_2267595 ) ( not ( = ?auto_2267595 ?auto_2267596 ) ) ( not ( = ?auto_2267595 ?auto_2267597 ) ) ( not ( = ?auto_2267601 ?auto_2267599 ) ) ( HOIST-AT ?auto_2267600 ?auto_2267601 ) ( not ( = ?auto_2267598 ?auto_2267600 ) ) ( AVAILABLE ?auto_2267600 ) ( SURFACE-AT ?auto_2267597 ?auto_2267601 ) ( ON ?auto_2267597 ?auto_2267602 ) ( CLEAR ?auto_2267597 ) ( not ( = ?auto_2267596 ?auto_2267602 ) ) ( not ( = ?auto_2267597 ?auto_2267602 ) ) ( not ( = ?auto_2267595 ?auto_2267602 ) ) ( TRUCK-AT ?auto_2267603 ?auto_2267599 ) ( ON ?auto_2267590 ?auto_2267589 ) ( ON ?auto_2267591 ?auto_2267590 ) ( ON ?auto_2267593 ?auto_2267591 ) ( ON ?auto_2267592 ?auto_2267593 ) ( ON ?auto_2267594 ?auto_2267592 ) ( ON ?auto_2267595 ?auto_2267594 ) ( not ( = ?auto_2267589 ?auto_2267590 ) ) ( not ( = ?auto_2267589 ?auto_2267591 ) ) ( not ( = ?auto_2267589 ?auto_2267593 ) ) ( not ( = ?auto_2267589 ?auto_2267592 ) ) ( not ( = ?auto_2267589 ?auto_2267594 ) ) ( not ( = ?auto_2267589 ?auto_2267595 ) ) ( not ( = ?auto_2267589 ?auto_2267596 ) ) ( not ( = ?auto_2267589 ?auto_2267597 ) ) ( not ( = ?auto_2267589 ?auto_2267602 ) ) ( not ( = ?auto_2267590 ?auto_2267591 ) ) ( not ( = ?auto_2267590 ?auto_2267593 ) ) ( not ( = ?auto_2267590 ?auto_2267592 ) ) ( not ( = ?auto_2267590 ?auto_2267594 ) ) ( not ( = ?auto_2267590 ?auto_2267595 ) ) ( not ( = ?auto_2267590 ?auto_2267596 ) ) ( not ( = ?auto_2267590 ?auto_2267597 ) ) ( not ( = ?auto_2267590 ?auto_2267602 ) ) ( not ( = ?auto_2267591 ?auto_2267593 ) ) ( not ( = ?auto_2267591 ?auto_2267592 ) ) ( not ( = ?auto_2267591 ?auto_2267594 ) ) ( not ( = ?auto_2267591 ?auto_2267595 ) ) ( not ( = ?auto_2267591 ?auto_2267596 ) ) ( not ( = ?auto_2267591 ?auto_2267597 ) ) ( not ( = ?auto_2267591 ?auto_2267602 ) ) ( not ( = ?auto_2267593 ?auto_2267592 ) ) ( not ( = ?auto_2267593 ?auto_2267594 ) ) ( not ( = ?auto_2267593 ?auto_2267595 ) ) ( not ( = ?auto_2267593 ?auto_2267596 ) ) ( not ( = ?auto_2267593 ?auto_2267597 ) ) ( not ( = ?auto_2267593 ?auto_2267602 ) ) ( not ( = ?auto_2267592 ?auto_2267594 ) ) ( not ( = ?auto_2267592 ?auto_2267595 ) ) ( not ( = ?auto_2267592 ?auto_2267596 ) ) ( not ( = ?auto_2267592 ?auto_2267597 ) ) ( not ( = ?auto_2267592 ?auto_2267602 ) ) ( not ( = ?auto_2267594 ?auto_2267595 ) ) ( not ( = ?auto_2267594 ?auto_2267596 ) ) ( not ( = ?auto_2267594 ?auto_2267597 ) ) ( not ( = ?auto_2267594 ?auto_2267602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2267595 ?auto_2267596 ?auto_2267597 )
      ( MAKE-8CRATE-VERIFY ?auto_2267589 ?auto_2267590 ?auto_2267591 ?auto_2267593 ?auto_2267592 ?auto_2267594 ?auto_2267595 ?auto_2267596 ?auto_2267597 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267682 - SURFACE
      ?auto_2267683 - SURFACE
      ?auto_2267684 - SURFACE
      ?auto_2267686 - SURFACE
      ?auto_2267685 - SURFACE
      ?auto_2267687 - SURFACE
      ?auto_2267688 - SURFACE
      ?auto_2267689 - SURFACE
      ?auto_2267690 - SURFACE
    )
    :vars
    (
      ?auto_2267693 - HOIST
      ?auto_2267695 - PLACE
      ?auto_2267691 - PLACE
      ?auto_2267692 - HOIST
      ?auto_2267696 - SURFACE
      ?auto_2267694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267693 ?auto_2267695 ) ( IS-CRATE ?auto_2267690 ) ( not ( = ?auto_2267689 ?auto_2267690 ) ) ( not ( = ?auto_2267688 ?auto_2267689 ) ) ( not ( = ?auto_2267688 ?auto_2267690 ) ) ( not ( = ?auto_2267691 ?auto_2267695 ) ) ( HOIST-AT ?auto_2267692 ?auto_2267691 ) ( not ( = ?auto_2267693 ?auto_2267692 ) ) ( AVAILABLE ?auto_2267692 ) ( SURFACE-AT ?auto_2267690 ?auto_2267691 ) ( ON ?auto_2267690 ?auto_2267696 ) ( CLEAR ?auto_2267690 ) ( not ( = ?auto_2267689 ?auto_2267696 ) ) ( not ( = ?auto_2267690 ?auto_2267696 ) ) ( not ( = ?auto_2267688 ?auto_2267696 ) ) ( TRUCK-AT ?auto_2267694 ?auto_2267695 ) ( SURFACE-AT ?auto_2267688 ?auto_2267695 ) ( CLEAR ?auto_2267688 ) ( LIFTING ?auto_2267693 ?auto_2267689 ) ( IS-CRATE ?auto_2267689 ) ( ON ?auto_2267683 ?auto_2267682 ) ( ON ?auto_2267684 ?auto_2267683 ) ( ON ?auto_2267686 ?auto_2267684 ) ( ON ?auto_2267685 ?auto_2267686 ) ( ON ?auto_2267687 ?auto_2267685 ) ( ON ?auto_2267688 ?auto_2267687 ) ( not ( = ?auto_2267682 ?auto_2267683 ) ) ( not ( = ?auto_2267682 ?auto_2267684 ) ) ( not ( = ?auto_2267682 ?auto_2267686 ) ) ( not ( = ?auto_2267682 ?auto_2267685 ) ) ( not ( = ?auto_2267682 ?auto_2267687 ) ) ( not ( = ?auto_2267682 ?auto_2267688 ) ) ( not ( = ?auto_2267682 ?auto_2267689 ) ) ( not ( = ?auto_2267682 ?auto_2267690 ) ) ( not ( = ?auto_2267682 ?auto_2267696 ) ) ( not ( = ?auto_2267683 ?auto_2267684 ) ) ( not ( = ?auto_2267683 ?auto_2267686 ) ) ( not ( = ?auto_2267683 ?auto_2267685 ) ) ( not ( = ?auto_2267683 ?auto_2267687 ) ) ( not ( = ?auto_2267683 ?auto_2267688 ) ) ( not ( = ?auto_2267683 ?auto_2267689 ) ) ( not ( = ?auto_2267683 ?auto_2267690 ) ) ( not ( = ?auto_2267683 ?auto_2267696 ) ) ( not ( = ?auto_2267684 ?auto_2267686 ) ) ( not ( = ?auto_2267684 ?auto_2267685 ) ) ( not ( = ?auto_2267684 ?auto_2267687 ) ) ( not ( = ?auto_2267684 ?auto_2267688 ) ) ( not ( = ?auto_2267684 ?auto_2267689 ) ) ( not ( = ?auto_2267684 ?auto_2267690 ) ) ( not ( = ?auto_2267684 ?auto_2267696 ) ) ( not ( = ?auto_2267686 ?auto_2267685 ) ) ( not ( = ?auto_2267686 ?auto_2267687 ) ) ( not ( = ?auto_2267686 ?auto_2267688 ) ) ( not ( = ?auto_2267686 ?auto_2267689 ) ) ( not ( = ?auto_2267686 ?auto_2267690 ) ) ( not ( = ?auto_2267686 ?auto_2267696 ) ) ( not ( = ?auto_2267685 ?auto_2267687 ) ) ( not ( = ?auto_2267685 ?auto_2267688 ) ) ( not ( = ?auto_2267685 ?auto_2267689 ) ) ( not ( = ?auto_2267685 ?auto_2267690 ) ) ( not ( = ?auto_2267685 ?auto_2267696 ) ) ( not ( = ?auto_2267687 ?auto_2267688 ) ) ( not ( = ?auto_2267687 ?auto_2267689 ) ) ( not ( = ?auto_2267687 ?auto_2267690 ) ) ( not ( = ?auto_2267687 ?auto_2267696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2267688 ?auto_2267689 ?auto_2267690 )
      ( MAKE-8CRATE-VERIFY ?auto_2267682 ?auto_2267683 ?auto_2267684 ?auto_2267686 ?auto_2267685 ?auto_2267687 ?auto_2267688 ?auto_2267689 ?auto_2267690 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2267775 - SURFACE
      ?auto_2267776 - SURFACE
      ?auto_2267777 - SURFACE
      ?auto_2267779 - SURFACE
      ?auto_2267778 - SURFACE
      ?auto_2267780 - SURFACE
      ?auto_2267781 - SURFACE
      ?auto_2267782 - SURFACE
      ?auto_2267783 - SURFACE
    )
    :vars
    (
      ?auto_2267786 - HOIST
      ?auto_2267785 - PLACE
      ?auto_2267788 - PLACE
      ?auto_2267789 - HOIST
      ?auto_2267787 - SURFACE
      ?auto_2267784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2267786 ?auto_2267785 ) ( IS-CRATE ?auto_2267783 ) ( not ( = ?auto_2267782 ?auto_2267783 ) ) ( not ( = ?auto_2267781 ?auto_2267782 ) ) ( not ( = ?auto_2267781 ?auto_2267783 ) ) ( not ( = ?auto_2267788 ?auto_2267785 ) ) ( HOIST-AT ?auto_2267789 ?auto_2267788 ) ( not ( = ?auto_2267786 ?auto_2267789 ) ) ( AVAILABLE ?auto_2267789 ) ( SURFACE-AT ?auto_2267783 ?auto_2267788 ) ( ON ?auto_2267783 ?auto_2267787 ) ( CLEAR ?auto_2267783 ) ( not ( = ?auto_2267782 ?auto_2267787 ) ) ( not ( = ?auto_2267783 ?auto_2267787 ) ) ( not ( = ?auto_2267781 ?auto_2267787 ) ) ( TRUCK-AT ?auto_2267784 ?auto_2267785 ) ( SURFACE-AT ?auto_2267781 ?auto_2267785 ) ( CLEAR ?auto_2267781 ) ( IS-CRATE ?auto_2267782 ) ( AVAILABLE ?auto_2267786 ) ( IN ?auto_2267782 ?auto_2267784 ) ( ON ?auto_2267776 ?auto_2267775 ) ( ON ?auto_2267777 ?auto_2267776 ) ( ON ?auto_2267779 ?auto_2267777 ) ( ON ?auto_2267778 ?auto_2267779 ) ( ON ?auto_2267780 ?auto_2267778 ) ( ON ?auto_2267781 ?auto_2267780 ) ( not ( = ?auto_2267775 ?auto_2267776 ) ) ( not ( = ?auto_2267775 ?auto_2267777 ) ) ( not ( = ?auto_2267775 ?auto_2267779 ) ) ( not ( = ?auto_2267775 ?auto_2267778 ) ) ( not ( = ?auto_2267775 ?auto_2267780 ) ) ( not ( = ?auto_2267775 ?auto_2267781 ) ) ( not ( = ?auto_2267775 ?auto_2267782 ) ) ( not ( = ?auto_2267775 ?auto_2267783 ) ) ( not ( = ?auto_2267775 ?auto_2267787 ) ) ( not ( = ?auto_2267776 ?auto_2267777 ) ) ( not ( = ?auto_2267776 ?auto_2267779 ) ) ( not ( = ?auto_2267776 ?auto_2267778 ) ) ( not ( = ?auto_2267776 ?auto_2267780 ) ) ( not ( = ?auto_2267776 ?auto_2267781 ) ) ( not ( = ?auto_2267776 ?auto_2267782 ) ) ( not ( = ?auto_2267776 ?auto_2267783 ) ) ( not ( = ?auto_2267776 ?auto_2267787 ) ) ( not ( = ?auto_2267777 ?auto_2267779 ) ) ( not ( = ?auto_2267777 ?auto_2267778 ) ) ( not ( = ?auto_2267777 ?auto_2267780 ) ) ( not ( = ?auto_2267777 ?auto_2267781 ) ) ( not ( = ?auto_2267777 ?auto_2267782 ) ) ( not ( = ?auto_2267777 ?auto_2267783 ) ) ( not ( = ?auto_2267777 ?auto_2267787 ) ) ( not ( = ?auto_2267779 ?auto_2267778 ) ) ( not ( = ?auto_2267779 ?auto_2267780 ) ) ( not ( = ?auto_2267779 ?auto_2267781 ) ) ( not ( = ?auto_2267779 ?auto_2267782 ) ) ( not ( = ?auto_2267779 ?auto_2267783 ) ) ( not ( = ?auto_2267779 ?auto_2267787 ) ) ( not ( = ?auto_2267778 ?auto_2267780 ) ) ( not ( = ?auto_2267778 ?auto_2267781 ) ) ( not ( = ?auto_2267778 ?auto_2267782 ) ) ( not ( = ?auto_2267778 ?auto_2267783 ) ) ( not ( = ?auto_2267778 ?auto_2267787 ) ) ( not ( = ?auto_2267780 ?auto_2267781 ) ) ( not ( = ?auto_2267780 ?auto_2267782 ) ) ( not ( = ?auto_2267780 ?auto_2267783 ) ) ( not ( = ?auto_2267780 ?auto_2267787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2267781 ?auto_2267782 ?auto_2267783 )
      ( MAKE-8CRATE-VERIFY ?auto_2267775 ?auto_2267776 ?auto_2267777 ?auto_2267779 ?auto_2267778 ?auto_2267780 ?auto_2267781 ?auto_2267782 ?auto_2267783 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2271891 - SURFACE
      ?auto_2271892 - SURFACE
      ?auto_2271893 - SURFACE
      ?auto_2271895 - SURFACE
      ?auto_2271894 - SURFACE
      ?auto_2271896 - SURFACE
      ?auto_2271897 - SURFACE
      ?auto_2271898 - SURFACE
      ?auto_2271899 - SURFACE
      ?auto_2271900 - SURFACE
    )
    :vars
    (
      ?auto_2271901 - HOIST
      ?auto_2271902 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2271901 ?auto_2271902 ) ( SURFACE-AT ?auto_2271899 ?auto_2271902 ) ( CLEAR ?auto_2271899 ) ( LIFTING ?auto_2271901 ?auto_2271900 ) ( IS-CRATE ?auto_2271900 ) ( not ( = ?auto_2271899 ?auto_2271900 ) ) ( ON ?auto_2271892 ?auto_2271891 ) ( ON ?auto_2271893 ?auto_2271892 ) ( ON ?auto_2271895 ?auto_2271893 ) ( ON ?auto_2271894 ?auto_2271895 ) ( ON ?auto_2271896 ?auto_2271894 ) ( ON ?auto_2271897 ?auto_2271896 ) ( ON ?auto_2271898 ?auto_2271897 ) ( ON ?auto_2271899 ?auto_2271898 ) ( not ( = ?auto_2271891 ?auto_2271892 ) ) ( not ( = ?auto_2271891 ?auto_2271893 ) ) ( not ( = ?auto_2271891 ?auto_2271895 ) ) ( not ( = ?auto_2271891 ?auto_2271894 ) ) ( not ( = ?auto_2271891 ?auto_2271896 ) ) ( not ( = ?auto_2271891 ?auto_2271897 ) ) ( not ( = ?auto_2271891 ?auto_2271898 ) ) ( not ( = ?auto_2271891 ?auto_2271899 ) ) ( not ( = ?auto_2271891 ?auto_2271900 ) ) ( not ( = ?auto_2271892 ?auto_2271893 ) ) ( not ( = ?auto_2271892 ?auto_2271895 ) ) ( not ( = ?auto_2271892 ?auto_2271894 ) ) ( not ( = ?auto_2271892 ?auto_2271896 ) ) ( not ( = ?auto_2271892 ?auto_2271897 ) ) ( not ( = ?auto_2271892 ?auto_2271898 ) ) ( not ( = ?auto_2271892 ?auto_2271899 ) ) ( not ( = ?auto_2271892 ?auto_2271900 ) ) ( not ( = ?auto_2271893 ?auto_2271895 ) ) ( not ( = ?auto_2271893 ?auto_2271894 ) ) ( not ( = ?auto_2271893 ?auto_2271896 ) ) ( not ( = ?auto_2271893 ?auto_2271897 ) ) ( not ( = ?auto_2271893 ?auto_2271898 ) ) ( not ( = ?auto_2271893 ?auto_2271899 ) ) ( not ( = ?auto_2271893 ?auto_2271900 ) ) ( not ( = ?auto_2271895 ?auto_2271894 ) ) ( not ( = ?auto_2271895 ?auto_2271896 ) ) ( not ( = ?auto_2271895 ?auto_2271897 ) ) ( not ( = ?auto_2271895 ?auto_2271898 ) ) ( not ( = ?auto_2271895 ?auto_2271899 ) ) ( not ( = ?auto_2271895 ?auto_2271900 ) ) ( not ( = ?auto_2271894 ?auto_2271896 ) ) ( not ( = ?auto_2271894 ?auto_2271897 ) ) ( not ( = ?auto_2271894 ?auto_2271898 ) ) ( not ( = ?auto_2271894 ?auto_2271899 ) ) ( not ( = ?auto_2271894 ?auto_2271900 ) ) ( not ( = ?auto_2271896 ?auto_2271897 ) ) ( not ( = ?auto_2271896 ?auto_2271898 ) ) ( not ( = ?auto_2271896 ?auto_2271899 ) ) ( not ( = ?auto_2271896 ?auto_2271900 ) ) ( not ( = ?auto_2271897 ?auto_2271898 ) ) ( not ( = ?auto_2271897 ?auto_2271899 ) ) ( not ( = ?auto_2271897 ?auto_2271900 ) ) ( not ( = ?auto_2271898 ?auto_2271899 ) ) ( not ( = ?auto_2271898 ?auto_2271900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2271899 ?auto_2271900 )
      ( MAKE-9CRATE-VERIFY ?auto_2271891 ?auto_2271892 ?auto_2271893 ?auto_2271895 ?auto_2271894 ?auto_2271896 ?auto_2271897 ?auto_2271898 ?auto_2271899 ?auto_2271900 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2271971 - SURFACE
      ?auto_2271972 - SURFACE
      ?auto_2271973 - SURFACE
      ?auto_2271975 - SURFACE
      ?auto_2271974 - SURFACE
      ?auto_2271976 - SURFACE
      ?auto_2271977 - SURFACE
      ?auto_2271978 - SURFACE
      ?auto_2271979 - SURFACE
      ?auto_2271980 - SURFACE
    )
    :vars
    (
      ?auto_2271981 - HOIST
      ?auto_2271983 - PLACE
      ?auto_2271982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2271981 ?auto_2271983 ) ( SURFACE-AT ?auto_2271979 ?auto_2271983 ) ( CLEAR ?auto_2271979 ) ( IS-CRATE ?auto_2271980 ) ( not ( = ?auto_2271979 ?auto_2271980 ) ) ( TRUCK-AT ?auto_2271982 ?auto_2271983 ) ( AVAILABLE ?auto_2271981 ) ( IN ?auto_2271980 ?auto_2271982 ) ( ON ?auto_2271979 ?auto_2271978 ) ( not ( = ?auto_2271978 ?auto_2271979 ) ) ( not ( = ?auto_2271978 ?auto_2271980 ) ) ( ON ?auto_2271972 ?auto_2271971 ) ( ON ?auto_2271973 ?auto_2271972 ) ( ON ?auto_2271975 ?auto_2271973 ) ( ON ?auto_2271974 ?auto_2271975 ) ( ON ?auto_2271976 ?auto_2271974 ) ( ON ?auto_2271977 ?auto_2271976 ) ( ON ?auto_2271978 ?auto_2271977 ) ( not ( = ?auto_2271971 ?auto_2271972 ) ) ( not ( = ?auto_2271971 ?auto_2271973 ) ) ( not ( = ?auto_2271971 ?auto_2271975 ) ) ( not ( = ?auto_2271971 ?auto_2271974 ) ) ( not ( = ?auto_2271971 ?auto_2271976 ) ) ( not ( = ?auto_2271971 ?auto_2271977 ) ) ( not ( = ?auto_2271971 ?auto_2271978 ) ) ( not ( = ?auto_2271971 ?auto_2271979 ) ) ( not ( = ?auto_2271971 ?auto_2271980 ) ) ( not ( = ?auto_2271972 ?auto_2271973 ) ) ( not ( = ?auto_2271972 ?auto_2271975 ) ) ( not ( = ?auto_2271972 ?auto_2271974 ) ) ( not ( = ?auto_2271972 ?auto_2271976 ) ) ( not ( = ?auto_2271972 ?auto_2271977 ) ) ( not ( = ?auto_2271972 ?auto_2271978 ) ) ( not ( = ?auto_2271972 ?auto_2271979 ) ) ( not ( = ?auto_2271972 ?auto_2271980 ) ) ( not ( = ?auto_2271973 ?auto_2271975 ) ) ( not ( = ?auto_2271973 ?auto_2271974 ) ) ( not ( = ?auto_2271973 ?auto_2271976 ) ) ( not ( = ?auto_2271973 ?auto_2271977 ) ) ( not ( = ?auto_2271973 ?auto_2271978 ) ) ( not ( = ?auto_2271973 ?auto_2271979 ) ) ( not ( = ?auto_2271973 ?auto_2271980 ) ) ( not ( = ?auto_2271975 ?auto_2271974 ) ) ( not ( = ?auto_2271975 ?auto_2271976 ) ) ( not ( = ?auto_2271975 ?auto_2271977 ) ) ( not ( = ?auto_2271975 ?auto_2271978 ) ) ( not ( = ?auto_2271975 ?auto_2271979 ) ) ( not ( = ?auto_2271975 ?auto_2271980 ) ) ( not ( = ?auto_2271974 ?auto_2271976 ) ) ( not ( = ?auto_2271974 ?auto_2271977 ) ) ( not ( = ?auto_2271974 ?auto_2271978 ) ) ( not ( = ?auto_2271974 ?auto_2271979 ) ) ( not ( = ?auto_2271974 ?auto_2271980 ) ) ( not ( = ?auto_2271976 ?auto_2271977 ) ) ( not ( = ?auto_2271976 ?auto_2271978 ) ) ( not ( = ?auto_2271976 ?auto_2271979 ) ) ( not ( = ?auto_2271976 ?auto_2271980 ) ) ( not ( = ?auto_2271977 ?auto_2271978 ) ) ( not ( = ?auto_2271977 ?auto_2271979 ) ) ( not ( = ?auto_2271977 ?auto_2271980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2271978 ?auto_2271979 ?auto_2271980 )
      ( MAKE-9CRATE-VERIFY ?auto_2271971 ?auto_2271972 ?auto_2271973 ?auto_2271975 ?auto_2271974 ?auto_2271976 ?auto_2271977 ?auto_2271978 ?auto_2271979 ?auto_2271980 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2272061 - SURFACE
      ?auto_2272062 - SURFACE
      ?auto_2272063 - SURFACE
      ?auto_2272065 - SURFACE
      ?auto_2272064 - SURFACE
      ?auto_2272066 - SURFACE
      ?auto_2272067 - SURFACE
      ?auto_2272068 - SURFACE
      ?auto_2272069 - SURFACE
      ?auto_2272070 - SURFACE
    )
    :vars
    (
      ?auto_2272074 - HOIST
      ?auto_2272073 - PLACE
      ?auto_2272072 - TRUCK
      ?auto_2272071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2272074 ?auto_2272073 ) ( SURFACE-AT ?auto_2272069 ?auto_2272073 ) ( CLEAR ?auto_2272069 ) ( IS-CRATE ?auto_2272070 ) ( not ( = ?auto_2272069 ?auto_2272070 ) ) ( AVAILABLE ?auto_2272074 ) ( IN ?auto_2272070 ?auto_2272072 ) ( ON ?auto_2272069 ?auto_2272068 ) ( not ( = ?auto_2272068 ?auto_2272069 ) ) ( not ( = ?auto_2272068 ?auto_2272070 ) ) ( TRUCK-AT ?auto_2272072 ?auto_2272071 ) ( not ( = ?auto_2272071 ?auto_2272073 ) ) ( ON ?auto_2272062 ?auto_2272061 ) ( ON ?auto_2272063 ?auto_2272062 ) ( ON ?auto_2272065 ?auto_2272063 ) ( ON ?auto_2272064 ?auto_2272065 ) ( ON ?auto_2272066 ?auto_2272064 ) ( ON ?auto_2272067 ?auto_2272066 ) ( ON ?auto_2272068 ?auto_2272067 ) ( not ( = ?auto_2272061 ?auto_2272062 ) ) ( not ( = ?auto_2272061 ?auto_2272063 ) ) ( not ( = ?auto_2272061 ?auto_2272065 ) ) ( not ( = ?auto_2272061 ?auto_2272064 ) ) ( not ( = ?auto_2272061 ?auto_2272066 ) ) ( not ( = ?auto_2272061 ?auto_2272067 ) ) ( not ( = ?auto_2272061 ?auto_2272068 ) ) ( not ( = ?auto_2272061 ?auto_2272069 ) ) ( not ( = ?auto_2272061 ?auto_2272070 ) ) ( not ( = ?auto_2272062 ?auto_2272063 ) ) ( not ( = ?auto_2272062 ?auto_2272065 ) ) ( not ( = ?auto_2272062 ?auto_2272064 ) ) ( not ( = ?auto_2272062 ?auto_2272066 ) ) ( not ( = ?auto_2272062 ?auto_2272067 ) ) ( not ( = ?auto_2272062 ?auto_2272068 ) ) ( not ( = ?auto_2272062 ?auto_2272069 ) ) ( not ( = ?auto_2272062 ?auto_2272070 ) ) ( not ( = ?auto_2272063 ?auto_2272065 ) ) ( not ( = ?auto_2272063 ?auto_2272064 ) ) ( not ( = ?auto_2272063 ?auto_2272066 ) ) ( not ( = ?auto_2272063 ?auto_2272067 ) ) ( not ( = ?auto_2272063 ?auto_2272068 ) ) ( not ( = ?auto_2272063 ?auto_2272069 ) ) ( not ( = ?auto_2272063 ?auto_2272070 ) ) ( not ( = ?auto_2272065 ?auto_2272064 ) ) ( not ( = ?auto_2272065 ?auto_2272066 ) ) ( not ( = ?auto_2272065 ?auto_2272067 ) ) ( not ( = ?auto_2272065 ?auto_2272068 ) ) ( not ( = ?auto_2272065 ?auto_2272069 ) ) ( not ( = ?auto_2272065 ?auto_2272070 ) ) ( not ( = ?auto_2272064 ?auto_2272066 ) ) ( not ( = ?auto_2272064 ?auto_2272067 ) ) ( not ( = ?auto_2272064 ?auto_2272068 ) ) ( not ( = ?auto_2272064 ?auto_2272069 ) ) ( not ( = ?auto_2272064 ?auto_2272070 ) ) ( not ( = ?auto_2272066 ?auto_2272067 ) ) ( not ( = ?auto_2272066 ?auto_2272068 ) ) ( not ( = ?auto_2272066 ?auto_2272069 ) ) ( not ( = ?auto_2272066 ?auto_2272070 ) ) ( not ( = ?auto_2272067 ?auto_2272068 ) ) ( not ( = ?auto_2272067 ?auto_2272069 ) ) ( not ( = ?auto_2272067 ?auto_2272070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2272068 ?auto_2272069 ?auto_2272070 )
      ( MAKE-9CRATE-VERIFY ?auto_2272061 ?auto_2272062 ?auto_2272063 ?auto_2272065 ?auto_2272064 ?auto_2272066 ?auto_2272067 ?auto_2272068 ?auto_2272069 ?auto_2272070 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2272160 - SURFACE
      ?auto_2272161 - SURFACE
      ?auto_2272162 - SURFACE
      ?auto_2272164 - SURFACE
      ?auto_2272163 - SURFACE
      ?auto_2272165 - SURFACE
      ?auto_2272166 - SURFACE
      ?auto_2272167 - SURFACE
      ?auto_2272168 - SURFACE
      ?auto_2272169 - SURFACE
    )
    :vars
    (
      ?auto_2272171 - HOIST
      ?auto_2272170 - PLACE
      ?auto_2272173 - TRUCK
      ?auto_2272172 - PLACE
      ?auto_2272174 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2272171 ?auto_2272170 ) ( SURFACE-AT ?auto_2272168 ?auto_2272170 ) ( CLEAR ?auto_2272168 ) ( IS-CRATE ?auto_2272169 ) ( not ( = ?auto_2272168 ?auto_2272169 ) ) ( AVAILABLE ?auto_2272171 ) ( ON ?auto_2272168 ?auto_2272167 ) ( not ( = ?auto_2272167 ?auto_2272168 ) ) ( not ( = ?auto_2272167 ?auto_2272169 ) ) ( TRUCK-AT ?auto_2272173 ?auto_2272172 ) ( not ( = ?auto_2272172 ?auto_2272170 ) ) ( HOIST-AT ?auto_2272174 ?auto_2272172 ) ( LIFTING ?auto_2272174 ?auto_2272169 ) ( not ( = ?auto_2272171 ?auto_2272174 ) ) ( ON ?auto_2272161 ?auto_2272160 ) ( ON ?auto_2272162 ?auto_2272161 ) ( ON ?auto_2272164 ?auto_2272162 ) ( ON ?auto_2272163 ?auto_2272164 ) ( ON ?auto_2272165 ?auto_2272163 ) ( ON ?auto_2272166 ?auto_2272165 ) ( ON ?auto_2272167 ?auto_2272166 ) ( not ( = ?auto_2272160 ?auto_2272161 ) ) ( not ( = ?auto_2272160 ?auto_2272162 ) ) ( not ( = ?auto_2272160 ?auto_2272164 ) ) ( not ( = ?auto_2272160 ?auto_2272163 ) ) ( not ( = ?auto_2272160 ?auto_2272165 ) ) ( not ( = ?auto_2272160 ?auto_2272166 ) ) ( not ( = ?auto_2272160 ?auto_2272167 ) ) ( not ( = ?auto_2272160 ?auto_2272168 ) ) ( not ( = ?auto_2272160 ?auto_2272169 ) ) ( not ( = ?auto_2272161 ?auto_2272162 ) ) ( not ( = ?auto_2272161 ?auto_2272164 ) ) ( not ( = ?auto_2272161 ?auto_2272163 ) ) ( not ( = ?auto_2272161 ?auto_2272165 ) ) ( not ( = ?auto_2272161 ?auto_2272166 ) ) ( not ( = ?auto_2272161 ?auto_2272167 ) ) ( not ( = ?auto_2272161 ?auto_2272168 ) ) ( not ( = ?auto_2272161 ?auto_2272169 ) ) ( not ( = ?auto_2272162 ?auto_2272164 ) ) ( not ( = ?auto_2272162 ?auto_2272163 ) ) ( not ( = ?auto_2272162 ?auto_2272165 ) ) ( not ( = ?auto_2272162 ?auto_2272166 ) ) ( not ( = ?auto_2272162 ?auto_2272167 ) ) ( not ( = ?auto_2272162 ?auto_2272168 ) ) ( not ( = ?auto_2272162 ?auto_2272169 ) ) ( not ( = ?auto_2272164 ?auto_2272163 ) ) ( not ( = ?auto_2272164 ?auto_2272165 ) ) ( not ( = ?auto_2272164 ?auto_2272166 ) ) ( not ( = ?auto_2272164 ?auto_2272167 ) ) ( not ( = ?auto_2272164 ?auto_2272168 ) ) ( not ( = ?auto_2272164 ?auto_2272169 ) ) ( not ( = ?auto_2272163 ?auto_2272165 ) ) ( not ( = ?auto_2272163 ?auto_2272166 ) ) ( not ( = ?auto_2272163 ?auto_2272167 ) ) ( not ( = ?auto_2272163 ?auto_2272168 ) ) ( not ( = ?auto_2272163 ?auto_2272169 ) ) ( not ( = ?auto_2272165 ?auto_2272166 ) ) ( not ( = ?auto_2272165 ?auto_2272167 ) ) ( not ( = ?auto_2272165 ?auto_2272168 ) ) ( not ( = ?auto_2272165 ?auto_2272169 ) ) ( not ( = ?auto_2272166 ?auto_2272167 ) ) ( not ( = ?auto_2272166 ?auto_2272168 ) ) ( not ( = ?auto_2272166 ?auto_2272169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2272167 ?auto_2272168 ?auto_2272169 )
      ( MAKE-9CRATE-VERIFY ?auto_2272160 ?auto_2272161 ?auto_2272162 ?auto_2272164 ?auto_2272163 ?auto_2272165 ?auto_2272166 ?auto_2272167 ?auto_2272168 ?auto_2272169 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2272268 - SURFACE
      ?auto_2272269 - SURFACE
      ?auto_2272270 - SURFACE
      ?auto_2272272 - SURFACE
      ?auto_2272271 - SURFACE
      ?auto_2272273 - SURFACE
      ?auto_2272274 - SURFACE
      ?auto_2272275 - SURFACE
      ?auto_2272276 - SURFACE
      ?auto_2272277 - SURFACE
    )
    :vars
    (
      ?auto_2272279 - HOIST
      ?auto_2272281 - PLACE
      ?auto_2272278 - TRUCK
      ?auto_2272282 - PLACE
      ?auto_2272280 - HOIST
      ?auto_2272283 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2272279 ?auto_2272281 ) ( SURFACE-AT ?auto_2272276 ?auto_2272281 ) ( CLEAR ?auto_2272276 ) ( IS-CRATE ?auto_2272277 ) ( not ( = ?auto_2272276 ?auto_2272277 ) ) ( AVAILABLE ?auto_2272279 ) ( ON ?auto_2272276 ?auto_2272275 ) ( not ( = ?auto_2272275 ?auto_2272276 ) ) ( not ( = ?auto_2272275 ?auto_2272277 ) ) ( TRUCK-AT ?auto_2272278 ?auto_2272282 ) ( not ( = ?auto_2272282 ?auto_2272281 ) ) ( HOIST-AT ?auto_2272280 ?auto_2272282 ) ( not ( = ?auto_2272279 ?auto_2272280 ) ) ( AVAILABLE ?auto_2272280 ) ( SURFACE-AT ?auto_2272277 ?auto_2272282 ) ( ON ?auto_2272277 ?auto_2272283 ) ( CLEAR ?auto_2272277 ) ( not ( = ?auto_2272276 ?auto_2272283 ) ) ( not ( = ?auto_2272277 ?auto_2272283 ) ) ( not ( = ?auto_2272275 ?auto_2272283 ) ) ( ON ?auto_2272269 ?auto_2272268 ) ( ON ?auto_2272270 ?auto_2272269 ) ( ON ?auto_2272272 ?auto_2272270 ) ( ON ?auto_2272271 ?auto_2272272 ) ( ON ?auto_2272273 ?auto_2272271 ) ( ON ?auto_2272274 ?auto_2272273 ) ( ON ?auto_2272275 ?auto_2272274 ) ( not ( = ?auto_2272268 ?auto_2272269 ) ) ( not ( = ?auto_2272268 ?auto_2272270 ) ) ( not ( = ?auto_2272268 ?auto_2272272 ) ) ( not ( = ?auto_2272268 ?auto_2272271 ) ) ( not ( = ?auto_2272268 ?auto_2272273 ) ) ( not ( = ?auto_2272268 ?auto_2272274 ) ) ( not ( = ?auto_2272268 ?auto_2272275 ) ) ( not ( = ?auto_2272268 ?auto_2272276 ) ) ( not ( = ?auto_2272268 ?auto_2272277 ) ) ( not ( = ?auto_2272268 ?auto_2272283 ) ) ( not ( = ?auto_2272269 ?auto_2272270 ) ) ( not ( = ?auto_2272269 ?auto_2272272 ) ) ( not ( = ?auto_2272269 ?auto_2272271 ) ) ( not ( = ?auto_2272269 ?auto_2272273 ) ) ( not ( = ?auto_2272269 ?auto_2272274 ) ) ( not ( = ?auto_2272269 ?auto_2272275 ) ) ( not ( = ?auto_2272269 ?auto_2272276 ) ) ( not ( = ?auto_2272269 ?auto_2272277 ) ) ( not ( = ?auto_2272269 ?auto_2272283 ) ) ( not ( = ?auto_2272270 ?auto_2272272 ) ) ( not ( = ?auto_2272270 ?auto_2272271 ) ) ( not ( = ?auto_2272270 ?auto_2272273 ) ) ( not ( = ?auto_2272270 ?auto_2272274 ) ) ( not ( = ?auto_2272270 ?auto_2272275 ) ) ( not ( = ?auto_2272270 ?auto_2272276 ) ) ( not ( = ?auto_2272270 ?auto_2272277 ) ) ( not ( = ?auto_2272270 ?auto_2272283 ) ) ( not ( = ?auto_2272272 ?auto_2272271 ) ) ( not ( = ?auto_2272272 ?auto_2272273 ) ) ( not ( = ?auto_2272272 ?auto_2272274 ) ) ( not ( = ?auto_2272272 ?auto_2272275 ) ) ( not ( = ?auto_2272272 ?auto_2272276 ) ) ( not ( = ?auto_2272272 ?auto_2272277 ) ) ( not ( = ?auto_2272272 ?auto_2272283 ) ) ( not ( = ?auto_2272271 ?auto_2272273 ) ) ( not ( = ?auto_2272271 ?auto_2272274 ) ) ( not ( = ?auto_2272271 ?auto_2272275 ) ) ( not ( = ?auto_2272271 ?auto_2272276 ) ) ( not ( = ?auto_2272271 ?auto_2272277 ) ) ( not ( = ?auto_2272271 ?auto_2272283 ) ) ( not ( = ?auto_2272273 ?auto_2272274 ) ) ( not ( = ?auto_2272273 ?auto_2272275 ) ) ( not ( = ?auto_2272273 ?auto_2272276 ) ) ( not ( = ?auto_2272273 ?auto_2272277 ) ) ( not ( = ?auto_2272273 ?auto_2272283 ) ) ( not ( = ?auto_2272274 ?auto_2272275 ) ) ( not ( = ?auto_2272274 ?auto_2272276 ) ) ( not ( = ?auto_2272274 ?auto_2272277 ) ) ( not ( = ?auto_2272274 ?auto_2272283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2272275 ?auto_2272276 ?auto_2272277 )
      ( MAKE-9CRATE-VERIFY ?auto_2272268 ?auto_2272269 ?auto_2272270 ?auto_2272272 ?auto_2272271 ?auto_2272273 ?auto_2272274 ?auto_2272275 ?auto_2272276 ?auto_2272277 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2272377 - SURFACE
      ?auto_2272378 - SURFACE
      ?auto_2272379 - SURFACE
      ?auto_2272381 - SURFACE
      ?auto_2272380 - SURFACE
      ?auto_2272382 - SURFACE
      ?auto_2272383 - SURFACE
      ?auto_2272384 - SURFACE
      ?auto_2272385 - SURFACE
      ?auto_2272386 - SURFACE
    )
    :vars
    (
      ?auto_2272391 - HOIST
      ?auto_2272390 - PLACE
      ?auto_2272388 - PLACE
      ?auto_2272387 - HOIST
      ?auto_2272389 - SURFACE
      ?auto_2272392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2272391 ?auto_2272390 ) ( SURFACE-AT ?auto_2272385 ?auto_2272390 ) ( CLEAR ?auto_2272385 ) ( IS-CRATE ?auto_2272386 ) ( not ( = ?auto_2272385 ?auto_2272386 ) ) ( AVAILABLE ?auto_2272391 ) ( ON ?auto_2272385 ?auto_2272384 ) ( not ( = ?auto_2272384 ?auto_2272385 ) ) ( not ( = ?auto_2272384 ?auto_2272386 ) ) ( not ( = ?auto_2272388 ?auto_2272390 ) ) ( HOIST-AT ?auto_2272387 ?auto_2272388 ) ( not ( = ?auto_2272391 ?auto_2272387 ) ) ( AVAILABLE ?auto_2272387 ) ( SURFACE-AT ?auto_2272386 ?auto_2272388 ) ( ON ?auto_2272386 ?auto_2272389 ) ( CLEAR ?auto_2272386 ) ( not ( = ?auto_2272385 ?auto_2272389 ) ) ( not ( = ?auto_2272386 ?auto_2272389 ) ) ( not ( = ?auto_2272384 ?auto_2272389 ) ) ( TRUCK-AT ?auto_2272392 ?auto_2272390 ) ( ON ?auto_2272378 ?auto_2272377 ) ( ON ?auto_2272379 ?auto_2272378 ) ( ON ?auto_2272381 ?auto_2272379 ) ( ON ?auto_2272380 ?auto_2272381 ) ( ON ?auto_2272382 ?auto_2272380 ) ( ON ?auto_2272383 ?auto_2272382 ) ( ON ?auto_2272384 ?auto_2272383 ) ( not ( = ?auto_2272377 ?auto_2272378 ) ) ( not ( = ?auto_2272377 ?auto_2272379 ) ) ( not ( = ?auto_2272377 ?auto_2272381 ) ) ( not ( = ?auto_2272377 ?auto_2272380 ) ) ( not ( = ?auto_2272377 ?auto_2272382 ) ) ( not ( = ?auto_2272377 ?auto_2272383 ) ) ( not ( = ?auto_2272377 ?auto_2272384 ) ) ( not ( = ?auto_2272377 ?auto_2272385 ) ) ( not ( = ?auto_2272377 ?auto_2272386 ) ) ( not ( = ?auto_2272377 ?auto_2272389 ) ) ( not ( = ?auto_2272378 ?auto_2272379 ) ) ( not ( = ?auto_2272378 ?auto_2272381 ) ) ( not ( = ?auto_2272378 ?auto_2272380 ) ) ( not ( = ?auto_2272378 ?auto_2272382 ) ) ( not ( = ?auto_2272378 ?auto_2272383 ) ) ( not ( = ?auto_2272378 ?auto_2272384 ) ) ( not ( = ?auto_2272378 ?auto_2272385 ) ) ( not ( = ?auto_2272378 ?auto_2272386 ) ) ( not ( = ?auto_2272378 ?auto_2272389 ) ) ( not ( = ?auto_2272379 ?auto_2272381 ) ) ( not ( = ?auto_2272379 ?auto_2272380 ) ) ( not ( = ?auto_2272379 ?auto_2272382 ) ) ( not ( = ?auto_2272379 ?auto_2272383 ) ) ( not ( = ?auto_2272379 ?auto_2272384 ) ) ( not ( = ?auto_2272379 ?auto_2272385 ) ) ( not ( = ?auto_2272379 ?auto_2272386 ) ) ( not ( = ?auto_2272379 ?auto_2272389 ) ) ( not ( = ?auto_2272381 ?auto_2272380 ) ) ( not ( = ?auto_2272381 ?auto_2272382 ) ) ( not ( = ?auto_2272381 ?auto_2272383 ) ) ( not ( = ?auto_2272381 ?auto_2272384 ) ) ( not ( = ?auto_2272381 ?auto_2272385 ) ) ( not ( = ?auto_2272381 ?auto_2272386 ) ) ( not ( = ?auto_2272381 ?auto_2272389 ) ) ( not ( = ?auto_2272380 ?auto_2272382 ) ) ( not ( = ?auto_2272380 ?auto_2272383 ) ) ( not ( = ?auto_2272380 ?auto_2272384 ) ) ( not ( = ?auto_2272380 ?auto_2272385 ) ) ( not ( = ?auto_2272380 ?auto_2272386 ) ) ( not ( = ?auto_2272380 ?auto_2272389 ) ) ( not ( = ?auto_2272382 ?auto_2272383 ) ) ( not ( = ?auto_2272382 ?auto_2272384 ) ) ( not ( = ?auto_2272382 ?auto_2272385 ) ) ( not ( = ?auto_2272382 ?auto_2272386 ) ) ( not ( = ?auto_2272382 ?auto_2272389 ) ) ( not ( = ?auto_2272383 ?auto_2272384 ) ) ( not ( = ?auto_2272383 ?auto_2272385 ) ) ( not ( = ?auto_2272383 ?auto_2272386 ) ) ( not ( = ?auto_2272383 ?auto_2272389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2272384 ?auto_2272385 ?auto_2272386 )
      ( MAKE-9CRATE-VERIFY ?auto_2272377 ?auto_2272378 ?auto_2272379 ?auto_2272381 ?auto_2272380 ?auto_2272382 ?auto_2272383 ?auto_2272384 ?auto_2272385 ?auto_2272386 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2272486 - SURFACE
      ?auto_2272487 - SURFACE
      ?auto_2272488 - SURFACE
      ?auto_2272490 - SURFACE
      ?auto_2272489 - SURFACE
      ?auto_2272491 - SURFACE
      ?auto_2272492 - SURFACE
      ?auto_2272493 - SURFACE
      ?auto_2272494 - SURFACE
      ?auto_2272495 - SURFACE
    )
    :vars
    (
      ?auto_2272500 - HOIST
      ?auto_2272498 - PLACE
      ?auto_2272496 - PLACE
      ?auto_2272497 - HOIST
      ?auto_2272501 - SURFACE
      ?auto_2272499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2272500 ?auto_2272498 ) ( IS-CRATE ?auto_2272495 ) ( not ( = ?auto_2272494 ?auto_2272495 ) ) ( not ( = ?auto_2272493 ?auto_2272494 ) ) ( not ( = ?auto_2272493 ?auto_2272495 ) ) ( not ( = ?auto_2272496 ?auto_2272498 ) ) ( HOIST-AT ?auto_2272497 ?auto_2272496 ) ( not ( = ?auto_2272500 ?auto_2272497 ) ) ( AVAILABLE ?auto_2272497 ) ( SURFACE-AT ?auto_2272495 ?auto_2272496 ) ( ON ?auto_2272495 ?auto_2272501 ) ( CLEAR ?auto_2272495 ) ( not ( = ?auto_2272494 ?auto_2272501 ) ) ( not ( = ?auto_2272495 ?auto_2272501 ) ) ( not ( = ?auto_2272493 ?auto_2272501 ) ) ( TRUCK-AT ?auto_2272499 ?auto_2272498 ) ( SURFACE-AT ?auto_2272493 ?auto_2272498 ) ( CLEAR ?auto_2272493 ) ( LIFTING ?auto_2272500 ?auto_2272494 ) ( IS-CRATE ?auto_2272494 ) ( ON ?auto_2272487 ?auto_2272486 ) ( ON ?auto_2272488 ?auto_2272487 ) ( ON ?auto_2272490 ?auto_2272488 ) ( ON ?auto_2272489 ?auto_2272490 ) ( ON ?auto_2272491 ?auto_2272489 ) ( ON ?auto_2272492 ?auto_2272491 ) ( ON ?auto_2272493 ?auto_2272492 ) ( not ( = ?auto_2272486 ?auto_2272487 ) ) ( not ( = ?auto_2272486 ?auto_2272488 ) ) ( not ( = ?auto_2272486 ?auto_2272490 ) ) ( not ( = ?auto_2272486 ?auto_2272489 ) ) ( not ( = ?auto_2272486 ?auto_2272491 ) ) ( not ( = ?auto_2272486 ?auto_2272492 ) ) ( not ( = ?auto_2272486 ?auto_2272493 ) ) ( not ( = ?auto_2272486 ?auto_2272494 ) ) ( not ( = ?auto_2272486 ?auto_2272495 ) ) ( not ( = ?auto_2272486 ?auto_2272501 ) ) ( not ( = ?auto_2272487 ?auto_2272488 ) ) ( not ( = ?auto_2272487 ?auto_2272490 ) ) ( not ( = ?auto_2272487 ?auto_2272489 ) ) ( not ( = ?auto_2272487 ?auto_2272491 ) ) ( not ( = ?auto_2272487 ?auto_2272492 ) ) ( not ( = ?auto_2272487 ?auto_2272493 ) ) ( not ( = ?auto_2272487 ?auto_2272494 ) ) ( not ( = ?auto_2272487 ?auto_2272495 ) ) ( not ( = ?auto_2272487 ?auto_2272501 ) ) ( not ( = ?auto_2272488 ?auto_2272490 ) ) ( not ( = ?auto_2272488 ?auto_2272489 ) ) ( not ( = ?auto_2272488 ?auto_2272491 ) ) ( not ( = ?auto_2272488 ?auto_2272492 ) ) ( not ( = ?auto_2272488 ?auto_2272493 ) ) ( not ( = ?auto_2272488 ?auto_2272494 ) ) ( not ( = ?auto_2272488 ?auto_2272495 ) ) ( not ( = ?auto_2272488 ?auto_2272501 ) ) ( not ( = ?auto_2272490 ?auto_2272489 ) ) ( not ( = ?auto_2272490 ?auto_2272491 ) ) ( not ( = ?auto_2272490 ?auto_2272492 ) ) ( not ( = ?auto_2272490 ?auto_2272493 ) ) ( not ( = ?auto_2272490 ?auto_2272494 ) ) ( not ( = ?auto_2272490 ?auto_2272495 ) ) ( not ( = ?auto_2272490 ?auto_2272501 ) ) ( not ( = ?auto_2272489 ?auto_2272491 ) ) ( not ( = ?auto_2272489 ?auto_2272492 ) ) ( not ( = ?auto_2272489 ?auto_2272493 ) ) ( not ( = ?auto_2272489 ?auto_2272494 ) ) ( not ( = ?auto_2272489 ?auto_2272495 ) ) ( not ( = ?auto_2272489 ?auto_2272501 ) ) ( not ( = ?auto_2272491 ?auto_2272492 ) ) ( not ( = ?auto_2272491 ?auto_2272493 ) ) ( not ( = ?auto_2272491 ?auto_2272494 ) ) ( not ( = ?auto_2272491 ?auto_2272495 ) ) ( not ( = ?auto_2272491 ?auto_2272501 ) ) ( not ( = ?auto_2272492 ?auto_2272493 ) ) ( not ( = ?auto_2272492 ?auto_2272494 ) ) ( not ( = ?auto_2272492 ?auto_2272495 ) ) ( not ( = ?auto_2272492 ?auto_2272501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2272493 ?auto_2272494 ?auto_2272495 )
      ( MAKE-9CRATE-VERIFY ?auto_2272486 ?auto_2272487 ?auto_2272488 ?auto_2272490 ?auto_2272489 ?auto_2272491 ?auto_2272492 ?auto_2272493 ?auto_2272494 ?auto_2272495 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2272595 - SURFACE
      ?auto_2272596 - SURFACE
      ?auto_2272597 - SURFACE
      ?auto_2272599 - SURFACE
      ?auto_2272598 - SURFACE
      ?auto_2272600 - SURFACE
      ?auto_2272601 - SURFACE
      ?auto_2272602 - SURFACE
      ?auto_2272603 - SURFACE
      ?auto_2272604 - SURFACE
    )
    :vars
    (
      ?auto_2272605 - HOIST
      ?auto_2272608 - PLACE
      ?auto_2272610 - PLACE
      ?auto_2272609 - HOIST
      ?auto_2272606 - SURFACE
      ?auto_2272607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2272605 ?auto_2272608 ) ( IS-CRATE ?auto_2272604 ) ( not ( = ?auto_2272603 ?auto_2272604 ) ) ( not ( = ?auto_2272602 ?auto_2272603 ) ) ( not ( = ?auto_2272602 ?auto_2272604 ) ) ( not ( = ?auto_2272610 ?auto_2272608 ) ) ( HOIST-AT ?auto_2272609 ?auto_2272610 ) ( not ( = ?auto_2272605 ?auto_2272609 ) ) ( AVAILABLE ?auto_2272609 ) ( SURFACE-AT ?auto_2272604 ?auto_2272610 ) ( ON ?auto_2272604 ?auto_2272606 ) ( CLEAR ?auto_2272604 ) ( not ( = ?auto_2272603 ?auto_2272606 ) ) ( not ( = ?auto_2272604 ?auto_2272606 ) ) ( not ( = ?auto_2272602 ?auto_2272606 ) ) ( TRUCK-AT ?auto_2272607 ?auto_2272608 ) ( SURFACE-AT ?auto_2272602 ?auto_2272608 ) ( CLEAR ?auto_2272602 ) ( IS-CRATE ?auto_2272603 ) ( AVAILABLE ?auto_2272605 ) ( IN ?auto_2272603 ?auto_2272607 ) ( ON ?auto_2272596 ?auto_2272595 ) ( ON ?auto_2272597 ?auto_2272596 ) ( ON ?auto_2272599 ?auto_2272597 ) ( ON ?auto_2272598 ?auto_2272599 ) ( ON ?auto_2272600 ?auto_2272598 ) ( ON ?auto_2272601 ?auto_2272600 ) ( ON ?auto_2272602 ?auto_2272601 ) ( not ( = ?auto_2272595 ?auto_2272596 ) ) ( not ( = ?auto_2272595 ?auto_2272597 ) ) ( not ( = ?auto_2272595 ?auto_2272599 ) ) ( not ( = ?auto_2272595 ?auto_2272598 ) ) ( not ( = ?auto_2272595 ?auto_2272600 ) ) ( not ( = ?auto_2272595 ?auto_2272601 ) ) ( not ( = ?auto_2272595 ?auto_2272602 ) ) ( not ( = ?auto_2272595 ?auto_2272603 ) ) ( not ( = ?auto_2272595 ?auto_2272604 ) ) ( not ( = ?auto_2272595 ?auto_2272606 ) ) ( not ( = ?auto_2272596 ?auto_2272597 ) ) ( not ( = ?auto_2272596 ?auto_2272599 ) ) ( not ( = ?auto_2272596 ?auto_2272598 ) ) ( not ( = ?auto_2272596 ?auto_2272600 ) ) ( not ( = ?auto_2272596 ?auto_2272601 ) ) ( not ( = ?auto_2272596 ?auto_2272602 ) ) ( not ( = ?auto_2272596 ?auto_2272603 ) ) ( not ( = ?auto_2272596 ?auto_2272604 ) ) ( not ( = ?auto_2272596 ?auto_2272606 ) ) ( not ( = ?auto_2272597 ?auto_2272599 ) ) ( not ( = ?auto_2272597 ?auto_2272598 ) ) ( not ( = ?auto_2272597 ?auto_2272600 ) ) ( not ( = ?auto_2272597 ?auto_2272601 ) ) ( not ( = ?auto_2272597 ?auto_2272602 ) ) ( not ( = ?auto_2272597 ?auto_2272603 ) ) ( not ( = ?auto_2272597 ?auto_2272604 ) ) ( not ( = ?auto_2272597 ?auto_2272606 ) ) ( not ( = ?auto_2272599 ?auto_2272598 ) ) ( not ( = ?auto_2272599 ?auto_2272600 ) ) ( not ( = ?auto_2272599 ?auto_2272601 ) ) ( not ( = ?auto_2272599 ?auto_2272602 ) ) ( not ( = ?auto_2272599 ?auto_2272603 ) ) ( not ( = ?auto_2272599 ?auto_2272604 ) ) ( not ( = ?auto_2272599 ?auto_2272606 ) ) ( not ( = ?auto_2272598 ?auto_2272600 ) ) ( not ( = ?auto_2272598 ?auto_2272601 ) ) ( not ( = ?auto_2272598 ?auto_2272602 ) ) ( not ( = ?auto_2272598 ?auto_2272603 ) ) ( not ( = ?auto_2272598 ?auto_2272604 ) ) ( not ( = ?auto_2272598 ?auto_2272606 ) ) ( not ( = ?auto_2272600 ?auto_2272601 ) ) ( not ( = ?auto_2272600 ?auto_2272602 ) ) ( not ( = ?auto_2272600 ?auto_2272603 ) ) ( not ( = ?auto_2272600 ?auto_2272604 ) ) ( not ( = ?auto_2272600 ?auto_2272606 ) ) ( not ( = ?auto_2272601 ?auto_2272602 ) ) ( not ( = ?auto_2272601 ?auto_2272603 ) ) ( not ( = ?auto_2272601 ?auto_2272604 ) ) ( not ( = ?auto_2272601 ?auto_2272606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2272602 ?auto_2272603 ?auto_2272604 )
      ( MAKE-9CRATE-VERIFY ?auto_2272595 ?auto_2272596 ?auto_2272597 ?auto_2272599 ?auto_2272598 ?auto_2272600 ?auto_2272601 ?auto_2272602 ?auto_2272603 ?auto_2272604 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278160 - SURFACE
      ?auto_2278161 - SURFACE
      ?auto_2278162 - SURFACE
      ?auto_2278164 - SURFACE
      ?auto_2278163 - SURFACE
      ?auto_2278165 - SURFACE
      ?auto_2278166 - SURFACE
      ?auto_2278167 - SURFACE
      ?auto_2278168 - SURFACE
      ?auto_2278169 - SURFACE
      ?auto_2278170 - SURFACE
    )
    :vars
    (
      ?auto_2278172 - HOIST
      ?auto_2278171 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278172 ?auto_2278171 ) ( SURFACE-AT ?auto_2278169 ?auto_2278171 ) ( CLEAR ?auto_2278169 ) ( LIFTING ?auto_2278172 ?auto_2278170 ) ( IS-CRATE ?auto_2278170 ) ( not ( = ?auto_2278169 ?auto_2278170 ) ) ( ON ?auto_2278161 ?auto_2278160 ) ( ON ?auto_2278162 ?auto_2278161 ) ( ON ?auto_2278164 ?auto_2278162 ) ( ON ?auto_2278163 ?auto_2278164 ) ( ON ?auto_2278165 ?auto_2278163 ) ( ON ?auto_2278166 ?auto_2278165 ) ( ON ?auto_2278167 ?auto_2278166 ) ( ON ?auto_2278168 ?auto_2278167 ) ( ON ?auto_2278169 ?auto_2278168 ) ( not ( = ?auto_2278160 ?auto_2278161 ) ) ( not ( = ?auto_2278160 ?auto_2278162 ) ) ( not ( = ?auto_2278160 ?auto_2278164 ) ) ( not ( = ?auto_2278160 ?auto_2278163 ) ) ( not ( = ?auto_2278160 ?auto_2278165 ) ) ( not ( = ?auto_2278160 ?auto_2278166 ) ) ( not ( = ?auto_2278160 ?auto_2278167 ) ) ( not ( = ?auto_2278160 ?auto_2278168 ) ) ( not ( = ?auto_2278160 ?auto_2278169 ) ) ( not ( = ?auto_2278160 ?auto_2278170 ) ) ( not ( = ?auto_2278161 ?auto_2278162 ) ) ( not ( = ?auto_2278161 ?auto_2278164 ) ) ( not ( = ?auto_2278161 ?auto_2278163 ) ) ( not ( = ?auto_2278161 ?auto_2278165 ) ) ( not ( = ?auto_2278161 ?auto_2278166 ) ) ( not ( = ?auto_2278161 ?auto_2278167 ) ) ( not ( = ?auto_2278161 ?auto_2278168 ) ) ( not ( = ?auto_2278161 ?auto_2278169 ) ) ( not ( = ?auto_2278161 ?auto_2278170 ) ) ( not ( = ?auto_2278162 ?auto_2278164 ) ) ( not ( = ?auto_2278162 ?auto_2278163 ) ) ( not ( = ?auto_2278162 ?auto_2278165 ) ) ( not ( = ?auto_2278162 ?auto_2278166 ) ) ( not ( = ?auto_2278162 ?auto_2278167 ) ) ( not ( = ?auto_2278162 ?auto_2278168 ) ) ( not ( = ?auto_2278162 ?auto_2278169 ) ) ( not ( = ?auto_2278162 ?auto_2278170 ) ) ( not ( = ?auto_2278164 ?auto_2278163 ) ) ( not ( = ?auto_2278164 ?auto_2278165 ) ) ( not ( = ?auto_2278164 ?auto_2278166 ) ) ( not ( = ?auto_2278164 ?auto_2278167 ) ) ( not ( = ?auto_2278164 ?auto_2278168 ) ) ( not ( = ?auto_2278164 ?auto_2278169 ) ) ( not ( = ?auto_2278164 ?auto_2278170 ) ) ( not ( = ?auto_2278163 ?auto_2278165 ) ) ( not ( = ?auto_2278163 ?auto_2278166 ) ) ( not ( = ?auto_2278163 ?auto_2278167 ) ) ( not ( = ?auto_2278163 ?auto_2278168 ) ) ( not ( = ?auto_2278163 ?auto_2278169 ) ) ( not ( = ?auto_2278163 ?auto_2278170 ) ) ( not ( = ?auto_2278165 ?auto_2278166 ) ) ( not ( = ?auto_2278165 ?auto_2278167 ) ) ( not ( = ?auto_2278165 ?auto_2278168 ) ) ( not ( = ?auto_2278165 ?auto_2278169 ) ) ( not ( = ?auto_2278165 ?auto_2278170 ) ) ( not ( = ?auto_2278166 ?auto_2278167 ) ) ( not ( = ?auto_2278166 ?auto_2278168 ) ) ( not ( = ?auto_2278166 ?auto_2278169 ) ) ( not ( = ?auto_2278166 ?auto_2278170 ) ) ( not ( = ?auto_2278167 ?auto_2278168 ) ) ( not ( = ?auto_2278167 ?auto_2278169 ) ) ( not ( = ?auto_2278167 ?auto_2278170 ) ) ( not ( = ?auto_2278168 ?auto_2278169 ) ) ( not ( = ?auto_2278168 ?auto_2278170 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2278169 ?auto_2278170 )
      ( MAKE-10CRATE-VERIFY ?auto_2278160 ?auto_2278161 ?auto_2278162 ?auto_2278164 ?auto_2278163 ?auto_2278165 ?auto_2278166 ?auto_2278167 ?auto_2278168 ?auto_2278169 ?auto_2278170 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278254 - SURFACE
      ?auto_2278255 - SURFACE
      ?auto_2278256 - SURFACE
      ?auto_2278258 - SURFACE
      ?auto_2278257 - SURFACE
      ?auto_2278259 - SURFACE
      ?auto_2278260 - SURFACE
      ?auto_2278261 - SURFACE
      ?auto_2278262 - SURFACE
      ?auto_2278263 - SURFACE
      ?auto_2278264 - SURFACE
    )
    :vars
    (
      ?auto_2278266 - HOIST
      ?auto_2278267 - PLACE
      ?auto_2278265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278266 ?auto_2278267 ) ( SURFACE-AT ?auto_2278263 ?auto_2278267 ) ( CLEAR ?auto_2278263 ) ( IS-CRATE ?auto_2278264 ) ( not ( = ?auto_2278263 ?auto_2278264 ) ) ( TRUCK-AT ?auto_2278265 ?auto_2278267 ) ( AVAILABLE ?auto_2278266 ) ( IN ?auto_2278264 ?auto_2278265 ) ( ON ?auto_2278263 ?auto_2278262 ) ( not ( = ?auto_2278262 ?auto_2278263 ) ) ( not ( = ?auto_2278262 ?auto_2278264 ) ) ( ON ?auto_2278255 ?auto_2278254 ) ( ON ?auto_2278256 ?auto_2278255 ) ( ON ?auto_2278258 ?auto_2278256 ) ( ON ?auto_2278257 ?auto_2278258 ) ( ON ?auto_2278259 ?auto_2278257 ) ( ON ?auto_2278260 ?auto_2278259 ) ( ON ?auto_2278261 ?auto_2278260 ) ( ON ?auto_2278262 ?auto_2278261 ) ( not ( = ?auto_2278254 ?auto_2278255 ) ) ( not ( = ?auto_2278254 ?auto_2278256 ) ) ( not ( = ?auto_2278254 ?auto_2278258 ) ) ( not ( = ?auto_2278254 ?auto_2278257 ) ) ( not ( = ?auto_2278254 ?auto_2278259 ) ) ( not ( = ?auto_2278254 ?auto_2278260 ) ) ( not ( = ?auto_2278254 ?auto_2278261 ) ) ( not ( = ?auto_2278254 ?auto_2278262 ) ) ( not ( = ?auto_2278254 ?auto_2278263 ) ) ( not ( = ?auto_2278254 ?auto_2278264 ) ) ( not ( = ?auto_2278255 ?auto_2278256 ) ) ( not ( = ?auto_2278255 ?auto_2278258 ) ) ( not ( = ?auto_2278255 ?auto_2278257 ) ) ( not ( = ?auto_2278255 ?auto_2278259 ) ) ( not ( = ?auto_2278255 ?auto_2278260 ) ) ( not ( = ?auto_2278255 ?auto_2278261 ) ) ( not ( = ?auto_2278255 ?auto_2278262 ) ) ( not ( = ?auto_2278255 ?auto_2278263 ) ) ( not ( = ?auto_2278255 ?auto_2278264 ) ) ( not ( = ?auto_2278256 ?auto_2278258 ) ) ( not ( = ?auto_2278256 ?auto_2278257 ) ) ( not ( = ?auto_2278256 ?auto_2278259 ) ) ( not ( = ?auto_2278256 ?auto_2278260 ) ) ( not ( = ?auto_2278256 ?auto_2278261 ) ) ( not ( = ?auto_2278256 ?auto_2278262 ) ) ( not ( = ?auto_2278256 ?auto_2278263 ) ) ( not ( = ?auto_2278256 ?auto_2278264 ) ) ( not ( = ?auto_2278258 ?auto_2278257 ) ) ( not ( = ?auto_2278258 ?auto_2278259 ) ) ( not ( = ?auto_2278258 ?auto_2278260 ) ) ( not ( = ?auto_2278258 ?auto_2278261 ) ) ( not ( = ?auto_2278258 ?auto_2278262 ) ) ( not ( = ?auto_2278258 ?auto_2278263 ) ) ( not ( = ?auto_2278258 ?auto_2278264 ) ) ( not ( = ?auto_2278257 ?auto_2278259 ) ) ( not ( = ?auto_2278257 ?auto_2278260 ) ) ( not ( = ?auto_2278257 ?auto_2278261 ) ) ( not ( = ?auto_2278257 ?auto_2278262 ) ) ( not ( = ?auto_2278257 ?auto_2278263 ) ) ( not ( = ?auto_2278257 ?auto_2278264 ) ) ( not ( = ?auto_2278259 ?auto_2278260 ) ) ( not ( = ?auto_2278259 ?auto_2278261 ) ) ( not ( = ?auto_2278259 ?auto_2278262 ) ) ( not ( = ?auto_2278259 ?auto_2278263 ) ) ( not ( = ?auto_2278259 ?auto_2278264 ) ) ( not ( = ?auto_2278260 ?auto_2278261 ) ) ( not ( = ?auto_2278260 ?auto_2278262 ) ) ( not ( = ?auto_2278260 ?auto_2278263 ) ) ( not ( = ?auto_2278260 ?auto_2278264 ) ) ( not ( = ?auto_2278261 ?auto_2278262 ) ) ( not ( = ?auto_2278261 ?auto_2278263 ) ) ( not ( = ?auto_2278261 ?auto_2278264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2278262 ?auto_2278263 ?auto_2278264 )
      ( MAKE-10CRATE-VERIFY ?auto_2278254 ?auto_2278255 ?auto_2278256 ?auto_2278258 ?auto_2278257 ?auto_2278259 ?auto_2278260 ?auto_2278261 ?auto_2278262 ?auto_2278263 ?auto_2278264 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278359 - SURFACE
      ?auto_2278360 - SURFACE
      ?auto_2278361 - SURFACE
      ?auto_2278363 - SURFACE
      ?auto_2278362 - SURFACE
      ?auto_2278364 - SURFACE
      ?auto_2278365 - SURFACE
      ?auto_2278366 - SURFACE
      ?auto_2278367 - SURFACE
      ?auto_2278368 - SURFACE
      ?auto_2278369 - SURFACE
    )
    :vars
    (
      ?auto_2278371 - HOIST
      ?auto_2278372 - PLACE
      ?auto_2278370 - TRUCK
      ?auto_2278373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278371 ?auto_2278372 ) ( SURFACE-AT ?auto_2278368 ?auto_2278372 ) ( CLEAR ?auto_2278368 ) ( IS-CRATE ?auto_2278369 ) ( not ( = ?auto_2278368 ?auto_2278369 ) ) ( AVAILABLE ?auto_2278371 ) ( IN ?auto_2278369 ?auto_2278370 ) ( ON ?auto_2278368 ?auto_2278367 ) ( not ( = ?auto_2278367 ?auto_2278368 ) ) ( not ( = ?auto_2278367 ?auto_2278369 ) ) ( TRUCK-AT ?auto_2278370 ?auto_2278373 ) ( not ( = ?auto_2278373 ?auto_2278372 ) ) ( ON ?auto_2278360 ?auto_2278359 ) ( ON ?auto_2278361 ?auto_2278360 ) ( ON ?auto_2278363 ?auto_2278361 ) ( ON ?auto_2278362 ?auto_2278363 ) ( ON ?auto_2278364 ?auto_2278362 ) ( ON ?auto_2278365 ?auto_2278364 ) ( ON ?auto_2278366 ?auto_2278365 ) ( ON ?auto_2278367 ?auto_2278366 ) ( not ( = ?auto_2278359 ?auto_2278360 ) ) ( not ( = ?auto_2278359 ?auto_2278361 ) ) ( not ( = ?auto_2278359 ?auto_2278363 ) ) ( not ( = ?auto_2278359 ?auto_2278362 ) ) ( not ( = ?auto_2278359 ?auto_2278364 ) ) ( not ( = ?auto_2278359 ?auto_2278365 ) ) ( not ( = ?auto_2278359 ?auto_2278366 ) ) ( not ( = ?auto_2278359 ?auto_2278367 ) ) ( not ( = ?auto_2278359 ?auto_2278368 ) ) ( not ( = ?auto_2278359 ?auto_2278369 ) ) ( not ( = ?auto_2278360 ?auto_2278361 ) ) ( not ( = ?auto_2278360 ?auto_2278363 ) ) ( not ( = ?auto_2278360 ?auto_2278362 ) ) ( not ( = ?auto_2278360 ?auto_2278364 ) ) ( not ( = ?auto_2278360 ?auto_2278365 ) ) ( not ( = ?auto_2278360 ?auto_2278366 ) ) ( not ( = ?auto_2278360 ?auto_2278367 ) ) ( not ( = ?auto_2278360 ?auto_2278368 ) ) ( not ( = ?auto_2278360 ?auto_2278369 ) ) ( not ( = ?auto_2278361 ?auto_2278363 ) ) ( not ( = ?auto_2278361 ?auto_2278362 ) ) ( not ( = ?auto_2278361 ?auto_2278364 ) ) ( not ( = ?auto_2278361 ?auto_2278365 ) ) ( not ( = ?auto_2278361 ?auto_2278366 ) ) ( not ( = ?auto_2278361 ?auto_2278367 ) ) ( not ( = ?auto_2278361 ?auto_2278368 ) ) ( not ( = ?auto_2278361 ?auto_2278369 ) ) ( not ( = ?auto_2278363 ?auto_2278362 ) ) ( not ( = ?auto_2278363 ?auto_2278364 ) ) ( not ( = ?auto_2278363 ?auto_2278365 ) ) ( not ( = ?auto_2278363 ?auto_2278366 ) ) ( not ( = ?auto_2278363 ?auto_2278367 ) ) ( not ( = ?auto_2278363 ?auto_2278368 ) ) ( not ( = ?auto_2278363 ?auto_2278369 ) ) ( not ( = ?auto_2278362 ?auto_2278364 ) ) ( not ( = ?auto_2278362 ?auto_2278365 ) ) ( not ( = ?auto_2278362 ?auto_2278366 ) ) ( not ( = ?auto_2278362 ?auto_2278367 ) ) ( not ( = ?auto_2278362 ?auto_2278368 ) ) ( not ( = ?auto_2278362 ?auto_2278369 ) ) ( not ( = ?auto_2278364 ?auto_2278365 ) ) ( not ( = ?auto_2278364 ?auto_2278366 ) ) ( not ( = ?auto_2278364 ?auto_2278367 ) ) ( not ( = ?auto_2278364 ?auto_2278368 ) ) ( not ( = ?auto_2278364 ?auto_2278369 ) ) ( not ( = ?auto_2278365 ?auto_2278366 ) ) ( not ( = ?auto_2278365 ?auto_2278367 ) ) ( not ( = ?auto_2278365 ?auto_2278368 ) ) ( not ( = ?auto_2278365 ?auto_2278369 ) ) ( not ( = ?auto_2278366 ?auto_2278367 ) ) ( not ( = ?auto_2278366 ?auto_2278368 ) ) ( not ( = ?auto_2278366 ?auto_2278369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2278367 ?auto_2278368 ?auto_2278369 )
      ( MAKE-10CRATE-VERIFY ?auto_2278359 ?auto_2278360 ?auto_2278361 ?auto_2278363 ?auto_2278362 ?auto_2278364 ?auto_2278365 ?auto_2278366 ?auto_2278367 ?auto_2278368 ?auto_2278369 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278474 - SURFACE
      ?auto_2278475 - SURFACE
      ?auto_2278476 - SURFACE
      ?auto_2278478 - SURFACE
      ?auto_2278477 - SURFACE
      ?auto_2278479 - SURFACE
      ?auto_2278480 - SURFACE
      ?auto_2278481 - SURFACE
      ?auto_2278482 - SURFACE
      ?auto_2278483 - SURFACE
      ?auto_2278484 - SURFACE
    )
    :vars
    (
      ?auto_2278489 - HOIST
      ?auto_2278488 - PLACE
      ?auto_2278485 - TRUCK
      ?auto_2278487 - PLACE
      ?auto_2278486 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278489 ?auto_2278488 ) ( SURFACE-AT ?auto_2278483 ?auto_2278488 ) ( CLEAR ?auto_2278483 ) ( IS-CRATE ?auto_2278484 ) ( not ( = ?auto_2278483 ?auto_2278484 ) ) ( AVAILABLE ?auto_2278489 ) ( ON ?auto_2278483 ?auto_2278482 ) ( not ( = ?auto_2278482 ?auto_2278483 ) ) ( not ( = ?auto_2278482 ?auto_2278484 ) ) ( TRUCK-AT ?auto_2278485 ?auto_2278487 ) ( not ( = ?auto_2278487 ?auto_2278488 ) ) ( HOIST-AT ?auto_2278486 ?auto_2278487 ) ( LIFTING ?auto_2278486 ?auto_2278484 ) ( not ( = ?auto_2278489 ?auto_2278486 ) ) ( ON ?auto_2278475 ?auto_2278474 ) ( ON ?auto_2278476 ?auto_2278475 ) ( ON ?auto_2278478 ?auto_2278476 ) ( ON ?auto_2278477 ?auto_2278478 ) ( ON ?auto_2278479 ?auto_2278477 ) ( ON ?auto_2278480 ?auto_2278479 ) ( ON ?auto_2278481 ?auto_2278480 ) ( ON ?auto_2278482 ?auto_2278481 ) ( not ( = ?auto_2278474 ?auto_2278475 ) ) ( not ( = ?auto_2278474 ?auto_2278476 ) ) ( not ( = ?auto_2278474 ?auto_2278478 ) ) ( not ( = ?auto_2278474 ?auto_2278477 ) ) ( not ( = ?auto_2278474 ?auto_2278479 ) ) ( not ( = ?auto_2278474 ?auto_2278480 ) ) ( not ( = ?auto_2278474 ?auto_2278481 ) ) ( not ( = ?auto_2278474 ?auto_2278482 ) ) ( not ( = ?auto_2278474 ?auto_2278483 ) ) ( not ( = ?auto_2278474 ?auto_2278484 ) ) ( not ( = ?auto_2278475 ?auto_2278476 ) ) ( not ( = ?auto_2278475 ?auto_2278478 ) ) ( not ( = ?auto_2278475 ?auto_2278477 ) ) ( not ( = ?auto_2278475 ?auto_2278479 ) ) ( not ( = ?auto_2278475 ?auto_2278480 ) ) ( not ( = ?auto_2278475 ?auto_2278481 ) ) ( not ( = ?auto_2278475 ?auto_2278482 ) ) ( not ( = ?auto_2278475 ?auto_2278483 ) ) ( not ( = ?auto_2278475 ?auto_2278484 ) ) ( not ( = ?auto_2278476 ?auto_2278478 ) ) ( not ( = ?auto_2278476 ?auto_2278477 ) ) ( not ( = ?auto_2278476 ?auto_2278479 ) ) ( not ( = ?auto_2278476 ?auto_2278480 ) ) ( not ( = ?auto_2278476 ?auto_2278481 ) ) ( not ( = ?auto_2278476 ?auto_2278482 ) ) ( not ( = ?auto_2278476 ?auto_2278483 ) ) ( not ( = ?auto_2278476 ?auto_2278484 ) ) ( not ( = ?auto_2278478 ?auto_2278477 ) ) ( not ( = ?auto_2278478 ?auto_2278479 ) ) ( not ( = ?auto_2278478 ?auto_2278480 ) ) ( not ( = ?auto_2278478 ?auto_2278481 ) ) ( not ( = ?auto_2278478 ?auto_2278482 ) ) ( not ( = ?auto_2278478 ?auto_2278483 ) ) ( not ( = ?auto_2278478 ?auto_2278484 ) ) ( not ( = ?auto_2278477 ?auto_2278479 ) ) ( not ( = ?auto_2278477 ?auto_2278480 ) ) ( not ( = ?auto_2278477 ?auto_2278481 ) ) ( not ( = ?auto_2278477 ?auto_2278482 ) ) ( not ( = ?auto_2278477 ?auto_2278483 ) ) ( not ( = ?auto_2278477 ?auto_2278484 ) ) ( not ( = ?auto_2278479 ?auto_2278480 ) ) ( not ( = ?auto_2278479 ?auto_2278481 ) ) ( not ( = ?auto_2278479 ?auto_2278482 ) ) ( not ( = ?auto_2278479 ?auto_2278483 ) ) ( not ( = ?auto_2278479 ?auto_2278484 ) ) ( not ( = ?auto_2278480 ?auto_2278481 ) ) ( not ( = ?auto_2278480 ?auto_2278482 ) ) ( not ( = ?auto_2278480 ?auto_2278483 ) ) ( not ( = ?auto_2278480 ?auto_2278484 ) ) ( not ( = ?auto_2278481 ?auto_2278482 ) ) ( not ( = ?auto_2278481 ?auto_2278483 ) ) ( not ( = ?auto_2278481 ?auto_2278484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2278482 ?auto_2278483 ?auto_2278484 )
      ( MAKE-10CRATE-VERIFY ?auto_2278474 ?auto_2278475 ?auto_2278476 ?auto_2278478 ?auto_2278477 ?auto_2278479 ?auto_2278480 ?auto_2278481 ?auto_2278482 ?auto_2278483 ?auto_2278484 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278599 - SURFACE
      ?auto_2278600 - SURFACE
      ?auto_2278601 - SURFACE
      ?auto_2278603 - SURFACE
      ?auto_2278602 - SURFACE
      ?auto_2278604 - SURFACE
      ?auto_2278605 - SURFACE
      ?auto_2278606 - SURFACE
      ?auto_2278607 - SURFACE
      ?auto_2278608 - SURFACE
      ?auto_2278609 - SURFACE
    )
    :vars
    (
      ?auto_2278610 - HOIST
      ?auto_2278612 - PLACE
      ?auto_2278615 - TRUCK
      ?auto_2278611 - PLACE
      ?auto_2278613 - HOIST
      ?auto_2278614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278610 ?auto_2278612 ) ( SURFACE-AT ?auto_2278608 ?auto_2278612 ) ( CLEAR ?auto_2278608 ) ( IS-CRATE ?auto_2278609 ) ( not ( = ?auto_2278608 ?auto_2278609 ) ) ( AVAILABLE ?auto_2278610 ) ( ON ?auto_2278608 ?auto_2278607 ) ( not ( = ?auto_2278607 ?auto_2278608 ) ) ( not ( = ?auto_2278607 ?auto_2278609 ) ) ( TRUCK-AT ?auto_2278615 ?auto_2278611 ) ( not ( = ?auto_2278611 ?auto_2278612 ) ) ( HOIST-AT ?auto_2278613 ?auto_2278611 ) ( not ( = ?auto_2278610 ?auto_2278613 ) ) ( AVAILABLE ?auto_2278613 ) ( SURFACE-AT ?auto_2278609 ?auto_2278611 ) ( ON ?auto_2278609 ?auto_2278614 ) ( CLEAR ?auto_2278609 ) ( not ( = ?auto_2278608 ?auto_2278614 ) ) ( not ( = ?auto_2278609 ?auto_2278614 ) ) ( not ( = ?auto_2278607 ?auto_2278614 ) ) ( ON ?auto_2278600 ?auto_2278599 ) ( ON ?auto_2278601 ?auto_2278600 ) ( ON ?auto_2278603 ?auto_2278601 ) ( ON ?auto_2278602 ?auto_2278603 ) ( ON ?auto_2278604 ?auto_2278602 ) ( ON ?auto_2278605 ?auto_2278604 ) ( ON ?auto_2278606 ?auto_2278605 ) ( ON ?auto_2278607 ?auto_2278606 ) ( not ( = ?auto_2278599 ?auto_2278600 ) ) ( not ( = ?auto_2278599 ?auto_2278601 ) ) ( not ( = ?auto_2278599 ?auto_2278603 ) ) ( not ( = ?auto_2278599 ?auto_2278602 ) ) ( not ( = ?auto_2278599 ?auto_2278604 ) ) ( not ( = ?auto_2278599 ?auto_2278605 ) ) ( not ( = ?auto_2278599 ?auto_2278606 ) ) ( not ( = ?auto_2278599 ?auto_2278607 ) ) ( not ( = ?auto_2278599 ?auto_2278608 ) ) ( not ( = ?auto_2278599 ?auto_2278609 ) ) ( not ( = ?auto_2278599 ?auto_2278614 ) ) ( not ( = ?auto_2278600 ?auto_2278601 ) ) ( not ( = ?auto_2278600 ?auto_2278603 ) ) ( not ( = ?auto_2278600 ?auto_2278602 ) ) ( not ( = ?auto_2278600 ?auto_2278604 ) ) ( not ( = ?auto_2278600 ?auto_2278605 ) ) ( not ( = ?auto_2278600 ?auto_2278606 ) ) ( not ( = ?auto_2278600 ?auto_2278607 ) ) ( not ( = ?auto_2278600 ?auto_2278608 ) ) ( not ( = ?auto_2278600 ?auto_2278609 ) ) ( not ( = ?auto_2278600 ?auto_2278614 ) ) ( not ( = ?auto_2278601 ?auto_2278603 ) ) ( not ( = ?auto_2278601 ?auto_2278602 ) ) ( not ( = ?auto_2278601 ?auto_2278604 ) ) ( not ( = ?auto_2278601 ?auto_2278605 ) ) ( not ( = ?auto_2278601 ?auto_2278606 ) ) ( not ( = ?auto_2278601 ?auto_2278607 ) ) ( not ( = ?auto_2278601 ?auto_2278608 ) ) ( not ( = ?auto_2278601 ?auto_2278609 ) ) ( not ( = ?auto_2278601 ?auto_2278614 ) ) ( not ( = ?auto_2278603 ?auto_2278602 ) ) ( not ( = ?auto_2278603 ?auto_2278604 ) ) ( not ( = ?auto_2278603 ?auto_2278605 ) ) ( not ( = ?auto_2278603 ?auto_2278606 ) ) ( not ( = ?auto_2278603 ?auto_2278607 ) ) ( not ( = ?auto_2278603 ?auto_2278608 ) ) ( not ( = ?auto_2278603 ?auto_2278609 ) ) ( not ( = ?auto_2278603 ?auto_2278614 ) ) ( not ( = ?auto_2278602 ?auto_2278604 ) ) ( not ( = ?auto_2278602 ?auto_2278605 ) ) ( not ( = ?auto_2278602 ?auto_2278606 ) ) ( not ( = ?auto_2278602 ?auto_2278607 ) ) ( not ( = ?auto_2278602 ?auto_2278608 ) ) ( not ( = ?auto_2278602 ?auto_2278609 ) ) ( not ( = ?auto_2278602 ?auto_2278614 ) ) ( not ( = ?auto_2278604 ?auto_2278605 ) ) ( not ( = ?auto_2278604 ?auto_2278606 ) ) ( not ( = ?auto_2278604 ?auto_2278607 ) ) ( not ( = ?auto_2278604 ?auto_2278608 ) ) ( not ( = ?auto_2278604 ?auto_2278609 ) ) ( not ( = ?auto_2278604 ?auto_2278614 ) ) ( not ( = ?auto_2278605 ?auto_2278606 ) ) ( not ( = ?auto_2278605 ?auto_2278607 ) ) ( not ( = ?auto_2278605 ?auto_2278608 ) ) ( not ( = ?auto_2278605 ?auto_2278609 ) ) ( not ( = ?auto_2278605 ?auto_2278614 ) ) ( not ( = ?auto_2278606 ?auto_2278607 ) ) ( not ( = ?auto_2278606 ?auto_2278608 ) ) ( not ( = ?auto_2278606 ?auto_2278609 ) ) ( not ( = ?auto_2278606 ?auto_2278614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2278607 ?auto_2278608 ?auto_2278609 )
      ( MAKE-10CRATE-VERIFY ?auto_2278599 ?auto_2278600 ?auto_2278601 ?auto_2278603 ?auto_2278602 ?auto_2278604 ?auto_2278605 ?auto_2278606 ?auto_2278607 ?auto_2278608 ?auto_2278609 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278725 - SURFACE
      ?auto_2278726 - SURFACE
      ?auto_2278727 - SURFACE
      ?auto_2278729 - SURFACE
      ?auto_2278728 - SURFACE
      ?auto_2278730 - SURFACE
      ?auto_2278731 - SURFACE
      ?auto_2278732 - SURFACE
      ?auto_2278733 - SURFACE
      ?auto_2278734 - SURFACE
      ?auto_2278735 - SURFACE
    )
    :vars
    (
      ?auto_2278738 - HOIST
      ?auto_2278737 - PLACE
      ?auto_2278736 - PLACE
      ?auto_2278739 - HOIST
      ?auto_2278741 - SURFACE
      ?auto_2278740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278738 ?auto_2278737 ) ( SURFACE-AT ?auto_2278734 ?auto_2278737 ) ( CLEAR ?auto_2278734 ) ( IS-CRATE ?auto_2278735 ) ( not ( = ?auto_2278734 ?auto_2278735 ) ) ( AVAILABLE ?auto_2278738 ) ( ON ?auto_2278734 ?auto_2278733 ) ( not ( = ?auto_2278733 ?auto_2278734 ) ) ( not ( = ?auto_2278733 ?auto_2278735 ) ) ( not ( = ?auto_2278736 ?auto_2278737 ) ) ( HOIST-AT ?auto_2278739 ?auto_2278736 ) ( not ( = ?auto_2278738 ?auto_2278739 ) ) ( AVAILABLE ?auto_2278739 ) ( SURFACE-AT ?auto_2278735 ?auto_2278736 ) ( ON ?auto_2278735 ?auto_2278741 ) ( CLEAR ?auto_2278735 ) ( not ( = ?auto_2278734 ?auto_2278741 ) ) ( not ( = ?auto_2278735 ?auto_2278741 ) ) ( not ( = ?auto_2278733 ?auto_2278741 ) ) ( TRUCK-AT ?auto_2278740 ?auto_2278737 ) ( ON ?auto_2278726 ?auto_2278725 ) ( ON ?auto_2278727 ?auto_2278726 ) ( ON ?auto_2278729 ?auto_2278727 ) ( ON ?auto_2278728 ?auto_2278729 ) ( ON ?auto_2278730 ?auto_2278728 ) ( ON ?auto_2278731 ?auto_2278730 ) ( ON ?auto_2278732 ?auto_2278731 ) ( ON ?auto_2278733 ?auto_2278732 ) ( not ( = ?auto_2278725 ?auto_2278726 ) ) ( not ( = ?auto_2278725 ?auto_2278727 ) ) ( not ( = ?auto_2278725 ?auto_2278729 ) ) ( not ( = ?auto_2278725 ?auto_2278728 ) ) ( not ( = ?auto_2278725 ?auto_2278730 ) ) ( not ( = ?auto_2278725 ?auto_2278731 ) ) ( not ( = ?auto_2278725 ?auto_2278732 ) ) ( not ( = ?auto_2278725 ?auto_2278733 ) ) ( not ( = ?auto_2278725 ?auto_2278734 ) ) ( not ( = ?auto_2278725 ?auto_2278735 ) ) ( not ( = ?auto_2278725 ?auto_2278741 ) ) ( not ( = ?auto_2278726 ?auto_2278727 ) ) ( not ( = ?auto_2278726 ?auto_2278729 ) ) ( not ( = ?auto_2278726 ?auto_2278728 ) ) ( not ( = ?auto_2278726 ?auto_2278730 ) ) ( not ( = ?auto_2278726 ?auto_2278731 ) ) ( not ( = ?auto_2278726 ?auto_2278732 ) ) ( not ( = ?auto_2278726 ?auto_2278733 ) ) ( not ( = ?auto_2278726 ?auto_2278734 ) ) ( not ( = ?auto_2278726 ?auto_2278735 ) ) ( not ( = ?auto_2278726 ?auto_2278741 ) ) ( not ( = ?auto_2278727 ?auto_2278729 ) ) ( not ( = ?auto_2278727 ?auto_2278728 ) ) ( not ( = ?auto_2278727 ?auto_2278730 ) ) ( not ( = ?auto_2278727 ?auto_2278731 ) ) ( not ( = ?auto_2278727 ?auto_2278732 ) ) ( not ( = ?auto_2278727 ?auto_2278733 ) ) ( not ( = ?auto_2278727 ?auto_2278734 ) ) ( not ( = ?auto_2278727 ?auto_2278735 ) ) ( not ( = ?auto_2278727 ?auto_2278741 ) ) ( not ( = ?auto_2278729 ?auto_2278728 ) ) ( not ( = ?auto_2278729 ?auto_2278730 ) ) ( not ( = ?auto_2278729 ?auto_2278731 ) ) ( not ( = ?auto_2278729 ?auto_2278732 ) ) ( not ( = ?auto_2278729 ?auto_2278733 ) ) ( not ( = ?auto_2278729 ?auto_2278734 ) ) ( not ( = ?auto_2278729 ?auto_2278735 ) ) ( not ( = ?auto_2278729 ?auto_2278741 ) ) ( not ( = ?auto_2278728 ?auto_2278730 ) ) ( not ( = ?auto_2278728 ?auto_2278731 ) ) ( not ( = ?auto_2278728 ?auto_2278732 ) ) ( not ( = ?auto_2278728 ?auto_2278733 ) ) ( not ( = ?auto_2278728 ?auto_2278734 ) ) ( not ( = ?auto_2278728 ?auto_2278735 ) ) ( not ( = ?auto_2278728 ?auto_2278741 ) ) ( not ( = ?auto_2278730 ?auto_2278731 ) ) ( not ( = ?auto_2278730 ?auto_2278732 ) ) ( not ( = ?auto_2278730 ?auto_2278733 ) ) ( not ( = ?auto_2278730 ?auto_2278734 ) ) ( not ( = ?auto_2278730 ?auto_2278735 ) ) ( not ( = ?auto_2278730 ?auto_2278741 ) ) ( not ( = ?auto_2278731 ?auto_2278732 ) ) ( not ( = ?auto_2278731 ?auto_2278733 ) ) ( not ( = ?auto_2278731 ?auto_2278734 ) ) ( not ( = ?auto_2278731 ?auto_2278735 ) ) ( not ( = ?auto_2278731 ?auto_2278741 ) ) ( not ( = ?auto_2278732 ?auto_2278733 ) ) ( not ( = ?auto_2278732 ?auto_2278734 ) ) ( not ( = ?auto_2278732 ?auto_2278735 ) ) ( not ( = ?auto_2278732 ?auto_2278741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2278733 ?auto_2278734 ?auto_2278735 )
      ( MAKE-10CRATE-VERIFY ?auto_2278725 ?auto_2278726 ?auto_2278727 ?auto_2278729 ?auto_2278728 ?auto_2278730 ?auto_2278731 ?auto_2278732 ?auto_2278733 ?auto_2278734 ?auto_2278735 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278851 - SURFACE
      ?auto_2278852 - SURFACE
      ?auto_2278853 - SURFACE
      ?auto_2278855 - SURFACE
      ?auto_2278854 - SURFACE
      ?auto_2278856 - SURFACE
      ?auto_2278857 - SURFACE
      ?auto_2278858 - SURFACE
      ?auto_2278859 - SURFACE
      ?auto_2278860 - SURFACE
      ?auto_2278861 - SURFACE
    )
    :vars
    (
      ?auto_2278865 - HOIST
      ?auto_2278862 - PLACE
      ?auto_2278867 - PLACE
      ?auto_2278866 - HOIST
      ?auto_2278864 - SURFACE
      ?auto_2278863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278865 ?auto_2278862 ) ( IS-CRATE ?auto_2278861 ) ( not ( = ?auto_2278860 ?auto_2278861 ) ) ( not ( = ?auto_2278859 ?auto_2278860 ) ) ( not ( = ?auto_2278859 ?auto_2278861 ) ) ( not ( = ?auto_2278867 ?auto_2278862 ) ) ( HOIST-AT ?auto_2278866 ?auto_2278867 ) ( not ( = ?auto_2278865 ?auto_2278866 ) ) ( AVAILABLE ?auto_2278866 ) ( SURFACE-AT ?auto_2278861 ?auto_2278867 ) ( ON ?auto_2278861 ?auto_2278864 ) ( CLEAR ?auto_2278861 ) ( not ( = ?auto_2278860 ?auto_2278864 ) ) ( not ( = ?auto_2278861 ?auto_2278864 ) ) ( not ( = ?auto_2278859 ?auto_2278864 ) ) ( TRUCK-AT ?auto_2278863 ?auto_2278862 ) ( SURFACE-AT ?auto_2278859 ?auto_2278862 ) ( CLEAR ?auto_2278859 ) ( LIFTING ?auto_2278865 ?auto_2278860 ) ( IS-CRATE ?auto_2278860 ) ( ON ?auto_2278852 ?auto_2278851 ) ( ON ?auto_2278853 ?auto_2278852 ) ( ON ?auto_2278855 ?auto_2278853 ) ( ON ?auto_2278854 ?auto_2278855 ) ( ON ?auto_2278856 ?auto_2278854 ) ( ON ?auto_2278857 ?auto_2278856 ) ( ON ?auto_2278858 ?auto_2278857 ) ( ON ?auto_2278859 ?auto_2278858 ) ( not ( = ?auto_2278851 ?auto_2278852 ) ) ( not ( = ?auto_2278851 ?auto_2278853 ) ) ( not ( = ?auto_2278851 ?auto_2278855 ) ) ( not ( = ?auto_2278851 ?auto_2278854 ) ) ( not ( = ?auto_2278851 ?auto_2278856 ) ) ( not ( = ?auto_2278851 ?auto_2278857 ) ) ( not ( = ?auto_2278851 ?auto_2278858 ) ) ( not ( = ?auto_2278851 ?auto_2278859 ) ) ( not ( = ?auto_2278851 ?auto_2278860 ) ) ( not ( = ?auto_2278851 ?auto_2278861 ) ) ( not ( = ?auto_2278851 ?auto_2278864 ) ) ( not ( = ?auto_2278852 ?auto_2278853 ) ) ( not ( = ?auto_2278852 ?auto_2278855 ) ) ( not ( = ?auto_2278852 ?auto_2278854 ) ) ( not ( = ?auto_2278852 ?auto_2278856 ) ) ( not ( = ?auto_2278852 ?auto_2278857 ) ) ( not ( = ?auto_2278852 ?auto_2278858 ) ) ( not ( = ?auto_2278852 ?auto_2278859 ) ) ( not ( = ?auto_2278852 ?auto_2278860 ) ) ( not ( = ?auto_2278852 ?auto_2278861 ) ) ( not ( = ?auto_2278852 ?auto_2278864 ) ) ( not ( = ?auto_2278853 ?auto_2278855 ) ) ( not ( = ?auto_2278853 ?auto_2278854 ) ) ( not ( = ?auto_2278853 ?auto_2278856 ) ) ( not ( = ?auto_2278853 ?auto_2278857 ) ) ( not ( = ?auto_2278853 ?auto_2278858 ) ) ( not ( = ?auto_2278853 ?auto_2278859 ) ) ( not ( = ?auto_2278853 ?auto_2278860 ) ) ( not ( = ?auto_2278853 ?auto_2278861 ) ) ( not ( = ?auto_2278853 ?auto_2278864 ) ) ( not ( = ?auto_2278855 ?auto_2278854 ) ) ( not ( = ?auto_2278855 ?auto_2278856 ) ) ( not ( = ?auto_2278855 ?auto_2278857 ) ) ( not ( = ?auto_2278855 ?auto_2278858 ) ) ( not ( = ?auto_2278855 ?auto_2278859 ) ) ( not ( = ?auto_2278855 ?auto_2278860 ) ) ( not ( = ?auto_2278855 ?auto_2278861 ) ) ( not ( = ?auto_2278855 ?auto_2278864 ) ) ( not ( = ?auto_2278854 ?auto_2278856 ) ) ( not ( = ?auto_2278854 ?auto_2278857 ) ) ( not ( = ?auto_2278854 ?auto_2278858 ) ) ( not ( = ?auto_2278854 ?auto_2278859 ) ) ( not ( = ?auto_2278854 ?auto_2278860 ) ) ( not ( = ?auto_2278854 ?auto_2278861 ) ) ( not ( = ?auto_2278854 ?auto_2278864 ) ) ( not ( = ?auto_2278856 ?auto_2278857 ) ) ( not ( = ?auto_2278856 ?auto_2278858 ) ) ( not ( = ?auto_2278856 ?auto_2278859 ) ) ( not ( = ?auto_2278856 ?auto_2278860 ) ) ( not ( = ?auto_2278856 ?auto_2278861 ) ) ( not ( = ?auto_2278856 ?auto_2278864 ) ) ( not ( = ?auto_2278857 ?auto_2278858 ) ) ( not ( = ?auto_2278857 ?auto_2278859 ) ) ( not ( = ?auto_2278857 ?auto_2278860 ) ) ( not ( = ?auto_2278857 ?auto_2278861 ) ) ( not ( = ?auto_2278857 ?auto_2278864 ) ) ( not ( = ?auto_2278858 ?auto_2278859 ) ) ( not ( = ?auto_2278858 ?auto_2278860 ) ) ( not ( = ?auto_2278858 ?auto_2278861 ) ) ( not ( = ?auto_2278858 ?auto_2278864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2278859 ?auto_2278860 ?auto_2278861 )
      ( MAKE-10CRATE-VERIFY ?auto_2278851 ?auto_2278852 ?auto_2278853 ?auto_2278855 ?auto_2278854 ?auto_2278856 ?auto_2278857 ?auto_2278858 ?auto_2278859 ?auto_2278860 ?auto_2278861 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2278977 - SURFACE
      ?auto_2278978 - SURFACE
      ?auto_2278979 - SURFACE
      ?auto_2278981 - SURFACE
      ?auto_2278980 - SURFACE
      ?auto_2278982 - SURFACE
      ?auto_2278983 - SURFACE
      ?auto_2278984 - SURFACE
      ?auto_2278985 - SURFACE
      ?auto_2278986 - SURFACE
      ?auto_2278987 - SURFACE
    )
    :vars
    (
      ?auto_2278988 - HOIST
      ?auto_2278989 - PLACE
      ?auto_2278993 - PLACE
      ?auto_2278992 - HOIST
      ?auto_2278991 - SURFACE
      ?auto_2278990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278988 ?auto_2278989 ) ( IS-CRATE ?auto_2278987 ) ( not ( = ?auto_2278986 ?auto_2278987 ) ) ( not ( = ?auto_2278985 ?auto_2278986 ) ) ( not ( = ?auto_2278985 ?auto_2278987 ) ) ( not ( = ?auto_2278993 ?auto_2278989 ) ) ( HOIST-AT ?auto_2278992 ?auto_2278993 ) ( not ( = ?auto_2278988 ?auto_2278992 ) ) ( AVAILABLE ?auto_2278992 ) ( SURFACE-AT ?auto_2278987 ?auto_2278993 ) ( ON ?auto_2278987 ?auto_2278991 ) ( CLEAR ?auto_2278987 ) ( not ( = ?auto_2278986 ?auto_2278991 ) ) ( not ( = ?auto_2278987 ?auto_2278991 ) ) ( not ( = ?auto_2278985 ?auto_2278991 ) ) ( TRUCK-AT ?auto_2278990 ?auto_2278989 ) ( SURFACE-AT ?auto_2278985 ?auto_2278989 ) ( CLEAR ?auto_2278985 ) ( IS-CRATE ?auto_2278986 ) ( AVAILABLE ?auto_2278988 ) ( IN ?auto_2278986 ?auto_2278990 ) ( ON ?auto_2278978 ?auto_2278977 ) ( ON ?auto_2278979 ?auto_2278978 ) ( ON ?auto_2278981 ?auto_2278979 ) ( ON ?auto_2278980 ?auto_2278981 ) ( ON ?auto_2278982 ?auto_2278980 ) ( ON ?auto_2278983 ?auto_2278982 ) ( ON ?auto_2278984 ?auto_2278983 ) ( ON ?auto_2278985 ?auto_2278984 ) ( not ( = ?auto_2278977 ?auto_2278978 ) ) ( not ( = ?auto_2278977 ?auto_2278979 ) ) ( not ( = ?auto_2278977 ?auto_2278981 ) ) ( not ( = ?auto_2278977 ?auto_2278980 ) ) ( not ( = ?auto_2278977 ?auto_2278982 ) ) ( not ( = ?auto_2278977 ?auto_2278983 ) ) ( not ( = ?auto_2278977 ?auto_2278984 ) ) ( not ( = ?auto_2278977 ?auto_2278985 ) ) ( not ( = ?auto_2278977 ?auto_2278986 ) ) ( not ( = ?auto_2278977 ?auto_2278987 ) ) ( not ( = ?auto_2278977 ?auto_2278991 ) ) ( not ( = ?auto_2278978 ?auto_2278979 ) ) ( not ( = ?auto_2278978 ?auto_2278981 ) ) ( not ( = ?auto_2278978 ?auto_2278980 ) ) ( not ( = ?auto_2278978 ?auto_2278982 ) ) ( not ( = ?auto_2278978 ?auto_2278983 ) ) ( not ( = ?auto_2278978 ?auto_2278984 ) ) ( not ( = ?auto_2278978 ?auto_2278985 ) ) ( not ( = ?auto_2278978 ?auto_2278986 ) ) ( not ( = ?auto_2278978 ?auto_2278987 ) ) ( not ( = ?auto_2278978 ?auto_2278991 ) ) ( not ( = ?auto_2278979 ?auto_2278981 ) ) ( not ( = ?auto_2278979 ?auto_2278980 ) ) ( not ( = ?auto_2278979 ?auto_2278982 ) ) ( not ( = ?auto_2278979 ?auto_2278983 ) ) ( not ( = ?auto_2278979 ?auto_2278984 ) ) ( not ( = ?auto_2278979 ?auto_2278985 ) ) ( not ( = ?auto_2278979 ?auto_2278986 ) ) ( not ( = ?auto_2278979 ?auto_2278987 ) ) ( not ( = ?auto_2278979 ?auto_2278991 ) ) ( not ( = ?auto_2278981 ?auto_2278980 ) ) ( not ( = ?auto_2278981 ?auto_2278982 ) ) ( not ( = ?auto_2278981 ?auto_2278983 ) ) ( not ( = ?auto_2278981 ?auto_2278984 ) ) ( not ( = ?auto_2278981 ?auto_2278985 ) ) ( not ( = ?auto_2278981 ?auto_2278986 ) ) ( not ( = ?auto_2278981 ?auto_2278987 ) ) ( not ( = ?auto_2278981 ?auto_2278991 ) ) ( not ( = ?auto_2278980 ?auto_2278982 ) ) ( not ( = ?auto_2278980 ?auto_2278983 ) ) ( not ( = ?auto_2278980 ?auto_2278984 ) ) ( not ( = ?auto_2278980 ?auto_2278985 ) ) ( not ( = ?auto_2278980 ?auto_2278986 ) ) ( not ( = ?auto_2278980 ?auto_2278987 ) ) ( not ( = ?auto_2278980 ?auto_2278991 ) ) ( not ( = ?auto_2278982 ?auto_2278983 ) ) ( not ( = ?auto_2278982 ?auto_2278984 ) ) ( not ( = ?auto_2278982 ?auto_2278985 ) ) ( not ( = ?auto_2278982 ?auto_2278986 ) ) ( not ( = ?auto_2278982 ?auto_2278987 ) ) ( not ( = ?auto_2278982 ?auto_2278991 ) ) ( not ( = ?auto_2278983 ?auto_2278984 ) ) ( not ( = ?auto_2278983 ?auto_2278985 ) ) ( not ( = ?auto_2278983 ?auto_2278986 ) ) ( not ( = ?auto_2278983 ?auto_2278987 ) ) ( not ( = ?auto_2278983 ?auto_2278991 ) ) ( not ( = ?auto_2278984 ?auto_2278985 ) ) ( not ( = ?auto_2278984 ?auto_2278986 ) ) ( not ( = ?auto_2278984 ?auto_2278987 ) ) ( not ( = ?auto_2278984 ?auto_2278991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2278985 ?auto_2278986 ?auto_2278987 )
      ( MAKE-10CRATE-VERIFY ?auto_2278977 ?auto_2278978 ?auto_2278979 ?auto_2278981 ?auto_2278980 ?auto_2278982 ?auto_2278983 ?auto_2278984 ?auto_2278985 ?auto_2278986 ?auto_2278987 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2286224 - SURFACE
      ?auto_2286225 - SURFACE
      ?auto_2286226 - SURFACE
      ?auto_2286228 - SURFACE
      ?auto_2286227 - SURFACE
      ?auto_2286229 - SURFACE
      ?auto_2286230 - SURFACE
      ?auto_2286231 - SURFACE
      ?auto_2286232 - SURFACE
      ?auto_2286233 - SURFACE
      ?auto_2286234 - SURFACE
      ?auto_2286235 - SURFACE
    )
    :vars
    (
      ?auto_2286236 - HOIST
      ?auto_2286237 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2286236 ?auto_2286237 ) ( SURFACE-AT ?auto_2286234 ?auto_2286237 ) ( CLEAR ?auto_2286234 ) ( LIFTING ?auto_2286236 ?auto_2286235 ) ( IS-CRATE ?auto_2286235 ) ( not ( = ?auto_2286234 ?auto_2286235 ) ) ( ON ?auto_2286225 ?auto_2286224 ) ( ON ?auto_2286226 ?auto_2286225 ) ( ON ?auto_2286228 ?auto_2286226 ) ( ON ?auto_2286227 ?auto_2286228 ) ( ON ?auto_2286229 ?auto_2286227 ) ( ON ?auto_2286230 ?auto_2286229 ) ( ON ?auto_2286231 ?auto_2286230 ) ( ON ?auto_2286232 ?auto_2286231 ) ( ON ?auto_2286233 ?auto_2286232 ) ( ON ?auto_2286234 ?auto_2286233 ) ( not ( = ?auto_2286224 ?auto_2286225 ) ) ( not ( = ?auto_2286224 ?auto_2286226 ) ) ( not ( = ?auto_2286224 ?auto_2286228 ) ) ( not ( = ?auto_2286224 ?auto_2286227 ) ) ( not ( = ?auto_2286224 ?auto_2286229 ) ) ( not ( = ?auto_2286224 ?auto_2286230 ) ) ( not ( = ?auto_2286224 ?auto_2286231 ) ) ( not ( = ?auto_2286224 ?auto_2286232 ) ) ( not ( = ?auto_2286224 ?auto_2286233 ) ) ( not ( = ?auto_2286224 ?auto_2286234 ) ) ( not ( = ?auto_2286224 ?auto_2286235 ) ) ( not ( = ?auto_2286225 ?auto_2286226 ) ) ( not ( = ?auto_2286225 ?auto_2286228 ) ) ( not ( = ?auto_2286225 ?auto_2286227 ) ) ( not ( = ?auto_2286225 ?auto_2286229 ) ) ( not ( = ?auto_2286225 ?auto_2286230 ) ) ( not ( = ?auto_2286225 ?auto_2286231 ) ) ( not ( = ?auto_2286225 ?auto_2286232 ) ) ( not ( = ?auto_2286225 ?auto_2286233 ) ) ( not ( = ?auto_2286225 ?auto_2286234 ) ) ( not ( = ?auto_2286225 ?auto_2286235 ) ) ( not ( = ?auto_2286226 ?auto_2286228 ) ) ( not ( = ?auto_2286226 ?auto_2286227 ) ) ( not ( = ?auto_2286226 ?auto_2286229 ) ) ( not ( = ?auto_2286226 ?auto_2286230 ) ) ( not ( = ?auto_2286226 ?auto_2286231 ) ) ( not ( = ?auto_2286226 ?auto_2286232 ) ) ( not ( = ?auto_2286226 ?auto_2286233 ) ) ( not ( = ?auto_2286226 ?auto_2286234 ) ) ( not ( = ?auto_2286226 ?auto_2286235 ) ) ( not ( = ?auto_2286228 ?auto_2286227 ) ) ( not ( = ?auto_2286228 ?auto_2286229 ) ) ( not ( = ?auto_2286228 ?auto_2286230 ) ) ( not ( = ?auto_2286228 ?auto_2286231 ) ) ( not ( = ?auto_2286228 ?auto_2286232 ) ) ( not ( = ?auto_2286228 ?auto_2286233 ) ) ( not ( = ?auto_2286228 ?auto_2286234 ) ) ( not ( = ?auto_2286228 ?auto_2286235 ) ) ( not ( = ?auto_2286227 ?auto_2286229 ) ) ( not ( = ?auto_2286227 ?auto_2286230 ) ) ( not ( = ?auto_2286227 ?auto_2286231 ) ) ( not ( = ?auto_2286227 ?auto_2286232 ) ) ( not ( = ?auto_2286227 ?auto_2286233 ) ) ( not ( = ?auto_2286227 ?auto_2286234 ) ) ( not ( = ?auto_2286227 ?auto_2286235 ) ) ( not ( = ?auto_2286229 ?auto_2286230 ) ) ( not ( = ?auto_2286229 ?auto_2286231 ) ) ( not ( = ?auto_2286229 ?auto_2286232 ) ) ( not ( = ?auto_2286229 ?auto_2286233 ) ) ( not ( = ?auto_2286229 ?auto_2286234 ) ) ( not ( = ?auto_2286229 ?auto_2286235 ) ) ( not ( = ?auto_2286230 ?auto_2286231 ) ) ( not ( = ?auto_2286230 ?auto_2286232 ) ) ( not ( = ?auto_2286230 ?auto_2286233 ) ) ( not ( = ?auto_2286230 ?auto_2286234 ) ) ( not ( = ?auto_2286230 ?auto_2286235 ) ) ( not ( = ?auto_2286231 ?auto_2286232 ) ) ( not ( = ?auto_2286231 ?auto_2286233 ) ) ( not ( = ?auto_2286231 ?auto_2286234 ) ) ( not ( = ?auto_2286231 ?auto_2286235 ) ) ( not ( = ?auto_2286232 ?auto_2286233 ) ) ( not ( = ?auto_2286232 ?auto_2286234 ) ) ( not ( = ?auto_2286232 ?auto_2286235 ) ) ( not ( = ?auto_2286233 ?auto_2286234 ) ) ( not ( = ?auto_2286233 ?auto_2286235 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2286234 ?auto_2286235 )
      ( MAKE-11CRATE-VERIFY ?auto_2286224 ?auto_2286225 ?auto_2286226 ?auto_2286228 ?auto_2286227 ?auto_2286229 ?auto_2286230 ?auto_2286231 ?auto_2286232 ?auto_2286233 ?auto_2286234 ?auto_2286235 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2286333 - SURFACE
      ?auto_2286334 - SURFACE
      ?auto_2286335 - SURFACE
      ?auto_2286337 - SURFACE
      ?auto_2286336 - SURFACE
      ?auto_2286338 - SURFACE
      ?auto_2286339 - SURFACE
      ?auto_2286340 - SURFACE
      ?auto_2286341 - SURFACE
      ?auto_2286342 - SURFACE
      ?auto_2286343 - SURFACE
      ?auto_2286344 - SURFACE
    )
    :vars
    (
      ?auto_2286345 - HOIST
      ?auto_2286347 - PLACE
      ?auto_2286346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2286345 ?auto_2286347 ) ( SURFACE-AT ?auto_2286343 ?auto_2286347 ) ( CLEAR ?auto_2286343 ) ( IS-CRATE ?auto_2286344 ) ( not ( = ?auto_2286343 ?auto_2286344 ) ) ( TRUCK-AT ?auto_2286346 ?auto_2286347 ) ( AVAILABLE ?auto_2286345 ) ( IN ?auto_2286344 ?auto_2286346 ) ( ON ?auto_2286343 ?auto_2286342 ) ( not ( = ?auto_2286342 ?auto_2286343 ) ) ( not ( = ?auto_2286342 ?auto_2286344 ) ) ( ON ?auto_2286334 ?auto_2286333 ) ( ON ?auto_2286335 ?auto_2286334 ) ( ON ?auto_2286337 ?auto_2286335 ) ( ON ?auto_2286336 ?auto_2286337 ) ( ON ?auto_2286338 ?auto_2286336 ) ( ON ?auto_2286339 ?auto_2286338 ) ( ON ?auto_2286340 ?auto_2286339 ) ( ON ?auto_2286341 ?auto_2286340 ) ( ON ?auto_2286342 ?auto_2286341 ) ( not ( = ?auto_2286333 ?auto_2286334 ) ) ( not ( = ?auto_2286333 ?auto_2286335 ) ) ( not ( = ?auto_2286333 ?auto_2286337 ) ) ( not ( = ?auto_2286333 ?auto_2286336 ) ) ( not ( = ?auto_2286333 ?auto_2286338 ) ) ( not ( = ?auto_2286333 ?auto_2286339 ) ) ( not ( = ?auto_2286333 ?auto_2286340 ) ) ( not ( = ?auto_2286333 ?auto_2286341 ) ) ( not ( = ?auto_2286333 ?auto_2286342 ) ) ( not ( = ?auto_2286333 ?auto_2286343 ) ) ( not ( = ?auto_2286333 ?auto_2286344 ) ) ( not ( = ?auto_2286334 ?auto_2286335 ) ) ( not ( = ?auto_2286334 ?auto_2286337 ) ) ( not ( = ?auto_2286334 ?auto_2286336 ) ) ( not ( = ?auto_2286334 ?auto_2286338 ) ) ( not ( = ?auto_2286334 ?auto_2286339 ) ) ( not ( = ?auto_2286334 ?auto_2286340 ) ) ( not ( = ?auto_2286334 ?auto_2286341 ) ) ( not ( = ?auto_2286334 ?auto_2286342 ) ) ( not ( = ?auto_2286334 ?auto_2286343 ) ) ( not ( = ?auto_2286334 ?auto_2286344 ) ) ( not ( = ?auto_2286335 ?auto_2286337 ) ) ( not ( = ?auto_2286335 ?auto_2286336 ) ) ( not ( = ?auto_2286335 ?auto_2286338 ) ) ( not ( = ?auto_2286335 ?auto_2286339 ) ) ( not ( = ?auto_2286335 ?auto_2286340 ) ) ( not ( = ?auto_2286335 ?auto_2286341 ) ) ( not ( = ?auto_2286335 ?auto_2286342 ) ) ( not ( = ?auto_2286335 ?auto_2286343 ) ) ( not ( = ?auto_2286335 ?auto_2286344 ) ) ( not ( = ?auto_2286337 ?auto_2286336 ) ) ( not ( = ?auto_2286337 ?auto_2286338 ) ) ( not ( = ?auto_2286337 ?auto_2286339 ) ) ( not ( = ?auto_2286337 ?auto_2286340 ) ) ( not ( = ?auto_2286337 ?auto_2286341 ) ) ( not ( = ?auto_2286337 ?auto_2286342 ) ) ( not ( = ?auto_2286337 ?auto_2286343 ) ) ( not ( = ?auto_2286337 ?auto_2286344 ) ) ( not ( = ?auto_2286336 ?auto_2286338 ) ) ( not ( = ?auto_2286336 ?auto_2286339 ) ) ( not ( = ?auto_2286336 ?auto_2286340 ) ) ( not ( = ?auto_2286336 ?auto_2286341 ) ) ( not ( = ?auto_2286336 ?auto_2286342 ) ) ( not ( = ?auto_2286336 ?auto_2286343 ) ) ( not ( = ?auto_2286336 ?auto_2286344 ) ) ( not ( = ?auto_2286338 ?auto_2286339 ) ) ( not ( = ?auto_2286338 ?auto_2286340 ) ) ( not ( = ?auto_2286338 ?auto_2286341 ) ) ( not ( = ?auto_2286338 ?auto_2286342 ) ) ( not ( = ?auto_2286338 ?auto_2286343 ) ) ( not ( = ?auto_2286338 ?auto_2286344 ) ) ( not ( = ?auto_2286339 ?auto_2286340 ) ) ( not ( = ?auto_2286339 ?auto_2286341 ) ) ( not ( = ?auto_2286339 ?auto_2286342 ) ) ( not ( = ?auto_2286339 ?auto_2286343 ) ) ( not ( = ?auto_2286339 ?auto_2286344 ) ) ( not ( = ?auto_2286340 ?auto_2286341 ) ) ( not ( = ?auto_2286340 ?auto_2286342 ) ) ( not ( = ?auto_2286340 ?auto_2286343 ) ) ( not ( = ?auto_2286340 ?auto_2286344 ) ) ( not ( = ?auto_2286341 ?auto_2286342 ) ) ( not ( = ?auto_2286341 ?auto_2286343 ) ) ( not ( = ?auto_2286341 ?auto_2286344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2286342 ?auto_2286343 ?auto_2286344 )
      ( MAKE-11CRATE-VERIFY ?auto_2286333 ?auto_2286334 ?auto_2286335 ?auto_2286337 ?auto_2286336 ?auto_2286338 ?auto_2286339 ?auto_2286340 ?auto_2286341 ?auto_2286342 ?auto_2286343 ?auto_2286344 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2286454 - SURFACE
      ?auto_2286455 - SURFACE
      ?auto_2286456 - SURFACE
      ?auto_2286458 - SURFACE
      ?auto_2286457 - SURFACE
      ?auto_2286459 - SURFACE
      ?auto_2286460 - SURFACE
      ?auto_2286461 - SURFACE
      ?auto_2286462 - SURFACE
      ?auto_2286463 - SURFACE
      ?auto_2286464 - SURFACE
      ?auto_2286465 - SURFACE
    )
    :vars
    (
      ?auto_2286466 - HOIST
      ?auto_2286468 - PLACE
      ?auto_2286467 - TRUCK
      ?auto_2286469 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2286466 ?auto_2286468 ) ( SURFACE-AT ?auto_2286464 ?auto_2286468 ) ( CLEAR ?auto_2286464 ) ( IS-CRATE ?auto_2286465 ) ( not ( = ?auto_2286464 ?auto_2286465 ) ) ( AVAILABLE ?auto_2286466 ) ( IN ?auto_2286465 ?auto_2286467 ) ( ON ?auto_2286464 ?auto_2286463 ) ( not ( = ?auto_2286463 ?auto_2286464 ) ) ( not ( = ?auto_2286463 ?auto_2286465 ) ) ( TRUCK-AT ?auto_2286467 ?auto_2286469 ) ( not ( = ?auto_2286469 ?auto_2286468 ) ) ( ON ?auto_2286455 ?auto_2286454 ) ( ON ?auto_2286456 ?auto_2286455 ) ( ON ?auto_2286458 ?auto_2286456 ) ( ON ?auto_2286457 ?auto_2286458 ) ( ON ?auto_2286459 ?auto_2286457 ) ( ON ?auto_2286460 ?auto_2286459 ) ( ON ?auto_2286461 ?auto_2286460 ) ( ON ?auto_2286462 ?auto_2286461 ) ( ON ?auto_2286463 ?auto_2286462 ) ( not ( = ?auto_2286454 ?auto_2286455 ) ) ( not ( = ?auto_2286454 ?auto_2286456 ) ) ( not ( = ?auto_2286454 ?auto_2286458 ) ) ( not ( = ?auto_2286454 ?auto_2286457 ) ) ( not ( = ?auto_2286454 ?auto_2286459 ) ) ( not ( = ?auto_2286454 ?auto_2286460 ) ) ( not ( = ?auto_2286454 ?auto_2286461 ) ) ( not ( = ?auto_2286454 ?auto_2286462 ) ) ( not ( = ?auto_2286454 ?auto_2286463 ) ) ( not ( = ?auto_2286454 ?auto_2286464 ) ) ( not ( = ?auto_2286454 ?auto_2286465 ) ) ( not ( = ?auto_2286455 ?auto_2286456 ) ) ( not ( = ?auto_2286455 ?auto_2286458 ) ) ( not ( = ?auto_2286455 ?auto_2286457 ) ) ( not ( = ?auto_2286455 ?auto_2286459 ) ) ( not ( = ?auto_2286455 ?auto_2286460 ) ) ( not ( = ?auto_2286455 ?auto_2286461 ) ) ( not ( = ?auto_2286455 ?auto_2286462 ) ) ( not ( = ?auto_2286455 ?auto_2286463 ) ) ( not ( = ?auto_2286455 ?auto_2286464 ) ) ( not ( = ?auto_2286455 ?auto_2286465 ) ) ( not ( = ?auto_2286456 ?auto_2286458 ) ) ( not ( = ?auto_2286456 ?auto_2286457 ) ) ( not ( = ?auto_2286456 ?auto_2286459 ) ) ( not ( = ?auto_2286456 ?auto_2286460 ) ) ( not ( = ?auto_2286456 ?auto_2286461 ) ) ( not ( = ?auto_2286456 ?auto_2286462 ) ) ( not ( = ?auto_2286456 ?auto_2286463 ) ) ( not ( = ?auto_2286456 ?auto_2286464 ) ) ( not ( = ?auto_2286456 ?auto_2286465 ) ) ( not ( = ?auto_2286458 ?auto_2286457 ) ) ( not ( = ?auto_2286458 ?auto_2286459 ) ) ( not ( = ?auto_2286458 ?auto_2286460 ) ) ( not ( = ?auto_2286458 ?auto_2286461 ) ) ( not ( = ?auto_2286458 ?auto_2286462 ) ) ( not ( = ?auto_2286458 ?auto_2286463 ) ) ( not ( = ?auto_2286458 ?auto_2286464 ) ) ( not ( = ?auto_2286458 ?auto_2286465 ) ) ( not ( = ?auto_2286457 ?auto_2286459 ) ) ( not ( = ?auto_2286457 ?auto_2286460 ) ) ( not ( = ?auto_2286457 ?auto_2286461 ) ) ( not ( = ?auto_2286457 ?auto_2286462 ) ) ( not ( = ?auto_2286457 ?auto_2286463 ) ) ( not ( = ?auto_2286457 ?auto_2286464 ) ) ( not ( = ?auto_2286457 ?auto_2286465 ) ) ( not ( = ?auto_2286459 ?auto_2286460 ) ) ( not ( = ?auto_2286459 ?auto_2286461 ) ) ( not ( = ?auto_2286459 ?auto_2286462 ) ) ( not ( = ?auto_2286459 ?auto_2286463 ) ) ( not ( = ?auto_2286459 ?auto_2286464 ) ) ( not ( = ?auto_2286459 ?auto_2286465 ) ) ( not ( = ?auto_2286460 ?auto_2286461 ) ) ( not ( = ?auto_2286460 ?auto_2286462 ) ) ( not ( = ?auto_2286460 ?auto_2286463 ) ) ( not ( = ?auto_2286460 ?auto_2286464 ) ) ( not ( = ?auto_2286460 ?auto_2286465 ) ) ( not ( = ?auto_2286461 ?auto_2286462 ) ) ( not ( = ?auto_2286461 ?auto_2286463 ) ) ( not ( = ?auto_2286461 ?auto_2286464 ) ) ( not ( = ?auto_2286461 ?auto_2286465 ) ) ( not ( = ?auto_2286462 ?auto_2286463 ) ) ( not ( = ?auto_2286462 ?auto_2286464 ) ) ( not ( = ?auto_2286462 ?auto_2286465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2286463 ?auto_2286464 ?auto_2286465 )
      ( MAKE-11CRATE-VERIFY ?auto_2286454 ?auto_2286455 ?auto_2286456 ?auto_2286458 ?auto_2286457 ?auto_2286459 ?auto_2286460 ?auto_2286461 ?auto_2286462 ?auto_2286463 ?auto_2286464 ?auto_2286465 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2286586 - SURFACE
      ?auto_2286587 - SURFACE
      ?auto_2286588 - SURFACE
      ?auto_2286590 - SURFACE
      ?auto_2286589 - SURFACE
      ?auto_2286591 - SURFACE
      ?auto_2286592 - SURFACE
      ?auto_2286593 - SURFACE
      ?auto_2286594 - SURFACE
      ?auto_2286595 - SURFACE
      ?auto_2286596 - SURFACE
      ?auto_2286597 - SURFACE
    )
    :vars
    (
      ?auto_2286601 - HOIST
      ?auto_2286598 - PLACE
      ?auto_2286599 - TRUCK
      ?auto_2286600 - PLACE
      ?auto_2286602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2286601 ?auto_2286598 ) ( SURFACE-AT ?auto_2286596 ?auto_2286598 ) ( CLEAR ?auto_2286596 ) ( IS-CRATE ?auto_2286597 ) ( not ( = ?auto_2286596 ?auto_2286597 ) ) ( AVAILABLE ?auto_2286601 ) ( ON ?auto_2286596 ?auto_2286595 ) ( not ( = ?auto_2286595 ?auto_2286596 ) ) ( not ( = ?auto_2286595 ?auto_2286597 ) ) ( TRUCK-AT ?auto_2286599 ?auto_2286600 ) ( not ( = ?auto_2286600 ?auto_2286598 ) ) ( HOIST-AT ?auto_2286602 ?auto_2286600 ) ( LIFTING ?auto_2286602 ?auto_2286597 ) ( not ( = ?auto_2286601 ?auto_2286602 ) ) ( ON ?auto_2286587 ?auto_2286586 ) ( ON ?auto_2286588 ?auto_2286587 ) ( ON ?auto_2286590 ?auto_2286588 ) ( ON ?auto_2286589 ?auto_2286590 ) ( ON ?auto_2286591 ?auto_2286589 ) ( ON ?auto_2286592 ?auto_2286591 ) ( ON ?auto_2286593 ?auto_2286592 ) ( ON ?auto_2286594 ?auto_2286593 ) ( ON ?auto_2286595 ?auto_2286594 ) ( not ( = ?auto_2286586 ?auto_2286587 ) ) ( not ( = ?auto_2286586 ?auto_2286588 ) ) ( not ( = ?auto_2286586 ?auto_2286590 ) ) ( not ( = ?auto_2286586 ?auto_2286589 ) ) ( not ( = ?auto_2286586 ?auto_2286591 ) ) ( not ( = ?auto_2286586 ?auto_2286592 ) ) ( not ( = ?auto_2286586 ?auto_2286593 ) ) ( not ( = ?auto_2286586 ?auto_2286594 ) ) ( not ( = ?auto_2286586 ?auto_2286595 ) ) ( not ( = ?auto_2286586 ?auto_2286596 ) ) ( not ( = ?auto_2286586 ?auto_2286597 ) ) ( not ( = ?auto_2286587 ?auto_2286588 ) ) ( not ( = ?auto_2286587 ?auto_2286590 ) ) ( not ( = ?auto_2286587 ?auto_2286589 ) ) ( not ( = ?auto_2286587 ?auto_2286591 ) ) ( not ( = ?auto_2286587 ?auto_2286592 ) ) ( not ( = ?auto_2286587 ?auto_2286593 ) ) ( not ( = ?auto_2286587 ?auto_2286594 ) ) ( not ( = ?auto_2286587 ?auto_2286595 ) ) ( not ( = ?auto_2286587 ?auto_2286596 ) ) ( not ( = ?auto_2286587 ?auto_2286597 ) ) ( not ( = ?auto_2286588 ?auto_2286590 ) ) ( not ( = ?auto_2286588 ?auto_2286589 ) ) ( not ( = ?auto_2286588 ?auto_2286591 ) ) ( not ( = ?auto_2286588 ?auto_2286592 ) ) ( not ( = ?auto_2286588 ?auto_2286593 ) ) ( not ( = ?auto_2286588 ?auto_2286594 ) ) ( not ( = ?auto_2286588 ?auto_2286595 ) ) ( not ( = ?auto_2286588 ?auto_2286596 ) ) ( not ( = ?auto_2286588 ?auto_2286597 ) ) ( not ( = ?auto_2286590 ?auto_2286589 ) ) ( not ( = ?auto_2286590 ?auto_2286591 ) ) ( not ( = ?auto_2286590 ?auto_2286592 ) ) ( not ( = ?auto_2286590 ?auto_2286593 ) ) ( not ( = ?auto_2286590 ?auto_2286594 ) ) ( not ( = ?auto_2286590 ?auto_2286595 ) ) ( not ( = ?auto_2286590 ?auto_2286596 ) ) ( not ( = ?auto_2286590 ?auto_2286597 ) ) ( not ( = ?auto_2286589 ?auto_2286591 ) ) ( not ( = ?auto_2286589 ?auto_2286592 ) ) ( not ( = ?auto_2286589 ?auto_2286593 ) ) ( not ( = ?auto_2286589 ?auto_2286594 ) ) ( not ( = ?auto_2286589 ?auto_2286595 ) ) ( not ( = ?auto_2286589 ?auto_2286596 ) ) ( not ( = ?auto_2286589 ?auto_2286597 ) ) ( not ( = ?auto_2286591 ?auto_2286592 ) ) ( not ( = ?auto_2286591 ?auto_2286593 ) ) ( not ( = ?auto_2286591 ?auto_2286594 ) ) ( not ( = ?auto_2286591 ?auto_2286595 ) ) ( not ( = ?auto_2286591 ?auto_2286596 ) ) ( not ( = ?auto_2286591 ?auto_2286597 ) ) ( not ( = ?auto_2286592 ?auto_2286593 ) ) ( not ( = ?auto_2286592 ?auto_2286594 ) ) ( not ( = ?auto_2286592 ?auto_2286595 ) ) ( not ( = ?auto_2286592 ?auto_2286596 ) ) ( not ( = ?auto_2286592 ?auto_2286597 ) ) ( not ( = ?auto_2286593 ?auto_2286594 ) ) ( not ( = ?auto_2286593 ?auto_2286595 ) ) ( not ( = ?auto_2286593 ?auto_2286596 ) ) ( not ( = ?auto_2286593 ?auto_2286597 ) ) ( not ( = ?auto_2286594 ?auto_2286595 ) ) ( not ( = ?auto_2286594 ?auto_2286596 ) ) ( not ( = ?auto_2286594 ?auto_2286597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2286595 ?auto_2286596 ?auto_2286597 )
      ( MAKE-11CRATE-VERIFY ?auto_2286586 ?auto_2286587 ?auto_2286588 ?auto_2286590 ?auto_2286589 ?auto_2286591 ?auto_2286592 ?auto_2286593 ?auto_2286594 ?auto_2286595 ?auto_2286596 ?auto_2286597 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2286729 - SURFACE
      ?auto_2286730 - SURFACE
      ?auto_2286731 - SURFACE
      ?auto_2286733 - SURFACE
      ?auto_2286732 - SURFACE
      ?auto_2286734 - SURFACE
      ?auto_2286735 - SURFACE
      ?auto_2286736 - SURFACE
      ?auto_2286737 - SURFACE
      ?auto_2286738 - SURFACE
      ?auto_2286739 - SURFACE
      ?auto_2286740 - SURFACE
    )
    :vars
    (
      ?auto_2286746 - HOIST
      ?auto_2286743 - PLACE
      ?auto_2286742 - TRUCK
      ?auto_2286741 - PLACE
      ?auto_2286744 - HOIST
      ?auto_2286745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2286746 ?auto_2286743 ) ( SURFACE-AT ?auto_2286739 ?auto_2286743 ) ( CLEAR ?auto_2286739 ) ( IS-CRATE ?auto_2286740 ) ( not ( = ?auto_2286739 ?auto_2286740 ) ) ( AVAILABLE ?auto_2286746 ) ( ON ?auto_2286739 ?auto_2286738 ) ( not ( = ?auto_2286738 ?auto_2286739 ) ) ( not ( = ?auto_2286738 ?auto_2286740 ) ) ( TRUCK-AT ?auto_2286742 ?auto_2286741 ) ( not ( = ?auto_2286741 ?auto_2286743 ) ) ( HOIST-AT ?auto_2286744 ?auto_2286741 ) ( not ( = ?auto_2286746 ?auto_2286744 ) ) ( AVAILABLE ?auto_2286744 ) ( SURFACE-AT ?auto_2286740 ?auto_2286741 ) ( ON ?auto_2286740 ?auto_2286745 ) ( CLEAR ?auto_2286740 ) ( not ( = ?auto_2286739 ?auto_2286745 ) ) ( not ( = ?auto_2286740 ?auto_2286745 ) ) ( not ( = ?auto_2286738 ?auto_2286745 ) ) ( ON ?auto_2286730 ?auto_2286729 ) ( ON ?auto_2286731 ?auto_2286730 ) ( ON ?auto_2286733 ?auto_2286731 ) ( ON ?auto_2286732 ?auto_2286733 ) ( ON ?auto_2286734 ?auto_2286732 ) ( ON ?auto_2286735 ?auto_2286734 ) ( ON ?auto_2286736 ?auto_2286735 ) ( ON ?auto_2286737 ?auto_2286736 ) ( ON ?auto_2286738 ?auto_2286737 ) ( not ( = ?auto_2286729 ?auto_2286730 ) ) ( not ( = ?auto_2286729 ?auto_2286731 ) ) ( not ( = ?auto_2286729 ?auto_2286733 ) ) ( not ( = ?auto_2286729 ?auto_2286732 ) ) ( not ( = ?auto_2286729 ?auto_2286734 ) ) ( not ( = ?auto_2286729 ?auto_2286735 ) ) ( not ( = ?auto_2286729 ?auto_2286736 ) ) ( not ( = ?auto_2286729 ?auto_2286737 ) ) ( not ( = ?auto_2286729 ?auto_2286738 ) ) ( not ( = ?auto_2286729 ?auto_2286739 ) ) ( not ( = ?auto_2286729 ?auto_2286740 ) ) ( not ( = ?auto_2286729 ?auto_2286745 ) ) ( not ( = ?auto_2286730 ?auto_2286731 ) ) ( not ( = ?auto_2286730 ?auto_2286733 ) ) ( not ( = ?auto_2286730 ?auto_2286732 ) ) ( not ( = ?auto_2286730 ?auto_2286734 ) ) ( not ( = ?auto_2286730 ?auto_2286735 ) ) ( not ( = ?auto_2286730 ?auto_2286736 ) ) ( not ( = ?auto_2286730 ?auto_2286737 ) ) ( not ( = ?auto_2286730 ?auto_2286738 ) ) ( not ( = ?auto_2286730 ?auto_2286739 ) ) ( not ( = ?auto_2286730 ?auto_2286740 ) ) ( not ( = ?auto_2286730 ?auto_2286745 ) ) ( not ( = ?auto_2286731 ?auto_2286733 ) ) ( not ( = ?auto_2286731 ?auto_2286732 ) ) ( not ( = ?auto_2286731 ?auto_2286734 ) ) ( not ( = ?auto_2286731 ?auto_2286735 ) ) ( not ( = ?auto_2286731 ?auto_2286736 ) ) ( not ( = ?auto_2286731 ?auto_2286737 ) ) ( not ( = ?auto_2286731 ?auto_2286738 ) ) ( not ( = ?auto_2286731 ?auto_2286739 ) ) ( not ( = ?auto_2286731 ?auto_2286740 ) ) ( not ( = ?auto_2286731 ?auto_2286745 ) ) ( not ( = ?auto_2286733 ?auto_2286732 ) ) ( not ( = ?auto_2286733 ?auto_2286734 ) ) ( not ( = ?auto_2286733 ?auto_2286735 ) ) ( not ( = ?auto_2286733 ?auto_2286736 ) ) ( not ( = ?auto_2286733 ?auto_2286737 ) ) ( not ( = ?auto_2286733 ?auto_2286738 ) ) ( not ( = ?auto_2286733 ?auto_2286739 ) ) ( not ( = ?auto_2286733 ?auto_2286740 ) ) ( not ( = ?auto_2286733 ?auto_2286745 ) ) ( not ( = ?auto_2286732 ?auto_2286734 ) ) ( not ( = ?auto_2286732 ?auto_2286735 ) ) ( not ( = ?auto_2286732 ?auto_2286736 ) ) ( not ( = ?auto_2286732 ?auto_2286737 ) ) ( not ( = ?auto_2286732 ?auto_2286738 ) ) ( not ( = ?auto_2286732 ?auto_2286739 ) ) ( not ( = ?auto_2286732 ?auto_2286740 ) ) ( not ( = ?auto_2286732 ?auto_2286745 ) ) ( not ( = ?auto_2286734 ?auto_2286735 ) ) ( not ( = ?auto_2286734 ?auto_2286736 ) ) ( not ( = ?auto_2286734 ?auto_2286737 ) ) ( not ( = ?auto_2286734 ?auto_2286738 ) ) ( not ( = ?auto_2286734 ?auto_2286739 ) ) ( not ( = ?auto_2286734 ?auto_2286740 ) ) ( not ( = ?auto_2286734 ?auto_2286745 ) ) ( not ( = ?auto_2286735 ?auto_2286736 ) ) ( not ( = ?auto_2286735 ?auto_2286737 ) ) ( not ( = ?auto_2286735 ?auto_2286738 ) ) ( not ( = ?auto_2286735 ?auto_2286739 ) ) ( not ( = ?auto_2286735 ?auto_2286740 ) ) ( not ( = ?auto_2286735 ?auto_2286745 ) ) ( not ( = ?auto_2286736 ?auto_2286737 ) ) ( not ( = ?auto_2286736 ?auto_2286738 ) ) ( not ( = ?auto_2286736 ?auto_2286739 ) ) ( not ( = ?auto_2286736 ?auto_2286740 ) ) ( not ( = ?auto_2286736 ?auto_2286745 ) ) ( not ( = ?auto_2286737 ?auto_2286738 ) ) ( not ( = ?auto_2286737 ?auto_2286739 ) ) ( not ( = ?auto_2286737 ?auto_2286740 ) ) ( not ( = ?auto_2286737 ?auto_2286745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2286738 ?auto_2286739 ?auto_2286740 )
      ( MAKE-11CRATE-VERIFY ?auto_2286729 ?auto_2286730 ?auto_2286731 ?auto_2286733 ?auto_2286732 ?auto_2286734 ?auto_2286735 ?auto_2286736 ?auto_2286737 ?auto_2286738 ?auto_2286739 ?auto_2286740 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2286873 - SURFACE
      ?auto_2286874 - SURFACE
      ?auto_2286875 - SURFACE
      ?auto_2286877 - SURFACE
      ?auto_2286876 - SURFACE
      ?auto_2286878 - SURFACE
      ?auto_2286879 - SURFACE
      ?auto_2286880 - SURFACE
      ?auto_2286881 - SURFACE
      ?auto_2286882 - SURFACE
      ?auto_2286883 - SURFACE
      ?auto_2286884 - SURFACE
    )
    :vars
    (
      ?auto_2286886 - HOIST
      ?auto_2286885 - PLACE
      ?auto_2286887 - PLACE
      ?auto_2286888 - HOIST
      ?auto_2286890 - SURFACE
      ?auto_2286889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2286886 ?auto_2286885 ) ( SURFACE-AT ?auto_2286883 ?auto_2286885 ) ( CLEAR ?auto_2286883 ) ( IS-CRATE ?auto_2286884 ) ( not ( = ?auto_2286883 ?auto_2286884 ) ) ( AVAILABLE ?auto_2286886 ) ( ON ?auto_2286883 ?auto_2286882 ) ( not ( = ?auto_2286882 ?auto_2286883 ) ) ( not ( = ?auto_2286882 ?auto_2286884 ) ) ( not ( = ?auto_2286887 ?auto_2286885 ) ) ( HOIST-AT ?auto_2286888 ?auto_2286887 ) ( not ( = ?auto_2286886 ?auto_2286888 ) ) ( AVAILABLE ?auto_2286888 ) ( SURFACE-AT ?auto_2286884 ?auto_2286887 ) ( ON ?auto_2286884 ?auto_2286890 ) ( CLEAR ?auto_2286884 ) ( not ( = ?auto_2286883 ?auto_2286890 ) ) ( not ( = ?auto_2286884 ?auto_2286890 ) ) ( not ( = ?auto_2286882 ?auto_2286890 ) ) ( TRUCK-AT ?auto_2286889 ?auto_2286885 ) ( ON ?auto_2286874 ?auto_2286873 ) ( ON ?auto_2286875 ?auto_2286874 ) ( ON ?auto_2286877 ?auto_2286875 ) ( ON ?auto_2286876 ?auto_2286877 ) ( ON ?auto_2286878 ?auto_2286876 ) ( ON ?auto_2286879 ?auto_2286878 ) ( ON ?auto_2286880 ?auto_2286879 ) ( ON ?auto_2286881 ?auto_2286880 ) ( ON ?auto_2286882 ?auto_2286881 ) ( not ( = ?auto_2286873 ?auto_2286874 ) ) ( not ( = ?auto_2286873 ?auto_2286875 ) ) ( not ( = ?auto_2286873 ?auto_2286877 ) ) ( not ( = ?auto_2286873 ?auto_2286876 ) ) ( not ( = ?auto_2286873 ?auto_2286878 ) ) ( not ( = ?auto_2286873 ?auto_2286879 ) ) ( not ( = ?auto_2286873 ?auto_2286880 ) ) ( not ( = ?auto_2286873 ?auto_2286881 ) ) ( not ( = ?auto_2286873 ?auto_2286882 ) ) ( not ( = ?auto_2286873 ?auto_2286883 ) ) ( not ( = ?auto_2286873 ?auto_2286884 ) ) ( not ( = ?auto_2286873 ?auto_2286890 ) ) ( not ( = ?auto_2286874 ?auto_2286875 ) ) ( not ( = ?auto_2286874 ?auto_2286877 ) ) ( not ( = ?auto_2286874 ?auto_2286876 ) ) ( not ( = ?auto_2286874 ?auto_2286878 ) ) ( not ( = ?auto_2286874 ?auto_2286879 ) ) ( not ( = ?auto_2286874 ?auto_2286880 ) ) ( not ( = ?auto_2286874 ?auto_2286881 ) ) ( not ( = ?auto_2286874 ?auto_2286882 ) ) ( not ( = ?auto_2286874 ?auto_2286883 ) ) ( not ( = ?auto_2286874 ?auto_2286884 ) ) ( not ( = ?auto_2286874 ?auto_2286890 ) ) ( not ( = ?auto_2286875 ?auto_2286877 ) ) ( not ( = ?auto_2286875 ?auto_2286876 ) ) ( not ( = ?auto_2286875 ?auto_2286878 ) ) ( not ( = ?auto_2286875 ?auto_2286879 ) ) ( not ( = ?auto_2286875 ?auto_2286880 ) ) ( not ( = ?auto_2286875 ?auto_2286881 ) ) ( not ( = ?auto_2286875 ?auto_2286882 ) ) ( not ( = ?auto_2286875 ?auto_2286883 ) ) ( not ( = ?auto_2286875 ?auto_2286884 ) ) ( not ( = ?auto_2286875 ?auto_2286890 ) ) ( not ( = ?auto_2286877 ?auto_2286876 ) ) ( not ( = ?auto_2286877 ?auto_2286878 ) ) ( not ( = ?auto_2286877 ?auto_2286879 ) ) ( not ( = ?auto_2286877 ?auto_2286880 ) ) ( not ( = ?auto_2286877 ?auto_2286881 ) ) ( not ( = ?auto_2286877 ?auto_2286882 ) ) ( not ( = ?auto_2286877 ?auto_2286883 ) ) ( not ( = ?auto_2286877 ?auto_2286884 ) ) ( not ( = ?auto_2286877 ?auto_2286890 ) ) ( not ( = ?auto_2286876 ?auto_2286878 ) ) ( not ( = ?auto_2286876 ?auto_2286879 ) ) ( not ( = ?auto_2286876 ?auto_2286880 ) ) ( not ( = ?auto_2286876 ?auto_2286881 ) ) ( not ( = ?auto_2286876 ?auto_2286882 ) ) ( not ( = ?auto_2286876 ?auto_2286883 ) ) ( not ( = ?auto_2286876 ?auto_2286884 ) ) ( not ( = ?auto_2286876 ?auto_2286890 ) ) ( not ( = ?auto_2286878 ?auto_2286879 ) ) ( not ( = ?auto_2286878 ?auto_2286880 ) ) ( not ( = ?auto_2286878 ?auto_2286881 ) ) ( not ( = ?auto_2286878 ?auto_2286882 ) ) ( not ( = ?auto_2286878 ?auto_2286883 ) ) ( not ( = ?auto_2286878 ?auto_2286884 ) ) ( not ( = ?auto_2286878 ?auto_2286890 ) ) ( not ( = ?auto_2286879 ?auto_2286880 ) ) ( not ( = ?auto_2286879 ?auto_2286881 ) ) ( not ( = ?auto_2286879 ?auto_2286882 ) ) ( not ( = ?auto_2286879 ?auto_2286883 ) ) ( not ( = ?auto_2286879 ?auto_2286884 ) ) ( not ( = ?auto_2286879 ?auto_2286890 ) ) ( not ( = ?auto_2286880 ?auto_2286881 ) ) ( not ( = ?auto_2286880 ?auto_2286882 ) ) ( not ( = ?auto_2286880 ?auto_2286883 ) ) ( not ( = ?auto_2286880 ?auto_2286884 ) ) ( not ( = ?auto_2286880 ?auto_2286890 ) ) ( not ( = ?auto_2286881 ?auto_2286882 ) ) ( not ( = ?auto_2286881 ?auto_2286883 ) ) ( not ( = ?auto_2286881 ?auto_2286884 ) ) ( not ( = ?auto_2286881 ?auto_2286890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2286882 ?auto_2286883 ?auto_2286884 )
      ( MAKE-11CRATE-VERIFY ?auto_2286873 ?auto_2286874 ?auto_2286875 ?auto_2286877 ?auto_2286876 ?auto_2286878 ?auto_2286879 ?auto_2286880 ?auto_2286881 ?auto_2286882 ?auto_2286883 ?auto_2286884 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2287017 - SURFACE
      ?auto_2287018 - SURFACE
      ?auto_2287019 - SURFACE
      ?auto_2287021 - SURFACE
      ?auto_2287020 - SURFACE
      ?auto_2287022 - SURFACE
      ?auto_2287023 - SURFACE
      ?auto_2287024 - SURFACE
      ?auto_2287025 - SURFACE
      ?auto_2287026 - SURFACE
      ?auto_2287027 - SURFACE
      ?auto_2287028 - SURFACE
    )
    :vars
    (
      ?auto_2287033 - HOIST
      ?auto_2287029 - PLACE
      ?auto_2287034 - PLACE
      ?auto_2287032 - HOIST
      ?auto_2287031 - SURFACE
      ?auto_2287030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2287033 ?auto_2287029 ) ( IS-CRATE ?auto_2287028 ) ( not ( = ?auto_2287027 ?auto_2287028 ) ) ( not ( = ?auto_2287026 ?auto_2287027 ) ) ( not ( = ?auto_2287026 ?auto_2287028 ) ) ( not ( = ?auto_2287034 ?auto_2287029 ) ) ( HOIST-AT ?auto_2287032 ?auto_2287034 ) ( not ( = ?auto_2287033 ?auto_2287032 ) ) ( AVAILABLE ?auto_2287032 ) ( SURFACE-AT ?auto_2287028 ?auto_2287034 ) ( ON ?auto_2287028 ?auto_2287031 ) ( CLEAR ?auto_2287028 ) ( not ( = ?auto_2287027 ?auto_2287031 ) ) ( not ( = ?auto_2287028 ?auto_2287031 ) ) ( not ( = ?auto_2287026 ?auto_2287031 ) ) ( TRUCK-AT ?auto_2287030 ?auto_2287029 ) ( SURFACE-AT ?auto_2287026 ?auto_2287029 ) ( CLEAR ?auto_2287026 ) ( LIFTING ?auto_2287033 ?auto_2287027 ) ( IS-CRATE ?auto_2287027 ) ( ON ?auto_2287018 ?auto_2287017 ) ( ON ?auto_2287019 ?auto_2287018 ) ( ON ?auto_2287021 ?auto_2287019 ) ( ON ?auto_2287020 ?auto_2287021 ) ( ON ?auto_2287022 ?auto_2287020 ) ( ON ?auto_2287023 ?auto_2287022 ) ( ON ?auto_2287024 ?auto_2287023 ) ( ON ?auto_2287025 ?auto_2287024 ) ( ON ?auto_2287026 ?auto_2287025 ) ( not ( = ?auto_2287017 ?auto_2287018 ) ) ( not ( = ?auto_2287017 ?auto_2287019 ) ) ( not ( = ?auto_2287017 ?auto_2287021 ) ) ( not ( = ?auto_2287017 ?auto_2287020 ) ) ( not ( = ?auto_2287017 ?auto_2287022 ) ) ( not ( = ?auto_2287017 ?auto_2287023 ) ) ( not ( = ?auto_2287017 ?auto_2287024 ) ) ( not ( = ?auto_2287017 ?auto_2287025 ) ) ( not ( = ?auto_2287017 ?auto_2287026 ) ) ( not ( = ?auto_2287017 ?auto_2287027 ) ) ( not ( = ?auto_2287017 ?auto_2287028 ) ) ( not ( = ?auto_2287017 ?auto_2287031 ) ) ( not ( = ?auto_2287018 ?auto_2287019 ) ) ( not ( = ?auto_2287018 ?auto_2287021 ) ) ( not ( = ?auto_2287018 ?auto_2287020 ) ) ( not ( = ?auto_2287018 ?auto_2287022 ) ) ( not ( = ?auto_2287018 ?auto_2287023 ) ) ( not ( = ?auto_2287018 ?auto_2287024 ) ) ( not ( = ?auto_2287018 ?auto_2287025 ) ) ( not ( = ?auto_2287018 ?auto_2287026 ) ) ( not ( = ?auto_2287018 ?auto_2287027 ) ) ( not ( = ?auto_2287018 ?auto_2287028 ) ) ( not ( = ?auto_2287018 ?auto_2287031 ) ) ( not ( = ?auto_2287019 ?auto_2287021 ) ) ( not ( = ?auto_2287019 ?auto_2287020 ) ) ( not ( = ?auto_2287019 ?auto_2287022 ) ) ( not ( = ?auto_2287019 ?auto_2287023 ) ) ( not ( = ?auto_2287019 ?auto_2287024 ) ) ( not ( = ?auto_2287019 ?auto_2287025 ) ) ( not ( = ?auto_2287019 ?auto_2287026 ) ) ( not ( = ?auto_2287019 ?auto_2287027 ) ) ( not ( = ?auto_2287019 ?auto_2287028 ) ) ( not ( = ?auto_2287019 ?auto_2287031 ) ) ( not ( = ?auto_2287021 ?auto_2287020 ) ) ( not ( = ?auto_2287021 ?auto_2287022 ) ) ( not ( = ?auto_2287021 ?auto_2287023 ) ) ( not ( = ?auto_2287021 ?auto_2287024 ) ) ( not ( = ?auto_2287021 ?auto_2287025 ) ) ( not ( = ?auto_2287021 ?auto_2287026 ) ) ( not ( = ?auto_2287021 ?auto_2287027 ) ) ( not ( = ?auto_2287021 ?auto_2287028 ) ) ( not ( = ?auto_2287021 ?auto_2287031 ) ) ( not ( = ?auto_2287020 ?auto_2287022 ) ) ( not ( = ?auto_2287020 ?auto_2287023 ) ) ( not ( = ?auto_2287020 ?auto_2287024 ) ) ( not ( = ?auto_2287020 ?auto_2287025 ) ) ( not ( = ?auto_2287020 ?auto_2287026 ) ) ( not ( = ?auto_2287020 ?auto_2287027 ) ) ( not ( = ?auto_2287020 ?auto_2287028 ) ) ( not ( = ?auto_2287020 ?auto_2287031 ) ) ( not ( = ?auto_2287022 ?auto_2287023 ) ) ( not ( = ?auto_2287022 ?auto_2287024 ) ) ( not ( = ?auto_2287022 ?auto_2287025 ) ) ( not ( = ?auto_2287022 ?auto_2287026 ) ) ( not ( = ?auto_2287022 ?auto_2287027 ) ) ( not ( = ?auto_2287022 ?auto_2287028 ) ) ( not ( = ?auto_2287022 ?auto_2287031 ) ) ( not ( = ?auto_2287023 ?auto_2287024 ) ) ( not ( = ?auto_2287023 ?auto_2287025 ) ) ( not ( = ?auto_2287023 ?auto_2287026 ) ) ( not ( = ?auto_2287023 ?auto_2287027 ) ) ( not ( = ?auto_2287023 ?auto_2287028 ) ) ( not ( = ?auto_2287023 ?auto_2287031 ) ) ( not ( = ?auto_2287024 ?auto_2287025 ) ) ( not ( = ?auto_2287024 ?auto_2287026 ) ) ( not ( = ?auto_2287024 ?auto_2287027 ) ) ( not ( = ?auto_2287024 ?auto_2287028 ) ) ( not ( = ?auto_2287024 ?auto_2287031 ) ) ( not ( = ?auto_2287025 ?auto_2287026 ) ) ( not ( = ?auto_2287025 ?auto_2287027 ) ) ( not ( = ?auto_2287025 ?auto_2287028 ) ) ( not ( = ?auto_2287025 ?auto_2287031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2287026 ?auto_2287027 ?auto_2287028 )
      ( MAKE-11CRATE-VERIFY ?auto_2287017 ?auto_2287018 ?auto_2287019 ?auto_2287021 ?auto_2287020 ?auto_2287022 ?auto_2287023 ?auto_2287024 ?auto_2287025 ?auto_2287026 ?auto_2287027 ?auto_2287028 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2287161 - SURFACE
      ?auto_2287162 - SURFACE
      ?auto_2287163 - SURFACE
      ?auto_2287165 - SURFACE
      ?auto_2287164 - SURFACE
      ?auto_2287166 - SURFACE
      ?auto_2287167 - SURFACE
      ?auto_2287168 - SURFACE
      ?auto_2287169 - SURFACE
      ?auto_2287170 - SURFACE
      ?auto_2287171 - SURFACE
      ?auto_2287172 - SURFACE
    )
    :vars
    (
      ?auto_2287176 - HOIST
      ?auto_2287178 - PLACE
      ?auto_2287175 - PLACE
      ?auto_2287177 - HOIST
      ?auto_2287173 - SURFACE
      ?auto_2287174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2287176 ?auto_2287178 ) ( IS-CRATE ?auto_2287172 ) ( not ( = ?auto_2287171 ?auto_2287172 ) ) ( not ( = ?auto_2287170 ?auto_2287171 ) ) ( not ( = ?auto_2287170 ?auto_2287172 ) ) ( not ( = ?auto_2287175 ?auto_2287178 ) ) ( HOIST-AT ?auto_2287177 ?auto_2287175 ) ( not ( = ?auto_2287176 ?auto_2287177 ) ) ( AVAILABLE ?auto_2287177 ) ( SURFACE-AT ?auto_2287172 ?auto_2287175 ) ( ON ?auto_2287172 ?auto_2287173 ) ( CLEAR ?auto_2287172 ) ( not ( = ?auto_2287171 ?auto_2287173 ) ) ( not ( = ?auto_2287172 ?auto_2287173 ) ) ( not ( = ?auto_2287170 ?auto_2287173 ) ) ( TRUCK-AT ?auto_2287174 ?auto_2287178 ) ( SURFACE-AT ?auto_2287170 ?auto_2287178 ) ( CLEAR ?auto_2287170 ) ( IS-CRATE ?auto_2287171 ) ( AVAILABLE ?auto_2287176 ) ( IN ?auto_2287171 ?auto_2287174 ) ( ON ?auto_2287162 ?auto_2287161 ) ( ON ?auto_2287163 ?auto_2287162 ) ( ON ?auto_2287165 ?auto_2287163 ) ( ON ?auto_2287164 ?auto_2287165 ) ( ON ?auto_2287166 ?auto_2287164 ) ( ON ?auto_2287167 ?auto_2287166 ) ( ON ?auto_2287168 ?auto_2287167 ) ( ON ?auto_2287169 ?auto_2287168 ) ( ON ?auto_2287170 ?auto_2287169 ) ( not ( = ?auto_2287161 ?auto_2287162 ) ) ( not ( = ?auto_2287161 ?auto_2287163 ) ) ( not ( = ?auto_2287161 ?auto_2287165 ) ) ( not ( = ?auto_2287161 ?auto_2287164 ) ) ( not ( = ?auto_2287161 ?auto_2287166 ) ) ( not ( = ?auto_2287161 ?auto_2287167 ) ) ( not ( = ?auto_2287161 ?auto_2287168 ) ) ( not ( = ?auto_2287161 ?auto_2287169 ) ) ( not ( = ?auto_2287161 ?auto_2287170 ) ) ( not ( = ?auto_2287161 ?auto_2287171 ) ) ( not ( = ?auto_2287161 ?auto_2287172 ) ) ( not ( = ?auto_2287161 ?auto_2287173 ) ) ( not ( = ?auto_2287162 ?auto_2287163 ) ) ( not ( = ?auto_2287162 ?auto_2287165 ) ) ( not ( = ?auto_2287162 ?auto_2287164 ) ) ( not ( = ?auto_2287162 ?auto_2287166 ) ) ( not ( = ?auto_2287162 ?auto_2287167 ) ) ( not ( = ?auto_2287162 ?auto_2287168 ) ) ( not ( = ?auto_2287162 ?auto_2287169 ) ) ( not ( = ?auto_2287162 ?auto_2287170 ) ) ( not ( = ?auto_2287162 ?auto_2287171 ) ) ( not ( = ?auto_2287162 ?auto_2287172 ) ) ( not ( = ?auto_2287162 ?auto_2287173 ) ) ( not ( = ?auto_2287163 ?auto_2287165 ) ) ( not ( = ?auto_2287163 ?auto_2287164 ) ) ( not ( = ?auto_2287163 ?auto_2287166 ) ) ( not ( = ?auto_2287163 ?auto_2287167 ) ) ( not ( = ?auto_2287163 ?auto_2287168 ) ) ( not ( = ?auto_2287163 ?auto_2287169 ) ) ( not ( = ?auto_2287163 ?auto_2287170 ) ) ( not ( = ?auto_2287163 ?auto_2287171 ) ) ( not ( = ?auto_2287163 ?auto_2287172 ) ) ( not ( = ?auto_2287163 ?auto_2287173 ) ) ( not ( = ?auto_2287165 ?auto_2287164 ) ) ( not ( = ?auto_2287165 ?auto_2287166 ) ) ( not ( = ?auto_2287165 ?auto_2287167 ) ) ( not ( = ?auto_2287165 ?auto_2287168 ) ) ( not ( = ?auto_2287165 ?auto_2287169 ) ) ( not ( = ?auto_2287165 ?auto_2287170 ) ) ( not ( = ?auto_2287165 ?auto_2287171 ) ) ( not ( = ?auto_2287165 ?auto_2287172 ) ) ( not ( = ?auto_2287165 ?auto_2287173 ) ) ( not ( = ?auto_2287164 ?auto_2287166 ) ) ( not ( = ?auto_2287164 ?auto_2287167 ) ) ( not ( = ?auto_2287164 ?auto_2287168 ) ) ( not ( = ?auto_2287164 ?auto_2287169 ) ) ( not ( = ?auto_2287164 ?auto_2287170 ) ) ( not ( = ?auto_2287164 ?auto_2287171 ) ) ( not ( = ?auto_2287164 ?auto_2287172 ) ) ( not ( = ?auto_2287164 ?auto_2287173 ) ) ( not ( = ?auto_2287166 ?auto_2287167 ) ) ( not ( = ?auto_2287166 ?auto_2287168 ) ) ( not ( = ?auto_2287166 ?auto_2287169 ) ) ( not ( = ?auto_2287166 ?auto_2287170 ) ) ( not ( = ?auto_2287166 ?auto_2287171 ) ) ( not ( = ?auto_2287166 ?auto_2287172 ) ) ( not ( = ?auto_2287166 ?auto_2287173 ) ) ( not ( = ?auto_2287167 ?auto_2287168 ) ) ( not ( = ?auto_2287167 ?auto_2287169 ) ) ( not ( = ?auto_2287167 ?auto_2287170 ) ) ( not ( = ?auto_2287167 ?auto_2287171 ) ) ( not ( = ?auto_2287167 ?auto_2287172 ) ) ( not ( = ?auto_2287167 ?auto_2287173 ) ) ( not ( = ?auto_2287168 ?auto_2287169 ) ) ( not ( = ?auto_2287168 ?auto_2287170 ) ) ( not ( = ?auto_2287168 ?auto_2287171 ) ) ( not ( = ?auto_2287168 ?auto_2287172 ) ) ( not ( = ?auto_2287168 ?auto_2287173 ) ) ( not ( = ?auto_2287169 ?auto_2287170 ) ) ( not ( = ?auto_2287169 ?auto_2287171 ) ) ( not ( = ?auto_2287169 ?auto_2287172 ) ) ( not ( = ?auto_2287169 ?auto_2287173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2287170 ?auto_2287171 ?auto_2287172 )
      ( MAKE-11CRATE-VERIFY ?auto_2287161 ?auto_2287162 ?auto_2287163 ?auto_2287165 ?auto_2287164 ?auto_2287166 ?auto_2287167 ?auto_2287168 ?auto_2287169 ?auto_2287170 ?auto_2287171 ?auto_2287172 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2296411 - SURFACE
      ?auto_2296412 - SURFACE
      ?auto_2296413 - SURFACE
      ?auto_2296415 - SURFACE
      ?auto_2296414 - SURFACE
      ?auto_2296416 - SURFACE
      ?auto_2296417 - SURFACE
      ?auto_2296418 - SURFACE
      ?auto_2296419 - SURFACE
      ?auto_2296420 - SURFACE
      ?auto_2296421 - SURFACE
      ?auto_2296422 - SURFACE
      ?auto_2296423 - SURFACE
    )
    :vars
    (
      ?auto_2296425 - HOIST
      ?auto_2296424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2296425 ?auto_2296424 ) ( SURFACE-AT ?auto_2296422 ?auto_2296424 ) ( CLEAR ?auto_2296422 ) ( LIFTING ?auto_2296425 ?auto_2296423 ) ( IS-CRATE ?auto_2296423 ) ( not ( = ?auto_2296422 ?auto_2296423 ) ) ( ON ?auto_2296412 ?auto_2296411 ) ( ON ?auto_2296413 ?auto_2296412 ) ( ON ?auto_2296415 ?auto_2296413 ) ( ON ?auto_2296414 ?auto_2296415 ) ( ON ?auto_2296416 ?auto_2296414 ) ( ON ?auto_2296417 ?auto_2296416 ) ( ON ?auto_2296418 ?auto_2296417 ) ( ON ?auto_2296419 ?auto_2296418 ) ( ON ?auto_2296420 ?auto_2296419 ) ( ON ?auto_2296421 ?auto_2296420 ) ( ON ?auto_2296422 ?auto_2296421 ) ( not ( = ?auto_2296411 ?auto_2296412 ) ) ( not ( = ?auto_2296411 ?auto_2296413 ) ) ( not ( = ?auto_2296411 ?auto_2296415 ) ) ( not ( = ?auto_2296411 ?auto_2296414 ) ) ( not ( = ?auto_2296411 ?auto_2296416 ) ) ( not ( = ?auto_2296411 ?auto_2296417 ) ) ( not ( = ?auto_2296411 ?auto_2296418 ) ) ( not ( = ?auto_2296411 ?auto_2296419 ) ) ( not ( = ?auto_2296411 ?auto_2296420 ) ) ( not ( = ?auto_2296411 ?auto_2296421 ) ) ( not ( = ?auto_2296411 ?auto_2296422 ) ) ( not ( = ?auto_2296411 ?auto_2296423 ) ) ( not ( = ?auto_2296412 ?auto_2296413 ) ) ( not ( = ?auto_2296412 ?auto_2296415 ) ) ( not ( = ?auto_2296412 ?auto_2296414 ) ) ( not ( = ?auto_2296412 ?auto_2296416 ) ) ( not ( = ?auto_2296412 ?auto_2296417 ) ) ( not ( = ?auto_2296412 ?auto_2296418 ) ) ( not ( = ?auto_2296412 ?auto_2296419 ) ) ( not ( = ?auto_2296412 ?auto_2296420 ) ) ( not ( = ?auto_2296412 ?auto_2296421 ) ) ( not ( = ?auto_2296412 ?auto_2296422 ) ) ( not ( = ?auto_2296412 ?auto_2296423 ) ) ( not ( = ?auto_2296413 ?auto_2296415 ) ) ( not ( = ?auto_2296413 ?auto_2296414 ) ) ( not ( = ?auto_2296413 ?auto_2296416 ) ) ( not ( = ?auto_2296413 ?auto_2296417 ) ) ( not ( = ?auto_2296413 ?auto_2296418 ) ) ( not ( = ?auto_2296413 ?auto_2296419 ) ) ( not ( = ?auto_2296413 ?auto_2296420 ) ) ( not ( = ?auto_2296413 ?auto_2296421 ) ) ( not ( = ?auto_2296413 ?auto_2296422 ) ) ( not ( = ?auto_2296413 ?auto_2296423 ) ) ( not ( = ?auto_2296415 ?auto_2296414 ) ) ( not ( = ?auto_2296415 ?auto_2296416 ) ) ( not ( = ?auto_2296415 ?auto_2296417 ) ) ( not ( = ?auto_2296415 ?auto_2296418 ) ) ( not ( = ?auto_2296415 ?auto_2296419 ) ) ( not ( = ?auto_2296415 ?auto_2296420 ) ) ( not ( = ?auto_2296415 ?auto_2296421 ) ) ( not ( = ?auto_2296415 ?auto_2296422 ) ) ( not ( = ?auto_2296415 ?auto_2296423 ) ) ( not ( = ?auto_2296414 ?auto_2296416 ) ) ( not ( = ?auto_2296414 ?auto_2296417 ) ) ( not ( = ?auto_2296414 ?auto_2296418 ) ) ( not ( = ?auto_2296414 ?auto_2296419 ) ) ( not ( = ?auto_2296414 ?auto_2296420 ) ) ( not ( = ?auto_2296414 ?auto_2296421 ) ) ( not ( = ?auto_2296414 ?auto_2296422 ) ) ( not ( = ?auto_2296414 ?auto_2296423 ) ) ( not ( = ?auto_2296416 ?auto_2296417 ) ) ( not ( = ?auto_2296416 ?auto_2296418 ) ) ( not ( = ?auto_2296416 ?auto_2296419 ) ) ( not ( = ?auto_2296416 ?auto_2296420 ) ) ( not ( = ?auto_2296416 ?auto_2296421 ) ) ( not ( = ?auto_2296416 ?auto_2296422 ) ) ( not ( = ?auto_2296416 ?auto_2296423 ) ) ( not ( = ?auto_2296417 ?auto_2296418 ) ) ( not ( = ?auto_2296417 ?auto_2296419 ) ) ( not ( = ?auto_2296417 ?auto_2296420 ) ) ( not ( = ?auto_2296417 ?auto_2296421 ) ) ( not ( = ?auto_2296417 ?auto_2296422 ) ) ( not ( = ?auto_2296417 ?auto_2296423 ) ) ( not ( = ?auto_2296418 ?auto_2296419 ) ) ( not ( = ?auto_2296418 ?auto_2296420 ) ) ( not ( = ?auto_2296418 ?auto_2296421 ) ) ( not ( = ?auto_2296418 ?auto_2296422 ) ) ( not ( = ?auto_2296418 ?auto_2296423 ) ) ( not ( = ?auto_2296419 ?auto_2296420 ) ) ( not ( = ?auto_2296419 ?auto_2296421 ) ) ( not ( = ?auto_2296419 ?auto_2296422 ) ) ( not ( = ?auto_2296419 ?auto_2296423 ) ) ( not ( = ?auto_2296420 ?auto_2296421 ) ) ( not ( = ?auto_2296420 ?auto_2296422 ) ) ( not ( = ?auto_2296420 ?auto_2296423 ) ) ( not ( = ?auto_2296421 ?auto_2296422 ) ) ( not ( = ?auto_2296421 ?auto_2296423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2296422 ?auto_2296423 )
      ( MAKE-12CRATE-VERIFY ?auto_2296411 ?auto_2296412 ?auto_2296413 ?auto_2296415 ?auto_2296414 ?auto_2296416 ?auto_2296417 ?auto_2296418 ?auto_2296419 ?auto_2296420 ?auto_2296421 ?auto_2296422 ?auto_2296423 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2296536 - SURFACE
      ?auto_2296537 - SURFACE
      ?auto_2296538 - SURFACE
      ?auto_2296540 - SURFACE
      ?auto_2296539 - SURFACE
      ?auto_2296541 - SURFACE
      ?auto_2296542 - SURFACE
      ?auto_2296543 - SURFACE
      ?auto_2296544 - SURFACE
      ?auto_2296545 - SURFACE
      ?auto_2296546 - SURFACE
      ?auto_2296547 - SURFACE
      ?auto_2296548 - SURFACE
    )
    :vars
    (
      ?auto_2296551 - HOIST
      ?auto_2296549 - PLACE
      ?auto_2296550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2296551 ?auto_2296549 ) ( SURFACE-AT ?auto_2296547 ?auto_2296549 ) ( CLEAR ?auto_2296547 ) ( IS-CRATE ?auto_2296548 ) ( not ( = ?auto_2296547 ?auto_2296548 ) ) ( TRUCK-AT ?auto_2296550 ?auto_2296549 ) ( AVAILABLE ?auto_2296551 ) ( IN ?auto_2296548 ?auto_2296550 ) ( ON ?auto_2296547 ?auto_2296546 ) ( not ( = ?auto_2296546 ?auto_2296547 ) ) ( not ( = ?auto_2296546 ?auto_2296548 ) ) ( ON ?auto_2296537 ?auto_2296536 ) ( ON ?auto_2296538 ?auto_2296537 ) ( ON ?auto_2296540 ?auto_2296538 ) ( ON ?auto_2296539 ?auto_2296540 ) ( ON ?auto_2296541 ?auto_2296539 ) ( ON ?auto_2296542 ?auto_2296541 ) ( ON ?auto_2296543 ?auto_2296542 ) ( ON ?auto_2296544 ?auto_2296543 ) ( ON ?auto_2296545 ?auto_2296544 ) ( ON ?auto_2296546 ?auto_2296545 ) ( not ( = ?auto_2296536 ?auto_2296537 ) ) ( not ( = ?auto_2296536 ?auto_2296538 ) ) ( not ( = ?auto_2296536 ?auto_2296540 ) ) ( not ( = ?auto_2296536 ?auto_2296539 ) ) ( not ( = ?auto_2296536 ?auto_2296541 ) ) ( not ( = ?auto_2296536 ?auto_2296542 ) ) ( not ( = ?auto_2296536 ?auto_2296543 ) ) ( not ( = ?auto_2296536 ?auto_2296544 ) ) ( not ( = ?auto_2296536 ?auto_2296545 ) ) ( not ( = ?auto_2296536 ?auto_2296546 ) ) ( not ( = ?auto_2296536 ?auto_2296547 ) ) ( not ( = ?auto_2296536 ?auto_2296548 ) ) ( not ( = ?auto_2296537 ?auto_2296538 ) ) ( not ( = ?auto_2296537 ?auto_2296540 ) ) ( not ( = ?auto_2296537 ?auto_2296539 ) ) ( not ( = ?auto_2296537 ?auto_2296541 ) ) ( not ( = ?auto_2296537 ?auto_2296542 ) ) ( not ( = ?auto_2296537 ?auto_2296543 ) ) ( not ( = ?auto_2296537 ?auto_2296544 ) ) ( not ( = ?auto_2296537 ?auto_2296545 ) ) ( not ( = ?auto_2296537 ?auto_2296546 ) ) ( not ( = ?auto_2296537 ?auto_2296547 ) ) ( not ( = ?auto_2296537 ?auto_2296548 ) ) ( not ( = ?auto_2296538 ?auto_2296540 ) ) ( not ( = ?auto_2296538 ?auto_2296539 ) ) ( not ( = ?auto_2296538 ?auto_2296541 ) ) ( not ( = ?auto_2296538 ?auto_2296542 ) ) ( not ( = ?auto_2296538 ?auto_2296543 ) ) ( not ( = ?auto_2296538 ?auto_2296544 ) ) ( not ( = ?auto_2296538 ?auto_2296545 ) ) ( not ( = ?auto_2296538 ?auto_2296546 ) ) ( not ( = ?auto_2296538 ?auto_2296547 ) ) ( not ( = ?auto_2296538 ?auto_2296548 ) ) ( not ( = ?auto_2296540 ?auto_2296539 ) ) ( not ( = ?auto_2296540 ?auto_2296541 ) ) ( not ( = ?auto_2296540 ?auto_2296542 ) ) ( not ( = ?auto_2296540 ?auto_2296543 ) ) ( not ( = ?auto_2296540 ?auto_2296544 ) ) ( not ( = ?auto_2296540 ?auto_2296545 ) ) ( not ( = ?auto_2296540 ?auto_2296546 ) ) ( not ( = ?auto_2296540 ?auto_2296547 ) ) ( not ( = ?auto_2296540 ?auto_2296548 ) ) ( not ( = ?auto_2296539 ?auto_2296541 ) ) ( not ( = ?auto_2296539 ?auto_2296542 ) ) ( not ( = ?auto_2296539 ?auto_2296543 ) ) ( not ( = ?auto_2296539 ?auto_2296544 ) ) ( not ( = ?auto_2296539 ?auto_2296545 ) ) ( not ( = ?auto_2296539 ?auto_2296546 ) ) ( not ( = ?auto_2296539 ?auto_2296547 ) ) ( not ( = ?auto_2296539 ?auto_2296548 ) ) ( not ( = ?auto_2296541 ?auto_2296542 ) ) ( not ( = ?auto_2296541 ?auto_2296543 ) ) ( not ( = ?auto_2296541 ?auto_2296544 ) ) ( not ( = ?auto_2296541 ?auto_2296545 ) ) ( not ( = ?auto_2296541 ?auto_2296546 ) ) ( not ( = ?auto_2296541 ?auto_2296547 ) ) ( not ( = ?auto_2296541 ?auto_2296548 ) ) ( not ( = ?auto_2296542 ?auto_2296543 ) ) ( not ( = ?auto_2296542 ?auto_2296544 ) ) ( not ( = ?auto_2296542 ?auto_2296545 ) ) ( not ( = ?auto_2296542 ?auto_2296546 ) ) ( not ( = ?auto_2296542 ?auto_2296547 ) ) ( not ( = ?auto_2296542 ?auto_2296548 ) ) ( not ( = ?auto_2296543 ?auto_2296544 ) ) ( not ( = ?auto_2296543 ?auto_2296545 ) ) ( not ( = ?auto_2296543 ?auto_2296546 ) ) ( not ( = ?auto_2296543 ?auto_2296547 ) ) ( not ( = ?auto_2296543 ?auto_2296548 ) ) ( not ( = ?auto_2296544 ?auto_2296545 ) ) ( not ( = ?auto_2296544 ?auto_2296546 ) ) ( not ( = ?auto_2296544 ?auto_2296547 ) ) ( not ( = ?auto_2296544 ?auto_2296548 ) ) ( not ( = ?auto_2296545 ?auto_2296546 ) ) ( not ( = ?auto_2296545 ?auto_2296547 ) ) ( not ( = ?auto_2296545 ?auto_2296548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2296546 ?auto_2296547 ?auto_2296548 )
      ( MAKE-12CRATE-VERIFY ?auto_2296536 ?auto_2296537 ?auto_2296538 ?auto_2296540 ?auto_2296539 ?auto_2296541 ?auto_2296542 ?auto_2296543 ?auto_2296544 ?auto_2296545 ?auto_2296546 ?auto_2296547 ?auto_2296548 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2296674 - SURFACE
      ?auto_2296675 - SURFACE
      ?auto_2296676 - SURFACE
      ?auto_2296678 - SURFACE
      ?auto_2296677 - SURFACE
      ?auto_2296679 - SURFACE
      ?auto_2296680 - SURFACE
      ?auto_2296681 - SURFACE
      ?auto_2296682 - SURFACE
      ?auto_2296683 - SURFACE
      ?auto_2296684 - SURFACE
      ?auto_2296685 - SURFACE
      ?auto_2296686 - SURFACE
    )
    :vars
    (
      ?auto_2296689 - HOIST
      ?auto_2296688 - PLACE
      ?auto_2296690 - TRUCK
      ?auto_2296687 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2296689 ?auto_2296688 ) ( SURFACE-AT ?auto_2296685 ?auto_2296688 ) ( CLEAR ?auto_2296685 ) ( IS-CRATE ?auto_2296686 ) ( not ( = ?auto_2296685 ?auto_2296686 ) ) ( AVAILABLE ?auto_2296689 ) ( IN ?auto_2296686 ?auto_2296690 ) ( ON ?auto_2296685 ?auto_2296684 ) ( not ( = ?auto_2296684 ?auto_2296685 ) ) ( not ( = ?auto_2296684 ?auto_2296686 ) ) ( TRUCK-AT ?auto_2296690 ?auto_2296687 ) ( not ( = ?auto_2296687 ?auto_2296688 ) ) ( ON ?auto_2296675 ?auto_2296674 ) ( ON ?auto_2296676 ?auto_2296675 ) ( ON ?auto_2296678 ?auto_2296676 ) ( ON ?auto_2296677 ?auto_2296678 ) ( ON ?auto_2296679 ?auto_2296677 ) ( ON ?auto_2296680 ?auto_2296679 ) ( ON ?auto_2296681 ?auto_2296680 ) ( ON ?auto_2296682 ?auto_2296681 ) ( ON ?auto_2296683 ?auto_2296682 ) ( ON ?auto_2296684 ?auto_2296683 ) ( not ( = ?auto_2296674 ?auto_2296675 ) ) ( not ( = ?auto_2296674 ?auto_2296676 ) ) ( not ( = ?auto_2296674 ?auto_2296678 ) ) ( not ( = ?auto_2296674 ?auto_2296677 ) ) ( not ( = ?auto_2296674 ?auto_2296679 ) ) ( not ( = ?auto_2296674 ?auto_2296680 ) ) ( not ( = ?auto_2296674 ?auto_2296681 ) ) ( not ( = ?auto_2296674 ?auto_2296682 ) ) ( not ( = ?auto_2296674 ?auto_2296683 ) ) ( not ( = ?auto_2296674 ?auto_2296684 ) ) ( not ( = ?auto_2296674 ?auto_2296685 ) ) ( not ( = ?auto_2296674 ?auto_2296686 ) ) ( not ( = ?auto_2296675 ?auto_2296676 ) ) ( not ( = ?auto_2296675 ?auto_2296678 ) ) ( not ( = ?auto_2296675 ?auto_2296677 ) ) ( not ( = ?auto_2296675 ?auto_2296679 ) ) ( not ( = ?auto_2296675 ?auto_2296680 ) ) ( not ( = ?auto_2296675 ?auto_2296681 ) ) ( not ( = ?auto_2296675 ?auto_2296682 ) ) ( not ( = ?auto_2296675 ?auto_2296683 ) ) ( not ( = ?auto_2296675 ?auto_2296684 ) ) ( not ( = ?auto_2296675 ?auto_2296685 ) ) ( not ( = ?auto_2296675 ?auto_2296686 ) ) ( not ( = ?auto_2296676 ?auto_2296678 ) ) ( not ( = ?auto_2296676 ?auto_2296677 ) ) ( not ( = ?auto_2296676 ?auto_2296679 ) ) ( not ( = ?auto_2296676 ?auto_2296680 ) ) ( not ( = ?auto_2296676 ?auto_2296681 ) ) ( not ( = ?auto_2296676 ?auto_2296682 ) ) ( not ( = ?auto_2296676 ?auto_2296683 ) ) ( not ( = ?auto_2296676 ?auto_2296684 ) ) ( not ( = ?auto_2296676 ?auto_2296685 ) ) ( not ( = ?auto_2296676 ?auto_2296686 ) ) ( not ( = ?auto_2296678 ?auto_2296677 ) ) ( not ( = ?auto_2296678 ?auto_2296679 ) ) ( not ( = ?auto_2296678 ?auto_2296680 ) ) ( not ( = ?auto_2296678 ?auto_2296681 ) ) ( not ( = ?auto_2296678 ?auto_2296682 ) ) ( not ( = ?auto_2296678 ?auto_2296683 ) ) ( not ( = ?auto_2296678 ?auto_2296684 ) ) ( not ( = ?auto_2296678 ?auto_2296685 ) ) ( not ( = ?auto_2296678 ?auto_2296686 ) ) ( not ( = ?auto_2296677 ?auto_2296679 ) ) ( not ( = ?auto_2296677 ?auto_2296680 ) ) ( not ( = ?auto_2296677 ?auto_2296681 ) ) ( not ( = ?auto_2296677 ?auto_2296682 ) ) ( not ( = ?auto_2296677 ?auto_2296683 ) ) ( not ( = ?auto_2296677 ?auto_2296684 ) ) ( not ( = ?auto_2296677 ?auto_2296685 ) ) ( not ( = ?auto_2296677 ?auto_2296686 ) ) ( not ( = ?auto_2296679 ?auto_2296680 ) ) ( not ( = ?auto_2296679 ?auto_2296681 ) ) ( not ( = ?auto_2296679 ?auto_2296682 ) ) ( not ( = ?auto_2296679 ?auto_2296683 ) ) ( not ( = ?auto_2296679 ?auto_2296684 ) ) ( not ( = ?auto_2296679 ?auto_2296685 ) ) ( not ( = ?auto_2296679 ?auto_2296686 ) ) ( not ( = ?auto_2296680 ?auto_2296681 ) ) ( not ( = ?auto_2296680 ?auto_2296682 ) ) ( not ( = ?auto_2296680 ?auto_2296683 ) ) ( not ( = ?auto_2296680 ?auto_2296684 ) ) ( not ( = ?auto_2296680 ?auto_2296685 ) ) ( not ( = ?auto_2296680 ?auto_2296686 ) ) ( not ( = ?auto_2296681 ?auto_2296682 ) ) ( not ( = ?auto_2296681 ?auto_2296683 ) ) ( not ( = ?auto_2296681 ?auto_2296684 ) ) ( not ( = ?auto_2296681 ?auto_2296685 ) ) ( not ( = ?auto_2296681 ?auto_2296686 ) ) ( not ( = ?auto_2296682 ?auto_2296683 ) ) ( not ( = ?auto_2296682 ?auto_2296684 ) ) ( not ( = ?auto_2296682 ?auto_2296685 ) ) ( not ( = ?auto_2296682 ?auto_2296686 ) ) ( not ( = ?auto_2296683 ?auto_2296684 ) ) ( not ( = ?auto_2296683 ?auto_2296685 ) ) ( not ( = ?auto_2296683 ?auto_2296686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2296684 ?auto_2296685 ?auto_2296686 )
      ( MAKE-12CRATE-VERIFY ?auto_2296674 ?auto_2296675 ?auto_2296676 ?auto_2296678 ?auto_2296677 ?auto_2296679 ?auto_2296680 ?auto_2296681 ?auto_2296682 ?auto_2296683 ?auto_2296684 ?auto_2296685 ?auto_2296686 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2296824 - SURFACE
      ?auto_2296825 - SURFACE
      ?auto_2296826 - SURFACE
      ?auto_2296828 - SURFACE
      ?auto_2296827 - SURFACE
      ?auto_2296829 - SURFACE
      ?auto_2296830 - SURFACE
      ?auto_2296831 - SURFACE
      ?auto_2296832 - SURFACE
      ?auto_2296833 - SURFACE
      ?auto_2296834 - SURFACE
      ?auto_2296835 - SURFACE
      ?auto_2296836 - SURFACE
    )
    :vars
    (
      ?auto_2296840 - HOIST
      ?auto_2296839 - PLACE
      ?auto_2296837 - TRUCK
      ?auto_2296841 - PLACE
      ?auto_2296838 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2296840 ?auto_2296839 ) ( SURFACE-AT ?auto_2296835 ?auto_2296839 ) ( CLEAR ?auto_2296835 ) ( IS-CRATE ?auto_2296836 ) ( not ( = ?auto_2296835 ?auto_2296836 ) ) ( AVAILABLE ?auto_2296840 ) ( ON ?auto_2296835 ?auto_2296834 ) ( not ( = ?auto_2296834 ?auto_2296835 ) ) ( not ( = ?auto_2296834 ?auto_2296836 ) ) ( TRUCK-AT ?auto_2296837 ?auto_2296841 ) ( not ( = ?auto_2296841 ?auto_2296839 ) ) ( HOIST-AT ?auto_2296838 ?auto_2296841 ) ( LIFTING ?auto_2296838 ?auto_2296836 ) ( not ( = ?auto_2296840 ?auto_2296838 ) ) ( ON ?auto_2296825 ?auto_2296824 ) ( ON ?auto_2296826 ?auto_2296825 ) ( ON ?auto_2296828 ?auto_2296826 ) ( ON ?auto_2296827 ?auto_2296828 ) ( ON ?auto_2296829 ?auto_2296827 ) ( ON ?auto_2296830 ?auto_2296829 ) ( ON ?auto_2296831 ?auto_2296830 ) ( ON ?auto_2296832 ?auto_2296831 ) ( ON ?auto_2296833 ?auto_2296832 ) ( ON ?auto_2296834 ?auto_2296833 ) ( not ( = ?auto_2296824 ?auto_2296825 ) ) ( not ( = ?auto_2296824 ?auto_2296826 ) ) ( not ( = ?auto_2296824 ?auto_2296828 ) ) ( not ( = ?auto_2296824 ?auto_2296827 ) ) ( not ( = ?auto_2296824 ?auto_2296829 ) ) ( not ( = ?auto_2296824 ?auto_2296830 ) ) ( not ( = ?auto_2296824 ?auto_2296831 ) ) ( not ( = ?auto_2296824 ?auto_2296832 ) ) ( not ( = ?auto_2296824 ?auto_2296833 ) ) ( not ( = ?auto_2296824 ?auto_2296834 ) ) ( not ( = ?auto_2296824 ?auto_2296835 ) ) ( not ( = ?auto_2296824 ?auto_2296836 ) ) ( not ( = ?auto_2296825 ?auto_2296826 ) ) ( not ( = ?auto_2296825 ?auto_2296828 ) ) ( not ( = ?auto_2296825 ?auto_2296827 ) ) ( not ( = ?auto_2296825 ?auto_2296829 ) ) ( not ( = ?auto_2296825 ?auto_2296830 ) ) ( not ( = ?auto_2296825 ?auto_2296831 ) ) ( not ( = ?auto_2296825 ?auto_2296832 ) ) ( not ( = ?auto_2296825 ?auto_2296833 ) ) ( not ( = ?auto_2296825 ?auto_2296834 ) ) ( not ( = ?auto_2296825 ?auto_2296835 ) ) ( not ( = ?auto_2296825 ?auto_2296836 ) ) ( not ( = ?auto_2296826 ?auto_2296828 ) ) ( not ( = ?auto_2296826 ?auto_2296827 ) ) ( not ( = ?auto_2296826 ?auto_2296829 ) ) ( not ( = ?auto_2296826 ?auto_2296830 ) ) ( not ( = ?auto_2296826 ?auto_2296831 ) ) ( not ( = ?auto_2296826 ?auto_2296832 ) ) ( not ( = ?auto_2296826 ?auto_2296833 ) ) ( not ( = ?auto_2296826 ?auto_2296834 ) ) ( not ( = ?auto_2296826 ?auto_2296835 ) ) ( not ( = ?auto_2296826 ?auto_2296836 ) ) ( not ( = ?auto_2296828 ?auto_2296827 ) ) ( not ( = ?auto_2296828 ?auto_2296829 ) ) ( not ( = ?auto_2296828 ?auto_2296830 ) ) ( not ( = ?auto_2296828 ?auto_2296831 ) ) ( not ( = ?auto_2296828 ?auto_2296832 ) ) ( not ( = ?auto_2296828 ?auto_2296833 ) ) ( not ( = ?auto_2296828 ?auto_2296834 ) ) ( not ( = ?auto_2296828 ?auto_2296835 ) ) ( not ( = ?auto_2296828 ?auto_2296836 ) ) ( not ( = ?auto_2296827 ?auto_2296829 ) ) ( not ( = ?auto_2296827 ?auto_2296830 ) ) ( not ( = ?auto_2296827 ?auto_2296831 ) ) ( not ( = ?auto_2296827 ?auto_2296832 ) ) ( not ( = ?auto_2296827 ?auto_2296833 ) ) ( not ( = ?auto_2296827 ?auto_2296834 ) ) ( not ( = ?auto_2296827 ?auto_2296835 ) ) ( not ( = ?auto_2296827 ?auto_2296836 ) ) ( not ( = ?auto_2296829 ?auto_2296830 ) ) ( not ( = ?auto_2296829 ?auto_2296831 ) ) ( not ( = ?auto_2296829 ?auto_2296832 ) ) ( not ( = ?auto_2296829 ?auto_2296833 ) ) ( not ( = ?auto_2296829 ?auto_2296834 ) ) ( not ( = ?auto_2296829 ?auto_2296835 ) ) ( not ( = ?auto_2296829 ?auto_2296836 ) ) ( not ( = ?auto_2296830 ?auto_2296831 ) ) ( not ( = ?auto_2296830 ?auto_2296832 ) ) ( not ( = ?auto_2296830 ?auto_2296833 ) ) ( not ( = ?auto_2296830 ?auto_2296834 ) ) ( not ( = ?auto_2296830 ?auto_2296835 ) ) ( not ( = ?auto_2296830 ?auto_2296836 ) ) ( not ( = ?auto_2296831 ?auto_2296832 ) ) ( not ( = ?auto_2296831 ?auto_2296833 ) ) ( not ( = ?auto_2296831 ?auto_2296834 ) ) ( not ( = ?auto_2296831 ?auto_2296835 ) ) ( not ( = ?auto_2296831 ?auto_2296836 ) ) ( not ( = ?auto_2296832 ?auto_2296833 ) ) ( not ( = ?auto_2296832 ?auto_2296834 ) ) ( not ( = ?auto_2296832 ?auto_2296835 ) ) ( not ( = ?auto_2296832 ?auto_2296836 ) ) ( not ( = ?auto_2296833 ?auto_2296834 ) ) ( not ( = ?auto_2296833 ?auto_2296835 ) ) ( not ( = ?auto_2296833 ?auto_2296836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2296834 ?auto_2296835 ?auto_2296836 )
      ( MAKE-12CRATE-VERIFY ?auto_2296824 ?auto_2296825 ?auto_2296826 ?auto_2296828 ?auto_2296827 ?auto_2296829 ?auto_2296830 ?auto_2296831 ?auto_2296832 ?auto_2296833 ?auto_2296834 ?auto_2296835 ?auto_2296836 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2296986 - SURFACE
      ?auto_2296987 - SURFACE
      ?auto_2296988 - SURFACE
      ?auto_2296990 - SURFACE
      ?auto_2296989 - SURFACE
      ?auto_2296991 - SURFACE
      ?auto_2296992 - SURFACE
      ?auto_2296993 - SURFACE
      ?auto_2296994 - SURFACE
      ?auto_2296995 - SURFACE
      ?auto_2296996 - SURFACE
      ?auto_2296997 - SURFACE
      ?auto_2296998 - SURFACE
    )
    :vars
    (
      ?auto_2297004 - HOIST
      ?auto_2296999 - PLACE
      ?auto_2297002 - TRUCK
      ?auto_2297001 - PLACE
      ?auto_2297003 - HOIST
      ?auto_2297000 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2297004 ?auto_2296999 ) ( SURFACE-AT ?auto_2296997 ?auto_2296999 ) ( CLEAR ?auto_2296997 ) ( IS-CRATE ?auto_2296998 ) ( not ( = ?auto_2296997 ?auto_2296998 ) ) ( AVAILABLE ?auto_2297004 ) ( ON ?auto_2296997 ?auto_2296996 ) ( not ( = ?auto_2296996 ?auto_2296997 ) ) ( not ( = ?auto_2296996 ?auto_2296998 ) ) ( TRUCK-AT ?auto_2297002 ?auto_2297001 ) ( not ( = ?auto_2297001 ?auto_2296999 ) ) ( HOIST-AT ?auto_2297003 ?auto_2297001 ) ( not ( = ?auto_2297004 ?auto_2297003 ) ) ( AVAILABLE ?auto_2297003 ) ( SURFACE-AT ?auto_2296998 ?auto_2297001 ) ( ON ?auto_2296998 ?auto_2297000 ) ( CLEAR ?auto_2296998 ) ( not ( = ?auto_2296997 ?auto_2297000 ) ) ( not ( = ?auto_2296998 ?auto_2297000 ) ) ( not ( = ?auto_2296996 ?auto_2297000 ) ) ( ON ?auto_2296987 ?auto_2296986 ) ( ON ?auto_2296988 ?auto_2296987 ) ( ON ?auto_2296990 ?auto_2296988 ) ( ON ?auto_2296989 ?auto_2296990 ) ( ON ?auto_2296991 ?auto_2296989 ) ( ON ?auto_2296992 ?auto_2296991 ) ( ON ?auto_2296993 ?auto_2296992 ) ( ON ?auto_2296994 ?auto_2296993 ) ( ON ?auto_2296995 ?auto_2296994 ) ( ON ?auto_2296996 ?auto_2296995 ) ( not ( = ?auto_2296986 ?auto_2296987 ) ) ( not ( = ?auto_2296986 ?auto_2296988 ) ) ( not ( = ?auto_2296986 ?auto_2296990 ) ) ( not ( = ?auto_2296986 ?auto_2296989 ) ) ( not ( = ?auto_2296986 ?auto_2296991 ) ) ( not ( = ?auto_2296986 ?auto_2296992 ) ) ( not ( = ?auto_2296986 ?auto_2296993 ) ) ( not ( = ?auto_2296986 ?auto_2296994 ) ) ( not ( = ?auto_2296986 ?auto_2296995 ) ) ( not ( = ?auto_2296986 ?auto_2296996 ) ) ( not ( = ?auto_2296986 ?auto_2296997 ) ) ( not ( = ?auto_2296986 ?auto_2296998 ) ) ( not ( = ?auto_2296986 ?auto_2297000 ) ) ( not ( = ?auto_2296987 ?auto_2296988 ) ) ( not ( = ?auto_2296987 ?auto_2296990 ) ) ( not ( = ?auto_2296987 ?auto_2296989 ) ) ( not ( = ?auto_2296987 ?auto_2296991 ) ) ( not ( = ?auto_2296987 ?auto_2296992 ) ) ( not ( = ?auto_2296987 ?auto_2296993 ) ) ( not ( = ?auto_2296987 ?auto_2296994 ) ) ( not ( = ?auto_2296987 ?auto_2296995 ) ) ( not ( = ?auto_2296987 ?auto_2296996 ) ) ( not ( = ?auto_2296987 ?auto_2296997 ) ) ( not ( = ?auto_2296987 ?auto_2296998 ) ) ( not ( = ?auto_2296987 ?auto_2297000 ) ) ( not ( = ?auto_2296988 ?auto_2296990 ) ) ( not ( = ?auto_2296988 ?auto_2296989 ) ) ( not ( = ?auto_2296988 ?auto_2296991 ) ) ( not ( = ?auto_2296988 ?auto_2296992 ) ) ( not ( = ?auto_2296988 ?auto_2296993 ) ) ( not ( = ?auto_2296988 ?auto_2296994 ) ) ( not ( = ?auto_2296988 ?auto_2296995 ) ) ( not ( = ?auto_2296988 ?auto_2296996 ) ) ( not ( = ?auto_2296988 ?auto_2296997 ) ) ( not ( = ?auto_2296988 ?auto_2296998 ) ) ( not ( = ?auto_2296988 ?auto_2297000 ) ) ( not ( = ?auto_2296990 ?auto_2296989 ) ) ( not ( = ?auto_2296990 ?auto_2296991 ) ) ( not ( = ?auto_2296990 ?auto_2296992 ) ) ( not ( = ?auto_2296990 ?auto_2296993 ) ) ( not ( = ?auto_2296990 ?auto_2296994 ) ) ( not ( = ?auto_2296990 ?auto_2296995 ) ) ( not ( = ?auto_2296990 ?auto_2296996 ) ) ( not ( = ?auto_2296990 ?auto_2296997 ) ) ( not ( = ?auto_2296990 ?auto_2296998 ) ) ( not ( = ?auto_2296990 ?auto_2297000 ) ) ( not ( = ?auto_2296989 ?auto_2296991 ) ) ( not ( = ?auto_2296989 ?auto_2296992 ) ) ( not ( = ?auto_2296989 ?auto_2296993 ) ) ( not ( = ?auto_2296989 ?auto_2296994 ) ) ( not ( = ?auto_2296989 ?auto_2296995 ) ) ( not ( = ?auto_2296989 ?auto_2296996 ) ) ( not ( = ?auto_2296989 ?auto_2296997 ) ) ( not ( = ?auto_2296989 ?auto_2296998 ) ) ( not ( = ?auto_2296989 ?auto_2297000 ) ) ( not ( = ?auto_2296991 ?auto_2296992 ) ) ( not ( = ?auto_2296991 ?auto_2296993 ) ) ( not ( = ?auto_2296991 ?auto_2296994 ) ) ( not ( = ?auto_2296991 ?auto_2296995 ) ) ( not ( = ?auto_2296991 ?auto_2296996 ) ) ( not ( = ?auto_2296991 ?auto_2296997 ) ) ( not ( = ?auto_2296991 ?auto_2296998 ) ) ( not ( = ?auto_2296991 ?auto_2297000 ) ) ( not ( = ?auto_2296992 ?auto_2296993 ) ) ( not ( = ?auto_2296992 ?auto_2296994 ) ) ( not ( = ?auto_2296992 ?auto_2296995 ) ) ( not ( = ?auto_2296992 ?auto_2296996 ) ) ( not ( = ?auto_2296992 ?auto_2296997 ) ) ( not ( = ?auto_2296992 ?auto_2296998 ) ) ( not ( = ?auto_2296992 ?auto_2297000 ) ) ( not ( = ?auto_2296993 ?auto_2296994 ) ) ( not ( = ?auto_2296993 ?auto_2296995 ) ) ( not ( = ?auto_2296993 ?auto_2296996 ) ) ( not ( = ?auto_2296993 ?auto_2296997 ) ) ( not ( = ?auto_2296993 ?auto_2296998 ) ) ( not ( = ?auto_2296993 ?auto_2297000 ) ) ( not ( = ?auto_2296994 ?auto_2296995 ) ) ( not ( = ?auto_2296994 ?auto_2296996 ) ) ( not ( = ?auto_2296994 ?auto_2296997 ) ) ( not ( = ?auto_2296994 ?auto_2296998 ) ) ( not ( = ?auto_2296994 ?auto_2297000 ) ) ( not ( = ?auto_2296995 ?auto_2296996 ) ) ( not ( = ?auto_2296995 ?auto_2296997 ) ) ( not ( = ?auto_2296995 ?auto_2296998 ) ) ( not ( = ?auto_2296995 ?auto_2297000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2296996 ?auto_2296997 ?auto_2296998 )
      ( MAKE-12CRATE-VERIFY ?auto_2296986 ?auto_2296987 ?auto_2296988 ?auto_2296990 ?auto_2296989 ?auto_2296991 ?auto_2296992 ?auto_2296993 ?auto_2296994 ?auto_2296995 ?auto_2296996 ?auto_2296997 ?auto_2296998 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2297149 - SURFACE
      ?auto_2297150 - SURFACE
      ?auto_2297151 - SURFACE
      ?auto_2297153 - SURFACE
      ?auto_2297152 - SURFACE
      ?auto_2297154 - SURFACE
      ?auto_2297155 - SURFACE
      ?auto_2297156 - SURFACE
      ?auto_2297157 - SURFACE
      ?auto_2297158 - SURFACE
      ?auto_2297159 - SURFACE
      ?auto_2297160 - SURFACE
      ?auto_2297161 - SURFACE
    )
    :vars
    (
      ?auto_2297165 - HOIST
      ?auto_2297162 - PLACE
      ?auto_2297163 - PLACE
      ?auto_2297166 - HOIST
      ?auto_2297164 - SURFACE
      ?auto_2297167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2297165 ?auto_2297162 ) ( SURFACE-AT ?auto_2297160 ?auto_2297162 ) ( CLEAR ?auto_2297160 ) ( IS-CRATE ?auto_2297161 ) ( not ( = ?auto_2297160 ?auto_2297161 ) ) ( AVAILABLE ?auto_2297165 ) ( ON ?auto_2297160 ?auto_2297159 ) ( not ( = ?auto_2297159 ?auto_2297160 ) ) ( not ( = ?auto_2297159 ?auto_2297161 ) ) ( not ( = ?auto_2297163 ?auto_2297162 ) ) ( HOIST-AT ?auto_2297166 ?auto_2297163 ) ( not ( = ?auto_2297165 ?auto_2297166 ) ) ( AVAILABLE ?auto_2297166 ) ( SURFACE-AT ?auto_2297161 ?auto_2297163 ) ( ON ?auto_2297161 ?auto_2297164 ) ( CLEAR ?auto_2297161 ) ( not ( = ?auto_2297160 ?auto_2297164 ) ) ( not ( = ?auto_2297161 ?auto_2297164 ) ) ( not ( = ?auto_2297159 ?auto_2297164 ) ) ( TRUCK-AT ?auto_2297167 ?auto_2297162 ) ( ON ?auto_2297150 ?auto_2297149 ) ( ON ?auto_2297151 ?auto_2297150 ) ( ON ?auto_2297153 ?auto_2297151 ) ( ON ?auto_2297152 ?auto_2297153 ) ( ON ?auto_2297154 ?auto_2297152 ) ( ON ?auto_2297155 ?auto_2297154 ) ( ON ?auto_2297156 ?auto_2297155 ) ( ON ?auto_2297157 ?auto_2297156 ) ( ON ?auto_2297158 ?auto_2297157 ) ( ON ?auto_2297159 ?auto_2297158 ) ( not ( = ?auto_2297149 ?auto_2297150 ) ) ( not ( = ?auto_2297149 ?auto_2297151 ) ) ( not ( = ?auto_2297149 ?auto_2297153 ) ) ( not ( = ?auto_2297149 ?auto_2297152 ) ) ( not ( = ?auto_2297149 ?auto_2297154 ) ) ( not ( = ?auto_2297149 ?auto_2297155 ) ) ( not ( = ?auto_2297149 ?auto_2297156 ) ) ( not ( = ?auto_2297149 ?auto_2297157 ) ) ( not ( = ?auto_2297149 ?auto_2297158 ) ) ( not ( = ?auto_2297149 ?auto_2297159 ) ) ( not ( = ?auto_2297149 ?auto_2297160 ) ) ( not ( = ?auto_2297149 ?auto_2297161 ) ) ( not ( = ?auto_2297149 ?auto_2297164 ) ) ( not ( = ?auto_2297150 ?auto_2297151 ) ) ( not ( = ?auto_2297150 ?auto_2297153 ) ) ( not ( = ?auto_2297150 ?auto_2297152 ) ) ( not ( = ?auto_2297150 ?auto_2297154 ) ) ( not ( = ?auto_2297150 ?auto_2297155 ) ) ( not ( = ?auto_2297150 ?auto_2297156 ) ) ( not ( = ?auto_2297150 ?auto_2297157 ) ) ( not ( = ?auto_2297150 ?auto_2297158 ) ) ( not ( = ?auto_2297150 ?auto_2297159 ) ) ( not ( = ?auto_2297150 ?auto_2297160 ) ) ( not ( = ?auto_2297150 ?auto_2297161 ) ) ( not ( = ?auto_2297150 ?auto_2297164 ) ) ( not ( = ?auto_2297151 ?auto_2297153 ) ) ( not ( = ?auto_2297151 ?auto_2297152 ) ) ( not ( = ?auto_2297151 ?auto_2297154 ) ) ( not ( = ?auto_2297151 ?auto_2297155 ) ) ( not ( = ?auto_2297151 ?auto_2297156 ) ) ( not ( = ?auto_2297151 ?auto_2297157 ) ) ( not ( = ?auto_2297151 ?auto_2297158 ) ) ( not ( = ?auto_2297151 ?auto_2297159 ) ) ( not ( = ?auto_2297151 ?auto_2297160 ) ) ( not ( = ?auto_2297151 ?auto_2297161 ) ) ( not ( = ?auto_2297151 ?auto_2297164 ) ) ( not ( = ?auto_2297153 ?auto_2297152 ) ) ( not ( = ?auto_2297153 ?auto_2297154 ) ) ( not ( = ?auto_2297153 ?auto_2297155 ) ) ( not ( = ?auto_2297153 ?auto_2297156 ) ) ( not ( = ?auto_2297153 ?auto_2297157 ) ) ( not ( = ?auto_2297153 ?auto_2297158 ) ) ( not ( = ?auto_2297153 ?auto_2297159 ) ) ( not ( = ?auto_2297153 ?auto_2297160 ) ) ( not ( = ?auto_2297153 ?auto_2297161 ) ) ( not ( = ?auto_2297153 ?auto_2297164 ) ) ( not ( = ?auto_2297152 ?auto_2297154 ) ) ( not ( = ?auto_2297152 ?auto_2297155 ) ) ( not ( = ?auto_2297152 ?auto_2297156 ) ) ( not ( = ?auto_2297152 ?auto_2297157 ) ) ( not ( = ?auto_2297152 ?auto_2297158 ) ) ( not ( = ?auto_2297152 ?auto_2297159 ) ) ( not ( = ?auto_2297152 ?auto_2297160 ) ) ( not ( = ?auto_2297152 ?auto_2297161 ) ) ( not ( = ?auto_2297152 ?auto_2297164 ) ) ( not ( = ?auto_2297154 ?auto_2297155 ) ) ( not ( = ?auto_2297154 ?auto_2297156 ) ) ( not ( = ?auto_2297154 ?auto_2297157 ) ) ( not ( = ?auto_2297154 ?auto_2297158 ) ) ( not ( = ?auto_2297154 ?auto_2297159 ) ) ( not ( = ?auto_2297154 ?auto_2297160 ) ) ( not ( = ?auto_2297154 ?auto_2297161 ) ) ( not ( = ?auto_2297154 ?auto_2297164 ) ) ( not ( = ?auto_2297155 ?auto_2297156 ) ) ( not ( = ?auto_2297155 ?auto_2297157 ) ) ( not ( = ?auto_2297155 ?auto_2297158 ) ) ( not ( = ?auto_2297155 ?auto_2297159 ) ) ( not ( = ?auto_2297155 ?auto_2297160 ) ) ( not ( = ?auto_2297155 ?auto_2297161 ) ) ( not ( = ?auto_2297155 ?auto_2297164 ) ) ( not ( = ?auto_2297156 ?auto_2297157 ) ) ( not ( = ?auto_2297156 ?auto_2297158 ) ) ( not ( = ?auto_2297156 ?auto_2297159 ) ) ( not ( = ?auto_2297156 ?auto_2297160 ) ) ( not ( = ?auto_2297156 ?auto_2297161 ) ) ( not ( = ?auto_2297156 ?auto_2297164 ) ) ( not ( = ?auto_2297157 ?auto_2297158 ) ) ( not ( = ?auto_2297157 ?auto_2297159 ) ) ( not ( = ?auto_2297157 ?auto_2297160 ) ) ( not ( = ?auto_2297157 ?auto_2297161 ) ) ( not ( = ?auto_2297157 ?auto_2297164 ) ) ( not ( = ?auto_2297158 ?auto_2297159 ) ) ( not ( = ?auto_2297158 ?auto_2297160 ) ) ( not ( = ?auto_2297158 ?auto_2297161 ) ) ( not ( = ?auto_2297158 ?auto_2297164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2297159 ?auto_2297160 ?auto_2297161 )
      ( MAKE-12CRATE-VERIFY ?auto_2297149 ?auto_2297150 ?auto_2297151 ?auto_2297153 ?auto_2297152 ?auto_2297154 ?auto_2297155 ?auto_2297156 ?auto_2297157 ?auto_2297158 ?auto_2297159 ?auto_2297160 ?auto_2297161 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2297312 - SURFACE
      ?auto_2297313 - SURFACE
      ?auto_2297314 - SURFACE
      ?auto_2297316 - SURFACE
      ?auto_2297315 - SURFACE
      ?auto_2297317 - SURFACE
      ?auto_2297318 - SURFACE
      ?auto_2297319 - SURFACE
      ?auto_2297320 - SURFACE
      ?auto_2297321 - SURFACE
      ?auto_2297322 - SURFACE
      ?auto_2297323 - SURFACE
      ?auto_2297324 - SURFACE
    )
    :vars
    (
      ?auto_2297330 - HOIST
      ?auto_2297329 - PLACE
      ?auto_2297328 - PLACE
      ?auto_2297327 - HOIST
      ?auto_2297325 - SURFACE
      ?auto_2297326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2297330 ?auto_2297329 ) ( IS-CRATE ?auto_2297324 ) ( not ( = ?auto_2297323 ?auto_2297324 ) ) ( not ( = ?auto_2297322 ?auto_2297323 ) ) ( not ( = ?auto_2297322 ?auto_2297324 ) ) ( not ( = ?auto_2297328 ?auto_2297329 ) ) ( HOIST-AT ?auto_2297327 ?auto_2297328 ) ( not ( = ?auto_2297330 ?auto_2297327 ) ) ( AVAILABLE ?auto_2297327 ) ( SURFACE-AT ?auto_2297324 ?auto_2297328 ) ( ON ?auto_2297324 ?auto_2297325 ) ( CLEAR ?auto_2297324 ) ( not ( = ?auto_2297323 ?auto_2297325 ) ) ( not ( = ?auto_2297324 ?auto_2297325 ) ) ( not ( = ?auto_2297322 ?auto_2297325 ) ) ( TRUCK-AT ?auto_2297326 ?auto_2297329 ) ( SURFACE-AT ?auto_2297322 ?auto_2297329 ) ( CLEAR ?auto_2297322 ) ( LIFTING ?auto_2297330 ?auto_2297323 ) ( IS-CRATE ?auto_2297323 ) ( ON ?auto_2297313 ?auto_2297312 ) ( ON ?auto_2297314 ?auto_2297313 ) ( ON ?auto_2297316 ?auto_2297314 ) ( ON ?auto_2297315 ?auto_2297316 ) ( ON ?auto_2297317 ?auto_2297315 ) ( ON ?auto_2297318 ?auto_2297317 ) ( ON ?auto_2297319 ?auto_2297318 ) ( ON ?auto_2297320 ?auto_2297319 ) ( ON ?auto_2297321 ?auto_2297320 ) ( ON ?auto_2297322 ?auto_2297321 ) ( not ( = ?auto_2297312 ?auto_2297313 ) ) ( not ( = ?auto_2297312 ?auto_2297314 ) ) ( not ( = ?auto_2297312 ?auto_2297316 ) ) ( not ( = ?auto_2297312 ?auto_2297315 ) ) ( not ( = ?auto_2297312 ?auto_2297317 ) ) ( not ( = ?auto_2297312 ?auto_2297318 ) ) ( not ( = ?auto_2297312 ?auto_2297319 ) ) ( not ( = ?auto_2297312 ?auto_2297320 ) ) ( not ( = ?auto_2297312 ?auto_2297321 ) ) ( not ( = ?auto_2297312 ?auto_2297322 ) ) ( not ( = ?auto_2297312 ?auto_2297323 ) ) ( not ( = ?auto_2297312 ?auto_2297324 ) ) ( not ( = ?auto_2297312 ?auto_2297325 ) ) ( not ( = ?auto_2297313 ?auto_2297314 ) ) ( not ( = ?auto_2297313 ?auto_2297316 ) ) ( not ( = ?auto_2297313 ?auto_2297315 ) ) ( not ( = ?auto_2297313 ?auto_2297317 ) ) ( not ( = ?auto_2297313 ?auto_2297318 ) ) ( not ( = ?auto_2297313 ?auto_2297319 ) ) ( not ( = ?auto_2297313 ?auto_2297320 ) ) ( not ( = ?auto_2297313 ?auto_2297321 ) ) ( not ( = ?auto_2297313 ?auto_2297322 ) ) ( not ( = ?auto_2297313 ?auto_2297323 ) ) ( not ( = ?auto_2297313 ?auto_2297324 ) ) ( not ( = ?auto_2297313 ?auto_2297325 ) ) ( not ( = ?auto_2297314 ?auto_2297316 ) ) ( not ( = ?auto_2297314 ?auto_2297315 ) ) ( not ( = ?auto_2297314 ?auto_2297317 ) ) ( not ( = ?auto_2297314 ?auto_2297318 ) ) ( not ( = ?auto_2297314 ?auto_2297319 ) ) ( not ( = ?auto_2297314 ?auto_2297320 ) ) ( not ( = ?auto_2297314 ?auto_2297321 ) ) ( not ( = ?auto_2297314 ?auto_2297322 ) ) ( not ( = ?auto_2297314 ?auto_2297323 ) ) ( not ( = ?auto_2297314 ?auto_2297324 ) ) ( not ( = ?auto_2297314 ?auto_2297325 ) ) ( not ( = ?auto_2297316 ?auto_2297315 ) ) ( not ( = ?auto_2297316 ?auto_2297317 ) ) ( not ( = ?auto_2297316 ?auto_2297318 ) ) ( not ( = ?auto_2297316 ?auto_2297319 ) ) ( not ( = ?auto_2297316 ?auto_2297320 ) ) ( not ( = ?auto_2297316 ?auto_2297321 ) ) ( not ( = ?auto_2297316 ?auto_2297322 ) ) ( not ( = ?auto_2297316 ?auto_2297323 ) ) ( not ( = ?auto_2297316 ?auto_2297324 ) ) ( not ( = ?auto_2297316 ?auto_2297325 ) ) ( not ( = ?auto_2297315 ?auto_2297317 ) ) ( not ( = ?auto_2297315 ?auto_2297318 ) ) ( not ( = ?auto_2297315 ?auto_2297319 ) ) ( not ( = ?auto_2297315 ?auto_2297320 ) ) ( not ( = ?auto_2297315 ?auto_2297321 ) ) ( not ( = ?auto_2297315 ?auto_2297322 ) ) ( not ( = ?auto_2297315 ?auto_2297323 ) ) ( not ( = ?auto_2297315 ?auto_2297324 ) ) ( not ( = ?auto_2297315 ?auto_2297325 ) ) ( not ( = ?auto_2297317 ?auto_2297318 ) ) ( not ( = ?auto_2297317 ?auto_2297319 ) ) ( not ( = ?auto_2297317 ?auto_2297320 ) ) ( not ( = ?auto_2297317 ?auto_2297321 ) ) ( not ( = ?auto_2297317 ?auto_2297322 ) ) ( not ( = ?auto_2297317 ?auto_2297323 ) ) ( not ( = ?auto_2297317 ?auto_2297324 ) ) ( not ( = ?auto_2297317 ?auto_2297325 ) ) ( not ( = ?auto_2297318 ?auto_2297319 ) ) ( not ( = ?auto_2297318 ?auto_2297320 ) ) ( not ( = ?auto_2297318 ?auto_2297321 ) ) ( not ( = ?auto_2297318 ?auto_2297322 ) ) ( not ( = ?auto_2297318 ?auto_2297323 ) ) ( not ( = ?auto_2297318 ?auto_2297324 ) ) ( not ( = ?auto_2297318 ?auto_2297325 ) ) ( not ( = ?auto_2297319 ?auto_2297320 ) ) ( not ( = ?auto_2297319 ?auto_2297321 ) ) ( not ( = ?auto_2297319 ?auto_2297322 ) ) ( not ( = ?auto_2297319 ?auto_2297323 ) ) ( not ( = ?auto_2297319 ?auto_2297324 ) ) ( not ( = ?auto_2297319 ?auto_2297325 ) ) ( not ( = ?auto_2297320 ?auto_2297321 ) ) ( not ( = ?auto_2297320 ?auto_2297322 ) ) ( not ( = ?auto_2297320 ?auto_2297323 ) ) ( not ( = ?auto_2297320 ?auto_2297324 ) ) ( not ( = ?auto_2297320 ?auto_2297325 ) ) ( not ( = ?auto_2297321 ?auto_2297322 ) ) ( not ( = ?auto_2297321 ?auto_2297323 ) ) ( not ( = ?auto_2297321 ?auto_2297324 ) ) ( not ( = ?auto_2297321 ?auto_2297325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2297322 ?auto_2297323 ?auto_2297324 )
      ( MAKE-12CRATE-VERIFY ?auto_2297312 ?auto_2297313 ?auto_2297314 ?auto_2297316 ?auto_2297315 ?auto_2297317 ?auto_2297318 ?auto_2297319 ?auto_2297320 ?auto_2297321 ?auto_2297322 ?auto_2297323 ?auto_2297324 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2297475 - SURFACE
      ?auto_2297476 - SURFACE
      ?auto_2297477 - SURFACE
      ?auto_2297479 - SURFACE
      ?auto_2297478 - SURFACE
      ?auto_2297480 - SURFACE
      ?auto_2297481 - SURFACE
      ?auto_2297482 - SURFACE
      ?auto_2297483 - SURFACE
      ?auto_2297484 - SURFACE
      ?auto_2297485 - SURFACE
      ?auto_2297486 - SURFACE
      ?auto_2297487 - SURFACE
    )
    :vars
    (
      ?auto_2297490 - HOIST
      ?auto_2297489 - PLACE
      ?auto_2297491 - PLACE
      ?auto_2297492 - HOIST
      ?auto_2297488 - SURFACE
      ?auto_2297493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2297490 ?auto_2297489 ) ( IS-CRATE ?auto_2297487 ) ( not ( = ?auto_2297486 ?auto_2297487 ) ) ( not ( = ?auto_2297485 ?auto_2297486 ) ) ( not ( = ?auto_2297485 ?auto_2297487 ) ) ( not ( = ?auto_2297491 ?auto_2297489 ) ) ( HOIST-AT ?auto_2297492 ?auto_2297491 ) ( not ( = ?auto_2297490 ?auto_2297492 ) ) ( AVAILABLE ?auto_2297492 ) ( SURFACE-AT ?auto_2297487 ?auto_2297491 ) ( ON ?auto_2297487 ?auto_2297488 ) ( CLEAR ?auto_2297487 ) ( not ( = ?auto_2297486 ?auto_2297488 ) ) ( not ( = ?auto_2297487 ?auto_2297488 ) ) ( not ( = ?auto_2297485 ?auto_2297488 ) ) ( TRUCK-AT ?auto_2297493 ?auto_2297489 ) ( SURFACE-AT ?auto_2297485 ?auto_2297489 ) ( CLEAR ?auto_2297485 ) ( IS-CRATE ?auto_2297486 ) ( AVAILABLE ?auto_2297490 ) ( IN ?auto_2297486 ?auto_2297493 ) ( ON ?auto_2297476 ?auto_2297475 ) ( ON ?auto_2297477 ?auto_2297476 ) ( ON ?auto_2297479 ?auto_2297477 ) ( ON ?auto_2297478 ?auto_2297479 ) ( ON ?auto_2297480 ?auto_2297478 ) ( ON ?auto_2297481 ?auto_2297480 ) ( ON ?auto_2297482 ?auto_2297481 ) ( ON ?auto_2297483 ?auto_2297482 ) ( ON ?auto_2297484 ?auto_2297483 ) ( ON ?auto_2297485 ?auto_2297484 ) ( not ( = ?auto_2297475 ?auto_2297476 ) ) ( not ( = ?auto_2297475 ?auto_2297477 ) ) ( not ( = ?auto_2297475 ?auto_2297479 ) ) ( not ( = ?auto_2297475 ?auto_2297478 ) ) ( not ( = ?auto_2297475 ?auto_2297480 ) ) ( not ( = ?auto_2297475 ?auto_2297481 ) ) ( not ( = ?auto_2297475 ?auto_2297482 ) ) ( not ( = ?auto_2297475 ?auto_2297483 ) ) ( not ( = ?auto_2297475 ?auto_2297484 ) ) ( not ( = ?auto_2297475 ?auto_2297485 ) ) ( not ( = ?auto_2297475 ?auto_2297486 ) ) ( not ( = ?auto_2297475 ?auto_2297487 ) ) ( not ( = ?auto_2297475 ?auto_2297488 ) ) ( not ( = ?auto_2297476 ?auto_2297477 ) ) ( not ( = ?auto_2297476 ?auto_2297479 ) ) ( not ( = ?auto_2297476 ?auto_2297478 ) ) ( not ( = ?auto_2297476 ?auto_2297480 ) ) ( not ( = ?auto_2297476 ?auto_2297481 ) ) ( not ( = ?auto_2297476 ?auto_2297482 ) ) ( not ( = ?auto_2297476 ?auto_2297483 ) ) ( not ( = ?auto_2297476 ?auto_2297484 ) ) ( not ( = ?auto_2297476 ?auto_2297485 ) ) ( not ( = ?auto_2297476 ?auto_2297486 ) ) ( not ( = ?auto_2297476 ?auto_2297487 ) ) ( not ( = ?auto_2297476 ?auto_2297488 ) ) ( not ( = ?auto_2297477 ?auto_2297479 ) ) ( not ( = ?auto_2297477 ?auto_2297478 ) ) ( not ( = ?auto_2297477 ?auto_2297480 ) ) ( not ( = ?auto_2297477 ?auto_2297481 ) ) ( not ( = ?auto_2297477 ?auto_2297482 ) ) ( not ( = ?auto_2297477 ?auto_2297483 ) ) ( not ( = ?auto_2297477 ?auto_2297484 ) ) ( not ( = ?auto_2297477 ?auto_2297485 ) ) ( not ( = ?auto_2297477 ?auto_2297486 ) ) ( not ( = ?auto_2297477 ?auto_2297487 ) ) ( not ( = ?auto_2297477 ?auto_2297488 ) ) ( not ( = ?auto_2297479 ?auto_2297478 ) ) ( not ( = ?auto_2297479 ?auto_2297480 ) ) ( not ( = ?auto_2297479 ?auto_2297481 ) ) ( not ( = ?auto_2297479 ?auto_2297482 ) ) ( not ( = ?auto_2297479 ?auto_2297483 ) ) ( not ( = ?auto_2297479 ?auto_2297484 ) ) ( not ( = ?auto_2297479 ?auto_2297485 ) ) ( not ( = ?auto_2297479 ?auto_2297486 ) ) ( not ( = ?auto_2297479 ?auto_2297487 ) ) ( not ( = ?auto_2297479 ?auto_2297488 ) ) ( not ( = ?auto_2297478 ?auto_2297480 ) ) ( not ( = ?auto_2297478 ?auto_2297481 ) ) ( not ( = ?auto_2297478 ?auto_2297482 ) ) ( not ( = ?auto_2297478 ?auto_2297483 ) ) ( not ( = ?auto_2297478 ?auto_2297484 ) ) ( not ( = ?auto_2297478 ?auto_2297485 ) ) ( not ( = ?auto_2297478 ?auto_2297486 ) ) ( not ( = ?auto_2297478 ?auto_2297487 ) ) ( not ( = ?auto_2297478 ?auto_2297488 ) ) ( not ( = ?auto_2297480 ?auto_2297481 ) ) ( not ( = ?auto_2297480 ?auto_2297482 ) ) ( not ( = ?auto_2297480 ?auto_2297483 ) ) ( not ( = ?auto_2297480 ?auto_2297484 ) ) ( not ( = ?auto_2297480 ?auto_2297485 ) ) ( not ( = ?auto_2297480 ?auto_2297486 ) ) ( not ( = ?auto_2297480 ?auto_2297487 ) ) ( not ( = ?auto_2297480 ?auto_2297488 ) ) ( not ( = ?auto_2297481 ?auto_2297482 ) ) ( not ( = ?auto_2297481 ?auto_2297483 ) ) ( not ( = ?auto_2297481 ?auto_2297484 ) ) ( not ( = ?auto_2297481 ?auto_2297485 ) ) ( not ( = ?auto_2297481 ?auto_2297486 ) ) ( not ( = ?auto_2297481 ?auto_2297487 ) ) ( not ( = ?auto_2297481 ?auto_2297488 ) ) ( not ( = ?auto_2297482 ?auto_2297483 ) ) ( not ( = ?auto_2297482 ?auto_2297484 ) ) ( not ( = ?auto_2297482 ?auto_2297485 ) ) ( not ( = ?auto_2297482 ?auto_2297486 ) ) ( not ( = ?auto_2297482 ?auto_2297487 ) ) ( not ( = ?auto_2297482 ?auto_2297488 ) ) ( not ( = ?auto_2297483 ?auto_2297484 ) ) ( not ( = ?auto_2297483 ?auto_2297485 ) ) ( not ( = ?auto_2297483 ?auto_2297486 ) ) ( not ( = ?auto_2297483 ?auto_2297487 ) ) ( not ( = ?auto_2297483 ?auto_2297488 ) ) ( not ( = ?auto_2297484 ?auto_2297485 ) ) ( not ( = ?auto_2297484 ?auto_2297486 ) ) ( not ( = ?auto_2297484 ?auto_2297487 ) ) ( not ( = ?auto_2297484 ?auto_2297488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2297485 ?auto_2297486 ?auto_2297487 )
      ( MAKE-12CRATE-VERIFY ?auto_2297475 ?auto_2297476 ?auto_2297477 ?auto_2297479 ?auto_2297478 ?auto_2297480 ?auto_2297481 ?auto_2297482 ?auto_2297483 ?auto_2297484 ?auto_2297485 ?auto_2297486 ?auto_2297487 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2309057 - SURFACE
      ?auto_2309058 - SURFACE
      ?auto_2309059 - SURFACE
      ?auto_2309061 - SURFACE
      ?auto_2309060 - SURFACE
      ?auto_2309062 - SURFACE
      ?auto_2309063 - SURFACE
      ?auto_2309064 - SURFACE
      ?auto_2309065 - SURFACE
      ?auto_2309066 - SURFACE
      ?auto_2309067 - SURFACE
      ?auto_2309068 - SURFACE
      ?auto_2309069 - SURFACE
      ?auto_2309070 - SURFACE
    )
    :vars
    (
      ?auto_2309071 - HOIST
      ?auto_2309072 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2309071 ?auto_2309072 ) ( SURFACE-AT ?auto_2309069 ?auto_2309072 ) ( CLEAR ?auto_2309069 ) ( LIFTING ?auto_2309071 ?auto_2309070 ) ( IS-CRATE ?auto_2309070 ) ( not ( = ?auto_2309069 ?auto_2309070 ) ) ( ON ?auto_2309058 ?auto_2309057 ) ( ON ?auto_2309059 ?auto_2309058 ) ( ON ?auto_2309061 ?auto_2309059 ) ( ON ?auto_2309060 ?auto_2309061 ) ( ON ?auto_2309062 ?auto_2309060 ) ( ON ?auto_2309063 ?auto_2309062 ) ( ON ?auto_2309064 ?auto_2309063 ) ( ON ?auto_2309065 ?auto_2309064 ) ( ON ?auto_2309066 ?auto_2309065 ) ( ON ?auto_2309067 ?auto_2309066 ) ( ON ?auto_2309068 ?auto_2309067 ) ( ON ?auto_2309069 ?auto_2309068 ) ( not ( = ?auto_2309057 ?auto_2309058 ) ) ( not ( = ?auto_2309057 ?auto_2309059 ) ) ( not ( = ?auto_2309057 ?auto_2309061 ) ) ( not ( = ?auto_2309057 ?auto_2309060 ) ) ( not ( = ?auto_2309057 ?auto_2309062 ) ) ( not ( = ?auto_2309057 ?auto_2309063 ) ) ( not ( = ?auto_2309057 ?auto_2309064 ) ) ( not ( = ?auto_2309057 ?auto_2309065 ) ) ( not ( = ?auto_2309057 ?auto_2309066 ) ) ( not ( = ?auto_2309057 ?auto_2309067 ) ) ( not ( = ?auto_2309057 ?auto_2309068 ) ) ( not ( = ?auto_2309057 ?auto_2309069 ) ) ( not ( = ?auto_2309057 ?auto_2309070 ) ) ( not ( = ?auto_2309058 ?auto_2309059 ) ) ( not ( = ?auto_2309058 ?auto_2309061 ) ) ( not ( = ?auto_2309058 ?auto_2309060 ) ) ( not ( = ?auto_2309058 ?auto_2309062 ) ) ( not ( = ?auto_2309058 ?auto_2309063 ) ) ( not ( = ?auto_2309058 ?auto_2309064 ) ) ( not ( = ?auto_2309058 ?auto_2309065 ) ) ( not ( = ?auto_2309058 ?auto_2309066 ) ) ( not ( = ?auto_2309058 ?auto_2309067 ) ) ( not ( = ?auto_2309058 ?auto_2309068 ) ) ( not ( = ?auto_2309058 ?auto_2309069 ) ) ( not ( = ?auto_2309058 ?auto_2309070 ) ) ( not ( = ?auto_2309059 ?auto_2309061 ) ) ( not ( = ?auto_2309059 ?auto_2309060 ) ) ( not ( = ?auto_2309059 ?auto_2309062 ) ) ( not ( = ?auto_2309059 ?auto_2309063 ) ) ( not ( = ?auto_2309059 ?auto_2309064 ) ) ( not ( = ?auto_2309059 ?auto_2309065 ) ) ( not ( = ?auto_2309059 ?auto_2309066 ) ) ( not ( = ?auto_2309059 ?auto_2309067 ) ) ( not ( = ?auto_2309059 ?auto_2309068 ) ) ( not ( = ?auto_2309059 ?auto_2309069 ) ) ( not ( = ?auto_2309059 ?auto_2309070 ) ) ( not ( = ?auto_2309061 ?auto_2309060 ) ) ( not ( = ?auto_2309061 ?auto_2309062 ) ) ( not ( = ?auto_2309061 ?auto_2309063 ) ) ( not ( = ?auto_2309061 ?auto_2309064 ) ) ( not ( = ?auto_2309061 ?auto_2309065 ) ) ( not ( = ?auto_2309061 ?auto_2309066 ) ) ( not ( = ?auto_2309061 ?auto_2309067 ) ) ( not ( = ?auto_2309061 ?auto_2309068 ) ) ( not ( = ?auto_2309061 ?auto_2309069 ) ) ( not ( = ?auto_2309061 ?auto_2309070 ) ) ( not ( = ?auto_2309060 ?auto_2309062 ) ) ( not ( = ?auto_2309060 ?auto_2309063 ) ) ( not ( = ?auto_2309060 ?auto_2309064 ) ) ( not ( = ?auto_2309060 ?auto_2309065 ) ) ( not ( = ?auto_2309060 ?auto_2309066 ) ) ( not ( = ?auto_2309060 ?auto_2309067 ) ) ( not ( = ?auto_2309060 ?auto_2309068 ) ) ( not ( = ?auto_2309060 ?auto_2309069 ) ) ( not ( = ?auto_2309060 ?auto_2309070 ) ) ( not ( = ?auto_2309062 ?auto_2309063 ) ) ( not ( = ?auto_2309062 ?auto_2309064 ) ) ( not ( = ?auto_2309062 ?auto_2309065 ) ) ( not ( = ?auto_2309062 ?auto_2309066 ) ) ( not ( = ?auto_2309062 ?auto_2309067 ) ) ( not ( = ?auto_2309062 ?auto_2309068 ) ) ( not ( = ?auto_2309062 ?auto_2309069 ) ) ( not ( = ?auto_2309062 ?auto_2309070 ) ) ( not ( = ?auto_2309063 ?auto_2309064 ) ) ( not ( = ?auto_2309063 ?auto_2309065 ) ) ( not ( = ?auto_2309063 ?auto_2309066 ) ) ( not ( = ?auto_2309063 ?auto_2309067 ) ) ( not ( = ?auto_2309063 ?auto_2309068 ) ) ( not ( = ?auto_2309063 ?auto_2309069 ) ) ( not ( = ?auto_2309063 ?auto_2309070 ) ) ( not ( = ?auto_2309064 ?auto_2309065 ) ) ( not ( = ?auto_2309064 ?auto_2309066 ) ) ( not ( = ?auto_2309064 ?auto_2309067 ) ) ( not ( = ?auto_2309064 ?auto_2309068 ) ) ( not ( = ?auto_2309064 ?auto_2309069 ) ) ( not ( = ?auto_2309064 ?auto_2309070 ) ) ( not ( = ?auto_2309065 ?auto_2309066 ) ) ( not ( = ?auto_2309065 ?auto_2309067 ) ) ( not ( = ?auto_2309065 ?auto_2309068 ) ) ( not ( = ?auto_2309065 ?auto_2309069 ) ) ( not ( = ?auto_2309065 ?auto_2309070 ) ) ( not ( = ?auto_2309066 ?auto_2309067 ) ) ( not ( = ?auto_2309066 ?auto_2309068 ) ) ( not ( = ?auto_2309066 ?auto_2309069 ) ) ( not ( = ?auto_2309066 ?auto_2309070 ) ) ( not ( = ?auto_2309067 ?auto_2309068 ) ) ( not ( = ?auto_2309067 ?auto_2309069 ) ) ( not ( = ?auto_2309067 ?auto_2309070 ) ) ( not ( = ?auto_2309068 ?auto_2309069 ) ) ( not ( = ?auto_2309068 ?auto_2309070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2309069 ?auto_2309070 )
      ( MAKE-13CRATE-VERIFY ?auto_2309057 ?auto_2309058 ?auto_2309059 ?auto_2309061 ?auto_2309060 ?auto_2309062 ?auto_2309063 ?auto_2309064 ?auto_2309065 ?auto_2309066 ?auto_2309067 ?auto_2309068 ?auto_2309069 ?auto_2309070 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2309199 - SURFACE
      ?auto_2309200 - SURFACE
      ?auto_2309201 - SURFACE
      ?auto_2309203 - SURFACE
      ?auto_2309202 - SURFACE
      ?auto_2309204 - SURFACE
      ?auto_2309205 - SURFACE
      ?auto_2309206 - SURFACE
      ?auto_2309207 - SURFACE
      ?auto_2309208 - SURFACE
      ?auto_2309209 - SURFACE
      ?auto_2309210 - SURFACE
      ?auto_2309211 - SURFACE
      ?auto_2309212 - SURFACE
    )
    :vars
    (
      ?auto_2309213 - HOIST
      ?auto_2309214 - PLACE
      ?auto_2309215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2309213 ?auto_2309214 ) ( SURFACE-AT ?auto_2309211 ?auto_2309214 ) ( CLEAR ?auto_2309211 ) ( IS-CRATE ?auto_2309212 ) ( not ( = ?auto_2309211 ?auto_2309212 ) ) ( TRUCK-AT ?auto_2309215 ?auto_2309214 ) ( AVAILABLE ?auto_2309213 ) ( IN ?auto_2309212 ?auto_2309215 ) ( ON ?auto_2309211 ?auto_2309210 ) ( not ( = ?auto_2309210 ?auto_2309211 ) ) ( not ( = ?auto_2309210 ?auto_2309212 ) ) ( ON ?auto_2309200 ?auto_2309199 ) ( ON ?auto_2309201 ?auto_2309200 ) ( ON ?auto_2309203 ?auto_2309201 ) ( ON ?auto_2309202 ?auto_2309203 ) ( ON ?auto_2309204 ?auto_2309202 ) ( ON ?auto_2309205 ?auto_2309204 ) ( ON ?auto_2309206 ?auto_2309205 ) ( ON ?auto_2309207 ?auto_2309206 ) ( ON ?auto_2309208 ?auto_2309207 ) ( ON ?auto_2309209 ?auto_2309208 ) ( ON ?auto_2309210 ?auto_2309209 ) ( not ( = ?auto_2309199 ?auto_2309200 ) ) ( not ( = ?auto_2309199 ?auto_2309201 ) ) ( not ( = ?auto_2309199 ?auto_2309203 ) ) ( not ( = ?auto_2309199 ?auto_2309202 ) ) ( not ( = ?auto_2309199 ?auto_2309204 ) ) ( not ( = ?auto_2309199 ?auto_2309205 ) ) ( not ( = ?auto_2309199 ?auto_2309206 ) ) ( not ( = ?auto_2309199 ?auto_2309207 ) ) ( not ( = ?auto_2309199 ?auto_2309208 ) ) ( not ( = ?auto_2309199 ?auto_2309209 ) ) ( not ( = ?auto_2309199 ?auto_2309210 ) ) ( not ( = ?auto_2309199 ?auto_2309211 ) ) ( not ( = ?auto_2309199 ?auto_2309212 ) ) ( not ( = ?auto_2309200 ?auto_2309201 ) ) ( not ( = ?auto_2309200 ?auto_2309203 ) ) ( not ( = ?auto_2309200 ?auto_2309202 ) ) ( not ( = ?auto_2309200 ?auto_2309204 ) ) ( not ( = ?auto_2309200 ?auto_2309205 ) ) ( not ( = ?auto_2309200 ?auto_2309206 ) ) ( not ( = ?auto_2309200 ?auto_2309207 ) ) ( not ( = ?auto_2309200 ?auto_2309208 ) ) ( not ( = ?auto_2309200 ?auto_2309209 ) ) ( not ( = ?auto_2309200 ?auto_2309210 ) ) ( not ( = ?auto_2309200 ?auto_2309211 ) ) ( not ( = ?auto_2309200 ?auto_2309212 ) ) ( not ( = ?auto_2309201 ?auto_2309203 ) ) ( not ( = ?auto_2309201 ?auto_2309202 ) ) ( not ( = ?auto_2309201 ?auto_2309204 ) ) ( not ( = ?auto_2309201 ?auto_2309205 ) ) ( not ( = ?auto_2309201 ?auto_2309206 ) ) ( not ( = ?auto_2309201 ?auto_2309207 ) ) ( not ( = ?auto_2309201 ?auto_2309208 ) ) ( not ( = ?auto_2309201 ?auto_2309209 ) ) ( not ( = ?auto_2309201 ?auto_2309210 ) ) ( not ( = ?auto_2309201 ?auto_2309211 ) ) ( not ( = ?auto_2309201 ?auto_2309212 ) ) ( not ( = ?auto_2309203 ?auto_2309202 ) ) ( not ( = ?auto_2309203 ?auto_2309204 ) ) ( not ( = ?auto_2309203 ?auto_2309205 ) ) ( not ( = ?auto_2309203 ?auto_2309206 ) ) ( not ( = ?auto_2309203 ?auto_2309207 ) ) ( not ( = ?auto_2309203 ?auto_2309208 ) ) ( not ( = ?auto_2309203 ?auto_2309209 ) ) ( not ( = ?auto_2309203 ?auto_2309210 ) ) ( not ( = ?auto_2309203 ?auto_2309211 ) ) ( not ( = ?auto_2309203 ?auto_2309212 ) ) ( not ( = ?auto_2309202 ?auto_2309204 ) ) ( not ( = ?auto_2309202 ?auto_2309205 ) ) ( not ( = ?auto_2309202 ?auto_2309206 ) ) ( not ( = ?auto_2309202 ?auto_2309207 ) ) ( not ( = ?auto_2309202 ?auto_2309208 ) ) ( not ( = ?auto_2309202 ?auto_2309209 ) ) ( not ( = ?auto_2309202 ?auto_2309210 ) ) ( not ( = ?auto_2309202 ?auto_2309211 ) ) ( not ( = ?auto_2309202 ?auto_2309212 ) ) ( not ( = ?auto_2309204 ?auto_2309205 ) ) ( not ( = ?auto_2309204 ?auto_2309206 ) ) ( not ( = ?auto_2309204 ?auto_2309207 ) ) ( not ( = ?auto_2309204 ?auto_2309208 ) ) ( not ( = ?auto_2309204 ?auto_2309209 ) ) ( not ( = ?auto_2309204 ?auto_2309210 ) ) ( not ( = ?auto_2309204 ?auto_2309211 ) ) ( not ( = ?auto_2309204 ?auto_2309212 ) ) ( not ( = ?auto_2309205 ?auto_2309206 ) ) ( not ( = ?auto_2309205 ?auto_2309207 ) ) ( not ( = ?auto_2309205 ?auto_2309208 ) ) ( not ( = ?auto_2309205 ?auto_2309209 ) ) ( not ( = ?auto_2309205 ?auto_2309210 ) ) ( not ( = ?auto_2309205 ?auto_2309211 ) ) ( not ( = ?auto_2309205 ?auto_2309212 ) ) ( not ( = ?auto_2309206 ?auto_2309207 ) ) ( not ( = ?auto_2309206 ?auto_2309208 ) ) ( not ( = ?auto_2309206 ?auto_2309209 ) ) ( not ( = ?auto_2309206 ?auto_2309210 ) ) ( not ( = ?auto_2309206 ?auto_2309211 ) ) ( not ( = ?auto_2309206 ?auto_2309212 ) ) ( not ( = ?auto_2309207 ?auto_2309208 ) ) ( not ( = ?auto_2309207 ?auto_2309209 ) ) ( not ( = ?auto_2309207 ?auto_2309210 ) ) ( not ( = ?auto_2309207 ?auto_2309211 ) ) ( not ( = ?auto_2309207 ?auto_2309212 ) ) ( not ( = ?auto_2309208 ?auto_2309209 ) ) ( not ( = ?auto_2309208 ?auto_2309210 ) ) ( not ( = ?auto_2309208 ?auto_2309211 ) ) ( not ( = ?auto_2309208 ?auto_2309212 ) ) ( not ( = ?auto_2309209 ?auto_2309210 ) ) ( not ( = ?auto_2309209 ?auto_2309211 ) ) ( not ( = ?auto_2309209 ?auto_2309212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2309210 ?auto_2309211 ?auto_2309212 )
      ( MAKE-13CRATE-VERIFY ?auto_2309199 ?auto_2309200 ?auto_2309201 ?auto_2309203 ?auto_2309202 ?auto_2309204 ?auto_2309205 ?auto_2309206 ?auto_2309207 ?auto_2309208 ?auto_2309209 ?auto_2309210 ?auto_2309211 ?auto_2309212 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2309355 - SURFACE
      ?auto_2309356 - SURFACE
      ?auto_2309357 - SURFACE
      ?auto_2309359 - SURFACE
      ?auto_2309358 - SURFACE
      ?auto_2309360 - SURFACE
      ?auto_2309361 - SURFACE
      ?auto_2309362 - SURFACE
      ?auto_2309363 - SURFACE
      ?auto_2309364 - SURFACE
      ?auto_2309365 - SURFACE
      ?auto_2309366 - SURFACE
      ?auto_2309367 - SURFACE
      ?auto_2309368 - SURFACE
    )
    :vars
    (
      ?auto_2309369 - HOIST
      ?auto_2309372 - PLACE
      ?auto_2309370 - TRUCK
      ?auto_2309371 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2309369 ?auto_2309372 ) ( SURFACE-AT ?auto_2309367 ?auto_2309372 ) ( CLEAR ?auto_2309367 ) ( IS-CRATE ?auto_2309368 ) ( not ( = ?auto_2309367 ?auto_2309368 ) ) ( AVAILABLE ?auto_2309369 ) ( IN ?auto_2309368 ?auto_2309370 ) ( ON ?auto_2309367 ?auto_2309366 ) ( not ( = ?auto_2309366 ?auto_2309367 ) ) ( not ( = ?auto_2309366 ?auto_2309368 ) ) ( TRUCK-AT ?auto_2309370 ?auto_2309371 ) ( not ( = ?auto_2309371 ?auto_2309372 ) ) ( ON ?auto_2309356 ?auto_2309355 ) ( ON ?auto_2309357 ?auto_2309356 ) ( ON ?auto_2309359 ?auto_2309357 ) ( ON ?auto_2309358 ?auto_2309359 ) ( ON ?auto_2309360 ?auto_2309358 ) ( ON ?auto_2309361 ?auto_2309360 ) ( ON ?auto_2309362 ?auto_2309361 ) ( ON ?auto_2309363 ?auto_2309362 ) ( ON ?auto_2309364 ?auto_2309363 ) ( ON ?auto_2309365 ?auto_2309364 ) ( ON ?auto_2309366 ?auto_2309365 ) ( not ( = ?auto_2309355 ?auto_2309356 ) ) ( not ( = ?auto_2309355 ?auto_2309357 ) ) ( not ( = ?auto_2309355 ?auto_2309359 ) ) ( not ( = ?auto_2309355 ?auto_2309358 ) ) ( not ( = ?auto_2309355 ?auto_2309360 ) ) ( not ( = ?auto_2309355 ?auto_2309361 ) ) ( not ( = ?auto_2309355 ?auto_2309362 ) ) ( not ( = ?auto_2309355 ?auto_2309363 ) ) ( not ( = ?auto_2309355 ?auto_2309364 ) ) ( not ( = ?auto_2309355 ?auto_2309365 ) ) ( not ( = ?auto_2309355 ?auto_2309366 ) ) ( not ( = ?auto_2309355 ?auto_2309367 ) ) ( not ( = ?auto_2309355 ?auto_2309368 ) ) ( not ( = ?auto_2309356 ?auto_2309357 ) ) ( not ( = ?auto_2309356 ?auto_2309359 ) ) ( not ( = ?auto_2309356 ?auto_2309358 ) ) ( not ( = ?auto_2309356 ?auto_2309360 ) ) ( not ( = ?auto_2309356 ?auto_2309361 ) ) ( not ( = ?auto_2309356 ?auto_2309362 ) ) ( not ( = ?auto_2309356 ?auto_2309363 ) ) ( not ( = ?auto_2309356 ?auto_2309364 ) ) ( not ( = ?auto_2309356 ?auto_2309365 ) ) ( not ( = ?auto_2309356 ?auto_2309366 ) ) ( not ( = ?auto_2309356 ?auto_2309367 ) ) ( not ( = ?auto_2309356 ?auto_2309368 ) ) ( not ( = ?auto_2309357 ?auto_2309359 ) ) ( not ( = ?auto_2309357 ?auto_2309358 ) ) ( not ( = ?auto_2309357 ?auto_2309360 ) ) ( not ( = ?auto_2309357 ?auto_2309361 ) ) ( not ( = ?auto_2309357 ?auto_2309362 ) ) ( not ( = ?auto_2309357 ?auto_2309363 ) ) ( not ( = ?auto_2309357 ?auto_2309364 ) ) ( not ( = ?auto_2309357 ?auto_2309365 ) ) ( not ( = ?auto_2309357 ?auto_2309366 ) ) ( not ( = ?auto_2309357 ?auto_2309367 ) ) ( not ( = ?auto_2309357 ?auto_2309368 ) ) ( not ( = ?auto_2309359 ?auto_2309358 ) ) ( not ( = ?auto_2309359 ?auto_2309360 ) ) ( not ( = ?auto_2309359 ?auto_2309361 ) ) ( not ( = ?auto_2309359 ?auto_2309362 ) ) ( not ( = ?auto_2309359 ?auto_2309363 ) ) ( not ( = ?auto_2309359 ?auto_2309364 ) ) ( not ( = ?auto_2309359 ?auto_2309365 ) ) ( not ( = ?auto_2309359 ?auto_2309366 ) ) ( not ( = ?auto_2309359 ?auto_2309367 ) ) ( not ( = ?auto_2309359 ?auto_2309368 ) ) ( not ( = ?auto_2309358 ?auto_2309360 ) ) ( not ( = ?auto_2309358 ?auto_2309361 ) ) ( not ( = ?auto_2309358 ?auto_2309362 ) ) ( not ( = ?auto_2309358 ?auto_2309363 ) ) ( not ( = ?auto_2309358 ?auto_2309364 ) ) ( not ( = ?auto_2309358 ?auto_2309365 ) ) ( not ( = ?auto_2309358 ?auto_2309366 ) ) ( not ( = ?auto_2309358 ?auto_2309367 ) ) ( not ( = ?auto_2309358 ?auto_2309368 ) ) ( not ( = ?auto_2309360 ?auto_2309361 ) ) ( not ( = ?auto_2309360 ?auto_2309362 ) ) ( not ( = ?auto_2309360 ?auto_2309363 ) ) ( not ( = ?auto_2309360 ?auto_2309364 ) ) ( not ( = ?auto_2309360 ?auto_2309365 ) ) ( not ( = ?auto_2309360 ?auto_2309366 ) ) ( not ( = ?auto_2309360 ?auto_2309367 ) ) ( not ( = ?auto_2309360 ?auto_2309368 ) ) ( not ( = ?auto_2309361 ?auto_2309362 ) ) ( not ( = ?auto_2309361 ?auto_2309363 ) ) ( not ( = ?auto_2309361 ?auto_2309364 ) ) ( not ( = ?auto_2309361 ?auto_2309365 ) ) ( not ( = ?auto_2309361 ?auto_2309366 ) ) ( not ( = ?auto_2309361 ?auto_2309367 ) ) ( not ( = ?auto_2309361 ?auto_2309368 ) ) ( not ( = ?auto_2309362 ?auto_2309363 ) ) ( not ( = ?auto_2309362 ?auto_2309364 ) ) ( not ( = ?auto_2309362 ?auto_2309365 ) ) ( not ( = ?auto_2309362 ?auto_2309366 ) ) ( not ( = ?auto_2309362 ?auto_2309367 ) ) ( not ( = ?auto_2309362 ?auto_2309368 ) ) ( not ( = ?auto_2309363 ?auto_2309364 ) ) ( not ( = ?auto_2309363 ?auto_2309365 ) ) ( not ( = ?auto_2309363 ?auto_2309366 ) ) ( not ( = ?auto_2309363 ?auto_2309367 ) ) ( not ( = ?auto_2309363 ?auto_2309368 ) ) ( not ( = ?auto_2309364 ?auto_2309365 ) ) ( not ( = ?auto_2309364 ?auto_2309366 ) ) ( not ( = ?auto_2309364 ?auto_2309367 ) ) ( not ( = ?auto_2309364 ?auto_2309368 ) ) ( not ( = ?auto_2309365 ?auto_2309366 ) ) ( not ( = ?auto_2309365 ?auto_2309367 ) ) ( not ( = ?auto_2309365 ?auto_2309368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2309366 ?auto_2309367 ?auto_2309368 )
      ( MAKE-13CRATE-VERIFY ?auto_2309355 ?auto_2309356 ?auto_2309357 ?auto_2309359 ?auto_2309358 ?auto_2309360 ?auto_2309361 ?auto_2309362 ?auto_2309363 ?auto_2309364 ?auto_2309365 ?auto_2309366 ?auto_2309367 ?auto_2309368 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2309524 - SURFACE
      ?auto_2309525 - SURFACE
      ?auto_2309526 - SURFACE
      ?auto_2309528 - SURFACE
      ?auto_2309527 - SURFACE
      ?auto_2309529 - SURFACE
      ?auto_2309530 - SURFACE
      ?auto_2309531 - SURFACE
      ?auto_2309532 - SURFACE
      ?auto_2309533 - SURFACE
      ?auto_2309534 - SURFACE
      ?auto_2309535 - SURFACE
      ?auto_2309536 - SURFACE
      ?auto_2309537 - SURFACE
    )
    :vars
    (
      ?auto_2309541 - HOIST
      ?auto_2309540 - PLACE
      ?auto_2309542 - TRUCK
      ?auto_2309538 - PLACE
      ?auto_2309539 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2309541 ?auto_2309540 ) ( SURFACE-AT ?auto_2309536 ?auto_2309540 ) ( CLEAR ?auto_2309536 ) ( IS-CRATE ?auto_2309537 ) ( not ( = ?auto_2309536 ?auto_2309537 ) ) ( AVAILABLE ?auto_2309541 ) ( ON ?auto_2309536 ?auto_2309535 ) ( not ( = ?auto_2309535 ?auto_2309536 ) ) ( not ( = ?auto_2309535 ?auto_2309537 ) ) ( TRUCK-AT ?auto_2309542 ?auto_2309538 ) ( not ( = ?auto_2309538 ?auto_2309540 ) ) ( HOIST-AT ?auto_2309539 ?auto_2309538 ) ( LIFTING ?auto_2309539 ?auto_2309537 ) ( not ( = ?auto_2309541 ?auto_2309539 ) ) ( ON ?auto_2309525 ?auto_2309524 ) ( ON ?auto_2309526 ?auto_2309525 ) ( ON ?auto_2309528 ?auto_2309526 ) ( ON ?auto_2309527 ?auto_2309528 ) ( ON ?auto_2309529 ?auto_2309527 ) ( ON ?auto_2309530 ?auto_2309529 ) ( ON ?auto_2309531 ?auto_2309530 ) ( ON ?auto_2309532 ?auto_2309531 ) ( ON ?auto_2309533 ?auto_2309532 ) ( ON ?auto_2309534 ?auto_2309533 ) ( ON ?auto_2309535 ?auto_2309534 ) ( not ( = ?auto_2309524 ?auto_2309525 ) ) ( not ( = ?auto_2309524 ?auto_2309526 ) ) ( not ( = ?auto_2309524 ?auto_2309528 ) ) ( not ( = ?auto_2309524 ?auto_2309527 ) ) ( not ( = ?auto_2309524 ?auto_2309529 ) ) ( not ( = ?auto_2309524 ?auto_2309530 ) ) ( not ( = ?auto_2309524 ?auto_2309531 ) ) ( not ( = ?auto_2309524 ?auto_2309532 ) ) ( not ( = ?auto_2309524 ?auto_2309533 ) ) ( not ( = ?auto_2309524 ?auto_2309534 ) ) ( not ( = ?auto_2309524 ?auto_2309535 ) ) ( not ( = ?auto_2309524 ?auto_2309536 ) ) ( not ( = ?auto_2309524 ?auto_2309537 ) ) ( not ( = ?auto_2309525 ?auto_2309526 ) ) ( not ( = ?auto_2309525 ?auto_2309528 ) ) ( not ( = ?auto_2309525 ?auto_2309527 ) ) ( not ( = ?auto_2309525 ?auto_2309529 ) ) ( not ( = ?auto_2309525 ?auto_2309530 ) ) ( not ( = ?auto_2309525 ?auto_2309531 ) ) ( not ( = ?auto_2309525 ?auto_2309532 ) ) ( not ( = ?auto_2309525 ?auto_2309533 ) ) ( not ( = ?auto_2309525 ?auto_2309534 ) ) ( not ( = ?auto_2309525 ?auto_2309535 ) ) ( not ( = ?auto_2309525 ?auto_2309536 ) ) ( not ( = ?auto_2309525 ?auto_2309537 ) ) ( not ( = ?auto_2309526 ?auto_2309528 ) ) ( not ( = ?auto_2309526 ?auto_2309527 ) ) ( not ( = ?auto_2309526 ?auto_2309529 ) ) ( not ( = ?auto_2309526 ?auto_2309530 ) ) ( not ( = ?auto_2309526 ?auto_2309531 ) ) ( not ( = ?auto_2309526 ?auto_2309532 ) ) ( not ( = ?auto_2309526 ?auto_2309533 ) ) ( not ( = ?auto_2309526 ?auto_2309534 ) ) ( not ( = ?auto_2309526 ?auto_2309535 ) ) ( not ( = ?auto_2309526 ?auto_2309536 ) ) ( not ( = ?auto_2309526 ?auto_2309537 ) ) ( not ( = ?auto_2309528 ?auto_2309527 ) ) ( not ( = ?auto_2309528 ?auto_2309529 ) ) ( not ( = ?auto_2309528 ?auto_2309530 ) ) ( not ( = ?auto_2309528 ?auto_2309531 ) ) ( not ( = ?auto_2309528 ?auto_2309532 ) ) ( not ( = ?auto_2309528 ?auto_2309533 ) ) ( not ( = ?auto_2309528 ?auto_2309534 ) ) ( not ( = ?auto_2309528 ?auto_2309535 ) ) ( not ( = ?auto_2309528 ?auto_2309536 ) ) ( not ( = ?auto_2309528 ?auto_2309537 ) ) ( not ( = ?auto_2309527 ?auto_2309529 ) ) ( not ( = ?auto_2309527 ?auto_2309530 ) ) ( not ( = ?auto_2309527 ?auto_2309531 ) ) ( not ( = ?auto_2309527 ?auto_2309532 ) ) ( not ( = ?auto_2309527 ?auto_2309533 ) ) ( not ( = ?auto_2309527 ?auto_2309534 ) ) ( not ( = ?auto_2309527 ?auto_2309535 ) ) ( not ( = ?auto_2309527 ?auto_2309536 ) ) ( not ( = ?auto_2309527 ?auto_2309537 ) ) ( not ( = ?auto_2309529 ?auto_2309530 ) ) ( not ( = ?auto_2309529 ?auto_2309531 ) ) ( not ( = ?auto_2309529 ?auto_2309532 ) ) ( not ( = ?auto_2309529 ?auto_2309533 ) ) ( not ( = ?auto_2309529 ?auto_2309534 ) ) ( not ( = ?auto_2309529 ?auto_2309535 ) ) ( not ( = ?auto_2309529 ?auto_2309536 ) ) ( not ( = ?auto_2309529 ?auto_2309537 ) ) ( not ( = ?auto_2309530 ?auto_2309531 ) ) ( not ( = ?auto_2309530 ?auto_2309532 ) ) ( not ( = ?auto_2309530 ?auto_2309533 ) ) ( not ( = ?auto_2309530 ?auto_2309534 ) ) ( not ( = ?auto_2309530 ?auto_2309535 ) ) ( not ( = ?auto_2309530 ?auto_2309536 ) ) ( not ( = ?auto_2309530 ?auto_2309537 ) ) ( not ( = ?auto_2309531 ?auto_2309532 ) ) ( not ( = ?auto_2309531 ?auto_2309533 ) ) ( not ( = ?auto_2309531 ?auto_2309534 ) ) ( not ( = ?auto_2309531 ?auto_2309535 ) ) ( not ( = ?auto_2309531 ?auto_2309536 ) ) ( not ( = ?auto_2309531 ?auto_2309537 ) ) ( not ( = ?auto_2309532 ?auto_2309533 ) ) ( not ( = ?auto_2309532 ?auto_2309534 ) ) ( not ( = ?auto_2309532 ?auto_2309535 ) ) ( not ( = ?auto_2309532 ?auto_2309536 ) ) ( not ( = ?auto_2309532 ?auto_2309537 ) ) ( not ( = ?auto_2309533 ?auto_2309534 ) ) ( not ( = ?auto_2309533 ?auto_2309535 ) ) ( not ( = ?auto_2309533 ?auto_2309536 ) ) ( not ( = ?auto_2309533 ?auto_2309537 ) ) ( not ( = ?auto_2309534 ?auto_2309535 ) ) ( not ( = ?auto_2309534 ?auto_2309536 ) ) ( not ( = ?auto_2309534 ?auto_2309537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2309535 ?auto_2309536 ?auto_2309537 )
      ( MAKE-13CRATE-VERIFY ?auto_2309524 ?auto_2309525 ?auto_2309526 ?auto_2309528 ?auto_2309527 ?auto_2309529 ?auto_2309530 ?auto_2309531 ?auto_2309532 ?auto_2309533 ?auto_2309534 ?auto_2309535 ?auto_2309536 ?auto_2309537 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2309706 - SURFACE
      ?auto_2309707 - SURFACE
      ?auto_2309708 - SURFACE
      ?auto_2309710 - SURFACE
      ?auto_2309709 - SURFACE
      ?auto_2309711 - SURFACE
      ?auto_2309712 - SURFACE
      ?auto_2309713 - SURFACE
      ?auto_2309714 - SURFACE
      ?auto_2309715 - SURFACE
      ?auto_2309716 - SURFACE
      ?auto_2309717 - SURFACE
      ?auto_2309718 - SURFACE
      ?auto_2309719 - SURFACE
    )
    :vars
    (
      ?auto_2309722 - HOIST
      ?auto_2309724 - PLACE
      ?auto_2309723 - TRUCK
      ?auto_2309725 - PLACE
      ?auto_2309720 - HOIST
      ?auto_2309721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2309722 ?auto_2309724 ) ( SURFACE-AT ?auto_2309718 ?auto_2309724 ) ( CLEAR ?auto_2309718 ) ( IS-CRATE ?auto_2309719 ) ( not ( = ?auto_2309718 ?auto_2309719 ) ) ( AVAILABLE ?auto_2309722 ) ( ON ?auto_2309718 ?auto_2309717 ) ( not ( = ?auto_2309717 ?auto_2309718 ) ) ( not ( = ?auto_2309717 ?auto_2309719 ) ) ( TRUCK-AT ?auto_2309723 ?auto_2309725 ) ( not ( = ?auto_2309725 ?auto_2309724 ) ) ( HOIST-AT ?auto_2309720 ?auto_2309725 ) ( not ( = ?auto_2309722 ?auto_2309720 ) ) ( AVAILABLE ?auto_2309720 ) ( SURFACE-AT ?auto_2309719 ?auto_2309725 ) ( ON ?auto_2309719 ?auto_2309721 ) ( CLEAR ?auto_2309719 ) ( not ( = ?auto_2309718 ?auto_2309721 ) ) ( not ( = ?auto_2309719 ?auto_2309721 ) ) ( not ( = ?auto_2309717 ?auto_2309721 ) ) ( ON ?auto_2309707 ?auto_2309706 ) ( ON ?auto_2309708 ?auto_2309707 ) ( ON ?auto_2309710 ?auto_2309708 ) ( ON ?auto_2309709 ?auto_2309710 ) ( ON ?auto_2309711 ?auto_2309709 ) ( ON ?auto_2309712 ?auto_2309711 ) ( ON ?auto_2309713 ?auto_2309712 ) ( ON ?auto_2309714 ?auto_2309713 ) ( ON ?auto_2309715 ?auto_2309714 ) ( ON ?auto_2309716 ?auto_2309715 ) ( ON ?auto_2309717 ?auto_2309716 ) ( not ( = ?auto_2309706 ?auto_2309707 ) ) ( not ( = ?auto_2309706 ?auto_2309708 ) ) ( not ( = ?auto_2309706 ?auto_2309710 ) ) ( not ( = ?auto_2309706 ?auto_2309709 ) ) ( not ( = ?auto_2309706 ?auto_2309711 ) ) ( not ( = ?auto_2309706 ?auto_2309712 ) ) ( not ( = ?auto_2309706 ?auto_2309713 ) ) ( not ( = ?auto_2309706 ?auto_2309714 ) ) ( not ( = ?auto_2309706 ?auto_2309715 ) ) ( not ( = ?auto_2309706 ?auto_2309716 ) ) ( not ( = ?auto_2309706 ?auto_2309717 ) ) ( not ( = ?auto_2309706 ?auto_2309718 ) ) ( not ( = ?auto_2309706 ?auto_2309719 ) ) ( not ( = ?auto_2309706 ?auto_2309721 ) ) ( not ( = ?auto_2309707 ?auto_2309708 ) ) ( not ( = ?auto_2309707 ?auto_2309710 ) ) ( not ( = ?auto_2309707 ?auto_2309709 ) ) ( not ( = ?auto_2309707 ?auto_2309711 ) ) ( not ( = ?auto_2309707 ?auto_2309712 ) ) ( not ( = ?auto_2309707 ?auto_2309713 ) ) ( not ( = ?auto_2309707 ?auto_2309714 ) ) ( not ( = ?auto_2309707 ?auto_2309715 ) ) ( not ( = ?auto_2309707 ?auto_2309716 ) ) ( not ( = ?auto_2309707 ?auto_2309717 ) ) ( not ( = ?auto_2309707 ?auto_2309718 ) ) ( not ( = ?auto_2309707 ?auto_2309719 ) ) ( not ( = ?auto_2309707 ?auto_2309721 ) ) ( not ( = ?auto_2309708 ?auto_2309710 ) ) ( not ( = ?auto_2309708 ?auto_2309709 ) ) ( not ( = ?auto_2309708 ?auto_2309711 ) ) ( not ( = ?auto_2309708 ?auto_2309712 ) ) ( not ( = ?auto_2309708 ?auto_2309713 ) ) ( not ( = ?auto_2309708 ?auto_2309714 ) ) ( not ( = ?auto_2309708 ?auto_2309715 ) ) ( not ( = ?auto_2309708 ?auto_2309716 ) ) ( not ( = ?auto_2309708 ?auto_2309717 ) ) ( not ( = ?auto_2309708 ?auto_2309718 ) ) ( not ( = ?auto_2309708 ?auto_2309719 ) ) ( not ( = ?auto_2309708 ?auto_2309721 ) ) ( not ( = ?auto_2309710 ?auto_2309709 ) ) ( not ( = ?auto_2309710 ?auto_2309711 ) ) ( not ( = ?auto_2309710 ?auto_2309712 ) ) ( not ( = ?auto_2309710 ?auto_2309713 ) ) ( not ( = ?auto_2309710 ?auto_2309714 ) ) ( not ( = ?auto_2309710 ?auto_2309715 ) ) ( not ( = ?auto_2309710 ?auto_2309716 ) ) ( not ( = ?auto_2309710 ?auto_2309717 ) ) ( not ( = ?auto_2309710 ?auto_2309718 ) ) ( not ( = ?auto_2309710 ?auto_2309719 ) ) ( not ( = ?auto_2309710 ?auto_2309721 ) ) ( not ( = ?auto_2309709 ?auto_2309711 ) ) ( not ( = ?auto_2309709 ?auto_2309712 ) ) ( not ( = ?auto_2309709 ?auto_2309713 ) ) ( not ( = ?auto_2309709 ?auto_2309714 ) ) ( not ( = ?auto_2309709 ?auto_2309715 ) ) ( not ( = ?auto_2309709 ?auto_2309716 ) ) ( not ( = ?auto_2309709 ?auto_2309717 ) ) ( not ( = ?auto_2309709 ?auto_2309718 ) ) ( not ( = ?auto_2309709 ?auto_2309719 ) ) ( not ( = ?auto_2309709 ?auto_2309721 ) ) ( not ( = ?auto_2309711 ?auto_2309712 ) ) ( not ( = ?auto_2309711 ?auto_2309713 ) ) ( not ( = ?auto_2309711 ?auto_2309714 ) ) ( not ( = ?auto_2309711 ?auto_2309715 ) ) ( not ( = ?auto_2309711 ?auto_2309716 ) ) ( not ( = ?auto_2309711 ?auto_2309717 ) ) ( not ( = ?auto_2309711 ?auto_2309718 ) ) ( not ( = ?auto_2309711 ?auto_2309719 ) ) ( not ( = ?auto_2309711 ?auto_2309721 ) ) ( not ( = ?auto_2309712 ?auto_2309713 ) ) ( not ( = ?auto_2309712 ?auto_2309714 ) ) ( not ( = ?auto_2309712 ?auto_2309715 ) ) ( not ( = ?auto_2309712 ?auto_2309716 ) ) ( not ( = ?auto_2309712 ?auto_2309717 ) ) ( not ( = ?auto_2309712 ?auto_2309718 ) ) ( not ( = ?auto_2309712 ?auto_2309719 ) ) ( not ( = ?auto_2309712 ?auto_2309721 ) ) ( not ( = ?auto_2309713 ?auto_2309714 ) ) ( not ( = ?auto_2309713 ?auto_2309715 ) ) ( not ( = ?auto_2309713 ?auto_2309716 ) ) ( not ( = ?auto_2309713 ?auto_2309717 ) ) ( not ( = ?auto_2309713 ?auto_2309718 ) ) ( not ( = ?auto_2309713 ?auto_2309719 ) ) ( not ( = ?auto_2309713 ?auto_2309721 ) ) ( not ( = ?auto_2309714 ?auto_2309715 ) ) ( not ( = ?auto_2309714 ?auto_2309716 ) ) ( not ( = ?auto_2309714 ?auto_2309717 ) ) ( not ( = ?auto_2309714 ?auto_2309718 ) ) ( not ( = ?auto_2309714 ?auto_2309719 ) ) ( not ( = ?auto_2309714 ?auto_2309721 ) ) ( not ( = ?auto_2309715 ?auto_2309716 ) ) ( not ( = ?auto_2309715 ?auto_2309717 ) ) ( not ( = ?auto_2309715 ?auto_2309718 ) ) ( not ( = ?auto_2309715 ?auto_2309719 ) ) ( not ( = ?auto_2309715 ?auto_2309721 ) ) ( not ( = ?auto_2309716 ?auto_2309717 ) ) ( not ( = ?auto_2309716 ?auto_2309718 ) ) ( not ( = ?auto_2309716 ?auto_2309719 ) ) ( not ( = ?auto_2309716 ?auto_2309721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2309717 ?auto_2309718 ?auto_2309719 )
      ( MAKE-13CRATE-VERIFY ?auto_2309706 ?auto_2309707 ?auto_2309708 ?auto_2309710 ?auto_2309709 ?auto_2309711 ?auto_2309712 ?auto_2309713 ?auto_2309714 ?auto_2309715 ?auto_2309716 ?auto_2309717 ?auto_2309718 ?auto_2309719 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2309889 - SURFACE
      ?auto_2309890 - SURFACE
      ?auto_2309891 - SURFACE
      ?auto_2309893 - SURFACE
      ?auto_2309892 - SURFACE
      ?auto_2309894 - SURFACE
      ?auto_2309895 - SURFACE
      ?auto_2309896 - SURFACE
      ?auto_2309897 - SURFACE
      ?auto_2309898 - SURFACE
      ?auto_2309899 - SURFACE
      ?auto_2309900 - SURFACE
      ?auto_2309901 - SURFACE
      ?auto_2309902 - SURFACE
    )
    :vars
    (
      ?auto_2309904 - HOIST
      ?auto_2309903 - PLACE
      ?auto_2309908 - PLACE
      ?auto_2309905 - HOIST
      ?auto_2309906 - SURFACE
      ?auto_2309907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2309904 ?auto_2309903 ) ( SURFACE-AT ?auto_2309901 ?auto_2309903 ) ( CLEAR ?auto_2309901 ) ( IS-CRATE ?auto_2309902 ) ( not ( = ?auto_2309901 ?auto_2309902 ) ) ( AVAILABLE ?auto_2309904 ) ( ON ?auto_2309901 ?auto_2309900 ) ( not ( = ?auto_2309900 ?auto_2309901 ) ) ( not ( = ?auto_2309900 ?auto_2309902 ) ) ( not ( = ?auto_2309908 ?auto_2309903 ) ) ( HOIST-AT ?auto_2309905 ?auto_2309908 ) ( not ( = ?auto_2309904 ?auto_2309905 ) ) ( AVAILABLE ?auto_2309905 ) ( SURFACE-AT ?auto_2309902 ?auto_2309908 ) ( ON ?auto_2309902 ?auto_2309906 ) ( CLEAR ?auto_2309902 ) ( not ( = ?auto_2309901 ?auto_2309906 ) ) ( not ( = ?auto_2309902 ?auto_2309906 ) ) ( not ( = ?auto_2309900 ?auto_2309906 ) ) ( TRUCK-AT ?auto_2309907 ?auto_2309903 ) ( ON ?auto_2309890 ?auto_2309889 ) ( ON ?auto_2309891 ?auto_2309890 ) ( ON ?auto_2309893 ?auto_2309891 ) ( ON ?auto_2309892 ?auto_2309893 ) ( ON ?auto_2309894 ?auto_2309892 ) ( ON ?auto_2309895 ?auto_2309894 ) ( ON ?auto_2309896 ?auto_2309895 ) ( ON ?auto_2309897 ?auto_2309896 ) ( ON ?auto_2309898 ?auto_2309897 ) ( ON ?auto_2309899 ?auto_2309898 ) ( ON ?auto_2309900 ?auto_2309899 ) ( not ( = ?auto_2309889 ?auto_2309890 ) ) ( not ( = ?auto_2309889 ?auto_2309891 ) ) ( not ( = ?auto_2309889 ?auto_2309893 ) ) ( not ( = ?auto_2309889 ?auto_2309892 ) ) ( not ( = ?auto_2309889 ?auto_2309894 ) ) ( not ( = ?auto_2309889 ?auto_2309895 ) ) ( not ( = ?auto_2309889 ?auto_2309896 ) ) ( not ( = ?auto_2309889 ?auto_2309897 ) ) ( not ( = ?auto_2309889 ?auto_2309898 ) ) ( not ( = ?auto_2309889 ?auto_2309899 ) ) ( not ( = ?auto_2309889 ?auto_2309900 ) ) ( not ( = ?auto_2309889 ?auto_2309901 ) ) ( not ( = ?auto_2309889 ?auto_2309902 ) ) ( not ( = ?auto_2309889 ?auto_2309906 ) ) ( not ( = ?auto_2309890 ?auto_2309891 ) ) ( not ( = ?auto_2309890 ?auto_2309893 ) ) ( not ( = ?auto_2309890 ?auto_2309892 ) ) ( not ( = ?auto_2309890 ?auto_2309894 ) ) ( not ( = ?auto_2309890 ?auto_2309895 ) ) ( not ( = ?auto_2309890 ?auto_2309896 ) ) ( not ( = ?auto_2309890 ?auto_2309897 ) ) ( not ( = ?auto_2309890 ?auto_2309898 ) ) ( not ( = ?auto_2309890 ?auto_2309899 ) ) ( not ( = ?auto_2309890 ?auto_2309900 ) ) ( not ( = ?auto_2309890 ?auto_2309901 ) ) ( not ( = ?auto_2309890 ?auto_2309902 ) ) ( not ( = ?auto_2309890 ?auto_2309906 ) ) ( not ( = ?auto_2309891 ?auto_2309893 ) ) ( not ( = ?auto_2309891 ?auto_2309892 ) ) ( not ( = ?auto_2309891 ?auto_2309894 ) ) ( not ( = ?auto_2309891 ?auto_2309895 ) ) ( not ( = ?auto_2309891 ?auto_2309896 ) ) ( not ( = ?auto_2309891 ?auto_2309897 ) ) ( not ( = ?auto_2309891 ?auto_2309898 ) ) ( not ( = ?auto_2309891 ?auto_2309899 ) ) ( not ( = ?auto_2309891 ?auto_2309900 ) ) ( not ( = ?auto_2309891 ?auto_2309901 ) ) ( not ( = ?auto_2309891 ?auto_2309902 ) ) ( not ( = ?auto_2309891 ?auto_2309906 ) ) ( not ( = ?auto_2309893 ?auto_2309892 ) ) ( not ( = ?auto_2309893 ?auto_2309894 ) ) ( not ( = ?auto_2309893 ?auto_2309895 ) ) ( not ( = ?auto_2309893 ?auto_2309896 ) ) ( not ( = ?auto_2309893 ?auto_2309897 ) ) ( not ( = ?auto_2309893 ?auto_2309898 ) ) ( not ( = ?auto_2309893 ?auto_2309899 ) ) ( not ( = ?auto_2309893 ?auto_2309900 ) ) ( not ( = ?auto_2309893 ?auto_2309901 ) ) ( not ( = ?auto_2309893 ?auto_2309902 ) ) ( not ( = ?auto_2309893 ?auto_2309906 ) ) ( not ( = ?auto_2309892 ?auto_2309894 ) ) ( not ( = ?auto_2309892 ?auto_2309895 ) ) ( not ( = ?auto_2309892 ?auto_2309896 ) ) ( not ( = ?auto_2309892 ?auto_2309897 ) ) ( not ( = ?auto_2309892 ?auto_2309898 ) ) ( not ( = ?auto_2309892 ?auto_2309899 ) ) ( not ( = ?auto_2309892 ?auto_2309900 ) ) ( not ( = ?auto_2309892 ?auto_2309901 ) ) ( not ( = ?auto_2309892 ?auto_2309902 ) ) ( not ( = ?auto_2309892 ?auto_2309906 ) ) ( not ( = ?auto_2309894 ?auto_2309895 ) ) ( not ( = ?auto_2309894 ?auto_2309896 ) ) ( not ( = ?auto_2309894 ?auto_2309897 ) ) ( not ( = ?auto_2309894 ?auto_2309898 ) ) ( not ( = ?auto_2309894 ?auto_2309899 ) ) ( not ( = ?auto_2309894 ?auto_2309900 ) ) ( not ( = ?auto_2309894 ?auto_2309901 ) ) ( not ( = ?auto_2309894 ?auto_2309902 ) ) ( not ( = ?auto_2309894 ?auto_2309906 ) ) ( not ( = ?auto_2309895 ?auto_2309896 ) ) ( not ( = ?auto_2309895 ?auto_2309897 ) ) ( not ( = ?auto_2309895 ?auto_2309898 ) ) ( not ( = ?auto_2309895 ?auto_2309899 ) ) ( not ( = ?auto_2309895 ?auto_2309900 ) ) ( not ( = ?auto_2309895 ?auto_2309901 ) ) ( not ( = ?auto_2309895 ?auto_2309902 ) ) ( not ( = ?auto_2309895 ?auto_2309906 ) ) ( not ( = ?auto_2309896 ?auto_2309897 ) ) ( not ( = ?auto_2309896 ?auto_2309898 ) ) ( not ( = ?auto_2309896 ?auto_2309899 ) ) ( not ( = ?auto_2309896 ?auto_2309900 ) ) ( not ( = ?auto_2309896 ?auto_2309901 ) ) ( not ( = ?auto_2309896 ?auto_2309902 ) ) ( not ( = ?auto_2309896 ?auto_2309906 ) ) ( not ( = ?auto_2309897 ?auto_2309898 ) ) ( not ( = ?auto_2309897 ?auto_2309899 ) ) ( not ( = ?auto_2309897 ?auto_2309900 ) ) ( not ( = ?auto_2309897 ?auto_2309901 ) ) ( not ( = ?auto_2309897 ?auto_2309902 ) ) ( not ( = ?auto_2309897 ?auto_2309906 ) ) ( not ( = ?auto_2309898 ?auto_2309899 ) ) ( not ( = ?auto_2309898 ?auto_2309900 ) ) ( not ( = ?auto_2309898 ?auto_2309901 ) ) ( not ( = ?auto_2309898 ?auto_2309902 ) ) ( not ( = ?auto_2309898 ?auto_2309906 ) ) ( not ( = ?auto_2309899 ?auto_2309900 ) ) ( not ( = ?auto_2309899 ?auto_2309901 ) ) ( not ( = ?auto_2309899 ?auto_2309902 ) ) ( not ( = ?auto_2309899 ?auto_2309906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2309900 ?auto_2309901 ?auto_2309902 )
      ( MAKE-13CRATE-VERIFY ?auto_2309889 ?auto_2309890 ?auto_2309891 ?auto_2309893 ?auto_2309892 ?auto_2309894 ?auto_2309895 ?auto_2309896 ?auto_2309897 ?auto_2309898 ?auto_2309899 ?auto_2309900 ?auto_2309901 ?auto_2309902 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2310072 - SURFACE
      ?auto_2310073 - SURFACE
      ?auto_2310074 - SURFACE
      ?auto_2310076 - SURFACE
      ?auto_2310075 - SURFACE
      ?auto_2310077 - SURFACE
      ?auto_2310078 - SURFACE
      ?auto_2310079 - SURFACE
      ?auto_2310080 - SURFACE
      ?auto_2310081 - SURFACE
      ?auto_2310082 - SURFACE
      ?auto_2310083 - SURFACE
      ?auto_2310084 - SURFACE
      ?auto_2310085 - SURFACE
    )
    :vars
    (
      ?auto_2310091 - HOIST
      ?auto_2310088 - PLACE
      ?auto_2310086 - PLACE
      ?auto_2310087 - HOIST
      ?auto_2310090 - SURFACE
      ?auto_2310089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2310091 ?auto_2310088 ) ( IS-CRATE ?auto_2310085 ) ( not ( = ?auto_2310084 ?auto_2310085 ) ) ( not ( = ?auto_2310083 ?auto_2310084 ) ) ( not ( = ?auto_2310083 ?auto_2310085 ) ) ( not ( = ?auto_2310086 ?auto_2310088 ) ) ( HOIST-AT ?auto_2310087 ?auto_2310086 ) ( not ( = ?auto_2310091 ?auto_2310087 ) ) ( AVAILABLE ?auto_2310087 ) ( SURFACE-AT ?auto_2310085 ?auto_2310086 ) ( ON ?auto_2310085 ?auto_2310090 ) ( CLEAR ?auto_2310085 ) ( not ( = ?auto_2310084 ?auto_2310090 ) ) ( not ( = ?auto_2310085 ?auto_2310090 ) ) ( not ( = ?auto_2310083 ?auto_2310090 ) ) ( TRUCK-AT ?auto_2310089 ?auto_2310088 ) ( SURFACE-AT ?auto_2310083 ?auto_2310088 ) ( CLEAR ?auto_2310083 ) ( LIFTING ?auto_2310091 ?auto_2310084 ) ( IS-CRATE ?auto_2310084 ) ( ON ?auto_2310073 ?auto_2310072 ) ( ON ?auto_2310074 ?auto_2310073 ) ( ON ?auto_2310076 ?auto_2310074 ) ( ON ?auto_2310075 ?auto_2310076 ) ( ON ?auto_2310077 ?auto_2310075 ) ( ON ?auto_2310078 ?auto_2310077 ) ( ON ?auto_2310079 ?auto_2310078 ) ( ON ?auto_2310080 ?auto_2310079 ) ( ON ?auto_2310081 ?auto_2310080 ) ( ON ?auto_2310082 ?auto_2310081 ) ( ON ?auto_2310083 ?auto_2310082 ) ( not ( = ?auto_2310072 ?auto_2310073 ) ) ( not ( = ?auto_2310072 ?auto_2310074 ) ) ( not ( = ?auto_2310072 ?auto_2310076 ) ) ( not ( = ?auto_2310072 ?auto_2310075 ) ) ( not ( = ?auto_2310072 ?auto_2310077 ) ) ( not ( = ?auto_2310072 ?auto_2310078 ) ) ( not ( = ?auto_2310072 ?auto_2310079 ) ) ( not ( = ?auto_2310072 ?auto_2310080 ) ) ( not ( = ?auto_2310072 ?auto_2310081 ) ) ( not ( = ?auto_2310072 ?auto_2310082 ) ) ( not ( = ?auto_2310072 ?auto_2310083 ) ) ( not ( = ?auto_2310072 ?auto_2310084 ) ) ( not ( = ?auto_2310072 ?auto_2310085 ) ) ( not ( = ?auto_2310072 ?auto_2310090 ) ) ( not ( = ?auto_2310073 ?auto_2310074 ) ) ( not ( = ?auto_2310073 ?auto_2310076 ) ) ( not ( = ?auto_2310073 ?auto_2310075 ) ) ( not ( = ?auto_2310073 ?auto_2310077 ) ) ( not ( = ?auto_2310073 ?auto_2310078 ) ) ( not ( = ?auto_2310073 ?auto_2310079 ) ) ( not ( = ?auto_2310073 ?auto_2310080 ) ) ( not ( = ?auto_2310073 ?auto_2310081 ) ) ( not ( = ?auto_2310073 ?auto_2310082 ) ) ( not ( = ?auto_2310073 ?auto_2310083 ) ) ( not ( = ?auto_2310073 ?auto_2310084 ) ) ( not ( = ?auto_2310073 ?auto_2310085 ) ) ( not ( = ?auto_2310073 ?auto_2310090 ) ) ( not ( = ?auto_2310074 ?auto_2310076 ) ) ( not ( = ?auto_2310074 ?auto_2310075 ) ) ( not ( = ?auto_2310074 ?auto_2310077 ) ) ( not ( = ?auto_2310074 ?auto_2310078 ) ) ( not ( = ?auto_2310074 ?auto_2310079 ) ) ( not ( = ?auto_2310074 ?auto_2310080 ) ) ( not ( = ?auto_2310074 ?auto_2310081 ) ) ( not ( = ?auto_2310074 ?auto_2310082 ) ) ( not ( = ?auto_2310074 ?auto_2310083 ) ) ( not ( = ?auto_2310074 ?auto_2310084 ) ) ( not ( = ?auto_2310074 ?auto_2310085 ) ) ( not ( = ?auto_2310074 ?auto_2310090 ) ) ( not ( = ?auto_2310076 ?auto_2310075 ) ) ( not ( = ?auto_2310076 ?auto_2310077 ) ) ( not ( = ?auto_2310076 ?auto_2310078 ) ) ( not ( = ?auto_2310076 ?auto_2310079 ) ) ( not ( = ?auto_2310076 ?auto_2310080 ) ) ( not ( = ?auto_2310076 ?auto_2310081 ) ) ( not ( = ?auto_2310076 ?auto_2310082 ) ) ( not ( = ?auto_2310076 ?auto_2310083 ) ) ( not ( = ?auto_2310076 ?auto_2310084 ) ) ( not ( = ?auto_2310076 ?auto_2310085 ) ) ( not ( = ?auto_2310076 ?auto_2310090 ) ) ( not ( = ?auto_2310075 ?auto_2310077 ) ) ( not ( = ?auto_2310075 ?auto_2310078 ) ) ( not ( = ?auto_2310075 ?auto_2310079 ) ) ( not ( = ?auto_2310075 ?auto_2310080 ) ) ( not ( = ?auto_2310075 ?auto_2310081 ) ) ( not ( = ?auto_2310075 ?auto_2310082 ) ) ( not ( = ?auto_2310075 ?auto_2310083 ) ) ( not ( = ?auto_2310075 ?auto_2310084 ) ) ( not ( = ?auto_2310075 ?auto_2310085 ) ) ( not ( = ?auto_2310075 ?auto_2310090 ) ) ( not ( = ?auto_2310077 ?auto_2310078 ) ) ( not ( = ?auto_2310077 ?auto_2310079 ) ) ( not ( = ?auto_2310077 ?auto_2310080 ) ) ( not ( = ?auto_2310077 ?auto_2310081 ) ) ( not ( = ?auto_2310077 ?auto_2310082 ) ) ( not ( = ?auto_2310077 ?auto_2310083 ) ) ( not ( = ?auto_2310077 ?auto_2310084 ) ) ( not ( = ?auto_2310077 ?auto_2310085 ) ) ( not ( = ?auto_2310077 ?auto_2310090 ) ) ( not ( = ?auto_2310078 ?auto_2310079 ) ) ( not ( = ?auto_2310078 ?auto_2310080 ) ) ( not ( = ?auto_2310078 ?auto_2310081 ) ) ( not ( = ?auto_2310078 ?auto_2310082 ) ) ( not ( = ?auto_2310078 ?auto_2310083 ) ) ( not ( = ?auto_2310078 ?auto_2310084 ) ) ( not ( = ?auto_2310078 ?auto_2310085 ) ) ( not ( = ?auto_2310078 ?auto_2310090 ) ) ( not ( = ?auto_2310079 ?auto_2310080 ) ) ( not ( = ?auto_2310079 ?auto_2310081 ) ) ( not ( = ?auto_2310079 ?auto_2310082 ) ) ( not ( = ?auto_2310079 ?auto_2310083 ) ) ( not ( = ?auto_2310079 ?auto_2310084 ) ) ( not ( = ?auto_2310079 ?auto_2310085 ) ) ( not ( = ?auto_2310079 ?auto_2310090 ) ) ( not ( = ?auto_2310080 ?auto_2310081 ) ) ( not ( = ?auto_2310080 ?auto_2310082 ) ) ( not ( = ?auto_2310080 ?auto_2310083 ) ) ( not ( = ?auto_2310080 ?auto_2310084 ) ) ( not ( = ?auto_2310080 ?auto_2310085 ) ) ( not ( = ?auto_2310080 ?auto_2310090 ) ) ( not ( = ?auto_2310081 ?auto_2310082 ) ) ( not ( = ?auto_2310081 ?auto_2310083 ) ) ( not ( = ?auto_2310081 ?auto_2310084 ) ) ( not ( = ?auto_2310081 ?auto_2310085 ) ) ( not ( = ?auto_2310081 ?auto_2310090 ) ) ( not ( = ?auto_2310082 ?auto_2310083 ) ) ( not ( = ?auto_2310082 ?auto_2310084 ) ) ( not ( = ?auto_2310082 ?auto_2310085 ) ) ( not ( = ?auto_2310082 ?auto_2310090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2310083 ?auto_2310084 ?auto_2310085 )
      ( MAKE-13CRATE-VERIFY ?auto_2310072 ?auto_2310073 ?auto_2310074 ?auto_2310076 ?auto_2310075 ?auto_2310077 ?auto_2310078 ?auto_2310079 ?auto_2310080 ?auto_2310081 ?auto_2310082 ?auto_2310083 ?auto_2310084 ?auto_2310085 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2310255 - SURFACE
      ?auto_2310256 - SURFACE
      ?auto_2310257 - SURFACE
      ?auto_2310259 - SURFACE
      ?auto_2310258 - SURFACE
      ?auto_2310260 - SURFACE
      ?auto_2310261 - SURFACE
      ?auto_2310262 - SURFACE
      ?auto_2310263 - SURFACE
      ?auto_2310264 - SURFACE
      ?auto_2310265 - SURFACE
      ?auto_2310266 - SURFACE
      ?auto_2310267 - SURFACE
      ?auto_2310268 - SURFACE
    )
    :vars
    (
      ?auto_2310269 - HOIST
      ?auto_2310272 - PLACE
      ?auto_2310271 - PLACE
      ?auto_2310270 - HOIST
      ?auto_2310273 - SURFACE
      ?auto_2310274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2310269 ?auto_2310272 ) ( IS-CRATE ?auto_2310268 ) ( not ( = ?auto_2310267 ?auto_2310268 ) ) ( not ( = ?auto_2310266 ?auto_2310267 ) ) ( not ( = ?auto_2310266 ?auto_2310268 ) ) ( not ( = ?auto_2310271 ?auto_2310272 ) ) ( HOIST-AT ?auto_2310270 ?auto_2310271 ) ( not ( = ?auto_2310269 ?auto_2310270 ) ) ( AVAILABLE ?auto_2310270 ) ( SURFACE-AT ?auto_2310268 ?auto_2310271 ) ( ON ?auto_2310268 ?auto_2310273 ) ( CLEAR ?auto_2310268 ) ( not ( = ?auto_2310267 ?auto_2310273 ) ) ( not ( = ?auto_2310268 ?auto_2310273 ) ) ( not ( = ?auto_2310266 ?auto_2310273 ) ) ( TRUCK-AT ?auto_2310274 ?auto_2310272 ) ( SURFACE-AT ?auto_2310266 ?auto_2310272 ) ( CLEAR ?auto_2310266 ) ( IS-CRATE ?auto_2310267 ) ( AVAILABLE ?auto_2310269 ) ( IN ?auto_2310267 ?auto_2310274 ) ( ON ?auto_2310256 ?auto_2310255 ) ( ON ?auto_2310257 ?auto_2310256 ) ( ON ?auto_2310259 ?auto_2310257 ) ( ON ?auto_2310258 ?auto_2310259 ) ( ON ?auto_2310260 ?auto_2310258 ) ( ON ?auto_2310261 ?auto_2310260 ) ( ON ?auto_2310262 ?auto_2310261 ) ( ON ?auto_2310263 ?auto_2310262 ) ( ON ?auto_2310264 ?auto_2310263 ) ( ON ?auto_2310265 ?auto_2310264 ) ( ON ?auto_2310266 ?auto_2310265 ) ( not ( = ?auto_2310255 ?auto_2310256 ) ) ( not ( = ?auto_2310255 ?auto_2310257 ) ) ( not ( = ?auto_2310255 ?auto_2310259 ) ) ( not ( = ?auto_2310255 ?auto_2310258 ) ) ( not ( = ?auto_2310255 ?auto_2310260 ) ) ( not ( = ?auto_2310255 ?auto_2310261 ) ) ( not ( = ?auto_2310255 ?auto_2310262 ) ) ( not ( = ?auto_2310255 ?auto_2310263 ) ) ( not ( = ?auto_2310255 ?auto_2310264 ) ) ( not ( = ?auto_2310255 ?auto_2310265 ) ) ( not ( = ?auto_2310255 ?auto_2310266 ) ) ( not ( = ?auto_2310255 ?auto_2310267 ) ) ( not ( = ?auto_2310255 ?auto_2310268 ) ) ( not ( = ?auto_2310255 ?auto_2310273 ) ) ( not ( = ?auto_2310256 ?auto_2310257 ) ) ( not ( = ?auto_2310256 ?auto_2310259 ) ) ( not ( = ?auto_2310256 ?auto_2310258 ) ) ( not ( = ?auto_2310256 ?auto_2310260 ) ) ( not ( = ?auto_2310256 ?auto_2310261 ) ) ( not ( = ?auto_2310256 ?auto_2310262 ) ) ( not ( = ?auto_2310256 ?auto_2310263 ) ) ( not ( = ?auto_2310256 ?auto_2310264 ) ) ( not ( = ?auto_2310256 ?auto_2310265 ) ) ( not ( = ?auto_2310256 ?auto_2310266 ) ) ( not ( = ?auto_2310256 ?auto_2310267 ) ) ( not ( = ?auto_2310256 ?auto_2310268 ) ) ( not ( = ?auto_2310256 ?auto_2310273 ) ) ( not ( = ?auto_2310257 ?auto_2310259 ) ) ( not ( = ?auto_2310257 ?auto_2310258 ) ) ( not ( = ?auto_2310257 ?auto_2310260 ) ) ( not ( = ?auto_2310257 ?auto_2310261 ) ) ( not ( = ?auto_2310257 ?auto_2310262 ) ) ( not ( = ?auto_2310257 ?auto_2310263 ) ) ( not ( = ?auto_2310257 ?auto_2310264 ) ) ( not ( = ?auto_2310257 ?auto_2310265 ) ) ( not ( = ?auto_2310257 ?auto_2310266 ) ) ( not ( = ?auto_2310257 ?auto_2310267 ) ) ( not ( = ?auto_2310257 ?auto_2310268 ) ) ( not ( = ?auto_2310257 ?auto_2310273 ) ) ( not ( = ?auto_2310259 ?auto_2310258 ) ) ( not ( = ?auto_2310259 ?auto_2310260 ) ) ( not ( = ?auto_2310259 ?auto_2310261 ) ) ( not ( = ?auto_2310259 ?auto_2310262 ) ) ( not ( = ?auto_2310259 ?auto_2310263 ) ) ( not ( = ?auto_2310259 ?auto_2310264 ) ) ( not ( = ?auto_2310259 ?auto_2310265 ) ) ( not ( = ?auto_2310259 ?auto_2310266 ) ) ( not ( = ?auto_2310259 ?auto_2310267 ) ) ( not ( = ?auto_2310259 ?auto_2310268 ) ) ( not ( = ?auto_2310259 ?auto_2310273 ) ) ( not ( = ?auto_2310258 ?auto_2310260 ) ) ( not ( = ?auto_2310258 ?auto_2310261 ) ) ( not ( = ?auto_2310258 ?auto_2310262 ) ) ( not ( = ?auto_2310258 ?auto_2310263 ) ) ( not ( = ?auto_2310258 ?auto_2310264 ) ) ( not ( = ?auto_2310258 ?auto_2310265 ) ) ( not ( = ?auto_2310258 ?auto_2310266 ) ) ( not ( = ?auto_2310258 ?auto_2310267 ) ) ( not ( = ?auto_2310258 ?auto_2310268 ) ) ( not ( = ?auto_2310258 ?auto_2310273 ) ) ( not ( = ?auto_2310260 ?auto_2310261 ) ) ( not ( = ?auto_2310260 ?auto_2310262 ) ) ( not ( = ?auto_2310260 ?auto_2310263 ) ) ( not ( = ?auto_2310260 ?auto_2310264 ) ) ( not ( = ?auto_2310260 ?auto_2310265 ) ) ( not ( = ?auto_2310260 ?auto_2310266 ) ) ( not ( = ?auto_2310260 ?auto_2310267 ) ) ( not ( = ?auto_2310260 ?auto_2310268 ) ) ( not ( = ?auto_2310260 ?auto_2310273 ) ) ( not ( = ?auto_2310261 ?auto_2310262 ) ) ( not ( = ?auto_2310261 ?auto_2310263 ) ) ( not ( = ?auto_2310261 ?auto_2310264 ) ) ( not ( = ?auto_2310261 ?auto_2310265 ) ) ( not ( = ?auto_2310261 ?auto_2310266 ) ) ( not ( = ?auto_2310261 ?auto_2310267 ) ) ( not ( = ?auto_2310261 ?auto_2310268 ) ) ( not ( = ?auto_2310261 ?auto_2310273 ) ) ( not ( = ?auto_2310262 ?auto_2310263 ) ) ( not ( = ?auto_2310262 ?auto_2310264 ) ) ( not ( = ?auto_2310262 ?auto_2310265 ) ) ( not ( = ?auto_2310262 ?auto_2310266 ) ) ( not ( = ?auto_2310262 ?auto_2310267 ) ) ( not ( = ?auto_2310262 ?auto_2310268 ) ) ( not ( = ?auto_2310262 ?auto_2310273 ) ) ( not ( = ?auto_2310263 ?auto_2310264 ) ) ( not ( = ?auto_2310263 ?auto_2310265 ) ) ( not ( = ?auto_2310263 ?auto_2310266 ) ) ( not ( = ?auto_2310263 ?auto_2310267 ) ) ( not ( = ?auto_2310263 ?auto_2310268 ) ) ( not ( = ?auto_2310263 ?auto_2310273 ) ) ( not ( = ?auto_2310264 ?auto_2310265 ) ) ( not ( = ?auto_2310264 ?auto_2310266 ) ) ( not ( = ?auto_2310264 ?auto_2310267 ) ) ( not ( = ?auto_2310264 ?auto_2310268 ) ) ( not ( = ?auto_2310264 ?auto_2310273 ) ) ( not ( = ?auto_2310265 ?auto_2310266 ) ) ( not ( = ?auto_2310265 ?auto_2310267 ) ) ( not ( = ?auto_2310265 ?auto_2310268 ) ) ( not ( = ?auto_2310265 ?auto_2310273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2310266 ?auto_2310267 ?auto_2310268 )
      ( MAKE-13CRATE-VERIFY ?auto_2310255 ?auto_2310256 ?auto_2310257 ?auto_2310259 ?auto_2310258 ?auto_2310260 ?auto_2310261 ?auto_2310262 ?auto_2310263 ?auto_2310264 ?auto_2310265 ?auto_2310266 ?auto_2310267 ?auto_2310268 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2324472 - SURFACE
      ?auto_2324473 - SURFACE
      ?auto_2324474 - SURFACE
      ?auto_2324476 - SURFACE
      ?auto_2324475 - SURFACE
      ?auto_2324477 - SURFACE
      ?auto_2324478 - SURFACE
      ?auto_2324479 - SURFACE
      ?auto_2324480 - SURFACE
      ?auto_2324481 - SURFACE
      ?auto_2324482 - SURFACE
      ?auto_2324483 - SURFACE
      ?auto_2324484 - SURFACE
      ?auto_2324485 - SURFACE
      ?auto_2324486 - SURFACE
    )
    :vars
    (
      ?auto_2324488 - HOIST
      ?auto_2324487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2324488 ?auto_2324487 ) ( SURFACE-AT ?auto_2324485 ?auto_2324487 ) ( CLEAR ?auto_2324485 ) ( LIFTING ?auto_2324488 ?auto_2324486 ) ( IS-CRATE ?auto_2324486 ) ( not ( = ?auto_2324485 ?auto_2324486 ) ) ( ON ?auto_2324473 ?auto_2324472 ) ( ON ?auto_2324474 ?auto_2324473 ) ( ON ?auto_2324476 ?auto_2324474 ) ( ON ?auto_2324475 ?auto_2324476 ) ( ON ?auto_2324477 ?auto_2324475 ) ( ON ?auto_2324478 ?auto_2324477 ) ( ON ?auto_2324479 ?auto_2324478 ) ( ON ?auto_2324480 ?auto_2324479 ) ( ON ?auto_2324481 ?auto_2324480 ) ( ON ?auto_2324482 ?auto_2324481 ) ( ON ?auto_2324483 ?auto_2324482 ) ( ON ?auto_2324484 ?auto_2324483 ) ( ON ?auto_2324485 ?auto_2324484 ) ( not ( = ?auto_2324472 ?auto_2324473 ) ) ( not ( = ?auto_2324472 ?auto_2324474 ) ) ( not ( = ?auto_2324472 ?auto_2324476 ) ) ( not ( = ?auto_2324472 ?auto_2324475 ) ) ( not ( = ?auto_2324472 ?auto_2324477 ) ) ( not ( = ?auto_2324472 ?auto_2324478 ) ) ( not ( = ?auto_2324472 ?auto_2324479 ) ) ( not ( = ?auto_2324472 ?auto_2324480 ) ) ( not ( = ?auto_2324472 ?auto_2324481 ) ) ( not ( = ?auto_2324472 ?auto_2324482 ) ) ( not ( = ?auto_2324472 ?auto_2324483 ) ) ( not ( = ?auto_2324472 ?auto_2324484 ) ) ( not ( = ?auto_2324472 ?auto_2324485 ) ) ( not ( = ?auto_2324472 ?auto_2324486 ) ) ( not ( = ?auto_2324473 ?auto_2324474 ) ) ( not ( = ?auto_2324473 ?auto_2324476 ) ) ( not ( = ?auto_2324473 ?auto_2324475 ) ) ( not ( = ?auto_2324473 ?auto_2324477 ) ) ( not ( = ?auto_2324473 ?auto_2324478 ) ) ( not ( = ?auto_2324473 ?auto_2324479 ) ) ( not ( = ?auto_2324473 ?auto_2324480 ) ) ( not ( = ?auto_2324473 ?auto_2324481 ) ) ( not ( = ?auto_2324473 ?auto_2324482 ) ) ( not ( = ?auto_2324473 ?auto_2324483 ) ) ( not ( = ?auto_2324473 ?auto_2324484 ) ) ( not ( = ?auto_2324473 ?auto_2324485 ) ) ( not ( = ?auto_2324473 ?auto_2324486 ) ) ( not ( = ?auto_2324474 ?auto_2324476 ) ) ( not ( = ?auto_2324474 ?auto_2324475 ) ) ( not ( = ?auto_2324474 ?auto_2324477 ) ) ( not ( = ?auto_2324474 ?auto_2324478 ) ) ( not ( = ?auto_2324474 ?auto_2324479 ) ) ( not ( = ?auto_2324474 ?auto_2324480 ) ) ( not ( = ?auto_2324474 ?auto_2324481 ) ) ( not ( = ?auto_2324474 ?auto_2324482 ) ) ( not ( = ?auto_2324474 ?auto_2324483 ) ) ( not ( = ?auto_2324474 ?auto_2324484 ) ) ( not ( = ?auto_2324474 ?auto_2324485 ) ) ( not ( = ?auto_2324474 ?auto_2324486 ) ) ( not ( = ?auto_2324476 ?auto_2324475 ) ) ( not ( = ?auto_2324476 ?auto_2324477 ) ) ( not ( = ?auto_2324476 ?auto_2324478 ) ) ( not ( = ?auto_2324476 ?auto_2324479 ) ) ( not ( = ?auto_2324476 ?auto_2324480 ) ) ( not ( = ?auto_2324476 ?auto_2324481 ) ) ( not ( = ?auto_2324476 ?auto_2324482 ) ) ( not ( = ?auto_2324476 ?auto_2324483 ) ) ( not ( = ?auto_2324476 ?auto_2324484 ) ) ( not ( = ?auto_2324476 ?auto_2324485 ) ) ( not ( = ?auto_2324476 ?auto_2324486 ) ) ( not ( = ?auto_2324475 ?auto_2324477 ) ) ( not ( = ?auto_2324475 ?auto_2324478 ) ) ( not ( = ?auto_2324475 ?auto_2324479 ) ) ( not ( = ?auto_2324475 ?auto_2324480 ) ) ( not ( = ?auto_2324475 ?auto_2324481 ) ) ( not ( = ?auto_2324475 ?auto_2324482 ) ) ( not ( = ?auto_2324475 ?auto_2324483 ) ) ( not ( = ?auto_2324475 ?auto_2324484 ) ) ( not ( = ?auto_2324475 ?auto_2324485 ) ) ( not ( = ?auto_2324475 ?auto_2324486 ) ) ( not ( = ?auto_2324477 ?auto_2324478 ) ) ( not ( = ?auto_2324477 ?auto_2324479 ) ) ( not ( = ?auto_2324477 ?auto_2324480 ) ) ( not ( = ?auto_2324477 ?auto_2324481 ) ) ( not ( = ?auto_2324477 ?auto_2324482 ) ) ( not ( = ?auto_2324477 ?auto_2324483 ) ) ( not ( = ?auto_2324477 ?auto_2324484 ) ) ( not ( = ?auto_2324477 ?auto_2324485 ) ) ( not ( = ?auto_2324477 ?auto_2324486 ) ) ( not ( = ?auto_2324478 ?auto_2324479 ) ) ( not ( = ?auto_2324478 ?auto_2324480 ) ) ( not ( = ?auto_2324478 ?auto_2324481 ) ) ( not ( = ?auto_2324478 ?auto_2324482 ) ) ( not ( = ?auto_2324478 ?auto_2324483 ) ) ( not ( = ?auto_2324478 ?auto_2324484 ) ) ( not ( = ?auto_2324478 ?auto_2324485 ) ) ( not ( = ?auto_2324478 ?auto_2324486 ) ) ( not ( = ?auto_2324479 ?auto_2324480 ) ) ( not ( = ?auto_2324479 ?auto_2324481 ) ) ( not ( = ?auto_2324479 ?auto_2324482 ) ) ( not ( = ?auto_2324479 ?auto_2324483 ) ) ( not ( = ?auto_2324479 ?auto_2324484 ) ) ( not ( = ?auto_2324479 ?auto_2324485 ) ) ( not ( = ?auto_2324479 ?auto_2324486 ) ) ( not ( = ?auto_2324480 ?auto_2324481 ) ) ( not ( = ?auto_2324480 ?auto_2324482 ) ) ( not ( = ?auto_2324480 ?auto_2324483 ) ) ( not ( = ?auto_2324480 ?auto_2324484 ) ) ( not ( = ?auto_2324480 ?auto_2324485 ) ) ( not ( = ?auto_2324480 ?auto_2324486 ) ) ( not ( = ?auto_2324481 ?auto_2324482 ) ) ( not ( = ?auto_2324481 ?auto_2324483 ) ) ( not ( = ?auto_2324481 ?auto_2324484 ) ) ( not ( = ?auto_2324481 ?auto_2324485 ) ) ( not ( = ?auto_2324481 ?auto_2324486 ) ) ( not ( = ?auto_2324482 ?auto_2324483 ) ) ( not ( = ?auto_2324482 ?auto_2324484 ) ) ( not ( = ?auto_2324482 ?auto_2324485 ) ) ( not ( = ?auto_2324482 ?auto_2324486 ) ) ( not ( = ?auto_2324483 ?auto_2324484 ) ) ( not ( = ?auto_2324483 ?auto_2324485 ) ) ( not ( = ?auto_2324483 ?auto_2324486 ) ) ( not ( = ?auto_2324484 ?auto_2324485 ) ) ( not ( = ?auto_2324484 ?auto_2324486 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2324485 ?auto_2324486 )
      ( MAKE-14CRATE-VERIFY ?auto_2324472 ?auto_2324473 ?auto_2324474 ?auto_2324476 ?auto_2324475 ?auto_2324477 ?auto_2324478 ?auto_2324479 ?auto_2324480 ?auto_2324481 ?auto_2324482 ?auto_2324483 ?auto_2324484 ?auto_2324485 ?auto_2324486 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2324632 - SURFACE
      ?auto_2324633 - SURFACE
      ?auto_2324634 - SURFACE
      ?auto_2324636 - SURFACE
      ?auto_2324635 - SURFACE
      ?auto_2324637 - SURFACE
      ?auto_2324638 - SURFACE
      ?auto_2324639 - SURFACE
      ?auto_2324640 - SURFACE
      ?auto_2324641 - SURFACE
      ?auto_2324642 - SURFACE
      ?auto_2324643 - SURFACE
      ?auto_2324644 - SURFACE
      ?auto_2324645 - SURFACE
      ?auto_2324646 - SURFACE
    )
    :vars
    (
      ?auto_2324647 - HOIST
      ?auto_2324648 - PLACE
      ?auto_2324649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2324647 ?auto_2324648 ) ( SURFACE-AT ?auto_2324645 ?auto_2324648 ) ( CLEAR ?auto_2324645 ) ( IS-CRATE ?auto_2324646 ) ( not ( = ?auto_2324645 ?auto_2324646 ) ) ( TRUCK-AT ?auto_2324649 ?auto_2324648 ) ( AVAILABLE ?auto_2324647 ) ( IN ?auto_2324646 ?auto_2324649 ) ( ON ?auto_2324645 ?auto_2324644 ) ( not ( = ?auto_2324644 ?auto_2324645 ) ) ( not ( = ?auto_2324644 ?auto_2324646 ) ) ( ON ?auto_2324633 ?auto_2324632 ) ( ON ?auto_2324634 ?auto_2324633 ) ( ON ?auto_2324636 ?auto_2324634 ) ( ON ?auto_2324635 ?auto_2324636 ) ( ON ?auto_2324637 ?auto_2324635 ) ( ON ?auto_2324638 ?auto_2324637 ) ( ON ?auto_2324639 ?auto_2324638 ) ( ON ?auto_2324640 ?auto_2324639 ) ( ON ?auto_2324641 ?auto_2324640 ) ( ON ?auto_2324642 ?auto_2324641 ) ( ON ?auto_2324643 ?auto_2324642 ) ( ON ?auto_2324644 ?auto_2324643 ) ( not ( = ?auto_2324632 ?auto_2324633 ) ) ( not ( = ?auto_2324632 ?auto_2324634 ) ) ( not ( = ?auto_2324632 ?auto_2324636 ) ) ( not ( = ?auto_2324632 ?auto_2324635 ) ) ( not ( = ?auto_2324632 ?auto_2324637 ) ) ( not ( = ?auto_2324632 ?auto_2324638 ) ) ( not ( = ?auto_2324632 ?auto_2324639 ) ) ( not ( = ?auto_2324632 ?auto_2324640 ) ) ( not ( = ?auto_2324632 ?auto_2324641 ) ) ( not ( = ?auto_2324632 ?auto_2324642 ) ) ( not ( = ?auto_2324632 ?auto_2324643 ) ) ( not ( = ?auto_2324632 ?auto_2324644 ) ) ( not ( = ?auto_2324632 ?auto_2324645 ) ) ( not ( = ?auto_2324632 ?auto_2324646 ) ) ( not ( = ?auto_2324633 ?auto_2324634 ) ) ( not ( = ?auto_2324633 ?auto_2324636 ) ) ( not ( = ?auto_2324633 ?auto_2324635 ) ) ( not ( = ?auto_2324633 ?auto_2324637 ) ) ( not ( = ?auto_2324633 ?auto_2324638 ) ) ( not ( = ?auto_2324633 ?auto_2324639 ) ) ( not ( = ?auto_2324633 ?auto_2324640 ) ) ( not ( = ?auto_2324633 ?auto_2324641 ) ) ( not ( = ?auto_2324633 ?auto_2324642 ) ) ( not ( = ?auto_2324633 ?auto_2324643 ) ) ( not ( = ?auto_2324633 ?auto_2324644 ) ) ( not ( = ?auto_2324633 ?auto_2324645 ) ) ( not ( = ?auto_2324633 ?auto_2324646 ) ) ( not ( = ?auto_2324634 ?auto_2324636 ) ) ( not ( = ?auto_2324634 ?auto_2324635 ) ) ( not ( = ?auto_2324634 ?auto_2324637 ) ) ( not ( = ?auto_2324634 ?auto_2324638 ) ) ( not ( = ?auto_2324634 ?auto_2324639 ) ) ( not ( = ?auto_2324634 ?auto_2324640 ) ) ( not ( = ?auto_2324634 ?auto_2324641 ) ) ( not ( = ?auto_2324634 ?auto_2324642 ) ) ( not ( = ?auto_2324634 ?auto_2324643 ) ) ( not ( = ?auto_2324634 ?auto_2324644 ) ) ( not ( = ?auto_2324634 ?auto_2324645 ) ) ( not ( = ?auto_2324634 ?auto_2324646 ) ) ( not ( = ?auto_2324636 ?auto_2324635 ) ) ( not ( = ?auto_2324636 ?auto_2324637 ) ) ( not ( = ?auto_2324636 ?auto_2324638 ) ) ( not ( = ?auto_2324636 ?auto_2324639 ) ) ( not ( = ?auto_2324636 ?auto_2324640 ) ) ( not ( = ?auto_2324636 ?auto_2324641 ) ) ( not ( = ?auto_2324636 ?auto_2324642 ) ) ( not ( = ?auto_2324636 ?auto_2324643 ) ) ( not ( = ?auto_2324636 ?auto_2324644 ) ) ( not ( = ?auto_2324636 ?auto_2324645 ) ) ( not ( = ?auto_2324636 ?auto_2324646 ) ) ( not ( = ?auto_2324635 ?auto_2324637 ) ) ( not ( = ?auto_2324635 ?auto_2324638 ) ) ( not ( = ?auto_2324635 ?auto_2324639 ) ) ( not ( = ?auto_2324635 ?auto_2324640 ) ) ( not ( = ?auto_2324635 ?auto_2324641 ) ) ( not ( = ?auto_2324635 ?auto_2324642 ) ) ( not ( = ?auto_2324635 ?auto_2324643 ) ) ( not ( = ?auto_2324635 ?auto_2324644 ) ) ( not ( = ?auto_2324635 ?auto_2324645 ) ) ( not ( = ?auto_2324635 ?auto_2324646 ) ) ( not ( = ?auto_2324637 ?auto_2324638 ) ) ( not ( = ?auto_2324637 ?auto_2324639 ) ) ( not ( = ?auto_2324637 ?auto_2324640 ) ) ( not ( = ?auto_2324637 ?auto_2324641 ) ) ( not ( = ?auto_2324637 ?auto_2324642 ) ) ( not ( = ?auto_2324637 ?auto_2324643 ) ) ( not ( = ?auto_2324637 ?auto_2324644 ) ) ( not ( = ?auto_2324637 ?auto_2324645 ) ) ( not ( = ?auto_2324637 ?auto_2324646 ) ) ( not ( = ?auto_2324638 ?auto_2324639 ) ) ( not ( = ?auto_2324638 ?auto_2324640 ) ) ( not ( = ?auto_2324638 ?auto_2324641 ) ) ( not ( = ?auto_2324638 ?auto_2324642 ) ) ( not ( = ?auto_2324638 ?auto_2324643 ) ) ( not ( = ?auto_2324638 ?auto_2324644 ) ) ( not ( = ?auto_2324638 ?auto_2324645 ) ) ( not ( = ?auto_2324638 ?auto_2324646 ) ) ( not ( = ?auto_2324639 ?auto_2324640 ) ) ( not ( = ?auto_2324639 ?auto_2324641 ) ) ( not ( = ?auto_2324639 ?auto_2324642 ) ) ( not ( = ?auto_2324639 ?auto_2324643 ) ) ( not ( = ?auto_2324639 ?auto_2324644 ) ) ( not ( = ?auto_2324639 ?auto_2324645 ) ) ( not ( = ?auto_2324639 ?auto_2324646 ) ) ( not ( = ?auto_2324640 ?auto_2324641 ) ) ( not ( = ?auto_2324640 ?auto_2324642 ) ) ( not ( = ?auto_2324640 ?auto_2324643 ) ) ( not ( = ?auto_2324640 ?auto_2324644 ) ) ( not ( = ?auto_2324640 ?auto_2324645 ) ) ( not ( = ?auto_2324640 ?auto_2324646 ) ) ( not ( = ?auto_2324641 ?auto_2324642 ) ) ( not ( = ?auto_2324641 ?auto_2324643 ) ) ( not ( = ?auto_2324641 ?auto_2324644 ) ) ( not ( = ?auto_2324641 ?auto_2324645 ) ) ( not ( = ?auto_2324641 ?auto_2324646 ) ) ( not ( = ?auto_2324642 ?auto_2324643 ) ) ( not ( = ?auto_2324642 ?auto_2324644 ) ) ( not ( = ?auto_2324642 ?auto_2324645 ) ) ( not ( = ?auto_2324642 ?auto_2324646 ) ) ( not ( = ?auto_2324643 ?auto_2324644 ) ) ( not ( = ?auto_2324643 ?auto_2324645 ) ) ( not ( = ?auto_2324643 ?auto_2324646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2324644 ?auto_2324645 ?auto_2324646 )
      ( MAKE-14CRATE-VERIFY ?auto_2324632 ?auto_2324633 ?auto_2324634 ?auto_2324636 ?auto_2324635 ?auto_2324637 ?auto_2324638 ?auto_2324639 ?auto_2324640 ?auto_2324641 ?auto_2324642 ?auto_2324643 ?auto_2324644 ?auto_2324645 ?auto_2324646 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2324807 - SURFACE
      ?auto_2324808 - SURFACE
      ?auto_2324809 - SURFACE
      ?auto_2324811 - SURFACE
      ?auto_2324810 - SURFACE
      ?auto_2324812 - SURFACE
      ?auto_2324813 - SURFACE
      ?auto_2324814 - SURFACE
      ?auto_2324815 - SURFACE
      ?auto_2324816 - SURFACE
      ?auto_2324817 - SURFACE
      ?auto_2324818 - SURFACE
      ?auto_2324819 - SURFACE
      ?auto_2324820 - SURFACE
      ?auto_2324821 - SURFACE
    )
    :vars
    (
      ?auto_2324822 - HOIST
      ?auto_2324824 - PLACE
      ?auto_2324825 - TRUCK
      ?auto_2324823 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2324822 ?auto_2324824 ) ( SURFACE-AT ?auto_2324820 ?auto_2324824 ) ( CLEAR ?auto_2324820 ) ( IS-CRATE ?auto_2324821 ) ( not ( = ?auto_2324820 ?auto_2324821 ) ) ( AVAILABLE ?auto_2324822 ) ( IN ?auto_2324821 ?auto_2324825 ) ( ON ?auto_2324820 ?auto_2324819 ) ( not ( = ?auto_2324819 ?auto_2324820 ) ) ( not ( = ?auto_2324819 ?auto_2324821 ) ) ( TRUCK-AT ?auto_2324825 ?auto_2324823 ) ( not ( = ?auto_2324823 ?auto_2324824 ) ) ( ON ?auto_2324808 ?auto_2324807 ) ( ON ?auto_2324809 ?auto_2324808 ) ( ON ?auto_2324811 ?auto_2324809 ) ( ON ?auto_2324810 ?auto_2324811 ) ( ON ?auto_2324812 ?auto_2324810 ) ( ON ?auto_2324813 ?auto_2324812 ) ( ON ?auto_2324814 ?auto_2324813 ) ( ON ?auto_2324815 ?auto_2324814 ) ( ON ?auto_2324816 ?auto_2324815 ) ( ON ?auto_2324817 ?auto_2324816 ) ( ON ?auto_2324818 ?auto_2324817 ) ( ON ?auto_2324819 ?auto_2324818 ) ( not ( = ?auto_2324807 ?auto_2324808 ) ) ( not ( = ?auto_2324807 ?auto_2324809 ) ) ( not ( = ?auto_2324807 ?auto_2324811 ) ) ( not ( = ?auto_2324807 ?auto_2324810 ) ) ( not ( = ?auto_2324807 ?auto_2324812 ) ) ( not ( = ?auto_2324807 ?auto_2324813 ) ) ( not ( = ?auto_2324807 ?auto_2324814 ) ) ( not ( = ?auto_2324807 ?auto_2324815 ) ) ( not ( = ?auto_2324807 ?auto_2324816 ) ) ( not ( = ?auto_2324807 ?auto_2324817 ) ) ( not ( = ?auto_2324807 ?auto_2324818 ) ) ( not ( = ?auto_2324807 ?auto_2324819 ) ) ( not ( = ?auto_2324807 ?auto_2324820 ) ) ( not ( = ?auto_2324807 ?auto_2324821 ) ) ( not ( = ?auto_2324808 ?auto_2324809 ) ) ( not ( = ?auto_2324808 ?auto_2324811 ) ) ( not ( = ?auto_2324808 ?auto_2324810 ) ) ( not ( = ?auto_2324808 ?auto_2324812 ) ) ( not ( = ?auto_2324808 ?auto_2324813 ) ) ( not ( = ?auto_2324808 ?auto_2324814 ) ) ( not ( = ?auto_2324808 ?auto_2324815 ) ) ( not ( = ?auto_2324808 ?auto_2324816 ) ) ( not ( = ?auto_2324808 ?auto_2324817 ) ) ( not ( = ?auto_2324808 ?auto_2324818 ) ) ( not ( = ?auto_2324808 ?auto_2324819 ) ) ( not ( = ?auto_2324808 ?auto_2324820 ) ) ( not ( = ?auto_2324808 ?auto_2324821 ) ) ( not ( = ?auto_2324809 ?auto_2324811 ) ) ( not ( = ?auto_2324809 ?auto_2324810 ) ) ( not ( = ?auto_2324809 ?auto_2324812 ) ) ( not ( = ?auto_2324809 ?auto_2324813 ) ) ( not ( = ?auto_2324809 ?auto_2324814 ) ) ( not ( = ?auto_2324809 ?auto_2324815 ) ) ( not ( = ?auto_2324809 ?auto_2324816 ) ) ( not ( = ?auto_2324809 ?auto_2324817 ) ) ( not ( = ?auto_2324809 ?auto_2324818 ) ) ( not ( = ?auto_2324809 ?auto_2324819 ) ) ( not ( = ?auto_2324809 ?auto_2324820 ) ) ( not ( = ?auto_2324809 ?auto_2324821 ) ) ( not ( = ?auto_2324811 ?auto_2324810 ) ) ( not ( = ?auto_2324811 ?auto_2324812 ) ) ( not ( = ?auto_2324811 ?auto_2324813 ) ) ( not ( = ?auto_2324811 ?auto_2324814 ) ) ( not ( = ?auto_2324811 ?auto_2324815 ) ) ( not ( = ?auto_2324811 ?auto_2324816 ) ) ( not ( = ?auto_2324811 ?auto_2324817 ) ) ( not ( = ?auto_2324811 ?auto_2324818 ) ) ( not ( = ?auto_2324811 ?auto_2324819 ) ) ( not ( = ?auto_2324811 ?auto_2324820 ) ) ( not ( = ?auto_2324811 ?auto_2324821 ) ) ( not ( = ?auto_2324810 ?auto_2324812 ) ) ( not ( = ?auto_2324810 ?auto_2324813 ) ) ( not ( = ?auto_2324810 ?auto_2324814 ) ) ( not ( = ?auto_2324810 ?auto_2324815 ) ) ( not ( = ?auto_2324810 ?auto_2324816 ) ) ( not ( = ?auto_2324810 ?auto_2324817 ) ) ( not ( = ?auto_2324810 ?auto_2324818 ) ) ( not ( = ?auto_2324810 ?auto_2324819 ) ) ( not ( = ?auto_2324810 ?auto_2324820 ) ) ( not ( = ?auto_2324810 ?auto_2324821 ) ) ( not ( = ?auto_2324812 ?auto_2324813 ) ) ( not ( = ?auto_2324812 ?auto_2324814 ) ) ( not ( = ?auto_2324812 ?auto_2324815 ) ) ( not ( = ?auto_2324812 ?auto_2324816 ) ) ( not ( = ?auto_2324812 ?auto_2324817 ) ) ( not ( = ?auto_2324812 ?auto_2324818 ) ) ( not ( = ?auto_2324812 ?auto_2324819 ) ) ( not ( = ?auto_2324812 ?auto_2324820 ) ) ( not ( = ?auto_2324812 ?auto_2324821 ) ) ( not ( = ?auto_2324813 ?auto_2324814 ) ) ( not ( = ?auto_2324813 ?auto_2324815 ) ) ( not ( = ?auto_2324813 ?auto_2324816 ) ) ( not ( = ?auto_2324813 ?auto_2324817 ) ) ( not ( = ?auto_2324813 ?auto_2324818 ) ) ( not ( = ?auto_2324813 ?auto_2324819 ) ) ( not ( = ?auto_2324813 ?auto_2324820 ) ) ( not ( = ?auto_2324813 ?auto_2324821 ) ) ( not ( = ?auto_2324814 ?auto_2324815 ) ) ( not ( = ?auto_2324814 ?auto_2324816 ) ) ( not ( = ?auto_2324814 ?auto_2324817 ) ) ( not ( = ?auto_2324814 ?auto_2324818 ) ) ( not ( = ?auto_2324814 ?auto_2324819 ) ) ( not ( = ?auto_2324814 ?auto_2324820 ) ) ( not ( = ?auto_2324814 ?auto_2324821 ) ) ( not ( = ?auto_2324815 ?auto_2324816 ) ) ( not ( = ?auto_2324815 ?auto_2324817 ) ) ( not ( = ?auto_2324815 ?auto_2324818 ) ) ( not ( = ?auto_2324815 ?auto_2324819 ) ) ( not ( = ?auto_2324815 ?auto_2324820 ) ) ( not ( = ?auto_2324815 ?auto_2324821 ) ) ( not ( = ?auto_2324816 ?auto_2324817 ) ) ( not ( = ?auto_2324816 ?auto_2324818 ) ) ( not ( = ?auto_2324816 ?auto_2324819 ) ) ( not ( = ?auto_2324816 ?auto_2324820 ) ) ( not ( = ?auto_2324816 ?auto_2324821 ) ) ( not ( = ?auto_2324817 ?auto_2324818 ) ) ( not ( = ?auto_2324817 ?auto_2324819 ) ) ( not ( = ?auto_2324817 ?auto_2324820 ) ) ( not ( = ?auto_2324817 ?auto_2324821 ) ) ( not ( = ?auto_2324818 ?auto_2324819 ) ) ( not ( = ?auto_2324818 ?auto_2324820 ) ) ( not ( = ?auto_2324818 ?auto_2324821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2324819 ?auto_2324820 ?auto_2324821 )
      ( MAKE-14CRATE-VERIFY ?auto_2324807 ?auto_2324808 ?auto_2324809 ?auto_2324811 ?auto_2324810 ?auto_2324812 ?auto_2324813 ?auto_2324814 ?auto_2324815 ?auto_2324816 ?auto_2324817 ?auto_2324818 ?auto_2324819 ?auto_2324820 ?auto_2324821 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2324996 - SURFACE
      ?auto_2324997 - SURFACE
      ?auto_2324998 - SURFACE
      ?auto_2325000 - SURFACE
      ?auto_2324999 - SURFACE
      ?auto_2325001 - SURFACE
      ?auto_2325002 - SURFACE
      ?auto_2325003 - SURFACE
      ?auto_2325004 - SURFACE
      ?auto_2325005 - SURFACE
      ?auto_2325006 - SURFACE
      ?auto_2325007 - SURFACE
      ?auto_2325008 - SURFACE
      ?auto_2325009 - SURFACE
      ?auto_2325010 - SURFACE
    )
    :vars
    (
      ?auto_2325013 - HOIST
      ?auto_2325015 - PLACE
      ?auto_2325011 - TRUCK
      ?auto_2325014 - PLACE
      ?auto_2325012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2325013 ?auto_2325015 ) ( SURFACE-AT ?auto_2325009 ?auto_2325015 ) ( CLEAR ?auto_2325009 ) ( IS-CRATE ?auto_2325010 ) ( not ( = ?auto_2325009 ?auto_2325010 ) ) ( AVAILABLE ?auto_2325013 ) ( ON ?auto_2325009 ?auto_2325008 ) ( not ( = ?auto_2325008 ?auto_2325009 ) ) ( not ( = ?auto_2325008 ?auto_2325010 ) ) ( TRUCK-AT ?auto_2325011 ?auto_2325014 ) ( not ( = ?auto_2325014 ?auto_2325015 ) ) ( HOIST-AT ?auto_2325012 ?auto_2325014 ) ( LIFTING ?auto_2325012 ?auto_2325010 ) ( not ( = ?auto_2325013 ?auto_2325012 ) ) ( ON ?auto_2324997 ?auto_2324996 ) ( ON ?auto_2324998 ?auto_2324997 ) ( ON ?auto_2325000 ?auto_2324998 ) ( ON ?auto_2324999 ?auto_2325000 ) ( ON ?auto_2325001 ?auto_2324999 ) ( ON ?auto_2325002 ?auto_2325001 ) ( ON ?auto_2325003 ?auto_2325002 ) ( ON ?auto_2325004 ?auto_2325003 ) ( ON ?auto_2325005 ?auto_2325004 ) ( ON ?auto_2325006 ?auto_2325005 ) ( ON ?auto_2325007 ?auto_2325006 ) ( ON ?auto_2325008 ?auto_2325007 ) ( not ( = ?auto_2324996 ?auto_2324997 ) ) ( not ( = ?auto_2324996 ?auto_2324998 ) ) ( not ( = ?auto_2324996 ?auto_2325000 ) ) ( not ( = ?auto_2324996 ?auto_2324999 ) ) ( not ( = ?auto_2324996 ?auto_2325001 ) ) ( not ( = ?auto_2324996 ?auto_2325002 ) ) ( not ( = ?auto_2324996 ?auto_2325003 ) ) ( not ( = ?auto_2324996 ?auto_2325004 ) ) ( not ( = ?auto_2324996 ?auto_2325005 ) ) ( not ( = ?auto_2324996 ?auto_2325006 ) ) ( not ( = ?auto_2324996 ?auto_2325007 ) ) ( not ( = ?auto_2324996 ?auto_2325008 ) ) ( not ( = ?auto_2324996 ?auto_2325009 ) ) ( not ( = ?auto_2324996 ?auto_2325010 ) ) ( not ( = ?auto_2324997 ?auto_2324998 ) ) ( not ( = ?auto_2324997 ?auto_2325000 ) ) ( not ( = ?auto_2324997 ?auto_2324999 ) ) ( not ( = ?auto_2324997 ?auto_2325001 ) ) ( not ( = ?auto_2324997 ?auto_2325002 ) ) ( not ( = ?auto_2324997 ?auto_2325003 ) ) ( not ( = ?auto_2324997 ?auto_2325004 ) ) ( not ( = ?auto_2324997 ?auto_2325005 ) ) ( not ( = ?auto_2324997 ?auto_2325006 ) ) ( not ( = ?auto_2324997 ?auto_2325007 ) ) ( not ( = ?auto_2324997 ?auto_2325008 ) ) ( not ( = ?auto_2324997 ?auto_2325009 ) ) ( not ( = ?auto_2324997 ?auto_2325010 ) ) ( not ( = ?auto_2324998 ?auto_2325000 ) ) ( not ( = ?auto_2324998 ?auto_2324999 ) ) ( not ( = ?auto_2324998 ?auto_2325001 ) ) ( not ( = ?auto_2324998 ?auto_2325002 ) ) ( not ( = ?auto_2324998 ?auto_2325003 ) ) ( not ( = ?auto_2324998 ?auto_2325004 ) ) ( not ( = ?auto_2324998 ?auto_2325005 ) ) ( not ( = ?auto_2324998 ?auto_2325006 ) ) ( not ( = ?auto_2324998 ?auto_2325007 ) ) ( not ( = ?auto_2324998 ?auto_2325008 ) ) ( not ( = ?auto_2324998 ?auto_2325009 ) ) ( not ( = ?auto_2324998 ?auto_2325010 ) ) ( not ( = ?auto_2325000 ?auto_2324999 ) ) ( not ( = ?auto_2325000 ?auto_2325001 ) ) ( not ( = ?auto_2325000 ?auto_2325002 ) ) ( not ( = ?auto_2325000 ?auto_2325003 ) ) ( not ( = ?auto_2325000 ?auto_2325004 ) ) ( not ( = ?auto_2325000 ?auto_2325005 ) ) ( not ( = ?auto_2325000 ?auto_2325006 ) ) ( not ( = ?auto_2325000 ?auto_2325007 ) ) ( not ( = ?auto_2325000 ?auto_2325008 ) ) ( not ( = ?auto_2325000 ?auto_2325009 ) ) ( not ( = ?auto_2325000 ?auto_2325010 ) ) ( not ( = ?auto_2324999 ?auto_2325001 ) ) ( not ( = ?auto_2324999 ?auto_2325002 ) ) ( not ( = ?auto_2324999 ?auto_2325003 ) ) ( not ( = ?auto_2324999 ?auto_2325004 ) ) ( not ( = ?auto_2324999 ?auto_2325005 ) ) ( not ( = ?auto_2324999 ?auto_2325006 ) ) ( not ( = ?auto_2324999 ?auto_2325007 ) ) ( not ( = ?auto_2324999 ?auto_2325008 ) ) ( not ( = ?auto_2324999 ?auto_2325009 ) ) ( not ( = ?auto_2324999 ?auto_2325010 ) ) ( not ( = ?auto_2325001 ?auto_2325002 ) ) ( not ( = ?auto_2325001 ?auto_2325003 ) ) ( not ( = ?auto_2325001 ?auto_2325004 ) ) ( not ( = ?auto_2325001 ?auto_2325005 ) ) ( not ( = ?auto_2325001 ?auto_2325006 ) ) ( not ( = ?auto_2325001 ?auto_2325007 ) ) ( not ( = ?auto_2325001 ?auto_2325008 ) ) ( not ( = ?auto_2325001 ?auto_2325009 ) ) ( not ( = ?auto_2325001 ?auto_2325010 ) ) ( not ( = ?auto_2325002 ?auto_2325003 ) ) ( not ( = ?auto_2325002 ?auto_2325004 ) ) ( not ( = ?auto_2325002 ?auto_2325005 ) ) ( not ( = ?auto_2325002 ?auto_2325006 ) ) ( not ( = ?auto_2325002 ?auto_2325007 ) ) ( not ( = ?auto_2325002 ?auto_2325008 ) ) ( not ( = ?auto_2325002 ?auto_2325009 ) ) ( not ( = ?auto_2325002 ?auto_2325010 ) ) ( not ( = ?auto_2325003 ?auto_2325004 ) ) ( not ( = ?auto_2325003 ?auto_2325005 ) ) ( not ( = ?auto_2325003 ?auto_2325006 ) ) ( not ( = ?auto_2325003 ?auto_2325007 ) ) ( not ( = ?auto_2325003 ?auto_2325008 ) ) ( not ( = ?auto_2325003 ?auto_2325009 ) ) ( not ( = ?auto_2325003 ?auto_2325010 ) ) ( not ( = ?auto_2325004 ?auto_2325005 ) ) ( not ( = ?auto_2325004 ?auto_2325006 ) ) ( not ( = ?auto_2325004 ?auto_2325007 ) ) ( not ( = ?auto_2325004 ?auto_2325008 ) ) ( not ( = ?auto_2325004 ?auto_2325009 ) ) ( not ( = ?auto_2325004 ?auto_2325010 ) ) ( not ( = ?auto_2325005 ?auto_2325006 ) ) ( not ( = ?auto_2325005 ?auto_2325007 ) ) ( not ( = ?auto_2325005 ?auto_2325008 ) ) ( not ( = ?auto_2325005 ?auto_2325009 ) ) ( not ( = ?auto_2325005 ?auto_2325010 ) ) ( not ( = ?auto_2325006 ?auto_2325007 ) ) ( not ( = ?auto_2325006 ?auto_2325008 ) ) ( not ( = ?auto_2325006 ?auto_2325009 ) ) ( not ( = ?auto_2325006 ?auto_2325010 ) ) ( not ( = ?auto_2325007 ?auto_2325008 ) ) ( not ( = ?auto_2325007 ?auto_2325009 ) ) ( not ( = ?auto_2325007 ?auto_2325010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2325008 ?auto_2325009 ?auto_2325010 )
      ( MAKE-14CRATE-VERIFY ?auto_2324996 ?auto_2324997 ?auto_2324998 ?auto_2325000 ?auto_2324999 ?auto_2325001 ?auto_2325002 ?auto_2325003 ?auto_2325004 ?auto_2325005 ?auto_2325006 ?auto_2325007 ?auto_2325008 ?auto_2325009 ?auto_2325010 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2325199 - SURFACE
      ?auto_2325200 - SURFACE
      ?auto_2325201 - SURFACE
      ?auto_2325203 - SURFACE
      ?auto_2325202 - SURFACE
      ?auto_2325204 - SURFACE
      ?auto_2325205 - SURFACE
      ?auto_2325206 - SURFACE
      ?auto_2325207 - SURFACE
      ?auto_2325208 - SURFACE
      ?auto_2325209 - SURFACE
      ?auto_2325210 - SURFACE
      ?auto_2325211 - SURFACE
      ?auto_2325212 - SURFACE
      ?auto_2325213 - SURFACE
    )
    :vars
    (
      ?auto_2325216 - HOIST
      ?auto_2325219 - PLACE
      ?auto_2325215 - TRUCK
      ?auto_2325217 - PLACE
      ?auto_2325218 - HOIST
      ?auto_2325214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2325216 ?auto_2325219 ) ( SURFACE-AT ?auto_2325212 ?auto_2325219 ) ( CLEAR ?auto_2325212 ) ( IS-CRATE ?auto_2325213 ) ( not ( = ?auto_2325212 ?auto_2325213 ) ) ( AVAILABLE ?auto_2325216 ) ( ON ?auto_2325212 ?auto_2325211 ) ( not ( = ?auto_2325211 ?auto_2325212 ) ) ( not ( = ?auto_2325211 ?auto_2325213 ) ) ( TRUCK-AT ?auto_2325215 ?auto_2325217 ) ( not ( = ?auto_2325217 ?auto_2325219 ) ) ( HOIST-AT ?auto_2325218 ?auto_2325217 ) ( not ( = ?auto_2325216 ?auto_2325218 ) ) ( AVAILABLE ?auto_2325218 ) ( SURFACE-AT ?auto_2325213 ?auto_2325217 ) ( ON ?auto_2325213 ?auto_2325214 ) ( CLEAR ?auto_2325213 ) ( not ( = ?auto_2325212 ?auto_2325214 ) ) ( not ( = ?auto_2325213 ?auto_2325214 ) ) ( not ( = ?auto_2325211 ?auto_2325214 ) ) ( ON ?auto_2325200 ?auto_2325199 ) ( ON ?auto_2325201 ?auto_2325200 ) ( ON ?auto_2325203 ?auto_2325201 ) ( ON ?auto_2325202 ?auto_2325203 ) ( ON ?auto_2325204 ?auto_2325202 ) ( ON ?auto_2325205 ?auto_2325204 ) ( ON ?auto_2325206 ?auto_2325205 ) ( ON ?auto_2325207 ?auto_2325206 ) ( ON ?auto_2325208 ?auto_2325207 ) ( ON ?auto_2325209 ?auto_2325208 ) ( ON ?auto_2325210 ?auto_2325209 ) ( ON ?auto_2325211 ?auto_2325210 ) ( not ( = ?auto_2325199 ?auto_2325200 ) ) ( not ( = ?auto_2325199 ?auto_2325201 ) ) ( not ( = ?auto_2325199 ?auto_2325203 ) ) ( not ( = ?auto_2325199 ?auto_2325202 ) ) ( not ( = ?auto_2325199 ?auto_2325204 ) ) ( not ( = ?auto_2325199 ?auto_2325205 ) ) ( not ( = ?auto_2325199 ?auto_2325206 ) ) ( not ( = ?auto_2325199 ?auto_2325207 ) ) ( not ( = ?auto_2325199 ?auto_2325208 ) ) ( not ( = ?auto_2325199 ?auto_2325209 ) ) ( not ( = ?auto_2325199 ?auto_2325210 ) ) ( not ( = ?auto_2325199 ?auto_2325211 ) ) ( not ( = ?auto_2325199 ?auto_2325212 ) ) ( not ( = ?auto_2325199 ?auto_2325213 ) ) ( not ( = ?auto_2325199 ?auto_2325214 ) ) ( not ( = ?auto_2325200 ?auto_2325201 ) ) ( not ( = ?auto_2325200 ?auto_2325203 ) ) ( not ( = ?auto_2325200 ?auto_2325202 ) ) ( not ( = ?auto_2325200 ?auto_2325204 ) ) ( not ( = ?auto_2325200 ?auto_2325205 ) ) ( not ( = ?auto_2325200 ?auto_2325206 ) ) ( not ( = ?auto_2325200 ?auto_2325207 ) ) ( not ( = ?auto_2325200 ?auto_2325208 ) ) ( not ( = ?auto_2325200 ?auto_2325209 ) ) ( not ( = ?auto_2325200 ?auto_2325210 ) ) ( not ( = ?auto_2325200 ?auto_2325211 ) ) ( not ( = ?auto_2325200 ?auto_2325212 ) ) ( not ( = ?auto_2325200 ?auto_2325213 ) ) ( not ( = ?auto_2325200 ?auto_2325214 ) ) ( not ( = ?auto_2325201 ?auto_2325203 ) ) ( not ( = ?auto_2325201 ?auto_2325202 ) ) ( not ( = ?auto_2325201 ?auto_2325204 ) ) ( not ( = ?auto_2325201 ?auto_2325205 ) ) ( not ( = ?auto_2325201 ?auto_2325206 ) ) ( not ( = ?auto_2325201 ?auto_2325207 ) ) ( not ( = ?auto_2325201 ?auto_2325208 ) ) ( not ( = ?auto_2325201 ?auto_2325209 ) ) ( not ( = ?auto_2325201 ?auto_2325210 ) ) ( not ( = ?auto_2325201 ?auto_2325211 ) ) ( not ( = ?auto_2325201 ?auto_2325212 ) ) ( not ( = ?auto_2325201 ?auto_2325213 ) ) ( not ( = ?auto_2325201 ?auto_2325214 ) ) ( not ( = ?auto_2325203 ?auto_2325202 ) ) ( not ( = ?auto_2325203 ?auto_2325204 ) ) ( not ( = ?auto_2325203 ?auto_2325205 ) ) ( not ( = ?auto_2325203 ?auto_2325206 ) ) ( not ( = ?auto_2325203 ?auto_2325207 ) ) ( not ( = ?auto_2325203 ?auto_2325208 ) ) ( not ( = ?auto_2325203 ?auto_2325209 ) ) ( not ( = ?auto_2325203 ?auto_2325210 ) ) ( not ( = ?auto_2325203 ?auto_2325211 ) ) ( not ( = ?auto_2325203 ?auto_2325212 ) ) ( not ( = ?auto_2325203 ?auto_2325213 ) ) ( not ( = ?auto_2325203 ?auto_2325214 ) ) ( not ( = ?auto_2325202 ?auto_2325204 ) ) ( not ( = ?auto_2325202 ?auto_2325205 ) ) ( not ( = ?auto_2325202 ?auto_2325206 ) ) ( not ( = ?auto_2325202 ?auto_2325207 ) ) ( not ( = ?auto_2325202 ?auto_2325208 ) ) ( not ( = ?auto_2325202 ?auto_2325209 ) ) ( not ( = ?auto_2325202 ?auto_2325210 ) ) ( not ( = ?auto_2325202 ?auto_2325211 ) ) ( not ( = ?auto_2325202 ?auto_2325212 ) ) ( not ( = ?auto_2325202 ?auto_2325213 ) ) ( not ( = ?auto_2325202 ?auto_2325214 ) ) ( not ( = ?auto_2325204 ?auto_2325205 ) ) ( not ( = ?auto_2325204 ?auto_2325206 ) ) ( not ( = ?auto_2325204 ?auto_2325207 ) ) ( not ( = ?auto_2325204 ?auto_2325208 ) ) ( not ( = ?auto_2325204 ?auto_2325209 ) ) ( not ( = ?auto_2325204 ?auto_2325210 ) ) ( not ( = ?auto_2325204 ?auto_2325211 ) ) ( not ( = ?auto_2325204 ?auto_2325212 ) ) ( not ( = ?auto_2325204 ?auto_2325213 ) ) ( not ( = ?auto_2325204 ?auto_2325214 ) ) ( not ( = ?auto_2325205 ?auto_2325206 ) ) ( not ( = ?auto_2325205 ?auto_2325207 ) ) ( not ( = ?auto_2325205 ?auto_2325208 ) ) ( not ( = ?auto_2325205 ?auto_2325209 ) ) ( not ( = ?auto_2325205 ?auto_2325210 ) ) ( not ( = ?auto_2325205 ?auto_2325211 ) ) ( not ( = ?auto_2325205 ?auto_2325212 ) ) ( not ( = ?auto_2325205 ?auto_2325213 ) ) ( not ( = ?auto_2325205 ?auto_2325214 ) ) ( not ( = ?auto_2325206 ?auto_2325207 ) ) ( not ( = ?auto_2325206 ?auto_2325208 ) ) ( not ( = ?auto_2325206 ?auto_2325209 ) ) ( not ( = ?auto_2325206 ?auto_2325210 ) ) ( not ( = ?auto_2325206 ?auto_2325211 ) ) ( not ( = ?auto_2325206 ?auto_2325212 ) ) ( not ( = ?auto_2325206 ?auto_2325213 ) ) ( not ( = ?auto_2325206 ?auto_2325214 ) ) ( not ( = ?auto_2325207 ?auto_2325208 ) ) ( not ( = ?auto_2325207 ?auto_2325209 ) ) ( not ( = ?auto_2325207 ?auto_2325210 ) ) ( not ( = ?auto_2325207 ?auto_2325211 ) ) ( not ( = ?auto_2325207 ?auto_2325212 ) ) ( not ( = ?auto_2325207 ?auto_2325213 ) ) ( not ( = ?auto_2325207 ?auto_2325214 ) ) ( not ( = ?auto_2325208 ?auto_2325209 ) ) ( not ( = ?auto_2325208 ?auto_2325210 ) ) ( not ( = ?auto_2325208 ?auto_2325211 ) ) ( not ( = ?auto_2325208 ?auto_2325212 ) ) ( not ( = ?auto_2325208 ?auto_2325213 ) ) ( not ( = ?auto_2325208 ?auto_2325214 ) ) ( not ( = ?auto_2325209 ?auto_2325210 ) ) ( not ( = ?auto_2325209 ?auto_2325211 ) ) ( not ( = ?auto_2325209 ?auto_2325212 ) ) ( not ( = ?auto_2325209 ?auto_2325213 ) ) ( not ( = ?auto_2325209 ?auto_2325214 ) ) ( not ( = ?auto_2325210 ?auto_2325211 ) ) ( not ( = ?auto_2325210 ?auto_2325212 ) ) ( not ( = ?auto_2325210 ?auto_2325213 ) ) ( not ( = ?auto_2325210 ?auto_2325214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2325211 ?auto_2325212 ?auto_2325213 )
      ( MAKE-14CRATE-VERIFY ?auto_2325199 ?auto_2325200 ?auto_2325201 ?auto_2325203 ?auto_2325202 ?auto_2325204 ?auto_2325205 ?auto_2325206 ?auto_2325207 ?auto_2325208 ?auto_2325209 ?auto_2325210 ?auto_2325211 ?auto_2325212 ?auto_2325213 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2325403 - SURFACE
      ?auto_2325404 - SURFACE
      ?auto_2325405 - SURFACE
      ?auto_2325407 - SURFACE
      ?auto_2325406 - SURFACE
      ?auto_2325408 - SURFACE
      ?auto_2325409 - SURFACE
      ?auto_2325410 - SURFACE
      ?auto_2325411 - SURFACE
      ?auto_2325412 - SURFACE
      ?auto_2325413 - SURFACE
      ?auto_2325414 - SURFACE
      ?auto_2325415 - SURFACE
      ?auto_2325416 - SURFACE
      ?auto_2325417 - SURFACE
    )
    :vars
    (
      ?auto_2325421 - HOIST
      ?auto_2325423 - PLACE
      ?auto_2325419 - PLACE
      ?auto_2325422 - HOIST
      ?auto_2325420 - SURFACE
      ?auto_2325418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2325421 ?auto_2325423 ) ( SURFACE-AT ?auto_2325416 ?auto_2325423 ) ( CLEAR ?auto_2325416 ) ( IS-CRATE ?auto_2325417 ) ( not ( = ?auto_2325416 ?auto_2325417 ) ) ( AVAILABLE ?auto_2325421 ) ( ON ?auto_2325416 ?auto_2325415 ) ( not ( = ?auto_2325415 ?auto_2325416 ) ) ( not ( = ?auto_2325415 ?auto_2325417 ) ) ( not ( = ?auto_2325419 ?auto_2325423 ) ) ( HOIST-AT ?auto_2325422 ?auto_2325419 ) ( not ( = ?auto_2325421 ?auto_2325422 ) ) ( AVAILABLE ?auto_2325422 ) ( SURFACE-AT ?auto_2325417 ?auto_2325419 ) ( ON ?auto_2325417 ?auto_2325420 ) ( CLEAR ?auto_2325417 ) ( not ( = ?auto_2325416 ?auto_2325420 ) ) ( not ( = ?auto_2325417 ?auto_2325420 ) ) ( not ( = ?auto_2325415 ?auto_2325420 ) ) ( TRUCK-AT ?auto_2325418 ?auto_2325423 ) ( ON ?auto_2325404 ?auto_2325403 ) ( ON ?auto_2325405 ?auto_2325404 ) ( ON ?auto_2325407 ?auto_2325405 ) ( ON ?auto_2325406 ?auto_2325407 ) ( ON ?auto_2325408 ?auto_2325406 ) ( ON ?auto_2325409 ?auto_2325408 ) ( ON ?auto_2325410 ?auto_2325409 ) ( ON ?auto_2325411 ?auto_2325410 ) ( ON ?auto_2325412 ?auto_2325411 ) ( ON ?auto_2325413 ?auto_2325412 ) ( ON ?auto_2325414 ?auto_2325413 ) ( ON ?auto_2325415 ?auto_2325414 ) ( not ( = ?auto_2325403 ?auto_2325404 ) ) ( not ( = ?auto_2325403 ?auto_2325405 ) ) ( not ( = ?auto_2325403 ?auto_2325407 ) ) ( not ( = ?auto_2325403 ?auto_2325406 ) ) ( not ( = ?auto_2325403 ?auto_2325408 ) ) ( not ( = ?auto_2325403 ?auto_2325409 ) ) ( not ( = ?auto_2325403 ?auto_2325410 ) ) ( not ( = ?auto_2325403 ?auto_2325411 ) ) ( not ( = ?auto_2325403 ?auto_2325412 ) ) ( not ( = ?auto_2325403 ?auto_2325413 ) ) ( not ( = ?auto_2325403 ?auto_2325414 ) ) ( not ( = ?auto_2325403 ?auto_2325415 ) ) ( not ( = ?auto_2325403 ?auto_2325416 ) ) ( not ( = ?auto_2325403 ?auto_2325417 ) ) ( not ( = ?auto_2325403 ?auto_2325420 ) ) ( not ( = ?auto_2325404 ?auto_2325405 ) ) ( not ( = ?auto_2325404 ?auto_2325407 ) ) ( not ( = ?auto_2325404 ?auto_2325406 ) ) ( not ( = ?auto_2325404 ?auto_2325408 ) ) ( not ( = ?auto_2325404 ?auto_2325409 ) ) ( not ( = ?auto_2325404 ?auto_2325410 ) ) ( not ( = ?auto_2325404 ?auto_2325411 ) ) ( not ( = ?auto_2325404 ?auto_2325412 ) ) ( not ( = ?auto_2325404 ?auto_2325413 ) ) ( not ( = ?auto_2325404 ?auto_2325414 ) ) ( not ( = ?auto_2325404 ?auto_2325415 ) ) ( not ( = ?auto_2325404 ?auto_2325416 ) ) ( not ( = ?auto_2325404 ?auto_2325417 ) ) ( not ( = ?auto_2325404 ?auto_2325420 ) ) ( not ( = ?auto_2325405 ?auto_2325407 ) ) ( not ( = ?auto_2325405 ?auto_2325406 ) ) ( not ( = ?auto_2325405 ?auto_2325408 ) ) ( not ( = ?auto_2325405 ?auto_2325409 ) ) ( not ( = ?auto_2325405 ?auto_2325410 ) ) ( not ( = ?auto_2325405 ?auto_2325411 ) ) ( not ( = ?auto_2325405 ?auto_2325412 ) ) ( not ( = ?auto_2325405 ?auto_2325413 ) ) ( not ( = ?auto_2325405 ?auto_2325414 ) ) ( not ( = ?auto_2325405 ?auto_2325415 ) ) ( not ( = ?auto_2325405 ?auto_2325416 ) ) ( not ( = ?auto_2325405 ?auto_2325417 ) ) ( not ( = ?auto_2325405 ?auto_2325420 ) ) ( not ( = ?auto_2325407 ?auto_2325406 ) ) ( not ( = ?auto_2325407 ?auto_2325408 ) ) ( not ( = ?auto_2325407 ?auto_2325409 ) ) ( not ( = ?auto_2325407 ?auto_2325410 ) ) ( not ( = ?auto_2325407 ?auto_2325411 ) ) ( not ( = ?auto_2325407 ?auto_2325412 ) ) ( not ( = ?auto_2325407 ?auto_2325413 ) ) ( not ( = ?auto_2325407 ?auto_2325414 ) ) ( not ( = ?auto_2325407 ?auto_2325415 ) ) ( not ( = ?auto_2325407 ?auto_2325416 ) ) ( not ( = ?auto_2325407 ?auto_2325417 ) ) ( not ( = ?auto_2325407 ?auto_2325420 ) ) ( not ( = ?auto_2325406 ?auto_2325408 ) ) ( not ( = ?auto_2325406 ?auto_2325409 ) ) ( not ( = ?auto_2325406 ?auto_2325410 ) ) ( not ( = ?auto_2325406 ?auto_2325411 ) ) ( not ( = ?auto_2325406 ?auto_2325412 ) ) ( not ( = ?auto_2325406 ?auto_2325413 ) ) ( not ( = ?auto_2325406 ?auto_2325414 ) ) ( not ( = ?auto_2325406 ?auto_2325415 ) ) ( not ( = ?auto_2325406 ?auto_2325416 ) ) ( not ( = ?auto_2325406 ?auto_2325417 ) ) ( not ( = ?auto_2325406 ?auto_2325420 ) ) ( not ( = ?auto_2325408 ?auto_2325409 ) ) ( not ( = ?auto_2325408 ?auto_2325410 ) ) ( not ( = ?auto_2325408 ?auto_2325411 ) ) ( not ( = ?auto_2325408 ?auto_2325412 ) ) ( not ( = ?auto_2325408 ?auto_2325413 ) ) ( not ( = ?auto_2325408 ?auto_2325414 ) ) ( not ( = ?auto_2325408 ?auto_2325415 ) ) ( not ( = ?auto_2325408 ?auto_2325416 ) ) ( not ( = ?auto_2325408 ?auto_2325417 ) ) ( not ( = ?auto_2325408 ?auto_2325420 ) ) ( not ( = ?auto_2325409 ?auto_2325410 ) ) ( not ( = ?auto_2325409 ?auto_2325411 ) ) ( not ( = ?auto_2325409 ?auto_2325412 ) ) ( not ( = ?auto_2325409 ?auto_2325413 ) ) ( not ( = ?auto_2325409 ?auto_2325414 ) ) ( not ( = ?auto_2325409 ?auto_2325415 ) ) ( not ( = ?auto_2325409 ?auto_2325416 ) ) ( not ( = ?auto_2325409 ?auto_2325417 ) ) ( not ( = ?auto_2325409 ?auto_2325420 ) ) ( not ( = ?auto_2325410 ?auto_2325411 ) ) ( not ( = ?auto_2325410 ?auto_2325412 ) ) ( not ( = ?auto_2325410 ?auto_2325413 ) ) ( not ( = ?auto_2325410 ?auto_2325414 ) ) ( not ( = ?auto_2325410 ?auto_2325415 ) ) ( not ( = ?auto_2325410 ?auto_2325416 ) ) ( not ( = ?auto_2325410 ?auto_2325417 ) ) ( not ( = ?auto_2325410 ?auto_2325420 ) ) ( not ( = ?auto_2325411 ?auto_2325412 ) ) ( not ( = ?auto_2325411 ?auto_2325413 ) ) ( not ( = ?auto_2325411 ?auto_2325414 ) ) ( not ( = ?auto_2325411 ?auto_2325415 ) ) ( not ( = ?auto_2325411 ?auto_2325416 ) ) ( not ( = ?auto_2325411 ?auto_2325417 ) ) ( not ( = ?auto_2325411 ?auto_2325420 ) ) ( not ( = ?auto_2325412 ?auto_2325413 ) ) ( not ( = ?auto_2325412 ?auto_2325414 ) ) ( not ( = ?auto_2325412 ?auto_2325415 ) ) ( not ( = ?auto_2325412 ?auto_2325416 ) ) ( not ( = ?auto_2325412 ?auto_2325417 ) ) ( not ( = ?auto_2325412 ?auto_2325420 ) ) ( not ( = ?auto_2325413 ?auto_2325414 ) ) ( not ( = ?auto_2325413 ?auto_2325415 ) ) ( not ( = ?auto_2325413 ?auto_2325416 ) ) ( not ( = ?auto_2325413 ?auto_2325417 ) ) ( not ( = ?auto_2325413 ?auto_2325420 ) ) ( not ( = ?auto_2325414 ?auto_2325415 ) ) ( not ( = ?auto_2325414 ?auto_2325416 ) ) ( not ( = ?auto_2325414 ?auto_2325417 ) ) ( not ( = ?auto_2325414 ?auto_2325420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2325415 ?auto_2325416 ?auto_2325417 )
      ( MAKE-14CRATE-VERIFY ?auto_2325403 ?auto_2325404 ?auto_2325405 ?auto_2325407 ?auto_2325406 ?auto_2325408 ?auto_2325409 ?auto_2325410 ?auto_2325411 ?auto_2325412 ?auto_2325413 ?auto_2325414 ?auto_2325415 ?auto_2325416 ?auto_2325417 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2325607 - SURFACE
      ?auto_2325608 - SURFACE
      ?auto_2325609 - SURFACE
      ?auto_2325611 - SURFACE
      ?auto_2325610 - SURFACE
      ?auto_2325612 - SURFACE
      ?auto_2325613 - SURFACE
      ?auto_2325614 - SURFACE
      ?auto_2325615 - SURFACE
      ?auto_2325616 - SURFACE
      ?auto_2325617 - SURFACE
      ?auto_2325618 - SURFACE
      ?auto_2325619 - SURFACE
      ?auto_2325620 - SURFACE
      ?auto_2325621 - SURFACE
    )
    :vars
    (
      ?auto_2325627 - HOIST
      ?auto_2325622 - PLACE
      ?auto_2325626 - PLACE
      ?auto_2325624 - HOIST
      ?auto_2325623 - SURFACE
      ?auto_2325625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2325627 ?auto_2325622 ) ( IS-CRATE ?auto_2325621 ) ( not ( = ?auto_2325620 ?auto_2325621 ) ) ( not ( = ?auto_2325619 ?auto_2325620 ) ) ( not ( = ?auto_2325619 ?auto_2325621 ) ) ( not ( = ?auto_2325626 ?auto_2325622 ) ) ( HOIST-AT ?auto_2325624 ?auto_2325626 ) ( not ( = ?auto_2325627 ?auto_2325624 ) ) ( AVAILABLE ?auto_2325624 ) ( SURFACE-AT ?auto_2325621 ?auto_2325626 ) ( ON ?auto_2325621 ?auto_2325623 ) ( CLEAR ?auto_2325621 ) ( not ( = ?auto_2325620 ?auto_2325623 ) ) ( not ( = ?auto_2325621 ?auto_2325623 ) ) ( not ( = ?auto_2325619 ?auto_2325623 ) ) ( TRUCK-AT ?auto_2325625 ?auto_2325622 ) ( SURFACE-AT ?auto_2325619 ?auto_2325622 ) ( CLEAR ?auto_2325619 ) ( LIFTING ?auto_2325627 ?auto_2325620 ) ( IS-CRATE ?auto_2325620 ) ( ON ?auto_2325608 ?auto_2325607 ) ( ON ?auto_2325609 ?auto_2325608 ) ( ON ?auto_2325611 ?auto_2325609 ) ( ON ?auto_2325610 ?auto_2325611 ) ( ON ?auto_2325612 ?auto_2325610 ) ( ON ?auto_2325613 ?auto_2325612 ) ( ON ?auto_2325614 ?auto_2325613 ) ( ON ?auto_2325615 ?auto_2325614 ) ( ON ?auto_2325616 ?auto_2325615 ) ( ON ?auto_2325617 ?auto_2325616 ) ( ON ?auto_2325618 ?auto_2325617 ) ( ON ?auto_2325619 ?auto_2325618 ) ( not ( = ?auto_2325607 ?auto_2325608 ) ) ( not ( = ?auto_2325607 ?auto_2325609 ) ) ( not ( = ?auto_2325607 ?auto_2325611 ) ) ( not ( = ?auto_2325607 ?auto_2325610 ) ) ( not ( = ?auto_2325607 ?auto_2325612 ) ) ( not ( = ?auto_2325607 ?auto_2325613 ) ) ( not ( = ?auto_2325607 ?auto_2325614 ) ) ( not ( = ?auto_2325607 ?auto_2325615 ) ) ( not ( = ?auto_2325607 ?auto_2325616 ) ) ( not ( = ?auto_2325607 ?auto_2325617 ) ) ( not ( = ?auto_2325607 ?auto_2325618 ) ) ( not ( = ?auto_2325607 ?auto_2325619 ) ) ( not ( = ?auto_2325607 ?auto_2325620 ) ) ( not ( = ?auto_2325607 ?auto_2325621 ) ) ( not ( = ?auto_2325607 ?auto_2325623 ) ) ( not ( = ?auto_2325608 ?auto_2325609 ) ) ( not ( = ?auto_2325608 ?auto_2325611 ) ) ( not ( = ?auto_2325608 ?auto_2325610 ) ) ( not ( = ?auto_2325608 ?auto_2325612 ) ) ( not ( = ?auto_2325608 ?auto_2325613 ) ) ( not ( = ?auto_2325608 ?auto_2325614 ) ) ( not ( = ?auto_2325608 ?auto_2325615 ) ) ( not ( = ?auto_2325608 ?auto_2325616 ) ) ( not ( = ?auto_2325608 ?auto_2325617 ) ) ( not ( = ?auto_2325608 ?auto_2325618 ) ) ( not ( = ?auto_2325608 ?auto_2325619 ) ) ( not ( = ?auto_2325608 ?auto_2325620 ) ) ( not ( = ?auto_2325608 ?auto_2325621 ) ) ( not ( = ?auto_2325608 ?auto_2325623 ) ) ( not ( = ?auto_2325609 ?auto_2325611 ) ) ( not ( = ?auto_2325609 ?auto_2325610 ) ) ( not ( = ?auto_2325609 ?auto_2325612 ) ) ( not ( = ?auto_2325609 ?auto_2325613 ) ) ( not ( = ?auto_2325609 ?auto_2325614 ) ) ( not ( = ?auto_2325609 ?auto_2325615 ) ) ( not ( = ?auto_2325609 ?auto_2325616 ) ) ( not ( = ?auto_2325609 ?auto_2325617 ) ) ( not ( = ?auto_2325609 ?auto_2325618 ) ) ( not ( = ?auto_2325609 ?auto_2325619 ) ) ( not ( = ?auto_2325609 ?auto_2325620 ) ) ( not ( = ?auto_2325609 ?auto_2325621 ) ) ( not ( = ?auto_2325609 ?auto_2325623 ) ) ( not ( = ?auto_2325611 ?auto_2325610 ) ) ( not ( = ?auto_2325611 ?auto_2325612 ) ) ( not ( = ?auto_2325611 ?auto_2325613 ) ) ( not ( = ?auto_2325611 ?auto_2325614 ) ) ( not ( = ?auto_2325611 ?auto_2325615 ) ) ( not ( = ?auto_2325611 ?auto_2325616 ) ) ( not ( = ?auto_2325611 ?auto_2325617 ) ) ( not ( = ?auto_2325611 ?auto_2325618 ) ) ( not ( = ?auto_2325611 ?auto_2325619 ) ) ( not ( = ?auto_2325611 ?auto_2325620 ) ) ( not ( = ?auto_2325611 ?auto_2325621 ) ) ( not ( = ?auto_2325611 ?auto_2325623 ) ) ( not ( = ?auto_2325610 ?auto_2325612 ) ) ( not ( = ?auto_2325610 ?auto_2325613 ) ) ( not ( = ?auto_2325610 ?auto_2325614 ) ) ( not ( = ?auto_2325610 ?auto_2325615 ) ) ( not ( = ?auto_2325610 ?auto_2325616 ) ) ( not ( = ?auto_2325610 ?auto_2325617 ) ) ( not ( = ?auto_2325610 ?auto_2325618 ) ) ( not ( = ?auto_2325610 ?auto_2325619 ) ) ( not ( = ?auto_2325610 ?auto_2325620 ) ) ( not ( = ?auto_2325610 ?auto_2325621 ) ) ( not ( = ?auto_2325610 ?auto_2325623 ) ) ( not ( = ?auto_2325612 ?auto_2325613 ) ) ( not ( = ?auto_2325612 ?auto_2325614 ) ) ( not ( = ?auto_2325612 ?auto_2325615 ) ) ( not ( = ?auto_2325612 ?auto_2325616 ) ) ( not ( = ?auto_2325612 ?auto_2325617 ) ) ( not ( = ?auto_2325612 ?auto_2325618 ) ) ( not ( = ?auto_2325612 ?auto_2325619 ) ) ( not ( = ?auto_2325612 ?auto_2325620 ) ) ( not ( = ?auto_2325612 ?auto_2325621 ) ) ( not ( = ?auto_2325612 ?auto_2325623 ) ) ( not ( = ?auto_2325613 ?auto_2325614 ) ) ( not ( = ?auto_2325613 ?auto_2325615 ) ) ( not ( = ?auto_2325613 ?auto_2325616 ) ) ( not ( = ?auto_2325613 ?auto_2325617 ) ) ( not ( = ?auto_2325613 ?auto_2325618 ) ) ( not ( = ?auto_2325613 ?auto_2325619 ) ) ( not ( = ?auto_2325613 ?auto_2325620 ) ) ( not ( = ?auto_2325613 ?auto_2325621 ) ) ( not ( = ?auto_2325613 ?auto_2325623 ) ) ( not ( = ?auto_2325614 ?auto_2325615 ) ) ( not ( = ?auto_2325614 ?auto_2325616 ) ) ( not ( = ?auto_2325614 ?auto_2325617 ) ) ( not ( = ?auto_2325614 ?auto_2325618 ) ) ( not ( = ?auto_2325614 ?auto_2325619 ) ) ( not ( = ?auto_2325614 ?auto_2325620 ) ) ( not ( = ?auto_2325614 ?auto_2325621 ) ) ( not ( = ?auto_2325614 ?auto_2325623 ) ) ( not ( = ?auto_2325615 ?auto_2325616 ) ) ( not ( = ?auto_2325615 ?auto_2325617 ) ) ( not ( = ?auto_2325615 ?auto_2325618 ) ) ( not ( = ?auto_2325615 ?auto_2325619 ) ) ( not ( = ?auto_2325615 ?auto_2325620 ) ) ( not ( = ?auto_2325615 ?auto_2325621 ) ) ( not ( = ?auto_2325615 ?auto_2325623 ) ) ( not ( = ?auto_2325616 ?auto_2325617 ) ) ( not ( = ?auto_2325616 ?auto_2325618 ) ) ( not ( = ?auto_2325616 ?auto_2325619 ) ) ( not ( = ?auto_2325616 ?auto_2325620 ) ) ( not ( = ?auto_2325616 ?auto_2325621 ) ) ( not ( = ?auto_2325616 ?auto_2325623 ) ) ( not ( = ?auto_2325617 ?auto_2325618 ) ) ( not ( = ?auto_2325617 ?auto_2325619 ) ) ( not ( = ?auto_2325617 ?auto_2325620 ) ) ( not ( = ?auto_2325617 ?auto_2325621 ) ) ( not ( = ?auto_2325617 ?auto_2325623 ) ) ( not ( = ?auto_2325618 ?auto_2325619 ) ) ( not ( = ?auto_2325618 ?auto_2325620 ) ) ( not ( = ?auto_2325618 ?auto_2325621 ) ) ( not ( = ?auto_2325618 ?auto_2325623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2325619 ?auto_2325620 ?auto_2325621 )
      ( MAKE-14CRATE-VERIFY ?auto_2325607 ?auto_2325608 ?auto_2325609 ?auto_2325611 ?auto_2325610 ?auto_2325612 ?auto_2325613 ?auto_2325614 ?auto_2325615 ?auto_2325616 ?auto_2325617 ?auto_2325618 ?auto_2325619 ?auto_2325620 ?auto_2325621 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2325811 - SURFACE
      ?auto_2325812 - SURFACE
      ?auto_2325813 - SURFACE
      ?auto_2325815 - SURFACE
      ?auto_2325814 - SURFACE
      ?auto_2325816 - SURFACE
      ?auto_2325817 - SURFACE
      ?auto_2325818 - SURFACE
      ?auto_2325819 - SURFACE
      ?auto_2325820 - SURFACE
      ?auto_2325821 - SURFACE
      ?auto_2325822 - SURFACE
      ?auto_2325823 - SURFACE
      ?auto_2325824 - SURFACE
      ?auto_2325825 - SURFACE
    )
    :vars
    (
      ?auto_2325827 - HOIST
      ?auto_2325831 - PLACE
      ?auto_2325830 - PLACE
      ?auto_2325826 - HOIST
      ?auto_2325828 - SURFACE
      ?auto_2325829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2325827 ?auto_2325831 ) ( IS-CRATE ?auto_2325825 ) ( not ( = ?auto_2325824 ?auto_2325825 ) ) ( not ( = ?auto_2325823 ?auto_2325824 ) ) ( not ( = ?auto_2325823 ?auto_2325825 ) ) ( not ( = ?auto_2325830 ?auto_2325831 ) ) ( HOIST-AT ?auto_2325826 ?auto_2325830 ) ( not ( = ?auto_2325827 ?auto_2325826 ) ) ( AVAILABLE ?auto_2325826 ) ( SURFACE-AT ?auto_2325825 ?auto_2325830 ) ( ON ?auto_2325825 ?auto_2325828 ) ( CLEAR ?auto_2325825 ) ( not ( = ?auto_2325824 ?auto_2325828 ) ) ( not ( = ?auto_2325825 ?auto_2325828 ) ) ( not ( = ?auto_2325823 ?auto_2325828 ) ) ( TRUCK-AT ?auto_2325829 ?auto_2325831 ) ( SURFACE-AT ?auto_2325823 ?auto_2325831 ) ( CLEAR ?auto_2325823 ) ( IS-CRATE ?auto_2325824 ) ( AVAILABLE ?auto_2325827 ) ( IN ?auto_2325824 ?auto_2325829 ) ( ON ?auto_2325812 ?auto_2325811 ) ( ON ?auto_2325813 ?auto_2325812 ) ( ON ?auto_2325815 ?auto_2325813 ) ( ON ?auto_2325814 ?auto_2325815 ) ( ON ?auto_2325816 ?auto_2325814 ) ( ON ?auto_2325817 ?auto_2325816 ) ( ON ?auto_2325818 ?auto_2325817 ) ( ON ?auto_2325819 ?auto_2325818 ) ( ON ?auto_2325820 ?auto_2325819 ) ( ON ?auto_2325821 ?auto_2325820 ) ( ON ?auto_2325822 ?auto_2325821 ) ( ON ?auto_2325823 ?auto_2325822 ) ( not ( = ?auto_2325811 ?auto_2325812 ) ) ( not ( = ?auto_2325811 ?auto_2325813 ) ) ( not ( = ?auto_2325811 ?auto_2325815 ) ) ( not ( = ?auto_2325811 ?auto_2325814 ) ) ( not ( = ?auto_2325811 ?auto_2325816 ) ) ( not ( = ?auto_2325811 ?auto_2325817 ) ) ( not ( = ?auto_2325811 ?auto_2325818 ) ) ( not ( = ?auto_2325811 ?auto_2325819 ) ) ( not ( = ?auto_2325811 ?auto_2325820 ) ) ( not ( = ?auto_2325811 ?auto_2325821 ) ) ( not ( = ?auto_2325811 ?auto_2325822 ) ) ( not ( = ?auto_2325811 ?auto_2325823 ) ) ( not ( = ?auto_2325811 ?auto_2325824 ) ) ( not ( = ?auto_2325811 ?auto_2325825 ) ) ( not ( = ?auto_2325811 ?auto_2325828 ) ) ( not ( = ?auto_2325812 ?auto_2325813 ) ) ( not ( = ?auto_2325812 ?auto_2325815 ) ) ( not ( = ?auto_2325812 ?auto_2325814 ) ) ( not ( = ?auto_2325812 ?auto_2325816 ) ) ( not ( = ?auto_2325812 ?auto_2325817 ) ) ( not ( = ?auto_2325812 ?auto_2325818 ) ) ( not ( = ?auto_2325812 ?auto_2325819 ) ) ( not ( = ?auto_2325812 ?auto_2325820 ) ) ( not ( = ?auto_2325812 ?auto_2325821 ) ) ( not ( = ?auto_2325812 ?auto_2325822 ) ) ( not ( = ?auto_2325812 ?auto_2325823 ) ) ( not ( = ?auto_2325812 ?auto_2325824 ) ) ( not ( = ?auto_2325812 ?auto_2325825 ) ) ( not ( = ?auto_2325812 ?auto_2325828 ) ) ( not ( = ?auto_2325813 ?auto_2325815 ) ) ( not ( = ?auto_2325813 ?auto_2325814 ) ) ( not ( = ?auto_2325813 ?auto_2325816 ) ) ( not ( = ?auto_2325813 ?auto_2325817 ) ) ( not ( = ?auto_2325813 ?auto_2325818 ) ) ( not ( = ?auto_2325813 ?auto_2325819 ) ) ( not ( = ?auto_2325813 ?auto_2325820 ) ) ( not ( = ?auto_2325813 ?auto_2325821 ) ) ( not ( = ?auto_2325813 ?auto_2325822 ) ) ( not ( = ?auto_2325813 ?auto_2325823 ) ) ( not ( = ?auto_2325813 ?auto_2325824 ) ) ( not ( = ?auto_2325813 ?auto_2325825 ) ) ( not ( = ?auto_2325813 ?auto_2325828 ) ) ( not ( = ?auto_2325815 ?auto_2325814 ) ) ( not ( = ?auto_2325815 ?auto_2325816 ) ) ( not ( = ?auto_2325815 ?auto_2325817 ) ) ( not ( = ?auto_2325815 ?auto_2325818 ) ) ( not ( = ?auto_2325815 ?auto_2325819 ) ) ( not ( = ?auto_2325815 ?auto_2325820 ) ) ( not ( = ?auto_2325815 ?auto_2325821 ) ) ( not ( = ?auto_2325815 ?auto_2325822 ) ) ( not ( = ?auto_2325815 ?auto_2325823 ) ) ( not ( = ?auto_2325815 ?auto_2325824 ) ) ( not ( = ?auto_2325815 ?auto_2325825 ) ) ( not ( = ?auto_2325815 ?auto_2325828 ) ) ( not ( = ?auto_2325814 ?auto_2325816 ) ) ( not ( = ?auto_2325814 ?auto_2325817 ) ) ( not ( = ?auto_2325814 ?auto_2325818 ) ) ( not ( = ?auto_2325814 ?auto_2325819 ) ) ( not ( = ?auto_2325814 ?auto_2325820 ) ) ( not ( = ?auto_2325814 ?auto_2325821 ) ) ( not ( = ?auto_2325814 ?auto_2325822 ) ) ( not ( = ?auto_2325814 ?auto_2325823 ) ) ( not ( = ?auto_2325814 ?auto_2325824 ) ) ( not ( = ?auto_2325814 ?auto_2325825 ) ) ( not ( = ?auto_2325814 ?auto_2325828 ) ) ( not ( = ?auto_2325816 ?auto_2325817 ) ) ( not ( = ?auto_2325816 ?auto_2325818 ) ) ( not ( = ?auto_2325816 ?auto_2325819 ) ) ( not ( = ?auto_2325816 ?auto_2325820 ) ) ( not ( = ?auto_2325816 ?auto_2325821 ) ) ( not ( = ?auto_2325816 ?auto_2325822 ) ) ( not ( = ?auto_2325816 ?auto_2325823 ) ) ( not ( = ?auto_2325816 ?auto_2325824 ) ) ( not ( = ?auto_2325816 ?auto_2325825 ) ) ( not ( = ?auto_2325816 ?auto_2325828 ) ) ( not ( = ?auto_2325817 ?auto_2325818 ) ) ( not ( = ?auto_2325817 ?auto_2325819 ) ) ( not ( = ?auto_2325817 ?auto_2325820 ) ) ( not ( = ?auto_2325817 ?auto_2325821 ) ) ( not ( = ?auto_2325817 ?auto_2325822 ) ) ( not ( = ?auto_2325817 ?auto_2325823 ) ) ( not ( = ?auto_2325817 ?auto_2325824 ) ) ( not ( = ?auto_2325817 ?auto_2325825 ) ) ( not ( = ?auto_2325817 ?auto_2325828 ) ) ( not ( = ?auto_2325818 ?auto_2325819 ) ) ( not ( = ?auto_2325818 ?auto_2325820 ) ) ( not ( = ?auto_2325818 ?auto_2325821 ) ) ( not ( = ?auto_2325818 ?auto_2325822 ) ) ( not ( = ?auto_2325818 ?auto_2325823 ) ) ( not ( = ?auto_2325818 ?auto_2325824 ) ) ( not ( = ?auto_2325818 ?auto_2325825 ) ) ( not ( = ?auto_2325818 ?auto_2325828 ) ) ( not ( = ?auto_2325819 ?auto_2325820 ) ) ( not ( = ?auto_2325819 ?auto_2325821 ) ) ( not ( = ?auto_2325819 ?auto_2325822 ) ) ( not ( = ?auto_2325819 ?auto_2325823 ) ) ( not ( = ?auto_2325819 ?auto_2325824 ) ) ( not ( = ?auto_2325819 ?auto_2325825 ) ) ( not ( = ?auto_2325819 ?auto_2325828 ) ) ( not ( = ?auto_2325820 ?auto_2325821 ) ) ( not ( = ?auto_2325820 ?auto_2325822 ) ) ( not ( = ?auto_2325820 ?auto_2325823 ) ) ( not ( = ?auto_2325820 ?auto_2325824 ) ) ( not ( = ?auto_2325820 ?auto_2325825 ) ) ( not ( = ?auto_2325820 ?auto_2325828 ) ) ( not ( = ?auto_2325821 ?auto_2325822 ) ) ( not ( = ?auto_2325821 ?auto_2325823 ) ) ( not ( = ?auto_2325821 ?auto_2325824 ) ) ( not ( = ?auto_2325821 ?auto_2325825 ) ) ( not ( = ?auto_2325821 ?auto_2325828 ) ) ( not ( = ?auto_2325822 ?auto_2325823 ) ) ( not ( = ?auto_2325822 ?auto_2325824 ) ) ( not ( = ?auto_2325822 ?auto_2325825 ) ) ( not ( = ?auto_2325822 ?auto_2325828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2325823 ?auto_2325824 ?auto_2325825 )
      ( MAKE-14CRATE-VERIFY ?auto_2325811 ?auto_2325812 ?auto_2325813 ?auto_2325815 ?auto_2325814 ?auto_2325816 ?auto_2325817 ?auto_2325818 ?auto_2325819 ?auto_2325820 ?auto_2325821 ?auto_2325822 ?auto_2325823 ?auto_2325824 ?auto_2325825 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2343031 - SURFACE
      ?auto_2343032 - SURFACE
      ?auto_2343033 - SURFACE
      ?auto_2343035 - SURFACE
      ?auto_2343034 - SURFACE
      ?auto_2343036 - SURFACE
      ?auto_2343037 - SURFACE
      ?auto_2343038 - SURFACE
      ?auto_2343039 - SURFACE
      ?auto_2343040 - SURFACE
      ?auto_2343041 - SURFACE
      ?auto_2343042 - SURFACE
      ?auto_2343043 - SURFACE
      ?auto_2343044 - SURFACE
      ?auto_2343045 - SURFACE
      ?auto_2343046 - SURFACE
    )
    :vars
    (
      ?auto_2343048 - HOIST
      ?auto_2343047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2343048 ?auto_2343047 ) ( SURFACE-AT ?auto_2343045 ?auto_2343047 ) ( CLEAR ?auto_2343045 ) ( LIFTING ?auto_2343048 ?auto_2343046 ) ( IS-CRATE ?auto_2343046 ) ( not ( = ?auto_2343045 ?auto_2343046 ) ) ( ON ?auto_2343032 ?auto_2343031 ) ( ON ?auto_2343033 ?auto_2343032 ) ( ON ?auto_2343035 ?auto_2343033 ) ( ON ?auto_2343034 ?auto_2343035 ) ( ON ?auto_2343036 ?auto_2343034 ) ( ON ?auto_2343037 ?auto_2343036 ) ( ON ?auto_2343038 ?auto_2343037 ) ( ON ?auto_2343039 ?auto_2343038 ) ( ON ?auto_2343040 ?auto_2343039 ) ( ON ?auto_2343041 ?auto_2343040 ) ( ON ?auto_2343042 ?auto_2343041 ) ( ON ?auto_2343043 ?auto_2343042 ) ( ON ?auto_2343044 ?auto_2343043 ) ( ON ?auto_2343045 ?auto_2343044 ) ( not ( = ?auto_2343031 ?auto_2343032 ) ) ( not ( = ?auto_2343031 ?auto_2343033 ) ) ( not ( = ?auto_2343031 ?auto_2343035 ) ) ( not ( = ?auto_2343031 ?auto_2343034 ) ) ( not ( = ?auto_2343031 ?auto_2343036 ) ) ( not ( = ?auto_2343031 ?auto_2343037 ) ) ( not ( = ?auto_2343031 ?auto_2343038 ) ) ( not ( = ?auto_2343031 ?auto_2343039 ) ) ( not ( = ?auto_2343031 ?auto_2343040 ) ) ( not ( = ?auto_2343031 ?auto_2343041 ) ) ( not ( = ?auto_2343031 ?auto_2343042 ) ) ( not ( = ?auto_2343031 ?auto_2343043 ) ) ( not ( = ?auto_2343031 ?auto_2343044 ) ) ( not ( = ?auto_2343031 ?auto_2343045 ) ) ( not ( = ?auto_2343031 ?auto_2343046 ) ) ( not ( = ?auto_2343032 ?auto_2343033 ) ) ( not ( = ?auto_2343032 ?auto_2343035 ) ) ( not ( = ?auto_2343032 ?auto_2343034 ) ) ( not ( = ?auto_2343032 ?auto_2343036 ) ) ( not ( = ?auto_2343032 ?auto_2343037 ) ) ( not ( = ?auto_2343032 ?auto_2343038 ) ) ( not ( = ?auto_2343032 ?auto_2343039 ) ) ( not ( = ?auto_2343032 ?auto_2343040 ) ) ( not ( = ?auto_2343032 ?auto_2343041 ) ) ( not ( = ?auto_2343032 ?auto_2343042 ) ) ( not ( = ?auto_2343032 ?auto_2343043 ) ) ( not ( = ?auto_2343032 ?auto_2343044 ) ) ( not ( = ?auto_2343032 ?auto_2343045 ) ) ( not ( = ?auto_2343032 ?auto_2343046 ) ) ( not ( = ?auto_2343033 ?auto_2343035 ) ) ( not ( = ?auto_2343033 ?auto_2343034 ) ) ( not ( = ?auto_2343033 ?auto_2343036 ) ) ( not ( = ?auto_2343033 ?auto_2343037 ) ) ( not ( = ?auto_2343033 ?auto_2343038 ) ) ( not ( = ?auto_2343033 ?auto_2343039 ) ) ( not ( = ?auto_2343033 ?auto_2343040 ) ) ( not ( = ?auto_2343033 ?auto_2343041 ) ) ( not ( = ?auto_2343033 ?auto_2343042 ) ) ( not ( = ?auto_2343033 ?auto_2343043 ) ) ( not ( = ?auto_2343033 ?auto_2343044 ) ) ( not ( = ?auto_2343033 ?auto_2343045 ) ) ( not ( = ?auto_2343033 ?auto_2343046 ) ) ( not ( = ?auto_2343035 ?auto_2343034 ) ) ( not ( = ?auto_2343035 ?auto_2343036 ) ) ( not ( = ?auto_2343035 ?auto_2343037 ) ) ( not ( = ?auto_2343035 ?auto_2343038 ) ) ( not ( = ?auto_2343035 ?auto_2343039 ) ) ( not ( = ?auto_2343035 ?auto_2343040 ) ) ( not ( = ?auto_2343035 ?auto_2343041 ) ) ( not ( = ?auto_2343035 ?auto_2343042 ) ) ( not ( = ?auto_2343035 ?auto_2343043 ) ) ( not ( = ?auto_2343035 ?auto_2343044 ) ) ( not ( = ?auto_2343035 ?auto_2343045 ) ) ( not ( = ?auto_2343035 ?auto_2343046 ) ) ( not ( = ?auto_2343034 ?auto_2343036 ) ) ( not ( = ?auto_2343034 ?auto_2343037 ) ) ( not ( = ?auto_2343034 ?auto_2343038 ) ) ( not ( = ?auto_2343034 ?auto_2343039 ) ) ( not ( = ?auto_2343034 ?auto_2343040 ) ) ( not ( = ?auto_2343034 ?auto_2343041 ) ) ( not ( = ?auto_2343034 ?auto_2343042 ) ) ( not ( = ?auto_2343034 ?auto_2343043 ) ) ( not ( = ?auto_2343034 ?auto_2343044 ) ) ( not ( = ?auto_2343034 ?auto_2343045 ) ) ( not ( = ?auto_2343034 ?auto_2343046 ) ) ( not ( = ?auto_2343036 ?auto_2343037 ) ) ( not ( = ?auto_2343036 ?auto_2343038 ) ) ( not ( = ?auto_2343036 ?auto_2343039 ) ) ( not ( = ?auto_2343036 ?auto_2343040 ) ) ( not ( = ?auto_2343036 ?auto_2343041 ) ) ( not ( = ?auto_2343036 ?auto_2343042 ) ) ( not ( = ?auto_2343036 ?auto_2343043 ) ) ( not ( = ?auto_2343036 ?auto_2343044 ) ) ( not ( = ?auto_2343036 ?auto_2343045 ) ) ( not ( = ?auto_2343036 ?auto_2343046 ) ) ( not ( = ?auto_2343037 ?auto_2343038 ) ) ( not ( = ?auto_2343037 ?auto_2343039 ) ) ( not ( = ?auto_2343037 ?auto_2343040 ) ) ( not ( = ?auto_2343037 ?auto_2343041 ) ) ( not ( = ?auto_2343037 ?auto_2343042 ) ) ( not ( = ?auto_2343037 ?auto_2343043 ) ) ( not ( = ?auto_2343037 ?auto_2343044 ) ) ( not ( = ?auto_2343037 ?auto_2343045 ) ) ( not ( = ?auto_2343037 ?auto_2343046 ) ) ( not ( = ?auto_2343038 ?auto_2343039 ) ) ( not ( = ?auto_2343038 ?auto_2343040 ) ) ( not ( = ?auto_2343038 ?auto_2343041 ) ) ( not ( = ?auto_2343038 ?auto_2343042 ) ) ( not ( = ?auto_2343038 ?auto_2343043 ) ) ( not ( = ?auto_2343038 ?auto_2343044 ) ) ( not ( = ?auto_2343038 ?auto_2343045 ) ) ( not ( = ?auto_2343038 ?auto_2343046 ) ) ( not ( = ?auto_2343039 ?auto_2343040 ) ) ( not ( = ?auto_2343039 ?auto_2343041 ) ) ( not ( = ?auto_2343039 ?auto_2343042 ) ) ( not ( = ?auto_2343039 ?auto_2343043 ) ) ( not ( = ?auto_2343039 ?auto_2343044 ) ) ( not ( = ?auto_2343039 ?auto_2343045 ) ) ( not ( = ?auto_2343039 ?auto_2343046 ) ) ( not ( = ?auto_2343040 ?auto_2343041 ) ) ( not ( = ?auto_2343040 ?auto_2343042 ) ) ( not ( = ?auto_2343040 ?auto_2343043 ) ) ( not ( = ?auto_2343040 ?auto_2343044 ) ) ( not ( = ?auto_2343040 ?auto_2343045 ) ) ( not ( = ?auto_2343040 ?auto_2343046 ) ) ( not ( = ?auto_2343041 ?auto_2343042 ) ) ( not ( = ?auto_2343041 ?auto_2343043 ) ) ( not ( = ?auto_2343041 ?auto_2343044 ) ) ( not ( = ?auto_2343041 ?auto_2343045 ) ) ( not ( = ?auto_2343041 ?auto_2343046 ) ) ( not ( = ?auto_2343042 ?auto_2343043 ) ) ( not ( = ?auto_2343042 ?auto_2343044 ) ) ( not ( = ?auto_2343042 ?auto_2343045 ) ) ( not ( = ?auto_2343042 ?auto_2343046 ) ) ( not ( = ?auto_2343043 ?auto_2343044 ) ) ( not ( = ?auto_2343043 ?auto_2343045 ) ) ( not ( = ?auto_2343043 ?auto_2343046 ) ) ( not ( = ?auto_2343044 ?auto_2343045 ) ) ( not ( = ?auto_2343044 ?auto_2343046 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2343045 ?auto_2343046 )
      ( MAKE-15CRATE-VERIFY ?auto_2343031 ?auto_2343032 ?auto_2343033 ?auto_2343035 ?auto_2343034 ?auto_2343036 ?auto_2343037 ?auto_2343038 ?auto_2343039 ?auto_2343040 ?auto_2343041 ?auto_2343042 ?auto_2343043 ?auto_2343044 ?auto_2343045 ?auto_2343046 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2343210 - SURFACE
      ?auto_2343211 - SURFACE
      ?auto_2343212 - SURFACE
      ?auto_2343214 - SURFACE
      ?auto_2343213 - SURFACE
      ?auto_2343215 - SURFACE
      ?auto_2343216 - SURFACE
      ?auto_2343217 - SURFACE
      ?auto_2343218 - SURFACE
      ?auto_2343219 - SURFACE
      ?auto_2343220 - SURFACE
      ?auto_2343221 - SURFACE
      ?auto_2343222 - SURFACE
      ?auto_2343223 - SURFACE
      ?auto_2343224 - SURFACE
      ?auto_2343225 - SURFACE
    )
    :vars
    (
      ?auto_2343227 - HOIST
      ?auto_2343226 - PLACE
      ?auto_2343228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2343227 ?auto_2343226 ) ( SURFACE-AT ?auto_2343224 ?auto_2343226 ) ( CLEAR ?auto_2343224 ) ( IS-CRATE ?auto_2343225 ) ( not ( = ?auto_2343224 ?auto_2343225 ) ) ( TRUCK-AT ?auto_2343228 ?auto_2343226 ) ( AVAILABLE ?auto_2343227 ) ( IN ?auto_2343225 ?auto_2343228 ) ( ON ?auto_2343224 ?auto_2343223 ) ( not ( = ?auto_2343223 ?auto_2343224 ) ) ( not ( = ?auto_2343223 ?auto_2343225 ) ) ( ON ?auto_2343211 ?auto_2343210 ) ( ON ?auto_2343212 ?auto_2343211 ) ( ON ?auto_2343214 ?auto_2343212 ) ( ON ?auto_2343213 ?auto_2343214 ) ( ON ?auto_2343215 ?auto_2343213 ) ( ON ?auto_2343216 ?auto_2343215 ) ( ON ?auto_2343217 ?auto_2343216 ) ( ON ?auto_2343218 ?auto_2343217 ) ( ON ?auto_2343219 ?auto_2343218 ) ( ON ?auto_2343220 ?auto_2343219 ) ( ON ?auto_2343221 ?auto_2343220 ) ( ON ?auto_2343222 ?auto_2343221 ) ( ON ?auto_2343223 ?auto_2343222 ) ( not ( = ?auto_2343210 ?auto_2343211 ) ) ( not ( = ?auto_2343210 ?auto_2343212 ) ) ( not ( = ?auto_2343210 ?auto_2343214 ) ) ( not ( = ?auto_2343210 ?auto_2343213 ) ) ( not ( = ?auto_2343210 ?auto_2343215 ) ) ( not ( = ?auto_2343210 ?auto_2343216 ) ) ( not ( = ?auto_2343210 ?auto_2343217 ) ) ( not ( = ?auto_2343210 ?auto_2343218 ) ) ( not ( = ?auto_2343210 ?auto_2343219 ) ) ( not ( = ?auto_2343210 ?auto_2343220 ) ) ( not ( = ?auto_2343210 ?auto_2343221 ) ) ( not ( = ?auto_2343210 ?auto_2343222 ) ) ( not ( = ?auto_2343210 ?auto_2343223 ) ) ( not ( = ?auto_2343210 ?auto_2343224 ) ) ( not ( = ?auto_2343210 ?auto_2343225 ) ) ( not ( = ?auto_2343211 ?auto_2343212 ) ) ( not ( = ?auto_2343211 ?auto_2343214 ) ) ( not ( = ?auto_2343211 ?auto_2343213 ) ) ( not ( = ?auto_2343211 ?auto_2343215 ) ) ( not ( = ?auto_2343211 ?auto_2343216 ) ) ( not ( = ?auto_2343211 ?auto_2343217 ) ) ( not ( = ?auto_2343211 ?auto_2343218 ) ) ( not ( = ?auto_2343211 ?auto_2343219 ) ) ( not ( = ?auto_2343211 ?auto_2343220 ) ) ( not ( = ?auto_2343211 ?auto_2343221 ) ) ( not ( = ?auto_2343211 ?auto_2343222 ) ) ( not ( = ?auto_2343211 ?auto_2343223 ) ) ( not ( = ?auto_2343211 ?auto_2343224 ) ) ( not ( = ?auto_2343211 ?auto_2343225 ) ) ( not ( = ?auto_2343212 ?auto_2343214 ) ) ( not ( = ?auto_2343212 ?auto_2343213 ) ) ( not ( = ?auto_2343212 ?auto_2343215 ) ) ( not ( = ?auto_2343212 ?auto_2343216 ) ) ( not ( = ?auto_2343212 ?auto_2343217 ) ) ( not ( = ?auto_2343212 ?auto_2343218 ) ) ( not ( = ?auto_2343212 ?auto_2343219 ) ) ( not ( = ?auto_2343212 ?auto_2343220 ) ) ( not ( = ?auto_2343212 ?auto_2343221 ) ) ( not ( = ?auto_2343212 ?auto_2343222 ) ) ( not ( = ?auto_2343212 ?auto_2343223 ) ) ( not ( = ?auto_2343212 ?auto_2343224 ) ) ( not ( = ?auto_2343212 ?auto_2343225 ) ) ( not ( = ?auto_2343214 ?auto_2343213 ) ) ( not ( = ?auto_2343214 ?auto_2343215 ) ) ( not ( = ?auto_2343214 ?auto_2343216 ) ) ( not ( = ?auto_2343214 ?auto_2343217 ) ) ( not ( = ?auto_2343214 ?auto_2343218 ) ) ( not ( = ?auto_2343214 ?auto_2343219 ) ) ( not ( = ?auto_2343214 ?auto_2343220 ) ) ( not ( = ?auto_2343214 ?auto_2343221 ) ) ( not ( = ?auto_2343214 ?auto_2343222 ) ) ( not ( = ?auto_2343214 ?auto_2343223 ) ) ( not ( = ?auto_2343214 ?auto_2343224 ) ) ( not ( = ?auto_2343214 ?auto_2343225 ) ) ( not ( = ?auto_2343213 ?auto_2343215 ) ) ( not ( = ?auto_2343213 ?auto_2343216 ) ) ( not ( = ?auto_2343213 ?auto_2343217 ) ) ( not ( = ?auto_2343213 ?auto_2343218 ) ) ( not ( = ?auto_2343213 ?auto_2343219 ) ) ( not ( = ?auto_2343213 ?auto_2343220 ) ) ( not ( = ?auto_2343213 ?auto_2343221 ) ) ( not ( = ?auto_2343213 ?auto_2343222 ) ) ( not ( = ?auto_2343213 ?auto_2343223 ) ) ( not ( = ?auto_2343213 ?auto_2343224 ) ) ( not ( = ?auto_2343213 ?auto_2343225 ) ) ( not ( = ?auto_2343215 ?auto_2343216 ) ) ( not ( = ?auto_2343215 ?auto_2343217 ) ) ( not ( = ?auto_2343215 ?auto_2343218 ) ) ( not ( = ?auto_2343215 ?auto_2343219 ) ) ( not ( = ?auto_2343215 ?auto_2343220 ) ) ( not ( = ?auto_2343215 ?auto_2343221 ) ) ( not ( = ?auto_2343215 ?auto_2343222 ) ) ( not ( = ?auto_2343215 ?auto_2343223 ) ) ( not ( = ?auto_2343215 ?auto_2343224 ) ) ( not ( = ?auto_2343215 ?auto_2343225 ) ) ( not ( = ?auto_2343216 ?auto_2343217 ) ) ( not ( = ?auto_2343216 ?auto_2343218 ) ) ( not ( = ?auto_2343216 ?auto_2343219 ) ) ( not ( = ?auto_2343216 ?auto_2343220 ) ) ( not ( = ?auto_2343216 ?auto_2343221 ) ) ( not ( = ?auto_2343216 ?auto_2343222 ) ) ( not ( = ?auto_2343216 ?auto_2343223 ) ) ( not ( = ?auto_2343216 ?auto_2343224 ) ) ( not ( = ?auto_2343216 ?auto_2343225 ) ) ( not ( = ?auto_2343217 ?auto_2343218 ) ) ( not ( = ?auto_2343217 ?auto_2343219 ) ) ( not ( = ?auto_2343217 ?auto_2343220 ) ) ( not ( = ?auto_2343217 ?auto_2343221 ) ) ( not ( = ?auto_2343217 ?auto_2343222 ) ) ( not ( = ?auto_2343217 ?auto_2343223 ) ) ( not ( = ?auto_2343217 ?auto_2343224 ) ) ( not ( = ?auto_2343217 ?auto_2343225 ) ) ( not ( = ?auto_2343218 ?auto_2343219 ) ) ( not ( = ?auto_2343218 ?auto_2343220 ) ) ( not ( = ?auto_2343218 ?auto_2343221 ) ) ( not ( = ?auto_2343218 ?auto_2343222 ) ) ( not ( = ?auto_2343218 ?auto_2343223 ) ) ( not ( = ?auto_2343218 ?auto_2343224 ) ) ( not ( = ?auto_2343218 ?auto_2343225 ) ) ( not ( = ?auto_2343219 ?auto_2343220 ) ) ( not ( = ?auto_2343219 ?auto_2343221 ) ) ( not ( = ?auto_2343219 ?auto_2343222 ) ) ( not ( = ?auto_2343219 ?auto_2343223 ) ) ( not ( = ?auto_2343219 ?auto_2343224 ) ) ( not ( = ?auto_2343219 ?auto_2343225 ) ) ( not ( = ?auto_2343220 ?auto_2343221 ) ) ( not ( = ?auto_2343220 ?auto_2343222 ) ) ( not ( = ?auto_2343220 ?auto_2343223 ) ) ( not ( = ?auto_2343220 ?auto_2343224 ) ) ( not ( = ?auto_2343220 ?auto_2343225 ) ) ( not ( = ?auto_2343221 ?auto_2343222 ) ) ( not ( = ?auto_2343221 ?auto_2343223 ) ) ( not ( = ?auto_2343221 ?auto_2343224 ) ) ( not ( = ?auto_2343221 ?auto_2343225 ) ) ( not ( = ?auto_2343222 ?auto_2343223 ) ) ( not ( = ?auto_2343222 ?auto_2343224 ) ) ( not ( = ?auto_2343222 ?auto_2343225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2343223 ?auto_2343224 ?auto_2343225 )
      ( MAKE-15CRATE-VERIFY ?auto_2343210 ?auto_2343211 ?auto_2343212 ?auto_2343214 ?auto_2343213 ?auto_2343215 ?auto_2343216 ?auto_2343217 ?auto_2343218 ?auto_2343219 ?auto_2343220 ?auto_2343221 ?auto_2343222 ?auto_2343223 ?auto_2343224 ?auto_2343225 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2343405 - SURFACE
      ?auto_2343406 - SURFACE
      ?auto_2343407 - SURFACE
      ?auto_2343409 - SURFACE
      ?auto_2343408 - SURFACE
      ?auto_2343410 - SURFACE
      ?auto_2343411 - SURFACE
      ?auto_2343412 - SURFACE
      ?auto_2343413 - SURFACE
      ?auto_2343414 - SURFACE
      ?auto_2343415 - SURFACE
      ?auto_2343416 - SURFACE
      ?auto_2343417 - SURFACE
      ?auto_2343418 - SURFACE
      ?auto_2343419 - SURFACE
      ?auto_2343420 - SURFACE
    )
    :vars
    (
      ?auto_2343422 - HOIST
      ?auto_2343423 - PLACE
      ?auto_2343421 - TRUCK
      ?auto_2343424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2343422 ?auto_2343423 ) ( SURFACE-AT ?auto_2343419 ?auto_2343423 ) ( CLEAR ?auto_2343419 ) ( IS-CRATE ?auto_2343420 ) ( not ( = ?auto_2343419 ?auto_2343420 ) ) ( AVAILABLE ?auto_2343422 ) ( IN ?auto_2343420 ?auto_2343421 ) ( ON ?auto_2343419 ?auto_2343418 ) ( not ( = ?auto_2343418 ?auto_2343419 ) ) ( not ( = ?auto_2343418 ?auto_2343420 ) ) ( TRUCK-AT ?auto_2343421 ?auto_2343424 ) ( not ( = ?auto_2343424 ?auto_2343423 ) ) ( ON ?auto_2343406 ?auto_2343405 ) ( ON ?auto_2343407 ?auto_2343406 ) ( ON ?auto_2343409 ?auto_2343407 ) ( ON ?auto_2343408 ?auto_2343409 ) ( ON ?auto_2343410 ?auto_2343408 ) ( ON ?auto_2343411 ?auto_2343410 ) ( ON ?auto_2343412 ?auto_2343411 ) ( ON ?auto_2343413 ?auto_2343412 ) ( ON ?auto_2343414 ?auto_2343413 ) ( ON ?auto_2343415 ?auto_2343414 ) ( ON ?auto_2343416 ?auto_2343415 ) ( ON ?auto_2343417 ?auto_2343416 ) ( ON ?auto_2343418 ?auto_2343417 ) ( not ( = ?auto_2343405 ?auto_2343406 ) ) ( not ( = ?auto_2343405 ?auto_2343407 ) ) ( not ( = ?auto_2343405 ?auto_2343409 ) ) ( not ( = ?auto_2343405 ?auto_2343408 ) ) ( not ( = ?auto_2343405 ?auto_2343410 ) ) ( not ( = ?auto_2343405 ?auto_2343411 ) ) ( not ( = ?auto_2343405 ?auto_2343412 ) ) ( not ( = ?auto_2343405 ?auto_2343413 ) ) ( not ( = ?auto_2343405 ?auto_2343414 ) ) ( not ( = ?auto_2343405 ?auto_2343415 ) ) ( not ( = ?auto_2343405 ?auto_2343416 ) ) ( not ( = ?auto_2343405 ?auto_2343417 ) ) ( not ( = ?auto_2343405 ?auto_2343418 ) ) ( not ( = ?auto_2343405 ?auto_2343419 ) ) ( not ( = ?auto_2343405 ?auto_2343420 ) ) ( not ( = ?auto_2343406 ?auto_2343407 ) ) ( not ( = ?auto_2343406 ?auto_2343409 ) ) ( not ( = ?auto_2343406 ?auto_2343408 ) ) ( not ( = ?auto_2343406 ?auto_2343410 ) ) ( not ( = ?auto_2343406 ?auto_2343411 ) ) ( not ( = ?auto_2343406 ?auto_2343412 ) ) ( not ( = ?auto_2343406 ?auto_2343413 ) ) ( not ( = ?auto_2343406 ?auto_2343414 ) ) ( not ( = ?auto_2343406 ?auto_2343415 ) ) ( not ( = ?auto_2343406 ?auto_2343416 ) ) ( not ( = ?auto_2343406 ?auto_2343417 ) ) ( not ( = ?auto_2343406 ?auto_2343418 ) ) ( not ( = ?auto_2343406 ?auto_2343419 ) ) ( not ( = ?auto_2343406 ?auto_2343420 ) ) ( not ( = ?auto_2343407 ?auto_2343409 ) ) ( not ( = ?auto_2343407 ?auto_2343408 ) ) ( not ( = ?auto_2343407 ?auto_2343410 ) ) ( not ( = ?auto_2343407 ?auto_2343411 ) ) ( not ( = ?auto_2343407 ?auto_2343412 ) ) ( not ( = ?auto_2343407 ?auto_2343413 ) ) ( not ( = ?auto_2343407 ?auto_2343414 ) ) ( not ( = ?auto_2343407 ?auto_2343415 ) ) ( not ( = ?auto_2343407 ?auto_2343416 ) ) ( not ( = ?auto_2343407 ?auto_2343417 ) ) ( not ( = ?auto_2343407 ?auto_2343418 ) ) ( not ( = ?auto_2343407 ?auto_2343419 ) ) ( not ( = ?auto_2343407 ?auto_2343420 ) ) ( not ( = ?auto_2343409 ?auto_2343408 ) ) ( not ( = ?auto_2343409 ?auto_2343410 ) ) ( not ( = ?auto_2343409 ?auto_2343411 ) ) ( not ( = ?auto_2343409 ?auto_2343412 ) ) ( not ( = ?auto_2343409 ?auto_2343413 ) ) ( not ( = ?auto_2343409 ?auto_2343414 ) ) ( not ( = ?auto_2343409 ?auto_2343415 ) ) ( not ( = ?auto_2343409 ?auto_2343416 ) ) ( not ( = ?auto_2343409 ?auto_2343417 ) ) ( not ( = ?auto_2343409 ?auto_2343418 ) ) ( not ( = ?auto_2343409 ?auto_2343419 ) ) ( not ( = ?auto_2343409 ?auto_2343420 ) ) ( not ( = ?auto_2343408 ?auto_2343410 ) ) ( not ( = ?auto_2343408 ?auto_2343411 ) ) ( not ( = ?auto_2343408 ?auto_2343412 ) ) ( not ( = ?auto_2343408 ?auto_2343413 ) ) ( not ( = ?auto_2343408 ?auto_2343414 ) ) ( not ( = ?auto_2343408 ?auto_2343415 ) ) ( not ( = ?auto_2343408 ?auto_2343416 ) ) ( not ( = ?auto_2343408 ?auto_2343417 ) ) ( not ( = ?auto_2343408 ?auto_2343418 ) ) ( not ( = ?auto_2343408 ?auto_2343419 ) ) ( not ( = ?auto_2343408 ?auto_2343420 ) ) ( not ( = ?auto_2343410 ?auto_2343411 ) ) ( not ( = ?auto_2343410 ?auto_2343412 ) ) ( not ( = ?auto_2343410 ?auto_2343413 ) ) ( not ( = ?auto_2343410 ?auto_2343414 ) ) ( not ( = ?auto_2343410 ?auto_2343415 ) ) ( not ( = ?auto_2343410 ?auto_2343416 ) ) ( not ( = ?auto_2343410 ?auto_2343417 ) ) ( not ( = ?auto_2343410 ?auto_2343418 ) ) ( not ( = ?auto_2343410 ?auto_2343419 ) ) ( not ( = ?auto_2343410 ?auto_2343420 ) ) ( not ( = ?auto_2343411 ?auto_2343412 ) ) ( not ( = ?auto_2343411 ?auto_2343413 ) ) ( not ( = ?auto_2343411 ?auto_2343414 ) ) ( not ( = ?auto_2343411 ?auto_2343415 ) ) ( not ( = ?auto_2343411 ?auto_2343416 ) ) ( not ( = ?auto_2343411 ?auto_2343417 ) ) ( not ( = ?auto_2343411 ?auto_2343418 ) ) ( not ( = ?auto_2343411 ?auto_2343419 ) ) ( not ( = ?auto_2343411 ?auto_2343420 ) ) ( not ( = ?auto_2343412 ?auto_2343413 ) ) ( not ( = ?auto_2343412 ?auto_2343414 ) ) ( not ( = ?auto_2343412 ?auto_2343415 ) ) ( not ( = ?auto_2343412 ?auto_2343416 ) ) ( not ( = ?auto_2343412 ?auto_2343417 ) ) ( not ( = ?auto_2343412 ?auto_2343418 ) ) ( not ( = ?auto_2343412 ?auto_2343419 ) ) ( not ( = ?auto_2343412 ?auto_2343420 ) ) ( not ( = ?auto_2343413 ?auto_2343414 ) ) ( not ( = ?auto_2343413 ?auto_2343415 ) ) ( not ( = ?auto_2343413 ?auto_2343416 ) ) ( not ( = ?auto_2343413 ?auto_2343417 ) ) ( not ( = ?auto_2343413 ?auto_2343418 ) ) ( not ( = ?auto_2343413 ?auto_2343419 ) ) ( not ( = ?auto_2343413 ?auto_2343420 ) ) ( not ( = ?auto_2343414 ?auto_2343415 ) ) ( not ( = ?auto_2343414 ?auto_2343416 ) ) ( not ( = ?auto_2343414 ?auto_2343417 ) ) ( not ( = ?auto_2343414 ?auto_2343418 ) ) ( not ( = ?auto_2343414 ?auto_2343419 ) ) ( not ( = ?auto_2343414 ?auto_2343420 ) ) ( not ( = ?auto_2343415 ?auto_2343416 ) ) ( not ( = ?auto_2343415 ?auto_2343417 ) ) ( not ( = ?auto_2343415 ?auto_2343418 ) ) ( not ( = ?auto_2343415 ?auto_2343419 ) ) ( not ( = ?auto_2343415 ?auto_2343420 ) ) ( not ( = ?auto_2343416 ?auto_2343417 ) ) ( not ( = ?auto_2343416 ?auto_2343418 ) ) ( not ( = ?auto_2343416 ?auto_2343419 ) ) ( not ( = ?auto_2343416 ?auto_2343420 ) ) ( not ( = ?auto_2343417 ?auto_2343418 ) ) ( not ( = ?auto_2343417 ?auto_2343419 ) ) ( not ( = ?auto_2343417 ?auto_2343420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2343418 ?auto_2343419 ?auto_2343420 )
      ( MAKE-15CRATE-VERIFY ?auto_2343405 ?auto_2343406 ?auto_2343407 ?auto_2343409 ?auto_2343408 ?auto_2343410 ?auto_2343411 ?auto_2343412 ?auto_2343413 ?auto_2343414 ?auto_2343415 ?auto_2343416 ?auto_2343417 ?auto_2343418 ?auto_2343419 ?auto_2343420 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2343615 - SURFACE
      ?auto_2343616 - SURFACE
      ?auto_2343617 - SURFACE
      ?auto_2343619 - SURFACE
      ?auto_2343618 - SURFACE
      ?auto_2343620 - SURFACE
      ?auto_2343621 - SURFACE
      ?auto_2343622 - SURFACE
      ?auto_2343623 - SURFACE
      ?auto_2343624 - SURFACE
      ?auto_2343625 - SURFACE
      ?auto_2343626 - SURFACE
      ?auto_2343627 - SURFACE
      ?auto_2343628 - SURFACE
      ?auto_2343629 - SURFACE
      ?auto_2343630 - SURFACE
    )
    :vars
    (
      ?auto_2343634 - HOIST
      ?auto_2343633 - PLACE
      ?auto_2343632 - TRUCK
      ?auto_2343635 - PLACE
      ?auto_2343631 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2343634 ?auto_2343633 ) ( SURFACE-AT ?auto_2343629 ?auto_2343633 ) ( CLEAR ?auto_2343629 ) ( IS-CRATE ?auto_2343630 ) ( not ( = ?auto_2343629 ?auto_2343630 ) ) ( AVAILABLE ?auto_2343634 ) ( ON ?auto_2343629 ?auto_2343628 ) ( not ( = ?auto_2343628 ?auto_2343629 ) ) ( not ( = ?auto_2343628 ?auto_2343630 ) ) ( TRUCK-AT ?auto_2343632 ?auto_2343635 ) ( not ( = ?auto_2343635 ?auto_2343633 ) ) ( HOIST-AT ?auto_2343631 ?auto_2343635 ) ( LIFTING ?auto_2343631 ?auto_2343630 ) ( not ( = ?auto_2343634 ?auto_2343631 ) ) ( ON ?auto_2343616 ?auto_2343615 ) ( ON ?auto_2343617 ?auto_2343616 ) ( ON ?auto_2343619 ?auto_2343617 ) ( ON ?auto_2343618 ?auto_2343619 ) ( ON ?auto_2343620 ?auto_2343618 ) ( ON ?auto_2343621 ?auto_2343620 ) ( ON ?auto_2343622 ?auto_2343621 ) ( ON ?auto_2343623 ?auto_2343622 ) ( ON ?auto_2343624 ?auto_2343623 ) ( ON ?auto_2343625 ?auto_2343624 ) ( ON ?auto_2343626 ?auto_2343625 ) ( ON ?auto_2343627 ?auto_2343626 ) ( ON ?auto_2343628 ?auto_2343627 ) ( not ( = ?auto_2343615 ?auto_2343616 ) ) ( not ( = ?auto_2343615 ?auto_2343617 ) ) ( not ( = ?auto_2343615 ?auto_2343619 ) ) ( not ( = ?auto_2343615 ?auto_2343618 ) ) ( not ( = ?auto_2343615 ?auto_2343620 ) ) ( not ( = ?auto_2343615 ?auto_2343621 ) ) ( not ( = ?auto_2343615 ?auto_2343622 ) ) ( not ( = ?auto_2343615 ?auto_2343623 ) ) ( not ( = ?auto_2343615 ?auto_2343624 ) ) ( not ( = ?auto_2343615 ?auto_2343625 ) ) ( not ( = ?auto_2343615 ?auto_2343626 ) ) ( not ( = ?auto_2343615 ?auto_2343627 ) ) ( not ( = ?auto_2343615 ?auto_2343628 ) ) ( not ( = ?auto_2343615 ?auto_2343629 ) ) ( not ( = ?auto_2343615 ?auto_2343630 ) ) ( not ( = ?auto_2343616 ?auto_2343617 ) ) ( not ( = ?auto_2343616 ?auto_2343619 ) ) ( not ( = ?auto_2343616 ?auto_2343618 ) ) ( not ( = ?auto_2343616 ?auto_2343620 ) ) ( not ( = ?auto_2343616 ?auto_2343621 ) ) ( not ( = ?auto_2343616 ?auto_2343622 ) ) ( not ( = ?auto_2343616 ?auto_2343623 ) ) ( not ( = ?auto_2343616 ?auto_2343624 ) ) ( not ( = ?auto_2343616 ?auto_2343625 ) ) ( not ( = ?auto_2343616 ?auto_2343626 ) ) ( not ( = ?auto_2343616 ?auto_2343627 ) ) ( not ( = ?auto_2343616 ?auto_2343628 ) ) ( not ( = ?auto_2343616 ?auto_2343629 ) ) ( not ( = ?auto_2343616 ?auto_2343630 ) ) ( not ( = ?auto_2343617 ?auto_2343619 ) ) ( not ( = ?auto_2343617 ?auto_2343618 ) ) ( not ( = ?auto_2343617 ?auto_2343620 ) ) ( not ( = ?auto_2343617 ?auto_2343621 ) ) ( not ( = ?auto_2343617 ?auto_2343622 ) ) ( not ( = ?auto_2343617 ?auto_2343623 ) ) ( not ( = ?auto_2343617 ?auto_2343624 ) ) ( not ( = ?auto_2343617 ?auto_2343625 ) ) ( not ( = ?auto_2343617 ?auto_2343626 ) ) ( not ( = ?auto_2343617 ?auto_2343627 ) ) ( not ( = ?auto_2343617 ?auto_2343628 ) ) ( not ( = ?auto_2343617 ?auto_2343629 ) ) ( not ( = ?auto_2343617 ?auto_2343630 ) ) ( not ( = ?auto_2343619 ?auto_2343618 ) ) ( not ( = ?auto_2343619 ?auto_2343620 ) ) ( not ( = ?auto_2343619 ?auto_2343621 ) ) ( not ( = ?auto_2343619 ?auto_2343622 ) ) ( not ( = ?auto_2343619 ?auto_2343623 ) ) ( not ( = ?auto_2343619 ?auto_2343624 ) ) ( not ( = ?auto_2343619 ?auto_2343625 ) ) ( not ( = ?auto_2343619 ?auto_2343626 ) ) ( not ( = ?auto_2343619 ?auto_2343627 ) ) ( not ( = ?auto_2343619 ?auto_2343628 ) ) ( not ( = ?auto_2343619 ?auto_2343629 ) ) ( not ( = ?auto_2343619 ?auto_2343630 ) ) ( not ( = ?auto_2343618 ?auto_2343620 ) ) ( not ( = ?auto_2343618 ?auto_2343621 ) ) ( not ( = ?auto_2343618 ?auto_2343622 ) ) ( not ( = ?auto_2343618 ?auto_2343623 ) ) ( not ( = ?auto_2343618 ?auto_2343624 ) ) ( not ( = ?auto_2343618 ?auto_2343625 ) ) ( not ( = ?auto_2343618 ?auto_2343626 ) ) ( not ( = ?auto_2343618 ?auto_2343627 ) ) ( not ( = ?auto_2343618 ?auto_2343628 ) ) ( not ( = ?auto_2343618 ?auto_2343629 ) ) ( not ( = ?auto_2343618 ?auto_2343630 ) ) ( not ( = ?auto_2343620 ?auto_2343621 ) ) ( not ( = ?auto_2343620 ?auto_2343622 ) ) ( not ( = ?auto_2343620 ?auto_2343623 ) ) ( not ( = ?auto_2343620 ?auto_2343624 ) ) ( not ( = ?auto_2343620 ?auto_2343625 ) ) ( not ( = ?auto_2343620 ?auto_2343626 ) ) ( not ( = ?auto_2343620 ?auto_2343627 ) ) ( not ( = ?auto_2343620 ?auto_2343628 ) ) ( not ( = ?auto_2343620 ?auto_2343629 ) ) ( not ( = ?auto_2343620 ?auto_2343630 ) ) ( not ( = ?auto_2343621 ?auto_2343622 ) ) ( not ( = ?auto_2343621 ?auto_2343623 ) ) ( not ( = ?auto_2343621 ?auto_2343624 ) ) ( not ( = ?auto_2343621 ?auto_2343625 ) ) ( not ( = ?auto_2343621 ?auto_2343626 ) ) ( not ( = ?auto_2343621 ?auto_2343627 ) ) ( not ( = ?auto_2343621 ?auto_2343628 ) ) ( not ( = ?auto_2343621 ?auto_2343629 ) ) ( not ( = ?auto_2343621 ?auto_2343630 ) ) ( not ( = ?auto_2343622 ?auto_2343623 ) ) ( not ( = ?auto_2343622 ?auto_2343624 ) ) ( not ( = ?auto_2343622 ?auto_2343625 ) ) ( not ( = ?auto_2343622 ?auto_2343626 ) ) ( not ( = ?auto_2343622 ?auto_2343627 ) ) ( not ( = ?auto_2343622 ?auto_2343628 ) ) ( not ( = ?auto_2343622 ?auto_2343629 ) ) ( not ( = ?auto_2343622 ?auto_2343630 ) ) ( not ( = ?auto_2343623 ?auto_2343624 ) ) ( not ( = ?auto_2343623 ?auto_2343625 ) ) ( not ( = ?auto_2343623 ?auto_2343626 ) ) ( not ( = ?auto_2343623 ?auto_2343627 ) ) ( not ( = ?auto_2343623 ?auto_2343628 ) ) ( not ( = ?auto_2343623 ?auto_2343629 ) ) ( not ( = ?auto_2343623 ?auto_2343630 ) ) ( not ( = ?auto_2343624 ?auto_2343625 ) ) ( not ( = ?auto_2343624 ?auto_2343626 ) ) ( not ( = ?auto_2343624 ?auto_2343627 ) ) ( not ( = ?auto_2343624 ?auto_2343628 ) ) ( not ( = ?auto_2343624 ?auto_2343629 ) ) ( not ( = ?auto_2343624 ?auto_2343630 ) ) ( not ( = ?auto_2343625 ?auto_2343626 ) ) ( not ( = ?auto_2343625 ?auto_2343627 ) ) ( not ( = ?auto_2343625 ?auto_2343628 ) ) ( not ( = ?auto_2343625 ?auto_2343629 ) ) ( not ( = ?auto_2343625 ?auto_2343630 ) ) ( not ( = ?auto_2343626 ?auto_2343627 ) ) ( not ( = ?auto_2343626 ?auto_2343628 ) ) ( not ( = ?auto_2343626 ?auto_2343629 ) ) ( not ( = ?auto_2343626 ?auto_2343630 ) ) ( not ( = ?auto_2343627 ?auto_2343628 ) ) ( not ( = ?auto_2343627 ?auto_2343629 ) ) ( not ( = ?auto_2343627 ?auto_2343630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2343628 ?auto_2343629 ?auto_2343630 )
      ( MAKE-15CRATE-VERIFY ?auto_2343615 ?auto_2343616 ?auto_2343617 ?auto_2343619 ?auto_2343618 ?auto_2343620 ?auto_2343621 ?auto_2343622 ?auto_2343623 ?auto_2343624 ?auto_2343625 ?auto_2343626 ?auto_2343627 ?auto_2343628 ?auto_2343629 ?auto_2343630 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2343840 - SURFACE
      ?auto_2343841 - SURFACE
      ?auto_2343842 - SURFACE
      ?auto_2343844 - SURFACE
      ?auto_2343843 - SURFACE
      ?auto_2343845 - SURFACE
      ?auto_2343846 - SURFACE
      ?auto_2343847 - SURFACE
      ?auto_2343848 - SURFACE
      ?auto_2343849 - SURFACE
      ?auto_2343850 - SURFACE
      ?auto_2343851 - SURFACE
      ?auto_2343852 - SURFACE
      ?auto_2343853 - SURFACE
      ?auto_2343854 - SURFACE
      ?auto_2343855 - SURFACE
    )
    :vars
    (
      ?auto_2343860 - HOIST
      ?auto_2343858 - PLACE
      ?auto_2343861 - TRUCK
      ?auto_2343859 - PLACE
      ?auto_2343857 - HOIST
      ?auto_2343856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2343860 ?auto_2343858 ) ( SURFACE-AT ?auto_2343854 ?auto_2343858 ) ( CLEAR ?auto_2343854 ) ( IS-CRATE ?auto_2343855 ) ( not ( = ?auto_2343854 ?auto_2343855 ) ) ( AVAILABLE ?auto_2343860 ) ( ON ?auto_2343854 ?auto_2343853 ) ( not ( = ?auto_2343853 ?auto_2343854 ) ) ( not ( = ?auto_2343853 ?auto_2343855 ) ) ( TRUCK-AT ?auto_2343861 ?auto_2343859 ) ( not ( = ?auto_2343859 ?auto_2343858 ) ) ( HOIST-AT ?auto_2343857 ?auto_2343859 ) ( not ( = ?auto_2343860 ?auto_2343857 ) ) ( AVAILABLE ?auto_2343857 ) ( SURFACE-AT ?auto_2343855 ?auto_2343859 ) ( ON ?auto_2343855 ?auto_2343856 ) ( CLEAR ?auto_2343855 ) ( not ( = ?auto_2343854 ?auto_2343856 ) ) ( not ( = ?auto_2343855 ?auto_2343856 ) ) ( not ( = ?auto_2343853 ?auto_2343856 ) ) ( ON ?auto_2343841 ?auto_2343840 ) ( ON ?auto_2343842 ?auto_2343841 ) ( ON ?auto_2343844 ?auto_2343842 ) ( ON ?auto_2343843 ?auto_2343844 ) ( ON ?auto_2343845 ?auto_2343843 ) ( ON ?auto_2343846 ?auto_2343845 ) ( ON ?auto_2343847 ?auto_2343846 ) ( ON ?auto_2343848 ?auto_2343847 ) ( ON ?auto_2343849 ?auto_2343848 ) ( ON ?auto_2343850 ?auto_2343849 ) ( ON ?auto_2343851 ?auto_2343850 ) ( ON ?auto_2343852 ?auto_2343851 ) ( ON ?auto_2343853 ?auto_2343852 ) ( not ( = ?auto_2343840 ?auto_2343841 ) ) ( not ( = ?auto_2343840 ?auto_2343842 ) ) ( not ( = ?auto_2343840 ?auto_2343844 ) ) ( not ( = ?auto_2343840 ?auto_2343843 ) ) ( not ( = ?auto_2343840 ?auto_2343845 ) ) ( not ( = ?auto_2343840 ?auto_2343846 ) ) ( not ( = ?auto_2343840 ?auto_2343847 ) ) ( not ( = ?auto_2343840 ?auto_2343848 ) ) ( not ( = ?auto_2343840 ?auto_2343849 ) ) ( not ( = ?auto_2343840 ?auto_2343850 ) ) ( not ( = ?auto_2343840 ?auto_2343851 ) ) ( not ( = ?auto_2343840 ?auto_2343852 ) ) ( not ( = ?auto_2343840 ?auto_2343853 ) ) ( not ( = ?auto_2343840 ?auto_2343854 ) ) ( not ( = ?auto_2343840 ?auto_2343855 ) ) ( not ( = ?auto_2343840 ?auto_2343856 ) ) ( not ( = ?auto_2343841 ?auto_2343842 ) ) ( not ( = ?auto_2343841 ?auto_2343844 ) ) ( not ( = ?auto_2343841 ?auto_2343843 ) ) ( not ( = ?auto_2343841 ?auto_2343845 ) ) ( not ( = ?auto_2343841 ?auto_2343846 ) ) ( not ( = ?auto_2343841 ?auto_2343847 ) ) ( not ( = ?auto_2343841 ?auto_2343848 ) ) ( not ( = ?auto_2343841 ?auto_2343849 ) ) ( not ( = ?auto_2343841 ?auto_2343850 ) ) ( not ( = ?auto_2343841 ?auto_2343851 ) ) ( not ( = ?auto_2343841 ?auto_2343852 ) ) ( not ( = ?auto_2343841 ?auto_2343853 ) ) ( not ( = ?auto_2343841 ?auto_2343854 ) ) ( not ( = ?auto_2343841 ?auto_2343855 ) ) ( not ( = ?auto_2343841 ?auto_2343856 ) ) ( not ( = ?auto_2343842 ?auto_2343844 ) ) ( not ( = ?auto_2343842 ?auto_2343843 ) ) ( not ( = ?auto_2343842 ?auto_2343845 ) ) ( not ( = ?auto_2343842 ?auto_2343846 ) ) ( not ( = ?auto_2343842 ?auto_2343847 ) ) ( not ( = ?auto_2343842 ?auto_2343848 ) ) ( not ( = ?auto_2343842 ?auto_2343849 ) ) ( not ( = ?auto_2343842 ?auto_2343850 ) ) ( not ( = ?auto_2343842 ?auto_2343851 ) ) ( not ( = ?auto_2343842 ?auto_2343852 ) ) ( not ( = ?auto_2343842 ?auto_2343853 ) ) ( not ( = ?auto_2343842 ?auto_2343854 ) ) ( not ( = ?auto_2343842 ?auto_2343855 ) ) ( not ( = ?auto_2343842 ?auto_2343856 ) ) ( not ( = ?auto_2343844 ?auto_2343843 ) ) ( not ( = ?auto_2343844 ?auto_2343845 ) ) ( not ( = ?auto_2343844 ?auto_2343846 ) ) ( not ( = ?auto_2343844 ?auto_2343847 ) ) ( not ( = ?auto_2343844 ?auto_2343848 ) ) ( not ( = ?auto_2343844 ?auto_2343849 ) ) ( not ( = ?auto_2343844 ?auto_2343850 ) ) ( not ( = ?auto_2343844 ?auto_2343851 ) ) ( not ( = ?auto_2343844 ?auto_2343852 ) ) ( not ( = ?auto_2343844 ?auto_2343853 ) ) ( not ( = ?auto_2343844 ?auto_2343854 ) ) ( not ( = ?auto_2343844 ?auto_2343855 ) ) ( not ( = ?auto_2343844 ?auto_2343856 ) ) ( not ( = ?auto_2343843 ?auto_2343845 ) ) ( not ( = ?auto_2343843 ?auto_2343846 ) ) ( not ( = ?auto_2343843 ?auto_2343847 ) ) ( not ( = ?auto_2343843 ?auto_2343848 ) ) ( not ( = ?auto_2343843 ?auto_2343849 ) ) ( not ( = ?auto_2343843 ?auto_2343850 ) ) ( not ( = ?auto_2343843 ?auto_2343851 ) ) ( not ( = ?auto_2343843 ?auto_2343852 ) ) ( not ( = ?auto_2343843 ?auto_2343853 ) ) ( not ( = ?auto_2343843 ?auto_2343854 ) ) ( not ( = ?auto_2343843 ?auto_2343855 ) ) ( not ( = ?auto_2343843 ?auto_2343856 ) ) ( not ( = ?auto_2343845 ?auto_2343846 ) ) ( not ( = ?auto_2343845 ?auto_2343847 ) ) ( not ( = ?auto_2343845 ?auto_2343848 ) ) ( not ( = ?auto_2343845 ?auto_2343849 ) ) ( not ( = ?auto_2343845 ?auto_2343850 ) ) ( not ( = ?auto_2343845 ?auto_2343851 ) ) ( not ( = ?auto_2343845 ?auto_2343852 ) ) ( not ( = ?auto_2343845 ?auto_2343853 ) ) ( not ( = ?auto_2343845 ?auto_2343854 ) ) ( not ( = ?auto_2343845 ?auto_2343855 ) ) ( not ( = ?auto_2343845 ?auto_2343856 ) ) ( not ( = ?auto_2343846 ?auto_2343847 ) ) ( not ( = ?auto_2343846 ?auto_2343848 ) ) ( not ( = ?auto_2343846 ?auto_2343849 ) ) ( not ( = ?auto_2343846 ?auto_2343850 ) ) ( not ( = ?auto_2343846 ?auto_2343851 ) ) ( not ( = ?auto_2343846 ?auto_2343852 ) ) ( not ( = ?auto_2343846 ?auto_2343853 ) ) ( not ( = ?auto_2343846 ?auto_2343854 ) ) ( not ( = ?auto_2343846 ?auto_2343855 ) ) ( not ( = ?auto_2343846 ?auto_2343856 ) ) ( not ( = ?auto_2343847 ?auto_2343848 ) ) ( not ( = ?auto_2343847 ?auto_2343849 ) ) ( not ( = ?auto_2343847 ?auto_2343850 ) ) ( not ( = ?auto_2343847 ?auto_2343851 ) ) ( not ( = ?auto_2343847 ?auto_2343852 ) ) ( not ( = ?auto_2343847 ?auto_2343853 ) ) ( not ( = ?auto_2343847 ?auto_2343854 ) ) ( not ( = ?auto_2343847 ?auto_2343855 ) ) ( not ( = ?auto_2343847 ?auto_2343856 ) ) ( not ( = ?auto_2343848 ?auto_2343849 ) ) ( not ( = ?auto_2343848 ?auto_2343850 ) ) ( not ( = ?auto_2343848 ?auto_2343851 ) ) ( not ( = ?auto_2343848 ?auto_2343852 ) ) ( not ( = ?auto_2343848 ?auto_2343853 ) ) ( not ( = ?auto_2343848 ?auto_2343854 ) ) ( not ( = ?auto_2343848 ?auto_2343855 ) ) ( not ( = ?auto_2343848 ?auto_2343856 ) ) ( not ( = ?auto_2343849 ?auto_2343850 ) ) ( not ( = ?auto_2343849 ?auto_2343851 ) ) ( not ( = ?auto_2343849 ?auto_2343852 ) ) ( not ( = ?auto_2343849 ?auto_2343853 ) ) ( not ( = ?auto_2343849 ?auto_2343854 ) ) ( not ( = ?auto_2343849 ?auto_2343855 ) ) ( not ( = ?auto_2343849 ?auto_2343856 ) ) ( not ( = ?auto_2343850 ?auto_2343851 ) ) ( not ( = ?auto_2343850 ?auto_2343852 ) ) ( not ( = ?auto_2343850 ?auto_2343853 ) ) ( not ( = ?auto_2343850 ?auto_2343854 ) ) ( not ( = ?auto_2343850 ?auto_2343855 ) ) ( not ( = ?auto_2343850 ?auto_2343856 ) ) ( not ( = ?auto_2343851 ?auto_2343852 ) ) ( not ( = ?auto_2343851 ?auto_2343853 ) ) ( not ( = ?auto_2343851 ?auto_2343854 ) ) ( not ( = ?auto_2343851 ?auto_2343855 ) ) ( not ( = ?auto_2343851 ?auto_2343856 ) ) ( not ( = ?auto_2343852 ?auto_2343853 ) ) ( not ( = ?auto_2343852 ?auto_2343854 ) ) ( not ( = ?auto_2343852 ?auto_2343855 ) ) ( not ( = ?auto_2343852 ?auto_2343856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2343853 ?auto_2343854 ?auto_2343855 )
      ( MAKE-15CRATE-VERIFY ?auto_2343840 ?auto_2343841 ?auto_2343842 ?auto_2343844 ?auto_2343843 ?auto_2343845 ?auto_2343846 ?auto_2343847 ?auto_2343848 ?auto_2343849 ?auto_2343850 ?auto_2343851 ?auto_2343852 ?auto_2343853 ?auto_2343854 ?auto_2343855 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2344066 - SURFACE
      ?auto_2344067 - SURFACE
      ?auto_2344068 - SURFACE
      ?auto_2344070 - SURFACE
      ?auto_2344069 - SURFACE
      ?auto_2344071 - SURFACE
      ?auto_2344072 - SURFACE
      ?auto_2344073 - SURFACE
      ?auto_2344074 - SURFACE
      ?auto_2344075 - SURFACE
      ?auto_2344076 - SURFACE
      ?auto_2344077 - SURFACE
      ?auto_2344078 - SURFACE
      ?auto_2344079 - SURFACE
      ?auto_2344080 - SURFACE
      ?auto_2344081 - SURFACE
    )
    :vars
    (
      ?auto_2344086 - HOIST
      ?auto_2344083 - PLACE
      ?auto_2344082 - PLACE
      ?auto_2344085 - HOIST
      ?auto_2344087 - SURFACE
      ?auto_2344084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2344086 ?auto_2344083 ) ( SURFACE-AT ?auto_2344080 ?auto_2344083 ) ( CLEAR ?auto_2344080 ) ( IS-CRATE ?auto_2344081 ) ( not ( = ?auto_2344080 ?auto_2344081 ) ) ( AVAILABLE ?auto_2344086 ) ( ON ?auto_2344080 ?auto_2344079 ) ( not ( = ?auto_2344079 ?auto_2344080 ) ) ( not ( = ?auto_2344079 ?auto_2344081 ) ) ( not ( = ?auto_2344082 ?auto_2344083 ) ) ( HOIST-AT ?auto_2344085 ?auto_2344082 ) ( not ( = ?auto_2344086 ?auto_2344085 ) ) ( AVAILABLE ?auto_2344085 ) ( SURFACE-AT ?auto_2344081 ?auto_2344082 ) ( ON ?auto_2344081 ?auto_2344087 ) ( CLEAR ?auto_2344081 ) ( not ( = ?auto_2344080 ?auto_2344087 ) ) ( not ( = ?auto_2344081 ?auto_2344087 ) ) ( not ( = ?auto_2344079 ?auto_2344087 ) ) ( TRUCK-AT ?auto_2344084 ?auto_2344083 ) ( ON ?auto_2344067 ?auto_2344066 ) ( ON ?auto_2344068 ?auto_2344067 ) ( ON ?auto_2344070 ?auto_2344068 ) ( ON ?auto_2344069 ?auto_2344070 ) ( ON ?auto_2344071 ?auto_2344069 ) ( ON ?auto_2344072 ?auto_2344071 ) ( ON ?auto_2344073 ?auto_2344072 ) ( ON ?auto_2344074 ?auto_2344073 ) ( ON ?auto_2344075 ?auto_2344074 ) ( ON ?auto_2344076 ?auto_2344075 ) ( ON ?auto_2344077 ?auto_2344076 ) ( ON ?auto_2344078 ?auto_2344077 ) ( ON ?auto_2344079 ?auto_2344078 ) ( not ( = ?auto_2344066 ?auto_2344067 ) ) ( not ( = ?auto_2344066 ?auto_2344068 ) ) ( not ( = ?auto_2344066 ?auto_2344070 ) ) ( not ( = ?auto_2344066 ?auto_2344069 ) ) ( not ( = ?auto_2344066 ?auto_2344071 ) ) ( not ( = ?auto_2344066 ?auto_2344072 ) ) ( not ( = ?auto_2344066 ?auto_2344073 ) ) ( not ( = ?auto_2344066 ?auto_2344074 ) ) ( not ( = ?auto_2344066 ?auto_2344075 ) ) ( not ( = ?auto_2344066 ?auto_2344076 ) ) ( not ( = ?auto_2344066 ?auto_2344077 ) ) ( not ( = ?auto_2344066 ?auto_2344078 ) ) ( not ( = ?auto_2344066 ?auto_2344079 ) ) ( not ( = ?auto_2344066 ?auto_2344080 ) ) ( not ( = ?auto_2344066 ?auto_2344081 ) ) ( not ( = ?auto_2344066 ?auto_2344087 ) ) ( not ( = ?auto_2344067 ?auto_2344068 ) ) ( not ( = ?auto_2344067 ?auto_2344070 ) ) ( not ( = ?auto_2344067 ?auto_2344069 ) ) ( not ( = ?auto_2344067 ?auto_2344071 ) ) ( not ( = ?auto_2344067 ?auto_2344072 ) ) ( not ( = ?auto_2344067 ?auto_2344073 ) ) ( not ( = ?auto_2344067 ?auto_2344074 ) ) ( not ( = ?auto_2344067 ?auto_2344075 ) ) ( not ( = ?auto_2344067 ?auto_2344076 ) ) ( not ( = ?auto_2344067 ?auto_2344077 ) ) ( not ( = ?auto_2344067 ?auto_2344078 ) ) ( not ( = ?auto_2344067 ?auto_2344079 ) ) ( not ( = ?auto_2344067 ?auto_2344080 ) ) ( not ( = ?auto_2344067 ?auto_2344081 ) ) ( not ( = ?auto_2344067 ?auto_2344087 ) ) ( not ( = ?auto_2344068 ?auto_2344070 ) ) ( not ( = ?auto_2344068 ?auto_2344069 ) ) ( not ( = ?auto_2344068 ?auto_2344071 ) ) ( not ( = ?auto_2344068 ?auto_2344072 ) ) ( not ( = ?auto_2344068 ?auto_2344073 ) ) ( not ( = ?auto_2344068 ?auto_2344074 ) ) ( not ( = ?auto_2344068 ?auto_2344075 ) ) ( not ( = ?auto_2344068 ?auto_2344076 ) ) ( not ( = ?auto_2344068 ?auto_2344077 ) ) ( not ( = ?auto_2344068 ?auto_2344078 ) ) ( not ( = ?auto_2344068 ?auto_2344079 ) ) ( not ( = ?auto_2344068 ?auto_2344080 ) ) ( not ( = ?auto_2344068 ?auto_2344081 ) ) ( not ( = ?auto_2344068 ?auto_2344087 ) ) ( not ( = ?auto_2344070 ?auto_2344069 ) ) ( not ( = ?auto_2344070 ?auto_2344071 ) ) ( not ( = ?auto_2344070 ?auto_2344072 ) ) ( not ( = ?auto_2344070 ?auto_2344073 ) ) ( not ( = ?auto_2344070 ?auto_2344074 ) ) ( not ( = ?auto_2344070 ?auto_2344075 ) ) ( not ( = ?auto_2344070 ?auto_2344076 ) ) ( not ( = ?auto_2344070 ?auto_2344077 ) ) ( not ( = ?auto_2344070 ?auto_2344078 ) ) ( not ( = ?auto_2344070 ?auto_2344079 ) ) ( not ( = ?auto_2344070 ?auto_2344080 ) ) ( not ( = ?auto_2344070 ?auto_2344081 ) ) ( not ( = ?auto_2344070 ?auto_2344087 ) ) ( not ( = ?auto_2344069 ?auto_2344071 ) ) ( not ( = ?auto_2344069 ?auto_2344072 ) ) ( not ( = ?auto_2344069 ?auto_2344073 ) ) ( not ( = ?auto_2344069 ?auto_2344074 ) ) ( not ( = ?auto_2344069 ?auto_2344075 ) ) ( not ( = ?auto_2344069 ?auto_2344076 ) ) ( not ( = ?auto_2344069 ?auto_2344077 ) ) ( not ( = ?auto_2344069 ?auto_2344078 ) ) ( not ( = ?auto_2344069 ?auto_2344079 ) ) ( not ( = ?auto_2344069 ?auto_2344080 ) ) ( not ( = ?auto_2344069 ?auto_2344081 ) ) ( not ( = ?auto_2344069 ?auto_2344087 ) ) ( not ( = ?auto_2344071 ?auto_2344072 ) ) ( not ( = ?auto_2344071 ?auto_2344073 ) ) ( not ( = ?auto_2344071 ?auto_2344074 ) ) ( not ( = ?auto_2344071 ?auto_2344075 ) ) ( not ( = ?auto_2344071 ?auto_2344076 ) ) ( not ( = ?auto_2344071 ?auto_2344077 ) ) ( not ( = ?auto_2344071 ?auto_2344078 ) ) ( not ( = ?auto_2344071 ?auto_2344079 ) ) ( not ( = ?auto_2344071 ?auto_2344080 ) ) ( not ( = ?auto_2344071 ?auto_2344081 ) ) ( not ( = ?auto_2344071 ?auto_2344087 ) ) ( not ( = ?auto_2344072 ?auto_2344073 ) ) ( not ( = ?auto_2344072 ?auto_2344074 ) ) ( not ( = ?auto_2344072 ?auto_2344075 ) ) ( not ( = ?auto_2344072 ?auto_2344076 ) ) ( not ( = ?auto_2344072 ?auto_2344077 ) ) ( not ( = ?auto_2344072 ?auto_2344078 ) ) ( not ( = ?auto_2344072 ?auto_2344079 ) ) ( not ( = ?auto_2344072 ?auto_2344080 ) ) ( not ( = ?auto_2344072 ?auto_2344081 ) ) ( not ( = ?auto_2344072 ?auto_2344087 ) ) ( not ( = ?auto_2344073 ?auto_2344074 ) ) ( not ( = ?auto_2344073 ?auto_2344075 ) ) ( not ( = ?auto_2344073 ?auto_2344076 ) ) ( not ( = ?auto_2344073 ?auto_2344077 ) ) ( not ( = ?auto_2344073 ?auto_2344078 ) ) ( not ( = ?auto_2344073 ?auto_2344079 ) ) ( not ( = ?auto_2344073 ?auto_2344080 ) ) ( not ( = ?auto_2344073 ?auto_2344081 ) ) ( not ( = ?auto_2344073 ?auto_2344087 ) ) ( not ( = ?auto_2344074 ?auto_2344075 ) ) ( not ( = ?auto_2344074 ?auto_2344076 ) ) ( not ( = ?auto_2344074 ?auto_2344077 ) ) ( not ( = ?auto_2344074 ?auto_2344078 ) ) ( not ( = ?auto_2344074 ?auto_2344079 ) ) ( not ( = ?auto_2344074 ?auto_2344080 ) ) ( not ( = ?auto_2344074 ?auto_2344081 ) ) ( not ( = ?auto_2344074 ?auto_2344087 ) ) ( not ( = ?auto_2344075 ?auto_2344076 ) ) ( not ( = ?auto_2344075 ?auto_2344077 ) ) ( not ( = ?auto_2344075 ?auto_2344078 ) ) ( not ( = ?auto_2344075 ?auto_2344079 ) ) ( not ( = ?auto_2344075 ?auto_2344080 ) ) ( not ( = ?auto_2344075 ?auto_2344081 ) ) ( not ( = ?auto_2344075 ?auto_2344087 ) ) ( not ( = ?auto_2344076 ?auto_2344077 ) ) ( not ( = ?auto_2344076 ?auto_2344078 ) ) ( not ( = ?auto_2344076 ?auto_2344079 ) ) ( not ( = ?auto_2344076 ?auto_2344080 ) ) ( not ( = ?auto_2344076 ?auto_2344081 ) ) ( not ( = ?auto_2344076 ?auto_2344087 ) ) ( not ( = ?auto_2344077 ?auto_2344078 ) ) ( not ( = ?auto_2344077 ?auto_2344079 ) ) ( not ( = ?auto_2344077 ?auto_2344080 ) ) ( not ( = ?auto_2344077 ?auto_2344081 ) ) ( not ( = ?auto_2344077 ?auto_2344087 ) ) ( not ( = ?auto_2344078 ?auto_2344079 ) ) ( not ( = ?auto_2344078 ?auto_2344080 ) ) ( not ( = ?auto_2344078 ?auto_2344081 ) ) ( not ( = ?auto_2344078 ?auto_2344087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2344079 ?auto_2344080 ?auto_2344081 )
      ( MAKE-15CRATE-VERIFY ?auto_2344066 ?auto_2344067 ?auto_2344068 ?auto_2344070 ?auto_2344069 ?auto_2344071 ?auto_2344072 ?auto_2344073 ?auto_2344074 ?auto_2344075 ?auto_2344076 ?auto_2344077 ?auto_2344078 ?auto_2344079 ?auto_2344080 ?auto_2344081 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2344292 - SURFACE
      ?auto_2344293 - SURFACE
      ?auto_2344294 - SURFACE
      ?auto_2344296 - SURFACE
      ?auto_2344295 - SURFACE
      ?auto_2344297 - SURFACE
      ?auto_2344298 - SURFACE
      ?auto_2344299 - SURFACE
      ?auto_2344300 - SURFACE
      ?auto_2344301 - SURFACE
      ?auto_2344302 - SURFACE
      ?auto_2344303 - SURFACE
      ?auto_2344304 - SURFACE
      ?auto_2344305 - SURFACE
      ?auto_2344306 - SURFACE
      ?auto_2344307 - SURFACE
    )
    :vars
    (
      ?auto_2344310 - HOIST
      ?auto_2344312 - PLACE
      ?auto_2344313 - PLACE
      ?auto_2344308 - HOIST
      ?auto_2344311 - SURFACE
      ?auto_2344309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2344310 ?auto_2344312 ) ( IS-CRATE ?auto_2344307 ) ( not ( = ?auto_2344306 ?auto_2344307 ) ) ( not ( = ?auto_2344305 ?auto_2344306 ) ) ( not ( = ?auto_2344305 ?auto_2344307 ) ) ( not ( = ?auto_2344313 ?auto_2344312 ) ) ( HOIST-AT ?auto_2344308 ?auto_2344313 ) ( not ( = ?auto_2344310 ?auto_2344308 ) ) ( AVAILABLE ?auto_2344308 ) ( SURFACE-AT ?auto_2344307 ?auto_2344313 ) ( ON ?auto_2344307 ?auto_2344311 ) ( CLEAR ?auto_2344307 ) ( not ( = ?auto_2344306 ?auto_2344311 ) ) ( not ( = ?auto_2344307 ?auto_2344311 ) ) ( not ( = ?auto_2344305 ?auto_2344311 ) ) ( TRUCK-AT ?auto_2344309 ?auto_2344312 ) ( SURFACE-AT ?auto_2344305 ?auto_2344312 ) ( CLEAR ?auto_2344305 ) ( LIFTING ?auto_2344310 ?auto_2344306 ) ( IS-CRATE ?auto_2344306 ) ( ON ?auto_2344293 ?auto_2344292 ) ( ON ?auto_2344294 ?auto_2344293 ) ( ON ?auto_2344296 ?auto_2344294 ) ( ON ?auto_2344295 ?auto_2344296 ) ( ON ?auto_2344297 ?auto_2344295 ) ( ON ?auto_2344298 ?auto_2344297 ) ( ON ?auto_2344299 ?auto_2344298 ) ( ON ?auto_2344300 ?auto_2344299 ) ( ON ?auto_2344301 ?auto_2344300 ) ( ON ?auto_2344302 ?auto_2344301 ) ( ON ?auto_2344303 ?auto_2344302 ) ( ON ?auto_2344304 ?auto_2344303 ) ( ON ?auto_2344305 ?auto_2344304 ) ( not ( = ?auto_2344292 ?auto_2344293 ) ) ( not ( = ?auto_2344292 ?auto_2344294 ) ) ( not ( = ?auto_2344292 ?auto_2344296 ) ) ( not ( = ?auto_2344292 ?auto_2344295 ) ) ( not ( = ?auto_2344292 ?auto_2344297 ) ) ( not ( = ?auto_2344292 ?auto_2344298 ) ) ( not ( = ?auto_2344292 ?auto_2344299 ) ) ( not ( = ?auto_2344292 ?auto_2344300 ) ) ( not ( = ?auto_2344292 ?auto_2344301 ) ) ( not ( = ?auto_2344292 ?auto_2344302 ) ) ( not ( = ?auto_2344292 ?auto_2344303 ) ) ( not ( = ?auto_2344292 ?auto_2344304 ) ) ( not ( = ?auto_2344292 ?auto_2344305 ) ) ( not ( = ?auto_2344292 ?auto_2344306 ) ) ( not ( = ?auto_2344292 ?auto_2344307 ) ) ( not ( = ?auto_2344292 ?auto_2344311 ) ) ( not ( = ?auto_2344293 ?auto_2344294 ) ) ( not ( = ?auto_2344293 ?auto_2344296 ) ) ( not ( = ?auto_2344293 ?auto_2344295 ) ) ( not ( = ?auto_2344293 ?auto_2344297 ) ) ( not ( = ?auto_2344293 ?auto_2344298 ) ) ( not ( = ?auto_2344293 ?auto_2344299 ) ) ( not ( = ?auto_2344293 ?auto_2344300 ) ) ( not ( = ?auto_2344293 ?auto_2344301 ) ) ( not ( = ?auto_2344293 ?auto_2344302 ) ) ( not ( = ?auto_2344293 ?auto_2344303 ) ) ( not ( = ?auto_2344293 ?auto_2344304 ) ) ( not ( = ?auto_2344293 ?auto_2344305 ) ) ( not ( = ?auto_2344293 ?auto_2344306 ) ) ( not ( = ?auto_2344293 ?auto_2344307 ) ) ( not ( = ?auto_2344293 ?auto_2344311 ) ) ( not ( = ?auto_2344294 ?auto_2344296 ) ) ( not ( = ?auto_2344294 ?auto_2344295 ) ) ( not ( = ?auto_2344294 ?auto_2344297 ) ) ( not ( = ?auto_2344294 ?auto_2344298 ) ) ( not ( = ?auto_2344294 ?auto_2344299 ) ) ( not ( = ?auto_2344294 ?auto_2344300 ) ) ( not ( = ?auto_2344294 ?auto_2344301 ) ) ( not ( = ?auto_2344294 ?auto_2344302 ) ) ( not ( = ?auto_2344294 ?auto_2344303 ) ) ( not ( = ?auto_2344294 ?auto_2344304 ) ) ( not ( = ?auto_2344294 ?auto_2344305 ) ) ( not ( = ?auto_2344294 ?auto_2344306 ) ) ( not ( = ?auto_2344294 ?auto_2344307 ) ) ( not ( = ?auto_2344294 ?auto_2344311 ) ) ( not ( = ?auto_2344296 ?auto_2344295 ) ) ( not ( = ?auto_2344296 ?auto_2344297 ) ) ( not ( = ?auto_2344296 ?auto_2344298 ) ) ( not ( = ?auto_2344296 ?auto_2344299 ) ) ( not ( = ?auto_2344296 ?auto_2344300 ) ) ( not ( = ?auto_2344296 ?auto_2344301 ) ) ( not ( = ?auto_2344296 ?auto_2344302 ) ) ( not ( = ?auto_2344296 ?auto_2344303 ) ) ( not ( = ?auto_2344296 ?auto_2344304 ) ) ( not ( = ?auto_2344296 ?auto_2344305 ) ) ( not ( = ?auto_2344296 ?auto_2344306 ) ) ( not ( = ?auto_2344296 ?auto_2344307 ) ) ( not ( = ?auto_2344296 ?auto_2344311 ) ) ( not ( = ?auto_2344295 ?auto_2344297 ) ) ( not ( = ?auto_2344295 ?auto_2344298 ) ) ( not ( = ?auto_2344295 ?auto_2344299 ) ) ( not ( = ?auto_2344295 ?auto_2344300 ) ) ( not ( = ?auto_2344295 ?auto_2344301 ) ) ( not ( = ?auto_2344295 ?auto_2344302 ) ) ( not ( = ?auto_2344295 ?auto_2344303 ) ) ( not ( = ?auto_2344295 ?auto_2344304 ) ) ( not ( = ?auto_2344295 ?auto_2344305 ) ) ( not ( = ?auto_2344295 ?auto_2344306 ) ) ( not ( = ?auto_2344295 ?auto_2344307 ) ) ( not ( = ?auto_2344295 ?auto_2344311 ) ) ( not ( = ?auto_2344297 ?auto_2344298 ) ) ( not ( = ?auto_2344297 ?auto_2344299 ) ) ( not ( = ?auto_2344297 ?auto_2344300 ) ) ( not ( = ?auto_2344297 ?auto_2344301 ) ) ( not ( = ?auto_2344297 ?auto_2344302 ) ) ( not ( = ?auto_2344297 ?auto_2344303 ) ) ( not ( = ?auto_2344297 ?auto_2344304 ) ) ( not ( = ?auto_2344297 ?auto_2344305 ) ) ( not ( = ?auto_2344297 ?auto_2344306 ) ) ( not ( = ?auto_2344297 ?auto_2344307 ) ) ( not ( = ?auto_2344297 ?auto_2344311 ) ) ( not ( = ?auto_2344298 ?auto_2344299 ) ) ( not ( = ?auto_2344298 ?auto_2344300 ) ) ( not ( = ?auto_2344298 ?auto_2344301 ) ) ( not ( = ?auto_2344298 ?auto_2344302 ) ) ( not ( = ?auto_2344298 ?auto_2344303 ) ) ( not ( = ?auto_2344298 ?auto_2344304 ) ) ( not ( = ?auto_2344298 ?auto_2344305 ) ) ( not ( = ?auto_2344298 ?auto_2344306 ) ) ( not ( = ?auto_2344298 ?auto_2344307 ) ) ( not ( = ?auto_2344298 ?auto_2344311 ) ) ( not ( = ?auto_2344299 ?auto_2344300 ) ) ( not ( = ?auto_2344299 ?auto_2344301 ) ) ( not ( = ?auto_2344299 ?auto_2344302 ) ) ( not ( = ?auto_2344299 ?auto_2344303 ) ) ( not ( = ?auto_2344299 ?auto_2344304 ) ) ( not ( = ?auto_2344299 ?auto_2344305 ) ) ( not ( = ?auto_2344299 ?auto_2344306 ) ) ( not ( = ?auto_2344299 ?auto_2344307 ) ) ( not ( = ?auto_2344299 ?auto_2344311 ) ) ( not ( = ?auto_2344300 ?auto_2344301 ) ) ( not ( = ?auto_2344300 ?auto_2344302 ) ) ( not ( = ?auto_2344300 ?auto_2344303 ) ) ( not ( = ?auto_2344300 ?auto_2344304 ) ) ( not ( = ?auto_2344300 ?auto_2344305 ) ) ( not ( = ?auto_2344300 ?auto_2344306 ) ) ( not ( = ?auto_2344300 ?auto_2344307 ) ) ( not ( = ?auto_2344300 ?auto_2344311 ) ) ( not ( = ?auto_2344301 ?auto_2344302 ) ) ( not ( = ?auto_2344301 ?auto_2344303 ) ) ( not ( = ?auto_2344301 ?auto_2344304 ) ) ( not ( = ?auto_2344301 ?auto_2344305 ) ) ( not ( = ?auto_2344301 ?auto_2344306 ) ) ( not ( = ?auto_2344301 ?auto_2344307 ) ) ( not ( = ?auto_2344301 ?auto_2344311 ) ) ( not ( = ?auto_2344302 ?auto_2344303 ) ) ( not ( = ?auto_2344302 ?auto_2344304 ) ) ( not ( = ?auto_2344302 ?auto_2344305 ) ) ( not ( = ?auto_2344302 ?auto_2344306 ) ) ( not ( = ?auto_2344302 ?auto_2344307 ) ) ( not ( = ?auto_2344302 ?auto_2344311 ) ) ( not ( = ?auto_2344303 ?auto_2344304 ) ) ( not ( = ?auto_2344303 ?auto_2344305 ) ) ( not ( = ?auto_2344303 ?auto_2344306 ) ) ( not ( = ?auto_2344303 ?auto_2344307 ) ) ( not ( = ?auto_2344303 ?auto_2344311 ) ) ( not ( = ?auto_2344304 ?auto_2344305 ) ) ( not ( = ?auto_2344304 ?auto_2344306 ) ) ( not ( = ?auto_2344304 ?auto_2344307 ) ) ( not ( = ?auto_2344304 ?auto_2344311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2344305 ?auto_2344306 ?auto_2344307 )
      ( MAKE-15CRATE-VERIFY ?auto_2344292 ?auto_2344293 ?auto_2344294 ?auto_2344296 ?auto_2344295 ?auto_2344297 ?auto_2344298 ?auto_2344299 ?auto_2344300 ?auto_2344301 ?auto_2344302 ?auto_2344303 ?auto_2344304 ?auto_2344305 ?auto_2344306 ?auto_2344307 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2344518 - SURFACE
      ?auto_2344519 - SURFACE
      ?auto_2344520 - SURFACE
      ?auto_2344522 - SURFACE
      ?auto_2344521 - SURFACE
      ?auto_2344523 - SURFACE
      ?auto_2344524 - SURFACE
      ?auto_2344525 - SURFACE
      ?auto_2344526 - SURFACE
      ?auto_2344527 - SURFACE
      ?auto_2344528 - SURFACE
      ?auto_2344529 - SURFACE
      ?auto_2344530 - SURFACE
      ?auto_2344531 - SURFACE
      ?auto_2344532 - SURFACE
      ?auto_2344533 - SURFACE
    )
    :vars
    (
      ?auto_2344538 - HOIST
      ?auto_2344539 - PLACE
      ?auto_2344535 - PLACE
      ?auto_2344537 - HOIST
      ?auto_2344536 - SURFACE
      ?auto_2344534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2344538 ?auto_2344539 ) ( IS-CRATE ?auto_2344533 ) ( not ( = ?auto_2344532 ?auto_2344533 ) ) ( not ( = ?auto_2344531 ?auto_2344532 ) ) ( not ( = ?auto_2344531 ?auto_2344533 ) ) ( not ( = ?auto_2344535 ?auto_2344539 ) ) ( HOIST-AT ?auto_2344537 ?auto_2344535 ) ( not ( = ?auto_2344538 ?auto_2344537 ) ) ( AVAILABLE ?auto_2344537 ) ( SURFACE-AT ?auto_2344533 ?auto_2344535 ) ( ON ?auto_2344533 ?auto_2344536 ) ( CLEAR ?auto_2344533 ) ( not ( = ?auto_2344532 ?auto_2344536 ) ) ( not ( = ?auto_2344533 ?auto_2344536 ) ) ( not ( = ?auto_2344531 ?auto_2344536 ) ) ( TRUCK-AT ?auto_2344534 ?auto_2344539 ) ( SURFACE-AT ?auto_2344531 ?auto_2344539 ) ( CLEAR ?auto_2344531 ) ( IS-CRATE ?auto_2344532 ) ( AVAILABLE ?auto_2344538 ) ( IN ?auto_2344532 ?auto_2344534 ) ( ON ?auto_2344519 ?auto_2344518 ) ( ON ?auto_2344520 ?auto_2344519 ) ( ON ?auto_2344522 ?auto_2344520 ) ( ON ?auto_2344521 ?auto_2344522 ) ( ON ?auto_2344523 ?auto_2344521 ) ( ON ?auto_2344524 ?auto_2344523 ) ( ON ?auto_2344525 ?auto_2344524 ) ( ON ?auto_2344526 ?auto_2344525 ) ( ON ?auto_2344527 ?auto_2344526 ) ( ON ?auto_2344528 ?auto_2344527 ) ( ON ?auto_2344529 ?auto_2344528 ) ( ON ?auto_2344530 ?auto_2344529 ) ( ON ?auto_2344531 ?auto_2344530 ) ( not ( = ?auto_2344518 ?auto_2344519 ) ) ( not ( = ?auto_2344518 ?auto_2344520 ) ) ( not ( = ?auto_2344518 ?auto_2344522 ) ) ( not ( = ?auto_2344518 ?auto_2344521 ) ) ( not ( = ?auto_2344518 ?auto_2344523 ) ) ( not ( = ?auto_2344518 ?auto_2344524 ) ) ( not ( = ?auto_2344518 ?auto_2344525 ) ) ( not ( = ?auto_2344518 ?auto_2344526 ) ) ( not ( = ?auto_2344518 ?auto_2344527 ) ) ( not ( = ?auto_2344518 ?auto_2344528 ) ) ( not ( = ?auto_2344518 ?auto_2344529 ) ) ( not ( = ?auto_2344518 ?auto_2344530 ) ) ( not ( = ?auto_2344518 ?auto_2344531 ) ) ( not ( = ?auto_2344518 ?auto_2344532 ) ) ( not ( = ?auto_2344518 ?auto_2344533 ) ) ( not ( = ?auto_2344518 ?auto_2344536 ) ) ( not ( = ?auto_2344519 ?auto_2344520 ) ) ( not ( = ?auto_2344519 ?auto_2344522 ) ) ( not ( = ?auto_2344519 ?auto_2344521 ) ) ( not ( = ?auto_2344519 ?auto_2344523 ) ) ( not ( = ?auto_2344519 ?auto_2344524 ) ) ( not ( = ?auto_2344519 ?auto_2344525 ) ) ( not ( = ?auto_2344519 ?auto_2344526 ) ) ( not ( = ?auto_2344519 ?auto_2344527 ) ) ( not ( = ?auto_2344519 ?auto_2344528 ) ) ( not ( = ?auto_2344519 ?auto_2344529 ) ) ( not ( = ?auto_2344519 ?auto_2344530 ) ) ( not ( = ?auto_2344519 ?auto_2344531 ) ) ( not ( = ?auto_2344519 ?auto_2344532 ) ) ( not ( = ?auto_2344519 ?auto_2344533 ) ) ( not ( = ?auto_2344519 ?auto_2344536 ) ) ( not ( = ?auto_2344520 ?auto_2344522 ) ) ( not ( = ?auto_2344520 ?auto_2344521 ) ) ( not ( = ?auto_2344520 ?auto_2344523 ) ) ( not ( = ?auto_2344520 ?auto_2344524 ) ) ( not ( = ?auto_2344520 ?auto_2344525 ) ) ( not ( = ?auto_2344520 ?auto_2344526 ) ) ( not ( = ?auto_2344520 ?auto_2344527 ) ) ( not ( = ?auto_2344520 ?auto_2344528 ) ) ( not ( = ?auto_2344520 ?auto_2344529 ) ) ( not ( = ?auto_2344520 ?auto_2344530 ) ) ( not ( = ?auto_2344520 ?auto_2344531 ) ) ( not ( = ?auto_2344520 ?auto_2344532 ) ) ( not ( = ?auto_2344520 ?auto_2344533 ) ) ( not ( = ?auto_2344520 ?auto_2344536 ) ) ( not ( = ?auto_2344522 ?auto_2344521 ) ) ( not ( = ?auto_2344522 ?auto_2344523 ) ) ( not ( = ?auto_2344522 ?auto_2344524 ) ) ( not ( = ?auto_2344522 ?auto_2344525 ) ) ( not ( = ?auto_2344522 ?auto_2344526 ) ) ( not ( = ?auto_2344522 ?auto_2344527 ) ) ( not ( = ?auto_2344522 ?auto_2344528 ) ) ( not ( = ?auto_2344522 ?auto_2344529 ) ) ( not ( = ?auto_2344522 ?auto_2344530 ) ) ( not ( = ?auto_2344522 ?auto_2344531 ) ) ( not ( = ?auto_2344522 ?auto_2344532 ) ) ( not ( = ?auto_2344522 ?auto_2344533 ) ) ( not ( = ?auto_2344522 ?auto_2344536 ) ) ( not ( = ?auto_2344521 ?auto_2344523 ) ) ( not ( = ?auto_2344521 ?auto_2344524 ) ) ( not ( = ?auto_2344521 ?auto_2344525 ) ) ( not ( = ?auto_2344521 ?auto_2344526 ) ) ( not ( = ?auto_2344521 ?auto_2344527 ) ) ( not ( = ?auto_2344521 ?auto_2344528 ) ) ( not ( = ?auto_2344521 ?auto_2344529 ) ) ( not ( = ?auto_2344521 ?auto_2344530 ) ) ( not ( = ?auto_2344521 ?auto_2344531 ) ) ( not ( = ?auto_2344521 ?auto_2344532 ) ) ( not ( = ?auto_2344521 ?auto_2344533 ) ) ( not ( = ?auto_2344521 ?auto_2344536 ) ) ( not ( = ?auto_2344523 ?auto_2344524 ) ) ( not ( = ?auto_2344523 ?auto_2344525 ) ) ( not ( = ?auto_2344523 ?auto_2344526 ) ) ( not ( = ?auto_2344523 ?auto_2344527 ) ) ( not ( = ?auto_2344523 ?auto_2344528 ) ) ( not ( = ?auto_2344523 ?auto_2344529 ) ) ( not ( = ?auto_2344523 ?auto_2344530 ) ) ( not ( = ?auto_2344523 ?auto_2344531 ) ) ( not ( = ?auto_2344523 ?auto_2344532 ) ) ( not ( = ?auto_2344523 ?auto_2344533 ) ) ( not ( = ?auto_2344523 ?auto_2344536 ) ) ( not ( = ?auto_2344524 ?auto_2344525 ) ) ( not ( = ?auto_2344524 ?auto_2344526 ) ) ( not ( = ?auto_2344524 ?auto_2344527 ) ) ( not ( = ?auto_2344524 ?auto_2344528 ) ) ( not ( = ?auto_2344524 ?auto_2344529 ) ) ( not ( = ?auto_2344524 ?auto_2344530 ) ) ( not ( = ?auto_2344524 ?auto_2344531 ) ) ( not ( = ?auto_2344524 ?auto_2344532 ) ) ( not ( = ?auto_2344524 ?auto_2344533 ) ) ( not ( = ?auto_2344524 ?auto_2344536 ) ) ( not ( = ?auto_2344525 ?auto_2344526 ) ) ( not ( = ?auto_2344525 ?auto_2344527 ) ) ( not ( = ?auto_2344525 ?auto_2344528 ) ) ( not ( = ?auto_2344525 ?auto_2344529 ) ) ( not ( = ?auto_2344525 ?auto_2344530 ) ) ( not ( = ?auto_2344525 ?auto_2344531 ) ) ( not ( = ?auto_2344525 ?auto_2344532 ) ) ( not ( = ?auto_2344525 ?auto_2344533 ) ) ( not ( = ?auto_2344525 ?auto_2344536 ) ) ( not ( = ?auto_2344526 ?auto_2344527 ) ) ( not ( = ?auto_2344526 ?auto_2344528 ) ) ( not ( = ?auto_2344526 ?auto_2344529 ) ) ( not ( = ?auto_2344526 ?auto_2344530 ) ) ( not ( = ?auto_2344526 ?auto_2344531 ) ) ( not ( = ?auto_2344526 ?auto_2344532 ) ) ( not ( = ?auto_2344526 ?auto_2344533 ) ) ( not ( = ?auto_2344526 ?auto_2344536 ) ) ( not ( = ?auto_2344527 ?auto_2344528 ) ) ( not ( = ?auto_2344527 ?auto_2344529 ) ) ( not ( = ?auto_2344527 ?auto_2344530 ) ) ( not ( = ?auto_2344527 ?auto_2344531 ) ) ( not ( = ?auto_2344527 ?auto_2344532 ) ) ( not ( = ?auto_2344527 ?auto_2344533 ) ) ( not ( = ?auto_2344527 ?auto_2344536 ) ) ( not ( = ?auto_2344528 ?auto_2344529 ) ) ( not ( = ?auto_2344528 ?auto_2344530 ) ) ( not ( = ?auto_2344528 ?auto_2344531 ) ) ( not ( = ?auto_2344528 ?auto_2344532 ) ) ( not ( = ?auto_2344528 ?auto_2344533 ) ) ( not ( = ?auto_2344528 ?auto_2344536 ) ) ( not ( = ?auto_2344529 ?auto_2344530 ) ) ( not ( = ?auto_2344529 ?auto_2344531 ) ) ( not ( = ?auto_2344529 ?auto_2344532 ) ) ( not ( = ?auto_2344529 ?auto_2344533 ) ) ( not ( = ?auto_2344529 ?auto_2344536 ) ) ( not ( = ?auto_2344530 ?auto_2344531 ) ) ( not ( = ?auto_2344530 ?auto_2344532 ) ) ( not ( = ?auto_2344530 ?auto_2344533 ) ) ( not ( = ?auto_2344530 ?auto_2344536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2344531 ?auto_2344532 ?auto_2344533 )
      ( MAKE-15CRATE-VERIFY ?auto_2344518 ?auto_2344519 ?auto_2344520 ?auto_2344522 ?auto_2344521 ?auto_2344523 ?auto_2344524 ?auto_2344525 ?auto_2344526 ?auto_2344527 ?auto_2344528 ?auto_2344529 ?auto_2344530 ?auto_2344531 ?auto_2344532 ?auto_2344533 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2365077 - SURFACE
      ?auto_2365078 - SURFACE
      ?auto_2365079 - SURFACE
      ?auto_2365081 - SURFACE
      ?auto_2365080 - SURFACE
      ?auto_2365082 - SURFACE
      ?auto_2365083 - SURFACE
      ?auto_2365084 - SURFACE
      ?auto_2365085 - SURFACE
      ?auto_2365086 - SURFACE
      ?auto_2365087 - SURFACE
      ?auto_2365088 - SURFACE
      ?auto_2365089 - SURFACE
      ?auto_2365090 - SURFACE
      ?auto_2365091 - SURFACE
      ?auto_2365092 - SURFACE
      ?auto_2365093 - SURFACE
    )
    :vars
    (
      ?auto_2365094 - HOIST
      ?auto_2365095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2365094 ?auto_2365095 ) ( SURFACE-AT ?auto_2365092 ?auto_2365095 ) ( CLEAR ?auto_2365092 ) ( LIFTING ?auto_2365094 ?auto_2365093 ) ( IS-CRATE ?auto_2365093 ) ( not ( = ?auto_2365092 ?auto_2365093 ) ) ( ON ?auto_2365078 ?auto_2365077 ) ( ON ?auto_2365079 ?auto_2365078 ) ( ON ?auto_2365081 ?auto_2365079 ) ( ON ?auto_2365080 ?auto_2365081 ) ( ON ?auto_2365082 ?auto_2365080 ) ( ON ?auto_2365083 ?auto_2365082 ) ( ON ?auto_2365084 ?auto_2365083 ) ( ON ?auto_2365085 ?auto_2365084 ) ( ON ?auto_2365086 ?auto_2365085 ) ( ON ?auto_2365087 ?auto_2365086 ) ( ON ?auto_2365088 ?auto_2365087 ) ( ON ?auto_2365089 ?auto_2365088 ) ( ON ?auto_2365090 ?auto_2365089 ) ( ON ?auto_2365091 ?auto_2365090 ) ( ON ?auto_2365092 ?auto_2365091 ) ( not ( = ?auto_2365077 ?auto_2365078 ) ) ( not ( = ?auto_2365077 ?auto_2365079 ) ) ( not ( = ?auto_2365077 ?auto_2365081 ) ) ( not ( = ?auto_2365077 ?auto_2365080 ) ) ( not ( = ?auto_2365077 ?auto_2365082 ) ) ( not ( = ?auto_2365077 ?auto_2365083 ) ) ( not ( = ?auto_2365077 ?auto_2365084 ) ) ( not ( = ?auto_2365077 ?auto_2365085 ) ) ( not ( = ?auto_2365077 ?auto_2365086 ) ) ( not ( = ?auto_2365077 ?auto_2365087 ) ) ( not ( = ?auto_2365077 ?auto_2365088 ) ) ( not ( = ?auto_2365077 ?auto_2365089 ) ) ( not ( = ?auto_2365077 ?auto_2365090 ) ) ( not ( = ?auto_2365077 ?auto_2365091 ) ) ( not ( = ?auto_2365077 ?auto_2365092 ) ) ( not ( = ?auto_2365077 ?auto_2365093 ) ) ( not ( = ?auto_2365078 ?auto_2365079 ) ) ( not ( = ?auto_2365078 ?auto_2365081 ) ) ( not ( = ?auto_2365078 ?auto_2365080 ) ) ( not ( = ?auto_2365078 ?auto_2365082 ) ) ( not ( = ?auto_2365078 ?auto_2365083 ) ) ( not ( = ?auto_2365078 ?auto_2365084 ) ) ( not ( = ?auto_2365078 ?auto_2365085 ) ) ( not ( = ?auto_2365078 ?auto_2365086 ) ) ( not ( = ?auto_2365078 ?auto_2365087 ) ) ( not ( = ?auto_2365078 ?auto_2365088 ) ) ( not ( = ?auto_2365078 ?auto_2365089 ) ) ( not ( = ?auto_2365078 ?auto_2365090 ) ) ( not ( = ?auto_2365078 ?auto_2365091 ) ) ( not ( = ?auto_2365078 ?auto_2365092 ) ) ( not ( = ?auto_2365078 ?auto_2365093 ) ) ( not ( = ?auto_2365079 ?auto_2365081 ) ) ( not ( = ?auto_2365079 ?auto_2365080 ) ) ( not ( = ?auto_2365079 ?auto_2365082 ) ) ( not ( = ?auto_2365079 ?auto_2365083 ) ) ( not ( = ?auto_2365079 ?auto_2365084 ) ) ( not ( = ?auto_2365079 ?auto_2365085 ) ) ( not ( = ?auto_2365079 ?auto_2365086 ) ) ( not ( = ?auto_2365079 ?auto_2365087 ) ) ( not ( = ?auto_2365079 ?auto_2365088 ) ) ( not ( = ?auto_2365079 ?auto_2365089 ) ) ( not ( = ?auto_2365079 ?auto_2365090 ) ) ( not ( = ?auto_2365079 ?auto_2365091 ) ) ( not ( = ?auto_2365079 ?auto_2365092 ) ) ( not ( = ?auto_2365079 ?auto_2365093 ) ) ( not ( = ?auto_2365081 ?auto_2365080 ) ) ( not ( = ?auto_2365081 ?auto_2365082 ) ) ( not ( = ?auto_2365081 ?auto_2365083 ) ) ( not ( = ?auto_2365081 ?auto_2365084 ) ) ( not ( = ?auto_2365081 ?auto_2365085 ) ) ( not ( = ?auto_2365081 ?auto_2365086 ) ) ( not ( = ?auto_2365081 ?auto_2365087 ) ) ( not ( = ?auto_2365081 ?auto_2365088 ) ) ( not ( = ?auto_2365081 ?auto_2365089 ) ) ( not ( = ?auto_2365081 ?auto_2365090 ) ) ( not ( = ?auto_2365081 ?auto_2365091 ) ) ( not ( = ?auto_2365081 ?auto_2365092 ) ) ( not ( = ?auto_2365081 ?auto_2365093 ) ) ( not ( = ?auto_2365080 ?auto_2365082 ) ) ( not ( = ?auto_2365080 ?auto_2365083 ) ) ( not ( = ?auto_2365080 ?auto_2365084 ) ) ( not ( = ?auto_2365080 ?auto_2365085 ) ) ( not ( = ?auto_2365080 ?auto_2365086 ) ) ( not ( = ?auto_2365080 ?auto_2365087 ) ) ( not ( = ?auto_2365080 ?auto_2365088 ) ) ( not ( = ?auto_2365080 ?auto_2365089 ) ) ( not ( = ?auto_2365080 ?auto_2365090 ) ) ( not ( = ?auto_2365080 ?auto_2365091 ) ) ( not ( = ?auto_2365080 ?auto_2365092 ) ) ( not ( = ?auto_2365080 ?auto_2365093 ) ) ( not ( = ?auto_2365082 ?auto_2365083 ) ) ( not ( = ?auto_2365082 ?auto_2365084 ) ) ( not ( = ?auto_2365082 ?auto_2365085 ) ) ( not ( = ?auto_2365082 ?auto_2365086 ) ) ( not ( = ?auto_2365082 ?auto_2365087 ) ) ( not ( = ?auto_2365082 ?auto_2365088 ) ) ( not ( = ?auto_2365082 ?auto_2365089 ) ) ( not ( = ?auto_2365082 ?auto_2365090 ) ) ( not ( = ?auto_2365082 ?auto_2365091 ) ) ( not ( = ?auto_2365082 ?auto_2365092 ) ) ( not ( = ?auto_2365082 ?auto_2365093 ) ) ( not ( = ?auto_2365083 ?auto_2365084 ) ) ( not ( = ?auto_2365083 ?auto_2365085 ) ) ( not ( = ?auto_2365083 ?auto_2365086 ) ) ( not ( = ?auto_2365083 ?auto_2365087 ) ) ( not ( = ?auto_2365083 ?auto_2365088 ) ) ( not ( = ?auto_2365083 ?auto_2365089 ) ) ( not ( = ?auto_2365083 ?auto_2365090 ) ) ( not ( = ?auto_2365083 ?auto_2365091 ) ) ( not ( = ?auto_2365083 ?auto_2365092 ) ) ( not ( = ?auto_2365083 ?auto_2365093 ) ) ( not ( = ?auto_2365084 ?auto_2365085 ) ) ( not ( = ?auto_2365084 ?auto_2365086 ) ) ( not ( = ?auto_2365084 ?auto_2365087 ) ) ( not ( = ?auto_2365084 ?auto_2365088 ) ) ( not ( = ?auto_2365084 ?auto_2365089 ) ) ( not ( = ?auto_2365084 ?auto_2365090 ) ) ( not ( = ?auto_2365084 ?auto_2365091 ) ) ( not ( = ?auto_2365084 ?auto_2365092 ) ) ( not ( = ?auto_2365084 ?auto_2365093 ) ) ( not ( = ?auto_2365085 ?auto_2365086 ) ) ( not ( = ?auto_2365085 ?auto_2365087 ) ) ( not ( = ?auto_2365085 ?auto_2365088 ) ) ( not ( = ?auto_2365085 ?auto_2365089 ) ) ( not ( = ?auto_2365085 ?auto_2365090 ) ) ( not ( = ?auto_2365085 ?auto_2365091 ) ) ( not ( = ?auto_2365085 ?auto_2365092 ) ) ( not ( = ?auto_2365085 ?auto_2365093 ) ) ( not ( = ?auto_2365086 ?auto_2365087 ) ) ( not ( = ?auto_2365086 ?auto_2365088 ) ) ( not ( = ?auto_2365086 ?auto_2365089 ) ) ( not ( = ?auto_2365086 ?auto_2365090 ) ) ( not ( = ?auto_2365086 ?auto_2365091 ) ) ( not ( = ?auto_2365086 ?auto_2365092 ) ) ( not ( = ?auto_2365086 ?auto_2365093 ) ) ( not ( = ?auto_2365087 ?auto_2365088 ) ) ( not ( = ?auto_2365087 ?auto_2365089 ) ) ( not ( = ?auto_2365087 ?auto_2365090 ) ) ( not ( = ?auto_2365087 ?auto_2365091 ) ) ( not ( = ?auto_2365087 ?auto_2365092 ) ) ( not ( = ?auto_2365087 ?auto_2365093 ) ) ( not ( = ?auto_2365088 ?auto_2365089 ) ) ( not ( = ?auto_2365088 ?auto_2365090 ) ) ( not ( = ?auto_2365088 ?auto_2365091 ) ) ( not ( = ?auto_2365088 ?auto_2365092 ) ) ( not ( = ?auto_2365088 ?auto_2365093 ) ) ( not ( = ?auto_2365089 ?auto_2365090 ) ) ( not ( = ?auto_2365089 ?auto_2365091 ) ) ( not ( = ?auto_2365089 ?auto_2365092 ) ) ( not ( = ?auto_2365089 ?auto_2365093 ) ) ( not ( = ?auto_2365090 ?auto_2365091 ) ) ( not ( = ?auto_2365090 ?auto_2365092 ) ) ( not ( = ?auto_2365090 ?auto_2365093 ) ) ( not ( = ?auto_2365091 ?auto_2365092 ) ) ( not ( = ?auto_2365091 ?auto_2365093 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2365092 ?auto_2365093 )
      ( MAKE-16CRATE-VERIFY ?auto_2365077 ?auto_2365078 ?auto_2365079 ?auto_2365081 ?auto_2365080 ?auto_2365082 ?auto_2365083 ?auto_2365084 ?auto_2365085 ?auto_2365086 ?auto_2365087 ?auto_2365088 ?auto_2365089 ?auto_2365090 ?auto_2365091 ?auto_2365092 ?auto_2365093 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2365276 - SURFACE
      ?auto_2365277 - SURFACE
      ?auto_2365278 - SURFACE
      ?auto_2365280 - SURFACE
      ?auto_2365279 - SURFACE
      ?auto_2365281 - SURFACE
      ?auto_2365282 - SURFACE
      ?auto_2365283 - SURFACE
      ?auto_2365284 - SURFACE
      ?auto_2365285 - SURFACE
      ?auto_2365286 - SURFACE
      ?auto_2365287 - SURFACE
      ?auto_2365288 - SURFACE
      ?auto_2365289 - SURFACE
      ?auto_2365290 - SURFACE
      ?auto_2365291 - SURFACE
      ?auto_2365292 - SURFACE
    )
    :vars
    (
      ?auto_2365295 - HOIST
      ?auto_2365294 - PLACE
      ?auto_2365293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2365295 ?auto_2365294 ) ( SURFACE-AT ?auto_2365291 ?auto_2365294 ) ( CLEAR ?auto_2365291 ) ( IS-CRATE ?auto_2365292 ) ( not ( = ?auto_2365291 ?auto_2365292 ) ) ( TRUCK-AT ?auto_2365293 ?auto_2365294 ) ( AVAILABLE ?auto_2365295 ) ( IN ?auto_2365292 ?auto_2365293 ) ( ON ?auto_2365291 ?auto_2365290 ) ( not ( = ?auto_2365290 ?auto_2365291 ) ) ( not ( = ?auto_2365290 ?auto_2365292 ) ) ( ON ?auto_2365277 ?auto_2365276 ) ( ON ?auto_2365278 ?auto_2365277 ) ( ON ?auto_2365280 ?auto_2365278 ) ( ON ?auto_2365279 ?auto_2365280 ) ( ON ?auto_2365281 ?auto_2365279 ) ( ON ?auto_2365282 ?auto_2365281 ) ( ON ?auto_2365283 ?auto_2365282 ) ( ON ?auto_2365284 ?auto_2365283 ) ( ON ?auto_2365285 ?auto_2365284 ) ( ON ?auto_2365286 ?auto_2365285 ) ( ON ?auto_2365287 ?auto_2365286 ) ( ON ?auto_2365288 ?auto_2365287 ) ( ON ?auto_2365289 ?auto_2365288 ) ( ON ?auto_2365290 ?auto_2365289 ) ( not ( = ?auto_2365276 ?auto_2365277 ) ) ( not ( = ?auto_2365276 ?auto_2365278 ) ) ( not ( = ?auto_2365276 ?auto_2365280 ) ) ( not ( = ?auto_2365276 ?auto_2365279 ) ) ( not ( = ?auto_2365276 ?auto_2365281 ) ) ( not ( = ?auto_2365276 ?auto_2365282 ) ) ( not ( = ?auto_2365276 ?auto_2365283 ) ) ( not ( = ?auto_2365276 ?auto_2365284 ) ) ( not ( = ?auto_2365276 ?auto_2365285 ) ) ( not ( = ?auto_2365276 ?auto_2365286 ) ) ( not ( = ?auto_2365276 ?auto_2365287 ) ) ( not ( = ?auto_2365276 ?auto_2365288 ) ) ( not ( = ?auto_2365276 ?auto_2365289 ) ) ( not ( = ?auto_2365276 ?auto_2365290 ) ) ( not ( = ?auto_2365276 ?auto_2365291 ) ) ( not ( = ?auto_2365276 ?auto_2365292 ) ) ( not ( = ?auto_2365277 ?auto_2365278 ) ) ( not ( = ?auto_2365277 ?auto_2365280 ) ) ( not ( = ?auto_2365277 ?auto_2365279 ) ) ( not ( = ?auto_2365277 ?auto_2365281 ) ) ( not ( = ?auto_2365277 ?auto_2365282 ) ) ( not ( = ?auto_2365277 ?auto_2365283 ) ) ( not ( = ?auto_2365277 ?auto_2365284 ) ) ( not ( = ?auto_2365277 ?auto_2365285 ) ) ( not ( = ?auto_2365277 ?auto_2365286 ) ) ( not ( = ?auto_2365277 ?auto_2365287 ) ) ( not ( = ?auto_2365277 ?auto_2365288 ) ) ( not ( = ?auto_2365277 ?auto_2365289 ) ) ( not ( = ?auto_2365277 ?auto_2365290 ) ) ( not ( = ?auto_2365277 ?auto_2365291 ) ) ( not ( = ?auto_2365277 ?auto_2365292 ) ) ( not ( = ?auto_2365278 ?auto_2365280 ) ) ( not ( = ?auto_2365278 ?auto_2365279 ) ) ( not ( = ?auto_2365278 ?auto_2365281 ) ) ( not ( = ?auto_2365278 ?auto_2365282 ) ) ( not ( = ?auto_2365278 ?auto_2365283 ) ) ( not ( = ?auto_2365278 ?auto_2365284 ) ) ( not ( = ?auto_2365278 ?auto_2365285 ) ) ( not ( = ?auto_2365278 ?auto_2365286 ) ) ( not ( = ?auto_2365278 ?auto_2365287 ) ) ( not ( = ?auto_2365278 ?auto_2365288 ) ) ( not ( = ?auto_2365278 ?auto_2365289 ) ) ( not ( = ?auto_2365278 ?auto_2365290 ) ) ( not ( = ?auto_2365278 ?auto_2365291 ) ) ( not ( = ?auto_2365278 ?auto_2365292 ) ) ( not ( = ?auto_2365280 ?auto_2365279 ) ) ( not ( = ?auto_2365280 ?auto_2365281 ) ) ( not ( = ?auto_2365280 ?auto_2365282 ) ) ( not ( = ?auto_2365280 ?auto_2365283 ) ) ( not ( = ?auto_2365280 ?auto_2365284 ) ) ( not ( = ?auto_2365280 ?auto_2365285 ) ) ( not ( = ?auto_2365280 ?auto_2365286 ) ) ( not ( = ?auto_2365280 ?auto_2365287 ) ) ( not ( = ?auto_2365280 ?auto_2365288 ) ) ( not ( = ?auto_2365280 ?auto_2365289 ) ) ( not ( = ?auto_2365280 ?auto_2365290 ) ) ( not ( = ?auto_2365280 ?auto_2365291 ) ) ( not ( = ?auto_2365280 ?auto_2365292 ) ) ( not ( = ?auto_2365279 ?auto_2365281 ) ) ( not ( = ?auto_2365279 ?auto_2365282 ) ) ( not ( = ?auto_2365279 ?auto_2365283 ) ) ( not ( = ?auto_2365279 ?auto_2365284 ) ) ( not ( = ?auto_2365279 ?auto_2365285 ) ) ( not ( = ?auto_2365279 ?auto_2365286 ) ) ( not ( = ?auto_2365279 ?auto_2365287 ) ) ( not ( = ?auto_2365279 ?auto_2365288 ) ) ( not ( = ?auto_2365279 ?auto_2365289 ) ) ( not ( = ?auto_2365279 ?auto_2365290 ) ) ( not ( = ?auto_2365279 ?auto_2365291 ) ) ( not ( = ?auto_2365279 ?auto_2365292 ) ) ( not ( = ?auto_2365281 ?auto_2365282 ) ) ( not ( = ?auto_2365281 ?auto_2365283 ) ) ( not ( = ?auto_2365281 ?auto_2365284 ) ) ( not ( = ?auto_2365281 ?auto_2365285 ) ) ( not ( = ?auto_2365281 ?auto_2365286 ) ) ( not ( = ?auto_2365281 ?auto_2365287 ) ) ( not ( = ?auto_2365281 ?auto_2365288 ) ) ( not ( = ?auto_2365281 ?auto_2365289 ) ) ( not ( = ?auto_2365281 ?auto_2365290 ) ) ( not ( = ?auto_2365281 ?auto_2365291 ) ) ( not ( = ?auto_2365281 ?auto_2365292 ) ) ( not ( = ?auto_2365282 ?auto_2365283 ) ) ( not ( = ?auto_2365282 ?auto_2365284 ) ) ( not ( = ?auto_2365282 ?auto_2365285 ) ) ( not ( = ?auto_2365282 ?auto_2365286 ) ) ( not ( = ?auto_2365282 ?auto_2365287 ) ) ( not ( = ?auto_2365282 ?auto_2365288 ) ) ( not ( = ?auto_2365282 ?auto_2365289 ) ) ( not ( = ?auto_2365282 ?auto_2365290 ) ) ( not ( = ?auto_2365282 ?auto_2365291 ) ) ( not ( = ?auto_2365282 ?auto_2365292 ) ) ( not ( = ?auto_2365283 ?auto_2365284 ) ) ( not ( = ?auto_2365283 ?auto_2365285 ) ) ( not ( = ?auto_2365283 ?auto_2365286 ) ) ( not ( = ?auto_2365283 ?auto_2365287 ) ) ( not ( = ?auto_2365283 ?auto_2365288 ) ) ( not ( = ?auto_2365283 ?auto_2365289 ) ) ( not ( = ?auto_2365283 ?auto_2365290 ) ) ( not ( = ?auto_2365283 ?auto_2365291 ) ) ( not ( = ?auto_2365283 ?auto_2365292 ) ) ( not ( = ?auto_2365284 ?auto_2365285 ) ) ( not ( = ?auto_2365284 ?auto_2365286 ) ) ( not ( = ?auto_2365284 ?auto_2365287 ) ) ( not ( = ?auto_2365284 ?auto_2365288 ) ) ( not ( = ?auto_2365284 ?auto_2365289 ) ) ( not ( = ?auto_2365284 ?auto_2365290 ) ) ( not ( = ?auto_2365284 ?auto_2365291 ) ) ( not ( = ?auto_2365284 ?auto_2365292 ) ) ( not ( = ?auto_2365285 ?auto_2365286 ) ) ( not ( = ?auto_2365285 ?auto_2365287 ) ) ( not ( = ?auto_2365285 ?auto_2365288 ) ) ( not ( = ?auto_2365285 ?auto_2365289 ) ) ( not ( = ?auto_2365285 ?auto_2365290 ) ) ( not ( = ?auto_2365285 ?auto_2365291 ) ) ( not ( = ?auto_2365285 ?auto_2365292 ) ) ( not ( = ?auto_2365286 ?auto_2365287 ) ) ( not ( = ?auto_2365286 ?auto_2365288 ) ) ( not ( = ?auto_2365286 ?auto_2365289 ) ) ( not ( = ?auto_2365286 ?auto_2365290 ) ) ( not ( = ?auto_2365286 ?auto_2365291 ) ) ( not ( = ?auto_2365286 ?auto_2365292 ) ) ( not ( = ?auto_2365287 ?auto_2365288 ) ) ( not ( = ?auto_2365287 ?auto_2365289 ) ) ( not ( = ?auto_2365287 ?auto_2365290 ) ) ( not ( = ?auto_2365287 ?auto_2365291 ) ) ( not ( = ?auto_2365287 ?auto_2365292 ) ) ( not ( = ?auto_2365288 ?auto_2365289 ) ) ( not ( = ?auto_2365288 ?auto_2365290 ) ) ( not ( = ?auto_2365288 ?auto_2365291 ) ) ( not ( = ?auto_2365288 ?auto_2365292 ) ) ( not ( = ?auto_2365289 ?auto_2365290 ) ) ( not ( = ?auto_2365289 ?auto_2365291 ) ) ( not ( = ?auto_2365289 ?auto_2365292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2365290 ?auto_2365291 ?auto_2365292 )
      ( MAKE-16CRATE-VERIFY ?auto_2365276 ?auto_2365277 ?auto_2365278 ?auto_2365280 ?auto_2365279 ?auto_2365281 ?auto_2365282 ?auto_2365283 ?auto_2365284 ?auto_2365285 ?auto_2365286 ?auto_2365287 ?auto_2365288 ?auto_2365289 ?auto_2365290 ?auto_2365291 ?auto_2365292 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2365492 - SURFACE
      ?auto_2365493 - SURFACE
      ?auto_2365494 - SURFACE
      ?auto_2365496 - SURFACE
      ?auto_2365495 - SURFACE
      ?auto_2365497 - SURFACE
      ?auto_2365498 - SURFACE
      ?auto_2365499 - SURFACE
      ?auto_2365500 - SURFACE
      ?auto_2365501 - SURFACE
      ?auto_2365502 - SURFACE
      ?auto_2365503 - SURFACE
      ?auto_2365504 - SURFACE
      ?auto_2365505 - SURFACE
      ?auto_2365506 - SURFACE
      ?auto_2365507 - SURFACE
      ?auto_2365508 - SURFACE
    )
    :vars
    (
      ?auto_2365512 - HOIST
      ?auto_2365511 - PLACE
      ?auto_2365509 - TRUCK
      ?auto_2365510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2365512 ?auto_2365511 ) ( SURFACE-AT ?auto_2365507 ?auto_2365511 ) ( CLEAR ?auto_2365507 ) ( IS-CRATE ?auto_2365508 ) ( not ( = ?auto_2365507 ?auto_2365508 ) ) ( AVAILABLE ?auto_2365512 ) ( IN ?auto_2365508 ?auto_2365509 ) ( ON ?auto_2365507 ?auto_2365506 ) ( not ( = ?auto_2365506 ?auto_2365507 ) ) ( not ( = ?auto_2365506 ?auto_2365508 ) ) ( TRUCK-AT ?auto_2365509 ?auto_2365510 ) ( not ( = ?auto_2365510 ?auto_2365511 ) ) ( ON ?auto_2365493 ?auto_2365492 ) ( ON ?auto_2365494 ?auto_2365493 ) ( ON ?auto_2365496 ?auto_2365494 ) ( ON ?auto_2365495 ?auto_2365496 ) ( ON ?auto_2365497 ?auto_2365495 ) ( ON ?auto_2365498 ?auto_2365497 ) ( ON ?auto_2365499 ?auto_2365498 ) ( ON ?auto_2365500 ?auto_2365499 ) ( ON ?auto_2365501 ?auto_2365500 ) ( ON ?auto_2365502 ?auto_2365501 ) ( ON ?auto_2365503 ?auto_2365502 ) ( ON ?auto_2365504 ?auto_2365503 ) ( ON ?auto_2365505 ?auto_2365504 ) ( ON ?auto_2365506 ?auto_2365505 ) ( not ( = ?auto_2365492 ?auto_2365493 ) ) ( not ( = ?auto_2365492 ?auto_2365494 ) ) ( not ( = ?auto_2365492 ?auto_2365496 ) ) ( not ( = ?auto_2365492 ?auto_2365495 ) ) ( not ( = ?auto_2365492 ?auto_2365497 ) ) ( not ( = ?auto_2365492 ?auto_2365498 ) ) ( not ( = ?auto_2365492 ?auto_2365499 ) ) ( not ( = ?auto_2365492 ?auto_2365500 ) ) ( not ( = ?auto_2365492 ?auto_2365501 ) ) ( not ( = ?auto_2365492 ?auto_2365502 ) ) ( not ( = ?auto_2365492 ?auto_2365503 ) ) ( not ( = ?auto_2365492 ?auto_2365504 ) ) ( not ( = ?auto_2365492 ?auto_2365505 ) ) ( not ( = ?auto_2365492 ?auto_2365506 ) ) ( not ( = ?auto_2365492 ?auto_2365507 ) ) ( not ( = ?auto_2365492 ?auto_2365508 ) ) ( not ( = ?auto_2365493 ?auto_2365494 ) ) ( not ( = ?auto_2365493 ?auto_2365496 ) ) ( not ( = ?auto_2365493 ?auto_2365495 ) ) ( not ( = ?auto_2365493 ?auto_2365497 ) ) ( not ( = ?auto_2365493 ?auto_2365498 ) ) ( not ( = ?auto_2365493 ?auto_2365499 ) ) ( not ( = ?auto_2365493 ?auto_2365500 ) ) ( not ( = ?auto_2365493 ?auto_2365501 ) ) ( not ( = ?auto_2365493 ?auto_2365502 ) ) ( not ( = ?auto_2365493 ?auto_2365503 ) ) ( not ( = ?auto_2365493 ?auto_2365504 ) ) ( not ( = ?auto_2365493 ?auto_2365505 ) ) ( not ( = ?auto_2365493 ?auto_2365506 ) ) ( not ( = ?auto_2365493 ?auto_2365507 ) ) ( not ( = ?auto_2365493 ?auto_2365508 ) ) ( not ( = ?auto_2365494 ?auto_2365496 ) ) ( not ( = ?auto_2365494 ?auto_2365495 ) ) ( not ( = ?auto_2365494 ?auto_2365497 ) ) ( not ( = ?auto_2365494 ?auto_2365498 ) ) ( not ( = ?auto_2365494 ?auto_2365499 ) ) ( not ( = ?auto_2365494 ?auto_2365500 ) ) ( not ( = ?auto_2365494 ?auto_2365501 ) ) ( not ( = ?auto_2365494 ?auto_2365502 ) ) ( not ( = ?auto_2365494 ?auto_2365503 ) ) ( not ( = ?auto_2365494 ?auto_2365504 ) ) ( not ( = ?auto_2365494 ?auto_2365505 ) ) ( not ( = ?auto_2365494 ?auto_2365506 ) ) ( not ( = ?auto_2365494 ?auto_2365507 ) ) ( not ( = ?auto_2365494 ?auto_2365508 ) ) ( not ( = ?auto_2365496 ?auto_2365495 ) ) ( not ( = ?auto_2365496 ?auto_2365497 ) ) ( not ( = ?auto_2365496 ?auto_2365498 ) ) ( not ( = ?auto_2365496 ?auto_2365499 ) ) ( not ( = ?auto_2365496 ?auto_2365500 ) ) ( not ( = ?auto_2365496 ?auto_2365501 ) ) ( not ( = ?auto_2365496 ?auto_2365502 ) ) ( not ( = ?auto_2365496 ?auto_2365503 ) ) ( not ( = ?auto_2365496 ?auto_2365504 ) ) ( not ( = ?auto_2365496 ?auto_2365505 ) ) ( not ( = ?auto_2365496 ?auto_2365506 ) ) ( not ( = ?auto_2365496 ?auto_2365507 ) ) ( not ( = ?auto_2365496 ?auto_2365508 ) ) ( not ( = ?auto_2365495 ?auto_2365497 ) ) ( not ( = ?auto_2365495 ?auto_2365498 ) ) ( not ( = ?auto_2365495 ?auto_2365499 ) ) ( not ( = ?auto_2365495 ?auto_2365500 ) ) ( not ( = ?auto_2365495 ?auto_2365501 ) ) ( not ( = ?auto_2365495 ?auto_2365502 ) ) ( not ( = ?auto_2365495 ?auto_2365503 ) ) ( not ( = ?auto_2365495 ?auto_2365504 ) ) ( not ( = ?auto_2365495 ?auto_2365505 ) ) ( not ( = ?auto_2365495 ?auto_2365506 ) ) ( not ( = ?auto_2365495 ?auto_2365507 ) ) ( not ( = ?auto_2365495 ?auto_2365508 ) ) ( not ( = ?auto_2365497 ?auto_2365498 ) ) ( not ( = ?auto_2365497 ?auto_2365499 ) ) ( not ( = ?auto_2365497 ?auto_2365500 ) ) ( not ( = ?auto_2365497 ?auto_2365501 ) ) ( not ( = ?auto_2365497 ?auto_2365502 ) ) ( not ( = ?auto_2365497 ?auto_2365503 ) ) ( not ( = ?auto_2365497 ?auto_2365504 ) ) ( not ( = ?auto_2365497 ?auto_2365505 ) ) ( not ( = ?auto_2365497 ?auto_2365506 ) ) ( not ( = ?auto_2365497 ?auto_2365507 ) ) ( not ( = ?auto_2365497 ?auto_2365508 ) ) ( not ( = ?auto_2365498 ?auto_2365499 ) ) ( not ( = ?auto_2365498 ?auto_2365500 ) ) ( not ( = ?auto_2365498 ?auto_2365501 ) ) ( not ( = ?auto_2365498 ?auto_2365502 ) ) ( not ( = ?auto_2365498 ?auto_2365503 ) ) ( not ( = ?auto_2365498 ?auto_2365504 ) ) ( not ( = ?auto_2365498 ?auto_2365505 ) ) ( not ( = ?auto_2365498 ?auto_2365506 ) ) ( not ( = ?auto_2365498 ?auto_2365507 ) ) ( not ( = ?auto_2365498 ?auto_2365508 ) ) ( not ( = ?auto_2365499 ?auto_2365500 ) ) ( not ( = ?auto_2365499 ?auto_2365501 ) ) ( not ( = ?auto_2365499 ?auto_2365502 ) ) ( not ( = ?auto_2365499 ?auto_2365503 ) ) ( not ( = ?auto_2365499 ?auto_2365504 ) ) ( not ( = ?auto_2365499 ?auto_2365505 ) ) ( not ( = ?auto_2365499 ?auto_2365506 ) ) ( not ( = ?auto_2365499 ?auto_2365507 ) ) ( not ( = ?auto_2365499 ?auto_2365508 ) ) ( not ( = ?auto_2365500 ?auto_2365501 ) ) ( not ( = ?auto_2365500 ?auto_2365502 ) ) ( not ( = ?auto_2365500 ?auto_2365503 ) ) ( not ( = ?auto_2365500 ?auto_2365504 ) ) ( not ( = ?auto_2365500 ?auto_2365505 ) ) ( not ( = ?auto_2365500 ?auto_2365506 ) ) ( not ( = ?auto_2365500 ?auto_2365507 ) ) ( not ( = ?auto_2365500 ?auto_2365508 ) ) ( not ( = ?auto_2365501 ?auto_2365502 ) ) ( not ( = ?auto_2365501 ?auto_2365503 ) ) ( not ( = ?auto_2365501 ?auto_2365504 ) ) ( not ( = ?auto_2365501 ?auto_2365505 ) ) ( not ( = ?auto_2365501 ?auto_2365506 ) ) ( not ( = ?auto_2365501 ?auto_2365507 ) ) ( not ( = ?auto_2365501 ?auto_2365508 ) ) ( not ( = ?auto_2365502 ?auto_2365503 ) ) ( not ( = ?auto_2365502 ?auto_2365504 ) ) ( not ( = ?auto_2365502 ?auto_2365505 ) ) ( not ( = ?auto_2365502 ?auto_2365506 ) ) ( not ( = ?auto_2365502 ?auto_2365507 ) ) ( not ( = ?auto_2365502 ?auto_2365508 ) ) ( not ( = ?auto_2365503 ?auto_2365504 ) ) ( not ( = ?auto_2365503 ?auto_2365505 ) ) ( not ( = ?auto_2365503 ?auto_2365506 ) ) ( not ( = ?auto_2365503 ?auto_2365507 ) ) ( not ( = ?auto_2365503 ?auto_2365508 ) ) ( not ( = ?auto_2365504 ?auto_2365505 ) ) ( not ( = ?auto_2365504 ?auto_2365506 ) ) ( not ( = ?auto_2365504 ?auto_2365507 ) ) ( not ( = ?auto_2365504 ?auto_2365508 ) ) ( not ( = ?auto_2365505 ?auto_2365506 ) ) ( not ( = ?auto_2365505 ?auto_2365507 ) ) ( not ( = ?auto_2365505 ?auto_2365508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2365506 ?auto_2365507 ?auto_2365508 )
      ( MAKE-16CRATE-VERIFY ?auto_2365492 ?auto_2365493 ?auto_2365494 ?auto_2365496 ?auto_2365495 ?auto_2365497 ?auto_2365498 ?auto_2365499 ?auto_2365500 ?auto_2365501 ?auto_2365502 ?auto_2365503 ?auto_2365504 ?auto_2365505 ?auto_2365506 ?auto_2365507 ?auto_2365508 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2365724 - SURFACE
      ?auto_2365725 - SURFACE
      ?auto_2365726 - SURFACE
      ?auto_2365728 - SURFACE
      ?auto_2365727 - SURFACE
      ?auto_2365729 - SURFACE
      ?auto_2365730 - SURFACE
      ?auto_2365731 - SURFACE
      ?auto_2365732 - SURFACE
      ?auto_2365733 - SURFACE
      ?auto_2365734 - SURFACE
      ?auto_2365735 - SURFACE
      ?auto_2365736 - SURFACE
      ?auto_2365737 - SURFACE
      ?auto_2365738 - SURFACE
      ?auto_2365739 - SURFACE
      ?auto_2365740 - SURFACE
    )
    :vars
    (
      ?auto_2365743 - HOIST
      ?auto_2365744 - PLACE
      ?auto_2365742 - TRUCK
      ?auto_2365745 - PLACE
      ?auto_2365741 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2365743 ?auto_2365744 ) ( SURFACE-AT ?auto_2365739 ?auto_2365744 ) ( CLEAR ?auto_2365739 ) ( IS-CRATE ?auto_2365740 ) ( not ( = ?auto_2365739 ?auto_2365740 ) ) ( AVAILABLE ?auto_2365743 ) ( ON ?auto_2365739 ?auto_2365738 ) ( not ( = ?auto_2365738 ?auto_2365739 ) ) ( not ( = ?auto_2365738 ?auto_2365740 ) ) ( TRUCK-AT ?auto_2365742 ?auto_2365745 ) ( not ( = ?auto_2365745 ?auto_2365744 ) ) ( HOIST-AT ?auto_2365741 ?auto_2365745 ) ( LIFTING ?auto_2365741 ?auto_2365740 ) ( not ( = ?auto_2365743 ?auto_2365741 ) ) ( ON ?auto_2365725 ?auto_2365724 ) ( ON ?auto_2365726 ?auto_2365725 ) ( ON ?auto_2365728 ?auto_2365726 ) ( ON ?auto_2365727 ?auto_2365728 ) ( ON ?auto_2365729 ?auto_2365727 ) ( ON ?auto_2365730 ?auto_2365729 ) ( ON ?auto_2365731 ?auto_2365730 ) ( ON ?auto_2365732 ?auto_2365731 ) ( ON ?auto_2365733 ?auto_2365732 ) ( ON ?auto_2365734 ?auto_2365733 ) ( ON ?auto_2365735 ?auto_2365734 ) ( ON ?auto_2365736 ?auto_2365735 ) ( ON ?auto_2365737 ?auto_2365736 ) ( ON ?auto_2365738 ?auto_2365737 ) ( not ( = ?auto_2365724 ?auto_2365725 ) ) ( not ( = ?auto_2365724 ?auto_2365726 ) ) ( not ( = ?auto_2365724 ?auto_2365728 ) ) ( not ( = ?auto_2365724 ?auto_2365727 ) ) ( not ( = ?auto_2365724 ?auto_2365729 ) ) ( not ( = ?auto_2365724 ?auto_2365730 ) ) ( not ( = ?auto_2365724 ?auto_2365731 ) ) ( not ( = ?auto_2365724 ?auto_2365732 ) ) ( not ( = ?auto_2365724 ?auto_2365733 ) ) ( not ( = ?auto_2365724 ?auto_2365734 ) ) ( not ( = ?auto_2365724 ?auto_2365735 ) ) ( not ( = ?auto_2365724 ?auto_2365736 ) ) ( not ( = ?auto_2365724 ?auto_2365737 ) ) ( not ( = ?auto_2365724 ?auto_2365738 ) ) ( not ( = ?auto_2365724 ?auto_2365739 ) ) ( not ( = ?auto_2365724 ?auto_2365740 ) ) ( not ( = ?auto_2365725 ?auto_2365726 ) ) ( not ( = ?auto_2365725 ?auto_2365728 ) ) ( not ( = ?auto_2365725 ?auto_2365727 ) ) ( not ( = ?auto_2365725 ?auto_2365729 ) ) ( not ( = ?auto_2365725 ?auto_2365730 ) ) ( not ( = ?auto_2365725 ?auto_2365731 ) ) ( not ( = ?auto_2365725 ?auto_2365732 ) ) ( not ( = ?auto_2365725 ?auto_2365733 ) ) ( not ( = ?auto_2365725 ?auto_2365734 ) ) ( not ( = ?auto_2365725 ?auto_2365735 ) ) ( not ( = ?auto_2365725 ?auto_2365736 ) ) ( not ( = ?auto_2365725 ?auto_2365737 ) ) ( not ( = ?auto_2365725 ?auto_2365738 ) ) ( not ( = ?auto_2365725 ?auto_2365739 ) ) ( not ( = ?auto_2365725 ?auto_2365740 ) ) ( not ( = ?auto_2365726 ?auto_2365728 ) ) ( not ( = ?auto_2365726 ?auto_2365727 ) ) ( not ( = ?auto_2365726 ?auto_2365729 ) ) ( not ( = ?auto_2365726 ?auto_2365730 ) ) ( not ( = ?auto_2365726 ?auto_2365731 ) ) ( not ( = ?auto_2365726 ?auto_2365732 ) ) ( not ( = ?auto_2365726 ?auto_2365733 ) ) ( not ( = ?auto_2365726 ?auto_2365734 ) ) ( not ( = ?auto_2365726 ?auto_2365735 ) ) ( not ( = ?auto_2365726 ?auto_2365736 ) ) ( not ( = ?auto_2365726 ?auto_2365737 ) ) ( not ( = ?auto_2365726 ?auto_2365738 ) ) ( not ( = ?auto_2365726 ?auto_2365739 ) ) ( not ( = ?auto_2365726 ?auto_2365740 ) ) ( not ( = ?auto_2365728 ?auto_2365727 ) ) ( not ( = ?auto_2365728 ?auto_2365729 ) ) ( not ( = ?auto_2365728 ?auto_2365730 ) ) ( not ( = ?auto_2365728 ?auto_2365731 ) ) ( not ( = ?auto_2365728 ?auto_2365732 ) ) ( not ( = ?auto_2365728 ?auto_2365733 ) ) ( not ( = ?auto_2365728 ?auto_2365734 ) ) ( not ( = ?auto_2365728 ?auto_2365735 ) ) ( not ( = ?auto_2365728 ?auto_2365736 ) ) ( not ( = ?auto_2365728 ?auto_2365737 ) ) ( not ( = ?auto_2365728 ?auto_2365738 ) ) ( not ( = ?auto_2365728 ?auto_2365739 ) ) ( not ( = ?auto_2365728 ?auto_2365740 ) ) ( not ( = ?auto_2365727 ?auto_2365729 ) ) ( not ( = ?auto_2365727 ?auto_2365730 ) ) ( not ( = ?auto_2365727 ?auto_2365731 ) ) ( not ( = ?auto_2365727 ?auto_2365732 ) ) ( not ( = ?auto_2365727 ?auto_2365733 ) ) ( not ( = ?auto_2365727 ?auto_2365734 ) ) ( not ( = ?auto_2365727 ?auto_2365735 ) ) ( not ( = ?auto_2365727 ?auto_2365736 ) ) ( not ( = ?auto_2365727 ?auto_2365737 ) ) ( not ( = ?auto_2365727 ?auto_2365738 ) ) ( not ( = ?auto_2365727 ?auto_2365739 ) ) ( not ( = ?auto_2365727 ?auto_2365740 ) ) ( not ( = ?auto_2365729 ?auto_2365730 ) ) ( not ( = ?auto_2365729 ?auto_2365731 ) ) ( not ( = ?auto_2365729 ?auto_2365732 ) ) ( not ( = ?auto_2365729 ?auto_2365733 ) ) ( not ( = ?auto_2365729 ?auto_2365734 ) ) ( not ( = ?auto_2365729 ?auto_2365735 ) ) ( not ( = ?auto_2365729 ?auto_2365736 ) ) ( not ( = ?auto_2365729 ?auto_2365737 ) ) ( not ( = ?auto_2365729 ?auto_2365738 ) ) ( not ( = ?auto_2365729 ?auto_2365739 ) ) ( not ( = ?auto_2365729 ?auto_2365740 ) ) ( not ( = ?auto_2365730 ?auto_2365731 ) ) ( not ( = ?auto_2365730 ?auto_2365732 ) ) ( not ( = ?auto_2365730 ?auto_2365733 ) ) ( not ( = ?auto_2365730 ?auto_2365734 ) ) ( not ( = ?auto_2365730 ?auto_2365735 ) ) ( not ( = ?auto_2365730 ?auto_2365736 ) ) ( not ( = ?auto_2365730 ?auto_2365737 ) ) ( not ( = ?auto_2365730 ?auto_2365738 ) ) ( not ( = ?auto_2365730 ?auto_2365739 ) ) ( not ( = ?auto_2365730 ?auto_2365740 ) ) ( not ( = ?auto_2365731 ?auto_2365732 ) ) ( not ( = ?auto_2365731 ?auto_2365733 ) ) ( not ( = ?auto_2365731 ?auto_2365734 ) ) ( not ( = ?auto_2365731 ?auto_2365735 ) ) ( not ( = ?auto_2365731 ?auto_2365736 ) ) ( not ( = ?auto_2365731 ?auto_2365737 ) ) ( not ( = ?auto_2365731 ?auto_2365738 ) ) ( not ( = ?auto_2365731 ?auto_2365739 ) ) ( not ( = ?auto_2365731 ?auto_2365740 ) ) ( not ( = ?auto_2365732 ?auto_2365733 ) ) ( not ( = ?auto_2365732 ?auto_2365734 ) ) ( not ( = ?auto_2365732 ?auto_2365735 ) ) ( not ( = ?auto_2365732 ?auto_2365736 ) ) ( not ( = ?auto_2365732 ?auto_2365737 ) ) ( not ( = ?auto_2365732 ?auto_2365738 ) ) ( not ( = ?auto_2365732 ?auto_2365739 ) ) ( not ( = ?auto_2365732 ?auto_2365740 ) ) ( not ( = ?auto_2365733 ?auto_2365734 ) ) ( not ( = ?auto_2365733 ?auto_2365735 ) ) ( not ( = ?auto_2365733 ?auto_2365736 ) ) ( not ( = ?auto_2365733 ?auto_2365737 ) ) ( not ( = ?auto_2365733 ?auto_2365738 ) ) ( not ( = ?auto_2365733 ?auto_2365739 ) ) ( not ( = ?auto_2365733 ?auto_2365740 ) ) ( not ( = ?auto_2365734 ?auto_2365735 ) ) ( not ( = ?auto_2365734 ?auto_2365736 ) ) ( not ( = ?auto_2365734 ?auto_2365737 ) ) ( not ( = ?auto_2365734 ?auto_2365738 ) ) ( not ( = ?auto_2365734 ?auto_2365739 ) ) ( not ( = ?auto_2365734 ?auto_2365740 ) ) ( not ( = ?auto_2365735 ?auto_2365736 ) ) ( not ( = ?auto_2365735 ?auto_2365737 ) ) ( not ( = ?auto_2365735 ?auto_2365738 ) ) ( not ( = ?auto_2365735 ?auto_2365739 ) ) ( not ( = ?auto_2365735 ?auto_2365740 ) ) ( not ( = ?auto_2365736 ?auto_2365737 ) ) ( not ( = ?auto_2365736 ?auto_2365738 ) ) ( not ( = ?auto_2365736 ?auto_2365739 ) ) ( not ( = ?auto_2365736 ?auto_2365740 ) ) ( not ( = ?auto_2365737 ?auto_2365738 ) ) ( not ( = ?auto_2365737 ?auto_2365739 ) ) ( not ( = ?auto_2365737 ?auto_2365740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2365738 ?auto_2365739 ?auto_2365740 )
      ( MAKE-16CRATE-VERIFY ?auto_2365724 ?auto_2365725 ?auto_2365726 ?auto_2365728 ?auto_2365727 ?auto_2365729 ?auto_2365730 ?auto_2365731 ?auto_2365732 ?auto_2365733 ?auto_2365734 ?auto_2365735 ?auto_2365736 ?auto_2365737 ?auto_2365738 ?auto_2365739 ?auto_2365740 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2365972 - SURFACE
      ?auto_2365973 - SURFACE
      ?auto_2365974 - SURFACE
      ?auto_2365976 - SURFACE
      ?auto_2365975 - SURFACE
      ?auto_2365977 - SURFACE
      ?auto_2365978 - SURFACE
      ?auto_2365979 - SURFACE
      ?auto_2365980 - SURFACE
      ?auto_2365981 - SURFACE
      ?auto_2365982 - SURFACE
      ?auto_2365983 - SURFACE
      ?auto_2365984 - SURFACE
      ?auto_2365985 - SURFACE
      ?auto_2365986 - SURFACE
      ?auto_2365987 - SURFACE
      ?auto_2365988 - SURFACE
    )
    :vars
    (
      ?auto_2365992 - HOIST
      ?auto_2365989 - PLACE
      ?auto_2365994 - TRUCK
      ?auto_2365991 - PLACE
      ?auto_2365993 - HOIST
      ?auto_2365990 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2365992 ?auto_2365989 ) ( SURFACE-AT ?auto_2365987 ?auto_2365989 ) ( CLEAR ?auto_2365987 ) ( IS-CRATE ?auto_2365988 ) ( not ( = ?auto_2365987 ?auto_2365988 ) ) ( AVAILABLE ?auto_2365992 ) ( ON ?auto_2365987 ?auto_2365986 ) ( not ( = ?auto_2365986 ?auto_2365987 ) ) ( not ( = ?auto_2365986 ?auto_2365988 ) ) ( TRUCK-AT ?auto_2365994 ?auto_2365991 ) ( not ( = ?auto_2365991 ?auto_2365989 ) ) ( HOIST-AT ?auto_2365993 ?auto_2365991 ) ( not ( = ?auto_2365992 ?auto_2365993 ) ) ( AVAILABLE ?auto_2365993 ) ( SURFACE-AT ?auto_2365988 ?auto_2365991 ) ( ON ?auto_2365988 ?auto_2365990 ) ( CLEAR ?auto_2365988 ) ( not ( = ?auto_2365987 ?auto_2365990 ) ) ( not ( = ?auto_2365988 ?auto_2365990 ) ) ( not ( = ?auto_2365986 ?auto_2365990 ) ) ( ON ?auto_2365973 ?auto_2365972 ) ( ON ?auto_2365974 ?auto_2365973 ) ( ON ?auto_2365976 ?auto_2365974 ) ( ON ?auto_2365975 ?auto_2365976 ) ( ON ?auto_2365977 ?auto_2365975 ) ( ON ?auto_2365978 ?auto_2365977 ) ( ON ?auto_2365979 ?auto_2365978 ) ( ON ?auto_2365980 ?auto_2365979 ) ( ON ?auto_2365981 ?auto_2365980 ) ( ON ?auto_2365982 ?auto_2365981 ) ( ON ?auto_2365983 ?auto_2365982 ) ( ON ?auto_2365984 ?auto_2365983 ) ( ON ?auto_2365985 ?auto_2365984 ) ( ON ?auto_2365986 ?auto_2365985 ) ( not ( = ?auto_2365972 ?auto_2365973 ) ) ( not ( = ?auto_2365972 ?auto_2365974 ) ) ( not ( = ?auto_2365972 ?auto_2365976 ) ) ( not ( = ?auto_2365972 ?auto_2365975 ) ) ( not ( = ?auto_2365972 ?auto_2365977 ) ) ( not ( = ?auto_2365972 ?auto_2365978 ) ) ( not ( = ?auto_2365972 ?auto_2365979 ) ) ( not ( = ?auto_2365972 ?auto_2365980 ) ) ( not ( = ?auto_2365972 ?auto_2365981 ) ) ( not ( = ?auto_2365972 ?auto_2365982 ) ) ( not ( = ?auto_2365972 ?auto_2365983 ) ) ( not ( = ?auto_2365972 ?auto_2365984 ) ) ( not ( = ?auto_2365972 ?auto_2365985 ) ) ( not ( = ?auto_2365972 ?auto_2365986 ) ) ( not ( = ?auto_2365972 ?auto_2365987 ) ) ( not ( = ?auto_2365972 ?auto_2365988 ) ) ( not ( = ?auto_2365972 ?auto_2365990 ) ) ( not ( = ?auto_2365973 ?auto_2365974 ) ) ( not ( = ?auto_2365973 ?auto_2365976 ) ) ( not ( = ?auto_2365973 ?auto_2365975 ) ) ( not ( = ?auto_2365973 ?auto_2365977 ) ) ( not ( = ?auto_2365973 ?auto_2365978 ) ) ( not ( = ?auto_2365973 ?auto_2365979 ) ) ( not ( = ?auto_2365973 ?auto_2365980 ) ) ( not ( = ?auto_2365973 ?auto_2365981 ) ) ( not ( = ?auto_2365973 ?auto_2365982 ) ) ( not ( = ?auto_2365973 ?auto_2365983 ) ) ( not ( = ?auto_2365973 ?auto_2365984 ) ) ( not ( = ?auto_2365973 ?auto_2365985 ) ) ( not ( = ?auto_2365973 ?auto_2365986 ) ) ( not ( = ?auto_2365973 ?auto_2365987 ) ) ( not ( = ?auto_2365973 ?auto_2365988 ) ) ( not ( = ?auto_2365973 ?auto_2365990 ) ) ( not ( = ?auto_2365974 ?auto_2365976 ) ) ( not ( = ?auto_2365974 ?auto_2365975 ) ) ( not ( = ?auto_2365974 ?auto_2365977 ) ) ( not ( = ?auto_2365974 ?auto_2365978 ) ) ( not ( = ?auto_2365974 ?auto_2365979 ) ) ( not ( = ?auto_2365974 ?auto_2365980 ) ) ( not ( = ?auto_2365974 ?auto_2365981 ) ) ( not ( = ?auto_2365974 ?auto_2365982 ) ) ( not ( = ?auto_2365974 ?auto_2365983 ) ) ( not ( = ?auto_2365974 ?auto_2365984 ) ) ( not ( = ?auto_2365974 ?auto_2365985 ) ) ( not ( = ?auto_2365974 ?auto_2365986 ) ) ( not ( = ?auto_2365974 ?auto_2365987 ) ) ( not ( = ?auto_2365974 ?auto_2365988 ) ) ( not ( = ?auto_2365974 ?auto_2365990 ) ) ( not ( = ?auto_2365976 ?auto_2365975 ) ) ( not ( = ?auto_2365976 ?auto_2365977 ) ) ( not ( = ?auto_2365976 ?auto_2365978 ) ) ( not ( = ?auto_2365976 ?auto_2365979 ) ) ( not ( = ?auto_2365976 ?auto_2365980 ) ) ( not ( = ?auto_2365976 ?auto_2365981 ) ) ( not ( = ?auto_2365976 ?auto_2365982 ) ) ( not ( = ?auto_2365976 ?auto_2365983 ) ) ( not ( = ?auto_2365976 ?auto_2365984 ) ) ( not ( = ?auto_2365976 ?auto_2365985 ) ) ( not ( = ?auto_2365976 ?auto_2365986 ) ) ( not ( = ?auto_2365976 ?auto_2365987 ) ) ( not ( = ?auto_2365976 ?auto_2365988 ) ) ( not ( = ?auto_2365976 ?auto_2365990 ) ) ( not ( = ?auto_2365975 ?auto_2365977 ) ) ( not ( = ?auto_2365975 ?auto_2365978 ) ) ( not ( = ?auto_2365975 ?auto_2365979 ) ) ( not ( = ?auto_2365975 ?auto_2365980 ) ) ( not ( = ?auto_2365975 ?auto_2365981 ) ) ( not ( = ?auto_2365975 ?auto_2365982 ) ) ( not ( = ?auto_2365975 ?auto_2365983 ) ) ( not ( = ?auto_2365975 ?auto_2365984 ) ) ( not ( = ?auto_2365975 ?auto_2365985 ) ) ( not ( = ?auto_2365975 ?auto_2365986 ) ) ( not ( = ?auto_2365975 ?auto_2365987 ) ) ( not ( = ?auto_2365975 ?auto_2365988 ) ) ( not ( = ?auto_2365975 ?auto_2365990 ) ) ( not ( = ?auto_2365977 ?auto_2365978 ) ) ( not ( = ?auto_2365977 ?auto_2365979 ) ) ( not ( = ?auto_2365977 ?auto_2365980 ) ) ( not ( = ?auto_2365977 ?auto_2365981 ) ) ( not ( = ?auto_2365977 ?auto_2365982 ) ) ( not ( = ?auto_2365977 ?auto_2365983 ) ) ( not ( = ?auto_2365977 ?auto_2365984 ) ) ( not ( = ?auto_2365977 ?auto_2365985 ) ) ( not ( = ?auto_2365977 ?auto_2365986 ) ) ( not ( = ?auto_2365977 ?auto_2365987 ) ) ( not ( = ?auto_2365977 ?auto_2365988 ) ) ( not ( = ?auto_2365977 ?auto_2365990 ) ) ( not ( = ?auto_2365978 ?auto_2365979 ) ) ( not ( = ?auto_2365978 ?auto_2365980 ) ) ( not ( = ?auto_2365978 ?auto_2365981 ) ) ( not ( = ?auto_2365978 ?auto_2365982 ) ) ( not ( = ?auto_2365978 ?auto_2365983 ) ) ( not ( = ?auto_2365978 ?auto_2365984 ) ) ( not ( = ?auto_2365978 ?auto_2365985 ) ) ( not ( = ?auto_2365978 ?auto_2365986 ) ) ( not ( = ?auto_2365978 ?auto_2365987 ) ) ( not ( = ?auto_2365978 ?auto_2365988 ) ) ( not ( = ?auto_2365978 ?auto_2365990 ) ) ( not ( = ?auto_2365979 ?auto_2365980 ) ) ( not ( = ?auto_2365979 ?auto_2365981 ) ) ( not ( = ?auto_2365979 ?auto_2365982 ) ) ( not ( = ?auto_2365979 ?auto_2365983 ) ) ( not ( = ?auto_2365979 ?auto_2365984 ) ) ( not ( = ?auto_2365979 ?auto_2365985 ) ) ( not ( = ?auto_2365979 ?auto_2365986 ) ) ( not ( = ?auto_2365979 ?auto_2365987 ) ) ( not ( = ?auto_2365979 ?auto_2365988 ) ) ( not ( = ?auto_2365979 ?auto_2365990 ) ) ( not ( = ?auto_2365980 ?auto_2365981 ) ) ( not ( = ?auto_2365980 ?auto_2365982 ) ) ( not ( = ?auto_2365980 ?auto_2365983 ) ) ( not ( = ?auto_2365980 ?auto_2365984 ) ) ( not ( = ?auto_2365980 ?auto_2365985 ) ) ( not ( = ?auto_2365980 ?auto_2365986 ) ) ( not ( = ?auto_2365980 ?auto_2365987 ) ) ( not ( = ?auto_2365980 ?auto_2365988 ) ) ( not ( = ?auto_2365980 ?auto_2365990 ) ) ( not ( = ?auto_2365981 ?auto_2365982 ) ) ( not ( = ?auto_2365981 ?auto_2365983 ) ) ( not ( = ?auto_2365981 ?auto_2365984 ) ) ( not ( = ?auto_2365981 ?auto_2365985 ) ) ( not ( = ?auto_2365981 ?auto_2365986 ) ) ( not ( = ?auto_2365981 ?auto_2365987 ) ) ( not ( = ?auto_2365981 ?auto_2365988 ) ) ( not ( = ?auto_2365981 ?auto_2365990 ) ) ( not ( = ?auto_2365982 ?auto_2365983 ) ) ( not ( = ?auto_2365982 ?auto_2365984 ) ) ( not ( = ?auto_2365982 ?auto_2365985 ) ) ( not ( = ?auto_2365982 ?auto_2365986 ) ) ( not ( = ?auto_2365982 ?auto_2365987 ) ) ( not ( = ?auto_2365982 ?auto_2365988 ) ) ( not ( = ?auto_2365982 ?auto_2365990 ) ) ( not ( = ?auto_2365983 ?auto_2365984 ) ) ( not ( = ?auto_2365983 ?auto_2365985 ) ) ( not ( = ?auto_2365983 ?auto_2365986 ) ) ( not ( = ?auto_2365983 ?auto_2365987 ) ) ( not ( = ?auto_2365983 ?auto_2365988 ) ) ( not ( = ?auto_2365983 ?auto_2365990 ) ) ( not ( = ?auto_2365984 ?auto_2365985 ) ) ( not ( = ?auto_2365984 ?auto_2365986 ) ) ( not ( = ?auto_2365984 ?auto_2365987 ) ) ( not ( = ?auto_2365984 ?auto_2365988 ) ) ( not ( = ?auto_2365984 ?auto_2365990 ) ) ( not ( = ?auto_2365985 ?auto_2365986 ) ) ( not ( = ?auto_2365985 ?auto_2365987 ) ) ( not ( = ?auto_2365985 ?auto_2365988 ) ) ( not ( = ?auto_2365985 ?auto_2365990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2365986 ?auto_2365987 ?auto_2365988 )
      ( MAKE-16CRATE-VERIFY ?auto_2365972 ?auto_2365973 ?auto_2365974 ?auto_2365976 ?auto_2365975 ?auto_2365977 ?auto_2365978 ?auto_2365979 ?auto_2365980 ?auto_2365981 ?auto_2365982 ?auto_2365983 ?auto_2365984 ?auto_2365985 ?auto_2365986 ?auto_2365987 ?auto_2365988 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2366221 - SURFACE
      ?auto_2366222 - SURFACE
      ?auto_2366223 - SURFACE
      ?auto_2366225 - SURFACE
      ?auto_2366224 - SURFACE
      ?auto_2366226 - SURFACE
      ?auto_2366227 - SURFACE
      ?auto_2366228 - SURFACE
      ?auto_2366229 - SURFACE
      ?auto_2366230 - SURFACE
      ?auto_2366231 - SURFACE
      ?auto_2366232 - SURFACE
      ?auto_2366233 - SURFACE
      ?auto_2366234 - SURFACE
      ?auto_2366235 - SURFACE
      ?auto_2366236 - SURFACE
      ?auto_2366237 - SURFACE
    )
    :vars
    (
      ?auto_2366238 - HOIST
      ?auto_2366242 - PLACE
      ?auto_2366241 - PLACE
      ?auto_2366243 - HOIST
      ?auto_2366239 - SURFACE
      ?auto_2366240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2366238 ?auto_2366242 ) ( SURFACE-AT ?auto_2366236 ?auto_2366242 ) ( CLEAR ?auto_2366236 ) ( IS-CRATE ?auto_2366237 ) ( not ( = ?auto_2366236 ?auto_2366237 ) ) ( AVAILABLE ?auto_2366238 ) ( ON ?auto_2366236 ?auto_2366235 ) ( not ( = ?auto_2366235 ?auto_2366236 ) ) ( not ( = ?auto_2366235 ?auto_2366237 ) ) ( not ( = ?auto_2366241 ?auto_2366242 ) ) ( HOIST-AT ?auto_2366243 ?auto_2366241 ) ( not ( = ?auto_2366238 ?auto_2366243 ) ) ( AVAILABLE ?auto_2366243 ) ( SURFACE-AT ?auto_2366237 ?auto_2366241 ) ( ON ?auto_2366237 ?auto_2366239 ) ( CLEAR ?auto_2366237 ) ( not ( = ?auto_2366236 ?auto_2366239 ) ) ( not ( = ?auto_2366237 ?auto_2366239 ) ) ( not ( = ?auto_2366235 ?auto_2366239 ) ) ( TRUCK-AT ?auto_2366240 ?auto_2366242 ) ( ON ?auto_2366222 ?auto_2366221 ) ( ON ?auto_2366223 ?auto_2366222 ) ( ON ?auto_2366225 ?auto_2366223 ) ( ON ?auto_2366224 ?auto_2366225 ) ( ON ?auto_2366226 ?auto_2366224 ) ( ON ?auto_2366227 ?auto_2366226 ) ( ON ?auto_2366228 ?auto_2366227 ) ( ON ?auto_2366229 ?auto_2366228 ) ( ON ?auto_2366230 ?auto_2366229 ) ( ON ?auto_2366231 ?auto_2366230 ) ( ON ?auto_2366232 ?auto_2366231 ) ( ON ?auto_2366233 ?auto_2366232 ) ( ON ?auto_2366234 ?auto_2366233 ) ( ON ?auto_2366235 ?auto_2366234 ) ( not ( = ?auto_2366221 ?auto_2366222 ) ) ( not ( = ?auto_2366221 ?auto_2366223 ) ) ( not ( = ?auto_2366221 ?auto_2366225 ) ) ( not ( = ?auto_2366221 ?auto_2366224 ) ) ( not ( = ?auto_2366221 ?auto_2366226 ) ) ( not ( = ?auto_2366221 ?auto_2366227 ) ) ( not ( = ?auto_2366221 ?auto_2366228 ) ) ( not ( = ?auto_2366221 ?auto_2366229 ) ) ( not ( = ?auto_2366221 ?auto_2366230 ) ) ( not ( = ?auto_2366221 ?auto_2366231 ) ) ( not ( = ?auto_2366221 ?auto_2366232 ) ) ( not ( = ?auto_2366221 ?auto_2366233 ) ) ( not ( = ?auto_2366221 ?auto_2366234 ) ) ( not ( = ?auto_2366221 ?auto_2366235 ) ) ( not ( = ?auto_2366221 ?auto_2366236 ) ) ( not ( = ?auto_2366221 ?auto_2366237 ) ) ( not ( = ?auto_2366221 ?auto_2366239 ) ) ( not ( = ?auto_2366222 ?auto_2366223 ) ) ( not ( = ?auto_2366222 ?auto_2366225 ) ) ( not ( = ?auto_2366222 ?auto_2366224 ) ) ( not ( = ?auto_2366222 ?auto_2366226 ) ) ( not ( = ?auto_2366222 ?auto_2366227 ) ) ( not ( = ?auto_2366222 ?auto_2366228 ) ) ( not ( = ?auto_2366222 ?auto_2366229 ) ) ( not ( = ?auto_2366222 ?auto_2366230 ) ) ( not ( = ?auto_2366222 ?auto_2366231 ) ) ( not ( = ?auto_2366222 ?auto_2366232 ) ) ( not ( = ?auto_2366222 ?auto_2366233 ) ) ( not ( = ?auto_2366222 ?auto_2366234 ) ) ( not ( = ?auto_2366222 ?auto_2366235 ) ) ( not ( = ?auto_2366222 ?auto_2366236 ) ) ( not ( = ?auto_2366222 ?auto_2366237 ) ) ( not ( = ?auto_2366222 ?auto_2366239 ) ) ( not ( = ?auto_2366223 ?auto_2366225 ) ) ( not ( = ?auto_2366223 ?auto_2366224 ) ) ( not ( = ?auto_2366223 ?auto_2366226 ) ) ( not ( = ?auto_2366223 ?auto_2366227 ) ) ( not ( = ?auto_2366223 ?auto_2366228 ) ) ( not ( = ?auto_2366223 ?auto_2366229 ) ) ( not ( = ?auto_2366223 ?auto_2366230 ) ) ( not ( = ?auto_2366223 ?auto_2366231 ) ) ( not ( = ?auto_2366223 ?auto_2366232 ) ) ( not ( = ?auto_2366223 ?auto_2366233 ) ) ( not ( = ?auto_2366223 ?auto_2366234 ) ) ( not ( = ?auto_2366223 ?auto_2366235 ) ) ( not ( = ?auto_2366223 ?auto_2366236 ) ) ( not ( = ?auto_2366223 ?auto_2366237 ) ) ( not ( = ?auto_2366223 ?auto_2366239 ) ) ( not ( = ?auto_2366225 ?auto_2366224 ) ) ( not ( = ?auto_2366225 ?auto_2366226 ) ) ( not ( = ?auto_2366225 ?auto_2366227 ) ) ( not ( = ?auto_2366225 ?auto_2366228 ) ) ( not ( = ?auto_2366225 ?auto_2366229 ) ) ( not ( = ?auto_2366225 ?auto_2366230 ) ) ( not ( = ?auto_2366225 ?auto_2366231 ) ) ( not ( = ?auto_2366225 ?auto_2366232 ) ) ( not ( = ?auto_2366225 ?auto_2366233 ) ) ( not ( = ?auto_2366225 ?auto_2366234 ) ) ( not ( = ?auto_2366225 ?auto_2366235 ) ) ( not ( = ?auto_2366225 ?auto_2366236 ) ) ( not ( = ?auto_2366225 ?auto_2366237 ) ) ( not ( = ?auto_2366225 ?auto_2366239 ) ) ( not ( = ?auto_2366224 ?auto_2366226 ) ) ( not ( = ?auto_2366224 ?auto_2366227 ) ) ( not ( = ?auto_2366224 ?auto_2366228 ) ) ( not ( = ?auto_2366224 ?auto_2366229 ) ) ( not ( = ?auto_2366224 ?auto_2366230 ) ) ( not ( = ?auto_2366224 ?auto_2366231 ) ) ( not ( = ?auto_2366224 ?auto_2366232 ) ) ( not ( = ?auto_2366224 ?auto_2366233 ) ) ( not ( = ?auto_2366224 ?auto_2366234 ) ) ( not ( = ?auto_2366224 ?auto_2366235 ) ) ( not ( = ?auto_2366224 ?auto_2366236 ) ) ( not ( = ?auto_2366224 ?auto_2366237 ) ) ( not ( = ?auto_2366224 ?auto_2366239 ) ) ( not ( = ?auto_2366226 ?auto_2366227 ) ) ( not ( = ?auto_2366226 ?auto_2366228 ) ) ( not ( = ?auto_2366226 ?auto_2366229 ) ) ( not ( = ?auto_2366226 ?auto_2366230 ) ) ( not ( = ?auto_2366226 ?auto_2366231 ) ) ( not ( = ?auto_2366226 ?auto_2366232 ) ) ( not ( = ?auto_2366226 ?auto_2366233 ) ) ( not ( = ?auto_2366226 ?auto_2366234 ) ) ( not ( = ?auto_2366226 ?auto_2366235 ) ) ( not ( = ?auto_2366226 ?auto_2366236 ) ) ( not ( = ?auto_2366226 ?auto_2366237 ) ) ( not ( = ?auto_2366226 ?auto_2366239 ) ) ( not ( = ?auto_2366227 ?auto_2366228 ) ) ( not ( = ?auto_2366227 ?auto_2366229 ) ) ( not ( = ?auto_2366227 ?auto_2366230 ) ) ( not ( = ?auto_2366227 ?auto_2366231 ) ) ( not ( = ?auto_2366227 ?auto_2366232 ) ) ( not ( = ?auto_2366227 ?auto_2366233 ) ) ( not ( = ?auto_2366227 ?auto_2366234 ) ) ( not ( = ?auto_2366227 ?auto_2366235 ) ) ( not ( = ?auto_2366227 ?auto_2366236 ) ) ( not ( = ?auto_2366227 ?auto_2366237 ) ) ( not ( = ?auto_2366227 ?auto_2366239 ) ) ( not ( = ?auto_2366228 ?auto_2366229 ) ) ( not ( = ?auto_2366228 ?auto_2366230 ) ) ( not ( = ?auto_2366228 ?auto_2366231 ) ) ( not ( = ?auto_2366228 ?auto_2366232 ) ) ( not ( = ?auto_2366228 ?auto_2366233 ) ) ( not ( = ?auto_2366228 ?auto_2366234 ) ) ( not ( = ?auto_2366228 ?auto_2366235 ) ) ( not ( = ?auto_2366228 ?auto_2366236 ) ) ( not ( = ?auto_2366228 ?auto_2366237 ) ) ( not ( = ?auto_2366228 ?auto_2366239 ) ) ( not ( = ?auto_2366229 ?auto_2366230 ) ) ( not ( = ?auto_2366229 ?auto_2366231 ) ) ( not ( = ?auto_2366229 ?auto_2366232 ) ) ( not ( = ?auto_2366229 ?auto_2366233 ) ) ( not ( = ?auto_2366229 ?auto_2366234 ) ) ( not ( = ?auto_2366229 ?auto_2366235 ) ) ( not ( = ?auto_2366229 ?auto_2366236 ) ) ( not ( = ?auto_2366229 ?auto_2366237 ) ) ( not ( = ?auto_2366229 ?auto_2366239 ) ) ( not ( = ?auto_2366230 ?auto_2366231 ) ) ( not ( = ?auto_2366230 ?auto_2366232 ) ) ( not ( = ?auto_2366230 ?auto_2366233 ) ) ( not ( = ?auto_2366230 ?auto_2366234 ) ) ( not ( = ?auto_2366230 ?auto_2366235 ) ) ( not ( = ?auto_2366230 ?auto_2366236 ) ) ( not ( = ?auto_2366230 ?auto_2366237 ) ) ( not ( = ?auto_2366230 ?auto_2366239 ) ) ( not ( = ?auto_2366231 ?auto_2366232 ) ) ( not ( = ?auto_2366231 ?auto_2366233 ) ) ( not ( = ?auto_2366231 ?auto_2366234 ) ) ( not ( = ?auto_2366231 ?auto_2366235 ) ) ( not ( = ?auto_2366231 ?auto_2366236 ) ) ( not ( = ?auto_2366231 ?auto_2366237 ) ) ( not ( = ?auto_2366231 ?auto_2366239 ) ) ( not ( = ?auto_2366232 ?auto_2366233 ) ) ( not ( = ?auto_2366232 ?auto_2366234 ) ) ( not ( = ?auto_2366232 ?auto_2366235 ) ) ( not ( = ?auto_2366232 ?auto_2366236 ) ) ( not ( = ?auto_2366232 ?auto_2366237 ) ) ( not ( = ?auto_2366232 ?auto_2366239 ) ) ( not ( = ?auto_2366233 ?auto_2366234 ) ) ( not ( = ?auto_2366233 ?auto_2366235 ) ) ( not ( = ?auto_2366233 ?auto_2366236 ) ) ( not ( = ?auto_2366233 ?auto_2366237 ) ) ( not ( = ?auto_2366233 ?auto_2366239 ) ) ( not ( = ?auto_2366234 ?auto_2366235 ) ) ( not ( = ?auto_2366234 ?auto_2366236 ) ) ( not ( = ?auto_2366234 ?auto_2366237 ) ) ( not ( = ?auto_2366234 ?auto_2366239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2366235 ?auto_2366236 ?auto_2366237 )
      ( MAKE-16CRATE-VERIFY ?auto_2366221 ?auto_2366222 ?auto_2366223 ?auto_2366225 ?auto_2366224 ?auto_2366226 ?auto_2366227 ?auto_2366228 ?auto_2366229 ?auto_2366230 ?auto_2366231 ?auto_2366232 ?auto_2366233 ?auto_2366234 ?auto_2366235 ?auto_2366236 ?auto_2366237 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2366470 - SURFACE
      ?auto_2366471 - SURFACE
      ?auto_2366472 - SURFACE
      ?auto_2366474 - SURFACE
      ?auto_2366473 - SURFACE
      ?auto_2366475 - SURFACE
      ?auto_2366476 - SURFACE
      ?auto_2366477 - SURFACE
      ?auto_2366478 - SURFACE
      ?auto_2366479 - SURFACE
      ?auto_2366480 - SURFACE
      ?auto_2366481 - SURFACE
      ?auto_2366482 - SURFACE
      ?auto_2366483 - SURFACE
      ?auto_2366484 - SURFACE
      ?auto_2366485 - SURFACE
      ?auto_2366486 - SURFACE
    )
    :vars
    (
      ?auto_2366492 - HOIST
      ?auto_2366487 - PLACE
      ?auto_2366489 - PLACE
      ?auto_2366490 - HOIST
      ?auto_2366488 - SURFACE
      ?auto_2366491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2366492 ?auto_2366487 ) ( IS-CRATE ?auto_2366486 ) ( not ( = ?auto_2366485 ?auto_2366486 ) ) ( not ( = ?auto_2366484 ?auto_2366485 ) ) ( not ( = ?auto_2366484 ?auto_2366486 ) ) ( not ( = ?auto_2366489 ?auto_2366487 ) ) ( HOIST-AT ?auto_2366490 ?auto_2366489 ) ( not ( = ?auto_2366492 ?auto_2366490 ) ) ( AVAILABLE ?auto_2366490 ) ( SURFACE-AT ?auto_2366486 ?auto_2366489 ) ( ON ?auto_2366486 ?auto_2366488 ) ( CLEAR ?auto_2366486 ) ( not ( = ?auto_2366485 ?auto_2366488 ) ) ( not ( = ?auto_2366486 ?auto_2366488 ) ) ( not ( = ?auto_2366484 ?auto_2366488 ) ) ( TRUCK-AT ?auto_2366491 ?auto_2366487 ) ( SURFACE-AT ?auto_2366484 ?auto_2366487 ) ( CLEAR ?auto_2366484 ) ( LIFTING ?auto_2366492 ?auto_2366485 ) ( IS-CRATE ?auto_2366485 ) ( ON ?auto_2366471 ?auto_2366470 ) ( ON ?auto_2366472 ?auto_2366471 ) ( ON ?auto_2366474 ?auto_2366472 ) ( ON ?auto_2366473 ?auto_2366474 ) ( ON ?auto_2366475 ?auto_2366473 ) ( ON ?auto_2366476 ?auto_2366475 ) ( ON ?auto_2366477 ?auto_2366476 ) ( ON ?auto_2366478 ?auto_2366477 ) ( ON ?auto_2366479 ?auto_2366478 ) ( ON ?auto_2366480 ?auto_2366479 ) ( ON ?auto_2366481 ?auto_2366480 ) ( ON ?auto_2366482 ?auto_2366481 ) ( ON ?auto_2366483 ?auto_2366482 ) ( ON ?auto_2366484 ?auto_2366483 ) ( not ( = ?auto_2366470 ?auto_2366471 ) ) ( not ( = ?auto_2366470 ?auto_2366472 ) ) ( not ( = ?auto_2366470 ?auto_2366474 ) ) ( not ( = ?auto_2366470 ?auto_2366473 ) ) ( not ( = ?auto_2366470 ?auto_2366475 ) ) ( not ( = ?auto_2366470 ?auto_2366476 ) ) ( not ( = ?auto_2366470 ?auto_2366477 ) ) ( not ( = ?auto_2366470 ?auto_2366478 ) ) ( not ( = ?auto_2366470 ?auto_2366479 ) ) ( not ( = ?auto_2366470 ?auto_2366480 ) ) ( not ( = ?auto_2366470 ?auto_2366481 ) ) ( not ( = ?auto_2366470 ?auto_2366482 ) ) ( not ( = ?auto_2366470 ?auto_2366483 ) ) ( not ( = ?auto_2366470 ?auto_2366484 ) ) ( not ( = ?auto_2366470 ?auto_2366485 ) ) ( not ( = ?auto_2366470 ?auto_2366486 ) ) ( not ( = ?auto_2366470 ?auto_2366488 ) ) ( not ( = ?auto_2366471 ?auto_2366472 ) ) ( not ( = ?auto_2366471 ?auto_2366474 ) ) ( not ( = ?auto_2366471 ?auto_2366473 ) ) ( not ( = ?auto_2366471 ?auto_2366475 ) ) ( not ( = ?auto_2366471 ?auto_2366476 ) ) ( not ( = ?auto_2366471 ?auto_2366477 ) ) ( not ( = ?auto_2366471 ?auto_2366478 ) ) ( not ( = ?auto_2366471 ?auto_2366479 ) ) ( not ( = ?auto_2366471 ?auto_2366480 ) ) ( not ( = ?auto_2366471 ?auto_2366481 ) ) ( not ( = ?auto_2366471 ?auto_2366482 ) ) ( not ( = ?auto_2366471 ?auto_2366483 ) ) ( not ( = ?auto_2366471 ?auto_2366484 ) ) ( not ( = ?auto_2366471 ?auto_2366485 ) ) ( not ( = ?auto_2366471 ?auto_2366486 ) ) ( not ( = ?auto_2366471 ?auto_2366488 ) ) ( not ( = ?auto_2366472 ?auto_2366474 ) ) ( not ( = ?auto_2366472 ?auto_2366473 ) ) ( not ( = ?auto_2366472 ?auto_2366475 ) ) ( not ( = ?auto_2366472 ?auto_2366476 ) ) ( not ( = ?auto_2366472 ?auto_2366477 ) ) ( not ( = ?auto_2366472 ?auto_2366478 ) ) ( not ( = ?auto_2366472 ?auto_2366479 ) ) ( not ( = ?auto_2366472 ?auto_2366480 ) ) ( not ( = ?auto_2366472 ?auto_2366481 ) ) ( not ( = ?auto_2366472 ?auto_2366482 ) ) ( not ( = ?auto_2366472 ?auto_2366483 ) ) ( not ( = ?auto_2366472 ?auto_2366484 ) ) ( not ( = ?auto_2366472 ?auto_2366485 ) ) ( not ( = ?auto_2366472 ?auto_2366486 ) ) ( not ( = ?auto_2366472 ?auto_2366488 ) ) ( not ( = ?auto_2366474 ?auto_2366473 ) ) ( not ( = ?auto_2366474 ?auto_2366475 ) ) ( not ( = ?auto_2366474 ?auto_2366476 ) ) ( not ( = ?auto_2366474 ?auto_2366477 ) ) ( not ( = ?auto_2366474 ?auto_2366478 ) ) ( not ( = ?auto_2366474 ?auto_2366479 ) ) ( not ( = ?auto_2366474 ?auto_2366480 ) ) ( not ( = ?auto_2366474 ?auto_2366481 ) ) ( not ( = ?auto_2366474 ?auto_2366482 ) ) ( not ( = ?auto_2366474 ?auto_2366483 ) ) ( not ( = ?auto_2366474 ?auto_2366484 ) ) ( not ( = ?auto_2366474 ?auto_2366485 ) ) ( not ( = ?auto_2366474 ?auto_2366486 ) ) ( not ( = ?auto_2366474 ?auto_2366488 ) ) ( not ( = ?auto_2366473 ?auto_2366475 ) ) ( not ( = ?auto_2366473 ?auto_2366476 ) ) ( not ( = ?auto_2366473 ?auto_2366477 ) ) ( not ( = ?auto_2366473 ?auto_2366478 ) ) ( not ( = ?auto_2366473 ?auto_2366479 ) ) ( not ( = ?auto_2366473 ?auto_2366480 ) ) ( not ( = ?auto_2366473 ?auto_2366481 ) ) ( not ( = ?auto_2366473 ?auto_2366482 ) ) ( not ( = ?auto_2366473 ?auto_2366483 ) ) ( not ( = ?auto_2366473 ?auto_2366484 ) ) ( not ( = ?auto_2366473 ?auto_2366485 ) ) ( not ( = ?auto_2366473 ?auto_2366486 ) ) ( not ( = ?auto_2366473 ?auto_2366488 ) ) ( not ( = ?auto_2366475 ?auto_2366476 ) ) ( not ( = ?auto_2366475 ?auto_2366477 ) ) ( not ( = ?auto_2366475 ?auto_2366478 ) ) ( not ( = ?auto_2366475 ?auto_2366479 ) ) ( not ( = ?auto_2366475 ?auto_2366480 ) ) ( not ( = ?auto_2366475 ?auto_2366481 ) ) ( not ( = ?auto_2366475 ?auto_2366482 ) ) ( not ( = ?auto_2366475 ?auto_2366483 ) ) ( not ( = ?auto_2366475 ?auto_2366484 ) ) ( not ( = ?auto_2366475 ?auto_2366485 ) ) ( not ( = ?auto_2366475 ?auto_2366486 ) ) ( not ( = ?auto_2366475 ?auto_2366488 ) ) ( not ( = ?auto_2366476 ?auto_2366477 ) ) ( not ( = ?auto_2366476 ?auto_2366478 ) ) ( not ( = ?auto_2366476 ?auto_2366479 ) ) ( not ( = ?auto_2366476 ?auto_2366480 ) ) ( not ( = ?auto_2366476 ?auto_2366481 ) ) ( not ( = ?auto_2366476 ?auto_2366482 ) ) ( not ( = ?auto_2366476 ?auto_2366483 ) ) ( not ( = ?auto_2366476 ?auto_2366484 ) ) ( not ( = ?auto_2366476 ?auto_2366485 ) ) ( not ( = ?auto_2366476 ?auto_2366486 ) ) ( not ( = ?auto_2366476 ?auto_2366488 ) ) ( not ( = ?auto_2366477 ?auto_2366478 ) ) ( not ( = ?auto_2366477 ?auto_2366479 ) ) ( not ( = ?auto_2366477 ?auto_2366480 ) ) ( not ( = ?auto_2366477 ?auto_2366481 ) ) ( not ( = ?auto_2366477 ?auto_2366482 ) ) ( not ( = ?auto_2366477 ?auto_2366483 ) ) ( not ( = ?auto_2366477 ?auto_2366484 ) ) ( not ( = ?auto_2366477 ?auto_2366485 ) ) ( not ( = ?auto_2366477 ?auto_2366486 ) ) ( not ( = ?auto_2366477 ?auto_2366488 ) ) ( not ( = ?auto_2366478 ?auto_2366479 ) ) ( not ( = ?auto_2366478 ?auto_2366480 ) ) ( not ( = ?auto_2366478 ?auto_2366481 ) ) ( not ( = ?auto_2366478 ?auto_2366482 ) ) ( not ( = ?auto_2366478 ?auto_2366483 ) ) ( not ( = ?auto_2366478 ?auto_2366484 ) ) ( not ( = ?auto_2366478 ?auto_2366485 ) ) ( not ( = ?auto_2366478 ?auto_2366486 ) ) ( not ( = ?auto_2366478 ?auto_2366488 ) ) ( not ( = ?auto_2366479 ?auto_2366480 ) ) ( not ( = ?auto_2366479 ?auto_2366481 ) ) ( not ( = ?auto_2366479 ?auto_2366482 ) ) ( not ( = ?auto_2366479 ?auto_2366483 ) ) ( not ( = ?auto_2366479 ?auto_2366484 ) ) ( not ( = ?auto_2366479 ?auto_2366485 ) ) ( not ( = ?auto_2366479 ?auto_2366486 ) ) ( not ( = ?auto_2366479 ?auto_2366488 ) ) ( not ( = ?auto_2366480 ?auto_2366481 ) ) ( not ( = ?auto_2366480 ?auto_2366482 ) ) ( not ( = ?auto_2366480 ?auto_2366483 ) ) ( not ( = ?auto_2366480 ?auto_2366484 ) ) ( not ( = ?auto_2366480 ?auto_2366485 ) ) ( not ( = ?auto_2366480 ?auto_2366486 ) ) ( not ( = ?auto_2366480 ?auto_2366488 ) ) ( not ( = ?auto_2366481 ?auto_2366482 ) ) ( not ( = ?auto_2366481 ?auto_2366483 ) ) ( not ( = ?auto_2366481 ?auto_2366484 ) ) ( not ( = ?auto_2366481 ?auto_2366485 ) ) ( not ( = ?auto_2366481 ?auto_2366486 ) ) ( not ( = ?auto_2366481 ?auto_2366488 ) ) ( not ( = ?auto_2366482 ?auto_2366483 ) ) ( not ( = ?auto_2366482 ?auto_2366484 ) ) ( not ( = ?auto_2366482 ?auto_2366485 ) ) ( not ( = ?auto_2366482 ?auto_2366486 ) ) ( not ( = ?auto_2366482 ?auto_2366488 ) ) ( not ( = ?auto_2366483 ?auto_2366484 ) ) ( not ( = ?auto_2366483 ?auto_2366485 ) ) ( not ( = ?auto_2366483 ?auto_2366486 ) ) ( not ( = ?auto_2366483 ?auto_2366488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2366484 ?auto_2366485 ?auto_2366486 )
      ( MAKE-16CRATE-VERIFY ?auto_2366470 ?auto_2366471 ?auto_2366472 ?auto_2366474 ?auto_2366473 ?auto_2366475 ?auto_2366476 ?auto_2366477 ?auto_2366478 ?auto_2366479 ?auto_2366480 ?auto_2366481 ?auto_2366482 ?auto_2366483 ?auto_2366484 ?auto_2366485 ?auto_2366486 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2366719 - SURFACE
      ?auto_2366720 - SURFACE
      ?auto_2366721 - SURFACE
      ?auto_2366723 - SURFACE
      ?auto_2366722 - SURFACE
      ?auto_2366724 - SURFACE
      ?auto_2366725 - SURFACE
      ?auto_2366726 - SURFACE
      ?auto_2366727 - SURFACE
      ?auto_2366728 - SURFACE
      ?auto_2366729 - SURFACE
      ?auto_2366730 - SURFACE
      ?auto_2366731 - SURFACE
      ?auto_2366732 - SURFACE
      ?auto_2366733 - SURFACE
      ?auto_2366734 - SURFACE
      ?auto_2366735 - SURFACE
    )
    :vars
    (
      ?auto_2366740 - HOIST
      ?auto_2366737 - PLACE
      ?auto_2366736 - PLACE
      ?auto_2366741 - HOIST
      ?auto_2366739 - SURFACE
      ?auto_2366738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2366740 ?auto_2366737 ) ( IS-CRATE ?auto_2366735 ) ( not ( = ?auto_2366734 ?auto_2366735 ) ) ( not ( = ?auto_2366733 ?auto_2366734 ) ) ( not ( = ?auto_2366733 ?auto_2366735 ) ) ( not ( = ?auto_2366736 ?auto_2366737 ) ) ( HOIST-AT ?auto_2366741 ?auto_2366736 ) ( not ( = ?auto_2366740 ?auto_2366741 ) ) ( AVAILABLE ?auto_2366741 ) ( SURFACE-AT ?auto_2366735 ?auto_2366736 ) ( ON ?auto_2366735 ?auto_2366739 ) ( CLEAR ?auto_2366735 ) ( not ( = ?auto_2366734 ?auto_2366739 ) ) ( not ( = ?auto_2366735 ?auto_2366739 ) ) ( not ( = ?auto_2366733 ?auto_2366739 ) ) ( TRUCK-AT ?auto_2366738 ?auto_2366737 ) ( SURFACE-AT ?auto_2366733 ?auto_2366737 ) ( CLEAR ?auto_2366733 ) ( IS-CRATE ?auto_2366734 ) ( AVAILABLE ?auto_2366740 ) ( IN ?auto_2366734 ?auto_2366738 ) ( ON ?auto_2366720 ?auto_2366719 ) ( ON ?auto_2366721 ?auto_2366720 ) ( ON ?auto_2366723 ?auto_2366721 ) ( ON ?auto_2366722 ?auto_2366723 ) ( ON ?auto_2366724 ?auto_2366722 ) ( ON ?auto_2366725 ?auto_2366724 ) ( ON ?auto_2366726 ?auto_2366725 ) ( ON ?auto_2366727 ?auto_2366726 ) ( ON ?auto_2366728 ?auto_2366727 ) ( ON ?auto_2366729 ?auto_2366728 ) ( ON ?auto_2366730 ?auto_2366729 ) ( ON ?auto_2366731 ?auto_2366730 ) ( ON ?auto_2366732 ?auto_2366731 ) ( ON ?auto_2366733 ?auto_2366732 ) ( not ( = ?auto_2366719 ?auto_2366720 ) ) ( not ( = ?auto_2366719 ?auto_2366721 ) ) ( not ( = ?auto_2366719 ?auto_2366723 ) ) ( not ( = ?auto_2366719 ?auto_2366722 ) ) ( not ( = ?auto_2366719 ?auto_2366724 ) ) ( not ( = ?auto_2366719 ?auto_2366725 ) ) ( not ( = ?auto_2366719 ?auto_2366726 ) ) ( not ( = ?auto_2366719 ?auto_2366727 ) ) ( not ( = ?auto_2366719 ?auto_2366728 ) ) ( not ( = ?auto_2366719 ?auto_2366729 ) ) ( not ( = ?auto_2366719 ?auto_2366730 ) ) ( not ( = ?auto_2366719 ?auto_2366731 ) ) ( not ( = ?auto_2366719 ?auto_2366732 ) ) ( not ( = ?auto_2366719 ?auto_2366733 ) ) ( not ( = ?auto_2366719 ?auto_2366734 ) ) ( not ( = ?auto_2366719 ?auto_2366735 ) ) ( not ( = ?auto_2366719 ?auto_2366739 ) ) ( not ( = ?auto_2366720 ?auto_2366721 ) ) ( not ( = ?auto_2366720 ?auto_2366723 ) ) ( not ( = ?auto_2366720 ?auto_2366722 ) ) ( not ( = ?auto_2366720 ?auto_2366724 ) ) ( not ( = ?auto_2366720 ?auto_2366725 ) ) ( not ( = ?auto_2366720 ?auto_2366726 ) ) ( not ( = ?auto_2366720 ?auto_2366727 ) ) ( not ( = ?auto_2366720 ?auto_2366728 ) ) ( not ( = ?auto_2366720 ?auto_2366729 ) ) ( not ( = ?auto_2366720 ?auto_2366730 ) ) ( not ( = ?auto_2366720 ?auto_2366731 ) ) ( not ( = ?auto_2366720 ?auto_2366732 ) ) ( not ( = ?auto_2366720 ?auto_2366733 ) ) ( not ( = ?auto_2366720 ?auto_2366734 ) ) ( not ( = ?auto_2366720 ?auto_2366735 ) ) ( not ( = ?auto_2366720 ?auto_2366739 ) ) ( not ( = ?auto_2366721 ?auto_2366723 ) ) ( not ( = ?auto_2366721 ?auto_2366722 ) ) ( not ( = ?auto_2366721 ?auto_2366724 ) ) ( not ( = ?auto_2366721 ?auto_2366725 ) ) ( not ( = ?auto_2366721 ?auto_2366726 ) ) ( not ( = ?auto_2366721 ?auto_2366727 ) ) ( not ( = ?auto_2366721 ?auto_2366728 ) ) ( not ( = ?auto_2366721 ?auto_2366729 ) ) ( not ( = ?auto_2366721 ?auto_2366730 ) ) ( not ( = ?auto_2366721 ?auto_2366731 ) ) ( not ( = ?auto_2366721 ?auto_2366732 ) ) ( not ( = ?auto_2366721 ?auto_2366733 ) ) ( not ( = ?auto_2366721 ?auto_2366734 ) ) ( not ( = ?auto_2366721 ?auto_2366735 ) ) ( not ( = ?auto_2366721 ?auto_2366739 ) ) ( not ( = ?auto_2366723 ?auto_2366722 ) ) ( not ( = ?auto_2366723 ?auto_2366724 ) ) ( not ( = ?auto_2366723 ?auto_2366725 ) ) ( not ( = ?auto_2366723 ?auto_2366726 ) ) ( not ( = ?auto_2366723 ?auto_2366727 ) ) ( not ( = ?auto_2366723 ?auto_2366728 ) ) ( not ( = ?auto_2366723 ?auto_2366729 ) ) ( not ( = ?auto_2366723 ?auto_2366730 ) ) ( not ( = ?auto_2366723 ?auto_2366731 ) ) ( not ( = ?auto_2366723 ?auto_2366732 ) ) ( not ( = ?auto_2366723 ?auto_2366733 ) ) ( not ( = ?auto_2366723 ?auto_2366734 ) ) ( not ( = ?auto_2366723 ?auto_2366735 ) ) ( not ( = ?auto_2366723 ?auto_2366739 ) ) ( not ( = ?auto_2366722 ?auto_2366724 ) ) ( not ( = ?auto_2366722 ?auto_2366725 ) ) ( not ( = ?auto_2366722 ?auto_2366726 ) ) ( not ( = ?auto_2366722 ?auto_2366727 ) ) ( not ( = ?auto_2366722 ?auto_2366728 ) ) ( not ( = ?auto_2366722 ?auto_2366729 ) ) ( not ( = ?auto_2366722 ?auto_2366730 ) ) ( not ( = ?auto_2366722 ?auto_2366731 ) ) ( not ( = ?auto_2366722 ?auto_2366732 ) ) ( not ( = ?auto_2366722 ?auto_2366733 ) ) ( not ( = ?auto_2366722 ?auto_2366734 ) ) ( not ( = ?auto_2366722 ?auto_2366735 ) ) ( not ( = ?auto_2366722 ?auto_2366739 ) ) ( not ( = ?auto_2366724 ?auto_2366725 ) ) ( not ( = ?auto_2366724 ?auto_2366726 ) ) ( not ( = ?auto_2366724 ?auto_2366727 ) ) ( not ( = ?auto_2366724 ?auto_2366728 ) ) ( not ( = ?auto_2366724 ?auto_2366729 ) ) ( not ( = ?auto_2366724 ?auto_2366730 ) ) ( not ( = ?auto_2366724 ?auto_2366731 ) ) ( not ( = ?auto_2366724 ?auto_2366732 ) ) ( not ( = ?auto_2366724 ?auto_2366733 ) ) ( not ( = ?auto_2366724 ?auto_2366734 ) ) ( not ( = ?auto_2366724 ?auto_2366735 ) ) ( not ( = ?auto_2366724 ?auto_2366739 ) ) ( not ( = ?auto_2366725 ?auto_2366726 ) ) ( not ( = ?auto_2366725 ?auto_2366727 ) ) ( not ( = ?auto_2366725 ?auto_2366728 ) ) ( not ( = ?auto_2366725 ?auto_2366729 ) ) ( not ( = ?auto_2366725 ?auto_2366730 ) ) ( not ( = ?auto_2366725 ?auto_2366731 ) ) ( not ( = ?auto_2366725 ?auto_2366732 ) ) ( not ( = ?auto_2366725 ?auto_2366733 ) ) ( not ( = ?auto_2366725 ?auto_2366734 ) ) ( not ( = ?auto_2366725 ?auto_2366735 ) ) ( not ( = ?auto_2366725 ?auto_2366739 ) ) ( not ( = ?auto_2366726 ?auto_2366727 ) ) ( not ( = ?auto_2366726 ?auto_2366728 ) ) ( not ( = ?auto_2366726 ?auto_2366729 ) ) ( not ( = ?auto_2366726 ?auto_2366730 ) ) ( not ( = ?auto_2366726 ?auto_2366731 ) ) ( not ( = ?auto_2366726 ?auto_2366732 ) ) ( not ( = ?auto_2366726 ?auto_2366733 ) ) ( not ( = ?auto_2366726 ?auto_2366734 ) ) ( not ( = ?auto_2366726 ?auto_2366735 ) ) ( not ( = ?auto_2366726 ?auto_2366739 ) ) ( not ( = ?auto_2366727 ?auto_2366728 ) ) ( not ( = ?auto_2366727 ?auto_2366729 ) ) ( not ( = ?auto_2366727 ?auto_2366730 ) ) ( not ( = ?auto_2366727 ?auto_2366731 ) ) ( not ( = ?auto_2366727 ?auto_2366732 ) ) ( not ( = ?auto_2366727 ?auto_2366733 ) ) ( not ( = ?auto_2366727 ?auto_2366734 ) ) ( not ( = ?auto_2366727 ?auto_2366735 ) ) ( not ( = ?auto_2366727 ?auto_2366739 ) ) ( not ( = ?auto_2366728 ?auto_2366729 ) ) ( not ( = ?auto_2366728 ?auto_2366730 ) ) ( not ( = ?auto_2366728 ?auto_2366731 ) ) ( not ( = ?auto_2366728 ?auto_2366732 ) ) ( not ( = ?auto_2366728 ?auto_2366733 ) ) ( not ( = ?auto_2366728 ?auto_2366734 ) ) ( not ( = ?auto_2366728 ?auto_2366735 ) ) ( not ( = ?auto_2366728 ?auto_2366739 ) ) ( not ( = ?auto_2366729 ?auto_2366730 ) ) ( not ( = ?auto_2366729 ?auto_2366731 ) ) ( not ( = ?auto_2366729 ?auto_2366732 ) ) ( not ( = ?auto_2366729 ?auto_2366733 ) ) ( not ( = ?auto_2366729 ?auto_2366734 ) ) ( not ( = ?auto_2366729 ?auto_2366735 ) ) ( not ( = ?auto_2366729 ?auto_2366739 ) ) ( not ( = ?auto_2366730 ?auto_2366731 ) ) ( not ( = ?auto_2366730 ?auto_2366732 ) ) ( not ( = ?auto_2366730 ?auto_2366733 ) ) ( not ( = ?auto_2366730 ?auto_2366734 ) ) ( not ( = ?auto_2366730 ?auto_2366735 ) ) ( not ( = ?auto_2366730 ?auto_2366739 ) ) ( not ( = ?auto_2366731 ?auto_2366732 ) ) ( not ( = ?auto_2366731 ?auto_2366733 ) ) ( not ( = ?auto_2366731 ?auto_2366734 ) ) ( not ( = ?auto_2366731 ?auto_2366735 ) ) ( not ( = ?auto_2366731 ?auto_2366739 ) ) ( not ( = ?auto_2366732 ?auto_2366733 ) ) ( not ( = ?auto_2366732 ?auto_2366734 ) ) ( not ( = ?auto_2366732 ?auto_2366735 ) ) ( not ( = ?auto_2366732 ?auto_2366739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2366733 ?auto_2366734 ?auto_2366735 )
      ( MAKE-16CRATE-VERIFY ?auto_2366719 ?auto_2366720 ?auto_2366721 ?auto_2366723 ?auto_2366722 ?auto_2366724 ?auto_2366725 ?auto_2366726 ?auto_2366727 ?auto_2366728 ?auto_2366729 ?auto_2366730 ?auto_2366731 ?auto_2366732 ?auto_2366733 ?auto_2366734 ?auto_2366735 ) )
  )

)

