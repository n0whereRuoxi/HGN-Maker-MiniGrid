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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8230 - SURFACE
      ?auto_8231 - SURFACE
    )
    :vars
    (
      ?auto_8232 - HOIST
      ?auto_8233 - PLACE
      ?auto_8235 - PLACE
      ?auto_8236 - HOIST
      ?auto_8237 - SURFACE
      ?auto_8234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8232 ?auto_8233 ) ( SURFACE-AT ?auto_8230 ?auto_8233 ) ( CLEAR ?auto_8230 ) ( IS-CRATE ?auto_8231 ) ( AVAILABLE ?auto_8232 ) ( not ( = ?auto_8235 ?auto_8233 ) ) ( HOIST-AT ?auto_8236 ?auto_8235 ) ( AVAILABLE ?auto_8236 ) ( SURFACE-AT ?auto_8231 ?auto_8235 ) ( ON ?auto_8231 ?auto_8237 ) ( CLEAR ?auto_8231 ) ( TRUCK-AT ?auto_8234 ?auto_8233 ) ( not ( = ?auto_8230 ?auto_8231 ) ) ( not ( = ?auto_8230 ?auto_8237 ) ) ( not ( = ?auto_8231 ?auto_8237 ) ) ( not ( = ?auto_8232 ?auto_8236 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8234 ?auto_8233 ?auto_8235 )
      ( !LIFT ?auto_8236 ?auto_8231 ?auto_8237 ?auto_8235 )
      ( !LOAD ?auto_8236 ?auto_8231 ?auto_8234 ?auto_8235 )
      ( !DRIVE ?auto_8234 ?auto_8235 ?auto_8233 )
      ( !UNLOAD ?auto_8232 ?auto_8231 ?auto_8234 ?auto_8233 )
      ( !DROP ?auto_8232 ?auto_8231 ?auto_8230 ?auto_8233 )
      ( MAKE-1CRATE-VERIFY ?auto_8230 ?auto_8231 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8251 - SURFACE
      ?auto_8252 - SURFACE
      ?auto_8253 - SURFACE
    )
    :vars
    (
      ?auto_8256 - HOIST
      ?auto_8259 - PLACE
      ?auto_8258 - PLACE
      ?auto_8255 - HOIST
      ?auto_8257 - SURFACE
      ?auto_8260 - SURFACE
      ?auto_8254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8256 ?auto_8259 ) ( IS-CRATE ?auto_8253 ) ( not ( = ?auto_8258 ?auto_8259 ) ) ( HOIST-AT ?auto_8255 ?auto_8258 ) ( SURFACE-AT ?auto_8253 ?auto_8258 ) ( ON ?auto_8253 ?auto_8257 ) ( CLEAR ?auto_8253 ) ( not ( = ?auto_8252 ?auto_8253 ) ) ( not ( = ?auto_8252 ?auto_8257 ) ) ( not ( = ?auto_8253 ?auto_8257 ) ) ( not ( = ?auto_8256 ?auto_8255 ) ) ( SURFACE-AT ?auto_8251 ?auto_8259 ) ( CLEAR ?auto_8251 ) ( IS-CRATE ?auto_8252 ) ( AVAILABLE ?auto_8256 ) ( AVAILABLE ?auto_8255 ) ( SURFACE-AT ?auto_8252 ?auto_8258 ) ( ON ?auto_8252 ?auto_8260 ) ( CLEAR ?auto_8252 ) ( TRUCK-AT ?auto_8254 ?auto_8259 ) ( not ( = ?auto_8251 ?auto_8252 ) ) ( not ( = ?auto_8251 ?auto_8260 ) ) ( not ( = ?auto_8252 ?auto_8260 ) ) ( not ( = ?auto_8251 ?auto_8253 ) ) ( not ( = ?auto_8251 ?auto_8257 ) ) ( not ( = ?auto_8253 ?auto_8260 ) ) ( not ( = ?auto_8257 ?auto_8260 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8251 ?auto_8252 )
      ( MAKE-1CRATE ?auto_8252 ?auto_8253 )
      ( MAKE-2CRATE-VERIFY ?auto_8251 ?auto_8252 ?auto_8253 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8275 - SURFACE
      ?auto_8276 - SURFACE
      ?auto_8277 - SURFACE
      ?auto_8278 - SURFACE
    )
    :vars
    (
      ?auto_8283 - HOIST
      ?auto_8282 - PLACE
      ?auto_8281 - PLACE
      ?auto_8284 - HOIST
      ?auto_8279 - SURFACE
      ?auto_8288 - PLACE
      ?auto_8287 - HOIST
      ?auto_8285 - SURFACE
      ?auto_8286 - SURFACE
      ?auto_8280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8283 ?auto_8282 ) ( IS-CRATE ?auto_8278 ) ( not ( = ?auto_8281 ?auto_8282 ) ) ( HOIST-AT ?auto_8284 ?auto_8281 ) ( AVAILABLE ?auto_8284 ) ( SURFACE-AT ?auto_8278 ?auto_8281 ) ( ON ?auto_8278 ?auto_8279 ) ( CLEAR ?auto_8278 ) ( not ( = ?auto_8277 ?auto_8278 ) ) ( not ( = ?auto_8277 ?auto_8279 ) ) ( not ( = ?auto_8278 ?auto_8279 ) ) ( not ( = ?auto_8283 ?auto_8284 ) ) ( IS-CRATE ?auto_8277 ) ( not ( = ?auto_8288 ?auto_8282 ) ) ( HOIST-AT ?auto_8287 ?auto_8288 ) ( SURFACE-AT ?auto_8277 ?auto_8288 ) ( ON ?auto_8277 ?auto_8285 ) ( CLEAR ?auto_8277 ) ( not ( = ?auto_8276 ?auto_8277 ) ) ( not ( = ?auto_8276 ?auto_8285 ) ) ( not ( = ?auto_8277 ?auto_8285 ) ) ( not ( = ?auto_8283 ?auto_8287 ) ) ( SURFACE-AT ?auto_8275 ?auto_8282 ) ( CLEAR ?auto_8275 ) ( IS-CRATE ?auto_8276 ) ( AVAILABLE ?auto_8283 ) ( AVAILABLE ?auto_8287 ) ( SURFACE-AT ?auto_8276 ?auto_8288 ) ( ON ?auto_8276 ?auto_8286 ) ( CLEAR ?auto_8276 ) ( TRUCK-AT ?auto_8280 ?auto_8282 ) ( not ( = ?auto_8275 ?auto_8276 ) ) ( not ( = ?auto_8275 ?auto_8286 ) ) ( not ( = ?auto_8276 ?auto_8286 ) ) ( not ( = ?auto_8275 ?auto_8277 ) ) ( not ( = ?auto_8275 ?auto_8285 ) ) ( not ( = ?auto_8277 ?auto_8286 ) ) ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8275 ?auto_8278 ) ) ( not ( = ?auto_8275 ?auto_8279 ) ) ( not ( = ?auto_8276 ?auto_8278 ) ) ( not ( = ?auto_8276 ?auto_8279 ) ) ( not ( = ?auto_8278 ?auto_8285 ) ) ( not ( = ?auto_8278 ?auto_8286 ) ) ( not ( = ?auto_8281 ?auto_8288 ) ) ( not ( = ?auto_8284 ?auto_8287 ) ) ( not ( = ?auto_8279 ?auto_8285 ) ) ( not ( = ?auto_8279 ?auto_8286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8275 ?auto_8276 ?auto_8277 )
      ( MAKE-1CRATE ?auto_8277 ?auto_8278 )
      ( MAKE-3CRATE-VERIFY ?auto_8275 ?auto_8276 ?auto_8277 ?auto_8278 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8304 - SURFACE
      ?auto_8305 - SURFACE
      ?auto_8306 - SURFACE
      ?auto_8307 - SURFACE
      ?auto_8308 - SURFACE
    )
    :vars
    (
      ?auto_8313 - HOIST
      ?auto_8314 - PLACE
      ?auto_8310 - PLACE
      ?auto_8312 - HOIST
      ?auto_8311 - SURFACE
      ?auto_8319 - PLACE
      ?auto_8317 - HOIST
      ?auto_8320 - SURFACE
      ?auto_8315 - PLACE
      ?auto_8318 - HOIST
      ?auto_8316 - SURFACE
      ?auto_8321 - SURFACE
      ?auto_8309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8313 ?auto_8314 ) ( IS-CRATE ?auto_8308 ) ( not ( = ?auto_8310 ?auto_8314 ) ) ( HOIST-AT ?auto_8312 ?auto_8310 ) ( AVAILABLE ?auto_8312 ) ( SURFACE-AT ?auto_8308 ?auto_8310 ) ( ON ?auto_8308 ?auto_8311 ) ( CLEAR ?auto_8308 ) ( not ( = ?auto_8307 ?auto_8308 ) ) ( not ( = ?auto_8307 ?auto_8311 ) ) ( not ( = ?auto_8308 ?auto_8311 ) ) ( not ( = ?auto_8313 ?auto_8312 ) ) ( IS-CRATE ?auto_8307 ) ( not ( = ?auto_8319 ?auto_8314 ) ) ( HOIST-AT ?auto_8317 ?auto_8319 ) ( AVAILABLE ?auto_8317 ) ( SURFACE-AT ?auto_8307 ?auto_8319 ) ( ON ?auto_8307 ?auto_8320 ) ( CLEAR ?auto_8307 ) ( not ( = ?auto_8306 ?auto_8307 ) ) ( not ( = ?auto_8306 ?auto_8320 ) ) ( not ( = ?auto_8307 ?auto_8320 ) ) ( not ( = ?auto_8313 ?auto_8317 ) ) ( IS-CRATE ?auto_8306 ) ( not ( = ?auto_8315 ?auto_8314 ) ) ( HOIST-AT ?auto_8318 ?auto_8315 ) ( SURFACE-AT ?auto_8306 ?auto_8315 ) ( ON ?auto_8306 ?auto_8316 ) ( CLEAR ?auto_8306 ) ( not ( = ?auto_8305 ?auto_8306 ) ) ( not ( = ?auto_8305 ?auto_8316 ) ) ( not ( = ?auto_8306 ?auto_8316 ) ) ( not ( = ?auto_8313 ?auto_8318 ) ) ( SURFACE-AT ?auto_8304 ?auto_8314 ) ( CLEAR ?auto_8304 ) ( IS-CRATE ?auto_8305 ) ( AVAILABLE ?auto_8313 ) ( AVAILABLE ?auto_8318 ) ( SURFACE-AT ?auto_8305 ?auto_8315 ) ( ON ?auto_8305 ?auto_8321 ) ( CLEAR ?auto_8305 ) ( TRUCK-AT ?auto_8309 ?auto_8314 ) ( not ( = ?auto_8304 ?auto_8305 ) ) ( not ( = ?auto_8304 ?auto_8321 ) ) ( not ( = ?auto_8305 ?auto_8321 ) ) ( not ( = ?auto_8304 ?auto_8306 ) ) ( not ( = ?auto_8304 ?auto_8316 ) ) ( not ( = ?auto_8306 ?auto_8321 ) ) ( not ( = ?auto_8316 ?auto_8321 ) ) ( not ( = ?auto_8304 ?auto_8307 ) ) ( not ( = ?auto_8304 ?auto_8320 ) ) ( not ( = ?auto_8305 ?auto_8307 ) ) ( not ( = ?auto_8305 ?auto_8320 ) ) ( not ( = ?auto_8307 ?auto_8316 ) ) ( not ( = ?auto_8307 ?auto_8321 ) ) ( not ( = ?auto_8319 ?auto_8315 ) ) ( not ( = ?auto_8317 ?auto_8318 ) ) ( not ( = ?auto_8320 ?auto_8316 ) ) ( not ( = ?auto_8320 ?auto_8321 ) ) ( not ( = ?auto_8304 ?auto_8308 ) ) ( not ( = ?auto_8304 ?auto_8311 ) ) ( not ( = ?auto_8305 ?auto_8308 ) ) ( not ( = ?auto_8305 ?auto_8311 ) ) ( not ( = ?auto_8306 ?auto_8308 ) ) ( not ( = ?auto_8306 ?auto_8311 ) ) ( not ( = ?auto_8308 ?auto_8320 ) ) ( not ( = ?auto_8308 ?auto_8316 ) ) ( not ( = ?auto_8308 ?auto_8321 ) ) ( not ( = ?auto_8310 ?auto_8319 ) ) ( not ( = ?auto_8310 ?auto_8315 ) ) ( not ( = ?auto_8312 ?auto_8317 ) ) ( not ( = ?auto_8312 ?auto_8318 ) ) ( not ( = ?auto_8311 ?auto_8320 ) ) ( not ( = ?auto_8311 ?auto_8316 ) ) ( not ( = ?auto_8311 ?auto_8321 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8304 ?auto_8305 ?auto_8306 ?auto_8307 )
      ( MAKE-1CRATE ?auto_8307 ?auto_8308 )
      ( MAKE-4CRATE-VERIFY ?auto_8304 ?auto_8305 ?auto_8306 ?auto_8307 ?auto_8308 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8338 - SURFACE
      ?auto_8339 - SURFACE
      ?auto_8340 - SURFACE
      ?auto_8341 - SURFACE
      ?auto_8342 - SURFACE
      ?auto_8343 - SURFACE
    )
    :vars
    (
      ?auto_8347 - HOIST
      ?auto_8344 - PLACE
      ?auto_8349 - PLACE
      ?auto_8348 - HOIST
      ?auto_8346 - SURFACE
      ?auto_8351 - PLACE
      ?auto_8356 - HOIST
      ?auto_8350 - SURFACE
      ?auto_8352 - SURFACE
      ?auto_8353 - PLACE
      ?auto_8355 - HOIST
      ?auto_8354 - SURFACE
      ?auto_8357 - SURFACE
      ?auto_8345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8347 ?auto_8344 ) ( IS-CRATE ?auto_8343 ) ( not ( = ?auto_8349 ?auto_8344 ) ) ( HOIST-AT ?auto_8348 ?auto_8349 ) ( SURFACE-AT ?auto_8343 ?auto_8349 ) ( ON ?auto_8343 ?auto_8346 ) ( CLEAR ?auto_8343 ) ( not ( = ?auto_8342 ?auto_8343 ) ) ( not ( = ?auto_8342 ?auto_8346 ) ) ( not ( = ?auto_8343 ?auto_8346 ) ) ( not ( = ?auto_8347 ?auto_8348 ) ) ( IS-CRATE ?auto_8342 ) ( not ( = ?auto_8351 ?auto_8344 ) ) ( HOIST-AT ?auto_8356 ?auto_8351 ) ( AVAILABLE ?auto_8356 ) ( SURFACE-AT ?auto_8342 ?auto_8351 ) ( ON ?auto_8342 ?auto_8350 ) ( CLEAR ?auto_8342 ) ( not ( = ?auto_8341 ?auto_8342 ) ) ( not ( = ?auto_8341 ?auto_8350 ) ) ( not ( = ?auto_8342 ?auto_8350 ) ) ( not ( = ?auto_8347 ?auto_8356 ) ) ( IS-CRATE ?auto_8341 ) ( AVAILABLE ?auto_8348 ) ( SURFACE-AT ?auto_8341 ?auto_8349 ) ( ON ?auto_8341 ?auto_8352 ) ( CLEAR ?auto_8341 ) ( not ( = ?auto_8340 ?auto_8341 ) ) ( not ( = ?auto_8340 ?auto_8352 ) ) ( not ( = ?auto_8341 ?auto_8352 ) ) ( IS-CRATE ?auto_8340 ) ( not ( = ?auto_8353 ?auto_8344 ) ) ( HOIST-AT ?auto_8355 ?auto_8353 ) ( SURFACE-AT ?auto_8340 ?auto_8353 ) ( ON ?auto_8340 ?auto_8354 ) ( CLEAR ?auto_8340 ) ( not ( = ?auto_8339 ?auto_8340 ) ) ( not ( = ?auto_8339 ?auto_8354 ) ) ( not ( = ?auto_8340 ?auto_8354 ) ) ( not ( = ?auto_8347 ?auto_8355 ) ) ( SURFACE-AT ?auto_8338 ?auto_8344 ) ( CLEAR ?auto_8338 ) ( IS-CRATE ?auto_8339 ) ( AVAILABLE ?auto_8347 ) ( AVAILABLE ?auto_8355 ) ( SURFACE-AT ?auto_8339 ?auto_8353 ) ( ON ?auto_8339 ?auto_8357 ) ( CLEAR ?auto_8339 ) ( TRUCK-AT ?auto_8345 ?auto_8344 ) ( not ( = ?auto_8338 ?auto_8339 ) ) ( not ( = ?auto_8338 ?auto_8357 ) ) ( not ( = ?auto_8339 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8340 ) ) ( not ( = ?auto_8338 ?auto_8354 ) ) ( not ( = ?auto_8340 ?auto_8357 ) ) ( not ( = ?auto_8354 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8341 ) ) ( not ( = ?auto_8338 ?auto_8352 ) ) ( not ( = ?auto_8339 ?auto_8341 ) ) ( not ( = ?auto_8339 ?auto_8352 ) ) ( not ( = ?auto_8341 ?auto_8354 ) ) ( not ( = ?auto_8341 ?auto_8357 ) ) ( not ( = ?auto_8349 ?auto_8353 ) ) ( not ( = ?auto_8348 ?auto_8355 ) ) ( not ( = ?auto_8352 ?auto_8354 ) ) ( not ( = ?auto_8352 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8342 ) ) ( not ( = ?auto_8338 ?auto_8350 ) ) ( not ( = ?auto_8339 ?auto_8342 ) ) ( not ( = ?auto_8339 ?auto_8350 ) ) ( not ( = ?auto_8340 ?auto_8342 ) ) ( not ( = ?auto_8340 ?auto_8350 ) ) ( not ( = ?auto_8342 ?auto_8352 ) ) ( not ( = ?auto_8342 ?auto_8354 ) ) ( not ( = ?auto_8342 ?auto_8357 ) ) ( not ( = ?auto_8351 ?auto_8349 ) ) ( not ( = ?auto_8351 ?auto_8353 ) ) ( not ( = ?auto_8356 ?auto_8348 ) ) ( not ( = ?auto_8356 ?auto_8355 ) ) ( not ( = ?auto_8350 ?auto_8352 ) ) ( not ( = ?auto_8350 ?auto_8354 ) ) ( not ( = ?auto_8350 ?auto_8357 ) ) ( not ( = ?auto_8338 ?auto_8343 ) ) ( not ( = ?auto_8338 ?auto_8346 ) ) ( not ( = ?auto_8339 ?auto_8343 ) ) ( not ( = ?auto_8339 ?auto_8346 ) ) ( not ( = ?auto_8340 ?auto_8343 ) ) ( not ( = ?auto_8340 ?auto_8346 ) ) ( not ( = ?auto_8341 ?auto_8343 ) ) ( not ( = ?auto_8341 ?auto_8346 ) ) ( not ( = ?auto_8343 ?auto_8350 ) ) ( not ( = ?auto_8343 ?auto_8352 ) ) ( not ( = ?auto_8343 ?auto_8354 ) ) ( not ( = ?auto_8343 ?auto_8357 ) ) ( not ( = ?auto_8346 ?auto_8350 ) ) ( not ( = ?auto_8346 ?auto_8352 ) ) ( not ( = ?auto_8346 ?auto_8354 ) ) ( not ( = ?auto_8346 ?auto_8357 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8338 ?auto_8339 ?auto_8340 ?auto_8341 ?auto_8342 )
      ( MAKE-1CRATE ?auto_8342 ?auto_8343 )
      ( MAKE-5CRATE-VERIFY ?auto_8338 ?auto_8339 ?auto_8340 ?auto_8341 ?auto_8342 ?auto_8343 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8375 - SURFACE
      ?auto_8376 - SURFACE
      ?auto_8377 - SURFACE
      ?auto_8378 - SURFACE
      ?auto_8379 - SURFACE
      ?auto_8380 - SURFACE
      ?auto_8381 - SURFACE
    )
    :vars
    (
      ?auto_8382 - HOIST
      ?auto_8386 - PLACE
      ?auto_8385 - PLACE
      ?auto_8387 - HOIST
      ?auto_8383 - SURFACE
      ?auto_8389 - PLACE
      ?auto_8390 - HOIST
      ?auto_8396 - SURFACE
      ?auto_8395 - PLACE
      ?auto_8393 - HOIST
      ?auto_8391 - SURFACE
      ?auto_8394 - SURFACE
      ?auto_8392 - SURFACE
      ?auto_8388 - SURFACE
      ?auto_8384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8382 ?auto_8386 ) ( IS-CRATE ?auto_8381 ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( HOIST-AT ?auto_8387 ?auto_8385 ) ( SURFACE-AT ?auto_8381 ?auto_8385 ) ( ON ?auto_8381 ?auto_8383 ) ( CLEAR ?auto_8381 ) ( not ( = ?auto_8380 ?auto_8381 ) ) ( not ( = ?auto_8380 ?auto_8383 ) ) ( not ( = ?auto_8381 ?auto_8383 ) ) ( not ( = ?auto_8382 ?auto_8387 ) ) ( IS-CRATE ?auto_8380 ) ( not ( = ?auto_8389 ?auto_8386 ) ) ( HOIST-AT ?auto_8390 ?auto_8389 ) ( SURFACE-AT ?auto_8380 ?auto_8389 ) ( ON ?auto_8380 ?auto_8396 ) ( CLEAR ?auto_8380 ) ( not ( = ?auto_8379 ?auto_8380 ) ) ( not ( = ?auto_8379 ?auto_8396 ) ) ( not ( = ?auto_8380 ?auto_8396 ) ) ( not ( = ?auto_8382 ?auto_8390 ) ) ( IS-CRATE ?auto_8379 ) ( not ( = ?auto_8395 ?auto_8386 ) ) ( HOIST-AT ?auto_8393 ?auto_8395 ) ( AVAILABLE ?auto_8393 ) ( SURFACE-AT ?auto_8379 ?auto_8395 ) ( ON ?auto_8379 ?auto_8391 ) ( CLEAR ?auto_8379 ) ( not ( = ?auto_8378 ?auto_8379 ) ) ( not ( = ?auto_8378 ?auto_8391 ) ) ( not ( = ?auto_8379 ?auto_8391 ) ) ( not ( = ?auto_8382 ?auto_8393 ) ) ( IS-CRATE ?auto_8378 ) ( AVAILABLE ?auto_8390 ) ( SURFACE-AT ?auto_8378 ?auto_8389 ) ( ON ?auto_8378 ?auto_8394 ) ( CLEAR ?auto_8378 ) ( not ( = ?auto_8377 ?auto_8378 ) ) ( not ( = ?auto_8377 ?auto_8394 ) ) ( not ( = ?auto_8378 ?auto_8394 ) ) ( IS-CRATE ?auto_8377 ) ( SURFACE-AT ?auto_8377 ?auto_8385 ) ( ON ?auto_8377 ?auto_8392 ) ( CLEAR ?auto_8377 ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( not ( = ?auto_8376 ?auto_8392 ) ) ( not ( = ?auto_8377 ?auto_8392 ) ) ( SURFACE-AT ?auto_8375 ?auto_8386 ) ( CLEAR ?auto_8375 ) ( IS-CRATE ?auto_8376 ) ( AVAILABLE ?auto_8382 ) ( AVAILABLE ?auto_8387 ) ( SURFACE-AT ?auto_8376 ?auto_8385 ) ( ON ?auto_8376 ?auto_8388 ) ( CLEAR ?auto_8376 ) ( TRUCK-AT ?auto_8384 ?auto_8386 ) ( not ( = ?auto_8375 ?auto_8376 ) ) ( not ( = ?auto_8375 ?auto_8388 ) ) ( not ( = ?auto_8376 ?auto_8388 ) ) ( not ( = ?auto_8375 ?auto_8377 ) ) ( not ( = ?auto_8375 ?auto_8392 ) ) ( not ( = ?auto_8377 ?auto_8388 ) ) ( not ( = ?auto_8392 ?auto_8388 ) ) ( not ( = ?auto_8375 ?auto_8378 ) ) ( not ( = ?auto_8375 ?auto_8394 ) ) ( not ( = ?auto_8376 ?auto_8378 ) ) ( not ( = ?auto_8376 ?auto_8394 ) ) ( not ( = ?auto_8378 ?auto_8392 ) ) ( not ( = ?auto_8378 ?auto_8388 ) ) ( not ( = ?auto_8389 ?auto_8385 ) ) ( not ( = ?auto_8390 ?auto_8387 ) ) ( not ( = ?auto_8394 ?auto_8392 ) ) ( not ( = ?auto_8394 ?auto_8388 ) ) ( not ( = ?auto_8375 ?auto_8379 ) ) ( not ( = ?auto_8375 ?auto_8391 ) ) ( not ( = ?auto_8376 ?auto_8379 ) ) ( not ( = ?auto_8376 ?auto_8391 ) ) ( not ( = ?auto_8377 ?auto_8379 ) ) ( not ( = ?auto_8377 ?auto_8391 ) ) ( not ( = ?auto_8379 ?auto_8394 ) ) ( not ( = ?auto_8379 ?auto_8392 ) ) ( not ( = ?auto_8379 ?auto_8388 ) ) ( not ( = ?auto_8395 ?auto_8389 ) ) ( not ( = ?auto_8395 ?auto_8385 ) ) ( not ( = ?auto_8393 ?auto_8390 ) ) ( not ( = ?auto_8393 ?auto_8387 ) ) ( not ( = ?auto_8391 ?auto_8394 ) ) ( not ( = ?auto_8391 ?auto_8392 ) ) ( not ( = ?auto_8391 ?auto_8388 ) ) ( not ( = ?auto_8375 ?auto_8380 ) ) ( not ( = ?auto_8375 ?auto_8396 ) ) ( not ( = ?auto_8376 ?auto_8380 ) ) ( not ( = ?auto_8376 ?auto_8396 ) ) ( not ( = ?auto_8377 ?auto_8380 ) ) ( not ( = ?auto_8377 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8380 ) ) ( not ( = ?auto_8378 ?auto_8396 ) ) ( not ( = ?auto_8380 ?auto_8391 ) ) ( not ( = ?auto_8380 ?auto_8394 ) ) ( not ( = ?auto_8380 ?auto_8392 ) ) ( not ( = ?auto_8380 ?auto_8388 ) ) ( not ( = ?auto_8396 ?auto_8391 ) ) ( not ( = ?auto_8396 ?auto_8394 ) ) ( not ( = ?auto_8396 ?auto_8392 ) ) ( not ( = ?auto_8396 ?auto_8388 ) ) ( not ( = ?auto_8375 ?auto_8381 ) ) ( not ( = ?auto_8375 ?auto_8383 ) ) ( not ( = ?auto_8376 ?auto_8381 ) ) ( not ( = ?auto_8376 ?auto_8383 ) ) ( not ( = ?auto_8377 ?auto_8381 ) ) ( not ( = ?auto_8377 ?auto_8383 ) ) ( not ( = ?auto_8378 ?auto_8381 ) ) ( not ( = ?auto_8378 ?auto_8383 ) ) ( not ( = ?auto_8379 ?auto_8381 ) ) ( not ( = ?auto_8379 ?auto_8383 ) ) ( not ( = ?auto_8381 ?auto_8396 ) ) ( not ( = ?auto_8381 ?auto_8391 ) ) ( not ( = ?auto_8381 ?auto_8394 ) ) ( not ( = ?auto_8381 ?auto_8392 ) ) ( not ( = ?auto_8381 ?auto_8388 ) ) ( not ( = ?auto_8383 ?auto_8396 ) ) ( not ( = ?auto_8383 ?auto_8391 ) ) ( not ( = ?auto_8383 ?auto_8394 ) ) ( not ( = ?auto_8383 ?auto_8392 ) ) ( not ( = ?auto_8383 ?auto_8388 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8375 ?auto_8376 ?auto_8377 ?auto_8378 ?auto_8379 ?auto_8380 )
      ( MAKE-1CRATE ?auto_8380 ?auto_8381 )
      ( MAKE-6CRATE-VERIFY ?auto_8375 ?auto_8376 ?auto_8377 ?auto_8378 ?auto_8379 ?auto_8380 ?auto_8381 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8415 - SURFACE
      ?auto_8416 - SURFACE
      ?auto_8417 - SURFACE
      ?auto_8418 - SURFACE
      ?auto_8419 - SURFACE
      ?auto_8420 - SURFACE
      ?auto_8421 - SURFACE
      ?auto_8422 - SURFACE
    )
    :vars
    (
      ?auto_8425 - HOIST
      ?auto_8428 - PLACE
      ?auto_8424 - PLACE
      ?auto_8423 - HOIST
      ?auto_8427 - SURFACE
      ?auto_8433 - PLACE
      ?auto_8440 - HOIST
      ?auto_8439 - SURFACE
      ?auto_8430 - PLACE
      ?auto_8438 - HOIST
      ?auto_8435 - SURFACE
      ?auto_8436 - PLACE
      ?auto_8429 - HOIST
      ?auto_8431 - SURFACE
      ?auto_8432 - SURFACE
      ?auto_8437 - SURFACE
      ?auto_8434 - SURFACE
      ?auto_8426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8425 ?auto_8428 ) ( IS-CRATE ?auto_8422 ) ( not ( = ?auto_8424 ?auto_8428 ) ) ( HOIST-AT ?auto_8423 ?auto_8424 ) ( AVAILABLE ?auto_8423 ) ( SURFACE-AT ?auto_8422 ?auto_8424 ) ( ON ?auto_8422 ?auto_8427 ) ( CLEAR ?auto_8422 ) ( not ( = ?auto_8421 ?auto_8422 ) ) ( not ( = ?auto_8421 ?auto_8427 ) ) ( not ( = ?auto_8422 ?auto_8427 ) ) ( not ( = ?auto_8425 ?auto_8423 ) ) ( IS-CRATE ?auto_8421 ) ( not ( = ?auto_8433 ?auto_8428 ) ) ( HOIST-AT ?auto_8440 ?auto_8433 ) ( SURFACE-AT ?auto_8421 ?auto_8433 ) ( ON ?auto_8421 ?auto_8439 ) ( CLEAR ?auto_8421 ) ( not ( = ?auto_8420 ?auto_8421 ) ) ( not ( = ?auto_8420 ?auto_8439 ) ) ( not ( = ?auto_8421 ?auto_8439 ) ) ( not ( = ?auto_8425 ?auto_8440 ) ) ( IS-CRATE ?auto_8420 ) ( not ( = ?auto_8430 ?auto_8428 ) ) ( HOIST-AT ?auto_8438 ?auto_8430 ) ( SURFACE-AT ?auto_8420 ?auto_8430 ) ( ON ?auto_8420 ?auto_8435 ) ( CLEAR ?auto_8420 ) ( not ( = ?auto_8419 ?auto_8420 ) ) ( not ( = ?auto_8419 ?auto_8435 ) ) ( not ( = ?auto_8420 ?auto_8435 ) ) ( not ( = ?auto_8425 ?auto_8438 ) ) ( IS-CRATE ?auto_8419 ) ( not ( = ?auto_8436 ?auto_8428 ) ) ( HOIST-AT ?auto_8429 ?auto_8436 ) ( AVAILABLE ?auto_8429 ) ( SURFACE-AT ?auto_8419 ?auto_8436 ) ( ON ?auto_8419 ?auto_8431 ) ( CLEAR ?auto_8419 ) ( not ( = ?auto_8418 ?auto_8419 ) ) ( not ( = ?auto_8418 ?auto_8431 ) ) ( not ( = ?auto_8419 ?auto_8431 ) ) ( not ( = ?auto_8425 ?auto_8429 ) ) ( IS-CRATE ?auto_8418 ) ( AVAILABLE ?auto_8438 ) ( SURFACE-AT ?auto_8418 ?auto_8430 ) ( ON ?auto_8418 ?auto_8432 ) ( CLEAR ?auto_8418 ) ( not ( = ?auto_8417 ?auto_8418 ) ) ( not ( = ?auto_8417 ?auto_8432 ) ) ( not ( = ?auto_8418 ?auto_8432 ) ) ( IS-CRATE ?auto_8417 ) ( SURFACE-AT ?auto_8417 ?auto_8433 ) ( ON ?auto_8417 ?auto_8437 ) ( CLEAR ?auto_8417 ) ( not ( = ?auto_8416 ?auto_8417 ) ) ( not ( = ?auto_8416 ?auto_8437 ) ) ( not ( = ?auto_8417 ?auto_8437 ) ) ( SURFACE-AT ?auto_8415 ?auto_8428 ) ( CLEAR ?auto_8415 ) ( IS-CRATE ?auto_8416 ) ( AVAILABLE ?auto_8425 ) ( AVAILABLE ?auto_8440 ) ( SURFACE-AT ?auto_8416 ?auto_8433 ) ( ON ?auto_8416 ?auto_8434 ) ( CLEAR ?auto_8416 ) ( TRUCK-AT ?auto_8426 ?auto_8428 ) ( not ( = ?auto_8415 ?auto_8416 ) ) ( not ( = ?auto_8415 ?auto_8434 ) ) ( not ( = ?auto_8416 ?auto_8434 ) ) ( not ( = ?auto_8415 ?auto_8417 ) ) ( not ( = ?auto_8415 ?auto_8437 ) ) ( not ( = ?auto_8417 ?auto_8434 ) ) ( not ( = ?auto_8437 ?auto_8434 ) ) ( not ( = ?auto_8415 ?auto_8418 ) ) ( not ( = ?auto_8415 ?auto_8432 ) ) ( not ( = ?auto_8416 ?auto_8418 ) ) ( not ( = ?auto_8416 ?auto_8432 ) ) ( not ( = ?auto_8418 ?auto_8437 ) ) ( not ( = ?auto_8418 ?auto_8434 ) ) ( not ( = ?auto_8430 ?auto_8433 ) ) ( not ( = ?auto_8438 ?auto_8440 ) ) ( not ( = ?auto_8432 ?auto_8437 ) ) ( not ( = ?auto_8432 ?auto_8434 ) ) ( not ( = ?auto_8415 ?auto_8419 ) ) ( not ( = ?auto_8415 ?auto_8431 ) ) ( not ( = ?auto_8416 ?auto_8419 ) ) ( not ( = ?auto_8416 ?auto_8431 ) ) ( not ( = ?auto_8417 ?auto_8419 ) ) ( not ( = ?auto_8417 ?auto_8431 ) ) ( not ( = ?auto_8419 ?auto_8432 ) ) ( not ( = ?auto_8419 ?auto_8437 ) ) ( not ( = ?auto_8419 ?auto_8434 ) ) ( not ( = ?auto_8436 ?auto_8430 ) ) ( not ( = ?auto_8436 ?auto_8433 ) ) ( not ( = ?auto_8429 ?auto_8438 ) ) ( not ( = ?auto_8429 ?auto_8440 ) ) ( not ( = ?auto_8431 ?auto_8432 ) ) ( not ( = ?auto_8431 ?auto_8437 ) ) ( not ( = ?auto_8431 ?auto_8434 ) ) ( not ( = ?auto_8415 ?auto_8420 ) ) ( not ( = ?auto_8415 ?auto_8435 ) ) ( not ( = ?auto_8416 ?auto_8420 ) ) ( not ( = ?auto_8416 ?auto_8435 ) ) ( not ( = ?auto_8417 ?auto_8420 ) ) ( not ( = ?auto_8417 ?auto_8435 ) ) ( not ( = ?auto_8418 ?auto_8420 ) ) ( not ( = ?auto_8418 ?auto_8435 ) ) ( not ( = ?auto_8420 ?auto_8431 ) ) ( not ( = ?auto_8420 ?auto_8432 ) ) ( not ( = ?auto_8420 ?auto_8437 ) ) ( not ( = ?auto_8420 ?auto_8434 ) ) ( not ( = ?auto_8435 ?auto_8431 ) ) ( not ( = ?auto_8435 ?auto_8432 ) ) ( not ( = ?auto_8435 ?auto_8437 ) ) ( not ( = ?auto_8435 ?auto_8434 ) ) ( not ( = ?auto_8415 ?auto_8421 ) ) ( not ( = ?auto_8415 ?auto_8439 ) ) ( not ( = ?auto_8416 ?auto_8421 ) ) ( not ( = ?auto_8416 ?auto_8439 ) ) ( not ( = ?auto_8417 ?auto_8421 ) ) ( not ( = ?auto_8417 ?auto_8439 ) ) ( not ( = ?auto_8418 ?auto_8421 ) ) ( not ( = ?auto_8418 ?auto_8439 ) ) ( not ( = ?auto_8419 ?auto_8421 ) ) ( not ( = ?auto_8419 ?auto_8439 ) ) ( not ( = ?auto_8421 ?auto_8435 ) ) ( not ( = ?auto_8421 ?auto_8431 ) ) ( not ( = ?auto_8421 ?auto_8432 ) ) ( not ( = ?auto_8421 ?auto_8437 ) ) ( not ( = ?auto_8421 ?auto_8434 ) ) ( not ( = ?auto_8439 ?auto_8435 ) ) ( not ( = ?auto_8439 ?auto_8431 ) ) ( not ( = ?auto_8439 ?auto_8432 ) ) ( not ( = ?auto_8439 ?auto_8437 ) ) ( not ( = ?auto_8439 ?auto_8434 ) ) ( not ( = ?auto_8415 ?auto_8422 ) ) ( not ( = ?auto_8415 ?auto_8427 ) ) ( not ( = ?auto_8416 ?auto_8422 ) ) ( not ( = ?auto_8416 ?auto_8427 ) ) ( not ( = ?auto_8417 ?auto_8422 ) ) ( not ( = ?auto_8417 ?auto_8427 ) ) ( not ( = ?auto_8418 ?auto_8422 ) ) ( not ( = ?auto_8418 ?auto_8427 ) ) ( not ( = ?auto_8419 ?auto_8422 ) ) ( not ( = ?auto_8419 ?auto_8427 ) ) ( not ( = ?auto_8420 ?auto_8422 ) ) ( not ( = ?auto_8420 ?auto_8427 ) ) ( not ( = ?auto_8422 ?auto_8439 ) ) ( not ( = ?auto_8422 ?auto_8435 ) ) ( not ( = ?auto_8422 ?auto_8431 ) ) ( not ( = ?auto_8422 ?auto_8432 ) ) ( not ( = ?auto_8422 ?auto_8437 ) ) ( not ( = ?auto_8422 ?auto_8434 ) ) ( not ( = ?auto_8424 ?auto_8433 ) ) ( not ( = ?auto_8424 ?auto_8430 ) ) ( not ( = ?auto_8424 ?auto_8436 ) ) ( not ( = ?auto_8423 ?auto_8440 ) ) ( not ( = ?auto_8423 ?auto_8438 ) ) ( not ( = ?auto_8423 ?auto_8429 ) ) ( not ( = ?auto_8427 ?auto_8439 ) ) ( not ( = ?auto_8427 ?auto_8435 ) ) ( not ( = ?auto_8427 ?auto_8431 ) ) ( not ( = ?auto_8427 ?auto_8432 ) ) ( not ( = ?auto_8427 ?auto_8437 ) ) ( not ( = ?auto_8427 ?auto_8434 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8418 ?auto_8419 ?auto_8420 ?auto_8421 )
      ( MAKE-1CRATE ?auto_8421 ?auto_8422 )
      ( MAKE-7CRATE-VERIFY ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8418 ?auto_8419 ?auto_8420 ?auto_8421 ?auto_8422 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
      ?auto_8462 - SURFACE
      ?auto_8463 - SURFACE
      ?auto_8464 - SURFACE
      ?auto_8465 - SURFACE
      ?auto_8466 - SURFACE
      ?auto_8467 - SURFACE
      ?auto_8468 - SURFACE
    )
    :vars
    (
      ?auto_8469 - HOIST
      ?auto_8472 - PLACE
      ?auto_8471 - PLACE
      ?auto_8474 - HOIST
      ?auto_8473 - SURFACE
      ?auto_8481 - PLACE
      ?auto_8485 - HOIST
      ?auto_8482 - SURFACE
      ?auto_8480 - PLACE
      ?auto_8476 - HOIST
      ?auto_8488 - SURFACE
      ?auto_8477 - PLACE
      ?auto_8475 - HOIST
      ?auto_8478 - SURFACE
      ?auto_8489 - PLACE
      ?auto_8487 - HOIST
      ?auto_8484 - SURFACE
      ?auto_8479 - SURFACE
      ?auto_8486 - SURFACE
      ?auto_8483 - SURFACE
      ?auto_8470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8469 ?auto_8472 ) ( IS-CRATE ?auto_8468 ) ( not ( = ?auto_8471 ?auto_8472 ) ) ( HOIST-AT ?auto_8474 ?auto_8471 ) ( AVAILABLE ?auto_8474 ) ( SURFACE-AT ?auto_8468 ?auto_8471 ) ( ON ?auto_8468 ?auto_8473 ) ( CLEAR ?auto_8468 ) ( not ( = ?auto_8467 ?auto_8468 ) ) ( not ( = ?auto_8467 ?auto_8473 ) ) ( not ( = ?auto_8468 ?auto_8473 ) ) ( not ( = ?auto_8469 ?auto_8474 ) ) ( IS-CRATE ?auto_8467 ) ( not ( = ?auto_8481 ?auto_8472 ) ) ( HOIST-AT ?auto_8485 ?auto_8481 ) ( AVAILABLE ?auto_8485 ) ( SURFACE-AT ?auto_8467 ?auto_8481 ) ( ON ?auto_8467 ?auto_8482 ) ( CLEAR ?auto_8467 ) ( not ( = ?auto_8466 ?auto_8467 ) ) ( not ( = ?auto_8466 ?auto_8482 ) ) ( not ( = ?auto_8467 ?auto_8482 ) ) ( not ( = ?auto_8469 ?auto_8485 ) ) ( IS-CRATE ?auto_8466 ) ( not ( = ?auto_8480 ?auto_8472 ) ) ( HOIST-AT ?auto_8476 ?auto_8480 ) ( SURFACE-AT ?auto_8466 ?auto_8480 ) ( ON ?auto_8466 ?auto_8488 ) ( CLEAR ?auto_8466 ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8488 ) ) ( not ( = ?auto_8466 ?auto_8488 ) ) ( not ( = ?auto_8469 ?auto_8476 ) ) ( IS-CRATE ?auto_8465 ) ( not ( = ?auto_8477 ?auto_8472 ) ) ( HOIST-AT ?auto_8475 ?auto_8477 ) ( SURFACE-AT ?auto_8465 ?auto_8477 ) ( ON ?auto_8465 ?auto_8478 ) ( CLEAR ?auto_8465 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8478 ) ) ( not ( = ?auto_8465 ?auto_8478 ) ) ( not ( = ?auto_8469 ?auto_8475 ) ) ( IS-CRATE ?auto_8464 ) ( not ( = ?auto_8489 ?auto_8472 ) ) ( HOIST-AT ?auto_8487 ?auto_8489 ) ( AVAILABLE ?auto_8487 ) ( SURFACE-AT ?auto_8464 ?auto_8489 ) ( ON ?auto_8464 ?auto_8484 ) ( CLEAR ?auto_8464 ) ( not ( = ?auto_8463 ?auto_8464 ) ) ( not ( = ?auto_8463 ?auto_8484 ) ) ( not ( = ?auto_8464 ?auto_8484 ) ) ( not ( = ?auto_8469 ?auto_8487 ) ) ( IS-CRATE ?auto_8463 ) ( AVAILABLE ?auto_8475 ) ( SURFACE-AT ?auto_8463 ?auto_8477 ) ( ON ?auto_8463 ?auto_8479 ) ( CLEAR ?auto_8463 ) ( not ( = ?auto_8462 ?auto_8463 ) ) ( not ( = ?auto_8462 ?auto_8479 ) ) ( not ( = ?auto_8463 ?auto_8479 ) ) ( IS-CRATE ?auto_8462 ) ( SURFACE-AT ?auto_8462 ?auto_8480 ) ( ON ?auto_8462 ?auto_8486 ) ( CLEAR ?auto_8462 ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8486 ) ) ( not ( = ?auto_8462 ?auto_8486 ) ) ( SURFACE-AT ?auto_8460 ?auto_8472 ) ( CLEAR ?auto_8460 ) ( IS-CRATE ?auto_8461 ) ( AVAILABLE ?auto_8469 ) ( AVAILABLE ?auto_8476 ) ( SURFACE-AT ?auto_8461 ?auto_8480 ) ( ON ?auto_8461 ?auto_8483 ) ( CLEAR ?auto_8461 ) ( TRUCK-AT ?auto_8470 ?auto_8472 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8483 ) ) ( not ( = ?auto_8461 ?auto_8483 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8486 ) ) ( not ( = ?auto_8462 ?auto_8483 ) ) ( not ( = ?auto_8486 ?auto_8483 ) ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( not ( = ?auto_8460 ?auto_8479 ) ) ( not ( = ?auto_8461 ?auto_8463 ) ) ( not ( = ?auto_8461 ?auto_8479 ) ) ( not ( = ?auto_8463 ?auto_8486 ) ) ( not ( = ?auto_8463 ?auto_8483 ) ) ( not ( = ?auto_8477 ?auto_8480 ) ) ( not ( = ?auto_8475 ?auto_8476 ) ) ( not ( = ?auto_8479 ?auto_8486 ) ) ( not ( = ?auto_8479 ?auto_8483 ) ) ( not ( = ?auto_8460 ?auto_8464 ) ) ( not ( = ?auto_8460 ?auto_8484 ) ) ( not ( = ?auto_8461 ?auto_8464 ) ) ( not ( = ?auto_8461 ?auto_8484 ) ) ( not ( = ?auto_8462 ?auto_8464 ) ) ( not ( = ?auto_8462 ?auto_8484 ) ) ( not ( = ?auto_8464 ?auto_8479 ) ) ( not ( = ?auto_8464 ?auto_8486 ) ) ( not ( = ?auto_8464 ?auto_8483 ) ) ( not ( = ?auto_8489 ?auto_8477 ) ) ( not ( = ?auto_8489 ?auto_8480 ) ) ( not ( = ?auto_8487 ?auto_8475 ) ) ( not ( = ?auto_8487 ?auto_8476 ) ) ( not ( = ?auto_8484 ?auto_8479 ) ) ( not ( = ?auto_8484 ?auto_8486 ) ) ( not ( = ?auto_8484 ?auto_8483 ) ) ( not ( = ?auto_8460 ?auto_8465 ) ) ( not ( = ?auto_8460 ?auto_8478 ) ) ( not ( = ?auto_8461 ?auto_8465 ) ) ( not ( = ?auto_8461 ?auto_8478 ) ) ( not ( = ?auto_8462 ?auto_8465 ) ) ( not ( = ?auto_8462 ?auto_8478 ) ) ( not ( = ?auto_8463 ?auto_8465 ) ) ( not ( = ?auto_8463 ?auto_8478 ) ) ( not ( = ?auto_8465 ?auto_8484 ) ) ( not ( = ?auto_8465 ?auto_8479 ) ) ( not ( = ?auto_8465 ?auto_8486 ) ) ( not ( = ?auto_8465 ?auto_8483 ) ) ( not ( = ?auto_8478 ?auto_8484 ) ) ( not ( = ?auto_8478 ?auto_8479 ) ) ( not ( = ?auto_8478 ?auto_8486 ) ) ( not ( = ?auto_8478 ?auto_8483 ) ) ( not ( = ?auto_8460 ?auto_8466 ) ) ( not ( = ?auto_8460 ?auto_8488 ) ) ( not ( = ?auto_8461 ?auto_8466 ) ) ( not ( = ?auto_8461 ?auto_8488 ) ) ( not ( = ?auto_8462 ?auto_8466 ) ) ( not ( = ?auto_8462 ?auto_8488 ) ) ( not ( = ?auto_8463 ?auto_8466 ) ) ( not ( = ?auto_8463 ?auto_8488 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8488 ) ) ( not ( = ?auto_8466 ?auto_8478 ) ) ( not ( = ?auto_8466 ?auto_8484 ) ) ( not ( = ?auto_8466 ?auto_8479 ) ) ( not ( = ?auto_8466 ?auto_8486 ) ) ( not ( = ?auto_8466 ?auto_8483 ) ) ( not ( = ?auto_8488 ?auto_8478 ) ) ( not ( = ?auto_8488 ?auto_8484 ) ) ( not ( = ?auto_8488 ?auto_8479 ) ) ( not ( = ?auto_8488 ?auto_8486 ) ) ( not ( = ?auto_8488 ?auto_8483 ) ) ( not ( = ?auto_8460 ?auto_8467 ) ) ( not ( = ?auto_8460 ?auto_8482 ) ) ( not ( = ?auto_8461 ?auto_8467 ) ) ( not ( = ?auto_8461 ?auto_8482 ) ) ( not ( = ?auto_8462 ?auto_8467 ) ) ( not ( = ?auto_8462 ?auto_8482 ) ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( not ( = ?auto_8463 ?auto_8482 ) ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8464 ?auto_8482 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) ( not ( = ?auto_8465 ?auto_8482 ) ) ( not ( = ?auto_8467 ?auto_8488 ) ) ( not ( = ?auto_8467 ?auto_8478 ) ) ( not ( = ?auto_8467 ?auto_8484 ) ) ( not ( = ?auto_8467 ?auto_8479 ) ) ( not ( = ?auto_8467 ?auto_8486 ) ) ( not ( = ?auto_8467 ?auto_8483 ) ) ( not ( = ?auto_8481 ?auto_8480 ) ) ( not ( = ?auto_8481 ?auto_8477 ) ) ( not ( = ?auto_8481 ?auto_8489 ) ) ( not ( = ?auto_8485 ?auto_8476 ) ) ( not ( = ?auto_8485 ?auto_8475 ) ) ( not ( = ?auto_8485 ?auto_8487 ) ) ( not ( = ?auto_8482 ?auto_8488 ) ) ( not ( = ?auto_8482 ?auto_8478 ) ) ( not ( = ?auto_8482 ?auto_8484 ) ) ( not ( = ?auto_8482 ?auto_8479 ) ) ( not ( = ?auto_8482 ?auto_8486 ) ) ( not ( = ?auto_8482 ?auto_8483 ) ) ( not ( = ?auto_8460 ?auto_8468 ) ) ( not ( = ?auto_8460 ?auto_8473 ) ) ( not ( = ?auto_8461 ?auto_8468 ) ) ( not ( = ?auto_8461 ?auto_8473 ) ) ( not ( = ?auto_8462 ?auto_8468 ) ) ( not ( = ?auto_8462 ?auto_8473 ) ) ( not ( = ?auto_8463 ?auto_8468 ) ) ( not ( = ?auto_8463 ?auto_8473 ) ) ( not ( = ?auto_8464 ?auto_8468 ) ) ( not ( = ?auto_8464 ?auto_8473 ) ) ( not ( = ?auto_8465 ?auto_8468 ) ) ( not ( = ?auto_8465 ?auto_8473 ) ) ( not ( = ?auto_8466 ?auto_8468 ) ) ( not ( = ?auto_8466 ?auto_8473 ) ) ( not ( = ?auto_8468 ?auto_8482 ) ) ( not ( = ?auto_8468 ?auto_8488 ) ) ( not ( = ?auto_8468 ?auto_8478 ) ) ( not ( = ?auto_8468 ?auto_8484 ) ) ( not ( = ?auto_8468 ?auto_8479 ) ) ( not ( = ?auto_8468 ?auto_8486 ) ) ( not ( = ?auto_8468 ?auto_8483 ) ) ( not ( = ?auto_8471 ?auto_8481 ) ) ( not ( = ?auto_8471 ?auto_8480 ) ) ( not ( = ?auto_8471 ?auto_8477 ) ) ( not ( = ?auto_8471 ?auto_8489 ) ) ( not ( = ?auto_8474 ?auto_8485 ) ) ( not ( = ?auto_8474 ?auto_8476 ) ) ( not ( = ?auto_8474 ?auto_8475 ) ) ( not ( = ?auto_8474 ?auto_8487 ) ) ( not ( = ?auto_8473 ?auto_8482 ) ) ( not ( = ?auto_8473 ?auto_8488 ) ) ( not ( = ?auto_8473 ?auto_8478 ) ) ( not ( = ?auto_8473 ?auto_8484 ) ) ( not ( = ?auto_8473 ?auto_8479 ) ) ( not ( = ?auto_8473 ?auto_8486 ) ) ( not ( = ?auto_8473 ?auto_8483 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8466 ?auto_8467 )
      ( MAKE-1CRATE ?auto_8467 ?auto_8468 )
      ( MAKE-8CRATE-VERIFY ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8466 ?auto_8467 ?auto_8468 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8510 - SURFACE
      ?auto_8511 - SURFACE
      ?auto_8512 - SURFACE
      ?auto_8513 - SURFACE
      ?auto_8514 - SURFACE
      ?auto_8515 - SURFACE
      ?auto_8516 - SURFACE
      ?auto_8517 - SURFACE
      ?auto_8518 - SURFACE
      ?auto_8519 - SURFACE
    )
    :vars
    (
      ?auto_8523 - HOIST
      ?auto_8525 - PLACE
      ?auto_8524 - PLACE
      ?auto_8520 - HOIST
      ?auto_8521 - SURFACE
      ?auto_8528 - PLACE
      ?auto_8537 - HOIST
      ?auto_8530 - SURFACE
      ?auto_8539 - PLACE
      ?auto_8531 - HOIST
      ?auto_8542 - SURFACE
      ?auto_8543 - PLACE
      ?auto_8535 - HOIST
      ?auto_8541 - SURFACE
      ?auto_8533 - PLACE
      ?auto_8527 - HOIST
      ?auto_8534 - SURFACE
      ?auto_8538 - PLACE
      ?auto_8526 - HOIST
      ?auto_8540 - SURFACE
      ?auto_8529 - SURFACE
      ?auto_8536 - SURFACE
      ?auto_8532 - SURFACE
      ?auto_8522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8523 ?auto_8525 ) ( IS-CRATE ?auto_8519 ) ( not ( = ?auto_8524 ?auto_8525 ) ) ( HOIST-AT ?auto_8520 ?auto_8524 ) ( AVAILABLE ?auto_8520 ) ( SURFACE-AT ?auto_8519 ?auto_8524 ) ( ON ?auto_8519 ?auto_8521 ) ( CLEAR ?auto_8519 ) ( not ( = ?auto_8518 ?auto_8519 ) ) ( not ( = ?auto_8518 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( not ( = ?auto_8523 ?auto_8520 ) ) ( IS-CRATE ?auto_8518 ) ( not ( = ?auto_8528 ?auto_8525 ) ) ( HOIST-AT ?auto_8537 ?auto_8528 ) ( AVAILABLE ?auto_8537 ) ( SURFACE-AT ?auto_8518 ?auto_8528 ) ( ON ?auto_8518 ?auto_8530 ) ( CLEAR ?auto_8518 ) ( not ( = ?auto_8517 ?auto_8518 ) ) ( not ( = ?auto_8517 ?auto_8530 ) ) ( not ( = ?auto_8518 ?auto_8530 ) ) ( not ( = ?auto_8523 ?auto_8537 ) ) ( IS-CRATE ?auto_8517 ) ( not ( = ?auto_8539 ?auto_8525 ) ) ( HOIST-AT ?auto_8531 ?auto_8539 ) ( AVAILABLE ?auto_8531 ) ( SURFACE-AT ?auto_8517 ?auto_8539 ) ( ON ?auto_8517 ?auto_8542 ) ( CLEAR ?auto_8517 ) ( not ( = ?auto_8516 ?auto_8517 ) ) ( not ( = ?auto_8516 ?auto_8542 ) ) ( not ( = ?auto_8517 ?auto_8542 ) ) ( not ( = ?auto_8523 ?auto_8531 ) ) ( IS-CRATE ?auto_8516 ) ( not ( = ?auto_8543 ?auto_8525 ) ) ( HOIST-AT ?auto_8535 ?auto_8543 ) ( SURFACE-AT ?auto_8516 ?auto_8543 ) ( ON ?auto_8516 ?auto_8541 ) ( CLEAR ?auto_8516 ) ( not ( = ?auto_8515 ?auto_8516 ) ) ( not ( = ?auto_8515 ?auto_8541 ) ) ( not ( = ?auto_8516 ?auto_8541 ) ) ( not ( = ?auto_8523 ?auto_8535 ) ) ( IS-CRATE ?auto_8515 ) ( not ( = ?auto_8533 ?auto_8525 ) ) ( HOIST-AT ?auto_8527 ?auto_8533 ) ( SURFACE-AT ?auto_8515 ?auto_8533 ) ( ON ?auto_8515 ?auto_8534 ) ( CLEAR ?auto_8515 ) ( not ( = ?auto_8514 ?auto_8515 ) ) ( not ( = ?auto_8514 ?auto_8534 ) ) ( not ( = ?auto_8515 ?auto_8534 ) ) ( not ( = ?auto_8523 ?auto_8527 ) ) ( IS-CRATE ?auto_8514 ) ( not ( = ?auto_8538 ?auto_8525 ) ) ( HOIST-AT ?auto_8526 ?auto_8538 ) ( AVAILABLE ?auto_8526 ) ( SURFACE-AT ?auto_8514 ?auto_8538 ) ( ON ?auto_8514 ?auto_8540 ) ( CLEAR ?auto_8514 ) ( not ( = ?auto_8513 ?auto_8514 ) ) ( not ( = ?auto_8513 ?auto_8540 ) ) ( not ( = ?auto_8514 ?auto_8540 ) ) ( not ( = ?auto_8523 ?auto_8526 ) ) ( IS-CRATE ?auto_8513 ) ( AVAILABLE ?auto_8527 ) ( SURFACE-AT ?auto_8513 ?auto_8533 ) ( ON ?auto_8513 ?auto_8529 ) ( CLEAR ?auto_8513 ) ( not ( = ?auto_8512 ?auto_8513 ) ) ( not ( = ?auto_8512 ?auto_8529 ) ) ( not ( = ?auto_8513 ?auto_8529 ) ) ( IS-CRATE ?auto_8512 ) ( SURFACE-AT ?auto_8512 ?auto_8543 ) ( ON ?auto_8512 ?auto_8536 ) ( CLEAR ?auto_8512 ) ( not ( = ?auto_8511 ?auto_8512 ) ) ( not ( = ?auto_8511 ?auto_8536 ) ) ( not ( = ?auto_8512 ?auto_8536 ) ) ( SURFACE-AT ?auto_8510 ?auto_8525 ) ( CLEAR ?auto_8510 ) ( IS-CRATE ?auto_8511 ) ( AVAILABLE ?auto_8523 ) ( AVAILABLE ?auto_8535 ) ( SURFACE-AT ?auto_8511 ?auto_8543 ) ( ON ?auto_8511 ?auto_8532 ) ( CLEAR ?auto_8511 ) ( TRUCK-AT ?auto_8522 ?auto_8525 ) ( not ( = ?auto_8510 ?auto_8511 ) ) ( not ( = ?auto_8510 ?auto_8532 ) ) ( not ( = ?auto_8511 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8512 ) ) ( not ( = ?auto_8510 ?auto_8536 ) ) ( not ( = ?auto_8512 ?auto_8532 ) ) ( not ( = ?auto_8536 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8513 ) ) ( not ( = ?auto_8510 ?auto_8529 ) ) ( not ( = ?auto_8511 ?auto_8513 ) ) ( not ( = ?auto_8511 ?auto_8529 ) ) ( not ( = ?auto_8513 ?auto_8536 ) ) ( not ( = ?auto_8513 ?auto_8532 ) ) ( not ( = ?auto_8533 ?auto_8543 ) ) ( not ( = ?auto_8527 ?auto_8535 ) ) ( not ( = ?auto_8529 ?auto_8536 ) ) ( not ( = ?auto_8529 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8514 ) ) ( not ( = ?auto_8510 ?auto_8540 ) ) ( not ( = ?auto_8511 ?auto_8514 ) ) ( not ( = ?auto_8511 ?auto_8540 ) ) ( not ( = ?auto_8512 ?auto_8514 ) ) ( not ( = ?auto_8512 ?auto_8540 ) ) ( not ( = ?auto_8514 ?auto_8529 ) ) ( not ( = ?auto_8514 ?auto_8536 ) ) ( not ( = ?auto_8514 ?auto_8532 ) ) ( not ( = ?auto_8538 ?auto_8533 ) ) ( not ( = ?auto_8538 ?auto_8543 ) ) ( not ( = ?auto_8526 ?auto_8527 ) ) ( not ( = ?auto_8526 ?auto_8535 ) ) ( not ( = ?auto_8540 ?auto_8529 ) ) ( not ( = ?auto_8540 ?auto_8536 ) ) ( not ( = ?auto_8540 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8515 ) ) ( not ( = ?auto_8510 ?auto_8534 ) ) ( not ( = ?auto_8511 ?auto_8515 ) ) ( not ( = ?auto_8511 ?auto_8534 ) ) ( not ( = ?auto_8512 ?auto_8515 ) ) ( not ( = ?auto_8512 ?auto_8534 ) ) ( not ( = ?auto_8513 ?auto_8515 ) ) ( not ( = ?auto_8513 ?auto_8534 ) ) ( not ( = ?auto_8515 ?auto_8540 ) ) ( not ( = ?auto_8515 ?auto_8529 ) ) ( not ( = ?auto_8515 ?auto_8536 ) ) ( not ( = ?auto_8515 ?auto_8532 ) ) ( not ( = ?auto_8534 ?auto_8540 ) ) ( not ( = ?auto_8534 ?auto_8529 ) ) ( not ( = ?auto_8534 ?auto_8536 ) ) ( not ( = ?auto_8534 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8516 ) ) ( not ( = ?auto_8510 ?auto_8541 ) ) ( not ( = ?auto_8511 ?auto_8516 ) ) ( not ( = ?auto_8511 ?auto_8541 ) ) ( not ( = ?auto_8512 ?auto_8516 ) ) ( not ( = ?auto_8512 ?auto_8541 ) ) ( not ( = ?auto_8513 ?auto_8516 ) ) ( not ( = ?auto_8513 ?auto_8541 ) ) ( not ( = ?auto_8514 ?auto_8516 ) ) ( not ( = ?auto_8514 ?auto_8541 ) ) ( not ( = ?auto_8516 ?auto_8534 ) ) ( not ( = ?auto_8516 ?auto_8540 ) ) ( not ( = ?auto_8516 ?auto_8529 ) ) ( not ( = ?auto_8516 ?auto_8536 ) ) ( not ( = ?auto_8516 ?auto_8532 ) ) ( not ( = ?auto_8541 ?auto_8534 ) ) ( not ( = ?auto_8541 ?auto_8540 ) ) ( not ( = ?auto_8541 ?auto_8529 ) ) ( not ( = ?auto_8541 ?auto_8536 ) ) ( not ( = ?auto_8541 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8517 ) ) ( not ( = ?auto_8510 ?auto_8542 ) ) ( not ( = ?auto_8511 ?auto_8517 ) ) ( not ( = ?auto_8511 ?auto_8542 ) ) ( not ( = ?auto_8512 ?auto_8517 ) ) ( not ( = ?auto_8512 ?auto_8542 ) ) ( not ( = ?auto_8513 ?auto_8517 ) ) ( not ( = ?auto_8513 ?auto_8542 ) ) ( not ( = ?auto_8514 ?auto_8517 ) ) ( not ( = ?auto_8514 ?auto_8542 ) ) ( not ( = ?auto_8515 ?auto_8517 ) ) ( not ( = ?auto_8515 ?auto_8542 ) ) ( not ( = ?auto_8517 ?auto_8541 ) ) ( not ( = ?auto_8517 ?auto_8534 ) ) ( not ( = ?auto_8517 ?auto_8540 ) ) ( not ( = ?auto_8517 ?auto_8529 ) ) ( not ( = ?auto_8517 ?auto_8536 ) ) ( not ( = ?auto_8517 ?auto_8532 ) ) ( not ( = ?auto_8539 ?auto_8543 ) ) ( not ( = ?auto_8539 ?auto_8533 ) ) ( not ( = ?auto_8539 ?auto_8538 ) ) ( not ( = ?auto_8531 ?auto_8535 ) ) ( not ( = ?auto_8531 ?auto_8527 ) ) ( not ( = ?auto_8531 ?auto_8526 ) ) ( not ( = ?auto_8542 ?auto_8541 ) ) ( not ( = ?auto_8542 ?auto_8534 ) ) ( not ( = ?auto_8542 ?auto_8540 ) ) ( not ( = ?auto_8542 ?auto_8529 ) ) ( not ( = ?auto_8542 ?auto_8536 ) ) ( not ( = ?auto_8542 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8518 ) ) ( not ( = ?auto_8510 ?auto_8530 ) ) ( not ( = ?auto_8511 ?auto_8518 ) ) ( not ( = ?auto_8511 ?auto_8530 ) ) ( not ( = ?auto_8512 ?auto_8518 ) ) ( not ( = ?auto_8512 ?auto_8530 ) ) ( not ( = ?auto_8513 ?auto_8518 ) ) ( not ( = ?auto_8513 ?auto_8530 ) ) ( not ( = ?auto_8514 ?auto_8518 ) ) ( not ( = ?auto_8514 ?auto_8530 ) ) ( not ( = ?auto_8515 ?auto_8518 ) ) ( not ( = ?auto_8515 ?auto_8530 ) ) ( not ( = ?auto_8516 ?auto_8518 ) ) ( not ( = ?auto_8516 ?auto_8530 ) ) ( not ( = ?auto_8518 ?auto_8542 ) ) ( not ( = ?auto_8518 ?auto_8541 ) ) ( not ( = ?auto_8518 ?auto_8534 ) ) ( not ( = ?auto_8518 ?auto_8540 ) ) ( not ( = ?auto_8518 ?auto_8529 ) ) ( not ( = ?auto_8518 ?auto_8536 ) ) ( not ( = ?auto_8518 ?auto_8532 ) ) ( not ( = ?auto_8528 ?auto_8539 ) ) ( not ( = ?auto_8528 ?auto_8543 ) ) ( not ( = ?auto_8528 ?auto_8533 ) ) ( not ( = ?auto_8528 ?auto_8538 ) ) ( not ( = ?auto_8537 ?auto_8531 ) ) ( not ( = ?auto_8537 ?auto_8535 ) ) ( not ( = ?auto_8537 ?auto_8527 ) ) ( not ( = ?auto_8537 ?auto_8526 ) ) ( not ( = ?auto_8530 ?auto_8542 ) ) ( not ( = ?auto_8530 ?auto_8541 ) ) ( not ( = ?auto_8530 ?auto_8534 ) ) ( not ( = ?auto_8530 ?auto_8540 ) ) ( not ( = ?auto_8530 ?auto_8529 ) ) ( not ( = ?auto_8530 ?auto_8536 ) ) ( not ( = ?auto_8530 ?auto_8532 ) ) ( not ( = ?auto_8510 ?auto_8519 ) ) ( not ( = ?auto_8510 ?auto_8521 ) ) ( not ( = ?auto_8511 ?auto_8519 ) ) ( not ( = ?auto_8511 ?auto_8521 ) ) ( not ( = ?auto_8512 ?auto_8519 ) ) ( not ( = ?auto_8512 ?auto_8521 ) ) ( not ( = ?auto_8513 ?auto_8519 ) ) ( not ( = ?auto_8513 ?auto_8521 ) ) ( not ( = ?auto_8514 ?auto_8519 ) ) ( not ( = ?auto_8514 ?auto_8521 ) ) ( not ( = ?auto_8515 ?auto_8519 ) ) ( not ( = ?auto_8515 ?auto_8521 ) ) ( not ( = ?auto_8516 ?auto_8519 ) ) ( not ( = ?auto_8516 ?auto_8521 ) ) ( not ( = ?auto_8517 ?auto_8519 ) ) ( not ( = ?auto_8517 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8530 ) ) ( not ( = ?auto_8519 ?auto_8542 ) ) ( not ( = ?auto_8519 ?auto_8541 ) ) ( not ( = ?auto_8519 ?auto_8534 ) ) ( not ( = ?auto_8519 ?auto_8540 ) ) ( not ( = ?auto_8519 ?auto_8529 ) ) ( not ( = ?auto_8519 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8532 ) ) ( not ( = ?auto_8524 ?auto_8528 ) ) ( not ( = ?auto_8524 ?auto_8539 ) ) ( not ( = ?auto_8524 ?auto_8543 ) ) ( not ( = ?auto_8524 ?auto_8533 ) ) ( not ( = ?auto_8524 ?auto_8538 ) ) ( not ( = ?auto_8520 ?auto_8537 ) ) ( not ( = ?auto_8520 ?auto_8531 ) ) ( not ( = ?auto_8520 ?auto_8535 ) ) ( not ( = ?auto_8520 ?auto_8527 ) ) ( not ( = ?auto_8520 ?auto_8526 ) ) ( not ( = ?auto_8521 ?auto_8530 ) ) ( not ( = ?auto_8521 ?auto_8542 ) ) ( not ( = ?auto_8521 ?auto_8541 ) ) ( not ( = ?auto_8521 ?auto_8534 ) ) ( not ( = ?auto_8521 ?auto_8540 ) ) ( not ( = ?auto_8521 ?auto_8529 ) ) ( not ( = ?auto_8521 ?auto_8536 ) ) ( not ( = ?auto_8521 ?auto_8532 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8510 ?auto_8511 ?auto_8512 ?auto_8513 ?auto_8514 ?auto_8515 ?auto_8516 ?auto_8517 ?auto_8518 )
      ( MAKE-1CRATE ?auto_8518 ?auto_8519 )
      ( MAKE-9CRATE-VERIFY ?auto_8510 ?auto_8511 ?auto_8512 ?auto_8513 ?auto_8514 ?auto_8515 ?auto_8516 ?auto_8517 ?auto_8518 ?auto_8519 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8565 - SURFACE
      ?auto_8566 - SURFACE
      ?auto_8567 - SURFACE
      ?auto_8568 - SURFACE
      ?auto_8569 - SURFACE
      ?auto_8570 - SURFACE
      ?auto_8571 - SURFACE
      ?auto_8572 - SURFACE
      ?auto_8573 - SURFACE
      ?auto_8574 - SURFACE
      ?auto_8575 - SURFACE
    )
    :vars
    (
      ?auto_8580 - HOIST
      ?auto_8576 - PLACE
      ?auto_8578 - PLACE
      ?auto_8579 - HOIST
      ?auto_8577 - SURFACE
      ?auto_8588 - PLACE
      ?auto_8598 - HOIST
      ?auto_8594 - SURFACE
      ?auto_8583 - PLACE
      ?auto_8599 - HOIST
      ?auto_8591 - SURFACE
      ?auto_8589 - PLACE
      ?auto_8602 - HOIST
      ?auto_8601 - SURFACE
      ?auto_8586 - PLACE
      ?auto_8597 - HOIST
      ?auto_8596 - SURFACE
      ?auto_8585 - PLACE
      ?auto_8600 - HOIST
      ?auto_8593 - SURFACE
      ?auto_8582 - PLACE
      ?auto_8595 - HOIST
      ?auto_8590 - SURFACE
      ?auto_8587 - SURFACE
      ?auto_8584 - SURFACE
      ?auto_8592 - SURFACE
      ?auto_8581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8580 ?auto_8576 ) ( IS-CRATE ?auto_8575 ) ( not ( = ?auto_8578 ?auto_8576 ) ) ( HOIST-AT ?auto_8579 ?auto_8578 ) ( AVAILABLE ?auto_8579 ) ( SURFACE-AT ?auto_8575 ?auto_8578 ) ( ON ?auto_8575 ?auto_8577 ) ( CLEAR ?auto_8575 ) ( not ( = ?auto_8574 ?auto_8575 ) ) ( not ( = ?auto_8574 ?auto_8577 ) ) ( not ( = ?auto_8575 ?auto_8577 ) ) ( not ( = ?auto_8580 ?auto_8579 ) ) ( IS-CRATE ?auto_8574 ) ( not ( = ?auto_8588 ?auto_8576 ) ) ( HOIST-AT ?auto_8598 ?auto_8588 ) ( AVAILABLE ?auto_8598 ) ( SURFACE-AT ?auto_8574 ?auto_8588 ) ( ON ?auto_8574 ?auto_8594 ) ( CLEAR ?auto_8574 ) ( not ( = ?auto_8573 ?auto_8574 ) ) ( not ( = ?auto_8573 ?auto_8594 ) ) ( not ( = ?auto_8574 ?auto_8594 ) ) ( not ( = ?auto_8580 ?auto_8598 ) ) ( IS-CRATE ?auto_8573 ) ( not ( = ?auto_8583 ?auto_8576 ) ) ( HOIST-AT ?auto_8599 ?auto_8583 ) ( AVAILABLE ?auto_8599 ) ( SURFACE-AT ?auto_8573 ?auto_8583 ) ( ON ?auto_8573 ?auto_8591 ) ( CLEAR ?auto_8573 ) ( not ( = ?auto_8572 ?auto_8573 ) ) ( not ( = ?auto_8572 ?auto_8591 ) ) ( not ( = ?auto_8573 ?auto_8591 ) ) ( not ( = ?auto_8580 ?auto_8599 ) ) ( IS-CRATE ?auto_8572 ) ( not ( = ?auto_8589 ?auto_8576 ) ) ( HOIST-AT ?auto_8602 ?auto_8589 ) ( AVAILABLE ?auto_8602 ) ( SURFACE-AT ?auto_8572 ?auto_8589 ) ( ON ?auto_8572 ?auto_8601 ) ( CLEAR ?auto_8572 ) ( not ( = ?auto_8571 ?auto_8572 ) ) ( not ( = ?auto_8571 ?auto_8601 ) ) ( not ( = ?auto_8572 ?auto_8601 ) ) ( not ( = ?auto_8580 ?auto_8602 ) ) ( IS-CRATE ?auto_8571 ) ( not ( = ?auto_8586 ?auto_8576 ) ) ( HOIST-AT ?auto_8597 ?auto_8586 ) ( SURFACE-AT ?auto_8571 ?auto_8586 ) ( ON ?auto_8571 ?auto_8596 ) ( CLEAR ?auto_8571 ) ( not ( = ?auto_8570 ?auto_8571 ) ) ( not ( = ?auto_8570 ?auto_8596 ) ) ( not ( = ?auto_8571 ?auto_8596 ) ) ( not ( = ?auto_8580 ?auto_8597 ) ) ( IS-CRATE ?auto_8570 ) ( not ( = ?auto_8585 ?auto_8576 ) ) ( HOIST-AT ?auto_8600 ?auto_8585 ) ( SURFACE-AT ?auto_8570 ?auto_8585 ) ( ON ?auto_8570 ?auto_8593 ) ( CLEAR ?auto_8570 ) ( not ( = ?auto_8569 ?auto_8570 ) ) ( not ( = ?auto_8569 ?auto_8593 ) ) ( not ( = ?auto_8570 ?auto_8593 ) ) ( not ( = ?auto_8580 ?auto_8600 ) ) ( IS-CRATE ?auto_8569 ) ( not ( = ?auto_8582 ?auto_8576 ) ) ( HOIST-AT ?auto_8595 ?auto_8582 ) ( AVAILABLE ?auto_8595 ) ( SURFACE-AT ?auto_8569 ?auto_8582 ) ( ON ?auto_8569 ?auto_8590 ) ( CLEAR ?auto_8569 ) ( not ( = ?auto_8568 ?auto_8569 ) ) ( not ( = ?auto_8568 ?auto_8590 ) ) ( not ( = ?auto_8569 ?auto_8590 ) ) ( not ( = ?auto_8580 ?auto_8595 ) ) ( IS-CRATE ?auto_8568 ) ( AVAILABLE ?auto_8600 ) ( SURFACE-AT ?auto_8568 ?auto_8585 ) ( ON ?auto_8568 ?auto_8587 ) ( CLEAR ?auto_8568 ) ( not ( = ?auto_8567 ?auto_8568 ) ) ( not ( = ?auto_8567 ?auto_8587 ) ) ( not ( = ?auto_8568 ?auto_8587 ) ) ( IS-CRATE ?auto_8567 ) ( SURFACE-AT ?auto_8567 ?auto_8586 ) ( ON ?auto_8567 ?auto_8584 ) ( CLEAR ?auto_8567 ) ( not ( = ?auto_8566 ?auto_8567 ) ) ( not ( = ?auto_8566 ?auto_8584 ) ) ( not ( = ?auto_8567 ?auto_8584 ) ) ( SURFACE-AT ?auto_8565 ?auto_8576 ) ( CLEAR ?auto_8565 ) ( IS-CRATE ?auto_8566 ) ( AVAILABLE ?auto_8580 ) ( AVAILABLE ?auto_8597 ) ( SURFACE-AT ?auto_8566 ?auto_8586 ) ( ON ?auto_8566 ?auto_8592 ) ( CLEAR ?auto_8566 ) ( TRUCK-AT ?auto_8581 ?auto_8576 ) ( not ( = ?auto_8565 ?auto_8566 ) ) ( not ( = ?auto_8565 ?auto_8592 ) ) ( not ( = ?auto_8566 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8567 ) ) ( not ( = ?auto_8565 ?auto_8584 ) ) ( not ( = ?auto_8567 ?auto_8592 ) ) ( not ( = ?auto_8584 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8568 ) ) ( not ( = ?auto_8565 ?auto_8587 ) ) ( not ( = ?auto_8566 ?auto_8568 ) ) ( not ( = ?auto_8566 ?auto_8587 ) ) ( not ( = ?auto_8568 ?auto_8584 ) ) ( not ( = ?auto_8568 ?auto_8592 ) ) ( not ( = ?auto_8585 ?auto_8586 ) ) ( not ( = ?auto_8600 ?auto_8597 ) ) ( not ( = ?auto_8587 ?auto_8584 ) ) ( not ( = ?auto_8587 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8569 ) ) ( not ( = ?auto_8565 ?auto_8590 ) ) ( not ( = ?auto_8566 ?auto_8569 ) ) ( not ( = ?auto_8566 ?auto_8590 ) ) ( not ( = ?auto_8567 ?auto_8569 ) ) ( not ( = ?auto_8567 ?auto_8590 ) ) ( not ( = ?auto_8569 ?auto_8587 ) ) ( not ( = ?auto_8569 ?auto_8584 ) ) ( not ( = ?auto_8569 ?auto_8592 ) ) ( not ( = ?auto_8582 ?auto_8585 ) ) ( not ( = ?auto_8582 ?auto_8586 ) ) ( not ( = ?auto_8595 ?auto_8600 ) ) ( not ( = ?auto_8595 ?auto_8597 ) ) ( not ( = ?auto_8590 ?auto_8587 ) ) ( not ( = ?auto_8590 ?auto_8584 ) ) ( not ( = ?auto_8590 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8570 ) ) ( not ( = ?auto_8565 ?auto_8593 ) ) ( not ( = ?auto_8566 ?auto_8570 ) ) ( not ( = ?auto_8566 ?auto_8593 ) ) ( not ( = ?auto_8567 ?auto_8570 ) ) ( not ( = ?auto_8567 ?auto_8593 ) ) ( not ( = ?auto_8568 ?auto_8570 ) ) ( not ( = ?auto_8568 ?auto_8593 ) ) ( not ( = ?auto_8570 ?auto_8590 ) ) ( not ( = ?auto_8570 ?auto_8587 ) ) ( not ( = ?auto_8570 ?auto_8584 ) ) ( not ( = ?auto_8570 ?auto_8592 ) ) ( not ( = ?auto_8593 ?auto_8590 ) ) ( not ( = ?auto_8593 ?auto_8587 ) ) ( not ( = ?auto_8593 ?auto_8584 ) ) ( not ( = ?auto_8593 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8571 ) ) ( not ( = ?auto_8565 ?auto_8596 ) ) ( not ( = ?auto_8566 ?auto_8571 ) ) ( not ( = ?auto_8566 ?auto_8596 ) ) ( not ( = ?auto_8567 ?auto_8571 ) ) ( not ( = ?auto_8567 ?auto_8596 ) ) ( not ( = ?auto_8568 ?auto_8571 ) ) ( not ( = ?auto_8568 ?auto_8596 ) ) ( not ( = ?auto_8569 ?auto_8571 ) ) ( not ( = ?auto_8569 ?auto_8596 ) ) ( not ( = ?auto_8571 ?auto_8593 ) ) ( not ( = ?auto_8571 ?auto_8590 ) ) ( not ( = ?auto_8571 ?auto_8587 ) ) ( not ( = ?auto_8571 ?auto_8584 ) ) ( not ( = ?auto_8571 ?auto_8592 ) ) ( not ( = ?auto_8596 ?auto_8593 ) ) ( not ( = ?auto_8596 ?auto_8590 ) ) ( not ( = ?auto_8596 ?auto_8587 ) ) ( not ( = ?auto_8596 ?auto_8584 ) ) ( not ( = ?auto_8596 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8572 ) ) ( not ( = ?auto_8565 ?auto_8601 ) ) ( not ( = ?auto_8566 ?auto_8572 ) ) ( not ( = ?auto_8566 ?auto_8601 ) ) ( not ( = ?auto_8567 ?auto_8572 ) ) ( not ( = ?auto_8567 ?auto_8601 ) ) ( not ( = ?auto_8568 ?auto_8572 ) ) ( not ( = ?auto_8568 ?auto_8601 ) ) ( not ( = ?auto_8569 ?auto_8572 ) ) ( not ( = ?auto_8569 ?auto_8601 ) ) ( not ( = ?auto_8570 ?auto_8572 ) ) ( not ( = ?auto_8570 ?auto_8601 ) ) ( not ( = ?auto_8572 ?auto_8596 ) ) ( not ( = ?auto_8572 ?auto_8593 ) ) ( not ( = ?auto_8572 ?auto_8590 ) ) ( not ( = ?auto_8572 ?auto_8587 ) ) ( not ( = ?auto_8572 ?auto_8584 ) ) ( not ( = ?auto_8572 ?auto_8592 ) ) ( not ( = ?auto_8589 ?auto_8586 ) ) ( not ( = ?auto_8589 ?auto_8585 ) ) ( not ( = ?auto_8589 ?auto_8582 ) ) ( not ( = ?auto_8602 ?auto_8597 ) ) ( not ( = ?auto_8602 ?auto_8600 ) ) ( not ( = ?auto_8602 ?auto_8595 ) ) ( not ( = ?auto_8601 ?auto_8596 ) ) ( not ( = ?auto_8601 ?auto_8593 ) ) ( not ( = ?auto_8601 ?auto_8590 ) ) ( not ( = ?auto_8601 ?auto_8587 ) ) ( not ( = ?auto_8601 ?auto_8584 ) ) ( not ( = ?auto_8601 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8573 ) ) ( not ( = ?auto_8565 ?auto_8591 ) ) ( not ( = ?auto_8566 ?auto_8573 ) ) ( not ( = ?auto_8566 ?auto_8591 ) ) ( not ( = ?auto_8567 ?auto_8573 ) ) ( not ( = ?auto_8567 ?auto_8591 ) ) ( not ( = ?auto_8568 ?auto_8573 ) ) ( not ( = ?auto_8568 ?auto_8591 ) ) ( not ( = ?auto_8569 ?auto_8573 ) ) ( not ( = ?auto_8569 ?auto_8591 ) ) ( not ( = ?auto_8570 ?auto_8573 ) ) ( not ( = ?auto_8570 ?auto_8591 ) ) ( not ( = ?auto_8571 ?auto_8573 ) ) ( not ( = ?auto_8571 ?auto_8591 ) ) ( not ( = ?auto_8573 ?auto_8601 ) ) ( not ( = ?auto_8573 ?auto_8596 ) ) ( not ( = ?auto_8573 ?auto_8593 ) ) ( not ( = ?auto_8573 ?auto_8590 ) ) ( not ( = ?auto_8573 ?auto_8587 ) ) ( not ( = ?auto_8573 ?auto_8584 ) ) ( not ( = ?auto_8573 ?auto_8592 ) ) ( not ( = ?auto_8583 ?auto_8589 ) ) ( not ( = ?auto_8583 ?auto_8586 ) ) ( not ( = ?auto_8583 ?auto_8585 ) ) ( not ( = ?auto_8583 ?auto_8582 ) ) ( not ( = ?auto_8599 ?auto_8602 ) ) ( not ( = ?auto_8599 ?auto_8597 ) ) ( not ( = ?auto_8599 ?auto_8600 ) ) ( not ( = ?auto_8599 ?auto_8595 ) ) ( not ( = ?auto_8591 ?auto_8601 ) ) ( not ( = ?auto_8591 ?auto_8596 ) ) ( not ( = ?auto_8591 ?auto_8593 ) ) ( not ( = ?auto_8591 ?auto_8590 ) ) ( not ( = ?auto_8591 ?auto_8587 ) ) ( not ( = ?auto_8591 ?auto_8584 ) ) ( not ( = ?auto_8591 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8574 ) ) ( not ( = ?auto_8565 ?auto_8594 ) ) ( not ( = ?auto_8566 ?auto_8574 ) ) ( not ( = ?auto_8566 ?auto_8594 ) ) ( not ( = ?auto_8567 ?auto_8574 ) ) ( not ( = ?auto_8567 ?auto_8594 ) ) ( not ( = ?auto_8568 ?auto_8574 ) ) ( not ( = ?auto_8568 ?auto_8594 ) ) ( not ( = ?auto_8569 ?auto_8574 ) ) ( not ( = ?auto_8569 ?auto_8594 ) ) ( not ( = ?auto_8570 ?auto_8574 ) ) ( not ( = ?auto_8570 ?auto_8594 ) ) ( not ( = ?auto_8571 ?auto_8574 ) ) ( not ( = ?auto_8571 ?auto_8594 ) ) ( not ( = ?auto_8572 ?auto_8574 ) ) ( not ( = ?auto_8572 ?auto_8594 ) ) ( not ( = ?auto_8574 ?auto_8591 ) ) ( not ( = ?auto_8574 ?auto_8601 ) ) ( not ( = ?auto_8574 ?auto_8596 ) ) ( not ( = ?auto_8574 ?auto_8593 ) ) ( not ( = ?auto_8574 ?auto_8590 ) ) ( not ( = ?auto_8574 ?auto_8587 ) ) ( not ( = ?auto_8574 ?auto_8584 ) ) ( not ( = ?auto_8574 ?auto_8592 ) ) ( not ( = ?auto_8588 ?auto_8583 ) ) ( not ( = ?auto_8588 ?auto_8589 ) ) ( not ( = ?auto_8588 ?auto_8586 ) ) ( not ( = ?auto_8588 ?auto_8585 ) ) ( not ( = ?auto_8588 ?auto_8582 ) ) ( not ( = ?auto_8598 ?auto_8599 ) ) ( not ( = ?auto_8598 ?auto_8602 ) ) ( not ( = ?auto_8598 ?auto_8597 ) ) ( not ( = ?auto_8598 ?auto_8600 ) ) ( not ( = ?auto_8598 ?auto_8595 ) ) ( not ( = ?auto_8594 ?auto_8591 ) ) ( not ( = ?auto_8594 ?auto_8601 ) ) ( not ( = ?auto_8594 ?auto_8596 ) ) ( not ( = ?auto_8594 ?auto_8593 ) ) ( not ( = ?auto_8594 ?auto_8590 ) ) ( not ( = ?auto_8594 ?auto_8587 ) ) ( not ( = ?auto_8594 ?auto_8584 ) ) ( not ( = ?auto_8594 ?auto_8592 ) ) ( not ( = ?auto_8565 ?auto_8575 ) ) ( not ( = ?auto_8565 ?auto_8577 ) ) ( not ( = ?auto_8566 ?auto_8575 ) ) ( not ( = ?auto_8566 ?auto_8577 ) ) ( not ( = ?auto_8567 ?auto_8575 ) ) ( not ( = ?auto_8567 ?auto_8577 ) ) ( not ( = ?auto_8568 ?auto_8575 ) ) ( not ( = ?auto_8568 ?auto_8577 ) ) ( not ( = ?auto_8569 ?auto_8575 ) ) ( not ( = ?auto_8569 ?auto_8577 ) ) ( not ( = ?auto_8570 ?auto_8575 ) ) ( not ( = ?auto_8570 ?auto_8577 ) ) ( not ( = ?auto_8571 ?auto_8575 ) ) ( not ( = ?auto_8571 ?auto_8577 ) ) ( not ( = ?auto_8572 ?auto_8575 ) ) ( not ( = ?auto_8572 ?auto_8577 ) ) ( not ( = ?auto_8573 ?auto_8575 ) ) ( not ( = ?auto_8573 ?auto_8577 ) ) ( not ( = ?auto_8575 ?auto_8594 ) ) ( not ( = ?auto_8575 ?auto_8591 ) ) ( not ( = ?auto_8575 ?auto_8601 ) ) ( not ( = ?auto_8575 ?auto_8596 ) ) ( not ( = ?auto_8575 ?auto_8593 ) ) ( not ( = ?auto_8575 ?auto_8590 ) ) ( not ( = ?auto_8575 ?auto_8587 ) ) ( not ( = ?auto_8575 ?auto_8584 ) ) ( not ( = ?auto_8575 ?auto_8592 ) ) ( not ( = ?auto_8578 ?auto_8588 ) ) ( not ( = ?auto_8578 ?auto_8583 ) ) ( not ( = ?auto_8578 ?auto_8589 ) ) ( not ( = ?auto_8578 ?auto_8586 ) ) ( not ( = ?auto_8578 ?auto_8585 ) ) ( not ( = ?auto_8578 ?auto_8582 ) ) ( not ( = ?auto_8579 ?auto_8598 ) ) ( not ( = ?auto_8579 ?auto_8599 ) ) ( not ( = ?auto_8579 ?auto_8602 ) ) ( not ( = ?auto_8579 ?auto_8597 ) ) ( not ( = ?auto_8579 ?auto_8600 ) ) ( not ( = ?auto_8579 ?auto_8595 ) ) ( not ( = ?auto_8577 ?auto_8594 ) ) ( not ( = ?auto_8577 ?auto_8591 ) ) ( not ( = ?auto_8577 ?auto_8601 ) ) ( not ( = ?auto_8577 ?auto_8596 ) ) ( not ( = ?auto_8577 ?auto_8593 ) ) ( not ( = ?auto_8577 ?auto_8590 ) ) ( not ( = ?auto_8577 ?auto_8587 ) ) ( not ( = ?auto_8577 ?auto_8584 ) ) ( not ( = ?auto_8577 ?auto_8592 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8565 ?auto_8566 ?auto_8567 ?auto_8568 ?auto_8569 ?auto_8570 ?auto_8571 ?auto_8572 ?auto_8573 ?auto_8574 )
      ( MAKE-1CRATE ?auto_8574 ?auto_8575 )
      ( MAKE-10CRATE-VERIFY ?auto_8565 ?auto_8566 ?auto_8567 ?auto_8568 ?auto_8569 ?auto_8570 ?auto_8571 ?auto_8572 ?auto_8573 ?auto_8574 ?auto_8575 ) )
  )

)

