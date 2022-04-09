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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166404 - SURFACE
      ?auto_166405 - SURFACE
    )
    :vars
    (
      ?auto_166406 - HOIST
      ?auto_166407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166406 ?auto_166407 ) ( SURFACE-AT ?auto_166404 ?auto_166407 ) ( CLEAR ?auto_166404 ) ( LIFTING ?auto_166406 ?auto_166405 ) ( IS-CRATE ?auto_166405 ) ( not ( = ?auto_166404 ?auto_166405 ) ) )
    :subtasks
    ( ( !DROP ?auto_166406 ?auto_166405 ?auto_166404 ?auto_166407 )
      ( MAKE-1CRATE-VERIFY ?auto_166404 ?auto_166405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166408 - SURFACE
      ?auto_166409 - SURFACE
    )
    :vars
    (
      ?auto_166411 - HOIST
      ?auto_166410 - PLACE
      ?auto_166412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166411 ?auto_166410 ) ( SURFACE-AT ?auto_166408 ?auto_166410 ) ( CLEAR ?auto_166408 ) ( IS-CRATE ?auto_166409 ) ( not ( = ?auto_166408 ?auto_166409 ) ) ( TRUCK-AT ?auto_166412 ?auto_166410 ) ( AVAILABLE ?auto_166411 ) ( IN ?auto_166409 ?auto_166412 ) )
    :subtasks
    ( ( !UNLOAD ?auto_166411 ?auto_166409 ?auto_166412 ?auto_166410 )
      ( MAKE-1CRATE ?auto_166408 ?auto_166409 )
      ( MAKE-1CRATE-VERIFY ?auto_166408 ?auto_166409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166413 - SURFACE
      ?auto_166414 - SURFACE
    )
    :vars
    (
      ?auto_166417 - HOIST
      ?auto_166415 - PLACE
      ?auto_166416 - TRUCK
      ?auto_166418 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166417 ?auto_166415 ) ( SURFACE-AT ?auto_166413 ?auto_166415 ) ( CLEAR ?auto_166413 ) ( IS-CRATE ?auto_166414 ) ( not ( = ?auto_166413 ?auto_166414 ) ) ( AVAILABLE ?auto_166417 ) ( IN ?auto_166414 ?auto_166416 ) ( TRUCK-AT ?auto_166416 ?auto_166418 ) ( not ( = ?auto_166418 ?auto_166415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166416 ?auto_166418 ?auto_166415 )
      ( MAKE-1CRATE ?auto_166413 ?auto_166414 )
      ( MAKE-1CRATE-VERIFY ?auto_166413 ?auto_166414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166419 - SURFACE
      ?auto_166420 - SURFACE
    )
    :vars
    (
      ?auto_166423 - HOIST
      ?auto_166424 - PLACE
      ?auto_166421 - TRUCK
      ?auto_166422 - PLACE
      ?auto_166425 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166423 ?auto_166424 ) ( SURFACE-AT ?auto_166419 ?auto_166424 ) ( CLEAR ?auto_166419 ) ( IS-CRATE ?auto_166420 ) ( not ( = ?auto_166419 ?auto_166420 ) ) ( AVAILABLE ?auto_166423 ) ( TRUCK-AT ?auto_166421 ?auto_166422 ) ( not ( = ?auto_166422 ?auto_166424 ) ) ( HOIST-AT ?auto_166425 ?auto_166422 ) ( LIFTING ?auto_166425 ?auto_166420 ) ( not ( = ?auto_166423 ?auto_166425 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166425 ?auto_166420 ?auto_166421 ?auto_166422 )
      ( MAKE-1CRATE ?auto_166419 ?auto_166420 )
      ( MAKE-1CRATE-VERIFY ?auto_166419 ?auto_166420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166426 - SURFACE
      ?auto_166427 - SURFACE
    )
    :vars
    (
      ?auto_166430 - HOIST
      ?auto_166429 - PLACE
      ?auto_166428 - TRUCK
      ?auto_166431 - PLACE
      ?auto_166432 - HOIST
      ?auto_166433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166430 ?auto_166429 ) ( SURFACE-AT ?auto_166426 ?auto_166429 ) ( CLEAR ?auto_166426 ) ( IS-CRATE ?auto_166427 ) ( not ( = ?auto_166426 ?auto_166427 ) ) ( AVAILABLE ?auto_166430 ) ( TRUCK-AT ?auto_166428 ?auto_166431 ) ( not ( = ?auto_166431 ?auto_166429 ) ) ( HOIST-AT ?auto_166432 ?auto_166431 ) ( not ( = ?auto_166430 ?auto_166432 ) ) ( AVAILABLE ?auto_166432 ) ( SURFACE-AT ?auto_166427 ?auto_166431 ) ( ON ?auto_166427 ?auto_166433 ) ( CLEAR ?auto_166427 ) ( not ( = ?auto_166426 ?auto_166433 ) ) ( not ( = ?auto_166427 ?auto_166433 ) ) )
    :subtasks
    ( ( !LIFT ?auto_166432 ?auto_166427 ?auto_166433 ?auto_166431 )
      ( MAKE-1CRATE ?auto_166426 ?auto_166427 )
      ( MAKE-1CRATE-VERIFY ?auto_166426 ?auto_166427 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166434 - SURFACE
      ?auto_166435 - SURFACE
    )
    :vars
    (
      ?auto_166439 - HOIST
      ?auto_166436 - PLACE
      ?auto_166437 - PLACE
      ?auto_166440 - HOIST
      ?auto_166441 - SURFACE
      ?auto_166438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166439 ?auto_166436 ) ( SURFACE-AT ?auto_166434 ?auto_166436 ) ( CLEAR ?auto_166434 ) ( IS-CRATE ?auto_166435 ) ( not ( = ?auto_166434 ?auto_166435 ) ) ( AVAILABLE ?auto_166439 ) ( not ( = ?auto_166437 ?auto_166436 ) ) ( HOIST-AT ?auto_166440 ?auto_166437 ) ( not ( = ?auto_166439 ?auto_166440 ) ) ( AVAILABLE ?auto_166440 ) ( SURFACE-AT ?auto_166435 ?auto_166437 ) ( ON ?auto_166435 ?auto_166441 ) ( CLEAR ?auto_166435 ) ( not ( = ?auto_166434 ?auto_166441 ) ) ( not ( = ?auto_166435 ?auto_166441 ) ) ( TRUCK-AT ?auto_166438 ?auto_166436 ) )
    :subtasks
    ( ( !DRIVE ?auto_166438 ?auto_166436 ?auto_166437 )
      ( MAKE-1CRATE ?auto_166434 ?auto_166435 )
      ( MAKE-1CRATE-VERIFY ?auto_166434 ?auto_166435 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166451 - SURFACE
      ?auto_166452 - SURFACE
      ?auto_166453 - SURFACE
    )
    :vars
    (
      ?auto_166454 - HOIST
      ?auto_166455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166454 ?auto_166455 ) ( SURFACE-AT ?auto_166452 ?auto_166455 ) ( CLEAR ?auto_166452 ) ( LIFTING ?auto_166454 ?auto_166453 ) ( IS-CRATE ?auto_166453 ) ( not ( = ?auto_166452 ?auto_166453 ) ) ( ON ?auto_166452 ?auto_166451 ) ( not ( = ?auto_166451 ?auto_166452 ) ) ( not ( = ?auto_166451 ?auto_166453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166452 ?auto_166453 )
      ( MAKE-2CRATE-VERIFY ?auto_166451 ?auto_166452 ?auto_166453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166461 - SURFACE
      ?auto_166462 - SURFACE
      ?auto_166463 - SURFACE
    )
    :vars
    (
      ?auto_166465 - HOIST
      ?auto_166466 - PLACE
      ?auto_166464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166465 ?auto_166466 ) ( SURFACE-AT ?auto_166462 ?auto_166466 ) ( CLEAR ?auto_166462 ) ( IS-CRATE ?auto_166463 ) ( not ( = ?auto_166462 ?auto_166463 ) ) ( TRUCK-AT ?auto_166464 ?auto_166466 ) ( AVAILABLE ?auto_166465 ) ( IN ?auto_166463 ?auto_166464 ) ( ON ?auto_166462 ?auto_166461 ) ( not ( = ?auto_166461 ?auto_166462 ) ) ( not ( = ?auto_166461 ?auto_166463 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166462 ?auto_166463 )
      ( MAKE-2CRATE-VERIFY ?auto_166461 ?auto_166462 ?auto_166463 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166467 - SURFACE
      ?auto_166468 - SURFACE
    )
    :vars
    (
      ?auto_166470 - HOIST
      ?auto_166472 - PLACE
      ?auto_166469 - TRUCK
      ?auto_166471 - SURFACE
      ?auto_166473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166470 ?auto_166472 ) ( SURFACE-AT ?auto_166467 ?auto_166472 ) ( CLEAR ?auto_166467 ) ( IS-CRATE ?auto_166468 ) ( not ( = ?auto_166467 ?auto_166468 ) ) ( AVAILABLE ?auto_166470 ) ( IN ?auto_166468 ?auto_166469 ) ( ON ?auto_166467 ?auto_166471 ) ( not ( = ?auto_166471 ?auto_166467 ) ) ( not ( = ?auto_166471 ?auto_166468 ) ) ( TRUCK-AT ?auto_166469 ?auto_166473 ) ( not ( = ?auto_166473 ?auto_166472 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166469 ?auto_166473 ?auto_166472 )
      ( MAKE-2CRATE ?auto_166471 ?auto_166467 ?auto_166468 )
      ( MAKE-1CRATE-VERIFY ?auto_166467 ?auto_166468 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166474 - SURFACE
      ?auto_166475 - SURFACE
      ?auto_166476 - SURFACE
    )
    :vars
    (
      ?auto_166478 - HOIST
      ?auto_166479 - PLACE
      ?auto_166480 - TRUCK
      ?auto_166477 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166478 ?auto_166479 ) ( SURFACE-AT ?auto_166475 ?auto_166479 ) ( CLEAR ?auto_166475 ) ( IS-CRATE ?auto_166476 ) ( not ( = ?auto_166475 ?auto_166476 ) ) ( AVAILABLE ?auto_166478 ) ( IN ?auto_166476 ?auto_166480 ) ( ON ?auto_166475 ?auto_166474 ) ( not ( = ?auto_166474 ?auto_166475 ) ) ( not ( = ?auto_166474 ?auto_166476 ) ) ( TRUCK-AT ?auto_166480 ?auto_166477 ) ( not ( = ?auto_166477 ?auto_166479 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166475 ?auto_166476 )
      ( MAKE-2CRATE-VERIFY ?auto_166474 ?auto_166475 ?auto_166476 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166481 - SURFACE
      ?auto_166482 - SURFACE
    )
    :vars
    (
      ?auto_166484 - HOIST
      ?auto_166486 - PLACE
      ?auto_166485 - SURFACE
      ?auto_166487 - TRUCK
      ?auto_166483 - PLACE
      ?auto_166488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166484 ?auto_166486 ) ( SURFACE-AT ?auto_166481 ?auto_166486 ) ( CLEAR ?auto_166481 ) ( IS-CRATE ?auto_166482 ) ( not ( = ?auto_166481 ?auto_166482 ) ) ( AVAILABLE ?auto_166484 ) ( ON ?auto_166481 ?auto_166485 ) ( not ( = ?auto_166485 ?auto_166481 ) ) ( not ( = ?auto_166485 ?auto_166482 ) ) ( TRUCK-AT ?auto_166487 ?auto_166483 ) ( not ( = ?auto_166483 ?auto_166486 ) ) ( HOIST-AT ?auto_166488 ?auto_166483 ) ( LIFTING ?auto_166488 ?auto_166482 ) ( not ( = ?auto_166484 ?auto_166488 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166488 ?auto_166482 ?auto_166487 ?auto_166483 )
      ( MAKE-2CRATE ?auto_166485 ?auto_166481 ?auto_166482 )
      ( MAKE-1CRATE-VERIFY ?auto_166481 ?auto_166482 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166489 - SURFACE
      ?auto_166490 - SURFACE
      ?auto_166491 - SURFACE
    )
    :vars
    (
      ?auto_166492 - HOIST
      ?auto_166493 - PLACE
      ?auto_166496 - TRUCK
      ?auto_166495 - PLACE
      ?auto_166494 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166492 ?auto_166493 ) ( SURFACE-AT ?auto_166490 ?auto_166493 ) ( CLEAR ?auto_166490 ) ( IS-CRATE ?auto_166491 ) ( not ( = ?auto_166490 ?auto_166491 ) ) ( AVAILABLE ?auto_166492 ) ( ON ?auto_166490 ?auto_166489 ) ( not ( = ?auto_166489 ?auto_166490 ) ) ( not ( = ?auto_166489 ?auto_166491 ) ) ( TRUCK-AT ?auto_166496 ?auto_166495 ) ( not ( = ?auto_166495 ?auto_166493 ) ) ( HOIST-AT ?auto_166494 ?auto_166495 ) ( LIFTING ?auto_166494 ?auto_166491 ) ( not ( = ?auto_166492 ?auto_166494 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166490 ?auto_166491 )
      ( MAKE-2CRATE-VERIFY ?auto_166489 ?auto_166490 ?auto_166491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166497 - SURFACE
      ?auto_166498 - SURFACE
    )
    :vars
    (
      ?auto_166502 - HOIST
      ?auto_166504 - PLACE
      ?auto_166503 - SURFACE
      ?auto_166499 - TRUCK
      ?auto_166501 - PLACE
      ?auto_166500 - HOIST
      ?auto_166505 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166502 ?auto_166504 ) ( SURFACE-AT ?auto_166497 ?auto_166504 ) ( CLEAR ?auto_166497 ) ( IS-CRATE ?auto_166498 ) ( not ( = ?auto_166497 ?auto_166498 ) ) ( AVAILABLE ?auto_166502 ) ( ON ?auto_166497 ?auto_166503 ) ( not ( = ?auto_166503 ?auto_166497 ) ) ( not ( = ?auto_166503 ?auto_166498 ) ) ( TRUCK-AT ?auto_166499 ?auto_166501 ) ( not ( = ?auto_166501 ?auto_166504 ) ) ( HOIST-AT ?auto_166500 ?auto_166501 ) ( not ( = ?auto_166502 ?auto_166500 ) ) ( AVAILABLE ?auto_166500 ) ( SURFACE-AT ?auto_166498 ?auto_166501 ) ( ON ?auto_166498 ?auto_166505 ) ( CLEAR ?auto_166498 ) ( not ( = ?auto_166497 ?auto_166505 ) ) ( not ( = ?auto_166498 ?auto_166505 ) ) ( not ( = ?auto_166503 ?auto_166505 ) ) )
    :subtasks
    ( ( !LIFT ?auto_166500 ?auto_166498 ?auto_166505 ?auto_166501 )
      ( MAKE-2CRATE ?auto_166503 ?auto_166497 ?auto_166498 )
      ( MAKE-1CRATE-VERIFY ?auto_166497 ?auto_166498 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166506 - SURFACE
      ?auto_166507 - SURFACE
      ?auto_166508 - SURFACE
    )
    :vars
    (
      ?auto_166509 - HOIST
      ?auto_166511 - PLACE
      ?auto_166510 - TRUCK
      ?auto_166513 - PLACE
      ?auto_166512 - HOIST
      ?auto_166514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166509 ?auto_166511 ) ( SURFACE-AT ?auto_166507 ?auto_166511 ) ( CLEAR ?auto_166507 ) ( IS-CRATE ?auto_166508 ) ( not ( = ?auto_166507 ?auto_166508 ) ) ( AVAILABLE ?auto_166509 ) ( ON ?auto_166507 ?auto_166506 ) ( not ( = ?auto_166506 ?auto_166507 ) ) ( not ( = ?auto_166506 ?auto_166508 ) ) ( TRUCK-AT ?auto_166510 ?auto_166513 ) ( not ( = ?auto_166513 ?auto_166511 ) ) ( HOIST-AT ?auto_166512 ?auto_166513 ) ( not ( = ?auto_166509 ?auto_166512 ) ) ( AVAILABLE ?auto_166512 ) ( SURFACE-AT ?auto_166508 ?auto_166513 ) ( ON ?auto_166508 ?auto_166514 ) ( CLEAR ?auto_166508 ) ( not ( = ?auto_166507 ?auto_166514 ) ) ( not ( = ?auto_166508 ?auto_166514 ) ) ( not ( = ?auto_166506 ?auto_166514 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166507 ?auto_166508 )
      ( MAKE-2CRATE-VERIFY ?auto_166506 ?auto_166507 ?auto_166508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166515 - SURFACE
      ?auto_166516 - SURFACE
    )
    :vars
    (
      ?auto_166519 - HOIST
      ?auto_166517 - PLACE
      ?auto_166520 - SURFACE
      ?auto_166521 - PLACE
      ?auto_166522 - HOIST
      ?auto_166518 - SURFACE
      ?auto_166523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166519 ?auto_166517 ) ( SURFACE-AT ?auto_166515 ?auto_166517 ) ( CLEAR ?auto_166515 ) ( IS-CRATE ?auto_166516 ) ( not ( = ?auto_166515 ?auto_166516 ) ) ( AVAILABLE ?auto_166519 ) ( ON ?auto_166515 ?auto_166520 ) ( not ( = ?auto_166520 ?auto_166515 ) ) ( not ( = ?auto_166520 ?auto_166516 ) ) ( not ( = ?auto_166521 ?auto_166517 ) ) ( HOIST-AT ?auto_166522 ?auto_166521 ) ( not ( = ?auto_166519 ?auto_166522 ) ) ( AVAILABLE ?auto_166522 ) ( SURFACE-AT ?auto_166516 ?auto_166521 ) ( ON ?auto_166516 ?auto_166518 ) ( CLEAR ?auto_166516 ) ( not ( = ?auto_166515 ?auto_166518 ) ) ( not ( = ?auto_166516 ?auto_166518 ) ) ( not ( = ?auto_166520 ?auto_166518 ) ) ( TRUCK-AT ?auto_166523 ?auto_166517 ) )
    :subtasks
    ( ( !DRIVE ?auto_166523 ?auto_166517 ?auto_166521 )
      ( MAKE-2CRATE ?auto_166520 ?auto_166515 ?auto_166516 )
      ( MAKE-1CRATE-VERIFY ?auto_166515 ?auto_166516 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166524 - SURFACE
      ?auto_166525 - SURFACE
      ?auto_166526 - SURFACE
    )
    :vars
    (
      ?auto_166529 - HOIST
      ?auto_166531 - PLACE
      ?auto_166532 - PLACE
      ?auto_166530 - HOIST
      ?auto_166527 - SURFACE
      ?auto_166528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166529 ?auto_166531 ) ( SURFACE-AT ?auto_166525 ?auto_166531 ) ( CLEAR ?auto_166525 ) ( IS-CRATE ?auto_166526 ) ( not ( = ?auto_166525 ?auto_166526 ) ) ( AVAILABLE ?auto_166529 ) ( ON ?auto_166525 ?auto_166524 ) ( not ( = ?auto_166524 ?auto_166525 ) ) ( not ( = ?auto_166524 ?auto_166526 ) ) ( not ( = ?auto_166532 ?auto_166531 ) ) ( HOIST-AT ?auto_166530 ?auto_166532 ) ( not ( = ?auto_166529 ?auto_166530 ) ) ( AVAILABLE ?auto_166530 ) ( SURFACE-AT ?auto_166526 ?auto_166532 ) ( ON ?auto_166526 ?auto_166527 ) ( CLEAR ?auto_166526 ) ( not ( = ?auto_166525 ?auto_166527 ) ) ( not ( = ?auto_166526 ?auto_166527 ) ) ( not ( = ?auto_166524 ?auto_166527 ) ) ( TRUCK-AT ?auto_166528 ?auto_166531 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166525 ?auto_166526 )
      ( MAKE-2CRATE-VERIFY ?auto_166524 ?auto_166525 ?auto_166526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166533 - SURFACE
      ?auto_166534 - SURFACE
    )
    :vars
    (
      ?auto_166537 - HOIST
      ?auto_166536 - PLACE
      ?auto_166540 - SURFACE
      ?auto_166538 - PLACE
      ?auto_166539 - HOIST
      ?auto_166541 - SURFACE
      ?auto_166535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166537 ?auto_166536 ) ( IS-CRATE ?auto_166534 ) ( not ( = ?auto_166533 ?auto_166534 ) ) ( not ( = ?auto_166540 ?auto_166533 ) ) ( not ( = ?auto_166540 ?auto_166534 ) ) ( not ( = ?auto_166538 ?auto_166536 ) ) ( HOIST-AT ?auto_166539 ?auto_166538 ) ( not ( = ?auto_166537 ?auto_166539 ) ) ( AVAILABLE ?auto_166539 ) ( SURFACE-AT ?auto_166534 ?auto_166538 ) ( ON ?auto_166534 ?auto_166541 ) ( CLEAR ?auto_166534 ) ( not ( = ?auto_166533 ?auto_166541 ) ) ( not ( = ?auto_166534 ?auto_166541 ) ) ( not ( = ?auto_166540 ?auto_166541 ) ) ( TRUCK-AT ?auto_166535 ?auto_166536 ) ( SURFACE-AT ?auto_166540 ?auto_166536 ) ( CLEAR ?auto_166540 ) ( LIFTING ?auto_166537 ?auto_166533 ) ( IS-CRATE ?auto_166533 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166540 ?auto_166533 )
      ( MAKE-2CRATE ?auto_166540 ?auto_166533 ?auto_166534 )
      ( MAKE-1CRATE-VERIFY ?auto_166533 ?auto_166534 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166542 - SURFACE
      ?auto_166543 - SURFACE
      ?auto_166544 - SURFACE
    )
    :vars
    (
      ?auto_166548 - HOIST
      ?auto_166550 - PLACE
      ?auto_166545 - PLACE
      ?auto_166546 - HOIST
      ?auto_166547 - SURFACE
      ?auto_166549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166548 ?auto_166550 ) ( IS-CRATE ?auto_166544 ) ( not ( = ?auto_166543 ?auto_166544 ) ) ( not ( = ?auto_166542 ?auto_166543 ) ) ( not ( = ?auto_166542 ?auto_166544 ) ) ( not ( = ?auto_166545 ?auto_166550 ) ) ( HOIST-AT ?auto_166546 ?auto_166545 ) ( not ( = ?auto_166548 ?auto_166546 ) ) ( AVAILABLE ?auto_166546 ) ( SURFACE-AT ?auto_166544 ?auto_166545 ) ( ON ?auto_166544 ?auto_166547 ) ( CLEAR ?auto_166544 ) ( not ( = ?auto_166543 ?auto_166547 ) ) ( not ( = ?auto_166544 ?auto_166547 ) ) ( not ( = ?auto_166542 ?auto_166547 ) ) ( TRUCK-AT ?auto_166549 ?auto_166550 ) ( SURFACE-AT ?auto_166542 ?auto_166550 ) ( CLEAR ?auto_166542 ) ( LIFTING ?auto_166548 ?auto_166543 ) ( IS-CRATE ?auto_166543 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166543 ?auto_166544 )
      ( MAKE-2CRATE-VERIFY ?auto_166542 ?auto_166543 ?auto_166544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166551 - SURFACE
      ?auto_166552 - SURFACE
    )
    :vars
    (
      ?auto_166556 - HOIST
      ?auto_166555 - PLACE
      ?auto_166559 - SURFACE
      ?auto_166557 - PLACE
      ?auto_166553 - HOIST
      ?auto_166558 - SURFACE
      ?auto_166554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166556 ?auto_166555 ) ( IS-CRATE ?auto_166552 ) ( not ( = ?auto_166551 ?auto_166552 ) ) ( not ( = ?auto_166559 ?auto_166551 ) ) ( not ( = ?auto_166559 ?auto_166552 ) ) ( not ( = ?auto_166557 ?auto_166555 ) ) ( HOIST-AT ?auto_166553 ?auto_166557 ) ( not ( = ?auto_166556 ?auto_166553 ) ) ( AVAILABLE ?auto_166553 ) ( SURFACE-AT ?auto_166552 ?auto_166557 ) ( ON ?auto_166552 ?auto_166558 ) ( CLEAR ?auto_166552 ) ( not ( = ?auto_166551 ?auto_166558 ) ) ( not ( = ?auto_166552 ?auto_166558 ) ) ( not ( = ?auto_166559 ?auto_166558 ) ) ( TRUCK-AT ?auto_166554 ?auto_166555 ) ( SURFACE-AT ?auto_166559 ?auto_166555 ) ( CLEAR ?auto_166559 ) ( IS-CRATE ?auto_166551 ) ( AVAILABLE ?auto_166556 ) ( IN ?auto_166551 ?auto_166554 ) )
    :subtasks
    ( ( !UNLOAD ?auto_166556 ?auto_166551 ?auto_166554 ?auto_166555 )
      ( MAKE-2CRATE ?auto_166559 ?auto_166551 ?auto_166552 )
      ( MAKE-1CRATE-VERIFY ?auto_166551 ?auto_166552 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_166560 - SURFACE
      ?auto_166561 - SURFACE
      ?auto_166562 - SURFACE
    )
    :vars
    (
      ?auto_166564 - HOIST
      ?auto_166568 - PLACE
      ?auto_166566 - PLACE
      ?auto_166563 - HOIST
      ?auto_166567 - SURFACE
      ?auto_166565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166564 ?auto_166568 ) ( IS-CRATE ?auto_166562 ) ( not ( = ?auto_166561 ?auto_166562 ) ) ( not ( = ?auto_166560 ?auto_166561 ) ) ( not ( = ?auto_166560 ?auto_166562 ) ) ( not ( = ?auto_166566 ?auto_166568 ) ) ( HOIST-AT ?auto_166563 ?auto_166566 ) ( not ( = ?auto_166564 ?auto_166563 ) ) ( AVAILABLE ?auto_166563 ) ( SURFACE-AT ?auto_166562 ?auto_166566 ) ( ON ?auto_166562 ?auto_166567 ) ( CLEAR ?auto_166562 ) ( not ( = ?auto_166561 ?auto_166567 ) ) ( not ( = ?auto_166562 ?auto_166567 ) ) ( not ( = ?auto_166560 ?auto_166567 ) ) ( TRUCK-AT ?auto_166565 ?auto_166568 ) ( SURFACE-AT ?auto_166560 ?auto_166568 ) ( CLEAR ?auto_166560 ) ( IS-CRATE ?auto_166561 ) ( AVAILABLE ?auto_166564 ) ( IN ?auto_166561 ?auto_166565 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166561 ?auto_166562 )
      ( MAKE-2CRATE-VERIFY ?auto_166560 ?auto_166561 ?auto_166562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_166605 - SURFACE
      ?auto_166606 - SURFACE
    )
    :vars
    (
      ?auto_166613 - HOIST
      ?auto_166607 - PLACE
      ?auto_166612 - SURFACE
      ?auto_166608 - PLACE
      ?auto_166609 - HOIST
      ?auto_166611 - SURFACE
      ?auto_166610 - TRUCK
      ?auto_166614 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166613 ?auto_166607 ) ( SURFACE-AT ?auto_166605 ?auto_166607 ) ( CLEAR ?auto_166605 ) ( IS-CRATE ?auto_166606 ) ( not ( = ?auto_166605 ?auto_166606 ) ) ( AVAILABLE ?auto_166613 ) ( ON ?auto_166605 ?auto_166612 ) ( not ( = ?auto_166612 ?auto_166605 ) ) ( not ( = ?auto_166612 ?auto_166606 ) ) ( not ( = ?auto_166608 ?auto_166607 ) ) ( HOIST-AT ?auto_166609 ?auto_166608 ) ( not ( = ?auto_166613 ?auto_166609 ) ) ( AVAILABLE ?auto_166609 ) ( SURFACE-AT ?auto_166606 ?auto_166608 ) ( ON ?auto_166606 ?auto_166611 ) ( CLEAR ?auto_166606 ) ( not ( = ?auto_166605 ?auto_166611 ) ) ( not ( = ?auto_166606 ?auto_166611 ) ) ( not ( = ?auto_166612 ?auto_166611 ) ) ( TRUCK-AT ?auto_166610 ?auto_166614 ) ( not ( = ?auto_166614 ?auto_166607 ) ) ( not ( = ?auto_166608 ?auto_166614 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166610 ?auto_166614 ?auto_166607 )
      ( MAKE-1CRATE ?auto_166605 ?auto_166606 )
      ( MAKE-1CRATE-VERIFY ?auto_166605 ?auto_166606 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166644 - SURFACE
      ?auto_166645 - SURFACE
      ?auto_166646 - SURFACE
      ?auto_166647 - SURFACE
    )
    :vars
    (
      ?auto_166649 - HOIST
      ?auto_166648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166649 ?auto_166648 ) ( SURFACE-AT ?auto_166646 ?auto_166648 ) ( CLEAR ?auto_166646 ) ( LIFTING ?auto_166649 ?auto_166647 ) ( IS-CRATE ?auto_166647 ) ( not ( = ?auto_166646 ?auto_166647 ) ) ( ON ?auto_166645 ?auto_166644 ) ( ON ?auto_166646 ?auto_166645 ) ( not ( = ?auto_166644 ?auto_166645 ) ) ( not ( = ?auto_166644 ?auto_166646 ) ) ( not ( = ?auto_166644 ?auto_166647 ) ) ( not ( = ?auto_166645 ?auto_166646 ) ) ( not ( = ?auto_166645 ?auto_166647 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_166646 ?auto_166647 )
      ( MAKE-3CRATE-VERIFY ?auto_166644 ?auto_166645 ?auto_166646 ?auto_166647 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166661 - SURFACE
      ?auto_166662 - SURFACE
      ?auto_166663 - SURFACE
      ?auto_166664 - SURFACE
    )
    :vars
    (
      ?auto_166667 - HOIST
      ?auto_166665 - PLACE
      ?auto_166666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166667 ?auto_166665 ) ( SURFACE-AT ?auto_166663 ?auto_166665 ) ( CLEAR ?auto_166663 ) ( IS-CRATE ?auto_166664 ) ( not ( = ?auto_166663 ?auto_166664 ) ) ( TRUCK-AT ?auto_166666 ?auto_166665 ) ( AVAILABLE ?auto_166667 ) ( IN ?auto_166664 ?auto_166666 ) ( ON ?auto_166663 ?auto_166662 ) ( not ( = ?auto_166662 ?auto_166663 ) ) ( not ( = ?auto_166662 ?auto_166664 ) ) ( ON ?auto_166662 ?auto_166661 ) ( not ( = ?auto_166661 ?auto_166662 ) ) ( not ( = ?auto_166661 ?auto_166663 ) ) ( not ( = ?auto_166661 ?auto_166664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166662 ?auto_166663 ?auto_166664 )
      ( MAKE-3CRATE-VERIFY ?auto_166661 ?auto_166662 ?auto_166663 ?auto_166664 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166682 - SURFACE
      ?auto_166683 - SURFACE
      ?auto_166684 - SURFACE
      ?auto_166685 - SURFACE
    )
    :vars
    (
      ?auto_166688 - HOIST
      ?auto_166687 - PLACE
      ?auto_166689 - TRUCK
      ?auto_166686 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166688 ?auto_166687 ) ( SURFACE-AT ?auto_166684 ?auto_166687 ) ( CLEAR ?auto_166684 ) ( IS-CRATE ?auto_166685 ) ( not ( = ?auto_166684 ?auto_166685 ) ) ( AVAILABLE ?auto_166688 ) ( IN ?auto_166685 ?auto_166689 ) ( ON ?auto_166684 ?auto_166683 ) ( not ( = ?auto_166683 ?auto_166684 ) ) ( not ( = ?auto_166683 ?auto_166685 ) ) ( TRUCK-AT ?auto_166689 ?auto_166686 ) ( not ( = ?auto_166686 ?auto_166687 ) ) ( ON ?auto_166683 ?auto_166682 ) ( not ( = ?auto_166682 ?auto_166683 ) ) ( not ( = ?auto_166682 ?auto_166684 ) ) ( not ( = ?auto_166682 ?auto_166685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166683 ?auto_166684 ?auto_166685 )
      ( MAKE-3CRATE-VERIFY ?auto_166682 ?auto_166683 ?auto_166684 ?auto_166685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166706 - SURFACE
      ?auto_166707 - SURFACE
      ?auto_166708 - SURFACE
      ?auto_166709 - SURFACE
    )
    :vars
    (
      ?auto_166712 - HOIST
      ?auto_166713 - PLACE
      ?auto_166711 - TRUCK
      ?auto_166714 - PLACE
      ?auto_166710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_166712 ?auto_166713 ) ( SURFACE-AT ?auto_166708 ?auto_166713 ) ( CLEAR ?auto_166708 ) ( IS-CRATE ?auto_166709 ) ( not ( = ?auto_166708 ?auto_166709 ) ) ( AVAILABLE ?auto_166712 ) ( ON ?auto_166708 ?auto_166707 ) ( not ( = ?auto_166707 ?auto_166708 ) ) ( not ( = ?auto_166707 ?auto_166709 ) ) ( TRUCK-AT ?auto_166711 ?auto_166714 ) ( not ( = ?auto_166714 ?auto_166713 ) ) ( HOIST-AT ?auto_166710 ?auto_166714 ) ( LIFTING ?auto_166710 ?auto_166709 ) ( not ( = ?auto_166712 ?auto_166710 ) ) ( ON ?auto_166707 ?auto_166706 ) ( not ( = ?auto_166706 ?auto_166707 ) ) ( not ( = ?auto_166706 ?auto_166708 ) ) ( not ( = ?auto_166706 ?auto_166709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166707 ?auto_166708 ?auto_166709 )
      ( MAKE-3CRATE-VERIFY ?auto_166706 ?auto_166707 ?auto_166708 ?auto_166709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166733 - SURFACE
      ?auto_166734 - SURFACE
      ?auto_166735 - SURFACE
      ?auto_166736 - SURFACE
    )
    :vars
    (
      ?auto_166742 - HOIST
      ?auto_166740 - PLACE
      ?auto_166739 - TRUCK
      ?auto_166738 - PLACE
      ?auto_166741 - HOIST
      ?auto_166737 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_166742 ?auto_166740 ) ( SURFACE-AT ?auto_166735 ?auto_166740 ) ( CLEAR ?auto_166735 ) ( IS-CRATE ?auto_166736 ) ( not ( = ?auto_166735 ?auto_166736 ) ) ( AVAILABLE ?auto_166742 ) ( ON ?auto_166735 ?auto_166734 ) ( not ( = ?auto_166734 ?auto_166735 ) ) ( not ( = ?auto_166734 ?auto_166736 ) ) ( TRUCK-AT ?auto_166739 ?auto_166738 ) ( not ( = ?auto_166738 ?auto_166740 ) ) ( HOIST-AT ?auto_166741 ?auto_166738 ) ( not ( = ?auto_166742 ?auto_166741 ) ) ( AVAILABLE ?auto_166741 ) ( SURFACE-AT ?auto_166736 ?auto_166738 ) ( ON ?auto_166736 ?auto_166737 ) ( CLEAR ?auto_166736 ) ( not ( = ?auto_166735 ?auto_166737 ) ) ( not ( = ?auto_166736 ?auto_166737 ) ) ( not ( = ?auto_166734 ?auto_166737 ) ) ( ON ?auto_166734 ?auto_166733 ) ( not ( = ?auto_166733 ?auto_166734 ) ) ( not ( = ?auto_166733 ?auto_166735 ) ) ( not ( = ?auto_166733 ?auto_166736 ) ) ( not ( = ?auto_166733 ?auto_166737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166734 ?auto_166735 ?auto_166736 )
      ( MAKE-3CRATE-VERIFY ?auto_166733 ?auto_166734 ?auto_166735 ?auto_166736 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166761 - SURFACE
      ?auto_166762 - SURFACE
      ?auto_166763 - SURFACE
      ?auto_166764 - SURFACE
    )
    :vars
    (
      ?auto_166770 - HOIST
      ?auto_166766 - PLACE
      ?auto_166768 - PLACE
      ?auto_166767 - HOIST
      ?auto_166765 - SURFACE
      ?auto_166769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166770 ?auto_166766 ) ( SURFACE-AT ?auto_166763 ?auto_166766 ) ( CLEAR ?auto_166763 ) ( IS-CRATE ?auto_166764 ) ( not ( = ?auto_166763 ?auto_166764 ) ) ( AVAILABLE ?auto_166770 ) ( ON ?auto_166763 ?auto_166762 ) ( not ( = ?auto_166762 ?auto_166763 ) ) ( not ( = ?auto_166762 ?auto_166764 ) ) ( not ( = ?auto_166768 ?auto_166766 ) ) ( HOIST-AT ?auto_166767 ?auto_166768 ) ( not ( = ?auto_166770 ?auto_166767 ) ) ( AVAILABLE ?auto_166767 ) ( SURFACE-AT ?auto_166764 ?auto_166768 ) ( ON ?auto_166764 ?auto_166765 ) ( CLEAR ?auto_166764 ) ( not ( = ?auto_166763 ?auto_166765 ) ) ( not ( = ?auto_166764 ?auto_166765 ) ) ( not ( = ?auto_166762 ?auto_166765 ) ) ( TRUCK-AT ?auto_166769 ?auto_166766 ) ( ON ?auto_166762 ?auto_166761 ) ( not ( = ?auto_166761 ?auto_166762 ) ) ( not ( = ?auto_166761 ?auto_166763 ) ) ( not ( = ?auto_166761 ?auto_166764 ) ) ( not ( = ?auto_166761 ?auto_166765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166762 ?auto_166763 ?auto_166764 )
      ( MAKE-3CRATE-VERIFY ?auto_166761 ?auto_166762 ?auto_166763 ?auto_166764 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166789 - SURFACE
      ?auto_166790 - SURFACE
      ?auto_166791 - SURFACE
      ?auto_166792 - SURFACE
    )
    :vars
    (
      ?auto_166795 - HOIST
      ?auto_166796 - PLACE
      ?auto_166797 - PLACE
      ?auto_166794 - HOIST
      ?auto_166793 - SURFACE
      ?auto_166798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166795 ?auto_166796 ) ( IS-CRATE ?auto_166792 ) ( not ( = ?auto_166791 ?auto_166792 ) ) ( not ( = ?auto_166790 ?auto_166791 ) ) ( not ( = ?auto_166790 ?auto_166792 ) ) ( not ( = ?auto_166797 ?auto_166796 ) ) ( HOIST-AT ?auto_166794 ?auto_166797 ) ( not ( = ?auto_166795 ?auto_166794 ) ) ( AVAILABLE ?auto_166794 ) ( SURFACE-AT ?auto_166792 ?auto_166797 ) ( ON ?auto_166792 ?auto_166793 ) ( CLEAR ?auto_166792 ) ( not ( = ?auto_166791 ?auto_166793 ) ) ( not ( = ?auto_166792 ?auto_166793 ) ) ( not ( = ?auto_166790 ?auto_166793 ) ) ( TRUCK-AT ?auto_166798 ?auto_166796 ) ( SURFACE-AT ?auto_166790 ?auto_166796 ) ( CLEAR ?auto_166790 ) ( LIFTING ?auto_166795 ?auto_166791 ) ( IS-CRATE ?auto_166791 ) ( ON ?auto_166790 ?auto_166789 ) ( not ( = ?auto_166789 ?auto_166790 ) ) ( not ( = ?auto_166789 ?auto_166791 ) ) ( not ( = ?auto_166789 ?auto_166792 ) ) ( not ( = ?auto_166789 ?auto_166793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166790 ?auto_166791 ?auto_166792 )
      ( MAKE-3CRATE-VERIFY ?auto_166789 ?auto_166790 ?auto_166791 ?auto_166792 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_166817 - SURFACE
      ?auto_166818 - SURFACE
      ?auto_166819 - SURFACE
      ?auto_166820 - SURFACE
    )
    :vars
    (
      ?auto_166826 - HOIST
      ?auto_166822 - PLACE
      ?auto_166823 - PLACE
      ?auto_166824 - HOIST
      ?auto_166825 - SURFACE
      ?auto_166821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166826 ?auto_166822 ) ( IS-CRATE ?auto_166820 ) ( not ( = ?auto_166819 ?auto_166820 ) ) ( not ( = ?auto_166818 ?auto_166819 ) ) ( not ( = ?auto_166818 ?auto_166820 ) ) ( not ( = ?auto_166823 ?auto_166822 ) ) ( HOIST-AT ?auto_166824 ?auto_166823 ) ( not ( = ?auto_166826 ?auto_166824 ) ) ( AVAILABLE ?auto_166824 ) ( SURFACE-AT ?auto_166820 ?auto_166823 ) ( ON ?auto_166820 ?auto_166825 ) ( CLEAR ?auto_166820 ) ( not ( = ?auto_166819 ?auto_166825 ) ) ( not ( = ?auto_166820 ?auto_166825 ) ) ( not ( = ?auto_166818 ?auto_166825 ) ) ( TRUCK-AT ?auto_166821 ?auto_166822 ) ( SURFACE-AT ?auto_166818 ?auto_166822 ) ( CLEAR ?auto_166818 ) ( IS-CRATE ?auto_166819 ) ( AVAILABLE ?auto_166826 ) ( IN ?auto_166819 ?auto_166821 ) ( ON ?auto_166818 ?auto_166817 ) ( not ( = ?auto_166817 ?auto_166818 ) ) ( not ( = ?auto_166817 ?auto_166819 ) ) ( not ( = ?auto_166817 ?auto_166820 ) ) ( not ( = ?auto_166817 ?auto_166825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_166818 ?auto_166819 ?auto_166820 )
      ( MAKE-3CRATE-VERIFY ?auto_166817 ?auto_166818 ?auto_166819 ?auto_166820 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167108 - SURFACE
      ?auto_167109 - SURFACE
      ?auto_167110 - SURFACE
      ?auto_167111 - SURFACE
      ?auto_167112 - SURFACE
    )
    :vars
    (
      ?auto_167113 - HOIST
      ?auto_167114 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167113 ?auto_167114 ) ( SURFACE-AT ?auto_167111 ?auto_167114 ) ( CLEAR ?auto_167111 ) ( LIFTING ?auto_167113 ?auto_167112 ) ( IS-CRATE ?auto_167112 ) ( not ( = ?auto_167111 ?auto_167112 ) ) ( ON ?auto_167109 ?auto_167108 ) ( ON ?auto_167110 ?auto_167109 ) ( ON ?auto_167111 ?auto_167110 ) ( not ( = ?auto_167108 ?auto_167109 ) ) ( not ( = ?auto_167108 ?auto_167110 ) ) ( not ( = ?auto_167108 ?auto_167111 ) ) ( not ( = ?auto_167108 ?auto_167112 ) ) ( not ( = ?auto_167109 ?auto_167110 ) ) ( not ( = ?auto_167109 ?auto_167111 ) ) ( not ( = ?auto_167109 ?auto_167112 ) ) ( not ( = ?auto_167110 ?auto_167111 ) ) ( not ( = ?auto_167110 ?auto_167112 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_167111 ?auto_167112 )
      ( MAKE-4CRATE-VERIFY ?auto_167108 ?auto_167109 ?auto_167110 ?auto_167111 ?auto_167112 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167133 - SURFACE
      ?auto_167134 - SURFACE
      ?auto_167135 - SURFACE
      ?auto_167136 - SURFACE
      ?auto_167137 - SURFACE
    )
    :vars
    (
      ?auto_167138 - HOIST
      ?auto_167140 - PLACE
      ?auto_167139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167138 ?auto_167140 ) ( SURFACE-AT ?auto_167136 ?auto_167140 ) ( CLEAR ?auto_167136 ) ( IS-CRATE ?auto_167137 ) ( not ( = ?auto_167136 ?auto_167137 ) ) ( TRUCK-AT ?auto_167139 ?auto_167140 ) ( AVAILABLE ?auto_167138 ) ( IN ?auto_167137 ?auto_167139 ) ( ON ?auto_167136 ?auto_167135 ) ( not ( = ?auto_167135 ?auto_167136 ) ) ( not ( = ?auto_167135 ?auto_167137 ) ) ( ON ?auto_167134 ?auto_167133 ) ( ON ?auto_167135 ?auto_167134 ) ( not ( = ?auto_167133 ?auto_167134 ) ) ( not ( = ?auto_167133 ?auto_167135 ) ) ( not ( = ?auto_167133 ?auto_167136 ) ) ( not ( = ?auto_167133 ?auto_167137 ) ) ( not ( = ?auto_167134 ?auto_167135 ) ) ( not ( = ?auto_167134 ?auto_167136 ) ) ( not ( = ?auto_167134 ?auto_167137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167135 ?auto_167136 ?auto_167137 )
      ( MAKE-4CRATE-VERIFY ?auto_167133 ?auto_167134 ?auto_167135 ?auto_167136 ?auto_167137 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167163 - SURFACE
      ?auto_167164 - SURFACE
      ?auto_167165 - SURFACE
      ?auto_167166 - SURFACE
      ?auto_167167 - SURFACE
    )
    :vars
    (
      ?auto_167169 - HOIST
      ?auto_167171 - PLACE
      ?auto_167168 - TRUCK
      ?auto_167170 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167169 ?auto_167171 ) ( SURFACE-AT ?auto_167166 ?auto_167171 ) ( CLEAR ?auto_167166 ) ( IS-CRATE ?auto_167167 ) ( not ( = ?auto_167166 ?auto_167167 ) ) ( AVAILABLE ?auto_167169 ) ( IN ?auto_167167 ?auto_167168 ) ( ON ?auto_167166 ?auto_167165 ) ( not ( = ?auto_167165 ?auto_167166 ) ) ( not ( = ?auto_167165 ?auto_167167 ) ) ( TRUCK-AT ?auto_167168 ?auto_167170 ) ( not ( = ?auto_167170 ?auto_167171 ) ) ( ON ?auto_167164 ?auto_167163 ) ( ON ?auto_167165 ?auto_167164 ) ( not ( = ?auto_167163 ?auto_167164 ) ) ( not ( = ?auto_167163 ?auto_167165 ) ) ( not ( = ?auto_167163 ?auto_167166 ) ) ( not ( = ?auto_167163 ?auto_167167 ) ) ( not ( = ?auto_167164 ?auto_167165 ) ) ( not ( = ?auto_167164 ?auto_167166 ) ) ( not ( = ?auto_167164 ?auto_167167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167165 ?auto_167166 ?auto_167167 )
      ( MAKE-4CRATE-VERIFY ?auto_167163 ?auto_167164 ?auto_167165 ?auto_167166 ?auto_167167 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167197 - SURFACE
      ?auto_167198 - SURFACE
      ?auto_167199 - SURFACE
      ?auto_167200 - SURFACE
      ?auto_167201 - SURFACE
    )
    :vars
    (
      ?auto_167202 - HOIST
      ?auto_167205 - PLACE
      ?auto_167204 - TRUCK
      ?auto_167206 - PLACE
      ?auto_167203 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_167202 ?auto_167205 ) ( SURFACE-AT ?auto_167200 ?auto_167205 ) ( CLEAR ?auto_167200 ) ( IS-CRATE ?auto_167201 ) ( not ( = ?auto_167200 ?auto_167201 ) ) ( AVAILABLE ?auto_167202 ) ( ON ?auto_167200 ?auto_167199 ) ( not ( = ?auto_167199 ?auto_167200 ) ) ( not ( = ?auto_167199 ?auto_167201 ) ) ( TRUCK-AT ?auto_167204 ?auto_167206 ) ( not ( = ?auto_167206 ?auto_167205 ) ) ( HOIST-AT ?auto_167203 ?auto_167206 ) ( LIFTING ?auto_167203 ?auto_167201 ) ( not ( = ?auto_167202 ?auto_167203 ) ) ( ON ?auto_167198 ?auto_167197 ) ( ON ?auto_167199 ?auto_167198 ) ( not ( = ?auto_167197 ?auto_167198 ) ) ( not ( = ?auto_167197 ?auto_167199 ) ) ( not ( = ?auto_167197 ?auto_167200 ) ) ( not ( = ?auto_167197 ?auto_167201 ) ) ( not ( = ?auto_167198 ?auto_167199 ) ) ( not ( = ?auto_167198 ?auto_167200 ) ) ( not ( = ?auto_167198 ?auto_167201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167199 ?auto_167200 ?auto_167201 )
      ( MAKE-4CRATE-VERIFY ?auto_167197 ?auto_167198 ?auto_167199 ?auto_167200 ?auto_167201 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167235 - SURFACE
      ?auto_167236 - SURFACE
      ?auto_167237 - SURFACE
      ?auto_167238 - SURFACE
      ?auto_167239 - SURFACE
    )
    :vars
    (
      ?auto_167240 - HOIST
      ?auto_167244 - PLACE
      ?auto_167241 - TRUCK
      ?auto_167245 - PLACE
      ?auto_167243 - HOIST
      ?auto_167242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_167240 ?auto_167244 ) ( SURFACE-AT ?auto_167238 ?auto_167244 ) ( CLEAR ?auto_167238 ) ( IS-CRATE ?auto_167239 ) ( not ( = ?auto_167238 ?auto_167239 ) ) ( AVAILABLE ?auto_167240 ) ( ON ?auto_167238 ?auto_167237 ) ( not ( = ?auto_167237 ?auto_167238 ) ) ( not ( = ?auto_167237 ?auto_167239 ) ) ( TRUCK-AT ?auto_167241 ?auto_167245 ) ( not ( = ?auto_167245 ?auto_167244 ) ) ( HOIST-AT ?auto_167243 ?auto_167245 ) ( not ( = ?auto_167240 ?auto_167243 ) ) ( AVAILABLE ?auto_167243 ) ( SURFACE-AT ?auto_167239 ?auto_167245 ) ( ON ?auto_167239 ?auto_167242 ) ( CLEAR ?auto_167239 ) ( not ( = ?auto_167238 ?auto_167242 ) ) ( not ( = ?auto_167239 ?auto_167242 ) ) ( not ( = ?auto_167237 ?auto_167242 ) ) ( ON ?auto_167236 ?auto_167235 ) ( ON ?auto_167237 ?auto_167236 ) ( not ( = ?auto_167235 ?auto_167236 ) ) ( not ( = ?auto_167235 ?auto_167237 ) ) ( not ( = ?auto_167235 ?auto_167238 ) ) ( not ( = ?auto_167235 ?auto_167239 ) ) ( not ( = ?auto_167235 ?auto_167242 ) ) ( not ( = ?auto_167236 ?auto_167237 ) ) ( not ( = ?auto_167236 ?auto_167238 ) ) ( not ( = ?auto_167236 ?auto_167239 ) ) ( not ( = ?auto_167236 ?auto_167242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167237 ?auto_167238 ?auto_167239 )
      ( MAKE-4CRATE-VERIFY ?auto_167235 ?auto_167236 ?auto_167237 ?auto_167238 ?auto_167239 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167274 - SURFACE
      ?auto_167275 - SURFACE
      ?auto_167276 - SURFACE
      ?auto_167277 - SURFACE
      ?auto_167278 - SURFACE
    )
    :vars
    (
      ?auto_167282 - HOIST
      ?auto_167284 - PLACE
      ?auto_167279 - PLACE
      ?auto_167280 - HOIST
      ?auto_167283 - SURFACE
      ?auto_167281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167282 ?auto_167284 ) ( SURFACE-AT ?auto_167277 ?auto_167284 ) ( CLEAR ?auto_167277 ) ( IS-CRATE ?auto_167278 ) ( not ( = ?auto_167277 ?auto_167278 ) ) ( AVAILABLE ?auto_167282 ) ( ON ?auto_167277 ?auto_167276 ) ( not ( = ?auto_167276 ?auto_167277 ) ) ( not ( = ?auto_167276 ?auto_167278 ) ) ( not ( = ?auto_167279 ?auto_167284 ) ) ( HOIST-AT ?auto_167280 ?auto_167279 ) ( not ( = ?auto_167282 ?auto_167280 ) ) ( AVAILABLE ?auto_167280 ) ( SURFACE-AT ?auto_167278 ?auto_167279 ) ( ON ?auto_167278 ?auto_167283 ) ( CLEAR ?auto_167278 ) ( not ( = ?auto_167277 ?auto_167283 ) ) ( not ( = ?auto_167278 ?auto_167283 ) ) ( not ( = ?auto_167276 ?auto_167283 ) ) ( TRUCK-AT ?auto_167281 ?auto_167284 ) ( ON ?auto_167275 ?auto_167274 ) ( ON ?auto_167276 ?auto_167275 ) ( not ( = ?auto_167274 ?auto_167275 ) ) ( not ( = ?auto_167274 ?auto_167276 ) ) ( not ( = ?auto_167274 ?auto_167277 ) ) ( not ( = ?auto_167274 ?auto_167278 ) ) ( not ( = ?auto_167274 ?auto_167283 ) ) ( not ( = ?auto_167275 ?auto_167276 ) ) ( not ( = ?auto_167275 ?auto_167277 ) ) ( not ( = ?auto_167275 ?auto_167278 ) ) ( not ( = ?auto_167275 ?auto_167283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167276 ?auto_167277 ?auto_167278 )
      ( MAKE-4CRATE-VERIFY ?auto_167274 ?auto_167275 ?auto_167276 ?auto_167277 ?auto_167278 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167313 - SURFACE
      ?auto_167314 - SURFACE
      ?auto_167315 - SURFACE
      ?auto_167316 - SURFACE
      ?auto_167317 - SURFACE
    )
    :vars
    (
      ?auto_167322 - HOIST
      ?auto_167323 - PLACE
      ?auto_167321 - PLACE
      ?auto_167318 - HOIST
      ?auto_167319 - SURFACE
      ?auto_167320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167322 ?auto_167323 ) ( IS-CRATE ?auto_167317 ) ( not ( = ?auto_167316 ?auto_167317 ) ) ( not ( = ?auto_167315 ?auto_167316 ) ) ( not ( = ?auto_167315 ?auto_167317 ) ) ( not ( = ?auto_167321 ?auto_167323 ) ) ( HOIST-AT ?auto_167318 ?auto_167321 ) ( not ( = ?auto_167322 ?auto_167318 ) ) ( AVAILABLE ?auto_167318 ) ( SURFACE-AT ?auto_167317 ?auto_167321 ) ( ON ?auto_167317 ?auto_167319 ) ( CLEAR ?auto_167317 ) ( not ( = ?auto_167316 ?auto_167319 ) ) ( not ( = ?auto_167317 ?auto_167319 ) ) ( not ( = ?auto_167315 ?auto_167319 ) ) ( TRUCK-AT ?auto_167320 ?auto_167323 ) ( SURFACE-AT ?auto_167315 ?auto_167323 ) ( CLEAR ?auto_167315 ) ( LIFTING ?auto_167322 ?auto_167316 ) ( IS-CRATE ?auto_167316 ) ( ON ?auto_167314 ?auto_167313 ) ( ON ?auto_167315 ?auto_167314 ) ( not ( = ?auto_167313 ?auto_167314 ) ) ( not ( = ?auto_167313 ?auto_167315 ) ) ( not ( = ?auto_167313 ?auto_167316 ) ) ( not ( = ?auto_167313 ?auto_167317 ) ) ( not ( = ?auto_167313 ?auto_167319 ) ) ( not ( = ?auto_167314 ?auto_167315 ) ) ( not ( = ?auto_167314 ?auto_167316 ) ) ( not ( = ?auto_167314 ?auto_167317 ) ) ( not ( = ?auto_167314 ?auto_167319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167315 ?auto_167316 ?auto_167317 )
      ( MAKE-4CRATE-VERIFY ?auto_167313 ?auto_167314 ?auto_167315 ?auto_167316 ?auto_167317 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_167352 - SURFACE
      ?auto_167353 - SURFACE
      ?auto_167354 - SURFACE
      ?auto_167355 - SURFACE
      ?auto_167356 - SURFACE
    )
    :vars
    (
      ?auto_167359 - HOIST
      ?auto_167362 - PLACE
      ?auto_167360 - PLACE
      ?auto_167361 - HOIST
      ?auto_167357 - SURFACE
      ?auto_167358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_167359 ?auto_167362 ) ( IS-CRATE ?auto_167356 ) ( not ( = ?auto_167355 ?auto_167356 ) ) ( not ( = ?auto_167354 ?auto_167355 ) ) ( not ( = ?auto_167354 ?auto_167356 ) ) ( not ( = ?auto_167360 ?auto_167362 ) ) ( HOIST-AT ?auto_167361 ?auto_167360 ) ( not ( = ?auto_167359 ?auto_167361 ) ) ( AVAILABLE ?auto_167361 ) ( SURFACE-AT ?auto_167356 ?auto_167360 ) ( ON ?auto_167356 ?auto_167357 ) ( CLEAR ?auto_167356 ) ( not ( = ?auto_167355 ?auto_167357 ) ) ( not ( = ?auto_167356 ?auto_167357 ) ) ( not ( = ?auto_167354 ?auto_167357 ) ) ( TRUCK-AT ?auto_167358 ?auto_167362 ) ( SURFACE-AT ?auto_167354 ?auto_167362 ) ( CLEAR ?auto_167354 ) ( IS-CRATE ?auto_167355 ) ( AVAILABLE ?auto_167359 ) ( IN ?auto_167355 ?auto_167358 ) ( ON ?auto_167353 ?auto_167352 ) ( ON ?auto_167354 ?auto_167353 ) ( not ( = ?auto_167352 ?auto_167353 ) ) ( not ( = ?auto_167352 ?auto_167354 ) ) ( not ( = ?auto_167352 ?auto_167355 ) ) ( not ( = ?auto_167352 ?auto_167356 ) ) ( not ( = ?auto_167352 ?auto_167357 ) ) ( not ( = ?auto_167353 ?auto_167354 ) ) ( not ( = ?auto_167353 ?auto_167355 ) ) ( not ( = ?auto_167353 ?auto_167356 ) ) ( not ( = ?auto_167353 ?auto_167357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_167354 ?auto_167355 ?auto_167356 )
      ( MAKE-4CRATE-VERIFY ?auto_167352 ?auto_167353 ?auto_167354 ?auto_167355 ?auto_167356 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168012 - SURFACE
      ?auto_168013 - SURFACE
      ?auto_168014 - SURFACE
      ?auto_168015 - SURFACE
      ?auto_168016 - SURFACE
      ?auto_168017 - SURFACE
    )
    :vars
    (
      ?auto_168018 - HOIST
      ?auto_168019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_168018 ?auto_168019 ) ( SURFACE-AT ?auto_168016 ?auto_168019 ) ( CLEAR ?auto_168016 ) ( LIFTING ?auto_168018 ?auto_168017 ) ( IS-CRATE ?auto_168017 ) ( not ( = ?auto_168016 ?auto_168017 ) ) ( ON ?auto_168013 ?auto_168012 ) ( ON ?auto_168014 ?auto_168013 ) ( ON ?auto_168015 ?auto_168014 ) ( ON ?auto_168016 ?auto_168015 ) ( not ( = ?auto_168012 ?auto_168013 ) ) ( not ( = ?auto_168012 ?auto_168014 ) ) ( not ( = ?auto_168012 ?auto_168015 ) ) ( not ( = ?auto_168012 ?auto_168016 ) ) ( not ( = ?auto_168012 ?auto_168017 ) ) ( not ( = ?auto_168013 ?auto_168014 ) ) ( not ( = ?auto_168013 ?auto_168015 ) ) ( not ( = ?auto_168013 ?auto_168016 ) ) ( not ( = ?auto_168013 ?auto_168017 ) ) ( not ( = ?auto_168014 ?auto_168015 ) ) ( not ( = ?auto_168014 ?auto_168016 ) ) ( not ( = ?auto_168014 ?auto_168017 ) ) ( not ( = ?auto_168015 ?auto_168016 ) ) ( not ( = ?auto_168015 ?auto_168017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_168016 ?auto_168017 )
      ( MAKE-5CRATE-VERIFY ?auto_168012 ?auto_168013 ?auto_168014 ?auto_168015 ?auto_168016 ?auto_168017 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168046 - SURFACE
      ?auto_168047 - SURFACE
      ?auto_168048 - SURFACE
      ?auto_168049 - SURFACE
      ?auto_168050 - SURFACE
      ?auto_168051 - SURFACE
    )
    :vars
    (
      ?auto_168053 - HOIST
      ?auto_168054 - PLACE
      ?auto_168052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168053 ?auto_168054 ) ( SURFACE-AT ?auto_168050 ?auto_168054 ) ( CLEAR ?auto_168050 ) ( IS-CRATE ?auto_168051 ) ( not ( = ?auto_168050 ?auto_168051 ) ) ( TRUCK-AT ?auto_168052 ?auto_168054 ) ( AVAILABLE ?auto_168053 ) ( IN ?auto_168051 ?auto_168052 ) ( ON ?auto_168050 ?auto_168049 ) ( not ( = ?auto_168049 ?auto_168050 ) ) ( not ( = ?auto_168049 ?auto_168051 ) ) ( ON ?auto_168047 ?auto_168046 ) ( ON ?auto_168048 ?auto_168047 ) ( ON ?auto_168049 ?auto_168048 ) ( not ( = ?auto_168046 ?auto_168047 ) ) ( not ( = ?auto_168046 ?auto_168048 ) ) ( not ( = ?auto_168046 ?auto_168049 ) ) ( not ( = ?auto_168046 ?auto_168050 ) ) ( not ( = ?auto_168046 ?auto_168051 ) ) ( not ( = ?auto_168047 ?auto_168048 ) ) ( not ( = ?auto_168047 ?auto_168049 ) ) ( not ( = ?auto_168047 ?auto_168050 ) ) ( not ( = ?auto_168047 ?auto_168051 ) ) ( not ( = ?auto_168048 ?auto_168049 ) ) ( not ( = ?auto_168048 ?auto_168050 ) ) ( not ( = ?auto_168048 ?auto_168051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168049 ?auto_168050 ?auto_168051 )
      ( MAKE-5CRATE-VERIFY ?auto_168046 ?auto_168047 ?auto_168048 ?auto_168049 ?auto_168050 ?auto_168051 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168086 - SURFACE
      ?auto_168087 - SURFACE
      ?auto_168088 - SURFACE
      ?auto_168089 - SURFACE
      ?auto_168090 - SURFACE
      ?auto_168091 - SURFACE
    )
    :vars
    (
      ?auto_168094 - HOIST
      ?auto_168093 - PLACE
      ?auto_168092 - TRUCK
      ?auto_168095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_168094 ?auto_168093 ) ( SURFACE-AT ?auto_168090 ?auto_168093 ) ( CLEAR ?auto_168090 ) ( IS-CRATE ?auto_168091 ) ( not ( = ?auto_168090 ?auto_168091 ) ) ( AVAILABLE ?auto_168094 ) ( IN ?auto_168091 ?auto_168092 ) ( ON ?auto_168090 ?auto_168089 ) ( not ( = ?auto_168089 ?auto_168090 ) ) ( not ( = ?auto_168089 ?auto_168091 ) ) ( TRUCK-AT ?auto_168092 ?auto_168095 ) ( not ( = ?auto_168095 ?auto_168093 ) ) ( ON ?auto_168087 ?auto_168086 ) ( ON ?auto_168088 ?auto_168087 ) ( ON ?auto_168089 ?auto_168088 ) ( not ( = ?auto_168086 ?auto_168087 ) ) ( not ( = ?auto_168086 ?auto_168088 ) ) ( not ( = ?auto_168086 ?auto_168089 ) ) ( not ( = ?auto_168086 ?auto_168090 ) ) ( not ( = ?auto_168086 ?auto_168091 ) ) ( not ( = ?auto_168087 ?auto_168088 ) ) ( not ( = ?auto_168087 ?auto_168089 ) ) ( not ( = ?auto_168087 ?auto_168090 ) ) ( not ( = ?auto_168087 ?auto_168091 ) ) ( not ( = ?auto_168088 ?auto_168089 ) ) ( not ( = ?auto_168088 ?auto_168090 ) ) ( not ( = ?auto_168088 ?auto_168091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168089 ?auto_168090 ?auto_168091 )
      ( MAKE-5CRATE-VERIFY ?auto_168086 ?auto_168087 ?auto_168088 ?auto_168089 ?auto_168090 ?auto_168091 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168131 - SURFACE
      ?auto_168132 - SURFACE
      ?auto_168133 - SURFACE
      ?auto_168134 - SURFACE
      ?auto_168135 - SURFACE
      ?auto_168136 - SURFACE
    )
    :vars
    (
      ?auto_168138 - HOIST
      ?auto_168140 - PLACE
      ?auto_168137 - TRUCK
      ?auto_168139 - PLACE
      ?auto_168141 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_168138 ?auto_168140 ) ( SURFACE-AT ?auto_168135 ?auto_168140 ) ( CLEAR ?auto_168135 ) ( IS-CRATE ?auto_168136 ) ( not ( = ?auto_168135 ?auto_168136 ) ) ( AVAILABLE ?auto_168138 ) ( ON ?auto_168135 ?auto_168134 ) ( not ( = ?auto_168134 ?auto_168135 ) ) ( not ( = ?auto_168134 ?auto_168136 ) ) ( TRUCK-AT ?auto_168137 ?auto_168139 ) ( not ( = ?auto_168139 ?auto_168140 ) ) ( HOIST-AT ?auto_168141 ?auto_168139 ) ( LIFTING ?auto_168141 ?auto_168136 ) ( not ( = ?auto_168138 ?auto_168141 ) ) ( ON ?auto_168132 ?auto_168131 ) ( ON ?auto_168133 ?auto_168132 ) ( ON ?auto_168134 ?auto_168133 ) ( not ( = ?auto_168131 ?auto_168132 ) ) ( not ( = ?auto_168131 ?auto_168133 ) ) ( not ( = ?auto_168131 ?auto_168134 ) ) ( not ( = ?auto_168131 ?auto_168135 ) ) ( not ( = ?auto_168131 ?auto_168136 ) ) ( not ( = ?auto_168132 ?auto_168133 ) ) ( not ( = ?auto_168132 ?auto_168134 ) ) ( not ( = ?auto_168132 ?auto_168135 ) ) ( not ( = ?auto_168132 ?auto_168136 ) ) ( not ( = ?auto_168133 ?auto_168134 ) ) ( not ( = ?auto_168133 ?auto_168135 ) ) ( not ( = ?auto_168133 ?auto_168136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168134 ?auto_168135 ?auto_168136 )
      ( MAKE-5CRATE-VERIFY ?auto_168131 ?auto_168132 ?auto_168133 ?auto_168134 ?auto_168135 ?auto_168136 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168181 - SURFACE
      ?auto_168182 - SURFACE
      ?auto_168183 - SURFACE
      ?auto_168184 - SURFACE
      ?auto_168185 - SURFACE
      ?auto_168186 - SURFACE
    )
    :vars
    (
      ?auto_168192 - HOIST
      ?auto_168187 - PLACE
      ?auto_168191 - TRUCK
      ?auto_168190 - PLACE
      ?auto_168188 - HOIST
      ?auto_168189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_168192 ?auto_168187 ) ( SURFACE-AT ?auto_168185 ?auto_168187 ) ( CLEAR ?auto_168185 ) ( IS-CRATE ?auto_168186 ) ( not ( = ?auto_168185 ?auto_168186 ) ) ( AVAILABLE ?auto_168192 ) ( ON ?auto_168185 ?auto_168184 ) ( not ( = ?auto_168184 ?auto_168185 ) ) ( not ( = ?auto_168184 ?auto_168186 ) ) ( TRUCK-AT ?auto_168191 ?auto_168190 ) ( not ( = ?auto_168190 ?auto_168187 ) ) ( HOIST-AT ?auto_168188 ?auto_168190 ) ( not ( = ?auto_168192 ?auto_168188 ) ) ( AVAILABLE ?auto_168188 ) ( SURFACE-AT ?auto_168186 ?auto_168190 ) ( ON ?auto_168186 ?auto_168189 ) ( CLEAR ?auto_168186 ) ( not ( = ?auto_168185 ?auto_168189 ) ) ( not ( = ?auto_168186 ?auto_168189 ) ) ( not ( = ?auto_168184 ?auto_168189 ) ) ( ON ?auto_168182 ?auto_168181 ) ( ON ?auto_168183 ?auto_168182 ) ( ON ?auto_168184 ?auto_168183 ) ( not ( = ?auto_168181 ?auto_168182 ) ) ( not ( = ?auto_168181 ?auto_168183 ) ) ( not ( = ?auto_168181 ?auto_168184 ) ) ( not ( = ?auto_168181 ?auto_168185 ) ) ( not ( = ?auto_168181 ?auto_168186 ) ) ( not ( = ?auto_168181 ?auto_168189 ) ) ( not ( = ?auto_168182 ?auto_168183 ) ) ( not ( = ?auto_168182 ?auto_168184 ) ) ( not ( = ?auto_168182 ?auto_168185 ) ) ( not ( = ?auto_168182 ?auto_168186 ) ) ( not ( = ?auto_168182 ?auto_168189 ) ) ( not ( = ?auto_168183 ?auto_168184 ) ) ( not ( = ?auto_168183 ?auto_168185 ) ) ( not ( = ?auto_168183 ?auto_168186 ) ) ( not ( = ?auto_168183 ?auto_168189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168184 ?auto_168185 ?auto_168186 )
      ( MAKE-5CRATE-VERIFY ?auto_168181 ?auto_168182 ?auto_168183 ?auto_168184 ?auto_168185 ?auto_168186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168232 - SURFACE
      ?auto_168233 - SURFACE
      ?auto_168234 - SURFACE
      ?auto_168235 - SURFACE
      ?auto_168236 - SURFACE
      ?auto_168237 - SURFACE
    )
    :vars
    (
      ?auto_168242 - HOIST
      ?auto_168241 - PLACE
      ?auto_168239 - PLACE
      ?auto_168240 - HOIST
      ?auto_168238 - SURFACE
      ?auto_168243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168242 ?auto_168241 ) ( SURFACE-AT ?auto_168236 ?auto_168241 ) ( CLEAR ?auto_168236 ) ( IS-CRATE ?auto_168237 ) ( not ( = ?auto_168236 ?auto_168237 ) ) ( AVAILABLE ?auto_168242 ) ( ON ?auto_168236 ?auto_168235 ) ( not ( = ?auto_168235 ?auto_168236 ) ) ( not ( = ?auto_168235 ?auto_168237 ) ) ( not ( = ?auto_168239 ?auto_168241 ) ) ( HOIST-AT ?auto_168240 ?auto_168239 ) ( not ( = ?auto_168242 ?auto_168240 ) ) ( AVAILABLE ?auto_168240 ) ( SURFACE-AT ?auto_168237 ?auto_168239 ) ( ON ?auto_168237 ?auto_168238 ) ( CLEAR ?auto_168237 ) ( not ( = ?auto_168236 ?auto_168238 ) ) ( not ( = ?auto_168237 ?auto_168238 ) ) ( not ( = ?auto_168235 ?auto_168238 ) ) ( TRUCK-AT ?auto_168243 ?auto_168241 ) ( ON ?auto_168233 ?auto_168232 ) ( ON ?auto_168234 ?auto_168233 ) ( ON ?auto_168235 ?auto_168234 ) ( not ( = ?auto_168232 ?auto_168233 ) ) ( not ( = ?auto_168232 ?auto_168234 ) ) ( not ( = ?auto_168232 ?auto_168235 ) ) ( not ( = ?auto_168232 ?auto_168236 ) ) ( not ( = ?auto_168232 ?auto_168237 ) ) ( not ( = ?auto_168232 ?auto_168238 ) ) ( not ( = ?auto_168233 ?auto_168234 ) ) ( not ( = ?auto_168233 ?auto_168235 ) ) ( not ( = ?auto_168233 ?auto_168236 ) ) ( not ( = ?auto_168233 ?auto_168237 ) ) ( not ( = ?auto_168233 ?auto_168238 ) ) ( not ( = ?auto_168234 ?auto_168235 ) ) ( not ( = ?auto_168234 ?auto_168236 ) ) ( not ( = ?auto_168234 ?auto_168237 ) ) ( not ( = ?auto_168234 ?auto_168238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168235 ?auto_168236 ?auto_168237 )
      ( MAKE-5CRATE-VERIFY ?auto_168232 ?auto_168233 ?auto_168234 ?auto_168235 ?auto_168236 ?auto_168237 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168283 - SURFACE
      ?auto_168284 - SURFACE
      ?auto_168285 - SURFACE
      ?auto_168286 - SURFACE
      ?auto_168287 - SURFACE
      ?auto_168288 - SURFACE
    )
    :vars
    (
      ?auto_168289 - HOIST
      ?auto_168290 - PLACE
      ?auto_168291 - PLACE
      ?auto_168293 - HOIST
      ?auto_168292 - SURFACE
      ?auto_168294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168289 ?auto_168290 ) ( IS-CRATE ?auto_168288 ) ( not ( = ?auto_168287 ?auto_168288 ) ) ( not ( = ?auto_168286 ?auto_168287 ) ) ( not ( = ?auto_168286 ?auto_168288 ) ) ( not ( = ?auto_168291 ?auto_168290 ) ) ( HOIST-AT ?auto_168293 ?auto_168291 ) ( not ( = ?auto_168289 ?auto_168293 ) ) ( AVAILABLE ?auto_168293 ) ( SURFACE-AT ?auto_168288 ?auto_168291 ) ( ON ?auto_168288 ?auto_168292 ) ( CLEAR ?auto_168288 ) ( not ( = ?auto_168287 ?auto_168292 ) ) ( not ( = ?auto_168288 ?auto_168292 ) ) ( not ( = ?auto_168286 ?auto_168292 ) ) ( TRUCK-AT ?auto_168294 ?auto_168290 ) ( SURFACE-AT ?auto_168286 ?auto_168290 ) ( CLEAR ?auto_168286 ) ( LIFTING ?auto_168289 ?auto_168287 ) ( IS-CRATE ?auto_168287 ) ( ON ?auto_168284 ?auto_168283 ) ( ON ?auto_168285 ?auto_168284 ) ( ON ?auto_168286 ?auto_168285 ) ( not ( = ?auto_168283 ?auto_168284 ) ) ( not ( = ?auto_168283 ?auto_168285 ) ) ( not ( = ?auto_168283 ?auto_168286 ) ) ( not ( = ?auto_168283 ?auto_168287 ) ) ( not ( = ?auto_168283 ?auto_168288 ) ) ( not ( = ?auto_168283 ?auto_168292 ) ) ( not ( = ?auto_168284 ?auto_168285 ) ) ( not ( = ?auto_168284 ?auto_168286 ) ) ( not ( = ?auto_168284 ?auto_168287 ) ) ( not ( = ?auto_168284 ?auto_168288 ) ) ( not ( = ?auto_168284 ?auto_168292 ) ) ( not ( = ?auto_168285 ?auto_168286 ) ) ( not ( = ?auto_168285 ?auto_168287 ) ) ( not ( = ?auto_168285 ?auto_168288 ) ) ( not ( = ?auto_168285 ?auto_168292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168286 ?auto_168287 ?auto_168288 )
      ( MAKE-5CRATE-VERIFY ?auto_168283 ?auto_168284 ?auto_168285 ?auto_168286 ?auto_168287 ?auto_168288 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_168334 - SURFACE
      ?auto_168335 - SURFACE
      ?auto_168336 - SURFACE
      ?auto_168337 - SURFACE
      ?auto_168338 - SURFACE
      ?auto_168339 - SURFACE
    )
    :vars
    (
      ?auto_168340 - HOIST
      ?auto_168345 - PLACE
      ?auto_168343 - PLACE
      ?auto_168341 - HOIST
      ?auto_168344 - SURFACE
      ?auto_168342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_168340 ?auto_168345 ) ( IS-CRATE ?auto_168339 ) ( not ( = ?auto_168338 ?auto_168339 ) ) ( not ( = ?auto_168337 ?auto_168338 ) ) ( not ( = ?auto_168337 ?auto_168339 ) ) ( not ( = ?auto_168343 ?auto_168345 ) ) ( HOIST-AT ?auto_168341 ?auto_168343 ) ( not ( = ?auto_168340 ?auto_168341 ) ) ( AVAILABLE ?auto_168341 ) ( SURFACE-AT ?auto_168339 ?auto_168343 ) ( ON ?auto_168339 ?auto_168344 ) ( CLEAR ?auto_168339 ) ( not ( = ?auto_168338 ?auto_168344 ) ) ( not ( = ?auto_168339 ?auto_168344 ) ) ( not ( = ?auto_168337 ?auto_168344 ) ) ( TRUCK-AT ?auto_168342 ?auto_168345 ) ( SURFACE-AT ?auto_168337 ?auto_168345 ) ( CLEAR ?auto_168337 ) ( IS-CRATE ?auto_168338 ) ( AVAILABLE ?auto_168340 ) ( IN ?auto_168338 ?auto_168342 ) ( ON ?auto_168335 ?auto_168334 ) ( ON ?auto_168336 ?auto_168335 ) ( ON ?auto_168337 ?auto_168336 ) ( not ( = ?auto_168334 ?auto_168335 ) ) ( not ( = ?auto_168334 ?auto_168336 ) ) ( not ( = ?auto_168334 ?auto_168337 ) ) ( not ( = ?auto_168334 ?auto_168338 ) ) ( not ( = ?auto_168334 ?auto_168339 ) ) ( not ( = ?auto_168334 ?auto_168344 ) ) ( not ( = ?auto_168335 ?auto_168336 ) ) ( not ( = ?auto_168335 ?auto_168337 ) ) ( not ( = ?auto_168335 ?auto_168338 ) ) ( not ( = ?auto_168335 ?auto_168339 ) ) ( not ( = ?auto_168335 ?auto_168344 ) ) ( not ( = ?auto_168336 ?auto_168337 ) ) ( not ( = ?auto_168336 ?auto_168338 ) ) ( not ( = ?auto_168336 ?auto_168339 ) ) ( not ( = ?auto_168336 ?auto_168344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_168337 ?auto_168338 ?auto_168339 )
      ( MAKE-5CRATE-VERIFY ?auto_168334 ?auto_168335 ?auto_168336 ?auto_168337 ?auto_168338 ?auto_168339 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169543 - SURFACE
      ?auto_169544 - SURFACE
      ?auto_169545 - SURFACE
      ?auto_169546 - SURFACE
      ?auto_169547 - SURFACE
      ?auto_169548 - SURFACE
      ?auto_169549 - SURFACE
    )
    :vars
    (
      ?auto_169551 - HOIST
      ?auto_169550 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169551 ?auto_169550 ) ( SURFACE-AT ?auto_169548 ?auto_169550 ) ( CLEAR ?auto_169548 ) ( LIFTING ?auto_169551 ?auto_169549 ) ( IS-CRATE ?auto_169549 ) ( not ( = ?auto_169548 ?auto_169549 ) ) ( ON ?auto_169544 ?auto_169543 ) ( ON ?auto_169545 ?auto_169544 ) ( ON ?auto_169546 ?auto_169545 ) ( ON ?auto_169547 ?auto_169546 ) ( ON ?auto_169548 ?auto_169547 ) ( not ( = ?auto_169543 ?auto_169544 ) ) ( not ( = ?auto_169543 ?auto_169545 ) ) ( not ( = ?auto_169543 ?auto_169546 ) ) ( not ( = ?auto_169543 ?auto_169547 ) ) ( not ( = ?auto_169543 ?auto_169548 ) ) ( not ( = ?auto_169543 ?auto_169549 ) ) ( not ( = ?auto_169544 ?auto_169545 ) ) ( not ( = ?auto_169544 ?auto_169546 ) ) ( not ( = ?auto_169544 ?auto_169547 ) ) ( not ( = ?auto_169544 ?auto_169548 ) ) ( not ( = ?auto_169544 ?auto_169549 ) ) ( not ( = ?auto_169545 ?auto_169546 ) ) ( not ( = ?auto_169545 ?auto_169547 ) ) ( not ( = ?auto_169545 ?auto_169548 ) ) ( not ( = ?auto_169545 ?auto_169549 ) ) ( not ( = ?auto_169546 ?auto_169547 ) ) ( not ( = ?auto_169546 ?auto_169548 ) ) ( not ( = ?auto_169546 ?auto_169549 ) ) ( not ( = ?auto_169547 ?auto_169548 ) ) ( not ( = ?auto_169547 ?auto_169549 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_169548 ?auto_169549 )
      ( MAKE-6CRATE-VERIFY ?auto_169543 ?auto_169544 ?auto_169545 ?auto_169546 ?auto_169547 ?auto_169548 ?auto_169549 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169587 - SURFACE
      ?auto_169588 - SURFACE
      ?auto_169589 - SURFACE
      ?auto_169590 - SURFACE
      ?auto_169591 - SURFACE
      ?auto_169592 - SURFACE
      ?auto_169593 - SURFACE
    )
    :vars
    (
      ?auto_169595 - HOIST
      ?auto_169594 - PLACE
      ?auto_169596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169595 ?auto_169594 ) ( SURFACE-AT ?auto_169592 ?auto_169594 ) ( CLEAR ?auto_169592 ) ( IS-CRATE ?auto_169593 ) ( not ( = ?auto_169592 ?auto_169593 ) ) ( TRUCK-AT ?auto_169596 ?auto_169594 ) ( AVAILABLE ?auto_169595 ) ( IN ?auto_169593 ?auto_169596 ) ( ON ?auto_169592 ?auto_169591 ) ( not ( = ?auto_169591 ?auto_169592 ) ) ( not ( = ?auto_169591 ?auto_169593 ) ) ( ON ?auto_169588 ?auto_169587 ) ( ON ?auto_169589 ?auto_169588 ) ( ON ?auto_169590 ?auto_169589 ) ( ON ?auto_169591 ?auto_169590 ) ( not ( = ?auto_169587 ?auto_169588 ) ) ( not ( = ?auto_169587 ?auto_169589 ) ) ( not ( = ?auto_169587 ?auto_169590 ) ) ( not ( = ?auto_169587 ?auto_169591 ) ) ( not ( = ?auto_169587 ?auto_169592 ) ) ( not ( = ?auto_169587 ?auto_169593 ) ) ( not ( = ?auto_169588 ?auto_169589 ) ) ( not ( = ?auto_169588 ?auto_169590 ) ) ( not ( = ?auto_169588 ?auto_169591 ) ) ( not ( = ?auto_169588 ?auto_169592 ) ) ( not ( = ?auto_169588 ?auto_169593 ) ) ( not ( = ?auto_169589 ?auto_169590 ) ) ( not ( = ?auto_169589 ?auto_169591 ) ) ( not ( = ?auto_169589 ?auto_169592 ) ) ( not ( = ?auto_169589 ?auto_169593 ) ) ( not ( = ?auto_169590 ?auto_169591 ) ) ( not ( = ?auto_169590 ?auto_169592 ) ) ( not ( = ?auto_169590 ?auto_169593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169591 ?auto_169592 ?auto_169593 )
      ( MAKE-6CRATE-VERIFY ?auto_169587 ?auto_169588 ?auto_169589 ?auto_169590 ?auto_169591 ?auto_169592 ?auto_169593 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169638 - SURFACE
      ?auto_169639 - SURFACE
      ?auto_169640 - SURFACE
      ?auto_169641 - SURFACE
      ?auto_169642 - SURFACE
      ?auto_169643 - SURFACE
      ?auto_169644 - SURFACE
    )
    :vars
    (
      ?auto_169646 - HOIST
      ?auto_169648 - PLACE
      ?auto_169645 - TRUCK
      ?auto_169647 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169646 ?auto_169648 ) ( SURFACE-AT ?auto_169643 ?auto_169648 ) ( CLEAR ?auto_169643 ) ( IS-CRATE ?auto_169644 ) ( not ( = ?auto_169643 ?auto_169644 ) ) ( AVAILABLE ?auto_169646 ) ( IN ?auto_169644 ?auto_169645 ) ( ON ?auto_169643 ?auto_169642 ) ( not ( = ?auto_169642 ?auto_169643 ) ) ( not ( = ?auto_169642 ?auto_169644 ) ) ( TRUCK-AT ?auto_169645 ?auto_169647 ) ( not ( = ?auto_169647 ?auto_169648 ) ) ( ON ?auto_169639 ?auto_169638 ) ( ON ?auto_169640 ?auto_169639 ) ( ON ?auto_169641 ?auto_169640 ) ( ON ?auto_169642 ?auto_169641 ) ( not ( = ?auto_169638 ?auto_169639 ) ) ( not ( = ?auto_169638 ?auto_169640 ) ) ( not ( = ?auto_169638 ?auto_169641 ) ) ( not ( = ?auto_169638 ?auto_169642 ) ) ( not ( = ?auto_169638 ?auto_169643 ) ) ( not ( = ?auto_169638 ?auto_169644 ) ) ( not ( = ?auto_169639 ?auto_169640 ) ) ( not ( = ?auto_169639 ?auto_169641 ) ) ( not ( = ?auto_169639 ?auto_169642 ) ) ( not ( = ?auto_169639 ?auto_169643 ) ) ( not ( = ?auto_169639 ?auto_169644 ) ) ( not ( = ?auto_169640 ?auto_169641 ) ) ( not ( = ?auto_169640 ?auto_169642 ) ) ( not ( = ?auto_169640 ?auto_169643 ) ) ( not ( = ?auto_169640 ?auto_169644 ) ) ( not ( = ?auto_169641 ?auto_169642 ) ) ( not ( = ?auto_169641 ?auto_169643 ) ) ( not ( = ?auto_169641 ?auto_169644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169642 ?auto_169643 ?auto_169644 )
      ( MAKE-6CRATE-VERIFY ?auto_169638 ?auto_169639 ?auto_169640 ?auto_169641 ?auto_169642 ?auto_169643 ?auto_169644 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169695 - SURFACE
      ?auto_169696 - SURFACE
      ?auto_169697 - SURFACE
      ?auto_169698 - SURFACE
      ?auto_169699 - SURFACE
      ?auto_169700 - SURFACE
      ?auto_169701 - SURFACE
    )
    :vars
    (
      ?auto_169706 - HOIST
      ?auto_169704 - PLACE
      ?auto_169705 - TRUCK
      ?auto_169702 - PLACE
      ?auto_169703 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_169706 ?auto_169704 ) ( SURFACE-AT ?auto_169700 ?auto_169704 ) ( CLEAR ?auto_169700 ) ( IS-CRATE ?auto_169701 ) ( not ( = ?auto_169700 ?auto_169701 ) ) ( AVAILABLE ?auto_169706 ) ( ON ?auto_169700 ?auto_169699 ) ( not ( = ?auto_169699 ?auto_169700 ) ) ( not ( = ?auto_169699 ?auto_169701 ) ) ( TRUCK-AT ?auto_169705 ?auto_169702 ) ( not ( = ?auto_169702 ?auto_169704 ) ) ( HOIST-AT ?auto_169703 ?auto_169702 ) ( LIFTING ?auto_169703 ?auto_169701 ) ( not ( = ?auto_169706 ?auto_169703 ) ) ( ON ?auto_169696 ?auto_169695 ) ( ON ?auto_169697 ?auto_169696 ) ( ON ?auto_169698 ?auto_169697 ) ( ON ?auto_169699 ?auto_169698 ) ( not ( = ?auto_169695 ?auto_169696 ) ) ( not ( = ?auto_169695 ?auto_169697 ) ) ( not ( = ?auto_169695 ?auto_169698 ) ) ( not ( = ?auto_169695 ?auto_169699 ) ) ( not ( = ?auto_169695 ?auto_169700 ) ) ( not ( = ?auto_169695 ?auto_169701 ) ) ( not ( = ?auto_169696 ?auto_169697 ) ) ( not ( = ?auto_169696 ?auto_169698 ) ) ( not ( = ?auto_169696 ?auto_169699 ) ) ( not ( = ?auto_169696 ?auto_169700 ) ) ( not ( = ?auto_169696 ?auto_169701 ) ) ( not ( = ?auto_169697 ?auto_169698 ) ) ( not ( = ?auto_169697 ?auto_169699 ) ) ( not ( = ?auto_169697 ?auto_169700 ) ) ( not ( = ?auto_169697 ?auto_169701 ) ) ( not ( = ?auto_169698 ?auto_169699 ) ) ( not ( = ?auto_169698 ?auto_169700 ) ) ( not ( = ?auto_169698 ?auto_169701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169699 ?auto_169700 ?auto_169701 )
      ( MAKE-6CRATE-VERIFY ?auto_169695 ?auto_169696 ?auto_169697 ?auto_169698 ?auto_169699 ?auto_169700 ?auto_169701 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169758 - SURFACE
      ?auto_169759 - SURFACE
      ?auto_169760 - SURFACE
      ?auto_169761 - SURFACE
      ?auto_169762 - SURFACE
      ?auto_169763 - SURFACE
      ?auto_169764 - SURFACE
    )
    :vars
    (
      ?auto_169767 - HOIST
      ?auto_169770 - PLACE
      ?auto_169769 - TRUCK
      ?auto_169765 - PLACE
      ?auto_169768 - HOIST
      ?auto_169766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169767 ?auto_169770 ) ( SURFACE-AT ?auto_169763 ?auto_169770 ) ( CLEAR ?auto_169763 ) ( IS-CRATE ?auto_169764 ) ( not ( = ?auto_169763 ?auto_169764 ) ) ( AVAILABLE ?auto_169767 ) ( ON ?auto_169763 ?auto_169762 ) ( not ( = ?auto_169762 ?auto_169763 ) ) ( not ( = ?auto_169762 ?auto_169764 ) ) ( TRUCK-AT ?auto_169769 ?auto_169765 ) ( not ( = ?auto_169765 ?auto_169770 ) ) ( HOIST-AT ?auto_169768 ?auto_169765 ) ( not ( = ?auto_169767 ?auto_169768 ) ) ( AVAILABLE ?auto_169768 ) ( SURFACE-AT ?auto_169764 ?auto_169765 ) ( ON ?auto_169764 ?auto_169766 ) ( CLEAR ?auto_169764 ) ( not ( = ?auto_169763 ?auto_169766 ) ) ( not ( = ?auto_169764 ?auto_169766 ) ) ( not ( = ?auto_169762 ?auto_169766 ) ) ( ON ?auto_169759 ?auto_169758 ) ( ON ?auto_169760 ?auto_169759 ) ( ON ?auto_169761 ?auto_169760 ) ( ON ?auto_169762 ?auto_169761 ) ( not ( = ?auto_169758 ?auto_169759 ) ) ( not ( = ?auto_169758 ?auto_169760 ) ) ( not ( = ?auto_169758 ?auto_169761 ) ) ( not ( = ?auto_169758 ?auto_169762 ) ) ( not ( = ?auto_169758 ?auto_169763 ) ) ( not ( = ?auto_169758 ?auto_169764 ) ) ( not ( = ?auto_169758 ?auto_169766 ) ) ( not ( = ?auto_169759 ?auto_169760 ) ) ( not ( = ?auto_169759 ?auto_169761 ) ) ( not ( = ?auto_169759 ?auto_169762 ) ) ( not ( = ?auto_169759 ?auto_169763 ) ) ( not ( = ?auto_169759 ?auto_169764 ) ) ( not ( = ?auto_169759 ?auto_169766 ) ) ( not ( = ?auto_169760 ?auto_169761 ) ) ( not ( = ?auto_169760 ?auto_169762 ) ) ( not ( = ?auto_169760 ?auto_169763 ) ) ( not ( = ?auto_169760 ?auto_169764 ) ) ( not ( = ?auto_169760 ?auto_169766 ) ) ( not ( = ?auto_169761 ?auto_169762 ) ) ( not ( = ?auto_169761 ?auto_169763 ) ) ( not ( = ?auto_169761 ?auto_169764 ) ) ( not ( = ?auto_169761 ?auto_169766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169762 ?auto_169763 ?auto_169764 )
      ( MAKE-6CRATE-VERIFY ?auto_169758 ?auto_169759 ?auto_169760 ?auto_169761 ?auto_169762 ?auto_169763 ?auto_169764 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169822 - SURFACE
      ?auto_169823 - SURFACE
      ?auto_169824 - SURFACE
      ?auto_169825 - SURFACE
      ?auto_169826 - SURFACE
      ?auto_169827 - SURFACE
      ?auto_169828 - SURFACE
    )
    :vars
    (
      ?auto_169831 - HOIST
      ?auto_169829 - PLACE
      ?auto_169830 - PLACE
      ?auto_169834 - HOIST
      ?auto_169833 - SURFACE
      ?auto_169832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169831 ?auto_169829 ) ( SURFACE-AT ?auto_169827 ?auto_169829 ) ( CLEAR ?auto_169827 ) ( IS-CRATE ?auto_169828 ) ( not ( = ?auto_169827 ?auto_169828 ) ) ( AVAILABLE ?auto_169831 ) ( ON ?auto_169827 ?auto_169826 ) ( not ( = ?auto_169826 ?auto_169827 ) ) ( not ( = ?auto_169826 ?auto_169828 ) ) ( not ( = ?auto_169830 ?auto_169829 ) ) ( HOIST-AT ?auto_169834 ?auto_169830 ) ( not ( = ?auto_169831 ?auto_169834 ) ) ( AVAILABLE ?auto_169834 ) ( SURFACE-AT ?auto_169828 ?auto_169830 ) ( ON ?auto_169828 ?auto_169833 ) ( CLEAR ?auto_169828 ) ( not ( = ?auto_169827 ?auto_169833 ) ) ( not ( = ?auto_169828 ?auto_169833 ) ) ( not ( = ?auto_169826 ?auto_169833 ) ) ( TRUCK-AT ?auto_169832 ?auto_169829 ) ( ON ?auto_169823 ?auto_169822 ) ( ON ?auto_169824 ?auto_169823 ) ( ON ?auto_169825 ?auto_169824 ) ( ON ?auto_169826 ?auto_169825 ) ( not ( = ?auto_169822 ?auto_169823 ) ) ( not ( = ?auto_169822 ?auto_169824 ) ) ( not ( = ?auto_169822 ?auto_169825 ) ) ( not ( = ?auto_169822 ?auto_169826 ) ) ( not ( = ?auto_169822 ?auto_169827 ) ) ( not ( = ?auto_169822 ?auto_169828 ) ) ( not ( = ?auto_169822 ?auto_169833 ) ) ( not ( = ?auto_169823 ?auto_169824 ) ) ( not ( = ?auto_169823 ?auto_169825 ) ) ( not ( = ?auto_169823 ?auto_169826 ) ) ( not ( = ?auto_169823 ?auto_169827 ) ) ( not ( = ?auto_169823 ?auto_169828 ) ) ( not ( = ?auto_169823 ?auto_169833 ) ) ( not ( = ?auto_169824 ?auto_169825 ) ) ( not ( = ?auto_169824 ?auto_169826 ) ) ( not ( = ?auto_169824 ?auto_169827 ) ) ( not ( = ?auto_169824 ?auto_169828 ) ) ( not ( = ?auto_169824 ?auto_169833 ) ) ( not ( = ?auto_169825 ?auto_169826 ) ) ( not ( = ?auto_169825 ?auto_169827 ) ) ( not ( = ?auto_169825 ?auto_169828 ) ) ( not ( = ?auto_169825 ?auto_169833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169826 ?auto_169827 ?auto_169828 )
      ( MAKE-6CRATE-VERIFY ?auto_169822 ?auto_169823 ?auto_169824 ?auto_169825 ?auto_169826 ?auto_169827 ?auto_169828 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169886 - SURFACE
      ?auto_169887 - SURFACE
      ?auto_169888 - SURFACE
      ?auto_169889 - SURFACE
      ?auto_169890 - SURFACE
      ?auto_169891 - SURFACE
      ?auto_169892 - SURFACE
    )
    :vars
    (
      ?auto_169896 - HOIST
      ?auto_169894 - PLACE
      ?auto_169897 - PLACE
      ?auto_169893 - HOIST
      ?auto_169898 - SURFACE
      ?auto_169895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169896 ?auto_169894 ) ( IS-CRATE ?auto_169892 ) ( not ( = ?auto_169891 ?auto_169892 ) ) ( not ( = ?auto_169890 ?auto_169891 ) ) ( not ( = ?auto_169890 ?auto_169892 ) ) ( not ( = ?auto_169897 ?auto_169894 ) ) ( HOIST-AT ?auto_169893 ?auto_169897 ) ( not ( = ?auto_169896 ?auto_169893 ) ) ( AVAILABLE ?auto_169893 ) ( SURFACE-AT ?auto_169892 ?auto_169897 ) ( ON ?auto_169892 ?auto_169898 ) ( CLEAR ?auto_169892 ) ( not ( = ?auto_169891 ?auto_169898 ) ) ( not ( = ?auto_169892 ?auto_169898 ) ) ( not ( = ?auto_169890 ?auto_169898 ) ) ( TRUCK-AT ?auto_169895 ?auto_169894 ) ( SURFACE-AT ?auto_169890 ?auto_169894 ) ( CLEAR ?auto_169890 ) ( LIFTING ?auto_169896 ?auto_169891 ) ( IS-CRATE ?auto_169891 ) ( ON ?auto_169887 ?auto_169886 ) ( ON ?auto_169888 ?auto_169887 ) ( ON ?auto_169889 ?auto_169888 ) ( ON ?auto_169890 ?auto_169889 ) ( not ( = ?auto_169886 ?auto_169887 ) ) ( not ( = ?auto_169886 ?auto_169888 ) ) ( not ( = ?auto_169886 ?auto_169889 ) ) ( not ( = ?auto_169886 ?auto_169890 ) ) ( not ( = ?auto_169886 ?auto_169891 ) ) ( not ( = ?auto_169886 ?auto_169892 ) ) ( not ( = ?auto_169886 ?auto_169898 ) ) ( not ( = ?auto_169887 ?auto_169888 ) ) ( not ( = ?auto_169887 ?auto_169889 ) ) ( not ( = ?auto_169887 ?auto_169890 ) ) ( not ( = ?auto_169887 ?auto_169891 ) ) ( not ( = ?auto_169887 ?auto_169892 ) ) ( not ( = ?auto_169887 ?auto_169898 ) ) ( not ( = ?auto_169888 ?auto_169889 ) ) ( not ( = ?auto_169888 ?auto_169890 ) ) ( not ( = ?auto_169888 ?auto_169891 ) ) ( not ( = ?auto_169888 ?auto_169892 ) ) ( not ( = ?auto_169888 ?auto_169898 ) ) ( not ( = ?auto_169889 ?auto_169890 ) ) ( not ( = ?auto_169889 ?auto_169891 ) ) ( not ( = ?auto_169889 ?auto_169892 ) ) ( not ( = ?auto_169889 ?auto_169898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169890 ?auto_169891 ?auto_169892 )
      ( MAKE-6CRATE-VERIFY ?auto_169886 ?auto_169887 ?auto_169888 ?auto_169889 ?auto_169890 ?auto_169891 ?auto_169892 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_169950 - SURFACE
      ?auto_169951 - SURFACE
      ?auto_169952 - SURFACE
      ?auto_169953 - SURFACE
      ?auto_169954 - SURFACE
      ?auto_169955 - SURFACE
      ?auto_169956 - SURFACE
    )
    :vars
    (
      ?auto_169961 - HOIST
      ?auto_169962 - PLACE
      ?auto_169957 - PLACE
      ?auto_169958 - HOIST
      ?auto_169959 - SURFACE
      ?auto_169960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_169961 ?auto_169962 ) ( IS-CRATE ?auto_169956 ) ( not ( = ?auto_169955 ?auto_169956 ) ) ( not ( = ?auto_169954 ?auto_169955 ) ) ( not ( = ?auto_169954 ?auto_169956 ) ) ( not ( = ?auto_169957 ?auto_169962 ) ) ( HOIST-AT ?auto_169958 ?auto_169957 ) ( not ( = ?auto_169961 ?auto_169958 ) ) ( AVAILABLE ?auto_169958 ) ( SURFACE-AT ?auto_169956 ?auto_169957 ) ( ON ?auto_169956 ?auto_169959 ) ( CLEAR ?auto_169956 ) ( not ( = ?auto_169955 ?auto_169959 ) ) ( not ( = ?auto_169956 ?auto_169959 ) ) ( not ( = ?auto_169954 ?auto_169959 ) ) ( TRUCK-AT ?auto_169960 ?auto_169962 ) ( SURFACE-AT ?auto_169954 ?auto_169962 ) ( CLEAR ?auto_169954 ) ( IS-CRATE ?auto_169955 ) ( AVAILABLE ?auto_169961 ) ( IN ?auto_169955 ?auto_169960 ) ( ON ?auto_169951 ?auto_169950 ) ( ON ?auto_169952 ?auto_169951 ) ( ON ?auto_169953 ?auto_169952 ) ( ON ?auto_169954 ?auto_169953 ) ( not ( = ?auto_169950 ?auto_169951 ) ) ( not ( = ?auto_169950 ?auto_169952 ) ) ( not ( = ?auto_169950 ?auto_169953 ) ) ( not ( = ?auto_169950 ?auto_169954 ) ) ( not ( = ?auto_169950 ?auto_169955 ) ) ( not ( = ?auto_169950 ?auto_169956 ) ) ( not ( = ?auto_169950 ?auto_169959 ) ) ( not ( = ?auto_169951 ?auto_169952 ) ) ( not ( = ?auto_169951 ?auto_169953 ) ) ( not ( = ?auto_169951 ?auto_169954 ) ) ( not ( = ?auto_169951 ?auto_169955 ) ) ( not ( = ?auto_169951 ?auto_169956 ) ) ( not ( = ?auto_169951 ?auto_169959 ) ) ( not ( = ?auto_169952 ?auto_169953 ) ) ( not ( = ?auto_169952 ?auto_169954 ) ) ( not ( = ?auto_169952 ?auto_169955 ) ) ( not ( = ?auto_169952 ?auto_169956 ) ) ( not ( = ?auto_169952 ?auto_169959 ) ) ( not ( = ?auto_169953 ?auto_169954 ) ) ( not ( = ?auto_169953 ?auto_169955 ) ) ( not ( = ?auto_169953 ?auto_169956 ) ) ( not ( = ?auto_169953 ?auto_169959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_169954 ?auto_169955 ?auto_169956 )
      ( MAKE-6CRATE-VERIFY ?auto_169950 ?auto_169951 ?auto_169952 ?auto_169953 ?auto_169954 ?auto_169955 ?auto_169956 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171906 - SURFACE
      ?auto_171907 - SURFACE
      ?auto_171908 - SURFACE
      ?auto_171909 - SURFACE
      ?auto_171910 - SURFACE
      ?auto_171911 - SURFACE
      ?auto_171912 - SURFACE
      ?auto_171913 - SURFACE
    )
    :vars
    (
      ?auto_171915 - HOIST
      ?auto_171914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_171915 ?auto_171914 ) ( SURFACE-AT ?auto_171912 ?auto_171914 ) ( CLEAR ?auto_171912 ) ( LIFTING ?auto_171915 ?auto_171913 ) ( IS-CRATE ?auto_171913 ) ( not ( = ?auto_171912 ?auto_171913 ) ) ( ON ?auto_171907 ?auto_171906 ) ( ON ?auto_171908 ?auto_171907 ) ( ON ?auto_171909 ?auto_171908 ) ( ON ?auto_171910 ?auto_171909 ) ( ON ?auto_171911 ?auto_171910 ) ( ON ?auto_171912 ?auto_171911 ) ( not ( = ?auto_171906 ?auto_171907 ) ) ( not ( = ?auto_171906 ?auto_171908 ) ) ( not ( = ?auto_171906 ?auto_171909 ) ) ( not ( = ?auto_171906 ?auto_171910 ) ) ( not ( = ?auto_171906 ?auto_171911 ) ) ( not ( = ?auto_171906 ?auto_171912 ) ) ( not ( = ?auto_171906 ?auto_171913 ) ) ( not ( = ?auto_171907 ?auto_171908 ) ) ( not ( = ?auto_171907 ?auto_171909 ) ) ( not ( = ?auto_171907 ?auto_171910 ) ) ( not ( = ?auto_171907 ?auto_171911 ) ) ( not ( = ?auto_171907 ?auto_171912 ) ) ( not ( = ?auto_171907 ?auto_171913 ) ) ( not ( = ?auto_171908 ?auto_171909 ) ) ( not ( = ?auto_171908 ?auto_171910 ) ) ( not ( = ?auto_171908 ?auto_171911 ) ) ( not ( = ?auto_171908 ?auto_171912 ) ) ( not ( = ?auto_171908 ?auto_171913 ) ) ( not ( = ?auto_171909 ?auto_171910 ) ) ( not ( = ?auto_171909 ?auto_171911 ) ) ( not ( = ?auto_171909 ?auto_171912 ) ) ( not ( = ?auto_171909 ?auto_171913 ) ) ( not ( = ?auto_171910 ?auto_171911 ) ) ( not ( = ?auto_171910 ?auto_171912 ) ) ( not ( = ?auto_171910 ?auto_171913 ) ) ( not ( = ?auto_171911 ?auto_171912 ) ) ( not ( = ?auto_171911 ?auto_171913 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_171912 ?auto_171913 )
      ( MAKE-7CRATE-VERIFY ?auto_171906 ?auto_171907 ?auto_171908 ?auto_171909 ?auto_171910 ?auto_171911 ?auto_171912 ?auto_171913 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_171961 - SURFACE
      ?auto_171962 - SURFACE
      ?auto_171963 - SURFACE
      ?auto_171964 - SURFACE
      ?auto_171965 - SURFACE
      ?auto_171966 - SURFACE
      ?auto_171967 - SURFACE
      ?auto_171968 - SURFACE
    )
    :vars
    (
      ?auto_171969 - HOIST
      ?auto_171971 - PLACE
      ?auto_171970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_171969 ?auto_171971 ) ( SURFACE-AT ?auto_171967 ?auto_171971 ) ( CLEAR ?auto_171967 ) ( IS-CRATE ?auto_171968 ) ( not ( = ?auto_171967 ?auto_171968 ) ) ( TRUCK-AT ?auto_171970 ?auto_171971 ) ( AVAILABLE ?auto_171969 ) ( IN ?auto_171968 ?auto_171970 ) ( ON ?auto_171967 ?auto_171966 ) ( not ( = ?auto_171966 ?auto_171967 ) ) ( not ( = ?auto_171966 ?auto_171968 ) ) ( ON ?auto_171962 ?auto_171961 ) ( ON ?auto_171963 ?auto_171962 ) ( ON ?auto_171964 ?auto_171963 ) ( ON ?auto_171965 ?auto_171964 ) ( ON ?auto_171966 ?auto_171965 ) ( not ( = ?auto_171961 ?auto_171962 ) ) ( not ( = ?auto_171961 ?auto_171963 ) ) ( not ( = ?auto_171961 ?auto_171964 ) ) ( not ( = ?auto_171961 ?auto_171965 ) ) ( not ( = ?auto_171961 ?auto_171966 ) ) ( not ( = ?auto_171961 ?auto_171967 ) ) ( not ( = ?auto_171961 ?auto_171968 ) ) ( not ( = ?auto_171962 ?auto_171963 ) ) ( not ( = ?auto_171962 ?auto_171964 ) ) ( not ( = ?auto_171962 ?auto_171965 ) ) ( not ( = ?auto_171962 ?auto_171966 ) ) ( not ( = ?auto_171962 ?auto_171967 ) ) ( not ( = ?auto_171962 ?auto_171968 ) ) ( not ( = ?auto_171963 ?auto_171964 ) ) ( not ( = ?auto_171963 ?auto_171965 ) ) ( not ( = ?auto_171963 ?auto_171966 ) ) ( not ( = ?auto_171963 ?auto_171967 ) ) ( not ( = ?auto_171963 ?auto_171968 ) ) ( not ( = ?auto_171964 ?auto_171965 ) ) ( not ( = ?auto_171964 ?auto_171966 ) ) ( not ( = ?auto_171964 ?auto_171967 ) ) ( not ( = ?auto_171964 ?auto_171968 ) ) ( not ( = ?auto_171965 ?auto_171966 ) ) ( not ( = ?auto_171965 ?auto_171967 ) ) ( not ( = ?auto_171965 ?auto_171968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_171966 ?auto_171967 ?auto_171968 )
      ( MAKE-7CRATE-VERIFY ?auto_171961 ?auto_171962 ?auto_171963 ?auto_171964 ?auto_171965 ?auto_171966 ?auto_171967 ?auto_171968 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172024 - SURFACE
      ?auto_172025 - SURFACE
      ?auto_172026 - SURFACE
      ?auto_172027 - SURFACE
      ?auto_172028 - SURFACE
      ?auto_172029 - SURFACE
      ?auto_172030 - SURFACE
      ?auto_172031 - SURFACE
    )
    :vars
    (
      ?auto_172035 - HOIST
      ?auto_172034 - PLACE
      ?auto_172032 - TRUCK
      ?auto_172033 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_172035 ?auto_172034 ) ( SURFACE-AT ?auto_172030 ?auto_172034 ) ( CLEAR ?auto_172030 ) ( IS-CRATE ?auto_172031 ) ( not ( = ?auto_172030 ?auto_172031 ) ) ( AVAILABLE ?auto_172035 ) ( IN ?auto_172031 ?auto_172032 ) ( ON ?auto_172030 ?auto_172029 ) ( not ( = ?auto_172029 ?auto_172030 ) ) ( not ( = ?auto_172029 ?auto_172031 ) ) ( TRUCK-AT ?auto_172032 ?auto_172033 ) ( not ( = ?auto_172033 ?auto_172034 ) ) ( ON ?auto_172025 ?auto_172024 ) ( ON ?auto_172026 ?auto_172025 ) ( ON ?auto_172027 ?auto_172026 ) ( ON ?auto_172028 ?auto_172027 ) ( ON ?auto_172029 ?auto_172028 ) ( not ( = ?auto_172024 ?auto_172025 ) ) ( not ( = ?auto_172024 ?auto_172026 ) ) ( not ( = ?auto_172024 ?auto_172027 ) ) ( not ( = ?auto_172024 ?auto_172028 ) ) ( not ( = ?auto_172024 ?auto_172029 ) ) ( not ( = ?auto_172024 ?auto_172030 ) ) ( not ( = ?auto_172024 ?auto_172031 ) ) ( not ( = ?auto_172025 ?auto_172026 ) ) ( not ( = ?auto_172025 ?auto_172027 ) ) ( not ( = ?auto_172025 ?auto_172028 ) ) ( not ( = ?auto_172025 ?auto_172029 ) ) ( not ( = ?auto_172025 ?auto_172030 ) ) ( not ( = ?auto_172025 ?auto_172031 ) ) ( not ( = ?auto_172026 ?auto_172027 ) ) ( not ( = ?auto_172026 ?auto_172028 ) ) ( not ( = ?auto_172026 ?auto_172029 ) ) ( not ( = ?auto_172026 ?auto_172030 ) ) ( not ( = ?auto_172026 ?auto_172031 ) ) ( not ( = ?auto_172027 ?auto_172028 ) ) ( not ( = ?auto_172027 ?auto_172029 ) ) ( not ( = ?auto_172027 ?auto_172030 ) ) ( not ( = ?auto_172027 ?auto_172031 ) ) ( not ( = ?auto_172028 ?auto_172029 ) ) ( not ( = ?auto_172028 ?auto_172030 ) ) ( not ( = ?auto_172028 ?auto_172031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172029 ?auto_172030 ?auto_172031 )
      ( MAKE-7CRATE-VERIFY ?auto_172024 ?auto_172025 ?auto_172026 ?auto_172027 ?auto_172028 ?auto_172029 ?auto_172030 ?auto_172031 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172094 - SURFACE
      ?auto_172095 - SURFACE
      ?auto_172096 - SURFACE
      ?auto_172097 - SURFACE
      ?auto_172098 - SURFACE
      ?auto_172099 - SURFACE
      ?auto_172100 - SURFACE
      ?auto_172101 - SURFACE
    )
    :vars
    (
      ?auto_172102 - HOIST
      ?auto_172105 - PLACE
      ?auto_172103 - TRUCK
      ?auto_172106 - PLACE
      ?auto_172104 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_172102 ?auto_172105 ) ( SURFACE-AT ?auto_172100 ?auto_172105 ) ( CLEAR ?auto_172100 ) ( IS-CRATE ?auto_172101 ) ( not ( = ?auto_172100 ?auto_172101 ) ) ( AVAILABLE ?auto_172102 ) ( ON ?auto_172100 ?auto_172099 ) ( not ( = ?auto_172099 ?auto_172100 ) ) ( not ( = ?auto_172099 ?auto_172101 ) ) ( TRUCK-AT ?auto_172103 ?auto_172106 ) ( not ( = ?auto_172106 ?auto_172105 ) ) ( HOIST-AT ?auto_172104 ?auto_172106 ) ( LIFTING ?auto_172104 ?auto_172101 ) ( not ( = ?auto_172102 ?auto_172104 ) ) ( ON ?auto_172095 ?auto_172094 ) ( ON ?auto_172096 ?auto_172095 ) ( ON ?auto_172097 ?auto_172096 ) ( ON ?auto_172098 ?auto_172097 ) ( ON ?auto_172099 ?auto_172098 ) ( not ( = ?auto_172094 ?auto_172095 ) ) ( not ( = ?auto_172094 ?auto_172096 ) ) ( not ( = ?auto_172094 ?auto_172097 ) ) ( not ( = ?auto_172094 ?auto_172098 ) ) ( not ( = ?auto_172094 ?auto_172099 ) ) ( not ( = ?auto_172094 ?auto_172100 ) ) ( not ( = ?auto_172094 ?auto_172101 ) ) ( not ( = ?auto_172095 ?auto_172096 ) ) ( not ( = ?auto_172095 ?auto_172097 ) ) ( not ( = ?auto_172095 ?auto_172098 ) ) ( not ( = ?auto_172095 ?auto_172099 ) ) ( not ( = ?auto_172095 ?auto_172100 ) ) ( not ( = ?auto_172095 ?auto_172101 ) ) ( not ( = ?auto_172096 ?auto_172097 ) ) ( not ( = ?auto_172096 ?auto_172098 ) ) ( not ( = ?auto_172096 ?auto_172099 ) ) ( not ( = ?auto_172096 ?auto_172100 ) ) ( not ( = ?auto_172096 ?auto_172101 ) ) ( not ( = ?auto_172097 ?auto_172098 ) ) ( not ( = ?auto_172097 ?auto_172099 ) ) ( not ( = ?auto_172097 ?auto_172100 ) ) ( not ( = ?auto_172097 ?auto_172101 ) ) ( not ( = ?auto_172098 ?auto_172099 ) ) ( not ( = ?auto_172098 ?auto_172100 ) ) ( not ( = ?auto_172098 ?auto_172101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172099 ?auto_172100 ?auto_172101 )
      ( MAKE-7CRATE-VERIFY ?auto_172094 ?auto_172095 ?auto_172096 ?auto_172097 ?auto_172098 ?auto_172099 ?auto_172100 ?auto_172101 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172171 - SURFACE
      ?auto_172172 - SURFACE
      ?auto_172173 - SURFACE
      ?auto_172174 - SURFACE
      ?auto_172175 - SURFACE
      ?auto_172176 - SURFACE
      ?auto_172177 - SURFACE
      ?auto_172178 - SURFACE
    )
    :vars
    (
      ?auto_172181 - HOIST
      ?auto_172184 - PLACE
      ?auto_172180 - TRUCK
      ?auto_172183 - PLACE
      ?auto_172182 - HOIST
      ?auto_172179 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_172181 ?auto_172184 ) ( SURFACE-AT ?auto_172177 ?auto_172184 ) ( CLEAR ?auto_172177 ) ( IS-CRATE ?auto_172178 ) ( not ( = ?auto_172177 ?auto_172178 ) ) ( AVAILABLE ?auto_172181 ) ( ON ?auto_172177 ?auto_172176 ) ( not ( = ?auto_172176 ?auto_172177 ) ) ( not ( = ?auto_172176 ?auto_172178 ) ) ( TRUCK-AT ?auto_172180 ?auto_172183 ) ( not ( = ?auto_172183 ?auto_172184 ) ) ( HOIST-AT ?auto_172182 ?auto_172183 ) ( not ( = ?auto_172181 ?auto_172182 ) ) ( AVAILABLE ?auto_172182 ) ( SURFACE-AT ?auto_172178 ?auto_172183 ) ( ON ?auto_172178 ?auto_172179 ) ( CLEAR ?auto_172178 ) ( not ( = ?auto_172177 ?auto_172179 ) ) ( not ( = ?auto_172178 ?auto_172179 ) ) ( not ( = ?auto_172176 ?auto_172179 ) ) ( ON ?auto_172172 ?auto_172171 ) ( ON ?auto_172173 ?auto_172172 ) ( ON ?auto_172174 ?auto_172173 ) ( ON ?auto_172175 ?auto_172174 ) ( ON ?auto_172176 ?auto_172175 ) ( not ( = ?auto_172171 ?auto_172172 ) ) ( not ( = ?auto_172171 ?auto_172173 ) ) ( not ( = ?auto_172171 ?auto_172174 ) ) ( not ( = ?auto_172171 ?auto_172175 ) ) ( not ( = ?auto_172171 ?auto_172176 ) ) ( not ( = ?auto_172171 ?auto_172177 ) ) ( not ( = ?auto_172171 ?auto_172178 ) ) ( not ( = ?auto_172171 ?auto_172179 ) ) ( not ( = ?auto_172172 ?auto_172173 ) ) ( not ( = ?auto_172172 ?auto_172174 ) ) ( not ( = ?auto_172172 ?auto_172175 ) ) ( not ( = ?auto_172172 ?auto_172176 ) ) ( not ( = ?auto_172172 ?auto_172177 ) ) ( not ( = ?auto_172172 ?auto_172178 ) ) ( not ( = ?auto_172172 ?auto_172179 ) ) ( not ( = ?auto_172173 ?auto_172174 ) ) ( not ( = ?auto_172173 ?auto_172175 ) ) ( not ( = ?auto_172173 ?auto_172176 ) ) ( not ( = ?auto_172173 ?auto_172177 ) ) ( not ( = ?auto_172173 ?auto_172178 ) ) ( not ( = ?auto_172173 ?auto_172179 ) ) ( not ( = ?auto_172174 ?auto_172175 ) ) ( not ( = ?auto_172174 ?auto_172176 ) ) ( not ( = ?auto_172174 ?auto_172177 ) ) ( not ( = ?auto_172174 ?auto_172178 ) ) ( not ( = ?auto_172174 ?auto_172179 ) ) ( not ( = ?auto_172175 ?auto_172176 ) ) ( not ( = ?auto_172175 ?auto_172177 ) ) ( not ( = ?auto_172175 ?auto_172178 ) ) ( not ( = ?auto_172175 ?auto_172179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172176 ?auto_172177 ?auto_172178 )
      ( MAKE-7CRATE-VERIFY ?auto_172171 ?auto_172172 ?auto_172173 ?auto_172174 ?auto_172175 ?auto_172176 ?auto_172177 ?auto_172178 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172249 - SURFACE
      ?auto_172250 - SURFACE
      ?auto_172251 - SURFACE
      ?auto_172252 - SURFACE
      ?auto_172253 - SURFACE
      ?auto_172254 - SURFACE
      ?auto_172255 - SURFACE
      ?auto_172256 - SURFACE
    )
    :vars
    (
      ?auto_172258 - HOIST
      ?auto_172259 - PLACE
      ?auto_172261 - PLACE
      ?auto_172257 - HOIST
      ?auto_172260 - SURFACE
      ?auto_172262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172258 ?auto_172259 ) ( SURFACE-AT ?auto_172255 ?auto_172259 ) ( CLEAR ?auto_172255 ) ( IS-CRATE ?auto_172256 ) ( not ( = ?auto_172255 ?auto_172256 ) ) ( AVAILABLE ?auto_172258 ) ( ON ?auto_172255 ?auto_172254 ) ( not ( = ?auto_172254 ?auto_172255 ) ) ( not ( = ?auto_172254 ?auto_172256 ) ) ( not ( = ?auto_172261 ?auto_172259 ) ) ( HOIST-AT ?auto_172257 ?auto_172261 ) ( not ( = ?auto_172258 ?auto_172257 ) ) ( AVAILABLE ?auto_172257 ) ( SURFACE-AT ?auto_172256 ?auto_172261 ) ( ON ?auto_172256 ?auto_172260 ) ( CLEAR ?auto_172256 ) ( not ( = ?auto_172255 ?auto_172260 ) ) ( not ( = ?auto_172256 ?auto_172260 ) ) ( not ( = ?auto_172254 ?auto_172260 ) ) ( TRUCK-AT ?auto_172262 ?auto_172259 ) ( ON ?auto_172250 ?auto_172249 ) ( ON ?auto_172251 ?auto_172250 ) ( ON ?auto_172252 ?auto_172251 ) ( ON ?auto_172253 ?auto_172252 ) ( ON ?auto_172254 ?auto_172253 ) ( not ( = ?auto_172249 ?auto_172250 ) ) ( not ( = ?auto_172249 ?auto_172251 ) ) ( not ( = ?auto_172249 ?auto_172252 ) ) ( not ( = ?auto_172249 ?auto_172253 ) ) ( not ( = ?auto_172249 ?auto_172254 ) ) ( not ( = ?auto_172249 ?auto_172255 ) ) ( not ( = ?auto_172249 ?auto_172256 ) ) ( not ( = ?auto_172249 ?auto_172260 ) ) ( not ( = ?auto_172250 ?auto_172251 ) ) ( not ( = ?auto_172250 ?auto_172252 ) ) ( not ( = ?auto_172250 ?auto_172253 ) ) ( not ( = ?auto_172250 ?auto_172254 ) ) ( not ( = ?auto_172250 ?auto_172255 ) ) ( not ( = ?auto_172250 ?auto_172256 ) ) ( not ( = ?auto_172250 ?auto_172260 ) ) ( not ( = ?auto_172251 ?auto_172252 ) ) ( not ( = ?auto_172251 ?auto_172253 ) ) ( not ( = ?auto_172251 ?auto_172254 ) ) ( not ( = ?auto_172251 ?auto_172255 ) ) ( not ( = ?auto_172251 ?auto_172256 ) ) ( not ( = ?auto_172251 ?auto_172260 ) ) ( not ( = ?auto_172252 ?auto_172253 ) ) ( not ( = ?auto_172252 ?auto_172254 ) ) ( not ( = ?auto_172252 ?auto_172255 ) ) ( not ( = ?auto_172252 ?auto_172256 ) ) ( not ( = ?auto_172252 ?auto_172260 ) ) ( not ( = ?auto_172253 ?auto_172254 ) ) ( not ( = ?auto_172253 ?auto_172255 ) ) ( not ( = ?auto_172253 ?auto_172256 ) ) ( not ( = ?auto_172253 ?auto_172260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172254 ?auto_172255 ?auto_172256 )
      ( MAKE-7CRATE-VERIFY ?auto_172249 ?auto_172250 ?auto_172251 ?auto_172252 ?auto_172253 ?auto_172254 ?auto_172255 ?auto_172256 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172327 - SURFACE
      ?auto_172328 - SURFACE
      ?auto_172329 - SURFACE
      ?auto_172330 - SURFACE
      ?auto_172331 - SURFACE
      ?auto_172332 - SURFACE
      ?auto_172333 - SURFACE
      ?auto_172334 - SURFACE
    )
    :vars
    (
      ?auto_172335 - HOIST
      ?auto_172340 - PLACE
      ?auto_172339 - PLACE
      ?auto_172338 - HOIST
      ?auto_172336 - SURFACE
      ?auto_172337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172335 ?auto_172340 ) ( IS-CRATE ?auto_172334 ) ( not ( = ?auto_172333 ?auto_172334 ) ) ( not ( = ?auto_172332 ?auto_172333 ) ) ( not ( = ?auto_172332 ?auto_172334 ) ) ( not ( = ?auto_172339 ?auto_172340 ) ) ( HOIST-AT ?auto_172338 ?auto_172339 ) ( not ( = ?auto_172335 ?auto_172338 ) ) ( AVAILABLE ?auto_172338 ) ( SURFACE-AT ?auto_172334 ?auto_172339 ) ( ON ?auto_172334 ?auto_172336 ) ( CLEAR ?auto_172334 ) ( not ( = ?auto_172333 ?auto_172336 ) ) ( not ( = ?auto_172334 ?auto_172336 ) ) ( not ( = ?auto_172332 ?auto_172336 ) ) ( TRUCK-AT ?auto_172337 ?auto_172340 ) ( SURFACE-AT ?auto_172332 ?auto_172340 ) ( CLEAR ?auto_172332 ) ( LIFTING ?auto_172335 ?auto_172333 ) ( IS-CRATE ?auto_172333 ) ( ON ?auto_172328 ?auto_172327 ) ( ON ?auto_172329 ?auto_172328 ) ( ON ?auto_172330 ?auto_172329 ) ( ON ?auto_172331 ?auto_172330 ) ( ON ?auto_172332 ?auto_172331 ) ( not ( = ?auto_172327 ?auto_172328 ) ) ( not ( = ?auto_172327 ?auto_172329 ) ) ( not ( = ?auto_172327 ?auto_172330 ) ) ( not ( = ?auto_172327 ?auto_172331 ) ) ( not ( = ?auto_172327 ?auto_172332 ) ) ( not ( = ?auto_172327 ?auto_172333 ) ) ( not ( = ?auto_172327 ?auto_172334 ) ) ( not ( = ?auto_172327 ?auto_172336 ) ) ( not ( = ?auto_172328 ?auto_172329 ) ) ( not ( = ?auto_172328 ?auto_172330 ) ) ( not ( = ?auto_172328 ?auto_172331 ) ) ( not ( = ?auto_172328 ?auto_172332 ) ) ( not ( = ?auto_172328 ?auto_172333 ) ) ( not ( = ?auto_172328 ?auto_172334 ) ) ( not ( = ?auto_172328 ?auto_172336 ) ) ( not ( = ?auto_172329 ?auto_172330 ) ) ( not ( = ?auto_172329 ?auto_172331 ) ) ( not ( = ?auto_172329 ?auto_172332 ) ) ( not ( = ?auto_172329 ?auto_172333 ) ) ( not ( = ?auto_172329 ?auto_172334 ) ) ( not ( = ?auto_172329 ?auto_172336 ) ) ( not ( = ?auto_172330 ?auto_172331 ) ) ( not ( = ?auto_172330 ?auto_172332 ) ) ( not ( = ?auto_172330 ?auto_172333 ) ) ( not ( = ?auto_172330 ?auto_172334 ) ) ( not ( = ?auto_172330 ?auto_172336 ) ) ( not ( = ?auto_172331 ?auto_172332 ) ) ( not ( = ?auto_172331 ?auto_172333 ) ) ( not ( = ?auto_172331 ?auto_172334 ) ) ( not ( = ?auto_172331 ?auto_172336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172332 ?auto_172333 ?auto_172334 )
      ( MAKE-7CRATE-VERIFY ?auto_172327 ?auto_172328 ?auto_172329 ?auto_172330 ?auto_172331 ?auto_172332 ?auto_172333 ?auto_172334 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_172405 - SURFACE
      ?auto_172406 - SURFACE
      ?auto_172407 - SURFACE
      ?auto_172408 - SURFACE
      ?auto_172409 - SURFACE
      ?auto_172410 - SURFACE
      ?auto_172411 - SURFACE
      ?auto_172412 - SURFACE
    )
    :vars
    (
      ?auto_172417 - HOIST
      ?auto_172416 - PLACE
      ?auto_172413 - PLACE
      ?auto_172414 - HOIST
      ?auto_172415 - SURFACE
      ?auto_172418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_172417 ?auto_172416 ) ( IS-CRATE ?auto_172412 ) ( not ( = ?auto_172411 ?auto_172412 ) ) ( not ( = ?auto_172410 ?auto_172411 ) ) ( not ( = ?auto_172410 ?auto_172412 ) ) ( not ( = ?auto_172413 ?auto_172416 ) ) ( HOIST-AT ?auto_172414 ?auto_172413 ) ( not ( = ?auto_172417 ?auto_172414 ) ) ( AVAILABLE ?auto_172414 ) ( SURFACE-AT ?auto_172412 ?auto_172413 ) ( ON ?auto_172412 ?auto_172415 ) ( CLEAR ?auto_172412 ) ( not ( = ?auto_172411 ?auto_172415 ) ) ( not ( = ?auto_172412 ?auto_172415 ) ) ( not ( = ?auto_172410 ?auto_172415 ) ) ( TRUCK-AT ?auto_172418 ?auto_172416 ) ( SURFACE-AT ?auto_172410 ?auto_172416 ) ( CLEAR ?auto_172410 ) ( IS-CRATE ?auto_172411 ) ( AVAILABLE ?auto_172417 ) ( IN ?auto_172411 ?auto_172418 ) ( ON ?auto_172406 ?auto_172405 ) ( ON ?auto_172407 ?auto_172406 ) ( ON ?auto_172408 ?auto_172407 ) ( ON ?auto_172409 ?auto_172408 ) ( ON ?auto_172410 ?auto_172409 ) ( not ( = ?auto_172405 ?auto_172406 ) ) ( not ( = ?auto_172405 ?auto_172407 ) ) ( not ( = ?auto_172405 ?auto_172408 ) ) ( not ( = ?auto_172405 ?auto_172409 ) ) ( not ( = ?auto_172405 ?auto_172410 ) ) ( not ( = ?auto_172405 ?auto_172411 ) ) ( not ( = ?auto_172405 ?auto_172412 ) ) ( not ( = ?auto_172405 ?auto_172415 ) ) ( not ( = ?auto_172406 ?auto_172407 ) ) ( not ( = ?auto_172406 ?auto_172408 ) ) ( not ( = ?auto_172406 ?auto_172409 ) ) ( not ( = ?auto_172406 ?auto_172410 ) ) ( not ( = ?auto_172406 ?auto_172411 ) ) ( not ( = ?auto_172406 ?auto_172412 ) ) ( not ( = ?auto_172406 ?auto_172415 ) ) ( not ( = ?auto_172407 ?auto_172408 ) ) ( not ( = ?auto_172407 ?auto_172409 ) ) ( not ( = ?auto_172407 ?auto_172410 ) ) ( not ( = ?auto_172407 ?auto_172411 ) ) ( not ( = ?auto_172407 ?auto_172412 ) ) ( not ( = ?auto_172407 ?auto_172415 ) ) ( not ( = ?auto_172408 ?auto_172409 ) ) ( not ( = ?auto_172408 ?auto_172410 ) ) ( not ( = ?auto_172408 ?auto_172411 ) ) ( not ( = ?auto_172408 ?auto_172412 ) ) ( not ( = ?auto_172408 ?auto_172415 ) ) ( not ( = ?auto_172409 ?auto_172410 ) ) ( not ( = ?auto_172409 ?auto_172411 ) ) ( not ( = ?auto_172409 ?auto_172412 ) ) ( not ( = ?auto_172409 ?auto_172415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_172410 ?auto_172411 ?auto_172412 )
      ( MAKE-7CRATE-VERIFY ?auto_172405 ?auto_172406 ?auto_172407 ?auto_172408 ?auto_172409 ?auto_172410 ?auto_172411 ?auto_172412 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175324 - SURFACE
      ?auto_175325 - SURFACE
      ?auto_175326 - SURFACE
      ?auto_175327 - SURFACE
      ?auto_175328 - SURFACE
      ?auto_175329 - SURFACE
      ?auto_175330 - SURFACE
      ?auto_175331 - SURFACE
      ?auto_175332 - SURFACE
    )
    :vars
    (
      ?auto_175334 - HOIST
      ?auto_175333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175334 ?auto_175333 ) ( SURFACE-AT ?auto_175331 ?auto_175333 ) ( CLEAR ?auto_175331 ) ( LIFTING ?auto_175334 ?auto_175332 ) ( IS-CRATE ?auto_175332 ) ( not ( = ?auto_175331 ?auto_175332 ) ) ( ON ?auto_175325 ?auto_175324 ) ( ON ?auto_175326 ?auto_175325 ) ( ON ?auto_175327 ?auto_175326 ) ( ON ?auto_175328 ?auto_175327 ) ( ON ?auto_175329 ?auto_175328 ) ( ON ?auto_175330 ?auto_175329 ) ( ON ?auto_175331 ?auto_175330 ) ( not ( = ?auto_175324 ?auto_175325 ) ) ( not ( = ?auto_175324 ?auto_175326 ) ) ( not ( = ?auto_175324 ?auto_175327 ) ) ( not ( = ?auto_175324 ?auto_175328 ) ) ( not ( = ?auto_175324 ?auto_175329 ) ) ( not ( = ?auto_175324 ?auto_175330 ) ) ( not ( = ?auto_175324 ?auto_175331 ) ) ( not ( = ?auto_175324 ?auto_175332 ) ) ( not ( = ?auto_175325 ?auto_175326 ) ) ( not ( = ?auto_175325 ?auto_175327 ) ) ( not ( = ?auto_175325 ?auto_175328 ) ) ( not ( = ?auto_175325 ?auto_175329 ) ) ( not ( = ?auto_175325 ?auto_175330 ) ) ( not ( = ?auto_175325 ?auto_175331 ) ) ( not ( = ?auto_175325 ?auto_175332 ) ) ( not ( = ?auto_175326 ?auto_175327 ) ) ( not ( = ?auto_175326 ?auto_175328 ) ) ( not ( = ?auto_175326 ?auto_175329 ) ) ( not ( = ?auto_175326 ?auto_175330 ) ) ( not ( = ?auto_175326 ?auto_175331 ) ) ( not ( = ?auto_175326 ?auto_175332 ) ) ( not ( = ?auto_175327 ?auto_175328 ) ) ( not ( = ?auto_175327 ?auto_175329 ) ) ( not ( = ?auto_175327 ?auto_175330 ) ) ( not ( = ?auto_175327 ?auto_175331 ) ) ( not ( = ?auto_175327 ?auto_175332 ) ) ( not ( = ?auto_175328 ?auto_175329 ) ) ( not ( = ?auto_175328 ?auto_175330 ) ) ( not ( = ?auto_175328 ?auto_175331 ) ) ( not ( = ?auto_175328 ?auto_175332 ) ) ( not ( = ?auto_175329 ?auto_175330 ) ) ( not ( = ?auto_175329 ?auto_175331 ) ) ( not ( = ?auto_175329 ?auto_175332 ) ) ( not ( = ?auto_175330 ?auto_175331 ) ) ( not ( = ?auto_175330 ?auto_175332 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_175331 ?auto_175332 )
      ( MAKE-8CRATE-VERIFY ?auto_175324 ?auto_175325 ?auto_175326 ?auto_175327 ?auto_175328 ?auto_175329 ?auto_175330 ?auto_175331 ?auto_175332 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175391 - SURFACE
      ?auto_175392 - SURFACE
      ?auto_175393 - SURFACE
      ?auto_175394 - SURFACE
      ?auto_175395 - SURFACE
      ?auto_175396 - SURFACE
      ?auto_175397 - SURFACE
      ?auto_175398 - SURFACE
      ?auto_175399 - SURFACE
    )
    :vars
    (
      ?auto_175401 - HOIST
      ?auto_175402 - PLACE
      ?auto_175400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175401 ?auto_175402 ) ( SURFACE-AT ?auto_175398 ?auto_175402 ) ( CLEAR ?auto_175398 ) ( IS-CRATE ?auto_175399 ) ( not ( = ?auto_175398 ?auto_175399 ) ) ( TRUCK-AT ?auto_175400 ?auto_175402 ) ( AVAILABLE ?auto_175401 ) ( IN ?auto_175399 ?auto_175400 ) ( ON ?auto_175398 ?auto_175397 ) ( not ( = ?auto_175397 ?auto_175398 ) ) ( not ( = ?auto_175397 ?auto_175399 ) ) ( ON ?auto_175392 ?auto_175391 ) ( ON ?auto_175393 ?auto_175392 ) ( ON ?auto_175394 ?auto_175393 ) ( ON ?auto_175395 ?auto_175394 ) ( ON ?auto_175396 ?auto_175395 ) ( ON ?auto_175397 ?auto_175396 ) ( not ( = ?auto_175391 ?auto_175392 ) ) ( not ( = ?auto_175391 ?auto_175393 ) ) ( not ( = ?auto_175391 ?auto_175394 ) ) ( not ( = ?auto_175391 ?auto_175395 ) ) ( not ( = ?auto_175391 ?auto_175396 ) ) ( not ( = ?auto_175391 ?auto_175397 ) ) ( not ( = ?auto_175391 ?auto_175398 ) ) ( not ( = ?auto_175391 ?auto_175399 ) ) ( not ( = ?auto_175392 ?auto_175393 ) ) ( not ( = ?auto_175392 ?auto_175394 ) ) ( not ( = ?auto_175392 ?auto_175395 ) ) ( not ( = ?auto_175392 ?auto_175396 ) ) ( not ( = ?auto_175392 ?auto_175397 ) ) ( not ( = ?auto_175392 ?auto_175398 ) ) ( not ( = ?auto_175392 ?auto_175399 ) ) ( not ( = ?auto_175393 ?auto_175394 ) ) ( not ( = ?auto_175393 ?auto_175395 ) ) ( not ( = ?auto_175393 ?auto_175396 ) ) ( not ( = ?auto_175393 ?auto_175397 ) ) ( not ( = ?auto_175393 ?auto_175398 ) ) ( not ( = ?auto_175393 ?auto_175399 ) ) ( not ( = ?auto_175394 ?auto_175395 ) ) ( not ( = ?auto_175394 ?auto_175396 ) ) ( not ( = ?auto_175394 ?auto_175397 ) ) ( not ( = ?auto_175394 ?auto_175398 ) ) ( not ( = ?auto_175394 ?auto_175399 ) ) ( not ( = ?auto_175395 ?auto_175396 ) ) ( not ( = ?auto_175395 ?auto_175397 ) ) ( not ( = ?auto_175395 ?auto_175398 ) ) ( not ( = ?auto_175395 ?auto_175399 ) ) ( not ( = ?auto_175396 ?auto_175397 ) ) ( not ( = ?auto_175396 ?auto_175398 ) ) ( not ( = ?auto_175396 ?auto_175399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175397 ?auto_175398 ?auto_175399 )
      ( MAKE-8CRATE-VERIFY ?auto_175391 ?auto_175392 ?auto_175393 ?auto_175394 ?auto_175395 ?auto_175396 ?auto_175397 ?auto_175398 ?auto_175399 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175467 - SURFACE
      ?auto_175468 - SURFACE
      ?auto_175469 - SURFACE
      ?auto_175470 - SURFACE
      ?auto_175471 - SURFACE
      ?auto_175472 - SURFACE
      ?auto_175473 - SURFACE
      ?auto_175474 - SURFACE
      ?auto_175475 - SURFACE
    )
    :vars
    (
      ?auto_175476 - HOIST
      ?auto_175479 - PLACE
      ?auto_175478 - TRUCK
      ?auto_175477 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175476 ?auto_175479 ) ( SURFACE-AT ?auto_175474 ?auto_175479 ) ( CLEAR ?auto_175474 ) ( IS-CRATE ?auto_175475 ) ( not ( = ?auto_175474 ?auto_175475 ) ) ( AVAILABLE ?auto_175476 ) ( IN ?auto_175475 ?auto_175478 ) ( ON ?auto_175474 ?auto_175473 ) ( not ( = ?auto_175473 ?auto_175474 ) ) ( not ( = ?auto_175473 ?auto_175475 ) ) ( TRUCK-AT ?auto_175478 ?auto_175477 ) ( not ( = ?auto_175477 ?auto_175479 ) ) ( ON ?auto_175468 ?auto_175467 ) ( ON ?auto_175469 ?auto_175468 ) ( ON ?auto_175470 ?auto_175469 ) ( ON ?auto_175471 ?auto_175470 ) ( ON ?auto_175472 ?auto_175471 ) ( ON ?auto_175473 ?auto_175472 ) ( not ( = ?auto_175467 ?auto_175468 ) ) ( not ( = ?auto_175467 ?auto_175469 ) ) ( not ( = ?auto_175467 ?auto_175470 ) ) ( not ( = ?auto_175467 ?auto_175471 ) ) ( not ( = ?auto_175467 ?auto_175472 ) ) ( not ( = ?auto_175467 ?auto_175473 ) ) ( not ( = ?auto_175467 ?auto_175474 ) ) ( not ( = ?auto_175467 ?auto_175475 ) ) ( not ( = ?auto_175468 ?auto_175469 ) ) ( not ( = ?auto_175468 ?auto_175470 ) ) ( not ( = ?auto_175468 ?auto_175471 ) ) ( not ( = ?auto_175468 ?auto_175472 ) ) ( not ( = ?auto_175468 ?auto_175473 ) ) ( not ( = ?auto_175468 ?auto_175474 ) ) ( not ( = ?auto_175468 ?auto_175475 ) ) ( not ( = ?auto_175469 ?auto_175470 ) ) ( not ( = ?auto_175469 ?auto_175471 ) ) ( not ( = ?auto_175469 ?auto_175472 ) ) ( not ( = ?auto_175469 ?auto_175473 ) ) ( not ( = ?auto_175469 ?auto_175474 ) ) ( not ( = ?auto_175469 ?auto_175475 ) ) ( not ( = ?auto_175470 ?auto_175471 ) ) ( not ( = ?auto_175470 ?auto_175472 ) ) ( not ( = ?auto_175470 ?auto_175473 ) ) ( not ( = ?auto_175470 ?auto_175474 ) ) ( not ( = ?auto_175470 ?auto_175475 ) ) ( not ( = ?auto_175471 ?auto_175472 ) ) ( not ( = ?auto_175471 ?auto_175473 ) ) ( not ( = ?auto_175471 ?auto_175474 ) ) ( not ( = ?auto_175471 ?auto_175475 ) ) ( not ( = ?auto_175472 ?auto_175473 ) ) ( not ( = ?auto_175472 ?auto_175474 ) ) ( not ( = ?auto_175472 ?auto_175475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175473 ?auto_175474 ?auto_175475 )
      ( MAKE-8CRATE-VERIFY ?auto_175467 ?auto_175468 ?auto_175469 ?auto_175470 ?auto_175471 ?auto_175472 ?auto_175473 ?auto_175474 ?auto_175475 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175551 - SURFACE
      ?auto_175552 - SURFACE
      ?auto_175553 - SURFACE
      ?auto_175554 - SURFACE
      ?auto_175555 - SURFACE
      ?auto_175556 - SURFACE
      ?auto_175557 - SURFACE
      ?auto_175558 - SURFACE
      ?auto_175559 - SURFACE
    )
    :vars
    (
      ?auto_175563 - HOIST
      ?auto_175562 - PLACE
      ?auto_175560 - TRUCK
      ?auto_175561 - PLACE
      ?auto_175564 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_175563 ?auto_175562 ) ( SURFACE-AT ?auto_175558 ?auto_175562 ) ( CLEAR ?auto_175558 ) ( IS-CRATE ?auto_175559 ) ( not ( = ?auto_175558 ?auto_175559 ) ) ( AVAILABLE ?auto_175563 ) ( ON ?auto_175558 ?auto_175557 ) ( not ( = ?auto_175557 ?auto_175558 ) ) ( not ( = ?auto_175557 ?auto_175559 ) ) ( TRUCK-AT ?auto_175560 ?auto_175561 ) ( not ( = ?auto_175561 ?auto_175562 ) ) ( HOIST-AT ?auto_175564 ?auto_175561 ) ( LIFTING ?auto_175564 ?auto_175559 ) ( not ( = ?auto_175563 ?auto_175564 ) ) ( ON ?auto_175552 ?auto_175551 ) ( ON ?auto_175553 ?auto_175552 ) ( ON ?auto_175554 ?auto_175553 ) ( ON ?auto_175555 ?auto_175554 ) ( ON ?auto_175556 ?auto_175555 ) ( ON ?auto_175557 ?auto_175556 ) ( not ( = ?auto_175551 ?auto_175552 ) ) ( not ( = ?auto_175551 ?auto_175553 ) ) ( not ( = ?auto_175551 ?auto_175554 ) ) ( not ( = ?auto_175551 ?auto_175555 ) ) ( not ( = ?auto_175551 ?auto_175556 ) ) ( not ( = ?auto_175551 ?auto_175557 ) ) ( not ( = ?auto_175551 ?auto_175558 ) ) ( not ( = ?auto_175551 ?auto_175559 ) ) ( not ( = ?auto_175552 ?auto_175553 ) ) ( not ( = ?auto_175552 ?auto_175554 ) ) ( not ( = ?auto_175552 ?auto_175555 ) ) ( not ( = ?auto_175552 ?auto_175556 ) ) ( not ( = ?auto_175552 ?auto_175557 ) ) ( not ( = ?auto_175552 ?auto_175558 ) ) ( not ( = ?auto_175552 ?auto_175559 ) ) ( not ( = ?auto_175553 ?auto_175554 ) ) ( not ( = ?auto_175553 ?auto_175555 ) ) ( not ( = ?auto_175553 ?auto_175556 ) ) ( not ( = ?auto_175553 ?auto_175557 ) ) ( not ( = ?auto_175553 ?auto_175558 ) ) ( not ( = ?auto_175553 ?auto_175559 ) ) ( not ( = ?auto_175554 ?auto_175555 ) ) ( not ( = ?auto_175554 ?auto_175556 ) ) ( not ( = ?auto_175554 ?auto_175557 ) ) ( not ( = ?auto_175554 ?auto_175558 ) ) ( not ( = ?auto_175554 ?auto_175559 ) ) ( not ( = ?auto_175555 ?auto_175556 ) ) ( not ( = ?auto_175555 ?auto_175557 ) ) ( not ( = ?auto_175555 ?auto_175558 ) ) ( not ( = ?auto_175555 ?auto_175559 ) ) ( not ( = ?auto_175556 ?auto_175557 ) ) ( not ( = ?auto_175556 ?auto_175558 ) ) ( not ( = ?auto_175556 ?auto_175559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175557 ?auto_175558 ?auto_175559 )
      ( MAKE-8CRATE-VERIFY ?auto_175551 ?auto_175552 ?auto_175553 ?auto_175554 ?auto_175555 ?auto_175556 ?auto_175557 ?auto_175558 ?auto_175559 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175643 - SURFACE
      ?auto_175644 - SURFACE
      ?auto_175645 - SURFACE
      ?auto_175646 - SURFACE
      ?auto_175647 - SURFACE
      ?auto_175648 - SURFACE
      ?auto_175649 - SURFACE
      ?auto_175650 - SURFACE
      ?auto_175651 - SURFACE
    )
    :vars
    (
      ?auto_175656 - HOIST
      ?auto_175657 - PLACE
      ?auto_175654 - TRUCK
      ?auto_175653 - PLACE
      ?auto_175655 - HOIST
      ?auto_175652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_175656 ?auto_175657 ) ( SURFACE-AT ?auto_175650 ?auto_175657 ) ( CLEAR ?auto_175650 ) ( IS-CRATE ?auto_175651 ) ( not ( = ?auto_175650 ?auto_175651 ) ) ( AVAILABLE ?auto_175656 ) ( ON ?auto_175650 ?auto_175649 ) ( not ( = ?auto_175649 ?auto_175650 ) ) ( not ( = ?auto_175649 ?auto_175651 ) ) ( TRUCK-AT ?auto_175654 ?auto_175653 ) ( not ( = ?auto_175653 ?auto_175657 ) ) ( HOIST-AT ?auto_175655 ?auto_175653 ) ( not ( = ?auto_175656 ?auto_175655 ) ) ( AVAILABLE ?auto_175655 ) ( SURFACE-AT ?auto_175651 ?auto_175653 ) ( ON ?auto_175651 ?auto_175652 ) ( CLEAR ?auto_175651 ) ( not ( = ?auto_175650 ?auto_175652 ) ) ( not ( = ?auto_175651 ?auto_175652 ) ) ( not ( = ?auto_175649 ?auto_175652 ) ) ( ON ?auto_175644 ?auto_175643 ) ( ON ?auto_175645 ?auto_175644 ) ( ON ?auto_175646 ?auto_175645 ) ( ON ?auto_175647 ?auto_175646 ) ( ON ?auto_175648 ?auto_175647 ) ( ON ?auto_175649 ?auto_175648 ) ( not ( = ?auto_175643 ?auto_175644 ) ) ( not ( = ?auto_175643 ?auto_175645 ) ) ( not ( = ?auto_175643 ?auto_175646 ) ) ( not ( = ?auto_175643 ?auto_175647 ) ) ( not ( = ?auto_175643 ?auto_175648 ) ) ( not ( = ?auto_175643 ?auto_175649 ) ) ( not ( = ?auto_175643 ?auto_175650 ) ) ( not ( = ?auto_175643 ?auto_175651 ) ) ( not ( = ?auto_175643 ?auto_175652 ) ) ( not ( = ?auto_175644 ?auto_175645 ) ) ( not ( = ?auto_175644 ?auto_175646 ) ) ( not ( = ?auto_175644 ?auto_175647 ) ) ( not ( = ?auto_175644 ?auto_175648 ) ) ( not ( = ?auto_175644 ?auto_175649 ) ) ( not ( = ?auto_175644 ?auto_175650 ) ) ( not ( = ?auto_175644 ?auto_175651 ) ) ( not ( = ?auto_175644 ?auto_175652 ) ) ( not ( = ?auto_175645 ?auto_175646 ) ) ( not ( = ?auto_175645 ?auto_175647 ) ) ( not ( = ?auto_175645 ?auto_175648 ) ) ( not ( = ?auto_175645 ?auto_175649 ) ) ( not ( = ?auto_175645 ?auto_175650 ) ) ( not ( = ?auto_175645 ?auto_175651 ) ) ( not ( = ?auto_175645 ?auto_175652 ) ) ( not ( = ?auto_175646 ?auto_175647 ) ) ( not ( = ?auto_175646 ?auto_175648 ) ) ( not ( = ?auto_175646 ?auto_175649 ) ) ( not ( = ?auto_175646 ?auto_175650 ) ) ( not ( = ?auto_175646 ?auto_175651 ) ) ( not ( = ?auto_175646 ?auto_175652 ) ) ( not ( = ?auto_175647 ?auto_175648 ) ) ( not ( = ?auto_175647 ?auto_175649 ) ) ( not ( = ?auto_175647 ?auto_175650 ) ) ( not ( = ?auto_175647 ?auto_175651 ) ) ( not ( = ?auto_175647 ?auto_175652 ) ) ( not ( = ?auto_175648 ?auto_175649 ) ) ( not ( = ?auto_175648 ?auto_175650 ) ) ( not ( = ?auto_175648 ?auto_175651 ) ) ( not ( = ?auto_175648 ?auto_175652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175649 ?auto_175650 ?auto_175651 )
      ( MAKE-8CRATE-VERIFY ?auto_175643 ?auto_175644 ?auto_175645 ?auto_175646 ?auto_175647 ?auto_175648 ?auto_175649 ?auto_175650 ?auto_175651 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175736 - SURFACE
      ?auto_175737 - SURFACE
      ?auto_175738 - SURFACE
      ?auto_175739 - SURFACE
      ?auto_175740 - SURFACE
      ?auto_175741 - SURFACE
      ?auto_175742 - SURFACE
      ?auto_175743 - SURFACE
      ?auto_175744 - SURFACE
    )
    :vars
    (
      ?auto_175746 - HOIST
      ?auto_175745 - PLACE
      ?auto_175747 - PLACE
      ?auto_175750 - HOIST
      ?auto_175749 - SURFACE
      ?auto_175748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175746 ?auto_175745 ) ( SURFACE-AT ?auto_175743 ?auto_175745 ) ( CLEAR ?auto_175743 ) ( IS-CRATE ?auto_175744 ) ( not ( = ?auto_175743 ?auto_175744 ) ) ( AVAILABLE ?auto_175746 ) ( ON ?auto_175743 ?auto_175742 ) ( not ( = ?auto_175742 ?auto_175743 ) ) ( not ( = ?auto_175742 ?auto_175744 ) ) ( not ( = ?auto_175747 ?auto_175745 ) ) ( HOIST-AT ?auto_175750 ?auto_175747 ) ( not ( = ?auto_175746 ?auto_175750 ) ) ( AVAILABLE ?auto_175750 ) ( SURFACE-AT ?auto_175744 ?auto_175747 ) ( ON ?auto_175744 ?auto_175749 ) ( CLEAR ?auto_175744 ) ( not ( = ?auto_175743 ?auto_175749 ) ) ( not ( = ?auto_175744 ?auto_175749 ) ) ( not ( = ?auto_175742 ?auto_175749 ) ) ( TRUCK-AT ?auto_175748 ?auto_175745 ) ( ON ?auto_175737 ?auto_175736 ) ( ON ?auto_175738 ?auto_175737 ) ( ON ?auto_175739 ?auto_175738 ) ( ON ?auto_175740 ?auto_175739 ) ( ON ?auto_175741 ?auto_175740 ) ( ON ?auto_175742 ?auto_175741 ) ( not ( = ?auto_175736 ?auto_175737 ) ) ( not ( = ?auto_175736 ?auto_175738 ) ) ( not ( = ?auto_175736 ?auto_175739 ) ) ( not ( = ?auto_175736 ?auto_175740 ) ) ( not ( = ?auto_175736 ?auto_175741 ) ) ( not ( = ?auto_175736 ?auto_175742 ) ) ( not ( = ?auto_175736 ?auto_175743 ) ) ( not ( = ?auto_175736 ?auto_175744 ) ) ( not ( = ?auto_175736 ?auto_175749 ) ) ( not ( = ?auto_175737 ?auto_175738 ) ) ( not ( = ?auto_175737 ?auto_175739 ) ) ( not ( = ?auto_175737 ?auto_175740 ) ) ( not ( = ?auto_175737 ?auto_175741 ) ) ( not ( = ?auto_175737 ?auto_175742 ) ) ( not ( = ?auto_175737 ?auto_175743 ) ) ( not ( = ?auto_175737 ?auto_175744 ) ) ( not ( = ?auto_175737 ?auto_175749 ) ) ( not ( = ?auto_175738 ?auto_175739 ) ) ( not ( = ?auto_175738 ?auto_175740 ) ) ( not ( = ?auto_175738 ?auto_175741 ) ) ( not ( = ?auto_175738 ?auto_175742 ) ) ( not ( = ?auto_175738 ?auto_175743 ) ) ( not ( = ?auto_175738 ?auto_175744 ) ) ( not ( = ?auto_175738 ?auto_175749 ) ) ( not ( = ?auto_175739 ?auto_175740 ) ) ( not ( = ?auto_175739 ?auto_175741 ) ) ( not ( = ?auto_175739 ?auto_175742 ) ) ( not ( = ?auto_175739 ?auto_175743 ) ) ( not ( = ?auto_175739 ?auto_175744 ) ) ( not ( = ?auto_175739 ?auto_175749 ) ) ( not ( = ?auto_175740 ?auto_175741 ) ) ( not ( = ?auto_175740 ?auto_175742 ) ) ( not ( = ?auto_175740 ?auto_175743 ) ) ( not ( = ?auto_175740 ?auto_175744 ) ) ( not ( = ?auto_175740 ?auto_175749 ) ) ( not ( = ?auto_175741 ?auto_175742 ) ) ( not ( = ?auto_175741 ?auto_175743 ) ) ( not ( = ?auto_175741 ?auto_175744 ) ) ( not ( = ?auto_175741 ?auto_175749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175742 ?auto_175743 ?auto_175744 )
      ( MAKE-8CRATE-VERIFY ?auto_175736 ?auto_175737 ?auto_175738 ?auto_175739 ?auto_175740 ?auto_175741 ?auto_175742 ?auto_175743 ?auto_175744 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175829 - SURFACE
      ?auto_175830 - SURFACE
      ?auto_175831 - SURFACE
      ?auto_175832 - SURFACE
      ?auto_175833 - SURFACE
      ?auto_175834 - SURFACE
      ?auto_175835 - SURFACE
      ?auto_175836 - SURFACE
      ?auto_175837 - SURFACE
    )
    :vars
    (
      ?auto_175841 - HOIST
      ?auto_175843 - PLACE
      ?auto_175838 - PLACE
      ?auto_175842 - HOIST
      ?auto_175840 - SURFACE
      ?auto_175839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175841 ?auto_175843 ) ( IS-CRATE ?auto_175837 ) ( not ( = ?auto_175836 ?auto_175837 ) ) ( not ( = ?auto_175835 ?auto_175836 ) ) ( not ( = ?auto_175835 ?auto_175837 ) ) ( not ( = ?auto_175838 ?auto_175843 ) ) ( HOIST-AT ?auto_175842 ?auto_175838 ) ( not ( = ?auto_175841 ?auto_175842 ) ) ( AVAILABLE ?auto_175842 ) ( SURFACE-AT ?auto_175837 ?auto_175838 ) ( ON ?auto_175837 ?auto_175840 ) ( CLEAR ?auto_175837 ) ( not ( = ?auto_175836 ?auto_175840 ) ) ( not ( = ?auto_175837 ?auto_175840 ) ) ( not ( = ?auto_175835 ?auto_175840 ) ) ( TRUCK-AT ?auto_175839 ?auto_175843 ) ( SURFACE-AT ?auto_175835 ?auto_175843 ) ( CLEAR ?auto_175835 ) ( LIFTING ?auto_175841 ?auto_175836 ) ( IS-CRATE ?auto_175836 ) ( ON ?auto_175830 ?auto_175829 ) ( ON ?auto_175831 ?auto_175830 ) ( ON ?auto_175832 ?auto_175831 ) ( ON ?auto_175833 ?auto_175832 ) ( ON ?auto_175834 ?auto_175833 ) ( ON ?auto_175835 ?auto_175834 ) ( not ( = ?auto_175829 ?auto_175830 ) ) ( not ( = ?auto_175829 ?auto_175831 ) ) ( not ( = ?auto_175829 ?auto_175832 ) ) ( not ( = ?auto_175829 ?auto_175833 ) ) ( not ( = ?auto_175829 ?auto_175834 ) ) ( not ( = ?auto_175829 ?auto_175835 ) ) ( not ( = ?auto_175829 ?auto_175836 ) ) ( not ( = ?auto_175829 ?auto_175837 ) ) ( not ( = ?auto_175829 ?auto_175840 ) ) ( not ( = ?auto_175830 ?auto_175831 ) ) ( not ( = ?auto_175830 ?auto_175832 ) ) ( not ( = ?auto_175830 ?auto_175833 ) ) ( not ( = ?auto_175830 ?auto_175834 ) ) ( not ( = ?auto_175830 ?auto_175835 ) ) ( not ( = ?auto_175830 ?auto_175836 ) ) ( not ( = ?auto_175830 ?auto_175837 ) ) ( not ( = ?auto_175830 ?auto_175840 ) ) ( not ( = ?auto_175831 ?auto_175832 ) ) ( not ( = ?auto_175831 ?auto_175833 ) ) ( not ( = ?auto_175831 ?auto_175834 ) ) ( not ( = ?auto_175831 ?auto_175835 ) ) ( not ( = ?auto_175831 ?auto_175836 ) ) ( not ( = ?auto_175831 ?auto_175837 ) ) ( not ( = ?auto_175831 ?auto_175840 ) ) ( not ( = ?auto_175832 ?auto_175833 ) ) ( not ( = ?auto_175832 ?auto_175834 ) ) ( not ( = ?auto_175832 ?auto_175835 ) ) ( not ( = ?auto_175832 ?auto_175836 ) ) ( not ( = ?auto_175832 ?auto_175837 ) ) ( not ( = ?auto_175832 ?auto_175840 ) ) ( not ( = ?auto_175833 ?auto_175834 ) ) ( not ( = ?auto_175833 ?auto_175835 ) ) ( not ( = ?auto_175833 ?auto_175836 ) ) ( not ( = ?auto_175833 ?auto_175837 ) ) ( not ( = ?auto_175833 ?auto_175840 ) ) ( not ( = ?auto_175834 ?auto_175835 ) ) ( not ( = ?auto_175834 ?auto_175836 ) ) ( not ( = ?auto_175834 ?auto_175837 ) ) ( not ( = ?auto_175834 ?auto_175840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175835 ?auto_175836 ?auto_175837 )
      ( MAKE-8CRATE-VERIFY ?auto_175829 ?auto_175830 ?auto_175831 ?auto_175832 ?auto_175833 ?auto_175834 ?auto_175835 ?auto_175836 ?auto_175837 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_175922 - SURFACE
      ?auto_175923 - SURFACE
      ?auto_175924 - SURFACE
      ?auto_175925 - SURFACE
      ?auto_175926 - SURFACE
      ?auto_175927 - SURFACE
      ?auto_175928 - SURFACE
      ?auto_175929 - SURFACE
      ?auto_175930 - SURFACE
    )
    :vars
    (
      ?auto_175935 - HOIST
      ?auto_175932 - PLACE
      ?auto_175931 - PLACE
      ?auto_175933 - HOIST
      ?auto_175936 - SURFACE
      ?auto_175934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175935 ?auto_175932 ) ( IS-CRATE ?auto_175930 ) ( not ( = ?auto_175929 ?auto_175930 ) ) ( not ( = ?auto_175928 ?auto_175929 ) ) ( not ( = ?auto_175928 ?auto_175930 ) ) ( not ( = ?auto_175931 ?auto_175932 ) ) ( HOIST-AT ?auto_175933 ?auto_175931 ) ( not ( = ?auto_175935 ?auto_175933 ) ) ( AVAILABLE ?auto_175933 ) ( SURFACE-AT ?auto_175930 ?auto_175931 ) ( ON ?auto_175930 ?auto_175936 ) ( CLEAR ?auto_175930 ) ( not ( = ?auto_175929 ?auto_175936 ) ) ( not ( = ?auto_175930 ?auto_175936 ) ) ( not ( = ?auto_175928 ?auto_175936 ) ) ( TRUCK-AT ?auto_175934 ?auto_175932 ) ( SURFACE-AT ?auto_175928 ?auto_175932 ) ( CLEAR ?auto_175928 ) ( IS-CRATE ?auto_175929 ) ( AVAILABLE ?auto_175935 ) ( IN ?auto_175929 ?auto_175934 ) ( ON ?auto_175923 ?auto_175922 ) ( ON ?auto_175924 ?auto_175923 ) ( ON ?auto_175925 ?auto_175924 ) ( ON ?auto_175926 ?auto_175925 ) ( ON ?auto_175927 ?auto_175926 ) ( ON ?auto_175928 ?auto_175927 ) ( not ( = ?auto_175922 ?auto_175923 ) ) ( not ( = ?auto_175922 ?auto_175924 ) ) ( not ( = ?auto_175922 ?auto_175925 ) ) ( not ( = ?auto_175922 ?auto_175926 ) ) ( not ( = ?auto_175922 ?auto_175927 ) ) ( not ( = ?auto_175922 ?auto_175928 ) ) ( not ( = ?auto_175922 ?auto_175929 ) ) ( not ( = ?auto_175922 ?auto_175930 ) ) ( not ( = ?auto_175922 ?auto_175936 ) ) ( not ( = ?auto_175923 ?auto_175924 ) ) ( not ( = ?auto_175923 ?auto_175925 ) ) ( not ( = ?auto_175923 ?auto_175926 ) ) ( not ( = ?auto_175923 ?auto_175927 ) ) ( not ( = ?auto_175923 ?auto_175928 ) ) ( not ( = ?auto_175923 ?auto_175929 ) ) ( not ( = ?auto_175923 ?auto_175930 ) ) ( not ( = ?auto_175923 ?auto_175936 ) ) ( not ( = ?auto_175924 ?auto_175925 ) ) ( not ( = ?auto_175924 ?auto_175926 ) ) ( not ( = ?auto_175924 ?auto_175927 ) ) ( not ( = ?auto_175924 ?auto_175928 ) ) ( not ( = ?auto_175924 ?auto_175929 ) ) ( not ( = ?auto_175924 ?auto_175930 ) ) ( not ( = ?auto_175924 ?auto_175936 ) ) ( not ( = ?auto_175925 ?auto_175926 ) ) ( not ( = ?auto_175925 ?auto_175927 ) ) ( not ( = ?auto_175925 ?auto_175928 ) ) ( not ( = ?auto_175925 ?auto_175929 ) ) ( not ( = ?auto_175925 ?auto_175930 ) ) ( not ( = ?auto_175925 ?auto_175936 ) ) ( not ( = ?auto_175926 ?auto_175927 ) ) ( not ( = ?auto_175926 ?auto_175928 ) ) ( not ( = ?auto_175926 ?auto_175929 ) ) ( not ( = ?auto_175926 ?auto_175930 ) ) ( not ( = ?auto_175926 ?auto_175936 ) ) ( not ( = ?auto_175927 ?auto_175928 ) ) ( not ( = ?auto_175927 ?auto_175929 ) ) ( not ( = ?auto_175927 ?auto_175930 ) ) ( not ( = ?auto_175927 ?auto_175936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_175928 ?auto_175929 ?auto_175930 )
      ( MAKE-8CRATE-VERIFY ?auto_175922 ?auto_175923 ?auto_175924 ?auto_175925 ?auto_175926 ?auto_175927 ?auto_175928 ?auto_175929 ?auto_175930 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180038 - SURFACE
      ?auto_180039 - SURFACE
      ?auto_180040 - SURFACE
      ?auto_180041 - SURFACE
      ?auto_180042 - SURFACE
      ?auto_180043 - SURFACE
      ?auto_180044 - SURFACE
      ?auto_180045 - SURFACE
      ?auto_180046 - SURFACE
      ?auto_180047 - SURFACE
    )
    :vars
    (
      ?auto_180049 - HOIST
      ?auto_180048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_180049 ?auto_180048 ) ( SURFACE-AT ?auto_180046 ?auto_180048 ) ( CLEAR ?auto_180046 ) ( LIFTING ?auto_180049 ?auto_180047 ) ( IS-CRATE ?auto_180047 ) ( not ( = ?auto_180046 ?auto_180047 ) ) ( ON ?auto_180039 ?auto_180038 ) ( ON ?auto_180040 ?auto_180039 ) ( ON ?auto_180041 ?auto_180040 ) ( ON ?auto_180042 ?auto_180041 ) ( ON ?auto_180043 ?auto_180042 ) ( ON ?auto_180044 ?auto_180043 ) ( ON ?auto_180045 ?auto_180044 ) ( ON ?auto_180046 ?auto_180045 ) ( not ( = ?auto_180038 ?auto_180039 ) ) ( not ( = ?auto_180038 ?auto_180040 ) ) ( not ( = ?auto_180038 ?auto_180041 ) ) ( not ( = ?auto_180038 ?auto_180042 ) ) ( not ( = ?auto_180038 ?auto_180043 ) ) ( not ( = ?auto_180038 ?auto_180044 ) ) ( not ( = ?auto_180038 ?auto_180045 ) ) ( not ( = ?auto_180038 ?auto_180046 ) ) ( not ( = ?auto_180038 ?auto_180047 ) ) ( not ( = ?auto_180039 ?auto_180040 ) ) ( not ( = ?auto_180039 ?auto_180041 ) ) ( not ( = ?auto_180039 ?auto_180042 ) ) ( not ( = ?auto_180039 ?auto_180043 ) ) ( not ( = ?auto_180039 ?auto_180044 ) ) ( not ( = ?auto_180039 ?auto_180045 ) ) ( not ( = ?auto_180039 ?auto_180046 ) ) ( not ( = ?auto_180039 ?auto_180047 ) ) ( not ( = ?auto_180040 ?auto_180041 ) ) ( not ( = ?auto_180040 ?auto_180042 ) ) ( not ( = ?auto_180040 ?auto_180043 ) ) ( not ( = ?auto_180040 ?auto_180044 ) ) ( not ( = ?auto_180040 ?auto_180045 ) ) ( not ( = ?auto_180040 ?auto_180046 ) ) ( not ( = ?auto_180040 ?auto_180047 ) ) ( not ( = ?auto_180041 ?auto_180042 ) ) ( not ( = ?auto_180041 ?auto_180043 ) ) ( not ( = ?auto_180041 ?auto_180044 ) ) ( not ( = ?auto_180041 ?auto_180045 ) ) ( not ( = ?auto_180041 ?auto_180046 ) ) ( not ( = ?auto_180041 ?auto_180047 ) ) ( not ( = ?auto_180042 ?auto_180043 ) ) ( not ( = ?auto_180042 ?auto_180044 ) ) ( not ( = ?auto_180042 ?auto_180045 ) ) ( not ( = ?auto_180042 ?auto_180046 ) ) ( not ( = ?auto_180042 ?auto_180047 ) ) ( not ( = ?auto_180043 ?auto_180044 ) ) ( not ( = ?auto_180043 ?auto_180045 ) ) ( not ( = ?auto_180043 ?auto_180046 ) ) ( not ( = ?auto_180043 ?auto_180047 ) ) ( not ( = ?auto_180044 ?auto_180045 ) ) ( not ( = ?auto_180044 ?auto_180046 ) ) ( not ( = ?auto_180044 ?auto_180047 ) ) ( not ( = ?auto_180045 ?auto_180046 ) ) ( not ( = ?auto_180045 ?auto_180047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_180046 ?auto_180047 )
      ( MAKE-9CRATE-VERIFY ?auto_180038 ?auto_180039 ?auto_180040 ?auto_180041 ?auto_180042 ?auto_180043 ?auto_180044 ?auto_180045 ?auto_180046 ?auto_180047 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180118 - SURFACE
      ?auto_180119 - SURFACE
      ?auto_180120 - SURFACE
      ?auto_180121 - SURFACE
      ?auto_180122 - SURFACE
      ?auto_180123 - SURFACE
      ?auto_180124 - SURFACE
      ?auto_180125 - SURFACE
      ?auto_180126 - SURFACE
      ?auto_180127 - SURFACE
    )
    :vars
    (
      ?auto_180129 - HOIST
      ?auto_180130 - PLACE
      ?auto_180128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180129 ?auto_180130 ) ( SURFACE-AT ?auto_180126 ?auto_180130 ) ( CLEAR ?auto_180126 ) ( IS-CRATE ?auto_180127 ) ( not ( = ?auto_180126 ?auto_180127 ) ) ( TRUCK-AT ?auto_180128 ?auto_180130 ) ( AVAILABLE ?auto_180129 ) ( IN ?auto_180127 ?auto_180128 ) ( ON ?auto_180126 ?auto_180125 ) ( not ( = ?auto_180125 ?auto_180126 ) ) ( not ( = ?auto_180125 ?auto_180127 ) ) ( ON ?auto_180119 ?auto_180118 ) ( ON ?auto_180120 ?auto_180119 ) ( ON ?auto_180121 ?auto_180120 ) ( ON ?auto_180122 ?auto_180121 ) ( ON ?auto_180123 ?auto_180122 ) ( ON ?auto_180124 ?auto_180123 ) ( ON ?auto_180125 ?auto_180124 ) ( not ( = ?auto_180118 ?auto_180119 ) ) ( not ( = ?auto_180118 ?auto_180120 ) ) ( not ( = ?auto_180118 ?auto_180121 ) ) ( not ( = ?auto_180118 ?auto_180122 ) ) ( not ( = ?auto_180118 ?auto_180123 ) ) ( not ( = ?auto_180118 ?auto_180124 ) ) ( not ( = ?auto_180118 ?auto_180125 ) ) ( not ( = ?auto_180118 ?auto_180126 ) ) ( not ( = ?auto_180118 ?auto_180127 ) ) ( not ( = ?auto_180119 ?auto_180120 ) ) ( not ( = ?auto_180119 ?auto_180121 ) ) ( not ( = ?auto_180119 ?auto_180122 ) ) ( not ( = ?auto_180119 ?auto_180123 ) ) ( not ( = ?auto_180119 ?auto_180124 ) ) ( not ( = ?auto_180119 ?auto_180125 ) ) ( not ( = ?auto_180119 ?auto_180126 ) ) ( not ( = ?auto_180119 ?auto_180127 ) ) ( not ( = ?auto_180120 ?auto_180121 ) ) ( not ( = ?auto_180120 ?auto_180122 ) ) ( not ( = ?auto_180120 ?auto_180123 ) ) ( not ( = ?auto_180120 ?auto_180124 ) ) ( not ( = ?auto_180120 ?auto_180125 ) ) ( not ( = ?auto_180120 ?auto_180126 ) ) ( not ( = ?auto_180120 ?auto_180127 ) ) ( not ( = ?auto_180121 ?auto_180122 ) ) ( not ( = ?auto_180121 ?auto_180123 ) ) ( not ( = ?auto_180121 ?auto_180124 ) ) ( not ( = ?auto_180121 ?auto_180125 ) ) ( not ( = ?auto_180121 ?auto_180126 ) ) ( not ( = ?auto_180121 ?auto_180127 ) ) ( not ( = ?auto_180122 ?auto_180123 ) ) ( not ( = ?auto_180122 ?auto_180124 ) ) ( not ( = ?auto_180122 ?auto_180125 ) ) ( not ( = ?auto_180122 ?auto_180126 ) ) ( not ( = ?auto_180122 ?auto_180127 ) ) ( not ( = ?auto_180123 ?auto_180124 ) ) ( not ( = ?auto_180123 ?auto_180125 ) ) ( not ( = ?auto_180123 ?auto_180126 ) ) ( not ( = ?auto_180123 ?auto_180127 ) ) ( not ( = ?auto_180124 ?auto_180125 ) ) ( not ( = ?auto_180124 ?auto_180126 ) ) ( not ( = ?auto_180124 ?auto_180127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180125 ?auto_180126 ?auto_180127 )
      ( MAKE-9CRATE-VERIFY ?auto_180118 ?auto_180119 ?auto_180120 ?auto_180121 ?auto_180122 ?auto_180123 ?auto_180124 ?auto_180125 ?auto_180126 ?auto_180127 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180208 - SURFACE
      ?auto_180209 - SURFACE
      ?auto_180210 - SURFACE
      ?auto_180211 - SURFACE
      ?auto_180212 - SURFACE
      ?auto_180213 - SURFACE
      ?auto_180214 - SURFACE
      ?auto_180215 - SURFACE
      ?auto_180216 - SURFACE
      ?auto_180217 - SURFACE
    )
    :vars
    (
      ?auto_180221 - HOIST
      ?auto_180220 - PLACE
      ?auto_180219 - TRUCK
      ?auto_180218 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_180221 ?auto_180220 ) ( SURFACE-AT ?auto_180216 ?auto_180220 ) ( CLEAR ?auto_180216 ) ( IS-CRATE ?auto_180217 ) ( not ( = ?auto_180216 ?auto_180217 ) ) ( AVAILABLE ?auto_180221 ) ( IN ?auto_180217 ?auto_180219 ) ( ON ?auto_180216 ?auto_180215 ) ( not ( = ?auto_180215 ?auto_180216 ) ) ( not ( = ?auto_180215 ?auto_180217 ) ) ( TRUCK-AT ?auto_180219 ?auto_180218 ) ( not ( = ?auto_180218 ?auto_180220 ) ) ( ON ?auto_180209 ?auto_180208 ) ( ON ?auto_180210 ?auto_180209 ) ( ON ?auto_180211 ?auto_180210 ) ( ON ?auto_180212 ?auto_180211 ) ( ON ?auto_180213 ?auto_180212 ) ( ON ?auto_180214 ?auto_180213 ) ( ON ?auto_180215 ?auto_180214 ) ( not ( = ?auto_180208 ?auto_180209 ) ) ( not ( = ?auto_180208 ?auto_180210 ) ) ( not ( = ?auto_180208 ?auto_180211 ) ) ( not ( = ?auto_180208 ?auto_180212 ) ) ( not ( = ?auto_180208 ?auto_180213 ) ) ( not ( = ?auto_180208 ?auto_180214 ) ) ( not ( = ?auto_180208 ?auto_180215 ) ) ( not ( = ?auto_180208 ?auto_180216 ) ) ( not ( = ?auto_180208 ?auto_180217 ) ) ( not ( = ?auto_180209 ?auto_180210 ) ) ( not ( = ?auto_180209 ?auto_180211 ) ) ( not ( = ?auto_180209 ?auto_180212 ) ) ( not ( = ?auto_180209 ?auto_180213 ) ) ( not ( = ?auto_180209 ?auto_180214 ) ) ( not ( = ?auto_180209 ?auto_180215 ) ) ( not ( = ?auto_180209 ?auto_180216 ) ) ( not ( = ?auto_180209 ?auto_180217 ) ) ( not ( = ?auto_180210 ?auto_180211 ) ) ( not ( = ?auto_180210 ?auto_180212 ) ) ( not ( = ?auto_180210 ?auto_180213 ) ) ( not ( = ?auto_180210 ?auto_180214 ) ) ( not ( = ?auto_180210 ?auto_180215 ) ) ( not ( = ?auto_180210 ?auto_180216 ) ) ( not ( = ?auto_180210 ?auto_180217 ) ) ( not ( = ?auto_180211 ?auto_180212 ) ) ( not ( = ?auto_180211 ?auto_180213 ) ) ( not ( = ?auto_180211 ?auto_180214 ) ) ( not ( = ?auto_180211 ?auto_180215 ) ) ( not ( = ?auto_180211 ?auto_180216 ) ) ( not ( = ?auto_180211 ?auto_180217 ) ) ( not ( = ?auto_180212 ?auto_180213 ) ) ( not ( = ?auto_180212 ?auto_180214 ) ) ( not ( = ?auto_180212 ?auto_180215 ) ) ( not ( = ?auto_180212 ?auto_180216 ) ) ( not ( = ?auto_180212 ?auto_180217 ) ) ( not ( = ?auto_180213 ?auto_180214 ) ) ( not ( = ?auto_180213 ?auto_180215 ) ) ( not ( = ?auto_180213 ?auto_180216 ) ) ( not ( = ?auto_180213 ?auto_180217 ) ) ( not ( = ?auto_180214 ?auto_180215 ) ) ( not ( = ?auto_180214 ?auto_180216 ) ) ( not ( = ?auto_180214 ?auto_180217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180215 ?auto_180216 ?auto_180217 )
      ( MAKE-9CRATE-VERIFY ?auto_180208 ?auto_180209 ?auto_180210 ?auto_180211 ?auto_180212 ?auto_180213 ?auto_180214 ?auto_180215 ?auto_180216 ?auto_180217 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180307 - SURFACE
      ?auto_180308 - SURFACE
      ?auto_180309 - SURFACE
      ?auto_180310 - SURFACE
      ?auto_180311 - SURFACE
      ?auto_180312 - SURFACE
      ?auto_180313 - SURFACE
      ?auto_180314 - SURFACE
      ?auto_180315 - SURFACE
      ?auto_180316 - SURFACE
    )
    :vars
    (
      ?auto_180320 - HOIST
      ?auto_180319 - PLACE
      ?auto_180318 - TRUCK
      ?auto_180321 - PLACE
      ?auto_180317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_180320 ?auto_180319 ) ( SURFACE-AT ?auto_180315 ?auto_180319 ) ( CLEAR ?auto_180315 ) ( IS-CRATE ?auto_180316 ) ( not ( = ?auto_180315 ?auto_180316 ) ) ( AVAILABLE ?auto_180320 ) ( ON ?auto_180315 ?auto_180314 ) ( not ( = ?auto_180314 ?auto_180315 ) ) ( not ( = ?auto_180314 ?auto_180316 ) ) ( TRUCK-AT ?auto_180318 ?auto_180321 ) ( not ( = ?auto_180321 ?auto_180319 ) ) ( HOIST-AT ?auto_180317 ?auto_180321 ) ( LIFTING ?auto_180317 ?auto_180316 ) ( not ( = ?auto_180320 ?auto_180317 ) ) ( ON ?auto_180308 ?auto_180307 ) ( ON ?auto_180309 ?auto_180308 ) ( ON ?auto_180310 ?auto_180309 ) ( ON ?auto_180311 ?auto_180310 ) ( ON ?auto_180312 ?auto_180311 ) ( ON ?auto_180313 ?auto_180312 ) ( ON ?auto_180314 ?auto_180313 ) ( not ( = ?auto_180307 ?auto_180308 ) ) ( not ( = ?auto_180307 ?auto_180309 ) ) ( not ( = ?auto_180307 ?auto_180310 ) ) ( not ( = ?auto_180307 ?auto_180311 ) ) ( not ( = ?auto_180307 ?auto_180312 ) ) ( not ( = ?auto_180307 ?auto_180313 ) ) ( not ( = ?auto_180307 ?auto_180314 ) ) ( not ( = ?auto_180307 ?auto_180315 ) ) ( not ( = ?auto_180307 ?auto_180316 ) ) ( not ( = ?auto_180308 ?auto_180309 ) ) ( not ( = ?auto_180308 ?auto_180310 ) ) ( not ( = ?auto_180308 ?auto_180311 ) ) ( not ( = ?auto_180308 ?auto_180312 ) ) ( not ( = ?auto_180308 ?auto_180313 ) ) ( not ( = ?auto_180308 ?auto_180314 ) ) ( not ( = ?auto_180308 ?auto_180315 ) ) ( not ( = ?auto_180308 ?auto_180316 ) ) ( not ( = ?auto_180309 ?auto_180310 ) ) ( not ( = ?auto_180309 ?auto_180311 ) ) ( not ( = ?auto_180309 ?auto_180312 ) ) ( not ( = ?auto_180309 ?auto_180313 ) ) ( not ( = ?auto_180309 ?auto_180314 ) ) ( not ( = ?auto_180309 ?auto_180315 ) ) ( not ( = ?auto_180309 ?auto_180316 ) ) ( not ( = ?auto_180310 ?auto_180311 ) ) ( not ( = ?auto_180310 ?auto_180312 ) ) ( not ( = ?auto_180310 ?auto_180313 ) ) ( not ( = ?auto_180310 ?auto_180314 ) ) ( not ( = ?auto_180310 ?auto_180315 ) ) ( not ( = ?auto_180310 ?auto_180316 ) ) ( not ( = ?auto_180311 ?auto_180312 ) ) ( not ( = ?auto_180311 ?auto_180313 ) ) ( not ( = ?auto_180311 ?auto_180314 ) ) ( not ( = ?auto_180311 ?auto_180315 ) ) ( not ( = ?auto_180311 ?auto_180316 ) ) ( not ( = ?auto_180312 ?auto_180313 ) ) ( not ( = ?auto_180312 ?auto_180314 ) ) ( not ( = ?auto_180312 ?auto_180315 ) ) ( not ( = ?auto_180312 ?auto_180316 ) ) ( not ( = ?auto_180313 ?auto_180314 ) ) ( not ( = ?auto_180313 ?auto_180315 ) ) ( not ( = ?auto_180313 ?auto_180316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180314 ?auto_180315 ?auto_180316 )
      ( MAKE-9CRATE-VERIFY ?auto_180307 ?auto_180308 ?auto_180309 ?auto_180310 ?auto_180311 ?auto_180312 ?auto_180313 ?auto_180314 ?auto_180315 ?auto_180316 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180415 - SURFACE
      ?auto_180416 - SURFACE
      ?auto_180417 - SURFACE
      ?auto_180418 - SURFACE
      ?auto_180419 - SURFACE
      ?auto_180420 - SURFACE
      ?auto_180421 - SURFACE
      ?auto_180422 - SURFACE
      ?auto_180423 - SURFACE
      ?auto_180424 - SURFACE
    )
    :vars
    (
      ?auto_180428 - HOIST
      ?auto_180430 - PLACE
      ?auto_180425 - TRUCK
      ?auto_180429 - PLACE
      ?auto_180426 - HOIST
      ?auto_180427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_180428 ?auto_180430 ) ( SURFACE-AT ?auto_180423 ?auto_180430 ) ( CLEAR ?auto_180423 ) ( IS-CRATE ?auto_180424 ) ( not ( = ?auto_180423 ?auto_180424 ) ) ( AVAILABLE ?auto_180428 ) ( ON ?auto_180423 ?auto_180422 ) ( not ( = ?auto_180422 ?auto_180423 ) ) ( not ( = ?auto_180422 ?auto_180424 ) ) ( TRUCK-AT ?auto_180425 ?auto_180429 ) ( not ( = ?auto_180429 ?auto_180430 ) ) ( HOIST-AT ?auto_180426 ?auto_180429 ) ( not ( = ?auto_180428 ?auto_180426 ) ) ( AVAILABLE ?auto_180426 ) ( SURFACE-AT ?auto_180424 ?auto_180429 ) ( ON ?auto_180424 ?auto_180427 ) ( CLEAR ?auto_180424 ) ( not ( = ?auto_180423 ?auto_180427 ) ) ( not ( = ?auto_180424 ?auto_180427 ) ) ( not ( = ?auto_180422 ?auto_180427 ) ) ( ON ?auto_180416 ?auto_180415 ) ( ON ?auto_180417 ?auto_180416 ) ( ON ?auto_180418 ?auto_180417 ) ( ON ?auto_180419 ?auto_180418 ) ( ON ?auto_180420 ?auto_180419 ) ( ON ?auto_180421 ?auto_180420 ) ( ON ?auto_180422 ?auto_180421 ) ( not ( = ?auto_180415 ?auto_180416 ) ) ( not ( = ?auto_180415 ?auto_180417 ) ) ( not ( = ?auto_180415 ?auto_180418 ) ) ( not ( = ?auto_180415 ?auto_180419 ) ) ( not ( = ?auto_180415 ?auto_180420 ) ) ( not ( = ?auto_180415 ?auto_180421 ) ) ( not ( = ?auto_180415 ?auto_180422 ) ) ( not ( = ?auto_180415 ?auto_180423 ) ) ( not ( = ?auto_180415 ?auto_180424 ) ) ( not ( = ?auto_180415 ?auto_180427 ) ) ( not ( = ?auto_180416 ?auto_180417 ) ) ( not ( = ?auto_180416 ?auto_180418 ) ) ( not ( = ?auto_180416 ?auto_180419 ) ) ( not ( = ?auto_180416 ?auto_180420 ) ) ( not ( = ?auto_180416 ?auto_180421 ) ) ( not ( = ?auto_180416 ?auto_180422 ) ) ( not ( = ?auto_180416 ?auto_180423 ) ) ( not ( = ?auto_180416 ?auto_180424 ) ) ( not ( = ?auto_180416 ?auto_180427 ) ) ( not ( = ?auto_180417 ?auto_180418 ) ) ( not ( = ?auto_180417 ?auto_180419 ) ) ( not ( = ?auto_180417 ?auto_180420 ) ) ( not ( = ?auto_180417 ?auto_180421 ) ) ( not ( = ?auto_180417 ?auto_180422 ) ) ( not ( = ?auto_180417 ?auto_180423 ) ) ( not ( = ?auto_180417 ?auto_180424 ) ) ( not ( = ?auto_180417 ?auto_180427 ) ) ( not ( = ?auto_180418 ?auto_180419 ) ) ( not ( = ?auto_180418 ?auto_180420 ) ) ( not ( = ?auto_180418 ?auto_180421 ) ) ( not ( = ?auto_180418 ?auto_180422 ) ) ( not ( = ?auto_180418 ?auto_180423 ) ) ( not ( = ?auto_180418 ?auto_180424 ) ) ( not ( = ?auto_180418 ?auto_180427 ) ) ( not ( = ?auto_180419 ?auto_180420 ) ) ( not ( = ?auto_180419 ?auto_180421 ) ) ( not ( = ?auto_180419 ?auto_180422 ) ) ( not ( = ?auto_180419 ?auto_180423 ) ) ( not ( = ?auto_180419 ?auto_180424 ) ) ( not ( = ?auto_180419 ?auto_180427 ) ) ( not ( = ?auto_180420 ?auto_180421 ) ) ( not ( = ?auto_180420 ?auto_180422 ) ) ( not ( = ?auto_180420 ?auto_180423 ) ) ( not ( = ?auto_180420 ?auto_180424 ) ) ( not ( = ?auto_180420 ?auto_180427 ) ) ( not ( = ?auto_180421 ?auto_180422 ) ) ( not ( = ?auto_180421 ?auto_180423 ) ) ( not ( = ?auto_180421 ?auto_180424 ) ) ( not ( = ?auto_180421 ?auto_180427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180422 ?auto_180423 ?auto_180424 )
      ( MAKE-9CRATE-VERIFY ?auto_180415 ?auto_180416 ?auto_180417 ?auto_180418 ?auto_180419 ?auto_180420 ?auto_180421 ?auto_180422 ?auto_180423 ?auto_180424 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180524 - SURFACE
      ?auto_180525 - SURFACE
      ?auto_180526 - SURFACE
      ?auto_180527 - SURFACE
      ?auto_180528 - SURFACE
      ?auto_180529 - SURFACE
      ?auto_180530 - SURFACE
      ?auto_180531 - SURFACE
      ?auto_180532 - SURFACE
      ?auto_180533 - SURFACE
    )
    :vars
    (
      ?auto_180536 - HOIST
      ?auto_180534 - PLACE
      ?auto_180539 - PLACE
      ?auto_180538 - HOIST
      ?auto_180537 - SURFACE
      ?auto_180535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180536 ?auto_180534 ) ( SURFACE-AT ?auto_180532 ?auto_180534 ) ( CLEAR ?auto_180532 ) ( IS-CRATE ?auto_180533 ) ( not ( = ?auto_180532 ?auto_180533 ) ) ( AVAILABLE ?auto_180536 ) ( ON ?auto_180532 ?auto_180531 ) ( not ( = ?auto_180531 ?auto_180532 ) ) ( not ( = ?auto_180531 ?auto_180533 ) ) ( not ( = ?auto_180539 ?auto_180534 ) ) ( HOIST-AT ?auto_180538 ?auto_180539 ) ( not ( = ?auto_180536 ?auto_180538 ) ) ( AVAILABLE ?auto_180538 ) ( SURFACE-AT ?auto_180533 ?auto_180539 ) ( ON ?auto_180533 ?auto_180537 ) ( CLEAR ?auto_180533 ) ( not ( = ?auto_180532 ?auto_180537 ) ) ( not ( = ?auto_180533 ?auto_180537 ) ) ( not ( = ?auto_180531 ?auto_180537 ) ) ( TRUCK-AT ?auto_180535 ?auto_180534 ) ( ON ?auto_180525 ?auto_180524 ) ( ON ?auto_180526 ?auto_180525 ) ( ON ?auto_180527 ?auto_180526 ) ( ON ?auto_180528 ?auto_180527 ) ( ON ?auto_180529 ?auto_180528 ) ( ON ?auto_180530 ?auto_180529 ) ( ON ?auto_180531 ?auto_180530 ) ( not ( = ?auto_180524 ?auto_180525 ) ) ( not ( = ?auto_180524 ?auto_180526 ) ) ( not ( = ?auto_180524 ?auto_180527 ) ) ( not ( = ?auto_180524 ?auto_180528 ) ) ( not ( = ?auto_180524 ?auto_180529 ) ) ( not ( = ?auto_180524 ?auto_180530 ) ) ( not ( = ?auto_180524 ?auto_180531 ) ) ( not ( = ?auto_180524 ?auto_180532 ) ) ( not ( = ?auto_180524 ?auto_180533 ) ) ( not ( = ?auto_180524 ?auto_180537 ) ) ( not ( = ?auto_180525 ?auto_180526 ) ) ( not ( = ?auto_180525 ?auto_180527 ) ) ( not ( = ?auto_180525 ?auto_180528 ) ) ( not ( = ?auto_180525 ?auto_180529 ) ) ( not ( = ?auto_180525 ?auto_180530 ) ) ( not ( = ?auto_180525 ?auto_180531 ) ) ( not ( = ?auto_180525 ?auto_180532 ) ) ( not ( = ?auto_180525 ?auto_180533 ) ) ( not ( = ?auto_180525 ?auto_180537 ) ) ( not ( = ?auto_180526 ?auto_180527 ) ) ( not ( = ?auto_180526 ?auto_180528 ) ) ( not ( = ?auto_180526 ?auto_180529 ) ) ( not ( = ?auto_180526 ?auto_180530 ) ) ( not ( = ?auto_180526 ?auto_180531 ) ) ( not ( = ?auto_180526 ?auto_180532 ) ) ( not ( = ?auto_180526 ?auto_180533 ) ) ( not ( = ?auto_180526 ?auto_180537 ) ) ( not ( = ?auto_180527 ?auto_180528 ) ) ( not ( = ?auto_180527 ?auto_180529 ) ) ( not ( = ?auto_180527 ?auto_180530 ) ) ( not ( = ?auto_180527 ?auto_180531 ) ) ( not ( = ?auto_180527 ?auto_180532 ) ) ( not ( = ?auto_180527 ?auto_180533 ) ) ( not ( = ?auto_180527 ?auto_180537 ) ) ( not ( = ?auto_180528 ?auto_180529 ) ) ( not ( = ?auto_180528 ?auto_180530 ) ) ( not ( = ?auto_180528 ?auto_180531 ) ) ( not ( = ?auto_180528 ?auto_180532 ) ) ( not ( = ?auto_180528 ?auto_180533 ) ) ( not ( = ?auto_180528 ?auto_180537 ) ) ( not ( = ?auto_180529 ?auto_180530 ) ) ( not ( = ?auto_180529 ?auto_180531 ) ) ( not ( = ?auto_180529 ?auto_180532 ) ) ( not ( = ?auto_180529 ?auto_180533 ) ) ( not ( = ?auto_180529 ?auto_180537 ) ) ( not ( = ?auto_180530 ?auto_180531 ) ) ( not ( = ?auto_180530 ?auto_180532 ) ) ( not ( = ?auto_180530 ?auto_180533 ) ) ( not ( = ?auto_180530 ?auto_180537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180531 ?auto_180532 ?auto_180533 )
      ( MAKE-9CRATE-VERIFY ?auto_180524 ?auto_180525 ?auto_180526 ?auto_180527 ?auto_180528 ?auto_180529 ?auto_180530 ?auto_180531 ?auto_180532 ?auto_180533 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180633 - SURFACE
      ?auto_180634 - SURFACE
      ?auto_180635 - SURFACE
      ?auto_180636 - SURFACE
      ?auto_180637 - SURFACE
      ?auto_180638 - SURFACE
      ?auto_180639 - SURFACE
      ?auto_180640 - SURFACE
      ?auto_180641 - SURFACE
      ?auto_180642 - SURFACE
    )
    :vars
    (
      ?auto_180645 - HOIST
      ?auto_180648 - PLACE
      ?auto_180646 - PLACE
      ?auto_180647 - HOIST
      ?auto_180643 - SURFACE
      ?auto_180644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180645 ?auto_180648 ) ( IS-CRATE ?auto_180642 ) ( not ( = ?auto_180641 ?auto_180642 ) ) ( not ( = ?auto_180640 ?auto_180641 ) ) ( not ( = ?auto_180640 ?auto_180642 ) ) ( not ( = ?auto_180646 ?auto_180648 ) ) ( HOIST-AT ?auto_180647 ?auto_180646 ) ( not ( = ?auto_180645 ?auto_180647 ) ) ( AVAILABLE ?auto_180647 ) ( SURFACE-AT ?auto_180642 ?auto_180646 ) ( ON ?auto_180642 ?auto_180643 ) ( CLEAR ?auto_180642 ) ( not ( = ?auto_180641 ?auto_180643 ) ) ( not ( = ?auto_180642 ?auto_180643 ) ) ( not ( = ?auto_180640 ?auto_180643 ) ) ( TRUCK-AT ?auto_180644 ?auto_180648 ) ( SURFACE-AT ?auto_180640 ?auto_180648 ) ( CLEAR ?auto_180640 ) ( LIFTING ?auto_180645 ?auto_180641 ) ( IS-CRATE ?auto_180641 ) ( ON ?auto_180634 ?auto_180633 ) ( ON ?auto_180635 ?auto_180634 ) ( ON ?auto_180636 ?auto_180635 ) ( ON ?auto_180637 ?auto_180636 ) ( ON ?auto_180638 ?auto_180637 ) ( ON ?auto_180639 ?auto_180638 ) ( ON ?auto_180640 ?auto_180639 ) ( not ( = ?auto_180633 ?auto_180634 ) ) ( not ( = ?auto_180633 ?auto_180635 ) ) ( not ( = ?auto_180633 ?auto_180636 ) ) ( not ( = ?auto_180633 ?auto_180637 ) ) ( not ( = ?auto_180633 ?auto_180638 ) ) ( not ( = ?auto_180633 ?auto_180639 ) ) ( not ( = ?auto_180633 ?auto_180640 ) ) ( not ( = ?auto_180633 ?auto_180641 ) ) ( not ( = ?auto_180633 ?auto_180642 ) ) ( not ( = ?auto_180633 ?auto_180643 ) ) ( not ( = ?auto_180634 ?auto_180635 ) ) ( not ( = ?auto_180634 ?auto_180636 ) ) ( not ( = ?auto_180634 ?auto_180637 ) ) ( not ( = ?auto_180634 ?auto_180638 ) ) ( not ( = ?auto_180634 ?auto_180639 ) ) ( not ( = ?auto_180634 ?auto_180640 ) ) ( not ( = ?auto_180634 ?auto_180641 ) ) ( not ( = ?auto_180634 ?auto_180642 ) ) ( not ( = ?auto_180634 ?auto_180643 ) ) ( not ( = ?auto_180635 ?auto_180636 ) ) ( not ( = ?auto_180635 ?auto_180637 ) ) ( not ( = ?auto_180635 ?auto_180638 ) ) ( not ( = ?auto_180635 ?auto_180639 ) ) ( not ( = ?auto_180635 ?auto_180640 ) ) ( not ( = ?auto_180635 ?auto_180641 ) ) ( not ( = ?auto_180635 ?auto_180642 ) ) ( not ( = ?auto_180635 ?auto_180643 ) ) ( not ( = ?auto_180636 ?auto_180637 ) ) ( not ( = ?auto_180636 ?auto_180638 ) ) ( not ( = ?auto_180636 ?auto_180639 ) ) ( not ( = ?auto_180636 ?auto_180640 ) ) ( not ( = ?auto_180636 ?auto_180641 ) ) ( not ( = ?auto_180636 ?auto_180642 ) ) ( not ( = ?auto_180636 ?auto_180643 ) ) ( not ( = ?auto_180637 ?auto_180638 ) ) ( not ( = ?auto_180637 ?auto_180639 ) ) ( not ( = ?auto_180637 ?auto_180640 ) ) ( not ( = ?auto_180637 ?auto_180641 ) ) ( not ( = ?auto_180637 ?auto_180642 ) ) ( not ( = ?auto_180637 ?auto_180643 ) ) ( not ( = ?auto_180638 ?auto_180639 ) ) ( not ( = ?auto_180638 ?auto_180640 ) ) ( not ( = ?auto_180638 ?auto_180641 ) ) ( not ( = ?auto_180638 ?auto_180642 ) ) ( not ( = ?auto_180638 ?auto_180643 ) ) ( not ( = ?auto_180639 ?auto_180640 ) ) ( not ( = ?auto_180639 ?auto_180641 ) ) ( not ( = ?auto_180639 ?auto_180642 ) ) ( not ( = ?auto_180639 ?auto_180643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180640 ?auto_180641 ?auto_180642 )
      ( MAKE-9CRATE-VERIFY ?auto_180633 ?auto_180634 ?auto_180635 ?auto_180636 ?auto_180637 ?auto_180638 ?auto_180639 ?auto_180640 ?auto_180641 ?auto_180642 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_180742 - SURFACE
      ?auto_180743 - SURFACE
      ?auto_180744 - SURFACE
      ?auto_180745 - SURFACE
      ?auto_180746 - SURFACE
      ?auto_180747 - SURFACE
      ?auto_180748 - SURFACE
      ?auto_180749 - SURFACE
      ?auto_180750 - SURFACE
      ?auto_180751 - SURFACE
    )
    :vars
    (
      ?auto_180754 - HOIST
      ?auto_180757 - PLACE
      ?auto_180753 - PLACE
      ?auto_180755 - HOIST
      ?auto_180756 - SURFACE
      ?auto_180752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180754 ?auto_180757 ) ( IS-CRATE ?auto_180751 ) ( not ( = ?auto_180750 ?auto_180751 ) ) ( not ( = ?auto_180749 ?auto_180750 ) ) ( not ( = ?auto_180749 ?auto_180751 ) ) ( not ( = ?auto_180753 ?auto_180757 ) ) ( HOIST-AT ?auto_180755 ?auto_180753 ) ( not ( = ?auto_180754 ?auto_180755 ) ) ( AVAILABLE ?auto_180755 ) ( SURFACE-AT ?auto_180751 ?auto_180753 ) ( ON ?auto_180751 ?auto_180756 ) ( CLEAR ?auto_180751 ) ( not ( = ?auto_180750 ?auto_180756 ) ) ( not ( = ?auto_180751 ?auto_180756 ) ) ( not ( = ?auto_180749 ?auto_180756 ) ) ( TRUCK-AT ?auto_180752 ?auto_180757 ) ( SURFACE-AT ?auto_180749 ?auto_180757 ) ( CLEAR ?auto_180749 ) ( IS-CRATE ?auto_180750 ) ( AVAILABLE ?auto_180754 ) ( IN ?auto_180750 ?auto_180752 ) ( ON ?auto_180743 ?auto_180742 ) ( ON ?auto_180744 ?auto_180743 ) ( ON ?auto_180745 ?auto_180744 ) ( ON ?auto_180746 ?auto_180745 ) ( ON ?auto_180747 ?auto_180746 ) ( ON ?auto_180748 ?auto_180747 ) ( ON ?auto_180749 ?auto_180748 ) ( not ( = ?auto_180742 ?auto_180743 ) ) ( not ( = ?auto_180742 ?auto_180744 ) ) ( not ( = ?auto_180742 ?auto_180745 ) ) ( not ( = ?auto_180742 ?auto_180746 ) ) ( not ( = ?auto_180742 ?auto_180747 ) ) ( not ( = ?auto_180742 ?auto_180748 ) ) ( not ( = ?auto_180742 ?auto_180749 ) ) ( not ( = ?auto_180742 ?auto_180750 ) ) ( not ( = ?auto_180742 ?auto_180751 ) ) ( not ( = ?auto_180742 ?auto_180756 ) ) ( not ( = ?auto_180743 ?auto_180744 ) ) ( not ( = ?auto_180743 ?auto_180745 ) ) ( not ( = ?auto_180743 ?auto_180746 ) ) ( not ( = ?auto_180743 ?auto_180747 ) ) ( not ( = ?auto_180743 ?auto_180748 ) ) ( not ( = ?auto_180743 ?auto_180749 ) ) ( not ( = ?auto_180743 ?auto_180750 ) ) ( not ( = ?auto_180743 ?auto_180751 ) ) ( not ( = ?auto_180743 ?auto_180756 ) ) ( not ( = ?auto_180744 ?auto_180745 ) ) ( not ( = ?auto_180744 ?auto_180746 ) ) ( not ( = ?auto_180744 ?auto_180747 ) ) ( not ( = ?auto_180744 ?auto_180748 ) ) ( not ( = ?auto_180744 ?auto_180749 ) ) ( not ( = ?auto_180744 ?auto_180750 ) ) ( not ( = ?auto_180744 ?auto_180751 ) ) ( not ( = ?auto_180744 ?auto_180756 ) ) ( not ( = ?auto_180745 ?auto_180746 ) ) ( not ( = ?auto_180745 ?auto_180747 ) ) ( not ( = ?auto_180745 ?auto_180748 ) ) ( not ( = ?auto_180745 ?auto_180749 ) ) ( not ( = ?auto_180745 ?auto_180750 ) ) ( not ( = ?auto_180745 ?auto_180751 ) ) ( not ( = ?auto_180745 ?auto_180756 ) ) ( not ( = ?auto_180746 ?auto_180747 ) ) ( not ( = ?auto_180746 ?auto_180748 ) ) ( not ( = ?auto_180746 ?auto_180749 ) ) ( not ( = ?auto_180746 ?auto_180750 ) ) ( not ( = ?auto_180746 ?auto_180751 ) ) ( not ( = ?auto_180746 ?auto_180756 ) ) ( not ( = ?auto_180747 ?auto_180748 ) ) ( not ( = ?auto_180747 ?auto_180749 ) ) ( not ( = ?auto_180747 ?auto_180750 ) ) ( not ( = ?auto_180747 ?auto_180751 ) ) ( not ( = ?auto_180747 ?auto_180756 ) ) ( not ( = ?auto_180748 ?auto_180749 ) ) ( not ( = ?auto_180748 ?auto_180750 ) ) ( not ( = ?auto_180748 ?auto_180751 ) ) ( not ( = ?auto_180748 ?auto_180756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_180749 ?auto_180750 ?auto_180751 )
      ( MAKE-9CRATE-VERIFY ?auto_180742 ?auto_180743 ?auto_180744 ?auto_180745 ?auto_180746 ?auto_180747 ?auto_180748 ?auto_180749 ?auto_180750 ?auto_180751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185100 - SURFACE
      ?auto_185101 - SURFACE
    )
    :vars
    (
      ?auto_185103 - HOIST
      ?auto_185106 - PLACE
      ?auto_185104 - SURFACE
      ?auto_185108 - TRUCK
      ?auto_185105 - PLACE
      ?auto_185102 - HOIST
      ?auto_185107 - SURFACE
      ?auto_185109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185103 ?auto_185106 ) ( SURFACE-AT ?auto_185100 ?auto_185106 ) ( CLEAR ?auto_185100 ) ( IS-CRATE ?auto_185101 ) ( not ( = ?auto_185100 ?auto_185101 ) ) ( AVAILABLE ?auto_185103 ) ( ON ?auto_185100 ?auto_185104 ) ( not ( = ?auto_185104 ?auto_185100 ) ) ( not ( = ?auto_185104 ?auto_185101 ) ) ( TRUCK-AT ?auto_185108 ?auto_185105 ) ( not ( = ?auto_185105 ?auto_185106 ) ) ( HOIST-AT ?auto_185102 ?auto_185105 ) ( not ( = ?auto_185103 ?auto_185102 ) ) ( SURFACE-AT ?auto_185101 ?auto_185105 ) ( ON ?auto_185101 ?auto_185107 ) ( CLEAR ?auto_185101 ) ( not ( = ?auto_185100 ?auto_185107 ) ) ( not ( = ?auto_185101 ?auto_185107 ) ) ( not ( = ?auto_185104 ?auto_185107 ) ) ( LIFTING ?auto_185102 ?auto_185109 ) ( IS-CRATE ?auto_185109 ) ( not ( = ?auto_185100 ?auto_185109 ) ) ( not ( = ?auto_185101 ?auto_185109 ) ) ( not ( = ?auto_185104 ?auto_185109 ) ) ( not ( = ?auto_185107 ?auto_185109 ) ) )
    :subtasks
    ( ( !LOAD ?auto_185102 ?auto_185109 ?auto_185108 ?auto_185105 )
      ( MAKE-1CRATE ?auto_185100 ?auto_185101 )
      ( MAKE-1CRATE-VERIFY ?auto_185100 ?auto_185101 ) )
  )

)

