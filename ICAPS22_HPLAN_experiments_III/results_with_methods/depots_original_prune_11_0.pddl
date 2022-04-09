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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403380 - SURFACE
      ?auto_403381 - SURFACE
    )
    :vars
    (
      ?auto_403382 - HOIST
      ?auto_403383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403382 ?auto_403383 ) ( SURFACE-AT ?auto_403380 ?auto_403383 ) ( CLEAR ?auto_403380 ) ( LIFTING ?auto_403382 ?auto_403381 ) ( IS-CRATE ?auto_403381 ) ( not ( = ?auto_403380 ?auto_403381 ) ) )
    :subtasks
    ( ( !DROP ?auto_403382 ?auto_403381 ?auto_403380 ?auto_403383 )
      ( MAKE-1CRATE-VERIFY ?auto_403380 ?auto_403381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403384 - SURFACE
      ?auto_403385 - SURFACE
    )
    :vars
    (
      ?auto_403387 - HOIST
      ?auto_403386 - PLACE
      ?auto_403388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403387 ?auto_403386 ) ( SURFACE-AT ?auto_403384 ?auto_403386 ) ( CLEAR ?auto_403384 ) ( IS-CRATE ?auto_403385 ) ( not ( = ?auto_403384 ?auto_403385 ) ) ( TRUCK-AT ?auto_403388 ?auto_403386 ) ( AVAILABLE ?auto_403387 ) ( IN ?auto_403385 ?auto_403388 ) )
    :subtasks
    ( ( !UNLOAD ?auto_403387 ?auto_403385 ?auto_403388 ?auto_403386 )
      ( MAKE-1CRATE ?auto_403384 ?auto_403385 )
      ( MAKE-1CRATE-VERIFY ?auto_403384 ?auto_403385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403389 - SURFACE
      ?auto_403390 - SURFACE
    )
    :vars
    (
      ?auto_403391 - HOIST
      ?auto_403392 - PLACE
      ?auto_403393 - TRUCK
      ?auto_403394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403391 ?auto_403392 ) ( SURFACE-AT ?auto_403389 ?auto_403392 ) ( CLEAR ?auto_403389 ) ( IS-CRATE ?auto_403390 ) ( not ( = ?auto_403389 ?auto_403390 ) ) ( AVAILABLE ?auto_403391 ) ( IN ?auto_403390 ?auto_403393 ) ( TRUCK-AT ?auto_403393 ?auto_403394 ) ( not ( = ?auto_403394 ?auto_403392 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_403393 ?auto_403394 ?auto_403392 )
      ( MAKE-1CRATE ?auto_403389 ?auto_403390 )
      ( MAKE-1CRATE-VERIFY ?auto_403389 ?auto_403390 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403395 - SURFACE
      ?auto_403396 - SURFACE
    )
    :vars
    (
      ?auto_403397 - HOIST
      ?auto_403398 - PLACE
      ?auto_403399 - TRUCK
      ?auto_403400 - PLACE
      ?auto_403401 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403397 ?auto_403398 ) ( SURFACE-AT ?auto_403395 ?auto_403398 ) ( CLEAR ?auto_403395 ) ( IS-CRATE ?auto_403396 ) ( not ( = ?auto_403395 ?auto_403396 ) ) ( AVAILABLE ?auto_403397 ) ( TRUCK-AT ?auto_403399 ?auto_403400 ) ( not ( = ?auto_403400 ?auto_403398 ) ) ( HOIST-AT ?auto_403401 ?auto_403400 ) ( LIFTING ?auto_403401 ?auto_403396 ) ( not ( = ?auto_403397 ?auto_403401 ) ) )
    :subtasks
    ( ( !LOAD ?auto_403401 ?auto_403396 ?auto_403399 ?auto_403400 )
      ( MAKE-1CRATE ?auto_403395 ?auto_403396 )
      ( MAKE-1CRATE-VERIFY ?auto_403395 ?auto_403396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403402 - SURFACE
      ?auto_403403 - SURFACE
    )
    :vars
    (
      ?auto_403408 - HOIST
      ?auto_403405 - PLACE
      ?auto_403406 - TRUCK
      ?auto_403407 - PLACE
      ?auto_403404 - HOIST
      ?auto_403409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403408 ?auto_403405 ) ( SURFACE-AT ?auto_403402 ?auto_403405 ) ( CLEAR ?auto_403402 ) ( IS-CRATE ?auto_403403 ) ( not ( = ?auto_403402 ?auto_403403 ) ) ( AVAILABLE ?auto_403408 ) ( TRUCK-AT ?auto_403406 ?auto_403407 ) ( not ( = ?auto_403407 ?auto_403405 ) ) ( HOIST-AT ?auto_403404 ?auto_403407 ) ( not ( = ?auto_403408 ?auto_403404 ) ) ( AVAILABLE ?auto_403404 ) ( SURFACE-AT ?auto_403403 ?auto_403407 ) ( ON ?auto_403403 ?auto_403409 ) ( CLEAR ?auto_403403 ) ( not ( = ?auto_403402 ?auto_403409 ) ) ( not ( = ?auto_403403 ?auto_403409 ) ) )
    :subtasks
    ( ( !LIFT ?auto_403404 ?auto_403403 ?auto_403409 ?auto_403407 )
      ( MAKE-1CRATE ?auto_403402 ?auto_403403 )
      ( MAKE-1CRATE-VERIFY ?auto_403402 ?auto_403403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403410 - SURFACE
      ?auto_403411 - SURFACE
    )
    :vars
    (
      ?auto_403417 - HOIST
      ?auto_403414 - PLACE
      ?auto_403413 - PLACE
      ?auto_403415 - HOIST
      ?auto_403416 - SURFACE
      ?auto_403412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403417 ?auto_403414 ) ( SURFACE-AT ?auto_403410 ?auto_403414 ) ( CLEAR ?auto_403410 ) ( IS-CRATE ?auto_403411 ) ( not ( = ?auto_403410 ?auto_403411 ) ) ( AVAILABLE ?auto_403417 ) ( not ( = ?auto_403413 ?auto_403414 ) ) ( HOIST-AT ?auto_403415 ?auto_403413 ) ( not ( = ?auto_403417 ?auto_403415 ) ) ( AVAILABLE ?auto_403415 ) ( SURFACE-AT ?auto_403411 ?auto_403413 ) ( ON ?auto_403411 ?auto_403416 ) ( CLEAR ?auto_403411 ) ( not ( = ?auto_403410 ?auto_403416 ) ) ( not ( = ?auto_403411 ?auto_403416 ) ) ( TRUCK-AT ?auto_403412 ?auto_403414 ) )
    :subtasks
    ( ( !DRIVE ?auto_403412 ?auto_403414 ?auto_403413 )
      ( MAKE-1CRATE ?auto_403410 ?auto_403411 )
      ( MAKE-1CRATE-VERIFY ?auto_403410 ?auto_403411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403427 - SURFACE
      ?auto_403428 - SURFACE
      ?auto_403429 - SURFACE
    )
    :vars
    (
      ?auto_403430 - HOIST
      ?auto_403431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403430 ?auto_403431 ) ( SURFACE-AT ?auto_403428 ?auto_403431 ) ( CLEAR ?auto_403428 ) ( LIFTING ?auto_403430 ?auto_403429 ) ( IS-CRATE ?auto_403429 ) ( not ( = ?auto_403428 ?auto_403429 ) ) ( ON ?auto_403428 ?auto_403427 ) ( not ( = ?auto_403427 ?auto_403428 ) ) ( not ( = ?auto_403427 ?auto_403429 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403428 ?auto_403429 )
      ( MAKE-2CRATE-VERIFY ?auto_403427 ?auto_403428 ?auto_403429 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403437 - SURFACE
      ?auto_403438 - SURFACE
      ?auto_403439 - SURFACE
    )
    :vars
    (
      ?auto_403442 - HOIST
      ?auto_403441 - PLACE
      ?auto_403440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403442 ?auto_403441 ) ( SURFACE-AT ?auto_403438 ?auto_403441 ) ( CLEAR ?auto_403438 ) ( IS-CRATE ?auto_403439 ) ( not ( = ?auto_403438 ?auto_403439 ) ) ( TRUCK-AT ?auto_403440 ?auto_403441 ) ( AVAILABLE ?auto_403442 ) ( IN ?auto_403439 ?auto_403440 ) ( ON ?auto_403438 ?auto_403437 ) ( not ( = ?auto_403437 ?auto_403438 ) ) ( not ( = ?auto_403437 ?auto_403439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403438 ?auto_403439 )
      ( MAKE-2CRATE-VERIFY ?auto_403437 ?auto_403438 ?auto_403439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403443 - SURFACE
      ?auto_403444 - SURFACE
    )
    :vars
    (
      ?auto_403448 - HOIST
      ?auto_403445 - PLACE
      ?auto_403447 - TRUCK
      ?auto_403446 - SURFACE
      ?auto_403449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403448 ?auto_403445 ) ( SURFACE-AT ?auto_403443 ?auto_403445 ) ( CLEAR ?auto_403443 ) ( IS-CRATE ?auto_403444 ) ( not ( = ?auto_403443 ?auto_403444 ) ) ( AVAILABLE ?auto_403448 ) ( IN ?auto_403444 ?auto_403447 ) ( ON ?auto_403443 ?auto_403446 ) ( not ( = ?auto_403446 ?auto_403443 ) ) ( not ( = ?auto_403446 ?auto_403444 ) ) ( TRUCK-AT ?auto_403447 ?auto_403449 ) ( not ( = ?auto_403449 ?auto_403445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_403447 ?auto_403449 ?auto_403445 )
      ( MAKE-2CRATE ?auto_403446 ?auto_403443 ?auto_403444 )
      ( MAKE-1CRATE-VERIFY ?auto_403443 ?auto_403444 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403450 - SURFACE
      ?auto_403451 - SURFACE
      ?auto_403452 - SURFACE
    )
    :vars
    (
      ?auto_403454 - HOIST
      ?auto_403453 - PLACE
      ?auto_403456 - TRUCK
      ?auto_403455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403454 ?auto_403453 ) ( SURFACE-AT ?auto_403451 ?auto_403453 ) ( CLEAR ?auto_403451 ) ( IS-CRATE ?auto_403452 ) ( not ( = ?auto_403451 ?auto_403452 ) ) ( AVAILABLE ?auto_403454 ) ( IN ?auto_403452 ?auto_403456 ) ( ON ?auto_403451 ?auto_403450 ) ( not ( = ?auto_403450 ?auto_403451 ) ) ( not ( = ?auto_403450 ?auto_403452 ) ) ( TRUCK-AT ?auto_403456 ?auto_403455 ) ( not ( = ?auto_403455 ?auto_403453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403451 ?auto_403452 )
      ( MAKE-2CRATE-VERIFY ?auto_403450 ?auto_403451 ?auto_403452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403457 - SURFACE
      ?auto_403458 - SURFACE
    )
    :vars
    (
      ?auto_403461 - HOIST
      ?auto_403462 - PLACE
      ?auto_403460 - SURFACE
      ?auto_403459 - TRUCK
      ?auto_403463 - PLACE
      ?auto_403464 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403461 ?auto_403462 ) ( SURFACE-AT ?auto_403457 ?auto_403462 ) ( CLEAR ?auto_403457 ) ( IS-CRATE ?auto_403458 ) ( not ( = ?auto_403457 ?auto_403458 ) ) ( AVAILABLE ?auto_403461 ) ( ON ?auto_403457 ?auto_403460 ) ( not ( = ?auto_403460 ?auto_403457 ) ) ( not ( = ?auto_403460 ?auto_403458 ) ) ( TRUCK-AT ?auto_403459 ?auto_403463 ) ( not ( = ?auto_403463 ?auto_403462 ) ) ( HOIST-AT ?auto_403464 ?auto_403463 ) ( LIFTING ?auto_403464 ?auto_403458 ) ( not ( = ?auto_403461 ?auto_403464 ) ) )
    :subtasks
    ( ( !LOAD ?auto_403464 ?auto_403458 ?auto_403459 ?auto_403463 )
      ( MAKE-2CRATE ?auto_403460 ?auto_403457 ?auto_403458 )
      ( MAKE-1CRATE-VERIFY ?auto_403457 ?auto_403458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403465 - SURFACE
      ?auto_403466 - SURFACE
      ?auto_403467 - SURFACE
    )
    :vars
    (
      ?auto_403472 - HOIST
      ?auto_403468 - PLACE
      ?auto_403471 - TRUCK
      ?auto_403470 - PLACE
      ?auto_403469 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403472 ?auto_403468 ) ( SURFACE-AT ?auto_403466 ?auto_403468 ) ( CLEAR ?auto_403466 ) ( IS-CRATE ?auto_403467 ) ( not ( = ?auto_403466 ?auto_403467 ) ) ( AVAILABLE ?auto_403472 ) ( ON ?auto_403466 ?auto_403465 ) ( not ( = ?auto_403465 ?auto_403466 ) ) ( not ( = ?auto_403465 ?auto_403467 ) ) ( TRUCK-AT ?auto_403471 ?auto_403470 ) ( not ( = ?auto_403470 ?auto_403468 ) ) ( HOIST-AT ?auto_403469 ?auto_403470 ) ( LIFTING ?auto_403469 ?auto_403467 ) ( not ( = ?auto_403472 ?auto_403469 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403466 ?auto_403467 )
      ( MAKE-2CRATE-VERIFY ?auto_403465 ?auto_403466 ?auto_403467 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403473 - SURFACE
      ?auto_403474 - SURFACE
    )
    :vars
    (
      ?auto_403477 - HOIST
      ?auto_403479 - PLACE
      ?auto_403476 - SURFACE
      ?auto_403475 - TRUCK
      ?auto_403478 - PLACE
      ?auto_403480 - HOIST
      ?auto_403481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403477 ?auto_403479 ) ( SURFACE-AT ?auto_403473 ?auto_403479 ) ( CLEAR ?auto_403473 ) ( IS-CRATE ?auto_403474 ) ( not ( = ?auto_403473 ?auto_403474 ) ) ( AVAILABLE ?auto_403477 ) ( ON ?auto_403473 ?auto_403476 ) ( not ( = ?auto_403476 ?auto_403473 ) ) ( not ( = ?auto_403476 ?auto_403474 ) ) ( TRUCK-AT ?auto_403475 ?auto_403478 ) ( not ( = ?auto_403478 ?auto_403479 ) ) ( HOIST-AT ?auto_403480 ?auto_403478 ) ( not ( = ?auto_403477 ?auto_403480 ) ) ( AVAILABLE ?auto_403480 ) ( SURFACE-AT ?auto_403474 ?auto_403478 ) ( ON ?auto_403474 ?auto_403481 ) ( CLEAR ?auto_403474 ) ( not ( = ?auto_403473 ?auto_403481 ) ) ( not ( = ?auto_403474 ?auto_403481 ) ) ( not ( = ?auto_403476 ?auto_403481 ) ) )
    :subtasks
    ( ( !LIFT ?auto_403480 ?auto_403474 ?auto_403481 ?auto_403478 )
      ( MAKE-2CRATE ?auto_403476 ?auto_403473 ?auto_403474 )
      ( MAKE-1CRATE-VERIFY ?auto_403473 ?auto_403474 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403482 - SURFACE
      ?auto_403483 - SURFACE
      ?auto_403484 - SURFACE
    )
    :vars
    (
      ?auto_403489 - HOIST
      ?auto_403486 - PLACE
      ?auto_403487 - TRUCK
      ?auto_403485 - PLACE
      ?auto_403488 - HOIST
      ?auto_403490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403489 ?auto_403486 ) ( SURFACE-AT ?auto_403483 ?auto_403486 ) ( CLEAR ?auto_403483 ) ( IS-CRATE ?auto_403484 ) ( not ( = ?auto_403483 ?auto_403484 ) ) ( AVAILABLE ?auto_403489 ) ( ON ?auto_403483 ?auto_403482 ) ( not ( = ?auto_403482 ?auto_403483 ) ) ( not ( = ?auto_403482 ?auto_403484 ) ) ( TRUCK-AT ?auto_403487 ?auto_403485 ) ( not ( = ?auto_403485 ?auto_403486 ) ) ( HOIST-AT ?auto_403488 ?auto_403485 ) ( not ( = ?auto_403489 ?auto_403488 ) ) ( AVAILABLE ?auto_403488 ) ( SURFACE-AT ?auto_403484 ?auto_403485 ) ( ON ?auto_403484 ?auto_403490 ) ( CLEAR ?auto_403484 ) ( not ( = ?auto_403483 ?auto_403490 ) ) ( not ( = ?auto_403484 ?auto_403490 ) ) ( not ( = ?auto_403482 ?auto_403490 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403483 ?auto_403484 )
      ( MAKE-2CRATE-VERIFY ?auto_403482 ?auto_403483 ?auto_403484 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403491 - SURFACE
      ?auto_403492 - SURFACE
    )
    :vars
    (
      ?auto_403495 - HOIST
      ?auto_403493 - PLACE
      ?auto_403498 - SURFACE
      ?auto_403496 - PLACE
      ?auto_403499 - HOIST
      ?auto_403497 - SURFACE
      ?auto_403494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403495 ?auto_403493 ) ( SURFACE-AT ?auto_403491 ?auto_403493 ) ( CLEAR ?auto_403491 ) ( IS-CRATE ?auto_403492 ) ( not ( = ?auto_403491 ?auto_403492 ) ) ( AVAILABLE ?auto_403495 ) ( ON ?auto_403491 ?auto_403498 ) ( not ( = ?auto_403498 ?auto_403491 ) ) ( not ( = ?auto_403498 ?auto_403492 ) ) ( not ( = ?auto_403496 ?auto_403493 ) ) ( HOIST-AT ?auto_403499 ?auto_403496 ) ( not ( = ?auto_403495 ?auto_403499 ) ) ( AVAILABLE ?auto_403499 ) ( SURFACE-AT ?auto_403492 ?auto_403496 ) ( ON ?auto_403492 ?auto_403497 ) ( CLEAR ?auto_403492 ) ( not ( = ?auto_403491 ?auto_403497 ) ) ( not ( = ?auto_403492 ?auto_403497 ) ) ( not ( = ?auto_403498 ?auto_403497 ) ) ( TRUCK-AT ?auto_403494 ?auto_403493 ) )
    :subtasks
    ( ( !DRIVE ?auto_403494 ?auto_403493 ?auto_403496 )
      ( MAKE-2CRATE ?auto_403498 ?auto_403491 ?auto_403492 )
      ( MAKE-1CRATE-VERIFY ?auto_403491 ?auto_403492 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403500 - SURFACE
      ?auto_403501 - SURFACE
      ?auto_403502 - SURFACE
    )
    :vars
    (
      ?auto_403508 - HOIST
      ?auto_403504 - PLACE
      ?auto_403505 - PLACE
      ?auto_403506 - HOIST
      ?auto_403503 - SURFACE
      ?auto_403507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403508 ?auto_403504 ) ( SURFACE-AT ?auto_403501 ?auto_403504 ) ( CLEAR ?auto_403501 ) ( IS-CRATE ?auto_403502 ) ( not ( = ?auto_403501 ?auto_403502 ) ) ( AVAILABLE ?auto_403508 ) ( ON ?auto_403501 ?auto_403500 ) ( not ( = ?auto_403500 ?auto_403501 ) ) ( not ( = ?auto_403500 ?auto_403502 ) ) ( not ( = ?auto_403505 ?auto_403504 ) ) ( HOIST-AT ?auto_403506 ?auto_403505 ) ( not ( = ?auto_403508 ?auto_403506 ) ) ( AVAILABLE ?auto_403506 ) ( SURFACE-AT ?auto_403502 ?auto_403505 ) ( ON ?auto_403502 ?auto_403503 ) ( CLEAR ?auto_403502 ) ( not ( = ?auto_403501 ?auto_403503 ) ) ( not ( = ?auto_403502 ?auto_403503 ) ) ( not ( = ?auto_403500 ?auto_403503 ) ) ( TRUCK-AT ?auto_403507 ?auto_403504 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403501 ?auto_403502 )
      ( MAKE-2CRATE-VERIFY ?auto_403500 ?auto_403501 ?auto_403502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403509 - SURFACE
      ?auto_403510 - SURFACE
    )
    :vars
    (
      ?auto_403514 - HOIST
      ?auto_403513 - PLACE
      ?auto_403515 - SURFACE
      ?auto_403512 - PLACE
      ?auto_403516 - HOIST
      ?auto_403511 - SURFACE
      ?auto_403517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403514 ?auto_403513 ) ( IS-CRATE ?auto_403510 ) ( not ( = ?auto_403509 ?auto_403510 ) ) ( not ( = ?auto_403515 ?auto_403509 ) ) ( not ( = ?auto_403515 ?auto_403510 ) ) ( not ( = ?auto_403512 ?auto_403513 ) ) ( HOIST-AT ?auto_403516 ?auto_403512 ) ( not ( = ?auto_403514 ?auto_403516 ) ) ( AVAILABLE ?auto_403516 ) ( SURFACE-AT ?auto_403510 ?auto_403512 ) ( ON ?auto_403510 ?auto_403511 ) ( CLEAR ?auto_403510 ) ( not ( = ?auto_403509 ?auto_403511 ) ) ( not ( = ?auto_403510 ?auto_403511 ) ) ( not ( = ?auto_403515 ?auto_403511 ) ) ( TRUCK-AT ?auto_403517 ?auto_403513 ) ( SURFACE-AT ?auto_403515 ?auto_403513 ) ( CLEAR ?auto_403515 ) ( LIFTING ?auto_403514 ?auto_403509 ) ( IS-CRATE ?auto_403509 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403515 ?auto_403509 )
      ( MAKE-2CRATE ?auto_403515 ?auto_403509 ?auto_403510 )
      ( MAKE-1CRATE-VERIFY ?auto_403509 ?auto_403510 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403518 - SURFACE
      ?auto_403519 - SURFACE
      ?auto_403520 - SURFACE
    )
    :vars
    (
      ?auto_403524 - HOIST
      ?auto_403521 - PLACE
      ?auto_403526 - PLACE
      ?auto_403525 - HOIST
      ?auto_403522 - SURFACE
      ?auto_403523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403524 ?auto_403521 ) ( IS-CRATE ?auto_403520 ) ( not ( = ?auto_403519 ?auto_403520 ) ) ( not ( = ?auto_403518 ?auto_403519 ) ) ( not ( = ?auto_403518 ?auto_403520 ) ) ( not ( = ?auto_403526 ?auto_403521 ) ) ( HOIST-AT ?auto_403525 ?auto_403526 ) ( not ( = ?auto_403524 ?auto_403525 ) ) ( AVAILABLE ?auto_403525 ) ( SURFACE-AT ?auto_403520 ?auto_403526 ) ( ON ?auto_403520 ?auto_403522 ) ( CLEAR ?auto_403520 ) ( not ( = ?auto_403519 ?auto_403522 ) ) ( not ( = ?auto_403520 ?auto_403522 ) ) ( not ( = ?auto_403518 ?auto_403522 ) ) ( TRUCK-AT ?auto_403523 ?auto_403521 ) ( SURFACE-AT ?auto_403518 ?auto_403521 ) ( CLEAR ?auto_403518 ) ( LIFTING ?auto_403524 ?auto_403519 ) ( IS-CRATE ?auto_403519 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403519 ?auto_403520 )
      ( MAKE-2CRATE-VERIFY ?auto_403518 ?auto_403519 ?auto_403520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403527 - SURFACE
      ?auto_403528 - SURFACE
    )
    :vars
    (
      ?auto_403533 - HOIST
      ?auto_403532 - PLACE
      ?auto_403530 - SURFACE
      ?auto_403534 - PLACE
      ?auto_403531 - HOIST
      ?auto_403529 - SURFACE
      ?auto_403535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403533 ?auto_403532 ) ( IS-CRATE ?auto_403528 ) ( not ( = ?auto_403527 ?auto_403528 ) ) ( not ( = ?auto_403530 ?auto_403527 ) ) ( not ( = ?auto_403530 ?auto_403528 ) ) ( not ( = ?auto_403534 ?auto_403532 ) ) ( HOIST-AT ?auto_403531 ?auto_403534 ) ( not ( = ?auto_403533 ?auto_403531 ) ) ( AVAILABLE ?auto_403531 ) ( SURFACE-AT ?auto_403528 ?auto_403534 ) ( ON ?auto_403528 ?auto_403529 ) ( CLEAR ?auto_403528 ) ( not ( = ?auto_403527 ?auto_403529 ) ) ( not ( = ?auto_403528 ?auto_403529 ) ) ( not ( = ?auto_403530 ?auto_403529 ) ) ( TRUCK-AT ?auto_403535 ?auto_403532 ) ( SURFACE-AT ?auto_403530 ?auto_403532 ) ( CLEAR ?auto_403530 ) ( IS-CRATE ?auto_403527 ) ( AVAILABLE ?auto_403533 ) ( IN ?auto_403527 ?auto_403535 ) )
    :subtasks
    ( ( !UNLOAD ?auto_403533 ?auto_403527 ?auto_403535 ?auto_403532 )
      ( MAKE-2CRATE ?auto_403530 ?auto_403527 ?auto_403528 )
      ( MAKE-1CRATE-VERIFY ?auto_403527 ?auto_403528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403536 - SURFACE
      ?auto_403537 - SURFACE
      ?auto_403538 - SURFACE
    )
    :vars
    (
      ?auto_403543 - HOIST
      ?auto_403539 - PLACE
      ?auto_403541 - PLACE
      ?auto_403540 - HOIST
      ?auto_403544 - SURFACE
      ?auto_403542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403543 ?auto_403539 ) ( IS-CRATE ?auto_403538 ) ( not ( = ?auto_403537 ?auto_403538 ) ) ( not ( = ?auto_403536 ?auto_403537 ) ) ( not ( = ?auto_403536 ?auto_403538 ) ) ( not ( = ?auto_403541 ?auto_403539 ) ) ( HOIST-AT ?auto_403540 ?auto_403541 ) ( not ( = ?auto_403543 ?auto_403540 ) ) ( AVAILABLE ?auto_403540 ) ( SURFACE-AT ?auto_403538 ?auto_403541 ) ( ON ?auto_403538 ?auto_403544 ) ( CLEAR ?auto_403538 ) ( not ( = ?auto_403537 ?auto_403544 ) ) ( not ( = ?auto_403538 ?auto_403544 ) ) ( not ( = ?auto_403536 ?auto_403544 ) ) ( TRUCK-AT ?auto_403542 ?auto_403539 ) ( SURFACE-AT ?auto_403536 ?auto_403539 ) ( CLEAR ?auto_403536 ) ( IS-CRATE ?auto_403537 ) ( AVAILABLE ?auto_403543 ) ( IN ?auto_403537 ?auto_403542 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403537 ?auto_403538 )
      ( MAKE-2CRATE-VERIFY ?auto_403536 ?auto_403537 ?auto_403538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403581 - SURFACE
      ?auto_403582 - SURFACE
    )
    :vars
    (
      ?auto_403586 - HOIST
      ?auto_403585 - PLACE
      ?auto_403588 - SURFACE
      ?auto_403589 - PLACE
      ?auto_403584 - HOIST
      ?auto_403587 - SURFACE
      ?auto_403583 - TRUCK
      ?auto_403590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403586 ?auto_403585 ) ( SURFACE-AT ?auto_403581 ?auto_403585 ) ( CLEAR ?auto_403581 ) ( IS-CRATE ?auto_403582 ) ( not ( = ?auto_403581 ?auto_403582 ) ) ( AVAILABLE ?auto_403586 ) ( ON ?auto_403581 ?auto_403588 ) ( not ( = ?auto_403588 ?auto_403581 ) ) ( not ( = ?auto_403588 ?auto_403582 ) ) ( not ( = ?auto_403589 ?auto_403585 ) ) ( HOIST-AT ?auto_403584 ?auto_403589 ) ( not ( = ?auto_403586 ?auto_403584 ) ) ( AVAILABLE ?auto_403584 ) ( SURFACE-AT ?auto_403582 ?auto_403589 ) ( ON ?auto_403582 ?auto_403587 ) ( CLEAR ?auto_403582 ) ( not ( = ?auto_403581 ?auto_403587 ) ) ( not ( = ?auto_403582 ?auto_403587 ) ) ( not ( = ?auto_403588 ?auto_403587 ) ) ( TRUCK-AT ?auto_403583 ?auto_403590 ) ( not ( = ?auto_403590 ?auto_403585 ) ) ( not ( = ?auto_403589 ?auto_403590 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_403583 ?auto_403590 ?auto_403585 )
      ( MAKE-1CRATE ?auto_403581 ?auto_403582 )
      ( MAKE-1CRATE-VERIFY ?auto_403581 ?auto_403582 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403620 - SURFACE
      ?auto_403621 - SURFACE
      ?auto_403622 - SURFACE
      ?auto_403623 - SURFACE
    )
    :vars
    (
      ?auto_403625 - HOIST
      ?auto_403624 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403625 ?auto_403624 ) ( SURFACE-AT ?auto_403622 ?auto_403624 ) ( CLEAR ?auto_403622 ) ( LIFTING ?auto_403625 ?auto_403623 ) ( IS-CRATE ?auto_403623 ) ( not ( = ?auto_403622 ?auto_403623 ) ) ( ON ?auto_403621 ?auto_403620 ) ( ON ?auto_403622 ?auto_403621 ) ( not ( = ?auto_403620 ?auto_403621 ) ) ( not ( = ?auto_403620 ?auto_403622 ) ) ( not ( = ?auto_403620 ?auto_403623 ) ) ( not ( = ?auto_403621 ?auto_403622 ) ) ( not ( = ?auto_403621 ?auto_403623 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403622 ?auto_403623 )
      ( MAKE-3CRATE-VERIFY ?auto_403620 ?auto_403621 ?auto_403622 ?auto_403623 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403637 - SURFACE
      ?auto_403638 - SURFACE
      ?auto_403639 - SURFACE
      ?auto_403640 - SURFACE
    )
    :vars
    (
      ?auto_403642 - HOIST
      ?auto_403643 - PLACE
      ?auto_403641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403642 ?auto_403643 ) ( SURFACE-AT ?auto_403639 ?auto_403643 ) ( CLEAR ?auto_403639 ) ( IS-CRATE ?auto_403640 ) ( not ( = ?auto_403639 ?auto_403640 ) ) ( TRUCK-AT ?auto_403641 ?auto_403643 ) ( AVAILABLE ?auto_403642 ) ( IN ?auto_403640 ?auto_403641 ) ( ON ?auto_403639 ?auto_403638 ) ( not ( = ?auto_403638 ?auto_403639 ) ) ( not ( = ?auto_403638 ?auto_403640 ) ) ( ON ?auto_403638 ?auto_403637 ) ( not ( = ?auto_403637 ?auto_403638 ) ) ( not ( = ?auto_403637 ?auto_403639 ) ) ( not ( = ?auto_403637 ?auto_403640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403638 ?auto_403639 ?auto_403640 )
      ( MAKE-3CRATE-VERIFY ?auto_403637 ?auto_403638 ?auto_403639 ?auto_403640 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403658 - SURFACE
      ?auto_403659 - SURFACE
      ?auto_403660 - SURFACE
      ?auto_403661 - SURFACE
    )
    :vars
    (
      ?auto_403664 - HOIST
      ?auto_403663 - PLACE
      ?auto_403662 - TRUCK
      ?auto_403665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403664 ?auto_403663 ) ( SURFACE-AT ?auto_403660 ?auto_403663 ) ( CLEAR ?auto_403660 ) ( IS-CRATE ?auto_403661 ) ( not ( = ?auto_403660 ?auto_403661 ) ) ( AVAILABLE ?auto_403664 ) ( IN ?auto_403661 ?auto_403662 ) ( ON ?auto_403660 ?auto_403659 ) ( not ( = ?auto_403659 ?auto_403660 ) ) ( not ( = ?auto_403659 ?auto_403661 ) ) ( TRUCK-AT ?auto_403662 ?auto_403665 ) ( not ( = ?auto_403665 ?auto_403663 ) ) ( ON ?auto_403659 ?auto_403658 ) ( not ( = ?auto_403658 ?auto_403659 ) ) ( not ( = ?auto_403658 ?auto_403660 ) ) ( not ( = ?auto_403658 ?auto_403661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403659 ?auto_403660 ?auto_403661 )
      ( MAKE-3CRATE-VERIFY ?auto_403658 ?auto_403659 ?auto_403660 ?auto_403661 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403682 - SURFACE
      ?auto_403683 - SURFACE
      ?auto_403684 - SURFACE
      ?auto_403685 - SURFACE
    )
    :vars
    (
      ?auto_403687 - HOIST
      ?auto_403686 - PLACE
      ?auto_403689 - TRUCK
      ?auto_403688 - PLACE
      ?auto_403690 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403687 ?auto_403686 ) ( SURFACE-AT ?auto_403684 ?auto_403686 ) ( CLEAR ?auto_403684 ) ( IS-CRATE ?auto_403685 ) ( not ( = ?auto_403684 ?auto_403685 ) ) ( AVAILABLE ?auto_403687 ) ( ON ?auto_403684 ?auto_403683 ) ( not ( = ?auto_403683 ?auto_403684 ) ) ( not ( = ?auto_403683 ?auto_403685 ) ) ( TRUCK-AT ?auto_403689 ?auto_403688 ) ( not ( = ?auto_403688 ?auto_403686 ) ) ( HOIST-AT ?auto_403690 ?auto_403688 ) ( LIFTING ?auto_403690 ?auto_403685 ) ( not ( = ?auto_403687 ?auto_403690 ) ) ( ON ?auto_403683 ?auto_403682 ) ( not ( = ?auto_403682 ?auto_403683 ) ) ( not ( = ?auto_403682 ?auto_403684 ) ) ( not ( = ?auto_403682 ?auto_403685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403683 ?auto_403684 ?auto_403685 )
      ( MAKE-3CRATE-VERIFY ?auto_403682 ?auto_403683 ?auto_403684 ?auto_403685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403709 - SURFACE
      ?auto_403710 - SURFACE
      ?auto_403711 - SURFACE
      ?auto_403712 - SURFACE
    )
    :vars
    (
      ?auto_403713 - HOIST
      ?auto_403716 - PLACE
      ?auto_403715 - TRUCK
      ?auto_403718 - PLACE
      ?auto_403717 - HOIST
      ?auto_403714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403713 ?auto_403716 ) ( SURFACE-AT ?auto_403711 ?auto_403716 ) ( CLEAR ?auto_403711 ) ( IS-CRATE ?auto_403712 ) ( not ( = ?auto_403711 ?auto_403712 ) ) ( AVAILABLE ?auto_403713 ) ( ON ?auto_403711 ?auto_403710 ) ( not ( = ?auto_403710 ?auto_403711 ) ) ( not ( = ?auto_403710 ?auto_403712 ) ) ( TRUCK-AT ?auto_403715 ?auto_403718 ) ( not ( = ?auto_403718 ?auto_403716 ) ) ( HOIST-AT ?auto_403717 ?auto_403718 ) ( not ( = ?auto_403713 ?auto_403717 ) ) ( AVAILABLE ?auto_403717 ) ( SURFACE-AT ?auto_403712 ?auto_403718 ) ( ON ?auto_403712 ?auto_403714 ) ( CLEAR ?auto_403712 ) ( not ( = ?auto_403711 ?auto_403714 ) ) ( not ( = ?auto_403712 ?auto_403714 ) ) ( not ( = ?auto_403710 ?auto_403714 ) ) ( ON ?auto_403710 ?auto_403709 ) ( not ( = ?auto_403709 ?auto_403710 ) ) ( not ( = ?auto_403709 ?auto_403711 ) ) ( not ( = ?auto_403709 ?auto_403712 ) ) ( not ( = ?auto_403709 ?auto_403714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403710 ?auto_403711 ?auto_403712 )
      ( MAKE-3CRATE-VERIFY ?auto_403709 ?auto_403710 ?auto_403711 ?auto_403712 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403737 - SURFACE
      ?auto_403738 - SURFACE
      ?auto_403739 - SURFACE
      ?auto_403740 - SURFACE
    )
    :vars
    (
      ?auto_403745 - HOIST
      ?auto_403744 - PLACE
      ?auto_403743 - PLACE
      ?auto_403741 - HOIST
      ?auto_403742 - SURFACE
      ?auto_403746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403745 ?auto_403744 ) ( SURFACE-AT ?auto_403739 ?auto_403744 ) ( CLEAR ?auto_403739 ) ( IS-CRATE ?auto_403740 ) ( not ( = ?auto_403739 ?auto_403740 ) ) ( AVAILABLE ?auto_403745 ) ( ON ?auto_403739 ?auto_403738 ) ( not ( = ?auto_403738 ?auto_403739 ) ) ( not ( = ?auto_403738 ?auto_403740 ) ) ( not ( = ?auto_403743 ?auto_403744 ) ) ( HOIST-AT ?auto_403741 ?auto_403743 ) ( not ( = ?auto_403745 ?auto_403741 ) ) ( AVAILABLE ?auto_403741 ) ( SURFACE-AT ?auto_403740 ?auto_403743 ) ( ON ?auto_403740 ?auto_403742 ) ( CLEAR ?auto_403740 ) ( not ( = ?auto_403739 ?auto_403742 ) ) ( not ( = ?auto_403740 ?auto_403742 ) ) ( not ( = ?auto_403738 ?auto_403742 ) ) ( TRUCK-AT ?auto_403746 ?auto_403744 ) ( ON ?auto_403738 ?auto_403737 ) ( not ( = ?auto_403737 ?auto_403738 ) ) ( not ( = ?auto_403737 ?auto_403739 ) ) ( not ( = ?auto_403737 ?auto_403740 ) ) ( not ( = ?auto_403737 ?auto_403742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403738 ?auto_403739 ?auto_403740 )
      ( MAKE-3CRATE-VERIFY ?auto_403737 ?auto_403738 ?auto_403739 ?auto_403740 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403765 - SURFACE
      ?auto_403766 - SURFACE
      ?auto_403767 - SURFACE
      ?auto_403768 - SURFACE
    )
    :vars
    (
      ?auto_403770 - HOIST
      ?auto_403772 - PLACE
      ?auto_403771 - PLACE
      ?auto_403773 - HOIST
      ?auto_403769 - SURFACE
      ?auto_403774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403770 ?auto_403772 ) ( IS-CRATE ?auto_403768 ) ( not ( = ?auto_403767 ?auto_403768 ) ) ( not ( = ?auto_403766 ?auto_403767 ) ) ( not ( = ?auto_403766 ?auto_403768 ) ) ( not ( = ?auto_403771 ?auto_403772 ) ) ( HOIST-AT ?auto_403773 ?auto_403771 ) ( not ( = ?auto_403770 ?auto_403773 ) ) ( AVAILABLE ?auto_403773 ) ( SURFACE-AT ?auto_403768 ?auto_403771 ) ( ON ?auto_403768 ?auto_403769 ) ( CLEAR ?auto_403768 ) ( not ( = ?auto_403767 ?auto_403769 ) ) ( not ( = ?auto_403768 ?auto_403769 ) ) ( not ( = ?auto_403766 ?auto_403769 ) ) ( TRUCK-AT ?auto_403774 ?auto_403772 ) ( SURFACE-AT ?auto_403766 ?auto_403772 ) ( CLEAR ?auto_403766 ) ( LIFTING ?auto_403770 ?auto_403767 ) ( IS-CRATE ?auto_403767 ) ( ON ?auto_403766 ?auto_403765 ) ( not ( = ?auto_403765 ?auto_403766 ) ) ( not ( = ?auto_403765 ?auto_403767 ) ) ( not ( = ?auto_403765 ?auto_403768 ) ) ( not ( = ?auto_403765 ?auto_403769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403766 ?auto_403767 ?auto_403768 )
      ( MAKE-3CRATE-VERIFY ?auto_403765 ?auto_403766 ?auto_403767 ?auto_403768 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403793 - SURFACE
      ?auto_403794 - SURFACE
      ?auto_403795 - SURFACE
      ?auto_403796 - SURFACE
    )
    :vars
    (
      ?auto_403797 - HOIST
      ?auto_403800 - PLACE
      ?auto_403799 - PLACE
      ?auto_403802 - HOIST
      ?auto_403801 - SURFACE
      ?auto_403798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403797 ?auto_403800 ) ( IS-CRATE ?auto_403796 ) ( not ( = ?auto_403795 ?auto_403796 ) ) ( not ( = ?auto_403794 ?auto_403795 ) ) ( not ( = ?auto_403794 ?auto_403796 ) ) ( not ( = ?auto_403799 ?auto_403800 ) ) ( HOIST-AT ?auto_403802 ?auto_403799 ) ( not ( = ?auto_403797 ?auto_403802 ) ) ( AVAILABLE ?auto_403802 ) ( SURFACE-AT ?auto_403796 ?auto_403799 ) ( ON ?auto_403796 ?auto_403801 ) ( CLEAR ?auto_403796 ) ( not ( = ?auto_403795 ?auto_403801 ) ) ( not ( = ?auto_403796 ?auto_403801 ) ) ( not ( = ?auto_403794 ?auto_403801 ) ) ( TRUCK-AT ?auto_403798 ?auto_403800 ) ( SURFACE-AT ?auto_403794 ?auto_403800 ) ( CLEAR ?auto_403794 ) ( IS-CRATE ?auto_403795 ) ( AVAILABLE ?auto_403797 ) ( IN ?auto_403795 ?auto_403798 ) ( ON ?auto_403794 ?auto_403793 ) ( not ( = ?auto_403793 ?auto_403794 ) ) ( not ( = ?auto_403793 ?auto_403795 ) ) ( not ( = ?auto_403793 ?auto_403796 ) ) ( not ( = ?auto_403793 ?auto_403801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403794 ?auto_403795 ?auto_403796 )
      ( MAKE-3CRATE-VERIFY ?auto_403793 ?auto_403794 ?auto_403795 ?auto_403796 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404084 - SURFACE
      ?auto_404085 - SURFACE
      ?auto_404086 - SURFACE
      ?auto_404087 - SURFACE
      ?auto_404088 - SURFACE
    )
    :vars
    (
      ?auto_404090 - HOIST
      ?auto_404089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404090 ?auto_404089 ) ( SURFACE-AT ?auto_404087 ?auto_404089 ) ( CLEAR ?auto_404087 ) ( LIFTING ?auto_404090 ?auto_404088 ) ( IS-CRATE ?auto_404088 ) ( not ( = ?auto_404087 ?auto_404088 ) ) ( ON ?auto_404085 ?auto_404084 ) ( ON ?auto_404086 ?auto_404085 ) ( ON ?auto_404087 ?auto_404086 ) ( not ( = ?auto_404084 ?auto_404085 ) ) ( not ( = ?auto_404084 ?auto_404086 ) ) ( not ( = ?auto_404084 ?auto_404087 ) ) ( not ( = ?auto_404084 ?auto_404088 ) ) ( not ( = ?auto_404085 ?auto_404086 ) ) ( not ( = ?auto_404085 ?auto_404087 ) ) ( not ( = ?auto_404085 ?auto_404088 ) ) ( not ( = ?auto_404086 ?auto_404087 ) ) ( not ( = ?auto_404086 ?auto_404088 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_404087 ?auto_404088 )
      ( MAKE-4CRATE-VERIFY ?auto_404084 ?auto_404085 ?auto_404086 ?auto_404087 ?auto_404088 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404109 - SURFACE
      ?auto_404110 - SURFACE
      ?auto_404111 - SURFACE
      ?auto_404112 - SURFACE
      ?auto_404113 - SURFACE
    )
    :vars
    (
      ?auto_404114 - HOIST
      ?auto_404116 - PLACE
      ?auto_404115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404114 ?auto_404116 ) ( SURFACE-AT ?auto_404112 ?auto_404116 ) ( CLEAR ?auto_404112 ) ( IS-CRATE ?auto_404113 ) ( not ( = ?auto_404112 ?auto_404113 ) ) ( TRUCK-AT ?auto_404115 ?auto_404116 ) ( AVAILABLE ?auto_404114 ) ( IN ?auto_404113 ?auto_404115 ) ( ON ?auto_404112 ?auto_404111 ) ( not ( = ?auto_404111 ?auto_404112 ) ) ( not ( = ?auto_404111 ?auto_404113 ) ) ( ON ?auto_404110 ?auto_404109 ) ( ON ?auto_404111 ?auto_404110 ) ( not ( = ?auto_404109 ?auto_404110 ) ) ( not ( = ?auto_404109 ?auto_404111 ) ) ( not ( = ?auto_404109 ?auto_404112 ) ) ( not ( = ?auto_404109 ?auto_404113 ) ) ( not ( = ?auto_404110 ?auto_404111 ) ) ( not ( = ?auto_404110 ?auto_404112 ) ) ( not ( = ?auto_404110 ?auto_404113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404111 ?auto_404112 ?auto_404113 )
      ( MAKE-4CRATE-VERIFY ?auto_404109 ?auto_404110 ?auto_404111 ?auto_404112 ?auto_404113 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404139 - SURFACE
      ?auto_404140 - SURFACE
      ?auto_404141 - SURFACE
      ?auto_404142 - SURFACE
      ?auto_404143 - SURFACE
    )
    :vars
    (
      ?auto_404144 - HOIST
      ?auto_404147 - PLACE
      ?auto_404146 - TRUCK
      ?auto_404145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404144 ?auto_404147 ) ( SURFACE-AT ?auto_404142 ?auto_404147 ) ( CLEAR ?auto_404142 ) ( IS-CRATE ?auto_404143 ) ( not ( = ?auto_404142 ?auto_404143 ) ) ( AVAILABLE ?auto_404144 ) ( IN ?auto_404143 ?auto_404146 ) ( ON ?auto_404142 ?auto_404141 ) ( not ( = ?auto_404141 ?auto_404142 ) ) ( not ( = ?auto_404141 ?auto_404143 ) ) ( TRUCK-AT ?auto_404146 ?auto_404145 ) ( not ( = ?auto_404145 ?auto_404147 ) ) ( ON ?auto_404140 ?auto_404139 ) ( ON ?auto_404141 ?auto_404140 ) ( not ( = ?auto_404139 ?auto_404140 ) ) ( not ( = ?auto_404139 ?auto_404141 ) ) ( not ( = ?auto_404139 ?auto_404142 ) ) ( not ( = ?auto_404139 ?auto_404143 ) ) ( not ( = ?auto_404140 ?auto_404141 ) ) ( not ( = ?auto_404140 ?auto_404142 ) ) ( not ( = ?auto_404140 ?auto_404143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404141 ?auto_404142 ?auto_404143 )
      ( MAKE-4CRATE-VERIFY ?auto_404139 ?auto_404140 ?auto_404141 ?auto_404142 ?auto_404143 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404173 - SURFACE
      ?auto_404174 - SURFACE
      ?auto_404175 - SURFACE
      ?auto_404176 - SURFACE
      ?auto_404177 - SURFACE
    )
    :vars
    (
      ?auto_404182 - HOIST
      ?auto_404180 - PLACE
      ?auto_404179 - TRUCK
      ?auto_404178 - PLACE
      ?auto_404181 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_404182 ?auto_404180 ) ( SURFACE-AT ?auto_404176 ?auto_404180 ) ( CLEAR ?auto_404176 ) ( IS-CRATE ?auto_404177 ) ( not ( = ?auto_404176 ?auto_404177 ) ) ( AVAILABLE ?auto_404182 ) ( ON ?auto_404176 ?auto_404175 ) ( not ( = ?auto_404175 ?auto_404176 ) ) ( not ( = ?auto_404175 ?auto_404177 ) ) ( TRUCK-AT ?auto_404179 ?auto_404178 ) ( not ( = ?auto_404178 ?auto_404180 ) ) ( HOIST-AT ?auto_404181 ?auto_404178 ) ( LIFTING ?auto_404181 ?auto_404177 ) ( not ( = ?auto_404182 ?auto_404181 ) ) ( ON ?auto_404174 ?auto_404173 ) ( ON ?auto_404175 ?auto_404174 ) ( not ( = ?auto_404173 ?auto_404174 ) ) ( not ( = ?auto_404173 ?auto_404175 ) ) ( not ( = ?auto_404173 ?auto_404176 ) ) ( not ( = ?auto_404173 ?auto_404177 ) ) ( not ( = ?auto_404174 ?auto_404175 ) ) ( not ( = ?auto_404174 ?auto_404176 ) ) ( not ( = ?auto_404174 ?auto_404177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404175 ?auto_404176 ?auto_404177 )
      ( MAKE-4CRATE-VERIFY ?auto_404173 ?auto_404174 ?auto_404175 ?auto_404176 ?auto_404177 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404211 - SURFACE
      ?auto_404212 - SURFACE
      ?auto_404213 - SURFACE
      ?auto_404214 - SURFACE
      ?auto_404215 - SURFACE
    )
    :vars
    (
      ?auto_404221 - HOIST
      ?auto_404216 - PLACE
      ?auto_404217 - TRUCK
      ?auto_404220 - PLACE
      ?auto_404218 - HOIST
      ?auto_404219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404221 ?auto_404216 ) ( SURFACE-AT ?auto_404214 ?auto_404216 ) ( CLEAR ?auto_404214 ) ( IS-CRATE ?auto_404215 ) ( not ( = ?auto_404214 ?auto_404215 ) ) ( AVAILABLE ?auto_404221 ) ( ON ?auto_404214 ?auto_404213 ) ( not ( = ?auto_404213 ?auto_404214 ) ) ( not ( = ?auto_404213 ?auto_404215 ) ) ( TRUCK-AT ?auto_404217 ?auto_404220 ) ( not ( = ?auto_404220 ?auto_404216 ) ) ( HOIST-AT ?auto_404218 ?auto_404220 ) ( not ( = ?auto_404221 ?auto_404218 ) ) ( AVAILABLE ?auto_404218 ) ( SURFACE-AT ?auto_404215 ?auto_404220 ) ( ON ?auto_404215 ?auto_404219 ) ( CLEAR ?auto_404215 ) ( not ( = ?auto_404214 ?auto_404219 ) ) ( not ( = ?auto_404215 ?auto_404219 ) ) ( not ( = ?auto_404213 ?auto_404219 ) ) ( ON ?auto_404212 ?auto_404211 ) ( ON ?auto_404213 ?auto_404212 ) ( not ( = ?auto_404211 ?auto_404212 ) ) ( not ( = ?auto_404211 ?auto_404213 ) ) ( not ( = ?auto_404211 ?auto_404214 ) ) ( not ( = ?auto_404211 ?auto_404215 ) ) ( not ( = ?auto_404211 ?auto_404219 ) ) ( not ( = ?auto_404212 ?auto_404213 ) ) ( not ( = ?auto_404212 ?auto_404214 ) ) ( not ( = ?auto_404212 ?auto_404215 ) ) ( not ( = ?auto_404212 ?auto_404219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404213 ?auto_404214 ?auto_404215 )
      ( MAKE-4CRATE-VERIFY ?auto_404211 ?auto_404212 ?auto_404213 ?auto_404214 ?auto_404215 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404250 - SURFACE
      ?auto_404251 - SURFACE
      ?auto_404252 - SURFACE
      ?auto_404253 - SURFACE
      ?auto_404254 - SURFACE
    )
    :vars
    (
      ?auto_404257 - HOIST
      ?auto_404255 - PLACE
      ?auto_404259 - PLACE
      ?auto_404256 - HOIST
      ?auto_404260 - SURFACE
      ?auto_404258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404257 ?auto_404255 ) ( SURFACE-AT ?auto_404253 ?auto_404255 ) ( CLEAR ?auto_404253 ) ( IS-CRATE ?auto_404254 ) ( not ( = ?auto_404253 ?auto_404254 ) ) ( AVAILABLE ?auto_404257 ) ( ON ?auto_404253 ?auto_404252 ) ( not ( = ?auto_404252 ?auto_404253 ) ) ( not ( = ?auto_404252 ?auto_404254 ) ) ( not ( = ?auto_404259 ?auto_404255 ) ) ( HOIST-AT ?auto_404256 ?auto_404259 ) ( not ( = ?auto_404257 ?auto_404256 ) ) ( AVAILABLE ?auto_404256 ) ( SURFACE-AT ?auto_404254 ?auto_404259 ) ( ON ?auto_404254 ?auto_404260 ) ( CLEAR ?auto_404254 ) ( not ( = ?auto_404253 ?auto_404260 ) ) ( not ( = ?auto_404254 ?auto_404260 ) ) ( not ( = ?auto_404252 ?auto_404260 ) ) ( TRUCK-AT ?auto_404258 ?auto_404255 ) ( ON ?auto_404251 ?auto_404250 ) ( ON ?auto_404252 ?auto_404251 ) ( not ( = ?auto_404250 ?auto_404251 ) ) ( not ( = ?auto_404250 ?auto_404252 ) ) ( not ( = ?auto_404250 ?auto_404253 ) ) ( not ( = ?auto_404250 ?auto_404254 ) ) ( not ( = ?auto_404250 ?auto_404260 ) ) ( not ( = ?auto_404251 ?auto_404252 ) ) ( not ( = ?auto_404251 ?auto_404253 ) ) ( not ( = ?auto_404251 ?auto_404254 ) ) ( not ( = ?auto_404251 ?auto_404260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404252 ?auto_404253 ?auto_404254 )
      ( MAKE-4CRATE-VERIFY ?auto_404250 ?auto_404251 ?auto_404252 ?auto_404253 ?auto_404254 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404289 - SURFACE
      ?auto_404290 - SURFACE
      ?auto_404291 - SURFACE
      ?auto_404292 - SURFACE
      ?auto_404293 - SURFACE
    )
    :vars
    (
      ?auto_404299 - HOIST
      ?auto_404295 - PLACE
      ?auto_404298 - PLACE
      ?auto_404294 - HOIST
      ?auto_404297 - SURFACE
      ?auto_404296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404299 ?auto_404295 ) ( IS-CRATE ?auto_404293 ) ( not ( = ?auto_404292 ?auto_404293 ) ) ( not ( = ?auto_404291 ?auto_404292 ) ) ( not ( = ?auto_404291 ?auto_404293 ) ) ( not ( = ?auto_404298 ?auto_404295 ) ) ( HOIST-AT ?auto_404294 ?auto_404298 ) ( not ( = ?auto_404299 ?auto_404294 ) ) ( AVAILABLE ?auto_404294 ) ( SURFACE-AT ?auto_404293 ?auto_404298 ) ( ON ?auto_404293 ?auto_404297 ) ( CLEAR ?auto_404293 ) ( not ( = ?auto_404292 ?auto_404297 ) ) ( not ( = ?auto_404293 ?auto_404297 ) ) ( not ( = ?auto_404291 ?auto_404297 ) ) ( TRUCK-AT ?auto_404296 ?auto_404295 ) ( SURFACE-AT ?auto_404291 ?auto_404295 ) ( CLEAR ?auto_404291 ) ( LIFTING ?auto_404299 ?auto_404292 ) ( IS-CRATE ?auto_404292 ) ( ON ?auto_404290 ?auto_404289 ) ( ON ?auto_404291 ?auto_404290 ) ( not ( = ?auto_404289 ?auto_404290 ) ) ( not ( = ?auto_404289 ?auto_404291 ) ) ( not ( = ?auto_404289 ?auto_404292 ) ) ( not ( = ?auto_404289 ?auto_404293 ) ) ( not ( = ?auto_404289 ?auto_404297 ) ) ( not ( = ?auto_404290 ?auto_404291 ) ) ( not ( = ?auto_404290 ?auto_404292 ) ) ( not ( = ?auto_404290 ?auto_404293 ) ) ( not ( = ?auto_404290 ?auto_404297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404291 ?auto_404292 ?auto_404293 )
      ( MAKE-4CRATE-VERIFY ?auto_404289 ?auto_404290 ?auto_404291 ?auto_404292 ?auto_404293 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404328 - SURFACE
      ?auto_404329 - SURFACE
      ?auto_404330 - SURFACE
      ?auto_404331 - SURFACE
      ?auto_404332 - SURFACE
    )
    :vars
    (
      ?auto_404334 - HOIST
      ?auto_404333 - PLACE
      ?auto_404336 - PLACE
      ?auto_404338 - HOIST
      ?auto_404337 - SURFACE
      ?auto_404335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404334 ?auto_404333 ) ( IS-CRATE ?auto_404332 ) ( not ( = ?auto_404331 ?auto_404332 ) ) ( not ( = ?auto_404330 ?auto_404331 ) ) ( not ( = ?auto_404330 ?auto_404332 ) ) ( not ( = ?auto_404336 ?auto_404333 ) ) ( HOIST-AT ?auto_404338 ?auto_404336 ) ( not ( = ?auto_404334 ?auto_404338 ) ) ( AVAILABLE ?auto_404338 ) ( SURFACE-AT ?auto_404332 ?auto_404336 ) ( ON ?auto_404332 ?auto_404337 ) ( CLEAR ?auto_404332 ) ( not ( = ?auto_404331 ?auto_404337 ) ) ( not ( = ?auto_404332 ?auto_404337 ) ) ( not ( = ?auto_404330 ?auto_404337 ) ) ( TRUCK-AT ?auto_404335 ?auto_404333 ) ( SURFACE-AT ?auto_404330 ?auto_404333 ) ( CLEAR ?auto_404330 ) ( IS-CRATE ?auto_404331 ) ( AVAILABLE ?auto_404334 ) ( IN ?auto_404331 ?auto_404335 ) ( ON ?auto_404329 ?auto_404328 ) ( ON ?auto_404330 ?auto_404329 ) ( not ( = ?auto_404328 ?auto_404329 ) ) ( not ( = ?auto_404328 ?auto_404330 ) ) ( not ( = ?auto_404328 ?auto_404331 ) ) ( not ( = ?auto_404328 ?auto_404332 ) ) ( not ( = ?auto_404328 ?auto_404337 ) ) ( not ( = ?auto_404329 ?auto_404330 ) ) ( not ( = ?auto_404329 ?auto_404331 ) ) ( not ( = ?auto_404329 ?auto_404332 ) ) ( not ( = ?auto_404329 ?auto_404337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404330 ?auto_404331 ?auto_404332 )
      ( MAKE-4CRATE-VERIFY ?auto_404328 ?auto_404329 ?auto_404330 ?auto_404331 ?auto_404332 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404988 - SURFACE
      ?auto_404989 - SURFACE
      ?auto_404990 - SURFACE
      ?auto_404991 - SURFACE
      ?auto_404992 - SURFACE
      ?auto_404993 - SURFACE
    )
    :vars
    (
      ?auto_404995 - HOIST
      ?auto_404994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404995 ?auto_404994 ) ( SURFACE-AT ?auto_404992 ?auto_404994 ) ( CLEAR ?auto_404992 ) ( LIFTING ?auto_404995 ?auto_404993 ) ( IS-CRATE ?auto_404993 ) ( not ( = ?auto_404992 ?auto_404993 ) ) ( ON ?auto_404989 ?auto_404988 ) ( ON ?auto_404990 ?auto_404989 ) ( ON ?auto_404991 ?auto_404990 ) ( ON ?auto_404992 ?auto_404991 ) ( not ( = ?auto_404988 ?auto_404989 ) ) ( not ( = ?auto_404988 ?auto_404990 ) ) ( not ( = ?auto_404988 ?auto_404991 ) ) ( not ( = ?auto_404988 ?auto_404992 ) ) ( not ( = ?auto_404988 ?auto_404993 ) ) ( not ( = ?auto_404989 ?auto_404990 ) ) ( not ( = ?auto_404989 ?auto_404991 ) ) ( not ( = ?auto_404989 ?auto_404992 ) ) ( not ( = ?auto_404989 ?auto_404993 ) ) ( not ( = ?auto_404990 ?auto_404991 ) ) ( not ( = ?auto_404990 ?auto_404992 ) ) ( not ( = ?auto_404990 ?auto_404993 ) ) ( not ( = ?auto_404991 ?auto_404992 ) ) ( not ( = ?auto_404991 ?auto_404993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_404992 ?auto_404993 )
      ( MAKE-5CRATE-VERIFY ?auto_404988 ?auto_404989 ?auto_404990 ?auto_404991 ?auto_404992 ?auto_404993 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405022 - SURFACE
      ?auto_405023 - SURFACE
      ?auto_405024 - SURFACE
      ?auto_405025 - SURFACE
      ?auto_405026 - SURFACE
      ?auto_405027 - SURFACE
    )
    :vars
    (
      ?auto_405030 - HOIST
      ?auto_405029 - PLACE
      ?auto_405028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405030 ?auto_405029 ) ( SURFACE-AT ?auto_405026 ?auto_405029 ) ( CLEAR ?auto_405026 ) ( IS-CRATE ?auto_405027 ) ( not ( = ?auto_405026 ?auto_405027 ) ) ( TRUCK-AT ?auto_405028 ?auto_405029 ) ( AVAILABLE ?auto_405030 ) ( IN ?auto_405027 ?auto_405028 ) ( ON ?auto_405026 ?auto_405025 ) ( not ( = ?auto_405025 ?auto_405026 ) ) ( not ( = ?auto_405025 ?auto_405027 ) ) ( ON ?auto_405023 ?auto_405022 ) ( ON ?auto_405024 ?auto_405023 ) ( ON ?auto_405025 ?auto_405024 ) ( not ( = ?auto_405022 ?auto_405023 ) ) ( not ( = ?auto_405022 ?auto_405024 ) ) ( not ( = ?auto_405022 ?auto_405025 ) ) ( not ( = ?auto_405022 ?auto_405026 ) ) ( not ( = ?auto_405022 ?auto_405027 ) ) ( not ( = ?auto_405023 ?auto_405024 ) ) ( not ( = ?auto_405023 ?auto_405025 ) ) ( not ( = ?auto_405023 ?auto_405026 ) ) ( not ( = ?auto_405023 ?auto_405027 ) ) ( not ( = ?auto_405024 ?auto_405025 ) ) ( not ( = ?auto_405024 ?auto_405026 ) ) ( not ( = ?auto_405024 ?auto_405027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405025 ?auto_405026 ?auto_405027 )
      ( MAKE-5CRATE-VERIFY ?auto_405022 ?auto_405023 ?auto_405024 ?auto_405025 ?auto_405026 ?auto_405027 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405062 - SURFACE
      ?auto_405063 - SURFACE
      ?auto_405064 - SURFACE
      ?auto_405065 - SURFACE
      ?auto_405066 - SURFACE
      ?auto_405067 - SURFACE
    )
    :vars
    (
      ?auto_405070 - HOIST
      ?auto_405069 - PLACE
      ?auto_405071 - TRUCK
      ?auto_405068 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405070 ?auto_405069 ) ( SURFACE-AT ?auto_405066 ?auto_405069 ) ( CLEAR ?auto_405066 ) ( IS-CRATE ?auto_405067 ) ( not ( = ?auto_405066 ?auto_405067 ) ) ( AVAILABLE ?auto_405070 ) ( IN ?auto_405067 ?auto_405071 ) ( ON ?auto_405066 ?auto_405065 ) ( not ( = ?auto_405065 ?auto_405066 ) ) ( not ( = ?auto_405065 ?auto_405067 ) ) ( TRUCK-AT ?auto_405071 ?auto_405068 ) ( not ( = ?auto_405068 ?auto_405069 ) ) ( ON ?auto_405063 ?auto_405062 ) ( ON ?auto_405064 ?auto_405063 ) ( ON ?auto_405065 ?auto_405064 ) ( not ( = ?auto_405062 ?auto_405063 ) ) ( not ( = ?auto_405062 ?auto_405064 ) ) ( not ( = ?auto_405062 ?auto_405065 ) ) ( not ( = ?auto_405062 ?auto_405066 ) ) ( not ( = ?auto_405062 ?auto_405067 ) ) ( not ( = ?auto_405063 ?auto_405064 ) ) ( not ( = ?auto_405063 ?auto_405065 ) ) ( not ( = ?auto_405063 ?auto_405066 ) ) ( not ( = ?auto_405063 ?auto_405067 ) ) ( not ( = ?auto_405064 ?auto_405065 ) ) ( not ( = ?auto_405064 ?auto_405066 ) ) ( not ( = ?auto_405064 ?auto_405067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405065 ?auto_405066 ?auto_405067 )
      ( MAKE-5CRATE-VERIFY ?auto_405062 ?auto_405063 ?auto_405064 ?auto_405065 ?auto_405066 ?auto_405067 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405107 - SURFACE
      ?auto_405108 - SURFACE
      ?auto_405109 - SURFACE
      ?auto_405110 - SURFACE
      ?auto_405111 - SURFACE
      ?auto_405112 - SURFACE
    )
    :vars
    (
      ?auto_405115 - HOIST
      ?auto_405114 - PLACE
      ?auto_405117 - TRUCK
      ?auto_405116 - PLACE
      ?auto_405113 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_405115 ?auto_405114 ) ( SURFACE-AT ?auto_405111 ?auto_405114 ) ( CLEAR ?auto_405111 ) ( IS-CRATE ?auto_405112 ) ( not ( = ?auto_405111 ?auto_405112 ) ) ( AVAILABLE ?auto_405115 ) ( ON ?auto_405111 ?auto_405110 ) ( not ( = ?auto_405110 ?auto_405111 ) ) ( not ( = ?auto_405110 ?auto_405112 ) ) ( TRUCK-AT ?auto_405117 ?auto_405116 ) ( not ( = ?auto_405116 ?auto_405114 ) ) ( HOIST-AT ?auto_405113 ?auto_405116 ) ( LIFTING ?auto_405113 ?auto_405112 ) ( not ( = ?auto_405115 ?auto_405113 ) ) ( ON ?auto_405108 ?auto_405107 ) ( ON ?auto_405109 ?auto_405108 ) ( ON ?auto_405110 ?auto_405109 ) ( not ( = ?auto_405107 ?auto_405108 ) ) ( not ( = ?auto_405107 ?auto_405109 ) ) ( not ( = ?auto_405107 ?auto_405110 ) ) ( not ( = ?auto_405107 ?auto_405111 ) ) ( not ( = ?auto_405107 ?auto_405112 ) ) ( not ( = ?auto_405108 ?auto_405109 ) ) ( not ( = ?auto_405108 ?auto_405110 ) ) ( not ( = ?auto_405108 ?auto_405111 ) ) ( not ( = ?auto_405108 ?auto_405112 ) ) ( not ( = ?auto_405109 ?auto_405110 ) ) ( not ( = ?auto_405109 ?auto_405111 ) ) ( not ( = ?auto_405109 ?auto_405112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405110 ?auto_405111 ?auto_405112 )
      ( MAKE-5CRATE-VERIFY ?auto_405107 ?auto_405108 ?auto_405109 ?auto_405110 ?auto_405111 ?auto_405112 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405157 - SURFACE
      ?auto_405158 - SURFACE
      ?auto_405159 - SURFACE
      ?auto_405160 - SURFACE
      ?auto_405161 - SURFACE
      ?auto_405162 - SURFACE
    )
    :vars
    (
      ?auto_405168 - HOIST
      ?auto_405166 - PLACE
      ?auto_405163 - TRUCK
      ?auto_405165 - PLACE
      ?auto_405167 - HOIST
      ?auto_405164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405168 ?auto_405166 ) ( SURFACE-AT ?auto_405161 ?auto_405166 ) ( CLEAR ?auto_405161 ) ( IS-CRATE ?auto_405162 ) ( not ( = ?auto_405161 ?auto_405162 ) ) ( AVAILABLE ?auto_405168 ) ( ON ?auto_405161 ?auto_405160 ) ( not ( = ?auto_405160 ?auto_405161 ) ) ( not ( = ?auto_405160 ?auto_405162 ) ) ( TRUCK-AT ?auto_405163 ?auto_405165 ) ( not ( = ?auto_405165 ?auto_405166 ) ) ( HOIST-AT ?auto_405167 ?auto_405165 ) ( not ( = ?auto_405168 ?auto_405167 ) ) ( AVAILABLE ?auto_405167 ) ( SURFACE-AT ?auto_405162 ?auto_405165 ) ( ON ?auto_405162 ?auto_405164 ) ( CLEAR ?auto_405162 ) ( not ( = ?auto_405161 ?auto_405164 ) ) ( not ( = ?auto_405162 ?auto_405164 ) ) ( not ( = ?auto_405160 ?auto_405164 ) ) ( ON ?auto_405158 ?auto_405157 ) ( ON ?auto_405159 ?auto_405158 ) ( ON ?auto_405160 ?auto_405159 ) ( not ( = ?auto_405157 ?auto_405158 ) ) ( not ( = ?auto_405157 ?auto_405159 ) ) ( not ( = ?auto_405157 ?auto_405160 ) ) ( not ( = ?auto_405157 ?auto_405161 ) ) ( not ( = ?auto_405157 ?auto_405162 ) ) ( not ( = ?auto_405157 ?auto_405164 ) ) ( not ( = ?auto_405158 ?auto_405159 ) ) ( not ( = ?auto_405158 ?auto_405160 ) ) ( not ( = ?auto_405158 ?auto_405161 ) ) ( not ( = ?auto_405158 ?auto_405162 ) ) ( not ( = ?auto_405158 ?auto_405164 ) ) ( not ( = ?auto_405159 ?auto_405160 ) ) ( not ( = ?auto_405159 ?auto_405161 ) ) ( not ( = ?auto_405159 ?auto_405162 ) ) ( not ( = ?auto_405159 ?auto_405164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405160 ?auto_405161 ?auto_405162 )
      ( MAKE-5CRATE-VERIFY ?auto_405157 ?auto_405158 ?auto_405159 ?auto_405160 ?auto_405161 ?auto_405162 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405208 - SURFACE
      ?auto_405209 - SURFACE
      ?auto_405210 - SURFACE
      ?auto_405211 - SURFACE
      ?auto_405212 - SURFACE
      ?auto_405213 - SURFACE
    )
    :vars
    (
      ?auto_405217 - HOIST
      ?auto_405219 - PLACE
      ?auto_405215 - PLACE
      ?auto_405214 - HOIST
      ?auto_405218 - SURFACE
      ?auto_405216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405217 ?auto_405219 ) ( SURFACE-AT ?auto_405212 ?auto_405219 ) ( CLEAR ?auto_405212 ) ( IS-CRATE ?auto_405213 ) ( not ( = ?auto_405212 ?auto_405213 ) ) ( AVAILABLE ?auto_405217 ) ( ON ?auto_405212 ?auto_405211 ) ( not ( = ?auto_405211 ?auto_405212 ) ) ( not ( = ?auto_405211 ?auto_405213 ) ) ( not ( = ?auto_405215 ?auto_405219 ) ) ( HOIST-AT ?auto_405214 ?auto_405215 ) ( not ( = ?auto_405217 ?auto_405214 ) ) ( AVAILABLE ?auto_405214 ) ( SURFACE-AT ?auto_405213 ?auto_405215 ) ( ON ?auto_405213 ?auto_405218 ) ( CLEAR ?auto_405213 ) ( not ( = ?auto_405212 ?auto_405218 ) ) ( not ( = ?auto_405213 ?auto_405218 ) ) ( not ( = ?auto_405211 ?auto_405218 ) ) ( TRUCK-AT ?auto_405216 ?auto_405219 ) ( ON ?auto_405209 ?auto_405208 ) ( ON ?auto_405210 ?auto_405209 ) ( ON ?auto_405211 ?auto_405210 ) ( not ( = ?auto_405208 ?auto_405209 ) ) ( not ( = ?auto_405208 ?auto_405210 ) ) ( not ( = ?auto_405208 ?auto_405211 ) ) ( not ( = ?auto_405208 ?auto_405212 ) ) ( not ( = ?auto_405208 ?auto_405213 ) ) ( not ( = ?auto_405208 ?auto_405218 ) ) ( not ( = ?auto_405209 ?auto_405210 ) ) ( not ( = ?auto_405209 ?auto_405211 ) ) ( not ( = ?auto_405209 ?auto_405212 ) ) ( not ( = ?auto_405209 ?auto_405213 ) ) ( not ( = ?auto_405209 ?auto_405218 ) ) ( not ( = ?auto_405210 ?auto_405211 ) ) ( not ( = ?auto_405210 ?auto_405212 ) ) ( not ( = ?auto_405210 ?auto_405213 ) ) ( not ( = ?auto_405210 ?auto_405218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405211 ?auto_405212 ?auto_405213 )
      ( MAKE-5CRATE-VERIFY ?auto_405208 ?auto_405209 ?auto_405210 ?auto_405211 ?auto_405212 ?auto_405213 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405259 - SURFACE
      ?auto_405260 - SURFACE
      ?auto_405261 - SURFACE
      ?auto_405262 - SURFACE
      ?auto_405263 - SURFACE
      ?auto_405264 - SURFACE
    )
    :vars
    (
      ?auto_405266 - HOIST
      ?auto_405268 - PLACE
      ?auto_405270 - PLACE
      ?auto_405265 - HOIST
      ?auto_405269 - SURFACE
      ?auto_405267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405266 ?auto_405268 ) ( IS-CRATE ?auto_405264 ) ( not ( = ?auto_405263 ?auto_405264 ) ) ( not ( = ?auto_405262 ?auto_405263 ) ) ( not ( = ?auto_405262 ?auto_405264 ) ) ( not ( = ?auto_405270 ?auto_405268 ) ) ( HOIST-AT ?auto_405265 ?auto_405270 ) ( not ( = ?auto_405266 ?auto_405265 ) ) ( AVAILABLE ?auto_405265 ) ( SURFACE-AT ?auto_405264 ?auto_405270 ) ( ON ?auto_405264 ?auto_405269 ) ( CLEAR ?auto_405264 ) ( not ( = ?auto_405263 ?auto_405269 ) ) ( not ( = ?auto_405264 ?auto_405269 ) ) ( not ( = ?auto_405262 ?auto_405269 ) ) ( TRUCK-AT ?auto_405267 ?auto_405268 ) ( SURFACE-AT ?auto_405262 ?auto_405268 ) ( CLEAR ?auto_405262 ) ( LIFTING ?auto_405266 ?auto_405263 ) ( IS-CRATE ?auto_405263 ) ( ON ?auto_405260 ?auto_405259 ) ( ON ?auto_405261 ?auto_405260 ) ( ON ?auto_405262 ?auto_405261 ) ( not ( = ?auto_405259 ?auto_405260 ) ) ( not ( = ?auto_405259 ?auto_405261 ) ) ( not ( = ?auto_405259 ?auto_405262 ) ) ( not ( = ?auto_405259 ?auto_405263 ) ) ( not ( = ?auto_405259 ?auto_405264 ) ) ( not ( = ?auto_405259 ?auto_405269 ) ) ( not ( = ?auto_405260 ?auto_405261 ) ) ( not ( = ?auto_405260 ?auto_405262 ) ) ( not ( = ?auto_405260 ?auto_405263 ) ) ( not ( = ?auto_405260 ?auto_405264 ) ) ( not ( = ?auto_405260 ?auto_405269 ) ) ( not ( = ?auto_405261 ?auto_405262 ) ) ( not ( = ?auto_405261 ?auto_405263 ) ) ( not ( = ?auto_405261 ?auto_405264 ) ) ( not ( = ?auto_405261 ?auto_405269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405262 ?auto_405263 ?auto_405264 )
      ( MAKE-5CRATE-VERIFY ?auto_405259 ?auto_405260 ?auto_405261 ?auto_405262 ?auto_405263 ?auto_405264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405310 - SURFACE
      ?auto_405311 - SURFACE
      ?auto_405312 - SURFACE
      ?auto_405313 - SURFACE
      ?auto_405314 - SURFACE
      ?auto_405315 - SURFACE
    )
    :vars
    (
      ?auto_405317 - HOIST
      ?auto_405318 - PLACE
      ?auto_405321 - PLACE
      ?auto_405316 - HOIST
      ?auto_405320 - SURFACE
      ?auto_405319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405317 ?auto_405318 ) ( IS-CRATE ?auto_405315 ) ( not ( = ?auto_405314 ?auto_405315 ) ) ( not ( = ?auto_405313 ?auto_405314 ) ) ( not ( = ?auto_405313 ?auto_405315 ) ) ( not ( = ?auto_405321 ?auto_405318 ) ) ( HOIST-AT ?auto_405316 ?auto_405321 ) ( not ( = ?auto_405317 ?auto_405316 ) ) ( AVAILABLE ?auto_405316 ) ( SURFACE-AT ?auto_405315 ?auto_405321 ) ( ON ?auto_405315 ?auto_405320 ) ( CLEAR ?auto_405315 ) ( not ( = ?auto_405314 ?auto_405320 ) ) ( not ( = ?auto_405315 ?auto_405320 ) ) ( not ( = ?auto_405313 ?auto_405320 ) ) ( TRUCK-AT ?auto_405319 ?auto_405318 ) ( SURFACE-AT ?auto_405313 ?auto_405318 ) ( CLEAR ?auto_405313 ) ( IS-CRATE ?auto_405314 ) ( AVAILABLE ?auto_405317 ) ( IN ?auto_405314 ?auto_405319 ) ( ON ?auto_405311 ?auto_405310 ) ( ON ?auto_405312 ?auto_405311 ) ( ON ?auto_405313 ?auto_405312 ) ( not ( = ?auto_405310 ?auto_405311 ) ) ( not ( = ?auto_405310 ?auto_405312 ) ) ( not ( = ?auto_405310 ?auto_405313 ) ) ( not ( = ?auto_405310 ?auto_405314 ) ) ( not ( = ?auto_405310 ?auto_405315 ) ) ( not ( = ?auto_405310 ?auto_405320 ) ) ( not ( = ?auto_405311 ?auto_405312 ) ) ( not ( = ?auto_405311 ?auto_405313 ) ) ( not ( = ?auto_405311 ?auto_405314 ) ) ( not ( = ?auto_405311 ?auto_405315 ) ) ( not ( = ?auto_405311 ?auto_405320 ) ) ( not ( = ?auto_405312 ?auto_405313 ) ) ( not ( = ?auto_405312 ?auto_405314 ) ) ( not ( = ?auto_405312 ?auto_405315 ) ) ( not ( = ?auto_405312 ?auto_405320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405313 ?auto_405314 ?auto_405315 )
      ( MAKE-5CRATE-VERIFY ?auto_405310 ?auto_405311 ?auto_405312 ?auto_405313 ?auto_405314 ?auto_405315 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_405322 - SURFACE
      ?auto_405323 - SURFACE
    )
    :vars
    (
      ?auto_405325 - HOIST
      ?auto_405327 - PLACE
      ?auto_405326 - SURFACE
      ?auto_405330 - PLACE
      ?auto_405324 - HOIST
      ?auto_405329 - SURFACE
      ?auto_405328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405325 ?auto_405327 ) ( IS-CRATE ?auto_405323 ) ( not ( = ?auto_405322 ?auto_405323 ) ) ( not ( = ?auto_405326 ?auto_405322 ) ) ( not ( = ?auto_405326 ?auto_405323 ) ) ( not ( = ?auto_405330 ?auto_405327 ) ) ( HOIST-AT ?auto_405324 ?auto_405330 ) ( not ( = ?auto_405325 ?auto_405324 ) ) ( AVAILABLE ?auto_405324 ) ( SURFACE-AT ?auto_405323 ?auto_405330 ) ( ON ?auto_405323 ?auto_405329 ) ( CLEAR ?auto_405323 ) ( not ( = ?auto_405322 ?auto_405329 ) ) ( not ( = ?auto_405323 ?auto_405329 ) ) ( not ( = ?auto_405326 ?auto_405329 ) ) ( SURFACE-AT ?auto_405326 ?auto_405327 ) ( CLEAR ?auto_405326 ) ( IS-CRATE ?auto_405322 ) ( AVAILABLE ?auto_405325 ) ( IN ?auto_405322 ?auto_405328 ) ( TRUCK-AT ?auto_405328 ?auto_405330 ) )
    :subtasks
    ( ( !DRIVE ?auto_405328 ?auto_405330 ?auto_405327 )
      ( MAKE-2CRATE ?auto_405326 ?auto_405322 ?auto_405323 )
      ( MAKE-1CRATE-VERIFY ?auto_405322 ?auto_405323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_405331 - SURFACE
      ?auto_405332 - SURFACE
      ?auto_405333 - SURFACE
    )
    :vars
    (
      ?auto_405337 - HOIST
      ?auto_405339 - PLACE
      ?auto_405336 - PLACE
      ?auto_405338 - HOIST
      ?auto_405334 - SURFACE
      ?auto_405335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405337 ?auto_405339 ) ( IS-CRATE ?auto_405333 ) ( not ( = ?auto_405332 ?auto_405333 ) ) ( not ( = ?auto_405331 ?auto_405332 ) ) ( not ( = ?auto_405331 ?auto_405333 ) ) ( not ( = ?auto_405336 ?auto_405339 ) ) ( HOIST-AT ?auto_405338 ?auto_405336 ) ( not ( = ?auto_405337 ?auto_405338 ) ) ( AVAILABLE ?auto_405338 ) ( SURFACE-AT ?auto_405333 ?auto_405336 ) ( ON ?auto_405333 ?auto_405334 ) ( CLEAR ?auto_405333 ) ( not ( = ?auto_405332 ?auto_405334 ) ) ( not ( = ?auto_405333 ?auto_405334 ) ) ( not ( = ?auto_405331 ?auto_405334 ) ) ( SURFACE-AT ?auto_405331 ?auto_405339 ) ( CLEAR ?auto_405331 ) ( IS-CRATE ?auto_405332 ) ( AVAILABLE ?auto_405337 ) ( IN ?auto_405332 ?auto_405335 ) ( TRUCK-AT ?auto_405335 ?auto_405336 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405332 ?auto_405333 )
      ( MAKE-2CRATE-VERIFY ?auto_405331 ?auto_405332 ?auto_405333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405340 - SURFACE
      ?auto_405341 - SURFACE
      ?auto_405342 - SURFACE
      ?auto_405343 - SURFACE
    )
    :vars
    (
      ?auto_405344 - HOIST
      ?auto_405349 - PLACE
      ?auto_405346 - PLACE
      ?auto_405348 - HOIST
      ?auto_405345 - SURFACE
      ?auto_405347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405344 ?auto_405349 ) ( IS-CRATE ?auto_405343 ) ( not ( = ?auto_405342 ?auto_405343 ) ) ( not ( = ?auto_405341 ?auto_405342 ) ) ( not ( = ?auto_405341 ?auto_405343 ) ) ( not ( = ?auto_405346 ?auto_405349 ) ) ( HOIST-AT ?auto_405348 ?auto_405346 ) ( not ( = ?auto_405344 ?auto_405348 ) ) ( AVAILABLE ?auto_405348 ) ( SURFACE-AT ?auto_405343 ?auto_405346 ) ( ON ?auto_405343 ?auto_405345 ) ( CLEAR ?auto_405343 ) ( not ( = ?auto_405342 ?auto_405345 ) ) ( not ( = ?auto_405343 ?auto_405345 ) ) ( not ( = ?auto_405341 ?auto_405345 ) ) ( SURFACE-AT ?auto_405341 ?auto_405349 ) ( CLEAR ?auto_405341 ) ( IS-CRATE ?auto_405342 ) ( AVAILABLE ?auto_405344 ) ( IN ?auto_405342 ?auto_405347 ) ( TRUCK-AT ?auto_405347 ?auto_405346 ) ( ON ?auto_405341 ?auto_405340 ) ( not ( = ?auto_405340 ?auto_405341 ) ) ( not ( = ?auto_405340 ?auto_405342 ) ) ( not ( = ?auto_405340 ?auto_405343 ) ) ( not ( = ?auto_405340 ?auto_405345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405341 ?auto_405342 ?auto_405343 )
      ( MAKE-3CRATE-VERIFY ?auto_405340 ?auto_405341 ?auto_405342 ?auto_405343 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405350 - SURFACE
      ?auto_405351 - SURFACE
      ?auto_405352 - SURFACE
      ?auto_405353 - SURFACE
      ?auto_405354 - SURFACE
    )
    :vars
    (
      ?auto_405355 - HOIST
      ?auto_405360 - PLACE
      ?auto_405357 - PLACE
      ?auto_405359 - HOIST
      ?auto_405356 - SURFACE
      ?auto_405358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405355 ?auto_405360 ) ( IS-CRATE ?auto_405354 ) ( not ( = ?auto_405353 ?auto_405354 ) ) ( not ( = ?auto_405352 ?auto_405353 ) ) ( not ( = ?auto_405352 ?auto_405354 ) ) ( not ( = ?auto_405357 ?auto_405360 ) ) ( HOIST-AT ?auto_405359 ?auto_405357 ) ( not ( = ?auto_405355 ?auto_405359 ) ) ( AVAILABLE ?auto_405359 ) ( SURFACE-AT ?auto_405354 ?auto_405357 ) ( ON ?auto_405354 ?auto_405356 ) ( CLEAR ?auto_405354 ) ( not ( = ?auto_405353 ?auto_405356 ) ) ( not ( = ?auto_405354 ?auto_405356 ) ) ( not ( = ?auto_405352 ?auto_405356 ) ) ( SURFACE-AT ?auto_405352 ?auto_405360 ) ( CLEAR ?auto_405352 ) ( IS-CRATE ?auto_405353 ) ( AVAILABLE ?auto_405355 ) ( IN ?auto_405353 ?auto_405358 ) ( TRUCK-AT ?auto_405358 ?auto_405357 ) ( ON ?auto_405351 ?auto_405350 ) ( ON ?auto_405352 ?auto_405351 ) ( not ( = ?auto_405350 ?auto_405351 ) ) ( not ( = ?auto_405350 ?auto_405352 ) ) ( not ( = ?auto_405350 ?auto_405353 ) ) ( not ( = ?auto_405350 ?auto_405354 ) ) ( not ( = ?auto_405350 ?auto_405356 ) ) ( not ( = ?auto_405351 ?auto_405352 ) ) ( not ( = ?auto_405351 ?auto_405353 ) ) ( not ( = ?auto_405351 ?auto_405354 ) ) ( not ( = ?auto_405351 ?auto_405356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405352 ?auto_405353 ?auto_405354 )
      ( MAKE-4CRATE-VERIFY ?auto_405350 ?auto_405351 ?auto_405352 ?auto_405353 ?auto_405354 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405361 - SURFACE
      ?auto_405362 - SURFACE
      ?auto_405363 - SURFACE
      ?auto_405364 - SURFACE
      ?auto_405365 - SURFACE
      ?auto_405366 - SURFACE
    )
    :vars
    (
      ?auto_405367 - HOIST
      ?auto_405372 - PLACE
      ?auto_405369 - PLACE
      ?auto_405371 - HOIST
      ?auto_405368 - SURFACE
      ?auto_405370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405367 ?auto_405372 ) ( IS-CRATE ?auto_405366 ) ( not ( = ?auto_405365 ?auto_405366 ) ) ( not ( = ?auto_405364 ?auto_405365 ) ) ( not ( = ?auto_405364 ?auto_405366 ) ) ( not ( = ?auto_405369 ?auto_405372 ) ) ( HOIST-AT ?auto_405371 ?auto_405369 ) ( not ( = ?auto_405367 ?auto_405371 ) ) ( AVAILABLE ?auto_405371 ) ( SURFACE-AT ?auto_405366 ?auto_405369 ) ( ON ?auto_405366 ?auto_405368 ) ( CLEAR ?auto_405366 ) ( not ( = ?auto_405365 ?auto_405368 ) ) ( not ( = ?auto_405366 ?auto_405368 ) ) ( not ( = ?auto_405364 ?auto_405368 ) ) ( SURFACE-AT ?auto_405364 ?auto_405372 ) ( CLEAR ?auto_405364 ) ( IS-CRATE ?auto_405365 ) ( AVAILABLE ?auto_405367 ) ( IN ?auto_405365 ?auto_405370 ) ( TRUCK-AT ?auto_405370 ?auto_405369 ) ( ON ?auto_405362 ?auto_405361 ) ( ON ?auto_405363 ?auto_405362 ) ( ON ?auto_405364 ?auto_405363 ) ( not ( = ?auto_405361 ?auto_405362 ) ) ( not ( = ?auto_405361 ?auto_405363 ) ) ( not ( = ?auto_405361 ?auto_405364 ) ) ( not ( = ?auto_405361 ?auto_405365 ) ) ( not ( = ?auto_405361 ?auto_405366 ) ) ( not ( = ?auto_405361 ?auto_405368 ) ) ( not ( = ?auto_405362 ?auto_405363 ) ) ( not ( = ?auto_405362 ?auto_405364 ) ) ( not ( = ?auto_405362 ?auto_405365 ) ) ( not ( = ?auto_405362 ?auto_405366 ) ) ( not ( = ?auto_405362 ?auto_405368 ) ) ( not ( = ?auto_405363 ?auto_405364 ) ) ( not ( = ?auto_405363 ?auto_405365 ) ) ( not ( = ?auto_405363 ?auto_405366 ) ) ( not ( = ?auto_405363 ?auto_405368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405364 ?auto_405365 ?auto_405366 )
      ( MAKE-5CRATE-VERIFY ?auto_405361 ?auto_405362 ?auto_405363 ?auto_405364 ?auto_405365 ?auto_405366 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_405373 - SURFACE
      ?auto_405374 - SURFACE
    )
    :vars
    (
      ?auto_405375 - HOIST
      ?auto_405381 - PLACE
      ?auto_405380 - SURFACE
      ?auto_405377 - PLACE
      ?auto_405379 - HOIST
      ?auto_405376 - SURFACE
      ?auto_405378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405375 ?auto_405381 ) ( IS-CRATE ?auto_405374 ) ( not ( = ?auto_405373 ?auto_405374 ) ) ( not ( = ?auto_405380 ?auto_405373 ) ) ( not ( = ?auto_405380 ?auto_405374 ) ) ( not ( = ?auto_405377 ?auto_405381 ) ) ( HOIST-AT ?auto_405379 ?auto_405377 ) ( not ( = ?auto_405375 ?auto_405379 ) ) ( SURFACE-AT ?auto_405374 ?auto_405377 ) ( ON ?auto_405374 ?auto_405376 ) ( CLEAR ?auto_405374 ) ( not ( = ?auto_405373 ?auto_405376 ) ) ( not ( = ?auto_405374 ?auto_405376 ) ) ( not ( = ?auto_405380 ?auto_405376 ) ) ( SURFACE-AT ?auto_405380 ?auto_405381 ) ( CLEAR ?auto_405380 ) ( IS-CRATE ?auto_405373 ) ( AVAILABLE ?auto_405375 ) ( TRUCK-AT ?auto_405378 ?auto_405377 ) ( LIFTING ?auto_405379 ?auto_405373 ) )
    :subtasks
    ( ( !LOAD ?auto_405379 ?auto_405373 ?auto_405378 ?auto_405377 )
      ( MAKE-2CRATE ?auto_405380 ?auto_405373 ?auto_405374 )
      ( MAKE-1CRATE-VERIFY ?auto_405373 ?auto_405374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_405382 - SURFACE
      ?auto_405383 - SURFACE
      ?auto_405384 - SURFACE
    )
    :vars
    (
      ?auto_405388 - HOIST
      ?auto_405390 - PLACE
      ?auto_405386 - PLACE
      ?auto_405387 - HOIST
      ?auto_405389 - SURFACE
      ?auto_405385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405388 ?auto_405390 ) ( IS-CRATE ?auto_405384 ) ( not ( = ?auto_405383 ?auto_405384 ) ) ( not ( = ?auto_405382 ?auto_405383 ) ) ( not ( = ?auto_405382 ?auto_405384 ) ) ( not ( = ?auto_405386 ?auto_405390 ) ) ( HOIST-AT ?auto_405387 ?auto_405386 ) ( not ( = ?auto_405388 ?auto_405387 ) ) ( SURFACE-AT ?auto_405384 ?auto_405386 ) ( ON ?auto_405384 ?auto_405389 ) ( CLEAR ?auto_405384 ) ( not ( = ?auto_405383 ?auto_405389 ) ) ( not ( = ?auto_405384 ?auto_405389 ) ) ( not ( = ?auto_405382 ?auto_405389 ) ) ( SURFACE-AT ?auto_405382 ?auto_405390 ) ( CLEAR ?auto_405382 ) ( IS-CRATE ?auto_405383 ) ( AVAILABLE ?auto_405388 ) ( TRUCK-AT ?auto_405385 ?auto_405386 ) ( LIFTING ?auto_405387 ?auto_405383 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405383 ?auto_405384 )
      ( MAKE-2CRATE-VERIFY ?auto_405382 ?auto_405383 ?auto_405384 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405391 - SURFACE
      ?auto_405392 - SURFACE
      ?auto_405393 - SURFACE
      ?auto_405394 - SURFACE
    )
    :vars
    (
      ?auto_405395 - HOIST
      ?auto_405396 - PLACE
      ?auto_405399 - PLACE
      ?auto_405400 - HOIST
      ?auto_405397 - SURFACE
      ?auto_405398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405395 ?auto_405396 ) ( IS-CRATE ?auto_405394 ) ( not ( = ?auto_405393 ?auto_405394 ) ) ( not ( = ?auto_405392 ?auto_405393 ) ) ( not ( = ?auto_405392 ?auto_405394 ) ) ( not ( = ?auto_405399 ?auto_405396 ) ) ( HOIST-AT ?auto_405400 ?auto_405399 ) ( not ( = ?auto_405395 ?auto_405400 ) ) ( SURFACE-AT ?auto_405394 ?auto_405399 ) ( ON ?auto_405394 ?auto_405397 ) ( CLEAR ?auto_405394 ) ( not ( = ?auto_405393 ?auto_405397 ) ) ( not ( = ?auto_405394 ?auto_405397 ) ) ( not ( = ?auto_405392 ?auto_405397 ) ) ( SURFACE-AT ?auto_405392 ?auto_405396 ) ( CLEAR ?auto_405392 ) ( IS-CRATE ?auto_405393 ) ( AVAILABLE ?auto_405395 ) ( TRUCK-AT ?auto_405398 ?auto_405399 ) ( LIFTING ?auto_405400 ?auto_405393 ) ( ON ?auto_405392 ?auto_405391 ) ( not ( = ?auto_405391 ?auto_405392 ) ) ( not ( = ?auto_405391 ?auto_405393 ) ) ( not ( = ?auto_405391 ?auto_405394 ) ) ( not ( = ?auto_405391 ?auto_405397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405392 ?auto_405393 ?auto_405394 )
      ( MAKE-3CRATE-VERIFY ?auto_405391 ?auto_405392 ?auto_405393 ?auto_405394 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405401 - SURFACE
      ?auto_405402 - SURFACE
      ?auto_405403 - SURFACE
      ?auto_405404 - SURFACE
      ?auto_405405 - SURFACE
    )
    :vars
    (
      ?auto_405406 - HOIST
      ?auto_405407 - PLACE
      ?auto_405410 - PLACE
      ?auto_405411 - HOIST
      ?auto_405408 - SURFACE
      ?auto_405409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405406 ?auto_405407 ) ( IS-CRATE ?auto_405405 ) ( not ( = ?auto_405404 ?auto_405405 ) ) ( not ( = ?auto_405403 ?auto_405404 ) ) ( not ( = ?auto_405403 ?auto_405405 ) ) ( not ( = ?auto_405410 ?auto_405407 ) ) ( HOIST-AT ?auto_405411 ?auto_405410 ) ( not ( = ?auto_405406 ?auto_405411 ) ) ( SURFACE-AT ?auto_405405 ?auto_405410 ) ( ON ?auto_405405 ?auto_405408 ) ( CLEAR ?auto_405405 ) ( not ( = ?auto_405404 ?auto_405408 ) ) ( not ( = ?auto_405405 ?auto_405408 ) ) ( not ( = ?auto_405403 ?auto_405408 ) ) ( SURFACE-AT ?auto_405403 ?auto_405407 ) ( CLEAR ?auto_405403 ) ( IS-CRATE ?auto_405404 ) ( AVAILABLE ?auto_405406 ) ( TRUCK-AT ?auto_405409 ?auto_405410 ) ( LIFTING ?auto_405411 ?auto_405404 ) ( ON ?auto_405402 ?auto_405401 ) ( ON ?auto_405403 ?auto_405402 ) ( not ( = ?auto_405401 ?auto_405402 ) ) ( not ( = ?auto_405401 ?auto_405403 ) ) ( not ( = ?auto_405401 ?auto_405404 ) ) ( not ( = ?auto_405401 ?auto_405405 ) ) ( not ( = ?auto_405401 ?auto_405408 ) ) ( not ( = ?auto_405402 ?auto_405403 ) ) ( not ( = ?auto_405402 ?auto_405404 ) ) ( not ( = ?auto_405402 ?auto_405405 ) ) ( not ( = ?auto_405402 ?auto_405408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405403 ?auto_405404 ?auto_405405 )
      ( MAKE-4CRATE-VERIFY ?auto_405401 ?auto_405402 ?auto_405403 ?auto_405404 ?auto_405405 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405412 - SURFACE
      ?auto_405413 - SURFACE
      ?auto_405414 - SURFACE
      ?auto_405415 - SURFACE
      ?auto_405416 - SURFACE
      ?auto_405417 - SURFACE
    )
    :vars
    (
      ?auto_405418 - HOIST
      ?auto_405419 - PLACE
      ?auto_405422 - PLACE
      ?auto_405423 - HOIST
      ?auto_405420 - SURFACE
      ?auto_405421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405418 ?auto_405419 ) ( IS-CRATE ?auto_405417 ) ( not ( = ?auto_405416 ?auto_405417 ) ) ( not ( = ?auto_405415 ?auto_405416 ) ) ( not ( = ?auto_405415 ?auto_405417 ) ) ( not ( = ?auto_405422 ?auto_405419 ) ) ( HOIST-AT ?auto_405423 ?auto_405422 ) ( not ( = ?auto_405418 ?auto_405423 ) ) ( SURFACE-AT ?auto_405417 ?auto_405422 ) ( ON ?auto_405417 ?auto_405420 ) ( CLEAR ?auto_405417 ) ( not ( = ?auto_405416 ?auto_405420 ) ) ( not ( = ?auto_405417 ?auto_405420 ) ) ( not ( = ?auto_405415 ?auto_405420 ) ) ( SURFACE-AT ?auto_405415 ?auto_405419 ) ( CLEAR ?auto_405415 ) ( IS-CRATE ?auto_405416 ) ( AVAILABLE ?auto_405418 ) ( TRUCK-AT ?auto_405421 ?auto_405422 ) ( LIFTING ?auto_405423 ?auto_405416 ) ( ON ?auto_405413 ?auto_405412 ) ( ON ?auto_405414 ?auto_405413 ) ( ON ?auto_405415 ?auto_405414 ) ( not ( = ?auto_405412 ?auto_405413 ) ) ( not ( = ?auto_405412 ?auto_405414 ) ) ( not ( = ?auto_405412 ?auto_405415 ) ) ( not ( = ?auto_405412 ?auto_405416 ) ) ( not ( = ?auto_405412 ?auto_405417 ) ) ( not ( = ?auto_405412 ?auto_405420 ) ) ( not ( = ?auto_405413 ?auto_405414 ) ) ( not ( = ?auto_405413 ?auto_405415 ) ) ( not ( = ?auto_405413 ?auto_405416 ) ) ( not ( = ?auto_405413 ?auto_405417 ) ) ( not ( = ?auto_405413 ?auto_405420 ) ) ( not ( = ?auto_405414 ?auto_405415 ) ) ( not ( = ?auto_405414 ?auto_405416 ) ) ( not ( = ?auto_405414 ?auto_405417 ) ) ( not ( = ?auto_405414 ?auto_405420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405415 ?auto_405416 ?auto_405417 )
      ( MAKE-5CRATE-VERIFY ?auto_405412 ?auto_405413 ?auto_405414 ?auto_405415 ?auto_405416 ?auto_405417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_405424 - SURFACE
      ?auto_405425 - SURFACE
    )
    :vars
    (
      ?auto_405426 - HOIST
      ?auto_405428 - PLACE
      ?auto_405427 - SURFACE
      ?auto_405431 - PLACE
      ?auto_405432 - HOIST
      ?auto_405429 - SURFACE
      ?auto_405430 - TRUCK
      ?auto_405433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405426 ?auto_405428 ) ( IS-CRATE ?auto_405425 ) ( not ( = ?auto_405424 ?auto_405425 ) ) ( not ( = ?auto_405427 ?auto_405424 ) ) ( not ( = ?auto_405427 ?auto_405425 ) ) ( not ( = ?auto_405431 ?auto_405428 ) ) ( HOIST-AT ?auto_405432 ?auto_405431 ) ( not ( = ?auto_405426 ?auto_405432 ) ) ( SURFACE-AT ?auto_405425 ?auto_405431 ) ( ON ?auto_405425 ?auto_405429 ) ( CLEAR ?auto_405425 ) ( not ( = ?auto_405424 ?auto_405429 ) ) ( not ( = ?auto_405425 ?auto_405429 ) ) ( not ( = ?auto_405427 ?auto_405429 ) ) ( SURFACE-AT ?auto_405427 ?auto_405428 ) ( CLEAR ?auto_405427 ) ( IS-CRATE ?auto_405424 ) ( AVAILABLE ?auto_405426 ) ( TRUCK-AT ?auto_405430 ?auto_405431 ) ( AVAILABLE ?auto_405432 ) ( SURFACE-AT ?auto_405424 ?auto_405431 ) ( ON ?auto_405424 ?auto_405433 ) ( CLEAR ?auto_405424 ) ( not ( = ?auto_405424 ?auto_405433 ) ) ( not ( = ?auto_405425 ?auto_405433 ) ) ( not ( = ?auto_405427 ?auto_405433 ) ) ( not ( = ?auto_405429 ?auto_405433 ) ) )
    :subtasks
    ( ( !LIFT ?auto_405432 ?auto_405424 ?auto_405433 ?auto_405431 )
      ( MAKE-2CRATE ?auto_405427 ?auto_405424 ?auto_405425 )
      ( MAKE-1CRATE-VERIFY ?auto_405424 ?auto_405425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_405434 - SURFACE
      ?auto_405435 - SURFACE
      ?auto_405436 - SURFACE
    )
    :vars
    (
      ?auto_405442 - HOIST
      ?auto_405437 - PLACE
      ?auto_405443 - PLACE
      ?auto_405439 - HOIST
      ?auto_405441 - SURFACE
      ?auto_405440 - TRUCK
      ?auto_405438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405442 ?auto_405437 ) ( IS-CRATE ?auto_405436 ) ( not ( = ?auto_405435 ?auto_405436 ) ) ( not ( = ?auto_405434 ?auto_405435 ) ) ( not ( = ?auto_405434 ?auto_405436 ) ) ( not ( = ?auto_405443 ?auto_405437 ) ) ( HOIST-AT ?auto_405439 ?auto_405443 ) ( not ( = ?auto_405442 ?auto_405439 ) ) ( SURFACE-AT ?auto_405436 ?auto_405443 ) ( ON ?auto_405436 ?auto_405441 ) ( CLEAR ?auto_405436 ) ( not ( = ?auto_405435 ?auto_405441 ) ) ( not ( = ?auto_405436 ?auto_405441 ) ) ( not ( = ?auto_405434 ?auto_405441 ) ) ( SURFACE-AT ?auto_405434 ?auto_405437 ) ( CLEAR ?auto_405434 ) ( IS-CRATE ?auto_405435 ) ( AVAILABLE ?auto_405442 ) ( TRUCK-AT ?auto_405440 ?auto_405443 ) ( AVAILABLE ?auto_405439 ) ( SURFACE-AT ?auto_405435 ?auto_405443 ) ( ON ?auto_405435 ?auto_405438 ) ( CLEAR ?auto_405435 ) ( not ( = ?auto_405435 ?auto_405438 ) ) ( not ( = ?auto_405436 ?auto_405438 ) ) ( not ( = ?auto_405434 ?auto_405438 ) ) ( not ( = ?auto_405441 ?auto_405438 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405435 ?auto_405436 )
      ( MAKE-2CRATE-VERIFY ?auto_405434 ?auto_405435 ?auto_405436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405444 - SURFACE
      ?auto_405445 - SURFACE
      ?auto_405446 - SURFACE
      ?auto_405447 - SURFACE
    )
    :vars
    (
      ?auto_405449 - HOIST
      ?auto_405450 - PLACE
      ?auto_405454 - PLACE
      ?auto_405452 - HOIST
      ?auto_405448 - SURFACE
      ?auto_405451 - TRUCK
      ?auto_405453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405449 ?auto_405450 ) ( IS-CRATE ?auto_405447 ) ( not ( = ?auto_405446 ?auto_405447 ) ) ( not ( = ?auto_405445 ?auto_405446 ) ) ( not ( = ?auto_405445 ?auto_405447 ) ) ( not ( = ?auto_405454 ?auto_405450 ) ) ( HOIST-AT ?auto_405452 ?auto_405454 ) ( not ( = ?auto_405449 ?auto_405452 ) ) ( SURFACE-AT ?auto_405447 ?auto_405454 ) ( ON ?auto_405447 ?auto_405448 ) ( CLEAR ?auto_405447 ) ( not ( = ?auto_405446 ?auto_405448 ) ) ( not ( = ?auto_405447 ?auto_405448 ) ) ( not ( = ?auto_405445 ?auto_405448 ) ) ( SURFACE-AT ?auto_405445 ?auto_405450 ) ( CLEAR ?auto_405445 ) ( IS-CRATE ?auto_405446 ) ( AVAILABLE ?auto_405449 ) ( TRUCK-AT ?auto_405451 ?auto_405454 ) ( AVAILABLE ?auto_405452 ) ( SURFACE-AT ?auto_405446 ?auto_405454 ) ( ON ?auto_405446 ?auto_405453 ) ( CLEAR ?auto_405446 ) ( not ( = ?auto_405446 ?auto_405453 ) ) ( not ( = ?auto_405447 ?auto_405453 ) ) ( not ( = ?auto_405445 ?auto_405453 ) ) ( not ( = ?auto_405448 ?auto_405453 ) ) ( ON ?auto_405445 ?auto_405444 ) ( not ( = ?auto_405444 ?auto_405445 ) ) ( not ( = ?auto_405444 ?auto_405446 ) ) ( not ( = ?auto_405444 ?auto_405447 ) ) ( not ( = ?auto_405444 ?auto_405448 ) ) ( not ( = ?auto_405444 ?auto_405453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405445 ?auto_405446 ?auto_405447 )
      ( MAKE-3CRATE-VERIFY ?auto_405444 ?auto_405445 ?auto_405446 ?auto_405447 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405455 - SURFACE
      ?auto_405456 - SURFACE
      ?auto_405457 - SURFACE
      ?auto_405458 - SURFACE
      ?auto_405459 - SURFACE
    )
    :vars
    (
      ?auto_405461 - HOIST
      ?auto_405462 - PLACE
      ?auto_405466 - PLACE
      ?auto_405464 - HOIST
      ?auto_405460 - SURFACE
      ?auto_405463 - TRUCK
      ?auto_405465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405461 ?auto_405462 ) ( IS-CRATE ?auto_405459 ) ( not ( = ?auto_405458 ?auto_405459 ) ) ( not ( = ?auto_405457 ?auto_405458 ) ) ( not ( = ?auto_405457 ?auto_405459 ) ) ( not ( = ?auto_405466 ?auto_405462 ) ) ( HOIST-AT ?auto_405464 ?auto_405466 ) ( not ( = ?auto_405461 ?auto_405464 ) ) ( SURFACE-AT ?auto_405459 ?auto_405466 ) ( ON ?auto_405459 ?auto_405460 ) ( CLEAR ?auto_405459 ) ( not ( = ?auto_405458 ?auto_405460 ) ) ( not ( = ?auto_405459 ?auto_405460 ) ) ( not ( = ?auto_405457 ?auto_405460 ) ) ( SURFACE-AT ?auto_405457 ?auto_405462 ) ( CLEAR ?auto_405457 ) ( IS-CRATE ?auto_405458 ) ( AVAILABLE ?auto_405461 ) ( TRUCK-AT ?auto_405463 ?auto_405466 ) ( AVAILABLE ?auto_405464 ) ( SURFACE-AT ?auto_405458 ?auto_405466 ) ( ON ?auto_405458 ?auto_405465 ) ( CLEAR ?auto_405458 ) ( not ( = ?auto_405458 ?auto_405465 ) ) ( not ( = ?auto_405459 ?auto_405465 ) ) ( not ( = ?auto_405457 ?auto_405465 ) ) ( not ( = ?auto_405460 ?auto_405465 ) ) ( ON ?auto_405456 ?auto_405455 ) ( ON ?auto_405457 ?auto_405456 ) ( not ( = ?auto_405455 ?auto_405456 ) ) ( not ( = ?auto_405455 ?auto_405457 ) ) ( not ( = ?auto_405455 ?auto_405458 ) ) ( not ( = ?auto_405455 ?auto_405459 ) ) ( not ( = ?auto_405455 ?auto_405460 ) ) ( not ( = ?auto_405455 ?auto_405465 ) ) ( not ( = ?auto_405456 ?auto_405457 ) ) ( not ( = ?auto_405456 ?auto_405458 ) ) ( not ( = ?auto_405456 ?auto_405459 ) ) ( not ( = ?auto_405456 ?auto_405460 ) ) ( not ( = ?auto_405456 ?auto_405465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405457 ?auto_405458 ?auto_405459 )
      ( MAKE-4CRATE-VERIFY ?auto_405455 ?auto_405456 ?auto_405457 ?auto_405458 ?auto_405459 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405467 - SURFACE
      ?auto_405468 - SURFACE
      ?auto_405469 - SURFACE
      ?auto_405470 - SURFACE
      ?auto_405471 - SURFACE
      ?auto_405472 - SURFACE
    )
    :vars
    (
      ?auto_405474 - HOIST
      ?auto_405475 - PLACE
      ?auto_405479 - PLACE
      ?auto_405477 - HOIST
      ?auto_405473 - SURFACE
      ?auto_405476 - TRUCK
      ?auto_405478 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405474 ?auto_405475 ) ( IS-CRATE ?auto_405472 ) ( not ( = ?auto_405471 ?auto_405472 ) ) ( not ( = ?auto_405470 ?auto_405471 ) ) ( not ( = ?auto_405470 ?auto_405472 ) ) ( not ( = ?auto_405479 ?auto_405475 ) ) ( HOIST-AT ?auto_405477 ?auto_405479 ) ( not ( = ?auto_405474 ?auto_405477 ) ) ( SURFACE-AT ?auto_405472 ?auto_405479 ) ( ON ?auto_405472 ?auto_405473 ) ( CLEAR ?auto_405472 ) ( not ( = ?auto_405471 ?auto_405473 ) ) ( not ( = ?auto_405472 ?auto_405473 ) ) ( not ( = ?auto_405470 ?auto_405473 ) ) ( SURFACE-AT ?auto_405470 ?auto_405475 ) ( CLEAR ?auto_405470 ) ( IS-CRATE ?auto_405471 ) ( AVAILABLE ?auto_405474 ) ( TRUCK-AT ?auto_405476 ?auto_405479 ) ( AVAILABLE ?auto_405477 ) ( SURFACE-AT ?auto_405471 ?auto_405479 ) ( ON ?auto_405471 ?auto_405478 ) ( CLEAR ?auto_405471 ) ( not ( = ?auto_405471 ?auto_405478 ) ) ( not ( = ?auto_405472 ?auto_405478 ) ) ( not ( = ?auto_405470 ?auto_405478 ) ) ( not ( = ?auto_405473 ?auto_405478 ) ) ( ON ?auto_405468 ?auto_405467 ) ( ON ?auto_405469 ?auto_405468 ) ( ON ?auto_405470 ?auto_405469 ) ( not ( = ?auto_405467 ?auto_405468 ) ) ( not ( = ?auto_405467 ?auto_405469 ) ) ( not ( = ?auto_405467 ?auto_405470 ) ) ( not ( = ?auto_405467 ?auto_405471 ) ) ( not ( = ?auto_405467 ?auto_405472 ) ) ( not ( = ?auto_405467 ?auto_405473 ) ) ( not ( = ?auto_405467 ?auto_405478 ) ) ( not ( = ?auto_405468 ?auto_405469 ) ) ( not ( = ?auto_405468 ?auto_405470 ) ) ( not ( = ?auto_405468 ?auto_405471 ) ) ( not ( = ?auto_405468 ?auto_405472 ) ) ( not ( = ?auto_405468 ?auto_405473 ) ) ( not ( = ?auto_405468 ?auto_405478 ) ) ( not ( = ?auto_405469 ?auto_405470 ) ) ( not ( = ?auto_405469 ?auto_405471 ) ) ( not ( = ?auto_405469 ?auto_405472 ) ) ( not ( = ?auto_405469 ?auto_405473 ) ) ( not ( = ?auto_405469 ?auto_405478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405470 ?auto_405471 ?auto_405472 )
      ( MAKE-5CRATE-VERIFY ?auto_405467 ?auto_405468 ?auto_405469 ?auto_405470 ?auto_405471 ?auto_405472 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_405480 - SURFACE
      ?auto_405481 - SURFACE
    )
    :vars
    (
      ?auto_405483 - HOIST
      ?auto_405484 - PLACE
      ?auto_405489 - SURFACE
      ?auto_405488 - PLACE
      ?auto_405486 - HOIST
      ?auto_405482 - SURFACE
      ?auto_405487 - SURFACE
      ?auto_405485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405483 ?auto_405484 ) ( IS-CRATE ?auto_405481 ) ( not ( = ?auto_405480 ?auto_405481 ) ) ( not ( = ?auto_405489 ?auto_405480 ) ) ( not ( = ?auto_405489 ?auto_405481 ) ) ( not ( = ?auto_405488 ?auto_405484 ) ) ( HOIST-AT ?auto_405486 ?auto_405488 ) ( not ( = ?auto_405483 ?auto_405486 ) ) ( SURFACE-AT ?auto_405481 ?auto_405488 ) ( ON ?auto_405481 ?auto_405482 ) ( CLEAR ?auto_405481 ) ( not ( = ?auto_405480 ?auto_405482 ) ) ( not ( = ?auto_405481 ?auto_405482 ) ) ( not ( = ?auto_405489 ?auto_405482 ) ) ( SURFACE-AT ?auto_405489 ?auto_405484 ) ( CLEAR ?auto_405489 ) ( IS-CRATE ?auto_405480 ) ( AVAILABLE ?auto_405483 ) ( AVAILABLE ?auto_405486 ) ( SURFACE-AT ?auto_405480 ?auto_405488 ) ( ON ?auto_405480 ?auto_405487 ) ( CLEAR ?auto_405480 ) ( not ( = ?auto_405480 ?auto_405487 ) ) ( not ( = ?auto_405481 ?auto_405487 ) ) ( not ( = ?auto_405489 ?auto_405487 ) ) ( not ( = ?auto_405482 ?auto_405487 ) ) ( TRUCK-AT ?auto_405485 ?auto_405484 ) )
    :subtasks
    ( ( !DRIVE ?auto_405485 ?auto_405484 ?auto_405488 )
      ( MAKE-2CRATE ?auto_405489 ?auto_405480 ?auto_405481 )
      ( MAKE-1CRATE-VERIFY ?auto_405480 ?auto_405481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_405490 - SURFACE
      ?auto_405491 - SURFACE
      ?auto_405492 - SURFACE
    )
    :vars
    (
      ?auto_405497 - HOIST
      ?auto_405493 - PLACE
      ?auto_405496 - PLACE
      ?auto_405498 - HOIST
      ?auto_405495 - SURFACE
      ?auto_405499 - SURFACE
      ?auto_405494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405497 ?auto_405493 ) ( IS-CRATE ?auto_405492 ) ( not ( = ?auto_405491 ?auto_405492 ) ) ( not ( = ?auto_405490 ?auto_405491 ) ) ( not ( = ?auto_405490 ?auto_405492 ) ) ( not ( = ?auto_405496 ?auto_405493 ) ) ( HOIST-AT ?auto_405498 ?auto_405496 ) ( not ( = ?auto_405497 ?auto_405498 ) ) ( SURFACE-AT ?auto_405492 ?auto_405496 ) ( ON ?auto_405492 ?auto_405495 ) ( CLEAR ?auto_405492 ) ( not ( = ?auto_405491 ?auto_405495 ) ) ( not ( = ?auto_405492 ?auto_405495 ) ) ( not ( = ?auto_405490 ?auto_405495 ) ) ( SURFACE-AT ?auto_405490 ?auto_405493 ) ( CLEAR ?auto_405490 ) ( IS-CRATE ?auto_405491 ) ( AVAILABLE ?auto_405497 ) ( AVAILABLE ?auto_405498 ) ( SURFACE-AT ?auto_405491 ?auto_405496 ) ( ON ?auto_405491 ?auto_405499 ) ( CLEAR ?auto_405491 ) ( not ( = ?auto_405491 ?auto_405499 ) ) ( not ( = ?auto_405492 ?auto_405499 ) ) ( not ( = ?auto_405490 ?auto_405499 ) ) ( not ( = ?auto_405495 ?auto_405499 ) ) ( TRUCK-AT ?auto_405494 ?auto_405493 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405491 ?auto_405492 )
      ( MAKE-2CRATE-VERIFY ?auto_405490 ?auto_405491 ?auto_405492 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405500 - SURFACE
      ?auto_405501 - SURFACE
      ?auto_405502 - SURFACE
      ?auto_405503 - SURFACE
    )
    :vars
    (
      ?auto_405504 - HOIST
      ?auto_405508 - PLACE
      ?auto_405507 - PLACE
      ?auto_405506 - HOIST
      ?auto_405510 - SURFACE
      ?auto_405509 - SURFACE
      ?auto_405505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405504 ?auto_405508 ) ( IS-CRATE ?auto_405503 ) ( not ( = ?auto_405502 ?auto_405503 ) ) ( not ( = ?auto_405501 ?auto_405502 ) ) ( not ( = ?auto_405501 ?auto_405503 ) ) ( not ( = ?auto_405507 ?auto_405508 ) ) ( HOIST-AT ?auto_405506 ?auto_405507 ) ( not ( = ?auto_405504 ?auto_405506 ) ) ( SURFACE-AT ?auto_405503 ?auto_405507 ) ( ON ?auto_405503 ?auto_405510 ) ( CLEAR ?auto_405503 ) ( not ( = ?auto_405502 ?auto_405510 ) ) ( not ( = ?auto_405503 ?auto_405510 ) ) ( not ( = ?auto_405501 ?auto_405510 ) ) ( SURFACE-AT ?auto_405501 ?auto_405508 ) ( CLEAR ?auto_405501 ) ( IS-CRATE ?auto_405502 ) ( AVAILABLE ?auto_405504 ) ( AVAILABLE ?auto_405506 ) ( SURFACE-AT ?auto_405502 ?auto_405507 ) ( ON ?auto_405502 ?auto_405509 ) ( CLEAR ?auto_405502 ) ( not ( = ?auto_405502 ?auto_405509 ) ) ( not ( = ?auto_405503 ?auto_405509 ) ) ( not ( = ?auto_405501 ?auto_405509 ) ) ( not ( = ?auto_405510 ?auto_405509 ) ) ( TRUCK-AT ?auto_405505 ?auto_405508 ) ( ON ?auto_405501 ?auto_405500 ) ( not ( = ?auto_405500 ?auto_405501 ) ) ( not ( = ?auto_405500 ?auto_405502 ) ) ( not ( = ?auto_405500 ?auto_405503 ) ) ( not ( = ?auto_405500 ?auto_405510 ) ) ( not ( = ?auto_405500 ?auto_405509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405501 ?auto_405502 ?auto_405503 )
      ( MAKE-3CRATE-VERIFY ?auto_405500 ?auto_405501 ?auto_405502 ?auto_405503 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405511 - SURFACE
      ?auto_405512 - SURFACE
      ?auto_405513 - SURFACE
      ?auto_405514 - SURFACE
      ?auto_405515 - SURFACE
    )
    :vars
    (
      ?auto_405516 - HOIST
      ?auto_405520 - PLACE
      ?auto_405519 - PLACE
      ?auto_405518 - HOIST
      ?auto_405522 - SURFACE
      ?auto_405521 - SURFACE
      ?auto_405517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405516 ?auto_405520 ) ( IS-CRATE ?auto_405515 ) ( not ( = ?auto_405514 ?auto_405515 ) ) ( not ( = ?auto_405513 ?auto_405514 ) ) ( not ( = ?auto_405513 ?auto_405515 ) ) ( not ( = ?auto_405519 ?auto_405520 ) ) ( HOIST-AT ?auto_405518 ?auto_405519 ) ( not ( = ?auto_405516 ?auto_405518 ) ) ( SURFACE-AT ?auto_405515 ?auto_405519 ) ( ON ?auto_405515 ?auto_405522 ) ( CLEAR ?auto_405515 ) ( not ( = ?auto_405514 ?auto_405522 ) ) ( not ( = ?auto_405515 ?auto_405522 ) ) ( not ( = ?auto_405513 ?auto_405522 ) ) ( SURFACE-AT ?auto_405513 ?auto_405520 ) ( CLEAR ?auto_405513 ) ( IS-CRATE ?auto_405514 ) ( AVAILABLE ?auto_405516 ) ( AVAILABLE ?auto_405518 ) ( SURFACE-AT ?auto_405514 ?auto_405519 ) ( ON ?auto_405514 ?auto_405521 ) ( CLEAR ?auto_405514 ) ( not ( = ?auto_405514 ?auto_405521 ) ) ( not ( = ?auto_405515 ?auto_405521 ) ) ( not ( = ?auto_405513 ?auto_405521 ) ) ( not ( = ?auto_405522 ?auto_405521 ) ) ( TRUCK-AT ?auto_405517 ?auto_405520 ) ( ON ?auto_405512 ?auto_405511 ) ( ON ?auto_405513 ?auto_405512 ) ( not ( = ?auto_405511 ?auto_405512 ) ) ( not ( = ?auto_405511 ?auto_405513 ) ) ( not ( = ?auto_405511 ?auto_405514 ) ) ( not ( = ?auto_405511 ?auto_405515 ) ) ( not ( = ?auto_405511 ?auto_405522 ) ) ( not ( = ?auto_405511 ?auto_405521 ) ) ( not ( = ?auto_405512 ?auto_405513 ) ) ( not ( = ?auto_405512 ?auto_405514 ) ) ( not ( = ?auto_405512 ?auto_405515 ) ) ( not ( = ?auto_405512 ?auto_405522 ) ) ( not ( = ?auto_405512 ?auto_405521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405513 ?auto_405514 ?auto_405515 )
      ( MAKE-4CRATE-VERIFY ?auto_405511 ?auto_405512 ?auto_405513 ?auto_405514 ?auto_405515 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405523 - SURFACE
      ?auto_405524 - SURFACE
      ?auto_405525 - SURFACE
      ?auto_405526 - SURFACE
      ?auto_405527 - SURFACE
      ?auto_405528 - SURFACE
    )
    :vars
    (
      ?auto_405529 - HOIST
      ?auto_405533 - PLACE
      ?auto_405532 - PLACE
      ?auto_405531 - HOIST
      ?auto_405535 - SURFACE
      ?auto_405534 - SURFACE
      ?auto_405530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405529 ?auto_405533 ) ( IS-CRATE ?auto_405528 ) ( not ( = ?auto_405527 ?auto_405528 ) ) ( not ( = ?auto_405526 ?auto_405527 ) ) ( not ( = ?auto_405526 ?auto_405528 ) ) ( not ( = ?auto_405532 ?auto_405533 ) ) ( HOIST-AT ?auto_405531 ?auto_405532 ) ( not ( = ?auto_405529 ?auto_405531 ) ) ( SURFACE-AT ?auto_405528 ?auto_405532 ) ( ON ?auto_405528 ?auto_405535 ) ( CLEAR ?auto_405528 ) ( not ( = ?auto_405527 ?auto_405535 ) ) ( not ( = ?auto_405528 ?auto_405535 ) ) ( not ( = ?auto_405526 ?auto_405535 ) ) ( SURFACE-AT ?auto_405526 ?auto_405533 ) ( CLEAR ?auto_405526 ) ( IS-CRATE ?auto_405527 ) ( AVAILABLE ?auto_405529 ) ( AVAILABLE ?auto_405531 ) ( SURFACE-AT ?auto_405527 ?auto_405532 ) ( ON ?auto_405527 ?auto_405534 ) ( CLEAR ?auto_405527 ) ( not ( = ?auto_405527 ?auto_405534 ) ) ( not ( = ?auto_405528 ?auto_405534 ) ) ( not ( = ?auto_405526 ?auto_405534 ) ) ( not ( = ?auto_405535 ?auto_405534 ) ) ( TRUCK-AT ?auto_405530 ?auto_405533 ) ( ON ?auto_405524 ?auto_405523 ) ( ON ?auto_405525 ?auto_405524 ) ( ON ?auto_405526 ?auto_405525 ) ( not ( = ?auto_405523 ?auto_405524 ) ) ( not ( = ?auto_405523 ?auto_405525 ) ) ( not ( = ?auto_405523 ?auto_405526 ) ) ( not ( = ?auto_405523 ?auto_405527 ) ) ( not ( = ?auto_405523 ?auto_405528 ) ) ( not ( = ?auto_405523 ?auto_405535 ) ) ( not ( = ?auto_405523 ?auto_405534 ) ) ( not ( = ?auto_405524 ?auto_405525 ) ) ( not ( = ?auto_405524 ?auto_405526 ) ) ( not ( = ?auto_405524 ?auto_405527 ) ) ( not ( = ?auto_405524 ?auto_405528 ) ) ( not ( = ?auto_405524 ?auto_405535 ) ) ( not ( = ?auto_405524 ?auto_405534 ) ) ( not ( = ?auto_405525 ?auto_405526 ) ) ( not ( = ?auto_405525 ?auto_405527 ) ) ( not ( = ?auto_405525 ?auto_405528 ) ) ( not ( = ?auto_405525 ?auto_405535 ) ) ( not ( = ?auto_405525 ?auto_405534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405526 ?auto_405527 ?auto_405528 )
      ( MAKE-5CRATE-VERIFY ?auto_405523 ?auto_405524 ?auto_405525 ?auto_405526 ?auto_405527 ?auto_405528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_405536 - SURFACE
      ?auto_405537 - SURFACE
    )
    :vars
    (
      ?auto_405538 - HOIST
      ?auto_405542 - PLACE
      ?auto_405545 - SURFACE
      ?auto_405541 - PLACE
      ?auto_405540 - HOIST
      ?auto_405544 - SURFACE
      ?auto_405543 - SURFACE
      ?auto_405539 - TRUCK
      ?auto_405546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405538 ?auto_405542 ) ( IS-CRATE ?auto_405537 ) ( not ( = ?auto_405536 ?auto_405537 ) ) ( not ( = ?auto_405545 ?auto_405536 ) ) ( not ( = ?auto_405545 ?auto_405537 ) ) ( not ( = ?auto_405541 ?auto_405542 ) ) ( HOIST-AT ?auto_405540 ?auto_405541 ) ( not ( = ?auto_405538 ?auto_405540 ) ) ( SURFACE-AT ?auto_405537 ?auto_405541 ) ( ON ?auto_405537 ?auto_405544 ) ( CLEAR ?auto_405537 ) ( not ( = ?auto_405536 ?auto_405544 ) ) ( not ( = ?auto_405537 ?auto_405544 ) ) ( not ( = ?auto_405545 ?auto_405544 ) ) ( IS-CRATE ?auto_405536 ) ( AVAILABLE ?auto_405540 ) ( SURFACE-AT ?auto_405536 ?auto_405541 ) ( ON ?auto_405536 ?auto_405543 ) ( CLEAR ?auto_405536 ) ( not ( = ?auto_405536 ?auto_405543 ) ) ( not ( = ?auto_405537 ?auto_405543 ) ) ( not ( = ?auto_405545 ?auto_405543 ) ) ( not ( = ?auto_405544 ?auto_405543 ) ) ( TRUCK-AT ?auto_405539 ?auto_405542 ) ( SURFACE-AT ?auto_405546 ?auto_405542 ) ( CLEAR ?auto_405546 ) ( LIFTING ?auto_405538 ?auto_405545 ) ( IS-CRATE ?auto_405545 ) ( not ( = ?auto_405546 ?auto_405545 ) ) ( not ( = ?auto_405536 ?auto_405546 ) ) ( not ( = ?auto_405537 ?auto_405546 ) ) ( not ( = ?auto_405544 ?auto_405546 ) ) ( not ( = ?auto_405543 ?auto_405546 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405546 ?auto_405545 )
      ( MAKE-2CRATE ?auto_405545 ?auto_405536 ?auto_405537 )
      ( MAKE-1CRATE-VERIFY ?auto_405536 ?auto_405537 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_405547 - SURFACE
      ?auto_405548 - SURFACE
      ?auto_405549 - SURFACE
    )
    :vars
    (
      ?auto_405554 - HOIST
      ?auto_405552 - PLACE
      ?auto_405551 - PLACE
      ?auto_405557 - HOIST
      ?auto_405556 - SURFACE
      ?auto_405553 - SURFACE
      ?auto_405550 - TRUCK
      ?auto_405555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405554 ?auto_405552 ) ( IS-CRATE ?auto_405549 ) ( not ( = ?auto_405548 ?auto_405549 ) ) ( not ( = ?auto_405547 ?auto_405548 ) ) ( not ( = ?auto_405547 ?auto_405549 ) ) ( not ( = ?auto_405551 ?auto_405552 ) ) ( HOIST-AT ?auto_405557 ?auto_405551 ) ( not ( = ?auto_405554 ?auto_405557 ) ) ( SURFACE-AT ?auto_405549 ?auto_405551 ) ( ON ?auto_405549 ?auto_405556 ) ( CLEAR ?auto_405549 ) ( not ( = ?auto_405548 ?auto_405556 ) ) ( not ( = ?auto_405549 ?auto_405556 ) ) ( not ( = ?auto_405547 ?auto_405556 ) ) ( IS-CRATE ?auto_405548 ) ( AVAILABLE ?auto_405557 ) ( SURFACE-AT ?auto_405548 ?auto_405551 ) ( ON ?auto_405548 ?auto_405553 ) ( CLEAR ?auto_405548 ) ( not ( = ?auto_405548 ?auto_405553 ) ) ( not ( = ?auto_405549 ?auto_405553 ) ) ( not ( = ?auto_405547 ?auto_405553 ) ) ( not ( = ?auto_405556 ?auto_405553 ) ) ( TRUCK-AT ?auto_405550 ?auto_405552 ) ( SURFACE-AT ?auto_405555 ?auto_405552 ) ( CLEAR ?auto_405555 ) ( LIFTING ?auto_405554 ?auto_405547 ) ( IS-CRATE ?auto_405547 ) ( not ( = ?auto_405555 ?auto_405547 ) ) ( not ( = ?auto_405548 ?auto_405555 ) ) ( not ( = ?auto_405549 ?auto_405555 ) ) ( not ( = ?auto_405556 ?auto_405555 ) ) ( not ( = ?auto_405553 ?auto_405555 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405548 ?auto_405549 )
      ( MAKE-2CRATE-VERIFY ?auto_405547 ?auto_405548 ?auto_405549 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405558 - SURFACE
      ?auto_405559 - SURFACE
      ?auto_405560 - SURFACE
      ?auto_405561 - SURFACE
    )
    :vars
    (
      ?auto_405568 - HOIST
      ?auto_405566 - PLACE
      ?auto_405564 - PLACE
      ?auto_405562 - HOIST
      ?auto_405563 - SURFACE
      ?auto_405567 - SURFACE
      ?auto_405565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405568 ?auto_405566 ) ( IS-CRATE ?auto_405561 ) ( not ( = ?auto_405560 ?auto_405561 ) ) ( not ( = ?auto_405559 ?auto_405560 ) ) ( not ( = ?auto_405559 ?auto_405561 ) ) ( not ( = ?auto_405564 ?auto_405566 ) ) ( HOIST-AT ?auto_405562 ?auto_405564 ) ( not ( = ?auto_405568 ?auto_405562 ) ) ( SURFACE-AT ?auto_405561 ?auto_405564 ) ( ON ?auto_405561 ?auto_405563 ) ( CLEAR ?auto_405561 ) ( not ( = ?auto_405560 ?auto_405563 ) ) ( not ( = ?auto_405561 ?auto_405563 ) ) ( not ( = ?auto_405559 ?auto_405563 ) ) ( IS-CRATE ?auto_405560 ) ( AVAILABLE ?auto_405562 ) ( SURFACE-AT ?auto_405560 ?auto_405564 ) ( ON ?auto_405560 ?auto_405567 ) ( CLEAR ?auto_405560 ) ( not ( = ?auto_405560 ?auto_405567 ) ) ( not ( = ?auto_405561 ?auto_405567 ) ) ( not ( = ?auto_405559 ?auto_405567 ) ) ( not ( = ?auto_405563 ?auto_405567 ) ) ( TRUCK-AT ?auto_405565 ?auto_405566 ) ( SURFACE-AT ?auto_405558 ?auto_405566 ) ( CLEAR ?auto_405558 ) ( LIFTING ?auto_405568 ?auto_405559 ) ( IS-CRATE ?auto_405559 ) ( not ( = ?auto_405558 ?auto_405559 ) ) ( not ( = ?auto_405560 ?auto_405558 ) ) ( not ( = ?auto_405561 ?auto_405558 ) ) ( not ( = ?auto_405563 ?auto_405558 ) ) ( not ( = ?auto_405567 ?auto_405558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405559 ?auto_405560 ?auto_405561 )
      ( MAKE-3CRATE-VERIFY ?auto_405558 ?auto_405559 ?auto_405560 ?auto_405561 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405569 - SURFACE
      ?auto_405570 - SURFACE
      ?auto_405571 - SURFACE
      ?auto_405572 - SURFACE
      ?auto_405573 - SURFACE
    )
    :vars
    (
      ?auto_405580 - HOIST
      ?auto_405578 - PLACE
      ?auto_405576 - PLACE
      ?auto_405574 - HOIST
      ?auto_405575 - SURFACE
      ?auto_405579 - SURFACE
      ?auto_405577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405580 ?auto_405578 ) ( IS-CRATE ?auto_405573 ) ( not ( = ?auto_405572 ?auto_405573 ) ) ( not ( = ?auto_405571 ?auto_405572 ) ) ( not ( = ?auto_405571 ?auto_405573 ) ) ( not ( = ?auto_405576 ?auto_405578 ) ) ( HOIST-AT ?auto_405574 ?auto_405576 ) ( not ( = ?auto_405580 ?auto_405574 ) ) ( SURFACE-AT ?auto_405573 ?auto_405576 ) ( ON ?auto_405573 ?auto_405575 ) ( CLEAR ?auto_405573 ) ( not ( = ?auto_405572 ?auto_405575 ) ) ( not ( = ?auto_405573 ?auto_405575 ) ) ( not ( = ?auto_405571 ?auto_405575 ) ) ( IS-CRATE ?auto_405572 ) ( AVAILABLE ?auto_405574 ) ( SURFACE-AT ?auto_405572 ?auto_405576 ) ( ON ?auto_405572 ?auto_405579 ) ( CLEAR ?auto_405572 ) ( not ( = ?auto_405572 ?auto_405579 ) ) ( not ( = ?auto_405573 ?auto_405579 ) ) ( not ( = ?auto_405571 ?auto_405579 ) ) ( not ( = ?auto_405575 ?auto_405579 ) ) ( TRUCK-AT ?auto_405577 ?auto_405578 ) ( SURFACE-AT ?auto_405570 ?auto_405578 ) ( CLEAR ?auto_405570 ) ( LIFTING ?auto_405580 ?auto_405571 ) ( IS-CRATE ?auto_405571 ) ( not ( = ?auto_405570 ?auto_405571 ) ) ( not ( = ?auto_405572 ?auto_405570 ) ) ( not ( = ?auto_405573 ?auto_405570 ) ) ( not ( = ?auto_405575 ?auto_405570 ) ) ( not ( = ?auto_405579 ?auto_405570 ) ) ( ON ?auto_405570 ?auto_405569 ) ( not ( = ?auto_405569 ?auto_405570 ) ) ( not ( = ?auto_405569 ?auto_405571 ) ) ( not ( = ?auto_405569 ?auto_405572 ) ) ( not ( = ?auto_405569 ?auto_405573 ) ) ( not ( = ?auto_405569 ?auto_405575 ) ) ( not ( = ?auto_405569 ?auto_405579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405571 ?auto_405572 ?auto_405573 )
      ( MAKE-4CRATE-VERIFY ?auto_405569 ?auto_405570 ?auto_405571 ?auto_405572 ?auto_405573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405581 - SURFACE
      ?auto_405582 - SURFACE
      ?auto_405583 - SURFACE
      ?auto_405584 - SURFACE
      ?auto_405585 - SURFACE
      ?auto_405586 - SURFACE
    )
    :vars
    (
      ?auto_405593 - HOIST
      ?auto_405591 - PLACE
      ?auto_405589 - PLACE
      ?auto_405587 - HOIST
      ?auto_405588 - SURFACE
      ?auto_405592 - SURFACE
      ?auto_405590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405593 ?auto_405591 ) ( IS-CRATE ?auto_405586 ) ( not ( = ?auto_405585 ?auto_405586 ) ) ( not ( = ?auto_405584 ?auto_405585 ) ) ( not ( = ?auto_405584 ?auto_405586 ) ) ( not ( = ?auto_405589 ?auto_405591 ) ) ( HOIST-AT ?auto_405587 ?auto_405589 ) ( not ( = ?auto_405593 ?auto_405587 ) ) ( SURFACE-AT ?auto_405586 ?auto_405589 ) ( ON ?auto_405586 ?auto_405588 ) ( CLEAR ?auto_405586 ) ( not ( = ?auto_405585 ?auto_405588 ) ) ( not ( = ?auto_405586 ?auto_405588 ) ) ( not ( = ?auto_405584 ?auto_405588 ) ) ( IS-CRATE ?auto_405585 ) ( AVAILABLE ?auto_405587 ) ( SURFACE-AT ?auto_405585 ?auto_405589 ) ( ON ?auto_405585 ?auto_405592 ) ( CLEAR ?auto_405585 ) ( not ( = ?auto_405585 ?auto_405592 ) ) ( not ( = ?auto_405586 ?auto_405592 ) ) ( not ( = ?auto_405584 ?auto_405592 ) ) ( not ( = ?auto_405588 ?auto_405592 ) ) ( TRUCK-AT ?auto_405590 ?auto_405591 ) ( SURFACE-AT ?auto_405583 ?auto_405591 ) ( CLEAR ?auto_405583 ) ( LIFTING ?auto_405593 ?auto_405584 ) ( IS-CRATE ?auto_405584 ) ( not ( = ?auto_405583 ?auto_405584 ) ) ( not ( = ?auto_405585 ?auto_405583 ) ) ( not ( = ?auto_405586 ?auto_405583 ) ) ( not ( = ?auto_405588 ?auto_405583 ) ) ( not ( = ?auto_405592 ?auto_405583 ) ) ( ON ?auto_405582 ?auto_405581 ) ( ON ?auto_405583 ?auto_405582 ) ( not ( = ?auto_405581 ?auto_405582 ) ) ( not ( = ?auto_405581 ?auto_405583 ) ) ( not ( = ?auto_405581 ?auto_405584 ) ) ( not ( = ?auto_405581 ?auto_405585 ) ) ( not ( = ?auto_405581 ?auto_405586 ) ) ( not ( = ?auto_405581 ?auto_405588 ) ) ( not ( = ?auto_405581 ?auto_405592 ) ) ( not ( = ?auto_405582 ?auto_405583 ) ) ( not ( = ?auto_405582 ?auto_405584 ) ) ( not ( = ?auto_405582 ?auto_405585 ) ) ( not ( = ?auto_405582 ?auto_405586 ) ) ( not ( = ?auto_405582 ?auto_405588 ) ) ( not ( = ?auto_405582 ?auto_405592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405584 ?auto_405585 ?auto_405586 )
      ( MAKE-5CRATE-VERIFY ?auto_405581 ?auto_405582 ?auto_405583 ?auto_405584 ?auto_405585 ?auto_405586 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406502 - SURFACE
      ?auto_406503 - SURFACE
      ?auto_406504 - SURFACE
      ?auto_406505 - SURFACE
      ?auto_406506 - SURFACE
      ?auto_406507 - SURFACE
      ?auto_406508 - SURFACE
    )
    :vars
    (
      ?auto_406510 - HOIST
      ?auto_406509 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406510 ?auto_406509 ) ( SURFACE-AT ?auto_406507 ?auto_406509 ) ( CLEAR ?auto_406507 ) ( LIFTING ?auto_406510 ?auto_406508 ) ( IS-CRATE ?auto_406508 ) ( not ( = ?auto_406507 ?auto_406508 ) ) ( ON ?auto_406503 ?auto_406502 ) ( ON ?auto_406504 ?auto_406503 ) ( ON ?auto_406505 ?auto_406504 ) ( ON ?auto_406506 ?auto_406505 ) ( ON ?auto_406507 ?auto_406506 ) ( not ( = ?auto_406502 ?auto_406503 ) ) ( not ( = ?auto_406502 ?auto_406504 ) ) ( not ( = ?auto_406502 ?auto_406505 ) ) ( not ( = ?auto_406502 ?auto_406506 ) ) ( not ( = ?auto_406502 ?auto_406507 ) ) ( not ( = ?auto_406502 ?auto_406508 ) ) ( not ( = ?auto_406503 ?auto_406504 ) ) ( not ( = ?auto_406503 ?auto_406505 ) ) ( not ( = ?auto_406503 ?auto_406506 ) ) ( not ( = ?auto_406503 ?auto_406507 ) ) ( not ( = ?auto_406503 ?auto_406508 ) ) ( not ( = ?auto_406504 ?auto_406505 ) ) ( not ( = ?auto_406504 ?auto_406506 ) ) ( not ( = ?auto_406504 ?auto_406507 ) ) ( not ( = ?auto_406504 ?auto_406508 ) ) ( not ( = ?auto_406505 ?auto_406506 ) ) ( not ( = ?auto_406505 ?auto_406507 ) ) ( not ( = ?auto_406505 ?auto_406508 ) ) ( not ( = ?auto_406506 ?auto_406507 ) ) ( not ( = ?auto_406506 ?auto_406508 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_406507 ?auto_406508 )
      ( MAKE-6CRATE-VERIFY ?auto_406502 ?auto_406503 ?auto_406504 ?auto_406505 ?auto_406506 ?auto_406507 ?auto_406508 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406546 - SURFACE
      ?auto_406547 - SURFACE
      ?auto_406548 - SURFACE
      ?auto_406549 - SURFACE
      ?auto_406550 - SURFACE
      ?auto_406551 - SURFACE
      ?auto_406552 - SURFACE
    )
    :vars
    (
      ?auto_406554 - HOIST
      ?auto_406555 - PLACE
      ?auto_406553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406554 ?auto_406555 ) ( SURFACE-AT ?auto_406551 ?auto_406555 ) ( CLEAR ?auto_406551 ) ( IS-CRATE ?auto_406552 ) ( not ( = ?auto_406551 ?auto_406552 ) ) ( TRUCK-AT ?auto_406553 ?auto_406555 ) ( AVAILABLE ?auto_406554 ) ( IN ?auto_406552 ?auto_406553 ) ( ON ?auto_406551 ?auto_406550 ) ( not ( = ?auto_406550 ?auto_406551 ) ) ( not ( = ?auto_406550 ?auto_406552 ) ) ( ON ?auto_406547 ?auto_406546 ) ( ON ?auto_406548 ?auto_406547 ) ( ON ?auto_406549 ?auto_406548 ) ( ON ?auto_406550 ?auto_406549 ) ( not ( = ?auto_406546 ?auto_406547 ) ) ( not ( = ?auto_406546 ?auto_406548 ) ) ( not ( = ?auto_406546 ?auto_406549 ) ) ( not ( = ?auto_406546 ?auto_406550 ) ) ( not ( = ?auto_406546 ?auto_406551 ) ) ( not ( = ?auto_406546 ?auto_406552 ) ) ( not ( = ?auto_406547 ?auto_406548 ) ) ( not ( = ?auto_406547 ?auto_406549 ) ) ( not ( = ?auto_406547 ?auto_406550 ) ) ( not ( = ?auto_406547 ?auto_406551 ) ) ( not ( = ?auto_406547 ?auto_406552 ) ) ( not ( = ?auto_406548 ?auto_406549 ) ) ( not ( = ?auto_406548 ?auto_406550 ) ) ( not ( = ?auto_406548 ?auto_406551 ) ) ( not ( = ?auto_406548 ?auto_406552 ) ) ( not ( = ?auto_406549 ?auto_406550 ) ) ( not ( = ?auto_406549 ?auto_406551 ) ) ( not ( = ?auto_406549 ?auto_406552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406550 ?auto_406551 ?auto_406552 )
      ( MAKE-6CRATE-VERIFY ?auto_406546 ?auto_406547 ?auto_406548 ?auto_406549 ?auto_406550 ?auto_406551 ?auto_406552 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406597 - SURFACE
      ?auto_406598 - SURFACE
      ?auto_406599 - SURFACE
      ?auto_406600 - SURFACE
      ?auto_406601 - SURFACE
      ?auto_406602 - SURFACE
      ?auto_406603 - SURFACE
    )
    :vars
    (
      ?auto_406605 - HOIST
      ?auto_406606 - PLACE
      ?auto_406604 - TRUCK
      ?auto_406607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406605 ?auto_406606 ) ( SURFACE-AT ?auto_406602 ?auto_406606 ) ( CLEAR ?auto_406602 ) ( IS-CRATE ?auto_406603 ) ( not ( = ?auto_406602 ?auto_406603 ) ) ( AVAILABLE ?auto_406605 ) ( IN ?auto_406603 ?auto_406604 ) ( ON ?auto_406602 ?auto_406601 ) ( not ( = ?auto_406601 ?auto_406602 ) ) ( not ( = ?auto_406601 ?auto_406603 ) ) ( TRUCK-AT ?auto_406604 ?auto_406607 ) ( not ( = ?auto_406607 ?auto_406606 ) ) ( ON ?auto_406598 ?auto_406597 ) ( ON ?auto_406599 ?auto_406598 ) ( ON ?auto_406600 ?auto_406599 ) ( ON ?auto_406601 ?auto_406600 ) ( not ( = ?auto_406597 ?auto_406598 ) ) ( not ( = ?auto_406597 ?auto_406599 ) ) ( not ( = ?auto_406597 ?auto_406600 ) ) ( not ( = ?auto_406597 ?auto_406601 ) ) ( not ( = ?auto_406597 ?auto_406602 ) ) ( not ( = ?auto_406597 ?auto_406603 ) ) ( not ( = ?auto_406598 ?auto_406599 ) ) ( not ( = ?auto_406598 ?auto_406600 ) ) ( not ( = ?auto_406598 ?auto_406601 ) ) ( not ( = ?auto_406598 ?auto_406602 ) ) ( not ( = ?auto_406598 ?auto_406603 ) ) ( not ( = ?auto_406599 ?auto_406600 ) ) ( not ( = ?auto_406599 ?auto_406601 ) ) ( not ( = ?auto_406599 ?auto_406602 ) ) ( not ( = ?auto_406599 ?auto_406603 ) ) ( not ( = ?auto_406600 ?auto_406601 ) ) ( not ( = ?auto_406600 ?auto_406602 ) ) ( not ( = ?auto_406600 ?auto_406603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406601 ?auto_406602 ?auto_406603 )
      ( MAKE-6CRATE-VERIFY ?auto_406597 ?auto_406598 ?auto_406599 ?auto_406600 ?auto_406601 ?auto_406602 ?auto_406603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406654 - SURFACE
      ?auto_406655 - SURFACE
      ?auto_406656 - SURFACE
      ?auto_406657 - SURFACE
      ?auto_406658 - SURFACE
      ?auto_406659 - SURFACE
      ?auto_406660 - SURFACE
    )
    :vars
    (
      ?auto_406661 - HOIST
      ?auto_406665 - PLACE
      ?auto_406664 - TRUCK
      ?auto_406663 - PLACE
      ?auto_406662 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_406661 ?auto_406665 ) ( SURFACE-AT ?auto_406659 ?auto_406665 ) ( CLEAR ?auto_406659 ) ( IS-CRATE ?auto_406660 ) ( not ( = ?auto_406659 ?auto_406660 ) ) ( AVAILABLE ?auto_406661 ) ( ON ?auto_406659 ?auto_406658 ) ( not ( = ?auto_406658 ?auto_406659 ) ) ( not ( = ?auto_406658 ?auto_406660 ) ) ( TRUCK-AT ?auto_406664 ?auto_406663 ) ( not ( = ?auto_406663 ?auto_406665 ) ) ( HOIST-AT ?auto_406662 ?auto_406663 ) ( LIFTING ?auto_406662 ?auto_406660 ) ( not ( = ?auto_406661 ?auto_406662 ) ) ( ON ?auto_406655 ?auto_406654 ) ( ON ?auto_406656 ?auto_406655 ) ( ON ?auto_406657 ?auto_406656 ) ( ON ?auto_406658 ?auto_406657 ) ( not ( = ?auto_406654 ?auto_406655 ) ) ( not ( = ?auto_406654 ?auto_406656 ) ) ( not ( = ?auto_406654 ?auto_406657 ) ) ( not ( = ?auto_406654 ?auto_406658 ) ) ( not ( = ?auto_406654 ?auto_406659 ) ) ( not ( = ?auto_406654 ?auto_406660 ) ) ( not ( = ?auto_406655 ?auto_406656 ) ) ( not ( = ?auto_406655 ?auto_406657 ) ) ( not ( = ?auto_406655 ?auto_406658 ) ) ( not ( = ?auto_406655 ?auto_406659 ) ) ( not ( = ?auto_406655 ?auto_406660 ) ) ( not ( = ?auto_406656 ?auto_406657 ) ) ( not ( = ?auto_406656 ?auto_406658 ) ) ( not ( = ?auto_406656 ?auto_406659 ) ) ( not ( = ?auto_406656 ?auto_406660 ) ) ( not ( = ?auto_406657 ?auto_406658 ) ) ( not ( = ?auto_406657 ?auto_406659 ) ) ( not ( = ?auto_406657 ?auto_406660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406658 ?auto_406659 ?auto_406660 )
      ( MAKE-6CRATE-VERIFY ?auto_406654 ?auto_406655 ?auto_406656 ?auto_406657 ?auto_406658 ?auto_406659 ?auto_406660 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406717 - SURFACE
      ?auto_406718 - SURFACE
      ?auto_406719 - SURFACE
      ?auto_406720 - SURFACE
      ?auto_406721 - SURFACE
      ?auto_406722 - SURFACE
      ?auto_406723 - SURFACE
    )
    :vars
    (
      ?auto_406729 - HOIST
      ?auto_406724 - PLACE
      ?auto_406725 - TRUCK
      ?auto_406726 - PLACE
      ?auto_406728 - HOIST
      ?auto_406727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406729 ?auto_406724 ) ( SURFACE-AT ?auto_406722 ?auto_406724 ) ( CLEAR ?auto_406722 ) ( IS-CRATE ?auto_406723 ) ( not ( = ?auto_406722 ?auto_406723 ) ) ( AVAILABLE ?auto_406729 ) ( ON ?auto_406722 ?auto_406721 ) ( not ( = ?auto_406721 ?auto_406722 ) ) ( not ( = ?auto_406721 ?auto_406723 ) ) ( TRUCK-AT ?auto_406725 ?auto_406726 ) ( not ( = ?auto_406726 ?auto_406724 ) ) ( HOIST-AT ?auto_406728 ?auto_406726 ) ( not ( = ?auto_406729 ?auto_406728 ) ) ( AVAILABLE ?auto_406728 ) ( SURFACE-AT ?auto_406723 ?auto_406726 ) ( ON ?auto_406723 ?auto_406727 ) ( CLEAR ?auto_406723 ) ( not ( = ?auto_406722 ?auto_406727 ) ) ( not ( = ?auto_406723 ?auto_406727 ) ) ( not ( = ?auto_406721 ?auto_406727 ) ) ( ON ?auto_406718 ?auto_406717 ) ( ON ?auto_406719 ?auto_406718 ) ( ON ?auto_406720 ?auto_406719 ) ( ON ?auto_406721 ?auto_406720 ) ( not ( = ?auto_406717 ?auto_406718 ) ) ( not ( = ?auto_406717 ?auto_406719 ) ) ( not ( = ?auto_406717 ?auto_406720 ) ) ( not ( = ?auto_406717 ?auto_406721 ) ) ( not ( = ?auto_406717 ?auto_406722 ) ) ( not ( = ?auto_406717 ?auto_406723 ) ) ( not ( = ?auto_406717 ?auto_406727 ) ) ( not ( = ?auto_406718 ?auto_406719 ) ) ( not ( = ?auto_406718 ?auto_406720 ) ) ( not ( = ?auto_406718 ?auto_406721 ) ) ( not ( = ?auto_406718 ?auto_406722 ) ) ( not ( = ?auto_406718 ?auto_406723 ) ) ( not ( = ?auto_406718 ?auto_406727 ) ) ( not ( = ?auto_406719 ?auto_406720 ) ) ( not ( = ?auto_406719 ?auto_406721 ) ) ( not ( = ?auto_406719 ?auto_406722 ) ) ( not ( = ?auto_406719 ?auto_406723 ) ) ( not ( = ?auto_406719 ?auto_406727 ) ) ( not ( = ?auto_406720 ?auto_406721 ) ) ( not ( = ?auto_406720 ?auto_406722 ) ) ( not ( = ?auto_406720 ?auto_406723 ) ) ( not ( = ?auto_406720 ?auto_406727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406721 ?auto_406722 ?auto_406723 )
      ( MAKE-6CRATE-VERIFY ?auto_406717 ?auto_406718 ?auto_406719 ?auto_406720 ?auto_406721 ?auto_406722 ?auto_406723 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406781 - SURFACE
      ?auto_406782 - SURFACE
      ?auto_406783 - SURFACE
      ?auto_406784 - SURFACE
      ?auto_406785 - SURFACE
      ?auto_406786 - SURFACE
      ?auto_406787 - SURFACE
    )
    :vars
    (
      ?auto_406793 - HOIST
      ?auto_406792 - PLACE
      ?auto_406790 - PLACE
      ?auto_406788 - HOIST
      ?auto_406789 - SURFACE
      ?auto_406791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406793 ?auto_406792 ) ( SURFACE-AT ?auto_406786 ?auto_406792 ) ( CLEAR ?auto_406786 ) ( IS-CRATE ?auto_406787 ) ( not ( = ?auto_406786 ?auto_406787 ) ) ( AVAILABLE ?auto_406793 ) ( ON ?auto_406786 ?auto_406785 ) ( not ( = ?auto_406785 ?auto_406786 ) ) ( not ( = ?auto_406785 ?auto_406787 ) ) ( not ( = ?auto_406790 ?auto_406792 ) ) ( HOIST-AT ?auto_406788 ?auto_406790 ) ( not ( = ?auto_406793 ?auto_406788 ) ) ( AVAILABLE ?auto_406788 ) ( SURFACE-AT ?auto_406787 ?auto_406790 ) ( ON ?auto_406787 ?auto_406789 ) ( CLEAR ?auto_406787 ) ( not ( = ?auto_406786 ?auto_406789 ) ) ( not ( = ?auto_406787 ?auto_406789 ) ) ( not ( = ?auto_406785 ?auto_406789 ) ) ( TRUCK-AT ?auto_406791 ?auto_406792 ) ( ON ?auto_406782 ?auto_406781 ) ( ON ?auto_406783 ?auto_406782 ) ( ON ?auto_406784 ?auto_406783 ) ( ON ?auto_406785 ?auto_406784 ) ( not ( = ?auto_406781 ?auto_406782 ) ) ( not ( = ?auto_406781 ?auto_406783 ) ) ( not ( = ?auto_406781 ?auto_406784 ) ) ( not ( = ?auto_406781 ?auto_406785 ) ) ( not ( = ?auto_406781 ?auto_406786 ) ) ( not ( = ?auto_406781 ?auto_406787 ) ) ( not ( = ?auto_406781 ?auto_406789 ) ) ( not ( = ?auto_406782 ?auto_406783 ) ) ( not ( = ?auto_406782 ?auto_406784 ) ) ( not ( = ?auto_406782 ?auto_406785 ) ) ( not ( = ?auto_406782 ?auto_406786 ) ) ( not ( = ?auto_406782 ?auto_406787 ) ) ( not ( = ?auto_406782 ?auto_406789 ) ) ( not ( = ?auto_406783 ?auto_406784 ) ) ( not ( = ?auto_406783 ?auto_406785 ) ) ( not ( = ?auto_406783 ?auto_406786 ) ) ( not ( = ?auto_406783 ?auto_406787 ) ) ( not ( = ?auto_406783 ?auto_406789 ) ) ( not ( = ?auto_406784 ?auto_406785 ) ) ( not ( = ?auto_406784 ?auto_406786 ) ) ( not ( = ?auto_406784 ?auto_406787 ) ) ( not ( = ?auto_406784 ?auto_406789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406785 ?auto_406786 ?auto_406787 )
      ( MAKE-6CRATE-VERIFY ?auto_406781 ?auto_406782 ?auto_406783 ?auto_406784 ?auto_406785 ?auto_406786 ?auto_406787 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406845 - SURFACE
      ?auto_406846 - SURFACE
      ?auto_406847 - SURFACE
      ?auto_406848 - SURFACE
      ?auto_406849 - SURFACE
      ?auto_406850 - SURFACE
      ?auto_406851 - SURFACE
    )
    :vars
    (
      ?auto_406854 - HOIST
      ?auto_406852 - PLACE
      ?auto_406855 - PLACE
      ?auto_406853 - HOIST
      ?auto_406856 - SURFACE
      ?auto_406857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406854 ?auto_406852 ) ( IS-CRATE ?auto_406851 ) ( not ( = ?auto_406850 ?auto_406851 ) ) ( not ( = ?auto_406849 ?auto_406850 ) ) ( not ( = ?auto_406849 ?auto_406851 ) ) ( not ( = ?auto_406855 ?auto_406852 ) ) ( HOIST-AT ?auto_406853 ?auto_406855 ) ( not ( = ?auto_406854 ?auto_406853 ) ) ( AVAILABLE ?auto_406853 ) ( SURFACE-AT ?auto_406851 ?auto_406855 ) ( ON ?auto_406851 ?auto_406856 ) ( CLEAR ?auto_406851 ) ( not ( = ?auto_406850 ?auto_406856 ) ) ( not ( = ?auto_406851 ?auto_406856 ) ) ( not ( = ?auto_406849 ?auto_406856 ) ) ( TRUCK-AT ?auto_406857 ?auto_406852 ) ( SURFACE-AT ?auto_406849 ?auto_406852 ) ( CLEAR ?auto_406849 ) ( LIFTING ?auto_406854 ?auto_406850 ) ( IS-CRATE ?auto_406850 ) ( ON ?auto_406846 ?auto_406845 ) ( ON ?auto_406847 ?auto_406846 ) ( ON ?auto_406848 ?auto_406847 ) ( ON ?auto_406849 ?auto_406848 ) ( not ( = ?auto_406845 ?auto_406846 ) ) ( not ( = ?auto_406845 ?auto_406847 ) ) ( not ( = ?auto_406845 ?auto_406848 ) ) ( not ( = ?auto_406845 ?auto_406849 ) ) ( not ( = ?auto_406845 ?auto_406850 ) ) ( not ( = ?auto_406845 ?auto_406851 ) ) ( not ( = ?auto_406845 ?auto_406856 ) ) ( not ( = ?auto_406846 ?auto_406847 ) ) ( not ( = ?auto_406846 ?auto_406848 ) ) ( not ( = ?auto_406846 ?auto_406849 ) ) ( not ( = ?auto_406846 ?auto_406850 ) ) ( not ( = ?auto_406846 ?auto_406851 ) ) ( not ( = ?auto_406846 ?auto_406856 ) ) ( not ( = ?auto_406847 ?auto_406848 ) ) ( not ( = ?auto_406847 ?auto_406849 ) ) ( not ( = ?auto_406847 ?auto_406850 ) ) ( not ( = ?auto_406847 ?auto_406851 ) ) ( not ( = ?auto_406847 ?auto_406856 ) ) ( not ( = ?auto_406848 ?auto_406849 ) ) ( not ( = ?auto_406848 ?auto_406850 ) ) ( not ( = ?auto_406848 ?auto_406851 ) ) ( not ( = ?auto_406848 ?auto_406856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406849 ?auto_406850 ?auto_406851 )
      ( MAKE-6CRATE-VERIFY ?auto_406845 ?auto_406846 ?auto_406847 ?auto_406848 ?auto_406849 ?auto_406850 ?auto_406851 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406909 - SURFACE
      ?auto_406910 - SURFACE
      ?auto_406911 - SURFACE
      ?auto_406912 - SURFACE
      ?auto_406913 - SURFACE
      ?auto_406914 - SURFACE
      ?auto_406915 - SURFACE
    )
    :vars
    (
      ?auto_406921 - HOIST
      ?auto_406918 - PLACE
      ?auto_406916 - PLACE
      ?auto_406919 - HOIST
      ?auto_406920 - SURFACE
      ?auto_406917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406921 ?auto_406918 ) ( IS-CRATE ?auto_406915 ) ( not ( = ?auto_406914 ?auto_406915 ) ) ( not ( = ?auto_406913 ?auto_406914 ) ) ( not ( = ?auto_406913 ?auto_406915 ) ) ( not ( = ?auto_406916 ?auto_406918 ) ) ( HOIST-AT ?auto_406919 ?auto_406916 ) ( not ( = ?auto_406921 ?auto_406919 ) ) ( AVAILABLE ?auto_406919 ) ( SURFACE-AT ?auto_406915 ?auto_406916 ) ( ON ?auto_406915 ?auto_406920 ) ( CLEAR ?auto_406915 ) ( not ( = ?auto_406914 ?auto_406920 ) ) ( not ( = ?auto_406915 ?auto_406920 ) ) ( not ( = ?auto_406913 ?auto_406920 ) ) ( TRUCK-AT ?auto_406917 ?auto_406918 ) ( SURFACE-AT ?auto_406913 ?auto_406918 ) ( CLEAR ?auto_406913 ) ( IS-CRATE ?auto_406914 ) ( AVAILABLE ?auto_406921 ) ( IN ?auto_406914 ?auto_406917 ) ( ON ?auto_406910 ?auto_406909 ) ( ON ?auto_406911 ?auto_406910 ) ( ON ?auto_406912 ?auto_406911 ) ( ON ?auto_406913 ?auto_406912 ) ( not ( = ?auto_406909 ?auto_406910 ) ) ( not ( = ?auto_406909 ?auto_406911 ) ) ( not ( = ?auto_406909 ?auto_406912 ) ) ( not ( = ?auto_406909 ?auto_406913 ) ) ( not ( = ?auto_406909 ?auto_406914 ) ) ( not ( = ?auto_406909 ?auto_406915 ) ) ( not ( = ?auto_406909 ?auto_406920 ) ) ( not ( = ?auto_406910 ?auto_406911 ) ) ( not ( = ?auto_406910 ?auto_406912 ) ) ( not ( = ?auto_406910 ?auto_406913 ) ) ( not ( = ?auto_406910 ?auto_406914 ) ) ( not ( = ?auto_406910 ?auto_406915 ) ) ( not ( = ?auto_406910 ?auto_406920 ) ) ( not ( = ?auto_406911 ?auto_406912 ) ) ( not ( = ?auto_406911 ?auto_406913 ) ) ( not ( = ?auto_406911 ?auto_406914 ) ) ( not ( = ?auto_406911 ?auto_406915 ) ) ( not ( = ?auto_406911 ?auto_406920 ) ) ( not ( = ?auto_406912 ?auto_406913 ) ) ( not ( = ?auto_406912 ?auto_406914 ) ) ( not ( = ?auto_406912 ?auto_406915 ) ) ( not ( = ?auto_406912 ?auto_406920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406913 ?auto_406914 ?auto_406915 )
      ( MAKE-6CRATE-VERIFY ?auto_406909 ?auto_406910 ?auto_406911 ?auto_406912 ?auto_406913 ?auto_406914 ?auto_406915 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406973 - SURFACE
      ?auto_406974 - SURFACE
      ?auto_406975 - SURFACE
      ?auto_406976 - SURFACE
      ?auto_406977 - SURFACE
      ?auto_406978 - SURFACE
      ?auto_406979 - SURFACE
    )
    :vars
    (
      ?auto_406982 - HOIST
      ?auto_406983 - PLACE
      ?auto_406980 - PLACE
      ?auto_406984 - HOIST
      ?auto_406981 - SURFACE
      ?auto_406985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406982 ?auto_406983 ) ( IS-CRATE ?auto_406979 ) ( not ( = ?auto_406978 ?auto_406979 ) ) ( not ( = ?auto_406977 ?auto_406978 ) ) ( not ( = ?auto_406977 ?auto_406979 ) ) ( not ( = ?auto_406980 ?auto_406983 ) ) ( HOIST-AT ?auto_406984 ?auto_406980 ) ( not ( = ?auto_406982 ?auto_406984 ) ) ( AVAILABLE ?auto_406984 ) ( SURFACE-AT ?auto_406979 ?auto_406980 ) ( ON ?auto_406979 ?auto_406981 ) ( CLEAR ?auto_406979 ) ( not ( = ?auto_406978 ?auto_406981 ) ) ( not ( = ?auto_406979 ?auto_406981 ) ) ( not ( = ?auto_406977 ?auto_406981 ) ) ( SURFACE-AT ?auto_406977 ?auto_406983 ) ( CLEAR ?auto_406977 ) ( IS-CRATE ?auto_406978 ) ( AVAILABLE ?auto_406982 ) ( IN ?auto_406978 ?auto_406985 ) ( TRUCK-AT ?auto_406985 ?auto_406980 ) ( ON ?auto_406974 ?auto_406973 ) ( ON ?auto_406975 ?auto_406974 ) ( ON ?auto_406976 ?auto_406975 ) ( ON ?auto_406977 ?auto_406976 ) ( not ( = ?auto_406973 ?auto_406974 ) ) ( not ( = ?auto_406973 ?auto_406975 ) ) ( not ( = ?auto_406973 ?auto_406976 ) ) ( not ( = ?auto_406973 ?auto_406977 ) ) ( not ( = ?auto_406973 ?auto_406978 ) ) ( not ( = ?auto_406973 ?auto_406979 ) ) ( not ( = ?auto_406973 ?auto_406981 ) ) ( not ( = ?auto_406974 ?auto_406975 ) ) ( not ( = ?auto_406974 ?auto_406976 ) ) ( not ( = ?auto_406974 ?auto_406977 ) ) ( not ( = ?auto_406974 ?auto_406978 ) ) ( not ( = ?auto_406974 ?auto_406979 ) ) ( not ( = ?auto_406974 ?auto_406981 ) ) ( not ( = ?auto_406975 ?auto_406976 ) ) ( not ( = ?auto_406975 ?auto_406977 ) ) ( not ( = ?auto_406975 ?auto_406978 ) ) ( not ( = ?auto_406975 ?auto_406979 ) ) ( not ( = ?auto_406975 ?auto_406981 ) ) ( not ( = ?auto_406976 ?auto_406977 ) ) ( not ( = ?auto_406976 ?auto_406978 ) ) ( not ( = ?auto_406976 ?auto_406979 ) ) ( not ( = ?auto_406976 ?auto_406981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406977 ?auto_406978 ?auto_406979 )
      ( MAKE-6CRATE-VERIFY ?auto_406973 ?auto_406974 ?auto_406975 ?auto_406976 ?auto_406977 ?auto_406978 ?auto_406979 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407037 - SURFACE
      ?auto_407038 - SURFACE
      ?auto_407039 - SURFACE
      ?auto_407040 - SURFACE
      ?auto_407041 - SURFACE
      ?auto_407042 - SURFACE
      ?auto_407043 - SURFACE
    )
    :vars
    (
      ?auto_407049 - HOIST
      ?auto_407044 - PLACE
      ?auto_407045 - PLACE
      ?auto_407046 - HOIST
      ?auto_407047 - SURFACE
      ?auto_407048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_407049 ?auto_407044 ) ( IS-CRATE ?auto_407043 ) ( not ( = ?auto_407042 ?auto_407043 ) ) ( not ( = ?auto_407041 ?auto_407042 ) ) ( not ( = ?auto_407041 ?auto_407043 ) ) ( not ( = ?auto_407045 ?auto_407044 ) ) ( HOIST-AT ?auto_407046 ?auto_407045 ) ( not ( = ?auto_407049 ?auto_407046 ) ) ( SURFACE-AT ?auto_407043 ?auto_407045 ) ( ON ?auto_407043 ?auto_407047 ) ( CLEAR ?auto_407043 ) ( not ( = ?auto_407042 ?auto_407047 ) ) ( not ( = ?auto_407043 ?auto_407047 ) ) ( not ( = ?auto_407041 ?auto_407047 ) ) ( SURFACE-AT ?auto_407041 ?auto_407044 ) ( CLEAR ?auto_407041 ) ( IS-CRATE ?auto_407042 ) ( AVAILABLE ?auto_407049 ) ( TRUCK-AT ?auto_407048 ?auto_407045 ) ( LIFTING ?auto_407046 ?auto_407042 ) ( ON ?auto_407038 ?auto_407037 ) ( ON ?auto_407039 ?auto_407038 ) ( ON ?auto_407040 ?auto_407039 ) ( ON ?auto_407041 ?auto_407040 ) ( not ( = ?auto_407037 ?auto_407038 ) ) ( not ( = ?auto_407037 ?auto_407039 ) ) ( not ( = ?auto_407037 ?auto_407040 ) ) ( not ( = ?auto_407037 ?auto_407041 ) ) ( not ( = ?auto_407037 ?auto_407042 ) ) ( not ( = ?auto_407037 ?auto_407043 ) ) ( not ( = ?auto_407037 ?auto_407047 ) ) ( not ( = ?auto_407038 ?auto_407039 ) ) ( not ( = ?auto_407038 ?auto_407040 ) ) ( not ( = ?auto_407038 ?auto_407041 ) ) ( not ( = ?auto_407038 ?auto_407042 ) ) ( not ( = ?auto_407038 ?auto_407043 ) ) ( not ( = ?auto_407038 ?auto_407047 ) ) ( not ( = ?auto_407039 ?auto_407040 ) ) ( not ( = ?auto_407039 ?auto_407041 ) ) ( not ( = ?auto_407039 ?auto_407042 ) ) ( not ( = ?auto_407039 ?auto_407043 ) ) ( not ( = ?auto_407039 ?auto_407047 ) ) ( not ( = ?auto_407040 ?auto_407041 ) ) ( not ( = ?auto_407040 ?auto_407042 ) ) ( not ( = ?auto_407040 ?auto_407043 ) ) ( not ( = ?auto_407040 ?auto_407047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407041 ?auto_407042 ?auto_407043 )
      ( MAKE-6CRATE-VERIFY ?auto_407037 ?auto_407038 ?auto_407039 ?auto_407040 ?auto_407041 ?auto_407042 ?auto_407043 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407106 - SURFACE
      ?auto_407107 - SURFACE
      ?auto_407108 - SURFACE
      ?auto_407109 - SURFACE
      ?auto_407110 - SURFACE
      ?auto_407111 - SURFACE
      ?auto_407112 - SURFACE
    )
    :vars
    (
      ?auto_407113 - HOIST
      ?auto_407114 - PLACE
      ?auto_407117 - PLACE
      ?auto_407119 - HOIST
      ?auto_407118 - SURFACE
      ?auto_407116 - TRUCK
      ?auto_407115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_407113 ?auto_407114 ) ( IS-CRATE ?auto_407112 ) ( not ( = ?auto_407111 ?auto_407112 ) ) ( not ( = ?auto_407110 ?auto_407111 ) ) ( not ( = ?auto_407110 ?auto_407112 ) ) ( not ( = ?auto_407117 ?auto_407114 ) ) ( HOIST-AT ?auto_407119 ?auto_407117 ) ( not ( = ?auto_407113 ?auto_407119 ) ) ( SURFACE-AT ?auto_407112 ?auto_407117 ) ( ON ?auto_407112 ?auto_407118 ) ( CLEAR ?auto_407112 ) ( not ( = ?auto_407111 ?auto_407118 ) ) ( not ( = ?auto_407112 ?auto_407118 ) ) ( not ( = ?auto_407110 ?auto_407118 ) ) ( SURFACE-AT ?auto_407110 ?auto_407114 ) ( CLEAR ?auto_407110 ) ( IS-CRATE ?auto_407111 ) ( AVAILABLE ?auto_407113 ) ( TRUCK-AT ?auto_407116 ?auto_407117 ) ( AVAILABLE ?auto_407119 ) ( SURFACE-AT ?auto_407111 ?auto_407117 ) ( ON ?auto_407111 ?auto_407115 ) ( CLEAR ?auto_407111 ) ( not ( = ?auto_407111 ?auto_407115 ) ) ( not ( = ?auto_407112 ?auto_407115 ) ) ( not ( = ?auto_407110 ?auto_407115 ) ) ( not ( = ?auto_407118 ?auto_407115 ) ) ( ON ?auto_407107 ?auto_407106 ) ( ON ?auto_407108 ?auto_407107 ) ( ON ?auto_407109 ?auto_407108 ) ( ON ?auto_407110 ?auto_407109 ) ( not ( = ?auto_407106 ?auto_407107 ) ) ( not ( = ?auto_407106 ?auto_407108 ) ) ( not ( = ?auto_407106 ?auto_407109 ) ) ( not ( = ?auto_407106 ?auto_407110 ) ) ( not ( = ?auto_407106 ?auto_407111 ) ) ( not ( = ?auto_407106 ?auto_407112 ) ) ( not ( = ?auto_407106 ?auto_407118 ) ) ( not ( = ?auto_407106 ?auto_407115 ) ) ( not ( = ?auto_407107 ?auto_407108 ) ) ( not ( = ?auto_407107 ?auto_407109 ) ) ( not ( = ?auto_407107 ?auto_407110 ) ) ( not ( = ?auto_407107 ?auto_407111 ) ) ( not ( = ?auto_407107 ?auto_407112 ) ) ( not ( = ?auto_407107 ?auto_407118 ) ) ( not ( = ?auto_407107 ?auto_407115 ) ) ( not ( = ?auto_407108 ?auto_407109 ) ) ( not ( = ?auto_407108 ?auto_407110 ) ) ( not ( = ?auto_407108 ?auto_407111 ) ) ( not ( = ?auto_407108 ?auto_407112 ) ) ( not ( = ?auto_407108 ?auto_407118 ) ) ( not ( = ?auto_407108 ?auto_407115 ) ) ( not ( = ?auto_407109 ?auto_407110 ) ) ( not ( = ?auto_407109 ?auto_407111 ) ) ( not ( = ?auto_407109 ?auto_407112 ) ) ( not ( = ?auto_407109 ?auto_407118 ) ) ( not ( = ?auto_407109 ?auto_407115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407110 ?auto_407111 ?auto_407112 )
      ( MAKE-6CRATE-VERIFY ?auto_407106 ?auto_407107 ?auto_407108 ?auto_407109 ?auto_407110 ?auto_407111 ?auto_407112 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407176 - SURFACE
      ?auto_407177 - SURFACE
      ?auto_407178 - SURFACE
      ?auto_407179 - SURFACE
      ?auto_407180 - SURFACE
      ?auto_407181 - SURFACE
      ?auto_407182 - SURFACE
    )
    :vars
    (
      ?auto_407184 - HOIST
      ?auto_407186 - PLACE
      ?auto_407188 - PLACE
      ?auto_407183 - HOIST
      ?auto_407187 - SURFACE
      ?auto_407185 - SURFACE
      ?auto_407189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_407184 ?auto_407186 ) ( IS-CRATE ?auto_407182 ) ( not ( = ?auto_407181 ?auto_407182 ) ) ( not ( = ?auto_407180 ?auto_407181 ) ) ( not ( = ?auto_407180 ?auto_407182 ) ) ( not ( = ?auto_407188 ?auto_407186 ) ) ( HOIST-AT ?auto_407183 ?auto_407188 ) ( not ( = ?auto_407184 ?auto_407183 ) ) ( SURFACE-AT ?auto_407182 ?auto_407188 ) ( ON ?auto_407182 ?auto_407187 ) ( CLEAR ?auto_407182 ) ( not ( = ?auto_407181 ?auto_407187 ) ) ( not ( = ?auto_407182 ?auto_407187 ) ) ( not ( = ?auto_407180 ?auto_407187 ) ) ( SURFACE-AT ?auto_407180 ?auto_407186 ) ( CLEAR ?auto_407180 ) ( IS-CRATE ?auto_407181 ) ( AVAILABLE ?auto_407184 ) ( AVAILABLE ?auto_407183 ) ( SURFACE-AT ?auto_407181 ?auto_407188 ) ( ON ?auto_407181 ?auto_407185 ) ( CLEAR ?auto_407181 ) ( not ( = ?auto_407181 ?auto_407185 ) ) ( not ( = ?auto_407182 ?auto_407185 ) ) ( not ( = ?auto_407180 ?auto_407185 ) ) ( not ( = ?auto_407187 ?auto_407185 ) ) ( TRUCK-AT ?auto_407189 ?auto_407186 ) ( ON ?auto_407177 ?auto_407176 ) ( ON ?auto_407178 ?auto_407177 ) ( ON ?auto_407179 ?auto_407178 ) ( ON ?auto_407180 ?auto_407179 ) ( not ( = ?auto_407176 ?auto_407177 ) ) ( not ( = ?auto_407176 ?auto_407178 ) ) ( not ( = ?auto_407176 ?auto_407179 ) ) ( not ( = ?auto_407176 ?auto_407180 ) ) ( not ( = ?auto_407176 ?auto_407181 ) ) ( not ( = ?auto_407176 ?auto_407182 ) ) ( not ( = ?auto_407176 ?auto_407187 ) ) ( not ( = ?auto_407176 ?auto_407185 ) ) ( not ( = ?auto_407177 ?auto_407178 ) ) ( not ( = ?auto_407177 ?auto_407179 ) ) ( not ( = ?auto_407177 ?auto_407180 ) ) ( not ( = ?auto_407177 ?auto_407181 ) ) ( not ( = ?auto_407177 ?auto_407182 ) ) ( not ( = ?auto_407177 ?auto_407187 ) ) ( not ( = ?auto_407177 ?auto_407185 ) ) ( not ( = ?auto_407178 ?auto_407179 ) ) ( not ( = ?auto_407178 ?auto_407180 ) ) ( not ( = ?auto_407178 ?auto_407181 ) ) ( not ( = ?auto_407178 ?auto_407182 ) ) ( not ( = ?auto_407178 ?auto_407187 ) ) ( not ( = ?auto_407178 ?auto_407185 ) ) ( not ( = ?auto_407179 ?auto_407180 ) ) ( not ( = ?auto_407179 ?auto_407181 ) ) ( not ( = ?auto_407179 ?auto_407182 ) ) ( not ( = ?auto_407179 ?auto_407187 ) ) ( not ( = ?auto_407179 ?auto_407185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407180 ?auto_407181 ?auto_407182 )
      ( MAKE-6CRATE-VERIFY ?auto_407176 ?auto_407177 ?auto_407178 ?auto_407179 ?auto_407180 ?auto_407181 ?auto_407182 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407248 - SURFACE
      ?auto_407249 - SURFACE
      ?auto_407250 - SURFACE
      ?auto_407251 - SURFACE
      ?auto_407252 - SURFACE
      ?auto_407253 - SURFACE
      ?auto_407254 - SURFACE
    )
    :vars
    (
      ?auto_407261 - HOIST
      ?auto_407258 - PLACE
      ?auto_407256 - PLACE
      ?auto_407259 - HOIST
      ?auto_407255 - SURFACE
      ?auto_407260 - SURFACE
      ?auto_407257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_407261 ?auto_407258 ) ( IS-CRATE ?auto_407254 ) ( not ( = ?auto_407253 ?auto_407254 ) ) ( not ( = ?auto_407252 ?auto_407253 ) ) ( not ( = ?auto_407252 ?auto_407254 ) ) ( not ( = ?auto_407256 ?auto_407258 ) ) ( HOIST-AT ?auto_407259 ?auto_407256 ) ( not ( = ?auto_407261 ?auto_407259 ) ) ( SURFACE-AT ?auto_407254 ?auto_407256 ) ( ON ?auto_407254 ?auto_407255 ) ( CLEAR ?auto_407254 ) ( not ( = ?auto_407253 ?auto_407255 ) ) ( not ( = ?auto_407254 ?auto_407255 ) ) ( not ( = ?auto_407252 ?auto_407255 ) ) ( IS-CRATE ?auto_407253 ) ( AVAILABLE ?auto_407259 ) ( SURFACE-AT ?auto_407253 ?auto_407256 ) ( ON ?auto_407253 ?auto_407260 ) ( CLEAR ?auto_407253 ) ( not ( = ?auto_407253 ?auto_407260 ) ) ( not ( = ?auto_407254 ?auto_407260 ) ) ( not ( = ?auto_407252 ?auto_407260 ) ) ( not ( = ?auto_407255 ?auto_407260 ) ) ( TRUCK-AT ?auto_407257 ?auto_407258 ) ( SURFACE-AT ?auto_407251 ?auto_407258 ) ( CLEAR ?auto_407251 ) ( LIFTING ?auto_407261 ?auto_407252 ) ( IS-CRATE ?auto_407252 ) ( not ( = ?auto_407251 ?auto_407252 ) ) ( not ( = ?auto_407253 ?auto_407251 ) ) ( not ( = ?auto_407254 ?auto_407251 ) ) ( not ( = ?auto_407255 ?auto_407251 ) ) ( not ( = ?auto_407260 ?auto_407251 ) ) ( ON ?auto_407249 ?auto_407248 ) ( ON ?auto_407250 ?auto_407249 ) ( ON ?auto_407251 ?auto_407250 ) ( not ( = ?auto_407248 ?auto_407249 ) ) ( not ( = ?auto_407248 ?auto_407250 ) ) ( not ( = ?auto_407248 ?auto_407251 ) ) ( not ( = ?auto_407248 ?auto_407252 ) ) ( not ( = ?auto_407248 ?auto_407253 ) ) ( not ( = ?auto_407248 ?auto_407254 ) ) ( not ( = ?auto_407248 ?auto_407255 ) ) ( not ( = ?auto_407248 ?auto_407260 ) ) ( not ( = ?auto_407249 ?auto_407250 ) ) ( not ( = ?auto_407249 ?auto_407251 ) ) ( not ( = ?auto_407249 ?auto_407252 ) ) ( not ( = ?auto_407249 ?auto_407253 ) ) ( not ( = ?auto_407249 ?auto_407254 ) ) ( not ( = ?auto_407249 ?auto_407255 ) ) ( not ( = ?auto_407249 ?auto_407260 ) ) ( not ( = ?auto_407250 ?auto_407251 ) ) ( not ( = ?auto_407250 ?auto_407252 ) ) ( not ( = ?auto_407250 ?auto_407253 ) ) ( not ( = ?auto_407250 ?auto_407254 ) ) ( not ( = ?auto_407250 ?auto_407255 ) ) ( not ( = ?auto_407250 ?auto_407260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407252 ?auto_407253 ?auto_407254 )
      ( MAKE-6CRATE-VERIFY ?auto_407248 ?auto_407249 ?auto_407250 ?auto_407251 ?auto_407252 ?auto_407253 ?auto_407254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_407392 - SURFACE
      ?auto_407393 - SURFACE
    )
    :vars
    (
      ?auto_407395 - HOIST
      ?auto_407398 - PLACE
      ?auto_407399 - SURFACE
      ?auto_407394 - PLACE
      ?auto_407401 - HOIST
      ?auto_407397 - SURFACE
      ?auto_407400 - TRUCK
      ?auto_407396 - SURFACE
      ?auto_407402 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_407395 ?auto_407398 ) ( IS-CRATE ?auto_407393 ) ( not ( = ?auto_407392 ?auto_407393 ) ) ( not ( = ?auto_407399 ?auto_407392 ) ) ( not ( = ?auto_407399 ?auto_407393 ) ) ( not ( = ?auto_407394 ?auto_407398 ) ) ( HOIST-AT ?auto_407401 ?auto_407394 ) ( not ( = ?auto_407395 ?auto_407401 ) ) ( SURFACE-AT ?auto_407393 ?auto_407394 ) ( ON ?auto_407393 ?auto_407397 ) ( CLEAR ?auto_407393 ) ( not ( = ?auto_407392 ?auto_407397 ) ) ( not ( = ?auto_407393 ?auto_407397 ) ) ( not ( = ?auto_407399 ?auto_407397 ) ) ( SURFACE-AT ?auto_407399 ?auto_407398 ) ( CLEAR ?auto_407399 ) ( IS-CRATE ?auto_407392 ) ( AVAILABLE ?auto_407395 ) ( TRUCK-AT ?auto_407400 ?auto_407394 ) ( SURFACE-AT ?auto_407392 ?auto_407394 ) ( ON ?auto_407392 ?auto_407396 ) ( CLEAR ?auto_407392 ) ( not ( = ?auto_407392 ?auto_407396 ) ) ( not ( = ?auto_407393 ?auto_407396 ) ) ( not ( = ?auto_407399 ?auto_407396 ) ) ( not ( = ?auto_407397 ?auto_407396 ) ) ( LIFTING ?auto_407401 ?auto_407402 ) ( IS-CRATE ?auto_407402 ) ( not ( = ?auto_407392 ?auto_407402 ) ) ( not ( = ?auto_407393 ?auto_407402 ) ) ( not ( = ?auto_407399 ?auto_407402 ) ) ( not ( = ?auto_407397 ?auto_407402 ) ) ( not ( = ?auto_407396 ?auto_407402 ) ) )
    :subtasks
    ( ( !LOAD ?auto_407401 ?auto_407402 ?auto_407400 ?auto_407394 )
      ( MAKE-1CRATE ?auto_407392 ?auto_407393 )
      ( MAKE-1CRATE-VERIFY ?auto_407392 ?auto_407393 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408863 - SURFACE
      ?auto_408864 - SURFACE
      ?auto_408865 - SURFACE
      ?auto_408866 - SURFACE
      ?auto_408867 - SURFACE
      ?auto_408868 - SURFACE
      ?auto_408869 - SURFACE
      ?auto_408870 - SURFACE
    )
    :vars
    (
      ?auto_408872 - HOIST
      ?auto_408871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_408872 ?auto_408871 ) ( SURFACE-AT ?auto_408869 ?auto_408871 ) ( CLEAR ?auto_408869 ) ( LIFTING ?auto_408872 ?auto_408870 ) ( IS-CRATE ?auto_408870 ) ( not ( = ?auto_408869 ?auto_408870 ) ) ( ON ?auto_408864 ?auto_408863 ) ( ON ?auto_408865 ?auto_408864 ) ( ON ?auto_408866 ?auto_408865 ) ( ON ?auto_408867 ?auto_408866 ) ( ON ?auto_408868 ?auto_408867 ) ( ON ?auto_408869 ?auto_408868 ) ( not ( = ?auto_408863 ?auto_408864 ) ) ( not ( = ?auto_408863 ?auto_408865 ) ) ( not ( = ?auto_408863 ?auto_408866 ) ) ( not ( = ?auto_408863 ?auto_408867 ) ) ( not ( = ?auto_408863 ?auto_408868 ) ) ( not ( = ?auto_408863 ?auto_408869 ) ) ( not ( = ?auto_408863 ?auto_408870 ) ) ( not ( = ?auto_408864 ?auto_408865 ) ) ( not ( = ?auto_408864 ?auto_408866 ) ) ( not ( = ?auto_408864 ?auto_408867 ) ) ( not ( = ?auto_408864 ?auto_408868 ) ) ( not ( = ?auto_408864 ?auto_408869 ) ) ( not ( = ?auto_408864 ?auto_408870 ) ) ( not ( = ?auto_408865 ?auto_408866 ) ) ( not ( = ?auto_408865 ?auto_408867 ) ) ( not ( = ?auto_408865 ?auto_408868 ) ) ( not ( = ?auto_408865 ?auto_408869 ) ) ( not ( = ?auto_408865 ?auto_408870 ) ) ( not ( = ?auto_408866 ?auto_408867 ) ) ( not ( = ?auto_408866 ?auto_408868 ) ) ( not ( = ?auto_408866 ?auto_408869 ) ) ( not ( = ?auto_408866 ?auto_408870 ) ) ( not ( = ?auto_408867 ?auto_408868 ) ) ( not ( = ?auto_408867 ?auto_408869 ) ) ( not ( = ?auto_408867 ?auto_408870 ) ) ( not ( = ?auto_408868 ?auto_408869 ) ) ( not ( = ?auto_408868 ?auto_408870 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_408869 ?auto_408870 )
      ( MAKE-7CRATE-VERIFY ?auto_408863 ?auto_408864 ?auto_408865 ?auto_408866 ?auto_408867 ?auto_408868 ?auto_408869 ?auto_408870 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408918 - SURFACE
      ?auto_408919 - SURFACE
      ?auto_408920 - SURFACE
      ?auto_408921 - SURFACE
      ?auto_408922 - SURFACE
      ?auto_408923 - SURFACE
      ?auto_408924 - SURFACE
      ?auto_408925 - SURFACE
    )
    :vars
    (
      ?auto_408928 - HOIST
      ?auto_408926 - PLACE
      ?auto_408927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_408928 ?auto_408926 ) ( SURFACE-AT ?auto_408924 ?auto_408926 ) ( CLEAR ?auto_408924 ) ( IS-CRATE ?auto_408925 ) ( not ( = ?auto_408924 ?auto_408925 ) ) ( TRUCK-AT ?auto_408927 ?auto_408926 ) ( AVAILABLE ?auto_408928 ) ( IN ?auto_408925 ?auto_408927 ) ( ON ?auto_408924 ?auto_408923 ) ( not ( = ?auto_408923 ?auto_408924 ) ) ( not ( = ?auto_408923 ?auto_408925 ) ) ( ON ?auto_408919 ?auto_408918 ) ( ON ?auto_408920 ?auto_408919 ) ( ON ?auto_408921 ?auto_408920 ) ( ON ?auto_408922 ?auto_408921 ) ( ON ?auto_408923 ?auto_408922 ) ( not ( = ?auto_408918 ?auto_408919 ) ) ( not ( = ?auto_408918 ?auto_408920 ) ) ( not ( = ?auto_408918 ?auto_408921 ) ) ( not ( = ?auto_408918 ?auto_408922 ) ) ( not ( = ?auto_408918 ?auto_408923 ) ) ( not ( = ?auto_408918 ?auto_408924 ) ) ( not ( = ?auto_408918 ?auto_408925 ) ) ( not ( = ?auto_408919 ?auto_408920 ) ) ( not ( = ?auto_408919 ?auto_408921 ) ) ( not ( = ?auto_408919 ?auto_408922 ) ) ( not ( = ?auto_408919 ?auto_408923 ) ) ( not ( = ?auto_408919 ?auto_408924 ) ) ( not ( = ?auto_408919 ?auto_408925 ) ) ( not ( = ?auto_408920 ?auto_408921 ) ) ( not ( = ?auto_408920 ?auto_408922 ) ) ( not ( = ?auto_408920 ?auto_408923 ) ) ( not ( = ?auto_408920 ?auto_408924 ) ) ( not ( = ?auto_408920 ?auto_408925 ) ) ( not ( = ?auto_408921 ?auto_408922 ) ) ( not ( = ?auto_408921 ?auto_408923 ) ) ( not ( = ?auto_408921 ?auto_408924 ) ) ( not ( = ?auto_408921 ?auto_408925 ) ) ( not ( = ?auto_408922 ?auto_408923 ) ) ( not ( = ?auto_408922 ?auto_408924 ) ) ( not ( = ?auto_408922 ?auto_408925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408923 ?auto_408924 ?auto_408925 )
      ( MAKE-7CRATE-VERIFY ?auto_408918 ?auto_408919 ?auto_408920 ?auto_408921 ?auto_408922 ?auto_408923 ?auto_408924 ?auto_408925 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408981 - SURFACE
      ?auto_408982 - SURFACE
      ?auto_408983 - SURFACE
      ?auto_408984 - SURFACE
      ?auto_408985 - SURFACE
      ?auto_408986 - SURFACE
      ?auto_408987 - SURFACE
      ?auto_408988 - SURFACE
    )
    :vars
    (
      ?auto_408991 - HOIST
      ?auto_408992 - PLACE
      ?auto_408989 - TRUCK
      ?auto_408990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_408991 ?auto_408992 ) ( SURFACE-AT ?auto_408987 ?auto_408992 ) ( CLEAR ?auto_408987 ) ( IS-CRATE ?auto_408988 ) ( not ( = ?auto_408987 ?auto_408988 ) ) ( AVAILABLE ?auto_408991 ) ( IN ?auto_408988 ?auto_408989 ) ( ON ?auto_408987 ?auto_408986 ) ( not ( = ?auto_408986 ?auto_408987 ) ) ( not ( = ?auto_408986 ?auto_408988 ) ) ( TRUCK-AT ?auto_408989 ?auto_408990 ) ( not ( = ?auto_408990 ?auto_408992 ) ) ( ON ?auto_408982 ?auto_408981 ) ( ON ?auto_408983 ?auto_408982 ) ( ON ?auto_408984 ?auto_408983 ) ( ON ?auto_408985 ?auto_408984 ) ( ON ?auto_408986 ?auto_408985 ) ( not ( = ?auto_408981 ?auto_408982 ) ) ( not ( = ?auto_408981 ?auto_408983 ) ) ( not ( = ?auto_408981 ?auto_408984 ) ) ( not ( = ?auto_408981 ?auto_408985 ) ) ( not ( = ?auto_408981 ?auto_408986 ) ) ( not ( = ?auto_408981 ?auto_408987 ) ) ( not ( = ?auto_408981 ?auto_408988 ) ) ( not ( = ?auto_408982 ?auto_408983 ) ) ( not ( = ?auto_408982 ?auto_408984 ) ) ( not ( = ?auto_408982 ?auto_408985 ) ) ( not ( = ?auto_408982 ?auto_408986 ) ) ( not ( = ?auto_408982 ?auto_408987 ) ) ( not ( = ?auto_408982 ?auto_408988 ) ) ( not ( = ?auto_408983 ?auto_408984 ) ) ( not ( = ?auto_408983 ?auto_408985 ) ) ( not ( = ?auto_408983 ?auto_408986 ) ) ( not ( = ?auto_408983 ?auto_408987 ) ) ( not ( = ?auto_408983 ?auto_408988 ) ) ( not ( = ?auto_408984 ?auto_408985 ) ) ( not ( = ?auto_408984 ?auto_408986 ) ) ( not ( = ?auto_408984 ?auto_408987 ) ) ( not ( = ?auto_408984 ?auto_408988 ) ) ( not ( = ?auto_408985 ?auto_408986 ) ) ( not ( = ?auto_408985 ?auto_408987 ) ) ( not ( = ?auto_408985 ?auto_408988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408986 ?auto_408987 ?auto_408988 )
      ( MAKE-7CRATE-VERIFY ?auto_408981 ?auto_408982 ?auto_408983 ?auto_408984 ?auto_408985 ?auto_408986 ?auto_408987 ?auto_408988 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409051 - SURFACE
      ?auto_409052 - SURFACE
      ?auto_409053 - SURFACE
      ?auto_409054 - SURFACE
      ?auto_409055 - SURFACE
      ?auto_409056 - SURFACE
      ?auto_409057 - SURFACE
      ?auto_409058 - SURFACE
    )
    :vars
    (
      ?auto_409063 - HOIST
      ?auto_409059 - PLACE
      ?auto_409060 - TRUCK
      ?auto_409062 - PLACE
      ?auto_409061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_409063 ?auto_409059 ) ( SURFACE-AT ?auto_409057 ?auto_409059 ) ( CLEAR ?auto_409057 ) ( IS-CRATE ?auto_409058 ) ( not ( = ?auto_409057 ?auto_409058 ) ) ( AVAILABLE ?auto_409063 ) ( ON ?auto_409057 ?auto_409056 ) ( not ( = ?auto_409056 ?auto_409057 ) ) ( not ( = ?auto_409056 ?auto_409058 ) ) ( TRUCK-AT ?auto_409060 ?auto_409062 ) ( not ( = ?auto_409062 ?auto_409059 ) ) ( HOIST-AT ?auto_409061 ?auto_409062 ) ( LIFTING ?auto_409061 ?auto_409058 ) ( not ( = ?auto_409063 ?auto_409061 ) ) ( ON ?auto_409052 ?auto_409051 ) ( ON ?auto_409053 ?auto_409052 ) ( ON ?auto_409054 ?auto_409053 ) ( ON ?auto_409055 ?auto_409054 ) ( ON ?auto_409056 ?auto_409055 ) ( not ( = ?auto_409051 ?auto_409052 ) ) ( not ( = ?auto_409051 ?auto_409053 ) ) ( not ( = ?auto_409051 ?auto_409054 ) ) ( not ( = ?auto_409051 ?auto_409055 ) ) ( not ( = ?auto_409051 ?auto_409056 ) ) ( not ( = ?auto_409051 ?auto_409057 ) ) ( not ( = ?auto_409051 ?auto_409058 ) ) ( not ( = ?auto_409052 ?auto_409053 ) ) ( not ( = ?auto_409052 ?auto_409054 ) ) ( not ( = ?auto_409052 ?auto_409055 ) ) ( not ( = ?auto_409052 ?auto_409056 ) ) ( not ( = ?auto_409052 ?auto_409057 ) ) ( not ( = ?auto_409052 ?auto_409058 ) ) ( not ( = ?auto_409053 ?auto_409054 ) ) ( not ( = ?auto_409053 ?auto_409055 ) ) ( not ( = ?auto_409053 ?auto_409056 ) ) ( not ( = ?auto_409053 ?auto_409057 ) ) ( not ( = ?auto_409053 ?auto_409058 ) ) ( not ( = ?auto_409054 ?auto_409055 ) ) ( not ( = ?auto_409054 ?auto_409056 ) ) ( not ( = ?auto_409054 ?auto_409057 ) ) ( not ( = ?auto_409054 ?auto_409058 ) ) ( not ( = ?auto_409055 ?auto_409056 ) ) ( not ( = ?auto_409055 ?auto_409057 ) ) ( not ( = ?auto_409055 ?auto_409058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409056 ?auto_409057 ?auto_409058 )
      ( MAKE-7CRATE-VERIFY ?auto_409051 ?auto_409052 ?auto_409053 ?auto_409054 ?auto_409055 ?auto_409056 ?auto_409057 ?auto_409058 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409128 - SURFACE
      ?auto_409129 - SURFACE
      ?auto_409130 - SURFACE
      ?auto_409131 - SURFACE
      ?auto_409132 - SURFACE
      ?auto_409133 - SURFACE
      ?auto_409134 - SURFACE
      ?auto_409135 - SURFACE
    )
    :vars
    (
      ?auto_409141 - HOIST
      ?auto_409137 - PLACE
      ?auto_409138 - TRUCK
      ?auto_409136 - PLACE
      ?auto_409139 - HOIST
      ?auto_409140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_409141 ?auto_409137 ) ( SURFACE-AT ?auto_409134 ?auto_409137 ) ( CLEAR ?auto_409134 ) ( IS-CRATE ?auto_409135 ) ( not ( = ?auto_409134 ?auto_409135 ) ) ( AVAILABLE ?auto_409141 ) ( ON ?auto_409134 ?auto_409133 ) ( not ( = ?auto_409133 ?auto_409134 ) ) ( not ( = ?auto_409133 ?auto_409135 ) ) ( TRUCK-AT ?auto_409138 ?auto_409136 ) ( not ( = ?auto_409136 ?auto_409137 ) ) ( HOIST-AT ?auto_409139 ?auto_409136 ) ( not ( = ?auto_409141 ?auto_409139 ) ) ( AVAILABLE ?auto_409139 ) ( SURFACE-AT ?auto_409135 ?auto_409136 ) ( ON ?auto_409135 ?auto_409140 ) ( CLEAR ?auto_409135 ) ( not ( = ?auto_409134 ?auto_409140 ) ) ( not ( = ?auto_409135 ?auto_409140 ) ) ( not ( = ?auto_409133 ?auto_409140 ) ) ( ON ?auto_409129 ?auto_409128 ) ( ON ?auto_409130 ?auto_409129 ) ( ON ?auto_409131 ?auto_409130 ) ( ON ?auto_409132 ?auto_409131 ) ( ON ?auto_409133 ?auto_409132 ) ( not ( = ?auto_409128 ?auto_409129 ) ) ( not ( = ?auto_409128 ?auto_409130 ) ) ( not ( = ?auto_409128 ?auto_409131 ) ) ( not ( = ?auto_409128 ?auto_409132 ) ) ( not ( = ?auto_409128 ?auto_409133 ) ) ( not ( = ?auto_409128 ?auto_409134 ) ) ( not ( = ?auto_409128 ?auto_409135 ) ) ( not ( = ?auto_409128 ?auto_409140 ) ) ( not ( = ?auto_409129 ?auto_409130 ) ) ( not ( = ?auto_409129 ?auto_409131 ) ) ( not ( = ?auto_409129 ?auto_409132 ) ) ( not ( = ?auto_409129 ?auto_409133 ) ) ( not ( = ?auto_409129 ?auto_409134 ) ) ( not ( = ?auto_409129 ?auto_409135 ) ) ( not ( = ?auto_409129 ?auto_409140 ) ) ( not ( = ?auto_409130 ?auto_409131 ) ) ( not ( = ?auto_409130 ?auto_409132 ) ) ( not ( = ?auto_409130 ?auto_409133 ) ) ( not ( = ?auto_409130 ?auto_409134 ) ) ( not ( = ?auto_409130 ?auto_409135 ) ) ( not ( = ?auto_409130 ?auto_409140 ) ) ( not ( = ?auto_409131 ?auto_409132 ) ) ( not ( = ?auto_409131 ?auto_409133 ) ) ( not ( = ?auto_409131 ?auto_409134 ) ) ( not ( = ?auto_409131 ?auto_409135 ) ) ( not ( = ?auto_409131 ?auto_409140 ) ) ( not ( = ?auto_409132 ?auto_409133 ) ) ( not ( = ?auto_409132 ?auto_409134 ) ) ( not ( = ?auto_409132 ?auto_409135 ) ) ( not ( = ?auto_409132 ?auto_409140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409133 ?auto_409134 ?auto_409135 )
      ( MAKE-7CRATE-VERIFY ?auto_409128 ?auto_409129 ?auto_409130 ?auto_409131 ?auto_409132 ?auto_409133 ?auto_409134 ?auto_409135 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409206 - SURFACE
      ?auto_409207 - SURFACE
      ?auto_409208 - SURFACE
      ?auto_409209 - SURFACE
      ?auto_409210 - SURFACE
      ?auto_409211 - SURFACE
      ?auto_409212 - SURFACE
      ?auto_409213 - SURFACE
    )
    :vars
    (
      ?auto_409216 - HOIST
      ?auto_409218 - PLACE
      ?auto_409219 - PLACE
      ?auto_409214 - HOIST
      ?auto_409215 - SURFACE
      ?auto_409217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409216 ?auto_409218 ) ( SURFACE-AT ?auto_409212 ?auto_409218 ) ( CLEAR ?auto_409212 ) ( IS-CRATE ?auto_409213 ) ( not ( = ?auto_409212 ?auto_409213 ) ) ( AVAILABLE ?auto_409216 ) ( ON ?auto_409212 ?auto_409211 ) ( not ( = ?auto_409211 ?auto_409212 ) ) ( not ( = ?auto_409211 ?auto_409213 ) ) ( not ( = ?auto_409219 ?auto_409218 ) ) ( HOIST-AT ?auto_409214 ?auto_409219 ) ( not ( = ?auto_409216 ?auto_409214 ) ) ( AVAILABLE ?auto_409214 ) ( SURFACE-AT ?auto_409213 ?auto_409219 ) ( ON ?auto_409213 ?auto_409215 ) ( CLEAR ?auto_409213 ) ( not ( = ?auto_409212 ?auto_409215 ) ) ( not ( = ?auto_409213 ?auto_409215 ) ) ( not ( = ?auto_409211 ?auto_409215 ) ) ( TRUCK-AT ?auto_409217 ?auto_409218 ) ( ON ?auto_409207 ?auto_409206 ) ( ON ?auto_409208 ?auto_409207 ) ( ON ?auto_409209 ?auto_409208 ) ( ON ?auto_409210 ?auto_409209 ) ( ON ?auto_409211 ?auto_409210 ) ( not ( = ?auto_409206 ?auto_409207 ) ) ( not ( = ?auto_409206 ?auto_409208 ) ) ( not ( = ?auto_409206 ?auto_409209 ) ) ( not ( = ?auto_409206 ?auto_409210 ) ) ( not ( = ?auto_409206 ?auto_409211 ) ) ( not ( = ?auto_409206 ?auto_409212 ) ) ( not ( = ?auto_409206 ?auto_409213 ) ) ( not ( = ?auto_409206 ?auto_409215 ) ) ( not ( = ?auto_409207 ?auto_409208 ) ) ( not ( = ?auto_409207 ?auto_409209 ) ) ( not ( = ?auto_409207 ?auto_409210 ) ) ( not ( = ?auto_409207 ?auto_409211 ) ) ( not ( = ?auto_409207 ?auto_409212 ) ) ( not ( = ?auto_409207 ?auto_409213 ) ) ( not ( = ?auto_409207 ?auto_409215 ) ) ( not ( = ?auto_409208 ?auto_409209 ) ) ( not ( = ?auto_409208 ?auto_409210 ) ) ( not ( = ?auto_409208 ?auto_409211 ) ) ( not ( = ?auto_409208 ?auto_409212 ) ) ( not ( = ?auto_409208 ?auto_409213 ) ) ( not ( = ?auto_409208 ?auto_409215 ) ) ( not ( = ?auto_409209 ?auto_409210 ) ) ( not ( = ?auto_409209 ?auto_409211 ) ) ( not ( = ?auto_409209 ?auto_409212 ) ) ( not ( = ?auto_409209 ?auto_409213 ) ) ( not ( = ?auto_409209 ?auto_409215 ) ) ( not ( = ?auto_409210 ?auto_409211 ) ) ( not ( = ?auto_409210 ?auto_409212 ) ) ( not ( = ?auto_409210 ?auto_409213 ) ) ( not ( = ?auto_409210 ?auto_409215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409211 ?auto_409212 ?auto_409213 )
      ( MAKE-7CRATE-VERIFY ?auto_409206 ?auto_409207 ?auto_409208 ?auto_409209 ?auto_409210 ?auto_409211 ?auto_409212 ?auto_409213 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409284 - SURFACE
      ?auto_409285 - SURFACE
      ?auto_409286 - SURFACE
      ?auto_409287 - SURFACE
      ?auto_409288 - SURFACE
      ?auto_409289 - SURFACE
      ?auto_409290 - SURFACE
      ?auto_409291 - SURFACE
    )
    :vars
    (
      ?auto_409292 - HOIST
      ?auto_409295 - PLACE
      ?auto_409297 - PLACE
      ?auto_409293 - HOIST
      ?auto_409294 - SURFACE
      ?auto_409296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409292 ?auto_409295 ) ( IS-CRATE ?auto_409291 ) ( not ( = ?auto_409290 ?auto_409291 ) ) ( not ( = ?auto_409289 ?auto_409290 ) ) ( not ( = ?auto_409289 ?auto_409291 ) ) ( not ( = ?auto_409297 ?auto_409295 ) ) ( HOIST-AT ?auto_409293 ?auto_409297 ) ( not ( = ?auto_409292 ?auto_409293 ) ) ( AVAILABLE ?auto_409293 ) ( SURFACE-AT ?auto_409291 ?auto_409297 ) ( ON ?auto_409291 ?auto_409294 ) ( CLEAR ?auto_409291 ) ( not ( = ?auto_409290 ?auto_409294 ) ) ( not ( = ?auto_409291 ?auto_409294 ) ) ( not ( = ?auto_409289 ?auto_409294 ) ) ( TRUCK-AT ?auto_409296 ?auto_409295 ) ( SURFACE-AT ?auto_409289 ?auto_409295 ) ( CLEAR ?auto_409289 ) ( LIFTING ?auto_409292 ?auto_409290 ) ( IS-CRATE ?auto_409290 ) ( ON ?auto_409285 ?auto_409284 ) ( ON ?auto_409286 ?auto_409285 ) ( ON ?auto_409287 ?auto_409286 ) ( ON ?auto_409288 ?auto_409287 ) ( ON ?auto_409289 ?auto_409288 ) ( not ( = ?auto_409284 ?auto_409285 ) ) ( not ( = ?auto_409284 ?auto_409286 ) ) ( not ( = ?auto_409284 ?auto_409287 ) ) ( not ( = ?auto_409284 ?auto_409288 ) ) ( not ( = ?auto_409284 ?auto_409289 ) ) ( not ( = ?auto_409284 ?auto_409290 ) ) ( not ( = ?auto_409284 ?auto_409291 ) ) ( not ( = ?auto_409284 ?auto_409294 ) ) ( not ( = ?auto_409285 ?auto_409286 ) ) ( not ( = ?auto_409285 ?auto_409287 ) ) ( not ( = ?auto_409285 ?auto_409288 ) ) ( not ( = ?auto_409285 ?auto_409289 ) ) ( not ( = ?auto_409285 ?auto_409290 ) ) ( not ( = ?auto_409285 ?auto_409291 ) ) ( not ( = ?auto_409285 ?auto_409294 ) ) ( not ( = ?auto_409286 ?auto_409287 ) ) ( not ( = ?auto_409286 ?auto_409288 ) ) ( not ( = ?auto_409286 ?auto_409289 ) ) ( not ( = ?auto_409286 ?auto_409290 ) ) ( not ( = ?auto_409286 ?auto_409291 ) ) ( not ( = ?auto_409286 ?auto_409294 ) ) ( not ( = ?auto_409287 ?auto_409288 ) ) ( not ( = ?auto_409287 ?auto_409289 ) ) ( not ( = ?auto_409287 ?auto_409290 ) ) ( not ( = ?auto_409287 ?auto_409291 ) ) ( not ( = ?auto_409287 ?auto_409294 ) ) ( not ( = ?auto_409288 ?auto_409289 ) ) ( not ( = ?auto_409288 ?auto_409290 ) ) ( not ( = ?auto_409288 ?auto_409291 ) ) ( not ( = ?auto_409288 ?auto_409294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409289 ?auto_409290 ?auto_409291 )
      ( MAKE-7CRATE-VERIFY ?auto_409284 ?auto_409285 ?auto_409286 ?auto_409287 ?auto_409288 ?auto_409289 ?auto_409290 ?auto_409291 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409362 - SURFACE
      ?auto_409363 - SURFACE
      ?auto_409364 - SURFACE
      ?auto_409365 - SURFACE
      ?auto_409366 - SURFACE
      ?auto_409367 - SURFACE
      ?auto_409368 - SURFACE
      ?auto_409369 - SURFACE
    )
    :vars
    (
      ?auto_409373 - HOIST
      ?auto_409370 - PLACE
      ?auto_409375 - PLACE
      ?auto_409374 - HOIST
      ?auto_409372 - SURFACE
      ?auto_409371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409373 ?auto_409370 ) ( IS-CRATE ?auto_409369 ) ( not ( = ?auto_409368 ?auto_409369 ) ) ( not ( = ?auto_409367 ?auto_409368 ) ) ( not ( = ?auto_409367 ?auto_409369 ) ) ( not ( = ?auto_409375 ?auto_409370 ) ) ( HOIST-AT ?auto_409374 ?auto_409375 ) ( not ( = ?auto_409373 ?auto_409374 ) ) ( AVAILABLE ?auto_409374 ) ( SURFACE-AT ?auto_409369 ?auto_409375 ) ( ON ?auto_409369 ?auto_409372 ) ( CLEAR ?auto_409369 ) ( not ( = ?auto_409368 ?auto_409372 ) ) ( not ( = ?auto_409369 ?auto_409372 ) ) ( not ( = ?auto_409367 ?auto_409372 ) ) ( TRUCK-AT ?auto_409371 ?auto_409370 ) ( SURFACE-AT ?auto_409367 ?auto_409370 ) ( CLEAR ?auto_409367 ) ( IS-CRATE ?auto_409368 ) ( AVAILABLE ?auto_409373 ) ( IN ?auto_409368 ?auto_409371 ) ( ON ?auto_409363 ?auto_409362 ) ( ON ?auto_409364 ?auto_409363 ) ( ON ?auto_409365 ?auto_409364 ) ( ON ?auto_409366 ?auto_409365 ) ( ON ?auto_409367 ?auto_409366 ) ( not ( = ?auto_409362 ?auto_409363 ) ) ( not ( = ?auto_409362 ?auto_409364 ) ) ( not ( = ?auto_409362 ?auto_409365 ) ) ( not ( = ?auto_409362 ?auto_409366 ) ) ( not ( = ?auto_409362 ?auto_409367 ) ) ( not ( = ?auto_409362 ?auto_409368 ) ) ( not ( = ?auto_409362 ?auto_409369 ) ) ( not ( = ?auto_409362 ?auto_409372 ) ) ( not ( = ?auto_409363 ?auto_409364 ) ) ( not ( = ?auto_409363 ?auto_409365 ) ) ( not ( = ?auto_409363 ?auto_409366 ) ) ( not ( = ?auto_409363 ?auto_409367 ) ) ( not ( = ?auto_409363 ?auto_409368 ) ) ( not ( = ?auto_409363 ?auto_409369 ) ) ( not ( = ?auto_409363 ?auto_409372 ) ) ( not ( = ?auto_409364 ?auto_409365 ) ) ( not ( = ?auto_409364 ?auto_409366 ) ) ( not ( = ?auto_409364 ?auto_409367 ) ) ( not ( = ?auto_409364 ?auto_409368 ) ) ( not ( = ?auto_409364 ?auto_409369 ) ) ( not ( = ?auto_409364 ?auto_409372 ) ) ( not ( = ?auto_409365 ?auto_409366 ) ) ( not ( = ?auto_409365 ?auto_409367 ) ) ( not ( = ?auto_409365 ?auto_409368 ) ) ( not ( = ?auto_409365 ?auto_409369 ) ) ( not ( = ?auto_409365 ?auto_409372 ) ) ( not ( = ?auto_409366 ?auto_409367 ) ) ( not ( = ?auto_409366 ?auto_409368 ) ) ( not ( = ?auto_409366 ?auto_409369 ) ) ( not ( = ?auto_409366 ?auto_409372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409367 ?auto_409368 ?auto_409369 )
      ( MAKE-7CRATE-VERIFY ?auto_409362 ?auto_409363 ?auto_409364 ?auto_409365 ?auto_409366 ?auto_409367 ?auto_409368 ?auto_409369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_409941 - SURFACE
      ?auto_409942 - SURFACE
    )
    :vars
    (
      ?auto_409944 - HOIST
      ?auto_409949 - PLACE
      ?auto_409948 - SURFACE
      ?auto_409946 - PLACE
      ?auto_409943 - HOIST
      ?auto_409945 - SURFACE
      ?auto_409947 - TRUCK
      ?auto_409950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_409944 ?auto_409949 ) ( SURFACE-AT ?auto_409941 ?auto_409949 ) ( CLEAR ?auto_409941 ) ( IS-CRATE ?auto_409942 ) ( not ( = ?auto_409941 ?auto_409942 ) ) ( ON ?auto_409941 ?auto_409948 ) ( not ( = ?auto_409948 ?auto_409941 ) ) ( not ( = ?auto_409948 ?auto_409942 ) ) ( not ( = ?auto_409946 ?auto_409949 ) ) ( HOIST-AT ?auto_409943 ?auto_409946 ) ( not ( = ?auto_409944 ?auto_409943 ) ) ( AVAILABLE ?auto_409943 ) ( SURFACE-AT ?auto_409942 ?auto_409946 ) ( ON ?auto_409942 ?auto_409945 ) ( CLEAR ?auto_409942 ) ( not ( = ?auto_409941 ?auto_409945 ) ) ( not ( = ?auto_409942 ?auto_409945 ) ) ( not ( = ?auto_409948 ?auto_409945 ) ) ( TRUCK-AT ?auto_409947 ?auto_409949 ) ( LIFTING ?auto_409944 ?auto_409950 ) ( IS-CRATE ?auto_409950 ) ( not ( = ?auto_409941 ?auto_409950 ) ) ( not ( = ?auto_409942 ?auto_409950 ) ) ( not ( = ?auto_409948 ?auto_409950 ) ) ( not ( = ?auto_409945 ?auto_409950 ) ) )
    :subtasks
    ( ( !LOAD ?auto_409944 ?auto_409950 ?auto_409947 ?auto_409949 )
      ( MAKE-1CRATE ?auto_409941 ?auto_409942 )
      ( MAKE-1CRATE-VERIFY ?auto_409941 ?auto_409942 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_411408 - SURFACE
      ?auto_411409 - SURFACE
    )
    :vars
    (
      ?auto_411411 - HOIST
      ?auto_411415 - PLACE
      ?auto_411416 - SURFACE
      ?auto_411410 - TRUCK
      ?auto_411414 - PLACE
      ?auto_411412 - HOIST
      ?auto_411413 - SURFACE
      ?auto_411417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_411411 ?auto_411415 ) ( SURFACE-AT ?auto_411408 ?auto_411415 ) ( CLEAR ?auto_411408 ) ( IS-CRATE ?auto_411409 ) ( not ( = ?auto_411408 ?auto_411409 ) ) ( AVAILABLE ?auto_411411 ) ( ON ?auto_411408 ?auto_411416 ) ( not ( = ?auto_411416 ?auto_411408 ) ) ( not ( = ?auto_411416 ?auto_411409 ) ) ( TRUCK-AT ?auto_411410 ?auto_411414 ) ( not ( = ?auto_411414 ?auto_411415 ) ) ( HOIST-AT ?auto_411412 ?auto_411414 ) ( not ( = ?auto_411411 ?auto_411412 ) ) ( SURFACE-AT ?auto_411409 ?auto_411414 ) ( ON ?auto_411409 ?auto_411413 ) ( CLEAR ?auto_411409 ) ( not ( = ?auto_411408 ?auto_411413 ) ) ( not ( = ?auto_411409 ?auto_411413 ) ) ( not ( = ?auto_411416 ?auto_411413 ) ) ( LIFTING ?auto_411412 ?auto_411417 ) ( IS-CRATE ?auto_411417 ) ( not ( = ?auto_411408 ?auto_411417 ) ) ( not ( = ?auto_411409 ?auto_411417 ) ) ( not ( = ?auto_411416 ?auto_411417 ) ) ( not ( = ?auto_411413 ?auto_411417 ) ) )
    :subtasks
    ( ( !LOAD ?auto_411412 ?auto_411417 ?auto_411410 ?auto_411414 )
      ( MAKE-1CRATE ?auto_411408 ?auto_411409 )
      ( MAKE-1CRATE-VERIFY ?auto_411408 ?auto_411409 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412247 - SURFACE
      ?auto_412248 - SURFACE
      ?auto_412249 - SURFACE
      ?auto_412250 - SURFACE
      ?auto_412251 - SURFACE
      ?auto_412252 - SURFACE
      ?auto_412253 - SURFACE
      ?auto_412254 - SURFACE
      ?auto_412255 - SURFACE
    )
    :vars
    (
      ?auto_412257 - HOIST
      ?auto_412256 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412257 ?auto_412256 ) ( SURFACE-AT ?auto_412254 ?auto_412256 ) ( CLEAR ?auto_412254 ) ( LIFTING ?auto_412257 ?auto_412255 ) ( IS-CRATE ?auto_412255 ) ( not ( = ?auto_412254 ?auto_412255 ) ) ( ON ?auto_412248 ?auto_412247 ) ( ON ?auto_412249 ?auto_412248 ) ( ON ?auto_412250 ?auto_412249 ) ( ON ?auto_412251 ?auto_412250 ) ( ON ?auto_412252 ?auto_412251 ) ( ON ?auto_412253 ?auto_412252 ) ( ON ?auto_412254 ?auto_412253 ) ( not ( = ?auto_412247 ?auto_412248 ) ) ( not ( = ?auto_412247 ?auto_412249 ) ) ( not ( = ?auto_412247 ?auto_412250 ) ) ( not ( = ?auto_412247 ?auto_412251 ) ) ( not ( = ?auto_412247 ?auto_412252 ) ) ( not ( = ?auto_412247 ?auto_412253 ) ) ( not ( = ?auto_412247 ?auto_412254 ) ) ( not ( = ?auto_412247 ?auto_412255 ) ) ( not ( = ?auto_412248 ?auto_412249 ) ) ( not ( = ?auto_412248 ?auto_412250 ) ) ( not ( = ?auto_412248 ?auto_412251 ) ) ( not ( = ?auto_412248 ?auto_412252 ) ) ( not ( = ?auto_412248 ?auto_412253 ) ) ( not ( = ?auto_412248 ?auto_412254 ) ) ( not ( = ?auto_412248 ?auto_412255 ) ) ( not ( = ?auto_412249 ?auto_412250 ) ) ( not ( = ?auto_412249 ?auto_412251 ) ) ( not ( = ?auto_412249 ?auto_412252 ) ) ( not ( = ?auto_412249 ?auto_412253 ) ) ( not ( = ?auto_412249 ?auto_412254 ) ) ( not ( = ?auto_412249 ?auto_412255 ) ) ( not ( = ?auto_412250 ?auto_412251 ) ) ( not ( = ?auto_412250 ?auto_412252 ) ) ( not ( = ?auto_412250 ?auto_412253 ) ) ( not ( = ?auto_412250 ?auto_412254 ) ) ( not ( = ?auto_412250 ?auto_412255 ) ) ( not ( = ?auto_412251 ?auto_412252 ) ) ( not ( = ?auto_412251 ?auto_412253 ) ) ( not ( = ?auto_412251 ?auto_412254 ) ) ( not ( = ?auto_412251 ?auto_412255 ) ) ( not ( = ?auto_412252 ?auto_412253 ) ) ( not ( = ?auto_412252 ?auto_412254 ) ) ( not ( = ?auto_412252 ?auto_412255 ) ) ( not ( = ?auto_412253 ?auto_412254 ) ) ( not ( = ?auto_412253 ?auto_412255 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412254 ?auto_412255 )
      ( MAKE-8CRATE-VERIFY ?auto_412247 ?auto_412248 ?auto_412249 ?auto_412250 ?auto_412251 ?auto_412252 ?auto_412253 ?auto_412254 ?auto_412255 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412314 - SURFACE
      ?auto_412315 - SURFACE
      ?auto_412316 - SURFACE
      ?auto_412317 - SURFACE
      ?auto_412318 - SURFACE
      ?auto_412319 - SURFACE
      ?auto_412320 - SURFACE
      ?auto_412321 - SURFACE
      ?auto_412322 - SURFACE
    )
    :vars
    (
      ?auto_412325 - HOIST
      ?auto_412324 - PLACE
      ?auto_412323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412325 ?auto_412324 ) ( SURFACE-AT ?auto_412321 ?auto_412324 ) ( CLEAR ?auto_412321 ) ( IS-CRATE ?auto_412322 ) ( not ( = ?auto_412321 ?auto_412322 ) ) ( TRUCK-AT ?auto_412323 ?auto_412324 ) ( AVAILABLE ?auto_412325 ) ( IN ?auto_412322 ?auto_412323 ) ( ON ?auto_412321 ?auto_412320 ) ( not ( = ?auto_412320 ?auto_412321 ) ) ( not ( = ?auto_412320 ?auto_412322 ) ) ( ON ?auto_412315 ?auto_412314 ) ( ON ?auto_412316 ?auto_412315 ) ( ON ?auto_412317 ?auto_412316 ) ( ON ?auto_412318 ?auto_412317 ) ( ON ?auto_412319 ?auto_412318 ) ( ON ?auto_412320 ?auto_412319 ) ( not ( = ?auto_412314 ?auto_412315 ) ) ( not ( = ?auto_412314 ?auto_412316 ) ) ( not ( = ?auto_412314 ?auto_412317 ) ) ( not ( = ?auto_412314 ?auto_412318 ) ) ( not ( = ?auto_412314 ?auto_412319 ) ) ( not ( = ?auto_412314 ?auto_412320 ) ) ( not ( = ?auto_412314 ?auto_412321 ) ) ( not ( = ?auto_412314 ?auto_412322 ) ) ( not ( = ?auto_412315 ?auto_412316 ) ) ( not ( = ?auto_412315 ?auto_412317 ) ) ( not ( = ?auto_412315 ?auto_412318 ) ) ( not ( = ?auto_412315 ?auto_412319 ) ) ( not ( = ?auto_412315 ?auto_412320 ) ) ( not ( = ?auto_412315 ?auto_412321 ) ) ( not ( = ?auto_412315 ?auto_412322 ) ) ( not ( = ?auto_412316 ?auto_412317 ) ) ( not ( = ?auto_412316 ?auto_412318 ) ) ( not ( = ?auto_412316 ?auto_412319 ) ) ( not ( = ?auto_412316 ?auto_412320 ) ) ( not ( = ?auto_412316 ?auto_412321 ) ) ( not ( = ?auto_412316 ?auto_412322 ) ) ( not ( = ?auto_412317 ?auto_412318 ) ) ( not ( = ?auto_412317 ?auto_412319 ) ) ( not ( = ?auto_412317 ?auto_412320 ) ) ( not ( = ?auto_412317 ?auto_412321 ) ) ( not ( = ?auto_412317 ?auto_412322 ) ) ( not ( = ?auto_412318 ?auto_412319 ) ) ( not ( = ?auto_412318 ?auto_412320 ) ) ( not ( = ?auto_412318 ?auto_412321 ) ) ( not ( = ?auto_412318 ?auto_412322 ) ) ( not ( = ?auto_412319 ?auto_412320 ) ) ( not ( = ?auto_412319 ?auto_412321 ) ) ( not ( = ?auto_412319 ?auto_412322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412320 ?auto_412321 ?auto_412322 )
      ( MAKE-8CRATE-VERIFY ?auto_412314 ?auto_412315 ?auto_412316 ?auto_412317 ?auto_412318 ?auto_412319 ?auto_412320 ?auto_412321 ?auto_412322 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412390 - SURFACE
      ?auto_412391 - SURFACE
      ?auto_412392 - SURFACE
      ?auto_412393 - SURFACE
      ?auto_412394 - SURFACE
      ?auto_412395 - SURFACE
      ?auto_412396 - SURFACE
      ?auto_412397 - SURFACE
      ?auto_412398 - SURFACE
    )
    :vars
    (
      ?auto_412400 - HOIST
      ?auto_412399 - PLACE
      ?auto_412401 - TRUCK
      ?auto_412402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412400 ?auto_412399 ) ( SURFACE-AT ?auto_412397 ?auto_412399 ) ( CLEAR ?auto_412397 ) ( IS-CRATE ?auto_412398 ) ( not ( = ?auto_412397 ?auto_412398 ) ) ( AVAILABLE ?auto_412400 ) ( IN ?auto_412398 ?auto_412401 ) ( ON ?auto_412397 ?auto_412396 ) ( not ( = ?auto_412396 ?auto_412397 ) ) ( not ( = ?auto_412396 ?auto_412398 ) ) ( TRUCK-AT ?auto_412401 ?auto_412402 ) ( not ( = ?auto_412402 ?auto_412399 ) ) ( ON ?auto_412391 ?auto_412390 ) ( ON ?auto_412392 ?auto_412391 ) ( ON ?auto_412393 ?auto_412392 ) ( ON ?auto_412394 ?auto_412393 ) ( ON ?auto_412395 ?auto_412394 ) ( ON ?auto_412396 ?auto_412395 ) ( not ( = ?auto_412390 ?auto_412391 ) ) ( not ( = ?auto_412390 ?auto_412392 ) ) ( not ( = ?auto_412390 ?auto_412393 ) ) ( not ( = ?auto_412390 ?auto_412394 ) ) ( not ( = ?auto_412390 ?auto_412395 ) ) ( not ( = ?auto_412390 ?auto_412396 ) ) ( not ( = ?auto_412390 ?auto_412397 ) ) ( not ( = ?auto_412390 ?auto_412398 ) ) ( not ( = ?auto_412391 ?auto_412392 ) ) ( not ( = ?auto_412391 ?auto_412393 ) ) ( not ( = ?auto_412391 ?auto_412394 ) ) ( not ( = ?auto_412391 ?auto_412395 ) ) ( not ( = ?auto_412391 ?auto_412396 ) ) ( not ( = ?auto_412391 ?auto_412397 ) ) ( not ( = ?auto_412391 ?auto_412398 ) ) ( not ( = ?auto_412392 ?auto_412393 ) ) ( not ( = ?auto_412392 ?auto_412394 ) ) ( not ( = ?auto_412392 ?auto_412395 ) ) ( not ( = ?auto_412392 ?auto_412396 ) ) ( not ( = ?auto_412392 ?auto_412397 ) ) ( not ( = ?auto_412392 ?auto_412398 ) ) ( not ( = ?auto_412393 ?auto_412394 ) ) ( not ( = ?auto_412393 ?auto_412395 ) ) ( not ( = ?auto_412393 ?auto_412396 ) ) ( not ( = ?auto_412393 ?auto_412397 ) ) ( not ( = ?auto_412393 ?auto_412398 ) ) ( not ( = ?auto_412394 ?auto_412395 ) ) ( not ( = ?auto_412394 ?auto_412396 ) ) ( not ( = ?auto_412394 ?auto_412397 ) ) ( not ( = ?auto_412394 ?auto_412398 ) ) ( not ( = ?auto_412395 ?auto_412396 ) ) ( not ( = ?auto_412395 ?auto_412397 ) ) ( not ( = ?auto_412395 ?auto_412398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412396 ?auto_412397 ?auto_412398 )
      ( MAKE-8CRATE-VERIFY ?auto_412390 ?auto_412391 ?auto_412392 ?auto_412393 ?auto_412394 ?auto_412395 ?auto_412396 ?auto_412397 ?auto_412398 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412474 - SURFACE
      ?auto_412475 - SURFACE
      ?auto_412476 - SURFACE
      ?auto_412477 - SURFACE
      ?auto_412478 - SURFACE
      ?auto_412479 - SURFACE
      ?auto_412480 - SURFACE
      ?auto_412481 - SURFACE
      ?auto_412482 - SURFACE
    )
    :vars
    (
      ?auto_412486 - HOIST
      ?auto_412485 - PLACE
      ?auto_412484 - TRUCK
      ?auto_412487 - PLACE
      ?auto_412483 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_412486 ?auto_412485 ) ( SURFACE-AT ?auto_412481 ?auto_412485 ) ( CLEAR ?auto_412481 ) ( IS-CRATE ?auto_412482 ) ( not ( = ?auto_412481 ?auto_412482 ) ) ( AVAILABLE ?auto_412486 ) ( ON ?auto_412481 ?auto_412480 ) ( not ( = ?auto_412480 ?auto_412481 ) ) ( not ( = ?auto_412480 ?auto_412482 ) ) ( TRUCK-AT ?auto_412484 ?auto_412487 ) ( not ( = ?auto_412487 ?auto_412485 ) ) ( HOIST-AT ?auto_412483 ?auto_412487 ) ( LIFTING ?auto_412483 ?auto_412482 ) ( not ( = ?auto_412486 ?auto_412483 ) ) ( ON ?auto_412475 ?auto_412474 ) ( ON ?auto_412476 ?auto_412475 ) ( ON ?auto_412477 ?auto_412476 ) ( ON ?auto_412478 ?auto_412477 ) ( ON ?auto_412479 ?auto_412478 ) ( ON ?auto_412480 ?auto_412479 ) ( not ( = ?auto_412474 ?auto_412475 ) ) ( not ( = ?auto_412474 ?auto_412476 ) ) ( not ( = ?auto_412474 ?auto_412477 ) ) ( not ( = ?auto_412474 ?auto_412478 ) ) ( not ( = ?auto_412474 ?auto_412479 ) ) ( not ( = ?auto_412474 ?auto_412480 ) ) ( not ( = ?auto_412474 ?auto_412481 ) ) ( not ( = ?auto_412474 ?auto_412482 ) ) ( not ( = ?auto_412475 ?auto_412476 ) ) ( not ( = ?auto_412475 ?auto_412477 ) ) ( not ( = ?auto_412475 ?auto_412478 ) ) ( not ( = ?auto_412475 ?auto_412479 ) ) ( not ( = ?auto_412475 ?auto_412480 ) ) ( not ( = ?auto_412475 ?auto_412481 ) ) ( not ( = ?auto_412475 ?auto_412482 ) ) ( not ( = ?auto_412476 ?auto_412477 ) ) ( not ( = ?auto_412476 ?auto_412478 ) ) ( not ( = ?auto_412476 ?auto_412479 ) ) ( not ( = ?auto_412476 ?auto_412480 ) ) ( not ( = ?auto_412476 ?auto_412481 ) ) ( not ( = ?auto_412476 ?auto_412482 ) ) ( not ( = ?auto_412477 ?auto_412478 ) ) ( not ( = ?auto_412477 ?auto_412479 ) ) ( not ( = ?auto_412477 ?auto_412480 ) ) ( not ( = ?auto_412477 ?auto_412481 ) ) ( not ( = ?auto_412477 ?auto_412482 ) ) ( not ( = ?auto_412478 ?auto_412479 ) ) ( not ( = ?auto_412478 ?auto_412480 ) ) ( not ( = ?auto_412478 ?auto_412481 ) ) ( not ( = ?auto_412478 ?auto_412482 ) ) ( not ( = ?auto_412479 ?auto_412480 ) ) ( not ( = ?auto_412479 ?auto_412481 ) ) ( not ( = ?auto_412479 ?auto_412482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412480 ?auto_412481 ?auto_412482 )
      ( MAKE-8CRATE-VERIFY ?auto_412474 ?auto_412475 ?auto_412476 ?auto_412477 ?auto_412478 ?auto_412479 ?auto_412480 ?auto_412481 ?auto_412482 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412566 - SURFACE
      ?auto_412567 - SURFACE
      ?auto_412568 - SURFACE
      ?auto_412569 - SURFACE
      ?auto_412570 - SURFACE
      ?auto_412571 - SURFACE
      ?auto_412572 - SURFACE
      ?auto_412573 - SURFACE
      ?auto_412574 - SURFACE
    )
    :vars
    (
      ?auto_412575 - HOIST
      ?auto_412576 - PLACE
      ?auto_412579 - TRUCK
      ?auto_412580 - PLACE
      ?auto_412577 - HOIST
      ?auto_412578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412575 ?auto_412576 ) ( SURFACE-AT ?auto_412573 ?auto_412576 ) ( CLEAR ?auto_412573 ) ( IS-CRATE ?auto_412574 ) ( not ( = ?auto_412573 ?auto_412574 ) ) ( AVAILABLE ?auto_412575 ) ( ON ?auto_412573 ?auto_412572 ) ( not ( = ?auto_412572 ?auto_412573 ) ) ( not ( = ?auto_412572 ?auto_412574 ) ) ( TRUCK-AT ?auto_412579 ?auto_412580 ) ( not ( = ?auto_412580 ?auto_412576 ) ) ( HOIST-AT ?auto_412577 ?auto_412580 ) ( not ( = ?auto_412575 ?auto_412577 ) ) ( AVAILABLE ?auto_412577 ) ( SURFACE-AT ?auto_412574 ?auto_412580 ) ( ON ?auto_412574 ?auto_412578 ) ( CLEAR ?auto_412574 ) ( not ( = ?auto_412573 ?auto_412578 ) ) ( not ( = ?auto_412574 ?auto_412578 ) ) ( not ( = ?auto_412572 ?auto_412578 ) ) ( ON ?auto_412567 ?auto_412566 ) ( ON ?auto_412568 ?auto_412567 ) ( ON ?auto_412569 ?auto_412568 ) ( ON ?auto_412570 ?auto_412569 ) ( ON ?auto_412571 ?auto_412570 ) ( ON ?auto_412572 ?auto_412571 ) ( not ( = ?auto_412566 ?auto_412567 ) ) ( not ( = ?auto_412566 ?auto_412568 ) ) ( not ( = ?auto_412566 ?auto_412569 ) ) ( not ( = ?auto_412566 ?auto_412570 ) ) ( not ( = ?auto_412566 ?auto_412571 ) ) ( not ( = ?auto_412566 ?auto_412572 ) ) ( not ( = ?auto_412566 ?auto_412573 ) ) ( not ( = ?auto_412566 ?auto_412574 ) ) ( not ( = ?auto_412566 ?auto_412578 ) ) ( not ( = ?auto_412567 ?auto_412568 ) ) ( not ( = ?auto_412567 ?auto_412569 ) ) ( not ( = ?auto_412567 ?auto_412570 ) ) ( not ( = ?auto_412567 ?auto_412571 ) ) ( not ( = ?auto_412567 ?auto_412572 ) ) ( not ( = ?auto_412567 ?auto_412573 ) ) ( not ( = ?auto_412567 ?auto_412574 ) ) ( not ( = ?auto_412567 ?auto_412578 ) ) ( not ( = ?auto_412568 ?auto_412569 ) ) ( not ( = ?auto_412568 ?auto_412570 ) ) ( not ( = ?auto_412568 ?auto_412571 ) ) ( not ( = ?auto_412568 ?auto_412572 ) ) ( not ( = ?auto_412568 ?auto_412573 ) ) ( not ( = ?auto_412568 ?auto_412574 ) ) ( not ( = ?auto_412568 ?auto_412578 ) ) ( not ( = ?auto_412569 ?auto_412570 ) ) ( not ( = ?auto_412569 ?auto_412571 ) ) ( not ( = ?auto_412569 ?auto_412572 ) ) ( not ( = ?auto_412569 ?auto_412573 ) ) ( not ( = ?auto_412569 ?auto_412574 ) ) ( not ( = ?auto_412569 ?auto_412578 ) ) ( not ( = ?auto_412570 ?auto_412571 ) ) ( not ( = ?auto_412570 ?auto_412572 ) ) ( not ( = ?auto_412570 ?auto_412573 ) ) ( not ( = ?auto_412570 ?auto_412574 ) ) ( not ( = ?auto_412570 ?auto_412578 ) ) ( not ( = ?auto_412571 ?auto_412572 ) ) ( not ( = ?auto_412571 ?auto_412573 ) ) ( not ( = ?auto_412571 ?auto_412574 ) ) ( not ( = ?auto_412571 ?auto_412578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412572 ?auto_412573 ?auto_412574 )
      ( MAKE-8CRATE-VERIFY ?auto_412566 ?auto_412567 ?auto_412568 ?auto_412569 ?auto_412570 ?auto_412571 ?auto_412572 ?auto_412573 ?auto_412574 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412659 - SURFACE
      ?auto_412660 - SURFACE
      ?auto_412661 - SURFACE
      ?auto_412662 - SURFACE
      ?auto_412663 - SURFACE
      ?auto_412664 - SURFACE
      ?auto_412665 - SURFACE
      ?auto_412666 - SURFACE
      ?auto_412667 - SURFACE
    )
    :vars
    (
      ?auto_412673 - HOIST
      ?auto_412672 - PLACE
      ?auto_412671 - PLACE
      ?auto_412669 - HOIST
      ?auto_412670 - SURFACE
      ?auto_412668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412673 ?auto_412672 ) ( SURFACE-AT ?auto_412666 ?auto_412672 ) ( CLEAR ?auto_412666 ) ( IS-CRATE ?auto_412667 ) ( not ( = ?auto_412666 ?auto_412667 ) ) ( AVAILABLE ?auto_412673 ) ( ON ?auto_412666 ?auto_412665 ) ( not ( = ?auto_412665 ?auto_412666 ) ) ( not ( = ?auto_412665 ?auto_412667 ) ) ( not ( = ?auto_412671 ?auto_412672 ) ) ( HOIST-AT ?auto_412669 ?auto_412671 ) ( not ( = ?auto_412673 ?auto_412669 ) ) ( AVAILABLE ?auto_412669 ) ( SURFACE-AT ?auto_412667 ?auto_412671 ) ( ON ?auto_412667 ?auto_412670 ) ( CLEAR ?auto_412667 ) ( not ( = ?auto_412666 ?auto_412670 ) ) ( not ( = ?auto_412667 ?auto_412670 ) ) ( not ( = ?auto_412665 ?auto_412670 ) ) ( TRUCK-AT ?auto_412668 ?auto_412672 ) ( ON ?auto_412660 ?auto_412659 ) ( ON ?auto_412661 ?auto_412660 ) ( ON ?auto_412662 ?auto_412661 ) ( ON ?auto_412663 ?auto_412662 ) ( ON ?auto_412664 ?auto_412663 ) ( ON ?auto_412665 ?auto_412664 ) ( not ( = ?auto_412659 ?auto_412660 ) ) ( not ( = ?auto_412659 ?auto_412661 ) ) ( not ( = ?auto_412659 ?auto_412662 ) ) ( not ( = ?auto_412659 ?auto_412663 ) ) ( not ( = ?auto_412659 ?auto_412664 ) ) ( not ( = ?auto_412659 ?auto_412665 ) ) ( not ( = ?auto_412659 ?auto_412666 ) ) ( not ( = ?auto_412659 ?auto_412667 ) ) ( not ( = ?auto_412659 ?auto_412670 ) ) ( not ( = ?auto_412660 ?auto_412661 ) ) ( not ( = ?auto_412660 ?auto_412662 ) ) ( not ( = ?auto_412660 ?auto_412663 ) ) ( not ( = ?auto_412660 ?auto_412664 ) ) ( not ( = ?auto_412660 ?auto_412665 ) ) ( not ( = ?auto_412660 ?auto_412666 ) ) ( not ( = ?auto_412660 ?auto_412667 ) ) ( not ( = ?auto_412660 ?auto_412670 ) ) ( not ( = ?auto_412661 ?auto_412662 ) ) ( not ( = ?auto_412661 ?auto_412663 ) ) ( not ( = ?auto_412661 ?auto_412664 ) ) ( not ( = ?auto_412661 ?auto_412665 ) ) ( not ( = ?auto_412661 ?auto_412666 ) ) ( not ( = ?auto_412661 ?auto_412667 ) ) ( not ( = ?auto_412661 ?auto_412670 ) ) ( not ( = ?auto_412662 ?auto_412663 ) ) ( not ( = ?auto_412662 ?auto_412664 ) ) ( not ( = ?auto_412662 ?auto_412665 ) ) ( not ( = ?auto_412662 ?auto_412666 ) ) ( not ( = ?auto_412662 ?auto_412667 ) ) ( not ( = ?auto_412662 ?auto_412670 ) ) ( not ( = ?auto_412663 ?auto_412664 ) ) ( not ( = ?auto_412663 ?auto_412665 ) ) ( not ( = ?auto_412663 ?auto_412666 ) ) ( not ( = ?auto_412663 ?auto_412667 ) ) ( not ( = ?auto_412663 ?auto_412670 ) ) ( not ( = ?auto_412664 ?auto_412665 ) ) ( not ( = ?auto_412664 ?auto_412666 ) ) ( not ( = ?auto_412664 ?auto_412667 ) ) ( not ( = ?auto_412664 ?auto_412670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412665 ?auto_412666 ?auto_412667 )
      ( MAKE-8CRATE-VERIFY ?auto_412659 ?auto_412660 ?auto_412661 ?auto_412662 ?auto_412663 ?auto_412664 ?auto_412665 ?auto_412666 ?auto_412667 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412752 - SURFACE
      ?auto_412753 - SURFACE
      ?auto_412754 - SURFACE
      ?auto_412755 - SURFACE
      ?auto_412756 - SURFACE
      ?auto_412757 - SURFACE
      ?auto_412758 - SURFACE
      ?auto_412759 - SURFACE
      ?auto_412760 - SURFACE
    )
    :vars
    (
      ?auto_412762 - HOIST
      ?auto_412761 - PLACE
      ?auto_412765 - PLACE
      ?auto_412766 - HOIST
      ?auto_412764 - SURFACE
      ?auto_412763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412762 ?auto_412761 ) ( IS-CRATE ?auto_412760 ) ( not ( = ?auto_412759 ?auto_412760 ) ) ( not ( = ?auto_412758 ?auto_412759 ) ) ( not ( = ?auto_412758 ?auto_412760 ) ) ( not ( = ?auto_412765 ?auto_412761 ) ) ( HOIST-AT ?auto_412766 ?auto_412765 ) ( not ( = ?auto_412762 ?auto_412766 ) ) ( AVAILABLE ?auto_412766 ) ( SURFACE-AT ?auto_412760 ?auto_412765 ) ( ON ?auto_412760 ?auto_412764 ) ( CLEAR ?auto_412760 ) ( not ( = ?auto_412759 ?auto_412764 ) ) ( not ( = ?auto_412760 ?auto_412764 ) ) ( not ( = ?auto_412758 ?auto_412764 ) ) ( TRUCK-AT ?auto_412763 ?auto_412761 ) ( SURFACE-AT ?auto_412758 ?auto_412761 ) ( CLEAR ?auto_412758 ) ( LIFTING ?auto_412762 ?auto_412759 ) ( IS-CRATE ?auto_412759 ) ( ON ?auto_412753 ?auto_412752 ) ( ON ?auto_412754 ?auto_412753 ) ( ON ?auto_412755 ?auto_412754 ) ( ON ?auto_412756 ?auto_412755 ) ( ON ?auto_412757 ?auto_412756 ) ( ON ?auto_412758 ?auto_412757 ) ( not ( = ?auto_412752 ?auto_412753 ) ) ( not ( = ?auto_412752 ?auto_412754 ) ) ( not ( = ?auto_412752 ?auto_412755 ) ) ( not ( = ?auto_412752 ?auto_412756 ) ) ( not ( = ?auto_412752 ?auto_412757 ) ) ( not ( = ?auto_412752 ?auto_412758 ) ) ( not ( = ?auto_412752 ?auto_412759 ) ) ( not ( = ?auto_412752 ?auto_412760 ) ) ( not ( = ?auto_412752 ?auto_412764 ) ) ( not ( = ?auto_412753 ?auto_412754 ) ) ( not ( = ?auto_412753 ?auto_412755 ) ) ( not ( = ?auto_412753 ?auto_412756 ) ) ( not ( = ?auto_412753 ?auto_412757 ) ) ( not ( = ?auto_412753 ?auto_412758 ) ) ( not ( = ?auto_412753 ?auto_412759 ) ) ( not ( = ?auto_412753 ?auto_412760 ) ) ( not ( = ?auto_412753 ?auto_412764 ) ) ( not ( = ?auto_412754 ?auto_412755 ) ) ( not ( = ?auto_412754 ?auto_412756 ) ) ( not ( = ?auto_412754 ?auto_412757 ) ) ( not ( = ?auto_412754 ?auto_412758 ) ) ( not ( = ?auto_412754 ?auto_412759 ) ) ( not ( = ?auto_412754 ?auto_412760 ) ) ( not ( = ?auto_412754 ?auto_412764 ) ) ( not ( = ?auto_412755 ?auto_412756 ) ) ( not ( = ?auto_412755 ?auto_412757 ) ) ( not ( = ?auto_412755 ?auto_412758 ) ) ( not ( = ?auto_412755 ?auto_412759 ) ) ( not ( = ?auto_412755 ?auto_412760 ) ) ( not ( = ?auto_412755 ?auto_412764 ) ) ( not ( = ?auto_412756 ?auto_412757 ) ) ( not ( = ?auto_412756 ?auto_412758 ) ) ( not ( = ?auto_412756 ?auto_412759 ) ) ( not ( = ?auto_412756 ?auto_412760 ) ) ( not ( = ?auto_412756 ?auto_412764 ) ) ( not ( = ?auto_412757 ?auto_412758 ) ) ( not ( = ?auto_412757 ?auto_412759 ) ) ( not ( = ?auto_412757 ?auto_412760 ) ) ( not ( = ?auto_412757 ?auto_412764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412758 ?auto_412759 ?auto_412760 )
      ( MAKE-8CRATE-VERIFY ?auto_412752 ?auto_412753 ?auto_412754 ?auto_412755 ?auto_412756 ?auto_412757 ?auto_412758 ?auto_412759 ?auto_412760 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412845 - SURFACE
      ?auto_412846 - SURFACE
      ?auto_412847 - SURFACE
      ?auto_412848 - SURFACE
      ?auto_412849 - SURFACE
      ?auto_412850 - SURFACE
      ?auto_412851 - SURFACE
      ?auto_412852 - SURFACE
      ?auto_412853 - SURFACE
    )
    :vars
    (
      ?auto_412859 - HOIST
      ?auto_412858 - PLACE
      ?auto_412854 - PLACE
      ?auto_412857 - HOIST
      ?auto_412855 - SURFACE
      ?auto_412856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412859 ?auto_412858 ) ( IS-CRATE ?auto_412853 ) ( not ( = ?auto_412852 ?auto_412853 ) ) ( not ( = ?auto_412851 ?auto_412852 ) ) ( not ( = ?auto_412851 ?auto_412853 ) ) ( not ( = ?auto_412854 ?auto_412858 ) ) ( HOIST-AT ?auto_412857 ?auto_412854 ) ( not ( = ?auto_412859 ?auto_412857 ) ) ( AVAILABLE ?auto_412857 ) ( SURFACE-AT ?auto_412853 ?auto_412854 ) ( ON ?auto_412853 ?auto_412855 ) ( CLEAR ?auto_412853 ) ( not ( = ?auto_412852 ?auto_412855 ) ) ( not ( = ?auto_412853 ?auto_412855 ) ) ( not ( = ?auto_412851 ?auto_412855 ) ) ( TRUCK-AT ?auto_412856 ?auto_412858 ) ( SURFACE-AT ?auto_412851 ?auto_412858 ) ( CLEAR ?auto_412851 ) ( IS-CRATE ?auto_412852 ) ( AVAILABLE ?auto_412859 ) ( IN ?auto_412852 ?auto_412856 ) ( ON ?auto_412846 ?auto_412845 ) ( ON ?auto_412847 ?auto_412846 ) ( ON ?auto_412848 ?auto_412847 ) ( ON ?auto_412849 ?auto_412848 ) ( ON ?auto_412850 ?auto_412849 ) ( ON ?auto_412851 ?auto_412850 ) ( not ( = ?auto_412845 ?auto_412846 ) ) ( not ( = ?auto_412845 ?auto_412847 ) ) ( not ( = ?auto_412845 ?auto_412848 ) ) ( not ( = ?auto_412845 ?auto_412849 ) ) ( not ( = ?auto_412845 ?auto_412850 ) ) ( not ( = ?auto_412845 ?auto_412851 ) ) ( not ( = ?auto_412845 ?auto_412852 ) ) ( not ( = ?auto_412845 ?auto_412853 ) ) ( not ( = ?auto_412845 ?auto_412855 ) ) ( not ( = ?auto_412846 ?auto_412847 ) ) ( not ( = ?auto_412846 ?auto_412848 ) ) ( not ( = ?auto_412846 ?auto_412849 ) ) ( not ( = ?auto_412846 ?auto_412850 ) ) ( not ( = ?auto_412846 ?auto_412851 ) ) ( not ( = ?auto_412846 ?auto_412852 ) ) ( not ( = ?auto_412846 ?auto_412853 ) ) ( not ( = ?auto_412846 ?auto_412855 ) ) ( not ( = ?auto_412847 ?auto_412848 ) ) ( not ( = ?auto_412847 ?auto_412849 ) ) ( not ( = ?auto_412847 ?auto_412850 ) ) ( not ( = ?auto_412847 ?auto_412851 ) ) ( not ( = ?auto_412847 ?auto_412852 ) ) ( not ( = ?auto_412847 ?auto_412853 ) ) ( not ( = ?auto_412847 ?auto_412855 ) ) ( not ( = ?auto_412848 ?auto_412849 ) ) ( not ( = ?auto_412848 ?auto_412850 ) ) ( not ( = ?auto_412848 ?auto_412851 ) ) ( not ( = ?auto_412848 ?auto_412852 ) ) ( not ( = ?auto_412848 ?auto_412853 ) ) ( not ( = ?auto_412848 ?auto_412855 ) ) ( not ( = ?auto_412849 ?auto_412850 ) ) ( not ( = ?auto_412849 ?auto_412851 ) ) ( not ( = ?auto_412849 ?auto_412852 ) ) ( not ( = ?auto_412849 ?auto_412853 ) ) ( not ( = ?auto_412849 ?auto_412855 ) ) ( not ( = ?auto_412850 ?auto_412851 ) ) ( not ( = ?auto_412850 ?auto_412852 ) ) ( not ( = ?auto_412850 ?auto_412853 ) ) ( not ( = ?auto_412850 ?auto_412855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412851 ?auto_412852 ?auto_412853 )
      ( MAKE-8CRATE-VERIFY ?auto_412845 ?auto_412846 ?auto_412847 ?auto_412848 ?auto_412849 ?auto_412850 ?auto_412851 ?auto_412852 ?auto_412853 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416944 - SURFACE
      ?auto_416945 - SURFACE
      ?auto_416946 - SURFACE
      ?auto_416947 - SURFACE
      ?auto_416948 - SURFACE
      ?auto_416949 - SURFACE
      ?auto_416950 - SURFACE
      ?auto_416951 - SURFACE
      ?auto_416952 - SURFACE
      ?auto_416953 - SURFACE
    )
    :vars
    (
      ?auto_416954 - HOIST
      ?auto_416955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_416954 ?auto_416955 ) ( SURFACE-AT ?auto_416952 ?auto_416955 ) ( CLEAR ?auto_416952 ) ( LIFTING ?auto_416954 ?auto_416953 ) ( IS-CRATE ?auto_416953 ) ( not ( = ?auto_416952 ?auto_416953 ) ) ( ON ?auto_416945 ?auto_416944 ) ( ON ?auto_416946 ?auto_416945 ) ( ON ?auto_416947 ?auto_416946 ) ( ON ?auto_416948 ?auto_416947 ) ( ON ?auto_416949 ?auto_416948 ) ( ON ?auto_416950 ?auto_416949 ) ( ON ?auto_416951 ?auto_416950 ) ( ON ?auto_416952 ?auto_416951 ) ( not ( = ?auto_416944 ?auto_416945 ) ) ( not ( = ?auto_416944 ?auto_416946 ) ) ( not ( = ?auto_416944 ?auto_416947 ) ) ( not ( = ?auto_416944 ?auto_416948 ) ) ( not ( = ?auto_416944 ?auto_416949 ) ) ( not ( = ?auto_416944 ?auto_416950 ) ) ( not ( = ?auto_416944 ?auto_416951 ) ) ( not ( = ?auto_416944 ?auto_416952 ) ) ( not ( = ?auto_416944 ?auto_416953 ) ) ( not ( = ?auto_416945 ?auto_416946 ) ) ( not ( = ?auto_416945 ?auto_416947 ) ) ( not ( = ?auto_416945 ?auto_416948 ) ) ( not ( = ?auto_416945 ?auto_416949 ) ) ( not ( = ?auto_416945 ?auto_416950 ) ) ( not ( = ?auto_416945 ?auto_416951 ) ) ( not ( = ?auto_416945 ?auto_416952 ) ) ( not ( = ?auto_416945 ?auto_416953 ) ) ( not ( = ?auto_416946 ?auto_416947 ) ) ( not ( = ?auto_416946 ?auto_416948 ) ) ( not ( = ?auto_416946 ?auto_416949 ) ) ( not ( = ?auto_416946 ?auto_416950 ) ) ( not ( = ?auto_416946 ?auto_416951 ) ) ( not ( = ?auto_416946 ?auto_416952 ) ) ( not ( = ?auto_416946 ?auto_416953 ) ) ( not ( = ?auto_416947 ?auto_416948 ) ) ( not ( = ?auto_416947 ?auto_416949 ) ) ( not ( = ?auto_416947 ?auto_416950 ) ) ( not ( = ?auto_416947 ?auto_416951 ) ) ( not ( = ?auto_416947 ?auto_416952 ) ) ( not ( = ?auto_416947 ?auto_416953 ) ) ( not ( = ?auto_416948 ?auto_416949 ) ) ( not ( = ?auto_416948 ?auto_416950 ) ) ( not ( = ?auto_416948 ?auto_416951 ) ) ( not ( = ?auto_416948 ?auto_416952 ) ) ( not ( = ?auto_416948 ?auto_416953 ) ) ( not ( = ?auto_416949 ?auto_416950 ) ) ( not ( = ?auto_416949 ?auto_416951 ) ) ( not ( = ?auto_416949 ?auto_416952 ) ) ( not ( = ?auto_416949 ?auto_416953 ) ) ( not ( = ?auto_416950 ?auto_416951 ) ) ( not ( = ?auto_416950 ?auto_416952 ) ) ( not ( = ?auto_416950 ?auto_416953 ) ) ( not ( = ?auto_416951 ?auto_416952 ) ) ( not ( = ?auto_416951 ?auto_416953 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_416952 ?auto_416953 )
      ( MAKE-9CRATE-VERIFY ?auto_416944 ?auto_416945 ?auto_416946 ?auto_416947 ?auto_416948 ?auto_416949 ?auto_416950 ?auto_416951 ?auto_416952 ?auto_416953 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417024 - SURFACE
      ?auto_417025 - SURFACE
      ?auto_417026 - SURFACE
      ?auto_417027 - SURFACE
      ?auto_417028 - SURFACE
      ?auto_417029 - SURFACE
      ?auto_417030 - SURFACE
      ?auto_417031 - SURFACE
      ?auto_417032 - SURFACE
      ?auto_417033 - SURFACE
    )
    :vars
    (
      ?auto_417035 - HOIST
      ?auto_417034 - PLACE
      ?auto_417036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417035 ?auto_417034 ) ( SURFACE-AT ?auto_417032 ?auto_417034 ) ( CLEAR ?auto_417032 ) ( IS-CRATE ?auto_417033 ) ( not ( = ?auto_417032 ?auto_417033 ) ) ( TRUCK-AT ?auto_417036 ?auto_417034 ) ( AVAILABLE ?auto_417035 ) ( IN ?auto_417033 ?auto_417036 ) ( ON ?auto_417032 ?auto_417031 ) ( not ( = ?auto_417031 ?auto_417032 ) ) ( not ( = ?auto_417031 ?auto_417033 ) ) ( ON ?auto_417025 ?auto_417024 ) ( ON ?auto_417026 ?auto_417025 ) ( ON ?auto_417027 ?auto_417026 ) ( ON ?auto_417028 ?auto_417027 ) ( ON ?auto_417029 ?auto_417028 ) ( ON ?auto_417030 ?auto_417029 ) ( ON ?auto_417031 ?auto_417030 ) ( not ( = ?auto_417024 ?auto_417025 ) ) ( not ( = ?auto_417024 ?auto_417026 ) ) ( not ( = ?auto_417024 ?auto_417027 ) ) ( not ( = ?auto_417024 ?auto_417028 ) ) ( not ( = ?auto_417024 ?auto_417029 ) ) ( not ( = ?auto_417024 ?auto_417030 ) ) ( not ( = ?auto_417024 ?auto_417031 ) ) ( not ( = ?auto_417024 ?auto_417032 ) ) ( not ( = ?auto_417024 ?auto_417033 ) ) ( not ( = ?auto_417025 ?auto_417026 ) ) ( not ( = ?auto_417025 ?auto_417027 ) ) ( not ( = ?auto_417025 ?auto_417028 ) ) ( not ( = ?auto_417025 ?auto_417029 ) ) ( not ( = ?auto_417025 ?auto_417030 ) ) ( not ( = ?auto_417025 ?auto_417031 ) ) ( not ( = ?auto_417025 ?auto_417032 ) ) ( not ( = ?auto_417025 ?auto_417033 ) ) ( not ( = ?auto_417026 ?auto_417027 ) ) ( not ( = ?auto_417026 ?auto_417028 ) ) ( not ( = ?auto_417026 ?auto_417029 ) ) ( not ( = ?auto_417026 ?auto_417030 ) ) ( not ( = ?auto_417026 ?auto_417031 ) ) ( not ( = ?auto_417026 ?auto_417032 ) ) ( not ( = ?auto_417026 ?auto_417033 ) ) ( not ( = ?auto_417027 ?auto_417028 ) ) ( not ( = ?auto_417027 ?auto_417029 ) ) ( not ( = ?auto_417027 ?auto_417030 ) ) ( not ( = ?auto_417027 ?auto_417031 ) ) ( not ( = ?auto_417027 ?auto_417032 ) ) ( not ( = ?auto_417027 ?auto_417033 ) ) ( not ( = ?auto_417028 ?auto_417029 ) ) ( not ( = ?auto_417028 ?auto_417030 ) ) ( not ( = ?auto_417028 ?auto_417031 ) ) ( not ( = ?auto_417028 ?auto_417032 ) ) ( not ( = ?auto_417028 ?auto_417033 ) ) ( not ( = ?auto_417029 ?auto_417030 ) ) ( not ( = ?auto_417029 ?auto_417031 ) ) ( not ( = ?auto_417029 ?auto_417032 ) ) ( not ( = ?auto_417029 ?auto_417033 ) ) ( not ( = ?auto_417030 ?auto_417031 ) ) ( not ( = ?auto_417030 ?auto_417032 ) ) ( not ( = ?auto_417030 ?auto_417033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417031 ?auto_417032 ?auto_417033 )
      ( MAKE-9CRATE-VERIFY ?auto_417024 ?auto_417025 ?auto_417026 ?auto_417027 ?auto_417028 ?auto_417029 ?auto_417030 ?auto_417031 ?auto_417032 ?auto_417033 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417114 - SURFACE
      ?auto_417115 - SURFACE
      ?auto_417116 - SURFACE
      ?auto_417117 - SURFACE
      ?auto_417118 - SURFACE
      ?auto_417119 - SURFACE
      ?auto_417120 - SURFACE
      ?auto_417121 - SURFACE
      ?auto_417122 - SURFACE
      ?auto_417123 - SURFACE
    )
    :vars
    (
      ?auto_417125 - HOIST
      ?auto_417124 - PLACE
      ?auto_417127 - TRUCK
      ?auto_417126 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_417125 ?auto_417124 ) ( SURFACE-AT ?auto_417122 ?auto_417124 ) ( CLEAR ?auto_417122 ) ( IS-CRATE ?auto_417123 ) ( not ( = ?auto_417122 ?auto_417123 ) ) ( AVAILABLE ?auto_417125 ) ( IN ?auto_417123 ?auto_417127 ) ( ON ?auto_417122 ?auto_417121 ) ( not ( = ?auto_417121 ?auto_417122 ) ) ( not ( = ?auto_417121 ?auto_417123 ) ) ( TRUCK-AT ?auto_417127 ?auto_417126 ) ( not ( = ?auto_417126 ?auto_417124 ) ) ( ON ?auto_417115 ?auto_417114 ) ( ON ?auto_417116 ?auto_417115 ) ( ON ?auto_417117 ?auto_417116 ) ( ON ?auto_417118 ?auto_417117 ) ( ON ?auto_417119 ?auto_417118 ) ( ON ?auto_417120 ?auto_417119 ) ( ON ?auto_417121 ?auto_417120 ) ( not ( = ?auto_417114 ?auto_417115 ) ) ( not ( = ?auto_417114 ?auto_417116 ) ) ( not ( = ?auto_417114 ?auto_417117 ) ) ( not ( = ?auto_417114 ?auto_417118 ) ) ( not ( = ?auto_417114 ?auto_417119 ) ) ( not ( = ?auto_417114 ?auto_417120 ) ) ( not ( = ?auto_417114 ?auto_417121 ) ) ( not ( = ?auto_417114 ?auto_417122 ) ) ( not ( = ?auto_417114 ?auto_417123 ) ) ( not ( = ?auto_417115 ?auto_417116 ) ) ( not ( = ?auto_417115 ?auto_417117 ) ) ( not ( = ?auto_417115 ?auto_417118 ) ) ( not ( = ?auto_417115 ?auto_417119 ) ) ( not ( = ?auto_417115 ?auto_417120 ) ) ( not ( = ?auto_417115 ?auto_417121 ) ) ( not ( = ?auto_417115 ?auto_417122 ) ) ( not ( = ?auto_417115 ?auto_417123 ) ) ( not ( = ?auto_417116 ?auto_417117 ) ) ( not ( = ?auto_417116 ?auto_417118 ) ) ( not ( = ?auto_417116 ?auto_417119 ) ) ( not ( = ?auto_417116 ?auto_417120 ) ) ( not ( = ?auto_417116 ?auto_417121 ) ) ( not ( = ?auto_417116 ?auto_417122 ) ) ( not ( = ?auto_417116 ?auto_417123 ) ) ( not ( = ?auto_417117 ?auto_417118 ) ) ( not ( = ?auto_417117 ?auto_417119 ) ) ( not ( = ?auto_417117 ?auto_417120 ) ) ( not ( = ?auto_417117 ?auto_417121 ) ) ( not ( = ?auto_417117 ?auto_417122 ) ) ( not ( = ?auto_417117 ?auto_417123 ) ) ( not ( = ?auto_417118 ?auto_417119 ) ) ( not ( = ?auto_417118 ?auto_417120 ) ) ( not ( = ?auto_417118 ?auto_417121 ) ) ( not ( = ?auto_417118 ?auto_417122 ) ) ( not ( = ?auto_417118 ?auto_417123 ) ) ( not ( = ?auto_417119 ?auto_417120 ) ) ( not ( = ?auto_417119 ?auto_417121 ) ) ( not ( = ?auto_417119 ?auto_417122 ) ) ( not ( = ?auto_417119 ?auto_417123 ) ) ( not ( = ?auto_417120 ?auto_417121 ) ) ( not ( = ?auto_417120 ?auto_417122 ) ) ( not ( = ?auto_417120 ?auto_417123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417121 ?auto_417122 ?auto_417123 )
      ( MAKE-9CRATE-VERIFY ?auto_417114 ?auto_417115 ?auto_417116 ?auto_417117 ?auto_417118 ?auto_417119 ?auto_417120 ?auto_417121 ?auto_417122 ?auto_417123 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417213 - SURFACE
      ?auto_417214 - SURFACE
      ?auto_417215 - SURFACE
      ?auto_417216 - SURFACE
      ?auto_417217 - SURFACE
      ?auto_417218 - SURFACE
      ?auto_417219 - SURFACE
      ?auto_417220 - SURFACE
      ?auto_417221 - SURFACE
      ?auto_417222 - SURFACE
    )
    :vars
    (
      ?auto_417227 - HOIST
      ?auto_417225 - PLACE
      ?auto_417224 - TRUCK
      ?auto_417226 - PLACE
      ?auto_417223 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_417227 ?auto_417225 ) ( SURFACE-AT ?auto_417221 ?auto_417225 ) ( CLEAR ?auto_417221 ) ( IS-CRATE ?auto_417222 ) ( not ( = ?auto_417221 ?auto_417222 ) ) ( AVAILABLE ?auto_417227 ) ( ON ?auto_417221 ?auto_417220 ) ( not ( = ?auto_417220 ?auto_417221 ) ) ( not ( = ?auto_417220 ?auto_417222 ) ) ( TRUCK-AT ?auto_417224 ?auto_417226 ) ( not ( = ?auto_417226 ?auto_417225 ) ) ( HOIST-AT ?auto_417223 ?auto_417226 ) ( LIFTING ?auto_417223 ?auto_417222 ) ( not ( = ?auto_417227 ?auto_417223 ) ) ( ON ?auto_417214 ?auto_417213 ) ( ON ?auto_417215 ?auto_417214 ) ( ON ?auto_417216 ?auto_417215 ) ( ON ?auto_417217 ?auto_417216 ) ( ON ?auto_417218 ?auto_417217 ) ( ON ?auto_417219 ?auto_417218 ) ( ON ?auto_417220 ?auto_417219 ) ( not ( = ?auto_417213 ?auto_417214 ) ) ( not ( = ?auto_417213 ?auto_417215 ) ) ( not ( = ?auto_417213 ?auto_417216 ) ) ( not ( = ?auto_417213 ?auto_417217 ) ) ( not ( = ?auto_417213 ?auto_417218 ) ) ( not ( = ?auto_417213 ?auto_417219 ) ) ( not ( = ?auto_417213 ?auto_417220 ) ) ( not ( = ?auto_417213 ?auto_417221 ) ) ( not ( = ?auto_417213 ?auto_417222 ) ) ( not ( = ?auto_417214 ?auto_417215 ) ) ( not ( = ?auto_417214 ?auto_417216 ) ) ( not ( = ?auto_417214 ?auto_417217 ) ) ( not ( = ?auto_417214 ?auto_417218 ) ) ( not ( = ?auto_417214 ?auto_417219 ) ) ( not ( = ?auto_417214 ?auto_417220 ) ) ( not ( = ?auto_417214 ?auto_417221 ) ) ( not ( = ?auto_417214 ?auto_417222 ) ) ( not ( = ?auto_417215 ?auto_417216 ) ) ( not ( = ?auto_417215 ?auto_417217 ) ) ( not ( = ?auto_417215 ?auto_417218 ) ) ( not ( = ?auto_417215 ?auto_417219 ) ) ( not ( = ?auto_417215 ?auto_417220 ) ) ( not ( = ?auto_417215 ?auto_417221 ) ) ( not ( = ?auto_417215 ?auto_417222 ) ) ( not ( = ?auto_417216 ?auto_417217 ) ) ( not ( = ?auto_417216 ?auto_417218 ) ) ( not ( = ?auto_417216 ?auto_417219 ) ) ( not ( = ?auto_417216 ?auto_417220 ) ) ( not ( = ?auto_417216 ?auto_417221 ) ) ( not ( = ?auto_417216 ?auto_417222 ) ) ( not ( = ?auto_417217 ?auto_417218 ) ) ( not ( = ?auto_417217 ?auto_417219 ) ) ( not ( = ?auto_417217 ?auto_417220 ) ) ( not ( = ?auto_417217 ?auto_417221 ) ) ( not ( = ?auto_417217 ?auto_417222 ) ) ( not ( = ?auto_417218 ?auto_417219 ) ) ( not ( = ?auto_417218 ?auto_417220 ) ) ( not ( = ?auto_417218 ?auto_417221 ) ) ( not ( = ?auto_417218 ?auto_417222 ) ) ( not ( = ?auto_417219 ?auto_417220 ) ) ( not ( = ?auto_417219 ?auto_417221 ) ) ( not ( = ?auto_417219 ?auto_417222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417220 ?auto_417221 ?auto_417222 )
      ( MAKE-9CRATE-VERIFY ?auto_417213 ?auto_417214 ?auto_417215 ?auto_417216 ?auto_417217 ?auto_417218 ?auto_417219 ?auto_417220 ?auto_417221 ?auto_417222 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417321 - SURFACE
      ?auto_417322 - SURFACE
      ?auto_417323 - SURFACE
      ?auto_417324 - SURFACE
      ?auto_417325 - SURFACE
      ?auto_417326 - SURFACE
      ?auto_417327 - SURFACE
      ?auto_417328 - SURFACE
      ?auto_417329 - SURFACE
      ?auto_417330 - SURFACE
    )
    :vars
    (
      ?auto_417335 - HOIST
      ?auto_417336 - PLACE
      ?auto_417334 - TRUCK
      ?auto_417332 - PLACE
      ?auto_417331 - HOIST
      ?auto_417333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_417335 ?auto_417336 ) ( SURFACE-AT ?auto_417329 ?auto_417336 ) ( CLEAR ?auto_417329 ) ( IS-CRATE ?auto_417330 ) ( not ( = ?auto_417329 ?auto_417330 ) ) ( AVAILABLE ?auto_417335 ) ( ON ?auto_417329 ?auto_417328 ) ( not ( = ?auto_417328 ?auto_417329 ) ) ( not ( = ?auto_417328 ?auto_417330 ) ) ( TRUCK-AT ?auto_417334 ?auto_417332 ) ( not ( = ?auto_417332 ?auto_417336 ) ) ( HOIST-AT ?auto_417331 ?auto_417332 ) ( not ( = ?auto_417335 ?auto_417331 ) ) ( AVAILABLE ?auto_417331 ) ( SURFACE-AT ?auto_417330 ?auto_417332 ) ( ON ?auto_417330 ?auto_417333 ) ( CLEAR ?auto_417330 ) ( not ( = ?auto_417329 ?auto_417333 ) ) ( not ( = ?auto_417330 ?auto_417333 ) ) ( not ( = ?auto_417328 ?auto_417333 ) ) ( ON ?auto_417322 ?auto_417321 ) ( ON ?auto_417323 ?auto_417322 ) ( ON ?auto_417324 ?auto_417323 ) ( ON ?auto_417325 ?auto_417324 ) ( ON ?auto_417326 ?auto_417325 ) ( ON ?auto_417327 ?auto_417326 ) ( ON ?auto_417328 ?auto_417327 ) ( not ( = ?auto_417321 ?auto_417322 ) ) ( not ( = ?auto_417321 ?auto_417323 ) ) ( not ( = ?auto_417321 ?auto_417324 ) ) ( not ( = ?auto_417321 ?auto_417325 ) ) ( not ( = ?auto_417321 ?auto_417326 ) ) ( not ( = ?auto_417321 ?auto_417327 ) ) ( not ( = ?auto_417321 ?auto_417328 ) ) ( not ( = ?auto_417321 ?auto_417329 ) ) ( not ( = ?auto_417321 ?auto_417330 ) ) ( not ( = ?auto_417321 ?auto_417333 ) ) ( not ( = ?auto_417322 ?auto_417323 ) ) ( not ( = ?auto_417322 ?auto_417324 ) ) ( not ( = ?auto_417322 ?auto_417325 ) ) ( not ( = ?auto_417322 ?auto_417326 ) ) ( not ( = ?auto_417322 ?auto_417327 ) ) ( not ( = ?auto_417322 ?auto_417328 ) ) ( not ( = ?auto_417322 ?auto_417329 ) ) ( not ( = ?auto_417322 ?auto_417330 ) ) ( not ( = ?auto_417322 ?auto_417333 ) ) ( not ( = ?auto_417323 ?auto_417324 ) ) ( not ( = ?auto_417323 ?auto_417325 ) ) ( not ( = ?auto_417323 ?auto_417326 ) ) ( not ( = ?auto_417323 ?auto_417327 ) ) ( not ( = ?auto_417323 ?auto_417328 ) ) ( not ( = ?auto_417323 ?auto_417329 ) ) ( not ( = ?auto_417323 ?auto_417330 ) ) ( not ( = ?auto_417323 ?auto_417333 ) ) ( not ( = ?auto_417324 ?auto_417325 ) ) ( not ( = ?auto_417324 ?auto_417326 ) ) ( not ( = ?auto_417324 ?auto_417327 ) ) ( not ( = ?auto_417324 ?auto_417328 ) ) ( not ( = ?auto_417324 ?auto_417329 ) ) ( not ( = ?auto_417324 ?auto_417330 ) ) ( not ( = ?auto_417324 ?auto_417333 ) ) ( not ( = ?auto_417325 ?auto_417326 ) ) ( not ( = ?auto_417325 ?auto_417327 ) ) ( not ( = ?auto_417325 ?auto_417328 ) ) ( not ( = ?auto_417325 ?auto_417329 ) ) ( not ( = ?auto_417325 ?auto_417330 ) ) ( not ( = ?auto_417325 ?auto_417333 ) ) ( not ( = ?auto_417326 ?auto_417327 ) ) ( not ( = ?auto_417326 ?auto_417328 ) ) ( not ( = ?auto_417326 ?auto_417329 ) ) ( not ( = ?auto_417326 ?auto_417330 ) ) ( not ( = ?auto_417326 ?auto_417333 ) ) ( not ( = ?auto_417327 ?auto_417328 ) ) ( not ( = ?auto_417327 ?auto_417329 ) ) ( not ( = ?auto_417327 ?auto_417330 ) ) ( not ( = ?auto_417327 ?auto_417333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417328 ?auto_417329 ?auto_417330 )
      ( MAKE-9CRATE-VERIFY ?auto_417321 ?auto_417322 ?auto_417323 ?auto_417324 ?auto_417325 ?auto_417326 ?auto_417327 ?auto_417328 ?auto_417329 ?auto_417330 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417430 - SURFACE
      ?auto_417431 - SURFACE
      ?auto_417432 - SURFACE
      ?auto_417433 - SURFACE
      ?auto_417434 - SURFACE
      ?auto_417435 - SURFACE
      ?auto_417436 - SURFACE
      ?auto_417437 - SURFACE
      ?auto_417438 - SURFACE
      ?auto_417439 - SURFACE
    )
    :vars
    (
      ?auto_417443 - HOIST
      ?auto_417445 - PLACE
      ?auto_417441 - PLACE
      ?auto_417444 - HOIST
      ?auto_417440 - SURFACE
      ?auto_417442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417443 ?auto_417445 ) ( SURFACE-AT ?auto_417438 ?auto_417445 ) ( CLEAR ?auto_417438 ) ( IS-CRATE ?auto_417439 ) ( not ( = ?auto_417438 ?auto_417439 ) ) ( AVAILABLE ?auto_417443 ) ( ON ?auto_417438 ?auto_417437 ) ( not ( = ?auto_417437 ?auto_417438 ) ) ( not ( = ?auto_417437 ?auto_417439 ) ) ( not ( = ?auto_417441 ?auto_417445 ) ) ( HOIST-AT ?auto_417444 ?auto_417441 ) ( not ( = ?auto_417443 ?auto_417444 ) ) ( AVAILABLE ?auto_417444 ) ( SURFACE-AT ?auto_417439 ?auto_417441 ) ( ON ?auto_417439 ?auto_417440 ) ( CLEAR ?auto_417439 ) ( not ( = ?auto_417438 ?auto_417440 ) ) ( not ( = ?auto_417439 ?auto_417440 ) ) ( not ( = ?auto_417437 ?auto_417440 ) ) ( TRUCK-AT ?auto_417442 ?auto_417445 ) ( ON ?auto_417431 ?auto_417430 ) ( ON ?auto_417432 ?auto_417431 ) ( ON ?auto_417433 ?auto_417432 ) ( ON ?auto_417434 ?auto_417433 ) ( ON ?auto_417435 ?auto_417434 ) ( ON ?auto_417436 ?auto_417435 ) ( ON ?auto_417437 ?auto_417436 ) ( not ( = ?auto_417430 ?auto_417431 ) ) ( not ( = ?auto_417430 ?auto_417432 ) ) ( not ( = ?auto_417430 ?auto_417433 ) ) ( not ( = ?auto_417430 ?auto_417434 ) ) ( not ( = ?auto_417430 ?auto_417435 ) ) ( not ( = ?auto_417430 ?auto_417436 ) ) ( not ( = ?auto_417430 ?auto_417437 ) ) ( not ( = ?auto_417430 ?auto_417438 ) ) ( not ( = ?auto_417430 ?auto_417439 ) ) ( not ( = ?auto_417430 ?auto_417440 ) ) ( not ( = ?auto_417431 ?auto_417432 ) ) ( not ( = ?auto_417431 ?auto_417433 ) ) ( not ( = ?auto_417431 ?auto_417434 ) ) ( not ( = ?auto_417431 ?auto_417435 ) ) ( not ( = ?auto_417431 ?auto_417436 ) ) ( not ( = ?auto_417431 ?auto_417437 ) ) ( not ( = ?auto_417431 ?auto_417438 ) ) ( not ( = ?auto_417431 ?auto_417439 ) ) ( not ( = ?auto_417431 ?auto_417440 ) ) ( not ( = ?auto_417432 ?auto_417433 ) ) ( not ( = ?auto_417432 ?auto_417434 ) ) ( not ( = ?auto_417432 ?auto_417435 ) ) ( not ( = ?auto_417432 ?auto_417436 ) ) ( not ( = ?auto_417432 ?auto_417437 ) ) ( not ( = ?auto_417432 ?auto_417438 ) ) ( not ( = ?auto_417432 ?auto_417439 ) ) ( not ( = ?auto_417432 ?auto_417440 ) ) ( not ( = ?auto_417433 ?auto_417434 ) ) ( not ( = ?auto_417433 ?auto_417435 ) ) ( not ( = ?auto_417433 ?auto_417436 ) ) ( not ( = ?auto_417433 ?auto_417437 ) ) ( not ( = ?auto_417433 ?auto_417438 ) ) ( not ( = ?auto_417433 ?auto_417439 ) ) ( not ( = ?auto_417433 ?auto_417440 ) ) ( not ( = ?auto_417434 ?auto_417435 ) ) ( not ( = ?auto_417434 ?auto_417436 ) ) ( not ( = ?auto_417434 ?auto_417437 ) ) ( not ( = ?auto_417434 ?auto_417438 ) ) ( not ( = ?auto_417434 ?auto_417439 ) ) ( not ( = ?auto_417434 ?auto_417440 ) ) ( not ( = ?auto_417435 ?auto_417436 ) ) ( not ( = ?auto_417435 ?auto_417437 ) ) ( not ( = ?auto_417435 ?auto_417438 ) ) ( not ( = ?auto_417435 ?auto_417439 ) ) ( not ( = ?auto_417435 ?auto_417440 ) ) ( not ( = ?auto_417436 ?auto_417437 ) ) ( not ( = ?auto_417436 ?auto_417438 ) ) ( not ( = ?auto_417436 ?auto_417439 ) ) ( not ( = ?auto_417436 ?auto_417440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417437 ?auto_417438 ?auto_417439 )
      ( MAKE-9CRATE-VERIFY ?auto_417430 ?auto_417431 ?auto_417432 ?auto_417433 ?auto_417434 ?auto_417435 ?auto_417436 ?auto_417437 ?auto_417438 ?auto_417439 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417539 - SURFACE
      ?auto_417540 - SURFACE
      ?auto_417541 - SURFACE
      ?auto_417542 - SURFACE
      ?auto_417543 - SURFACE
      ?auto_417544 - SURFACE
      ?auto_417545 - SURFACE
      ?auto_417546 - SURFACE
      ?auto_417547 - SURFACE
      ?auto_417548 - SURFACE
    )
    :vars
    (
      ?auto_417553 - HOIST
      ?auto_417550 - PLACE
      ?auto_417552 - PLACE
      ?auto_417554 - HOIST
      ?auto_417549 - SURFACE
      ?auto_417551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417553 ?auto_417550 ) ( IS-CRATE ?auto_417548 ) ( not ( = ?auto_417547 ?auto_417548 ) ) ( not ( = ?auto_417546 ?auto_417547 ) ) ( not ( = ?auto_417546 ?auto_417548 ) ) ( not ( = ?auto_417552 ?auto_417550 ) ) ( HOIST-AT ?auto_417554 ?auto_417552 ) ( not ( = ?auto_417553 ?auto_417554 ) ) ( AVAILABLE ?auto_417554 ) ( SURFACE-AT ?auto_417548 ?auto_417552 ) ( ON ?auto_417548 ?auto_417549 ) ( CLEAR ?auto_417548 ) ( not ( = ?auto_417547 ?auto_417549 ) ) ( not ( = ?auto_417548 ?auto_417549 ) ) ( not ( = ?auto_417546 ?auto_417549 ) ) ( TRUCK-AT ?auto_417551 ?auto_417550 ) ( SURFACE-AT ?auto_417546 ?auto_417550 ) ( CLEAR ?auto_417546 ) ( LIFTING ?auto_417553 ?auto_417547 ) ( IS-CRATE ?auto_417547 ) ( ON ?auto_417540 ?auto_417539 ) ( ON ?auto_417541 ?auto_417540 ) ( ON ?auto_417542 ?auto_417541 ) ( ON ?auto_417543 ?auto_417542 ) ( ON ?auto_417544 ?auto_417543 ) ( ON ?auto_417545 ?auto_417544 ) ( ON ?auto_417546 ?auto_417545 ) ( not ( = ?auto_417539 ?auto_417540 ) ) ( not ( = ?auto_417539 ?auto_417541 ) ) ( not ( = ?auto_417539 ?auto_417542 ) ) ( not ( = ?auto_417539 ?auto_417543 ) ) ( not ( = ?auto_417539 ?auto_417544 ) ) ( not ( = ?auto_417539 ?auto_417545 ) ) ( not ( = ?auto_417539 ?auto_417546 ) ) ( not ( = ?auto_417539 ?auto_417547 ) ) ( not ( = ?auto_417539 ?auto_417548 ) ) ( not ( = ?auto_417539 ?auto_417549 ) ) ( not ( = ?auto_417540 ?auto_417541 ) ) ( not ( = ?auto_417540 ?auto_417542 ) ) ( not ( = ?auto_417540 ?auto_417543 ) ) ( not ( = ?auto_417540 ?auto_417544 ) ) ( not ( = ?auto_417540 ?auto_417545 ) ) ( not ( = ?auto_417540 ?auto_417546 ) ) ( not ( = ?auto_417540 ?auto_417547 ) ) ( not ( = ?auto_417540 ?auto_417548 ) ) ( not ( = ?auto_417540 ?auto_417549 ) ) ( not ( = ?auto_417541 ?auto_417542 ) ) ( not ( = ?auto_417541 ?auto_417543 ) ) ( not ( = ?auto_417541 ?auto_417544 ) ) ( not ( = ?auto_417541 ?auto_417545 ) ) ( not ( = ?auto_417541 ?auto_417546 ) ) ( not ( = ?auto_417541 ?auto_417547 ) ) ( not ( = ?auto_417541 ?auto_417548 ) ) ( not ( = ?auto_417541 ?auto_417549 ) ) ( not ( = ?auto_417542 ?auto_417543 ) ) ( not ( = ?auto_417542 ?auto_417544 ) ) ( not ( = ?auto_417542 ?auto_417545 ) ) ( not ( = ?auto_417542 ?auto_417546 ) ) ( not ( = ?auto_417542 ?auto_417547 ) ) ( not ( = ?auto_417542 ?auto_417548 ) ) ( not ( = ?auto_417542 ?auto_417549 ) ) ( not ( = ?auto_417543 ?auto_417544 ) ) ( not ( = ?auto_417543 ?auto_417545 ) ) ( not ( = ?auto_417543 ?auto_417546 ) ) ( not ( = ?auto_417543 ?auto_417547 ) ) ( not ( = ?auto_417543 ?auto_417548 ) ) ( not ( = ?auto_417543 ?auto_417549 ) ) ( not ( = ?auto_417544 ?auto_417545 ) ) ( not ( = ?auto_417544 ?auto_417546 ) ) ( not ( = ?auto_417544 ?auto_417547 ) ) ( not ( = ?auto_417544 ?auto_417548 ) ) ( not ( = ?auto_417544 ?auto_417549 ) ) ( not ( = ?auto_417545 ?auto_417546 ) ) ( not ( = ?auto_417545 ?auto_417547 ) ) ( not ( = ?auto_417545 ?auto_417548 ) ) ( not ( = ?auto_417545 ?auto_417549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417546 ?auto_417547 ?auto_417548 )
      ( MAKE-9CRATE-VERIFY ?auto_417539 ?auto_417540 ?auto_417541 ?auto_417542 ?auto_417543 ?auto_417544 ?auto_417545 ?auto_417546 ?auto_417547 ?auto_417548 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417648 - SURFACE
      ?auto_417649 - SURFACE
      ?auto_417650 - SURFACE
      ?auto_417651 - SURFACE
      ?auto_417652 - SURFACE
      ?auto_417653 - SURFACE
      ?auto_417654 - SURFACE
      ?auto_417655 - SURFACE
      ?auto_417656 - SURFACE
      ?auto_417657 - SURFACE
    )
    :vars
    (
      ?auto_417658 - HOIST
      ?auto_417661 - PLACE
      ?auto_417659 - PLACE
      ?auto_417660 - HOIST
      ?auto_417663 - SURFACE
      ?auto_417662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417658 ?auto_417661 ) ( IS-CRATE ?auto_417657 ) ( not ( = ?auto_417656 ?auto_417657 ) ) ( not ( = ?auto_417655 ?auto_417656 ) ) ( not ( = ?auto_417655 ?auto_417657 ) ) ( not ( = ?auto_417659 ?auto_417661 ) ) ( HOIST-AT ?auto_417660 ?auto_417659 ) ( not ( = ?auto_417658 ?auto_417660 ) ) ( AVAILABLE ?auto_417660 ) ( SURFACE-AT ?auto_417657 ?auto_417659 ) ( ON ?auto_417657 ?auto_417663 ) ( CLEAR ?auto_417657 ) ( not ( = ?auto_417656 ?auto_417663 ) ) ( not ( = ?auto_417657 ?auto_417663 ) ) ( not ( = ?auto_417655 ?auto_417663 ) ) ( TRUCK-AT ?auto_417662 ?auto_417661 ) ( SURFACE-AT ?auto_417655 ?auto_417661 ) ( CLEAR ?auto_417655 ) ( IS-CRATE ?auto_417656 ) ( AVAILABLE ?auto_417658 ) ( IN ?auto_417656 ?auto_417662 ) ( ON ?auto_417649 ?auto_417648 ) ( ON ?auto_417650 ?auto_417649 ) ( ON ?auto_417651 ?auto_417650 ) ( ON ?auto_417652 ?auto_417651 ) ( ON ?auto_417653 ?auto_417652 ) ( ON ?auto_417654 ?auto_417653 ) ( ON ?auto_417655 ?auto_417654 ) ( not ( = ?auto_417648 ?auto_417649 ) ) ( not ( = ?auto_417648 ?auto_417650 ) ) ( not ( = ?auto_417648 ?auto_417651 ) ) ( not ( = ?auto_417648 ?auto_417652 ) ) ( not ( = ?auto_417648 ?auto_417653 ) ) ( not ( = ?auto_417648 ?auto_417654 ) ) ( not ( = ?auto_417648 ?auto_417655 ) ) ( not ( = ?auto_417648 ?auto_417656 ) ) ( not ( = ?auto_417648 ?auto_417657 ) ) ( not ( = ?auto_417648 ?auto_417663 ) ) ( not ( = ?auto_417649 ?auto_417650 ) ) ( not ( = ?auto_417649 ?auto_417651 ) ) ( not ( = ?auto_417649 ?auto_417652 ) ) ( not ( = ?auto_417649 ?auto_417653 ) ) ( not ( = ?auto_417649 ?auto_417654 ) ) ( not ( = ?auto_417649 ?auto_417655 ) ) ( not ( = ?auto_417649 ?auto_417656 ) ) ( not ( = ?auto_417649 ?auto_417657 ) ) ( not ( = ?auto_417649 ?auto_417663 ) ) ( not ( = ?auto_417650 ?auto_417651 ) ) ( not ( = ?auto_417650 ?auto_417652 ) ) ( not ( = ?auto_417650 ?auto_417653 ) ) ( not ( = ?auto_417650 ?auto_417654 ) ) ( not ( = ?auto_417650 ?auto_417655 ) ) ( not ( = ?auto_417650 ?auto_417656 ) ) ( not ( = ?auto_417650 ?auto_417657 ) ) ( not ( = ?auto_417650 ?auto_417663 ) ) ( not ( = ?auto_417651 ?auto_417652 ) ) ( not ( = ?auto_417651 ?auto_417653 ) ) ( not ( = ?auto_417651 ?auto_417654 ) ) ( not ( = ?auto_417651 ?auto_417655 ) ) ( not ( = ?auto_417651 ?auto_417656 ) ) ( not ( = ?auto_417651 ?auto_417657 ) ) ( not ( = ?auto_417651 ?auto_417663 ) ) ( not ( = ?auto_417652 ?auto_417653 ) ) ( not ( = ?auto_417652 ?auto_417654 ) ) ( not ( = ?auto_417652 ?auto_417655 ) ) ( not ( = ?auto_417652 ?auto_417656 ) ) ( not ( = ?auto_417652 ?auto_417657 ) ) ( not ( = ?auto_417652 ?auto_417663 ) ) ( not ( = ?auto_417653 ?auto_417654 ) ) ( not ( = ?auto_417653 ?auto_417655 ) ) ( not ( = ?auto_417653 ?auto_417656 ) ) ( not ( = ?auto_417653 ?auto_417657 ) ) ( not ( = ?auto_417653 ?auto_417663 ) ) ( not ( = ?auto_417654 ?auto_417655 ) ) ( not ( = ?auto_417654 ?auto_417656 ) ) ( not ( = ?auto_417654 ?auto_417657 ) ) ( not ( = ?auto_417654 ?auto_417663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417655 ?auto_417656 ?auto_417657 )
      ( MAKE-9CRATE-VERIFY ?auto_417648 ?auto_417649 ?auto_417650 ?auto_417651 ?auto_417652 ?auto_417653 ?auto_417654 ?auto_417655 ?auto_417656 ?auto_417657 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423195 - SURFACE
      ?auto_423196 - SURFACE
      ?auto_423197 - SURFACE
      ?auto_423198 - SURFACE
      ?auto_423199 - SURFACE
      ?auto_423200 - SURFACE
      ?auto_423201 - SURFACE
      ?auto_423202 - SURFACE
      ?auto_423203 - SURFACE
      ?auto_423204 - SURFACE
      ?auto_423205 - SURFACE
    )
    :vars
    (
      ?auto_423207 - HOIST
      ?auto_423206 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_423207 ?auto_423206 ) ( SURFACE-AT ?auto_423204 ?auto_423206 ) ( CLEAR ?auto_423204 ) ( LIFTING ?auto_423207 ?auto_423205 ) ( IS-CRATE ?auto_423205 ) ( not ( = ?auto_423204 ?auto_423205 ) ) ( ON ?auto_423196 ?auto_423195 ) ( ON ?auto_423197 ?auto_423196 ) ( ON ?auto_423198 ?auto_423197 ) ( ON ?auto_423199 ?auto_423198 ) ( ON ?auto_423200 ?auto_423199 ) ( ON ?auto_423201 ?auto_423200 ) ( ON ?auto_423202 ?auto_423201 ) ( ON ?auto_423203 ?auto_423202 ) ( ON ?auto_423204 ?auto_423203 ) ( not ( = ?auto_423195 ?auto_423196 ) ) ( not ( = ?auto_423195 ?auto_423197 ) ) ( not ( = ?auto_423195 ?auto_423198 ) ) ( not ( = ?auto_423195 ?auto_423199 ) ) ( not ( = ?auto_423195 ?auto_423200 ) ) ( not ( = ?auto_423195 ?auto_423201 ) ) ( not ( = ?auto_423195 ?auto_423202 ) ) ( not ( = ?auto_423195 ?auto_423203 ) ) ( not ( = ?auto_423195 ?auto_423204 ) ) ( not ( = ?auto_423195 ?auto_423205 ) ) ( not ( = ?auto_423196 ?auto_423197 ) ) ( not ( = ?auto_423196 ?auto_423198 ) ) ( not ( = ?auto_423196 ?auto_423199 ) ) ( not ( = ?auto_423196 ?auto_423200 ) ) ( not ( = ?auto_423196 ?auto_423201 ) ) ( not ( = ?auto_423196 ?auto_423202 ) ) ( not ( = ?auto_423196 ?auto_423203 ) ) ( not ( = ?auto_423196 ?auto_423204 ) ) ( not ( = ?auto_423196 ?auto_423205 ) ) ( not ( = ?auto_423197 ?auto_423198 ) ) ( not ( = ?auto_423197 ?auto_423199 ) ) ( not ( = ?auto_423197 ?auto_423200 ) ) ( not ( = ?auto_423197 ?auto_423201 ) ) ( not ( = ?auto_423197 ?auto_423202 ) ) ( not ( = ?auto_423197 ?auto_423203 ) ) ( not ( = ?auto_423197 ?auto_423204 ) ) ( not ( = ?auto_423197 ?auto_423205 ) ) ( not ( = ?auto_423198 ?auto_423199 ) ) ( not ( = ?auto_423198 ?auto_423200 ) ) ( not ( = ?auto_423198 ?auto_423201 ) ) ( not ( = ?auto_423198 ?auto_423202 ) ) ( not ( = ?auto_423198 ?auto_423203 ) ) ( not ( = ?auto_423198 ?auto_423204 ) ) ( not ( = ?auto_423198 ?auto_423205 ) ) ( not ( = ?auto_423199 ?auto_423200 ) ) ( not ( = ?auto_423199 ?auto_423201 ) ) ( not ( = ?auto_423199 ?auto_423202 ) ) ( not ( = ?auto_423199 ?auto_423203 ) ) ( not ( = ?auto_423199 ?auto_423204 ) ) ( not ( = ?auto_423199 ?auto_423205 ) ) ( not ( = ?auto_423200 ?auto_423201 ) ) ( not ( = ?auto_423200 ?auto_423202 ) ) ( not ( = ?auto_423200 ?auto_423203 ) ) ( not ( = ?auto_423200 ?auto_423204 ) ) ( not ( = ?auto_423200 ?auto_423205 ) ) ( not ( = ?auto_423201 ?auto_423202 ) ) ( not ( = ?auto_423201 ?auto_423203 ) ) ( not ( = ?auto_423201 ?auto_423204 ) ) ( not ( = ?auto_423201 ?auto_423205 ) ) ( not ( = ?auto_423202 ?auto_423203 ) ) ( not ( = ?auto_423202 ?auto_423204 ) ) ( not ( = ?auto_423202 ?auto_423205 ) ) ( not ( = ?auto_423203 ?auto_423204 ) ) ( not ( = ?auto_423203 ?auto_423205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_423204 ?auto_423205 )
      ( MAKE-10CRATE-VERIFY ?auto_423195 ?auto_423196 ?auto_423197 ?auto_423198 ?auto_423199 ?auto_423200 ?auto_423201 ?auto_423202 ?auto_423203 ?auto_423204 ?auto_423205 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423289 - SURFACE
      ?auto_423290 - SURFACE
      ?auto_423291 - SURFACE
      ?auto_423292 - SURFACE
      ?auto_423293 - SURFACE
      ?auto_423294 - SURFACE
      ?auto_423295 - SURFACE
      ?auto_423296 - SURFACE
      ?auto_423297 - SURFACE
      ?auto_423298 - SURFACE
      ?auto_423299 - SURFACE
    )
    :vars
    (
      ?auto_423302 - HOIST
      ?auto_423301 - PLACE
      ?auto_423300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_423302 ?auto_423301 ) ( SURFACE-AT ?auto_423298 ?auto_423301 ) ( CLEAR ?auto_423298 ) ( IS-CRATE ?auto_423299 ) ( not ( = ?auto_423298 ?auto_423299 ) ) ( TRUCK-AT ?auto_423300 ?auto_423301 ) ( AVAILABLE ?auto_423302 ) ( IN ?auto_423299 ?auto_423300 ) ( ON ?auto_423298 ?auto_423297 ) ( not ( = ?auto_423297 ?auto_423298 ) ) ( not ( = ?auto_423297 ?auto_423299 ) ) ( ON ?auto_423290 ?auto_423289 ) ( ON ?auto_423291 ?auto_423290 ) ( ON ?auto_423292 ?auto_423291 ) ( ON ?auto_423293 ?auto_423292 ) ( ON ?auto_423294 ?auto_423293 ) ( ON ?auto_423295 ?auto_423294 ) ( ON ?auto_423296 ?auto_423295 ) ( ON ?auto_423297 ?auto_423296 ) ( not ( = ?auto_423289 ?auto_423290 ) ) ( not ( = ?auto_423289 ?auto_423291 ) ) ( not ( = ?auto_423289 ?auto_423292 ) ) ( not ( = ?auto_423289 ?auto_423293 ) ) ( not ( = ?auto_423289 ?auto_423294 ) ) ( not ( = ?auto_423289 ?auto_423295 ) ) ( not ( = ?auto_423289 ?auto_423296 ) ) ( not ( = ?auto_423289 ?auto_423297 ) ) ( not ( = ?auto_423289 ?auto_423298 ) ) ( not ( = ?auto_423289 ?auto_423299 ) ) ( not ( = ?auto_423290 ?auto_423291 ) ) ( not ( = ?auto_423290 ?auto_423292 ) ) ( not ( = ?auto_423290 ?auto_423293 ) ) ( not ( = ?auto_423290 ?auto_423294 ) ) ( not ( = ?auto_423290 ?auto_423295 ) ) ( not ( = ?auto_423290 ?auto_423296 ) ) ( not ( = ?auto_423290 ?auto_423297 ) ) ( not ( = ?auto_423290 ?auto_423298 ) ) ( not ( = ?auto_423290 ?auto_423299 ) ) ( not ( = ?auto_423291 ?auto_423292 ) ) ( not ( = ?auto_423291 ?auto_423293 ) ) ( not ( = ?auto_423291 ?auto_423294 ) ) ( not ( = ?auto_423291 ?auto_423295 ) ) ( not ( = ?auto_423291 ?auto_423296 ) ) ( not ( = ?auto_423291 ?auto_423297 ) ) ( not ( = ?auto_423291 ?auto_423298 ) ) ( not ( = ?auto_423291 ?auto_423299 ) ) ( not ( = ?auto_423292 ?auto_423293 ) ) ( not ( = ?auto_423292 ?auto_423294 ) ) ( not ( = ?auto_423292 ?auto_423295 ) ) ( not ( = ?auto_423292 ?auto_423296 ) ) ( not ( = ?auto_423292 ?auto_423297 ) ) ( not ( = ?auto_423292 ?auto_423298 ) ) ( not ( = ?auto_423292 ?auto_423299 ) ) ( not ( = ?auto_423293 ?auto_423294 ) ) ( not ( = ?auto_423293 ?auto_423295 ) ) ( not ( = ?auto_423293 ?auto_423296 ) ) ( not ( = ?auto_423293 ?auto_423297 ) ) ( not ( = ?auto_423293 ?auto_423298 ) ) ( not ( = ?auto_423293 ?auto_423299 ) ) ( not ( = ?auto_423294 ?auto_423295 ) ) ( not ( = ?auto_423294 ?auto_423296 ) ) ( not ( = ?auto_423294 ?auto_423297 ) ) ( not ( = ?auto_423294 ?auto_423298 ) ) ( not ( = ?auto_423294 ?auto_423299 ) ) ( not ( = ?auto_423295 ?auto_423296 ) ) ( not ( = ?auto_423295 ?auto_423297 ) ) ( not ( = ?auto_423295 ?auto_423298 ) ) ( not ( = ?auto_423295 ?auto_423299 ) ) ( not ( = ?auto_423296 ?auto_423297 ) ) ( not ( = ?auto_423296 ?auto_423298 ) ) ( not ( = ?auto_423296 ?auto_423299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423297 ?auto_423298 ?auto_423299 )
      ( MAKE-10CRATE-VERIFY ?auto_423289 ?auto_423290 ?auto_423291 ?auto_423292 ?auto_423293 ?auto_423294 ?auto_423295 ?auto_423296 ?auto_423297 ?auto_423298 ?auto_423299 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423394 - SURFACE
      ?auto_423395 - SURFACE
      ?auto_423396 - SURFACE
      ?auto_423397 - SURFACE
      ?auto_423398 - SURFACE
      ?auto_423399 - SURFACE
      ?auto_423400 - SURFACE
      ?auto_423401 - SURFACE
      ?auto_423402 - SURFACE
      ?auto_423403 - SURFACE
      ?auto_423404 - SURFACE
    )
    :vars
    (
      ?auto_423408 - HOIST
      ?auto_423405 - PLACE
      ?auto_423407 - TRUCK
      ?auto_423406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_423408 ?auto_423405 ) ( SURFACE-AT ?auto_423403 ?auto_423405 ) ( CLEAR ?auto_423403 ) ( IS-CRATE ?auto_423404 ) ( not ( = ?auto_423403 ?auto_423404 ) ) ( AVAILABLE ?auto_423408 ) ( IN ?auto_423404 ?auto_423407 ) ( ON ?auto_423403 ?auto_423402 ) ( not ( = ?auto_423402 ?auto_423403 ) ) ( not ( = ?auto_423402 ?auto_423404 ) ) ( TRUCK-AT ?auto_423407 ?auto_423406 ) ( not ( = ?auto_423406 ?auto_423405 ) ) ( ON ?auto_423395 ?auto_423394 ) ( ON ?auto_423396 ?auto_423395 ) ( ON ?auto_423397 ?auto_423396 ) ( ON ?auto_423398 ?auto_423397 ) ( ON ?auto_423399 ?auto_423398 ) ( ON ?auto_423400 ?auto_423399 ) ( ON ?auto_423401 ?auto_423400 ) ( ON ?auto_423402 ?auto_423401 ) ( not ( = ?auto_423394 ?auto_423395 ) ) ( not ( = ?auto_423394 ?auto_423396 ) ) ( not ( = ?auto_423394 ?auto_423397 ) ) ( not ( = ?auto_423394 ?auto_423398 ) ) ( not ( = ?auto_423394 ?auto_423399 ) ) ( not ( = ?auto_423394 ?auto_423400 ) ) ( not ( = ?auto_423394 ?auto_423401 ) ) ( not ( = ?auto_423394 ?auto_423402 ) ) ( not ( = ?auto_423394 ?auto_423403 ) ) ( not ( = ?auto_423394 ?auto_423404 ) ) ( not ( = ?auto_423395 ?auto_423396 ) ) ( not ( = ?auto_423395 ?auto_423397 ) ) ( not ( = ?auto_423395 ?auto_423398 ) ) ( not ( = ?auto_423395 ?auto_423399 ) ) ( not ( = ?auto_423395 ?auto_423400 ) ) ( not ( = ?auto_423395 ?auto_423401 ) ) ( not ( = ?auto_423395 ?auto_423402 ) ) ( not ( = ?auto_423395 ?auto_423403 ) ) ( not ( = ?auto_423395 ?auto_423404 ) ) ( not ( = ?auto_423396 ?auto_423397 ) ) ( not ( = ?auto_423396 ?auto_423398 ) ) ( not ( = ?auto_423396 ?auto_423399 ) ) ( not ( = ?auto_423396 ?auto_423400 ) ) ( not ( = ?auto_423396 ?auto_423401 ) ) ( not ( = ?auto_423396 ?auto_423402 ) ) ( not ( = ?auto_423396 ?auto_423403 ) ) ( not ( = ?auto_423396 ?auto_423404 ) ) ( not ( = ?auto_423397 ?auto_423398 ) ) ( not ( = ?auto_423397 ?auto_423399 ) ) ( not ( = ?auto_423397 ?auto_423400 ) ) ( not ( = ?auto_423397 ?auto_423401 ) ) ( not ( = ?auto_423397 ?auto_423402 ) ) ( not ( = ?auto_423397 ?auto_423403 ) ) ( not ( = ?auto_423397 ?auto_423404 ) ) ( not ( = ?auto_423398 ?auto_423399 ) ) ( not ( = ?auto_423398 ?auto_423400 ) ) ( not ( = ?auto_423398 ?auto_423401 ) ) ( not ( = ?auto_423398 ?auto_423402 ) ) ( not ( = ?auto_423398 ?auto_423403 ) ) ( not ( = ?auto_423398 ?auto_423404 ) ) ( not ( = ?auto_423399 ?auto_423400 ) ) ( not ( = ?auto_423399 ?auto_423401 ) ) ( not ( = ?auto_423399 ?auto_423402 ) ) ( not ( = ?auto_423399 ?auto_423403 ) ) ( not ( = ?auto_423399 ?auto_423404 ) ) ( not ( = ?auto_423400 ?auto_423401 ) ) ( not ( = ?auto_423400 ?auto_423402 ) ) ( not ( = ?auto_423400 ?auto_423403 ) ) ( not ( = ?auto_423400 ?auto_423404 ) ) ( not ( = ?auto_423401 ?auto_423402 ) ) ( not ( = ?auto_423401 ?auto_423403 ) ) ( not ( = ?auto_423401 ?auto_423404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423402 ?auto_423403 ?auto_423404 )
      ( MAKE-10CRATE-VERIFY ?auto_423394 ?auto_423395 ?auto_423396 ?auto_423397 ?auto_423398 ?auto_423399 ?auto_423400 ?auto_423401 ?auto_423402 ?auto_423403 ?auto_423404 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423509 - SURFACE
      ?auto_423510 - SURFACE
      ?auto_423511 - SURFACE
      ?auto_423512 - SURFACE
      ?auto_423513 - SURFACE
      ?auto_423514 - SURFACE
      ?auto_423515 - SURFACE
      ?auto_423516 - SURFACE
      ?auto_423517 - SURFACE
      ?auto_423518 - SURFACE
      ?auto_423519 - SURFACE
    )
    :vars
    (
      ?auto_423520 - HOIST
      ?auto_423523 - PLACE
      ?auto_423522 - TRUCK
      ?auto_423524 - PLACE
      ?auto_423521 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_423520 ?auto_423523 ) ( SURFACE-AT ?auto_423518 ?auto_423523 ) ( CLEAR ?auto_423518 ) ( IS-CRATE ?auto_423519 ) ( not ( = ?auto_423518 ?auto_423519 ) ) ( AVAILABLE ?auto_423520 ) ( ON ?auto_423518 ?auto_423517 ) ( not ( = ?auto_423517 ?auto_423518 ) ) ( not ( = ?auto_423517 ?auto_423519 ) ) ( TRUCK-AT ?auto_423522 ?auto_423524 ) ( not ( = ?auto_423524 ?auto_423523 ) ) ( HOIST-AT ?auto_423521 ?auto_423524 ) ( LIFTING ?auto_423521 ?auto_423519 ) ( not ( = ?auto_423520 ?auto_423521 ) ) ( ON ?auto_423510 ?auto_423509 ) ( ON ?auto_423511 ?auto_423510 ) ( ON ?auto_423512 ?auto_423511 ) ( ON ?auto_423513 ?auto_423512 ) ( ON ?auto_423514 ?auto_423513 ) ( ON ?auto_423515 ?auto_423514 ) ( ON ?auto_423516 ?auto_423515 ) ( ON ?auto_423517 ?auto_423516 ) ( not ( = ?auto_423509 ?auto_423510 ) ) ( not ( = ?auto_423509 ?auto_423511 ) ) ( not ( = ?auto_423509 ?auto_423512 ) ) ( not ( = ?auto_423509 ?auto_423513 ) ) ( not ( = ?auto_423509 ?auto_423514 ) ) ( not ( = ?auto_423509 ?auto_423515 ) ) ( not ( = ?auto_423509 ?auto_423516 ) ) ( not ( = ?auto_423509 ?auto_423517 ) ) ( not ( = ?auto_423509 ?auto_423518 ) ) ( not ( = ?auto_423509 ?auto_423519 ) ) ( not ( = ?auto_423510 ?auto_423511 ) ) ( not ( = ?auto_423510 ?auto_423512 ) ) ( not ( = ?auto_423510 ?auto_423513 ) ) ( not ( = ?auto_423510 ?auto_423514 ) ) ( not ( = ?auto_423510 ?auto_423515 ) ) ( not ( = ?auto_423510 ?auto_423516 ) ) ( not ( = ?auto_423510 ?auto_423517 ) ) ( not ( = ?auto_423510 ?auto_423518 ) ) ( not ( = ?auto_423510 ?auto_423519 ) ) ( not ( = ?auto_423511 ?auto_423512 ) ) ( not ( = ?auto_423511 ?auto_423513 ) ) ( not ( = ?auto_423511 ?auto_423514 ) ) ( not ( = ?auto_423511 ?auto_423515 ) ) ( not ( = ?auto_423511 ?auto_423516 ) ) ( not ( = ?auto_423511 ?auto_423517 ) ) ( not ( = ?auto_423511 ?auto_423518 ) ) ( not ( = ?auto_423511 ?auto_423519 ) ) ( not ( = ?auto_423512 ?auto_423513 ) ) ( not ( = ?auto_423512 ?auto_423514 ) ) ( not ( = ?auto_423512 ?auto_423515 ) ) ( not ( = ?auto_423512 ?auto_423516 ) ) ( not ( = ?auto_423512 ?auto_423517 ) ) ( not ( = ?auto_423512 ?auto_423518 ) ) ( not ( = ?auto_423512 ?auto_423519 ) ) ( not ( = ?auto_423513 ?auto_423514 ) ) ( not ( = ?auto_423513 ?auto_423515 ) ) ( not ( = ?auto_423513 ?auto_423516 ) ) ( not ( = ?auto_423513 ?auto_423517 ) ) ( not ( = ?auto_423513 ?auto_423518 ) ) ( not ( = ?auto_423513 ?auto_423519 ) ) ( not ( = ?auto_423514 ?auto_423515 ) ) ( not ( = ?auto_423514 ?auto_423516 ) ) ( not ( = ?auto_423514 ?auto_423517 ) ) ( not ( = ?auto_423514 ?auto_423518 ) ) ( not ( = ?auto_423514 ?auto_423519 ) ) ( not ( = ?auto_423515 ?auto_423516 ) ) ( not ( = ?auto_423515 ?auto_423517 ) ) ( not ( = ?auto_423515 ?auto_423518 ) ) ( not ( = ?auto_423515 ?auto_423519 ) ) ( not ( = ?auto_423516 ?auto_423517 ) ) ( not ( = ?auto_423516 ?auto_423518 ) ) ( not ( = ?auto_423516 ?auto_423519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423517 ?auto_423518 ?auto_423519 )
      ( MAKE-10CRATE-VERIFY ?auto_423509 ?auto_423510 ?auto_423511 ?auto_423512 ?auto_423513 ?auto_423514 ?auto_423515 ?auto_423516 ?auto_423517 ?auto_423518 ?auto_423519 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423634 - SURFACE
      ?auto_423635 - SURFACE
      ?auto_423636 - SURFACE
      ?auto_423637 - SURFACE
      ?auto_423638 - SURFACE
      ?auto_423639 - SURFACE
      ?auto_423640 - SURFACE
      ?auto_423641 - SURFACE
      ?auto_423642 - SURFACE
      ?auto_423643 - SURFACE
      ?auto_423644 - SURFACE
    )
    :vars
    (
      ?auto_423648 - HOIST
      ?auto_423646 - PLACE
      ?auto_423645 - TRUCK
      ?auto_423649 - PLACE
      ?auto_423647 - HOIST
      ?auto_423650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_423648 ?auto_423646 ) ( SURFACE-AT ?auto_423643 ?auto_423646 ) ( CLEAR ?auto_423643 ) ( IS-CRATE ?auto_423644 ) ( not ( = ?auto_423643 ?auto_423644 ) ) ( AVAILABLE ?auto_423648 ) ( ON ?auto_423643 ?auto_423642 ) ( not ( = ?auto_423642 ?auto_423643 ) ) ( not ( = ?auto_423642 ?auto_423644 ) ) ( TRUCK-AT ?auto_423645 ?auto_423649 ) ( not ( = ?auto_423649 ?auto_423646 ) ) ( HOIST-AT ?auto_423647 ?auto_423649 ) ( not ( = ?auto_423648 ?auto_423647 ) ) ( AVAILABLE ?auto_423647 ) ( SURFACE-AT ?auto_423644 ?auto_423649 ) ( ON ?auto_423644 ?auto_423650 ) ( CLEAR ?auto_423644 ) ( not ( = ?auto_423643 ?auto_423650 ) ) ( not ( = ?auto_423644 ?auto_423650 ) ) ( not ( = ?auto_423642 ?auto_423650 ) ) ( ON ?auto_423635 ?auto_423634 ) ( ON ?auto_423636 ?auto_423635 ) ( ON ?auto_423637 ?auto_423636 ) ( ON ?auto_423638 ?auto_423637 ) ( ON ?auto_423639 ?auto_423638 ) ( ON ?auto_423640 ?auto_423639 ) ( ON ?auto_423641 ?auto_423640 ) ( ON ?auto_423642 ?auto_423641 ) ( not ( = ?auto_423634 ?auto_423635 ) ) ( not ( = ?auto_423634 ?auto_423636 ) ) ( not ( = ?auto_423634 ?auto_423637 ) ) ( not ( = ?auto_423634 ?auto_423638 ) ) ( not ( = ?auto_423634 ?auto_423639 ) ) ( not ( = ?auto_423634 ?auto_423640 ) ) ( not ( = ?auto_423634 ?auto_423641 ) ) ( not ( = ?auto_423634 ?auto_423642 ) ) ( not ( = ?auto_423634 ?auto_423643 ) ) ( not ( = ?auto_423634 ?auto_423644 ) ) ( not ( = ?auto_423634 ?auto_423650 ) ) ( not ( = ?auto_423635 ?auto_423636 ) ) ( not ( = ?auto_423635 ?auto_423637 ) ) ( not ( = ?auto_423635 ?auto_423638 ) ) ( not ( = ?auto_423635 ?auto_423639 ) ) ( not ( = ?auto_423635 ?auto_423640 ) ) ( not ( = ?auto_423635 ?auto_423641 ) ) ( not ( = ?auto_423635 ?auto_423642 ) ) ( not ( = ?auto_423635 ?auto_423643 ) ) ( not ( = ?auto_423635 ?auto_423644 ) ) ( not ( = ?auto_423635 ?auto_423650 ) ) ( not ( = ?auto_423636 ?auto_423637 ) ) ( not ( = ?auto_423636 ?auto_423638 ) ) ( not ( = ?auto_423636 ?auto_423639 ) ) ( not ( = ?auto_423636 ?auto_423640 ) ) ( not ( = ?auto_423636 ?auto_423641 ) ) ( not ( = ?auto_423636 ?auto_423642 ) ) ( not ( = ?auto_423636 ?auto_423643 ) ) ( not ( = ?auto_423636 ?auto_423644 ) ) ( not ( = ?auto_423636 ?auto_423650 ) ) ( not ( = ?auto_423637 ?auto_423638 ) ) ( not ( = ?auto_423637 ?auto_423639 ) ) ( not ( = ?auto_423637 ?auto_423640 ) ) ( not ( = ?auto_423637 ?auto_423641 ) ) ( not ( = ?auto_423637 ?auto_423642 ) ) ( not ( = ?auto_423637 ?auto_423643 ) ) ( not ( = ?auto_423637 ?auto_423644 ) ) ( not ( = ?auto_423637 ?auto_423650 ) ) ( not ( = ?auto_423638 ?auto_423639 ) ) ( not ( = ?auto_423638 ?auto_423640 ) ) ( not ( = ?auto_423638 ?auto_423641 ) ) ( not ( = ?auto_423638 ?auto_423642 ) ) ( not ( = ?auto_423638 ?auto_423643 ) ) ( not ( = ?auto_423638 ?auto_423644 ) ) ( not ( = ?auto_423638 ?auto_423650 ) ) ( not ( = ?auto_423639 ?auto_423640 ) ) ( not ( = ?auto_423639 ?auto_423641 ) ) ( not ( = ?auto_423639 ?auto_423642 ) ) ( not ( = ?auto_423639 ?auto_423643 ) ) ( not ( = ?auto_423639 ?auto_423644 ) ) ( not ( = ?auto_423639 ?auto_423650 ) ) ( not ( = ?auto_423640 ?auto_423641 ) ) ( not ( = ?auto_423640 ?auto_423642 ) ) ( not ( = ?auto_423640 ?auto_423643 ) ) ( not ( = ?auto_423640 ?auto_423644 ) ) ( not ( = ?auto_423640 ?auto_423650 ) ) ( not ( = ?auto_423641 ?auto_423642 ) ) ( not ( = ?auto_423641 ?auto_423643 ) ) ( not ( = ?auto_423641 ?auto_423644 ) ) ( not ( = ?auto_423641 ?auto_423650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423642 ?auto_423643 ?auto_423644 )
      ( MAKE-10CRATE-VERIFY ?auto_423634 ?auto_423635 ?auto_423636 ?auto_423637 ?auto_423638 ?auto_423639 ?auto_423640 ?auto_423641 ?auto_423642 ?auto_423643 ?auto_423644 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423760 - SURFACE
      ?auto_423761 - SURFACE
      ?auto_423762 - SURFACE
      ?auto_423763 - SURFACE
      ?auto_423764 - SURFACE
      ?auto_423765 - SURFACE
      ?auto_423766 - SURFACE
      ?auto_423767 - SURFACE
      ?auto_423768 - SURFACE
      ?auto_423769 - SURFACE
      ?auto_423770 - SURFACE
    )
    :vars
    (
      ?auto_423776 - HOIST
      ?auto_423775 - PLACE
      ?auto_423773 - PLACE
      ?auto_423771 - HOIST
      ?auto_423772 - SURFACE
      ?auto_423774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_423776 ?auto_423775 ) ( SURFACE-AT ?auto_423769 ?auto_423775 ) ( CLEAR ?auto_423769 ) ( IS-CRATE ?auto_423770 ) ( not ( = ?auto_423769 ?auto_423770 ) ) ( AVAILABLE ?auto_423776 ) ( ON ?auto_423769 ?auto_423768 ) ( not ( = ?auto_423768 ?auto_423769 ) ) ( not ( = ?auto_423768 ?auto_423770 ) ) ( not ( = ?auto_423773 ?auto_423775 ) ) ( HOIST-AT ?auto_423771 ?auto_423773 ) ( not ( = ?auto_423776 ?auto_423771 ) ) ( AVAILABLE ?auto_423771 ) ( SURFACE-AT ?auto_423770 ?auto_423773 ) ( ON ?auto_423770 ?auto_423772 ) ( CLEAR ?auto_423770 ) ( not ( = ?auto_423769 ?auto_423772 ) ) ( not ( = ?auto_423770 ?auto_423772 ) ) ( not ( = ?auto_423768 ?auto_423772 ) ) ( TRUCK-AT ?auto_423774 ?auto_423775 ) ( ON ?auto_423761 ?auto_423760 ) ( ON ?auto_423762 ?auto_423761 ) ( ON ?auto_423763 ?auto_423762 ) ( ON ?auto_423764 ?auto_423763 ) ( ON ?auto_423765 ?auto_423764 ) ( ON ?auto_423766 ?auto_423765 ) ( ON ?auto_423767 ?auto_423766 ) ( ON ?auto_423768 ?auto_423767 ) ( not ( = ?auto_423760 ?auto_423761 ) ) ( not ( = ?auto_423760 ?auto_423762 ) ) ( not ( = ?auto_423760 ?auto_423763 ) ) ( not ( = ?auto_423760 ?auto_423764 ) ) ( not ( = ?auto_423760 ?auto_423765 ) ) ( not ( = ?auto_423760 ?auto_423766 ) ) ( not ( = ?auto_423760 ?auto_423767 ) ) ( not ( = ?auto_423760 ?auto_423768 ) ) ( not ( = ?auto_423760 ?auto_423769 ) ) ( not ( = ?auto_423760 ?auto_423770 ) ) ( not ( = ?auto_423760 ?auto_423772 ) ) ( not ( = ?auto_423761 ?auto_423762 ) ) ( not ( = ?auto_423761 ?auto_423763 ) ) ( not ( = ?auto_423761 ?auto_423764 ) ) ( not ( = ?auto_423761 ?auto_423765 ) ) ( not ( = ?auto_423761 ?auto_423766 ) ) ( not ( = ?auto_423761 ?auto_423767 ) ) ( not ( = ?auto_423761 ?auto_423768 ) ) ( not ( = ?auto_423761 ?auto_423769 ) ) ( not ( = ?auto_423761 ?auto_423770 ) ) ( not ( = ?auto_423761 ?auto_423772 ) ) ( not ( = ?auto_423762 ?auto_423763 ) ) ( not ( = ?auto_423762 ?auto_423764 ) ) ( not ( = ?auto_423762 ?auto_423765 ) ) ( not ( = ?auto_423762 ?auto_423766 ) ) ( not ( = ?auto_423762 ?auto_423767 ) ) ( not ( = ?auto_423762 ?auto_423768 ) ) ( not ( = ?auto_423762 ?auto_423769 ) ) ( not ( = ?auto_423762 ?auto_423770 ) ) ( not ( = ?auto_423762 ?auto_423772 ) ) ( not ( = ?auto_423763 ?auto_423764 ) ) ( not ( = ?auto_423763 ?auto_423765 ) ) ( not ( = ?auto_423763 ?auto_423766 ) ) ( not ( = ?auto_423763 ?auto_423767 ) ) ( not ( = ?auto_423763 ?auto_423768 ) ) ( not ( = ?auto_423763 ?auto_423769 ) ) ( not ( = ?auto_423763 ?auto_423770 ) ) ( not ( = ?auto_423763 ?auto_423772 ) ) ( not ( = ?auto_423764 ?auto_423765 ) ) ( not ( = ?auto_423764 ?auto_423766 ) ) ( not ( = ?auto_423764 ?auto_423767 ) ) ( not ( = ?auto_423764 ?auto_423768 ) ) ( not ( = ?auto_423764 ?auto_423769 ) ) ( not ( = ?auto_423764 ?auto_423770 ) ) ( not ( = ?auto_423764 ?auto_423772 ) ) ( not ( = ?auto_423765 ?auto_423766 ) ) ( not ( = ?auto_423765 ?auto_423767 ) ) ( not ( = ?auto_423765 ?auto_423768 ) ) ( not ( = ?auto_423765 ?auto_423769 ) ) ( not ( = ?auto_423765 ?auto_423770 ) ) ( not ( = ?auto_423765 ?auto_423772 ) ) ( not ( = ?auto_423766 ?auto_423767 ) ) ( not ( = ?auto_423766 ?auto_423768 ) ) ( not ( = ?auto_423766 ?auto_423769 ) ) ( not ( = ?auto_423766 ?auto_423770 ) ) ( not ( = ?auto_423766 ?auto_423772 ) ) ( not ( = ?auto_423767 ?auto_423768 ) ) ( not ( = ?auto_423767 ?auto_423769 ) ) ( not ( = ?auto_423767 ?auto_423770 ) ) ( not ( = ?auto_423767 ?auto_423772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423768 ?auto_423769 ?auto_423770 )
      ( MAKE-10CRATE-VERIFY ?auto_423760 ?auto_423761 ?auto_423762 ?auto_423763 ?auto_423764 ?auto_423765 ?auto_423766 ?auto_423767 ?auto_423768 ?auto_423769 ?auto_423770 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423886 - SURFACE
      ?auto_423887 - SURFACE
      ?auto_423888 - SURFACE
      ?auto_423889 - SURFACE
      ?auto_423890 - SURFACE
      ?auto_423891 - SURFACE
      ?auto_423892 - SURFACE
      ?auto_423893 - SURFACE
      ?auto_423894 - SURFACE
      ?auto_423895 - SURFACE
      ?auto_423896 - SURFACE
    )
    :vars
    (
      ?auto_423898 - HOIST
      ?auto_423901 - PLACE
      ?auto_423897 - PLACE
      ?auto_423902 - HOIST
      ?auto_423899 - SURFACE
      ?auto_423900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_423898 ?auto_423901 ) ( IS-CRATE ?auto_423896 ) ( not ( = ?auto_423895 ?auto_423896 ) ) ( not ( = ?auto_423894 ?auto_423895 ) ) ( not ( = ?auto_423894 ?auto_423896 ) ) ( not ( = ?auto_423897 ?auto_423901 ) ) ( HOIST-AT ?auto_423902 ?auto_423897 ) ( not ( = ?auto_423898 ?auto_423902 ) ) ( AVAILABLE ?auto_423902 ) ( SURFACE-AT ?auto_423896 ?auto_423897 ) ( ON ?auto_423896 ?auto_423899 ) ( CLEAR ?auto_423896 ) ( not ( = ?auto_423895 ?auto_423899 ) ) ( not ( = ?auto_423896 ?auto_423899 ) ) ( not ( = ?auto_423894 ?auto_423899 ) ) ( TRUCK-AT ?auto_423900 ?auto_423901 ) ( SURFACE-AT ?auto_423894 ?auto_423901 ) ( CLEAR ?auto_423894 ) ( LIFTING ?auto_423898 ?auto_423895 ) ( IS-CRATE ?auto_423895 ) ( ON ?auto_423887 ?auto_423886 ) ( ON ?auto_423888 ?auto_423887 ) ( ON ?auto_423889 ?auto_423888 ) ( ON ?auto_423890 ?auto_423889 ) ( ON ?auto_423891 ?auto_423890 ) ( ON ?auto_423892 ?auto_423891 ) ( ON ?auto_423893 ?auto_423892 ) ( ON ?auto_423894 ?auto_423893 ) ( not ( = ?auto_423886 ?auto_423887 ) ) ( not ( = ?auto_423886 ?auto_423888 ) ) ( not ( = ?auto_423886 ?auto_423889 ) ) ( not ( = ?auto_423886 ?auto_423890 ) ) ( not ( = ?auto_423886 ?auto_423891 ) ) ( not ( = ?auto_423886 ?auto_423892 ) ) ( not ( = ?auto_423886 ?auto_423893 ) ) ( not ( = ?auto_423886 ?auto_423894 ) ) ( not ( = ?auto_423886 ?auto_423895 ) ) ( not ( = ?auto_423886 ?auto_423896 ) ) ( not ( = ?auto_423886 ?auto_423899 ) ) ( not ( = ?auto_423887 ?auto_423888 ) ) ( not ( = ?auto_423887 ?auto_423889 ) ) ( not ( = ?auto_423887 ?auto_423890 ) ) ( not ( = ?auto_423887 ?auto_423891 ) ) ( not ( = ?auto_423887 ?auto_423892 ) ) ( not ( = ?auto_423887 ?auto_423893 ) ) ( not ( = ?auto_423887 ?auto_423894 ) ) ( not ( = ?auto_423887 ?auto_423895 ) ) ( not ( = ?auto_423887 ?auto_423896 ) ) ( not ( = ?auto_423887 ?auto_423899 ) ) ( not ( = ?auto_423888 ?auto_423889 ) ) ( not ( = ?auto_423888 ?auto_423890 ) ) ( not ( = ?auto_423888 ?auto_423891 ) ) ( not ( = ?auto_423888 ?auto_423892 ) ) ( not ( = ?auto_423888 ?auto_423893 ) ) ( not ( = ?auto_423888 ?auto_423894 ) ) ( not ( = ?auto_423888 ?auto_423895 ) ) ( not ( = ?auto_423888 ?auto_423896 ) ) ( not ( = ?auto_423888 ?auto_423899 ) ) ( not ( = ?auto_423889 ?auto_423890 ) ) ( not ( = ?auto_423889 ?auto_423891 ) ) ( not ( = ?auto_423889 ?auto_423892 ) ) ( not ( = ?auto_423889 ?auto_423893 ) ) ( not ( = ?auto_423889 ?auto_423894 ) ) ( not ( = ?auto_423889 ?auto_423895 ) ) ( not ( = ?auto_423889 ?auto_423896 ) ) ( not ( = ?auto_423889 ?auto_423899 ) ) ( not ( = ?auto_423890 ?auto_423891 ) ) ( not ( = ?auto_423890 ?auto_423892 ) ) ( not ( = ?auto_423890 ?auto_423893 ) ) ( not ( = ?auto_423890 ?auto_423894 ) ) ( not ( = ?auto_423890 ?auto_423895 ) ) ( not ( = ?auto_423890 ?auto_423896 ) ) ( not ( = ?auto_423890 ?auto_423899 ) ) ( not ( = ?auto_423891 ?auto_423892 ) ) ( not ( = ?auto_423891 ?auto_423893 ) ) ( not ( = ?auto_423891 ?auto_423894 ) ) ( not ( = ?auto_423891 ?auto_423895 ) ) ( not ( = ?auto_423891 ?auto_423896 ) ) ( not ( = ?auto_423891 ?auto_423899 ) ) ( not ( = ?auto_423892 ?auto_423893 ) ) ( not ( = ?auto_423892 ?auto_423894 ) ) ( not ( = ?auto_423892 ?auto_423895 ) ) ( not ( = ?auto_423892 ?auto_423896 ) ) ( not ( = ?auto_423892 ?auto_423899 ) ) ( not ( = ?auto_423893 ?auto_423894 ) ) ( not ( = ?auto_423893 ?auto_423895 ) ) ( not ( = ?auto_423893 ?auto_423896 ) ) ( not ( = ?auto_423893 ?auto_423899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423894 ?auto_423895 ?auto_423896 )
      ( MAKE-10CRATE-VERIFY ?auto_423886 ?auto_423887 ?auto_423888 ?auto_423889 ?auto_423890 ?auto_423891 ?auto_423892 ?auto_423893 ?auto_423894 ?auto_423895 ?auto_423896 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_424012 - SURFACE
      ?auto_424013 - SURFACE
      ?auto_424014 - SURFACE
      ?auto_424015 - SURFACE
      ?auto_424016 - SURFACE
      ?auto_424017 - SURFACE
      ?auto_424018 - SURFACE
      ?auto_424019 - SURFACE
      ?auto_424020 - SURFACE
      ?auto_424021 - SURFACE
      ?auto_424022 - SURFACE
    )
    :vars
    (
      ?auto_424026 - HOIST
      ?auto_424028 - PLACE
      ?auto_424027 - PLACE
      ?auto_424023 - HOIST
      ?auto_424024 - SURFACE
      ?auto_424025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_424026 ?auto_424028 ) ( IS-CRATE ?auto_424022 ) ( not ( = ?auto_424021 ?auto_424022 ) ) ( not ( = ?auto_424020 ?auto_424021 ) ) ( not ( = ?auto_424020 ?auto_424022 ) ) ( not ( = ?auto_424027 ?auto_424028 ) ) ( HOIST-AT ?auto_424023 ?auto_424027 ) ( not ( = ?auto_424026 ?auto_424023 ) ) ( AVAILABLE ?auto_424023 ) ( SURFACE-AT ?auto_424022 ?auto_424027 ) ( ON ?auto_424022 ?auto_424024 ) ( CLEAR ?auto_424022 ) ( not ( = ?auto_424021 ?auto_424024 ) ) ( not ( = ?auto_424022 ?auto_424024 ) ) ( not ( = ?auto_424020 ?auto_424024 ) ) ( TRUCK-AT ?auto_424025 ?auto_424028 ) ( SURFACE-AT ?auto_424020 ?auto_424028 ) ( CLEAR ?auto_424020 ) ( IS-CRATE ?auto_424021 ) ( AVAILABLE ?auto_424026 ) ( IN ?auto_424021 ?auto_424025 ) ( ON ?auto_424013 ?auto_424012 ) ( ON ?auto_424014 ?auto_424013 ) ( ON ?auto_424015 ?auto_424014 ) ( ON ?auto_424016 ?auto_424015 ) ( ON ?auto_424017 ?auto_424016 ) ( ON ?auto_424018 ?auto_424017 ) ( ON ?auto_424019 ?auto_424018 ) ( ON ?auto_424020 ?auto_424019 ) ( not ( = ?auto_424012 ?auto_424013 ) ) ( not ( = ?auto_424012 ?auto_424014 ) ) ( not ( = ?auto_424012 ?auto_424015 ) ) ( not ( = ?auto_424012 ?auto_424016 ) ) ( not ( = ?auto_424012 ?auto_424017 ) ) ( not ( = ?auto_424012 ?auto_424018 ) ) ( not ( = ?auto_424012 ?auto_424019 ) ) ( not ( = ?auto_424012 ?auto_424020 ) ) ( not ( = ?auto_424012 ?auto_424021 ) ) ( not ( = ?auto_424012 ?auto_424022 ) ) ( not ( = ?auto_424012 ?auto_424024 ) ) ( not ( = ?auto_424013 ?auto_424014 ) ) ( not ( = ?auto_424013 ?auto_424015 ) ) ( not ( = ?auto_424013 ?auto_424016 ) ) ( not ( = ?auto_424013 ?auto_424017 ) ) ( not ( = ?auto_424013 ?auto_424018 ) ) ( not ( = ?auto_424013 ?auto_424019 ) ) ( not ( = ?auto_424013 ?auto_424020 ) ) ( not ( = ?auto_424013 ?auto_424021 ) ) ( not ( = ?auto_424013 ?auto_424022 ) ) ( not ( = ?auto_424013 ?auto_424024 ) ) ( not ( = ?auto_424014 ?auto_424015 ) ) ( not ( = ?auto_424014 ?auto_424016 ) ) ( not ( = ?auto_424014 ?auto_424017 ) ) ( not ( = ?auto_424014 ?auto_424018 ) ) ( not ( = ?auto_424014 ?auto_424019 ) ) ( not ( = ?auto_424014 ?auto_424020 ) ) ( not ( = ?auto_424014 ?auto_424021 ) ) ( not ( = ?auto_424014 ?auto_424022 ) ) ( not ( = ?auto_424014 ?auto_424024 ) ) ( not ( = ?auto_424015 ?auto_424016 ) ) ( not ( = ?auto_424015 ?auto_424017 ) ) ( not ( = ?auto_424015 ?auto_424018 ) ) ( not ( = ?auto_424015 ?auto_424019 ) ) ( not ( = ?auto_424015 ?auto_424020 ) ) ( not ( = ?auto_424015 ?auto_424021 ) ) ( not ( = ?auto_424015 ?auto_424022 ) ) ( not ( = ?auto_424015 ?auto_424024 ) ) ( not ( = ?auto_424016 ?auto_424017 ) ) ( not ( = ?auto_424016 ?auto_424018 ) ) ( not ( = ?auto_424016 ?auto_424019 ) ) ( not ( = ?auto_424016 ?auto_424020 ) ) ( not ( = ?auto_424016 ?auto_424021 ) ) ( not ( = ?auto_424016 ?auto_424022 ) ) ( not ( = ?auto_424016 ?auto_424024 ) ) ( not ( = ?auto_424017 ?auto_424018 ) ) ( not ( = ?auto_424017 ?auto_424019 ) ) ( not ( = ?auto_424017 ?auto_424020 ) ) ( not ( = ?auto_424017 ?auto_424021 ) ) ( not ( = ?auto_424017 ?auto_424022 ) ) ( not ( = ?auto_424017 ?auto_424024 ) ) ( not ( = ?auto_424018 ?auto_424019 ) ) ( not ( = ?auto_424018 ?auto_424020 ) ) ( not ( = ?auto_424018 ?auto_424021 ) ) ( not ( = ?auto_424018 ?auto_424022 ) ) ( not ( = ?auto_424018 ?auto_424024 ) ) ( not ( = ?auto_424019 ?auto_424020 ) ) ( not ( = ?auto_424019 ?auto_424021 ) ) ( not ( = ?auto_424019 ?auto_424022 ) ) ( not ( = ?auto_424019 ?auto_424024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_424020 ?auto_424021 ?auto_424022 )
      ( MAKE-10CRATE-VERIFY ?auto_424012 ?auto_424013 ?auto_424014 ?auto_424015 ?auto_424016 ?auto_424017 ?auto_424018 ?auto_424019 ?auto_424020 ?auto_424021 ?auto_424022 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431212 - SURFACE
      ?auto_431213 - SURFACE
      ?auto_431214 - SURFACE
      ?auto_431215 - SURFACE
      ?auto_431216 - SURFACE
      ?auto_431217 - SURFACE
      ?auto_431218 - SURFACE
      ?auto_431219 - SURFACE
      ?auto_431220 - SURFACE
      ?auto_431221 - SURFACE
      ?auto_431222 - SURFACE
      ?auto_431223 - SURFACE
    )
    :vars
    (
      ?auto_431224 - HOIST
      ?auto_431225 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431224 ?auto_431225 ) ( SURFACE-AT ?auto_431222 ?auto_431225 ) ( CLEAR ?auto_431222 ) ( LIFTING ?auto_431224 ?auto_431223 ) ( IS-CRATE ?auto_431223 ) ( not ( = ?auto_431222 ?auto_431223 ) ) ( ON ?auto_431213 ?auto_431212 ) ( ON ?auto_431214 ?auto_431213 ) ( ON ?auto_431215 ?auto_431214 ) ( ON ?auto_431216 ?auto_431215 ) ( ON ?auto_431217 ?auto_431216 ) ( ON ?auto_431218 ?auto_431217 ) ( ON ?auto_431219 ?auto_431218 ) ( ON ?auto_431220 ?auto_431219 ) ( ON ?auto_431221 ?auto_431220 ) ( ON ?auto_431222 ?auto_431221 ) ( not ( = ?auto_431212 ?auto_431213 ) ) ( not ( = ?auto_431212 ?auto_431214 ) ) ( not ( = ?auto_431212 ?auto_431215 ) ) ( not ( = ?auto_431212 ?auto_431216 ) ) ( not ( = ?auto_431212 ?auto_431217 ) ) ( not ( = ?auto_431212 ?auto_431218 ) ) ( not ( = ?auto_431212 ?auto_431219 ) ) ( not ( = ?auto_431212 ?auto_431220 ) ) ( not ( = ?auto_431212 ?auto_431221 ) ) ( not ( = ?auto_431212 ?auto_431222 ) ) ( not ( = ?auto_431212 ?auto_431223 ) ) ( not ( = ?auto_431213 ?auto_431214 ) ) ( not ( = ?auto_431213 ?auto_431215 ) ) ( not ( = ?auto_431213 ?auto_431216 ) ) ( not ( = ?auto_431213 ?auto_431217 ) ) ( not ( = ?auto_431213 ?auto_431218 ) ) ( not ( = ?auto_431213 ?auto_431219 ) ) ( not ( = ?auto_431213 ?auto_431220 ) ) ( not ( = ?auto_431213 ?auto_431221 ) ) ( not ( = ?auto_431213 ?auto_431222 ) ) ( not ( = ?auto_431213 ?auto_431223 ) ) ( not ( = ?auto_431214 ?auto_431215 ) ) ( not ( = ?auto_431214 ?auto_431216 ) ) ( not ( = ?auto_431214 ?auto_431217 ) ) ( not ( = ?auto_431214 ?auto_431218 ) ) ( not ( = ?auto_431214 ?auto_431219 ) ) ( not ( = ?auto_431214 ?auto_431220 ) ) ( not ( = ?auto_431214 ?auto_431221 ) ) ( not ( = ?auto_431214 ?auto_431222 ) ) ( not ( = ?auto_431214 ?auto_431223 ) ) ( not ( = ?auto_431215 ?auto_431216 ) ) ( not ( = ?auto_431215 ?auto_431217 ) ) ( not ( = ?auto_431215 ?auto_431218 ) ) ( not ( = ?auto_431215 ?auto_431219 ) ) ( not ( = ?auto_431215 ?auto_431220 ) ) ( not ( = ?auto_431215 ?auto_431221 ) ) ( not ( = ?auto_431215 ?auto_431222 ) ) ( not ( = ?auto_431215 ?auto_431223 ) ) ( not ( = ?auto_431216 ?auto_431217 ) ) ( not ( = ?auto_431216 ?auto_431218 ) ) ( not ( = ?auto_431216 ?auto_431219 ) ) ( not ( = ?auto_431216 ?auto_431220 ) ) ( not ( = ?auto_431216 ?auto_431221 ) ) ( not ( = ?auto_431216 ?auto_431222 ) ) ( not ( = ?auto_431216 ?auto_431223 ) ) ( not ( = ?auto_431217 ?auto_431218 ) ) ( not ( = ?auto_431217 ?auto_431219 ) ) ( not ( = ?auto_431217 ?auto_431220 ) ) ( not ( = ?auto_431217 ?auto_431221 ) ) ( not ( = ?auto_431217 ?auto_431222 ) ) ( not ( = ?auto_431217 ?auto_431223 ) ) ( not ( = ?auto_431218 ?auto_431219 ) ) ( not ( = ?auto_431218 ?auto_431220 ) ) ( not ( = ?auto_431218 ?auto_431221 ) ) ( not ( = ?auto_431218 ?auto_431222 ) ) ( not ( = ?auto_431218 ?auto_431223 ) ) ( not ( = ?auto_431219 ?auto_431220 ) ) ( not ( = ?auto_431219 ?auto_431221 ) ) ( not ( = ?auto_431219 ?auto_431222 ) ) ( not ( = ?auto_431219 ?auto_431223 ) ) ( not ( = ?auto_431220 ?auto_431221 ) ) ( not ( = ?auto_431220 ?auto_431222 ) ) ( not ( = ?auto_431220 ?auto_431223 ) ) ( not ( = ?auto_431221 ?auto_431222 ) ) ( not ( = ?auto_431221 ?auto_431223 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_431222 ?auto_431223 )
      ( MAKE-11CRATE-VERIFY ?auto_431212 ?auto_431213 ?auto_431214 ?auto_431215 ?auto_431216 ?auto_431217 ?auto_431218 ?auto_431219 ?auto_431220 ?auto_431221 ?auto_431222 ?auto_431223 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431321 - SURFACE
      ?auto_431322 - SURFACE
      ?auto_431323 - SURFACE
      ?auto_431324 - SURFACE
      ?auto_431325 - SURFACE
      ?auto_431326 - SURFACE
      ?auto_431327 - SURFACE
      ?auto_431328 - SURFACE
      ?auto_431329 - SURFACE
      ?auto_431330 - SURFACE
      ?auto_431331 - SURFACE
      ?auto_431332 - SURFACE
    )
    :vars
    (
      ?auto_431334 - HOIST
      ?auto_431333 - PLACE
      ?auto_431335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_431334 ?auto_431333 ) ( SURFACE-AT ?auto_431331 ?auto_431333 ) ( CLEAR ?auto_431331 ) ( IS-CRATE ?auto_431332 ) ( not ( = ?auto_431331 ?auto_431332 ) ) ( TRUCK-AT ?auto_431335 ?auto_431333 ) ( AVAILABLE ?auto_431334 ) ( IN ?auto_431332 ?auto_431335 ) ( ON ?auto_431331 ?auto_431330 ) ( not ( = ?auto_431330 ?auto_431331 ) ) ( not ( = ?auto_431330 ?auto_431332 ) ) ( ON ?auto_431322 ?auto_431321 ) ( ON ?auto_431323 ?auto_431322 ) ( ON ?auto_431324 ?auto_431323 ) ( ON ?auto_431325 ?auto_431324 ) ( ON ?auto_431326 ?auto_431325 ) ( ON ?auto_431327 ?auto_431326 ) ( ON ?auto_431328 ?auto_431327 ) ( ON ?auto_431329 ?auto_431328 ) ( ON ?auto_431330 ?auto_431329 ) ( not ( = ?auto_431321 ?auto_431322 ) ) ( not ( = ?auto_431321 ?auto_431323 ) ) ( not ( = ?auto_431321 ?auto_431324 ) ) ( not ( = ?auto_431321 ?auto_431325 ) ) ( not ( = ?auto_431321 ?auto_431326 ) ) ( not ( = ?auto_431321 ?auto_431327 ) ) ( not ( = ?auto_431321 ?auto_431328 ) ) ( not ( = ?auto_431321 ?auto_431329 ) ) ( not ( = ?auto_431321 ?auto_431330 ) ) ( not ( = ?auto_431321 ?auto_431331 ) ) ( not ( = ?auto_431321 ?auto_431332 ) ) ( not ( = ?auto_431322 ?auto_431323 ) ) ( not ( = ?auto_431322 ?auto_431324 ) ) ( not ( = ?auto_431322 ?auto_431325 ) ) ( not ( = ?auto_431322 ?auto_431326 ) ) ( not ( = ?auto_431322 ?auto_431327 ) ) ( not ( = ?auto_431322 ?auto_431328 ) ) ( not ( = ?auto_431322 ?auto_431329 ) ) ( not ( = ?auto_431322 ?auto_431330 ) ) ( not ( = ?auto_431322 ?auto_431331 ) ) ( not ( = ?auto_431322 ?auto_431332 ) ) ( not ( = ?auto_431323 ?auto_431324 ) ) ( not ( = ?auto_431323 ?auto_431325 ) ) ( not ( = ?auto_431323 ?auto_431326 ) ) ( not ( = ?auto_431323 ?auto_431327 ) ) ( not ( = ?auto_431323 ?auto_431328 ) ) ( not ( = ?auto_431323 ?auto_431329 ) ) ( not ( = ?auto_431323 ?auto_431330 ) ) ( not ( = ?auto_431323 ?auto_431331 ) ) ( not ( = ?auto_431323 ?auto_431332 ) ) ( not ( = ?auto_431324 ?auto_431325 ) ) ( not ( = ?auto_431324 ?auto_431326 ) ) ( not ( = ?auto_431324 ?auto_431327 ) ) ( not ( = ?auto_431324 ?auto_431328 ) ) ( not ( = ?auto_431324 ?auto_431329 ) ) ( not ( = ?auto_431324 ?auto_431330 ) ) ( not ( = ?auto_431324 ?auto_431331 ) ) ( not ( = ?auto_431324 ?auto_431332 ) ) ( not ( = ?auto_431325 ?auto_431326 ) ) ( not ( = ?auto_431325 ?auto_431327 ) ) ( not ( = ?auto_431325 ?auto_431328 ) ) ( not ( = ?auto_431325 ?auto_431329 ) ) ( not ( = ?auto_431325 ?auto_431330 ) ) ( not ( = ?auto_431325 ?auto_431331 ) ) ( not ( = ?auto_431325 ?auto_431332 ) ) ( not ( = ?auto_431326 ?auto_431327 ) ) ( not ( = ?auto_431326 ?auto_431328 ) ) ( not ( = ?auto_431326 ?auto_431329 ) ) ( not ( = ?auto_431326 ?auto_431330 ) ) ( not ( = ?auto_431326 ?auto_431331 ) ) ( not ( = ?auto_431326 ?auto_431332 ) ) ( not ( = ?auto_431327 ?auto_431328 ) ) ( not ( = ?auto_431327 ?auto_431329 ) ) ( not ( = ?auto_431327 ?auto_431330 ) ) ( not ( = ?auto_431327 ?auto_431331 ) ) ( not ( = ?auto_431327 ?auto_431332 ) ) ( not ( = ?auto_431328 ?auto_431329 ) ) ( not ( = ?auto_431328 ?auto_431330 ) ) ( not ( = ?auto_431328 ?auto_431331 ) ) ( not ( = ?auto_431328 ?auto_431332 ) ) ( not ( = ?auto_431329 ?auto_431330 ) ) ( not ( = ?auto_431329 ?auto_431331 ) ) ( not ( = ?auto_431329 ?auto_431332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431330 ?auto_431331 ?auto_431332 )
      ( MAKE-11CRATE-VERIFY ?auto_431321 ?auto_431322 ?auto_431323 ?auto_431324 ?auto_431325 ?auto_431326 ?auto_431327 ?auto_431328 ?auto_431329 ?auto_431330 ?auto_431331 ?auto_431332 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431442 - SURFACE
      ?auto_431443 - SURFACE
      ?auto_431444 - SURFACE
      ?auto_431445 - SURFACE
      ?auto_431446 - SURFACE
      ?auto_431447 - SURFACE
      ?auto_431448 - SURFACE
      ?auto_431449 - SURFACE
      ?auto_431450 - SURFACE
      ?auto_431451 - SURFACE
      ?auto_431452 - SURFACE
      ?auto_431453 - SURFACE
    )
    :vars
    (
      ?auto_431454 - HOIST
      ?auto_431457 - PLACE
      ?auto_431456 - TRUCK
      ?auto_431455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431454 ?auto_431457 ) ( SURFACE-AT ?auto_431452 ?auto_431457 ) ( CLEAR ?auto_431452 ) ( IS-CRATE ?auto_431453 ) ( not ( = ?auto_431452 ?auto_431453 ) ) ( AVAILABLE ?auto_431454 ) ( IN ?auto_431453 ?auto_431456 ) ( ON ?auto_431452 ?auto_431451 ) ( not ( = ?auto_431451 ?auto_431452 ) ) ( not ( = ?auto_431451 ?auto_431453 ) ) ( TRUCK-AT ?auto_431456 ?auto_431455 ) ( not ( = ?auto_431455 ?auto_431457 ) ) ( ON ?auto_431443 ?auto_431442 ) ( ON ?auto_431444 ?auto_431443 ) ( ON ?auto_431445 ?auto_431444 ) ( ON ?auto_431446 ?auto_431445 ) ( ON ?auto_431447 ?auto_431446 ) ( ON ?auto_431448 ?auto_431447 ) ( ON ?auto_431449 ?auto_431448 ) ( ON ?auto_431450 ?auto_431449 ) ( ON ?auto_431451 ?auto_431450 ) ( not ( = ?auto_431442 ?auto_431443 ) ) ( not ( = ?auto_431442 ?auto_431444 ) ) ( not ( = ?auto_431442 ?auto_431445 ) ) ( not ( = ?auto_431442 ?auto_431446 ) ) ( not ( = ?auto_431442 ?auto_431447 ) ) ( not ( = ?auto_431442 ?auto_431448 ) ) ( not ( = ?auto_431442 ?auto_431449 ) ) ( not ( = ?auto_431442 ?auto_431450 ) ) ( not ( = ?auto_431442 ?auto_431451 ) ) ( not ( = ?auto_431442 ?auto_431452 ) ) ( not ( = ?auto_431442 ?auto_431453 ) ) ( not ( = ?auto_431443 ?auto_431444 ) ) ( not ( = ?auto_431443 ?auto_431445 ) ) ( not ( = ?auto_431443 ?auto_431446 ) ) ( not ( = ?auto_431443 ?auto_431447 ) ) ( not ( = ?auto_431443 ?auto_431448 ) ) ( not ( = ?auto_431443 ?auto_431449 ) ) ( not ( = ?auto_431443 ?auto_431450 ) ) ( not ( = ?auto_431443 ?auto_431451 ) ) ( not ( = ?auto_431443 ?auto_431452 ) ) ( not ( = ?auto_431443 ?auto_431453 ) ) ( not ( = ?auto_431444 ?auto_431445 ) ) ( not ( = ?auto_431444 ?auto_431446 ) ) ( not ( = ?auto_431444 ?auto_431447 ) ) ( not ( = ?auto_431444 ?auto_431448 ) ) ( not ( = ?auto_431444 ?auto_431449 ) ) ( not ( = ?auto_431444 ?auto_431450 ) ) ( not ( = ?auto_431444 ?auto_431451 ) ) ( not ( = ?auto_431444 ?auto_431452 ) ) ( not ( = ?auto_431444 ?auto_431453 ) ) ( not ( = ?auto_431445 ?auto_431446 ) ) ( not ( = ?auto_431445 ?auto_431447 ) ) ( not ( = ?auto_431445 ?auto_431448 ) ) ( not ( = ?auto_431445 ?auto_431449 ) ) ( not ( = ?auto_431445 ?auto_431450 ) ) ( not ( = ?auto_431445 ?auto_431451 ) ) ( not ( = ?auto_431445 ?auto_431452 ) ) ( not ( = ?auto_431445 ?auto_431453 ) ) ( not ( = ?auto_431446 ?auto_431447 ) ) ( not ( = ?auto_431446 ?auto_431448 ) ) ( not ( = ?auto_431446 ?auto_431449 ) ) ( not ( = ?auto_431446 ?auto_431450 ) ) ( not ( = ?auto_431446 ?auto_431451 ) ) ( not ( = ?auto_431446 ?auto_431452 ) ) ( not ( = ?auto_431446 ?auto_431453 ) ) ( not ( = ?auto_431447 ?auto_431448 ) ) ( not ( = ?auto_431447 ?auto_431449 ) ) ( not ( = ?auto_431447 ?auto_431450 ) ) ( not ( = ?auto_431447 ?auto_431451 ) ) ( not ( = ?auto_431447 ?auto_431452 ) ) ( not ( = ?auto_431447 ?auto_431453 ) ) ( not ( = ?auto_431448 ?auto_431449 ) ) ( not ( = ?auto_431448 ?auto_431450 ) ) ( not ( = ?auto_431448 ?auto_431451 ) ) ( not ( = ?auto_431448 ?auto_431452 ) ) ( not ( = ?auto_431448 ?auto_431453 ) ) ( not ( = ?auto_431449 ?auto_431450 ) ) ( not ( = ?auto_431449 ?auto_431451 ) ) ( not ( = ?auto_431449 ?auto_431452 ) ) ( not ( = ?auto_431449 ?auto_431453 ) ) ( not ( = ?auto_431450 ?auto_431451 ) ) ( not ( = ?auto_431450 ?auto_431452 ) ) ( not ( = ?auto_431450 ?auto_431453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431451 ?auto_431452 ?auto_431453 )
      ( MAKE-11CRATE-VERIFY ?auto_431442 ?auto_431443 ?auto_431444 ?auto_431445 ?auto_431446 ?auto_431447 ?auto_431448 ?auto_431449 ?auto_431450 ?auto_431451 ?auto_431452 ?auto_431453 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431574 - SURFACE
      ?auto_431575 - SURFACE
      ?auto_431576 - SURFACE
      ?auto_431577 - SURFACE
      ?auto_431578 - SURFACE
      ?auto_431579 - SURFACE
      ?auto_431580 - SURFACE
      ?auto_431581 - SURFACE
      ?auto_431582 - SURFACE
      ?auto_431583 - SURFACE
      ?auto_431584 - SURFACE
      ?auto_431585 - SURFACE
    )
    :vars
    (
      ?auto_431589 - HOIST
      ?auto_431588 - PLACE
      ?auto_431586 - TRUCK
      ?auto_431587 - PLACE
      ?auto_431590 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_431589 ?auto_431588 ) ( SURFACE-AT ?auto_431584 ?auto_431588 ) ( CLEAR ?auto_431584 ) ( IS-CRATE ?auto_431585 ) ( not ( = ?auto_431584 ?auto_431585 ) ) ( AVAILABLE ?auto_431589 ) ( ON ?auto_431584 ?auto_431583 ) ( not ( = ?auto_431583 ?auto_431584 ) ) ( not ( = ?auto_431583 ?auto_431585 ) ) ( TRUCK-AT ?auto_431586 ?auto_431587 ) ( not ( = ?auto_431587 ?auto_431588 ) ) ( HOIST-AT ?auto_431590 ?auto_431587 ) ( LIFTING ?auto_431590 ?auto_431585 ) ( not ( = ?auto_431589 ?auto_431590 ) ) ( ON ?auto_431575 ?auto_431574 ) ( ON ?auto_431576 ?auto_431575 ) ( ON ?auto_431577 ?auto_431576 ) ( ON ?auto_431578 ?auto_431577 ) ( ON ?auto_431579 ?auto_431578 ) ( ON ?auto_431580 ?auto_431579 ) ( ON ?auto_431581 ?auto_431580 ) ( ON ?auto_431582 ?auto_431581 ) ( ON ?auto_431583 ?auto_431582 ) ( not ( = ?auto_431574 ?auto_431575 ) ) ( not ( = ?auto_431574 ?auto_431576 ) ) ( not ( = ?auto_431574 ?auto_431577 ) ) ( not ( = ?auto_431574 ?auto_431578 ) ) ( not ( = ?auto_431574 ?auto_431579 ) ) ( not ( = ?auto_431574 ?auto_431580 ) ) ( not ( = ?auto_431574 ?auto_431581 ) ) ( not ( = ?auto_431574 ?auto_431582 ) ) ( not ( = ?auto_431574 ?auto_431583 ) ) ( not ( = ?auto_431574 ?auto_431584 ) ) ( not ( = ?auto_431574 ?auto_431585 ) ) ( not ( = ?auto_431575 ?auto_431576 ) ) ( not ( = ?auto_431575 ?auto_431577 ) ) ( not ( = ?auto_431575 ?auto_431578 ) ) ( not ( = ?auto_431575 ?auto_431579 ) ) ( not ( = ?auto_431575 ?auto_431580 ) ) ( not ( = ?auto_431575 ?auto_431581 ) ) ( not ( = ?auto_431575 ?auto_431582 ) ) ( not ( = ?auto_431575 ?auto_431583 ) ) ( not ( = ?auto_431575 ?auto_431584 ) ) ( not ( = ?auto_431575 ?auto_431585 ) ) ( not ( = ?auto_431576 ?auto_431577 ) ) ( not ( = ?auto_431576 ?auto_431578 ) ) ( not ( = ?auto_431576 ?auto_431579 ) ) ( not ( = ?auto_431576 ?auto_431580 ) ) ( not ( = ?auto_431576 ?auto_431581 ) ) ( not ( = ?auto_431576 ?auto_431582 ) ) ( not ( = ?auto_431576 ?auto_431583 ) ) ( not ( = ?auto_431576 ?auto_431584 ) ) ( not ( = ?auto_431576 ?auto_431585 ) ) ( not ( = ?auto_431577 ?auto_431578 ) ) ( not ( = ?auto_431577 ?auto_431579 ) ) ( not ( = ?auto_431577 ?auto_431580 ) ) ( not ( = ?auto_431577 ?auto_431581 ) ) ( not ( = ?auto_431577 ?auto_431582 ) ) ( not ( = ?auto_431577 ?auto_431583 ) ) ( not ( = ?auto_431577 ?auto_431584 ) ) ( not ( = ?auto_431577 ?auto_431585 ) ) ( not ( = ?auto_431578 ?auto_431579 ) ) ( not ( = ?auto_431578 ?auto_431580 ) ) ( not ( = ?auto_431578 ?auto_431581 ) ) ( not ( = ?auto_431578 ?auto_431582 ) ) ( not ( = ?auto_431578 ?auto_431583 ) ) ( not ( = ?auto_431578 ?auto_431584 ) ) ( not ( = ?auto_431578 ?auto_431585 ) ) ( not ( = ?auto_431579 ?auto_431580 ) ) ( not ( = ?auto_431579 ?auto_431581 ) ) ( not ( = ?auto_431579 ?auto_431582 ) ) ( not ( = ?auto_431579 ?auto_431583 ) ) ( not ( = ?auto_431579 ?auto_431584 ) ) ( not ( = ?auto_431579 ?auto_431585 ) ) ( not ( = ?auto_431580 ?auto_431581 ) ) ( not ( = ?auto_431580 ?auto_431582 ) ) ( not ( = ?auto_431580 ?auto_431583 ) ) ( not ( = ?auto_431580 ?auto_431584 ) ) ( not ( = ?auto_431580 ?auto_431585 ) ) ( not ( = ?auto_431581 ?auto_431582 ) ) ( not ( = ?auto_431581 ?auto_431583 ) ) ( not ( = ?auto_431581 ?auto_431584 ) ) ( not ( = ?auto_431581 ?auto_431585 ) ) ( not ( = ?auto_431582 ?auto_431583 ) ) ( not ( = ?auto_431582 ?auto_431584 ) ) ( not ( = ?auto_431582 ?auto_431585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431583 ?auto_431584 ?auto_431585 )
      ( MAKE-11CRATE-VERIFY ?auto_431574 ?auto_431575 ?auto_431576 ?auto_431577 ?auto_431578 ?auto_431579 ?auto_431580 ?auto_431581 ?auto_431582 ?auto_431583 ?auto_431584 ?auto_431585 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431717 - SURFACE
      ?auto_431718 - SURFACE
      ?auto_431719 - SURFACE
      ?auto_431720 - SURFACE
      ?auto_431721 - SURFACE
      ?auto_431722 - SURFACE
      ?auto_431723 - SURFACE
      ?auto_431724 - SURFACE
      ?auto_431725 - SURFACE
      ?auto_431726 - SURFACE
      ?auto_431727 - SURFACE
      ?auto_431728 - SURFACE
    )
    :vars
    (
      ?auto_431732 - HOIST
      ?auto_431729 - PLACE
      ?auto_431733 - TRUCK
      ?auto_431730 - PLACE
      ?auto_431731 - HOIST
      ?auto_431734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431732 ?auto_431729 ) ( SURFACE-AT ?auto_431727 ?auto_431729 ) ( CLEAR ?auto_431727 ) ( IS-CRATE ?auto_431728 ) ( not ( = ?auto_431727 ?auto_431728 ) ) ( AVAILABLE ?auto_431732 ) ( ON ?auto_431727 ?auto_431726 ) ( not ( = ?auto_431726 ?auto_431727 ) ) ( not ( = ?auto_431726 ?auto_431728 ) ) ( TRUCK-AT ?auto_431733 ?auto_431730 ) ( not ( = ?auto_431730 ?auto_431729 ) ) ( HOIST-AT ?auto_431731 ?auto_431730 ) ( not ( = ?auto_431732 ?auto_431731 ) ) ( AVAILABLE ?auto_431731 ) ( SURFACE-AT ?auto_431728 ?auto_431730 ) ( ON ?auto_431728 ?auto_431734 ) ( CLEAR ?auto_431728 ) ( not ( = ?auto_431727 ?auto_431734 ) ) ( not ( = ?auto_431728 ?auto_431734 ) ) ( not ( = ?auto_431726 ?auto_431734 ) ) ( ON ?auto_431718 ?auto_431717 ) ( ON ?auto_431719 ?auto_431718 ) ( ON ?auto_431720 ?auto_431719 ) ( ON ?auto_431721 ?auto_431720 ) ( ON ?auto_431722 ?auto_431721 ) ( ON ?auto_431723 ?auto_431722 ) ( ON ?auto_431724 ?auto_431723 ) ( ON ?auto_431725 ?auto_431724 ) ( ON ?auto_431726 ?auto_431725 ) ( not ( = ?auto_431717 ?auto_431718 ) ) ( not ( = ?auto_431717 ?auto_431719 ) ) ( not ( = ?auto_431717 ?auto_431720 ) ) ( not ( = ?auto_431717 ?auto_431721 ) ) ( not ( = ?auto_431717 ?auto_431722 ) ) ( not ( = ?auto_431717 ?auto_431723 ) ) ( not ( = ?auto_431717 ?auto_431724 ) ) ( not ( = ?auto_431717 ?auto_431725 ) ) ( not ( = ?auto_431717 ?auto_431726 ) ) ( not ( = ?auto_431717 ?auto_431727 ) ) ( not ( = ?auto_431717 ?auto_431728 ) ) ( not ( = ?auto_431717 ?auto_431734 ) ) ( not ( = ?auto_431718 ?auto_431719 ) ) ( not ( = ?auto_431718 ?auto_431720 ) ) ( not ( = ?auto_431718 ?auto_431721 ) ) ( not ( = ?auto_431718 ?auto_431722 ) ) ( not ( = ?auto_431718 ?auto_431723 ) ) ( not ( = ?auto_431718 ?auto_431724 ) ) ( not ( = ?auto_431718 ?auto_431725 ) ) ( not ( = ?auto_431718 ?auto_431726 ) ) ( not ( = ?auto_431718 ?auto_431727 ) ) ( not ( = ?auto_431718 ?auto_431728 ) ) ( not ( = ?auto_431718 ?auto_431734 ) ) ( not ( = ?auto_431719 ?auto_431720 ) ) ( not ( = ?auto_431719 ?auto_431721 ) ) ( not ( = ?auto_431719 ?auto_431722 ) ) ( not ( = ?auto_431719 ?auto_431723 ) ) ( not ( = ?auto_431719 ?auto_431724 ) ) ( not ( = ?auto_431719 ?auto_431725 ) ) ( not ( = ?auto_431719 ?auto_431726 ) ) ( not ( = ?auto_431719 ?auto_431727 ) ) ( not ( = ?auto_431719 ?auto_431728 ) ) ( not ( = ?auto_431719 ?auto_431734 ) ) ( not ( = ?auto_431720 ?auto_431721 ) ) ( not ( = ?auto_431720 ?auto_431722 ) ) ( not ( = ?auto_431720 ?auto_431723 ) ) ( not ( = ?auto_431720 ?auto_431724 ) ) ( not ( = ?auto_431720 ?auto_431725 ) ) ( not ( = ?auto_431720 ?auto_431726 ) ) ( not ( = ?auto_431720 ?auto_431727 ) ) ( not ( = ?auto_431720 ?auto_431728 ) ) ( not ( = ?auto_431720 ?auto_431734 ) ) ( not ( = ?auto_431721 ?auto_431722 ) ) ( not ( = ?auto_431721 ?auto_431723 ) ) ( not ( = ?auto_431721 ?auto_431724 ) ) ( not ( = ?auto_431721 ?auto_431725 ) ) ( not ( = ?auto_431721 ?auto_431726 ) ) ( not ( = ?auto_431721 ?auto_431727 ) ) ( not ( = ?auto_431721 ?auto_431728 ) ) ( not ( = ?auto_431721 ?auto_431734 ) ) ( not ( = ?auto_431722 ?auto_431723 ) ) ( not ( = ?auto_431722 ?auto_431724 ) ) ( not ( = ?auto_431722 ?auto_431725 ) ) ( not ( = ?auto_431722 ?auto_431726 ) ) ( not ( = ?auto_431722 ?auto_431727 ) ) ( not ( = ?auto_431722 ?auto_431728 ) ) ( not ( = ?auto_431722 ?auto_431734 ) ) ( not ( = ?auto_431723 ?auto_431724 ) ) ( not ( = ?auto_431723 ?auto_431725 ) ) ( not ( = ?auto_431723 ?auto_431726 ) ) ( not ( = ?auto_431723 ?auto_431727 ) ) ( not ( = ?auto_431723 ?auto_431728 ) ) ( not ( = ?auto_431723 ?auto_431734 ) ) ( not ( = ?auto_431724 ?auto_431725 ) ) ( not ( = ?auto_431724 ?auto_431726 ) ) ( not ( = ?auto_431724 ?auto_431727 ) ) ( not ( = ?auto_431724 ?auto_431728 ) ) ( not ( = ?auto_431724 ?auto_431734 ) ) ( not ( = ?auto_431725 ?auto_431726 ) ) ( not ( = ?auto_431725 ?auto_431727 ) ) ( not ( = ?auto_431725 ?auto_431728 ) ) ( not ( = ?auto_431725 ?auto_431734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431726 ?auto_431727 ?auto_431728 )
      ( MAKE-11CRATE-VERIFY ?auto_431717 ?auto_431718 ?auto_431719 ?auto_431720 ?auto_431721 ?auto_431722 ?auto_431723 ?auto_431724 ?auto_431725 ?auto_431726 ?auto_431727 ?auto_431728 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431861 - SURFACE
      ?auto_431862 - SURFACE
      ?auto_431863 - SURFACE
      ?auto_431864 - SURFACE
      ?auto_431865 - SURFACE
      ?auto_431866 - SURFACE
      ?auto_431867 - SURFACE
      ?auto_431868 - SURFACE
      ?auto_431869 - SURFACE
      ?auto_431870 - SURFACE
      ?auto_431871 - SURFACE
      ?auto_431872 - SURFACE
    )
    :vars
    (
      ?auto_431874 - HOIST
      ?auto_431873 - PLACE
      ?auto_431878 - PLACE
      ?auto_431876 - HOIST
      ?auto_431877 - SURFACE
      ?auto_431875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_431874 ?auto_431873 ) ( SURFACE-AT ?auto_431871 ?auto_431873 ) ( CLEAR ?auto_431871 ) ( IS-CRATE ?auto_431872 ) ( not ( = ?auto_431871 ?auto_431872 ) ) ( AVAILABLE ?auto_431874 ) ( ON ?auto_431871 ?auto_431870 ) ( not ( = ?auto_431870 ?auto_431871 ) ) ( not ( = ?auto_431870 ?auto_431872 ) ) ( not ( = ?auto_431878 ?auto_431873 ) ) ( HOIST-AT ?auto_431876 ?auto_431878 ) ( not ( = ?auto_431874 ?auto_431876 ) ) ( AVAILABLE ?auto_431876 ) ( SURFACE-AT ?auto_431872 ?auto_431878 ) ( ON ?auto_431872 ?auto_431877 ) ( CLEAR ?auto_431872 ) ( not ( = ?auto_431871 ?auto_431877 ) ) ( not ( = ?auto_431872 ?auto_431877 ) ) ( not ( = ?auto_431870 ?auto_431877 ) ) ( TRUCK-AT ?auto_431875 ?auto_431873 ) ( ON ?auto_431862 ?auto_431861 ) ( ON ?auto_431863 ?auto_431862 ) ( ON ?auto_431864 ?auto_431863 ) ( ON ?auto_431865 ?auto_431864 ) ( ON ?auto_431866 ?auto_431865 ) ( ON ?auto_431867 ?auto_431866 ) ( ON ?auto_431868 ?auto_431867 ) ( ON ?auto_431869 ?auto_431868 ) ( ON ?auto_431870 ?auto_431869 ) ( not ( = ?auto_431861 ?auto_431862 ) ) ( not ( = ?auto_431861 ?auto_431863 ) ) ( not ( = ?auto_431861 ?auto_431864 ) ) ( not ( = ?auto_431861 ?auto_431865 ) ) ( not ( = ?auto_431861 ?auto_431866 ) ) ( not ( = ?auto_431861 ?auto_431867 ) ) ( not ( = ?auto_431861 ?auto_431868 ) ) ( not ( = ?auto_431861 ?auto_431869 ) ) ( not ( = ?auto_431861 ?auto_431870 ) ) ( not ( = ?auto_431861 ?auto_431871 ) ) ( not ( = ?auto_431861 ?auto_431872 ) ) ( not ( = ?auto_431861 ?auto_431877 ) ) ( not ( = ?auto_431862 ?auto_431863 ) ) ( not ( = ?auto_431862 ?auto_431864 ) ) ( not ( = ?auto_431862 ?auto_431865 ) ) ( not ( = ?auto_431862 ?auto_431866 ) ) ( not ( = ?auto_431862 ?auto_431867 ) ) ( not ( = ?auto_431862 ?auto_431868 ) ) ( not ( = ?auto_431862 ?auto_431869 ) ) ( not ( = ?auto_431862 ?auto_431870 ) ) ( not ( = ?auto_431862 ?auto_431871 ) ) ( not ( = ?auto_431862 ?auto_431872 ) ) ( not ( = ?auto_431862 ?auto_431877 ) ) ( not ( = ?auto_431863 ?auto_431864 ) ) ( not ( = ?auto_431863 ?auto_431865 ) ) ( not ( = ?auto_431863 ?auto_431866 ) ) ( not ( = ?auto_431863 ?auto_431867 ) ) ( not ( = ?auto_431863 ?auto_431868 ) ) ( not ( = ?auto_431863 ?auto_431869 ) ) ( not ( = ?auto_431863 ?auto_431870 ) ) ( not ( = ?auto_431863 ?auto_431871 ) ) ( not ( = ?auto_431863 ?auto_431872 ) ) ( not ( = ?auto_431863 ?auto_431877 ) ) ( not ( = ?auto_431864 ?auto_431865 ) ) ( not ( = ?auto_431864 ?auto_431866 ) ) ( not ( = ?auto_431864 ?auto_431867 ) ) ( not ( = ?auto_431864 ?auto_431868 ) ) ( not ( = ?auto_431864 ?auto_431869 ) ) ( not ( = ?auto_431864 ?auto_431870 ) ) ( not ( = ?auto_431864 ?auto_431871 ) ) ( not ( = ?auto_431864 ?auto_431872 ) ) ( not ( = ?auto_431864 ?auto_431877 ) ) ( not ( = ?auto_431865 ?auto_431866 ) ) ( not ( = ?auto_431865 ?auto_431867 ) ) ( not ( = ?auto_431865 ?auto_431868 ) ) ( not ( = ?auto_431865 ?auto_431869 ) ) ( not ( = ?auto_431865 ?auto_431870 ) ) ( not ( = ?auto_431865 ?auto_431871 ) ) ( not ( = ?auto_431865 ?auto_431872 ) ) ( not ( = ?auto_431865 ?auto_431877 ) ) ( not ( = ?auto_431866 ?auto_431867 ) ) ( not ( = ?auto_431866 ?auto_431868 ) ) ( not ( = ?auto_431866 ?auto_431869 ) ) ( not ( = ?auto_431866 ?auto_431870 ) ) ( not ( = ?auto_431866 ?auto_431871 ) ) ( not ( = ?auto_431866 ?auto_431872 ) ) ( not ( = ?auto_431866 ?auto_431877 ) ) ( not ( = ?auto_431867 ?auto_431868 ) ) ( not ( = ?auto_431867 ?auto_431869 ) ) ( not ( = ?auto_431867 ?auto_431870 ) ) ( not ( = ?auto_431867 ?auto_431871 ) ) ( not ( = ?auto_431867 ?auto_431872 ) ) ( not ( = ?auto_431867 ?auto_431877 ) ) ( not ( = ?auto_431868 ?auto_431869 ) ) ( not ( = ?auto_431868 ?auto_431870 ) ) ( not ( = ?auto_431868 ?auto_431871 ) ) ( not ( = ?auto_431868 ?auto_431872 ) ) ( not ( = ?auto_431868 ?auto_431877 ) ) ( not ( = ?auto_431869 ?auto_431870 ) ) ( not ( = ?auto_431869 ?auto_431871 ) ) ( not ( = ?auto_431869 ?auto_431872 ) ) ( not ( = ?auto_431869 ?auto_431877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431870 ?auto_431871 ?auto_431872 )
      ( MAKE-11CRATE-VERIFY ?auto_431861 ?auto_431862 ?auto_431863 ?auto_431864 ?auto_431865 ?auto_431866 ?auto_431867 ?auto_431868 ?auto_431869 ?auto_431870 ?auto_431871 ?auto_431872 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_432005 - SURFACE
      ?auto_432006 - SURFACE
      ?auto_432007 - SURFACE
      ?auto_432008 - SURFACE
      ?auto_432009 - SURFACE
      ?auto_432010 - SURFACE
      ?auto_432011 - SURFACE
      ?auto_432012 - SURFACE
      ?auto_432013 - SURFACE
      ?auto_432014 - SURFACE
      ?auto_432015 - SURFACE
      ?auto_432016 - SURFACE
    )
    :vars
    (
      ?auto_432021 - HOIST
      ?auto_432020 - PLACE
      ?auto_432018 - PLACE
      ?auto_432017 - HOIST
      ?auto_432022 - SURFACE
      ?auto_432019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_432021 ?auto_432020 ) ( IS-CRATE ?auto_432016 ) ( not ( = ?auto_432015 ?auto_432016 ) ) ( not ( = ?auto_432014 ?auto_432015 ) ) ( not ( = ?auto_432014 ?auto_432016 ) ) ( not ( = ?auto_432018 ?auto_432020 ) ) ( HOIST-AT ?auto_432017 ?auto_432018 ) ( not ( = ?auto_432021 ?auto_432017 ) ) ( AVAILABLE ?auto_432017 ) ( SURFACE-AT ?auto_432016 ?auto_432018 ) ( ON ?auto_432016 ?auto_432022 ) ( CLEAR ?auto_432016 ) ( not ( = ?auto_432015 ?auto_432022 ) ) ( not ( = ?auto_432016 ?auto_432022 ) ) ( not ( = ?auto_432014 ?auto_432022 ) ) ( TRUCK-AT ?auto_432019 ?auto_432020 ) ( SURFACE-AT ?auto_432014 ?auto_432020 ) ( CLEAR ?auto_432014 ) ( LIFTING ?auto_432021 ?auto_432015 ) ( IS-CRATE ?auto_432015 ) ( ON ?auto_432006 ?auto_432005 ) ( ON ?auto_432007 ?auto_432006 ) ( ON ?auto_432008 ?auto_432007 ) ( ON ?auto_432009 ?auto_432008 ) ( ON ?auto_432010 ?auto_432009 ) ( ON ?auto_432011 ?auto_432010 ) ( ON ?auto_432012 ?auto_432011 ) ( ON ?auto_432013 ?auto_432012 ) ( ON ?auto_432014 ?auto_432013 ) ( not ( = ?auto_432005 ?auto_432006 ) ) ( not ( = ?auto_432005 ?auto_432007 ) ) ( not ( = ?auto_432005 ?auto_432008 ) ) ( not ( = ?auto_432005 ?auto_432009 ) ) ( not ( = ?auto_432005 ?auto_432010 ) ) ( not ( = ?auto_432005 ?auto_432011 ) ) ( not ( = ?auto_432005 ?auto_432012 ) ) ( not ( = ?auto_432005 ?auto_432013 ) ) ( not ( = ?auto_432005 ?auto_432014 ) ) ( not ( = ?auto_432005 ?auto_432015 ) ) ( not ( = ?auto_432005 ?auto_432016 ) ) ( not ( = ?auto_432005 ?auto_432022 ) ) ( not ( = ?auto_432006 ?auto_432007 ) ) ( not ( = ?auto_432006 ?auto_432008 ) ) ( not ( = ?auto_432006 ?auto_432009 ) ) ( not ( = ?auto_432006 ?auto_432010 ) ) ( not ( = ?auto_432006 ?auto_432011 ) ) ( not ( = ?auto_432006 ?auto_432012 ) ) ( not ( = ?auto_432006 ?auto_432013 ) ) ( not ( = ?auto_432006 ?auto_432014 ) ) ( not ( = ?auto_432006 ?auto_432015 ) ) ( not ( = ?auto_432006 ?auto_432016 ) ) ( not ( = ?auto_432006 ?auto_432022 ) ) ( not ( = ?auto_432007 ?auto_432008 ) ) ( not ( = ?auto_432007 ?auto_432009 ) ) ( not ( = ?auto_432007 ?auto_432010 ) ) ( not ( = ?auto_432007 ?auto_432011 ) ) ( not ( = ?auto_432007 ?auto_432012 ) ) ( not ( = ?auto_432007 ?auto_432013 ) ) ( not ( = ?auto_432007 ?auto_432014 ) ) ( not ( = ?auto_432007 ?auto_432015 ) ) ( not ( = ?auto_432007 ?auto_432016 ) ) ( not ( = ?auto_432007 ?auto_432022 ) ) ( not ( = ?auto_432008 ?auto_432009 ) ) ( not ( = ?auto_432008 ?auto_432010 ) ) ( not ( = ?auto_432008 ?auto_432011 ) ) ( not ( = ?auto_432008 ?auto_432012 ) ) ( not ( = ?auto_432008 ?auto_432013 ) ) ( not ( = ?auto_432008 ?auto_432014 ) ) ( not ( = ?auto_432008 ?auto_432015 ) ) ( not ( = ?auto_432008 ?auto_432016 ) ) ( not ( = ?auto_432008 ?auto_432022 ) ) ( not ( = ?auto_432009 ?auto_432010 ) ) ( not ( = ?auto_432009 ?auto_432011 ) ) ( not ( = ?auto_432009 ?auto_432012 ) ) ( not ( = ?auto_432009 ?auto_432013 ) ) ( not ( = ?auto_432009 ?auto_432014 ) ) ( not ( = ?auto_432009 ?auto_432015 ) ) ( not ( = ?auto_432009 ?auto_432016 ) ) ( not ( = ?auto_432009 ?auto_432022 ) ) ( not ( = ?auto_432010 ?auto_432011 ) ) ( not ( = ?auto_432010 ?auto_432012 ) ) ( not ( = ?auto_432010 ?auto_432013 ) ) ( not ( = ?auto_432010 ?auto_432014 ) ) ( not ( = ?auto_432010 ?auto_432015 ) ) ( not ( = ?auto_432010 ?auto_432016 ) ) ( not ( = ?auto_432010 ?auto_432022 ) ) ( not ( = ?auto_432011 ?auto_432012 ) ) ( not ( = ?auto_432011 ?auto_432013 ) ) ( not ( = ?auto_432011 ?auto_432014 ) ) ( not ( = ?auto_432011 ?auto_432015 ) ) ( not ( = ?auto_432011 ?auto_432016 ) ) ( not ( = ?auto_432011 ?auto_432022 ) ) ( not ( = ?auto_432012 ?auto_432013 ) ) ( not ( = ?auto_432012 ?auto_432014 ) ) ( not ( = ?auto_432012 ?auto_432015 ) ) ( not ( = ?auto_432012 ?auto_432016 ) ) ( not ( = ?auto_432012 ?auto_432022 ) ) ( not ( = ?auto_432013 ?auto_432014 ) ) ( not ( = ?auto_432013 ?auto_432015 ) ) ( not ( = ?auto_432013 ?auto_432016 ) ) ( not ( = ?auto_432013 ?auto_432022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_432014 ?auto_432015 ?auto_432016 )
      ( MAKE-11CRATE-VERIFY ?auto_432005 ?auto_432006 ?auto_432007 ?auto_432008 ?auto_432009 ?auto_432010 ?auto_432011 ?auto_432012 ?auto_432013 ?auto_432014 ?auto_432015 ?auto_432016 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_432149 - SURFACE
      ?auto_432150 - SURFACE
      ?auto_432151 - SURFACE
      ?auto_432152 - SURFACE
      ?auto_432153 - SURFACE
      ?auto_432154 - SURFACE
      ?auto_432155 - SURFACE
      ?auto_432156 - SURFACE
      ?auto_432157 - SURFACE
      ?auto_432158 - SURFACE
      ?auto_432159 - SURFACE
      ?auto_432160 - SURFACE
    )
    :vars
    (
      ?auto_432163 - HOIST
      ?auto_432161 - PLACE
      ?auto_432162 - PLACE
      ?auto_432166 - HOIST
      ?auto_432164 - SURFACE
      ?auto_432165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_432163 ?auto_432161 ) ( IS-CRATE ?auto_432160 ) ( not ( = ?auto_432159 ?auto_432160 ) ) ( not ( = ?auto_432158 ?auto_432159 ) ) ( not ( = ?auto_432158 ?auto_432160 ) ) ( not ( = ?auto_432162 ?auto_432161 ) ) ( HOIST-AT ?auto_432166 ?auto_432162 ) ( not ( = ?auto_432163 ?auto_432166 ) ) ( AVAILABLE ?auto_432166 ) ( SURFACE-AT ?auto_432160 ?auto_432162 ) ( ON ?auto_432160 ?auto_432164 ) ( CLEAR ?auto_432160 ) ( not ( = ?auto_432159 ?auto_432164 ) ) ( not ( = ?auto_432160 ?auto_432164 ) ) ( not ( = ?auto_432158 ?auto_432164 ) ) ( TRUCK-AT ?auto_432165 ?auto_432161 ) ( SURFACE-AT ?auto_432158 ?auto_432161 ) ( CLEAR ?auto_432158 ) ( IS-CRATE ?auto_432159 ) ( AVAILABLE ?auto_432163 ) ( IN ?auto_432159 ?auto_432165 ) ( ON ?auto_432150 ?auto_432149 ) ( ON ?auto_432151 ?auto_432150 ) ( ON ?auto_432152 ?auto_432151 ) ( ON ?auto_432153 ?auto_432152 ) ( ON ?auto_432154 ?auto_432153 ) ( ON ?auto_432155 ?auto_432154 ) ( ON ?auto_432156 ?auto_432155 ) ( ON ?auto_432157 ?auto_432156 ) ( ON ?auto_432158 ?auto_432157 ) ( not ( = ?auto_432149 ?auto_432150 ) ) ( not ( = ?auto_432149 ?auto_432151 ) ) ( not ( = ?auto_432149 ?auto_432152 ) ) ( not ( = ?auto_432149 ?auto_432153 ) ) ( not ( = ?auto_432149 ?auto_432154 ) ) ( not ( = ?auto_432149 ?auto_432155 ) ) ( not ( = ?auto_432149 ?auto_432156 ) ) ( not ( = ?auto_432149 ?auto_432157 ) ) ( not ( = ?auto_432149 ?auto_432158 ) ) ( not ( = ?auto_432149 ?auto_432159 ) ) ( not ( = ?auto_432149 ?auto_432160 ) ) ( not ( = ?auto_432149 ?auto_432164 ) ) ( not ( = ?auto_432150 ?auto_432151 ) ) ( not ( = ?auto_432150 ?auto_432152 ) ) ( not ( = ?auto_432150 ?auto_432153 ) ) ( not ( = ?auto_432150 ?auto_432154 ) ) ( not ( = ?auto_432150 ?auto_432155 ) ) ( not ( = ?auto_432150 ?auto_432156 ) ) ( not ( = ?auto_432150 ?auto_432157 ) ) ( not ( = ?auto_432150 ?auto_432158 ) ) ( not ( = ?auto_432150 ?auto_432159 ) ) ( not ( = ?auto_432150 ?auto_432160 ) ) ( not ( = ?auto_432150 ?auto_432164 ) ) ( not ( = ?auto_432151 ?auto_432152 ) ) ( not ( = ?auto_432151 ?auto_432153 ) ) ( not ( = ?auto_432151 ?auto_432154 ) ) ( not ( = ?auto_432151 ?auto_432155 ) ) ( not ( = ?auto_432151 ?auto_432156 ) ) ( not ( = ?auto_432151 ?auto_432157 ) ) ( not ( = ?auto_432151 ?auto_432158 ) ) ( not ( = ?auto_432151 ?auto_432159 ) ) ( not ( = ?auto_432151 ?auto_432160 ) ) ( not ( = ?auto_432151 ?auto_432164 ) ) ( not ( = ?auto_432152 ?auto_432153 ) ) ( not ( = ?auto_432152 ?auto_432154 ) ) ( not ( = ?auto_432152 ?auto_432155 ) ) ( not ( = ?auto_432152 ?auto_432156 ) ) ( not ( = ?auto_432152 ?auto_432157 ) ) ( not ( = ?auto_432152 ?auto_432158 ) ) ( not ( = ?auto_432152 ?auto_432159 ) ) ( not ( = ?auto_432152 ?auto_432160 ) ) ( not ( = ?auto_432152 ?auto_432164 ) ) ( not ( = ?auto_432153 ?auto_432154 ) ) ( not ( = ?auto_432153 ?auto_432155 ) ) ( not ( = ?auto_432153 ?auto_432156 ) ) ( not ( = ?auto_432153 ?auto_432157 ) ) ( not ( = ?auto_432153 ?auto_432158 ) ) ( not ( = ?auto_432153 ?auto_432159 ) ) ( not ( = ?auto_432153 ?auto_432160 ) ) ( not ( = ?auto_432153 ?auto_432164 ) ) ( not ( = ?auto_432154 ?auto_432155 ) ) ( not ( = ?auto_432154 ?auto_432156 ) ) ( not ( = ?auto_432154 ?auto_432157 ) ) ( not ( = ?auto_432154 ?auto_432158 ) ) ( not ( = ?auto_432154 ?auto_432159 ) ) ( not ( = ?auto_432154 ?auto_432160 ) ) ( not ( = ?auto_432154 ?auto_432164 ) ) ( not ( = ?auto_432155 ?auto_432156 ) ) ( not ( = ?auto_432155 ?auto_432157 ) ) ( not ( = ?auto_432155 ?auto_432158 ) ) ( not ( = ?auto_432155 ?auto_432159 ) ) ( not ( = ?auto_432155 ?auto_432160 ) ) ( not ( = ?auto_432155 ?auto_432164 ) ) ( not ( = ?auto_432156 ?auto_432157 ) ) ( not ( = ?auto_432156 ?auto_432158 ) ) ( not ( = ?auto_432156 ?auto_432159 ) ) ( not ( = ?auto_432156 ?auto_432160 ) ) ( not ( = ?auto_432156 ?auto_432164 ) ) ( not ( = ?auto_432157 ?auto_432158 ) ) ( not ( = ?auto_432157 ?auto_432159 ) ) ( not ( = ?auto_432157 ?auto_432160 ) ) ( not ( = ?auto_432157 ?auto_432164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_432158 ?auto_432159 ?auto_432160 )
      ( MAKE-11CRATE-VERIFY ?auto_432149 ?auto_432150 ?auto_432151 ?auto_432152 ?auto_432153 ?auto_432154 ?auto_432155 ?auto_432156 ?auto_432157 ?auto_432158 ?auto_432159 ?auto_432160 ) )
  )

)

