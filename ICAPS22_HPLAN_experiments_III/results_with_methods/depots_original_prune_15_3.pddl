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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915252 - SURFACE
      ?auto_1915253 - SURFACE
    )
    :vars
    (
      ?auto_1915254 - HOIST
      ?auto_1915255 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915254 ?auto_1915255 ) ( SURFACE-AT ?auto_1915252 ?auto_1915255 ) ( CLEAR ?auto_1915252 ) ( LIFTING ?auto_1915254 ?auto_1915253 ) ( IS-CRATE ?auto_1915253 ) ( not ( = ?auto_1915252 ?auto_1915253 ) ) )
    :subtasks
    ( ( !DROP ?auto_1915254 ?auto_1915253 ?auto_1915252 ?auto_1915255 )
      ( MAKE-1CRATE-VERIFY ?auto_1915252 ?auto_1915253 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915256 - SURFACE
      ?auto_1915257 - SURFACE
    )
    :vars
    (
      ?auto_1915259 - HOIST
      ?auto_1915258 - PLACE
      ?auto_1915260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915259 ?auto_1915258 ) ( SURFACE-AT ?auto_1915256 ?auto_1915258 ) ( CLEAR ?auto_1915256 ) ( IS-CRATE ?auto_1915257 ) ( not ( = ?auto_1915256 ?auto_1915257 ) ) ( TRUCK-AT ?auto_1915260 ?auto_1915258 ) ( AVAILABLE ?auto_1915259 ) ( IN ?auto_1915257 ?auto_1915260 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1915259 ?auto_1915257 ?auto_1915260 ?auto_1915258 )
      ( MAKE-1CRATE ?auto_1915256 ?auto_1915257 )
      ( MAKE-1CRATE-VERIFY ?auto_1915256 ?auto_1915257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915261 - SURFACE
      ?auto_1915262 - SURFACE
    )
    :vars
    (
      ?auto_1915264 - HOIST
      ?auto_1915265 - PLACE
      ?auto_1915263 - TRUCK
      ?auto_1915266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915264 ?auto_1915265 ) ( SURFACE-AT ?auto_1915261 ?auto_1915265 ) ( CLEAR ?auto_1915261 ) ( IS-CRATE ?auto_1915262 ) ( not ( = ?auto_1915261 ?auto_1915262 ) ) ( AVAILABLE ?auto_1915264 ) ( IN ?auto_1915262 ?auto_1915263 ) ( TRUCK-AT ?auto_1915263 ?auto_1915266 ) ( not ( = ?auto_1915266 ?auto_1915265 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915263 ?auto_1915266 ?auto_1915265 )
      ( MAKE-1CRATE ?auto_1915261 ?auto_1915262 )
      ( MAKE-1CRATE-VERIFY ?auto_1915261 ?auto_1915262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915267 - SURFACE
      ?auto_1915268 - SURFACE
    )
    :vars
    (
      ?auto_1915269 - HOIST
      ?auto_1915272 - PLACE
      ?auto_1915271 - TRUCK
      ?auto_1915270 - PLACE
      ?auto_1915273 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915269 ?auto_1915272 ) ( SURFACE-AT ?auto_1915267 ?auto_1915272 ) ( CLEAR ?auto_1915267 ) ( IS-CRATE ?auto_1915268 ) ( not ( = ?auto_1915267 ?auto_1915268 ) ) ( AVAILABLE ?auto_1915269 ) ( TRUCK-AT ?auto_1915271 ?auto_1915270 ) ( not ( = ?auto_1915270 ?auto_1915272 ) ) ( HOIST-AT ?auto_1915273 ?auto_1915270 ) ( LIFTING ?auto_1915273 ?auto_1915268 ) ( not ( = ?auto_1915269 ?auto_1915273 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1915273 ?auto_1915268 ?auto_1915271 ?auto_1915270 )
      ( MAKE-1CRATE ?auto_1915267 ?auto_1915268 )
      ( MAKE-1CRATE-VERIFY ?auto_1915267 ?auto_1915268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915274 - SURFACE
      ?auto_1915275 - SURFACE
    )
    :vars
    (
      ?auto_1915276 - HOIST
      ?auto_1915277 - PLACE
      ?auto_1915279 - TRUCK
      ?auto_1915278 - PLACE
      ?auto_1915280 - HOIST
      ?auto_1915281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915276 ?auto_1915277 ) ( SURFACE-AT ?auto_1915274 ?auto_1915277 ) ( CLEAR ?auto_1915274 ) ( IS-CRATE ?auto_1915275 ) ( not ( = ?auto_1915274 ?auto_1915275 ) ) ( AVAILABLE ?auto_1915276 ) ( TRUCK-AT ?auto_1915279 ?auto_1915278 ) ( not ( = ?auto_1915278 ?auto_1915277 ) ) ( HOIST-AT ?auto_1915280 ?auto_1915278 ) ( not ( = ?auto_1915276 ?auto_1915280 ) ) ( AVAILABLE ?auto_1915280 ) ( SURFACE-AT ?auto_1915275 ?auto_1915278 ) ( ON ?auto_1915275 ?auto_1915281 ) ( CLEAR ?auto_1915275 ) ( not ( = ?auto_1915274 ?auto_1915281 ) ) ( not ( = ?auto_1915275 ?auto_1915281 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1915280 ?auto_1915275 ?auto_1915281 ?auto_1915278 )
      ( MAKE-1CRATE ?auto_1915274 ?auto_1915275 )
      ( MAKE-1CRATE-VERIFY ?auto_1915274 ?auto_1915275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915282 - SURFACE
      ?auto_1915283 - SURFACE
    )
    :vars
    (
      ?auto_1915285 - HOIST
      ?auto_1915286 - PLACE
      ?auto_1915289 - PLACE
      ?auto_1915288 - HOIST
      ?auto_1915284 - SURFACE
      ?auto_1915287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915285 ?auto_1915286 ) ( SURFACE-AT ?auto_1915282 ?auto_1915286 ) ( CLEAR ?auto_1915282 ) ( IS-CRATE ?auto_1915283 ) ( not ( = ?auto_1915282 ?auto_1915283 ) ) ( AVAILABLE ?auto_1915285 ) ( not ( = ?auto_1915289 ?auto_1915286 ) ) ( HOIST-AT ?auto_1915288 ?auto_1915289 ) ( not ( = ?auto_1915285 ?auto_1915288 ) ) ( AVAILABLE ?auto_1915288 ) ( SURFACE-AT ?auto_1915283 ?auto_1915289 ) ( ON ?auto_1915283 ?auto_1915284 ) ( CLEAR ?auto_1915283 ) ( not ( = ?auto_1915282 ?auto_1915284 ) ) ( not ( = ?auto_1915283 ?auto_1915284 ) ) ( TRUCK-AT ?auto_1915287 ?auto_1915286 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915287 ?auto_1915286 ?auto_1915289 )
      ( MAKE-1CRATE ?auto_1915282 ?auto_1915283 )
      ( MAKE-1CRATE-VERIFY ?auto_1915282 ?auto_1915283 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915299 - SURFACE
      ?auto_1915300 - SURFACE
      ?auto_1915301 - SURFACE
    )
    :vars
    (
      ?auto_1915302 - HOIST
      ?auto_1915303 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915302 ?auto_1915303 ) ( SURFACE-AT ?auto_1915300 ?auto_1915303 ) ( CLEAR ?auto_1915300 ) ( LIFTING ?auto_1915302 ?auto_1915301 ) ( IS-CRATE ?auto_1915301 ) ( not ( = ?auto_1915300 ?auto_1915301 ) ) ( ON ?auto_1915300 ?auto_1915299 ) ( not ( = ?auto_1915299 ?auto_1915300 ) ) ( not ( = ?auto_1915299 ?auto_1915301 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915300 ?auto_1915301 )
      ( MAKE-2CRATE-VERIFY ?auto_1915299 ?auto_1915300 ?auto_1915301 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915309 - SURFACE
      ?auto_1915310 - SURFACE
      ?auto_1915311 - SURFACE
    )
    :vars
    (
      ?auto_1915313 - HOIST
      ?auto_1915312 - PLACE
      ?auto_1915314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915313 ?auto_1915312 ) ( SURFACE-AT ?auto_1915310 ?auto_1915312 ) ( CLEAR ?auto_1915310 ) ( IS-CRATE ?auto_1915311 ) ( not ( = ?auto_1915310 ?auto_1915311 ) ) ( TRUCK-AT ?auto_1915314 ?auto_1915312 ) ( AVAILABLE ?auto_1915313 ) ( IN ?auto_1915311 ?auto_1915314 ) ( ON ?auto_1915310 ?auto_1915309 ) ( not ( = ?auto_1915309 ?auto_1915310 ) ) ( not ( = ?auto_1915309 ?auto_1915311 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915310 ?auto_1915311 )
      ( MAKE-2CRATE-VERIFY ?auto_1915309 ?auto_1915310 ?auto_1915311 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915315 - SURFACE
      ?auto_1915316 - SURFACE
    )
    :vars
    (
      ?auto_1915318 - HOIST
      ?auto_1915319 - PLACE
      ?auto_1915320 - TRUCK
      ?auto_1915317 - SURFACE
      ?auto_1915321 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915318 ?auto_1915319 ) ( SURFACE-AT ?auto_1915315 ?auto_1915319 ) ( CLEAR ?auto_1915315 ) ( IS-CRATE ?auto_1915316 ) ( not ( = ?auto_1915315 ?auto_1915316 ) ) ( AVAILABLE ?auto_1915318 ) ( IN ?auto_1915316 ?auto_1915320 ) ( ON ?auto_1915315 ?auto_1915317 ) ( not ( = ?auto_1915317 ?auto_1915315 ) ) ( not ( = ?auto_1915317 ?auto_1915316 ) ) ( TRUCK-AT ?auto_1915320 ?auto_1915321 ) ( not ( = ?auto_1915321 ?auto_1915319 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915320 ?auto_1915321 ?auto_1915319 )
      ( MAKE-2CRATE ?auto_1915317 ?auto_1915315 ?auto_1915316 )
      ( MAKE-1CRATE-VERIFY ?auto_1915315 ?auto_1915316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915322 - SURFACE
      ?auto_1915323 - SURFACE
      ?auto_1915324 - SURFACE
    )
    :vars
    (
      ?auto_1915328 - HOIST
      ?auto_1915327 - PLACE
      ?auto_1915325 - TRUCK
      ?auto_1915326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915328 ?auto_1915327 ) ( SURFACE-AT ?auto_1915323 ?auto_1915327 ) ( CLEAR ?auto_1915323 ) ( IS-CRATE ?auto_1915324 ) ( not ( = ?auto_1915323 ?auto_1915324 ) ) ( AVAILABLE ?auto_1915328 ) ( IN ?auto_1915324 ?auto_1915325 ) ( ON ?auto_1915323 ?auto_1915322 ) ( not ( = ?auto_1915322 ?auto_1915323 ) ) ( not ( = ?auto_1915322 ?auto_1915324 ) ) ( TRUCK-AT ?auto_1915325 ?auto_1915326 ) ( not ( = ?auto_1915326 ?auto_1915327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915323 ?auto_1915324 )
      ( MAKE-2CRATE-VERIFY ?auto_1915322 ?auto_1915323 ?auto_1915324 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915329 - SURFACE
      ?auto_1915330 - SURFACE
    )
    :vars
    (
      ?auto_1915333 - HOIST
      ?auto_1915335 - PLACE
      ?auto_1915334 - SURFACE
      ?auto_1915332 - TRUCK
      ?auto_1915331 - PLACE
      ?auto_1915336 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915333 ?auto_1915335 ) ( SURFACE-AT ?auto_1915329 ?auto_1915335 ) ( CLEAR ?auto_1915329 ) ( IS-CRATE ?auto_1915330 ) ( not ( = ?auto_1915329 ?auto_1915330 ) ) ( AVAILABLE ?auto_1915333 ) ( ON ?auto_1915329 ?auto_1915334 ) ( not ( = ?auto_1915334 ?auto_1915329 ) ) ( not ( = ?auto_1915334 ?auto_1915330 ) ) ( TRUCK-AT ?auto_1915332 ?auto_1915331 ) ( not ( = ?auto_1915331 ?auto_1915335 ) ) ( HOIST-AT ?auto_1915336 ?auto_1915331 ) ( LIFTING ?auto_1915336 ?auto_1915330 ) ( not ( = ?auto_1915333 ?auto_1915336 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1915336 ?auto_1915330 ?auto_1915332 ?auto_1915331 )
      ( MAKE-2CRATE ?auto_1915334 ?auto_1915329 ?auto_1915330 )
      ( MAKE-1CRATE-VERIFY ?auto_1915329 ?auto_1915330 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915337 - SURFACE
      ?auto_1915338 - SURFACE
      ?auto_1915339 - SURFACE
    )
    :vars
    (
      ?auto_1915342 - HOIST
      ?auto_1915344 - PLACE
      ?auto_1915340 - TRUCK
      ?auto_1915341 - PLACE
      ?auto_1915343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915342 ?auto_1915344 ) ( SURFACE-AT ?auto_1915338 ?auto_1915344 ) ( CLEAR ?auto_1915338 ) ( IS-CRATE ?auto_1915339 ) ( not ( = ?auto_1915338 ?auto_1915339 ) ) ( AVAILABLE ?auto_1915342 ) ( ON ?auto_1915338 ?auto_1915337 ) ( not ( = ?auto_1915337 ?auto_1915338 ) ) ( not ( = ?auto_1915337 ?auto_1915339 ) ) ( TRUCK-AT ?auto_1915340 ?auto_1915341 ) ( not ( = ?auto_1915341 ?auto_1915344 ) ) ( HOIST-AT ?auto_1915343 ?auto_1915341 ) ( LIFTING ?auto_1915343 ?auto_1915339 ) ( not ( = ?auto_1915342 ?auto_1915343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915338 ?auto_1915339 )
      ( MAKE-2CRATE-VERIFY ?auto_1915337 ?auto_1915338 ?auto_1915339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915345 - SURFACE
      ?auto_1915346 - SURFACE
    )
    :vars
    (
      ?auto_1915347 - HOIST
      ?auto_1915352 - PLACE
      ?auto_1915348 - SURFACE
      ?auto_1915351 - TRUCK
      ?auto_1915349 - PLACE
      ?auto_1915350 - HOIST
      ?auto_1915353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915347 ?auto_1915352 ) ( SURFACE-AT ?auto_1915345 ?auto_1915352 ) ( CLEAR ?auto_1915345 ) ( IS-CRATE ?auto_1915346 ) ( not ( = ?auto_1915345 ?auto_1915346 ) ) ( AVAILABLE ?auto_1915347 ) ( ON ?auto_1915345 ?auto_1915348 ) ( not ( = ?auto_1915348 ?auto_1915345 ) ) ( not ( = ?auto_1915348 ?auto_1915346 ) ) ( TRUCK-AT ?auto_1915351 ?auto_1915349 ) ( not ( = ?auto_1915349 ?auto_1915352 ) ) ( HOIST-AT ?auto_1915350 ?auto_1915349 ) ( not ( = ?auto_1915347 ?auto_1915350 ) ) ( AVAILABLE ?auto_1915350 ) ( SURFACE-AT ?auto_1915346 ?auto_1915349 ) ( ON ?auto_1915346 ?auto_1915353 ) ( CLEAR ?auto_1915346 ) ( not ( = ?auto_1915345 ?auto_1915353 ) ) ( not ( = ?auto_1915346 ?auto_1915353 ) ) ( not ( = ?auto_1915348 ?auto_1915353 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1915350 ?auto_1915346 ?auto_1915353 ?auto_1915349 )
      ( MAKE-2CRATE ?auto_1915348 ?auto_1915345 ?auto_1915346 )
      ( MAKE-1CRATE-VERIFY ?auto_1915345 ?auto_1915346 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915354 - SURFACE
      ?auto_1915355 - SURFACE
      ?auto_1915356 - SURFACE
    )
    :vars
    (
      ?auto_1915362 - HOIST
      ?auto_1915359 - PLACE
      ?auto_1915360 - TRUCK
      ?auto_1915361 - PLACE
      ?auto_1915357 - HOIST
      ?auto_1915358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915362 ?auto_1915359 ) ( SURFACE-AT ?auto_1915355 ?auto_1915359 ) ( CLEAR ?auto_1915355 ) ( IS-CRATE ?auto_1915356 ) ( not ( = ?auto_1915355 ?auto_1915356 ) ) ( AVAILABLE ?auto_1915362 ) ( ON ?auto_1915355 ?auto_1915354 ) ( not ( = ?auto_1915354 ?auto_1915355 ) ) ( not ( = ?auto_1915354 ?auto_1915356 ) ) ( TRUCK-AT ?auto_1915360 ?auto_1915361 ) ( not ( = ?auto_1915361 ?auto_1915359 ) ) ( HOIST-AT ?auto_1915357 ?auto_1915361 ) ( not ( = ?auto_1915362 ?auto_1915357 ) ) ( AVAILABLE ?auto_1915357 ) ( SURFACE-AT ?auto_1915356 ?auto_1915361 ) ( ON ?auto_1915356 ?auto_1915358 ) ( CLEAR ?auto_1915356 ) ( not ( = ?auto_1915355 ?auto_1915358 ) ) ( not ( = ?auto_1915356 ?auto_1915358 ) ) ( not ( = ?auto_1915354 ?auto_1915358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915355 ?auto_1915356 )
      ( MAKE-2CRATE-VERIFY ?auto_1915354 ?auto_1915355 ?auto_1915356 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915363 - SURFACE
      ?auto_1915364 - SURFACE
    )
    :vars
    (
      ?auto_1915370 - HOIST
      ?auto_1915367 - PLACE
      ?auto_1915366 - SURFACE
      ?auto_1915369 - PLACE
      ?auto_1915371 - HOIST
      ?auto_1915365 - SURFACE
      ?auto_1915368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915370 ?auto_1915367 ) ( SURFACE-AT ?auto_1915363 ?auto_1915367 ) ( CLEAR ?auto_1915363 ) ( IS-CRATE ?auto_1915364 ) ( not ( = ?auto_1915363 ?auto_1915364 ) ) ( AVAILABLE ?auto_1915370 ) ( ON ?auto_1915363 ?auto_1915366 ) ( not ( = ?auto_1915366 ?auto_1915363 ) ) ( not ( = ?auto_1915366 ?auto_1915364 ) ) ( not ( = ?auto_1915369 ?auto_1915367 ) ) ( HOIST-AT ?auto_1915371 ?auto_1915369 ) ( not ( = ?auto_1915370 ?auto_1915371 ) ) ( AVAILABLE ?auto_1915371 ) ( SURFACE-AT ?auto_1915364 ?auto_1915369 ) ( ON ?auto_1915364 ?auto_1915365 ) ( CLEAR ?auto_1915364 ) ( not ( = ?auto_1915363 ?auto_1915365 ) ) ( not ( = ?auto_1915364 ?auto_1915365 ) ) ( not ( = ?auto_1915366 ?auto_1915365 ) ) ( TRUCK-AT ?auto_1915368 ?auto_1915367 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915368 ?auto_1915367 ?auto_1915369 )
      ( MAKE-2CRATE ?auto_1915366 ?auto_1915363 ?auto_1915364 )
      ( MAKE-1CRATE-VERIFY ?auto_1915363 ?auto_1915364 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915372 - SURFACE
      ?auto_1915373 - SURFACE
      ?auto_1915374 - SURFACE
    )
    :vars
    (
      ?auto_1915375 - HOIST
      ?auto_1915379 - PLACE
      ?auto_1915380 - PLACE
      ?auto_1915378 - HOIST
      ?auto_1915376 - SURFACE
      ?auto_1915377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915375 ?auto_1915379 ) ( SURFACE-AT ?auto_1915373 ?auto_1915379 ) ( CLEAR ?auto_1915373 ) ( IS-CRATE ?auto_1915374 ) ( not ( = ?auto_1915373 ?auto_1915374 ) ) ( AVAILABLE ?auto_1915375 ) ( ON ?auto_1915373 ?auto_1915372 ) ( not ( = ?auto_1915372 ?auto_1915373 ) ) ( not ( = ?auto_1915372 ?auto_1915374 ) ) ( not ( = ?auto_1915380 ?auto_1915379 ) ) ( HOIST-AT ?auto_1915378 ?auto_1915380 ) ( not ( = ?auto_1915375 ?auto_1915378 ) ) ( AVAILABLE ?auto_1915378 ) ( SURFACE-AT ?auto_1915374 ?auto_1915380 ) ( ON ?auto_1915374 ?auto_1915376 ) ( CLEAR ?auto_1915374 ) ( not ( = ?auto_1915373 ?auto_1915376 ) ) ( not ( = ?auto_1915374 ?auto_1915376 ) ) ( not ( = ?auto_1915372 ?auto_1915376 ) ) ( TRUCK-AT ?auto_1915377 ?auto_1915379 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915373 ?auto_1915374 )
      ( MAKE-2CRATE-VERIFY ?auto_1915372 ?auto_1915373 ?auto_1915374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915381 - SURFACE
      ?auto_1915382 - SURFACE
    )
    :vars
    (
      ?auto_1915385 - HOIST
      ?auto_1915383 - PLACE
      ?auto_1915388 - SURFACE
      ?auto_1915386 - PLACE
      ?auto_1915389 - HOIST
      ?auto_1915387 - SURFACE
      ?auto_1915384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915385 ?auto_1915383 ) ( IS-CRATE ?auto_1915382 ) ( not ( = ?auto_1915381 ?auto_1915382 ) ) ( not ( = ?auto_1915388 ?auto_1915381 ) ) ( not ( = ?auto_1915388 ?auto_1915382 ) ) ( not ( = ?auto_1915386 ?auto_1915383 ) ) ( HOIST-AT ?auto_1915389 ?auto_1915386 ) ( not ( = ?auto_1915385 ?auto_1915389 ) ) ( AVAILABLE ?auto_1915389 ) ( SURFACE-AT ?auto_1915382 ?auto_1915386 ) ( ON ?auto_1915382 ?auto_1915387 ) ( CLEAR ?auto_1915382 ) ( not ( = ?auto_1915381 ?auto_1915387 ) ) ( not ( = ?auto_1915382 ?auto_1915387 ) ) ( not ( = ?auto_1915388 ?auto_1915387 ) ) ( TRUCK-AT ?auto_1915384 ?auto_1915383 ) ( SURFACE-AT ?auto_1915388 ?auto_1915383 ) ( CLEAR ?auto_1915388 ) ( LIFTING ?auto_1915385 ?auto_1915381 ) ( IS-CRATE ?auto_1915381 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915388 ?auto_1915381 )
      ( MAKE-2CRATE ?auto_1915388 ?auto_1915381 ?auto_1915382 )
      ( MAKE-1CRATE-VERIFY ?auto_1915381 ?auto_1915382 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915390 - SURFACE
      ?auto_1915391 - SURFACE
      ?auto_1915392 - SURFACE
    )
    :vars
    (
      ?auto_1915396 - HOIST
      ?auto_1915395 - PLACE
      ?auto_1915398 - PLACE
      ?auto_1915394 - HOIST
      ?auto_1915393 - SURFACE
      ?auto_1915397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915396 ?auto_1915395 ) ( IS-CRATE ?auto_1915392 ) ( not ( = ?auto_1915391 ?auto_1915392 ) ) ( not ( = ?auto_1915390 ?auto_1915391 ) ) ( not ( = ?auto_1915390 ?auto_1915392 ) ) ( not ( = ?auto_1915398 ?auto_1915395 ) ) ( HOIST-AT ?auto_1915394 ?auto_1915398 ) ( not ( = ?auto_1915396 ?auto_1915394 ) ) ( AVAILABLE ?auto_1915394 ) ( SURFACE-AT ?auto_1915392 ?auto_1915398 ) ( ON ?auto_1915392 ?auto_1915393 ) ( CLEAR ?auto_1915392 ) ( not ( = ?auto_1915391 ?auto_1915393 ) ) ( not ( = ?auto_1915392 ?auto_1915393 ) ) ( not ( = ?auto_1915390 ?auto_1915393 ) ) ( TRUCK-AT ?auto_1915397 ?auto_1915395 ) ( SURFACE-AT ?auto_1915390 ?auto_1915395 ) ( CLEAR ?auto_1915390 ) ( LIFTING ?auto_1915396 ?auto_1915391 ) ( IS-CRATE ?auto_1915391 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915391 ?auto_1915392 )
      ( MAKE-2CRATE-VERIFY ?auto_1915390 ?auto_1915391 ?auto_1915392 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915399 - SURFACE
      ?auto_1915400 - SURFACE
    )
    :vars
    (
      ?auto_1915407 - HOIST
      ?auto_1915403 - PLACE
      ?auto_1915401 - SURFACE
      ?auto_1915402 - PLACE
      ?auto_1915405 - HOIST
      ?auto_1915406 - SURFACE
      ?auto_1915404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915407 ?auto_1915403 ) ( IS-CRATE ?auto_1915400 ) ( not ( = ?auto_1915399 ?auto_1915400 ) ) ( not ( = ?auto_1915401 ?auto_1915399 ) ) ( not ( = ?auto_1915401 ?auto_1915400 ) ) ( not ( = ?auto_1915402 ?auto_1915403 ) ) ( HOIST-AT ?auto_1915405 ?auto_1915402 ) ( not ( = ?auto_1915407 ?auto_1915405 ) ) ( AVAILABLE ?auto_1915405 ) ( SURFACE-AT ?auto_1915400 ?auto_1915402 ) ( ON ?auto_1915400 ?auto_1915406 ) ( CLEAR ?auto_1915400 ) ( not ( = ?auto_1915399 ?auto_1915406 ) ) ( not ( = ?auto_1915400 ?auto_1915406 ) ) ( not ( = ?auto_1915401 ?auto_1915406 ) ) ( TRUCK-AT ?auto_1915404 ?auto_1915403 ) ( SURFACE-AT ?auto_1915401 ?auto_1915403 ) ( CLEAR ?auto_1915401 ) ( IS-CRATE ?auto_1915399 ) ( AVAILABLE ?auto_1915407 ) ( IN ?auto_1915399 ?auto_1915404 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1915407 ?auto_1915399 ?auto_1915404 ?auto_1915403 )
      ( MAKE-2CRATE ?auto_1915401 ?auto_1915399 ?auto_1915400 )
      ( MAKE-1CRATE-VERIFY ?auto_1915399 ?auto_1915400 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915408 - SURFACE
      ?auto_1915409 - SURFACE
      ?auto_1915410 - SURFACE
    )
    :vars
    (
      ?auto_1915414 - HOIST
      ?auto_1915416 - PLACE
      ?auto_1915413 - PLACE
      ?auto_1915415 - HOIST
      ?auto_1915412 - SURFACE
      ?auto_1915411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915414 ?auto_1915416 ) ( IS-CRATE ?auto_1915410 ) ( not ( = ?auto_1915409 ?auto_1915410 ) ) ( not ( = ?auto_1915408 ?auto_1915409 ) ) ( not ( = ?auto_1915408 ?auto_1915410 ) ) ( not ( = ?auto_1915413 ?auto_1915416 ) ) ( HOIST-AT ?auto_1915415 ?auto_1915413 ) ( not ( = ?auto_1915414 ?auto_1915415 ) ) ( AVAILABLE ?auto_1915415 ) ( SURFACE-AT ?auto_1915410 ?auto_1915413 ) ( ON ?auto_1915410 ?auto_1915412 ) ( CLEAR ?auto_1915410 ) ( not ( = ?auto_1915409 ?auto_1915412 ) ) ( not ( = ?auto_1915410 ?auto_1915412 ) ) ( not ( = ?auto_1915408 ?auto_1915412 ) ) ( TRUCK-AT ?auto_1915411 ?auto_1915416 ) ( SURFACE-AT ?auto_1915408 ?auto_1915416 ) ( CLEAR ?auto_1915408 ) ( IS-CRATE ?auto_1915409 ) ( AVAILABLE ?auto_1915414 ) ( IN ?auto_1915409 ?auto_1915411 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915409 ?auto_1915410 )
      ( MAKE-2CRATE-VERIFY ?auto_1915408 ?auto_1915409 ?auto_1915410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915417 - SURFACE
      ?auto_1915418 - SURFACE
    )
    :vars
    (
      ?auto_1915419 - HOIST
      ?auto_1915421 - PLACE
      ?auto_1915425 - SURFACE
      ?auto_1915420 - PLACE
      ?auto_1915422 - HOIST
      ?auto_1915423 - SURFACE
      ?auto_1915424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915419 ?auto_1915421 ) ( IS-CRATE ?auto_1915418 ) ( not ( = ?auto_1915417 ?auto_1915418 ) ) ( not ( = ?auto_1915425 ?auto_1915417 ) ) ( not ( = ?auto_1915425 ?auto_1915418 ) ) ( not ( = ?auto_1915420 ?auto_1915421 ) ) ( HOIST-AT ?auto_1915422 ?auto_1915420 ) ( not ( = ?auto_1915419 ?auto_1915422 ) ) ( AVAILABLE ?auto_1915422 ) ( SURFACE-AT ?auto_1915418 ?auto_1915420 ) ( ON ?auto_1915418 ?auto_1915423 ) ( CLEAR ?auto_1915418 ) ( not ( = ?auto_1915417 ?auto_1915423 ) ) ( not ( = ?auto_1915418 ?auto_1915423 ) ) ( not ( = ?auto_1915425 ?auto_1915423 ) ) ( SURFACE-AT ?auto_1915425 ?auto_1915421 ) ( CLEAR ?auto_1915425 ) ( IS-CRATE ?auto_1915417 ) ( AVAILABLE ?auto_1915419 ) ( IN ?auto_1915417 ?auto_1915424 ) ( TRUCK-AT ?auto_1915424 ?auto_1915420 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915424 ?auto_1915420 ?auto_1915421 )
      ( MAKE-2CRATE ?auto_1915425 ?auto_1915417 ?auto_1915418 )
      ( MAKE-1CRATE-VERIFY ?auto_1915417 ?auto_1915418 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915426 - SURFACE
      ?auto_1915427 - SURFACE
      ?auto_1915428 - SURFACE
    )
    :vars
    (
      ?auto_1915434 - HOIST
      ?auto_1915430 - PLACE
      ?auto_1915429 - PLACE
      ?auto_1915432 - HOIST
      ?auto_1915433 - SURFACE
      ?auto_1915431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915434 ?auto_1915430 ) ( IS-CRATE ?auto_1915428 ) ( not ( = ?auto_1915427 ?auto_1915428 ) ) ( not ( = ?auto_1915426 ?auto_1915427 ) ) ( not ( = ?auto_1915426 ?auto_1915428 ) ) ( not ( = ?auto_1915429 ?auto_1915430 ) ) ( HOIST-AT ?auto_1915432 ?auto_1915429 ) ( not ( = ?auto_1915434 ?auto_1915432 ) ) ( AVAILABLE ?auto_1915432 ) ( SURFACE-AT ?auto_1915428 ?auto_1915429 ) ( ON ?auto_1915428 ?auto_1915433 ) ( CLEAR ?auto_1915428 ) ( not ( = ?auto_1915427 ?auto_1915433 ) ) ( not ( = ?auto_1915428 ?auto_1915433 ) ) ( not ( = ?auto_1915426 ?auto_1915433 ) ) ( SURFACE-AT ?auto_1915426 ?auto_1915430 ) ( CLEAR ?auto_1915426 ) ( IS-CRATE ?auto_1915427 ) ( AVAILABLE ?auto_1915434 ) ( IN ?auto_1915427 ?auto_1915431 ) ( TRUCK-AT ?auto_1915431 ?auto_1915429 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915427 ?auto_1915428 )
      ( MAKE-2CRATE-VERIFY ?auto_1915426 ?auto_1915427 ?auto_1915428 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915435 - SURFACE
      ?auto_1915436 - SURFACE
    )
    :vars
    (
      ?auto_1915437 - HOIST
      ?auto_1915443 - PLACE
      ?auto_1915440 - SURFACE
      ?auto_1915441 - PLACE
      ?auto_1915438 - HOIST
      ?auto_1915442 - SURFACE
      ?auto_1915439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915437 ?auto_1915443 ) ( IS-CRATE ?auto_1915436 ) ( not ( = ?auto_1915435 ?auto_1915436 ) ) ( not ( = ?auto_1915440 ?auto_1915435 ) ) ( not ( = ?auto_1915440 ?auto_1915436 ) ) ( not ( = ?auto_1915441 ?auto_1915443 ) ) ( HOIST-AT ?auto_1915438 ?auto_1915441 ) ( not ( = ?auto_1915437 ?auto_1915438 ) ) ( SURFACE-AT ?auto_1915436 ?auto_1915441 ) ( ON ?auto_1915436 ?auto_1915442 ) ( CLEAR ?auto_1915436 ) ( not ( = ?auto_1915435 ?auto_1915442 ) ) ( not ( = ?auto_1915436 ?auto_1915442 ) ) ( not ( = ?auto_1915440 ?auto_1915442 ) ) ( SURFACE-AT ?auto_1915440 ?auto_1915443 ) ( CLEAR ?auto_1915440 ) ( IS-CRATE ?auto_1915435 ) ( AVAILABLE ?auto_1915437 ) ( TRUCK-AT ?auto_1915439 ?auto_1915441 ) ( LIFTING ?auto_1915438 ?auto_1915435 ) )
    :subtasks
    ( ( !LOAD ?auto_1915438 ?auto_1915435 ?auto_1915439 ?auto_1915441 )
      ( MAKE-2CRATE ?auto_1915440 ?auto_1915435 ?auto_1915436 )
      ( MAKE-1CRATE-VERIFY ?auto_1915435 ?auto_1915436 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915444 - SURFACE
      ?auto_1915445 - SURFACE
      ?auto_1915446 - SURFACE
    )
    :vars
    (
      ?auto_1915448 - HOIST
      ?auto_1915449 - PLACE
      ?auto_1915450 - PLACE
      ?auto_1915451 - HOIST
      ?auto_1915447 - SURFACE
      ?auto_1915452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915448 ?auto_1915449 ) ( IS-CRATE ?auto_1915446 ) ( not ( = ?auto_1915445 ?auto_1915446 ) ) ( not ( = ?auto_1915444 ?auto_1915445 ) ) ( not ( = ?auto_1915444 ?auto_1915446 ) ) ( not ( = ?auto_1915450 ?auto_1915449 ) ) ( HOIST-AT ?auto_1915451 ?auto_1915450 ) ( not ( = ?auto_1915448 ?auto_1915451 ) ) ( SURFACE-AT ?auto_1915446 ?auto_1915450 ) ( ON ?auto_1915446 ?auto_1915447 ) ( CLEAR ?auto_1915446 ) ( not ( = ?auto_1915445 ?auto_1915447 ) ) ( not ( = ?auto_1915446 ?auto_1915447 ) ) ( not ( = ?auto_1915444 ?auto_1915447 ) ) ( SURFACE-AT ?auto_1915444 ?auto_1915449 ) ( CLEAR ?auto_1915444 ) ( IS-CRATE ?auto_1915445 ) ( AVAILABLE ?auto_1915448 ) ( TRUCK-AT ?auto_1915452 ?auto_1915450 ) ( LIFTING ?auto_1915451 ?auto_1915445 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915445 ?auto_1915446 )
      ( MAKE-2CRATE-VERIFY ?auto_1915444 ?auto_1915445 ?auto_1915446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915453 - SURFACE
      ?auto_1915454 - SURFACE
    )
    :vars
    (
      ?auto_1915460 - HOIST
      ?auto_1915455 - PLACE
      ?auto_1915457 - SURFACE
      ?auto_1915459 - PLACE
      ?auto_1915456 - HOIST
      ?auto_1915461 - SURFACE
      ?auto_1915458 - TRUCK
      ?auto_1915462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915460 ?auto_1915455 ) ( IS-CRATE ?auto_1915454 ) ( not ( = ?auto_1915453 ?auto_1915454 ) ) ( not ( = ?auto_1915457 ?auto_1915453 ) ) ( not ( = ?auto_1915457 ?auto_1915454 ) ) ( not ( = ?auto_1915459 ?auto_1915455 ) ) ( HOIST-AT ?auto_1915456 ?auto_1915459 ) ( not ( = ?auto_1915460 ?auto_1915456 ) ) ( SURFACE-AT ?auto_1915454 ?auto_1915459 ) ( ON ?auto_1915454 ?auto_1915461 ) ( CLEAR ?auto_1915454 ) ( not ( = ?auto_1915453 ?auto_1915461 ) ) ( not ( = ?auto_1915454 ?auto_1915461 ) ) ( not ( = ?auto_1915457 ?auto_1915461 ) ) ( SURFACE-AT ?auto_1915457 ?auto_1915455 ) ( CLEAR ?auto_1915457 ) ( IS-CRATE ?auto_1915453 ) ( AVAILABLE ?auto_1915460 ) ( TRUCK-AT ?auto_1915458 ?auto_1915459 ) ( AVAILABLE ?auto_1915456 ) ( SURFACE-AT ?auto_1915453 ?auto_1915459 ) ( ON ?auto_1915453 ?auto_1915462 ) ( CLEAR ?auto_1915453 ) ( not ( = ?auto_1915453 ?auto_1915462 ) ) ( not ( = ?auto_1915454 ?auto_1915462 ) ) ( not ( = ?auto_1915457 ?auto_1915462 ) ) ( not ( = ?auto_1915461 ?auto_1915462 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1915456 ?auto_1915453 ?auto_1915462 ?auto_1915459 )
      ( MAKE-2CRATE ?auto_1915457 ?auto_1915453 ?auto_1915454 )
      ( MAKE-1CRATE-VERIFY ?auto_1915453 ?auto_1915454 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915463 - SURFACE
      ?auto_1915464 - SURFACE
      ?auto_1915465 - SURFACE
    )
    :vars
    (
      ?auto_1915467 - HOIST
      ?auto_1915468 - PLACE
      ?auto_1915470 - PLACE
      ?auto_1915466 - HOIST
      ?auto_1915471 - SURFACE
      ?auto_1915472 - TRUCK
      ?auto_1915469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915467 ?auto_1915468 ) ( IS-CRATE ?auto_1915465 ) ( not ( = ?auto_1915464 ?auto_1915465 ) ) ( not ( = ?auto_1915463 ?auto_1915464 ) ) ( not ( = ?auto_1915463 ?auto_1915465 ) ) ( not ( = ?auto_1915470 ?auto_1915468 ) ) ( HOIST-AT ?auto_1915466 ?auto_1915470 ) ( not ( = ?auto_1915467 ?auto_1915466 ) ) ( SURFACE-AT ?auto_1915465 ?auto_1915470 ) ( ON ?auto_1915465 ?auto_1915471 ) ( CLEAR ?auto_1915465 ) ( not ( = ?auto_1915464 ?auto_1915471 ) ) ( not ( = ?auto_1915465 ?auto_1915471 ) ) ( not ( = ?auto_1915463 ?auto_1915471 ) ) ( SURFACE-AT ?auto_1915463 ?auto_1915468 ) ( CLEAR ?auto_1915463 ) ( IS-CRATE ?auto_1915464 ) ( AVAILABLE ?auto_1915467 ) ( TRUCK-AT ?auto_1915472 ?auto_1915470 ) ( AVAILABLE ?auto_1915466 ) ( SURFACE-AT ?auto_1915464 ?auto_1915470 ) ( ON ?auto_1915464 ?auto_1915469 ) ( CLEAR ?auto_1915464 ) ( not ( = ?auto_1915464 ?auto_1915469 ) ) ( not ( = ?auto_1915465 ?auto_1915469 ) ) ( not ( = ?auto_1915463 ?auto_1915469 ) ) ( not ( = ?auto_1915471 ?auto_1915469 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915464 ?auto_1915465 )
      ( MAKE-2CRATE-VERIFY ?auto_1915463 ?auto_1915464 ?auto_1915465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915473 - SURFACE
      ?auto_1915474 - SURFACE
    )
    :vars
    (
      ?auto_1915481 - HOIST
      ?auto_1915475 - PLACE
      ?auto_1915476 - SURFACE
      ?auto_1915480 - PLACE
      ?auto_1915477 - HOIST
      ?auto_1915478 - SURFACE
      ?auto_1915482 - SURFACE
      ?auto_1915479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915481 ?auto_1915475 ) ( IS-CRATE ?auto_1915474 ) ( not ( = ?auto_1915473 ?auto_1915474 ) ) ( not ( = ?auto_1915476 ?auto_1915473 ) ) ( not ( = ?auto_1915476 ?auto_1915474 ) ) ( not ( = ?auto_1915480 ?auto_1915475 ) ) ( HOIST-AT ?auto_1915477 ?auto_1915480 ) ( not ( = ?auto_1915481 ?auto_1915477 ) ) ( SURFACE-AT ?auto_1915474 ?auto_1915480 ) ( ON ?auto_1915474 ?auto_1915478 ) ( CLEAR ?auto_1915474 ) ( not ( = ?auto_1915473 ?auto_1915478 ) ) ( not ( = ?auto_1915474 ?auto_1915478 ) ) ( not ( = ?auto_1915476 ?auto_1915478 ) ) ( SURFACE-AT ?auto_1915476 ?auto_1915475 ) ( CLEAR ?auto_1915476 ) ( IS-CRATE ?auto_1915473 ) ( AVAILABLE ?auto_1915481 ) ( AVAILABLE ?auto_1915477 ) ( SURFACE-AT ?auto_1915473 ?auto_1915480 ) ( ON ?auto_1915473 ?auto_1915482 ) ( CLEAR ?auto_1915473 ) ( not ( = ?auto_1915473 ?auto_1915482 ) ) ( not ( = ?auto_1915474 ?auto_1915482 ) ) ( not ( = ?auto_1915476 ?auto_1915482 ) ) ( not ( = ?auto_1915478 ?auto_1915482 ) ) ( TRUCK-AT ?auto_1915479 ?auto_1915475 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915479 ?auto_1915475 ?auto_1915480 )
      ( MAKE-2CRATE ?auto_1915476 ?auto_1915473 ?auto_1915474 )
      ( MAKE-1CRATE-VERIFY ?auto_1915473 ?auto_1915474 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915483 - SURFACE
      ?auto_1915484 - SURFACE
      ?auto_1915485 - SURFACE
    )
    :vars
    (
      ?auto_1915487 - HOIST
      ?auto_1915488 - PLACE
      ?auto_1915491 - PLACE
      ?auto_1915489 - HOIST
      ?auto_1915490 - SURFACE
      ?auto_1915492 - SURFACE
      ?auto_1915486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915487 ?auto_1915488 ) ( IS-CRATE ?auto_1915485 ) ( not ( = ?auto_1915484 ?auto_1915485 ) ) ( not ( = ?auto_1915483 ?auto_1915484 ) ) ( not ( = ?auto_1915483 ?auto_1915485 ) ) ( not ( = ?auto_1915491 ?auto_1915488 ) ) ( HOIST-AT ?auto_1915489 ?auto_1915491 ) ( not ( = ?auto_1915487 ?auto_1915489 ) ) ( SURFACE-AT ?auto_1915485 ?auto_1915491 ) ( ON ?auto_1915485 ?auto_1915490 ) ( CLEAR ?auto_1915485 ) ( not ( = ?auto_1915484 ?auto_1915490 ) ) ( not ( = ?auto_1915485 ?auto_1915490 ) ) ( not ( = ?auto_1915483 ?auto_1915490 ) ) ( SURFACE-AT ?auto_1915483 ?auto_1915488 ) ( CLEAR ?auto_1915483 ) ( IS-CRATE ?auto_1915484 ) ( AVAILABLE ?auto_1915487 ) ( AVAILABLE ?auto_1915489 ) ( SURFACE-AT ?auto_1915484 ?auto_1915491 ) ( ON ?auto_1915484 ?auto_1915492 ) ( CLEAR ?auto_1915484 ) ( not ( = ?auto_1915484 ?auto_1915492 ) ) ( not ( = ?auto_1915485 ?auto_1915492 ) ) ( not ( = ?auto_1915483 ?auto_1915492 ) ) ( not ( = ?auto_1915490 ?auto_1915492 ) ) ( TRUCK-AT ?auto_1915486 ?auto_1915488 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915484 ?auto_1915485 )
      ( MAKE-2CRATE-VERIFY ?auto_1915483 ?auto_1915484 ?auto_1915485 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915511 - SURFACE
      ?auto_1915512 - SURFACE
      ?auto_1915513 - SURFACE
      ?auto_1915514 - SURFACE
    )
    :vars
    (
      ?auto_1915515 - HOIST
      ?auto_1915516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915515 ?auto_1915516 ) ( SURFACE-AT ?auto_1915513 ?auto_1915516 ) ( CLEAR ?auto_1915513 ) ( LIFTING ?auto_1915515 ?auto_1915514 ) ( IS-CRATE ?auto_1915514 ) ( not ( = ?auto_1915513 ?auto_1915514 ) ) ( ON ?auto_1915512 ?auto_1915511 ) ( ON ?auto_1915513 ?auto_1915512 ) ( not ( = ?auto_1915511 ?auto_1915512 ) ) ( not ( = ?auto_1915511 ?auto_1915513 ) ) ( not ( = ?auto_1915511 ?auto_1915514 ) ) ( not ( = ?auto_1915512 ?auto_1915513 ) ) ( not ( = ?auto_1915512 ?auto_1915514 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915513 ?auto_1915514 )
      ( MAKE-3CRATE-VERIFY ?auto_1915511 ?auto_1915512 ?auto_1915513 ?auto_1915514 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915528 - SURFACE
      ?auto_1915529 - SURFACE
      ?auto_1915530 - SURFACE
      ?auto_1915531 - SURFACE
    )
    :vars
    (
      ?auto_1915534 - HOIST
      ?auto_1915532 - PLACE
      ?auto_1915533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915534 ?auto_1915532 ) ( SURFACE-AT ?auto_1915530 ?auto_1915532 ) ( CLEAR ?auto_1915530 ) ( IS-CRATE ?auto_1915531 ) ( not ( = ?auto_1915530 ?auto_1915531 ) ) ( TRUCK-AT ?auto_1915533 ?auto_1915532 ) ( AVAILABLE ?auto_1915534 ) ( IN ?auto_1915531 ?auto_1915533 ) ( ON ?auto_1915530 ?auto_1915529 ) ( not ( = ?auto_1915529 ?auto_1915530 ) ) ( not ( = ?auto_1915529 ?auto_1915531 ) ) ( ON ?auto_1915529 ?auto_1915528 ) ( not ( = ?auto_1915528 ?auto_1915529 ) ) ( not ( = ?auto_1915528 ?auto_1915530 ) ) ( not ( = ?auto_1915528 ?auto_1915531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915529 ?auto_1915530 ?auto_1915531 )
      ( MAKE-3CRATE-VERIFY ?auto_1915528 ?auto_1915529 ?auto_1915530 ?auto_1915531 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915549 - SURFACE
      ?auto_1915550 - SURFACE
      ?auto_1915551 - SURFACE
      ?auto_1915552 - SURFACE
    )
    :vars
    (
      ?auto_1915554 - HOIST
      ?auto_1915553 - PLACE
      ?auto_1915556 - TRUCK
      ?auto_1915555 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915554 ?auto_1915553 ) ( SURFACE-AT ?auto_1915551 ?auto_1915553 ) ( CLEAR ?auto_1915551 ) ( IS-CRATE ?auto_1915552 ) ( not ( = ?auto_1915551 ?auto_1915552 ) ) ( AVAILABLE ?auto_1915554 ) ( IN ?auto_1915552 ?auto_1915556 ) ( ON ?auto_1915551 ?auto_1915550 ) ( not ( = ?auto_1915550 ?auto_1915551 ) ) ( not ( = ?auto_1915550 ?auto_1915552 ) ) ( TRUCK-AT ?auto_1915556 ?auto_1915555 ) ( not ( = ?auto_1915555 ?auto_1915553 ) ) ( ON ?auto_1915550 ?auto_1915549 ) ( not ( = ?auto_1915549 ?auto_1915550 ) ) ( not ( = ?auto_1915549 ?auto_1915551 ) ) ( not ( = ?auto_1915549 ?auto_1915552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915550 ?auto_1915551 ?auto_1915552 )
      ( MAKE-3CRATE-VERIFY ?auto_1915549 ?auto_1915550 ?auto_1915551 ?auto_1915552 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915573 - SURFACE
      ?auto_1915574 - SURFACE
      ?auto_1915575 - SURFACE
      ?auto_1915576 - SURFACE
    )
    :vars
    (
      ?auto_1915578 - HOIST
      ?auto_1915581 - PLACE
      ?auto_1915579 - TRUCK
      ?auto_1915580 - PLACE
      ?auto_1915577 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915578 ?auto_1915581 ) ( SURFACE-AT ?auto_1915575 ?auto_1915581 ) ( CLEAR ?auto_1915575 ) ( IS-CRATE ?auto_1915576 ) ( not ( = ?auto_1915575 ?auto_1915576 ) ) ( AVAILABLE ?auto_1915578 ) ( ON ?auto_1915575 ?auto_1915574 ) ( not ( = ?auto_1915574 ?auto_1915575 ) ) ( not ( = ?auto_1915574 ?auto_1915576 ) ) ( TRUCK-AT ?auto_1915579 ?auto_1915580 ) ( not ( = ?auto_1915580 ?auto_1915581 ) ) ( HOIST-AT ?auto_1915577 ?auto_1915580 ) ( LIFTING ?auto_1915577 ?auto_1915576 ) ( not ( = ?auto_1915578 ?auto_1915577 ) ) ( ON ?auto_1915574 ?auto_1915573 ) ( not ( = ?auto_1915573 ?auto_1915574 ) ) ( not ( = ?auto_1915573 ?auto_1915575 ) ) ( not ( = ?auto_1915573 ?auto_1915576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915574 ?auto_1915575 ?auto_1915576 )
      ( MAKE-3CRATE-VERIFY ?auto_1915573 ?auto_1915574 ?auto_1915575 ?auto_1915576 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915600 - SURFACE
      ?auto_1915601 - SURFACE
      ?auto_1915602 - SURFACE
      ?auto_1915603 - SURFACE
    )
    :vars
    (
      ?auto_1915606 - HOIST
      ?auto_1915609 - PLACE
      ?auto_1915605 - TRUCK
      ?auto_1915604 - PLACE
      ?auto_1915608 - HOIST
      ?auto_1915607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915606 ?auto_1915609 ) ( SURFACE-AT ?auto_1915602 ?auto_1915609 ) ( CLEAR ?auto_1915602 ) ( IS-CRATE ?auto_1915603 ) ( not ( = ?auto_1915602 ?auto_1915603 ) ) ( AVAILABLE ?auto_1915606 ) ( ON ?auto_1915602 ?auto_1915601 ) ( not ( = ?auto_1915601 ?auto_1915602 ) ) ( not ( = ?auto_1915601 ?auto_1915603 ) ) ( TRUCK-AT ?auto_1915605 ?auto_1915604 ) ( not ( = ?auto_1915604 ?auto_1915609 ) ) ( HOIST-AT ?auto_1915608 ?auto_1915604 ) ( not ( = ?auto_1915606 ?auto_1915608 ) ) ( AVAILABLE ?auto_1915608 ) ( SURFACE-AT ?auto_1915603 ?auto_1915604 ) ( ON ?auto_1915603 ?auto_1915607 ) ( CLEAR ?auto_1915603 ) ( not ( = ?auto_1915602 ?auto_1915607 ) ) ( not ( = ?auto_1915603 ?auto_1915607 ) ) ( not ( = ?auto_1915601 ?auto_1915607 ) ) ( ON ?auto_1915601 ?auto_1915600 ) ( not ( = ?auto_1915600 ?auto_1915601 ) ) ( not ( = ?auto_1915600 ?auto_1915602 ) ) ( not ( = ?auto_1915600 ?auto_1915603 ) ) ( not ( = ?auto_1915600 ?auto_1915607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915601 ?auto_1915602 ?auto_1915603 )
      ( MAKE-3CRATE-VERIFY ?auto_1915600 ?auto_1915601 ?auto_1915602 ?auto_1915603 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915628 - SURFACE
      ?auto_1915629 - SURFACE
      ?auto_1915630 - SURFACE
      ?auto_1915631 - SURFACE
    )
    :vars
    (
      ?auto_1915634 - HOIST
      ?auto_1915632 - PLACE
      ?auto_1915635 - PLACE
      ?auto_1915633 - HOIST
      ?auto_1915636 - SURFACE
      ?auto_1915637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915634 ?auto_1915632 ) ( SURFACE-AT ?auto_1915630 ?auto_1915632 ) ( CLEAR ?auto_1915630 ) ( IS-CRATE ?auto_1915631 ) ( not ( = ?auto_1915630 ?auto_1915631 ) ) ( AVAILABLE ?auto_1915634 ) ( ON ?auto_1915630 ?auto_1915629 ) ( not ( = ?auto_1915629 ?auto_1915630 ) ) ( not ( = ?auto_1915629 ?auto_1915631 ) ) ( not ( = ?auto_1915635 ?auto_1915632 ) ) ( HOIST-AT ?auto_1915633 ?auto_1915635 ) ( not ( = ?auto_1915634 ?auto_1915633 ) ) ( AVAILABLE ?auto_1915633 ) ( SURFACE-AT ?auto_1915631 ?auto_1915635 ) ( ON ?auto_1915631 ?auto_1915636 ) ( CLEAR ?auto_1915631 ) ( not ( = ?auto_1915630 ?auto_1915636 ) ) ( not ( = ?auto_1915631 ?auto_1915636 ) ) ( not ( = ?auto_1915629 ?auto_1915636 ) ) ( TRUCK-AT ?auto_1915637 ?auto_1915632 ) ( ON ?auto_1915629 ?auto_1915628 ) ( not ( = ?auto_1915628 ?auto_1915629 ) ) ( not ( = ?auto_1915628 ?auto_1915630 ) ) ( not ( = ?auto_1915628 ?auto_1915631 ) ) ( not ( = ?auto_1915628 ?auto_1915636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915629 ?auto_1915630 ?auto_1915631 )
      ( MAKE-3CRATE-VERIFY ?auto_1915628 ?auto_1915629 ?auto_1915630 ?auto_1915631 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915656 - SURFACE
      ?auto_1915657 - SURFACE
      ?auto_1915658 - SURFACE
      ?auto_1915659 - SURFACE
    )
    :vars
    (
      ?auto_1915665 - HOIST
      ?auto_1915662 - PLACE
      ?auto_1915660 - PLACE
      ?auto_1915663 - HOIST
      ?auto_1915661 - SURFACE
      ?auto_1915664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915665 ?auto_1915662 ) ( IS-CRATE ?auto_1915659 ) ( not ( = ?auto_1915658 ?auto_1915659 ) ) ( not ( = ?auto_1915657 ?auto_1915658 ) ) ( not ( = ?auto_1915657 ?auto_1915659 ) ) ( not ( = ?auto_1915660 ?auto_1915662 ) ) ( HOIST-AT ?auto_1915663 ?auto_1915660 ) ( not ( = ?auto_1915665 ?auto_1915663 ) ) ( AVAILABLE ?auto_1915663 ) ( SURFACE-AT ?auto_1915659 ?auto_1915660 ) ( ON ?auto_1915659 ?auto_1915661 ) ( CLEAR ?auto_1915659 ) ( not ( = ?auto_1915658 ?auto_1915661 ) ) ( not ( = ?auto_1915659 ?auto_1915661 ) ) ( not ( = ?auto_1915657 ?auto_1915661 ) ) ( TRUCK-AT ?auto_1915664 ?auto_1915662 ) ( SURFACE-AT ?auto_1915657 ?auto_1915662 ) ( CLEAR ?auto_1915657 ) ( LIFTING ?auto_1915665 ?auto_1915658 ) ( IS-CRATE ?auto_1915658 ) ( ON ?auto_1915657 ?auto_1915656 ) ( not ( = ?auto_1915656 ?auto_1915657 ) ) ( not ( = ?auto_1915656 ?auto_1915658 ) ) ( not ( = ?auto_1915656 ?auto_1915659 ) ) ( not ( = ?auto_1915656 ?auto_1915661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915657 ?auto_1915658 ?auto_1915659 )
      ( MAKE-3CRATE-VERIFY ?auto_1915656 ?auto_1915657 ?auto_1915658 ?auto_1915659 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915684 - SURFACE
      ?auto_1915685 - SURFACE
      ?auto_1915686 - SURFACE
      ?auto_1915687 - SURFACE
    )
    :vars
    (
      ?auto_1915690 - HOIST
      ?auto_1915691 - PLACE
      ?auto_1915688 - PLACE
      ?auto_1915689 - HOIST
      ?auto_1915692 - SURFACE
      ?auto_1915693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915690 ?auto_1915691 ) ( IS-CRATE ?auto_1915687 ) ( not ( = ?auto_1915686 ?auto_1915687 ) ) ( not ( = ?auto_1915685 ?auto_1915686 ) ) ( not ( = ?auto_1915685 ?auto_1915687 ) ) ( not ( = ?auto_1915688 ?auto_1915691 ) ) ( HOIST-AT ?auto_1915689 ?auto_1915688 ) ( not ( = ?auto_1915690 ?auto_1915689 ) ) ( AVAILABLE ?auto_1915689 ) ( SURFACE-AT ?auto_1915687 ?auto_1915688 ) ( ON ?auto_1915687 ?auto_1915692 ) ( CLEAR ?auto_1915687 ) ( not ( = ?auto_1915686 ?auto_1915692 ) ) ( not ( = ?auto_1915687 ?auto_1915692 ) ) ( not ( = ?auto_1915685 ?auto_1915692 ) ) ( TRUCK-AT ?auto_1915693 ?auto_1915691 ) ( SURFACE-AT ?auto_1915685 ?auto_1915691 ) ( CLEAR ?auto_1915685 ) ( IS-CRATE ?auto_1915686 ) ( AVAILABLE ?auto_1915690 ) ( IN ?auto_1915686 ?auto_1915693 ) ( ON ?auto_1915685 ?auto_1915684 ) ( not ( = ?auto_1915684 ?auto_1915685 ) ) ( not ( = ?auto_1915684 ?auto_1915686 ) ) ( not ( = ?auto_1915684 ?auto_1915687 ) ) ( not ( = ?auto_1915684 ?auto_1915692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915685 ?auto_1915686 ?auto_1915687 )
      ( MAKE-3CRATE-VERIFY ?auto_1915684 ?auto_1915685 ?auto_1915686 ?auto_1915687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915763 - SURFACE
      ?auto_1915764 - SURFACE
    )
    :vars
    (
      ?auto_1915766 - HOIST
      ?auto_1915770 - PLACE
      ?auto_1915765 - SURFACE
      ?auto_1915771 - PLACE
      ?auto_1915768 - HOIST
      ?auto_1915767 - SURFACE
      ?auto_1915769 - TRUCK
      ?auto_1915772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915766 ?auto_1915770 ) ( SURFACE-AT ?auto_1915763 ?auto_1915770 ) ( CLEAR ?auto_1915763 ) ( IS-CRATE ?auto_1915764 ) ( not ( = ?auto_1915763 ?auto_1915764 ) ) ( AVAILABLE ?auto_1915766 ) ( ON ?auto_1915763 ?auto_1915765 ) ( not ( = ?auto_1915765 ?auto_1915763 ) ) ( not ( = ?auto_1915765 ?auto_1915764 ) ) ( not ( = ?auto_1915771 ?auto_1915770 ) ) ( HOIST-AT ?auto_1915768 ?auto_1915771 ) ( not ( = ?auto_1915766 ?auto_1915768 ) ) ( AVAILABLE ?auto_1915768 ) ( SURFACE-AT ?auto_1915764 ?auto_1915771 ) ( ON ?auto_1915764 ?auto_1915767 ) ( CLEAR ?auto_1915764 ) ( not ( = ?auto_1915763 ?auto_1915767 ) ) ( not ( = ?auto_1915764 ?auto_1915767 ) ) ( not ( = ?auto_1915765 ?auto_1915767 ) ) ( TRUCK-AT ?auto_1915769 ?auto_1915772 ) ( not ( = ?auto_1915772 ?auto_1915770 ) ) ( not ( = ?auto_1915771 ?auto_1915772 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915769 ?auto_1915772 ?auto_1915770 )
      ( MAKE-1CRATE ?auto_1915763 ?auto_1915764 )
      ( MAKE-1CRATE-VERIFY ?auto_1915763 ?auto_1915764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915869 - SURFACE
      ?auto_1915870 - SURFACE
    )
    :vars
    (
      ?auto_1915871 - HOIST
      ?auto_1915873 - PLACE
      ?auto_1915875 - SURFACE
      ?auto_1915876 - PLACE
      ?auto_1915872 - HOIST
      ?auto_1915877 - SURFACE
      ?auto_1915874 - TRUCK
      ?auto_1915878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915871 ?auto_1915873 ) ( SURFACE-AT ?auto_1915869 ?auto_1915873 ) ( CLEAR ?auto_1915869 ) ( IS-CRATE ?auto_1915870 ) ( not ( = ?auto_1915869 ?auto_1915870 ) ) ( ON ?auto_1915869 ?auto_1915875 ) ( not ( = ?auto_1915875 ?auto_1915869 ) ) ( not ( = ?auto_1915875 ?auto_1915870 ) ) ( not ( = ?auto_1915876 ?auto_1915873 ) ) ( HOIST-AT ?auto_1915872 ?auto_1915876 ) ( not ( = ?auto_1915871 ?auto_1915872 ) ) ( AVAILABLE ?auto_1915872 ) ( SURFACE-AT ?auto_1915870 ?auto_1915876 ) ( ON ?auto_1915870 ?auto_1915877 ) ( CLEAR ?auto_1915870 ) ( not ( = ?auto_1915869 ?auto_1915877 ) ) ( not ( = ?auto_1915870 ?auto_1915877 ) ) ( not ( = ?auto_1915875 ?auto_1915877 ) ) ( TRUCK-AT ?auto_1915874 ?auto_1915873 ) ( LIFTING ?auto_1915871 ?auto_1915878 ) ( IS-CRATE ?auto_1915878 ) ( not ( = ?auto_1915869 ?auto_1915878 ) ) ( not ( = ?auto_1915870 ?auto_1915878 ) ) ( not ( = ?auto_1915875 ?auto_1915878 ) ) ( not ( = ?auto_1915877 ?auto_1915878 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1915871 ?auto_1915878 ?auto_1915874 ?auto_1915873 )
      ( MAKE-1CRATE ?auto_1915869 ?auto_1915870 )
      ( MAKE-1CRATE-VERIFY ?auto_1915869 ?auto_1915870 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915977 - SURFACE
      ?auto_1915978 - SURFACE
      ?auto_1915979 - SURFACE
      ?auto_1915980 - SURFACE
      ?auto_1915981 - SURFACE
    )
    :vars
    (
      ?auto_1915983 - HOIST
      ?auto_1915982 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915983 ?auto_1915982 ) ( SURFACE-AT ?auto_1915980 ?auto_1915982 ) ( CLEAR ?auto_1915980 ) ( LIFTING ?auto_1915983 ?auto_1915981 ) ( IS-CRATE ?auto_1915981 ) ( not ( = ?auto_1915980 ?auto_1915981 ) ) ( ON ?auto_1915978 ?auto_1915977 ) ( ON ?auto_1915979 ?auto_1915978 ) ( ON ?auto_1915980 ?auto_1915979 ) ( not ( = ?auto_1915977 ?auto_1915978 ) ) ( not ( = ?auto_1915977 ?auto_1915979 ) ) ( not ( = ?auto_1915977 ?auto_1915980 ) ) ( not ( = ?auto_1915977 ?auto_1915981 ) ) ( not ( = ?auto_1915978 ?auto_1915979 ) ) ( not ( = ?auto_1915978 ?auto_1915980 ) ) ( not ( = ?auto_1915978 ?auto_1915981 ) ) ( not ( = ?auto_1915979 ?auto_1915980 ) ) ( not ( = ?auto_1915979 ?auto_1915981 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915980 ?auto_1915981 )
      ( MAKE-4CRATE-VERIFY ?auto_1915977 ?auto_1915978 ?auto_1915979 ?auto_1915980 ?auto_1915981 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916002 - SURFACE
      ?auto_1916003 - SURFACE
      ?auto_1916004 - SURFACE
      ?auto_1916005 - SURFACE
      ?auto_1916006 - SURFACE
    )
    :vars
    (
      ?auto_1916008 - HOIST
      ?auto_1916007 - PLACE
      ?auto_1916009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916008 ?auto_1916007 ) ( SURFACE-AT ?auto_1916005 ?auto_1916007 ) ( CLEAR ?auto_1916005 ) ( IS-CRATE ?auto_1916006 ) ( not ( = ?auto_1916005 ?auto_1916006 ) ) ( TRUCK-AT ?auto_1916009 ?auto_1916007 ) ( AVAILABLE ?auto_1916008 ) ( IN ?auto_1916006 ?auto_1916009 ) ( ON ?auto_1916005 ?auto_1916004 ) ( not ( = ?auto_1916004 ?auto_1916005 ) ) ( not ( = ?auto_1916004 ?auto_1916006 ) ) ( ON ?auto_1916003 ?auto_1916002 ) ( ON ?auto_1916004 ?auto_1916003 ) ( not ( = ?auto_1916002 ?auto_1916003 ) ) ( not ( = ?auto_1916002 ?auto_1916004 ) ) ( not ( = ?auto_1916002 ?auto_1916005 ) ) ( not ( = ?auto_1916002 ?auto_1916006 ) ) ( not ( = ?auto_1916003 ?auto_1916004 ) ) ( not ( = ?auto_1916003 ?auto_1916005 ) ) ( not ( = ?auto_1916003 ?auto_1916006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916004 ?auto_1916005 ?auto_1916006 )
      ( MAKE-4CRATE-VERIFY ?auto_1916002 ?auto_1916003 ?auto_1916004 ?auto_1916005 ?auto_1916006 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916032 - SURFACE
      ?auto_1916033 - SURFACE
      ?auto_1916034 - SURFACE
      ?auto_1916035 - SURFACE
      ?auto_1916036 - SURFACE
    )
    :vars
    (
      ?auto_1916040 - HOIST
      ?auto_1916038 - PLACE
      ?auto_1916037 - TRUCK
      ?auto_1916039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916040 ?auto_1916038 ) ( SURFACE-AT ?auto_1916035 ?auto_1916038 ) ( CLEAR ?auto_1916035 ) ( IS-CRATE ?auto_1916036 ) ( not ( = ?auto_1916035 ?auto_1916036 ) ) ( AVAILABLE ?auto_1916040 ) ( IN ?auto_1916036 ?auto_1916037 ) ( ON ?auto_1916035 ?auto_1916034 ) ( not ( = ?auto_1916034 ?auto_1916035 ) ) ( not ( = ?auto_1916034 ?auto_1916036 ) ) ( TRUCK-AT ?auto_1916037 ?auto_1916039 ) ( not ( = ?auto_1916039 ?auto_1916038 ) ) ( ON ?auto_1916033 ?auto_1916032 ) ( ON ?auto_1916034 ?auto_1916033 ) ( not ( = ?auto_1916032 ?auto_1916033 ) ) ( not ( = ?auto_1916032 ?auto_1916034 ) ) ( not ( = ?auto_1916032 ?auto_1916035 ) ) ( not ( = ?auto_1916032 ?auto_1916036 ) ) ( not ( = ?auto_1916033 ?auto_1916034 ) ) ( not ( = ?auto_1916033 ?auto_1916035 ) ) ( not ( = ?auto_1916033 ?auto_1916036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916034 ?auto_1916035 ?auto_1916036 )
      ( MAKE-4CRATE-VERIFY ?auto_1916032 ?auto_1916033 ?auto_1916034 ?auto_1916035 ?auto_1916036 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916066 - SURFACE
      ?auto_1916067 - SURFACE
      ?auto_1916068 - SURFACE
      ?auto_1916069 - SURFACE
      ?auto_1916070 - SURFACE
    )
    :vars
    (
      ?auto_1916072 - HOIST
      ?auto_1916075 - PLACE
      ?auto_1916074 - TRUCK
      ?auto_1916071 - PLACE
      ?auto_1916073 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916072 ?auto_1916075 ) ( SURFACE-AT ?auto_1916069 ?auto_1916075 ) ( CLEAR ?auto_1916069 ) ( IS-CRATE ?auto_1916070 ) ( not ( = ?auto_1916069 ?auto_1916070 ) ) ( AVAILABLE ?auto_1916072 ) ( ON ?auto_1916069 ?auto_1916068 ) ( not ( = ?auto_1916068 ?auto_1916069 ) ) ( not ( = ?auto_1916068 ?auto_1916070 ) ) ( TRUCK-AT ?auto_1916074 ?auto_1916071 ) ( not ( = ?auto_1916071 ?auto_1916075 ) ) ( HOIST-AT ?auto_1916073 ?auto_1916071 ) ( LIFTING ?auto_1916073 ?auto_1916070 ) ( not ( = ?auto_1916072 ?auto_1916073 ) ) ( ON ?auto_1916067 ?auto_1916066 ) ( ON ?auto_1916068 ?auto_1916067 ) ( not ( = ?auto_1916066 ?auto_1916067 ) ) ( not ( = ?auto_1916066 ?auto_1916068 ) ) ( not ( = ?auto_1916066 ?auto_1916069 ) ) ( not ( = ?auto_1916066 ?auto_1916070 ) ) ( not ( = ?auto_1916067 ?auto_1916068 ) ) ( not ( = ?auto_1916067 ?auto_1916069 ) ) ( not ( = ?auto_1916067 ?auto_1916070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916068 ?auto_1916069 ?auto_1916070 )
      ( MAKE-4CRATE-VERIFY ?auto_1916066 ?auto_1916067 ?auto_1916068 ?auto_1916069 ?auto_1916070 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916104 - SURFACE
      ?auto_1916105 - SURFACE
      ?auto_1916106 - SURFACE
      ?auto_1916107 - SURFACE
      ?auto_1916108 - SURFACE
    )
    :vars
    (
      ?auto_1916109 - HOIST
      ?auto_1916111 - PLACE
      ?auto_1916112 - TRUCK
      ?auto_1916114 - PLACE
      ?auto_1916110 - HOIST
      ?auto_1916113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916109 ?auto_1916111 ) ( SURFACE-AT ?auto_1916107 ?auto_1916111 ) ( CLEAR ?auto_1916107 ) ( IS-CRATE ?auto_1916108 ) ( not ( = ?auto_1916107 ?auto_1916108 ) ) ( AVAILABLE ?auto_1916109 ) ( ON ?auto_1916107 ?auto_1916106 ) ( not ( = ?auto_1916106 ?auto_1916107 ) ) ( not ( = ?auto_1916106 ?auto_1916108 ) ) ( TRUCK-AT ?auto_1916112 ?auto_1916114 ) ( not ( = ?auto_1916114 ?auto_1916111 ) ) ( HOIST-AT ?auto_1916110 ?auto_1916114 ) ( not ( = ?auto_1916109 ?auto_1916110 ) ) ( AVAILABLE ?auto_1916110 ) ( SURFACE-AT ?auto_1916108 ?auto_1916114 ) ( ON ?auto_1916108 ?auto_1916113 ) ( CLEAR ?auto_1916108 ) ( not ( = ?auto_1916107 ?auto_1916113 ) ) ( not ( = ?auto_1916108 ?auto_1916113 ) ) ( not ( = ?auto_1916106 ?auto_1916113 ) ) ( ON ?auto_1916105 ?auto_1916104 ) ( ON ?auto_1916106 ?auto_1916105 ) ( not ( = ?auto_1916104 ?auto_1916105 ) ) ( not ( = ?auto_1916104 ?auto_1916106 ) ) ( not ( = ?auto_1916104 ?auto_1916107 ) ) ( not ( = ?auto_1916104 ?auto_1916108 ) ) ( not ( = ?auto_1916104 ?auto_1916113 ) ) ( not ( = ?auto_1916105 ?auto_1916106 ) ) ( not ( = ?auto_1916105 ?auto_1916107 ) ) ( not ( = ?auto_1916105 ?auto_1916108 ) ) ( not ( = ?auto_1916105 ?auto_1916113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916106 ?auto_1916107 ?auto_1916108 )
      ( MAKE-4CRATE-VERIFY ?auto_1916104 ?auto_1916105 ?auto_1916106 ?auto_1916107 ?auto_1916108 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916143 - SURFACE
      ?auto_1916144 - SURFACE
      ?auto_1916145 - SURFACE
      ?auto_1916146 - SURFACE
      ?auto_1916147 - SURFACE
    )
    :vars
    (
      ?auto_1916149 - HOIST
      ?auto_1916150 - PLACE
      ?auto_1916148 - PLACE
      ?auto_1916152 - HOIST
      ?auto_1916151 - SURFACE
      ?auto_1916153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916149 ?auto_1916150 ) ( SURFACE-AT ?auto_1916146 ?auto_1916150 ) ( CLEAR ?auto_1916146 ) ( IS-CRATE ?auto_1916147 ) ( not ( = ?auto_1916146 ?auto_1916147 ) ) ( AVAILABLE ?auto_1916149 ) ( ON ?auto_1916146 ?auto_1916145 ) ( not ( = ?auto_1916145 ?auto_1916146 ) ) ( not ( = ?auto_1916145 ?auto_1916147 ) ) ( not ( = ?auto_1916148 ?auto_1916150 ) ) ( HOIST-AT ?auto_1916152 ?auto_1916148 ) ( not ( = ?auto_1916149 ?auto_1916152 ) ) ( AVAILABLE ?auto_1916152 ) ( SURFACE-AT ?auto_1916147 ?auto_1916148 ) ( ON ?auto_1916147 ?auto_1916151 ) ( CLEAR ?auto_1916147 ) ( not ( = ?auto_1916146 ?auto_1916151 ) ) ( not ( = ?auto_1916147 ?auto_1916151 ) ) ( not ( = ?auto_1916145 ?auto_1916151 ) ) ( TRUCK-AT ?auto_1916153 ?auto_1916150 ) ( ON ?auto_1916144 ?auto_1916143 ) ( ON ?auto_1916145 ?auto_1916144 ) ( not ( = ?auto_1916143 ?auto_1916144 ) ) ( not ( = ?auto_1916143 ?auto_1916145 ) ) ( not ( = ?auto_1916143 ?auto_1916146 ) ) ( not ( = ?auto_1916143 ?auto_1916147 ) ) ( not ( = ?auto_1916143 ?auto_1916151 ) ) ( not ( = ?auto_1916144 ?auto_1916145 ) ) ( not ( = ?auto_1916144 ?auto_1916146 ) ) ( not ( = ?auto_1916144 ?auto_1916147 ) ) ( not ( = ?auto_1916144 ?auto_1916151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916145 ?auto_1916146 ?auto_1916147 )
      ( MAKE-4CRATE-VERIFY ?auto_1916143 ?auto_1916144 ?auto_1916145 ?auto_1916146 ?auto_1916147 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916182 - SURFACE
      ?auto_1916183 - SURFACE
      ?auto_1916184 - SURFACE
      ?auto_1916185 - SURFACE
      ?auto_1916186 - SURFACE
    )
    :vars
    (
      ?auto_1916187 - HOIST
      ?auto_1916190 - PLACE
      ?auto_1916192 - PLACE
      ?auto_1916188 - HOIST
      ?auto_1916189 - SURFACE
      ?auto_1916191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916187 ?auto_1916190 ) ( IS-CRATE ?auto_1916186 ) ( not ( = ?auto_1916185 ?auto_1916186 ) ) ( not ( = ?auto_1916184 ?auto_1916185 ) ) ( not ( = ?auto_1916184 ?auto_1916186 ) ) ( not ( = ?auto_1916192 ?auto_1916190 ) ) ( HOIST-AT ?auto_1916188 ?auto_1916192 ) ( not ( = ?auto_1916187 ?auto_1916188 ) ) ( AVAILABLE ?auto_1916188 ) ( SURFACE-AT ?auto_1916186 ?auto_1916192 ) ( ON ?auto_1916186 ?auto_1916189 ) ( CLEAR ?auto_1916186 ) ( not ( = ?auto_1916185 ?auto_1916189 ) ) ( not ( = ?auto_1916186 ?auto_1916189 ) ) ( not ( = ?auto_1916184 ?auto_1916189 ) ) ( TRUCK-AT ?auto_1916191 ?auto_1916190 ) ( SURFACE-AT ?auto_1916184 ?auto_1916190 ) ( CLEAR ?auto_1916184 ) ( LIFTING ?auto_1916187 ?auto_1916185 ) ( IS-CRATE ?auto_1916185 ) ( ON ?auto_1916183 ?auto_1916182 ) ( ON ?auto_1916184 ?auto_1916183 ) ( not ( = ?auto_1916182 ?auto_1916183 ) ) ( not ( = ?auto_1916182 ?auto_1916184 ) ) ( not ( = ?auto_1916182 ?auto_1916185 ) ) ( not ( = ?auto_1916182 ?auto_1916186 ) ) ( not ( = ?auto_1916182 ?auto_1916189 ) ) ( not ( = ?auto_1916183 ?auto_1916184 ) ) ( not ( = ?auto_1916183 ?auto_1916185 ) ) ( not ( = ?auto_1916183 ?auto_1916186 ) ) ( not ( = ?auto_1916183 ?auto_1916189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916184 ?auto_1916185 ?auto_1916186 )
      ( MAKE-4CRATE-VERIFY ?auto_1916182 ?auto_1916183 ?auto_1916184 ?auto_1916185 ?auto_1916186 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916221 - SURFACE
      ?auto_1916222 - SURFACE
      ?auto_1916223 - SURFACE
      ?auto_1916224 - SURFACE
      ?auto_1916225 - SURFACE
    )
    :vars
    (
      ?auto_1916226 - HOIST
      ?auto_1916231 - PLACE
      ?auto_1916230 - PLACE
      ?auto_1916228 - HOIST
      ?auto_1916229 - SURFACE
      ?auto_1916227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916226 ?auto_1916231 ) ( IS-CRATE ?auto_1916225 ) ( not ( = ?auto_1916224 ?auto_1916225 ) ) ( not ( = ?auto_1916223 ?auto_1916224 ) ) ( not ( = ?auto_1916223 ?auto_1916225 ) ) ( not ( = ?auto_1916230 ?auto_1916231 ) ) ( HOIST-AT ?auto_1916228 ?auto_1916230 ) ( not ( = ?auto_1916226 ?auto_1916228 ) ) ( AVAILABLE ?auto_1916228 ) ( SURFACE-AT ?auto_1916225 ?auto_1916230 ) ( ON ?auto_1916225 ?auto_1916229 ) ( CLEAR ?auto_1916225 ) ( not ( = ?auto_1916224 ?auto_1916229 ) ) ( not ( = ?auto_1916225 ?auto_1916229 ) ) ( not ( = ?auto_1916223 ?auto_1916229 ) ) ( TRUCK-AT ?auto_1916227 ?auto_1916231 ) ( SURFACE-AT ?auto_1916223 ?auto_1916231 ) ( CLEAR ?auto_1916223 ) ( IS-CRATE ?auto_1916224 ) ( AVAILABLE ?auto_1916226 ) ( IN ?auto_1916224 ?auto_1916227 ) ( ON ?auto_1916222 ?auto_1916221 ) ( ON ?auto_1916223 ?auto_1916222 ) ( not ( = ?auto_1916221 ?auto_1916222 ) ) ( not ( = ?auto_1916221 ?auto_1916223 ) ) ( not ( = ?auto_1916221 ?auto_1916224 ) ) ( not ( = ?auto_1916221 ?auto_1916225 ) ) ( not ( = ?auto_1916221 ?auto_1916229 ) ) ( not ( = ?auto_1916222 ?auto_1916223 ) ) ( not ( = ?auto_1916222 ?auto_1916224 ) ) ( not ( = ?auto_1916222 ?auto_1916225 ) ) ( not ( = ?auto_1916222 ?auto_1916229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916223 ?auto_1916224 ?auto_1916225 )
      ( MAKE-4CRATE-VERIFY ?auto_1916221 ?auto_1916222 ?auto_1916223 ?auto_1916224 ?auto_1916225 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916881 - SURFACE
      ?auto_1916882 - SURFACE
      ?auto_1916883 - SURFACE
      ?auto_1916884 - SURFACE
      ?auto_1916885 - SURFACE
      ?auto_1916886 - SURFACE
    )
    :vars
    (
      ?auto_1916888 - HOIST
      ?auto_1916887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916888 ?auto_1916887 ) ( SURFACE-AT ?auto_1916885 ?auto_1916887 ) ( CLEAR ?auto_1916885 ) ( LIFTING ?auto_1916888 ?auto_1916886 ) ( IS-CRATE ?auto_1916886 ) ( not ( = ?auto_1916885 ?auto_1916886 ) ) ( ON ?auto_1916882 ?auto_1916881 ) ( ON ?auto_1916883 ?auto_1916882 ) ( ON ?auto_1916884 ?auto_1916883 ) ( ON ?auto_1916885 ?auto_1916884 ) ( not ( = ?auto_1916881 ?auto_1916882 ) ) ( not ( = ?auto_1916881 ?auto_1916883 ) ) ( not ( = ?auto_1916881 ?auto_1916884 ) ) ( not ( = ?auto_1916881 ?auto_1916885 ) ) ( not ( = ?auto_1916881 ?auto_1916886 ) ) ( not ( = ?auto_1916882 ?auto_1916883 ) ) ( not ( = ?auto_1916882 ?auto_1916884 ) ) ( not ( = ?auto_1916882 ?auto_1916885 ) ) ( not ( = ?auto_1916882 ?auto_1916886 ) ) ( not ( = ?auto_1916883 ?auto_1916884 ) ) ( not ( = ?auto_1916883 ?auto_1916885 ) ) ( not ( = ?auto_1916883 ?auto_1916886 ) ) ( not ( = ?auto_1916884 ?auto_1916885 ) ) ( not ( = ?auto_1916884 ?auto_1916886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1916885 ?auto_1916886 )
      ( MAKE-5CRATE-VERIFY ?auto_1916881 ?auto_1916882 ?auto_1916883 ?auto_1916884 ?auto_1916885 ?auto_1916886 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916915 - SURFACE
      ?auto_1916916 - SURFACE
      ?auto_1916917 - SURFACE
      ?auto_1916918 - SURFACE
      ?auto_1916919 - SURFACE
      ?auto_1916920 - SURFACE
    )
    :vars
    (
      ?auto_1916922 - HOIST
      ?auto_1916921 - PLACE
      ?auto_1916923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916922 ?auto_1916921 ) ( SURFACE-AT ?auto_1916919 ?auto_1916921 ) ( CLEAR ?auto_1916919 ) ( IS-CRATE ?auto_1916920 ) ( not ( = ?auto_1916919 ?auto_1916920 ) ) ( TRUCK-AT ?auto_1916923 ?auto_1916921 ) ( AVAILABLE ?auto_1916922 ) ( IN ?auto_1916920 ?auto_1916923 ) ( ON ?auto_1916919 ?auto_1916918 ) ( not ( = ?auto_1916918 ?auto_1916919 ) ) ( not ( = ?auto_1916918 ?auto_1916920 ) ) ( ON ?auto_1916916 ?auto_1916915 ) ( ON ?auto_1916917 ?auto_1916916 ) ( ON ?auto_1916918 ?auto_1916917 ) ( not ( = ?auto_1916915 ?auto_1916916 ) ) ( not ( = ?auto_1916915 ?auto_1916917 ) ) ( not ( = ?auto_1916915 ?auto_1916918 ) ) ( not ( = ?auto_1916915 ?auto_1916919 ) ) ( not ( = ?auto_1916915 ?auto_1916920 ) ) ( not ( = ?auto_1916916 ?auto_1916917 ) ) ( not ( = ?auto_1916916 ?auto_1916918 ) ) ( not ( = ?auto_1916916 ?auto_1916919 ) ) ( not ( = ?auto_1916916 ?auto_1916920 ) ) ( not ( = ?auto_1916917 ?auto_1916918 ) ) ( not ( = ?auto_1916917 ?auto_1916919 ) ) ( not ( = ?auto_1916917 ?auto_1916920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916918 ?auto_1916919 ?auto_1916920 )
      ( MAKE-5CRATE-VERIFY ?auto_1916915 ?auto_1916916 ?auto_1916917 ?auto_1916918 ?auto_1916919 ?auto_1916920 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916955 - SURFACE
      ?auto_1916956 - SURFACE
      ?auto_1916957 - SURFACE
      ?auto_1916958 - SURFACE
      ?auto_1916959 - SURFACE
      ?auto_1916960 - SURFACE
    )
    :vars
    (
      ?auto_1916964 - HOIST
      ?auto_1916963 - PLACE
      ?auto_1916961 - TRUCK
      ?auto_1916962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916964 ?auto_1916963 ) ( SURFACE-AT ?auto_1916959 ?auto_1916963 ) ( CLEAR ?auto_1916959 ) ( IS-CRATE ?auto_1916960 ) ( not ( = ?auto_1916959 ?auto_1916960 ) ) ( AVAILABLE ?auto_1916964 ) ( IN ?auto_1916960 ?auto_1916961 ) ( ON ?auto_1916959 ?auto_1916958 ) ( not ( = ?auto_1916958 ?auto_1916959 ) ) ( not ( = ?auto_1916958 ?auto_1916960 ) ) ( TRUCK-AT ?auto_1916961 ?auto_1916962 ) ( not ( = ?auto_1916962 ?auto_1916963 ) ) ( ON ?auto_1916956 ?auto_1916955 ) ( ON ?auto_1916957 ?auto_1916956 ) ( ON ?auto_1916958 ?auto_1916957 ) ( not ( = ?auto_1916955 ?auto_1916956 ) ) ( not ( = ?auto_1916955 ?auto_1916957 ) ) ( not ( = ?auto_1916955 ?auto_1916958 ) ) ( not ( = ?auto_1916955 ?auto_1916959 ) ) ( not ( = ?auto_1916955 ?auto_1916960 ) ) ( not ( = ?auto_1916956 ?auto_1916957 ) ) ( not ( = ?auto_1916956 ?auto_1916958 ) ) ( not ( = ?auto_1916956 ?auto_1916959 ) ) ( not ( = ?auto_1916956 ?auto_1916960 ) ) ( not ( = ?auto_1916957 ?auto_1916958 ) ) ( not ( = ?auto_1916957 ?auto_1916959 ) ) ( not ( = ?auto_1916957 ?auto_1916960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916958 ?auto_1916959 ?auto_1916960 )
      ( MAKE-5CRATE-VERIFY ?auto_1916955 ?auto_1916956 ?auto_1916957 ?auto_1916958 ?auto_1916959 ?auto_1916960 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917000 - SURFACE
      ?auto_1917001 - SURFACE
      ?auto_1917002 - SURFACE
      ?auto_1917003 - SURFACE
      ?auto_1917004 - SURFACE
      ?auto_1917005 - SURFACE
    )
    :vars
    (
      ?auto_1917010 - HOIST
      ?auto_1917008 - PLACE
      ?auto_1917009 - TRUCK
      ?auto_1917007 - PLACE
      ?auto_1917006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917010 ?auto_1917008 ) ( SURFACE-AT ?auto_1917004 ?auto_1917008 ) ( CLEAR ?auto_1917004 ) ( IS-CRATE ?auto_1917005 ) ( not ( = ?auto_1917004 ?auto_1917005 ) ) ( AVAILABLE ?auto_1917010 ) ( ON ?auto_1917004 ?auto_1917003 ) ( not ( = ?auto_1917003 ?auto_1917004 ) ) ( not ( = ?auto_1917003 ?auto_1917005 ) ) ( TRUCK-AT ?auto_1917009 ?auto_1917007 ) ( not ( = ?auto_1917007 ?auto_1917008 ) ) ( HOIST-AT ?auto_1917006 ?auto_1917007 ) ( LIFTING ?auto_1917006 ?auto_1917005 ) ( not ( = ?auto_1917010 ?auto_1917006 ) ) ( ON ?auto_1917001 ?auto_1917000 ) ( ON ?auto_1917002 ?auto_1917001 ) ( ON ?auto_1917003 ?auto_1917002 ) ( not ( = ?auto_1917000 ?auto_1917001 ) ) ( not ( = ?auto_1917000 ?auto_1917002 ) ) ( not ( = ?auto_1917000 ?auto_1917003 ) ) ( not ( = ?auto_1917000 ?auto_1917004 ) ) ( not ( = ?auto_1917000 ?auto_1917005 ) ) ( not ( = ?auto_1917001 ?auto_1917002 ) ) ( not ( = ?auto_1917001 ?auto_1917003 ) ) ( not ( = ?auto_1917001 ?auto_1917004 ) ) ( not ( = ?auto_1917001 ?auto_1917005 ) ) ( not ( = ?auto_1917002 ?auto_1917003 ) ) ( not ( = ?auto_1917002 ?auto_1917004 ) ) ( not ( = ?auto_1917002 ?auto_1917005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917003 ?auto_1917004 ?auto_1917005 )
      ( MAKE-5CRATE-VERIFY ?auto_1917000 ?auto_1917001 ?auto_1917002 ?auto_1917003 ?auto_1917004 ?auto_1917005 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917050 - SURFACE
      ?auto_1917051 - SURFACE
      ?auto_1917052 - SURFACE
      ?auto_1917053 - SURFACE
      ?auto_1917054 - SURFACE
      ?auto_1917055 - SURFACE
    )
    :vars
    (
      ?auto_1917058 - HOIST
      ?auto_1917057 - PLACE
      ?auto_1917061 - TRUCK
      ?auto_1917056 - PLACE
      ?auto_1917060 - HOIST
      ?auto_1917059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917058 ?auto_1917057 ) ( SURFACE-AT ?auto_1917054 ?auto_1917057 ) ( CLEAR ?auto_1917054 ) ( IS-CRATE ?auto_1917055 ) ( not ( = ?auto_1917054 ?auto_1917055 ) ) ( AVAILABLE ?auto_1917058 ) ( ON ?auto_1917054 ?auto_1917053 ) ( not ( = ?auto_1917053 ?auto_1917054 ) ) ( not ( = ?auto_1917053 ?auto_1917055 ) ) ( TRUCK-AT ?auto_1917061 ?auto_1917056 ) ( not ( = ?auto_1917056 ?auto_1917057 ) ) ( HOIST-AT ?auto_1917060 ?auto_1917056 ) ( not ( = ?auto_1917058 ?auto_1917060 ) ) ( AVAILABLE ?auto_1917060 ) ( SURFACE-AT ?auto_1917055 ?auto_1917056 ) ( ON ?auto_1917055 ?auto_1917059 ) ( CLEAR ?auto_1917055 ) ( not ( = ?auto_1917054 ?auto_1917059 ) ) ( not ( = ?auto_1917055 ?auto_1917059 ) ) ( not ( = ?auto_1917053 ?auto_1917059 ) ) ( ON ?auto_1917051 ?auto_1917050 ) ( ON ?auto_1917052 ?auto_1917051 ) ( ON ?auto_1917053 ?auto_1917052 ) ( not ( = ?auto_1917050 ?auto_1917051 ) ) ( not ( = ?auto_1917050 ?auto_1917052 ) ) ( not ( = ?auto_1917050 ?auto_1917053 ) ) ( not ( = ?auto_1917050 ?auto_1917054 ) ) ( not ( = ?auto_1917050 ?auto_1917055 ) ) ( not ( = ?auto_1917050 ?auto_1917059 ) ) ( not ( = ?auto_1917051 ?auto_1917052 ) ) ( not ( = ?auto_1917051 ?auto_1917053 ) ) ( not ( = ?auto_1917051 ?auto_1917054 ) ) ( not ( = ?auto_1917051 ?auto_1917055 ) ) ( not ( = ?auto_1917051 ?auto_1917059 ) ) ( not ( = ?auto_1917052 ?auto_1917053 ) ) ( not ( = ?auto_1917052 ?auto_1917054 ) ) ( not ( = ?auto_1917052 ?auto_1917055 ) ) ( not ( = ?auto_1917052 ?auto_1917059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917053 ?auto_1917054 ?auto_1917055 )
      ( MAKE-5CRATE-VERIFY ?auto_1917050 ?auto_1917051 ?auto_1917052 ?auto_1917053 ?auto_1917054 ?auto_1917055 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917101 - SURFACE
      ?auto_1917102 - SURFACE
      ?auto_1917103 - SURFACE
      ?auto_1917104 - SURFACE
      ?auto_1917105 - SURFACE
      ?auto_1917106 - SURFACE
    )
    :vars
    (
      ?auto_1917108 - HOIST
      ?auto_1917107 - PLACE
      ?auto_1917110 - PLACE
      ?auto_1917112 - HOIST
      ?auto_1917109 - SURFACE
      ?auto_1917111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917108 ?auto_1917107 ) ( SURFACE-AT ?auto_1917105 ?auto_1917107 ) ( CLEAR ?auto_1917105 ) ( IS-CRATE ?auto_1917106 ) ( not ( = ?auto_1917105 ?auto_1917106 ) ) ( AVAILABLE ?auto_1917108 ) ( ON ?auto_1917105 ?auto_1917104 ) ( not ( = ?auto_1917104 ?auto_1917105 ) ) ( not ( = ?auto_1917104 ?auto_1917106 ) ) ( not ( = ?auto_1917110 ?auto_1917107 ) ) ( HOIST-AT ?auto_1917112 ?auto_1917110 ) ( not ( = ?auto_1917108 ?auto_1917112 ) ) ( AVAILABLE ?auto_1917112 ) ( SURFACE-AT ?auto_1917106 ?auto_1917110 ) ( ON ?auto_1917106 ?auto_1917109 ) ( CLEAR ?auto_1917106 ) ( not ( = ?auto_1917105 ?auto_1917109 ) ) ( not ( = ?auto_1917106 ?auto_1917109 ) ) ( not ( = ?auto_1917104 ?auto_1917109 ) ) ( TRUCK-AT ?auto_1917111 ?auto_1917107 ) ( ON ?auto_1917102 ?auto_1917101 ) ( ON ?auto_1917103 ?auto_1917102 ) ( ON ?auto_1917104 ?auto_1917103 ) ( not ( = ?auto_1917101 ?auto_1917102 ) ) ( not ( = ?auto_1917101 ?auto_1917103 ) ) ( not ( = ?auto_1917101 ?auto_1917104 ) ) ( not ( = ?auto_1917101 ?auto_1917105 ) ) ( not ( = ?auto_1917101 ?auto_1917106 ) ) ( not ( = ?auto_1917101 ?auto_1917109 ) ) ( not ( = ?auto_1917102 ?auto_1917103 ) ) ( not ( = ?auto_1917102 ?auto_1917104 ) ) ( not ( = ?auto_1917102 ?auto_1917105 ) ) ( not ( = ?auto_1917102 ?auto_1917106 ) ) ( not ( = ?auto_1917102 ?auto_1917109 ) ) ( not ( = ?auto_1917103 ?auto_1917104 ) ) ( not ( = ?auto_1917103 ?auto_1917105 ) ) ( not ( = ?auto_1917103 ?auto_1917106 ) ) ( not ( = ?auto_1917103 ?auto_1917109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917104 ?auto_1917105 ?auto_1917106 )
      ( MAKE-5CRATE-VERIFY ?auto_1917101 ?auto_1917102 ?auto_1917103 ?auto_1917104 ?auto_1917105 ?auto_1917106 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917152 - SURFACE
      ?auto_1917153 - SURFACE
      ?auto_1917154 - SURFACE
      ?auto_1917155 - SURFACE
      ?auto_1917156 - SURFACE
      ?auto_1917157 - SURFACE
    )
    :vars
    (
      ?auto_1917159 - HOIST
      ?auto_1917162 - PLACE
      ?auto_1917161 - PLACE
      ?auto_1917158 - HOIST
      ?auto_1917160 - SURFACE
      ?auto_1917163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917159 ?auto_1917162 ) ( IS-CRATE ?auto_1917157 ) ( not ( = ?auto_1917156 ?auto_1917157 ) ) ( not ( = ?auto_1917155 ?auto_1917156 ) ) ( not ( = ?auto_1917155 ?auto_1917157 ) ) ( not ( = ?auto_1917161 ?auto_1917162 ) ) ( HOIST-AT ?auto_1917158 ?auto_1917161 ) ( not ( = ?auto_1917159 ?auto_1917158 ) ) ( AVAILABLE ?auto_1917158 ) ( SURFACE-AT ?auto_1917157 ?auto_1917161 ) ( ON ?auto_1917157 ?auto_1917160 ) ( CLEAR ?auto_1917157 ) ( not ( = ?auto_1917156 ?auto_1917160 ) ) ( not ( = ?auto_1917157 ?auto_1917160 ) ) ( not ( = ?auto_1917155 ?auto_1917160 ) ) ( TRUCK-AT ?auto_1917163 ?auto_1917162 ) ( SURFACE-AT ?auto_1917155 ?auto_1917162 ) ( CLEAR ?auto_1917155 ) ( LIFTING ?auto_1917159 ?auto_1917156 ) ( IS-CRATE ?auto_1917156 ) ( ON ?auto_1917153 ?auto_1917152 ) ( ON ?auto_1917154 ?auto_1917153 ) ( ON ?auto_1917155 ?auto_1917154 ) ( not ( = ?auto_1917152 ?auto_1917153 ) ) ( not ( = ?auto_1917152 ?auto_1917154 ) ) ( not ( = ?auto_1917152 ?auto_1917155 ) ) ( not ( = ?auto_1917152 ?auto_1917156 ) ) ( not ( = ?auto_1917152 ?auto_1917157 ) ) ( not ( = ?auto_1917152 ?auto_1917160 ) ) ( not ( = ?auto_1917153 ?auto_1917154 ) ) ( not ( = ?auto_1917153 ?auto_1917155 ) ) ( not ( = ?auto_1917153 ?auto_1917156 ) ) ( not ( = ?auto_1917153 ?auto_1917157 ) ) ( not ( = ?auto_1917153 ?auto_1917160 ) ) ( not ( = ?auto_1917154 ?auto_1917155 ) ) ( not ( = ?auto_1917154 ?auto_1917156 ) ) ( not ( = ?auto_1917154 ?auto_1917157 ) ) ( not ( = ?auto_1917154 ?auto_1917160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917155 ?auto_1917156 ?auto_1917157 )
      ( MAKE-5CRATE-VERIFY ?auto_1917152 ?auto_1917153 ?auto_1917154 ?auto_1917155 ?auto_1917156 ?auto_1917157 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917203 - SURFACE
      ?auto_1917204 - SURFACE
      ?auto_1917205 - SURFACE
      ?auto_1917206 - SURFACE
      ?auto_1917207 - SURFACE
      ?auto_1917208 - SURFACE
    )
    :vars
    (
      ?auto_1917213 - HOIST
      ?auto_1917211 - PLACE
      ?auto_1917214 - PLACE
      ?auto_1917212 - HOIST
      ?auto_1917210 - SURFACE
      ?auto_1917209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917213 ?auto_1917211 ) ( IS-CRATE ?auto_1917208 ) ( not ( = ?auto_1917207 ?auto_1917208 ) ) ( not ( = ?auto_1917206 ?auto_1917207 ) ) ( not ( = ?auto_1917206 ?auto_1917208 ) ) ( not ( = ?auto_1917214 ?auto_1917211 ) ) ( HOIST-AT ?auto_1917212 ?auto_1917214 ) ( not ( = ?auto_1917213 ?auto_1917212 ) ) ( AVAILABLE ?auto_1917212 ) ( SURFACE-AT ?auto_1917208 ?auto_1917214 ) ( ON ?auto_1917208 ?auto_1917210 ) ( CLEAR ?auto_1917208 ) ( not ( = ?auto_1917207 ?auto_1917210 ) ) ( not ( = ?auto_1917208 ?auto_1917210 ) ) ( not ( = ?auto_1917206 ?auto_1917210 ) ) ( TRUCK-AT ?auto_1917209 ?auto_1917211 ) ( SURFACE-AT ?auto_1917206 ?auto_1917211 ) ( CLEAR ?auto_1917206 ) ( IS-CRATE ?auto_1917207 ) ( AVAILABLE ?auto_1917213 ) ( IN ?auto_1917207 ?auto_1917209 ) ( ON ?auto_1917204 ?auto_1917203 ) ( ON ?auto_1917205 ?auto_1917204 ) ( ON ?auto_1917206 ?auto_1917205 ) ( not ( = ?auto_1917203 ?auto_1917204 ) ) ( not ( = ?auto_1917203 ?auto_1917205 ) ) ( not ( = ?auto_1917203 ?auto_1917206 ) ) ( not ( = ?auto_1917203 ?auto_1917207 ) ) ( not ( = ?auto_1917203 ?auto_1917208 ) ) ( not ( = ?auto_1917203 ?auto_1917210 ) ) ( not ( = ?auto_1917204 ?auto_1917205 ) ) ( not ( = ?auto_1917204 ?auto_1917206 ) ) ( not ( = ?auto_1917204 ?auto_1917207 ) ) ( not ( = ?auto_1917204 ?auto_1917208 ) ) ( not ( = ?auto_1917204 ?auto_1917210 ) ) ( not ( = ?auto_1917205 ?auto_1917206 ) ) ( not ( = ?auto_1917205 ?auto_1917207 ) ) ( not ( = ?auto_1917205 ?auto_1917208 ) ) ( not ( = ?auto_1917205 ?auto_1917210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917206 ?auto_1917207 ?auto_1917208 )
      ( MAKE-5CRATE-VERIFY ?auto_1917203 ?auto_1917204 ?auto_1917205 ?auto_1917206 ?auto_1917207 ?auto_1917208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1917233 - SURFACE
      ?auto_1917234 - SURFACE
      ?auto_1917235 - SURFACE
      ?auto_1917236 - SURFACE
    )
    :vars
    (
      ?auto_1917238 - HOIST
      ?auto_1917242 - PLACE
      ?auto_1917240 - PLACE
      ?auto_1917241 - HOIST
      ?auto_1917237 - SURFACE
      ?auto_1917239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917238 ?auto_1917242 ) ( IS-CRATE ?auto_1917236 ) ( not ( = ?auto_1917235 ?auto_1917236 ) ) ( not ( = ?auto_1917234 ?auto_1917235 ) ) ( not ( = ?auto_1917234 ?auto_1917236 ) ) ( not ( = ?auto_1917240 ?auto_1917242 ) ) ( HOIST-AT ?auto_1917241 ?auto_1917240 ) ( not ( = ?auto_1917238 ?auto_1917241 ) ) ( AVAILABLE ?auto_1917241 ) ( SURFACE-AT ?auto_1917236 ?auto_1917240 ) ( ON ?auto_1917236 ?auto_1917237 ) ( CLEAR ?auto_1917236 ) ( not ( = ?auto_1917235 ?auto_1917237 ) ) ( not ( = ?auto_1917236 ?auto_1917237 ) ) ( not ( = ?auto_1917234 ?auto_1917237 ) ) ( SURFACE-AT ?auto_1917234 ?auto_1917242 ) ( CLEAR ?auto_1917234 ) ( IS-CRATE ?auto_1917235 ) ( AVAILABLE ?auto_1917238 ) ( IN ?auto_1917235 ?auto_1917239 ) ( TRUCK-AT ?auto_1917239 ?auto_1917240 ) ( ON ?auto_1917234 ?auto_1917233 ) ( not ( = ?auto_1917233 ?auto_1917234 ) ) ( not ( = ?auto_1917233 ?auto_1917235 ) ) ( not ( = ?auto_1917233 ?auto_1917236 ) ) ( not ( = ?auto_1917233 ?auto_1917237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917234 ?auto_1917235 ?auto_1917236 )
      ( MAKE-3CRATE-VERIFY ?auto_1917233 ?auto_1917234 ?auto_1917235 ?auto_1917236 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1917243 - SURFACE
      ?auto_1917244 - SURFACE
      ?auto_1917245 - SURFACE
      ?auto_1917246 - SURFACE
      ?auto_1917247 - SURFACE
    )
    :vars
    (
      ?auto_1917249 - HOIST
      ?auto_1917253 - PLACE
      ?auto_1917251 - PLACE
      ?auto_1917252 - HOIST
      ?auto_1917248 - SURFACE
      ?auto_1917250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917249 ?auto_1917253 ) ( IS-CRATE ?auto_1917247 ) ( not ( = ?auto_1917246 ?auto_1917247 ) ) ( not ( = ?auto_1917245 ?auto_1917246 ) ) ( not ( = ?auto_1917245 ?auto_1917247 ) ) ( not ( = ?auto_1917251 ?auto_1917253 ) ) ( HOIST-AT ?auto_1917252 ?auto_1917251 ) ( not ( = ?auto_1917249 ?auto_1917252 ) ) ( AVAILABLE ?auto_1917252 ) ( SURFACE-AT ?auto_1917247 ?auto_1917251 ) ( ON ?auto_1917247 ?auto_1917248 ) ( CLEAR ?auto_1917247 ) ( not ( = ?auto_1917246 ?auto_1917248 ) ) ( not ( = ?auto_1917247 ?auto_1917248 ) ) ( not ( = ?auto_1917245 ?auto_1917248 ) ) ( SURFACE-AT ?auto_1917245 ?auto_1917253 ) ( CLEAR ?auto_1917245 ) ( IS-CRATE ?auto_1917246 ) ( AVAILABLE ?auto_1917249 ) ( IN ?auto_1917246 ?auto_1917250 ) ( TRUCK-AT ?auto_1917250 ?auto_1917251 ) ( ON ?auto_1917244 ?auto_1917243 ) ( ON ?auto_1917245 ?auto_1917244 ) ( not ( = ?auto_1917243 ?auto_1917244 ) ) ( not ( = ?auto_1917243 ?auto_1917245 ) ) ( not ( = ?auto_1917243 ?auto_1917246 ) ) ( not ( = ?auto_1917243 ?auto_1917247 ) ) ( not ( = ?auto_1917243 ?auto_1917248 ) ) ( not ( = ?auto_1917244 ?auto_1917245 ) ) ( not ( = ?auto_1917244 ?auto_1917246 ) ) ( not ( = ?auto_1917244 ?auto_1917247 ) ) ( not ( = ?auto_1917244 ?auto_1917248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917245 ?auto_1917246 ?auto_1917247 )
      ( MAKE-4CRATE-VERIFY ?auto_1917243 ?auto_1917244 ?auto_1917245 ?auto_1917246 ?auto_1917247 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917254 - SURFACE
      ?auto_1917255 - SURFACE
      ?auto_1917256 - SURFACE
      ?auto_1917257 - SURFACE
      ?auto_1917258 - SURFACE
      ?auto_1917259 - SURFACE
    )
    :vars
    (
      ?auto_1917261 - HOIST
      ?auto_1917265 - PLACE
      ?auto_1917263 - PLACE
      ?auto_1917264 - HOIST
      ?auto_1917260 - SURFACE
      ?auto_1917262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917261 ?auto_1917265 ) ( IS-CRATE ?auto_1917259 ) ( not ( = ?auto_1917258 ?auto_1917259 ) ) ( not ( = ?auto_1917257 ?auto_1917258 ) ) ( not ( = ?auto_1917257 ?auto_1917259 ) ) ( not ( = ?auto_1917263 ?auto_1917265 ) ) ( HOIST-AT ?auto_1917264 ?auto_1917263 ) ( not ( = ?auto_1917261 ?auto_1917264 ) ) ( AVAILABLE ?auto_1917264 ) ( SURFACE-AT ?auto_1917259 ?auto_1917263 ) ( ON ?auto_1917259 ?auto_1917260 ) ( CLEAR ?auto_1917259 ) ( not ( = ?auto_1917258 ?auto_1917260 ) ) ( not ( = ?auto_1917259 ?auto_1917260 ) ) ( not ( = ?auto_1917257 ?auto_1917260 ) ) ( SURFACE-AT ?auto_1917257 ?auto_1917265 ) ( CLEAR ?auto_1917257 ) ( IS-CRATE ?auto_1917258 ) ( AVAILABLE ?auto_1917261 ) ( IN ?auto_1917258 ?auto_1917262 ) ( TRUCK-AT ?auto_1917262 ?auto_1917263 ) ( ON ?auto_1917255 ?auto_1917254 ) ( ON ?auto_1917256 ?auto_1917255 ) ( ON ?auto_1917257 ?auto_1917256 ) ( not ( = ?auto_1917254 ?auto_1917255 ) ) ( not ( = ?auto_1917254 ?auto_1917256 ) ) ( not ( = ?auto_1917254 ?auto_1917257 ) ) ( not ( = ?auto_1917254 ?auto_1917258 ) ) ( not ( = ?auto_1917254 ?auto_1917259 ) ) ( not ( = ?auto_1917254 ?auto_1917260 ) ) ( not ( = ?auto_1917255 ?auto_1917256 ) ) ( not ( = ?auto_1917255 ?auto_1917257 ) ) ( not ( = ?auto_1917255 ?auto_1917258 ) ) ( not ( = ?auto_1917255 ?auto_1917259 ) ) ( not ( = ?auto_1917255 ?auto_1917260 ) ) ( not ( = ?auto_1917256 ?auto_1917257 ) ) ( not ( = ?auto_1917256 ?auto_1917258 ) ) ( not ( = ?auto_1917256 ?auto_1917259 ) ) ( not ( = ?auto_1917256 ?auto_1917260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917257 ?auto_1917258 ?auto_1917259 )
      ( MAKE-5CRATE-VERIFY ?auto_1917254 ?auto_1917255 ?auto_1917256 ?auto_1917257 ?auto_1917258 ?auto_1917259 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1917284 - SURFACE
      ?auto_1917285 - SURFACE
      ?auto_1917286 - SURFACE
      ?auto_1917287 - SURFACE
    )
    :vars
    (
      ?auto_1917288 - HOIST
      ?auto_1917289 - PLACE
      ?auto_1917290 - PLACE
      ?auto_1917293 - HOIST
      ?auto_1917292 - SURFACE
      ?auto_1917291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917288 ?auto_1917289 ) ( IS-CRATE ?auto_1917287 ) ( not ( = ?auto_1917286 ?auto_1917287 ) ) ( not ( = ?auto_1917285 ?auto_1917286 ) ) ( not ( = ?auto_1917285 ?auto_1917287 ) ) ( not ( = ?auto_1917290 ?auto_1917289 ) ) ( HOIST-AT ?auto_1917293 ?auto_1917290 ) ( not ( = ?auto_1917288 ?auto_1917293 ) ) ( SURFACE-AT ?auto_1917287 ?auto_1917290 ) ( ON ?auto_1917287 ?auto_1917292 ) ( CLEAR ?auto_1917287 ) ( not ( = ?auto_1917286 ?auto_1917292 ) ) ( not ( = ?auto_1917287 ?auto_1917292 ) ) ( not ( = ?auto_1917285 ?auto_1917292 ) ) ( SURFACE-AT ?auto_1917285 ?auto_1917289 ) ( CLEAR ?auto_1917285 ) ( IS-CRATE ?auto_1917286 ) ( AVAILABLE ?auto_1917288 ) ( TRUCK-AT ?auto_1917291 ?auto_1917290 ) ( LIFTING ?auto_1917293 ?auto_1917286 ) ( ON ?auto_1917285 ?auto_1917284 ) ( not ( = ?auto_1917284 ?auto_1917285 ) ) ( not ( = ?auto_1917284 ?auto_1917286 ) ) ( not ( = ?auto_1917284 ?auto_1917287 ) ) ( not ( = ?auto_1917284 ?auto_1917292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917285 ?auto_1917286 ?auto_1917287 )
      ( MAKE-3CRATE-VERIFY ?auto_1917284 ?auto_1917285 ?auto_1917286 ?auto_1917287 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1917294 - SURFACE
      ?auto_1917295 - SURFACE
      ?auto_1917296 - SURFACE
      ?auto_1917297 - SURFACE
      ?auto_1917298 - SURFACE
    )
    :vars
    (
      ?auto_1917299 - HOIST
      ?auto_1917300 - PLACE
      ?auto_1917301 - PLACE
      ?auto_1917304 - HOIST
      ?auto_1917303 - SURFACE
      ?auto_1917302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917299 ?auto_1917300 ) ( IS-CRATE ?auto_1917298 ) ( not ( = ?auto_1917297 ?auto_1917298 ) ) ( not ( = ?auto_1917296 ?auto_1917297 ) ) ( not ( = ?auto_1917296 ?auto_1917298 ) ) ( not ( = ?auto_1917301 ?auto_1917300 ) ) ( HOIST-AT ?auto_1917304 ?auto_1917301 ) ( not ( = ?auto_1917299 ?auto_1917304 ) ) ( SURFACE-AT ?auto_1917298 ?auto_1917301 ) ( ON ?auto_1917298 ?auto_1917303 ) ( CLEAR ?auto_1917298 ) ( not ( = ?auto_1917297 ?auto_1917303 ) ) ( not ( = ?auto_1917298 ?auto_1917303 ) ) ( not ( = ?auto_1917296 ?auto_1917303 ) ) ( SURFACE-AT ?auto_1917296 ?auto_1917300 ) ( CLEAR ?auto_1917296 ) ( IS-CRATE ?auto_1917297 ) ( AVAILABLE ?auto_1917299 ) ( TRUCK-AT ?auto_1917302 ?auto_1917301 ) ( LIFTING ?auto_1917304 ?auto_1917297 ) ( ON ?auto_1917295 ?auto_1917294 ) ( ON ?auto_1917296 ?auto_1917295 ) ( not ( = ?auto_1917294 ?auto_1917295 ) ) ( not ( = ?auto_1917294 ?auto_1917296 ) ) ( not ( = ?auto_1917294 ?auto_1917297 ) ) ( not ( = ?auto_1917294 ?auto_1917298 ) ) ( not ( = ?auto_1917294 ?auto_1917303 ) ) ( not ( = ?auto_1917295 ?auto_1917296 ) ) ( not ( = ?auto_1917295 ?auto_1917297 ) ) ( not ( = ?auto_1917295 ?auto_1917298 ) ) ( not ( = ?auto_1917295 ?auto_1917303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917296 ?auto_1917297 ?auto_1917298 )
      ( MAKE-4CRATE-VERIFY ?auto_1917294 ?auto_1917295 ?auto_1917296 ?auto_1917297 ?auto_1917298 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917305 - SURFACE
      ?auto_1917306 - SURFACE
      ?auto_1917307 - SURFACE
      ?auto_1917308 - SURFACE
      ?auto_1917309 - SURFACE
      ?auto_1917310 - SURFACE
    )
    :vars
    (
      ?auto_1917311 - HOIST
      ?auto_1917312 - PLACE
      ?auto_1917313 - PLACE
      ?auto_1917316 - HOIST
      ?auto_1917315 - SURFACE
      ?auto_1917314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917311 ?auto_1917312 ) ( IS-CRATE ?auto_1917310 ) ( not ( = ?auto_1917309 ?auto_1917310 ) ) ( not ( = ?auto_1917308 ?auto_1917309 ) ) ( not ( = ?auto_1917308 ?auto_1917310 ) ) ( not ( = ?auto_1917313 ?auto_1917312 ) ) ( HOIST-AT ?auto_1917316 ?auto_1917313 ) ( not ( = ?auto_1917311 ?auto_1917316 ) ) ( SURFACE-AT ?auto_1917310 ?auto_1917313 ) ( ON ?auto_1917310 ?auto_1917315 ) ( CLEAR ?auto_1917310 ) ( not ( = ?auto_1917309 ?auto_1917315 ) ) ( not ( = ?auto_1917310 ?auto_1917315 ) ) ( not ( = ?auto_1917308 ?auto_1917315 ) ) ( SURFACE-AT ?auto_1917308 ?auto_1917312 ) ( CLEAR ?auto_1917308 ) ( IS-CRATE ?auto_1917309 ) ( AVAILABLE ?auto_1917311 ) ( TRUCK-AT ?auto_1917314 ?auto_1917313 ) ( LIFTING ?auto_1917316 ?auto_1917309 ) ( ON ?auto_1917306 ?auto_1917305 ) ( ON ?auto_1917307 ?auto_1917306 ) ( ON ?auto_1917308 ?auto_1917307 ) ( not ( = ?auto_1917305 ?auto_1917306 ) ) ( not ( = ?auto_1917305 ?auto_1917307 ) ) ( not ( = ?auto_1917305 ?auto_1917308 ) ) ( not ( = ?auto_1917305 ?auto_1917309 ) ) ( not ( = ?auto_1917305 ?auto_1917310 ) ) ( not ( = ?auto_1917305 ?auto_1917315 ) ) ( not ( = ?auto_1917306 ?auto_1917307 ) ) ( not ( = ?auto_1917306 ?auto_1917308 ) ) ( not ( = ?auto_1917306 ?auto_1917309 ) ) ( not ( = ?auto_1917306 ?auto_1917310 ) ) ( not ( = ?auto_1917306 ?auto_1917315 ) ) ( not ( = ?auto_1917307 ?auto_1917308 ) ) ( not ( = ?auto_1917307 ?auto_1917309 ) ) ( not ( = ?auto_1917307 ?auto_1917310 ) ) ( not ( = ?auto_1917307 ?auto_1917315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917308 ?auto_1917309 ?auto_1917310 )
      ( MAKE-5CRATE-VERIFY ?auto_1917305 ?auto_1917306 ?auto_1917307 ?auto_1917308 ?auto_1917309 ?auto_1917310 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1917337 - SURFACE
      ?auto_1917338 - SURFACE
      ?auto_1917339 - SURFACE
      ?auto_1917340 - SURFACE
    )
    :vars
    (
      ?auto_1917346 - HOIST
      ?auto_1917347 - PLACE
      ?auto_1917342 - PLACE
      ?auto_1917343 - HOIST
      ?auto_1917344 - SURFACE
      ?auto_1917341 - TRUCK
      ?auto_1917345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917346 ?auto_1917347 ) ( IS-CRATE ?auto_1917340 ) ( not ( = ?auto_1917339 ?auto_1917340 ) ) ( not ( = ?auto_1917338 ?auto_1917339 ) ) ( not ( = ?auto_1917338 ?auto_1917340 ) ) ( not ( = ?auto_1917342 ?auto_1917347 ) ) ( HOIST-AT ?auto_1917343 ?auto_1917342 ) ( not ( = ?auto_1917346 ?auto_1917343 ) ) ( SURFACE-AT ?auto_1917340 ?auto_1917342 ) ( ON ?auto_1917340 ?auto_1917344 ) ( CLEAR ?auto_1917340 ) ( not ( = ?auto_1917339 ?auto_1917344 ) ) ( not ( = ?auto_1917340 ?auto_1917344 ) ) ( not ( = ?auto_1917338 ?auto_1917344 ) ) ( SURFACE-AT ?auto_1917338 ?auto_1917347 ) ( CLEAR ?auto_1917338 ) ( IS-CRATE ?auto_1917339 ) ( AVAILABLE ?auto_1917346 ) ( TRUCK-AT ?auto_1917341 ?auto_1917342 ) ( AVAILABLE ?auto_1917343 ) ( SURFACE-AT ?auto_1917339 ?auto_1917342 ) ( ON ?auto_1917339 ?auto_1917345 ) ( CLEAR ?auto_1917339 ) ( not ( = ?auto_1917339 ?auto_1917345 ) ) ( not ( = ?auto_1917340 ?auto_1917345 ) ) ( not ( = ?auto_1917338 ?auto_1917345 ) ) ( not ( = ?auto_1917344 ?auto_1917345 ) ) ( ON ?auto_1917338 ?auto_1917337 ) ( not ( = ?auto_1917337 ?auto_1917338 ) ) ( not ( = ?auto_1917337 ?auto_1917339 ) ) ( not ( = ?auto_1917337 ?auto_1917340 ) ) ( not ( = ?auto_1917337 ?auto_1917344 ) ) ( not ( = ?auto_1917337 ?auto_1917345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917338 ?auto_1917339 ?auto_1917340 )
      ( MAKE-3CRATE-VERIFY ?auto_1917337 ?auto_1917338 ?auto_1917339 ?auto_1917340 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1917348 - SURFACE
      ?auto_1917349 - SURFACE
      ?auto_1917350 - SURFACE
      ?auto_1917351 - SURFACE
      ?auto_1917352 - SURFACE
    )
    :vars
    (
      ?auto_1917358 - HOIST
      ?auto_1917359 - PLACE
      ?auto_1917354 - PLACE
      ?auto_1917355 - HOIST
      ?auto_1917356 - SURFACE
      ?auto_1917353 - TRUCK
      ?auto_1917357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917358 ?auto_1917359 ) ( IS-CRATE ?auto_1917352 ) ( not ( = ?auto_1917351 ?auto_1917352 ) ) ( not ( = ?auto_1917350 ?auto_1917351 ) ) ( not ( = ?auto_1917350 ?auto_1917352 ) ) ( not ( = ?auto_1917354 ?auto_1917359 ) ) ( HOIST-AT ?auto_1917355 ?auto_1917354 ) ( not ( = ?auto_1917358 ?auto_1917355 ) ) ( SURFACE-AT ?auto_1917352 ?auto_1917354 ) ( ON ?auto_1917352 ?auto_1917356 ) ( CLEAR ?auto_1917352 ) ( not ( = ?auto_1917351 ?auto_1917356 ) ) ( not ( = ?auto_1917352 ?auto_1917356 ) ) ( not ( = ?auto_1917350 ?auto_1917356 ) ) ( SURFACE-AT ?auto_1917350 ?auto_1917359 ) ( CLEAR ?auto_1917350 ) ( IS-CRATE ?auto_1917351 ) ( AVAILABLE ?auto_1917358 ) ( TRUCK-AT ?auto_1917353 ?auto_1917354 ) ( AVAILABLE ?auto_1917355 ) ( SURFACE-AT ?auto_1917351 ?auto_1917354 ) ( ON ?auto_1917351 ?auto_1917357 ) ( CLEAR ?auto_1917351 ) ( not ( = ?auto_1917351 ?auto_1917357 ) ) ( not ( = ?auto_1917352 ?auto_1917357 ) ) ( not ( = ?auto_1917350 ?auto_1917357 ) ) ( not ( = ?auto_1917356 ?auto_1917357 ) ) ( ON ?auto_1917349 ?auto_1917348 ) ( ON ?auto_1917350 ?auto_1917349 ) ( not ( = ?auto_1917348 ?auto_1917349 ) ) ( not ( = ?auto_1917348 ?auto_1917350 ) ) ( not ( = ?auto_1917348 ?auto_1917351 ) ) ( not ( = ?auto_1917348 ?auto_1917352 ) ) ( not ( = ?auto_1917348 ?auto_1917356 ) ) ( not ( = ?auto_1917348 ?auto_1917357 ) ) ( not ( = ?auto_1917349 ?auto_1917350 ) ) ( not ( = ?auto_1917349 ?auto_1917351 ) ) ( not ( = ?auto_1917349 ?auto_1917352 ) ) ( not ( = ?auto_1917349 ?auto_1917356 ) ) ( not ( = ?auto_1917349 ?auto_1917357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917350 ?auto_1917351 ?auto_1917352 )
      ( MAKE-4CRATE-VERIFY ?auto_1917348 ?auto_1917349 ?auto_1917350 ?auto_1917351 ?auto_1917352 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917360 - SURFACE
      ?auto_1917361 - SURFACE
      ?auto_1917362 - SURFACE
      ?auto_1917363 - SURFACE
      ?auto_1917364 - SURFACE
      ?auto_1917365 - SURFACE
    )
    :vars
    (
      ?auto_1917371 - HOIST
      ?auto_1917372 - PLACE
      ?auto_1917367 - PLACE
      ?auto_1917368 - HOIST
      ?auto_1917369 - SURFACE
      ?auto_1917366 - TRUCK
      ?auto_1917370 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917371 ?auto_1917372 ) ( IS-CRATE ?auto_1917365 ) ( not ( = ?auto_1917364 ?auto_1917365 ) ) ( not ( = ?auto_1917363 ?auto_1917364 ) ) ( not ( = ?auto_1917363 ?auto_1917365 ) ) ( not ( = ?auto_1917367 ?auto_1917372 ) ) ( HOIST-AT ?auto_1917368 ?auto_1917367 ) ( not ( = ?auto_1917371 ?auto_1917368 ) ) ( SURFACE-AT ?auto_1917365 ?auto_1917367 ) ( ON ?auto_1917365 ?auto_1917369 ) ( CLEAR ?auto_1917365 ) ( not ( = ?auto_1917364 ?auto_1917369 ) ) ( not ( = ?auto_1917365 ?auto_1917369 ) ) ( not ( = ?auto_1917363 ?auto_1917369 ) ) ( SURFACE-AT ?auto_1917363 ?auto_1917372 ) ( CLEAR ?auto_1917363 ) ( IS-CRATE ?auto_1917364 ) ( AVAILABLE ?auto_1917371 ) ( TRUCK-AT ?auto_1917366 ?auto_1917367 ) ( AVAILABLE ?auto_1917368 ) ( SURFACE-AT ?auto_1917364 ?auto_1917367 ) ( ON ?auto_1917364 ?auto_1917370 ) ( CLEAR ?auto_1917364 ) ( not ( = ?auto_1917364 ?auto_1917370 ) ) ( not ( = ?auto_1917365 ?auto_1917370 ) ) ( not ( = ?auto_1917363 ?auto_1917370 ) ) ( not ( = ?auto_1917369 ?auto_1917370 ) ) ( ON ?auto_1917361 ?auto_1917360 ) ( ON ?auto_1917362 ?auto_1917361 ) ( ON ?auto_1917363 ?auto_1917362 ) ( not ( = ?auto_1917360 ?auto_1917361 ) ) ( not ( = ?auto_1917360 ?auto_1917362 ) ) ( not ( = ?auto_1917360 ?auto_1917363 ) ) ( not ( = ?auto_1917360 ?auto_1917364 ) ) ( not ( = ?auto_1917360 ?auto_1917365 ) ) ( not ( = ?auto_1917360 ?auto_1917369 ) ) ( not ( = ?auto_1917360 ?auto_1917370 ) ) ( not ( = ?auto_1917361 ?auto_1917362 ) ) ( not ( = ?auto_1917361 ?auto_1917363 ) ) ( not ( = ?auto_1917361 ?auto_1917364 ) ) ( not ( = ?auto_1917361 ?auto_1917365 ) ) ( not ( = ?auto_1917361 ?auto_1917369 ) ) ( not ( = ?auto_1917361 ?auto_1917370 ) ) ( not ( = ?auto_1917362 ?auto_1917363 ) ) ( not ( = ?auto_1917362 ?auto_1917364 ) ) ( not ( = ?auto_1917362 ?auto_1917365 ) ) ( not ( = ?auto_1917362 ?auto_1917369 ) ) ( not ( = ?auto_1917362 ?auto_1917370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917363 ?auto_1917364 ?auto_1917365 )
      ( MAKE-5CRATE-VERIFY ?auto_1917360 ?auto_1917361 ?auto_1917362 ?auto_1917363 ?auto_1917364 ?auto_1917365 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1917393 - SURFACE
      ?auto_1917394 - SURFACE
      ?auto_1917395 - SURFACE
      ?auto_1917396 - SURFACE
    )
    :vars
    (
      ?auto_1917402 - HOIST
      ?auto_1917403 - PLACE
      ?auto_1917400 - PLACE
      ?auto_1917397 - HOIST
      ?auto_1917401 - SURFACE
      ?auto_1917398 - SURFACE
      ?auto_1917399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917402 ?auto_1917403 ) ( IS-CRATE ?auto_1917396 ) ( not ( = ?auto_1917395 ?auto_1917396 ) ) ( not ( = ?auto_1917394 ?auto_1917395 ) ) ( not ( = ?auto_1917394 ?auto_1917396 ) ) ( not ( = ?auto_1917400 ?auto_1917403 ) ) ( HOIST-AT ?auto_1917397 ?auto_1917400 ) ( not ( = ?auto_1917402 ?auto_1917397 ) ) ( SURFACE-AT ?auto_1917396 ?auto_1917400 ) ( ON ?auto_1917396 ?auto_1917401 ) ( CLEAR ?auto_1917396 ) ( not ( = ?auto_1917395 ?auto_1917401 ) ) ( not ( = ?auto_1917396 ?auto_1917401 ) ) ( not ( = ?auto_1917394 ?auto_1917401 ) ) ( SURFACE-AT ?auto_1917394 ?auto_1917403 ) ( CLEAR ?auto_1917394 ) ( IS-CRATE ?auto_1917395 ) ( AVAILABLE ?auto_1917402 ) ( AVAILABLE ?auto_1917397 ) ( SURFACE-AT ?auto_1917395 ?auto_1917400 ) ( ON ?auto_1917395 ?auto_1917398 ) ( CLEAR ?auto_1917395 ) ( not ( = ?auto_1917395 ?auto_1917398 ) ) ( not ( = ?auto_1917396 ?auto_1917398 ) ) ( not ( = ?auto_1917394 ?auto_1917398 ) ) ( not ( = ?auto_1917401 ?auto_1917398 ) ) ( TRUCK-AT ?auto_1917399 ?auto_1917403 ) ( ON ?auto_1917394 ?auto_1917393 ) ( not ( = ?auto_1917393 ?auto_1917394 ) ) ( not ( = ?auto_1917393 ?auto_1917395 ) ) ( not ( = ?auto_1917393 ?auto_1917396 ) ) ( not ( = ?auto_1917393 ?auto_1917401 ) ) ( not ( = ?auto_1917393 ?auto_1917398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917394 ?auto_1917395 ?auto_1917396 )
      ( MAKE-3CRATE-VERIFY ?auto_1917393 ?auto_1917394 ?auto_1917395 ?auto_1917396 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1917404 - SURFACE
      ?auto_1917405 - SURFACE
      ?auto_1917406 - SURFACE
      ?auto_1917407 - SURFACE
      ?auto_1917408 - SURFACE
    )
    :vars
    (
      ?auto_1917414 - HOIST
      ?auto_1917415 - PLACE
      ?auto_1917412 - PLACE
      ?auto_1917409 - HOIST
      ?auto_1917413 - SURFACE
      ?auto_1917410 - SURFACE
      ?auto_1917411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917414 ?auto_1917415 ) ( IS-CRATE ?auto_1917408 ) ( not ( = ?auto_1917407 ?auto_1917408 ) ) ( not ( = ?auto_1917406 ?auto_1917407 ) ) ( not ( = ?auto_1917406 ?auto_1917408 ) ) ( not ( = ?auto_1917412 ?auto_1917415 ) ) ( HOIST-AT ?auto_1917409 ?auto_1917412 ) ( not ( = ?auto_1917414 ?auto_1917409 ) ) ( SURFACE-AT ?auto_1917408 ?auto_1917412 ) ( ON ?auto_1917408 ?auto_1917413 ) ( CLEAR ?auto_1917408 ) ( not ( = ?auto_1917407 ?auto_1917413 ) ) ( not ( = ?auto_1917408 ?auto_1917413 ) ) ( not ( = ?auto_1917406 ?auto_1917413 ) ) ( SURFACE-AT ?auto_1917406 ?auto_1917415 ) ( CLEAR ?auto_1917406 ) ( IS-CRATE ?auto_1917407 ) ( AVAILABLE ?auto_1917414 ) ( AVAILABLE ?auto_1917409 ) ( SURFACE-AT ?auto_1917407 ?auto_1917412 ) ( ON ?auto_1917407 ?auto_1917410 ) ( CLEAR ?auto_1917407 ) ( not ( = ?auto_1917407 ?auto_1917410 ) ) ( not ( = ?auto_1917408 ?auto_1917410 ) ) ( not ( = ?auto_1917406 ?auto_1917410 ) ) ( not ( = ?auto_1917413 ?auto_1917410 ) ) ( TRUCK-AT ?auto_1917411 ?auto_1917415 ) ( ON ?auto_1917405 ?auto_1917404 ) ( ON ?auto_1917406 ?auto_1917405 ) ( not ( = ?auto_1917404 ?auto_1917405 ) ) ( not ( = ?auto_1917404 ?auto_1917406 ) ) ( not ( = ?auto_1917404 ?auto_1917407 ) ) ( not ( = ?auto_1917404 ?auto_1917408 ) ) ( not ( = ?auto_1917404 ?auto_1917413 ) ) ( not ( = ?auto_1917404 ?auto_1917410 ) ) ( not ( = ?auto_1917405 ?auto_1917406 ) ) ( not ( = ?auto_1917405 ?auto_1917407 ) ) ( not ( = ?auto_1917405 ?auto_1917408 ) ) ( not ( = ?auto_1917405 ?auto_1917413 ) ) ( not ( = ?auto_1917405 ?auto_1917410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917406 ?auto_1917407 ?auto_1917408 )
      ( MAKE-4CRATE-VERIFY ?auto_1917404 ?auto_1917405 ?auto_1917406 ?auto_1917407 ?auto_1917408 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917416 - SURFACE
      ?auto_1917417 - SURFACE
      ?auto_1917418 - SURFACE
      ?auto_1917419 - SURFACE
      ?auto_1917420 - SURFACE
      ?auto_1917421 - SURFACE
    )
    :vars
    (
      ?auto_1917427 - HOIST
      ?auto_1917428 - PLACE
      ?auto_1917425 - PLACE
      ?auto_1917422 - HOIST
      ?auto_1917426 - SURFACE
      ?auto_1917423 - SURFACE
      ?auto_1917424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917427 ?auto_1917428 ) ( IS-CRATE ?auto_1917421 ) ( not ( = ?auto_1917420 ?auto_1917421 ) ) ( not ( = ?auto_1917419 ?auto_1917420 ) ) ( not ( = ?auto_1917419 ?auto_1917421 ) ) ( not ( = ?auto_1917425 ?auto_1917428 ) ) ( HOIST-AT ?auto_1917422 ?auto_1917425 ) ( not ( = ?auto_1917427 ?auto_1917422 ) ) ( SURFACE-AT ?auto_1917421 ?auto_1917425 ) ( ON ?auto_1917421 ?auto_1917426 ) ( CLEAR ?auto_1917421 ) ( not ( = ?auto_1917420 ?auto_1917426 ) ) ( not ( = ?auto_1917421 ?auto_1917426 ) ) ( not ( = ?auto_1917419 ?auto_1917426 ) ) ( SURFACE-AT ?auto_1917419 ?auto_1917428 ) ( CLEAR ?auto_1917419 ) ( IS-CRATE ?auto_1917420 ) ( AVAILABLE ?auto_1917427 ) ( AVAILABLE ?auto_1917422 ) ( SURFACE-AT ?auto_1917420 ?auto_1917425 ) ( ON ?auto_1917420 ?auto_1917423 ) ( CLEAR ?auto_1917420 ) ( not ( = ?auto_1917420 ?auto_1917423 ) ) ( not ( = ?auto_1917421 ?auto_1917423 ) ) ( not ( = ?auto_1917419 ?auto_1917423 ) ) ( not ( = ?auto_1917426 ?auto_1917423 ) ) ( TRUCK-AT ?auto_1917424 ?auto_1917428 ) ( ON ?auto_1917417 ?auto_1917416 ) ( ON ?auto_1917418 ?auto_1917417 ) ( ON ?auto_1917419 ?auto_1917418 ) ( not ( = ?auto_1917416 ?auto_1917417 ) ) ( not ( = ?auto_1917416 ?auto_1917418 ) ) ( not ( = ?auto_1917416 ?auto_1917419 ) ) ( not ( = ?auto_1917416 ?auto_1917420 ) ) ( not ( = ?auto_1917416 ?auto_1917421 ) ) ( not ( = ?auto_1917416 ?auto_1917426 ) ) ( not ( = ?auto_1917416 ?auto_1917423 ) ) ( not ( = ?auto_1917417 ?auto_1917418 ) ) ( not ( = ?auto_1917417 ?auto_1917419 ) ) ( not ( = ?auto_1917417 ?auto_1917420 ) ) ( not ( = ?auto_1917417 ?auto_1917421 ) ) ( not ( = ?auto_1917417 ?auto_1917426 ) ) ( not ( = ?auto_1917417 ?auto_1917423 ) ) ( not ( = ?auto_1917418 ?auto_1917419 ) ) ( not ( = ?auto_1917418 ?auto_1917420 ) ) ( not ( = ?auto_1917418 ?auto_1917421 ) ) ( not ( = ?auto_1917418 ?auto_1917426 ) ) ( not ( = ?auto_1917418 ?auto_1917423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917419 ?auto_1917420 ?auto_1917421 )
      ( MAKE-5CRATE-VERIFY ?auto_1917416 ?auto_1917417 ?auto_1917418 ?auto_1917419 ?auto_1917420 ?auto_1917421 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1917429 - SURFACE
      ?auto_1917430 - SURFACE
    )
    :vars
    (
      ?auto_1917437 - HOIST
      ?auto_1917438 - PLACE
      ?auto_1917436 - SURFACE
      ?auto_1917434 - PLACE
      ?auto_1917431 - HOIST
      ?auto_1917435 - SURFACE
      ?auto_1917432 - SURFACE
      ?auto_1917433 - TRUCK
      ?auto_1917439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917437 ?auto_1917438 ) ( IS-CRATE ?auto_1917430 ) ( not ( = ?auto_1917429 ?auto_1917430 ) ) ( not ( = ?auto_1917436 ?auto_1917429 ) ) ( not ( = ?auto_1917436 ?auto_1917430 ) ) ( not ( = ?auto_1917434 ?auto_1917438 ) ) ( HOIST-AT ?auto_1917431 ?auto_1917434 ) ( not ( = ?auto_1917437 ?auto_1917431 ) ) ( SURFACE-AT ?auto_1917430 ?auto_1917434 ) ( ON ?auto_1917430 ?auto_1917435 ) ( CLEAR ?auto_1917430 ) ( not ( = ?auto_1917429 ?auto_1917435 ) ) ( not ( = ?auto_1917430 ?auto_1917435 ) ) ( not ( = ?auto_1917436 ?auto_1917435 ) ) ( IS-CRATE ?auto_1917429 ) ( AVAILABLE ?auto_1917431 ) ( SURFACE-AT ?auto_1917429 ?auto_1917434 ) ( ON ?auto_1917429 ?auto_1917432 ) ( CLEAR ?auto_1917429 ) ( not ( = ?auto_1917429 ?auto_1917432 ) ) ( not ( = ?auto_1917430 ?auto_1917432 ) ) ( not ( = ?auto_1917436 ?auto_1917432 ) ) ( not ( = ?auto_1917435 ?auto_1917432 ) ) ( TRUCK-AT ?auto_1917433 ?auto_1917438 ) ( SURFACE-AT ?auto_1917439 ?auto_1917438 ) ( CLEAR ?auto_1917439 ) ( LIFTING ?auto_1917437 ?auto_1917436 ) ( IS-CRATE ?auto_1917436 ) ( not ( = ?auto_1917439 ?auto_1917436 ) ) ( not ( = ?auto_1917429 ?auto_1917439 ) ) ( not ( = ?auto_1917430 ?auto_1917439 ) ) ( not ( = ?auto_1917435 ?auto_1917439 ) ) ( not ( = ?auto_1917432 ?auto_1917439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1917439 ?auto_1917436 )
      ( MAKE-2CRATE ?auto_1917436 ?auto_1917429 ?auto_1917430 )
      ( MAKE-1CRATE-VERIFY ?auto_1917429 ?auto_1917430 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1917440 - SURFACE
      ?auto_1917441 - SURFACE
      ?auto_1917442 - SURFACE
    )
    :vars
    (
      ?auto_1917444 - HOIST
      ?auto_1917450 - PLACE
      ?auto_1917449 - PLACE
      ?auto_1917443 - HOIST
      ?auto_1917446 - SURFACE
      ?auto_1917445 - SURFACE
      ?auto_1917448 - TRUCK
      ?auto_1917447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917444 ?auto_1917450 ) ( IS-CRATE ?auto_1917442 ) ( not ( = ?auto_1917441 ?auto_1917442 ) ) ( not ( = ?auto_1917440 ?auto_1917441 ) ) ( not ( = ?auto_1917440 ?auto_1917442 ) ) ( not ( = ?auto_1917449 ?auto_1917450 ) ) ( HOIST-AT ?auto_1917443 ?auto_1917449 ) ( not ( = ?auto_1917444 ?auto_1917443 ) ) ( SURFACE-AT ?auto_1917442 ?auto_1917449 ) ( ON ?auto_1917442 ?auto_1917446 ) ( CLEAR ?auto_1917442 ) ( not ( = ?auto_1917441 ?auto_1917446 ) ) ( not ( = ?auto_1917442 ?auto_1917446 ) ) ( not ( = ?auto_1917440 ?auto_1917446 ) ) ( IS-CRATE ?auto_1917441 ) ( AVAILABLE ?auto_1917443 ) ( SURFACE-AT ?auto_1917441 ?auto_1917449 ) ( ON ?auto_1917441 ?auto_1917445 ) ( CLEAR ?auto_1917441 ) ( not ( = ?auto_1917441 ?auto_1917445 ) ) ( not ( = ?auto_1917442 ?auto_1917445 ) ) ( not ( = ?auto_1917440 ?auto_1917445 ) ) ( not ( = ?auto_1917446 ?auto_1917445 ) ) ( TRUCK-AT ?auto_1917448 ?auto_1917450 ) ( SURFACE-AT ?auto_1917447 ?auto_1917450 ) ( CLEAR ?auto_1917447 ) ( LIFTING ?auto_1917444 ?auto_1917440 ) ( IS-CRATE ?auto_1917440 ) ( not ( = ?auto_1917447 ?auto_1917440 ) ) ( not ( = ?auto_1917441 ?auto_1917447 ) ) ( not ( = ?auto_1917442 ?auto_1917447 ) ) ( not ( = ?auto_1917446 ?auto_1917447 ) ) ( not ( = ?auto_1917445 ?auto_1917447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1917441 ?auto_1917442 )
      ( MAKE-2CRATE-VERIFY ?auto_1917440 ?auto_1917441 ?auto_1917442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1917451 - SURFACE
      ?auto_1917452 - SURFACE
      ?auto_1917453 - SURFACE
      ?auto_1917454 - SURFACE
    )
    :vars
    (
      ?auto_1917456 - HOIST
      ?auto_1917461 - PLACE
      ?auto_1917458 - PLACE
      ?auto_1917457 - HOIST
      ?auto_1917459 - SURFACE
      ?auto_1917460 - SURFACE
      ?auto_1917455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917456 ?auto_1917461 ) ( IS-CRATE ?auto_1917454 ) ( not ( = ?auto_1917453 ?auto_1917454 ) ) ( not ( = ?auto_1917452 ?auto_1917453 ) ) ( not ( = ?auto_1917452 ?auto_1917454 ) ) ( not ( = ?auto_1917458 ?auto_1917461 ) ) ( HOIST-AT ?auto_1917457 ?auto_1917458 ) ( not ( = ?auto_1917456 ?auto_1917457 ) ) ( SURFACE-AT ?auto_1917454 ?auto_1917458 ) ( ON ?auto_1917454 ?auto_1917459 ) ( CLEAR ?auto_1917454 ) ( not ( = ?auto_1917453 ?auto_1917459 ) ) ( not ( = ?auto_1917454 ?auto_1917459 ) ) ( not ( = ?auto_1917452 ?auto_1917459 ) ) ( IS-CRATE ?auto_1917453 ) ( AVAILABLE ?auto_1917457 ) ( SURFACE-AT ?auto_1917453 ?auto_1917458 ) ( ON ?auto_1917453 ?auto_1917460 ) ( CLEAR ?auto_1917453 ) ( not ( = ?auto_1917453 ?auto_1917460 ) ) ( not ( = ?auto_1917454 ?auto_1917460 ) ) ( not ( = ?auto_1917452 ?auto_1917460 ) ) ( not ( = ?auto_1917459 ?auto_1917460 ) ) ( TRUCK-AT ?auto_1917455 ?auto_1917461 ) ( SURFACE-AT ?auto_1917451 ?auto_1917461 ) ( CLEAR ?auto_1917451 ) ( LIFTING ?auto_1917456 ?auto_1917452 ) ( IS-CRATE ?auto_1917452 ) ( not ( = ?auto_1917451 ?auto_1917452 ) ) ( not ( = ?auto_1917453 ?auto_1917451 ) ) ( not ( = ?auto_1917454 ?auto_1917451 ) ) ( not ( = ?auto_1917459 ?auto_1917451 ) ) ( not ( = ?auto_1917460 ?auto_1917451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917452 ?auto_1917453 ?auto_1917454 )
      ( MAKE-3CRATE-VERIFY ?auto_1917451 ?auto_1917452 ?auto_1917453 ?auto_1917454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1917462 - SURFACE
      ?auto_1917463 - SURFACE
      ?auto_1917464 - SURFACE
      ?auto_1917465 - SURFACE
      ?auto_1917466 - SURFACE
    )
    :vars
    (
      ?auto_1917468 - HOIST
      ?auto_1917473 - PLACE
      ?auto_1917470 - PLACE
      ?auto_1917469 - HOIST
      ?auto_1917471 - SURFACE
      ?auto_1917472 - SURFACE
      ?auto_1917467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917468 ?auto_1917473 ) ( IS-CRATE ?auto_1917466 ) ( not ( = ?auto_1917465 ?auto_1917466 ) ) ( not ( = ?auto_1917464 ?auto_1917465 ) ) ( not ( = ?auto_1917464 ?auto_1917466 ) ) ( not ( = ?auto_1917470 ?auto_1917473 ) ) ( HOIST-AT ?auto_1917469 ?auto_1917470 ) ( not ( = ?auto_1917468 ?auto_1917469 ) ) ( SURFACE-AT ?auto_1917466 ?auto_1917470 ) ( ON ?auto_1917466 ?auto_1917471 ) ( CLEAR ?auto_1917466 ) ( not ( = ?auto_1917465 ?auto_1917471 ) ) ( not ( = ?auto_1917466 ?auto_1917471 ) ) ( not ( = ?auto_1917464 ?auto_1917471 ) ) ( IS-CRATE ?auto_1917465 ) ( AVAILABLE ?auto_1917469 ) ( SURFACE-AT ?auto_1917465 ?auto_1917470 ) ( ON ?auto_1917465 ?auto_1917472 ) ( CLEAR ?auto_1917465 ) ( not ( = ?auto_1917465 ?auto_1917472 ) ) ( not ( = ?auto_1917466 ?auto_1917472 ) ) ( not ( = ?auto_1917464 ?auto_1917472 ) ) ( not ( = ?auto_1917471 ?auto_1917472 ) ) ( TRUCK-AT ?auto_1917467 ?auto_1917473 ) ( SURFACE-AT ?auto_1917463 ?auto_1917473 ) ( CLEAR ?auto_1917463 ) ( LIFTING ?auto_1917468 ?auto_1917464 ) ( IS-CRATE ?auto_1917464 ) ( not ( = ?auto_1917463 ?auto_1917464 ) ) ( not ( = ?auto_1917465 ?auto_1917463 ) ) ( not ( = ?auto_1917466 ?auto_1917463 ) ) ( not ( = ?auto_1917471 ?auto_1917463 ) ) ( not ( = ?auto_1917472 ?auto_1917463 ) ) ( ON ?auto_1917463 ?auto_1917462 ) ( not ( = ?auto_1917462 ?auto_1917463 ) ) ( not ( = ?auto_1917462 ?auto_1917464 ) ) ( not ( = ?auto_1917462 ?auto_1917465 ) ) ( not ( = ?auto_1917462 ?auto_1917466 ) ) ( not ( = ?auto_1917462 ?auto_1917471 ) ) ( not ( = ?auto_1917462 ?auto_1917472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917464 ?auto_1917465 ?auto_1917466 )
      ( MAKE-4CRATE-VERIFY ?auto_1917462 ?auto_1917463 ?auto_1917464 ?auto_1917465 ?auto_1917466 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917474 - SURFACE
      ?auto_1917475 - SURFACE
      ?auto_1917476 - SURFACE
      ?auto_1917477 - SURFACE
      ?auto_1917478 - SURFACE
      ?auto_1917479 - SURFACE
    )
    :vars
    (
      ?auto_1917481 - HOIST
      ?auto_1917486 - PLACE
      ?auto_1917483 - PLACE
      ?auto_1917482 - HOIST
      ?auto_1917484 - SURFACE
      ?auto_1917485 - SURFACE
      ?auto_1917480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917481 ?auto_1917486 ) ( IS-CRATE ?auto_1917479 ) ( not ( = ?auto_1917478 ?auto_1917479 ) ) ( not ( = ?auto_1917477 ?auto_1917478 ) ) ( not ( = ?auto_1917477 ?auto_1917479 ) ) ( not ( = ?auto_1917483 ?auto_1917486 ) ) ( HOIST-AT ?auto_1917482 ?auto_1917483 ) ( not ( = ?auto_1917481 ?auto_1917482 ) ) ( SURFACE-AT ?auto_1917479 ?auto_1917483 ) ( ON ?auto_1917479 ?auto_1917484 ) ( CLEAR ?auto_1917479 ) ( not ( = ?auto_1917478 ?auto_1917484 ) ) ( not ( = ?auto_1917479 ?auto_1917484 ) ) ( not ( = ?auto_1917477 ?auto_1917484 ) ) ( IS-CRATE ?auto_1917478 ) ( AVAILABLE ?auto_1917482 ) ( SURFACE-AT ?auto_1917478 ?auto_1917483 ) ( ON ?auto_1917478 ?auto_1917485 ) ( CLEAR ?auto_1917478 ) ( not ( = ?auto_1917478 ?auto_1917485 ) ) ( not ( = ?auto_1917479 ?auto_1917485 ) ) ( not ( = ?auto_1917477 ?auto_1917485 ) ) ( not ( = ?auto_1917484 ?auto_1917485 ) ) ( TRUCK-AT ?auto_1917480 ?auto_1917486 ) ( SURFACE-AT ?auto_1917476 ?auto_1917486 ) ( CLEAR ?auto_1917476 ) ( LIFTING ?auto_1917481 ?auto_1917477 ) ( IS-CRATE ?auto_1917477 ) ( not ( = ?auto_1917476 ?auto_1917477 ) ) ( not ( = ?auto_1917478 ?auto_1917476 ) ) ( not ( = ?auto_1917479 ?auto_1917476 ) ) ( not ( = ?auto_1917484 ?auto_1917476 ) ) ( not ( = ?auto_1917485 ?auto_1917476 ) ) ( ON ?auto_1917475 ?auto_1917474 ) ( ON ?auto_1917476 ?auto_1917475 ) ( not ( = ?auto_1917474 ?auto_1917475 ) ) ( not ( = ?auto_1917474 ?auto_1917476 ) ) ( not ( = ?auto_1917474 ?auto_1917477 ) ) ( not ( = ?auto_1917474 ?auto_1917478 ) ) ( not ( = ?auto_1917474 ?auto_1917479 ) ) ( not ( = ?auto_1917474 ?auto_1917484 ) ) ( not ( = ?auto_1917474 ?auto_1917485 ) ) ( not ( = ?auto_1917475 ?auto_1917476 ) ) ( not ( = ?auto_1917475 ?auto_1917477 ) ) ( not ( = ?auto_1917475 ?auto_1917478 ) ) ( not ( = ?auto_1917475 ?auto_1917479 ) ) ( not ( = ?auto_1917475 ?auto_1917484 ) ) ( not ( = ?auto_1917475 ?auto_1917485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917477 ?auto_1917478 ?auto_1917479 )
      ( MAKE-5CRATE-VERIFY ?auto_1917474 ?auto_1917475 ?auto_1917476 ?auto_1917477 ?auto_1917478 ?auto_1917479 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918398 - SURFACE
      ?auto_1918399 - SURFACE
      ?auto_1918400 - SURFACE
      ?auto_1918401 - SURFACE
      ?auto_1918402 - SURFACE
      ?auto_1918403 - SURFACE
      ?auto_1918404 - SURFACE
    )
    :vars
    (
      ?auto_1918406 - HOIST
      ?auto_1918405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918406 ?auto_1918405 ) ( SURFACE-AT ?auto_1918403 ?auto_1918405 ) ( CLEAR ?auto_1918403 ) ( LIFTING ?auto_1918406 ?auto_1918404 ) ( IS-CRATE ?auto_1918404 ) ( not ( = ?auto_1918403 ?auto_1918404 ) ) ( ON ?auto_1918399 ?auto_1918398 ) ( ON ?auto_1918400 ?auto_1918399 ) ( ON ?auto_1918401 ?auto_1918400 ) ( ON ?auto_1918402 ?auto_1918401 ) ( ON ?auto_1918403 ?auto_1918402 ) ( not ( = ?auto_1918398 ?auto_1918399 ) ) ( not ( = ?auto_1918398 ?auto_1918400 ) ) ( not ( = ?auto_1918398 ?auto_1918401 ) ) ( not ( = ?auto_1918398 ?auto_1918402 ) ) ( not ( = ?auto_1918398 ?auto_1918403 ) ) ( not ( = ?auto_1918398 ?auto_1918404 ) ) ( not ( = ?auto_1918399 ?auto_1918400 ) ) ( not ( = ?auto_1918399 ?auto_1918401 ) ) ( not ( = ?auto_1918399 ?auto_1918402 ) ) ( not ( = ?auto_1918399 ?auto_1918403 ) ) ( not ( = ?auto_1918399 ?auto_1918404 ) ) ( not ( = ?auto_1918400 ?auto_1918401 ) ) ( not ( = ?auto_1918400 ?auto_1918402 ) ) ( not ( = ?auto_1918400 ?auto_1918403 ) ) ( not ( = ?auto_1918400 ?auto_1918404 ) ) ( not ( = ?auto_1918401 ?auto_1918402 ) ) ( not ( = ?auto_1918401 ?auto_1918403 ) ) ( not ( = ?auto_1918401 ?auto_1918404 ) ) ( not ( = ?auto_1918402 ?auto_1918403 ) ) ( not ( = ?auto_1918402 ?auto_1918404 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1918403 ?auto_1918404 )
      ( MAKE-6CRATE-VERIFY ?auto_1918398 ?auto_1918399 ?auto_1918400 ?auto_1918401 ?auto_1918402 ?auto_1918403 ?auto_1918404 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918442 - SURFACE
      ?auto_1918443 - SURFACE
      ?auto_1918444 - SURFACE
      ?auto_1918445 - SURFACE
      ?auto_1918446 - SURFACE
      ?auto_1918447 - SURFACE
      ?auto_1918448 - SURFACE
    )
    :vars
    (
      ?auto_1918449 - HOIST
      ?auto_1918450 - PLACE
      ?auto_1918451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918449 ?auto_1918450 ) ( SURFACE-AT ?auto_1918447 ?auto_1918450 ) ( CLEAR ?auto_1918447 ) ( IS-CRATE ?auto_1918448 ) ( not ( = ?auto_1918447 ?auto_1918448 ) ) ( TRUCK-AT ?auto_1918451 ?auto_1918450 ) ( AVAILABLE ?auto_1918449 ) ( IN ?auto_1918448 ?auto_1918451 ) ( ON ?auto_1918447 ?auto_1918446 ) ( not ( = ?auto_1918446 ?auto_1918447 ) ) ( not ( = ?auto_1918446 ?auto_1918448 ) ) ( ON ?auto_1918443 ?auto_1918442 ) ( ON ?auto_1918444 ?auto_1918443 ) ( ON ?auto_1918445 ?auto_1918444 ) ( ON ?auto_1918446 ?auto_1918445 ) ( not ( = ?auto_1918442 ?auto_1918443 ) ) ( not ( = ?auto_1918442 ?auto_1918444 ) ) ( not ( = ?auto_1918442 ?auto_1918445 ) ) ( not ( = ?auto_1918442 ?auto_1918446 ) ) ( not ( = ?auto_1918442 ?auto_1918447 ) ) ( not ( = ?auto_1918442 ?auto_1918448 ) ) ( not ( = ?auto_1918443 ?auto_1918444 ) ) ( not ( = ?auto_1918443 ?auto_1918445 ) ) ( not ( = ?auto_1918443 ?auto_1918446 ) ) ( not ( = ?auto_1918443 ?auto_1918447 ) ) ( not ( = ?auto_1918443 ?auto_1918448 ) ) ( not ( = ?auto_1918444 ?auto_1918445 ) ) ( not ( = ?auto_1918444 ?auto_1918446 ) ) ( not ( = ?auto_1918444 ?auto_1918447 ) ) ( not ( = ?auto_1918444 ?auto_1918448 ) ) ( not ( = ?auto_1918445 ?auto_1918446 ) ) ( not ( = ?auto_1918445 ?auto_1918447 ) ) ( not ( = ?auto_1918445 ?auto_1918448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918446 ?auto_1918447 ?auto_1918448 )
      ( MAKE-6CRATE-VERIFY ?auto_1918442 ?auto_1918443 ?auto_1918444 ?auto_1918445 ?auto_1918446 ?auto_1918447 ?auto_1918448 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918493 - SURFACE
      ?auto_1918494 - SURFACE
      ?auto_1918495 - SURFACE
      ?auto_1918496 - SURFACE
      ?auto_1918497 - SURFACE
      ?auto_1918498 - SURFACE
      ?auto_1918499 - SURFACE
    )
    :vars
    (
      ?auto_1918501 - HOIST
      ?auto_1918503 - PLACE
      ?auto_1918502 - TRUCK
      ?auto_1918500 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918501 ?auto_1918503 ) ( SURFACE-AT ?auto_1918498 ?auto_1918503 ) ( CLEAR ?auto_1918498 ) ( IS-CRATE ?auto_1918499 ) ( not ( = ?auto_1918498 ?auto_1918499 ) ) ( AVAILABLE ?auto_1918501 ) ( IN ?auto_1918499 ?auto_1918502 ) ( ON ?auto_1918498 ?auto_1918497 ) ( not ( = ?auto_1918497 ?auto_1918498 ) ) ( not ( = ?auto_1918497 ?auto_1918499 ) ) ( TRUCK-AT ?auto_1918502 ?auto_1918500 ) ( not ( = ?auto_1918500 ?auto_1918503 ) ) ( ON ?auto_1918494 ?auto_1918493 ) ( ON ?auto_1918495 ?auto_1918494 ) ( ON ?auto_1918496 ?auto_1918495 ) ( ON ?auto_1918497 ?auto_1918496 ) ( not ( = ?auto_1918493 ?auto_1918494 ) ) ( not ( = ?auto_1918493 ?auto_1918495 ) ) ( not ( = ?auto_1918493 ?auto_1918496 ) ) ( not ( = ?auto_1918493 ?auto_1918497 ) ) ( not ( = ?auto_1918493 ?auto_1918498 ) ) ( not ( = ?auto_1918493 ?auto_1918499 ) ) ( not ( = ?auto_1918494 ?auto_1918495 ) ) ( not ( = ?auto_1918494 ?auto_1918496 ) ) ( not ( = ?auto_1918494 ?auto_1918497 ) ) ( not ( = ?auto_1918494 ?auto_1918498 ) ) ( not ( = ?auto_1918494 ?auto_1918499 ) ) ( not ( = ?auto_1918495 ?auto_1918496 ) ) ( not ( = ?auto_1918495 ?auto_1918497 ) ) ( not ( = ?auto_1918495 ?auto_1918498 ) ) ( not ( = ?auto_1918495 ?auto_1918499 ) ) ( not ( = ?auto_1918496 ?auto_1918497 ) ) ( not ( = ?auto_1918496 ?auto_1918498 ) ) ( not ( = ?auto_1918496 ?auto_1918499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918497 ?auto_1918498 ?auto_1918499 )
      ( MAKE-6CRATE-VERIFY ?auto_1918493 ?auto_1918494 ?auto_1918495 ?auto_1918496 ?auto_1918497 ?auto_1918498 ?auto_1918499 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918550 - SURFACE
      ?auto_1918551 - SURFACE
      ?auto_1918552 - SURFACE
      ?auto_1918553 - SURFACE
      ?auto_1918554 - SURFACE
      ?auto_1918555 - SURFACE
      ?auto_1918556 - SURFACE
    )
    :vars
    (
      ?auto_1918557 - HOIST
      ?auto_1918558 - PLACE
      ?auto_1918561 - TRUCK
      ?auto_1918559 - PLACE
      ?auto_1918560 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918557 ?auto_1918558 ) ( SURFACE-AT ?auto_1918555 ?auto_1918558 ) ( CLEAR ?auto_1918555 ) ( IS-CRATE ?auto_1918556 ) ( not ( = ?auto_1918555 ?auto_1918556 ) ) ( AVAILABLE ?auto_1918557 ) ( ON ?auto_1918555 ?auto_1918554 ) ( not ( = ?auto_1918554 ?auto_1918555 ) ) ( not ( = ?auto_1918554 ?auto_1918556 ) ) ( TRUCK-AT ?auto_1918561 ?auto_1918559 ) ( not ( = ?auto_1918559 ?auto_1918558 ) ) ( HOIST-AT ?auto_1918560 ?auto_1918559 ) ( LIFTING ?auto_1918560 ?auto_1918556 ) ( not ( = ?auto_1918557 ?auto_1918560 ) ) ( ON ?auto_1918551 ?auto_1918550 ) ( ON ?auto_1918552 ?auto_1918551 ) ( ON ?auto_1918553 ?auto_1918552 ) ( ON ?auto_1918554 ?auto_1918553 ) ( not ( = ?auto_1918550 ?auto_1918551 ) ) ( not ( = ?auto_1918550 ?auto_1918552 ) ) ( not ( = ?auto_1918550 ?auto_1918553 ) ) ( not ( = ?auto_1918550 ?auto_1918554 ) ) ( not ( = ?auto_1918550 ?auto_1918555 ) ) ( not ( = ?auto_1918550 ?auto_1918556 ) ) ( not ( = ?auto_1918551 ?auto_1918552 ) ) ( not ( = ?auto_1918551 ?auto_1918553 ) ) ( not ( = ?auto_1918551 ?auto_1918554 ) ) ( not ( = ?auto_1918551 ?auto_1918555 ) ) ( not ( = ?auto_1918551 ?auto_1918556 ) ) ( not ( = ?auto_1918552 ?auto_1918553 ) ) ( not ( = ?auto_1918552 ?auto_1918554 ) ) ( not ( = ?auto_1918552 ?auto_1918555 ) ) ( not ( = ?auto_1918552 ?auto_1918556 ) ) ( not ( = ?auto_1918553 ?auto_1918554 ) ) ( not ( = ?auto_1918553 ?auto_1918555 ) ) ( not ( = ?auto_1918553 ?auto_1918556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918554 ?auto_1918555 ?auto_1918556 )
      ( MAKE-6CRATE-VERIFY ?auto_1918550 ?auto_1918551 ?auto_1918552 ?auto_1918553 ?auto_1918554 ?auto_1918555 ?auto_1918556 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918613 - SURFACE
      ?auto_1918614 - SURFACE
      ?auto_1918615 - SURFACE
      ?auto_1918616 - SURFACE
      ?auto_1918617 - SURFACE
      ?auto_1918618 - SURFACE
      ?auto_1918619 - SURFACE
    )
    :vars
    (
      ?auto_1918624 - HOIST
      ?auto_1918620 - PLACE
      ?auto_1918625 - TRUCK
      ?auto_1918621 - PLACE
      ?auto_1918622 - HOIST
      ?auto_1918623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918624 ?auto_1918620 ) ( SURFACE-AT ?auto_1918618 ?auto_1918620 ) ( CLEAR ?auto_1918618 ) ( IS-CRATE ?auto_1918619 ) ( not ( = ?auto_1918618 ?auto_1918619 ) ) ( AVAILABLE ?auto_1918624 ) ( ON ?auto_1918618 ?auto_1918617 ) ( not ( = ?auto_1918617 ?auto_1918618 ) ) ( not ( = ?auto_1918617 ?auto_1918619 ) ) ( TRUCK-AT ?auto_1918625 ?auto_1918621 ) ( not ( = ?auto_1918621 ?auto_1918620 ) ) ( HOIST-AT ?auto_1918622 ?auto_1918621 ) ( not ( = ?auto_1918624 ?auto_1918622 ) ) ( AVAILABLE ?auto_1918622 ) ( SURFACE-AT ?auto_1918619 ?auto_1918621 ) ( ON ?auto_1918619 ?auto_1918623 ) ( CLEAR ?auto_1918619 ) ( not ( = ?auto_1918618 ?auto_1918623 ) ) ( not ( = ?auto_1918619 ?auto_1918623 ) ) ( not ( = ?auto_1918617 ?auto_1918623 ) ) ( ON ?auto_1918614 ?auto_1918613 ) ( ON ?auto_1918615 ?auto_1918614 ) ( ON ?auto_1918616 ?auto_1918615 ) ( ON ?auto_1918617 ?auto_1918616 ) ( not ( = ?auto_1918613 ?auto_1918614 ) ) ( not ( = ?auto_1918613 ?auto_1918615 ) ) ( not ( = ?auto_1918613 ?auto_1918616 ) ) ( not ( = ?auto_1918613 ?auto_1918617 ) ) ( not ( = ?auto_1918613 ?auto_1918618 ) ) ( not ( = ?auto_1918613 ?auto_1918619 ) ) ( not ( = ?auto_1918613 ?auto_1918623 ) ) ( not ( = ?auto_1918614 ?auto_1918615 ) ) ( not ( = ?auto_1918614 ?auto_1918616 ) ) ( not ( = ?auto_1918614 ?auto_1918617 ) ) ( not ( = ?auto_1918614 ?auto_1918618 ) ) ( not ( = ?auto_1918614 ?auto_1918619 ) ) ( not ( = ?auto_1918614 ?auto_1918623 ) ) ( not ( = ?auto_1918615 ?auto_1918616 ) ) ( not ( = ?auto_1918615 ?auto_1918617 ) ) ( not ( = ?auto_1918615 ?auto_1918618 ) ) ( not ( = ?auto_1918615 ?auto_1918619 ) ) ( not ( = ?auto_1918615 ?auto_1918623 ) ) ( not ( = ?auto_1918616 ?auto_1918617 ) ) ( not ( = ?auto_1918616 ?auto_1918618 ) ) ( not ( = ?auto_1918616 ?auto_1918619 ) ) ( not ( = ?auto_1918616 ?auto_1918623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918617 ?auto_1918618 ?auto_1918619 )
      ( MAKE-6CRATE-VERIFY ?auto_1918613 ?auto_1918614 ?auto_1918615 ?auto_1918616 ?auto_1918617 ?auto_1918618 ?auto_1918619 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918677 - SURFACE
      ?auto_1918678 - SURFACE
      ?auto_1918679 - SURFACE
      ?auto_1918680 - SURFACE
      ?auto_1918681 - SURFACE
      ?auto_1918682 - SURFACE
      ?auto_1918683 - SURFACE
    )
    :vars
    (
      ?auto_1918684 - HOIST
      ?auto_1918687 - PLACE
      ?auto_1918688 - PLACE
      ?auto_1918689 - HOIST
      ?auto_1918685 - SURFACE
      ?auto_1918686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918684 ?auto_1918687 ) ( SURFACE-AT ?auto_1918682 ?auto_1918687 ) ( CLEAR ?auto_1918682 ) ( IS-CRATE ?auto_1918683 ) ( not ( = ?auto_1918682 ?auto_1918683 ) ) ( AVAILABLE ?auto_1918684 ) ( ON ?auto_1918682 ?auto_1918681 ) ( not ( = ?auto_1918681 ?auto_1918682 ) ) ( not ( = ?auto_1918681 ?auto_1918683 ) ) ( not ( = ?auto_1918688 ?auto_1918687 ) ) ( HOIST-AT ?auto_1918689 ?auto_1918688 ) ( not ( = ?auto_1918684 ?auto_1918689 ) ) ( AVAILABLE ?auto_1918689 ) ( SURFACE-AT ?auto_1918683 ?auto_1918688 ) ( ON ?auto_1918683 ?auto_1918685 ) ( CLEAR ?auto_1918683 ) ( not ( = ?auto_1918682 ?auto_1918685 ) ) ( not ( = ?auto_1918683 ?auto_1918685 ) ) ( not ( = ?auto_1918681 ?auto_1918685 ) ) ( TRUCK-AT ?auto_1918686 ?auto_1918687 ) ( ON ?auto_1918678 ?auto_1918677 ) ( ON ?auto_1918679 ?auto_1918678 ) ( ON ?auto_1918680 ?auto_1918679 ) ( ON ?auto_1918681 ?auto_1918680 ) ( not ( = ?auto_1918677 ?auto_1918678 ) ) ( not ( = ?auto_1918677 ?auto_1918679 ) ) ( not ( = ?auto_1918677 ?auto_1918680 ) ) ( not ( = ?auto_1918677 ?auto_1918681 ) ) ( not ( = ?auto_1918677 ?auto_1918682 ) ) ( not ( = ?auto_1918677 ?auto_1918683 ) ) ( not ( = ?auto_1918677 ?auto_1918685 ) ) ( not ( = ?auto_1918678 ?auto_1918679 ) ) ( not ( = ?auto_1918678 ?auto_1918680 ) ) ( not ( = ?auto_1918678 ?auto_1918681 ) ) ( not ( = ?auto_1918678 ?auto_1918682 ) ) ( not ( = ?auto_1918678 ?auto_1918683 ) ) ( not ( = ?auto_1918678 ?auto_1918685 ) ) ( not ( = ?auto_1918679 ?auto_1918680 ) ) ( not ( = ?auto_1918679 ?auto_1918681 ) ) ( not ( = ?auto_1918679 ?auto_1918682 ) ) ( not ( = ?auto_1918679 ?auto_1918683 ) ) ( not ( = ?auto_1918679 ?auto_1918685 ) ) ( not ( = ?auto_1918680 ?auto_1918681 ) ) ( not ( = ?auto_1918680 ?auto_1918682 ) ) ( not ( = ?auto_1918680 ?auto_1918683 ) ) ( not ( = ?auto_1918680 ?auto_1918685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918681 ?auto_1918682 ?auto_1918683 )
      ( MAKE-6CRATE-VERIFY ?auto_1918677 ?auto_1918678 ?auto_1918679 ?auto_1918680 ?auto_1918681 ?auto_1918682 ?auto_1918683 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918741 - SURFACE
      ?auto_1918742 - SURFACE
      ?auto_1918743 - SURFACE
      ?auto_1918744 - SURFACE
      ?auto_1918745 - SURFACE
      ?auto_1918746 - SURFACE
      ?auto_1918747 - SURFACE
    )
    :vars
    (
      ?auto_1918753 - HOIST
      ?auto_1918751 - PLACE
      ?auto_1918748 - PLACE
      ?auto_1918749 - HOIST
      ?auto_1918752 - SURFACE
      ?auto_1918750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918753 ?auto_1918751 ) ( IS-CRATE ?auto_1918747 ) ( not ( = ?auto_1918746 ?auto_1918747 ) ) ( not ( = ?auto_1918745 ?auto_1918746 ) ) ( not ( = ?auto_1918745 ?auto_1918747 ) ) ( not ( = ?auto_1918748 ?auto_1918751 ) ) ( HOIST-AT ?auto_1918749 ?auto_1918748 ) ( not ( = ?auto_1918753 ?auto_1918749 ) ) ( AVAILABLE ?auto_1918749 ) ( SURFACE-AT ?auto_1918747 ?auto_1918748 ) ( ON ?auto_1918747 ?auto_1918752 ) ( CLEAR ?auto_1918747 ) ( not ( = ?auto_1918746 ?auto_1918752 ) ) ( not ( = ?auto_1918747 ?auto_1918752 ) ) ( not ( = ?auto_1918745 ?auto_1918752 ) ) ( TRUCK-AT ?auto_1918750 ?auto_1918751 ) ( SURFACE-AT ?auto_1918745 ?auto_1918751 ) ( CLEAR ?auto_1918745 ) ( LIFTING ?auto_1918753 ?auto_1918746 ) ( IS-CRATE ?auto_1918746 ) ( ON ?auto_1918742 ?auto_1918741 ) ( ON ?auto_1918743 ?auto_1918742 ) ( ON ?auto_1918744 ?auto_1918743 ) ( ON ?auto_1918745 ?auto_1918744 ) ( not ( = ?auto_1918741 ?auto_1918742 ) ) ( not ( = ?auto_1918741 ?auto_1918743 ) ) ( not ( = ?auto_1918741 ?auto_1918744 ) ) ( not ( = ?auto_1918741 ?auto_1918745 ) ) ( not ( = ?auto_1918741 ?auto_1918746 ) ) ( not ( = ?auto_1918741 ?auto_1918747 ) ) ( not ( = ?auto_1918741 ?auto_1918752 ) ) ( not ( = ?auto_1918742 ?auto_1918743 ) ) ( not ( = ?auto_1918742 ?auto_1918744 ) ) ( not ( = ?auto_1918742 ?auto_1918745 ) ) ( not ( = ?auto_1918742 ?auto_1918746 ) ) ( not ( = ?auto_1918742 ?auto_1918747 ) ) ( not ( = ?auto_1918742 ?auto_1918752 ) ) ( not ( = ?auto_1918743 ?auto_1918744 ) ) ( not ( = ?auto_1918743 ?auto_1918745 ) ) ( not ( = ?auto_1918743 ?auto_1918746 ) ) ( not ( = ?auto_1918743 ?auto_1918747 ) ) ( not ( = ?auto_1918743 ?auto_1918752 ) ) ( not ( = ?auto_1918744 ?auto_1918745 ) ) ( not ( = ?auto_1918744 ?auto_1918746 ) ) ( not ( = ?auto_1918744 ?auto_1918747 ) ) ( not ( = ?auto_1918744 ?auto_1918752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918745 ?auto_1918746 ?auto_1918747 )
      ( MAKE-6CRATE-VERIFY ?auto_1918741 ?auto_1918742 ?auto_1918743 ?auto_1918744 ?auto_1918745 ?auto_1918746 ?auto_1918747 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918805 - SURFACE
      ?auto_1918806 - SURFACE
      ?auto_1918807 - SURFACE
      ?auto_1918808 - SURFACE
      ?auto_1918809 - SURFACE
      ?auto_1918810 - SURFACE
      ?auto_1918811 - SURFACE
    )
    :vars
    (
      ?auto_1918812 - HOIST
      ?auto_1918813 - PLACE
      ?auto_1918815 - PLACE
      ?auto_1918814 - HOIST
      ?auto_1918816 - SURFACE
      ?auto_1918817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918812 ?auto_1918813 ) ( IS-CRATE ?auto_1918811 ) ( not ( = ?auto_1918810 ?auto_1918811 ) ) ( not ( = ?auto_1918809 ?auto_1918810 ) ) ( not ( = ?auto_1918809 ?auto_1918811 ) ) ( not ( = ?auto_1918815 ?auto_1918813 ) ) ( HOIST-AT ?auto_1918814 ?auto_1918815 ) ( not ( = ?auto_1918812 ?auto_1918814 ) ) ( AVAILABLE ?auto_1918814 ) ( SURFACE-AT ?auto_1918811 ?auto_1918815 ) ( ON ?auto_1918811 ?auto_1918816 ) ( CLEAR ?auto_1918811 ) ( not ( = ?auto_1918810 ?auto_1918816 ) ) ( not ( = ?auto_1918811 ?auto_1918816 ) ) ( not ( = ?auto_1918809 ?auto_1918816 ) ) ( TRUCK-AT ?auto_1918817 ?auto_1918813 ) ( SURFACE-AT ?auto_1918809 ?auto_1918813 ) ( CLEAR ?auto_1918809 ) ( IS-CRATE ?auto_1918810 ) ( AVAILABLE ?auto_1918812 ) ( IN ?auto_1918810 ?auto_1918817 ) ( ON ?auto_1918806 ?auto_1918805 ) ( ON ?auto_1918807 ?auto_1918806 ) ( ON ?auto_1918808 ?auto_1918807 ) ( ON ?auto_1918809 ?auto_1918808 ) ( not ( = ?auto_1918805 ?auto_1918806 ) ) ( not ( = ?auto_1918805 ?auto_1918807 ) ) ( not ( = ?auto_1918805 ?auto_1918808 ) ) ( not ( = ?auto_1918805 ?auto_1918809 ) ) ( not ( = ?auto_1918805 ?auto_1918810 ) ) ( not ( = ?auto_1918805 ?auto_1918811 ) ) ( not ( = ?auto_1918805 ?auto_1918816 ) ) ( not ( = ?auto_1918806 ?auto_1918807 ) ) ( not ( = ?auto_1918806 ?auto_1918808 ) ) ( not ( = ?auto_1918806 ?auto_1918809 ) ) ( not ( = ?auto_1918806 ?auto_1918810 ) ) ( not ( = ?auto_1918806 ?auto_1918811 ) ) ( not ( = ?auto_1918806 ?auto_1918816 ) ) ( not ( = ?auto_1918807 ?auto_1918808 ) ) ( not ( = ?auto_1918807 ?auto_1918809 ) ) ( not ( = ?auto_1918807 ?auto_1918810 ) ) ( not ( = ?auto_1918807 ?auto_1918811 ) ) ( not ( = ?auto_1918807 ?auto_1918816 ) ) ( not ( = ?auto_1918808 ?auto_1918809 ) ) ( not ( = ?auto_1918808 ?auto_1918810 ) ) ( not ( = ?auto_1918808 ?auto_1918811 ) ) ( not ( = ?auto_1918808 ?auto_1918816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918809 ?auto_1918810 ?auto_1918811 )
      ( MAKE-6CRATE-VERIFY ?auto_1918805 ?auto_1918806 ?auto_1918807 ?auto_1918808 ?auto_1918809 ?auto_1918810 ?auto_1918811 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920754 - SURFACE
      ?auto_1920755 - SURFACE
      ?auto_1920756 - SURFACE
      ?auto_1920757 - SURFACE
      ?auto_1920758 - SURFACE
      ?auto_1920759 - SURFACE
      ?auto_1920760 - SURFACE
      ?auto_1920761 - SURFACE
    )
    :vars
    (
      ?auto_1920762 - HOIST
      ?auto_1920763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920762 ?auto_1920763 ) ( SURFACE-AT ?auto_1920760 ?auto_1920763 ) ( CLEAR ?auto_1920760 ) ( LIFTING ?auto_1920762 ?auto_1920761 ) ( IS-CRATE ?auto_1920761 ) ( not ( = ?auto_1920760 ?auto_1920761 ) ) ( ON ?auto_1920755 ?auto_1920754 ) ( ON ?auto_1920756 ?auto_1920755 ) ( ON ?auto_1920757 ?auto_1920756 ) ( ON ?auto_1920758 ?auto_1920757 ) ( ON ?auto_1920759 ?auto_1920758 ) ( ON ?auto_1920760 ?auto_1920759 ) ( not ( = ?auto_1920754 ?auto_1920755 ) ) ( not ( = ?auto_1920754 ?auto_1920756 ) ) ( not ( = ?auto_1920754 ?auto_1920757 ) ) ( not ( = ?auto_1920754 ?auto_1920758 ) ) ( not ( = ?auto_1920754 ?auto_1920759 ) ) ( not ( = ?auto_1920754 ?auto_1920760 ) ) ( not ( = ?auto_1920754 ?auto_1920761 ) ) ( not ( = ?auto_1920755 ?auto_1920756 ) ) ( not ( = ?auto_1920755 ?auto_1920757 ) ) ( not ( = ?auto_1920755 ?auto_1920758 ) ) ( not ( = ?auto_1920755 ?auto_1920759 ) ) ( not ( = ?auto_1920755 ?auto_1920760 ) ) ( not ( = ?auto_1920755 ?auto_1920761 ) ) ( not ( = ?auto_1920756 ?auto_1920757 ) ) ( not ( = ?auto_1920756 ?auto_1920758 ) ) ( not ( = ?auto_1920756 ?auto_1920759 ) ) ( not ( = ?auto_1920756 ?auto_1920760 ) ) ( not ( = ?auto_1920756 ?auto_1920761 ) ) ( not ( = ?auto_1920757 ?auto_1920758 ) ) ( not ( = ?auto_1920757 ?auto_1920759 ) ) ( not ( = ?auto_1920757 ?auto_1920760 ) ) ( not ( = ?auto_1920757 ?auto_1920761 ) ) ( not ( = ?auto_1920758 ?auto_1920759 ) ) ( not ( = ?auto_1920758 ?auto_1920760 ) ) ( not ( = ?auto_1920758 ?auto_1920761 ) ) ( not ( = ?auto_1920759 ?auto_1920760 ) ) ( not ( = ?auto_1920759 ?auto_1920761 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1920760 ?auto_1920761 )
      ( MAKE-7CRATE-VERIFY ?auto_1920754 ?auto_1920755 ?auto_1920756 ?auto_1920757 ?auto_1920758 ?auto_1920759 ?auto_1920760 ?auto_1920761 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920809 - SURFACE
      ?auto_1920810 - SURFACE
      ?auto_1920811 - SURFACE
      ?auto_1920812 - SURFACE
      ?auto_1920813 - SURFACE
      ?auto_1920814 - SURFACE
      ?auto_1920815 - SURFACE
      ?auto_1920816 - SURFACE
    )
    :vars
    (
      ?auto_1920817 - HOIST
      ?auto_1920819 - PLACE
      ?auto_1920818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920817 ?auto_1920819 ) ( SURFACE-AT ?auto_1920815 ?auto_1920819 ) ( CLEAR ?auto_1920815 ) ( IS-CRATE ?auto_1920816 ) ( not ( = ?auto_1920815 ?auto_1920816 ) ) ( TRUCK-AT ?auto_1920818 ?auto_1920819 ) ( AVAILABLE ?auto_1920817 ) ( IN ?auto_1920816 ?auto_1920818 ) ( ON ?auto_1920815 ?auto_1920814 ) ( not ( = ?auto_1920814 ?auto_1920815 ) ) ( not ( = ?auto_1920814 ?auto_1920816 ) ) ( ON ?auto_1920810 ?auto_1920809 ) ( ON ?auto_1920811 ?auto_1920810 ) ( ON ?auto_1920812 ?auto_1920811 ) ( ON ?auto_1920813 ?auto_1920812 ) ( ON ?auto_1920814 ?auto_1920813 ) ( not ( = ?auto_1920809 ?auto_1920810 ) ) ( not ( = ?auto_1920809 ?auto_1920811 ) ) ( not ( = ?auto_1920809 ?auto_1920812 ) ) ( not ( = ?auto_1920809 ?auto_1920813 ) ) ( not ( = ?auto_1920809 ?auto_1920814 ) ) ( not ( = ?auto_1920809 ?auto_1920815 ) ) ( not ( = ?auto_1920809 ?auto_1920816 ) ) ( not ( = ?auto_1920810 ?auto_1920811 ) ) ( not ( = ?auto_1920810 ?auto_1920812 ) ) ( not ( = ?auto_1920810 ?auto_1920813 ) ) ( not ( = ?auto_1920810 ?auto_1920814 ) ) ( not ( = ?auto_1920810 ?auto_1920815 ) ) ( not ( = ?auto_1920810 ?auto_1920816 ) ) ( not ( = ?auto_1920811 ?auto_1920812 ) ) ( not ( = ?auto_1920811 ?auto_1920813 ) ) ( not ( = ?auto_1920811 ?auto_1920814 ) ) ( not ( = ?auto_1920811 ?auto_1920815 ) ) ( not ( = ?auto_1920811 ?auto_1920816 ) ) ( not ( = ?auto_1920812 ?auto_1920813 ) ) ( not ( = ?auto_1920812 ?auto_1920814 ) ) ( not ( = ?auto_1920812 ?auto_1920815 ) ) ( not ( = ?auto_1920812 ?auto_1920816 ) ) ( not ( = ?auto_1920813 ?auto_1920814 ) ) ( not ( = ?auto_1920813 ?auto_1920815 ) ) ( not ( = ?auto_1920813 ?auto_1920816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920814 ?auto_1920815 ?auto_1920816 )
      ( MAKE-7CRATE-VERIFY ?auto_1920809 ?auto_1920810 ?auto_1920811 ?auto_1920812 ?auto_1920813 ?auto_1920814 ?auto_1920815 ?auto_1920816 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920872 - SURFACE
      ?auto_1920873 - SURFACE
      ?auto_1920874 - SURFACE
      ?auto_1920875 - SURFACE
      ?auto_1920876 - SURFACE
      ?auto_1920877 - SURFACE
      ?auto_1920878 - SURFACE
      ?auto_1920879 - SURFACE
    )
    :vars
    (
      ?auto_1920883 - HOIST
      ?auto_1920880 - PLACE
      ?auto_1920882 - TRUCK
      ?auto_1920881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920883 ?auto_1920880 ) ( SURFACE-AT ?auto_1920878 ?auto_1920880 ) ( CLEAR ?auto_1920878 ) ( IS-CRATE ?auto_1920879 ) ( not ( = ?auto_1920878 ?auto_1920879 ) ) ( AVAILABLE ?auto_1920883 ) ( IN ?auto_1920879 ?auto_1920882 ) ( ON ?auto_1920878 ?auto_1920877 ) ( not ( = ?auto_1920877 ?auto_1920878 ) ) ( not ( = ?auto_1920877 ?auto_1920879 ) ) ( TRUCK-AT ?auto_1920882 ?auto_1920881 ) ( not ( = ?auto_1920881 ?auto_1920880 ) ) ( ON ?auto_1920873 ?auto_1920872 ) ( ON ?auto_1920874 ?auto_1920873 ) ( ON ?auto_1920875 ?auto_1920874 ) ( ON ?auto_1920876 ?auto_1920875 ) ( ON ?auto_1920877 ?auto_1920876 ) ( not ( = ?auto_1920872 ?auto_1920873 ) ) ( not ( = ?auto_1920872 ?auto_1920874 ) ) ( not ( = ?auto_1920872 ?auto_1920875 ) ) ( not ( = ?auto_1920872 ?auto_1920876 ) ) ( not ( = ?auto_1920872 ?auto_1920877 ) ) ( not ( = ?auto_1920872 ?auto_1920878 ) ) ( not ( = ?auto_1920872 ?auto_1920879 ) ) ( not ( = ?auto_1920873 ?auto_1920874 ) ) ( not ( = ?auto_1920873 ?auto_1920875 ) ) ( not ( = ?auto_1920873 ?auto_1920876 ) ) ( not ( = ?auto_1920873 ?auto_1920877 ) ) ( not ( = ?auto_1920873 ?auto_1920878 ) ) ( not ( = ?auto_1920873 ?auto_1920879 ) ) ( not ( = ?auto_1920874 ?auto_1920875 ) ) ( not ( = ?auto_1920874 ?auto_1920876 ) ) ( not ( = ?auto_1920874 ?auto_1920877 ) ) ( not ( = ?auto_1920874 ?auto_1920878 ) ) ( not ( = ?auto_1920874 ?auto_1920879 ) ) ( not ( = ?auto_1920875 ?auto_1920876 ) ) ( not ( = ?auto_1920875 ?auto_1920877 ) ) ( not ( = ?auto_1920875 ?auto_1920878 ) ) ( not ( = ?auto_1920875 ?auto_1920879 ) ) ( not ( = ?auto_1920876 ?auto_1920877 ) ) ( not ( = ?auto_1920876 ?auto_1920878 ) ) ( not ( = ?auto_1920876 ?auto_1920879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920877 ?auto_1920878 ?auto_1920879 )
      ( MAKE-7CRATE-VERIFY ?auto_1920872 ?auto_1920873 ?auto_1920874 ?auto_1920875 ?auto_1920876 ?auto_1920877 ?auto_1920878 ?auto_1920879 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920942 - SURFACE
      ?auto_1920943 - SURFACE
      ?auto_1920944 - SURFACE
      ?auto_1920945 - SURFACE
      ?auto_1920946 - SURFACE
      ?auto_1920947 - SURFACE
      ?auto_1920948 - SURFACE
      ?auto_1920949 - SURFACE
    )
    :vars
    (
      ?auto_1920952 - HOIST
      ?auto_1920954 - PLACE
      ?auto_1920953 - TRUCK
      ?auto_1920951 - PLACE
      ?auto_1920950 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920952 ?auto_1920954 ) ( SURFACE-AT ?auto_1920948 ?auto_1920954 ) ( CLEAR ?auto_1920948 ) ( IS-CRATE ?auto_1920949 ) ( not ( = ?auto_1920948 ?auto_1920949 ) ) ( AVAILABLE ?auto_1920952 ) ( ON ?auto_1920948 ?auto_1920947 ) ( not ( = ?auto_1920947 ?auto_1920948 ) ) ( not ( = ?auto_1920947 ?auto_1920949 ) ) ( TRUCK-AT ?auto_1920953 ?auto_1920951 ) ( not ( = ?auto_1920951 ?auto_1920954 ) ) ( HOIST-AT ?auto_1920950 ?auto_1920951 ) ( LIFTING ?auto_1920950 ?auto_1920949 ) ( not ( = ?auto_1920952 ?auto_1920950 ) ) ( ON ?auto_1920943 ?auto_1920942 ) ( ON ?auto_1920944 ?auto_1920943 ) ( ON ?auto_1920945 ?auto_1920944 ) ( ON ?auto_1920946 ?auto_1920945 ) ( ON ?auto_1920947 ?auto_1920946 ) ( not ( = ?auto_1920942 ?auto_1920943 ) ) ( not ( = ?auto_1920942 ?auto_1920944 ) ) ( not ( = ?auto_1920942 ?auto_1920945 ) ) ( not ( = ?auto_1920942 ?auto_1920946 ) ) ( not ( = ?auto_1920942 ?auto_1920947 ) ) ( not ( = ?auto_1920942 ?auto_1920948 ) ) ( not ( = ?auto_1920942 ?auto_1920949 ) ) ( not ( = ?auto_1920943 ?auto_1920944 ) ) ( not ( = ?auto_1920943 ?auto_1920945 ) ) ( not ( = ?auto_1920943 ?auto_1920946 ) ) ( not ( = ?auto_1920943 ?auto_1920947 ) ) ( not ( = ?auto_1920943 ?auto_1920948 ) ) ( not ( = ?auto_1920943 ?auto_1920949 ) ) ( not ( = ?auto_1920944 ?auto_1920945 ) ) ( not ( = ?auto_1920944 ?auto_1920946 ) ) ( not ( = ?auto_1920944 ?auto_1920947 ) ) ( not ( = ?auto_1920944 ?auto_1920948 ) ) ( not ( = ?auto_1920944 ?auto_1920949 ) ) ( not ( = ?auto_1920945 ?auto_1920946 ) ) ( not ( = ?auto_1920945 ?auto_1920947 ) ) ( not ( = ?auto_1920945 ?auto_1920948 ) ) ( not ( = ?auto_1920945 ?auto_1920949 ) ) ( not ( = ?auto_1920946 ?auto_1920947 ) ) ( not ( = ?auto_1920946 ?auto_1920948 ) ) ( not ( = ?auto_1920946 ?auto_1920949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920947 ?auto_1920948 ?auto_1920949 )
      ( MAKE-7CRATE-VERIFY ?auto_1920942 ?auto_1920943 ?auto_1920944 ?auto_1920945 ?auto_1920946 ?auto_1920947 ?auto_1920948 ?auto_1920949 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921019 - SURFACE
      ?auto_1921020 - SURFACE
      ?auto_1921021 - SURFACE
      ?auto_1921022 - SURFACE
      ?auto_1921023 - SURFACE
      ?auto_1921024 - SURFACE
      ?auto_1921025 - SURFACE
      ?auto_1921026 - SURFACE
    )
    :vars
    (
      ?auto_1921028 - HOIST
      ?auto_1921031 - PLACE
      ?auto_1921030 - TRUCK
      ?auto_1921027 - PLACE
      ?auto_1921029 - HOIST
      ?auto_1921032 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921028 ?auto_1921031 ) ( SURFACE-AT ?auto_1921025 ?auto_1921031 ) ( CLEAR ?auto_1921025 ) ( IS-CRATE ?auto_1921026 ) ( not ( = ?auto_1921025 ?auto_1921026 ) ) ( AVAILABLE ?auto_1921028 ) ( ON ?auto_1921025 ?auto_1921024 ) ( not ( = ?auto_1921024 ?auto_1921025 ) ) ( not ( = ?auto_1921024 ?auto_1921026 ) ) ( TRUCK-AT ?auto_1921030 ?auto_1921027 ) ( not ( = ?auto_1921027 ?auto_1921031 ) ) ( HOIST-AT ?auto_1921029 ?auto_1921027 ) ( not ( = ?auto_1921028 ?auto_1921029 ) ) ( AVAILABLE ?auto_1921029 ) ( SURFACE-AT ?auto_1921026 ?auto_1921027 ) ( ON ?auto_1921026 ?auto_1921032 ) ( CLEAR ?auto_1921026 ) ( not ( = ?auto_1921025 ?auto_1921032 ) ) ( not ( = ?auto_1921026 ?auto_1921032 ) ) ( not ( = ?auto_1921024 ?auto_1921032 ) ) ( ON ?auto_1921020 ?auto_1921019 ) ( ON ?auto_1921021 ?auto_1921020 ) ( ON ?auto_1921022 ?auto_1921021 ) ( ON ?auto_1921023 ?auto_1921022 ) ( ON ?auto_1921024 ?auto_1921023 ) ( not ( = ?auto_1921019 ?auto_1921020 ) ) ( not ( = ?auto_1921019 ?auto_1921021 ) ) ( not ( = ?auto_1921019 ?auto_1921022 ) ) ( not ( = ?auto_1921019 ?auto_1921023 ) ) ( not ( = ?auto_1921019 ?auto_1921024 ) ) ( not ( = ?auto_1921019 ?auto_1921025 ) ) ( not ( = ?auto_1921019 ?auto_1921026 ) ) ( not ( = ?auto_1921019 ?auto_1921032 ) ) ( not ( = ?auto_1921020 ?auto_1921021 ) ) ( not ( = ?auto_1921020 ?auto_1921022 ) ) ( not ( = ?auto_1921020 ?auto_1921023 ) ) ( not ( = ?auto_1921020 ?auto_1921024 ) ) ( not ( = ?auto_1921020 ?auto_1921025 ) ) ( not ( = ?auto_1921020 ?auto_1921026 ) ) ( not ( = ?auto_1921020 ?auto_1921032 ) ) ( not ( = ?auto_1921021 ?auto_1921022 ) ) ( not ( = ?auto_1921021 ?auto_1921023 ) ) ( not ( = ?auto_1921021 ?auto_1921024 ) ) ( not ( = ?auto_1921021 ?auto_1921025 ) ) ( not ( = ?auto_1921021 ?auto_1921026 ) ) ( not ( = ?auto_1921021 ?auto_1921032 ) ) ( not ( = ?auto_1921022 ?auto_1921023 ) ) ( not ( = ?auto_1921022 ?auto_1921024 ) ) ( not ( = ?auto_1921022 ?auto_1921025 ) ) ( not ( = ?auto_1921022 ?auto_1921026 ) ) ( not ( = ?auto_1921022 ?auto_1921032 ) ) ( not ( = ?auto_1921023 ?auto_1921024 ) ) ( not ( = ?auto_1921023 ?auto_1921025 ) ) ( not ( = ?auto_1921023 ?auto_1921026 ) ) ( not ( = ?auto_1921023 ?auto_1921032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921024 ?auto_1921025 ?auto_1921026 )
      ( MAKE-7CRATE-VERIFY ?auto_1921019 ?auto_1921020 ?auto_1921021 ?auto_1921022 ?auto_1921023 ?auto_1921024 ?auto_1921025 ?auto_1921026 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921097 - SURFACE
      ?auto_1921098 - SURFACE
      ?auto_1921099 - SURFACE
      ?auto_1921100 - SURFACE
      ?auto_1921101 - SURFACE
      ?auto_1921102 - SURFACE
      ?auto_1921103 - SURFACE
      ?auto_1921104 - SURFACE
    )
    :vars
    (
      ?auto_1921110 - HOIST
      ?auto_1921108 - PLACE
      ?auto_1921107 - PLACE
      ?auto_1921109 - HOIST
      ?auto_1921106 - SURFACE
      ?auto_1921105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921110 ?auto_1921108 ) ( SURFACE-AT ?auto_1921103 ?auto_1921108 ) ( CLEAR ?auto_1921103 ) ( IS-CRATE ?auto_1921104 ) ( not ( = ?auto_1921103 ?auto_1921104 ) ) ( AVAILABLE ?auto_1921110 ) ( ON ?auto_1921103 ?auto_1921102 ) ( not ( = ?auto_1921102 ?auto_1921103 ) ) ( not ( = ?auto_1921102 ?auto_1921104 ) ) ( not ( = ?auto_1921107 ?auto_1921108 ) ) ( HOIST-AT ?auto_1921109 ?auto_1921107 ) ( not ( = ?auto_1921110 ?auto_1921109 ) ) ( AVAILABLE ?auto_1921109 ) ( SURFACE-AT ?auto_1921104 ?auto_1921107 ) ( ON ?auto_1921104 ?auto_1921106 ) ( CLEAR ?auto_1921104 ) ( not ( = ?auto_1921103 ?auto_1921106 ) ) ( not ( = ?auto_1921104 ?auto_1921106 ) ) ( not ( = ?auto_1921102 ?auto_1921106 ) ) ( TRUCK-AT ?auto_1921105 ?auto_1921108 ) ( ON ?auto_1921098 ?auto_1921097 ) ( ON ?auto_1921099 ?auto_1921098 ) ( ON ?auto_1921100 ?auto_1921099 ) ( ON ?auto_1921101 ?auto_1921100 ) ( ON ?auto_1921102 ?auto_1921101 ) ( not ( = ?auto_1921097 ?auto_1921098 ) ) ( not ( = ?auto_1921097 ?auto_1921099 ) ) ( not ( = ?auto_1921097 ?auto_1921100 ) ) ( not ( = ?auto_1921097 ?auto_1921101 ) ) ( not ( = ?auto_1921097 ?auto_1921102 ) ) ( not ( = ?auto_1921097 ?auto_1921103 ) ) ( not ( = ?auto_1921097 ?auto_1921104 ) ) ( not ( = ?auto_1921097 ?auto_1921106 ) ) ( not ( = ?auto_1921098 ?auto_1921099 ) ) ( not ( = ?auto_1921098 ?auto_1921100 ) ) ( not ( = ?auto_1921098 ?auto_1921101 ) ) ( not ( = ?auto_1921098 ?auto_1921102 ) ) ( not ( = ?auto_1921098 ?auto_1921103 ) ) ( not ( = ?auto_1921098 ?auto_1921104 ) ) ( not ( = ?auto_1921098 ?auto_1921106 ) ) ( not ( = ?auto_1921099 ?auto_1921100 ) ) ( not ( = ?auto_1921099 ?auto_1921101 ) ) ( not ( = ?auto_1921099 ?auto_1921102 ) ) ( not ( = ?auto_1921099 ?auto_1921103 ) ) ( not ( = ?auto_1921099 ?auto_1921104 ) ) ( not ( = ?auto_1921099 ?auto_1921106 ) ) ( not ( = ?auto_1921100 ?auto_1921101 ) ) ( not ( = ?auto_1921100 ?auto_1921102 ) ) ( not ( = ?auto_1921100 ?auto_1921103 ) ) ( not ( = ?auto_1921100 ?auto_1921104 ) ) ( not ( = ?auto_1921100 ?auto_1921106 ) ) ( not ( = ?auto_1921101 ?auto_1921102 ) ) ( not ( = ?auto_1921101 ?auto_1921103 ) ) ( not ( = ?auto_1921101 ?auto_1921104 ) ) ( not ( = ?auto_1921101 ?auto_1921106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921102 ?auto_1921103 ?auto_1921104 )
      ( MAKE-7CRATE-VERIFY ?auto_1921097 ?auto_1921098 ?auto_1921099 ?auto_1921100 ?auto_1921101 ?auto_1921102 ?auto_1921103 ?auto_1921104 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921175 - SURFACE
      ?auto_1921176 - SURFACE
      ?auto_1921177 - SURFACE
      ?auto_1921178 - SURFACE
      ?auto_1921179 - SURFACE
      ?auto_1921180 - SURFACE
      ?auto_1921181 - SURFACE
      ?auto_1921182 - SURFACE
    )
    :vars
    (
      ?auto_1921188 - HOIST
      ?auto_1921187 - PLACE
      ?auto_1921184 - PLACE
      ?auto_1921183 - HOIST
      ?auto_1921186 - SURFACE
      ?auto_1921185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921188 ?auto_1921187 ) ( IS-CRATE ?auto_1921182 ) ( not ( = ?auto_1921181 ?auto_1921182 ) ) ( not ( = ?auto_1921180 ?auto_1921181 ) ) ( not ( = ?auto_1921180 ?auto_1921182 ) ) ( not ( = ?auto_1921184 ?auto_1921187 ) ) ( HOIST-AT ?auto_1921183 ?auto_1921184 ) ( not ( = ?auto_1921188 ?auto_1921183 ) ) ( AVAILABLE ?auto_1921183 ) ( SURFACE-AT ?auto_1921182 ?auto_1921184 ) ( ON ?auto_1921182 ?auto_1921186 ) ( CLEAR ?auto_1921182 ) ( not ( = ?auto_1921181 ?auto_1921186 ) ) ( not ( = ?auto_1921182 ?auto_1921186 ) ) ( not ( = ?auto_1921180 ?auto_1921186 ) ) ( TRUCK-AT ?auto_1921185 ?auto_1921187 ) ( SURFACE-AT ?auto_1921180 ?auto_1921187 ) ( CLEAR ?auto_1921180 ) ( LIFTING ?auto_1921188 ?auto_1921181 ) ( IS-CRATE ?auto_1921181 ) ( ON ?auto_1921176 ?auto_1921175 ) ( ON ?auto_1921177 ?auto_1921176 ) ( ON ?auto_1921178 ?auto_1921177 ) ( ON ?auto_1921179 ?auto_1921178 ) ( ON ?auto_1921180 ?auto_1921179 ) ( not ( = ?auto_1921175 ?auto_1921176 ) ) ( not ( = ?auto_1921175 ?auto_1921177 ) ) ( not ( = ?auto_1921175 ?auto_1921178 ) ) ( not ( = ?auto_1921175 ?auto_1921179 ) ) ( not ( = ?auto_1921175 ?auto_1921180 ) ) ( not ( = ?auto_1921175 ?auto_1921181 ) ) ( not ( = ?auto_1921175 ?auto_1921182 ) ) ( not ( = ?auto_1921175 ?auto_1921186 ) ) ( not ( = ?auto_1921176 ?auto_1921177 ) ) ( not ( = ?auto_1921176 ?auto_1921178 ) ) ( not ( = ?auto_1921176 ?auto_1921179 ) ) ( not ( = ?auto_1921176 ?auto_1921180 ) ) ( not ( = ?auto_1921176 ?auto_1921181 ) ) ( not ( = ?auto_1921176 ?auto_1921182 ) ) ( not ( = ?auto_1921176 ?auto_1921186 ) ) ( not ( = ?auto_1921177 ?auto_1921178 ) ) ( not ( = ?auto_1921177 ?auto_1921179 ) ) ( not ( = ?auto_1921177 ?auto_1921180 ) ) ( not ( = ?auto_1921177 ?auto_1921181 ) ) ( not ( = ?auto_1921177 ?auto_1921182 ) ) ( not ( = ?auto_1921177 ?auto_1921186 ) ) ( not ( = ?auto_1921178 ?auto_1921179 ) ) ( not ( = ?auto_1921178 ?auto_1921180 ) ) ( not ( = ?auto_1921178 ?auto_1921181 ) ) ( not ( = ?auto_1921178 ?auto_1921182 ) ) ( not ( = ?auto_1921178 ?auto_1921186 ) ) ( not ( = ?auto_1921179 ?auto_1921180 ) ) ( not ( = ?auto_1921179 ?auto_1921181 ) ) ( not ( = ?auto_1921179 ?auto_1921182 ) ) ( not ( = ?auto_1921179 ?auto_1921186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921180 ?auto_1921181 ?auto_1921182 )
      ( MAKE-7CRATE-VERIFY ?auto_1921175 ?auto_1921176 ?auto_1921177 ?auto_1921178 ?auto_1921179 ?auto_1921180 ?auto_1921181 ?auto_1921182 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921253 - SURFACE
      ?auto_1921254 - SURFACE
      ?auto_1921255 - SURFACE
      ?auto_1921256 - SURFACE
      ?auto_1921257 - SURFACE
      ?auto_1921258 - SURFACE
      ?auto_1921259 - SURFACE
      ?auto_1921260 - SURFACE
    )
    :vars
    (
      ?auto_1921262 - HOIST
      ?auto_1921266 - PLACE
      ?auto_1921261 - PLACE
      ?auto_1921265 - HOIST
      ?auto_1921263 - SURFACE
      ?auto_1921264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921262 ?auto_1921266 ) ( IS-CRATE ?auto_1921260 ) ( not ( = ?auto_1921259 ?auto_1921260 ) ) ( not ( = ?auto_1921258 ?auto_1921259 ) ) ( not ( = ?auto_1921258 ?auto_1921260 ) ) ( not ( = ?auto_1921261 ?auto_1921266 ) ) ( HOIST-AT ?auto_1921265 ?auto_1921261 ) ( not ( = ?auto_1921262 ?auto_1921265 ) ) ( AVAILABLE ?auto_1921265 ) ( SURFACE-AT ?auto_1921260 ?auto_1921261 ) ( ON ?auto_1921260 ?auto_1921263 ) ( CLEAR ?auto_1921260 ) ( not ( = ?auto_1921259 ?auto_1921263 ) ) ( not ( = ?auto_1921260 ?auto_1921263 ) ) ( not ( = ?auto_1921258 ?auto_1921263 ) ) ( TRUCK-AT ?auto_1921264 ?auto_1921266 ) ( SURFACE-AT ?auto_1921258 ?auto_1921266 ) ( CLEAR ?auto_1921258 ) ( IS-CRATE ?auto_1921259 ) ( AVAILABLE ?auto_1921262 ) ( IN ?auto_1921259 ?auto_1921264 ) ( ON ?auto_1921254 ?auto_1921253 ) ( ON ?auto_1921255 ?auto_1921254 ) ( ON ?auto_1921256 ?auto_1921255 ) ( ON ?auto_1921257 ?auto_1921256 ) ( ON ?auto_1921258 ?auto_1921257 ) ( not ( = ?auto_1921253 ?auto_1921254 ) ) ( not ( = ?auto_1921253 ?auto_1921255 ) ) ( not ( = ?auto_1921253 ?auto_1921256 ) ) ( not ( = ?auto_1921253 ?auto_1921257 ) ) ( not ( = ?auto_1921253 ?auto_1921258 ) ) ( not ( = ?auto_1921253 ?auto_1921259 ) ) ( not ( = ?auto_1921253 ?auto_1921260 ) ) ( not ( = ?auto_1921253 ?auto_1921263 ) ) ( not ( = ?auto_1921254 ?auto_1921255 ) ) ( not ( = ?auto_1921254 ?auto_1921256 ) ) ( not ( = ?auto_1921254 ?auto_1921257 ) ) ( not ( = ?auto_1921254 ?auto_1921258 ) ) ( not ( = ?auto_1921254 ?auto_1921259 ) ) ( not ( = ?auto_1921254 ?auto_1921260 ) ) ( not ( = ?auto_1921254 ?auto_1921263 ) ) ( not ( = ?auto_1921255 ?auto_1921256 ) ) ( not ( = ?auto_1921255 ?auto_1921257 ) ) ( not ( = ?auto_1921255 ?auto_1921258 ) ) ( not ( = ?auto_1921255 ?auto_1921259 ) ) ( not ( = ?auto_1921255 ?auto_1921260 ) ) ( not ( = ?auto_1921255 ?auto_1921263 ) ) ( not ( = ?auto_1921256 ?auto_1921257 ) ) ( not ( = ?auto_1921256 ?auto_1921258 ) ) ( not ( = ?auto_1921256 ?auto_1921259 ) ) ( not ( = ?auto_1921256 ?auto_1921260 ) ) ( not ( = ?auto_1921256 ?auto_1921263 ) ) ( not ( = ?auto_1921257 ?auto_1921258 ) ) ( not ( = ?auto_1921257 ?auto_1921259 ) ) ( not ( = ?auto_1921257 ?auto_1921260 ) ) ( not ( = ?auto_1921257 ?auto_1921263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921258 ?auto_1921259 ?auto_1921260 )
      ( MAKE-7CRATE-VERIFY ?auto_1921253 ?auto_1921254 ?auto_1921255 ?auto_1921256 ?auto_1921257 ?auto_1921258 ?auto_1921259 ?auto_1921260 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924172 - SURFACE
      ?auto_1924173 - SURFACE
      ?auto_1924174 - SURFACE
      ?auto_1924175 - SURFACE
      ?auto_1924176 - SURFACE
      ?auto_1924177 - SURFACE
      ?auto_1924178 - SURFACE
      ?auto_1924179 - SURFACE
      ?auto_1924180 - SURFACE
    )
    :vars
    (
      ?auto_1924182 - HOIST
      ?auto_1924181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924182 ?auto_1924181 ) ( SURFACE-AT ?auto_1924179 ?auto_1924181 ) ( CLEAR ?auto_1924179 ) ( LIFTING ?auto_1924182 ?auto_1924180 ) ( IS-CRATE ?auto_1924180 ) ( not ( = ?auto_1924179 ?auto_1924180 ) ) ( ON ?auto_1924173 ?auto_1924172 ) ( ON ?auto_1924174 ?auto_1924173 ) ( ON ?auto_1924175 ?auto_1924174 ) ( ON ?auto_1924176 ?auto_1924175 ) ( ON ?auto_1924177 ?auto_1924176 ) ( ON ?auto_1924178 ?auto_1924177 ) ( ON ?auto_1924179 ?auto_1924178 ) ( not ( = ?auto_1924172 ?auto_1924173 ) ) ( not ( = ?auto_1924172 ?auto_1924174 ) ) ( not ( = ?auto_1924172 ?auto_1924175 ) ) ( not ( = ?auto_1924172 ?auto_1924176 ) ) ( not ( = ?auto_1924172 ?auto_1924177 ) ) ( not ( = ?auto_1924172 ?auto_1924178 ) ) ( not ( = ?auto_1924172 ?auto_1924179 ) ) ( not ( = ?auto_1924172 ?auto_1924180 ) ) ( not ( = ?auto_1924173 ?auto_1924174 ) ) ( not ( = ?auto_1924173 ?auto_1924175 ) ) ( not ( = ?auto_1924173 ?auto_1924176 ) ) ( not ( = ?auto_1924173 ?auto_1924177 ) ) ( not ( = ?auto_1924173 ?auto_1924178 ) ) ( not ( = ?auto_1924173 ?auto_1924179 ) ) ( not ( = ?auto_1924173 ?auto_1924180 ) ) ( not ( = ?auto_1924174 ?auto_1924175 ) ) ( not ( = ?auto_1924174 ?auto_1924176 ) ) ( not ( = ?auto_1924174 ?auto_1924177 ) ) ( not ( = ?auto_1924174 ?auto_1924178 ) ) ( not ( = ?auto_1924174 ?auto_1924179 ) ) ( not ( = ?auto_1924174 ?auto_1924180 ) ) ( not ( = ?auto_1924175 ?auto_1924176 ) ) ( not ( = ?auto_1924175 ?auto_1924177 ) ) ( not ( = ?auto_1924175 ?auto_1924178 ) ) ( not ( = ?auto_1924175 ?auto_1924179 ) ) ( not ( = ?auto_1924175 ?auto_1924180 ) ) ( not ( = ?auto_1924176 ?auto_1924177 ) ) ( not ( = ?auto_1924176 ?auto_1924178 ) ) ( not ( = ?auto_1924176 ?auto_1924179 ) ) ( not ( = ?auto_1924176 ?auto_1924180 ) ) ( not ( = ?auto_1924177 ?auto_1924178 ) ) ( not ( = ?auto_1924177 ?auto_1924179 ) ) ( not ( = ?auto_1924177 ?auto_1924180 ) ) ( not ( = ?auto_1924178 ?auto_1924179 ) ) ( not ( = ?auto_1924178 ?auto_1924180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1924179 ?auto_1924180 )
      ( MAKE-8CRATE-VERIFY ?auto_1924172 ?auto_1924173 ?auto_1924174 ?auto_1924175 ?auto_1924176 ?auto_1924177 ?auto_1924178 ?auto_1924179 ?auto_1924180 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924239 - SURFACE
      ?auto_1924240 - SURFACE
      ?auto_1924241 - SURFACE
      ?auto_1924242 - SURFACE
      ?auto_1924243 - SURFACE
      ?auto_1924244 - SURFACE
      ?auto_1924245 - SURFACE
      ?auto_1924246 - SURFACE
      ?auto_1924247 - SURFACE
    )
    :vars
    (
      ?auto_1924249 - HOIST
      ?auto_1924248 - PLACE
      ?auto_1924250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924249 ?auto_1924248 ) ( SURFACE-AT ?auto_1924246 ?auto_1924248 ) ( CLEAR ?auto_1924246 ) ( IS-CRATE ?auto_1924247 ) ( not ( = ?auto_1924246 ?auto_1924247 ) ) ( TRUCK-AT ?auto_1924250 ?auto_1924248 ) ( AVAILABLE ?auto_1924249 ) ( IN ?auto_1924247 ?auto_1924250 ) ( ON ?auto_1924246 ?auto_1924245 ) ( not ( = ?auto_1924245 ?auto_1924246 ) ) ( not ( = ?auto_1924245 ?auto_1924247 ) ) ( ON ?auto_1924240 ?auto_1924239 ) ( ON ?auto_1924241 ?auto_1924240 ) ( ON ?auto_1924242 ?auto_1924241 ) ( ON ?auto_1924243 ?auto_1924242 ) ( ON ?auto_1924244 ?auto_1924243 ) ( ON ?auto_1924245 ?auto_1924244 ) ( not ( = ?auto_1924239 ?auto_1924240 ) ) ( not ( = ?auto_1924239 ?auto_1924241 ) ) ( not ( = ?auto_1924239 ?auto_1924242 ) ) ( not ( = ?auto_1924239 ?auto_1924243 ) ) ( not ( = ?auto_1924239 ?auto_1924244 ) ) ( not ( = ?auto_1924239 ?auto_1924245 ) ) ( not ( = ?auto_1924239 ?auto_1924246 ) ) ( not ( = ?auto_1924239 ?auto_1924247 ) ) ( not ( = ?auto_1924240 ?auto_1924241 ) ) ( not ( = ?auto_1924240 ?auto_1924242 ) ) ( not ( = ?auto_1924240 ?auto_1924243 ) ) ( not ( = ?auto_1924240 ?auto_1924244 ) ) ( not ( = ?auto_1924240 ?auto_1924245 ) ) ( not ( = ?auto_1924240 ?auto_1924246 ) ) ( not ( = ?auto_1924240 ?auto_1924247 ) ) ( not ( = ?auto_1924241 ?auto_1924242 ) ) ( not ( = ?auto_1924241 ?auto_1924243 ) ) ( not ( = ?auto_1924241 ?auto_1924244 ) ) ( not ( = ?auto_1924241 ?auto_1924245 ) ) ( not ( = ?auto_1924241 ?auto_1924246 ) ) ( not ( = ?auto_1924241 ?auto_1924247 ) ) ( not ( = ?auto_1924242 ?auto_1924243 ) ) ( not ( = ?auto_1924242 ?auto_1924244 ) ) ( not ( = ?auto_1924242 ?auto_1924245 ) ) ( not ( = ?auto_1924242 ?auto_1924246 ) ) ( not ( = ?auto_1924242 ?auto_1924247 ) ) ( not ( = ?auto_1924243 ?auto_1924244 ) ) ( not ( = ?auto_1924243 ?auto_1924245 ) ) ( not ( = ?auto_1924243 ?auto_1924246 ) ) ( not ( = ?auto_1924243 ?auto_1924247 ) ) ( not ( = ?auto_1924244 ?auto_1924245 ) ) ( not ( = ?auto_1924244 ?auto_1924246 ) ) ( not ( = ?auto_1924244 ?auto_1924247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924245 ?auto_1924246 ?auto_1924247 )
      ( MAKE-8CRATE-VERIFY ?auto_1924239 ?auto_1924240 ?auto_1924241 ?auto_1924242 ?auto_1924243 ?auto_1924244 ?auto_1924245 ?auto_1924246 ?auto_1924247 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924315 - SURFACE
      ?auto_1924316 - SURFACE
      ?auto_1924317 - SURFACE
      ?auto_1924318 - SURFACE
      ?auto_1924319 - SURFACE
      ?auto_1924320 - SURFACE
      ?auto_1924321 - SURFACE
      ?auto_1924322 - SURFACE
      ?auto_1924323 - SURFACE
    )
    :vars
    (
      ?auto_1924325 - HOIST
      ?auto_1924327 - PLACE
      ?auto_1924326 - TRUCK
      ?auto_1924324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924325 ?auto_1924327 ) ( SURFACE-AT ?auto_1924322 ?auto_1924327 ) ( CLEAR ?auto_1924322 ) ( IS-CRATE ?auto_1924323 ) ( not ( = ?auto_1924322 ?auto_1924323 ) ) ( AVAILABLE ?auto_1924325 ) ( IN ?auto_1924323 ?auto_1924326 ) ( ON ?auto_1924322 ?auto_1924321 ) ( not ( = ?auto_1924321 ?auto_1924322 ) ) ( not ( = ?auto_1924321 ?auto_1924323 ) ) ( TRUCK-AT ?auto_1924326 ?auto_1924324 ) ( not ( = ?auto_1924324 ?auto_1924327 ) ) ( ON ?auto_1924316 ?auto_1924315 ) ( ON ?auto_1924317 ?auto_1924316 ) ( ON ?auto_1924318 ?auto_1924317 ) ( ON ?auto_1924319 ?auto_1924318 ) ( ON ?auto_1924320 ?auto_1924319 ) ( ON ?auto_1924321 ?auto_1924320 ) ( not ( = ?auto_1924315 ?auto_1924316 ) ) ( not ( = ?auto_1924315 ?auto_1924317 ) ) ( not ( = ?auto_1924315 ?auto_1924318 ) ) ( not ( = ?auto_1924315 ?auto_1924319 ) ) ( not ( = ?auto_1924315 ?auto_1924320 ) ) ( not ( = ?auto_1924315 ?auto_1924321 ) ) ( not ( = ?auto_1924315 ?auto_1924322 ) ) ( not ( = ?auto_1924315 ?auto_1924323 ) ) ( not ( = ?auto_1924316 ?auto_1924317 ) ) ( not ( = ?auto_1924316 ?auto_1924318 ) ) ( not ( = ?auto_1924316 ?auto_1924319 ) ) ( not ( = ?auto_1924316 ?auto_1924320 ) ) ( not ( = ?auto_1924316 ?auto_1924321 ) ) ( not ( = ?auto_1924316 ?auto_1924322 ) ) ( not ( = ?auto_1924316 ?auto_1924323 ) ) ( not ( = ?auto_1924317 ?auto_1924318 ) ) ( not ( = ?auto_1924317 ?auto_1924319 ) ) ( not ( = ?auto_1924317 ?auto_1924320 ) ) ( not ( = ?auto_1924317 ?auto_1924321 ) ) ( not ( = ?auto_1924317 ?auto_1924322 ) ) ( not ( = ?auto_1924317 ?auto_1924323 ) ) ( not ( = ?auto_1924318 ?auto_1924319 ) ) ( not ( = ?auto_1924318 ?auto_1924320 ) ) ( not ( = ?auto_1924318 ?auto_1924321 ) ) ( not ( = ?auto_1924318 ?auto_1924322 ) ) ( not ( = ?auto_1924318 ?auto_1924323 ) ) ( not ( = ?auto_1924319 ?auto_1924320 ) ) ( not ( = ?auto_1924319 ?auto_1924321 ) ) ( not ( = ?auto_1924319 ?auto_1924322 ) ) ( not ( = ?auto_1924319 ?auto_1924323 ) ) ( not ( = ?auto_1924320 ?auto_1924321 ) ) ( not ( = ?auto_1924320 ?auto_1924322 ) ) ( not ( = ?auto_1924320 ?auto_1924323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924321 ?auto_1924322 ?auto_1924323 )
      ( MAKE-8CRATE-VERIFY ?auto_1924315 ?auto_1924316 ?auto_1924317 ?auto_1924318 ?auto_1924319 ?auto_1924320 ?auto_1924321 ?auto_1924322 ?auto_1924323 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924399 - SURFACE
      ?auto_1924400 - SURFACE
      ?auto_1924401 - SURFACE
      ?auto_1924402 - SURFACE
      ?auto_1924403 - SURFACE
      ?auto_1924404 - SURFACE
      ?auto_1924405 - SURFACE
      ?auto_1924406 - SURFACE
      ?auto_1924407 - SURFACE
    )
    :vars
    (
      ?auto_1924412 - HOIST
      ?auto_1924408 - PLACE
      ?auto_1924411 - TRUCK
      ?auto_1924410 - PLACE
      ?auto_1924409 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924412 ?auto_1924408 ) ( SURFACE-AT ?auto_1924406 ?auto_1924408 ) ( CLEAR ?auto_1924406 ) ( IS-CRATE ?auto_1924407 ) ( not ( = ?auto_1924406 ?auto_1924407 ) ) ( AVAILABLE ?auto_1924412 ) ( ON ?auto_1924406 ?auto_1924405 ) ( not ( = ?auto_1924405 ?auto_1924406 ) ) ( not ( = ?auto_1924405 ?auto_1924407 ) ) ( TRUCK-AT ?auto_1924411 ?auto_1924410 ) ( not ( = ?auto_1924410 ?auto_1924408 ) ) ( HOIST-AT ?auto_1924409 ?auto_1924410 ) ( LIFTING ?auto_1924409 ?auto_1924407 ) ( not ( = ?auto_1924412 ?auto_1924409 ) ) ( ON ?auto_1924400 ?auto_1924399 ) ( ON ?auto_1924401 ?auto_1924400 ) ( ON ?auto_1924402 ?auto_1924401 ) ( ON ?auto_1924403 ?auto_1924402 ) ( ON ?auto_1924404 ?auto_1924403 ) ( ON ?auto_1924405 ?auto_1924404 ) ( not ( = ?auto_1924399 ?auto_1924400 ) ) ( not ( = ?auto_1924399 ?auto_1924401 ) ) ( not ( = ?auto_1924399 ?auto_1924402 ) ) ( not ( = ?auto_1924399 ?auto_1924403 ) ) ( not ( = ?auto_1924399 ?auto_1924404 ) ) ( not ( = ?auto_1924399 ?auto_1924405 ) ) ( not ( = ?auto_1924399 ?auto_1924406 ) ) ( not ( = ?auto_1924399 ?auto_1924407 ) ) ( not ( = ?auto_1924400 ?auto_1924401 ) ) ( not ( = ?auto_1924400 ?auto_1924402 ) ) ( not ( = ?auto_1924400 ?auto_1924403 ) ) ( not ( = ?auto_1924400 ?auto_1924404 ) ) ( not ( = ?auto_1924400 ?auto_1924405 ) ) ( not ( = ?auto_1924400 ?auto_1924406 ) ) ( not ( = ?auto_1924400 ?auto_1924407 ) ) ( not ( = ?auto_1924401 ?auto_1924402 ) ) ( not ( = ?auto_1924401 ?auto_1924403 ) ) ( not ( = ?auto_1924401 ?auto_1924404 ) ) ( not ( = ?auto_1924401 ?auto_1924405 ) ) ( not ( = ?auto_1924401 ?auto_1924406 ) ) ( not ( = ?auto_1924401 ?auto_1924407 ) ) ( not ( = ?auto_1924402 ?auto_1924403 ) ) ( not ( = ?auto_1924402 ?auto_1924404 ) ) ( not ( = ?auto_1924402 ?auto_1924405 ) ) ( not ( = ?auto_1924402 ?auto_1924406 ) ) ( not ( = ?auto_1924402 ?auto_1924407 ) ) ( not ( = ?auto_1924403 ?auto_1924404 ) ) ( not ( = ?auto_1924403 ?auto_1924405 ) ) ( not ( = ?auto_1924403 ?auto_1924406 ) ) ( not ( = ?auto_1924403 ?auto_1924407 ) ) ( not ( = ?auto_1924404 ?auto_1924405 ) ) ( not ( = ?auto_1924404 ?auto_1924406 ) ) ( not ( = ?auto_1924404 ?auto_1924407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924405 ?auto_1924406 ?auto_1924407 )
      ( MAKE-8CRATE-VERIFY ?auto_1924399 ?auto_1924400 ?auto_1924401 ?auto_1924402 ?auto_1924403 ?auto_1924404 ?auto_1924405 ?auto_1924406 ?auto_1924407 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924491 - SURFACE
      ?auto_1924492 - SURFACE
      ?auto_1924493 - SURFACE
      ?auto_1924494 - SURFACE
      ?auto_1924495 - SURFACE
      ?auto_1924496 - SURFACE
      ?auto_1924497 - SURFACE
      ?auto_1924498 - SURFACE
      ?auto_1924499 - SURFACE
    )
    :vars
    (
      ?auto_1924505 - HOIST
      ?auto_1924503 - PLACE
      ?auto_1924501 - TRUCK
      ?auto_1924500 - PLACE
      ?auto_1924502 - HOIST
      ?auto_1924504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924505 ?auto_1924503 ) ( SURFACE-AT ?auto_1924498 ?auto_1924503 ) ( CLEAR ?auto_1924498 ) ( IS-CRATE ?auto_1924499 ) ( not ( = ?auto_1924498 ?auto_1924499 ) ) ( AVAILABLE ?auto_1924505 ) ( ON ?auto_1924498 ?auto_1924497 ) ( not ( = ?auto_1924497 ?auto_1924498 ) ) ( not ( = ?auto_1924497 ?auto_1924499 ) ) ( TRUCK-AT ?auto_1924501 ?auto_1924500 ) ( not ( = ?auto_1924500 ?auto_1924503 ) ) ( HOIST-AT ?auto_1924502 ?auto_1924500 ) ( not ( = ?auto_1924505 ?auto_1924502 ) ) ( AVAILABLE ?auto_1924502 ) ( SURFACE-AT ?auto_1924499 ?auto_1924500 ) ( ON ?auto_1924499 ?auto_1924504 ) ( CLEAR ?auto_1924499 ) ( not ( = ?auto_1924498 ?auto_1924504 ) ) ( not ( = ?auto_1924499 ?auto_1924504 ) ) ( not ( = ?auto_1924497 ?auto_1924504 ) ) ( ON ?auto_1924492 ?auto_1924491 ) ( ON ?auto_1924493 ?auto_1924492 ) ( ON ?auto_1924494 ?auto_1924493 ) ( ON ?auto_1924495 ?auto_1924494 ) ( ON ?auto_1924496 ?auto_1924495 ) ( ON ?auto_1924497 ?auto_1924496 ) ( not ( = ?auto_1924491 ?auto_1924492 ) ) ( not ( = ?auto_1924491 ?auto_1924493 ) ) ( not ( = ?auto_1924491 ?auto_1924494 ) ) ( not ( = ?auto_1924491 ?auto_1924495 ) ) ( not ( = ?auto_1924491 ?auto_1924496 ) ) ( not ( = ?auto_1924491 ?auto_1924497 ) ) ( not ( = ?auto_1924491 ?auto_1924498 ) ) ( not ( = ?auto_1924491 ?auto_1924499 ) ) ( not ( = ?auto_1924491 ?auto_1924504 ) ) ( not ( = ?auto_1924492 ?auto_1924493 ) ) ( not ( = ?auto_1924492 ?auto_1924494 ) ) ( not ( = ?auto_1924492 ?auto_1924495 ) ) ( not ( = ?auto_1924492 ?auto_1924496 ) ) ( not ( = ?auto_1924492 ?auto_1924497 ) ) ( not ( = ?auto_1924492 ?auto_1924498 ) ) ( not ( = ?auto_1924492 ?auto_1924499 ) ) ( not ( = ?auto_1924492 ?auto_1924504 ) ) ( not ( = ?auto_1924493 ?auto_1924494 ) ) ( not ( = ?auto_1924493 ?auto_1924495 ) ) ( not ( = ?auto_1924493 ?auto_1924496 ) ) ( not ( = ?auto_1924493 ?auto_1924497 ) ) ( not ( = ?auto_1924493 ?auto_1924498 ) ) ( not ( = ?auto_1924493 ?auto_1924499 ) ) ( not ( = ?auto_1924493 ?auto_1924504 ) ) ( not ( = ?auto_1924494 ?auto_1924495 ) ) ( not ( = ?auto_1924494 ?auto_1924496 ) ) ( not ( = ?auto_1924494 ?auto_1924497 ) ) ( not ( = ?auto_1924494 ?auto_1924498 ) ) ( not ( = ?auto_1924494 ?auto_1924499 ) ) ( not ( = ?auto_1924494 ?auto_1924504 ) ) ( not ( = ?auto_1924495 ?auto_1924496 ) ) ( not ( = ?auto_1924495 ?auto_1924497 ) ) ( not ( = ?auto_1924495 ?auto_1924498 ) ) ( not ( = ?auto_1924495 ?auto_1924499 ) ) ( not ( = ?auto_1924495 ?auto_1924504 ) ) ( not ( = ?auto_1924496 ?auto_1924497 ) ) ( not ( = ?auto_1924496 ?auto_1924498 ) ) ( not ( = ?auto_1924496 ?auto_1924499 ) ) ( not ( = ?auto_1924496 ?auto_1924504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924497 ?auto_1924498 ?auto_1924499 )
      ( MAKE-8CRATE-VERIFY ?auto_1924491 ?auto_1924492 ?auto_1924493 ?auto_1924494 ?auto_1924495 ?auto_1924496 ?auto_1924497 ?auto_1924498 ?auto_1924499 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924584 - SURFACE
      ?auto_1924585 - SURFACE
      ?auto_1924586 - SURFACE
      ?auto_1924587 - SURFACE
      ?auto_1924588 - SURFACE
      ?auto_1924589 - SURFACE
      ?auto_1924590 - SURFACE
      ?auto_1924591 - SURFACE
      ?auto_1924592 - SURFACE
    )
    :vars
    (
      ?auto_1924597 - HOIST
      ?auto_1924596 - PLACE
      ?auto_1924598 - PLACE
      ?auto_1924595 - HOIST
      ?auto_1924593 - SURFACE
      ?auto_1924594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924597 ?auto_1924596 ) ( SURFACE-AT ?auto_1924591 ?auto_1924596 ) ( CLEAR ?auto_1924591 ) ( IS-CRATE ?auto_1924592 ) ( not ( = ?auto_1924591 ?auto_1924592 ) ) ( AVAILABLE ?auto_1924597 ) ( ON ?auto_1924591 ?auto_1924590 ) ( not ( = ?auto_1924590 ?auto_1924591 ) ) ( not ( = ?auto_1924590 ?auto_1924592 ) ) ( not ( = ?auto_1924598 ?auto_1924596 ) ) ( HOIST-AT ?auto_1924595 ?auto_1924598 ) ( not ( = ?auto_1924597 ?auto_1924595 ) ) ( AVAILABLE ?auto_1924595 ) ( SURFACE-AT ?auto_1924592 ?auto_1924598 ) ( ON ?auto_1924592 ?auto_1924593 ) ( CLEAR ?auto_1924592 ) ( not ( = ?auto_1924591 ?auto_1924593 ) ) ( not ( = ?auto_1924592 ?auto_1924593 ) ) ( not ( = ?auto_1924590 ?auto_1924593 ) ) ( TRUCK-AT ?auto_1924594 ?auto_1924596 ) ( ON ?auto_1924585 ?auto_1924584 ) ( ON ?auto_1924586 ?auto_1924585 ) ( ON ?auto_1924587 ?auto_1924586 ) ( ON ?auto_1924588 ?auto_1924587 ) ( ON ?auto_1924589 ?auto_1924588 ) ( ON ?auto_1924590 ?auto_1924589 ) ( not ( = ?auto_1924584 ?auto_1924585 ) ) ( not ( = ?auto_1924584 ?auto_1924586 ) ) ( not ( = ?auto_1924584 ?auto_1924587 ) ) ( not ( = ?auto_1924584 ?auto_1924588 ) ) ( not ( = ?auto_1924584 ?auto_1924589 ) ) ( not ( = ?auto_1924584 ?auto_1924590 ) ) ( not ( = ?auto_1924584 ?auto_1924591 ) ) ( not ( = ?auto_1924584 ?auto_1924592 ) ) ( not ( = ?auto_1924584 ?auto_1924593 ) ) ( not ( = ?auto_1924585 ?auto_1924586 ) ) ( not ( = ?auto_1924585 ?auto_1924587 ) ) ( not ( = ?auto_1924585 ?auto_1924588 ) ) ( not ( = ?auto_1924585 ?auto_1924589 ) ) ( not ( = ?auto_1924585 ?auto_1924590 ) ) ( not ( = ?auto_1924585 ?auto_1924591 ) ) ( not ( = ?auto_1924585 ?auto_1924592 ) ) ( not ( = ?auto_1924585 ?auto_1924593 ) ) ( not ( = ?auto_1924586 ?auto_1924587 ) ) ( not ( = ?auto_1924586 ?auto_1924588 ) ) ( not ( = ?auto_1924586 ?auto_1924589 ) ) ( not ( = ?auto_1924586 ?auto_1924590 ) ) ( not ( = ?auto_1924586 ?auto_1924591 ) ) ( not ( = ?auto_1924586 ?auto_1924592 ) ) ( not ( = ?auto_1924586 ?auto_1924593 ) ) ( not ( = ?auto_1924587 ?auto_1924588 ) ) ( not ( = ?auto_1924587 ?auto_1924589 ) ) ( not ( = ?auto_1924587 ?auto_1924590 ) ) ( not ( = ?auto_1924587 ?auto_1924591 ) ) ( not ( = ?auto_1924587 ?auto_1924592 ) ) ( not ( = ?auto_1924587 ?auto_1924593 ) ) ( not ( = ?auto_1924588 ?auto_1924589 ) ) ( not ( = ?auto_1924588 ?auto_1924590 ) ) ( not ( = ?auto_1924588 ?auto_1924591 ) ) ( not ( = ?auto_1924588 ?auto_1924592 ) ) ( not ( = ?auto_1924588 ?auto_1924593 ) ) ( not ( = ?auto_1924589 ?auto_1924590 ) ) ( not ( = ?auto_1924589 ?auto_1924591 ) ) ( not ( = ?auto_1924589 ?auto_1924592 ) ) ( not ( = ?auto_1924589 ?auto_1924593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924590 ?auto_1924591 ?auto_1924592 )
      ( MAKE-8CRATE-VERIFY ?auto_1924584 ?auto_1924585 ?auto_1924586 ?auto_1924587 ?auto_1924588 ?auto_1924589 ?auto_1924590 ?auto_1924591 ?auto_1924592 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924677 - SURFACE
      ?auto_1924678 - SURFACE
      ?auto_1924679 - SURFACE
      ?auto_1924680 - SURFACE
      ?auto_1924681 - SURFACE
      ?auto_1924682 - SURFACE
      ?auto_1924683 - SURFACE
      ?auto_1924684 - SURFACE
      ?auto_1924685 - SURFACE
    )
    :vars
    (
      ?auto_1924691 - HOIST
      ?auto_1924687 - PLACE
      ?auto_1924686 - PLACE
      ?auto_1924689 - HOIST
      ?auto_1924690 - SURFACE
      ?auto_1924688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924691 ?auto_1924687 ) ( IS-CRATE ?auto_1924685 ) ( not ( = ?auto_1924684 ?auto_1924685 ) ) ( not ( = ?auto_1924683 ?auto_1924684 ) ) ( not ( = ?auto_1924683 ?auto_1924685 ) ) ( not ( = ?auto_1924686 ?auto_1924687 ) ) ( HOIST-AT ?auto_1924689 ?auto_1924686 ) ( not ( = ?auto_1924691 ?auto_1924689 ) ) ( AVAILABLE ?auto_1924689 ) ( SURFACE-AT ?auto_1924685 ?auto_1924686 ) ( ON ?auto_1924685 ?auto_1924690 ) ( CLEAR ?auto_1924685 ) ( not ( = ?auto_1924684 ?auto_1924690 ) ) ( not ( = ?auto_1924685 ?auto_1924690 ) ) ( not ( = ?auto_1924683 ?auto_1924690 ) ) ( TRUCK-AT ?auto_1924688 ?auto_1924687 ) ( SURFACE-AT ?auto_1924683 ?auto_1924687 ) ( CLEAR ?auto_1924683 ) ( LIFTING ?auto_1924691 ?auto_1924684 ) ( IS-CRATE ?auto_1924684 ) ( ON ?auto_1924678 ?auto_1924677 ) ( ON ?auto_1924679 ?auto_1924678 ) ( ON ?auto_1924680 ?auto_1924679 ) ( ON ?auto_1924681 ?auto_1924680 ) ( ON ?auto_1924682 ?auto_1924681 ) ( ON ?auto_1924683 ?auto_1924682 ) ( not ( = ?auto_1924677 ?auto_1924678 ) ) ( not ( = ?auto_1924677 ?auto_1924679 ) ) ( not ( = ?auto_1924677 ?auto_1924680 ) ) ( not ( = ?auto_1924677 ?auto_1924681 ) ) ( not ( = ?auto_1924677 ?auto_1924682 ) ) ( not ( = ?auto_1924677 ?auto_1924683 ) ) ( not ( = ?auto_1924677 ?auto_1924684 ) ) ( not ( = ?auto_1924677 ?auto_1924685 ) ) ( not ( = ?auto_1924677 ?auto_1924690 ) ) ( not ( = ?auto_1924678 ?auto_1924679 ) ) ( not ( = ?auto_1924678 ?auto_1924680 ) ) ( not ( = ?auto_1924678 ?auto_1924681 ) ) ( not ( = ?auto_1924678 ?auto_1924682 ) ) ( not ( = ?auto_1924678 ?auto_1924683 ) ) ( not ( = ?auto_1924678 ?auto_1924684 ) ) ( not ( = ?auto_1924678 ?auto_1924685 ) ) ( not ( = ?auto_1924678 ?auto_1924690 ) ) ( not ( = ?auto_1924679 ?auto_1924680 ) ) ( not ( = ?auto_1924679 ?auto_1924681 ) ) ( not ( = ?auto_1924679 ?auto_1924682 ) ) ( not ( = ?auto_1924679 ?auto_1924683 ) ) ( not ( = ?auto_1924679 ?auto_1924684 ) ) ( not ( = ?auto_1924679 ?auto_1924685 ) ) ( not ( = ?auto_1924679 ?auto_1924690 ) ) ( not ( = ?auto_1924680 ?auto_1924681 ) ) ( not ( = ?auto_1924680 ?auto_1924682 ) ) ( not ( = ?auto_1924680 ?auto_1924683 ) ) ( not ( = ?auto_1924680 ?auto_1924684 ) ) ( not ( = ?auto_1924680 ?auto_1924685 ) ) ( not ( = ?auto_1924680 ?auto_1924690 ) ) ( not ( = ?auto_1924681 ?auto_1924682 ) ) ( not ( = ?auto_1924681 ?auto_1924683 ) ) ( not ( = ?auto_1924681 ?auto_1924684 ) ) ( not ( = ?auto_1924681 ?auto_1924685 ) ) ( not ( = ?auto_1924681 ?auto_1924690 ) ) ( not ( = ?auto_1924682 ?auto_1924683 ) ) ( not ( = ?auto_1924682 ?auto_1924684 ) ) ( not ( = ?auto_1924682 ?auto_1924685 ) ) ( not ( = ?auto_1924682 ?auto_1924690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924683 ?auto_1924684 ?auto_1924685 )
      ( MAKE-8CRATE-VERIFY ?auto_1924677 ?auto_1924678 ?auto_1924679 ?auto_1924680 ?auto_1924681 ?auto_1924682 ?auto_1924683 ?auto_1924684 ?auto_1924685 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924770 - SURFACE
      ?auto_1924771 - SURFACE
      ?auto_1924772 - SURFACE
      ?auto_1924773 - SURFACE
      ?auto_1924774 - SURFACE
      ?auto_1924775 - SURFACE
      ?auto_1924776 - SURFACE
      ?auto_1924777 - SURFACE
      ?auto_1924778 - SURFACE
    )
    :vars
    (
      ?auto_1924779 - HOIST
      ?auto_1924780 - PLACE
      ?auto_1924784 - PLACE
      ?auto_1924782 - HOIST
      ?auto_1924783 - SURFACE
      ?auto_1924781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924779 ?auto_1924780 ) ( IS-CRATE ?auto_1924778 ) ( not ( = ?auto_1924777 ?auto_1924778 ) ) ( not ( = ?auto_1924776 ?auto_1924777 ) ) ( not ( = ?auto_1924776 ?auto_1924778 ) ) ( not ( = ?auto_1924784 ?auto_1924780 ) ) ( HOIST-AT ?auto_1924782 ?auto_1924784 ) ( not ( = ?auto_1924779 ?auto_1924782 ) ) ( AVAILABLE ?auto_1924782 ) ( SURFACE-AT ?auto_1924778 ?auto_1924784 ) ( ON ?auto_1924778 ?auto_1924783 ) ( CLEAR ?auto_1924778 ) ( not ( = ?auto_1924777 ?auto_1924783 ) ) ( not ( = ?auto_1924778 ?auto_1924783 ) ) ( not ( = ?auto_1924776 ?auto_1924783 ) ) ( TRUCK-AT ?auto_1924781 ?auto_1924780 ) ( SURFACE-AT ?auto_1924776 ?auto_1924780 ) ( CLEAR ?auto_1924776 ) ( IS-CRATE ?auto_1924777 ) ( AVAILABLE ?auto_1924779 ) ( IN ?auto_1924777 ?auto_1924781 ) ( ON ?auto_1924771 ?auto_1924770 ) ( ON ?auto_1924772 ?auto_1924771 ) ( ON ?auto_1924773 ?auto_1924772 ) ( ON ?auto_1924774 ?auto_1924773 ) ( ON ?auto_1924775 ?auto_1924774 ) ( ON ?auto_1924776 ?auto_1924775 ) ( not ( = ?auto_1924770 ?auto_1924771 ) ) ( not ( = ?auto_1924770 ?auto_1924772 ) ) ( not ( = ?auto_1924770 ?auto_1924773 ) ) ( not ( = ?auto_1924770 ?auto_1924774 ) ) ( not ( = ?auto_1924770 ?auto_1924775 ) ) ( not ( = ?auto_1924770 ?auto_1924776 ) ) ( not ( = ?auto_1924770 ?auto_1924777 ) ) ( not ( = ?auto_1924770 ?auto_1924778 ) ) ( not ( = ?auto_1924770 ?auto_1924783 ) ) ( not ( = ?auto_1924771 ?auto_1924772 ) ) ( not ( = ?auto_1924771 ?auto_1924773 ) ) ( not ( = ?auto_1924771 ?auto_1924774 ) ) ( not ( = ?auto_1924771 ?auto_1924775 ) ) ( not ( = ?auto_1924771 ?auto_1924776 ) ) ( not ( = ?auto_1924771 ?auto_1924777 ) ) ( not ( = ?auto_1924771 ?auto_1924778 ) ) ( not ( = ?auto_1924771 ?auto_1924783 ) ) ( not ( = ?auto_1924772 ?auto_1924773 ) ) ( not ( = ?auto_1924772 ?auto_1924774 ) ) ( not ( = ?auto_1924772 ?auto_1924775 ) ) ( not ( = ?auto_1924772 ?auto_1924776 ) ) ( not ( = ?auto_1924772 ?auto_1924777 ) ) ( not ( = ?auto_1924772 ?auto_1924778 ) ) ( not ( = ?auto_1924772 ?auto_1924783 ) ) ( not ( = ?auto_1924773 ?auto_1924774 ) ) ( not ( = ?auto_1924773 ?auto_1924775 ) ) ( not ( = ?auto_1924773 ?auto_1924776 ) ) ( not ( = ?auto_1924773 ?auto_1924777 ) ) ( not ( = ?auto_1924773 ?auto_1924778 ) ) ( not ( = ?auto_1924773 ?auto_1924783 ) ) ( not ( = ?auto_1924774 ?auto_1924775 ) ) ( not ( = ?auto_1924774 ?auto_1924776 ) ) ( not ( = ?auto_1924774 ?auto_1924777 ) ) ( not ( = ?auto_1924774 ?auto_1924778 ) ) ( not ( = ?auto_1924774 ?auto_1924783 ) ) ( not ( = ?auto_1924775 ?auto_1924776 ) ) ( not ( = ?auto_1924775 ?auto_1924777 ) ) ( not ( = ?auto_1924775 ?auto_1924778 ) ) ( not ( = ?auto_1924775 ?auto_1924783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924776 ?auto_1924777 ?auto_1924778 )
      ( MAKE-8CRATE-VERIFY ?auto_1924770 ?auto_1924771 ?auto_1924772 ?auto_1924773 ?auto_1924774 ?auto_1924775 ?auto_1924776 ?auto_1924777 ?auto_1924778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1927865 - SURFACE
      ?auto_1927866 - SURFACE
    )
    :vars
    (
      ?auto_1927868 - HOIST
      ?auto_1927872 - PLACE
      ?auto_1927870 - SURFACE
      ?auto_1927867 - TRUCK
      ?auto_1927869 - PLACE
      ?auto_1927871 - HOIST
      ?auto_1927873 - SURFACE
      ?auto_1927874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1927868 ?auto_1927872 ) ( SURFACE-AT ?auto_1927865 ?auto_1927872 ) ( CLEAR ?auto_1927865 ) ( IS-CRATE ?auto_1927866 ) ( not ( = ?auto_1927865 ?auto_1927866 ) ) ( AVAILABLE ?auto_1927868 ) ( ON ?auto_1927865 ?auto_1927870 ) ( not ( = ?auto_1927870 ?auto_1927865 ) ) ( not ( = ?auto_1927870 ?auto_1927866 ) ) ( TRUCK-AT ?auto_1927867 ?auto_1927869 ) ( not ( = ?auto_1927869 ?auto_1927872 ) ) ( HOIST-AT ?auto_1927871 ?auto_1927869 ) ( not ( = ?auto_1927868 ?auto_1927871 ) ) ( SURFACE-AT ?auto_1927866 ?auto_1927869 ) ( ON ?auto_1927866 ?auto_1927873 ) ( CLEAR ?auto_1927866 ) ( not ( = ?auto_1927865 ?auto_1927873 ) ) ( not ( = ?auto_1927866 ?auto_1927873 ) ) ( not ( = ?auto_1927870 ?auto_1927873 ) ) ( LIFTING ?auto_1927871 ?auto_1927874 ) ( IS-CRATE ?auto_1927874 ) ( not ( = ?auto_1927865 ?auto_1927874 ) ) ( not ( = ?auto_1927866 ?auto_1927874 ) ) ( not ( = ?auto_1927870 ?auto_1927874 ) ) ( not ( = ?auto_1927873 ?auto_1927874 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1927871 ?auto_1927874 ?auto_1927867 ?auto_1927869 )
      ( MAKE-1CRATE ?auto_1927865 ?auto_1927866 )
      ( MAKE-1CRATE-VERIFY ?auto_1927865 ?auto_1927866 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1928861 - SURFACE
      ?auto_1928862 - SURFACE
      ?auto_1928863 - SURFACE
      ?auto_1928864 - SURFACE
      ?auto_1928865 - SURFACE
      ?auto_1928866 - SURFACE
      ?auto_1928867 - SURFACE
      ?auto_1928868 - SURFACE
      ?auto_1928869 - SURFACE
      ?auto_1928870 - SURFACE
    )
    :vars
    (
      ?auto_1928871 - HOIST
      ?auto_1928872 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1928871 ?auto_1928872 ) ( SURFACE-AT ?auto_1928869 ?auto_1928872 ) ( CLEAR ?auto_1928869 ) ( LIFTING ?auto_1928871 ?auto_1928870 ) ( IS-CRATE ?auto_1928870 ) ( not ( = ?auto_1928869 ?auto_1928870 ) ) ( ON ?auto_1928862 ?auto_1928861 ) ( ON ?auto_1928863 ?auto_1928862 ) ( ON ?auto_1928864 ?auto_1928863 ) ( ON ?auto_1928865 ?auto_1928864 ) ( ON ?auto_1928866 ?auto_1928865 ) ( ON ?auto_1928867 ?auto_1928866 ) ( ON ?auto_1928868 ?auto_1928867 ) ( ON ?auto_1928869 ?auto_1928868 ) ( not ( = ?auto_1928861 ?auto_1928862 ) ) ( not ( = ?auto_1928861 ?auto_1928863 ) ) ( not ( = ?auto_1928861 ?auto_1928864 ) ) ( not ( = ?auto_1928861 ?auto_1928865 ) ) ( not ( = ?auto_1928861 ?auto_1928866 ) ) ( not ( = ?auto_1928861 ?auto_1928867 ) ) ( not ( = ?auto_1928861 ?auto_1928868 ) ) ( not ( = ?auto_1928861 ?auto_1928869 ) ) ( not ( = ?auto_1928861 ?auto_1928870 ) ) ( not ( = ?auto_1928862 ?auto_1928863 ) ) ( not ( = ?auto_1928862 ?auto_1928864 ) ) ( not ( = ?auto_1928862 ?auto_1928865 ) ) ( not ( = ?auto_1928862 ?auto_1928866 ) ) ( not ( = ?auto_1928862 ?auto_1928867 ) ) ( not ( = ?auto_1928862 ?auto_1928868 ) ) ( not ( = ?auto_1928862 ?auto_1928869 ) ) ( not ( = ?auto_1928862 ?auto_1928870 ) ) ( not ( = ?auto_1928863 ?auto_1928864 ) ) ( not ( = ?auto_1928863 ?auto_1928865 ) ) ( not ( = ?auto_1928863 ?auto_1928866 ) ) ( not ( = ?auto_1928863 ?auto_1928867 ) ) ( not ( = ?auto_1928863 ?auto_1928868 ) ) ( not ( = ?auto_1928863 ?auto_1928869 ) ) ( not ( = ?auto_1928863 ?auto_1928870 ) ) ( not ( = ?auto_1928864 ?auto_1928865 ) ) ( not ( = ?auto_1928864 ?auto_1928866 ) ) ( not ( = ?auto_1928864 ?auto_1928867 ) ) ( not ( = ?auto_1928864 ?auto_1928868 ) ) ( not ( = ?auto_1928864 ?auto_1928869 ) ) ( not ( = ?auto_1928864 ?auto_1928870 ) ) ( not ( = ?auto_1928865 ?auto_1928866 ) ) ( not ( = ?auto_1928865 ?auto_1928867 ) ) ( not ( = ?auto_1928865 ?auto_1928868 ) ) ( not ( = ?auto_1928865 ?auto_1928869 ) ) ( not ( = ?auto_1928865 ?auto_1928870 ) ) ( not ( = ?auto_1928866 ?auto_1928867 ) ) ( not ( = ?auto_1928866 ?auto_1928868 ) ) ( not ( = ?auto_1928866 ?auto_1928869 ) ) ( not ( = ?auto_1928866 ?auto_1928870 ) ) ( not ( = ?auto_1928867 ?auto_1928868 ) ) ( not ( = ?auto_1928867 ?auto_1928869 ) ) ( not ( = ?auto_1928867 ?auto_1928870 ) ) ( not ( = ?auto_1928868 ?auto_1928869 ) ) ( not ( = ?auto_1928868 ?auto_1928870 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1928869 ?auto_1928870 )
      ( MAKE-9CRATE-VERIFY ?auto_1928861 ?auto_1928862 ?auto_1928863 ?auto_1928864 ?auto_1928865 ?auto_1928866 ?auto_1928867 ?auto_1928868 ?auto_1928869 ?auto_1928870 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1928941 - SURFACE
      ?auto_1928942 - SURFACE
      ?auto_1928943 - SURFACE
      ?auto_1928944 - SURFACE
      ?auto_1928945 - SURFACE
      ?auto_1928946 - SURFACE
      ?auto_1928947 - SURFACE
      ?auto_1928948 - SURFACE
      ?auto_1928949 - SURFACE
      ?auto_1928950 - SURFACE
    )
    :vars
    (
      ?auto_1928953 - HOIST
      ?auto_1928951 - PLACE
      ?auto_1928952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1928953 ?auto_1928951 ) ( SURFACE-AT ?auto_1928949 ?auto_1928951 ) ( CLEAR ?auto_1928949 ) ( IS-CRATE ?auto_1928950 ) ( not ( = ?auto_1928949 ?auto_1928950 ) ) ( TRUCK-AT ?auto_1928952 ?auto_1928951 ) ( AVAILABLE ?auto_1928953 ) ( IN ?auto_1928950 ?auto_1928952 ) ( ON ?auto_1928949 ?auto_1928948 ) ( not ( = ?auto_1928948 ?auto_1928949 ) ) ( not ( = ?auto_1928948 ?auto_1928950 ) ) ( ON ?auto_1928942 ?auto_1928941 ) ( ON ?auto_1928943 ?auto_1928942 ) ( ON ?auto_1928944 ?auto_1928943 ) ( ON ?auto_1928945 ?auto_1928944 ) ( ON ?auto_1928946 ?auto_1928945 ) ( ON ?auto_1928947 ?auto_1928946 ) ( ON ?auto_1928948 ?auto_1928947 ) ( not ( = ?auto_1928941 ?auto_1928942 ) ) ( not ( = ?auto_1928941 ?auto_1928943 ) ) ( not ( = ?auto_1928941 ?auto_1928944 ) ) ( not ( = ?auto_1928941 ?auto_1928945 ) ) ( not ( = ?auto_1928941 ?auto_1928946 ) ) ( not ( = ?auto_1928941 ?auto_1928947 ) ) ( not ( = ?auto_1928941 ?auto_1928948 ) ) ( not ( = ?auto_1928941 ?auto_1928949 ) ) ( not ( = ?auto_1928941 ?auto_1928950 ) ) ( not ( = ?auto_1928942 ?auto_1928943 ) ) ( not ( = ?auto_1928942 ?auto_1928944 ) ) ( not ( = ?auto_1928942 ?auto_1928945 ) ) ( not ( = ?auto_1928942 ?auto_1928946 ) ) ( not ( = ?auto_1928942 ?auto_1928947 ) ) ( not ( = ?auto_1928942 ?auto_1928948 ) ) ( not ( = ?auto_1928942 ?auto_1928949 ) ) ( not ( = ?auto_1928942 ?auto_1928950 ) ) ( not ( = ?auto_1928943 ?auto_1928944 ) ) ( not ( = ?auto_1928943 ?auto_1928945 ) ) ( not ( = ?auto_1928943 ?auto_1928946 ) ) ( not ( = ?auto_1928943 ?auto_1928947 ) ) ( not ( = ?auto_1928943 ?auto_1928948 ) ) ( not ( = ?auto_1928943 ?auto_1928949 ) ) ( not ( = ?auto_1928943 ?auto_1928950 ) ) ( not ( = ?auto_1928944 ?auto_1928945 ) ) ( not ( = ?auto_1928944 ?auto_1928946 ) ) ( not ( = ?auto_1928944 ?auto_1928947 ) ) ( not ( = ?auto_1928944 ?auto_1928948 ) ) ( not ( = ?auto_1928944 ?auto_1928949 ) ) ( not ( = ?auto_1928944 ?auto_1928950 ) ) ( not ( = ?auto_1928945 ?auto_1928946 ) ) ( not ( = ?auto_1928945 ?auto_1928947 ) ) ( not ( = ?auto_1928945 ?auto_1928948 ) ) ( not ( = ?auto_1928945 ?auto_1928949 ) ) ( not ( = ?auto_1928945 ?auto_1928950 ) ) ( not ( = ?auto_1928946 ?auto_1928947 ) ) ( not ( = ?auto_1928946 ?auto_1928948 ) ) ( not ( = ?auto_1928946 ?auto_1928949 ) ) ( not ( = ?auto_1928946 ?auto_1928950 ) ) ( not ( = ?auto_1928947 ?auto_1928948 ) ) ( not ( = ?auto_1928947 ?auto_1928949 ) ) ( not ( = ?auto_1928947 ?auto_1928950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1928948 ?auto_1928949 ?auto_1928950 )
      ( MAKE-9CRATE-VERIFY ?auto_1928941 ?auto_1928942 ?auto_1928943 ?auto_1928944 ?auto_1928945 ?auto_1928946 ?auto_1928947 ?auto_1928948 ?auto_1928949 ?auto_1928950 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929031 - SURFACE
      ?auto_1929032 - SURFACE
      ?auto_1929033 - SURFACE
      ?auto_1929034 - SURFACE
      ?auto_1929035 - SURFACE
      ?auto_1929036 - SURFACE
      ?auto_1929037 - SURFACE
      ?auto_1929038 - SURFACE
      ?auto_1929039 - SURFACE
      ?auto_1929040 - SURFACE
    )
    :vars
    (
      ?auto_1929043 - HOIST
      ?auto_1929041 - PLACE
      ?auto_1929042 - TRUCK
      ?auto_1929044 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929043 ?auto_1929041 ) ( SURFACE-AT ?auto_1929039 ?auto_1929041 ) ( CLEAR ?auto_1929039 ) ( IS-CRATE ?auto_1929040 ) ( not ( = ?auto_1929039 ?auto_1929040 ) ) ( AVAILABLE ?auto_1929043 ) ( IN ?auto_1929040 ?auto_1929042 ) ( ON ?auto_1929039 ?auto_1929038 ) ( not ( = ?auto_1929038 ?auto_1929039 ) ) ( not ( = ?auto_1929038 ?auto_1929040 ) ) ( TRUCK-AT ?auto_1929042 ?auto_1929044 ) ( not ( = ?auto_1929044 ?auto_1929041 ) ) ( ON ?auto_1929032 ?auto_1929031 ) ( ON ?auto_1929033 ?auto_1929032 ) ( ON ?auto_1929034 ?auto_1929033 ) ( ON ?auto_1929035 ?auto_1929034 ) ( ON ?auto_1929036 ?auto_1929035 ) ( ON ?auto_1929037 ?auto_1929036 ) ( ON ?auto_1929038 ?auto_1929037 ) ( not ( = ?auto_1929031 ?auto_1929032 ) ) ( not ( = ?auto_1929031 ?auto_1929033 ) ) ( not ( = ?auto_1929031 ?auto_1929034 ) ) ( not ( = ?auto_1929031 ?auto_1929035 ) ) ( not ( = ?auto_1929031 ?auto_1929036 ) ) ( not ( = ?auto_1929031 ?auto_1929037 ) ) ( not ( = ?auto_1929031 ?auto_1929038 ) ) ( not ( = ?auto_1929031 ?auto_1929039 ) ) ( not ( = ?auto_1929031 ?auto_1929040 ) ) ( not ( = ?auto_1929032 ?auto_1929033 ) ) ( not ( = ?auto_1929032 ?auto_1929034 ) ) ( not ( = ?auto_1929032 ?auto_1929035 ) ) ( not ( = ?auto_1929032 ?auto_1929036 ) ) ( not ( = ?auto_1929032 ?auto_1929037 ) ) ( not ( = ?auto_1929032 ?auto_1929038 ) ) ( not ( = ?auto_1929032 ?auto_1929039 ) ) ( not ( = ?auto_1929032 ?auto_1929040 ) ) ( not ( = ?auto_1929033 ?auto_1929034 ) ) ( not ( = ?auto_1929033 ?auto_1929035 ) ) ( not ( = ?auto_1929033 ?auto_1929036 ) ) ( not ( = ?auto_1929033 ?auto_1929037 ) ) ( not ( = ?auto_1929033 ?auto_1929038 ) ) ( not ( = ?auto_1929033 ?auto_1929039 ) ) ( not ( = ?auto_1929033 ?auto_1929040 ) ) ( not ( = ?auto_1929034 ?auto_1929035 ) ) ( not ( = ?auto_1929034 ?auto_1929036 ) ) ( not ( = ?auto_1929034 ?auto_1929037 ) ) ( not ( = ?auto_1929034 ?auto_1929038 ) ) ( not ( = ?auto_1929034 ?auto_1929039 ) ) ( not ( = ?auto_1929034 ?auto_1929040 ) ) ( not ( = ?auto_1929035 ?auto_1929036 ) ) ( not ( = ?auto_1929035 ?auto_1929037 ) ) ( not ( = ?auto_1929035 ?auto_1929038 ) ) ( not ( = ?auto_1929035 ?auto_1929039 ) ) ( not ( = ?auto_1929035 ?auto_1929040 ) ) ( not ( = ?auto_1929036 ?auto_1929037 ) ) ( not ( = ?auto_1929036 ?auto_1929038 ) ) ( not ( = ?auto_1929036 ?auto_1929039 ) ) ( not ( = ?auto_1929036 ?auto_1929040 ) ) ( not ( = ?auto_1929037 ?auto_1929038 ) ) ( not ( = ?auto_1929037 ?auto_1929039 ) ) ( not ( = ?auto_1929037 ?auto_1929040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929038 ?auto_1929039 ?auto_1929040 )
      ( MAKE-9CRATE-VERIFY ?auto_1929031 ?auto_1929032 ?auto_1929033 ?auto_1929034 ?auto_1929035 ?auto_1929036 ?auto_1929037 ?auto_1929038 ?auto_1929039 ?auto_1929040 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929130 - SURFACE
      ?auto_1929131 - SURFACE
      ?auto_1929132 - SURFACE
      ?auto_1929133 - SURFACE
      ?auto_1929134 - SURFACE
      ?auto_1929135 - SURFACE
      ?auto_1929136 - SURFACE
      ?auto_1929137 - SURFACE
      ?auto_1929138 - SURFACE
      ?auto_1929139 - SURFACE
    )
    :vars
    (
      ?auto_1929143 - HOIST
      ?auto_1929144 - PLACE
      ?auto_1929142 - TRUCK
      ?auto_1929141 - PLACE
      ?auto_1929140 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929143 ?auto_1929144 ) ( SURFACE-AT ?auto_1929138 ?auto_1929144 ) ( CLEAR ?auto_1929138 ) ( IS-CRATE ?auto_1929139 ) ( not ( = ?auto_1929138 ?auto_1929139 ) ) ( AVAILABLE ?auto_1929143 ) ( ON ?auto_1929138 ?auto_1929137 ) ( not ( = ?auto_1929137 ?auto_1929138 ) ) ( not ( = ?auto_1929137 ?auto_1929139 ) ) ( TRUCK-AT ?auto_1929142 ?auto_1929141 ) ( not ( = ?auto_1929141 ?auto_1929144 ) ) ( HOIST-AT ?auto_1929140 ?auto_1929141 ) ( LIFTING ?auto_1929140 ?auto_1929139 ) ( not ( = ?auto_1929143 ?auto_1929140 ) ) ( ON ?auto_1929131 ?auto_1929130 ) ( ON ?auto_1929132 ?auto_1929131 ) ( ON ?auto_1929133 ?auto_1929132 ) ( ON ?auto_1929134 ?auto_1929133 ) ( ON ?auto_1929135 ?auto_1929134 ) ( ON ?auto_1929136 ?auto_1929135 ) ( ON ?auto_1929137 ?auto_1929136 ) ( not ( = ?auto_1929130 ?auto_1929131 ) ) ( not ( = ?auto_1929130 ?auto_1929132 ) ) ( not ( = ?auto_1929130 ?auto_1929133 ) ) ( not ( = ?auto_1929130 ?auto_1929134 ) ) ( not ( = ?auto_1929130 ?auto_1929135 ) ) ( not ( = ?auto_1929130 ?auto_1929136 ) ) ( not ( = ?auto_1929130 ?auto_1929137 ) ) ( not ( = ?auto_1929130 ?auto_1929138 ) ) ( not ( = ?auto_1929130 ?auto_1929139 ) ) ( not ( = ?auto_1929131 ?auto_1929132 ) ) ( not ( = ?auto_1929131 ?auto_1929133 ) ) ( not ( = ?auto_1929131 ?auto_1929134 ) ) ( not ( = ?auto_1929131 ?auto_1929135 ) ) ( not ( = ?auto_1929131 ?auto_1929136 ) ) ( not ( = ?auto_1929131 ?auto_1929137 ) ) ( not ( = ?auto_1929131 ?auto_1929138 ) ) ( not ( = ?auto_1929131 ?auto_1929139 ) ) ( not ( = ?auto_1929132 ?auto_1929133 ) ) ( not ( = ?auto_1929132 ?auto_1929134 ) ) ( not ( = ?auto_1929132 ?auto_1929135 ) ) ( not ( = ?auto_1929132 ?auto_1929136 ) ) ( not ( = ?auto_1929132 ?auto_1929137 ) ) ( not ( = ?auto_1929132 ?auto_1929138 ) ) ( not ( = ?auto_1929132 ?auto_1929139 ) ) ( not ( = ?auto_1929133 ?auto_1929134 ) ) ( not ( = ?auto_1929133 ?auto_1929135 ) ) ( not ( = ?auto_1929133 ?auto_1929136 ) ) ( not ( = ?auto_1929133 ?auto_1929137 ) ) ( not ( = ?auto_1929133 ?auto_1929138 ) ) ( not ( = ?auto_1929133 ?auto_1929139 ) ) ( not ( = ?auto_1929134 ?auto_1929135 ) ) ( not ( = ?auto_1929134 ?auto_1929136 ) ) ( not ( = ?auto_1929134 ?auto_1929137 ) ) ( not ( = ?auto_1929134 ?auto_1929138 ) ) ( not ( = ?auto_1929134 ?auto_1929139 ) ) ( not ( = ?auto_1929135 ?auto_1929136 ) ) ( not ( = ?auto_1929135 ?auto_1929137 ) ) ( not ( = ?auto_1929135 ?auto_1929138 ) ) ( not ( = ?auto_1929135 ?auto_1929139 ) ) ( not ( = ?auto_1929136 ?auto_1929137 ) ) ( not ( = ?auto_1929136 ?auto_1929138 ) ) ( not ( = ?auto_1929136 ?auto_1929139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929137 ?auto_1929138 ?auto_1929139 )
      ( MAKE-9CRATE-VERIFY ?auto_1929130 ?auto_1929131 ?auto_1929132 ?auto_1929133 ?auto_1929134 ?auto_1929135 ?auto_1929136 ?auto_1929137 ?auto_1929138 ?auto_1929139 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929238 - SURFACE
      ?auto_1929239 - SURFACE
      ?auto_1929240 - SURFACE
      ?auto_1929241 - SURFACE
      ?auto_1929242 - SURFACE
      ?auto_1929243 - SURFACE
      ?auto_1929244 - SURFACE
      ?auto_1929245 - SURFACE
      ?auto_1929246 - SURFACE
      ?auto_1929247 - SURFACE
    )
    :vars
    (
      ?auto_1929252 - HOIST
      ?auto_1929253 - PLACE
      ?auto_1929249 - TRUCK
      ?auto_1929251 - PLACE
      ?auto_1929248 - HOIST
      ?auto_1929250 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929252 ?auto_1929253 ) ( SURFACE-AT ?auto_1929246 ?auto_1929253 ) ( CLEAR ?auto_1929246 ) ( IS-CRATE ?auto_1929247 ) ( not ( = ?auto_1929246 ?auto_1929247 ) ) ( AVAILABLE ?auto_1929252 ) ( ON ?auto_1929246 ?auto_1929245 ) ( not ( = ?auto_1929245 ?auto_1929246 ) ) ( not ( = ?auto_1929245 ?auto_1929247 ) ) ( TRUCK-AT ?auto_1929249 ?auto_1929251 ) ( not ( = ?auto_1929251 ?auto_1929253 ) ) ( HOIST-AT ?auto_1929248 ?auto_1929251 ) ( not ( = ?auto_1929252 ?auto_1929248 ) ) ( AVAILABLE ?auto_1929248 ) ( SURFACE-AT ?auto_1929247 ?auto_1929251 ) ( ON ?auto_1929247 ?auto_1929250 ) ( CLEAR ?auto_1929247 ) ( not ( = ?auto_1929246 ?auto_1929250 ) ) ( not ( = ?auto_1929247 ?auto_1929250 ) ) ( not ( = ?auto_1929245 ?auto_1929250 ) ) ( ON ?auto_1929239 ?auto_1929238 ) ( ON ?auto_1929240 ?auto_1929239 ) ( ON ?auto_1929241 ?auto_1929240 ) ( ON ?auto_1929242 ?auto_1929241 ) ( ON ?auto_1929243 ?auto_1929242 ) ( ON ?auto_1929244 ?auto_1929243 ) ( ON ?auto_1929245 ?auto_1929244 ) ( not ( = ?auto_1929238 ?auto_1929239 ) ) ( not ( = ?auto_1929238 ?auto_1929240 ) ) ( not ( = ?auto_1929238 ?auto_1929241 ) ) ( not ( = ?auto_1929238 ?auto_1929242 ) ) ( not ( = ?auto_1929238 ?auto_1929243 ) ) ( not ( = ?auto_1929238 ?auto_1929244 ) ) ( not ( = ?auto_1929238 ?auto_1929245 ) ) ( not ( = ?auto_1929238 ?auto_1929246 ) ) ( not ( = ?auto_1929238 ?auto_1929247 ) ) ( not ( = ?auto_1929238 ?auto_1929250 ) ) ( not ( = ?auto_1929239 ?auto_1929240 ) ) ( not ( = ?auto_1929239 ?auto_1929241 ) ) ( not ( = ?auto_1929239 ?auto_1929242 ) ) ( not ( = ?auto_1929239 ?auto_1929243 ) ) ( not ( = ?auto_1929239 ?auto_1929244 ) ) ( not ( = ?auto_1929239 ?auto_1929245 ) ) ( not ( = ?auto_1929239 ?auto_1929246 ) ) ( not ( = ?auto_1929239 ?auto_1929247 ) ) ( not ( = ?auto_1929239 ?auto_1929250 ) ) ( not ( = ?auto_1929240 ?auto_1929241 ) ) ( not ( = ?auto_1929240 ?auto_1929242 ) ) ( not ( = ?auto_1929240 ?auto_1929243 ) ) ( not ( = ?auto_1929240 ?auto_1929244 ) ) ( not ( = ?auto_1929240 ?auto_1929245 ) ) ( not ( = ?auto_1929240 ?auto_1929246 ) ) ( not ( = ?auto_1929240 ?auto_1929247 ) ) ( not ( = ?auto_1929240 ?auto_1929250 ) ) ( not ( = ?auto_1929241 ?auto_1929242 ) ) ( not ( = ?auto_1929241 ?auto_1929243 ) ) ( not ( = ?auto_1929241 ?auto_1929244 ) ) ( not ( = ?auto_1929241 ?auto_1929245 ) ) ( not ( = ?auto_1929241 ?auto_1929246 ) ) ( not ( = ?auto_1929241 ?auto_1929247 ) ) ( not ( = ?auto_1929241 ?auto_1929250 ) ) ( not ( = ?auto_1929242 ?auto_1929243 ) ) ( not ( = ?auto_1929242 ?auto_1929244 ) ) ( not ( = ?auto_1929242 ?auto_1929245 ) ) ( not ( = ?auto_1929242 ?auto_1929246 ) ) ( not ( = ?auto_1929242 ?auto_1929247 ) ) ( not ( = ?auto_1929242 ?auto_1929250 ) ) ( not ( = ?auto_1929243 ?auto_1929244 ) ) ( not ( = ?auto_1929243 ?auto_1929245 ) ) ( not ( = ?auto_1929243 ?auto_1929246 ) ) ( not ( = ?auto_1929243 ?auto_1929247 ) ) ( not ( = ?auto_1929243 ?auto_1929250 ) ) ( not ( = ?auto_1929244 ?auto_1929245 ) ) ( not ( = ?auto_1929244 ?auto_1929246 ) ) ( not ( = ?auto_1929244 ?auto_1929247 ) ) ( not ( = ?auto_1929244 ?auto_1929250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929245 ?auto_1929246 ?auto_1929247 )
      ( MAKE-9CRATE-VERIFY ?auto_1929238 ?auto_1929239 ?auto_1929240 ?auto_1929241 ?auto_1929242 ?auto_1929243 ?auto_1929244 ?auto_1929245 ?auto_1929246 ?auto_1929247 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929347 - SURFACE
      ?auto_1929348 - SURFACE
      ?auto_1929349 - SURFACE
      ?auto_1929350 - SURFACE
      ?auto_1929351 - SURFACE
      ?auto_1929352 - SURFACE
      ?auto_1929353 - SURFACE
      ?auto_1929354 - SURFACE
      ?auto_1929355 - SURFACE
      ?auto_1929356 - SURFACE
    )
    :vars
    (
      ?auto_1929358 - HOIST
      ?auto_1929362 - PLACE
      ?auto_1929359 - PLACE
      ?auto_1929357 - HOIST
      ?auto_1929360 - SURFACE
      ?auto_1929361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929358 ?auto_1929362 ) ( SURFACE-AT ?auto_1929355 ?auto_1929362 ) ( CLEAR ?auto_1929355 ) ( IS-CRATE ?auto_1929356 ) ( not ( = ?auto_1929355 ?auto_1929356 ) ) ( AVAILABLE ?auto_1929358 ) ( ON ?auto_1929355 ?auto_1929354 ) ( not ( = ?auto_1929354 ?auto_1929355 ) ) ( not ( = ?auto_1929354 ?auto_1929356 ) ) ( not ( = ?auto_1929359 ?auto_1929362 ) ) ( HOIST-AT ?auto_1929357 ?auto_1929359 ) ( not ( = ?auto_1929358 ?auto_1929357 ) ) ( AVAILABLE ?auto_1929357 ) ( SURFACE-AT ?auto_1929356 ?auto_1929359 ) ( ON ?auto_1929356 ?auto_1929360 ) ( CLEAR ?auto_1929356 ) ( not ( = ?auto_1929355 ?auto_1929360 ) ) ( not ( = ?auto_1929356 ?auto_1929360 ) ) ( not ( = ?auto_1929354 ?auto_1929360 ) ) ( TRUCK-AT ?auto_1929361 ?auto_1929362 ) ( ON ?auto_1929348 ?auto_1929347 ) ( ON ?auto_1929349 ?auto_1929348 ) ( ON ?auto_1929350 ?auto_1929349 ) ( ON ?auto_1929351 ?auto_1929350 ) ( ON ?auto_1929352 ?auto_1929351 ) ( ON ?auto_1929353 ?auto_1929352 ) ( ON ?auto_1929354 ?auto_1929353 ) ( not ( = ?auto_1929347 ?auto_1929348 ) ) ( not ( = ?auto_1929347 ?auto_1929349 ) ) ( not ( = ?auto_1929347 ?auto_1929350 ) ) ( not ( = ?auto_1929347 ?auto_1929351 ) ) ( not ( = ?auto_1929347 ?auto_1929352 ) ) ( not ( = ?auto_1929347 ?auto_1929353 ) ) ( not ( = ?auto_1929347 ?auto_1929354 ) ) ( not ( = ?auto_1929347 ?auto_1929355 ) ) ( not ( = ?auto_1929347 ?auto_1929356 ) ) ( not ( = ?auto_1929347 ?auto_1929360 ) ) ( not ( = ?auto_1929348 ?auto_1929349 ) ) ( not ( = ?auto_1929348 ?auto_1929350 ) ) ( not ( = ?auto_1929348 ?auto_1929351 ) ) ( not ( = ?auto_1929348 ?auto_1929352 ) ) ( not ( = ?auto_1929348 ?auto_1929353 ) ) ( not ( = ?auto_1929348 ?auto_1929354 ) ) ( not ( = ?auto_1929348 ?auto_1929355 ) ) ( not ( = ?auto_1929348 ?auto_1929356 ) ) ( not ( = ?auto_1929348 ?auto_1929360 ) ) ( not ( = ?auto_1929349 ?auto_1929350 ) ) ( not ( = ?auto_1929349 ?auto_1929351 ) ) ( not ( = ?auto_1929349 ?auto_1929352 ) ) ( not ( = ?auto_1929349 ?auto_1929353 ) ) ( not ( = ?auto_1929349 ?auto_1929354 ) ) ( not ( = ?auto_1929349 ?auto_1929355 ) ) ( not ( = ?auto_1929349 ?auto_1929356 ) ) ( not ( = ?auto_1929349 ?auto_1929360 ) ) ( not ( = ?auto_1929350 ?auto_1929351 ) ) ( not ( = ?auto_1929350 ?auto_1929352 ) ) ( not ( = ?auto_1929350 ?auto_1929353 ) ) ( not ( = ?auto_1929350 ?auto_1929354 ) ) ( not ( = ?auto_1929350 ?auto_1929355 ) ) ( not ( = ?auto_1929350 ?auto_1929356 ) ) ( not ( = ?auto_1929350 ?auto_1929360 ) ) ( not ( = ?auto_1929351 ?auto_1929352 ) ) ( not ( = ?auto_1929351 ?auto_1929353 ) ) ( not ( = ?auto_1929351 ?auto_1929354 ) ) ( not ( = ?auto_1929351 ?auto_1929355 ) ) ( not ( = ?auto_1929351 ?auto_1929356 ) ) ( not ( = ?auto_1929351 ?auto_1929360 ) ) ( not ( = ?auto_1929352 ?auto_1929353 ) ) ( not ( = ?auto_1929352 ?auto_1929354 ) ) ( not ( = ?auto_1929352 ?auto_1929355 ) ) ( not ( = ?auto_1929352 ?auto_1929356 ) ) ( not ( = ?auto_1929352 ?auto_1929360 ) ) ( not ( = ?auto_1929353 ?auto_1929354 ) ) ( not ( = ?auto_1929353 ?auto_1929355 ) ) ( not ( = ?auto_1929353 ?auto_1929356 ) ) ( not ( = ?auto_1929353 ?auto_1929360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929354 ?auto_1929355 ?auto_1929356 )
      ( MAKE-9CRATE-VERIFY ?auto_1929347 ?auto_1929348 ?auto_1929349 ?auto_1929350 ?auto_1929351 ?auto_1929352 ?auto_1929353 ?auto_1929354 ?auto_1929355 ?auto_1929356 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929456 - SURFACE
      ?auto_1929457 - SURFACE
      ?auto_1929458 - SURFACE
      ?auto_1929459 - SURFACE
      ?auto_1929460 - SURFACE
      ?auto_1929461 - SURFACE
      ?auto_1929462 - SURFACE
      ?auto_1929463 - SURFACE
      ?auto_1929464 - SURFACE
      ?auto_1929465 - SURFACE
    )
    :vars
    (
      ?auto_1929466 - HOIST
      ?auto_1929467 - PLACE
      ?auto_1929470 - PLACE
      ?auto_1929469 - HOIST
      ?auto_1929471 - SURFACE
      ?auto_1929468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929466 ?auto_1929467 ) ( IS-CRATE ?auto_1929465 ) ( not ( = ?auto_1929464 ?auto_1929465 ) ) ( not ( = ?auto_1929463 ?auto_1929464 ) ) ( not ( = ?auto_1929463 ?auto_1929465 ) ) ( not ( = ?auto_1929470 ?auto_1929467 ) ) ( HOIST-AT ?auto_1929469 ?auto_1929470 ) ( not ( = ?auto_1929466 ?auto_1929469 ) ) ( AVAILABLE ?auto_1929469 ) ( SURFACE-AT ?auto_1929465 ?auto_1929470 ) ( ON ?auto_1929465 ?auto_1929471 ) ( CLEAR ?auto_1929465 ) ( not ( = ?auto_1929464 ?auto_1929471 ) ) ( not ( = ?auto_1929465 ?auto_1929471 ) ) ( not ( = ?auto_1929463 ?auto_1929471 ) ) ( TRUCK-AT ?auto_1929468 ?auto_1929467 ) ( SURFACE-AT ?auto_1929463 ?auto_1929467 ) ( CLEAR ?auto_1929463 ) ( LIFTING ?auto_1929466 ?auto_1929464 ) ( IS-CRATE ?auto_1929464 ) ( ON ?auto_1929457 ?auto_1929456 ) ( ON ?auto_1929458 ?auto_1929457 ) ( ON ?auto_1929459 ?auto_1929458 ) ( ON ?auto_1929460 ?auto_1929459 ) ( ON ?auto_1929461 ?auto_1929460 ) ( ON ?auto_1929462 ?auto_1929461 ) ( ON ?auto_1929463 ?auto_1929462 ) ( not ( = ?auto_1929456 ?auto_1929457 ) ) ( not ( = ?auto_1929456 ?auto_1929458 ) ) ( not ( = ?auto_1929456 ?auto_1929459 ) ) ( not ( = ?auto_1929456 ?auto_1929460 ) ) ( not ( = ?auto_1929456 ?auto_1929461 ) ) ( not ( = ?auto_1929456 ?auto_1929462 ) ) ( not ( = ?auto_1929456 ?auto_1929463 ) ) ( not ( = ?auto_1929456 ?auto_1929464 ) ) ( not ( = ?auto_1929456 ?auto_1929465 ) ) ( not ( = ?auto_1929456 ?auto_1929471 ) ) ( not ( = ?auto_1929457 ?auto_1929458 ) ) ( not ( = ?auto_1929457 ?auto_1929459 ) ) ( not ( = ?auto_1929457 ?auto_1929460 ) ) ( not ( = ?auto_1929457 ?auto_1929461 ) ) ( not ( = ?auto_1929457 ?auto_1929462 ) ) ( not ( = ?auto_1929457 ?auto_1929463 ) ) ( not ( = ?auto_1929457 ?auto_1929464 ) ) ( not ( = ?auto_1929457 ?auto_1929465 ) ) ( not ( = ?auto_1929457 ?auto_1929471 ) ) ( not ( = ?auto_1929458 ?auto_1929459 ) ) ( not ( = ?auto_1929458 ?auto_1929460 ) ) ( not ( = ?auto_1929458 ?auto_1929461 ) ) ( not ( = ?auto_1929458 ?auto_1929462 ) ) ( not ( = ?auto_1929458 ?auto_1929463 ) ) ( not ( = ?auto_1929458 ?auto_1929464 ) ) ( not ( = ?auto_1929458 ?auto_1929465 ) ) ( not ( = ?auto_1929458 ?auto_1929471 ) ) ( not ( = ?auto_1929459 ?auto_1929460 ) ) ( not ( = ?auto_1929459 ?auto_1929461 ) ) ( not ( = ?auto_1929459 ?auto_1929462 ) ) ( not ( = ?auto_1929459 ?auto_1929463 ) ) ( not ( = ?auto_1929459 ?auto_1929464 ) ) ( not ( = ?auto_1929459 ?auto_1929465 ) ) ( not ( = ?auto_1929459 ?auto_1929471 ) ) ( not ( = ?auto_1929460 ?auto_1929461 ) ) ( not ( = ?auto_1929460 ?auto_1929462 ) ) ( not ( = ?auto_1929460 ?auto_1929463 ) ) ( not ( = ?auto_1929460 ?auto_1929464 ) ) ( not ( = ?auto_1929460 ?auto_1929465 ) ) ( not ( = ?auto_1929460 ?auto_1929471 ) ) ( not ( = ?auto_1929461 ?auto_1929462 ) ) ( not ( = ?auto_1929461 ?auto_1929463 ) ) ( not ( = ?auto_1929461 ?auto_1929464 ) ) ( not ( = ?auto_1929461 ?auto_1929465 ) ) ( not ( = ?auto_1929461 ?auto_1929471 ) ) ( not ( = ?auto_1929462 ?auto_1929463 ) ) ( not ( = ?auto_1929462 ?auto_1929464 ) ) ( not ( = ?auto_1929462 ?auto_1929465 ) ) ( not ( = ?auto_1929462 ?auto_1929471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929463 ?auto_1929464 ?auto_1929465 )
      ( MAKE-9CRATE-VERIFY ?auto_1929456 ?auto_1929457 ?auto_1929458 ?auto_1929459 ?auto_1929460 ?auto_1929461 ?auto_1929462 ?auto_1929463 ?auto_1929464 ?auto_1929465 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929565 - SURFACE
      ?auto_1929566 - SURFACE
      ?auto_1929567 - SURFACE
      ?auto_1929568 - SURFACE
      ?auto_1929569 - SURFACE
      ?auto_1929570 - SURFACE
      ?auto_1929571 - SURFACE
      ?auto_1929572 - SURFACE
      ?auto_1929573 - SURFACE
      ?auto_1929574 - SURFACE
    )
    :vars
    (
      ?auto_1929577 - HOIST
      ?auto_1929580 - PLACE
      ?auto_1929578 - PLACE
      ?auto_1929579 - HOIST
      ?auto_1929575 - SURFACE
      ?auto_1929576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929577 ?auto_1929580 ) ( IS-CRATE ?auto_1929574 ) ( not ( = ?auto_1929573 ?auto_1929574 ) ) ( not ( = ?auto_1929572 ?auto_1929573 ) ) ( not ( = ?auto_1929572 ?auto_1929574 ) ) ( not ( = ?auto_1929578 ?auto_1929580 ) ) ( HOIST-AT ?auto_1929579 ?auto_1929578 ) ( not ( = ?auto_1929577 ?auto_1929579 ) ) ( AVAILABLE ?auto_1929579 ) ( SURFACE-AT ?auto_1929574 ?auto_1929578 ) ( ON ?auto_1929574 ?auto_1929575 ) ( CLEAR ?auto_1929574 ) ( not ( = ?auto_1929573 ?auto_1929575 ) ) ( not ( = ?auto_1929574 ?auto_1929575 ) ) ( not ( = ?auto_1929572 ?auto_1929575 ) ) ( TRUCK-AT ?auto_1929576 ?auto_1929580 ) ( SURFACE-AT ?auto_1929572 ?auto_1929580 ) ( CLEAR ?auto_1929572 ) ( IS-CRATE ?auto_1929573 ) ( AVAILABLE ?auto_1929577 ) ( IN ?auto_1929573 ?auto_1929576 ) ( ON ?auto_1929566 ?auto_1929565 ) ( ON ?auto_1929567 ?auto_1929566 ) ( ON ?auto_1929568 ?auto_1929567 ) ( ON ?auto_1929569 ?auto_1929568 ) ( ON ?auto_1929570 ?auto_1929569 ) ( ON ?auto_1929571 ?auto_1929570 ) ( ON ?auto_1929572 ?auto_1929571 ) ( not ( = ?auto_1929565 ?auto_1929566 ) ) ( not ( = ?auto_1929565 ?auto_1929567 ) ) ( not ( = ?auto_1929565 ?auto_1929568 ) ) ( not ( = ?auto_1929565 ?auto_1929569 ) ) ( not ( = ?auto_1929565 ?auto_1929570 ) ) ( not ( = ?auto_1929565 ?auto_1929571 ) ) ( not ( = ?auto_1929565 ?auto_1929572 ) ) ( not ( = ?auto_1929565 ?auto_1929573 ) ) ( not ( = ?auto_1929565 ?auto_1929574 ) ) ( not ( = ?auto_1929565 ?auto_1929575 ) ) ( not ( = ?auto_1929566 ?auto_1929567 ) ) ( not ( = ?auto_1929566 ?auto_1929568 ) ) ( not ( = ?auto_1929566 ?auto_1929569 ) ) ( not ( = ?auto_1929566 ?auto_1929570 ) ) ( not ( = ?auto_1929566 ?auto_1929571 ) ) ( not ( = ?auto_1929566 ?auto_1929572 ) ) ( not ( = ?auto_1929566 ?auto_1929573 ) ) ( not ( = ?auto_1929566 ?auto_1929574 ) ) ( not ( = ?auto_1929566 ?auto_1929575 ) ) ( not ( = ?auto_1929567 ?auto_1929568 ) ) ( not ( = ?auto_1929567 ?auto_1929569 ) ) ( not ( = ?auto_1929567 ?auto_1929570 ) ) ( not ( = ?auto_1929567 ?auto_1929571 ) ) ( not ( = ?auto_1929567 ?auto_1929572 ) ) ( not ( = ?auto_1929567 ?auto_1929573 ) ) ( not ( = ?auto_1929567 ?auto_1929574 ) ) ( not ( = ?auto_1929567 ?auto_1929575 ) ) ( not ( = ?auto_1929568 ?auto_1929569 ) ) ( not ( = ?auto_1929568 ?auto_1929570 ) ) ( not ( = ?auto_1929568 ?auto_1929571 ) ) ( not ( = ?auto_1929568 ?auto_1929572 ) ) ( not ( = ?auto_1929568 ?auto_1929573 ) ) ( not ( = ?auto_1929568 ?auto_1929574 ) ) ( not ( = ?auto_1929568 ?auto_1929575 ) ) ( not ( = ?auto_1929569 ?auto_1929570 ) ) ( not ( = ?auto_1929569 ?auto_1929571 ) ) ( not ( = ?auto_1929569 ?auto_1929572 ) ) ( not ( = ?auto_1929569 ?auto_1929573 ) ) ( not ( = ?auto_1929569 ?auto_1929574 ) ) ( not ( = ?auto_1929569 ?auto_1929575 ) ) ( not ( = ?auto_1929570 ?auto_1929571 ) ) ( not ( = ?auto_1929570 ?auto_1929572 ) ) ( not ( = ?auto_1929570 ?auto_1929573 ) ) ( not ( = ?auto_1929570 ?auto_1929574 ) ) ( not ( = ?auto_1929570 ?auto_1929575 ) ) ( not ( = ?auto_1929571 ?auto_1929572 ) ) ( not ( = ?auto_1929571 ?auto_1929573 ) ) ( not ( = ?auto_1929571 ?auto_1929574 ) ) ( not ( = ?auto_1929571 ?auto_1929575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929572 ?auto_1929573 ?auto_1929574 )
      ( MAKE-9CRATE-VERIFY ?auto_1929565 ?auto_1929566 ?auto_1929567 ?auto_1929568 ?auto_1929569 ?auto_1929570 ?auto_1929571 ?auto_1929572 ?auto_1929573 ?auto_1929574 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935093 - SURFACE
      ?auto_1935094 - SURFACE
      ?auto_1935095 - SURFACE
      ?auto_1935096 - SURFACE
      ?auto_1935097 - SURFACE
      ?auto_1935098 - SURFACE
      ?auto_1935099 - SURFACE
      ?auto_1935100 - SURFACE
      ?auto_1935101 - SURFACE
      ?auto_1935102 - SURFACE
      ?auto_1935103 - SURFACE
    )
    :vars
    (
      ?auto_1935104 - HOIST
      ?auto_1935105 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935104 ?auto_1935105 ) ( SURFACE-AT ?auto_1935102 ?auto_1935105 ) ( CLEAR ?auto_1935102 ) ( LIFTING ?auto_1935104 ?auto_1935103 ) ( IS-CRATE ?auto_1935103 ) ( not ( = ?auto_1935102 ?auto_1935103 ) ) ( ON ?auto_1935094 ?auto_1935093 ) ( ON ?auto_1935095 ?auto_1935094 ) ( ON ?auto_1935096 ?auto_1935095 ) ( ON ?auto_1935097 ?auto_1935096 ) ( ON ?auto_1935098 ?auto_1935097 ) ( ON ?auto_1935099 ?auto_1935098 ) ( ON ?auto_1935100 ?auto_1935099 ) ( ON ?auto_1935101 ?auto_1935100 ) ( ON ?auto_1935102 ?auto_1935101 ) ( not ( = ?auto_1935093 ?auto_1935094 ) ) ( not ( = ?auto_1935093 ?auto_1935095 ) ) ( not ( = ?auto_1935093 ?auto_1935096 ) ) ( not ( = ?auto_1935093 ?auto_1935097 ) ) ( not ( = ?auto_1935093 ?auto_1935098 ) ) ( not ( = ?auto_1935093 ?auto_1935099 ) ) ( not ( = ?auto_1935093 ?auto_1935100 ) ) ( not ( = ?auto_1935093 ?auto_1935101 ) ) ( not ( = ?auto_1935093 ?auto_1935102 ) ) ( not ( = ?auto_1935093 ?auto_1935103 ) ) ( not ( = ?auto_1935094 ?auto_1935095 ) ) ( not ( = ?auto_1935094 ?auto_1935096 ) ) ( not ( = ?auto_1935094 ?auto_1935097 ) ) ( not ( = ?auto_1935094 ?auto_1935098 ) ) ( not ( = ?auto_1935094 ?auto_1935099 ) ) ( not ( = ?auto_1935094 ?auto_1935100 ) ) ( not ( = ?auto_1935094 ?auto_1935101 ) ) ( not ( = ?auto_1935094 ?auto_1935102 ) ) ( not ( = ?auto_1935094 ?auto_1935103 ) ) ( not ( = ?auto_1935095 ?auto_1935096 ) ) ( not ( = ?auto_1935095 ?auto_1935097 ) ) ( not ( = ?auto_1935095 ?auto_1935098 ) ) ( not ( = ?auto_1935095 ?auto_1935099 ) ) ( not ( = ?auto_1935095 ?auto_1935100 ) ) ( not ( = ?auto_1935095 ?auto_1935101 ) ) ( not ( = ?auto_1935095 ?auto_1935102 ) ) ( not ( = ?auto_1935095 ?auto_1935103 ) ) ( not ( = ?auto_1935096 ?auto_1935097 ) ) ( not ( = ?auto_1935096 ?auto_1935098 ) ) ( not ( = ?auto_1935096 ?auto_1935099 ) ) ( not ( = ?auto_1935096 ?auto_1935100 ) ) ( not ( = ?auto_1935096 ?auto_1935101 ) ) ( not ( = ?auto_1935096 ?auto_1935102 ) ) ( not ( = ?auto_1935096 ?auto_1935103 ) ) ( not ( = ?auto_1935097 ?auto_1935098 ) ) ( not ( = ?auto_1935097 ?auto_1935099 ) ) ( not ( = ?auto_1935097 ?auto_1935100 ) ) ( not ( = ?auto_1935097 ?auto_1935101 ) ) ( not ( = ?auto_1935097 ?auto_1935102 ) ) ( not ( = ?auto_1935097 ?auto_1935103 ) ) ( not ( = ?auto_1935098 ?auto_1935099 ) ) ( not ( = ?auto_1935098 ?auto_1935100 ) ) ( not ( = ?auto_1935098 ?auto_1935101 ) ) ( not ( = ?auto_1935098 ?auto_1935102 ) ) ( not ( = ?auto_1935098 ?auto_1935103 ) ) ( not ( = ?auto_1935099 ?auto_1935100 ) ) ( not ( = ?auto_1935099 ?auto_1935101 ) ) ( not ( = ?auto_1935099 ?auto_1935102 ) ) ( not ( = ?auto_1935099 ?auto_1935103 ) ) ( not ( = ?auto_1935100 ?auto_1935101 ) ) ( not ( = ?auto_1935100 ?auto_1935102 ) ) ( not ( = ?auto_1935100 ?auto_1935103 ) ) ( not ( = ?auto_1935101 ?auto_1935102 ) ) ( not ( = ?auto_1935101 ?auto_1935103 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1935102 ?auto_1935103 )
      ( MAKE-10CRATE-VERIFY ?auto_1935093 ?auto_1935094 ?auto_1935095 ?auto_1935096 ?auto_1935097 ?auto_1935098 ?auto_1935099 ?auto_1935100 ?auto_1935101 ?auto_1935102 ?auto_1935103 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935187 - SURFACE
      ?auto_1935188 - SURFACE
      ?auto_1935189 - SURFACE
      ?auto_1935190 - SURFACE
      ?auto_1935191 - SURFACE
      ?auto_1935192 - SURFACE
      ?auto_1935193 - SURFACE
      ?auto_1935194 - SURFACE
      ?auto_1935195 - SURFACE
      ?auto_1935196 - SURFACE
      ?auto_1935197 - SURFACE
    )
    :vars
    (
      ?auto_1935199 - HOIST
      ?auto_1935200 - PLACE
      ?auto_1935198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935199 ?auto_1935200 ) ( SURFACE-AT ?auto_1935196 ?auto_1935200 ) ( CLEAR ?auto_1935196 ) ( IS-CRATE ?auto_1935197 ) ( not ( = ?auto_1935196 ?auto_1935197 ) ) ( TRUCK-AT ?auto_1935198 ?auto_1935200 ) ( AVAILABLE ?auto_1935199 ) ( IN ?auto_1935197 ?auto_1935198 ) ( ON ?auto_1935196 ?auto_1935195 ) ( not ( = ?auto_1935195 ?auto_1935196 ) ) ( not ( = ?auto_1935195 ?auto_1935197 ) ) ( ON ?auto_1935188 ?auto_1935187 ) ( ON ?auto_1935189 ?auto_1935188 ) ( ON ?auto_1935190 ?auto_1935189 ) ( ON ?auto_1935191 ?auto_1935190 ) ( ON ?auto_1935192 ?auto_1935191 ) ( ON ?auto_1935193 ?auto_1935192 ) ( ON ?auto_1935194 ?auto_1935193 ) ( ON ?auto_1935195 ?auto_1935194 ) ( not ( = ?auto_1935187 ?auto_1935188 ) ) ( not ( = ?auto_1935187 ?auto_1935189 ) ) ( not ( = ?auto_1935187 ?auto_1935190 ) ) ( not ( = ?auto_1935187 ?auto_1935191 ) ) ( not ( = ?auto_1935187 ?auto_1935192 ) ) ( not ( = ?auto_1935187 ?auto_1935193 ) ) ( not ( = ?auto_1935187 ?auto_1935194 ) ) ( not ( = ?auto_1935187 ?auto_1935195 ) ) ( not ( = ?auto_1935187 ?auto_1935196 ) ) ( not ( = ?auto_1935187 ?auto_1935197 ) ) ( not ( = ?auto_1935188 ?auto_1935189 ) ) ( not ( = ?auto_1935188 ?auto_1935190 ) ) ( not ( = ?auto_1935188 ?auto_1935191 ) ) ( not ( = ?auto_1935188 ?auto_1935192 ) ) ( not ( = ?auto_1935188 ?auto_1935193 ) ) ( not ( = ?auto_1935188 ?auto_1935194 ) ) ( not ( = ?auto_1935188 ?auto_1935195 ) ) ( not ( = ?auto_1935188 ?auto_1935196 ) ) ( not ( = ?auto_1935188 ?auto_1935197 ) ) ( not ( = ?auto_1935189 ?auto_1935190 ) ) ( not ( = ?auto_1935189 ?auto_1935191 ) ) ( not ( = ?auto_1935189 ?auto_1935192 ) ) ( not ( = ?auto_1935189 ?auto_1935193 ) ) ( not ( = ?auto_1935189 ?auto_1935194 ) ) ( not ( = ?auto_1935189 ?auto_1935195 ) ) ( not ( = ?auto_1935189 ?auto_1935196 ) ) ( not ( = ?auto_1935189 ?auto_1935197 ) ) ( not ( = ?auto_1935190 ?auto_1935191 ) ) ( not ( = ?auto_1935190 ?auto_1935192 ) ) ( not ( = ?auto_1935190 ?auto_1935193 ) ) ( not ( = ?auto_1935190 ?auto_1935194 ) ) ( not ( = ?auto_1935190 ?auto_1935195 ) ) ( not ( = ?auto_1935190 ?auto_1935196 ) ) ( not ( = ?auto_1935190 ?auto_1935197 ) ) ( not ( = ?auto_1935191 ?auto_1935192 ) ) ( not ( = ?auto_1935191 ?auto_1935193 ) ) ( not ( = ?auto_1935191 ?auto_1935194 ) ) ( not ( = ?auto_1935191 ?auto_1935195 ) ) ( not ( = ?auto_1935191 ?auto_1935196 ) ) ( not ( = ?auto_1935191 ?auto_1935197 ) ) ( not ( = ?auto_1935192 ?auto_1935193 ) ) ( not ( = ?auto_1935192 ?auto_1935194 ) ) ( not ( = ?auto_1935192 ?auto_1935195 ) ) ( not ( = ?auto_1935192 ?auto_1935196 ) ) ( not ( = ?auto_1935192 ?auto_1935197 ) ) ( not ( = ?auto_1935193 ?auto_1935194 ) ) ( not ( = ?auto_1935193 ?auto_1935195 ) ) ( not ( = ?auto_1935193 ?auto_1935196 ) ) ( not ( = ?auto_1935193 ?auto_1935197 ) ) ( not ( = ?auto_1935194 ?auto_1935195 ) ) ( not ( = ?auto_1935194 ?auto_1935196 ) ) ( not ( = ?auto_1935194 ?auto_1935197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935195 ?auto_1935196 ?auto_1935197 )
      ( MAKE-10CRATE-VERIFY ?auto_1935187 ?auto_1935188 ?auto_1935189 ?auto_1935190 ?auto_1935191 ?auto_1935192 ?auto_1935193 ?auto_1935194 ?auto_1935195 ?auto_1935196 ?auto_1935197 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935292 - SURFACE
      ?auto_1935293 - SURFACE
      ?auto_1935294 - SURFACE
      ?auto_1935295 - SURFACE
      ?auto_1935296 - SURFACE
      ?auto_1935297 - SURFACE
      ?auto_1935298 - SURFACE
      ?auto_1935299 - SURFACE
      ?auto_1935300 - SURFACE
      ?auto_1935301 - SURFACE
      ?auto_1935302 - SURFACE
    )
    :vars
    (
      ?auto_1935303 - HOIST
      ?auto_1935306 - PLACE
      ?auto_1935305 - TRUCK
      ?auto_1935304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935303 ?auto_1935306 ) ( SURFACE-AT ?auto_1935301 ?auto_1935306 ) ( CLEAR ?auto_1935301 ) ( IS-CRATE ?auto_1935302 ) ( not ( = ?auto_1935301 ?auto_1935302 ) ) ( AVAILABLE ?auto_1935303 ) ( IN ?auto_1935302 ?auto_1935305 ) ( ON ?auto_1935301 ?auto_1935300 ) ( not ( = ?auto_1935300 ?auto_1935301 ) ) ( not ( = ?auto_1935300 ?auto_1935302 ) ) ( TRUCK-AT ?auto_1935305 ?auto_1935304 ) ( not ( = ?auto_1935304 ?auto_1935306 ) ) ( ON ?auto_1935293 ?auto_1935292 ) ( ON ?auto_1935294 ?auto_1935293 ) ( ON ?auto_1935295 ?auto_1935294 ) ( ON ?auto_1935296 ?auto_1935295 ) ( ON ?auto_1935297 ?auto_1935296 ) ( ON ?auto_1935298 ?auto_1935297 ) ( ON ?auto_1935299 ?auto_1935298 ) ( ON ?auto_1935300 ?auto_1935299 ) ( not ( = ?auto_1935292 ?auto_1935293 ) ) ( not ( = ?auto_1935292 ?auto_1935294 ) ) ( not ( = ?auto_1935292 ?auto_1935295 ) ) ( not ( = ?auto_1935292 ?auto_1935296 ) ) ( not ( = ?auto_1935292 ?auto_1935297 ) ) ( not ( = ?auto_1935292 ?auto_1935298 ) ) ( not ( = ?auto_1935292 ?auto_1935299 ) ) ( not ( = ?auto_1935292 ?auto_1935300 ) ) ( not ( = ?auto_1935292 ?auto_1935301 ) ) ( not ( = ?auto_1935292 ?auto_1935302 ) ) ( not ( = ?auto_1935293 ?auto_1935294 ) ) ( not ( = ?auto_1935293 ?auto_1935295 ) ) ( not ( = ?auto_1935293 ?auto_1935296 ) ) ( not ( = ?auto_1935293 ?auto_1935297 ) ) ( not ( = ?auto_1935293 ?auto_1935298 ) ) ( not ( = ?auto_1935293 ?auto_1935299 ) ) ( not ( = ?auto_1935293 ?auto_1935300 ) ) ( not ( = ?auto_1935293 ?auto_1935301 ) ) ( not ( = ?auto_1935293 ?auto_1935302 ) ) ( not ( = ?auto_1935294 ?auto_1935295 ) ) ( not ( = ?auto_1935294 ?auto_1935296 ) ) ( not ( = ?auto_1935294 ?auto_1935297 ) ) ( not ( = ?auto_1935294 ?auto_1935298 ) ) ( not ( = ?auto_1935294 ?auto_1935299 ) ) ( not ( = ?auto_1935294 ?auto_1935300 ) ) ( not ( = ?auto_1935294 ?auto_1935301 ) ) ( not ( = ?auto_1935294 ?auto_1935302 ) ) ( not ( = ?auto_1935295 ?auto_1935296 ) ) ( not ( = ?auto_1935295 ?auto_1935297 ) ) ( not ( = ?auto_1935295 ?auto_1935298 ) ) ( not ( = ?auto_1935295 ?auto_1935299 ) ) ( not ( = ?auto_1935295 ?auto_1935300 ) ) ( not ( = ?auto_1935295 ?auto_1935301 ) ) ( not ( = ?auto_1935295 ?auto_1935302 ) ) ( not ( = ?auto_1935296 ?auto_1935297 ) ) ( not ( = ?auto_1935296 ?auto_1935298 ) ) ( not ( = ?auto_1935296 ?auto_1935299 ) ) ( not ( = ?auto_1935296 ?auto_1935300 ) ) ( not ( = ?auto_1935296 ?auto_1935301 ) ) ( not ( = ?auto_1935296 ?auto_1935302 ) ) ( not ( = ?auto_1935297 ?auto_1935298 ) ) ( not ( = ?auto_1935297 ?auto_1935299 ) ) ( not ( = ?auto_1935297 ?auto_1935300 ) ) ( not ( = ?auto_1935297 ?auto_1935301 ) ) ( not ( = ?auto_1935297 ?auto_1935302 ) ) ( not ( = ?auto_1935298 ?auto_1935299 ) ) ( not ( = ?auto_1935298 ?auto_1935300 ) ) ( not ( = ?auto_1935298 ?auto_1935301 ) ) ( not ( = ?auto_1935298 ?auto_1935302 ) ) ( not ( = ?auto_1935299 ?auto_1935300 ) ) ( not ( = ?auto_1935299 ?auto_1935301 ) ) ( not ( = ?auto_1935299 ?auto_1935302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935300 ?auto_1935301 ?auto_1935302 )
      ( MAKE-10CRATE-VERIFY ?auto_1935292 ?auto_1935293 ?auto_1935294 ?auto_1935295 ?auto_1935296 ?auto_1935297 ?auto_1935298 ?auto_1935299 ?auto_1935300 ?auto_1935301 ?auto_1935302 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935407 - SURFACE
      ?auto_1935408 - SURFACE
      ?auto_1935409 - SURFACE
      ?auto_1935410 - SURFACE
      ?auto_1935411 - SURFACE
      ?auto_1935412 - SURFACE
      ?auto_1935413 - SURFACE
      ?auto_1935414 - SURFACE
      ?auto_1935415 - SURFACE
      ?auto_1935416 - SURFACE
      ?auto_1935417 - SURFACE
    )
    :vars
    (
      ?auto_1935422 - HOIST
      ?auto_1935418 - PLACE
      ?auto_1935419 - TRUCK
      ?auto_1935420 - PLACE
      ?auto_1935421 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935422 ?auto_1935418 ) ( SURFACE-AT ?auto_1935416 ?auto_1935418 ) ( CLEAR ?auto_1935416 ) ( IS-CRATE ?auto_1935417 ) ( not ( = ?auto_1935416 ?auto_1935417 ) ) ( AVAILABLE ?auto_1935422 ) ( ON ?auto_1935416 ?auto_1935415 ) ( not ( = ?auto_1935415 ?auto_1935416 ) ) ( not ( = ?auto_1935415 ?auto_1935417 ) ) ( TRUCK-AT ?auto_1935419 ?auto_1935420 ) ( not ( = ?auto_1935420 ?auto_1935418 ) ) ( HOIST-AT ?auto_1935421 ?auto_1935420 ) ( LIFTING ?auto_1935421 ?auto_1935417 ) ( not ( = ?auto_1935422 ?auto_1935421 ) ) ( ON ?auto_1935408 ?auto_1935407 ) ( ON ?auto_1935409 ?auto_1935408 ) ( ON ?auto_1935410 ?auto_1935409 ) ( ON ?auto_1935411 ?auto_1935410 ) ( ON ?auto_1935412 ?auto_1935411 ) ( ON ?auto_1935413 ?auto_1935412 ) ( ON ?auto_1935414 ?auto_1935413 ) ( ON ?auto_1935415 ?auto_1935414 ) ( not ( = ?auto_1935407 ?auto_1935408 ) ) ( not ( = ?auto_1935407 ?auto_1935409 ) ) ( not ( = ?auto_1935407 ?auto_1935410 ) ) ( not ( = ?auto_1935407 ?auto_1935411 ) ) ( not ( = ?auto_1935407 ?auto_1935412 ) ) ( not ( = ?auto_1935407 ?auto_1935413 ) ) ( not ( = ?auto_1935407 ?auto_1935414 ) ) ( not ( = ?auto_1935407 ?auto_1935415 ) ) ( not ( = ?auto_1935407 ?auto_1935416 ) ) ( not ( = ?auto_1935407 ?auto_1935417 ) ) ( not ( = ?auto_1935408 ?auto_1935409 ) ) ( not ( = ?auto_1935408 ?auto_1935410 ) ) ( not ( = ?auto_1935408 ?auto_1935411 ) ) ( not ( = ?auto_1935408 ?auto_1935412 ) ) ( not ( = ?auto_1935408 ?auto_1935413 ) ) ( not ( = ?auto_1935408 ?auto_1935414 ) ) ( not ( = ?auto_1935408 ?auto_1935415 ) ) ( not ( = ?auto_1935408 ?auto_1935416 ) ) ( not ( = ?auto_1935408 ?auto_1935417 ) ) ( not ( = ?auto_1935409 ?auto_1935410 ) ) ( not ( = ?auto_1935409 ?auto_1935411 ) ) ( not ( = ?auto_1935409 ?auto_1935412 ) ) ( not ( = ?auto_1935409 ?auto_1935413 ) ) ( not ( = ?auto_1935409 ?auto_1935414 ) ) ( not ( = ?auto_1935409 ?auto_1935415 ) ) ( not ( = ?auto_1935409 ?auto_1935416 ) ) ( not ( = ?auto_1935409 ?auto_1935417 ) ) ( not ( = ?auto_1935410 ?auto_1935411 ) ) ( not ( = ?auto_1935410 ?auto_1935412 ) ) ( not ( = ?auto_1935410 ?auto_1935413 ) ) ( not ( = ?auto_1935410 ?auto_1935414 ) ) ( not ( = ?auto_1935410 ?auto_1935415 ) ) ( not ( = ?auto_1935410 ?auto_1935416 ) ) ( not ( = ?auto_1935410 ?auto_1935417 ) ) ( not ( = ?auto_1935411 ?auto_1935412 ) ) ( not ( = ?auto_1935411 ?auto_1935413 ) ) ( not ( = ?auto_1935411 ?auto_1935414 ) ) ( not ( = ?auto_1935411 ?auto_1935415 ) ) ( not ( = ?auto_1935411 ?auto_1935416 ) ) ( not ( = ?auto_1935411 ?auto_1935417 ) ) ( not ( = ?auto_1935412 ?auto_1935413 ) ) ( not ( = ?auto_1935412 ?auto_1935414 ) ) ( not ( = ?auto_1935412 ?auto_1935415 ) ) ( not ( = ?auto_1935412 ?auto_1935416 ) ) ( not ( = ?auto_1935412 ?auto_1935417 ) ) ( not ( = ?auto_1935413 ?auto_1935414 ) ) ( not ( = ?auto_1935413 ?auto_1935415 ) ) ( not ( = ?auto_1935413 ?auto_1935416 ) ) ( not ( = ?auto_1935413 ?auto_1935417 ) ) ( not ( = ?auto_1935414 ?auto_1935415 ) ) ( not ( = ?auto_1935414 ?auto_1935416 ) ) ( not ( = ?auto_1935414 ?auto_1935417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935415 ?auto_1935416 ?auto_1935417 )
      ( MAKE-10CRATE-VERIFY ?auto_1935407 ?auto_1935408 ?auto_1935409 ?auto_1935410 ?auto_1935411 ?auto_1935412 ?auto_1935413 ?auto_1935414 ?auto_1935415 ?auto_1935416 ?auto_1935417 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935532 - SURFACE
      ?auto_1935533 - SURFACE
      ?auto_1935534 - SURFACE
      ?auto_1935535 - SURFACE
      ?auto_1935536 - SURFACE
      ?auto_1935537 - SURFACE
      ?auto_1935538 - SURFACE
      ?auto_1935539 - SURFACE
      ?auto_1935540 - SURFACE
      ?auto_1935541 - SURFACE
      ?auto_1935542 - SURFACE
    )
    :vars
    (
      ?auto_1935548 - HOIST
      ?auto_1935543 - PLACE
      ?auto_1935547 - TRUCK
      ?auto_1935545 - PLACE
      ?auto_1935546 - HOIST
      ?auto_1935544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935548 ?auto_1935543 ) ( SURFACE-AT ?auto_1935541 ?auto_1935543 ) ( CLEAR ?auto_1935541 ) ( IS-CRATE ?auto_1935542 ) ( not ( = ?auto_1935541 ?auto_1935542 ) ) ( AVAILABLE ?auto_1935548 ) ( ON ?auto_1935541 ?auto_1935540 ) ( not ( = ?auto_1935540 ?auto_1935541 ) ) ( not ( = ?auto_1935540 ?auto_1935542 ) ) ( TRUCK-AT ?auto_1935547 ?auto_1935545 ) ( not ( = ?auto_1935545 ?auto_1935543 ) ) ( HOIST-AT ?auto_1935546 ?auto_1935545 ) ( not ( = ?auto_1935548 ?auto_1935546 ) ) ( AVAILABLE ?auto_1935546 ) ( SURFACE-AT ?auto_1935542 ?auto_1935545 ) ( ON ?auto_1935542 ?auto_1935544 ) ( CLEAR ?auto_1935542 ) ( not ( = ?auto_1935541 ?auto_1935544 ) ) ( not ( = ?auto_1935542 ?auto_1935544 ) ) ( not ( = ?auto_1935540 ?auto_1935544 ) ) ( ON ?auto_1935533 ?auto_1935532 ) ( ON ?auto_1935534 ?auto_1935533 ) ( ON ?auto_1935535 ?auto_1935534 ) ( ON ?auto_1935536 ?auto_1935535 ) ( ON ?auto_1935537 ?auto_1935536 ) ( ON ?auto_1935538 ?auto_1935537 ) ( ON ?auto_1935539 ?auto_1935538 ) ( ON ?auto_1935540 ?auto_1935539 ) ( not ( = ?auto_1935532 ?auto_1935533 ) ) ( not ( = ?auto_1935532 ?auto_1935534 ) ) ( not ( = ?auto_1935532 ?auto_1935535 ) ) ( not ( = ?auto_1935532 ?auto_1935536 ) ) ( not ( = ?auto_1935532 ?auto_1935537 ) ) ( not ( = ?auto_1935532 ?auto_1935538 ) ) ( not ( = ?auto_1935532 ?auto_1935539 ) ) ( not ( = ?auto_1935532 ?auto_1935540 ) ) ( not ( = ?auto_1935532 ?auto_1935541 ) ) ( not ( = ?auto_1935532 ?auto_1935542 ) ) ( not ( = ?auto_1935532 ?auto_1935544 ) ) ( not ( = ?auto_1935533 ?auto_1935534 ) ) ( not ( = ?auto_1935533 ?auto_1935535 ) ) ( not ( = ?auto_1935533 ?auto_1935536 ) ) ( not ( = ?auto_1935533 ?auto_1935537 ) ) ( not ( = ?auto_1935533 ?auto_1935538 ) ) ( not ( = ?auto_1935533 ?auto_1935539 ) ) ( not ( = ?auto_1935533 ?auto_1935540 ) ) ( not ( = ?auto_1935533 ?auto_1935541 ) ) ( not ( = ?auto_1935533 ?auto_1935542 ) ) ( not ( = ?auto_1935533 ?auto_1935544 ) ) ( not ( = ?auto_1935534 ?auto_1935535 ) ) ( not ( = ?auto_1935534 ?auto_1935536 ) ) ( not ( = ?auto_1935534 ?auto_1935537 ) ) ( not ( = ?auto_1935534 ?auto_1935538 ) ) ( not ( = ?auto_1935534 ?auto_1935539 ) ) ( not ( = ?auto_1935534 ?auto_1935540 ) ) ( not ( = ?auto_1935534 ?auto_1935541 ) ) ( not ( = ?auto_1935534 ?auto_1935542 ) ) ( not ( = ?auto_1935534 ?auto_1935544 ) ) ( not ( = ?auto_1935535 ?auto_1935536 ) ) ( not ( = ?auto_1935535 ?auto_1935537 ) ) ( not ( = ?auto_1935535 ?auto_1935538 ) ) ( not ( = ?auto_1935535 ?auto_1935539 ) ) ( not ( = ?auto_1935535 ?auto_1935540 ) ) ( not ( = ?auto_1935535 ?auto_1935541 ) ) ( not ( = ?auto_1935535 ?auto_1935542 ) ) ( not ( = ?auto_1935535 ?auto_1935544 ) ) ( not ( = ?auto_1935536 ?auto_1935537 ) ) ( not ( = ?auto_1935536 ?auto_1935538 ) ) ( not ( = ?auto_1935536 ?auto_1935539 ) ) ( not ( = ?auto_1935536 ?auto_1935540 ) ) ( not ( = ?auto_1935536 ?auto_1935541 ) ) ( not ( = ?auto_1935536 ?auto_1935542 ) ) ( not ( = ?auto_1935536 ?auto_1935544 ) ) ( not ( = ?auto_1935537 ?auto_1935538 ) ) ( not ( = ?auto_1935537 ?auto_1935539 ) ) ( not ( = ?auto_1935537 ?auto_1935540 ) ) ( not ( = ?auto_1935537 ?auto_1935541 ) ) ( not ( = ?auto_1935537 ?auto_1935542 ) ) ( not ( = ?auto_1935537 ?auto_1935544 ) ) ( not ( = ?auto_1935538 ?auto_1935539 ) ) ( not ( = ?auto_1935538 ?auto_1935540 ) ) ( not ( = ?auto_1935538 ?auto_1935541 ) ) ( not ( = ?auto_1935538 ?auto_1935542 ) ) ( not ( = ?auto_1935538 ?auto_1935544 ) ) ( not ( = ?auto_1935539 ?auto_1935540 ) ) ( not ( = ?auto_1935539 ?auto_1935541 ) ) ( not ( = ?auto_1935539 ?auto_1935542 ) ) ( not ( = ?auto_1935539 ?auto_1935544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935540 ?auto_1935541 ?auto_1935542 )
      ( MAKE-10CRATE-VERIFY ?auto_1935532 ?auto_1935533 ?auto_1935534 ?auto_1935535 ?auto_1935536 ?auto_1935537 ?auto_1935538 ?auto_1935539 ?auto_1935540 ?auto_1935541 ?auto_1935542 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935658 - SURFACE
      ?auto_1935659 - SURFACE
      ?auto_1935660 - SURFACE
      ?auto_1935661 - SURFACE
      ?auto_1935662 - SURFACE
      ?auto_1935663 - SURFACE
      ?auto_1935664 - SURFACE
      ?auto_1935665 - SURFACE
      ?auto_1935666 - SURFACE
      ?auto_1935667 - SURFACE
      ?auto_1935668 - SURFACE
    )
    :vars
    (
      ?auto_1935670 - HOIST
      ?auto_1935671 - PLACE
      ?auto_1935672 - PLACE
      ?auto_1935674 - HOIST
      ?auto_1935673 - SURFACE
      ?auto_1935669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935670 ?auto_1935671 ) ( SURFACE-AT ?auto_1935667 ?auto_1935671 ) ( CLEAR ?auto_1935667 ) ( IS-CRATE ?auto_1935668 ) ( not ( = ?auto_1935667 ?auto_1935668 ) ) ( AVAILABLE ?auto_1935670 ) ( ON ?auto_1935667 ?auto_1935666 ) ( not ( = ?auto_1935666 ?auto_1935667 ) ) ( not ( = ?auto_1935666 ?auto_1935668 ) ) ( not ( = ?auto_1935672 ?auto_1935671 ) ) ( HOIST-AT ?auto_1935674 ?auto_1935672 ) ( not ( = ?auto_1935670 ?auto_1935674 ) ) ( AVAILABLE ?auto_1935674 ) ( SURFACE-AT ?auto_1935668 ?auto_1935672 ) ( ON ?auto_1935668 ?auto_1935673 ) ( CLEAR ?auto_1935668 ) ( not ( = ?auto_1935667 ?auto_1935673 ) ) ( not ( = ?auto_1935668 ?auto_1935673 ) ) ( not ( = ?auto_1935666 ?auto_1935673 ) ) ( TRUCK-AT ?auto_1935669 ?auto_1935671 ) ( ON ?auto_1935659 ?auto_1935658 ) ( ON ?auto_1935660 ?auto_1935659 ) ( ON ?auto_1935661 ?auto_1935660 ) ( ON ?auto_1935662 ?auto_1935661 ) ( ON ?auto_1935663 ?auto_1935662 ) ( ON ?auto_1935664 ?auto_1935663 ) ( ON ?auto_1935665 ?auto_1935664 ) ( ON ?auto_1935666 ?auto_1935665 ) ( not ( = ?auto_1935658 ?auto_1935659 ) ) ( not ( = ?auto_1935658 ?auto_1935660 ) ) ( not ( = ?auto_1935658 ?auto_1935661 ) ) ( not ( = ?auto_1935658 ?auto_1935662 ) ) ( not ( = ?auto_1935658 ?auto_1935663 ) ) ( not ( = ?auto_1935658 ?auto_1935664 ) ) ( not ( = ?auto_1935658 ?auto_1935665 ) ) ( not ( = ?auto_1935658 ?auto_1935666 ) ) ( not ( = ?auto_1935658 ?auto_1935667 ) ) ( not ( = ?auto_1935658 ?auto_1935668 ) ) ( not ( = ?auto_1935658 ?auto_1935673 ) ) ( not ( = ?auto_1935659 ?auto_1935660 ) ) ( not ( = ?auto_1935659 ?auto_1935661 ) ) ( not ( = ?auto_1935659 ?auto_1935662 ) ) ( not ( = ?auto_1935659 ?auto_1935663 ) ) ( not ( = ?auto_1935659 ?auto_1935664 ) ) ( not ( = ?auto_1935659 ?auto_1935665 ) ) ( not ( = ?auto_1935659 ?auto_1935666 ) ) ( not ( = ?auto_1935659 ?auto_1935667 ) ) ( not ( = ?auto_1935659 ?auto_1935668 ) ) ( not ( = ?auto_1935659 ?auto_1935673 ) ) ( not ( = ?auto_1935660 ?auto_1935661 ) ) ( not ( = ?auto_1935660 ?auto_1935662 ) ) ( not ( = ?auto_1935660 ?auto_1935663 ) ) ( not ( = ?auto_1935660 ?auto_1935664 ) ) ( not ( = ?auto_1935660 ?auto_1935665 ) ) ( not ( = ?auto_1935660 ?auto_1935666 ) ) ( not ( = ?auto_1935660 ?auto_1935667 ) ) ( not ( = ?auto_1935660 ?auto_1935668 ) ) ( not ( = ?auto_1935660 ?auto_1935673 ) ) ( not ( = ?auto_1935661 ?auto_1935662 ) ) ( not ( = ?auto_1935661 ?auto_1935663 ) ) ( not ( = ?auto_1935661 ?auto_1935664 ) ) ( not ( = ?auto_1935661 ?auto_1935665 ) ) ( not ( = ?auto_1935661 ?auto_1935666 ) ) ( not ( = ?auto_1935661 ?auto_1935667 ) ) ( not ( = ?auto_1935661 ?auto_1935668 ) ) ( not ( = ?auto_1935661 ?auto_1935673 ) ) ( not ( = ?auto_1935662 ?auto_1935663 ) ) ( not ( = ?auto_1935662 ?auto_1935664 ) ) ( not ( = ?auto_1935662 ?auto_1935665 ) ) ( not ( = ?auto_1935662 ?auto_1935666 ) ) ( not ( = ?auto_1935662 ?auto_1935667 ) ) ( not ( = ?auto_1935662 ?auto_1935668 ) ) ( not ( = ?auto_1935662 ?auto_1935673 ) ) ( not ( = ?auto_1935663 ?auto_1935664 ) ) ( not ( = ?auto_1935663 ?auto_1935665 ) ) ( not ( = ?auto_1935663 ?auto_1935666 ) ) ( not ( = ?auto_1935663 ?auto_1935667 ) ) ( not ( = ?auto_1935663 ?auto_1935668 ) ) ( not ( = ?auto_1935663 ?auto_1935673 ) ) ( not ( = ?auto_1935664 ?auto_1935665 ) ) ( not ( = ?auto_1935664 ?auto_1935666 ) ) ( not ( = ?auto_1935664 ?auto_1935667 ) ) ( not ( = ?auto_1935664 ?auto_1935668 ) ) ( not ( = ?auto_1935664 ?auto_1935673 ) ) ( not ( = ?auto_1935665 ?auto_1935666 ) ) ( not ( = ?auto_1935665 ?auto_1935667 ) ) ( not ( = ?auto_1935665 ?auto_1935668 ) ) ( not ( = ?auto_1935665 ?auto_1935673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935666 ?auto_1935667 ?auto_1935668 )
      ( MAKE-10CRATE-VERIFY ?auto_1935658 ?auto_1935659 ?auto_1935660 ?auto_1935661 ?auto_1935662 ?auto_1935663 ?auto_1935664 ?auto_1935665 ?auto_1935666 ?auto_1935667 ?auto_1935668 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935784 - SURFACE
      ?auto_1935785 - SURFACE
      ?auto_1935786 - SURFACE
      ?auto_1935787 - SURFACE
      ?auto_1935788 - SURFACE
      ?auto_1935789 - SURFACE
      ?auto_1935790 - SURFACE
      ?auto_1935791 - SURFACE
      ?auto_1935792 - SURFACE
      ?auto_1935793 - SURFACE
      ?auto_1935794 - SURFACE
    )
    :vars
    (
      ?auto_1935800 - HOIST
      ?auto_1935795 - PLACE
      ?auto_1935796 - PLACE
      ?auto_1935799 - HOIST
      ?auto_1935798 - SURFACE
      ?auto_1935797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935800 ?auto_1935795 ) ( IS-CRATE ?auto_1935794 ) ( not ( = ?auto_1935793 ?auto_1935794 ) ) ( not ( = ?auto_1935792 ?auto_1935793 ) ) ( not ( = ?auto_1935792 ?auto_1935794 ) ) ( not ( = ?auto_1935796 ?auto_1935795 ) ) ( HOIST-AT ?auto_1935799 ?auto_1935796 ) ( not ( = ?auto_1935800 ?auto_1935799 ) ) ( AVAILABLE ?auto_1935799 ) ( SURFACE-AT ?auto_1935794 ?auto_1935796 ) ( ON ?auto_1935794 ?auto_1935798 ) ( CLEAR ?auto_1935794 ) ( not ( = ?auto_1935793 ?auto_1935798 ) ) ( not ( = ?auto_1935794 ?auto_1935798 ) ) ( not ( = ?auto_1935792 ?auto_1935798 ) ) ( TRUCK-AT ?auto_1935797 ?auto_1935795 ) ( SURFACE-AT ?auto_1935792 ?auto_1935795 ) ( CLEAR ?auto_1935792 ) ( LIFTING ?auto_1935800 ?auto_1935793 ) ( IS-CRATE ?auto_1935793 ) ( ON ?auto_1935785 ?auto_1935784 ) ( ON ?auto_1935786 ?auto_1935785 ) ( ON ?auto_1935787 ?auto_1935786 ) ( ON ?auto_1935788 ?auto_1935787 ) ( ON ?auto_1935789 ?auto_1935788 ) ( ON ?auto_1935790 ?auto_1935789 ) ( ON ?auto_1935791 ?auto_1935790 ) ( ON ?auto_1935792 ?auto_1935791 ) ( not ( = ?auto_1935784 ?auto_1935785 ) ) ( not ( = ?auto_1935784 ?auto_1935786 ) ) ( not ( = ?auto_1935784 ?auto_1935787 ) ) ( not ( = ?auto_1935784 ?auto_1935788 ) ) ( not ( = ?auto_1935784 ?auto_1935789 ) ) ( not ( = ?auto_1935784 ?auto_1935790 ) ) ( not ( = ?auto_1935784 ?auto_1935791 ) ) ( not ( = ?auto_1935784 ?auto_1935792 ) ) ( not ( = ?auto_1935784 ?auto_1935793 ) ) ( not ( = ?auto_1935784 ?auto_1935794 ) ) ( not ( = ?auto_1935784 ?auto_1935798 ) ) ( not ( = ?auto_1935785 ?auto_1935786 ) ) ( not ( = ?auto_1935785 ?auto_1935787 ) ) ( not ( = ?auto_1935785 ?auto_1935788 ) ) ( not ( = ?auto_1935785 ?auto_1935789 ) ) ( not ( = ?auto_1935785 ?auto_1935790 ) ) ( not ( = ?auto_1935785 ?auto_1935791 ) ) ( not ( = ?auto_1935785 ?auto_1935792 ) ) ( not ( = ?auto_1935785 ?auto_1935793 ) ) ( not ( = ?auto_1935785 ?auto_1935794 ) ) ( not ( = ?auto_1935785 ?auto_1935798 ) ) ( not ( = ?auto_1935786 ?auto_1935787 ) ) ( not ( = ?auto_1935786 ?auto_1935788 ) ) ( not ( = ?auto_1935786 ?auto_1935789 ) ) ( not ( = ?auto_1935786 ?auto_1935790 ) ) ( not ( = ?auto_1935786 ?auto_1935791 ) ) ( not ( = ?auto_1935786 ?auto_1935792 ) ) ( not ( = ?auto_1935786 ?auto_1935793 ) ) ( not ( = ?auto_1935786 ?auto_1935794 ) ) ( not ( = ?auto_1935786 ?auto_1935798 ) ) ( not ( = ?auto_1935787 ?auto_1935788 ) ) ( not ( = ?auto_1935787 ?auto_1935789 ) ) ( not ( = ?auto_1935787 ?auto_1935790 ) ) ( not ( = ?auto_1935787 ?auto_1935791 ) ) ( not ( = ?auto_1935787 ?auto_1935792 ) ) ( not ( = ?auto_1935787 ?auto_1935793 ) ) ( not ( = ?auto_1935787 ?auto_1935794 ) ) ( not ( = ?auto_1935787 ?auto_1935798 ) ) ( not ( = ?auto_1935788 ?auto_1935789 ) ) ( not ( = ?auto_1935788 ?auto_1935790 ) ) ( not ( = ?auto_1935788 ?auto_1935791 ) ) ( not ( = ?auto_1935788 ?auto_1935792 ) ) ( not ( = ?auto_1935788 ?auto_1935793 ) ) ( not ( = ?auto_1935788 ?auto_1935794 ) ) ( not ( = ?auto_1935788 ?auto_1935798 ) ) ( not ( = ?auto_1935789 ?auto_1935790 ) ) ( not ( = ?auto_1935789 ?auto_1935791 ) ) ( not ( = ?auto_1935789 ?auto_1935792 ) ) ( not ( = ?auto_1935789 ?auto_1935793 ) ) ( not ( = ?auto_1935789 ?auto_1935794 ) ) ( not ( = ?auto_1935789 ?auto_1935798 ) ) ( not ( = ?auto_1935790 ?auto_1935791 ) ) ( not ( = ?auto_1935790 ?auto_1935792 ) ) ( not ( = ?auto_1935790 ?auto_1935793 ) ) ( not ( = ?auto_1935790 ?auto_1935794 ) ) ( not ( = ?auto_1935790 ?auto_1935798 ) ) ( not ( = ?auto_1935791 ?auto_1935792 ) ) ( not ( = ?auto_1935791 ?auto_1935793 ) ) ( not ( = ?auto_1935791 ?auto_1935794 ) ) ( not ( = ?auto_1935791 ?auto_1935798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935792 ?auto_1935793 ?auto_1935794 )
      ( MAKE-10CRATE-VERIFY ?auto_1935784 ?auto_1935785 ?auto_1935786 ?auto_1935787 ?auto_1935788 ?auto_1935789 ?auto_1935790 ?auto_1935791 ?auto_1935792 ?auto_1935793 ?auto_1935794 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935910 - SURFACE
      ?auto_1935911 - SURFACE
      ?auto_1935912 - SURFACE
      ?auto_1935913 - SURFACE
      ?auto_1935914 - SURFACE
      ?auto_1935915 - SURFACE
      ?auto_1935916 - SURFACE
      ?auto_1935917 - SURFACE
      ?auto_1935918 - SURFACE
      ?auto_1935919 - SURFACE
      ?auto_1935920 - SURFACE
    )
    :vars
    (
      ?auto_1935921 - HOIST
      ?auto_1935922 - PLACE
      ?auto_1935924 - PLACE
      ?auto_1935923 - HOIST
      ?auto_1935925 - SURFACE
      ?auto_1935926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935921 ?auto_1935922 ) ( IS-CRATE ?auto_1935920 ) ( not ( = ?auto_1935919 ?auto_1935920 ) ) ( not ( = ?auto_1935918 ?auto_1935919 ) ) ( not ( = ?auto_1935918 ?auto_1935920 ) ) ( not ( = ?auto_1935924 ?auto_1935922 ) ) ( HOIST-AT ?auto_1935923 ?auto_1935924 ) ( not ( = ?auto_1935921 ?auto_1935923 ) ) ( AVAILABLE ?auto_1935923 ) ( SURFACE-AT ?auto_1935920 ?auto_1935924 ) ( ON ?auto_1935920 ?auto_1935925 ) ( CLEAR ?auto_1935920 ) ( not ( = ?auto_1935919 ?auto_1935925 ) ) ( not ( = ?auto_1935920 ?auto_1935925 ) ) ( not ( = ?auto_1935918 ?auto_1935925 ) ) ( TRUCK-AT ?auto_1935926 ?auto_1935922 ) ( SURFACE-AT ?auto_1935918 ?auto_1935922 ) ( CLEAR ?auto_1935918 ) ( IS-CRATE ?auto_1935919 ) ( AVAILABLE ?auto_1935921 ) ( IN ?auto_1935919 ?auto_1935926 ) ( ON ?auto_1935911 ?auto_1935910 ) ( ON ?auto_1935912 ?auto_1935911 ) ( ON ?auto_1935913 ?auto_1935912 ) ( ON ?auto_1935914 ?auto_1935913 ) ( ON ?auto_1935915 ?auto_1935914 ) ( ON ?auto_1935916 ?auto_1935915 ) ( ON ?auto_1935917 ?auto_1935916 ) ( ON ?auto_1935918 ?auto_1935917 ) ( not ( = ?auto_1935910 ?auto_1935911 ) ) ( not ( = ?auto_1935910 ?auto_1935912 ) ) ( not ( = ?auto_1935910 ?auto_1935913 ) ) ( not ( = ?auto_1935910 ?auto_1935914 ) ) ( not ( = ?auto_1935910 ?auto_1935915 ) ) ( not ( = ?auto_1935910 ?auto_1935916 ) ) ( not ( = ?auto_1935910 ?auto_1935917 ) ) ( not ( = ?auto_1935910 ?auto_1935918 ) ) ( not ( = ?auto_1935910 ?auto_1935919 ) ) ( not ( = ?auto_1935910 ?auto_1935920 ) ) ( not ( = ?auto_1935910 ?auto_1935925 ) ) ( not ( = ?auto_1935911 ?auto_1935912 ) ) ( not ( = ?auto_1935911 ?auto_1935913 ) ) ( not ( = ?auto_1935911 ?auto_1935914 ) ) ( not ( = ?auto_1935911 ?auto_1935915 ) ) ( not ( = ?auto_1935911 ?auto_1935916 ) ) ( not ( = ?auto_1935911 ?auto_1935917 ) ) ( not ( = ?auto_1935911 ?auto_1935918 ) ) ( not ( = ?auto_1935911 ?auto_1935919 ) ) ( not ( = ?auto_1935911 ?auto_1935920 ) ) ( not ( = ?auto_1935911 ?auto_1935925 ) ) ( not ( = ?auto_1935912 ?auto_1935913 ) ) ( not ( = ?auto_1935912 ?auto_1935914 ) ) ( not ( = ?auto_1935912 ?auto_1935915 ) ) ( not ( = ?auto_1935912 ?auto_1935916 ) ) ( not ( = ?auto_1935912 ?auto_1935917 ) ) ( not ( = ?auto_1935912 ?auto_1935918 ) ) ( not ( = ?auto_1935912 ?auto_1935919 ) ) ( not ( = ?auto_1935912 ?auto_1935920 ) ) ( not ( = ?auto_1935912 ?auto_1935925 ) ) ( not ( = ?auto_1935913 ?auto_1935914 ) ) ( not ( = ?auto_1935913 ?auto_1935915 ) ) ( not ( = ?auto_1935913 ?auto_1935916 ) ) ( not ( = ?auto_1935913 ?auto_1935917 ) ) ( not ( = ?auto_1935913 ?auto_1935918 ) ) ( not ( = ?auto_1935913 ?auto_1935919 ) ) ( not ( = ?auto_1935913 ?auto_1935920 ) ) ( not ( = ?auto_1935913 ?auto_1935925 ) ) ( not ( = ?auto_1935914 ?auto_1935915 ) ) ( not ( = ?auto_1935914 ?auto_1935916 ) ) ( not ( = ?auto_1935914 ?auto_1935917 ) ) ( not ( = ?auto_1935914 ?auto_1935918 ) ) ( not ( = ?auto_1935914 ?auto_1935919 ) ) ( not ( = ?auto_1935914 ?auto_1935920 ) ) ( not ( = ?auto_1935914 ?auto_1935925 ) ) ( not ( = ?auto_1935915 ?auto_1935916 ) ) ( not ( = ?auto_1935915 ?auto_1935917 ) ) ( not ( = ?auto_1935915 ?auto_1935918 ) ) ( not ( = ?auto_1935915 ?auto_1935919 ) ) ( not ( = ?auto_1935915 ?auto_1935920 ) ) ( not ( = ?auto_1935915 ?auto_1935925 ) ) ( not ( = ?auto_1935916 ?auto_1935917 ) ) ( not ( = ?auto_1935916 ?auto_1935918 ) ) ( not ( = ?auto_1935916 ?auto_1935919 ) ) ( not ( = ?auto_1935916 ?auto_1935920 ) ) ( not ( = ?auto_1935916 ?auto_1935925 ) ) ( not ( = ?auto_1935917 ?auto_1935918 ) ) ( not ( = ?auto_1935917 ?auto_1935919 ) ) ( not ( = ?auto_1935917 ?auto_1935920 ) ) ( not ( = ?auto_1935917 ?auto_1935925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935918 ?auto_1935919 ?auto_1935920 )
      ( MAKE-10CRATE-VERIFY ?auto_1935910 ?auto_1935911 ?auto_1935912 ?auto_1935913 ?auto_1935914 ?auto_1935915 ?auto_1935916 ?auto_1935917 ?auto_1935918 ?auto_1935919 ?auto_1935920 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943180 - SURFACE
      ?auto_1943181 - SURFACE
      ?auto_1943182 - SURFACE
      ?auto_1943183 - SURFACE
      ?auto_1943184 - SURFACE
      ?auto_1943185 - SURFACE
      ?auto_1943186 - SURFACE
      ?auto_1943187 - SURFACE
      ?auto_1943188 - SURFACE
      ?auto_1943189 - SURFACE
      ?auto_1943190 - SURFACE
      ?auto_1943191 - SURFACE
    )
    :vars
    (
      ?auto_1943192 - HOIST
      ?auto_1943193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943192 ?auto_1943193 ) ( SURFACE-AT ?auto_1943190 ?auto_1943193 ) ( CLEAR ?auto_1943190 ) ( LIFTING ?auto_1943192 ?auto_1943191 ) ( IS-CRATE ?auto_1943191 ) ( not ( = ?auto_1943190 ?auto_1943191 ) ) ( ON ?auto_1943181 ?auto_1943180 ) ( ON ?auto_1943182 ?auto_1943181 ) ( ON ?auto_1943183 ?auto_1943182 ) ( ON ?auto_1943184 ?auto_1943183 ) ( ON ?auto_1943185 ?auto_1943184 ) ( ON ?auto_1943186 ?auto_1943185 ) ( ON ?auto_1943187 ?auto_1943186 ) ( ON ?auto_1943188 ?auto_1943187 ) ( ON ?auto_1943189 ?auto_1943188 ) ( ON ?auto_1943190 ?auto_1943189 ) ( not ( = ?auto_1943180 ?auto_1943181 ) ) ( not ( = ?auto_1943180 ?auto_1943182 ) ) ( not ( = ?auto_1943180 ?auto_1943183 ) ) ( not ( = ?auto_1943180 ?auto_1943184 ) ) ( not ( = ?auto_1943180 ?auto_1943185 ) ) ( not ( = ?auto_1943180 ?auto_1943186 ) ) ( not ( = ?auto_1943180 ?auto_1943187 ) ) ( not ( = ?auto_1943180 ?auto_1943188 ) ) ( not ( = ?auto_1943180 ?auto_1943189 ) ) ( not ( = ?auto_1943180 ?auto_1943190 ) ) ( not ( = ?auto_1943180 ?auto_1943191 ) ) ( not ( = ?auto_1943181 ?auto_1943182 ) ) ( not ( = ?auto_1943181 ?auto_1943183 ) ) ( not ( = ?auto_1943181 ?auto_1943184 ) ) ( not ( = ?auto_1943181 ?auto_1943185 ) ) ( not ( = ?auto_1943181 ?auto_1943186 ) ) ( not ( = ?auto_1943181 ?auto_1943187 ) ) ( not ( = ?auto_1943181 ?auto_1943188 ) ) ( not ( = ?auto_1943181 ?auto_1943189 ) ) ( not ( = ?auto_1943181 ?auto_1943190 ) ) ( not ( = ?auto_1943181 ?auto_1943191 ) ) ( not ( = ?auto_1943182 ?auto_1943183 ) ) ( not ( = ?auto_1943182 ?auto_1943184 ) ) ( not ( = ?auto_1943182 ?auto_1943185 ) ) ( not ( = ?auto_1943182 ?auto_1943186 ) ) ( not ( = ?auto_1943182 ?auto_1943187 ) ) ( not ( = ?auto_1943182 ?auto_1943188 ) ) ( not ( = ?auto_1943182 ?auto_1943189 ) ) ( not ( = ?auto_1943182 ?auto_1943190 ) ) ( not ( = ?auto_1943182 ?auto_1943191 ) ) ( not ( = ?auto_1943183 ?auto_1943184 ) ) ( not ( = ?auto_1943183 ?auto_1943185 ) ) ( not ( = ?auto_1943183 ?auto_1943186 ) ) ( not ( = ?auto_1943183 ?auto_1943187 ) ) ( not ( = ?auto_1943183 ?auto_1943188 ) ) ( not ( = ?auto_1943183 ?auto_1943189 ) ) ( not ( = ?auto_1943183 ?auto_1943190 ) ) ( not ( = ?auto_1943183 ?auto_1943191 ) ) ( not ( = ?auto_1943184 ?auto_1943185 ) ) ( not ( = ?auto_1943184 ?auto_1943186 ) ) ( not ( = ?auto_1943184 ?auto_1943187 ) ) ( not ( = ?auto_1943184 ?auto_1943188 ) ) ( not ( = ?auto_1943184 ?auto_1943189 ) ) ( not ( = ?auto_1943184 ?auto_1943190 ) ) ( not ( = ?auto_1943184 ?auto_1943191 ) ) ( not ( = ?auto_1943185 ?auto_1943186 ) ) ( not ( = ?auto_1943185 ?auto_1943187 ) ) ( not ( = ?auto_1943185 ?auto_1943188 ) ) ( not ( = ?auto_1943185 ?auto_1943189 ) ) ( not ( = ?auto_1943185 ?auto_1943190 ) ) ( not ( = ?auto_1943185 ?auto_1943191 ) ) ( not ( = ?auto_1943186 ?auto_1943187 ) ) ( not ( = ?auto_1943186 ?auto_1943188 ) ) ( not ( = ?auto_1943186 ?auto_1943189 ) ) ( not ( = ?auto_1943186 ?auto_1943190 ) ) ( not ( = ?auto_1943186 ?auto_1943191 ) ) ( not ( = ?auto_1943187 ?auto_1943188 ) ) ( not ( = ?auto_1943187 ?auto_1943189 ) ) ( not ( = ?auto_1943187 ?auto_1943190 ) ) ( not ( = ?auto_1943187 ?auto_1943191 ) ) ( not ( = ?auto_1943188 ?auto_1943189 ) ) ( not ( = ?auto_1943188 ?auto_1943190 ) ) ( not ( = ?auto_1943188 ?auto_1943191 ) ) ( not ( = ?auto_1943189 ?auto_1943190 ) ) ( not ( = ?auto_1943189 ?auto_1943191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1943190 ?auto_1943191 )
      ( MAKE-11CRATE-VERIFY ?auto_1943180 ?auto_1943181 ?auto_1943182 ?auto_1943183 ?auto_1943184 ?auto_1943185 ?auto_1943186 ?auto_1943187 ?auto_1943188 ?auto_1943189 ?auto_1943190 ?auto_1943191 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943289 - SURFACE
      ?auto_1943290 - SURFACE
      ?auto_1943291 - SURFACE
      ?auto_1943292 - SURFACE
      ?auto_1943293 - SURFACE
      ?auto_1943294 - SURFACE
      ?auto_1943295 - SURFACE
      ?auto_1943296 - SURFACE
      ?auto_1943297 - SURFACE
      ?auto_1943298 - SURFACE
      ?auto_1943299 - SURFACE
      ?auto_1943300 - SURFACE
    )
    :vars
    (
      ?auto_1943303 - HOIST
      ?auto_1943301 - PLACE
      ?auto_1943302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943303 ?auto_1943301 ) ( SURFACE-AT ?auto_1943299 ?auto_1943301 ) ( CLEAR ?auto_1943299 ) ( IS-CRATE ?auto_1943300 ) ( not ( = ?auto_1943299 ?auto_1943300 ) ) ( TRUCK-AT ?auto_1943302 ?auto_1943301 ) ( AVAILABLE ?auto_1943303 ) ( IN ?auto_1943300 ?auto_1943302 ) ( ON ?auto_1943299 ?auto_1943298 ) ( not ( = ?auto_1943298 ?auto_1943299 ) ) ( not ( = ?auto_1943298 ?auto_1943300 ) ) ( ON ?auto_1943290 ?auto_1943289 ) ( ON ?auto_1943291 ?auto_1943290 ) ( ON ?auto_1943292 ?auto_1943291 ) ( ON ?auto_1943293 ?auto_1943292 ) ( ON ?auto_1943294 ?auto_1943293 ) ( ON ?auto_1943295 ?auto_1943294 ) ( ON ?auto_1943296 ?auto_1943295 ) ( ON ?auto_1943297 ?auto_1943296 ) ( ON ?auto_1943298 ?auto_1943297 ) ( not ( = ?auto_1943289 ?auto_1943290 ) ) ( not ( = ?auto_1943289 ?auto_1943291 ) ) ( not ( = ?auto_1943289 ?auto_1943292 ) ) ( not ( = ?auto_1943289 ?auto_1943293 ) ) ( not ( = ?auto_1943289 ?auto_1943294 ) ) ( not ( = ?auto_1943289 ?auto_1943295 ) ) ( not ( = ?auto_1943289 ?auto_1943296 ) ) ( not ( = ?auto_1943289 ?auto_1943297 ) ) ( not ( = ?auto_1943289 ?auto_1943298 ) ) ( not ( = ?auto_1943289 ?auto_1943299 ) ) ( not ( = ?auto_1943289 ?auto_1943300 ) ) ( not ( = ?auto_1943290 ?auto_1943291 ) ) ( not ( = ?auto_1943290 ?auto_1943292 ) ) ( not ( = ?auto_1943290 ?auto_1943293 ) ) ( not ( = ?auto_1943290 ?auto_1943294 ) ) ( not ( = ?auto_1943290 ?auto_1943295 ) ) ( not ( = ?auto_1943290 ?auto_1943296 ) ) ( not ( = ?auto_1943290 ?auto_1943297 ) ) ( not ( = ?auto_1943290 ?auto_1943298 ) ) ( not ( = ?auto_1943290 ?auto_1943299 ) ) ( not ( = ?auto_1943290 ?auto_1943300 ) ) ( not ( = ?auto_1943291 ?auto_1943292 ) ) ( not ( = ?auto_1943291 ?auto_1943293 ) ) ( not ( = ?auto_1943291 ?auto_1943294 ) ) ( not ( = ?auto_1943291 ?auto_1943295 ) ) ( not ( = ?auto_1943291 ?auto_1943296 ) ) ( not ( = ?auto_1943291 ?auto_1943297 ) ) ( not ( = ?auto_1943291 ?auto_1943298 ) ) ( not ( = ?auto_1943291 ?auto_1943299 ) ) ( not ( = ?auto_1943291 ?auto_1943300 ) ) ( not ( = ?auto_1943292 ?auto_1943293 ) ) ( not ( = ?auto_1943292 ?auto_1943294 ) ) ( not ( = ?auto_1943292 ?auto_1943295 ) ) ( not ( = ?auto_1943292 ?auto_1943296 ) ) ( not ( = ?auto_1943292 ?auto_1943297 ) ) ( not ( = ?auto_1943292 ?auto_1943298 ) ) ( not ( = ?auto_1943292 ?auto_1943299 ) ) ( not ( = ?auto_1943292 ?auto_1943300 ) ) ( not ( = ?auto_1943293 ?auto_1943294 ) ) ( not ( = ?auto_1943293 ?auto_1943295 ) ) ( not ( = ?auto_1943293 ?auto_1943296 ) ) ( not ( = ?auto_1943293 ?auto_1943297 ) ) ( not ( = ?auto_1943293 ?auto_1943298 ) ) ( not ( = ?auto_1943293 ?auto_1943299 ) ) ( not ( = ?auto_1943293 ?auto_1943300 ) ) ( not ( = ?auto_1943294 ?auto_1943295 ) ) ( not ( = ?auto_1943294 ?auto_1943296 ) ) ( not ( = ?auto_1943294 ?auto_1943297 ) ) ( not ( = ?auto_1943294 ?auto_1943298 ) ) ( not ( = ?auto_1943294 ?auto_1943299 ) ) ( not ( = ?auto_1943294 ?auto_1943300 ) ) ( not ( = ?auto_1943295 ?auto_1943296 ) ) ( not ( = ?auto_1943295 ?auto_1943297 ) ) ( not ( = ?auto_1943295 ?auto_1943298 ) ) ( not ( = ?auto_1943295 ?auto_1943299 ) ) ( not ( = ?auto_1943295 ?auto_1943300 ) ) ( not ( = ?auto_1943296 ?auto_1943297 ) ) ( not ( = ?auto_1943296 ?auto_1943298 ) ) ( not ( = ?auto_1943296 ?auto_1943299 ) ) ( not ( = ?auto_1943296 ?auto_1943300 ) ) ( not ( = ?auto_1943297 ?auto_1943298 ) ) ( not ( = ?auto_1943297 ?auto_1943299 ) ) ( not ( = ?auto_1943297 ?auto_1943300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943298 ?auto_1943299 ?auto_1943300 )
      ( MAKE-11CRATE-VERIFY ?auto_1943289 ?auto_1943290 ?auto_1943291 ?auto_1943292 ?auto_1943293 ?auto_1943294 ?auto_1943295 ?auto_1943296 ?auto_1943297 ?auto_1943298 ?auto_1943299 ?auto_1943300 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943410 - SURFACE
      ?auto_1943411 - SURFACE
      ?auto_1943412 - SURFACE
      ?auto_1943413 - SURFACE
      ?auto_1943414 - SURFACE
      ?auto_1943415 - SURFACE
      ?auto_1943416 - SURFACE
      ?auto_1943417 - SURFACE
      ?auto_1943418 - SURFACE
      ?auto_1943419 - SURFACE
      ?auto_1943420 - SURFACE
      ?auto_1943421 - SURFACE
    )
    :vars
    (
      ?auto_1943425 - HOIST
      ?auto_1943424 - PLACE
      ?auto_1943423 - TRUCK
      ?auto_1943422 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943425 ?auto_1943424 ) ( SURFACE-AT ?auto_1943420 ?auto_1943424 ) ( CLEAR ?auto_1943420 ) ( IS-CRATE ?auto_1943421 ) ( not ( = ?auto_1943420 ?auto_1943421 ) ) ( AVAILABLE ?auto_1943425 ) ( IN ?auto_1943421 ?auto_1943423 ) ( ON ?auto_1943420 ?auto_1943419 ) ( not ( = ?auto_1943419 ?auto_1943420 ) ) ( not ( = ?auto_1943419 ?auto_1943421 ) ) ( TRUCK-AT ?auto_1943423 ?auto_1943422 ) ( not ( = ?auto_1943422 ?auto_1943424 ) ) ( ON ?auto_1943411 ?auto_1943410 ) ( ON ?auto_1943412 ?auto_1943411 ) ( ON ?auto_1943413 ?auto_1943412 ) ( ON ?auto_1943414 ?auto_1943413 ) ( ON ?auto_1943415 ?auto_1943414 ) ( ON ?auto_1943416 ?auto_1943415 ) ( ON ?auto_1943417 ?auto_1943416 ) ( ON ?auto_1943418 ?auto_1943417 ) ( ON ?auto_1943419 ?auto_1943418 ) ( not ( = ?auto_1943410 ?auto_1943411 ) ) ( not ( = ?auto_1943410 ?auto_1943412 ) ) ( not ( = ?auto_1943410 ?auto_1943413 ) ) ( not ( = ?auto_1943410 ?auto_1943414 ) ) ( not ( = ?auto_1943410 ?auto_1943415 ) ) ( not ( = ?auto_1943410 ?auto_1943416 ) ) ( not ( = ?auto_1943410 ?auto_1943417 ) ) ( not ( = ?auto_1943410 ?auto_1943418 ) ) ( not ( = ?auto_1943410 ?auto_1943419 ) ) ( not ( = ?auto_1943410 ?auto_1943420 ) ) ( not ( = ?auto_1943410 ?auto_1943421 ) ) ( not ( = ?auto_1943411 ?auto_1943412 ) ) ( not ( = ?auto_1943411 ?auto_1943413 ) ) ( not ( = ?auto_1943411 ?auto_1943414 ) ) ( not ( = ?auto_1943411 ?auto_1943415 ) ) ( not ( = ?auto_1943411 ?auto_1943416 ) ) ( not ( = ?auto_1943411 ?auto_1943417 ) ) ( not ( = ?auto_1943411 ?auto_1943418 ) ) ( not ( = ?auto_1943411 ?auto_1943419 ) ) ( not ( = ?auto_1943411 ?auto_1943420 ) ) ( not ( = ?auto_1943411 ?auto_1943421 ) ) ( not ( = ?auto_1943412 ?auto_1943413 ) ) ( not ( = ?auto_1943412 ?auto_1943414 ) ) ( not ( = ?auto_1943412 ?auto_1943415 ) ) ( not ( = ?auto_1943412 ?auto_1943416 ) ) ( not ( = ?auto_1943412 ?auto_1943417 ) ) ( not ( = ?auto_1943412 ?auto_1943418 ) ) ( not ( = ?auto_1943412 ?auto_1943419 ) ) ( not ( = ?auto_1943412 ?auto_1943420 ) ) ( not ( = ?auto_1943412 ?auto_1943421 ) ) ( not ( = ?auto_1943413 ?auto_1943414 ) ) ( not ( = ?auto_1943413 ?auto_1943415 ) ) ( not ( = ?auto_1943413 ?auto_1943416 ) ) ( not ( = ?auto_1943413 ?auto_1943417 ) ) ( not ( = ?auto_1943413 ?auto_1943418 ) ) ( not ( = ?auto_1943413 ?auto_1943419 ) ) ( not ( = ?auto_1943413 ?auto_1943420 ) ) ( not ( = ?auto_1943413 ?auto_1943421 ) ) ( not ( = ?auto_1943414 ?auto_1943415 ) ) ( not ( = ?auto_1943414 ?auto_1943416 ) ) ( not ( = ?auto_1943414 ?auto_1943417 ) ) ( not ( = ?auto_1943414 ?auto_1943418 ) ) ( not ( = ?auto_1943414 ?auto_1943419 ) ) ( not ( = ?auto_1943414 ?auto_1943420 ) ) ( not ( = ?auto_1943414 ?auto_1943421 ) ) ( not ( = ?auto_1943415 ?auto_1943416 ) ) ( not ( = ?auto_1943415 ?auto_1943417 ) ) ( not ( = ?auto_1943415 ?auto_1943418 ) ) ( not ( = ?auto_1943415 ?auto_1943419 ) ) ( not ( = ?auto_1943415 ?auto_1943420 ) ) ( not ( = ?auto_1943415 ?auto_1943421 ) ) ( not ( = ?auto_1943416 ?auto_1943417 ) ) ( not ( = ?auto_1943416 ?auto_1943418 ) ) ( not ( = ?auto_1943416 ?auto_1943419 ) ) ( not ( = ?auto_1943416 ?auto_1943420 ) ) ( not ( = ?auto_1943416 ?auto_1943421 ) ) ( not ( = ?auto_1943417 ?auto_1943418 ) ) ( not ( = ?auto_1943417 ?auto_1943419 ) ) ( not ( = ?auto_1943417 ?auto_1943420 ) ) ( not ( = ?auto_1943417 ?auto_1943421 ) ) ( not ( = ?auto_1943418 ?auto_1943419 ) ) ( not ( = ?auto_1943418 ?auto_1943420 ) ) ( not ( = ?auto_1943418 ?auto_1943421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943419 ?auto_1943420 ?auto_1943421 )
      ( MAKE-11CRATE-VERIFY ?auto_1943410 ?auto_1943411 ?auto_1943412 ?auto_1943413 ?auto_1943414 ?auto_1943415 ?auto_1943416 ?auto_1943417 ?auto_1943418 ?auto_1943419 ?auto_1943420 ?auto_1943421 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943542 - SURFACE
      ?auto_1943543 - SURFACE
      ?auto_1943544 - SURFACE
      ?auto_1943545 - SURFACE
      ?auto_1943546 - SURFACE
      ?auto_1943547 - SURFACE
      ?auto_1943548 - SURFACE
      ?auto_1943549 - SURFACE
      ?auto_1943550 - SURFACE
      ?auto_1943551 - SURFACE
      ?auto_1943552 - SURFACE
      ?auto_1943553 - SURFACE
    )
    :vars
    (
      ?auto_1943556 - HOIST
      ?auto_1943555 - PLACE
      ?auto_1943554 - TRUCK
      ?auto_1943557 - PLACE
      ?auto_1943558 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943556 ?auto_1943555 ) ( SURFACE-AT ?auto_1943552 ?auto_1943555 ) ( CLEAR ?auto_1943552 ) ( IS-CRATE ?auto_1943553 ) ( not ( = ?auto_1943552 ?auto_1943553 ) ) ( AVAILABLE ?auto_1943556 ) ( ON ?auto_1943552 ?auto_1943551 ) ( not ( = ?auto_1943551 ?auto_1943552 ) ) ( not ( = ?auto_1943551 ?auto_1943553 ) ) ( TRUCK-AT ?auto_1943554 ?auto_1943557 ) ( not ( = ?auto_1943557 ?auto_1943555 ) ) ( HOIST-AT ?auto_1943558 ?auto_1943557 ) ( LIFTING ?auto_1943558 ?auto_1943553 ) ( not ( = ?auto_1943556 ?auto_1943558 ) ) ( ON ?auto_1943543 ?auto_1943542 ) ( ON ?auto_1943544 ?auto_1943543 ) ( ON ?auto_1943545 ?auto_1943544 ) ( ON ?auto_1943546 ?auto_1943545 ) ( ON ?auto_1943547 ?auto_1943546 ) ( ON ?auto_1943548 ?auto_1943547 ) ( ON ?auto_1943549 ?auto_1943548 ) ( ON ?auto_1943550 ?auto_1943549 ) ( ON ?auto_1943551 ?auto_1943550 ) ( not ( = ?auto_1943542 ?auto_1943543 ) ) ( not ( = ?auto_1943542 ?auto_1943544 ) ) ( not ( = ?auto_1943542 ?auto_1943545 ) ) ( not ( = ?auto_1943542 ?auto_1943546 ) ) ( not ( = ?auto_1943542 ?auto_1943547 ) ) ( not ( = ?auto_1943542 ?auto_1943548 ) ) ( not ( = ?auto_1943542 ?auto_1943549 ) ) ( not ( = ?auto_1943542 ?auto_1943550 ) ) ( not ( = ?auto_1943542 ?auto_1943551 ) ) ( not ( = ?auto_1943542 ?auto_1943552 ) ) ( not ( = ?auto_1943542 ?auto_1943553 ) ) ( not ( = ?auto_1943543 ?auto_1943544 ) ) ( not ( = ?auto_1943543 ?auto_1943545 ) ) ( not ( = ?auto_1943543 ?auto_1943546 ) ) ( not ( = ?auto_1943543 ?auto_1943547 ) ) ( not ( = ?auto_1943543 ?auto_1943548 ) ) ( not ( = ?auto_1943543 ?auto_1943549 ) ) ( not ( = ?auto_1943543 ?auto_1943550 ) ) ( not ( = ?auto_1943543 ?auto_1943551 ) ) ( not ( = ?auto_1943543 ?auto_1943552 ) ) ( not ( = ?auto_1943543 ?auto_1943553 ) ) ( not ( = ?auto_1943544 ?auto_1943545 ) ) ( not ( = ?auto_1943544 ?auto_1943546 ) ) ( not ( = ?auto_1943544 ?auto_1943547 ) ) ( not ( = ?auto_1943544 ?auto_1943548 ) ) ( not ( = ?auto_1943544 ?auto_1943549 ) ) ( not ( = ?auto_1943544 ?auto_1943550 ) ) ( not ( = ?auto_1943544 ?auto_1943551 ) ) ( not ( = ?auto_1943544 ?auto_1943552 ) ) ( not ( = ?auto_1943544 ?auto_1943553 ) ) ( not ( = ?auto_1943545 ?auto_1943546 ) ) ( not ( = ?auto_1943545 ?auto_1943547 ) ) ( not ( = ?auto_1943545 ?auto_1943548 ) ) ( not ( = ?auto_1943545 ?auto_1943549 ) ) ( not ( = ?auto_1943545 ?auto_1943550 ) ) ( not ( = ?auto_1943545 ?auto_1943551 ) ) ( not ( = ?auto_1943545 ?auto_1943552 ) ) ( not ( = ?auto_1943545 ?auto_1943553 ) ) ( not ( = ?auto_1943546 ?auto_1943547 ) ) ( not ( = ?auto_1943546 ?auto_1943548 ) ) ( not ( = ?auto_1943546 ?auto_1943549 ) ) ( not ( = ?auto_1943546 ?auto_1943550 ) ) ( not ( = ?auto_1943546 ?auto_1943551 ) ) ( not ( = ?auto_1943546 ?auto_1943552 ) ) ( not ( = ?auto_1943546 ?auto_1943553 ) ) ( not ( = ?auto_1943547 ?auto_1943548 ) ) ( not ( = ?auto_1943547 ?auto_1943549 ) ) ( not ( = ?auto_1943547 ?auto_1943550 ) ) ( not ( = ?auto_1943547 ?auto_1943551 ) ) ( not ( = ?auto_1943547 ?auto_1943552 ) ) ( not ( = ?auto_1943547 ?auto_1943553 ) ) ( not ( = ?auto_1943548 ?auto_1943549 ) ) ( not ( = ?auto_1943548 ?auto_1943550 ) ) ( not ( = ?auto_1943548 ?auto_1943551 ) ) ( not ( = ?auto_1943548 ?auto_1943552 ) ) ( not ( = ?auto_1943548 ?auto_1943553 ) ) ( not ( = ?auto_1943549 ?auto_1943550 ) ) ( not ( = ?auto_1943549 ?auto_1943551 ) ) ( not ( = ?auto_1943549 ?auto_1943552 ) ) ( not ( = ?auto_1943549 ?auto_1943553 ) ) ( not ( = ?auto_1943550 ?auto_1943551 ) ) ( not ( = ?auto_1943550 ?auto_1943552 ) ) ( not ( = ?auto_1943550 ?auto_1943553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943551 ?auto_1943552 ?auto_1943553 )
      ( MAKE-11CRATE-VERIFY ?auto_1943542 ?auto_1943543 ?auto_1943544 ?auto_1943545 ?auto_1943546 ?auto_1943547 ?auto_1943548 ?auto_1943549 ?auto_1943550 ?auto_1943551 ?auto_1943552 ?auto_1943553 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943685 - SURFACE
      ?auto_1943686 - SURFACE
      ?auto_1943687 - SURFACE
      ?auto_1943688 - SURFACE
      ?auto_1943689 - SURFACE
      ?auto_1943690 - SURFACE
      ?auto_1943691 - SURFACE
      ?auto_1943692 - SURFACE
      ?auto_1943693 - SURFACE
      ?auto_1943694 - SURFACE
      ?auto_1943695 - SURFACE
      ?auto_1943696 - SURFACE
    )
    :vars
    (
      ?auto_1943697 - HOIST
      ?auto_1943701 - PLACE
      ?auto_1943699 - TRUCK
      ?auto_1943700 - PLACE
      ?auto_1943702 - HOIST
      ?auto_1943698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943697 ?auto_1943701 ) ( SURFACE-AT ?auto_1943695 ?auto_1943701 ) ( CLEAR ?auto_1943695 ) ( IS-CRATE ?auto_1943696 ) ( not ( = ?auto_1943695 ?auto_1943696 ) ) ( AVAILABLE ?auto_1943697 ) ( ON ?auto_1943695 ?auto_1943694 ) ( not ( = ?auto_1943694 ?auto_1943695 ) ) ( not ( = ?auto_1943694 ?auto_1943696 ) ) ( TRUCK-AT ?auto_1943699 ?auto_1943700 ) ( not ( = ?auto_1943700 ?auto_1943701 ) ) ( HOIST-AT ?auto_1943702 ?auto_1943700 ) ( not ( = ?auto_1943697 ?auto_1943702 ) ) ( AVAILABLE ?auto_1943702 ) ( SURFACE-AT ?auto_1943696 ?auto_1943700 ) ( ON ?auto_1943696 ?auto_1943698 ) ( CLEAR ?auto_1943696 ) ( not ( = ?auto_1943695 ?auto_1943698 ) ) ( not ( = ?auto_1943696 ?auto_1943698 ) ) ( not ( = ?auto_1943694 ?auto_1943698 ) ) ( ON ?auto_1943686 ?auto_1943685 ) ( ON ?auto_1943687 ?auto_1943686 ) ( ON ?auto_1943688 ?auto_1943687 ) ( ON ?auto_1943689 ?auto_1943688 ) ( ON ?auto_1943690 ?auto_1943689 ) ( ON ?auto_1943691 ?auto_1943690 ) ( ON ?auto_1943692 ?auto_1943691 ) ( ON ?auto_1943693 ?auto_1943692 ) ( ON ?auto_1943694 ?auto_1943693 ) ( not ( = ?auto_1943685 ?auto_1943686 ) ) ( not ( = ?auto_1943685 ?auto_1943687 ) ) ( not ( = ?auto_1943685 ?auto_1943688 ) ) ( not ( = ?auto_1943685 ?auto_1943689 ) ) ( not ( = ?auto_1943685 ?auto_1943690 ) ) ( not ( = ?auto_1943685 ?auto_1943691 ) ) ( not ( = ?auto_1943685 ?auto_1943692 ) ) ( not ( = ?auto_1943685 ?auto_1943693 ) ) ( not ( = ?auto_1943685 ?auto_1943694 ) ) ( not ( = ?auto_1943685 ?auto_1943695 ) ) ( not ( = ?auto_1943685 ?auto_1943696 ) ) ( not ( = ?auto_1943685 ?auto_1943698 ) ) ( not ( = ?auto_1943686 ?auto_1943687 ) ) ( not ( = ?auto_1943686 ?auto_1943688 ) ) ( not ( = ?auto_1943686 ?auto_1943689 ) ) ( not ( = ?auto_1943686 ?auto_1943690 ) ) ( not ( = ?auto_1943686 ?auto_1943691 ) ) ( not ( = ?auto_1943686 ?auto_1943692 ) ) ( not ( = ?auto_1943686 ?auto_1943693 ) ) ( not ( = ?auto_1943686 ?auto_1943694 ) ) ( not ( = ?auto_1943686 ?auto_1943695 ) ) ( not ( = ?auto_1943686 ?auto_1943696 ) ) ( not ( = ?auto_1943686 ?auto_1943698 ) ) ( not ( = ?auto_1943687 ?auto_1943688 ) ) ( not ( = ?auto_1943687 ?auto_1943689 ) ) ( not ( = ?auto_1943687 ?auto_1943690 ) ) ( not ( = ?auto_1943687 ?auto_1943691 ) ) ( not ( = ?auto_1943687 ?auto_1943692 ) ) ( not ( = ?auto_1943687 ?auto_1943693 ) ) ( not ( = ?auto_1943687 ?auto_1943694 ) ) ( not ( = ?auto_1943687 ?auto_1943695 ) ) ( not ( = ?auto_1943687 ?auto_1943696 ) ) ( not ( = ?auto_1943687 ?auto_1943698 ) ) ( not ( = ?auto_1943688 ?auto_1943689 ) ) ( not ( = ?auto_1943688 ?auto_1943690 ) ) ( not ( = ?auto_1943688 ?auto_1943691 ) ) ( not ( = ?auto_1943688 ?auto_1943692 ) ) ( not ( = ?auto_1943688 ?auto_1943693 ) ) ( not ( = ?auto_1943688 ?auto_1943694 ) ) ( not ( = ?auto_1943688 ?auto_1943695 ) ) ( not ( = ?auto_1943688 ?auto_1943696 ) ) ( not ( = ?auto_1943688 ?auto_1943698 ) ) ( not ( = ?auto_1943689 ?auto_1943690 ) ) ( not ( = ?auto_1943689 ?auto_1943691 ) ) ( not ( = ?auto_1943689 ?auto_1943692 ) ) ( not ( = ?auto_1943689 ?auto_1943693 ) ) ( not ( = ?auto_1943689 ?auto_1943694 ) ) ( not ( = ?auto_1943689 ?auto_1943695 ) ) ( not ( = ?auto_1943689 ?auto_1943696 ) ) ( not ( = ?auto_1943689 ?auto_1943698 ) ) ( not ( = ?auto_1943690 ?auto_1943691 ) ) ( not ( = ?auto_1943690 ?auto_1943692 ) ) ( not ( = ?auto_1943690 ?auto_1943693 ) ) ( not ( = ?auto_1943690 ?auto_1943694 ) ) ( not ( = ?auto_1943690 ?auto_1943695 ) ) ( not ( = ?auto_1943690 ?auto_1943696 ) ) ( not ( = ?auto_1943690 ?auto_1943698 ) ) ( not ( = ?auto_1943691 ?auto_1943692 ) ) ( not ( = ?auto_1943691 ?auto_1943693 ) ) ( not ( = ?auto_1943691 ?auto_1943694 ) ) ( not ( = ?auto_1943691 ?auto_1943695 ) ) ( not ( = ?auto_1943691 ?auto_1943696 ) ) ( not ( = ?auto_1943691 ?auto_1943698 ) ) ( not ( = ?auto_1943692 ?auto_1943693 ) ) ( not ( = ?auto_1943692 ?auto_1943694 ) ) ( not ( = ?auto_1943692 ?auto_1943695 ) ) ( not ( = ?auto_1943692 ?auto_1943696 ) ) ( not ( = ?auto_1943692 ?auto_1943698 ) ) ( not ( = ?auto_1943693 ?auto_1943694 ) ) ( not ( = ?auto_1943693 ?auto_1943695 ) ) ( not ( = ?auto_1943693 ?auto_1943696 ) ) ( not ( = ?auto_1943693 ?auto_1943698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943694 ?auto_1943695 ?auto_1943696 )
      ( MAKE-11CRATE-VERIFY ?auto_1943685 ?auto_1943686 ?auto_1943687 ?auto_1943688 ?auto_1943689 ?auto_1943690 ?auto_1943691 ?auto_1943692 ?auto_1943693 ?auto_1943694 ?auto_1943695 ?auto_1943696 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943829 - SURFACE
      ?auto_1943830 - SURFACE
      ?auto_1943831 - SURFACE
      ?auto_1943832 - SURFACE
      ?auto_1943833 - SURFACE
      ?auto_1943834 - SURFACE
      ?auto_1943835 - SURFACE
      ?auto_1943836 - SURFACE
      ?auto_1943837 - SURFACE
      ?auto_1943838 - SURFACE
      ?auto_1943839 - SURFACE
      ?auto_1943840 - SURFACE
    )
    :vars
    (
      ?auto_1943843 - HOIST
      ?auto_1943845 - PLACE
      ?auto_1943844 - PLACE
      ?auto_1943846 - HOIST
      ?auto_1943842 - SURFACE
      ?auto_1943841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943843 ?auto_1943845 ) ( SURFACE-AT ?auto_1943839 ?auto_1943845 ) ( CLEAR ?auto_1943839 ) ( IS-CRATE ?auto_1943840 ) ( not ( = ?auto_1943839 ?auto_1943840 ) ) ( AVAILABLE ?auto_1943843 ) ( ON ?auto_1943839 ?auto_1943838 ) ( not ( = ?auto_1943838 ?auto_1943839 ) ) ( not ( = ?auto_1943838 ?auto_1943840 ) ) ( not ( = ?auto_1943844 ?auto_1943845 ) ) ( HOIST-AT ?auto_1943846 ?auto_1943844 ) ( not ( = ?auto_1943843 ?auto_1943846 ) ) ( AVAILABLE ?auto_1943846 ) ( SURFACE-AT ?auto_1943840 ?auto_1943844 ) ( ON ?auto_1943840 ?auto_1943842 ) ( CLEAR ?auto_1943840 ) ( not ( = ?auto_1943839 ?auto_1943842 ) ) ( not ( = ?auto_1943840 ?auto_1943842 ) ) ( not ( = ?auto_1943838 ?auto_1943842 ) ) ( TRUCK-AT ?auto_1943841 ?auto_1943845 ) ( ON ?auto_1943830 ?auto_1943829 ) ( ON ?auto_1943831 ?auto_1943830 ) ( ON ?auto_1943832 ?auto_1943831 ) ( ON ?auto_1943833 ?auto_1943832 ) ( ON ?auto_1943834 ?auto_1943833 ) ( ON ?auto_1943835 ?auto_1943834 ) ( ON ?auto_1943836 ?auto_1943835 ) ( ON ?auto_1943837 ?auto_1943836 ) ( ON ?auto_1943838 ?auto_1943837 ) ( not ( = ?auto_1943829 ?auto_1943830 ) ) ( not ( = ?auto_1943829 ?auto_1943831 ) ) ( not ( = ?auto_1943829 ?auto_1943832 ) ) ( not ( = ?auto_1943829 ?auto_1943833 ) ) ( not ( = ?auto_1943829 ?auto_1943834 ) ) ( not ( = ?auto_1943829 ?auto_1943835 ) ) ( not ( = ?auto_1943829 ?auto_1943836 ) ) ( not ( = ?auto_1943829 ?auto_1943837 ) ) ( not ( = ?auto_1943829 ?auto_1943838 ) ) ( not ( = ?auto_1943829 ?auto_1943839 ) ) ( not ( = ?auto_1943829 ?auto_1943840 ) ) ( not ( = ?auto_1943829 ?auto_1943842 ) ) ( not ( = ?auto_1943830 ?auto_1943831 ) ) ( not ( = ?auto_1943830 ?auto_1943832 ) ) ( not ( = ?auto_1943830 ?auto_1943833 ) ) ( not ( = ?auto_1943830 ?auto_1943834 ) ) ( not ( = ?auto_1943830 ?auto_1943835 ) ) ( not ( = ?auto_1943830 ?auto_1943836 ) ) ( not ( = ?auto_1943830 ?auto_1943837 ) ) ( not ( = ?auto_1943830 ?auto_1943838 ) ) ( not ( = ?auto_1943830 ?auto_1943839 ) ) ( not ( = ?auto_1943830 ?auto_1943840 ) ) ( not ( = ?auto_1943830 ?auto_1943842 ) ) ( not ( = ?auto_1943831 ?auto_1943832 ) ) ( not ( = ?auto_1943831 ?auto_1943833 ) ) ( not ( = ?auto_1943831 ?auto_1943834 ) ) ( not ( = ?auto_1943831 ?auto_1943835 ) ) ( not ( = ?auto_1943831 ?auto_1943836 ) ) ( not ( = ?auto_1943831 ?auto_1943837 ) ) ( not ( = ?auto_1943831 ?auto_1943838 ) ) ( not ( = ?auto_1943831 ?auto_1943839 ) ) ( not ( = ?auto_1943831 ?auto_1943840 ) ) ( not ( = ?auto_1943831 ?auto_1943842 ) ) ( not ( = ?auto_1943832 ?auto_1943833 ) ) ( not ( = ?auto_1943832 ?auto_1943834 ) ) ( not ( = ?auto_1943832 ?auto_1943835 ) ) ( not ( = ?auto_1943832 ?auto_1943836 ) ) ( not ( = ?auto_1943832 ?auto_1943837 ) ) ( not ( = ?auto_1943832 ?auto_1943838 ) ) ( not ( = ?auto_1943832 ?auto_1943839 ) ) ( not ( = ?auto_1943832 ?auto_1943840 ) ) ( not ( = ?auto_1943832 ?auto_1943842 ) ) ( not ( = ?auto_1943833 ?auto_1943834 ) ) ( not ( = ?auto_1943833 ?auto_1943835 ) ) ( not ( = ?auto_1943833 ?auto_1943836 ) ) ( not ( = ?auto_1943833 ?auto_1943837 ) ) ( not ( = ?auto_1943833 ?auto_1943838 ) ) ( not ( = ?auto_1943833 ?auto_1943839 ) ) ( not ( = ?auto_1943833 ?auto_1943840 ) ) ( not ( = ?auto_1943833 ?auto_1943842 ) ) ( not ( = ?auto_1943834 ?auto_1943835 ) ) ( not ( = ?auto_1943834 ?auto_1943836 ) ) ( not ( = ?auto_1943834 ?auto_1943837 ) ) ( not ( = ?auto_1943834 ?auto_1943838 ) ) ( not ( = ?auto_1943834 ?auto_1943839 ) ) ( not ( = ?auto_1943834 ?auto_1943840 ) ) ( not ( = ?auto_1943834 ?auto_1943842 ) ) ( not ( = ?auto_1943835 ?auto_1943836 ) ) ( not ( = ?auto_1943835 ?auto_1943837 ) ) ( not ( = ?auto_1943835 ?auto_1943838 ) ) ( not ( = ?auto_1943835 ?auto_1943839 ) ) ( not ( = ?auto_1943835 ?auto_1943840 ) ) ( not ( = ?auto_1943835 ?auto_1943842 ) ) ( not ( = ?auto_1943836 ?auto_1943837 ) ) ( not ( = ?auto_1943836 ?auto_1943838 ) ) ( not ( = ?auto_1943836 ?auto_1943839 ) ) ( not ( = ?auto_1943836 ?auto_1943840 ) ) ( not ( = ?auto_1943836 ?auto_1943842 ) ) ( not ( = ?auto_1943837 ?auto_1943838 ) ) ( not ( = ?auto_1943837 ?auto_1943839 ) ) ( not ( = ?auto_1943837 ?auto_1943840 ) ) ( not ( = ?auto_1943837 ?auto_1943842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943838 ?auto_1943839 ?auto_1943840 )
      ( MAKE-11CRATE-VERIFY ?auto_1943829 ?auto_1943830 ?auto_1943831 ?auto_1943832 ?auto_1943833 ?auto_1943834 ?auto_1943835 ?auto_1943836 ?auto_1943837 ?auto_1943838 ?auto_1943839 ?auto_1943840 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943973 - SURFACE
      ?auto_1943974 - SURFACE
      ?auto_1943975 - SURFACE
      ?auto_1943976 - SURFACE
      ?auto_1943977 - SURFACE
      ?auto_1943978 - SURFACE
      ?auto_1943979 - SURFACE
      ?auto_1943980 - SURFACE
      ?auto_1943981 - SURFACE
      ?auto_1943982 - SURFACE
      ?auto_1943983 - SURFACE
      ?auto_1943984 - SURFACE
    )
    :vars
    (
      ?auto_1943989 - HOIST
      ?auto_1943985 - PLACE
      ?auto_1943986 - PLACE
      ?auto_1943990 - HOIST
      ?auto_1943987 - SURFACE
      ?auto_1943988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943989 ?auto_1943985 ) ( IS-CRATE ?auto_1943984 ) ( not ( = ?auto_1943983 ?auto_1943984 ) ) ( not ( = ?auto_1943982 ?auto_1943983 ) ) ( not ( = ?auto_1943982 ?auto_1943984 ) ) ( not ( = ?auto_1943986 ?auto_1943985 ) ) ( HOIST-AT ?auto_1943990 ?auto_1943986 ) ( not ( = ?auto_1943989 ?auto_1943990 ) ) ( AVAILABLE ?auto_1943990 ) ( SURFACE-AT ?auto_1943984 ?auto_1943986 ) ( ON ?auto_1943984 ?auto_1943987 ) ( CLEAR ?auto_1943984 ) ( not ( = ?auto_1943983 ?auto_1943987 ) ) ( not ( = ?auto_1943984 ?auto_1943987 ) ) ( not ( = ?auto_1943982 ?auto_1943987 ) ) ( TRUCK-AT ?auto_1943988 ?auto_1943985 ) ( SURFACE-AT ?auto_1943982 ?auto_1943985 ) ( CLEAR ?auto_1943982 ) ( LIFTING ?auto_1943989 ?auto_1943983 ) ( IS-CRATE ?auto_1943983 ) ( ON ?auto_1943974 ?auto_1943973 ) ( ON ?auto_1943975 ?auto_1943974 ) ( ON ?auto_1943976 ?auto_1943975 ) ( ON ?auto_1943977 ?auto_1943976 ) ( ON ?auto_1943978 ?auto_1943977 ) ( ON ?auto_1943979 ?auto_1943978 ) ( ON ?auto_1943980 ?auto_1943979 ) ( ON ?auto_1943981 ?auto_1943980 ) ( ON ?auto_1943982 ?auto_1943981 ) ( not ( = ?auto_1943973 ?auto_1943974 ) ) ( not ( = ?auto_1943973 ?auto_1943975 ) ) ( not ( = ?auto_1943973 ?auto_1943976 ) ) ( not ( = ?auto_1943973 ?auto_1943977 ) ) ( not ( = ?auto_1943973 ?auto_1943978 ) ) ( not ( = ?auto_1943973 ?auto_1943979 ) ) ( not ( = ?auto_1943973 ?auto_1943980 ) ) ( not ( = ?auto_1943973 ?auto_1943981 ) ) ( not ( = ?auto_1943973 ?auto_1943982 ) ) ( not ( = ?auto_1943973 ?auto_1943983 ) ) ( not ( = ?auto_1943973 ?auto_1943984 ) ) ( not ( = ?auto_1943973 ?auto_1943987 ) ) ( not ( = ?auto_1943974 ?auto_1943975 ) ) ( not ( = ?auto_1943974 ?auto_1943976 ) ) ( not ( = ?auto_1943974 ?auto_1943977 ) ) ( not ( = ?auto_1943974 ?auto_1943978 ) ) ( not ( = ?auto_1943974 ?auto_1943979 ) ) ( not ( = ?auto_1943974 ?auto_1943980 ) ) ( not ( = ?auto_1943974 ?auto_1943981 ) ) ( not ( = ?auto_1943974 ?auto_1943982 ) ) ( not ( = ?auto_1943974 ?auto_1943983 ) ) ( not ( = ?auto_1943974 ?auto_1943984 ) ) ( not ( = ?auto_1943974 ?auto_1943987 ) ) ( not ( = ?auto_1943975 ?auto_1943976 ) ) ( not ( = ?auto_1943975 ?auto_1943977 ) ) ( not ( = ?auto_1943975 ?auto_1943978 ) ) ( not ( = ?auto_1943975 ?auto_1943979 ) ) ( not ( = ?auto_1943975 ?auto_1943980 ) ) ( not ( = ?auto_1943975 ?auto_1943981 ) ) ( not ( = ?auto_1943975 ?auto_1943982 ) ) ( not ( = ?auto_1943975 ?auto_1943983 ) ) ( not ( = ?auto_1943975 ?auto_1943984 ) ) ( not ( = ?auto_1943975 ?auto_1943987 ) ) ( not ( = ?auto_1943976 ?auto_1943977 ) ) ( not ( = ?auto_1943976 ?auto_1943978 ) ) ( not ( = ?auto_1943976 ?auto_1943979 ) ) ( not ( = ?auto_1943976 ?auto_1943980 ) ) ( not ( = ?auto_1943976 ?auto_1943981 ) ) ( not ( = ?auto_1943976 ?auto_1943982 ) ) ( not ( = ?auto_1943976 ?auto_1943983 ) ) ( not ( = ?auto_1943976 ?auto_1943984 ) ) ( not ( = ?auto_1943976 ?auto_1943987 ) ) ( not ( = ?auto_1943977 ?auto_1943978 ) ) ( not ( = ?auto_1943977 ?auto_1943979 ) ) ( not ( = ?auto_1943977 ?auto_1943980 ) ) ( not ( = ?auto_1943977 ?auto_1943981 ) ) ( not ( = ?auto_1943977 ?auto_1943982 ) ) ( not ( = ?auto_1943977 ?auto_1943983 ) ) ( not ( = ?auto_1943977 ?auto_1943984 ) ) ( not ( = ?auto_1943977 ?auto_1943987 ) ) ( not ( = ?auto_1943978 ?auto_1943979 ) ) ( not ( = ?auto_1943978 ?auto_1943980 ) ) ( not ( = ?auto_1943978 ?auto_1943981 ) ) ( not ( = ?auto_1943978 ?auto_1943982 ) ) ( not ( = ?auto_1943978 ?auto_1943983 ) ) ( not ( = ?auto_1943978 ?auto_1943984 ) ) ( not ( = ?auto_1943978 ?auto_1943987 ) ) ( not ( = ?auto_1943979 ?auto_1943980 ) ) ( not ( = ?auto_1943979 ?auto_1943981 ) ) ( not ( = ?auto_1943979 ?auto_1943982 ) ) ( not ( = ?auto_1943979 ?auto_1943983 ) ) ( not ( = ?auto_1943979 ?auto_1943984 ) ) ( not ( = ?auto_1943979 ?auto_1943987 ) ) ( not ( = ?auto_1943980 ?auto_1943981 ) ) ( not ( = ?auto_1943980 ?auto_1943982 ) ) ( not ( = ?auto_1943980 ?auto_1943983 ) ) ( not ( = ?auto_1943980 ?auto_1943984 ) ) ( not ( = ?auto_1943980 ?auto_1943987 ) ) ( not ( = ?auto_1943981 ?auto_1943982 ) ) ( not ( = ?auto_1943981 ?auto_1943983 ) ) ( not ( = ?auto_1943981 ?auto_1943984 ) ) ( not ( = ?auto_1943981 ?auto_1943987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943982 ?auto_1943983 ?auto_1943984 )
      ( MAKE-11CRATE-VERIFY ?auto_1943973 ?auto_1943974 ?auto_1943975 ?auto_1943976 ?auto_1943977 ?auto_1943978 ?auto_1943979 ?auto_1943980 ?auto_1943981 ?auto_1943982 ?auto_1943983 ?auto_1943984 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1944117 - SURFACE
      ?auto_1944118 - SURFACE
      ?auto_1944119 - SURFACE
      ?auto_1944120 - SURFACE
      ?auto_1944121 - SURFACE
      ?auto_1944122 - SURFACE
      ?auto_1944123 - SURFACE
      ?auto_1944124 - SURFACE
      ?auto_1944125 - SURFACE
      ?auto_1944126 - SURFACE
      ?auto_1944127 - SURFACE
      ?auto_1944128 - SURFACE
    )
    :vars
    (
      ?auto_1944130 - HOIST
      ?auto_1944132 - PLACE
      ?auto_1944133 - PLACE
      ?auto_1944131 - HOIST
      ?auto_1944129 - SURFACE
      ?auto_1944134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1944130 ?auto_1944132 ) ( IS-CRATE ?auto_1944128 ) ( not ( = ?auto_1944127 ?auto_1944128 ) ) ( not ( = ?auto_1944126 ?auto_1944127 ) ) ( not ( = ?auto_1944126 ?auto_1944128 ) ) ( not ( = ?auto_1944133 ?auto_1944132 ) ) ( HOIST-AT ?auto_1944131 ?auto_1944133 ) ( not ( = ?auto_1944130 ?auto_1944131 ) ) ( AVAILABLE ?auto_1944131 ) ( SURFACE-AT ?auto_1944128 ?auto_1944133 ) ( ON ?auto_1944128 ?auto_1944129 ) ( CLEAR ?auto_1944128 ) ( not ( = ?auto_1944127 ?auto_1944129 ) ) ( not ( = ?auto_1944128 ?auto_1944129 ) ) ( not ( = ?auto_1944126 ?auto_1944129 ) ) ( TRUCK-AT ?auto_1944134 ?auto_1944132 ) ( SURFACE-AT ?auto_1944126 ?auto_1944132 ) ( CLEAR ?auto_1944126 ) ( IS-CRATE ?auto_1944127 ) ( AVAILABLE ?auto_1944130 ) ( IN ?auto_1944127 ?auto_1944134 ) ( ON ?auto_1944118 ?auto_1944117 ) ( ON ?auto_1944119 ?auto_1944118 ) ( ON ?auto_1944120 ?auto_1944119 ) ( ON ?auto_1944121 ?auto_1944120 ) ( ON ?auto_1944122 ?auto_1944121 ) ( ON ?auto_1944123 ?auto_1944122 ) ( ON ?auto_1944124 ?auto_1944123 ) ( ON ?auto_1944125 ?auto_1944124 ) ( ON ?auto_1944126 ?auto_1944125 ) ( not ( = ?auto_1944117 ?auto_1944118 ) ) ( not ( = ?auto_1944117 ?auto_1944119 ) ) ( not ( = ?auto_1944117 ?auto_1944120 ) ) ( not ( = ?auto_1944117 ?auto_1944121 ) ) ( not ( = ?auto_1944117 ?auto_1944122 ) ) ( not ( = ?auto_1944117 ?auto_1944123 ) ) ( not ( = ?auto_1944117 ?auto_1944124 ) ) ( not ( = ?auto_1944117 ?auto_1944125 ) ) ( not ( = ?auto_1944117 ?auto_1944126 ) ) ( not ( = ?auto_1944117 ?auto_1944127 ) ) ( not ( = ?auto_1944117 ?auto_1944128 ) ) ( not ( = ?auto_1944117 ?auto_1944129 ) ) ( not ( = ?auto_1944118 ?auto_1944119 ) ) ( not ( = ?auto_1944118 ?auto_1944120 ) ) ( not ( = ?auto_1944118 ?auto_1944121 ) ) ( not ( = ?auto_1944118 ?auto_1944122 ) ) ( not ( = ?auto_1944118 ?auto_1944123 ) ) ( not ( = ?auto_1944118 ?auto_1944124 ) ) ( not ( = ?auto_1944118 ?auto_1944125 ) ) ( not ( = ?auto_1944118 ?auto_1944126 ) ) ( not ( = ?auto_1944118 ?auto_1944127 ) ) ( not ( = ?auto_1944118 ?auto_1944128 ) ) ( not ( = ?auto_1944118 ?auto_1944129 ) ) ( not ( = ?auto_1944119 ?auto_1944120 ) ) ( not ( = ?auto_1944119 ?auto_1944121 ) ) ( not ( = ?auto_1944119 ?auto_1944122 ) ) ( not ( = ?auto_1944119 ?auto_1944123 ) ) ( not ( = ?auto_1944119 ?auto_1944124 ) ) ( not ( = ?auto_1944119 ?auto_1944125 ) ) ( not ( = ?auto_1944119 ?auto_1944126 ) ) ( not ( = ?auto_1944119 ?auto_1944127 ) ) ( not ( = ?auto_1944119 ?auto_1944128 ) ) ( not ( = ?auto_1944119 ?auto_1944129 ) ) ( not ( = ?auto_1944120 ?auto_1944121 ) ) ( not ( = ?auto_1944120 ?auto_1944122 ) ) ( not ( = ?auto_1944120 ?auto_1944123 ) ) ( not ( = ?auto_1944120 ?auto_1944124 ) ) ( not ( = ?auto_1944120 ?auto_1944125 ) ) ( not ( = ?auto_1944120 ?auto_1944126 ) ) ( not ( = ?auto_1944120 ?auto_1944127 ) ) ( not ( = ?auto_1944120 ?auto_1944128 ) ) ( not ( = ?auto_1944120 ?auto_1944129 ) ) ( not ( = ?auto_1944121 ?auto_1944122 ) ) ( not ( = ?auto_1944121 ?auto_1944123 ) ) ( not ( = ?auto_1944121 ?auto_1944124 ) ) ( not ( = ?auto_1944121 ?auto_1944125 ) ) ( not ( = ?auto_1944121 ?auto_1944126 ) ) ( not ( = ?auto_1944121 ?auto_1944127 ) ) ( not ( = ?auto_1944121 ?auto_1944128 ) ) ( not ( = ?auto_1944121 ?auto_1944129 ) ) ( not ( = ?auto_1944122 ?auto_1944123 ) ) ( not ( = ?auto_1944122 ?auto_1944124 ) ) ( not ( = ?auto_1944122 ?auto_1944125 ) ) ( not ( = ?auto_1944122 ?auto_1944126 ) ) ( not ( = ?auto_1944122 ?auto_1944127 ) ) ( not ( = ?auto_1944122 ?auto_1944128 ) ) ( not ( = ?auto_1944122 ?auto_1944129 ) ) ( not ( = ?auto_1944123 ?auto_1944124 ) ) ( not ( = ?auto_1944123 ?auto_1944125 ) ) ( not ( = ?auto_1944123 ?auto_1944126 ) ) ( not ( = ?auto_1944123 ?auto_1944127 ) ) ( not ( = ?auto_1944123 ?auto_1944128 ) ) ( not ( = ?auto_1944123 ?auto_1944129 ) ) ( not ( = ?auto_1944124 ?auto_1944125 ) ) ( not ( = ?auto_1944124 ?auto_1944126 ) ) ( not ( = ?auto_1944124 ?auto_1944127 ) ) ( not ( = ?auto_1944124 ?auto_1944128 ) ) ( not ( = ?auto_1944124 ?auto_1944129 ) ) ( not ( = ?auto_1944125 ?auto_1944126 ) ) ( not ( = ?auto_1944125 ?auto_1944127 ) ) ( not ( = ?auto_1944125 ?auto_1944128 ) ) ( not ( = ?auto_1944125 ?auto_1944129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1944126 ?auto_1944127 ?auto_1944128 )
      ( MAKE-11CRATE-VERIFY ?auto_1944117 ?auto_1944118 ?auto_1944119 ?auto_1944120 ?auto_1944121 ?auto_1944122 ?auto_1944123 ?auto_1944124 ?auto_1944125 ?auto_1944126 ?auto_1944127 ?auto_1944128 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953384 - SURFACE
      ?auto_1953385 - SURFACE
      ?auto_1953386 - SURFACE
      ?auto_1953387 - SURFACE
      ?auto_1953388 - SURFACE
      ?auto_1953389 - SURFACE
      ?auto_1953390 - SURFACE
      ?auto_1953391 - SURFACE
      ?auto_1953392 - SURFACE
      ?auto_1953393 - SURFACE
      ?auto_1953394 - SURFACE
      ?auto_1953395 - SURFACE
      ?auto_1953396 - SURFACE
    )
    :vars
    (
      ?auto_1953397 - HOIST
      ?auto_1953398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953397 ?auto_1953398 ) ( SURFACE-AT ?auto_1953395 ?auto_1953398 ) ( CLEAR ?auto_1953395 ) ( LIFTING ?auto_1953397 ?auto_1953396 ) ( IS-CRATE ?auto_1953396 ) ( not ( = ?auto_1953395 ?auto_1953396 ) ) ( ON ?auto_1953385 ?auto_1953384 ) ( ON ?auto_1953386 ?auto_1953385 ) ( ON ?auto_1953387 ?auto_1953386 ) ( ON ?auto_1953388 ?auto_1953387 ) ( ON ?auto_1953389 ?auto_1953388 ) ( ON ?auto_1953390 ?auto_1953389 ) ( ON ?auto_1953391 ?auto_1953390 ) ( ON ?auto_1953392 ?auto_1953391 ) ( ON ?auto_1953393 ?auto_1953392 ) ( ON ?auto_1953394 ?auto_1953393 ) ( ON ?auto_1953395 ?auto_1953394 ) ( not ( = ?auto_1953384 ?auto_1953385 ) ) ( not ( = ?auto_1953384 ?auto_1953386 ) ) ( not ( = ?auto_1953384 ?auto_1953387 ) ) ( not ( = ?auto_1953384 ?auto_1953388 ) ) ( not ( = ?auto_1953384 ?auto_1953389 ) ) ( not ( = ?auto_1953384 ?auto_1953390 ) ) ( not ( = ?auto_1953384 ?auto_1953391 ) ) ( not ( = ?auto_1953384 ?auto_1953392 ) ) ( not ( = ?auto_1953384 ?auto_1953393 ) ) ( not ( = ?auto_1953384 ?auto_1953394 ) ) ( not ( = ?auto_1953384 ?auto_1953395 ) ) ( not ( = ?auto_1953384 ?auto_1953396 ) ) ( not ( = ?auto_1953385 ?auto_1953386 ) ) ( not ( = ?auto_1953385 ?auto_1953387 ) ) ( not ( = ?auto_1953385 ?auto_1953388 ) ) ( not ( = ?auto_1953385 ?auto_1953389 ) ) ( not ( = ?auto_1953385 ?auto_1953390 ) ) ( not ( = ?auto_1953385 ?auto_1953391 ) ) ( not ( = ?auto_1953385 ?auto_1953392 ) ) ( not ( = ?auto_1953385 ?auto_1953393 ) ) ( not ( = ?auto_1953385 ?auto_1953394 ) ) ( not ( = ?auto_1953385 ?auto_1953395 ) ) ( not ( = ?auto_1953385 ?auto_1953396 ) ) ( not ( = ?auto_1953386 ?auto_1953387 ) ) ( not ( = ?auto_1953386 ?auto_1953388 ) ) ( not ( = ?auto_1953386 ?auto_1953389 ) ) ( not ( = ?auto_1953386 ?auto_1953390 ) ) ( not ( = ?auto_1953386 ?auto_1953391 ) ) ( not ( = ?auto_1953386 ?auto_1953392 ) ) ( not ( = ?auto_1953386 ?auto_1953393 ) ) ( not ( = ?auto_1953386 ?auto_1953394 ) ) ( not ( = ?auto_1953386 ?auto_1953395 ) ) ( not ( = ?auto_1953386 ?auto_1953396 ) ) ( not ( = ?auto_1953387 ?auto_1953388 ) ) ( not ( = ?auto_1953387 ?auto_1953389 ) ) ( not ( = ?auto_1953387 ?auto_1953390 ) ) ( not ( = ?auto_1953387 ?auto_1953391 ) ) ( not ( = ?auto_1953387 ?auto_1953392 ) ) ( not ( = ?auto_1953387 ?auto_1953393 ) ) ( not ( = ?auto_1953387 ?auto_1953394 ) ) ( not ( = ?auto_1953387 ?auto_1953395 ) ) ( not ( = ?auto_1953387 ?auto_1953396 ) ) ( not ( = ?auto_1953388 ?auto_1953389 ) ) ( not ( = ?auto_1953388 ?auto_1953390 ) ) ( not ( = ?auto_1953388 ?auto_1953391 ) ) ( not ( = ?auto_1953388 ?auto_1953392 ) ) ( not ( = ?auto_1953388 ?auto_1953393 ) ) ( not ( = ?auto_1953388 ?auto_1953394 ) ) ( not ( = ?auto_1953388 ?auto_1953395 ) ) ( not ( = ?auto_1953388 ?auto_1953396 ) ) ( not ( = ?auto_1953389 ?auto_1953390 ) ) ( not ( = ?auto_1953389 ?auto_1953391 ) ) ( not ( = ?auto_1953389 ?auto_1953392 ) ) ( not ( = ?auto_1953389 ?auto_1953393 ) ) ( not ( = ?auto_1953389 ?auto_1953394 ) ) ( not ( = ?auto_1953389 ?auto_1953395 ) ) ( not ( = ?auto_1953389 ?auto_1953396 ) ) ( not ( = ?auto_1953390 ?auto_1953391 ) ) ( not ( = ?auto_1953390 ?auto_1953392 ) ) ( not ( = ?auto_1953390 ?auto_1953393 ) ) ( not ( = ?auto_1953390 ?auto_1953394 ) ) ( not ( = ?auto_1953390 ?auto_1953395 ) ) ( not ( = ?auto_1953390 ?auto_1953396 ) ) ( not ( = ?auto_1953391 ?auto_1953392 ) ) ( not ( = ?auto_1953391 ?auto_1953393 ) ) ( not ( = ?auto_1953391 ?auto_1953394 ) ) ( not ( = ?auto_1953391 ?auto_1953395 ) ) ( not ( = ?auto_1953391 ?auto_1953396 ) ) ( not ( = ?auto_1953392 ?auto_1953393 ) ) ( not ( = ?auto_1953392 ?auto_1953394 ) ) ( not ( = ?auto_1953392 ?auto_1953395 ) ) ( not ( = ?auto_1953392 ?auto_1953396 ) ) ( not ( = ?auto_1953393 ?auto_1953394 ) ) ( not ( = ?auto_1953393 ?auto_1953395 ) ) ( not ( = ?auto_1953393 ?auto_1953396 ) ) ( not ( = ?auto_1953394 ?auto_1953395 ) ) ( not ( = ?auto_1953394 ?auto_1953396 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1953395 ?auto_1953396 )
      ( MAKE-12CRATE-VERIFY ?auto_1953384 ?auto_1953385 ?auto_1953386 ?auto_1953387 ?auto_1953388 ?auto_1953389 ?auto_1953390 ?auto_1953391 ?auto_1953392 ?auto_1953393 ?auto_1953394 ?auto_1953395 ?auto_1953396 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953509 - SURFACE
      ?auto_1953510 - SURFACE
      ?auto_1953511 - SURFACE
      ?auto_1953512 - SURFACE
      ?auto_1953513 - SURFACE
      ?auto_1953514 - SURFACE
      ?auto_1953515 - SURFACE
      ?auto_1953516 - SURFACE
      ?auto_1953517 - SURFACE
      ?auto_1953518 - SURFACE
      ?auto_1953519 - SURFACE
      ?auto_1953520 - SURFACE
      ?auto_1953521 - SURFACE
    )
    :vars
    (
      ?auto_1953524 - HOIST
      ?auto_1953522 - PLACE
      ?auto_1953523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953524 ?auto_1953522 ) ( SURFACE-AT ?auto_1953520 ?auto_1953522 ) ( CLEAR ?auto_1953520 ) ( IS-CRATE ?auto_1953521 ) ( not ( = ?auto_1953520 ?auto_1953521 ) ) ( TRUCK-AT ?auto_1953523 ?auto_1953522 ) ( AVAILABLE ?auto_1953524 ) ( IN ?auto_1953521 ?auto_1953523 ) ( ON ?auto_1953520 ?auto_1953519 ) ( not ( = ?auto_1953519 ?auto_1953520 ) ) ( not ( = ?auto_1953519 ?auto_1953521 ) ) ( ON ?auto_1953510 ?auto_1953509 ) ( ON ?auto_1953511 ?auto_1953510 ) ( ON ?auto_1953512 ?auto_1953511 ) ( ON ?auto_1953513 ?auto_1953512 ) ( ON ?auto_1953514 ?auto_1953513 ) ( ON ?auto_1953515 ?auto_1953514 ) ( ON ?auto_1953516 ?auto_1953515 ) ( ON ?auto_1953517 ?auto_1953516 ) ( ON ?auto_1953518 ?auto_1953517 ) ( ON ?auto_1953519 ?auto_1953518 ) ( not ( = ?auto_1953509 ?auto_1953510 ) ) ( not ( = ?auto_1953509 ?auto_1953511 ) ) ( not ( = ?auto_1953509 ?auto_1953512 ) ) ( not ( = ?auto_1953509 ?auto_1953513 ) ) ( not ( = ?auto_1953509 ?auto_1953514 ) ) ( not ( = ?auto_1953509 ?auto_1953515 ) ) ( not ( = ?auto_1953509 ?auto_1953516 ) ) ( not ( = ?auto_1953509 ?auto_1953517 ) ) ( not ( = ?auto_1953509 ?auto_1953518 ) ) ( not ( = ?auto_1953509 ?auto_1953519 ) ) ( not ( = ?auto_1953509 ?auto_1953520 ) ) ( not ( = ?auto_1953509 ?auto_1953521 ) ) ( not ( = ?auto_1953510 ?auto_1953511 ) ) ( not ( = ?auto_1953510 ?auto_1953512 ) ) ( not ( = ?auto_1953510 ?auto_1953513 ) ) ( not ( = ?auto_1953510 ?auto_1953514 ) ) ( not ( = ?auto_1953510 ?auto_1953515 ) ) ( not ( = ?auto_1953510 ?auto_1953516 ) ) ( not ( = ?auto_1953510 ?auto_1953517 ) ) ( not ( = ?auto_1953510 ?auto_1953518 ) ) ( not ( = ?auto_1953510 ?auto_1953519 ) ) ( not ( = ?auto_1953510 ?auto_1953520 ) ) ( not ( = ?auto_1953510 ?auto_1953521 ) ) ( not ( = ?auto_1953511 ?auto_1953512 ) ) ( not ( = ?auto_1953511 ?auto_1953513 ) ) ( not ( = ?auto_1953511 ?auto_1953514 ) ) ( not ( = ?auto_1953511 ?auto_1953515 ) ) ( not ( = ?auto_1953511 ?auto_1953516 ) ) ( not ( = ?auto_1953511 ?auto_1953517 ) ) ( not ( = ?auto_1953511 ?auto_1953518 ) ) ( not ( = ?auto_1953511 ?auto_1953519 ) ) ( not ( = ?auto_1953511 ?auto_1953520 ) ) ( not ( = ?auto_1953511 ?auto_1953521 ) ) ( not ( = ?auto_1953512 ?auto_1953513 ) ) ( not ( = ?auto_1953512 ?auto_1953514 ) ) ( not ( = ?auto_1953512 ?auto_1953515 ) ) ( not ( = ?auto_1953512 ?auto_1953516 ) ) ( not ( = ?auto_1953512 ?auto_1953517 ) ) ( not ( = ?auto_1953512 ?auto_1953518 ) ) ( not ( = ?auto_1953512 ?auto_1953519 ) ) ( not ( = ?auto_1953512 ?auto_1953520 ) ) ( not ( = ?auto_1953512 ?auto_1953521 ) ) ( not ( = ?auto_1953513 ?auto_1953514 ) ) ( not ( = ?auto_1953513 ?auto_1953515 ) ) ( not ( = ?auto_1953513 ?auto_1953516 ) ) ( not ( = ?auto_1953513 ?auto_1953517 ) ) ( not ( = ?auto_1953513 ?auto_1953518 ) ) ( not ( = ?auto_1953513 ?auto_1953519 ) ) ( not ( = ?auto_1953513 ?auto_1953520 ) ) ( not ( = ?auto_1953513 ?auto_1953521 ) ) ( not ( = ?auto_1953514 ?auto_1953515 ) ) ( not ( = ?auto_1953514 ?auto_1953516 ) ) ( not ( = ?auto_1953514 ?auto_1953517 ) ) ( not ( = ?auto_1953514 ?auto_1953518 ) ) ( not ( = ?auto_1953514 ?auto_1953519 ) ) ( not ( = ?auto_1953514 ?auto_1953520 ) ) ( not ( = ?auto_1953514 ?auto_1953521 ) ) ( not ( = ?auto_1953515 ?auto_1953516 ) ) ( not ( = ?auto_1953515 ?auto_1953517 ) ) ( not ( = ?auto_1953515 ?auto_1953518 ) ) ( not ( = ?auto_1953515 ?auto_1953519 ) ) ( not ( = ?auto_1953515 ?auto_1953520 ) ) ( not ( = ?auto_1953515 ?auto_1953521 ) ) ( not ( = ?auto_1953516 ?auto_1953517 ) ) ( not ( = ?auto_1953516 ?auto_1953518 ) ) ( not ( = ?auto_1953516 ?auto_1953519 ) ) ( not ( = ?auto_1953516 ?auto_1953520 ) ) ( not ( = ?auto_1953516 ?auto_1953521 ) ) ( not ( = ?auto_1953517 ?auto_1953518 ) ) ( not ( = ?auto_1953517 ?auto_1953519 ) ) ( not ( = ?auto_1953517 ?auto_1953520 ) ) ( not ( = ?auto_1953517 ?auto_1953521 ) ) ( not ( = ?auto_1953518 ?auto_1953519 ) ) ( not ( = ?auto_1953518 ?auto_1953520 ) ) ( not ( = ?auto_1953518 ?auto_1953521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953519 ?auto_1953520 ?auto_1953521 )
      ( MAKE-12CRATE-VERIFY ?auto_1953509 ?auto_1953510 ?auto_1953511 ?auto_1953512 ?auto_1953513 ?auto_1953514 ?auto_1953515 ?auto_1953516 ?auto_1953517 ?auto_1953518 ?auto_1953519 ?auto_1953520 ?auto_1953521 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953647 - SURFACE
      ?auto_1953648 - SURFACE
      ?auto_1953649 - SURFACE
      ?auto_1953650 - SURFACE
      ?auto_1953651 - SURFACE
      ?auto_1953652 - SURFACE
      ?auto_1953653 - SURFACE
      ?auto_1953654 - SURFACE
      ?auto_1953655 - SURFACE
      ?auto_1953656 - SURFACE
      ?auto_1953657 - SURFACE
      ?auto_1953658 - SURFACE
      ?auto_1953659 - SURFACE
    )
    :vars
    (
      ?auto_1953662 - HOIST
      ?auto_1953663 - PLACE
      ?auto_1953660 - TRUCK
      ?auto_1953661 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953662 ?auto_1953663 ) ( SURFACE-AT ?auto_1953658 ?auto_1953663 ) ( CLEAR ?auto_1953658 ) ( IS-CRATE ?auto_1953659 ) ( not ( = ?auto_1953658 ?auto_1953659 ) ) ( AVAILABLE ?auto_1953662 ) ( IN ?auto_1953659 ?auto_1953660 ) ( ON ?auto_1953658 ?auto_1953657 ) ( not ( = ?auto_1953657 ?auto_1953658 ) ) ( not ( = ?auto_1953657 ?auto_1953659 ) ) ( TRUCK-AT ?auto_1953660 ?auto_1953661 ) ( not ( = ?auto_1953661 ?auto_1953663 ) ) ( ON ?auto_1953648 ?auto_1953647 ) ( ON ?auto_1953649 ?auto_1953648 ) ( ON ?auto_1953650 ?auto_1953649 ) ( ON ?auto_1953651 ?auto_1953650 ) ( ON ?auto_1953652 ?auto_1953651 ) ( ON ?auto_1953653 ?auto_1953652 ) ( ON ?auto_1953654 ?auto_1953653 ) ( ON ?auto_1953655 ?auto_1953654 ) ( ON ?auto_1953656 ?auto_1953655 ) ( ON ?auto_1953657 ?auto_1953656 ) ( not ( = ?auto_1953647 ?auto_1953648 ) ) ( not ( = ?auto_1953647 ?auto_1953649 ) ) ( not ( = ?auto_1953647 ?auto_1953650 ) ) ( not ( = ?auto_1953647 ?auto_1953651 ) ) ( not ( = ?auto_1953647 ?auto_1953652 ) ) ( not ( = ?auto_1953647 ?auto_1953653 ) ) ( not ( = ?auto_1953647 ?auto_1953654 ) ) ( not ( = ?auto_1953647 ?auto_1953655 ) ) ( not ( = ?auto_1953647 ?auto_1953656 ) ) ( not ( = ?auto_1953647 ?auto_1953657 ) ) ( not ( = ?auto_1953647 ?auto_1953658 ) ) ( not ( = ?auto_1953647 ?auto_1953659 ) ) ( not ( = ?auto_1953648 ?auto_1953649 ) ) ( not ( = ?auto_1953648 ?auto_1953650 ) ) ( not ( = ?auto_1953648 ?auto_1953651 ) ) ( not ( = ?auto_1953648 ?auto_1953652 ) ) ( not ( = ?auto_1953648 ?auto_1953653 ) ) ( not ( = ?auto_1953648 ?auto_1953654 ) ) ( not ( = ?auto_1953648 ?auto_1953655 ) ) ( not ( = ?auto_1953648 ?auto_1953656 ) ) ( not ( = ?auto_1953648 ?auto_1953657 ) ) ( not ( = ?auto_1953648 ?auto_1953658 ) ) ( not ( = ?auto_1953648 ?auto_1953659 ) ) ( not ( = ?auto_1953649 ?auto_1953650 ) ) ( not ( = ?auto_1953649 ?auto_1953651 ) ) ( not ( = ?auto_1953649 ?auto_1953652 ) ) ( not ( = ?auto_1953649 ?auto_1953653 ) ) ( not ( = ?auto_1953649 ?auto_1953654 ) ) ( not ( = ?auto_1953649 ?auto_1953655 ) ) ( not ( = ?auto_1953649 ?auto_1953656 ) ) ( not ( = ?auto_1953649 ?auto_1953657 ) ) ( not ( = ?auto_1953649 ?auto_1953658 ) ) ( not ( = ?auto_1953649 ?auto_1953659 ) ) ( not ( = ?auto_1953650 ?auto_1953651 ) ) ( not ( = ?auto_1953650 ?auto_1953652 ) ) ( not ( = ?auto_1953650 ?auto_1953653 ) ) ( not ( = ?auto_1953650 ?auto_1953654 ) ) ( not ( = ?auto_1953650 ?auto_1953655 ) ) ( not ( = ?auto_1953650 ?auto_1953656 ) ) ( not ( = ?auto_1953650 ?auto_1953657 ) ) ( not ( = ?auto_1953650 ?auto_1953658 ) ) ( not ( = ?auto_1953650 ?auto_1953659 ) ) ( not ( = ?auto_1953651 ?auto_1953652 ) ) ( not ( = ?auto_1953651 ?auto_1953653 ) ) ( not ( = ?auto_1953651 ?auto_1953654 ) ) ( not ( = ?auto_1953651 ?auto_1953655 ) ) ( not ( = ?auto_1953651 ?auto_1953656 ) ) ( not ( = ?auto_1953651 ?auto_1953657 ) ) ( not ( = ?auto_1953651 ?auto_1953658 ) ) ( not ( = ?auto_1953651 ?auto_1953659 ) ) ( not ( = ?auto_1953652 ?auto_1953653 ) ) ( not ( = ?auto_1953652 ?auto_1953654 ) ) ( not ( = ?auto_1953652 ?auto_1953655 ) ) ( not ( = ?auto_1953652 ?auto_1953656 ) ) ( not ( = ?auto_1953652 ?auto_1953657 ) ) ( not ( = ?auto_1953652 ?auto_1953658 ) ) ( not ( = ?auto_1953652 ?auto_1953659 ) ) ( not ( = ?auto_1953653 ?auto_1953654 ) ) ( not ( = ?auto_1953653 ?auto_1953655 ) ) ( not ( = ?auto_1953653 ?auto_1953656 ) ) ( not ( = ?auto_1953653 ?auto_1953657 ) ) ( not ( = ?auto_1953653 ?auto_1953658 ) ) ( not ( = ?auto_1953653 ?auto_1953659 ) ) ( not ( = ?auto_1953654 ?auto_1953655 ) ) ( not ( = ?auto_1953654 ?auto_1953656 ) ) ( not ( = ?auto_1953654 ?auto_1953657 ) ) ( not ( = ?auto_1953654 ?auto_1953658 ) ) ( not ( = ?auto_1953654 ?auto_1953659 ) ) ( not ( = ?auto_1953655 ?auto_1953656 ) ) ( not ( = ?auto_1953655 ?auto_1953657 ) ) ( not ( = ?auto_1953655 ?auto_1953658 ) ) ( not ( = ?auto_1953655 ?auto_1953659 ) ) ( not ( = ?auto_1953656 ?auto_1953657 ) ) ( not ( = ?auto_1953656 ?auto_1953658 ) ) ( not ( = ?auto_1953656 ?auto_1953659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953657 ?auto_1953658 ?auto_1953659 )
      ( MAKE-12CRATE-VERIFY ?auto_1953647 ?auto_1953648 ?auto_1953649 ?auto_1953650 ?auto_1953651 ?auto_1953652 ?auto_1953653 ?auto_1953654 ?auto_1953655 ?auto_1953656 ?auto_1953657 ?auto_1953658 ?auto_1953659 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953797 - SURFACE
      ?auto_1953798 - SURFACE
      ?auto_1953799 - SURFACE
      ?auto_1953800 - SURFACE
      ?auto_1953801 - SURFACE
      ?auto_1953802 - SURFACE
      ?auto_1953803 - SURFACE
      ?auto_1953804 - SURFACE
      ?auto_1953805 - SURFACE
      ?auto_1953806 - SURFACE
      ?auto_1953807 - SURFACE
      ?auto_1953808 - SURFACE
      ?auto_1953809 - SURFACE
    )
    :vars
    (
      ?auto_1953813 - HOIST
      ?auto_1953814 - PLACE
      ?auto_1953810 - TRUCK
      ?auto_1953811 - PLACE
      ?auto_1953812 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953813 ?auto_1953814 ) ( SURFACE-AT ?auto_1953808 ?auto_1953814 ) ( CLEAR ?auto_1953808 ) ( IS-CRATE ?auto_1953809 ) ( not ( = ?auto_1953808 ?auto_1953809 ) ) ( AVAILABLE ?auto_1953813 ) ( ON ?auto_1953808 ?auto_1953807 ) ( not ( = ?auto_1953807 ?auto_1953808 ) ) ( not ( = ?auto_1953807 ?auto_1953809 ) ) ( TRUCK-AT ?auto_1953810 ?auto_1953811 ) ( not ( = ?auto_1953811 ?auto_1953814 ) ) ( HOIST-AT ?auto_1953812 ?auto_1953811 ) ( LIFTING ?auto_1953812 ?auto_1953809 ) ( not ( = ?auto_1953813 ?auto_1953812 ) ) ( ON ?auto_1953798 ?auto_1953797 ) ( ON ?auto_1953799 ?auto_1953798 ) ( ON ?auto_1953800 ?auto_1953799 ) ( ON ?auto_1953801 ?auto_1953800 ) ( ON ?auto_1953802 ?auto_1953801 ) ( ON ?auto_1953803 ?auto_1953802 ) ( ON ?auto_1953804 ?auto_1953803 ) ( ON ?auto_1953805 ?auto_1953804 ) ( ON ?auto_1953806 ?auto_1953805 ) ( ON ?auto_1953807 ?auto_1953806 ) ( not ( = ?auto_1953797 ?auto_1953798 ) ) ( not ( = ?auto_1953797 ?auto_1953799 ) ) ( not ( = ?auto_1953797 ?auto_1953800 ) ) ( not ( = ?auto_1953797 ?auto_1953801 ) ) ( not ( = ?auto_1953797 ?auto_1953802 ) ) ( not ( = ?auto_1953797 ?auto_1953803 ) ) ( not ( = ?auto_1953797 ?auto_1953804 ) ) ( not ( = ?auto_1953797 ?auto_1953805 ) ) ( not ( = ?auto_1953797 ?auto_1953806 ) ) ( not ( = ?auto_1953797 ?auto_1953807 ) ) ( not ( = ?auto_1953797 ?auto_1953808 ) ) ( not ( = ?auto_1953797 ?auto_1953809 ) ) ( not ( = ?auto_1953798 ?auto_1953799 ) ) ( not ( = ?auto_1953798 ?auto_1953800 ) ) ( not ( = ?auto_1953798 ?auto_1953801 ) ) ( not ( = ?auto_1953798 ?auto_1953802 ) ) ( not ( = ?auto_1953798 ?auto_1953803 ) ) ( not ( = ?auto_1953798 ?auto_1953804 ) ) ( not ( = ?auto_1953798 ?auto_1953805 ) ) ( not ( = ?auto_1953798 ?auto_1953806 ) ) ( not ( = ?auto_1953798 ?auto_1953807 ) ) ( not ( = ?auto_1953798 ?auto_1953808 ) ) ( not ( = ?auto_1953798 ?auto_1953809 ) ) ( not ( = ?auto_1953799 ?auto_1953800 ) ) ( not ( = ?auto_1953799 ?auto_1953801 ) ) ( not ( = ?auto_1953799 ?auto_1953802 ) ) ( not ( = ?auto_1953799 ?auto_1953803 ) ) ( not ( = ?auto_1953799 ?auto_1953804 ) ) ( not ( = ?auto_1953799 ?auto_1953805 ) ) ( not ( = ?auto_1953799 ?auto_1953806 ) ) ( not ( = ?auto_1953799 ?auto_1953807 ) ) ( not ( = ?auto_1953799 ?auto_1953808 ) ) ( not ( = ?auto_1953799 ?auto_1953809 ) ) ( not ( = ?auto_1953800 ?auto_1953801 ) ) ( not ( = ?auto_1953800 ?auto_1953802 ) ) ( not ( = ?auto_1953800 ?auto_1953803 ) ) ( not ( = ?auto_1953800 ?auto_1953804 ) ) ( not ( = ?auto_1953800 ?auto_1953805 ) ) ( not ( = ?auto_1953800 ?auto_1953806 ) ) ( not ( = ?auto_1953800 ?auto_1953807 ) ) ( not ( = ?auto_1953800 ?auto_1953808 ) ) ( not ( = ?auto_1953800 ?auto_1953809 ) ) ( not ( = ?auto_1953801 ?auto_1953802 ) ) ( not ( = ?auto_1953801 ?auto_1953803 ) ) ( not ( = ?auto_1953801 ?auto_1953804 ) ) ( not ( = ?auto_1953801 ?auto_1953805 ) ) ( not ( = ?auto_1953801 ?auto_1953806 ) ) ( not ( = ?auto_1953801 ?auto_1953807 ) ) ( not ( = ?auto_1953801 ?auto_1953808 ) ) ( not ( = ?auto_1953801 ?auto_1953809 ) ) ( not ( = ?auto_1953802 ?auto_1953803 ) ) ( not ( = ?auto_1953802 ?auto_1953804 ) ) ( not ( = ?auto_1953802 ?auto_1953805 ) ) ( not ( = ?auto_1953802 ?auto_1953806 ) ) ( not ( = ?auto_1953802 ?auto_1953807 ) ) ( not ( = ?auto_1953802 ?auto_1953808 ) ) ( not ( = ?auto_1953802 ?auto_1953809 ) ) ( not ( = ?auto_1953803 ?auto_1953804 ) ) ( not ( = ?auto_1953803 ?auto_1953805 ) ) ( not ( = ?auto_1953803 ?auto_1953806 ) ) ( not ( = ?auto_1953803 ?auto_1953807 ) ) ( not ( = ?auto_1953803 ?auto_1953808 ) ) ( not ( = ?auto_1953803 ?auto_1953809 ) ) ( not ( = ?auto_1953804 ?auto_1953805 ) ) ( not ( = ?auto_1953804 ?auto_1953806 ) ) ( not ( = ?auto_1953804 ?auto_1953807 ) ) ( not ( = ?auto_1953804 ?auto_1953808 ) ) ( not ( = ?auto_1953804 ?auto_1953809 ) ) ( not ( = ?auto_1953805 ?auto_1953806 ) ) ( not ( = ?auto_1953805 ?auto_1953807 ) ) ( not ( = ?auto_1953805 ?auto_1953808 ) ) ( not ( = ?auto_1953805 ?auto_1953809 ) ) ( not ( = ?auto_1953806 ?auto_1953807 ) ) ( not ( = ?auto_1953806 ?auto_1953808 ) ) ( not ( = ?auto_1953806 ?auto_1953809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953807 ?auto_1953808 ?auto_1953809 )
      ( MAKE-12CRATE-VERIFY ?auto_1953797 ?auto_1953798 ?auto_1953799 ?auto_1953800 ?auto_1953801 ?auto_1953802 ?auto_1953803 ?auto_1953804 ?auto_1953805 ?auto_1953806 ?auto_1953807 ?auto_1953808 ?auto_1953809 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953959 - SURFACE
      ?auto_1953960 - SURFACE
      ?auto_1953961 - SURFACE
      ?auto_1953962 - SURFACE
      ?auto_1953963 - SURFACE
      ?auto_1953964 - SURFACE
      ?auto_1953965 - SURFACE
      ?auto_1953966 - SURFACE
      ?auto_1953967 - SURFACE
      ?auto_1953968 - SURFACE
      ?auto_1953969 - SURFACE
      ?auto_1953970 - SURFACE
      ?auto_1953971 - SURFACE
    )
    :vars
    (
      ?auto_1953975 - HOIST
      ?auto_1953972 - PLACE
      ?auto_1953973 - TRUCK
      ?auto_1953974 - PLACE
      ?auto_1953976 - HOIST
      ?auto_1953977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953975 ?auto_1953972 ) ( SURFACE-AT ?auto_1953970 ?auto_1953972 ) ( CLEAR ?auto_1953970 ) ( IS-CRATE ?auto_1953971 ) ( not ( = ?auto_1953970 ?auto_1953971 ) ) ( AVAILABLE ?auto_1953975 ) ( ON ?auto_1953970 ?auto_1953969 ) ( not ( = ?auto_1953969 ?auto_1953970 ) ) ( not ( = ?auto_1953969 ?auto_1953971 ) ) ( TRUCK-AT ?auto_1953973 ?auto_1953974 ) ( not ( = ?auto_1953974 ?auto_1953972 ) ) ( HOIST-AT ?auto_1953976 ?auto_1953974 ) ( not ( = ?auto_1953975 ?auto_1953976 ) ) ( AVAILABLE ?auto_1953976 ) ( SURFACE-AT ?auto_1953971 ?auto_1953974 ) ( ON ?auto_1953971 ?auto_1953977 ) ( CLEAR ?auto_1953971 ) ( not ( = ?auto_1953970 ?auto_1953977 ) ) ( not ( = ?auto_1953971 ?auto_1953977 ) ) ( not ( = ?auto_1953969 ?auto_1953977 ) ) ( ON ?auto_1953960 ?auto_1953959 ) ( ON ?auto_1953961 ?auto_1953960 ) ( ON ?auto_1953962 ?auto_1953961 ) ( ON ?auto_1953963 ?auto_1953962 ) ( ON ?auto_1953964 ?auto_1953963 ) ( ON ?auto_1953965 ?auto_1953964 ) ( ON ?auto_1953966 ?auto_1953965 ) ( ON ?auto_1953967 ?auto_1953966 ) ( ON ?auto_1953968 ?auto_1953967 ) ( ON ?auto_1953969 ?auto_1953968 ) ( not ( = ?auto_1953959 ?auto_1953960 ) ) ( not ( = ?auto_1953959 ?auto_1953961 ) ) ( not ( = ?auto_1953959 ?auto_1953962 ) ) ( not ( = ?auto_1953959 ?auto_1953963 ) ) ( not ( = ?auto_1953959 ?auto_1953964 ) ) ( not ( = ?auto_1953959 ?auto_1953965 ) ) ( not ( = ?auto_1953959 ?auto_1953966 ) ) ( not ( = ?auto_1953959 ?auto_1953967 ) ) ( not ( = ?auto_1953959 ?auto_1953968 ) ) ( not ( = ?auto_1953959 ?auto_1953969 ) ) ( not ( = ?auto_1953959 ?auto_1953970 ) ) ( not ( = ?auto_1953959 ?auto_1953971 ) ) ( not ( = ?auto_1953959 ?auto_1953977 ) ) ( not ( = ?auto_1953960 ?auto_1953961 ) ) ( not ( = ?auto_1953960 ?auto_1953962 ) ) ( not ( = ?auto_1953960 ?auto_1953963 ) ) ( not ( = ?auto_1953960 ?auto_1953964 ) ) ( not ( = ?auto_1953960 ?auto_1953965 ) ) ( not ( = ?auto_1953960 ?auto_1953966 ) ) ( not ( = ?auto_1953960 ?auto_1953967 ) ) ( not ( = ?auto_1953960 ?auto_1953968 ) ) ( not ( = ?auto_1953960 ?auto_1953969 ) ) ( not ( = ?auto_1953960 ?auto_1953970 ) ) ( not ( = ?auto_1953960 ?auto_1953971 ) ) ( not ( = ?auto_1953960 ?auto_1953977 ) ) ( not ( = ?auto_1953961 ?auto_1953962 ) ) ( not ( = ?auto_1953961 ?auto_1953963 ) ) ( not ( = ?auto_1953961 ?auto_1953964 ) ) ( not ( = ?auto_1953961 ?auto_1953965 ) ) ( not ( = ?auto_1953961 ?auto_1953966 ) ) ( not ( = ?auto_1953961 ?auto_1953967 ) ) ( not ( = ?auto_1953961 ?auto_1953968 ) ) ( not ( = ?auto_1953961 ?auto_1953969 ) ) ( not ( = ?auto_1953961 ?auto_1953970 ) ) ( not ( = ?auto_1953961 ?auto_1953971 ) ) ( not ( = ?auto_1953961 ?auto_1953977 ) ) ( not ( = ?auto_1953962 ?auto_1953963 ) ) ( not ( = ?auto_1953962 ?auto_1953964 ) ) ( not ( = ?auto_1953962 ?auto_1953965 ) ) ( not ( = ?auto_1953962 ?auto_1953966 ) ) ( not ( = ?auto_1953962 ?auto_1953967 ) ) ( not ( = ?auto_1953962 ?auto_1953968 ) ) ( not ( = ?auto_1953962 ?auto_1953969 ) ) ( not ( = ?auto_1953962 ?auto_1953970 ) ) ( not ( = ?auto_1953962 ?auto_1953971 ) ) ( not ( = ?auto_1953962 ?auto_1953977 ) ) ( not ( = ?auto_1953963 ?auto_1953964 ) ) ( not ( = ?auto_1953963 ?auto_1953965 ) ) ( not ( = ?auto_1953963 ?auto_1953966 ) ) ( not ( = ?auto_1953963 ?auto_1953967 ) ) ( not ( = ?auto_1953963 ?auto_1953968 ) ) ( not ( = ?auto_1953963 ?auto_1953969 ) ) ( not ( = ?auto_1953963 ?auto_1953970 ) ) ( not ( = ?auto_1953963 ?auto_1953971 ) ) ( not ( = ?auto_1953963 ?auto_1953977 ) ) ( not ( = ?auto_1953964 ?auto_1953965 ) ) ( not ( = ?auto_1953964 ?auto_1953966 ) ) ( not ( = ?auto_1953964 ?auto_1953967 ) ) ( not ( = ?auto_1953964 ?auto_1953968 ) ) ( not ( = ?auto_1953964 ?auto_1953969 ) ) ( not ( = ?auto_1953964 ?auto_1953970 ) ) ( not ( = ?auto_1953964 ?auto_1953971 ) ) ( not ( = ?auto_1953964 ?auto_1953977 ) ) ( not ( = ?auto_1953965 ?auto_1953966 ) ) ( not ( = ?auto_1953965 ?auto_1953967 ) ) ( not ( = ?auto_1953965 ?auto_1953968 ) ) ( not ( = ?auto_1953965 ?auto_1953969 ) ) ( not ( = ?auto_1953965 ?auto_1953970 ) ) ( not ( = ?auto_1953965 ?auto_1953971 ) ) ( not ( = ?auto_1953965 ?auto_1953977 ) ) ( not ( = ?auto_1953966 ?auto_1953967 ) ) ( not ( = ?auto_1953966 ?auto_1953968 ) ) ( not ( = ?auto_1953966 ?auto_1953969 ) ) ( not ( = ?auto_1953966 ?auto_1953970 ) ) ( not ( = ?auto_1953966 ?auto_1953971 ) ) ( not ( = ?auto_1953966 ?auto_1953977 ) ) ( not ( = ?auto_1953967 ?auto_1953968 ) ) ( not ( = ?auto_1953967 ?auto_1953969 ) ) ( not ( = ?auto_1953967 ?auto_1953970 ) ) ( not ( = ?auto_1953967 ?auto_1953971 ) ) ( not ( = ?auto_1953967 ?auto_1953977 ) ) ( not ( = ?auto_1953968 ?auto_1953969 ) ) ( not ( = ?auto_1953968 ?auto_1953970 ) ) ( not ( = ?auto_1953968 ?auto_1953971 ) ) ( not ( = ?auto_1953968 ?auto_1953977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953969 ?auto_1953970 ?auto_1953971 )
      ( MAKE-12CRATE-VERIFY ?auto_1953959 ?auto_1953960 ?auto_1953961 ?auto_1953962 ?auto_1953963 ?auto_1953964 ?auto_1953965 ?auto_1953966 ?auto_1953967 ?auto_1953968 ?auto_1953969 ?auto_1953970 ?auto_1953971 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954122 - SURFACE
      ?auto_1954123 - SURFACE
      ?auto_1954124 - SURFACE
      ?auto_1954125 - SURFACE
      ?auto_1954126 - SURFACE
      ?auto_1954127 - SURFACE
      ?auto_1954128 - SURFACE
      ?auto_1954129 - SURFACE
      ?auto_1954130 - SURFACE
      ?auto_1954131 - SURFACE
      ?auto_1954132 - SURFACE
      ?auto_1954133 - SURFACE
      ?auto_1954134 - SURFACE
    )
    :vars
    (
      ?auto_1954139 - HOIST
      ?auto_1954137 - PLACE
      ?auto_1954140 - PLACE
      ?auto_1954135 - HOIST
      ?auto_1954138 - SURFACE
      ?auto_1954136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954139 ?auto_1954137 ) ( SURFACE-AT ?auto_1954133 ?auto_1954137 ) ( CLEAR ?auto_1954133 ) ( IS-CRATE ?auto_1954134 ) ( not ( = ?auto_1954133 ?auto_1954134 ) ) ( AVAILABLE ?auto_1954139 ) ( ON ?auto_1954133 ?auto_1954132 ) ( not ( = ?auto_1954132 ?auto_1954133 ) ) ( not ( = ?auto_1954132 ?auto_1954134 ) ) ( not ( = ?auto_1954140 ?auto_1954137 ) ) ( HOIST-AT ?auto_1954135 ?auto_1954140 ) ( not ( = ?auto_1954139 ?auto_1954135 ) ) ( AVAILABLE ?auto_1954135 ) ( SURFACE-AT ?auto_1954134 ?auto_1954140 ) ( ON ?auto_1954134 ?auto_1954138 ) ( CLEAR ?auto_1954134 ) ( not ( = ?auto_1954133 ?auto_1954138 ) ) ( not ( = ?auto_1954134 ?auto_1954138 ) ) ( not ( = ?auto_1954132 ?auto_1954138 ) ) ( TRUCK-AT ?auto_1954136 ?auto_1954137 ) ( ON ?auto_1954123 ?auto_1954122 ) ( ON ?auto_1954124 ?auto_1954123 ) ( ON ?auto_1954125 ?auto_1954124 ) ( ON ?auto_1954126 ?auto_1954125 ) ( ON ?auto_1954127 ?auto_1954126 ) ( ON ?auto_1954128 ?auto_1954127 ) ( ON ?auto_1954129 ?auto_1954128 ) ( ON ?auto_1954130 ?auto_1954129 ) ( ON ?auto_1954131 ?auto_1954130 ) ( ON ?auto_1954132 ?auto_1954131 ) ( not ( = ?auto_1954122 ?auto_1954123 ) ) ( not ( = ?auto_1954122 ?auto_1954124 ) ) ( not ( = ?auto_1954122 ?auto_1954125 ) ) ( not ( = ?auto_1954122 ?auto_1954126 ) ) ( not ( = ?auto_1954122 ?auto_1954127 ) ) ( not ( = ?auto_1954122 ?auto_1954128 ) ) ( not ( = ?auto_1954122 ?auto_1954129 ) ) ( not ( = ?auto_1954122 ?auto_1954130 ) ) ( not ( = ?auto_1954122 ?auto_1954131 ) ) ( not ( = ?auto_1954122 ?auto_1954132 ) ) ( not ( = ?auto_1954122 ?auto_1954133 ) ) ( not ( = ?auto_1954122 ?auto_1954134 ) ) ( not ( = ?auto_1954122 ?auto_1954138 ) ) ( not ( = ?auto_1954123 ?auto_1954124 ) ) ( not ( = ?auto_1954123 ?auto_1954125 ) ) ( not ( = ?auto_1954123 ?auto_1954126 ) ) ( not ( = ?auto_1954123 ?auto_1954127 ) ) ( not ( = ?auto_1954123 ?auto_1954128 ) ) ( not ( = ?auto_1954123 ?auto_1954129 ) ) ( not ( = ?auto_1954123 ?auto_1954130 ) ) ( not ( = ?auto_1954123 ?auto_1954131 ) ) ( not ( = ?auto_1954123 ?auto_1954132 ) ) ( not ( = ?auto_1954123 ?auto_1954133 ) ) ( not ( = ?auto_1954123 ?auto_1954134 ) ) ( not ( = ?auto_1954123 ?auto_1954138 ) ) ( not ( = ?auto_1954124 ?auto_1954125 ) ) ( not ( = ?auto_1954124 ?auto_1954126 ) ) ( not ( = ?auto_1954124 ?auto_1954127 ) ) ( not ( = ?auto_1954124 ?auto_1954128 ) ) ( not ( = ?auto_1954124 ?auto_1954129 ) ) ( not ( = ?auto_1954124 ?auto_1954130 ) ) ( not ( = ?auto_1954124 ?auto_1954131 ) ) ( not ( = ?auto_1954124 ?auto_1954132 ) ) ( not ( = ?auto_1954124 ?auto_1954133 ) ) ( not ( = ?auto_1954124 ?auto_1954134 ) ) ( not ( = ?auto_1954124 ?auto_1954138 ) ) ( not ( = ?auto_1954125 ?auto_1954126 ) ) ( not ( = ?auto_1954125 ?auto_1954127 ) ) ( not ( = ?auto_1954125 ?auto_1954128 ) ) ( not ( = ?auto_1954125 ?auto_1954129 ) ) ( not ( = ?auto_1954125 ?auto_1954130 ) ) ( not ( = ?auto_1954125 ?auto_1954131 ) ) ( not ( = ?auto_1954125 ?auto_1954132 ) ) ( not ( = ?auto_1954125 ?auto_1954133 ) ) ( not ( = ?auto_1954125 ?auto_1954134 ) ) ( not ( = ?auto_1954125 ?auto_1954138 ) ) ( not ( = ?auto_1954126 ?auto_1954127 ) ) ( not ( = ?auto_1954126 ?auto_1954128 ) ) ( not ( = ?auto_1954126 ?auto_1954129 ) ) ( not ( = ?auto_1954126 ?auto_1954130 ) ) ( not ( = ?auto_1954126 ?auto_1954131 ) ) ( not ( = ?auto_1954126 ?auto_1954132 ) ) ( not ( = ?auto_1954126 ?auto_1954133 ) ) ( not ( = ?auto_1954126 ?auto_1954134 ) ) ( not ( = ?auto_1954126 ?auto_1954138 ) ) ( not ( = ?auto_1954127 ?auto_1954128 ) ) ( not ( = ?auto_1954127 ?auto_1954129 ) ) ( not ( = ?auto_1954127 ?auto_1954130 ) ) ( not ( = ?auto_1954127 ?auto_1954131 ) ) ( not ( = ?auto_1954127 ?auto_1954132 ) ) ( not ( = ?auto_1954127 ?auto_1954133 ) ) ( not ( = ?auto_1954127 ?auto_1954134 ) ) ( not ( = ?auto_1954127 ?auto_1954138 ) ) ( not ( = ?auto_1954128 ?auto_1954129 ) ) ( not ( = ?auto_1954128 ?auto_1954130 ) ) ( not ( = ?auto_1954128 ?auto_1954131 ) ) ( not ( = ?auto_1954128 ?auto_1954132 ) ) ( not ( = ?auto_1954128 ?auto_1954133 ) ) ( not ( = ?auto_1954128 ?auto_1954134 ) ) ( not ( = ?auto_1954128 ?auto_1954138 ) ) ( not ( = ?auto_1954129 ?auto_1954130 ) ) ( not ( = ?auto_1954129 ?auto_1954131 ) ) ( not ( = ?auto_1954129 ?auto_1954132 ) ) ( not ( = ?auto_1954129 ?auto_1954133 ) ) ( not ( = ?auto_1954129 ?auto_1954134 ) ) ( not ( = ?auto_1954129 ?auto_1954138 ) ) ( not ( = ?auto_1954130 ?auto_1954131 ) ) ( not ( = ?auto_1954130 ?auto_1954132 ) ) ( not ( = ?auto_1954130 ?auto_1954133 ) ) ( not ( = ?auto_1954130 ?auto_1954134 ) ) ( not ( = ?auto_1954130 ?auto_1954138 ) ) ( not ( = ?auto_1954131 ?auto_1954132 ) ) ( not ( = ?auto_1954131 ?auto_1954133 ) ) ( not ( = ?auto_1954131 ?auto_1954134 ) ) ( not ( = ?auto_1954131 ?auto_1954138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954132 ?auto_1954133 ?auto_1954134 )
      ( MAKE-12CRATE-VERIFY ?auto_1954122 ?auto_1954123 ?auto_1954124 ?auto_1954125 ?auto_1954126 ?auto_1954127 ?auto_1954128 ?auto_1954129 ?auto_1954130 ?auto_1954131 ?auto_1954132 ?auto_1954133 ?auto_1954134 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954285 - SURFACE
      ?auto_1954286 - SURFACE
      ?auto_1954287 - SURFACE
      ?auto_1954288 - SURFACE
      ?auto_1954289 - SURFACE
      ?auto_1954290 - SURFACE
      ?auto_1954291 - SURFACE
      ?auto_1954292 - SURFACE
      ?auto_1954293 - SURFACE
      ?auto_1954294 - SURFACE
      ?auto_1954295 - SURFACE
      ?auto_1954296 - SURFACE
      ?auto_1954297 - SURFACE
    )
    :vars
    (
      ?auto_1954303 - HOIST
      ?auto_1954302 - PLACE
      ?auto_1954299 - PLACE
      ?auto_1954301 - HOIST
      ?auto_1954298 - SURFACE
      ?auto_1954300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954303 ?auto_1954302 ) ( IS-CRATE ?auto_1954297 ) ( not ( = ?auto_1954296 ?auto_1954297 ) ) ( not ( = ?auto_1954295 ?auto_1954296 ) ) ( not ( = ?auto_1954295 ?auto_1954297 ) ) ( not ( = ?auto_1954299 ?auto_1954302 ) ) ( HOIST-AT ?auto_1954301 ?auto_1954299 ) ( not ( = ?auto_1954303 ?auto_1954301 ) ) ( AVAILABLE ?auto_1954301 ) ( SURFACE-AT ?auto_1954297 ?auto_1954299 ) ( ON ?auto_1954297 ?auto_1954298 ) ( CLEAR ?auto_1954297 ) ( not ( = ?auto_1954296 ?auto_1954298 ) ) ( not ( = ?auto_1954297 ?auto_1954298 ) ) ( not ( = ?auto_1954295 ?auto_1954298 ) ) ( TRUCK-AT ?auto_1954300 ?auto_1954302 ) ( SURFACE-AT ?auto_1954295 ?auto_1954302 ) ( CLEAR ?auto_1954295 ) ( LIFTING ?auto_1954303 ?auto_1954296 ) ( IS-CRATE ?auto_1954296 ) ( ON ?auto_1954286 ?auto_1954285 ) ( ON ?auto_1954287 ?auto_1954286 ) ( ON ?auto_1954288 ?auto_1954287 ) ( ON ?auto_1954289 ?auto_1954288 ) ( ON ?auto_1954290 ?auto_1954289 ) ( ON ?auto_1954291 ?auto_1954290 ) ( ON ?auto_1954292 ?auto_1954291 ) ( ON ?auto_1954293 ?auto_1954292 ) ( ON ?auto_1954294 ?auto_1954293 ) ( ON ?auto_1954295 ?auto_1954294 ) ( not ( = ?auto_1954285 ?auto_1954286 ) ) ( not ( = ?auto_1954285 ?auto_1954287 ) ) ( not ( = ?auto_1954285 ?auto_1954288 ) ) ( not ( = ?auto_1954285 ?auto_1954289 ) ) ( not ( = ?auto_1954285 ?auto_1954290 ) ) ( not ( = ?auto_1954285 ?auto_1954291 ) ) ( not ( = ?auto_1954285 ?auto_1954292 ) ) ( not ( = ?auto_1954285 ?auto_1954293 ) ) ( not ( = ?auto_1954285 ?auto_1954294 ) ) ( not ( = ?auto_1954285 ?auto_1954295 ) ) ( not ( = ?auto_1954285 ?auto_1954296 ) ) ( not ( = ?auto_1954285 ?auto_1954297 ) ) ( not ( = ?auto_1954285 ?auto_1954298 ) ) ( not ( = ?auto_1954286 ?auto_1954287 ) ) ( not ( = ?auto_1954286 ?auto_1954288 ) ) ( not ( = ?auto_1954286 ?auto_1954289 ) ) ( not ( = ?auto_1954286 ?auto_1954290 ) ) ( not ( = ?auto_1954286 ?auto_1954291 ) ) ( not ( = ?auto_1954286 ?auto_1954292 ) ) ( not ( = ?auto_1954286 ?auto_1954293 ) ) ( not ( = ?auto_1954286 ?auto_1954294 ) ) ( not ( = ?auto_1954286 ?auto_1954295 ) ) ( not ( = ?auto_1954286 ?auto_1954296 ) ) ( not ( = ?auto_1954286 ?auto_1954297 ) ) ( not ( = ?auto_1954286 ?auto_1954298 ) ) ( not ( = ?auto_1954287 ?auto_1954288 ) ) ( not ( = ?auto_1954287 ?auto_1954289 ) ) ( not ( = ?auto_1954287 ?auto_1954290 ) ) ( not ( = ?auto_1954287 ?auto_1954291 ) ) ( not ( = ?auto_1954287 ?auto_1954292 ) ) ( not ( = ?auto_1954287 ?auto_1954293 ) ) ( not ( = ?auto_1954287 ?auto_1954294 ) ) ( not ( = ?auto_1954287 ?auto_1954295 ) ) ( not ( = ?auto_1954287 ?auto_1954296 ) ) ( not ( = ?auto_1954287 ?auto_1954297 ) ) ( not ( = ?auto_1954287 ?auto_1954298 ) ) ( not ( = ?auto_1954288 ?auto_1954289 ) ) ( not ( = ?auto_1954288 ?auto_1954290 ) ) ( not ( = ?auto_1954288 ?auto_1954291 ) ) ( not ( = ?auto_1954288 ?auto_1954292 ) ) ( not ( = ?auto_1954288 ?auto_1954293 ) ) ( not ( = ?auto_1954288 ?auto_1954294 ) ) ( not ( = ?auto_1954288 ?auto_1954295 ) ) ( not ( = ?auto_1954288 ?auto_1954296 ) ) ( not ( = ?auto_1954288 ?auto_1954297 ) ) ( not ( = ?auto_1954288 ?auto_1954298 ) ) ( not ( = ?auto_1954289 ?auto_1954290 ) ) ( not ( = ?auto_1954289 ?auto_1954291 ) ) ( not ( = ?auto_1954289 ?auto_1954292 ) ) ( not ( = ?auto_1954289 ?auto_1954293 ) ) ( not ( = ?auto_1954289 ?auto_1954294 ) ) ( not ( = ?auto_1954289 ?auto_1954295 ) ) ( not ( = ?auto_1954289 ?auto_1954296 ) ) ( not ( = ?auto_1954289 ?auto_1954297 ) ) ( not ( = ?auto_1954289 ?auto_1954298 ) ) ( not ( = ?auto_1954290 ?auto_1954291 ) ) ( not ( = ?auto_1954290 ?auto_1954292 ) ) ( not ( = ?auto_1954290 ?auto_1954293 ) ) ( not ( = ?auto_1954290 ?auto_1954294 ) ) ( not ( = ?auto_1954290 ?auto_1954295 ) ) ( not ( = ?auto_1954290 ?auto_1954296 ) ) ( not ( = ?auto_1954290 ?auto_1954297 ) ) ( not ( = ?auto_1954290 ?auto_1954298 ) ) ( not ( = ?auto_1954291 ?auto_1954292 ) ) ( not ( = ?auto_1954291 ?auto_1954293 ) ) ( not ( = ?auto_1954291 ?auto_1954294 ) ) ( not ( = ?auto_1954291 ?auto_1954295 ) ) ( not ( = ?auto_1954291 ?auto_1954296 ) ) ( not ( = ?auto_1954291 ?auto_1954297 ) ) ( not ( = ?auto_1954291 ?auto_1954298 ) ) ( not ( = ?auto_1954292 ?auto_1954293 ) ) ( not ( = ?auto_1954292 ?auto_1954294 ) ) ( not ( = ?auto_1954292 ?auto_1954295 ) ) ( not ( = ?auto_1954292 ?auto_1954296 ) ) ( not ( = ?auto_1954292 ?auto_1954297 ) ) ( not ( = ?auto_1954292 ?auto_1954298 ) ) ( not ( = ?auto_1954293 ?auto_1954294 ) ) ( not ( = ?auto_1954293 ?auto_1954295 ) ) ( not ( = ?auto_1954293 ?auto_1954296 ) ) ( not ( = ?auto_1954293 ?auto_1954297 ) ) ( not ( = ?auto_1954293 ?auto_1954298 ) ) ( not ( = ?auto_1954294 ?auto_1954295 ) ) ( not ( = ?auto_1954294 ?auto_1954296 ) ) ( not ( = ?auto_1954294 ?auto_1954297 ) ) ( not ( = ?auto_1954294 ?auto_1954298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954295 ?auto_1954296 ?auto_1954297 )
      ( MAKE-12CRATE-VERIFY ?auto_1954285 ?auto_1954286 ?auto_1954287 ?auto_1954288 ?auto_1954289 ?auto_1954290 ?auto_1954291 ?auto_1954292 ?auto_1954293 ?auto_1954294 ?auto_1954295 ?auto_1954296 ?auto_1954297 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954448 - SURFACE
      ?auto_1954449 - SURFACE
      ?auto_1954450 - SURFACE
      ?auto_1954451 - SURFACE
      ?auto_1954452 - SURFACE
      ?auto_1954453 - SURFACE
      ?auto_1954454 - SURFACE
      ?auto_1954455 - SURFACE
      ?auto_1954456 - SURFACE
      ?auto_1954457 - SURFACE
      ?auto_1954458 - SURFACE
      ?auto_1954459 - SURFACE
      ?auto_1954460 - SURFACE
    )
    :vars
    (
      ?auto_1954464 - HOIST
      ?auto_1954461 - PLACE
      ?auto_1954462 - PLACE
      ?auto_1954466 - HOIST
      ?auto_1954465 - SURFACE
      ?auto_1954463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954464 ?auto_1954461 ) ( IS-CRATE ?auto_1954460 ) ( not ( = ?auto_1954459 ?auto_1954460 ) ) ( not ( = ?auto_1954458 ?auto_1954459 ) ) ( not ( = ?auto_1954458 ?auto_1954460 ) ) ( not ( = ?auto_1954462 ?auto_1954461 ) ) ( HOIST-AT ?auto_1954466 ?auto_1954462 ) ( not ( = ?auto_1954464 ?auto_1954466 ) ) ( AVAILABLE ?auto_1954466 ) ( SURFACE-AT ?auto_1954460 ?auto_1954462 ) ( ON ?auto_1954460 ?auto_1954465 ) ( CLEAR ?auto_1954460 ) ( not ( = ?auto_1954459 ?auto_1954465 ) ) ( not ( = ?auto_1954460 ?auto_1954465 ) ) ( not ( = ?auto_1954458 ?auto_1954465 ) ) ( TRUCK-AT ?auto_1954463 ?auto_1954461 ) ( SURFACE-AT ?auto_1954458 ?auto_1954461 ) ( CLEAR ?auto_1954458 ) ( IS-CRATE ?auto_1954459 ) ( AVAILABLE ?auto_1954464 ) ( IN ?auto_1954459 ?auto_1954463 ) ( ON ?auto_1954449 ?auto_1954448 ) ( ON ?auto_1954450 ?auto_1954449 ) ( ON ?auto_1954451 ?auto_1954450 ) ( ON ?auto_1954452 ?auto_1954451 ) ( ON ?auto_1954453 ?auto_1954452 ) ( ON ?auto_1954454 ?auto_1954453 ) ( ON ?auto_1954455 ?auto_1954454 ) ( ON ?auto_1954456 ?auto_1954455 ) ( ON ?auto_1954457 ?auto_1954456 ) ( ON ?auto_1954458 ?auto_1954457 ) ( not ( = ?auto_1954448 ?auto_1954449 ) ) ( not ( = ?auto_1954448 ?auto_1954450 ) ) ( not ( = ?auto_1954448 ?auto_1954451 ) ) ( not ( = ?auto_1954448 ?auto_1954452 ) ) ( not ( = ?auto_1954448 ?auto_1954453 ) ) ( not ( = ?auto_1954448 ?auto_1954454 ) ) ( not ( = ?auto_1954448 ?auto_1954455 ) ) ( not ( = ?auto_1954448 ?auto_1954456 ) ) ( not ( = ?auto_1954448 ?auto_1954457 ) ) ( not ( = ?auto_1954448 ?auto_1954458 ) ) ( not ( = ?auto_1954448 ?auto_1954459 ) ) ( not ( = ?auto_1954448 ?auto_1954460 ) ) ( not ( = ?auto_1954448 ?auto_1954465 ) ) ( not ( = ?auto_1954449 ?auto_1954450 ) ) ( not ( = ?auto_1954449 ?auto_1954451 ) ) ( not ( = ?auto_1954449 ?auto_1954452 ) ) ( not ( = ?auto_1954449 ?auto_1954453 ) ) ( not ( = ?auto_1954449 ?auto_1954454 ) ) ( not ( = ?auto_1954449 ?auto_1954455 ) ) ( not ( = ?auto_1954449 ?auto_1954456 ) ) ( not ( = ?auto_1954449 ?auto_1954457 ) ) ( not ( = ?auto_1954449 ?auto_1954458 ) ) ( not ( = ?auto_1954449 ?auto_1954459 ) ) ( not ( = ?auto_1954449 ?auto_1954460 ) ) ( not ( = ?auto_1954449 ?auto_1954465 ) ) ( not ( = ?auto_1954450 ?auto_1954451 ) ) ( not ( = ?auto_1954450 ?auto_1954452 ) ) ( not ( = ?auto_1954450 ?auto_1954453 ) ) ( not ( = ?auto_1954450 ?auto_1954454 ) ) ( not ( = ?auto_1954450 ?auto_1954455 ) ) ( not ( = ?auto_1954450 ?auto_1954456 ) ) ( not ( = ?auto_1954450 ?auto_1954457 ) ) ( not ( = ?auto_1954450 ?auto_1954458 ) ) ( not ( = ?auto_1954450 ?auto_1954459 ) ) ( not ( = ?auto_1954450 ?auto_1954460 ) ) ( not ( = ?auto_1954450 ?auto_1954465 ) ) ( not ( = ?auto_1954451 ?auto_1954452 ) ) ( not ( = ?auto_1954451 ?auto_1954453 ) ) ( not ( = ?auto_1954451 ?auto_1954454 ) ) ( not ( = ?auto_1954451 ?auto_1954455 ) ) ( not ( = ?auto_1954451 ?auto_1954456 ) ) ( not ( = ?auto_1954451 ?auto_1954457 ) ) ( not ( = ?auto_1954451 ?auto_1954458 ) ) ( not ( = ?auto_1954451 ?auto_1954459 ) ) ( not ( = ?auto_1954451 ?auto_1954460 ) ) ( not ( = ?auto_1954451 ?auto_1954465 ) ) ( not ( = ?auto_1954452 ?auto_1954453 ) ) ( not ( = ?auto_1954452 ?auto_1954454 ) ) ( not ( = ?auto_1954452 ?auto_1954455 ) ) ( not ( = ?auto_1954452 ?auto_1954456 ) ) ( not ( = ?auto_1954452 ?auto_1954457 ) ) ( not ( = ?auto_1954452 ?auto_1954458 ) ) ( not ( = ?auto_1954452 ?auto_1954459 ) ) ( not ( = ?auto_1954452 ?auto_1954460 ) ) ( not ( = ?auto_1954452 ?auto_1954465 ) ) ( not ( = ?auto_1954453 ?auto_1954454 ) ) ( not ( = ?auto_1954453 ?auto_1954455 ) ) ( not ( = ?auto_1954453 ?auto_1954456 ) ) ( not ( = ?auto_1954453 ?auto_1954457 ) ) ( not ( = ?auto_1954453 ?auto_1954458 ) ) ( not ( = ?auto_1954453 ?auto_1954459 ) ) ( not ( = ?auto_1954453 ?auto_1954460 ) ) ( not ( = ?auto_1954453 ?auto_1954465 ) ) ( not ( = ?auto_1954454 ?auto_1954455 ) ) ( not ( = ?auto_1954454 ?auto_1954456 ) ) ( not ( = ?auto_1954454 ?auto_1954457 ) ) ( not ( = ?auto_1954454 ?auto_1954458 ) ) ( not ( = ?auto_1954454 ?auto_1954459 ) ) ( not ( = ?auto_1954454 ?auto_1954460 ) ) ( not ( = ?auto_1954454 ?auto_1954465 ) ) ( not ( = ?auto_1954455 ?auto_1954456 ) ) ( not ( = ?auto_1954455 ?auto_1954457 ) ) ( not ( = ?auto_1954455 ?auto_1954458 ) ) ( not ( = ?auto_1954455 ?auto_1954459 ) ) ( not ( = ?auto_1954455 ?auto_1954460 ) ) ( not ( = ?auto_1954455 ?auto_1954465 ) ) ( not ( = ?auto_1954456 ?auto_1954457 ) ) ( not ( = ?auto_1954456 ?auto_1954458 ) ) ( not ( = ?auto_1954456 ?auto_1954459 ) ) ( not ( = ?auto_1954456 ?auto_1954460 ) ) ( not ( = ?auto_1954456 ?auto_1954465 ) ) ( not ( = ?auto_1954457 ?auto_1954458 ) ) ( not ( = ?auto_1954457 ?auto_1954459 ) ) ( not ( = ?auto_1954457 ?auto_1954460 ) ) ( not ( = ?auto_1954457 ?auto_1954465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954458 ?auto_1954459 ?auto_1954460 )
      ( MAKE-12CRATE-VERIFY ?auto_1954448 ?auto_1954449 ?auto_1954450 ?auto_1954451 ?auto_1954452 ?auto_1954453 ?auto_1954454 ?auto_1954455 ?auto_1954456 ?auto_1954457 ?auto_1954458 ?auto_1954459 ?auto_1954460 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1965980 - SURFACE
      ?auto_1965981 - SURFACE
      ?auto_1965982 - SURFACE
      ?auto_1965983 - SURFACE
      ?auto_1965984 - SURFACE
      ?auto_1965985 - SURFACE
      ?auto_1965986 - SURFACE
      ?auto_1965987 - SURFACE
      ?auto_1965988 - SURFACE
      ?auto_1965989 - SURFACE
      ?auto_1965990 - SURFACE
      ?auto_1965991 - SURFACE
      ?auto_1965992 - SURFACE
      ?auto_1965993 - SURFACE
    )
    :vars
    (
      ?auto_1965994 - HOIST
      ?auto_1965995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1965994 ?auto_1965995 ) ( SURFACE-AT ?auto_1965992 ?auto_1965995 ) ( CLEAR ?auto_1965992 ) ( LIFTING ?auto_1965994 ?auto_1965993 ) ( IS-CRATE ?auto_1965993 ) ( not ( = ?auto_1965992 ?auto_1965993 ) ) ( ON ?auto_1965981 ?auto_1965980 ) ( ON ?auto_1965982 ?auto_1965981 ) ( ON ?auto_1965983 ?auto_1965982 ) ( ON ?auto_1965984 ?auto_1965983 ) ( ON ?auto_1965985 ?auto_1965984 ) ( ON ?auto_1965986 ?auto_1965985 ) ( ON ?auto_1965987 ?auto_1965986 ) ( ON ?auto_1965988 ?auto_1965987 ) ( ON ?auto_1965989 ?auto_1965988 ) ( ON ?auto_1965990 ?auto_1965989 ) ( ON ?auto_1965991 ?auto_1965990 ) ( ON ?auto_1965992 ?auto_1965991 ) ( not ( = ?auto_1965980 ?auto_1965981 ) ) ( not ( = ?auto_1965980 ?auto_1965982 ) ) ( not ( = ?auto_1965980 ?auto_1965983 ) ) ( not ( = ?auto_1965980 ?auto_1965984 ) ) ( not ( = ?auto_1965980 ?auto_1965985 ) ) ( not ( = ?auto_1965980 ?auto_1965986 ) ) ( not ( = ?auto_1965980 ?auto_1965987 ) ) ( not ( = ?auto_1965980 ?auto_1965988 ) ) ( not ( = ?auto_1965980 ?auto_1965989 ) ) ( not ( = ?auto_1965980 ?auto_1965990 ) ) ( not ( = ?auto_1965980 ?auto_1965991 ) ) ( not ( = ?auto_1965980 ?auto_1965992 ) ) ( not ( = ?auto_1965980 ?auto_1965993 ) ) ( not ( = ?auto_1965981 ?auto_1965982 ) ) ( not ( = ?auto_1965981 ?auto_1965983 ) ) ( not ( = ?auto_1965981 ?auto_1965984 ) ) ( not ( = ?auto_1965981 ?auto_1965985 ) ) ( not ( = ?auto_1965981 ?auto_1965986 ) ) ( not ( = ?auto_1965981 ?auto_1965987 ) ) ( not ( = ?auto_1965981 ?auto_1965988 ) ) ( not ( = ?auto_1965981 ?auto_1965989 ) ) ( not ( = ?auto_1965981 ?auto_1965990 ) ) ( not ( = ?auto_1965981 ?auto_1965991 ) ) ( not ( = ?auto_1965981 ?auto_1965992 ) ) ( not ( = ?auto_1965981 ?auto_1965993 ) ) ( not ( = ?auto_1965982 ?auto_1965983 ) ) ( not ( = ?auto_1965982 ?auto_1965984 ) ) ( not ( = ?auto_1965982 ?auto_1965985 ) ) ( not ( = ?auto_1965982 ?auto_1965986 ) ) ( not ( = ?auto_1965982 ?auto_1965987 ) ) ( not ( = ?auto_1965982 ?auto_1965988 ) ) ( not ( = ?auto_1965982 ?auto_1965989 ) ) ( not ( = ?auto_1965982 ?auto_1965990 ) ) ( not ( = ?auto_1965982 ?auto_1965991 ) ) ( not ( = ?auto_1965982 ?auto_1965992 ) ) ( not ( = ?auto_1965982 ?auto_1965993 ) ) ( not ( = ?auto_1965983 ?auto_1965984 ) ) ( not ( = ?auto_1965983 ?auto_1965985 ) ) ( not ( = ?auto_1965983 ?auto_1965986 ) ) ( not ( = ?auto_1965983 ?auto_1965987 ) ) ( not ( = ?auto_1965983 ?auto_1965988 ) ) ( not ( = ?auto_1965983 ?auto_1965989 ) ) ( not ( = ?auto_1965983 ?auto_1965990 ) ) ( not ( = ?auto_1965983 ?auto_1965991 ) ) ( not ( = ?auto_1965983 ?auto_1965992 ) ) ( not ( = ?auto_1965983 ?auto_1965993 ) ) ( not ( = ?auto_1965984 ?auto_1965985 ) ) ( not ( = ?auto_1965984 ?auto_1965986 ) ) ( not ( = ?auto_1965984 ?auto_1965987 ) ) ( not ( = ?auto_1965984 ?auto_1965988 ) ) ( not ( = ?auto_1965984 ?auto_1965989 ) ) ( not ( = ?auto_1965984 ?auto_1965990 ) ) ( not ( = ?auto_1965984 ?auto_1965991 ) ) ( not ( = ?auto_1965984 ?auto_1965992 ) ) ( not ( = ?auto_1965984 ?auto_1965993 ) ) ( not ( = ?auto_1965985 ?auto_1965986 ) ) ( not ( = ?auto_1965985 ?auto_1965987 ) ) ( not ( = ?auto_1965985 ?auto_1965988 ) ) ( not ( = ?auto_1965985 ?auto_1965989 ) ) ( not ( = ?auto_1965985 ?auto_1965990 ) ) ( not ( = ?auto_1965985 ?auto_1965991 ) ) ( not ( = ?auto_1965985 ?auto_1965992 ) ) ( not ( = ?auto_1965985 ?auto_1965993 ) ) ( not ( = ?auto_1965986 ?auto_1965987 ) ) ( not ( = ?auto_1965986 ?auto_1965988 ) ) ( not ( = ?auto_1965986 ?auto_1965989 ) ) ( not ( = ?auto_1965986 ?auto_1965990 ) ) ( not ( = ?auto_1965986 ?auto_1965991 ) ) ( not ( = ?auto_1965986 ?auto_1965992 ) ) ( not ( = ?auto_1965986 ?auto_1965993 ) ) ( not ( = ?auto_1965987 ?auto_1965988 ) ) ( not ( = ?auto_1965987 ?auto_1965989 ) ) ( not ( = ?auto_1965987 ?auto_1965990 ) ) ( not ( = ?auto_1965987 ?auto_1965991 ) ) ( not ( = ?auto_1965987 ?auto_1965992 ) ) ( not ( = ?auto_1965987 ?auto_1965993 ) ) ( not ( = ?auto_1965988 ?auto_1965989 ) ) ( not ( = ?auto_1965988 ?auto_1965990 ) ) ( not ( = ?auto_1965988 ?auto_1965991 ) ) ( not ( = ?auto_1965988 ?auto_1965992 ) ) ( not ( = ?auto_1965988 ?auto_1965993 ) ) ( not ( = ?auto_1965989 ?auto_1965990 ) ) ( not ( = ?auto_1965989 ?auto_1965991 ) ) ( not ( = ?auto_1965989 ?auto_1965992 ) ) ( not ( = ?auto_1965989 ?auto_1965993 ) ) ( not ( = ?auto_1965990 ?auto_1965991 ) ) ( not ( = ?auto_1965990 ?auto_1965992 ) ) ( not ( = ?auto_1965990 ?auto_1965993 ) ) ( not ( = ?auto_1965991 ?auto_1965992 ) ) ( not ( = ?auto_1965991 ?auto_1965993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1965992 ?auto_1965993 )
      ( MAKE-13CRATE-VERIFY ?auto_1965980 ?auto_1965981 ?auto_1965982 ?auto_1965983 ?auto_1965984 ?auto_1965985 ?auto_1965986 ?auto_1965987 ?auto_1965988 ?auto_1965989 ?auto_1965990 ?auto_1965991 ?auto_1965992 ?auto_1965993 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966122 - SURFACE
      ?auto_1966123 - SURFACE
      ?auto_1966124 - SURFACE
      ?auto_1966125 - SURFACE
      ?auto_1966126 - SURFACE
      ?auto_1966127 - SURFACE
      ?auto_1966128 - SURFACE
      ?auto_1966129 - SURFACE
      ?auto_1966130 - SURFACE
      ?auto_1966131 - SURFACE
      ?auto_1966132 - SURFACE
      ?auto_1966133 - SURFACE
      ?auto_1966134 - SURFACE
      ?auto_1966135 - SURFACE
    )
    :vars
    (
      ?auto_1966137 - HOIST
      ?auto_1966136 - PLACE
      ?auto_1966138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966137 ?auto_1966136 ) ( SURFACE-AT ?auto_1966134 ?auto_1966136 ) ( CLEAR ?auto_1966134 ) ( IS-CRATE ?auto_1966135 ) ( not ( = ?auto_1966134 ?auto_1966135 ) ) ( TRUCK-AT ?auto_1966138 ?auto_1966136 ) ( AVAILABLE ?auto_1966137 ) ( IN ?auto_1966135 ?auto_1966138 ) ( ON ?auto_1966134 ?auto_1966133 ) ( not ( = ?auto_1966133 ?auto_1966134 ) ) ( not ( = ?auto_1966133 ?auto_1966135 ) ) ( ON ?auto_1966123 ?auto_1966122 ) ( ON ?auto_1966124 ?auto_1966123 ) ( ON ?auto_1966125 ?auto_1966124 ) ( ON ?auto_1966126 ?auto_1966125 ) ( ON ?auto_1966127 ?auto_1966126 ) ( ON ?auto_1966128 ?auto_1966127 ) ( ON ?auto_1966129 ?auto_1966128 ) ( ON ?auto_1966130 ?auto_1966129 ) ( ON ?auto_1966131 ?auto_1966130 ) ( ON ?auto_1966132 ?auto_1966131 ) ( ON ?auto_1966133 ?auto_1966132 ) ( not ( = ?auto_1966122 ?auto_1966123 ) ) ( not ( = ?auto_1966122 ?auto_1966124 ) ) ( not ( = ?auto_1966122 ?auto_1966125 ) ) ( not ( = ?auto_1966122 ?auto_1966126 ) ) ( not ( = ?auto_1966122 ?auto_1966127 ) ) ( not ( = ?auto_1966122 ?auto_1966128 ) ) ( not ( = ?auto_1966122 ?auto_1966129 ) ) ( not ( = ?auto_1966122 ?auto_1966130 ) ) ( not ( = ?auto_1966122 ?auto_1966131 ) ) ( not ( = ?auto_1966122 ?auto_1966132 ) ) ( not ( = ?auto_1966122 ?auto_1966133 ) ) ( not ( = ?auto_1966122 ?auto_1966134 ) ) ( not ( = ?auto_1966122 ?auto_1966135 ) ) ( not ( = ?auto_1966123 ?auto_1966124 ) ) ( not ( = ?auto_1966123 ?auto_1966125 ) ) ( not ( = ?auto_1966123 ?auto_1966126 ) ) ( not ( = ?auto_1966123 ?auto_1966127 ) ) ( not ( = ?auto_1966123 ?auto_1966128 ) ) ( not ( = ?auto_1966123 ?auto_1966129 ) ) ( not ( = ?auto_1966123 ?auto_1966130 ) ) ( not ( = ?auto_1966123 ?auto_1966131 ) ) ( not ( = ?auto_1966123 ?auto_1966132 ) ) ( not ( = ?auto_1966123 ?auto_1966133 ) ) ( not ( = ?auto_1966123 ?auto_1966134 ) ) ( not ( = ?auto_1966123 ?auto_1966135 ) ) ( not ( = ?auto_1966124 ?auto_1966125 ) ) ( not ( = ?auto_1966124 ?auto_1966126 ) ) ( not ( = ?auto_1966124 ?auto_1966127 ) ) ( not ( = ?auto_1966124 ?auto_1966128 ) ) ( not ( = ?auto_1966124 ?auto_1966129 ) ) ( not ( = ?auto_1966124 ?auto_1966130 ) ) ( not ( = ?auto_1966124 ?auto_1966131 ) ) ( not ( = ?auto_1966124 ?auto_1966132 ) ) ( not ( = ?auto_1966124 ?auto_1966133 ) ) ( not ( = ?auto_1966124 ?auto_1966134 ) ) ( not ( = ?auto_1966124 ?auto_1966135 ) ) ( not ( = ?auto_1966125 ?auto_1966126 ) ) ( not ( = ?auto_1966125 ?auto_1966127 ) ) ( not ( = ?auto_1966125 ?auto_1966128 ) ) ( not ( = ?auto_1966125 ?auto_1966129 ) ) ( not ( = ?auto_1966125 ?auto_1966130 ) ) ( not ( = ?auto_1966125 ?auto_1966131 ) ) ( not ( = ?auto_1966125 ?auto_1966132 ) ) ( not ( = ?auto_1966125 ?auto_1966133 ) ) ( not ( = ?auto_1966125 ?auto_1966134 ) ) ( not ( = ?auto_1966125 ?auto_1966135 ) ) ( not ( = ?auto_1966126 ?auto_1966127 ) ) ( not ( = ?auto_1966126 ?auto_1966128 ) ) ( not ( = ?auto_1966126 ?auto_1966129 ) ) ( not ( = ?auto_1966126 ?auto_1966130 ) ) ( not ( = ?auto_1966126 ?auto_1966131 ) ) ( not ( = ?auto_1966126 ?auto_1966132 ) ) ( not ( = ?auto_1966126 ?auto_1966133 ) ) ( not ( = ?auto_1966126 ?auto_1966134 ) ) ( not ( = ?auto_1966126 ?auto_1966135 ) ) ( not ( = ?auto_1966127 ?auto_1966128 ) ) ( not ( = ?auto_1966127 ?auto_1966129 ) ) ( not ( = ?auto_1966127 ?auto_1966130 ) ) ( not ( = ?auto_1966127 ?auto_1966131 ) ) ( not ( = ?auto_1966127 ?auto_1966132 ) ) ( not ( = ?auto_1966127 ?auto_1966133 ) ) ( not ( = ?auto_1966127 ?auto_1966134 ) ) ( not ( = ?auto_1966127 ?auto_1966135 ) ) ( not ( = ?auto_1966128 ?auto_1966129 ) ) ( not ( = ?auto_1966128 ?auto_1966130 ) ) ( not ( = ?auto_1966128 ?auto_1966131 ) ) ( not ( = ?auto_1966128 ?auto_1966132 ) ) ( not ( = ?auto_1966128 ?auto_1966133 ) ) ( not ( = ?auto_1966128 ?auto_1966134 ) ) ( not ( = ?auto_1966128 ?auto_1966135 ) ) ( not ( = ?auto_1966129 ?auto_1966130 ) ) ( not ( = ?auto_1966129 ?auto_1966131 ) ) ( not ( = ?auto_1966129 ?auto_1966132 ) ) ( not ( = ?auto_1966129 ?auto_1966133 ) ) ( not ( = ?auto_1966129 ?auto_1966134 ) ) ( not ( = ?auto_1966129 ?auto_1966135 ) ) ( not ( = ?auto_1966130 ?auto_1966131 ) ) ( not ( = ?auto_1966130 ?auto_1966132 ) ) ( not ( = ?auto_1966130 ?auto_1966133 ) ) ( not ( = ?auto_1966130 ?auto_1966134 ) ) ( not ( = ?auto_1966130 ?auto_1966135 ) ) ( not ( = ?auto_1966131 ?auto_1966132 ) ) ( not ( = ?auto_1966131 ?auto_1966133 ) ) ( not ( = ?auto_1966131 ?auto_1966134 ) ) ( not ( = ?auto_1966131 ?auto_1966135 ) ) ( not ( = ?auto_1966132 ?auto_1966133 ) ) ( not ( = ?auto_1966132 ?auto_1966134 ) ) ( not ( = ?auto_1966132 ?auto_1966135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966133 ?auto_1966134 ?auto_1966135 )
      ( MAKE-13CRATE-VERIFY ?auto_1966122 ?auto_1966123 ?auto_1966124 ?auto_1966125 ?auto_1966126 ?auto_1966127 ?auto_1966128 ?auto_1966129 ?auto_1966130 ?auto_1966131 ?auto_1966132 ?auto_1966133 ?auto_1966134 ?auto_1966135 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966278 - SURFACE
      ?auto_1966279 - SURFACE
      ?auto_1966280 - SURFACE
      ?auto_1966281 - SURFACE
      ?auto_1966282 - SURFACE
      ?auto_1966283 - SURFACE
      ?auto_1966284 - SURFACE
      ?auto_1966285 - SURFACE
      ?auto_1966286 - SURFACE
      ?auto_1966287 - SURFACE
      ?auto_1966288 - SURFACE
      ?auto_1966289 - SURFACE
      ?auto_1966290 - SURFACE
      ?auto_1966291 - SURFACE
    )
    :vars
    (
      ?auto_1966293 - HOIST
      ?auto_1966294 - PLACE
      ?auto_1966292 - TRUCK
      ?auto_1966295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966293 ?auto_1966294 ) ( SURFACE-AT ?auto_1966290 ?auto_1966294 ) ( CLEAR ?auto_1966290 ) ( IS-CRATE ?auto_1966291 ) ( not ( = ?auto_1966290 ?auto_1966291 ) ) ( AVAILABLE ?auto_1966293 ) ( IN ?auto_1966291 ?auto_1966292 ) ( ON ?auto_1966290 ?auto_1966289 ) ( not ( = ?auto_1966289 ?auto_1966290 ) ) ( not ( = ?auto_1966289 ?auto_1966291 ) ) ( TRUCK-AT ?auto_1966292 ?auto_1966295 ) ( not ( = ?auto_1966295 ?auto_1966294 ) ) ( ON ?auto_1966279 ?auto_1966278 ) ( ON ?auto_1966280 ?auto_1966279 ) ( ON ?auto_1966281 ?auto_1966280 ) ( ON ?auto_1966282 ?auto_1966281 ) ( ON ?auto_1966283 ?auto_1966282 ) ( ON ?auto_1966284 ?auto_1966283 ) ( ON ?auto_1966285 ?auto_1966284 ) ( ON ?auto_1966286 ?auto_1966285 ) ( ON ?auto_1966287 ?auto_1966286 ) ( ON ?auto_1966288 ?auto_1966287 ) ( ON ?auto_1966289 ?auto_1966288 ) ( not ( = ?auto_1966278 ?auto_1966279 ) ) ( not ( = ?auto_1966278 ?auto_1966280 ) ) ( not ( = ?auto_1966278 ?auto_1966281 ) ) ( not ( = ?auto_1966278 ?auto_1966282 ) ) ( not ( = ?auto_1966278 ?auto_1966283 ) ) ( not ( = ?auto_1966278 ?auto_1966284 ) ) ( not ( = ?auto_1966278 ?auto_1966285 ) ) ( not ( = ?auto_1966278 ?auto_1966286 ) ) ( not ( = ?auto_1966278 ?auto_1966287 ) ) ( not ( = ?auto_1966278 ?auto_1966288 ) ) ( not ( = ?auto_1966278 ?auto_1966289 ) ) ( not ( = ?auto_1966278 ?auto_1966290 ) ) ( not ( = ?auto_1966278 ?auto_1966291 ) ) ( not ( = ?auto_1966279 ?auto_1966280 ) ) ( not ( = ?auto_1966279 ?auto_1966281 ) ) ( not ( = ?auto_1966279 ?auto_1966282 ) ) ( not ( = ?auto_1966279 ?auto_1966283 ) ) ( not ( = ?auto_1966279 ?auto_1966284 ) ) ( not ( = ?auto_1966279 ?auto_1966285 ) ) ( not ( = ?auto_1966279 ?auto_1966286 ) ) ( not ( = ?auto_1966279 ?auto_1966287 ) ) ( not ( = ?auto_1966279 ?auto_1966288 ) ) ( not ( = ?auto_1966279 ?auto_1966289 ) ) ( not ( = ?auto_1966279 ?auto_1966290 ) ) ( not ( = ?auto_1966279 ?auto_1966291 ) ) ( not ( = ?auto_1966280 ?auto_1966281 ) ) ( not ( = ?auto_1966280 ?auto_1966282 ) ) ( not ( = ?auto_1966280 ?auto_1966283 ) ) ( not ( = ?auto_1966280 ?auto_1966284 ) ) ( not ( = ?auto_1966280 ?auto_1966285 ) ) ( not ( = ?auto_1966280 ?auto_1966286 ) ) ( not ( = ?auto_1966280 ?auto_1966287 ) ) ( not ( = ?auto_1966280 ?auto_1966288 ) ) ( not ( = ?auto_1966280 ?auto_1966289 ) ) ( not ( = ?auto_1966280 ?auto_1966290 ) ) ( not ( = ?auto_1966280 ?auto_1966291 ) ) ( not ( = ?auto_1966281 ?auto_1966282 ) ) ( not ( = ?auto_1966281 ?auto_1966283 ) ) ( not ( = ?auto_1966281 ?auto_1966284 ) ) ( not ( = ?auto_1966281 ?auto_1966285 ) ) ( not ( = ?auto_1966281 ?auto_1966286 ) ) ( not ( = ?auto_1966281 ?auto_1966287 ) ) ( not ( = ?auto_1966281 ?auto_1966288 ) ) ( not ( = ?auto_1966281 ?auto_1966289 ) ) ( not ( = ?auto_1966281 ?auto_1966290 ) ) ( not ( = ?auto_1966281 ?auto_1966291 ) ) ( not ( = ?auto_1966282 ?auto_1966283 ) ) ( not ( = ?auto_1966282 ?auto_1966284 ) ) ( not ( = ?auto_1966282 ?auto_1966285 ) ) ( not ( = ?auto_1966282 ?auto_1966286 ) ) ( not ( = ?auto_1966282 ?auto_1966287 ) ) ( not ( = ?auto_1966282 ?auto_1966288 ) ) ( not ( = ?auto_1966282 ?auto_1966289 ) ) ( not ( = ?auto_1966282 ?auto_1966290 ) ) ( not ( = ?auto_1966282 ?auto_1966291 ) ) ( not ( = ?auto_1966283 ?auto_1966284 ) ) ( not ( = ?auto_1966283 ?auto_1966285 ) ) ( not ( = ?auto_1966283 ?auto_1966286 ) ) ( not ( = ?auto_1966283 ?auto_1966287 ) ) ( not ( = ?auto_1966283 ?auto_1966288 ) ) ( not ( = ?auto_1966283 ?auto_1966289 ) ) ( not ( = ?auto_1966283 ?auto_1966290 ) ) ( not ( = ?auto_1966283 ?auto_1966291 ) ) ( not ( = ?auto_1966284 ?auto_1966285 ) ) ( not ( = ?auto_1966284 ?auto_1966286 ) ) ( not ( = ?auto_1966284 ?auto_1966287 ) ) ( not ( = ?auto_1966284 ?auto_1966288 ) ) ( not ( = ?auto_1966284 ?auto_1966289 ) ) ( not ( = ?auto_1966284 ?auto_1966290 ) ) ( not ( = ?auto_1966284 ?auto_1966291 ) ) ( not ( = ?auto_1966285 ?auto_1966286 ) ) ( not ( = ?auto_1966285 ?auto_1966287 ) ) ( not ( = ?auto_1966285 ?auto_1966288 ) ) ( not ( = ?auto_1966285 ?auto_1966289 ) ) ( not ( = ?auto_1966285 ?auto_1966290 ) ) ( not ( = ?auto_1966285 ?auto_1966291 ) ) ( not ( = ?auto_1966286 ?auto_1966287 ) ) ( not ( = ?auto_1966286 ?auto_1966288 ) ) ( not ( = ?auto_1966286 ?auto_1966289 ) ) ( not ( = ?auto_1966286 ?auto_1966290 ) ) ( not ( = ?auto_1966286 ?auto_1966291 ) ) ( not ( = ?auto_1966287 ?auto_1966288 ) ) ( not ( = ?auto_1966287 ?auto_1966289 ) ) ( not ( = ?auto_1966287 ?auto_1966290 ) ) ( not ( = ?auto_1966287 ?auto_1966291 ) ) ( not ( = ?auto_1966288 ?auto_1966289 ) ) ( not ( = ?auto_1966288 ?auto_1966290 ) ) ( not ( = ?auto_1966288 ?auto_1966291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966289 ?auto_1966290 ?auto_1966291 )
      ( MAKE-13CRATE-VERIFY ?auto_1966278 ?auto_1966279 ?auto_1966280 ?auto_1966281 ?auto_1966282 ?auto_1966283 ?auto_1966284 ?auto_1966285 ?auto_1966286 ?auto_1966287 ?auto_1966288 ?auto_1966289 ?auto_1966290 ?auto_1966291 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966447 - SURFACE
      ?auto_1966448 - SURFACE
      ?auto_1966449 - SURFACE
      ?auto_1966450 - SURFACE
      ?auto_1966451 - SURFACE
      ?auto_1966452 - SURFACE
      ?auto_1966453 - SURFACE
      ?auto_1966454 - SURFACE
      ?auto_1966455 - SURFACE
      ?auto_1966456 - SURFACE
      ?auto_1966457 - SURFACE
      ?auto_1966458 - SURFACE
      ?auto_1966459 - SURFACE
      ?auto_1966460 - SURFACE
    )
    :vars
    (
      ?auto_1966463 - HOIST
      ?auto_1966465 - PLACE
      ?auto_1966464 - TRUCK
      ?auto_1966462 - PLACE
      ?auto_1966461 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966463 ?auto_1966465 ) ( SURFACE-AT ?auto_1966459 ?auto_1966465 ) ( CLEAR ?auto_1966459 ) ( IS-CRATE ?auto_1966460 ) ( not ( = ?auto_1966459 ?auto_1966460 ) ) ( AVAILABLE ?auto_1966463 ) ( ON ?auto_1966459 ?auto_1966458 ) ( not ( = ?auto_1966458 ?auto_1966459 ) ) ( not ( = ?auto_1966458 ?auto_1966460 ) ) ( TRUCK-AT ?auto_1966464 ?auto_1966462 ) ( not ( = ?auto_1966462 ?auto_1966465 ) ) ( HOIST-AT ?auto_1966461 ?auto_1966462 ) ( LIFTING ?auto_1966461 ?auto_1966460 ) ( not ( = ?auto_1966463 ?auto_1966461 ) ) ( ON ?auto_1966448 ?auto_1966447 ) ( ON ?auto_1966449 ?auto_1966448 ) ( ON ?auto_1966450 ?auto_1966449 ) ( ON ?auto_1966451 ?auto_1966450 ) ( ON ?auto_1966452 ?auto_1966451 ) ( ON ?auto_1966453 ?auto_1966452 ) ( ON ?auto_1966454 ?auto_1966453 ) ( ON ?auto_1966455 ?auto_1966454 ) ( ON ?auto_1966456 ?auto_1966455 ) ( ON ?auto_1966457 ?auto_1966456 ) ( ON ?auto_1966458 ?auto_1966457 ) ( not ( = ?auto_1966447 ?auto_1966448 ) ) ( not ( = ?auto_1966447 ?auto_1966449 ) ) ( not ( = ?auto_1966447 ?auto_1966450 ) ) ( not ( = ?auto_1966447 ?auto_1966451 ) ) ( not ( = ?auto_1966447 ?auto_1966452 ) ) ( not ( = ?auto_1966447 ?auto_1966453 ) ) ( not ( = ?auto_1966447 ?auto_1966454 ) ) ( not ( = ?auto_1966447 ?auto_1966455 ) ) ( not ( = ?auto_1966447 ?auto_1966456 ) ) ( not ( = ?auto_1966447 ?auto_1966457 ) ) ( not ( = ?auto_1966447 ?auto_1966458 ) ) ( not ( = ?auto_1966447 ?auto_1966459 ) ) ( not ( = ?auto_1966447 ?auto_1966460 ) ) ( not ( = ?auto_1966448 ?auto_1966449 ) ) ( not ( = ?auto_1966448 ?auto_1966450 ) ) ( not ( = ?auto_1966448 ?auto_1966451 ) ) ( not ( = ?auto_1966448 ?auto_1966452 ) ) ( not ( = ?auto_1966448 ?auto_1966453 ) ) ( not ( = ?auto_1966448 ?auto_1966454 ) ) ( not ( = ?auto_1966448 ?auto_1966455 ) ) ( not ( = ?auto_1966448 ?auto_1966456 ) ) ( not ( = ?auto_1966448 ?auto_1966457 ) ) ( not ( = ?auto_1966448 ?auto_1966458 ) ) ( not ( = ?auto_1966448 ?auto_1966459 ) ) ( not ( = ?auto_1966448 ?auto_1966460 ) ) ( not ( = ?auto_1966449 ?auto_1966450 ) ) ( not ( = ?auto_1966449 ?auto_1966451 ) ) ( not ( = ?auto_1966449 ?auto_1966452 ) ) ( not ( = ?auto_1966449 ?auto_1966453 ) ) ( not ( = ?auto_1966449 ?auto_1966454 ) ) ( not ( = ?auto_1966449 ?auto_1966455 ) ) ( not ( = ?auto_1966449 ?auto_1966456 ) ) ( not ( = ?auto_1966449 ?auto_1966457 ) ) ( not ( = ?auto_1966449 ?auto_1966458 ) ) ( not ( = ?auto_1966449 ?auto_1966459 ) ) ( not ( = ?auto_1966449 ?auto_1966460 ) ) ( not ( = ?auto_1966450 ?auto_1966451 ) ) ( not ( = ?auto_1966450 ?auto_1966452 ) ) ( not ( = ?auto_1966450 ?auto_1966453 ) ) ( not ( = ?auto_1966450 ?auto_1966454 ) ) ( not ( = ?auto_1966450 ?auto_1966455 ) ) ( not ( = ?auto_1966450 ?auto_1966456 ) ) ( not ( = ?auto_1966450 ?auto_1966457 ) ) ( not ( = ?auto_1966450 ?auto_1966458 ) ) ( not ( = ?auto_1966450 ?auto_1966459 ) ) ( not ( = ?auto_1966450 ?auto_1966460 ) ) ( not ( = ?auto_1966451 ?auto_1966452 ) ) ( not ( = ?auto_1966451 ?auto_1966453 ) ) ( not ( = ?auto_1966451 ?auto_1966454 ) ) ( not ( = ?auto_1966451 ?auto_1966455 ) ) ( not ( = ?auto_1966451 ?auto_1966456 ) ) ( not ( = ?auto_1966451 ?auto_1966457 ) ) ( not ( = ?auto_1966451 ?auto_1966458 ) ) ( not ( = ?auto_1966451 ?auto_1966459 ) ) ( not ( = ?auto_1966451 ?auto_1966460 ) ) ( not ( = ?auto_1966452 ?auto_1966453 ) ) ( not ( = ?auto_1966452 ?auto_1966454 ) ) ( not ( = ?auto_1966452 ?auto_1966455 ) ) ( not ( = ?auto_1966452 ?auto_1966456 ) ) ( not ( = ?auto_1966452 ?auto_1966457 ) ) ( not ( = ?auto_1966452 ?auto_1966458 ) ) ( not ( = ?auto_1966452 ?auto_1966459 ) ) ( not ( = ?auto_1966452 ?auto_1966460 ) ) ( not ( = ?auto_1966453 ?auto_1966454 ) ) ( not ( = ?auto_1966453 ?auto_1966455 ) ) ( not ( = ?auto_1966453 ?auto_1966456 ) ) ( not ( = ?auto_1966453 ?auto_1966457 ) ) ( not ( = ?auto_1966453 ?auto_1966458 ) ) ( not ( = ?auto_1966453 ?auto_1966459 ) ) ( not ( = ?auto_1966453 ?auto_1966460 ) ) ( not ( = ?auto_1966454 ?auto_1966455 ) ) ( not ( = ?auto_1966454 ?auto_1966456 ) ) ( not ( = ?auto_1966454 ?auto_1966457 ) ) ( not ( = ?auto_1966454 ?auto_1966458 ) ) ( not ( = ?auto_1966454 ?auto_1966459 ) ) ( not ( = ?auto_1966454 ?auto_1966460 ) ) ( not ( = ?auto_1966455 ?auto_1966456 ) ) ( not ( = ?auto_1966455 ?auto_1966457 ) ) ( not ( = ?auto_1966455 ?auto_1966458 ) ) ( not ( = ?auto_1966455 ?auto_1966459 ) ) ( not ( = ?auto_1966455 ?auto_1966460 ) ) ( not ( = ?auto_1966456 ?auto_1966457 ) ) ( not ( = ?auto_1966456 ?auto_1966458 ) ) ( not ( = ?auto_1966456 ?auto_1966459 ) ) ( not ( = ?auto_1966456 ?auto_1966460 ) ) ( not ( = ?auto_1966457 ?auto_1966458 ) ) ( not ( = ?auto_1966457 ?auto_1966459 ) ) ( not ( = ?auto_1966457 ?auto_1966460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966458 ?auto_1966459 ?auto_1966460 )
      ( MAKE-13CRATE-VERIFY ?auto_1966447 ?auto_1966448 ?auto_1966449 ?auto_1966450 ?auto_1966451 ?auto_1966452 ?auto_1966453 ?auto_1966454 ?auto_1966455 ?auto_1966456 ?auto_1966457 ?auto_1966458 ?auto_1966459 ?auto_1966460 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966629 - SURFACE
      ?auto_1966630 - SURFACE
      ?auto_1966631 - SURFACE
      ?auto_1966632 - SURFACE
      ?auto_1966633 - SURFACE
      ?auto_1966634 - SURFACE
      ?auto_1966635 - SURFACE
      ?auto_1966636 - SURFACE
      ?auto_1966637 - SURFACE
      ?auto_1966638 - SURFACE
      ?auto_1966639 - SURFACE
      ?auto_1966640 - SURFACE
      ?auto_1966641 - SURFACE
      ?auto_1966642 - SURFACE
    )
    :vars
    (
      ?auto_1966645 - HOIST
      ?auto_1966644 - PLACE
      ?auto_1966646 - TRUCK
      ?auto_1966643 - PLACE
      ?auto_1966648 - HOIST
      ?auto_1966647 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966645 ?auto_1966644 ) ( SURFACE-AT ?auto_1966641 ?auto_1966644 ) ( CLEAR ?auto_1966641 ) ( IS-CRATE ?auto_1966642 ) ( not ( = ?auto_1966641 ?auto_1966642 ) ) ( AVAILABLE ?auto_1966645 ) ( ON ?auto_1966641 ?auto_1966640 ) ( not ( = ?auto_1966640 ?auto_1966641 ) ) ( not ( = ?auto_1966640 ?auto_1966642 ) ) ( TRUCK-AT ?auto_1966646 ?auto_1966643 ) ( not ( = ?auto_1966643 ?auto_1966644 ) ) ( HOIST-AT ?auto_1966648 ?auto_1966643 ) ( not ( = ?auto_1966645 ?auto_1966648 ) ) ( AVAILABLE ?auto_1966648 ) ( SURFACE-AT ?auto_1966642 ?auto_1966643 ) ( ON ?auto_1966642 ?auto_1966647 ) ( CLEAR ?auto_1966642 ) ( not ( = ?auto_1966641 ?auto_1966647 ) ) ( not ( = ?auto_1966642 ?auto_1966647 ) ) ( not ( = ?auto_1966640 ?auto_1966647 ) ) ( ON ?auto_1966630 ?auto_1966629 ) ( ON ?auto_1966631 ?auto_1966630 ) ( ON ?auto_1966632 ?auto_1966631 ) ( ON ?auto_1966633 ?auto_1966632 ) ( ON ?auto_1966634 ?auto_1966633 ) ( ON ?auto_1966635 ?auto_1966634 ) ( ON ?auto_1966636 ?auto_1966635 ) ( ON ?auto_1966637 ?auto_1966636 ) ( ON ?auto_1966638 ?auto_1966637 ) ( ON ?auto_1966639 ?auto_1966638 ) ( ON ?auto_1966640 ?auto_1966639 ) ( not ( = ?auto_1966629 ?auto_1966630 ) ) ( not ( = ?auto_1966629 ?auto_1966631 ) ) ( not ( = ?auto_1966629 ?auto_1966632 ) ) ( not ( = ?auto_1966629 ?auto_1966633 ) ) ( not ( = ?auto_1966629 ?auto_1966634 ) ) ( not ( = ?auto_1966629 ?auto_1966635 ) ) ( not ( = ?auto_1966629 ?auto_1966636 ) ) ( not ( = ?auto_1966629 ?auto_1966637 ) ) ( not ( = ?auto_1966629 ?auto_1966638 ) ) ( not ( = ?auto_1966629 ?auto_1966639 ) ) ( not ( = ?auto_1966629 ?auto_1966640 ) ) ( not ( = ?auto_1966629 ?auto_1966641 ) ) ( not ( = ?auto_1966629 ?auto_1966642 ) ) ( not ( = ?auto_1966629 ?auto_1966647 ) ) ( not ( = ?auto_1966630 ?auto_1966631 ) ) ( not ( = ?auto_1966630 ?auto_1966632 ) ) ( not ( = ?auto_1966630 ?auto_1966633 ) ) ( not ( = ?auto_1966630 ?auto_1966634 ) ) ( not ( = ?auto_1966630 ?auto_1966635 ) ) ( not ( = ?auto_1966630 ?auto_1966636 ) ) ( not ( = ?auto_1966630 ?auto_1966637 ) ) ( not ( = ?auto_1966630 ?auto_1966638 ) ) ( not ( = ?auto_1966630 ?auto_1966639 ) ) ( not ( = ?auto_1966630 ?auto_1966640 ) ) ( not ( = ?auto_1966630 ?auto_1966641 ) ) ( not ( = ?auto_1966630 ?auto_1966642 ) ) ( not ( = ?auto_1966630 ?auto_1966647 ) ) ( not ( = ?auto_1966631 ?auto_1966632 ) ) ( not ( = ?auto_1966631 ?auto_1966633 ) ) ( not ( = ?auto_1966631 ?auto_1966634 ) ) ( not ( = ?auto_1966631 ?auto_1966635 ) ) ( not ( = ?auto_1966631 ?auto_1966636 ) ) ( not ( = ?auto_1966631 ?auto_1966637 ) ) ( not ( = ?auto_1966631 ?auto_1966638 ) ) ( not ( = ?auto_1966631 ?auto_1966639 ) ) ( not ( = ?auto_1966631 ?auto_1966640 ) ) ( not ( = ?auto_1966631 ?auto_1966641 ) ) ( not ( = ?auto_1966631 ?auto_1966642 ) ) ( not ( = ?auto_1966631 ?auto_1966647 ) ) ( not ( = ?auto_1966632 ?auto_1966633 ) ) ( not ( = ?auto_1966632 ?auto_1966634 ) ) ( not ( = ?auto_1966632 ?auto_1966635 ) ) ( not ( = ?auto_1966632 ?auto_1966636 ) ) ( not ( = ?auto_1966632 ?auto_1966637 ) ) ( not ( = ?auto_1966632 ?auto_1966638 ) ) ( not ( = ?auto_1966632 ?auto_1966639 ) ) ( not ( = ?auto_1966632 ?auto_1966640 ) ) ( not ( = ?auto_1966632 ?auto_1966641 ) ) ( not ( = ?auto_1966632 ?auto_1966642 ) ) ( not ( = ?auto_1966632 ?auto_1966647 ) ) ( not ( = ?auto_1966633 ?auto_1966634 ) ) ( not ( = ?auto_1966633 ?auto_1966635 ) ) ( not ( = ?auto_1966633 ?auto_1966636 ) ) ( not ( = ?auto_1966633 ?auto_1966637 ) ) ( not ( = ?auto_1966633 ?auto_1966638 ) ) ( not ( = ?auto_1966633 ?auto_1966639 ) ) ( not ( = ?auto_1966633 ?auto_1966640 ) ) ( not ( = ?auto_1966633 ?auto_1966641 ) ) ( not ( = ?auto_1966633 ?auto_1966642 ) ) ( not ( = ?auto_1966633 ?auto_1966647 ) ) ( not ( = ?auto_1966634 ?auto_1966635 ) ) ( not ( = ?auto_1966634 ?auto_1966636 ) ) ( not ( = ?auto_1966634 ?auto_1966637 ) ) ( not ( = ?auto_1966634 ?auto_1966638 ) ) ( not ( = ?auto_1966634 ?auto_1966639 ) ) ( not ( = ?auto_1966634 ?auto_1966640 ) ) ( not ( = ?auto_1966634 ?auto_1966641 ) ) ( not ( = ?auto_1966634 ?auto_1966642 ) ) ( not ( = ?auto_1966634 ?auto_1966647 ) ) ( not ( = ?auto_1966635 ?auto_1966636 ) ) ( not ( = ?auto_1966635 ?auto_1966637 ) ) ( not ( = ?auto_1966635 ?auto_1966638 ) ) ( not ( = ?auto_1966635 ?auto_1966639 ) ) ( not ( = ?auto_1966635 ?auto_1966640 ) ) ( not ( = ?auto_1966635 ?auto_1966641 ) ) ( not ( = ?auto_1966635 ?auto_1966642 ) ) ( not ( = ?auto_1966635 ?auto_1966647 ) ) ( not ( = ?auto_1966636 ?auto_1966637 ) ) ( not ( = ?auto_1966636 ?auto_1966638 ) ) ( not ( = ?auto_1966636 ?auto_1966639 ) ) ( not ( = ?auto_1966636 ?auto_1966640 ) ) ( not ( = ?auto_1966636 ?auto_1966641 ) ) ( not ( = ?auto_1966636 ?auto_1966642 ) ) ( not ( = ?auto_1966636 ?auto_1966647 ) ) ( not ( = ?auto_1966637 ?auto_1966638 ) ) ( not ( = ?auto_1966637 ?auto_1966639 ) ) ( not ( = ?auto_1966637 ?auto_1966640 ) ) ( not ( = ?auto_1966637 ?auto_1966641 ) ) ( not ( = ?auto_1966637 ?auto_1966642 ) ) ( not ( = ?auto_1966637 ?auto_1966647 ) ) ( not ( = ?auto_1966638 ?auto_1966639 ) ) ( not ( = ?auto_1966638 ?auto_1966640 ) ) ( not ( = ?auto_1966638 ?auto_1966641 ) ) ( not ( = ?auto_1966638 ?auto_1966642 ) ) ( not ( = ?auto_1966638 ?auto_1966647 ) ) ( not ( = ?auto_1966639 ?auto_1966640 ) ) ( not ( = ?auto_1966639 ?auto_1966641 ) ) ( not ( = ?auto_1966639 ?auto_1966642 ) ) ( not ( = ?auto_1966639 ?auto_1966647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966640 ?auto_1966641 ?auto_1966642 )
      ( MAKE-13CRATE-VERIFY ?auto_1966629 ?auto_1966630 ?auto_1966631 ?auto_1966632 ?auto_1966633 ?auto_1966634 ?auto_1966635 ?auto_1966636 ?auto_1966637 ?auto_1966638 ?auto_1966639 ?auto_1966640 ?auto_1966641 ?auto_1966642 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966812 - SURFACE
      ?auto_1966813 - SURFACE
      ?auto_1966814 - SURFACE
      ?auto_1966815 - SURFACE
      ?auto_1966816 - SURFACE
      ?auto_1966817 - SURFACE
      ?auto_1966818 - SURFACE
      ?auto_1966819 - SURFACE
      ?auto_1966820 - SURFACE
      ?auto_1966821 - SURFACE
      ?auto_1966822 - SURFACE
      ?auto_1966823 - SURFACE
      ?auto_1966824 - SURFACE
      ?auto_1966825 - SURFACE
    )
    :vars
    (
      ?auto_1966829 - HOIST
      ?auto_1966826 - PLACE
      ?auto_1966831 - PLACE
      ?auto_1966827 - HOIST
      ?auto_1966830 - SURFACE
      ?auto_1966828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966829 ?auto_1966826 ) ( SURFACE-AT ?auto_1966824 ?auto_1966826 ) ( CLEAR ?auto_1966824 ) ( IS-CRATE ?auto_1966825 ) ( not ( = ?auto_1966824 ?auto_1966825 ) ) ( AVAILABLE ?auto_1966829 ) ( ON ?auto_1966824 ?auto_1966823 ) ( not ( = ?auto_1966823 ?auto_1966824 ) ) ( not ( = ?auto_1966823 ?auto_1966825 ) ) ( not ( = ?auto_1966831 ?auto_1966826 ) ) ( HOIST-AT ?auto_1966827 ?auto_1966831 ) ( not ( = ?auto_1966829 ?auto_1966827 ) ) ( AVAILABLE ?auto_1966827 ) ( SURFACE-AT ?auto_1966825 ?auto_1966831 ) ( ON ?auto_1966825 ?auto_1966830 ) ( CLEAR ?auto_1966825 ) ( not ( = ?auto_1966824 ?auto_1966830 ) ) ( not ( = ?auto_1966825 ?auto_1966830 ) ) ( not ( = ?auto_1966823 ?auto_1966830 ) ) ( TRUCK-AT ?auto_1966828 ?auto_1966826 ) ( ON ?auto_1966813 ?auto_1966812 ) ( ON ?auto_1966814 ?auto_1966813 ) ( ON ?auto_1966815 ?auto_1966814 ) ( ON ?auto_1966816 ?auto_1966815 ) ( ON ?auto_1966817 ?auto_1966816 ) ( ON ?auto_1966818 ?auto_1966817 ) ( ON ?auto_1966819 ?auto_1966818 ) ( ON ?auto_1966820 ?auto_1966819 ) ( ON ?auto_1966821 ?auto_1966820 ) ( ON ?auto_1966822 ?auto_1966821 ) ( ON ?auto_1966823 ?auto_1966822 ) ( not ( = ?auto_1966812 ?auto_1966813 ) ) ( not ( = ?auto_1966812 ?auto_1966814 ) ) ( not ( = ?auto_1966812 ?auto_1966815 ) ) ( not ( = ?auto_1966812 ?auto_1966816 ) ) ( not ( = ?auto_1966812 ?auto_1966817 ) ) ( not ( = ?auto_1966812 ?auto_1966818 ) ) ( not ( = ?auto_1966812 ?auto_1966819 ) ) ( not ( = ?auto_1966812 ?auto_1966820 ) ) ( not ( = ?auto_1966812 ?auto_1966821 ) ) ( not ( = ?auto_1966812 ?auto_1966822 ) ) ( not ( = ?auto_1966812 ?auto_1966823 ) ) ( not ( = ?auto_1966812 ?auto_1966824 ) ) ( not ( = ?auto_1966812 ?auto_1966825 ) ) ( not ( = ?auto_1966812 ?auto_1966830 ) ) ( not ( = ?auto_1966813 ?auto_1966814 ) ) ( not ( = ?auto_1966813 ?auto_1966815 ) ) ( not ( = ?auto_1966813 ?auto_1966816 ) ) ( not ( = ?auto_1966813 ?auto_1966817 ) ) ( not ( = ?auto_1966813 ?auto_1966818 ) ) ( not ( = ?auto_1966813 ?auto_1966819 ) ) ( not ( = ?auto_1966813 ?auto_1966820 ) ) ( not ( = ?auto_1966813 ?auto_1966821 ) ) ( not ( = ?auto_1966813 ?auto_1966822 ) ) ( not ( = ?auto_1966813 ?auto_1966823 ) ) ( not ( = ?auto_1966813 ?auto_1966824 ) ) ( not ( = ?auto_1966813 ?auto_1966825 ) ) ( not ( = ?auto_1966813 ?auto_1966830 ) ) ( not ( = ?auto_1966814 ?auto_1966815 ) ) ( not ( = ?auto_1966814 ?auto_1966816 ) ) ( not ( = ?auto_1966814 ?auto_1966817 ) ) ( not ( = ?auto_1966814 ?auto_1966818 ) ) ( not ( = ?auto_1966814 ?auto_1966819 ) ) ( not ( = ?auto_1966814 ?auto_1966820 ) ) ( not ( = ?auto_1966814 ?auto_1966821 ) ) ( not ( = ?auto_1966814 ?auto_1966822 ) ) ( not ( = ?auto_1966814 ?auto_1966823 ) ) ( not ( = ?auto_1966814 ?auto_1966824 ) ) ( not ( = ?auto_1966814 ?auto_1966825 ) ) ( not ( = ?auto_1966814 ?auto_1966830 ) ) ( not ( = ?auto_1966815 ?auto_1966816 ) ) ( not ( = ?auto_1966815 ?auto_1966817 ) ) ( not ( = ?auto_1966815 ?auto_1966818 ) ) ( not ( = ?auto_1966815 ?auto_1966819 ) ) ( not ( = ?auto_1966815 ?auto_1966820 ) ) ( not ( = ?auto_1966815 ?auto_1966821 ) ) ( not ( = ?auto_1966815 ?auto_1966822 ) ) ( not ( = ?auto_1966815 ?auto_1966823 ) ) ( not ( = ?auto_1966815 ?auto_1966824 ) ) ( not ( = ?auto_1966815 ?auto_1966825 ) ) ( not ( = ?auto_1966815 ?auto_1966830 ) ) ( not ( = ?auto_1966816 ?auto_1966817 ) ) ( not ( = ?auto_1966816 ?auto_1966818 ) ) ( not ( = ?auto_1966816 ?auto_1966819 ) ) ( not ( = ?auto_1966816 ?auto_1966820 ) ) ( not ( = ?auto_1966816 ?auto_1966821 ) ) ( not ( = ?auto_1966816 ?auto_1966822 ) ) ( not ( = ?auto_1966816 ?auto_1966823 ) ) ( not ( = ?auto_1966816 ?auto_1966824 ) ) ( not ( = ?auto_1966816 ?auto_1966825 ) ) ( not ( = ?auto_1966816 ?auto_1966830 ) ) ( not ( = ?auto_1966817 ?auto_1966818 ) ) ( not ( = ?auto_1966817 ?auto_1966819 ) ) ( not ( = ?auto_1966817 ?auto_1966820 ) ) ( not ( = ?auto_1966817 ?auto_1966821 ) ) ( not ( = ?auto_1966817 ?auto_1966822 ) ) ( not ( = ?auto_1966817 ?auto_1966823 ) ) ( not ( = ?auto_1966817 ?auto_1966824 ) ) ( not ( = ?auto_1966817 ?auto_1966825 ) ) ( not ( = ?auto_1966817 ?auto_1966830 ) ) ( not ( = ?auto_1966818 ?auto_1966819 ) ) ( not ( = ?auto_1966818 ?auto_1966820 ) ) ( not ( = ?auto_1966818 ?auto_1966821 ) ) ( not ( = ?auto_1966818 ?auto_1966822 ) ) ( not ( = ?auto_1966818 ?auto_1966823 ) ) ( not ( = ?auto_1966818 ?auto_1966824 ) ) ( not ( = ?auto_1966818 ?auto_1966825 ) ) ( not ( = ?auto_1966818 ?auto_1966830 ) ) ( not ( = ?auto_1966819 ?auto_1966820 ) ) ( not ( = ?auto_1966819 ?auto_1966821 ) ) ( not ( = ?auto_1966819 ?auto_1966822 ) ) ( not ( = ?auto_1966819 ?auto_1966823 ) ) ( not ( = ?auto_1966819 ?auto_1966824 ) ) ( not ( = ?auto_1966819 ?auto_1966825 ) ) ( not ( = ?auto_1966819 ?auto_1966830 ) ) ( not ( = ?auto_1966820 ?auto_1966821 ) ) ( not ( = ?auto_1966820 ?auto_1966822 ) ) ( not ( = ?auto_1966820 ?auto_1966823 ) ) ( not ( = ?auto_1966820 ?auto_1966824 ) ) ( not ( = ?auto_1966820 ?auto_1966825 ) ) ( not ( = ?auto_1966820 ?auto_1966830 ) ) ( not ( = ?auto_1966821 ?auto_1966822 ) ) ( not ( = ?auto_1966821 ?auto_1966823 ) ) ( not ( = ?auto_1966821 ?auto_1966824 ) ) ( not ( = ?auto_1966821 ?auto_1966825 ) ) ( not ( = ?auto_1966821 ?auto_1966830 ) ) ( not ( = ?auto_1966822 ?auto_1966823 ) ) ( not ( = ?auto_1966822 ?auto_1966824 ) ) ( not ( = ?auto_1966822 ?auto_1966825 ) ) ( not ( = ?auto_1966822 ?auto_1966830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966823 ?auto_1966824 ?auto_1966825 )
      ( MAKE-13CRATE-VERIFY ?auto_1966812 ?auto_1966813 ?auto_1966814 ?auto_1966815 ?auto_1966816 ?auto_1966817 ?auto_1966818 ?auto_1966819 ?auto_1966820 ?auto_1966821 ?auto_1966822 ?auto_1966823 ?auto_1966824 ?auto_1966825 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966995 - SURFACE
      ?auto_1966996 - SURFACE
      ?auto_1966997 - SURFACE
      ?auto_1966998 - SURFACE
      ?auto_1966999 - SURFACE
      ?auto_1967000 - SURFACE
      ?auto_1967001 - SURFACE
      ?auto_1967002 - SURFACE
      ?auto_1967003 - SURFACE
      ?auto_1967004 - SURFACE
      ?auto_1967005 - SURFACE
      ?auto_1967006 - SURFACE
      ?auto_1967007 - SURFACE
      ?auto_1967008 - SURFACE
    )
    :vars
    (
      ?auto_1967010 - HOIST
      ?auto_1967009 - PLACE
      ?auto_1967011 - PLACE
      ?auto_1967014 - HOIST
      ?auto_1967012 - SURFACE
      ?auto_1967013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1967010 ?auto_1967009 ) ( IS-CRATE ?auto_1967008 ) ( not ( = ?auto_1967007 ?auto_1967008 ) ) ( not ( = ?auto_1967006 ?auto_1967007 ) ) ( not ( = ?auto_1967006 ?auto_1967008 ) ) ( not ( = ?auto_1967011 ?auto_1967009 ) ) ( HOIST-AT ?auto_1967014 ?auto_1967011 ) ( not ( = ?auto_1967010 ?auto_1967014 ) ) ( AVAILABLE ?auto_1967014 ) ( SURFACE-AT ?auto_1967008 ?auto_1967011 ) ( ON ?auto_1967008 ?auto_1967012 ) ( CLEAR ?auto_1967008 ) ( not ( = ?auto_1967007 ?auto_1967012 ) ) ( not ( = ?auto_1967008 ?auto_1967012 ) ) ( not ( = ?auto_1967006 ?auto_1967012 ) ) ( TRUCK-AT ?auto_1967013 ?auto_1967009 ) ( SURFACE-AT ?auto_1967006 ?auto_1967009 ) ( CLEAR ?auto_1967006 ) ( LIFTING ?auto_1967010 ?auto_1967007 ) ( IS-CRATE ?auto_1967007 ) ( ON ?auto_1966996 ?auto_1966995 ) ( ON ?auto_1966997 ?auto_1966996 ) ( ON ?auto_1966998 ?auto_1966997 ) ( ON ?auto_1966999 ?auto_1966998 ) ( ON ?auto_1967000 ?auto_1966999 ) ( ON ?auto_1967001 ?auto_1967000 ) ( ON ?auto_1967002 ?auto_1967001 ) ( ON ?auto_1967003 ?auto_1967002 ) ( ON ?auto_1967004 ?auto_1967003 ) ( ON ?auto_1967005 ?auto_1967004 ) ( ON ?auto_1967006 ?auto_1967005 ) ( not ( = ?auto_1966995 ?auto_1966996 ) ) ( not ( = ?auto_1966995 ?auto_1966997 ) ) ( not ( = ?auto_1966995 ?auto_1966998 ) ) ( not ( = ?auto_1966995 ?auto_1966999 ) ) ( not ( = ?auto_1966995 ?auto_1967000 ) ) ( not ( = ?auto_1966995 ?auto_1967001 ) ) ( not ( = ?auto_1966995 ?auto_1967002 ) ) ( not ( = ?auto_1966995 ?auto_1967003 ) ) ( not ( = ?auto_1966995 ?auto_1967004 ) ) ( not ( = ?auto_1966995 ?auto_1967005 ) ) ( not ( = ?auto_1966995 ?auto_1967006 ) ) ( not ( = ?auto_1966995 ?auto_1967007 ) ) ( not ( = ?auto_1966995 ?auto_1967008 ) ) ( not ( = ?auto_1966995 ?auto_1967012 ) ) ( not ( = ?auto_1966996 ?auto_1966997 ) ) ( not ( = ?auto_1966996 ?auto_1966998 ) ) ( not ( = ?auto_1966996 ?auto_1966999 ) ) ( not ( = ?auto_1966996 ?auto_1967000 ) ) ( not ( = ?auto_1966996 ?auto_1967001 ) ) ( not ( = ?auto_1966996 ?auto_1967002 ) ) ( not ( = ?auto_1966996 ?auto_1967003 ) ) ( not ( = ?auto_1966996 ?auto_1967004 ) ) ( not ( = ?auto_1966996 ?auto_1967005 ) ) ( not ( = ?auto_1966996 ?auto_1967006 ) ) ( not ( = ?auto_1966996 ?auto_1967007 ) ) ( not ( = ?auto_1966996 ?auto_1967008 ) ) ( not ( = ?auto_1966996 ?auto_1967012 ) ) ( not ( = ?auto_1966997 ?auto_1966998 ) ) ( not ( = ?auto_1966997 ?auto_1966999 ) ) ( not ( = ?auto_1966997 ?auto_1967000 ) ) ( not ( = ?auto_1966997 ?auto_1967001 ) ) ( not ( = ?auto_1966997 ?auto_1967002 ) ) ( not ( = ?auto_1966997 ?auto_1967003 ) ) ( not ( = ?auto_1966997 ?auto_1967004 ) ) ( not ( = ?auto_1966997 ?auto_1967005 ) ) ( not ( = ?auto_1966997 ?auto_1967006 ) ) ( not ( = ?auto_1966997 ?auto_1967007 ) ) ( not ( = ?auto_1966997 ?auto_1967008 ) ) ( not ( = ?auto_1966997 ?auto_1967012 ) ) ( not ( = ?auto_1966998 ?auto_1966999 ) ) ( not ( = ?auto_1966998 ?auto_1967000 ) ) ( not ( = ?auto_1966998 ?auto_1967001 ) ) ( not ( = ?auto_1966998 ?auto_1967002 ) ) ( not ( = ?auto_1966998 ?auto_1967003 ) ) ( not ( = ?auto_1966998 ?auto_1967004 ) ) ( not ( = ?auto_1966998 ?auto_1967005 ) ) ( not ( = ?auto_1966998 ?auto_1967006 ) ) ( not ( = ?auto_1966998 ?auto_1967007 ) ) ( not ( = ?auto_1966998 ?auto_1967008 ) ) ( not ( = ?auto_1966998 ?auto_1967012 ) ) ( not ( = ?auto_1966999 ?auto_1967000 ) ) ( not ( = ?auto_1966999 ?auto_1967001 ) ) ( not ( = ?auto_1966999 ?auto_1967002 ) ) ( not ( = ?auto_1966999 ?auto_1967003 ) ) ( not ( = ?auto_1966999 ?auto_1967004 ) ) ( not ( = ?auto_1966999 ?auto_1967005 ) ) ( not ( = ?auto_1966999 ?auto_1967006 ) ) ( not ( = ?auto_1966999 ?auto_1967007 ) ) ( not ( = ?auto_1966999 ?auto_1967008 ) ) ( not ( = ?auto_1966999 ?auto_1967012 ) ) ( not ( = ?auto_1967000 ?auto_1967001 ) ) ( not ( = ?auto_1967000 ?auto_1967002 ) ) ( not ( = ?auto_1967000 ?auto_1967003 ) ) ( not ( = ?auto_1967000 ?auto_1967004 ) ) ( not ( = ?auto_1967000 ?auto_1967005 ) ) ( not ( = ?auto_1967000 ?auto_1967006 ) ) ( not ( = ?auto_1967000 ?auto_1967007 ) ) ( not ( = ?auto_1967000 ?auto_1967008 ) ) ( not ( = ?auto_1967000 ?auto_1967012 ) ) ( not ( = ?auto_1967001 ?auto_1967002 ) ) ( not ( = ?auto_1967001 ?auto_1967003 ) ) ( not ( = ?auto_1967001 ?auto_1967004 ) ) ( not ( = ?auto_1967001 ?auto_1967005 ) ) ( not ( = ?auto_1967001 ?auto_1967006 ) ) ( not ( = ?auto_1967001 ?auto_1967007 ) ) ( not ( = ?auto_1967001 ?auto_1967008 ) ) ( not ( = ?auto_1967001 ?auto_1967012 ) ) ( not ( = ?auto_1967002 ?auto_1967003 ) ) ( not ( = ?auto_1967002 ?auto_1967004 ) ) ( not ( = ?auto_1967002 ?auto_1967005 ) ) ( not ( = ?auto_1967002 ?auto_1967006 ) ) ( not ( = ?auto_1967002 ?auto_1967007 ) ) ( not ( = ?auto_1967002 ?auto_1967008 ) ) ( not ( = ?auto_1967002 ?auto_1967012 ) ) ( not ( = ?auto_1967003 ?auto_1967004 ) ) ( not ( = ?auto_1967003 ?auto_1967005 ) ) ( not ( = ?auto_1967003 ?auto_1967006 ) ) ( not ( = ?auto_1967003 ?auto_1967007 ) ) ( not ( = ?auto_1967003 ?auto_1967008 ) ) ( not ( = ?auto_1967003 ?auto_1967012 ) ) ( not ( = ?auto_1967004 ?auto_1967005 ) ) ( not ( = ?auto_1967004 ?auto_1967006 ) ) ( not ( = ?auto_1967004 ?auto_1967007 ) ) ( not ( = ?auto_1967004 ?auto_1967008 ) ) ( not ( = ?auto_1967004 ?auto_1967012 ) ) ( not ( = ?auto_1967005 ?auto_1967006 ) ) ( not ( = ?auto_1967005 ?auto_1967007 ) ) ( not ( = ?auto_1967005 ?auto_1967008 ) ) ( not ( = ?auto_1967005 ?auto_1967012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1967006 ?auto_1967007 ?auto_1967008 )
      ( MAKE-13CRATE-VERIFY ?auto_1966995 ?auto_1966996 ?auto_1966997 ?auto_1966998 ?auto_1966999 ?auto_1967000 ?auto_1967001 ?auto_1967002 ?auto_1967003 ?auto_1967004 ?auto_1967005 ?auto_1967006 ?auto_1967007 ?auto_1967008 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1967178 - SURFACE
      ?auto_1967179 - SURFACE
      ?auto_1967180 - SURFACE
      ?auto_1967181 - SURFACE
      ?auto_1967182 - SURFACE
      ?auto_1967183 - SURFACE
      ?auto_1967184 - SURFACE
      ?auto_1967185 - SURFACE
      ?auto_1967186 - SURFACE
      ?auto_1967187 - SURFACE
      ?auto_1967188 - SURFACE
      ?auto_1967189 - SURFACE
      ?auto_1967190 - SURFACE
      ?auto_1967191 - SURFACE
    )
    :vars
    (
      ?auto_1967193 - HOIST
      ?auto_1967192 - PLACE
      ?auto_1967195 - PLACE
      ?auto_1967194 - HOIST
      ?auto_1967197 - SURFACE
      ?auto_1967196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1967193 ?auto_1967192 ) ( IS-CRATE ?auto_1967191 ) ( not ( = ?auto_1967190 ?auto_1967191 ) ) ( not ( = ?auto_1967189 ?auto_1967190 ) ) ( not ( = ?auto_1967189 ?auto_1967191 ) ) ( not ( = ?auto_1967195 ?auto_1967192 ) ) ( HOIST-AT ?auto_1967194 ?auto_1967195 ) ( not ( = ?auto_1967193 ?auto_1967194 ) ) ( AVAILABLE ?auto_1967194 ) ( SURFACE-AT ?auto_1967191 ?auto_1967195 ) ( ON ?auto_1967191 ?auto_1967197 ) ( CLEAR ?auto_1967191 ) ( not ( = ?auto_1967190 ?auto_1967197 ) ) ( not ( = ?auto_1967191 ?auto_1967197 ) ) ( not ( = ?auto_1967189 ?auto_1967197 ) ) ( TRUCK-AT ?auto_1967196 ?auto_1967192 ) ( SURFACE-AT ?auto_1967189 ?auto_1967192 ) ( CLEAR ?auto_1967189 ) ( IS-CRATE ?auto_1967190 ) ( AVAILABLE ?auto_1967193 ) ( IN ?auto_1967190 ?auto_1967196 ) ( ON ?auto_1967179 ?auto_1967178 ) ( ON ?auto_1967180 ?auto_1967179 ) ( ON ?auto_1967181 ?auto_1967180 ) ( ON ?auto_1967182 ?auto_1967181 ) ( ON ?auto_1967183 ?auto_1967182 ) ( ON ?auto_1967184 ?auto_1967183 ) ( ON ?auto_1967185 ?auto_1967184 ) ( ON ?auto_1967186 ?auto_1967185 ) ( ON ?auto_1967187 ?auto_1967186 ) ( ON ?auto_1967188 ?auto_1967187 ) ( ON ?auto_1967189 ?auto_1967188 ) ( not ( = ?auto_1967178 ?auto_1967179 ) ) ( not ( = ?auto_1967178 ?auto_1967180 ) ) ( not ( = ?auto_1967178 ?auto_1967181 ) ) ( not ( = ?auto_1967178 ?auto_1967182 ) ) ( not ( = ?auto_1967178 ?auto_1967183 ) ) ( not ( = ?auto_1967178 ?auto_1967184 ) ) ( not ( = ?auto_1967178 ?auto_1967185 ) ) ( not ( = ?auto_1967178 ?auto_1967186 ) ) ( not ( = ?auto_1967178 ?auto_1967187 ) ) ( not ( = ?auto_1967178 ?auto_1967188 ) ) ( not ( = ?auto_1967178 ?auto_1967189 ) ) ( not ( = ?auto_1967178 ?auto_1967190 ) ) ( not ( = ?auto_1967178 ?auto_1967191 ) ) ( not ( = ?auto_1967178 ?auto_1967197 ) ) ( not ( = ?auto_1967179 ?auto_1967180 ) ) ( not ( = ?auto_1967179 ?auto_1967181 ) ) ( not ( = ?auto_1967179 ?auto_1967182 ) ) ( not ( = ?auto_1967179 ?auto_1967183 ) ) ( not ( = ?auto_1967179 ?auto_1967184 ) ) ( not ( = ?auto_1967179 ?auto_1967185 ) ) ( not ( = ?auto_1967179 ?auto_1967186 ) ) ( not ( = ?auto_1967179 ?auto_1967187 ) ) ( not ( = ?auto_1967179 ?auto_1967188 ) ) ( not ( = ?auto_1967179 ?auto_1967189 ) ) ( not ( = ?auto_1967179 ?auto_1967190 ) ) ( not ( = ?auto_1967179 ?auto_1967191 ) ) ( not ( = ?auto_1967179 ?auto_1967197 ) ) ( not ( = ?auto_1967180 ?auto_1967181 ) ) ( not ( = ?auto_1967180 ?auto_1967182 ) ) ( not ( = ?auto_1967180 ?auto_1967183 ) ) ( not ( = ?auto_1967180 ?auto_1967184 ) ) ( not ( = ?auto_1967180 ?auto_1967185 ) ) ( not ( = ?auto_1967180 ?auto_1967186 ) ) ( not ( = ?auto_1967180 ?auto_1967187 ) ) ( not ( = ?auto_1967180 ?auto_1967188 ) ) ( not ( = ?auto_1967180 ?auto_1967189 ) ) ( not ( = ?auto_1967180 ?auto_1967190 ) ) ( not ( = ?auto_1967180 ?auto_1967191 ) ) ( not ( = ?auto_1967180 ?auto_1967197 ) ) ( not ( = ?auto_1967181 ?auto_1967182 ) ) ( not ( = ?auto_1967181 ?auto_1967183 ) ) ( not ( = ?auto_1967181 ?auto_1967184 ) ) ( not ( = ?auto_1967181 ?auto_1967185 ) ) ( not ( = ?auto_1967181 ?auto_1967186 ) ) ( not ( = ?auto_1967181 ?auto_1967187 ) ) ( not ( = ?auto_1967181 ?auto_1967188 ) ) ( not ( = ?auto_1967181 ?auto_1967189 ) ) ( not ( = ?auto_1967181 ?auto_1967190 ) ) ( not ( = ?auto_1967181 ?auto_1967191 ) ) ( not ( = ?auto_1967181 ?auto_1967197 ) ) ( not ( = ?auto_1967182 ?auto_1967183 ) ) ( not ( = ?auto_1967182 ?auto_1967184 ) ) ( not ( = ?auto_1967182 ?auto_1967185 ) ) ( not ( = ?auto_1967182 ?auto_1967186 ) ) ( not ( = ?auto_1967182 ?auto_1967187 ) ) ( not ( = ?auto_1967182 ?auto_1967188 ) ) ( not ( = ?auto_1967182 ?auto_1967189 ) ) ( not ( = ?auto_1967182 ?auto_1967190 ) ) ( not ( = ?auto_1967182 ?auto_1967191 ) ) ( not ( = ?auto_1967182 ?auto_1967197 ) ) ( not ( = ?auto_1967183 ?auto_1967184 ) ) ( not ( = ?auto_1967183 ?auto_1967185 ) ) ( not ( = ?auto_1967183 ?auto_1967186 ) ) ( not ( = ?auto_1967183 ?auto_1967187 ) ) ( not ( = ?auto_1967183 ?auto_1967188 ) ) ( not ( = ?auto_1967183 ?auto_1967189 ) ) ( not ( = ?auto_1967183 ?auto_1967190 ) ) ( not ( = ?auto_1967183 ?auto_1967191 ) ) ( not ( = ?auto_1967183 ?auto_1967197 ) ) ( not ( = ?auto_1967184 ?auto_1967185 ) ) ( not ( = ?auto_1967184 ?auto_1967186 ) ) ( not ( = ?auto_1967184 ?auto_1967187 ) ) ( not ( = ?auto_1967184 ?auto_1967188 ) ) ( not ( = ?auto_1967184 ?auto_1967189 ) ) ( not ( = ?auto_1967184 ?auto_1967190 ) ) ( not ( = ?auto_1967184 ?auto_1967191 ) ) ( not ( = ?auto_1967184 ?auto_1967197 ) ) ( not ( = ?auto_1967185 ?auto_1967186 ) ) ( not ( = ?auto_1967185 ?auto_1967187 ) ) ( not ( = ?auto_1967185 ?auto_1967188 ) ) ( not ( = ?auto_1967185 ?auto_1967189 ) ) ( not ( = ?auto_1967185 ?auto_1967190 ) ) ( not ( = ?auto_1967185 ?auto_1967191 ) ) ( not ( = ?auto_1967185 ?auto_1967197 ) ) ( not ( = ?auto_1967186 ?auto_1967187 ) ) ( not ( = ?auto_1967186 ?auto_1967188 ) ) ( not ( = ?auto_1967186 ?auto_1967189 ) ) ( not ( = ?auto_1967186 ?auto_1967190 ) ) ( not ( = ?auto_1967186 ?auto_1967191 ) ) ( not ( = ?auto_1967186 ?auto_1967197 ) ) ( not ( = ?auto_1967187 ?auto_1967188 ) ) ( not ( = ?auto_1967187 ?auto_1967189 ) ) ( not ( = ?auto_1967187 ?auto_1967190 ) ) ( not ( = ?auto_1967187 ?auto_1967191 ) ) ( not ( = ?auto_1967187 ?auto_1967197 ) ) ( not ( = ?auto_1967188 ?auto_1967189 ) ) ( not ( = ?auto_1967188 ?auto_1967190 ) ) ( not ( = ?auto_1967188 ?auto_1967191 ) ) ( not ( = ?auto_1967188 ?auto_1967197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1967189 ?auto_1967190 ?auto_1967191 )
      ( MAKE-13CRATE-VERIFY ?auto_1967178 ?auto_1967179 ?auto_1967180 ?auto_1967181 ?auto_1967182 ?auto_1967183 ?auto_1967184 ?auto_1967185 ?auto_1967186 ?auto_1967187 ?auto_1967188 ?auto_1967189 ?auto_1967190 ?auto_1967191 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981341 - SURFACE
      ?auto_1981342 - SURFACE
      ?auto_1981343 - SURFACE
      ?auto_1981344 - SURFACE
      ?auto_1981345 - SURFACE
      ?auto_1981346 - SURFACE
      ?auto_1981347 - SURFACE
      ?auto_1981348 - SURFACE
      ?auto_1981349 - SURFACE
      ?auto_1981350 - SURFACE
      ?auto_1981351 - SURFACE
      ?auto_1981352 - SURFACE
      ?auto_1981353 - SURFACE
      ?auto_1981354 - SURFACE
      ?auto_1981355 - SURFACE
    )
    :vars
    (
      ?auto_1981356 - HOIST
      ?auto_1981357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981356 ?auto_1981357 ) ( SURFACE-AT ?auto_1981354 ?auto_1981357 ) ( CLEAR ?auto_1981354 ) ( LIFTING ?auto_1981356 ?auto_1981355 ) ( IS-CRATE ?auto_1981355 ) ( not ( = ?auto_1981354 ?auto_1981355 ) ) ( ON ?auto_1981342 ?auto_1981341 ) ( ON ?auto_1981343 ?auto_1981342 ) ( ON ?auto_1981344 ?auto_1981343 ) ( ON ?auto_1981345 ?auto_1981344 ) ( ON ?auto_1981346 ?auto_1981345 ) ( ON ?auto_1981347 ?auto_1981346 ) ( ON ?auto_1981348 ?auto_1981347 ) ( ON ?auto_1981349 ?auto_1981348 ) ( ON ?auto_1981350 ?auto_1981349 ) ( ON ?auto_1981351 ?auto_1981350 ) ( ON ?auto_1981352 ?auto_1981351 ) ( ON ?auto_1981353 ?auto_1981352 ) ( ON ?auto_1981354 ?auto_1981353 ) ( not ( = ?auto_1981341 ?auto_1981342 ) ) ( not ( = ?auto_1981341 ?auto_1981343 ) ) ( not ( = ?auto_1981341 ?auto_1981344 ) ) ( not ( = ?auto_1981341 ?auto_1981345 ) ) ( not ( = ?auto_1981341 ?auto_1981346 ) ) ( not ( = ?auto_1981341 ?auto_1981347 ) ) ( not ( = ?auto_1981341 ?auto_1981348 ) ) ( not ( = ?auto_1981341 ?auto_1981349 ) ) ( not ( = ?auto_1981341 ?auto_1981350 ) ) ( not ( = ?auto_1981341 ?auto_1981351 ) ) ( not ( = ?auto_1981341 ?auto_1981352 ) ) ( not ( = ?auto_1981341 ?auto_1981353 ) ) ( not ( = ?auto_1981341 ?auto_1981354 ) ) ( not ( = ?auto_1981341 ?auto_1981355 ) ) ( not ( = ?auto_1981342 ?auto_1981343 ) ) ( not ( = ?auto_1981342 ?auto_1981344 ) ) ( not ( = ?auto_1981342 ?auto_1981345 ) ) ( not ( = ?auto_1981342 ?auto_1981346 ) ) ( not ( = ?auto_1981342 ?auto_1981347 ) ) ( not ( = ?auto_1981342 ?auto_1981348 ) ) ( not ( = ?auto_1981342 ?auto_1981349 ) ) ( not ( = ?auto_1981342 ?auto_1981350 ) ) ( not ( = ?auto_1981342 ?auto_1981351 ) ) ( not ( = ?auto_1981342 ?auto_1981352 ) ) ( not ( = ?auto_1981342 ?auto_1981353 ) ) ( not ( = ?auto_1981342 ?auto_1981354 ) ) ( not ( = ?auto_1981342 ?auto_1981355 ) ) ( not ( = ?auto_1981343 ?auto_1981344 ) ) ( not ( = ?auto_1981343 ?auto_1981345 ) ) ( not ( = ?auto_1981343 ?auto_1981346 ) ) ( not ( = ?auto_1981343 ?auto_1981347 ) ) ( not ( = ?auto_1981343 ?auto_1981348 ) ) ( not ( = ?auto_1981343 ?auto_1981349 ) ) ( not ( = ?auto_1981343 ?auto_1981350 ) ) ( not ( = ?auto_1981343 ?auto_1981351 ) ) ( not ( = ?auto_1981343 ?auto_1981352 ) ) ( not ( = ?auto_1981343 ?auto_1981353 ) ) ( not ( = ?auto_1981343 ?auto_1981354 ) ) ( not ( = ?auto_1981343 ?auto_1981355 ) ) ( not ( = ?auto_1981344 ?auto_1981345 ) ) ( not ( = ?auto_1981344 ?auto_1981346 ) ) ( not ( = ?auto_1981344 ?auto_1981347 ) ) ( not ( = ?auto_1981344 ?auto_1981348 ) ) ( not ( = ?auto_1981344 ?auto_1981349 ) ) ( not ( = ?auto_1981344 ?auto_1981350 ) ) ( not ( = ?auto_1981344 ?auto_1981351 ) ) ( not ( = ?auto_1981344 ?auto_1981352 ) ) ( not ( = ?auto_1981344 ?auto_1981353 ) ) ( not ( = ?auto_1981344 ?auto_1981354 ) ) ( not ( = ?auto_1981344 ?auto_1981355 ) ) ( not ( = ?auto_1981345 ?auto_1981346 ) ) ( not ( = ?auto_1981345 ?auto_1981347 ) ) ( not ( = ?auto_1981345 ?auto_1981348 ) ) ( not ( = ?auto_1981345 ?auto_1981349 ) ) ( not ( = ?auto_1981345 ?auto_1981350 ) ) ( not ( = ?auto_1981345 ?auto_1981351 ) ) ( not ( = ?auto_1981345 ?auto_1981352 ) ) ( not ( = ?auto_1981345 ?auto_1981353 ) ) ( not ( = ?auto_1981345 ?auto_1981354 ) ) ( not ( = ?auto_1981345 ?auto_1981355 ) ) ( not ( = ?auto_1981346 ?auto_1981347 ) ) ( not ( = ?auto_1981346 ?auto_1981348 ) ) ( not ( = ?auto_1981346 ?auto_1981349 ) ) ( not ( = ?auto_1981346 ?auto_1981350 ) ) ( not ( = ?auto_1981346 ?auto_1981351 ) ) ( not ( = ?auto_1981346 ?auto_1981352 ) ) ( not ( = ?auto_1981346 ?auto_1981353 ) ) ( not ( = ?auto_1981346 ?auto_1981354 ) ) ( not ( = ?auto_1981346 ?auto_1981355 ) ) ( not ( = ?auto_1981347 ?auto_1981348 ) ) ( not ( = ?auto_1981347 ?auto_1981349 ) ) ( not ( = ?auto_1981347 ?auto_1981350 ) ) ( not ( = ?auto_1981347 ?auto_1981351 ) ) ( not ( = ?auto_1981347 ?auto_1981352 ) ) ( not ( = ?auto_1981347 ?auto_1981353 ) ) ( not ( = ?auto_1981347 ?auto_1981354 ) ) ( not ( = ?auto_1981347 ?auto_1981355 ) ) ( not ( = ?auto_1981348 ?auto_1981349 ) ) ( not ( = ?auto_1981348 ?auto_1981350 ) ) ( not ( = ?auto_1981348 ?auto_1981351 ) ) ( not ( = ?auto_1981348 ?auto_1981352 ) ) ( not ( = ?auto_1981348 ?auto_1981353 ) ) ( not ( = ?auto_1981348 ?auto_1981354 ) ) ( not ( = ?auto_1981348 ?auto_1981355 ) ) ( not ( = ?auto_1981349 ?auto_1981350 ) ) ( not ( = ?auto_1981349 ?auto_1981351 ) ) ( not ( = ?auto_1981349 ?auto_1981352 ) ) ( not ( = ?auto_1981349 ?auto_1981353 ) ) ( not ( = ?auto_1981349 ?auto_1981354 ) ) ( not ( = ?auto_1981349 ?auto_1981355 ) ) ( not ( = ?auto_1981350 ?auto_1981351 ) ) ( not ( = ?auto_1981350 ?auto_1981352 ) ) ( not ( = ?auto_1981350 ?auto_1981353 ) ) ( not ( = ?auto_1981350 ?auto_1981354 ) ) ( not ( = ?auto_1981350 ?auto_1981355 ) ) ( not ( = ?auto_1981351 ?auto_1981352 ) ) ( not ( = ?auto_1981351 ?auto_1981353 ) ) ( not ( = ?auto_1981351 ?auto_1981354 ) ) ( not ( = ?auto_1981351 ?auto_1981355 ) ) ( not ( = ?auto_1981352 ?auto_1981353 ) ) ( not ( = ?auto_1981352 ?auto_1981354 ) ) ( not ( = ?auto_1981352 ?auto_1981355 ) ) ( not ( = ?auto_1981353 ?auto_1981354 ) ) ( not ( = ?auto_1981353 ?auto_1981355 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1981354 ?auto_1981355 )
      ( MAKE-14CRATE-VERIFY ?auto_1981341 ?auto_1981342 ?auto_1981343 ?auto_1981344 ?auto_1981345 ?auto_1981346 ?auto_1981347 ?auto_1981348 ?auto_1981349 ?auto_1981350 ?auto_1981351 ?auto_1981352 ?auto_1981353 ?auto_1981354 ?auto_1981355 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981501 - SURFACE
      ?auto_1981502 - SURFACE
      ?auto_1981503 - SURFACE
      ?auto_1981504 - SURFACE
      ?auto_1981505 - SURFACE
      ?auto_1981506 - SURFACE
      ?auto_1981507 - SURFACE
      ?auto_1981508 - SURFACE
      ?auto_1981509 - SURFACE
      ?auto_1981510 - SURFACE
      ?auto_1981511 - SURFACE
      ?auto_1981512 - SURFACE
      ?auto_1981513 - SURFACE
      ?auto_1981514 - SURFACE
      ?auto_1981515 - SURFACE
    )
    :vars
    (
      ?auto_1981518 - HOIST
      ?auto_1981517 - PLACE
      ?auto_1981516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981518 ?auto_1981517 ) ( SURFACE-AT ?auto_1981514 ?auto_1981517 ) ( CLEAR ?auto_1981514 ) ( IS-CRATE ?auto_1981515 ) ( not ( = ?auto_1981514 ?auto_1981515 ) ) ( TRUCK-AT ?auto_1981516 ?auto_1981517 ) ( AVAILABLE ?auto_1981518 ) ( IN ?auto_1981515 ?auto_1981516 ) ( ON ?auto_1981514 ?auto_1981513 ) ( not ( = ?auto_1981513 ?auto_1981514 ) ) ( not ( = ?auto_1981513 ?auto_1981515 ) ) ( ON ?auto_1981502 ?auto_1981501 ) ( ON ?auto_1981503 ?auto_1981502 ) ( ON ?auto_1981504 ?auto_1981503 ) ( ON ?auto_1981505 ?auto_1981504 ) ( ON ?auto_1981506 ?auto_1981505 ) ( ON ?auto_1981507 ?auto_1981506 ) ( ON ?auto_1981508 ?auto_1981507 ) ( ON ?auto_1981509 ?auto_1981508 ) ( ON ?auto_1981510 ?auto_1981509 ) ( ON ?auto_1981511 ?auto_1981510 ) ( ON ?auto_1981512 ?auto_1981511 ) ( ON ?auto_1981513 ?auto_1981512 ) ( not ( = ?auto_1981501 ?auto_1981502 ) ) ( not ( = ?auto_1981501 ?auto_1981503 ) ) ( not ( = ?auto_1981501 ?auto_1981504 ) ) ( not ( = ?auto_1981501 ?auto_1981505 ) ) ( not ( = ?auto_1981501 ?auto_1981506 ) ) ( not ( = ?auto_1981501 ?auto_1981507 ) ) ( not ( = ?auto_1981501 ?auto_1981508 ) ) ( not ( = ?auto_1981501 ?auto_1981509 ) ) ( not ( = ?auto_1981501 ?auto_1981510 ) ) ( not ( = ?auto_1981501 ?auto_1981511 ) ) ( not ( = ?auto_1981501 ?auto_1981512 ) ) ( not ( = ?auto_1981501 ?auto_1981513 ) ) ( not ( = ?auto_1981501 ?auto_1981514 ) ) ( not ( = ?auto_1981501 ?auto_1981515 ) ) ( not ( = ?auto_1981502 ?auto_1981503 ) ) ( not ( = ?auto_1981502 ?auto_1981504 ) ) ( not ( = ?auto_1981502 ?auto_1981505 ) ) ( not ( = ?auto_1981502 ?auto_1981506 ) ) ( not ( = ?auto_1981502 ?auto_1981507 ) ) ( not ( = ?auto_1981502 ?auto_1981508 ) ) ( not ( = ?auto_1981502 ?auto_1981509 ) ) ( not ( = ?auto_1981502 ?auto_1981510 ) ) ( not ( = ?auto_1981502 ?auto_1981511 ) ) ( not ( = ?auto_1981502 ?auto_1981512 ) ) ( not ( = ?auto_1981502 ?auto_1981513 ) ) ( not ( = ?auto_1981502 ?auto_1981514 ) ) ( not ( = ?auto_1981502 ?auto_1981515 ) ) ( not ( = ?auto_1981503 ?auto_1981504 ) ) ( not ( = ?auto_1981503 ?auto_1981505 ) ) ( not ( = ?auto_1981503 ?auto_1981506 ) ) ( not ( = ?auto_1981503 ?auto_1981507 ) ) ( not ( = ?auto_1981503 ?auto_1981508 ) ) ( not ( = ?auto_1981503 ?auto_1981509 ) ) ( not ( = ?auto_1981503 ?auto_1981510 ) ) ( not ( = ?auto_1981503 ?auto_1981511 ) ) ( not ( = ?auto_1981503 ?auto_1981512 ) ) ( not ( = ?auto_1981503 ?auto_1981513 ) ) ( not ( = ?auto_1981503 ?auto_1981514 ) ) ( not ( = ?auto_1981503 ?auto_1981515 ) ) ( not ( = ?auto_1981504 ?auto_1981505 ) ) ( not ( = ?auto_1981504 ?auto_1981506 ) ) ( not ( = ?auto_1981504 ?auto_1981507 ) ) ( not ( = ?auto_1981504 ?auto_1981508 ) ) ( not ( = ?auto_1981504 ?auto_1981509 ) ) ( not ( = ?auto_1981504 ?auto_1981510 ) ) ( not ( = ?auto_1981504 ?auto_1981511 ) ) ( not ( = ?auto_1981504 ?auto_1981512 ) ) ( not ( = ?auto_1981504 ?auto_1981513 ) ) ( not ( = ?auto_1981504 ?auto_1981514 ) ) ( not ( = ?auto_1981504 ?auto_1981515 ) ) ( not ( = ?auto_1981505 ?auto_1981506 ) ) ( not ( = ?auto_1981505 ?auto_1981507 ) ) ( not ( = ?auto_1981505 ?auto_1981508 ) ) ( not ( = ?auto_1981505 ?auto_1981509 ) ) ( not ( = ?auto_1981505 ?auto_1981510 ) ) ( not ( = ?auto_1981505 ?auto_1981511 ) ) ( not ( = ?auto_1981505 ?auto_1981512 ) ) ( not ( = ?auto_1981505 ?auto_1981513 ) ) ( not ( = ?auto_1981505 ?auto_1981514 ) ) ( not ( = ?auto_1981505 ?auto_1981515 ) ) ( not ( = ?auto_1981506 ?auto_1981507 ) ) ( not ( = ?auto_1981506 ?auto_1981508 ) ) ( not ( = ?auto_1981506 ?auto_1981509 ) ) ( not ( = ?auto_1981506 ?auto_1981510 ) ) ( not ( = ?auto_1981506 ?auto_1981511 ) ) ( not ( = ?auto_1981506 ?auto_1981512 ) ) ( not ( = ?auto_1981506 ?auto_1981513 ) ) ( not ( = ?auto_1981506 ?auto_1981514 ) ) ( not ( = ?auto_1981506 ?auto_1981515 ) ) ( not ( = ?auto_1981507 ?auto_1981508 ) ) ( not ( = ?auto_1981507 ?auto_1981509 ) ) ( not ( = ?auto_1981507 ?auto_1981510 ) ) ( not ( = ?auto_1981507 ?auto_1981511 ) ) ( not ( = ?auto_1981507 ?auto_1981512 ) ) ( not ( = ?auto_1981507 ?auto_1981513 ) ) ( not ( = ?auto_1981507 ?auto_1981514 ) ) ( not ( = ?auto_1981507 ?auto_1981515 ) ) ( not ( = ?auto_1981508 ?auto_1981509 ) ) ( not ( = ?auto_1981508 ?auto_1981510 ) ) ( not ( = ?auto_1981508 ?auto_1981511 ) ) ( not ( = ?auto_1981508 ?auto_1981512 ) ) ( not ( = ?auto_1981508 ?auto_1981513 ) ) ( not ( = ?auto_1981508 ?auto_1981514 ) ) ( not ( = ?auto_1981508 ?auto_1981515 ) ) ( not ( = ?auto_1981509 ?auto_1981510 ) ) ( not ( = ?auto_1981509 ?auto_1981511 ) ) ( not ( = ?auto_1981509 ?auto_1981512 ) ) ( not ( = ?auto_1981509 ?auto_1981513 ) ) ( not ( = ?auto_1981509 ?auto_1981514 ) ) ( not ( = ?auto_1981509 ?auto_1981515 ) ) ( not ( = ?auto_1981510 ?auto_1981511 ) ) ( not ( = ?auto_1981510 ?auto_1981512 ) ) ( not ( = ?auto_1981510 ?auto_1981513 ) ) ( not ( = ?auto_1981510 ?auto_1981514 ) ) ( not ( = ?auto_1981510 ?auto_1981515 ) ) ( not ( = ?auto_1981511 ?auto_1981512 ) ) ( not ( = ?auto_1981511 ?auto_1981513 ) ) ( not ( = ?auto_1981511 ?auto_1981514 ) ) ( not ( = ?auto_1981511 ?auto_1981515 ) ) ( not ( = ?auto_1981512 ?auto_1981513 ) ) ( not ( = ?auto_1981512 ?auto_1981514 ) ) ( not ( = ?auto_1981512 ?auto_1981515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981513 ?auto_1981514 ?auto_1981515 )
      ( MAKE-14CRATE-VERIFY ?auto_1981501 ?auto_1981502 ?auto_1981503 ?auto_1981504 ?auto_1981505 ?auto_1981506 ?auto_1981507 ?auto_1981508 ?auto_1981509 ?auto_1981510 ?auto_1981511 ?auto_1981512 ?auto_1981513 ?auto_1981514 ?auto_1981515 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981676 - SURFACE
      ?auto_1981677 - SURFACE
      ?auto_1981678 - SURFACE
      ?auto_1981679 - SURFACE
      ?auto_1981680 - SURFACE
      ?auto_1981681 - SURFACE
      ?auto_1981682 - SURFACE
      ?auto_1981683 - SURFACE
      ?auto_1981684 - SURFACE
      ?auto_1981685 - SURFACE
      ?auto_1981686 - SURFACE
      ?auto_1981687 - SURFACE
      ?auto_1981688 - SURFACE
      ?auto_1981689 - SURFACE
      ?auto_1981690 - SURFACE
    )
    :vars
    (
      ?auto_1981692 - HOIST
      ?auto_1981694 - PLACE
      ?auto_1981693 - TRUCK
      ?auto_1981691 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981692 ?auto_1981694 ) ( SURFACE-AT ?auto_1981689 ?auto_1981694 ) ( CLEAR ?auto_1981689 ) ( IS-CRATE ?auto_1981690 ) ( not ( = ?auto_1981689 ?auto_1981690 ) ) ( AVAILABLE ?auto_1981692 ) ( IN ?auto_1981690 ?auto_1981693 ) ( ON ?auto_1981689 ?auto_1981688 ) ( not ( = ?auto_1981688 ?auto_1981689 ) ) ( not ( = ?auto_1981688 ?auto_1981690 ) ) ( TRUCK-AT ?auto_1981693 ?auto_1981691 ) ( not ( = ?auto_1981691 ?auto_1981694 ) ) ( ON ?auto_1981677 ?auto_1981676 ) ( ON ?auto_1981678 ?auto_1981677 ) ( ON ?auto_1981679 ?auto_1981678 ) ( ON ?auto_1981680 ?auto_1981679 ) ( ON ?auto_1981681 ?auto_1981680 ) ( ON ?auto_1981682 ?auto_1981681 ) ( ON ?auto_1981683 ?auto_1981682 ) ( ON ?auto_1981684 ?auto_1981683 ) ( ON ?auto_1981685 ?auto_1981684 ) ( ON ?auto_1981686 ?auto_1981685 ) ( ON ?auto_1981687 ?auto_1981686 ) ( ON ?auto_1981688 ?auto_1981687 ) ( not ( = ?auto_1981676 ?auto_1981677 ) ) ( not ( = ?auto_1981676 ?auto_1981678 ) ) ( not ( = ?auto_1981676 ?auto_1981679 ) ) ( not ( = ?auto_1981676 ?auto_1981680 ) ) ( not ( = ?auto_1981676 ?auto_1981681 ) ) ( not ( = ?auto_1981676 ?auto_1981682 ) ) ( not ( = ?auto_1981676 ?auto_1981683 ) ) ( not ( = ?auto_1981676 ?auto_1981684 ) ) ( not ( = ?auto_1981676 ?auto_1981685 ) ) ( not ( = ?auto_1981676 ?auto_1981686 ) ) ( not ( = ?auto_1981676 ?auto_1981687 ) ) ( not ( = ?auto_1981676 ?auto_1981688 ) ) ( not ( = ?auto_1981676 ?auto_1981689 ) ) ( not ( = ?auto_1981676 ?auto_1981690 ) ) ( not ( = ?auto_1981677 ?auto_1981678 ) ) ( not ( = ?auto_1981677 ?auto_1981679 ) ) ( not ( = ?auto_1981677 ?auto_1981680 ) ) ( not ( = ?auto_1981677 ?auto_1981681 ) ) ( not ( = ?auto_1981677 ?auto_1981682 ) ) ( not ( = ?auto_1981677 ?auto_1981683 ) ) ( not ( = ?auto_1981677 ?auto_1981684 ) ) ( not ( = ?auto_1981677 ?auto_1981685 ) ) ( not ( = ?auto_1981677 ?auto_1981686 ) ) ( not ( = ?auto_1981677 ?auto_1981687 ) ) ( not ( = ?auto_1981677 ?auto_1981688 ) ) ( not ( = ?auto_1981677 ?auto_1981689 ) ) ( not ( = ?auto_1981677 ?auto_1981690 ) ) ( not ( = ?auto_1981678 ?auto_1981679 ) ) ( not ( = ?auto_1981678 ?auto_1981680 ) ) ( not ( = ?auto_1981678 ?auto_1981681 ) ) ( not ( = ?auto_1981678 ?auto_1981682 ) ) ( not ( = ?auto_1981678 ?auto_1981683 ) ) ( not ( = ?auto_1981678 ?auto_1981684 ) ) ( not ( = ?auto_1981678 ?auto_1981685 ) ) ( not ( = ?auto_1981678 ?auto_1981686 ) ) ( not ( = ?auto_1981678 ?auto_1981687 ) ) ( not ( = ?auto_1981678 ?auto_1981688 ) ) ( not ( = ?auto_1981678 ?auto_1981689 ) ) ( not ( = ?auto_1981678 ?auto_1981690 ) ) ( not ( = ?auto_1981679 ?auto_1981680 ) ) ( not ( = ?auto_1981679 ?auto_1981681 ) ) ( not ( = ?auto_1981679 ?auto_1981682 ) ) ( not ( = ?auto_1981679 ?auto_1981683 ) ) ( not ( = ?auto_1981679 ?auto_1981684 ) ) ( not ( = ?auto_1981679 ?auto_1981685 ) ) ( not ( = ?auto_1981679 ?auto_1981686 ) ) ( not ( = ?auto_1981679 ?auto_1981687 ) ) ( not ( = ?auto_1981679 ?auto_1981688 ) ) ( not ( = ?auto_1981679 ?auto_1981689 ) ) ( not ( = ?auto_1981679 ?auto_1981690 ) ) ( not ( = ?auto_1981680 ?auto_1981681 ) ) ( not ( = ?auto_1981680 ?auto_1981682 ) ) ( not ( = ?auto_1981680 ?auto_1981683 ) ) ( not ( = ?auto_1981680 ?auto_1981684 ) ) ( not ( = ?auto_1981680 ?auto_1981685 ) ) ( not ( = ?auto_1981680 ?auto_1981686 ) ) ( not ( = ?auto_1981680 ?auto_1981687 ) ) ( not ( = ?auto_1981680 ?auto_1981688 ) ) ( not ( = ?auto_1981680 ?auto_1981689 ) ) ( not ( = ?auto_1981680 ?auto_1981690 ) ) ( not ( = ?auto_1981681 ?auto_1981682 ) ) ( not ( = ?auto_1981681 ?auto_1981683 ) ) ( not ( = ?auto_1981681 ?auto_1981684 ) ) ( not ( = ?auto_1981681 ?auto_1981685 ) ) ( not ( = ?auto_1981681 ?auto_1981686 ) ) ( not ( = ?auto_1981681 ?auto_1981687 ) ) ( not ( = ?auto_1981681 ?auto_1981688 ) ) ( not ( = ?auto_1981681 ?auto_1981689 ) ) ( not ( = ?auto_1981681 ?auto_1981690 ) ) ( not ( = ?auto_1981682 ?auto_1981683 ) ) ( not ( = ?auto_1981682 ?auto_1981684 ) ) ( not ( = ?auto_1981682 ?auto_1981685 ) ) ( not ( = ?auto_1981682 ?auto_1981686 ) ) ( not ( = ?auto_1981682 ?auto_1981687 ) ) ( not ( = ?auto_1981682 ?auto_1981688 ) ) ( not ( = ?auto_1981682 ?auto_1981689 ) ) ( not ( = ?auto_1981682 ?auto_1981690 ) ) ( not ( = ?auto_1981683 ?auto_1981684 ) ) ( not ( = ?auto_1981683 ?auto_1981685 ) ) ( not ( = ?auto_1981683 ?auto_1981686 ) ) ( not ( = ?auto_1981683 ?auto_1981687 ) ) ( not ( = ?auto_1981683 ?auto_1981688 ) ) ( not ( = ?auto_1981683 ?auto_1981689 ) ) ( not ( = ?auto_1981683 ?auto_1981690 ) ) ( not ( = ?auto_1981684 ?auto_1981685 ) ) ( not ( = ?auto_1981684 ?auto_1981686 ) ) ( not ( = ?auto_1981684 ?auto_1981687 ) ) ( not ( = ?auto_1981684 ?auto_1981688 ) ) ( not ( = ?auto_1981684 ?auto_1981689 ) ) ( not ( = ?auto_1981684 ?auto_1981690 ) ) ( not ( = ?auto_1981685 ?auto_1981686 ) ) ( not ( = ?auto_1981685 ?auto_1981687 ) ) ( not ( = ?auto_1981685 ?auto_1981688 ) ) ( not ( = ?auto_1981685 ?auto_1981689 ) ) ( not ( = ?auto_1981685 ?auto_1981690 ) ) ( not ( = ?auto_1981686 ?auto_1981687 ) ) ( not ( = ?auto_1981686 ?auto_1981688 ) ) ( not ( = ?auto_1981686 ?auto_1981689 ) ) ( not ( = ?auto_1981686 ?auto_1981690 ) ) ( not ( = ?auto_1981687 ?auto_1981688 ) ) ( not ( = ?auto_1981687 ?auto_1981689 ) ) ( not ( = ?auto_1981687 ?auto_1981690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981688 ?auto_1981689 ?auto_1981690 )
      ( MAKE-14CRATE-VERIFY ?auto_1981676 ?auto_1981677 ?auto_1981678 ?auto_1981679 ?auto_1981680 ?auto_1981681 ?auto_1981682 ?auto_1981683 ?auto_1981684 ?auto_1981685 ?auto_1981686 ?auto_1981687 ?auto_1981688 ?auto_1981689 ?auto_1981690 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981865 - SURFACE
      ?auto_1981866 - SURFACE
      ?auto_1981867 - SURFACE
      ?auto_1981868 - SURFACE
      ?auto_1981869 - SURFACE
      ?auto_1981870 - SURFACE
      ?auto_1981871 - SURFACE
      ?auto_1981872 - SURFACE
      ?auto_1981873 - SURFACE
      ?auto_1981874 - SURFACE
      ?auto_1981875 - SURFACE
      ?auto_1981876 - SURFACE
      ?auto_1981877 - SURFACE
      ?auto_1981878 - SURFACE
      ?auto_1981879 - SURFACE
    )
    :vars
    (
      ?auto_1981883 - HOIST
      ?auto_1981882 - PLACE
      ?auto_1981880 - TRUCK
      ?auto_1981881 - PLACE
      ?auto_1981884 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981883 ?auto_1981882 ) ( SURFACE-AT ?auto_1981878 ?auto_1981882 ) ( CLEAR ?auto_1981878 ) ( IS-CRATE ?auto_1981879 ) ( not ( = ?auto_1981878 ?auto_1981879 ) ) ( AVAILABLE ?auto_1981883 ) ( ON ?auto_1981878 ?auto_1981877 ) ( not ( = ?auto_1981877 ?auto_1981878 ) ) ( not ( = ?auto_1981877 ?auto_1981879 ) ) ( TRUCK-AT ?auto_1981880 ?auto_1981881 ) ( not ( = ?auto_1981881 ?auto_1981882 ) ) ( HOIST-AT ?auto_1981884 ?auto_1981881 ) ( LIFTING ?auto_1981884 ?auto_1981879 ) ( not ( = ?auto_1981883 ?auto_1981884 ) ) ( ON ?auto_1981866 ?auto_1981865 ) ( ON ?auto_1981867 ?auto_1981866 ) ( ON ?auto_1981868 ?auto_1981867 ) ( ON ?auto_1981869 ?auto_1981868 ) ( ON ?auto_1981870 ?auto_1981869 ) ( ON ?auto_1981871 ?auto_1981870 ) ( ON ?auto_1981872 ?auto_1981871 ) ( ON ?auto_1981873 ?auto_1981872 ) ( ON ?auto_1981874 ?auto_1981873 ) ( ON ?auto_1981875 ?auto_1981874 ) ( ON ?auto_1981876 ?auto_1981875 ) ( ON ?auto_1981877 ?auto_1981876 ) ( not ( = ?auto_1981865 ?auto_1981866 ) ) ( not ( = ?auto_1981865 ?auto_1981867 ) ) ( not ( = ?auto_1981865 ?auto_1981868 ) ) ( not ( = ?auto_1981865 ?auto_1981869 ) ) ( not ( = ?auto_1981865 ?auto_1981870 ) ) ( not ( = ?auto_1981865 ?auto_1981871 ) ) ( not ( = ?auto_1981865 ?auto_1981872 ) ) ( not ( = ?auto_1981865 ?auto_1981873 ) ) ( not ( = ?auto_1981865 ?auto_1981874 ) ) ( not ( = ?auto_1981865 ?auto_1981875 ) ) ( not ( = ?auto_1981865 ?auto_1981876 ) ) ( not ( = ?auto_1981865 ?auto_1981877 ) ) ( not ( = ?auto_1981865 ?auto_1981878 ) ) ( not ( = ?auto_1981865 ?auto_1981879 ) ) ( not ( = ?auto_1981866 ?auto_1981867 ) ) ( not ( = ?auto_1981866 ?auto_1981868 ) ) ( not ( = ?auto_1981866 ?auto_1981869 ) ) ( not ( = ?auto_1981866 ?auto_1981870 ) ) ( not ( = ?auto_1981866 ?auto_1981871 ) ) ( not ( = ?auto_1981866 ?auto_1981872 ) ) ( not ( = ?auto_1981866 ?auto_1981873 ) ) ( not ( = ?auto_1981866 ?auto_1981874 ) ) ( not ( = ?auto_1981866 ?auto_1981875 ) ) ( not ( = ?auto_1981866 ?auto_1981876 ) ) ( not ( = ?auto_1981866 ?auto_1981877 ) ) ( not ( = ?auto_1981866 ?auto_1981878 ) ) ( not ( = ?auto_1981866 ?auto_1981879 ) ) ( not ( = ?auto_1981867 ?auto_1981868 ) ) ( not ( = ?auto_1981867 ?auto_1981869 ) ) ( not ( = ?auto_1981867 ?auto_1981870 ) ) ( not ( = ?auto_1981867 ?auto_1981871 ) ) ( not ( = ?auto_1981867 ?auto_1981872 ) ) ( not ( = ?auto_1981867 ?auto_1981873 ) ) ( not ( = ?auto_1981867 ?auto_1981874 ) ) ( not ( = ?auto_1981867 ?auto_1981875 ) ) ( not ( = ?auto_1981867 ?auto_1981876 ) ) ( not ( = ?auto_1981867 ?auto_1981877 ) ) ( not ( = ?auto_1981867 ?auto_1981878 ) ) ( not ( = ?auto_1981867 ?auto_1981879 ) ) ( not ( = ?auto_1981868 ?auto_1981869 ) ) ( not ( = ?auto_1981868 ?auto_1981870 ) ) ( not ( = ?auto_1981868 ?auto_1981871 ) ) ( not ( = ?auto_1981868 ?auto_1981872 ) ) ( not ( = ?auto_1981868 ?auto_1981873 ) ) ( not ( = ?auto_1981868 ?auto_1981874 ) ) ( not ( = ?auto_1981868 ?auto_1981875 ) ) ( not ( = ?auto_1981868 ?auto_1981876 ) ) ( not ( = ?auto_1981868 ?auto_1981877 ) ) ( not ( = ?auto_1981868 ?auto_1981878 ) ) ( not ( = ?auto_1981868 ?auto_1981879 ) ) ( not ( = ?auto_1981869 ?auto_1981870 ) ) ( not ( = ?auto_1981869 ?auto_1981871 ) ) ( not ( = ?auto_1981869 ?auto_1981872 ) ) ( not ( = ?auto_1981869 ?auto_1981873 ) ) ( not ( = ?auto_1981869 ?auto_1981874 ) ) ( not ( = ?auto_1981869 ?auto_1981875 ) ) ( not ( = ?auto_1981869 ?auto_1981876 ) ) ( not ( = ?auto_1981869 ?auto_1981877 ) ) ( not ( = ?auto_1981869 ?auto_1981878 ) ) ( not ( = ?auto_1981869 ?auto_1981879 ) ) ( not ( = ?auto_1981870 ?auto_1981871 ) ) ( not ( = ?auto_1981870 ?auto_1981872 ) ) ( not ( = ?auto_1981870 ?auto_1981873 ) ) ( not ( = ?auto_1981870 ?auto_1981874 ) ) ( not ( = ?auto_1981870 ?auto_1981875 ) ) ( not ( = ?auto_1981870 ?auto_1981876 ) ) ( not ( = ?auto_1981870 ?auto_1981877 ) ) ( not ( = ?auto_1981870 ?auto_1981878 ) ) ( not ( = ?auto_1981870 ?auto_1981879 ) ) ( not ( = ?auto_1981871 ?auto_1981872 ) ) ( not ( = ?auto_1981871 ?auto_1981873 ) ) ( not ( = ?auto_1981871 ?auto_1981874 ) ) ( not ( = ?auto_1981871 ?auto_1981875 ) ) ( not ( = ?auto_1981871 ?auto_1981876 ) ) ( not ( = ?auto_1981871 ?auto_1981877 ) ) ( not ( = ?auto_1981871 ?auto_1981878 ) ) ( not ( = ?auto_1981871 ?auto_1981879 ) ) ( not ( = ?auto_1981872 ?auto_1981873 ) ) ( not ( = ?auto_1981872 ?auto_1981874 ) ) ( not ( = ?auto_1981872 ?auto_1981875 ) ) ( not ( = ?auto_1981872 ?auto_1981876 ) ) ( not ( = ?auto_1981872 ?auto_1981877 ) ) ( not ( = ?auto_1981872 ?auto_1981878 ) ) ( not ( = ?auto_1981872 ?auto_1981879 ) ) ( not ( = ?auto_1981873 ?auto_1981874 ) ) ( not ( = ?auto_1981873 ?auto_1981875 ) ) ( not ( = ?auto_1981873 ?auto_1981876 ) ) ( not ( = ?auto_1981873 ?auto_1981877 ) ) ( not ( = ?auto_1981873 ?auto_1981878 ) ) ( not ( = ?auto_1981873 ?auto_1981879 ) ) ( not ( = ?auto_1981874 ?auto_1981875 ) ) ( not ( = ?auto_1981874 ?auto_1981876 ) ) ( not ( = ?auto_1981874 ?auto_1981877 ) ) ( not ( = ?auto_1981874 ?auto_1981878 ) ) ( not ( = ?auto_1981874 ?auto_1981879 ) ) ( not ( = ?auto_1981875 ?auto_1981876 ) ) ( not ( = ?auto_1981875 ?auto_1981877 ) ) ( not ( = ?auto_1981875 ?auto_1981878 ) ) ( not ( = ?auto_1981875 ?auto_1981879 ) ) ( not ( = ?auto_1981876 ?auto_1981877 ) ) ( not ( = ?auto_1981876 ?auto_1981878 ) ) ( not ( = ?auto_1981876 ?auto_1981879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981877 ?auto_1981878 ?auto_1981879 )
      ( MAKE-14CRATE-VERIFY ?auto_1981865 ?auto_1981866 ?auto_1981867 ?auto_1981868 ?auto_1981869 ?auto_1981870 ?auto_1981871 ?auto_1981872 ?auto_1981873 ?auto_1981874 ?auto_1981875 ?auto_1981876 ?auto_1981877 ?auto_1981878 ?auto_1981879 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982068 - SURFACE
      ?auto_1982069 - SURFACE
      ?auto_1982070 - SURFACE
      ?auto_1982071 - SURFACE
      ?auto_1982072 - SURFACE
      ?auto_1982073 - SURFACE
      ?auto_1982074 - SURFACE
      ?auto_1982075 - SURFACE
      ?auto_1982076 - SURFACE
      ?auto_1982077 - SURFACE
      ?auto_1982078 - SURFACE
      ?auto_1982079 - SURFACE
      ?auto_1982080 - SURFACE
      ?auto_1982081 - SURFACE
      ?auto_1982082 - SURFACE
    )
    :vars
    (
      ?auto_1982087 - HOIST
      ?auto_1982086 - PLACE
      ?auto_1982084 - TRUCK
      ?auto_1982085 - PLACE
      ?auto_1982083 - HOIST
      ?auto_1982088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982087 ?auto_1982086 ) ( SURFACE-AT ?auto_1982081 ?auto_1982086 ) ( CLEAR ?auto_1982081 ) ( IS-CRATE ?auto_1982082 ) ( not ( = ?auto_1982081 ?auto_1982082 ) ) ( AVAILABLE ?auto_1982087 ) ( ON ?auto_1982081 ?auto_1982080 ) ( not ( = ?auto_1982080 ?auto_1982081 ) ) ( not ( = ?auto_1982080 ?auto_1982082 ) ) ( TRUCK-AT ?auto_1982084 ?auto_1982085 ) ( not ( = ?auto_1982085 ?auto_1982086 ) ) ( HOIST-AT ?auto_1982083 ?auto_1982085 ) ( not ( = ?auto_1982087 ?auto_1982083 ) ) ( AVAILABLE ?auto_1982083 ) ( SURFACE-AT ?auto_1982082 ?auto_1982085 ) ( ON ?auto_1982082 ?auto_1982088 ) ( CLEAR ?auto_1982082 ) ( not ( = ?auto_1982081 ?auto_1982088 ) ) ( not ( = ?auto_1982082 ?auto_1982088 ) ) ( not ( = ?auto_1982080 ?auto_1982088 ) ) ( ON ?auto_1982069 ?auto_1982068 ) ( ON ?auto_1982070 ?auto_1982069 ) ( ON ?auto_1982071 ?auto_1982070 ) ( ON ?auto_1982072 ?auto_1982071 ) ( ON ?auto_1982073 ?auto_1982072 ) ( ON ?auto_1982074 ?auto_1982073 ) ( ON ?auto_1982075 ?auto_1982074 ) ( ON ?auto_1982076 ?auto_1982075 ) ( ON ?auto_1982077 ?auto_1982076 ) ( ON ?auto_1982078 ?auto_1982077 ) ( ON ?auto_1982079 ?auto_1982078 ) ( ON ?auto_1982080 ?auto_1982079 ) ( not ( = ?auto_1982068 ?auto_1982069 ) ) ( not ( = ?auto_1982068 ?auto_1982070 ) ) ( not ( = ?auto_1982068 ?auto_1982071 ) ) ( not ( = ?auto_1982068 ?auto_1982072 ) ) ( not ( = ?auto_1982068 ?auto_1982073 ) ) ( not ( = ?auto_1982068 ?auto_1982074 ) ) ( not ( = ?auto_1982068 ?auto_1982075 ) ) ( not ( = ?auto_1982068 ?auto_1982076 ) ) ( not ( = ?auto_1982068 ?auto_1982077 ) ) ( not ( = ?auto_1982068 ?auto_1982078 ) ) ( not ( = ?auto_1982068 ?auto_1982079 ) ) ( not ( = ?auto_1982068 ?auto_1982080 ) ) ( not ( = ?auto_1982068 ?auto_1982081 ) ) ( not ( = ?auto_1982068 ?auto_1982082 ) ) ( not ( = ?auto_1982068 ?auto_1982088 ) ) ( not ( = ?auto_1982069 ?auto_1982070 ) ) ( not ( = ?auto_1982069 ?auto_1982071 ) ) ( not ( = ?auto_1982069 ?auto_1982072 ) ) ( not ( = ?auto_1982069 ?auto_1982073 ) ) ( not ( = ?auto_1982069 ?auto_1982074 ) ) ( not ( = ?auto_1982069 ?auto_1982075 ) ) ( not ( = ?auto_1982069 ?auto_1982076 ) ) ( not ( = ?auto_1982069 ?auto_1982077 ) ) ( not ( = ?auto_1982069 ?auto_1982078 ) ) ( not ( = ?auto_1982069 ?auto_1982079 ) ) ( not ( = ?auto_1982069 ?auto_1982080 ) ) ( not ( = ?auto_1982069 ?auto_1982081 ) ) ( not ( = ?auto_1982069 ?auto_1982082 ) ) ( not ( = ?auto_1982069 ?auto_1982088 ) ) ( not ( = ?auto_1982070 ?auto_1982071 ) ) ( not ( = ?auto_1982070 ?auto_1982072 ) ) ( not ( = ?auto_1982070 ?auto_1982073 ) ) ( not ( = ?auto_1982070 ?auto_1982074 ) ) ( not ( = ?auto_1982070 ?auto_1982075 ) ) ( not ( = ?auto_1982070 ?auto_1982076 ) ) ( not ( = ?auto_1982070 ?auto_1982077 ) ) ( not ( = ?auto_1982070 ?auto_1982078 ) ) ( not ( = ?auto_1982070 ?auto_1982079 ) ) ( not ( = ?auto_1982070 ?auto_1982080 ) ) ( not ( = ?auto_1982070 ?auto_1982081 ) ) ( not ( = ?auto_1982070 ?auto_1982082 ) ) ( not ( = ?auto_1982070 ?auto_1982088 ) ) ( not ( = ?auto_1982071 ?auto_1982072 ) ) ( not ( = ?auto_1982071 ?auto_1982073 ) ) ( not ( = ?auto_1982071 ?auto_1982074 ) ) ( not ( = ?auto_1982071 ?auto_1982075 ) ) ( not ( = ?auto_1982071 ?auto_1982076 ) ) ( not ( = ?auto_1982071 ?auto_1982077 ) ) ( not ( = ?auto_1982071 ?auto_1982078 ) ) ( not ( = ?auto_1982071 ?auto_1982079 ) ) ( not ( = ?auto_1982071 ?auto_1982080 ) ) ( not ( = ?auto_1982071 ?auto_1982081 ) ) ( not ( = ?auto_1982071 ?auto_1982082 ) ) ( not ( = ?auto_1982071 ?auto_1982088 ) ) ( not ( = ?auto_1982072 ?auto_1982073 ) ) ( not ( = ?auto_1982072 ?auto_1982074 ) ) ( not ( = ?auto_1982072 ?auto_1982075 ) ) ( not ( = ?auto_1982072 ?auto_1982076 ) ) ( not ( = ?auto_1982072 ?auto_1982077 ) ) ( not ( = ?auto_1982072 ?auto_1982078 ) ) ( not ( = ?auto_1982072 ?auto_1982079 ) ) ( not ( = ?auto_1982072 ?auto_1982080 ) ) ( not ( = ?auto_1982072 ?auto_1982081 ) ) ( not ( = ?auto_1982072 ?auto_1982082 ) ) ( not ( = ?auto_1982072 ?auto_1982088 ) ) ( not ( = ?auto_1982073 ?auto_1982074 ) ) ( not ( = ?auto_1982073 ?auto_1982075 ) ) ( not ( = ?auto_1982073 ?auto_1982076 ) ) ( not ( = ?auto_1982073 ?auto_1982077 ) ) ( not ( = ?auto_1982073 ?auto_1982078 ) ) ( not ( = ?auto_1982073 ?auto_1982079 ) ) ( not ( = ?auto_1982073 ?auto_1982080 ) ) ( not ( = ?auto_1982073 ?auto_1982081 ) ) ( not ( = ?auto_1982073 ?auto_1982082 ) ) ( not ( = ?auto_1982073 ?auto_1982088 ) ) ( not ( = ?auto_1982074 ?auto_1982075 ) ) ( not ( = ?auto_1982074 ?auto_1982076 ) ) ( not ( = ?auto_1982074 ?auto_1982077 ) ) ( not ( = ?auto_1982074 ?auto_1982078 ) ) ( not ( = ?auto_1982074 ?auto_1982079 ) ) ( not ( = ?auto_1982074 ?auto_1982080 ) ) ( not ( = ?auto_1982074 ?auto_1982081 ) ) ( not ( = ?auto_1982074 ?auto_1982082 ) ) ( not ( = ?auto_1982074 ?auto_1982088 ) ) ( not ( = ?auto_1982075 ?auto_1982076 ) ) ( not ( = ?auto_1982075 ?auto_1982077 ) ) ( not ( = ?auto_1982075 ?auto_1982078 ) ) ( not ( = ?auto_1982075 ?auto_1982079 ) ) ( not ( = ?auto_1982075 ?auto_1982080 ) ) ( not ( = ?auto_1982075 ?auto_1982081 ) ) ( not ( = ?auto_1982075 ?auto_1982082 ) ) ( not ( = ?auto_1982075 ?auto_1982088 ) ) ( not ( = ?auto_1982076 ?auto_1982077 ) ) ( not ( = ?auto_1982076 ?auto_1982078 ) ) ( not ( = ?auto_1982076 ?auto_1982079 ) ) ( not ( = ?auto_1982076 ?auto_1982080 ) ) ( not ( = ?auto_1982076 ?auto_1982081 ) ) ( not ( = ?auto_1982076 ?auto_1982082 ) ) ( not ( = ?auto_1982076 ?auto_1982088 ) ) ( not ( = ?auto_1982077 ?auto_1982078 ) ) ( not ( = ?auto_1982077 ?auto_1982079 ) ) ( not ( = ?auto_1982077 ?auto_1982080 ) ) ( not ( = ?auto_1982077 ?auto_1982081 ) ) ( not ( = ?auto_1982077 ?auto_1982082 ) ) ( not ( = ?auto_1982077 ?auto_1982088 ) ) ( not ( = ?auto_1982078 ?auto_1982079 ) ) ( not ( = ?auto_1982078 ?auto_1982080 ) ) ( not ( = ?auto_1982078 ?auto_1982081 ) ) ( not ( = ?auto_1982078 ?auto_1982082 ) ) ( not ( = ?auto_1982078 ?auto_1982088 ) ) ( not ( = ?auto_1982079 ?auto_1982080 ) ) ( not ( = ?auto_1982079 ?auto_1982081 ) ) ( not ( = ?auto_1982079 ?auto_1982082 ) ) ( not ( = ?auto_1982079 ?auto_1982088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982080 ?auto_1982081 ?auto_1982082 )
      ( MAKE-14CRATE-VERIFY ?auto_1982068 ?auto_1982069 ?auto_1982070 ?auto_1982071 ?auto_1982072 ?auto_1982073 ?auto_1982074 ?auto_1982075 ?auto_1982076 ?auto_1982077 ?auto_1982078 ?auto_1982079 ?auto_1982080 ?auto_1982081 ?auto_1982082 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982272 - SURFACE
      ?auto_1982273 - SURFACE
      ?auto_1982274 - SURFACE
      ?auto_1982275 - SURFACE
      ?auto_1982276 - SURFACE
      ?auto_1982277 - SURFACE
      ?auto_1982278 - SURFACE
      ?auto_1982279 - SURFACE
      ?auto_1982280 - SURFACE
      ?auto_1982281 - SURFACE
      ?auto_1982282 - SURFACE
      ?auto_1982283 - SURFACE
      ?auto_1982284 - SURFACE
      ?auto_1982285 - SURFACE
      ?auto_1982286 - SURFACE
    )
    :vars
    (
      ?auto_1982288 - HOIST
      ?auto_1982287 - PLACE
      ?auto_1982290 - PLACE
      ?auto_1982292 - HOIST
      ?auto_1982291 - SURFACE
      ?auto_1982289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982288 ?auto_1982287 ) ( SURFACE-AT ?auto_1982285 ?auto_1982287 ) ( CLEAR ?auto_1982285 ) ( IS-CRATE ?auto_1982286 ) ( not ( = ?auto_1982285 ?auto_1982286 ) ) ( AVAILABLE ?auto_1982288 ) ( ON ?auto_1982285 ?auto_1982284 ) ( not ( = ?auto_1982284 ?auto_1982285 ) ) ( not ( = ?auto_1982284 ?auto_1982286 ) ) ( not ( = ?auto_1982290 ?auto_1982287 ) ) ( HOIST-AT ?auto_1982292 ?auto_1982290 ) ( not ( = ?auto_1982288 ?auto_1982292 ) ) ( AVAILABLE ?auto_1982292 ) ( SURFACE-AT ?auto_1982286 ?auto_1982290 ) ( ON ?auto_1982286 ?auto_1982291 ) ( CLEAR ?auto_1982286 ) ( not ( = ?auto_1982285 ?auto_1982291 ) ) ( not ( = ?auto_1982286 ?auto_1982291 ) ) ( not ( = ?auto_1982284 ?auto_1982291 ) ) ( TRUCK-AT ?auto_1982289 ?auto_1982287 ) ( ON ?auto_1982273 ?auto_1982272 ) ( ON ?auto_1982274 ?auto_1982273 ) ( ON ?auto_1982275 ?auto_1982274 ) ( ON ?auto_1982276 ?auto_1982275 ) ( ON ?auto_1982277 ?auto_1982276 ) ( ON ?auto_1982278 ?auto_1982277 ) ( ON ?auto_1982279 ?auto_1982278 ) ( ON ?auto_1982280 ?auto_1982279 ) ( ON ?auto_1982281 ?auto_1982280 ) ( ON ?auto_1982282 ?auto_1982281 ) ( ON ?auto_1982283 ?auto_1982282 ) ( ON ?auto_1982284 ?auto_1982283 ) ( not ( = ?auto_1982272 ?auto_1982273 ) ) ( not ( = ?auto_1982272 ?auto_1982274 ) ) ( not ( = ?auto_1982272 ?auto_1982275 ) ) ( not ( = ?auto_1982272 ?auto_1982276 ) ) ( not ( = ?auto_1982272 ?auto_1982277 ) ) ( not ( = ?auto_1982272 ?auto_1982278 ) ) ( not ( = ?auto_1982272 ?auto_1982279 ) ) ( not ( = ?auto_1982272 ?auto_1982280 ) ) ( not ( = ?auto_1982272 ?auto_1982281 ) ) ( not ( = ?auto_1982272 ?auto_1982282 ) ) ( not ( = ?auto_1982272 ?auto_1982283 ) ) ( not ( = ?auto_1982272 ?auto_1982284 ) ) ( not ( = ?auto_1982272 ?auto_1982285 ) ) ( not ( = ?auto_1982272 ?auto_1982286 ) ) ( not ( = ?auto_1982272 ?auto_1982291 ) ) ( not ( = ?auto_1982273 ?auto_1982274 ) ) ( not ( = ?auto_1982273 ?auto_1982275 ) ) ( not ( = ?auto_1982273 ?auto_1982276 ) ) ( not ( = ?auto_1982273 ?auto_1982277 ) ) ( not ( = ?auto_1982273 ?auto_1982278 ) ) ( not ( = ?auto_1982273 ?auto_1982279 ) ) ( not ( = ?auto_1982273 ?auto_1982280 ) ) ( not ( = ?auto_1982273 ?auto_1982281 ) ) ( not ( = ?auto_1982273 ?auto_1982282 ) ) ( not ( = ?auto_1982273 ?auto_1982283 ) ) ( not ( = ?auto_1982273 ?auto_1982284 ) ) ( not ( = ?auto_1982273 ?auto_1982285 ) ) ( not ( = ?auto_1982273 ?auto_1982286 ) ) ( not ( = ?auto_1982273 ?auto_1982291 ) ) ( not ( = ?auto_1982274 ?auto_1982275 ) ) ( not ( = ?auto_1982274 ?auto_1982276 ) ) ( not ( = ?auto_1982274 ?auto_1982277 ) ) ( not ( = ?auto_1982274 ?auto_1982278 ) ) ( not ( = ?auto_1982274 ?auto_1982279 ) ) ( not ( = ?auto_1982274 ?auto_1982280 ) ) ( not ( = ?auto_1982274 ?auto_1982281 ) ) ( not ( = ?auto_1982274 ?auto_1982282 ) ) ( not ( = ?auto_1982274 ?auto_1982283 ) ) ( not ( = ?auto_1982274 ?auto_1982284 ) ) ( not ( = ?auto_1982274 ?auto_1982285 ) ) ( not ( = ?auto_1982274 ?auto_1982286 ) ) ( not ( = ?auto_1982274 ?auto_1982291 ) ) ( not ( = ?auto_1982275 ?auto_1982276 ) ) ( not ( = ?auto_1982275 ?auto_1982277 ) ) ( not ( = ?auto_1982275 ?auto_1982278 ) ) ( not ( = ?auto_1982275 ?auto_1982279 ) ) ( not ( = ?auto_1982275 ?auto_1982280 ) ) ( not ( = ?auto_1982275 ?auto_1982281 ) ) ( not ( = ?auto_1982275 ?auto_1982282 ) ) ( not ( = ?auto_1982275 ?auto_1982283 ) ) ( not ( = ?auto_1982275 ?auto_1982284 ) ) ( not ( = ?auto_1982275 ?auto_1982285 ) ) ( not ( = ?auto_1982275 ?auto_1982286 ) ) ( not ( = ?auto_1982275 ?auto_1982291 ) ) ( not ( = ?auto_1982276 ?auto_1982277 ) ) ( not ( = ?auto_1982276 ?auto_1982278 ) ) ( not ( = ?auto_1982276 ?auto_1982279 ) ) ( not ( = ?auto_1982276 ?auto_1982280 ) ) ( not ( = ?auto_1982276 ?auto_1982281 ) ) ( not ( = ?auto_1982276 ?auto_1982282 ) ) ( not ( = ?auto_1982276 ?auto_1982283 ) ) ( not ( = ?auto_1982276 ?auto_1982284 ) ) ( not ( = ?auto_1982276 ?auto_1982285 ) ) ( not ( = ?auto_1982276 ?auto_1982286 ) ) ( not ( = ?auto_1982276 ?auto_1982291 ) ) ( not ( = ?auto_1982277 ?auto_1982278 ) ) ( not ( = ?auto_1982277 ?auto_1982279 ) ) ( not ( = ?auto_1982277 ?auto_1982280 ) ) ( not ( = ?auto_1982277 ?auto_1982281 ) ) ( not ( = ?auto_1982277 ?auto_1982282 ) ) ( not ( = ?auto_1982277 ?auto_1982283 ) ) ( not ( = ?auto_1982277 ?auto_1982284 ) ) ( not ( = ?auto_1982277 ?auto_1982285 ) ) ( not ( = ?auto_1982277 ?auto_1982286 ) ) ( not ( = ?auto_1982277 ?auto_1982291 ) ) ( not ( = ?auto_1982278 ?auto_1982279 ) ) ( not ( = ?auto_1982278 ?auto_1982280 ) ) ( not ( = ?auto_1982278 ?auto_1982281 ) ) ( not ( = ?auto_1982278 ?auto_1982282 ) ) ( not ( = ?auto_1982278 ?auto_1982283 ) ) ( not ( = ?auto_1982278 ?auto_1982284 ) ) ( not ( = ?auto_1982278 ?auto_1982285 ) ) ( not ( = ?auto_1982278 ?auto_1982286 ) ) ( not ( = ?auto_1982278 ?auto_1982291 ) ) ( not ( = ?auto_1982279 ?auto_1982280 ) ) ( not ( = ?auto_1982279 ?auto_1982281 ) ) ( not ( = ?auto_1982279 ?auto_1982282 ) ) ( not ( = ?auto_1982279 ?auto_1982283 ) ) ( not ( = ?auto_1982279 ?auto_1982284 ) ) ( not ( = ?auto_1982279 ?auto_1982285 ) ) ( not ( = ?auto_1982279 ?auto_1982286 ) ) ( not ( = ?auto_1982279 ?auto_1982291 ) ) ( not ( = ?auto_1982280 ?auto_1982281 ) ) ( not ( = ?auto_1982280 ?auto_1982282 ) ) ( not ( = ?auto_1982280 ?auto_1982283 ) ) ( not ( = ?auto_1982280 ?auto_1982284 ) ) ( not ( = ?auto_1982280 ?auto_1982285 ) ) ( not ( = ?auto_1982280 ?auto_1982286 ) ) ( not ( = ?auto_1982280 ?auto_1982291 ) ) ( not ( = ?auto_1982281 ?auto_1982282 ) ) ( not ( = ?auto_1982281 ?auto_1982283 ) ) ( not ( = ?auto_1982281 ?auto_1982284 ) ) ( not ( = ?auto_1982281 ?auto_1982285 ) ) ( not ( = ?auto_1982281 ?auto_1982286 ) ) ( not ( = ?auto_1982281 ?auto_1982291 ) ) ( not ( = ?auto_1982282 ?auto_1982283 ) ) ( not ( = ?auto_1982282 ?auto_1982284 ) ) ( not ( = ?auto_1982282 ?auto_1982285 ) ) ( not ( = ?auto_1982282 ?auto_1982286 ) ) ( not ( = ?auto_1982282 ?auto_1982291 ) ) ( not ( = ?auto_1982283 ?auto_1982284 ) ) ( not ( = ?auto_1982283 ?auto_1982285 ) ) ( not ( = ?auto_1982283 ?auto_1982286 ) ) ( not ( = ?auto_1982283 ?auto_1982291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982284 ?auto_1982285 ?auto_1982286 )
      ( MAKE-14CRATE-VERIFY ?auto_1982272 ?auto_1982273 ?auto_1982274 ?auto_1982275 ?auto_1982276 ?auto_1982277 ?auto_1982278 ?auto_1982279 ?auto_1982280 ?auto_1982281 ?auto_1982282 ?auto_1982283 ?auto_1982284 ?auto_1982285 ?auto_1982286 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982476 - SURFACE
      ?auto_1982477 - SURFACE
      ?auto_1982478 - SURFACE
      ?auto_1982479 - SURFACE
      ?auto_1982480 - SURFACE
      ?auto_1982481 - SURFACE
      ?auto_1982482 - SURFACE
      ?auto_1982483 - SURFACE
      ?auto_1982484 - SURFACE
      ?auto_1982485 - SURFACE
      ?auto_1982486 - SURFACE
      ?auto_1982487 - SURFACE
      ?auto_1982488 - SURFACE
      ?auto_1982489 - SURFACE
      ?auto_1982490 - SURFACE
    )
    :vars
    (
      ?auto_1982491 - HOIST
      ?auto_1982493 - PLACE
      ?auto_1982495 - PLACE
      ?auto_1982492 - HOIST
      ?auto_1982494 - SURFACE
      ?auto_1982496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982491 ?auto_1982493 ) ( IS-CRATE ?auto_1982490 ) ( not ( = ?auto_1982489 ?auto_1982490 ) ) ( not ( = ?auto_1982488 ?auto_1982489 ) ) ( not ( = ?auto_1982488 ?auto_1982490 ) ) ( not ( = ?auto_1982495 ?auto_1982493 ) ) ( HOIST-AT ?auto_1982492 ?auto_1982495 ) ( not ( = ?auto_1982491 ?auto_1982492 ) ) ( AVAILABLE ?auto_1982492 ) ( SURFACE-AT ?auto_1982490 ?auto_1982495 ) ( ON ?auto_1982490 ?auto_1982494 ) ( CLEAR ?auto_1982490 ) ( not ( = ?auto_1982489 ?auto_1982494 ) ) ( not ( = ?auto_1982490 ?auto_1982494 ) ) ( not ( = ?auto_1982488 ?auto_1982494 ) ) ( TRUCK-AT ?auto_1982496 ?auto_1982493 ) ( SURFACE-AT ?auto_1982488 ?auto_1982493 ) ( CLEAR ?auto_1982488 ) ( LIFTING ?auto_1982491 ?auto_1982489 ) ( IS-CRATE ?auto_1982489 ) ( ON ?auto_1982477 ?auto_1982476 ) ( ON ?auto_1982478 ?auto_1982477 ) ( ON ?auto_1982479 ?auto_1982478 ) ( ON ?auto_1982480 ?auto_1982479 ) ( ON ?auto_1982481 ?auto_1982480 ) ( ON ?auto_1982482 ?auto_1982481 ) ( ON ?auto_1982483 ?auto_1982482 ) ( ON ?auto_1982484 ?auto_1982483 ) ( ON ?auto_1982485 ?auto_1982484 ) ( ON ?auto_1982486 ?auto_1982485 ) ( ON ?auto_1982487 ?auto_1982486 ) ( ON ?auto_1982488 ?auto_1982487 ) ( not ( = ?auto_1982476 ?auto_1982477 ) ) ( not ( = ?auto_1982476 ?auto_1982478 ) ) ( not ( = ?auto_1982476 ?auto_1982479 ) ) ( not ( = ?auto_1982476 ?auto_1982480 ) ) ( not ( = ?auto_1982476 ?auto_1982481 ) ) ( not ( = ?auto_1982476 ?auto_1982482 ) ) ( not ( = ?auto_1982476 ?auto_1982483 ) ) ( not ( = ?auto_1982476 ?auto_1982484 ) ) ( not ( = ?auto_1982476 ?auto_1982485 ) ) ( not ( = ?auto_1982476 ?auto_1982486 ) ) ( not ( = ?auto_1982476 ?auto_1982487 ) ) ( not ( = ?auto_1982476 ?auto_1982488 ) ) ( not ( = ?auto_1982476 ?auto_1982489 ) ) ( not ( = ?auto_1982476 ?auto_1982490 ) ) ( not ( = ?auto_1982476 ?auto_1982494 ) ) ( not ( = ?auto_1982477 ?auto_1982478 ) ) ( not ( = ?auto_1982477 ?auto_1982479 ) ) ( not ( = ?auto_1982477 ?auto_1982480 ) ) ( not ( = ?auto_1982477 ?auto_1982481 ) ) ( not ( = ?auto_1982477 ?auto_1982482 ) ) ( not ( = ?auto_1982477 ?auto_1982483 ) ) ( not ( = ?auto_1982477 ?auto_1982484 ) ) ( not ( = ?auto_1982477 ?auto_1982485 ) ) ( not ( = ?auto_1982477 ?auto_1982486 ) ) ( not ( = ?auto_1982477 ?auto_1982487 ) ) ( not ( = ?auto_1982477 ?auto_1982488 ) ) ( not ( = ?auto_1982477 ?auto_1982489 ) ) ( not ( = ?auto_1982477 ?auto_1982490 ) ) ( not ( = ?auto_1982477 ?auto_1982494 ) ) ( not ( = ?auto_1982478 ?auto_1982479 ) ) ( not ( = ?auto_1982478 ?auto_1982480 ) ) ( not ( = ?auto_1982478 ?auto_1982481 ) ) ( not ( = ?auto_1982478 ?auto_1982482 ) ) ( not ( = ?auto_1982478 ?auto_1982483 ) ) ( not ( = ?auto_1982478 ?auto_1982484 ) ) ( not ( = ?auto_1982478 ?auto_1982485 ) ) ( not ( = ?auto_1982478 ?auto_1982486 ) ) ( not ( = ?auto_1982478 ?auto_1982487 ) ) ( not ( = ?auto_1982478 ?auto_1982488 ) ) ( not ( = ?auto_1982478 ?auto_1982489 ) ) ( not ( = ?auto_1982478 ?auto_1982490 ) ) ( not ( = ?auto_1982478 ?auto_1982494 ) ) ( not ( = ?auto_1982479 ?auto_1982480 ) ) ( not ( = ?auto_1982479 ?auto_1982481 ) ) ( not ( = ?auto_1982479 ?auto_1982482 ) ) ( not ( = ?auto_1982479 ?auto_1982483 ) ) ( not ( = ?auto_1982479 ?auto_1982484 ) ) ( not ( = ?auto_1982479 ?auto_1982485 ) ) ( not ( = ?auto_1982479 ?auto_1982486 ) ) ( not ( = ?auto_1982479 ?auto_1982487 ) ) ( not ( = ?auto_1982479 ?auto_1982488 ) ) ( not ( = ?auto_1982479 ?auto_1982489 ) ) ( not ( = ?auto_1982479 ?auto_1982490 ) ) ( not ( = ?auto_1982479 ?auto_1982494 ) ) ( not ( = ?auto_1982480 ?auto_1982481 ) ) ( not ( = ?auto_1982480 ?auto_1982482 ) ) ( not ( = ?auto_1982480 ?auto_1982483 ) ) ( not ( = ?auto_1982480 ?auto_1982484 ) ) ( not ( = ?auto_1982480 ?auto_1982485 ) ) ( not ( = ?auto_1982480 ?auto_1982486 ) ) ( not ( = ?auto_1982480 ?auto_1982487 ) ) ( not ( = ?auto_1982480 ?auto_1982488 ) ) ( not ( = ?auto_1982480 ?auto_1982489 ) ) ( not ( = ?auto_1982480 ?auto_1982490 ) ) ( not ( = ?auto_1982480 ?auto_1982494 ) ) ( not ( = ?auto_1982481 ?auto_1982482 ) ) ( not ( = ?auto_1982481 ?auto_1982483 ) ) ( not ( = ?auto_1982481 ?auto_1982484 ) ) ( not ( = ?auto_1982481 ?auto_1982485 ) ) ( not ( = ?auto_1982481 ?auto_1982486 ) ) ( not ( = ?auto_1982481 ?auto_1982487 ) ) ( not ( = ?auto_1982481 ?auto_1982488 ) ) ( not ( = ?auto_1982481 ?auto_1982489 ) ) ( not ( = ?auto_1982481 ?auto_1982490 ) ) ( not ( = ?auto_1982481 ?auto_1982494 ) ) ( not ( = ?auto_1982482 ?auto_1982483 ) ) ( not ( = ?auto_1982482 ?auto_1982484 ) ) ( not ( = ?auto_1982482 ?auto_1982485 ) ) ( not ( = ?auto_1982482 ?auto_1982486 ) ) ( not ( = ?auto_1982482 ?auto_1982487 ) ) ( not ( = ?auto_1982482 ?auto_1982488 ) ) ( not ( = ?auto_1982482 ?auto_1982489 ) ) ( not ( = ?auto_1982482 ?auto_1982490 ) ) ( not ( = ?auto_1982482 ?auto_1982494 ) ) ( not ( = ?auto_1982483 ?auto_1982484 ) ) ( not ( = ?auto_1982483 ?auto_1982485 ) ) ( not ( = ?auto_1982483 ?auto_1982486 ) ) ( not ( = ?auto_1982483 ?auto_1982487 ) ) ( not ( = ?auto_1982483 ?auto_1982488 ) ) ( not ( = ?auto_1982483 ?auto_1982489 ) ) ( not ( = ?auto_1982483 ?auto_1982490 ) ) ( not ( = ?auto_1982483 ?auto_1982494 ) ) ( not ( = ?auto_1982484 ?auto_1982485 ) ) ( not ( = ?auto_1982484 ?auto_1982486 ) ) ( not ( = ?auto_1982484 ?auto_1982487 ) ) ( not ( = ?auto_1982484 ?auto_1982488 ) ) ( not ( = ?auto_1982484 ?auto_1982489 ) ) ( not ( = ?auto_1982484 ?auto_1982490 ) ) ( not ( = ?auto_1982484 ?auto_1982494 ) ) ( not ( = ?auto_1982485 ?auto_1982486 ) ) ( not ( = ?auto_1982485 ?auto_1982487 ) ) ( not ( = ?auto_1982485 ?auto_1982488 ) ) ( not ( = ?auto_1982485 ?auto_1982489 ) ) ( not ( = ?auto_1982485 ?auto_1982490 ) ) ( not ( = ?auto_1982485 ?auto_1982494 ) ) ( not ( = ?auto_1982486 ?auto_1982487 ) ) ( not ( = ?auto_1982486 ?auto_1982488 ) ) ( not ( = ?auto_1982486 ?auto_1982489 ) ) ( not ( = ?auto_1982486 ?auto_1982490 ) ) ( not ( = ?auto_1982486 ?auto_1982494 ) ) ( not ( = ?auto_1982487 ?auto_1982488 ) ) ( not ( = ?auto_1982487 ?auto_1982489 ) ) ( not ( = ?auto_1982487 ?auto_1982490 ) ) ( not ( = ?auto_1982487 ?auto_1982494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982488 ?auto_1982489 ?auto_1982490 )
      ( MAKE-14CRATE-VERIFY ?auto_1982476 ?auto_1982477 ?auto_1982478 ?auto_1982479 ?auto_1982480 ?auto_1982481 ?auto_1982482 ?auto_1982483 ?auto_1982484 ?auto_1982485 ?auto_1982486 ?auto_1982487 ?auto_1982488 ?auto_1982489 ?auto_1982490 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982680 - SURFACE
      ?auto_1982681 - SURFACE
      ?auto_1982682 - SURFACE
      ?auto_1982683 - SURFACE
      ?auto_1982684 - SURFACE
      ?auto_1982685 - SURFACE
      ?auto_1982686 - SURFACE
      ?auto_1982687 - SURFACE
      ?auto_1982688 - SURFACE
      ?auto_1982689 - SURFACE
      ?auto_1982690 - SURFACE
      ?auto_1982691 - SURFACE
      ?auto_1982692 - SURFACE
      ?auto_1982693 - SURFACE
      ?auto_1982694 - SURFACE
    )
    :vars
    (
      ?auto_1982697 - HOIST
      ?auto_1982698 - PLACE
      ?auto_1982695 - PLACE
      ?auto_1982699 - HOIST
      ?auto_1982700 - SURFACE
      ?auto_1982696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982697 ?auto_1982698 ) ( IS-CRATE ?auto_1982694 ) ( not ( = ?auto_1982693 ?auto_1982694 ) ) ( not ( = ?auto_1982692 ?auto_1982693 ) ) ( not ( = ?auto_1982692 ?auto_1982694 ) ) ( not ( = ?auto_1982695 ?auto_1982698 ) ) ( HOIST-AT ?auto_1982699 ?auto_1982695 ) ( not ( = ?auto_1982697 ?auto_1982699 ) ) ( AVAILABLE ?auto_1982699 ) ( SURFACE-AT ?auto_1982694 ?auto_1982695 ) ( ON ?auto_1982694 ?auto_1982700 ) ( CLEAR ?auto_1982694 ) ( not ( = ?auto_1982693 ?auto_1982700 ) ) ( not ( = ?auto_1982694 ?auto_1982700 ) ) ( not ( = ?auto_1982692 ?auto_1982700 ) ) ( TRUCK-AT ?auto_1982696 ?auto_1982698 ) ( SURFACE-AT ?auto_1982692 ?auto_1982698 ) ( CLEAR ?auto_1982692 ) ( IS-CRATE ?auto_1982693 ) ( AVAILABLE ?auto_1982697 ) ( IN ?auto_1982693 ?auto_1982696 ) ( ON ?auto_1982681 ?auto_1982680 ) ( ON ?auto_1982682 ?auto_1982681 ) ( ON ?auto_1982683 ?auto_1982682 ) ( ON ?auto_1982684 ?auto_1982683 ) ( ON ?auto_1982685 ?auto_1982684 ) ( ON ?auto_1982686 ?auto_1982685 ) ( ON ?auto_1982687 ?auto_1982686 ) ( ON ?auto_1982688 ?auto_1982687 ) ( ON ?auto_1982689 ?auto_1982688 ) ( ON ?auto_1982690 ?auto_1982689 ) ( ON ?auto_1982691 ?auto_1982690 ) ( ON ?auto_1982692 ?auto_1982691 ) ( not ( = ?auto_1982680 ?auto_1982681 ) ) ( not ( = ?auto_1982680 ?auto_1982682 ) ) ( not ( = ?auto_1982680 ?auto_1982683 ) ) ( not ( = ?auto_1982680 ?auto_1982684 ) ) ( not ( = ?auto_1982680 ?auto_1982685 ) ) ( not ( = ?auto_1982680 ?auto_1982686 ) ) ( not ( = ?auto_1982680 ?auto_1982687 ) ) ( not ( = ?auto_1982680 ?auto_1982688 ) ) ( not ( = ?auto_1982680 ?auto_1982689 ) ) ( not ( = ?auto_1982680 ?auto_1982690 ) ) ( not ( = ?auto_1982680 ?auto_1982691 ) ) ( not ( = ?auto_1982680 ?auto_1982692 ) ) ( not ( = ?auto_1982680 ?auto_1982693 ) ) ( not ( = ?auto_1982680 ?auto_1982694 ) ) ( not ( = ?auto_1982680 ?auto_1982700 ) ) ( not ( = ?auto_1982681 ?auto_1982682 ) ) ( not ( = ?auto_1982681 ?auto_1982683 ) ) ( not ( = ?auto_1982681 ?auto_1982684 ) ) ( not ( = ?auto_1982681 ?auto_1982685 ) ) ( not ( = ?auto_1982681 ?auto_1982686 ) ) ( not ( = ?auto_1982681 ?auto_1982687 ) ) ( not ( = ?auto_1982681 ?auto_1982688 ) ) ( not ( = ?auto_1982681 ?auto_1982689 ) ) ( not ( = ?auto_1982681 ?auto_1982690 ) ) ( not ( = ?auto_1982681 ?auto_1982691 ) ) ( not ( = ?auto_1982681 ?auto_1982692 ) ) ( not ( = ?auto_1982681 ?auto_1982693 ) ) ( not ( = ?auto_1982681 ?auto_1982694 ) ) ( not ( = ?auto_1982681 ?auto_1982700 ) ) ( not ( = ?auto_1982682 ?auto_1982683 ) ) ( not ( = ?auto_1982682 ?auto_1982684 ) ) ( not ( = ?auto_1982682 ?auto_1982685 ) ) ( not ( = ?auto_1982682 ?auto_1982686 ) ) ( not ( = ?auto_1982682 ?auto_1982687 ) ) ( not ( = ?auto_1982682 ?auto_1982688 ) ) ( not ( = ?auto_1982682 ?auto_1982689 ) ) ( not ( = ?auto_1982682 ?auto_1982690 ) ) ( not ( = ?auto_1982682 ?auto_1982691 ) ) ( not ( = ?auto_1982682 ?auto_1982692 ) ) ( not ( = ?auto_1982682 ?auto_1982693 ) ) ( not ( = ?auto_1982682 ?auto_1982694 ) ) ( not ( = ?auto_1982682 ?auto_1982700 ) ) ( not ( = ?auto_1982683 ?auto_1982684 ) ) ( not ( = ?auto_1982683 ?auto_1982685 ) ) ( not ( = ?auto_1982683 ?auto_1982686 ) ) ( not ( = ?auto_1982683 ?auto_1982687 ) ) ( not ( = ?auto_1982683 ?auto_1982688 ) ) ( not ( = ?auto_1982683 ?auto_1982689 ) ) ( not ( = ?auto_1982683 ?auto_1982690 ) ) ( not ( = ?auto_1982683 ?auto_1982691 ) ) ( not ( = ?auto_1982683 ?auto_1982692 ) ) ( not ( = ?auto_1982683 ?auto_1982693 ) ) ( not ( = ?auto_1982683 ?auto_1982694 ) ) ( not ( = ?auto_1982683 ?auto_1982700 ) ) ( not ( = ?auto_1982684 ?auto_1982685 ) ) ( not ( = ?auto_1982684 ?auto_1982686 ) ) ( not ( = ?auto_1982684 ?auto_1982687 ) ) ( not ( = ?auto_1982684 ?auto_1982688 ) ) ( not ( = ?auto_1982684 ?auto_1982689 ) ) ( not ( = ?auto_1982684 ?auto_1982690 ) ) ( not ( = ?auto_1982684 ?auto_1982691 ) ) ( not ( = ?auto_1982684 ?auto_1982692 ) ) ( not ( = ?auto_1982684 ?auto_1982693 ) ) ( not ( = ?auto_1982684 ?auto_1982694 ) ) ( not ( = ?auto_1982684 ?auto_1982700 ) ) ( not ( = ?auto_1982685 ?auto_1982686 ) ) ( not ( = ?auto_1982685 ?auto_1982687 ) ) ( not ( = ?auto_1982685 ?auto_1982688 ) ) ( not ( = ?auto_1982685 ?auto_1982689 ) ) ( not ( = ?auto_1982685 ?auto_1982690 ) ) ( not ( = ?auto_1982685 ?auto_1982691 ) ) ( not ( = ?auto_1982685 ?auto_1982692 ) ) ( not ( = ?auto_1982685 ?auto_1982693 ) ) ( not ( = ?auto_1982685 ?auto_1982694 ) ) ( not ( = ?auto_1982685 ?auto_1982700 ) ) ( not ( = ?auto_1982686 ?auto_1982687 ) ) ( not ( = ?auto_1982686 ?auto_1982688 ) ) ( not ( = ?auto_1982686 ?auto_1982689 ) ) ( not ( = ?auto_1982686 ?auto_1982690 ) ) ( not ( = ?auto_1982686 ?auto_1982691 ) ) ( not ( = ?auto_1982686 ?auto_1982692 ) ) ( not ( = ?auto_1982686 ?auto_1982693 ) ) ( not ( = ?auto_1982686 ?auto_1982694 ) ) ( not ( = ?auto_1982686 ?auto_1982700 ) ) ( not ( = ?auto_1982687 ?auto_1982688 ) ) ( not ( = ?auto_1982687 ?auto_1982689 ) ) ( not ( = ?auto_1982687 ?auto_1982690 ) ) ( not ( = ?auto_1982687 ?auto_1982691 ) ) ( not ( = ?auto_1982687 ?auto_1982692 ) ) ( not ( = ?auto_1982687 ?auto_1982693 ) ) ( not ( = ?auto_1982687 ?auto_1982694 ) ) ( not ( = ?auto_1982687 ?auto_1982700 ) ) ( not ( = ?auto_1982688 ?auto_1982689 ) ) ( not ( = ?auto_1982688 ?auto_1982690 ) ) ( not ( = ?auto_1982688 ?auto_1982691 ) ) ( not ( = ?auto_1982688 ?auto_1982692 ) ) ( not ( = ?auto_1982688 ?auto_1982693 ) ) ( not ( = ?auto_1982688 ?auto_1982694 ) ) ( not ( = ?auto_1982688 ?auto_1982700 ) ) ( not ( = ?auto_1982689 ?auto_1982690 ) ) ( not ( = ?auto_1982689 ?auto_1982691 ) ) ( not ( = ?auto_1982689 ?auto_1982692 ) ) ( not ( = ?auto_1982689 ?auto_1982693 ) ) ( not ( = ?auto_1982689 ?auto_1982694 ) ) ( not ( = ?auto_1982689 ?auto_1982700 ) ) ( not ( = ?auto_1982690 ?auto_1982691 ) ) ( not ( = ?auto_1982690 ?auto_1982692 ) ) ( not ( = ?auto_1982690 ?auto_1982693 ) ) ( not ( = ?auto_1982690 ?auto_1982694 ) ) ( not ( = ?auto_1982690 ?auto_1982700 ) ) ( not ( = ?auto_1982691 ?auto_1982692 ) ) ( not ( = ?auto_1982691 ?auto_1982693 ) ) ( not ( = ?auto_1982691 ?auto_1982694 ) ) ( not ( = ?auto_1982691 ?auto_1982700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982692 ?auto_1982693 ?auto_1982694 )
      ( MAKE-14CRATE-VERIFY ?auto_1982680 ?auto_1982681 ?auto_1982682 ?auto_1982683 ?auto_1982684 ?auto_1982685 ?auto_1982686 ?auto_1982687 ?auto_1982688 ?auto_1982689 ?auto_1982690 ?auto_1982691 ?auto_1982692 ?auto_1982693 ?auto_1982694 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1999872 - SURFACE
      ?auto_1999873 - SURFACE
      ?auto_1999874 - SURFACE
      ?auto_1999875 - SURFACE
      ?auto_1999876 - SURFACE
      ?auto_1999877 - SURFACE
      ?auto_1999878 - SURFACE
      ?auto_1999879 - SURFACE
      ?auto_1999880 - SURFACE
      ?auto_1999881 - SURFACE
      ?auto_1999882 - SURFACE
      ?auto_1999883 - SURFACE
      ?auto_1999884 - SURFACE
      ?auto_1999885 - SURFACE
      ?auto_1999886 - SURFACE
      ?auto_1999887 - SURFACE
    )
    :vars
    (
      ?auto_1999889 - HOIST
      ?auto_1999888 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1999889 ?auto_1999888 ) ( SURFACE-AT ?auto_1999886 ?auto_1999888 ) ( CLEAR ?auto_1999886 ) ( LIFTING ?auto_1999889 ?auto_1999887 ) ( IS-CRATE ?auto_1999887 ) ( not ( = ?auto_1999886 ?auto_1999887 ) ) ( ON ?auto_1999873 ?auto_1999872 ) ( ON ?auto_1999874 ?auto_1999873 ) ( ON ?auto_1999875 ?auto_1999874 ) ( ON ?auto_1999876 ?auto_1999875 ) ( ON ?auto_1999877 ?auto_1999876 ) ( ON ?auto_1999878 ?auto_1999877 ) ( ON ?auto_1999879 ?auto_1999878 ) ( ON ?auto_1999880 ?auto_1999879 ) ( ON ?auto_1999881 ?auto_1999880 ) ( ON ?auto_1999882 ?auto_1999881 ) ( ON ?auto_1999883 ?auto_1999882 ) ( ON ?auto_1999884 ?auto_1999883 ) ( ON ?auto_1999885 ?auto_1999884 ) ( ON ?auto_1999886 ?auto_1999885 ) ( not ( = ?auto_1999872 ?auto_1999873 ) ) ( not ( = ?auto_1999872 ?auto_1999874 ) ) ( not ( = ?auto_1999872 ?auto_1999875 ) ) ( not ( = ?auto_1999872 ?auto_1999876 ) ) ( not ( = ?auto_1999872 ?auto_1999877 ) ) ( not ( = ?auto_1999872 ?auto_1999878 ) ) ( not ( = ?auto_1999872 ?auto_1999879 ) ) ( not ( = ?auto_1999872 ?auto_1999880 ) ) ( not ( = ?auto_1999872 ?auto_1999881 ) ) ( not ( = ?auto_1999872 ?auto_1999882 ) ) ( not ( = ?auto_1999872 ?auto_1999883 ) ) ( not ( = ?auto_1999872 ?auto_1999884 ) ) ( not ( = ?auto_1999872 ?auto_1999885 ) ) ( not ( = ?auto_1999872 ?auto_1999886 ) ) ( not ( = ?auto_1999872 ?auto_1999887 ) ) ( not ( = ?auto_1999873 ?auto_1999874 ) ) ( not ( = ?auto_1999873 ?auto_1999875 ) ) ( not ( = ?auto_1999873 ?auto_1999876 ) ) ( not ( = ?auto_1999873 ?auto_1999877 ) ) ( not ( = ?auto_1999873 ?auto_1999878 ) ) ( not ( = ?auto_1999873 ?auto_1999879 ) ) ( not ( = ?auto_1999873 ?auto_1999880 ) ) ( not ( = ?auto_1999873 ?auto_1999881 ) ) ( not ( = ?auto_1999873 ?auto_1999882 ) ) ( not ( = ?auto_1999873 ?auto_1999883 ) ) ( not ( = ?auto_1999873 ?auto_1999884 ) ) ( not ( = ?auto_1999873 ?auto_1999885 ) ) ( not ( = ?auto_1999873 ?auto_1999886 ) ) ( not ( = ?auto_1999873 ?auto_1999887 ) ) ( not ( = ?auto_1999874 ?auto_1999875 ) ) ( not ( = ?auto_1999874 ?auto_1999876 ) ) ( not ( = ?auto_1999874 ?auto_1999877 ) ) ( not ( = ?auto_1999874 ?auto_1999878 ) ) ( not ( = ?auto_1999874 ?auto_1999879 ) ) ( not ( = ?auto_1999874 ?auto_1999880 ) ) ( not ( = ?auto_1999874 ?auto_1999881 ) ) ( not ( = ?auto_1999874 ?auto_1999882 ) ) ( not ( = ?auto_1999874 ?auto_1999883 ) ) ( not ( = ?auto_1999874 ?auto_1999884 ) ) ( not ( = ?auto_1999874 ?auto_1999885 ) ) ( not ( = ?auto_1999874 ?auto_1999886 ) ) ( not ( = ?auto_1999874 ?auto_1999887 ) ) ( not ( = ?auto_1999875 ?auto_1999876 ) ) ( not ( = ?auto_1999875 ?auto_1999877 ) ) ( not ( = ?auto_1999875 ?auto_1999878 ) ) ( not ( = ?auto_1999875 ?auto_1999879 ) ) ( not ( = ?auto_1999875 ?auto_1999880 ) ) ( not ( = ?auto_1999875 ?auto_1999881 ) ) ( not ( = ?auto_1999875 ?auto_1999882 ) ) ( not ( = ?auto_1999875 ?auto_1999883 ) ) ( not ( = ?auto_1999875 ?auto_1999884 ) ) ( not ( = ?auto_1999875 ?auto_1999885 ) ) ( not ( = ?auto_1999875 ?auto_1999886 ) ) ( not ( = ?auto_1999875 ?auto_1999887 ) ) ( not ( = ?auto_1999876 ?auto_1999877 ) ) ( not ( = ?auto_1999876 ?auto_1999878 ) ) ( not ( = ?auto_1999876 ?auto_1999879 ) ) ( not ( = ?auto_1999876 ?auto_1999880 ) ) ( not ( = ?auto_1999876 ?auto_1999881 ) ) ( not ( = ?auto_1999876 ?auto_1999882 ) ) ( not ( = ?auto_1999876 ?auto_1999883 ) ) ( not ( = ?auto_1999876 ?auto_1999884 ) ) ( not ( = ?auto_1999876 ?auto_1999885 ) ) ( not ( = ?auto_1999876 ?auto_1999886 ) ) ( not ( = ?auto_1999876 ?auto_1999887 ) ) ( not ( = ?auto_1999877 ?auto_1999878 ) ) ( not ( = ?auto_1999877 ?auto_1999879 ) ) ( not ( = ?auto_1999877 ?auto_1999880 ) ) ( not ( = ?auto_1999877 ?auto_1999881 ) ) ( not ( = ?auto_1999877 ?auto_1999882 ) ) ( not ( = ?auto_1999877 ?auto_1999883 ) ) ( not ( = ?auto_1999877 ?auto_1999884 ) ) ( not ( = ?auto_1999877 ?auto_1999885 ) ) ( not ( = ?auto_1999877 ?auto_1999886 ) ) ( not ( = ?auto_1999877 ?auto_1999887 ) ) ( not ( = ?auto_1999878 ?auto_1999879 ) ) ( not ( = ?auto_1999878 ?auto_1999880 ) ) ( not ( = ?auto_1999878 ?auto_1999881 ) ) ( not ( = ?auto_1999878 ?auto_1999882 ) ) ( not ( = ?auto_1999878 ?auto_1999883 ) ) ( not ( = ?auto_1999878 ?auto_1999884 ) ) ( not ( = ?auto_1999878 ?auto_1999885 ) ) ( not ( = ?auto_1999878 ?auto_1999886 ) ) ( not ( = ?auto_1999878 ?auto_1999887 ) ) ( not ( = ?auto_1999879 ?auto_1999880 ) ) ( not ( = ?auto_1999879 ?auto_1999881 ) ) ( not ( = ?auto_1999879 ?auto_1999882 ) ) ( not ( = ?auto_1999879 ?auto_1999883 ) ) ( not ( = ?auto_1999879 ?auto_1999884 ) ) ( not ( = ?auto_1999879 ?auto_1999885 ) ) ( not ( = ?auto_1999879 ?auto_1999886 ) ) ( not ( = ?auto_1999879 ?auto_1999887 ) ) ( not ( = ?auto_1999880 ?auto_1999881 ) ) ( not ( = ?auto_1999880 ?auto_1999882 ) ) ( not ( = ?auto_1999880 ?auto_1999883 ) ) ( not ( = ?auto_1999880 ?auto_1999884 ) ) ( not ( = ?auto_1999880 ?auto_1999885 ) ) ( not ( = ?auto_1999880 ?auto_1999886 ) ) ( not ( = ?auto_1999880 ?auto_1999887 ) ) ( not ( = ?auto_1999881 ?auto_1999882 ) ) ( not ( = ?auto_1999881 ?auto_1999883 ) ) ( not ( = ?auto_1999881 ?auto_1999884 ) ) ( not ( = ?auto_1999881 ?auto_1999885 ) ) ( not ( = ?auto_1999881 ?auto_1999886 ) ) ( not ( = ?auto_1999881 ?auto_1999887 ) ) ( not ( = ?auto_1999882 ?auto_1999883 ) ) ( not ( = ?auto_1999882 ?auto_1999884 ) ) ( not ( = ?auto_1999882 ?auto_1999885 ) ) ( not ( = ?auto_1999882 ?auto_1999886 ) ) ( not ( = ?auto_1999882 ?auto_1999887 ) ) ( not ( = ?auto_1999883 ?auto_1999884 ) ) ( not ( = ?auto_1999883 ?auto_1999885 ) ) ( not ( = ?auto_1999883 ?auto_1999886 ) ) ( not ( = ?auto_1999883 ?auto_1999887 ) ) ( not ( = ?auto_1999884 ?auto_1999885 ) ) ( not ( = ?auto_1999884 ?auto_1999886 ) ) ( not ( = ?auto_1999884 ?auto_1999887 ) ) ( not ( = ?auto_1999885 ?auto_1999886 ) ) ( not ( = ?auto_1999885 ?auto_1999887 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1999886 ?auto_1999887 )
      ( MAKE-15CRATE-VERIFY ?auto_1999872 ?auto_1999873 ?auto_1999874 ?auto_1999875 ?auto_1999876 ?auto_1999877 ?auto_1999878 ?auto_1999879 ?auto_1999880 ?auto_1999881 ?auto_1999882 ?auto_1999883 ?auto_1999884 ?auto_1999885 ?auto_1999886 ?auto_1999887 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000051 - SURFACE
      ?auto_2000052 - SURFACE
      ?auto_2000053 - SURFACE
      ?auto_2000054 - SURFACE
      ?auto_2000055 - SURFACE
      ?auto_2000056 - SURFACE
      ?auto_2000057 - SURFACE
      ?auto_2000058 - SURFACE
      ?auto_2000059 - SURFACE
      ?auto_2000060 - SURFACE
      ?auto_2000061 - SURFACE
      ?auto_2000062 - SURFACE
      ?auto_2000063 - SURFACE
      ?auto_2000064 - SURFACE
      ?auto_2000065 - SURFACE
      ?auto_2000066 - SURFACE
    )
    :vars
    (
      ?auto_2000069 - HOIST
      ?auto_2000067 - PLACE
      ?auto_2000068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000069 ?auto_2000067 ) ( SURFACE-AT ?auto_2000065 ?auto_2000067 ) ( CLEAR ?auto_2000065 ) ( IS-CRATE ?auto_2000066 ) ( not ( = ?auto_2000065 ?auto_2000066 ) ) ( TRUCK-AT ?auto_2000068 ?auto_2000067 ) ( AVAILABLE ?auto_2000069 ) ( IN ?auto_2000066 ?auto_2000068 ) ( ON ?auto_2000065 ?auto_2000064 ) ( not ( = ?auto_2000064 ?auto_2000065 ) ) ( not ( = ?auto_2000064 ?auto_2000066 ) ) ( ON ?auto_2000052 ?auto_2000051 ) ( ON ?auto_2000053 ?auto_2000052 ) ( ON ?auto_2000054 ?auto_2000053 ) ( ON ?auto_2000055 ?auto_2000054 ) ( ON ?auto_2000056 ?auto_2000055 ) ( ON ?auto_2000057 ?auto_2000056 ) ( ON ?auto_2000058 ?auto_2000057 ) ( ON ?auto_2000059 ?auto_2000058 ) ( ON ?auto_2000060 ?auto_2000059 ) ( ON ?auto_2000061 ?auto_2000060 ) ( ON ?auto_2000062 ?auto_2000061 ) ( ON ?auto_2000063 ?auto_2000062 ) ( ON ?auto_2000064 ?auto_2000063 ) ( not ( = ?auto_2000051 ?auto_2000052 ) ) ( not ( = ?auto_2000051 ?auto_2000053 ) ) ( not ( = ?auto_2000051 ?auto_2000054 ) ) ( not ( = ?auto_2000051 ?auto_2000055 ) ) ( not ( = ?auto_2000051 ?auto_2000056 ) ) ( not ( = ?auto_2000051 ?auto_2000057 ) ) ( not ( = ?auto_2000051 ?auto_2000058 ) ) ( not ( = ?auto_2000051 ?auto_2000059 ) ) ( not ( = ?auto_2000051 ?auto_2000060 ) ) ( not ( = ?auto_2000051 ?auto_2000061 ) ) ( not ( = ?auto_2000051 ?auto_2000062 ) ) ( not ( = ?auto_2000051 ?auto_2000063 ) ) ( not ( = ?auto_2000051 ?auto_2000064 ) ) ( not ( = ?auto_2000051 ?auto_2000065 ) ) ( not ( = ?auto_2000051 ?auto_2000066 ) ) ( not ( = ?auto_2000052 ?auto_2000053 ) ) ( not ( = ?auto_2000052 ?auto_2000054 ) ) ( not ( = ?auto_2000052 ?auto_2000055 ) ) ( not ( = ?auto_2000052 ?auto_2000056 ) ) ( not ( = ?auto_2000052 ?auto_2000057 ) ) ( not ( = ?auto_2000052 ?auto_2000058 ) ) ( not ( = ?auto_2000052 ?auto_2000059 ) ) ( not ( = ?auto_2000052 ?auto_2000060 ) ) ( not ( = ?auto_2000052 ?auto_2000061 ) ) ( not ( = ?auto_2000052 ?auto_2000062 ) ) ( not ( = ?auto_2000052 ?auto_2000063 ) ) ( not ( = ?auto_2000052 ?auto_2000064 ) ) ( not ( = ?auto_2000052 ?auto_2000065 ) ) ( not ( = ?auto_2000052 ?auto_2000066 ) ) ( not ( = ?auto_2000053 ?auto_2000054 ) ) ( not ( = ?auto_2000053 ?auto_2000055 ) ) ( not ( = ?auto_2000053 ?auto_2000056 ) ) ( not ( = ?auto_2000053 ?auto_2000057 ) ) ( not ( = ?auto_2000053 ?auto_2000058 ) ) ( not ( = ?auto_2000053 ?auto_2000059 ) ) ( not ( = ?auto_2000053 ?auto_2000060 ) ) ( not ( = ?auto_2000053 ?auto_2000061 ) ) ( not ( = ?auto_2000053 ?auto_2000062 ) ) ( not ( = ?auto_2000053 ?auto_2000063 ) ) ( not ( = ?auto_2000053 ?auto_2000064 ) ) ( not ( = ?auto_2000053 ?auto_2000065 ) ) ( not ( = ?auto_2000053 ?auto_2000066 ) ) ( not ( = ?auto_2000054 ?auto_2000055 ) ) ( not ( = ?auto_2000054 ?auto_2000056 ) ) ( not ( = ?auto_2000054 ?auto_2000057 ) ) ( not ( = ?auto_2000054 ?auto_2000058 ) ) ( not ( = ?auto_2000054 ?auto_2000059 ) ) ( not ( = ?auto_2000054 ?auto_2000060 ) ) ( not ( = ?auto_2000054 ?auto_2000061 ) ) ( not ( = ?auto_2000054 ?auto_2000062 ) ) ( not ( = ?auto_2000054 ?auto_2000063 ) ) ( not ( = ?auto_2000054 ?auto_2000064 ) ) ( not ( = ?auto_2000054 ?auto_2000065 ) ) ( not ( = ?auto_2000054 ?auto_2000066 ) ) ( not ( = ?auto_2000055 ?auto_2000056 ) ) ( not ( = ?auto_2000055 ?auto_2000057 ) ) ( not ( = ?auto_2000055 ?auto_2000058 ) ) ( not ( = ?auto_2000055 ?auto_2000059 ) ) ( not ( = ?auto_2000055 ?auto_2000060 ) ) ( not ( = ?auto_2000055 ?auto_2000061 ) ) ( not ( = ?auto_2000055 ?auto_2000062 ) ) ( not ( = ?auto_2000055 ?auto_2000063 ) ) ( not ( = ?auto_2000055 ?auto_2000064 ) ) ( not ( = ?auto_2000055 ?auto_2000065 ) ) ( not ( = ?auto_2000055 ?auto_2000066 ) ) ( not ( = ?auto_2000056 ?auto_2000057 ) ) ( not ( = ?auto_2000056 ?auto_2000058 ) ) ( not ( = ?auto_2000056 ?auto_2000059 ) ) ( not ( = ?auto_2000056 ?auto_2000060 ) ) ( not ( = ?auto_2000056 ?auto_2000061 ) ) ( not ( = ?auto_2000056 ?auto_2000062 ) ) ( not ( = ?auto_2000056 ?auto_2000063 ) ) ( not ( = ?auto_2000056 ?auto_2000064 ) ) ( not ( = ?auto_2000056 ?auto_2000065 ) ) ( not ( = ?auto_2000056 ?auto_2000066 ) ) ( not ( = ?auto_2000057 ?auto_2000058 ) ) ( not ( = ?auto_2000057 ?auto_2000059 ) ) ( not ( = ?auto_2000057 ?auto_2000060 ) ) ( not ( = ?auto_2000057 ?auto_2000061 ) ) ( not ( = ?auto_2000057 ?auto_2000062 ) ) ( not ( = ?auto_2000057 ?auto_2000063 ) ) ( not ( = ?auto_2000057 ?auto_2000064 ) ) ( not ( = ?auto_2000057 ?auto_2000065 ) ) ( not ( = ?auto_2000057 ?auto_2000066 ) ) ( not ( = ?auto_2000058 ?auto_2000059 ) ) ( not ( = ?auto_2000058 ?auto_2000060 ) ) ( not ( = ?auto_2000058 ?auto_2000061 ) ) ( not ( = ?auto_2000058 ?auto_2000062 ) ) ( not ( = ?auto_2000058 ?auto_2000063 ) ) ( not ( = ?auto_2000058 ?auto_2000064 ) ) ( not ( = ?auto_2000058 ?auto_2000065 ) ) ( not ( = ?auto_2000058 ?auto_2000066 ) ) ( not ( = ?auto_2000059 ?auto_2000060 ) ) ( not ( = ?auto_2000059 ?auto_2000061 ) ) ( not ( = ?auto_2000059 ?auto_2000062 ) ) ( not ( = ?auto_2000059 ?auto_2000063 ) ) ( not ( = ?auto_2000059 ?auto_2000064 ) ) ( not ( = ?auto_2000059 ?auto_2000065 ) ) ( not ( = ?auto_2000059 ?auto_2000066 ) ) ( not ( = ?auto_2000060 ?auto_2000061 ) ) ( not ( = ?auto_2000060 ?auto_2000062 ) ) ( not ( = ?auto_2000060 ?auto_2000063 ) ) ( not ( = ?auto_2000060 ?auto_2000064 ) ) ( not ( = ?auto_2000060 ?auto_2000065 ) ) ( not ( = ?auto_2000060 ?auto_2000066 ) ) ( not ( = ?auto_2000061 ?auto_2000062 ) ) ( not ( = ?auto_2000061 ?auto_2000063 ) ) ( not ( = ?auto_2000061 ?auto_2000064 ) ) ( not ( = ?auto_2000061 ?auto_2000065 ) ) ( not ( = ?auto_2000061 ?auto_2000066 ) ) ( not ( = ?auto_2000062 ?auto_2000063 ) ) ( not ( = ?auto_2000062 ?auto_2000064 ) ) ( not ( = ?auto_2000062 ?auto_2000065 ) ) ( not ( = ?auto_2000062 ?auto_2000066 ) ) ( not ( = ?auto_2000063 ?auto_2000064 ) ) ( not ( = ?auto_2000063 ?auto_2000065 ) ) ( not ( = ?auto_2000063 ?auto_2000066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000064 ?auto_2000065 ?auto_2000066 )
      ( MAKE-15CRATE-VERIFY ?auto_2000051 ?auto_2000052 ?auto_2000053 ?auto_2000054 ?auto_2000055 ?auto_2000056 ?auto_2000057 ?auto_2000058 ?auto_2000059 ?auto_2000060 ?auto_2000061 ?auto_2000062 ?auto_2000063 ?auto_2000064 ?auto_2000065 ?auto_2000066 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000246 - SURFACE
      ?auto_2000247 - SURFACE
      ?auto_2000248 - SURFACE
      ?auto_2000249 - SURFACE
      ?auto_2000250 - SURFACE
      ?auto_2000251 - SURFACE
      ?auto_2000252 - SURFACE
      ?auto_2000253 - SURFACE
      ?auto_2000254 - SURFACE
      ?auto_2000255 - SURFACE
      ?auto_2000256 - SURFACE
      ?auto_2000257 - SURFACE
      ?auto_2000258 - SURFACE
      ?auto_2000259 - SURFACE
      ?auto_2000260 - SURFACE
      ?auto_2000261 - SURFACE
    )
    :vars
    (
      ?auto_2000265 - HOIST
      ?auto_2000264 - PLACE
      ?auto_2000263 - TRUCK
      ?auto_2000262 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000265 ?auto_2000264 ) ( SURFACE-AT ?auto_2000260 ?auto_2000264 ) ( CLEAR ?auto_2000260 ) ( IS-CRATE ?auto_2000261 ) ( not ( = ?auto_2000260 ?auto_2000261 ) ) ( AVAILABLE ?auto_2000265 ) ( IN ?auto_2000261 ?auto_2000263 ) ( ON ?auto_2000260 ?auto_2000259 ) ( not ( = ?auto_2000259 ?auto_2000260 ) ) ( not ( = ?auto_2000259 ?auto_2000261 ) ) ( TRUCK-AT ?auto_2000263 ?auto_2000262 ) ( not ( = ?auto_2000262 ?auto_2000264 ) ) ( ON ?auto_2000247 ?auto_2000246 ) ( ON ?auto_2000248 ?auto_2000247 ) ( ON ?auto_2000249 ?auto_2000248 ) ( ON ?auto_2000250 ?auto_2000249 ) ( ON ?auto_2000251 ?auto_2000250 ) ( ON ?auto_2000252 ?auto_2000251 ) ( ON ?auto_2000253 ?auto_2000252 ) ( ON ?auto_2000254 ?auto_2000253 ) ( ON ?auto_2000255 ?auto_2000254 ) ( ON ?auto_2000256 ?auto_2000255 ) ( ON ?auto_2000257 ?auto_2000256 ) ( ON ?auto_2000258 ?auto_2000257 ) ( ON ?auto_2000259 ?auto_2000258 ) ( not ( = ?auto_2000246 ?auto_2000247 ) ) ( not ( = ?auto_2000246 ?auto_2000248 ) ) ( not ( = ?auto_2000246 ?auto_2000249 ) ) ( not ( = ?auto_2000246 ?auto_2000250 ) ) ( not ( = ?auto_2000246 ?auto_2000251 ) ) ( not ( = ?auto_2000246 ?auto_2000252 ) ) ( not ( = ?auto_2000246 ?auto_2000253 ) ) ( not ( = ?auto_2000246 ?auto_2000254 ) ) ( not ( = ?auto_2000246 ?auto_2000255 ) ) ( not ( = ?auto_2000246 ?auto_2000256 ) ) ( not ( = ?auto_2000246 ?auto_2000257 ) ) ( not ( = ?auto_2000246 ?auto_2000258 ) ) ( not ( = ?auto_2000246 ?auto_2000259 ) ) ( not ( = ?auto_2000246 ?auto_2000260 ) ) ( not ( = ?auto_2000246 ?auto_2000261 ) ) ( not ( = ?auto_2000247 ?auto_2000248 ) ) ( not ( = ?auto_2000247 ?auto_2000249 ) ) ( not ( = ?auto_2000247 ?auto_2000250 ) ) ( not ( = ?auto_2000247 ?auto_2000251 ) ) ( not ( = ?auto_2000247 ?auto_2000252 ) ) ( not ( = ?auto_2000247 ?auto_2000253 ) ) ( not ( = ?auto_2000247 ?auto_2000254 ) ) ( not ( = ?auto_2000247 ?auto_2000255 ) ) ( not ( = ?auto_2000247 ?auto_2000256 ) ) ( not ( = ?auto_2000247 ?auto_2000257 ) ) ( not ( = ?auto_2000247 ?auto_2000258 ) ) ( not ( = ?auto_2000247 ?auto_2000259 ) ) ( not ( = ?auto_2000247 ?auto_2000260 ) ) ( not ( = ?auto_2000247 ?auto_2000261 ) ) ( not ( = ?auto_2000248 ?auto_2000249 ) ) ( not ( = ?auto_2000248 ?auto_2000250 ) ) ( not ( = ?auto_2000248 ?auto_2000251 ) ) ( not ( = ?auto_2000248 ?auto_2000252 ) ) ( not ( = ?auto_2000248 ?auto_2000253 ) ) ( not ( = ?auto_2000248 ?auto_2000254 ) ) ( not ( = ?auto_2000248 ?auto_2000255 ) ) ( not ( = ?auto_2000248 ?auto_2000256 ) ) ( not ( = ?auto_2000248 ?auto_2000257 ) ) ( not ( = ?auto_2000248 ?auto_2000258 ) ) ( not ( = ?auto_2000248 ?auto_2000259 ) ) ( not ( = ?auto_2000248 ?auto_2000260 ) ) ( not ( = ?auto_2000248 ?auto_2000261 ) ) ( not ( = ?auto_2000249 ?auto_2000250 ) ) ( not ( = ?auto_2000249 ?auto_2000251 ) ) ( not ( = ?auto_2000249 ?auto_2000252 ) ) ( not ( = ?auto_2000249 ?auto_2000253 ) ) ( not ( = ?auto_2000249 ?auto_2000254 ) ) ( not ( = ?auto_2000249 ?auto_2000255 ) ) ( not ( = ?auto_2000249 ?auto_2000256 ) ) ( not ( = ?auto_2000249 ?auto_2000257 ) ) ( not ( = ?auto_2000249 ?auto_2000258 ) ) ( not ( = ?auto_2000249 ?auto_2000259 ) ) ( not ( = ?auto_2000249 ?auto_2000260 ) ) ( not ( = ?auto_2000249 ?auto_2000261 ) ) ( not ( = ?auto_2000250 ?auto_2000251 ) ) ( not ( = ?auto_2000250 ?auto_2000252 ) ) ( not ( = ?auto_2000250 ?auto_2000253 ) ) ( not ( = ?auto_2000250 ?auto_2000254 ) ) ( not ( = ?auto_2000250 ?auto_2000255 ) ) ( not ( = ?auto_2000250 ?auto_2000256 ) ) ( not ( = ?auto_2000250 ?auto_2000257 ) ) ( not ( = ?auto_2000250 ?auto_2000258 ) ) ( not ( = ?auto_2000250 ?auto_2000259 ) ) ( not ( = ?auto_2000250 ?auto_2000260 ) ) ( not ( = ?auto_2000250 ?auto_2000261 ) ) ( not ( = ?auto_2000251 ?auto_2000252 ) ) ( not ( = ?auto_2000251 ?auto_2000253 ) ) ( not ( = ?auto_2000251 ?auto_2000254 ) ) ( not ( = ?auto_2000251 ?auto_2000255 ) ) ( not ( = ?auto_2000251 ?auto_2000256 ) ) ( not ( = ?auto_2000251 ?auto_2000257 ) ) ( not ( = ?auto_2000251 ?auto_2000258 ) ) ( not ( = ?auto_2000251 ?auto_2000259 ) ) ( not ( = ?auto_2000251 ?auto_2000260 ) ) ( not ( = ?auto_2000251 ?auto_2000261 ) ) ( not ( = ?auto_2000252 ?auto_2000253 ) ) ( not ( = ?auto_2000252 ?auto_2000254 ) ) ( not ( = ?auto_2000252 ?auto_2000255 ) ) ( not ( = ?auto_2000252 ?auto_2000256 ) ) ( not ( = ?auto_2000252 ?auto_2000257 ) ) ( not ( = ?auto_2000252 ?auto_2000258 ) ) ( not ( = ?auto_2000252 ?auto_2000259 ) ) ( not ( = ?auto_2000252 ?auto_2000260 ) ) ( not ( = ?auto_2000252 ?auto_2000261 ) ) ( not ( = ?auto_2000253 ?auto_2000254 ) ) ( not ( = ?auto_2000253 ?auto_2000255 ) ) ( not ( = ?auto_2000253 ?auto_2000256 ) ) ( not ( = ?auto_2000253 ?auto_2000257 ) ) ( not ( = ?auto_2000253 ?auto_2000258 ) ) ( not ( = ?auto_2000253 ?auto_2000259 ) ) ( not ( = ?auto_2000253 ?auto_2000260 ) ) ( not ( = ?auto_2000253 ?auto_2000261 ) ) ( not ( = ?auto_2000254 ?auto_2000255 ) ) ( not ( = ?auto_2000254 ?auto_2000256 ) ) ( not ( = ?auto_2000254 ?auto_2000257 ) ) ( not ( = ?auto_2000254 ?auto_2000258 ) ) ( not ( = ?auto_2000254 ?auto_2000259 ) ) ( not ( = ?auto_2000254 ?auto_2000260 ) ) ( not ( = ?auto_2000254 ?auto_2000261 ) ) ( not ( = ?auto_2000255 ?auto_2000256 ) ) ( not ( = ?auto_2000255 ?auto_2000257 ) ) ( not ( = ?auto_2000255 ?auto_2000258 ) ) ( not ( = ?auto_2000255 ?auto_2000259 ) ) ( not ( = ?auto_2000255 ?auto_2000260 ) ) ( not ( = ?auto_2000255 ?auto_2000261 ) ) ( not ( = ?auto_2000256 ?auto_2000257 ) ) ( not ( = ?auto_2000256 ?auto_2000258 ) ) ( not ( = ?auto_2000256 ?auto_2000259 ) ) ( not ( = ?auto_2000256 ?auto_2000260 ) ) ( not ( = ?auto_2000256 ?auto_2000261 ) ) ( not ( = ?auto_2000257 ?auto_2000258 ) ) ( not ( = ?auto_2000257 ?auto_2000259 ) ) ( not ( = ?auto_2000257 ?auto_2000260 ) ) ( not ( = ?auto_2000257 ?auto_2000261 ) ) ( not ( = ?auto_2000258 ?auto_2000259 ) ) ( not ( = ?auto_2000258 ?auto_2000260 ) ) ( not ( = ?auto_2000258 ?auto_2000261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000259 ?auto_2000260 ?auto_2000261 )
      ( MAKE-15CRATE-VERIFY ?auto_2000246 ?auto_2000247 ?auto_2000248 ?auto_2000249 ?auto_2000250 ?auto_2000251 ?auto_2000252 ?auto_2000253 ?auto_2000254 ?auto_2000255 ?auto_2000256 ?auto_2000257 ?auto_2000258 ?auto_2000259 ?auto_2000260 ?auto_2000261 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000456 - SURFACE
      ?auto_2000457 - SURFACE
      ?auto_2000458 - SURFACE
      ?auto_2000459 - SURFACE
      ?auto_2000460 - SURFACE
      ?auto_2000461 - SURFACE
      ?auto_2000462 - SURFACE
      ?auto_2000463 - SURFACE
      ?auto_2000464 - SURFACE
      ?auto_2000465 - SURFACE
      ?auto_2000466 - SURFACE
      ?auto_2000467 - SURFACE
      ?auto_2000468 - SURFACE
      ?auto_2000469 - SURFACE
      ?auto_2000470 - SURFACE
      ?auto_2000471 - SURFACE
    )
    :vars
    (
      ?auto_2000474 - HOIST
      ?auto_2000472 - PLACE
      ?auto_2000475 - TRUCK
      ?auto_2000473 - PLACE
      ?auto_2000476 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000474 ?auto_2000472 ) ( SURFACE-AT ?auto_2000470 ?auto_2000472 ) ( CLEAR ?auto_2000470 ) ( IS-CRATE ?auto_2000471 ) ( not ( = ?auto_2000470 ?auto_2000471 ) ) ( AVAILABLE ?auto_2000474 ) ( ON ?auto_2000470 ?auto_2000469 ) ( not ( = ?auto_2000469 ?auto_2000470 ) ) ( not ( = ?auto_2000469 ?auto_2000471 ) ) ( TRUCK-AT ?auto_2000475 ?auto_2000473 ) ( not ( = ?auto_2000473 ?auto_2000472 ) ) ( HOIST-AT ?auto_2000476 ?auto_2000473 ) ( LIFTING ?auto_2000476 ?auto_2000471 ) ( not ( = ?auto_2000474 ?auto_2000476 ) ) ( ON ?auto_2000457 ?auto_2000456 ) ( ON ?auto_2000458 ?auto_2000457 ) ( ON ?auto_2000459 ?auto_2000458 ) ( ON ?auto_2000460 ?auto_2000459 ) ( ON ?auto_2000461 ?auto_2000460 ) ( ON ?auto_2000462 ?auto_2000461 ) ( ON ?auto_2000463 ?auto_2000462 ) ( ON ?auto_2000464 ?auto_2000463 ) ( ON ?auto_2000465 ?auto_2000464 ) ( ON ?auto_2000466 ?auto_2000465 ) ( ON ?auto_2000467 ?auto_2000466 ) ( ON ?auto_2000468 ?auto_2000467 ) ( ON ?auto_2000469 ?auto_2000468 ) ( not ( = ?auto_2000456 ?auto_2000457 ) ) ( not ( = ?auto_2000456 ?auto_2000458 ) ) ( not ( = ?auto_2000456 ?auto_2000459 ) ) ( not ( = ?auto_2000456 ?auto_2000460 ) ) ( not ( = ?auto_2000456 ?auto_2000461 ) ) ( not ( = ?auto_2000456 ?auto_2000462 ) ) ( not ( = ?auto_2000456 ?auto_2000463 ) ) ( not ( = ?auto_2000456 ?auto_2000464 ) ) ( not ( = ?auto_2000456 ?auto_2000465 ) ) ( not ( = ?auto_2000456 ?auto_2000466 ) ) ( not ( = ?auto_2000456 ?auto_2000467 ) ) ( not ( = ?auto_2000456 ?auto_2000468 ) ) ( not ( = ?auto_2000456 ?auto_2000469 ) ) ( not ( = ?auto_2000456 ?auto_2000470 ) ) ( not ( = ?auto_2000456 ?auto_2000471 ) ) ( not ( = ?auto_2000457 ?auto_2000458 ) ) ( not ( = ?auto_2000457 ?auto_2000459 ) ) ( not ( = ?auto_2000457 ?auto_2000460 ) ) ( not ( = ?auto_2000457 ?auto_2000461 ) ) ( not ( = ?auto_2000457 ?auto_2000462 ) ) ( not ( = ?auto_2000457 ?auto_2000463 ) ) ( not ( = ?auto_2000457 ?auto_2000464 ) ) ( not ( = ?auto_2000457 ?auto_2000465 ) ) ( not ( = ?auto_2000457 ?auto_2000466 ) ) ( not ( = ?auto_2000457 ?auto_2000467 ) ) ( not ( = ?auto_2000457 ?auto_2000468 ) ) ( not ( = ?auto_2000457 ?auto_2000469 ) ) ( not ( = ?auto_2000457 ?auto_2000470 ) ) ( not ( = ?auto_2000457 ?auto_2000471 ) ) ( not ( = ?auto_2000458 ?auto_2000459 ) ) ( not ( = ?auto_2000458 ?auto_2000460 ) ) ( not ( = ?auto_2000458 ?auto_2000461 ) ) ( not ( = ?auto_2000458 ?auto_2000462 ) ) ( not ( = ?auto_2000458 ?auto_2000463 ) ) ( not ( = ?auto_2000458 ?auto_2000464 ) ) ( not ( = ?auto_2000458 ?auto_2000465 ) ) ( not ( = ?auto_2000458 ?auto_2000466 ) ) ( not ( = ?auto_2000458 ?auto_2000467 ) ) ( not ( = ?auto_2000458 ?auto_2000468 ) ) ( not ( = ?auto_2000458 ?auto_2000469 ) ) ( not ( = ?auto_2000458 ?auto_2000470 ) ) ( not ( = ?auto_2000458 ?auto_2000471 ) ) ( not ( = ?auto_2000459 ?auto_2000460 ) ) ( not ( = ?auto_2000459 ?auto_2000461 ) ) ( not ( = ?auto_2000459 ?auto_2000462 ) ) ( not ( = ?auto_2000459 ?auto_2000463 ) ) ( not ( = ?auto_2000459 ?auto_2000464 ) ) ( not ( = ?auto_2000459 ?auto_2000465 ) ) ( not ( = ?auto_2000459 ?auto_2000466 ) ) ( not ( = ?auto_2000459 ?auto_2000467 ) ) ( not ( = ?auto_2000459 ?auto_2000468 ) ) ( not ( = ?auto_2000459 ?auto_2000469 ) ) ( not ( = ?auto_2000459 ?auto_2000470 ) ) ( not ( = ?auto_2000459 ?auto_2000471 ) ) ( not ( = ?auto_2000460 ?auto_2000461 ) ) ( not ( = ?auto_2000460 ?auto_2000462 ) ) ( not ( = ?auto_2000460 ?auto_2000463 ) ) ( not ( = ?auto_2000460 ?auto_2000464 ) ) ( not ( = ?auto_2000460 ?auto_2000465 ) ) ( not ( = ?auto_2000460 ?auto_2000466 ) ) ( not ( = ?auto_2000460 ?auto_2000467 ) ) ( not ( = ?auto_2000460 ?auto_2000468 ) ) ( not ( = ?auto_2000460 ?auto_2000469 ) ) ( not ( = ?auto_2000460 ?auto_2000470 ) ) ( not ( = ?auto_2000460 ?auto_2000471 ) ) ( not ( = ?auto_2000461 ?auto_2000462 ) ) ( not ( = ?auto_2000461 ?auto_2000463 ) ) ( not ( = ?auto_2000461 ?auto_2000464 ) ) ( not ( = ?auto_2000461 ?auto_2000465 ) ) ( not ( = ?auto_2000461 ?auto_2000466 ) ) ( not ( = ?auto_2000461 ?auto_2000467 ) ) ( not ( = ?auto_2000461 ?auto_2000468 ) ) ( not ( = ?auto_2000461 ?auto_2000469 ) ) ( not ( = ?auto_2000461 ?auto_2000470 ) ) ( not ( = ?auto_2000461 ?auto_2000471 ) ) ( not ( = ?auto_2000462 ?auto_2000463 ) ) ( not ( = ?auto_2000462 ?auto_2000464 ) ) ( not ( = ?auto_2000462 ?auto_2000465 ) ) ( not ( = ?auto_2000462 ?auto_2000466 ) ) ( not ( = ?auto_2000462 ?auto_2000467 ) ) ( not ( = ?auto_2000462 ?auto_2000468 ) ) ( not ( = ?auto_2000462 ?auto_2000469 ) ) ( not ( = ?auto_2000462 ?auto_2000470 ) ) ( not ( = ?auto_2000462 ?auto_2000471 ) ) ( not ( = ?auto_2000463 ?auto_2000464 ) ) ( not ( = ?auto_2000463 ?auto_2000465 ) ) ( not ( = ?auto_2000463 ?auto_2000466 ) ) ( not ( = ?auto_2000463 ?auto_2000467 ) ) ( not ( = ?auto_2000463 ?auto_2000468 ) ) ( not ( = ?auto_2000463 ?auto_2000469 ) ) ( not ( = ?auto_2000463 ?auto_2000470 ) ) ( not ( = ?auto_2000463 ?auto_2000471 ) ) ( not ( = ?auto_2000464 ?auto_2000465 ) ) ( not ( = ?auto_2000464 ?auto_2000466 ) ) ( not ( = ?auto_2000464 ?auto_2000467 ) ) ( not ( = ?auto_2000464 ?auto_2000468 ) ) ( not ( = ?auto_2000464 ?auto_2000469 ) ) ( not ( = ?auto_2000464 ?auto_2000470 ) ) ( not ( = ?auto_2000464 ?auto_2000471 ) ) ( not ( = ?auto_2000465 ?auto_2000466 ) ) ( not ( = ?auto_2000465 ?auto_2000467 ) ) ( not ( = ?auto_2000465 ?auto_2000468 ) ) ( not ( = ?auto_2000465 ?auto_2000469 ) ) ( not ( = ?auto_2000465 ?auto_2000470 ) ) ( not ( = ?auto_2000465 ?auto_2000471 ) ) ( not ( = ?auto_2000466 ?auto_2000467 ) ) ( not ( = ?auto_2000466 ?auto_2000468 ) ) ( not ( = ?auto_2000466 ?auto_2000469 ) ) ( not ( = ?auto_2000466 ?auto_2000470 ) ) ( not ( = ?auto_2000466 ?auto_2000471 ) ) ( not ( = ?auto_2000467 ?auto_2000468 ) ) ( not ( = ?auto_2000467 ?auto_2000469 ) ) ( not ( = ?auto_2000467 ?auto_2000470 ) ) ( not ( = ?auto_2000467 ?auto_2000471 ) ) ( not ( = ?auto_2000468 ?auto_2000469 ) ) ( not ( = ?auto_2000468 ?auto_2000470 ) ) ( not ( = ?auto_2000468 ?auto_2000471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000469 ?auto_2000470 ?auto_2000471 )
      ( MAKE-15CRATE-VERIFY ?auto_2000456 ?auto_2000457 ?auto_2000458 ?auto_2000459 ?auto_2000460 ?auto_2000461 ?auto_2000462 ?auto_2000463 ?auto_2000464 ?auto_2000465 ?auto_2000466 ?auto_2000467 ?auto_2000468 ?auto_2000469 ?auto_2000470 ?auto_2000471 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000681 - SURFACE
      ?auto_2000682 - SURFACE
      ?auto_2000683 - SURFACE
      ?auto_2000684 - SURFACE
      ?auto_2000685 - SURFACE
      ?auto_2000686 - SURFACE
      ?auto_2000687 - SURFACE
      ?auto_2000688 - SURFACE
      ?auto_2000689 - SURFACE
      ?auto_2000690 - SURFACE
      ?auto_2000691 - SURFACE
      ?auto_2000692 - SURFACE
      ?auto_2000693 - SURFACE
      ?auto_2000694 - SURFACE
      ?auto_2000695 - SURFACE
      ?auto_2000696 - SURFACE
    )
    :vars
    (
      ?auto_2000697 - HOIST
      ?auto_2000700 - PLACE
      ?auto_2000699 - TRUCK
      ?auto_2000698 - PLACE
      ?auto_2000702 - HOIST
      ?auto_2000701 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000697 ?auto_2000700 ) ( SURFACE-AT ?auto_2000695 ?auto_2000700 ) ( CLEAR ?auto_2000695 ) ( IS-CRATE ?auto_2000696 ) ( not ( = ?auto_2000695 ?auto_2000696 ) ) ( AVAILABLE ?auto_2000697 ) ( ON ?auto_2000695 ?auto_2000694 ) ( not ( = ?auto_2000694 ?auto_2000695 ) ) ( not ( = ?auto_2000694 ?auto_2000696 ) ) ( TRUCK-AT ?auto_2000699 ?auto_2000698 ) ( not ( = ?auto_2000698 ?auto_2000700 ) ) ( HOIST-AT ?auto_2000702 ?auto_2000698 ) ( not ( = ?auto_2000697 ?auto_2000702 ) ) ( AVAILABLE ?auto_2000702 ) ( SURFACE-AT ?auto_2000696 ?auto_2000698 ) ( ON ?auto_2000696 ?auto_2000701 ) ( CLEAR ?auto_2000696 ) ( not ( = ?auto_2000695 ?auto_2000701 ) ) ( not ( = ?auto_2000696 ?auto_2000701 ) ) ( not ( = ?auto_2000694 ?auto_2000701 ) ) ( ON ?auto_2000682 ?auto_2000681 ) ( ON ?auto_2000683 ?auto_2000682 ) ( ON ?auto_2000684 ?auto_2000683 ) ( ON ?auto_2000685 ?auto_2000684 ) ( ON ?auto_2000686 ?auto_2000685 ) ( ON ?auto_2000687 ?auto_2000686 ) ( ON ?auto_2000688 ?auto_2000687 ) ( ON ?auto_2000689 ?auto_2000688 ) ( ON ?auto_2000690 ?auto_2000689 ) ( ON ?auto_2000691 ?auto_2000690 ) ( ON ?auto_2000692 ?auto_2000691 ) ( ON ?auto_2000693 ?auto_2000692 ) ( ON ?auto_2000694 ?auto_2000693 ) ( not ( = ?auto_2000681 ?auto_2000682 ) ) ( not ( = ?auto_2000681 ?auto_2000683 ) ) ( not ( = ?auto_2000681 ?auto_2000684 ) ) ( not ( = ?auto_2000681 ?auto_2000685 ) ) ( not ( = ?auto_2000681 ?auto_2000686 ) ) ( not ( = ?auto_2000681 ?auto_2000687 ) ) ( not ( = ?auto_2000681 ?auto_2000688 ) ) ( not ( = ?auto_2000681 ?auto_2000689 ) ) ( not ( = ?auto_2000681 ?auto_2000690 ) ) ( not ( = ?auto_2000681 ?auto_2000691 ) ) ( not ( = ?auto_2000681 ?auto_2000692 ) ) ( not ( = ?auto_2000681 ?auto_2000693 ) ) ( not ( = ?auto_2000681 ?auto_2000694 ) ) ( not ( = ?auto_2000681 ?auto_2000695 ) ) ( not ( = ?auto_2000681 ?auto_2000696 ) ) ( not ( = ?auto_2000681 ?auto_2000701 ) ) ( not ( = ?auto_2000682 ?auto_2000683 ) ) ( not ( = ?auto_2000682 ?auto_2000684 ) ) ( not ( = ?auto_2000682 ?auto_2000685 ) ) ( not ( = ?auto_2000682 ?auto_2000686 ) ) ( not ( = ?auto_2000682 ?auto_2000687 ) ) ( not ( = ?auto_2000682 ?auto_2000688 ) ) ( not ( = ?auto_2000682 ?auto_2000689 ) ) ( not ( = ?auto_2000682 ?auto_2000690 ) ) ( not ( = ?auto_2000682 ?auto_2000691 ) ) ( not ( = ?auto_2000682 ?auto_2000692 ) ) ( not ( = ?auto_2000682 ?auto_2000693 ) ) ( not ( = ?auto_2000682 ?auto_2000694 ) ) ( not ( = ?auto_2000682 ?auto_2000695 ) ) ( not ( = ?auto_2000682 ?auto_2000696 ) ) ( not ( = ?auto_2000682 ?auto_2000701 ) ) ( not ( = ?auto_2000683 ?auto_2000684 ) ) ( not ( = ?auto_2000683 ?auto_2000685 ) ) ( not ( = ?auto_2000683 ?auto_2000686 ) ) ( not ( = ?auto_2000683 ?auto_2000687 ) ) ( not ( = ?auto_2000683 ?auto_2000688 ) ) ( not ( = ?auto_2000683 ?auto_2000689 ) ) ( not ( = ?auto_2000683 ?auto_2000690 ) ) ( not ( = ?auto_2000683 ?auto_2000691 ) ) ( not ( = ?auto_2000683 ?auto_2000692 ) ) ( not ( = ?auto_2000683 ?auto_2000693 ) ) ( not ( = ?auto_2000683 ?auto_2000694 ) ) ( not ( = ?auto_2000683 ?auto_2000695 ) ) ( not ( = ?auto_2000683 ?auto_2000696 ) ) ( not ( = ?auto_2000683 ?auto_2000701 ) ) ( not ( = ?auto_2000684 ?auto_2000685 ) ) ( not ( = ?auto_2000684 ?auto_2000686 ) ) ( not ( = ?auto_2000684 ?auto_2000687 ) ) ( not ( = ?auto_2000684 ?auto_2000688 ) ) ( not ( = ?auto_2000684 ?auto_2000689 ) ) ( not ( = ?auto_2000684 ?auto_2000690 ) ) ( not ( = ?auto_2000684 ?auto_2000691 ) ) ( not ( = ?auto_2000684 ?auto_2000692 ) ) ( not ( = ?auto_2000684 ?auto_2000693 ) ) ( not ( = ?auto_2000684 ?auto_2000694 ) ) ( not ( = ?auto_2000684 ?auto_2000695 ) ) ( not ( = ?auto_2000684 ?auto_2000696 ) ) ( not ( = ?auto_2000684 ?auto_2000701 ) ) ( not ( = ?auto_2000685 ?auto_2000686 ) ) ( not ( = ?auto_2000685 ?auto_2000687 ) ) ( not ( = ?auto_2000685 ?auto_2000688 ) ) ( not ( = ?auto_2000685 ?auto_2000689 ) ) ( not ( = ?auto_2000685 ?auto_2000690 ) ) ( not ( = ?auto_2000685 ?auto_2000691 ) ) ( not ( = ?auto_2000685 ?auto_2000692 ) ) ( not ( = ?auto_2000685 ?auto_2000693 ) ) ( not ( = ?auto_2000685 ?auto_2000694 ) ) ( not ( = ?auto_2000685 ?auto_2000695 ) ) ( not ( = ?auto_2000685 ?auto_2000696 ) ) ( not ( = ?auto_2000685 ?auto_2000701 ) ) ( not ( = ?auto_2000686 ?auto_2000687 ) ) ( not ( = ?auto_2000686 ?auto_2000688 ) ) ( not ( = ?auto_2000686 ?auto_2000689 ) ) ( not ( = ?auto_2000686 ?auto_2000690 ) ) ( not ( = ?auto_2000686 ?auto_2000691 ) ) ( not ( = ?auto_2000686 ?auto_2000692 ) ) ( not ( = ?auto_2000686 ?auto_2000693 ) ) ( not ( = ?auto_2000686 ?auto_2000694 ) ) ( not ( = ?auto_2000686 ?auto_2000695 ) ) ( not ( = ?auto_2000686 ?auto_2000696 ) ) ( not ( = ?auto_2000686 ?auto_2000701 ) ) ( not ( = ?auto_2000687 ?auto_2000688 ) ) ( not ( = ?auto_2000687 ?auto_2000689 ) ) ( not ( = ?auto_2000687 ?auto_2000690 ) ) ( not ( = ?auto_2000687 ?auto_2000691 ) ) ( not ( = ?auto_2000687 ?auto_2000692 ) ) ( not ( = ?auto_2000687 ?auto_2000693 ) ) ( not ( = ?auto_2000687 ?auto_2000694 ) ) ( not ( = ?auto_2000687 ?auto_2000695 ) ) ( not ( = ?auto_2000687 ?auto_2000696 ) ) ( not ( = ?auto_2000687 ?auto_2000701 ) ) ( not ( = ?auto_2000688 ?auto_2000689 ) ) ( not ( = ?auto_2000688 ?auto_2000690 ) ) ( not ( = ?auto_2000688 ?auto_2000691 ) ) ( not ( = ?auto_2000688 ?auto_2000692 ) ) ( not ( = ?auto_2000688 ?auto_2000693 ) ) ( not ( = ?auto_2000688 ?auto_2000694 ) ) ( not ( = ?auto_2000688 ?auto_2000695 ) ) ( not ( = ?auto_2000688 ?auto_2000696 ) ) ( not ( = ?auto_2000688 ?auto_2000701 ) ) ( not ( = ?auto_2000689 ?auto_2000690 ) ) ( not ( = ?auto_2000689 ?auto_2000691 ) ) ( not ( = ?auto_2000689 ?auto_2000692 ) ) ( not ( = ?auto_2000689 ?auto_2000693 ) ) ( not ( = ?auto_2000689 ?auto_2000694 ) ) ( not ( = ?auto_2000689 ?auto_2000695 ) ) ( not ( = ?auto_2000689 ?auto_2000696 ) ) ( not ( = ?auto_2000689 ?auto_2000701 ) ) ( not ( = ?auto_2000690 ?auto_2000691 ) ) ( not ( = ?auto_2000690 ?auto_2000692 ) ) ( not ( = ?auto_2000690 ?auto_2000693 ) ) ( not ( = ?auto_2000690 ?auto_2000694 ) ) ( not ( = ?auto_2000690 ?auto_2000695 ) ) ( not ( = ?auto_2000690 ?auto_2000696 ) ) ( not ( = ?auto_2000690 ?auto_2000701 ) ) ( not ( = ?auto_2000691 ?auto_2000692 ) ) ( not ( = ?auto_2000691 ?auto_2000693 ) ) ( not ( = ?auto_2000691 ?auto_2000694 ) ) ( not ( = ?auto_2000691 ?auto_2000695 ) ) ( not ( = ?auto_2000691 ?auto_2000696 ) ) ( not ( = ?auto_2000691 ?auto_2000701 ) ) ( not ( = ?auto_2000692 ?auto_2000693 ) ) ( not ( = ?auto_2000692 ?auto_2000694 ) ) ( not ( = ?auto_2000692 ?auto_2000695 ) ) ( not ( = ?auto_2000692 ?auto_2000696 ) ) ( not ( = ?auto_2000692 ?auto_2000701 ) ) ( not ( = ?auto_2000693 ?auto_2000694 ) ) ( not ( = ?auto_2000693 ?auto_2000695 ) ) ( not ( = ?auto_2000693 ?auto_2000696 ) ) ( not ( = ?auto_2000693 ?auto_2000701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000694 ?auto_2000695 ?auto_2000696 )
      ( MAKE-15CRATE-VERIFY ?auto_2000681 ?auto_2000682 ?auto_2000683 ?auto_2000684 ?auto_2000685 ?auto_2000686 ?auto_2000687 ?auto_2000688 ?auto_2000689 ?auto_2000690 ?auto_2000691 ?auto_2000692 ?auto_2000693 ?auto_2000694 ?auto_2000695 ?auto_2000696 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000907 - SURFACE
      ?auto_2000908 - SURFACE
      ?auto_2000909 - SURFACE
      ?auto_2000910 - SURFACE
      ?auto_2000911 - SURFACE
      ?auto_2000912 - SURFACE
      ?auto_2000913 - SURFACE
      ?auto_2000914 - SURFACE
      ?auto_2000915 - SURFACE
      ?auto_2000916 - SURFACE
      ?auto_2000917 - SURFACE
      ?auto_2000918 - SURFACE
      ?auto_2000919 - SURFACE
      ?auto_2000920 - SURFACE
      ?auto_2000921 - SURFACE
      ?auto_2000922 - SURFACE
    )
    :vars
    (
      ?auto_2000923 - HOIST
      ?auto_2000928 - PLACE
      ?auto_2000927 - PLACE
      ?auto_2000926 - HOIST
      ?auto_2000924 - SURFACE
      ?auto_2000925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000923 ?auto_2000928 ) ( SURFACE-AT ?auto_2000921 ?auto_2000928 ) ( CLEAR ?auto_2000921 ) ( IS-CRATE ?auto_2000922 ) ( not ( = ?auto_2000921 ?auto_2000922 ) ) ( AVAILABLE ?auto_2000923 ) ( ON ?auto_2000921 ?auto_2000920 ) ( not ( = ?auto_2000920 ?auto_2000921 ) ) ( not ( = ?auto_2000920 ?auto_2000922 ) ) ( not ( = ?auto_2000927 ?auto_2000928 ) ) ( HOIST-AT ?auto_2000926 ?auto_2000927 ) ( not ( = ?auto_2000923 ?auto_2000926 ) ) ( AVAILABLE ?auto_2000926 ) ( SURFACE-AT ?auto_2000922 ?auto_2000927 ) ( ON ?auto_2000922 ?auto_2000924 ) ( CLEAR ?auto_2000922 ) ( not ( = ?auto_2000921 ?auto_2000924 ) ) ( not ( = ?auto_2000922 ?auto_2000924 ) ) ( not ( = ?auto_2000920 ?auto_2000924 ) ) ( TRUCK-AT ?auto_2000925 ?auto_2000928 ) ( ON ?auto_2000908 ?auto_2000907 ) ( ON ?auto_2000909 ?auto_2000908 ) ( ON ?auto_2000910 ?auto_2000909 ) ( ON ?auto_2000911 ?auto_2000910 ) ( ON ?auto_2000912 ?auto_2000911 ) ( ON ?auto_2000913 ?auto_2000912 ) ( ON ?auto_2000914 ?auto_2000913 ) ( ON ?auto_2000915 ?auto_2000914 ) ( ON ?auto_2000916 ?auto_2000915 ) ( ON ?auto_2000917 ?auto_2000916 ) ( ON ?auto_2000918 ?auto_2000917 ) ( ON ?auto_2000919 ?auto_2000918 ) ( ON ?auto_2000920 ?auto_2000919 ) ( not ( = ?auto_2000907 ?auto_2000908 ) ) ( not ( = ?auto_2000907 ?auto_2000909 ) ) ( not ( = ?auto_2000907 ?auto_2000910 ) ) ( not ( = ?auto_2000907 ?auto_2000911 ) ) ( not ( = ?auto_2000907 ?auto_2000912 ) ) ( not ( = ?auto_2000907 ?auto_2000913 ) ) ( not ( = ?auto_2000907 ?auto_2000914 ) ) ( not ( = ?auto_2000907 ?auto_2000915 ) ) ( not ( = ?auto_2000907 ?auto_2000916 ) ) ( not ( = ?auto_2000907 ?auto_2000917 ) ) ( not ( = ?auto_2000907 ?auto_2000918 ) ) ( not ( = ?auto_2000907 ?auto_2000919 ) ) ( not ( = ?auto_2000907 ?auto_2000920 ) ) ( not ( = ?auto_2000907 ?auto_2000921 ) ) ( not ( = ?auto_2000907 ?auto_2000922 ) ) ( not ( = ?auto_2000907 ?auto_2000924 ) ) ( not ( = ?auto_2000908 ?auto_2000909 ) ) ( not ( = ?auto_2000908 ?auto_2000910 ) ) ( not ( = ?auto_2000908 ?auto_2000911 ) ) ( not ( = ?auto_2000908 ?auto_2000912 ) ) ( not ( = ?auto_2000908 ?auto_2000913 ) ) ( not ( = ?auto_2000908 ?auto_2000914 ) ) ( not ( = ?auto_2000908 ?auto_2000915 ) ) ( not ( = ?auto_2000908 ?auto_2000916 ) ) ( not ( = ?auto_2000908 ?auto_2000917 ) ) ( not ( = ?auto_2000908 ?auto_2000918 ) ) ( not ( = ?auto_2000908 ?auto_2000919 ) ) ( not ( = ?auto_2000908 ?auto_2000920 ) ) ( not ( = ?auto_2000908 ?auto_2000921 ) ) ( not ( = ?auto_2000908 ?auto_2000922 ) ) ( not ( = ?auto_2000908 ?auto_2000924 ) ) ( not ( = ?auto_2000909 ?auto_2000910 ) ) ( not ( = ?auto_2000909 ?auto_2000911 ) ) ( not ( = ?auto_2000909 ?auto_2000912 ) ) ( not ( = ?auto_2000909 ?auto_2000913 ) ) ( not ( = ?auto_2000909 ?auto_2000914 ) ) ( not ( = ?auto_2000909 ?auto_2000915 ) ) ( not ( = ?auto_2000909 ?auto_2000916 ) ) ( not ( = ?auto_2000909 ?auto_2000917 ) ) ( not ( = ?auto_2000909 ?auto_2000918 ) ) ( not ( = ?auto_2000909 ?auto_2000919 ) ) ( not ( = ?auto_2000909 ?auto_2000920 ) ) ( not ( = ?auto_2000909 ?auto_2000921 ) ) ( not ( = ?auto_2000909 ?auto_2000922 ) ) ( not ( = ?auto_2000909 ?auto_2000924 ) ) ( not ( = ?auto_2000910 ?auto_2000911 ) ) ( not ( = ?auto_2000910 ?auto_2000912 ) ) ( not ( = ?auto_2000910 ?auto_2000913 ) ) ( not ( = ?auto_2000910 ?auto_2000914 ) ) ( not ( = ?auto_2000910 ?auto_2000915 ) ) ( not ( = ?auto_2000910 ?auto_2000916 ) ) ( not ( = ?auto_2000910 ?auto_2000917 ) ) ( not ( = ?auto_2000910 ?auto_2000918 ) ) ( not ( = ?auto_2000910 ?auto_2000919 ) ) ( not ( = ?auto_2000910 ?auto_2000920 ) ) ( not ( = ?auto_2000910 ?auto_2000921 ) ) ( not ( = ?auto_2000910 ?auto_2000922 ) ) ( not ( = ?auto_2000910 ?auto_2000924 ) ) ( not ( = ?auto_2000911 ?auto_2000912 ) ) ( not ( = ?auto_2000911 ?auto_2000913 ) ) ( not ( = ?auto_2000911 ?auto_2000914 ) ) ( not ( = ?auto_2000911 ?auto_2000915 ) ) ( not ( = ?auto_2000911 ?auto_2000916 ) ) ( not ( = ?auto_2000911 ?auto_2000917 ) ) ( not ( = ?auto_2000911 ?auto_2000918 ) ) ( not ( = ?auto_2000911 ?auto_2000919 ) ) ( not ( = ?auto_2000911 ?auto_2000920 ) ) ( not ( = ?auto_2000911 ?auto_2000921 ) ) ( not ( = ?auto_2000911 ?auto_2000922 ) ) ( not ( = ?auto_2000911 ?auto_2000924 ) ) ( not ( = ?auto_2000912 ?auto_2000913 ) ) ( not ( = ?auto_2000912 ?auto_2000914 ) ) ( not ( = ?auto_2000912 ?auto_2000915 ) ) ( not ( = ?auto_2000912 ?auto_2000916 ) ) ( not ( = ?auto_2000912 ?auto_2000917 ) ) ( not ( = ?auto_2000912 ?auto_2000918 ) ) ( not ( = ?auto_2000912 ?auto_2000919 ) ) ( not ( = ?auto_2000912 ?auto_2000920 ) ) ( not ( = ?auto_2000912 ?auto_2000921 ) ) ( not ( = ?auto_2000912 ?auto_2000922 ) ) ( not ( = ?auto_2000912 ?auto_2000924 ) ) ( not ( = ?auto_2000913 ?auto_2000914 ) ) ( not ( = ?auto_2000913 ?auto_2000915 ) ) ( not ( = ?auto_2000913 ?auto_2000916 ) ) ( not ( = ?auto_2000913 ?auto_2000917 ) ) ( not ( = ?auto_2000913 ?auto_2000918 ) ) ( not ( = ?auto_2000913 ?auto_2000919 ) ) ( not ( = ?auto_2000913 ?auto_2000920 ) ) ( not ( = ?auto_2000913 ?auto_2000921 ) ) ( not ( = ?auto_2000913 ?auto_2000922 ) ) ( not ( = ?auto_2000913 ?auto_2000924 ) ) ( not ( = ?auto_2000914 ?auto_2000915 ) ) ( not ( = ?auto_2000914 ?auto_2000916 ) ) ( not ( = ?auto_2000914 ?auto_2000917 ) ) ( not ( = ?auto_2000914 ?auto_2000918 ) ) ( not ( = ?auto_2000914 ?auto_2000919 ) ) ( not ( = ?auto_2000914 ?auto_2000920 ) ) ( not ( = ?auto_2000914 ?auto_2000921 ) ) ( not ( = ?auto_2000914 ?auto_2000922 ) ) ( not ( = ?auto_2000914 ?auto_2000924 ) ) ( not ( = ?auto_2000915 ?auto_2000916 ) ) ( not ( = ?auto_2000915 ?auto_2000917 ) ) ( not ( = ?auto_2000915 ?auto_2000918 ) ) ( not ( = ?auto_2000915 ?auto_2000919 ) ) ( not ( = ?auto_2000915 ?auto_2000920 ) ) ( not ( = ?auto_2000915 ?auto_2000921 ) ) ( not ( = ?auto_2000915 ?auto_2000922 ) ) ( not ( = ?auto_2000915 ?auto_2000924 ) ) ( not ( = ?auto_2000916 ?auto_2000917 ) ) ( not ( = ?auto_2000916 ?auto_2000918 ) ) ( not ( = ?auto_2000916 ?auto_2000919 ) ) ( not ( = ?auto_2000916 ?auto_2000920 ) ) ( not ( = ?auto_2000916 ?auto_2000921 ) ) ( not ( = ?auto_2000916 ?auto_2000922 ) ) ( not ( = ?auto_2000916 ?auto_2000924 ) ) ( not ( = ?auto_2000917 ?auto_2000918 ) ) ( not ( = ?auto_2000917 ?auto_2000919 ) ) ( not ( = ?auto_2000917 ?auto_2000920 ) ) ( not ( = ?auto_2000917 ?auto_2000921 ) ) ( not ( = ?auto_2000917 ?auto_2000922 ) ) ( not ( = ?auto_2000917 ?auto_2000924 ) ) ( not ( = ?auto_2000918 ?auto_2000919 ) ) ( not ( = ?auto_2000918 ?auto_2000920 ) ) ( not ( = ?auto_2000918 ?auto_2000921 ) ) ( not ( = ?auto_2000918 ?auto_2000922 ) ) ( not ( = ?auto_2000918 ?auto_2000924 ) ) ( not ( = ?auto_2000919 ?auto_2000920 ) ) ( not ( = ?auto_2000919 ?auto_2000921 ) ) ( not ( = ?auto_2000919 ?auto_2000922 ) ) ( not ( = ?auto_2000919 ?auto_2000924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000920 ?auto_2000921 ?auto_2000922 )
      ( MAKE-15CRATE-VERIFY ?auto_2000907 ?auto_2000908 ?auto_2000909 ?auto_2000910 ?auto_2000911 ?auto_2000912 ?auto_2000913 ?auto_2000914 ?auto_2000915 ?auto_2000916 ?auto_2000917 ?auto_2000918 ?auto_2000919 ?auto_2000920 ?auto_2000921 ?auto_2000922 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001133 - SURFACE
      ?auto_2001134 - SURFACE
      ?auto_2001135 - SURFACE
      ?auto_2001136 - SURFACE
      ?auto_2001137 - SURFACE
      ?auto_2001138 - SURFACE
      ?auto_2001139 - SURFACE
      ?auto_2001140 - SURFACE
      ?auto_2001141 - SURFACE
      ?auto_2001142 - SURFACE
      ?auto_2001143 - SURFACE
      ?auto_2001144 - SURFACE
      ?auto_2001145 - SURFACE
      ?auto_2001146 - SURFACE
      ?auto_2001147 - SURFACE
      ?auto_2001148 - SURFACE
    )
    :vars
    (
      ?auto_2001154 - HOIST
      ?auto_2001150 - PLACE
      ?auto_2001149 - PLACE
      ?auto_2001153 - HOIST
      ?auto_2001152 - SURFACE
      ?auto_2001151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001154 ?auto_2001150 ) ( IS-CRATE ?auto_2001148 ) ( not ( = ?auto_2001147 ?auto_2001148 ) ) ( not ( = ?auto_2001146 ?auto_2001147 ) ) ( not ( = ?auto_2001146 ?auto_2001148 ) ) ( not ( = ?auto_2001149 ?auto_2001150 ) ) ( HOIST-AT ?auto_2001153 ?auto_2001149 ) ( not ( = ?auto_2001154 ?auto_2001153 ) ) ( AVAILABLE ?auto_2001153 ) ( SURFACE-AT ?auto_2001148 ?auto_2001149 ) ( ON ?auto_2001148 ?auto_2001152 ) ( CLEAR ?auto_2001148 ) ( not ( = ?auto_2001147 ?auto_2001152 ) ) ( not ( = ?auto_2001148 ?auto_2001152 ) ) ( not ( = ?auto_2001146 ?auto_2001152 ) ) ( TRUCK-AT ?auto_2001151 ?auto_2001150 ) ( SURFACE-AT ?auto_2001146 ?auto_2001150 ) ( CLEAR ?auto_2001146 ) ( LIFTING ?auto_2001154 ?auto_2001147 ) ( IS-CRATE ?auto_2001147 ) ( ON ?auto_2001134 ?auto_2001133 ) ( ON ?auto_2001135 ?auto_2001134 ) ( ON ?auto_2001136 ?auto_2001135 ) ( ON ?auto_2001137 ?auto_2001136 ) ( ON ?auto_2001138 ?auto_2001137 ) ( ON ?auto_2001139 ?auto_2001138 ) ( ON ?auto_2001140 ?auto_2001139 ) ( ON ?auto_2001141 ?auto_2001140 ) ( ON ?auto_2001142 ?auto_2001141 ) ( ON ?auto_2001143 ?auto_2001142 ) ( ON ?auto_2001144 ?auto_2001143 ) ( ON ?auto_2001145 ?auto_2001144 ) ( ON ?auto_2001146 ?auto_2001145 ) ( not ( = ?auto_2001133 ?auto_2001134 ) ) ( not ( = ?auto_2001133 ?auto_2001135 ) ) ( not ( = ?auto_2001133 ?auto_2001136 ) ) ( not ( = ?auto_2001133 ?auto_2001137 ) ) ( not ( = ?auto_2001133 ?auto_2001138 ) ) ( not ( = ?auto_2001133 ?auto_2001139 ) ) ( not ( = ?auto_2001133 ?auto_2001140 ) ) ( not ( = ?auto_2001133 ?auto_2001141 ) ) ( not ( = ?auto_2001133 ?auto_2001142 ) ) ( not ( = ?auto_2001133 ?auto_2001143 ) ) ( not ( = ?auto_2001133 ?auto_2001144 ) ) ( not ( = ?auto_2001133 ?auto_2001145 ) ) ( not ( = ?auto_2001133 ?auto_2001146 ) ) ( not ( = ?auto_2001133 ?auto_2001147 ) ) ( not ( = ?auto_2001133 ?auto_2001148 ) ) ( not ( = ?auto_2001133 ?auto_2001152 ) ) ( not ( = ?auto_2001134 ?auto_2001135 ) ) ( not ( = ?auto_2001134 ?auto_2001136 ) ) ( not ( = ?auto_2001134 ?auto_2001137 ) ) ( not ( = ?auto_2001134 ?auto_2001138 ) ) ( not ( = ?auto_2001134 ?auto_2001139 ) ) ( not ( = ?auto_2001134 ?auto_2001140 ) ) ( not ( = ?auto_2001134 ?auto_2001141 ) ) ( not ( = ?auto_2001134 ?auto_2001142 ) ) ( not ( = ?auto_2001134 ?auto_2001143 ) ) ( not ( = ?auto_2001134 ?auto_2001144 ) ) ( not ( = ?auto_2001134 ?auto_2001145 ) ) ( not ( = ?auto_2001134 ?auto_2001146 ) ) ( not ( = ?auto_2001134 ?auto_2001147 ) ) ( not ( = ?auto_2001134 ?auto_2001148 ) ) ( not ( = ?auto_2001134 ?auto_2001152 ) ) ( not ( = ?auto_2001135 ?auto_2001136 ) ) ( not ( = ?auto_2001135 ?auto_2001137 ) ) ( not ( = ?auto_2001135 ?auto_2001138 ) ) ( not ( = ?auto_2001135 ?auto_2001139 ) ) ( not ( = ?auto_2001135 ?auto_2001140 ) ) ( not ( = ?auto_2001135 ?auto_2001141 ) ) ( not ( = ?auto_2001135 ?auto_2001142 ) ) ( not ( = ?auto_2001135 ?auto_2001143 ) ) ( not ( = ?auto_2001135 ?auto_2001144 ) ) ( not ( = ?auto_2001135 ?auto_2001145 ) ) ( not ( = ?auto_2001135 ?auto_2001146 ) ) ( not ( = ?auto_2001135 ?auto_2001147 ) ) ( not ( = ?auto_2001135 ?auto_2001148 ) ) ( not ( = ?auto_2001135 ?auto_2001152 ) ) ( not ( = ?auto_2001136 ?auto_2001137 ) ) ( not ( = ?auto_2001136 ?auto_2001138 ) ) ( not ( = ?auto_2001136 ?auto_2001139 ) ) ( not ( = ?auto_2001136 ?auto_2001140 ) ) ( not ( = ?auto_2001136 ?auto_2001141 ) ) ( not ( = ?auto_2001136 ?auto_2001142 ) ) ( not ( = ?auto_2001136 ?auto_2001143 ) ) ( not ( = ?auto_2001136 ?auto_2001144 ) ) ( not ( = ?auto_2001136 ?auto_2001145 ) ) ( not ( = ?auto_2001136 ?auto_2001146 ) ) ( not ( = ?auto_2001136 ?auto_2001147 ) ) ( not ( = ?auto_2001136 ?auto_2001148 ) ) ( not ( = ?auto_2001136 ?auto_2001152 ) ) ( not ( = ?auto_2001137 ?auto_2001138 ) ) ( not ( = ?auto_2001137 ?auto_2001139 ) ) ( not ( = ?auto_2001137 ?auto_2001140 ) ) ( not ( = ?auto_2001137 ?auto_2001141 ) ) ( not ( = ?auto_2001137 ?auto_2001142 ) ) ( not ( = ?auto_2001137 ?auto_2001143 ) ) ( not ( = ?auto_2001137 ?auto_2001144 ) ) ( not ( = ?auto_2001137 ?auto_2001145 ) ) ( not ( = ?auto_2001137 ?auto_2001146 ) ) ( not ( = ?auto_2001137 ?auto_2001147 ) ) ( not ( = ?auto_2001137 ?auto_2001148 ) ) ( not ( = ?auto_2001137 ?auto_2001152 ) ) ( not ( = ?auto_2001138 ?auto_2001139 ) ) ( not ( = ?auto_2001138 ?auto_2001140 ) ) ( not ( = ?auto_2001138 ?auto_2001141 ) ) ( not ( = ?auto_2001138 ?auto_2001142 ) ) ( not ( = ?auto_2001138 ?auto_2001143 ) ) ( not ( = ?auto_2001138 ?auto_2001144 ) ) ( not ( = ?auto_2001138 ?auto_2001145 ) ) ( not ( = ?auto_2001138 ?auto_2001146 ) ) ( not ( = ?auto_2001138 ?auto_2001147 ) ) ( not ( = ?auto_2001138 ?auto_2001148 ) ) ( not ( = ?auto_2001138 ?auto_2001152 ) ) ( not ( = ?auto_2001139 ?auto_2001140 ) ) ( not ( = ?auto_2001139 ?auto_2001141 ) ) ( not ( = ?auto_2001139 ?auto_2001142 ) ) ( not ( = ?auto_2001139 ?auto_2001143 ) ) ( not ( = ?auto_2001139 ?auto_2001144 ) ) ( not ( = ?auto_2001139 ?auto_2001145 ) ) ( not ( = ?auto_2001139 ?auto_2001146 ) ) ( not ( = ?auto_2001139 ?auto_2001147 ) ) ( not ( = ?auto_2001139 ?auto_2001148 ) ) ( not ( = ?auto_2001139 ?auto_2001152 ) ) ( not ( = ?auto_2001140 ?auto_2001141 ) ) ( not ( = ?auto_2001140 ?auto_2001142 ) ) ( not ( = ?auto_2001140 ?auto_2001143 ) ) ( not ( = ?auto_2001140 ?auto_2001144 ) ) ( not ( = ?auto_2001140 ?auto_2001145 ) ) ( not ( = ?auto_2001140 ?auto_2001146 ) ) ( not ( = ?auto_2001140 ?auto_2001147 ) ) ( not ( = ?auto_2001140 ?auto_2001148 ) ) ( not ( = ?auto_2001140 ?auto_2001152 ) ) ( not ( = ?auto_2001141 ?auto_2001142 ) ) ( not ( = ?auto_2001141 ?auto_2001143 ) ) ( not ( = ?auto_2001141 ?auto_2001144 ) ) ( not ( = ?auto_2001141 ?auto_2001145 ) ) ( not ( = ?auto_2001141 ?auto_2001146 ) ) ( not ( = ?auto_2001141 ?auto_2001147 ) ) ( not ( = ?auto_2001141 ?auto_2001148 ) ) ( not ( = ?auto_2001141 ?auto_2001152 ) ) ( not ( = ?auto_2001142 ?auto_2001143 ) ) ( not ( = ?auto_2001142 ?auto_2001144 ) ) ( not ( = ?auto_2001142 ?auto_2001145 ) ) ( not ( = ?auto_2001142 ?auto_2001146 ) ) ( not ( = ?auto_2001142 ?auto_2001147 ) ) ( not ( = ?auto_2001142 ?auto_2001148 ) ) ( not ( = ?auto_2001142 ?auto_2001152 ) ) ( not ( = ?auto_2001143 ?auto_2001144 ) ) ( not ( = ?auto_2001143 ?auto_2001145 ) ) ( not ( = ?auto_2001143 ?auto_2001146 ) ) ( not ( = ?auto_2001143 ?auto_2001147 ) ) ( not ( = ?auto_2001143 ?auto_2001148 ) ) ( not ( = ?auto_2001143 ?auto_2001152 ) ) ( not ( = ?auto_2001144 ?auto_2001145 ) ) ( not ( = ?auto_2001144 ?auto_2001146 ) ) ( not ( = ?auto_2001144 ?auto_2001147 ) ) ( not ( = ?auto_2001144 ?auto_2001148 ) ) ( not ( = ?auto_2001144 ?auto_2001152 ) ) ( not ( = ?auto_2001145 ?auto_2001146 ) ) ( not ( = ?auto_2001145 ?auto_2001147 ) ) ( not ( = ?auto_2001145 ?auto_2001148 ) ) ( not ( = ?auto_2001145 ?auto_2001152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001146 ?auto_2001147 ?auto_2001148 )
      ( MAKE-15CRATE-VERIFY ?auto_2001133 ?auto_2001134 ?auto_2001135 ?auto_2001136 ?auto_2001137 ?auto_2001138 ?auto_2001139 ?auto_2001140 ?auto_2001141 ?auto_2001142 ?auto_2001143 ?auto_2001144 ?auto_2001145 ?auto_2001146 ?auto_2001147 ?auto_2001148 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001359 - SURFACE
      ?auto_2001360 - SURFACE
      ?auto_2001361 - SURFACE
      ?auto_2001362 - SURFACE
      ?auto_2001363 - SURFACE
      ?auto_2001364 - SURFACE
      ?auto_2001365 - SURFACE
      ?auto_2001366 - SURFACE
      ?auto_2001367 - SURFACE
      ?auto_2001368 - SURFACE
      ?auto_2001369 - SURFACE
      ?auto_2001370 - SURFACE
      ?auto_2001371 - SURFACE
      ?auto_2001372 - SURFACE
      ?auto_2001373 - SURFACE
      ?auto_2001374 - SURFACE
    )
    :vars
    (
      ?auto_2001380 - HOIST
      ?auto_2001377 - PLACE
      ?auto_2001375 - PLACE
      ?auto_2001379 - HOIST
      ?auto_2001378 - SURFACE
      ?auto_2001376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001380 ?auto_2001377 ) ( IS-CRATE ?auto_2001374 ) ( not ( = ?auto_2001373 ?auto_2001374 ) ) ( not ( = ?auto_2001372 ?auto_2001373 ) ) ( not ( = ?auto_2001372 ?auto_2001374 ) ) ( not ( = ?auto_2001375 ?auto_2001377 ) ) ( HOIST-AT ?auto_2001379 ?auto_2001375 ) ( not ( = ?auto_2001380 ?auto_2001379 ) ) ( AVAILABLE ?auto_2001379 ) ( SURFACE-AT ?auto_2001374 ?auto_2001375 ) ( ON ?auto_2001374 ?auto_2001378 ) ( CLEAR ?auto_2001374 ) ( not ( = ?auto_2001373 ?auto_2001378 ) ) ( not ( = ?auto_2001374 ?auto_2001378 ) ) ( not ( = ?auto_2001372 ?auto_2001378 ) ) ( TRUCK-AT ?auto_2001376 ?auto_2001377 ) ( SURFACE-AT ?auto_2001372 ?auto_2001377 ) ( CLEAR ?auto_2001372 ) ( IS-CRATE ?auto_2001373 ) ( AVAILABLE ?auto_2001380 ) ( IN ?auto_2001373 ?auto_2001376 ) ( ON ?auto_2001360 ?auto_2001359 ) ( ON ?auto_2001361 ?auto_2001360 ) ( ON ?auto_2001362 ?auto_2001361 ) ( ON ?auto_2001363 ?auto_2001362 ) ( ON ?auto_2001364 ?auto_2001363 ) ( ON ?auto_2001365 ?auto_2001364 ) ( ON ?auto_2001366 ?auto_2001365 ) ( ON ?auto_2001367 ?auto_2001366 ) ( ON ?auto_2001368 ?auto_2001367 ) ( ON ?auto_2001369 ?auto_2001368 ) ( ON ?auto_2001370 ?auto_2001369 ) ( ON ?auto_2001371 ?auto_2001370 ) ( ON ?auto_2001372 ?auto_2001371 ) ( not ( = ?auto_2001359 ?auto_2001360 ) ) ( not ( = ?auto_2001359 ?auto_2001361 ) ) ( not ( = ?auto_2001359 ?auto_2001362 ) ) ( not ( = ?auto_2001359 ?auto_2001363 ) ) ( not ( = ?auto_2001359 ?auto_2001364 ) ) ( not ( = ?auto_2001359 ?auto_2001365 ) ) ( not ( = ?auto_2001359 ?auto_2001366 ) ) ( not ( = ?auto_2001359 ?auto_2001367 ) ) ( not ( = ?auto_2001359 ?auto_2001368 ) ) ( not ( = ?auto_2001359 ?auto_2001369 ) ) ( not ( = ?auto_2001359 ?auto_2001370 ) ) ( not ( = ?auto_2001359 ?auto_2001371 ) ) ( not ( = ?auto_2001359 ?auto_2001372 ) ) ( not ( = ?auto_2001359 ?auto_2001373 ) ) ( not ( = ?auto_2001359 ?auto_2001374 ) ) ( not ( = ?auto_2001359 ?auto_2001378 ) ) ( not ( = ?auto_2001360 ?auto_2001361 ) ) ( not ( = ?auto_2001360 ?auto_2001362 ) ) ( not ( = ?auto_2001360 ?auto_2001363 ) ) ( not ( = ?auto_2001360 ?auto_2001364 ) ) ( not ( = ?auto_2001360 ?auto_2001365 ) ) ( not ( = ?auto_2001360 ?auto_2001366 ) ) ( not ( = ?auto_2001360 ?auto_2001367 ) ) ( not ( = ?auto_2001360 ?auto_2001368 ) ) ( not ( = ?auto_2001360 ?auto_2001369 ) ) ( not ( = ?auto_2001360 ?auto_2001370 ) ) ( not ( = ?auto_2001360 ?auto_2001371 ) ) ( not ( = ?auto_2001360 ?auto_2001372 ) ) ( not ( = ?auto_2001360 ?auto_2001373 ) ) ( not ( = ?auto_2001360 ?auto_2001374 ) ) ( not ( = ?auto_2001360 ?auto_2001378 ) ) ( not ( = ?auto_2001361 ?auto_2001362 ) ) ( not ( = ?auto_2001361 ?auto_2001363 ) ) ( not ( = ?auto_2001361 ?auto_2001364 ) ) ( not ( = ?auto_2001361 ?auto_2001365 ) ) ( not ( = ?auto_2001361 ?auto_2001366 ) ) ( not ( = ?auto_2001361 ?auto_2001367 ) ) ( not ( = ?auto_2001361 ?auto_2001368 ) ) ( not ( = ?auto_2001361 ?auto_2001369 ) ) ( not ( = ?auto_2001361 ?auto_2001370 ) ) ( not ( = ?auto_2001361 ?auto_2001371 ) ) ( not ( = ?auto_2001361 ?auto_2001372 ) ) ( not ( = ?auto_2001361 ?auto_2001373 ) ) ( not ( = ?auto_2001361 ?auto_2001374 ) ) ( not ( = ?auto_2001361 ?auto_2001378 ) ) ( not ( = ?auto_2001362 ?auto_2001363 ) ) ( not ( = ?auto_2001362 ?auto_2001364 ) ) ( not ( = ?auto_2001362 ?auto_2001365 ) ) ( not ( = ?auto_2001362 ?auto_2001366 ) ) ( not ( = ?auto_2001362 ?auto_2001367 ) ) ( not ( = ?auto_2001362 ?auto_2001368 ) ) ( not ( = ?auto_2001362 ?auto_2001369 ) ) ( not ( = ?auto_2001362 ?auto_2001370 ) ) ( not ( = ?auto_2001362 ?auto_2001371 ) ) ( not ( = ?auto_2001362 ?auto_2001372 ) ) ( not ( = ?auto_2001362 ?auto_2001373 ) ) ( not ( = ?auto_2001362 ?auto_2001374 ) ) ( not ( = ?auto_2001362 ?auto_2001378 ) ) ( not ( = ?auto_2001363 ?auto_2001364 ) ) ( not ( = ?auto_2001363 ?auto_2001365 ) ) ( not ( = ?auto_2001363 ?auto_2001366 ) ) ( not ( = ?auto_2001363 ?auto_2001367 ) ) ( not ( = ?auto_2001363 ?auto_2001368 ) ) ( not ( = ?auto_2001363 ?auto_2001369 ) ) ( not ( = ?auto_2001363 ?auto_2001370 ) ) ( not ( = ?auto_2001363 ?auto_2001371 ) ) ( not ( = ?auto_2001363 ?auto_2001372 ) ) ( not ( = ?auto_2001363 ?auto_2001373 ) ) ( not ( = ?auto_2001363 ?auto_2001374 ) ) ( not ( = ?auto_2001363 ?auto_2001378 ) ) ( not ( = ?auto_2001364 ?auto_2001365 ) ) ( not ( = ?auto_2001364 ?auto_2001366 ) ) ( not ( = ?auto_2001364 ?auto_2001367 ) ) ( not ( = ?auto_2001364 ?auto_2001368 ) ) ( not ( = ?auto_2001364 ?auto_2001369 ) ) ( not ( = ?auto_2001364 ?auto_2001370 ) ) ( not ( = ?auto_2001364 ?auto_2001371 ) ) ( not ( = ?auto_2001364 ?auto_2001372 ) ) ( not ( = ?auto_2001364 ?auto_2001373 ) ) ( not ( = ?auto_2001364 ?auto_2001374 ) ) ( not ( = ?auto_2001364 ?auto_2001378 ) ) ( not ( = ?auto_2001365 ?auto_2001366 ) ) ( not ( = ?auto_2001365 ?auto_2001367 ) ) ( not ( = ?auto_2001365 ?auto_2001368 ) ) ( not ( = ?auto_2001365 ?auto_2001369 ) ) ( not ( = ?auto_2001365 ?auto_2001370 ) ) ( not ( = ?auto_2001365 ?auto_2001371 ) ) ( not ( = ?auto_2001365 ?auto_2001372 ) ) ( not ( = ?auto_2001365 ?auto_2001373 ) ) ( not ( = ?auto_2001365 ?auto_2001374 ) ) ( not ( = ?auto_2001365 ?auto_2001378 ) ) ( not ( = ?auto_2001366 ?auto_2001367 ) ) ( not ( = ?auto_2001366 ?auto_2001368 ) ) ( not ( = ?auto_2001366 ?auto_2001369 ) ) ( not ( = ?auto_2001366 ?auto_2001370 ) ) ( not ( = ?auto_2001366 ?auto_2001371 ) ) ( not ( = ?auto_2001366 ?auto_2001372 ) ) ( not ( = ?auto_2001366 ?auto_2001373 ) ) ( not ( = ?auto_2001366 ?auto_2001374 ) ) ( not ( = ?auto_2001366 ?auto_2001378 ) ) ( not ( = ?auto_2001367 ?auto_2001368 ) ) ( not ( = ?auto_2001367 ?auto_2001369 ) ) ( not ( = ?auto_2001367 ?auto_2001370 ) ) ( not ( = ?auto_2001367 ?auto_2001371 ) ) ( not ( = ?auto_2001367 ?auto_2001372 ) ) ( not ( = ?auto_2001367 ?auto_2001373 ) ) ( not ( = ?auto_2001367 ?auto_2001374 ) ) ( not ( = ?auto_2001367 ?auto_2001378 ) ) ( not ( = ?auto_2001368 ?auto_2001369 ) ) ( not ( = ?auto_2001368 ?auto_2001370 ) ) ( not ( = ?auto_2001368 ?auto_2001371 ) ) ( not ( = ?auto_2001368 ?auto_2001372 ) ) ( not ( = ?auto_2001368 ?auto_2001373 ) ) ( not ( = ?auto_2001368 ?auto_2001374 ) ) ( not ( = ?auto_2001368 ?auto_2001378 ) ) ( not ( = ?auto_2001369 ?auto_2001370 ) ) ( not ( = ?auto_2001369 ?auto_2001371 ) ) ( not ( = ?auto_2001369 ?auto_2001372 ) ) ( not ( = ?auto_2001369 ?auto_2001373 ) ) ( not ( = ?auto_2001369 ?auto_2001374 ) ) ( not ( = ?auto_2001369 ?auto_2001378 ) ) ( not ( = ?auto_2001370 ?auto_2001371 ) ) ( not ( = ?auto_2001370 ?auto_2001372 ) ) ( not ( = ?auto_2001370 ?auto_2001373 ) ) ( not ( = ?auto_2001370 ?auto_2001374 ) ) ( not ( = ?auto_2001370 ?auto_2001378 ) ) ( not ( = ?auto_2001371 ?auto_2001372 ) ) ( not ( = ?auto_2001371 ?auto_2001373 ) ) ( not ( = ?auto_2001371 ?auto_2001374 ) ) ( not ( = ?auto_2001371 ?auto_2001378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001372 ?auto_2001373 ?auto_2001374 )
      ( MAKE-15CRATE-VERIFY ?auto_2001359 ?auto_2001360 ?auto_2001361 ?auto_2001362 ?auto_2001363 ?auto_2001364 ?auto_2001365 ?auto_2001366 ?auto_2001367 ?auto_2001368 ?auto_2001369 ?auto_2001370 ?auto_2001371 ?auto_2001372 ?auto_2001373 ?auto_2001374 ) )
  )

)

